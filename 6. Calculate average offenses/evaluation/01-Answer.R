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
  # Set up the maandelijkse_feiten vector
  maandelijkse_feiten <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
})

# Model solution:
gem_feiten <- mean(maandelijkse_feiten)

context({
  testcase("Feedback bij berekenen van gemiddelde", {
    testEqual(
      "gem_feiten is correct berekend",
      function(env) {
        exists("gem_feiten", envir = env) && is.numeric(env$gem_feiten) && abs(env$gem_feiten - mean(c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45))) < 1e-6
      },
      TRUE,
      comparator = function(got, want, ...) {
        # De variabele 'gem_feiten' moet bestaan en het gemiddelde zijn van maandelijkse_feiten.
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'gem_feiten' moet bestaan en het gemiddelde zijn van maandelijkse_feiten.",
            type = "error"
          )
        } else {
          # Correct! Het gemiddelde is berekend en opgeslagen in 'gem_feiten'.
          get_reporter()$add_message(
            "✅ Het gemiddelde is correct berekend en opgeslagen in 'gem_feiten'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})