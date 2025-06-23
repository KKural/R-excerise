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
        2,  # the correct choice: mean() is the function for average
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            # 1: average()
            "1" = "❌ Fout. `average()` bestaat niet als ingebouwde functie in R.",
            # 2: mean()
            "2" = "✅ Juist! De `mean()` functie wordt in R gebruikt om het rekenkundig gemiddelde te berekenen.",
            # 3: median()
            "3" = "❌ Fout. `median()` berekent de mediaan, niet het gemiddelde.",
            # 4: sum()
            "4" = "❌ Fout. `sum()` berekent de som, niet het gemiddelde."
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
