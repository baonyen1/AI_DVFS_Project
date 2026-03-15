#!/usr/bin/env python3
"""
preprocess_and_features.py - Feature engineering cho AI-DVFS.

Input:
    software/data/processed/alibaba_dataset.csv

Output (chính):
    data/processed/features_train.csv
    data/processed/preprocess_metadata.json

10 features (thứ tự BẤT BIẾN, định nghĩa tại constants.FEATURE_COLS):
    - f0_workload, f1_mean, f2_std, f3_delta, f4_trend
    - f5_ema, f6_temperature, f7_headroom, f8_efficiency, f9_short_long
"""

import json
import os

import numpy as np
import pandas as pd

from constants import (
    FEATURE_COLS,
    HIGH_THRESH,
    LOW_THRESH,
    PREDICT_HORIZON,
    WINDOW_SIZE,
    CLASS_NAMES,
    to_q8_8,
)

# ── Adaptive Horizon (Intel Meteor Lake inspired) ──────────────────────────
# Ý tưởng: horizon ngắn khi workload biến động nhanh (react kịp)
#           horizon dài khi workload ổn định (tiết kiệm điện tốt hơn)

# Mode A: 3 mức cố định
HORIZON_SHORT  = 5          # workload đang tăng nhanh → predict gần
HORIZON_MID    = 10         # default
HORIZON_LONG   = 15         # workload ổn định → predict xa

DELTA_FAST_THRESH = 10.0    # |delta| > 10% → "biến động nhanh"
STD_STABLE_THRESH =  3.0    # std < 3%      → "ổn định"

# Mode B: continuous (công thức tuyến tính theo std)
HORIZON_MIN = 5
HORIZON_MAX = 15
STD_MAX_EXPECTED = 20.0     # std tối đa kỳ vọng trong dataset

# ── Hybrid LMS + DT (paper 0008: LMS as pre-filter) ─────────────────────────
ENABLE_LMS_FILTER = True    # LMS smooth workload trước feature engineering
LMS_MU = 0.05               # step size: nhỏ = smooth hơn, lớn = track nhanh hơn
LMS_ORDER = 2               # 2 taps: predict từ u[n-1], u[n-2]

def lms_filter(workload, mu=LMS_MU, order=LMS_ORDER):
    """
    LMS adaptive filter: smooth sensor noise trước khi đưa vào DT.

    Công thức từ paper 0008 (LMS-Based DVFS):
      y[n] = W · x[n]   với x = [1, u[n-1], u[n-2], ...]
      e[n] = u[n] - y[n]
      W[n+1] = W[n] + µ · e[n] · x[n]

    Output y[n] là estimate "denoised" của u[n]. Dùng cho workload trước
    feature engineering để giảm nhiễu, DT vẫn capture non-linear pattern.

    Args:
        u: 1D array workload (raw)
        mu: LMS step size (0.01–0.1)
        order: số tap (1 hoặc 2)
    Returns:
        y: 1D array workload đã LMS-filtered
    """
    n_samples = len(workload)
    if n_samples == 0:
        return workload

    y = np.zeros(n_samples)
    order = min(order, n_samples - 1)
    # W = [bias, w1, w2] cho order=2
    n_weights = order + 1
    weights = np.zeros(n_weights)
    if n_weights > 1:
        weights[1] = 1.0  # ban đầu predict y ≈ u[n-1]

    for i in range(n_samples):
        if i < order:
            y[i] = workload[i]  # warm-up
            continue
        x = np.ones(n_weights)
        for j in range(1, n_weights):
            x[j] = workload[i - j]
        y[i] = np.dot(weights, x)
        error = workload[i] - y[i]
        weights = weights + mu * error * x

    return y


def load_raw_data(input_path='software/data/processed/alibaba_dataset.csv'):
    """Load raw dataset từ Alibaba trace."""
    df = pd.read_csv(input_path)
    print(f"[INFO] Loaded {len(df)} samples from {input_path}")
    return df


