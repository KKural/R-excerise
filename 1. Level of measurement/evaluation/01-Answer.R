# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      function(env) {
        # Check if the student has used str(df_crime_data) in their code
        has_used_str_function <- FALSE
        
        # Get the student's code
        code <- paste(sapply(get(".__code__", envir = env), deparse), collapse = "\n")
        
        # Check if str(df_crime_data) is in the code
        if (grepl("str\\s*\\(\\s*df_crime_data\\s*\\)", code)) {
          has_used_str_function <- TRUE
        }
        
        return(has_used_str_function)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ Je moet de str() functie gebruiken om de structuur van df_crime_data te bekijken.",
            type = "error"
          )
          return(FALSE)
        }
        
        get_reporter()$add_message(
          "✅ Correct! Je hebt str() gebruikt om de structuur van df_crime_data te bekijken.",
          type = "success"
        )
        
        get_reporter()$add_message(
          "Output van str(df_crime_data):",
          type = "info"
        )
        
        str_output <- capture.output(str(df_crime_data))
        get_reporter()$add_message(paste(str_output, collapse = "\n"), type = "code")
        
        get_reporter()$add_message(
          "Je kunt ook deze functies gebruiken om data te verkennen:",
          type = "info"
        )
        
        get_reporter()$add_message("names(df_crime_data):", type = "info")
        names_output <- capture.output(print(names(df_crime_data)))
        get_reporter()$add_message(paste(names_output, collapse = "\n"), type = "code")
        
        get_reporter()$add_message("head(df_crime_data):", type = "info")
        head_output <- capture.output(print(head(df_crime_data, 3)))
        get_reporter()$add_message(paste(head_output, collapse = "\n"), type = "code")
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Create the test data frame that will be available to student code
  df_crime_data <- data.frame(
    zaak_id = sprintf("ZAAK%03d", 1:10),
    datum = as.Date("2023-01-01") + 0:9,
    district = c("Noord", "Zuid", "Oost", "West", "Centrum", "Noord", "Zuid", "Oost", "West", "Centrum"),
    delict = c("Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Aanval"),
    waardeverlies = c(35, 42, 18, 27, 53, 21, 45, 33, 19, 30),
    agenten = c(2, 3, 1, 2, 4, 2, 3, 2, 1, 3),
    reactietijd = c(12.5, 8.3, 15.2, 10.1, 7.5, 13.8, 9.2, 11.5, 14.3, 8.7)
  )
})
