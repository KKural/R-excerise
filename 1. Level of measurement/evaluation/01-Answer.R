# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

# Test data that's visible to both student and test code
df_crime_data <- data.frame(
  type = c("Theft", "Assault", "Burglary", "Fraud"),
  severity = c("Low", "High", "Medium", "Low"),
  offender_age = c(25, 30, 22, 45),
  district = c("A", "B", "A", "C"),
  stringsAsFactors = TRUE
)

context({
  testcase("Checking the use of str() function", {
    testEqual("Using str() to examine df_crime_data", 
      function(env) {
        # Get the student's submitted code
        student_code <- toString(parse(text = readLines("student.R")))
        
        # Check if str(df_crime_data) is used
        if (!grepl("str\\(df_crime_data\\)", student_code)) {
          get_reporter()$add_message("❌ Je moet de str() functie gebruiken om de structuur van df_crime_data te bekijken.", type = "error")
          return(FALSE)
        }
        
        # If str() was used, show its output and additional helpful info
        get_reporter()$add_message("\nOutput van str(df_crime_data):", type = "info")
        get_reporter()$add_message(capture.output(str(df_crime_data)), type = "info")
        
        get_reporter()$add_message("\nTip: Je kunt ook deze functies gebruiken om data te verkennen:", type = "info")
        get_reporter()$add_message("- names(df_crime_data) voor kolomnamen", type = "info")
        get_reporter()$add_message("- head(df_crime_data) voor de eerste paar rijen", type = "info")
        
        get_reporter()$add_message("\n✅ Correct! Je hebt str() gebruikt om de structuur van df_crime_data te bekijken.", type = "success")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) got == want
    )
  })
})
