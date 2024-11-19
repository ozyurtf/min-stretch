#!/bin/bash

include_task="Door_Opening"
BATCH_SIZE=50

now_date=$(date '+%Y-%m-%d')
now_time=$(date '+%H-%M-%S')

RVQ_PATH="checkpoints/${now_date}/${include_task}-${include_env}-${now_time}"

cd imitation-in-homes
HYDRA_FULL_ERROR=1 python train.py --config-name=train_rvq.yaml include_task=$include_task model_path=$RVQ_PATH
sleep 10

HYDRA_FULL_ERROR=1 accelerate launch --config_file configs/accelerate/accel_cfg.yaml train.py --config-name=train_vqbet.yaml include_task=$include_task vqvae_load_dir=$RVQ_PATH batch_size=$BATCH_SIZE