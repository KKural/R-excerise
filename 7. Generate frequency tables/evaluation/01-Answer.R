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
      # 1. Show exactly what students should have run:
      get_reporter()$add_message(
        "```r\n> delict_tabel <- table(delictsoorten)\n> delict_tabel\n```",
        type = "markdown"
      )

      # 2. Compute the correct table once
      expected <- table(get("delictsoorten", envir = env()))

      # 3. Existence check
      if (!exists("delict_tabel", envir = env())) {
        get_reporter()$add_message(
          "❌ De variabele `delict_tabel` bestaat niet. Maak deze aan met:\n```r\ndelict_tabel <- table(delictsoorten)\n```",
          type = "error"
        )
        return(FALSE)
      }

      # 4. Type check
      student_tbl <- get("delict_tabel", envir = env())
      if (!is.table(student_tbl)) {
        get_reporter()$add_message(
          "❌ `delict_tabel` is niet van het type `table`. Gebruik:\n```r\ndelict_tabel <- table(delictsoorten)\n```",
          type = "error"
        )
        return(FALSE)
      }

      # 5. Value check
      if (!identical(student_tbl, expected)) {
        get_reporter()$add_message(
          "❌ De inhoud van `delict_tabel` is niet correct. Controleer je code.",
          type = "error"
        )
        return(FALSE)
      }

      # 6. Success: repeat the assignment+print block, then show ✅
      get_reporter()$add_message(
        paste0(
          "```r\n> delict_tabel <- table(delictsoorten)\n> delict_tabel\n```",
          "\n✅ De frequentietabel van delictsoorten is correct aangemaakt."
        ),
        type = "success"
      )
      TRUE
    }, expected = TRUE)
  })
}, preExec = {
  delictsoorten <- c(
    "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal",
    "Aanval",   "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval",
    "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval",
    "Diefstal", "Drugsdelict", "Inbraak"
  )
})
