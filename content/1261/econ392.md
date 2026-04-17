---
title: "ECON 392: Strategic Situations and Welfare Economics"
prof: "Anqi Li"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Osborne, Martin J. *An Introduction to Game Theory*. Oxford University Press, 2004.

**Supplementary texts** — Dixit, Avinash K. and Barry J. Nalebuff. *Thinking Strategically*. Norton, 1991. Fudenberg, Drew and Jean Tirole. *Game Theory*. MIT Press, 1991. Gibbons, Robert. *Game Theory for Applied Economists*. Princeton University Press, 1992.

**Online resources** — Osborne & Rubinstein, *A Course in Game Theory* (free at arielrubinstein.tau.ac.il); MIT OCW 14.12 (Economic Applications of Game Theory); Stanford Econ 202 (Game Theory).

---

# Chapter 1: Strategic Situations and Normal Form Games

## 1.1 What Is Game Theory?

Game theory studies **strategic interactions**: situations in which the payoff of each agent depends not only on their own actions but also on the actions chosen by others. Unlike competitive markets (where each agent is price-taking and small), game-theoretic settings feature a small number of agents whose individual choices materially affect one another.

Key components of a strategic situation:
- **Players:** the decision-makers.
- **Actions/Strategies:** the choices available to each player.
- **Payoffs:** the consequences (utility, profit) for each possible combination of strategies.

## 1.2 The Normal Form (Strategic Form)

The **normal form** represents a game as a simultaneous-move interaction. Formally:

<div class="definition">
<strong>Normal Form Game:</strong> A normal form game consists of:
<ol>
<li>A finite set of players <em>N = {1, 2, ..., n}</em>.</li>
<li>For each player <em>i</em>, a (nonempty) set of <strong>actions</strong> (pure strategies) <em>A<sub>i</sub></em>.</li>
<li>For each player <em>i</em>, a <strong>payoff function</strong> u<sub>i</sub>: A<sub>1</sub> × ... × A<sub>n</sub> → ℝ, mapping every action profile to player <em>i</em>'s payoff.</li>
</ol>
The action profile is a = (a<sub>1</sub>, ..., a<sub>n</sub>) ∈ A = A<sub>1</sub> × ... × A<sub>n</sub>.
</div>

The normal form treats all players as choosing simultaneously and independently, with full knowledge of the structure of the game (including other players' payoff functions) — this is **common knowledge of rationality**.

### 1.2.1 The Prisoner's Dilemma

The most famous two-player normal form game:

|  | Cooperate (C) | Defect (D) |
|---|---|---|
| **Cooperate (C)** | (3, 3) | (0, 4) |
| **Defect (D)** | (4, 0) | (1, 1) |

Player 1's payoffs are the first entries; Player 2's are the second. Regardless of what Player 2 does, Player 1 earns a higher payoff by defecting (4 > 3 when 2 cooperates; 1 > 0 when 2 defects). Defect is a **dominant strategy** for both players. Yet both defecting yields (1,1), far below the mutually cooperative (3,3). This is the Prisoner's Dilemma: individual rationality leads to collectively suboptimal outcomes.

## 1.3 Dominant Strategies and Iterated Elimination

<div class="definition">
<strong>Strict Dominance:</strong> Strategy a<sub>i</sub> <strong>strictly dominates</strong> a<sub>i</sub>' if u<sub>i</sub>(a<sub>i</sub>, a<sub>-i</sub>) &gt; u<sub>i</sub>(a<sub>i</sub>', a<sub>-i</sub>) for all a<sub>-i</sub> ∈ A<sub>-i</sub>. A rational player never plays a strictly dominated strategy.
</div>

**Iterated elimination of strictly dominated strategies (IESDS):** Remove all strictly dominated strategies from the game, then repeat until no more strategies can be eliminated. The strategies that survive IESDS are the only ones consistent with **common knowledge of rationality** — it is common knowledge that all players are rational, that all players know all players are rational, and so on.

