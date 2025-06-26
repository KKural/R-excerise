# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Controleren van het gebruik van str() functie", {
    testEqual(
      "",
      function(env) {
        # Check if the student's code contains str(df_crime_data)
        # Use a more flexible pattern that matches any whitespace between str and (
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        
        # More flexible pattern to match different ways str might be called
        if (!grepl("str\\s*\\(\\s*df_crime_data\\s*\\)", code_str)) {
          get_reporter()$add_message(
            "❌ Je moet de str() functie gebruiken om de structuur van df_crime_data te bekijken.",
            type = "error"
          )
          return(FALSE)
        }
        
        # If str() was used, show its output
        get_reporter()$add_message(
          "✅ Correct! Je hebt str() gebruikt om de structuur van df_crime_data te bekijken.",
          type = "success"
        )
        
        # Show the output of str(df_crime_data)
        get_reporter()$add_message(
          "Output van str(df_crime_data):",
          type = "info"
        )
        
        # Capture and display the str() output
        str_output <- capture.output(str(df_crime_data))
        get_reporter()$add_message(
          paste(str_output, collapse = "\n"),
          type = "code"
        )
        
        # Additional tips
        get_reporter()$add_message(
          "Tip: Je kunt ook deze functies gebruiken om data te verkennen:",
          type = "info"
        )
        get_reporter()$add_message(
          "- names(df_crime_data) voor kolomnamen",
          type = "info"
        )
        get_reporter()$add_message(
          "- head(df_crime_data) voor de eerste paar rijen",
          type = "info"
        )
        
        return(TRUE)
      },
      TRUE
    )
  })
}, preExec = {
  # Create the test data that will be available to student code
  set.seed(123) # For reproducibility
  df_crime_data <- data.frame(
    zaak_id = sprintf("ZAAK%03d", 1:10),
    datum = as.Date("2023-01-01") + 0:9,
    district = sample(c("Noord", "Zuid", "Oost", "West", "Centrum"), 10, TRUE),
    delict = sample(c("Diefstal", "Aanval", "Inbraak", "Vandalisme"), 10, TRUE),
    waardeverlies = round(rlnorm(10, 3, 1)),
    agenten = sample(1:5, 10, TRUE),
    reactietijd = round(pmax(rnorm(10, 12, 4), 0), 1)
  )
})
