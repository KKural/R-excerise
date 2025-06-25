#!/usr/bin/env Rscript
# -*- coding: utf-8 -*-

# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run
#
# Evaluation script for Exercise 12: Spreidingsdiagram werkloosheid en criminaliteitscijfers
# This script checks if the correct plot function is used with the right variables

context({
  testcase("Feedback bij spreidingsdiagram werkloosheid en criminaliteit", {
    testEqual(
      "plot() is correct aangeroepen",
      function(env) {
        # Check for empty submission
        if (length(env$`.__code__`) == 0) {
          get_reporter()$add_message("❌ Je hebt geen code ingediend.", type = "error")
          return(FALSE)
        }
        
        # Extract user's code as string
        user_code <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        
        # Check if plot is called with the right variables
        if (grepl("plot\\s*\\(\\s*werkloosheid\\s*,\\s*criminaliteitscijfers\\s*\\)", user_code) || 
            grepl("plot\\s*\\(.*x\\s*=\\s*werkloosheid.*,.*y\\s*=\\s*criminaliteitscijfers.*\\)", user_code)) {
          get_reporter()$add_message("✅ Correct! Je hebt een spreidingsdiagram gemaakt.", type = "success")
          return(TRUE)
        } else {
          get_reporter()$add_message("❌ Je code voldoet niet aan de vereisten.", type = "error")
          get_reporter()$add_message("💡 Gebruik plot(werkloosheid, criminaliteitscijfers)", type = "info")
          return(FALSE)
        }
      },
      TRUE,
      comparator = function(got, want, ...) { return(got == want) }
    )
  })
}, preExec = {
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})
