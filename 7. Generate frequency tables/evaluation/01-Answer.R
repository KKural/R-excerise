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
  # Set up the offense_types vector
  offense_types <- c("Theft", "Assault", "Burglary", "Vandalism", "Theft", "Theft", 
                   "Assault", "Theft", "Burglary", "Vandalism", "Theft", "Assault", 
                   "Drug Offense", "Theft", "Burglary", "Vandalism", "Assault", 
                   "Theft", "Drug Offense", "Burglary")
})

# Model solution:
offense_table <- table(offense_types)