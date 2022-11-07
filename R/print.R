# TODO: internal function printing for print and write_rmd
#' @name print2text
#' @title Print content of rmd_doc into a text string
#'
#' @description
#' Content of [rmd_doc-class] objects will be converted into a string that will
#' be passed either to [print()] or to [write_rmd()].
#'
#' @param x Input [rmd_doc-class] object.
#'
#' @keywords internal
print2text <- function(x) {
  if ("header" %in% names(x)) {
    x$header <- paste0(c("---\n", as.yaml(x$header), "---\n\n"),
      collapse = ""
    )
  } else {
    x$header <- paste0(c(
      "---\n", "# No header in this document!\n", "---\n\n"
    ),
    collapse = ""
    )
  }
  if ("body" %in% names(x)) {
    x$body <- paste0(x$body, collapse = "")
  }
  return(do.call(paste0, list(x, collapse = "")))
}

#' @name print
#'
#' @title Print Method for rmd_doc
#'
#' @description
#' Quick display for `rmd_doc` objects. This method also defines the way how
#' objects are displayed in the console.
#'
#' @param x An object of class `rmd_doc`.
#' @param maxlines An integer value indicating the number of lines used for the
#'     display. Longer documents will be truncated.
#' @param ... Further arguments passed among methods (not yet in use).
#'
#' @return
#' A display of the resulting R-Markdown document in the console.
#'
#' @examples
#' ## Document without header
#' my_document <- read_rmd(
#'   file = file.path(path.package("yamlme"), "taxlistjourney.Rmd"),
#'   skip_head = TRUE
#' )
#' my_document
#'
#' ## Add header using update
#' my_document <- update(my_document,
#'   title = "A journey in rOpenSci",
#'   author = "Miguel Alvarez",
#'   output = "html_document"
#' )
#' my_document
#'
#' ## Header only
#' my_document$body <- NULL
#' my_document
#'
#' @method print rmd_doc
#' @aliases print,rmd_doc-method
#' @export
print.rmd_doc <- function(x, maxlines = 10, ...) {
  if ("body" %in% names(x) & length(x$body) > maxlines) {
    x$body <- c(x$body[1:maxlines], "\n[...truncated]\n")
  }
  x <- print2text(x)
  cat(x)
}
