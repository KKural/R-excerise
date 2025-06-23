# Expected answers:
# misdaad_types <- factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"))
# ernst_misdaad <- factor(c("Licht", "Matig", "Ernstig"), levels = c("Licht", "Matig", "Ernstig"), ordered = TRUE)
# leeftijden_daders <- c(19, 23, 45, 32, 28, 21)
# district_codes <- c("A1", "B2", "C3", "D4", "E5")

context({
  testcase("", {
    testEqual(
      "",
      function(env) { NULL },
      NULL,
      comparator = function(got, want, ...) {
        TRUE
      }
    )
  })
}, preExec = {
  misdaad_types <- factor(
    c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"),
    levels = c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")
  )

  ernst_misdaad <- factor(
    c("Licht", "Matig", "Ernstig"), 
    levels = c("Licht", "Matig", "Ernstig"), 
    ordered = TRUE
  )

  leeftijden_daders <- c(19, 23, 45, 32, 28, 21)

  district_codes <- c("A1", "B2", "C3", "D4", "E5")
})

# Model solution
misdaad_types <- factor(
  c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"),
  levels = c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")
)

ernst_misdaad <- factor(
  c("Licht", "Matig", "Ernstig"), 
  levels = c("Licht", "Matig", "Ernstig"), 
  ordered = TRUE
)

leeftijden_daders <- c(19, 23, 45, 32, 28, 21)

district_codes <- c("A1", "B2", "C3", "D4", "E5")

context({
  testcase("Meetniveau feedback", {
    testEqual(
      "misdaad_types is een factor met de juiste niveaus",  # misdaad_types is a factor with the correct levels
      function(env) {
        get_reporter()$add_message(
          paste0(
            "DEBUG: class = ", paste(class(env$misdaad_types), collapse = ", "),
            "; levels = ", if (is.factor(env$misdaad_types)) paste(levels(env$misdaad_types), collapse = ", ") else "N/A"
          ),
          type = "markdown"
        )
        is.factor(env$misdaad_types) &&
          all(levels(env$misdaad_types) == c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"))
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `misdaad_types` moet een factor zijn met de niveaus: 'Diefstal', 'Aanval', 'Inbraak', 'Fraude', 'Vandalisme'.",  
            # ❌ misdaad_types must be a factor with levels: 'Diefstal', 'Aanval', 'Inbraak', 'Fraude', 'Vandalisme'.
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `misdaad_types` is juist aangemaakt als factor met de juiste niveaus.",  
            # ✅ misdaad_types was correctly created as a factor with the correct levels.
            type = "markdown"
          )
        }
        got == want
      }
    )

    testEqual(
      "ernst_misdaad is een geordende factor met de juiste volgorde",  # ernst_misdaad is an ordered factor with the correct order
      function(env) is.ordered(env$ernst_misdaad) &&
        all(levels(env$ernst_misdaad) == c("Licht", "Matig", "Ernstig")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `ernst_misdaad` moet een geordende factor zijn met de volgorde: 'Licht' < 'Matig' < 'Ernstig'.",  
            # ❌ ernst_misdaad must be an ordered factor with order: 'Licht' < 'Matig' < 'Ernstig'.
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `ernst_misdaad` is juist aangemaakt als geordende factor met de juiste volgorde.",  
            # ✅ ernst_misdaad was correctly created as an ordered factor with the correct order.
            type = "markdown"
          )
        }
        got == want
      }
    )

    testEqual(
      "leeftijden_daders is een numerieke vector",  # leeftijden_daders is a numeric vector
      function(env) is.numeric(env$leeftijden_daders) &&
        all(env$leeftijden_daders == c(19, 23, 45, 32, 28, 21)),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `leeftijden_daders` moet een numerieke vector zijn met de waarden: 19, 23, 45, 32, 28, 21.",  
            # ❌ leeftijden_daders must be a numeric vector with the values: 19, 23, 45, 32, 28, 21.
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `leeftijden_daders` is juist aangemaakt als numerieke vector.",  
            # ✅ leeftijden_daders was correctly created as a numeric vector.
            type = "markdown"
          )
        }
        got == want
      }
    )

    testEqual(
      "district_codes is een karaktervector",  # district_codes is a character vector
      function(env) is.character(env$district_codes) &&
        all(env$district_codes == c("A1", "B2", "C3", "D4", "E5")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `district_codes` moet een karaktervector zijn met de waarden: 'A1', 'B2', 'C3', 'D4', 'E5'.",  
            # ❌ district_codes must be a character vector with values: 'A1', 'B2', 'C3', 'D4', 'E5'.
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `district_codes` is juist aangemaakt als karaktervector.",  
            # ✅ district_codes was correctly created as a character vector.
            type = "markdown"
          )
        }
        got == want
      }
    )
  })
})
