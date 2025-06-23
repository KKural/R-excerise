context({
  testcase("Cleaning data", {
    testEqual(
      "Check cleaned data",
      function(env) { exists("clean_data") },
      TRUE
    )
  })
}, preExec = {
  # Example: clean_data <<- ...
})
