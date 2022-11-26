#' Convert raw data into a list.
#'
#' This function converts raw data into a list, which can be manipulated in R.
#' adapted from https://msmith.de/FITfileR/articles/FITfileR.html
#'
#' @param myfiles raw data read by getData() function
#' @export
#' @examples
#' convertData(myfiles)
#' allrecords <- converData(myfiles)
#' head(allrecords)
#' allrecords[[1]]
convertData <- function(myfiles){
    allrecords <- list()
    num_data <- length(myfiles)

    # Convert the raw data into appropriate data types (list)
    for(i in 1:num_data){
        allrecords[[i]] <- myfiles[[i]] %>%
            records() %>%
            bind_rows() %>%
            arrange(timestamp)
    }
    return(allrecords)
}
