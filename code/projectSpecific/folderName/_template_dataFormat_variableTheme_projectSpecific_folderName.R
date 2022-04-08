
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: MASTERFILE SCRIPT TO SOURCE ALL PROJECT SPECIFIC MUNILEVEL SCRIPTS - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -




# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# INITIAL SETUP
source(here::here("code/_setup.R"))


# DECLARE LOCATION OF CURRENT SCRIPT TO SET UP PROJECT ROOT CORRECTLY
here::i_am("code/raw2clean/dataFormat_variableTheme_projectSpecific_folderName.R", uuid = "b4b389a8-43fc-4b08-89ed-b45b09efdbf1") # change uuid using uuid::UUIDgenerate()


# START TIME
tictoc::tic(msg = "dataFormat_variableTheme_projectSpecific_folderName script", log = T)



# SOURCE FUNCTIONS
source(here::here("code/_functions/ExportTimeProcessing.R"))



# LIBRARIES
groundhog::groundhog.library(pkg = , groundhog.date)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# DATA FORMAT SAMPLE
load(here::here("data/projectSpecific/folderName/dataFormat_sample_folderName.Rdata"))



# CLEANED DATA
load(here::here("data/raw2clean/datasetName_dataSource/output/clean_datasetName.Rdata"))





# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# MERGE WITH SAMPLE

dataFormat.variableTheme.folderName <-
  dataFormat.sample.folderName %>%
  dplyr::left_join(clean.datasetName)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(dataFormat.variableTheme.folderName$column1) <- "description of column 1"



# POST-TREATMENT OVERVIEW
# summary(dataFormat.variableTheme.folderName)
# View(dataFormat.variableTheme.folderName)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(dataFormat.variableTheme.folderName,
     file = here::here("data/projectSpecific/folderName",
                      paste0("dataFormat_variableTheme_folderName", ".Rdata")))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("projectSpecific/folderName")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------
