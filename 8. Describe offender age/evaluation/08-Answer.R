#–– Data setup ––
leeftijden_daders <- c(
  19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
  27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
)
# Make sure the data is available in the global environment
assign("leeftijden_daders", leeftijden_daders, envir = globalenv())

#–– Evaluation ––
context({
  testcase("", {
    testEqual(
      "",
      function(env) {
        # Compute expected output
        expected <- summary(leeftijden_daders)
        
        # 1. Existence check
        if (!exists('leeftijd_samenvatting', envir=env)) {
          get_reporter()$add_message('❌ Het object `leeftijd_samenvatting` bestaat niet. Maak het aan met `leeftijd_samenvatting <- summary(leeftijden_daders)`.', type='error')
          get_reporter()$add_message('```r\n> summary(leeftijden_daders)\n```', type='markdown')
          get_reporter()$add_message(paste0('```r\n', paste(capture.output(print(expected)), collapse='\n'), '\n```'), type='markdown')
          return(FALSE)
        }
        # 2. Type check
        val <- get('leeftijd_samenvatting', envir=env())
        if (!is.numeric(val) || is.null(names(val))) {
          get_reporter()$add_message('❌ `leeftijd_samenvatting` moet een samenvatting zijn zoals gegeven door summary(leeftijden_daders).', type='error')
          get_reporter()$add_message('Tip: Gebruik de summary-functie direct op leeftijden_daders.', type='info')
          get_reporter()$add_message('```r\n> summary(leeftijden_daders)\n```', type='markdown')
          get_reporter()$add_message(paste0('```r\n', paste(capture.output(print(expected)), collapse='\n'), '\n```'), type='markdown')
          return(FALSE)
        }
        # 3. Value check
        if (!identical(val, expected)) {
          get_reporter()$add_message('❌ De inhoud van `leeftijd_samenvatting` is niet correct. Gebruik summary(leeftijden_daders).', type='error')
          get_reporter()$add_message('Tip: Controleer of je geen extra bewerkingen uitvoert.', type='info')
          
          # Toon de verwachte output
          get_reporter()$add_message('Verwachte inhoud:', type='markdown')
          get_reporter()$add_message('```r\n> summary(leeftijden_daders)\n```', type='markdown')
          get_reporter()$add_message(paste0('```r\n', paste(capture.output(print(expected)), collapse='\n'), '\n```'), type='markdown')
          
          # Toon wat de student heeft gemaakt
          get_reporter()$add_message('Jouw resultaat:', type='markdown')
          student_output <- paste0('```r\n', paste(capture.output(print(val)), collapse='\n'), '\n```')
          get_reporter()$add_message(student_output, type='markdown')
          
          return(FALSE)
        }
        
        # 4. Success: show the correct output as justification
        get_reporter()$add_message('✅ Juist! `leeftijd_samenvatting` is correct aangemaakt.', type='success')
        
        # Voeg educatieve uitleg toe
        get_reporter()$add_message('## Uitleg over summary():', type='markdown')
        get_reporter()$add_message('De `summary()` functie geeft een statistisch overzicht van numerieke data:', type='markdown')
        get_reporter()$add_message(paste(
          "- Min: Minimumwaarde",
          "- 1st Qu: Eerste kwartiel (25% van de waarden zijn lager)",
          "- Median: Mediaan (middelste waarde)",
          "- Mean: Gemiddelde waarde",
          "- 3rd Qu: Derde kwartiel (75% van de waarden zijn lager)",
          "- Max: Maximumwaarde",
          sep = "\n"
        ), type='markdown')
        
        get_reporter()$add_message('```r\n> summary(leeftijden_daders)\n```', type='markdown')
        get_reporter()$add_message(paste0('```r\n', paste(capture.output(print(expected)), collapse='\n'), '\n```'), type='markdown')
        
        return(TRUE)
      },
      TRUE
    )
  })
}, preExec = {
  # Pre‐execution: make the vector available to both student code & tests
  leeftijden_daders <- c(
    19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
    27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
  )
  
  # Also make it available globally
  assign("leeftijden_daders", leeftijden_daders, envir = globalenv())
})

# Modeloplossing:
# leeftijd_samenvatting <- summary(leeftijden_daders)