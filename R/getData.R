#' Read all .fit files into RStudio.
#'
#' This function reads all .fit files in the "data" folder into RStudio.
#' adapted from https://msmith.de/FITfileR/articles/FITfileR.html
#'
#' @export
#' @examples
#' getData()
#' myfiles <- getData()
#' head(myfiles)
#' myfiles[[1]]
getData <- function(){
    setwd("data/")
    # Get all files' name
    temp <- list.files()
    # Read data into RStudio with readFitFile function
    myfiles <- lapply(temp, readFitFile)
    setwd("..")
    return(myfiles)
}
