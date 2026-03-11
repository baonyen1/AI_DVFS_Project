#!/usr/bin/env python3
"""
train_model.py - Training pipeline cho AI-DVFS

Input:  software/data/processed/features_train.csv
Output: software/models/trained_tree.pkl
        software/models/model_metrics.json

Model: GradientBoostingClassifier (10 trees, depth=6)

Improvements implemented:
- Hyperparameter tuning with GridSearchCV (optional)
- Automatic class weight computation from distribution
- Quantization-aware training (Q8.8 simulation)
"""

import os
import json
import pickle
import numpy as np
import pandas as pd
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.model_selection import TimeSeriesSplit, GridSearchCV
from sklearn.metrics import accuracy_score, classification_report
from sklearn.utils.class_weight import compute_class_weight

# Constants
WINDOW_SIZE = 8
PREDICT_HORIZON = 10
LOW_THRESH = 30
HIGH_THRESH = 70

# Default hyperparameters (used when NOT tuning)
N_ESTIMATORS = 10
MAX_DEPTH = 6
LEARNING_RATE = 0.1
MIN_SAMPLES_LEAF = 2
RANDOM_STATE = 42

# Hyperparameter grid for tuning
HYPERPARAM_GRID = {
    'max_depth': [3, 4, 5, 6],
    'learning_rate': [0.05, 0.1, 0.15, 0.2],
    'min_samples_leaf': [2, 3, 5, 10],
    'n_estimators': [10, 20, 30, 50]
}

# Flag to enable/disable hyperparameter tuning
ENABLE_HYPERPARAM_TUNING = False  # Set True for grid search

# Flag to enable/disable quantization-aware training
ENABLE_QUANTIZATION_AWARE = True  # Simulate Q8.8 during training

# Class weights - will be computed automatically from data
CLASS_WEIGHTS = None  # Computed at runtime

FEATURE_COLS = [
    'f0_workload',     # w[-1]                   — workload hiện tại
    'f1_mean',         # w.mean()                — trung bình 8 samples
    'f2_std',          # w.std()                 — độ lệch chuẩn (anomaly)
    'f3_delta',        # w[-1] - w[-2]           — rate of change
    'f4_trend',        # polyfit slope           — xu hướng tuyến tính
    'f5_ema',          # EMA alpha=0.25          — smoothed workload
    'f6_temperature',  # temp[t]                 — nhiệt độ
    'f7_headroom',     # max(0, 85 - temp[t])    — thermal headroom AMD
    'f8_efficiency',   # w[-1]/(power+0.01)      — hiệu suất
    'f9_short_long',   # w[-3:].mean()-w[:5].mean() — short vs long
]


def quantize_to_q8_8(X):
    """
    Simulate Q8.8 fixed-point quantization for training.

    This reduces the gap between float training and fixed-point inference.
    Q8.8: 16-bit signed, scale=256, range [-128, 127.996]
    """
    scale = 256.0
    X_quantized = np.round(X * scale) / scale
    return X_quantized


def compute_class_weights_auto(labels):
    """
    Automatically compute class weights from label distribution.

    Uses sklearn's 'balanced' mode: weights = n_samples / (n_classes * np.bincount(labels))
    """
    classes = np.unique(labels)
    weights = compute_class_weight('balanced', classes=classes, y=labels)
    # Convert numpy types to native Python types for JSON serialization
    return {int(cls): float(w) for cls, w in zip(classes, weights)}


def load_features(input_path='data/processed/features_train.csv'):
    """Load features và labels từ file đã preprocess."""
    df = pd.read_csv(input_path)
    print(f"[INFO] Loaded {len(df)} samples from {input_path}")

    features = df[FEATURE_COLS].values
    labels = df['label'].values

    # Compute class weights automatically
    global CLASS_WEIGHTS
    CLASS_WEIGHTS = compute_class_weights_auto(labels)
    print(f"[INFO] Auto-computed class weights: {CLASS_WEIGHTS}")

    return features, labels, df


