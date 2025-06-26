# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

# Sample data for the exercise
df_crime_data <- data.frame(
  zaak_id = sprintf("ZAAK%03d", 1:10),
  datum = as.Date("2023-01-01") + 0:9,
  district = c("Noord", "Zuid", "Oost", "West", "Centrum", "Noord", "Zuid", "Oost", "West", "Centrum"),
  delict = c("Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Aanval"),
  waardeverlies = c(35, 42, 18, 27, 53, 21, 45, 33, 19, 30),
  agenten = c(2, 3, 1, 2, 4, 2, 3, 2, 1, 3),
  reactietijd = c(12.5, 8.3, 15.2, 10.1, 7.5, 13.8, 9.2, 11.5, 14.3, 8.7)
)

context({
  testcase("", {
    testEqual(
      "",
      function(env) {
        # Get the submitted code
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        
        # Simple check for "str" and "df_crime_data" in the same line
        if (!grepl("str.*df_crime_data|df_crime_data.*str", code_str)) {
          get_reporter()$add_message("❌ Je moet de str() functie gebruiken om de structuur van df_crime_data te bekijken.", type = "error")
          return(FALSE)
        }
        
        # If we get here, the check passed
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (got) {
          get_reporter()$add_message("✅ Correct! Je hebt str() gebruikt om de structuur van df_crime_data te bekijken.", type = "success")
          
          # Show the output of str(df_crime_data)
          get_reporter()$add_message("Output van str(df_crime_data):", type = "info")
          str_output <- capture.output(str(df_crime_data))
          get_reporter()$add_message(paste(str_output, collapse = "\n"), type = "code")
          
          # Show what other functions would give
          get_reporter()$add_message("Je kunt ook deze functies gebruiken:", type = "info")
          
          get_reporter()$add_message("names(df_crime_data):", type = "info")
          names_output <- capture.output(print(names(df_crime_data)))
          get_reporter()$add_message(paste(names_output, collapse = "\n"), type = "code")
          
          get_reporter()$add_message("head(df_crime_data):", type = "info")
          head_output <- capture.output(print(head(df_crime_data, 3)))
          get_reporter()$add_message(paste(head_output, collapse = "\n"), type = "code")
        }
        
        return(got == want)
      }
    )
  })
})
