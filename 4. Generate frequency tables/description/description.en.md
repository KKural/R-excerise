# Generate frequency tables with table()

## Criminological Context
Frequency tables are essential tools in criminology for understanding the distribution of various categorical variables, such as crime types, locations, or offender demographics. They help identify patterns and hotspots in criminal activity.

## Task
You have data on offense types from police reports. Generate a frequency table that shows how many times each offense type appears in the dataset, and store the result in a variable called `offense_table`.

```R
# Vector of offense types from police reports
offense_types <- c("Theft", "Assault", "Burglary", "Vandalism", "Theft", "Theft", 
                   "Assault", "Theft", "Burglary", "Vandalism", "Theft", "Assault", 
                   "Drug Offense", "Theft", "Burglary", "Vandalism", "Assault", 
                   "Theft", "Drug Offense", "Burglary")

# Generate a frequency table of offense types and store it in a variable called 'offense_table'

# Your code here

```

**Bloom Level: Remember & Understand**

**Tips:** 
- The `table()` function in R creates a frequency table of the values in a vector
- Remember to assign the result to the variable `offense_table`