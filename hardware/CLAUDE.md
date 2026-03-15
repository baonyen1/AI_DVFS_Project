# CLAUDE.md — Hardware Module
> Load file này khi làm việc trong thư mục `hardware/`

---

## Phạm vi module này
Toàn bộ Verilog RTL chạy trên **PL fabric của Zybo Z7-10 (XC7Z010)**:
input buffer → feature engine → AI core → DVFS FSM + AXI4-Lite interface.

---

## Sơ đồ luồng tín hiệu

```
workload_in[15:0] ──┐
temp_in[15:0]     ──┼──▶ input_buffer ──▶ feature_engine ──┐
power_in[15:0]    ──┘         │                             │
                           mean, std                        │
                              │                             ▼
                         anomaly_detector         decision_tree_0 ──┐
                              │                  decision_tree_1 ──┼──▶ voting_arbiter
                              │                  decision_tree_2 ──┘         │
                              │                                               ▼
                              └──────────────────────────────────▶ dvfs_fsm
                                                                        │
                                                              vdd_core_sel[2:0]
                                                              vdd_mem_sel[1:0]
                                                              clk_div_sel[2:0]
                                                              clk_gate_en
                                                              turbo_en
```

---

## Modules & Specs

| Module | File | Latency | LUT est. | FF est. |
|---|---|---|---|---|
| input_buffer | `input_stage/input_buffer.v` | 0 cycle | 50 | 392 |
| feature_engine | `input_stage/feature_engine.v` | 2 cycle | 204 | 490 |
| decision_tree_0..9 | `ai_core/decision_tree_X.v` ×10 | 1 cycle | 5200 | 30 |
| voting_arbiter | `ai_core/voting_arbiter.v` | 1 cycle | 76 | 4 |
| anomaly_detector | `dvfs_ctrl/anomaly_detector.v` | 1 cycle | 28 | 35 |
| dvfs_fsm | `dvfs_ctrl/dvfs_fsm.v` | 1 cycle | 72 | 17 |
| axi_slave | `axi/axi4_lite_slave.v` | 1 cycle | 70 | 229 |
| ai_dvfs_top | `top/ai_dvfs_top.v` | 6 cycle | 20 | 10 |
| **TOTAL** | | | **5,720** | **1,207** |
| **% Zybo Z7-10** | | | **32.5%** | **3.4%** |

---

## Fixed-Point Rules

```verilog
// LUÔN dùng $signed() khi so sánh Q8.8
if ($signed(feat_workload) > $signed(THRESH_N0)) ...

// EMA alpha=0.25 — KHÔNG dùng * operator
ema_new = ema_prev + ($signed(x_in - ema_prev) >>> 2);

// Anomaly 2σ — KHÔNG dùng divider
wire [15:0] deviation = workload_q88 - mean_q88;
wire [15:0] abs_dev   = deviation[15] ? (~deviation + 1) : deviation;
wire [15:0] thresh2s  = std_q88 << 1;   // 2*std = std<<1
wire        anomaly   = (abs_dev > thresh2s);

// Tất cả threshold từ verilog_params.vh — KHÔNG hardcode
`include "common/verilog_params.vh"
```

---

## DVFS FSM State Table

```verilog
localparam DEEP_SLEEP = 3'd0;  // VDD=0.6V, f=/8,  gate=90%
localparam SLEEP      = 3'd1;  // VDD=0.7V, f=/4,  gate=70%
localparam LOW        = 3'd2;  // VDD=0.8V, f=/2,  gate=40%
localparam NOMINAL    = 3'd3;  // VDD=1.0V, f=/1,  gate=10%
localparam HIGH       = 3'd4;  // VDD=1.1V, f=x1.5,gate=0%
localparam TURBO      = 3'd5;  // VDD=1.2V, f=x2,  gate=0%

// Hysteresis: UP transition  hold_cnt ≥ 4
//             DOWN transition hold_cnt ≥ 8
// Anomaly flag → bypass AI → immediate NOMINAL
```

---

## Testbench Pattern chuẩn

```verilog
`timescale 1ns/1ps
// Clock 100MHz (Artix-7 Tclk=10ns)
localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk = ~clk;

// Workload patterns cần test:
// 1. IDLE     : workload = 10%  (40 cycles)
// 2. RAMP_UP  : workload tăng từ 10→90% (20 cycles)
// 3. BURST    : workload = 95%, 10 cycles rồi drop
// 4. THERMAL  : temperature tăng lên 84°C (gần limit)
// 5. ANOMALY  : workload nhảy đột ngột 5%→90% trong 1 cycle

// VCD dump bắt buộc
$dumpfile("waveforms/tb_ten_module.vcd");
$dumpvars(0, tb_ten_module);
```

---

## Tài Nguyên Zybo Z7-10 (XC7Z010)

```
Tổng PL có:   17,600 LUT  |  35,200 FF  |  270KB BRAM  |  80 DSP
```

## Synthesis Targets (AI-DVFS trên Zybo Z7-10)

```
Metric   Target        % dùng      Ghi chú
──────── ─────────────────────────────────────────────────────
LUT    : ≤ 1,500        < 8.5%     an toàn, còn dư 91.5%
FF     : ≤ 300          < 0.9%
BRAM   : 0              0%         dùng distributed RAM
DSP    : 0              0%         dùng shift thay multiply
Fmax   : ≥ 100MHz                  AXI4-Lite PS clock
Power  : < 100mW dynamic           Vivado Power Estimator
```

## LUT Budget (CHỐT: 10 trees, depth=6)

```
Module              LUT     FF      Ghi chú
────────────────────────────────────────────────────────────
Input Buffer         50     392     8×3×16 FF storage
Feature Engine      204     490     10 features, 2-stage pipe
DT Cores ×10       5200      30     10×520 LUT (63 nodes/tree)
Voting Arbiter       76       4     10-input majority
Anomaly Detector     28      35     2σ rule, shift only
DVFS FSM             72      17     6 states + hysteresis
AXI4-Lite Slave      70     229     6 reg × 32-bit
Top (interconnect)   20      10
────────────────────────────────────────────────────────────
TOTAL             5,720   1,207
% Zybo Z7-10      32.5%    3.4%    (17,600 LUT / 35,200 FF)
Còn dư           11,880  33,993
```

## AXI4-Lite Interface (PS ↔ PL)

```
PS (ARM Python) viết sensor data → PL registers
PS (ARM Python) đọc DVFS state  ← PL output

Register map (base address: 0x43C00000 trên Zybo Z7-10):
  0x00 → workload_in  [15:0]   (write từ PS)
  0x04 → temp_in      [15:0]   (write từ PS)
  0x08 → power_in     [15:0]   (write từ PS)
  0x0C → dvfs_state   [2:0]    (read từ PS)
  0x10 → prediction   [1:0]    (read từ PS)
  0x14 → anomaly_flag [0:0]    (read từ PS)
```

## Jupyter Notebook Demo (trên board)

```python
# Chạy trực tiếp trên Zybo Z7-10
from pynq import Overlay, MMIO

ol = Overlay("ai_dvfs.bit")          # load bitstream
mmio = MMIO(0x43C00000, 0x20)        # map registers

# Ghi sensor data
mmio.write(0x00, int(workload * 256))  # Q8.8
mmio.write(0x04, int(temp * 256))
mmio.write(0x08, int(power * 256))

# Đọc kết quả
state = mmio.read(0x0C)
pred  = mmio.read(0x10)
print(f"DVFS State: {state}, Prediction: {pred}")
```
