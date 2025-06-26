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
        # Check if student code uses str() function on df_crime_data
        student_code <- get(".solution", envir = globalenv())
        used_str <- grepl("str\\(df_crime_data\\)", student_code, perl = TRUE)
        
        if (used_str) {
          get_reporter()$add_message(
            "✅ Goed gedaan! Je hebt de `str()` functie correct gebruikt om de structuur van `df_crime_data` te bekijken.",
            type = "success"
          )
        } else {
          get_reporter()$add_message(
            "⚠️ Het lijkt erop dat je niet de `str(df_crime_data)` functie hebt gebruikt. Dit is de meest directe manier om de structuur van een dataframe te bekijken.",
            type = "warning"
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
  assign("df_crime_data", df_crime_data, envir = globalenv())
  
  # Store the student's code in the global environment so we can check it
  assign(".solution", readLines("student.R", warn = FALSE), envir = globalenv())
})

# Verwachte antwoord:
# str(df_crime_data)
