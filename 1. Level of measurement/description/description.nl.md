Maak een data frame df_crime_data aan met de juiste kolommen en datatypes in R:

1. Maak een data frame `df_crime_data` met de volgende kolommen:
   - `type`: factor met de categorieën "Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"
   - `ernst`: geordende factor met niveaus: "Licht" < "Matig" < "Ernstig"
   - `leeftijd`: numerieke vector met de waarden: 19, 23, 45, 32, 28
   - `district`: karaktervector met de waarden: "A1", "B2", "C3", "D4", "E5"

2. Gebruik de volgende basisfuncties op het data frame en noteer het resultaat:
   - `str(df_crime_data)`  # toont de structuur van het data frame
   - `names(df_crime_data)`  # geeft de kolomnamen terug
   - `length(df_crime_data)`  # geeft het aantal kolommen terug
   - `nrow(df_crime_data)`  # geeft het aantal rijen terug
   - `ncol(df_crime_data)`  # geeft het aantal kolommen terug
   - `head(df_crime_data)`  # toont de eerste rijen van het data frame
   - `summary(df_crime_data)`  # geeft een samenvatting van alle kolommen
   - `class(df_crime_data)`  # geeft het type object terug
   - `dim(df_crime_data)`  # geeft het aantal rijen en kolommen als vector terug

```r
# Voorbeeld:
df_crime_data <- data.frame(
  type = factor(c("Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme")),
  ernst = ordered(c("Licht", "Matig", "Ernstig", "Licht", "Ernstig"), levels = c("Licht", "Matig", "Ernstig")),
  leeftijd = c(19, 23, 45, 32, 28),
  district = c("A1", "B2", "C3", "D4", "E5")
)

str(df_crime_data)
names(df_crime_data)
length(df_crime_data)
nrow(df_crime_data)
ncol(df_crime_data)
head(df_crime_data)
summary(df_crime_data)
class(df_crime_data)
dim(df_crime_data)
```

**Tip:**  
Gebruik `factor()` voor categorische variabelen (nominaal niveau).  
Voor ordinale variabelen gebruik je `factor()` met de parameter `ordered=TRUE` en geef je de `levels` in de juiste volgorde op.  
Gebruik `data.frame()` om de variabelen samen te voegen tot een data frame.
