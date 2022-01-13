library(raster); library(viridisLite); library(viridis);  
library(mapsf); library(rayshader); library(av)
library(sf); library(magick)  
library(tidyverse) 

kenya <- raster::getData('GADM', country = 'KEN', level = 1) 
kenya_sf <- kenya %>% st_as_sf()

clim <- raster::getData('worldclim', var = 'tmin', res = 10)

crop <- clim %>% crop(kenya_sf)
mask <- crop %>% mask(kenya_sf)  

extract <- mask[[c(12,5)]] %>% raster::extract(kenya_sf, fun = mean)

df <- extract %>% as.data.frame()

kenya_sf_mutate <- kenya_sf |> mutate(tmin12 = df$tmin12) |> 
  mutate(Tmin5 = round(df$tmin5/10)) |> 
  mutate(Tmin12 = round(tmin12/10)) |> 
  relocate(Tmin12, .before = CC_1)

counties <- kenya_sf_mutate |> 
  filter(NAME_1 %in% c("Laikipia", "Nyeri", "Nyandarua", "Nakuru", "Uasin Gishu"))

kenya_mts <- st_transform(kenya_sf_mutate, 21097)
count_mts <- st_transform(counties, 21097)

mf_init(kenya_mts, theme = 'iceberg') 
mf_shadow(kenya_mts, col = 'purple', cex = 2)
mf_map(kenya_mts, add = TRUE)
mf_map(kenya_mts, var = 'Tmin12', type = 'choro', add = TRUE)
mf_map(count_mts, add = TRUE, col = 'transparent', border = 'magenta', lwd = 2)
mf_layout(title = 'Kenya Counties December Min. Temp',
          credits = paste0("Data source: GADM and worldclim ", 
                           'mapsf ', packageVersion('mapsf')))  

mf_init(kenya_sf_mutate, theme = 'iceberg')
mf_shadow(kenya_sf_mutate, col = 'purple', cex = 2)
mf_map(kenya_sf_mutate, add = TRUE)
mf_map(kenya_sf_mutate, var = 'Tmin5', type = 'choro', pal = 'Greens', add = TRUE)
mf_layout(title = 'Kenya Counties Temperature',
          credits = paste0("Data source: GADM and worldclim ", 'mapsf ',
                           packageVersion('mapsf')))


gg_shp <- ggplot(data = kenya_sf_mutate) +
  geom_sf(aes(fill = Tmin5)) +
  scale_fill_viridis() +
  ggtitle('Minimum temperature Kenya') +
  theme_bw()
plot_gg(gg_shp, multicore = TRUE, width = 5, height = 5, 
        scale = 200, windowsize = c(1280, 720), zoom = 0.65, 
        phi = 50, sunangle = 60, theta = 45)

render_snapshot()