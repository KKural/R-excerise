# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Feedback bij variabele aanmaken", {
    testEqual(
      "burglaries is correct gedefinieerd",
      function(env) env$burglaries,
      146,
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          # The variable 'burglaries' is not defined. Please create this variable.
          get_reporter()$add_message(
            "❌ De variabele 'burglaries' is niet gedefinieerd. Maak deze variabele aan.",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.numeric(got)) {
          # The variable 'burglaries' should be a numeric value, not a ...
          get_reporter()$add_message(
            paste0("❌ De variabele 'burglaries' moet een numerieke waarde zijn, geen ", class(got), "."),
            type = "error"
          )
          return(FALSE)
        }
        if (got != want) {
          # Expected 'burglaries' to be 146, but got ...
          get_reporter()$add_message(
            paste0("❌ Verwachtte waarde voor 'burglaries' is ", want, ", maar kreeg ", got, "."),
            type = "error"
          )
          return(FALSE)
        }
        # Correct! You've successfully assigned the value 146 to the 'burglaries' variable.
        get_reporter()$add_message(
          "✅ Goed gedaan! Je hebt de waarde 146 correct toegekend aan de variabele 'burglaries'.",
          type = "success"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  # No setup needed for this simple exercise
})

# Model solution:
burglaries <- 146