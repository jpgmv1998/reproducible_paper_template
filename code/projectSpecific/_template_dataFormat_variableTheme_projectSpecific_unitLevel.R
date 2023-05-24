
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: ADD VARIABLE THEME INFO TO PROJECT DATA FORMAT SAMPLE - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -




# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "dataFormat_variableTheme_projectSpecific_unitLevel.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# DATA FORMAT SAMPLE
dataFormat.sample.unitLevel <- readRDS(file = here::here("data/projectSpecific/unitLevel/dataFormat_sample_unitLevel.rds"))


# CLEAN DATA NAME
clean.datasetName <- readRDS(file = here::here("data/raw2clean/datasetName_dataSource/output", "clean_datasetName.rds"))


# PREP DATA NAME
prep.variableTheme <- readRDS(file = here::here("data/projectSpecific/prepData", "prep_variableTheme.rds"))





# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# MERGE DATA NAME WITH DATA FORMAT SAMPLE
# merge
dataFormat.variableTheme.unitLevel <-
  dataFormat.sample.unitLevel %>%
  tidylog::left_join(clean.datasetName, by = c("unitLevel")) %>%
  tidylog::left_join(prep.variableTheme, by = c("unitLevel"))





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
# check existing labels
sjlabelled::get_label(dataFormat.variableTheme.unitLevel)

# add labels when missing
sjlabelled::set_label(dataFormat.variableTheme.unitLevel$column1) <- "description of column 1"


# POST-TREATMENT OVERVIEW
# summary(dataFormat.variableTheme.unitLevel)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

saveRDS(dataFormat.variableTheme.unitLevel,
        file = here::here("data/projectSpecific/unitLevel", "dataFormat_variableTheme_unitLevel.rds"))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/projectSpecific")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------
