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

## Conclusion

This instructional design is rooted in evidence-based pedagogy and tailored to the unique needs of criminology students. Through structured progression, applied examples, and platform integration, the course helps students transition from passive learners to confident, critical users of statistical tools in R.

