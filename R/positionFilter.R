#' Extract position data and filter wrong position data
#'
#' This function can extract position data and filter wrong position data generated from Garmin devices to modified the final map.
#'
#' @param allrecords position records converted from convertData() function
#' @export
#' @examples
#' positionFilter(allrecords)
#' filtered_position <- positionFilter(allrecords)
#' head(filtered_position)

positionFilter <- function(allrecords){
    num_data <- length(allrecords)

    # Extract position data from "allrecords" to "records_position"
    records_position <- vector(mode = "list", length = num_data)
    for(i in 1:num_data){
        records_position[[i]] <- allrecords[[i]] %>%
            select(position_long, position_lat)
    }

    # Filter wrong position data to "filtered_position"
    filtered_position <- vector(mode = "list", length = num_data)
    for(i in 1:num_data){
        filtered_position[[i]] <- records_position[[i]] %>%
            filter(!is.na(position_long)) %>%
            filter(position_long > 10) %>%
            filter(position_long < 170.0) %>%
            filter(position_lat > 10) %>%
            filter(position_lat < 170.0)
    }
    return(filtered_position)
}
