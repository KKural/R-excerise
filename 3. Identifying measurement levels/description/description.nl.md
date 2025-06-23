Je hebt een dataset gekregen met informatie over strafzaken. Bepaal het meetniveau (nominaal, ordinaal, interval of ratio) van elke variabele door het juiste niveau toe te wijzen aan elke variabelenaam.

```R
# Een dataset met informatie over strafzaken
crime_data <- data.frame(
  case_id = c(1001, 1002, 1003, 1004, 1005),
  gender = c("Male", "Female", "Male", "Male", "Female"),
  age = c(24, 37, 19, 42, 31),
  crime_type = c("Theft", "Assault", "Burglary", "Theft", "Fraud"),
  sentence_length = c(12, 36, 6, 15, 24),
  education_level = c("Secondary", "Primary", "Higher", "Secondary", "Higher"),
  risk_category = c("Medium", "High", "Low", "Medium", "Low")
)

# Wijs voor elke variabele het meetniveau toe als string: "nominaal", "ordinaal", "interval" of "ratio"
# Voorbeeld: level_case_id <- "nominaal"
# Vul de toewijzingen voor alle variabelen hieronder aan
```
