#–– Data setup ––
leeftijden_daders <- c(
  19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
  27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
)

#–– Evaluation ––
context({
  testcase("Feedback bij samenvatting leeftijden", {
    testEqual({
      # 1. Always emit the command
      get_reporter()$add_message('```r\n> summary(leeftijden_daders)\n```', type='markdown')
      # 2. Compute expected output
      expected <- summary(get("leeftijden_daders", envir = env()))
      get_reporter()$add_message(
        paste0('```r\n', paste(capture.output(print(expected)), collapse='\n'), '\n```'),
        type='markdown'
      )
      # 3. Existence check
      if (!exists('leeftijd_samenvatting', envir=env())) {
        get_reporter()$add_message(
          '❌ Het object `leeftijd_samenvatting` bestaat niet of bevat een fout. Controleer je code en probeer opnieuw.',
          type='error'
        )
        return(FALSE)
      }
      # 4. Type check
      val <- get('leeftijd_samenvatting', envir=env())
      if (!is.numeric(val) || is.null(names(val))) {
        get_reporter()$add_message(
          '❌ `leeftijd_samenvatting` moet een samenvatting zijn zoals gegeven door summary(leeftijden_daders).',
          type='error'
        )
        return(FALSE)
      }
      # 5. Value check
      if (!identical(val, expected)) {
        get_reporter()$add_message(
          '❌ De inhoud van `leeftijd_samenvatting` is niet correct. Gebruik summary(leeftijden_daders).',
          type='error'
        )
        return(FALSE)
      }
      # 6. Success: show the expected output as justification
      get_reporter()$add_message(
        '✅ Juist! `leeftijd_samenvatting` zal het bovenstaande resultaat opleveren',
        type='success'
      )
      return(TRUE)
    }, expected = TRUE)
  })
}, preExec = {
  # Pre‐execution: make the vector available to both student code & tests
  leeftijden_daders <- c(
    19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
    27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
  )
})