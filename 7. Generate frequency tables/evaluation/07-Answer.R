# bloom_level: Apply & Understand
# scaffolding_level: Medium support
# primm_phase: Predict

#–– Data setup ––
delictsoorten <- c(
  "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal",
  "Aanval",   "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval",
  "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval",
  "Diefstal", "Drugsdelict", "Inbraak"
)

#–– Evaluation ––
context({
  testcase("Frequentietabel genereren", {
    testEqual(
      "Creëer een frequentietabel met table()",
      function(env) {
        # 1. Always emit the command
        get_reporter()$add_message('```r\n> table(delictsoorten)\n```', type='markdown')
      # 2. Compute expected output
      expected <- table(get("delictsoorten", envir = env()))
      get_reporter()$add_message(
        paste0('```r\n', paste(capture.output(print(expected)), collapse='\n'), '\n```'),
        type='markdown'
      )
      # 3. Existence check
      if (!exists('delict_tabel', envir=env())) {
        get_reporter()$add_message(
          '❌ De variabele `delict_tabel` bestaat niet. Maak deze aan met: `delict_tabel <- table(delictsoorten)`',
          type='error'
        )
        return(FALSE)
      }
      
      # Controleer of table() direct is gebruikt in de toewijzing
      # En of de functie table() gebruikt is
      code_text <- toString(deparse(test_env$parsed_code))
      if (!grepl("delict_tabel\\s*<-\\s*table\\s*\\(\\s*delictsoorten\\s*\\)", code_text)) {
        # Controleer eerst of table functie überhaupt is gebruikt
        if (!grepl("table\\s*\\(", code_text)) {
          get_reporter()$add_message(
            '❌ Je moet de `table()` functie gebruiken om een frequentietabel te maken.',
            type='error'
          )
          return(FALSE)
        }
        
        get_reporter()$add_message(
          '❌ Gebruik direct `delict_tabel <- table(delictsoorten)` om de frequentietabel aan te maken.',
          type='error'
        )
        return(FALSE)
      }
      # 4. Type check
      if (!is.table(get('delict_tabel', envir=env()))) {
        get_reporter()$add_message(
          '❌ `delict_tabel` is niet van het type `table`. Gebruik: `delict_tabel <- table(delictsoorten)`',
          type='error'
        )
        return(FALSE)
      }
      # 5. Value check
      if (!identical(get('delict_tabel', envir=env()), expected)) {
        get_reporter()$add_message(
          '❌ De inhoud van `delict_tabel` is niet correct. Controleer je code en zorg dat je `delict_tabel <- table(delictsoorten)` gebruikt.',
          type='error'
        )
        return(FALSE)
      }
      # 6. Success: show the expected output as justification
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
    }, expected = TRUE)
  })
}, preExec = {
  # Pre‐execution: make the vector available to both student code & tests
  delictsoorten <- c(
    "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal",
    "Aanval",   "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval",
    "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval",
    "Diefstal", "Drugsdelict", "Inbraak"
  )
})
