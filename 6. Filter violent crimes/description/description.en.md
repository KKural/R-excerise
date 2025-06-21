# Filter violent crimes using subset()

## Criminological Context
Crime analysts often need to filter datasets to focus on specific types of offenses. Separating violent crimes from non-violent ones is a common task in criminological research, as these categories often have different patterns, causes, and interventions.

## Task
You have a dataset of reported crimes. Use the `subset()` function to create a new dataset containing only violent crimes (those classified as 'Assault', 'Robbery', or 'Homicide') and store it in a variable called `violent_crimes_df`.

```R
# A data frame of reported crimes
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

# Create a new dataset with only violent crimes (Assault, Robbery, or Homicide)
# Store the result in a variable called 'violent_crimes_df'

# Your code here

```

**Bloom Level: Apply**

**Tips:** 
- The `subset()` function in R allows you to select specific rows from a data frame based on a condition
- Use the `%in%` operator to check if values are in a set (e.g., `offense %in% c("Assault", "Robbery", "Homicide")`)
- Remember to assign the result to the variable `violent_crimes_df`