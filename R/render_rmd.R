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
#' @param temp_file,delete_temp Deprecated parameters.
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
#'
render_rmd <- function(input, ...) {
  UseMethod("render_rmd", input)
}

#' @rdname render_rmd
#'
#' @export
#'
render_rmd.character <- function(input, ...) {
  rmarkdown::render(input, ...)
}

#' @rdname render_rmd
#'
#' @export
#'
render_rmd.rmd_doc <- function(input, output_file, delete_rmd = TRUE, temp_file,
                               delete_temp, ...) {
  if (!missing(delete_temp)) {
    warning(paste(
      "Parameter 'delete_temp' is deprecated.",
      "Use 'delete_rmd' instead."
    ))
  }
  if (!missing(temp_file)) {
    warning("Parameter 'temp_file' is deprecated.")
  }
  # Temporary file
  out_file <- basename(output_file)
  if (substr(out_file, nchar(out_file) - 3, nchar(out_file)) == ".Rmd") {
    out_file <- substr(out_file, 1, nchar(out_file) - 4)
  }
  out_dir <- dirname(output_file)
  temp_file <- file.path(tempdir(), out_file)
  # Write temporary file
  con <- file(paste0(temp_file, ".Rmd"), "wb")
  writeBin(charToRaw(paste0(c(
    "---\n", write_yaml(input$header), input$append,
    "---\n\n", input$body, "\n"
  ),
  collapse = ""
  )), con)
  close(con)
  # Render
  render_rmd(input = paste0(temp_file, ".Rmd"), ...)
  # Move resulting files
  OUT <- list.files(tempdir(), out_file)
  if (out_dir != tempdir()) {
    if (delete_rmd) {
      OUT <- OUT[!grepl(".Rmd", OUT, fixed = TRUE)]
    }
    file.copy(from = file.path(tempdir(), OUT), to = out_dir)
  }
}
