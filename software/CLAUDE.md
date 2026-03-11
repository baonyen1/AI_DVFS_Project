# CLAUDE.md — Software Module
> Load file này khi làm việc trong thư mục `software/`

---

## Phạm vi module này
Toàn bộ Python pipeline: dataset → preprocessing → training → export Verilog params.

---

## Pipeline thứ tự

```
alibaba_pipeline.py          → software/data/processed/features_train.csv
    HOẶC
collect_data_linux.py
+ preprocess_and_features.py → software/data/processed/features_train.csv

train_model.py               → software/models/trained_tree.pkl
                                software/models/model_metrics.json

export_to_verilog.py         → software/outputs/verilog_params.vh
                               (copy sang hardware/rtl/common/)
```

---

## Dataset chuẩn

**Nguồn chính**: Alibaba Cluster Trace 2018
```python
from datacentertracesdatasets import loadtraces
df = loadtraces.get_trace('alibaba2018', 'machine_usage', stride_seconds=10)
# Columns thực: cpu_util_percent, mem_util_percent, disk_io_percent
# Thêm bằng model: temperature, power
```

**Temperature model (AMD laptop)**:
```python
temperature = 38 + 0.32*ema_workload + 0.002*ema_workload**1.5 + noise
```

**Power model (CMOS)**:
```python
power = 3.5 + (workload/100)**1.4 * 38.0 + 0.01*memory
```

---

## 10 Features (thứ tự BẤT BIẾN)

```python
FEATURE_COLS = [
    'f0_workload',     # w[-1]                   — workload hiện tại
    'f1_mean',         # w.mean()                — trung bình 8 samples
    'f2_std',          # w.std()                 — độ lệch chuẩn (anomaly)
    'f3_delta',        # w[-1] - w[-2]           — rate of change
    'f4_trend',        # polyfit slope           — xu hướng tuyến tính
    'f5_ema',          # EMA alpha=0.25          — smoothed workload
    'f6_temperature',  # temp[t]                 — nhiệt độ
    'f7_headroom',     # max(0, 85 - temp[t])   — thermal headroom AMD
    'f8_efficiency',   # w[-1]/(power+0.01)      — hiệu suất
    'f9_short_long',   # w[-3:].mean()-w[:5].mean() — short vs long
]
```

## Labels

```python
LOW_THRESH  = 30   # CPU% < 30  → label 0 (Low)
HIGH_THRESH = 70   # CPU% > 70  → label 2 (High)
                   # 30–70      → label 1 (Medium)
PREDICT_HORIZON = 10  # dự đoán workload 10 samples tới
```

## Fixed-Point Q8.8

```python
def to_q8_8(val: float) -> int:
    """float → 16-bit signed Q8.8 (scale=256)"""
    v = int(round(val * 256))
    return max(-32768, min(32767, v))

# Verify: float_back = q8_8_val / 256.0
# Max quantization error: 1/256 = 0.0039 ← chấp nhận được
```

## Model config

```python
GradientBoostingClassifier(
    n_estimators  = 12,    # khớp hardware: 3 DT cores
    max_depth     = 6,    # khớp hardware: depth=3
    learning_rate = 0.1,
    random_state  = 42
)
# Validation: TimeSeriesSplit(n_splits=5)  — KHÔNG random split
# Target accuracy: ≥ 88%
```
