# evaluation.R  –  Het laden van de crime dataset
# ------------------------------------------------

context({

  # ------------------  TESTS  ------------------
  testcase("Gebruik van getwd() en setwd()", {

    # Student source as one string
    student_code <- paste(readLines(env$`.__code__`), collapse = "\n")

    testTrue("`getwd()` is gebruikt",
             grepl("getwd\\s*\\(", student_code))

    testTrue("`setwd()` is gebruikt",
             grepl("setwd\\s*\\(", student_code))
  })

  testcase("Dataset correct ingeladen", {
    testEqual(
      "misdaad_df bestaat en is data.frame",
      function(env) exists("misdaad_df", env) && is.data.frame(env$misdaad_df),
      TRUE
    )
  })

}, preExec = {

  # -------- maak tijdelijk CSV-bestand ----------
  library(tibble); library(dplyr)

  set.seed(42)

  crime_df <- tibble(
    zaak_id    = sprintf("ZAAK%03d", 1:200),
    datum      = sample(
                   seq.Date(as.Date("2023-01-01"),
                            as.Date("2023-12-31"), "day"),
                   200, TRUE),
    district   = sample(c("A","B","C","D"), 200, TRUE, prob = c(.4,.3,.2,.1)),
    misdaad_type = sample(c("Inbraak","Aanval","Diefstal","Vandalisme"), 200, TRUE),
    waardeverlies       = round(rlnorm(200, 3, 1)),
    agenten_uitgezonden = sample(1:5, 200, TRUE),
    reactietijd         = round(pmax(rnorm(200, 12, 4), 0), 1)
  )

  bestandspad <- file.path(tempdir(), "misdaad_data.csv")
  write.csv(crime_df, bestandspad, row.names = FALSE)
})
