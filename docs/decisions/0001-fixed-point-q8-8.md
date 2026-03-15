# 0001 — Sử dụng Fixed-Point Q8.8 (16-bit) thay vì Float

## Trạng thái: Đã chấp nhận

## Bối cảnh
- FPGA Artix-7 không có FPU (Floating Point Unit) cứng
- Dùng `float` trong Verilog sẽ synthesize thành nhiều DSP48 block (rất tốn tài nguyên)
- Project yêu cầu ≤ 500 LUT toàn system

## Quyết định
Sử dụng **Q8.8 fixed-point** (16-bit signed):
- 8 bit phần nguyên + 8 bit phần thập phân
- Scale factor = 256
- Range: −128.0 đến +127.996
- Precision: 1/256 ≈ 0.0039

Mọi threshold từ Python được convert: `q88 = int(round(float_val × 256))`

## Hậu quả
- ✅ Tiết kiệm ~60% LUT so với float
- ✅ Không cần DSP block cho comparisons
- ✅ EMA alpha=0.25 → shift right 2 bits (zero multiplier)
- ⚠️ Max quantization error: 0.004 → không ảnh hưởng đáng kể đến accuracy
- ⚠️ Cần thêm `$signed()` trong Verilog khi so sánh
