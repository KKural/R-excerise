context({
  # Step 1 — Existence check (no label shown)
  testcaseAssert("", function(env) {
    if (!exists("geselecteerde_data", envir = env)) {
      get_reporter()$add_message(
        "❌ De variabele `geselecteerde_data` bestaat niet. Controleer of je `select()` juist gebruikt hebt, en vergeet `library(dplyr)` niet.",
        type = "error"
      )
      return(FALSE)
    }
    TRUE
  })

  # Step 2 — Structure check (no label shown)
  testcase("", {
    testEqual(
      "",
      function(env) env$geselecteerde_data,
      NULL,
      comparator = function(got, want) {
        if (!is.data.frame(got)) {
          get_reporter()$add_message("❌ 'geselecteerde_data' moet een data frame zijn.", type = "error")
          return(FALSE)
        }

        if (!identical(colnames(got), c("id", "delicttype"))) {
          get_reporter()$add_message("❌ De kolommen moeten exact 'id' en 'delicttype' zijn, in deze volgorde.", type = "error")
          return(FALSE)
        }

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
