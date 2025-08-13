Sub FillTemplateCarefully()
    Dim ppt As Object
    Dim pres As Object
    Dim slide As Object
    Dim templatePath As String
    
    ' Get template path
    templatePath = InputBox("Enter the full path to your PowerPoint template:", _
                           "Select Template", _
                           "C:\Users\kukumar\OneDrive - UGent\Job\Interview_presentation.pptx")
    
    If templatePath = "" Then
        MsgBox "No template selected. Exiting..."
        Exit Sub
    End If
    
    ' Create PowerPoint application and open template
    Set ppt = CreateObject("PowerPoint.Application")
    ppt.Visible = True
    Set pres = ppt.Presentations.Open(templatePath)
    
    ' Ensure we have enough slides (add blank slides if needed)
    Do While pres.Slides.Count < 12
        pres.Slides.Add pres.Slides.Count + 1, 2 ' Add content slide layout
    Loop
    
    ' Fill slides with improved content (no emojis, better formatting)
    Call FillSlideCarefully(pres.Slides(1), _
        "Building Evidence-Based Dodona Learning Paths for Criminology (Sep-Dec)", _
        "Scientific Staff Position | 20-minute Presentation" & vbCrLf & vbCrLf & _
        "Our plan today - 1-2-3:" & vbCrLf & _
        "• Challenge & approach" & vbCrLf & _
        "• Examples & tools (with screenshots)" & vbCrLf & _
        "• Plan & impact (incl. role fit & Dutch delivery)" & vbCrLf & vbCrLf & _
        "Presenter: Dr. Kuralarasan Kumar")
    
    Call FillSlideCarefully(pres.Slides(2), _
        "Problem → Vision", _
        "The Challenge" & vbCrLf & _
        "• Many students start with limited quantitative background and statistical anxiety" & vbCrLf & _
        "• Abstract, non-criminology examples make concepts feel distant" & vbCrLf & _
        "• Reporting is often inconsistent and hard to reproduce" & vbCrLf & vbCrLf & _
        "The Vision" & vbCrLf & _
        "• Domain-authentic tasks (crime rates, cross-tabs, basic regression)" & vbCrLf & _
        "• Gradual progression with support that fades" & vbCrLf & _
        "• Reproducible-by-design: outputs generated from code (tables/figures)")
    
    Call FillSlideCarefully(pres.Slides(3), _
        "Teaching Approach", _
        "Four Core Pillars" & vbCrLf & vbCrLf & _
        "• Bloom: Understand → Apply → Analyze → Create" & vbCrLf & _
        "• PRIMM: Predict → Run → Investigate → Modify → Make" & vbCrLf & _
        "• Scaffolding: Strong support at the start → Independence later" & vbCrLf & _
        "• Context rules: Frequent reminders that correlation ≠ causation")
    
    Call FillSlideCarefully(pres.Slides(4), _
        "Platform & Tools", _
        "Integrated Ecosystem" & vbCrLf & vbCrLf & _
        "• Dodona: Auto-graded coding with hints and clear progression" & vbCrLf & _
        "• Ufora: Quizzes, resources, announcements" & vbCrLf & _
        "• GitHub: Datasets & starter code; single source of truth with tagged releases" & vbCrLf & _
        "• swirl: Step-by-step console lessons" & vbCrLf & vbCrLf & _
        "Technology Stack:" & vbCrLf & _
        "• Now: R + HTML/JS" & vbCrLf & _
        "• Next (where helpful): Python/JS widgets")
    
    Call FillSlideCarefully(pres.Slides(5), _
        "Portfolio Evidence", _
        "What's Already Built" & vbCrLf & vbCrLf & _
        "• 15 Dodona items already authored (from data basics to regression)" & vbCrLf & _
        "• crimsyndata: Synthetic, privacy-safe criminology datasets" & vbCrLf & _
        "• APA from code: flextable / apaTables pipeline" & vbCrLf & _
        "• Metadata on each item: Bloom, PRIMM, Scaffolding" & vbCrLf & vbCrLf & _
        "Visual Evidence:" & vbCrLf & _
        "[INSERT: Dodona item screenshot - prompt + hint + feedback]" & vbCrLf & _
        "[INSERT: APA table rendered from code screenshot]")
    
    Call FillSlideCarefully(pres.Slides(6), _
        "Walk-Through A - Crime Rates", _
        "Task: Compute rate per 100,000 by district and flag above national average" & vbCrLf & vbCrLf & _
        "Skills: group_by() → summarise() → mutate() → arrange()" & vbCrLf & vbCrLf & _
        "Checks:" & vbCrLf & _
        "• Denominator validation" & vbCrLf & _
        "• Missing values handling" & vbCrLf & _
        "• Proper sorting" & vbCrLf & vbCrLf & _
        "Output: APA table + 3-sentence interpretation" & vbCrLf & vbCrLf & _
        "[INSERT: Code cell and APA table result screenshot]")
    
    Call FillSlideCarefully(pres.Slides(7), _
        "Walk-Through B - Chi-Square", _
        "Task: Offense type × Gender (association)" & vbCrLf & vbCrLf & _
        "Steps: Contingency → Expected counts → χ² → Effect size" & vbCrLf & vbCrLf & _
        "Challenges:" & vbCrLf & _
        "• p-value vs. effect size interpretation" & vbCrLf & _
        "• Small cell count issues" & vbCrLf & vbCrLf & _
        "Smart Feedback: When needed, collapse categories or suggest Fisher's exact" & vbCrLf & vbCrLf & _
        "[INSERT: swirl step showing prompt + immediate feedback screenshot]")
    
    Call FillSlideCarefully(pres.Slides(8), _
        "Visual Gallery & Demo", _
        "What Students Actually See" & vbCrLf & vbCrLf & _
        "• Dodona: Prompt + hint + feedback system" & vbCrLf & _
        "[INSERT: Dodona interface screenshot]" & vbCrLf & vbCrLf & _
        "• swirl: Step-by-step lesson guidance" & vbCrLf & _
        "[INSERT: swirl console screenshot]" & vbCrLf & vbCrLf & _
        "• crimsyndata: Realistic data preview + documentation" & vbCrLf & _
        "[INSERT: head() output + variable notes screenshot]" & vbCrLf & vbCrLf & _
        "• APA output: Professional formatted results" & vbCrLf & _
        "[INSERT: Final APA table screenshot]" & vbCrLf & vbCrLf & _
        "Live demo available if requested")
    
    Call FillSlideCarefully(pres.Slides(9), _
        "Sep-Dec 15 Delivery Plan", _
        "Structured Timeline" & vbCrLf & vbCrLf & _
        "Weeks 1-2: Audit learning outcomes; item map; data dictionaries" & vbCrLf & _
        "Weeks 3-4: Sprint #1 — data literacy, descriptives, APA (6-8 items)" & vbCrLf & _
        "Weeks 5-6: Sprint #2 — dplyr, rates, joins, tidy (6-8 items)" & vbCrLf & _
        "Week 7: Visualization items (2-3) + caption standards" & vbCrLf & _
        "Week 8: Midterm mini-project template + peer rubric" & vbCrLf & _
        "Weeks 9-10: Inference (t, χ²) + regression I (4-5 items)" & vbCrLf & _
        "Week 11: Content freeze #1; add progress data hooks" & vbCrLf & _
        "Week 12: Small seminar pilot; bug-fix" & vbCrLf & _
        "Weeks 13-14: Regression II / optional spatial basics" & vbCrLf & _
        "Week 15: Content freeze #2; release candidate; Dec 15 wrap-up")
    
    Call FillSlideCarefully(pres.Slides(10), _
        "Role Fit & What Sets Me Apart", _
        "Already Delivered" & vbCrLf & _
        "• Dodona items • Synthetic data • APA pipeline" & vbCrLf & vbCrLf & _
        "Domain-Authentic" & vbCrLf & _
        "• Criminology tasks • SPSS→R bridges • Thesis-ready outputs" & vbCrLf & vbCrLf & _
        "Structured, Evidence-Based Development" & vbCrLf & _
        "• Clear specs, tests, and progress data usage" & vbCrLf & vbCrLf & _
        "Operational Readiness" & vbCrLf & _
        "• Concrete plan to Dec 15 • GitHub releases • Content freezes" & vbCrLf & vbCrLf & _
        "Department Fit" & vbCrLf & _
        "• 3 years in workflows • Course lead collaborations")
    
    Call FillSlideCarefully(pres.Slides(11), _
        "Dutch Delivery & Quality", _
        "Language Proficiency" & vbCrLf & _
        "• NT2 A2, currently A3 (CVO); prototype delivered in Dutch" & vbCrLf & vbCrLf & _
        "Review Process" & vbCrLf & _
        "• NL↔EN glossary" & vbCrLf & _
        "• DeepL/LanguageTool integration" & vbCrLf & _
        "• Native speaker review rounds" & vbCrLf & vbCrLf & _
        "Quality Targets" & vbCrLf & _
        "• B1 readability standard" & vbCrLf & _
        "• Student clarity polls (Dodona/Ufora)" & vbCrLf & vbCrLf & _
        "KPIs" & vbCrLf & _
        "• ≥95% items pass B1 checks" & vbCrLf & _
        "• ≥4/5 clarity rating")
    
    Call FillSlideCarefully(pres.Slides(12), _
        "Questions & Discussion", _
        "Thank You" & vbCrLf & vbCrLf & _
        "Key Targets by Dec 15:" & vbCrLf & _
        "• ≥85% onboarding completion" & vbCrLf & _
        "• -30% denominator errors" & vbCrLf & _
        "• ≥70% first-pass APA tables" & vbCrLf & _
        "• ≥90% reproducibility spot-checks" & vbCrLf & vbCrLf & _
        "Ready to discuss:" & vbCrLf & _
        "• Semester-2 priorities" & vbCrLf & _
        "• Scaling across courses" & vbCrLf & _
        "• Technical implementation details")
    
    ' Add speaker notes
    Call AddSpeakerNotesCarefully(pres)
    
    ' Save as new file
    pres.SaveAs "C:\Users\kukumar\OneDrive - UGent\Job\Interview_presentation_CLEAN.pptx"
    
    MsgBox "Template filled successfully! Saved as Interview_presentation_CLEAN.pptx", vbInformation
