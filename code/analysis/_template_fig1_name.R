
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: GENERATE FIGURE 1: NAME - TEMPLATE
# AUTHOR: SCRIPT AUTHOR(S) NAME(S)
#
# > NOTES
# 1: -





# SETUP ----------------------------------------------------------------------------------------------------------------------------------------------

# RUN 'setup.R' TO CONFIGURE INITIAL SETUP (mostly installing/loading packages)
source("code/setup.R")


# START TIMER
tictoc::tic(msg = "fig1_name.R script", log = T)





# DATA INPUT -----------------------------------------------------------------------------------------------------------------------------------------






# GENERATE FIGURE ------------------------------------------------------------------------------------------------------------------------------------





# EXPORT ---------------------------------------------------------------------------------------------------------------------------------------------

ggplot2::ggsave(plot = plot.type.name,
                filename = here::here(glue::glue("results/figures/fig1_name.png")),
                width = 12, height = 6, dpi = 300) # adjust width, height, dpi


# END TIMER
tictoc::toc(log = T)

# export time to csv table
ExportTimeProcessing("code/analysis")





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------