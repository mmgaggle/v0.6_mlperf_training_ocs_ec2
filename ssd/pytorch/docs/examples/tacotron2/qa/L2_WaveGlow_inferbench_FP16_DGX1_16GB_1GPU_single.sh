#!/bin/bash

set -e

## uncomment to generate new baseline; will be created in qa/baselines/ ##
## python inference_perf.py -m Tacotron2 -bs=20 --input-text qa/text_padded.pt  --create-benchmark

python inference_perf.py -m WaveGlow -bs=1 --fp16-run --input-mels qa/mel_padded.pt
python qa/check_curves.py \
    -b qa/waveglow_fp16-infer-bs1.json \
    WaveGlow_infer_BS1_FP16_DGX1_16GB_1GPU_single.json \
    -g "iter" \
    -k "items_per_sec" \
    --eps 0.001 \
    --damping 1 \
    --sigma 60.0 \
    --fail low
