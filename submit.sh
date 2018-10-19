#!/bin/sh
sbatch -o output.txt -e output.txt --job-name=encodedecodelinkpredict run-train_slurm.sh
