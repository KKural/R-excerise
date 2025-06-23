# Meetniveau

Maak de volgende variabelen aan met de juiste datatypes in R:

1. Maak een variabele `crime_types` als factor met deze categorieën: "Theft", "Assault", "Burglary", "Fraud", "Vandalism"
2. Maak een variabele `crime_severity` als geordende factor met niveaus: "Minor", "Moderate", "Severe" (in deze volgorde)
3. Maak een variabele `offender_ages` als numeriek vector met deze waarden: 19, 23, 45, 32, 28, 21
4. Maak een variabele `district_codes` als karaktervector met deze waarden: "A1", "B2", "C3", "D4", "E5"

```R
# 1. Maak de crime_types factorvariabele aan
# Gebruik factor() voor categorische variabelen

# 2. Maak de crime_severity geordende factorvariabele aan
# Gebruik factor() met ordered=TRUE en specificeer de levels

# 3. Maak de offender_ages numerieke vector aan
# Gebruik c() om de getallen te combineren

# 4. Maak de district_codes karaktervector aan
# Gebruik c() om de codes als tekst samen te voegen
```

**Tip:**  
Gebruik `factor()` voor categorische variabelen (nominaal niveau).  
Voor ordinale variabelen gebruik je `factor()` met de parameter `ordered=TRUE` en geef je de `levels` in de juiste volgorde op.

# Feedback (English version in comment)

- Gebruik factor() voor categorische variabelen en geef de juiste niveaus op.
- Controleer of de volgorde van de levels bij geordende factoren klopt.
- Controleer of de numerieke en karaktervectoren correct zijn aangemaakt.

<!--
- Use factor() for categorical variables and specify the correct levels.
- Check that the order of levels for ordered factors is correct.
- Check that the numeric and character vectors are created correctly.
-->
