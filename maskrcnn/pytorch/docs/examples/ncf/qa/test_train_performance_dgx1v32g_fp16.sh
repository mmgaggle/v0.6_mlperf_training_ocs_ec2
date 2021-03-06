#!/bin/bash
set -e

HARDWARE="DGX_1V_32G"
PRECISION="fp16"

./run.sh

python qa/utils/compare.py --input nvlog.json --baseline ./qa/baseline_results/${HARDWARE}_${PRECISION}.json --key best_train_throughput
