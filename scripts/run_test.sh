#!/usr/bin/env bash

set -eu

rm -rf ./real_results

mkdir ./real_results/
echo "Running parser implementation "
cur_user=$(whoami)
timeout 1200 ./scripts/run.sh http://localhost/wiki/Чемпионат_Европы_по_футболу_2024 ./real_results/result.jsonl
echo "Assessing results"
python ./scripts/compare_results.py ./test_data/result.jsonl ./real_results/result.jsonl
echo "OK"
