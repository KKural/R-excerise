# ───────────────────────────────────────────────────────────────
# starter code: build crime_df
# ───────────────────────────────────────────────────────────────
set.seed(42)
crime_df <- tibble::tibble(
  incident_id   = sprintf("INC%03d", 1:200),
  date          = sample(
                    seq.Date(as.Date("2023-01-01"),
                             as.Date("2023-12-31"), by="day"),
                    200, replace = TRUE
                  ),
  district      = sample(c("A","B","C","D"), 200, replace=TRUE,
                         prob=c(0.4,0.3,0.2,0.1)),
  crime_type    = sample(c("Burglary","Assault","Theft","Vandalism"),
                          200, replace=TRUE),
  value_loss    = round(rlnorm(200, meanlog=3, sdlog=1)),
  officers_sent = sample(1:5, 200, replace=TRUE),
  response_time = round(rnorm(200, mean=12, sd=4), 1)
) %>%
  dplyr::mutate(response_time = pmax(response_time,0))
