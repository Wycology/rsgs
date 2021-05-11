library(mapsf)

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






