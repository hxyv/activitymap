% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotMap.R
\name{plotMap}
\alias{plotMap}
\title{Use filtered data to plot the activity map.}
\usage{
plotMap(
  records_position,
  colour = "#00FFFF",
  opacity = 1,
  weight = 1,
  fillOpacity = 0.2
)
}
\arguments{
\item{records_position}{data filtered from positionFilter() function}

\item{colour}{route colour on the map, with the default value "#00FFFF"}

\item{opacity}{stroke opacity (or layer opacity for the tile layers), with the default value 1}

\item{weight}{stroke width in pixels, with the default value 1}

\item{fillOpacity}{fill opacity, with the defulat value 0.2}
}
\description{
This function read the position data filtered by positionFilter() function, and draw the activity map.
adapted from https://bookdown.org/nicohahn/making_maps_with_r5/docs/leaflet.html
}
\examples{
plotMap(records_position, colour = "#00FFFF", opacity = 1, weight = 1, fillOpacity = 0.2)
activity_map <- plotMap(records_position, colour = "red")
activity_map
}
