---
title: "SYDE 543: Cognitive Ergonomics"
prof: "Moojan Ghafurian"
subjects: "SYDE"
---

## Sources and References

- Wickens, C. D., Hollands, J. G., Banbury, S., & Parasuraman, R. *Engineering Psychology and Human Performance*.
- Proctor, R. W., & Van Zandt, T. *Human Factors in Simple and Complex Systems*.
- Kahneman, D. *Thinking, Fast and Slow*.
- Sanders, M. S., & McCormick, E. J. *Human Factors in Engineering and Design*.
- Endsley, M. R. *Designing for Situation Awareness: An Approach to User-Centered Design*.
- Ritter, F. E., Baxter, G. D., & Churchill, E. F. *Foundations for Designing User-Centered Systems*.
- Reason, J. *Human Error*.
- Norman, D. A. *The Design of Everyday Things*.
- MIT OpenCourseWare 16.400 Human Factors Engineering lecture notes.
- Stanford CS 147 Introduction to Human-Computer Interaction Design open materials.
- University of Cambridge Engineering Department human factors research reports.

---

# Chapter 1: Foundations of Cognitive Ergonomics and Human-Computer Interaction

Cognitive ergonomics is the subdiscipline of human factors that studies how mental processes such as perception, attention, memory, reasoning, and motor response interact with the information displays and devices that populate modern work environments. Whereas classical ergonomics grew from anthropometry and biomechanics, the cognitive branch emerged during the Second World War when radar operators, pilots, and gunners were found to make systematic errors that could not be explained by physical limitations alone. Post-war investigators such as Paul Fitts, Alphonse Chapanis, and Edmund Fitts's Ohio State group traced these failures to mismatches between the information presented by machines and the information processing capacities of human operators. Their findings seeded a research program whose central premise is that designs must be built around empirically verified limits of cognition rather than around intuitions about how people ought to behave.

The field treats the operator as a bounded information processing system. Inputs arrive through sensory channels, are filtered by attention, interpreted against knowledge stored in memory, used to form decisions, and converted into action. Each stage has finite capacity, specific error modes, and characteristic time constants. Designers who ignore any of these properties produce systems that work on the bench yet fail in the field. The discipline therefore combines laboratory experimentation with field analysis so that both basic mechanisms and the messy conditions under which they operate are considered.

Human-computer interaction is the applied arena in which cognitive ergonomics has had its largest public influence. Graphical interfaces, touch displays, voice agents, and mixed reality devices all translate system state into perceptual stimuli and user intent into commands. The quality of those translations determines whether people can accomplish goals quickly, accurately, and with acceptable effort. Core HCI principles such as visibility of system status, match between system and real world, consistency, error prevention, and recognition rather than recall are all direct expressions of cognitive constraints. Visibility maps onto the need for external cues because internal memory is volatile; consistency leverages the fact that transfer of learned responses is specific to the features that match the training context; recognition reduces load because picking from a set of displayed alternatives is far cheaper than generating them from nothing.

Two enduring distinctions shape the rest of the subject. The first is between data-limited and resource-limited tasks. Data-limited tasks fail because the signal itself is too weak or too ambiguous; no amount of extra effort recovers performance. Resource-limited tasks fail because the operator has insufficient attention, memory, or time, even though the signal is adequate. Identifying which regime dominates a given failure determines whether the remedy lies in improving the display or in restructuring the workload. The second distinction is between performance and preference. People can feel satisfied with interfaces that measurably slow them down and can feel frustrated by interfaces that make them more accurate. Good evaluation captures both and knows when they diverge.

# Chapter 2: Human Error

Error is the organizing concept for the second week of the course because almost every cognitive ergonomics intervention is justified by its effect on the frequency, detectability, or consequence of mistakes. James Reason's taxonomy divides errors into slips, lapses, and mistakes. Slips are execution failures in which the intended action is correct but the body produces the wrong output, as when a driver pushes the wiper stalk instead of the turn signal. Lapses are memory failures in which a step of an intention is simply omitted, such as leaving a card in an ATM after the cash has been collected. Mistakes are planning failures in which the action is executed faithfully but the underlying intention is wrong because the operator misunderstood the situation or applied an incorrect rule.

Reason's Swiss cheese model places individual errors within a layered organization whose defenses contain latent holes created by design decisions, training gaps, production pressure, and management culture. Accidents occur when active failures align with latent conditions through all the layers at once. The lesson for designers is that blaming the sharp-end operator is rarely productive; the same human was placed in a system whose holes eventually lined up. Investigations such as those at Three Mile Island, Bhopal, Chernobyl, the Herald of Free Enterprise, and more recently the Boeing 737 MAX MCAS incidents illustrate how design, procedure, and context jointly produce catastrophe.

