Installing R packages on NeSI
=========

These scripts are designed to facilitate installation of R software packages on the NeSI Pan Cluster. These take as many packages as inputs as given, allowing the installation of a single package or submission of multiple packages simultaneously.

Installing R packages in the terminal
------------

This installs the packages specified into R from the terminal:

```shell
Rscript  install.R <package1> <package2> <package>
```

Installing R packages via shell scripts
------------

This installs the packages specified into R from the terminal:

```shell
install.sh <package1> <package2> <package>
```

Installing R packages via slurm on the Cluster
------------

This installs CRAN packages specified into R as a slurm job:

```shell
sbatch install.sl <package1> <package2> <package>
```

Bioconductor R Packages via slurm
------------

This installs Bioconductor packages specified into R as a slurm job:

```shell
sbatch install_bioconductor.sl <user1/repo1> <user2/repo2> <user3/repo3>
```

GitHub R packages via slurm
------------

This installs the packages specified into R as a slurm job:

```shell
sbatch install_github.sl <package1> <package2> <package>
```





##Configuring slurm

Note here that you will need to configure slum with the appropriate settings for your account:

```shell
#!/bin/bash
#SBATCH -A <projectID>
#SBATCH -J install_pkg
#SBATCH --mail-type=ALL
#SBATCH --mail-user=<user>@<domain>
#SBATCH --ntasks 1
#SBATCH --cpus-per-task=1
#SBATCH --time=10:00 #expected time to install
#SBATCH --mem-per-cpu=25M #expected memory to install (includes test of loading)
module load R/3.3.0-intel-2015a
srun Rscript install.R "$@"
```
