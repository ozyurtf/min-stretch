#!/bin/bash

include_task="Door_Opening"

cd imitation-in-homes
WANDB_MODE=disabled HYDRA_FULL_ERROR=1 python train.py --config-name=train_rvq include_task=$include_task device=cpu