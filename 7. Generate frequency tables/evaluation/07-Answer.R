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
        
        # Super simplified success message
        get_reporter()$add_message("✅ Juist! `delict_tabel` is correct aangemaakt.", type="success")
        
        # Single message with all content
        get_reporter()$add_message("Frequentietabel van delictsoorten:", type="info")
        
        # Show table output directly
        table_str <- paste(capture.output(print(env$delict_tabel)), collapse="\n")
        get_reporter()$add_message(table_str, type="code")

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
