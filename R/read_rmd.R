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
#' @param append Character value passed to function [read_rmd()].
#' @param ... Arguments passed by `read_rmd()` to [readLines()].
#'     In `txt_body()` they are character values passed to `c()`.
#' @param skip_head Logical value indicating whether the yaml head should be
#'     skip or not (this argument is not used at the moment).
#' 
#' @return 
#' An object of class `rmd_doc` by the function `read_rmd()`. The function
#' `txt_body()` retrieves a character vector suitable for the parameter `body`
#' in the function [write_rmd()].
#' 
#' @examples
#' \dontrun{
#' ## Read pre-installed example
#' ex_document <- read_rmd(file.path(path.package("yamlme"),
#'     "taxlistjourney.Rmd"))
#' 
#' ## Include this document as body
#' my_document <- write_rmd(
#' 		title = "A journey in rOpenSci",
#' 		author = "Miguel Alvarez",
#' 		output = "html_document",
#' 		body = ex_document)
#' }
#' 
#' @export read_rmd
#' 
read_rmd <- function(file, ..., append = "# document imported by 'read_rmd'",
		skip_head = TRUE) {
	file <- txt_body(readLines(file, ...))
	## TODO: This code can be recycled in later versions
	## if(skip_head) {
	##     if(substr(file[1], 1, 3) != "---")
	##         message("Rmd file seems to be headless") else {
	##         idx <- cumsum(grepl("---", file, fixed=TRUE))
	##         file <- file[-c(1:(sum(idx[idx == 1]) + 1))]
	##     }
	## }
	# Original header is lost
	message(paste("The yaml-header is not imported by this fucnion.",
					"Use 'update()' to re-write the header."))
	# Skip yaml-header from body
	if(substr(file[1], 1, 3) != "---")
		message("Rmd file seems to be headless") else {
		idx <- cumsum(grepl("---", file, fixed=TRUE))
		file <- file[-c(1:(sum(idx[idx == 1]) + 1))]
	}
	# Use write_rmd
	# TODO: Later versions may use 'update_rmd()' instead
	return(write_rmd(..., append = append, body = file))
}

#' @aliases txt_body
#' @rdname read_rmd
#' 
#' @export txt_body
#' 
txt_body <- function(...) {
	return(paste0(c(...), "\n"))
}
