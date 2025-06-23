Maak de volgende variabelen aan met de juiste datatypes in R:

1. Maak een variabele `misdaad_types` als factor met deze categorieën: "Diefstal", "Aanval", "Inbraak", "Fraude", "Vandalisme"
2. Maak een variabele `ernst_misdaad` als geordende factor met niveaus: "Licht", "Matig", "Ernstig" (in deze volgorde)
3. Maak een variabele `leeftijden_daders` als numeriek vector met deze waarden: 19, 23, 45, 32, 28, 21
4. Maak een variabele `district_codes` als karaktervector met deze waarden: "A1", "B2", "C3", "D4", "E5"

```R
# 1. Maak de misdaad_types factorvariabele aan
#    Gebruik factor() met expliciete levels

# 2. Maak de ernst_misdaad geordende factorvariabele aan
#    Gebruik factor(…, ordered = TRUE) en specificeer de levels

# 3. Maak de leeftijden_daders numerieke vector aan
#    Gebruik c() om de getallen samen te voegen

# 4. Maak de district_codes karaktervector aan
#    Gebruik c() om de codes als tekst samen te voegen

**Tip:**  
Gebruik `factor()` voor categorische variabelen (nominaal niveau).  
Voor ordinale variabelen gebruik je `factor()` met de parameter `ordered=TRUE` en geef je de `levels` in de juiste volgorde op.
