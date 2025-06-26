# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Herkennen van meetniveaus in criminaliteitsdata", {
    # Test identificatie nominale variabelen
    testEqual(
      "Identificatie nominale variabelen",
      function(env) {
        env$nominale_variabelen
      },
      c("type", "district"),
      comparator = function(generated, expected, ...) {
        # Controleer of de student de juiste nominale variabelen heeft geïdentificeerd
        correct <- setequal(generated, expected)
        if (!correct) {
          missing <- setdiff(expected, generated)
          extra <- setdiff(generated, expected)
          
          msg <- ""
          if (length(missing) > 0) {
            msg <- paste0(msg, "❌ Je mist de volgende nominale variabelen: ", paste(missing, collapse=", "), ". ")
          }
          if (length(extra) > 0) {
            msg <- paste0(msg, "❌ De volgende variabelen die je hebt genoemd zijn geen nominale variabelen: ", paste(extra, collapse=", "), ". ")
          }
          
          get_reporter()$add_message(
            paste0(msg, "Nominale variabelen zijn categorische variabelen zonder inherente volgorde, zoals 'type' en 'district'."),
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ Je hebt de nominale variabelen correct geïdentificeerd! Nominale variabelen zijn categorische variabelen zonder inherente volgorde.",
            type = "markdown"
          )
        }
        return(correct)
      }
    )
    
    # Test identificatie ordinale variabelen
    testEqual(
      "Identificatie ordinale variabelen",
      function(env) {
        env$ordinale_variabelen
      },
      c("ernst"),
      comparator = function(generated, expected, ...) {
        # Controleer of de student de juiste ordinale variabelen heeft geïdentificeerd
        correct <- setequal(generated, expected)
        if (!correct) {
          missing <- setdiff(expected, generated)
          extra <- setdiff(generated, expected)
          
          msg <- ""
          if (length(missing) > 0) {
            msg <- paste0(msg, "❌ Je mist de volgende ordinale variabelen: ", paste(missing, collapse=", "), ". ")
          }
          if (length(extra) > 0) {
            msg <- paste0(msg, "❌ De volgende variabelen die je hebt genoemd zijn geen ordinale variabelen: ", paste(extra, collapse=", "), ". ")
          }
          
          get_reporter()$add_message(
            paste0(msg, "Ordinale variabelen zijn categorische variabelen met een inherente volgorde, zoals 'ernst' met niveaus 'Licht' < 'Matig' < 'Ernstig'."),
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ Je hebt de ordinale variabelen correct geïdentificeerd! Ordinale variabelen zijn categorische variabelen met een inherente volgorde.",
            type = "markdown"
          )
        }
        return(correct)
      }
    )
    
    # Test identificatie interval/ratio variabelen
    testEqual(
      "Identificatie interval/ratio variabelen",
      function(env) {
        env$interval_ratio_variabelen
      },
      c("leeftijd"),
      comparator = function(generated, expected, ...) {
        # Controleer of de student de juiste interval/ratio variabelen heeft geïdentificeerd
        correct <- setequal(generated, expected)
        if (!correct) {
          missing <- setdiff(expected, generated)
          extra <- setdiff(generated, expected)
          
          msg <- ""
          if (length(missing) > 0) {
            msg <- paste0(msg, "❌ Je mist de volgende interval/ratio variabelen: ", paste(missing, collapse=", "), ". ")
          }
          if (length(extra) > 0) {
            msg <- paste0(msg, "❌ De volgende variabelen die je hebt genoemd zijn geen interval/ratio variabelen: ", paste(extra, collapse=", "), ". ")
          }
          
          get_reporter()$add_message(
            paste0(msg, "Interval/ratio variabelen zijn numerieke variabelen waarmee je wiskundige berekeningen kunt uitvoeren, zoals 'leeftijd'."),
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ Je hebt de interval/ratio variabelen correct geïdentificeerd! Interval/ratio variabelen zijn numerieke variabelen waarmee je wiskundige berekeningen kunt uitvoeren.",
            type = "markdown"
          )
        }
        return(correct)
      }
    )
  })
}, preExec = {
  # Create the data frame that's mentioned in the description
  df_crime_data <- data.frame(
    type = factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
    ernst = factor(c("Licht", "Matig", "Ernstig", "Matig", "Licht"), 
                   levels = c("Licht", "Matig", "Ernstig"), 
                   ordered = TRUE),
    leeftijd = c(19, 23, 45, 32, 28),
    district = c("A1", "B2", "C3", "D4", "E5")
  )
  
  # Important: Make df_crime_data available globally
  # Assign to both global environment and the current environment 
  # to ensure it's available in all contexts
  assign("df_crime_data", df_crime_data, envir = globalenv())
})

# Model solution:
# # Bekijk de dataframe structuur
# str(df_crime_data)
# 
# # Identificeer de meetniveaus per variabele
# nominale_variabelen <- c("type", "district")  # categorieën zonder rangorde
# ordinale_variabelen <- c("ernst")  # categorieën met rangorde
# interval_ratio_variabelen <- c("leeftijd")  # numerieke variabelen
