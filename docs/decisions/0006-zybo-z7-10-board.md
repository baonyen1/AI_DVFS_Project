# 0006 — Sử dụng Zybo Z7-10 (XC7Z010) làm FPGA Target

## Trạng thái: Đã chấp nhận

## Thông số Zybo Z7-10

| Thông số | Giá trị |
|---|---|
| Chip | Xilinx Zynq-7000 **XC7Z010-1CLG400C** |
| LUT | **17,600** |
| FF | **35,200** |
| BRAM | **270 KB** |
| DSP Slices | **80** |
| PS | ARM Cortex-A9 dual-core 650MHz |
| RAM | 512MB DDR3 |
| Vivado | WebPACK (free) |

## Quyết định
- **PL fabric**: 10 DT cores + DVFS FSM + AXI4-Lite (Verilog RTL)
- **PS (ARM)**: Jupyter Notebook demo, ghi sensor qua AXI4-Lite

## Resource usage với config 10 trees depth=6

```
Module              LUT      FF
──────────────────────────────────
Input Buffer          50     392
Feature Engine       204     490
DT Cores ×10        5200      30
Voting Arbiter         76       4
Anomaly Detector       28      35
DVFS FSM               72      17
AXI4-Lite Slave        70     229
Top                    20      10
──────────────────────────────────
TOTAL               5,720   1,207
% Zybo Z7-10        32.5%    3.4%
Còn dư             11,880  33,993
```

## Hậu quả
- ✅ Vivado WebPACK free hỗ trợ đầy đủ XC7Z010
- ✅ Đủ tài nguyên cho 10 trees depth=6 (32.5% LUT)
- ✅ ARM dual-core cho Jupyter Notebook demo qua Ethernet
- ✅ HDMI Output, Ethernet, USB có sẵn trên board
- ⚠️ Ít LUT hơn Z7-20 → không thể vượt quá 12 trees depth=6
- ⚠️ Không có heatsink → tránh design switching nặng liên tục
