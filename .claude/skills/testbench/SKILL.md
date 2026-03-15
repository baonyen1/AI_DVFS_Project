# Kỹ năng: Viết Testbench ModelSim cho AI-DVFS

## Vai trò khi kích hoạt
Bạn là Verification Engineer senior, thành thạo SystemVerilog/Verilog testbench,
self-checking TB và functional coverage cho digital design.

## Câu lệnh kích hoạt
"testbench", "tb", "simulation", "verify", "modelsim", "waveform", "test case"

## Cấu trúc testbench chuẩn

```verilog
`timescale 1ns/1ps
module tb_MODULE_NAME;

// ── Parameters ───────────────────────────────
localparam CLK_PERIOD = 10;  // 100MHz Artix-7

// ── DUT signals ──────────────────────────────
reg  clk, rst_n;
// ... các signal khác

// ── DUT instantiation ────────────────────────
MODULE_NAME #(.DATA_W(16)) dut (
    .clk(clk), .rst_n(rst_n), ...
);

// ── Clock ────────────────────────────────────
initial clk = 0;
always #(CLK_PERIOD/2) clk = ~clk;

// ── Tasks ────────────────────────────────────
task reset_dut;
    rst_n = 0;
    repeat(5) @(posedge clk);
    rst_n = 1;
    @(posedge clk);
endtask

task apply_workload;
    input [15:0] workload_q88;
    input [15:0] temp_q88;
    // apply và wait
endtask

// ── Test cases ───────────────────────────────
integer pass_count = 0, fail_count = 0;

task check;
    input [1:0] got, expected;
    input [63:0] test_id;
    if (got === expected) begin
        pass_count = pass_count + 1;
        $display("[PASS] Test %0d", test_id);
    end else begin
        fail_count = fail_count + 1;
        $display("[FAIL] Test %0d: got=%0d exp=%0d", test_id, got, expected);
    end
endtask

// ── Main ─────────────────────────────────────
initial begin
    $dumpfile("waveforms/tb_MODULE_NAME.vcd");
    $dumpvars(0, tb_MODULE_NAME);

    reset_dut();

    // Test 1: IDLE workload
    // Test 2: MEDIUM workload
    // Test 3: HIGH burst
    // Test 4: Anomaly spike
    // Test 5: Thermal limit

    // Summary
    $display("=== RESULT: %0d PASS / %0d FAIL ===",
             pass_count, fail_count);
    if (fail_count == 0) $display("✅ ALL TESTS PASSED");
    else                 $display("❌ FAILURES DETECTED");
    $finish;
end

endmodule
```

## 5 Test Patterns bắt buộc cho tb_top

| # | Pattern | Workload | Temp | Mục đích |
|---|---|---|---|---|
| 1 | IDLE | 10% (40 cyc) | 42°C | DVFS vào SLEEP/LOW |
| 2 | RAMP | 10→90% (20 cyc) | 55°C | chuyển state mượt |
| 3 | BURST | 5%→95% đột ngột | 60°C | anomaly detect trigger |
| 4 | THERMAL | 80% (20 cyc) | 84°C | thermal headroom gần 0 |
| 5 | SUSTAINED HIGH | 90% (50 cyc) | 75°C | TURBO state & hysteresis |

## Self-checking: DVFS expected output

```verilog
// Sau khi AI predict High (class=2) + hold ≥ 4 cycles:
// expected: state = HIGH hoặc TURBO
// check: vdd_core_sel == 3'b100 (1.1V) hoặc 3'b101 (1.2V)
```
