---
title: "ECON 290: Models of Choice in Competitive Markets"
prof: "Ryan George"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Nechyba, Thomas J. *Microeconomics: An Intuitive Approach with Calculus*. South-Western Cengage Learning, 2011 (1st ed.) / 2017 (2nd ed.).

**Supplementary texts** — Varian, Hal R. *Intermediate Microeconomics: A Modern Approach*, 9th ed. Norton, 2014. Perloff, Jeffrey M. *Microeconomics: Theory and Applications with Calculus*, 4th ed. Pearson, 2018.

**Online resources** — MIT OpenCourseWare 14.01 (Principles of Microeconomics); MIT OCW 14.03 (Microeconomic Theory and Public Policy); Osborne & Rubinstein, *Models in Microeconomic Theory* (open access at economics.huji.ac.il).

---

# Chapter 1: Budget Sets and Consumer Choice

## 1.1 The Consumer's Problem

The starting point of consumer theory is a precise description of what a consumer *can* afford. A consumer has **income** \( I \) (or wealth \( w \)) and faces prices \( p_x \) and \( p_y \) for two goods \( x \) and \( y \). The **budget constraint** is the inequality

\[
p_x x + p_y y \leq I.
\]

The set of all bundles satisfying this constraint is the **budget set**. Its upper boundary is the **budget line**

\[
p_x x + p_y y = I,
\]

which can be written as \( y = \frac{I}{p_y} - \frac{p_x}{p_y} x \). The slope of the budget line is \( -p_x/p_y \), the **price ratio**, which measures the market's rate of substitution between the two goods.

<div class="definition">
<strong>Budget Set:</strong> Given income <em>I</em> and prices <em>p<sub>x</sub></em>, <em>p<sub>y</sub></em> &gt; 0, the budget set is

\[
B(p_x, p_y, I) = \left\{ (x,y) \in \mathbb{R}^2_+ : p_x x + p_y y \leq I \right\}.
\]
The budget line is the boundary where the constraint holds with equality.
</div>

### 1.1.1 Comparative Statics on the Budget Set

When income rises (holding prices fixed), the budget line shifts outward in a parallel fashion — both intercepts increase proportionally. When the price of good \( x \) rises, the horizontal intercept \( I/p_x \) falls while the vertical intercept \( I/p_y \) is unchanged; the budget line rotates inward around the vertical intercept. These observations motivate the study of **income effects** and **substitution effects** that will be developed fully in Chapter 3.

## 1.2 Multi-Good and Composite Commodity

With \( n \) goods, the budget constraint generalizes to \( \sum_{i=1}^n p_i x_i \leq I \). A common simplification uses the **composite commodity** theorem: if a consumer spends on many goods but we focus on one (say \( x \)), all other spending can be lumped into a single numeraire good \( y \) with price normalized to one. This reduces the problem to two dimensions without loss of generality when relative prices within the composite are fixed.

---

# Chapter 2: Preferences and Utility

## 2.1 Preference Relations

A **preference relation** \( \succcurlyeq \) on a consumption set \( X \subseteq \mathbb{R}^n_+ \) captures how a consumer ranks bundles. We write \( (x_1, x_2) \succcurlyeq (y_1, y_2) \) to mean "the \( x \)-bundle is at least as good as the \( y \)-bundle." Two derived relations: **strict preference** \( \succ \) (preferred) and **indifference** \( \sim \) (equally preferred).

<div class="definition">
<strong>Standard Preference Axioms:</strong>
<ol>
<li><strong>Completeness:</strong> For any two bundles <em>A</em> and <em>B</em>, either <em>A</em> ≽ <em>B</em> or <em>B</em> ≽ <em>A</em> (or both).</li>
<li><strong>Transitivity:</strong> If <em>A</em> ≽ <em>B</em> and <em>B</em> ≽ <em>C</em>, then <em>A</em> ≽ <em>C</em>.</li>
<li><strong>Monotonicity:</strong> More is better — if <em>x</em> ≥ <em>y</em> componentwise with at least one strict inequality, then <em>x</em> ≻ <em>y</em>.</li>
<li><strong>Convexity:</strong> Averages are at least as good as extremes — if <em>A</em> ~ <em>B</em>, then the mixture λ<em>A</em> + (1−λ)<em>B</em> ≽ <em>A</em> for λ ∈ (0,1).</li>
</ol>
</div>

