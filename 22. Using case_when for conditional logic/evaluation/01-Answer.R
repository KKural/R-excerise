context({
  testcase("Using case_when for conditional logic", {
    testEqual(
      "Check case_when result",
      function(env) { exists("case_data") },
      TRUE
    )
  })
}, preExec = {
  # Example: case_data <<- mutate(crime_data, new_col = case_when(...))
})
