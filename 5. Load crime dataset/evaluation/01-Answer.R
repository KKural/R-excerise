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
  # Create a simulated crime data file
  library(tibble)
  library(dplyr)
  
  set.seed(42)
  crime_df <- tibble(
    incident_id    = sprintf("INC%03d", 1:200),
    date           = sample(seq.Date(as.Date("2023-01-01"), as.Date("2023-12-31"), by = "day"), 200, replace = TRUE),
    district       = sample(c("A", "B", "C", "D"), 200, replace = TRUE, prob = c(0.4, 0.3, 0.2, 0.1)),
    crime_type     = sample(c("Burglary", "Assault", "Theft", "Vandalism"), 200, replace = TRUE),
    value_loss     = round(rlnorm(200, meanlog = 3, sdlog = 1)),
    officers_sent  = sample(1:5, 200, replace = TRUE),
    response_time  = round(rnorm(200, mean = 12, sd = 4), 1)
  ) %>% mutate(response_time = pmax(response_time, 0))
  
  # Save the data to a temporary file that will act as our "crime_data.csv"
  temp_dir <- tempdir()
  file_path <- file.path(temp_dir, "crime_data.csv")
  write.csv(crime_df, file = file_path, row.names = FALSE)
  
  # Make the file path available to the student
  file_path <- "crime_data.csv"
})

# Model solution:
crime_df <- read.csv(file_path)