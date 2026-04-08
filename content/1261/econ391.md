---
title: "ECON 391: Equilibrium in Market Economies"
prof: "Jean Guillaume Forand"
subjects: "ECON"
---

## Sources and References

**Supplementary texts** — Varian, Hal R. *Intermediate Microeconomics: A Modern Approach*, 9th ed. Norton, 2014. Nechyba, Thomas J. *Microeconomics: An Intuitive Approach with Calculus*, South-Western, 2011. Perloff, Jeffrey M. *Microeconomics: Theory and Applications with Calculus*, 4th ed. Pearson, 2018. Eaton, Eaton, and Allen, *Microeconomics: Theory with Applications*.

**Online resources** — MIT OCW 14.04 (Intermediate Microeconomic Theory); Andreu Mas-Colell, Michael Whinston, and Jerry Green, *Microeconomic Theory* (MWG), Oxford, 1995 (graduate reference for proofs); Arrow, K.J. and G. Debreu, "Existence of an Equilibrium for a Competitive Economy," *Econometrica*, 1954.

---

# Chapter 1: Exchange Economies

## 1.1 The Pure Exchange Setting

An **exchange economy** contains no production — there is a fixed endowment of goods that consumers trade among themselves. This stripped-down setting isolates the logic of markets without the added complexity of production.

Let there be \( I \) consumers and \( L \) goods. Consumer \( i \) is endowed with a bundle \( \omega_i = (\omega_{i1}, \ldots, \omega_{iL}) \) of the \( L \) goods. The **aggregate endowment** is \( \bar{\omega}_\ell = \sum_i \omega_{i\ell} \) for each good \( \ell \). Consumers have continuous, monotone, strictly convex preferences represented by utility functions \( u_i(\cdot) \).

### 1.1.1 Feasibility

An **allocation** is a collection \( (x_1, \ldots, x_I) \) specifying each consumer's consumption bundle. An allocation is **feasible** if it does not use more than the available endowment:

\[ \sum_{i=1}^I x_{i\ell} \leq \sum_{i=1}^I \omega_{i\ell} \quad \forall \ell = 1, \ldots, L. \]

## 1.2 Competitive Equilibrium in Exchange Economies

Consumers sell their endowments at market prices and use the revenue to purchase their optimal consumption bundles. Let \( p = (p_1, \ldots, p_L) \in \mathbb{R}^L_+ \) be the price vector. Consumer \( i \)'s **wealth** is \( w_i = p \cdot \omega_i = \sum_\ell p_\ell \omega_{i\ell} \).

<div class="definition">
<strong>Walrasian (Competitive) Equilibrium:</strong> A price vector <em>p*</em> and allocation <em>(x<sub>1</sub>*, ..., x<sub>I</sub>*)</em> constitute a Walrasian equilibrium if:
<ol>
<li><strong>Optimization:</strong> For each consumer <em>i</em>, x<sub>i</sub>* solves max u<sub>i</sub>(x<sub>i</sub>) subject to p* · x<sub>i</sub> ≤ p* · ω<sub>i</sub>.</li>
<li><strong>Market clearing:</strong> For each good ℓ, ∑<sub>i</sub> x<sub>iℓ</sub>* = ∑<sub>i</sub> ω<sub>iℓ</sub>.</li>
</ol>
</div>

### 1.2.1 Walras's Law

A fundamental identity: at any prices \( p \), the total value of excess demand equals zero:

\[ \sum_{\ell=1}^L p_\ell \left( \sum_{i=1}^I x_{i\ell}(p) - \sum_{i=1}^I \omega_{i\ell} \right) = 0. \]

This follows because each consumer satisfies their budget constraint with equality (by monotonicity). **Walras's law** implies that if \( L-1 \) markets clear, the \( L \)-th market clears automatically. Thus only \( L-1 \) prices need to be determined; one good can serve as **numeraire** (its price normalized to 1).

### 1.2.2 The Edgeworth Box

For two consumers (A and B) and two goods (\( x \) and \( y \)), the **Edgeworth box** provides a complete geometric representation:

- The dimensions of the box equal the aggregate endowments \( \bar\omega_x \) and \( \bar\omega_y \).
- Consumer A's consumption is measured from the bottom-left corner; Consumer B's from the top-right corner.
- The endowment point \( \omega = (\omega_A, \omega_B) \) lies in the interior.
- Each consumer's indifference curves are drawn from their respective origins.

