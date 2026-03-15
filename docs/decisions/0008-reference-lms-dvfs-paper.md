# 0008 — Tài Liệu Tham Khảo: LMS-Based DVFS Controller

## Trạng thái: Tham khảo

## Nguồn
**Title**: "AI-Enabled Adaptive DVFS Controller Using LMS-Based Prediction and FSM Logic: FPGA and Real-Time MATLAB Implementation"
**Authors**: Thomas Epsiba NJ, Vimal Rency A, Latha P, Samuel Tensingh
**Publisher**: ITM Web of Conferences, Vol. 82, 01002
**Conference**: ICNEXTS'25
**Year**: 2026
**DOI**: https://doi.org/10.1051/itmconf/20268201002

---

## Nội dung chính

### Kiến trúc đề xuất
- **LMS Predictor**: `y[n] = W·prev + bias`, update `W[n+1] = W[n] + µ·(u[n]-y[n])·prev`
- **FSM Controller**: 3 states (Low/Medium/High), hysteresis T₁=0.08, T₂=0.26, H=±0.02
- **Minimum residency**: 2 cycles, transition latency 1 cycle
- **Interface**: AXI4-Lite compatible, Vivado + HDL Coder

### Kết quả
- RMSE = 0.0218, Accuracy = 97.82%
- Power saving = **7.59%** (3mW → 2.7mW)
- Validate trên MATLAB simulation (**chưa deploy FPGA thật**)
- Dataset: **synthetic** (trace_bursty, trace_heavy, trace_steady — tự tạo)

---

## So sánh với project AI-DVFS

| Tiêu chí | LMS Paper | Project này |
|---|---|---|
| AI algorithm | LMS (linear) | **DT Ensemble (non-linear)** |
| Input features | 1 (workload) | **10 features** |
| FSM states | 3 | **6 states** |
| Hardware thật | ❌ MATLAB only | **✅ Zybo Z7-10** |
| Dataset | Synthetic | **Alibaba 2018 (real)** |
| Power saving | 7.59% | Target > 7.59% |
| Fixed-point | ❌ | **✅ Q8.8** |
| Online learning | ✅ | ❌ (train offline) |

## Điểm yếu của paper này (mình mạnh hơn)

```
1. Synthetic dataset → pattern quá đơn giản, không đại diện
   → Mình: Alibaba 2018 real workload

2. MATLAB simulation only → không có hardware timing thực tế
   → Mình: RTL Verilog + Zybo Z7-10 thật

3. LMS linear → không capture non-linear pattern
   → Mình: DT Ensemble non-linear, 10 features

4. 3 states FSM → granularity thấp
   → Mình: 6 states (DEEP_SLEEP→TURBO) tiết kiệm hơn

5. 1 feature → bỏ qua temperature, power, headroom
   → Mình: f6_temperature + f7_headroom bảo vệ thermal
```

---

## Cách dùng trong báo cáo

### Problem Statement (Introduction)
```
"Các bộ điều khiển DVFS thông thường phụ thuộc vào
ngưỡng cố định, dẫn đến phản ứng chậm với workload
biến động [cite LMS paper]."
```

### Related Work
```
"[cite] đề xuất DVFS controller kết hợp LMS prediction
và FSM hysteresis, tương thích AXI4-Lite, đạt 7.59%
power saving. Tuy nhiên, LMS chỉ capture linear trend
từ 1 feature workload, validate trên synthetic dataset
và MATLAB simulation. Project này mở rộng bằng cách
dùng Decision Tree Ensemble non-linear với 10 features,
train trên Alibaba 2018 real workload và deploy lên
FPGA thật (Zybo Z7-10)."
```

### Baseline target
```
Power saving > 7.59% → để chứng minh DT tốt hơn LMS
```

### IEEE Citation
```
[X] T. E. NJ, V. R. A, L. P, and S. Tensingh,
    "AI-Enabled Adaptive DVFS Controller Using
    LMS-Based Prediction and FSM Logic: FPGA and
    Real-Time MATLAB Implementation," ITM Web Conf.,
    vol. 82, p. 01002, 2026,
    doi: 10.1051/itmconf/20268201002.
```

---

## Ý tưởng có thể kế thừa

```
Từ paper này:
  ✅ FSM hysteresis design (đã implement, 6 states thay vì 3)
  ✅ AXI4-Lite register interface (đã có trong design)
  ✅ Minimum state residency counter (đã có trong DVFS FSM)

Cải tiến thêm (Hybrid LMS + DT):
  Dùng LMS làm pre-filter (smooth sensor noise)
  DT Ensemble làm classifier chính
  → "LMS-filtered DT Ensemble" = novelty mới
  → Cite được paper này trực tiếp
```
