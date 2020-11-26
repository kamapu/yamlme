#' @name read_rmd
#' 
#' @title Read R-markdown Documents
#' 
#' @description 
#' This function reads Rmd files into character vectors pasting a line break
#' at the end of each line.
#' 
#' @param file Character value indicating the path and the name to the Rmd file.
#' @param ... Arguments passed to [readLines()].
#' @param skip_head Logical value indicating whether the yaml head should be
#'     skip or not.
#' 
#' @return 
#' A character vector that can be use as `body` in function [write_rmd()].
#' 
#' @export 
#' read_rmd
#' 
read_rmd <- function(file, ..., skip_head=TRUE) {
	file <- paste0(readLines(file, ...), "\n")
	if(skip_head) {
		if(substr(file[1], 1, 3) != "---")
			message("Rmd file seems to be headless") else {
			idx <- cumsum(grepl("---", file, fixed=TRUE))
			file <- file[-c(1:(sum(idx[idx == 1]) + 1))]
		}
	}
	return(file)
}
