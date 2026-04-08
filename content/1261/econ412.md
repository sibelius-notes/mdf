---
title: "ECON 412: Topics in Game Theory"
prof: "Anqi Li"
subjects: "ECON"
---

## Sources and References

**Primary materials** — Li, Anqi. Lecture handouts (self-contained, posted on LEARN).

**Supplementary texts** — Osborne, Martin J. *An Introduction to Game Theory*. Oxford University Press, 2004. Fudenberg, Drew and Jean Tirole. *Game Theory*. MIT Press, 1991 (graduate treatment). Milgrom, Paul. *Putting Auction Theory to Work*. Cambridge University Press, 2004. Roth, Alvin E. and Marilda A. Oliveira Sotomayor. *Two-Sided Matching: A Study in Game-Theoretic Modeling and Analysis*. Cambridge University Press, 1992.

**Online resources** — MIT OCW 14.121 (Microeconomic Theory I); MIT OCW 14.122 (Microeconomic Theory II); Myerson, R.B. "Optimal Auction Design," *Mathematics of Operations Research*, 1981; Vickrey, W. "Counterspeculation, Auctions, and Competitive Sealed Tenders," *Journal of Finance*, 1961; Gale, D. and L. Shapley. "College Admissions and the Stability of Marriage," *American Mathematical Monthly*, 1962.

---

# Chapter 1: Games with Incomplete Information

## 1.1 Beyond Perfect Information

The game theory covered in ECON 392 assumed that players have complete information about the game — including each other's payoffs. In reality, agents often have **private information** about their own type: a buyer knows their own valuation; a worker knows their own ability; an insurer knows their own risk level. When players have private information about relevant parameters, we need the framework of **Bayesian games**.

## 1.2 Bayesian Games

<div class="definition">
<strong>Bayesian Game:</strong> A Bayesian game (game of incomplete information) consists of:
<ul>
<li>A set of players <em>N = {1, ..., n}</em>.</li>
<li>For each player <em>i</em>, a set of <strong>types</strong> Θ<sub>i</sub>. Player <em>i</em> privately observes their type θ<sub>i</sub> ∈ Θ<sub>i</sub>.</li>
<li>A <strong>prior distribution</strong> F over type profiles Θ = Θ<sub>1</sub> × ... × Θ<sub>n</sub>, commonly assumed to be common knowledge (Harsanyi, 1967).</li>
<li>For each player <em>i</em>, an <strong>action set</strong> A<sub>i</sub> and a payoff function u<sub>i</sub>(a<sub>1</sub>, ..., a<sub>n</sub>, θ<sub>1</sub>, ..., θ<sub>n</sub>).</li>
</ul>
A <strong>strategy</strong> for player <em>i</em> is a function s<sub>i</sub>: Θ<sub>i</sub> → A<sub>i</sub> mapping types to actions.
</div>

The key departure from complete-information games is that a strategy must specify an action for every possible type, since other players do not observe \( i \)'s type but do know the strategy function \( s_i(\cdot) \).

## 1.3 Bayes-Nash Equilibrium

<div class="definition">
<strong>Bayes-Nash Equilibrium (BNE):</strong> A strategy profile (s<sub>1</sub>*, ..., s<sub>n</sub>*) is a Bayes-Nash equilibrium if, for every player <em>i</em> and every type θ<sub>i</sub> ∈ Θ<sub>i</sub>,
\[ s_i^*(\theta_i) \in \arg\max_{a_i \in A_i} E_{\theta_{-i}}\left[ u_i(a_i, s_{-i}^*(\theta_{-i}), \theta_i, \theta_{-i}) \mid \theta_i \right]. \]
Each player maximizes their <em>expected</em> payoff given their own type and their beliefs about opponents' types and strategies.
</div>

BNE generalizes Nash equilibrium to incomplete information: at equilibrium, no player has an incentive to deviate from their strategy given their type, and all players correctly anticipate how other types will behave.

### 1.3.1 The First-Price Sealed-Bid Auction as a Bayesian Game

Two bidders each have a private valuation \( v_i \sim U[0,1] \), i.i.d. Each submits a bid \( b_i \). The higher bidder wins and pays their own bid (**first-price rule**). A BNE strategy is a bidding function \( b_i(v_i) \). It can be shown that the unique symmetric BNE is

