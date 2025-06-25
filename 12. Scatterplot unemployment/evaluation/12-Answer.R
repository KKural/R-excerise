# Evaluation script for Spreidingsdiagram werkloosheid

context({
  testcase("", {
    # Check if the right code is used
    testEqual(
      "",
      function(env) {
        # Convert all code to single string
        code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        
        # Simply check for all required components
        if (grepl("plot", code) && grepl("werkloosheid", code) && grepl("criminaliteitscijfers", code)) {
          get_reporter()$add_message("✅ Correct! Je hebt een spreidingsdiagram gemaakt.", type = "success")
          TRUE
        } else {
          get_reporter()$add_message("❌ Gebruik plot(werkloosheid, criminaliteitscijfers)", type = "error")
          FALSE
        }
      },
      TRUE,
      comparator = function(got, want, ...) {
        got
      }
    )
  })
}, preExec = {
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})
