# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      function(env) {
        # We'll check for str directly in a more reliable way
        has_used_str <- FALSE
        
        # Try to look at the code directly
        if (exists(".__code__", envir = env)) {
          code_str <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
          if (grepl("str\\s*\\(\\s*df_crime_data\\s*\\)", code_str)) {
            has_used_str <- TRUE
          }
        } else {
          # Check if the student used str on df_crime_data in any way
          all_calls <- ls(envir = env)
          if (any(grepl("^str$", all_calls))) {
            has_used_str <- TRUE
          }
        }
        
        # Return the result
        return(has_used_str)
      },
      TRUE,
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
        
        # Show output info
        str_output <- capture.output(str(df_crime_data))
        get_reporter()$add_message(paste(str_output, collapse = "\n"), type = "info")
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Define the dataframe in preExec
  df_crime_data <- data.frame(
    zaak_id = c("Z001", "Z002", "Z003", "Z004", "Z005"),
    datum = as.Date(c("2023-01-15", "2023-01-20", "2023-02-05", "2023-02-10", "2023-03-01")),
    district = c("Noord", "Centrum", "Zuid", "Oost", "West"),
    delict = c("Diefstal", "Inbraak", "Vandalisme", "Fraude", "Aanranding"),
    aantal_agenten = c(2, 3, 1, 2, 4),
    reactietijd_min = c(15.2, 8.7, 12.3, 20.5, 10.8)
  )
})
