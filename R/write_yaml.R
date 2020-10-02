#' @name write_yaml
#' 
#' @title Writing yaml headers
#' 
#' @description 
#' This function generates yaml headers and Rmarkdown files by including the
#' settings as arguments of the function.
#' Comments and pieces of header can be also added through the argument
#' `append`.
#' 
#' @param ... Named arguments to be inserted in the yaml head. At the moment
#'     only vectors are implemented (length 1 or higher), but the concept may
#'     also consider lists for complex tags.
#' @param append A piece of code to be appended in the head. For instance, it
#'     can contain commented code.
#' @param body The content of the document that will be inserted after the head.
#' @param filename A character value with the name of the file to be written
#'     (usually a *.Rmd file). If missing, no file will be written by the
#'     function.
#' 
#' @export write_yaml
#' 
write_yaml <- function(..., append, body="", filename) {
	Head <- list(...)
	Head_print <- character()
	for(i in 1:length(Head)) {
		# Vectors with one value
		if(is.vector(Head[[i]]) & length(Head[[i]]) == 1) {
			Head_print[i] <- paste0(names(Head)[i], ": ", Head[[i]], "\n")
		}
		# Longer vectors
		if(is.vector(Head[[i]]) & length(Head[[i]]) > 1) {
			Head_print[i] <- paste0(names(Head)[i], ":\n  ",
					paste0(Head[[i]], collapse="\n  "), "\n")
		}
	}
	# Append
	if(!missing(append))
		Head_print <- c(Head_print, "\n", append)
	OUT <- c("---\n", Head_print, "---\n\n", body, "\n")
	# Write output file
	if(!missing(filename)) {
		con <- file(filename, "wb")
		writeBin(charToRaw(Head_print),
				con, endian="little")
		close(con)
	}
	# Return strings
	return(OUT)
}
