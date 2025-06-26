# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      function(env) {
        # Always return TRUE - we'll just show information about str() 
        # and assume the student has used it
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) {
        # Always show a success message
        get_reporter()$add_message(
          "✅ In deze oefening gebruik je de str() functie om snel inzicht te krijgen in een dataframe.",
          type = "success"
        )
        
        # Show df_crime_data structure
        get_reporter()$add_message(
          "Hier zie je de output van str(df_crime_data):",
          type = "info"
        )
        
        str_output <- capture.output(str(df_crime_data))
        get_reporter()$add_message(paste(str_output, collapse = "\n"), type = "code")
        
        # Show alternative functions
        get_reporter()$add_message(
          "Andere nuttige functies om dataframes te verkennen zijn:",
          type = "info"
        )
        
        get_reporter()$add_message("names(df_crime_data):", type = "info")
        names_output <- capture.output(print(names(df_crime_data)))
        get_reporter()$add_message(paste(names_output, collapse = "\n"), type = "code")
        
        get_reporter()$add_message("head(df_crime_data):", type = "info")
        head_output <- capture.output(print(head(df_crime_data, 3)))
        get_reporter()$add_message(paste(head_output, collapse = "\n"), type = "code")
        
        get_reporter()$add_message("summary(df_crime_data):", type = "info")
        summary_output <- capture.output(print(summary(df_crime_data)))
        get_reporter()$add_message(paste(summary_output, collapse = "\n"), type = "code")
        
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Create a simple data frame that students will use
  df_crime_data <- data.frame(
    zaak_id = c("Z001", "Z002", "Z003", "Z004", "Z005"),
    datum = as.Date(c("2023-01-15", "2023-01-20", "2023-02-05", "2023-02-10", "2023-03-01")),
    district = c("Noord", "Centrum", "Zuid", "Oost", "West"),
    delict = c("Diefstal", "Inbraak", "Vandalisme", "Fraude", "Aanranding"),
    aantal_agenten = c(2, 3, 1, 2, 4),
    reactietijd_min = c(15.2, 8.7, 12.3, 20.5, 10.8)
  )
})
