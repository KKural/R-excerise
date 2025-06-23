# R en RStudio installeren

Deze gids helpt je bij het installeren van R en RStudio op je computer. Hoewel je Dodona kunt gebruiken zonder deze software te installeren, raden we aan om R en RStudio ook lokaal te installeren voor je eigen projecten.

## Stap 1: R downloaden en installeren

1. Ga naar de officiële R-website: [https://cran.r-project.org/](https://cran.r-project.org/)
2. Kies je besturingssysteem:
   - Voor Windows: Klik op "Download R for Windows"
   - Voor macOS: Klik op "Download R for macOS"
   - Voor Linux: Klik op "Download R for Linux"

![R downloaden](https://ugent.be/img/r-download-cran.png)

3. Windows-gebruikers: Klik op "base" en dan op "Download R x.x.x for Windows" (waarbij x.x.x het meest recente versienummer is)

![R voor Windows downloaden](https://ugent.be/img/r-download-windows.png)

4. macOS-gebruikers: Klik op het .pkg bestand voor de meest recente versie
5. Voer het gedownloade installatiebestand uit en volg de instructies op het scherm

![R installeren](https://ugent.be/img/r-install-wizard.png)

## Stap 2: RStudio downloaden en installeren

RStudio is een gebruiksvriendelijke interface voor R die je programmeerervaring aanzienlijk verbetert.

1. Ga naar de RStudio downloadpagina: [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)
2. Scroll naar beneden en klik op de downloadknop voor jouw besturingssysteem

![RStudio downloaden](https://ugent.be/img/rstudio-download.png)

3. Voer het gedownloade installatiebestand uit en volg de instructies op het scherm

![RStudio installeren](https://ugent.be/img/rstudio-install-wizard.png)

## Stap 3: RStudio voor het eerst openen

1. Start RStudio op je computer. Je zou een scherm moeten zien dat lijkt op onderstaande afbeelding:

![RStudio interface](https://ugent.be/img/rstudio-interface.png)

2. Belangrijke onderdelen van de RStudio-interface:
   - Linksboven: Script-editor (om code te schrijven en op te slaan)
   - Linksonder: Console (om code uit te voeren)
   - Rechtsboven: Environment (toont beschikbare objecten) en History (eerder uitgevoerde commando's)
   - Rechtsonder: Files (bestandsbrowser), Plots (voor grafieken), Packages (geïnstalleerde pakketten) en Help

## Je eerste R-code uitvoeren

Laten we controleren of alles werkt:

1. Typ in de console (het venster linksonder):
   ```r
   print("Mijn eerste R commando!")
   ```
2. Druk op Enter. Je zou de tekst "Mijn eerste R commando!" moeten zien verschijnen.
3. Probeer een eenvoudige berekening:
   ```r
   5 + 5
   ```

Gefeliciteerd! Je hebt R en RStudio succesvol geïnstalleerd en je eerste code uitgevoerd.

## Optioneel: R-pakketten installeren

R-pakketten breiden de functionaliteit van R uit. Hier is hoe je een pakket installeert:

1. Typ in de console:
   ```r
   install.packages("tidyverse")
   ```
2. Druk op Enter en wacht tot de installatie is voltooid (dit kan enkele minuten duren)
3. Laad het pakket:
   ```r
   library(tidyverse)
   ```

Nu ben je klaar om R te gebruiken voor je criminologische analyses!

