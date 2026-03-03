# 🔋 AI-DVFS: Adaptive Power Management với Machine Learning trên FPGA

> Module quản lý công suất động (DVFS) tích hợp AI nhẹ (Decision Tree Ensemble)  
> thiết kế bằng Verilog, mô phỏng trên ModelSim/Vivado, triển khai FPGA Artix-7.

---

## 📌 Thông Tin Dự Án

| Mục | Nội dung |
|---|---|
| **Tên đề tài** | Thiết kế module quản lý công suất động tích hợp AI cho hệ thống FPGA/VLSI |
| **Loại** | Đồ án / Nghiên cứu cá nhân |
| **Công cụ** | Python 3.10+, Verilog-2001, Vivado 2022, ModelSim, Git |
| **FPGA target** | Xilinx Artix-7 (XC7A35T hoặc tương đương) |
| **Ngày bắt đầu** | 2025 |

---

## 🎯 Mục Tiêu

- Train mô hình **Decision Tree Ensemble (3 trees, depth=3)** dự đoán workload 10 cycles tới
- Thiết kế **RTL Verilog** gồm: Input Buffer → Feature Engine → AI Core → DVFS FSM
- Mô phỏng và verify trên **ModelSim**, synthesis trên **Vivado**
- Đánh giá: accuracy, latency (cycles), LUT/FF usage, % tiết kiệm power

---

## 🏗️ Kiến Trúc Hệ Thống

```
[Sensor Interface]
       │
       ▼
[Input Buffer - FIFO 8×16bit]
       │
       ▼
[Feature Engine] ← delta, variance, EMA, headroom
       │
       ├──▶ [DT Core 0 (depth=3)] ──┐
       ├──▶ [DT Core 1 (depth=3)] ──┼──▶ [Voting Arbiter] ──▶ [DVFS FSM]
       └──▶ [DT Core 2 (depth=3)] ──┘                               │
                                                                      ▼
[Anomaly Detector] ──────────────────────────────────▶  [Output: VDD, CLK_DIV, CLK_GATE]
       ▲
[Perf Monitor] ← so sánh predicted vs actual
```

---

## 📁 Cấu Trúc Thư Mục

```
AI_DVFS_Project/
│
├── software/                        # Phase 1: Python ML
│   ├── data/
│   │   ├── raw/                     # CSV dataset gốc
│   │   └── processed/               # Sau preprocessing
│   ├── models/
│   │   ├── trained_tree.pkl
│   │   └── model_metrics.json
│   ├── src/
│   │   ├── dataset_gen.py           # Sinh synthetic + real data
│   │   ├── feature_engineering.py   # Extract 10 features
│   │   ├── train_model.py           # Train + cross-validate
│   │   └── export_to_verilog.py     # Auto-gen verilog_params.vh
│   ├── notebooks/
│   │   └── exploration.ipynb
│   └── outputs/
│       └── verilog_params.vh        # ← AUTO-GENERATED, copy sang hardware/
│
├── hardware/                        # Phase 2: Verilog RTL
│   ├── rtl/
│   │   ├── top/
│   │   │   └── ai_dvfs_top.v
│   │   ├── input_stage/
│   │   │   ├── input_buffer.v
│   │   │   └── feature_engine.v
│   │   ├── ai_core/
│   │   │   ├── decision_tree_0.v
│   │   │   ├── decision_tree_1.v
│   │   │   ├── decision_tree_2.v
│   │   │   └── voting_arbiter.v
│   │   ├── dvfs_ctrl/
│   │   │   ├── dvfs_fsm.v
│   │   │   └── anomaly_detector.v
│   │   └── common/
│   │       └── verilog_params.vh    # Copy từ software/outputs/
│   ├── tb/
│   │   ├── tb_input_buffer.v
│   │   ├── tb_ai_core.v
│   │   ├── tb_dvfs_fsm.v
│   │   └── tb_top.v                 # Full system testbench
│   ├── sim/
│   │   ├── run_sim.tcl
│   │   └── waveforms/
│   └── synth/
│       └── vivado_project/
│
├── docs/
│   ├── block_diagram.drawio
│   ├── timing_diagram.png
│   └── report/
│
├── results/
│   ├── accuracy_report.csv
│   ├── power_comparison.xlsx
│   └── lut_ff_usage.txt
│
├── README.md                        ← File này
└── .gitignore
```

---

## ⚙️ Quyết Định Kiến Trúc (Đã Thống Nhất)

| Quyết định | Giá trị | Lý do |
|---|---|---|
| Số học | Fixed-point **Q8.8** (16-bit) | FPGA không có FPU, tiết kiệm LUT |
| Model | **3 trees, depth=3** | Accuracy cao hơn 1 tree sâu, LUT ít hơn |
| Evaluation | **Parallel combinational** | Latency 1 cycle |
| EMA alpha | **0.25** (shift >>2) | Không cần multiplier |
| Anomaly | **2σ rule** | Chỉ cần adder + shifter |
| FSM states | **6 states** + hysteresis | Tránh chattering |
| Window size | **8 samples** | Cân bằng history vs hardware cost |
| Predict horizon | **10 cycles** | Đủ thời gian voltage settling |
| DVFS domains | **Core + Memory** | Tiết kiệm 30% hơn single domain |

