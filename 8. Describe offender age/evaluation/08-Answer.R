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
          list(type = if (!is.numeric(val) || is.null(names(val))) "not_summary"
                      else if (!identical(val, expected)) "wrong_val"
                      else "correct",
               val = val, expected = expected)
        }, error = function(e) {
          list(type = "no_var", val = NULL, expected = summary(env$leeftijden_daders))
        })
        # Always emit the command and expected output as in answer 7
        get_reporter()$add_message('```r\n> summary(leeftijden_daders)\n```', type='markdown')
        get_reporter()$add_message(
          paste0('```r\n', paste(capture.output(print(result$expected)), collapse='\n'), '\n```'),
          type='markdown'
        )
        result$type  # Only return the type for the comparator
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