<div class="example">
<strong>Application of IESDS:</strong> In the "Beauty Contest" game, players simultaneously choose a number in [0, 100] and the winner is the player whose number is closest to 2/3 of the average. Iteratively eliminating dominated strategies: no rational player chooses above 66.7 (since 2/3 × 100 = 66.7); knowing this, no rational player chooses above 44.4; continuing this process drives all choices to 0.
</div>

## 1.4 Best Response

<div class="definition">
<strong>Best Response:</strong> Player <em>i</em>'s best response to opponents' strategy profile a<sub>-i</sub> is the set

\[
BR_i(a_{-i}) = \arg\max_{a_i \in A_i} u_i(a_i, a_{-i}).
\]
</div>

A strategy is a best response if it maximizes payoff given the opponents' strategies. The **best response correspondence** \( BR_i(\cdot) \) maps each opponent strategy profile to the set of player \( i \)'s optimal replies.

---

# Chapter 2: Nash Equilibrium

## 2.1 Definition

<div class="definition">
<strong>Nash Equilibrium:</strong> A strategy profile a* = (a<sub>1</sub>*, ..., a<sub>n</sub>*) is a <strong>Nash equilibrium</strong> if, for every player <em>i</em>,

\[
u_i(a_i^*, a_{-i}^*) \geq u_i(a_i, a_{-i}^*) \quad \forall a_i \in A_i.
\]
Equivalently, a* is a Nash equilibrium if and only if a<sub>i</sub>* ∈ BR<sub>i</sub>(a<sub>-i</sub>*) for every player <em>i</em>.
</div>

At a Nash equilibrium, no player has an incentive to unilaterally deviate given the strategies of others. It is a **self-enforcing** prediction: if every player expects the Nash equilibrium to be played, they will indeed choose their Nash strategy.

**Nash equilibrium vs. Pareto optimality:** Nash equilibria need not be Pareto efficient. In the Prisoner's Dilemma, the unique Nash equilibrium (D,D) is Pareto inferior to (C,C). This gap between equilibrium outcomes and efficient outcomes is a central theme of ECON 393.

## 2.2 Finding Nash Equilibria

### 2.2.1 In Finite Games

In a two-player game with finite strategies, Nash equilibria can be found by inspection of best responses. Mark each player's best responses to each opponent's strategy; a Nash equilibrium is a cell where both players' strategies are mutual best responses.

<div class="example">
<strong>Battle of the Sexes:</strong>

|  | Opera (O) | Football (F) |
|---|---|---|
| <strong>Opera (O)</strong> | (2, 1) | (0, 0) |
| <strong>Football (F)</strong> | (0, 0) | (1, 2) |

Player 1 prefers Opera; Player 2 prefers Football. Both (O,O) and (F,F) are pure-strategy Nash equilibria — the players want to coordinate, but disagree on where. There is also a mixed-strategy Nash equilibrium (see Section 2.3).
</div>

### 2.2.2 In Continuous Games (Cournot Duopoly)

With continuous strategy sets, Nash equilibria are found by solving the system of first-order conditions for each player's best response.

**Cournot duopoly:** Two firms simultaneously choose quantities \( q_1, q_2 \geq 0 \). The inverse demand is \( P(Q) = a - Q \) where \( Q = q_1 + q_2 \). Firm \( i \)'s profit is

\[
\pi_i(q_i, q_j) = (a - q_i - q_j) q_i - c q_i.
\]

Firm 1's best response:

\[
\frac{\partial \pi_1}{\partial q_1} = a - 2q_1 - q_2 - c = 0 \implies q_1 = \frac{a - c - q_2}{2} = BR_1(q_2).
\]

By symmetry, \( q_2 = BR_2(q_1) = (a-c-q_1)/2 \). Solving simultaneously:

