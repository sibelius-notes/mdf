---
title: "SYDE 531: Design Optimization Under Probabilistic Uncertainty"
subjects: "SYDE"
---

## Sources and References

- Birge and Louveaux, *Introduction to Stochastic Programming*.
- Shapiro, Dentcheva, and Ruszczynski, *Lectures on Stochastic Programming*.
- Ben-Tal, El Ghaoui, and Nemirovski, *Robust Optimization*.
- Bertsimas, Brown, and Caramanis, "Theory and Applications of Robust Optimization."
- Rockafellar and Uryasev, "Optimization of Conditional Value-at-Risk."
- Prekopa, *Stochastic Programming*.
- Kleywegt, Shapiro, and Homem-de-Mello, sample-average-approximation papers.
- MIT OpenCourseWare 15.093 / 6.255 optimization materials and public notes on stochastic and robust optimization.
- Stanford MS&E / EE public course materials on convex, stochastic, and robust optimization.

---

## 1. Why Optimize Under Uncertainty?

Classical mathematical programming — linear, nonlinear, integer — treats every coefficient of the objective and every coefficient of the constraints as a known, deterministic number. The optimizer hands back a single point \( x^\star \) that is optimal *conditional on the data being exactly right*. Real design problems rarely satisfy this premise. A water-reservoir operator does not know next year's inflows. A chip fabrication line cannot hold every transistor length within an arbitrarily tight tolerance. A portfolio manager does not know tomorrow's returns. An electric-grid planner does not know how wind speed, demand, and fuel prices will co-evolve over thirty years of plant life. In every one of these settings, the "optimal" deterministic plan is typically fragile: once the true parameters deviate even slightly from their nominal values, the plan becomes infeasible, wildly suboptimal, or both.

SYDE 531 builds the vocabulary and the toolkit for optimization when parameters are probabilistic. The central pivot is a reformulation of the problem itself. Instead of

\[
\min_{x \in X} \; f(x, \xi_0),
\]

with \( \xi_0 \) a nominal parameter vector, we write

\[
\min_{x \in X} \; \rho\!\left[ f(x, \tilde{\xi}) \right] \quad \text{subject to} \quad \mathcal{C}\!\left[ g(x, \tilde{\xi}) \le 0 \right],
\]

where \( \tilde{\xi} \) is a random vector, \( \rho \) is a *risk functional* collapsing the random objective to a scalar (expectation, variance-penalized mean, conditional value-at-risk, worst-case, etc.), and \( \mathcal{C} \) is a *constraint satisfaction rule* that extends the notion of "feasible" to a probabilistic or set-valued setting (almost-sure, in expectation, with probability at least \( 1-\varepsilon \), for all realizations inside an uncertainty set).

<div style="border-left: 4px solid #2a6099; padding: 0.6em 1em; background: #f0f6fc; margin: 1em 0;"><strong>Design principle.</strong> <em>A design that is optimal on paper but intolerant to realistic deviations is not optimal — it is merely lucky.</em> Probabilistic optimization trades a small amount of nominal performance for a large amount of robustness, measured explicitly.</div>

### 1.1 A taxonomy of uncertainty

Not all uncertainty is alike. Two axes help organize the zoo.

*Aleatory vs epistemic.* Aleatory (or "irreducible") uncertainty is intrinsic randomness — thermal noise, demand fluctuations, manufacturing variation. You cannot eliminate it by collecting more data; you can only characterize its distribution. Epistemic uncertainty is ignorance — you would know the parameter if you had enough data or a better model. More measurements shrink epistemic uncertainty; they do not shrink aleatory uncertainty.

*Source.* Data uncertainty (the parameters fed into the optimizer are estimated), model uncertainty (the functional form of \( f \) or \( g \) is approximate), and decision uncertainty (what future decisions will be taken, in multi-stage problems).

A well-posed formulation declares, at the outset, which kind of uncertainty it is modelling. Stochastic programming treats uncertainty as aleatory with known distribution. Robust optimization treats it as epistemic — bounded but otherwise adversarial. Distributionally robust optimization hedges against misspecification of the distribution itself.

### 1.2 Three archetypes

Three recurring problems motivate the entire course.

1. *Capacity expansion under uncertain demand.* Decide now how much generation (or reservoir storage, or fab capacity) to build; later, after demand is realized, operate the system cheaply. First-stage investment is irrevocable; second-stage operation adapts. This is the canonical *two-stage stochastic program with recourse*.
2. *Reliable design with manufacturing tolerances.* Choose nominal dimensions \( x \) of a component. Manufacturing perturbs them to \( x + \eta \) where \( \eta \sim \mathcal{N}(0, \Sigma) \). The component "fails" if \( g(x+\eta) > 0 \). Keep the failure probability below a threshold while optimizing a performance metric. This is *reliability-based design optimization* or *chance-constrained design*.
3. *Portfolio choice under return uncertainty.* Allocate wealth across assets with random returns. Maximize expected return minus a risk penalty, or maximize expected return subject to the loss in the worst 5 % of outcomes not exceeding a threshold. This is classical *mean-risk* and *CVaR* portfolio optimization.

