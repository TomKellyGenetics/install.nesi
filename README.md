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

Note that for installing from a private github repo you will need to add you personal access token (PAT) as the `auth_token` argument in `install_github.sl`.



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

The default settings here are to facilitate rapid queued installations for installing small packages. Note however that installing a package includes loading the data included and may require more memory, particularly for bioconductor packages.

##Installed packages

Packages will be installed in a personal library under your nesi user account if they are not included in the R module you have requested in the slurm file. Note that if you installing large packages (e.g., annotation packages on Bionconductor) this will be limited by your user quote, not your project, and you may need to request an increase in user disk quota from support@nesi.org.nz.

You can get a complete list of the personal packages you have installed (for a particular version of R) under `~/R`. For instance:

```shell
ls /home/<user.name>/R/x86_64-pc-linux-gnu-library/3.3
```


###Source

Based on functions provided by NeSI (Markus Binsteiner):

* https://github.com/nesi/r-dependencies/blob/develop/dependencies/R/dependencies.R
