context({
  testcase("Feedback bij nieuwe kolom aanmaken", {
    testEqual(
      "Nieuwe kolom is correct aangemaakt",
      function(env) {
        if (!exists("gewijzigde_data", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'gewijzigde_data' bestaat niet.",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.data.frame(env$gewijzigde_data)) {
          get_reporter()$add_message(
            "❌ 'gewijzigde_data' moet een data frame zijn.",
            type = "error"
          )
          return(FALSE)
        }
        if (!("dubbele_waarde" %in% colnames(env$gewijzigde_data))) {
          get_reporter()$add_message(
            "❌ 'gewijzigde_data' moet een kolom 'dubbele_waarde' bevatten.",
            type = "error"
          )
          return(FALSE)
        }
        if (!all(env$gewijzigde_data$dubbele_waarde == env$gewijzigde_data$waarde * 2)) {
          get_reporter()$add_message(
            "❌ De kolom 'dubbele_waarde' moet gelijk zijn aan 'waarde * 2' voor elke rij.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "Correct! De nieuwe kolom is correct aangemaakt in 'gewijzigde_data'.",
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
gewijzigde_data <- dplyr::mutate(misdaad_data, dubbele_waarde = waarde * 2)
