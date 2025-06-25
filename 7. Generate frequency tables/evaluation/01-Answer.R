#–– Data setup ––
delictsoorten <- c(
  "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal",
  "Aanval",   "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval",
  "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval",
  "Diefstal", "Drugsdelict", "Inbraak"
)

#–– Evaluation ––
context({
  testcase("Feedback bij frequentietabel", {
    testEqual(
      "Check delict_tabel versus table(delictsoorten)",  

      # <-- wrap your grading logic in a function(env) { ... }
      function(env) {
        # 1) Always show the command
        get_reporter()$add_message(
          "```r\n> table(delictsoorten)\n```",
          type = "markdown"
        )

        # 2) Compute and display the expected output
        expected <- table(env$delictsoorten)
        get_reporter()$add_message(
          paste0(
            "```r\n",
            paste(capture.output(print(expected)), collapse = "\n"),
            "\n```"
          ),
          type = "markdown"
        )

        # 3) Existence check
        if (!exists("delict_tabel", envir = env)) {
          get_reporter()$add_message(
            "❌ The variable `delict_tabel` does not exist. Create it with:\n```r\ndelict_tabel <- table(delictsoorten)\n```",
            type = "error"
          )
          return(FALSE)
        }

        # 4) Type check
        if (!is.table(env$delict_tabel)) {
          get_reporter()$add_message(
            "❌ `delict_tabel` is not a table. Use:\n```r\ndelict_tabel <- table(delictsoorten)\n```",
            type = "error"
          )
          return(FALSE)
        }

        # 5) Value check
        if (!identical(env$delict_tabel, expected)) {
          get_reporter()$add_message(
            "❌ The frequency counts don’t match `table(delictsoorten)`. Check your code.",
            type = "error"
          )
          return(FALSE)
        }

        # 6) Success
        get_reporter()$add_message(
          "✅ The frequency table of delictsoorten has been created correctly.",
          type = "success"
        )
        return(TRUE)
      },

      # third argument: what we expect the function to return
      TRUE  
      
      # you don’t need a custom comparator since you return TRUE/FALSE yourself
    )
  })
}, preExec = {
  # make delictsoorten available
  delictsoorten <- c(
    "Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal",
    "Aanval",   "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval",
    "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval",
    "Diefstal", "Drugsdelict", "Inbraak"
  )
})
