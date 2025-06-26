# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      {
        # First show the expected command and output
        get_reporter()$add_message("```r\n> str(df_crime_data)\n```", type = "markdown")
        # Then check the student's code
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("str\\s*\\(\\s*df_crime_data\\s*\\)", code_str)) {
          get_reporter()$add_message(
            "❌ Gebruik str(df_crime_data) om de structuur van de data te bekijken.",
            type = "error"
          )
          return(FALSE)
        }
        # Show what str() gives
        str_output <- capture.output(str(df_crime_data))
        get_reporter()$add_message(
          "✅ Je hebt str() correct gebruikt. Dit toont de structuur van df_crime_data:",
          type = "success"
        )
        get_reporter()$add_message(
          paste0("```\n", paste(str_output, collapse = "\n"), "\n```"),
          type = "markdown"
        )
        # Also show what other functions give
        get_reporter()$add_message(
          "\nHier zijn andere nuttige functies om data te verkennen:",
          type = "markdown"
        )
        get_reporter()$add_message("```r", type = "markdown")
        get_reporter()$add_message("> names(df_crime_data)", type = "markdown")
        get_reporter()$add_message(paste(capture.output(names(df_crime_data)), collapse = "\n"), type = "markdown")
        get_reporter()$add_message("\n> head(df_crime_data)", type = "markdown")
        get_reporter()$add_message(paste(capture.output(head(df_crime_data)), collapse = "\n"), type = "markdown")
        get_reporter()$add_message("```", type = "markdown")
        return(TRUE)
      },
      TRUE
    )
  })
}, preExec = {
  # Create sample data
  df_crime_data <- data.frame(
    zaak_id = sprintf("ZAAK%03d", 1:10),
    datum = as.Date("2023-01-01") + 0:9,
    district = sample(c("Noord", "Zuid", "Oost", "West", "Centrum"), 10, TRUE),
    delict = sample(c("Diefstal", "Aanval", "Inbraak", "Vandalisme"), 10, TRUE),
    waardeverlies = round(rlnorm(10, 3, 1)),
    agenten = sample(1:5, 10, TRUE),
    reactietijd = round(pmax(rnorm(10, 12, 4), 0), 1)
  )
})
