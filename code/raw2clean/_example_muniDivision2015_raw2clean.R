
# > PROJECT INFO
# NAME: AMAZON PRIORITY MUNICIPALITIES - EXAMPLE
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: CLEAN RAW DATA SHAPEFILE OF MUNI DIVISION (2015) - EXAMPLE
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# START TIME
tictoc::tic(msg = "_example_muniDivision2015_raw2clean script", log = T)

# SOURCES
source("code/_functions/_example_ExportTimeProcessing.R")



# LIBRARIES
library(sf) # manipulate spatial data
library(tidyverse) # manipulate tables, works with sf
library(sjlabelled) # label columns, prefer than Hmisc::label because has function to clear labels when necessary
library(Hmisc)      # use `describe` function to generate codebook
library(skimr)      # use `skim` function to generate codebook




# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# read shapefile
raw.muni <- sf::st_read(dsn   = "data/raw2clean/_example_muniDivision2015_ibge/input",
                        layer = "BRMUE250GC_SIR")



# DATA EXPLORATION [disabled for speed]
# summary(raw.muni)
# View(raw.muni)
# plot(raw.muni$geometry)





# DATASET CLEANUP AND PREP ---------------------------------------------------------------------------------------------------------------------------

# COLUMN CLEANUP
# names
colnames(raw.muni)

# translate column names
raw.muni <-
  raw.muni %>%
  dplyr::rename(muni_code = CD_GEOCMU,
                muni_name = NM_MUNICIP)

# add state_uf column
raw.muni <-
  raw.muni %>%
  dplyr::mutate(state_uf = case_when(str_sub(muni_code, 1, 2) == 11 ~  "RO",
                                     str_sub(muni_code, 1, 2) == 12 ~  "AC",
                                     str_sub(muni_code, 1, 2) == 13 ~  "AM",
                                     str_sub(muni_code, 1, 2) == 14 ~  "RR",
                                     str_sub(muni_code, 1, 2) == 15 ~  "PA",
                                     str_sub(muni_code, 1, 2) == 16 ~  "AP",
                                     str_sub(muni_code, 1, 2) == 17 ~  "TO",
                                     str_sub(muni_code, 1, 2) == 21 ~  "MA",
                                     str_sub(muni_code, 1, 2) == 22 ~  "PI",
                                     str_sub(muni_code, 1, 2) == 23 ~  "CE",
                                     str_sub(muni_code, 1, 2) == 24 ~  "RN",
                                     str_sub(muni_code, 1, 2) == 25 ~  "PB",
                                     str_sub(muni_code, 1, 2) == 26 ~  "PE",
                                     str_sub(muni_code, 1, 2) == 27 ~  "AL",
                                     str_sub(muni_code, 1, 2) == 28 ~  "SE",
                                     str_sub(muni_code, 1, 2) == 29 ~  "BA",
                                     str_sub(muni_code, 1, 2) == 31 ~  "MG",
                                     str_sub(muni_code, 1, 2) == 32 ~  "ES",
                                     str_sub(muni_code, 1, 2) == 33 ~  "RJ",
                                     str_sub(muni_code, 1, 2) == 35 ~  "SP",
                                     str_sub(muni_code, 1, 2) == 41 ~  "PR",
                                     str_sub(muni_code, 1, 2) == 42 ~  "SC",
                                     str_sub(muni_code, 1, 2) == 43 ~  "RS",
                                     str_sub(muni_code, 1, 2) == 50 ~  "MS",
                                     str_sub(muni_code, 1, 2) == 51 ~  "MT",
                                     str_sub(muni_code, 1, 2) == 52 ~  "GO",
                                     str_sub(muni_code, 1, 2) == 53 ~  "DF"))

# class - muni_code should be numeric
lapply(raw.muni, class)

raw.muni <- raw.muni %>%  dplyr::mutate(muni_code = as.numeric(muni_code))



# LATIN CHARACTER TREATMENT
raw.muni <-
  raw.muni %>%
  dplyr::mutate(dplyr::across(tidyselect:::where(is.character), iconv, from = "UTF-8", to = "ASCII//TRANSLIT"))



# LETTERS CAPITALIZATION
raw.muni <-
  raw.muni %>%
  dplyr::mutate(muni_name = toupper(muni_name))



# PROJECTION
raw.muni <- sf::st_transform(x = raw.muni, crs = 5880) # SIRGAS 2000 / Brazil Polyconic (https://epsg.io/5880)



# REMOVE POLYGONS IDENTIFIED AS BODY OF WATERS AND NOT MUNICIPALITIES
raw.muni <- raw.muni %>% dplyr::filter(!muni_code %in% c(4300001, 4300002))



# GEOMETRY CLEANUP
raw.muni <- sf::st_make_valid(raw.muni)





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(raw.muni$muni_code) <- "(cross-section) municipality code (7-digit, IBGE)"
sjlabelled::set_label(raw.muni$muni_name) <- "(cross-section) municipality name"
sjlabelled::set_label(raw.muni$state_uf)  <- "(cross-section) state name (abbreviation)"




# change object name for exportation
clean.muniDivision2015 <- raw.muni



# POST-TREATMENT OVERVIEW
# summary(clean.muniDivision2015)
# View(clean.muniDivision2015)
# plot(clean.muniDivision2015$geoemtry)



# CODEBOOK GENERATION (VARIABLES DESCRIPTION + SUMMARY STATISTICS)
sink("data/raw2clean/_example_muniDivision2015_ibge/documentation/codebook_muniDivision2015.txt") # create text file to be filled with console output

# if the object is spatial (sf class) drop geoemtry column to simplify the codebook and avoid error in describe
if (any(class(clean.muniDivision2015) == "sf")) {

  clean.muniDivision2015 %>% sf::st_drop_geometry() %>% Hmisc::describe() %>% print()
  clean.muniDivision2015 %>% sf::st_drop_geometry() %>% skimr::skim() %>% print()

} else {

  clean.muniDivision2015 %>% Hmisc::describe() %>% print()
  clean.muniDivision2015 %>% skimr::skim() %>% print()
}
sink() # close the sink





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(clean.muniDivision2015,
     file = file.path("data/raw2clean/_example_muniDivision2015_ibge/output",
                      "_example_clean_muniDivision2015.Rdata"))


# END TIMER
tictoc::toc(log = T)

# export time to csv table
example_ExportTimeProcessing("raw2clean")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------