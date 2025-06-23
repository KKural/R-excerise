context({
  testcase("Feedback bij filteren op diefstal", {
    testEqual(
      "Alleen rijen met delicttype 'Diefstal' zijn geselecteerd",
      function(env) {
        if (!exists("gefilterde_data", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'gefilterde_data' bestaat niet.",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.data.frame(env$gefilterde_data)) {
          get_reporter()$add_message(
            "❌ 'gefilterde_data' moet een data frame zijn.",
            type = "error"
          )
          return(FALSE)
        }
        if (!all(env$gefilterde_data$delicttype == "Diefstal")) {
          get_reporter()$add_message(
            "❌ 'gefilterde_data' mag alleen rijen met delicttype 'Diefstal' bevatten.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "Correct! De data is correct gefilterd op delicttype 'Diefstal' en opgeslagen in 'gefilterde_data'.",
          type = "success"
        )
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )
  })
}, preExec = {
  # Zet de misdaad_data data frame op
  misdaad_data <- data.frame(
    id = 1:10,
    delicttype = c("Diefstal", "Aanval", "Diefstal", "Inbraak", "Diefstal", "Vandalisme", "Diefstal", "Fraude", "Diefstal", "Aanval"),
    waarde = c(100, 200, 150, 300, 120, 80, 90, 60, 110, 50)
  )
})

# Modeloplossing:
gefilterde_data <- dplyr::filter(misdaad_data, delicttype == "Diefstal")
