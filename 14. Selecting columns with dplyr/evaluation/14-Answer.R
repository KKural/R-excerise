context({
  # 1. Check if 'geselecteerde_data' exists
  testcase("", {
    testEqual(
      "",
      function(env) exists("geselecteerde_data", envir = env),
      TRUE,
      comparator = function(got, want) {
        if (!got) {
          get_reporter()$add_message(
            "❌ De variabele 'geselecteerde_data' bestaat niet. Maak deze variabele aan met select().",
            type = "error"
          )
        }
        got == want
      }
    )
  })

  # 2. Check if 'geselecteerde_data' is a data frame
  testcase("", {
    testEqual(
      "",
      function(env) {
        if (!exists("geselecteerde_data", envir = env)) return(NULL)
        is.data.frame(env$geselecteerde_data)
      },
      TRUE,
      comparator = function(got, want) {
        if (is.null(got) || !got) {
          get_reporter()$add_message(
            "❌ 'geselecteerde_data' moet een data frame zijn.",
            type = "error"
          )
        }
        got == want
      }
    )
  })

  # 3. Check if columns are correct
  testcase("", {
    testEqual(
      "",
      function(env) {
        if (!exists("geselecteerde_data", envir = env)) return(NULL)
        if (!is.data.frame(env$geselecteerde_data)) return(NULL)
        colnames(env$geselecteerde_data)
      },
      c("id", "delicttype"),
      comparator = function(got, want) {
        if (is.null(got) || !identical(got, want)) {
          get_reporter()$add_message(
            "❌ Verkeerde kolommen: verwacht 'id' en 'delicttype'.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Goed gedaan! Je hebt de juiste kolommen geselecteerd met `select()`.",
          type = "success"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  misdaad_data <- data.frame(
    id = 1:10,
    delicttype = c("Diefstal", "Aanval", "Diefstal", "Inbraak", "Diefstal", "Vandalisme", "Diefstal", "Fraude", "Diefstal", "Aanval"),
    waarde = c(100, 200, 150, 300, 120, 80, 90, 60, 110, 50)
  )
})
