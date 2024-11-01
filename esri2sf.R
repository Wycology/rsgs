# Getting shapefile data from ARCGIS Server
# Created by Wyclife Agumba Oluoch

library(remotes)
install_github('yonghah/esri2sf') # Downloading the package

library(esri2sf) # Loading the installed library

# Sourcing point data from a url
url <- 'https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer/0'
df <- esri2sf(url)
plot(df)

# Sourcing line data from a url
url <- 'https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Florida_Annual_Average_Daily_Traffic/FeatureServer/0'
df <- esri2sf(url, outFields = c('AADT', 'DFLG'))
plot(df)

# Sourcing polygon data from url
url <- 'https://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Demographics/ESRI_Census_USA/MapServer/3'
df <- esri2sf(url,
              where = "STATE_NAME = 'Michigan'",
              outFields = c('POP2000', 'pop2007', 'POP00_SQMI', 'POP07_SQMI'))
plot(df) # Good plot