End Sub

Sub FillSlideCarefully(slide As Object, titleText As String, contentText As String)
    Dim i As Integer
    Dim titleFilled As Boolean
    Dim contentFilled As Boolean
    
    titleFilled = False
    contentFilled = False
    
    ' Fill title ONLY if it's empty or has placeholder text
    If slide.Shapes.HasTitle Then
        With slide.Shapes.Title.TextFrame.TextRange
            If Len(Trim(.Text)) = 0 Or InStr(.Text, "Click to add title") > 0 Then
                .Text = titleText
                titleFilled = True
            End If
        End With
    End If
    
    ' Fill content ONLY in proper placeholders and ONLY if they're empty
    For i = 1 To slide.Shapes.Placeholders.Count
        If contentFilled Then Exit For
        
        If slide.Shapes.Placeholders(i).HasTextFrame Then
            ' Check if it's a content placeholder (type 2) or text placeholder (type 7)
            If slide.Shapes.Placeholders(i).PlaceholderFormat.Type = 2 Or _
               slide.Shapes.Placeholders(i).PlaceholderFormat.Type = 7 Then
                
                With slide.Shapes.Placeholders(i).TextFrame.TextRange
                    ' Only fill if empty or has placeholder text
                    If Len(Trim(.Text)) = 0 Or InStr(.Text, "Click to add") > 0 Then
                        .Text = contentText
                        contentFilled = True
                    End If
                End With
            End If
        End If
    Next i
    
    ' If content still not filled, try other text boxes (but be very careful)
    If Not contentFilled Then
        For i = 1 To slide.Shapes.Count
            If slide.Shapes(i).HasTextFrame And i > 1 Then ' Skip first shape (usually title)
                With slide.Shapes(i).TextFrame.TextRange
                    ' Only fill if completely empty
                    If Len(Trim(.Text)) = 0 Then
                        .Text = contentText
                        Exit For
                    End If
                End With
            End If
        Next i
    End If
