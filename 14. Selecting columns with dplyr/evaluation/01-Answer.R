context({
  testcase("Selecting columns", {
    testEqual(
      "Check selected columns",
      function(env) { colnames(selected_data) },
      c("column1", "column2")
    )
  })
}, preExec = {
  # Example: selected_data <<- select(crime_data, column1, column2)
})
