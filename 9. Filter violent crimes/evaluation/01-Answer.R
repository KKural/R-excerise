# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

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
    id = 1:20,
    offense = c("Theft", "Assault", "Drug Offense", "Robbery", "Vandalism", 
                "Assault", "Burglary", "Homicide", "Theft", "Assault",
                "Fraud", "Robbery", "Theft", "Drug Offense", "Homicide",
                "Assault", "Vandalism", "Fraud", "Burglary", "Theft"),
    district = c("North", "South", "East", "Central", "West",
                 "South", "North", "Central", "East", "West",
                 "North", "South", "West", "East", "South",
                 "Central", "North", "East", "West", "South"),
    date = as.Date("2023-01-01") + 0:19
  )
})

# Model solution:
violent_crimes_df <- subset(crime_data, offense %in% c("Assault", "Robbery", "Homicide"))