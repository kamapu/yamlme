#' @name print
#' 
#' @title Print Method for rmd_doc
#' 
#' @description 
#' Quick display for `rmd_doc` objects.
#' 
#' @param x An object of class `rmd_doc`.
#' @param maxlines An integer value indicating the number of lines used for the
#'     display. Longer documents will be truncated.
#' @param ... Further arguments passed among methods (not yet in use).
#' 
#' @return 
#' A display of the resulting R-Markdown document in the console.
#' 
#' @method print rmd_doc
#' @export
#' 
print.rmd_doc <- function(x, maxlines = 15, ...) {
	x <- paste0(c("---\n", write_yaml(x$header), x$append,
			"---\n\n", x$body, "\n"), collapse = "")
	if(length(x) > maxlines)
		cat(x[1:maxlines], "\n", "[...truncated]\n") else cat(x)
}
