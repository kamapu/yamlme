yamlme 0.1.2
============

### Improvements

* A description for the class `rmd_doc` was added.
* Function `yamlme:::write_yaml()` is working recursively, based on discussions
[here](https://stackoverflow.com/questions/61712575/how-to-run-function-on-the-deepest-level-only-in-a-nested-list) and [here](https://stackoverflow.com/questions/70272176/get-names-at-deepest-level-of-a-nested-list-in-r/)

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
