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
        if (!is.numeric(env$last_value)) {
          get_reporter()$add_message(
            "❌ Je antwoord is geen numerieke waarde. Gebruik mean(maandelijkse_feiten)",
            type = "error"
          )
        } else if (abs(env$last_value - verwacht) > 1e-6) {
          get_reporter()$add_message(
            paste0("❌ Je antwoord is niet het juiste gemiddelde. Gebruik mean(maandelijkse_feiten). Het juiste gemiddelde is: ", round(verwacht, 2)),
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            paste0("✅ Correct! Het gemiddelde is: ", round(verwacht, 2)),
            type = "success"
          )
        }
        env$last_value
      },
      mean(maandelijkse_feiten),
      comparator = function(got, want, ...) { abs(got - want) < 1e-6 }
    )
  })
}, preExec = {
  maandelijkse_feiten <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
})