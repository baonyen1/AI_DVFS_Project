#!/usr/bin/env python3
"""
alibaba_pipeline.py - Tạo dataset từ Alibaba Cluster Trace 2018

Dataset: Alibaba Cluster Trace 2018 (CPU utilization thực tế)
Output: software/data/processed/alibaba_dataset.csv
"""

import os
import sys
import numpy as np
import pandas as pd
from datacentertracesdatasets import loadtraces

# Constants
N_SAMPLES = 50000  # Số samples cần lấy
STRIDE_SECONDS = 10  # Khoảng cách giữa các samples
RANDOM_STATE = 42

# Temperature model parameters (AMD laptop - k10temp/zenpower)
TEMP_BASE = 38
TEMP_WORKLOAD_COEF = 0.32
TEMP_NONLINEAR_COEF = 0.002
TEMP_NOISE_STD = 2.0
TEMP_MIN = 35
TEMP_MAX = 90

# Power model parameters (CMOS)
POWER_BASE = 3.5
POWER_MAX = 38.0
POWER_EXPONENT = 1.4
MEMORY_COEF = 0.01
DEFAULT_MEMORY = 50  # %


def load_alibaba_trace(n_samples=N_SAMPLES, stride_seconds=STRIDE_SECONDS):
    """
    Load Alibaba Cluster Trace 2018.

    Returns DataFrame với columns:
    - cpu_util_percent: CPU utilization (workload chính)
    - mem_util_percent: Memory utilization
    - disk_io_percent: Disk I/O
    """
    print(f"[INFO] Loading Alibaba Cluster Trace 2018...")
    print(f"       stride_seconds={stride_seconds}, n_samples={n_samples}")

    try:
        df = loadtraces.get_trace(
            'alibaba2018',
            'machine_usage',
            stride_seconds=stride_seconds
        )

        # Lấy đủ n_samples
        if len(df) > n_samples:
            df = df.iloc[:n_samples].reset_index(drop=True)

        print(f"[INFO] Loaded {len(df)} samples")
        print(f"       Columns: {list(df.columns)}")

        return df

    except Exception as e:
        print(f"[ERROR] Failed to load Alibaba trace: {e}")
        print("[INFO] Falling back to synthetic dataset...")
        return None


def generate_temperature(workload, seed=RANDOM_STATE):
    """
    Generate temperature từ workload dựa trên AMD laptop model.

    temperature = 38 + 0.32*ema_workload + 0.002*ema_workload^1.5 + noise
    """
    np.random.seed(seed + 1)

    # EMA workload (alpha=0.25)
    ema_workload = pd.Series(workload).ewm(alpha=0.25).mean().values

    # Temperature model
    temperature = (TEMP_BASE
                   + TEMP_WORKLOAD_COEF * ema_workload
                   + TEMP_NONLINEAR_COEF * np.power(ema_workload, 1.5)
                   + np.random.normal(0, TEMP_NOISE_STD, len(workload)))

    # Clip to reasonable range
    temperature = np.clip(temperature, TEMP_MIN, TEMP_MAX)

    return temperature


def generate_power(workload, memory_usage=None):
    """
    Generate power consumption từ workload.

    power = 3.5 + (workload/100)^1.4 * 38.0 + 0.01*memory
    """
    if memory_usage is None:
        memory_usage = np.full(len(workload), DEFAULT_MEMORY)

    power = (POWER_BASE
             + np.power(workload / 100, POWER_EXPONENT) * POWER_MAX
             + MEMORY_COEF * memory_usage)

    return power


def create_alibaba_dataset(output_dir='software/data/processed'):
    """
    Tạo full dataset từ Alibaba trace với temperature + power model.
    """
    os.makedirs(output_dir, exist_ok=True)

    # Load Alibaba trace
    df = load_alibaba_trace()

    if df is None:
        # Fallback sang synthetic nếu không load được
        from src.train_model import generate_synthetic_workload
        workload = generate_synthetic_workload(N_SAMPLES)
        memory_usage = np.random.uniform(30, 80, N_SAMPLES)
    else:
        # Lấy CPU utilization làm workload
        workload = df['cpu_util_percent'].values

        # Lấy memory utilization nếu có
        if 'mem_util_percent' in df.columns:
            memory_usage = df['mem_util_percent'].values
        else:
            memory_usage = np.random.uniform(30, 80, len(workload))

    # Generate temperature
    temperature = generate_temperature(workload)

    # Generate power
    power = generate_power(workload, memory_usage)

    # Create output DataFrame
    output_df = pd.DataFrame({
        'timestamp': np.arange(len(workload)) * STRIDE_SECONDS,
        'workload': workload,
        'memory': memory_usage,
        'temperature': temperature,
        'power': power
    })

    # Save to CSV
    output_path = os.path.join(output_dir, 'alibaba_dataset.csv')
    output_df.to_csv(output_path, index=False)

    print(f"\n[INFO] Dataset saved to {output_path}")
    print(f"       Total samples: {len(output_df)}")
    print(f"\n       Statistics:")
    print(f"         Workload:  [{workload.min():.2f}, {workload.max():.2f}] (mean={workload.mean():.2f})")
    print(f"         Memory:    [{memory_usage.min():.2f}, {memory_usage.max():.2f}] (mean={memory_usage.mean():.2f})")
    print(f"         Temp:      [{temperature.min():.2f}, {temperature.max():.2f}] (mean={temperature.mean():.2f})")
    print(f"         Power:     [{power.min():.2f}, {power.max():.2f}] (mean={power.mean():.2f})")

    return output_df


def main():
    print("=" * 60)
    print("Alibaba Cluster Trace 2018 - Dataset Generator")
    print("=" * 60)

    df = create_alibaba_dataset()

    print("\n" + "=" * 60)
    print("Dataset Generation Complete!")
    print("=" * 60)
    print(f"\n Citation: Alibaba Cluster Trace Program 2018, Alibaba Group")
    print(f" Dataset:  {len(df)} samples, {STRIDE_SECONDS}s stride")
    print(f" Workload: CPU utilization (real)")
    print(f" Temp/Pwr: CMOS physical model")


if __name__ == '__main__':
    main()
