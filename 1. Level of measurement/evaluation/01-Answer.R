# Evaluation script for basisfuncties op df_crime_data

context({
  testcase("Feedback bij basisfuncties op df_crime_data", {
    testEqual(
      "str(df_crime_data) toont de structuur van het data frame",
      function() paste(capture.output(str(df_crime_data)), collapse = "\n"),
      "check_substrings",
      comparator = function(got, want, ...) {
        all(sapply(
          c("data.frame", "type", "ernst", "leeftijd", "district"),
          function(x) grepl(x, got)
        ))
      }
    )

    testEqual(
      "names(df_crime_data) geeft de kolomnamen terug",
      function() all(names(df_crime_data) == c("type", "ernst", "leeftijd", "district")),
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
      function() length(df_crime_data),
      4
    )

    testEqual(
      "nrow(df_crime_data) geeft het aantal rijen terug",
      function() nrow(df_crime_data),
      5
    )

    testEqual(
      "ncol(df_crime_data) geeft het aantal kolommen terug",
      function() ncol(df_crime_data),
      4
    )

    testEqual(
      "head(df_crime_data) toont de eerste rijen van het data frame",
      function() all(
        head(df_crime_data)$type ==
        c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")
      ),
      TRUE
    )

    testEqual(
      "summary(df_crime_data) geeft een samenvatting van alle kolommen",
      function() paste(capture.output(summary(df_crime_data)), collapse = "\n"),
      "check_substrings",
      comparator = function(got, want, ...) {
        all(sapply(c("Diefstal", "Licht", "leeftijd"), function(x) grepl(x, got)))
      }
    )

    testEqual(
      "class(df_crime_data) geeft het type object terug",
      function() class(df_crime_data)[1],
      "data.frame"
    )

    testEqual(
      "dim(df_crime_data) geeft het aantal rijen en kolommen als vector terug",
      function() dim(df_crime_data),
      c(5, 4)
    )
  })
}, preExec = {
  # Setup: maak df_crime_data aan zodat studenten geen import hoeven te doen
  df_crime_data <- data.frame(
    type = factor(
      c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"),
      levels = c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")
    ),
    ernst = factor(
      c("Licht", "Matig", "Ernstig", "Matig", "Licht"),
      levels = c("Licht", "Matig", "Ernstig"),
      ordered = TRUE
    ),
    leeftijd = c(19, 23, 45, 32, 28),
    district = c("A1", "B2", "C3", "D4", "E5"),
    stringsAsFactors = FALSE
  )
})
