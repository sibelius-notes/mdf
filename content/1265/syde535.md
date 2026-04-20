---
title: "SYDE 535: Computational Simulations for Societal and Environmental Systems"
subjects: "SYDE"
---

## Sources and References

- Sterman, <em>Business Dynamics: Systems Thinking and Modeling for a Complex World</em> (McGraw-Hill)
- Law, <em>Simulation Modeling and Analysis</em> (McGraw-Hill)
- Epstein, <em>Generative Social Science: Studies in Agent-Based Computational Modeling</em> (Princeton)
- Meadows, <em>Thinking in Systems</em> (Chelsea Green)
- Railsback and Grimm, <em>Agent-Based and Individual-Based Modeling</em> (Princeton)

---

# Chapter 1: Simulation as a Method

## 1.1 Why Simulate Complex Systems

Complex societal and environmental systems often resist closed-form analysis: they have many interacting parts, feedback loops, delays, heterogeneous agents, and emergent properties. Simulation lets analysts explore dynamics, test policies, and identify leverage points without field experiments that may be infeasible, unethical, or irreversible.

## 1.2 The Modelling Lifecycle

A simulation project cycles through: problem articulation, conceptual modelling, data collection, model formulation, verification and validation, experimentation, and communication. Each stage produces artefacts; each invites stakeholder review. The cycle is iterative — insights at later stages revise earlier assumptions.

<div class="definition">
A <strong>model</strong> is a purposeful simplification of reality. Its validity is judged not by faithfulness to every detail but by fitness for its intended use.
</div>

# Chapter 2: Conceptual Modelling and Data

## 2.1 Problem Articulation

Problem articulation states the question the model will answer, the time horizon, spatial scope, and scale of detail. A model built to evaluate a regional water allocation policy differs sharply from one exploring household consumption behaviour, even when both concern water.

## 2.2 Conceptual Model Development

Conceptual modelling externalises the analyst's mental model. Causal loop diagrams expose feedback; stock-and-flow diagrams formalise accumulation; agent-based conceptual maps specify actor types, behaviours, and interactions; network models identify nodes and links. Stakeholder workshops refine the conceptual model and surface disagreements about mechanisms.

## 2.3 Data Collection

Data underpin parameters, initial conditions, and validation targets. Sources include government statistics, field surveys, remote sensing, citizen science, administrative records, and literature synthesis. Each has strengths, biases, and access limitations. Data cleaning, outlier handling, missing-value imputation, and provenance tracking precede any serious modelling. Sensitivity analysis later reveals which data most affect conclusions.

# Chapter 3: Model Formulation

## 3.1 System Dynamics

System dynamics models represent stocks, flows, and feedback using ordinary differential equations:

\[
\frac{dS_i}{dt} = \sum_j F_{ji}(\mathbf{S}, \mathbf{p}, t) - \sum_j F_{ij}(\mathbf{S}, \mathbf{p}, t).
\]

Nonlinear flow functions capture saturation, thresholds, and delays. Simulation tools (Vensim, Stella, AnyLogic, Python packages) integrate the equations and produce time-series outputs. System dynamics suits problems where aggregate dynamics dominate and individual heterogeneity is secondary.

## 3.2 Discrete-Event Simulation

Discrete-event simulation (DES) models systems as sequences of events changing state at discrete instants — ideal for queuing, logistics, healthcare operations, and manufacturing. Components include entities, resources, queues, and events. Performance metrics (wait time, throughput, utilisation) aggregate across simulation runs.

## 3.3 Agent-Based Modelling

Agent-based models (ABM) represent autonomous agents with individual attributes and behavioural rules interacting on a landscape or network. Emergent patterns — segregation, market dynamics, disease spread, innovation diffusion — arise from local rules without being programmed in. ABM suits problems where heterogeneity, spatial context, and individual adaptation matter.

<div class="example">
Schelling's segregation model shows that even mild individual preferences (agents wanting just 30% same-type neighbours) produce highly segregated patterns — a counter-intuitive finding driven entirely by local-rule feedback.
</div>

## 3.4 Hybrid and Network Models

Hybrid models combine paradigms: SD plus ABM to link policies with behaviour; SD plus DES to link strategic and operational scales. Network models emphasise structure — topology shapes spread of infection, information, or cascading failure. Spatial explicit models on geographic grids couple with Geographic Information Systems (GIS) for land-use and hydrological applications.

