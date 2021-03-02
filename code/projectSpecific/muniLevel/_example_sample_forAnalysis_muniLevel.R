
# > PROJECT INFO
# NAME: PRIORITY MUNICIPALITIES AMAZON - EXAMPLE
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: CONSTRUCT FINAL PANEL SAMPLE FOR ANALYSIS AND ADAPT IT TO SPATIAL AND CROSS-SECTION FORMATS
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# START TIME
tictoc::tic(msg = "_example_sample_forAnalysis_muniLevel script", log = T)

# SOURCES
source("code/_functions/_example_ExportTimeProcessing.R")



# LIBRARIES
library(tidyverse) # manipulate tables, works with sf
library(sjlabelled) # label columns, prefer than Hmisc::label because has function to clear labels when necessary





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# SAMPLES

# PANEL
load("data/projectSpecific/muniLevel/_example_panel_sample_muniLevel.Rdata")

# SPATIAL
load("data/projectSpecific/muniLevel/_example_spatial_sample_muniLevel.Rdata")

# CROSS-SECTION
load("data/projectSpecific/muniLevel/_example_crossSection_sample_muniLevel.Rdata")



# VARIABLES

# PRIORITY MUNICIPALITIES
load("data/projectSpecific/muniLevel/_example_panel_priorityMuniAmazon_muniLevel.Rdata")

# DEFORESTATION
load("data/projectSpecific/muniLevel/_example_panel_prodesDeforestationAmazonMuni_muniLevel.Rdata")





# DATA MERGE -----------------------------------------------------------------------------------------------------------------------------------------

# merge sample with all variables of interest
panel.forAnalysis.muniLevel <-
  panel.sample.muniLevel %>%
  dplyr::left_join(panel.priorityMuniAmazon.muniLevel) %>%
  dplyr::left_join(panel.prodesDeforestationAmazonMuni.muniLevel)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS - all labels should already be set but sometimes it is necessary to clear them before merging and here you can set them back again. >
# Also if you are planning to export the dataset for analysis to Stata you might need to shorten the labels to fit in its characters limits




# OTHER EXPORT FORMATS

# add spatial dimension
spatial.forAnalysis.muniLevel <-
  panel.forAnalysis.muniLevel %>%
  dplyr::left_join(spatial.sample.muniLevel) %>%
  sf::st_as_sf()

# collapse to cross-section dimension selecting and adapting the panel variables of interest
crossSection.forAnalysis.muniLevel <-
  panel.forAnalysis.muniLevel %>%
  dplyr::group_by(muni_code, muni_name, muni_area, state_uf, biomeAmazon_share, d_biomeAmazon, d_priorityMuniAmazonEver,
                  prodesAmazon_hidrography, prodesAmazon_nonforest) %>%
  dplyr::summarise(prodesAmazon_totalDeforestIncrement = sum(prodesAmazon_deforestIncrement, na.rm = T),
                   prodesAmazon_totalDeforestAccumulated = max(prodesAmazon_deforestAccumulated, na.rm = T))


# LABELS - set labels for new variables created
sjlabelled::set_label(crossSection.forAnalysis.muniLevel$prodesAmazon_totalDeforestIncrement)   <- "(cross-section) total increment in deforested area from Aug/2000 through Jul/2019 (sq km; PRODES)"
sjlabelled::set_label(crossSection.forAnalysis.muniLevel$prodesAmazon_totalDeforestAccumulated) <- "(cross-section) total accumulated deforested area through Jul/2019 (sq km; PRODES)"



# POST-TREATMENT OVERVIEW
# summary(panel.forAnalysis.muniLevel)
# View(panel.forAnalysis.muniLevel)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(panel.forAnalysis.muniLevel,
     file = file.path("data/projectSpecific/muniLevel",
                      "_example_panel_forAnalysis_muniLevel.Rdata"))

save(spatial.forAnalysis.muniLevel,
     file = file.path("data/projectSpecific/muniLevel",
                      "_example_spatial_forAnalysis_muniLevel.Rdata"))

save(crossSection.forAnalysis.muniLevel,
     file = file.path("data/projectSpecific/muniLevel",
                      "_example_crossSection_forAnalysis_muniLevel.Rdata"))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
example_ExportTimeProcessing("projectSpecific/muniLevel")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------