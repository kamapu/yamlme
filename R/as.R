#' @name as
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
