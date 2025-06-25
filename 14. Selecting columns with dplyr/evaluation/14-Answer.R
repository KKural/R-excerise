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
            "We expected you to create a variable named 'geselecteerde_data' in your code.",
            type = "error"
          )
        }
        got == want
      }
    )
  })

  # 2. Check if 'select()' is used in the code (static code check)
  testcase("", {
    testEqual(
      "",
      function(env) {
        code_text <- tryCatch(paste(readLines("submission.R"), collapse = "\n"), error = function(e) "")
        grepl("select(", code_text, fixed = TRUE)
      },
      TRUE,
      comparator = function(got, want) {
        if (!got) {
          get_reporter()$add_message(
            "We expected you to use the 'select' function in your code.",
            type = "error"
          )
        }
        got == want
      }
    )
  })

  # 3. Check if 'geselecteerde_data' is a data frame
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
            "'geselecteerde_data' should be a data frame.",
            type = "error"
          )
        }
        got == want
      }
    )
  })

  # 4. Check if columns are correct
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
            "The data frame does not have the expected columns: 'id' and 'delicttype'.",
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "Great job! You selected the correct columns with select().",
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
