# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run
# Model solution:
context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        1,  # the correct choice: crimes <- 25
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            # 1: crimes <- 25
            "1" = "✅ Juist! In R gebruiken we bij voorkeur de toewijzingsoperator `<-` om waarden toe te wijzen aan variabelen.",
            # 2: crimes == 25
            "2" = "❌ Fout. `==` is een vergelijking, geen toewijzing.",
            # 3: crimes -> 25
            "3" = "❌ Fout. `->` is geen conventionele toewijzing in R.",
            # 4: crimes => 25
            "4" = "❌ Fout. `=>` is geen geldige operator in R."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})
