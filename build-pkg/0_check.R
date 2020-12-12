# TODO:   Working script for testing the package 'taxlist'
# 
# Author: Miguel Alvarez
################################################################################

# Needed packages
library(devtools)
library(covr)
#library(goodpractice)
library(rmarkdown)
library(knitr)
library(pkgdown)

# Document package
document()

# At first commit
## use_travis()
## use_coverage(type=c("codecov"))

# Report coverage
report()

# Carry out the tests
## test()

# Write data set
## source("data-raw/Easplist/Easplist.R")

# Purl vignette R-code
## purl("vignettes/taxlist-intro.Rmd", "vignettes/taxlist-intro.R")

# Check application of good practices
## gp()

# Build package
pkg_loc <- build(path="build-pkg")

# Test the package
## Sys.setenv(LANG="en_US.iso88591")
Sys.setlocale("LC_ALL", "en_US.iso88591")
Sys.setenv('_R_CHECK_SYSTEM_CLOCK_' = 0)
check_built(path=pkg_loc)

# After check ------------------------------------------------------------------

# Render readme-file.
render("README.Rmd")

# Render package-site
usethis::use_pkgdown()
pkgdown::build_site(preview=FALSE)

# Copy site
file.copy("docs", "../kamapu.github.io/rpkg", recursive = TRUE)
unlink("docs", recursive=TRUE)
file.rename("../kamapu.github.io/rpkg/docs", "../kamapu.github.io/rpkg/yamlme")

render_site("../kamapu.github.io/")

# Build manual
## build_manual(path="build-pkg")

# Install the package
## install()