## 2.2 Utility Functions and Indifference Curves

If preferences satisfy completeness, transitivity, and continuity, then by the **utility representation theorem** (Debreu 1954) there exists a continuous **utility function** \( U: \mathbb{R}^n_+ \to \mathbb{R} \) such that

\[
A \succcurlyeq B \iff U(A) \geq U(B).
\]

An **indifference curve** is the level set \( \{(x,y) : U(x,y) = \bar{u}\} \). Under monotonicity, higher indifference curves represent higher utility. Under strict convexity, each indifference curve bows toward the origin.

### 2.2.1 The Marginal Rate of Substitution

<div class="definition">
<strong>Marginal Rate of Substitution (MRS):</strong> At any bundle, the MRS of <em>x</em> for <em>y</em> is the magnitude of the slope of the indifference curve:

\[
MRS_{xy} = -\frac{dy}{dx}\bigg|_{U=\bar{u}} = \frac{MU_x}{MU_y} = \frac{\partial U/\partial x}{\partial U/\partial y}.
\]
It measures the rate at which the consumer is <em>willing</em> to trade <em>y</em> for one additional unit of <em>x</em>.
</div>

Under convexity the MRS is **diminishing** as \( x \) increases along an indifference curve — reflecting the intuition that as a consumer has more of \( x \) they are willing to give up less \( y \) to obtain another unit.

## 2.3 Common Utility Functions

| Preference Type | Utility Function | Indifference Curves |
|---|---|---|
| Cobb-Douglas | \( U(x,y) = x^\alpha y^\beta \) | Smooth, convex curves |
| Perfect substitutes | \( U(x,y) = ax + by \) | Straight lines |
| Perfect complements | \( U(x,y) = \min(ax, by) \) | Right angles (L-shaped) |
| Quasi-linear | \( U(x,y) = v(x) + y \) | Horizontal shifts of same curve |
| CES | \( U(x,y) = (x^\rho + y^\rho)^{1/\rho} \) | Smooth, nests others |

For **Cobb-Douglas** preferences \( U(x,y) = x^\alpha y^\beta \), the MRS is

\[
MRS_{xy} = \frac{\alpha y}{\beta x}.
\]

---

# Chapter 3: Optimal Household Choice

## 3.1 The Utility Maximization Problem

The consumer chooses the bundle in the budget set that maximizes utility. The **utility maximization problem (UMP)** is

\[
\max_{x,y} \; U(x,y) \quad \text{subject to} \quad p_x x + p_y y = I.
\]

Using the **Lagrangian method**, define

\[
\mathcal{L}(x, y, \lambda) = U(x,y) - \lambda(p_x x + p_y y - I).
\]

The first-order conditions (assuming an interior solution) are

\[
\frac{\partial \mathcal{L}}{\partial x} = \frac{\partial U}{\partial x} - \lambda p_x = 0,
\]

\[
\frac{\partial \mathcal{L}}{\partial y} = \frac{\partial U}{\partial y} - \lambda p_y = 0,
\]

\[
\frac{\partial \mathcal{L}}{\partial \lambda} = p_x x + p_y y - I = 0.
\]

Dividing the first two conditions gives the key **optimality condition**:

\[
\frac{MU_x}{MU_y} = \frac{p_x}{p_y}, \quad \text{i.e.,} \quad MRS_{xy} = \frac{p_x}{p_y}.
\]

<div class="theorem">
<strong>Optimality Condition:</strong> At an interior optimum, the consumer equates the marginal rate of substitution to the price ratio. Intuitively, the rate at which the consumer is <em>willing</em> to trade <em>y</em> for <em>x</em> (the MRS) equals the rate at which the market <em>allows</em> the trade (the price ratio). If MRS &gt; p<sub>x</sub>/p<sub>y</sub>, the consumer would gain utility by consuming more <em>x</em> and less <em>y</em>.
</div>

