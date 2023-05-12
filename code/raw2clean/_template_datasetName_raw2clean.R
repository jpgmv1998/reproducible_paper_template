
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: RAW2CLEAN SCRIPT - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "datasetName_raw2clean.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# read input file
raw.datasetNameAbbrev <-



# DATA EXPLORATION (use when building the script to understand the input data)
# summary(raw.datasetNameAbbrev)
# str(raw.datasetNameAbbrev)
# plot(raw.datasetNameAbbrev$geometry) # only for spatial data (vector)





# DATASET CLEANUP AND PREP ---------------------------------------------------------------------------------------------------------------------------

# COLUMN CLEANUP

# extract column names
colnames(raw.datasetNameAbbrev)

# translate column names
raw.datasetNameAbbrev <-
  raw.datasetNameAbbrev %>%
  dplyr::rename()


# class - check columns class and change it when necessary
lapply(raw.datasetNameAbbrev, class)

raw.datasetNameAbbrev <-
  raw.datasetNameAbbrev %>%
  dplyr::mutate()



# LATIN CHARACTER TREATMENT

# convert enconding to remove special characters (may not be necessary or need use other encoding)
raw.datasetNameAbbrev <-
  raw.datasetNameAbbrev %>%
  dplyr::mutate(dplyr::across(tidyselect:::where(is.character),
                              iconv,
                              from = "UTF-8",
                              to = "ASCII//TRANSLIT"))



# SPATIAL DATA TREATMENT (vector)

# project to SIRGAS 2000 / Brazil Polyconic (https://epsg.io/5880)
raw.datasetNameAbbrev <- sf::st_transform(x = raw.datasetNameAbbrev, crs = 5880)

# check and clean geometries
raw.datasetNameAbbrev <- sf::st_make_valid(raw.datasetNameAbbrev)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(raw.datasetNameAbbrev$column1) <- "description of column 1"
sjlabelled::set_label(raw.datasetNameAbbrev$column2) <- "description of column 2"



# POST-TREATMENT OVERVIEW
# summary(raw.datasetNameAbbrev)
# str(raw.datasetNameAbbrev)
# plot(raw.datasetNameAbbrev$geometry) # only for spatial data (vector)



# CODEBOOK GENERATION (VARIABLES DESCRIPTION + SUMMARY STATISTICS)

# create text file to be filled with console output
sink(here::here("data/raw2clean/datasetName_dataSource/documentation/codebook_datasetName.txt"))

# if the object is spatial (sf class) drop geometry column to simplify the codebook and avoid error in describe
if (any(class(raw.datasetNameAbbrev) == "sf")) {

  raw.datasetNameAbbrev %>% sf::st_drop_geometry() %>% Hmisc::describe() %>% print()
  raw.datasetNameAbbrev %>% sf::st_drop_geometry() %>% modelsummary::datasummary_skim() %>% print()

} else {

  raw.datasetNameAbbrev %>% Hmisc::describe() %>% print()
  raw.datasetNameAbbrev %>% modelsummary::datasummary_skim() %>% print()
}

# end printing console output to text file
sink()





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

saveRDS(raw.datasetNameAbbrev,
        file = here::here("data/raw2clean/datasetName_dataSource/output", "clean_datasetName.rds"))


# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/raw2clean")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------