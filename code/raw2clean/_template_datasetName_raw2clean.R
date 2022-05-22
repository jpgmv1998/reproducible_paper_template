
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

# GROUNDHOG (REPRODUCIBILITY SOLUTION TO HANDLING DIFFERENT VERSIONS OF R AND ITS PACKAGES)

# check if groundhog is installed and load it
if ("groundhog" %in% installed.packages()) {
  library("groundhog")
} else {
  install.packages("groundhog")
  library("groundhog")
}

# define date of reference to load all packages
groundhog.date <- "YYYY-MM-DD" # CHANGE TO THE DESIRED REFERENCE DATE TO DOWNLOAD THE PACKAGE'S VERSIONS

# guarantee version 1.5 of groundhog is being used (if you another version change the date)
groundhog::meta.groundhog(date = "2022-04-01")


# HERE
groundhog::groundhog.library("here", groundhog.date) # load package here


# TICTOC
groundhog::groundhog.library("tictoc", groundhog.date) # load package tictoc


# DECLARE LOCATION OF CURRENT SCRIPT TO SET UP PROJECT ROOT CORRECTLY
here::i_am("code/raw2clean/datasetName_raw2clean.R", uuid = "") # set uuid using uuid::UUIDgenerate()


# START TIME
tictoc::tic(msg = "datasetName_raw2clean script", log = T)



# SOURCE FUNCTIONS
source(here::here("code/_functions/ExportTimeProcessing.R"))



# LIBRARIES
groundhog::groundhog.library("sf", groundhog.date)         # to manipulate spatial data (vector format)
groundhog::groundhog.library("tidyverse", groundhog.date)  # manipulate tables, works with sf
groundhog::groundhog.library("sjlabelled", groundhog.date) # label columns, preferred than Hmisc::label because has function to clear labels when necessary
groundhog::groundhog.library("Hmisc", groundhog.date)      # use `describe` function to generate codebook
groundhog::groundhog.library("skimr", groundhog.date)      # use `skim` function to generate codebook
groundhog::groundhog.library("", groundhog.date)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# read input file
raw.datasetNameAbbrev <-



# DATA EXPLORATION [disabled for speed]
# summary(raw.datasetNameAbbrev)
# View(raw.datasetNameAbbrev)
# plot(raw.datasetNameAbbrev$geometry) # only for spatial data (shapefile)





# DATASET CLEANUP AND PREP ---------------------------------------------------------------------------------------------------------------------------

# COLUMN CLEANUP
# names
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
raw.datasetNameAbbrev <-
  raw.datasetNameAbbrev %>%
  dplyr::mutate(dplyr::across(tidyselect:::where(is.character),
                              iconv,
                              from = "UTF-8",
                              to = "ASCII//TRANSLIT")) # may not be necessary or need use other encoding



# PROJECTION - only for spatial data (shapefile)
raw.datasetNameAbbrev <- sf::st_transform(x = raw.datasetNameAbbrev, crs = 5880) # SIRGAS 2000 / Brazil Polyconic (https://epsg.io/5880)



# GEOMETRY CLEANUP - only for spatial data (shapefile)
raw.datasetNameAbbrev <- sf::st_make_valid(raw.datasetNameAbbrev)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(raw.datasetNameAbbrev$column1)            <- "description of column 1"
sjlabelled::set_label(raw.datasetNameAbbrev$column2)            <- "description of column 2"




# change object name for exportation
clean.datasetName <- raw.datasetNameAbbrev



# POST-TREATMENT OVERVIEW
# summary(clean.datasetName)
# View(clean.datasetName)
# plot(clean.datasetName$geometry) # only for spatial data (shapefile)



# CODEBOOK GENERATION (VARIABLES DESCRIPTION + SUMMARY STATISTICS)
sink(here::here("data/raw2clean/datasetName_dataSource/documentation/codebook_datasetName.txt")) # create text file to be filled with console output

# if the object is spatial (sf class) drop geoemtry column to simplify the codebook and avoid error in describe
if (any(class(clean.datasetName) == "sf")) {

  clean.datasetName %>% sf::st_drop_geometry() %>% Hmisc::describe() %>% print()
  clean.datasetName %>% sf::st_drop_geometry() %>% skimr::skim() %>% print()

} else {

  clean.datasetName %>% Hmisc::describe() %>% print()
  clean.datasetName %>% skimr::skim() %>% print()
}
sink() # close the sink





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(clean.datasetName,
     file = here::here("data/raw2clean/datasetName_dataSource/output",
                      "clean_datasetName.Rdata"))


# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("raw2clean")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------