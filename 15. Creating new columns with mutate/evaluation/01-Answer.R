context({
  testcase("Feedback bij nieuwe kolom aanmaken", {
    testEqual(
      "Nieuwe kolom is correct aangemaakt",
      function(env) {
        exists("gewijzigde_data", envir = env) &&
        is.data.frame(env$gewijzigde_data) &&
        "dubbele_waarde" %in% colnames(env$gewijzigde_data) &&
        all(env$gewijzigde_data$dubbele_waarde == env$gewijzigde_data$waarde * 2)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'gewijzigde_data' moet bestaan, een nieuwe kolom 'dubbele_waarde' bevatten die gelijk is aan waarde * 2.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ De nieuwe kolom is correct aangemaakt in 'gewijzigde_data'.",
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
gewijzigde_data <- dplyr::mutate(misdaad_data, dubbele_waarde = waarde * 2)
