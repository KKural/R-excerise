# Evaluation script for Basisfuncties op `df_crime_data`

context({
  testcase("Check if all required functions are used", {
    testEqual(
      "Controleer of alle functies zijn gebruikt",
      function(env) {
        # Convert all code to string for analysis
        user_code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        
        # Required functions to check for
        required_funcs <- c(
          "str\\(df_crime_data\\)", "names\\(df_crime_data\\)", "length\\(df_crime_data\\)", 
          "nrow\\(df_crime_data\\)", "ncol\\(df_crime_data\\)", "head\\(df_crime_data\\)", 
          "summary\\(df_crime_data\\)", "class\\(df_crime_data\\)", "dim\\(df_crime_data\\)"
        )
        
        # Check if all required functions are used
        all_funcs_used <- all(sapply(required_funcs, function(func) grepl(func, user_code)))
        
        if (all_funcs_used) {
          get_reporter()$add_message(
            "✅ Alle vereiste functies zijn gebruikt.",
            type = "success"
          )
          return(TRUE)
        } else {
          missing_funcs <- required_funcs[!sapply(required_funcs, function(func) grepl(func, user_code))]
          get_reporter()$add_message(
            paste0("❌ Niet alle vereiste functies zijn gebruikt. Controleer of je deze functies hebt gebruikt: ", 
                   paste(gsub("\\\\\\(df_crime_data\\\\\\)", "", missing_funcs), collapse=", ")),
            type = "error"
          )
          return(FALSE)
        }
      },
      TRUE
    )
  })
  
  testcase("", {
    
    # 1) str()
    testEqual(
      "",
      function(env) {
        # Check if this function is called in user code
        user_code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        if (!grepl("str\\(df_crime_data\\)", user_code)) {
          get_reporter()$add_message(
            "❌ Je hebt de str() functie niet gebruikt. Voeg str(df_crime_data) toe aan je code.",
            type = "error"
          )
          return(NULL)
        }
        paste(capture.output(str(env$df_crime_data)), collapse = "\n")
      },
      TRUE,
      comparator = function(got, want, ...) {
        # Check for NULL, which means the function was not called
        if (is.null(got)) {
          return(FALSE)
        }
        
        get_reporter()$add_message("```r\n> str(df_crime_data)\n```", type="markdown")
        
        if (grepl("type|ernst|leeftijd|district", got)) {
          get_reporter()$add_message(
            "✅ str(df_crime_data): toont kolomnamen, types en voorbeeldwaarden.",
            type = "success"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            "❌ str(df_crime_data): structuur niet zoals verwacht.",
            type = "error"
          )
          return(FALSE)
        }
      }
    )

    # 2) names()
    testEqual(
      "",
      function(env) {
        # Check if this function is called in user code
        user_code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        if (!grepl("names\\(df_crime_data\\)", user_code)) {
          get_reporter()$add_message(
            "❌ Je hebt de names() functie niet gebruikt. Voeg names(df_crime_data) toe aan je code.",
            type = "error"
          )
          return(NULL)
        }
        names(env$df_crime_data)
      },
      c("type", "ernst", "leeftijd", "district"),
      comparator = function(got, want, ...) {
        # Check for NULL (function not called)
        if (is.null(got)) {
          return(FALSE)
        }
        
        get_reporter()$add_message("```r\n> names(df_crime_data)\n```", type = "markdown")
        
        if (identical(got, want)) {
          get_reporter()$add_message(
            "✅ names(df_crime_data): kolomnamen zijn type, ernst, leeftijd, district.",
            type = "success"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            "❌ names(df_crime_data): onjuiste kolomnamen.",
            type = "error"
          )
          return(FALSE)
        }
      }
    )

    # 3) length()
    testEqual(
      "",
      function(env) {
        # Check if this function is called in user code
        user_code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        if (!grepl("length\\(df_crime_data\\)", user_code)) {
          get_reporter()$add_message(
            "❌ Je hebt de length() functie niet gebruikt. Voeg length(df_crime_data) toe aan je code.",
            type = "error"
          )
          return(NULL)
        }
        length(env$df_crime_data)
      },
      4,
      comparator = function(got, want, ...) {
        # Check for NULL (function not called)
        if (is.null(got)) {
          return(FALSE)
        }
        
        get_reporter()$add_message("```r\n> length(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```\n[1] ", got, "\n```"), type="markdown")
        
        if (got == want) {
          get_reporter()$add_message(
            "✅ length(df_crime_data): aantal kolommen = 4.",
            type="success"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            paste0("❌ length(df_crime_data): geeft ", got, " in plaats van 4."),
            type="error"
          )
          return(FALSE)
        }
      }
    )

    # 4) nrow()
    testEqual(
      "",
      function(env) {
        # Check if this function is called in user code
        user_code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        if (!grepl("nrow\\(df_crime_data\\)", user_code)) {
          get_reporter()$add_message(
            "❌ Je hebt de nrow() functie niet gebruikt. Voeg nrow(df_crime_data) toe aan je code.",
            type = "error"
          )
          return(NULL)
        }
        nrow(env$df_crime_data)
      },
      5,
      comparator = function(got, want, ...) {
        # Check for NULL (function not called)
        if (is.null(got)) {
          return(FALSE)
        }
        
        get_reporter()$add_message("```r\n> nrow(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```\n[1] ", got, "\n```"), type="markdown")
        
        if (got == want) {
          get_reporter()$add_message(
            "✅ nrow(df_crime_data): aantal rijen = 5.",
            type="success"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            paste0("❌ nrow(df_crime_data): geeft ", got, " in plaats van 5."),
            type="error"
          )
          return(FALSE)
        }
      }
    )

    # 5) ncol()
    testEqual(
      "",
      function(env) {
        # Check if this function is called in user code
        user_code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        if (!grepl("ncol\\(df_crime_data\\)", user_code)) {
          get_reporter()$add_message(
            "❌ Je hebt de ncol() functie niet gebruikt. Voeg ncol(df_crime_data) toe aan je code.",
            type = "error"
          )
          return(NULL)
        }
        ncol(env$df_crime_data)
      },
      4,
      comparator = function(got, want, ...) {
        # Check for NULL (function not called)
        if (is.null(got)) {
          return(FALSE)
        }
        
        get_reporter()$add_message("```r\n> ncol(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```\n[1] ", got, "\n```"), type="markdown")
        
        if (got == want) {
          get_reporter()$add_message(
            "✅ ncol(df_crime_data): aantal kolommen = 4.",
            type="success"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            paste0("❌ ncol(df_crime_data): geeft ", got, " in plaats van 4."),
            type="error"
          )
          return(FALSE)
        }
      }
    )

    # 6) head()
    testEqual(
      "",
      function(env) {
        # Check if this function is called in user code
        user_code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        if (!grepl("head\\(df_crime_data\\)", user_code)) {
          get_reporter()$add_message(
            "❌ Je hebt de head() functie niet gebruikt. Voeg head(df_crime_data) toe aan je code.",
            type = "error"
          )
          return(NULL)
        }
        head(env$df_crime_data)
      },
      head(data.frame(
        type     = factor(
                     c("Diefstal","Aanval","Inbraak","Fraude","Vandalisme"),
                     levels = c("Diefstal","Aanval","Inbraak","Fraude","Vandalisme")
                   ),
        ernst    = factor(
                     c("Licht","Matig","Ernstig","Matig","Licht"),
                     levels = c("Licht","Matig","Ernstig"),
                     ordered = TRUE
                   ),
        leeftijd  = c(19, 23, 45, 32, 28),
        district = c("A1","B2","C3","D4","E5"),
        stringsAsFactors = FALSE
      )),
      comparator = function(got, want, ...) {
        # Check for NULL (function not called)
        if (is.null(got)) {
          return(FALSE)
        }
        
        get_reporter()$add_message("```r\n> head(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste(capture.output(print(got)), collapse = "\n"), type="markdown")
        
        if (identical(got, want)) {
          get_reporter()$add_message(
            "✅ head(df_crime_data): eerste 5 rijen komen overeen.",
            type="success"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            "❌ head(df_crime_data): rijen kwamen niet uit zoals verwacht.",
            type="error"
          )
          return(FALSE)
        }
      }
    )

    # 7) summary()
    testEqual(
      "",
      function(env) {
        # Check if this function is called in user code
        user_code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        if (!grepl("summary\\(df_crime_data\\)", user_code)) {
          get_reporter()$add_message(
            "❌ Je hebt de summary() functie niet gebruikt. Voeg summary(df_crime_data) toe aan je code.",
            type = "error"
          )
          return(NULL)
        }
        paste(capture.output(summary(env$df_crime_data)), collapse = "\n")
      },
      TRUE,
      comparator = function(got, want, ...) {
        # Check for NULL (function not called)
        if (is.null(got)) {
          return(FALSE)
        }
        
        get_reporter()$add_message("```r\n> summary(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```\n", got, "\n```"), type="markdown")
        
        # Check for expected substrings in the summary output
        expected <- c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme", "Licht", "Matig", "Ernstig", "leeftijd", "district")
        if (all(sapply(expected, function(x) grepl(x, got)))) {
          get_reporter()$add_message(
            "✅ summary(df_crime_data): toont frequenties en statistieken.",
            type="success"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            "❌ summary(df_crime_data): samenvatting niet zoals verwacht.",
            type="error"
          )
          return(FALSE)
        }
      }
    )

    # 8) class()
    testEqual(
      "",
      function(env) {
        # Check if this function is called in user code
        user_code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        if (!grepl("class\\(df_crime_data\\)", user_code)) {
          get_reporter()$add_message(
            "❌ Je hebt de class() functie niet gebruikt. Voeg class(df_crime_data) toe aan je code.",
            type = "error"
          )
          return(NULL)
        }
        class(env$df_crime_data)[1]
      },
      "data.frame",
      comparator = function(got, want, ...) {
        # Check for NULL (function not called)
        if (is.null(got)) {
          return(FALSE)
        }
        
        get_reporter()$add_message("```r\n> class(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```\n[1] \"", got, "\"\n```"), type="markdown")
        
        if (got == want) {
          get_reporter()$add_message(
            "✅ class(df_crime_data): objecttype = data.frame.",
            type="success"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            paste0("❌ class(df_crime_data): geeft ", got, " in plaats van 'data.frame'."),
            type="error"
          )
          return(FALSE)
        }
      }
    )

    # 9) dim()
    testEqual(
      "",
      function(env) {
        # Check if this function is called in user code
        user_code <- paste(sapply(env$`.__code__`, deparse), collapse = "\n")
        if (!grepl("dim\\(df_crime_data\\)", user_code)) {
          get_reporter()$add_message(
            "❌ Je hebt de dim() functie niet gebruikt. Voeg dim(df_crime_data) toe aan je code.",
            type = "error"
          )
          return(NULL)
        }
        dim(env$df_crime_data)
      },
      c(5L, 4L),
      comparator = function(got, want, ...) {
        # Check for NULL (function not called)
        if (is.null(got)) {
          return(FALSE)
        }
        
        get_reporter()$add_message("```r\n> dim(df_crime_data)\n```", type="markdown")
        get_reporter()$add_message(paste0("```\n[1] ", paste(got, collapse=" "), "\n```"), type="markdown")
        
        if (identical(got, want)) {
          get_reporter()$add_message(
            "✅ dim(df_crime_data): dimensies = (5, 4).",
            type="success"
          )
          return(TRUE)
        } else {
          get_reporter()$add_message(
            paste0("❌ dim(df_crime_data): geeft ", paste(got, collapse=" "), " in plaats van ", paste(want, collapse=" "), "."),
            type="error"
          )
          # Add structure output for debugging
          get_reporter()$add_message(
            paste0("Structuur van output:\n- gekregen: ", paste(capture.output(str(got)), collapse=" "), "\n- verwacht: ", paste(capture.output(str(want)), collapse=" ")), 
            type="markdown"
          )
          return(FALSE)
        }
      }
    )

  })
}, preExec = {
  # Setup: maak df_crime_data met 5 rijen x 4 kolommen
  df_crime_data <- data.frame(
    type = factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"), levels = c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
    ernst = factor(c("Licht", "Matig", "Ernstig", "Matig", "Licht"), ordered = TRUE, levels = c("Licht", "Matig", "Ernstig")),
    leeftijd  = c(19, 23, 45, 32, 28),
    district = c("A1", "B2", "C3", "D4", "E5"),
    stringsAsFactors = FALSE
  )
})
