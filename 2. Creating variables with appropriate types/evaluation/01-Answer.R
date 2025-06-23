# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Feedback bij variabelen aanmaken", {
    testEqual(
      "misdaad_types is een factor met de juiste niveaus",
      function(env) is.factor(env$misdaad_types) && all(levels(env$misdaad_types) == c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # `misdaad_types` should be a factor with levels: 'Diefstal', 'Aanval', 'Inbraak', 'Fraude', 'Vandalisme'.
          get_reporter()$add_message(
            "❌ `misdaad_types` moet een factor zijn met de niveaus: 'Diefstal', 'Aanval', 'Inbraak', 'Fraude', 'Vandalisme'.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `misdaad_types` is juist aangemaakt als factor met de juiste niveaus.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "ernst_misdaad is een geordende factor met de juiste volgorde",
      function(env) is.ordered(env$ernst_misdaad) && all(levels(env$ernst_misdaad) == c("Licht", "Matig", "Ernstig")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # `ernst_misdaad` should be an ordered factor with order: 'Licht' < 'Matig' < 'Ernstig'.
          get_reporter()$add_message(
            "❌ `ernst_misdaad` moet een geordende factor zijn met de volgorde: 'Licht' < 'Matig' < 'Ernstig'.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `ernst_misdaad` is juist aangemaakt als geordende factor met de juiste volgorde.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "leeftijden_daders is een numerieke vector",
      function(env) is.numeric(env$leeftijden_daders) && all(env$leeftijden_daders == c(19, 23, 45, 32, 28, 21)),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # `leeftijden_daders` should be a numeric vector with values: 19, 23, 45, 32, 28, 21.
          get_reporter()$add_message(
            "❌ `leeftijden_daders` moet een numerieke vector zijn met de waarden: 19, 23, 45, 32, 28, 21.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `leeftijden_daders` is juist aangemaakt als numerieke vector.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "district_codes is een karaktervector",
      function(env) is.character(env$district_codes) && all(env$district_codes == c("A1", "B2", "C3", "D4", "E5")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # `district_codes` should be a character vector with values: 'A1', 'B2', 'C3', 'D4', 'E5'.
          get_reporter()$add_message(
            "❌ `district_codes` moet een karaktervector zijn met de waarden: 'A1', 'B2', 'C3', 'D4', 'E5'.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `district_codes` is juist aangemaakt als karaktervector.",
            type = "markdown"
          )
        }
        got == want
      }
    )
  })
}, preExec = {
  # 1. Maak de factorvariabele misdaad_types aan
  misdaad_types <<- factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"))

  # 2. Maak de geordende factor ernst_misdaad aan
  ernst_misdaad <<- factor(c("Licht", "Matig", "Ernstig"), 
                           levels = c("Licht", "Matig", "Ernstig"), 
                           ordered = TRUE)

  # 3. Maak de numerieke vector leeftijden_daders aan
  leeftijden_daders <<- c(19, 23, 45, 32, 28, 21)

  # 4. Maak de karaktervector district_codes aan
  district_codes <<- c("A1", "B2", "C3", "D4", "E5")
})