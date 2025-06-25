context({
  testcase("Feedback bij spreidingsdiagram werkloosheid en criminaliteit", {
    test_code({
      found <- FALSE
      exprs <- .user_code
      for (expr in exprs) {
        if (is.call(expr) && as.character(expr[[1]]) == "plot") {
          args <- as.list(expr)[-1]
          # Onbenoemde argumenten
          if (length(args) >= 2 && is.null(names(args))) {
            if (identical(args[[1]], as.name("werkloosheid")) &&
                identical(args[[2]], as.name("criminaliteitscijfers"))) {
              found <- TRUE
            }
          }
          # Benoemde argumenten
          if (!is.null(names(args))) {
            x <- args[["x"]]
            y <- args[["y"]]
            if (!is.null(x) && !is.null(y) &&
                identical(x, as.name("werkloosheid")) &&
                identical(y, as.name("criminaliteitscijfers"))) {
              found <- TRUE
            }
          }
        }
      }
      if (found) {
        get_reporter()$add_message(
          "✅ Correct! Je hebt plot() correct gebruikt om de spreidingsdiagram te maken.",
          type = "success"
        )
      } else {
        get_reporter()$add_message(
          "❌ Gebruik plot() met 'werkloosheid' op de x-as en 'criminaliteitscijfers' op de y-as.",
          type = "error"
        )
      }
      TRUE
    })
  })
}, preExec = {
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})