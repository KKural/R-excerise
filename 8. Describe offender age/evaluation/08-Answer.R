# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Feedback bij samenvatting leeftijden", {
    testEqual(
      "leeftijd_samenvatting is correct aangemaakt",
      function(env) {
        if (!exists("leeftijd_samenvatting", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'leeftijd_samenvatting' bestaat niet.",
            type = "error"
          )
          return(FALSE)
        }
        got <- env$leeftijd_samenvatting
        expected <- summary(env$leeftijden_daders)
        if (!is.numeric(got) || is.null(names(got))) {
          get_reporter()$add_message(
            "❌ 'leeftijd_samenvatting' moet een samenvatting zijn zoals gegeven door summary(leeftijden_daders).",
            type = "error"
          )
          return(FALSE)
        }
        if (!identical(got, expected)) {
          get_reporter()$add_message(
            "❌ De inhoud van 'leeftijd_samenvatting' is niet correct. Gebruik summary(leeftijden_daders).",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Correct! De samenvatting is correct aangemaakt en opgeslagen in 'leeftijd_samenvatting'.",
          type = "success"
        )
        TRUE
      },
      TRUE
    )
  })
}, preExec = {
  # Zet de leeftijden_daders vector op
  leeftijden_daders <- c(19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
                   27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34)
})

# Modeloplossing:
leeftijd_samenvatting <- summary(leeftijden_daders)