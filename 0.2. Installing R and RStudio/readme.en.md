# Installatie en setup van R voor criminologisch onderzoek

## Waarom R gebruiken voor criminologie?

R is een krachtige programmeertaal die steeds vaker wordt gebruikt in criminologisch onderzoek vanwege:

1. **Open-source en gratis**: Toegankelijk voor iedereen zonder licentiekosten
2. **Reproduceerbaarheid**: Je hele analyse kan worden gedeeld en herhaald
3. **Uitgebreide statistische mogelijkheden**: Van beschrijvende statistieken tot geavanceerde modellen
4. **Visualisatiemogelijkheden**: Creëer professionele grafieken en kaarten van criminologische gegevens
5. **Specifieke criminologische pakketten**: Er zijn R-pakketten speciaal voor ruimtelijke criminaliteitsanalyse, netwerk-criminologie, en meer

## Gedetailleerde installatie-instructies

### Windows

1. **R installeren**

   ![Windows R Download](https://ugent.be/img/win-r-download.png)

   Na het downloaden, dubbelklik op het .exe-bestand en volg deze stappen:
   - Kies je taal
   - Accepteer de licentievoorwaarden
   - Kies een installatielocatie (de standaardoptie is meestal goed)
   - Selecteer componenten (laat alle opties aangevinkt)
   - Wacht tot de installatie is voltooid

2. **RStudio installeren**

   ![Windows RStudio Download](https://ugent.be/img/win-rstudio-download.png)

   - Dubbelklik op het gedownloade .exe-bestand
   - Volg de installatiewizard
   - Klik op "Finish" wanneer de installatie is voltooid

### macOS

1. **R installeren**

   ![macOS R Download](https://ugent.be/img/mac-r-download.png)

   - Download het .pkg-bestand voor de nieuwste R-versie
   - Open het gedownloade bestand
   - Volg de instructies in het installatieprogramma
   - Voer je gebruikerswachtwoord in wanneer hierom wordt gevraagd

2. **RStudio installeren**

   ![macOS RStudio Download](https://ugent.be/img/mac-rstudio-download.png)

   - Download het .dmg-bestand
   - Open het gedownloade bestand
   - Sleep het RStudio-pictogram naar de Applications map
   - Geef toestemming om de app te openen als hierom wordt gevraagd

### Linux

1. **R installeren**

   Voor Ubuntu of Debian-gebaseerde distributies:
   ```bash
   sudo apt update
   sudo apt install r-base r-base-dev
   ```

   Voor Fedora:
   ```bash
   sudo dnf install R
   ```

2. **RStudio installeren**

   - Download het .deb- of .rpm-bestand van de RStudio-website
   - Installeer het met de pakketbeheerder van je distributie

## Eerste configuratie van R voor criminologisch onderzoek

Na de installatie is het handig om een aantal essentiële pakketten te installeren voor criminologische analyses.

1. **Open RStudio**

   ![RStudio Interface](https://ugent.be/img/rstudio-first-open.png)

2. **Installeer basispakketten**

   Voer de volgende code uit in de console (het venster linksonder):

   ```r
   # Installeer het tidyverse (verzameling van handige pakketten voor datamanipulatie)
   install.packages("tidyverse")
   
   # Pakketten voor statistische analyse
   install.packages(c("lme4", "car", "psych", "lmtest"))
   
   # Pakketten voor grafieken
   install.packages(c("ggplot2", "ggpubr", "ggspatial"))
   
   # Pakketten specifiek voor criminologie
   install.packages(c("sf", "spdep", "spatstat", "igraph"))
   ```

   ![Pakketten installeren](https://ugent.be/img/r-install-packages.png)

3. **Maak een R-project aan**

   RStudio-projecten helpen je om je werk georganiseerd te houden:

   - Klik op File > New Project
   - Kies "New Directory"
   - Kies "New Project"
   - Geef je project een naam (bijv. "Criminologie_Analyse")
   - Kies een locatie
   - Klik op "Create Project"

   ![R Project maken](https://ugent.be/img/rstudio-new-project.png)

## Troubleshooting

### Veelvoorkomende problemen bij Windows

1. **Foutmelding bij het installeren van pakketten**
   
   Als je een foutmelding krijgt over "niet kunnen schrijven naar library", start RStudio dan als administrator (rechtsklik op RStudio > Run as administrator).

2. **R wordt niet herkend als een opdracht**
   
   Voeg R toe aan je Windows PATH-variabele:
   - Zoek "Omgevingsvariabelen" in het startmenu
   - Klik op "Omgevingsvariabelen bewerken"
   - Selecteer PATH en klik op "Bewerken"
   - Voeg het pad naar de R bin-map toe (bijv. C:\Program Files\R\R-4.1.0\bin)

### Veelvoorkomende problemen bij macOS

1. **"Developer cannot be verified" melding**
   
   Ga naar Systeemvoorkeuren > Beveiliging & Privacy en klik op "Open toch".

2. **RStudio opent niet**
   
   Zorg ervoor dat je eerst R hebt geïnstalleerd voordat je RStudio installeert.

## Volgende stappen

Nu je R en RStudio hebt geïnstalleerd, ben je klaar om te beginnen met het analyseren van criminologische gegevens. In de volgende modules leer je:

1. Gegevens importeren uit verschillende bronnen
2. Gegevens opschonen en voorbereiden voor analyse
3. Beschrijvende statistieken berekenen
4. Visualisaties maken
5. Statistische tests uitvoeren
6. Resultaten interpreteren en rapporteren

---

# Installation and setup of R for criminological research

## Why use R for criminology?

R is a powerful programming language increasingly used in criminological research because:

1. **Open-source and free**: Accessible to everyone without license costs
2. **Reproducibility**: Your entire analysis can be shared and repeated
3. **Extensive statistical capabilities**: From descriptive statistics to advanced models
4. **Visualization capabilities**: Create professional graphs and maps of criminological data
5. **Specific criminological packages**: There are R packages specifically for spatial crime analysis, network criminology, and more

## Detailed installation instructions

### Windows

1. **Installing R**

   ![Windows R Download](https://ugent.be/img/win-r-download.png)

   After downloading, double-click the .exe file and follow these steps:
   - Choose your language
   - Accept the license terms
   - Choose an installation location (the default option is usually fine)
   - Select components (leave all options checked)
   - Wait for the installation to complete

2. **Installing RStudio**

   ![Windows RStudio Download](https://ugent.be/img/win-rstudio-download.png)

   - Double-click the downloaded .exe file
   - Follow the installation wizard
   - Click "Finish" when the installation is complete

### macOS

1. **Installing R**

   ![macOS R Download](https://ugent.be/img/mac-r-download.png)

   - Download the .pkg file for the latest R version
   - Open the downloaded file
   - Follow the instructions in the installer
   - Enter your user password when prompted

2. **Installing RStudio**

   ![macOS RStudio Download](https://ugent.be/img/mac-rstudio-download.png)

   - Download the .dmg file
   - Open the downloaded file
   - Drag the RStudio icon to the Applications folder
   - Give permission to open the app if prompted

### Linux

1. **Installing R**

   For Ubuntu or Debian-based distributions:
   ```bash
   sudo apt update
   sudo apt install r-base r-base-dev
   ```

   For Fedora:
   ```bash
   sudo dnf install R
   ```

2. **Installing RStudio**

   - Download the .deb or .rpm file from the RStudio website
   - Install it with your distribution's package manager

## Initial configuration of R for criminological research

After installation, it's useful to install some essential packages for criminological analyses.

1. **Open RStudio**

   ![RStudio Interface](https://ugent.be/img/rstudio-first-open.png)

2. **Install basic packages**

   Run the following code in the console (the window at the bottom left):

   ```r
   # Install the tidyverse (collection of useful packages for data manipulation)
   install.packages("tidyverse")
   
   # Packages for statistical analysis
   install.packages(c("lme4", "car", "psych", "lmtest"))
   
   # Packages for graphs
   install.packages(c("ggplot2", "ggpubr", "ggspatial"))
   
   # Packages specific to criminology
   install.packages(c("sf", "spdep", "spatstat", "igraph"))
   ```

   ![Installing Packages](https://ugent.be/img/r-install-packages.png)

3. **Create an R project**

   RStudio projects help you keep your work organized:

   - Click on File > New Project
   - Choose "New Directory"
   - Choose "New Project"
   - Give your project a name (e.g., "Criminology_Analysis")
   - Choose a location
   - Click on "Create Project"

   ![Creating R Project](https://ugent.be/img/rstudio-new-project.png)

## Troubleshooting

### Common problems on Windows

1. **Error when installing packages**
   
   If you get an error about "cannot write to library", start RStudio as administrator (right-click on RStudio > Run as administrator).

2. **R is not recognized as a command**
   
   Add R to your Windows PATH variable:
   - Search for "Environment Variables" in the start menu
   - Click on "Edit Environment Variables"
   - Select PATH and click "Edit"
   - Add the path to the R bin folder (e.g., C:\Program Files\R\R-4.1.0\bin)

### Common problems on macOS

1. **"Developer cannot be verified" message**
   
   Go to System Preferences > Security & Privacy and click "Open Anyway".

2. **RStudio doesn't open**
   
   Make sure you installed R before installing RStudio.

## Next steps

Now that you have installed R and RStudio, you are ready to start analyzing criminological data. In the following modules, you will learn:

1. Importing data from different sources
2. Cleaning and preparing data for analysis
3. Calculating descriptive statistics
4. Creating visualizations
5. Performing statistical tests
6. Interpreting and reporting results