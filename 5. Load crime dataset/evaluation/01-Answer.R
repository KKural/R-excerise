context({
  testcase("Load dataset using read.csv()", {
    testEqual(
      "Check if crime_df exists and has correct dimensions",
      function(env) { 
        if (!exists("crime_df", envir = env)) {
          return(NULL)
        }
        return(dim(env$crime_df))
      },
      c(200, 7),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'crime_df' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!is.data.frame(get_student_env()$crime_df)) {
          get_reporter()$add_message("❌ The variable 'crime_df' is not a data frame. Did you use read.csv()?", type = "error")
          return(FALSE)
        }
        
        if (!identical(got, want)) {
          get_reporter()$add_message(paste0("❌ Expected the dimensions of 'crime_df' to be ", paste(want, collapse = "×"), ", but got ", paste(got, collapse = "×"), "."), type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've successfully loaded the crime dataset into 'crime_df'.", type = "success")
        return(TRUE)
      }
    )
  })
  
  testcase("Check if correct column names exist in the dataset", {
    testEqual(
      "Check column names of crime_df",
      function(env) {
        if (!exists("crime_df", envir = env)) {
          return(NULL)
        }
        return(names(env$crime_df))
      },
      c("incident_id", "date", "district", "crime_type", "value_loss", "officers_sent", "response_time"),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          # Already handled in the previous test
          return(FALSE)
        }
        
        if (!all(want %in% got)) {
          missing_cols <- want[!want %in% got]
          get_reporter()$add_message(paste0("❌ Some expected columns are missing: ", paste(missing_cols, collapse = ", "), "."), type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Great! Your dataset contains all the expected columns.", type = "success")
        return(TRUE)
      }
    )
  })
  
  testcase("Check if read.csv() was used in the code", {
    testEqual(
      "Code used for loading data",
      function(env) { 
        # Placeholder
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        # Get the submitted code
        code <- toString(get_student_code())
        
        # Check if the code contains read.csv()
        if (!grepl("read\\.csv\\(", code)) {
          get_reporter()$add_message("❌ Make sure you're using the read.csv() function to load the data.", type = "error")
          return(FALSE)
        }
        
        # Check if file_path is used
        if (!grepl("read\\.csv\\(\\s*file_path", code) && !grepl("read\\.csv\\(['\"]crime_data.csv['\"]", code)) {
          get_reporter()$add_message("⚠️ It's recommended to use the provided 'file_path' variable in your read.csv() function.", type = "warning")
          # Just a warning, not a failure
        }
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Create a simulated crime data file
  library(tibble)
  library(dplyr)
  
  set.seed(42)
  crime_df <- tibble(
    incident_id    = sprintf("INC%03d", 1:200),
    date           = sample(seq.Date(as.Date("2023-01-01"), as.Date("2023-12-31"), by = "day"), 200, replace = TRUE),
    district       = sample(c("A", "B", "C", "D"), 200, replace = TRUE, prob = c(0.4, 0.3, 0.2, 0.1)),
    crime_type     = sample(c("Burglary", "Assault", "Theft", "Vandalism"), 200, replace = TRUE),
    value_loss     = round(rlnorm(200, meanlog = 3, sdlog = 1)),
    officers_sent  = sample(1:5, 200, replace = TRUE),
    response_time  = round(rnorm(200, mean = 12, sd = 4), 1)
  ) %>% mutate(response_time = pmax(response_time, 0))
  
  # Save the data to a temporary file that will act as our "crime_data.csv"
  temp_dir <- tempdir()
  file_path <- file.path(temp_dir, "crime_data.csv")
  write.csv(crime_df, file = file_path, row.names = FALSE)
  
  # Make the file path available to the student
  file_path <- "crime_data.csv"
})

# Model solution:
crime_df <- read.csv(file_path)