Sub FillExistingTemplate()
    Dim ppt As Object
    Dim pres As Object
    Dim slide As Object
    Dim templatePath As String
    
    ' Get template path
    templatePath = InputBox("Enter the full path to your PowerPoint template:", _
                           "Select Template", _
                           "C:\Users\kukumar\OneDrive - UGent\Job\R-excerise\R-excerise-6\Graffiti_location_choice.pptx")
    
    If templatePath = "" Then
        MsgBox "No template selected. Exiting..."
        Exit Sub
    End If
    
    ' Create PowerPoint application and open template
    Set ppt = CreateObject("PowerPoint.Application")
    ppt.Visible = True
    Set pres = ppt.Presentations.Open(templatePath)
    
    ' Ensure we have enough slides (add blank slides if needed)
    Do While pres.Slides.Count < 13  ' 12 main slides + 1 hidden slide
        pres.Slides.Add pres.Slides.Count + 1, 2 ' Add content slide layout
    Loop
    
    ' Fill Slide 1: Title & Roadmap (00:00–00:30)
    Set slide = pres.Slides(1)
    Call FillSlideContent(slide, _
        "Building Evidence-Based Dodona Learning Paths for Criminology (Sep–Dec)", _
        "Our plan today — 1-2-3:" & vbCrLf & vbCrLf & _
        "1. Challenge & approach" & vbCrLf & _
        "2. Examples & tools (with screenshots)" & vbCrLf & _
        "3. Plan & impact (incl. role fit & Dutch delivery)")
    
    ' Fill Slide 2: Problem → Vision (00:30–03:00)
    Set slide = pres.Slides(2)
    Call FillSlideContent(slide, _
        "Problem → Vision", _
        "The Challenge:" & vbCrLf & _
        "• Many students start with limited quantitative background and statistical anxiety" & vbCrLf & _
        "• Abstract, non-criminology examples make concepts feel distant" & vbCrLf & _
        "• Reporting is often inconsistent and hard to reproduce" & vbCrLf & vbCrLf & _
        "The Vision:" & vbCrLf & _
        "• Domain-authentic tasks (crime rates, cross-tabs, basic regression)" & vbCrLf & _
        "• Gradual progression with support that fades" & vbCrLf & _
        "• Reproducible-by-design: outputs generated from code (tables/figures)")
    
    ' Fill Slide 3: Teaching Approach (03:00–04:30)
    Set slide = pres.Slides(3)
    Call FillSlideContent(slide, _
        "Teaching Approach", _
        "Four Core Pillars:" & vbCrLf & vbCrLf & _
        "• Bloom: Understand → Apply → Analyze → Create" & vbCrLf & _
        "• PRIMM: Predict → Run → Investigate → Modify → Make" & vbCrLf & _
        "• Scaffolding: Strong support at the start → Independence later" & vbCrLf & _
        "• Context rules: Frequent reminders that correlation ≠ causation")
    
    ' Fill Slide 4: Platform & Tools (04:30–06:00)
    Set slide = pres.Slides(4)
    Call FillSlideContent(slide, _
        "Platform & Tools", _
        "Integrated Ecosystem:" & vbCrLf & _
        "• Dodona: Auto-graded coding with hints and clear progression" & vbCrLf & _
        "• Ufora: Quizzes, resources, announcements" & vbCrLf & _
        "• GitHub: Datasets & starter code; single source of truth with tagged releases" & vbCrLf & _
        "• swirl: Step-by-step console lessons" & vbCrLf & vbCrLf & _
        "Technology Stack:" & vbCrLf & _
        "• Now: R + HTML/JS" & vbCrLf & _
        "• Next (where helpful): Python/JS widgets")
    
    ' Fill Slide 5: Portfolio Evidence (06:00–07:30)
    Set slide = pres.Slides(5)
    Call FillSlideContent(slide, _
        "Portfolio Evidence", _
        "What's Already Built:" & vbCrLf & _
        "• 15 Dodona items already authored (from data basics to regression)" & vbCrLf & _
        "• crimsyndata: Synthetic, privacy-safe criminology datasets" & vbCrLf & _
        "• APA from code: flextable / apaTables pipeline" & vbCrLf & _
        "• Metadata on each item: Bloom, PRIMM, Scaffolding" & vbCrLf & vbCrLf & _
        "Visual Evidence:" & vbCrLf & _
        "• [Screenshot] Dodona item (prompt + hint + feedback)" & vbCrLf & _
        "• [Screenshot] APA table rendered from code")
    
    ' Fill Slide 6: Walk-Through A: Crime Rates (07:30–09:00)
    Set slide = pres.Slides(6)
    Call FillSlideContent(slide, _
        "Walk-Through A: Crime Rates", _
        "Task: Compute rate per 100,000 by district and flag above national average" & vbCrLf & vbCrLf & _
        "Skills: group_by() → summarise() → mutate() → arrange()" & vbCrLf & vbCrLf & _
        "Checks: Denominator, missing values, sorting" & vbCrLf & vbCrLf & _
        "Output: APA table + 3-sentence interpretation" & vbCrLf & vbCrLf & _
        "Visual Evidence:" & vbCrLf & _
        "• [Screenshot] Code cell and APA table result")
    
    ' Fill Slide 7: Walk-Through B: Chi-Square (09:00–10:30)
    Set slide = pres.Slides(7)
    Call FillSlideContent(slide, _
        "Walk-Through B: Chi-Square", _
        "Task: Offense type × Gender (association)" & vbCrLf & vbCrLf & _
        "Steps: Contingency → Expected counts → χ² → Effect size" & vbCrLf & vbCrLf & _
        "Traps: p-value vs. effect size; small cells" & vbCrLf & vbCrLf & _
        "Feedback: When needed, collapse categories or suggest Fisher's exact" & vbCrLf & vbCrLf & _
        "Visual Evidence:" & vbCrLf & _
        "• [Screenshot] swirl step showing prompt + immediate feedback")
    
    ' Fill Slide 8: Visual Gallery & (Optional) Live Demo (10:30–12:30)
    Set slide = pres.Slides(8)
    Call FillSlideContent(slide, _
        "Visual Gallery & (Optional) Live Demo", _
        "What Students Actually See:" & vbCrLf & _
        "• Dodona: Prompt + hint + feedback (screenshot)" & vbCrLf & _
        "• swirl: Step-by-step lesson for the same topic (screenshot)" & vbCrLf & _
        "• crimsyndata: Small dataframe preview (e.g., head()) + variable notes (screenshot)" & vbCrLf & _
        "• APA table: Final formatted output (screenshot)" & vbCrLf & vbCrLf & _
        "Live demo (optional): Open one Dodona item if asked")
    
    ' Fill Slide 9: Sep–Dec 15 Delivery Plan (12:30–15:00)
    Set slide = pres.Slides(9)
    Call FillSlideContent(slide, _
        "Sep–Dec 15 Delivery Plan", _
        "Structured Timeline:" & vbCrLf & _
        "• Weeks 1–2: Audit learning outcomes; item map; data dictionaries" & vbCrLf & _
        "• Weeks 3–4: Sprint #1 — data literacy, descriptives, APA (6–8 items)" & vbCrLf & _
        "• Weeks 5–6: Sprint #2 — dplyr, rates, joins, tidy (6–8 items)" & vbCrLf & _
        "• Week 7: Visualization items (2–3) + caption standards" & vbCrLf & _
        "• Week 8: Midterm mini-project template + peer rubric" & vbCrLf & _
        "• Weeks 9–10: Inference (t, χ²) + regression I (4–5 items)" & vbCrLf & _
        "• Week 11: Content freeze #1; add progress data hooks; instructor handbook draft" & vbCrLf & _
        "• Week 12: Small seminar pilot; bug-fix" & vbCrLf & _
        "• Weeks 13–14: Regression II / optional spatial basics; final-project template" & vbCrLf & _
        "• Week 15: Content freeze #2; release candidate; onboarding videos; Dec 15 wrap-up")
    
    ' Fill Slide 10: Role Fit & What Sets Me Apart (15:00–17:00)
    Set slide = pres.Slides(10)
    Call FillSlideContent(slide, _
        "Role Fit & What Sets Me Apart", _
        "Already Delivered:" & vbCrLf & _
        "• Dodona items • synthetic data • APA pipeline" & vbCrLf & vbCrLf & _
        "Domain-Authentic:" & vbCrLf & _
        "• Criminology tasks; SPSS→R bridges; thesis-ready outputs" & vbCrLf & vbCrLf & _
        "Structured, Evidence-Based Development:" & vbCrLf & _
        "• Clear specs, tests, and use of progress data to improve items" & vbCrLf & vbCrLf & _
        "Operational Readiness:" & vbCrLf & _
        "• Concrete plan to Dec 15; GitHub releases; content freezes" & vbCrLf & vbCrLf & _
        "Department Fit:" & vbCrLf & _
        "• 3 years in your workflows; collaborations with course leads")
    
    ' Fill Slide 11: Dutch Delivery & Quality (17:00–18:30)
    Set slide = pres.Slides(11)
    Call FillSlideContent(slide, _
        "Dutch Delivery & Quality", _
        "Language Proficiency:" & vbCrLf & _
        "• NT2 A2, currently A3 (CVO); prototype delivered in Dutch" & vbCrLf & vbCrLf & _
        "Review Process:" & vbCrLf & _
        "• NL↔EN glossary • DeepL/LanguageTool • native speaker review" & vbCrLf & vbCrLf & _
        "Readability:" & vbCrLf & _
        "• B1 target; student clarity polls (Dodona/Ufora)" & vbCrLf & vbCrLf & _
        "KPIs:" & vbCrLf & _
        "• ≥95% items pass B1 checks; ≥4/5 clarity rating")
    
    ' Fill Slide 12: Questions & Discussion (18:30–20:00)
    Set slide = pres.Slides(12)
    Call FillSlideContent(slide, _
        "Questions & Discussion", _
        "Thank You" & vbCrLf & vbCrLf & _
        "Ready to discuss:" & vbCrLf & _
        "• Semester-2 priorities" & vbCrLf & _
        "• Scaling across courses" & vbCrLf & _
        "• Technical implementation details")
    
    ' Fill Hidden Slide 13: Reserve Q&A
    Set slide = pres.Slides(13)
    Call FillSlideContent(slide, _
        "Reserve Q&A", _
        "Quick References:" & vbCrLf & _
        "• SPSS → R mapping: Select Cases → filter, Compute → mutate, Crosstabs → count/tabyl" & vbCrLf & _
        "• Accessibility: Big fonts, high contrast, alt-text on screenshots" & vbCrLf & _
        "• Versioning: GitHub tags/releases; rollback friendly" & vbCrLf & _
        "• Academic integrity: Randomized data variants; new item seeds")
    
    ' Hide the reserve slide
    pres.Slides(13).SlideShowTransition.Hidden = True
    
    ' Add all detailed speaker notes
    Call AddExactSpeakerNotes(pres)
    
    ' Save as new file with error handling
    On Error Resume Next
    pres.SaveAs "C:\Users\kukumar\OneDrive - UGent\Job\Interview_presentation_FILLED.pptx"
    
    If Err.Number <> 0 Then
        ' Try saving to desktop instead
        pres.SaveAs Environ("USERPROFILE") & "\Desktop\Interview_presentation_FILLED.pptx"
        If Err.Number <> 0 Then
            ' Try current directory
            pres.SaveAs "Interview_presentation_FILLED.pptx"
        End If
    End If
    On Error GoTo 0
    
    MsgBox "Template filled successfully! Saved as Interview_presentation_FILLED.pptx" & vbCrLf & _
           "13 slides created (including 1 hidden reserve Q&A slide)", vbInformation
