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
        get_reporter()$add_message("```r\n> str(submission)\n```", type = "markdown")
        # Check function usage
        if (!exists("submission", envir = env())) {
          get_reporter()$add_message("❌ We kunnen het dataset 'submission' niet vinden.", type = "error")
          return(FALSE)
        }
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("str\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De str() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(str(env$submission))
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
        get_reporter()$add_message("```r\n> names(submission)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("names\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De names() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(names(env$submission))
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
        get_reporter()$add_message("```r\n> length(submission)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("length\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De length() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(length(env$submission))
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
        get_reporter()$add_message("```r\n> nrow(submission)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("nrow\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De nrow() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(nrow(env$submission))
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
        get_reporter()$add_message("```r\n> ncol(submission)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("ncol\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De ncol() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(ncol(env$submission))
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
        get_reporter()$add_message("```r\n> head(submission)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("head\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De head() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(head(env$submission))
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
        get_reporter()$add_message("```r\n> summary(submission)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("summary\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De summary() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(summary(env$submission))
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
        get_reporter()$add_message("```r\n> class(submission)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("class\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De class() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(class(env$submission))
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
        get_reporter()$add_message("```r\n> dim(submission)\n```", type = "markdown")
        # Check function usage
        code_str <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        if (!grepl("dim\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ De dim() functie werd niet gebruikt.", type = "error")
          return(FALSE)
        }
        # Show output
        output <- capture.output(dim(env$submission))
        get_reporter()$add_message("✅ De dim() functie werd correct gebruikt. Hier is de output:", type = "success")
        get_reporter()$add_message(paste0("```\n", paste(output, collapse = "\n"), "\n```"), type = "markdown")
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) { got == want }
    )
  })
})
