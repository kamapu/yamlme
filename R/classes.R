#' @name rmd_doc-class
#'
#' @title R-markdown document
#'
#' @description
#' An S3 class for rmarkdown documents iheriting properties from lists.
#' Header settings are a list at `object$header`, while content in markdown
#' is a character vector at `object$body`.
#'
#' @exportClass rmd_doc
setOldClass(c("rmd_doc", "list"))
