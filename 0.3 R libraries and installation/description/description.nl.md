Maak kennis met R-pakketten en het installeren ervan:

1. Lees waarom pakketten belangrijk zijn in R en waarvoor ze gebruikt worden.
2. Leer hoe je een pakket installeert met de functie `install.packages()`.
3. Oefen met het installeren en laden van een pakket, bijvoorbeeld `dplyr`.

```r
# 1. Waarom zijn pakketten belangrijk?
#    Pakketten breiden de functionaliteit van R uit, bijvoorbeeld voor data-analyse of visualisatie.

# 2. Installeer een pakket
install.packages("dplyr")

# 3. Laad het pakket in je sessie
library(dplyr)
```

**Tip:**  
Gebruik `install.packages()` slechts één keer per pakket. Gebruik `library()` elke keer als je een nieuw R-sessie start en het pakket wilt gebruiken.