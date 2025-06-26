# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("Basisfuncties op df_crime_data", {
    # Test str()
    testEqual(
      "Controleer gebruik van str()",
      {
        # Emit command for visibility
        get_reporter()$add_message("```r\n> str(df_crime_data)\n```", type = "markdown")
        # Check function usage
        if (!exists("df_crime_data", envir = env())) {
          get_reporter()$add_message("❌ We kunnen het dataset 'df_crime_data' niet vinden.", type = "error")
          return(FALSE)
        }
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("str\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De str() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(str(env$df_crime_data))
        get_reporter()$add_message("✅ De str() functie werd correct gebruikt. Hier is de output:", type = "success")
        get_reporter()$add_message(paste0("```\n", paste(output, collapse = "\n"), "\n```"), type = "markdown")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )

    # Test names()
    testEqual(
      "Controleer gebruik van names()",
      {
        # Emit command for visibility
        get_reporter()$add_message("```r\n> names(df_crime_data)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("names\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De names() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(names(env$df_crime_data))
        get_reporter()$add_message("✅ De names() functie werd correct gebruikt. Hier is de output:", type = "success")
        get_reporter()$add_message(paste0("```\n", paste(output, collapse = "\n"), "\n```"), type = "markdown")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )

    # Test length()
    testEqual(
      "Controleer gebruik van length()",
      {
        # Emit command for visibility
        get_reporter()$add_message("```r\n> length(df_crime_data)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("length\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De length() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(length(env$df_crime_data))
        get_reporter()$add_message("✅ De length() functie werd correct gebruikt. Hier is de output:", type = "success")
        get_reporter()$add_message(paste0("```\n", paste(output, collapse = "\n"), "\n```"), type = "markdown")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )

    # Test nrow()
    testEqual(
      "Controleer gebruik van nrow()",
      {
        # Emit command for visibility
        get_reporter()$add_message("```r\n> nrow(df_crime_data)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("nrow\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De nrow() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(nrow(env$df_crime_data))
        get_reporter()$add_message("✅ De nrow() functie werd correct gebruikt. Hier is de output:", type = "success")
        get_reporter()$add_message(paste0("```\n", paste(output, collapse = "\n"), "\n```"), type = "markdown")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )

    # Test ncol()
    testEqual(
      "Controleer gebruik van ncol()",
      {
        # Emit command for visibility
        get_reporter()$add_message("```r\n> ncol(df_crime_data)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("ncol\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De ncol() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(ncol(env$df_crime_data))
        get_reporter()$add_message("✅ De ncol() functie werd correct gebruikt. Hier is de output:", type = "success")
        get_reporter()$add_message(paste0("```\n", paste(output, collapse = "\n"), "\n```"), type = "markdown")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )

    # Test head()
    testEqual(
      "Controleer gebruik van head()",
      {
        # Emit command for visibility
        get_reporter()$add_message("```r\n> head(df_crime_data)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("head\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De head() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(head(env$df_crime_data))
        get_reporter()$add_message("✅ De head() functie werd correct gebruikt. Hier is de output:", type = "success")
        get_reporter()$add_message(paste0("```\n", paste(output, collapse = "\n"), "\n```"), type = "markdown")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )

    # Test summary()
    testEqual(
      "Controleer gebruik van summary()",
      {
        # Emit command for visibility
        get_reporter()$add_message("```r\n> summary(df_crime_data)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("summary\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De summary() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(summary(env$df_crime_data))
        get_reporter()$add_message("✅ De summary() functie werd correct gebruikt. Hier is de output:", type = "success")
        get_reporter()$add_message(paste0("```\n", paste(output, collapse = "\n"), "\n```"), type = "markdown")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )

    # Test class()
    testEqual(
      "Controleer gebruik van class()",
      {
        # Emit command for visibility
        get_reporter()$add_message("```r\n> class(df_crime_data)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("class\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De class() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(class(env$df_crime_data))
        get_reporter()$add_message("✅ De class() functie werd correct gebruikt. Hier is de output:", type = "success")
        get_reporter()$add_message(paste0("```\n", paste(output, collapse = "\n"), "\n```"), type = "markdown")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )

    # Test dim()
    testEqual(
      "Controleer gebruik van dim()",
      {
        # Emit command for visibility
        get_reporter()$add_message("```r\n> dim(df_crime_data)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("dim\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De dim() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(dim(env$df_crime_data))
        get_reporter()$add_message("✅ De dim() functie werd correct gebruikt. Hier is de output:", type = "success")
        get_reporter()$add_message(paste0("```\n", paste(output, collapse = "\n"), "\n```"), type = "markdown")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )
  })
}, preExec = {
  # Create a sample crime dataset for testing
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
