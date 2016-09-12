args = commandArgs(trailingOnly=TRUE)

"required"<-
function(dependency)
{

	nz_repo <- 'http://cran.stat.auckland.ac.nz'
	userdir <- unlist(strsplit(Sys.getenv("R_LIBS_USER"),.Platform$path.sep))[1L]

	if (!file.exists(userdir)) {
	  if (!dir.create(userdir, recursive = TRUE)) {
	     stop("Unable to create ", sQuote(userdir))
	       }
	 }

    # install package
    if(dependency %in% rownames(installed.packages()) == FALSE) {
               install.packages(dependency, lib=userdir, repos=nz_repo, dependencies = TRUE)
               library(dependency, lib.loc=userdir, character.only = TRUE)
        } else {
               print(paste("Package already installed: ", dependency))
        }

}


"required_github"<-
function(dependency)
{

	nz_repo <- 'http://cran.stat.auckland.ac.nz'
	userdir <- unlist(strsplit(Sys.getenv("R_LIBS_USER"),.Platform$path.sep))[1L]

	if (!file.exists(userdir)) {
	  if (!dir.create(userdir, recursive = TRUE)) {
	     stop("Unable to create ", sQuote(userdir))
	       }
	 }

    # install package
    if(dependency %in% rownames(installed.packages()) == FALSE) {
              install_github(dependency,lib=userdir, siteRepos=nz_repo, dependencies = TRUE)
              library(strsplit(dependency, split="/")[[1]][2], lib.loc=userdir, character.only = TRUE)
        } else {
               print(paste("Package already installed: ", dependency))
        }

}

required("devtools")
library("devtools")

for(pkg in args){
    required_github(as.character(pkg))
}
