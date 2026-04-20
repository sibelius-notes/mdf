---
title: "SYDE 162: Human Factors in Design"
prof: "Robert Hunter, PhD"
subjects: "SYDE"
---

## Sources and References

- Lee, J.D., Wickens, C.D., Liu, Y., & Boyle, L.N. *Designing for People: An Introduction to Human Factors Engineering*, 3rd ed. CreateSpace. (Primary course text — "Lee" in chapter references)
- Casey, S. *Set Phasers on Stun: And Other True Tales of Design, Technology, and Human Error*. Aegean Publishing Company. (Case-study reader)
- Wickens, C.D., Hollands, J.G., Parasuraman, R., & Banbury, S. *Engineering Psychology and Human Performance*, 4th ed. Pearson.
- Salvendy, G. (Ed.) *Handbook of Human Factors and Ergonomics*, 4th ed. Wiley.
- Norman, D.A. *The Design of Everyday Things*, revised ed. Basic Books.
- Sanders, M.S., & McCormick, E.J. *Human Factors in Engineering and Design*, 7th ed. McGraw-Hill.
- MIT OpenCourseWare 16.400/16.453 Human Factors Engineering (reference framework).

---

# Chapter 1: Introduction to Human Factors Engineering

## 1.1 Discipline Overview

Human factors engineering (HFE) — sometimes called ergonomics, human factors, or engineering psychology — is the scientific discipline concerned with understanding how people interact with the elements of a system and with applying theory, data, and design principles to optimize human well-being and system performance. The field draws on experimental psychology, physiology, biomechanics, industrial engineering, and cognitive science to inform the design of tools, tasks, workplaces, and organizations.

A central premise is that systems must be designed *around* human capabilities and limitations rather than requiring people to adapt to arbitrary technical constraints. Norman's concept of human-centred design captures this orientation: the needs, goals, and cognitive properties of users should drive design decisions from the earliest stages of a project. When this orientation is reversed — when people must accommodate poorly designed artefacts — errors, accidents, inefficiency, and physical harm follow predictably.

## 1.2 Scope of Human Factors

HFE addresses three partially overlapping domains:

1. **Physical ergonomics** — biomechanics, anthropometrics, posture, repetitive motion, and the prevention of musculoskeletal disorders. Relevant wherever a human body interacts with tools, controls, or workspaces.
2. **Cognitive ergonomics** — perception, attention, memory, decision-making, mental workload, and situation awareness. Relevant in any task requiring information processing, such as process control, medical care, and interface design.
3. **Organizational and macroergonomics** — how teams, management structures, communication protocols, and sociotechnical systems affect safety and performance. Relevant to accident investigation, shift design, and enterprise-level system design.

These domains correspond to the three major clusters of topics in the course schedule: user research and hazard analysis (Weeks 1–6), cognitive and perceptual human capabilities (Weeks 4–8), and physical workplace design (Weeks 10–12).

## 1.3 Human-Machine Systems

A human-machine system is any configuration in which a person and a technological artefact work together to accomplish a goal. The human operator receives information through displays and sensory channels, processes that information cognitively, and acts on the world through controls that produce changes in the machine state. That changed state feeds back — through additional displays or direct environmental cues — to the operator. This closed-loop model, formalized by Sanders and McCormick, provides a unifying framework for analysing where breakdowns can occur and where design interventions can improve performance.

Key system properties include:

- **Reliability** — the probability that a component or subsystem performs its intended function under specified conditions.
- **Availability** — the proportion of time a system is in a functioning state, accounting for maintenance and repair.
- **Maintainability** — the ease with which a system can be restored after failure.
- **Safety** — the absence of conditions that could cause death, injury, illness, damage to property or environment, or loss of mission.

Human factors engineers contribute to all four by identifying where human capabilities and limitations interact with system demands.

---

# Chapter 2: User Research Methods

## 2.1 Analytical Frameworks

Before designing or redesigning a system, practitioners characterise users, tasks, and environments through a systematic requirements analysis. Lee and colleagues describe this as defining the *user population* (age, experience, anthropometry, cognitive characteristics), the *task set* (what the operator must do, how frequently, under what time pressure), and the *environment* (lighting, noise, vibration, thermal conditions, organizational context).