A complementary framework distinguishes skill-based, rule-based, and knowledge-based behavior. Skill-based behavior runs on automatic sensorimotor routines and is fast and low-effort but vulnerable to capture by strong habits. Rule-based behavior applies stored condition-action rules and is efficient when the current situation resembles the training cases but fails when surface cues are misleading. Knowledge-based behavior is invoked when neither habit nor rule suffices; the operator must reason from first principles, which is slow, effortful, and error-prone. Effective interfaces try to keep the operator in the skill-based and rule-based regimes whenever routine conditions hold and to support the transition into knowledge-based reasoning when the situation demands it, by making causal relationships visible rather than hidden.

Error-tolerant design accepts that mistakes will occur and concentrates on making them recoverable. Undo operations, confirmation prompts for irreversible actions, forcing functions that prevent impossible states, and constraints that make only the correct action physically available are all examples. The goal is not to eliminate error but to reduce its cost.

# Chapter 3: Senses and Perception

The third week turns to the input side of the operator. Sensation is the raw transduction of physical energy into neural signals; perception is the interpretation of those signals into meaningful objects, events, and relationships. The visual system is the primary channel for most workplace displays and offers extraordinary bandwidth but severe non-uniformities. Acuity is high only within a narrow foveal window of roughly two degrees, falling off rapidly in the periphery, which means that any critical information must either be placed where the eyes are already looking or must attract the gaze through motion, color, or sudden onset. Color vision is mediated by three cone types whose overlapping sensitivities make certain hue combinations, notably red and green, ambiguous for roughly eight percent of males. Displays that encode status by color alone therefore exclude a measurable fraction of users and are discouraged.

Auditory perception is omnidirectional and well-suited to alerting because it does not require the operator to be already looking at the source. It degrades gracefully in cluttered environments thanks to binaural localization and the ability to segregate streams by pitch and timing. Designers exploit these properties with earcons, speech warnings, and spatialized audio in cockpit and control room applications. However, sound is transient and intrusive; a warning that cannot be reviewed forces reliance on memory, and a warning that cannot be silenced distracts the operator from the very problem it is meant to flag.

Gestalt principles codify how perception groups elements into wholes: proximity, similarity, common fate, closure, good continuation, and figure-ground segregation all predict which items will be perceived as belonging together. Interface designers apply these principles to create visual structure without explicit boundaries, reducing clutter while preserving readability.

