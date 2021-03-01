
# > PROJECT INFO
# NAME: AMAZON PRIORITY MUNICIPALITIES - EXAMPLE
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: EXTRACT AMAZON PRIORITY MUNI DATA FROM PDF AND CLEAN IT - EXAMPLE
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# START TIME
tictoc::tic(msg = "_example_priorityMuniAmazon_raw2clean script", log = T)

# SOURCES
source("code/_functions/_example_ExportTimeProcessing.R")



# LIBRARIES
library(tabulizer)  # extract table from pdf
library(tidyverse)  # manipulate tables, works with sf
library(sjlabelled) # label columns, preferred than Hmisc::label because has function to clear labels when necessary
library(Hmisc)      # use `describe` function to generate codebook
library(skimr)      # use `skim` function to generate codebook




# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------

# RAW DATA
# extract table from first page of the PDF
raw.priorityMuniAmazon.1 <- data.frame(tabulizer::extract_tables("data/raw2clean/_example_priorityMuniAmazon_mma/input/lista_municipios_prioritarios_AML_2017.pdf",
                                                                 pages = 1, output = "data.frame", encoding = "UTF-8"))

# extract table from second page of the PDF
raw.priorityMuniAmazon.2 <- data.frame(tabulizer::extract_tables("data/raw2clean/_example_priorityMuniAmazon_mma/input/lista_municipios_prioritarios_AML_2017.pdf",
                                                                 pages = 2, output = "data.frame", guess = F, encoding = "UTF-8",
                                                                 area = list(c(131.7639 , 101.7254 , 506.5210 , 522.6854))))







# DATA MANIPULATION ----------------------------------------------------------------------------------------------------------------------------------

# FIRST PAGE TREATMENT - ACTUAL PRIORITY LIST

# column selection and rename
raw.priorityMuniAmazon.1 <- raw.priorityMuniAmazon.1 %>%
  dplyr::rename(state_uf = "UF",
                muni_name = "Nome",
                entry_year = "Ano.de.Entrada",
                entry_lawOrdinance = "Portaria.de.Entrada") %>%
  dplyr::select(-X) %>%
  tibble::as_tibble()

# add empty columns to match with table from page 2
raw.priorityMuniAmazon.1 <-
  raw.priorityMuniAmazon.1 %>%
  dplyr::mutate(exit_year  = as.numeric(NA),
         exit_lawOrdinance = as.character(NA))

# class - no need of change
lapply(raw.priorityMuniAmazon.1, class)



# LATIN CHARACTER TREATMENT
raw.priorityMuniAmazon.1 <-
  raw.priorityMuniAmazon.1 %>%
  dplyr::mutate(dplyr::across(tidyselect:::where(is.character), iconv, from = "UTF-8", to = "ASCII//TRANSLIT"))



# SECOND PAGE TREATMENT - HISTORIC LIST

# column selection and rename
raw.priorityMuniAmazon.2 <-
  raw.priorityMuniAmazon.2 %>%
  dplyr::rename(state_uf = "UF",
                muni_name = "Nome",
                entry_year = "Ano.de",
                entry_lawOrdinance = "Portaria.de.Entrada",
                exit_year = "Ano.de.1",
                exit_lawOrdinance = "Portaria.de.saída") %>%
  tibble::as_tibble()



# LATIN CHARACTER TREATMENT
raw.priorityMuniAmazon.2 <-
  raw.priorityMuniAmazon.2 %>%
  dplyr::mutate(dplyr::across(tidyselect:::where(is.character), iconv, from = "UTF-8", to = "ASCII//TRANSLIT"))

# manual fix input errors due to double lined cells
raw.priorityMuniAmazon.2 <-
  raw.priorityMuniAmazon.2 %>%
  dplyr::filter((stringr::str_detect(state_uf, ""))) %>%
  dplyr::mutate(muni_name = dplyr::case_when(muni_name == "PORTO DOS"    ~ "PORTO DOS GAUCHOS",
                                             muni_name == "SAO FELIX DO" ~ "SAO FELIX DO ARAGUAIA",
                                             muni_name == "SANTANA DO"   ~ "SANTANA DO ARAGUAIA",
                                             muni_name == "SANTA MARIA"  ~ "SANTA MARIA DAS BARREIRAS",
                                             TRUE                        ~ muni_name))

