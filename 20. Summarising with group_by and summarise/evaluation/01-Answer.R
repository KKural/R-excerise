context({
  testcase("Summarising with group_by and summarise", {
    testEqual(
      "Check summary data",
      function(env) { exists("summary_data") },
      TRUE
    )
  })
}, preExec = {
  # Example: summary_data <<- crime_data %>% group_by(column) %>% summarise(mean = mean(value))
})
