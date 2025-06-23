# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Feedback bij variabele aanmaken", {
    testEqual(
      "inbraken is correct gedefinieerd",
      function(env) env$inbraken,
      146,
      comparator = function(got, want, ...) {
        # The variable 'inbraken' is not defined. Please create this variable.
        if (is.null(got)) {
          get_reporter()$add_message(
            "❌ De variabele 'inbraken' is niet gedefinieerd. Maak deze variabele aan.",
            type = "error"
          )
          return(FALSE)
        }
        # The variable 'inbraken' should be a numeric value, not a ...
        if (!is.numeric(got)) {
          get_reporter()$add_message(
            paste0("❌ De variabele 'inbraken' moet een numerieke waarde zijn, geen ", class(got), "."),
            type = "error"
          )
          return(FALSE)
        }
        # Expected 'inbraken' to be 146, but got ...
        if (got != want) {
          get_reporter()$add_message(
            paste0("❌ Verwachtte waarde voor 'inbraken' is ", want, ", maar kreeg ", got, "."),
            type = "error"
          )
          return(FALSE)
        }
        # Correct! You've successfully assigned the value 146 to the 'inbraken' variable.
        get_reporter()$add_message(
          "✅ Goed gedaan! Je hebt de waarde 146 correct toegekend aan de variabele 'inbraken'.",
          type = "success"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Geen setup nodig voor deze eenvoudige oefening
})

# Verwachte antwoorden:
# inbraken <- 146