# Filtering crime data with dplyr

**Bloom’s Level:** Apply  
**PRIMM Step:** Predict → Run → Modify

---

## Scenario
You are given a small dataset of crime records. Your task is to use the `dplyr` package to filter the data and select only the rows where the crime type is "Theft".

---

## Instructions
1. **Predict:** What will the code below do? (Think before you run it!)
2. **Run:** Execute the code to see the result.
3. **Modify:** Change the code so it selects only the rows where `crime_type` is "Theft".

---

### Starter code
```r
library(dplyr)

crime_data <- data.frame(
  case_id = 1:5,
  crime_type = c("Theft", "Assault", "Theft", "Fraud", "Theft"),
  district = c("North", "East", "West", "South", "North"),
  offender_age = c(22, 35, 19, 41, 28)
)

# Filter for thefts only
filtered_data <- filter(crime_data, crime_type == "Theft")

print(filtered_data)
```

---

**Tip:**
- Use `filter()` from the `dplyr` package.
- Check the output to make sure only "Theft" crimes are shown.

---

**Why this matters:**
Filtering is a key skill for analyzing real crime data and focusing on specific types of offenses.
