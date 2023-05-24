
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: CONSTRUCT FINAL SAMPLE(S) FOR ANALYSIS - TEMPLATE
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "sampleForAnalysis_projectSpecific_unitLevel.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# DATA FORMAT SAMPLE
dataFormat.sample.unitLevel <- readRDS(file = here::here("data/projectSpecific/unitLevel/dataFormat_sample_unitLevel.rds"))


# VARIABLE 1
dataFormat.variableTheme.unitLevel <- readRDS(file = here::here("data/projectSpecific/unitLevel/dataFormat_variableTheme_unitLevel.rds"))





# DATA MERGE -----------------------------------------------------------------------------------------------------------------------------------------

# merge sample with all variables of interest
dataFormat.forAnalysis.unitLevel <-
  dataFormat.sample.unitLevel %>%
  dplyr::left_join(dataFormat.variableTheme.unitLevel)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
# check existing labels
sjlabelled::get_label(dataFormat.forAnalysis.unitLevel)

# add labels when missing
sjlabelled::set_label(dataFormat.forAnalysis.unitLevel$column1) <- "description of column 1"


# POST-TREATMENT OVERVIEW
# summary(dataFormat.forAnalysis.unitLevel)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

saveRDS(dataFormat.forAnalysis.unitLevel,
        file = here::here("data/projectSpecific/unitLevel", "dataFormat_forAnalysis_unitLevel.rds"))


# END TIMER
tictoc::toc(log = T)

# export time to csv table
example_ExportTimeProcessing("code/projectSpecific")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------