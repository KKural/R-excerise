# ── Grader: beschrijf de leeftijden ──────────────────────────────────────
context({
  testcase("Leeftijd daders beschrijven", {

    testEqual(
      # 1️⃣ FIRST argument → evaluated in the learner’s env → becomes `got`
      function(env) {
        if (!exists("leeftijd_samenvatting", envir = env)) return(NA)
        get("leeftijd_samenvatting", envir = env)
      },

      # 2️⃣ SECOND argument → teacher value → becomes `want`
      summary(leeftijden_daders),

      # 3️⃣ custom comparator says when to pass or fail
      comparator = function(got, want, ...) {

        ## ---- object missing ---- ##
        if (is.na(got)[1]) {
          get_reporter()$add_message(
            "❌ Object `leeftijd_samenvatting` not found. Create it with `leeftijd_samenvatting <- summary(leeftijden_daders)`.",
            type = "error"
          )
          return(FALSE)
        }

        ## ---- wrong type ---- ##
        if (!(is.numeric(got) && !is.null(names(got)))) {
          get_reporter()$add_message(
            "❌ `leeftijd_samenvatting` must be exactly the result of `summary(leeftijden_daders)`.",
            type = "error"
          )

          get_reporter()$add_message("Your object:", type = "markdown")
          get_reporter()$add_message(
            paste0("```r\n", capture.output(str(got)), "\n```"),
            type = "code"
          )
          return(FALSE)
        }

        ## ---- wrong values ---- ##
        if (!identical(got, want)) {
          get_reporter()$add_message(
            "❌ The contents of `leeftijd_samenvatting` are not correct.",
            type = "error"
          )

          get_reporter()$add_message("🚫 Your output:", type = "markdown")
          get_reporter()$add_message(
            paste0("```r\n", paste(capture.output(print(got)), collapse = "\n"), "\n```"),
            type = "code"
          )

          get_reporter()$add_message("✅ Expected output:", type = "markdown")
          get_reporter()$add_message(
            paste0("```r\n", paste(capture.output(print(want)), collapse = "\n"), "\n```"),
            type = "code"
          )
          return(FALSE)
        }

        ## ---- success ---- ##
        get_reporter()$add_message(
          "✅ Well done! `leeftijd_samenvatting` is correct.",
          type = "success"
        )

        get_reporter()$add_message("Here is the summary again:", type = "markdown")
        get_reporter()$add_message(
          paste0("```r\n", paste(capture.output(print(want)), collapse = "\n"), "\n```"),
          type = "code"
        )
        TRUE
      }
    )

  })
}, preExec = {
  # Make the data available to learner and tests
  leeftijden_daders <- c(
    19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
    27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
  )
})
