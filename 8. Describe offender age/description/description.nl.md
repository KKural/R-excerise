Je hebt gegevens over de leeftijden van personen die zijn gearresteerd voor verschillende strafbare feiten. Gebruik de functie `summary()` om beschrijvende statistieken te genereren voor de leeftijden van de verdachten en sla het resultaat op in een variabele genaamd `age_summary`.

```R
# Vector met leeftijden van verdachten
offender_ages <- c(19, 23, 45, 32, 28, 21, 24, 19, 37, 42, 18, 25, 22, 31, 19, 
                   27, 36, 29, 24, 33, 41, 26, 20, 38, 22, 19, 25, 29, 31, 34)

# Genereer een samenvatting van de leeftijden en sla deze op in een variabele genaamd 'age_summary'
age_summary <- summary(offender_ages)
```

**Tip:**  
Gebruik `summary()` om beschrijvende statistieken te krijgen van een numerieke vector. Ken het resultaat toe aan `age_summary`.