End Sub

Sub FillSlideContent(slide As Object, titleText As String, contentText As String)
    Dim i As Integer
    Dim titleFilled As Boolean
    Dim contentFilled As Boolean
    
    titleFilled = False
    contentFilled = False
    
    ' Fill title only once
    If slide.Shapes.HasTitle Then
        slide.Shapes.Title.TextFrame.TextRange.Text = titleText
        titleFilled = True
    End If
    
    ' Find the first content placeholder and fill it only once
    For i = 1 To slide.Shapes.Placeholders.Count
        If contentFilled Then Exit For
        If Not slide.Shapes.Placeholders(i).HasTextFrame Then GoTo NextPlaceholder
        If slide.Shapes.Placeholders(i).PlaceholderFormat.Type = 2 Or _
           slide.Shapes.Placeholders(i).PlaceholderFormat.Type = 7 Then
            slide.Shapes.Placeholders(i).TextFrame.TextRange.Text = contentText
            contentFilled = True
            Exit For
        End If
NextPlaceholder:
    Next i
    
    ' If no content placeholder found, try the second shape (but avoid title)
    If Not contentFilled And slide.Shapes.Count >= 2 Then
        For i = 2 To slide.Shapes.Count
            If slide.Shapes(i).HasTextFrame Then
                ' Make sure it's not the title we just filled
                If Not (slide.Shapes.HasTitle And slide.Shapes(i).Name = slide.Shapes.Title.Name) Then
                    slide.Shapes(i).TextFrame.TextRange.Text = contentText
                    Exit For
                End If
            End If
        Next i
    End If