\[ b^*(v) = \frac{v}{2}. \]

Each bidder **shades their bid** below their valuation (by half) to trade off the probability of winning against the payment made. This is a key result in auction theory — different auction formats lead to different bidding strategies.

### 1.3.2 Applications to Information Models

BNE underlies the analysis of the **lemons problem** and **equilibrium in insurance markets** (reviewed from ECON 393). In the Akerlof model, a pooling price and a separating equilibrium are both BNE concepts applied to a signaling game. In the Rothschild-Stiglitz insurance model, the separating contract menu is a BNE of the insurance game among insurers and types.

---

# Chapter 2: Higher-Order Beliefs and Common Knowledge

## 2.1 The Epistemic Foundations

How much does Player 1 know? They know their own type. But what do they know about Player 2's beliefs? And what do they know about what Player 2 knows about Player 1's beliefs? This **belief hierarchy** can be infinite.

<div class="definition">
<strong>Common Knowledge:</strong> An event <em>E</em> is <strong>common knowledge</strong> among players if:
<ul>
<li>Every player knows <em>E</em>.</li>
<li>Every player knows that every player knows <em>E</em>.</li>
<li>Every player knows that every player knows that every player knows <em>E</em>. (And so on, infinitely.)</li>
</ul>
</div>

The classic illustration is the **Muddy Children puzzle**: \( k \) children have muddy faces; each child can see others but not their own face. The father announces "at least one child has a muddy face" — public common knowledge. After \( k \) rounds of the statement "does anyone know if they have mud?" children can deduce their own state. The distinction between "mutual knowledge" (everyone knows) and "common knowledge" (everyone knows everyone knows...) is crucial for the logic of coordination.

## 2.2 The Type Space (Harsanyi)

Harsanyi (1967) showed that any incomplete information situation can be modeled via a **type space**: each player's type encodes all private information, including their beliefs about others' types, their beliefs about others' beliefs, and so on. The common prior assumption (all players share the same prior over types) ensures that disagreements come from private information, not from different prior beliefs.

## 2.3 Rationalizability and Common Knowledge of Rationality

**Rationalizability** (Bernheim 1984, Pearce 1984) characterizes the strategies consistent with common knowledge of rationality without imposing the coordination requirement of Nash equilibrium. A strategy is rationalizable if it is a best response to some belief about opponents' strategies, where those strategies are themselves rationalizable. Rationalizability corresponds to iterative elimination of strictly dominated strategies, but permits correlated conjectures about opponents.

---

# Chapter 3: Mechanism Design — The Revelation Principle

## 3.1 The Implementation Problem

The **mechanism design** (or **reverse game theory**) question is: given a desired social outcome (allocation rule), can we design a game (mechanism) such that rational, self-interested agents voluntarily produce that outcome? This flips the usual direction of game theory — instead of analyzing given rules, we design the rules.

A **social choice function** \( f: \Theta \to A \) maps type profiles to outcomes. A **mechanism** \( M = (S, g) \) consists of a message space \( S \) and an outcome function \( g: S \to A \). The mechanism induces a game among agents; the question is whether the equilibrium of this induced game implements \( f \).

## 3.2 Direct Mechanisms and the Revelation Principle

A **direct mechanism** asks agents to report their types directly: \( S_i = \Theta_i \). The outcome function is then \( g(\theta) = f(\theta) \).

<div class="theorem">
<strong>Revelation Principle (Myerson 1979, Dasgupta-Hammond-Maskin 1979):</strong> For any mechanism <em>M</em> and any equilibrium of <em>M</em> that implements social choice function <em>f</em>, there exists a direct mechanism in which:
<ol>
<li>Truth-telling is an equilibrium (incentive compatibility).</li>
<li>The same social choice function <em>f</em> is implemented.</li>
</ol>
</div>

**Implication:** Without loss of generality, one can restrict attention to **direct, incentive-compatible mechanisms** — those where each agent's dominant strategy (or Bayes-Nash strategy) is to truthfully report their type. This drastically simplifies mechanism design: instead of searching over all possible game forms, we look for allocations \( f(\cdot) \) and transfers \( t(\cdot) \) that satisfy incentive constraints.

