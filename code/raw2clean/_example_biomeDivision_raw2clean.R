
# > PROJECT INFO
# NAME: AMAZON PRIORITY MUNICIPALITIES - EXAMPLE
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: CLEAN RAW DATA SHAPEFILE OF BIOME DIVISION (2019) - EXAMPLE
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -






# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# START TIME
tictoc::tic(msg = "_example_biomeDivision_raw2clean script", log = T)

# SOURCES
source("code/_functions/ExportTimeProcessing.R")



# LIBRARIES
library(sf) # manipulate spatial data
library(tidyverse) # manipulate tables, works with sf
library(sjlabelled) # label columns, prefer than Hmisc::label because has function to clear labels when necessary





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# read shapefile
raw.biome <- sf::st_read(dsn   = "data/raw2clean/_example_biomeDivision_ibge/input",
                         layer = "lm_bioma_250")




# DATA EXPLORATION [disabled for speed]
# summary(raw.biome)
# View(raw.biome@data)
# plot(raw.biome)





# DATASET CLEANUP AND PREP ---------------------------------------------------------------------------------------------------------------------------

# COLUMN CLEANUP
# names
colnames(raw.biome)

# translate column names
raw.biome <-
  raw.biome %>%
  dplyr::rename(biome_code = CD_Bioma,
                biome_name = Bioma)


# class - no change needed
lapply(raw.biome, class)



# TRANSLATION
# 'grepl' used to avoid encoding trouble with latin characters
raw.biome$biome_name[which(grepl(pattern = "Amazônia",       x = raw.biome$biome_name))] <- "Amazon"
raw.biome$biome_name[which(grepl(pattern = "Mata Atlântica", x = raw.biome$biome_name))] <- "Atlantic Forest"



# LETTERS CAPITALIZATION
raw.biome <-
  raw.biome %>%
  dplyr::mutate(biome_name = toupper(biome_name))



# PROJECTION
raw.biome <- sf::st_transform(x = raw.biome, crs = 5880) # SIRGAS 2000 / Brazil Polyconic (https://epsg.io/5880)



# GEOMETRY CLEANUP
raw.biome <- sf::st_make_valid(raw.biome)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(raw.biome$biome_code)            <- "biome code"
sjlabelled::set_label(raw.biome$biome_name)            <- "biome name"



# change object name for exportation
clean.biomeDivision <- raw.biome



# POST-TREATMENT OVERVIEW
# summary(clean.biomeDivision)
# View(clean.biomeDivision@data)
# plot(clean.biomeDivision$geometry)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(clean.biomeDivision,
     file = file.path("data/raw2clean/_example_biomeDivision_ibge/output",
                      "_example_clean_biomeDivision.Rdata"))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("raw2clean")







# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------