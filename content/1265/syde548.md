---
title: "SYDE 548: User Centred Design Methods"
subjects: "SYDE"
---

## Sources and References

- Norman, <em>The Design of Everyday Things</em> (Basic Books)
- Nielsen, <em>Usability Engineering</em> (Morgan Kaufmann)
- Dumas and Redish, <em>A Practical Guide to Usability Testing</em> (Intellect)
- Rubin and Chisnell, <em>Handbook of Usability Testing</em> (Wiley)
- ISO 9241-210: <em>Human-Centred Design for Interactive Systems</em>

---

# Chapter 1: User-Centred Design Principles

## 1.1 Philosophy

User-centred design (UCD) places users at the centre of design decisions throughout the product lifecycle. ISO 9241-210 articulates principles: design is based on explicit understanding of users and tasks; users are involved throughout; design is driven and refined by user-centred evaluation; the process is iterative; design addresses the whole user experience; and design teams include multidisciplinary perspectives.

## 1.2 Human Factors and Usability

Human factors engineering studies how humans perceive, think, decide, and act. Usability — a subset — concerns effectiveness (can users accomplish goals?), efficiency (at what cost?), and satisfaction (how well is the experience received?). User experience (UX) broadens this to emotions, aesthetics, and meaning over the whole relationship with a product.

<div class="definition">
<strong>Usability</strong> is the extent to which a system can be used by specified users to achieve specified goals with effectiveness, efficiency, and satisfaction in a specified context of use (ISO 9241-11).
</div>

# Chapter 2: User Research

## 2.1 Qualitative Methods

Qualitative research surfaces meaning, context, and unarticulated needs. Contextual inquiry observes and interviews users in their environment; ethnographic studies immerse longer; diary studies capture behaviour over days or weeks; journey mapping externalises experience across phases. Sample sizes are modest (5–15 participants); depth and insight matter more than statistical significance.

## 2.2 Quantitative Methods

Surveys and analytics quantify prevalence: how many users face an issue, how often, under which conditions. Well-designed questionnaires (SUS, UMUX, NPS) offer benchmarked usability and satisfaction scores. Behavioural analytics — page views, click paths, funnels — observe at scale but miss the <em>why</em> that qualitative methods supply. Triangulating between methods avoids each's blind spots.

## 2.3 Representing Users

Personas synthesise research into archetypal user profiles with goals, behaviours, frustrations, and context. They guide design decisions by asking "what would this persona do?" Good personas are evidence-based, not demographic stereotypes. Scenarios — narrative descriptions of personas pursuing goals with a product — anchor design in concrete situations.

# Chapter 3: Information Architecture and Interaction

## 3.1 Mental Models

Users approach systems with mental models — often incomplete or flawed — built from prior experience and system feedback. Effective design aligns the system image (what the product communicates through its appearance and behaviour) with plausible mental models. Norman's affordances, signifiers, constraints, mappings, and feedback are the designer's vocabulary for shaping user models.

## 3.2 Information Architecture

Information architecture organises content so users can find, understand, and use it. Card sorting reveals users' categorisation; tree tests evaluate a proposed structure; navigation flows trace paths. Fitts's law predicts pointing time:

\[
MT = a + b \log_{2}\!\left(\frac{D}{W} + 1\right),
\]

where \( D \) is distance to target and \( W \) its width. Hick's law predicts decision time with number of choices:

\[
RT = a + b \log_{2}(n + 1).
\]

Good design respects these quantitative limits while retaining meaningful structure.

## 3.3 Interaction Design

Interaction design specifies how users and systems behave over time — input methods, feedback, transitions, errors. Gulfs of execution (translating intent into action) and evaluation (translating state into understanding) frame recurring interaction problems. Progressive disclosure, undo, and confirmation balance user freedom with safety.

<div class="example">
A mobile payment app might place frequent actions within thumb reach, provide immediate haptic confirmation, allow undo within 10 seconds, and escalate authentication only for high-value transactions — tuning interaction to match risk and frequency.
</div>

# Chapter 4: Prototyping for Usability

## 4.1 Fidelity Levels

Low-fidelity prototypes (paper sketches, whiteboard sketches, slide mock-ups) are cheap, fast, and invite exploratory critique. Medium-fidelity interactive prototypes (Figma, Sketch, Proto.io) capture interaction flow and visual style without real data. High-fidelity prototypes (close-to-final code) test real functionality. Matching fidelity to the question being asked — and to the stage of the project — prevents premature polish.

