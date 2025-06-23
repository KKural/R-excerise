# Supplementary Document  
## Instructional Design of the R Exercise Series  
*Teaching Assistant Application – Dr. Kuralarasan Kumar*

---

## 1. Purpose of the Exercise Series

This R-based learning path introduces criminology students—with no prior programming experience—to data analysis and statistical reasoning using R. All exercises are grounded in criminologically relevant examples and designed to develop not only technical skills, but also statistical thinking and reporting ability.

The exercises are structured to promote confidence, comprehension, and reproducibility through progressive challenges that connect directly to real-world crime data.

---

## 2. Guiding Pedagogical Frameworks

### 🔹 Bloom’s Taxonomy

Each exercise is aligned with a cognitive level from Bloom’s Taxonomy:

| Bloom Level         | Example Task                                                            |
|---------------------|-------------------------------------------------------------------------|
| Remember/Understand | Identify syntax (`str()`, `names()`)                                    |
| Apply               | Perform summaries or plots on crime datasets                            |
| Analyze/Evaluate    | Interpret model output or critique misleading visuals                   |
| Create              | Build custom functions or reports using synthetic data                  |

> *Example*: An early exercise asks students to run `summary()` and interpret output; a later one requires writing an APA-ready regression table.

---

### 🔹 Scaffolding Principle

Exercises begin with substantial guidance—starter code, Dutch-language comments, and inline tips—and gradually remove these supports. This reduces cognitive overload and encourages student independence.

> *Progression Example*:
> - **Exercise 1**: Full syntax for `mean()` is provided.  
> - **Exercise 4**: Students fill in the variable to summarize.  
> - **Exercise 10**: Students construct summaries from raw data independently.

---

### 🔹 PRIMM Framework

Each exercise reflects the PRIMM learning model:

1. **Predict** – What do you expect this code to output?  
2. **Run** – Execute the code and compare with prediction  
3. **Investigate** – Understand why the result is correct/incorrect  
4. **Modify** – Change inputs or logic  
5. **Make** – Create something new using similar logic

> *Example*: Students first predict the output of `filter(crime_df, crime_type == "Theft")`, then modify it to select "Assault", and finally write their own condition for "Burglary".

---

### 🔹 Worked → Faded → Independent Problem Design

Each new concept is introduced using:

- A **worked example** with full code and explanation  
- A **faded example** with partially completed code  
- An **independent task** where students write their own solution

> *Example*:  
> - The full `ggplot()` code is shown to create a bar chart  
> - Students are then asked to modify the variable used  
> - Finally, they write a new plot from scratch using different columns

---

## 3. Realism, Reproducibility, and Reporting

### 🔸 Synthetic Criminology Datasets

To avoid confidentiality issues and maintain relevance, all exercises use synthetic data simulating:

- District-level crime rates  
- Offender demographics  
- Police response times  
- Property loss values

These datasets reflect real-world structure while allowing students to practice openly and repeatedly.

---

### 🔸 APA-Style Statistical Reporting

Students often struggle with formatting and structuring their results. To address this:

- Exercises include the use of `apaTables`, `sjPlot`, or `papaja`  
- Students learn to extract and report regression results in APA format  
- Code is provided to generate clean, copy-pasteable tables

> *Outcome*: Students focus on **interpreting** results, not formatting tables manually.

---

## 4. Platform Integration

### ✅ Dodona + Ufora

- Exercises are delivered via **Dodona** with auto-grading and feedback  
- **Ufora** is used for quiz integration, resource hosting, and feedback  
- Students can submit code directly in Dodona or follow guided modules in Ufora

### ✅ GitHub Repository with Sample Code

- A linked **GitHub repository** hosts:
  - Multiple synthetic datasets  
  - Sample R scripts and templates  
  - Optional extension exercises
- Students can explore, reuse, and adapt this content as they grow in confidence

---

## 5. Outcome: From Syntax to Statistical Thinking

By the end of the series, students will:

- Understand and apply basic R functions (`str()`, `summary()`, `ggplot()`)
- Write clean, commented, and reproducible R code
- Analyze criminological data and interpret results
- Report findings in APA style using automated tools
- Build foundational skills for thesis work and empirical research

---

## Supplement: Onboarding Questions for R and Dodona