### 3.1.1 Worked Example: Cobb-Douglas

Let \( U(x,y) = x^\alpha y^{1-\alpha} \), \( p_x = p \), \( p_y = q \), income \( I \). The MRS condition gives

\[
\frac{\alpha y}{(1-\alpha) x} = \frac{p}{q} \implies y = \frac{(1-\alpha) p x}{q \alpha}.
\]

Substituting into the budget constraint:

\[
px + q \cdot \frac{(1-\alpha) p x}{q \alpha} = I \implies px \cdot \frac{1}{\alpha} = I \implies x^* = \frac{\alpha I}{p}.
\]

Similarly, \( y^* = \frac{(1-\alpha) I}{q} \). The consumer spends share \( \alpha \) of income on \( x \) and share \( 1-\alpha \) on \( y \) — the classic **constant expenditure share** property of Cobb-Douglas preferences.

## 3.2 Corner Solutions

When the MRS condition has no interior solution, the optimum may be a **corner solution** where one good is not consumed. For perfect substitutes \( U = ax + by \):

- If \( a/b > p_x/p_y \), the consumer buys only \( x \): \( x^* = I/p_x, y^* = 0 \).
- If \( a/b < p_x/p_y \), the consumer buys only \( y \): \( x^* = 0, y^* = I/p_y \).

---

# Chapter 4: Demand Functions and Their Properties

## 4.1 Ordinary (Marshallian) Demand

Solving the UMP for every income and price combination yields **Marshallian demand functions** \( x^*(p_x, p_y, I) \) and \( y^*(p_x, p_y, I) \). These show how the quantity demanded responds to changes in prices and income.

### 4.1.1 Homogeneity of Degree Zero

Demand functions are **homogeneous of degree zero** in \( (p_x, p_y, I) \): doubling all prices and income leaves the budget set unchanged, so the demand bundle is unchanged. Formally:

\[
x^*(\lambda p_x, \lambda p_y, \lambda I) = x^*(p_x, p_y, I) \quad \forall \lambda > 0.
\]

This reflects the absence of **money illusion**.

## 4.2 Income and Substitution Effects: The Slutsky Decomposition

A price change has two separable effects on demand:

1. **Substitution effect:** Holding utility constant at the original level, how does the relative price change alter the bundle? This is always negative for own-price changes (by the negative semidefiniteness of the substitution matrix).

2. **Income effect:** The price change alters real purchasing power; the consumer adjusts as if income had changed.

<div class="theorem">
<strong>Slutsky Equation:</strong> For good <em>x</em> and a change in price <em>p<sub>x</sub></em>:

\[
\frac{\partial x^*}{\partial p_x} = \underbrace{\frac{\partial h_x}{\partial p_x}}_{\text{substitution effect}} - \underbrace{x^* \frac{\partial x^*}{\partial I}}_{\text{income effect}},
\]
where <em>h<sub>x</sub></em>(p<sub>x</sub>, p<sub>y</sub>, ū) is the Hicksian (compensated) demand.
</div>

### 4.2.1 Normal, Inferior, and Giffen Goods

<div class="definition">
<strong>Good Classifications:</strong>
<ul>
<li><strong>Normal good:</strong> ∂x*/∂I &gt; 0 — demand rises with income.</li>
<li><strong>Inferior good:</strong> ∂x*/∂I &lt; 0 — demand falls with income (e.g., cheap food staples).</li>
<li><strong>Giffen good:</strong> A strongly inferior good whose income effect dominates the substitution effect, so ∂x*/∂p<sub>x</sub> &gt; 0 — the demand curve slopes upward. Giffen goods are theoretically possible but empirically rare.</li>
</ul>
</div>

## 4.3 The Engel Curve and Income Expansion Path

Holding prices fixed, the **Engel curve** traces how demand for a good changes as income varies: \( x = x^*(p_x, p_y, I) \) with \( p_x, p_y \) fixed. The **income expansion path** traces the optimal bundle in \( (x,y) \)-space as income increases.

## 4.4 Cross-Price Elasticities and Substitutes/Complements

