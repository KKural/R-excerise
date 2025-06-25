context({
  testcase("Feedback bij berekenen van criminaliteitscijfers", {
    testEqual(
      "criminaliteitscijfers is correct berekend",
      function(env) {
        # Safe wrapper to catch any student-side syntax error
        tryCatch({
          env$criminaliteitscijfers
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Fout in je code: controleer of je berekening correct is en of je variabelen goed zijn aangemaakt.",
            type = "error"
          )
          return(NULL)
        })
      },
      NULL,
      comparator = function(got, want) {
        if (is.null(got)) {
          return(FALSE)
        }
        if (!is.numeric(got)) {
          get_reporter()$add_message(
            "❌ 'criminaliteitscijfers' moet een numerieke vector zijn met cijfers per 1.000.",
            type = "error"
          )
          return(FALSE)
        }
        verwacht <- (c(143, 265, 97, 418, 204) / c(25640, 41250, 13760, 58200, 31890)) * 1000
        if (any(abs(got - verwacht) > 1e-6)) {
          get_reporter()$add_message(
            "❌ 'criminaliteitscijfers' bevat niet de juiste waarden per 1.000 inwoners.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Correct! De criminaliteitscijfers zijn correct berekend en opgeslagen in 'criminaliteitscijfers'.",
          type = "success"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Zet de data op
  misdrijf_aantallen <- c(143, 265, 97, 418, 204)
  bevolking <- c(25640, 41250, 13760, 58200, 31890)
})

# Modeloplossing:
# criminaliteitscijfers <- (misdrijf_aantallen / bevolking) * 1000