#' Use filtered data to plot the activity map.
#'
#' This function read the position data filtered by positionFilter() function, and draw the activity map.
#' adapted from https://bookdown.org/nicohahn/making_maps_with_r5/docs/leaflet.html
#'
#' @param records_position data filtered from positionFilter() function
#' @param colour route colour on the map, with the default value "#00FFFF"
#' @param opacity stroke opacity (or layer opacity for the tile layers), with the default value 1
#' @param weight stroke width in pixels, with the default value 1
#' @param fillOpacity fill opacity, with the defulat value 0.2
#' @export
#' @examples
#' plotMap(records_position, colour = "#00FFFF", opacity = 1, weight = 1, fillOpacity = 0.2)
#' activity_map <- plotMap(records_position, colour = "red")
#' activity_map
plotMap <- function(records_position,
                         colour = "#00FFFF",
                         opacity = 1,
                         weight = 1,
                         fillOpacity = 0.2){
    num_data <- length(records_position)

    # Create a basemap with different tiles
    basemap <- leaflet() %>%
        # add different provider tiles
        addProviderTiles(
            "CartoDB.DarkMatter",
            # give the layer a name
            group = "CartoDB.DarkMatter"
        ) %>%
        addProviderTiles(
            "Wikimedia",
            group = "Wikimedia"
        ) %>%
        addProviderTiles(
            "CartoDB.Positron",
            group = "CartoDB.Positron"
        ) %>%
        addProviderTiles(
            "Esri.WorldImagery",
            group = "Esri.WorldImagery"
        ) %>%
        # add a layers control
        addLayersControl(
            baseGroups = c(
                "CartoDB.DarkMatter",
                "Wikimedia",
                "CartoDB.Positron",
                "Esri.WorldImagery"
            ),
            # position it on the topleft
            position = "topleft"
        )

    # Draw an activity map with each pieces of data as a different layer
    activity_map <- basemap
    for(i in 1:num_data) {
        activity_map <- activity_map %>%
            addPolylines(
                data = as.matrix(records_position[[i]]),
                color = colour,
                opacity = opacity,
                weight = weight,
                fillOpacity = fillOpacity,
                layerId = i
            )
    }
    return(activity_map)
}
