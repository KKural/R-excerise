# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Spreidingsdiagram werkloosheid", {
    testEqual(
      "Plot werkloosheid tegen criminaliteitscijfers",
      function(env) {
        # Convert student's code to string for analysis
        code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        
        # Check if plot function is used at all
        if (!grepl("plot\\s*\\(", code, perl = TRUE)) {
          get_reporter()$add_message(
            "❌ Gebruik de plot() functie om een spreidingsdiagram te maken.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Check for both variables in the code
        if (!grepl("werkloosheid", code)) {
          get_reporter()$add_message(
            "❌ De variabele 'werkloosheid' wordt niet gebruikt in je plot.",
            type = "error"
          )
          return(FALSE)
        }
        
        if (!grepl("criminaliteitscijfers", code)) {
          get_reporter()$add_message(
            "❌ De variabele 'criminaliteitscijfers' wordt niet gebruikt in je plot.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Check for the exact plot command pattern (this combines the two approaches)
        correct_pattern = grepl("plot\\s*\\(\\s*werkloosheid\\s*,\\s*criminaliteitscijfers\\s*\\)", code)
        named_params_pattern = grepl("plot\\s*\\(\\s*x\\s*=\\s*werkloosheid\\s*,\\s*y\\s*=\\s*criminaliteitscijfers\\s*\\)", code)
        
        if (correct_pattern || named_params_pattern) {
          get_reporter()$add_message(
            "✅ Correct! Je hebt de juiste syntax gebruikt: plot(werkloosheid, criminaliteitscijfers).",
            type = "success"
          )
        } else {
          get_reporter()$add_message(
            "⚠️ Je code werkt, maar de aanbevolen syntax is: plot(werkloosheid, criminaliteitscijfers)",
            type = "info"
          )
        }
        
        # If both variables are present, consider it correct (most flexible approach)
        get_reporter()$add_message(
          "✅ Je hebt succesvol een spreidingsdiagram gemaakt met werkloosheid en criminaliteitscijfers.",
          type = "success"
        )
        return(TRUE)
      },
      TRUE
    )
  })
}, preExec = {
  # Define the variables for the scatter plot
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
  
  # Make the data available in all necessary environments
  assign("werkloosheid", werkloosheid, envir = globalenv())
  assign("criminaliteitscijfers", criminaliteitscijfers, envir = globalenv())
  
  # Also make it available in the local environment
  assign("werkloosheid", werkloosheid, envir = environment())
  assign("criminaliteitscijfers", criminaliteitscijfers, envir = environment())
  
  # Make sure it's available for the test environment
  tryCatch({
    if (exists("test_env")) {
      if (exists("clean_env", envir = test_env)) {
        assign("werkloosheid", werkloosheid, envir = test_env$clean_env)
        assign("criminaliteitscijfers", criminaliteitscijfers, envir = test_env$clean_env)
      }
    }
  }, error = function(e) {
    # Just ignore any errors here
  })
})

# Modeloplossing (commented out):
# plot(werkloosheid, criminaliteitscijfers)
# title(main = "Verband tussen werkloosheid en criminaliteit", 
#       xlab = "Werkloosheidspercentage", 
#       ylab = "Criminaliteitscijfers per 1.000 inwoners")
