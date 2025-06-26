# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

#–– Data setup ––
context({
  testcase("", {
    # Create test data first
    df_crime_data <- data.frame(
      zaak_id = sprintf("ZAAK%03d", 1:10),
      datum = as.Date("2023-01-01") + 0:9,
      district = sample(c("Noord", "Zuid", "Oost", "West", "Centrum"), 10, TRUE),
      delict = sample(c("Diefstal", "Aanval", "Inbraak", "Vandalisme"), 10, TRUE),
      waardeverlies = round(rlnorm(10, 3, 1)),
      agenten = sample(1:5, 10, TRUE),
      reactietijd = round(pmax(rnorm(10, 12, 4), 0), 1)
    )
    
    # Write to a temp CSV file
    temp_file <- tempfile(fileext = ".csv")
    write.csv(df_crime_data, temp_file, row.names = FALSE)
    
    # Test if student loaded the data
    testEqual("Check data loading", {
      if (!exists("df_crime_data", envir = env())) {
        get_reporter()$add_message(
          "❌ Het object 'df_crime_data' bestaat niet. Gebruik read.csv() om de data in te laden.",
          type = "error"
        )
        return(FALSE)
      }
      if (!is.data.frame(env$df_crime_data)) {
        get_reporter()$add_message(
          "❌ 'df_crime_data' moet een data frame zijn.",
          type = "error"
        )
        return(FALSE)
      }
      get_reporter()$add_message(
        "✅ Data is correct ingeladen.",
        type = "success"
      )
      return(TRUE)
    }, TRUE)

    # Test required function usage
    required_functions <- c("str", "names", "length", "nrow", "ncol", "head", "summary", "class", "dim")
    for (func in required_functions) {
      testEqual(paste("Controleer gebruik van", func), {
        # Check if function is used in student code
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl(paste0(func, "\\s*\\("), code_str)) {
          get_reporter()$add_message(
            paste0("❌ De ", func, "() functie werd niet gebruikt."),
            type = "error"
          )
          return(FALSE)
        }
        # Show the output
        get_reporter()$add_message(
          paste0("```r\n> ", func, "(df_crime_data)\n```"),
          type = "markdown"
        )
        output <- capture.output(do.call(func, list(env$df_crime_data)))
        get_reporter()$add_message(
          paste0("✅ De ", func, "() functie werd correct gebruikt. Hier is de output:"),
          type = "success"
        )
        get_reporter()$add_message(
          paste0("```\n", paste(output, collapse = "\n"), "\n```"),
          type = "markdown"
        )
        return(TRUE)
      }, TRUE)
    }
  })
})
