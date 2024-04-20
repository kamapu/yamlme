# yamlme 0.1.3

### Bug Fixes

- Function `render_rmd()` is now overwritten previous versions of rendered
  files.



# yamlme 0.1.2

### Improvements

- All duties regarding reading and writing yaml head were passed to package
  [`yaml`](https://biostat.app.vumc.org/wiki/Main/YamlR).
- A description for the class `rmd_doc` was added.
- Function `yamlme:::write_yaml()` is working recursively, based on discussions
[here](https://stackoverflow.com/questions/61712575/how-to-run-function-on-the-deepest-level-only-in-a-nested-list) and [here](https://stackoverflow.com/questions/70272176/get-names-at-deepest-level-of-a-nested-list-in-r/)
- Parameters `temp_file` and `delete_temp` are deprecated.
- Function `render_rmd()` will write in the temporal directory and then move
  resulting files to the working directory, if necessary.
- If not included, extension *.Rmd will be automatically added to `filename`
  in `write_rmd()`.
- Parameter `output_file` in function `render_rmd()` may include the .Rmd
  extension or not and the file can be written in the temporary directory or
  any other path.
- Replacement methods for function `as.list()` (function `as<-`).



# yamlme 0.1.1

### New Features

- A `print()` method for `rmd_doc` objects.
- An `update()` method for `rmd_doc` objects.

### Improvements

- Objects of class `rmd_doc` are now structured as lists instead of character
vectors.
- Output of function `read_rmd()` is an object of class `rmd_doc` instead of plain
character vector.

### Bug Fixes

- Dash vectors may also be of length 1
