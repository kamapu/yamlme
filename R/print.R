#' @name print
#' 
#' @title Print Method for rmd_doc
#' 
#' @description 
#' Quick display for `rmd_doc` objects. This method also defines the way how
#' objects are displayed in the console.
#' 
#' @param x An object of class `rmd_doc`.
#' @param maxlines An integer value indicating the number of lines used for the
#'     display. Longer documents will be truncated.
#' @param ... Further arguments passed among methods (not yet in use).
#' 
#' @return 
#' A display of the resulting R-Markdown document in the console.
#' 
#' @examples 
#' 
#' ## Create a new document
#' my_document <- write_rmd(
#' 		title = "A journey in rOpenSci",
#' 		author = "Miguel Alvarez",
#' 		output = "html_document",
#' 		body = read_rmd(file.path(path.package("yamlme"),
#' 						"taxlistjourney.Rmd")))
#' my_document
#' 
#' \dontrun{
#' ## Render the document
#' render_rmd(my_document, "taxlistjourney")
#' }
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
