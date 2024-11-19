#!/bin/bash

include_task="Door_Opening"

cd imitation-in-homes
WANDB_MODE=disabled python train.py --config-name=train_vqbet include_task=$include_task vqvae_load_dir=null device=cpu