context({
  testcase("Correlation analysis", {
    testEqual(
      "Check correlation result",
      function(env) { exists("correlation_result") },
      TRUE
    )
  })
}, preExec = {
  # Example: correlation_result <<- cor(crime_data$var1, crime_data$var2)
})
