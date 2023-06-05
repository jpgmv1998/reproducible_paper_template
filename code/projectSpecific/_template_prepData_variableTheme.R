
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: PREPARE VARIABLE THEME - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -




# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "prepData_variableTheme.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# CLEANED DATA 1
clean.datasetName <- readRDS(file = here::here("data/raw2clean/datasetName_dataSource/output", "clean_datasetName.rds"))

# CLEANED DATA 2
clean.datasetName2 <- readRDS(file = here::here("data/raw2clean/datasetName2_dataSource/output", "clean_datasetName2.rds"))




# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

prep.variableTheme <-



# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
# check existing labels
sjlabelled::get_label(prep.variableTheme)

# add labels when missing
sjlabelled::set_label(prep.variableTheme$column1) <- "description of column 1"


# POST-TREATMENT OVERVIEW
# summary(prep.variableTheme)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

saveRDS(prep.variableTheme,
        file = here::here("data/projectSpecific/prepData", "prep_variableTheme.rds"))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/projectSpecific")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------
