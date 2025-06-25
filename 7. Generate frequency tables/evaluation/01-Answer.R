# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Feedback bij frequentietabel", {
    testEqual(
      "",
      function(env) {
        if (!exists("delict_tabel", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'delict_tabel' bestaat niet. Zorg dat je deze aanmaakt met: delict_tabel <- table(delictsoorten)",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.table(env$delict_tabel)) {
          get_reporter()$add_message(
            "❌ 'delict_tabel' moet een frequentietabel zijn. Gebruik: delict_tabel <- table(delictsoorten)",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Correct! De frequentietabel is correct aangemaakt en opgeslagen in 'delict_tabel'.",
          type = "success"
        )
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )
  })
}, preExec = {
  # Set up the delictsoorten vector
  delictsoorten <- c("Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal", 
                   "Aanval", "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval", 
                   "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval", 
                   "Diefstal", "Drugsdelict", "Inbraak")
})