
# > PROJECT INFO
# NAME: PRIORITY MUNICIPALITIES AMAZON - EXAMPLE
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: MASTERFILE SCRIPT TO SOURCE ALL PROJECT SPECIFIC MUNI LEVEL SCRIPTS
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# SOURCE ----------------------------------------------------------------------------------------------------------------------------------------------

# SAMPLE

# CONSTRUCT SAMPLE OF INTEREST AND EXPORT IT IN SPATIAL, CROSS-SECTION AND PANEL FORMATS
source("code/projectSpecific/muniLevel/_example_sampleConstruction_projectSpecific_muniLevel.R", encoding = "UTF-8", echo = T)



# PRIORITY MUNICIPALITIES

# ADD AMAZON PRIORITY MUNI INFO TO PROJECT PANEL SAMPLE
source("code/projectSpecific/muniLevel/_example_panel_priorityMuniAmazon_projectSpecific_muniLevel.R", encoding = "UTF-8", echo = T)




# DEFORESTATION

# ADD AMAZON PRODES LAND COVER/DEFORESTATION INFO TO PROJECT PANEL SAMPLE
source("code/projectSpecific/muniLevel/_example_panel_prodesDeforestationAmazonMuni_projectSpecific_muniLevel.R", encoding = "UTF-8", echo = T)



# OUTPUT FOR ANALYSIS

# SPATIAL
source("code/projectSpecific/muniLevel/_example_spatial_forAnalysis_muniLevel.R", encoding = "UTF-8", echo = T)

# CROSS-SECTION
source("code/projectSpecific/muniLevel/_example_crossSection_forAnalysis_muniLevel.R", encoding = "UTF-8", echo = T)

# PANEL
source("code/projectSpecific/muniLevel/_example_panel_forAnalysis_muniLevel.R", encoding = "UTF-8", echo = T)






# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------