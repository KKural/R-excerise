# 1.1 Exploring the Structure of `crime_stats_ghent`

The dataset `crime_stats_ghent` is available from the `crimsyndata` package. In this exercise, you will use basic R functions to explore the structure and content of this data frame.

Type and run the following commands in the R console to explore `crime_stats_ghent`:

```r
str(crime_stats_ghent)
names(crime_stats_ghent)
length(crime_stats_ghent)
nrow(crime_stats_ghent)
ncol(crime_stats_ghent)
head(crime_stats_ghent)
summary(crime_stats_ghent)
class(crime_stats_ghent)
dim(crime_stats_ghent)
```

**What should you do?**

- Type each of the commands above one by one in the R console.
- Observe the output of each function.
- Use the output to understand how the data frame is constructed.

*Hint*: If you do not have the package installed, run:
```r
install.packages("remotes")
remotes::install_github("KKural/crimsyndata", force = TRUE)
library(crimsyndata)
```
