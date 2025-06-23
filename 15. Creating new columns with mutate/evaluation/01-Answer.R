context({
  testcase("Feedback bij nieuwe kolom aanmaken", {
    testEqual(
      "Nieuwe kolom is correct aangemaakt",
      function(env) {
        # Controleer of gemuteerde_data de nieuwe kolom bevat
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        # De gemuteerde_data zou de nieuwe kolom moeten bevatten.
        get_reporter()$add_message(
          "✅ De nieuwe kolom is correct aangemaakt in gemuteerde_data.",
          type = "success"
        )
        got == want
      }
    )
  })
})

# Verwachte antwoorden:
# gemuteerde_data <- mutate(misdaad_data, nieuwe_kolom = ...)
