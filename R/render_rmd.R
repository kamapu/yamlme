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
#'     It is passed to [rmarkdown::render()].
#' @param temp_file A name for a temporary file created to render the object.
#' @param delete_temp A logical value indicating whether `temp_file` should be
#'     deleted after rendering or not.
#' @param ... Further parameters passed to [rmarkdown::render()].
#' 
#' @examples 
#' \dontrun{
#' ## copy example to your working directory
#' filename <- "taxlistjourney.Rmd"
#' file.copy(from=file.path(path.package("yamlme"), filename), to=filename)
#' 
#' ## Render the file with rmarkdown::render()
#' render_rmd(filename, output_file="example")
#' 
#' ## Render the file with yamlme
#' text_document <- read_rmd(filename)
#' 
#' rmd_document <- write_rmd(title="my title", author="my name",
#'     output="html_document", body=text_document)
#' 
#' render_rmd(rmd_document, output_file="example2")
#' }
#' 
#' @rdname render_rmd
#' 
#' @export
#' 
render_rmd <- function (input, ...) {
	UseMethod("render_rmd", input)
}

#' @rdname render_rmd
#' 
#' @export
#' 
render_rmd.character <- function(input, ...)
	rmarkdown::render(input, ...)

#' @rdname render_rmd
#' 
#' @export
#' 
render_rmd.rmd_doc <- function(input, output_file, temp_file="_temp.Rmd",
		delete_temp=TRUE, ...) {
	# Write temporary file
	con <- file(temp_file, "wb")
	writeBin(charToRaw(paste0(c("---\n", write_yaml(input$header), input$append,
									"---\n\n", input$body, "\n"), collapse="")),
			con)
	close(con)
	# Render
	render_rmd(input=temp_file, output_file=output_file, ...)
	# Delete temporary file
	if(delete_temp) file.remove(temp_file)
}
