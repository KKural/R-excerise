# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Spreidingsdiagram werkloosheid", {
    testEqual(
      "",
      function(env) {
        # Convert student's code to string for analysis
        code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        
        # Check for the exact plot command pattern
        correct_pattern = grepl("plot\\s*\\(\\s*werkloosheid\\s*,\\s*criminaliteitscijfers\\s*\\)", code)
        
        # Alternative pattern with named parameters
        named_params_pattern = grepl("plot\\s*\\(\\s*x\\s*=\\s*werkloosheid\\s*,\\s*y\\s*=\\s*criminaliteitscijfers\\s*\\)", code)
        
        # Check if either pattern matches
        if (correct_pattern || named_params_pattern) {
          get_reporter()$add_message(
            "✅ Correct! Je hebt een spreidingsdiagram gemaakt met werkloosheid en criminaliteitscijfers.",
            type = "success"
          )
          return(TRUE)
        } else if (!grepl("plot", code)) {
          get_reporter()$add_message(
            "❌ Gebruik de plot() functie om een spreidingsdiagram te maken.",
            type = "error"
          )
          return(FALSE)
        } else if (!grepl("werkloosheid", code) || !grepl("criminaliteitscijfers", code)) {
          get_reporter()$add_message(
            "❌ Gebruik beide variabelen 'werkloosheid' en 'criminaliteitscijfers' in je plot.",
            type = "error"
          )
          return(FALSE)
        } else {
          get_reporter()$add_message(
            "❌ Gebruik plot(werkloosheid, criminaliteitscijfers) om een correct spreidingsdiagram te maken.",
            type = "error"
          )
          return(FALSE)
        }
      },
      TRUE
    )
  })
}, preExec = {
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})