## 4.2 Wireframes and Visual Design

Wireframes specify layout, content hierarchy, and key interactions without visual styling. Visual design adds typography, colour, imagery, and motion. Style guides and design systems (Material, Apple HIG, custom libraries) codify design tokens and components, enabling consistency and speeding delivery.

## 4.3 Accessibility

Accessibility ensures people with disabilities can use a product. WCAG 2.1 organises guidelines under Perceivable, Operable, Understandable, Robust (POUR). Colour contrast, text alternatives, keyboard navigation, screen-reader compatibility, and captioning are foundational. Universal design extends benefits beyond target disabilities — curb cuts benefit strollers, captioning benefits loud environments.

# Chapter 5: Inspection and Analytical Evaluation

## 5.1 Heuristic Evaluation

Nielsen's ten heuristics — visibility of system status, match with real world, user control, consistency, error prevention, recognition over recall, flexibility and efficiency, aesthetic and minimalist design, error recovery, help and documentation — guide quick expert review. Three to five evaluators typically find most severe issues; each rates issues by frequency, impact, and persistence.

## 5.2 Cognitive Walkthrough

Cognitive walkthrough evaluates learnability by walking through a task step-by-step asking: will the user try the right action? will they see the control? will they associate it with their goal? will they recognise progress? Each "no" is a usability problem. The method particularly suits first-time user experiences.

## 5.3 GOMS and KLM

GOMS models task performance in terms of Goals, Operators, Methods, and Selection rules. The Keystroke-Level Model (KLM) estimates task time by summing operator times (keystroke, pointing, homing, mental, response). Though simple, KLM gives surprisingly useful quantitative comparisons between designs for expert performance.

<div class="remark">
Analytical methods complement user testing: they are fast and cheap but produce fewer insights about actual user behaviour. Combining inspection and testing is standard professional practice.
</div>

# Chapter 6: User Testing and Applied Statistics

## 6.1 Usability Testing Methodology

Moderated usability tests typically involve 5–12 participants performing representative tasks while thinking aloud. Moderators probe without leading, record observations, and stay alert for mental-model mismatches. Remote and unmoderated testing (via platforms like UserTesting, Maze) scale to larger samples but lose moderator interaction.

Test plans specify: research questions, participant criteria, scenarios, metrics (completion rate, time-on-task, error count, satisfaction), analysis approach, and deliverables. Ethical practice includes informed consent, privacy, voluntary participation, and fair compensation.

## 6.2 A/B and Multivariate Testing

A/B testing compares two variants randomised to live users and measures outcomes. Multivariate tests compare many variants simultaneously. Statistical analysis uses z-tests on conversion rates, t-tests on continuous metrics, and Bayesian bandit algorithms for dynamic allocation. Adequate sample sizes — driven by baseline rate, minimum detectable effect, and significance level — prevent over-interpretation of noise.

## 6.3 Statistical Analysis

Usability data often have non-normal distributions, missing observations, and small samples. Non-parametric tests (Wilcoxon, Mann-Whitney), bootstrap confidence intervals, and Bayesian methods handle these better than naive t-tests. Reporting should include effect sizes and confidence intervals, not only p-values. Replication across studies builds confidence that findings are robust.

## 6.4 From Evaluation to Design Decisions

Usability findings feed back into design via prioritisation: severity of issue, frequency of impact, cost to fix, strategic alignment. Development teams adopt design-sprint, continuous-discovery, or dual-track agile approaches to integrate research and implementation. Measuring UX over time — not just at launch — keeps products aligned with evolving user needs.

<div class="example">
A financial-services redesign team ran contextual interviews, built personas, iterated through paper and interactive prototypes with heuristic evaluations and five-user tests, and finally launched an A/B test on a 10% traffic split. Task completion rose 22%, errors dropped 40%, and NPS climbed 18 points — outcomes consistent across methods that individually would have been less convincing.
</div>

<div class="theorem">
User-centred design is a disciplined practice of understanding users deeply, designing iteratively at matched fidelity, evaluating analytically and empirically, and acting on findings — all supported by ethical research practice and sound applied statistics.
</div>

The methods taught in this course translate to any interactive artefact: software, hardware, services, and physical environments. Mastery equips systems design engineers to create products and services that people can and want to use.