### 3.2.1 Dominant Strategy vs. Bayesian Implementation

- **Dominant strategy implementation (DSI):** Truth-telling is a dominant strategy regardless of others' reports. More robust, but harder to achieve.
- **Bayesian (Nash) implementation:** Truth-telling is a BNE. Less robust but more permissive.

The **Gibbard-Satterthwaite theorem** (Chapter 7 of ECON 392) shows that DSI with unrestricted domain requires dictatorship. This motivates the focus on **quasilinear environments** (where transfers are possible), in which many interesting non-dictatorial mechanisms are incentive-compatible.

---

# Chapter 4: Single-Agent Models — Hidden Characteristics (Adverse Selection / Screening)

## 4.1 The Screening Problem

A **principal** (e.g., a monopolist, employer, or government) faces a single **agent** whose type \( \theta \in \Theta \) is private information. The principal designs a menu of contracts \( \{(t(\theta), q(\theta))\}_{\theta \in \Theta} \) — where \( t \) is a transfer (payment) and \( q \) is an allocation (quantity, quality, effort) — to maximize their own objective subject to the agent's participation and incentive constraints.

This is the **screening problem**: the principal "screens" agent types through the self-selection of contracts.

## 4.2 A Two-Type Screening Model

Two types: high type \( \theta_H \) (high valuation) and low type \( \theta_L \) (low valuation), with \( \theta_H > \theta_L > 0 \) and prior probabilities \( \lambda \) and \( 1-\lambda \). The agent's utility is

\[ U_i = \theta_i q - t, \]

where \( q \) is the quantity (or quality) of the good and \( t \) is the payment. The principal's profit is \( \pi = t - C(q) \) (where \( C(q) \) is cost).

