context({
  testcase("APA-style regression tables", {
    testEqual(
      "Check regression table",
      function(env) { exists("regression_table") },
      TRUE
    )
  })
}, preExec = {
  # Example: regression_table <<- apaTables::apa.reg.table(...)
})
