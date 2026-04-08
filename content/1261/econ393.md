---
title: "ECON 393: Market Failures"
prof: "Lutz-Alexander Busch"
subjects: "ECON"
---

## Sources and References

**Primary textbooks** — Nechyba, Thomas J. *Microeconomics: An Intuitive Approach with Calculus*, 1st ed. (2011) / 2nd ed. (2017), South-Western Cengage Learning. Perloff, Jeffrey M. *Microeconomics: Theory and Applications with Calculus*, 4th ed. Pearson, 2018.

**Supplementary texts** — Varian, Hal R. *Intermediate Microeconomics: A Modern Approach*, 9th ed. Norton, 2014. Tirole, Jean. *The Theory of Industrial Organization*. MIT Press, 1988. Stiglitz, Joseph E. *Economics of the Public Sector*, 3rd ed. Norton, 2000.

**Online resources** — MIT OCW 14.03 (Microeconomic Theory and Public Policy); MIT OCW 14.271 (Industrial Organization I); Akerlof, G.A. "The Market for Lemons," *QJE* 1970; Coase, R. "The Problem of Social Cost," *JLE* 1960; Samuelson, P. "The Pure Theory of Public Expenditure," *REStat* 1954.

---

# Chapter 1: Review of Competitive Markets

## 1.1 The Competitive Benchmark

A **perfectly competitive market** achieves allocative efficiency: price equals marginal cost, and total surplus (consumer plus producer surplus) is maximized. Recall from ECON 390/391 that competitive equilibrium satisfies all three efficiency conditions simultaneously:

- Exchange efficiency: \( MRS_i = MRS_j \) for all consumers \( i, j \).
- Production efficiency: \( MRTS^j = MRTS^k \) for all firms \( j, k \).
- Product-mix efficiency: \( MRS = MRT \).

**Market failure** occurs whenever one or more of these conditions fails in an unregulated market. The goal of this course is to catalog the main sources of market failure and analyze both the nature of the resulting inefficiency and the potential remedies.

## 1.2 Competitive Equilibrium and Total Surplus

With supply curve \( Q^S(P) \) and demand curve \( Q^D(P) \), competitive equilibrium price \( P^* \) satisfies \( Q^S(P^*) = Q^D(P^*) \). Total surplus is

\[ TS = CS + PS = \int_0^{Q^*} \left[ D(q) - P^* \right] dq + \int_0^{Q^*} \left[ P^* - S(q) \right] dq = \int_0^{Q^*} \left[ D(q) - S(q) \right] dq, \]

where \( D(q) \) is the inverse demand and \( S(q) \) is the inverse supply. Any intervention that reduces \( Q \) below \( Q^* \) (or increases it above) generates **deadweight loss (DWL)**.

## 1.3 Price Distortions: Taxes and Trade

### 1.3.1 Commodity Taxes

A per-unit **specific tax** \( t \) on producers shifts supply up by \( t \): the new equilibrium has \( P_c = P_p + t \), where \( P_c \) is the consumer price and \( P_p \) the producer price. Quantity falls from \( Q^* \) to \( Q_t \), generating DWL \( \approx \frac{1}{2} t \cdot \Delta Q \).

**Tax incidence:** Who bears the burden depends on relative elasticities. Define the consumer's share of the tax burden:

\[ \text{Consumer burden} = \frac{\varepsilon_S}{\varepsilon_S - \varepsilon_D} \cdot t, \]

where \( \varepsilon_S > 0 \) is supply elasticity and \( \varepsilon_D < 0 \) is demand elasticity. The more inelastic side bears more of the tax.

### 1.3.2 Tariffs and Trade

A **tariff** \( t \) on imports raises the domestic price from the world price \( P_w \) to \( P_w + t \). Domestic production rises, consumption falls, imports decrease, government collects tariff revenue, and there is a net DWL from the production and consumption distortions.

---

# Chapter 2: Market Power — Monopoly and Monopsony

## 2.1 Monopoly

A **monopolist** is the sole seller in a market. Unlike a competitive firm that takes price as given, the monopolist faces the entire downward-sloping market demand curve and chooses output (or price) to maximize profit.

### 2.1.1 The Monopoly Problem