**First-best (full information):** The principal can identify each type and offer type-specific contracts. Optimal contracts extract all surplus: \( t_i^{FB} = \theta_i q_i^{FB} - \bar{u} \), and \( q_i^{FB} \) maximizes \( \theta_i q - C(q) \), yielding \( \theta_i = C'(q_i^{FB}) \) — efficient quantity for each type.

**Second-best (private information):** The principal cannot observe \( \theta \). Constraints:

1. **Participation constraints (PC):**
   \[ \theta_H q_H - t_H \geq \bar{u}, \quad \theta_L q_L - t_L \geq \bar{u}. \]

2. **Incentive compatibility constraints (IC):**
   \[ \theta_H q_H - t_H \geq \theta_H q_L - t_L \quad (IC_H), \]
   \[ \theta_L q_L - t_L \geq \theta_L q_H - t_H \quad (IC_L). \]

<div class="theorem">
<strong>Standard Screening Results:</strong> In the two-type optimal screening problem:
<ol>
<li><strong>The high type gets an information rent</strong> — the principal cannot extract all of the high type's surplus because high types can mimic low types.</li>
<li><strong>No distortion at the top:</strong> The high type receives the efficient quantity q<sub>H</sub>* = q<sub>H</sub><sup>FB</sup>.</li>
<li><strong>Downward distortion at the bottom:</strong> The low type receives q<sub>L</sub>* &lt; q<sub>L</sub><sup>FB</sup> — output is distorted below efficiency to reduce the information rent paid to the high type.</li>
</ol>
</div>

### 4.2.1 Continuous Types

With a continuum of types \( \theta \sim F(\theta) \) on \( [\underline{\theta}, \bar{\theta}] \), the optimal mechanism is characterized by the **virtual type** or **virtual valuation**:

\[ \psi(\theta) = \theta - \frac{1 - F(\theta)}{f(\theta)}, \]

where \( f(\theta) = F'(\theta) \) is the density. The optimal quantity rule is to serve type \( \theta \) at the quantity satisfying

\[ \psi(\theta) = C'(q(\theta)), \]

and types with \( \psi(\theta) < 0 \) are excluded (receive zero quantity). This is the foundation of **Myerson's optimal auction design**, revisited in Chapter 6.

## 4.3 Applications

### 4.3.1 Second-Degree Price Discrimination

A monopolist offers a menu of quantity-price bundles (e.g., different sized packages at different unit prices). The screening framework explains the structure: large consumers pay higher total prices but lower per-unit prices. The efficient quantity is offered to the largest consumer; all other consumers are offered distorted-downward quantities to manage information rents.

### 4.3.2 Mirrleesian Optimal Income Taxation

Mirrlees (1971) applied the screening framework to optimal income taxation. Workers have private skill types \( \theta \); the government observes income \( y = \theta \cdot e \) (skill times effort) but not skill or effort separately. The optimal tax schedule \( T(y) \) solves a screening problem: the government designs transfers \( T(y) \) to maximize a social welfare function subject to incentive compatibility (workers choose income levels voluntarily) and the government's budget constraint.

The Mirrlees optimum features **zero marginal tax rate at the top** (no distortion for the highest skill type) and positive marginal tax rates for all lower types (downward distortion to raise revenue). This mirrors the "no distortion at the top" screening result.

---

# Chapter 5: Single-Agent Models — Hidden Actions (Moral Hazard)

## 5.1 The Principal-Agent Framework

A **principal** contracts with an **agent** to perform a task. The agent's effort \( e \) affects the outcome \( x \) (stochastic due to noise) but is not directly observed by the principal. The principal designs a wage contract \( w(x) \) contingent on output to incentivize effort.

**Setup:**
- Agent effort \( e \in [0, \bar{e}] \) costs the agent \( c(e) \) (increasing, convex).
- Outcome \( x \) is stochastic: higher \( e \) makes good outcomes more likely.
- Agent utility: \( U = v(w) - c(e) \); principal's payoff: \( x - w \).

**First-best (observable effort):** The principal implements efficient effort \( e^* \) and, to minimize risk-sharing costs with a risk-averse agent, the principal bears all risk (offers a flat wage). Efficient effort satisfies \( c'(e^*) = E[x'(e^*)] \).

**Second-best (unobservable effort):** To induce effort, the principal must make \( w \) sensitive to \( x \). But a risk-averse agent dislikes outcome-contingent pay. The optimal contract trades off:
- **Incentives:** More outcome-sensitivity → higher effort.
- **Risk-sharing:** More outcome-sensitivity → agent bears more risk (costly).

<div class="theorem">
<strong>Borch Rule (Risk-Sharing):</strong> Under the optimal contract with hidden action, the ratio of the principal's marginal utility to the agent's marginal utility is constant across outcomes in the first-best, but varies with output in the second-best. The second-best contract is characterized by: w*(x) satisfies
\[ \frac{u'(w^*(x))}{v'(w^*(x))} = \lambda + \mu \frac{f_e(x, e^*)}{f(x, e^*)}, \]
where λ and μ are Lagrange multipliers on the PC and IC, and f<sub>e</sub>/f is the <strong>likelihood ratio</strong>.
</div>

## 5.2 Linear Contracts and the Holmstrom-Milgrom Model

In the **Holmstrom-Milgrom (1987)** model with exponential utility, a risk-neutral principal, and a linear technology, the optimal contract is linear: \( w = \alpha + \beta x \). The parameter \( \beta \in [0,1] \) is the **incentive intensity**. The optimal \( \beta \) balances:

\[ \beta^* = \frac{1}{1 + r \sigma^2 c''}, \]

where \( r \) is the agent's coefficient of absolute risk aversion, \( \sigma^2 \) is the variance of noise, and \( c'' \) measures the curvature of effort cost. Higher risk (larger \( \sigma^2 \)), higher risk aversion (\( r \)), or flatter effort cost (small \( c'' \)) all lead to lower-powered incentives.

### 5.2.1 Applications to Incentive Contracting

- **CEO compensation:** Base salary (risk-sharing) plus stock options (incentives). The Holmstrom-Milgrom model predicts lower stock-price sensitivity for CEOs facing noisier environments.
- **Franchise contracts:** Franchisors choose between company stores (agent bears no risk, no effort incentive — moral hazard) and franchises (franchisee owns the output, bears full risk — good incentives). The optimal arrangement depends on risk tolerance and cost of effort.

---

# Chapter 6: Multi-Agent Models — Auction Design

## 6.1 The Revenue Equivalence Theorem

Auctions are mechanisms for allocating goods to buyers with private valuations. The central result of auction theory is:

<div class="theorem">
<strong>Revenue Equivalence Theorem (Vickrey 1961, Myerson 1981):</strong> Suppose buyers have independent private values drawn from the same distribution, and the auction (i) always allocates the good to the highest-value bidder, (ii) a bidder with the lowest possible value expects zero surplus. Then all such auctions yield the same expected revenue to the seller.
</div>

**Corollary:** The four standard auction formats — English (ascending), Dutch (descending), first-price sealed-bid, and second-price sealed-bid (Vickrey) — are all revenue-equivalent under these conditions.

### 6.1.1 Dominant Strategy Equilibrium in the Vickrey Auction

In the **Vickrey (second-price) auction**, each bidder pays the second-highest bid if they win. The dominant strategy is to bid one's true valuation:

- If \( b_i > v_i \) and the second-highest bid \( b_{-i} \in (v_i, b_i) \), bidder \( i \) wins but overpays (negative surplus).
- If \( b_i < v_i \) and \( b_{-i} \in (b_i, v_i) \), bidder \( i \) loses a profitable opportunity.

Hence bidding \( b_i = v_i \) weakly dominates any other strategy. This **incentive compatibility** property makes the Vickrey auction extremely attractive from a mechanism design perspective — it elicits truthful valuations.

### 6.1.2 First-Price vs. Second-Price Auctions

In a **first-price auction** with \( n \) symmetric buyers with \( v_i \sim U[0,1] \), the unique symmetric BNE has each bidder shading their bid by a factor of \( (n-1)/n \):

\[ b^*(v) = \frac{n-1}{n} v. \]

Revenue equivalence confirms: expected revenue from first-price = expected revenue from second-price = \( \frac{n-1}{n+1} \) (for uniform valuations with \( n \) bidders).

## 6.2 Optimal Auction Design (Myerson 1981)

When the seller is revenue-maximizing, the revenue equivalence theorem identifies the revenue across mechanisms but not the maximum revenue. Myerson's **optimal auction** design derives the revenue-maximizing mechanism using the revelation principle.

### 6.2.1 Virtual Valuations and the Optimal Allocation Rule

With buyers having private values \( v_i \sim F_i \) (independent but potentially asymmetric), the seller's expected revenue from any direct incentive-compatible mechanism can be written as

\[ E[\text{Revenue}] = E\left[\sum_i \psi_i(v_i) q_i(v) \right] - \text{constants}, \]

where \( q_i(v) \) is the probability that buyer \( i \) gets the object and \( \psi_i(v_i) = v_i - (1-F_i(v_i))/f_i(v_i) \) is buyer \( i \)'s **virtual valuation**.

<div class="theorem">
<strong>Myerson's Optimal Auction:</strong> The revenue-maximizing auction allocates the good to the buyer with the highest non-negative virtual valuation:
\[ q_i^*(v) = \mathbf{1}\left[\psi_i(v_i) \geq \max\left\{0, \max_{j \neq i} \psi_j(v_j)\right\}\right]. \]
If all \( \psi_i(v_i) < 0 \), the seller retains the good (a <em>reserve price</em>). When buyers are symmetric, the optimal mechanism is a Vickrey auction with a reservation price r* satisfying \( \psi(r^*) = 0 \).
</div>

The **reserve price** screens out low-value buyers: the seller commits to keeping the good rather than selling at too low a price, which extracts higher expected revenue from buyers with intermediate values.

## 6.3 The VCG Mechanism

The **Vickrey-Clarke-Groves (VCG) mechanism** extends the Vickrey auction to general social choice settings with multiple goods and agents.

<div class="definition">
<strong>VCG Mechanism:</strong> In a general quasilinear environment, the VCG mechanism:
<ol>
<li>Selects the socially efficient allocation: q*(v) ∈ arg max ∑<sub>i</sub> v<sub>i</sub>(q).</li>
<li>Charges each agent a <strong>Clarke tax</strong>: t<sub>i</sub>(v) = h<sub>i</sub>(v<sub>-i</sub>) − ∑<sub>j ≠ i</sub> v<sub>j</sub>(q*(v)), where h<sub>i</sub> depends only on others' reports.</li>
</ol>
Truth-telling is a dominant strategy for every agent in a VCG mechanism.
</div>

**Intuition:** Each agent is charged for the externality they impose on others. By reporting higher valuations, an agent may change the allocation in ways that harm others; the VCG tax internalizes this harm, making truthful reporting individually optimal.

**Limitations of VCG:**
- **Budget balance:** VCG collects (weakly) positive transfers, but the transfers may not sum to zero — the mechanism may require external funding or destroy revenue.
- **Myerson-Satterthwaite theorem:** In bilateral trade with private values, no Bayesian incentive-compatible, individually rational mechanism can always achieve efficiency while balancing the budget.

## 6.4 The Myerson-Satterthwaite Theorem

<div class="theorem">
<strong>Myerson-Satterthwaite Theorem (1983):</strong> Consider bilateral trade: a seller with private cost c ∼ F<sub>S</sub> and a buyer with private value v ∼ F<sub>B</sub>, with overlapping supports (there are positive-probability events where trade is mutually beneficial). Then no mechanism that is:
<ol>
<li>Bayesian incentive-compatible,</li>
<li>Individually rational (both parties voluntarily participate),</li>
<li>Budget-balanced (no external subsidies),</li>
</ol>
can always achieve efficient trade.
</div>

**Implication:** Decentralized bilateral trade (e.g., bargaining) necessarily involves some probability of efficient trades not occurring. This is a fundamental efficiency limit even when information asymmetry is the only problem. It motivates centralized marketplaces and clearinghouses as potentially superior mechanisms.

---

# Chapter 7: Multi-Agent Models — Matching Markets

## 7.1 Two-Sided Matching

**Matching markets** allocate agents from two groups to one another without prices (or with prices playing only a limited role). Classic examples include:

- Medical residency programs and hospitals (NRMP — National Resident Matching Program).
- Students and colleges.
- Workers and firms.

The key concepts are **stability** and **strategy-proofness**.

## 7.2 Stability and the Gale-Shapley Algorithm

<div class="definition">
<strong>Matching:</strong> A matching μ pairs each agent on one side with an agent (or agents) on the other side. A matching is <strong>individually rational</strong> if every agent weakly prefers their match to being unmatched.

<strong>Blocking Pair:</strong> A pair (m, w) is a <em>blocking pair</em> for matching μ if:
<ul>
<li>m prefers w to μ(m), and</li>
<li>w prefers m to μ(w).</li>
</ul>
A matching is <strong>stable</strong> if it is individually rational and has no blocking pair.
</div>

Gale and Shapley (1962) proved:

<div class="theorem">
<strong>Gale-Shapley Algorithm (Deferred Acceptance):</strong> Given any preference lists, the deferred acceptance algorithm produces a stable matching in a finite number of rounds. The algorithm:
<ol>
<li>Each proposer (say, men) proposes to their top choice.</li>
<li>Each receiver (women) tentatively accepts their best proposal and rejects all others.</li>
<li>Rejected proposers move to their next choice. Repeat until no proposals are rejected.</li>
</ol>
The resulting matching is the <em>proposer-optimal stable matching</em> — the best stable matching for proposers and the worst stable matching for receivers.
</div>

### 7.2.1 Existence and Properties

- **Existence:** A stable matching always exists in the one-to-one case (Gale-Shapley 1962).
- **Multiple stable matchings:** There may be many stable matchings, but they form a lattice — the proposer-optimal and receiver-optimal matchings are at opposite ends.
- **Strategy-proofness:** In the deferred acceptance algorithm, proposing truthfully is a dominant strategy for proposers. Receivers, however, may have incentives to misreport.

## 7.3 School Choice

The **school choice problem** (Abdulkadiroglu and Sonmez 2003) uses matching theory to design student assignment mechanisms for public schools. The key trade-off is between:

- **Efficiency:** Maximize student welfare.
- **Fairness (stability):** Eliminate justified envy — no student should prefer a school that has a student with lower priority.
- **Strategy-proofness:** Prevent strategic manipulation of reported preferences.

The **student-proposing deferred acceptance mechanism** is strategy-proof for students and respects priorities (stability with respect to school priority rankings). The **top trading cycles (TTC)** mechanism is efficient and strategy-proof but may violate fairness. Boston's original mechanism was neither strategy-proof nor stable.

## 7.4 Two-Sided Matching with Contracts

Hatfield and Milgrom (2005) extended matching theory to settings where agents are matched with **contracts** specifying both a partner and terms (wages, quality, etc.). Under **substitutability** conditions on preferences (the doctor-proposing/hospital-accepting version), a stable set of contracts always exists and can be found by a generalized deferred acceptance algorithm. This unifies auction theory and matching theory.

---

# Chapter 8: Additional Topics

## 8.1 Bargaining Theory

**Nash bargaining** (Nash 1950) axiomatizes the outcome of bilateral bargaining. The Nash bargaining solution maximizes the Nash product of surplus over the disagreement point:

\[ (x^*, y^*) = \arg\max (x - d_1)^{\alpha} (y - d_2)^{1-\alpha}, \]

where \( d_1, d_2 \) are disagreement payoffs and \( \alpha \) reflects bargaining power. This satisfies axioms of efficiency, symmetry (when \( \alpha = 1/2 \)), scale invariance, and IIA.

**Rubinstein alternating-offers bargaining** provides a non-cooperative foundation. With discount factors \( \delta_1, \delta_2 \), the unique subgame perfect equilibrium has the first mover offering \( x^* = (1-\delta_2)/(1-\delta_1\delta_2) \) and the other accepting. As the time between offers goes to zero, the Rubinstein solution converges to the Nash bargaining solution.

## 8.2 AI-Driven Mechanism Design

Recent research applies machine learning to mechanism design. Instead of deriving the optimal mechanism analytically, the idea is to parameterize the mechanism and use gradient-based learning to approximately solve the design problem.

**RegretNet (Dutting et al.):** Neural networks trained to minimize the auctioneer's regret subject to approximate incentive compatibility, yielding revenue-maximizing auctions that outperform hand-crafted mechanisms in complex multi-item, multi-buyer environments. This is an active frontier connecting game theory with ML.

---

# Chapter 9: Synthesis — Mechanism and Market Design

## 9.1 The Design Perspective

This course develops a **design perspective** on game theory: rather than taking institutions as given and analyzing their equilibria, we ask what institutions should look like to achieve desired goals. The three pillars are:

1. **Incentive compatibility:** Use the revelation principle to restrict attention to truthful direct mechanisms; then characterize the set of incentive-compatible allocations.

2. **Efficiency vs. revenue:** VCG maximizes efficiency (social surplus) with dominant-strategy incentive compatibility; Myerson's optimal auction maximizes revenue. The Myerson-Satterthwaite theorem shows these objectives can conflict in bilateral settings.

3. **Stability vs. efficiency:** In matching markets without transfers, stability and strategy-proofness are the main design criteria; Gale-Shapley delivers both (for the proposing side). The school choice literature highlights the trade-offs between efficiency, fairness, and incentive compatibility.

## 9.2 The Revelation Principle as a Unifying Tool

The revelation principle unifies apparently disparate phenomena:

| Context | Private Information | Mechanism | Insight |
|---|---|---|---|
| Monopoly screening | Buyer's valuation | Price schedule | No distortion at top; rent extraction via downward distortion |
| Insurance | Risk type | Contract menu | Adverse selection — low types receive partial coverage |
| Taxation | Worker's skill | Tax schedule | Mirrleesian: zero marginal rate at the top |
| Auctions | Buyer's value | Auction format | Optimal reserve price = virtual valuation = 0 |
| Public goods | Valuations | VCG / Clarke tax | Dominant strategy truthfulness at efficiency cost |
| Matching | Preferences over partners | Deferred acceptance | Stability + strategy-proofness for proposers |

## 9.3 Limits of Mechanism Design

The power of mechanism design is constrained by several fundamental impossibility results:

- **Gibbard-Satterthwaite:** Without transfers, no strategy-proof non-dictatorial mechanism exists over unrestricted domains.
- **Myerson-Satterthwaite:** With bilateral trade and private values, no budget-balanced IC/IR mechanism achieves full efficiency.
- **Green-Laffont:** VCG mechanisms generally fail to balance the budget.
- **Revenue-efficiency trade-off:** Revenue-maximizing mechanisms (with reserve prices) are not efficient; efficient mechanisms (VCG) are not revenue-maximizing.

These impossibility results identify the fundamental trade-offs that any real institution must navigate, and they motivate ongoing research in robust mechanism design, approximate mechanisms, and the computational approach to design.
