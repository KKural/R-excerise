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
    testEqual(
      "De student maakt een frequentietabel van delictsoorten aan als delict_tabel.",
      function(env) {
        # 1) Always emit the command:
        get_reporter()$add_message("```r\n> table(delictsoorten)\n```", type="markdown")

        # 2) Compute and emit expected output:
        expected <- table(delictsoorten)
        get_reporter()$add_message(
          paste0("```r\n", paste(capture.output(print(expected)), collapse="\n"), "\n```"),
          type="markdown"
        )

        # 3) Existence check: if `delict_tabel` doesn’t exist, error + return FALSE
        if (!exists("delict_tabel")) {
          get_reporter()$add_message(
            "❌ De variabele `delict_tabel` bestaat niet. Maak deze aan met:\n```r\ndelict_tabel <- table(delictsoorten)\n```",
            type="error"
          )
          return(FALSE)
        }

        # 4) Type check: if it exists but isn’t a table, error + return FALSE
        student_tbl <- get("delict_tabel")
        if (!is.table(student_tbl)) {
          get_reporter()$add_message(
            "❌ `delict_tabel` is geen frequentietabel. Gebruik:\n```r\ndelict_tabel <- table(delictsoorten)\n```",
            type="error"
          )
          return(FALSE)
        }

        # 5) Value check: if not identical to expected, error + return FALSE
        if (!identical(student_tbl, expected)) {
          get_reporter()$add_message(
            "❌ De frequentietabel klopt niet. Controleer je code.",
            type="error"
          )
          return(FALSE)
        }

        # 6) Success: emit ✅ and return TRUE
        get_reporter()$add_message(
          "✅ De frequentietabel van delictsoorten is correct aangemaakt.",
          type="success"
        )
        return(TRUE)
      },
      TRUE
    )
  })
})