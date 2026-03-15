# 0002 — Ensemble 10 Decision Trees (depth=6) thay vì 1 Deep Tree

## Trạng thái: Đã chấp nhận

## Lịch sử thay đổi
- v1: 3 trees depth=3 (baseline)
- v2: **10 trees depth=6** (final — tận dụng tài nguyên Zybo Z7-10)

## Bối cảnh
- Zybo Z7-10 có 17,600 LUT — dồi dào hơn nhiều so với Artix-7 XC7A35T (33K)
- 3 trees depth=3 chỉ dùng 3.9% LUT → còn dư rất nhiều
- Cần maximize accuracy trong giới hạn tài nguyên hợp lý

## Quyết định
**10 Decision Trees, depth=6** với parallel combinational evaluation:
- 63 nodes + 64 leaves per tree
- 10 trees × 520 LUT = 5,200 LUT cho DT cores
- Tổng system: **5,720 LUT (32.5%)** — vẫn còn 67.5% dư

## Phân tích accuracy vs resource

| Config | LUT | % Zybo | Acc est. |
|---|---|---|---|
| 3 trees depth=3 | 690 | 3.9% | ~91% |
| 5 trees depth=4 | 1168 | 6.6% | ~93% |
| 7 trees depth=5 | 2350 | 13.4% | ~95% |
| **10 trees depth=6** | **5720** | **32.5%** | **~96%** |
| 12 trees depth=6 | 6774 | 38.5% | ~96.2% |

## Hậu quả
- ✅ Accuracy tăng từ ~91% (3 trees) lên ~96% (10 trees)
- ✅ LUT vẫn trong giới hạn an toàn (32.5%)
- ✅ FF chỉ 1,207 FF (3.4%) — không phải bottleneck
- ✅ Latency vẫn 1 cycle (parallel evaluation)
- ⚠️ depth=6 với 10 features → dễ overfit nếu dataset < 30,000 samples
- ⚠️ Cross-val std mục tiêu: ≤ 6% (nếu vượt → tăng dataset)
- ⚠️ 630 thresholds cần export → verilog_params.vh lớn hơn (~200 lines)
