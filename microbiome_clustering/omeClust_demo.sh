#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DATA_PATH="$SCRIPT_DIR/data/dist_4_0.001_4_200.txt"
META_PATH="$SCRIPT_DIR/data/truth_4_0.001_4_200.txt"
OUTPUT_PATH"$SCRIPT_DIR/output"

echo(OUTPUT_PATH)

omeClust -i DATA_PATH --metadata META_PATH -o OUTPUT_PATH --plot
