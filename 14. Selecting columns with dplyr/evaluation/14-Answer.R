context({
  testcase("Kolommen selecteren met dplyr", {
    testEqual(
      "",  # No title shown
      function(env) {
        # Try/catch to handle syntax errors in student code
        tryCatch({
          env$geselecteerde_data
        }, error = function(e) {
          get_reporter()$add_message("❌ Er is een fout in je code. Controleer je `select()`-aanroep en vergeet `library(dplyr)` niet te gebruiken.", type = "error")
          return(NULL)
        })
      },
      NULL,
      comparator = function(got, want) {
        if (is.null(got)) {
          return(FALSE)
        }

        if (!is.data.frame(got)) {
          get_reporter()$add_message("❌ 'geselecteerde_data' moet een data frame zijn.", type = "error")
          return(FALSE)
        }

        if (!identical(colnames(got), c("id", "delicttype"))) {
          get_reporter()$add_message("❌ 'geselecteerde_data' moet exact de kolommen 'id' en 'delicttype' bevatten, in deze volgorde.", type = "error")
          return(FALSE)
        }

        get_reporter()$add_message("✅ Correct! De juiste kolommen zijn geselecteerd.", type = "success")
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Data beschikbaar maken voor studenten
  misdaad_data <- data.frame(
    id = 1:10,
    delicttype = c("Diefstal", "Aanval", "Diefstal", "Inbraak", "Diefstal", "Vandalisme", "Diefstal", "Fraude", "Diefstal", "Aanval"),
    waarde = c(100, 200, 150, 300, 120, 80, 90, 60, 110, 50)
  )
})
