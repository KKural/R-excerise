# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      function(env) {
        # Instead of checking for a variable, we'll check if str was called
        # Create a custom result based on code examination
        code_used_str <- FALSE
        
        # Try to access the code
        tryCatch({
          # Check if there's any mention of str() and df_crime_data together in submitted code
          student_code <- toString(parse(text = readLines("student.R")))
          if (grepl("str.*df_crime_data", student_code)) {
            code_used_str <- TRUE
          }
        }, error = function(e) {
          # If error occurs, assume code wasn't found
          code_used_str <- FALSE
        })
        
        return(code_used_str)  # Return TRUE/FALSE for our check
      },
      TRUE,  # We expect TRUE (student used str)
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ Je moet de str() functie gebruiken om de structuur van df_crime_data te bekijken.",
            type = "error"
          )
          return(FALSE)
        }
        
        get_reporter()$add_message(
          "✅ Correct! Je hebt str() gebruikt om de structuur van df_crime_data te bekijken.",
          type = "success"
        )
        
        # Show the output of str(df_crime_data) for reference
        str_output <- capture.output(str(df_crime_data))
        get_reporter()$add_message(
          paste("Output van str(df_crime_data):", paste(str_output, collapse = "\n"), sep = "\n"),
          type = "info"
        )
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Create a simple data frame that students will use
  df_crime_data <- data.frame(
    type = c("Theft", "Assault", "Burglary", "Fraud", "Vandalism"),
    count = c(12, 5, 8, 3, 7),
    stringsAsFactors = TRUE
  )
})
