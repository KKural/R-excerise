#–– Data setup ––
delictsoorten <- c(
  "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal",
  "Aanval",   "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval",
  "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval",
  "Diefstal", "Drugsdelict", "Inbraak"
)

#–– Evaluation ––
context(
  "Feedback bij frequentietabel",
  {
    test_case("Feedback bij frequentietabel", {
      test_equal(
        "De frequentietabel van delictsoorten is correct aangemaakt",
        
        # student‐result function: we just check that delict_tabel exists and is a table
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
          get_reporter()$add_message("```r\n> delict_tabel\n```", type = "markdown")
          get_reporter()$add_message(
            paste(capture.output(print(env$delict_tabel)), collapse = "\n"),
            type = "markdown"
          )
          # 4) successbericht
          get_reporter()$add_message(
            "✅ Correct! De frequentietabel is correct aangemaakt en opgeslagen in `delict_tabel`.",
            type = "success"
          )
          TRUE
        },
        
        # want‐waarde is simply TRUE: we don’t compare the table itself here
        TRUE,
        
        # fallback comparator
        comparator = function(got, want, ...) {
          identical(got, want)
        }
      )
    })
  }
)
