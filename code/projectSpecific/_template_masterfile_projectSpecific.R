
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
source(here::here("code/projectSpecific/variableTheme_projectSpecific_prepData.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())





# RUN ALL UNIT LEVEL SCRIPTS -------------------------------------------------------------------------------------------------------------------------

# CONSTRUCT SAMPLE(S) OF INTEREST AT UNIT LEVEL
source(here::here("code/projectSpecific/sampleConstruction_projectSpecific_unitLevel.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())



# PREPARE VARIABLE THEME
source(here::here("code/projectSpecific/variableTheme_projectSpecific_unitLevel.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())



# GENERATE SAMPLE(S) FOR ANALYSIS
source(here::here("code/projectSpecific/sampleForAnalysis_projectSpecific_unitLevel.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())





# EXPORT TIME PROCESSING -----------------------------------------------------------------------------------------------------------------------------

# END TIMER
tictoc::toc(log = T)


# SOURCE EXPORT TIME PROCESSING AGAIN BECAUSE OF rm(list = ls()
source(here::here("code/_functions/ExportTimeProcessing.R"))

# export time to csv table
ExportTimeProcessing("code/projectSpecific")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------