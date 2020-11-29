#' @name write_yaml
#' 
#' @title Write yaml entries
#' 
#' @description 
#' Internal function for a proper rendering of yaml entry classes as arguments
#' in [write_rmd()].
#' 
#' @param x Either a vector or a list.
#' @param depth Hierarchical depth in lists.
#' @param ... Further arguments passed among methods.
#' 
#' @keywords internal
#' 
# S3 generic
write_yaml <- function (x, ...) {
	UseMethod("write_yaml", x)
}

#' @keywords internal
#' 
# short vector method
write_yaml.vector_s <- function(x, ...) {
	paste0(x, "\n")
}

#' @keywords internal
#' 
# vertical line vector method
write_yaml.vector_vl <- function(x, depth=1) {
	x[1] <- paste0(x[1], "\n")
	for(i in 2:length(x))
		x[i] <- paste0(rep("  ", depth), x[i], "\n")
	return(x)
}

#' @keywords internal
#' 
# dash vector method
write_yaml.vector_d <- function(x, depth=1) {
	for(i in 1:length(x))
		if(substr(x[i], 1, 1) == "-") x[i] <- paste0(rep("  ", depth), x[i],
					"\n") else
			x[i] <- paste0(rep("  ", depth), "  ", x[i], "\n")
	return(c("\n", x))
}

#' @keywords internal
#' 
# list method
write_yaml.list <- function(x, depth=1) {
	OUT <- character(0)
	for(i in names(x)) {
		if(class(x[[i]]) == "list") {
			OUT <- c(OUT, paste0(i, ":\n"))
			for(j in names(x[[i]]))
				if(class(x[[i]][[j]]) == "list") {
					OUT <- c(OUT, paste0("  ", j, ":\n"))
					for(k in names(x[[i]][[j]])) {
						if(class(x[[i]][[j]][[k]]) == "list") {
							OUT <- c(OUT, paste0("    ", k, ":\n"))
							for(l in names(x[[i]][[j]][[k]])) {
								# replace this part by if else for next depth
								temp <- write_yaml(assign_class(x[[i]][[j]][[
														k]][[l]]),
										depth=depth + 4)
								OUT <- c(OUT, paste0("      ", l, ": ",
												temp[1]), temp[-1])
							## OUT <- c(OUT, paste0("    ", temp))
							}
						}
					}
				} else {
					temp <- write_yaml(assign_class(x[[i]][[j]]),
							depth=depth + 1)
					OUT <- c(OUT, paste0("  ", j, ": ", temp[1]), temp[-1])
				}
		} else {
			temp <- write_yaml(assign_class(x[[i]]), depth=depth)
			OUT <- c(OUT, paste0(i, ": ", temp[1]), temp[-1])
		}
	}
	return(OUT)
}
