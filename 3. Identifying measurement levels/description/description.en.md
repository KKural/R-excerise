# Identifying measurement levels

## Criminological Context
Understanding the measurement level of variables in criminological datasets is crucial for selecting appropriate statistical analyses. Different measurements require different approaches to analysis and interpretation.

## Task
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

# For each variable, assign its measurement level to the corresponding variable below
# Use one of: "nominal", "ordinal", "interval", or "ratio"

level_case_id <- ""         # What level is case_id?
level_gender <- ""          # What level is gender?
level_age <- ""             # What level is age?
level_crime_type <- ""      # What level is crime_type?
level_sentence_length <- "" # What level is sentence_length?
level_education_level <- "" # What level is education_level?
level_risk_category <- ""   # What level is risk_category?
```

**Bloom Level: Understand & Apply**

**Tips:** 
- Nominal variables are categorical with no inherent order (like gender, crime type)
- Ordinal variables have categories with a natural order (like education level, risk categories)
- Interval variables have equal intervals but no natural zero (like temperature scales)
- Ratio variables have equal intervals AND a meaningful zero (like age, sentence length)