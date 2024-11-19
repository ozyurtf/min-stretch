#!/bin/bash

DATA_DIR=$PWD/imitation-in-homes/data/extracted

python data-collection/split_train_test.py $DATA_DIR
./get_txt.sh $PWD/imitation-in-homes/data/extracted_val