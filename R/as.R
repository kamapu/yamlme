#' @name coerce-methods
#' @rdname coerce-methods
#'
#' @description
#' Coercion of lists into [rmd_doc-class] objects and vice versa.
#'
#' @param object Either a list or a [rmd_doc-class] object.
#'
#' @example examples/as.R
#'
#' @export
list2rmd_doc <- function(object) {
  x <- list()
  if (!all(names(object) == "body")) {
    x$header <- object[names(object) != "body"]
  }
  if ("body" %in% names(object)) {
    x$body <- object$body
  }
  class(x) <- c("rmd_doc", "list")
  return(x)
}

#' @rdname coerce-methods
#' @export
rmd_doc2list <- function(object) {
  x <- list()
  if (any(!names(object) %in% c("body"))) {
    x$header <- object[names(object) != "body"]
  }
  if ("body" %in% names(object)) {
    x$body <- object$body
  }
  class(x) <- c("rmd_doc", "list")
  return(x)
}

#' @name coerce-methods
#' @title Coercing lists and rmd_doc objects
#'
#' @description
#' Objects of class [rmd_doc-class] can be created from lists or converted back
#' to lists. This is convenient for defining functions that manipulate the
#' content of such objects.
#'
#' @rdname coerce-methods
#' @aliases coerce,list,rmd_doc-method
setAs("list", "rmd_doc", function(from) list2rmd_doc(object = from))

#' @name coerce-methods
#' @rdname coerce-methods
#' @aliases coerce,list,rmd_doc-method
setAs("rmd_doc", "list", function(from) rmd_doc2list(object = from))
