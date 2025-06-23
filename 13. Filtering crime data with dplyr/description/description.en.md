# Filtering crime data with dplyr

You are given a small dataset of crime records. Use the `dplyr` package to filter the data and select only the rows where the crime type is "Theft". Store the result in a variable called `filtered_data`.

```R
library(dplyr)

crime_data <- data.frame(
  case_id = 1:5,
  crime_type = c("Theft", "Assault", "Theft", "Fraud", "Theft"),
  district = c("North", "East", "West", "South", "North"),
  offender_age = c(22, 35, 19, 41, 28)
)

# Filter for thefts only
filtered_data <- filter(crime_data, crime_type == "Theft")

# Your code here (optional: print or inspect filtered_data)

```

**Tip:**
- Use `filter()` from the `dplyr` package to select rows based on a condition
- Make sure to assign the result to the variable `filtered_data`
