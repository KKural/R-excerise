# Verwachte antwoorden:
# 1. crime_types: factor met niveaus "Theft", "Assault", "Burglary", "Fraud", "Vandalism"
# 2. crime_severity: geordende factor met niveaus "Minor" < "Moderate" < "Severe"
# 3. offender_ages: numerieke vector c(19, 23, 45, 32, 28, 21)
# 4. district_codes: karaktervector c("A1", "B2", "C3", "D4", "E5")

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

context({
  testcase("Meetniveau feedback", {
    testEqual(
      "crime_types is een factor met de juiste niveaus",
      function(env) is.factor(env$crime_types) && all(levels(env$crime_types) == c("Theft", "Assault", "Burglary", "Fraud", "Vandalism")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # `crime_types` should be a factor with levels: 'Theft', 'Assault', 'Burglary', 'Fraud', 'Vandalism'.
          get_reporter()$add_message(
            "❌ `crime_types` moet een factor zijn met de niveaus: 'Theft', 'Assault', 'Burglary', 'Fraud', 'Vandalism'.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `crime_types` is juist aangemaakt als factor met de juiste niveaus.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "crime_severity is een geordende factor met de juiste volgorde",
      function(env) is.ordered(env$crime_severity) && all(levels(env$crime_severity) == c("Minor", "Moderate", "Severe")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # `crime_severity` should be an ordered factor with order: 'Minor' < 'Moderate' < 'Severe'.
          get_reporter()$add_message(
            "❌ `crime_severity` moet een geordende factor zijn met de volgorde: 'Minor' < 'Moderate' < 'Severe'.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `crime_severity` is juist aangemaakt als geordende factor met de juiste volgorde.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "offender_ages is een numerieke vector",
      function(env) is.numeric(env$offender_ages) && all(env$offender_ages == c(19, 23, 45, 32, 28, 21)),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # `offender_ages` should be a numeric vector with values: 19, 23, 45, 32, 28, 21.
          get_reporter()$add_message(
            "❌ `offender_ages` moet een numerieke vector zijn met de waarden: 19, 23, 45, 32, 28, 21.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `offender_ages` is juist aangemaakt als numerieke vector.",
            type = "markdown"
          )
        }
        got == want
      }
    )
    testEqual(
      "district_codes is een karaktervector",
      function(env) is.character(env$district_codes) && all(env$district_codes == c("A1", "B2", "C3", "D4", "E5")),
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          # `district_codes` should be a character vector with values: 'A1', 'B2', 'C3', 'D4', 'E5'.
          get_reporter()$add_message(
            "❌ `district_codes` moet een karaktervector zijn met de waarden: 'A1', 'B2', 'C3', 'D4', 'E5'.",
            type = "markdown"
          )
        } else {
          get_reporter()$add_message(
            "✅ `district_codes` is juist aangemaakt als karaktervector.",
            type = "markdown"
          )
        }
        got == want
      }
    )
  })
})