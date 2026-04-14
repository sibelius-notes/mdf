---
title: "CIVE 332: Civil Systems and Project Management"
prof: "Nadine Ibrahim"
subjects: "CIVE"
---

## Sources and References

- Hendrickson, C. *Project Management for Construction: Fundamental Concepts for Owners, Engineers, Architects and Builders*.
- Halpin, D. W., & Senior, B. A. *Construction Management*.
- Peurifoy, R. L., Schexnayder, C. J., & Shapira, A. *Construction Planning, Equipment, and Methods*.
- Oberlender, G. D. *Project Management for Engineering and Construction*.
- Project Management Institute. *A Guide to the Project Management Body of Knowledge (PMBOK Guide)*.
- Hillier, F. S., & Lieberman, G. J. *Introduction to Operations Research*.
- Winston, W. L. *Operations Research: Applications and Algorithms*.
- Raiffa, H., & Schlaifer, R. *Applied Statistical Decision Theory*.
- Clemen, R. T., & Reilly, T. *Making Hard Decisions with DecisionTools*.
- Keeney, R. L., & Raiffa, H. *Decisions with Multiple Objectives: Preferences and Value Tradeoffs*.
- MIT OpenCourseWare, 1.040/1.041 *Project Management*.
- Stanford University, CEE 241 *Construction Management and Engineering*.
- Cambridge Engineering Tripos, Part IIA construction engineering and management modules.

# Chapter 1: Civil Engineering Systems and Design Methodology

Civil engineering practice rarely encounters problems that can be isolated from their surroundings. A highway is embedded in a regional transportation network, a water treatment plant must be sized against population growth scenarios, and a building sits inside a capital programme whose financing, permitting, and operations unfold over decades. A system, in the sense used here, is a set of interacting components whose collective behaviour produces outcomes that no single component could generate alone. Systems thinking directs attention away from isolated artefacts and toward the relationships, feedback loops, and boundary conditions that govern performance over the life cycle.

A useful first step is to distinguish complicated systems from complex systems. A complicated system has many parts but behaves predictably once the parts are understood, as with the hydraulic network of a treatment facility. A complex system, by contrast, exhibits emergent behaviour: its response to a change cannot be deduced from the components in isolation because agents adapt, feedback propagates, and small perturbations can amplify nonlinearly. Urban transport demand, construction supply chains, and coupled water-energy-land systems are complex in this sense. Engineering design for complex systems therefore emphasizes resilience, modularity, redundancy, and the ability to revise decisions as information arrives.

The canonical design methodology proceeds through recognition of need, problem definition, generation of alternatives, analysis, evaluation against criteria, selection, implementation, and post-implementation review. Each stage feeds information back to earlier stages, so the process is iterative rather than linear. Problem definition is often the most consequential step because it fixes the scope, the stakeholders, and the objectives; a narrowly framed problem forecloses alternatives that might dominate on sustainability or life-cycle cost. The analysis stage calls for models — physical, mathematical, or computational — that are simple enough to be tractable yet rich enough to capture behaviour of interest. A recurring discipline is to ask what decisions the model will inform, and to accept only the complexity that those decisions require.

Network models offer a compact representation for many civil systems. A directed graph whose nodes represent facilities, intersections, or activities and whose arcs represent flows, links, or precedences can describe transportation networks, water distribution, supply chains, and project schedules within a single formalism. Network formulations make properties such as connectivity, shortest path, maximum flow, and minimum cut computationally accessible, and they later serve as the backbone for scheduling and optimization methods introduced in subsequent chapters.

# Chapter 2: Decision Theory and Expected Utility

Engineering decisions are made under uncertainty. Decision theory provides a structured way to reason about choices when outcomes are not known in advance. The basic objects are a set of alternatives, a set of states of the world with associated probabilities, a consequence for each alternative-state pair, and a preference ordering over consequences. If preferences satisfy mild consistency axioms — completeness, transitivity, continuity, and independence — they can be represented by a utility function, and the rational decision is to select the alternative with the greatest expected utility.

For a discrete decision with alternatives \(a_i\) and states \(s_j\) occurring with probabilities \(p_j\), the expected utility of alternative \(a_i\) is

\[
EU(a_i) = \sum_{j} p_j \, u\!\left(x_{ij}\right),
\]

where \(x_{ij}\) is the consequence of choosing \(a_i\) under state \(s_j\) and \(u(\cdot)\) is the decision maker's utility function. When outcomes are monetary and the decision maker is risk neutral, \(u(x) = x\) and expected utility reduces to expected monetary value. Risk aversion corresponds to a concave utility function, so that a certain payoff is preferred to a lottery with the same mean. The certainty equivalent \(CE\) of a lottery is the sure amount satisfying \(u(CE) = EU\), and the difference between the expected value and the certainty equivalent is the risk premium.

