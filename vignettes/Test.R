# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################



# Examples
Docu <- write_yaml(
		title="First Function Version",
		author="Miguel Alvarez",
		output="pdf_document")
cat(Docu)

# Add content
Docu <- write_yaml(
		title="First Function Version",
		author="Miguel Alvarez",
		output="pdf_document",
		body="This is a first incursion in Rmarkdown.")
cat(Docu)

# Vector argument
Test <- write_yaml(
		title="References and Plant Communities in 'SWEA-Dataveg'",
		author="Miguel Alvarez",
		"header-includes"=c(
				"- \\usepackage[utf8]{inputenc}",
				"- \\usepackage[T1]{fontenc}")
)
cat(Test)

# Examples with lists
