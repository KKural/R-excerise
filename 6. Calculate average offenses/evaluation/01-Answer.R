# bloom_level: Apply
# scaffolding_level: Full support
# primm_phase: Run

context({
  testcase("", {
    testEqual(
      "",
      function(env) { NULL },
      NULL,
      comparator = function(got, want, ...) {
        TRUE
      }
    )
  })
}, preExec = {
  # Set up the monthly_offenses vector
  monthly_offenses <- c(42, 47, 53, 58, 61, 65, 72, 68, 59, 54, 48, 45)
})

# Model solution:
avg_offenses <- mean(monthly_offenses)