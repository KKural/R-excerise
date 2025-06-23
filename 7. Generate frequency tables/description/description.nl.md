Je hebt gegevens over delictsoorten uit politierapporten. Genereer een frequentietabel die laat zien hoe vaak elke delictsoort voorkomt in de dataset, en sla het resultaat op in een variabele genaamd `offense_table`.

```R
# Vector van delictsoorten uit politierapporten
offense_types <- c("Theft", "Assault", "Burglary", "Vandalism", "Theft", "Theft", 
                   "Assault", "Theft", "Burglary", "Vandalism", "Theft", "Assault", 
                   "Drug Offense", "Theft", "Burglary", "Vandalism", "Assault", 
                   "Theft", "Drug Offense", "Burglary")

# Genereer een frequentietabel van delictsoorten en sla deze op in een variabele genaamd 'offense_table'


**Tip:**  
Gebruik `table()` om een frequentietabel te maken van een vector. Ken het resultaat toe aan `offense_table`.