# Chapter 4: Verification, Validation, and Uncertainty

## 4.1 Verification

Verification confirms the model implements the conceptual design — no coding errors, consistent units, correct equations. Techniques include unit checking, dimensional analysis, extreme-condition tests (setting parameters to zero or infinity), walkthrough of representative runs, and comparison to analytical solutions where available.

## 4.2 Validation

Validation evaluates whether the model represents the target system adequately for its purpose. Historical validation compares outputs to observed data (time series, spatial patterns). Structural validation examines whether mechanisms match understanding in domain literature and expert judgement. Face validity engages stakeholders in assessing plausibility. Cross-model comparison reveals consequences of assumption differences.

## 4.3 Uncertainty

Uncertainty in parameters, structure, and scenarios must be characterised. Global sensitivity analysis (Sobol, Morris) attributes output variance to inputs. Monte Carlo propagation yields output distributions. Scenario analysis combines bundles of assumptions for plausible futures. Deep uncertainty methods (RDM — robust decision making) seek strategies performing adequately across many futures when probabilities are themselves unknown.

<div class="remark">
"All models are wrong, but some are useful" (Box). The task is not to make a perfect model but to know which conclusions are robust to the model's wrongness.
</div>

# Chapter 5: Output Analysis and Experimentation

## 5.1 Experimental Design

Simulation experiments mirror physical experiments. Factorial designs explore combinations of policy levers and scenarios. Design of experiments identifies significant factors and interactions efficiently. Output analysis applies statistics for both terminating (finite) and steady-state (long-run average) metrics, addressing autocorrelation and warm-up bias.

## 5.2 Policy Testing

Policy testing compares intervention scenarios against a baseline. Metrics span efficiency, equity, sustainability, and resilience. Multi-criteria analysis makes trade-offs visible. Testing must include unintended consequences, behavioural feedback (e.g., Jevons paradox in energy policy), and robustness under uncertainty.

## 5.3 Optimisation and Search

When the policy space is parameterised, optimisation techniques — gradient search, evolutionary algorithms, Bayesian optimisation — find near-optimal interventions. Multi-objective optimisation yields Pareto frontiers rather than single best solutions, supporting negotiated decisions.

# Chapter 6: Communication, Ethics, and Applications

## 6.1 Communicating Results to Non-Expert Audiences

Models influence decisions only when decision-makers trust and understand them. Communication strategies include interactive visualisations, scenario narratives, sensitivity visualisations, and participatory-modelling workshops that co-build understanding. Honest communication includes what the model does not cover, where uncertainties bite, and which inputs most shape conclusions.

## 6.2 Ethics of Modelling

Models can legitimise decisions they did not truly support, reproduce biases in training data, or obscure whose interests they serve. Ethical modelling discloses assumptions, allows external replication, engages affected stakeholders, and resists pressure to produce convenient conclusions. Peer review and open data practices strengthen trust.

## 6.3 Societal Applications

Climate policy models (integrated assessment models like DICE, GCAM, MESSAGE) link economic, energy, and climate systems to evaluate mitigation pathways. Epidemic models shaped responses to COVID-19. Urban planning simulations inform transit investment, zoning, and housing policy. Fisheries and watershed management use simulations to align ecological sustainability with livelihoods.

<div class="example">
A regional water-allocation model combining hydrology, crop yields, groundwater depletion, and farmer decision rules can project how climate-adaptation subsidies alter long-term aquifer sustainability — revealing unintended intensification of extraction that policy framers did not anticipate.
</div>

## 6.4 Building a Modelling Practice

Students practise building models end-to-end: articulating a real problem, gathering data, formulating and coding the model, validating and experimenting, and presenting to non-expert audiences. Common pitfalls — over-parameterisation, confirmation bias, false precision — are exposed and remediated through peer review. Open-source tools (Python with Mesa, NetLogo, AnyLogic PLE, Vensim PLE) support hands-on work.

<div class="theorem">
Computational simulation provides a laboratory for complex societal and environmental systems, but its value depends on disciplined scope, honest validation, transparent uncertainty, and communication that respects both the audience's intelligence and the model's limits.
</div>

Graduates of the course carry a methodology — conceptual, computational, statistical, and communicative — that turns messy real-world problems into tractable models informing better decisions across environmental, social, and infrastructure domains.
