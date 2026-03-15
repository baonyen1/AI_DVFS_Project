# 0003 — Parallel Combinational Tree Evaluation (1 cycle latency)

## Trạng thái: Đã chấp nhận

## Bối cảnh
- Tree traversal tuần tự (sequential): latency = depth = 3 cycles
- Cần DVFS react nhanh nhất có thể

## Quyết định
Evaluate TẤT CẢ node conditions SONG SONG trong 1 combinational block.
Dùng mux chọn leaf dựa trên path bits.

```verilog
wire n0 = ($signed(feat_w) > $signed(THRESH_N0));
wire n1 = ($signed(feat_ema) > $signed(THRESH_N1));
// ... tất cả 7 nodes cùng lúc
wire [2:0] path = {n0, n0?n2:n1, ...};
assign pred = leaf_table[path];  // 1 cycle
```

## Hậu quả
- ✅ Latency từ 3 cycles → 1 cycle
- ✅ Không cần state machine cho traversal
- ⚠️ Slightly higher combinational depth (vẫn trong timing budget 10ns)
- ⚠️ Tất cả comparators active dù chỉ dùng một path → power cao hơn chút
