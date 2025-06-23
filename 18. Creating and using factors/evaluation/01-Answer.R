context({
  testcase("Creating and using factors", {
    testEqual(
      "Check factor variable",
      function(env) { is.factor(factor_data$column) },
      TRUE
    )
  })
}, preExec = {
  # Example: factor_data <<- mutate(crime_data, column = factor(column))
})
