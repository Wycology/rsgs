library(dplyr)
library(ggplot2)

# Number ONE....PRESENT

present_reproject <- projectRaster(classified_output, crs = 4326) 

classified_present_reproject <- reclassify(present_reproject, m)

present_area <- tapply(area(classified_present_reproject), 
                       classified_present_reproject[], sum)

present_area <- as.data.frame(present_area)

present_area |> mutate(class = c('Unsuitable',
                                 'Moderate',
                                 'Suitable',
                                 'Very suitable')) |>
  ggplot() + geom_col(aes(x = class, y = class_area), 
                      fill = c('red', 'blue', 'green', 'gray')) + 
  labs(x = 'Suitability Class', y = 'Class area in km^2') +
  theme_classic()

present_table <- present_area |> 
  mutate(Suitability_class = c('Unsuitable', 
                               'Moderate',
                               'Suitable',
                               'Very suitable')) |> 
  relocate(Suitability_class, .before = class_area)
present_table

write.csv(class_table, 'present_table.csv')

# Number TWO....future_2.6_2050

future_2.6_2050 <- ensemble(sdm_model,id=c(1:24),
                            pred_2.6_2050,
                            filename = "future_2.6_2050.tif",
                            setting=list(method="weighted", stat="TSS",opt=2))

future_2.6_2050_reproject <- projectRaster(future_2.6_2050, crs = 4326) 

classified_future_2.6_2050_reproject <- reclassify(future_2.6_2050_reproject, m)

future_2.6_2050_area <- tapply(area(classified_future_2.6_2050_reproject),
                               classified_future_2.6_2050_reproject[], sum)

future_2.6_2050_area <- as.data.frame(future_2.6_2050_area)

future_2.6_2050_area |> mutate(class = c('Unsuitable',
                                 'Moderate',
                                 'Suitable',
                                 'Very suitable')) |>
  ggplot() + geom_col(aes(x = class, y = class_area), 
                      fill = c('red', 'blue', 'green', 'gray')) + 
  labs(x = 'Suitability Class', y = 'Class area in km^2') +
  theme_classic()

future_2.6_2050_table <- future_2.6_2050_area |> 
  mutate(Suitability_class = c('Unsuitable', 
                               'Moderate',
                               'Suitable',
                               'Very suitable')) |> 
  relocate(Suitability_class, .before = class_area)
present_table

write.csv(future_2.6_2050_table, 'future_2.6_2050_table.csv')

# Number THREE....future_4.5_2050

future_4.5_2050 <- ensemble(sdm_model,id=c(1:24),
                            pred_4.5_2050,
                            filename = "future_4.5_2050.tif",
                            setting=list(method="weighted", stat="TSS",opt=2))

future_4.5_2050_reproject <- projectRaster(future_4.5_2050, crs = 4326) 

classified_future_4.5_2050_reproject <- reclassify(future_4.5_2050_reproject, m)

future_4.5_2050_area <- tapply(area(classified_future_4.5_2050_reproject),
                               classified_future_4.5_2050_reproject[], sum)

future_4.5_2050_area <- as.data.frame(future_4.5_2050_area)

future_4.5_2050_area |> mutate(class = c('Unsuitable',
                                         'Moderate',
                                         'Suitable',
                                         'Very suitable')) |>
  ggplot() + geom_col(aes(x = class, y = class_area), 
                      fill = c('red', 'blue', 'green', 'gray')) + 
  labs(x = 'Suitability Class', y = 'Class area in km^2') +
  theme_classic()

future_4.5_2050_table <- future_4.5_2050_area |> 
  mutate(Suitability_class = c('Unsuitable', 
                               'Moderate',
                               'Suitable',
                               'Very suitable')) |> 
  relocate(Suitability_class, .before = class_area)
present_table

write.csv(future_4.5_2050_table, 'future_4.5_2050_table.csv')

# Number FOUR....future_6.0_2050

future_6.0_2050 <- ensemble(sdm_model,id=c(1:24),
                            pred_6.0_2050,
                            filename = "future_6.0_2050.tif",
                            setting=list(method="weighted", stat="TSS",opt=2))

