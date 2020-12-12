#' @name assign_class
#' 
#' @title Assigning S3 classes for rendering
#' 
#' @description 
#' This function assess the structure of input vectors or lists in order to use
#' the proper rendering method by [write_yaml()].
#' 
#' @param x A character vector or a list.
#' 
#' @keywords internal
#' 
assign_class <- function(x) {
	if(class(x) == "character") {
		# short vector
		if(length(x) == 1)
			class(x) <- c("vector_s", "character")
		# vertical line vector
		if(length(x) > 1 & (x[1] == "|" | x[1] == ">"))
			class(x) <- c("vector_vl", "character")
		# dash vector
		if(length(x) > 1 & substr(x[1], 1, 1) == "-")
			class(x) <- c("vector_d", "character")
	}
	# Return object
	return(x)
}

#' @keywords internal
#' 
setOldClass(c("vector_s", "character"))

#' @keywords internal
#' 
setOldClass(c("vector_vl", "character"))

#' @keywords internal
#' 
setOldClass(c("vector_d", "character"))
