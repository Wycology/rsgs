library(mapsf) # for mapping sf objects

# import the sample data-set
mtq <- mf_get_mtq()

# Initiate a basemap
mf_init(x = mtq, theme = 'iceberg')

# Plot a shadow
mf_shadow(mtq, add = TRUE)

# Plot municipalities
mf_map(mtq, type = 'base', add = TRUE)

# Layout
mf_layout(title = 'Martinique',
          credits = paste0('Sources: IGN, 2018\n',
          'mapsf ',
          packageVersion('mapsf')))

# Proportional symbols
library(mapsf)

# Import the sample data set
mtq <- mf_get_mtq()

# Initiate base map
mf_init(x = mtq, theme = 'iceberg')

# Plot a shadow
mf_shadow(mtq, add = TRUE)

# Plot municipalities
mf_map(mtq, add = TRUE)

# Plot population
mf_map(
  x = mtq,
  var = 'POP',
  type = 'prop',
  inches = 0.25,
  col = 'purple',
  leg_pos = 'bottomleft2',
  leg_title = 'Total population'
)

# Layout
mf_layout(title = 'Population Distribution in Martinique',
          credits = paste0('Sources: Insee and IGN, 2018\n',
                           'mapsf ',
                           packageVersion('mapsf')))

# Choropleth map
library(mapsf)

# Import the sample data set
mtq <- mf_get_mtq()

# Population density (inhab./km2) using sf::st_area()
mtq$POPDENS <- 1e6 * mtq$POP / st_area(mtq)

# Set a theme
mf_theme("green")

# Plot population density
mf_map(
  x = mtq, 
  var = "POPDENS",
  type = "choro",
  breaks = "geom",
  nbreaks = 5,
  col = "Mint",
  border = "white", 
  lwd = 0.5,
  leg_pos = "topright", 
  leg_title = "Population Density\n(people per km2)"
) 

# Layout
mf_layout(title = "Population Distribution in Martinique", 
          credits = paste0("Sources: Insee and IGN, 2018\n",
                           "mapsf ", 
                           packageVersion("mapsf")))

# Typology map
library(mapsf)

# Import the sample data set
mtq <- mf_get_mtq()

# Set theme
mf_theme("dark")

# Plot administrative status
mf_map(
  x = mtq, 
  var = "STATUS", 
  type = "typo",
  pal = c("aquamarine4", "yellow3", "wheat"), 
  lwd = .5,
  val_order = c("Prefecture",
                "Sub-prefecture", 
                "Simple municipality"),
  leg_pos = "topright",
  leg_title = ""
)

# Labels for a few  municipalities
mf_label(x = mtq[mtq$STATUS != "Simple municipality", ], var = "LIBGEO", 
         cex = 0.9, halo = TRUE, r = 0.15)

# Layout
mf_layout(title = "Administrative Status", 
          credits = paste0("Sources: Insee and IGN, 2018\n",
                           "mapsf ", 
                           packageVersion("mapsf")))

# Proportional symbols using choropleth coloration
library(mapsf)

# Import the sample data set
mtq <- mf_get_mtq()

# Set theme
mf_init(x = mtq, theme = "candy", expandBB = c(0,0,0,.15))

# Plot a shadow
mf_shadow(mtq, add = TRUE)

# Plot the municipalities
mf_map(mtq, add = TRUE)

# Plot symbols with choropleth coloration
mf_map(
  x = mtq, 
  var = c("POP", "MED"), 
  type = "prop_choro",
  border = "grey50",
  lwd = 1,
  leg_pos = c("topright", "right"), 
  leg_title = c("Population","Median\nIncome\n(in euros)"),
  breaks = "equal", 
  nbreaks = 4, 
  pal = "Greens",
  leg_val_rnd = c(0, -2), 
  leg_frame = c(TRUE, TRUE)
) 

# Layout
mf_layout(title = "Population & Wealth in Martinique, 2015", 
          credits = paste0("Sources: Insee and IGN, 2018\n",
                           "mapsf ", 
                           packageVersion("mapsf")), 
          frame = TRUE)

