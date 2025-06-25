# Leerdoel: Je leert een csv-bestand correct inladen in R en werken met werkmappen.

In deze oefening ga je een csv-bestand met misdaadcijfers inladen. Het volledige pad naar het bestand staat in de variabele `bestandspad`.

1. Controleer met `getwd()` in welke map R nu werkt.
2. Zet de werkmap met `setwd()` naar de map van het csv-bestand (`dirname(bestandspad)`).
3. Lees het bestand in met `read.csv()` en sla het op als `misdaad_df`.
4. Zet de werkmap eventueel terug met `setwd()`.

```r
getwd()
data_dir <- dirname(bestandspad)
old_dir  <- getwd()
setwd(data_dir)
misdaad_df <- read.csv(basename(bestandspad))
setwd(old_dir)
```

**Hint:**  
Gebruik de functies `dirname()` en `basename()` om respectievelijk de map en de bestandsnaam uit het volledige pad te halen. Controleer altijd of je werkmap correct staat voordat je een bestand inleest.
