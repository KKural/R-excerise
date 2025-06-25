#–– Data setup ––
delictsoorten <- c(
  "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal",
  "Aanval",   "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval",
  "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval",
  "Diefstal", "Drugsdelict", "Inbraak"
)

#–– Evaluation ––
#–– Evaluation ––
context({
  testcase("Feedback bij frequentietabel", {
    testEqual({
      # 1️⃣ Compute once up front
      expected <- table(delictsoorten)

      # 2️⃣ Existence check
      if (!exists("delict_tabel", envir = env())) {
        get_reporter()$add_message(
          "❌ De variabele `delict_tabel` bestaat niet. Maak deze aan met:\n```r\ndelict_tabel <- table(delictsoorten)\n```",
          type = "error"
        )
        return(FALSE)
      }

      # 3️⃣ Type check
      student_tbl <- get("delict_tabel", envir = env())
      if (!is.table(student_tbl)) {
        get_reporter()$add_message(
          "❌ `delict_tabel` is geen table. Gebruik:\n```r\ndelict_tabel <- table(delictsoorten)\n```",
          type = "error"
        )
        return(FALSE)
      }

      # 4️⃣ Value check
      if (!identical(student_tbl, expected)) {
        get_reporter()$add_message(
          "❌ De frequentietabel is niet correct. Controleer je code.",
          type = "error"
        )
        return(FALSE)
      }

      # ✅ Success path: show both the assignment + print, then the green check
      get_reporter()$add_message(
        "```r\n> delict_tabel <- table(delictsoorten)\n> delict_tabel\n```",
        type = "markdown"
      )
      get_reporter()$add_message(
        "✅ De frequentietabel van delictsoorten is correct aangemaakt.",
        type = "success"
      )

      return(TRUE)
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