# Proportional symbols with typology coloration
library(mapsf)

# Import the sample data set
mtq <- mf_get_mtq()

# Set theme
mf_init(x = mtq, theme = "ink", expandBB = c(0,0,0,.15))

# Plot a shadow
mf_shadow(mtq, add = TRUE)

# Plot the municipalities
mf_map(mtq, add = TRUE)

# Plot symbols with choropleth coloration
mf_map(
  x = mtq, 
  var = c("POP","STATUS"), 
  type = "prop_typo",
  symbol = "square",
  border = "white",
  lwd = .5,
  leg_pos = c("right",  "topright"), 
  leg_title = c("Population", "Administrative\nStatus"),
  val_order = c("Prefecture", "Sub-prefecture", 
                "Simple municipality")) 
# Layout
mf_layout(title = "Population Distribution in Martinique", 
          credits = paste0("Sources: Insee and IGN, 2018\n",
                           "mapsf ", 
                           packageVersion("mapsf")))
# Label map 
library(mapsf)

# Import the sample data set
mtq <- mf_get_mtq()

# Set theme
my_theme <- list(
  name = "mytheme", 
  bg = "lightblue1", 
  fg = "darkseagreen4", 
  mar = c(0, 0, 0, 0), 
  tab = TRUE, 
  pos = "left", 
  inner = TRUE, 
  line = 1, 
  cex = .9, 
  font = 3
)

mf_theme(my_theme)

# Plot municipalities
mf_map(mtq, col = "#e4e9de", border = "darkseagreen4")

# Plot labels
mf_label(
  x = mtq, 
  var = "LIBGEO", 
  col = "black", 
  cex = 0.7, 
  font = 4,
  halo = TRUE, 
  bg = "white", 
  r = 0.1, 
  overlap = FALSE, 
  lines = FALSE
)

# Layout
mf_layout(title = "Municipalities of Martinique", 
          credits = paste0("Sources: Insee and IGN, 2018\n",
                           "mapsf ", 
                           packageVersion("mapsf")), 
          arrow = FALSE)

# North arrow
mf_arrow(pos ='topright')

# Links map
library(mapsf)

# Import the sample data set
mtq <- mf_get_mtq()

# Import the csv file embedded in mapsf package
mob <- read.csv(system.file("csv/mob.csv", package="mapsf"))

# Select links from Fort-de-France (97209))
mob_97209 <- mob[mob$i == 97209, ]

# Create an sf object of links
mob_links <- mf_get_links(x = mtq, df = mob_97209)

# Set figure background color
# Set theme
mf_init(x = mtq, theme = "dark")

# Plot a shadow
mf_shadow(mtq, add = TRUE)

# Plot the municipalities
mf_map(mtq, add = TRUE)

# Plot graduated links
mf_map(
  x = mob_links, 
  var = "fij", 
  type = "grad",
  breaks = c( 100, 500, 1000, 4679.0),
  lwd = c(1,4,8),
  leg_pos = "bottomleft2",
  leg_title = "Nb. of\nCommuters",
  col = "red4", 
  leg_frame = TRUE
) 

# Map layout
mf_layout(title = "Commuting to Fort-de-France", 
          credits = paste0("Sources: Insee and IGN, 2018\n",
                           "mapsf ", 
                           packageVersion("mapsf")), 
          arrow = FALSE)

# Map with longitude and latitude axes
library(mapsf)

# Loading the sf object from the package
mtq <- mf_get_mtq()

# Defining margin with sufficient margins for graticules

mytheme <- mf_theme('default', mar = c(2, 2, 1.2, 0)+5)

# Use theme margins
opar <- par(mar = mytheme$mar)
plot(st_geometry(mtq),
     border = NA, col = NA,
     graticule = st_crs(4326),
     axes = TRUE,
     bg = mytheme$bg,
     lon = seq(-62, -60, by = 0.2),
     lat = seq(14, 15, by = 0.2))
# Mdd the map
mf_map(mtq, add = TRUE)
mf_title('Map with graticules')
par(opar)