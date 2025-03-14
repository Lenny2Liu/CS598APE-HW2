#!/bin/bash

datasets=("diabetes" "cancer" "housing")

# Print table header
printf "%-10s %15s\n" "Dataset" "Time (sec)"
for ds in "${datasets[@]}"
do
   # Run the benchmark and capture output
   output=$(./genetic_benchmark "$ds")
   # Extract the running time using grep and awk
time_val=$(echo "$output" | grep -E "Time\(Symbolic (Regression|Classification) \(End-to-End\)\)" | awk -F"=" '{print $2}' | awk '{print $1}')
   printf "%-10s %15s\n" "$ds" "$time_val"
done
