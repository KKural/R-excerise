context({
  testcase("Check if a plot was created", {
    testEqual(
      "Plot existence",
      function(env) {
        # Capture the plotting function
        plot_calls <- get_function_calls(get_student_code(), function_name = "plot")
        if (length(plot_calls) == 0) {
          return(FALSE)
        }
        return(TRUE)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (!got) {
          get_reporter()$add_message("❌ No plot() function call was detected in your code. Did you create a scatterplot?", type = "error")
          return(FALSE)
        }
        return(TRUE)
      }
    )
  })
  
  testcase("Check plot parameters", {
    testEqual(
      "Plot function parameters",
      function(env) {
        # Get the plot calls and parameters
        plot_calls <- get_function_calls(get_student_code(), function_name = "plot")
        if (length(plot_calls) == 0) {
          return(NULL)
        }
        
        # Check the first plot call
        args <- plot_calls[[1]]$args
        
        # Extract named parameters and first two unnamed params (x and y)
        params <- list()
        if (length(args) >= 2) {
          params$x_var <- args[[1]]
          params$y_var <- args[[2]]
        }
        
        # Extract named parameters
        for (i in seq_along(args)) {
          if (!is.null(names(args)) && names(args)[i] != "") {
            params[[names(args)[i]]] <- args[[i]]
          }
        }
        
        return(params)
      },
      "placeholder", # We'll compare in the comparator function
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          # Already handled in previous test
          return(FALSE)
        }
        
        # Check variable names
        x_var_names <- c("unemployment", "unemployment_rates")
        y_var_names <- c("crime_rates", "property_crime_rates")
        
        x_ok <- FALSE
        if ("x_var" %in% names(got)) {
          x_name <- as.character(got$x_var)
          x_ok <- any(sapply(x_var_names, function(n) grepl(n, x_name)))
        }
        
        y_ok <- FALSE
        if ("y_var" %in% names(got)) {
          y_name <- as.character(got$y_var)
          y_ok <- any(sapply(y_var_names, function(n) grepl(n, y_name)))
        }
        
        if (!x_ok || !y_ok) {
          get_reporter()$add_message("❌ Make sure you're using unemployment for the x-axis and crime_rates for the y-axis.", type = "error")
          return(FALSE)
        }
        
        # Check for a main title
        title_ok <- FALSE
        if ("main" %in% names(got)) {
          title <- as.character(got$main)
          title_ok <- grepl("unemployment", tolower(title), ignore.case = TRUE) && 
                     grepl("crime", tolower(title), ignore.case = TRUE)
        }
        
        if (!title_ok) {
          get_reporter()$add_message('⚠️ Consider adding a title using the main parameter, e.g., main="Relationship between Unemployment and Property Crime"', type = "warning")
        }
        
        # Check for axis labels
        xlab_ok <- FALSE
        if ("xlab" %in% names(got)) {
          xlab <- as.character(got$xlab)
          xlab_ok <- grepl("unemployment", tolower(xlab), ignore.case = TRUE)
        }
        
        if (!xlab_ok) {
          get_reporter()$add_message('⚠️ Consider adding an x-axis label using the xlab parameter, e.g., xlab="Unemployment Rate (%)"', type = "warning")
        }
        
        ylab_ok <- FALSE
        if ("ylab" %in% names(got)) {
          ylab <- as.character(got$ylab)
          ylab_ok <- grepl("crime", tolower(ylab), ignore.case = TRUE)
        }
        
        if (!ylab_ok) {
          get_reporter()$add_message('⚠️ Consider adding a y-axis label using the ylab parameter, e.g., ylab="Property Crime Rate (per 1,000)"', type = "warning")
        }
        
        get_reporter()$add_message("✅ Good job! You've created a scatterplot showing the relationship between unemployment and crime rates.", type = "success")
        return(TRUE)
      }
    )
  })
}, preExec = {
  # Set up the data
  unemployment <- c(4.2, 5.7, 7.9, 6.5, 8.1, 5.3, 9.2, 7.1, 6.8, 5.9, 8.5, 7.4, 6.2, 9.0, 5.1)
  crime_rates <- c(25.3, 28.6, 33.1, 29.7, 35.4, 26.8, 38.2, 31.5, 30.9, 29.3, 36.1, 32.7, 29.0, 37.8, 27.2)
  
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

# Model solution:
plot(unemployment, crime_rates,
     main = "Relationship between Unemployment and Property Crime",
     xlab = "Unemployment Rate (%)",
     ylab = "Property Crime Rate (per 1,000)")