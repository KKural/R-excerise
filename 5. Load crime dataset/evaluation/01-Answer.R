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
  # Create a simulated crime data file
  library(tibble)
  library(dplyr)
  
  set.seed(42)
  crime_df <- tibble(
    incident_id    = sprintf("INC%03d", 1:200),
    date           = sample(seq.Date(as.Date("2023-01-01"), as.Date("2023-12-31"), by = "day"), 200, replace = TRUE),
    district       = sample(c("A", "B", "C", "D"), 200, replace = TRUE, prob = c(0.4, 0.3, 0.2, 0.1)),
    crime_type     = sample(c("Burglary", "Assault", "Theft", "Vandalism"), 200, replace = TRUE),
    value_loss     = round(rlnorm(200, meanlog = 3, sdlog = 1)),
    officers_sent  = sample(1:5, 200, replace = TRUE),
    response_time  = round(rnorm(200, mean = 12, sd = 4), 1)
  ) %>% mutate(response_time = pmax(response_time, 0))
  
  # Save the data to a temporary file that will act as our "crime_data.csv"
  temp_dir <- tempdir()
  bestandspad <- file.path(temp_dir, "crime_data.csv")
  write.csv(crime_df, file = bestandspad, row.names = FALSE)
  # Do NOT overwrite bestandspad here; student should use this variable
})

# Verwachte antwoorden:
# misdaad_df <- read.csv(bestandspad)

context({
  testcase("Feedback bij laden van dataset", {
    testEqual(
      "misdaad_df is correct ingeladen",
      function(env) {
        exists("misdaad_df", envir = env) && is.data.frame(env$misdaad_df)
      },
      TRUE,
      comparator = function(got, want, ...) {
        # The variable 'misdaad_df' should exist and be a data frame loaded from bestandspad.
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'misdaad_df' moet bestaan en een data frame zijn dat is ingeladen vanuit bestandspad.",
            type = "error"
          )
        } else {
          # Correct! The dataset was loaded into 'misdaad_df'.
          get_reporter()$add_message(
            "✅ De dataset is correct ingeladen in 'misdaad_df'.",
            type = "success"
          )
        }
        got == want
      }
    )
  })
})