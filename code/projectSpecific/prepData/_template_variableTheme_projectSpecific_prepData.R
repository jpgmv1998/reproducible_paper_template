
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: PREPARE VARIABLE THEME - TEMPLATE
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
here::i_am("code/projectSpecific/prepData/variableTheme_projectSpecific_prepData.R", uuid = "") # set uuid using uuid::UUIDgenerate()


# START TIME
tictoc::tic(msg = "variableTheme_projectSpecific_prepData script", log = T)



# SOURCE FUNCTIONS
source(here::here("code/_functions/ExportTimeProcessing.R"))



# LIBRARIES
groundhog::groundhog.library("tidyverse", groundhog.date)  # manipulate tables, works with sf
groundhog::groundhog.library("sjlabelled", groundhog.date) # label columns, preferred than Hmisc::label because has function to clear labels when necessary
groundhog::groundhog.library("", groundhog.date)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# CLEANED DATA
load(here::here("data/raw2clean/datasetName_dataSource/output/clean_datasetName.Rdata"))





# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# MERGE WITH SAMPLE
dataFormat.variableTheme.prepData <-
  dataFormat.sample.prepData %>%
  dplyr::left_join(clean.datasetName)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(dataFormat.variableTheme.prepData$column1) <- "description of column 1"



# POST-TREATMENT OVERVIEW
# summary(dataFormat.variableTheme.prepData)
# View(dataFormat.variableTheme.prepData)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(dataFormat.variableTheme.prepData,
     file = here::here("data/projectSpecific/prepData",
                      paste0("dataFormat_variableTheme_prepData", ".Rdata")))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("projectSpecific/prepData")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------
