Sub CreateInterviewSlides()
    Dim ppt As Object
    Dim pres As Object
    Dim slide As Object
    Dim textBox As Object
    Dim i As Integer
    Dim templatePath As String
    
    ' Prompt user for template file path
    templatePath = InputBox("Please enter the full path to your PowerPoint template file:", _
                           "Select Template", _
                           "C:\Users\kukumar\OneDrive - UGent\Job\R-excerise\R-excerise-6\YourTemplate.pptx")
    
    If templatePath = "" Then
        MsgBox "No template selected. Exiting...", vbInformation
        Exit Sub
    End If
    
    ' Create PowerPoint application
    Set ppt = CreateObject("PowerPoint.Application")
    ppt.Visible = True
    
    ' Open existing template
    Set pres = ppt.Presentations.Open(templatePath)
    
    ' Clear existing slides (optional - comment out if you want to keep template slides)
    ' For i = pres.Slides.Count To 1 Step -1
    '     pres.Slides(i).Delete
    ' Next i
    
    ' Add slides using template's slide layouts
    ' Slide 1: Title & Roadmap
    Set slide = pres.Slides.Add(pres.Slides.Count + 1, pres.SlideMaster.CustomLayouts(1)) ' Use first custom layout
    If slide.Shapes.HasTitle Then
        slide.Shapes.Title.TextFrame.TextRange.Text = "Building Evidence-Based Dodona Learning Paths for Criminology (Sep–Dec)"
    End If
    If slide.Shapes.Placeholders.Count >= 2 Then
        slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
            "Scientific Staff Position | 20-minute Presentation" & vbCrLf & vbCrLf & _
            "Our plan today — 1-2-3:" & vbCrLf & _
            "• Challenge & approach" & vbCrLf & _
            "• Examples & tools (with screenshots)" & vbCrLf & _
            "• Plan & impact (incl. role fit & Dutch delivery)" & vbCrLf & vbCrLf & _
            "Presenter: Dr. Kuralarasan Kumar"
    End If
    
    ' Slide 2: Problem → Vision
    Set slide = pres.Slides.Add(pres.Slides.Count + 1, pres.SlideMaster.CustomLayouts(2)) ' Use second custom layout
    If slide.Shapes.HasTitle Then
        slide.Shapes.Title.TextFrame.TextRange.Text = "Problem → Vision"
    End If
    If slide.Shapes.Placeholders.Count >= 2 Then
        slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
            "The Challenge" & vbCrLf & _
            "• Many students start with limited quantitative background and statistical anxiety" & vbCrLf & _
            "• Abstract, non-criminology examples make concepts feel distant" & vbCrLf & _
            "• Reporting is often inconsistent and hard to reproduce" & vbCrLf & vbCrLf & _
            "The Vision" & vbCrLf & _
            "• Domain-authentic tasks (crime rates, cross-tabs, basic regression)" & vbCrLf & _
            "• Gradual progression with support that fades" & vbCrLf & _
            "• Reproducible-by-design: outputs generated from code (tables/figures)"
    End If
    
    ' Slide 3: Teaching Approach
    Set slide = pres.Slides.Add(3, 2) ' ppLayoutText
    slide.Shapes.Title.TextFrame.TextRange.Text = "Teaching Approach"
    slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Four Core Pillars" & vbCrLf & vbCrLf & _
        "🎯 Bloom: Understand → Apply → Analyze → Create" & vbCrLf & _
        "🔄 PRIMM: Predict → Run → Investigate → Modify → Make" & vbCrLf & _
        "📈 Scaffolding: Strong support at the start → Independence later" & vbCrLf & _
        "⚠️ Context rules: Frequent reminders that correlation ≠ causation"
    
    ' Slide 4: Platform & Tools
    Set slide = pres.Slides.Add(4, 2) ' ppLayoutText
    slide.Shapes.Title.TextFrame.TextRange.Text = "Platform & Tools"
    slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Integrated Ecosystem" & vbCrLf & vbCrLf & _
        "🎓 Dodona: Auto-graded coding with hints and clear progression" & vbCrLf & _
        "📚 Ufora: Quizzes, resources, announcements" & vbCrLf & _
        "💻 GitHub: Datasets & starter code; single source of truth with tagged releases" & vbCrLf & _
        "🖥️ swirl: Step-by-step console lessons" & vbCrLf & vbCrLf & _
        "Technology Stack:" & vbCrLf & _
        "• Now: R + HTML/JS" & vbCrLf & _
        "• Next (where helpful): Python/JS widgets"
    
    ' Slide 5: Portfolio Evidence
    Set slide = pres.Slides.Add(5, 2) ' ppLayoutText
    slide.Shapes.Title.TextFrame.TextRange.Text = "Portfolio Evidence"
    slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "What's Already Built" & vbCrLf & vbCrLf & _
        "✅ 15 Dodona items already authored (from data basics to regression)" & vbCrLf & _
        "✅ crimsyndata: Synthetic, privacy-safe criminology datasets" & vbCrLf & _
        "✅ APA from code: flextable / apaTables pipeline" & vbCrLf & _
        "✅ Metadata on each item: Bloom, PRIMM, Scaffolding" & vbCrLf & vbCrLf & _
        "Visual Evidence:" & vbCrLf & _
        "[INSERT: Dodona item screenshot - prompt + hint + feedback]" & vbCrLf & _
        "[INSERT: APA table rendered from code screenshot]"
    
    ' Slide 6: Walk-Through A - Crime Rates
    Set slide = pres.Slides.Add(6, 2) ' ppLayoutText
    slide.Shapes.Title.TextFrame.TextRange.Text = "Walk-Through A - Crime Rates"
    slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Task: Compute rate per 100,000 by district and flag above national average" & vbCrLf & vbCrLf & _
        "Skills: group_by() → summarise() → mutate() → arrange()" & vbCrLf & vbCrLf & _
        "Checks:" & vbCrLf & _
        "• Denominator validation" & vbCrLf & _
        "• Missing values handling" & vbCrLf & _
        "• Proper sorting" & vbCrLf & vbCrLf & _
        "Output: APA table + 3-sentence interpretation" & vbCrLf & vbCrLf & _
        "[INSERT: Code cell and APA table result screenshot]"
    
    ' Slide 7: Walk-Through B - Chi-Square
    Set slide = pres.Slides.Add(7, 2) ' ppLayoutText
    slide.Shapes.Title.TextFrame.TextRange.Text = "Walk-Through B - Chi-Square"
    slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Task: Offense type × Gender (association)" & vbCrLf & vbCrLf & _
        "Steps: Contingency → Expected counts → χ² → Effect size" & vbCrLf & vbCrLf & _
        "Challenges:" & vbCrLf & _
        "• p-value vs. effect size interpretation" & vbCrLf & _
        "• Small cell count issues" & vbCrLf & vbCrLf & _
        "Smart Feedback: When needed, collapse categories or suggest Fisher's exact" & vbCrLf & vbCrLf & _
        "[INSERT: swirl step showing prompt + immediate feedback screenshot]"
    
    ' Slide 8: Visual Gallery & Demo
    Set slide = pres.Slides.Add(8, 2) ' ppLayoutText
    slide.Shapes.Title.TextFrame.TextRange.Text = "Visual Gallery & Demo"
    slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "What Students Actually See" & vbCrLf & vbCrLf & _
        "📱 Dodona: Prompt + hint + feedback system" & vbCrLf & _
        "[INSERT: Dodona interface screenshot]" & vbCrLf & vbCrLf & _
        "💬 swirl: Step-by-step lesson guidance" & vbCrLf & _
        "[INSERT: swirl console screenshot]" & vbCrLf & vbCrLf & _
        "📊 crimsyndata: Realistic data preview + documentation" & vbCrLf & _
        "[INSERT: head() output + variable notes screenshot]" & vbCrLf & vbCrLf & _
        "📋 APA output: Professional formatted results" & vbCrLf & _
        "[INSERT: Final APA table screenshot]" & vbCrLf & vbCrLf & _
        "Live demo available if requested"
    
    ' Slide 9: Sep–Dec 15 Delivery Plan
    Set slide = pres.Slides.Add(9, 2) ' ppLayoutText
    slide.Shapes.Title.TextFrame.TextRange.Text = "Sep–Dec 15 Delivery Plan"
    slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Structured Timeline" & vbCrLf & vbCrLf & _
        "Weeks 1–2: Audit learning outcomes; item map; data dictionaries" & vbCrLf & _
        "Weeks 3–4: Sprint #1 — data literacy, descriptives, APA (6–8 items)" & vbCrLf & _
        "Weeks 5–6: Sprint #2 — dplyr, rates, joins, tidy (6–8 items)" & vbCrLf & _
        "Week 7: Visualization items (2–3) + caption standards" & vbCrLf & _
        "Week 8: Midterm mini-project template + peer rubric" & vbCrLf & _
        "Weeks 9–10: Inference (t, χ²) + regression I (4–5 items)" & vbCrLf & _
        "Week 11: 🔒 Content freeze #1; add progress data hooks" & vbCrLf & _
        "Week 12: Small seminar pilot; bug-fix" & vbCrLf & _
        "Weeks 13–14: Regression II / optional spatial basics" & vbCrLf & _
        "Week 15: 🔒 Content freeze #2; release candidate; Dec 15 wrap-up"
    
    ' Slide 10: Role Fit & What Sets Me Apart
    Set slide = pres.Slides.Add(10, 2) ' ppLayoutText
    slide.Shapes.Title.TextFrame.TextRange.Text = "Role Fit & What Sets Me Apart"
    slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Already Delivered" & vbCrLf & _
        "• Dodona items • Synthetic data • APA pipeline" & vbCrLf & vbCrLf & _
        "Domain-Authentic" & vbCrLf & _
        "• Criminology tasks • SPSS→R bridges • Thesis-ready outputs" & vbCrLf & vbCrLf & _
        "Structured, Evidence-Based Development" & vbCrLf & _
        "• Clear specs, tests, and progress data usage" & vbCrLf & vbCrLf & _
        "Operational Readiness" & vbCrLf & _
        "• Concrete plan to Dec 15 • GitHub releases • Content freezes" & vbCrLf & vbCrLf & _
        "Department Fit" & vbCrLf & _
        "• 3 years in workflows • Course lead collaborations"
    
    ' Slide 11: Dutch Delivery & Quality
    Set slide = pres.Slides.Add(11, 2) ' ppLayoutText
    slide.Shapes.Title.TextFrame.TextRange.Text = "Dutch Delivery & Quality"
    slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Language Proficiency" & vbCrLf & _
        "🇳🇱 NT2 A2, currently A3 (CVO); prototype delivered in Dutch" & vbCrLf & vbCrLf & _
        "Review Process" & vbCrLf & _
        "• NL↔EN glossary" & vbCrLf & _
        "• DeepL/LanguageTool integration" & vbCrLf & _
        "• Native speaker review rounds" & vbCrLf & vbCrLf & _
        "Quality Targets" & vbCrLf & _
        "• B1 readability standard" & vbCrLf & _
        "• Student clarity polls (Dodona/Ufora)" & vbCrLf & vbCrLf & _
        "KPIs" & vbCrLf & _
        "• ≥95% items pass B1 checks" & vbCrLf & _
        "• ≥4/5 clarity rating"
    
    ' Slide 12: Questions & Discussion
    Set slide = pres.Slides.Add(12, 2) ' ppLayoutText
    slide.Shapes.Title.TextFrame.TextRange.Text = "Questions & Discussion"
    slide.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Thank You" & vbCrLf & vbCrLf & _
        "Key Targets by Dec 15:" & vbCrLf & _
        "• ≥85% onboarding completion" & vbCrLf & _
        "• −30% denominator errors" & vbCrLf & _
        "• ≥70% first-pass APA tables" & vbCrLf & _
        "• ≥90% reproducibility spot-checks" & vbCrLf & vbCrLf & _
        "Ready to discuss:" & vbCrLf & _
        "• Semester-2 priorities" & vbCrLf & _
        "• Scaling across courses" & vbCrLf & _
        "• Technical implementation details"
    
    ' Add speaker notes to each slide
    Call AddSpeakerNotes(pres)
    
    ' Save the presentation
    pres.SaveAs "C:\Users\kukumar\OneDrive - UGent\Job\R-excerise\R-excerise-6\Interview_Presentation_Generated.pptx"
    
    MsgBox "PowerPoint presentation created successfully!", vbInformation
