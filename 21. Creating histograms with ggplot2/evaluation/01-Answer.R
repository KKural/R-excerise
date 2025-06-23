context({
  testcase("Creating histograms with ggplot2", {
    testEqual(
      "Check histogram object",
      function(env) { inherits(crime_histogram, "ggplot") },
      TRUE
    )
  })
}, preExec = {
  # Example: crime_histogram <<- ggplot(crime_data, aes(x = column)) + geom_histogram()
})
