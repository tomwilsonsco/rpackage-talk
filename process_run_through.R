
# Create a package structure in a directory - here called rpackagestest
usethis::create_package("C:/tests/rpackagetest")

# Note rules on naming a package (letters, numbers, . only, at least 2 letters, start with letter)

# when in the package run
usethis::use_git()
# Can use Git Bash / shell
# to change default branch to main
# git branch -m master main
# git remote add origin ssh_to_remote


# create a function
usethis::use_r("std_scale_column")

# then we want to create a function
std_scale <- function(x) {
  (x - mean(x)) / stats::sd(x)
}

std_scale_df <- function(df) {
  df %>% dplyr::mutate_if(is.numeric, std_scale)
}

# (talk about help functions and main function, which to comment)
# Add dplyr to imports
usethis::use_package("dplyr")
usethis::use_package("stats")
usethis::use_package("magrittr")

# when want to use pipe, put this in function
#' @importFrom magrittr %>%
# Alternatively a pipe can be added with and can use in all functions
usethis::use_pipe()

# The roxygen comment should be added for the main function and then create documentation and namespace entry
devtools::document() # equivalent of roxygen2::roxygenize()

# Now let's test it!
devtools::load_all()

test_iris <- iris
test_iris <- std_scale_df(test_iris)
head(test_iris, 10)
#Show that it's worked by printing original and scaled
head(iris, 10)

# (Note that scale_column function available, but not in global env because it's like loading from library()
# Bring up the help
?std_scale_df

# Good idea to check package periodically while developing
devtools::check()

# Final thing we will cover - building
devtools::build() # this will create a "source" tar.gz
devtools::build(binary = TRUE) # this will make a compiled R binary at the version of R you are using

# If want to change the build version - edit the description file or
usethis::use_version()
