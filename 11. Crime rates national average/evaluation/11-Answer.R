context({
  testcase("", {
    testEqual(
      "",
      function(env) {
        # Eerst controleren of er überhaupt code is ingeleverd
        if (length(env$`.__code__`) == 0) {
          get_reporter()$add_message(
            "❌ Je hebt geen code ingediend. Schrijf code om de opdracht te voltooien.",
            type = "error"
          )
          return(NULL)
        }
        
        # Controleer of de variabele boven_gemiddelde in de code voorkomt
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("boven_gemiddelde", code_str, fixed = TRUE)) {
          get_reporter()$add_message(
            "❌ Je moet een variabele aanmaken met de naam 'boven_gemiddelde'.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Gebruik de juiste naam voor je variabele zoals aangegeven in de opdracht.",
            type = "info"
          )
          return(NULL)
        }
        
        # Safe wrapper to catch any student-side syntax error
        tryCatch({
          env$boven_gemiddelde
        }, error = function(e) {
          # Geef duidelijke foutmelding en hint
          get_reporter()$add_message(
            "❌ We kunnen de variabele 'boven_gemiddelde' niet vinden. Heb je deze wel aangemaakt?",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 We verwachten dat je de '>' operator gebruikt in je code.",
            type = "info"
          )
          return(NULL)
        })
      },
      NULL,
      comparator = function(got, want) {
        # Verwachte resultaat - we maken een kopie in de test om te voorkomen dat student-code dit overschrijft
        test_district_misdaadcijfers <- c(5.58, 6.42, 7.05, 7.18, 6.39)
        test_nationaal_gemiddelde <- 6.2
        verwacht <- test_district_misdaadcijfers > test_nationaal_gemiddelde
        
        # Controleer of de variabele bestaat
        if (is.null(got)) {
          get_reporter()$add_message(
            "❌ Correct resultaat:",
            type = "error"
          )
          get_reporter()$add_message(
            "We verwachten dat je een variabele aanmaakt met de juiste naam.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Controleer of de lengte juist is
        if (length(got) != length(verwacht)) {
          get_reporter()$add_message(
            "❌ De lengte van jouw vector is niet correct.",
            type = "error"
          )
          get_reporter()$add_message(
            "💡 Je moet alle districten vergelijken met het nationaal gemiddelde.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Controleer eerst het type - het moet een logische vector zijn
        if (!is.logical(got)) {
          # Check of student code probeert te vergelijken maar iets anders teruggeeft
          code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
          
          # Als ze wél vergelijkingsoperatoren gebruiken maar geen logische vector krijgen
          if (grepl("[<>=]", code_str)) {
            get_reporter()$add_message(
              "❌ Je gebruikt wel een vergelijkingsoperator, maar slaat het resultaat niet op als een logische vector.",
              type = "error"
            )
          } else {
            get_reporter()$add_message(
              "❌ Correct resultaat:",
              type = "error"
            )
            get_reporter()$add_message(
              "We verwachten dat je de '>' operator gebruikt in je code.",
              type = "info"
            )
          }
          get_reporter()$add_message(
            "💡 Gebruik een vergelijkingsoperator om een logische vector te maken.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Controleer of student de juiste operator heeft gebruikt (code analyse)
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl(">", code_str) && grepl("<", code_str) && grepl("boven_gemiddelde", code_str) && 
            grepl("district_misdaadcijfers", code_str) && grepl("nationaal_gemiddelde", code_str)) {
            get_reporter()$add_message(
              "❌ Je gebruikt de verkeerde vergelijkingsoperator in je code.",
              type = "error"
            )
            get_reporter()$add_message(
              "💡 Gebruik '>' om te vergelijken welke waarden boven het gemiddelde liggen.",
              type = "info"
            )
        }
        
        # Check voor omgekeerde vergelijking (< in plaats van >)
        if (identical(got, test_district_misdaadcijfers < test_nationaal_gemiddelde)) {
          get_reporter()$add_message(
            "❌ Correct resultaat:",
            type = "error"
          )
          get_reporter()$add_message(
            "Je hebt de vergelijking omgekeerd. Je controleert nu welke districten ONDER het gemiddelde liggen.",
            type = "info"
          )
          get_reporter()$add_message(
            "💡 Let op met de richting van je vergelijking - we willen weten welke districten boven het gemiddelde liggen.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Check voor inclusieve vergelijking (>= in plaats van >)
        if (identical(got, test_district_misdaadcijfers >= test_nationaal_gemiddelde)) {
          get_reporter()$add_message(
            "❌ Correct resultaat:",
            type = "error"
          )
          get_reporter()$add_message(
            "Je gebruikt '>=' in plaats van '>'. De opdracht vraagt alleen om districten STRIKT boven het gemiddelde.",
            type = "info"
          )
          get_reporter()$add_message(
            "💡 Hint: Gebruik alleen '>' om te controleren welke districten strikt boven het gemiddelde liggen.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Check voor verkeerde variabelenvolgorde
        if (identical(got, test_nationaal_gemiddelde < test_district_misdaadcijfers)) {
          get_reporter()$add_message(
            "❌ Correct resultaat:",
            type = "error"
          )
          get_reporter()$add_message(
            "Je hebt de volgorde van de variabelen omgewisseld. Het resultaat is correct, maar gebruik de standaard vorm.",
            type = "info"
          )
          get_reporter()$add_message(
            "💡 Hint: Schrijf 'district_misdaadcijfers > nationaal_gemiddelde' in plaats van 'nationaal_gemiddelde < district_misdaadcijfers'",
            type = "info"
          )
          return(FALSE)
        }
        
        # Controleer of het resultaat correct is qua inhoud, niet alleen structuur
        correct_values <- TRUE
        for (i in 1:length(verwacht)) {
          if (got[i] != verwacht[i]) {
            correct_values <- FALSE
            break
          }
        }
        
        # Final check voor correct antwoord
        if (identical(got, verwacht) || correct_values) {
          # Zorg ervoor dat de gebruikte code de juiste operatoren bevat
          code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
          
          # Extra validatie dat het niet een hard-coded oplossing is
          if (grepl("boven_gemiddelde\\s*<-\\s*c\\s*\\(\\s*FALSE\\s*,\\s*TRUE\\s*,\\s*TRUE\\s*,\\s*TRUE\\s*,\\s*TRUE\\s*\\)", code_str)) {
            get_reporter()$add_message(
              "❌ Je hebt de logische waarden direct ingevoerd in plaats van een vergelijking te maken.",
              type = "error"
            )
            get_reporter()$add_message(
              "💡 We verwachten dat je de vergelijkingsoperator '>' gebruikt om de misdaadcijfers te vergelijken met het gemiddelde.",
              type = "info"
            )
            return(FALSE)
          }
          
          get_reporter()$add_message(
            "✅ Correct! De logische vector is correct aangemaakt en opgeslagen in 'boven_gemiddelde'.",
            type = "success"
          )
          return(TRUE)
        } else {
          # Algemene fout - onbekende oorzaak
          get_reporter()$add_message(
            "❌ Je antwoord is niet correct.",
            type = "error"
          )
          
          # Probeer waar mogelijk een specifieke hint te geven
          code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
          if (!grepl("district_misdaadcijfers", code_str)) {
            get_reporter()$add_message(
              "💡 Gebruik de variabele 'district_misdaadcijfers' in je vergelijking.",
              type = "info"
            )
          } else if (!grepl("nationaal_gemiddelde", code_str)) {
            get_reporter()$add_message(
              "💡 Gebruik de variabele 'nationaal_gemiddelde' in je vergelijking.",
              type = "info"
            )
          } else {
            get_reporter()$add_message(
              "💡 Controleer je code zorgvuldig op fouten.",
              type = "info"
            )
          }
          
          return(FALSE)
        }
      }
    )
  })
}, preExec = {
  # Zet de data op
  district_misdaadcijfers <- c(5.58, 6.42, 7.05, 7.18, 6.39)
  nationaal_gemiddelde <- 6.2
})

# Verwachte antwoorden (studenten moeten dit schrijven):
# boven_gemiddelde <- district_misdaadcijfers > nationaal_gemiddelde
