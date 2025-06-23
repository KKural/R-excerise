# Expected answers:
# 1. crime_types: factor with levels "Theft", "Assault", "Burglary", "Fraud", "Vandalism"
# 2. crime_severity: ordered factor with levels "Minor" < "Moderate" < "Severe"
# 3. offender_ages: numeric vector c(19, 23, 45, 32, 28, 21)
# 4. district_codes: character vector c("A1", "B2", "C3", "D4", "E5")

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
  # 1. Create the crime_types factor variable
  crime_types <- factor(c("Theft", "Assault", "Burglary", "Fraud", "Vandalism"))

  # 2. Create the crime_severity ordered factor variable
  crime_severity <- factor(c("Minor", "Moderate", "Severe"), 
                           levels = c("Minor", "Moderate", "Severe"), 
                           ordered = TRUE)

  # 3. Create the offender_ages numeric vector
  offender_ages <- c(19, 23, 45, 32, 28, 21)

  # 4. Create the district_codes character vector
  district_codes <- c("A1", "B2", "C3", "D4", "E5")
})

# Model solution:
# 1. Create the crime_types factor variable
crime_types <- factor(c("Theft", "Assault", "Burglary", "Fraud", "Vandalism"))

# 2. Create the crime_severity ordered factor variable
crime_severity <- factor(c("Minor", "Moderate", "Severe"), 
                         levels = c("Minor", "Moderate", "Severe"), 
                         ordered = TRUE)

# 3. Create the offender_ages numeric vector
offender_ages <- c(19, 23, 45, 32, 28, 21)

# 4. Create the district_codes character vector
district_codes <- c("A1", "B2", "C3", "D4", "E5")