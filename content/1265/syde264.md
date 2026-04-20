---
title: "SYDE 264: Needs Analysis and Prototyping"
subjects: "SYDE"
---

## Sources and References

- Dym, Little, Orwin, <em>Engineering Design: A Project-Based Introduction</em> (Wiley)
- Ulrich and Eppinger, <em>Product Design and Development</em> (McGraw-Hill)
- Buxton, <em>Sketching User Experiences</em> (Morgan Kaufmann)
- IDEO, <em>Human-Centered Design Toolkit</em>
- Otto and Wood, <em>Product Design: Techniques in Reverse Engineering and New Product Development</em>

---

# Chapter 1: The Design Situation

## 1.1 From Situation to Problem

A <em>situation of concern</em> is ambiguous — symptoms rather than a problem statement. Engineers reframe these situations by engaging with stakeholders, observing context, and proposing framings that direct inquiry without foreclosing solutions. "People fall on the stairs" can reframe to "ascending users cannot judge step location in low light," "descending users misjudge their footing on return from the kitchen," or "stairs interact with mobility aids" — each pointing to different opportunities.

## 1.2 Stakeholders

Stakeholders include direct users (primary), people served by or serving users (secondary), and third parties affected by the artefact's existence. Cleaners, maintainers, bystanders, regulators, and future occupants often matter. Stakeholder maps with power, interest, and influence axes inform engagement plans: whom to interview deeply, whom to survey broadly, whom to brief, whom to empower.

<div class="definition">
<strong>Needs analysis</strong> is the process of transforming a situation of concern into an evidence-based problem statement and prioritised set of requirements that will guide design work.
</div>

# Chapter 2: Methodology of Design

## 2.1 Classical Stages

Generic design methodology cycles through problem definition, requirements, concept generation, analysis and selection, embodiment, detailed design, verification, validation, and documentation. In real projects these stages overlap, feed back, and iterate. Milestones — stage gates, design reviews — pause the flow for critique and stakeholder alignment.

## 2.2 Iteration and Rigor

Iteration is not inefficiency; it is how uncertain problems are solved. Each loop should answer specific questions, producing new evidence that feeds the next. Rigor lies in what is tested, not how polished the artefact looks. A paper prototype that reveals a wrong assumption saves more cost than a polished prototype that confirms a familiar one.

# Chapter 3: Capturing Needs

## 3.1 Fieldwork Methods

Observation, contextual inquiry, shadowing, diary studies, and journey mapping reveal what users actually do. Interviews probe motivations and mental models. Focus groups surface shared vocabulary. Surveys scale inquiry when the questions and categories are already clear. Each method has strengths, biases, and ethical obligations (informed consent, confidentiality, compensation).

## 3.2 Translating Observations into Needs

Raw data — quotes, photos, artefacts — must be synthesised into needs. Affinity diagramming groups related observations; theming and coding surface patterns. A <em>need statement</em> captures what the user is trying to accomplish without prescribing a solution: "I need to know whether my parent has taken their medication" not "I need an app that reminds them."

Needs are prioritised by frequency, severity, and alignment with project scope. A weighted matrix with stakeholder input makes priorities explicit. The <em>Kano model</em> distinguishes basic, performance, and delight needs — noting that basic needs cause dissatisfaction when absent but little satisfaction when met, while delight needs punch above their weight.

# Chapter 4: Specifications and Concept Generation

## 4.1 Engineering Specifications

Needs translate to measurable engineering specifications. Each spec includes a metric, units, acceptable range, ideal target, and verification method. A crutch spec might read: "Mass: kg; target ≤ 0.8; ideal 0.6; verified by scale to ±0.01 kg." Specs must be verifiable; "user-friendly" is a poor spec unless operationalised into task time, error rate, or satisfaction score.

<div class="example">
A smart-home sensor might specify: operating temperature −20 to +50 °C (range), standby power &lt; 2 mW (ideal, upper acceptable 5 mW), wireless range 15 m indoors (ideal, minimum 8 m), lifetime 2 years on a CR2032 battery.
</div>

## 4.2 Ideation

