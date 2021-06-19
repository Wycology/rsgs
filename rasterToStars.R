#################################################################################
# In this code, I am going to demonstrate how to convert raster to stars object #
# Created by Wyclife Agumba Oluoch                                              #
# wyclifeoluoch@gmail.com                                                       #
# Last edited on 19th June 2021                                                 #
#################################################################################

# Loading the libraries

library(raster) # For the raster files
library(stars)  # For stars files 
library(sf)     # For sf objects

# Create a raster object using the raster function

r <- raster(ncols = 20, nrows = 20) # 20 by 20 raster 

# Fill the raster with random values rounded to 2 decimal places

r[] <- round(rnorm(n = ncell(r)), 2) # Filling the values in the raster

plot(r) # visualize the raster

# Convert the raster object to stars object
s <- st_as_stars(r)

plot(s) # Visualize the stars object

# Add pixel value texts on the plot

plot(s, text_values = TRUE, 
     col = terrain.colors(10), 
     breaks = "equal")

# Awesome working with stars 