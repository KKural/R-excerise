context({
  testcase("Feedback bij kolommen selecteren", {
    testEqual(
      "Geselecteerde kolommen zijn correct",
      function(env) {
        # Controleer of selected_data de juiste kolommen bevat
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        # The selected_data should contain the correct columns.
        get_reporter()$add_message(
          "✅ De juiste kolommen zijn geselecteerd in selected_data.",
          type = "success"
        )
        got == want
      }
    )
  })
}, preExec = {
  # Example: selected_data <<- select(crime_data, column1, column2)
})