Facing inverse demand \( P(q) \) with \( P'(q) < 0 \), the monopolist maximizes

\[ \pi(q) = P(q) q - C(q). \]

The first-order condition is

\[ P(q^m) + P'(q^m) q^m = C'(q^m), \]

i.e., **marginal revenue equals marginal cost**:

\[ MR = MC. \]

Since \( MR = P\left(1 + \frac{1}{\varepsilon}\right) < P \) (where \( \varepsilon < 0 \) is the price elasticity of demand), the monopolist sets \( P^m > MC \) — a markup above marginal cost.

<div class="definition">
<strong>Lerner Index:</strong> The monopolist's price-cost markup is characterized by the <strong>Lerner index</strong>:
\[ L = \frac{P^m - MC}{P^m} = -\frac{1}{\varepsilon_D}. \]
A higher Lerner index indicates greater market power. For a competitive firm, <em>L</em> = 0 (since <em>P</em> = <em>MC</em>). A monopolist with inelastic demand (|ε| small) charges a large markup.
</div>

### 2.1.2 Deadweight Loss from Monopoly

The monopolist restricts output below the competitive level \( q^c \) to raise the price. The welfare loss is the DWL triangle:

\[ DWL = \frac{1}{2} (P^m - MC)(q^c - q^m). \]

Consumer surplus is reduced (partly transferred to the monopolist as profit, partly lost as DWL). Monopoly profit is not itself a social loss — it is a transfer from consumers to the monopolist — but the quantity restriction creates the net efficiency cost.

### 2.1.3 Price Discrimination

A monopolist with market power can increase profits (and sometimes welfare) through **price discrimination**:

- **First-degree (perfect):** Charges every consumer their exact willingness to pay. Extracts all consumer surplus; output equals the competitive level (no DWL). Practically impossible but useful as a benchmark.
- **Second-degree (nonlinear pricing):** Charges different prices based on quantity purchased (e.g., quantity discounts, two-part tariffs). Used when the monopolist cannot identify individual types.
- **Third-degree:** Charges different prices to different identifiable groups (e.g., student discounts). Efficient only if the high-elasticity group was previously excluded from the market.

<div class="example">
<strong>Two-Part Tariff:</strong> A monopolist charges an access fee <em>F</em> and a per-unit price <em>p</em>. Setting <em>p</em> = <em>MC</em> maximizes quantity (no per-unit distortion) and sets <em>F</em> equal to consumer surplus at that price — extracting all surplus via the fixed fee. This is the first-best outcome for the monopolist and eliminates the DWL from the per-unit markup.
</div>

## 2.2 Monopsony

A **monopsonist** is the sole buyer in a market (e.g., a single employer in a labor market). The monopsonist faces an upward-sloping supply curve and must raise the price to all workers to hire an additional unit.

The **marginal expenditure (ME)** on the monopsonist's \( L \)-th worker exceeds the wage:

\[ ME = w + w'(L) \cdot L > w(L). \]

The monopsonist hires where \( ME = VMP_L \) (value of marginal product), resulting in employment \( L^m < L^c \) and wage \( w^m < w^c \). Like monopoly, monopsony creates a DWL from restricting the quantity of employment below the socially efficient level.

---

# Chapter 3: Oligopoly Models

## 3.1 The Bertrand Model

In the **Bertrand model**, firms compete by simultaneously setting prices. With homogeneous goods and constant marginal cost \( c \), the unique Nash equilibrium has both firms setting \( p_1 = p_2 = c \) — the competitive outcome despite only two firms. The **Bertrand paradox** is that duopoly competition is sufficient to achieve perfect competition.

The Bertrand result breaks down with:
- **Product differentiation** (each firm has market power over its own variety).
- **Capacity constraints** (firms cannot serve all demand at marginal cost).
- **Repeated interaction** (collusion may be sustainable).

### 3.1.1 Bertrand with Differentiated Products

Let firms 1 and 2 produce differentiated goods with demands \( q_i(p_i, p_j) \). Firm \( i \) sets \( p_i \) to maximize \( \pi_i = (p_i - c) q_i(p_i, p_j) \). Best response functions slope upward (**strategic complements**): when rival raises price, firm \( i \) raises price too. Equilibrium prices exceed marginal cost, and the markup is determined by own-price elasticity and the degree of product differentiation.

## 3.2 The Cournot Model

In the **Cournot model** (reviewed from ECON 392), firms compete by simultaneously setting quantities. With \( n \) symmetric firms, the Cournot equilibrium has each firm producing

\[ q^* = \frac{a-c}{(n+1)b}, \]

where \( a \) is demand intercept and \( b \) is the slope of inverse demand. As \( n \to \infty \), the Cournot outcome converges to the competitive outcome; as \( n \to 1 \), it converges to the monopoly outcome. The **Cournot markup** is

\[ \frac{P - MC}{P} = \frac{1}{n \cdot |\varepsilon_D|}, \]

so market power decreases with the number of firms and demand elasticity.

## 3.3 The Stackelberg Model

In the **Stackelberg model**, one firm (leader) commits to a quantity before the follower. As derived in ECON 392, the leader produces more and earns more than in Cournot; the follower produces less and earns less. The equilibrium is sustained by the credibility of the leader's commitment.

## 3.4 Collusion and the Limits of Competition Policy

### 3.4.1 The Cartel Problem

A cartel of \( n \) firms sets the joint monopoly output \( q^m \) and splits the monopoly profit. Each firm has an incentive to **deviate** by producing more than its cartel quota, since at the cartel price individual marginal revenue exceeds marginal cost. In a one-shot game, the cartel is unstable. In repeated games, collusion can be sustained when the discount factor is high enough (see ECON 392).

### 3.4.2 Location Models (Hotelling)

The **Hotelling model** of spatial competition has firms choosing locations on a line segment representing product characteristics. The classic result is the **principle of minimum differentiation** — under linear transportation costs and simultaneous location choice, firms locate at the center, maximizing market share at the cost of providing poor "variety" to consumers at the ends. Under quadratic transportation costs, firms differentiate maximally. Location models show that market equilibria may provide too little or too much product variety relative to the social optimum.

---

# Chapter 4: Incomplete Information

## 4.1 Search Goods, Experience Goods, and Faith Goods

A fundamental distinction in information economics:

- **Search goods:** Quality can be verified before purchase (e.g., a car's color). Competitive markets work well.
- **Experience goods:** Quality is revealed only after purchase (e.g., a restaurant meal). Firms can exploit information asymmetry by selling one-shot.
- **Credence goods / faith goods:** Quality may never be verifiable, even after use (e.g., professional services, supplements). These create the most severe information problems.

## 4.2 Asymmetric Information: General Framework

**Asymmetric information** arises when one party to a transaction has better information than another. This generates two main problems:

1. **Hidden characteristics (adverse selection):** One party has private information about a fixed characteristic (type) before contracting.
2. **Hidden actions (moral hazard):** After contracting, one party takes an action unobservable to the other.

---

# Chapter 5: Adverse Selection and the Lemons Problem

## 5.1 Akerlof's Market for Lemons (1970)

Akerlof's celebrated paper showed that asymmetric information about product quality can cause markets to **unravel**.

<div class="example">
<strong>Used Car Market:</strong> Suppose cars are either good (worth 16,000 to sellers, 20,000 to buyers) or lemons (worth 6,000 to sellers, 8,000 to buyers). Half the cars are good, half are lemons. Sellers know their car's quality; buyers do not.

If buyers expect half the cars to be good, they are willing to pay the average value: 0.5 × 20,000 + 0.5 × 8,000 = 14,000. But sellers of good cars refuse to sell at 14,000 (they value them at 16,000). Only lemon sellers accept. Knowing this, buyers adjust expectations: all cars on the market are lemons, so they pay only 8,000. The market for good used cars completely disappears — only lemons trade.
</div>

### 5.1.1 The Adverse Selection Mechanism

Adverse selection arises because high-price signals attract low-quality traders (**adverse selection into the market**). As the offered price falls, the average quality of sellers willing to transact also falls, potentially causing a downward spiral. In Akerlof's model, the equilibrium is **separating** (only lemons trade) or involves complete market breakdown.

## 5.2 Adverse Selection in Insurance Markets

In insurance markets, buyers have private information about their own risk level. A premium that is actuarially fair for the average risk is too low for high-risk individuals (who over-insure) and too high for low-risk individuals (who may drop out). As low-risk individuals exit, the remaining pool deteriorates, premiums rise, more low-risk individuals exit — a **death spiral**.

**Rothschild-Stiglitz (1976)** showed that competitive insurance markets with adverse selection produce a **separating equilibrium** (if it exists): high-risk individuals get full coverage at a high premium; low-risk individuals get partial coverage at a low premium. The low-risk types are rationed (they bear risk they would prefer to insure away) to prevent the high-risk types from mimicking them.

<div class="theorem">
<strong>Rothschild-Stiglitz Result:</strong> In a competitive insurance market with adverse selection, no pooling equilibrium (single contract offered to all types) can be an equilibrium — it would be undercut by a separating contract targeting low-risk consumers. A separating equilibrium exists only if the proportion of high-risk consumers is not too large.
</div>

## 5.3 Responses to Adverse Selection

**Market responses:**
- **Screening:** The uninformed party designs a menu of contracts to elicit private information (e.g., offering contracts with different deductibles).
- **Signaling:** The informed party takes observable actions to credibly reveal their type (e.g., education as a signal of productivity — Spence 1973).
- **Reputation mechanisms:** Repeated interaction allows quality revelation over time.

**Policy responses:**
- **Mandatory participation:** Compulsory health insurance prevents adverse selection by pooling all risk types (the economic rationale for the ACA mandate).
- **Information disclosure:** Requiring sellers to disclose product quality.
- **Warranties and guarantees:** Allow quality signaling through costly commitments.

---

# Chapter 6: Moral Hazard

## 6.1 The Moral Hazard Problem

**Moral hazard** occurs when one party to a contract takes actions that affect the other party but that the other party cannot observe or verify. After insurance is purchased, the insured may take less care (reduce precaution); after a loan is made, the borrower may take risky investments.

### 6.1.1 A Simple Model

An agent (worker) can exert effort \( e \in \{L, H\} \) (low or high), which is unobservable to the principal (firm). Effort raises the probability of a good outcome:

\[ P(\text{good} | e=H) = p_H > p_L = P(\text{good} | e=L). \]

The agent has utility \( u(w) - c(e) \), where \( w \) is wage and \( c(H) > c(L) \).

- **First-best (observable effort):** The principal offers a contract contingent on effort. The optimal contract trades off risk allocation with effort incentives.
- **Second-best (unobservable effort):** The principal can only condition the contract on the outcome. To induce high effort, the principal must make the agent's pay **sensitive to outcomes** — paying more in the good state and less in the bad state. This exposes the risk-averse agent to risk, which is costly. The optimal contract balances incentive provision against risk-sharing.

### 6.1.2 The Principal-Agent Problem

The general **principal-agent problem** involves:

1. **Participation constraint (PC):** The agent must receive at least their reservation utility: \( E[u(w(x))] - c(e) \geq \bar{u} \).
2. **Incentive compatibility constraint (ICC):** The agent must prefer the desired effort level: \( E[u(w(x)) | e^*] - c(e^*) \geq E[u(w(x)) | e'] - c(e') \) for all \( e' \neq e^* \).

<div class="theorem">
<strong>Second-Best vs. First-Best:</strong> Under moral hazard, the second-best (incentive-compatible) contract is less efficient than the first-best:
<ul>
<li>The agent bears more risk than the first-best risk-sharing arrangement requires.</li>
<li>Less effort may be induced (distortion at the top).</li>
<li>Both parties are worse off compared to the observable-effort benchmark.</li>
</ul>
</div>

### 6.1.3 Applications

- **Insurance:** Moral hazard in health insurance leads to over-consumption of medical care; copayments and deductibles mitigate this.
- **Corporate governance:** Shareholders (principals) cannot observe all CEO (agent) actions; stock options make CEO pay sensitive to firm performance.
- **Credit markets:** Borrowers may take excessive risk when lenders bear the downside (too-big-to-fail, sovereign debt).

---

# Chapter 7: Externalities

## 7.1 Defining Externalities

An **externality** occurs when one agent's actions directly affect another agent's utility or production possibilities, outside the price system. Externalities violate the competitive efficiency conditions because private marginal cost (or benefit) diverges from social marginal cost (or benefit).

<div class="definition">
<strong>Types of Externalities:</strong>
<ul>
<li><strong>Consumption externality:</strong> Consumer A's consumption directly affects Consumer B's utility (e.g., secondhand smoke, loud music).</li>
<li><strong>Production externality:</strong> A firm's production affects another agent (e.g., a factory polluting a river used by downstream fishers).</li>
<li><strong>Negative externality:</strong> The external effect harms the third party (SMC &gt; PMC).</li>
<li><strong>Positive externality:</strong> The external effect benefits the third party (SMB &gt; PMB).</li>
</ul>
</div>

### 7.1.1 The Efficiency Loss from Negative Externalities

Let a firm produce output \( q \) with private marginal cost \( PMC(q) \) and generate pollution causing external damage \( d(q) \) on a third party. The **social marginal cost** is \( SMC(q) = PMC(q) + d'(q) \). The competitive firm ignores \( d'(q) \), producing \( q^* \) where \( P = PMC \). The social optimum is \( q^{opt} < q^* \), where \( P = SMC \). The overproduction relative to the social optimum creates a welfare loss.

## 7.2 Remedies for Externalities

### 7.2.1 Pigouvian Taxes and Subsidies

A **Pigouvian tax** equal to the external marginal damage at the optimal output can internalize the externality:

\[ t^* = d'(q^{opt}). \]

With this tax, the firm faces \( P = PMC + t^* = SMC \) and produces the socially optimal quantity. A **Pigouvian subsidy** can similarly encourage positive externalities.

**Challenges:** Measuring the external damage \( d'(\cdot) \) accurately is difficult. The regulator needs information about private costs that firms may not honestly reveal.

### 7.2.2 The Coase Theorem

Coase (1960) argued that externality problems can be resolved through private bargaining if property rights are well-defined and transaction costs are zero:

<div class="theorem">
<strong>Coase Theorem:</strong> If property rights are fully specified and transaction costs are zero, private bargaining will lead to an efficient outcome regardless of the initial assignment of property rights. The assignment of rights affects distribution but not efficiency.
</div>

**Example:** If the factory has the right to pollute, the downstream fisher may bribe the factory to reduce pollution up to the efficient level. If the fisher has the right to clean water, the factory must pay the fisher to allow some pollution. In both cases, the efficient level of pollution is produced (though the distribution of gains differs).

**Limitations of Coase:** Transaction costs are rarely zero; with many affected parties (e.g., air pollution), bargaining fails; information asymmetries create strategic hold-up problems. These limitations explain why Pigouvian taxes and regulations are the preferred policy tools for large-scale externalities.

### 7.2.3 Property Rights and the Tragedy of the Commons

The **tragedy of the commons** (Hardin 1968) describes the overuse of common-pool resources (fisheries, aquifers, shared pastures). Each user ignores the externality they impose on others by depleting the resource, leading to socially excessive exploitation.

Solutions:
- **Privatization:** Assign property rights, aligning private and social incentives.
- **Command and control:** Quotas, permits, or caps on use.
- **Cap-and-trade systems:** Issue tradeable permits up to the socially optimal aggregate; market trading ensures cost-effective allocation (e.g., EU Emissions Trading System).
- **Ostrom's community governance:** Communities often develop their own rules to manage common resources sustainably without privatization or government regulation.

---

# Chapter 8: Public Goods

## 8.1 The Defining Characteristics

<div class="definition">
<strong>Public Good:</strong> A good is a <strong>pure public good</strong> if it is:
<ul>
<li><strong>Non-rival:</strong> One person's consumption does not reduce the amount available to others.</li>
<li><strong>Non-excludable:</strong> It is impossible (or prohibitively costly) to prevent anyone from consuming the good once it is provided.</li>
Examples: national defense, lighthouses, public fireworks, basic research.
</ul>
</div>

**Club goods** are non-rival but excludable (e.g., cable TV, national parks with entry fees); **common-pool resources** are rival but non-excludable (e.g., fish stocks).

## 8.2 The Free-Rider Problem

Because public goods are non-excludable, individuals have an incentive to **free-ride** — enjoy the good without contributing to its cost. In a Nash equilibrium, each individual contributes less than is socially optimal, expecting others to provide the good.

**Samuelson's condition** for the optimal provision of a public good \( G \) is

\[ \sum_i MRS_i^{G,x} = MRT^{G,x}, \]

i.e., the sum of all individuals' marginal willingness to pay must equal the marginal cost of provision. This is in contrast to the private good optimality condition \( MRS_i = MRT \) for each \( i \). The social value of a public good reflects all individuals' willingness to pay simultaneously.

### 8.2.1 Private Provision

In the private provision Nash equilibrium, individual \( i \) contributes \( g_i \) to the public good, choosing

\[ \max_{g_i} u_i(x_i, g_i + G_{-i}) \quad \text{s.t.} \quad p_x x_i + g_i = I_i, \]

where \( G_{-i} = \sum_{j \neq i} g_j \) is others' provision. The FOC for an interior solution:

\[ MRS_i = \frac{MU_G}{MU_x} = \frac{p_G}{p_x} = 1, \]

which implies private provision satisfies \( MRS_i = 1 = MRT \) for the contributor, but the Samuelson condition requires \( \sum_i MRS_i = MRT \). Private provision therefore **under-provides** the public good unless only one consumer contributes.

## 8.3 Government Provision and the Clarke-Groves Mechanism

If the government provides the public good, it must finance it through taxation and determine the optimal quantity. The problem is that individuals have an incentive to **understate** their willingness to pay (to reduce their tax burden), making it difficult to implement the Samuelson condition.

The **Vickrey-Clarke-Groves (VCG) mechanism** provides a solution in principle: individuals are taxed based on the externality they impose on others, making truthful revelation of preferences a dominant strategy. However, VCG mechanisms may not balance the budget in general and are computationally demanding — further developed in ECON 412.

---

# Chapter 9: Antitrust Policy

## 9.1 Goals and Instruments of Antitrust

**Antitrust law** (competition policy) aims to protect competition and prevent the exercise of market power. The main concerns are:

1. **Horizontal agreements:** Cartels, price-fixing, bid-rigging.
2. **Mergers and acquisitions:** Consolidation reducing competition.
3. **Abuses of dominance:** Predatory pricing, exclusive dealing, tying arrangements.

**Instruments:** Civil and criminal penalties for horizontal price-fixing; merger review (requiring divestitures or blocking mergers); abuse of dominance enforcement.

## 9.2 Merger Analysis

A merger of two competing firms reduces the number of competitors, potentially raising prices. The standard approach models the post-merger equilibrium using Cournot or Bertrand models.

**Merger paradox (Salant, Switzer, Reynolds 1983):** In a Cournot model with linear demand, a merger of two firms (out of \( n \)) may reduce the merged entity's profits, because outsiders expand output in response. The merger is privately unprofitable unless it achieves sufficient cost savings.

**Efficiencies defense:** Mergers can generate cost savings (**synergies**) — lower marginal costs, elimination of duplicated fixed costs. The merger is welfare-improving if the efficiency gain outweighs the harm from increased market power.

## 9.3 Predatory Pricing

**Predatory pricing** involves a dominant firm pricing below cost to drive competitors out, then raising prices once competition is eliminated. The **chain store paradox** (Selten 1978) shows that in a finitely repeated game with complete information, predatory behavior cannot be an equilibrium. But with **incomplete information** about the predator's costs, predation can be an equilibrium strategy (the predator builds a "reputation for toughness").

---

# Chapter 10: Synthesis — When Markets Fail and What to Do

## 10.1 The Four Sources of Market Failure

This course identifies four canonical market failure categories:

| Market Failure | Mechanism | Remedy |
|---|---|---|
| Market power | P > MC, DWL | Antitrust, regulation |
| Externalities | Private ≠ Social MC/MB | Pigouvian tax, property rights |
| Public goods | Free-rider problem | Government provision, VCG |
| Asymmetric information | Adverse selection, moral hazard | Screening, signaling, regulation |

## 10.2 Government Failure

Government intervention is not costless. Regulations may be captured by the industries they regulate (**regulatory capture**); government enterprises may lack competitive discipline; information required for optimal Pigouvian taxes may be unavailable. The appropriate comparison is between the **imperfect market** and the **imperfect government**, not the market against a hypothetical perfect planner.

## 10.3 The First and Second Best

The **first-best** allocation is the Pareto-efficient outcome achievable when all markets function perfectly. When market failures are present, the first-best is unattainable. The **second-best** is the best achievable outcome given the constraints imposed by the market failure.

**Theorem of the Second Best (Lipsey and Lancaster, 1956):** When one Pareto optimality condition cannot be satisfied, it is generally not optimal to satisfy the remaining conditions. The second-best may require distortions elsewhere in the economy — piecemeal market correction can make things worse. This theorem counsels caution about partial reforms and motivates general equilibrium analysis of policy.