future_6.0_2050_reproject <- projectRaster(future_6.0_2050, crs = 4326) 

classified_future_6.0_2050_reproject <- reclassify(future_6.0_2050_reproject, m)

future_6.0_2050_area <- tapply(area(classified_future_6.0_2050_reproject),
                               classified_future_6.0_2050_reproject[], sum)

future_6.0_2050_area <- as.data.frame(future_6.0_2050_area)

future_6.0_2050_area |> mutate(class = c('Unsuitable',
                                         'Moderate',
                                         'Suitable',
                                         'Very suitable')) |>
  ggplot() + geom_col(aes(x = class, y = class_area), 
                      fill = c('red', 'blue', 'green', 'gray')) + 
  labs(x = 'Suitability Class', y = 'Class area in km^2') +
  theme_classic()

future_6.0_2050_table <- future_6.0_2050_area |> 
  mutate(Suitability_class = c('Unsuitable', 
                               'Moderate',
                               'Suitable',
                               'Very suitable')) |> 
  relocate(Suitability_class, .before = class_area)
present_table

write.csv(future_6.0_2050_table, 'future_6.0_2050_table.csv')

# Number FIVE....future_8.5_2050

future_8.5_2050 <- ensemble(sdm_model,id=c(1:24),
                            pred_8.5_2050,
                            filename = "future_8.5_2050.tif",
                            setting=list(method="weighted", stat="TSS",opt=2))

future_8.5_2050_reproject <- projectRaster(future_8.5_2050, crs = 4326) 

classified_future_8.5_2050_reproject <- reclassify(future_8.5_2050_reproject, m)

future_8.5_2050_area <- tapply(area(classified_future_8.5_2050_reproject),
                               classified_future_8.5_2050_reproject[], sum)

future_8.5_2050_area <- as.data.frame(future_8.5_2050_area)

future_8.5_2050_area |> mutate(class = c('Unsuitable',
                                         'Moderate',
                                         'Suitable',
                                         'Very suitable')) |>
  ggplot() + geom_col(aes(x = class, y = class_area), 
                      fill = c('red', 'blue', 'green', 'gray')) + 
  labs(x = 'Suitability Class', y = 'Class area in km^2') +
  theme_classic()

future_8.5_2050_table <- future_8.5_2050_area |> 
  mutate(Suitability_class = c('Unsuitable', 
                               'Moderate',
                               'Suitable',
                               'Very suitable')) |> 
  relocate(Suitability_class, .before = class_area)
present_table

write.csv(future_8.5_2050_table, 'future_8.5_2050_table.csv')

# Number SIX....future_2.6_2070

future_2.6_2070 <- ensemble(sdm_model,id=c(1:24),
                            pred_2.6_2070,
                            filename = "future_2.6_2070.tif",
                            setting=list(method="weighted", stat="TSS",opt=2))

future_2.6_2070_reproject <- projectRaster(future_2.6_2070, crs = 4326) 

classified_future_2.6_2070_reproject <- reclassify(future_2.6_2070_reproject, m)

future_2.6_2070_area <- tapply(area(classified_future_2.6_2070_reproject),
                               classified_future_2.6_2070_reproject[], sum)

future_2.6_2070_area <- as.data.frame(future_2.6_2070_area)

future_2.6_2070_area |> mutate(class = c('Unsuitable',
                                         'Moderate',
                                         'Suitable',
                                         'Very suitable')) |>
  ggplot() + geom_col(aes(x = class, y = class_area), 
                      fill = c('red', 'blue', 'green', 'gray')) + 
  labs(x = 'Suitability Class', y = 'Class area in km^2') +
  theme_classic()

future_2.6_2070_table <- future_2.6_2070_area |> 
  mutate(Suitability_class = c('Unsuitable', 
                               'Moderate',
                               'Suitable',
                               'Very suitable')) |> 
  relocate(Suitability_class, .before = class_area)
present_table

write.csv(future_2.6_2070_table, 'future_2.6_2070_table.csv')

# Number SEVEN....future_4.5_2070

