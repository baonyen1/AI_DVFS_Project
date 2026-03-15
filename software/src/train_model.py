#!/usr/bin/env python3
"""
train_model.py - Training pipeline cho AI-DVFS.

Input:
    data/processed/features_train.csv
    data/processed/preprocess_metadata.json

Output:
    software/models/trained_tree.pkl
    software/models/model_metrics.json

Model:
    GradientBoostingClassifier (10 trees, depth=6) — khớp hardware RTL.

Đặc điểm:
- Hyperparameter tuning với GridSearchCV (tùy chọn).
- Tự động tính class weight từ distribution.
- Quantization-aware training (Q8.8 simulation).
"""

import json
import os
import pickle

import numpy as np
import pandas as pd
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.metrics import accuracy_score, classification_report, f1_score, make_scorer
from sklearn.model_selection import GridSearchCV, TimeSeriesSplit
from sklearn.utils.class_weight import compute_class_weight

from constants import FEATURE_COLS, CLASS_NAMES

# Import SMOTE for handling class imbalance
try:
    from imblearn.over_sampling import SMOTE
    IMBLEARN_AVAILABLE = True
except ImportError:
    IMBLEARN_AVAILABLE = False
    print("[WARN] imbalanced-learn not installed. Install with: uv pip install imbalanced-learn")

# Default hyperparameters (used when NOT tuning)
N_ESTIMATORS = 10
MAX_DEPTH = 6
LEARNING_RATE = 0.1
MIN_SAMPLES_LEAF = 2
RANDOM_STATE = 42

ACCURACY_TARGET = 0.88
CV_STD_THRESHOLD = 0.06

# Hyperparameter grid for tuning
HYPERPARAM_GRID = {
    'max_depth': [3, 4, 5, 6],
    'learning_rate': [0.05, 0.1, 0.15, 0.2],
    'min_samples_leaf': [2, 3, 5, 10],
    'n_estimators': [10, 20, 30, 50]
}

# Flag to enable/disable hyperparameter tuning
ENABLE_HYPERPARAM_TUNING = True  # Set True for grid search (enabled for F1 improvement)

# Flag to enable/disable quantization-aware training
ENABLE_QUANTIZATION_AWARE = True  # Simulate Q8.8 during training

# SMOTE configuration for handling class imbalance
ENABLE_SMOTE = True  # Set True to apply SMOTE oversampling per-fold
SMOTE_K_NEIGHBORS = 5  # Number of nearest neighbors for interpolation
SMOTE_SAMPLING_STRATEGY = 'auto'  # 'auto', 'minority', or dict with target counts

# Class weights strategy: 'balanced' (sklearn default) or 'custom'
# Custom weights focus on improving Low class F1-score
CLASS_WEIGHTS_STRATEGY = 'custom'  # 'balanced' or 'custom'

# Custom class weights - tuned for Low class F1-score improvement
# Class 0=Low, 1=Medium, 2=High
# Low gets higher weight to reduce false positives from Medium
CUSTOM_CLASS_WEIGHTS = {
    0: 1.8,   # Low - increased to improve precision
    1: 0.5,   # Medium - slightly increased from 0.47
    2: 30.0,  # High - reduced from 47 to prevent over-predicting Low
}

# Scoring strategy for hyperparameter tuning
# 'f1_macro' focuses on balanced F1 across all classes (better for imbalanced data)
HYPERPARAM_SCORING = 'f1_macro'  # 'accuracy' or 'f1_macro'


