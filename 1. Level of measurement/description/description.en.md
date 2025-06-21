# Meetniveaus in Criminologisch Onderzoek

In criminologisch onderzoek werken we met verschillende soorten variabelen. Het begrijpen van meetniveaus is essentieel voor het kiezen van de juiste statistische methoden en analyses.

## Wat zijn meetniveaus?

Meetniveaus (of schaalniveaus) geven aan hoe gedetailleerd een variabele gemeten wordt en welke wiskundige bewerkingen mogelijk zijn met de waargenomen waarden. Er zijn vier hoofdniveaus:

### 1. Nominaal niveau

- **Definitie**: Categorieën zonder natuurlijke volgorde
- **Voorbeeld in criminologie**: 
  - Type misdrijf (diefstal, inbraak, geweld)
  - Geslacht van daders
  - Politiedistrict
- **Toegestane bewerkingen**: Frequenties tellen, modus bepalen
- **R-datatypes**: Factor, character

### 2. Ordinaal niveau

- **Definitie**: Categorieën met een natuurlijke volgorde
- **Voorbeeld in criminologie**:
  - Ernst van een misdrijf (licht, gemiddeld, zwaar)
  - Opleidingsniveau van daders
  - Mate van recidive (nooit, soms, vaak)
- **Toegestane bewerkingen**: Alles van nominaal + rangorde bepalen, mediaan
- **R-datatypes**: Ordered factor, integer (soms)

### 3. Interval niveau

- **Definitie**: Numerieke waarden met gelijke intervallen, maar zonder natuurlijk nulpunt
- **Voorbeeld in criminologie**:
  - Temperatuur tijdens misdrijven
  - IQ-scores van verdachten
  - Bepaalde attitude-schalen
- **Toegestane bewerkingen**: Alles van ordinaal + optellen, aftrekken, gemiddelde
- **R-datatypes**: Numeric

### 4. Ratio niveau

- **Definitie**: Numerieke waarden met gelijke intervallen én een natuurlijk nulpunt
- **Voorbeeld in criminologie**:
  - Aantal misdrijven per wijk
  - Leeftijd van daders
  - Gevangenisstraf in maanden
  - Waarde van gestolen goederen
- **Toegestane bewerkingen**: Alles van interval + vermenigvuldigen, delen, verhoudingen
- **R-datatypes**: Numeric

## Belang voor statistische analyse

Het meetniveau bepaalt welke statistische technieken geschikt zijn:

- **Nominaal**: Chi-kwadraat, frequentietabellen
- **Ordinaal**: Rangcorrelaties (Spearman), niet-parametrische tests
- **Interval/Ratio**: t-tests, ANOVA, Pearson correlatie, regressie

In de volgende oefeningen leer je hoe je in R met verschillende meetniveaus werkt.

---

# Levels of Measurement in Criminological Research

In criminological research, we work with different types of variables. Understanding levels of measurement is essential for choosing the right statistical methods and analyses.

## What are levels of measurement?

Levels of measurement (or scale types) indicate how detailed a variable is measured and which mathematical operations are possible with the observed values. There are four main levels:

### 1. Nominal level

- **Definition**: Categories without natural order
- **Examples in criminology**: 
  - Type of crime (theft, burglary, assault)
  - Gender of offenders
  - Police district
- **Allowed operations**: Counting frequencies, determining mode
- **R data types**: Factor, character

### 2. Ordinal level

- **Definition**: Categories with a natural order
- **Examples in criminology**:
  - Severity of crime (minor, moderate, severe)
  - Educational level of offenders
  - Recidivism rate (never, sometimes, often)
- **Allowed operations**: All nominal + determining rank order, median
- **R data types**: Ordered factor, integer (sometimes)

### 3. Interval level

- **Definition**: Numerical values with equal intervals, but without natural zero point
- **Examples in criminology**:
  - Temperature during crimes
  - IQ scores of suspects
  - Certain attitude scales
- **Allowed operations**: All ordinal + addition, subtraction, mean
- **R data types**: Numeric

### 4. Ratio level

- **Definition**: Numerical values with equal intervals AND a natural zero point
- **Examples in criminology**:
  - Number of crimes per district
  - Age of offenders
  - Prison sentence in months
  - Value of stolen goods
- **Allowed operations**: All interval + multiplication, division, ratios
- **R data types**: Numeric

## Importance for statistical analysis

The level of measurement determines which statistical techniques are appropriate:

- **Nominal**: Chi-square, frequency tables
- **Ordinal**: Rank correlations (Spearman), non-parametric tests
- **Interval/Ratio**: t-tests, ANOVA, Pearson correlation, regression

In the following exercises, you will learn how to work with different levels of measurement in R.