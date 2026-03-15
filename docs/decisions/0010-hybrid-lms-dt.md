# 0010 — Hybrid LMS + DT (LMS Pre-Filter)

## Trạng thái: Đã chấp nhận

## Bối cảnh
- Paper 0008 (LMS-Based DVFS) dùng LMS làm predictor chính, đạt 7.59% power saving
- Project này dùng DT Ensemble non-linear, mạnh hơn LMS về modeling
- Đề xuất: **kết hợp cả hai** — LMS làm pre-filter (smooth sensor noise), DT làm classifier chính

## Quyết định
**Hybrid LMS + DT**:
- **LMS**: pre-filter workload trước khi feature engineering (smooth nhiễu, giữ trend)
- **DT**: classifier 10 trees depth=6 (không đổi)
- Labels vẫn dùng **raw workload** (ground truth tương lai không filter)

## Công thức LMS (từ paper 0008)
```
y[n] = W · x[n]   với x = [1, u[n-1], u[n-2]]
e[n] = u[n] - y[n]
W[n+1] = W[n] + µ · e[n] · x[n]
```

## Tham số
- `ENABLE_LMS_FILTER = True`
- `LMS_MU = 0.05` (step size: nhỏ = smooth hơn)
- `LMS_ORDER = 2` (2 taps)

## Luồng dữ liệu
```
workload_raw → LMS filter → workload_smooth → engineer_features → DT
workload_raw ─────────────────────────────────────────────────→ create_labels
```

## Output
- `preprocess_metadata.json`: lưu `lms_filter`, `lms_mu`, `lms_order`
- `model_metrics.json`: `preprocess_config` (train_model đọc metadata)
- `verilog_params.vh`: header comment ghi "Hybrid LMS+DT" nếu dùng

## Hardware note
- LMS chạy **offline** trong pipeline preprocessing (Python)
- RTL hiện tại **chưa implement LMS** — feature engine nhận workload đã smooth
- Future work: implement LMS block trong RTL (input_buffer hoặc feature_engine) nếu cần online filtering
