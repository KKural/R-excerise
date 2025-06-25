#–– Data setup ––
leeftijden_daders <- c(
  19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
  27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
)

#–– Evaluation ––
context({
  testcase("Feedback bij samenvatting leeftijden", {
    testEqual(
      "Controleer `leeftijd_samenvatting <- summary(leeftijden_daders)`",
      
      function(env) {
        # 📌 Pull the vector from the student's env
        vec <- get("leeftijden_daders", envir = env, inherits = FALSE)
        
        # 1) Compute the correct summary
        expected <- summary(vec)

        # 2) Existence check in the right env
        if (!exists("leeftijd_samenvatting", envir = env, inherits = FALSE)) {
          get_reporter()$add_message(
            paste0(
              "❌ Het object `leeftijd_samenvatting` bestaat niet.\n",
              "Maak het aan met:\n",
              "```r\n",
              "leeftijd_samenvatting <- summary(leeftijden_daders)\n",
              "```"
            ),
            type = "error"
          )
          return(FALSE)
        }

        # 3) Fetch and compare
        val <- get("leeftijd_samenvatting", envir = env, inherits = FALSE)
        if (!identical(val, expected)) {
          get_reporter()$add_message(
            "❌ `leeftijd_samenvatting` komt niet overeen met `summary(leeftijden_daders)`. Probeer opnieuw.",
            type = "error"
          )
          return(FALSE)
        }

        # 4) Success: show the correct code + output + ✅
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

      # we expect TRUE when all checks pass
      TRUE
    )
  })
})
