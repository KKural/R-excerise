# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Dataframe structuur verkennen met str()", {
    # First check if the str function is used
    testFunctionUsed("str")
    
    # Then ensure they used exactly str(df_crime_data)
    testEqual(
      "Structuur verkennen met exact str(df_crime_data)",
      function(env) {
        # Get the student's code as text from the parsed code
        code_text <- toString(deparse(test_env$parsed_code))
        # Look for the exact pattern str(df_crime_data)
        return(grepl("str\\(df_crime_data\\)", code_text))
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (got) {
          # Student used str(df_crime_data), provide positive feedback
          get_reporter()$add_message(
            "✅ Goed gedaan! Je hebt `str(df_crime_data)` gebruikt om de structuur van het dataframe te bekijken.",
            type = "success"
          )
          
          # Provide additional educational message about the str() function
          get_reporter()$add_message(
            "De `str()` functie is erg nuttig om snel inzicht te krijgen in de structuur van een dataframe. Het toont de variabelen, hun types en enkele voorbeeldwaarden.",
            type = "info"
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
          
          return(TRUE)
        } else {
          # Student didn't use str(df_crime_data), provide corrective feedback
          get_reporter()$add_message(
            "❌ Je moet precies de opdracht `str(df_crime_data)` gebruiken om de structuur van het dataframe te bekijken.",
            type = "error"
          )
          
          # Return false so they get a wrong answer
          return(FALSE)
        }
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
