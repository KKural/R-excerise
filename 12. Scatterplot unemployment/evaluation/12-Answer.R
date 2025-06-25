werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)

context({
  testcase("Feedback bij spreidingsdiagram werkloosheid en criminaliteit", {
    testFunction(
      "plot() is correct aangeroepen",
      fun = "plot",
      args = list(),
      is_correct = function(args, env) {
        # Toestaan: plot(werkloosheid, criminaliteitscijfers) of plot(x = werkloosheid, y = criminaliteitscijfers)
        if (length(args) < 2) return(FALSE)
        # Onbenoemde argumenten
        unnamed <- names(args) == "" | is.null(names(args))
        if (all(unnamed[1:2])) {
          return(identical(args[[1]], env$werkloosheid) && identical(args[[2]], env$criminaliteitscijfers))
        }
        # Benoemde argumenten
        if (!is.null(names(args))) {
          x_ok <- (!is.null(args[["x"]]) && identical(args[["x"]], env$werkloosheid))
          y_ok <- (!is.null(args[["y"]]) && identical(args[["y"]], env$criminaliteitscijfers))
          return(x_ok && y_ok)
        }
        FALSE
      },
      success_message = "✅ Correct! Je hebt plot() correct gebruikt om de spreidingsdiagram te maken.",
      fail_message = "❌ Gebruik de functie plot() met 'werkloosheid' op de x-as en 'criminaliteitscijfers' op de y-as."
    )
  })
}, preExec = {
  # Zet de data op
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})