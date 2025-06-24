# Instructional Design of the R Exercise Series
*Teaching Assistant Application – Dr. Kuralarasan Kumar*

## 1. Purpose

This R-based learning path introduces criminology students—with no prior programming experience—to data analysis and statistical reasoning using R. Exercises are grounded in criminological examples and designed to develop technical skills, statistical thinking, and reporting ability. The progression builds confidence, comprehension, and reproducibility through real-world crime data scenarios.

## 2. Learning Outcomes

By the end of the series, students will:
- Apply basic R functions (`str()`, `summary()`, `ggplot()`)
- Write clean, reproducible R code
- Analyze and interpret criminological data
- Report findings in APA style
- Build foundational skills for research

## 3. Pedagogical Frameworks

### Bloom’s Taxonomy & Scaffolding
Each exercise is aligned with Bloom’s Taxonomy (Anderson & Krathwohl, 2001), progressing from basic recall to independent creation. Early exercises provide full support and guidance, while later ones encourage autonomy by gradually reducing scaffolding (van de Pol et al., 2010).

### PRIMM Model
Exercises follow the PRIMM model (Sentance et al., 2019):
1. **Predict** expected output
2. **Run** code
3. **Investigate** results
4. **Modify** code
5. **Make** new solutions

### Worked → Faded → Independent Problems
Concepts are introduced with worked examples, followed by partially completed code, and finally independent tasks.

## 4. Exercise Progression

| #  | Exercise                                 | Bloom Level             | Scaffolding      | PRIMM Phase                |
|:--:|:-----------------------------------------|:----------------------:|:----------------:|:--------------------------:|
| 01 | Level of measurement                     | Remember & Understand  | Full support     | Predict, Run               |
| 02 | Creating variables with appropriate types| Remember & Understand  | Full support     | Run                        |
| 03 | Identifying measurement levels           | Remember & Understand  | Full support     | Predict, Run, Investigate  |
| 04 | Assign number of burglaries              | Remember & Understand  | Full support     | Run                        |
| 05 | Load crime dataset                       | Apply                  | Full support     | Run                        |
| 06 | Calculate average offenses               | Apply                  | Full support     | Run                        |
| 07 | Generate frequency tables                | Apply                  | Full support     | Run                        |
| 08 | Filter violent crimes                    | Apply                  | Full support     | Run                        |
| 09 | Crime rate calculation                   | Apply                  | Partial support  | Run, Modify                |
| 10 | Filtering crime data with dplyr          | Apply                  | Partial support  | Run, Modify                |
| 11 | Creating new columns with mutate         | Apply                  | Partial support  | Run, Modify                |
| 12 | Creating and using factors               | Apply                  | Partial support  | Run, Modify                |
| 13 | Creating histograms with ggplot2         | Apply                  | Partial support  | Run, Modify                |
| 14 | Saving results with write.csv            | Apply                  | Partial support  | Run, Modify                |
| 15 | Writing simple custom functions          | Create                 | Minimal support  | Make                       |

## 5. Realism, Reproducibility, and Reporting

All exercises use synthetic datasets simulating real criminological data (e.g., district-level crime rates, demographics, police response times). This ensures privacy, reproducibility, and relevance. Students learn APA-style reporting using packages like `apaTables`, `sjPlot`, or `papaja`, focusing on interpretation rather than manual formatting.

## 6. crimsyndata: Realistic, Privacy-Safe Synthetic Data

The `crimsyndata` package provides fully synthetic, statistically realistic datasets for criminology education. Datasets are generated in R with controlled random seeds, reflecting real-world crime patterns while ensuring privacy and ethical compliance. Instructors can generate new datasets tailored to course objectives, and all datasets are reproducible via R code.

**Key Benefits:**
- Full privacy and ethical assurance
- Flexibility for tailored datasets
- Supports differentiated instruction
- Easy updates and continuous improvement

### Using crimsyndata in R
1. Install the package:
   ```R
   install.packages("remotes")
   remotes::install_github("yourusername/crimsyndata")
   ```
2. Load the library:
   ```R
   library(crimsyndata)
   ```
3. Load a dataset:
   ```R
   crime_df <- crimsyndata::crime_stats
   ```
4. Explore the data:
   ```R
   summary(crime_df)
   str(crime_df)
   ```

All exercises use these datasets, allowing students to safely share and publish results while developing statistical reasoning and R proficiency.

## 7. Platform Integration

A multi-platform approach ensures students have access to resources, feedback, and collaborative tools throughout the course:

- **Dodona**: Delivers auto-graded exercises, instant feedback, and a structured learning path. Students can submit code, receive hints, and track their progress, fostering self-paced learning and accountability.
- **Ufora**: Integrates quizzes, hosts supplementary resources, and provides a space for announcements and discussions. Ufora supports blended learning by connecting in-class and online activities.
- **GitHub**: Serves as a repository for datasets, sample scripts, and templates. Students can explore real code, contribute to open resources, and access extension exercises for further practice and exploration.

## 8. Onboarding: R & Dodona

To ensure all students start with a solid foundation, the course begins with a short onboarding quiz. This quiz introduces basic R syntax, variable assignment, and the Dodona environment. It is designed as a low-stakes, formative assessment to help students identify gaps in their understanding and become comfortable with submitting code and interpreting feedback before tackling the main exercises.

## 9. Swirl Lessons: Interactive R Learning

Swirl lessons are interactive R tutorials that run directly in the R console. These lessons use the same synthetic datasets as the main exercises and guide students step-by-step through data loading, exploration, and analysis. Swirl provides immediate, contextual feedback on code and answers, allowing students to learn by doing and correct mistakes in real time. This hands-on, self-paced approach reinforces classroom concepts, builds confidence, and prepares students for independent analysis tasks.

## 10. Metadata for Instructional Tracking

Each exercise includes metadata in the form of comments (e.g., Bloom Level, Scaffolding Level, PRIMM Phase). This metadata enables instructors to track the alignment of exercises with pedagogical goals, monitor the progression of cognitive demand, and ensure a balanced mix of support and independence. While invisible to students during grading, this information is valuable for continuous course improvement and instructional research.

## 11. Student Support & Continuous Improvement

Student questions and feedback are actively encouraged throughout the course. The teaching team monitors queries submitted via Dodona and Ufora, providing timely responses and clarifications. Frequently asked questions and common challenges are tracked and used to refine exercise instructions, update datasets, and improve the overall learning experience. This iterative process ensures the course remains clear, effective, and responsive to student needs.

## References

Anderson, L. W., & Krathwohl, D. R. (Eds.). (2001). *A taxonomy for learning, teaching, and assessing: A revision of Bloom's taxonomy of educational objectives*. New York, NY: Longman.

Sentance, S., Waite, J., & Kallia, M. (2019). Teaching computer programming with PRIMM: A sociocultural perspective. *Computer Science Education, 29*(2-3), 136–176. https://doi.org/10.1080/08993408.2019.1608781

van de Pol, J., Volman, M., & Beishuizen, J. (2010). Scaffolding in teacher–student interaction: A decade of research. *Educational Psychology Review, 22*(3), 271–296. https://doi.org/10.1007/s10648-010-9127-6

