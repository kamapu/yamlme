context("reading r-markdown")

test_that("read_rmd is working", {
			file <- file.path(path.package("yamlme"), "taxlistjourney.Rmd")
			expect_is(read_rmd(file), "character")
		})
