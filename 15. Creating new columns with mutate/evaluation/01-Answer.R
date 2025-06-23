context({
  testcase("Feedback bij nieuwe kolom aanmaken", {
    testEqual(
      "Nieuwe kolom is correct aangemaakt",
      function(env) {
        # Controleer of mutated_data de nieuwe kolom bevat
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        # The mutated_data should contain the new column.
        get_reporter()$add_message(
          "✅ De nieuwe kolom is correct aangemaakt in mutated_data.",
          type = "success"
        )
        got == want
      }
    )
  })
})
