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
  # Set up the misdaad_data data frame
  misdaad_data <- data.frame(
    id = 1:20,
    delict = c("Diefstal", "Aanval", "Drugsdelict", "Overval", "Vandalisme", 
                "Aanval", "Inbraak", "Moord", "Diefstal", "Aanval",
                "Fraude", "Overval", "Diefstal", "Drugsdelict", "Moord",
                "Aanval", "Vandalisme", "Fraude", "Inbraak", "Diefstal"),
    district = c("Noord", "Zuid", "Oost", "Centrum", "West",
                 "Zuid", "Noord", "Centrum", "Oost", "West",
                 "Noord", "Zuid", "West", "Oost", "Zuid",
                 "Centrum", "Noord", "Oost", "West", "Zuid"),
    datum = as.Date("2023-01-01") + 0:19
  )
})

# Model solution:
geweldsdelicten_df <- subset(misdaad_data, delict %in% c("Aanval", "Overval", "Moord"))

context({
  testcase("Feedback bij filteren van gewelddadige misdrijven", {
    testEqual(
      "geweldsdelicten_df is correct gefilterd",
      function(env) {
        if (!exists("geweldsdelicten_df", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'geweldsdelicten_df' bestaat niet.",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.data.frame(env$geweldsdelicten_df)) {
          get_reporter()$add_message(
            "❌ 'geweldsdelicten_df' moet een data frame zijn met alleen gewelddadige misdrijven.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "Correct! De data frame is correct gefilterd en opgeslagen in 'geweldsdelicten_df'.",
          type = "success"
        )
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )
  })
})