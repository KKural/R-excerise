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
        exists("geweldsdelicten_df", envir = env) && is.data.frame(env$geweldsdelicten_df)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'geweldsdelicten_df' moet bestaan en een data frame zijn met alleen gewelddadige misdrijven.",
            type = "error"
          )
        } else {
          get_reporter()$add_message(
            "✅ De data frame is correct gefilterd en opgeslagen in 'geweldsdelicten_df'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})