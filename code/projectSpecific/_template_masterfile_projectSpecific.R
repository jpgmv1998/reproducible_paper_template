
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: MASTERFILE SCRIPT TO SOURCE ALL PROJECT-SPECIFIC SCRIPTS - TEMPLATE
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
here::i_am("code/projectSpecific/_masterfile_projectSpecific.R", uuid = "") # set uuid using uuid::UUIDgenerate()


# START TIME
tictoc::tic(msg = "_masterfile_projectSpecific script", log = T)


# LIBRARIES
groundhog::groundhog.library("sf", groundhog.date)         # to manipulate spatial data (vector format)
groundhog::groundhog.library("tidyverse", groundhog.date)  # manipulate tables, works with sf
groundhog::groundhog.library("sjlabelled", groundhog.date) # label columns, preferred than Hmisc::label because has function to clear labels when necessary
groundhog::groundhog.library("", groundhog.date)






# PREP DATA ------------------------------------------------------------------------------------------------------------------------------------------

# PREPARE VARIABLE THEME
source(here::here("code/projectSpecific/prepData/variableTheme_projectSpecific_prepData.R"), encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())





# FOLDER NAME ----------------------------------------------------------------------------------------------------------------------------------------

# SAMPLE(S)

# CONSTRUCT SAMPLE OF INTEREST AND EXPORT IT IN POSSIBLY MULTIPLE DATA FORMATS
source(here::here("code/projectSpecific/folderName/sampleConstruction_projectSpecific_folderName.R"), encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())



# VARIABLE THEME

# ADD VARIABLE THEME INFO TO PROJECT DATA FORMAT SAMPLE
source(here::here("code/projectSpecific/folderName/dataFormat_variableTheme_projectSpecific_folderName.R"), encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())



# OUTPUT(S) FOR ANALYSIS

# MERGE VARIABLES OF INTEREST AND EXPORT IT IN POSSIBLY MULTIPLE DATA FORMATS
source(here::here("code/projectSpecific/folderName/dataFormat_forAnalysis_folderName.R"), encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())





# EXPORT TIME PROCESSING -----------------------------------------------------------------------------------------------------------------------------

# END TIMER
tictoc::toc(log = T)


# SOURCE FUNCTIONS - after scripts to avoid rm(list = ls())
source(here::here("code/_functions/ExportTimeProcessing.R"))

# export time to csv table
ExportTimeProcessing("projectSpecific")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------