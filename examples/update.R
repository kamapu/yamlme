## Create a document from a list
my_document <- list(
    title = "Sample Document",
    author = "Miguel Alavarez",
    output = "html_document",
    body = txt_body(
        "# Intro",
        "",
        "This is just an example."
    ))
my_document <- as(my_document, "rmd_doc")
my_document

## Change output format
my_document <- update(my_document, output = "pdf_document")
my_document