A Walrasian equilibrium corresponds to a price ratio \( p_x/p_y \) (the slope of the budget line through the endowment) at which each consumer's demand equals their respective optimum, and the two optimal bundles sum to the aggregate endowment.

### 1.2.3 Application: Intertemporal Consumption and Interest Rates

The two-period model from ECON 290 can be recast as a two-good exchange economy. Good 1 is period-1 consumption; good 2 is period-2 consumption. Each consumer's endowment is their income stream \( (\omega_1^i, \omega_2^i) \). The relative price \( p_1/p_2 \) equals the **gross interest rate** \( 1+r \). The equilibrium interest rate is determined by the condition that aggregate saving (excess supply of good 1) equals aggregate borrowing (excess demand of good 2).

<div class="example">
<strong>Interest Rate Determination:</strong> Suppose two consumers each have income ω<sub>1</sub> = ω<sub>2</sub> = 1. Consumer A has discount factor δ<sub>A</sub> = 0.9 (patient); Consumer B has δ<sub>B</sub> = 0.8 (impatient). In equilibrium, A saves and B borrows. The equilibrium interest rate adjusts until A's saving exactly finances B's borrowing. Patient consumers push the interest rate down by supplying savings; impatient consumers push it up by demanding loans.
</div>

---

# Chapter 2: Welfare Analysis

## 2.1 Pareto Efficiency

The key normative concept in welfare economics is **Pareto efficiency** — an allocation criterion that is both powerful and limited.

<div class="definition">
<strong>Pareto Efficiency:</strong> An allocation (x<sub>1</sub>*, ..., x<sub>I</sub>*) is <strong>Pareto efficient</strong> (also called Pareto optimal) if there is no feasible alternative allocation that makes every consumer at least as well off and at least one consumer strictly better off. Equivalently, it is impossible to make someone better off without making someone else worse off.
</div>

### 2.1.1 The Contract Curve

In the Edgeworth box, the set of all Pareto-efficient allocations forms the **contract curve** (or Pareto set). An interior allocation is Pareto efficient if and only if the indifference curves of the two consumers are tangent, i.e.,

\[ MRS_A = MRS_B. \]

If \( MRS_A \neq MRS_B \), there exist mutually beneficial trades that can reallocate consumption and increase both consumers' utility. The contract curve runs from corner to corner of the Edgeworth box.

### 2.1.2 The Core

The **core** of an exchange economy is the set of feasible allocations that no group (coalition) of consumers can improve upon using only their own endowments. Every Walrasian equilibrium allocation lies in the core (**core equivalence**). As the number of agents grows large, the core shrinks toward the set of Walrasian equilibria — this is the **core convergence theorem**.

## 2.2 The First Welfare Theorem

<div class="theorem">
<strong>First Fundamental Theorem of Welfare Economics:</strong> If every consumer has locally non-satiated preferences, then every Walrasian equilibrium allocation is Pareto efficient.
</div>

**Proof sketch:** Suppose, by contradiction, that allocation \( (y_1, \ldots, y_I) \) Pareto-dominates the equilibrium allocation \( (x_1^*, \ldots, x_I^*) \). Then for every \( i \), \( u_i(y_i) \geq u_i(x_i^*) \), with strict inequality for at least one consumer. By optimization, each \( x_i^* \) was the best affordable bundle under prices \( p^* \), so \( u_i(y_i) \geq u_i(x_i^*) \) implies \( p^* \cdot y_i \geq p^* \cdot \omega_i \) for all \( i \), with strict inequality for the consumer who is made strictly better off. Summing over consumers: \( p^* \cdot \sum_i y_i > p^* \cdot \sum_i \omega_i \). But feasibility of \( (y_i) \) requires \( \sum_i y_i \leq \sum_i \omega_i \), a contradiction. \( \square \)

This theorem is a formal version of Adam Smith's "invisible hand" — decentralized price-taking behavior by self-interested agents achieves a socially efficient outcome, without any central planner.

### 2.2.1 Necessary Conditions for the First Welfare Theorem

The theorem requires:

1. **No externalities:** each consumer's utility depends only on their own consumption.
2. **No public goods:** all goods are rivalrous and excludable.
3. **Price-taking behavior:** no agent has market power.
4. **Complete markets:** markets exist for all goods (including future goods and contingent claims).

