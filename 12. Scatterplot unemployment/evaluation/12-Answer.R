context({
  testcase("Feedback bij spreidingsdiagram werkloosheid en criminaliteit", {
    testEqual(
      "plot() is correct aangeroepen",
      function(env) {
        # Check for empty submission
        if (length(env$`.__code__`) == 0) {
          get_reporter()$add_message(
            "❌ Je hebt geen code ingediend. Schrijf code om een spreidingsdiagram te maken.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Extract the user's code as string for analysis
        user_code <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        
        # Check if the basic command was used
        basic_pattern <- "plot\\s*\\(\\s*werkloosheid\\s*,\\s*criminaliteitscijfers\\s*\\)"
        if (grepl(basic_pattern, user_code)) {
          get_reporter()$add_message(
            "✅ Correct! Je hebt een spreidingsdiagram gemaakt van werkloosheid en criminaliteitscijfers.",
            type = "success"
          )
          return(TRUE)
        }
        
        # Check if plot function is used
        if (!grepl("plot\\s*\\(", user_code)) {
          get_reporter()$add_message(
            "❌ We kunnen geen aanroep van de plot() functie vinden in je code.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik plot() om een spreidingsdiagram te maken van werkloosheid en criminaliteitscijfers.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Check if both required variables are used
        has_werkloosheid <- grepl("werkloosheid", user_code)
        has_criminaliteit <- grepl("criminaliteitscijfers", user_code)
        
        if (!has_werkloosheid || !has_criminaliteit) {
          get_reporter()$add_message(
            "❌ Je gebruikt niet beide variabelen 'werkloosheid' en 'criminaliteitscijfers' in je code.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik plot(werkloosheid, criminaliteitscijfers) om een spreidingsdiagram te maken.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Check if the variables are in the correct order if named parameters are used
        if (grepl("y\\s*=\\s*werkloosheid", user_code) || grepl("x\\s*=\\s*criminaliteitscijfers", user_code)) {
          get_reporter()$add_message(
            "❌ Je hebt de variabelen omgewisseld. 'werkloosheid' moet op de x-as staan en 'criminaliteitscijfers' op de y-as.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik plot(werkloosheid, criminaliteitscijfers) of plot(x = werkloosheid, y = criminaliteitscijfers)",
            type = "info"
          )
          return(FALSE)
        }
        
        # More general pattern check for valid plot syntax
        if (grepl("plot\\s*\\(.*werkloosheid.*,.*criminaliteitscijfers.*\\)", user_code) || 
            grepl("plot\\s*\\(.*x\\s*=\\s*werkloosheid.*,.*y\\s*=\\s*criminaliteitscijfers.*\\)", user_code)) {
          get_reporter()$add_message(
            "✅ Je hebt een correct spreidingsdiagram gemaakt met de juiste variabelen!",
            type = "success"
          )
          return(TRUE)
        }
        
        # If we get here, the code didn't match our expected patterns
        get_reporter()$add_message(
          "❌ Gebruik plot() met 'werkloosheid' op de x-as en 'criminaliteitscijfers' op de y-as.",
          type = "error"
        )
        get_reporter()$add_message(
          "💡 Voorbeeld: plot(werkloosheid, criminaliteitscijfers)",
          type = "info"
        )
        return(FALSE)
      },
      TRUE,
      comparator = function(got, want, ...) {
        return(got == want)
      }
    )
  })
}, preExec = {
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})
