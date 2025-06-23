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
  # Set up the offender_ages vector
  offender_ages <- c(19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
                   27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34)
})

context({
  testcase("Feedback bij samenvatting leeftijden", {
    testEqual(
      "age_summary is correct aangemaakt",
      function(env) {
        exists("age_summary", envir = env) && is.numeric(env$age_summary)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # The variable 'age_summary' should exist and be a numeric summary of offender_ages.
          get_reporter()$add_message(
            "❌ De variabele 'age_summary' moet bestaan en een numerieke samenvatting zijn van offender_ages.",
            type = "error"
          )
        } else {
          # Correct! The summary was created and stored in 'age_summary'.
          get_reporter()$add_message(
            "✅ De samenvatting is correct aangemaakt en opgeslagen in 'age_summary'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})

# Model solution:
age_summary <- summary(offender_ages)