\[
q_1^* = q_2^* = \frac{a-c}{3}.
\]

The Cournot Nash equilibrium output per firm is \( (a-c)/3 \), total output is \( 2(a-c)/3 \), and price is \( P^* = (a+2c)/3 \). This lies between monopoly and competitive outcomes: Cournot competition is more efficient than monopoly but less efficient than perfect competition.

## 2.3 Mixed Strategies

A **pure strategy** assigns a single action with certainty. A **mixed strategy** is a probability distribution over actions.

<div class="definition">
<strong>Mixed Strategy:</strong> A mixed strategy for player <em>i</em> is a probability distribution σ<sub>i</sub> over A<sub>i</sub>. Player <em>i</em>'s expected payoff from strategy profile (σ<sub>1</sub>, ..., σ<sub>n</sub>) is

\[
U_i(\sigma) = \sum_{a \in A} \left(\prod_{j=1}^n \sigma_j(a_j)\right) u_i(a).
\]
</div>

A **mixed strategy Nash equilibrium** is a profile \( \sigma^* \) such that no player can increase their expected payoff by deviating.

<div class="theorem">
<strong>Nash's Existence Theorem (1950):</strong> Every finite normal-form game has at least one Nash equilibrium (possibly in mixed strategies).
</div>

**Key property of mixing:** At a mixed-strategy Nash equilibrium, each player's mixed strategy makes the other players indifferent among all actions in the support of their mixed strategy. This **indifference condition** is used to compute mixed equilibria.

### 2.3.1 Computing Mixed Equilibria

In the Battle of the Sexes, let Player 1 play Opera with probability \( p \) and Player 2 play Opera with probability \( q \). For Player 1 to be indifferent:

\[
U_1(O) = U_1(F) \implies 2q + 0(1-q) = 0 \cdot q + 1 \cdot (1-q) \implies 2q = 1-q \implies q^* = \frac{1}{3}.
\]

Similarly, for Player 2: \( p^* = 2/3 \). The mixed Nash equilibrium is \( (\sigma_1^*, \sigma_2^*) = (2/3, 1/3) \), with expected payoffs of \( 2/3 \) for Player 1 and \( 2/3 \) for Player 2 — lower than either pure strategy equilibrium.

## 2.4 Applications of Nash Equilibrium

### 2.4.1 Bertrand Price Competition

Two firms simultaneously set prices \( p_1, p_2 \) for a homogeneous product with marginal cost \( c \). Consumers buy from the cheapest firm (splitting equally if prices are equal). The unique Nash equilibrium is **Bertrand competition**: \( p_1^* = p_2^* = c \). With just two firms, competition drives price to marginal cost — the same outcome as perfect competition. This is the **Bertrand paradox**.

### 2.4.2 Coordination Games

Games like "Stag Hunt" have multiple Nash equilibria. Both (Stag, Stag) — cooperate to hunt the large prey — and (Hare, Hare) — each hunts independently — are Nash equilibria. The cooperative equilibrium Pareto dominates but is riskier. **Equilibrium selection** among multiple Nash equilibria is an important open question in game theory.

---

# Chapter 3: Extensive-Form Games with Perfect Information

## 3.1 The Extensive Form

The **extensive form** represents sequential interaction, capturing the timing of decisions, information available to each player when they act, and the payoffs at terminal nodes.

<div class="definition">
<strong>Extensive Form Game:</strong> Consists of:
<ul>
<li>A set of players <em>N</em>.</li>
<li>A <strong>game tree</strong> — a directed tree with a root (starting node), branches (actions), decision nodes, and terminal nodes.</li>
<li>An assignment of each decision node to a player (or to Nature).</li>
<li>An <strong>information partition</strong> grouping decision nodes into information sets (each information set contains nodes the acting player cannot distinguish).</li>
<li>Payoffs u<sub>i</sub>(z) for each terminal node z.</li>
</ul>
</div>

