# LET OP: Studenten hoeven het data frame niet zelf te maken of in te lezen. Voor deze oefening mag je ervan uitgaan dat het data frame `df_crime_data` al bestaat met de juiste structuur en waarden zoals hieronder beschreven.
# Je hoeft dus GEEN code te schrijven om het data frame te maken of een csv-bestand in te lezen.
# Focus alleen op het toepassen van de basisfuncties op het bestaande data frame.
#
# Verwachte structuur van df_crime_data:
# - type: factor met de categorieën "Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"
# - ernst: geordende factor met niveaus: "Licht" < "Matig" < "Ernstig"
# - leeftijd: numerieke vector met de waarden: 19, 23, 45, 32, 28
# - district: karaktervector met de waarden: "A1", "B2", "C3", "D4", "E5"
#
# Gebruik de basisfuncties om de structuur en eigenschappen van het data frame te onderzoeken.
# De feedback bij elke functie legt uit wat de functie doet en welke informatie je eruit haalt.

# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Predict, Run, Investigate, Modify, Make

context({
  testcase("Feedback bij basisfuncties op data frame", {
    testEqual(
      "str(df_crime_data) toont de structuur van het data frame",
      function() paste(capture.output(str(df_crime_data)), collapse = "\n"),
      "check_substrings",
      comparator = function(got, want, ...) {
        all(sapply(c("data.frame", "type", "ernst", "leeftijd", "district"), function(x) grepl(x, got)))
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
      function() all(head(df_crime_data)$type == c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
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
})