Each archetype generalizes. Reservoir management is capacity expansion with multi-stage recourse. Supply-chain network design is portfolio choice with integer variables. The unifying grammar — random objective, risk functional, probabilistic feasibility — is the substance of the course.

## 2. Probability and Statistical Foundations

Before writing down a stochastic program, we must be fluent in the basic calculus of random variables on \( (\Omega, \mathcal{F}, \mathbb{P}) \).

A random vector \( \tilde{\xi}: \Omega \to \mathbb{R}^d \) has cumulative distribution \( F_{\tilde{\xi}} \) and, if absolutely continuous, density \( p_{\tilde{\xi}} \). Expectation is the Lebesgue integral \( \mathbb{E}[h(\tilde{\xi})] = \int h(\xi) \, dF_{\tilde{\xi}}(\xi) \). The *law of the unconscious statistician* says we can compute \( \mathbb{E}[h(\tilde{\xi})] \) with the density of \( \tilde{\xi} \) without knowing the distribution of \( h(\tilde{\xi}) \) itself — which matters because in stochastic programming \( h(\cdot) = \min_y \{ q^\top y : W y = \xi - T x \} \), an implicit function of \( \xi \).

Two inequalities return again and again. *Jensen's inequality:* for convex \( \varphi \),

\[
\varphi(\mathbb{E}[\tilde{\xi}]) \le \mathbb{E}[\varphi(\tilde{\xi})].
\]

A practical consequence is the *value of the stochastic solution* \( \mathrm{VSS} \ge 0 \): the cost of solving a convex program with expected parameters is always a lower bound on the expected cost of the deterministic solution applied to random parameters. Ignoring uncertainty looks cheap and actually is not.

*Chebyshev's inequality.* For any random variable \( Y \) with mean \( \mu \) and variance \( \sigma^2 \),

\[
\mathbb{P}\!\left( \lvert Y - \mu \rvert \ge k \sigma \right) \le \frac{1}{k^2}.
\]

Chebyshev underlies many distribution-free chance-constraint reformulations: it is how you bound a tail probability knowing only the first two moments.

### 2.1 Convergence and consistency

Sample-based methods rest on the *strong law of large numbers*: for i.i.d. samples \( \xi^1, \ldots, \xi^N \) from the distribution of \( \tilde{\xi} \), the empirical mean

\[
\hat{\mu}_N = \frac{1}{N} \sum_{n=1}^N h(\xi^n)
\]

converges almost surely to \( \mathbb{E}[h(\tilde{\xi})] \). The *central limit theorem* then delivers a \( \mathcal{O}(N^{-1/2}) \) confidence interval, independent of the dimension of \( \tilde{\xi} \) — the feature that makes Monte Carlo attractive in high dimensions despite its slow absolute rate.

A deeper result, *uniform convergence* over a family of integrands, is what justifies sample-based optimization (SAA). Under mild regularity the empirical-minimizer converges to the true minimizer, and the optimal value converges to the true optimal value, with rates that depend on the covering number or VC dimension of the constraint family.

## 3. Risk Measures

The choice of \( \rho \) — what summary of a random cost we minimize — is a modelling decision, not a mathematical one. A "risk measure" is a functional \( \rho: \mathcal{L}^1 \to \mathbb{R} \cup \{ +\infty \} \) that assigns a scalar to a random loss. Artzner, Delbaen, Eber and Heath's *coherent risk measure* axioms isolate the minimum structure an engineering risk measure should have.

<div style="border-left: 4px solid #2a6099; padding: 0.6em 1em; background: #f0f6fc; margin: 1em 0;"><strong>Coherence axioms.</strong> <em>Monotonicity</em> (if \( L_1 \le L_2 \) a.s. then \( \rho(L_1) \le \rho(L_2) \)), <em>translation equivariance</em> (\( \rho(L+c) = \rho(L)+c \)), <em>positive homogeneity</em> (\( \rho(\lambda L) = \lambda \rho(L) \) for \( \lambda \ge 0 \)), and <em>subadditivity</em> (\( \rho(L_1+L_2) \le \rho(L_1) + \rho(L_2) \)). Subadditivity formalizes diversification: combining two portfolios does not increase total risk.</div>

### 3.1 Expectation

The simplest risk measure is \( \rho(L) = \mathbb{E}[L] \). It is coherent but *risk-neutral*: it treats a certain loss of 100 identically to a 50-50 gamble between 0 and 200. For most engineering problems this understates catastrophe.

### 3.2 Mean-variance and semi-variance

Markowitz's mean-variance trade-off, \( \rho(L) = \mathbb{E}[L] + \lambda \mathrm{Var}(L) \), is tractable (a quadratic program when \( L \) is linear in \( x \)) but not monotone: an unambiguously better random outcome can carry higher variance and thus look "worse." The fix is *semi-variance*, which penalizes only downside deviations:

