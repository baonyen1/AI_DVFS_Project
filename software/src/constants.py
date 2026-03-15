#!/usr/bin/env python3
"""
constants.py - Common constants and helpers for AI-DVFS software stack.

Centralizes feature definitions, class names, DVFS label thresholds,
and Q8.8 fixed-point helpers to keep the rest of the codebase DRY
and consistent between preprocessing, training, and export scripts.
"""

from typing import Sequence

WINDOW_SIZE: int = 8
PREDICT_HORIZON: int = 10

LOW_THRESH: int = 30
HIGH_THRESH: int = 70

FEATURE_COLS: Sequence[str] = (
    "f0_workload",     # w[-1]                   — workload hiện tại
    "f1_mean",         # w.mean()                — trung bình 8 samples
    "f2_std",          # w.std()                 — độ lệch chuẩn (anomaly)
    "f3_delta",        # w[-1] - w[-2]           — rate of change
    "f4_trend",        # polyfit slope           — xu hướng tuyến tính
    "f5_ema",          # EMA alpha=0.25          — smoothed workload
    "f6_temperature",  # temp[t]                 — nhiệt độ
    "f7_headroom",     # max(0, 85 - temp[t])    — thermal headroom AMD
    "f8_efficiency",   # w[-1]/(power+0.01)      — hiệu suất
    "f9_short_long",   # w[-3:].mean()-w[:5].mean() — short vs long
)

CLASS_NAMES: Sequence[str] = ("Low", "Medium", "High")

Q8_8_SCALE: int = 256
Q8_8_MIN: int = -32768
Q8_8_MAX: int = 32767


def to_q8_8(value: float) -> int:
    """
    Convert float to 16-bit signed Q8.8 fixed-point.

    Range: [-128, 127.996] approximately, with scale factor 256.
    """
    scaled = int(round(value * Q8_8_SCALE))
    return max(Q8_8_MIN, min(Q8_8_MAX, scaled))


def class_index_to_name(index: int) -> str:
    """Return human-readable class name for index 0/1/2."""
    if 0 <= index < len(CLASS_NAMES):
        return CLASS_NAMES[index]
    return str(index)

