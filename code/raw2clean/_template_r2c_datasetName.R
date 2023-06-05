
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
tictoc::tic(msg = "r2c_datasetName.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# read input file
# raw.datasetName <- sf::st_read(dsn = here::here("data/raw2clean/dataName_source/input"),
#                                      layer = "layerName") # only for spatial data (vector)




# DATA EXPLORATION (use when building the script to understand the input data)
# summary(raw.datasetName)
# str(raw.datasetName) # avoid with spatial data
# plot(raw.datasetName$geometry) # only for spatial data (vector)





# DATASET CLEANUP AND PREP ---------------------------------------------------------------------------------------------------------------------------

# COLUMN CLEANUP

# extract column names
colnames(raw.datasetName)

# clean column names
raw.datasetName <-
  raw.datasetName %>%
  janitor::clean_names()

# extract column names
colnames(raw.datasetName)

# translate column names
raw.datasetName <-
  raw.datasetName %>%
  dplyr::rename()

# check columns class
lapply(raw.datasetName, class)

# change columns class
raw.datasetName <-
  raw.datasetName %>%
  dplyr::mutate()


# CHARACTER TREATMENT

# clean latin characters
raw.datasetName <-
  raw.datasetName %>%
  dplyr::mutate(dplyr::across(tidyselect:::where(is.character),
                              \(x) iconv(x, from = "UTF-8", to = "ASCII//TRANSLIT")))

# translate characters
raw.datasetName <-
  raw.datasetName %>%
  dplyr::mutate(column_name = dplyr::case_when(column_name == "character1" ~ "translation1",
                                               column_name == "character2" ~ "translation2",
                                               TRUE ~ column_name))


# SPATIAL DATA TREATMENT (vector)

# project to SIRGAS 2000 / Brazil Polyconic (https://epsg.io/5880)
# /!\ ADJUST THE CRS
raw.datasetName <- sf::st_transform(x = raw.datasetName, crs = 5880)

# check and clean geometries
raw.datasetName <- sf::st_make_valid(raw.datasetName)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(raw.datasetName$column1) <- "description of column 1"
sjlabelled::set_label(raw.datasetName$column2) <- "description of column 2"



# POST-TREATMENT OVERVIEW
# summary(raw.datasetName)
# str(raw.datasetName)
# plot(raw.datasetName$geometry) # only for spatial data (vector)



# CODEBOOK GENERATION (VARIABLES DESCRIPTION + SUMMARY STATISTICS)

# create text file to be filled with console output
sink(here::here("data/raw2clean/datasetName_dataSource/documentation/codebook_datasetName.txt"))

# if the object is spatial (sf class) drop geometry column to simplify the codebook and avoid error in describe
if (any(class(raw.datasetName) == "sf")) {

  # describe all variables
  raw.datasetName %>%
    sf::st_drop_geometry() %>%
    Hmisc::describe() %>%
    print()

} else {

  # describe all variables
  raw.datasetName %>%
    Hmisc::describe() %>%
    print()
}

# end printing console output to text file
sink()





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

saveRDS(raw.datasetName,
        file = here::here("data/raw2clean/datasetName_dataSource/output", "clean_datasetName.rds"))


# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/raw2clean")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------
