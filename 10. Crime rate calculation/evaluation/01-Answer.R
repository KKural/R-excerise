context({
  testcase("Calculate crime rates correctly", {
    testEqual(
      "Check crime_rates values",
      function(env) { 
        if (!exists("crime_rates", envir = env)) {
          return(NULL)
        }
        return(env$crime_rates)
      },
      (c(143, 265, 97, 418, 204) / c(25640, 41250, 13760, 58200, 31890)) * 1000,
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'crime_rates' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!is.numeric(got) || length(got) != 5) {
          get_reporter()$add_message(paste0("❌ The variable 'crime_rates' should be a numeric vector of length 5, not a ", class(got), " of length ", length(got), "."), type = "error")
          return(FALSE)
        }
        
        # Check if values are approximately equal (floating point comparison)
        if (!all(abs(got - want) < 1e-10)) {
          get_reporter()$add_message("❌ Your crime rates calculation is incorrect. Check the formula: (crime_count / population) * 1000", type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've successfully calculated the crime rates per 1,000 population.", type = "success")
        return(TRUE)
      }
    )
  })
  
  testcase("Check calculation method", {
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
        
        # Check if the code correctly uses element-wise operations
        if (!grepl("crime_counts\\s*/\\s*population", code) && !grepl("\\(.*crime_counts.*\\)\\s*/\\s*\\(.*population.*\\)", code)) {
          get_reporter()$add_message("⚠️ Make sure you're using element-wise division with the crime_counts and population vectors.", type = "warning")
          # Just a warning, not a failure
        }
        
        if (!grepl("\\*\\s*1000", code)) {
          get_reporter()$add_message("⚠️ Don't forget to multiply by 1000 to get rates per 1,000 population.", type = "warning")
          # Just a warning, not a failure
        }
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Set up the data
  crime_counts <- c(143, 265, 97, 418, 204)
  population <- c(25640, 41250, 13760, 58200, 31890)
})

# Model solution:
crime_rates <- (crime_counts / population) * 1000