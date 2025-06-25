context({
  testcase("Feedback bij kolommen selecteren", {
    testEqual(
      "Geselecteerde kolommen zijn correct",
      function(env) {
        if (!exists("geselecteerde_data", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'geselecteerde_data' bestaat niet.",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.data.frame(env$geselecteerde_data)) {
          get_reporter()$add_message(
            "❌ 'geselecteerde_data' moet een data frame zijn.",
            type = "error"
          )
          return(FALSE)
        }
        if (!identical(colnames(env$geselecteerde_data), c("id", "delicttype"))) {
          get_reporter()$add_message(
            "❌ 'geselecteerde_data' moet alleen de kolommen 'id' en 'delicttype' bevatten (in deze volgorde).",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "Correct! De juiste kolommen zijn geselecteerd in 'geselecteerde_data'.",
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
geselecteerde_data <- dplyr::select(misdaad_data, id, delicttype)
