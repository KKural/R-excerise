context({
  testcase("Feedback bij vergelijken met nationaal gemiddelde", {
    testEqual(
      "boven_gemiddelde is correct aangemaakt",
      function(env) {
        # Safe wrapper to catch any student-side syntax error
        tryCatch({
          env$boven_gemiddelde
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Fout in je code: controleer of je vergelijking correct is en of je variabelen goed zijn aangemaakt.",
            type = "error"
          )
          return(NULL)
        })
      },
      NULL,
      comparator = function(got, want) {
        # Aanmaken van de check-resultaten lijst
        check_results <- list(
          gebruik_vergelijking = FALSE, 
          gebruik_juiste_operator = FALSE,
          juiste_volgorde = FALSE
        )
        
        # Controleer of de variabele correct bestaat
        if (is.null(got)) {
          get_reporter()$add_message("❌ De variabele 'boven_gemiddelde' bestaat niet.", type = "error")
          return(FALSE)
        }
        
        # Controleer of het een logische vector is
        if (!is.logical(got)) {
          get_reporter()$add_message(
            "❌ 'boven_gemiddelde' moet een logische vector zijn die vergelijkt met het nationaal gemiddelde.",
            type = "error"
          )
          
          # Geef hints over de vergelijkingsoperatoren
          get_reporter()$add_message("ℹ️ We verwachten dat je de '>' operator gebruikt om te vergelijken.", type = "info")
          get_reporter()$add_message("ℹ️ Bijvoorbeeld: vector1 > vector2 geeft een logische vector terug.", type = "info")
          
          return(FALSE)
        }
        
        # Vergelijking die we verwachten
        verwacht <- c(5.58, 6.42, 7.05, 7.18, 6.39) > 6.2
        
        # Check voor vergelijking en show feedback
        check_results$gebruik_vergelijking <- TRUE
        
        # Check voor juiste vergelijkingsoperator
        check_results$gebruik_juiste_operator <- identical(got, verwacht) || 
                                              identical(got, !c(5.58, 6.42, 7.05, 7.18, 6.39) <= 6.2)
        
        # Check voor juiste volgorde/gebruik variabelen
        check_results$juiste_volgorde <- identical(got, verwacht)
        
        # Final check and full feedback
        if (identical(got, verwacht)) {
          get_reporter()$add_message(
            "✅ Correct! De logische vector is correct aangemaakt en opgeslagen in 'boven_gemiddelde'.",
            type = "success"
          )
          
          return(TRUE)
        } else {
          # Toon de verwachte resultaten
          get_reporter()$add_message("ℹ️ Correct resultaat:", type = "info")
          
          # Vergelijking gebruiken
          if (check_results$gebruik_vergelijking) {
            get_reporter()$add_message("✅ Je gebruikt een vergelijkingsoperator.", type = "success")
          } else {
            get_reporter()$add_message("❌ We verwachten dat je een vergelijkingsoperator gebruikt.", type = "error")
          }
          
          # Juiste operator gebruiken
          if (check_results$gebruik_juiste_operator) {
            get_reporter()$add_message("✅ Je gebruikt de juiste vergelijkingsoperator '>'.", type = "success")
          } else {
            get_reporter()$add_message("❌ We verwachten dat je de '>' operator gebruikt om te vergelijken welke waarden boven het gemiddelde liggen.", type = "error")
          }
          
          # Juiste volgorde/variabelen gebruiken
          if (check_results$juiste_volgorde) {
            get_reporter()$add_message("✅ Je vergelijkt de correcte variabelen in de juiste volgorde.", type = "success")
          } else {
            get_reporter()$add_message("❌ Je moet 'district_misdaadcijfers > nationaal_gemiddelde' gebruiken en dit opslaan in 'boven_gemiddelde'.", type = "error")
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
