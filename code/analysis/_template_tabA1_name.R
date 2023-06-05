
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: GENERATE TABLE A1: NAME - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "tabA1_name.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------





# GENERATE TABLE ------------------------------------------------------------------------------------------------------------------------------------





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------


# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/analysis")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------