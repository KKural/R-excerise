library(testthat)
#–– Make the data available to students ––
maandelijkse_feiten <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)

test_that("De uitkomst van mean(maandelijkse_feiten) is correct berekend", {
  # Simuleer studentwaarde (vervang dit door de echte studentinput in je platform)
  student_value <- mean(maandelijkse_feiten) # <-- Vervang dit door de studentwaarde in je platform
  
  verwacht <- mean(maandelijkse_feiten)
  
  # 1) moet numeriek zijn
  expect_true(!is.null(student_value) && is.numeric(student_value),
              info = "❌ Je antwoord is geen numerieke waarde. Gebruik mean(maandelijkse_feiten)"
  )
  
  # 2) moet binnen tolerantie zijn
  expect_true(abs(student_value - verwacht) <= 1e-6,
              info = paste0(
                "❌ Je antwoord is niet het juiste gemiddelde. ",
                "Gebruik mean(maandelijkse_feiten). ",
                "Het juiste gemiddelde is: ", round(verwacht, 2)
              )
  )
  
  # 3) succes!
  message(paste0("✅ Correct! Het gemiddelde is: ", round(verwacht, 2)))
})
              "❌ Je antwoord is niet het juiste gemiddelde. ",
              "Gebruik mean(maandelijkse_feiten). ",
              "Het juiste gemiddelde is: ", round(verwacht, 2)
            ),
            type = "error"
          )
          return(FALSE)
        }
        # 3) success!
        get_reporter()$add_message(
          paste0("✅ Correct! Het gemiddelde is: ", round(verwacht, 2)),
          type = "success"
        )
        return(TRUE)
      },
      
      # The “want” value for the default comparator:
      mean(maandelijkse_feiten),
      
      # A fallback comparator that produces identical messages if used
      comparator = function(got, want, ...) {
        if (is.null(got) || !is.numeric(got)) {
          get_reporter()$add_message(
            "❌ Je antwoord is geen numerieke waarde. Gebruik mean(maandelijkse_feiten)",
            type = "error"
          )
          return(FALSE)
        }
        if (abs(got - want) > 1e-6) {
          get_reporter()$add_message(
            paste0(
              "❌ Je antwoord is niet het juiste gemiddelde. ",
              "Gebruik mean(maandelijkse_feiten). ",
              "Het juiste gemiddelde is: ", round(want, 2)
            ),
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          paste0("✅ Correct! Het gemiddelde is: ", round(want, 2)),
          type = "success"
        )
        return(TRUE)
      }
    )
  }
)
