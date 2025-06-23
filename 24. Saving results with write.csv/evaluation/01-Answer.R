context({
  testcase("Saving results with write.csv", {
    testEqual(
      "Check file saved",
      function(env) { file.exists("output.csv") },
      TRUE
    )
  })
}, preExec = {
  # Example: write.csv(crime_data, "output.csv", row.names = FALSE)
})
