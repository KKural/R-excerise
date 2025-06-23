# Evaluation script – “Het laden van de crime dataset”

context({
  # ----------------------------
  # preExec: maak het CSV-bestand
  # ----------------------------
}, preExec = {
  library(tibble)
  library(dplyr)

  set.seed(42)

  crime_df <- tibble(
    zaak_id    = sprintf("ZAAK%03d", 1:200),
    datum      = sample(seq.Date(as.Date("2023-01-01"),
                                 as.Date("2023-12-31"), by = "day"), 200, TRUE),
    district   = sample(c("A","B","C","D"), 200, TRUE, prob = c(.4,.3,.2,.1)),
    misdaad_type = sample(c("Inbraak","Aanval","Diefstal","Vandalisme"),
                          200, TRUE),
    waardeverlies      = round(rlnorm(200, 3, 1)),
    agenten_uitgezonden = sample(1:5, 200, TRUE),
    reactietijd         = round(pmax(rnorm(200, 12, 4), 0), 1)
  )

  temp_dir    <- tempdir()
  bestandspad <- file.path(temp_dir, "crime_data.csv")
  write.csv(crime_df, bestandspad, row.names = FALSE)
})

# ----------------------------
# Tests
# ----------------------------
context({
  testcase("Feedback bij laden van dataset", {
    testEqual(
      "misdaad_df is correct ingeladen",
      function(env) {
        exists("misdaad_df", env) && is.data.frame(env$misdaad_df)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (got) {
          get_reporter()$add_message(
            "✅ De dataset is correct ingeladen in `misdaad_df`.",
            type = "success"
          )
        } else {
          get_reporter()$add_message(
            "❌ De variabele `misdaad_df` moet bestaan en een data frame zijn "
            |> paste("dat is ingeladen met `read.csv(bestandspad)`."),
            type = "error"
          )
        }
        got == want
      }
    )
  })
})
