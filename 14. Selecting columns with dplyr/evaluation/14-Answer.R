context({
  # Step 1 — Compilation & existence check
  testcaseAssert("Check of 'geselecteerde_data' bestaat", function(env) {
    if (!exists("geselecteerde_data", envir = env)) {
      get_reporter()$add_message(
        "❌ De variabele `geselecteerde_data` bestaat niet. Mogelijk heb je `select()` verkeerd gebruikt of `library(dplyr)` vergeten. Probeer: `geselecteerde_data <- select(misdaad_data, id, delicttype)`.",
        type = "error"
      )
      return(FALSE)
    }
    TRUE
  })

  # Step 2 — Structure check
  testcase("Controleer de structuur van 'geselecteerde_data'", {
    testEqual(
      "",  # Suppress default output
      function(env) env$geselecteerde_data,
      NULL,
      comparator = function(got, want) {
        # Must be a data frame
        if (!is.data.frame(got)) {
          get_reporter()$add_message("❌ 'geselecteerde_data' moet een data frame zijn. Controleer of je de juiste functie gebruikt hebt.", type = "error")
          return(FALSE)
        }

        # Must have exact columns
        expected_cols <- c("id", "delicttype")
        if (!identical(colnames(got), expected_cols)) {
          get_reporter()$add_message(sprintf(
            "❌ Verkeerde kolommen geselecteerd. Verwacht: %s. Gevonden: %s.",
            paste(expected_cols, collapse = ", "),
            paste(colnames(got), collapse = ", ")
          ), type = "error")
          return(FALSE)
        }

        # ✅ All good
        get_reporter()$add_message("✅ Goed gedaan! Je hebt de juiste kolommen geselecteerd met `select()`.", type = "success")
        return(TRUE)
      }
    )
  })
}, preExec = {
  misdaad_data <- data.frame(
    id = 1:10,
    delicttype = c("Diefstal", "Aanval", "Diefstal", "Inbraak", "Diefstal", "Vandalisme", "Diefstal", "Fraude", "Diefstal", "Aanval"),
    waarde = c(100, 200, 150, 300, 120, 80, 90, 60, 110, 50)
  )
})