\[
\mathrm{SV}(L) = \mathbb{E}\!\left[ \left( L - \mathbb{E}[L] \right)_+^2 \right].
\]

### 3.3 Value-at-Risk

Value-at-Risk at level \( \alpha \in (0,1) \) is the \( \alpha \)-quantile of the loss,

\[
\mathrm{VaR}_\alpha(L) = \inf \{ \ell : \mathbb{P}(L \le \ell) \ge \alpha \}.
\]

"With 95 % confidence, the loss will not exceed \( \mathrm{VaR}_{0.95} \)." VaR is translation-equivariant and monotone, but not subadditive: concentrating a portfolio can lower VaR. It is also generally non-convex in the decision \( x \), which makes it awkward for optimization.

### 3.4 Conditional Value-at-Risk (Expected Shortfall)

CVaR repairs VaR's deficiencies. At level \( \alpha \),

\[
\mathrm{CVaR}_\alpha(L) = \mathbb{E}\!\left[ L \mid L \ge \mathrm{VaR}_\alpha(L) \right],
\]

the expected loss *given* that a worst-\( (1-\alpha) \) event occurs. Rockafellar and Uryasev proved that CVaR admits the variational representation

\[
\mathrm{CVaR}_\alpha(L) = \min_{\eta \in \mathbb{R}} \left\{ \eta + \frac{1}{1-\alpha} \, \mathbb{E}[(L - \eta)_+] \right\}.
\]

This is the single most useful identity in the course: the outer \( \min \) over \( \eta \) can be merged with the design-variable optimization, and when \( L(x, \tilde{\xi}) \) is convex in \( x \) the resulting problem is convex. With \( N \) Monte Carlo scenarios \( \xi^n \) and loss samples \( L^n = L(x, \xi^n) \), CVaR-minimization becomes the LP

\[
\min_{x, \eta, s_1, \ldots, s_N} \;\; \eta + \frac{1}{N(1-\alpha)} \sum_{n=1}^N s_n \quad \text{s.t.} \quad s_n \ge L^n - \eta, \;\; s_n \ge 0.
\]

CVaR is coherent, convex in \( x \), and tractable. It is the default risk measure for engineered-system design in this course.

## 4. Two-Stage Stochastic Programming with Recourse

The first stochastic-programming model any engineer should learn is the two-stage linear program with recourse. A decision \( x \) is made *here and now*, before \( \tilde{\xi} \) is observed. After \( \tilde{\xi} = \xi \) is revealed, a *recourse* decision \( y \) corrects or completes the first-stage plan. The problem is

\[
\min_{x \in X} \; c^\top x + \mathbb{E}_{\tilde{\xi}}[Q(x, \tilde{\xi})],
\]

with the recourse value

\[
Q(x, \xi) = \min_y \{ q(\xi)^\top y : W y = h(\xi) - T(\xi) x, \; y \ge 0 \}.
\]

The expected-recourse function \( \mathcal{Q}(x) = \mathbb{E}[Q(x, \tilde{\xi})] \) is convex and piecewise linear in \( x \) when the recourse is linear and \( \tilde{\xi} \) has finite support. It is generally non-smooth: its subgradient is the expectation of the dual multipliers of the second-stage LP.

### 4.1 Solution methods

*Extensive form.* If \( \tilde{\xi} \) takes a finite set of values \( \xi^s \) with probabilities \( p_s \), \( s = 1, \ldots, S \), the whole problem collapses to one deterministic LP in the variables \( (x, y^1, \ldots, y^S) \). This is clean but its size grows linearly with \( S \).

*Benders / L-shaped decomposition.* Exploit the block structure. At an outer iteration, fix \( x \); solve \( S \) independent second-stage LPs; collect feasibility cuts (when a second-stage LP is infeasible) and optimality cuts (linear lower bounds on \( \mathcal{Q}(x) \)) and add them to a master LP in \( x \). Resolve the master; iterate. Convergence is finite when \( \tilde{\xi} \) has finite support.

*Progressive hedging.* Relax the non-anticipativity constraint (\( x \) cannot depend on \( s \)) with a quadratic penalty, decouple scenarios, and iteratively force convergence of the per-scenario \( x^s \) to a single \( x \). Suits massive parallelism.

### 4.2 Quality of solutions

Two quantities evaluate how much uncertainty costs and how much ignoring it costs.

*Expected value of perfect information.* \( \mathrm{EVPI} = \mathbb{E}[\min_x f(x, \tilde{\xi})] - \min_x \mathbb{E}[f(x, \tilde{\xi})] \le 0 \). It measures what one would pay for a clairvoyant oracle.

*Value of the stochastic solution.* \( \mathrm{VSS} = \min_x \mathbb{E}[f(x, \tilde{\xi})] - \mathbb{E}[f(x_\mathrm{EV}, \tilde{\xi})] \le 0 \), where \( x_\mathrm{EV} \) is the *expected-value* solution (optimize with \( \tilde{\xi} \) replaced by its mean). VSS is the improvement that explicitly modelling uncertainty provides over the "plug-in-the-mean" heuristic.

