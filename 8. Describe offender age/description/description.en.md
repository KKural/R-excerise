You have data on the ages of individuals who were arrested for various offenses. Use the `summary()` function to generate descriptive statistics for the offender ages and store the result in a variable called `age_summary`.

```R
# Vector of offender ages
offender_ages <- c(19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
                   27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34)

# Generate a summary of offender ages and store it in a variable called 'age_summary'
age_summary <- summary(offender_ages)

```

**Tip:**  
Use `summary()` to get descriptive statistics for a numeric vector. Assign the result to `age_summary`.