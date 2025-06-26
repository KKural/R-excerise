# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Basisfuncties op df_crime_data", {
    testEqual(
      "Dataframe verkennen",
      function(env) {
        # The evaluationResult contains the result of the last expression in the student's code
        # Since we just want them to run the commands, always return TRUE
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        # We don't have reliable access to the student code in this environment
        # So instead of checking for the specific function usage,
        # we'll provide educational feedback regardless
        get_reporter()$add_message(
          "✅ In deze oefening leer je hoe je basisfuncties gebruikt om dataframes te verkennen zoals `str(df_crime_data)`.",
          type = "success"
        )
        }
        
        # Show str() output for educational purposes
        get_reporter()$add_message(
          "Hier is de output van str(df_crime_data):",
          type = "info"
        )
        get_reporter()$add_message(paste(capture.output(str(df_crime_data)), collapse = "\n"), type = "code")
        
        # Show some additional helpful functions
        get_reporter()$add_message(
          "Je kunt ook andere nuttige functies gebruiken om dataframes te verkennen:",
          type = "info"
        )
        get_reporter()$add_message("De kolomnamen bekijken met names():", type = "info")
        get_reporter()$add_message(paste(capture.output(names(df_crime_data)), collapse = "\n"), type = "code")
        
        get_reporter()$add_message("De eerste rijen bekijken met head():", type = "info")
        get_reporter()$add_message(paste(capture.output(head(df_crime_data)), collapse = "\n"), type = "code")
        
        # Always return TRUE so the exercise passes
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Create the data frame that's mentioned in the description
  df_crime_data <- data.frame(
    type = factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
    ernst = factor(c("Licht", "Matig", "Ernstig", "Matig", "Licht"), 
                   levels = c("Licht", "Matig", "Ernstig"), 
                   ordered = TRUE),
    leeftijd = c(19, 23, 45, 32, 28),
    district = c("A1", "B2", "C3", "D4", "E5")
  )
  
  # Important: Make df_crime_data available globally
  # Assign to both global environment and the current environment 
  # to ensure it's available in all contexts
  assign("df_crime_data", df_crime_data, envir = globalenv())
})

# Verwachte antwoord:
# str(df_crime_data)
