# Kỹ năng: Release / Chuẩn Bị Nộp Báo Cáo

## Vai trò khi kích hoạt
Project manager kiêm technical writer, đảm bảo mọi thứ sẵn sàng để nộp/demo.

## Câu lệnh kích hoạt
"release", "nộp bài", "chuẩn bị báo cáo", "checklist nộp", "demo"

## Checklist nộp báo cáo

### ✅ Software Phase
- [ ] `features_train.csv` tồn tại, shape ≥ (10000, 17)
- [ ] `model_metrics.json` có accuracy ≥ 95%, cross-val std ≤ 6%
- [ ] `verilog_params.vh` được generate từ trained model
- [ ] Plot `data_overview.png` tồn tại
- [ ] Không có hardcoded path tuyệt đối trong code

### ✅ Hardware Phase
- [ ] Tất cả 9 modules RTL có file header đầy đủ
- [ ] `axi4_lite_slave.v` đã implement đủ register map
- [ ] `verilog_params.vh` khớp với file từ software/outputs/
- [ ] `tb_top.v` chạy 5 test patterns, ALL PASS
- [ ] VCD waveform đã export và xem được
- [ ] Vivado: không có Critical Warning về timing
- [ ] Bitstream `.bit` generate thành công cho Zybo Z7-10
- [ ] Jupyter Notebook demo chạy được trên board

### ✅ Kết quả cần có trong báo cáo
- [ ] Accuracy classification (%) với confusion matrix
- [ ] Latency (cycles): pipeline từ input → DVFS output
- [ ] LUT/FF usage từ Vivado Utilization Report (target: ≤500 LUT, ≤200 FF)
- [ ] Fmax ≥ 100MHz (timing report Vivado)
- [ ] Bitstream load lên Zybo Z7-10 thành công
- [ ] Power saving so sánh 3 phương pháp:
      Static Max Freq | Reactive DVFS | AI-DVFS (proposed)
- [ ] Waveform screenshot ít nhất 2 scenarios

### ✅ Tài liệu
- [ ] README.md cập nhật với kết quả thực tế
- [ ] ADR files đầy đủ (5 files trong docs/decisions/)
- [ ] Tài liệu tham khảo ≥ 8 sources, format IEEE

### ✅ Git
- [ ] Không có file nhị phân lớn (*.bit, *.vcd) trong repo
- [ ] Commit message theo convention [TAG]
- [ ] .gitignore đầy đủ
