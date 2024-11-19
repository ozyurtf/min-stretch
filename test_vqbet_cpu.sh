#!/bin/bash

include_task="Door_Opening"

cd imitation-in-homes
python train.py --config-name=train_vqbet.yaml include_task=$include_task vqvae_load_dir=null