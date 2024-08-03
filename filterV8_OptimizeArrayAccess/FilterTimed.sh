#!/bin/bash
start_time=$(date +%s%N)
./filter.exe
end_time=$(date +%s%N)
elapsed=$((end_time - start_time))
echo "Elapsed time: $((elapsed / 1000000)) milliseconds"

# Run this in terminal with: bash FilterTimed.sh
