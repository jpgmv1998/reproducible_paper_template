
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: RUN REGRESSION NAME - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "reg_name.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------





# DATA PREP ------------------------------------------------------------------------------------------------------------------------------------------

# SELECT RELEVANT TIME PERIOD SAMPLE AND VARIABLES





# ESTIMATION -----------------------------------------------------------------------------------------------------------------------------------------





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

# save regression outputs
saveRDS(reg.name, file = here::here("data/analysis/regressions/reg_name.rds"))


# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/analysis")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------