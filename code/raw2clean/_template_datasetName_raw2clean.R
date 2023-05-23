
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
# raw.datasetNameAbbrev <- sf::st_read(dsn = here::here("data/raw2clean/dataName_source/input"),
#                                      layer = "layerName") # only for spatial data (vector)




# DATA EXPLORATION (use when building the script to understand the input data)
# summary(raw.datasetNameAbbrev)
# str(raw.datasetNameAbbrev) # avoid with spatial data
# plot(raw.datasetNameAbbrev$geometry) # only for spatial data (vector)





# DATASET CLEANUP AND PREP ---------------------------------------------------------------------------------------------------------------------------

# COLUMN CLEANUP

# extract column names
colnames(raw.datasetNameAbbrev)

# clean column names
raw.datasetNameAbbrev <-
  raw.datasetNameAbbrev %>%
  janitor::clean_names()

# extract column names
colnames(raw.datasetNameAbbrev)

# translate column names
raw.datasetNameAbbrev <-
  raw.datasetNameAbbrev %>%
  dplyr::rename()

# check columns class
lapply(raw.datasetNameAbbrev, class)

# change columns class
raw.datasetNameAbbrev <-
  raw.datasetNameAbbrev %>%
  dplyr::mutate()


# CHARACTER TREATMENT

# clean latin characters
raw.datasetNameAbbrev <-
  raw.datasetNameAbbrev %>%
  dplyr::mutate(dplyr::across(tidyselect:::where(is.character),
                              \(x) iconv(x, from = "UTF-8", to = "ASCII//TRANSLIT")))

# translate characters
raw.datasetNameAbbrev <-
  raw.datasetNameAbbrev %>%
  dplyr::mutate(column_name = dplyr::case_when(column_name == "character1" ~ "translation1",
                                               column_name == "character2" ~ "translation2",
                                               TRUE ~ column_name))


# SPATIAL DATA TREATMENT (vector)

# project to SIRGAS 2000 / Brazil Polyconic (https://epsg.io/5880)
# /!\ ADJUST THE CRS
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

  # describe all variables
  raw.datasetNameAbbrev %>%
    sf::st_drop_geometry() %>%
    Hmisc::describe() %>%
    print()

} else {

  # describe all variables
  raw.datasetNameAbbrev %>%
    Hmisc::describe() %>%
    print()
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
