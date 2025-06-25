# Evaluation script for Spreidingsdiagram werkloosheid

context({
  testcase("Feedback bij spreidingsdiagram werkloosheid en criminaliteit", {
    # First check if code is submitted
    testEqual(
      "Controleer of code is ingediend",
      function(env) {
        if (length(env$`.__code__`) == 0) {
          get_reporter()$add_message(
            "❌ Je hebt geen code ingediend. Maak een spreidingsdiagram met werkloosheid en criminaliteitscijfers.",
            type = "error"
          )
          return(FALSE)
        }
        TRUE
      },
      TRUE
    )
    
    # Then check if the plot command is used correctly
    testEqual(
      "Controleer of plot() correct wordt gebruikt",
      function(env) {
        # Get all student code as text
        code_lines <- sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " "))
        user_code <- paste(code_lines, collapse = "\n")
        
        # Direct check for the simplest correct answer
        if (grepl("plot\\(werkloosheid, *criminaliteitscijfers\\)", user_code)) {
          get_reporter()$add_message(
            "✅ Correct! Je hebt een spreidingsdiagram gemaakt met werkloosheid en criminaliteitscijfers.",
            type = "success"
          )
          return(TRUE)
        }
        
        # Check for presence of plot function
        if (!grepl("plot\\s*\\(", user_code)) {
          get_reporter()$add_message(
            "❌ Gebruik de plot() functie om een spreidingsdiagram te maken.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Check for both variables
        if (!grepl("werkloosheid", user_code) || !grepl("criminaliteitscijfers", user_code)) {
          get_reporter()$add_message(
            "❌ Gebruik beide variabelen 'werkloosheid' en 'criminaliteitscijfers' in je plot.",
            type = "error"
          )
          return(FALSE)
        }
        
        # If we have plot and both variables in some form, mark it as correct
        get_reporter()$add_message(
          "✅ Je hebt een spreidingsdiagram gemaakt met de juiste variabelen.",
          type = "success"
        )
        return(TRUE)
      },
      TRUE
    )
  })
}, preExec = {
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})
