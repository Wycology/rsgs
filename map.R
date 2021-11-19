# Creating minimum temperatu
library(raster) # For getting shapefile and raster data online GADM and worldclim
library(mapsf)  # For plotting the simple feature maps
library(sf)     # For gettinf functions for transforming coordinates
library(tidyverse) # Data wrangling package

kenya <- getData('GADM', country = 'KEN', level = 1)
kenyasf <- st_as_sf(kenya)


clim <- getData('worldclim', var = 'tmin', res = 10)
crop <- crop(clim, kenyasf)
mask <- mask(crop, kenyasf)  

extract <- raster::extract(mask[[c(12,5)]], kenyasf, fun = mean)
df <- as.data.frame(extract)

kenyasf_mutate <- kenyasf |> mutate(tmin12 = df$tmin12) |> 
  mutate(Tmin5 = round(df$tmin5/10)) |> 
  mutate(Tmin12 = round(tmin12/10)) |> 
  relocate(Tmin12, .before = CC_1)

counties <- kenyasf_mutate |> 
  filter(NAME_1 %in% c("Laikipia", "Nyeri", 
                       "Nyandarua", "Nakuru", 
                       "Uasin Gishu"))

kenya_mts <- st_transform(kenyasf_mutate, 21097)
count_mts <- st_transform(counties, 21097)

mf_init(kenya_mts, theme = 'iceberg') 
mf_shadow(kenya_mts, col = 'purple', cex = 2)
mf_map(kenya_mts, add = TRUE)
mf_map(kenya_mts, var = 'Tmin12', type = 'choro', add = TRUE)
mf_map(count_mts, add = TRUE, col = 'transparent', border = 'magenta', lwd = 2)
mf_layout(title = 'Kenya Counties December Min. Temp',
          credits = paste0("Data source: GADM and worldclim ", 
                           'mapsf ', packageVersion('mapsf')))  

mf_init(kenyasf_mutate, theme = 'iceberg')
mf_shadow(kenyasf_mutate, col = 'purple', cex = 2)
mf_map(kenyasf_mutate, add = TRUE)
mf_map(kenyasf_mutate, var = 'Tmin5', type = 'choro', pal = 'Greens', add = TRUE)
mf_layout(title = 'Kenya Counties Temperature',
          credits = paste0("Data source: GADM and worldclim ", 'mapsf ',
                           packageVersion('mapsf')))
