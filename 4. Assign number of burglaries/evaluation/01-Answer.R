context({
  testcase("Variable 'burglaries' is correctly defined", {
    testEqual(
      "Value of the 'burglaries' variable",
      function(env) { env$burglaries },
      146,
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'burglaries' is not defined. Please create this variable.", type = "error")
          return(FALSE)
        }
        if (!is.numeric(got)) {
          get_reporter()$add_message("❌ The variable 'burglaries' should be a numeric value, not a " + class(got) + ".", type = "error")
          return(FALSE)
        }
        if (got != want) {
          get_reporter()$add_message(paste0("❌ Expected 'burglaries' to be ", want, ", but got ", got, "."), type = "error")
          return(FALSE)
        }
        get_reporter()$add_message("✅ Correct! You've successfully assigned the value 146 to the 'burglaries' variable.", type = "success")
        return(TRUE)
      }
    )
  })
}, preExec = {
  # No setup needed for this simple exercise
})

# Model solution:
burglaries <- 146