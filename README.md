# activitymap
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

```r
library(activitymap)
library(dplyr)
library(FITFileR)
library(leaflet)

activity_map <- getData() %>%
    convertData() %>%
    positionFilter() %>%
    activityMap()
activity_map
``
