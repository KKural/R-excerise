context({
  testcase("Generate frequency table using table()", {
    testEqual(
      "Content of offense_table variable",
      function(env) { 
        if (!exists("offense_table", envir = env)) {
          return(NULL)
        }
        return(as.vector(env$offense_table))
      },
      c(4, 4, 2, 7, 3),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'offense_table' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!is.table(get_student_env()$offense_table)) {
          get_reporter()$add_message("❌ The variable 'offense_table' should be a table object, not a " + class(get_student_env()$offense_table) + ".", type = "error")
          return(FALSE)
        }
        
        expected_names <- c("Assault", "Burglary", "Drug Offense", "Theft", "Vandalism")
        actual_names <- names(get_student_env()$offense_table)
        
        # Check for missing categories
        if (length(setdiff(expected_names, actual_names)) > 0) {
          missing_categories <- setdiff(expected_names, actual_names)
          get_reporter()$add_message(paste0("❌ Your frequency table is missing these categories: ", paste(missing_categories, collapse = ", ")), type = "error")
          return(FALSE)
        }
        
        # Get frequencies in the right order
        expected_frequencies <- c(4, 4, 2, 7, 3)
        actual_frequencies <- numeric(0)
        
        for (name in expected_names) {
          if (name %in% actual_names) {
            actual_frequencies <- c(actual_frequencies, get_student_env()$offense_table[name])
          } else {
            actual_frequencies <- c(actual_frequencies, 0)
          }
        }
        
        if (!identical(actual_frequencies, expected_frequencies)) {
          get_reporter()$add_message(paste0("❌ The frequencies in your table don't match the expected values."), type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've successfully created a frequency table of offense types.", type = "success")
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Set up the offense_types vector
  offense_types <- c("Theft", "Assault", "Burglary", "Vandalism", "Theft", "Theft", 
                   "Assault", "Theft", "Burglary", "Vandalism", "Theft", "Assault", 
                   "Drug Offense", "Theft", "Burglary", "Vandalism", "Assault", 
                   "Theft", "Drug Offense", "Burglary")
})

# Model solution:
offense_table <- table(offense_types)