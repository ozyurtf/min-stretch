#!/bin/bash

include_task="Door_Opening"

cd imitation-in-homes
HYDRA_FULL_ERROR=1 accelerate launch --config_file configs/accelerate/accel_cfg.yaml train.py --config-name=train_vqbet.yaml include_task=$include_task vqvae_load_dir=null