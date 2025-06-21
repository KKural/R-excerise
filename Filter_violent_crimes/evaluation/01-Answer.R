context({
  testcase("Filter violent crimes using subset()", {
    testEqual(
      "Dimensions of violent_crimes_df",
      function(env) { 
        if (!exists("violent_crimes_df", envir = env)) {
          return(NULL)
        }
        return(dim(env$violent_crimes_df))
      },
      c(8, 4),  # 8 rows (violent crimes) and 4 columns
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'violent_crimes_df' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!is.data.frame(get_student_env()$violent_crimes_df)) {
          get_reporter()$add_message("❌ The variable 'violent_crimes_df' should be a data frame, not a " + class(get_student_env()$violent_crimes_df) + ".", type = "error")
          return(FALSE)
        }
        
        if (!identical(got, want)) {
          get_reporter()$add_message(paste0("❌ Expected dimensions of 'violent_crimes_df' to be ", paste(want, collapse = "×"), ", but got ", paste(got, collapse = "×"), ". Did you filter for all violent crime types?"), type = "error")
          return(FALSE)
        }
        
        return(TRUE)
      }
    )
  })
  
  testcase("Check if correct rows were filtered", {
    testEqual(
      "Offenses in violent_crimes_df",
      function(env) { 
        if (!exists("violent_crimes_df", envir = env)) {
          return(NULL)
        }
        return(as.character(env$violent_crimes_df$offense))
      },
      c("Assault", "Robbery", "Assault", "Homicide", "Assault", "Robbery", "Homicide", "Assault"),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          # Already handled in previous test
          return(FALSE)
        }
        
        # Check if all rows are violent crimes
        violent_crime_types <- c("Assault", "Robbery", "Homicide")
        if (!all(got %in% violent_crime_types)) {
          non_violent <- got[!got %in% violent_crime_types]
          get_reporter()$add_message(paste0("❌ Your filtered dataset contains non-violent crimes: ", paste(unique(non_violent), collapse = ", "), "."), type = "error")
          return(FALSE)
        }
        
        # Check if all violent crimes from the original dataset are included
        if (length(got) != 8) {
          get_reporter()$add_message("❌ Your filtered dataset doesn't contain all the violent crimes from the original dataset.", type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've successfully filtered the dataset to include only violent crimes.", type = "success")
        return(TRUE)
      }
    )
  })
  
  testcase("Check if subset() function was used", {
    testEqual(
      "Code used for filtering",
      function(env) { 
        # Placeholder
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        # Get the submitted code
        code <- toString(get_student_code())
        
        # Check if the code contains subset()
        if (!grepl("subset\\(", code)) {
          get_reporter()$add_message("❌ Make sure you're using the subset() function to filter the data.", type = "error")
          return(FALSE)
        }
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Set up the crime_data data frame
  crime_data <- data.frame(
    id = 1:20,
    offense = c("Theft", "Assault", "Drug Offense", "Robbery", "Vandalism", 
                "Assault", "Burglary", "Homicide", "Theft", "Assault",
                "Fraud", "Robbery", "Theft", "Drug Offense", "Homicide",
                "Assault", "Vandalism", "Fraud", "Burglary", "Theft"),
    district = c("North", "South", "East", "Central", "West",
                 "South", "North", "Central", "East", "West",
                 "North", "South", "West", "East", "South",
                 "Central", "North", "East", "West", "South"),
    date = as.Date("2023-01-01") + 0:19
  )
})

# Model solution:
violent_crimes_df <- subset(crime_data, offense %in% c("Assault", "Robbery", "Homicide"))