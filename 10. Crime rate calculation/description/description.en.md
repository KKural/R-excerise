# Calculate crime rate per population

## Criminological Context
Crime rates normalize crime counts by population size, allowing for meaningful comparisons between areas with different population densities. This is a fundamental calculation in criminology and criminal justice research.

## Task
You have data on crime counts and population for five different districts. Calculate the crime rate per 1,000 population for each district and store the results in a variable called `crime_rates`.

```R
# Crime counts for five districts
crime_counts <- c(143, 265, 97, 418, 204)

# Population for the corresponding districts
population <- c(25640, 41250, 13760, 58200, 31890)

# Calculate crime rates per 1,000 population for each district
# Formula: (crime_count / population) * 1000

# Your code here

```

**Bloom Level: Apply**

**Tips:** 
- Use element-wise division to divide the crime counts by their corresponding population values
- Multiply the results by 1000 to get rates per 1,000 population
- Remember to assign the result to the variable `crime_rates`