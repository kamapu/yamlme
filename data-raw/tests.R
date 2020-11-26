# TODO:   Applications to buid test suite
# 
# Author: Miguel Alvarez
################################################################################

# Install package
library(devtools)
install_github("kamapu/yamlme")

library(yamlme)

# Test write_rmd
z <- write_rmd(name="Miguel Alvarez")
cat(z)

# vertical line vector
z <- write_rmd(description=c("|", "This is an abstract for instance",
				"which may be longer..."))
cat(z)

# List in list
z <- write_rmd(output=list(pdf_document="default"))
cat(z)

# nested lists
z <- write_rmd(output=list(pdf_document=list(citation_package="natbib")))
cat(z)

# nested and dashed
z <- write_rmd("header-includes"=c("- \\usepackage[utf8]{inputenc}",
				"- \\usepackage[T1]{fontenc}", "- \\usepackage{bibentry}",
				"- \\nobibliography{sweareferences.bib}"))
cat(z)

# Own example
z <- write_rmd(
		title="References and Plant Communities in 'SWEA-Dataveg'",
		author="Miguel Alvarez",
		date="Dezember 28, 2019",
		"header-includes"=c("- \\usepackage[utf8]{inputenc}",
				"- \\usepackage[T1]{fontenc}", "- \\usepackage{bibentry}",
				"- \\nobibliography{sweareferences.bib}"),
		output=list(pdf_document=list(citation_package="natbib")),
		"biblio-style"="unsrtnat",
		bibliography="sweareferences.bib",
		papersize="a4",
		body=c("# Introduction\n", "\n", "This is my awesome text\n"))
cat(z)

# Template as a function
my_template <- function(
		title="Text from template",
		author="Miguel Alvarez",
		output="html_document",
		body=c("# Introduction\n", "\n", "Hello world\n"),
		...) {
	write_rmd(title=title, author=author, output=output, body=body, ...)
}

cat(my_template())

# modification of template
cat(my_template(author=c("- name: Miguel Alvarez",
						"url: https://kamapu.github.io/",
						"- name: Bisrat H. Gebrekhidan"),
				date="November 25, 2020",
				output="pdf_document"))
