#!/usr/bin/env python3
"""
export_to_verilog.py - Export trained Decision Tree model to Verilog parameters

Input:  software/models/trained_tree.pkl
        software/models/model_metrics.json
Output: software/outputs/verilog_params.vh
        hardware/rtl/common/verilog_params.vh (auto-copy)

This script extracts tree parameters (thresholds, features, values) from the trained
GradientBoostingClassifier and converts them to Q8.8 fixed-point format for Verilog.

Output:
- THRESHOLD parameters for each node in each tree
- FEATURE indices for each node
- LEAF values for each tree
"""

import os
import json
import pickle
from datetime import datetime

# Constants
Q8_8_SCALE = 256
# Paths are relative to script location (software/src/)
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)
OUTPUT_DIR = os.path.join(PROJECT_ROOT, 'outputs')
HARDWARE_OUTPUT_DIR = os.path.join(PROJECT_ROOT, '..', 'hardware', 'rtl', 'common')


def to_q8_8(val):
    """Convert float to 16-bit signed Q8.8 fixed-point."""
    v = int(round(val * Q8_8_SCALE))
    return max(-32768, min(32767, v))


def q8_8_to_hex(val):
    """Convert Q8.8 value to 4-digit hex string."""
    if val < 0:
        # Two's complement for negative numbers
        val = val + 65536
    return f"{val & 0xFFFF:04X}"


def load_model(model_path=None):
    """Load trained model."""
    if model_path is None:
        model_path = os.path.join(PROJECT_ROOT, 'models', 'trained_tree.pkl')
    with open(model_path, 'rb') as f:
        model = pickle.load(f)
    print(f"[INFO] Loaded model from {model_path}")
    return model


def load_metrics(metrics_path=None):
    """Load model metrics."""
    if metrics_path is None:
        metrics_path = os.path.join(PROJECT_ROOT, 'models', 'model_metrics.json')
    with open(metrics_path, 'r') as f:
        metrics = json.load(f)
    print(f"[INFO] Loaded metrics from {metrics_path}")
    return metrics


def extract_tree_params(model):
    """
    Extract parameters from GradientBoostingClassifier.

    For GradientBoostingClassifier:
    - model.estimators_[:, i] gives all trees for class i
    - Each tree has tree_.threshold, tree_.feature, tree_.value

    Returns dict with:
    - n_trees: number of trees per class
    - n_classes: number of classes
    - trees: list of tree data per class
    """
    trees_data = {
        'n_trees': model.n_estimators,
        'n_classes': model.n_classes_,
        'trees': []
    }

    # model.estimators_ shape: (n_estimators, n_classes)
    # For each class, we have n_estimators trees
    for class_idx in range(model.n_classes_):
        class_trees = []
        for tree_idx in range(model.n_estimators):
            tree = model.estimators_[tree_idx, class_idx].tree_

            tree_info = {
                'thresholds': tree.threshold.copy(),
                'features': tree.feature.copy(),
                'values': tree.value.copy(),  # Shape: (n_nodes, 1, n_classes)
                'children_left': tree.children_left.copy(),
                'children_right': tree.children_right.copy(),
                'node_count': tree.node_count
            }
            class_trees.append(tree_info)

        trees_data['trees'].append(class_trees)

    return trees_data


