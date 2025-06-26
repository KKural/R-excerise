# Leerdoel: Je leert hoe je frequentietabellen maakt om categorische data samen te vatten.

In deze oefening ga je een frequentietabel maken van delictsoorten uit politierapporten. Een frequentietabel telt hoe vaak elke unieke waarde voorkomt in een dataset.

1. Bekijk de vector `delictsoorten` die al voor je is aangemaakt.
2. Maak een frequentietabel die laat zien hoe vaak elke delictsoort voorkomt in de dataset.
3. Sla het resultaat op in een variabele genaamd `delict_tabel`.

```R
# Vector van delictsoorten uit politierapporten
delictsoorten <- c("Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal", 
                   "Aanval", "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval", 
                   "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval", 
                   "Diefstal", "Drugsdelict", "Inbraak")

# Genereer een frequentietabel van delictsoorten en sla deze op in een variabele genaamd 'delict_tabel'

```

**Hint:**  
Gebruik `table()` om een frequentietabel te maken van een vector. Ken het resultaat toe aan `delict_tabel` met de toewijzingsoperator `<-`.

**Voorbeeld:**  
```r
fruit <- c("appel", "banaan", "appel", "peer", "banaan", "appel")
fruit_tabel <- table(fruit)
print(fruit_tabel)
# Output:
# fruit
#  appel banaan   peer 
#      3      2      1 
```
