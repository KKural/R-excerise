# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Gebruik van str functie", {
    testEqual(
      "Controleer gebruik van str() functie",
      function(env) {
        # First check if submission is empty
        if (length(env$`.__code__`) == 0) {
          get_reporter()$add_message(
            "❌ Je hebt geen code ingediend. Je moet str() gebruiken op df_crime_data om de structuur te bekijken.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Check if the code contains str(df_crime_data)
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("str.*df_crime_data", code_str)) {
          get_reporter()$add_message(
            "❌ Je code bevat geen aanroep van str() op df_crime_data. Gebruik str(df_crime_data) om de structuur te bekijken.",
            type = "error"
          )
          return(FALSE)
        }
        
        # If we get here, the student used str(df_crime_data)
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # This message is already handled in the function above
          return(FALSE)
        }
        
        # Success message
        get_reporter()$add_message(
          "✅ Correct! Je hebt str() gebruikt om de structuur van df_crime_data te bekijken.",
          type = "success"
        )
        
        # Show the output of str(df_crime_data)
        get_reporter()$add_message(
          "Output van str(df_crime_data):",
          type = "info"
        )
        str_output <- capture.output(str(df_crime_data))
        get_reporter()$add_message(
          paste(str_output, collapse = "\n"), 
          type = "code"
        )
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Create the crime data in preExec
  df_crime_data <- data.frame(
    zaak_id = c("Z001", "Z002", "Z003", "Z004", "Z005"),
    datum = as.Date(c("2023-01-15", "2023-01-20", "2023-02-05", "2023-02-10", "2023-03-01")),
    district = c("Noord", "Centrum", "Zuid", "Oost", "West"),
    delict = c("Diefstal", "Inbraak", "Vandalisme", "Fraude", "Aanranding"),
    aantal_agenten = c(2, 3, 1, 2, 4),
    reactietijd_min = c(15.2, 8.7, 12.3, 20.5, 10.8)
  )
})

# Verwachte antwoorden:
# str(df_crime_data)
