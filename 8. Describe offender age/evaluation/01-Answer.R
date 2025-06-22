context({
  testcase("Generate summary statistics using summary()", {
    testEqual(
      "Content of age_summary variable",
      function(env) { 
        if (!exists("age_summary", envir = env)) {
          return(NULL)
        }
        # Convert to character to compare summary output
        return(as.character(env$age_summary))
      },
      as.character(summary(c(19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
                   27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34))),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'age_summary' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        # Check if the object is a summary object
        if (!identical(class(get_student_env()$age_summary), class(summary(c(1,2,3))))) {
          get_reporter()$add_message("❌ The variable 'age_summary' should be a summary object. Did you use the summary() function?", type = "error")
          return(FALSE)
        }
        
        if (!identical(got, want)) {
          get_reporter()$add_message("❌ Your summary statistics don't match the expected values.", type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've successfully generated summary statistics for the offender ages.", type = "success")
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Set up the offender_ages vector
  offender_ages <- c(19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
                   27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34)
})

# Model solution:
age_summary <- summary(offender_ages)