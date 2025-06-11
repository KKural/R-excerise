# evaluation/inspect_names.R

context({
  testcase("names(crime_df) prints correct columns", {
    expected <- c(
      "incident_id",
      "date",
      "district",
      "crime_type",
      "value_loss",
      "officers_sent",
      "response_time"
    )
    testEqual(
      "Output of names(crime_df)",
      function(env) {
        env$evaluationResult
      },
      expected,
      comparator = function(got, want, ...) {
        if (!is.character(got)) {
          get_reporter()$add_message(
            "❌ Please run `names(crime_df)` (don’t assign it).",
            type = "error"
          )
          return(FALSE)
        }
        if (!identical(got, want)) {
          get_reporter()$add_message(
            paste0(
              "❌ Expected: ", paste(want, collapse = ", "),
              "\nYou returned: ", paste(got, collapse = ", ")
            ),
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Correct! You ran `names(crime_df)` and got the right columns.",
          type = "success"
        )
        TRUE
      }
    )
  })
}, preExec = {
  # ───────────────────────────────────────────────────────────────
  # Define crime_df here so it exists for the student code
  # ───────────────────────────────────────────────────────────────
  library(tibble)
  library(dplyr)
  set.seed(42)
  crime_df <- tibble(
    incident_id    = sprintf("INC%03d", 1:200),
    date           = sample(
                       seq.Date(as.Date("2023-01-01"),
                                as.Date("2023-12-31"), by = "day"),
                       200, replace = TRUE
                     ),
    district       = sample(c("A","B","C","D"), 200, replace = TRUE,
                            prob = c(0.4,0.3,0.2,0.1)),
    crime_type     = sample(c("Burglary","Assault","Theft","Vandalism"),
                            200, replace = TRUE),
    value_loss     = round(rlnorm(200, meanlog = 3, sdlog = 1)),
    officers_sent  = sample(1:5, 200, replace = TRUE),
    response_time  = round(rnorm(200, mean = 12, sd = 4), 1)
  ) %>%
    mutate(response_time = pmax(response_time, 0))
})
