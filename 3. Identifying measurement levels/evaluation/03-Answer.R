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
  testcase("", {
    testEqual(
      "",
      function(env) env$niveau_zaak_id == "nominaal",
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `niveau_zaak_id` moet 'nominaal' zijn.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `niveau_zaak_id` is correct als 'nominaal'.",
            type = "markdown"
          )
        }
        got == want
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