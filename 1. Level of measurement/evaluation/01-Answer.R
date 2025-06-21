While technical functionality is essential, my strongest differentiator is my pedagogical expertise. I bridge the gap between programming and teaching by designing learning experiences that align with students' cognitive development through Bloom's Taxonomy. Unlike purely technical developers, I anticipate common misconceptions in statistical reasoning—such as conflating correlation with causation or misinterpreting non-significant p-values. My exercises address these challenges through three pedagogical approaches: (1) targeted, misconception-specific feedback that guides students to correct understanding, (2) strategically designed answer options that reveal conceptual gaps, and (3) supportive explanations in Dutch that reinforce key concepts. This pedagogical focus ensures students not only complete exercises successfully but truly develop statistical literacy and critical thinking skills.While technical functionality is essential, my strongest differentiator is my pedagogical expertise. I bridge the gap between programming and teaching by designing learning experiences that align with students' cognitive development through Bloom's Taxonomy. Unlike purely technical developers, I anticipate common misconceptions in statistical reasoning—such as conflating correlation with causation or misinterpreting non-significant p-values. My exercises address these challenges through three pedagogical approaches: (1) targeted, misconception-specific feedback that guides students to correct understanding, (2) strategically designed answer options that reveal conceptual gaps, and (3) supportive explanations in Dutch that reinforce key concepts. This pedagogical focus ensures students not only complete exercises successfully but truly develop statistical literacy and critical thinking skills.context({
  testcase("Check crime_types factor", {
    testEqual(
      "crime_types variable type and content",
      function(env) { 
        if (!exists("crime_types", envir = env)) {
          return(NULL)
        }
        return(list(
          is_factor = is.factor(env$crime_types),
          levels = levels(env$crime_types),
          is_ordered = is.ordered(env$crime_types)
        ))
      },
      list(
        is_factor = TRUE,
        levels = c("Theft", "Assault", "Burglary", "Fraud", "Vandalism"),
        is_ordered = FALSE
      ),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'crime_types' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!got$is_factor) {
          get_reporter()$add_message("❌ The variable 'crime_types' should be a factor, not a " + class(get_student_env()$crime_types) + ".", type = "error")
          return(FALSE)
        }
        
        if (got$is_ordered) {
          get_reporter()$add_message("❌ The variable 'crime_types' should be a regular (unordered) factor, not an ordered factor.", type = "error")
          return(FALSE)
        }
        
        if (!identical(sort(got$levels), sort(want$levels))) {
          get_reporter()$add_message(paste0("❌ The levels of 'crime_types' should be: ", paste(want$levels, collapse = ", "), "."), type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've created 'crime_types' as a factor with the appropriate levels.", type = "success")
        return(TRUE)
      }
    )
  })
  
  testcase("Check crime_severity ordered factor", {
    testEqual(
      "crime_severity variable type and content",
      function(env) { 
        if (!exists("crime_severity", envir = env)) {
          return(NULL)
        }
        return(list(
          is_factor = is.factor(env$crime_severity),
          is_ordered = is.ordered(env$crime_severity),
          levels = levels(env$crime_severity)
        ))
      },
      list(
        is_factor = TRUE,
        is_ordered = TRUE,
        levels = c("Minor", "Moderate", "Severe")
      ),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'crime_severity' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!got$is_factor) {
          get_reporter()$add_message("❌ The variable 'crime_severity' should be a factor, not a " + class(get_student_env()$crime_severity) + ".", type = "error")
          return(FALSE)
        }
        
        if (!got$is_ordered) {
          get_reporter()$add_message("❌ The variable 'crime_severity' should be an ordered factor. Use ordered=TRUE in your factor() function.", type = "error")
          return(FALSE)
        }
        
        if (!identical(got$levels, want$levels)) {
          get_reporter()$add_message(paste0("❌ The levels of 'crime_severity' should be in the order: ", paste(want$levels, collapse = ", "), "."), type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've created 'crime_severity' as an ordered factor with the appropriate levels.", type = "success")
        return(TRUE)
      }
    )
  })
  
  testcase("Check offender_ages numeric vector", {
    testEqual(
      "offender_ages variable type and content",
      function(env) { 
        if (!exists("offender_ages", envir = env)) {
          return(NULL)
        }
        return(list(
          is_numeric = is.numeric(env$offender_ages),
          values = env$offender_ages
        ))
      },
      list(
        is_numeric = TRUE,
        values = c(19, 23, 45, 32, 28, 21)
      ),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'offender_ages' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!got$is_numeric) {
          get_reporter()$add_message("❌ The variable 'offender_ages' should be numeric, not " + class(get_student_env()$offender_ages) + ".", type = "error")
          return(FALSE)
        }
        
        if (!identical(got$values, want$values)) {
          get_reporter()$add_message("❌ The values in 'offender_ages' don't match the expected values.", type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've created 'offender_ages' as a numeric vector with the appropriate values.", type = "success")
        return(TRUE)
      }
    )
  })
  
  testcase("Check district_codes character vector", {
    testEqual(
      "district_codes variable type and content",
      function(env) { 
        if (!exists("district_codes", envir = env)) {
          return(NULL)
        }
        return(list(
          is_character = is.character(env$district_codes),
          values = env$district_codes
        ))
      },
      list(
        is_character = TRUE,
        values = c("A1", "B2", "C3", "D4", "E5")
      ),
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'district_codes' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!got$is_character) {
          get_reporter()$add_message("❌ The variable 'district_codes' should be a character vector, not " + class(get_student_env()$district_codes) + ".", type = "error")
          return(FALSE)
        }
        
        if (!identical(got$values, want$values)) {
          get_reporter()$add_message("❌ The values in 'district_codes' don't match the expected values.", type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've created 'district_codes' as a character vector with the appropriate values.", type = "success")
        return(TRUE)
      }
    )
  })
})

# Model solution:
# 1. Create the crime_types factor variable
crime_types <- factor(c("Theft", "Assault", "Burglary", "Fraud", "Vandalism"))

# 2. Create the crime_severity ordered factor variable
crime_severity <- factor(c("Minor", "Moderate", "Severe"), 
                         levels = c("Minor", "Moderate", "Severe"), 
                         ordered = TRUE)

# 3. Create the offender_ages numeric vector
offender_ages <- c(19, 23, 45, 32, 28, 21)

# 4. Create the district_codes character vector
district_codes <- c("A1", "B2", "C3", "D4", "E5")