---

## 🛠️ Cài Đặt & Chạy

### Software Phase
```bash
# Clone repo
git clone https://github.com/<username>/AI_DVFS_Project.git
cd AI_DVFS_Project

# Setup Python env
python -m venv venv
source venv/bin/activate          # Linux/Mac
venv\Scripts\activate             # Windows

pip install -r requirements.txt

# Chạy toàn bộ pipeline
cd software/src
python dataset_gen.py             # Bước 1: tạo dataset
python train_model.py             # Bước 2: train + evaluate
python export_to_verilog.py       # Bước 3: xuất params sang Verilog
```

### Hardware Phase (ModelSim)
```tcl
# Trong ModelSim console
do hardware/sim/run_sim.tcl

# Hoặc chạy từng module
vsim tb_top
run -all
```

### Hardware Phase (Vivado)
```tcl
# Vivado Tcl console
open_project hardware/synth/vivado_project/ai_dvfs.xpr
launch_runs impl_1
wait_on_run impl_1
report_utilization
report_power
```

---

## 📊 Kết Quả Mục Tiêu

| Metric | Mục tiêu | Đạt được |
|---|---|---|
| Accuracy (classification) | ≥ 88% | _TBD_ |
| Latency | ≤ 3 cycles | _TBD_ |
| LUT usage | ≤ 500 LUT | _TBD_ |
| FF usage | ≤ 200 FF | _TBD_ |
| Power saving vs static | ≥ 40% | _TBD_ |
| Power saving vs reactive DVFS | ≥ 15% | _TBD_ |

---

## 📝 Quy Tắc Code

### Python
- **Naming:** `snake_case` cho variable/function, `UPPER_CASE` cho constant
- **Docstring:** bắt buộc cho mọi function
- **Format:** `black` formatter, max line = 88

### Verilog
- **Module:** `snake_case` (vd: `input_buffer`, `dvfs_fsm`)
- **Signal:** `snake_case` (vd: `workload_current`, `clk_gate_en`)
- **Parameter:** `UPPER_SNAKE_CASE` (vd: `THRESH_NODE_00`, `WINDOW_SIZE`)
- **Clock:** luôn dùng `clk`; Reset active-low: `rst_n`
- **Comment header:** bắt buộc đầu mỗi file (xem template bên dưới)

```verilog
//================================================
// Module  : ten_module
// Author  : [Tên bạn]
// Date    : YYYY-MM-DD
// Version : v1.0
// Desc    : Mô tả ngắn chức năng module
//================================================
```

### Commit Message
```
[FEAT]  → thêm tính năng mới
[FIX]   → sửa bug
[SIM]   → simulation/testbench
[TRAIN] → ML training related
[DOCS]  → tài liệu
[REFAC] → refactor
[SYNTH] → synthesis/FPGA

Ví dụ:
[FEAT] ai_core: implement parallel 3-tree ensemble
[FIX]  dvfs_fsm: fix hysteresis counter on anomaly reset
[SIM]  tb_top: add bursty + sinusoidal workload test cases
[TRAIN] decision_tree: achieve 91.3% accuracy with 10 features
```

---

## 🧠 Prompt cho Claude (Copy khi cần hỗ trợ)

```
Bạn là Hardware AI Engineer và RTL Designer senior cho dự án AI-DVFS.
Dự án thiết kế module DVFS tích hợp Decision Tree Ensemble trên FPGA Artix-7.

Stack: Python/scikit-learn (SW), Verilog-2001 (HW), Vivado + ModelSim, GitHub.

Kiến trúc đã thống nhất:
- Fixed-point Q8.8 (16-bit), không dùng float
- 3 Decision Trees depth=3, parallel combinational evaluation
- 6-state DVFS FSM với hysteresis, 2 voltage domain (core + mem)
- Anomaly detector dùng 2σ rule
- EMA alpha=0.25 (shift >>2, không dùng multiplier)
- Window = 8 samples, prediction horizon = 10 cycles

Quy tắc code Verilog:
- snake_case cho signal, UPPER_SNAKE_CASE cho parameter
- Luôn có comment header đầy đủ
- Active-low reset: rst_n
- Mọi output có register (không pure wire ở output port top)

Folder: hardware/rtl/ cho source, hardware/tb/ cho testbench.
Giúp tôi: [YÊU CẦU CỤ THỂ]
```

---

## 📚 Tài Liệu Tham Khảo Chính

1. Zhuo et al. (2021) - *A DVFS Design and Simulation Framework Using ML* - IEEE D&T
2. Springer (2024) - *AI Based DVFS for Power Efficient Computing*
3. Huzyuk et al. (2022) - *Low-Power FPGA-Based Binary Decision Tree Accelerators*
4. Pagani et al. (2020) - *ML for Power Management on Multicore: A Survey* - IEEE TCAD
5. SPECpower_ssj2008 - `spec.org/power_ssj2008/results/`

---

## 📄 License

MIT License - Free to use for academic purposes.
