#' Extract position data and filter wrong position data
#'
#' This function can extract position data and filter wrong position data generated from Garmin devices to modified the final map.
#'
#' @param allrecords position records converted from convertData() function
#' @export
#' @examples
#' positionFilter(allrecords)
#' records_position <- positionFilter(allrecords)
#' head(records_position[[1]])

positionFilter <- function(allrecords){
    num_data <- length(allrecords)
    # If the data does not have position records, set NA to the data
    for(i in 1:num_data){
        if("position_long" %in% colnames(allrecords[[i]])){

        } else{
            allrecords[[i]] <- data.frame(position_long = c(NA),
                                          position_lat = c(NA))
        }
    }

    # Extract and filter position data from "allrecords" to "records_position"
    records_position <- vector(mode = "list", length = num_data)
    for(i in 1:num_data){
        records_position[[i]] <- allrecords[[i]] %>%
            select(position_long, position_lat) %>%
            filter(!is.na(position_long)) %>%
            filter(position_long < 179.99999)
    }
    return(records_position)
}
