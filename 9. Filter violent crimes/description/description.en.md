# Filter violent crimes

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

# Use subset() to select rows where offense is "Assault", "Robbery", or "Homicide"
# Assign the result to violent_crimes_df

```

**Tip:**  
Use `subset()` with `%in%` to select specific values. Assign the result to `violent_crimes_df`.