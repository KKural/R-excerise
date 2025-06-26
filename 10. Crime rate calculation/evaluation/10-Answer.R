context({
  testcase("", {
    testEqual(
      "",
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
          get_reporter()$add_message(
            paste("Verwachte waarden:", paste(round(verwacht, 2), collapse=", ")),
            type = "info"
          )
          get_reporter()$add_message(
            paste("Jouw waarden:", paste(round(got, 2), collapse=", ")),
            type = "info"
          )
          get_reporter()$add_message(
            "💡 Gebruik de formule: (misdrijf_aantallen / bevolking) * 1000",
            type = "info"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Correct! De criminaliteitscijfers zijn correct berekend en opgeslagen in 'criminaliteitscijfers'.",
          type = "success"
        )
        get_reporter()$add_message(
          "Je hebt de formule (misdrijf_aantallen / bevolking) * 1000 correct toegepast voor alle districten.",
          type = "info"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Zet de data op
  misdrijf_aantallen <- c(143, 265, 97, 418, 204)
  bevolking <- c(25640, 41250, 13760, 58200, 31890)
  
  # Also make the data available globally
  assign("misdrijf_aantallen", misdrijf_aantallen, envir = globalenv())
  assign("bevolking", bevolking, envir = globalenv())
})

# Modeloplossing:
# criminaliteitscijfers <- (misdrijf_aantallen / bevolking) * 1000
criminaliteitscijfers <- (misdrijf_aantallen / bevolking) * 1000