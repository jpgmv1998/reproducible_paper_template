
# > PROJECT INFO
# NAME: AMAZON PRIORITY MUNICIPALITIES - EXAMPLE
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: MASTERFILE SCRIPT TO SOURCE ALL RAW2CLEAN SCRIPTS - EXAMPLE
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# SOURCE ----------------------------------------------------------------------------------------------------------------------------------------------

# CLEAN BRAZILIAN MUNICIPALITY DIVISION (2015)
source("code/raw2clean/_example_muniDivision2015_raw2clean.R", encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())


# CLEAN BRAZILIAN BIOMES DIVISION (2019)
source("code/raw2clean/_example_biomeDivision_raw2clean.R", encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())


# EXTRACT DATA FROM PDF AND CLEAN AMAZON PRIORITY MUNICIPALITIES
source("code/raw2clean/_example_priorityMuniAmazon_raw2clean.R", encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())


# CLEAN RAW BRAZILIAN AMAZON PRODES LAND COVER DATA (MUNI AGGREGATION)
source("code/raw2clean/_example_prodesDeforestationAmazonMuni_raw2clean.R", encoding = "UTF-8", echo = T)

# clear enviromnet
rm(list = ls())





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------