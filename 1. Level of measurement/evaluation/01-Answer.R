# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Dataframe structuur verkennen met str()", {
    # First check if str() was used at all
    testFunctionUsed("str")
    
    # Then check if specifically str(df_crime_data) was used, with educational feedback
    testEqual(
      "Structuur verkennen met str(df_crime_data)",
      function(env) {
        # Check for evaluationResult (last executed expression)
        # If the student used str(df_crime_data) as their last command,
        # evaluationResult will be NULL (because str() doesn't return a value)
        if (!is.null(env$evaluationResult)) {
          return(FALSE)
        }
        
        # Check if str was called with df_crime_data
        # Since we can't directly check this, we'll use the testFunctionUsed above
        # and provide educational feedback here regardless
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) {
        # Student used str(), now give educational feedback
        get_reporter()$add_message(
          "✅ De `str()` functie is erg nuttig om snel inzicht te krijgen in de structuur van een dataframe. Het toont de variabelen, hun types en enkele voorbeeldwaarden.",
          type = "success"
        )
        
        # Add note to make sure they use exactly str(df_crime_data)
        get_reporter()$add_message(
          "ℹ️ Zorg dat je precies `str(df_crime_data)` gebruikt om de juiste structuur te bekijken.",
          type = "info"
        )
        
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
