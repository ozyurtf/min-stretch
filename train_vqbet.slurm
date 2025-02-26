#!/bin/bash
#SBATCH --job-name=vqbet
#SBATCH --nodes=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=96GB
#SBATCH --gres=gpu:2
#SBATCH --constraint=rtx8000
#SBATCH --time=24:00:00
#SBATCH --mail-type=END
#SBATCH --output=slurm_%j.out
#SBATCH --error=slurm_%j.err

module purge
port=$(shuf -i 10000-65500 -n 1)
if [[ $(hostname -s) =~ ^g ]]; then nv="--nv"; fi
singularity exec $nv \
            --overlay $SCRATCH/overlay-home-robot-env.ext3:ro \
            /scratch/work/public/singularity/cuda11.8.86-cudnn8.7-devel-ubuntu22.04.2.sif \
            /bin/bash -c "
mamba activate home_robot
cd $SCRATCH/min-stretch
./train_vqbet_model.sh
"