The **cross-price elasticity** \( \varepsilon_{xy} = \frac{\partial x^*}{\partial p_y} \cdot \frac{p_y}{x^*} \) measures how demand for \( x \) responds to a change in the price of \( y \). When \( \varepsilon_{xy} > 0 \), the goods are **substitutes** (e.g., butter and margarine); when \( \varepsilon_{xy} < 0 \), they are **complements** (e.g., coffee and cream).

---

# Chapter 5: Intertemporal Choice

## 5.1 Two-Period Model

Consider a consumer who lives for two periods, earning income \( I_1 \) in period 1 and \( I_2 \) in period 2. Denote consumption in each period by \( c_1 \) and \( c_2 \). If the real interest rate is \( r \), a dollar saved in period 1 becomes \( 1+r \) dollars in period 2. The **intertemporal budget constraint** is

\[
c_1 + \frac{c_2}{1+r} = I_1 + \frac{I_2}{1+r} \equiv W,
\]

where \( W \) is **lifetime wealth** (the present value of lifetime income). The price of period-2 consumption in terms of period-1 consumption is \( 1/(1+r) \).

<div class="example">
<strong>Saver vs. Borrower:</strong> If the consumer saves in period 1 (i.e., c<sub>1</sub> &lt; I<sub>1</sub>), they accumulate assets and consume more than I<sub>2</sub> in period 2. If they borrow (c<sub>1</sub> &gt; I<sub>1</sub>), they reduce future consumption. The optimal intertemporal allocation equates the marginal rate of intertemporal substitution (MRIS) to the gross interest rate 1+r.
</div>

## 5.2 Optimal Intertemporal Allocation

With utility \( U(c_1, c_2) \), the first-order condition is

\[
\frac{MU_{c_1}}{MU_{c_2}} = 1 + r.
\]

For the common specification \( U(c_1, c_2) = u(c_1) + \delta \, u(c_2) \), where \( \delta \in (0,1) \) is the **discount factor** (reflecting impatience), the condition becomes

\[
\frac{u'(c_1)}{\delta \, u'(c_2)} = 1 + r \implies u'(c_1) = \delta(1+r) \, u'(c_2).
\]

When \( \delta(1+r) = 1 \), the consumer chooses **consumption smoothing**: \( c_1 = c_2 \). When the interest rate is high relative to impatience, future consumption is cheap and the consumer saves more.

## 5.3 Effect of Interest Rate Changes

A rise in \( r \) has two effects on saving:

- **Substitution effect:** Period-2 consumption becomes relatively cheaper, encouraging saving (positive effect on saving).
- **Income effect:** For a saver, a higher \( r \) raises lifetime wealth, which may increase \( c_1 \) (negative effect on saving). The net effect is theoretically ambiguous for savers, but for borrowers both effects reduce current consumption.

---

# Chapter 6: Producer Theory — Technology and Long-Run Choices

## 6.1 Production Technology

A **production function** \( q = f(K, L) \) describes the maximum output \( q \) achievable from capital \( K \) and labor \( L \). Key concepts:

<div class="definition">
<strong>Marginal Product:</strong> The marginal product of labor is MP<sub>L</sub> = ∂f/∂L — the additional output from one more unit of labor, holding capital fixed. Diminishing marginal product means MP<sub>L</sub> falls as <em>L</em> increases (∂²f/∂L² &lt; 0).
</div>

The **marginal rate of technical substitution (MRTS)** along an isoquant is

\[
MRTS_{LK} = -\frac{dK}{dL}\bigg|_{q=\bar{q}} = \frac{MP_L}{MP_K}.
\]

It measures the rate at which capital can be substituted for labor while keeping output constant.

## 6.2 Returns to Scale

<div class="definition">
<strong>Returns to Scale:</strong> For a scalar λ &gt; 1:
<ul>
<li><strong>Constant returns to scale (CRS):</strong> f(λK, λL) = λ f(K, L).</li>
<li><strong>Increasing returns to scale (IRS):</strong> f(λK, λL) &gt; λ f(K, L).</li>
<li><strong>Decreasing returns to scale (DRS):</strong> f(λK, λL) &lt; λ f(K, L).</li>
</ul>
</div>

