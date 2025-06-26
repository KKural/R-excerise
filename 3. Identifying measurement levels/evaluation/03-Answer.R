# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

# Verwachte antwoorden voor meetniveaus:
niveau_zaak_id <- "nominaal"
niveau_geslacht <- "nominaal"
niveau_leeftijd <- "ratio"
niveau_misdaad_type <- "nominaal"
niveau_strafduur <- "ratio"
niveau_opleidingsniveau <- "ordinaal"
niveau_risicocategorie <- "ordinaal"

context({
  testcase("Controleer meetniveaus", {
    # First check if code is submitted
    testEqual(
      "Controleer of code is ingediend",
      function(env) {
        if (length(env$`.__code__`) == 0) {
          get_reporter()$add_message(
            "❌ Je hebt geen code ingediend. Je moet de meetniveaus voor alle variabelen definiëren.",
            type = "error"
          )
          return(FALSE)
        }
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )
    testEqual(
      "Controleer niveau_zaak_id",
      function(env) {
        # Check if the variable exists
        tryCatch({
          value <- env$niveau_zaak_id
          if (is.null(value)) {
            get_reporter()$add_message(
              "❌ De variabele `niveau_zaak_id` is niet gedefinieerd.",
              type = "error"
            )
            return(FALSE)
          }
          
          # Check if it's a string
          if (!is.character(value)) {
            get_reporter()$add_message(
              "❌ `niveau_zaak_id` moet een tekst (string) zijn, geen " + class(value) + ".",
              type = "error"
            )
            return(FALSE)
          }
          
          # Case-insensitive comparison
          return(tolower(value) == "nominaal")
        }, error = function(e) {
          get_reporter()$add_message(
            "❌ Er is een fout opgetreden bij het controleren van `niveau_zaak_id`.",
            type = "error"
          )
          return(FALSE)
        })
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_zaak_id` moet 'nominaal' zijn.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_zaak_id` is correct als 'nominaal'.",
            type = "success"
          )
        }
        return(got == want)
      }
    )
    testEqual(
      "",
      function(env) env$niveau_geslacht == "nominaal",
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_geslacht` moet 'nominaal' zijn.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_geslacht` is correct als 'nominaal'.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "",
      function(env) env$niveau_leeftijd == "ratio",
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_leeftijd` moet 'ratio' zijn.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_leeftijd` is correct als 'ratio'.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "",
      function(env) env$niveau_misdaad_type == "nominaal",
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_misdaad_type` moet 'nominaal' zijn.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_misdaad_type` is correct als 'nominaal'.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "",
      function(env) env$niveau_strafduur == "ratio",
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_strafduur` moet 'ratio' zijn.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_strafduur` is correct als 'ratio'.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "",
      function(env) env$niveau_opleidingsniveau == "ordinaal",
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_opleidingsniveau` moet 'ordinaal' zijn.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_opleidingsniveau` is correct als 'ordinaal'.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "",
      function(env) env$niveau_risicocategorie == "ordinaal",
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_risicocategorie` moet 'ordinaal' zijn.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_risicocategorie` is correct als 'ordinaal'.",
            type = "markdown"
          )
        }
        got == want
      }
    )
  })
})