
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: CONSTRUCT SAMPLE(S) OF INTEREST AT UNIT LEVEL - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIME
tictoc::tic(msg = "unitLevel_sampleConstruction.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# CLEAN DATA NAME
clean.datasetName <- readRDS(file = here::here("data/raw2clean/datasetName_dataSource/output", "clean_datasetName.rds"))


# PREP DATA NAME
prep.variableTheme <- readRDS(file = here::here("data/projectSpecific/prepData", "prep_variableTheme.rds"))





# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# construct sample of interest
unitLevel.dataFormat.sample <-



# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
# check existing labels
sjlabelled::get_label(unitLevel.dataFormat.sample)

# add labels when missing
sjlabelled::set_label(unitLevel.dataFormat.sample$column1) <- "description of column 1"


# OTHER EXPORT FORMATS



# POST-TREATMENT OVERVIEW
# summary(unitLevel.dataFormat.sample)






# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

saveRDS(unitLevel.dataFormat.sample,
        file = here::here("data/projectSpecific/unitLevel", "unitLevel_dataFormat_sample.rds"))


# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/projectSpecific")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------