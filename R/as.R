#' @name as
#'
#' @title Coercing lists and rmd_doc objects
#'
#' @description
#' Objects of class [rmd_doc-class] can be created from lists or converted back
#' to lists. This is convenient for defining functions that manipulate the
#' content of such objects.
#'
#' @rdname coerce-methods
#' @aliases coerce,list,rmd_doc-method
setAs("list", "rmd_doc", function(from) {
  x <- list()
  if (!all(names(from) == "body")) {
    x$header <- from[names(from) != "body"]
  }
  if ("body" %in% names(from)) {
    x$body <- from$body
  }
  class(x) <- c("rmd_doc", "list")
  return(x)
})

#' @name as
#' @rdname coerce-methods
#' @aliases coerce,list,rmd_doc-method
setAs("rmd_doc", "list", function(from) {
  x <- list()
  if (any(!names(from) %in% c("body"))) {
    x$header <- from[names(from) != "body"]
  }
  if ("body" %in% names(from)) {
    x$body <- from$body
  }
  class(x) <- c("rmd_doc", "list")
  return(x)
})
