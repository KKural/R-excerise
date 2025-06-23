# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Predict, Run, Investigate, Modify, Make

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

# PRIMM Phase: Predict
# Predict: What measurement level do you think each variable in 'crime_data' has? Write your guesses as comments below.
# Example: # case_id: ?  gender: ?  ...

# PRIMM Phase: Run
# Run the code below to see the actual data structure.
# str(crime_data)

# PRIMM Phase: Investigate
# Investigate: Use str() and summary() to explore the variables. What types and values do you see?

# PRIMM Phase: Modify
# Modify: Change the value of one variable (e.g., set all 'gender' to 'Unknown') and see how it affects your measurement level classification.
# crime_data$gender <- rep('Unknown', nrow(crime_data))

# PRIMM Phase: Make
# Make: Add a new variable (e.g., 'prior_offenses' as a numeric vector) and assign an appropriate measurement level to it.
# crime_data$prior_offenses <- c(0, 1, 2, 0, 3)
# level_prior_offenses <- "ratio"

# Faded Example
# The first three variables are shown below. Complete the rest yourself.
level_case_id <- "nominal"
level_gender <- "nominal"
level_age <- "ratio"
# level_crime_type <- ?
# level_sentence_length <- ?
# level_education_level <- ?
# level_risk_category <- ?

# Independent Task
# Now, for each variable in 'crime_data', assign the correct measurement level as a string ("nominal", "ordinal", "interval", or "ratio").
# Use the model solution as a reference only after you have tried yourself.

# APA-style Reporting
# Write a short APA-style sentence describing the variables and their measurement levels. Example:
# "The dataset included case IDs (nominal), gender (nominal), age (ratio), crime type (nominal), sentence length (ratio), education level (ordinal), and risk category (ordinal)."

# Model solution:
level_case_id <- "nominal"
level_gender <- "nominal"
level_age <- "ratio"
level_crime_type <- "nominal"
level_sentence_length <- "ratio"
level_education_level <- "ordinal"
level_risk_category <- "ordinal"