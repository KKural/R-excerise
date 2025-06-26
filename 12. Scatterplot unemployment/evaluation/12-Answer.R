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
        
        # Check for both variables in the code (making the check case-insensitive)
        if (!grepl("werkloosheid", code, ignore.case = TRUE)) {
          get_reporter()$add_message(
            "❌ De variabele 'werkloosheid' wordt niet gebruikt in je plot.",
            type = "error"
          )
          return(FALSE)
        }
        
        if (!grepl("criminaliteitscijfers", code, ignore.case = TRUE)) {
          get_reporter()$add_message(
            "❌ De variabele 'criminaliteitscijfers' wordt niet gebruikt in je plot.",
            type = "error"
          )
          return(FALSE)
        }
        
        # More generous pattern matching to handle various ways to create the plot
        # This will match both simple plot() calls and those with extra parameters
        basic_pattern = grepl("plot\\s*\\([^)]*werkloosheid[^)]*criminaliteitscijfers[^)]*\\)", code, ignore.case = TRUE) || 
                       grepl("plot\\s*\\([^)]*criminaliteitscijfers[^)]*werkloosheid[^)]*\\)", code, ignore.case = TRUE)
        
        # More specific patterns if needed
        correct_pattern = grepl("plot\\s*\\(\\s*werkloosheid\\s*,\\s*criminaliteitscijfers\\s*\\)", code, ignore.case = TRUE)
        named_params_pattern = grepl("plot\\s*\\(\\s*x\\s*=\\s*werkloosheid\\s*,\\s*y\\s*=\\s*criminaliteitscijfers\\s*\\)", code, ignore.case = TRUE)
        
        # Check if any of our plot patterns match
        if (basic_pattern || correct_pattern || named_params_pattern) {
          get_reporter()$add_message(
            "✅ Correct! Je hebt een goede plot() functie gebruikt om werkloosheid en criminaliteitscijfers te visualiseren.",
            type = "success"
          )
          
          # Check if the student added more advanced features
          has_title = grepl("title|main", code, ignore.case = TRUE)
          has_labels = grepl("xlab|ylab", code, ignore.case = TRUE)
          
          if (has_title || has_labels) {
            get_reporter()$add_message(
              "👍 Goed werk! Je hebt extra elementen toegevoegd zoals titels of aslabels.",
              type = "success"
            )
          }
          
          # Success message
          get_reporter()$add_message(
            "✅ Je hebt succesvol een spreidingsdiagram gemaakt dat werkloosheid en criminaliteitscijfers visualiseert.",
            type = "success"
          )
          return(TRUE)
        } else {
          # If we got here, there's a plot function but not with the right variables in the right way
          get_reporter()$add_message(
            "❌ Je gebruikt plot(), maar niet op de juiste manier om werkloosheid tegen criminaliteitscijfers te plotten.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik: plot(werkloosheid, criminaliteitscijfers)",
            type = "info"
          )
          return(FALSE)
        }
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
