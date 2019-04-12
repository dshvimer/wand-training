#!/bin/bash

export PYTHONPATH=$PYTHONPATH:models/research/:models/research/slim/

python create_tfrecord.py
                     
