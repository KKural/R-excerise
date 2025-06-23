context({
  testcase("Feedback bij filteren op diefstal", {
    testEqual(
      "Alleen rijen met delicttype 'Diefstal' zijn geselecteerd",
      function(env) {
        exists("gefilterde_data", envir = env) &&
        is.data.frame(env$gefilterde_data) &&
        all(env$gefilterde_data$delicttype == "Diefstal")
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'gefilterde_data' moet bestaan en alleen rijen met delicttype 'Diefstal' bevatten.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ De data is correct gefilterd op delicttype 'Diefstal' en opgeslagen in 'gefilterde_data'.",
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
gefilterde_data <- dplyr::filter(misdaad_data, delicttype == "Diefstal")
