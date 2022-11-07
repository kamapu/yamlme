context("Testing console outputs")

test_that("Summaries are produced", {
  my_document <- write_rmd(
    title = "A journey in rOpenSci",
    author = "Miguel Alvarez",
    output = "html_document",
    body = txt_body("# Intro", "", "This is just an example.")
  )
  result <- evaluate_promise(my_document, print = TRUE)
  expect_equal(grepl("---", result$output), TRUE)
})
