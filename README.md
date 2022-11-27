# activitymap

[![](https://img.shields.io/badge/dev%20version-0.0.1-blue.svg)](https://github.com/hxyv/activitymap)

#### *Xingyu Hu, <xingyu3906@gmail.com>*

### Overview and installation
This package can use Garmin fit files to draw your activity map.

```r
library(devtools)
devtools::install_github("hxyv/activitymap")
```

### Package overview
This package has four functions to read your Garmin fit file and plot the activity map.
- *getData():* read all your .fit files into RStudio
- *convertData():* convert raw data read by getData() into a list
- *positionFilter():* extract position data and filter wrong position data
- *activityMap():* draw the activity map with the filtered data

### Using the functions
Example:
1. Create a new folder in your R project and name it "data"
2. Copy and paste all your fit files from Garmin devices into the "data" folder
3. Make sure the working directory is on the main folder of your project

```r
library(devtools)
devtools::install_github("grimbough/FITfileR")
library(FITfileR)
library(activitymap)
library(dplyr)

activity_map <- getData() %>%
    convertData() %>%
    positionFilter() %>%
    plotMap(records_position,
            colour = "#00FFFF",
            opacity = 1,
            weight = 1,
            fillOpacity = 0.2)
activity_map
```

![](README.png)<!-- -->
