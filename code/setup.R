
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: SETUP - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# INITIAL SETUP --------------------------------------------------------------------------------------------------------------------------------------

# INSTALL/LOAD GROUNDHOG PACKAGE (reproducibility solution for handling different versions of R and its packages)

# check if groundhog is installed and load it
if ("groundhog" %in% installed.packages()[,"Package"]) {
  library("groundhog")
} else {
  install.packages("groundhog")
  library("groundhog")
}

# define date of reference to load all packages (default works well with R 4.3.0 and groundhog 3.1.0, adjust the date to your needs)
groundhog.date <- "2023-05-06"

# guarantee version 3.1.0 of groundhog is being used (if you want a different version adjust the date)
groundhog::meta.groundhog(date = "2023-05-06")


# INSTALL/LOAD TINYTEX PACKAGE (A lightweight and easy-to-maintain LaTeX distribution used to generate pdfs with RMarkdown)
groundhog::groundhog.library("tinytex", groundhog.date)

# install tinytex version 2023.05 (only if it is not already installed)
if (tinytex::tinytex_root() == "") {
  tinytex::install_tinytex(version = "2023.05")
}





# ADDITIONAL PACKAGES --------------------------------------------------------------------------------------------------------------------------------

# INSTALL/LOAD PACKAGES USED IN THE TEMPLATE SCRIPTS (ADJUST THE LIST BELOW TO YOUR NEEDS)

# here - reproducibility solution for handling file paths
groundhog::groundhog.library("here", groundhog.date)

# tictoc - to register scripts time processing
groundhog::groundhog.library("tictoc", groundhog.date)

# rmarkdown - to use Rmarkdown files
groundhog::groundhog.library("rmarkdown", groundhog.date)

# sf - to manipulate spatial data (vector format)
groundhog::groundhog.library("sf", groundhog.date)

# tidyverse - an opinionated collection of R packages designed for data science that share an underlying design philosophy, grammar, and data structures
groundhog::groundhog.library("tidyverse", groundhog.date)

# sjlabelled - to label columns, preferred than Hmisc::label because has function to clear labels when necessary
groundhog::groundhog.library("sjlabelled", groundhog.date)

# Hmisc - to use `describe` function to generate codebook
groundhog::groundhog.library("Hmisc", groundhog.date)

# modelsummary - to use `datasummary_skim` function to generate codebook
groundhog::groundhog.library("modelsummary", groundhog.date)

# conflicted - to provide an alternative conflict resolution strategy when multiple packages have functions with the same name
#  making every conflict an error and forcing you to choose which function to use
groundhog::groundhog.library("conflicted", groundhog.date)



# LIST OF ADDITIONAL PACKAGES THAT MIGHT BE USEFUL

# brief description
# groundhog::groundhog.library("kableExtra", groundhog.date)



# SOURCE FUNCTIONS -----------------------------------------------------------------------------------------------------------------------------------

# ExportTimeProcessing - function to export scripts time processing, registered with ticotoc,to csv files
source(here::here("code/_functions/ExportTimeProcessing.R"))


# SOFTWARE CITATION ----------------------------------------------------------------------------------------------------------------------------------

# record all R packages as software citations in a BibTeX file
knitr::write_bib(c(.packages()), here::here("references/references_software.bib"))






# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------