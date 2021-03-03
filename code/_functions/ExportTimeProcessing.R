
# > PROJECT INFO
# NAME: CERRADO PRIORITY MUNICIPALITIES
# LEAD: JOAO VIEIRA
#
# > THIS SCRIPT
# AIM: EXPORT TIME OF PROCESSING
# AUTHOR: JOAO VIEIRA
#
# > NOTES
# 1: -





# FUNCTION -------------------------------------------------------------------------------------------------------------------------------------------

ExportTimeProcessing <- function(fctn.codeDir = "") {

  # EXPORT TIME OF PROCESSING TO A CSV TABLE
  #
  # ARGS
  #   fctn.codeDir: name of code directory where the script lives
  #
  # RETURN
  #   nothing, only export information to a csv table


  # LIBRARIES
  require("tidyverse")
  require("tictoc")


  # checks if tic.log only have one time information
  if (length(tictoc::tic.log(format = TRUE)) != 1) {

    stop("tictoc::tic.log has more than 1 time info, remember to tictoc::tic.clearlog() before running the script again")

  }


  # checks if file exists or not
  if (!file.exists(paste0("code/", fctn.codeDir, "/_timeProcessing_", stringr::str_replace(fctn.codeDir, "/", "_"), ".csv"))) {

    # extract time in seconds
    time.in.seconds <-
      tictoc::tic.log(format = T) %>%
      as.character() %>%
      str_extract(pattern = "\\d{1,7}\\.\\d{1,3}") %>%
      as.numeric()

    if (time.in.seconds > 86400) {

      # transform time from seconds to days
      time.in.days <- (time.in.seconds/86400) %>% round(digits = 0) %>%  as.character() %>% paste0(" days")

      # creates csv file with the first entry
      tictoc::tic.log(format = T) %>%
      as.character() %>%
      str_replace(pattern = "\\d{1,7}\\.\\d{1,3} sec", time.in.days) %>%
      tibble::tibble(.name_repair = ~ "time") %>%
      readr::write_csv(col_names = F,
                       path = paste0("code/", fctn.codeDir, "/_timeProcessing_", stringr::str_replace(fctn.codeDir, "/", "_"), ".csv"))


    } else if (time.in.seconds > 3600) {

      # transform time from seconds to hours
      time.in.hours <- (time.in.seconds/3600) %>% round(digits = 0) %>% as.character() %>% paste0(" hours")

      # creates csv file with the first entry
      tictoc::tic.log(format = T) %>%
        as.character() %>%
        str_replace(pattern = "\\d{1,7}\\.\\d{1,3} sec", time.in.hours) %>%
        tibble::tibble(.name_repair = ~ "time") %>%
        readr::write_csv(col_names = F,
                         path = paste0("code/", fctn.codeDir, "/_timeProcessing_", stringr::str_replace(fctn.codeDir, "/", "_"), ".csv"))

    } else if (time.in.seconds > 60) {


      # transform time from seconds to minutes
      time.in.minutes <- (time.in.seconds/60) %>% round(digits = 0) %>% as.character() %>% paste0(" minutes")

      # creates csv file with the first entry
      tictoc::tic.log(format = T) %>%
        as.character() %>%
        str_replace(pattern = "\\d{1,7}\\.\\d{1,3} sec", time.in.minutes) %>%
        tibble::tibble(.name_repair = ~ "time") %>%
        readr::write_csv(col_names = F,
                         path = paste0("code/", fctn.codeDir, "/_timeProcessing_", stringr::str_replace(fctn.codeDir, "/", "_"), ".csv"))

    } else {

      time.in.seconds <- time.in.seconds %>% round(digits = 0) %>% as.character() %>% paste0(" seconds")

      # creates csv file with the first entry
      tictoc::tic.log(format = T) %>%
        as.character() %>%
        str_replace(pattern = "\\d{1,7}\\.\\d{1,3} sec", time.in.seconds) %>%
        tibble::tibble(.name_repair = ~ "time") %>%
        readr::write_csv(col_names = F,
                         path = paste0("code/", fctn.codeDir, "/_timeProcessing_", stringr::str_replace(fctn.codeDir, "/", "_"), ".csv"))
    }

    # clear tic toc log
    tictoc::tic.clearlog()

  } else {

    # read existing table of times
    time.table <- readr::read_csv(paste0("code/", fctn.codeDir, "/_timeProcessing_", stringr::str_replace(fctn.codeDir, "/", "_"), ".csv"),
                                  col_names = "time")

    # extract script name
    code.name <- strsplit(as.character(tictoc::tic.log(format = T)), split = ":")[[1]][1]

    # checks if time for the input script was already registered or not
    if(any(stringr::str_detect(time.table$time, code.name))) {

      # prints message
      print(paste0(code.name, " already registered! If you want to re-register first manually exclude the entry in the csv file"))

    } else {

      time.in.seconds <-
        tictoc::tic.log(format = T) %>%
        as.character() %>%
        str_extract(pattern = "\\d{1,7}\\.\\d{1,3}") %>%
        as.numeric()

      if (time.in.seconds > 86400) {

        # transform time from seconds to days
        time.in.days <- (time.in.seconds/86400) %>% round(digits = 0) %>% as.character() %>% paste0(" days")

        # appends new time (in days) to existing table
        time.table <- dplyr::bind_rows(time.table, tictoc::tic.log(format = T) %>%
                                                   as.character() %>%
                                                   str_replace(pattern = "\\d{1,6}.\\d{1,2} sec", time.in.days) %>%
                                                   tibble::tibble(.name_repair = ~ "time"))


      } else if (time.in.seconds > 3600) {


        # transform time from seconds to hours
        time.in.hours <- (time.in.seconds/3600) %>% round(digits = 0) %>% as.character() %>% paste0(" hours")

        # appends new time (in hours) to existing table
        time.table <- dplyr::bind_rows(time.table, tictoc::tic.log(format = T) %>%
                                         as.character() %>%
                                         str_replace(pattern = "\\d{1,7}\\.\\d{1,3} sec", time.in.hours) %>%
                                         tibble::tibble(.name_repair = ~ "time"))

      } else if (time.in.seconds > 60) {


        # transform time from seconds to minutes
        time.in.minutes <- (time.in.seconds/60) %>% round(digits = 0) %>% as.character() %>% paste0(" minutes")

        # appends new time (in minutes) to existing table
        time.table <- dplyr::bind_rows(time.table, tictoc::tic.log(format = T) %>%
                                         as.character() %>%
                                         str_replace(pattern = "\\d{1,7}\\.\\d{1,3} sec", time.in.minutes) %>%
                                         tibble::tibble(.name_repair = ~ "time"))

      } else {

        time.in.seconds <- time.in.seconds %>% round(digits = 0) %>% as.character() %>% paste0(" seconds")

        # appends new time (in seconds) to existing table
        time.table <- dplyr::bind_rows(time.table, tictoc::tic.log(format = T) %>%
                                         as.character() %>%
                                         str_replace(pattern = "\\d{1,7}\\.\\d{1,3} sec", time.in.seconds) %>%
                                         tibble::tibble(.name_repair = ~ "time"))


     }



      # save table
      readr::write_csv(time.table,
                       col_names = F,
                       path = paste0("code/", fctn.codeDir, "/_timeProcessing_", stringr::str_replace(fctn.codeDir, "/", "_"), ".csv"))



    }


    # clear tic toc log
    tictoc::tic.clearlog()

  }
}





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------