# class - change years to numeric
lapply(raw.priorityMuniAmazon.2, class)
raw.priorityMuniAmazon.2 <-
  raw.priorityMuniAmazon.2 %>%
  dplyr::mutate(dplyr::across(tidyselect::ends_with("year"), as.numeric))



# MERGE

# use bind_rows because both tables have the same columns
raw.priorityMuniAmazon <- bind_rows(raw.priorityMuniAmazon.1, raw.priorityMuniAmazon.2)

# clear environment
rm(raw.priorityMuniAmazon.1, raw.priorityMuniAmazon.2)



# PRODES YEAR
raw.priorityMuniAmazon <-
  raw.priorityMuniAmazon %>%
  mutate(entry_year_prodes = if_else(entry_year %in%  c(2012, 2017),
                                     entry_year + 1,
                                     entry_year), # 2012 and 2017 lists were published in the 2nd semester so they belong to the following PRODES year
         exit_year_prodes  = if_else(exit_lawOrdinance %in% c("Portaria n 324/2012", "Portaria n 412/2013", "Portaria n 362/2017"),
                                     exit_year + 1,
                                     exit_year)) # one list from 2012, 2013 and 2017 exit lists were published in the 2nd semester so they belong to the following PRODES year





# EXPORT PREP ----------------------------------------------------------------------------------------------------------------------------------------

# LABELS
sjlabelled::set_label(raw.priorityMuniAmazon$state_uf)           <- "(cross-section) state name (abbreviation)"
sjlabelled::set_label(raw.priorityMuniAmazon$muni_name)          <- "(cross-section) municipality name"
sjlabelled::set_label(raw.priorityMuniAmazon$entry_year)         <- "(calendar year) year when the municipality was placed on the list"
sjlabelled::set_label(raw.priorityMuniAmazon$entry_year_prodes)  <- "(PRODES year) year when the municipality was placed on the list"
sjlabelled::set_label(raw.priorityMuniAmazon$entry_lawOrdinance) <- "(calendar date) law ordinance name that placed the municipality on the list"
sjlabelled::set_label(raw.priorityMuniAmazon$exit_year)          <- "(calendar year) year when the municipality was removed from the list"
sjlabelled::set_label(raw.priorityMuniAmazon$exit_year_prodes)   <- "(PRODES year) year when the municipality was removed from the list"
sjlabelled::set_label(raw.priorityMuniAmazon$exit_lawOrdinance)  <- "(calendar date) law ordinance name that removed the municipality from the list"

# change final object name
clean.priorityMuniAmazon <- raw.priorityMuniAmazon



# POST-TREATMENT OVERVIEW
# summary(clean.priorityMuniAmazon)
# View(clean.priorityMuniAmazon)



# CODEBOOK GENERATION (VARIABLES DESCRIPTION + SUMMARY STATISTICS)
sink("data/raw2clean/_example_priorityMuniAmazon_mma/documentation/codebook_priorityMuniAmazon.txt") # create text file to be filled with console output

# if the object is spatial (sf class) drop geometry column to simplify the codebook and avoid error in describe
if (any(class(clean.priorityMuniAmazon) == "sf")) {

  clean.priorityMuniAmazon %>% sf::st_drop_geometry() %>% Hmisc::describe() %>% print()
  clean.priorityMuniAmazon %>% sf::st_drop_geometry() %>% skimr::skim() %>% print()

} else {

  clean.priorityMuniAmazon %>% Hmisc::describe() %>% print()
  clean.priorityMuniAmazon %>% skimr::skim() %>% print()
}
sink() # close the sink


# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

save(clean.priorityMuniAmazon,
     file = file.path("data/raw2clean/_example_priorityMuniAmazon_mma/output",
                      paste0("_example_clean_priorityMuniAmazon", ".Rdata")))



# END TIMER
tictoc::toc(log = T)

# export time to csv table
example_ExportTimeProcessing("raw2clean")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------