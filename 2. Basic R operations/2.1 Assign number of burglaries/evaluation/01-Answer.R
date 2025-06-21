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
  
  testcase("Check if variable was created using assignment operator", {
    testEqual(
      "Code used for assignment",
      function(env) { 
        # This is just a placeholder since we can't directly check the code used
        # The real test happens in the comparator
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        # Get the submitted code
        code <- toString(get_student_code())
        
        # Check if the code contains the assignment operator
        if (!grepl("burglaries\\s*<-\\s*146", code) && !grepl("burglaries\\s*=\\s*146", code)) {
          get_reporter()$add_message("⚠️ Make sure you're using the assignment operator '<-' or '=' to assign the value 146 to the variable 'burglaries'.", type = "warning")
          # We don't fail the test, just provide a warning
        }
        return(TRUE)
      }
    )
  })
}, preExec = {
  # No setup needed for this simple exercise
})

# Model solution:
burglaries <- 146