
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
source("code/_functions/_example_ExportTimeProcessing.R")



# LIBRARIES
library(tidyverse) # manipulate tables, works with sf
library(sjlabelled) # sjlabelled::set_label columns, prefer than Hmisc::sjlabelled::set_label because has function to clear sjlabelled::set_labels when necessary
library(Hmisc)      # use `describe` function to generate codebook
library(skimr)      # use `skim` function to generate codebook



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
sjlabelled::set_label(raw.prodes$muni_name)                        <- "(cross-section) municipality name"
sjlabelled::set_label(raw.prodes$muni_code)                        <- "(cross-section) municipality code (7-digit, IBGE)"
sjlabelled::set_label(raw.prodes$state_uf)                         <- "(cross-section) state name (abbreviation)"
sjlabelled::set_label(raw.prodes$prodesAmazon_muniArea)            <- "(cross-section) municipal area (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$year)                             <- "(calendar or PRODES year) year of reference"
sjlabelled::set_label(raw.prodes$prodesAmazon_deforestAccumulated) <- "(PRODES year) total deforested area through Jul/t-1 (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_deforestIncrement)   <- "(PRODES year) increment in deforested area from Aug/t-1 through Jul/t (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_forest)              <- "(PRODES year) remaining primary forest area (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_cloud)               <- "(PRODES year) area covered by clouds during remote sensing (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_nonobserved)         <- "(PRODES year) area blocked from view during remote sensing (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_nonforest)           <- "(cross-section) area originally covered by non-tropical forest vegetation (sq km; PRODES)"
sjlabelled::set_label(raw.prodes$prodesAmazon_hidrography)         <- "(cross-section) area covered by bodies of water (sq km; PRODES)"



# change object name for exportation
clean.prodesDeforestationAmazonMuni <- raw.prodes



# POST-TREATMENT OVERVIEW
# summary(clean.prodesDeforestationAmazonMuni)
# View(clean.prodesDeforestationAmazonMuni)



# CODEBOOK GENERATION (VARIABLES DESCRIPTION + SUMMARY STATISTICS)
sink("data/raw2clean/_example_prodesDeforestationAmazonMuni_inpe/documentation/codebook_prodesDeforestationAmazonMuni.txt") # create text file to be filled with console output

# if the object is spatial (sf class) drop geoemtry column to simplify the codebook and avoid error in describe
if (any(class(clean.prodesDeforestationAmazonMuni) == "sf")) {

  clean.prodesDeforestationAmazonMuni %>% sf::st_drop_geometry() %>% Hmisc::describe() %>% print()
  clean.prodesDeforestationAmazonMuni %>% sf::st_drop_geometry() %>% skimr::skim() %>% print()

} else {

  clean.prodesDeforestationAmazonMuni %>% Hmisc::describe() %>% print()
  clean.prodesDeforestationAmazonMuni %>% skimr::skim() %>% print()
}
sink() # close the sink





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(clean.prodesDeforestationAmazonMuni,
     file = file.path("data/raw2clean/_example_prodesDeforestationAmazonMuni_inpe/output",
                      "_example_clean_prodesDeforestationAmazonMuni.Rdata"))


# END TIMER
tictoc::toc(log = T)

# export time to csv table
example_ExportTimeProcessing("raw2clean")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------