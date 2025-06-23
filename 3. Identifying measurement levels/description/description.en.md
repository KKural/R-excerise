You have been given a dataset with information about criminal cases. Identify the measurement level (nominal, ordinal, interval, or ratio) of each variable by assigning the correct level to each variable name.

```R
# A dataset with information about criminal cases
crime_data <- data.frame(
  case_id = c(1001, 1002, 1003, 1004, 1005),
  gender = c("Male", "Female", "Male", "Male", "Female"),
  age = c(24, 37, 19, 42, 31),
  crime_type = c("Theft", "Assault", "Burglary", "Theft", "Fraud"),
  sentence_length = c(12, 36, 6, 15, 24),
  education_level = c("Secondary", "Primary", "Higher", "Secondary", "Higher"),
  risk_category = c("Medium", "High", "Low", "Medium", "Low")
)

# For each variable, assign its measurement level as a string: "nominal", "ordinal", "interval", or "ratio"
# Example: level_case_id <- "nominal"
# Complete the assignments for all variables below
```

**Tip:**  
Nominal: categories with no order.  
Ordinal: categories with order.  
Interval: equal intervals, no true zero.  
Ratio: equal intervals, true zero.