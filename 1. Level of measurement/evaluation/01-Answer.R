# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Basisfuncties op df_crime_data", {
    testEqual(
      "Gebruik van str(df_crime_data)",
      function(env) {
        # Check if code contains str(df_crime_data)
        if (length(env$`.__code__`) == 0) {
          get_reporter()$add_message(
            "❌ Je hebt geen code ingediend. Je moet str(df_crime_data) gebruiken.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Get code as string
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        
        # Check if str(df_crime_data) is used
        if (!grepl("str\\(df_crime_data\\)", code_str)) {
          get_reporter()$add_message(
            "❌ Je hebt str(df_crime_data) niet gebruikt. Deze functie toont de structuur van het data frame.",
            type = "error"
          )
          return(FALSE)
        }
        
        # If str(df_crime_data) is used, return TRUE
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # Already gave error message in the test function
          return(FALSE)
        }
        
        # Show success message
        get_reporter()$add_message(
          "✅ Goed gedaan! Je hebt str(df_crime_data) gebruikt om de structuur van het data frame te bekijken.",
          type = "success"
        )
        
        # Show the output of str(df_crime_data) for educational purposes
        get_reporter()$add_message(
          "Hier zie je de output van str(df_crime_data):",
          type = "info"
        )
        
        str_output <- capture.output(str(df_crime_data))
        get_reporter()$add_message(paste(str_output, collapse = "\n"), type = "code")
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Create a data frame matching the description in description.nl.md
  df_crime_data <- data.frame(
    type = factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
    ernst = factor(c("Licht", "Matig", "Ernstig", "Matig", "Licht"), 
                  levels = c("Licht", "Matig", "Ernstig"), 
                  ordered = TRUE),
    leeftijd = c(19, 23, 45, 32, 28),
    district = c("A1", "B2", "C3", "D4", "E5"),
    stringsAsFactors = FALSE
  )
})

# Verwachte antwoord:
# str(df_crime_data)