## 2.2 Interviews and Questionnaires

Interviews are structured or semi-structured conversations with users intended to surface mental models, task strategies, pain points, and latent needs. Key considerations:

- **Open-ended questions** elicit rich, unanticipated information; **closed questions** allow comparison across participants.
- **Probes** (e.g., "Can you tell me more about that?") deepen responses without leading.
- Cognitive interviewing techniques — think-aloud protocols, retrospective probing — are appropriate when the primary interest lies in mental representations rather than overt behaviour.

Questionnaires collect self-reported data at scale. Validated instruments such as the NASA Task Load Index (NASA-TLX) operationalize constructs like mental workload across six dimensions: mental demand, physical demand, temporal demand, performance, effort, and frustration. The System Usability Scale (SUS) provides a ten-item summated rating scale that yields a single composite usability score.

A recurrent limitation of self-report is the gap between declared behaviour and actual behaviour; observational methods complement questionnaire data to address this.

## 2.3 Contextual Inquiry

Contextual inquiry (CI) is a field research technique in which an observer accompanies a user through real work, asking questions as tasks unfold. Four core principles organize CI practice:

1. **Context** — observe work where and when it naturally occurs rather than in a laboratory.
2. **Partnership** — treat the user as the domain expert; the researcher's role is to understand, not to direct.
3. **Interpretation** — share interpretations with the user in real time to verify understanding.
4. **Focus** — attend to aspects of work relevant to the design goal rather than trying to observe everything.

CI data are synthesized into work models — affinity diagrams, flow models, sequence models, and artefact models — that reveal patterns across multiple users and inform design requirements.

## 2.4 Design Walkthroughs and Heuristic Evaluation

**Cognitive walkthrough** is an analytic usability inspection method in which evaluators simulate step-by-step user interaction with a prototype or an existing interface, asking at each step whether the user would know what to do and whether they would receive adequate feedback. Unlike user testing, walkthroughs require no participants; they are therefore inexpensive but limited by the evaluator's ability to model user cognition.

**Heuristic evaluation**, popularized by Nielsen, asks trained evaluators to compare an interface against a set of usability principles (heuristics), such as visibility of system status, match between system and the real world, user control and freedom, consistency and standards, error prevention, recognition rather than recall, flexibility and efficiency of use, aesthetic and minimalist design, help users recognize and recover from errors, and help and documentation. Violations of these heuristics predict usability problems with reasonable validity.

---

# Chapter 3: Human Error and Safety Analysis

## 3.1 Taxonomy of Human Error

Human error is not a root cause but a symptom of systemic conditions. Reason's influential taxonomy distinguishes three error types based on the level of cognitive processing involved:

- **Skill-based slips and lapses** occur during largely automated behaviours. A slip is an action not as intended; a lapse is a memory failure. Both arise from inattention or habit capture.
- **Rule-based mistakes** occur when a person selects an inappropriate rule for the situation, or applies a correct rule incorrectly. They reflect misdiagnosis rather than execution failure.
- **Knowledge-based mistakes** occur in novel situations where no practised rule applies. The operator must reason from first principles, often under time pressure and with incomplete information.

Violations — intentional departures from procedures — are a fourth category distinct from errors; they require different prevention strategies.

## 3.2 Fault Tree Analysis

Fault Tree Analysis (FTA) is a top-down, deductive technique for identifying the combinations of events that could lead to a specified undesired outcome (the *top event*). The fault tree is a logical diagram constructed using AND-gates (all inputs must be present for the output to occur) and OR-gates (any single input is sufficient).

The probability of the top event can be computed when component failure probabilities are known. For an AND-gate with independent events A and B:

\[
P(\text{top}) = P(A) \times P(B)
\]

For an OR-gate:

\[
P(\text{top}) = 1 - (1 - P(A))(1 - P(B))
\]

FTA identifies minimum cut sets — the smallest combinations of basic events whose simultaneous occurrence causes the top event — which pinpoint the most critical failure paths. The method is widely used in aerospace, nuclear, and process industries.

