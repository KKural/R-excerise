# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Dataframe structuur verkennen met str()", {
    # We'll only use a single test to avoid default English messages
    # from testFunctionUsed
    testEqual(
      "Structuur verkennen met exact str(df_crime_data)",
      function(env) {
        # Get the student's code as text from the parsed code
        code_text <- toString(deparse(test_env$parsed_code))
        
        # First check if str function is used at all
        str_used <- is_function_used("str", find_assign(test_env$parsed_code), test_env$parsed_code, test_env$parsed_code)
        
        # Then look for the exact pattern str(df_crime_data)
        exact_match <- grepl("str\\(df_crime_data\\)", code_text)
        
        # Return a list with both checks
        return(list(str_used = str_used, exact_match = exact_match))
      },
      list(str_used = TRUE, exact_match = TRUE),
      comparator = function(got, want, ...) {
        # First check if they used str() function at all
        if (!got$str_used) {
          get_reporter()$add_message(
            "❌ Je moet de `str()` functie gebruiken in je code.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Then check if they used exactly str(df_crime_data)
        if (got$exact_match) {
          # Student used str(df_crime_data), provide positive feedback
          # English: "Well done! You used `str(df_crime_data)` to view the structure of the dataframe."
          get_reporter()$add_message(
            "✅ Goed gedaan! Je hebt `str(df_crime_data)` gebruikt om de structuur van het dataframe te bekijken.",
            type = "success"
          )
          
          # Provide additional educational message about the str() function
          # English: "The `str()` function is very useful to quickly understand the structure of a dataframe. It shows variables, their types, and some example values."
          get_reporter()$add_message(
            "De `str()` functie is erg nuttig om snel inzicht te krijgen in de structuur van een dataframe. Het toont de variabelen, hun types en enkele voorbeeldwaarden.",
            type = "info"
          )
          
          # Capture and show the str() output for the data frame
          # English: "## Structure of df_crime_data:"
          get_reporter()$add_message(
            "## Structuur van df_crime_data:",
            type = "markdown"
          )
          
          # Convert str() output to a string and display it as code
          str_output <- capture.output(str(df_crime_data))
          get_reporter()$add_message(paste(str_output, collapse = "\n"), type = "code")
          
          # Add educational explanation about the measurement levels
          # English: "## Measurement levels in the dataset:"
          get_reporter()$add_message(
            "## Meetniveaus in de dataset:",
            type = "markdown"
          )
          
          # Use paste for string concatenation, not the + operator
          # English:
          # - Nominal variables: `type`, `district` (categories without order)
          # - Ordinal variables: `ernst` (categories with order: Low < Medium < Severe)
          # - Interval/Ratio variables: `leeftijd` (numerical values)
          get_reporter()$add_message(paste(
            "- **Nominale variabelen**: `type`, `district` (categorieën zonder rangorde)",
            "- **Ordinale variabelen**: `ernst` (categorieën met rangorde: Licht < Matig < Ernstig)", 
            "- **Interval/Ratio variabelen**: `leeftijd` (numerieke waarden)",
            sep = "\n"
          ), type = "markdown")
          
          # English: "## Tips for identifying measurement levels:"
          get_reporter()$add_message(
            "## Tips voor het herkennen van meetniveaus:",
            type = "markdown"
          )
          
          # English:
          # - Nominal variables are often stored as `Factor` without ordered=TRUE
          # - Ordinal variables are often stored as `Ord.factor`
          # - Interval/Ratio variables are often stored as `num` or `int`
          get_reporter()$add_message(paste(
            "- Nominale variabelen zijn vaak opgeslagen als `Factor` zonder ordered=TRUE",
            "- Ordinale variabelen zijn vaak opgeslagen als `Ord.factor`",
            "- Interval/Ratio variabelen zijn vaak opgeslagen als `num` of `int`",
            sep = "\n"
          ), type = "markdown")
          
          return(TRUE)
        } else {
          # Student used str() but not exactly str(df_crime_data)
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
