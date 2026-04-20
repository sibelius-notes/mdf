---
title: "SYDE 362: Design Testing, Validation, and Verification"
subjects: "SYDE"
---

## Sources and References

- Dym, Little, Orwin, <em>Engineering Design: A Project-Based Introduction</em> (Wiley)
- Montgomery, <em>Design and Analysis of Experiments</em> (Wiley)
- INCOSE, <em>Systems Engineering Handbook</em>
- Ulrich and Eppinger, <em>Product Design and Development</em> (McGraw-Hill)
- NIST Engineering Statistics Handbook (online)

---

# Chapter 1: Verification vs Validation

## 1.1 Definitions

<em>Verification</em> asks whether the system meets its specifications — "Did we build it right?" <em>Validation</em> asks whether the system solves the original problem — "Did we build the right thing?" Verification is largely internal and technical; validation is external and user-facing. Both are indispensable: perfect verification of wrong requirements yields a useless product, and creative validation without verification yields unreliable ones.

## 1.2 The V-Model

The V-model sequences design left-to-right with corresponding verification/validation activities right-to-left: requirements engineering pairs with acceptance testing; system design pairs with system testing; component design pairs with integration testing; detailed design pairs with unit testing. This explicit pairing ensures that every design decision has a test artefact and every test has a traceable parent requirement.

<div class="definition">
<strong>Traceability</strong> is the ability to link requirements, design artefacts, implementation elements, and test cases through the entire lifecycle; it enables impact analysis of changes and evidence of compliance.
</div>

# Chapter 2: Planning for Test and Evaluation

## 2.1 Test Plans

A good test plan states the object, the goal, the conditions, the test article, the procedure, instrumentation, pass/fail criteria, safety measures, and data-handling plan. Test plans are living documents revised as the design evolves. Approvals and version control maintain integrity.

## 2.2 Benchmark Testing

Benchmark testing evaluates a design against reference cases — either external benchmarks (industry standards, competitor products) or internal baselines (the previous version). Benchmarks provide context that absolute numbers lack. Well-chosen benchmarks make evaluation honest: if your new product wins only on cherry-picked cases, say so.

## 2.3 Verification Approaches

Verification draws on four approaches: analysis (mathematical proof, simulation), inspection (visual check against drawings), demonstration (behaviour observed without measurement), and test (controlled measurement). Standards (ASTM, ISO, IEC) prescribe methods for many common tests — tensile strength, fatigue life, electrical safety — enabling comparison across products and suppliers.

# Chapter 3: Statistics for Testing

## 3.1 Descriptive Statistics

Mean, median, standard deviation, range, and inter-quartile range summarise test data. Histograms reveal distributions; box plots expose outliers. Always reporting both centre and spread avoids the classical failure of averages hiding variability.

## 3.2 Inferential Statistics

Hypothesis tests compare observed data against null hypotheses. The t-test compares means; ANOVA compares multiple groups; chi-square tests categorical associations. Confidence intervals (usually 95%) communicate both the estimate and its uncertainty. A significant result with huge sample size may be practically trivial; report effect sizes alongside p-values.

## 3.3 Control Charts and Capability

Statistical process control monitors a process for deviation from its centreline using control limits set at \( \pm 3\sigma \) of short-term variation. Process capability indices \( C_p = (USL-LSL)/(6\sigma) \) and \( C_{pk} \) relate process spread to specification limits, guiding whether the process can meet design tolerances.

<div class="example">
A capacitor manufacturer with spec 100 nF ± 5% and measured \( \sigma = 1.2 \) nF has \( C_p = 10/(6\cdot1.2) = 1.39 \), acceptable but not comfortable. \( C_p = 1.67 \) is typically targeted.
</div>

# Chapter 4: Design of Experiments

## 4.1 Why DoE

Testing one variable at a time misses interactions and is inefficient. Factorial and fractional factorial designs evaluate multiple factors simultaneously, revealing interactions that one-factor experiments would miss. Response-surface methods tune continuous variables around promising operating points. Robust (Taguchi) methods minimise sensitivity to uncontrolled variation.

## 4.2 Full Factorial Design

