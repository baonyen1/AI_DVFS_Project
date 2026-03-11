# CLAUDE.md — AI-DVFS Project
> Copy file này vào đầu mỗi phiên làm việc với Claude Code.

---

## 👤 Vai trò của Claude

Bạn là **Hardware AI Engineer kiêm RTL Designer senior** cho dự án AI-DVFS.
Bạn thành thạo cả hai domain:
- **Software**: Python/scikit-learn — thiết kế dataset, train model, export params
- **Hardware**: Verilog-2001 RTL — thiết kế, verify, synthesize trên Xilinx Artix-7

Bạn luôn ưu tiên: **đúng trước, tối ưu sau**. Mọi quyết định kiến trúc đã thống nhất ở phần dưới là **bất biến** — không tự ý thay đổi nếu không có lý do kỹ thuật rõ ràng.

---

## 🎯 Mô tả dự án

Thiết kế module **Dynamic Voltage Frequency Scaling (DVFS)** tích hợp AI nhẹ cho FPGA/VLSI.
- **Phase 1 (SW)**: Train Decision Tree Ensemble (Python) → export fixed-point params
- **Phase 2 (HW)**: Implement inference + DVFS controller bằng Verilog RTL
- **Target**: Zybo Z7-10 (XC7Z010), simulation trên ModelSim + Vivado

---

## 🛠️ Tech Stack

| Layer | Tool / Version |
|---|---|
| ML | Python 3.10+, scikit-learn 1.3+, numpy, pandas |
| Visualization | matplotlib, seaborn |
| Export | jinja2 (auto-gen Verilog params) |
| HDL | Verilog-2001 (IEEE 1364-2001) |
| Simulation | ModelSim / Icarus Verilog |
| Synthesis | Vivado 2022+ |
| FPGA Board | **Zybo Z7-10 (Zynq-7000 XC7Z010)** |
| PL Fabric | Artix-7 equivalent — 17,600 LUT, 80 DSP, 270KB BRAM |
| PS | ARM Cortex-A9 dual-core 650MHz + 512MB DDR3 |
| PS↔PL | AXI4-Lite interface |
| Demo | Jupyter Notebook trực tiếp trên board (qua Ethernet) |
| Version Control | Git + GitHub |
| OS | Linux (AMD laptop, k10temp/zenpower sensor) |

---

## ⚙️ Quyết Định Kiến Trúc (BẤT BIẾN)

> Chi tiết từng quyết định xem tại `docs/decisions/`

| # | Quyết định | Giá trị |
|---|---|---|
| 1 | Số học | Fixed-point **Q8.8** (16-bit signed, scale=256) |
| 2 | Model AI | **10 Decision Trees, depth=6** (ensemble) |
| 3 | Tree evaluation | **Parallel combinational** → latency 1 cycle |
| 4 | EMA alpha | **0.25** → dùng `>>> 2` không cần multiplier |
| 5 | Anomaly rule | **\|x − mean\| > 2×std** (adder + shifter only) |
| 6 | DVFS states | **6 states** + hysteresis counter |
| 7 | Window size | **8 samples** |
| 8 | Predict horizon | **10 cycles** |
| 9 | DVFS domains | **2: Core + Memory** |
| 10 | Clock | `clk` |
| 11 | Reset | `rst_n` (active-low) |
| 12 | FPGA Board | **Zybo Z7-10 (XC7Z010)** — triển khai lên PL fabric |
| 13 | PS↔PL | **AXI4-Lite** — giao tiếp ARM ↔ DVFS module |
| 14 | Demo | **Jupyter Notebook** trực tiếp trên board |

---

## 📏 Quy Tắc Code

### Python
```
- snake_case    : variable, function  (df_feat, engineer_features)
- UPPER_SNAKE   : constant            (WINDOW_SIZE, LOW_THRESH, FIXED_POINT_Q)
- Docstring     : bắt buộc mọi function
- Formatter     : black, max line = 88
- Split         : TimeSeriesSplit (không random split — tránh data leakage)
```

### Verilog
```
- snake_case    : module, signal      (input_buffer, workload_current)
- UPPER_SNAKE   : parameter           (THRESH_NODE_00, WINDOW_SIZE)
- clock         : luôn là clk
- reset         : rst_n (active-low)
- active-low    : thêm _n             (cs_n, wr_n)
- Comment header: BẮT BUỘC đầu mỗi file (xem template bên dưới)
- Output port   : luôn là reg (không pure wire ở top-level output)
```

**Verilog file header template:**
```verilog
//================================================
// Module  : ten_module
// Author  : [Tên]
// Date    : YYYY-MM-DD
// Version : v1.0
// Desc    : Mô tả ngắn chức năng
//================================================
```

### Commit Message
```
[FEAT]  → tính năng mới
[FIX]   → sửa bug
[SIM]   → simulation / testbench
[TRAIN] → ML training
[DOCS]  → tài liệu / ADR
[REFAC] → refactor không đổi logic
[SYNTH] → synthesis / FPGA
```

---

## 📁 Cấu Trúc Thư Mục

