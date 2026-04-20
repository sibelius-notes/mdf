---
title: "ENVE 335: Decision Making for Environmental Engineers"
subjects: "ENVE"
---

## Sources and References

**Primary texts** — Revelle, C. S., Whitlatch, E. E., and Wright, J. R., *Civil and Environmental Systems Engineering*; Hillier, F. S. and Lieberman, G. J., *Introduction to Operations Research*.

**Supplementary texts** — Ang, A. H.-S. and Tang, W. H., *Probability Concepts in Engineering*; Loucks, D. P. and van Beek, E., *Water Resource Systems Planning and Management*; Kroese, D. P., Taimre, T., and Botev, Z. I., *Handbook of Monte Carlo Methods*.

**Online resources** — MIT OpenCourseWare 1.204 *Computer Algorithms in Systems Engineering* and 15.053 *Optimization Methods in Management Science*; Stanford EE364A *Convex Optimization* open course; COIN-OR open-source optimization projects; scikit-learn, SciPy, and PuLP documentation; NIST/SEMATECH *Engineering Statistics Handbook*.

---

# Chapter 1: Decisions Under Uncertainty

Environmental engineering decisions — sizing a reservoir, siting a landfill, managing a contaminated site — are made with incomplete information about the future and about the system itself. Formal decision methods do not eliminate uncertainty; they make it explicit, enable comparison, and support defensible choices.

## 1.1 The Decision Process

A decision-analysis cycle identifies objectives, defines alternatives, characterizes uncertainties, models consequences, evaluates trade-offs, and monitors outcomes. Each phase demands both technical analysis and engagement with stakeholders whose values shape the objectives.

## 1.2 Objectives and Constraints

Objectives are things we want more (or less) of — cost minimization, emissions reduction, reliability. Constraints are limits we must respect — budget, regulations, technology. A well-posed decision problem states both cleanly. Value trees decompose objectives hierarchically; screening analyses rule out dominated alternatives early.

<div class="definition">
<strong>Dominance.</strong> Alternative A dominates B if A is at least as good as B on every objective and strictly better on at least one; dominated alternatives are discarded before evaluation.
</div>

# Chapter 2: Multi-Criteria Decision Making

## 2.1 Additive Value Functions

A common multi-attribute model scores each alternative \(j\) on criteria \(i\) and aggregates

\[
V_j = \sum_i w_i\, v_i(x_{ij})
\]

with weights \(w_i\) summing to one and value functions \(v_i\) mapping attribute levels to a common scale. Trade-off weights should be elicited against ranges of attribute levels, not in the abstract — a common mistake that biases results.

## 2.2 Structured Methods

The **Analytic Hierarchy Process** (AHP) builds weights from pairwise comparisons with a consistency check via the largest eigenvalue of the comparison matrix. **PROMETHEE** and **ELECTRE** handle qualitative preferences and thresholds. **TOPSIS** ranks by proximity to an ideal solution and distance from a negative-ideal solution.

## 2.3 Concept and Embodiment Design

In early **concept design**, decision methods screen diverse options with rough estimates. In later **embodiment design**, alternatives are fewer and detailed; criteria broaden to include constructability, maintenance, and life-cycle cost. Decision methods evolve accordingly — rough weighted matrices give way to cost–benefit analyses and LCA.

# Chapter 3: Probability and Uncertainty

## 3.1 Random Variables

An environmental variable \(X\) is modelled by a probability density function \(f_X(x)\) with moments

\[
\mu = \int x\,f_X(x)\,dx,\qquad \sigma^2 = \int (x-\mu)^2 f_X(x)\,dx
\]

Common distributions include normal (many natural variables, CLT), lognormal (concentrations), exponential (times between rare events), Poisson (counts), and extreme-value distributions (annual maxima).

## 3.2 First-Order Uncertainty Analysis

For \(Y = g(X_1, \dots, X_n)\), linearization around the means gives

\[
\mathrm{Var}[Y] \approx \sum_i \left(\frac{\partial g}{\partial X_i}\right)^2 \mathrm{Var}[X_i] + 2\sum_{i<j}\left(\frac{\partial g}{\partial X_i}\right)\left(\frac{\partial g}{\partial X_j}\right)\mathrm{Cov}[X_i, X_j]
\]

When inputs are uncorrelated and variations are small, the uncertainty budget is additive in variance, and dominant contributors can be identified and managed.

## 3.3 Monte Carlo Simulation

When nonlinearity matters, Monte Carlo draws samples from joint input distributions, evaluates the model, and empirically approximates the output distribution. The standard error of a mean scales as \(1/\sqrt{N}\). Latin hypercube sampling improves convergence; variance reduction techniques (importance sampling, control variates) can be powerful.

