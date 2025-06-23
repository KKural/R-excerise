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
  # Set up the data
  district_crime_rates <- c(5.58, 6.42, 7.05, 7.18, 6.39)
  national_average <- 6.2
})

# Model solution:
above_average <- district_crime_rates > national_average

context({
  testcase("Feedback bij vergelijken met nationaal gemiddelde", {
    testEqual(
      "above_average is correct aangemaakt",
      function(env) {
        exists("above_average", envir = env) && is.logical(env$above_average)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # The variable 'above_average' should exist and be a logical vector comparing to the national average.
          get_reporter()$add_message(
            "❌ De variabele 'above_average' moet bestaan en een logische vector zijn die vergelijkt met het nationaal gemiddelde.",
            type = "error"
          )
        } else {
          # Correct! The logical vector was created and stored in 'above_average'.
          get_reporter()$add_message(
            "✅ De logische vector is correct aangemaakt en opgeslagen in 'above_average'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})