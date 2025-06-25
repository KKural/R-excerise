maandelijkse_feiten <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
# Students: Submit only the following expression as your answer:
# mean(maandelijkse_feiten)

context({
  testcase("Feedback bij berekenen van gemiddelde", {
    testEqual(
      "De uitkomst van mean(maandelijkse_feiten) is correct berekend",
      function(env) {
        student_value <- if (!is.null(env$result)) env$result else env$last_value
        verwacht <- mean(maandelijkse_feiten)
        if (is.null(student_value) || !is.numeric(student_value)) {
          get_reporter()$add_message(
            "❌ Je antwoord is geen numerieke waarde. Gebruik mean(maandelijkse_feiten)",
            type = "error"
          )
          return(FALSE)
        }
        if (abs(student_value - verwacht) > 1e-6) {
          get_reporter()$add_message(
            paste0("❌ Je antwoord is niet het juiste gemiddelde. Gebruik mean(maandelijkse_feiten). Het juiste gemiddelde is: ", round(verwacht, 2)),
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          paste0("✅ Correct! Het gemiddelde is: ", round(verwacht, 2)),
          type = "success"
        )
        return(TRUE)
      },
      mean(maandelijkse_feiten),
      comparator = function(got, want, ...) {
        if (is.null(got) || !is.numeric(got)) {
          get_reporter()$add_message(
            "❌ Je antwoord is geen numerieke waarde. Gebruik mean(maandelijkse_feiten)",
            type = "error"
          )
          return(FALSE)
        }
        if (abs(got - want) > 1e-6) {
          get_reporter()$add_message(
            paste0("❌ Je antwoord is niet het juiste gemiddelde. Gebruik mean(maandelijkse_feiten). Het juiste gemiddelde is: ", round(want, 2)),
            type = "error"
          )
          return(FALSE)
        }
        get_reporter()$add_message(
          paste0("✅ Correct! Het gemiddelde is: ", round(want, 2)),
          type = "success"
        )
        return(TRUE)
      }
    )
  })
}, preExec = {
  maandelijkse_feiten <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
})