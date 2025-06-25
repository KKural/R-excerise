# Evaluation script for Basisfuncties op `crime_stats_ghent`

# Ensure crimsyndata is installed from GitHub if missing
if (!requireNamespace("crimsyndata", quietly = TRUE)) {
  if (!requireNamespace("remotes", quietly = TRUE)) {
    install.packages("remotes")
  }
  remotes::install_github("KKural/crimsyndata")
}
library(crimsyndata)

context({
  testcase("Feedback bij basisfuncties op crime_stats_ghent", {
    
    preExec = {
      library(crimsyndata)
    }

    # 1) str()
    testEqual(
      "str(crime_stats_ghent) toont de structuur van het data frame",
      function(env) paste(capture.output(str(env$crime_stats_ghent)), collapse = "\n"),
      TRUE,
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> str(crime_stats_ghent)\n```", type="markdown")
        if (grepl("district|unemployment_rate|poverty_rate|urban_density|ethnic_diversity|year|population|violent_crimes|property_crimes|crime_type", got)) {
          get_reporter()$add_message(
            "✅ str(crime_stats_ghent): toont kolomnamen, types en voorbeeldwaarden.",
            type = "success"
          )
        } else {
          get_reporter()$add_message(
            "❌ str(crime_stats_ghent): structuur niet zoals verwacht.",
            type = "error"
          )
        }
        TRUE
      }
    )

    # 2) names()
    testEqual(
      "names(crime_stats_ghent) geeft de kolomnamen terug",
      function(env) names(env$crime_stats_ghent),
      c("district", "unemployment_rate", "poverty_rate", "urban_density", "ethnic_diversity", "year", "population", "violent_crimes", "property_crimes", "crime_type"),
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> names(crime_stats_ghent)\n```", type = "markdown")
        if (identical(got, want)) {
          get_reporter()$add_message(
            "✅ names(crime_stats_ghent): kolomnamen zijn correct.",
            type = "success"
          )
        } else {
          get_reporter()$add_message(
            "❌ names(crime_stats_ghent): onjuiste kolomnamen.",
            type = "error"
          )
        }
        identical(got, want)
      }
    )

    # 3) length()
    testEqual(
      "length(crime_stats_ghent) geeft het aantal kolommen terug",
      function(env) length(env$crime_stats_ghent),
      10
    )

    # 4) nrow()
    testEqual(
      "nrow(crime_stats_ghent) geeft het aantal rijen terug",
      function(env) nrow(env$crime_stats_ghent),
      nrow(crimsyndata::crime_stats_ghent)
    )

    # 5) ncol()
    testEqual(
      "ncol(crime_stats_ghent) geeft het aantal kolommen terug",
      function(env) ncol(env$crime_stats_ghent),
      10
    )

    # 6) head()
    testEqual(
      "head(crime_stats_ghent) toont de eerste rijen van het data frame",
      function(env) head(env$crime_stats_ghent),
      head(crimsyndata::crime_stats_ghent)
    )

    # 7) summary()
    testEqual(
      "summary(crime_stats_ghent) geeft een samenvatting van alle kolommen",
      function(env) paste(capture.output(summary(env$crime_stats_ghent)), collapse = "\n"),
      TRUE,
      comparator = function(got, want, ...) {
        get_reporter()$add_message("```r\n> summary(crime_stats_ghent)\n```", type="markdown")
        expected <- c("district", "unemployment_rate", "poverty_rate", "urban_density", "ethnic_diversity", "year", "population", "violent_crimes", "property_crimes", "crime_type")
        if (all(sapply(expected, function(x) grepl(x, got)))) {
          get_reporter()$add_message(
            "✅ summary(crime_stats_ghent): toont frequenties en statistieken.",
            type="markdown"
          )
          TRUE
        } else {
          get_reporter()$add_message(
            "❌ summary(crime_stats_ghent): samenvatting niet zoals verwacht.",
            type="markdown"
          )
          FALSE
        }
      }
    )

    # 8) class()
    testEqual(
      "class(crime_stats_ghent) geeft het type object terug",
      function(env) class(env$crime_stats_ghent)[1],
      "data.frame"
    )

    # 9) dim()
    testEqual(
      "dim(crime_stats_ghent) geeft het aantal rijen en kolommen als vector terug",
      function(env) dim(env$crime_stats_ghent),
      dim(crimsyndata::crime_stats_ghent)
    )

  })
})