def optimize_thresholds(model, X_val, y_val, class_names):
    """
    Find optimal decision thresholds for each class to maximize F1-score.

    This improves per-class F1 without retraining, by adjusting the
    decision boundary based on predicted probabilities.

    Args:
        model: Trained classifier with predict_proba method
        X_val: Validation features
        y_val: Validation labels
        class_names: List of class names (e.g., ['Low', 'Medium', 'High'])

    Returns:
        Dict mapping class index to optimal threshold
    """
    n_classes = len(class_names)
    proba = model.predict_proba(X_val)
    optimal_thresholds = {i: 0.5 for i in range(n_classes)}  # default

    for cls in range(n_classes):
        best_f1 = 0
        best_thresh = 0.5

        # Search for best threshold for this class
        for thresh in np.arange(0.2, 0.8, 0.05):
            # Predict this class if probability > threshold
            y_pred_custom = (proba[:, cls] > thresh).astype(int)

            # Calculate F1 for this class
            tp = np.sum((y_pred_custom == 1) & (y_val == cls))
            fp = np.sum((y_pred_custom == 1) & (y_val != cls))
            fn = np.sum((y_pred_custom == 0) & (y_val == cls))

            precision = tp / (tp + fp) if (tp + fp) > 0 else 0
            recall = tp / (tp + fn) if (tp + fn) > 0 else 0

            if precision + recall > 0:
                f1 = 2 * precision * recall / (precision + recall)
            else:
                f1 = 0

            if f1 > best_f1:
                best_f1 = f1
                best_thresh = thresh

        optimal_thresholds[cls] = round(best_thresh, 2)

    return optimal_thresholds

def quantize_to_q8_8(features: np.ndarray) -> np.ndarray:
    """
    Simulate Q8.8 fixed-point quantization for training.

    This reduces the gap between float training and fixed-point inference.
    Q8.8: 16-bit signed, scale=256, range [-128, 127.996]
    """
    scale = 256.0
    return np.round(features * scale) / scale


def apply_smote_to_fold(X_train, y_train, k_neighbors=SMOTE_K_NEIGHBORS):
    """
    Apply SMOTE to balance class distribution within a training fold.

    Args:
        X_train: Feature matrix for this fold
        y_train: Labels for this fold
        k_neighbors: Number of nearest neighbors for SMOTE

    Returns:
        X_resampled, y_resampled
    """
    if not IMBLEARN_AVAILABLE:
        raise ImportError(
            "imbalanced-learn is required for SMOTE. "
            "Install with: uv pip install imbalanced-learn"
        )

    smote = SMOTE(
        k_neighbors=k_neighbors,
        sampling_strategy=SMOTE_SAMPLING_STRATEGY,
        random_state=RANDOM_STATE
    )
    X_resampled, y_resampled = smote.fit_resample(X_train, y_train)
    return X_resampled, y_resampled


def print_class_distribution(labels, title):
    """Print class distribution with percentages."""
    print(f"\n  [{title}]")
    unique, counts = np.unique(labels, return_counts=True)
    for cls, count in zip(unique, counts):
        cls_name = CLASS_NAMES[cls] if 0 <= cls < len(CLASS_NAMES) else str(cls)
        pct = 100 * count / len(labels)
        print(f"    {cls_name}: {count} ({pct:.1f}%)")
    imbalance = counts.max() / counts.min() if len(counts) > 1 else 1.0
    print(f"    Imbalance ratio (max/min): {imbalance:.2f}")


def compute_class_weights_auto(labels, strategy='balanced', custom_weights=None):
    """
    Automatically compute class weights from label distribution.

    Args:
        labels: Array of class labels
        strategy: 'balanced' (sklearn default) or 'custom'
        custom_weights: Dict of custom weights if strategy='custom'

    Returns:
        Dict mapping class index to weight
    """
    classes = np.unique(labels)

    if strategy == 'custom' and custom_weights is not None:
        # Use custom weights, but ensure all classes are covered
        weights = {cls: custom_weights.get(cls, 1.0) for cls in classes}
    else:
        # Use sklearn's 'balanced' mode
        weights_arr = compute_class_weight('balanced', classes=classes, y=labels)
        weights = {int(cls): float(w) for cls, w in zip(classes, weights_arr)}

    return weights


def load_features(
    input_path: str = "data/processed/features_train.csv",
    meta_path: str = "data/processed/preprocess_metadata.json",
):
    """Load features và labels từ file đã preprocess."""
    df = pd.read_csv(input_path)
    print(f"[INFO] Loaded {len(df)} samples from {input_path}")

    features = df[list(FEATURE_COLS)].values
    labels = df["label"].values

    # Compute class weights automatically based on strategy
    global CLASS_WEIGHTS
    CLASS_WEIGHTS = compute_class_weights_auto(
        labels,
        strategy=CLASS_WEIGHTS_STRATEGY,
        custom_weights=CUSTOM_CLASS_WEIGHTS if CLASS_WEIGHTS_STRATEGY == 'custom' else None
    )
    print(f"[INFO] Auto-computed class weights ({CLASS_WEIGHTS_STRATEGY}): {CLASS_WEIGHTS}")

    # Load preprocess metadata (LMS hybrid, label mode)
    preprocess_meta: dict = {}
    if os.path.exists(meta_path):
        with open(meta_path, "r") as file:
            preprocess_meta = json.load(file)
        if preprocess_meta.get("lms_filter"):
            print(
                "[INFO] Hybrid LMS+DT: "
                f"lms_filter=ON, mu={preprocess_meta.get('lms_mu')}",
            )

    return features, labels, df, preprocess_meta


