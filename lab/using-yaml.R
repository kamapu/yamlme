# TODO:   Add comment
# 
# Author: Miguel Alvarez
################################################################################

library(yaml)
library(dlstats)

# Statistics of package
pack_status <- cran_stats("yaml")
summary(pack_status$start)

pack_status2 <- cran_stats("yamlme")
summary(pack_status2$start)

# sequence
x <- "
- 1
- 2
- 3
"
yaml.load(x)

# scalar
yaml.load("1.2345")

# sequence

yaml.load("
- this
- is
- a
- simple
- sequence
- of
- scalars
")

# Examples in the backward direction
cat(as.yaml(1:20))
cat(as.yaml(list(foo=1:10, bar=c("test1", "test2"))))

# Test again
cat(as.yaml(list(author = "Miguel Alvarez", title = "My Title")))

string <- "author: Miguel Alvarez
title: My Title"
yaml.load(string)

# Another test
string <- "
title: \"Displaying taxonomic names in taxlist\"
description: |
  Abstract about concepts and names.
  Abstract about concepts and names.
  Abstract about concepts and names.
author:
  - name: Miguel Alvarez
    url: https://kamapu.github.io/
date: 07-03-2021
output:
  distill::distill_article:
    self_contained: false
#draft: true
categories:
  - R
  - taxonomy
preview: na
"

T1 <- yaml.load(string)

cat(as.yaml(T1))



