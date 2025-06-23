context({
  testcase("Feedback bij inladen van misdaadgegevens", {
    testEqual(
      "misdaad_data is correct ingeladen",
      function(env) {
        if (!exists("misdaad_data", envir = env)) {
          get_reporter()$add_message(
            "❌ De variabele 'misdaad_data' bestaat niet. Heb je het CSV-bestand correct ingeladen?",
            type = "error"
          )
          return(FALSE)
        }
        if (!is.data.frame(env$misdaad_data)) {
          get_reporter()$add_message(
            "❌ 'misdaad_data' moet een data frame zijn.",
            type = "error"
          )
          return(FALSE)
        }
        vereiste_kolommen <- c("zaak_id", "datum", "district", "misdaad_type", "waardeverlies", "agenten_uitgezonden", "reactietijd")
        if (!all(vereiste_kolommen %in% names(env$misdaad_data))) {
          get_reporter()$add_message(
            paste0("❌ 'misdaad_data' mist één of meer vereiste kolommen: ", paste(vereiste_kolommen, collapse=", "), "."),
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "Correct! Je hebt het CSV-bestand correct ingeladen in 'misdaad_data'.",
          type = "success"
        )
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )
  })
}, preExec = {
  # Maak het CSV-bestand aan in tempdir()
  library(tibble); library(dplyr)
  set.seed(42)
  misdaad_data <- tibble(
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
  write.csv(misdaad_data, bestandspad, row.names = FALSE)
})