def generate_verilog_header(trees_data, metrics, feature_cols):
    """
    Generate Verilog header file with all tree parameters.

    Format:
    - `define N_TREES <value>
    - `define N_CLASSES <value>
    - `define N_FEATURES <value>
    - `define THRESH_TREE_<c>_<t>_<n> <hex_value>  // Tree c, tree t, node n
    - `define FEATURE_TREE_<c>_<t>_<n> <feature_idx>
    - `define LEAF_TREE_<c>_<t>_<n> <hex_value>
    - `define LEFT_CHILD_TREE_<c>_<t>_<n> <child_idx>
    - `define RIGHT_CHILD_TREE_<c>_<t>_<n> <child_idx>
    """
    lines = []
    lines.append("//" + "=" * 61)
    lines.append("// AI-DVFS Verilog Parameters - Auto-generated")
    lines.append(f"// Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("//")
    lines.append(f"// Model: GradientBoostingClassifier")
    lines.append(f"// Trees: {trees_data['n_trees']} per class")
    lines.append(f"// Classes: {trees_data['n_classes']}")
    lines.append(f"// Features: {len(feature_cols)}")
    lines.append(f"// Fixed-point: Q8.8 (16-bit signed)")
    lines.append("//")
    lines.append(f"// Training Metrics:")
    lines.append(f"//   CV Accuracy: {metrics['cv_mean']:.4f} (+/- {metrics['cv_std']:.4f})")
    lines.append(f"//   Final Accuracy: {metrics['final_accuracy']:.4f}")
    lines.append(f"//   Quantization-aware: {metrics.get('quantization_aware', False)}")
    lines.append("//" + "=" * 62)
    lines.append("")
    lines.append("`ifndef VERILOG_PARAMS_VH")
    lines.append("`define VERILOG_PARAMS_VH")
    lines.append("")

    # Global constants
    lines.append("// ========================================")
    lines.append("// Global Configuration")
    lines.append("// ========================================")
    lines.append(f"`define N_TREES           {trees_data['n_trees']}")
    lines.append(f"`define N_CLASSES         {trees_data['n_classes']}")
    lines.append(f"`define N_FEATURES        {len(feature_cols)}")
    lines.append(f"`define TREE_DEPTH        6")  # Based on model config
    lines.append(f"`define WINDOW_SIZE       8")
    lines.append(f"`define PREDICT_HORIZON   10")
    lines.append("")

    # Feature mapping
    lines.append("// ========================================")
    lines.append("// Feature Indices")
    lines.append("// ========================================")
    for idx, feat in enumerate(feature_cols):
        feat_name = feat.upper().replace('F', 'F_')
        lines.append(f"`define {feat_name:<20} {idx}")
    lines.append("")

    # Class labels
    lines.append("// ========================================")
    lines.append("// Class Labels")
    lines.append("// ========================================")
    lines.append("`define CLASS_LOW         0")
    lines.append("`define CLASS_MEDIUM      1")
    lines.append("`define CLASS_HIGH        2")
    lines.append("")

    # Tree parameters
    lines.append("// ========================================")
    lines.append("// Tree Parameters (Q8.8 fixed-point)")
    lines.append("// ========================================")

    for class_idx, class_trees in enumerate(trees_data['trees']):
        class_name = ['LOW', 'MEDIUM', 'HIGH'][class_idx]
        lines.append("")
        lines.append(f"// ----------------------------------------")
        lines.append(f"// Class {class_name} (label={class_idx}) - {len(class_trees)} trees")
        lines.append(f"// ----------------------------------------")

        for tree_idx, tree in enumerate(class_trees):
            lines.append("")
            lines.append(f"// --- Tree {tree_idx} ---")

            n_nodes = tree['node_count']

            for node_idx in range(n_nodes):
                feature_idx = tree['features'][node_idx]
                threshold = tree['thresholds'][node_idx]
                left_child = tree['children_left'][node_idx]
                right_child = tree['children_right'][node_idx]

                # Internal node vs leaf
                if left_child != -1:  # Internal node
                    thresh_q = to_q8_8(threshold)
                    thresh_hex = q8_8_to_hex(thresh_q)

                    lines.append(f"`define THRESH_TREE_{class_idx}_{tree_idx}_{node_idx}  16'h{thresh_hex}  // feat={feature_idx}, thresh={threshold:.4f}")
                    lines.append(f"`define FEAT_TREE_{class_idx}_{tree_idx}_{node_idx}    {feature_idx}")
                    lines.append(f"`define LEFT_CHILD_{class_idx}_{tree_idx}_{node_idx}   {left_child}")
                    lines.append(f"`define RIGHT_CHILD_{class_idx}_{tree_idx}_{node_idx}  {right_child}")
                else:  # Leaf node
                    # tree.value shape: (1, n_classes, n_outputs)
                    leaf_val = tree['values'][node_idx][0][0]  # Get value for this class
                    leaf_q = to_q8_8(leaf_val)
                    leaf_hex = q8_8_to_hex(leaf_q)

                    lines.append(f"`define LEAF_TREE_{class_idx}_{tree_idx}_{node_idx}    16'h{leaf_hex}  // value={leaf_val:.4f}")

    lines.append("")
    lines.append("`endif // VERILOG_PARAMS_VH")
    lines.append("")
    lines.append("// End of auto-generated parameters")
    lines.append("// Generated by export_to_verilog.py")

    return '\n'.join(lines)


def generate_verilog_params_simple(trees_data, metrics, feature_cols):
    """
    Generate simplified Verilog parameters for RTL consumption.

    This version uses a more compact format suitable for direct RTL use.
    """
    lines = []
    lines.append("//" + "=" * 61)
    lines.append("// AI-DVFS Verilog Parameters - Auto-generated")
    lines.append(f"// Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("//")
    lines.append(f"// Model: GradientBoostingClassifier ({trees_data['n_trees']} trees, depth=6)")
    lines.append(f"// Fixed-point: Q8.8 (16-bit signed, scale=256)")
    lines.append("//")
    lines.append(f"// CV Accuracy: {metrics['cv_mean']:.4f} (+/- {metrics['cv_std']:.4f})")
    lines.append(f"// Final Accuracy: {metrics['final_accuracy']:.4f}")
    lines.append("//" + "=" * 62)
    lines.append("")
    lines.append("`ifndef VERILOG_PARAMS_VH")
    lines.append("`define VERILOG_PARAMS_VH")
    lines.append("")

    # Global constants
    lines.append("// ========================================")
    lines.append("// Configuration Parameters")
    lines.append("// ========================================")
    lines.append(f"`define N_TREES           {trees_data['n_trees']}")
    lines.append(f"`define TREE_DEPTH        6")
    lines.append(f"`define N_FEATURES        {len(feature_cols)}")
    lines.append(f"`define WINDOW_SIZE       8")
    lines.append("")

    # Feature indices
    lines.append("// ========================================")
    lines.append("// Feature Mapping")
    lines.append("// ========================================")
    feature_names_short = ['WORKLOAD', 'MEAN', 'STD', 'DELTA', 'TREND', 'EMA', 'TEMPERATURE', 'HEADROOM', 'EFFICIENCY', 'SHORT_LONG']
    for idx, (feat, short) in enumerate(zip(feature_cols, feature_names_short)):
        lines.append(f"`define F_{short:<12} {idx:2}  // {feat}")
    lines.append("")

    # Class labels
    lines.append("// ========================================")
    lines.append("// DVFS State Labels")
    lines.append("// ========================================")
    lines.append("`define STATE_LOW         2'd0")
    lines.append("`define STATE_MEDIUM      2'd1")
    lines.append("`define STATE_HIGH        2'd2")
    lines.append("")

    # Tree thresholds - compact format
    lines.append("// ========================================")
    lines.append("// Decision Tree Thresholds (Q8.8)")
    lines.append("// Format: THRESH_<TREE>_<NODE> = 16'h<HEX>")
    lines.append("// ========================================")

    for class_idx, class_trees in enumerate(trees_data['trees']):
        class_name = ['LOW', 'MEDIUM', 'HIGH'][class_idx]
        lines.append("")
        lines.append(f"// --- Class {class_name} Trees ---")

        for tree_idx, tree in enumerate(class_trees):
            lines.append(f"// Tree {tree_idx} (class={class_idx}):")
            n_nodes = tree['node_count']

            for node_idx in range(n_nodes):
                feature_idx = tree['features'][node_idx]
                threshold = tree['thresholds'][node_idx]
                left_child = tree['children_left'][node_idx]
                right_child = tree['children_right'][node_idx]

                if left_child != -1:  # Internal node
                    thresh_q = to_q8_8(threshold)
                    thresh_hex = q8_8_to_hex(thresh_q)

                    lines.append(f"`define THRESH_T{tree_idx}_N{node_idx:2d}  16'h{thresh_hex}  // f{feature_idx} t={threshold:6.2f} L={left_child} R={right_child}")

    # Leaf values
    lines.append("")
    lines.append("// ========================================")
    lines.append("// Leaf Values (Q8.8)")
    lines.append("// Format: LEAF_<TREE>_<NODE> = 16'h<HEX>")
    lines.append("// ========================================")

    for class_idx, class_trees in enumerate(trees_data['trees']):
        class_name = ['LOW', 'MEDIUM', 'HIGH'][class_idx]
        lines.append(f"// Class {class_name}:")

        for tree_idx, tree in enumerate(class_trees):
            n_nodes = tree['node_count']

            for node_idx in range(n_nodes):
                left_child = tree['children_left'][node_idx]
                if left_child == -1:  # Leaf
                    leaf_val = tree['values'][node_idx][0][0]
                    leaf_q = to_q8_8(leaf_val)
                    leaf_hex = q8_8_to_hex(leaf_q)

                    lines.append(f"`define LEAF_T{tree_idx}_N{node_idx:2d}_C{class_idx}  16'h{leaf_hex}  // v={leaf_val:7.3f}")

    lines.append("")
    lines.append("`endif // VERILOG_PARAMS_VH")
    lines.append("")
    lines.append("// End of auto-generated parameters")

    return '\n'.join(lines)


def main():
    print("=" * 60)
    print("Export Trained Model to Verilog Parameters")
    print("=" * 60)

    # Feature columns (must match training)
    feature_cols = [
        'f0_workload', 'f1_mean', 'f2_std', 'f3_delta', 'f4_trend',
        'f5_ema', 'f6_temperature', 'f7_headroom', 'f8_efficiency', 'f9_short_long'
    ]

    # Load model and metrics
    print("\n[1/4] Loading trained model...")
    model = load_model()

    print("\n[2/4] Loading metrics...")
    metrics = load_metrics()

    # Extract tree parameters
    print("\n[3/4] Extracting tree parameters...")
    trees_data = extract_tree_params(model)
    print(f"       Extracted {trees_data['n_trees']} trees per class")
    print(f"       {trees_data['n_classes']} classes")

    # Generate Verilog header
    print("\n[4/4] Generating Verilog parameters...")

    # Create output directory
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    # Generate simplified version (more practical for RTL)
    verilog_content = generate_verilog_params_simple(trees_data, metrics, feature_cols)

    # Save to software/outputs
    output_path = os.path.join(OUTPUT_DIR, 'verilog_params.vh')
    with open(output_path, 'w') as f:
        f.write(verilog_content)
    print(f"[INFO] Saved to {output_path}")

    # Copy to hardware/rtl/common if directory exists
    if os.path.exists(HARDWARE_OUTPUT_DIR):
        hardware_path = os.path.join(HARDWARE_OUTPUT_DIR, 'verilog_params.vh')
        with open(hardware_path, 'w') as f:
            f.write(verilog_content)
        print(f"[INFO] Copied to {hardware_path}")
    else:
        print(f"[WARN] Hardware directory {HARDWARE_OUTPUT_DIR} not found")

    # Print summary
    print("\n" + "=" * 60)
    print("Export Summary")
    print("=" * 60)
    print(f"  Model: GradientBoostingClassifier")
    print(f"  Trees per class: {trees_data['n_trees']}")
    print(f"  Classes: {trees_data['n_classes']}")
    print(f"  Features: {len(feature_cols)}")
    print(f"  Fixed-point: Q8.8")
    print(f"  CV Accuracy: {metrics['cv_mean']:.4f} (+/- {metrics['cv_std']:.4f})")
    print(f"  Final Accuracy: {metrics['final_accuracy']:.4f}")
    print("\n[OK] Verilog parameters exported successfully!")
    print("=" * 60)


if __name__ == '__main__':
    main()
