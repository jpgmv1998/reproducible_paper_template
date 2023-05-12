
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
tictoc::tic(msg = "sampleConstruction_projectSpecific_unitLevel.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# CLEAN DATA NAME
clean.datasetNameAbbrev <- readRDS(file = here::here("data/raw2clean/datasetName_dataSource/output", "clean_datasetName.rds"))


# PREP DATA NAME
prep.variableTheme <- readRDS(file = here::here("data/projectSpecific/prepData", "prep_variableTheme.rds"))





# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# construct sample of interest
dataFormat.sample.unitLevel <-



# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(dataFormat.sample.unitLevel$column1) <- "description of column 1"



# OTHER EXPORT FORMATS




# POST-TREATMENT OVERVIEW
# summary(dataFormat.sample.unitLevel)






# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

saveRDS(dataFormat.sample.unitLevel,
        file = here::here("data/projectSpecific/unitLevel", "dataFormat_sample_unitLevel.rds"))




# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/projectSpecific/unitLevel")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------