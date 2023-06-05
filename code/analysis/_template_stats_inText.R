
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: GENERATE SUPPORTING STATS CITED IN-TEXT - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "stats_inText.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------




# DATA PREP ------------------------------------------------------------------------------------------------------------------------------------------






# STATISTICS CITED IN THE TEXT -----------------------------------------------------------------------------------------------------------------------

sink(here::here("results/stats/stats_inText.txt"))

# in-text citation 1
print("(page X): in-text citation 1")

# print the statistic
print()

# in-text citation 2
print("(page X): in-text citation 2")

# print the statistic
print()

# end printing console output to text file
sink()


# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/analysis")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------