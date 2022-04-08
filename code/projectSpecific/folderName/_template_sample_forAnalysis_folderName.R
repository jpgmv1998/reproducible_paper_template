
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: SHORT DESCRIPTION - TEMPLATE
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------


# INITIAL SETUP
source(here::here("code/_setup.R"))


# DECLARE LOCATION OF CURRENT SCRIPT TO SET UP PROJECT ROOT CORRECTLY
here::i_am("code/raw2clean/sample_forAnalysis_folderName.R", uuid = "b4b389a8-43fc-4b08-89ed-b45b09efdbf1") # change uuid using uuid::UUIDgenerate()


# START TIME
tictoc::tic(msg = "sample_forAnalysis_folderName script", log = T)



# SOURCE FUNCTIONS
source(here::here("code/_functions/ExportTimeProcessing.R"))



# LIBRARIES
groundhog::groundhog.library(pkg = , groundhog.date)





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