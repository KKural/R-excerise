# Evaluation – Het laden van de crime dataset
# ------------------------------------------

context({
  # preExec: build a CSV in a temp folder and expose 'bestandspad'
}, preExec = {
  library(tibble); library(dplyr)

  set.seed(42)

  crime_df <- tibble(
    zaak_id    = sprintf("ZAAK%03d", 1:200),
    datum      = sample(
                   seq.Date(as.Date("2023-01-01"), as.Date("2023-12-31"), "day"),
                   200, TRUE),
    district   = sample(c("A","B","C","D"), 200, TRUE, prob = c(.4,.3,.2,.1)),
    misdaad_type = sample(c("Inbraak","Aanval","Diefstal","Vandalisme"), 200, TRUE),
    waardeverlies      = round(rlnorm(200, 3, 1)),
    agenten_uitgezonden = sample(1:5, 200, TRUE),
    reactietijd         = round(pmax(rnorm(200, 12, 4), 0), 1)
  )

  bestandspad <- file.path(tempdir(), "misdaad_data.csv")
  write.csv(crime_df, bestandspad, row.names = FALSE)
})

# -----------------  Tests -----------------
context({
  testcase("Dataset laden", {
    testEqual(
      "misdaad_df bestaat en is data.frame",
      function(env) exists("misdaad_df", env) && is.data.frame(env$misdaad_df),
      TRUE,
      comparator = function(got, want, ...) {
        if (got) {
          get_reporter()$add_message(
            "✅  Goed gedaan! Je hebt het CSV-bestand met `read.csv(bestandspad)` ingelezen in **misdaad_df**.",
            type = "success")
        } else {
          get_reporter()$add_message(
            "❌  Maak een variabele `misdaad_df` door `read.csv(bestandspad)` uit te voeren.",
            type = "error")
        }
        got
      }
    )
  })
})
