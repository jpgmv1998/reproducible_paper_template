
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
here::i_am("code/raw2clean/sampleConstruction_projectSpecific_folderName.R", uuid = "") # set uuid using uuid::UUIDgenerate()


# START TIME
tictoc::tic(msg = "sampleConstruction_projectSpecific_folderName script", log = T)



# SOURCE FUNCTIONS
source(here::here("code/_functions/ExportTimeProcessing.R"))



# LIBRARIES
groundhog::groundhog.library("tidyverse", groundhog.date) # manipulate tables, works with sf
groundhog::groundhog.library("sjlabelled", groundhog.date) # label columns, preferred than Hmisc::label because has function to clear labels when necessary
groundhog::groundhog.library("", groundhog.date)





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