future_4.5_2070 <- ensemble(sdm_model,id=c(1:24),
                            pred_4.5_2070,
                            filename = "future_4.5_2070.tif",
                            setting=list(method="weighted", stat="TSS",opt=2))

future_4.5_2070_reproject <- projectRaster(future_4.5_2070, crs = 4326) 

classified_future_4.5_2070_reproject <- reclassify(future_4.5_2070_reproject, m)

future_4.5_2070_area <- tapply(area(classified_future_4.5_2070_reproject),
                               classified_future_4.5_2070_reproject[], sum)

future_4.5_2070_area <- as.data.frame(future_4.5_2070_area)

future_4.5_2070_area |> mutate(class = c('Unsuitable',
                                         'Moderate',
                                         'Suitable',
                                         'Very suitable')) |>
  ggplot() + geom_col(aes(x = class, y = class_area), 
                      fill = c('red', 'blue', 'green', 'gray')) + 
  labs(x = 'Suitability Class', y = 'Class area in km^2') +
  theme_classic()

future_4.5_2070_table <- future_4.5_2070_area |> 
  mutate(Suitability_class = c('Unsuitable', 
                               'Moderate',
                               'Suitable',
                               'Very suitable')) |> 
  relocate(Suitability_class, .before = class_area)
present_table

write.csv(future_4.5_2070_table, 'future_4.5_2070_table.csv')

# Number EIGHT....future_6.0_2070

future_6.0_2070 <- ensemble(sdm_model,id=c(1:24),
                            pred_6.0_2070,
                            filename = "future_6.0_2070.tif",
                            setting=list(method="weighted", stat="TSS",opt=2))

future_6.0_2070_reproject <- projectRaster(future_6.0_2070, crs = 4326) 

classified_future_6.0_2070_reproject <- reclassify(future_6.0_2070_reproject, m)

future_6.0_2070_area <- tapply(area(classified_future_6.0_2070_reproject),
                               classified_future_6.0_2070_reproject[], sum)

future_6.0_2070_area <- as.data.frame(future_6.0_2070_area)

future_6.0_2070_area |> mutate(class = c('Unsuitable',
                                         'Moderate',
                                         'Suitable',
                                         'Very suitable')) |>
  ggplot() + geom_col(aes(x = class, y = class_area), 
                      fill = c('red', 'blue', 'green', 'gray')) + 
  labs(x = 'Suitability Class', y = 'Class area in km^2') +
  theme_classic()

future_6.0_2070_table <- future_6.0_2070_area |> 
  mutate(Suitability_class = c('Unsuitable', 
                               'Moderate',
                               'Suitable',
                               'Very suitable')) |> 
  relocate(Suitability_class, .before = class_area)
present_table

write.csv(future_6.0_2070_table, 'future_6.0_2070_table.csv')

# Number NINE....future_8.5_2070

future_8.5_2070 <- ensemble(sdm_model,id=c(1:24),
                            pred_8.5_2070,
                            filename = "future_8.5_2070.tif",
                            setting=list(method="weighted", stat="TSS",opt=2))

future_8.5_2070_reproject <- projectRaster(future_8.5_2070, crs = 4326) 

classified_future_8.5_2070_reproject <- reclassify(future_8.5_2070_reproject, m)

future_8.5_2070_area <- tapply(area(classified_future_8.5_2070_reproject),
                               classified_future_8.5_2070_reproject[], sum)

future_8.5_2070_area <- as.data.frame(future_8.5_2070_area)

future_8.5_2070_area |> mutate(class = c('Unsuitable',
                                         'Moderate',
                                         'Suitable',
                                         'Very suitable')) |>
  ggplot() + geom_col(aes(x = class, y = class_area), 
                      fill = c('red', 'blue', 'green', 'gray')) + 
  labs(x = 'Suitability Class', y = 'Class area in km^2') +
  theme_classic()

future_8.5_2070_table <- future_8.5_2070_area |> 
  mutate(Suitability_class = c('Unsuitable', 
                               'Moderate',
                               'Suitable',
                               'Very suitable')) |> 
  relocate(Suitability_class, .before = class_area)
present_table

write.csv(future_8.5_2070_table, 'future_8.5_2070_table.csv')
