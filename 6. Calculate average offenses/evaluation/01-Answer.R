context({
  testcase("Calculate average offenses using mean()", {
    testEqual(
      "Value of avg_offenses variable",
      function(env) { 
        if (!exists("avg_offenses", envir = env)) {
          return(NULL)
        }
        return(env$avg_offenses)
      },
      56,
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'avg_offenses' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!is.numeric(got)) {
          get_reporter()$add_message("❌ The variable 'avg_offenses' should be a numeric value, not a " + class(got) + ".", type = "error")
          return(FALSE)
        }
        
        # Check if the value is approximately correct (allows for floating-point differences)
        if (abs(got - want) > 1e-10) {
          get_reporter()$add_message(paste0("❌ Expected 'avg_offenses' to be ", want, ", but got ", got, "."), type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've successfully calculated the average number of offenses.", type = "success")
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Set up the monthly_offenses vector
  monthly_offenses <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
})

# Model solution:
avg_offenses <- mean(monthly_offenses)