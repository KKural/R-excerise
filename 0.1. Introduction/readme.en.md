# Aan de slag met R

## Wat is R?

R is een programmeertaal en softwareomgeving specifiek ontworpen voor statistische berekeningen en data-analyse. R wordt wereldwijd gebruikt door statistici, onderzoekers, datawetenschappers en steeds vaker door criminologen voor het analyseren van complexe datasets.

## De R-omgeving

In deze cursus werk je met R via Dodona, maar het is goed om te weten dat R op verschillende manieren gebruikt kan worden:

1. **R Console**: De basis command-line interface voor R
2. **RStudio**: Een populaire geïntegreerde ontwikkelomgeving (IDE) voor R
3. **R Notebooks**: Interactieve documenten die code, resultaten en tekst combineren
4. **Online platforms**: Zoals Dodona, waar je R kunt gebruiken zonder iets te installeren

## R-syntax basisprincipes

Hier zijn enkele basisprincipes van R-syntax die je zult tegenkomen:

### 1. Toewijzing van variabelen

```r
# Gebruik <- (voorkeur in R) of = om waarden toe te wijzen aan variabelen
aantal_misdrijven <- 145
gemiddelde_leeftijd = 27.5
```

### 2. Functies aanroepen

```r
# Functies hebben de vorm: functienaam(argument1, argument2, ...)
mean(c(21, 25, 30, 41))  # Berekent het gemiddelde van deze getallen
```

### 3. Vectoren maken

```r
# Vectoren worden gemaakt met de c() functie ("combine")
leeftijden <- c(19, 23, 25, 20, 31, 26)
```

### 4. Commentaar toevoegen

```r
# Gebruik het hashtag-symbool (#) voor commentaar
# Dit is commentaar en wordt niet uitgevoerd
aantal_arrestaties <- 52  # Dit is code met commentaar ernaast
```

### 5. Help krijgen

Als je meer wilt weten over een functie, kun je in R de help-functie gebruiken:

```r
?mean  # Toont documentatie over de mean() functie
```

In Dodona kun je deze niet direct gebruiken, maar je kunt altijd online R-documentatie raadplegen.

## Fouten begrijpen

Bij het programmeren in R kun je verschillende soorten fouten tegenkomen:

1. **Syntaxfouten**: Onjuiste code-structuur (bijv. ontbrekende haakjes)
2. **Uitvoeringsfouten**: Fouten die optreden tijdens uitvoering (bijv. deling door nul)
3. **Semantische fouten**: Code die uitvoert maar niet doet wat je verwacht

Dodona zal je helpen om deze fouten te identificeren en op te lossen met gerichte feedback.

---

# Getting started with R

## What is R?

R is a programming language and software environment specifically designed for statistical computing and data analysis. R is used worldwide by statisticians, researchers, data scientists, and increasingly by criminologists for analyzing complex datasets.

## The R environment

In this course, you'll work with R through Dodona, but it's good to know that R can be used in different ways:

1. **R Console**: The basic command-line interface for R
2. **RStudio**: A popular integrated development environment (IDE) for R
3. **R Notebooks**: Interactive documents that combine code, results, and text
4. **Online platforms**: Like Dodona, where you can use R without installing anything

## R syntax basics

Here are some basic principles of R syntax that you'll encounter:

### 1. Variable assignment

```r
# Use <- (preferred in R) or = to assign values to variables
crime_count <- 145
average_age = 27.5
```

### 2. Calling functions

```r
# Functions have the form: function_name(argument1, argument2, ...)
mean(c(21, 25, 30, 41))  # Calculates the average of these numbers
```

### 3. Creating vectors

```r
# Vectors are created with the c() function ("combine")
ages <- c(19, 23, 25, 20, 31, 26)
```

### 4. Adding comments

```r
# Use the hashtag symbol (#) for comments
# This is a comment and won't be executed
arrest_count <- 52  # This is code with a comment next to it
```

### 5. Getting help

If you want to know more about a function, you can use the help function in R:

```r
?mean  # Shows documentation about the mean() function
```

In Dodona, you can't use this directly, but you can always refer to online R documentation.

## Understanding errors

When programming in R, you might encounter different types of errors:

1. **Syntax errors**: Incorrect code structure (e.g., missing parentheses)
2. **Execution errors**: Errors that occur during execution (e.g., division by zero)
3. **Semantic errors**: Code that executes but doesn't do what you expect

Dodona will help you identify and fix these errors with targeted feedback.