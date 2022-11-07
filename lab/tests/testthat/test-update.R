context("Testing update")

test_that("Updating works", {
  my_document <- write_rmd(
    title = "Sample Document", author = "Miguel Alavarez",
    output = "html_document",
    body = txt_body(
      "# Intro",
      "",
      "This is just an example."
    )
  )
  my_document <- update(my_document, output = "pdf_document")
  result <- evaluate_promise(my_document, print = TRUE)
  expect_equal(grepl("---", result$output), TRUE)
})
