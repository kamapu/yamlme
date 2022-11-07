#' @name write_rmd
#' @rdname write_rmd
#'
#' @title Writing R-Markdown Documents
#'
#' @description
#' This function generates R-Markdown documents by including
#' the settings as arguments of the function.
#' Comments and pieces of header can be also added through the argument
#' `append`.
#'
#' @param object [rmd_doc-class] object used to write an Rmarkdown file. If
#'     header is missing, `write_rmd()` will fail with an error message.
#' @param filename A character value with the name of the file to be written.
#'     If not included, the extension *.Rmd will be appended to this name.
#'     If missing, no file will be written by this function.
#' @param ... Further arguments passed among methods (not yet used).
#'
#' @return
#' A character vector of class `rmd_doc` and, if argument set for parameter
#' `filename`, an Rmd file.
#'
#' @examples
#' \dontrun{
#' my_document <- list(
#'   title = "Sample Document",
#'   author = "Miguel Alavarez",
#'   output = "html_document",
#'   body = txt_body(
#'     "# Intro",
#'     "",
#'     "This is just an example."
#'   )
#' )
#' my_document <- as(my_document, "rmd_doc")
#' write_rmd(my_document, filename = file.path(tempdir(), "example"))
#' }
#'
#' @export
write_rmd <- function(object, ...) {
  UseMethod("write_rmd", object)
}


#' @rdname write_rmd
#' @aliases write_rmd,rmd_doc-method
#' @method write_rmd rmd_doc
#' @export
write_rmd.rmd_doc <- function(object, filename, ...) {
  filename <- paste0(file_path_sans_ext(filename), ".Rmd")
  con <- file(filename, "wb")
  writeBin(
    charToRaw(print2text(object)),
    con
  )
  close(con)
}
