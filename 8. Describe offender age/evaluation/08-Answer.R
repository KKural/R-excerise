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
          if (!is.numeric(val) || is.null(names(val))) return(list(type="not_summary", val=val, expected=expected))
          if (!identical(val, expected)) return(list(type="wrong_val", val=val, expected=expected))
          return(list(type="correct", val=val, expected=expected))
        }, error = function(e) {
          return(list(type="no_var", val=NULL, expected=NULL))
        })
        result
      },
      list(type="correct", val=NULL, expected=NULL),
      comparator = function(generated, expected, ...) {
        feedbacks <- list(
          "no_var"      = "❌ Het object `leeftijd_samenvatting` bestaat niet of bevat een fout. Controleer je code en probeer opnieuw.",
          "not_summary" = "❌ `leeftijd_samenvatting` moet een samenvatting zijn zoals gegeven door summary(leeftijden_daders).",
          "wrong_val"   = "❌ De inhoud van `leeftijd_samenvatting` is niet correct. Gebruik summary(leeftijden_daders).",
          "correct"     = "✅ Correct! De samenvatting is correct aangemaakt en opgeslagen in `leeftijd_samenvatting`."
        )
        msg <- feedbacks[[generated$type]]
        # Add code chunk output for student's value and expected value if not correct
        if (generated$type == "wrong_val" || generated$type == "not_summary") {
          msg <- paste0(
            msg,
            "\n\nJouw output:\n```r\n", paste(capture.output(print(generated$val)), collapse='\n'), "\n```\n",
            "Verwachte output:\n```r\n", paste(capture.output(print(generated$expected)), collapse='\n'), "\n```")
        }
        if (generated$type == "correct") {
          msg <- paste0(
            msg,
            "\n\nJuiste output:\n```r\n", paste(capture.output(print(generated$val)), collapse='\n'), "\n```")
        }
        get_reporter()$add_message(msg, type = ifelse(generated$type == "correct", "success", "error"))
        generated$type == expected$type
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