<div class="example">
<strong>Reliability of a detention basin.</strong> Let outlet discharge be <em>Q = C<sub>d</sub>A&radic;(2gh)</em> with normally distributed <em>C<sub>d</sub></em> and <em>A</em>, and a triangular distribution for <em>h</em>. Monte Carlo with 10,000 samples yields the distribution of <em>Q</em> under design storm, from which the probability of exceeding a downstream capacity is read directly.
</div>

# Chapter 4: Risk-Based Performance

## 4.1 Reliability, Availability, Resilience

**Reliability** is the probability that a system performs its function over a stated interval. **Availability** is the long-run fraction of time the system is up. **Resilience** adds the system's ability to recover from disruption, often captured in graceful-degradation metrics. Series, parallel, and \(k\)-out-of-\(n\) configurations are analysed by standard reliability block diagrams.

## 4.2 Performance Metrics

Risk-based metrics include probability of failure \(p_f\), expected annual damage, and conditional value at risk. The **reliability index**

\[
\beta = \frac{\mu_R - \mu_S}{\sqrt{\sigma_R^2 + \sigma_S^2}}
\]

(with resistance \(R\) and load \(S\) assumed normal and independent) is directly usable in design.

## 4.3 Trend Tests

Detecting trends in monitored data is central to environmental surveillance. The **Mann–Kendall** non-parametric test assesses monotonic trend without assuming a distribution; its statistic is

\[
S = \sum_{i<j}\mathrm{sgn}(x_j - x_i)
\]

with a known variance under the null of no trend. **Sen's slope** estimates the trend magnitude robustly. Serial correlation must be accounted for through effective sample size corrections.

# Chapter 5: Optimization

## 5.1 Linear Programming

A linear program has the canonical form

\[
\min\ \mathbf{c}^\top\mathbf{x}\quad\text{subject to}\quad A\mathbf{x} \le \mathbf{b},\ \mathbf{x}\ge \mathbf{0}
\]

Simplex and interior-point methods solve large LPs reliably. Classic applications include blending, transportation, and resource allocation. The **dual** yields shadow prices that quantify how much the optimum changes per unit relaxation of a constraint — invaluable information for the decision maker.

## 5.2 Integer and Mixed-Integer Programming

Many environmental problems require integer decisions (a facility is built or not). Mixed-integer programs use branch-and-bound and cutting-plane methods. Siting problems — landfills, pumping stations, monitoring networks — are typically MILPs.

## 5.3 Nonlinear Programming

Nonlinear objectives or constraints arise with reaction kinetics, diffusion, and economies of scale. Interior-point methods and sequential quadratic programming are standard. **Convex** problems are particularly tractable: any local optimum is global, strong duality holds, and efficient algorithms scale well. Disciplined convex programming frameworks (CVXPY) lower the barrier.

## 5.4 Heuristic and Metaheuristic Methods

For intractable combinatorial or highly nonlinear problems, heuristics — greedy, simulated annealing, genetic algorithms, particle swarm, tabu search — seek good solutions within a compute budget. They provide no optimality guarantees and require careful tuning.

# Chapter 6: Multi-Objective Optimization and Sensitivity

## 6.1 Pareto Frontiers

Multi-objective problems rarely have a single optimum. The **Pareto frontier** collects non-dominated alternatives; a decision maker selects along the frontier by articulating trade-offs. The weighted-sum and \(\varepsilon\)-constraint methods trace the frontier, but the weighted sum can miss non-convex regions.

## 6.2 Evolutionary Multi-Objective Algorithms

NSGA-II, SPEA2, and related evolutionary algorithms search the decision space in parallel, returning an approximate Pareto set. They accept black-box models and handle nonconvexity, but require evaluation budgets that can become large.

## 6.3 Sensitivity Analysis

**Local sensitivity** uses partial derivatives at the nominal point. **Global sensitivity** — variance-based methods such as Sobol indices — decomposes output variance into first-order and total effects of inputs:

\[
V(Y) = \sum_i V_i + \sum_{i<j} V_{ij} + \ldots
\]

with first-order Sobol index \(S_i = V_i/V(Y)\) and total-effect index \(S_{Ti}\) summing all contributions involving \(X_i\). These indices guide model reduction and data-collection priorities.

## 6.4 Descriptive Models and Decision Support

Decision analysis sits at the interface between descriptive models — hydrologic, hydraulic, atmospheric, biogeochemical — and normative choice. Coupling the two in **decision-support systems** enables scenario exploration, stakeholder deliberation, and adaptive management. The engineer's competence lies not only in solving the optimization but in structuring a problem that, when solved, gives a community defensible answers to the questions that actually matter.

<div class="remark">
<strong>Humility of models.</strong> Every decision model oversimplifies. The best practitioners test conclusions against sensitivity, stakeholder review, and real-world monitoring, and revise their models as evidence accrues. Decision analysis is an ongoing practice, not a one-off calculation.
</div>
