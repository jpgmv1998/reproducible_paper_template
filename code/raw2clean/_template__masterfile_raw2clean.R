
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: MASTERFILE SCRIPT TO RUN ALL RAW2CLEAN SCRIPTS - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "_masterfile_raw2clean.R script", log = T)





# RUN RAW2CLEAN SCRIPTS ------------------------------------------------------------------------------------------------------------------------------

# SHORT DESCRIPTION
source(file = here::here("code/raw2clean/r2c_datasetName.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())





# EXPORT TIME PROCESSING -----------------------------------------------------------------------------------------------------------------------------

# END TIMER
tictoc::toc(log = T)


# SOURCE EXPORT TIME PROCESSING AGAIN BECAUSE OF rm(list = ls()
source(here::here("code/_functions/ExportTimeProcessing.R"))

# export time to csv table
ExportTimeProcessing("code/raw2clean")




# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------