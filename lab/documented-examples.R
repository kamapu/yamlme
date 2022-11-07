# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(yamlme)

# write_rmd
my_document <- list(
  title = "Sample Document",
  author = "Miguel Alavarez",
  output = "html_document",
  body = txt_body(
    "# Intro",
    "",
    "This is just an example."
  )
)
my_document <- as(my_document, "rmd_doc")
write_rmd(my_document, filename = file.path(tempdir(), "example"))


