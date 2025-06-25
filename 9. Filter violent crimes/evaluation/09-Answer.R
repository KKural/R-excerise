# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

#–– Data setup ––
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

#–– Evaluation ––
context({
  testcase("Feedback bij filteren van gewelddadige misdrijven", {
    testEqual(
      "",
      function(env) {
        result <- tryCatch({
          df <- get("geweldsdelicten_df", envir = env)
          if (!is.data.frame(df)) return("not_df")
          expected <- subset(env$misdaad_data, delict %in% c("Aanval", "Overval", "Moord"))
          if (!identical(df, expected)) return("wrong_val")
          return("correct")
        }, error = function(e) {
          return("no_var")
        })
        result
      },
      "correct",
      comparator = function(generated, expected, ...) {
        feedbacks <- list(
          "no_var"   = "❌ De data frame `geweldsdelicten_df` bestaat niet of bevat een fout. Controleer je code en probeer opnieuw.",
          "not_df"   = "❌ `geweldsdelicten_df` moet een data frame zijn met alleen gewelddadige misdrijven.",
          "wrong_val"= "❌ De inhoud van `geweldsdelicten_df` is niet correct. Gebruik subset(misdaad_data, delict %in% c(\"Aanval\", \"Overval\", \"Moord\")).",
          "correct"  = "✅ Correct! De data frame is correct gefilterd en opgeslagen in `geweldsdelicten_df`."
        )
        get_reporter()$add_message(feedbacks[[generated]], type = ifelse(generated == "correct", "success", "error"))
        generated == expected
      }
    )
  })
}, preExec = {
  # Pre‐execution: make the data frame available to both student code & tests
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

# Modeloplossing:
geweldsdelicten_df <- subset(misdaad_data, delict %in% c("Aanval", "Overval", "Moord"))