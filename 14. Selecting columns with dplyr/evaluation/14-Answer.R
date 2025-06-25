context({
  testcase("Feedback bij kolommen selecteren", {
    testEqual(
      "Geselecteerde kolommen zijn correct",
      function(env) env$geselecteerde_data,
      NULL,
      comparator = function(got, want, ...) {
        # Check if variable exists
        if (is.null(got)) {
          get_reporter()$add_message(
            "❌ De variabele 'geselecteerde_data' bestaat niet.",
            type = "error"
          )
          return(FALSE)
        }
        # Check if it's a data frame
        if (!is.data.frame(got)) {
          get_reporter()$add_message(
            "❌ 'geselecteerde_data' moet een data frame zijn.",
            type = "error"
          )
          return(FALSE)
        }
        # Check column names
        if (!identical(colnames(got), c("id", "delicttype"))) {
          get_reporter()$add_message(
            "❌ 'geselecteerde_data' moet alleen de kolommen 'id' en 'delicttype' bevatten (in deze volgorde).",
            type = "error"
          )
          return(FALSE)
        }
        # Success message
        get_reporter()$add_message(
          "✅ Correct! De juiste kolommen zijn geselecteerd in 'geselecteerde_data'.",
          type = "success"
        )
        return(TRUE)
      }
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
