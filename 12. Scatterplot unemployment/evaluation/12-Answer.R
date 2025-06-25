context({
  testcase("Feedback bij spreidingsdiagram werkloosheid en criminaliteit", {
    testEqual(
      "plot() is correct aangeroepen",
      function(env) {
        # First check if submission is empty
        if (length(env$`.__code__`) == 0) {
          get_reporter()$add_message(
            "❌ Je hebt geen code ingediend. Schrijf code om een spreidingsdiagram te maken.",
            type = "error"
          )
          return(NULL)
        }
        
        # Get the code and check if it contains plot()
        tryCatch({
          code <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
          if (!grepl("plot\\s*\\(", code)) {
            get_reporter()$add_message(
              "❌ We kunnen geen aanroep van de plot() functie vinden in je code.",
              type = "error"
            )
            get_reporter()$add_message(
              "💡 Gebruik plot() om een spreidingsdiagram te maken van werkloosheid en criminaliteitscijfers.",
              type = "info"
            )
            return(NULL)
          }
          
          # Try to execute the code to see if it actually runs without errors
          result <- tryCatch({
            eval(parse(text = code), envir = env)
            TRUE
          }, error = function(e) {
            get_reporter()$add_message(
              paste0("❌ Je code bevat een fout: ", e$message),
              type = "error"
            )
            return(FALSE)
          })
          
          if (result == FALSE) {
            return(NULL)
          }
          
          code
        }, error = function(e) { 
          get_reporter()$add_message(
            "❌ Er is een fout opgetreden bij het analyseren van je code.",
            type = "error"
          )
          return(NULL) 
        })
      },
      NULL,
      comparator = function(got, want) {
        if (is.null(got)) {
          get_reporter()$add_message(
            "❌ We kunnen je code niet analyseren. Controleer op fouten.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Simplified approach - just check if both variables appear in the code
        plot_exists = grepl("plot\\s*\\(", got, perl = TRUE)
        has_werkloosheid = grepl("werkloosheid", got)
        has_criminaliteitscijfers = grepl("criminaliteitscijfers", got)
        
        # Check for basic correctness - both variables must be present
        if (!has_werkloosheid || !has_criminaliteitscijfers) {
          get_reporter()$add_message(
            "❌ Je gebruikt niet beide variabelen 'werkloosheid' en 'criminaliteitscijfers' in je plot.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Je moet beide variabelen gebruiken om een spreidingsdiagram te maken.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Detect simple direct assignment or hardcoding
        if (grepl("plot\\s*\\(\\s*c\\s*\\(", got)) {
          # Check if it looks like the student hardcoded values
          get_reporter()$add_message(
            "❌ Het ziet ernaar uit dat je direct waarden in de plot functie zet in plaats van de variabelen te gebruiken.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik de variabelen 'werkloosheid' en 'criminaliteitscijfers' als argumenten voor plot().",
            type = "info"
          )
          return(FALSE)
        }
        
        # If code has plot and both variables, consider it correct
        if (plot_exists && has_werkloosheid && has_criminaliteitscijfers) {
          # Check for labels (optional)
          has_labels = grepl("xlab|ylab|main", got)
          
          if (has_labels) {
            get_reporter()$add_message(
              "✅ Uitstekend! Je hebt plot() correct gebruikt met duidelijke labels.",
              type = "success"
            )
          } else {
            get_reporter()$add_message(
              "✅ Correct! Je hebt plot() correct gebruikt om de spreidingsdiagram te maken.",
              type = "success"
            )
            get_reporter()$add_message(
              "💡 Tip: Je kunt je plot verbeteren door labels toe te voegen met xlab, ylab en main parameters.",
              type = "info"
            )
          }
          return(TRUE)
        }
        
        # The more specific checks below should actually never be reached with the new approach
        # but keeping them as a fallback
        
        # Toestaan: plot(werkloosheid, criminaliteitscijfers)
        if (grepl("plot\\s*\\(\\s*werkloosheid\\s*,\\s*criminaliteitscijfers", got)) {
          if (has_labels) {
            get_reporter()$add_message(
              "✅ Uitstekend! Je hebt plot() correct gebruikt met duidelijke labels.",
              type = "success"
            )
          } else {
            get_reporter()$add_message(
              "✅ Correct! Je hebt plot() correct gebruikt om de spreidingsdiagram te maken.",
              type = "success"
            )
            get_reporter()$add_message(
              "💡 Tip: Je kunt je plot verbeteren door labels toe te voegen met xlab, ylab en main parameters.",
              type = "info"
            )
          }
          return(TRUE)
        }
        
        # Toestaan: plot(x = werkloosheid, y = criminaliteitscijfers)
        if (grepl("plot\\s*\\(\\s*x\\s*=\\s*werkloosheid\\s*,\\s*y\\s*=\\s*criminaliteitscijfers", got)) {
          if (has_labels) {
            get_reporter()$add_message(
              "✅ Uitstekend! Je hebt plot() correct gebruikt met duidelijke labels.",
              type = "success"
            )
          } else {
            get_reporter()$add_message(
              "✅ Correct! Je hebt plot() correct gebruikt om de spreidingsdiagram te maken.",
              type = "success"
            )
            get_reporter()$add_message(
              "💡 Tip: Je kunt je plot verbeteren door labels toe te voegen met xlab, ylab en main parameters.",
              type = "info"
            )
          }
          return(TRUE)
        }
        
        # Additional check for plot with variables in other formats (more flexible)
        if (grepl("plot\\s*\\(.*werkloosheid.*,.*criminaliteitscijfers.*\\)", got) || 
            grepl("plot\\s*\\(.*criminaliteitscijfers.*,.*werkloosheid.*\\)", got)) {
          # Extract parameter names to check if they're using named parameters correctly
          if (grepl("y\\s*=\\s*werkloosheid", got) || grepl("x\\s*=\\s*criminaliteitscijfers", got)) {
            # This is likely incorrect - x and y are swapped
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
          
          get_reporter()$add_message(
            "✅ Je hebt plot() gebruikt met de juiste variabelen, goed gedaan!",
            type = "success"
          )
          return(TRUE)
        }
        
        get_reporter()$add_message(
          "❌ Gebruik plot() met 'werkloosheid' op de x-as en 'criminaliteitscijfers' op de y-as.",
          type = "error"
        )
        get_reporter()$add_message(
          "💡 Voorbeeld: plot(werkloosheid, criminaliteitscijfers)",
          type = "info"
        )
        FALSE
      }
    )
  })
}, preExec = {
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})
