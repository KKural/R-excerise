context({
  testcase("Feedback bij vergelijken met nationaal gemiddelde", {
    testEqual(
      "boven_gemiddelde is correct aangemaakt",
      function(env) {
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
            "💡 Hint: Schrijf de code als volgt: boven_gemiddelde <- district_misdaadcijfers > nationaal_gemiddelde",
            type = "info"
          )
          return(NULL)
        })
      },
      NULL,
      comparator = function(got, want) {
        # Verwachte resultaat
        verwacht <- c(5.58, 6.42, 7.05, 7.18, 6.39) > 6.2
        
        # Controleer of de variabele bestaat
        if (is.null(got)) {
          get_reporter()$add_message(
            "❌ Correct resultaat:",
            type = "error"
          )
          get_reporter()$add_message(
            "We verwachten dat je 'boven_gemiddelde <- district_misdaadcijfers > nationaal_gemiddelde' gebruikt.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Controleer of het een logische vector is
        if (!is.logical(got)) {
          get_reporter()$add_message(
            "❌ Correct resultaat:",
            type = "error"
          )
          get_reporter()$add_message(
            "We verwachten dat je 'district_misdaadcijfers > nationaal_gemiddelde' gebruikt, wat een logische vector oplevert.",
            type = "info"
          )
          get_reporter()$add_message(
            "💡 Hint: Gebruik de '>' operator om te vergelijken of de misdaadcijfers hoger zijn dan het gemiddelde.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Check voor omgekeerde vergelijking (< in plaats van >)
        if (identical(got, c(5.58, 6.42, 7.05, 7.18, 6.39) < 6.2)) {
          get_reporter()$add_message(
            "❌ Correct resultaat:",
            type = "error"
          )
          get_reporter()$add_message(
            "Je hebt de vergelijking omgekeerd. Je controleert nu welke districten ONDER het gemiddelde liggen.",
            type = "info"
          )
          get_reporter()$add_message(
            "💡 Hint: Gebruik '>' in plaats van '<' om te controleren welke districten BOVEN het gemiddelde liggen.",
            type = "info"
          )
          return(FALSE)
        }
        
        # Check voor inclusieve vergelijking (>= in plaats van >)
        if (identical(got, c(5.58, 6.42, 7.05, 7.18, 6.39) >= 6.2)) {
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
        if (identical(got, 6.2 < c(5.58, 6.42, 7.05, 7.18, 6.39))) {
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
        
        # Final check voor correct antwoord
        if (identical(got, verwacht)) {
          get_reporter()$add_message(
            "✅ Correct! De logische vector is correct aangemaakt en opgeslagen in 'boven_gemiddelde'.",
            type = "success"
          )
          return(TRUE)
        } else {
          # Algemene fout - onbekende oorzaak
          get_reporter()$add_message(
            "❌ Correct resultaat:",
            type = "error"
          )
          get_reporter()$add_message(
            "We verwachten dat je 'boven_gemiddelde <- district_misdaadcijfers > nationaal_gemiddelde' gebruikt.",
            type = "info"
          )
          get_reporter()$add_message(
            "💡 Hint: Controleer of je de juiste variabelen hebt gebruikt en de vergelijking correct hebt geschreven.",
            type = "info"
          )
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
