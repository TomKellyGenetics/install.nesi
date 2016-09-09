#!/bin/bash
#SBATCH -A uoo00010
#SBATCH -J install_pkg
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kelsi602@student.otago.ac.nz
#SBATCH --ntasks 1
#SBATCH --cpus-per-task=1
#SBATCH --time=10:00
#SBATCH --mem-per-cpu=25M
module load R/3.1.1-goolf-1.5.14
srun Rscript install_bioconductor.R "$@"