def engineer_features(workload, temperature, power):
    """
    Engineer 10 features từ workload time series.

    Input: workload, temperature, power arrays (1D)
    Output: DataFrame với 10 features
    """
    n = len(workload)
    n_features = n - WINDOW_SIZE

    features = np.zeros((n_features, len(FEATURE_COLS)))

    for i in range(n_features):
        window = workload[i : i + WINDOW_SIZE]

        # f0: current workload (w[-1])
        features[i, 0] = window[-1]

        # f1: mean
        features[i, 1] = np.mean(window)

        # f2: std
        features[i, 2] = np.std(window)

        # f3: delta (w[-1] - w[-2])
        features[i, 3] = window[-1] - window[-2] if len(window) >= 2 else 0

        # f4: trend (polyfit slope)
        if len(window) >= 2:
            coeffs = np.polyfit(np.arange(len(window)), window, 1)
            features[i, 4] = coeffs[0]
        else:
            features[i, 4] = 0

        # f5: EMA (alpha=0.25)
        ema = pd.Series(window).ewm(alpha=0.25).mean().iloc[-1]
        features[i, 5] = ema

        # f6: temperature (at end of window)
        features[i, 6] = temperature[i + WINDOW_SIZE - 1]

        # f7: headroom (max(0, 85 - temp))
        features[i, 7] = max(0, 85 - temperature[i + WINDOW_SIZE - 1])

        # f8: efficiency (w[-1] / (power + 0.01))
        power_sample = power[i + WINDOW_SIZE - 1]
        features[i, 8] = window[-1] / (power_sample + 0.01)

        # f9: short vs long term (w[-3:].mean() - w[:5].mean())
        short_term = np.mean(window[-3:]) if len(window) >= 3 else np.mean(window)
        long_term = np.mean(window[:5]) if len(window) >= 5 else np.mean(window)
        features[i, 9] = short_term - long_term

    # Create DataFrame
    df_features = pd.DataFrame(features, columns=FEATURE_COLS)

    return df_features


def adaptive_horizon_3level(delta, std):
    """
    Mode A: 3 mức horizon cố định.

    Logic (Intel Meteor Lake inspired):
      - Workload tăng nhanh (|delta| lớn) → horizon ngắn → react kịp burst
      - Workload ổn định (std nhỏ)        → horizon dài → tiết kiệm điện
      - Còn lại                           → horizon trung bình

    Args:
        delta: f3_delta = w[-1] - w[-2]  (rate of change)
        std:   f2_std   = std của window  (stability)
    Returns:
        horizon (int): 5, 10, hoặc 15
    """
    if abs(delta) > DELTA_FAST_THRESH:
        return HORIZON_SHORT   # 5 — đang biến động mạnh
    elif std < STD_STABLE_THRESH:
        return HORIZON_LONG    # 15 — đang ổn định
    else:
        return HORIZON_MID     # 10 — trung bình


def adaptive_horizon_continuous(std):
    """
    Mode B: Horizon liên tục theo std (tuyến tính ngược).

    std cao (bất ổn) → horizon ngắn → react nhanh
    std thấp (ổn định) → horizon dài → tiết kiệm điện

    Args:
        std: f2_std của window
    Returns:
        horizon (int): HORIZON_MIN → HORIZON_MAX
    """
    std_clipped = np.clip(std, 0, STD_MAX_EXPECTED)
    # std=0    → horizon=15 (max, ổn định nhất)
    # std=20   → horizon=5  (min, bất ổn nhất)
    ratio = 1.0 - (std_clipped / STD_MAX_EXPECTED)
    horizon = HORIZON_MIN + ratio * (HORIZON_MAX - HORIZON_MIN)
    return int(round(horizon))


def create_labels(workload, horizon=PREDICT_HORIZON,
                  low_thresh=LOW_THRESH, high_thresh=HIGH_THRESH):
    """
    Tạo labels cho classification.

    Label dựa trên workload tương lai (horizon samples ahead):
    - 0 (Low): workload < 30
    - 1 (Medium): 30 <= workload <= 70
    - 2 (High): workload > 70
    """
    n = len(workload) - horizon
    labels = np.zeros(n, dtype=int)
    label_names = []

    for i in range(n):
        future_workload = workload[i + horizon]

        if future_workload < low_thresh:
            labels[i] = 0  # Low
            label_names.append('Low')
        elif future_workload > high_thresh:
            labels[i] = 2  # High
            label_names.append('High')
        else:
            labels[i] = 1  # Medium
            label_names.append('Medium')

    return labels, label_names


