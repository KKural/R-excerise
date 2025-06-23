context({
  testcase("Feedback bij berekenen van criminaliteitscijfers", {
    testEqual(
      "criminaliteitscijfers is correct berekend",
      function(env) {
        exists("criminaliteitscijfers", envir = env) && is.numeric(env$criminaliteitscijfers)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # De variabele 'criminaliteitscijfers' moet bestaan en een numerieke vector zijn met cijfers per 1.000.
          get_reporter()$add_message(
            "❌ De variabele 'criminaliteitscijfers' moet bestaan en een numerieke vector zijn met cijfers per 1.000.",
            type = "error"
          )
        } else {
          # Correct! De criminaliteitscijfers zijn berekend en opgeslagen in 'criminaliteitscijfers'.
          get_reporter()$add_message(
            "✅ De criminaliteitscijfers zijn correct berekend en opgeslagen in 'criminaliteitscijfers'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
}, preExec = {
  # Set up the data
  misdrijf_aantallen <- c(143, 265, 97, 418, 204)
  bevolking <- c(25640, 41250, 13760, 58200, 31890)
})

# Model solution:
# criminaliteitscijfers <- (misdrijf_aantallen / bevolking) * 1000
criminaliteitscijfers <- (misdrijf_aantallen / bevolking) * 1000