#!/bin/bash

GHIDRA_ANALYZEHEADLESS_PATH='/mnt/c/Users/kmitchell2/SymLM/dataset_generation/ghidra_10.1.2_PUBLIC/support/analyzeHeadless' # path to ghidra analyzeHeadless executable
GHIDRA_PROJECT_PATH='/mnt/c/Users/kmitchell2/SymLM/dataset_generation/ghidra_10.1.2_PUBLIC/ghidra_project' # path to ghidra project
GHIDRA_PROJECT_NAME='SymLM' # name of ghidra project
BINARY_PATH='/mnt/c/Users/kmitchell2/SymLM/data_bin'  # path to binary
BINARY_ARCHITECTURE='x64' # architecture of binary, options: x86, x64, arm, mips
DATASET_OUTPUT_DIR='/mnt/c/Users/kmitchell2/SymLM/dataset_output' # path to output directory

# generate interprocedural cfg
$GHIDRA_ANALYZEHEADLESS_PATH $GHIDRA_PROJECT_PATH $GHIDRA_PROJECT_NAME -import $BINARY_PATH -readOnly -postScript ./get_calling_context.py

# generate dataset
python3.6 ./prepare_dataset.py \
    --output_dir $DATASET_OUTPUT_DIR \
    --input_binary_path $BINARY_PATH \
    --arch $BINARY_ARCHITECTURE
