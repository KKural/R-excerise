# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      function(env) { NULL },
      NULL,
      comparator = function(got, want, ...) {
        TRUE
      }
    )
  })
}, preExec = {
  # Set up the crime_data data frame
  crime_data <- data.frame(
    id = 1:20,
    offense = c("Theft", "Assault", "Drug Offense", "Robbery", "Vandalism", 
                "Assault", "Burglary", "Homicide", "Theft", "Assault",
                "Fraud", "Robbery", "Theft", "Drug Offense", "Homicide",
                "Assault", "Vandalism", "Fraud", "Burglary", "Theft"),
    district = c("North", "South", "East", "Central", "West",
                 "South", "North", "Central", "East", "West",
                 "North", "South", "West", "East", "South",
                 "Central", "North", "East", "West", "South"),
    date = as.Date("2023-01-01") + 0:19
  )
})

# Model solution:
violent_crimes_df <- subset(crime_data, offense %in% c("Assault", "Robbery", "Homicide"))

context({
  testcase("Feedback bij filteren van gewelddadige misdrijven", {
    testEqual(
      "violent_crimes_df is correct gefilterd",
      function(env) {
        exists("violent_crimes_df", envir = env) && is.data.frame(env$violent_crimes_df)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # The variable 'violent_crimes_df' should exist and be a data frame filtered for violent crimes.
          get_reporter()$add_message(
            "❌ De variabele 'violent_crimes_df' moet bestaan en een data frame zijn met alleen gewelddadige misdrijven.",
            type = "error"
          )
        } else {
          # Correct! The data frame was filtered and stored in 'violent_crimes_df'.
          get_reporter()$add_message(
            "✅ Het data frame is correct gefilterd en opgeslagen in 'violent_crimes_df'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})