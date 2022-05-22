
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: MERGE VARIABLES OF INTEREST AND EXPORT IT IN POSSIBLY MULTIPLE DATA FORMATS - TEMPLATE
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# GROUNDHOG (REPRODUCIBILITY SOLUTION TO HANDLING DIFFERENT VERSIONS OF R AND ITS PACKAGES)

# check if groundhog is installed and load it
if ("groundhog" %in% installed.packages()) {
  library("groundhog")
} else {
  install.packages("groundhog")
  library("groundhog")
}

# define date of reference to load all packages
groundhog.date <- "YYYY-MM-DD" # CHANGE TO THE DESIRED REFERENCE DATE TO DOWNLOAD THE PACKAGE'S VERSIONS

# guarantee version 1.5 of groundhog is being used (if you another version change the date)
groundhog::meta.groundhog(date = "2022-04-01")


# HERE
groundhog::groundhog.library("here", groundhog.date) # load package here


# TICTOC
groundhog::groundhog.library("tictoc", groundhog.date) # load package tictoc


# DECLARE LOCATION OF CURRENT SCRIPT TO SET UP PROJECT ROOT CORRECTLY
here::i_am("code/projectSpecific/folderName/sample_forAnalysis_folderName.R", uuid = "") # set uuid using uuid::UUIDgenerate()


# START TIME
tictoc::tic(msg = "sample_forAnalysis_folderName script", log = T)



# SOURCE FUNCTIONS
source(here::here("code/_functions/ExportTimeProcessing.R"))



# LIBRARIES
groundhog::groundhog.library("sf", groundhog.date)         # to manipulate spatial data (vector format)
groundhog::groundhog.library("tidyverse", groundhog.date)  # manipulate tables, works with sf
groundhog::groundhog.library("sjlabelled", groundhog.date) # label columns, preferred than Hmisc::label because has function to clear labels when necessary
groundhog::groundhog.library("", groundhog.date)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# SAMPLES

# PANEL
load(here::here("data/projectSpecific/folderName/panel_sample_folderName.Rdata"))

# SPATIAL
load(here::here("data/projectSpecific/folderName/spatial_sample_folderName.Rdata"))

# CROSS-SECTION
load(here::here("data/projectSpecific/folderName/crossSection_sample_folderName.Rdata"))



# VARIABLES

# VARIABLE 1
load(here::here("data/projectSpecific/folderName/dataFormat_variableTheme_folderName.Rdata"))





# DATA MERGE -----------------------------------------------------------------------------------------------------------------------------------------

# merge sample with all variables of interest
panel.forAnalysis.folderName <-
  panel.sample.folderName %>%
  dplyr::left_join(dataFormat.variableTheme.folderName)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS - all labels should already be set but sometimes it is necessary to clear them before merging and here you can set them back again




# OTHER EXPORT FORMATS

# add spatial dimension
spatial.forAnalysis.folderName <-
  panel.forAnalysis.folderName %>%
  dplyr::left_join(spatial.sample.folderName) %>%
  sf::st_as_sf()

# collapse to cross-section dimension selecting and adapting the panel variables of interest
crossSection.forAnalysis.folderName <-
  panel.forAnalysis.folderName %>%
  dplyr::group_by() %>% # selection of cross-section variables
  dplyr::summarise() # adaptation of panel variables of interest to cross-section


# LABELS - set labels for new variables created
sjlabelled::set_label(crossSection.forAnalysis.folderName$columnName)   <- "(cross-section)"



# POST-TREATMENT OVERVIEW
# summary(panel.forAnalysis.folderName)
# View(panel.forAnalysis.folderName)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(panel.forAnalysis.folderName,
     file = here::here("data/projectSpecific/folderName",
                      "panel_forAnalysis_folderName.Rdata"))

save(spatial.forAnalysis.folderName,
     file = here::here("data/projectSpecific/folderName",
                      "spatial_forAnalysis_folderName.Rdata"))

save(crossSection.forAnalysis.folderName,
     file = here::here("data/projectSpecific/folderName",
                      "crossSection_forAnalysis_folderName.Rdata"))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
example_ExportTimeProcessing("projectSpecific/folderName")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------