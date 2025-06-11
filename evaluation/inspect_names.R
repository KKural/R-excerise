context({
  testcase("names(crime_df) prints correct columns", {
    expected <- c(
      "incident_id",
      "date",
      "district",
      "crime_type",
      "value_loss",
      "officers_sent",
      "response_time"
    )
    testEqual(
      "Output of names(crime_df)",
      function(env) {
        # env$evaluationResult holds the return value of the student's last expression
        result <- env$evaluationResult
        if (!is.character(result)) {
          stop("Please call `names(crime_df)` without assigning it to a variable.")
        }
        result
      },
      expected,
      comparator = function(got, want, ...) {
        if (!identical(got, want)) {
          get_reporter()$add_message(
            paste0(
              "❌ Expected: ", paste(want, collapse = ", "), 
              "\nYou returned: ", paste(got, collapse = ", ")
            ),
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          "✅ Correct! `names(crime_df)` printed the expected column names.",
          type = "success"
        )
        TRUE
      }
    )
  })
})
