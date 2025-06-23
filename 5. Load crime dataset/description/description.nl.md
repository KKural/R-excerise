Je hebt een csv-bestand `misdaad_data.csv` in de map van deze notebook. Het volledige pad staat in de variabele `bestandspad`.

1. Controleer met `getwd()` in welke map R nu werkt.
2. Zet de werkmap met `setwd()` naar de map van het CSV-bestand (`dirname(bestandspad)`).
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

**Tip:**  
Gebruik `dirname(bestandspad)` voor de map en `basename(bestandspad)` voor de bestandsnaam.