End Sub

Sub AddSpeakerNotesCarefully(pres As Object)
    Dim speakerNotes(12) As String
    Dim i As Integer
    
    ' Define all speaker notes
    speakerNotes(1) = "Thanks for the time. I'll cover 1) the challenge and my approach, 2) examples and tools, and 3) the Sep-Dec plan and impact-then I'll close with role fit and Dutch delivery. (00:00-00:30)"
    
    speakerNotes(2) = "Students often arrive with limited quantitative background and high statistical anxiety. Abstract exercises don't feel relevant. My vision is a coherent path in Dodona: criminology-specific tasks, support that fades, and reproducible-by-design outputs. (00:30-03:00)"
    
    speakerNotes(3) = "We progress with Bloom and PRIMM, starting with strong support and moving to independence. We make the 'why' explicit, especially correlation versus causation. (03:00-04:30)"
    
    speakerNotes(4) = "Dodona powers auto-graded coding with hints; Ufora carries quizzes and resources; GitHub is the single source of truth; swirl supports console-first learners. We're R-first, adding Python/JS where it helps. (04:30-06:00)"
    
    speakerNotes(5) = "I've authored 15 Dodona items using crimsyndata-privacy-safe, realistic patterns. Outputs are APA-ready via flextable/apaTables. These screenshots show what students actually work with. (06:00-07:30)"
    
    speakerNotes(6) = "Crime rates: compute rates per 100k and flag above average; checks catch wrong denominators and NA issues. (07:30-09:00)"
    
    speakerNotes(7) = "Chi-square: offense type × gender; we discuss small cells, effect size, and alternatives like Fisher's exact. (09:00-10:30)"
    
    speakerNotes(8) = "Here's what students see in Dodona, swirl, and crimsyndata previews. I can open a quick demo if helpful. (10:30-12:30)"
    
    speakerNotes(9) = "We run two authoring sprints, a visualization block, midterm mini-project, inference/regression modules, content freeze with pilot, then finalize and wrap on Dec 15. (12:30-15:00)"
    
    speakerNotes(10) = "I've already delivered the core pieces-Dodona items, synthetic criminology data, and APA-from-code flow-and I know our workflows. My strength is structured, evidence-based development. (15:00-17:00)"
    
    speakerNotes(11) = "I develop everything in Dutch. NT2 A2, completing A3, with a fixed review process that keeps language consistent at B1 readability. (17:00-18:30)"
    
    speakerNotes(12) = "By Dec 15, we'll hit these measurable targets. I'd value your view on Semester-2 priorities and scaling across courses. Thank you. (18:30-20:00)"
    
    ' Add notes only if they don't exist
    For i = 1 To 12
        If i <= pres.Slides.Count Then
            With pres.Slides(i).NotesPage.Shapes.Placeholders(2).TextFrame.TextRange
                If Len(Trim(.Text)) = 0 Then
                    .Text = speakerNotes(i)
                End If
            End With
        End If
    Next i
End Sub