A \( 2^{k} \) full factorial evaluates all combinations of \( k \) factors at two levels, enabling estimation of all main effects and interactions. For \( k = 3 \), eight runs yield estimates of three main effects, three two-factor interactions, and one three-factor interaction — a huge efficiency over three sequential one-at-a-time experiments.

## 4.3 Optimisation

Design optimisation formulates objectives, constraints, and design variables, then searches the space for a solution. Gradient-based (SQP, Newton), gradient-free (Nelder-Mead, CMA-ES), and global (genetic, particle swarm, Bayesian) methods apply to different problem shapes. Multi-objective optimisation (Pareto frontiers) exposes trade-offs for decision makers rather than collapsing them to a single score.

# Chapter 5: Validation in the Field

## 5.1 Performance Measurement

Performance measurement collects operational data under real use: time, accuracy, reliability, energy consumption, wear. Instrumentation should minimally disturb the system (Hawthorne effect) and capture enough data to reconstruct what happened. Data loggers, telemetry, and video are common tools. Privacy, consent, and data security considerations apply whenever human users are involved.

## 5.2 User Testing

Usability tests observe representative users performing representative tasks, recording completion, errors, time, and satisfaction. Think-aloud protocols reveal mental models. Five users typically identify about 85% of usability problems in a single iteration; iterating between tests and design changes compounds.

Field studies extend observation to real contexts over longer time. Diary studies, remote logging, and in-situ interviews gather information unavailable in labs.

<div class="remark">
A single successful demo does not validate a design; a design is validated when it works reliably for representative users in representative contexts, documented with quantitative and qualitative evidence.
</div>

## 5.3 Pilot and Beta Programmes

Pilot deployments expose the product to real users in controlled conditions. Beta releases scale this to larger populations, often with structured feedback channels. Metrics (activation, retention, crash-free rate, NPS) track product-market fit. Phased rollouts reduce risk by catching issues before full exposure.

# Chapter 6: Analytical Design Evaluation

## 6.1 Failure Modes and Effects Analysis

FMEA systematically inventories potential failure modes, their causes, effects, and controls, scoring severity, occurrence, and detection to yield a risk priority number (RPN). Actions address high-RPN items first. Design FMEA (DFMEA) focuses on product; Process FMEA (PFMEA) on manufacturing. Done early, FMEA prevents rather than diagnoses failures.

## 6.2 Fault Tree and Reliability Analysis

Fault-tree analysis (FTA) decomposes a top-level failure into combinations of lower-level events via AND/OR gates, quantifying probabilities. Reliability block diagrams model redundancy. Mean time between failures (MTBF), availability \( A = \mathrm{MTBF}/(\mathrm{MTBF}+\mathrm{MTTR}) \), and mission reliability \( R(t) = e^{-\lambda t} \) quantify product robustness.

## 6.3 Sensitivity and Robustness

Sensitivity analysis computes how performance depends on design parameters; robust design locates operating points where sensitivity is small. Monte Carlo simulation propagates parameter distributions through the design to yield output distributions, revealing risks that worst-case or nominal analyses miss.

## 6.4 Design Reviews and Reporting

Design reviews — preliminary, critical, and production — pause the project for structured critique by peers and stakeholders. Reviews catch blind spots, align decisions, and document evidence. Reports summarise approach, test data, analysis, and conclusions. Figures, uncertainty, and traceability to requirements turn reports into artefacts future engineers can trust.

<div class="example">
A team testing a safety-critical infusion pump combined DFMEA to identify single-point failures, sensitivity analysis to set operating margins, accelerated life testing to estimate MTBF, and usability testing with clinicians to validate interface clarity. The verified-and-validated pump entered pilot deployment with documented evidence supporting regulatory submission.
</div>

<div class="theorem">
A design is complete when it has been verified against specifications, validated against user needs, evaluated for risk and robustness, and documented with traceable evidence adequate for future scrutiny. Each of these four components is necessary; none is sufficient alone.
</div>

Mastery of V&V equips systems engineers to deliver products that not only work in the lab but also serve users reliably in the world — a non-trivial passage that statistical rigor, structured methods, and honest reporting make possible.
