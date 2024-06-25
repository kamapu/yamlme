test_that("as works correctly", {
  example_doc <- list(
    title = "To yamlme, or not to yamlme",
    author = "John Doe",
    output = "html_document",
    body = txt_body(
      "# To yamlme, or not to yamlme. That is the question.",
      "* just a test"
  ))
  
  example_doc <- as(example_doc, "rmd_doc")
  expect_s3_class(example_doc, "rmd_doc")
  
  example_doc <- as(example_doc, "list")
  expect_s3_class(example_doc, "list")
})