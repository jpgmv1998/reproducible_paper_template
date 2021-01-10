
# > PROJECT INFO
# NAME: PRIORITY MUNICIPALITIES AMAZON - EXAMPLE
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: ADD AMAZON PRODES LAND COVER/DEFORESTATION INFO TO PROJECT SAMPLE
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -




# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# START TIME
tictoc::tic(msg = "_example_panel_prodesDeforestationAmazonMuni_projectSpecific_muniLevel script", log = T)

# SOURCES
source("code/_functions/_example_ExportTimeProcessing.R")



# LIBRARIES
library(tidyverse) # manipulate tables, works with sf
library(sjlabelled) # label columns, prefer than Hmisc::label because has function to clear labels when necessary





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# PANEL SAMPLE
load("data/projectSpecific/muniLevel/_example_panel_sample_muniLevel.Rdata")



# AMAZON PRODES LAND COVER
load("data/raw2clean/_example_prodesDeforestationAmazonMuni_inpe/output/_example_clean_prodesDeforestationAmazonMuni.Rdata")





# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# MERGE WITH SAMPLE
panel.prodesDeforestationAmazonMuni.muniLevel <-
  panel.sample.muniLevel %>%
  dplyr::left_join(clean.prodesDeforestationAmazonMuni)




# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# POST-TREATMENT OVERVIEW
# summary(panel.prodesDeforestationAmazonMuni.muniLevel)
# View(panel.prodesDeforestationAmazonMuni.muniLevel)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(panel.prodesDeforestationAmazonMuni.muniLevel,
     file = file.path("data/projectSpecific/muniLevel",
                      paste0("_example_panel_prodesDeforestationAmazonMuni_muniLevel", ".Rdata")))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
example_ExportTimeProcessing("projectSpecific/muniLevel")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------
