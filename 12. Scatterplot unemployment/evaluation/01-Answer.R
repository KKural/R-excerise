context({
  testcase("", {
    testEqual(
      "",
      function(env) { NULL },
      NULL,
      comparator = function(got, want, ...) {
        TRUE
      }
    )
  })
}, preExec = {
  # Set up the data
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
  
  # Helper function to extract function calls from code
  get_function_calls <- function(code, function_name) {
    # This is a simple approximation - in a real scenario, this would use R's parsing
    # to properly extract function calls and their arguments
    pattern <- paste0(function_name, "\\s*\\(([^\\)]+)\\)")
    matches <- gregexpr(pattern, code)
    calls <- regmatches(code, matches)[[1]]
    
    result <- list()
    for (call in calls) {
      # Extract arguments
      args_str <- sub(paste0(function_name, "\\s*\\((.*)\\)"), "\\1", call)
      
      # Basic parsing of arguments - this is simplified
      args <- list()
      parts <- strsplit(args_str, ",")[[1]]
      for (i in seq_along(parts)) {
        part <- trimws(parts[i])
        if (grepl("=", part)) {
          # Named argument
          name_value <- strsplit(part, "=")[[1]]
          name <- trimws(name_value[1])
          value <- trimws(name_value[2])
          args[[name]] <- value
        } else {
          # Unnamed argument
          args[[i]] <- part
        }
      }
      
      result[[length(result) + 1]] <- list(function = function_name, args = args)
    }
    
    return(result)
  }
})

context({
  testcase("Feedback bij spreidingsdiagram werkloosheid en criminaliteit", {
    testEqual(
      "plot() is correct aangeroepen",
      function(env) {
        # Check if plot() is called with correct arguments
        code <- paste(sapply(env$`.__code__`, function(e) paste(deparse(e), collapse = " ")), collapse = "\n")
        grepl("plot\\s*\\(\\s*werkloosheid\\s*,\\s*criminaliteitscijfers.*main\\s*=\\s*['\"]Relatie tussen werkloosheid en criminaliteit['\"].*xlab\\s*=\\s*['\"]Werkloosheidspercentage \(\%\)['\"].*ylab\\s*=\\s*['\"]Criminaliteitscijfer \(per 1.000\)['\"]", code)
      },
      TRUE,
      comparator = identical
    )
  })
}, preExec = {
  # Set up the data
  werkloosheid <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  criminaliteitscijfers <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
})

# Model solution:
plot(werkloosheid, criminaliteitscijfers, main = "Relatie tussen werkloosheid en criminaliteit", xlab = "Werkloosheidspercentage (%)", ylab = "Criminaliteitscijfer (per 1.000)")