# Hook: Pre-Answer Verilog Check

Trước khi trả lời bất kỳ câu hỏi nào liên quan đến Verilog,
tự kiểm tra xem response có vi phạm các rule sau không:

## Checklist tự động (chạy trong đầu trước khi output)

1. **Float trong Verilog?**
   → KHÔNG được dùng `real`, `float`, số thập phân trong RTL
   → Chỉ dùng fixed-point Q8.8

2. **Multiplier cho EMA?**
   → KHÔNG được dùng `*` cho EMA
   → Phải dùng `>>> 2` (arithmetic shift right)

3. **Unsigned comparison cho Q8.8?**
   → KHÔNG được `if (a > b)` khi a,b là Q8.8 signed
   → Phải dùng `if ($signed(a) > $signed(b))`

4. **Hardcode threshold?**
   → KHÔNG được `if (workload > 16'h1E80)` trong module
   → Phải dùng `if ($signed(workload) > $signed(THRESH_N0))`
   → Threshold đến từ `verilog_params.vh`

5. **Pure wire output port?**
   → Output port của module phải là `reg`
   → `output reg [1:0] prediction_out`

Nếu response vi phạm bất kỳ rule nào → tự sửa trước khi output.
