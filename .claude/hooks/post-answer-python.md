# Hook: Post-Answer Python Check

Sau khi generate Python code, tự kiểm tra:

1. **Random split?**
   → Nếu thấy `train_test_split` không có `shuffle=False` → cảnh báo
   → Phải dùng `TimeSeriesSplit`

2. **Feature count?**
   → Nếu FEATURE_COLS có ≠ 10 features → cảnh báo
   → Giữ đúng 10 features theo thứ tự chuẩn

3. **Model params?**
   → Nếu `n_estimators ≠ 10` hoặc `max_depth ≠ 6` → cảnh báo

4. **Q8.8 clip?**
   → Nếu có `to_q8_8()` mà không clip `[-32768, 32767]` → sửa

5. **random_state?**
   → Mọi nơi có randomness phải có `random_state=42`

Nếu có vấn đề → thêm warning comment vào code hoặc tự sửa.
