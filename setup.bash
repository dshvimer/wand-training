#!/bin/bash

if [ ! -d "models/" ]; then
  git clone https://github.com/tensorflow/models.git
  cd models/research/
  protoc object_detection/protos/*.proto --python_out=.
  cd ../../
fi

if [ ! -d "cocoapi/" ]; then
  git clone https://github.com/cocodataset/cocoapi.git
  cd cocoapi/PythonAPI
  make
  cp -r pycocotools ../../models/research/
  cd ../../
fi

cd data/
wget http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v2_coco_2018_03_29.tar.gz
tar -xvf ssd_mobilenet_v2_coco_2018_03_29.tar.gz
cd ../

cd models/research/
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
python object_detection/builders/model_builder_test.py
