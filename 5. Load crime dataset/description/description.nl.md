Je bent een onderzoeker die patronen van criminaliteit in verschillende districten onderzoekt. Je hebt een datasetbestand genaamd "misdaad_data.csv" ontvangen met gegevens over diverse strafbare feiten.

Laad de dataset in R en sla deze op in een variabele genaamd `misdaad_df`. Het bestandspad is al beschikbaar in de variabele `bestandspad`.

1. Stel de werkdirectory in met `setwd()` zodat je in de juiste map werkt (gebruik eventueel `dirname(bestandspad)` als hulpmiddel).
2. Controleer de huidige werkdirectory met `getwd()`.
3. Laad de dataset in met `read.csv()` en sla deze op als `misdaad_df`.

```r
# Zet de werkdirectory naar de map van het bestand
setwd(dirname(bestandspad))

# Controleer de huidige werkdirectory
getwd()

# Gebruik read.csv() om de dataset te laden vanaf bestandspad
misdaad_df <- read.csv(basename(bestandspad))
```

*Tip: De variabele 'bestandspad' bevat het volledige pad naar het CSV-bestand. Met `dirname()` krijg je de map, met `basename()` de bestandsnaam.*
