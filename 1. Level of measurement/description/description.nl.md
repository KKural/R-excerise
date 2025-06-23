Je hebt een data frame `df_crime_data` met de volgende kolommen:
- `type`: factor met de categorieën "Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"
- `ernst`: geordende factor met niveaus: "Licht" < "Matig" < "Ernstig"
- `leeftijd`: numerieke vector met de waarden: 19, 23, 45, 32, 28
- `district`: karaktervector met de waarden: "A1", "B2", "C3", "D4", "E5"

Gebruik de volgende basisfuncties op het data frame en noteer het resultaat. Lees bij elke functie wat deze doet:
- `str(df_crime_data)`: toont de structuur van het data frame, inclusief kolomnamen, type van elke kolom en de eerste waarden. Dit helpt je snel te zien welke variabelen er zijn en welk type ze hebben.
- `names(df_crime_data)`: geeft een vector met de kolomnamen terug, zodat je weet hoe de variabelen heten.
- `length(df_crime_data)`: geeft het aantal kolommen terug, dus hoeveel variabelen er in het data frame zitten.
- `nrow(df_crime_data)`: geeft het aantal rijen terug, dus hoeveel observaties er zijn.
- `ncol(df_crime_data)`: geeft het aantal kolommen terug, net als length().
- `head(df_crime_data)`: toont de eerste rijen van het data frame, zodat je een indruk krijgt van de data.
- `summary(df_crime_data)`: geeft een samenvatting van alle kolommen, zoals frequenties voor factoren en statistieken voor numerieke kolommen.
- `class(df_crime_data)`: geeft het type object terug, meestal 'data.frame'.
- `dim(df_crime_data)`: geeft een vector met het aantal rijen en kolommen, bijvoorbeeld c(5, 4).

```r
# Voorbeeld:
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
Gebruik deze functies om snel inzicht te krijgen in de structuur en inhoud van een data frame in R.
