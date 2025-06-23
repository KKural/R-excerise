context({
  testcase("Reproducible RMarkdown chunks", {
    testEqual(
      "Check RMarkdown chunk",
      function(env) { is.character(rmd_chunk) },
      TRUE
    )
  })
}, preExec = {
  # Example: rmd_chunk <<- "```{r}\nsummary(crime_data)\n```"
})