## 3.3 AcciMap

AcciMap, developed by Rasmussen, provides a multi-level systemic representation of accidents. Unlike FTA, which traces failures within a technical system, AcciMap situates an incident within its broader sociotechnical context. The map spans six levels:

1. Government policy and budgeting
2. Regulatory bodies and associations
3. Company management
4. Technical and operational management
5. Physical processes and actor activities
6. Equipment and surroundings

Causal factors at each level are connected by arrows indicating influence. This representation reveals how high-level policy decisions and organizational pressures create the conditions in which front-line operators commit errors — a key insight from the Bhopal disaster and other complex accidents analysed in the Casey case-study reader.

## 3.4 System Resilience and Macroergonomics

Resilience engineering shifts attention from error elimination to the capacity of sociotechnical systems to absorb disturbance, adapt to change, and recover from failures. Hollnagel and colleagues identify four resilience abilities: *anticipate* (know what to expect), *monitor* (know what to look for), *respond* (know what to do), and *learn* (know what has happened).

Macroergonomics addresses how organizational design, work system structure, and management practices shape human performance and safety. Hendrick and Kleiner characterize macroergonomics as the top-down sociotechnical systems approach to work system design, concerned with fitting the organizational and technological subsystems to human physical, cognitive, and psychosocial characteristics at the organizational rather than individual workstation level.

---

# Chapter 4: Human Perception, Cognition, and Performance

## 4.1 Sensation and Perception

The human sensory system is selective, constructive, and context-dependent. *Absolute threshold* is the minimum stimulus energy detectable 50 % of the time under ideal conditions; *difference threshold* (just noticeable difference, JND) is the smallest detectable change in a stimulus. Weber's Law states that JND is a constant fraction of the reference stimulus magnitude:

\[
\Delta I = k \cdot I
\]

where \( \Delta I \) is the JND, \( I \) is the reference intensity, and \( k \) is the Weber fraction, which varies by sensory modality.

**Vision** is the primary sense in most human-machine interfaces. Visual acuity, contrast sensitivity, colour discrimination, depth perception, and peripheral sensitivity all constrain display design. The fovea provides high-acuity colour vision in the central \( 2° \) of the visual field; acuity falls sharply toward the periphery, which is nonetheless highly sensitive to motion — an evolutionary feature exploited in warning signal design.

**Audition** is particularly valuable for alarms and warnings. Auditory attention is distributed spatially; humans can monitor multiple audio streams and detect signals that vision would miss. Masking by ambient noise is a key design constraint; signal-to-noise ratios and frequency selection are critical parameters.

## 4.2 Attention and Workload

Attention is a finite cognitive resource allocated across tasks. Wickens' multiple-resource theory proposes that performance decrements arise from competition for shared resources organized along three dimensions:

1. Processing stage — perceptual/cognitive versus response processing
2. Processing code — verbal versus spatial
3. Modality — visual versus auditory input; manual versus vocal output

Time-sharing between two tasks that draw on *different* resources incurs less interference than between tasks drawing on the *same* resource. This principle guides multimodal interface design: pairing visual displays with auditory warnings, for example, reduces resource competition.

**Mental workload** is the cost imposed by a task on the cognitive system. High workload degrades performance; very low workload can also impair vigilance and situation awareness. The inverted-U relationship between arousal and performance — the Yerkes-Dodson law — describes this non-linear relationship. Workload assessment methods include subjective rating scales (NASA-TLX), physiological measures (heart rate variability, pupillometry), and performance-based secondary task measures.

## 4.3 Memory

Human memory is organized into interacting systems with distinct properties:

- **Sensory memory** retains high-fidelity but brief representations of sensory input — iconic (visual) stores last approximately 250–500 ms; echoic (auditory) stores persist 3–5 seconds.
- **Working memory** (short-term memory) holds a limited number of items — approximately \( 7 \pm 2 \) chunks (Miller, 1956) — in an active, accessible state for seconds to minutes. The phonological loop, visuospatial sketchpad, and episodic buffer are subsystems coordinated by a central executive.
- **Long-term memory** has effectively unlimited capacity and duration but is susceptible to interference, retrieval failure, and constructive distortion.

