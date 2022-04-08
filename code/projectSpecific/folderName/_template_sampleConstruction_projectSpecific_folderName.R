
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: SHORT DESCRIPTION - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# INITIAL SETUP
source(here::here("code/_setup.R"))


# DECLARE LOCATION OF CURRENT SCRIPT TO SET UP PROJECT ROOT CORRECTLY
here::i_am("code/raw2clean/sampleConstruction_projectSpecific_folderName.R", uuid = "b4b389a8-43fc-4b08-89ed-b45b09efdbf1") # change uuid using uuid::UUIDgenerate()


# START TIME
tictoc::tic(msg = "sampleConstruction_projectSpecific_folderName script", log = T)



# SOURCE FUNCTIONS
source(here::here("code/_functions/ExportTimeProcessing.R"))



# LIBRARIES
groundhog::groundhog.library(pkg = , groundhog.date)



# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# DATASET 1 NAME
load(here::here("data/raw2clean/"))



# DATASET 2 NAME
load(here::here("data/raw2clean/"))





# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# construct sample of interest

dataFormat.sample.folderName <-



# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(dataFormat.sample.folderName$column1) <- "description of column 1"



# OTHER EXPORT FORMATS




# POST-TREATMENT OVERVIEW
# summary(dataFormat.sample.folderName)
# View(dataFormat.sample.folderName)
# plot(dataFormat.sample.folderName$geometry)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(dataFormat.sample.folderName,
     file = here::here("data/projectSpecific/folderName",
                      "dataFormat_sample_folderName.Rdata"))




# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("projectSpecific/folderName")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------