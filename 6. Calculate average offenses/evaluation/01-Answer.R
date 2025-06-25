maandelijkse_feiten <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
gem_feiten <- mean(maandelijkse_feiten)

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
        if (!exists("gem_feiten", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'gem_feiten' bestaat niet.",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.numeric(env$gem_feiten)) {
          get_reporter()$add_message(
            "❌ 'gem_feiten' moet een numerieke waarde zijn.",
            type = "error"
          )
          return(FALSE)
        }
        verwacht <- mean(c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45))
        if (abs(env$gem_feiten - verwacht) > 1e-6) {
          get_reporter()$add_message(
            "❌ 'gem_feiten' bevat niet het juiste gemiddelde van 'maandelijkse_feiten'.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "Correct! Het gemiddelde is correct berekend en opgeslagen in 'gem_feiten'.",
          type = "success"
        )
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )
  })
})