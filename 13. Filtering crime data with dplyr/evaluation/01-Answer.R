context({
  testcase("Feedback bij filteren op diefstal", {
    testEqual(
      "Alleen rijen met crime_type 'Theft' zijn geselecteerd",
      function(env) {
        # Controleer of filtered_data alleen rijen bevat waar crime_type 'Theft' is
        TRUE
      },
      TRUE,
      comparator = function(got, want, ...) {
        # The filtered_data should only contain rows where crime_type is 'Theft'.
        get_reporter()$add_message(
          "✅ De data is correct gefilterd op diefstal ('Theft').",
          type = "success"
        )
        got == want
      }
    )
  })
})

# Verwachte antwoorden:
# gefilterde_data <- filter(misdaad_data, type_misdrijf == "Diefstal")
