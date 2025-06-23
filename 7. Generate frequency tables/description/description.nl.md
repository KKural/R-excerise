Je hebt gegevens over delictsoorten uit politierapporten. Genereer een frequentietabel die laat zien hoe vaak elke delictsoort voorkomt in de dataset, en sla het resultaat op in een variabele genaamd `delict_tabel`.

```R
# Vector van delictsoorten uit politierapporten
delictsoorten <- c("Diefstal", "Aanval", "Inbraak", "Vandalisme", "Diefstal", "Diefstal", 
                   "Aanval", "Diefstal", "Inbraak", "Vandalisme", "Diefstal", "Aanval", 
                   "Drugsdelict", "Diefstal", "Inbraak", "Vandalisme", "Aanval", 
                   "Diefstal", "Drugsdelict", "Inbraak")

# Genereer een frequentietabel van delictsoorten en sla deze op in een variabele genaamd 'delict_tabel'


**Tip:**  
Gebruik `table()` om een frequentietabel te maken van een vector. Ken het resultaat toe aan `delict_tabel`.
