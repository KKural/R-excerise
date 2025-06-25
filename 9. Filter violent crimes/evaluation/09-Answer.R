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
    testEqual({
      # 1. Always emit the command
      get_reporter()$add_message('```r\n> subset(misdaad_data, delict %in% c("Aanval", "Overval", "Moord"))\n```', type='markdown')
      # 2. Compute expected output
      expected <- subset(get("misdaad_data", envir = env()), delict %in% c("Aanval", "Overval", "Moord"))
      get_reporter()$add_message(
        paste0('```r\n', paste(capture.output(print(expected)), collapse='\n'), '\n```'),
        type='markdown'
      )
      # 3. Existence check
      if (!exists('geweldsdelicten_df', envir=env())) {
        get_reporter()$add_message(
          '❌ De variabele `geweldsdelicten_df` bestaat niet.',
          type='error'
        )
        return(FALSE)
      }
      # 4. Type check
      if (!is.data.frame(get('geweldsdelicten_df', envir=env()))) {
        get_reporter()$add_message(
          '❌ `geweldsdelicten_df` moet een data frame zijn met alleen gewelddadige misdrijven.',
          type='error'
        )
        return(FALSE)
      }
      # 5. Value check
      if (!identical(get('geweldsdelicten_df', envir=env()), expected)) {
        get_reporter()$add_message(
          '❌ De inhoud van `geweldsdelicten_df` is niet correct. Gebruik subset(misdaad_data, delict %in% c("Aanval", "Overval", "Moord")).',
          type='error'
        )
        return(FALSE)
      }
      # 6. Success: show the expected output as justification
      get_reporter()$add_message(
        '✅ Correct! De data frame is correct gefilterd en opgeslagen in `geweldsdelicten_df`.',
        type='success'
      )
      return(TRUE)
    }, expected = TRUE)
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