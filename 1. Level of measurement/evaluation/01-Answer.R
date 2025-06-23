# Verwachte antwoorden:
# Maak eerst het data frame df_crime_data aan zoals hieronder:
# df_crime_data <- data.frame(
#   type = factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
#   ernst = ordered(c("Licht", "Matig", "Ernstig", "Licht", "Ernstig"), levels = c("Licht", "Matig", "Ernstig")),
#   leeftijd = c(19, 23, 45, 32, 28),
#   district = c("A1", "B2", "C3", "D4", "E5")
# )
# Voer daarna de volgende basisfuncties uit op df_crime_data:
# str(df_crime_data)
# names(df_crime_data)
# length(df_crime_data)
# nrow(df_crime_data)
# ncol(df_crime_data)
# head(df_crime_data)
# summary(df_crime_data)
# class(df_crime_data)
# dim(df_crime_data)

context({
  testcase("Feedback bij basisfuncties op data frame", {
    testEqual(
      "df_crime_data is een data frame met kolommen 'type', 'ernst', 'leeftijd', 'district'",
      function(env) is.data.frame(env$df_crime_data) && all(names(env$df_crime_data) == c("type", "ernst", "leeftijd", "district")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `df_crime_data` moet een data frame zijn met kolommen 'type', 'ernst', 'leeftijd', 'district'.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `df_crime_data` is juist aangemaakt als data frame met kolommen 'type', 'ernst', 'leeftijd', 'district'.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "str(df_crime_data) geeft de structuur van het data frame weer",
      function(env) {
        capture <- capture.output(str(env$df_crime_data))
        any(grepl("'data.frame'", capture)) && any(grepl("type", capture)) && any(grepl("ernst", capture)) && any(grepl("leeftijd", capture)) && any(grepl("district", capture))
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `str(df_crime_data)` moet de structuur van het data frame tonen, inclusief kolomnamen.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `str(df_crime_data)` toont correct de structuur van het data frame.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "names(df_crime_data) geeft de kolomnamen terug",
      function(env) all(names(env$df_crime_data) == c("type", "ernst", "leeftijd", "district")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `names(df_crime_data)` moet de kolomnamen 'type', 'ernst', 'leeftijd', 'district' teruggeven.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `names(df_crime_data)` geeft correct de kolomnamen terug.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "length(df_crime_data) geeft het aantal kolommen terug",
      function(env) length(env$df_crime_data) == 4,
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `length(df_crime_data)` moet het aantal kolommen (4) teruggeven.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `length(df_crime_data)` geeft correct het aantal kolommen terug.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "nrow(df_crime_data) geeft het aantal rijen terug",
      function(env) nrow(env$df_crime_data) == 5,
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `nrow(df_crime_data)` moet het aantal rijen (5) teruggeven.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `nrow(df_crime_data)` geeft correct het aantal rijen terug.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "ncol(df_crime_data) geeft het aantal kolommen terug",
      function(env) ncol(env$df_crime_data) == 4,
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `ncol(df_crime_data)` moet het aantal kolommen (4) teruggeven.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `ncol(df_crime_data)` geeft correct het aantal kolommen terug.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "head(df_crime_data) toont de eerste rijen van het data frame",
      function(env) all(head(env$df_crime_data)$type == c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `head(df_crime_data)` moet de eerste rijen tonen.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `head(df_crime_data)` toont correct de eerste rijen.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "summary(df_crime_data) geeft een samenvatting van alle kolommen",
      function(env) {
        capture <- capture.output(summary(env$df_crime_data))
        any(grepl("Diefstal", capture)) && any(grepl("Licht", capture)) && any(grepl("leeftijd", capture))
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `summary(df_crime_data)` moet een samenvatting van alle kolommen geven.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `summary(df_crime_data)` geeft correct een samenvatting van alle kolommen.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "class(df_crime_data) geeft het type object terug",
      function(env) any(class(env$df_crime_data) == "data.frame"),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `class(df_crime_data)` moet 'data.frame' teruggeven.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `class(df_crime_data)` geeft correct het type object terug.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "dim(df_crime_data) geeft het aantal rijen en kolommen als vector terug",
      function(env) all(dim(env$df_crime_data) == c(5, 4)),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ `dim(df_crime_data)` moet c(5, 4) teruggeven.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `dim(df_crime_data)` geeft correct het aantal rijen en kolommen terug.",
            type = "markdown"
          )
        }
        got == want
      }
    )
  })
}, preExec = {
  # Maak een data frame df_crime_data aan
  df_crime_data <<- data.frame(
    type = factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
    ernst = ordered(c("Licht", "Matig", "Ernstig", "Licht", "Ernstig"), levels = c("Licht", "Matig", "Ernstig")),
    leeftijd = c(19, 23, 45, 32, 28),
    district = c("A1", "B2", "C3", "D4", "E5")
  )
})
