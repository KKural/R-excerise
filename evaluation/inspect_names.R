### 3. `evaluation/inspect_names.R`

```r
context({
  testcase("Correct column names in `var_names`", {
    expected <- c(
      "incident_id",
      "date",
      "district",
      "crime_type",
      "value_loss",
      "officers_sent",
      "response_time"
    )
    testEqual(
      "Check `var_names`",
      function(env) env$var_names,
      expected,
      comparator = function(got, want, ...) {
        if (!is.character(got)) {
          get_reporter()$add_message("`var_names` must be a character vector.", type="error")
          return(FALSE)
        }
        if (!identical(got, want)) {
          get_reporter()$add_message(
            paste0(
              " ❌ Expected: ", paste(want, collapse = ", "), 
              "\n ✅  You returned: ", paste(got, collapse = ", ")
            ),
            type="error"
          )
          return(FALSE)
        }
        get_reporter()$add_message("✅ Correct! `var_names` matches the column names.", type="success")
        TRUE
      }
    )
  })
})
