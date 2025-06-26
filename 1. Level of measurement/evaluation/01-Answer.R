# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      function(env) {
        # Always return FALSE initially - we'll rely entirely on judging the solution manually
        return(FALSE)
      },
      TRUE,
      comparator = function(got, want, ...) {
        # Manually check if the student submission includes str(df_crime_data)
        tryCatch({
          student_code <- readLines(file.path(testimonium:::get_source_location(), "student.R"))
          student_code_text <- paste(student_code, collapse = " ")
          
          if (grepl("str\\s*\\(\\s*df_crime_data\\s*\\)", student_code_text)) {
            get_reporter()$add_message("✅ Correct! Je hebt str() gebruikt om de structuur van df_crime_data te bekijken.", type = "success")
            return(TRUE)
          } else {
            get_reporter()$add_message("❌ Je moet de str() functie gebruiken om de structuur van df_crime_data te bekijken.", type = "error")
            return(FALSE)
          }
        }, 
        error = function(e) {
          # If ANY error occurs in the code above, default to showing the full error message
          get_reporter()$add_message("❌ Je moet de str() functie gebruiken om de structuur van df_crime_data te bekijken.", type = "error")
          return(FALSE)
        })
      }
    )
  })
}, preExec = {
  # Create the simplest possible dataframe
  df_crime_data <- data.frame(
    type = c("Theft", "Assault", "Burglary", "Fraud", "Vandalism"),
    count = c(12, 5, 8, 3, 7)
  )
})
