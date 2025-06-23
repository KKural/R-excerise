context({

  # ------------- TESTS -------------
  testcase("Gebruik van getwd() en setwd()", {

    src <- function(env) {
      paste(
        sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")),
        collapse = "\n"
      )
    }

    testEqual(
      "`getwd()` is gebruikt",
      function(env) grepl("getwd\\s*\\(", src(env)),
      TRUE,
      comparator = identical
    )

    testEqual(
      "`setwd()` is gebruikt",
      function(env) grepl("setwd\\s*\\(", src(env)),
      TRUE,
      comparator = identical
    )
  })

}, preExec = {

  # -------- CSV aanmaken in tempdir() --------
  library(tibble); library(dplyr)

  set.seed(42)

  crime_df <- tibble(
    zaak_id    = sprintf("ZAAK%03d", 1:200),
    datum      = sample(seq.Date(as.Date("2023-01-01"),
                                 as.Date("2023-12-31"), "day"), 200, TRUE),
    district   = sample(c("A", "B", "C", "D"), 200, TRUE, prob = c(.4,.3,.2,.1)),
    misdaad_type = sample(c("Inbraak","Aanval","Diefstal","Vandalisme"),
                          200, TRUE),
    waardeverlies       = round(rlnorm(200, 3, 1)),
    agenten_uitgezonden = sample(1:5, 200, TRUE),
    reactietijd         = round(pmax(rnorm(200, 12, 4), 0), 1)
  )

  bestandspad <- file.path(tempdir(), "misdaad_data.csv")
  write.csv(crime_df, bestandspad, row.names = FALSE)
})