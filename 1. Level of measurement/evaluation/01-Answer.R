# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      function(env) {
        # Get all objects in the environment
        all_expressions <- ls(envir = env)
        
        # Check if the student code contains a call to str(df_crime_data)
        student_code <- deparse(body(sys.function()))
        code_analysis <- any(grepl("str\\(df_crime_data\\)", student_code))
        
        # Create a custom check result
        if (code_analysis) {
          return(TRUE)
        } else {
          return(FALSE) 
        }
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
        
        # Show the output of str(df_crime_data)
        get_reporter()$add_message("Output van str(df_crime_data):", type = "info")
        str_output <- capture.output(str(df_crime_data))
        get_reporter()$add_message(paste(str_output, collapse = "\n"), type = "code")
        
        # Show other useful functions
        get_reporter()$add_message("Je kunt ook deze functies gebruiken:", type = "info")
        
        get_reporter()$add_message("names(df_crime_data):", type = "info")
        names_output <- capture.output(print(names(df_crime_data)))
        get_reporter()$add_message(paste(names_output, collapse = "\n"), type = "code")
        
        get_reporter()$add_message("head(df_crime_data):", type = "info")
        head_output <- capture.output(print(head(df_crime_data, 3)))
        get_reporter()$add_message(paste(head_output, collapse = "\n"), type = "code")
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Create crime data in the preExec block as in the example
  df_crime_data <- data.frame(
    zaak_id = c("Z001", "Z002", "Z003", "Z004", "Z005"),
    datum = as.Date(c("2023-01-15", "2023-01-20", "2023-02-05", "2023-02-10", "2023-03-01")),
    district = c("Noord", "Centrum", "Zuid", "Oost", "West"),
    delict = c("Diefstal", "Inbraak", "Vandalisme", "Fraude", "Aanranding"),
    aantal_agenten = c(2, 3, 1, 2, 4),
    reactietijd_min = c(15.2, 8.7, 12.3, 20.5, 10.8)
  )
})