End Sub

Sub AddSpeakerNotes(pres As Object)
    ' Add speaker notes to slides
    pres.Slides(1).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Thanks for the time. I'll cover 1) the challenge and my approach, 2) examples and tools, and 3) the Sep–Dec plan and impact—then I'll close with role fit and Dutch delivery. (00:00–00:30)"
    
    pres.Slides(2).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Students often arrive with limited quantitative background and high statistical anxiety. Abstract exercises don't feel relevant. My vision is a coherent path in Dodona: criminology-specific tasks, support that fades, and reproducible-by-design outputs. (00:30–03:00)"
    
    pres.Slides(3).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "We progress with Bloom and PRIMM, starting with strong support and moving to independence. We make the 'why' explicit, especially correlation versus causation. (03:00–04:30)"
    
    pres.Slides(4).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Dodona powers auto-graded coding with hints; Ufora carries quizzes and resources; GitHub is the single source of truth; swirl supports console-first learners. We're R-first, adding Python/JS where it helps. (04:30–06:00)"
    
    pres.Slides(5).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "I've authored 15 Dodona items using crimsyndata—privacy-safe, realistic patterns. Outputs are APA-ready via flextable/apaTables. These screenshots show what students actually work with. (06:00–07:30)"
    
    pres.Slides(6).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Crime rates: compute rates per 100k and flag above average; checks catch wrong denominators and NA issues. (07:30–09:00)"
    
    pres.Slides(7).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Chi-square: offense type × gender; we discuss small cells, effect size, and alternatives like Fisher's exact. (09:00–10:30)"
    
    pres.Slides(8).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "Here's what students see in Dodona, swirl, and crimsyndata previews. I can open a quick demo if helpful. (10:30–12:30)"
    
    pres.Slides(9).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "We run two authoring sprints, a visualization block, midterm mini-project, inference/regression modules, content freeze with pilot, then finalize and wrap on Dec 15. (12:30–15:00)"
    
    pres.Slides(10).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "I've already delivered the core pieces—Dodona items, synthetic criminology data, and APA-from-code flow—and I know our workflows. My strength is structured, evidence-based development. (15:00–17:00)"
    
    pres.Slides(11).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "I develop everything in Dutch. NT2 A2, completing A3, with a fixed review process that keeps language consistent at B1 readability. (17:00–18:30)"
    
    pres.Slides(12).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = _
        "By Dec 15, we'll hit these measurable targets. I'd value your view on Semester-2 priorities and scaling across courses. Thank you. (18:30–20:00)"
End Sub
