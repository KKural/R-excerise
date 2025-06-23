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
  # Set up the monthly_offenses vector
  monthly_offenses <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
})

# Model solution:
avg_offenses <- mean(monthly_offenses)

context({
  testcase("Feedback bij berekenen van gemiddelde", {
    testEqual(
      "avg_offenses is correct berekend",
      function(env) {
        exists("avg_offenses", envir = env) && is.numeric(env$avg_offenses) && abs(env$avg_offenses - mean(c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45))) < 1e-6
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # The variable 'avg_offenses' should exist and be the mean of monthly_offenses.
          get_reporter()$add_message(
            "❌ De variabele 'avg_offenses' moet bestaan en het gemiddelde zijn van monthly_offenses.",
            type = "error"
          )
        } else {
          # Correct! The mean was calculated and stored in 'avg_offenses'.
          get_reporter()$add_message(
            "✅ Het gemiddelde is correct berekend en opgeslagen in 'avg_offenses'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})