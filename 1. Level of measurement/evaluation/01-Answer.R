# Evaluation script for Basisfuncties op `df_crime_data`

context({
  testcase("", {

    # 1) str()
    testEqual(
      "",
      function(env) paste(capture.output(str(env$df_crime_data)), collapse = "\n"),
      TRUE,
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> str(df_crime_data)\n```", type="markdown")
        if (grepl("type|ernst|leeftijd|district", got)) {
          get_reporter()$add_message(
            "✅ str(df_crime_data): toont kolomnamen, types en voorbeeldwaarden.",
            type = "success"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            "❌ str(df_crime_data): structuur niet zoals verwacht.",
            type = "error"
          )
          return(FALSE)
        }
        FALSE
      }
    )

    # 2) names()
    testEqual(
      "",
      function(env) names(env$df_crime_data),
      c("type", "ernst", "leeftijd", "district"),
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> names(df_crime_data)\n```", type = "markdown")
        if (identical(got, want)) {
          get_reporter()$add_message(
            "✅ names(df_crime_data): kolomnamen zijn type, ernst, leeftijd, district.",
            type = "success"
          )
        } else {
          get_reporter()$add_message(
            "❌ names(df_crime_data): onjuiste kolomnamen.",
            type = "error"
          )
        }
        identical(got, want)
      }
    )

    # 3) length()
    testEqual(
      "",
      function(env) length(env$df_crime_data),
      4,
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> length(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```\n[1] ", got, "\n```"), type="markdown")
        if (got == want) {
          get_reporter()$add_message(
            "✅ length(df_crime_data): aantal kolommen = 4.",
            type="markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ length(df_crime_data): geeft ", got, " in plaats van 4."),
            type="markdown"
          )
          FALSE
        }
      }
    )

    # 4) nrow()
    testEqual(
      "",
      function(env) nrow(env$df_crime_data),
      5,
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> nrow(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```\n[1] ", got, "\n```"), type="markdown")
        if (got == want) {
          get_reporter()$add_message(
            "✅ nrow(df_crime_data): aantal rijen = 5.",
            type="markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ nrow(df_crime_data): geeft ", got, " in plaats van 5."),
            type="markdown"
          )
          FALSE
        }
      }
    )

    # 5) ncol()
    testEqual(
      "",
      function(env) ncol(env$df_crime_data),
      4,
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> ncol(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```\n[1] ", got, "\n```"), type="markdown")
        if (got == want) {
          get_reporter()$add_message(
            "✅ ncol(df_crime_data): aantal kolommen = 4.",
            type="markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ ncol(df_crime_data): geeft ", got, " in plaats van 4."),
            type="markdown"
          )
          FALSE
        }
      }
    )

    # 6) head()
    testEqual(
      "",
      function(env) head(env$df_crime_data),
      head(data.frame(
        type     = factor(
                     c("Diefstal","Aanval","Inbraak","Fraude","Vandalisme"),
                     levels = c("Diefstal","Aanval","Inbraak","Fraude","Vandalisme")
                   ),
        ernst    = factor(
                     c("Licht","Matig","Ernstig","Matig","Licht"),
                     levels = c("Licht","Matig","Ernstig"),
                     ordered = TRUE
                   ),
        leeftijd  = c(19, 23, 45, 32, 28),
        district = c("A1","B2","C3","D4","E5"),
        stringsAsFactors = FALSE
      )),
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> head(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste(capture.output(print(got)), collapse = "\n"), type="markdown")
        if (identical(got, want)) {
          get_reporter()$add_message(
            "✅ head(df_crime_data): eerste 5 rijen komen overeen.",
            type="markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            "❌ head(df_crime_data): rijen kwamen niet uit zoals verwacht.",
            type="markdown"
          )
          FALSE
        }
      }
    )

    # 7) summary()
    testEqual(
      "",
      function(env) paste(capture.output(summary(env$df_crime_data)), collapse = "\n"),
      TRUE,
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> summary(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```
", got, "
```"), type="markdown")
        # Check for expected substrings in the summary output
        expected <- c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme", "Licht", "Matig", "Ernstig", "leeftijd", "district")
        if (all(sapply(expected, function(x) grepl(x, got)))) {
          get_reporter()$add_message(
            "✅ summary(df_crime_data): toont frequenties en statistieken.",
            type="markdown"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            "❌ summary(df_crime_data): samenvatting niet zoals verwacht.",
            type="markdown"
          )
          return(FALSE)
        }
      }
    )

    # 8) class()
    testEqual(
      "",
      function(env) class(env$df_crime_data)[1],
      "data.frame",
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> class(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```
[1] \"", got, "\"\n```"), type="markdown")
        if (got == want) {
          get_reporter()$add_message(
            "✅ class(df_crime_data): objecttype = data.frame.",
            type="markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ class(df_crime_data): geeft ", got, " in plaats van 'data.frame'."),
            type="markdown"
          )
          FALSE
        }
      }
    )

    # 9) dim()
    testEqual(
      "",
      function(env) dim(env$df_crime_data),
      c(5L, 4L),
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> dim(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```
[1] ", paste(got, collapse=" "), "\n```"), type="markdown")
        if (identical(got, want)) {
          get_reporter()$add_message(
            "✅ dim(df_crime_data): dimensies = (5, 4).",
            type="markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            paste0("❌ dim(df_crime_data): geeft ", paste(got, collapse=" "), " in plaats van ", paste(want, collapse=" "), "."),
            type="markdown"
          )
          # Add structure output for debugging
          get_reporter()$add_message(
            paste0("Structuur van output:\n- gekregen: ", paste(capture.output(str(got)), collapse=" "), "\n- verwacht: ", paste(capture.output(str(want)), collapse=" ")), 
            type="markdown"
          )
          FALSE
        }
      }
    )

  })
}, preExec = {
  # Setup: maak df_crime_data met 5 rijen x 4 kolommen
  df_crime_data <- data.frame(
    type = factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"), levels = c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
    ernst = factor(c("Licht", "Matig", "Ernstig", "Matig", "Licht"), ordered = TRUE, levels = c("Licht", "Matig", "Ernstig")),
    leeftijd  = c(19, 23, 45, 32, 28),
    district = c("A1", "B2", "C3", "D4", "E5"),
    stringsAsFactors = FALSE
  )
})
