#' @name read_rmd
#' @rdname read_rmd
#' 
#' @title Read R-markdown Documents
#' 
#' @description 
#' The function `read_rmd()` reads Rmd files into character vectors pasting a
#' line break at the end of each line.
#' The function `txt_body()` will do the same to one or more character vectors.
#' 
#' @param file Character value indicating the path and the name to the Rmd file.
#' @param ... Arguments passed by `read_rmd()` to [readLines()].
#'     In `txt_body()` they are character values passed to `c()`.
#' @param skip_head Logical value indicating whether the yaml head should be
#'     skip or not.
#' 
#' @return 
#' A character vector that can be use as `body` in function [write_rmd()].
#' 
#' @examples
#' \dontrun{
#' Doc <- read_rmd(file.path(path.package("yamlme"), "taxlistjourney.Rmd"))
#' }
#' 
#' @export read_rmd
#' 
read_rmd <- function(file, ..., skip_head=TRUE) {
	file <- txt_body(readLines(file, ...))
	if(skip_head) {
		if(substr(file[1], 1, 3) != "---")
			message("Rmd file seems to be headless") else {
			idx <- cumsum(grepl("---", file, fixed=TRUE))
			file <- file[-c(1:(sum(idx[idx == 1]) + 1))]
		}
	}
	return(file)
}

#' @aliases txt_body
#' @rdname read_rmd
#' 
#' @export txt_body
#' 
txt_body <- function(...) {
	return(paste0(c(...), "\n"))
}