Structured brainstorming, analogical thinking, SCAMPER, morphological analysis, biomimicry, and TRIZ generate concepts. Volume before judgment: rapid sketching with "yes, and" improvisation often yields more useful seeds than cautious single-concept development. Visual externalisation — sketches, storyboards, block diagrams, role-playing — invites critique and building.

## 4.3 Concept Selection

Pugh charts rank alternatives against a baseline along multiple criteria. Weighted decision matrices quantify trade-offs. Concept scoring adds weights and numerical scores. Pareto analysis identifies non-dominated concepts. Documenting assumptions and rationale ensures decisions can be revisited when evidence changes.

# Chapter 5: Prototyping

## 5.1 Prototype Types

Prototypes range in fidelity and focus. A <em>look-like</em> prototype conveys form without function; a <em>work-like</em> prototype demonstrates function without form; an <em>experience</em> prototype simulates interaction and emotion. Hybrid prototypes answer specific integration questions. Fidelity should match the question being asked — higher fidelity invites more committed feedback, lower fidelity invites more exploratory feedback.

## 5.2 Rapid Prototyping Technologies

3-D printing (FDM, SLA, SLS) produces geometrically complex parts within hours at modest cost. Laser cutting, CNC milling, and sheet-metal bending extend options for flat and prismatic parts. Breadboards and microcontrollers (Arduino, Raspberry Pi) prototype embedded systems; off-the-shelf sensors, actuators, and modules accelerate integration.

For electromechanical prototypes, basic machining literacy — drilling, tapping, turning, welding — remains invaluable. Design-for-manufacture principles at the prototype stage (tolerance allocation, snap fits, standard fasteners) ease later production.

## 5.3 Testing Prototypes

Test plans spell out what is tested, against which spec, under what conditions, with what instrumentation, and what counts as pass or fail. Repeat tests and statistical analysis guard against one-off results. Instrument thoughtfully: a single well-placed accelerometer or thermocouple often beats a forest of sensors producing noisy, unlabelled data. Test failures are information — log, diagnose, and iterate.

<div class="remark">
If a prototype succeeds on every test you planned, you either haven't tested enough or aren't pushing limits. Design tests that can fail.
</div>

# Chapter 6: Documentation, Teams, and Communication

## 6.1 Design Documentation

Documentation captures decisions, evidence, and rationale so that future engineers, users, and regulators can understand and revise the design. Requirement specifications, concept selection matrices, trade studies, test plans, test reports, CAD models, bills of materials, assembly instructions, user manuals, and safety analyses form the artefact around the artefact. Version control (Git, PLM systems) enables collaboration and traceability.

## 6.2 Team Dynamics

Design teams rarely fail for technical reasons alone. Role clarity, psychological safety, and shared leadership predict team success. Running meetings with agendas, decisions, and follow-ups reduces friction; team contracts at the start set expectations for communication, conflict resolution, and accountability. Retrospectives after each iteration surface what is working and what is not.

## 6.3 Presentations and Pitches

Design work culminates in communication: a pitch to funders, a design review with peers, a demo to users, a handoff to engineering or manufacturing. Clear narratives anchor on user, need, and insight before technology. Visuals — photographs of use, storyboards, block diagrams, graphs — carry more information than bullet lists. Rehearse, time, and tighten.

## 6.4 Integrated Design Project

Integrated design projects in small groups translate methodology into practice. Teams identify a situation of concern, conduct needs analysis with real stakeholders, write specifications, generate and select concepts, and build an electromechanical prototype. Hands-on experience with fabrication, integration, and test anchors theoretical design methodology in physical reality. Typical deliverables include a needs analysis report, specifications document, concept selection report, prototype, test report, final presentation, and reflective writeup.

<div class="theorem">
Design is the disciplined translation of a situation of concern into a prototype that embodies a defensible interpretation of user needs, tested against explicit specifications, and communicated through documentation sufficient to support future change.
</div>

By the end of the course, students wield a repeatable methodology — needs capture, specification, ideation, prototyping, testing — that applies to any subsequent design project, whether a biomedical device, a software product, or an ecosystem-scale infrastructure intervention.
