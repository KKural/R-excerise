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
  # Set up the maandelijkse_misdrijven vector
  maandelijkse_misdrijven <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
})

# Model solution:
gem_offenses <- mean(maandelijkse_misdrijven)

context({
  testcase("Feedback bij berekenen van gemiddelde", {
    testEqual(
      "gem_offenses is correct berekend",
      function(env) {
        exists("gem_offenses", envir = env) && is.numeric(env$gem_offenses) && abs(env$gem_offenses - mean(c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45))) < 1e-6
      },
      TRUE,
      comparator = function(got, want, ...) {
        # The variable 'gem_offenses' should exist and be the mean of maandelijkse_misdrijven.
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'gem_offenses' moet bestaan en het gemiddelde zijn van maandelijkse_misdrijven.",
            type = "error"
          )
        } else {
          # Correct! The mean was calculated and stored in 'gem_offenses'.
          get_reporter()$add_message(
            "✅ Het gemiddelde is correct berekend en opgeslagen in 'gem_offenses'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})