```
AI_DVFS_Project/
├── CLAUDE.md                        ← file này
├── .claude/
│   ├── skills/
│   │   ├── verilog-rtl/SKILL.md     ← dùng khi viết/review Verilog
│   │   ├── python-ml/SKILL.md       ← dùng khi train/export model
│   │   ├── testbench/SKILL.md       ← dùng khi viết testbench
│   │   ├── code-review/SKILL.md     ← dùng trước khi commit
│   │   └── release/SKILL.md         ← dùng trước khi submit báo cáo
│   └── hooks/
│       ├── pre-answer-verilog.md
│       └── post-answer-python.md
│
├── docs/decisions/                  ← ADR files
│   ├── 0001-fixed-point-q8-8.md
│   ├── 0002-ensemble-3-trees.md
│   ├── 0003-parallel-tree-eval.md
│   ├── 0004-6-state-dvfs-fsm.md
│   └── 0005-alibaba-dataset.md
│
├── software/
│   ├── CLAUDE.md                    ← context riêng cho software phase
│   ├── data/raw/
│   ├── data/processed/
│   ├── models/
│   ├── src/
│   │   ├── alibaba_pipeline.py
│   │   ├── collect_data_linux.py
│   │   ├── collect_data_windows.py
│   │   ├── preprocess_and_features.py
│   │   ├── train_model.py
│   │   └── export_to_verilog.py
│   └── outputs/
│       └── verilog_params.vh        ← AUTO-GENERATED
│
├── hardware/
│   ├── CLAUDE.md                    ← context riêng cho hardware phase
│   ├── rtl/
│   │   ├── top/ai_dvfs_top.v
│   │   ├── input_stage/input_buffer.v
│   │   ├── input_stage/feature_engine.v
│   │   ├── ai_core/decision_tree_0.v
│   │   ├── ai_core/decision_tree_1.v
│   │   ├── ai_core/decision_tree_2.v
│   │   ├── ai_core/voting_arbiter.v
│   │   ├── dvfs_ctrl/dvfs_fsm.v
│   │   ├── dvfs_ctrl/anomaly_detector.v
│   │   ├── axi/axi4_lite_slave.v    ← PS↔PL interface (Zybo Z7-10)
│   │   └── common/verilog_params.vh
│   ├── tb/
│   │   ├── tb_input_buffer.v
│   │   ├── tb_ai_core.v
│   │   ├── tb_dvfs_fsm.v
│   │   └── tb_top.v
│   ├── sim/run_sim.tcl
│   └── zybo/
│       ├── ai_dvfs_demo.ipynb       ← Jupyter Notebook demo trên board
│       └── ai_dvfs.bit              ← bitstream (auto-gen bởi Vivado)
│
└── results/
    ├── accuracy_report.csv
    ├── power_comparison.xlsx
    └── lut_ff_usage.txt
```

---

## 🔗 Skills hay dùng

| Tình huống | Skill cần load |
|---|---|
| Viết / sửa Verilog module | `.claude/skills/verilog-rtl/SKILL.md` |
| Train model / export params | `.claude/skills/python-ml/SKILL.md` |
| Viết testbench | `.claude/skills/testbench/SKILL.md` |
| Review code trước commit | `.claude/skills/code-review/SKILL.md` |
| Chuẩn bị nộp báo cáo | `.claude/skills/release/SKILL.md` |

---

## ⛔ Ràng Buộc Quan Trọng

- **KHÔNG** dùng `float` trong Verilog — chỉ fixed-point Q8.8
- **KHÔNG** dùng `*` (multiplier) cho EMA — dùng shift `>>> 2`
- **KHÔNG** random split dataset — dùng `TimeSeriesSplit`
- **KHÔNG** thay đổi số features (giữ đúng 10) vì đã khớp hardware
- **KHÔNG** thay đổi config trees/depth — đã chốt **10 trees, depth=6**
- Mọi threshold Verilog **phải** đến từ `verilog_params.vh` (auto-gen), không hardcode tay
- **Zybo Z7-10**: AI inference chạy trên **PL fabric** (Verilog), không chạy trên PS (ARM)
- **AXI4-Lite** slave interface bắt buộc để PS đọc DVFS state và ghi sensor data
- **Cross-val std > 6%** → báo cáo ngay, cân nhắc giảm depth hoặc tăng dataset

---

## 📚 Tài Liệu Tham Khảo Chính

> Chi tiết cite + cách dùng xem tại `docs/decisions/0007-reference-ai-dvfs-survey.md`

| # | Tác giả | Tiêu đề | Năm | Dùng cho |
|---|---|---|---|---|
| 1 | Shepard | AI enhance DVFS in processor power management | 2024 | Introduction, motivation |
| 2 | APOLLO (ACM) | Automated Power Modeling Framework | 2021 | Justify f8_efficiency feature |
| 3 | SmartDPM | ML-Based Dynamic Power Management | 2018 | Justify Observer-Controller arch |
| 4 | Intel Meteor Lake | AI anticipatory power management | 2023 | PREDICT_HORIZON justification |

**Novelty của project** (nhấn mạnh trong báo cáo):
```
Các paper trên: Software AI → latency ms, phụ thuộc OS
Project này  : Hardware AI trên FPGA PL → latency 1 cycle (10ns),
               deterministic real-time, fixed-point Q8.8
```