When these conditions fail, equilibrium may not be efficient — this is the topic of ECON 393.

## 2.3 The Second Welfare Theorem

The First Welfare Theorem establishes that markets are efficient; the Second addresses **distribution**.

<div class="theorem">
<strong>Second Fundamental Theorem of Welfare Economics:</strong> Under suitable convexity conditions on preferences and production sets, every Pareto-efficient allocation can be supported as a Walrasian equilibrium following an appropriate lump-sum redistribution of endowments (wealth).
</div>

**Interpretation:** Any socially desirable (Pareto-efficient) allocation can be achieved through competitive markets, provided the government can redistribute wealth lump-sum. This separates the efficiency question (leave it to markets) from the equity question (use lump-sum transfers). The theorem is a defense of market mechanisms even when the laissez-faire distribution is undesirable.

**Caveat:** The Second Welfare Theorem requires that preferences and production sets be convex. With non-convexities (increasing returns to scale, for instance), the theorem may fail.

### 2.3.1 Application: Taxes and Inefficiency

A **lump-sum tax** (a fixed payment independent of behavior) does not distort relative prices and hence does not create deadweight loss. By contrast, a **commodity tax** \( t \) on good \( x \) drives a wedge between the consumer price \( P + t \) and the producer price \( P \), creating a distortion:

\[ MRS = \frac{p_x + t}{p_y} \neq \frac{p_x}{p_y} = MRTS. \]

The consumer's marginal willingness to trade goods is misaligned with the production rate of transformation, generating inefficiency. This result motivates using lump-sum taxes over commodity taxes from a pure efficiency standpoint, although lump-sum taxes are practically difficult to implement.

---

# Chapter 3: Production Economies

## 3.1 Competitive Equilibrium with Production

A **production economy** augments the exchange model with firms that transform inputs into outputs. Let there be \( J \) firms. Firm \( j \) has a production set \( Y_j \subseteq \mathbb{R}^L \) specifying technologically feasible net output vectors. Each consumer owns shares \( \theta_{ij} \geq 0 \) of firm \( j \) (with \( \sum_i \theta_{ij} = 1 \)), and receives a share of profits as dividend income.

<div class="definition">
<strong>Competitive Equilibrium in a Production Economy:</strong> Prices <em>p*</em>, production plans (y<sub>1</sub>*, ..., y<sub>J</sub>*), and consumption plans (x<sub>1</sub>*, ..., x<sub>I</sub>*) form an equilibrium if:
<ol>
<li><strong>Profit maximization:</strong> y<sub>j</sub>* ∈ arg max<sub>y ∈ Y<sub>j</sub></sub> p* · y for each firm j.</li>
<li><strong>Consumer optimization:</strong> x<sub>i</sub>* maximizes u<sub>i</sub> subject to p* · x<sub>i</sub> ≤ p* · ω<sub>i</sub> + ∑<sub>j</sub> θ<sub>ij</sub>(p* · y<sub>j</sub>*).</li>
<li><strong>Market clearing:</strong> ∑<sub>i</sub> x<sub>i</sub>* = ∑<sub>i</sub> ω<sub>i</sub> + ∑<sub>j</sub> y<sub>j</sub>*.</li>
</ol>
</div>

### 3.1.1 Profit Maximization

For a competitive firm, profit is \( \pi_j = p \cdot y_j \). With a standard production technology \( q = f(K, L) \) and input prices \( (r, w) \), this becomes \( \pi = Pq - rK - wL \). Maximizing over \( q \) (having already cost-minimized at each output level) yields the supply rule \( P = MC(q^*) \) derived in ECON 290.

Equilibrium profits may be positive, zero, or negative in the short run. In the **long run**, free entry drives profits to zero — all firms earn only a normal return on their capital.

## 3.2 Pareto Efficiency and Welfare Theorems in Production Economies

The welfare theorems extend to economies with production under the same conditions. With production, a Pareto-efficient allocation satisfies two sets of efficiency conditions:

1. **Production efficiency:** Inputs are allocated across firms to maximize aggregate output. Formally, the marginal rate of technical substitution must be equalized across all firms producing the same good: \( MRTS^j = MRTS^k \) for all firms \( j, k \).

