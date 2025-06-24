# Supplementary Document  
## Instructional Design of the R Exercise Series  
*Teaching Assistant Application – Dr. Kuralarasan Kumar*

## 1. Purpose of the Exercise Series

This R-based learning path introduces criminology students—with no prior programming experience—to data analysis and statistical reasoning using R. All exercises are grounded in criminologically relevant examples and designed to develop not only technical skills, but also statistical thinking and reporting ability.

The exercises are structured to promote confidence, comprehension, and reproducibility through progressive challenges that connect directly to real-world crime data.

## 2. Guiding Pedagogical Frameworks

### Bloom’s Taxonomy

Each exercise is aligned with a cognitive level from Bloom’s Taxonomy [1]:

<div align="center">

| Bloom Level         | Example Task                                                            |
|:------------------:|:-----------------------------------------------------------------------:|
| Remember/Understand | Identify syntax (`str()`, `names()`)                                    |
| Apply               | Perform summaries or plots on crime datasets                            |
| Analyze/Evaluate    | Interpret model output or critique misleading visuals                   |
| Create              | Build custom functions or reports using synthetic data                  |

</div>

> *Example*: An early exercise asks students to run `summary()` and interpret output; a later one requires writing an APA-ready regression table.

### Scaffolding Principle

Exercises begin with substantial guidance—starter code, Dutch-language comments, and inline tips—and gradually remove these supports. This reduces cognitive overload and encourages student independence [2].

> *Progression Example*:
> - **Exercise 1**: Full syntax for `mean()` is provided.  
> - **Exercise 4**: Students fill in the variable to summarize.  
> - **Exercise 10**: Students construct summaries from raw data independently.

### PRIMM Framework

Each exercise reflects the PRIMM learning model [3]:

1. **Predict** – What do you expect this code to output?  
2. **Run** – Execute the code and compare with prediction  
3. **Investigate** – Understand why the result is correct/incorrect  
4. **Modify** – Change inputs or logic  
5. **Make** – Create something new using similar logic

> *Example*: Students first predict the output of `filter(crime_df, crime_type == "Theft")`, then modify it to select "Assault", and finally write their own condition for "Burglary".

### Worked → Faded → Independent Problem Design

Each new concept is introduced using:

- A **worked example** with full code and explanation  
- A **faded example** with partially completed code  
- An **independent task** where students write their own solution

> *Example*:  
> - The full `ggplot()` code is shown to create a bar chart  
> - Students are then asked to modify the variable used  
> - Finally, they write a new plot from scratch using different columns

## 3. Realism, Reproducibility, and Reporting

### Synthetic Criminology Datasets

To avoid confidentiality issues and maintain relevance, all exercises use synthetic data that simulates district-level crime rates, offender demographics, police response times, and property loss values. These datasets are designed to reflect real-world structure while allowing students to practice openly and repeatedly. I am also familiar with generating meaningful synthetic datasets in R using packages such as `synthpop`, which enable the simulation of data that preserves key characteristics (e.g., mean, standard deviation, and variable relationships) of real criminological datasets while ensuring privacy and reproducibility.

### APA-Style Statistical Reporting

Students often struggle with formatting and structuring their results. To address this:

- Exercises include the use of `apaTables`, `sjPlot`, or `papaja`  
- Students learn to extract and report regression results in APA format  
- Code is provided to generate clean, copy-pasteable tables

> *Outcome*: Students focus on **interpreting** results, not formatting tables manually.

## 4. Platform Integration

### Dodona + Ufora

- Exercises are delivered via **Dodona** with auto-grading and feedback  
- **Ufora** can be linked for quiz integration, resource hosting, and feedback  
- Students can submit code directly in Dodona or follow guided modules in Ufora

### GitHub Repository with Sample Code

- A linked **GitHub repository** hosts:
  - Multiple synthetic datasets  
  - Sample R scripts and templates  
  - Optional extension exercises
- Students can explore, reuse, and adapt this content as they grow in confidence

## 5. Outcome: From Syntax to Statistical Thinking

By the end of the series, students will:

- Understand and apply basic R functions (`str()`, `summary()`, `ggplot()`)
- Write clean, commented, and reproducible R code
- Analyze criminological data and interpret results
- Report findings in APA style using automated tools
- Build foundational skills for thesis work and empirical research

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

## 6. Exercise Progression Table

<div align="center">

| #  | Folder Name                             | Bloom Level             | Scaffolding Level | PRIMM Phase                   |
|:--:|:---------------------------------------:|:----------------------:|:-----------------:|:-----------------------------:|
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

</div>

## 7. Rationale for Progression

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

## 8. Metadata for Instructional Tracking

Each exercise includes metadata in comments (e.g., Bloom Level, Scaffolding Level, PRIMM Phase) for instructional tracking and alignment. These comments are for course design purposes only and do not affect grading or student experience.

## 9. Student Questions and Continuous Improvement

If students have questions while working on Dodona exercises, they are encouraged to ask questions specific to each exercise. The teaching team will respond to these questions and provide guidance. Frequently asked questions are tracked and used to improve the course and the way exercises are designed, ensuring that the learning experience becomes clearer and more effective for future students.

**Summary:**  
This progression ensures students move from foundational R skills to independent data analysis and reporting, using evidence-based instructional design tailored to criminology.

## crimsyndata: Realistic, Privacy-Safe Synthetic Data

To support these exercises, I developed the `crimsyndata` package—a fully synthetic yet statistically realistic data resource. Each dataset is generated in R with controlled random seeds, mirroring real Belgian crime patterns (e.g., higher poverty leads to more violent crime, lower clearance rates) but containing no identifying information. This allows students and instructors to analyze, visualize, and even publish results with zero privacy risk, while still engaging with meaningful criminological relationships. The package includes five datasets (e.g., crime statistics, neighborhood indices, police effort, survey responses, and qualitative notes), all reproducible via the included R code. The accompanying swirl lesson (“Crime Mapping”) wraps these data in an interactive, auto-graded tutorial, guiding students through tidyverse skills, measurement scales, and APA-style reporting—all within the R console and with instant feedback. Together, the package and lesson provide a turnkey, ethically sound environment for developing statistical reasoning and reproducible analysis, fully aligned with course outcomes.

## References

1. Anderson, L. W., & Krathwohl, D. R. (Eds.). (2001). *A taxonomy for learning, teaching, and assessing: A revision of Bloom's Taxonomy of Educational Objectives*. New York: Longman.
2. van de Pol, J., Volman, M., & Beishuizen, J. (2010). Scaffolding in teacher–student interaction: A decade of research. *Educational Psychology Review*, 22(3), 271–296. https://doi.org/10.1007/s10648-010-9127-6
3. Sentance, S., Waite, J., & Kallia, M. (2019). Teaching computer programming with PRIMM: a sociocultural perspective. *Computer Science Education*, 29(2-3), 136–176. https://doi.org/10.1080/08993408.2019.1608781