def create_labels_adaptive(workload, df_features,
                           mode='3level',
                           low_thresh=LOW_THRESH,
                           high_thresh=HIGH_THRESH):
    """
    Tạo labels với ADAPTIVE HORIZON (Intel Meteor Lake inspired).

    Thay vì horizon cố định 10 cycles, horizon thay đổi theo
    từng timestep dựa trên f3_delta và f2_std của window đó.

    Args:
        workload   : mảng workload gốc
        df_features: DataFrame features (cần f2_std, f3_delta)
        mode       : '3level' (Mode A) hoặc 'continuous' (Mode B)
        low_thresh : ngưỡng Low class
        high_thresh: ngưỡng High class
    Returns:
        labels      : array int (0/1/2)
        label_names : list string
        horizons    : array int — horizon đã dùng cho từng sample
    """
    n = len(df_features)
    labels      = np.zeros(n, dtype=int)
    label_names = []
    horizons    = np.zeros(n, dtype=int)

    delta_arr = df_features['f3_delta'].values
    std_arr   = df_features['f2_std'].values

    # offset: df_features[i] tương ứng workload[i + WINDOW_SIZE - 1]
    workload_offset = WINDOW_SIZE - 1

    for i in range(n):
        delta = delta_arr[i]
        std   = std_arr[i]

        # Tính horizon cho timestep này
        if mode == '3level':
            h = adaptive_horizon_3level(delta, std)
        else:  # continuous
            h = adaptive_horizon_continuous(std)

        # Index workload tương lai
        future_idx = i + workload_offset + h
        if future_idx >= len(workload):
            # Không đủ data phía trước → dùng horizon mặc định
            future_idx = min(i + workload_offset + HORIZON_MID,
                             len(workload) - 1)

        future_workload = workload[future_idx]
        horizons[i] = h

        if future_workload < low_thresh:
            labels[i] = 0
            label_names.append('Low')
        elif future_workload > high_thresh:
            labels[i] = 2
            label_names.append('High')
        else:
            labels[i] = 1
            label_names.append('Medium')

    return labels, label_names, horizons


def export_fixed_point_features(df_features, output_path):
    """Export features dưới dạng Q8.8 fixed-point."""
    df_q = df_features.copy()
    for col in df_q.columns:
        df_q[col] = df_q[col].apply(to_q8_8)
    df_q.to_csv(output_path, index=False)
    print(f"[INFO] Fixed-point features saved to {output_path}")
    return df_q


def print_label_distribution(labels, title):
    """In phân phối label ra màn hình."""
    print(f"\n  [{title}]")
    unique, counts = np.unique(labels, return_counts=True)
    for cls, count in zip(unique, counts):
        class_name = CLASS_NAMES[cls] if 0 <= cls < len(CLASS_NAMES) else str(cls)
        percentage = 100 * count / len(labels)
        print(f"    {class_name}: {count} ({percentage:.1f}%)")


def imbalance_score(labels):
    """Tính mức mất cân bằng class: max_count / min_count, càng nhỏ càng tốt."""
    _, counts = np.unique(labels, return_counts=True)
    if len(counts) == 0:
        return 0.0
    return float(counts.max()) / float(counts.min())


def select_best_label_mode(labels_fixed, labels_3lvl, labels_cont):
    """Chọn mode label có imbalance_score thấp nhất."""
    scores = {
        'fixed': imbalance_score(labels_fixed),
        '3level': imbalance_score(labels_3lvl),
        'continuous': imbalance_score(labels_cont),
    }
    print("\n  Imbalance scores (max/min ratio, thấp hơn = tốt hơn):")
    for mode_name, score in scores.items():
        marker = " ← BEST" if score == min(scores.values()) else ""
        print(f"    {mode_name:12s}: {score:.2f}{marker}")
    best_mode = min(scores, key=scores.get)
    print(f"\n  → Dùng mode: [{best_mode}] để export")
    return best_mode


def save_all_modes(
    df_features,
    min_len,
    label_map,
    horizons_best,
    best_mode,
):
    """Save main output, Q8.8 version và 3 file so sánh mode."""
    print("\n[4/4] Saving outputs...")

    df_out = df_features.iloc[:min_len].copy().reset_index(drop=True)
    labels_best, names_best, _ = label_map[best_mode]
    df_out["label"] = labels_best
    df_out["label_name"] = names_best
    if horizons_best is not None:
        df_out["horizon_used"] = horizons_best

    # Save features_train.csv (mode tốt nhất)
    out_path = "data/processed/features_train.csv"
    meta_path = "data/processed/preprocess_metadata.json"
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    df_out.to_csv(out_path, index=False)
    print(f"[INFO] Features saved to {out_path}")

    # Save metadata (LMS config, label mode) — train_model/export có thể đọc
    preprocess_meta = {
        "lms_filter": ENABLE_LMS_FILTER,
        "lms_mu": LMS_MU,
        "lms_order": LMS_ORDER,
        "best_label_mode": best_mode,
    }
    with open(meta_path, "w") as file:
        json.dump(preprocess_meta, file, indent=2)
    print(f"[INFO] Preprocess metadata saved to {meta_path}")

    # Save Q8.8 fixed-point
    df_q = df_out[list(FEATURE_COLS)].copy()
    for col in df_q.columns:
        df_q[col] = df_q[col].apply(to_q8_8)
    q88_path = "data/processed/features_train_q8_8.csv"
    df_q.to_csv(q88_path, index=False)
    print(f"[INFO] Q8.8 features saved to {q88_path}")

    # Save tất cả 3 mode để so sánh
    for mode_name, (labels, names, horizons) in label_map.items():
        df_mode = df_features.iloc[:min_len].copy().reset_index(drop=True)
        df_mode["label"] = labels
        df_mode["label_name"] = names
        if horizons is not None:
            df_mode["horizon_used"] = horizons
        path = f"software/data/processed/features_{mode_name}.csv"
        df_mode.to_csv(path, index=False)
    print("[INFO] All 3 mode CSVs saved to data/processed/")

    return df_out


