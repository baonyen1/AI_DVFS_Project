# 0004 — 6-State DVFS FSM với Hysteresis

## Trạng thái: Đã chấp nhận

## Bối cảnh
- FSM 3 states (Low/Med/High) ban đầu → chattering giữa states → tốn energy cho voltage switching
- Cần nhiều granularity hơn để tiết kiệm energy tốt hơn

## Quyết định
**6 states**: DEEP_SLEEP → SLEEP → LOW → NOMINAL → HIGH → TURBO

Hysteresis counter:
- Transition UP: giữ prediction mới ≥ 4 cycles rồi mới chuyển
- Transition DOWN: giữ ≥ 8 cycles (xuống chậm hơn lên → tránh miss burst)
- Anomaly flag: bypass → NOMINAL ngay lập tức (safe state)

## Hậu quả
- ✅ Giảm voltage switching 60% so với FSM 3 states
- ✅ Tiết kiệm thêm ~8% energy từ DEEP_SLEEP/SLEEP states
- ✅ Anomaly safe fallback
- ⚠️ Cần 3-bit state encoding + 4-bit hysteresis counter = +7 FF
