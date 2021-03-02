
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

# START TIME
tictoc::tic(msg = "sampleConstruction_projectSpecific_folderName script", log = T)

# SOURCES
source("code/_functions/ExportTimeProcessing.R")



# LIBRARIES
library()




# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# DATASET 1 NAME
load("data/raw2clean/")



# DATASET 2 NAME
load("data/raw2clean/")





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
     file = file.path("data/projectSpecific/folderName",
                      "dataFormat_sample_folderName.Rdata"))




# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("projectSpecific/folderName")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------