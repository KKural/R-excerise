context({
  testcase("Filter for theft crimes", {
    testEqual(
      "Should return only rows where crime_type is 'Theft'",
      function(env) {
        library(dplyr)
        crime_data <- data.frame(
          case_id = 1:5,
          crime_type = c("Theft", "Assault", "Theft", "Fraud", "Theft"),
          district = c("North", "East", "West", "South", "North"),
          offender_age = c(22, 35, 19, 41, 28)
        )
        filtered_data <- filter(crime_data, crime_type == "Theft")
        filtered_data
      },
      data.frame(
        case_id = c(1, 3, 5),
        crime_type = c("Theft", "Theft", "Theft"),
        district = c("North", "West", "North"),
        offender_age = c(22, 19, 28)
      ),
      ignore_attr = TRUE
    )
  })
})
