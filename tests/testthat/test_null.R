test_that("body can be set to NULL", {
  my_document <- read_rmd(
    file = file.path(path.package("yamlme"), "inst/taxlistjourney.Rmd"),
    skip_head = TRUE
  )
  
  my_document <- update(my_document,
                        title = "A journey in rOpenSci",
                        author = "Miguel Alvarez",
                        output = "html_document"
  )
  
  # Set body to NULL explicitly
  my_document$body <- NULL
  
  # Check that the body is NULL
  expect_null(my_document$body)
  
  # Check that header elements are still present and unchanged
  expect_equal(my_document$header$title, "A journey in rOpenSci")
  expect_equal(my_document$header$author, "Miguel Alvarez")
  expect_equal(my_document$header$output, "html_document")
})