The **Cobb-Douglas production function** \( q = K^\alpha L^\beta \) exhibits CRS when \( \alpha + \beta = 1 \), IRS when \( \alpha + \beta > 1 \), and DRS when \( \alpha + \beta < 1 \).

## 6.3 Cost Minimization in the Long Run

A cost-minimizing firm chooses inputs to produce output \( \bar{q} \) at minimum cost. With input prices \( r \) (rental rate of capital) and \( w \) (wage), the problem is

\[
\min_{K,L} \; rK + wL \quad \text{subject to} \quad f(K,L) \geq \bar{q}.
\]

The Lagrangian approach yields the optimality condition

\[
\frac{MP_L}{MP_K} = \frac{w}{r}, \quad \text{i.e.,} \quad MRTS_{LK} = \frac{w}{r}.
\]

This is the **cost-minimization condition**: the firm equates the rate at which technology allows substitution between inputs to the price ratio of those inputs. Solving gives the **conditional factor demands** \( K^c(\bar{q}, r, w) \) and \( L^c(\bar{q}, r, w) \), and substituting back yields the **long-run total cost function** \( C(\bar{q}) = r K^c + w L^c \).

---

# Chapter 7: Short-Run Choices of the Firm

## 7.1 Short-Run vs. Long-Run

In the **short run**, at least one input (typically capital) is fixed. The firm can only adjust the variable input (labor). Let \( \bar{K} \) be the fixed capital stock. The short-run production function is \( q = f(\bar{K}, L) \), a function of labor alone.

**Short-run costs** decompose as:

\[
C^{SR}(q) = \underbrace{r\bar{K}}_{\text{fixed cost (FC)}} + \underbrace{w L(q, \bar{K})}_{\text{variable cost (VC)}}.
\]

The **short-run marginal cost** is

\[
MC^{SR}(q) = \frac{d \, VC}{dq} = \frac{w}{MP_L}.
\]

As \( L \) increases with diminishing marginal product, \( MP_L \) falls and \( MC^{SR} \) rises — hence the U-shaped cost curves familiar from introductory economics.

## 7.2 Profit Maximization

A price-taking firm maximizes profit

\[
\pi(q) = P \cdot q - C(q).
\]

The first-order condition is

\[
P = MC(q),
\]

interpreted as: produce up to the point where the price received equals the marginal cost of the last unit. This is the firm's **supply condition**.

<div class="theorem">
<strong>Competitive Supply Rule:</strong> A price-taking firm maximizes profit by setting price equal to marginal cost: P = MC(q*). The firm shuts down if P &lt; min AVC (average variable cost) in the short run, or P &lt; min AC in the long run.
</div>

## 7.3 The Supply Curve

Tracing out the profit-maximizing \( q^*(P) \) for all prices \( P \geq \min AVC \) gives the **short-run supply curve**, which coincides with the MC curve above AVC. The **long-run supply curve** coincides with the MC curve above AC.

---

# Chapter 8: Choice under Uncertainty

## 8.1 States of the World and State-Contingent Consumption

Uncertainty can be modeled as a set of **states of the world** \( S = \{s_1, s_2, \ldots\} \), each with probability \( \pi_s \). A **lottery** \( L = (c_1, c_2; \pi, 1-\pi) \) delivers consumption \( c_1 \) with probability \( \pi \) and \( c_2 \) with probability \( 1-\pi \). The consumer's choice over state-contingent consumption plans is analyzed like ordinary consumer theory, with states playing the role of goods.

## 8.2 Expected Utility Theory

The **von Neumann-Morgenstern expected utility (EU) framework** represents preferences over lotteries by

\[
EU(L) = \pi \, u(c_1) + (1-\pi) \, u(c_2),
\]

where \( u(\cdot) \) is the **Bernoulli (cardinal) utility function** and EU is a weighted average of utilities.

