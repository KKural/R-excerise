# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

# Create test data at the top level (available to both student and check code)
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
        # Get the student's code
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        
        # Check if str(df_crime_data) is used in the code
        if (!grepl("str\\s*\\(\\s*df_crime_data\\s*\\)", code_str)) {
          get_reporter()$add_message("❌ Je moet de str() functie gebruiken om de structuur van df_crime_data te bekijken.", type = "error")
          return(FALSE)
        }
        
        # Success case
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (got) {
          get_reporter()$add_message("✅ Correct! Je hebt str() gebruikt om de structuur van df_crime_data te bekijken.", type = "success")
          
          # Show the output of str(df_crime_data)
          get_reporter()$add_message("Output van str(df_crime_data):", type = "info")
          str_output <- capture.output(str(df_crime_data))
          get_reporter()$add_message(paste(str_output, collapse = "\n"), type = "code")
          
          # Additional tips
          get_reporter()$add_message("Tip: Je kunt ook deze functies gebruiken om data te verkennen:", type = "info")
          get_reporter()$add_message("- names(df_crime_data) voor kolomnamen", type = "info")
          get_reporter()$add_message("- head(df_crime_data) voor de eerste paar rijen", type = "info")
        }
        got == want
      }
    )
  })
})
