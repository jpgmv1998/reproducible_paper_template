
# > PROJECT INFO
# NAME: PRIORITY MUNICIPALITIES AMAZON - EXAMPLE
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: DEFINE SAMPLE AND SAVE IT IN SPATIAL, CROSS-SECTION AND PANEL FORMATS
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# START TIME
tictoc::tic(msg = "_example_sampleConstruction_projectSpecific_muniLevel script", log = T)

# SOURCES
source("code/_functions/_example_ExportTimeProcessing.R")



# LIBRARIES
library(sf) # manipulate spatial data
library(tidyverse) # manipulate tables, works with sf
library(sjlabelled) # label columns, prefer than Hmisc::label because has function to clear labels when necessary
library(units) # to convert area units





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# BRAZILIAN MUNICIPALITIES DIVISION 2015 SHAPEFILE
load("data/raw2clean/_example_muniDivision2015_ibge/output/_example_clean_muniDivision2015.Rdata")



# BRAZILIAN BIOMES DIVISION SHAPEFILE
load("data/raw2clean/_example_biomeDivision_ibge/output/_example_clean_biomeDivision.Rdata")





# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# calculate municipality area in square kilometers
clean.muniDivision2015$muni_area <-
  sf::st_area(clean.muniDivision2015) %>%
  units::set_units(km^2) %>%
  unclass()

# select columns of interest
clean.muniDivision2015 <-
  clean.muniDivision2015 %>%
  dplyr::select(muni_code, muni_name, state_uf, muni_area, geometry)

clean.biomeDivision <-
  clean.biomeDivision %>%
  dplyr::select(biome_name, geometry)


# combine municipalities with biomes
aux.biomeMuni <- sf::st_intersection(clean.muniDivision2015, clean.biomeDivision)

# clear environment
rm(clean.biomeDivision)

# calculate biome areas inside each municipality
aux.biomeMuni$biome_area <-
  sf::st_area(aux.biomeMuni) %>%
  units::set_units(km^2) %>%
  unclass()

# select municipalities of interest - in Amazon
aux.biomeMuni <-
  aux.biomeMuni %>%
  sf::st_drop_geometry() %>% # drop spatial dimension
  tidyr::pivot_wider(names_from = biome_name, values_from = biome_area, values_fill = 0) %>% # convert from long to wide - biome areas in columns
  dplyr::filter(AMAZON > 0) %>% # select municipalities of interest
  dplyr::mutate(biomeAmazon_share  = AMAZON/muni_area) %>%  # calculate share of the muni area in each biome of interest
  dplyr::select(muni_code, muni_name, state_uf, muni_area, biomeAmazon_share) %>% # select columns of interest
  dplyr::mutate(d_biomeAmazon  = if_else(biomeAmazon_share > 0, 1, 0)) # create biome dummies

# merge original municipalities shapefile with biomes information
spatial.sample.muniLevel <-
  clean.muniDivision2015 %>%
  dplyr::left_join(aux.biomeMuni) %>%
  dplyr::filter(d_biomeAmazon == 1)

# clear environment
rm(aux.biomeMuni)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(spatial.sample.muniLevel$muni_code)          <- "municipality code (7-digit, IBGE - 2015)"
sjlabelled::set_label(spatial.sample.muniLevel$muni_name)          <- "municipality name"
sjlabelled::set_label(spatial.sample.muniLevel$state_uf)           <- "state name (abbreviation)"
sjlabelled::set_label(spatial.sample.muniLevel$muni_area)          <- "municipality area (calculated from shapefile under SIRGAS2000 Polyconic projection)"
sjlabelled::set_label(spatial.sample.muniLevel$biomeAmazon_share)  <- "share of the municipality area in the Amazon biome"
sjlabelled::set_label(spatial.sample.muniLevel$d_biomeAmazon)      <- "=1 if part of the municipality is in the Amazon biome, =0 if it is not"



# OTHER EXPORT FORMATS
# extract data.frame from spatial data
crossSection.sample.muniLevel <-
  spatial.sample.muniLevel %>%
  sf::st_drop_geometry()

# create panel data from crossSection and add missing label
panel.sample.muniLevel <- tidyr::expand_grid(crossSection.sample.muniLevel, year = 2001:2019)

sjlabelled::set_label(panel.sample.muniLevel$year) <- "year of reference (calendar or PRODES year)"



# POST-TREATMENT OVERVIEW
# summary(spatial.sample.muniLevel)
# View(spatial.sample.muniLevel)
# plot(spatial.sample.muniLevel$geometry)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(spatial.sample.muniLevel,
     file = file.path("data/projectSpecific/muniLevel",
                      "_example_spatial_sample_muniLevel.Rdata"))

save(crossSection.sample.muniLevel,
     file = file.path("data/projectSpecific/muniLevel",
                      "_example_crossSection_sample_muniLevel.Rdata"))

save(panel.sample.muniLevel,
     file = file.path("data/projectSpecific/muniLevel",
                      "_example_panel_sample_muniLevel.Rdata"))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
example_ExportTimeProcessing("projectSpecific/muniLevel")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------