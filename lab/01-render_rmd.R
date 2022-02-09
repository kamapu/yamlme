# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

devtools::install_github("kamapu/yamlme", ref = "recursive-experiment")

library(yamlme)
## library(rlist)

setwd("lab")

filename <- "taxlistjourney.Rmd"
file.copy(from=file.path(path.package("yamlme"), filename), to=filename)

## Render the file with rmarkdown::render()
render_rmd(filename, output_file="example")
browseURL("example.html")

## Render the file with yamlme
text_document <- read_rmd(filename)

text_document <- update(text_document, title="my title", author="my name",
    output="html_document")

render_rmd(text_document, output_file="example2")
browseURL("example2.html")

my_document <- write_rmd(
    title = "Sample Document", author = "Miguel Alavarez",
    output = "pdf_document",
    body = txt_body(
        "# Intro",
        "",
        "This is just an example."), filename = "ex2.Rmd")
render_rmd(my_document, output_file = "ex2")


cat(unlist(my_document))

## Arguments
input = my_document
output_file = "ex2"
delete_rmd = TRUE

temp_file
delete_temp




