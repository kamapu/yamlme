## Document without header
my_document <- read_rmd(
  file = file.path(path.package("yamlme"), "taxlistjourney.Rmd"),
  skip_head = TRUE
)
my_document

## Add header using update
my_document <- update(my_document,
  title = "A journey in rOpenSci",
  author = "Miguel Alvarez",
  output = "html_document"
)
my_document

## Header only
my_document$body <- NULL
my_document
