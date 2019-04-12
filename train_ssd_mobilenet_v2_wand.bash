#!/bin/bash

export PYTHONPATH=$PYTHONPATH:models/research/:models/research/slim/

python model_main.py --model_dir=./ssd_mobilenet_v2_wand \
                     --pipeline_config_path=./data/ssd_mobilenet_v2_wand.config
