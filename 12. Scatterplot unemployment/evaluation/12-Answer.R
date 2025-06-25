context({
  testcase("Feedback bij spreidingsdiagram werkloosheid en criminaliteit", {
    testEqual(
      "plot() is correct aangeroepen",
      function(env) {
        tryCatch({
          code <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
          code
        }, error = function(e) { NULL })
      },
      NULL,
      comparator = function(got, want) {
        if (is.null(got)) return(FALSE)
        # Toestaan: plot(werkloosheid, criminaliteitscijfers)
        if (grepl("plot\\s*\\(\\s*werkloosheid\\s*,\\s*criminaliteitscijfers", got)) {
          get_reporter()$add_message(
            "✅ Correct! Je hebt plot() correct gebruikt om de spreidingsdiagram te maken.",
            type = "success"
          )
          return(TRUE)
        }
        # Toestaan: plot(x = werkloosheid, y = criminaliteitscijfers)
        if (grepl("plot\\s*\\(\\s*x\\s*=\\s*werkloosheid\\s*,\\s*y\\s*=\\s*criminaliteitscijfers", got)) {
          get_reporter()$add_message(
            "✅ Correct! Je hebt plot() correct gebruikt om de spreidingsdiagram te maken.",
            type = "success"
          )
          return(TRUE)
        }
        get_reporter()$add_message(
          "❌ Gebruik plot() met 'werkloosheid' op de x-as en 'criminaliteitscijfers' op de y-as.",
          type = "error"
        )
        FALSE
      }
    )
  })
}, preExec = {
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})