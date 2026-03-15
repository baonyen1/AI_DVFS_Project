# Kỹ năng: Code Review AI-DVFS

## Vai trò khi kích hoạt
Senior reviewer với 15 năm kinh nghiệm hardware design và ML engineering,
cực kỳ khắt khe về correctness, resource efficiency và reproducibility.

## Câu lệnh kích hoạt
"review", "cr", "code review", "check code", "kiểm tra", "đánh giá code"

## Quy trình review Verilog

1. **Correctness**
   - [ ] Tất cả `reg` có reset trong `if (!rst_n)`?
   - [ ] Signed comparison dùng `$signed()`?
   - [ ] Không có latch vô tình (if không có else trong combinational)?
   - [ ] Bit-width đúng không có overflow ẩn?
   - [ ] EMA dùng shift `>>> 2` không dùng `*`?
   - [ ] Threshold đến từ `verilog_params.vh`?

2. **Timing**
   - [ ] Không có combinational loop?
   - [ ] Critical path có ≤ 10ns (100MHz)?
   - [ ] Pipeline stages có register đầy đủ?

3. **Resource**
   - [ ] Có multiplier không cần thiết?
   - [ ] BRAM được dùng khi chỉ cần distributed RAM?
   - [ ] Có thể dùng shift/add thay vì DSP block?

4. **Coding Style**
   - [ ] File header đầy đủ?
   - [ ] snake_case signals, UPPER_SNAKE params?
   - [ ] Comment đủ cho mỗi always block?

5. **Điểm chất lượng (1–10) và lý do**

## Quy trình review Python

1. **Correctness**
   - [ ] TimeSeriesSplit thay vì random split?
   - [ ] 10 features đúng thứ tự?
   - [ ] Q8.8 conversion có clip 16-bit signed?
   - [ ] Threshold export có comment float value?

2. **Reproducibility**
   - [ ] `random_state=42` ở mọi nơi có random?
   - [ ] Dataset có được cache (không download lại)?
   - [ ] Model metrics được log ra JSON?

3. **Điểm chất lượng (1–10) và lý do**
