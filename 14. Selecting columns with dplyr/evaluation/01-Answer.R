context({
  testcase("Feedback bij kolommen selecteren", {
    testEqual(
      "Geselecteerde kolommen zijn correct",
      function(env) {
        exists("geselecteerde_data", envir = env) &&
        is.data.frame(env$geselecteerde_data) &&
        all(colnames(env$geselecteerde_data) %in% c("id", "delicttype"))
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'geselecteerde_data' moet bestaan en alleen de kolommen 'id' en 'delicttype' bevatten.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ De juiste kolommen zijn geselecteerd in 'geselecteerde_data'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
}, preExec = {
  # Set up the misdaad_data data frame
  misdaad_data <- data.frame(
    id = 1:10,
    delicttype = c("Diefstal", "Aanval", "Diefstal", "Inbraak", "Diefstal", "Vandalisme", "Diefstal", "Fraude", "Diefstal", "Aanval"),
    waarde = c(100, 200, 150, 300, 120, 80, 90, 60, 110, 50)
  )
})

# Model solution:
geselecteerde_data <- dplyr::select(misdaad_data, id, delicttype)
