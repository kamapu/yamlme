#' @name write_yaml
#' 
#' @title Write yaml entries
#' 
#' @description 
#' Internal function for a proper rendering of yaml entry classes as arguments
#' in [write_rmd()].
#' 
#' @param x Either a vector or a list.
#' @param ... Further arguments passed among methods.
#' 
#' @keywords internal
## S3 generic
write_yaml <- function (x, ...) {
	UseMethod("write_yaml", x)
}

#' @keywords internal
## short vector method
write_yaml.vector_s <- function(x, ...) {
	paste0(x, "\n")
}

#' @keywords internal
## vertical line vector method
write_yaml.vector_vl <- function(x, ...) {
	x[1] <- paste0(x[1], "\n")
	for(i in seq_along(x)[-1])
		x[i] <- paste0("  ", x[i], "\n")
	return(x)
}

#' @keywords internal
## dash vector method
write_yaml.vector_d <- function(x, ...) {
	for(i in seq_along(x))
		if(substr(x[i], 1, 1) == "-") x[i] <- paste0("  ", x[i], "\n") else
			x[i] <- paste0("  ", "  ", x[i], "\n")
	return(c("\n", x))
}

#' @keywords internal
## assign classes to the leaves of the list
leaf_class <- function(x) {
  if(is.list(x)) lapply(x, leaf_class)
  else assign_class(x)
}

#' @keywords internal
## write_yaml applied to the leaves of the list
leaf_write <- function(x, depth = 0) {
  if(is.list(x)) lapply(x, leaf_write)
  else write_yaml(x, depth)
}

#' @keywords internal
## Get a vector of names according to the depth of a leaf
get_names <- function(x, s = NULL) {
  if (!is.list(x)) {
    return(s)
  }
  nms <- names(x)
  if (is.null(nms)) {
    nms <- character(length(x))
  }
  Map(get_names, x = x, s = Map(c, list(s), nms))
}

#' @keywords internal
## default function for lists
write_yaml.default <- function(x, ...) {
  x <- leaf_class(x)
  x <- leaf_write(x)
  l_names <- get_names(x)
  for(i in c("x", "l_names"))
    assign(i, list.flatten(get(i)))
  for(i in 1:length(x)) {
    indent <- character(0)
    for (j in 1:length(l_names[[i]]))
      indent[j] <- paste0(rep("  ", times = j - 1), collapse = "")
    indent <- c(indent, rep(indent[length(indent)],
            times = length(x[[i]]) - 1))
    x[[i]] <- paste0(indent, c(paste0(l_names[[i]], ": ", x[[i]][1]),
            x[[i]][-1]))
  }
  x <- do.call(c, x)
  return(x)
}
