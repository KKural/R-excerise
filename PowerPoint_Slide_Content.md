# PowerPoint Slide Content for Scientific Staff Interview
## Copy-Paste Ready Format for Interview_presentation.pptx

---

## SLIDE 1: Title & Roadmap
**Title:** Building Evidence-Based Dodona Learning Paths for Criminology (Sep–Dec)

**Subtitle:** Scientific Staff Position | 20-minute Presentation

**Our plan today — 1-2-3:**
• Challenge & approach
• Examples & tools (with screenshots)  
• Plan & impact (incl. role fit & Dutch delivery)

**Presenter:** Dr. Kuralarasan Kumar

---

## SLIDE 2: Problem → Vision
**The Challenge**
• Many students start with limited quantitative background and statistical anxiety
• Abstract, non-criminology examples make concepts feel distant
• Reporting is often inconsistent and hard to reproduce

**The Vision**
• Domain-authentic tasks (crime rates, cross-tabs, basic regression)
• Gradual progression with support that fades
• Reproducible-by-design: outputs generated from code (tables/figures)

---

## SLIDE 3: Teaching Approach
**Four Core Pillars**

🎯 **Bloom:** Understand → Apply → Analyze → Create

🔄 **PRIMM:** Predict → Run → Investigate → Modify → Make

📈 **Scaffolding:** Strong support at the start → Independence later

⚠️ **Context rules:** Frequent reminders that correlation ≠ causation

---

## SLIDE 4: Platform & Tools
**Integrated Ecosystem**

🎓 **Dodona:** Auto-graded coding with hints and clear progression

📚 **Ufora:** Quizzes, resources, announcements

💻 **GitHub:** Datasets & starter code; single source of truth with tagged releases

🖥️ **swirl:** Step-by-step console lessons

**Technology Stack:**
• Now: R + HTML/JS
• Next (where helpful): Python/JS widgets

---

## SLIDE 5: Portfolio Evidence
**What's Already Built**

✅ **15 Dodona items** already authored (from data basics to regression)

✅ **crimsyndata:** Synthetic, privacy-safe criminology datasets

✅ **APA from code:** flextable / apaTables pipeline

✅ **Metadata** on each item: Bloom, PRIMM, Scaffolding

**Visual Evidence:**
[INSERT: Dodona item screenshot - prompt + hint + feedback]
[INSERT: APA table rendered from code screenshot]

---

## SLIDE 6: Walk-Through A - Crime Rates
**Task:** Compute rate per 100,000 by district and flag above national average

**Skills:** `group_by()` → `summarise()` → `mutate()` → `arrange()`

**Checks:** 
• Denominator validation
• Missing values handling  
• Proper sorting

**Output:** APA table + 3-sentence interpretation

[INSERT: Code cell and APA table result screenshot]

---

## SLIDE 7: Walk-Through B - Chi-Square
**Task:** Offense type × Gender (association)

**Steps:** Contingency → Expected counts → χ² → Effect size

**Challenges:**
• p-value vs. effect size interpretation
• Small cell count issues

**Smart Feedback:** When needed, collapse categories or suggest Fisher's exact

[INSERT: swirl step showing prompt + immediate feedback screenshot]

---

## SLIDE 8: Visual Gallery & Demo
**What Students Actually See**

📱 **Dodona:** Prompt + hint + feedback system
[INSERT: Dodona interface screenshot]

💬 **swirl:** Step-by-step lesson guidance  
[INSERT: swirl console screenshot]

📊 **crimsyndata:** Realistic data preview + documentation
[INSERT: head() output + variable notes screenshot]

📋 **APA output:** Professional formatted results
[INSERT: Final APA table screenshot]

**Live demo available if requested**

---

## SLIDE 9: Sep–Dec 15 Delivery Plan
**Structured Timeline**

**Weeks 1–2:** Audit learning outcomes; item map; data dictionaries
**Weeks 3–4:** Sprint #1 — data literacy, descriptives, APA (6–8 items)
**Weeks 5–6:** Sprint #2 — dplyr, rates, joins, tidy (6–8 items)
**Week 7:** Visualization items (2–3) + caption standards
**Week 8:** Midterm mini-project template + peer rubric
**Weeks 9–10:** Inference (t, χ²) + regression I (4–5 items)
**Week 11:** 🔒 Content freeze #1; add progress data hooks
**Week 12:** Small seminar pilot; bug-fix
**Weeks 13–14:** Regression II / optional spatial basics
**Week 15:** 🔒 Content freeze #2; release candidate; Dec 15 wrap-up

