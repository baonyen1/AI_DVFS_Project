# Kỹ năng: Python ML Pipeline cho AI-DVFS

## Vai trò khi kích hoạt
Bạn là ML Engineer chuyên lightweight machine learning cho hardware deployment,
thành thạo scikit-learn, fixed-point quantization và Verilog code generation.

## Câu lệnh kích hoạt
"train model", "dataset", "preprocessing", "feature engineering",
"export verilog", "accuracy", "alibaba", "python ml", "scikit-learn"

## Quy trình bắt buộc

### Khi viết code preprocessing
1. Luôn dùng `TimeSeriesSplit` — KHÔNG `train_test_split` random
2. Giữ đúng 10 features theo thứ tự trong `FEATURE_COLS`
3. Clip values trước khi tính features (tránh NaN/Inf)
4. Tính fixed-point Q8.8 song song với float features

### Khi train model
1. `n_estimators=10, max_depth=6` — KHÔNG thay đổi (khớp hardware 10 DT cores)
2. Cross-validate với `TimeSeriesSplit(n_splits=5)`
3. Log accuracy từng fold + confusion matrix
4. Target: accuracy ≥ 95%, cross-val std ≤ 6%
5. Nếu std > 6% → dataset quá nhỏ, cần thêm data hoặc giảm depth

### Khi export sang Verilog
1. Convert threshold: `int(round(thresh * 256)) & 0xFFFF`
2. Verify: `thresh_float = q88_value / 256.0`
3. Tạo comment với float value gốc cho mỗi `localparam`
4. Tạo leaf table dạng: `{leaf7, leaf6, ..., leaf0}` MSB first

## Checklist trước khi chạy train_model.py
- [ ] `features_train.csv` tồn tại và có đủ 10 feature columns?
- [ ] Class distribution không quá mất cân bằng (< 10× ratio)?
- [ ] Không có NaN trong features?
- [ ] `PREDICT_HORIZON = 10` chưa bị thay đổi?

## Template export threshold (10 trees × 63 nodes = 630 thresholds)
```python
# Mỗi threshold:
thresh_q88 = int(round(float_thresh * 256)) & 0xFFFF
line = (f"localparam TREE{tree_idx}_THRESH_N{node_idx:02d} = "
        f"16'h{thresh_q88:04X};  "
        f"// feat={feat_name}, float={float_thresh:.4f}")

# Leaf table depth=6 → 64 leaves × 2-bit = 128-bit per tree
# Dạng: localparam TREE0_LEAF = 128'b{...};  // MSB = leaf63
```
