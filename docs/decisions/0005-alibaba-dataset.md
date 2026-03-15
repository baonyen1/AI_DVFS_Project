# 0005 — Dùng Alibaba Cluster Trace 2018 làm Dataset Chính

## Trạng thái: Đã chấp nhận

## Bối cảnh
- Cần dataset workload thực tế (không synthetic) cho credibility
- Dataset cần có đủ pattern: idle, periodic, bursty, sustained high

## Quyết định
**Alibaba Cluster Trace 2018** qua package `datacentertracesdatasets`:
- CPU utilization % thực tế từ ~4000 máy chủ trong 8 ngày
- stride_seconds=10, lấy 50,000 samples
- Temperature + Power: thêm bằng CMOS physical model (không có trong dataset gốc)

Cite: "Alibaba Cluster Trace Program 2018, Alibaba Group"

## Hậu quả
- ✅ Workload pattern thực tế (production servers)
- ✅ Credible, peer-reviewed trong nhiều paper
- ✅ Dễ download qua pip (1 dòng lệnh)
- ⚠️ Không có temperature/power sensor → phải model
- ⚠️ Báo cáo phải ghi rõ: "CPU workload: real, temperature/power: CMOS model"
