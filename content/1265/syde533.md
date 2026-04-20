---
title: "SYDE 533: Conflict Resolution"
subjects: "SYDE"
---

## Sources and References

- Fang, Hipel, Kilgour, <em>Interactive Decision Making: The Graph Model for Conflict Resolution</em> (Wiley)
- Kilgour and Eden (eds.), <em>Handbook of Group Decision and Negotiation</em> (Springer)
- Fisher, Ury, Patton, <em>Getting to Yes</em> (Penguin)
- Raiffa, <em>The Art and Science of Negotiation</em> (Belknap)
- Saaty, <em>The Analytic Hierarchy Process</em> (RWS Publications)

---

# Chapter 1: Multiple-Participant, Multiple-Objective Decisions

## 1.1 Nature of Conflict

Engineering decisions often involve multiple participants — customers, regulators, users, operators, communities — with partially conflicting objectives. Unlike a single-decision-maker optimisation, conflict problems exhibit interdependent choices: each participant's best move depends on anticipations of others. Tools from game theory, decision analysis, and multi-criteria analysis help structure such decisions.

## 1.2 Decision Frameworks

A conflict problem is characterised by: decision makers (DMs), options available to each, outcomes, and preference structures. Representations include normal (strategic) form game matrices, extensive-form game trees, coalition-function form, and graph models. Analysis asks which outcomes are stable, who has incentive to deviate, and how perceptions or misperceptions alter predictions.

<div class="definition">
An outcome is a <strong>Nash equilibrium</strong> if no decision maker can improve their position by unilaterally changing strategy, assuming others hold fixed.
</div>

# Chapter 2: The Graph Model for Conflict Resolution

## 2.1 States and Moves

The graph model represents a conflict as a finite set of states (feasible combinations of DM options), with directed edges showing unilateral moves available to each DM. Preference orderings over states — strict, indifferent, or partial — are assigned per DM. Stability concepts then identify which states no DM wishes to leave.

## 2.2 Stability Definitions

Several stability notions capture different levels of strategic foresight. <em>Nash stability</em> requires no unilateral improvement. <em>General metarationality (GMR)</em> holds if every unilateral improvement by DM \( i \) can be sanctioned by others. <em>Symmetric metarationality (SMR)</em> adds that DM \( i \) cannot counter the sanction. <em>Sequential stability (SEQ)</em> restricts sanctions to those improving for the sanctioning DM. Analysing each yields a richer picture of robustness.

## 2.3 Applications

Water diversion disputes, international arms negotiations, labour strikes, and environmental conflicts have been modelled and analysed with the graph model. The tool supports "what-if" exploration — how stability shifts as DMs gain new options or update preferences — informing strategy and mediation.

<div class="example">
In a two-party environmental conflict with options (Cooperate, Defect), classical prisoner's-dilemma payoffs yield (Defect, Defect) Nash-stable but Pareto-inferior; repeated interaction or third-party sanctions can make (Cooperate, Cooperate) SEQ-stable.
</div>

# Chapter 3: Game Theory

## 3.1 Normal-Form Games

Two-player zero-sum games admit a value and optimal mixed strategies via the minimax theorem. Non-zero-sum games — coordination, bargaining, prisoner's dilemma — may have multiple equilibria. Mixed-strategy equilibria exist in finite games (Nash's theorem) but may be difficult to interpret in one-shot contexts.

## 3.2 Metagame Analysis

Howard's metagame analysis extends simple game analysis by considering hierarchies of hypothetical responses — what each DM would do if they anticipated what others would do if they anticipated them in turn. This surfaces unexpected stabilities and reveals why apparently irrational threats can shape outcomes.

## 3.3 Misperceptions

Real-world participants often misperceive others' options or preferences. Hypergame analysis (Bennett) models misperception explicitly: each DM plays their own perceived game. Outcomes under misperception may differ dramatically from outcomes under common knowledge, and resolving conflict may require information exchange as much as trade-off.

# Chapter 4: Preferences and Evolution

## 4.1 Preference Elicitation

