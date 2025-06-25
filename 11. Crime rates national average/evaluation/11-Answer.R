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
  # Set up the data
  district_misdaadcijfers <- c(5.58, 6.42, 7.05, 7.18, 6.39)
  nationaal_gemiddelde <- 6.2
})

# Verwachte antwoorden:
boven_gemiddeld <- district_misdaadcijfers > nationaal_gemiddelde

context({
  testcase("Feedback bij vergelijken met nationaal gemiddelde", {
    testEqual(
      "boven_gemiddelde is correct aangemaakt",
      function(env) {
        if (!exists("boven_gemiddelde", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'boven_gemiddelde' bestaat niet.",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.logical(env$boven_gemiddelde)) {
          get_reporter()$add_message(
            "❌ 'boven_gemiddelde' moet een logische vector zijn die vergelijkt met het nationaal gemiddelde.",
            type = "error"
          )
          return(FALSE)
        }
        verwacht <- c(5.58, 6.42, 7.05, 7.18, 6.39) > 6.2
        if (!identical(env$boven_gemiddelde, verwacht)) {
          get_reporter()$add_message(
            "❌ 'boven_gemiddelde' bevat niet de juiste logische waarden.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "Correct! De logische vector is correct aangemaakt en opgeslagen in 'boven_gemiddelde'.",
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
  district_misdaadcijfers <- c(5.58, 6.42, 7.05, 7.18, 6.39)
  nationaal_gemiddelde <- 6.2
})