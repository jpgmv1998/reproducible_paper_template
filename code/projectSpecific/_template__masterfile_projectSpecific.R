
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: MASTERFILE SCRIPT TO RUN ALL PROJECT-SPECIFIC SCRIPTS - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "_masterfile_projectSpecific.R script", log = T)






# RUN ALL PREP DATA SCRIPTS --------------------------------------------------------------------------------------------------------------------------

# PREPARE VARIABLE THEME
source(here::here("code/projectSpecific/prepData_variableTheme.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())





# RUN ALL UNIT LEVEL SCRIPTS -------------------------------------------------------------------------------------------------------------------------

# CONSTRUCT SAMPLE(S) OF INTEREST AT UNIT LEVEL
source(here::here("code/projectSpecific/unitLevel_sampleConstruction.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())


# ADD VARIABLE THEME
source(here::here("code/projectSpecific/unitLevel_dataFormat_variableTheme.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())


# CONSTRUCT FINAL SAMPLE(S) FOR ANALYSUS
source(here::here("code/projectSpecific/unitLevel_sampleForAnalysis.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())





# EXPORT TIME PROCESSING -----------------------------------------------------------------------------------------------------------------------------

# END TIMER
tictoc::toc(log = T)


# SOURCE EXPORT TIME PROCESSING AGAIN BECAUSE OF rm(list = ls())
source(here::here("code/_functions/ExportTimeProcessing.R"))

# export time to csv table
ExportTimeProcessing("code/projectSpecific")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------