# Annotated R Analysis Script

# This script demonstrates tidyverse data manipulation, ggplot2 visualization, and APA-style reporting for criminology data.
# All steps are commented to clarify the pedagogical intent and reproducibility focus.

# ---
# How Dodona Exercises Are Created
#
# 1. **Learning Objective**: Each exercise starts with a clear learning goal (e.g., understanding factors, creating frequency tables, or visualizing data).
# 2. **Contextualization**: Exercises use criminology-relevant data (e.g., burglary rates, offender ages) to ensure relevance and engagement.
# 3. **Scaffolding**: Tasks are broken down into manageable steps, with hints and feedback targeting common misconceptions (e.g., difference between factors and characters).
# 4. **Test Cases**: Automated tests (see 01-Answer.R) check for correct variable types, values, and structure, providing targeted feedback for errors.
# 5. **Feedback**: Feedback is both technical (e.g., type errors) and conceptual (e.g., misunderstanding measurement levels), and can be provided in Dutch or English.
# 6. **Reproducibility**: Students are encouraged to write clear, annotated, and reproducible code, using tidyverse conventions and best practices.
# 7. **Reporting**: Exercises often include a reporting component, guiding students to present results in APA format using packages like apaTables or sjPlot.
#
# Example: See 01-Answer.R for a Dodona exercise that checks for correct creation of factors, ordered factors, numeric and character vectors, and provides detailed feedback.
# ---

# Load required packages
library(tidyverse)   # For data manipulation and visualization
library(apaTables)   # For APA-style tables (install if needed)

# Simulate a small criminology dataset
df <- tibble(
  district = c("A", "B", "C", "D", "E"),
  burglaries = c(12, 18, 7, 15, 10),
  population = c(1000, 1200, 950, 1100, 1050),
  avg_age = c(32, 28, 35, 30, 29)
)

# Calculate burglary rate per 1000 inhabitants
df <- df %>%
  mutate(burglary_rate = burglaries / population * 1000)

# Summarize: mean and sd of burglary rate
summary_stats <- df %>%
  summarise(
    mean_rate = mean(burglary_rate),
    sd_rate = sd(burglary_rate)
  )

# Print summary statistics
print(summary_stats)

# Create a scatterplot: average age vs. burglary rate
ggplot(df, aes(x = avg_age, y = burglary_rate)) +
  geom_point(size = 3, color = "steelblue") +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed", color = "darkred") +
  labs(
    title = "Burglary Rate vs. Average Age by District",
    x = "Average Age",
    y = "Burglary Rate per 1000"
  ) +
  theme_minimal()

# Generate an APA-style correlation table
apa.cor.table(df %>% select(burglaries, population, avg_age, burglary_rate))

# Note: apaTables output is best viewed in RStudio or as a .doc file. For Dodona, focus on code clarity and reproducibility.