def train_model(
    features: np.ndarray,
    labels: np.ndarray,
    n_estimators: int = N_ESTIMATORS,
    max_depth: int = MAX_DEPTH,
    learning_rate: float = LEARNING_RATE,
    do_hyperparam_tuning: bool = ENABLE_HYPERPARAM_TUNING,
    quantization_aware: bool = ENABLE_QUANTIZATION_AWARE,
    preprocess_meta: dict | None = None,
):
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
        # Hyperparameter Tuning with Manual Grid Search + SMOTE
        # =========================================
        print("\n[INFO] Starting hyperparameter tuning with manual grid search...")
        print(f"       Grid: {HYPERPARAM_GRID}")
        if ENABLE_SMOTE:
            print(f"       SMOTE enabled (k={SMOTE_K_NEIGHBORS})")

        # Manual grid search since SMOTE needs per-fold application
        best_score = -np.inf
        best_params = None

        for max_depth in HYPERPARAM_GRID['max_depth']:
            for learning_rate in HYPERPARAM_GRID['learning_rate']:
                for min_samples_leaf in HYPERPARAM_GRID['min_samples_leaf']:
                    for n_est in HYPERPARAM_GRID['n_estimators']:
                        cv_scores_fold = []
                        for train_idx, val_idx in tscv.split(features_train):
                            X_tr, X_val = features_train[train_idx], features_train[val_idx]
                            y_tr, y_val = labels[train_idx], labels[val_idx]

                            if ENABLE_SMOTE:
                                X_tr, y_tr = apply_smote_to_fold(X_tr, y_tr)

                            model_cv = GradientBoostingClassifier(
                                n_estimators=n_est, max_depth=max_depth,
                                learning_rate=learning_rate, min_samples_leaf=min_samples_leaf,
                                random_state=RANDOM_STATE
                            )
                            model_cv.fit(X_tr, y_tr)
                            y_pred = model_cv.predict(X_val)
                            cv_scores_fold.append(f1_score(y_val, y_pred, average='macro'))

                        mean_score = np.mean(cv_scores_fold)
                        if mean_score > best_score:
                            best_score = mean_score
                            best_params = {
                                'max_depth': max_depth,
                                'learning_rate': learning_rate,
                                'min_samples_leaf': min_samples_leaf,
                                'n_estimators': n_est
                            }

        print(f"\n[INFO] Best params: {best_params}")
        print(f"       Best CV F1-macro: {best_score:.4f}")
        n_estimators = best_params["n_estimators"]
        max_depth = best_params["max_depth"]
        learning_rate = best_params["learning_rate"]
        min_samples_leaf = best_params.get("min_samples_leaf", MIN_SAMPLES_LEAF)

    # Cross-validation to get CV scores (using F1-score macro)
    cv_scores = []
    cv_f1_scores = []  # Track F1 macro separately

    for fold_idx, (train_idx, val_idx) in enumerate(tscv.split(features_train)):
        X_train, X_val = features_train[train_idx], features_train[val_idx]
        y_train, y_val = labels[train_idx], labels[val_idx]

        # Apply SMOTE only to training fold (selected: Approach B - no data leakage)
        if ENABLE_SMOTE:
            X_train, y_train = apply_smote_to_fold(X_train, y_train)

        # Re-compute sample weights for resampled data
        w_train = np.ones(len(y_train))
        for cls, weight in CLASS_WEIGHTS.items():
            w_train[y_train == cls] = weight

        model_cv = GradientBoostingClassifier(
            n_estimators=n_estimators,
            max_depth=max_depth,
            learning_rate=learning_rate,
            random_state=RANDOM_STATE,
            min_samples_leaf=min_samples_leaf,
        )

        model_cv.fit(X_train, y_train, sample_weight=w_train)

        y_pred = model_cv.predict(X_val)
        score = accuracy_score(y_val, y_pred)
        f1_macro = f1_score(y_val, y_pred, average='macro')
        cv_scores.append(score)
        cv_f1_scores.append(f1_macro)

        # Print per-fold SMOTE effect (first fold only)
        if ENABLE_SMOTE and fold_idx == 0:
            print(f"\n  [Fold 0] SMOTE applied (k={SMOTE_K_NEIGHBORS}):")
            for cls in [0, 1, 2]:
                cnt_before = np.sum(labels[train_idx] == cls)
                cnt_after = np.sum(y_train == cls)
                print(f"    {CLASS_NAMES[cls]}: {cnt_before} -> {cnt_after}")

    # Train final model on all data with SMOTE
    if ENABLE_SMOTE:
        print("\n[INFO] Training final model with SMOTE on full dataset...")
        X_train_full, y_train_full = apply_smote_to_fold(features_train, labels)
        w_train_full = np.ones(len(y_train_full))
        for cls, weight in CLASS_WEIGHTS.items():
            w_train_full[y_train_full == cls] = weight
        final_model = GradientBoostingClassifier(
            n_estimators=n_estimators,
            max_depth=max_depth,
            learning_rate=learning_rate,
            random_state=RANDOM_STATE,
            min_samples_leaf=min_samples_leaf,
        )
        final_model.fit(X_train_full, y_train_full, sample_weight=w_train_full)
        print(f"       Final dataset size after SMOTE: {len(y_train_full)} samples")
    else:
        final_model = GradientBoostingClassifier(
            n_estimators=n_estimators,
            max_depth=max_depth,
            learning_rate=learning_rate,
            random_state=RANDOM_STATE,
            min_samples_leaf=min_samples_leaf,
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
    report = classification_report(
        labels,
        y_pred,
        target_names=list(CLASS_NAMES),
        output_dict=True,
    )

    metrics = {
        "cv_scores": cv_scores,
        "cv_mean": float(np.mean(cv_scores)),
        "cv_std": float(np.std(cv_scores)),
        "cv_f1_macro_mean": float(np.mean(cv_f1_scores)),  # F1 macro CV score
        "final_accuracy": float(final_accuracy),
        "n_classes": int(len(np.unique(labels))),
        "n_features": int(features.shape[1]),
        "n_samples": int(len(labels)),
        "classification_report": report,
        "best_params": {
            "n_estimators": n_estimators,
            "max_depth": max_depth,
            "learning_rate": learning_rate,
            "min_samples_leaf": min_samples_leaf,
        },
        "quantization_aware": quantization_aware,
        "class_weights": CLASS_WEIGHTS,
        "preprocess_config": preprocess_meta or {},
        "class_weights_strategy": CLASS_WEIGHTS_STRATEGY,
        "smote_enabled": ENABLE_SMOTE,
        "smote_k_neighbors": SMOTE_K_NEIGHBORS,
        "smote_sampling_strategy": SMOTE_SAMPLING_STRATEGY,
    }

    # Optimize thresholds for better per-class F1
    print("\n[INFO] Optimizing decision thresholds for each class...")
    optimal_thresholds = optimize_thresholds(final_model, features_eval, labels, CLASS_NAMES)
    metrics["optimal_thresholds"] = optimal_thresholds
    print(f"       Optimal thresholds: {optimal_thresholds}")

    return final_model, metrics, report


def save_model(model, metrics, output_dir: str = "software/models") -> None:
    """Lưu model và metrics."""
    os.makedirs(output_dir, exist_ok=True)

    # Save model
    model_path = os.path.join(output_dir, "trained_tree.pkl")
    with open(model_path, "wb") as file:
        pickle.dump(model, file)

    # Save metrics
    metrics_path = os.path.join(output_dir, "model_metrics.json")
    with open(metrics_path, "w") as file:
        json.dump(metrics, file, indent=2)

    # Save feature importances
    importances_path = os.path.join(output_dir, "feature_importances.json")
    importances = {
        "features": list(FEATURE_COLS),
        "importances": model.feature_importances_.tolist(),
    }
    with open(importances_path, "w") as file:
        json.dump(importances, file, indent=2)

    print(f"[INFO] Model saved to {model_path}")
    print(f"[INFO] Metrics saved to {metrics_path}")
    print(f"[INFO] Feature importances saved to {importances_path}")


def main():
    print("=" * 60)
    print("AI-DVFS Training Pipeline")
    print("=" * 60)

    # Load features
    print("\n[1/4] Loading preprocessed features...")
    features, labels, _, preprocess_meta = load_features()
    print(f"      Dataset size: {len(labels)} samples")
    print(f"      Features: {features.shape[1]}")

    # Print class distribution before SMOTE
    print_class_distribution(labels, "Original")

    # Train model
    print("\n[2/4] Training GradientBoostingClassifier...")
    if ENABLE_HYPERPARAM_TUNING:
        print("      [HYPERPARAM TUNING ENABLED]")
        print(f"      Grid: {HYPERPARAM_GRID}")
    else:
        print(f"      n_estimators={N_ESTIMATORS}, max_depth={MAX_DEPTH}")
        print(
            f"      learning_rate={LEARNING_RATE}, "
            f"min_samples_leaf={MIN_SAMPLES_LEAF}",
        )
    print(f"      quantization_aware={ENABLE_QUANTIZATION_AWARE}")
    print(f"      class_weights_strategy={CLASS_WEIGHTS_STRATEGY}")
    if CLASS_WEIGHTS_STRATEGY == 'custom':
        print(f"      custom_weights={CUSTOM_CLASS_WEIGHTS}")
    else:
        print(f"      class_weights=auto-computed (balanced)")
    print(f"      smote_enabled={ENABLE_SMOTE}")
    if ENABLE_SMOTE:
        print(f"      smote_k_neighbors={SMOTE_K_NEIGHBORS}")
        print(f"      smote_sampling_strategy={SMOTE_SAMPLING_STRATEGY}")

    model, metrics, report = train_model(
        features, labels,
        do_hyperparam_tuning=ENABLE_HYPERPARAM_TUNING,
        quantization_aware=ENABLE_QUANTIZATION_AWARE,
        preprocess_meta=preprocess_meta,
    )

    # Print metrics
    print("\n[3/4] Model Performance:")
    print(
        f"      CV Accuracy: "
        f"{metrics['cv_mean']:.4f} (+/- {metrics['cv_std']:.4f})",
    )
    if "cv_f1_macro_mean" in metrics:
        print(f"      CV F1-Score (macro): {metrics['cv_f1_macro_mean']:.4f}")
    print(f"      Final Accuracy: {metrics['final_accuracy']:.4f}")

    if "best_params" in metrics:
        print(f"\n      Best Params:")
        for key, val in metrics["best_params"].items():
            print(f"        {key}: {val}")

    print(f"\n      Class Weights Strategy: {CLASS_WEIGHTS_STRATEGY}")
    if metrics.get("optimal_thresholds"):
        print(f"      Optimal Thresholds: {metrics['optimal_thresholds']}")

    print("\n      Classification Report:")
    for name in CLASS_NAMES:
        if name in report:
            print(
                f"        {name}: "
                f"precision={report[name]['precision']:.3f}, "
                f"recall={report[name]['recall']:.3f}, "
                f"f1={report[name]['f1-score']:.3f}",
            )

    # Save model
    print("\n[4/4] Saving model...")
    save_model(model, metrics)

    print("\n" + "=" * 60)
    print("Training Complete!")
    print("=" * 60)

    # Check if accuracy meets target
    if metrics["final_accuracy"] >= ACCURACY_TARGET:
        print("\n[OK] Accuracy meets target (>= 88%)")
    else:
        print(
            f"\n[WARN] Accuracy {metrics['final_accuracy']:.2%} "
            f"below target ({ACCURACY_TARGET:.0%})",
        )

    # Check CV std
    if metrics["cv_std"] < CV_STD_THRESHOLD:
        print(f"[OK] CV std {metrics['cv_std']:.2%} < 6% threshold")
    else:
        print(
            f"[WARN] CV std {metrics['cv_std']:.2%} >= 6% - "
            "consider reducing model complexity",
        )


if __name__ == '__main__':
    main()
