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
  crime_counts <- c(143, 265, 97, 418, 204)
  population <- c(25640, 41250, 13760, 58200, 31890)
})

# Model solution:
crime_rates <- (crime_counts / population) * 1000