# Basis R Operaties voor Criminologisch Onderzoek

In criminologisch onderzoek beginnen we met het uitvoeren van basisoperaties in R. Deze fundamentele vaardigheden vormen de basis voor alle verdere analyses.

## Variabelen en toewijzing

In R slaan we gegevens op in variabelen. Dit stelt ons in staat om waarden op te slaan en later te gebruiken in berekeningen.

```r
# Een enkele waarde toewijzen
aantal_misdrijven <- 156

# Meerdere waarden toewijzen (een vector)
district_misdrijven <- c(42, 53, 18, 29, 14)
```

## Basisberekeningen

R kan gebruikt worden als een rekenmachine voor eenvoudige en complexe berekeningen.

```r
# Optellen, aftrekken, vermenigvuldigen, delen
totaal <- 25 + 30
verschil <- 45 - 12
product <- 6 * 8
quotient <- 100 / 5

# Machtsverheffen
kwadraat <- 7^2  # 49
```

## Functies gebruiken

R heeft veel ingebouwde functies die berekeningen uitvoeren op onze gegevens.

```r
# Gemiddelde berekenen
gemiddelde <- mean(c(12, 15, 18, 21, 9))

# Minimum en maximum vinden
minimum <- min(c(12, 15, 18, 21, 9))
maximum <- max(c(12, 15, 18, 21, 9))

# Som berekenen
totaal <- sum(c(12, 15, 18, 21, 9))
```

## Werken met datasets

In R kunnen we gegevens organiseren in dataframes, wat vergelijkbaar is met een spreadsheet of tabel.

```r
# Een eenvoudig dataframe maken
misdaad_data <- data.frame(
  district = c("Noord", "Oost", "Zuid", "West", "Centrum"),
  misdrijven = c(42, 53, 18, 29, 14),
  ophelderingspercentage = c(35, 41, 52, 39, 65)
)

# Toegang krijgen tot een kolom
misdaad_data$misdrijven
```

## Opdrachten

In de volgende oefeningen zul je deze basisoperaties toepassen op criminologische gegevens. Je begint met eenvoudige toewijzingen en bouwt geleidelijk op naar meer complexe operaties.

---

# Basic R Operations for Criminological Research

In criminological research, we start by performing basic operations in R. These fundamental skills form the foundation for all further analyses.

## Variables and assignment

In R, we store data in variables. This allows us to store values and use them later in calculations.

```r
# Assigning a single value
crime_count <- 156

# Assigning multiple values (a vector)
district_crimes <- c(42, 53, 18, 29, 14)
```

## Basic calculations

R can be used as a calculator for simple and complex calculations.

```r
# Addition, subtraction, multiplication, division
total <- 25 + 30
difference <- 45 - 12
product <- 6 * 8
quotient <- 100 / 5

# Exponentiation
square <- 7^2  # 49
```

## Using functions

R has many built-in functions that perform calculations on our data.

```r
# Calculate mean
average <- mean(c(12, 15, 18, 21, 9))

# Find minimum and maximum
minimum <- min(c(12, 15, 18, 21, 9))
maximum <- max(c(12, 15, 18, 21, 9))

# Calculate sum
total <- sum(c(12, 15, 18, 21, 9))
```

## Working with datasets

In R, we can organize data in dataframes, which is similar to a spreadsheet or table.

```r
# Create a simple dataframe
crime_data <- data.frame(
  district = c("North", "East", "South", "West", "Center"),
  crimes = c(42, 53, 18, 29, 14),
  clearance_rate = c(35, 41, 52, 39, 65)
)

# Access a column
crime_data$crimes
```

## Exercises

In the following exercises, you will apply these basic operations to criminological data. You'll start with simple assignments and gradually build up to more complex operations.