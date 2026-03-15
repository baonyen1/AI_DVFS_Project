# 0009 — Tài Liệu Tham Khảo: CNN + DVFS SkyNet

## Trạng thái: Tham khảo

## Nguồn
**Title**: "Optimizing Energy Efficiency of CNN-Based Object Detection with Dynamic Voltage and Frequency Scaling"
**Authors**: Jiang Weixiong, Yu Heng, Zhang Jiale, Wu Jiaxuan, Luo Shaobo, Ha Yajun
**Institution**: ShanghaiTech University / University of Nottingham Ningbo China
**Year**: 2020
**DOI**: 10.1088/1674-4926/30/1/014003

---

## Nội dung chính

### DVFS Framework
- **DFS**: MMCM trên PL, scale 20MHz→400MHz, bước 1MHz, thời gian 3µs
- **DVS**: PMBus/I2C qua PS MIO, scale 650mV→850mV, bước 10mV, thời gian 2ms
- **Platform**: Zynq UltraScale+ ZCU104 (Quad A53 + PL)
- **Interface**: AXI4-Lite PS↔PL cho DFS module

### Áp dụng lên SkyNet (DAC-SDC 2019 Champion)
- CNN object detection, 71.9% IoU baseline
- Không mất accuracy: **38% energy efficiency** improvement
- Chấp nhận giảm 0.11% IoU: **47% energy efficiency** improvement
- Power giảm **15%** (12.86W → 10.90W)
- Performance tăng **54%** (23.93 → 37.04 FPS)

### Metric mới: UEE (Unified Energy Efficiency)
```
UEE = (FPS × AverageIoU) / TotalEnergy
```
UEE tăng 106% (không mất accuracy) → 121% (relax accuracy)

---

## So sánh với project AI-DVFS

| Tiêu chí | SkyNet Paper | Project này |
|---|---|---|
| Platform | ZCU104 (Zynq US+) | **Zybo Z7-10 (XC7Z010)** |
| AI role | AI là workload bị quản lý | **AI là controller** |
| DVFS trigger | Timing slack CNN | **ML prediction workload** |
| Controller | Rule-based policy | **DT Ensemble (10 trees)** |
| Anticipatory | ❌ reactive | **✅ 10-cycle ahead** |
| Frequency range | 20–400MHz | clk_div 6 levels |
| Energy saving | 38–47% | Target > 15% |
| Power saving | 15% | Target > 7.59% |
| Fixed-point | ❌ | **✅ Q8.8** |

---

## Điểm kế thừa quan trọng

### 1. MMCM Frequency Scaling via AXI
```
SkyNet dùng MMCM + AXI4-Lite để scale frequency runtime.
Project mình có thể dùng cùng approach:

PS (ARM Jupyter) → AXI → MMCM config → PL clock domain
clk_div_sel[2:0] từ DVFS FSM → PS đọc → set MMCM

Thay vì chỉ output clk_div_sel signal (giả lập),
có thể kết nối thật với MMCM trên Zybo Z7-10.
→ Voltage/frequency scaling THẬT, không chỉ simulation
```

### 2. Power Monitoring qua I2C
```
Zybo Z7-10 có PMIC qua I2C (tương tự ZCU104).
PS (ARM) có thể đọc power consumption thực tế.
→ Đo energy saving THẬT để báo cáo
→ Không cần ước tính từ Vivado Power Estimator
```

### 3. UEE Metric → Adapt cho project
```
SkyNet UEE = (FPS × IoU) / Energy
Mình adapt:
  DVFS_UEE = (Throughput × Accuracy) / Energy
           = (cycles/s × classification_acc) / power_mW
→ Dùng làm comprehensive metric trong báo cáo
```

---

## Cách dùng trong báo cáo

### Related Work
```
"[cite SkyNet] trình bày framework DVFS fine-grained
trên FPGA Zynq, đạt 38% energy efficiency improvement
cho CNN inference bằng cách scale voltage/frequency
theo timing slack. Tuy nhiên, DVFS policy là rule-based,
không có khả năng anticipate workload thay đổi. Project
này bổ sung AI prediction layer — DT Ensemble dự đoán
workload 10 cycles trước — cho phép DVFS chủ động
thay vì phản ứng."
```

### Evaluation
```
"Tương tự [SkyNet], chúng tôi đánh giá hệ thống
theo 3 metrics: energy reduction (%), latency overhead
(cycles), và classification accuracy (%). Ngoài ra,
chúng tôi đề xuất DVFS_UEE tương tự UEE trong [SkyNet]
để đánh giá toàn diện."
```

### Baseline targets
```
Power saving   : > 15% (SkyNet baseline)
Energy saving  : > 22% (FPGA Edge AI paper baseline)
UEE improvement: > 106% (SkyNet baseline) ← ambitious
```

### IEEE Citation
```
[X] J. Weixiong, Y. Heng, Z. Jiale, W. Jiaxuan,
    L. Shaobo, and H. Yajun, "Optimizing Energy
    Efficiency of CNN-Based Object Detection with
    Dynamic Voltage and Frequency Scaling,"
    J. Semicond., vol. 30, no. 1, p. 014003, 2020,
    doi: 10.1088/1674-4926/30/1/014003.
```
