# bloom_level: Remember & Understand
# scaffolding_level: Full support
# primm_phase: Run

#–– Data setup ––
df_crime_data <- data.frame(
  zaak_id = sprintf("ZAAK%03d", 1:10),
  datum = as.Date("2023-01-01") + 0:9,
  district = sample(c("Noord", "Zuid", "Oost", "West", "Centrum"), 10, TRUE),
  delict = sample(c("Diefstal", "Aanval", "Inbraak", "Vandalisme"), 10, TRUE),
  waardeverlies = round(rlnorm(10, 3, 1)),
  agenten = sample(1:5, 10, TRUE),
  reactietijd = round(pmax(rnorm(10, 12, 4), 0), 1)
)

#–– Evaluation ––
context({
  testcase("", {
    testEqual(
      "",
      {
        # Always show the expected command
        get_reporter()$add_message("```r\n> str(df_crime_data)\n```", type="markdown")
        
        # Check if str() is used in student's code
        code_str <- paste(sapply(get(".__code__", envir=env()), deparse), collapse="\n")
        if (!grepl("str\\s*\\(", code_str)) {
          get_reporter()$add_message("❌ Gebruik str() om de structuur van de data te bekijken.", type="error")
          return(FALSE)
        }

        # Show output when correct
        get_reporter()$add_message("✅ Je hebt str() correct gebruikt. Dit toont de structuur:", type="success")
        get_reporter()$add_message(paste0("```\n", paste(capture.output(str(df_crime_data)), collapse="\n"), "\n```"), type="markdown")
        return(TRUE)
      },
      TRUE
    )
  })
})
