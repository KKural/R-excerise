#–– Data setup ––
leeftijden_daders <- c(
  19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
  27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
)

#–– Evaluation ––
context({
  testcase("Feedback bij samenvatting leeftijden", {
    testEqual(
      "",
      function(env) {
        result <- tryCatch({
          val <- get("leeftijd_samenvatting", envir = env)
          expected <- summary(env$leeftijden_daders)
          if (!is.numeric(val) || is.null(names(val))) return("not_summary")
          if (!identical(val, expected)) return("wrong_val")
          return("correct")
        }, error = function(e) {
          return("no_var")
        })
        result
      },
      "correct",
      comparator = function(generated, expected, ...) {
        feedbacks <- list(
          "no_var"      = "❌ Het object `leeftijd_samenvatting` bestaat niet of bevat een fout. Controleer je code en probeer opnieuw.",
          "not_summary" = "❌ `leeftijd_samenvatting` moet een samenvatting zijn zoals gegeven door summary(leeftijden_daders).",
          "wrong_val"   = "❌ De inhoud van `leeftijd_samenvatting` is niet correct. Gebruik summary(leeftijden_daders).",
          "correct"     = "✅ Correct! De samenvatting is correct aangemaakt en opgeslagen in `leeftijd_samenvatting`."
        )
        get_reporter()$add_message(feedbacks[[generated]], type = ifelse(generated == "correct", "success", "error"))
        generated == expected
      }
    )
  })
}, preExec = {
  # Pre‐execution: make the vector available to both student code & tests
  leeftijden_daders <- c(
    19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
    27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
  )
})