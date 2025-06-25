#–– Data setup ––
leeftijden_daders <- c(
  19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
  27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
)

#–– Evaluation ––
context({
  testcase("Feedback bij samenvatting leeftijden", {
    testEqual({
      # Compute expected summary from the student’s env
      expected <- summary(get("leeftijden_daders", envir = env, inherits = FALSE))

      # 1️⃣ Existence check
      if (!exists("leeftijd_samenvatting", envir = env, inherits = FALSE)) {
        get_reporter()$add_message(
          "❌ Het object `leeftijd_samenvatting` bestaat niet.",
          type = "error"
        )
        get_reporter()$add_message(
          "Tip: Maak het object aan met:\n```r\nleeftijd_samenvatting <- summary(leeftijden_daders)\n```",
          type = "info"
        )
        return(FALSE)
      }

      # 2️⃣ Type & value check
      val <- get("leeftijd_samenvatting", envir = env, inherits = FALSE)
      if (!identical(val, expected)) {
        get_reporter()$add_message(
          "❌ De inhoud van `leeftijd_samenvatting` klopt niet.",
          type = "error"
        )
        get_reporter()$add_message(
          "Tip: Gebruik exact `leeftijd_samenvatting <- summary(leeftijden_daders)` zonder extra bewerkingen.",
          type = "info"
        )
        return(FALSE)
      }

      # 3️⃣ Success: show code → output → ✅ in three messages
      get_reporter()$add_message(
        "```r\n> leeftijd_samenvatting <- summary(leeftijden_daders)\n> leeftijd_samenvatting\n```",
        type = "markdown"
      )
      get_reporter()$add_message(
        paste0(
          "```r\n",
          paste(capture.output(print(expected)), collapse = "\n"),
          "\n```"
        ),
        type = "markdown"
      )
      get_reporter()$add_message(
        "✅ Juist! `leeftijd_samenvatting` is correct aangemaakt.",
        type = "success"
      )

      return(TRUE)
    }, expected = TRUE)
  })
}, preExec = {
  # Pre‐execution: make the vector available to the student’s env
  leeftijden_daders <- c(
    19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
    27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34
  )
})
