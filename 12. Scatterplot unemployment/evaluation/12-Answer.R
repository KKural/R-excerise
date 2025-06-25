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
        
        # Extract the user's code as string
        user_code <- tryCatch({
          paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Er is een fout opgetreden bij het analyseren van je code.",
            type = "error"
          )
          return(NULL)
        })
        
        if (is.null(user_code)) return(FALSE)
        
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
        
        # Check for hardcoding of values
        if (grepl("plot\\s*\\(\\s*c\\s*\\(", user_code)) {
          get_reporter()$add_message(
            "❌ Het ziet ernaar uit dat je waarden handmatig invoert in plaats van de variabelen te gebruiken.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik de variabelen 'werkloosheid' en 'criminaliteitscijfers' als argumenten voor plot().",
            type = "info"
          )
          return(FALSE)
        }
        
        # Check for correct order of variables with named parameters
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
        
        # Try to actually run the code
        plot_success <- tryCatch({
          # Execute the student's code
          eval(parse(text = user_code), envir = env)
          TRUE
        }, error = function(e) {
          get_reporter()$add_message(
            paste0("❌ Je code bevat een fout: ", e$message),
            type = "error"
          )
          FALSE
        })
        
        if (!plot_success) return(FALSE)
        
        # Code passes all checks and executes correctly
        has_labels <- grepl("xlab|ylab|main", user_code)
        
        if (has_labels) {
          get_reporter()$add_message(
            "✅ Uitstekend! Je hebt een correct spreidingsdiagram gemaakt met labels.",
            type = "success"
          )
        } else {
          get_reporter()$add_message(
            "✅ Correct! Je hebt een spreidingsdiagram gemaakt van werkloosheid en criminaliteitscijfers.",
            type = "success"
          )
          get_reporter()$add_message(
            "💡 Tip: Je kunt je plot verbeteren door labels toe te voegen met xlab, ylab en main parameters.",
            type = "info"
          )
        }
        
        return(TRUE)
      },
      TRUE
    )
  })
}, preExec = {
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})

