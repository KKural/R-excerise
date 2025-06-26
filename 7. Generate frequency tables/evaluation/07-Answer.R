# bloom_level: Apply & Understand
# scaffolding_level: Medium support
# primm_phase: Predict

#–– Evaluation ––
context({
  testcase("Frequentietabel genereren", {
    # Controleer of de student table() heeft gebruikt
    testFunctionUsed("table")
    
    # Controleer het resultaat
    testEqual(
      "Creëer een frequentietabel met table()",
      function(env) {
        # Toon de table() uitvoer
        expected <- table(delictsoorten)
        get_reporter()$add_message('```r\n> table(delictsoorten)\n```', type='markdown')
        get_reporter()$add_message(
          paste0('```r\n', paste(capture.output(print(expected)), collapse='\n'), '\n```'),
          type='markdown'
        )
        
        # Controleer of de variabele bestaat
        if (!exists('delict_tabel', envir=env)) {
          get_reporter()$add_message(
            '❌ De variabele `delict_tabel` bestaat niet. Maak deze aan met: `delict_tabel <- table(delictsoorten)`',
            type='error'
          )
          return(FALSE)
        }
        
        # Controleer of het een table object is
        if (!is.table(env$delict_tabel)) {
          get_reporter()$add_message(
            '❌ `delict_tabel` is niet van het type `table`. Gebruik: `delict_tabel <- table(delictsoorten)`',
            type='error'
          )
          return(FALSE)
        }
        
        # Controleer of de inhoud correct is
        if (!identical(env$delict_tabel, expected)) {
          get_reporter()$add_message(
            '❌ De inhoud van `delict_tabel` is niet correct. Controleer je code en zorg dat je `delict_tabel <- table(delictsoorten)` gebruikt.',
            type='error'
          )
          return(FALSE)
        }
        
        # Correct antwoord
        get_reporter()$add_message(
          '✅ Juist! `delict_tabel` is correct aangemaakt.',
          type='success'
        )
        
        # Voeg educatieve uitleg toe over frequentietabellen
        get_reporter()$add_message(
          "## Uitleg over frequentietabellen:",
          type = "markdown"
        )
        
        get_reporter()$add_message(paste(
          "Frequentietabellen zijn zeer nuttig om:",
          "- Snel een overzicht te krijgen van de verdeling van categorische variabelen",
          "- Het aantal voorkomens van elke waarde te tellen",
          "- Patronen in je data te ontdekken",
          "",
          "Je kunt de `table()` functie ook gebruiken voor kruistabellen met meerdere variabelen: `table(var1, var2)`",
          sep = "\n"
        ), type = "markdown")
        
        return(TRUE)
      },
      TRUE
    )
  })
}, preExec = {
  # Pre-execution: make the vector available to both student code & tests
  delictsoorten <- c(
    "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal",
    "Aanval",   "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval",
    "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval",
    "Diefstal", "Drugsdelict", "Inbraak"
  )
  
  # Also make it available globally
  assign("delictsoorten", delictsoorten, envir = globalenv())
})
