#–– Data setup ––
delictsoorten <- c(
  "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal",
  "Aanval",   "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval",
  "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval",
  "Diefstal", "Drugsdelict", "Inbraak"
)

#–– Evaluation ––
context({
  testcase("Feedback bij frequentietabel", {
    testEqual({
      # 1. Always emit the command
      get_reporter()$add_message('```r\n> table(delictsoorten)\n```', type='markdown')
      # 2. Compute and emit expected output
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
      # 6. Success
      get_reporter()$add_message(
        '✅ De frequentietabel van delictsoorten is correct aangemaakt!',
        type='success'
      )
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