library(mapsf) # Loading the package

study_area <- mf_get_mtq() # Loading the sample data

mf_init(study_area, expandBB = rep(0, 4), theme = 'candy') # Initating the map  

mf_shadow(study_area, col = 'purple', cex = 2, add = TRUE) 
mf_map(study_area, add = TRUE, border = 'maroon', lwd = 0.5, 
       leg_pos = c(720000, 1628119))
mf_map(x = study_area, var = c("POP", "MED"), type = "prop_choro", border = "black",
       lwd = 1, leg_pos = c("topright", "right"), leg_title = c("Population","Median\nIncome\n(in euros)"), 
       breaks = "equal", nbreaks = 4, pal = "Reds", leg_val_rnd = c(0, -2), 
       leg_frame = c(TRUE, TRUE), leg_val_cex = c(1, 1.2)
)
mf_scale(cex = 1.5)
mf_credits(paste0('Sources: IGN, 2018, Package: ', 'mapsf ', 'Version: ', packageVersion('mapsf')), 
           cex = 1.5, bg = 'magenta')
mf_title('Study Area: Martinique', cex = 2) # Adding the title of the map
mf_arrow() # Adding the north arrow
mf_inset_on(x = 'worldmap', pos = 'left') # Locating the inset
mf_worldmap(study_area, col = "red") # Adding the inset
mf_inset_off() # Terminating
