#!/bin/bash
#SBATCH --job-name=GCNcomplex
#SBATCH --time=24:00:00
#SBATCH --mem=40G
#SBATCH --partition=gpu
#SBATCH -N 2

module load cmake/3.11.1
module load python/3.6.1
module load pythondev/3.6-py36
module load keras/2.1.3-py36
module load intel-cc/17.0.2.174

export MKL_THREADING_LAYER=GNU
export CUDA_VISIBLE_DEVICES=1

DATASET="FB15k"
SETTINGS="gcn_basis.exp"
TRAIN_PATH="code/train.py"
DATASET_PATH="data/"$DATASET
SETTINGS_PATH="settings/"$SETTINGS
ARGUMENT_STRING="--settings "$SETTINGS_PATH" --dataset "$DATASET_PATH

virtualenv --python=python3.6 .
source "bin/activate"
pip install -r requirements.txt
python -u $TRAIN_PATH $ARGUMENT_STRING
deactivate
