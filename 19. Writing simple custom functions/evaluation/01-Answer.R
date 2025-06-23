context({
  testcase("Writing simple custom functions", {
    testEqual(
      "Check custom function",
      function(env) { is.function(custom_function) },
      TRUE
    )
  })
}, preExec = {
  # Example: custom_function <<- function(x) x
})
