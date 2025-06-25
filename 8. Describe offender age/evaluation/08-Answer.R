#–– Evaluation ––
context({
  testcase("Feedback bij samenvatting leeftijden", {
    testEqual(
      "Controleer leeftijd_samenvatting <- summary(leeftijden_daders)",

      function(env) {
        # Data setup: define leeftijden_daders inside the test function
        leeftijden_daders <- c(
          19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19,
          27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
        )
        # Compute the correct summary once
        expected <- summary(leeftijden_daders)

        # 1) Existence check in the test env only
        if (!exists("leeftijd_samenvatting", envir = env, inherits = FALSE)) {
          get_reporter()$add_message(
            "❌ Het object `leeftijd_samenvatting` bestaat niet.\nMaak het aan met:\n```r\nleeftijd_samenvatting <- summary(leeftijden_daders)\n```",
            type = "error"
          )
          return(FALSE)
        }

        # 2) Fetch and compare
        val <- get("leeftijd_samenvatting", envir = env, inherits = FALSE)
        if (!identical(val, expected)) {
          get_reporter()$add_message(
            "❌ `leeftijd_samenvatting` komt niet overeen met `summary(leeftijden_daders)`. Probeer opnieuw.",
            type = "error"
          )
          return(FALSE)
        }

        # 3) Success: only here do we show the code + printed result + ✅
        get_reporter()$add_message(
          paste0(
            "```r\n",
            "> leeftijd_samenvatting <- summary(leeftijden_daders)\n",
            "> leeftijd_samenvatting\n",
            "```"
          ),
          type = "markdown"
        )
        get_reporter()$add_message(
          "✅ Juist! `leeftijd_samenvatting` is correct aangemaakt.",
          type = "success"
        )

        return(TRUE)
      },

      # we expect TRUE if all checks pass
      TRUE
    )
  })
})
