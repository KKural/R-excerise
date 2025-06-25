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
      "",
      
      # student‐result: we detect and print delict_tabel
      function(env) {
        # 1) bestaat?
        if (!exists("delict_tabel", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele `delict_tabel` bestaat niet. Maak deze aan met:\n```r\ndelict_tabel <- table(delictsoorten)\n```",
            type = "error"
          )
          return(FALSE)
        }
        # 2) is het een table?
        if (!is.table(env$delict_tabel)) {
          get_reporter()$add_message(
            "❌ `delict_tabel` is geen frequentietabel. Gebruik:\n```r\ndelict_tabel <- table(delictsoorten)\n```",
            type = "error"
          )
          return(FALSE)
        }
        # 3) toon prompt + resultaat
        get_reporter()$add_message("```r\n> table(delictsoorten)\n```", type = "markdown")
        get_reporter()$add_message(
          paste0(
            "```",
            "\n",
            paste(capture.output(print(env$delict_tabel)), collapse = "\n"),
            "\n```") ,
          type = "markdown"
        )
        # 4) successbericht
        get_reporter()$add_message(
          "✅ De frequentietabel van delictsoorten is correct aangemaakt.",
          type = "markdown"
        )
        TRUE
      },
      
      # want is simply TRUE (we check everything in the function)
      TRUE,
      
      # fallback comparator (won't actually run)
      comparator = function(got, want, ...) {
        identical(got, want)
      }
    )
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