End Sub

Sub AddExactSpeakerNotes(pres As Object)
    Dim speakerText As String
    
    On Error Resume Next ' Skip errors if speaker notes can't be added
    
    ' Slide 1: Title & Roadmap (00:00–00:30)
    If pres.Slides.Count >= 1 Then
        speakerText = "Thanks for the time. I'll cover 1) the challenge and my teaching approach, 2) concrete examples and tools, and 3) the Sep–Dec plan and impact—then I'll close with why I fit this role and how I guarantee Dutch-language quality." & vbCrLf & vbCrLf & _
        "From Appendix Script (00:00–00:30):" & vbCrLf & _
        "Today I'll cover 1) the challenge and my approach, 2) examples and tools, and 3) the plan and impact to Dec 15—then I'll close with role fit and Dutch delivery."
        pres.Slides(1).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 2: Problem → Vision (00:30–03:00)
    If pres.Slides.Count >= 2 Then
        speakerText = "Grounding every step in criminology reduces anxiety, while reproducible outputs build confidence." & vbCrLf & vbCrLf & _
        "From Appendix Script (00:30–03:00):" & vbCrLf & _
        "Students often arrive with limited quantitative background and high statistical anxiety. Abstract exercises don't feel relevant. My vision is a coherent path in Dodona: criminology-specific tasks, support that fades, and reproducible-by-design outputs. Students won't just run commands—they'll interpret and report correctly."
        pres.Slides(2).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 3: Teaching Approach (03:00–04:30)
    If pres.Slides.Count >= 3 Then
        speakerText = "These pillars keep cognitive load manageable and make learning feel relevant." & vbCrLf & vbCrLf & _
        "From Appendix Script (03:00–04:30):" & vbCrLf & _
        "We progress with Bloom and PRIMM, starting with strong support and moving to independence. We make the 'why' explicit (e.g., correlation ≠ causation)."
        pres.Slides(3).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 4: Platform & Tools (04:30–06:00)
    If pres.Slides.Count >= 4 Then
        speakerText = "This setup lets us deliver quickly, keep content tidy, and support different learning styles." & vbCrLf & vbCrLf & _
        "From Appendix Script (04:30–06:00):" & vbCrLf & _
        "Dodona powers auto-graded coding with hints; Ufora carries quizzes and resources; GitHub is the single source of truth; swirl supports console-first learners. We're R-first, adding Python/JS where it helps."
        pres.Slides(4).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 5: Portfolio Evidence (06:00–07:30)
    If pres.Slides.Count >= 5 Then
        speakerText = "These are the core components this role needs: authentic tasks, targeted hints, and clean reporting." & vbCrLf & vbCrLf & _
        "From Appendix Script (06:00–07:30):" & vbCrLf & _
        "I've authored 15 Dodona items using crimsyndata (privacy-safe, realistic patterns). Outputs are APA-ready via flextable/apaTables. (Show Dodona and APA screenshots.)"
        pres.Slides(5).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 6: Walk-Through A: Crime Rates (07:30–09:00)
    If pres.Slides.Count >= 6 Then
        speakerText = "This targets classic pitfalls—wrong denominators and NA handling—and finishes with clear, publishable output." & vbCrLf & vbCrLf & _
        "From Appendix Script (07:30–10:30 Walk-throughs):" & vbCrLf & _
        "A) Crime rates: compute rates per 100k and flag above average; checks catch wrong denominators and NA issues; finish with a clean APA table."
        pres.Slides(6).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 7: Walk-Through B: Chi-Square (09:00–10:30)
    If pres.Slides.Count >= 7 Then
        speakerText = "Students practice correct inference language and how to adapt when assumptions are strained." & vbCrLf & vbCrLf & _
        "From Appendix Script (07:30–10:30 Walk-throughs):" & vbCrLf & _
        "B) Chi-square: offense type × gender; we discuss small cells, effect size, and alternatives (Fisher). (Show swirl screenshot.)"
        pres.Slides(7).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 8: Visual Gallery & (Optional) Live Demo (10:30–12:30)
    If pres.Slides.Count >= 8 Then
        speakerText = "This is exactly what students see. I'm happy to open a short example if useful." & vbCrLf & vbCrLf & _
        "From Appendix Script (10:30–12:30):" & vbCrLf & _
        "Here's what students see in Dodona, swirl, and a small crimsyndata preview. I can open a quick demo if helpful."
        pres.Slides(8).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 9: Sep–Dec 15 Delivery Plan (12:30–15:00)
    If pres.Slides.Count >= 9 Then
        speakerText = "Two content freezes and a short pilot protect quality and give us time to tidy details." & vbCrLf & vbCrLf & _
        "From Appendix Script (12:30–15:00):" & vbCrLf & _
        "We run two authoring sprints (Weeks 3–6), a visualization block (Week 7), a midterm mini-project (Week 8), inference/regression (Weeks 9–10), a content freeze with progress tracking (Week 11), a small pilot (Week 12), then finalize (Weeks 13–15) and wrap on Dec 15."
        pres.Slides(9).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 10: Role Fit & What Sets Me Apart (15:00–17:00)
    If pres.Slides.Count >= 10 Then
        speakerText = "I'm proposing something we can deliver now because much of it is already built and aligned with how we work." & vbCrLf & vbCrLf & _
        "From Appendix Script (15:00–17:00):" & vbCrLf & _
        "I've already delivered the core pieces—Dodona items, synthetic criminology data, and an APA-from-code flow—and I know our workflows. My strength is a structured, evidence-based approach: clear specs, checks for common mistakes, and the use of progress data to improve."
        pres.Slides(10).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 11: Dutch Delivery & Quality (17:00–18:30)
    If pres.Slides.Count >= 11 Then
        speakerText = "I develop the paths in Dutch. I'm NT2 A2 and completing A3. Despite limited spoken fluency, I've already delivered a Dutch prototype. A fixed review process—glossary, automated checks, native review—keeps language clear from day one." & vbCrLf & vbCrLf & _
        "Dutch Notes (NL):" & vbCrLf & _
        "Ik ontwikkel de leerlijnen in het Nederlands. Mijn niveau is NT2 A2 en ik volg A3 bij CVO. Ondanks mijn beperkte spreekvaardigheid heb ik het prototype al in het Nederlands opgeleverd. Met een vaste review-procedure (terminologielijst, automatische checks, review door een moedertaalspreker) borgen we duidelijke taal vanaf dag één." & vbCrLf & vbCrLf & _
        "From Appendix Script (17:00–18:30):" & vbCrLf & _
        "I develop everything in Dutch. I'm NT2 A2, completing A3, and I've already delivered a Dutch prototype. A fixed review process (glossary, automated checks, native review) keeps language consistent at B1 readability. We also run short clarity polls."
        pres.Slides(11).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Slide 12: Questions & Discussion (18:30–20:00)
    If pres.Slides.Count >= 12 Then
        speakerText = "From Appendix Script (18:30–20:00 — Close & questions):" & vbCrLf & _
        "By Dec 15, targets are: ≥85% onboarding completion, −30% denominator errors, ≥70% first-pass APA tables, and ≥90% reproducibility spot-checks, plus language KPIs. I'd value your view on Semester-2 priorities and scaling across courses. Thank you."
        pres.Slides(12).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange.Text = speakerText
    End If
    
    ' Hidden Slide 13: Reserve Q&A - No speaker notes needed
    
    On Error GoTo 0 ' Resume normal error handling
End Sub
