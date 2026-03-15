# 0007 — Tài Liệu Tham Khảo: AI-Enhanced DVFS Survey

## Trạng thái: Tham khảo

## Nguồn
**Title**: "How can AI enhance DVFS in processor power management?"
**Author**: Jeff Shepard
**Publisher**: Power Electronic Tips
**Date**: January 19, 2024
**URL**: https://www.powerelectronictips.com/how-can-ai-enhance-dvfs-in-processor-power-management/

---

## 3 Hướng tiếp cận trong bài báo

### 1. APOLLO (Duke University / ARM)
- AI xác định 100 tín hiệu quan trọng trong processor
- Xây dựng on-chip power meter (OPM) per-cycle resolution
- R² > 0.94 khi model power consumption ARM Neoverse N1 và Cortex-A77
- Overhead < 1% area/power

**→ Liên hệ project**: Justification cho feature `f8_efficiency`
  (workload/power ratio) = dạng đơn giản hóa của APOLLO power model.
  Cite khi giải thích feature selection.

### 2. Intel Meteor Lake
- AI "self-teaching" anticipate user actions trước khi xảy ra
- Responsiveness HIGH power state: cải thiện **35%**
- Energy savings: **15%** nhờ anticipate LOW power state
- Đây là "anticipatory power management"

**→ Liên hệ project**: Justification cho `PREDICT_HORIZON = 10 cycles`.
  Project dùng predict-ahead thay vì reactive → cùng hướng với Intel.
  Số liệu 15% energy saving → dùng làm baseline so sánh trong báo cáo.

### 3. SmartDPM (American Scientific Publishers)
- Observer stage: lightweight linear predictor + continuous feedback
- Controller stage: 4 VF pairs, optimize voltage/frequency
- Capture sporadic variations ngoài model chuẩn
- Đạt **15% power savings** so với standard DVFS

**→ Liên hệ project**: Kiến trúc 2-stage của project khớp SmartDPM:
  - Feature Engine = Observer stage
  - DVFS FSM      = Controller stage
  - Anomaly Detector = "sporadic variations" handler

---

## Novelty của project so với bài báo

```
Bài báo (3 hướng):   Software-based AI → chạy trên CPU/OS
                      Latency: milliseconds
                      Phụ thuộc OS scheduler
                      Non-deterministic

Project (AI-DVFS):   Hardware AI inference → FPGA PL fabric
                      Latency: 1 cycle (10ns @ 100MHz)
                      Không phụ thuộc OS
                      Deterministic real-time
                      Fixed-point Q8.8 → zero float hardware
```

**→ Đây là đóng góp mới (novelty) cần nhấn mạnh trong Abstract
  và Contribution section của báo cáo.**

---

## Cách trích dẫn trong báo cáo

### Introduction / Motivation
```
"AI-DVFS đã được chứng minh tiết kiệm tới 15% energy
trong cả Intel Meteor Lake [Shepard, 2024] và SmartDPM [cite],
đồng thời cải thiện responsiveness lên 35% [Shepard, 2024]."
```

### Feature Design
```
"Lấy cảm hứng từ APOLLO power modeling framework [Shepard, 2024],
chúng tôi sử dụng f8_efficiency (workload/power ratio) như
một lightweight proxy cho on-chip power estimation."
```

### Architecture
```
"Kiến trúc Observer-Controller tương tự SmartDPM [Shepard, 2024]
được áp dụng: Feature Engine đóng vai observer, DVFS FSM
đóng vai controller. Khác biệt cốt lõi là toàn bộ pipeline
được implement trên FPGA PL fabric với latency 1 cycle."
```

### IEEE Citation format
```
[X] J. Shepard, "How can AI enhance DVFS in processor power
    management?" Power Electronic Tips, Jan. 19, 2024.
    [Online]. Available: https://www.powerelectronictips.com/
    how-can-ai-enhance-dvfs-in-processor-power-management/
```

---

## Papers gốc được cite trong bài báo (nên đọc thêm)

| Paper | Link | Liên quan |
|---|---|---|
| APOLLO framework | https://dl.acm.org/doi/10.1145/3466752.3480064 | Power modeling |
| SmartDPM | https://mason.gmu.edu/~spudukot/Files/JOLPE18.pdf | Observer-Controller |
| Intel Meteor Lake AI | LinkedIn/Lansheng | Anticipatory PM |