def main():
    print("=" * 60)
    print("Feature Engineering Pipeline - AI-DVFS")
    print("=" * 60)

    # Load raw data
    print("\n[1/4] Loading raw dataset...")
    df = load_raw_data()

    workload_raw = df["workload"].values
    temperature = df["temperature"].values
    power = df["power"].values

    # LMS pre-filter (Hybrid LMS+DT — paper 0008)
    if ENABLE_LMS_FILTER:
        print(f"\n[1b] LMS pre-filter (µ={LMS_MU}, order={LMS_ORDER})...")
        workload = lms_filter(workload_raw, mu=LMS_MU, order=LMS_ORDER)
        print("       Workload smoothed, then used for features")
    else:
        workload = workload_raw

    # Engineer features
    print("\n[2/4] Engineering 10 features...")
    df_features = engineer_features(workload, temperature, power)
    print(f"       Features shape: {df_features.shape}")

    # ── [3/4] Tạo labels: so sánh 3 mode ─────────────────────────────────
    print("\n[3/4] Creating labels — comparing 3 horizon modes...")

    # Labels dùng raw workload (ground truth tương lai)
    workload_for_labels = workload_raw if ENABLE_LMS_FILTER else workload

    # Mode Fixed (baseline)
    labels_fixed, names_fixed = create_labels(workload_for_labels)
    min_len = min(len(df_features), len(labels_fixed))
    labels_fixed = labels_fixed[:min_len]

    # Mode A: 3-level adaptive
    labels_3lvl, names_3lvl, horizons_3lvl = create_labels_adaptive(
        workload_for_labels, df_features.iloc[:min_len], mode='3level'
    )

    # Mode B: continuous adaptive
    labels_cont, names_cont, horizons_cont = create_labels_adaptive(
        workload_for_labels, df_features.iloc[:min_len], mode='continuous'
    )

    # In phân phối để so sánh
    print("\n  Label distribution comparison:")
    print_label_distribution(labels_fixed, f"Fixed horizon={PREDICT_HORIZON}")
    print_label_distribution(labels_3lvl, "Adaptive 3-level (5/10/15)")
    print_label_distribution(labels_cont, "Adaptive continuous (5→15)")

    # In phân phối horizon (mode A & B)
    print("\n  Horizon distribution — Mode A (3-level):")
    for h in [HORIZON_SHORT, HORIZON_MID, HORIZON_LONG]:
        cnt = np.sum(horizons_3lvl == h)
        print(f"    horizon={h}: {cnt} ({100*cnt/len(horizons_3lvl):.1f}%)")

    print("\n  Horizon distribution — Mode B (continuous):")
    for h in range(HORIZON_MIN, HORIZON_MAX + 1):
        cnt = np.sum(horizons_cont == h)
        if cnt > 0:
            print(f"    horizon={h}: {cnt} ({100*cnt/len(horizons_cont):.1f}%)")

    # ── Chọn mode tốt nhất (cân bằng class nhất) ──────────────────────────
    best_mode = select_best_label_mode(labels_fixed, labels_3lvl, labels_cont)

    # Dùng mode tốt nhất
    label_map = {
        "fixed": (labels_fixed, names_fixed, None),
        "3level": (labels_3lvl, names_3lvl, horizons_3lvl),
        "continuous": (labels_cont, names_cont, horizons_cont),
    }
    labels_best, names_best, horizons_best = label_map[best_mode]
    df_out = save_all_modes(df_features, min_len, label_map, horizons_best, best_mode)

    print("\n" + "=" * 60)
    print("Feature Engineering Complete!")
    print(f"Best horizon mode : {best_mode}")
    print(f"LMS pre-filter    : {'ON (µ=' + str(LMS_MU) + ')' if ENABLE_LMS_FILTER else 'OFF'}")
    print(f"Output samples    : {len(df_out)}")
    print("=" * 60)

if __name__ == '__main__':
    main()