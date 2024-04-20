#' @name render_rmd
#'
#' @title Render documents from object
#'
#' @description
#' This function is a wrapper of [rmarkdown::render()] and will also work with
#' file names but also enables the possibility of rendering from objects created
#' by [write_rmd()].
#'
#' @param input Either a character value indicating the path and the name of the
#'     r-markdown file, or an object of class `rmd_doc`, written by
#'     [write_rmd()].
#' @param output_file A character value indicating the name of the output file.
#'     This argument is passed to [rmarkdown::render()]. Note that the argument
#'     only contains the name of the file without extension and can only be
#'     written at the working directory.
#' @param delete_rmd A logical value idicating whether the temporary Rmd file
#'     should be deleted or not. If not, the file gets the same name as the
#'     rendered file.
#' @param ... Further parameters passed to [rmarkdown::render()].
#'
#' @examples
#' \dontrun{
#' ## copy example to your working directory
#' filename <- "taxlistjourney.Rmd"
#' file.copy(from = file.path(path.package("yamlme"), filename), to = filename)
#'
#' ## Render the file with rmarkdown::render()
#' render_rmd(filename, output_file = "example")
#' browseURL("example.html")
#'
#' ## Render the file with yamlme
#' text_document <- read_rmd(filename)
#'
#' text_document <- update(text_document,
#'   title = "my title", author = "my name",
#'   output = "html_document"
#' )
#'
#' render_rmd(text_document, output_file = "example2")
#' browseURL("example2.html")
#' }
#'
#' @rdname render_rmd
#'
#' @export
render_rmd <- function(input, ...) {
  UseMethod("render_rmd", input)
}

#' @rdname render_rmd
#' @aliases render_rmd,character-method
#' @method render_rmd character
#' @export
render_rmd.character <- function(input, ...) {
  render(input, ...)
}

#' @rdname render_rmd
#' @aliases render_rmd,rmd_doc-method
#' @method render_rmd rmd_doc
#' @export
render_rmd.rmd_doc <- function(input, output_file, delete_rmd = TRUE, ...) {
  if (!"header" %in% names(input)) {
    stop("Input 'rmd_doc' object without header are not allowed.")
  }
  if (missing(output_file)) {
    output_file <- paste0(deparse(substitute(input)))
  }
  output_file_temp <- file.path(tempdir(), basename(output_file))
  rmd_file <- file.path(
    tempdir(),
    paste0(file_path_sans_ext(basename(output_file)), ".Rmd")
  )
  write_rmd(object = input, filename = rmd_file)
  render(rmd_file, output_file = output_file_temp, ...)
  files_tmp <- list.files(tempdir())
  files_tmp <- files_tmp[grepl(file_path_sans_ext(basename(output_file)),
    files_tmp,
    fixed = TRUE
  )]
  if (delete_rmd) {
    files_tmp <- files_tmp[!grepl(".Rmd", files_tmp, fixed = TRUE)]
  }
  file.copy(
    from = file.path(tempdir(), files_tmp), to = dirname(output_file),
    overwrite = TRUE
  )
}
