% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_rmd.R
\name{read_rmd}
\alias{read_rmd}
\title{Read R-markdown Documents}
\usage{
read_rmd(file, ..., skip_head = TRUE)
}
\arguments{
\item{file}{Character value indicating the path and the name to the Rmd file.}

\item{...}{Arguments passed to \code{\link[=readLines]{readLines()}}.}

\item{skip_head}{Logical value indicating whether the yaml head should be
skip or not.}
}
\value{
A character vector that can be use as \code{body} in function \code{\link[=write_rmd]{write_rmd()}}.
}
\description{
This function reads Rmd files into character vectors pasting a line break
at the end of each line.
}