<div class="definition">
<strong>Risk Attitudes:</strong>
<ul>
<li><strong>Risk averse:</strong> u is strictly concave — u''(c) &lt; 0. Prefers the expected value of a lottery to the lottery itself. Willing to pay a risk premium to avoid uncertainty.</li>
<li><strong>Risk neutral:</strong> u is linear — u''(c) = 0. Indifferent between the lottery and its expected value.</li>
<li><strong>Risk loving:</strong> u is strictly convex — u''(c) &gt; 0. Prefers the lottery to receiving its expected value for certain.</li>
</ul>
</div>

## 8.3 The Demand for Insurance

A risk-averse individual with initial wealth \( W \), facing a loss \( L \) with probability \( \pi \), will willingly purchase **actuarially fair insurance** that pays \( L \) in the bad state in exchange for a premium \( \pi L \). The optimal choice is **full insurance** — equalizing consumption across states — because:

\[
EU'(c_{bad}) = EU'(c_{good}) \implies c_{bad} = c_{good}.
\]

If insurance is actuarially unfair (the premium exceeds \( \pi L \)), the consumer may partially insure or self-insure. The **Arrow-Pratt measure of risk aversion** \( \rho(c) = -u''(c)/u'(c) \) quantifies how intensely a consumer dislikes risk.

### 8.3.1 Worked Example: CARA Utility

For **CARA (constant absolute risk aversion)** utility \( u(c) = -e^{-\alpha c} \), the optimal insurance demand does not depend on wealth level. For **CRRA (constant relative risk aversion)** utility \( u(c) = c^{1-\gamma}/(1-\gamma) \), the ratio of insurance purchased to wealth is constant.

## 8.4 The State-Contingent Budget Set

In two-state models, the state-contingent budget constraint maps insurance choice onto an Edgeworth-style diagram. The **certainty line** is the 45-degree line where \( c_{good} = c_{bad} \). A risk-averse consumer optimizes on this line when insurance is actuarially fair. The slope of the budget line in state-space equals \( -(1-\pi)/\pi \), the odds ratio.

---

# Chapter 9: Competitive Equilibrium Overview

## 9.1 From Individual to Market

Adding up individual demand curves across all consumers yields **market demand** \( Q^D(P) = \sum_i x_i^*(P, I_i) \). Adding up individual supply curves across all firms yields **market supply** \( Q^S(P) = \sum_j q_j^*(P) \). A **competitive (Walrasian) equilibrium** price \( P^* \) clears the market:

\[
Q^D(P^*) = Q^S(P^*).
\]

## 9.2 Welfare Analysis

**Consumer surplus (CS)** is the area under the demand curve and above the price. **Producer surplus (PS)** is the area above the supply curve and below the price. **Total surplus (TS) = CS + PS** measures the total gains from trade at a given price. Competitive equilibrium maximizes total surplus — an observation that foreshadows the welfare theorems studied in ECON 391.

**Deadweight loss (DWL)** arises when market price deviates from the competitive equilibrium, reducing total surplus. Taxes, price ceilings, and price floors all create DWL by preventing some mutually beneficial trades.

<div class="example">
<strong>Per-Unit Tax:</strong> A per-unit tax τ on producers shifts the supply curve up by τ. The new equilibrium price rises (by less than τ if demand is elastic), quantity falls, and DWL equals ½ × τ × ΔQ — the triangular area of lost surplus. The incidence of the tax (who bears the burden) depends on the relative elasticities of supply and demand.
</div>

---

# Chapter 10: Synthesis and Key Themes

This course establishes the micro-foundations of economics by formalizing three pillars:

1. **Consumer theory:** Utility maximization subject to a budget constraint, yielding demand functions with precise properties (homogeneity, Slutsky symmetry, downward-sloping compensated demand).

2. **Producer theory:** Cost minimization and profit maximization, yielding cost functions and supply curves that reflect underlying technology.

3. **Market equilibrium:** The interaction of supply and demand determines prices and quantities; welfare analysis evaluates outcomes through the lens of consumer and producer surplus.

The constrained-optimization machinery developed here — Lagrangians, first-order conditions, envelope theorems — carries forward to every subsequent course in economics. The central insight is that rational economic agents respond predictably and continuously to changes in prices, income, and technology, enabling economists to derive quantitative predictions about behavior.
