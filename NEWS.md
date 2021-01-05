yamlme 0.1.1
============

### New Features

* A `print()` method for `rmd_doc` objects.
* An `update()` method for `rmd_doc` objects.

### Improvements

* Objects of class `rmd_doc` are now structured as lists instead of character
vectors.
* Output of function `read_rmd()` is an object of class `rmd_doc` instead of plain
character vector.

### Bug Fixes

* Dash vectors may also be of length 1
