context({
  testcase("Feedback bij berekenen van criminaliteitscijfers", {
    testEqual(
      "criminaliteitscijfers is correct berekend",
      function(env) {
        if (!exists("criminaliteitscijfers", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'criminaliteitscijfers' bestaat niet.",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.numeric(env$criminaliteitscijfers)) {
          get_reporter()$add_message(
            "❌ 'criminaliteitscijfers' moet een numerieke vector zijn met cijfers per 1.000.",
            type = "error"
          )
          return(FALSE)
        }
        verwacht <- (c(143, 265, 97, 418, 204) / c(25640, 41250, 13760, 58200, 31890)) * 1000
        if (any(abs(env$criminaliteitscijfers - verwacht) > 1e-6)) {
          get_reporter()$add_message(
            "❌ 'criminaliteitscijfers' bevat niet de juiste waarden per 1.000 inwoners.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "Correct! De criminaliteitscijfers zijn correct berekend en opgeslagen in 'criminaliteitscijfers'.",
          type = "success"
        )
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )
  })
}, preExec = {
  # Zet de data op
  misdrijf_aantallen <- c(143, 265, 97, 418, 204)
  bevolking <- c(25640, 41250, 13760, 58200, 31890)
})

# Modeloplossing:
# criminaliteitscijfers <- (misdrijf_aantallen / bevolking) * 1000
criminaliteitscijfers <- (misdrijf_aantallen / bevolking) * 1000