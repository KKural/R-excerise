# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Dataframe structuur verkennen met str()", {
    testEqual(
      "Structuur verkennen",
      function(env) {
        # We're just checking if the student ran the command, so always return TRUE
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        # Provide educational feedback with detailed explanation
        get_reporter()$add_message(
          "✅ De `str()` functie is erg nuttig om snel inzicht te krijgen in de structuur van een dataframe. Het toont de variabelen, hun types en enkele voorbeeldwaarden.",
          type = "success"
        )
        
        # Capture and show the str() output for the data frame
        get_reporter()$add_message(
          "## Structuur van df_crime_data:",
          type = "markdown"
        )
        
        # Convert str() output to a string and display it as code
        str_output <- capture.output(str(df_crime_data))
        get_reporter()$add_message(paste(str_output, collapse = "\n"), type = "code")
        
        # Add educational explanation about the measurement levels
        get_reporter()$add_message(
          "## Meetniveaus in de dataset:",
          type = "markdown"
        )
        
        # Use paste for string concatenation, not the + operator
        get_reporter()$add_message(paste(
          "- **Nominale variabelen**: `type`, `district` (categorieën zonder rangorde)",
          "- **Ordinale variabelen**: `ernst` (categorieën met rangorde: Licht < Matig < Ernstig)", 
          "- **Interval/Ratio variabelen**: `leeftijd` (numerieke waarden)",
          sep = "\n"
        ), type = "markdown")
        
        get_reporter()$add_message(
          "## Tips voor het herkennen van meetniveaus:",
          type = "markdown"
        )
        
        get_reporter()$add_message(paste(
          "- Nominale variabelen zijn vaak opgeslagen als `Factor` zonder ordered=TRUE",
          "- Ordinale variabelen zijn vaak opgeslagen als `Ord.factor`",
          "- Interval/Ratio variabelen zijn vaak opgeslagen als `num` of `int`",
          sep = "\n"
        ), type = "markdown")
        
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

# Model solution:
# # Bekijk de structuur van het dataframe
# str(df_crime_data)
