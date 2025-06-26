# bloom_level: Apply & Understand
# scaffolding_level: Medium support
# primm_phase: Predict

#–– Evaluation ––
context({
  testcase("Frequentietabel genereren", {
    # Controleer het resultaat - we zullen functiegerbuik binnen de test controleren
    testEqual(
      "Creëer een frequentietabel met table()",
      function(env) {
        # Bereken de verwachte tabel
        expected <- table(delictsoorten)
        
        # Altijd de verwachte commando en output tonen
        get_reporter()$add_message('Verwachte resultaat:', type='markdown')
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
          
          # Geef hulp over variabele toewijzing
          get_reporter()$add_message(
            "Herinnering over variabele toewijzing in R:",
            type = "markdown"
          )
          get_reporter()$add_message(
            "```r\n# Gebruik de <- operator om een waarde aan een variabele toe te wijzen\ndelict_tabel <- table(delictsoorten)\n```",
            type = "markdown"
          )
          
          return(FALSE)
        }
        
        # Controleer of table() functie is gebruikt
        code_text <- toString(deparse(test_env$parsed_code))
        if (!grepl("table\\s*\\(", code_text)) {
          get_reporter()$add_message(
            '❌ Je moet de `table()` functie gebruiken om een frequentietabel te maken.',
            type='error'
          )
          
          # Toon een voorbeeld van hoe het moet
          get_reporter()$add_message(
            "Voorbeeld van correct gebruik van table():",
            type = "markdown"
          )
          get_reporter()$add_message(
            "```r\ndelict_tabel <- table(delictsoorten)\n```",
            type = "markdown"
          )
          
          # Toon ook de verwachte output
          get_reporter()$add_message(
            "Dit zou je moeten krijgen:",
            type = "markdown"
          )
          get_reporter()$add_message(
            paste0('```r\n', paste(capture.output(print(expected)), collapse='\n'), '\n```'),
            type = "markdown"
          )
          
          return(FALSE)
        }
        
        # Controleer of het een table object is
        if (!is.table(env$delict_tabel)) {
          get_reporter()$add_message(
            '❌ `delict_tabel` is niet van het type `table`. Gebruik: `delict_tabel <- table(delictsoorten)`',
            type='error'
          )
          
          # Toon wat er wel in de variabele zit
          student_value_type <- class(env$delict_tabel)
          get_reporter()$add_message(
            paste0("Je hebt een object van het type `", paste(student_value_type, collapse = ", "), "` gemaakt, maar we verwachten een `table` object."),
            type = "markdown"
          )
          
          return(FALSE)
        }
        
        # Controleer of de inhoud correct is
        if (!identical(env$delict_tabel, expected)) {
          get_reporter()$add_message(
            '❌ De inhoud van `delict_tabel` is niet correct. Controleer je code en zorg dat je `delict_tabel <- table(delictsoorten)` gebruikt.',
            type='error'
          )
          
          # Toon beide tabellen voor vergelijking
          student_table <- capture.output(print(env$delict_tabel))
          expected_table <- capture.output(print(expected))
          
          get_reporter()$add_message(
            "Jouw tabel:",
            type = "markdown"
          )
          get_reporter()$add_message(
            paste0('```r\n', paste(student_table, collapse='\n'), '\n```'),
            type = "markdown"
          )
          
          get_reporter()$add_message(
            "Verwachte tabel:",
            type = "markdown"
          )
          get_reporter()$add_message(
            paste0('```r\n', paste(expected_table, collapse='\n'), '\n```'),
            type = "markdown"
          )
          
          return(FALSE)
        }
        
        # Correct antwoord met alle informatie in één blok
        get_reporter()$add_message(
          '✅ Juist! `delict_tabel` is correct aangemaakt.',
          type='success'
        )
        
        # Toon output en uitleg samen zoals in exercise 1
        # Converteer tabel output naar een string en toon het als code
        tabel_output <- capture.output(print(env$delict_tabel))
        get_reporter()$add_message("Jouw frequentietabel:", type = "markdown")
        get_reporter()$add_message(paste(tabel_output, collapse = "\n"), type = "code")
        
        # Educatieve uitleg in één bericht
        get_reporter()$add_message(paste(
          "Frequentietabellen zijn zeer nuttig om:",
          "- Snel een overzicht te krijgen van de verdeling van categorische variabelen",
          "- Het aantal voorkomens van elke waarde te tellen",
          "- Patronen in je data te ontdekken",
          "",
          "Je kunt de `table()` functie ook gebruiken voor kruistabellen met meerdere variabelen: `table(var1, var2)`",
          "",
          "Visualisatie tips:",
          "",
          "Je kunt een staafdiagram maken van je frequentietabel met:",
          "```r",
          "barplot(delict_tabel, ",
          "        main=\"Frequentie van delictsoorten\", ",
          "        xlab=\"Type delict\", ",
          "        ylab=\"Aantal\",",
          "        col=rainbow(length(delict_tabel)))",
          "```",
          "",
          "Of een taartdiagram:",
          "```r",
          "pie(delict_tabel, ",
          "    main=\"Verdeling van delictsoorten\",",
          "    col=rainbow(length(delict_tabel)))",
          "```",
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
