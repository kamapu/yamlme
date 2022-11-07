#' @name read_rmd
#' @rdname read_rmd
#'
#' @title Read R-markdown Documents
#'
#' @description
#' Import Rmd files into objects of class [rmd_doc-class].
#'
#' The function `txt_body()` add a line break at the end of each element of a
#' character vector considering them as single lines.
#'
#' Note that comments will be deleted in the input file.
#'
#' @param file Character value indicating the path and the name to the Rmd file.
#' @param ... Arguments passed by `read_rmd()` to [readLines()].
#'     In `txt_body()` they are character values passed to `c()`.
#' @param skip_head Logical value indicating whether the yaml head should be
#'     skip or not (this argument is not used at the moment).
#'
#' @return
#' The function `read_rmd()` returns a [rmd_doc-class] object.
#' The function `txt_body()`, a character vector suitable for the parameter
#' `body` in the function [write_rmd()].
#'
#' @examples
#' \dontrun{
#' ## Read pre-installed example
#' ex_document <- read_rmd(file.path(
#'   path.package("yamlme"),
#'   "taxlistjourney.Rmd"
#' ))
#' }
#' @export
read_rmd <- function(file, ..., skip_head = FALSE) {
  file <- txt_body(readLines(file, ...))
  if (substr(file[1], 1, 3) != "---") {
    message("Rmd file seems to be headless")
    yaml_head <- list(body = file)
  } else {
    idx <- cumsum(grepl("---", file, fixed = TRUE))
    yaml_head <- list(header = yaml.load(paste0(file[idx == 1], collapse = "")))
    yaml_head$body <- file[idx > 1][-1]
  }
  if (skip_head) {
    yaml_head$header <- NULL
  }
  class(yaml_head) <- c("rmd_doc", "list")
  return(yaml_head)
}

#' @aliases txt_body
#' @rdname read_rmd
#' @export txt_body
txt_body <- function(...) {
  return(paste0(c(...), "\n"))
}