## 5. Multi-Stage Stochastic Programming and Dynamic Programming

When the decision process unfolds over time \( t = 1, \ldots, T \), with uncertainty revealed gradually \( \tilde{\xi}_1, \ldots, \tilde{\xi}_T \) and decisions \( x_t \) adapting to what has been observed, we have a *multi-stage* problem. Non-anticipativity — \( x_t \) depends only on \( \xi_{1:t} \), not on the future — is the structural constraint.

### 5.1 Scenario trees

A scenario tree represents the joint distribution of \( \tilde{\xi}_{1:T} \) as a rooted tree whose nodes at depth \( t \) are the possible histories up to \( t \). A decision variable is attached to each node (not to each leaf), automatically encoding non-anticipativity. The extensive form is then an LP or MILP on the tree. Size explodes exponentially in \( T \).

### 5.2 Bellman's equation

When \( \tilde{\xi}_t \) is stagewise independent (or Markov), dynamic programming replaces exponential tree enumeration with a stage-by-stage recursion. Define the cost-to-go

\[
V_t(s_t) = \min_{a_t} \;\; \mathbb{E}_{\tilde{\xi}_{t+1}} \!\left[ c_t(s_t, a_t, \tilde{\xi}_{t+1}) + V_{t+1}\!\left( \phi_t(s_t, a_t, \tilde{\xi}_{t+1}) \right) \right],
\]

with boundary \( V_T(\cdot) \). Bellman's principle says the optimal policy at time \( t \) depends on the state \( s_t \) alone, not on the path that led to it.

Three curses obstruct naive DP.

*Curse of dimensionality.* The state space grows exponentially in the number of state variables — a reservoir problem with 10 reservoirs and 50 storage levels each has \( 50^{10} \approx 10^{17} \) states.

*Curse of modelling.* Writing down \( \phi_t \) and \( c_t \) analytically may itself be intractable.

*Curse of expectation.* Computing the inner expectation requires either analytic tractability, discrete scenarios, or Monte Carlo.

### 5.3 Approximate dynamic programming

Two workhorse families escape the curses.

*Stochastic dual dynamic programming (SDDP).* For convex, stagewise-independent problems, approximate \( V_{t+1} \) by its supporting cuts, generated by forward (sampling) and backward (cut-building) passes. Converges to the true policy in the limit.

*Value-function or policy approximation.* Replace \( V_t(s) \) with \( \tilde{V}_t(s; \theta) \) — linear basis, neural net, tree ensemble — and fit \( \theta \) by Bellman-residual minimization. This is the bridge to reinforcement learning.

## 6. Scenario Generation and Reduction

A stochastic program with a continuous distribution is approximated by one with finitely many scenarios. Two separate questions arise.

*Generation.* Given a model of \( \tilde{\xi} \) (analytic distribution, autoregressive process, copula + marginals), produce \( S \) representative sample paths. Monte Carlo is one option; moment matching, optimal quantization, and quasi-Monte Carlo (low-discrepancy sequences) are others. Low-discrepancy methods can achieve \( \mathcal{O}((\log N)^d / N) \) error for smooth integrands, beating MC's \( \mathcal{O}(N^{-1/2}) \) in moderate dimension.