Under **perfect information**, every information set is a singleton — each player knows the complete history of play when they act. Under imperfect information, some information sets contain multiple nodes.

## 3.2 Strategies in Extensive Form Games

A **strategy** for player \( i \) in an extensive-form game specifies an action at every information set where \( i \) is the decision-maker — even information sets that may not be reached given the strategy. This completeness is important for backward induction.

## 3.3 Backward Induction and Subgame Perfect Equilibrium

<div class="theorem">
<strong>Backward Induction:</strong> In a finite extensive-form game with perfect information, backward induction proceeds from the terminal nodes backwards:
<ol>
<li>At each final decision node, the player chooses the action maximizing their payoff.</li>
<li>Replace each such node with the resulting payoff vector.</li>
<li>Repeat for the new final decision nodes.</li>
</ol>
Backward induction yields a unique outcome in games with no ties (generic games).
</div>

Backward induction eliminates **non-credible threats** — strategies where a player claims they will take an action (like punishing a defection) that they would actually not find optimal to carry out if the situation arose.

<div class="definition">
<strong>Subgame:</strong> A <em>subgame</em> of an extensive-form game is a subtree starting at any decision node, together with all successors and the associated payoffs, such that the subtree contains complete information sets (no information set is split between the subgame and the rest of the game).

<strong>Subgame Perfect Equilibrium (SPE):</strong> A strategy profile is a subgame perfect equilibrium if it induces a Nash equilibrium in every subgame of the original game.
</div>

SPE refines Nash equilibrium by requiring sequential rationality — players must be rational at every point in the game, including off-equilibrium paths.

### 3.3.1 The Stackelberg Leader-Follower Game

Firm 1 (leader) chooses quantity \( q_1 \) first; Firm 2 (follower) observes \( q_1 \) and then chooses \( q_2 \). With linear demand \( P = a - q_1 - q_2 \) and marginal cost \( c \), backward induction proceeds:

**Step 1 — Follower's best response:**

\[
q_2^*(q_1) = \frac{a - c - q_1}{2}.
\]

**Step 2 — Leader's problem:**

\[
\max_{q_1} \; (a - q_1 - q_2^*(q_1)) q_1 - c q_1 = \max_{q_1} \; \frac{(a-c-q_1)}{2} q_1.
\]

First-order condition:

\[
\frac{a-c}{2} - q_1 = 0 \implies q_1^* = \frac{a-c}{2}, \quad q_2^* = \frac{a-c}{4}.
\]

The Stackelberg leader produces more than the Cournot quantity \( (a-c)/3 \) and earns higher profit; the follower produces less and earns less. The **first-mover advantage** is a general feature of Stackelberg competition.

## 3.4 Applications

### 3.4.1 The Centipede Game

In the centipede game, two players alternate between "continue" (passing to the opponent) and "stop" (taking the current payoffs). The payoffs from continuing grow, but stopping gives you a relative advantage. Backward induction predicts that the first player stops immediately — yet this implies both players get very low payoffs, even though both could gain by cooperating for many rounds. The centipede game is a classic illustration of the tension between backward induction logic and observed behavior.

### 3.4.2 The Ultimatum Game

Player 1 proposes a division \( (s, 1-s) \) of a surplus (normalized to 1). Player 2 either accepts (getting \( 1-s \); Player 1 gets \( s \)) or rejects (both get 0). Backward induction: Player 2 accepts any \( s < 1 \) (since \( 1-s > 0 \)). Player 1 therefore offers \( s^* \to 1 \) (keeping almost everything). Experimentally, players typically propose equal splits and rejectors punish "unfair" offers — a systematic violation of backward-induction reasoning, suggesting a role for **fairness preferences** or **bounded rationality**.

---

# Chapter 4: Additional Topics — Infinite-Horizon Games

## 4.1 Repeated Games

A **repeated game** is one in which a stage game is played repeatedly. The stage game could be the Prisoner's Dilemma, Cournot oligopoly, or any other strategic interaction.

