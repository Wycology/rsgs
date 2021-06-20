library(dismo)
library(raster)
library(rworldmap)
library(mapsf)
library(sf)
library(tidyverse)

mapr <- rworldmap::getMap('rworldmap', resolution = 'fine')

map_sf <- st_as_sf(mapr, needClosed = TRUE)

kenya <- mapr@data |> filter(NAME == 'Kenya')
rownames(kenya)

kenya <- 