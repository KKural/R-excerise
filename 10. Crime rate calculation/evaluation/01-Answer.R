context({
  testcase("Feedback bij berekenen van criminaliteitscijfers", {
    testEqual(
      "crime_rates is correct berekend",
      function(env) {
        exists("crime_rates", envir = env) && is.numeric(env$crime_rates)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # The variable 'crime_rates' should exist and be a numeric vector of rates per 1,000.
          get_reporter()$add_message(
            "❌ De variabele 'crime_rates' moet bestaan en een numerieke vector zijn met cijfers per 1.000.",
            type = "error"
          )
        } else {
          # Correct! The crime rates were calculated and stored in 'crime_rates'.
          get_reporter()$add_message(
            "✅ De criminaliteitscijfers zijn correct berekend en opgeslagen in 'crime_rates'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
}, preExec = {
  # Set up the data
  crime_counts <- c(143, 265, 97, 418, 204)
  population <- c(25640, 41250, 13760, 58200, 31890)
})

# Model solution:
# misdaadcijfers <- (aantal_misdrijven / bevolking) * 1000
crime_rates <- (crime_counts / population) * 1000