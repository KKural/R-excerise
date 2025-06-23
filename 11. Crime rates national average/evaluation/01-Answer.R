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
        exists("boven_gemiddelde", envir = env) && is.logical(env$boven_gemiddelde)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'boven_gemiddelde' moet bestaan en een logische vector zijn die vergelijkt met het nationaal gemiddelde.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ De logische vector is correct aangemaakt en opgeslagen in 'boven_gemiddelde'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})