Preferences among states can be ordinal (ranking), cardinal (utility numbers), or partial (some pairs incomparable). Elicitation techniques include pairwise comparison, Analytic Hierarchy Process (AHP), swing-weight methods, and conjoint analysis. Each carries cognitive and statistical caveats; consistency checks (AHP's \( C I \)) identify incoherent weights.

## 4.2 Evolution of Conflict

Conflicts evolve through phases — escalation, stalemate, de-escalation, resolution, aftermath. Option changes, new DMs entering, or external events shift the graph model over time. Dynamic analysis tracks these shifts, informing timing of negotiation, mediation, or unilateral action.

<div class="remark">
Recognising the conflict phase matters: tactics effective in escalation (showing resolve, mobilising allies) may be counterproductive in de-escalation, where building trust and face-saving exits become central.
</div>

# Chapter 5: Human Behaviour, Uncertainty, and MCDA

## 5.1 Behavioural Factors

Humans deviate systematically from ideal rationality. Prospect theory (Kahneman-Tversky) describes loss aversion, probability weighting, and reference-dependent choices. Anchoring, framing, confirmation bias, and escalation of commitment shape individual and group decisions. Designing conflict-resolution processes must account for these tendencies rather than assume them away.

## 5.2 Uncertainty

Decisions under uncertainty apply expected utility, minimax regret, or robust criteria. When probabilities are themselves uncertain (deep uncertainty), robust decision-making and scenario planning generate strategies that perform adequately across many plausible futures. Sensitivity analysis identifies which uncertainties actually swing the decision and thus deserve research investment.

## 5.3 Multiple-Criteria Decision Analysis

MCDA formalises decisions with many objectives. Weighted-sum methods require commensurable criteria and explicit weights. Outranking methods (ELECTRE, PROMETHEE) work with ordinal and incomplete data. AHP pairs pairwise comparisons with consistency checks. Pareto analysis identifies non-dominated options without weighting.

Decision support systems integrate these methods with visualisation, what-if exploration, and collaboration, enabling groups to navigate complex decisions together. Transparency about method choice and assumptions matters more than methodological sophistication.

# Chapter 6: Negotiation, Coalitions, and Support

## 6.1 Negotiation Principles

Principled negotiation (Fisher, Ury) separates people from the problem, focuses on interests not positions, invents options for mutual gain, and uses objective criteria. Best Alternative To a Negotiated Agreement (BATNA) anchors each party's walk-away. Integrative bargaining seeks joint gains; distributive bargaining divides a fixed pie. Skilled negotiators typically blend both.

## 6.2 Coalition Analysis

When multiple DMs can form coalitions, game theory offers the core, Shapley value, and nucleolus as solution concepts. The Shapley value allocates surplus to a coalition member by averaging marginal contributions across all join orders; it is the unique allocation satisfying efficiency, symmetry, dummy, and additivity axioms. Coalition analysis informs alliance formation, revenue sharing, and political negotiation.

## 6.3 Group Decision Support

Group Decision and Negotiation Support Systems (GDSS) combine modelling, communication, and facilitation tools. Online platforms enable asynchronous, geographically distributed group decision-making. Design principles include anonymity where appropriate, structured argumentation, voting and aggregation rules, and conflict-mapping. Facilitators manage process — agenda, participation balance, conflict — while systems manage information flow.

<div class="example">
A transboundary water dispute might use a GDSS that combines hydrological simulation, graph-model stability analysis, MCDA with regional weighting, and online stakeholder deliberation to produce a negotiated allocation acceptable to upstream and downstream parties.
</div>

## 6.4 Real-World Applications

Applications include natural-resource management (water, fisheries, forests), urban planning and transportation, international relations and arms control, corporate strategy and mergers, and organisational labour relations. Systems engineers increasingly bring these analytical tools to multi-stakeholder decisions where engineering, ethics, economics, and politics intersect.

<div class="theorem">
Formal analysis of multi-participant decisions — stability concepts, game-theoretic solutions, preference elicitation, MCDA, negotiation — clarifies dynamics that intuition misreads, structures deliberation productively, and supports decisions that are both analytically defensible and politically feasible.
</div>

Mastery of conflict-resolution methods equips systems design engineers to mediate and manage decisions that intuition alone cannot resolve, bringing transparency and rigour to the collective choices that shape engineered systems and the societies they serve.
