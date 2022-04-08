
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: INITIAL SETUP (PACKAGE VERSION MANAGEMENT WITH GROUNDHOG + RELATIVE PATH WITH HERE)
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# GROUNDHOG
# install.packages("groundhog") # necessary only in the first time
groundhog.date <- "2021-01-01" # define date of reference to load all packages
groundhog::meta.groundhog(date = "2022-01-01") # guarantee version 1.5 of groundhog is being used



# HERE
groundhog::groundhog.library("here", groundhog.date) # load package here




# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------