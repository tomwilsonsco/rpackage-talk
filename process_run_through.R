
# Create a package structure in a directory
usethis::create_package("C:/tests/rpackagestest")

#Note rules on creating a package (no special cr)

# when in the package run
usethis::use_git() # might be better to use git init as with older usethis default is named master, not main
# Can use Git Bash / shell 
# to change default branch to main
# git branch -m master main 
# git remote add origin ssh_to_remote

#create a function
usethis::use_r("std_scale_column")

# then we want to create a function
std_scale <- function(x){
  (x - mean(x)) / stats::sd(x)
}

std_scale_column <- function(df, col){
 dplyr::mutate(df,  "{{col}}_scaled" := std_scale({{col}}))
}

#(talk about help functions and main function, which to comment)
# Add dplyr to imports
usethis::use_package("dplyr")
usethis::use_package("stats")

# The roxygen comment should be added for the main function and then create documentation and namespace entry
devtools::document() #equivalent of roxygen2::roxygenize()

#Now let's test it!
usethis::load_all()

test_iris <- head(iris, 10)
std_scale_column(test_iris, Sepal.Length)
#(Note that scale_column function available, but not in global env because it's like loading from library()
#Bring up the help
?std_scale_column

#Good idea to check package periodically while developing
usethis::check()

# Find we are getting a warning due to the :=
# This is rlang library and can be fixed by adding to roxygen comment:
#' @importFrom rlang :=

# similarly, if want to use a pipe
#' @importFrom magrittr %>%
# Alternatively a pipe can be added with
usethis::use_pipe()

# Final thing we will cover - building
usethis::build() # this will create a "source" tar.gz
usethis::build(binary=TRUE) # this will make a compiled R binary at the version of R you are using

# If want to change the build version - edit the description file or
usethis::use_version()