def train_model(features, labels, n_estimators=N_ESTIMATORS,
                max_depth=MAX_DEPTH, learning_rate=LEARNING_RATE,
                do_hyperparam_tuning=ENABLE_HYPERPARAM_TUNING,
                quantization_aware=ENABLE_QUANTIZATION_AWARE):
    """
    Train GradientBoostingClassifier với TimeSeriesSplit validation.

    Args:
        features: Feature matrix (n_samples, n_features)
        labels: Labels (n_samples,)
        n_estimators: Number of trees (used when NOT tuning)
        max_depth: Max tree depth (used when NOT tuning)
        learning_rate: Learning rate (used when NOT tuning)
        do_hyperparam_tuning: If True, use GridSearchCV to find best params
        quantization_aware: If True, simulate Q8.8 quantization during training

    Returns:
        model: Trained model
        metrics: Dict with CV scores, accuracy, etc.
        report: Classification report dict
    """
    # Apply quantization-aware training if enabled
    if quantization_aware:
        print("[INFO] Quantization-aware training enabled (Q8.8 simulation)")
        features_train = quantize_to_q8_8(features)
    else:
        features_train = features

    # Compute sample weights from class weights
    sample_weights = np.ones(len(labels))
    for cls, weight in CLASS_WEIGHTS.items():
        sample_weights[labels == cls] = weight

    # TimeSeriesSplit (không random shuffle)
    tscv = TimeSeriesSplit(n_splits=5)

    if do_hyperparam_tuning:
        # =========================================
        # Hyperparameter Tuning with GridSearchCV
        # =========================================
        print("\n[INFO] Starting hyperparameter tuning with GridSearchCV...")
        print(f"       Grid: {HYPERPARAM_GRID}")

        base_model = GradientBoostingClassifier(random_state=RANDOM_STATE)

        grid_search = GridSearchCV(
            estimator=base_model,
            param_grid=HYPERPARAM_GRID,
            cv=tscv,
            scoring='accuracy',
            n_jobs=-1,
            verbose=1
        )

        grid_search.fit(features_train, labels, sample_weight=sample_weights)

        # Print best params
        print(f"\n[INFO] Best params: {grid_search.best_params_}")
        print(f"       Best CV score: {grid_search.best_score_:.4f}")

        # Use best params for final model
        best_params = grid_search.best_params_
        n_estimators = best_params['n_estimators']
        max_depth = best_params['max_depth']
        learning_rate = best_params['learning_rate']
        min_samples_leaf = best_params.get('min_samples_leaf', MIN_SAMPLES_LEAF)

    # Cross-validation to get CV scores
    cv_scores = []

    for train_idx, val_idx in tscv.split(features_train):
        X_train, X_val = features_train[train_idx], features_train[val_idx]
        y_train, y_val = labels[train_idx], labels[val_idx]
        w_train = sample_weights[train_idx]

        model_cv = GradientBoostingClassifier(
            n_estimators=n_estimators,
            max_depth=max_depth,
            learning_rate=learning_rate,
            random_state=RANDOM_STATE,
            min_samples_leaf=MIN_SAMPLES_LEAF,
        )

        model_cv.fit(X_train, y_train, sample_weight=w_train)

        y_pred = model_cv.predict(X_val)
        score = accuracy_score(y_val, y_pred)
        cv_scores.append(score)

    # Train final model on all data
    final_model = GradientBoostingClassifier(
        n_estimators=n_estimators,
        max_depth=max_depth,
        learning_rate=learning_rate,
        random_state=RANDOM_STATE,
        min_samples_leaf=MIN_SAMPLES_LEAF,
    )
    final_model.fit(features_train, labels, sample_weight=sample_weights)

    # Final evaluation (on original features for accurate metrics)
    if quantization_aware:
        # Evaluate on quantized features
        features_eval = features_train
    else:
        features_eval = features

    y_pred = final_model.predict(features_eval)
    final_accuracy = accuracy_score(labels, y_pred)

    # Classification report
    report = classification_report(labels, y_pred,
                                   target_names=['Low', 'Medium', 'High'],
                                   output_dict=True)

    metrics = {
        'cv_scores': cv_scores,
        'cv_mean': np.mean(cv_scores),
        'cv_std': np.std(cv_scores),
        'final_accuracy': final_accuracy,
        'n_classes': len(np.unique(labels)),
        'n_features': features.shape[1],
        'n_samples': len(labels),
        'classification_report': report,
        'best_params': {
            'n_estimators': n_estimators,
            'max_depth': max_depth,
            'learning_rate': learning_rate,
            'min_samples_leaf': MIN_SAMPLES_LEAF
        },
        'quantization_aware': quantization_aware,
        'class_weights': CLASS_WEIGHTS
    }

    return final_model, metrics, report