Design implications: interfaces should minimize the number of items held simultaneously in working memory (minimizing load), encode information in chunked or hierarchical formats, and support recognition over recall — a direct embodiment of Norman's affordance principle.

## 4.4 Decision Making

Naturalistic decision making (NDM) research, pioneered by Klein, describes how experienced practitioners make decisions in real operational settings. Rather than exhaustively comparing options, experts engage in *recognition-primed decision making* (RPD): a situation is recognized as belonging to a familiar category, which automatically suggests a plausible course of action. This is rapidly mentally simulated; if acceptable, it is executed without further comparison.

Biases systematically distort judgment. *Confirmation bias* leads operators to favour information confirming an initial hypothesis and discount disconfirming evidence. *Anchoring* causes estimates to remain close to an arbitrary starting value. *Automation bias* — an over-reliance on automated systems even when their outputs are erroneous — is especially relevant in supervisory control contexts (see Chapter 8).

## 4.5 Signal Detection Theory

Signal detection theory (SDT) separates *sensitivity* — the ability to discriminate signal from noise — from *bias* — the decision criterion an observer adopts. A signal trial produces an observation sampled from a distribution centred at \( \mu_S \); a noise trial produces an observation from a distribution centred at \( \mu_N \). Assuming equal variance normal distributions, sensitivity is measured by:

\[
d' = \frac{\mu_S - \mu_N}{\sigma}
\]

