context({
  testcase("", {
    testEqual(
      "",
      function(env) { NULL },
      NULL,
      comparator = function(got, want, ...) {
        TRUE
      }
    )
  })
}, preExec = {
  # Set up the data
  district_crime_rates <- c(5.58, 6.42, 7.05, 7.18, 6.39)
  national_average <- 6.2
})

# Model solution:
above_average <- district_crime_rates > national_average