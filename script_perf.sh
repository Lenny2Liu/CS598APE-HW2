#!/bin/bash

# List of datasets
DATASETS=("cancer")  # Add your dataset names here

# Path to FlameGraph tools (adjust if needed)
FLAMEGRAPH_DIR="./FlameGraph"

# Create output directory
mkdir -p perf_results

# Loop through datasets
for dataset in "${DATASETS[@]}"; do
    echo "Running perf for dataset: $dataset"

    # Run perf record
    perf record -F 99 --call-graph fp ./genetic_benchmark "$dataset"

    # Process perf data
    echo "Generating flame graph for $dataset..."
    perf script | "$FLAMEGRAPH_DIR/stackcollapse-perf.pl" > perf_results/"$dataset".folded
    "$FLAMEGRAPH_DIR/flamegraph.pl" perf_results/"$dataset".folded > perf_results/"$dataset"_mf.svg

done

echo "All datasets processed. View flame graphs in the 'perf_results' folder."