Signal detection theory provides the quantitative backbone of perception research in the course. Any detection task can be framed as deciding whether a faint signal is present in noise, and every decision has four outcomes: hit, miss, false alarm, and correct rejection. Two independent quantities describe performance. Sensitivity, denoted \( d' \), measures how well the operator can distinguish signal-plus-noise from noise alone. The response criterion, denoted \( \beta \), describes how willing the operator is to say yes. Criterion is influenced by payoffs and prior probabilities, not by perceptual ability. The relationship is visualized by the receiver operating characteristic curve, and the optimal criterion for a rational observer follows

\[
\beta^* = \frac{P(N)}{P(S)} \cdot \frac{V(\text{CR}) + C(\text{FA})}{V(\text{H}) + C(\text{M})}.
\]

Understanding this separation prevents a common mistake in evaluation: a vigilance failure can reflect either a genuine drop in sensitivity or simply a cautious criterion, and the remedies differ.

# Chapter 4: Attention and Learning

Attention is the mechanism that selects what to process when the world offers more information than the cognitive system can handle. The course treats it in four complementary forms. Selective attention concerns how a single channel is chosen from several competitors; it is studied with dichotic listening and visual search paradigms and is guided by both bottom-up salience and top-down goals. Focused attention concerns how distraction is resisted once a channel is chosen. Divided attention concerns the simultaneous performance of two or more tasks and is the natural setting for studying interference. Sustained attention, or vigilance, concerns the maintenance of a fragile detection state over long monitoring periods and is the oldest problem in the field, going back to Mackworth's wartime clock test.

Wickens's Multiple Resource Theory organizes the interference literature. Resources are proposed along several dimensions including processing stage, perceptual modality, visual channel, and processing code. Tasks that share a cell compete strongly; tasks in different cells can often be performed concurrently with little cost. The theory explains why drivers can listen to a spoken route instruction while watching the road better than they can read a visual one, and why manual and verbal responses interfere less than two manual responses. It guides display and workload allocation decisions by predicting when two subtasks can share time and when they must be serialized.

Learning turns effortful knowledge-based behavior into efficient skill-based behavior. The power law of practice describes how response time decreases as a function of trials, approximately

\[
T_n = T_1 n^{-\alpha},
\]

with the exponent depending on task properties. Automaticity, in the sense of Shiffrin and Schneider, develops when consistent mappings between stimulus and response are practiced; with inconsistent mappings no amount of practice produces automaticity. Automatic processes are fast and place low demand on attention but are also rigid and prone to habit capture. Training interventions therefore need to balance speed, flexibility, and resistance to unusual conditions, and must consider how skills transfer or fail to transfer between the training context and the operational one.

# Chapter 5: Reaction, Control, and Emotion

Reaction time is the most heavily studied dependent variable in experimental psychology and carries direct design consequences. Simple reaction time to a single known signal is around 200 milliseconds; choice reaction time grows with the number of alternatives according to the Hick-Hyman law,

\[
RT = a + b \log_2(n + 1),
\]

which predicts that doubling the number of menu items adds a roughly constant cost rather than doubling time. Stimulus-response compatibility further modifies these numbers: when the spatial or semantic mapping between display and control matches user expectations, responses are faster and more accurate. A stove whose knobs are arranged in the same pattern as its burners produces fewer errors than one whose knobs lie in a row beside an unrelated burner arrangement.

Continuous control is described by Fitts's law, which states that the movement time required to hit a target of width \( W \) at distance \( A \) is

\[
MT = a + b \log_2\!\left(\frac{2A}{W}\right).
\]

The log term is called the index of difficulty and quantifies the fundamental speed-accuracy trade-off in aimed movement. Interface designers use Fitts's law to argue for placing frequent targets at screen edges, which are effectively infinitely wide because the pointer is clipped, and for making buttons large enough for the expected device and user population.

Emotion, once treated as external to human factors, is now understood to modulate perception, attention, and decision making in ways directly relevant to design. Positive affect broadens attention and encourages exploratory behavior; negative affect narrows attention and encourages vigilance. High arousal follows the Yerkes-Dodson inverted-U, improving performance on simple tasks up to a point and then degrading it, with complex tasks reaching their optimum at lower arousal levels. Stress, whether acute or chronic, preferentially harms knowledge-based reasoning while leaving overlearned skill-based responses relatively intact. Anxiety consumes working memory and tilts decision making toward immediate threat cues. Affective design considers these effects in both directions: systems should avoid needlessly elevating stress, and should recognize when operators are already stressed and reduce demands accordingly.

# Chapter 6: Empirical Evaluation and Research Methods

Cognitive ergonomics is an empirical field, and the course devotes a week to how valid evidence is produced. The foundational distinction is between internal validity, which is the confidence that observed differences are caused by the manipulation, and external validity, which is the confidence that results generalize beyond the conditions tested. True experiments with random assignment maximize internal validity; field studies and naturalistic observation maximize external validity. Most human factors questions require both, so research programs typically alternate between controlled laboratory experiments and contextual inquiries.

Variables are classified as independent, dependent, controlled, or confounding. Dependent measures include accuracy, response time, subjective workload via instruments such as the NASA Task Load Index, gaze behavior from eye tracking, physiological markers such as heart-rate variability and pupillometry, and error categories. Between-subjects designs assign each participant to one condition and avoid carryover but require more participants; within-subjects designs give each participant every condition, increase statistical power, and demand counterbalancing to control order and practice effects. Mixed designs combine both where appropriate.

Statistical analysis proceeds from descriptive summaries through inferential tests to effect-size estimation. The course emphasizes that statistical significance alone is insufficient: a reliably detected five-millisecond difference may be practically meaningless, while an unreliable 200-millisecond difference may still warrant design change pending replication. Power analysis guides sample size decisions before data are collected, and preregistration protects confirmatory claims from being contaminated by exploratory flexibility. Ethical review ensures that participants provide informed consent, that data are stored securely, and that deception, when used, is justified and debriefed.

Usability evaluation extends these methods into applied practice. Heuristic evaluation uses a small number of experts to rate an interface against principles such as Nielsen's ten heuristics. Cognitive walkthrough traces a representative user through a task and asks, at each step, whether the correct action is available, visible, and interpretable. Think-aloud protocols capture the reasoning of participants as they work. Each method surfaces different classes of problem, and combining them catches more than any single technique alone.

# Chapter 7: Mental Representation, Problem Solving, and Decision Making

After reading week, the course moves into higher cognition. Mental representations are the internal models that allow operators to reason about a system when it is not directly visible. A well-formed mental model is runnable, meaning the operator can simulate what the system will do under hypothetical inputs, and is consistent with the observable behavior of the real system. Mismatches between the designer's model, the system image projected by the interface, and the user's model are a recurring source of error. Don Norman's framing of this gulf is that the designer communicates with the user only through the system image, so every opacity in that image becomes a potential misconception.

Problem solving proceeds through problem representation, search through a space of candidate actions, and evaluation against goals. Newell and Simon's classical analysis characterizes experts as people who recognize familiar patterns and retrieve solutions directly rather than searching; novices lack those patterns and must search exhaustively. Design implications include making intermediate states salient so that learners can build the pattern library, and presenting information in forms that reveal structural rather than surface similarity to past cases.

Decision making is famously non-optimal. Kahneman and Tversky's research program identified a catalog of heuristics and biases: availability leads people to overestimate frequencies of recent or vivid events, representativeness leads them to neglect base rates, anchoring ties estimates to irrelevant starting values, and framing reverses preferences between mathematically identical gambles. Prospect theory formalizes the observation that losses loom larger than equivalent gains and that probability is distorted, with small probabilities overweighted and moderate probabilities underweighted. Kahneman's dual-process account, in which a fast associative System 1 generates impressions that a slower deliberative System 2 sometimes endorses and sometimes overrides, gives a common vocabulary for these findings.

Naturalistic decision making, associated with Klein's recognition-primed decision model, studies experts in fire grounds, emergency rooms, and military command. It finds that experts rarely compare alternatives; they recognize a situation and retrieve a plausible course of action, mentally simulating it to check for problems. This account is complementary rather than contradictory to the heuristics literature: both highlight the dominance of pattern recognition, but the naturalistic literature emphasizes when that pattern recognition succeeds because of genuine expertise, while the bias literature emphasizes when it fails because of superficial cues.

# Chapter 8: Memory, Mental Workload, and Situation Awareness

Memory is treated as three interacting subsystems. Sensory memory holds raw perceptual traces for fractions of a second. Working memory holds a handful of chunks for tens of seconds unless actively rehearsed, and is the bottleneck through which almost all deliberate cognition passes. Long-term memory is functionally unlimited but is accessed by cues and suffers retrieval failures when cues are weak or ambiguous. The classical estimate of working memory capacity is seven plus or minus two items, later revised toward four when rehearsal is prevented. Baddeley's model decomposes working memory into a phonological loop for verbal material, a visuospatial sketchpad for visual-spatial material, an episodic buffer for integrated episodes, and a central executive that coordinates them. Interfaces that demand simultaneous maintenance of verbal and visual information can therefore succeed where interfaces that overload a single subsystem fail.

Mental workload is the ratio of demand imposed by a task to the resources available. It is measured through primary task performance, secondary task techniques, subjective rating scales such as the NASA-TLX, and physiological indices. The relationship between workload and performance is non-monotonic: performance is poor under both underload, where attention wanders, and overload, where resources are exhausted. Automation is often introduced to reduce workload but can paradoxically increase it when it fails, because the operator must suddenly reconstruct a situation for which no ongoing mental picture was being maintained. The ironies of automation, as identified by Bainbridge, are still central to the modern debate about autonomous vehicles and clinical decision support.

Situation awareness, formalized by Endsley, is defined on three levels: perception of the elements in the current situation, comprehension of their meaning, and projection of their status into the near future. Loss of awareness at any level predicts errors, and the losses tend to cascade, because faulty perception undermines comprehension and faulty comprehension undermines projection. Designing for situation awareness means presenting information in a form that directly supports each level, highlighting changes, showing trends, and making the future state of automation explicit rather than buried in mode indicators. The concept has proved influential in aviation, air traffic control, military command, nuclear operations, and increasingly in driver interfaces for partially automated vehicles.

# Chapter 9: Case Studies and Synthesis

The final weeks of the course are devoted to student case studies that integrate the semester's material against real systems. Representative cases draw from aviation incidents where mode confusion and automation surprises played a role, from medical device interfaces whose labeling or alarm behavior contributed to patient harm, from consumer product recalls, and from accessibility design for diverse users. Each case is dissected by asking what stages of information processing were overloaded or misled, what defenses failed, which design remedies would plausibly reduce recurrence, and how the proposed remedies would themselves be evaluated before deployment.

The synthetic lesson of the course is that cognition is not a single faculty to be optimized but a federation of systems each with its own capacities, vulnerabilities, and time scales. Good design aligns the demands of a task with those capacities, provides external support where internal resources are thin, and builds in tolerance for the errors that will occur despite every precaution. The practitioner's toolkit therefore includes theoretical models for reasoning about what can go wrong, experimental methods for measuring how often it does, and design patterns for intervening effectively. When all three are deployed together, the result is a system that is not merely usable in the laboratory but reliable in the hands of real people doing real work under real constraints.
