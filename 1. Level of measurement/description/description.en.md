# Level of measurement

Create the following variables with appropriate data types in R:

1. Create a variable `crime_types` as a factor with these categories: "Theft", "Assault", "Burglary", "Fraud", "Vandalism"
2. Create a variable `crime_severity` as an ordered factor with levels: "Minor", "Moderate", "Severe" (in that order)
3. Create a variable `offender_ages` as a numeric vector with these values: 19, 23, 45, 32, 28, 21
4. Create a variable `district_codes` as a character vector with these values: "A1", "B2", "C3", "D4", "E5"

```R
# 1. Create the crime_types factor variable
# Use factor() for categorical variables

# 2. Create the crime_severity ordered factor variable
# Use factor() with ordered=TRUE and specify the levels

# 3. Create the offender_ages numeric vector
# Use c() to combine the numbers

# 4. Create the district_codes character vector
# Use c() to combine the codes as character strings
```

**Tip:**  
Use `factor()` for categorical variables (nominal level).  
For ordinal variables, use `factor()` with the `ordered=TRUE` parameter and specify the `levels` in the correct order.