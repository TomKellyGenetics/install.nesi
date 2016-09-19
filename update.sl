#!/bin/bash
#SBATCH -A uoo00010
#SBATCH -J update_pkg
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kelsi602@student.otago.ac.nz
#SBATCH --ntasks 1
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --mem-per-cpu=2G
module load R/3.3.0-intel-2015a
srun Rscript update.R "$@"