---

## SLIDE 10: Role Fit & What Sets Me Apart
**Already Delivered**
• Dodona items • Synthetic data • APA pipeline

**Domain-Authentic**  
• Criminology tasks • SPSS→R bridges • Thesis-ready outputs

**Structured, Evidence-Based Development**
• Clear specs, tests, and progress data usage

**Operational Readiness**
• Concrete plan to Dec 15 • GitHub releases • Content freezes

**Department Fit**
• 3 years in workflows • Course lead collaborations

---

## SLIDE 11: Dutch Delivery & Quality
**Language Proficiency**
🇳🇱 NT2 A2, currently A3 (CVO); prototype delivered in Dutch

**Review Process**
• NL↔EN glossary 
• DeepL/LanguageTool integration
• Native speaker review rounds

**Quality Targets**
• B1 readability standard
• Student clarity polls (Dodona/Ufora)

**KPIs**
• ≥95% items pass B1 checks
• ≥4/5 clarity rating

---

## SLIDE 12: Questions & Discussion
**Thank You**

**Key Targets by Dec 15:**
• ≥85% onboarding completion
• −30% denominator errors  
• ≥70% first-pass APA tables
• ≥90% reproducibility spot-checks

**Ready to discuss:**
• Semester-2 priorities
• Scaling across courses
• Technical implementation details

---

## SPEAKING NOTES FOR EACH SLIDE:

**Slide 1 (00:00–00:30):**
"Thanks for the time. I'll cover 1) the challenge and my approach, 2) examples and tools, and 3) the Sep–Dec plan and impact—then I'll close with role fit and Dutch delivery."

**Slide 2 (00:30–03:00):**
"Students often arrive with limited quantitative background and high statistical anxiety. Abstract exercises don't feel relevant. My vision is a coherent path in Dodona: criminology-specific tasks, support that fades, and reproducible-by-design outputs."

**Slide 3 (03:00–04:30):**
"We progress with Bloom and PRIMM, starting with strong support and moving to independence. We make the 'why' explicit, especially correlation versus causation."

**Slide 4 (04:30–06:00):**
"Dodona powers auto-graded coding with hints; Ufora carries quizzes and resources; GitHub is the single source of truth; swirl supports console-first learners. We're R-first, adding Python/JS where it helps."

**Slide 5 (06:00–07:30):**
"I've authored 15 Dodona items using crimsyndata—privacy-safe, realistic patterns. Outputs are APA-ready via flextable/apaTables. These screenshots show what students actually work with."

**Slides 6-7 (07:30–10:30):**
"Crime rates: compute rates per 100k and flag above average; checks catch wrong denominators and NA issues. Chi-square: offense type × gender; we discuss small cells, effect size, and alternatives like Fisher's exact."

**Slide 8 (10:30–12:30):**
"Here's what students see in Dodona, swirl, and crimsyndata previews. I can open a quick demo if helpful."

**Slide 9 (12:30–15:00):**
"We run two authoring sprints, a visualization block, midterm mini-project, inference/regression modules, content freeze with pilot, then finalize and wrap on Dec 15."

**Slide 10 (15:00–17:00):**
"I've already delivered the core pieces—Dodona items, synthetic criminology data, and APA-from-code flow—and I know our workflows. My strength is structured, evidence-based development."

**Slide 11 (17:00–18:30):**
"I develop everything in Dutch. NT2 A2, completing A3, with a fixed review process that keeps language consistent at B1 readability."

**Slide 12 (18:30–20:00):**
"By Dec 15, we'll hit these measurable targets. I'd value your view on Semester-2 priorities and scaling across courses. Thank you."

---

## VISUAL ELEMENTS TO ADD:

1. **Slide 5:** Insert actual Dodona interface screenshot and APA table output
2. **Slide 6:** Insert code cell showing crime rate calculation + resulting APA table  
3. **Slide 7:** Insert swirl console screenshot showing step-by-step guidance
4. **Slide 8:** Insert 4 screenshots as placeholders showing each platform interface
5. **Color scheme:** Use university colors or professional blue/gray theme
6. **Icons:** Use relevant emojis or professional icons for bullet points
7. **Timeline visual:** Consider a timeline graphic for Slide 9

## FORMATTING TIPS:
- Use large, readable fonts (minimum 24pt for body text)
- High contrast colors for accessibility  
- Minimal text per slide (maximum 6-7 bullet points)
- Consistent slide layout and formatting
- Professional color scheme throughout
