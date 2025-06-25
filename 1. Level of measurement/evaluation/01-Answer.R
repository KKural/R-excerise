# Evaluation script for Basisfuncties op `df_crime_data`

context({
  testcase("Feedback bij basisfuncties op df_crime_data", {
    testEqual("str(df_crime_data) toont de structuur van het data frame",
      function(env) paste(capture.output(str(env$df_crime_data)), collapse = "\n"),
      paste(capture.output(str(df_crime_data)), collapse = "\n")
    )
    testEqual("names(df_crime_data) geeft de kolomnamen terug",
      function(env) names(env$df_crime_data),
      names(df_crime_data)
    )
    testEqual("length(df_crime_data) geeft het aantal kolommen terug",
      function(env) length(env$df_crime_data),
      length(df_crime_data)
    )
    testEqual("nrow(df_crime_data) geeft het aantal rijen terug",
      function(env) nrow(env$df_crime_data),
      nrow(df_crime_data)
    )
    testEqual("ncol(df_crime_data) geeft het aantal kolommen terug",
      function(env) ncol(env$df_crime_data),
      ncol(df_crime_data)
    )
    testEqual("head(df_crime_data) toont de eerste rijen van het data frame",
      function(env) head(env$df_crime_data),
      head(df_crime_data)
    )
    testEqual("summary(df_crime_data) geeft een samenvatting van alle kolommen",
      function(env) paste(capture.output(summary(env$df_crime_data)), collapse = "\n"),
      paste(capture.output(summary(df_crime_data)), collapse = "\n")
    )
    testEqual("class(df_crime_data) geeft het type object terug",
      function(env) class(env$df_crime_data)[1],
      class(df_crime_data)[1]
    )
    testEqual("dim(df_crime_data) geeft het aantal rijen en kolommen als vector terug",
      function(env) dim(env$df_crime_data),
      dim(df_crime_data)
    )
  })
}, preExec = {
  df_crime_data <- data.frame(
    type = factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"), levels = c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
    ernst = factor(c("Licht", "Matig", "Ernstig", "Matig", "Licht"), ordered = TRUE, levels = c("Licht", "Matig", "Ernstig")),
    leeftijd  = c(19, 23, 45, 32, 28),
    district = c("A1", "B2", "C3", "D4", "E5"),
    stringsAsFactors = FALSE
  )
})
