# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(rlist)

source("R/assign_class.R")
source("R/write_yaml.R")

lst <- list(
    title="References and Plant Communities in 'SWEA-Dataveg'",
    author="Miguel Alvarez",
    date="Dezember 28, 2019",
    "header-includes"=c("- \\usepackage[utf8]{inputenc}",
        "- \\usepackage[T1]{fontenc}", "- \\usepackage{bibentry}",
        "- \\nobibliography{sweareferences.bib}"),
    output=list(pdf_document=list(citation_package="natbib")),
    "biblio-style"="unsrtnat",
    bibliography="sweareferences.bib",
    papersize="a4")


library(yamlme)
Test <- write_rmd(lst, body = "This is an example")

######

x <- lst

leaf_class <- function(x) {
  if(is.list(x)) lapply(x, leaf_class)
  else assign_class(x)
}

leaf_write <- function(x, depth = 0) {
  if(is.list(x)) lapply(x, leaf_write)
  else write_yaml(x, depth)
}

get_names <- function(x, s = NULL) {
  if (!is.list(x)) {
    return(s)
  }
  nms <- names(x)
  if (is.null(nms)) {
    nms <- character(length(x))
  }
  Map(get_names, x = x, s = Map(c, list(s), nms))
}

flatten_list <- function(x) {
  repeat {
    if(!any(vapply(x, is.list, logical(1)))) return(x)
    x <- x
    x <- Reduce(c, x)
  }
}


x <- lst

x <- leaf_class(x)
x <- leaf_write(x)
l_names <- get_names(x)
for(i in c("x", "l_names"))
  assign(i, list.flatten(get(i)))
for(i in 1:length(x)) {
  indent <- character(0)
  for (j in 1:length(l_names[[i]]))
    indent[j] <- paste0(rep("  ", times = j - 1), collapse = "")
  indent <- c(indent, rep(indent[length(indent)], times = length(x[[i]]) - 1))
  x[[i]] <- paste0(indent, c(paste0(l_names[[i]], ": ", x[[i]][1]), x[[i]][-1]))
}
x <- unique(x)



rrapply::rrapply(lst, f = function(x, .xparents) .xparents)




cat(unlist(x))





Test





flatten1 <- function(x) {
  y <- list()
  rapply(x, function(x) y <<- c(y,x))
  y
}

list.flatten <- function(x, use.names = TRUE, classes = "ANY") {
  len <- sum(rapply(x, function(x) 1L, classes = classes))
  y <- vector("list", len)
  i <- 0L
  items <- rapply(x, function(x) {
        i <<- i + 1L
        y[[i]] <<- x
        TRUE
      }, classes = classes)
  if (use.names && !is.null(nm <- names(items)))
    names(y) <- nm
  y
}



lst4 <- add_depth(lst3)

get_names <- function(x, s = NULL) {
  if (!is.list(x)) {
    return(s)
  }
  nms <- names(x)
  if (is.null(nms)) {
    nms <- character(length(x))
  }
  Map(get_names, x = x, s = Map(c, list(s), nms))
}

lst5 <- get_names(lst4)

cat(paste(unlist(lst5), unlist(lst4)))



list.flatten(lst5)



#### Stack overflow

f <- function(x, s = NULL) {
  if (!is.list(x)) {
    return(s)
  }
  nms <- names(x)
  if (is.null(nms)) {
    nms <- character(length(x))
  }
  Map(f, x = x, s = Map(c, list(s), nms))
}

f(lst)



flatten3 <- function(x) {
  repeat {
    if(!any(vapply(x, is.list, logical(1)))) return(x)
    x <- Reduce(c, x)
  }
}

flatten3(lst5)





"https://stackoverflow.com/questions/8139677/how-to-flatten-a-list-to-a-list-without-coercion/8139959#8139959"

browseURL("https://stackoverflow.com/questions/61712575/how-to-run-function-on-the-deepest-level-only-in-a-nested-list")


lst <- list(
    1,
    list(list(c(4, 5, 4)), list(c(6, 7))),
    list(c(2, 3, 3)),
    list(list(c(5, 5, 6)), list(c(7, 7, 7)))
)

maxDepth <- function(x, depth = 0) {
  if (is.list(x)) max(sapply(x, maxDepth, depth+1))
  else depth
}

lstUnique <- function(x, depth = maxDepth(x)) {
  if (depth == 0) unique(x)
  else if (is.list(x)) lapply(x, lstUnique, depth-1)
  else x
}

lstUnique(lst)


addDepth <- function(x, depth = 0) {
  if (is.list(x)) lapply(x, addDepth, depth+1)
  else structure(x, class = format(depth))
}
lst2 <- addDepth(lst)

mx <- max(as.numeric(rapply(lst2, class))) # max depth
lst3 <- rapply(lst2, unique, classes = format(mx), how = "replace")
rapply(lst3, as.vector, how = "replace")

###
# Test
source("R/assign_class.R")
source("R/write_yaml.R")

x <- list(output=list(
        html_document=list(
            toc="true",
            toc_float="true"),
        word_document=list(
            fig_caption="false")))

## FINAL
source("R/assign_class.R")
source("R/write_yaml.R")

lst <- list(
    title="References and Plant Communities in 'SWEA-Dataveg'",
    author="Miguel Alvarez",
    date="Dezember 28, 2019",
    "header-includes"=c("- \\usepackage[utf8]{inputenc}",
        "- \\usepackage[T1]{fontenc}", "- \\usepackage{bibentry}",
        "- \\nobibliography{sweareferences.bib}"),
    output=list(pdf_document=list(citation_package="natbib")),
    "biblio-style"="unsrtnat",
    bibliography="sweareferences.bib",
    papersize="a4")

leaf_class <- function(x) {
  if(is.list(x)) lapply(x, leaf_class)
    else assign_class(x)
}

lst2 <- leaf_class(lst)

leaf_write <- function(x, depth = 0) {
  if(is.list(x)) lapply(x, leaf_write)
  else write_yaml(x, depth)
}

lst3 <- leaf_write(lst2)

add_depth <- function(x, depth = 0) {
  if (is.list(x)) lapply(x, add_depth, depth + 1)
  else structure(x, class = format(depth))
}

lst4 <- add_depth(lst3)

#### Stack overflow

f <- function(x, s = NULL) {
  if (!is.list(x)) {
    return(s)
  }
  nms <- names(x)
  if (is.null(nms)) {
    nms <- character(length(x))
  }
  Map(f, x = x, s = Map(c, list(s), nms))
}

f(lst)




###
get_names <- function(x, depth = 0, name = "") {
  if(is.list(x)) lapply(x, get_name, depth = depth + 1, name = c(name, names(x)))
  else paste(name, depth)
}

get_name(z)
