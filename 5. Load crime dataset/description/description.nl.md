### 5 . Het laden van de crime dataset

Je bent een onderzoeker die criminaliteit in verschillende districten bestudeert.  
In de map die dit notebook uitvoert staat al een CSV-bestand **`misdaad_data.csv`**
— het **volledige pad** ervan vind je in de kant-en-klare variabele
`bestandspad`.

#### Opdracht  
1. **Controleer** eerst met `getwd()` in welke map R nu werkt.  
2. Verander daarna met `setwd()` naar de map waarin het CSV-bestand staat  
   *(hint: dat is `dirname(bestandspad)`)*
3. Lees het bestand in met `read.csv()` en sla het resultaat op in
   **`misdaad_df`**.  
4. Zet je werkmap tenslotte weer terug met `setwd()`.

> **Samengevat – code-skeleton**

```r
# 1. huidige werkmap tonen
getwd()

# 2. map bepalen + ernaartoe wisselen
data_dir <- dirname(bestandspad)
old_dir  <- getwd()
setwd(data_dir)

# 3. CSV laden
misdaad_df <- read.csv(basename(bestandspad))

# 4. optioneel: terug naar oorspronkelijke map
setwd(old_dir)
