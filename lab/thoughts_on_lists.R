# TODO:   Comments on lists.
# 
# Author: Miguel Alvarez
################################################################################

x <- list(output=list(
		html_document=list(
				toc="true",
				toc_float="true"),
		word_document=list(
				fig_caption="false")))

unlist(x)

y <- list("header-includes"=c(
				"- \\usepackage[utf8]{inputenc}",
				"- \\usepackage[T1]{fontenc}"))
unlist(y)



