context({
  testcase("", {
    testEqual(
      "",
      function(env) { NULL },
      NULL,
      comparator = function(got, want, ...) {
        TRUE
      }
    )
  })
}, preExec = {
  # Set up the crime_data data frame
  crime_data <- data.frame(
    case_id = c(1001, 1002, 1003, 1004, 1005),
    gender = c("Male", "Female", "Male", "Male", "Female"),
    age = c(24, 37, 19, 42, 31),
    crime_type = c("Theft", "Assault", "Burglary", "Theft", "Fraud"),
    sentence_length = c(12, 36, 6, 15, 24),
    education_level = c("Secondary", "Primary", "Higher", "Secondary", "Higher"),
    risk_category = c("Medium", "High", "Low", "Medium", "Low")
  )
})

# Model solution:
level_case_id <- "nominal"
level_gender <- "nominal"
level_age <- "ratio"
level_crime_type <- "nominal"
level_sentence_length <- "ratio"
level_education_level <- "ordinal"
level_risk_category <- "ordinal"