To help students get familiar with R syntax and the Dodona environment, you can include a short onboarding quiz at the start of the course. These questions are not auto-graded by Dodona, but serve as a self-check or discussion starter:

**Example Question 1:** What is the correct way to assign a value to a variable in R?

(x) `crimes <- 25`
( ) `crimes == 25`
( ) `crimes -> 25`
( ) `crimes => 25`

**Example Question 2:** Which function do you use to calculate the average of a series of numbers?

( ) `average()`
(x) `mean()`
( ) `median()`
( ) `sum()`

Including onboarding questions like these can help students get comfortable with R basics and the Dodona feedback system before starting the main exercises.

---

## Conclusion

This instructional design is rooted in evidence-based pedagogy and tailored to the unique needs of criminology students. Through structured progression, applied examples, and platform integration, the course helps students transition from passive learners to confident, critical users of statistical tools in R.

---

# Instructional Design of the R Exercise Series

This document outlines the instructional design for the 15 core R exercises for criminology students. Each exercise is mapped to Bloom’s Taxonomy, the PRIMM framework, and a scaffolding level, with metadata included in comments for instructional tracking only.

---

## 1. Exercise Progression Table

| #  | Folder Name                             | Bloom Level             | Scaffolding Level | PRIMM Phase                   |
|----|------------------------------------------|--------------------------|--------------------|-------------------------------|
| 01 | Level of measurement                   | Remember & Understand    | Full support       | Predict, Run                  |
| 02 | Creating variables with appropriate types | Remember & Understand  | Full support       | Run                           |
| 03 | Identifying measurement levels          | Remember & Understand    | Full support       | Predict, Run, Investigate     |
| 04 | Assign number of burglaries             | Remember & Understand    | Full support       | Run                           |
| 05 | Load crime dataset                      | Apply                    | Full support       | Run                           |
| 06 | Calculate average offenses              | Apply                    | Full support       | Run                           |
| 07 | Generate frequency tables               | Apply                    | Full support       | Run                           |
| 08 | Filter violent crimes                   | Apply                    | Full support       | Run                           |
| 09 | Crime rate calculation                  | Apply                    | Partial support    | Run, Modify                   |
| 10 | Filtering crime data with dplyr         | Apply                    | Partial support    | Run, Modify                   |
| 11 | Creating new columns with mutate        | Apply                    | Partial support    | Run, Modify                   |
| 12 | Creating and using factors              | Apply                    | Partial support    | Run, Modify                   |
| 13 | Creating histograms with ggplot2        | Apply                    | Partial support    | Run, Modify                   |
| 14 | Saving results with write.csv           | Apply                    | Partial support    | Run, Modify                   |
| 15 | Writing simple custom functions         | Create                   | Minimal support    | Make                          |

---

## 2. Rationale for Progression

### Bloom’s Taxonomy

The series begins with exercises at the **Remember & Understand** level, focusing on basic R syntax, data types, and measurement concepts. As students progress, exercises move to the **Apply** level, requiring them to use R functions for data manipulation and analysis. The final exercise reaches the **Create** level, where students write their own functions.

### PRIMM Framework

Each exercise is mapped to one or more PRIMM phases:
- **Predict**: Students anticipate code behavior or output.
- **Run**: Students execute code and observe results.
- **Investigate**: Students explore why code works as it does.
- **Modify**: Students adapt code to new contexts or data.
- **Make**: Students create new code or solutions independently.

Early exercises focus on **Predict** and **Run**, while later ones emphasize **Modify** and **Make** for deeper learning and independence.

### Gradual Scaffolding Reduction

- **Full support**: Early exercises provide step-by-step instructions, code templates, and detailed hints.
- **Partial support**: Mid-series exercises offer less guidance, requiring students to recall and apply concepts.
- **Minimal support**: Final exercises expect students to synthesize and create solutions with little or no scaffolding.

This gradual reduction in support helps students build confidence and autonomy in R programming.

---

## 3. Metadata for Instructional Tracking

Each exercise includes metadata in comments (e.g., Bloom Level, Scaffolding Level, PRIMM Phase) for instructional tracking and alignment. These comments are for course design purposes only and do not affect grading or student experience.

---

**Summary:**  
This progression ensures students move from foundational R skills to independent data analysis and reporting, using evidence-based instructional design tailored to criminology.

