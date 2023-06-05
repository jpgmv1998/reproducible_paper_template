
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
tictoc::tic(msg = "unitLevel_sampleForAnalysis.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# DATA FORMAT SAMPLE
unitLevel.dataFormat.sample <- readRDS(file = here::here("data/projectSpecific/unitLevel/unitLevel_dataFormat_sample.rds"))


# VARIABLE 1
unitLevel.dataFormat.variableTheme <- readRDS(file = here::here("data/projectSpecific/unitLevel/unitLevel_dataFormat_variableTheme.rds"))





# DATA MERGE -----------------------------------------------------------------------------------------------------------------------------------------

# merge sample with all variables of interest
unitLevel.dataFormat.sampleForAnalysis <-
  unitLevel.dataFormat.sample %>%
  dplyr::left_join(unitLevel.dataFormat.variableTheme)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
# check existing labels
sjlabelled::get_label(unitLevel.dataFormat.sampleForAnalysis)

# add labels when missing
sjlabelled::set_label(unitLevel.dataFormat.sampleForAnalysis$column1) <- "description of column 1"


# POST-TREATMENT OVERVIEW
# summary(unitLevel.dataFormat.sampleForAnalysis)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

saveRDS(unitLevel.dataFormat.sampleForAnalysis,
        file = here::here("data/projectSpecific/unitLevel", "unitLevel_dataFormat_sampleForAnalysis.rds"))


# END TIMER
tictoc::toc(log = T)

# export time to csv table
example_ExportTimeProcessing("code/projectSpecific")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------