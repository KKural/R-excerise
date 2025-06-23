# Evaluation script for Basisfuncties op `df_crime_data`

context({
  testcase("Feedback bij basisfuncties op df_crime_data", {

    # 1) `str()`
    testEqual(
      "str(df_crime_data) toont de structuur van het data frame",
      function(env) paste(capture.output(str(env$df_crime_data)), collapse = "\n"),
      "check_substrings",
      comparator = function(got, want, ...) {
        # Echo the command
        get_reporter()$add_message("```r\n> str(df_crime_data)\n```", type = "markdown")
        # Echo the output
        get_reporter()$add_message(paste0("```\n", got, "\n```"), type = "markdown")
        # Commentary
        if (all(sapply(c("data.frame", "id", "type", "ernst", "age", "district"),
                       function(x) grepl(x, got)))) {
          get_reporter()$add_message(
            "✅ str(df_crime_data): toont kolomnamen, types en voorbeeldwaarden.",
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            "❌ str(df_crime_data): structuur niet zoals verwacht.",
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 2) `names()`
    testEqual(
      "names(df_crime_data) geeft de kolomnamen terug",
      function(env) paste(capture.output(names(env$df_crime_data)), collapse = "\n"),
      "check_substrings",
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> names(df_crime_data)\n```", type = "markdown")
        get_reporter()$add_message(paste0("```\n", got, "\n```"), type = "markdown")
        if (all(names(env$df_crime_data) == c("id","type","ernst","age","district"))) {
          get_reporter()$add_message(
            "✅ names(df_crime_data): kolomnamen zijn id, type, ernst, age, district.",
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            "❌ names(df_crime_data): onjuiste kolomnamen.",
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 3) `length()`
    testEqual(
      "length(df_crime_data) geeft het aantal kolommen terug",
      function(env) length(env$df_crime_data),
      5,
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> length(df_crime_data)\n```", type = "markdown")
        get_reporter()$add_message(paste0("```\n[1] ", got, "\n```"), type = "markdown")
        if (got == want) {
          get_reporter()$add_message(
            "✅ length(df_crime_data): aantal kolommen = 5.",
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ length(df_crime_data): geeft ", got, " in plaats van 5."),
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 4) `nrow()`
    testEqual(
      "nrow(df_crime_data) geeft het aantal rijen terug",
      function(env) nrow(env$df_crime_data),
      5,
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> nrow(df_crime_data)\n```", type = "markdown")
        get_reporter()$add_message(paste0("```\n[1] ", got, "\n```"), type = "markdown")
        if (got == want) {
          get_reporter()$add_message(
            "✅ nrow(df_crime_data): aantal rijen = 5.",
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ nrow(df_crime_data): geeft ", got, " in plaats van 5."),
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 5) `ncol()`
    testEqual(
      "ncol(df_crime_data) geeft het aantal kolommen terug",
      function(env) ncol(env$df_crime_data),
      5,
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> ncol(df_crime_data)\n```", type = "markdown")
        get_reporter()$add_message(paste0("```\n[1] ", got, "\n```"), type = "markdown")
        if (got == want) {
          get_reporter()$add_message(
            "✅ ncol(df_crime_data): aantal kolommen = 5.",
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ ncol(df_crime_data): geeft ", got, " in plaats van 5."),
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 6) `head()`
    testEqual(
      "head(df_crime_data) toont de eerste rijen van het data frame",
      function(env) paste(capture.output(head(env$df_crime_data)), collapse = "\n"),
      "check_substrings",
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> head(df_crime_data)\n```", type = "markdown")
        get_reporter()$add_message(paste0("```\n", got, "\n```"), type = "markdown")
        if (grepl("1  1", got) && grepl("5 Vandalisme", got)) {
          get_reporter()$add_message(
            "✅ head(df_crime_data): eerste 5 rijen komen overeen.",
            type = "markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            "❌ head(df_crime_data): rijen kwamen niet uit zoals verwacht.",
            type = "markdown"
          )
          FALSE
        }
      }
    )

    # 7) `summary()`
    testEqual(
      "summary(df_crime_data) geeft een samenvatting van alle kolommen",
      function(env) paste(capture.output(summary(env$df_crime_data)), collapse = "\n"),
      "check_substrings",
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> summary(df_crime_data)\n```", type = "markdown")
        get_reporter()$add_message(paste0("```\n", got, "\n```"), type = "markdown")
        get_reporter()$add_message(
          "✅ summary(df_crime_data): toont frequenties en statistieken.",
          type = "markdown"
        )
        TRUE
      }
    )

    # 8) `class()`
    testEqual(
      "class(df_crime_data) geeft het type object terug",
      function(env) class(env$df_crime_data)[1],
      "data.frame",
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> class(df_crime_data)\n```", type = "markdown")
        get_reporter()$add_message(paste0("```\n[1] \"", got, "\"\n```"), type = "markdown")
        get_reporter()$add_message(
          "✅ class(df_crime_data): objecttype = data.frame.",
          type = "markdown"
        )
        TRUE
      }
    )

    # 9) `dim()`
    testEqual(
      "dim(df_crime_data) geeft het aantal rijen en kolommen als vector terug",
      function(env) dim(env$df_crime_data),
      c(5, 5),
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> dim(df_crime_data)\n```", type = "markdown")
        get_reporter()$add_message(paste0("```\n[1] ", paste(got, collapse=" "), "\n```"), type = "markdown")
        get_reporter()$add_message(
          "✅ dim(df_crime_data): dimensies = (5, 5).",
          type = "markdown"
        )
        TRUE
      }
    )

  })
}, preExec = {
  # Setup: maak df_crime_data met 5 rijen x 5 kolommen
  df_crime_data <- data.frame(
    id       = 1:5,
    type     = factor(
                 c("Diefstal","Aanval","Inbraak","Fraude","Vandalisme"),
                 levels = c("Diefstal","Aanval","Inbraak","Fraude","Vandalisme")
               ),
    ernst    = factor(
                 c("Licht","Matig","Ernstig","Licht","Matig"),
                 levels = c("Licht","Matig","Ernstig"),
                 ordered = TRUE
               ),
    age      = c(21, 34, 28, 19, 45),
    district = c("A1","B2","C3","D4","E5"),
    stringsAsFactors = FALSE
  )
})
