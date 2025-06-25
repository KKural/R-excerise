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
        if (result$type == "correct") {
          # Compose feedback string with command, output, and confirmation
          feedback <- paste0(
            '```r\n> summary(leeftijden_daders)\n```\n',
            '```r\n', paste(capture.output(print(result$expected)), collapse='\n'), '\n```\n',
            'Juist! `leeftijd_samenvatting` zal het bovenstaande resultaat opleveren'
          )
          return(feedback)
        }
        # For incorrect cases, still show command and output, then error message
        error_msgs <- list(
          "no_var"      = "❌ Het object `leeftijd_samenvatting` bestaat niet of bevat een fout. Controleer je code en probeer opnieuw.",
          "not_summary" = "❌ `leeftijd_samenvatting` moet een samenvatting zijn zoals gegeven door summary(leeftijden_daders).",
          "wrong_val"   = "❌ De inhoud van `leeftijd_samenvatting` is niet correct. Gebruik summary(leeftijden_daders)."
        )
        feedback <- paste0(
          '```r\n> summary(leeftijden_daders)\n```\n',
          '```r\n', paste(capture.output(print(result$expected)), collapse='\n'), '\n```\n',
          error_msgs[[result$type]]
        )
        return(feedback)
      },
      paste0(
        '```r\n> summary(leeftijden_daders)\n```\n',
        '```r\n', paste(capture.output(print(summary(leeftijden_daders))), collapse='\n'), '\n```\n',
        'Juist! `leeftijd_samenvatting` zal het bovenstaande resultaat opleveren'
      ),
      comparator = function(generated, expected, ...) {
        # Accept if the feedback matches expected (for correct), or starts with the command for errors
        if (identical(generated, expected)) return(TRUE)
        startsWith(generated, '```r\n> summary(leeftijden_daders)')
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