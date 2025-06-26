# bloom_level: Apply & Understand
# scaffolding_level: Medium support
# primm_phase: Predict

#–– Data setup ––
leeftijden_daders <- c(
  19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
  27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
)
# Make sure the data is available in the global environment
assign("leeftijden_daders", leeftijden_daders, envir = globalenv())

# Add the solution: create a summary of the ages
leeftijd_samenvatting <- summary(leeftijden_daders)

#–– Evaluation ––
context({
  testcase("Leeftijd daders beschrijven", {
    testEqual(
      "Beschrijf de leeftijden met de summary() functie",
      function(env) {
        # Compute expected output
        expected <- summary(leeftijden_daders)
        
        # 1. Existence check
        if (!exists('leeftijd_samenvatting', envir=env)) {
          get_reporter()$add_message(
            '❌ Het object `leeftijd_samenvatting` bestaat niet. Maak het aan met `leeftijd_samenvatting <- summary(leeftijden_daders)`.',
            type='error'
          )
          
          # Instructional guidance
          get_reporter()$add_message(
            "Volg deze stappen om een samenvatting te maken:",
            type = "markdown"
          )
          get_reporter()$add_message(
            "1. Gebruik de `summary()` functie op de vector `leeftijden_daders`\n2. Wijs het resultaat toe aan `leeftijd_samenvatting`",
            type = "markdown"
          )
          
          # Show example code
          get_reporter()$add_message(
            "Voorbeeld code:",
            type = "markdown"
          )
          get_reporter()$add_message(
            "```r\nleeftijd_samenvatting <- summary(leeftijden_daders)\n```",
            type = "markdown"
          )
          
          # Show expected output
          get_reporter()$add_message(
            "Dit zou het resultaat moeten zijn:",
            type = "markdown"
          )
          get_reporter()$add_message(
            paste0('```r\n', paste(capture.output(print(expected)), collapse='\n'), '\n```'),
            type = "code"
          )
          
          return(FALSE)
        }
        # 2. Type check
        val <- get('leeftijd_samenvatting', envir=env())
        if (!is.numeric(val) || is.null(names(val))) {
          get_reporter()$add_message(
            '❌ `leeftijd_samenvatting` moet een samenvatting zijn zoals gegeven door summary(leeftijden_daders).',
            type='error'
          )
          
          # Provide detailed guidance
          get_reporter()$add_message(
            'Gebruik de summary-functie direct op leeftijden_daders. Let op het type van het resultaat.',
            type='info'
          )
          
          # Show student's wrong result
          get_reporter()$add_message(
            "Jouw resultaat heeft het verkeerde type:",
            type = "markdown"
          )
          student_class <- paste(class(val), collapse=", ")
          get_reporter()$add_message(
            paste0("```r\nclass: ", student_class, "\n```"),
            type = "markdown"
          )
          
          # Show the correct way
          get_reporter()$add_message(
            "Correcte code:",
            type = "markdown"
          )
          get_reporter()$add_message(
            "```r\nleeftijd_samenvatting <- summary(leeftijden_daders)\n```",
            type = "markdown"
          )
          
          return(FALSE)
        }
        # 3. Value check
        if (!identical(val, expected)) {
          get_reporter()$add_message(
            '❌ De inhoud van `leeftijd_samenvatting` is niet correct. Gebruik summary(leeftijden_daders).',
            type = 'error'
          )
          
          get_reporter()$add_message(
            'Tip: Controleer of je geen extra bewerkingen uitvoert op het resultaat van summary().',
            type = 'info'
          )
          
          # Show both tables for comparison, first student's result
          get_reporter()$add_message(
            "Jouw resultaat:",
            type = "markdown"
          )
          student_output <- capture.output(print(val))
          get_reporter()$add_message(
            paste0('```r\n', paste(student_output, collapse='\n'), '\n```'),
            type = "code"
          )
          
          # Then expected output
          get_reporter()$add_message(
            "Verwachte resultaat:",
            type = "markdown"
          )
          expected_output <- capture.output(print(expected))
          get_reporter()$add_message(
            paste0('```r\n', paste(expected_output, collapse='\n'), '\n```'),
            type = "code"
          )
          
          # Provide correct code example
          get_reporter()$add_message(
            "Correcte code:",
            type = "markdown"
          )
          get_reporter()$add_message(
            "```r\nleeftijd_samenvatting <- summary(leeftijden_daders)\n```",
            type = "markdown"
          )
          
          return(FALSE)
        }
        
        # Success message with emphasis on educational feedback
        get_reporter()$add_message(
          "✅ Goed gedaan! Je hebt `leeftijd_samenvatting` correct aangemaakt met de `summary()` functie.",
          type = "success"
        )
        
        # Explanation of what summary does
        get_reporter()$add_message(
          "De `summary()` functie geeft een statistisch overzicht van numerieke data.",
          type = "info"
        )
        
        # Show summary heading
        get_reporter()$add_message(
          "Statistische samenvatting van de leeftijden:",
          type = "markdown"
        )
        
        # Show summary output as code
        summary_output <- capture.output(print(expected))
        get_reporter()$add_message(paste(summary_output, collapse = "\n"), type = "code")
        
        # Add educational explanation about summary components
        get_reporter()$add_message(
          "Uitleg over de summary componenten:",
          type = "markdown"
        )
        
        get_reporter()$add_message(paste(
          "- **Min**: Minimumwaarde - de jongste dader is 18 jaar",
          "- **1st Qu**: Eerste kwartiel - 25% van de daders is jonger dan 22 jaar",
          "- **Median**: Mediaan - de middelste leeftijd is 27 jaar",
          "- **Mean**: Gemiddelde - de gemiddelde leeftijd is ongeveer 28 jaar",
          "- **3rd Qu**: Derde kwartiel - 75% van de daders is jonger dan 33.5 jaar",
          "- **Max**: Maximumwaarde - de oudste dader is 45 jaar",
          sep = "\n"
        ), type = "markdown")
        
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

# Modeloplossing (dit is de correcte oplossing):
# leeftijd_samenvatting <- summary(leeftijden_daders)
