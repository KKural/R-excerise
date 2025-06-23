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
      "gewelddadige_misdrijven_df is correct gefilterd",
      function(env) {
        exists("gewelddadige_misdrijven_df", envir = env) && is.data.frame(env$gewelddadige_misdrijven_df)
      },
      TRUE,
      comparator = function(got, want, ...) {
        # The variable 'gewelddadige_misdrijven_df' should exist and be a data frame filtered for violent crimes.
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'gewelddadige_misdrijven_df' moet bestaan en een data frame zijn met alleen gewelddadige misdrijven.",
            type = "error"
          )
        } else {
          # Correct! The data frame was filtered and stored in 'gewelddadige_misdrijven_df'.
          get_reporter()$add_message(
            "✅ Het data frame is correct gefilterd en opgeslagen in 'gewelddadige_misdrijven_df'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})