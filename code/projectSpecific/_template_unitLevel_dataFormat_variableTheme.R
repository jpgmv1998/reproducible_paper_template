
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
tictoc::tic(msg = "unitLevel_dataFormat_variableTheme.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# DATA FORMAT SAMPLE
unitLevel.dataFormat.sample <- readRDS(file = here::here("data/projectSpecific/unitLevel/unitLevel_dataFormat_sample.rds"))


# CLEAN DATA NAME
clean.datasetName <- readRDS(file = here::here("data/raw2clean/datasetName_dataSource/output", "clean_datasetName.rds"))


# PREP DATA NAME
prep.variableTheme <- readRDS(file = here::here("data/projectSpecific/prepData", "prep_variableTheme.rds"))





# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# MERGE DATA NAME WITH DATA FORMAT SAMPLE
# merge
unitLevel.dataFormat.variableTheme <-
  unitLevel.dataFormat.sample %>%
  tidylog::left_join(clean.datasetName, by = c("unitLevel")) %>%
  tidylog::left_join(prep.variableTheme, by = c("unitLevel"))





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
# check existing labels
sjlabelled::get_label(unitLevel.dataFormat.variableTheme)

# add labels when missing
sjlabelled::set_label(unitLevel.dataFormat.variableTheme$column1) <- "description of column 1"


# POST-TREATMENT OVERVIEW
# summary(unitLevel.dataFormat.variableTheme)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

saveRDS(unitLevel.dataFormat.variableTheme,
        file = here::here("data/projectSpecific/unitLevel", "unitLevel_dataFormat_variableTheme.rds"))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/projectSpecific")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------