2. **Exchange efficiency:** Given the produced output, consumers allocate it efficiently: \( MRS_i = MRS_{i'} \) for all consumers \( i, i' \).

3. **Top-level efficiency (product mix):** The rate at which the economy can transform production of one good into another (the **marginal rate of transformation, MRT**) equals consumers' marginal rates of substitution: \( MRT = MRS \).

In a competitive equilibrium, all three conditions hold because firms and consumers all face the same prices:

\[ MRS_i = \frac{p_x}{p_y} = MRT \quad \forall i. \]

## 3.3 General vs. Partial Equilibrium

### 3.3.1 Partial Equilibrium Analysis

**Partial equilibrium** analyzes one market in isolation, taking prices in all other markets as given. This is valid when the market in question is "small" relative to the economy, so that its interactions with other markets are negligible. The tools of ECON 290 — supply and demand, consumer/producer surplus — are fundamentally partial-equilibrium tools.

### 3.3.2 General Equilibrium Analysis

**General equilibrium** considers all markets simultaneously, accounting for the interdependencies between them. A change in one market (say, a tax on oil) ripples through to related markets (cars, public transit, electric vehicles, labor) and these feedback effects can be quantitatively important.

<div class="example">
<strong>Tax Incidence in General Equilibrium:</strong> In partial equilibrium, a labor income tax appears to reduce labor supply and lower output in the taxed sector. In general equilibrium, the taxed workers shift to other sectors (or use leisure), changing wages and output across the entire economy. The general equilibrium incidence of the tax differs — sometimes dramatically — from the partial equilibrium prediction. This "general vs. partial equilibrium" contrast is a major theme in applied economic policy analysis.
</div>

The celebrated **Harberger (1962) model** provides a two-sector general equilibrium framework for analyzing tax incidence. Even in this simple framework, a corporate income tax imposed on one sector may end up borne predominantly by capital owners economy-wide, not just in the taxed sector.

---

# Chapter 4: Markets under Uncertainty

## 4.1 Arrow-Debreu Contingent Commodities

The Arrow-Debreu framework extends the competitive equilibrium model to uncertainty by redefining commodities. A **contingent commodity** is a good to be delivered only if a particular **state of the world** \( s \in S \) occurs. With \( S \) states and \( L \) physical goods, the economy has \( L \times S \) distinct Arrow-Debreu commodities.

<div class="definition">
<strong>Arrow-Debreu Economy:</strong> An economy in which markets exist for every good in every state of the world. Prices p<sub>ℓs</sub> are the <em>state prices</em> for good ℓ in state s. Consumers trade these contingent claims before the state is revealed, effectively purchasing consumption insurance.
</div>

Competitive equilibrium in an Arrow-Debreu economy is formally identical to a standard equilibrium; goods are just indexed differently. The First and Second Welfare Theorems apply unchanged.

## 4.2 Competitive Equilibrium under Uncertainty

Let there be two states \( s \in \{G, B\} \) (good and bad) with probabilities \( \pi_G \) and \( \pi_B = 1 - \pi_G \). Consumer \( i \) has endowment \( (\omega_{Gi}, \omega_{Bi}) \) in the two states and maximizes expected utility

\[ EU_i = \pi_G \, u_i(c_{Gi}) + \pi_B \, u_i(c_{Bi}). \]

The optimality conditions are:

\[ \frac{MU_G}{MU_B} = \frac{\pi_G \, u'_i(c_{Gi})}{\pi_B \, u'_i(c_{Bi})} = \frac{p_G}{p_B}. \]

At an efficient allocation, the **ratio of state prices equals the ratio of probabilities** (since all consumers have the same marginal utilities when consumption is equalized across states):

\[ \frac{p_G}{p_B} = \frac{\pi_G}{\pi_B}. \]

### 4.2.1 Application: Insurance against Aggregate and Idiosyncratic Risk

**Idiosyncratic risk** affects individual consumers but not the aggregate: while individual endowments may be \( (\omega_G^i, \omega_B^i) \neq (\omega_G^j, \omega_B^j) \), aggregate endowments satisfy \( \bar\omega_G = \bar\omega_B \). With idiosyncratic risk only, complete markets allow full insurance: equilibrium allocates equal consumption to each consumer in both states, i.e., \( c_G^i = c_B^i = \bar\omega/I \). Individual income risk is completely diversified away.

**Aggregate risk** arises when \( \bar\omega_G \neq \bar\omega_B \) — the aggregate endowment varies across states. Even with complete markets, aggregate risk cannot be insured away: if aggregate output is low in state B, average consumption must be lower. However, complete markets ensure that the risk is **efficiently shared** — the equilibrium consumption allocation is Pareto optimal conditional on the aggregate risk.

### 4.2.2 Application: Insurance through Asset Markets

In practice, Arrow-Debreu contingent commodity markets are rarely observed directly. Instead, risk-sharing occurs through **asset markets**. A financial asset is a claim to a stream of payoffs across states. Arrow (1964) and Debreu (1959) showed that if there are as many independent assets as states of the world (**complete asset markets**), the resulting allocation replicates the Arrow-Debreu equilibrium.

<div class="theorem">
<strong>Asset Market Completeness:</strong> If asset markets are complete (as many linearly independent assets as states), then the competitive equilibrium with asset trading is equivalent to the Arrow-Debreu equilibrium, and is therefore Pareto efficient.
</div>

**Radner (1972)** extended this to sequential trading: even with spot markets opening in each period/state, if markets are complete the outcome is the same as Arrow-Debreu. Real-world financial markets are incomplete (fewer assets than states), which is one source of inefficiency even in otherwise frictionless economies.

---

# Chapter 5: Existence and Properties of Equilibrium

## 5.1 Existence of Walrasian Equilibrium

Does a competitive equilibrium always exist? The **Arrow-Debreu existence theorem** (1954) provides conditions:

<div class="theorem">
<strong>Arrow-Debreu Existence Theorem:</strong> In a private ownership economy with:
<ol>
<li>Continuous and strictly convex preferences,</li>
<li>Convex production sets,</li>
<li>Strictly positive endowments (each consumer has some of every good),</li>
</ol>
a competitive equilibrium exists.
</div>

**Proof method:** Define the **excess demand function** \( z(p) = \sum_i x_i^*(p) - \sum_i \omega_i \) for the economy. Market clearing requires \( z(p^*) \leq 0 \). Under the above assumptions, \( z(\cdot) \) is continuous and satisfies Walras's law. An application of **Brouwer's fixed-point theorem** (or Kakutani's theorem for correspondences) to the normalized price simplex establishes the existence of a price vector \( p^* \) at which \( z(p^*) = 0 \).

## 5.2 Uniqueness and Stability

Existence does not guarantee **uniqueness**. In general, multiple equilibria may exist. Sufficient conditions for uniqueness include:

- **Gross substitutability:** \( \partial z_\ell / \partial p_k > 0 \) for all \( \ell \neq k \) — the excess demand for any good increases when the price of any other good rises.
- **Diagonal dominance** of the Jacobian of excess demand.

Under gross substitutability, the **tatonnement process** (an auctioneer raising prices for goods in excess demand and lowering them for goods in excess supply) converges to equilibrium — the equilibrium is **globally stable**.

## 5.3 The Representative Agent and Aggregate Demand

When all consumers have **identical and homothetic preferences**, the economy behaves as if there is a single **representative agent** with the aggregate endowment. In this case, the distribution of endowments does not affect equilibrium prices, and welfare analysis is greatly simplified. However, with heterogeneous preferences or non-homothetic utility, the Gorman aggregation conditions necessary for a well-behaved representative agent generally fail.

---

# Chapter 6: Summary — The Logic of General Equilibrium

General equilibrium theory provides the rigorous foundations for understanding how prices coordinate decentralized decisions across an entire economy. The key insights are:

1. **Existence:** Under standard regularity conditions, a price system exists that clears all markets simultaneously.

2. **Efficiency:** Competitive equilibria are Pareto efficient (First Welfare Theorem), provided externalities, market power, and incomplete markets are absent.

3. **Decentralization:** Any efficient allocation can in principle be achieved through markets, given appropriate initial endowments (Second Welfare Theorem).

4. **Uncertainty:** The Arrow-Debreu framework extends these results to economies with uncertainty, equating efficient risk-sharing with competitive trading of contingent claims.

5. **Policy implications:** Because lump-sum redistributions avoid distorting relative prices, the efficiency-equity tradeoff is in principle separable — a result that motivates the study of optimal redistribution and tax design.

These foundations set the stage for ECON 393 (Market Failures), which studies what happens when the conditions underlying these welfare theorems break down.
