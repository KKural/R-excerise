# Pedagogical and Technical Framework for R Exercise Series

## 1. Purpose and Design Rationale

This example exercise was developed to introduce criminology students—with no prior programming experience—to data analysis and statistical reasoning using R. The design process focused on selecting criminologically relevant scenarios, ensuring accessibility for beginners, and embedding best practices in instructional design. Each step, from data simulation to exercise scaffolding, was informed by evidence-based frameworks (e.g., Bloom’s Taxonomy, PRIMM, and scaffolding theory) to promote both technical skill development and statistical thinking.

## 2. Development Process and Instructional Design

This exercise was created by mapping key criminological concepts to R programming tasks, generating synthetic datasets that reflect real-world crime data, and structuring the activity with clear instructions, worked examples, and opportunities for independent practice. The design is grounded in evidence-based frameworks:

- **Bloom’s Taxonomy** (Anderson & Krathwohl, 2001) is a hierarchical model that classifies learning objectives by cognitive complexity, from basic recall to higher-order skills like analysis and creation. This ensures students progress from foundational knowledge to independent problem-solving.
- **PRIMM** (Sentance et al., 2019) is a phased approach to programming instruction: Predict, Run, Investigate, Modify, and Make. It guides students from understanding existing code to creating their own solutions.
- **Scaffolding** (van de Pol et al., 2010) refers to the instructional supports provided to students as they learn new concepts. These supports are gradually removed as students gain confidence and competence, fostering independence.

Because reporting is just as important as analysis, I plan to use R to help students structure their findings clearly and correctly. Tools such as apaTables and flextable allow us to format results in APA style directly from code, making the reporting process more transparent and reproducible. I intend to use these tools to teach students how to interpret test statistics and report their results according to academic standards—preparing them for thesis writing and publication.

Automated feedback and metadata are included for instructional tracking and continuous improvement. This template can be adapted for new topics, datasets, or skill levels by modifying the context, adjusting scaffolding, or integrating advanced R techniques.

## 3. Exercise Progression

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

## 4. Reproducibility, and Synthetic Data

All exercises use synthetic datasets that simulate real criminological data (e.g., district-level crime rates, demographics, police response times). These datasets are generated using the `crimsyndata` package, which ensures privacy, reproducibility, and ethical compliance. The package allows instructors to tailor datasets to specific teaching goals and update them as needed. Students learn APA-style reporting using packages like `apaTables`, `sjPlot`, or `papaja`, focusing on interpretation rather than manual formatting. This approach enables safe sharing and publication of results, and supports differentiated instruction as the course evolves.

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

## 5. Platform Integration

A multi-platform approach ensures students have access to resources, feedback, and collaborative tools throughout the course:

- **Dodona**: Delivers auto-graded exercises, instant feedback, and a structured learning path. Students can submit code, receive hints, and track their progress, fostering self-paced learning and accountability.
- **Ufora**: Integrates quizzes, hosts supplementary resources, and provides a space for announcements and discussions. Ufora supports blended learning by connecting in-class and online activities.
- **GitHub**: Serves as a repository for datasets, sample scripts, and templates. Students can explore real code, contribute to open resources, and access extension exercises for further practice and exploration.

## 6. Onboarding: R & Dodona

To ensure all students start with a solid foundation, the course begins with a short onboarding quiz. This quiz introduces basic R syntax, variable assignment, and the Dodona environment. It is designed as a low-stakes, formative assessment to help students identify gaps in their understanding and become comfortable with submitting code and interpreting feedback before tackling the main exercises.

## 7. Swirl Lessons: Interactive R Learning

Swirl lessons are interactive R tutorials that run directly in the R console. These lessons use the same synthetic datasets as the main exercises and guide students step-by-step through data loading, exploration, and analysis. Swirl provides immediate, contextual feedback on code and answers, allowing students to learn by doing and correct mistakes in real time. This hands-on, self-paced approach reinforces classroom concepts, builds confidence, and prepares students for independent analysis tasks.

## 8. Metadata for Instructional Tracking

Each exercise includes metadata in the form of comments (e.g., Bloom Level, Scaffolding Level, PRIMM Phase). This metadata enables instructors to track the alignment of exercises with pedagogical goals, monitor the progression of cognitive demand, and ensure a balanced mix of support and independence. While invisible to students during grading, this information is valuable for continuous course improvement and instructional research.

## 9. Student Support & Continuous Improvement

Student questions and feedback are actively encouraged throughout the course. The teaching team monitors queries submitted via Dodona and Ufora, providing timely responses and clarifications. Frequently asked questions and common challenges are tracked and used to refine exercise instructions, update datasets, and improve the overall learning experience. This iterative process ensures the course remains clear, effective, and responsive to student needs.

## 10. Supporting Software Transitions in Statistical Education

With advanced proficiency in both SPSS and R, I am well-positioned to support the department's software transition initiatives. My dual expertise allows me to understand both the technical challenges students face when learning a new statistical environment and the conceptual connections between familiar operations and new syntax. 

This background enables me to:
- Recognize common pain points that students encounter when moving from menu-driven interfaces to scripting environments
- Effectively translate statistical concepts between platforms without losing conceptual understanding
- Design learning materials that build on existing statistical knowledge while introducing new programming paradigms
- Help faculty adapt their teaching materials and research workflows to R's reproducible framework

By leveraging my experience with both platforms, I can create a smoother learning path for students and help reduce technical barriers to statistical learning, allowing them to focus on criminological applications rather than software mechanics.

## References

Anderson, L. W., & Krathwohl, D. R. (Eds.). (2001). *A taxonomy for learning, teaching, and assessing: A revision of Bloom's taxonomy of educational objectives*. New York, NY: Longman.

Sentance, S., Waite, J., & Kallia, M. (2019). Teaching computer programming with PRIMM: A sociocultural perspective. *Computer Science Education, 29*(2-3), 136–176. https://doi.org/10.1080/08993408.2019.1608781

van de Pol, J., Volman, M., & Beishuizen, J. (2010). Scaffolding in teacher–student interaction: A decade of research. *Educational Psychology Review, 22*(3), 271–296. https://doi.org/10.1007/s10648-010-9127-6

