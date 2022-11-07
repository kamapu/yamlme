context("Testing alternative header elements")

test_that("Internal write_yaml works", {

  # short vector
  my_document <- write_rmd(title = "My first document")
  result <- evaluate_promise(my_document, print = TRUE)
  expect_equal(grepl("---", result$output), TRUE)

  # vertical line vector
  my_document <- write_rmd(description = c(
    "|",
    "This text starts with a vertical line",
    "and will be thus used as a description",
    "in the head."
  ))
  result <- evaluate_promise(my_document, print = TRUE)
  expect_equal(grepl("---", result$output), TRUE)

  # dash line vector
  the_title <- "Introduction to this package"
  my_document <- write_rmd(author = c(
    "- name: Miguel Alvarez",
    "url: https://kamapu.github.io/",
    "- name: Bisrat H. Gebrekhidan"
  ))
  result <- evaluate_promise(my_document, print = TRUE)
  expect_equal(grepl("---", result$output), TRUE)

  # list
  my_document <- write_rmd(output = list(pdf_document = "default"))
  result <- evaluate_promise(my_document, print = TRUE)
  expect_equal(grepl("---", result$output), TRUE)
})
