context({
  testcase("Final project crime report", {
    testEqual(
      "Check final report",
      function(env) { exists("final_report") },
      TRUE
    )
  })
}, preExec = {
  # Example: final_report <<- ...
})
