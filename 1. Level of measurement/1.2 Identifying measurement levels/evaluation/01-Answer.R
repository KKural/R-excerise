context({
  testcase("Check level_case_id assignment", {
    testEqual(
      "level_case_id value",
      function(env) { 
        if (!exists("level_case_id", envir = env)) {
          return(NULL)
        }
        return(tolower(env$level_case_id))
      },
      "nominal",
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'level_case_id' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (!is.character(got)) {
          get_reporter()$add_message("❌ The variable 'level_case_id' should be a character string, not a " + class(get_student_env()$level_case_id) + ".", type = "error")
          return(FALSE)
        }
        
        if (got != want) {
          get_reporter()$add_message(paste0("❌ The measurement level for 'case_id' is not correct. Think about what case_id represents - although it's a number, is it used for mathematical operations?"), type = "error")
          return(FALSE)
        }
        
        return(TRUE)
      }
    )
  })
  
  testcase("Check level_gender assignment", {
    testEqual(
      "level_gender value",
      function(env) { 
        if (!exists("level_gender", envir = env)) {
          return(NULL)
        }
        return(tolower(env$level_gender))
      },
      "nominal",
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'level_gender' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (got != want) {
          get_reporter()$add_message("❌ The measurement level for 'gender' is not correct. Gender categories like Male/Female have no inherent order.", type = "error")
          return(FALSE)
        }
        
        return(TRUE)
      }
    )
  })
  
  testcase("Check level_age assignment", {
    testEqual(
      "level_age value",
      function(env) { 
        if (!exists("level_age", envir = env)) {
          return(NULL)
        }
        return(tolower(env$level_age))
      },
      "ratio",
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'level_age' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (got != want) {
          get_reporter()$add_message("❌ The measurement level for 'age' is not correct. Age has equal intervals and a meaningful zero point (0 years old).", type = "error")
          return(FALSE)
        }
        
        return(TRUE)
      }
    )
  })
  
  testcase("Check level_crime_type assignment", {
    testEqual(
      "level_crime_type value",
      function(env) { 
        if (!exists("level_crime_type", envir = env)) {
          return(NULL)
        }
        return(tolower(env$level_crime_type))
      },
      "nominal",
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'level_crime_type' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (got != want) {
          get_reporter()$add_message("❌ The measurement level for 'crime_type' is not correct. Crime types are categories without an inherent order.", type = "error")
          return(FALSE)
        }
        
        return(TRUE)
      }
    )
  })
  
  testcase("Check level_sentence_length assignment", {
    testEqual(
      "level_sentence_length value",
      function(env) { 
        if (!exists("level_sentence_length", envir = env)) {
          return(NULL)
        }
        return(tolower(env$level_sentence_length))
      },
      "ratio",
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'level_sentence_length' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (got != want) {
          get_reporter()$add_message("❌ The measurement level for 'sentence_length' is not correct. Sentence length has equal intervals and a meaningful zero (0 months).", type = "error")
          return(FALSE)
        }
        
        return(TRUE)
      }
    )
  })
  
  testcase("Check level_education_level assignment", {
    testEqual(
      "level_education_level value",
      function(env) { 
        if (!exists("level_education_level", envir = env)) {
          return(NULL)
        }
        return(tolower(env$level_education_level))
      },
      "ordinal",
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'level_education_level' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (got != want) {
          get_reporter()$add_message("❌ The measurement level for 'education_level' is not correct. Education levels have a natural order (Primary < Secondary < Higher).", type = "error")
          return(FALSE)
        }
        
        return(TRUE)
      }
    )
  })
  
  testcase("Check level_risk_category assignment", {
    testEqual(
      "level_risk_category value",
      function(env) { 
        if (!exists("level_risk_category", envir = env)) {
          return(NULL)
        }
        return(tolower(env$level_risk_category))
      },
      "ordinal",
      comparator = function(got, want, ...) {
        if (is.null(got)) {
          get_reporter()$add_message("❌ The variable 'level_risk_category' doesn't exist. Did you forget to create it?", type = "error")
          return(FALSE)
        }
        
        if (got != want) {
          get_reporter()$add_message("❌ The measurement level for 'risk_category' is not correct. Risk categories have a natural order (Low < Medium < High).", type = "error")
          return(FALSE)
        }
        
        get_reporter()$add_message("✅ Correct! You've successfully identified all measurement levels.", type = "success")
        return(TRUE)
      }
    )
  })
  
  testcase("Check overall correctness", {
    testEqual(
      "All levels correct",
      function(env) {
        if (!exists("level_case_id", envir = env) || 
            !exists("level_gender", envir = env) ||
            !exists("level_age", envir = env) ||
            !exists("level_crime_type", envir = env) ||
            !exists("level_sentence_length", envir = env) ||
            !exists("level_education_level", envir = env) ||
            !exists("level_risk_category", envir = env)) {
          return(FALSE)
        }
        
        all_correct = tolower(env$level_case_id) == "nominal" &&
                      tolower(env$level_gender) == "nominal" &&
                      tolower(env$level_age) == "ratio" &&
                      tolower(env$level_crime_type) == "nominal" &&
                      tolower(env$level_sentence_length) == "ratio" &&
                      tolower(env$level_education_level) == "ordinal" &&
                      tolower(env$level_risk_category) == "ordinal"
        
        return(all_correct)
      },
      TRUE,
      comparator = function(got, want, ...) {
        if (got) {
          get_reporter()$add_message("✅ Perfect! You've correctly identified all measurement levels. This understanding is crucial for selecting appropriate statistical methods.", type = "success")
          return(TRUE)
        }
        return(FALSE)
      }
    )
  })
}, preExec = {
  # Set up the crime_data data frame
  crime_data <- data.frame(
    case_id = c(1001, 1002, 1003, 1004, 1005),
    gender = c("Male", "Female", "Male", "Male", "Female"),
    age = c(24, 37, 19, 42, 31),
    crime_type = c("Theft", "Assault", "Burglary", "Theft", "Fraud"),
    sentence_length = c(12, 36, 6, 15, 24),
    education_level = c("Secondary", "Primary", "Higher", "Secondary", "Higher"),
    risk_category = c("Medium", "High", "Low", "Medium", "Low")
  )
})

# Model solution:
level_case_id <- "nominal"
level_gender <- "nominal"
level_age <- "ratio"
level_crime_type <- "nominal"
level_sentence_length <- "ratio"
level_education_level <- "ordinal"
level_risk_category <- "ordinal"