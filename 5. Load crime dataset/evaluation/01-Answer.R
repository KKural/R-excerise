# Evaluation script – “Het laden van de crime dataset”

context({
  # ----------------------------
  # preExec: maak het CSV-bestand in D:/thesis/data
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

  # Maak de directory D:/thesis/data aan als die niet bestaat
  dir.create("D:/thesis/data", recursive = TRUE, showWarnings = FALSE)
  bestandspad <- file.path("D:/thesis/data", "misdaad_data.csv")
  write.csv(crime_df, bestandspad, row.names = FALSE)
})

# ----------------------------
# Tests
# ----------------------------
context({
  # Dummy pad voor demonstratie setwd/getwd
  # Studenten hoeven geen echt pad te gebruiken, alleen de functies aanroepen
  dummy_path <- "C:/dummy/path"

  testcase("Controleren of setwd() is gebruikt", {
    testTrue(
      "setwd() is aangeroepen in de code",
      function(env) {
        any(grepl("setwd\\s*\\(", paste(readLines(env$.__code__), collapse = "\n")))
      }
    )
  })

  testcase("Controleren of getwd() is gebruikt", {
    testTrue(
      "getwd() is aangeroepen in de code",
      function(env) {
        any(grepl("getwd\\s*\\(", paste(readLines(env$.__code__), collapse = "\n")))
      }
    )
  })

  testcase("Feedback bij laden van dataset", {
    testTrue(
      "misdaad_df is correct ingeladen",
      function(env) {
        exists("misdaad_df", env) && is.data.frame(env$misdaad_df)
      }
    )
  })
})
