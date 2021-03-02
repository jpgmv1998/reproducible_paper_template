
# > PROJECT INFO
# NAME: PRIORITY MUNICIPALITIES AMAZON - EXAMPLE
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: ADD AMAZON PRIORITY MUNI INFO TO PROJECT SAMPLE
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -




# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# START TIME
tictoc::tic(msg = "_example_panel_priorityMuniAmazon_projectSpecific_muniLevel script", log = T)

# SOURCES
source("code/_functions/_example_ExportTimeProcessing.R")



# LIBRARIES
library(tidyverse) # manipulate tables, works with sf
library(sjlabelled) # label columns, prefer than Hmisc::label because has function to clear labels when necessary





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# PANEL SAMPLE
load("data/projectSpecific/muniLevel/_example_panel_sample_muniLevel.Rdata")



# AMAZON PRIORITY MUNICIPALITIES
load("data/raw2clean/_example_priorityMuniAmazon_mma/output/_example_clean_priorityMuniAmazon.Rdata")





# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# MERGE WITH SAMPLE

panel.priorityMuniAmazon.muniLevel <-
  panel.sample.muniLevel %>%
  dplyr::left_join(clean.priorityMuniAmazon)



# VARIABLE CONSTRUCTION: PRIORITY STATUS ANNUAL INDICATOR (ACTIVE) AND CROSS-SECTION HISTORY INDICATOR (EVER)
# /!\ classification criteria: d_priorityMuniAMazonActive == 1 if year >= entry_year and year < exit_year, == 0 otherwise

panel.priorityMuniAmazon.muniLevel <-
  panel.priorityMuniAmazon.muniLevel %>%
  mutate(d_priorityMuniAmazonActive        = if_else(year >= entry_year & !is.na(entry_year) &
                                                    (year < exit_year | is.na(exit_year)),
                                                     1, 0)) %>% # active status indicator creation
  mutate(d_priorityMuniAmazonActive_prodes = if_else(year >= entry_year_prodes & !is.na(entry_year_prodes) &
                                                    (year < exit_year_prodes | is.na(exit_year_prodes)),
                                                     1, 0)) %>% # active status indicator creation (prodes)
  group_by(muni_code) %>% # define cross-section level
  mutate(d_priorityMuniAmazonEver = if_else(any(d_priorityMuniAmazonActive == 1),
                                            1, 0)) %>% # ever status indicator creation
  ungroup() %>%  # remove cross-section level
  select(muni_code, year, starts_with("d_priority")) # select column of interest





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(panel.priorityMuniAmazon.muniLevel$muni_code)                         <- "municipality code (7-digit, IBGE - 2015)"
sjlabelled::set_label(panel.priorityMuniAmazon.muniLevel$d_priorityMuniAmazonActive)        <- "(calendar year) =1 if the muni was in the Amazon Priority list in that year, =0 otherwise"
sjlabelled::set_label(panel.priorityMuniAmazon.muniLevel$d_priorityMuniAmazonActive_prodes) <- "(PRODES year) =1 if the muni was in the Amazon Priority list in that year, =0 otherwise"
sjlabelled::set_label(panel.priorityMuniAmazon.muniLevel$d_priorityMuniAmazonEver)          <- "=1 if the muni was ever in the Amazon Priority list, =0 otherwise"


# POST-TREATMENT OVERVIEW
# summary(panel.priorityMuniAmazon.muniLevel)
# View(panel.priorityMuniAmazon.muniLevel)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(panel.priorityMuniAmazon.muniLevel,
     file = file.path("data/projectSpecific/muniLevel",
                      paste0("_example_panel_priorityMuniAmazon_muniLevel", ".Rdata")))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
example_ExportTimeProcessing("projectSpecific/muniLevel")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------
