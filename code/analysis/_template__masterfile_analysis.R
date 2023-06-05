
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: MASTERFILE SCRIPT TO RUN ALL ANALYSIS SCRIPTS - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "_masterfile_analysis.R script", log = T)




# RUN ALL REGRESSIONS --------------------------------------------------------------------------------------------------------------------------------

# RUN REGRESSION NAME
source(here::here("code/analysis/reg_name.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())





# RUN PAPER MAIN RESULTS ------------------------------------------------------------------------------------------------------------------------------

# GENERATE SUPPORTING STATS CITED IN-TEXT
source(here::here("code/analysis/stats_inText.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())


# GENERATE FIGURE 1: NAME
source(here::here("code/analysis/fig1_name.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())


# GENERATE TABLE 1: NAME
source(here::here("code/analysis/tab1_name.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())



# RUN PAPER APPENDIX RESULTS ---------------------------------------------------------------------------------------------------------------------------

# GENERATE FIGURE A1: NAME
source(here::here("code/analysis/figA1_name.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())


# GENERATE TABLE A1: NAME
source(here::here("code/analysis/tabA1_name.R"), encoding = "UTF-8", echo = T)

# clear all objects from global environment
rm(list = ls())





# EXPORT TIME PROCESSING -----------------------------------------------------------------------------------------------------------------------------

# END TIMER
tictoc::toc(log = T)


# SOURCE EXPORT TIME PROCESSING AGAIN BECAUSE OF rm(list = ls()
source(here::here("code/_functions/ExportTimeProcessing.R"))

# export time to csv table
ExportTimeProcessing("code/analysis")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------