def save_model(model, metrics, output_dir='software/models'):
    """Lưu model và metrics."""
    os.makedirs(output_dir, exist_ok=True)

    # Save model
    model_path = os.path.join(output_dir, 'trained_tree.pkl')
    with open(model_path, 'wb') as f:
        pickle.dump(model, f)

    # Save metrics
    metrics_path = os.path.join(output_dir, 'model_metrics.json')
    with open(metrics_path, 'w') as f:
        json.dump(metrics, f, indent=2)

    # Save feature importances
    importances_path = os.path.join(output_dir, 'feature_importances.json')
    importances = {
        'features': FEATURE_COLS,
        'importances': model.feature_importances_.tolist()
    }
    with open(importances_path, 'w') as f:
        json.dump(importances, f, indent=2)

    print(f"[INFO] Model saved to {model_path}")
    print(f"[INFO] Metrics saved to {metrics_path}")
    print(f"[INFO] Feature importances saved to {importances_path}")


def main():
    print("=" * 60)
    print("AI-DVFS Training Pipeline")
    print("=" * 60)

    # Load features
    print("\n[1/4] Loading preprocessed features...")
    features, labels, _ = load_features()
    print(f"      Dataset size: {len(labels)} samples")
    print(f"      Features: {features.shape[1]}")

    # Print class distribution
    print("\n      Class distribution:")
    unique, counts = np.unique(labels, return_counts=True)
    for cls, cnt in zip(unique, counts):
        cls_name = ['Low', 'Medium', 'High'][cls]
        print(f"        {cls_name}: {cnt} ({100*cnt/len(labels):.1f}%)")

    # Train model
    print("\n[2/4] Training GradientBoostingClassifier...")
    if ENABLE_HYPERPARAM_TUNING:
        print("      [HYPERPARAM TUNING ENABLED]")
        print(f"      Grid: {HYPERPARAM_GRID}")
    else:
        print(f"      n_estimators={N_ESTIMATORS}, max_depth={MAX_DEPTH}")
        print(f"      learning_rate={LEARNING_RATE}, min_samples_leaf={MIN_SAMPLES_LEAF}")
    print(f"      quantization_aware={ENABLE_QUANTIZATION_AWARE}")
    print(f"      class_weights=auto-computed")

    model, metrics, report = train_model(
        features, labels,
        do_hyperparam_tuning=ENABLE_HYPERPARAM_TUNING,
        quantization_aware=ENABLE_QUANTIZATION_AWARE
    )

    # Print metrics
    print("\n[3/4] Model Performance:")
    print(f"      CV Accuracy: {metrics['cv_mean']:.4f} (+/- {metrics['cv_std']:.4f})")
    print(f"      Final Accuracy: {metrics['final_accuracy']:.4f}")

    if 'best_params' in metrics:
        print(f"\n      Best Params:")
        for key, val in metrics['best_params'].items():
            print(f"        {key}: {val}")

    print("\n      Classification Report:")
    for cls in ['Low', 'Medium', 'High']:
        if cls in report:
            print(f"        {cls}: precision={report[cls]['precision']:.3f}, "
                  f"recall={report[cls]['recall']:.3f}, f1={report[cls]['f1-score']:.3f}")

    # Save model
    print("\n[4/4] Saving model...")
    save_model(model, metrics)

    print("\n" + "=" * 60)
    print("Training Complete!")
    print("=" * 60)

    # Check if accuracy meets target
    if metrics['final_accuracy'] >= 0.88:
        print("\n[OK] Accuracy meets target (>= 88%)")
    else:
        print(f"\n[WARN] Accuracy {metrics['final_accuracy']:.2%} below target (88%)")

    # Check CV std
    if metrics['cv_std'] < 0.06:
        print(f"[OK] CV std {metrics['cv_std']:.2%} < 6% threshold")
    else:
        print(f"[WARN] CV std {metrics['cv_std']:.2%} >= 6% - consider reducing model complexity")


if __name__ == '__main__':
    main()