*Reduction.* Given a dense set of \( S \) scenarios, pick a subset of \( S' \ll S \) that approximates the original in a suitable metric. The Wasserstein (earth-mover) distance is the standard: iteratively delete the scenario whose removal adds the least Wasserstein mass, then redistribute its probability to its nearest neighbour. This is the Dupačová–Gröwe-Kuska–Römisch reduction.

## 7. Sample Average Approximation

Conceptually the simplest, and in practice extremely powerful, approach to

\[
\min_{x \in X} \;\; g(x) = \mathbb{E}[G(x, \tilde{\xi})]
\]

is to draw i.i.d. samples \( \xi^1, \ldots, \xi^N \) and solve the empirical problem

\[
\hat{x}_N \in \arg\min_{x \in X} \;\; \hat{g}_N(x) = \frac{1}{N} \sum_{n=1}^N G(x, \xi^n).
\]

Under uniform integrability and continuity, \( \hat{x}_N \to x^\star \) a.s. and the optimal value \( \hat{g}_N(\hat{x}_N) \to g(x^\star) \). Non-asymptotic bounds of Shapiro–Dentcheva–Ruszczynski give, with probability \( 1-\delta \),

\[
g(\hat{x}_N) - g(x^\star) \le \mathcal{O}\!\left( \sqrt{ \frac{ \dim(X) \log(1/\delta) }{N} } \right),
\]

the sample size required scaling only logarithmically with tolerance. A practical recipe is to solve several independent SAA replicates to build confidence intervals on the optimal value, and to evaluate the candidate solution on a large *out-of-sample* test set.

## 8. Chance-Constrained Programming

Some engineering specifications are naturally probabilistic: "the reservoir must avoid overflow on at least 95 % of days" or "the chip must meet timing specifications in at least 99 % of fabricated copies." A chance constraint directly encodes such language:

\[
\mathbb{P}( g(x, \tilde{\xi}) \le 0 ) \ge 1 - \varepsilon.
\]

### 8.1 Individual vs joint

An *individual* chance constraint applies to one inequality, \( \mathbb{P}(g_i(x,\tilde{\xi}) \le 0) \ge 1-\varepsilon_i \). A *joint* chance constraint demands that *all* inequalities hold simultaneously: \( \mathbb{P}(g(x,\tilde{\xi}) \le 0) \ge 1-\varepsilon \). The joint form is stricter: \( m \) individual constraints at level \( 1-\varepsilon/m \) imply the joint constraint at level \( 1-\varepsilon \) (Bonferroni), but this bound is typically loose.

### 8.2 Analytic reformulations

If \( g(x, \tilde{\xi}) = a(\tilde{\xi})^\top x - b(\tilde{\xi}) \) is linear in \( x \) and \( (a, b) \) is jointly Gaussian, the individual chance constraint becomes a deterministic second-order cone constraint:

\[
\mathbb{E}[a]^\top x + \Phi^{-1}(1-\varepsilon) \sqrt{ x^\top \Sigma_a x - 2 x^\top \sigma_{ab} + \sigma_b^2 } \le \mathbb{E}[b].
\]

For \( \varepsilon \le 0.5 \), \( \Phi^{-1}(1-\varepsilon) \ge 0 \) and the constraint is convex. For \( \varepsilon > 0.5 \) it is non-convex and (usefully) encourages *more* variance — rarely the intended risk posture.

Without Gaussianity, Chebyshev-type bounds, Cantelli's one-sided inequality, or moment-based semidefinite reformulations deliver distribution-free (typically conservative) convex reformulations.

### 8.3 The scenario approach

Calafiore and Campi showed that if one draws \( N \) i.i.d. scenarios \( \xi^n \) and solves

\[
\min_{x \in X} f(x) \quad \text{s.t.} \quad g(x, \xi^n) \le 0, \; n = 1, \ldots, N,
\]

the resulting \( x^\star_N \) satisfies the original chance constraint with confidence \( 1-\beta \), provided

\[
N \ge \frac{1}{\varepsilon} \left( d - 1 + \ln \frac{1}{\beta} + \sqrt{ 2 (d-1) \ln \frac{1}{\beta} } \right),
\]

where \( d \) is the dimension of the decision. The bound is *distribution-free*: it depends only on \( d \), \( \varepsilon \), \( \beta \). The underlying result is about the *support rank* of a convex program — the number of constraints that actively define the optimum.

## 9. Robust Optimization

Robust optimization refuses to specify a distribution. It posits only that \( \tilde{\xi} \) lies in a deterministic set \( \mathcal{U} \) and demands feasibility for every realization:

\[
\min_{x \in X} \; \max_{\xi \in \mathcal{U}} f(x, \xi) \quad \text{s.t.} \quad g(x, \xi) \le 0 \; \forall \xi \in \mathcal{U}.
\]

The key insight, due to Ben-Tal, El Ghaoui, and Nemirovski, is that for well-chosen \( \mathcal{U} \) and linear \( g \), the *robust counterpart* is computationally tractable — often a second-order cone program or semidefinite program of size comparable to the nominal LP.

### 9.1 Uncertainty sets

*Box.* \( \mathcal{U} = \{ \xi : \lvert \xi_j - \bar{\xi}_j \rvert \le \hat{\xi}_j \} \). Pessimistic: protects against every coordinate moving to its worst extreme simultaneously. The robust counterpart of \( a^\top x \le b \) with \( a \in \mathcal{U} \) is \( \bar{a}^\top x + \sum_j \hat{a}_j \lvert x_j \rvert \le b \), an LP.

*Ellipsoidal.* \( \mathcal{U} = \{ \xi : (\xi - \bar{\xi})^\top \Sigma^{-1} (\xi - \bar{\xi}) \le \rho^2 \} \). Encodes correlation through \( \Sigma \) and yields SOCP counterparts. Less pessimistic than a circumscribing box.

*Budgeted (Bertsimas–Sim).* \( \mathcal{U} = \{ \xi : \xi_j = \bar{\xi}_j + \hat{\xi}_j z_j, \; \lvert z_j \rvert \le 1, \; \sum_j \lvert z_j \rvert \le \Gamma \} \). Allows at most \( \Gamma \) coordinates to reach their extremes simultaneously. The parameter \( \Gamma \in [0, d] \) interpolates between the nominal \( (\Gamma = 0) \) and box \( (\Gamma = d) \) problems, trading protection level for optimality. The robust counterpart remains an LP.

### 9.2 Adjustable and affine recourse

Two-stage robust problems allow a recourse \( y(\xi) \) that depends on the realization. Fully adjustable robust optimization is generally NP-hard; the standard tractable restriction is *affinely adjustable recourse*, \( y(\xi) = y_0 + Y \xi \), which keeps the counterpart tractable at the cost of some optimality.

## 10. Distributionally Robust Optimization

DRO occupies the middle ground between stochastic programming (one known distribution) and robust optimization (no distribution at all). One specifies a *set* of distributions \( \mathcal{P} \) and optimizes against the worst one:

\[
\min_{x \in X} \; \sup_{\mathbb{P} \in \mathcal{P}} \; \mathbb{E}_{\mathbb{P}}[f(x, \tilde{\xi})].
\]

### 10.1 Moment-based ambiguity sets

\( \mathcal{P} \) is the set of distributions with prescribed mean \( \mu \) and covariance \( \Sigma \) (possibly with support \( \Xi \)). The inner supremum admits semidefinite-programming reformulations (Delage–Ye, Zymler–Kuhn–Rustem) — distribution-free and elegant, but it hedges against many distributions a practitioner would consider implausible.

### 10.2 Wasserstein ambiguity sets

\( \mathcal{P} \) is the Wasserstein ball of radius \( \epsilon \) centred at the empirical distribution \( \hat{\mathbb{P}}_N \) of \( N \) samples. Mohajerin Esfahani and Kuhn proved that for a wide class of loss functions, this DRO problem reduces to a convex program of size polynomial in \( N \), and that the Wasserstein radius \( \epsilon_N = \mathcal{O}(N^{-1/d}) \) delivers finite-sample performance guarantees. The Wasserstein ball is data-driven, geometrically meaningful (distance is in the space of outcomes, not of probabilities), and has become the default DRO tool.

## 11. Reliability-Based Design Optimization

In structural, mechanical, and electrical design, a component's state is characterized by a *limit-state function* \( g(x, \tilde{\eta}) \), with \( g \le 0 \) denoting "safe" and \( g > 0 \) denoting "failure." The failure probability \( p_f(x) = \mathbb{P}(g(x, \tilde{\eta}) > 0) \) is the central object. RBDO solves

\[
\min_{x \in X} f(x) \quad \text{s.t.} \quad p_f(x) \le p_{f,\max}.
\]

### 11.1 FORM and SORM

Direct computation of \( p_f \) by numerical integration is infeasible beyond a few variables, and Monte Carlo requires \( \mathcal{O}(1/p_f) \) samples — prohibitive at \( p_f \sim 10^{-6} \).

*First-order reliability method (FORM).* Map \( \tilde{\eta} \) to standard Gaussians \( U = T(\tilde{\eta}) \) (Rosenblatt transform). Linearize the limit-state surface \( g(x, T^{-1}(U)) = 0 \) at the *most probable point of failure* \( u^\star \) — the point on the failure surface nearest the origin in \( U \)-space. The reliability index is \( \beta = \lVert u^\star \rVert \) and the FORM estimate is \( \hat{p}_f = \Phi(-\beta) \). Finding \( u^\star \) is itself a constrained optimization; Hasofer-Lind and Rackwitz-Fiessler iterations are standard.

*Second-order reliability method (SORM).* Replace the linearization with a local quadratic fit to the limit-state surface and apply Breitung's asymptotic formula. SORM is typically more accurate for curved surfaces.

### 11.2 RBDO architectures

Reliability analysis is an inner loop nested within an outer design-optimization loop. Three arrangements:

*Double loop.* The outer optimizer calls FORM/SORM as a black-box at each design iterate — accurate but expensive.

*Single loop.* Replace the inner reliability problem with its KKT optimality conditions and solve one combined system — fast but approximate.

*Decoupled / sequential.* Alternate deterministic optimization with periodic reliability updates — a practical compromise.

## 12. Yield Optimization and Tolerance Design

A manufactured product departs from its nominal design by random perturbations \( \eta \). The *yield* at design \( x \) is the fraction of manufactured copies that meet all specifications,

\[
Y(x) = \mathbb{P}( g_j(x + \tilde{\eta}) \le 0, \; j = 1, \ldots, m ).
\]

Yield optimization maximizes \( Y(x) \), possibly subject to cost constraints; it is a joint chance-constrained problem with a specific structure (the randomness is additive to the decision).

### 12.1 Worst-case vs statistical tolerancing

*Worst-case tolerancing* assigns each parameter a tolerance \( \pm t_j \) and enforces all specifications at the worst corner of the tolerance box — a box-robust design. Guarantees 100 % yield but over-tightens.

*Statistical tolerancing* assumes tolerances are random (typically Gaussian with \( 3\sigma \) equal to the specified tolerance) and propagates variance through the design equation, \( \sigma_y^2 \approx \sum_j (\partial y / \partial x_j)^2 \sigma_{x_j}^2 \), to estimate yield. Allocating tolerances to achieve a target yield at minimum cost is a convex program when cost is convex-decreasing in \( t_j \) and specifications are linear.

### 12.2 Taguchi's loss function and robust design

Genichi Taguchi reframed tolerance design. Rather than a binary "pass/fail," he posited a *loss function* that grows quadratically with deviation from target:

\[
L(y) = k (y - y_0)^2.
\]

Expected loss is \( \mathbb{E}[L] = k (\mathbb{E}[y] - y_0)^2 + k \mathrm{Var}(y) \) — bias squared plus variance. Taguchi's *robust parameter design* proceeds in two steps: first identify *control factors* that reduce variance without moving the mean (exploiting nonlinearity), then use remaining factors to adjust the mean to target. The *signal-to-noise ratio* \( \mathrm{SN} = -10 \log_{10}(\mathbb{E}[(y-y_0)^2]) \) is the empirical objective. Taguchi's orthogonal-array experimental plans are efficient designs for estimating SN in the presence of noise factors.

The philosophical contribution — design to be insensitive to noise rather than to block it out — is the unifying theme connecting robust optimization, RBDO, and yield optimization.

## 13. Decision Analysis and the Value of Information

Decision analysis, in the von Neumann–Morgenstern tradition, treats the choice of \( x \) as maximizing expected utility \( \mathbb{E}[u(W(x, \tilde{\xi}))] \), where \( u \) is a concave utility function encoding risk aversion. Two side-quantities are invaluable.

*Expected value of perfect information.* The most one should pay to eliminate all uncertainty about \( \tilde{\xi} \) before choosing \( x \):

\[
\mathrm{EVPI} = \mathbb{E}_{\tilde{\xi}}\!\left[ \max_x u(W(x, \tilde{\xi})) \right] - \max_x \mathbb{E}_{\tilde{\xi}}[u(W(x, \tilde{\xi}))].
\]

*Expected value of sample information.* The value of observing a noisy signal \( \tilde{Z} \) correlated with \( \tilde{\xi} \) before deciding. \( \mathrm{EVSI} \le \mathrm{EVPI} \), and comparing \( \mathrm{EVSI} \) to the cost of collecting the sample is the decision-theoretic basis for experiment design and data-collection planning.

## 14. Monte Carlo Methods and Variance Reduction

Every sample-based approach — SAA, scenario approach, SDDP, MC RBDO — rests on Monte Carlo estimation of an expectation. Plain Monte Carlo has standard error \( \sigma / \sqrt{N} \). Four variance-reduction techniques routinely pay large dividends.

### 14.1 Antithetic variates

For symmetric distributions, pair each sample \( \xi^n \) with its antithetic \( -\xi^n \). If \( h \) is monotone the two evaluations are negatively correlated, and their average has smaller variance than two independent samples.

### 14.2 Control variates

If \( h(\tilde{\xi}) \) is correlated with some \( c(\tilde{\xi}) \) whose mean is known, estimate \( \mathbb{E}[h] \) by \( \bar{h} + \beta (\bar{c} - \mathbb{E}[c]) \) with \( \beta \) chosen to minimize variance. The variance reduction factor is \( 1 - \mathrm{corr}(h, c)^2 \).

### 14.3 Stratified sampling

Partition the sample space into strata \( \Xi_1, \ldots, \Xi_K \) with probabilities \( p_k \) and draw \( N_k \) samples within each. Stratification can only reduce variance. Latin hypercube sampling is a popular multidimensional stratification.

### 14.4 Importance sampling

If the event of interest is rare, sample from a *proposal* density \( q \) that makes it common, then re-weight by the likelihood ratio:

\[
\mathbb{E}_p[h(\tilde{\xi})] = \mathbb{E}_q\!\left[ h(\tilde{\xi}) \, \frac{p(\tilde{\xi})}{q(\tilde{\xi})} \right].
\]

For rare-event reliability analysis — \( p_f \sim 10^{-6} \) — importance sampling can reduce the required \( N \) by three to six orders of magnitude. Choosing \( q \) is itself an optimization problem; the zero-variance optimum \( q^\star(\xi) \propto p(\xi) \lvert h(\xi) \rvert \) is unattainable but guides practical approximations (cross-entropy method, subset simulation).

## 15. Canonical Applications

### 15.1 Water reservoir management

A reservoir's state is its storage \( s_t \). Stochastic inflows \( \tilde{I}_t \) arrive; releases \( r_t \) are decided to meet downstream demand and hydropower targets. Constraints include minimum environmental flow, maximum spillway discharge, and storage bounds. The Bellman formulation,

\[
V_t(s_t) = \min_{r_t} \;\; \mathbb{E}_{\tilde{I}_{t+1}} \!\left[ c_t(s_t, r_t, \tilde{I}_{t+1}) + V_{t+1}(s_t + \tilde{I}_{t+1} - r_t) \right],
\]

is the archetype for SDDP. Pereira and Pinto's application to the Brazilian interconnected hydroelectric system remains the paradigmatic large-scale success story.

### 15.2 Energy capacity expansion

Plan generation capacity over a 20- to 40-year horizon under uncertainty in load growth, fuel prices, carbon policy, and renewable availability. A two-stage or multi-stage stochastic program with investment (first stage) and dispatch (recourse) is standard. Chance constraints enforce reserve margin and reliability targets.

### 15.3 Portfolio optimization

Markowitz mean-variance, Rockafellar-Uryasev CVaR, and Ben-Tal-Nemirovski robust portfolio models all live here. The decision \( x \) is a vector of portfolio weights; \( \tilde{\xi} \) is the vector of asset returns. The typical industrial formulation is mean-CVaR,

\[
\max_{x \in \Delta} \;\; \mathbb{E}[r^\top x] - \lambda \, \mathrm{CVaR}_\alpha(-r^\top x),
\]

solved by the Rockafellar-Uryasev LP reformulation over Monte Carlo return scenarios.

### 15.4 Supply-chain network design

Locate warehouses, allocate capacity, and route flow under uncertain demand and disruption. Two-stage mixed-integer stochastic programs — integer location variables in stage one, continuous flow variables in stage two — are the canonical formulation. Benders decomposition and progressive hedging are standard solvers.

### 15.5 Manufacturing tolerancing

Allocate \( \pm t_j \) tolerances to components of an assembly subject to a stackup specification, minimizing manufacturing cost (which grows as \( 1/t_j \) or similar) while maintaining target yield. Taguchi robust parameter design and statistical tolerance analysis combine to give the industry-standard workflow.

## 16. Putting It All Together

A mature approach to design under uncertainty proceeds through four decisions, in order.

<div style="border-left: 4px solid #2a6099; padding: 0.6em 1em; background: #f0f6fc; margin: 1em 0;"><strong>The four modelling choices.</strong> <em>(1) What is uncertain, and is it aleatory or epistemic?</em> This determines whether SP, RO, or DRO is the right framework. <em>(2) What is the information structure?</em> Static, two-stage, or multi-stage — this selects the class of mathematical program. <em>(3) What risk functional?</em> Expectation, CVaR, chance constraint, or worst-case — this encodes the engineering risk posture. <em>(4) How will the distribution or uncertainty set be calibrated from data?</em> This is the statistics half of the problem.</div>

A checklist for any concrete project:

- Identify the random vector \( \tilde{\xi} \) and sources of variation. Distinguish aleatory (characterize with a distribution) from epistemic (hedge with an uncertainty set or ambiguity set).
- Decide stage structure. If decisions must be made before data arrives, use a stochastic-programming framework. If the decision is once-and-for-all with adversarial uncertainty, use robust optimization.
- Select a risk measure aligned with the engineering objective. "Do not exceed budget with probability 95 %" is a chance constraint. "Do not ruin us in the worst 5 % tail" is CVaR. "Never fail" is worst-case.
- Choose a solution method. If the scenario count is modest, use the extensive form. If it is large, decompose. If the distribution is continuous and high-dimensional, use SAA, SDDP, or DRO with the Wasserstein ball.
- Validate *out of sample*. The cardinal sin of stochastic optimization is to report the in-sample objective value. Compute expected objective, tail risk, and chance-constraint satisfaction on an independent test set or a freshly generated scenario pool.

### 16.1 Bias, variance, and optimizer's curse

Sample-based optimization introduces an *optimizer's curse*: the in-sample optimum is upward-biased in the maximization sense (or downward-biased in minimization) because the optimizer capitalizes on sampling noise. Honest performance estimation requires either held-out scenarios, bootstrap bias correction, or tighter confidence-interval construction (e.g., Mak-Morton-Wood multi-replication procedures).

### 16.2 When uncertainty is well-modelled, and when it is not

A dirty secret is that the quality of an uncertainty model often dominates the cleverness of the optimization. Ten thousand scenarios drawn from a wrong distribution can produce a plan far worse than ten scenarios drawn from a right one. DRO — by admitting that the distribution itself is uncertain — is in part a response to this. So is careful model validation: back-testing scenario generators against held-out history, assessing moments, tails, and dependence; using sensitivity analysis on nuisance parameters; reporting results across a small ensemble of plausible distribution models.

### 16.3 Summary

Design optimization under probabilistic uncertainty is a substantial departure from deterministic optimization, both conceptually and computationally. Conceptually, the optimizer must commit to a stance on randomness — risk-neutral vs risk-averse, probabilistic vs set-based, single-distribution vs distributionally ambiguous. Computationally, the problem can be orders of magnitude larger than its deterministic counterpart, and tractability hinges on exploiting structure: convexity of expected recourse, low-rank scenario representations, closed-form robust counterparts, moment- or Wasserstein-based reformulations.

The payoff is considerable. A plan that is explicitly robust to uncertainty is not only safer, it is often cheaper in expectation than a plan designed as if the nominal case were certain. The value of the stochastic solution is routinely double-digit percent in realistic problems, and can be qualitative — the difference between a dam that overflows once a decade and one that never does, between a chip that yields 70 % and one that yields 99 %, between a portfolio that survives a crisis and one that does not.

Every design decision is, in the end, made with incomplete information. SYDE 531 argues that the information's incompleteness should be part of the mathematical model, not an afterthought applied to its solution.
