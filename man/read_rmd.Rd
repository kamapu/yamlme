% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_rmd.R
\name{read_rmd}
\alias{read_rmd}
\alias{txt_body}
\title{Read R-markdown Documents}
\usage{
read_rmd(file, ..., skip_head = FALSE)

txt_body(...)
}
\arguments{
\item{file}{Character value indicating the path and the name to the Rmd file.}

\item{...}{Arguments passed by \code{read_rmd()} to \code{\link[=readLines]{readLines()}}.
In \code{txt_body()} they are character values passed to \code{c()}.}

\item{skip_head}{Logical value indicating whether the yaml head should be
skip or not (this argument is not used at the moment).}
}
\value{
The function \code{read_rmd()} returns a \linkS4class{rmd_doc} object.
The function \code{txt_body()}, a character vector suitable for the parameter
\code{body} in the function \code{\link[=write_rmd]{write_rmd()}}.
}
\description{
Import Rmd files into objects of class \linkS4class{rmd_doc}.

The function \code{txt_body()} add a line break at the end of each element of a
character vector considering them as single lines.

Note that comments will be deleted in the input file.
}
\examples{
\dontrun{
## Read pre-installed example
ex_document <- read_rmd(file.path(
  path.package("yamlme"),
  "taxlistjourney.Rmd"
))
}
}
