
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: MASTERFILE SCRIPT TO SOURCE ALL PROJECT SPECIFIC MUNILEVEL SCRIPTS - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SOURCE ----------------------------------------------------------------------------------------------------------------------------------------------

# SAMPLE(S)

# CONSTRUCT SAMPLE OF INTEREST AND EXPORT IT IN POSSIBLY MULTIPLE DATA FORMATS
source("code/projectSpecific/folderName/sampleConstruction_projectSpecific_folderName.R", encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())



# VARIABLE THEME 1

# ADD VARIABLE THEME 1 INFO TO PROJECT DATA FORMAT SAMPLE
source("code/projectSpecific/folderName/dataFormat_variableTheme_projectSpecific_folderName.R", encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())



# VARIABLE THEME 2

# ADD VARIABLE THEME 2 INFO TO PROJECT DATA FORMAT SAMPLE
source("code/projectSpecific/folderName/dataFormat_variableTheme_projectSpecific_folderName.R", encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())



# OUTPUT(S) FOR ANALYSIS

# MERGE VARIABLES OF INTEREST AND EXPORT IT IN POSSIBLY MULTIPLE DATA FORMATS
source("code/projectSpecific/folderName/dataFormat_forAnalysis_folderName.R", encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())




# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------