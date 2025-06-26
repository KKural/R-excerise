# bloom_level: Apply & Analyze
# scaffolding_level: Medium support
# primm_phase: Modify

context({
  testcase("CSV-bestand inladen", {
    testEqual(
      "Correct misdaad_data dataframe aanmaken",
      function(env) {
        # Controleer of variabele bestaat
        if (!exists("misdaad_data", envir = env)) {
          return(FALSE)
        }
        
        # Controleer of het een dataframe is
        if (!is.data.frame(env$misdaad_data)) {
          return(FALSE)
        }
        
        # Controleer of alle vereiste kolommen aanwezig zijn
        vereiste_kolommen <- c("zaak_id", "datum", "district", "misdaad_type", "waardeverlies", "agenten_uitgezonden", "reactietijd")
        if (!all(vereiste_kolommen %in% names(env$misdaad_data))) {
          return(FALSE)
        }
        
        # Controleer of de student de correcte functies gebruikt
        # Haal de code van de student op
        code_text <- toString(deparse(test_env$parsed_code))
        
        # Controleer of de student de vereiste functies heeft gebruikt
        required_functions <- c("getwd", "setwd", "dirname", "basename", "read.csv")
        functions_used <- sapply(required_functions, function(func) {
          grepl(func, code_text, fixed = TRUE)
        })
        
        # Als niet alle functies zijn gebruikt, geef FALSE terug
        if (!all(functions_used)) {
          return(FALSE)
        }
        
        # Als alles goed is, geef TRUE terug
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # Controleer waarom het fout is
          if (!exists("misdaad_data", envir = test_env$clean_env)) {
            get_reporter()$add_message(
              "❌ De variabele 'misdaad_data' bestaat niet. Heb je het CSV-bestand correct ingeladen?",
              type = "error"
            )
            return(FALSE)
          }
          
          if (!is.data.frame(test_env$clean_env$misdaad_data)) {
            get_reporter()$add_message(
              "❌ 'misdaad_data' moet een data frame zijn.",
              type = "error"
            )
            return(FALSE)
          }
          
          vereiste_kolommen <- c("zaak_id", "datum", "district", "misdaad_type", "waardeverlies", "agenten_uitgezonden", "reactietijd")
          if (!all(vereiste_kolommen %in% names(test_env$clean_env$misdaad_data))) {
            get_reporter()$add_message(
              paste0("❌ 'misdaad_data' mist één of meer vereiste kolommen: ", paste(vereiste_kolommen, collapse=", "), "."),
              type = "error"
            )
            return(FALSE)
          }
          
          # Controleer of de student alle vereiste functies heeft gebruikt
          code_text <- toString(deparse(test_env$parsed_code))
          required_functions <- c("getwd", "setwd", "dirname", "basename", "read.csv")
          functions_used <- sapply(required_functions, function(func) {
            grepl(func, code_text, fixed = TRUE)
          })
          
          missing_functions <- required_functions[!functions_used]
          if (length(missing_functions) > 0) {
            get_reporter()$add_message(
              paste0("❌ Je moet de volgende functies gebruiken: ", paste(missing_functions, collapse=", "), "."),
              type = "error"
            )
            return(FALSE)
          }
          
          # Als we hier komen, is er een andere fout
          get_reporter()$add_message(
            "❌ Er is een probleem met jouw code. Controleer of je het CSV-bestand correct hebt ingeladen.",
            type = "error"
          )
          return(FALSE)
        }
        
        # Als alles goed is
        get_reporter()$add_message(
          "✅ Correct! Je hebt het CSV-bestand correct ingeladen in 'misdaad_data'.",
          type = "success"
        )
        
        # Toon voorbeeld van bestandspad en uitleg over functies
        get_reporter()$add_message(
          "## Uitleg over de gebruikte functies",
          type = "markdown"
        )
        
        # Voorbeeld van bestandspad
        voorbeeldpad <- "C:/Users/student/Documents/misdaad_data.csv"
        get_reporter()$add_message(paste(
          "### Voorbeeld van bestandspad bewerking:",
          "```r",
          paste0("bestandspad <- \"", voorbeeldpad, "\""),
          paste0("dirname(bestandspad)  # Geeft: \"C:/Users/student/Documents\""),
          paste0("basename(bestandspad) # Geeft: \"misdaad_data.csv\""),
          "```",
          sep = "\n"
        ), type = "markdown")
        
        # Uitleg over de functies
        get_reporter()$add_message(paste(
          "### Functies uitleg:",
          "- `getwd()`: Geeft de huidige werkmap (working directory) terug",
          "- `setwd()`: Verandert de huidige werkmap naar het opgegeven pad",
          "- `dirname()`: Haalt de mapnaam uit een volledig bestandspad",
          "- `basename()`: Haalt de bestandsnaam uit een volledig bestandspad", 
          "- `read.csv()`: Leest een CSV-bestand in als een dataframe",
          sep = "\n"
        ), type = "markdown")
        
        # Toon enkele rijen van het dataframe
        get_reporter()$add_message(
          "## Eerste rijen van je dataframe:",
          type = "markdown"
        )
        
        # Beperk tot 5 rijen en toon als tabelcode
        data_head <- capture.output(head(test_env$clean_env$misdaad_data, 5))
        get_reporter()$add_message(paste(data_head, collapse = "\n"), type = "code")
        
        return(TRUE)
      }
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

# Modeloplossing:
# getwd()
# data_dir <- dirname(bestandspad)
# old_dir <- getwd()
# setwd(data_dir)
# misdaad_data <- read.csv(basename(bestandspad))
# setwd(old_dir)