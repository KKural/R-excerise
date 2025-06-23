Je hebt een dataset met gerapporteerde misdrijven. Gebruik de functie `subset()` om een nieuwe dataset te maken die alleen gewelddadige misdrijven bevat (deze zijn geclassificeerd als 'Assault', 'Robbery' of 'Homicide') en sla deze op in een variabele genaamd `violent_crimes_df`.

```R
# Een data frame met gerapporteerde misdrijven
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

# Maak een nieuwe dataset met alleen gewelddadige misdrijven (Assault, Robbery of Homicide)
# Sla het resultaat op in een variabele genaamd 'violent_crimes_df'

# Gebruik subset() om rijen te selecteren waar offense "Assault", "Robbery" of "Homicide" is
# Ken het resultaat toe aan violent_crimes_df
```
