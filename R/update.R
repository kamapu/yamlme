#' @name update
#'
#' @title Update an rmd_doc
#'
#' @description
#' Alternative to modify settings and content in `rmd_doc` objects. Note that to
#' skip some elements of the YAML header, you can set the argument NULL to the
#' respective parameter.
#'
#' @param object An object of class `rmd_doc`.
#' @param ... Named arguments to be inserted in the YAML header (passed to
#'     [write_rmd()]).
#'
#' @example examples/update.R
#'
#' @method update rmd_doc
#' @export
update.rmd_doc <- function(object, ...) {
  new_values <- list(...)
  for (i in names(new_values)[!names(new_values) %in% c("body")]) {
    object$header[[i]] <- new_values[[i]]
  }
  if ("body" %in% names(new_values)) {
    object$body <- new_values$body
  }
  return(object)
}
