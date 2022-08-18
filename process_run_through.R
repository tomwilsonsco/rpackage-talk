library(devtools)
# Create a package structure in a directory
create_package("C:/repos/rpackagestest")

# when in the package run
use_git()

#create a function
use_r()

# then we want to create a function
# two examples

standard_scale <- function(x){
  (x - mean(x)) / sd(x)
}

scale_column <- function(df, col){
 dplyr::mutate(df,  "scaled_{{col}}":= standard_scale({{col}}))
}

#(talk about help functions and main function, which to comment)

# The roxygen comment should be added for the main function and then create documentation and namespace entry
document()

#Now test it
load_all()

#(Note that scale_column function available, but not in global env because it's like loading from library()

#Good idea to check package periodically
check()

# If want to use a pipe
use_pipe()