### 4.1.1 Finitely Repeated Games

If the stage game has a unique Nash equilibrium (e.g., the Prisoner's Dilemma), the unique subgame perfect equilibrium of the finitely repeated game is to play the stage-game Nash equilibrium in every period. Backward induction from the last period unravels any cooperation.

### 4.1.2 Infinitely Repeated Games and the Folk Theorem

With an infinite horizon and a discount factor \( \delta \in (0,1) \), cooperation becomes sustainable. Players value future payoffs: a payoff \( \pi \) received each period forever has present value \( \pi / (1-\delta) \). A player deviating to get a one-time gain of \( D \) while losing future cooperation payoff must compare:

- Deviation payoff: \( D + \delta \cdot \pi_{\text{punishment}} / (1-\delta) \).
- Cooperation payoff: \( \pi_C / (1-\delta) \).

Cooperation is self-enforcing when \( \delta \) is large enough.

<div class="theorem">
<strong>Folk Theorem (Informal):</strong> In an infinitely repeated game, for a sufficiently high discount factor δ, any feasible payoff vector that strictly Pareto-dominates the minmax payoff profile can be sustained as a subgame perfect equilibrium using <em>trigger strategies</em>.
</div>

**Trigger strategy:** Cooperate as long as the opponent has always cooperated; defect forever ("grim trigger") or defect for a fixed number of periods ("tit-for-tat") upon any deviation. These strategies make deviation unprofitable when \( \delta \) is large.

<div class="example">
<strong>Grim Trigger in Prisoner's Dilemma:</strong> Using payoffs from Section 1.2.1, cooperation gives stream 3 per period; defection yields 4 today and 1 every period after. For cooperation to be an SPE:

\[
\frac{3}{1-\delta} \geq 4 + \frac{\delta \cdot 1}{1-\delta} \implies 3 \geq 4(1-\delta) + \delta \implies \delta \geq \frac{1}{2}.
\]
Cooperation is sustained for δ ≥ 1/2.
</div>

## 4.2 Games with Incomplete Information

In **Bayesian games**, players have private information about their own type (e.g., their own cost, valuation, or preferences). The solution concept is **Bayes-Nash equilibrium (BNE)**: each player maximizes expected utility given their type and their beliefs about opponents' types.

This is the bridge to the more advanced material covered in ECON 412: mechanism design, auctions, and signaling.

---

# Chapter 5: Welfare Economics and Social Choice

## 5.1 Social Welfare Functions

Welfare economics studies how to aggregate individual preferences into social rankings. A **social welfare function (SWF)** \( W(u_1, \ldots, u_I) \) assigns a social ranking to each profile of utility levels.

Common SWFs:

1. **Utilitarian:** \( W = \sum_i u_i \). Maximizes aggregate utility; equivalent to giving equal weight to each individual's welfare.
2. **Rawlsian (maximin):** \( W = \min_i u_i \). Maximizes the welfare of the worst-off individual.
3. **Nash SWF:** \( W = \prod_i u_i \). Corresponds to maximizing the product of utilities.

Each SWF embeds a different ethical judgment about distribution. The utilitarian SWF is equity-blind (a gain to one person exactly offsets an equal loss to another, regardless of who is better off). The Rawlsian SWF is maximally inequality-averse.

## 5.2 Arrow's Impossibility Theorem

Is there a social welfare function satisfying a small set of reasonable axioms? Arrow (1951) proved a devastating negative result:

<div class="theorem">
<strong>Arrow's Impossibility Theorem:</strong> No social welfare function mapping individual preference orderings to a social preference ordering can simultaneously satisfy:
<ol>
<li><strong>Unrestricted domain:</strong> Works for any profile of individual preference orderings.</li>
<li><strong>Pareto principle (unanimity):</strong> If every individual prefers A to B, then society prefers A to B.</li>
<li><strong>Independence of irrelevant alternatives (IIA):</strong> The social ranking of A vs. B depends only on individual rankings of A vs. B (not on how individuals rank any third alternative C).</li>
<li><strong>Non-dictatorship:</strong> There is no individual whose preferences automatically become society's preferences.</li>
</ol>
</div>

**Implications:** Arrow's theorem shows that any voting or aggregation rule must violate at least one of these axioms. Simple majority voting satisfies the Pareto principle and non-dictatorship but may violate transitivity (**Condorcet cycles**: A beats B, B beats C, C beats A). Many real-world voting systems violate IIA.

## 5.3 The Gibbard-Satterthwaite Theorem

A related impossibility result applies to **voting mechanisms** specifically:

<div class="theorem">
<strong>Gibbard-Satterthwaite Theorem:</strong> Any voting rule over three or more alternatives that is non-dictatorial and always selects a Pareto-efficient outcome is susceptible to <strong>strategic manipulation</strong> — some voter can benefit by misrepresenting their preferences.
</div>

This connects welfare economics to mechanism design: designing institutions that elicit truthful preference revelation is fundamentally challenging. The Gibbard-Satterthwaite theorem motivates the study of incentive-compatible mechanisms in ECON 412.

## 5.4 Sen's Liberal Paradox

Amartya Sen (1970) demonstrated a conflict between **Pareto efficiency** and a minimal notion of **individual liberty**. If society respects each person's right to make decisions in their own "personal sphere" (e.g., what to read), it can lead to violations of the Pareto principle. This result challenges the view that markets can simultaneously maximize both efficiency and individual freedom.

---

# Chapter 6: Cooperative Game Theory

## 6.1 Characteristic Function Form

**Cooperative game theory** studies situations where binding agreements are possible. A game in **characteristic function form** is \( (N, v) \), where \( N \) is the player set and \( v: 2^N \to \mathbb{R} \) assigns a value \( v(S) \) to each coalition \( S \subseteq N \) — the most the coalition can guarantee itself.

## 6.2 The Core and the Shapley Value

<div class="definition">
<strong>Core:</strong> An allocation <em>x = (x<sub>1</sub>, ..., x<sub>n</sub>)</em> with ∑x<sub>i</sub> = v(N) is in the <em>core</em> if no coalition <em>S</em> can profitably deviate: v(S) ≤ ∑<sub>i∈S</sub> x<sub>i</sub> for all S ⊆ N.
</div>

The core may be empty (some games have no stable allocation), a single point, or a set of allocations. In exchange economies, the core coincides with the set of Walrasian equilibria when the economy is large (the Edgeworth core equivalence theorem).

The **Shapley value** provides a unique, axiomatically-motivated allocation that assigns each player their expected marginal contribution across all possible coalition formations:

\[
\phi_i(v) = \sum_{S \subseteq N \setminus \{i\}} \frac{|S|!(|N|-|S|-1)!}{|N|!} \left[ v(S \cup \{i\}) - v(S) \right].
\]

The Shapley value satisfies efficiency (allocates all of \( v(N) \)), symmetry, linearity, and a null player property.

---

# Summary: The Architecture of Strategic Analysis

This course develops three interconnected frameworks:

1. **Normal form / Nash equilibrium:** Simultaneous decisions; Nash equilibrium as the minimal self-consistent prediction; dominant strategies as the strongest prediction; IESDS as the logic of common knowledge.

2. **Extensive form / subgame perfect equilibrium:** Sequential decisions; backward induction as the logic of sequential rationality; credibility of threats; first- vs. second-mover advantages.

3. **Welfare and social choice:** From individual preferences to social rankings; Arrow's impossibility as a fundamental limit; connections to mechanism design and the design of institutions.

Together, these provide the language for ECON 393 (why markets fail) and ECON 412 (how to design mechanisms that work even when markets fail).
