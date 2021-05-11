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
