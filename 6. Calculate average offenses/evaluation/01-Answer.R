maandelijkse_feiten <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
gem_feiten <- mean(maandelijkse_feiten)
result <- gem_feiten

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
      "De uitkomst van mean(maandelijkse_feiten) is correct berekend",
      function(env) {
        verwacht <- mean(maandelijkse_feiten)
        # Check if the student's code is exactly mean(maandelijkse_feiten)
        # and if the output is correct
        if (!is.numeric(env$result)) {
          get_reporter()$add_message(
            "❌ Je antwoord is geen numerieke waarde. Gebruik mean(maandelijkse_feiten)",
            type = "error"
          )
          return(FALSE)
        }
        if (abs(env$result - verwacht) > 1e-6) {
          get_reporter()$add_message(
            paste0("❌ Je antwoord is niet het juiste gemiddelde. Gebruik mean(maandelijkse_feiten). Het juiste gemiddelde is: ", round(verwacht, 2)),
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          paste0("✅ Correct! Het gemiddelde is: ", round(verwacht, 2)),
          type = "success"
        )
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )
  })
}, preExec = {
  maandelijkse_feiten <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
})