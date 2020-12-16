#' @name update
#' 
#' @title Update an rmd_doc
#' 
#' @description 
#' Alternative to modify settings and content in `rmd_doc` objects.
#' 
#' @param object An object of class `rmd_doc`.
#' @param ... Named arguments to be inserted in the YAML header (passed to
#'     [write_rmd()]).
#' @param append A piece of code to be appended in the header (passed to
#'     [write_rmd()]).
#' @param body The content of the document that will be inserted after the
#'     header (passed to
#'     [write_rmd()]).
#' 
#' @method update rmd_doc
#' @export
#' 
update.rmd_doc <- function(object, ..., append, body) {
	if(!missing(append))
		object$append <- append
	if(!missing(body))
		object$body <- body
	new_values <- list(...)
	for(i in names(new_values))
		object$header[[i]] <- new_values[[i]]
	invisible(object)
}
