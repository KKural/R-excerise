context({
  testcase("Creating new columns", {
    testEqual(
      "Check new column",
      function(env) { "new_column_name" %in% colnames(mutated_data) },
      TRUE
    )
  })
}, preExec = {
  # Example: mutated_data <<- mutate(crime_data, new_column_name = ...)
})
