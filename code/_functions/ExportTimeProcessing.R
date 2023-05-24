
# > PROJECT INFO
# NAME: PROJECT NAME - TEMPLATE
# LEAD: LEADING AUTHOR(S) NAME(S)
#
# > THIS SCRIPT
# AIM: EXPORT TIME OF PROCESSING FUNCTION
# AUTHOR: JOÃO PEDRO VIEIRA
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
  require("here")

  # checks if tic.log only have one time information
  if (length(tictoc::tic.log(format = TRUE)) != 1) {

    stop("tictoc::tic.log has more than 1 time info, remember to tictoc::tic.clearlog() before running the script again")

  }


  # checks if file exists or not
  if (!file.exists(paste0(fctn.codeDir, "/_timeProcessing_", stringr::str_replace_all(fctn.codeDir, "/", "_"), ".csv"))) {

    # extract time in seconds
    time.in.seconds <-
      tictoc::tic.log(format = TRUE) %>%
      as.character() %>%
      stringr::str_extract(pattern = "(\\d+(?:\\.\\d+)?)(?=\\s+sec\\s+elapsed)") %>%
      as.numeric()

    if (time.in.seconds > 86400) {

      # transform time from seconds to days
      time.in.days <- (time.in.seconds/86400) %>% round(digits = 0) %>% as.character() %>% paste0(" days")

      # creates csv file with the first entry
      tibble::tibble(time = paste0((tictoc::tic.log(format = FALSE))[[1]]$msg, ": ", time.in.days)) %>%
        readr::write_csv(col_names = F,
                         file = here::here(paste0(fctn.codeDir, "/_timeProcessing_", stringr::str_replace_all(fctn.codeDir, "/", "_"), ".csv")))


    } else if (time.in.seconds > 3600) {

      # transform time from seconds to hours
      time.in.hours <- (time.in.seconds/3600) %>% round(digits = 0) %>% as.character() %>% paste0(" hours")

      # creates csv file with the first entry
      tibble::tibble(time = paste0((tictoc::tic.log(format = FALSE))[[1]]$msg, ": ", time.in.hours)) %>%
        readr::write_csv(col_names = F,
                         file = here::here(paste0(fctn.codeDir, "/_timeProcessing_", stringr::str_replace_all(fctn.codeDir, "/", "_"), ".csv")))

    } else if (time.in.seconds > 60) {


      # transform time from seconds to minutes
      time.in.minutes <- (time.in.seconds/60) %>% round(digits = 0) %>% as.character() %>% paste0(" minutes")

      # creates csv file with the first entry
      tibble::tibble(time = paste0((tictoc::tic.log(format = FALSE))[[1]]$msg, ": ", time.in.minutes)) %>%
        readr::write_csv(col_names = F,
                         file = here::here(paste0(fctn.codeDir, "/_timeProcessing_", stringr::str_replace_all(fctn.codeDir, "/", "_"), ".csv")))

    } else {

      time.in.seconds <- time.in.seconds %>% round(digits = 0) %>% as.character() %>% paste0(" seconds")

      # creates csv file with the first entry
      tibble::tibble(time = paste0((tictoc::tic.log(format = FALSE))[[1]]$msg, ": ", time.in.seconds)) %>%
        readr::write_csv(col_names = F,
                         file = here::here(paste0(fctn.codeDir, "/_timeProcessing_", stringr::str_replace_all(fctn.codeDir, "/", "_"), ".csv")))
    }

    # clear tic toc log
    tictoc::tic.clearlog()

  } else {

    # read existing table of times
    time.table <- readr::read_csv(paste0(fctn.codeDir, "/_timeProcessing_", stringr::str_replace_all(fctn.codeDir, "/", "_"), ".csv"),
                                  col_names = "time")

    # checks if time for the input script was already registered or not
    if(any(stringr::str_detect(time.table$time, (tictoc::tic.log(format = FALSE))[[1]]$msg))) {

      # prints message
      print(paste0((tictoc::tic.log(format = FALSE))[[1]]$msg, " already registered! If you want to re-register first manually exclude the entry in the csv file"))

    } else {

      # extract time in seconds
      time.in.seconds <-
        tictoc::tic.log(format = TRUE) %>%
        as.character() %>%
        stringr::str_extract(pattern = "(\\d+(?:\\.\\d+)?)(?=\\s+sec\\s+elapsed)") %>%
        as.numeric()

      if (time.in.seconds > 86400) {

        # transform time from seconds to days
        time.in.days <- (time.in.seconds/86400) %>% round(digits = 0) %>% as.character() %>% paste0(" days")

        # appends new time (in days) to existing table
        time.table <- dplyr::bind_rows(time.table,
                                       tibble::tibble(time = paste0((tictoc::tic.log(format = FALSE))[[1]]$msg, ": ", time.in.days)))

      } else if (time.in.seconds > 3600) {


        # transform time from seconds to hours
        time.in.hours <- (time.in.seconds/3600) %>% round(digits = 0) %>% as.character() %>% paste0(" hours")

        # appends new time (in hours) to existing table
        time.table <- dplyr::bind_rows(time.table,
                                       tibble::tibble(time = paste0((tictoc::tic.log(format = FALSE))[[1]]$msg, ": ", time.in.hours)))


      } else if (time.in.seconds > 60) {


        # transform time from seconds to minutes
        time.in.minutes <- (time.in.seconds/60) %>% round(digits = 0) %>% as.character() %>% paste0(" minutes")

        # appends new time (in minutes) to existing table
        time.table <- dplyr::bind_rows(time.table,
                                       tibble::tibble(time = paste0((tictoc::tic.log(format = FALSE))[[1]]$msg, ": ", time.in.minutes)))


      } else {

        time.in.seconds <- time.in.seconds %>% round(digits = 0) %>% as.character() %>% paste0(" seconds")

        # appends new time (in seconds) to existing table
        time.table <- dplyr::bind_rows(time.table,
                                       tibble::tibble(time = paste0((tictoc::tic.log(format = FALSE))[[1]]$msg, ": ", time.in.seconds)))



      }



      # save table
      readr::write_csv(time.table,
                       col_names = F,
                       file = here::here(paste0(fctn.codeDir, "/_timeProcessing_", stringr::str_replace_all(fctn.codeDir, "/", "_"), ".csv")))



    }


    # clear tic toc log
    tictoc::tic.clearlog()

  }
}





# END OF SCRIPT --------------------------------------------------------------------------------------------------------------------------------------