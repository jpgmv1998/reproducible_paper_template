
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: MASTERFILE SCRIPT TO RUN ALL SUBFOLDER MASTERFILES - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "MASTERFILE.R script", log = T)





# RUN MASTERFILES ------------------------------------------------------------------------------------------------------------------------------------

# RUN RAW2CLEAN SCRIPTS
source(file = here::here("code/raw2clean/masterfile_raw2clean.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())


# RUN PROJECT-SPECIFIC SCRIPTS
source(file = here::here("code/raw2clean/masterfile_projectSpecific.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())


# RUN ANALYSIS SCRIPTS
source(file = here::here("code/raw2clean/masterfile_analysis.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())





# EXPORT TIME PROCESSING -----------------------------------------------------------------------------------------------------------------------------

# END TIMER
tictoc::toc(log = T)


# SOURCE EXPORT TIME PROCESSING AGAIN BECAUSE OF rm(list = ls()
source(here::here("code/_functions/ExportTimeProcessing.R"))

# export time to csv table
ExportTimeProcessing("code")




# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------