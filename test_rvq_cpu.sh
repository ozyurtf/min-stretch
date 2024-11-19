#!/bin/bash

include_task="Door_Opening"

cd imitation-in-homes
HYDRA_FULL_ERROR=1 python train.py --config-name=train_rvq.yaml include_task=$include_task