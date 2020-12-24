
# > PROJECT INFO
# NAME: AMAZON PRIORITY MUNICIPALITIES - EXAMPLE
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: CLEAN RAW BRAZILIAN AMAZON PRODES LAND COVER DATA (MUNI AGGREGATION) - EXAMPLE
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# START TIME
tictoc::tic(msg = "_example_prodesDeforestationAmazonMuni_raw2clean script", log = T)

# SOURCES
source("code/_functions/ExportTimeProcessing.R")



# LIBRARIES
library(tidyverse) # manipulate tables, works with sf
library(sjlabelled) # sjlabelled::set_label columns, prefer than Hmisc::sjlabelled::set_label because has function to clear sjlabelled::set_labels when necessary




# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# list all .txt input files
aux.txtFiles <- list.files(path = "data/raw2clean/_example_prodesDeforestationAmazonMuni_inpe/input",
                                 pattern = "*.txt",
                                 full.names = T)

# read all txt files, remove "Nr" and "Soma " columns and bind them into a single data.frame
raw.prodes <-
  aux.txtFiles %>%
  map(read_delim, delim = ",", locale = locale(encoding =  "latin1")) %>% # read all txt files
  map(select, -Nr, -`Soma `) %>%
  Reduce(function(x,y) {merge(x, y, all = T)}, .) # merge all files into a single data.frame




# DATA EXPLORATION [disabled for speed]
# summary(raw.prodes)
# View(raw.prodes)





# DATASET CLEANUP AND PREP ---------------------------------------------------------------------------------------------------------------------------

# COLUMN CLEANUP
# names
colnames(raw.prodes)

# fixed column names from pattern "IncrementoXXXXYYYY" to "IncrementoYYYY", where XXXX indicates year t-1 and YYYY indicates year t
raw.prodes <-
  raw.prodes %>%
  rename_with(.fn = ~ str_remove(.x, pattern = "\\d{4}"), .cols = starts_with("Incremento"))


# translate column names and select columns of interest
raw.prodes <-
  raw.prodes %>%
  dplyr::select(muni_name = Municipio,
                muni_code = CodIbge,
                state_uf = Estado,
                prodesAmazon_muniArea = AreaKm2,
                matches("\\d{4}$")) %>%
  dplyr::rename_with(.fn = ~ str_replace(., pattern = "Desmatado", replacement = "prodesAmazon_deforestAccumulated.")) %>%
  dplyr::rename_with(.fn = ~ str_replace(., pattern = "Incremento", replacement = "prodesAmazon_deforestIncrement.")) %>%
  dplyr::rename_with(.fn = ~ str_replace(., pattern = "NaoFloresta", replacement = "prodesAmazon_nonforest.")) %>%
  dplyr::rename_with(.fn = ~ str_replace(., pattern = "Floresta", replacement = "prodesAmazon_forest.")) %>%
  dplyr::rename_with(.fn = ~ str_replace(., pattern = "Nuvem", replacement = "prodesAmazon_cloud.")) %>%
  dplyr::rename_with(.fn = ~ str_replace(., pattern = "NaoObservado", replacement = "prodesAmazon_nonobserved.")) %>%
  dplyr::rename_with(.fn = ~ str_replace(., pattern = "Hidrografia", replacement = "prodesAmazon_hidrography."))


# RESHAPE
# reshape year information to long - add year dimension to panel of municipalities
raw.prodes <-
  raw.prodes %>%
  pivot_longer(cols = matches("\\d{4}$")) %>% # pivot all prodes_category_year columns to long format
  separate(name, c("prodes_category", "year"), sep = "\\.") %>% # break "prodes_category_year" into two column: one with "prodes_category" and one with "year"
  pivot_wider(names_from = prodes_category) # pivot prodes_category to wide format



# class
lapply(raw.prodes, class)

raw.prodes <- raw.prodes %>% mutate(year = as.integer(year))


# LATIN CHARACTER TREATMENT
raw.prodes <-
  raw.prodes %>%
  dplyr::mutate(dplyr::across(tidyselect:::where(is.character), iconv, from = "UTF-8", to = "ASCII//TRANSLIT"))



# LETTERS CAPITALIZATION
raw.prodes <-
  raw.prodes %>%
  dplyr::mutate(muni_name = toupper(muni_name))





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(raw.prodes$muni_name)                        <- "municipality name"
sjlabelled::set_label(raw.prodes$muni_code)                        <- "municipality code (7-digit, IBGE)"
sjlabelled::set_label(raw.prodes$state_uf)                         <- "state name (abbreviation)"
sjlabelled::set_label(raw.prodes$prodesAmazon_muniArea)            <- "municipal area (from PRODES data, sq km)"
sjlabelled::set_label(raw.prodes$year)                             <- "year of reference (calendar or PRODES year)"
sjlabelled::set_label(raw.prodes$prodesAmazon_deforestAccumulated) <- "(PRODES year) total deforested area through Jul/t-1 (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_deforestIncrement)   <- "(PRODES year) increment in deforested area from Aug/t-1 through Jul/t (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_forest)              <- "(PRODES year) remaining primary forest area (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_cloud)               <- "(PRODES year) area covered by clouds during remote sensing (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_nonobserved)         <- "(PRODES year) area blocked from view during remote sensing (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_nonforest)           <- "(PRODES year) area originally covered by something other than tropical forest (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_hidrography)         <- "(PRODES year) area covered by bodies of water (sq km; PRODES)"



# change object name for exportation
clean.prodesDeforestationAmazonMuni <- raw.prodes



# POST-TREATMENT OVERVIEW
# summary(clean.prodesDeforestationAmazonMuni)
# View(clean.prodesDeforestationAmazonMuni)





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(clean.prodesDeforestationAmazonMuni,
     file = file.path("data/raw2clean/_example_prodesDeforestationAmazonMuni_inpe/output",
                      "_example_clean_prodesDeforestationAmazonMuni.Rdata"))


# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("raw2clean")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------