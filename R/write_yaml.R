


write_yaml <- function(..., doc_body, file) {
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
	OUT <- c("---\n", Head_print, "---\n")
	return(OUT)
}







Test <- write_yaml(
		title="References and Plant Communities in 'SWEA-Dataveg'",
		author="Miguel Alvarez",
		"header-includes"=c(
				"- \\usepackage[utf8]{inputenc}",
				"- \\usepackage[T1]{fontenc}","- \\usepackage{bibentry}",
				"- \\usepackage{hyperref}","- \\nobibliography*"
						)
)
cat(Test)

Head <- list(
		title="References and Plant Communities in 'SWEA-Dataveg'",
		author="Miguel Alvarez"
		)