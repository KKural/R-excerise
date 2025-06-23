# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Feedback bij samenvatting leeftijden", {
    testEqual(
      "leeftijd_samenvatting is correct aangemaakt",
      function(env) {
        exists("leeftijd_samenvatting", envir = env) && is.numeric(env$leeftijd_samenvatting)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # De variabele 'leeftijd_samenvatting' moet bestaan en een numerieke samenvatting zijn van leeftijden_daders.
          get_reporter()$add_message(
            "❌ De variabele 'leeftijd_samenvatting' moet bestaan en een numerieke samenvatting zijn van leeftijden_daders.",
            type = "error"
          )
        } else {
          # Correct! De samenvatting was gemaakt en opgeslagen in 'leeftijd_samenvatting'.
          get_reporter()$add_message(
            "✅ De samenvatting is correct aangemaakt en opgeslagen in 'leeftijd_samenvatting'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
}, preExec = {
  # Zet de leeftijden_daders vector op
  leeftijden_daders <- c(19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
                   27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34)
})

# Modeloplossing:
leeftijd_samenvatting <- summary(leeftijden_daders)