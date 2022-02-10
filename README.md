
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- Use snippet 'render_markdown' for it -->

# yamlme

<!-- badges: start -->

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/yamlme)](https://cran.r-project.org/package=yamlme)
[![DOI](https://zenodo.org/badge/297735831.svg)](https://zenodo.org/badge/latestdoi/297735831)
<br>
[![R-CMD-check](https://github.com/kamapu/yamlme/workflows/R-CMD-check/badge.svg)](https://github.com/kamapu/yamlme/actions)
[![Codecov test
coverage](https://codecov.io/gh/kamapu/yamlme/branch/master/graph/badge.svg)](https://codecov.io/gh/kamapu/yamlme?branch=master)
<br>
[![CRAN\_downloads](http://cranlogs.r-pkg.org/badges/yamlme)](https://cran.r-project.org/package=yamlme)
[![total
downloads](http://cranlogs.r-pkg.org/badges/grand-total/yamlme)](https://cran.r-project.org/package=yamlme)
<!-- badges: end -->

## Installing yamlme

You can install the last release from CRAN

``` r
install.packages("yamlme", dependencies = TRUE)
```

or the current development version from GitHub, using the package
`devtools`:

``` r
library(devtools)
install_github("kamapu/yamlme", build_vignettes = TRUE)
```

After installing the package have to be loaded in the current R-session.

``` r
library(yamlme)
```

## Create a document

This package aims to save documents with their respective settings
(yaml-head) in R-objects.

``` r
my_document <- write_rmd(title = "Mi First Document", author = "My Name",
        output = "html_document", append = "# This is a comment in head",
        body = txt_body(
                "# Starting a working day",
                "",
                "At the beginning of every day I will do:",
                "",
                "- Say everyone \"Good morning!\"",
                "- Start the coffe mashine",
                "- Start the computer",
                "- Read mails"))
my_document
#> ---
#> title: Mi First Document
#> author: My Name
#> output: html_document
#> # This is a comment in head
#> 
#> ---
#> 
#> # Starting a working day
#> 
#> At the beginning of every day I will do:
#> 
#> - Say everyone "Good morning!"
#> - Start the coffe mashine
#> - Start the computer
#> - Read mails
```

By this way it is possible to produce documents from plain R-code. This
document can be then rendered by the function `render_rmd()`.

``` r
render_rmd(input = my_document, output_file = "my_document")
```

For more details, take a look on the vignette.

``` r
vignette("yamlme-intro")
```

## Similar packages

Other R-packages with similar tasks are
[`yaml`](https://github.com/viking/r-yaml/) and
[`ymlthis`](https://github.com/r-lib/ymlthis), where the later is quite
close but uses a different approach defining separated functions for
different elements, while `yamlme` uses a single function, which is
quite open, writing the head in accordance to the argument provided in
custom parameters. In addition, yamlme does not have any dependency.
