# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      function(env) { NULL },
      NULL,
      comparator = function(got, want, ...) {
        TRUE
      }
    )
  })
}, preExec = {
  # Set up the delictsoorten vector
  delictsoorten <- c("Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal", 
                   "Aanval", "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval", 
                   "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval", 
                   "Diefstal", "Drugsdelict", "Inbraak")
})

# Verwachte antwoorden:
# delict_tabel <- table(delictsoorten)

# Model solution:
delict_tabel <- table(delictsoorten)

context({
  testcase("Feedback bij frequentietabel", {
    testEqual(
      "delict_tabel is correct aangemaakt",
      function(env) {
        exists("delict_tabel", envir = env) && is.table(env$delict_tabel)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'delict_tabel' moet bestaan en een frequentietabel zijn gemaakt van delictsoorten.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ De frequentietabel is correct aangemaakt en opgeslagen in 'delict_tabel'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})