A higher \( d' \) indicates greater discriminability. The criterion \( \beta \) (or its log, \( \ln \beta \)) determines the hit rate and false alarm rate independently of sensitivity. Lowering the criterion increases hits but also increases false alarms; raising it produces the opposite trade-off. SDT is foundational in medical imaging, aviation alerting, baggage screening, and any detection task with meaningful consequences for misses and false alarms.

## 4.6 Stress and Fatigue

Stress is a state arising when perceived demands exceed perceived resources. At moderate levels, stress narrows attention to task-relevant cues — sometimes helpfully, sometimes with tunnel vision effects that cause important peripheral signals to be missed. Prolonged or severe stress degrades working memory capacity, disrupts systematic decision-making, and increases error rates.

Fatigue is the progressive decline in performance that accompanies sustained task engagement. Sleep loss produces cumulative performance decrements that are both predictable and underestimated by affected individuals. The two-process model of sleep regulation (Borbely) combines a homeostatic Process S — a sleep debt that accumulates during waking and dissipates during sleep — with a circadian Process C that modulates alertness across the 24-hour cycle. Shift workers whose schedules misalign with Process C are at substantially elevated risk of performance failures and accidents.

---

# Chapter 5: Task Analysis and Interface Design

## 5.1 Hierarchical Task Analysis

Hierarchical Task Analysis (HTA), developed by Annett and Duncan, decomposes a goal into subgoals and operations recursively, specifying plans that govern when subgoals are activated. The output is a hierarchical diagram (or table) in which each node represents an action and each plan specifies the ordering and conditions of sub-actions. HTA:

- Identifies the cognitive and physical demands of a task
- Reveals where errors are likely (high-demand or complex sequential tasks)
- Informs training curriculum design, procedure writing, and interface allocation
- Supports staffing and workload modelling

The stopping rule (*p × c* criterion) determines how far decomposition proceeds: further analysis is warranted only when the product of probability of failure (p) and cost of failure (c) exceeds a threshold.

## 5.2 UX/UI Design and Wireframing

User experience (UX) design applies human factors principles to digital interactive systems. The design process moves from requirements (personas, scenarios, task models) through conceptual design (information architecture, interaction paradigms) to detailed design (wireframes, prototypes) and evaluation.

**Wireframes** are low-fidelity skeletal layouts that communicate structure, hierarchy, and navigation without committing to visual style. They facilitate early stakeholder feedback and parallel design exploration at low cost. Progression through low-fidelity paper prototypes, medium-fidelity digital wireframes, and high-fidelity interactive mockups mirrors the iterative design cycle described by Norman.

Usability encompasses five quality components (Nielsen): learnability, efficiency, memorability, error rate, and satisfaction. These map onto measurable test metrics: time-on-task, error count, satisfaction questionnaire scores, and retention after periods of non-use.

---

# Chapter 6: Automation in Human-Machine Systems

## 6.1 Levels of Automation

Automation replaces human action across a spectrum from full manual control to fully autonomous operation. Parasuraman, Sheridan, and Wickens propose a ten-level taxonomy from "the computer offers no assistance; human does everything" to "the computer acts autonomously and ignores the human." Intermediate levels include providing decision support, narrowing option sets, executing selected options after human approval, and reporting actions after the fact.

The level of automation (LOA) is not a monolithic system property but can vary independently across four functional stages:

1. Information acquisition
2. Information analysis
3. Decision and action selection
4. Action implementation

An optimally designed system allocates each stage to the human or automation based on comparative advantage, preserving meaningful operator involvement where human judgment adds value while automating routine, high-speed, or error-prone functions.

## 6.2 Consequences of Automation

Automation confers substantial performance benefits in accuracy, speed, consistency, and the ability to monitor multiple parameters simultaneously. However, it introduces characteristic failure modes:

- **Out-of-the-loop unfamiliarity**: when operators passively monitor automated systems, they lose situation awareness and skill currency, reducing their ability to intervene when automation fails.
- **Automation bias**: operators over-trust automated recommendations, accepting them even when independent evidence suggests an error.
- **Mode confusion**: complex automation with multiple operating modes can be opaque; operators misrepresent the active mode and issue commands with unexpected consequences (a factor in several fatal aviation accidents).
- **Complacency**: sustained correct performance by automation lowers the vigilance operators devote to monitoring, degrading detection of automation failures.

Mitigation strategies include adaptive automation (dynamically adjusting LOA in response to measured operator workload), interface designs that maintain mode transparency, and training programmes that preserve manual skills.

---

# Chapter 7: Physical Ergonomics

## 7.1 Anthropometrics

Anthropometry is the scientific measurement and analysis of human body dimensions. Data are collected on static dimensions (body segment lengths, breadths, depths, circumferences in standardized postures) and dynamic/functional dimensions (reach envelopes, strength in various postures). Measures are reported as population percentiles — conventionally the 5th, 50th, and 95th percentile for a specified population — rather than means alone, because variation is the design challenge.

Design strategies for accommodating anthropometric variation include:

- **Design for extremes**: dimension-critical features (clearances, minimum reach distances) are designed for the 5th or 95th percentile, as appropriate — this accommodates the full user population.
- **Design for the mean**: appropriate only when inter-individual variation has negligible consequences.
- **Design for adjustability**: range of adjustment is set to span from approximately the 5th percentile female to the 95th percentile male of the target population.

Mismatch between body dimensions and workspace geometry is a primary cause of musculoskeletal discomfort and injury. Relevant population databases — ANSUR, CAESAR — provide multi-ethnic percentile data.

## 7.2 Visual and Auditory Environment

**Illumination** affects visual task performance through luminance, contrast, glare, and colour rendering. The illuminance required (measured in lux) depends on task visual demands, object size, and contrast. Veiling reflections and disability glare reduce effective contrast; indirect lighting and surface matte finishes mitigate these effects.

**Noise** impairs speech intelligibility, masks auditory warnings, and under sustained exposure, causes noise-induced hearing loss (NIHL). The equivalent continuous sound level \( L_{eq} \) integrates variable noise exposure over time. Permissible exposure limits (PELs) in most jurisdictions follow a 5-dB trading relationship: each 5-dB increase in level halves the permissible exposure duration. The Speech Interference Level (SIL) predicts the maximum communication distance at a given ambient noise level, providing a design target for workspaces requiring verbal communication.

## 7.3 Biomechanics

Biomechanics applies mechanics to the analysis of human movement and loading. Static biomechanical models analyse equilibrium conditions at joints under applied loads. For a planar task involving the lower back (L4/L5 disc), the moment equilibrium equation gives the erector spinae muscle force \( F_M \) required to maintain a bent posture while holding a load:

\[
F_M \cdot d_M = W_{load} \cdot d_{load} + W_{trunk} \cdot d_{trunk}
\]

where \( d_M \) is the moment arm of the erector spinae and \( d_{load} \), \( d_{trunk} \) are moment arms of external and body-segment loads about the lumbar fulcrum. Compressive loading on the disc — the sum of erector spinae force, load weight, and trunk weight components — is compared against disc compressive strength limits (approximately 3,400 N for NIOSH action limit, 6,400 N for maximum permissible limit) to assess injury risk.

The revised NIOSH lifting equation provides a recommended weight limit (RWL) for manual lifting tasks:

\[
RWL = LC \times HM \times VM \times DM \times AM \times FM \times CM
\]

where LC is the load constant (23 kg) and the multipliers account for horizontal distance (HM), vertical height (VM), travel distance (DM), asymmetry angle (AM), frequency (FM), and coupling quality (CM). The lifting index LI = (actual load) / RWL; values above 1 indicate increased injury risk.

## 7.4 Work Physiology and Physical Demands

Work physiology quantifies the metabolic cost of physical labour. Oxygen consumption (\( \dot{V}O_2 \)) is the gold-standard measure of aerobic metabolic rate. Energy expenditure is commonly estimated from heart rate using individual calibration equations, since the heart rate–oxygen consumption relationship is approximately linear within the aerobic working range.

Prolonged work at high metabolic rates depletes glycogen stores and produces local muscle fatigue. Ergonomic design manages physiological demands through work-rest scheduling, mechanical aids and power assistance, job rotation (varying muscle groups and postural demands), and task redesign. The metabolic capacity varies substantially with age, sex, fitness, and acclimatization; population-representative physiological data are essential for workload specification.

---

# Chapter 8: Controls, Displays, and Workplace Layout

## 8.1 Display Design Principles

Displays convey system state to operators through visual, auditory, or tactile channels. Effective display design follows from the mental model an operator must maintain and the decisions the display must support.

Key principles (from Lee, Wickens et al. and Salvendy):

- **Pictorial realism**: the display format should correspond to the operator's mental model of the variable — analog gauges for continuous rates, icons for discrete states.
- **Moving part principle**: the moving element of a display should correspond to the moving element as conceptualized — a rising temperature is shown by a rising indicator, not a falling one.
- **Integration**: when a decision requires multiple variables, integrate them into a single configural display (e.g., a polygon display that changes shape with parameter changes) rather than separate analogue gauges.
- **Compatibility**: coding dimensions (colour, shape, position) should be consistent with natural mappings and population stereotypes.

Alarm rationalization addresses alarm floods — periods during which hundreds of alarms fire simultaneously, overloading operator attention and obscuring the most safety-critical signals. Best practice limits steady-state alarm rates, prioritizes alarms by consequence, and suppresses alarms that are predictable consequences of a known disturbance.

## 8.2 Control Design Principles

Controls transmit operator intent to the system. Design considerations include:

- **Control-display (C/D) ratio**: the ratio of control movement to display movement. High C/D ratios produce fine control but slow gross movements; low ratios allow rapid coarse positioning but hinder fine adjustment. An intermediate value minimizes total movement time (Fitts' Law).
- **Fitts' Law**: the time \( T \) to move to a target of width \( W \) at distance \( D \) is:

\[
T = a + b \log_2\!\left(\frac{2D}{W}\right)
\]

The term \( \log_2(2D/W) \) is the Index of Difficulty (ID, bits). Fitts' Law applies to pointing tasks across devices (mouse, touchscreen, physical control) and informs minimum target size specifications in interface design.

- **Stereotypes**: population expectations for control-response relationships (e.g., clockwise rotation increases a setting in most Western populations) must be respected to prevent confusion under stress.
- **Prevention of accidental activation**: guards, recessed controls, or sequential action requirements prevent inadvertent operation of high-consequence controls.

## 8.3 Workplace Layout

Optimal layout places frequently used and safety-critical controls and displays within the operator's primary visual zone and comfortable reach envelope. The *importance-frequency* principle ranks items by the product of use frequency and criticality, placing highest-ranked items in primary zones. The *functional grouping* principle arranges items in operationally related clusters.

Eye-height, reach radius, and visual angle constraints derived from anthropometric data define primary, secondary, and tertiary zones. For seated console operators, the primary visual zone spans approximately ±15° horizontally and 0–35° below horizontal from the sightline; the primary reach zone is bounded by the forward reach of the 5th-percentile female operator.

---

# Chapter 9: Research Ethics in Human Factors

## 9.1 Ethical Framework

Human factors research involves human participants — observing their behaviour, measuring their physiological responses, and evaluating their errors. This creates obligations to protect participant welfare, dignity, and autonomy.

The Tri-Council Policy Statement (TCPS2) is the governing framework for ethical conduct of research with humans in Canada. Core principles include:

- **Respect for persons**: recognition of autonomy and protection of those with developing, diminished, or fluctuating autonomy. Operationalized through *free, prior, and informed consent*.
- **Concern for welfare**: assessment and minimization of risks, maximization of potential benefits, and consideration of impacts on privacy, economic security, and social standing.
- **Justice**: fair distribution of benefits and burdens of research, including equitable inclusion criteria and avoidance of exploitation of vulnerable populations.

Research ethics boards (REBs) review studies involving human participants to ensure these principles are upheld before data collection begins.

## 9.2 Ethical Issues in Applied HFE

Specific issues arising in human factors studies:

- **Deception**: some protocols require withholding the study's true purpose (e.g., inattention studies). TCPS2 permits limited deception if the research cannot be conducted otherwise and if a full debriefing is provided.
- **Vulnerable populations**: older adults, persons with disabilities, employees of sponsoring organizations, and emergency responders may have constrained voluntariness that requires enhanced consent procedures.
- **Workplace surveillance**: use of wearable sensors, eye-tracking, or video recording in occupational settings raises privacy concerns and requires explicit consent, data minimization, and access controls.
- **Risk of harm from experimental conditions**: inducing fatigue, stress, or time pressure to study their effects requires safeguards and monitoring protocols.

---

# Chapter 10: Integrative Themes and System Design

## 10.1 The Systems Approach

Complex accidents — Three Mile Island, Chernobyl, the Bhopal gas disaster, the Therac-25 radiation therapy fatalities — share a common structure: no single failure caused the incident; rather, multiple latent conditions (Reason's "resident pathogens") combined with triggering events to produce catastrophe. This pattern motivates the systems approach, which traces causal chains through technical, human, and organizational levels rather than attributing accidents to "pilot error" or "operator negligence."

From a design standpoint, the systems approach mandates defence-in-depth: multiple independent barriers between hazards and unacceptable consequences, so that no single failure — human or technical — propagates to disaster.

## 10.2 Iterative Human-Centred Design Process

The human-centred design cycle prescribed by ISO 9241-210 consists of four activities organized around understanding and specifying the context of use, specifying user requirements, producing design solutions, and evaluating designs against requirements. Iteration is intrinsic: evaluation invariably reveals unmet requirements or new problems that feed back into redesign.

Fidelity of evaluation should match the stage of development. Early-stage contextual inquiry and expert walkthroughs identify fundamental conceptual flaws at low cost. Mid-stage formative usability tests with representative participants reveal interaction problems in evolving prototypes. Late-stage summative evaluations benchmark the completed design against quantitative performance criteria.

## 10.3 Critique and Redesign

Applied HFE regularly involves diagnosing existing systems and recommending improvements. A structured approach:

1. **Describe the system** — task, user population, environment, organizational context.
2. **Identify mismatches** — where system demands exceed human capabilities, where affordances are misleading, where feedback is absent or ambiguous.
3. **Classify contributing factors** — applying frameworks such as the Rasmussen skills-rules-knowledge taxonomy, HFACS (Human Factors Analysis and Classification System), or AcciMap.
4. **Generate redesign options** — ranked by effectiveness (engineering controls before administrative controls before personal protective equipment, following the hierarchy of controls).
5. **Evaluate trade-offs** — cost, feasibility, impact on other system properties, potential for introducing new failure modes.

This cycle connects the analytical methods introduced across the course — user research, hazard analysis, cognitive modelling, physical ergonomics — into a coherent design practice.
