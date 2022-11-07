context("working with different classes")

test_that("Rendering is happening", {
  expect_is(write_rmd(name = "Miguel Alvarez"), "rmd_doc")
  expect_is(write_rmd(description = c(
    "|",
    "This is an abstract for instance",
    "which may be longer..."
  )), "rmd_doc")
  expect_is(write_rmd(output = list(pdf_document = "default")), "rmd_doc")
  expect_is(
    write_rmd(output = list(
      pdf_document =
        list(citation_package = "natbib")
    )),
    "rmd_doc"
  )
  expect_is(
    write_rmd(
      "header-includes" =
        c(
          "- \\usepackage[utf8]{inputenc}",
          "- \\usepackage[T1]{fontenc}",
          "- \\usepackage{bibentry}",
          "- \\nobibliography{sweareferences.bib}"
        )
    ),
    "rmd_doc"
  )
})
