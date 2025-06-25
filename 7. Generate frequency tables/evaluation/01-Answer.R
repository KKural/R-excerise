# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Feedback bij frequentietabel", {
    testEqual(
      "delict_tabel is correct aangemaakt",
      function(env) env$delict_tabel,
      table(delictsoorten),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message(
            "❌ De variabele 'delict_tabel' is niet gedefinieerd. Gebruik: delict_tabel <- table(delictsoorten)",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.table(got)) {
          get_reporter()$add_message(
            "❌ Je antwoord is geen frequentietabel. Gebruik: delict_tabel <- table(delictsoorten)",
            type = "error"
          )
          return(FALSE)
        }
        if (!identical(got, want)) {
          got_out <- paste(capture.output(print(got)), collapse = "\n")
          want_out <- paste(capture.output(print(want)), collapse = "\n")
          get_reporter()$add_message(
            paste0(
              "❌ Je frequentietabel is niet correct.\n",
              "Jouw tabel:\n", got_out, "\n",
              "Verwacht:\n", want_out
            ),
            type = "error"
          )
          return(FALSE)
        }
        want_out <- paste(capture.output(print(want)), collapse = "\n")
        get_reporter()$add_message(
          paste0("✅ Correct!\n\n> delict_tabel\n", want_out),
          type = "success"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  delictsoorten <- c("Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal", 
                   "Aanval", "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval", 
                   "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval", 
                   "Diefstal", "Drugsdelict", "Inbraak")
})