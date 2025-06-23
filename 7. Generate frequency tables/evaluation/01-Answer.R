# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      function(env) { NULL },
      NULL,
      comparator = function(got, want, ...) {
        TRUE
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

# Verwachte antwoorden:
# frequentietabel_misdrijven <- table(type_misdrijf)

# Model solution:
offense_table <- table(offense_types)

context({
  testcase("Feedback bij frequentietabel", {
    testEqual(
      "offense_table is correct aangemaakt",
      function(env) {
        exists("offense_table", envir = env) && is.table(env$offense_table)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # The variable 'offense_table' should exist and be a table created from offense_types.
          get_reporter()$add_message(
            "❌ De variabele 'offense_table' moet bestaan en een frequentietabel zijn gemaakt van offense_types.",
            type = "error"
          )
        } else {
          # Correct! The frequency table was created and stored in 'offense_table'.
          get_reporter()$add_message(
            "✅ De frequentietabel is correct aangemaakt en opgeslagen in 'offense_table'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})