The value of information quantifies how much a decision maker should be willing to pay to reduce uncertainty before committing. The expected value of perfect information is the difference between the expected utility achievable when the true state is revealed before acting and the expected utility of the best action taken under prior uncertainty. The expected value of sample information is analogous but conditioned on imperfect signals such as site investigations, pilot studies, or market surveys, and it always lies between zero and the value of perfect information. These quantities help engineers judge whether additional geotechnical boreholes, hydrological monitoring, or prototype testing will pay for themselves.

# Chapter 3: Decision Trees, Game Theory, and Multi-Criteria Analysis

A decision tree displays a sequence of decisions and chance events as a branching diagram. Square nodes represent decisions under the engineer's control; circular nodes represent chance events with branches labelled by probabilities; terminal nodes carry the consequences. The tree is solved by backward induction, also called rollback: at each chance node the expected utility of emanating branches is computed, at each decision node the branch with the highest expected utility is selected, and values propagate back to the root. The method extends naturally to sequential problems such as staged construction, adaptive rehabilitation, and exploratory drilling, where later decisions depend on information revealed earlier.

Bayesian updating links decision trees to the value of sample information. Given a prior probability \(P(s)\) over states and a likelihood \(P(r \mid s)\) for observing signal \(r\), the posterior is

\[
P(s \mid r) = \frac{P(r \mid s)\,P(s)}{\sum_{s'} P(r \mid s')\,P(s')}.
\]

The decision maker uses the posterior to evaluate actions after observing the signal, then takes the expectation over signals to obtain the ex ante value of the information-gathering activity.

Game theory broadens the framework to situations in which outcomes depend on the choices of multiple purposive actors. In a two-player game with strategy sets \(A_1\) and \(A_2\) and payoff functions \(u_1, u_2\), a Nash equilibrium is a pair \((a_1^{\*}, a_2^{\*})\) such that no player can increase their payoff by unilaterally deviating. Civil engineering contexts include contractor bidding, negotiations between owners and subcontractors, regulatory enforcement, and competition for water rights. Dominant strategies, if they exist, eliminate the need for strategic guessing; more often, equilibria must be computed and examined for fairness and stability.

Real civil engineering choices rarely collapse to a single scalar objective. Multi-criteria decision analysis explicitly accommodates objectives such as cost, schedule, environmental impact, social equity, safety, and resilience. The weighted sum method assigns weights \(w_k\) to normalized criterion scores \(c_{ik}\) and computes an aggregate \(S_i = \sum_k w_k c_{ik}\). More sophisticated approaches, such as the analytic hierarchy process, elicit pairwise comparisons between criteria and check the consistency of the resulting weights. Outranking methods compare alternatives on each criterion individually to identify dominance and incomparability. Whichever method is used, the engineer should report how sensitive the ranking is to the weights, since decisions that reverse under small weight perturbations cannot be defended as robust.

Risk management closes the decision-theory block by translating uncertainty into a managed programme of identification, qualitative and quantitative assessment, response planning, and monitoring. Risks are typically characterized by their probability of occurrence and the magnitude of their consequence; prioritization by the product of the two yields a risk register that can be re-examined over the project life cycle. Response strategies include avoidance, mitigation, transfer through insurance or contract clauses, and informed acceptance, chosen in light of the cost and residual risk of each.

# Chapter 4: Project Management Fundamentals and Estimating

A project is a temporary endeavour undertaken to produce a unique product, service, or result, and a capital project in civil engineering typically passes through conceptual planning, feasibility, design, procurement, construction, commissioning, and operations. Project management is the application of knowledge, skills, tools, and techniques to project activities to meet project requirements, balancing the competing demands of scope, time, cost, and quality. The discipline organizes this work around integration, scope, schedule, cost, quality, resources, communications, risk, procurement, and stakeholder management.

The first technical task is estimating. A cost estimate is the engineer's quantitative expression of the resources required to complete a defined scope of work. Estimates are prepared progressively: a rough order-of-magnitude estimate during conceptual planning may rely on parametric relationships drawn from historical projects, whereas a definitive estimate before construction is based on detailed quantity take-offs from drawings and unit prices drawn from current supplier quotations. A parametric relationship often takes the power-law form

\[
C_2 = C_1 \left(\frac{Q_2}{Q_1}\right)^{n},
\]

where \(C_1\) is the known cost at capacity \(Q_1\), \(C_2\) is the estimated cost at capacity \(Q_2\), and the exponent \(n\) reflects economies of scale. Values of \(n\) below one are typical for process plants and storage facilities, reflecting the classic six-tenths rule used in industrial cost engineering.

Direct costs include labour, materials, equipment, and subcontracts directly attributable to the work. Indirect costs include project overhead, site supervision, temporary facilities, bonds, insurance, and general conditions. Contingency is an allowance added to cover known unknowns within the defined scope and diminishes as design information matures. Escalation adjusts costs for price changes between the estimate date and execution. A responsible estimate also states the class and confidence interval, because presenting a single number without a range misrepresents the underlying uncertainty.

# Chapter 5: Planning, Scheduling, and the Critical Path Method

Planning precedes scheduling. It defines the work breakdown structure, which decomposes total scope into deliverable-oriented packages and then into activities with assignable responsibility, measurable output, and estimable duration. A well-constructed work breakdown structure supports estimating, risk analysis, procurement, and progress measurement. Once activities are defined, precedence relationships among them are identified: finish-to-start is the default, while start-to-start, finish-to-finish, and start-to-finish relationships capture overlaps such as pouring concrete while formwork continues elsewhere.

Scheduling transforms the activity list and its precedence network into a timeline. The critical path method computes, for each activity, the earliest start \(ES\), earliest finish \(EF\), latest start \(LS\), and latest finish \(LF\) consistent with the network. The forward pass sets

\[
ES_j = \max_{i \in \text{pred}(j)} EF_i, \qquad EF_j = ES_j + d_j,
\]

where \(d_j\) is the duration of activity \(j\). The backward pass, starting from the project completion, sets

\[
LF_i = \min_{j \in \text{succ}(i)} LS_j, \qquad LS_i = LF_i - d_i.
\]

Total float is \(TF_i = LS_i - ES_i = LF_i - EF_i\), and activities with zero total float form the critical path. Free float is the amount by which an activity can slip without delaying the earliest start of any successor, and it equals the difference between the earliest start of the earliest successor and the earliest finish of the activity in question. The critical path is not unique; networks commonly contain several parallel chains that are critical or near-critical, which is where schedule risk typically lives.

Uncertainty in activity durations is addressed by the programme evaluation and review technique, which treats each duration as a random variable approximated by a beta distribution with optimistic, most likely, and pessimistic estimates \(a\), \(m\), and \(b\). The expected duration and variance of an activity are

\[
\mu = \frac{a + 4m + b}{6}, \qquad \sigma^2 = \left(\frac{b - a}{6}\right)^{2}.
\]

Summing means and variances along the critical path gives an approximate distribution for project completion, which supports probability statements about meeting a target date. The approximation tends to underestimate risk when parallel paths are nearly critical, so Monte Carlo simulation is preferred when precision matters.

Gantt charts visualize the schedule by plotting activity bars along a calendar axis; milestones, float, and resource loadings can be overlaid to support communication with owners and contractors. Software environments such as MS Project implement the critical path algorithms, maintain baselines for earned value comparison, and support updates as actual progress is recorded.

# Chapter 6: Resource Levelling, Time-Cost Trade-Offs, and Project Control

An unconstrained schedule may demand resource quantities that exceed availability or fluctuate uneconomically. Resource levelling adjusts non-critical activities within their float so that resource histograms become smoother without extending the project. Resource-constrained scheduling tightens this further by delaying activities when resources are insufficient, which may push the project completion date outward and therefore create new critical sequences. Heuristic priority rules — such as minimum total float, shortest duration, or greatest resource demand — provide practical solutions to resource-constrained scheduling problems that are otherwise NP-hard.

Project durations can often be shortened by expediting activities at additional cost. The time-cost trade-off, or project crashing, identifies the least expensive way to reduce total duration by a desired amount. Each activity is characterized by a normal duration and cost and a crash duration and cost, with a cost slope

\[
\text{slope}_j = \frac{C_{\text{crash},j} - C_{\text{normal},j}}{d_{\text{normal},j} - d_{\text{crash},j}}.
\]

Crashing proceeds by reducing the duration of the critical activity with the smallest cost slope, one time unit at a time, updating the critical path after each step because new paths may become critical. The procedure stops when the target duration is reached or when no further crashing is feasible. Time-cost trade-off problems can also be cast and solved as linear programmes, which handle large networks and complex constraints more gracefully.

Project control closes the management loop by measuring actual performance, comparing it to the baseline, and taking corrective action. Earned value management integrates scope, schedule, and cost into three headline metrics: the budgeted cost of work scheduled, the budgeted cost of work performed, and the actual cost of work performed. From these, the schedule variance, cost variance, schedule performance index, and cost performance index reveal both the direction and magnitude of deviation. Forecasts of estimate at completion can then be formed by extrapolating current performance, giving early warning of overruns while there is still time to intervene.

# Chapter 7: Linear Programming and Sensitivity Analysis

Optimization provides the quantitative machinery to choose the best alternative from a set defined by constraints. A linear programme seeks values of decision variables \(x_1, x_2, \ldots, x_n\) that maximize or minimize a linear objective subject to linear equality and inequality constraints and sign restrictions. The standard form is

\[
\max \; z = \sum_{j=1}^{n} c_j x_j \quad \text{s.t.} \quad \sum_{j=1}^{n} a_{ij} x_j \le b_i, \; i = 1, \ldots, m, \qquad x_j \ge 0.
\]

In civil engineering such models describe aggregate production planning for ready-mix concrete, crew allocation among concurrent projects, water allocation across competing demands, and blending problems for asphalt or soil mixtures. Linearity is less restrictive than it first appears, because many nonlinear relationships can be piecewise-linearized or reformulated with auxiliary variables.

The feasible region of a linear programme is a convex polyhedron, and an optimal solution, if one exists, occurs at one of its vertices. The simplex method exploits this by moving from vertex to vertex along improving edges until optimality is certified. The revised simplex method and interior-point methods scale the same ideas to large industrial problems. Duality theory attaches to every primal linear programme a dual linear programme whose variables can be interpreted as shadow prices, the marginal value of relaxing each constraint by one unit. These shadow prices guide investment decisions, such as whether to expand a plant's capacity or hire additional crews.

Sensitivity analysis asks how the optimal solution changes when problem data change. For each objective coefficient \(c_j\), the sensitivity report provides the allowable increase and decrease within which the current basis remains optimal. For each right-hand side \(b_i\), the report provides a range over which the current set of binding constraints and their shadow prices remain valid. Engineers use these ranges to assess the robustness of a recommended plan against estimation error in costs, yields, and capacities, and to identify the bottleneck constraints that are most worth relieving.

# Chapter 8: Multi-Objective, Network Flow, and Integer Programming

Many civil engineering problems resist reduction to a single objective. Multi-objective programming generalizes linear programming by considering several objectives simultaneously, for example minimizing cost while minimizing emissions and minimizing travel time. No single solution is best on all criteria; instead, interest centres on Pareto-efficient solutions, for which no objective can be improved without worsening another. The weighted-sum method, \(\varepsilon\)-constraint method, and goal programming generate Pareto frontiers by parameterizing the trade-off. The engineer then presents the frontier to decision makers, who select a point according to preferences that may be difficult to formalize in advance.

Network flow models are a particularly fertile family of linear programmes whose structure allows specialized and extremely efficient algorithms. The transportation problem assigns flows \(x_{ij}\) from supply nodes \(i\) with capacities \(s_i\) to demand nodes \(j\) with requirements \(d_j\) so as to minimize total cost:

\[
\min \sum_{i,j} c_{ij} x_{ij} \quad \text{s.t.} \quad \sum_{j} x_{ij} = s_i, \; \sum_{i} x_{ij} = d_j, \; x_{ij} \ge 0.
\]

The assignment problem, shortest-path problem, maximum-flow problem, and minimum-cost flow problem are siblings, each describing a common civil systems situation: assigning crews to tasks, routing traffic through road networks, sizing pipes in hydraulic networks, and scheduling material deliveries. A valuable structural property is that network flow problems with integer data admit integer optimal solutions, so fractional allocations do not arise even though the models are solved as continuous linear programmes.

Integer programming extends linear programming by restricting some or all variables to integer values, which is essential whenever decisions are indivisible. Facility location, whether or not to build a new interchange, how many lanes to add, which bridges to rehabilitate this year, and yes-no choices among mutually exclusive design alternatives are naturally modelled with binary variables \(x_j \in \{0,1\}\). Mixed-integer programmes combine continuous and integer variables, as when a continuous production level is coupled with a binary switch for opening a facility. Branch-and-bound algorithms solve these problems by systematically enumerating the integer possibilities while using linear relaxations to prune the search tree. Because integer programmes are NP-hard in general, careful formulation — tight bounds, valid inequalities, symmetry breaking — dramatically affects solution time in practice.

Stochastic elements can be layered on top of deterministic optimization through Monte Carlo simulation. Uncertain parameters are represented by probability distributions; the model is solved many times with sampled inputs; and the distribution of outputs characterizes robustness. Combined with optimization, simulation supports stochastic programming and robust design, producing plans that perform acceptably across a range of plausible futures rather than optimally in a single nominal scenario. Used together with decision analysis, scheduling, and network models from the earlier chapters, these optimization tools complete the quantitative toolkit that practising civil engineers bring to the design, management, and life-cycle assessment of complex civil systems.
