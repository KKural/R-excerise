context({
  testcase("Create logical vector comparing crime rates to national average", {
    testEqual(
      "Values in above_average vector",
      function(env) { 
        if (!exists("above_average", envir = env)) {
          return(NULL)
        }
        return(env$above_average)
      },
      c(5.58, 6.42, 7.05, 7.18, 6.39) > 6.2,
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'above_average' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!is.logical(got) || length(got) != 5) {
          get_reporter()$add_message(paste0("❌ The variable 'above_average' should be a logical vector of length 5, not a ", class(got), " of length ", length(got), "."), type = "error")
          return(FALSE)
        }
        
        if (!identical(got, want)) {
          get_reporter()$add_message("❌ Your logical vector doesn't correctly identify which districts have crime rates above the national average.", type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've successfully identified which districts have crime rates above the national average.", type = "success")
        return(TRUE)
      }
    )
  })
  
  testcase("Check comparison method", {
    testEqual(
      "Code correctness",
      function(env) { 
        # Placeholder
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        # Get the submitted code
        code <- toString(get_student_code())
        
        # Check if the code correctly uses comparison
        if (!grepl("district_crime_rates\\s*>\\s*national_average", code) && 
            !grepl("national_average\\s*<\\s*district_crime_rates", code)) {
          get_reporter()$add_message("⚠️ Make sure you're comparing district_crime_rates with national_average using a comparison operator like >", type = "warning")
          # Just a warning, not a failure
        }
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Set up the data
  district_crime_rates <- c(5.58, 6.42, 7.05, 7.18, 6.39)
  national_average <- 6.2
})

# Model solution:
above_average <- district_crime_rates > national_average