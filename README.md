# activitymap

[![](https://img.shields.io/badge/dev%20version-0.0.2-seagreen.svg)](https://github.com/hxyv/activitymap)

#### *Xingyu Hu, <xingyu3906@gmail.com>*

### Package overview
This package has four functions to read your Garmin fit file and plot the activity map.
- *getData():* read all your .fit files into RStudio
- *convertData():* convert raw data read by *getData()* into a list
- *positionFilter():* extract position data and filter wrong position data
- *plotMap():* draw the activity map with the filtered data

### Installation and usage
Example:
1. Create a new folder in your R project and name it "data"
2. Copy and paste all your fit files from Garmin devices into the "data" folder
3. Make sure the working directory is on the main folder of your project

```r
library(devtools)
devtools::install_github("grimbough/FITfileR")
devtools::install_github("hxyv/activitymap")
install.packages(leaflet)
install.packages(dplyr)

library(FITfileR)
library(activitymap)
library(leaflet)
library(dplyr)

# One-step
activity_map <- getData() %>%
    convertData() %>%
    positionFilter() %>%
    plotMap(colour = "#00FFFF",
            opacity = 1,
            weight = 1,
            fillOpacity = 0.2)
            
activity_map

# Multi-step
myfiles <- getData()
allrecords <- convertData(myfiles)
records_position <- positionFilter(allrecords)
activity_map <- plotMap(records_position,
                        colour = "seagreen",
                        opacity = 1,
                        weight = 1,
                        fillOpacity = 0.2)

activity_map
```

![](README.png)<!-- -->
