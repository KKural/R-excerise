# Creating variables with appropriate types

## Criminological Context
In criminological research, variables come in different measurement levels. Coding these variables correctly in R is essential for proper analysis. In this exercise, you'll work with data about different types of crimes.

## Task
Create the following variables with appropriate data types in R:

1. Create a variable `crime_types` as a factor with these categories: "Theft", "Assault", "Burglary", "Fraud", "Vandalism"

2. Create a variable `crime_severity` as an ordered factor with levels: "Minor", "Moderate", "Severe" (in that order)

3. Create a variable `offender_ages` as a numeric vector with these values: 19, 23, 45, 32, 28, 21

4. Create a variable `district_codes` as a character vector with these values: "A1", "B2", "C3", "D4", "E5"

```R
# 1. Create the crime_types factor variable
# Your code here


# 2. Create the crime_severity ordered factor variable
# Your code here


# 3. Create the offender_ages numeric vector
# Your code here


# 4. Create the district_codes character vector
# Your code here


```

**Bloom Level: Remember & Understand**

**Tips:** 
- Use `factor()` to create categorical variables (nominal level)
- Use `factor()` with the `ordered=TRUE` parameter and `levels=` to specify the order for ordinal variables
- Use `c()` to create vectors of any type
- For character vectors, enclose each value in quotes