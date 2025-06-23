# Evaluation script for Basisfuncties op df_crime_data

context({
  testcase("Feedback bij basisfuncties op df_crime_data", {
    # 1) Strukturering met str()
    testEqual(
      "str(df_crime_data) toont de structuur van het data frame",
      function(env) paste(capture.output(str(env$df_crime_data)), collapse = "\n"),
      "check_substrings",
      comparator = function(got, want, ...) {
        if (all(sapply(c("data.frame", "type", "ernst", "leeftijd", "district"), function(x) grepl(x, got)))) {
          get_reporter()$add_message(
            "✅ **str(df_crime_data)**: de structuur toont kolomnamen, types en voorbeeldwaarden.",
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            "❌ **str(df_crime_data)** toont niet de verwachte structuur. Controleer kolomnamen en types.",
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 2) Kolomnamen ophalen
    testEqual(
      "names(df_crime_data) geeft de kolomnamen terug",
      function(env) all(names(env$df_crime_data) == c("type", "ernst", "leeftijd", "district")),
      TRUE,
      comparator = function(got, want, ...) {
        if (got) {
          get_reporter()$add_message(
            "✅ **names(df_crime_data)**: kolomnamen zijn type, ernst, leeftijd, district.\n",  # blank line
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "❌ **names(df_crime_data)** geeft niet de juiste kolomnamen.\n",  # blank line
            type = "markdown"
          )
        }
        got == want
      }
    )

    # 3) Aantal kolommen met length()
    testEqual(
      "length(df_crime_data) geeft het aantal kolommen terug",
      function(env) length(env$df_crime_data),
      4,
      comparator = function(got, want, ...) {
        if (got == want) {
          get_reporter()$add_message(
            paste0("✅ **length(df_crime_data)**: aantal kolommen = ", got, ".\n"),
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ **length(df_crime_data)** geeft ", got, " in plaats van ", want, ".\n"),
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 4) Aantal rijen met nrow()
    testEqual(
      "nrow(df_crime_data) geeft het aantal rijen terug",
      function(env) nrow(env$df_crime_data),
      5,
      comparator = function(got, want, ...) {
        if (got == want) {
          get_reporter()$add_message(
            paste0("✅ **nrow(df_crime_data)**: aantal rijen = ", got, ".\n"),
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ **nrow(df_crime_data)** geeft ", got, " in plaats van ", want, ".\n"),
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 5) Aantal kolommen met ncol()
    testEqual(
      "ncol(df_crime_data) geeft het aantal kolommen terug",
      function(env) ncol(env$df_crime_data),
      4,
      comparator = function(got, want, ...) {
        if (got == want) {
          get_reporter()$add_message(
            paste0("✅ **ncol(df_crime_data)**: aantal kolommen = ", got, ".\n"),
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ **ncol(df_crime_data)** geeft ", got, " in plaats van ", want, ".\n"),
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 6) Eerste rijen weergeven met head()
    testEqual(
      "head(df_crime_data) toont de eerste rijen van het data frame",
      function(env) all(head(env$df_crime_data)$type ==
                         c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
      TRUE,
      comparator = function(got, want, ...) {
        if (got) {
          get_reporter()$add_message(
            "✅ **head(df_crime_data)**: eerste 5 types komen overeen.\n",
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            "❌ **head(df_crime_data)**: eerste rijen komen niet overeen.\n",
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 7) Overzicht met summary()
    testEqual(
      "summary(df_crime_data) geeft een samenvatting van alle kolommen",
      function(env) paste(capture.output(summary(env$df_crime_data)), collapse = "\n"),
      "check_substrings",
      comparator = function(got, want, ...) {
        if (all(sapply(c("Diefstal", "Licht", "leeftijd"), function(x) grepl(x, got)))) {
          get_reporter()$add_message(
            "✅ **summary(df_crime_data)**: samenvatting bevat factoren en numerieke statistieken.\n",
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            "❌ **summary(df_crime_data)** bevat niet alle verwachte outputs.\n",
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 8) Class bepalen met class()
    testEqual(
      "class(df_crime_data) geeft het type object terug",
      function(env) class(env$df_crime_data)[1],
      "data.frame",
      comparator = function(got, want, ...) {
        if (got == want) {
          get_reporter()$add_message(
            "✅ **class(df_crime_data)**: objecttype = data.frame.\n",
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ **class(df_crime_data)** geeft '", got, "' in plaats van '", want, "'.\n"),
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 9) Dimensies met dim()
    testEqual(
      "dim(df_crime_data) geeft het aantal rijen en kolommen als vector terug",
      function(env) dim(env$df_crime_data),
      c(5, 4),
      comparator = function(got, want, ...) {
        if (all(got == want)) {
          get_reporter()$add_message(
            paste0("✅ **dim(df_crime_data)**: dimensies = (", paste(got, collapse=", "), ")."),
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ **dim(df_crime_data)** geeft (", paste(got, collapse=", "), ") in plaats van (", paste(want, collapse=", "), ")."),
            type = "markdown"
          )
          FALSE
        }
      }
    )
  })
}, preExec = {
  # Setup: maak df_crime_data aan zodat studenten geen import hoeven te doen
  df_crime_data <- data.frame(
    type = factor(
      c("Diefstal","Aanval","Inbraak","Fraude","Vandalisme"),
      levels = c("Diefstal","Aanval","Inbraak","Fraude","Vandalisme")
    ),
    ernst = factor(
      c("Licht","Matig","Ernstig","Matig","Licht"),
      levels = c("Licht","Matig","Ernstig"), ordered = TRUE
    ),
    leeftijd = c(19,23,45,32,28),
    district = c("A1","B2","C3","D4","E5"),
    stringsAsFactors = FALSE
  )
})
