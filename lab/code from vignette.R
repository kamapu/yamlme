# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

# This example may need a code handler


#A similar way is applied in the case of the entries for the element `vignette`
#in a vignette document, hier for convenience the title is first assigned to a
#character value to be recycled in the header.


the_title <- "Introduction to this package"

my_document <- list(
title = the_title,
vignette = c(">",
paste0("%\\VignetteIndexEntry{", the_title, "}"),
"%\\VignetteEngine{knitr::rmarkdown}",
"%\\VignetteEncoding{UTF-8}"))
my_document



