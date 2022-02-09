# TODO:   Working script for testing the package 'taxlist'
# 
# Author: Miguel Alvarez
################################################################################

# Check
library(rmarkdown)
library(devtools)
library(qpdf)
library(styler)

# Automatic styling
style_pkg()

# document package
document()

# clean built package and manual
Folder <- "build-pkg"
Files <- list.files(Folder, ".tar.gz|.pdf")
unlink(file.path(Folder, Files))

# Re-build package and manual
pkg_loc <- build(path = Folder, args = "--resave-data")
build_manual(path = Folder)

# common check
check_built(path = pkg_loc)

# Special steps ----------------------------------------------------------------
install()
