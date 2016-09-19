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
	update.packages(dependency, lib=userdir, repos=nz_repo, dependencies = TRUE)
	library(dependency, lib.loc=userdir, character.only = TRUE)
}

if(length(args)==0){
	for(pkg in rownames(installed.packages())){
		required(as.character(pkg))
	}
} else {
	for(pkg in args){
       		required(as.character(pkg))
	}
}
 
