context({
  testcase("Feedback bij vergelijken met nationaal gemiddelde", {
    testEqual(
      "boven_gemiddelde is correct aangemaakt",
      function(env) {
        # Safe wrapper to catch any student-side syntax error
        tryCatch({
          env$boven_gemiddelde
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Fout in je code: controleer of je vergelijking correct is en of je variabelen goed zijn aangemaakt.",
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
        if (!is.logical(got)) {
          get_reporter()$add_message(
            "❌ 'boven_gemiddelde' moet een logische vector zijn die vergelijkt met het nationaal gemiddelde.",
            type = "error"
          )
          return(FALSE)
        }
        verwacht <- c(5.58, 6.42, 7.05, 7.18, 6.39) > 6.2
        if (!identical(got, verwacht)) {
          get_reporter()$add_message(
            "❌ 'boven_gemiddelde' bevat niet de juiste logische waarden.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Correct! De logische vector is correct aangemaakt en opgeslagen in 'boven_gemiddelde'.",
          type = "success"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Zet de data op
  district_misdaadcijfers <- c(5.58, 6.42, 7.05, 7.18, 6.39)
  nationaal_gemiddelde <- 6.2
})

# Verwachte antwoorden (studenten moeten dit schrijven):
# boven_gemiddelde <- district_misdaadcijfers > nationaal_gemiddelde
