context({
  testcase("Sorting data", {
    testEqual(
      "Check sorting",
      function(env) { isTRUE(all.equal(arranged_data, arranged_data[order(arranged_data$column), ])) },
      TRUE
    )
  })
}, preExec = {
  # Example: arranged_data <<- arrange(crime_data, column)
})
