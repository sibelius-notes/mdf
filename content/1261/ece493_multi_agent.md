---
title: "ECE 493: Foundations of Multi-Agent Systems"
prof: "Seyed Majid Zahedi"
subjects: "ECE"
---

## Sources and References

**Primary textbook** — Shoham, Y., & Leyton-Brown, K. (2009). *Multiagent Systems: Algorithmic, Game-Theoretic, and Logical Foundations*. Cambridge University Press. (Free at masfoundations.org)

**Supplementary texts** — Nisan, N., Roughgarden, T., Tardos, É., & Vazirani, V. (Eds.). (2007). *Algorithmic Game Theory*. Cambridge University Press. (Free online) — Roughgarden, T. (2016). *Twenty Lectures on Algorithmic Game Theory*. Cambridge University Press. (Free online) — Fudenberg, D., & Levine, D. K. (1998). *The Theory of Learning in Games*. MIT Press. — Osborne, M. J., & Rubinstein, A. (1994). *A Course in Game Theory*. MIT Press. (Free online) — Maschler, M., Solan, E., & Zamir, S. (2013). *Game Theory*. Cambridge University Press. — Roth, A. E., & Sotomayor, M. (1990). *Two-Sided Matching: A Study in Game-Theoretic Modeling and Analysis*. Cambridge University Press.

**Online resources** — Tim Roughgarden's lecture notes on algorithmic game theory (Stanford CS364A/B); Yoav Shoham's MOOC on Game Theory (Coursera/Stanford); MIT OCW 6.853 Topics in Algorithmic Game Theory; Vincent Conitzer's lecture notes on computational social choice (Duke).

---

# Chapter 1: Foundations of Multi-Agent Systems

## 1.1 What Is a Multi-Agent System?

A **multi-agent system (MAS)** is a computational system in which multiple autonomous **agents** interact within a shared environment. An agent is an entity that perceives its environment through sensors and takes actions that influence its environment to pursue its objectives. The defining feature distinguishing MAS from single-agent systems is **strategic interaction**: an agent's outcome depends not only on its own actions but also on the actions of every other agent in the system.

MAS arise naturally wherever multiple autonomous decision-makers operate in a shared context:

- **Economic markets**: buyers and sellers determine prices through bidding and negotiation; no single entity controls the outcome.
- **Communication networks**: routers choose paths selfishly to minimize their own congestion, producing global network behavior that no individual controls.
- **Autonomous vehicle fleets**: cars at intersections must coordinate (merge, yield, proceed) without a centralized traffic controller.
- **Multi-player games**: chess engines, poker bots, and Go programs compete against human or machine opponents with opposed objectives.
- **Resource allocation in cloud computing**: virtual machines compete for CPU, memory, and bandwidth on shared physical hardware.
- **Decentralized finance**: smart contracts enable agents to trade, lend, and provide liquidity without intermediaries.

The central question in MAS is: given that agents act rationally in pursuit of their individual objectives, what collective outcomes emerge, and can we design the rules of interaction to steer those outcomes toward desirable social goals?

## 1.2 Agent Types and Environments

The design space of MAS is organized along two axes: the **environment** (the shared world agents inhabit) and the **agent architecture** (how each agent reasons and acts).

Environments vary on several dimensions:

- **Observability**: fully observable environments give each agent complete state information; partially observable environments give each agent only a local view (captured by observations or signals).
- **Determinism**: deterministic environments produce predictable next states; stochastic environments incorporate randomness.
- **Episode structure**: episodic environments present independent tasks; sequential environments have state-dependent transitions where actions have long-run consequences.
- **Static vs. dynamic**: static environments do not change while an agent deliberates; dynamic environments continue to evolve.
- **Discreteness**: discrete state/action spaces (e.g., board games) versus continuous ones (e.g., robot control).

Agent architectures range from:

- **Purely reactive agents**: map perceptions directly to actions without internal state (subsumption architecture). Fast but unable to plan.
- **Deliberative (BDI) agents**: maintain explicit beliefs, desires, and intentions and plan sequences of actions to achieve goals.
- **Learning agents**: improve performance over time by updating parameters based on feedback (reinforcement learning, Bayesian updating).

In MAS research, agents are typically modeled as *rational* — they choose actions maximizing expected utility given beliefs — though the theory of bounded rationality and learning studies how behavior arises when agents are computationally limited.

## 1.3 Preferences, Utilities, and Rationality

An agent's preferences over outcomes are modeled by a **utility function** \(u: O \to \mathbb{R}\), where \(O\) is the set of possible outcomes. The utility function is a *numerical representation* of preferences: \(u(o_1) > u(o_2)\) if and only if the agent strictly prefers outcome \(o_1\) to \(o_2\).

<div class="theorem">
<strong>Expected Utility Theorem</strong> (von Neumann and Morgenstern, 1944). If an agent's preferences over lotteries (probability distributions over outcomes) satisfy <em>completeness</em>, <em>transitivity</em>, <em>continuity</em>, and <em>independence</em>, then there exists a utility function \(u: O \to \mathbb{R}\) such that the agent prefers lottery \(L_1\) to \(L_2\) if and only if:

\[
\mathbb{E}_{o \sim L_1}[u(o)] \geq \mathbb{E}_{o \sim L_2}[u(o)]
\]
</div>

The independence axiom — if \(L_1 \succ L_2\) then \(\alpha L_1 + (1-\alpha) L_3 \succ \alpha L_2 + (1-\alpha)L_3\) for any \(L_3\) and \(\alpha \in (0,1)\) — is the most controversial. Violations (Allais paradox, Ellsberg paradox) motivate prospect theory and ambiguity aversion models, but VNM expected utility remains the foundational rationality model in mechanism design and game theory.

**Risk attitudes** classify how an agent values uncertain outcomes:

- **Risk-neutral**: indifferent between a lottery and its expected value; linear utility.
- **Risk-averse**: prefers the certain expected value over the lottery; concave utility (e.g., \(u(w) = \ln w\)).
- **Risk-seeking**: prefers the lottery over its expected value; convex utility.

Jensen's inequality formalizes risk aversion: if \(u\) is strictly concave and \(\tilde{w}\) is a non-degenerate random variable, then \(u(\mathbb{E}[\tilde{w}]) > \mathbb{E}[u(\tilde{w})]\). The **certainty equivalent** of a lottery is the certain wealth \(c\) satisfying \(u(c) = \mathbb{E}[u(\tilde{w})]\). For a risk-averse agent, \(c < \mathbb{E}[\tilde{w}]\); the gap is the **risk premium**.

---

# Chapter 2: Normal-Form Games

## 2.1 Definitions and Canonical Examples

A **normal-form game** (strategic-form game) is a tuple \((N, A, u)\) where:

- \(N = \{1, 2, \ldots, n\}\) is the set of players.
- \(A = A_1 \times \cdots \times A_n\) is the set of **action profiles**; \(A_i\) is player \(i\)'s action set.
- \(u = (u_1, \ldots, u_n)\) where \(u_i: A \to \mathbb{R}\) is player \(i\)'s utility.

Normal-form games model simultaneous action choices under complete information (all utility functions are common knowledge). The following canonical games illustrate the main strategic archetypes:

<div class="example">
<strong>Prisoner's Dilemma</strong>: Each player chooses Cooperate (C) or Defect (D).
\[
\begin{array}{c|cc}
 & C & D \\ \hline
C & (3,3) & (0,5) \\
D & (5,0) & (1,1)
\end{array}
\]
Defect is a <em>dominant strategy</em> for both players: regardless of the opponent's choice, D yields strictly higher payoff. The unique Nash equilibrium (D, D) yields (1,1), while (C, C) yields (3,3) — the tragedy of the commons in its simplest form.
</div>

<div class="example">
<strong>Battle of the Sexes</strong>: Two partners independently choose Ballet (B) or Football (F). Partner 1 prefers Ballet, partner 2 prefers Football, but both prefer coordination over going separately.
\[
\begin{array}{c|cc}
 & B & F \\ \hline
B & (2,1) & (0,0) \\
F & (0,0) & (1,2)
\end{array}
\]
There are two pure Nash equilibria — (B, B) and (F, F) — and one mixed Nash where player 1 plays B with probability 2/3 and player 2 plays B with probability 1/3. This game models <em>coordination with conflicting preferences</em>: multiple equilibria create a selection problem.
</div>

<div class="example">
<strong>Stag Hunt</strong>: Players choose to hunt Stag (S) cooperatively or Hare (H) individually. Stag yields high payoff only if both hunt; Hare always yields a safe moderate payoff.
\[
\begin{array}{c|cc}
 & S & H \\ \hline
S & (4,4) & (0,3) \\
H & (3,0) & (3,3)
\end{array}
\]
Two pure Nash equilibria: (S, S) is Pareto-superior but <em>risk-dominated</em>; (H, H) is Pareto-inferior but <em>risk-dominant</em> (survives if players believe opponents randomize uniformly). Stag Hunt models trust and the fragility of cooperation under uncertainty.
</div>

## 2.2 Dominance and Iterated Elimination

A strategy \(s_i \in A_i\) **strictly dominates** \(s_i'\) if for all opponent profiles \(a_{-i} \in A_{-i}\):

\[
u_i(s_i, a_{-i}) > u_i(s_i', a_{-i})
\]

A strategy is **weakly dominated** if the inequality holds as \(\geq\) with strict inequality for at least one \(a_{-i}\). Rational agents never play strictly dominated strategies. **Iterated elimination of strictly dominated strategies (IESDS)** repeatedly removes all strictly dominated strategies for all players until no further elimination is possible. IESDS is:

- **Order-independent**: the surviving strategy set is the same regardless of the order of elimination.
- **Sound**: every Nash equilibrium survives IESDS.
- **Complete only in dominance-solvable games**: IESDS uniquely pins down the outcome only in games where the process terminates at a singleton.

<div class="example">
<strong>IESDS in a 3×3 game</strong>: Consider row player with actions \(\{T, M, B\}\), column player with \(\{L, C, R\}\):
\[
\begin{array}{c|ccc}
 & L & C & R \\ \hline
T & (4,3) & (5,1) & (6,2) \\
M & (2,1) & (8,4) & (3,6) \\
B & (3,0) & (9,6) & (2,8)
\end{array}
\]
For the column player: L is strictly dominated by C (1&lt;4, 1&lt;4, 0&lt;6). After removing L: for the row player, T is dominated by M (4&lt;8 vs C; 2≤3 vs R — not strictly dominated). After further checking, the process reveals R dominates others for the column player, then M dominates for the row player. IESDS identifies (M, R) as the unique survivor.
</div>

## 2.3 Nash Equilibrium

A **Nash equilibrium** is an action profile \(a^* \in A\) such that no player can improve utility by unilateral deviation:

\[
\forall i \in N, \forall a_i \in A_i: \quad u_i(a_i^*, a_{-i}^*) \geq u_i(a_i, a_{-i}^*)
\]

A **mixed strategy** \(\sigma_i \in \Delta(A_i)\) is a probability distribution over pure actions. Player \(i\)'s expected utility under a mixed strategy profile \(\sigma = (\sigma_1, \ldots, \sigma_n)\) is:

\[
u_i(\sigma) = \sum_{a \in A} u_i(a) \prod_{j \in N} \sigma_j(a_j)
\]

A mixed Nash equilibrium is a fixed point of the best-response correspondence in the space of mixed strategies.

<div class="theorem">
<strong>Nash's Existence Theorem</strong> (1950). Every finite normal-form game has at least one Nash equilibrium, possibly in mixed strategies.
</div>

<div class="proof">
Define the <strong>best-response correspondence</strong> \(\text{BR}_i(\sigma_{-i}) = \arg\max_{\sigma_i \in \Delta(A_i)} u_i(\sigma_i, \sigma_{-i})\). This is non-empty (maximization over a compact set), convex-valued (any mixture of best responses is a best response), and upper hemicontinuous (by the maximum theorem, since \(u_i\) is continuous and \(\Delta(A_i)\) is compact). The joint correspondence \(\text{BR}(\sigma) = \prod_i \text{BR}_i(\sigma_{-i})\) maps the compact convex set \(\prod_i \Delta(A_i)\) into itself and satisfies the hypotheses of Kakutani's fixed-point theorem. A fixed point \(\sigma^*\) satisfies \(\sigma^* \in \text{BR}(\sigma^*)\), which is precisely the Nash condition.
</div>

**Characterization of mixed Nash**: in any mixed Nash equilibrium, each player must be *indifferent* among all actions in their support. This follows because if a player strictly preferred one action in their support, they would deviate to play it with probability 1, contradicting the equilibrium. This indifference condition gives a system of linear equations to solve for mixing probabilities.

<div class="example">
<strong>Matching Pennies</strong>: Each player simultaneously shows H or T. Row wins if they match; column wins if they differ.
\[
\begin{array}{c|cc}
 & H & T \\ \hline
H & (1,-1) & (-1,1) \\
T & (-1,1) & (1,-1)
\end{array}
\]
No pure Nash exists. For the unique mixed Nash, row must make column indifferent: \(1 \cdot p + (-1)(1-p) = (-1)p + 1(1-p) \Rightarrow p = 1/2\). By symmetry, both mix uniformly. The expected payoff to each player is zero.
</div>

**Strict Nash equilibria** are those where every player strictly prefers their equilibrium action over any deviation. Strict Nash equilibria are always pure strategy equilibria and are isolated (no nearby mixed Nash). The Prisoner's Dilemma has a unique strict Nash (D, D).

## 2.4 Correlated Equilibrium

A **correlated equilibrium** is a probability distribution \(\sigma \in \Delta(A)\) over joint action profiles such that, if a trusted mediator draws an action profile from \(\sigma\) and privately recommends each player their component, no player benefits from deviating:

\[
\forall i, \forall a_i, a_i' \in A_i: \quad \sum_{a_{-i}} \sigma(a_i, a_{-i}) [u_i(a_i, a_{-i}) - u_i(a_i', a_{-i})] \geq 0
\]

These are linear constraints in \(\sigma\), so the set of correlated equilibria forms a **convex polytope** computable in polynomial time by linear programming. Every Nash equilibrium (and every convex combination of Nash equilibria) is a correlated equilibrium, but the converse fails.

<div class="example">
<strong>Correlated equilibrium in Battle of the Sexes</strong>: The two pure Nash equilibria are (B,B) with expected payoffs (2,1) and (F,F) with (1,2). The symmetric mixed Nash yields expected payoff (2/3, 2/3) for each player. However, a correlated equilibrium with mediator putting probability 1/2 on (B,B) and 1/2 on (F,F) yields expected payoffs (3/2, 3/2) — <em>strictly Pareto-superior</em> to the symmetric mixed Nash. Both players prefer this correlated device, which a coin flip (public randomization) implements.
</div>

## 2.5 Price of Anarchy

The **price of anarchy (PoA)** quantifies efficiency loss from selfish play:

\[
\text{PoA} = \frac{\text{optimal social welfare}}{\text{worst-case Nash equilibrium social welfare}}
\]

where social welfare is typically \(\text{SW}(a) = \sum_i u_i(a)\) (utilitarian) or \(\min_i u_i(a)\) (egalitarian). The **price of stability (PoS)** uses the best Nash equilibrium instead of the worst.

**Selfish routing** (Roughgarden & Tardos, 2002): in a network with \(k\) source-destination pairs and latency functions \(\ell_e(x)\) on each edge \(e\), each unit of flow is routed selfishly to minimize its own delay. With affine latency functions \(\ell_e(x) = a_e x + b_e\), the PoA is exactly \(4/3\): the social cost (total delay summed over all flow) of any Nash equilibrium is at most \(4/3\) times the social optimum. This bound is tight: the Braess paradox network with the shortcut achieves it.

**Braess's paradox** illustrates how adding capacity can hurt: in a network where all routes have latency 1, adding a zero-latency shortcut between the two middle nodes causes every agent to use the shortcut, increasing everyone's latency from 1 to 2. The Nash equilibrium after adding the shortcut is worse for all players than the Nash equilibrium before.

**Smooth games and the PoA bounding technique** (Roughgarden, 2009): a game is \((\lambda, \mu)\)-**smooth** if for all action profiles \(a\) and \(a^*\):

\[
\sum_i u_i(a_i^*, a_{-i}) \geq \lambda \cdot \text{OPT} - \mu \cdot \text{SW}(a)
\]

where \(\text{OPT} = \text{SW}(a^*)\) is the optimal social welfare. If a game is \((\lambda, \mu)\)-smooth, then for any Nash equilibrium \(a\):

\[
\text{SW}(a) \geq \frac{\lambda}{1+\mu} \cdot \text{OPT}
\]

giving \(\text{PoA} \leq (1+\mu)/\lambda\). Smoothness provides a **black-box** method: prove one inequality over all action profiles \((a, a^*)\), and get a PoA bound automatically. Moreover, smooth games have PoA bounds that extend to correlated equilibria, coarse correlated equilibria, and even no-regret learning outcomes — not just Nash equilibria.

For affine routing games, \((\lambda, \mu) = (1, 1/4)\) gives \(\text{PoA} \leq 4/3\), recovering the Roughgarden-Tardos result. For atomic splittable congestion games, the smoothness argument yields PoA bounds for a large class of latency functions without case-by-case analysis.

## 2.6 Potential Games and Congestion Games

A game \((N, A, u)\) is an **exact potential game** if there exists a function \(\Phi: A \to \mathbb{R}\) such that for all \(i\), all \(a_{-i}\), and all \(a_i, a_i' \in A_i\):

\[
u_i(a_i, a_{-i}) - u_i(a_i', a_{-i}) = \Phi(a_i, a_{-i}) - \Phi(a_i', a_{-i})
\]

Every unilateral deviation that improves a player's utility by \(\Delta\) increases the potential function by exactly \(\Delta\). Local maxima of \(\Phi\) are Nash equilibria. Best-response dynamics in potential games converge to Nash equilibria (since \(\Phi\) strictly increases along every improvement path and \(A\) is finite).

<div class="definition">
A <strong>congestion game</strong> is a tuple \((N, R, (A_i)_i, (d_r)_r)\) where \(R\) is a set of resources, each player \(i\) chooses a subset \(a_i \subseteq R\), and the cost to player \(i\) is \(\sum_{r \in a_i} d_r(|\{j : r \in a_j\}|)\) — the sum of resource costs, each depending only on the number of users.
</div>

<div class="theorem">
<strong>Monderer-Shapley (1996)</strong>. Every congestion game is an exact potential game with potential function:
\[
\Phi(a) = \sum_{r \in R} \sum_{k=1}^{n_r(a)} d_r(k)
\]
where \(n_r(a) = |\{i : r \in a_i\}|\) is the number of players using resource \(r\) under profile \(a\).
</div>

Network routing games, load balancing games, and market share games are all congestion games. The potential function \(\Phi\) can be interpreted as the social cost if each agent paid for all users of every resource they use, not just themselves — a key insight for mechanism design.

## 2.7 Evolutionary Game Theory and Replicator Dynamics

Evolutionary game theory abandons the hyper-rationality assumption — agents do not compute best responses but instead adopt strategies that have been successful in the past. The biological motivation is fitness-proportional reproduction, but the framework applies to cultural evolution, social norms, and learning in large populations.

A **population state** is a probability vector \(x \in \Delta(A)\) over strategies, representing the fraction of the population playing each strategy. The **fitness** of strategy \(a_i\) in state \(x\) is the expected payoff against a randomly drawn opponent from the population:

\[
f_i(x) = \sum_{j} x_j \, u(a_i, a_j)
\]

The **average fitness** is \(\bar{f}(x) = \sum_i x_i f_i(x)\). The **replicator dynamic** models selection: strategies whose fitness exceeds the population average grow in proportion, while below-average strategies shrink:

\[
\dot{x}_i = x_i \left( f_i(x) - \bar{f}(x) \right)
\]

Replicator dynamics have the following key properties:

- Strategies absent in the initial population (\(x_i = 0\)) can never appear (no mutation).
- Interior rest points of the replicator dynamic are Nash equilibria of the underlying game.
- Strict Nash equilibria are asymptotically stable rest points (Lyapunov-stable and attracting nearby trajectories).
- The replicator dynamic does not always converge — it can cycle (e.g., in Rock-Paper-Scissors it produces a neutrally stable orbit around the unique interior Nash).

<div class="definition">
A strategy \(\sigma^*\) is an <strong>evolutionarily stable strategy (ESS)</strong> if, for any mutant strategy \(\sigma \neq \sigma^*\), there exists a threshold \(\epsilon^* > 0\) such that for all invasion fractions \(\epsilon \in (0, \epsilon^*)\):

\[
u(\sigma^*, (1-\epsilon)\sigma^* + \epsilon\sigma) > u(\sigma, (1-\epsilon)\sigma^* + \epsilon\sigma)
\]
</div>

Intuitively, a population playing \(\sigma^*\) resists invasion by any mutant: incumbents always outperform the invader. The ESS conditions reduce to: (i) \(\sigma^*\) is a symmetric Nash equilibrium, and (ii) if \(\sigma\) is a best response to \(\sigma^*\), then \(u(\sigma^*, \sigma) > u(\sigma, \sigma)\) (incumbents do strictly better than mutants in mutant-vs-mutant contests).

<div class="example">
<strong>Hawk-Dove game</strong>: Two animals compete for a resource of value \(v\). A Hawk (H) always fights; a Dove (D) displays and retreats if attacked. Payoff matrix:
\[
\begin{array}{c|cc}
 & H & D \\ \hline
H & \frac{v-c}{2} & v \\
D & 0 & \frac{v}{2}
\end{array}
\]
where \(c > v > 0\) is the cost of injury. H strictly dominates if \(c < v\); if \(c > v\), neither pure strategy is an ESS. The unique interior Nash equilibrium has Hawk frequency \(p^* = v/c\). Under the replicator dynamic, this interior equilibrium is neutrally stable — the orbit is a closed loop around \(p^*\) rather than a convergent fixed point. The Hawk fraction evolves toward \(v/c\) in the time-average sense.
</div>

The connection between replicator dynamics and game theory runs deeper than just equilibrium correspondence. In symmetric two-player games, the replicator dynamic is equivalent to the **continuous-time multiplicative weights update**: populations learning by imitation implement MWU dynamics. This provides a bridge between evolutionary theory and online learning.

---

# Chapter 3: Computing Nash Equilibria

## 3.1 Linear Programming for Zero-Sum Games

A **zero-sum game** satisfies \(u_1(a) + u_2(a) = 0\) for all \(a\). The minimax theorem (von Neumann, 1928) guarantees:

\[
\max_{\sigma_1 \in \Delta(A_1)} \min_{\sigma_2 \in \Delta(A_2)} u_1(\sigma_1, \sigma_2) = \min_{\sigma_2} \max_{\sigma_1} u_1(\sigma_1, \sigma_2) =: v^*
\]

The common value \(v^*\) is the **game value**. Player 1's optimal strategy is the solution to the linear program:

\[
\begin{aligned}
\text{maximize} &\quad v \\
\text{subject to} &\quad \sum_{i} \sigma_1(a_i^1) \, u_1(a_i^1, a_j^2) \geq v \quad \forall j \\
&\quad \sum_i \sigma_1(a_i^1) = 1, \quad \sigma_1 \geq 0
\end{aligned}
\]

Player 2's optimal strategy is the dual LP. By LP duality, both LPs share the same optimal value \(v^*\), which is another proof of the minimax theorem.

**Poker** exemplifies two-player zero-sum games of imperfect information. The development of superhuman poker AI (Libratus, 2017; Pluribus, 2019) relies on solving large zero-sum extensive-form games using counterfactual regret minimization (CFR), a form of regret minimization in game trees.

## 3.2 Support Enumeration for General Games

For two-player games, a Nash equilibrium can be found by **support enumeration**: guess a support \(S_1 \subseteq A_1\) and \(S_2 \subseteq A_2\), then solve the system:

- Player 2 makes player 1 indifferent over \(S_1\): \(u_1(a_i, \sigma_2) = u_1(a_j, \sigma_2)\) for all \(a_i, a_j \in S_1\).
- Player 1 makes player 2 indifferent over \(S_2\): similarly.
- Actions outside the supports are (weakly) dominated: \(u_1(a_i, \sigma_2) \geq u_1(a_j, \sigma_2)\) for \(a_j \notin S_1\).
- Distributions sum to 1 and are non-negative.

The **Lemke-Howson algorithm** (1964) provides a constructive pivoting procedure on a complementarity polytope (vertices are Nash equilibria or the artificial equilibrium) that always terminates at a Nash equilibrium in finite steps. It is a path-following method on the graph of the polytope and can be exponential in the worst case but works well in practice.

## 3.3 Computational Complexity: PPAD-Hardness

For general \(n\)-player games, computing a Nash equilibrium is **PPAD-complete** (Daskalakis, Goldberg, Papadimitriou, 2006; Chen, Deng, Teng, 2009). PPAD ("Polynomial Parity Arguments on Directed graphs") captures problems where a solution is guaranteed to exist by a parity argument but no polynomial-time algorithm is known.

An \(\epsilon\)-Nash equilibrium relaxes the optimality condition: each player loses at most \(\epsilon\) from deviating. Computing \(\epsilon\)-Nash is also PPAD-hard for constant \(\epsilon\). This theoretical hardness motivates:

- **Heuristic methods**: gradient dynamics, replicator dynamics, double oracle.
- **Structural restrictions**: symmetric games, graphical games (sparse interaction graphs), potential games.
- **Approximation**: quasi-polynomial algorithms for specific game classes.

**Graphical games** represent MAS where each player's utility depends only on their neighbors in an interaction graph. When the graph has bounded treewidth, Nash equilibria can be computed in polynomial time via dynamic programming on the tree decomposition.

---

# Chapter 4: Extensive-Form Games

## 4.1 Game Trees and Information Sets

An **extensive-form game** models sequential interaction with a **game tree**: a directed tree where each non-leaf node is labeled by the player (or chance) to act, each edge is an action, and each leaf carries a utility vector.

**Information sets** model imperfect information. An information set \(h \subseteq H\) is a partition cell of the history set such that the current player cannot distinguish histories within \(h\) — they have the same possible actions and do not know which node they are at. A player's **behavioral strategy** assigns a distribution over actions at each information set independently.

**Perfect recall**: an agent remembers everything they have previously observed, including their own past actions. Under perfect recall, Kuhn's theorem guarantees that any mixed strategy is outcome-equivalent to a behavioral strategy.

**Strategies vs. plans**: a complete strategy specifies actions at every information set, including those unreachable under the strategy. This completeness requirement is important for defining deviations and checking equilibrium conditions in subgames.

## 4.2 Backward Induction and Subgame-Perfect Equilibrium

In a finite perfect-information game, **backward induction** computes the unique SPE:

1. At each terminal node, assign payoffs.
2. At each penultimate node, the active player selects the action maximizing their payoff among successors.
3. Propagate values up the tree to the root.

A **subgame-perfect equilibrium (SPE)** is a strategy profile that induces a Nash equilibrium in every subgame (every subtree rooted at an information singleton). SPE rules out non-credible threats: an equilibrium strategy must prescribe rational behavior at every node, even off the equilibrium path.

<div class="example">
<strong>Sequential Bargaining (Rubinstein, 1982)</strong>: Two players alternate offers for splitting a dollar. If player 1's offer is accepted, they split accordingly; if rejected, player 2 makes a counter-offer in the next period, with discount factor \(\delta \in (0,1)\) per period. The unique SPE: player 1 offers \(\left(\frac{1}{1+\delta}, \frac{\delta}{1+\delta}\right)\) and player 2 accepts immediately. As \(\delta \to 1\) (patient players), the equilibrium approaches (1/2, 1/2). The result shows that bargaining power depends on patience: the player who discounts less gets a larger share.
</div>

<div class="example">
<strong>Centipede Game</strong>: Players alternate between Pass (P) and Take (T) for 100 rounds. Taking gives the active player slightly more than passing would have given them, but each pass doubles the total pot. Backward induction predicts both players take on move 1 — the unique SPE. Experimentally, players routinely pass many times before taking, suggesting limited forward induction or social preferences.
</div>

## 4.3 One-Shot Deviation Principle

<div class="theorem">
<strong>One-Shot Deviation Principle</strong>. In a finite or discounted infinite-horizon extensive-form game, a behavioral strategy profile is subgame-perfect if and only if no player can strictly improve their payoff by deviating from the prescribed action at any single information set, holding all other information sets fixed.
</div>

This reduces SPE verification from checking all possible strategy deviations (exponentially many) to checking single-step deviations — a key tool for verifying equilibria in infinite-horizon games such as repeated games and bargaining.

## 4.4 Sequential Equilibrium and Signaling

In games with imperfect information, off-path information sets may be reached with zero probability, making it impossible to apply Bayes' rule to update beliefs. **Sequential equilibrium** (Kreps & Wilson, 1982) pairs a strategy profile \(\sigma\) with a **belief system** \(\mu\) (a probability over nodes within each information set) such that:

- **Consistency**: \((\sigma, \mu)\) is the limit of a sequence \((\sigma^n, \mu^n)\) where \(\sigma^n\) has full support and \(\mu^n\) is derived from \(\sigma^n\) via Bayes' rule.
- **Sequential rationality**: at every information set, the active player's strategy is a best response given current beliefs \(\mu\) and future play.

**Signaling games** have a two-stage structure: nature draws a sender's type \(\theta\); the sender observes \(\theta\) and sends a signal \(m\); the receiver observes \(m\) (not \(\theta\)) and takes an action. Sequential equilibria of signaling games are classified as:

- **Separating**: different types send different signals; the receiver learns the type perfectly.
- **Pooling**: all types send the same signal; the receiver learns nothing.
- **Semi-separating (partial pooling)**: mixed strategies over signal space.

<div class="example">
<strong>Job Market Signaling (Spence, 1973)</strong>: Workers are either high-productivity (type H) or low-productivity (type L). Education is costly but less so for H types. Firms observe education level but not type. In a separating equilibrium, H types acquire education level \(e^*\) satisfying \(c_H(e^*) < w_H - w_L < c_L(e^*)\), where \(c_\tau\) is type \(\tau\)'s cost of education and \(w_H > w_L\) are wages by type. Education serves as a credible signal: L types cannot profitably mimic H types. This equilibrium exists even though education is purely wasteful (no productivity gain assumed) — a key critique of credential-based hiring.
</div>

## 4.5 Perfect Bayesian Equilibrium

**Perfect Bayesian equilibrium (PBE)** is the most widely used equilibrium concept for dynamic games with incomplete information. It combines sequential rationality (best responding given beliefs) with Bayesian belief updating wherever possible.

<div class="definition">
A <strong>perfect Bayesian equilibrium</strong> is a pair \((\sigma, \mu)\) — a behavioral strategy profile and a belief system — satisfying:
<ol>
<li><strong>Sequential rationality</strong>: at every information set, the active player maximizes expected utility given their beliefs \(\mu\) about the current node and the future strategies \(\sigma\).</li>
<li><strong>Bayesian updating on path</strong>: at information sets reached with positive probability under \(\sigma\), beliefs \(\mu\) are computed by Bayes' rule.</li>
<li><strong>Consistency off path</strong>: beliefs at information sets reached with zero probability under \(\sigma\) must be specified but can be chosen to support the equilibrium (this is the key relaxation relative to sequential equilibrium).</li>
</ol>
</div>

PBE refines Nash equilibrium and subgame-perfect equilibrium. The belief updating requirement makes off-path threats and promises credible only if they are consistent with some belief system. However, because off-path beliefs are relatively unconstrained, PBE admits many spurious equilibria in signaling games — leading to further refinements.

**Refinements of PBE**: equilibrium selection is a central problem in signaling games with multiple PBE.

- **Intuitive criterion** (Cho & Kreps, 1987): eliminate equilibria sustained by "unreasonable" off-path beliefs. If type H would never benefit from sending signal \(m\) (regardless of the receiver's response), but type L might benefit, then the receiver should assign probability 0 to H after observing \(m\). Applying this criterion eliminates pooling equilibria in many signaling games, selecting the most informative separating equilibrium.
- **Divinity** and **universal divinity**: stronger refinements imposing that off-path beliefs assign positive probability only to types most likely to deviate.
- **NWBR (Never Weak Best Response)**: eliminate signals that are never weak best responses for some type, then re-apply the criterion iteratively.

<div class="example">
<strong>Beer-Quiche game (Cho-Kreps)</strong>: A potential duelist (player 2) meets a challenger (player 1) who is either Tough (T) with probability 0.9 or Wimpy (W) with probability 0.1. The challenger orders Beer (B) or Quiche (Q) for breakfast; the duelist then decides to duel or not. Tough types prefer Beer; Wimpy types prefer Quiche. Both prefer not to be dueled. The pooling equilibrium where both types order Quiche is supported by off-path beliefs that a beer-drinker is Wimpy. But the intuitive criterion eliminates this: Tough types gain from deviating to Beer (if it causes the duelist to back down) while Wimpy types never gain. Therefore the duelist should interpret Beer as a strong signal of Toughness. The unique intuitive-criterion equilibrium has Tough types ordering Beer and Wimpy types mimicking them or ordering Quiche, with the duelist backing down after Beer.
</div>

---

# Chapter 5: Repeated Games

## 5.1 Finitely Repeated Games

When stage game \(G\) is repeated \(T < \infty\) times, the **finitely repeated game** \(G^T\) has payoffs equal to the sum of stage payoffs. If \(G\) has a **unique** Nash equilibrium \(a^*\), backward induction forces play of \(a^*\) at every stage — no cooperation can be sustained:

- At stage \(T\): players play \(a^*\) regardless of history (unique terminal Nash).
- At stage \(T-1\): no future threat is credible (play at stage \(T\) is fixed), so play \(a^*\).
- By induction back to stage 1: play \(a^*\) throughout.

**Exception — multiple stage Nash equilibria**: if \(G\) has multiple Nash equilibria, cooperation can sometimes be sustained by threatening to switch to a bad equilibrium. For example, in a game where stage Nash equilibria include a "punishment" equilibrium giving both players payoff 0, players can cooperate on a high-payoff outcome by threatening to revert to punishment in the final period if anyone defects.

## 5.2 Infinitely Repeated Games and the Folk Theorem

When \(G\) repeats infinitely with discount factor \(\delta \in (0,1)\), player \(i\)'s payoff is the **discounted average**:

\[
U_i = (1-\delta) \sum_{t=0}^{\infty} \delta^t u_i(a^t)
\]

The normalization \((1-\delta)\) ensures utilities are comparable to stage-game payoffs (a constant payoff of \(x\) in every period yields discounted average \(x\)).

**Grim trigger strategy**: player \(i\) cooperates in period 0 and in every period where all players have cooperated in all previous periods; otherwise, defect forever. Under grim trigger in the Prisoner's Dilemma:

- **Payoff from cooperation**: \((1-\delta) \cdot 3 + \delta \cdot 3 + \cdots = 3\).
- **Payoff from deviating**: \((1-\delta) \cdot 5 + \delta \cdot 1 + \delta^2 \cdot 1 + \cdots = (1-\delta) \cdot 5 + \delta \cdot 1 = 5 - 4\delta\).
- Cooperation sustained iff \(3 \geq 5 - 4\delta\), i.e., \(\delta \geq 1/2\).

**Tit-for-Tat (TfT)** is an alternative strategy: cooperate in period 0; in period \(t\), repeat the opponent's action from period \(t-1\). TfT is **nice** (starts cooperating), **retaliatory** (punishes defection), **forgiving** (returns to cooperation after punishment), and **transparent** (easy to understand). Robert Axelrod's computer tournaments (1984) found TfT to be highly successful in round-robin Prisoner's Dilemma competitions, illustrating that decentralized cooperation is achievable.

<div class="theorem">
<strong>Folk Theorem</strong> (Aumann-Shapley; Fudenberg-Maskin). Let \(F^* \subseteq \mathbb{R}^n\) be the set of feasible payoff vectors (convex hull of stage-game payoffs) and let \(v_i^{\min}\) be player \(i\)'s minmax value:
\[
v_i^{\min} = \min_{\sigma_{-i}} \max_{\sigma_i} u_i(\sigma_i, \sigma_{-i})
\]
For any \(v \in F^*\) with \(v_i > v_i^{\min}\) for all \(i\), there exists \(\delta^* \in (0,1)\) such that for all \(\delta > \delta^*\), \(v\) is achievable as the payoff of a subgame-perfect equilibrium of the infinitely repeated game.
</div>

The folk theorem shows that infinite repetition enables an enormous range of equilibrium outcomes: essentially any feasible, individually rational payoff can be supported if players are sufficiently patient. The minmax value \(v_i^{\min}\) is the lowest payoff the other players can force on player \(i\) — no player will accept less than this in any SPE.

**Renegotiation-proofness** is a refinement: if after a deviation, the punishment phase prescribes equilibrium payoffs that are Pareto-dominated by alternative equilibria, players might jointly renegotiate to a better equilibrium rather than carry out the punishment. Renegotiation-proof equilibria require that the punishment phase itself be an equilibrium that players would not want to deviate from.

## 5.3 Discounting, Impatience, and Patience Dynamics

The discount factor \(\delta\) encodes both **time preference** (a dollar today is worth more than a dollar tomorrow, \(\delta < 1\)) and **continuation probability** (the game ends after each period with probability \(1 - \delta\), so \(\delta\) is the probability it continues). In the continuation probability interpretation, the folk theorem requires only that agents weigh future payoffs enough — i.e., the game is likely to continue.

**Comparative statics on \(\delta\)**: as \(\delta \to 1\) (infinitely patient players), the set of achievable equilibrium payoffs expands to the entire individually rational, feasible payoff set. As \(\delta \to 0\) (extremely impatient), agents focus only on the current period and play the stage Nash. This suggests that cooperation is easier in long-lived relationships and harder in short-term or one-shot interactions.

**Optimal punishment strategies**: grim trigger is the harshest possible punishment (defect forever) and thus sustains cooperation for the smallest \(\delta\). However, grim trigger is not **strongly renegotiation-proof**: after a defection, both players prefer the cooperative continuation to the punishment phase. **Limited punishments** (defect for \(k\) periods then resume cooperation) are renegotiation-proof but require a higher \(\delta\) to sustain cooperation. The trade-off is between the severity (which relaxes the patience requirement) and the credibility (which demands patience from both sides during the punishment).

**Reputation effects** (Kreps-Wilson-Milgrom-Roberts, 1982): in finitely repeated games where one player has a small probability of being a "committed" type (who always plays cooperatively), a rational strategic type can benefit by mimicking the committed type — a reputation equilibrium. This resolves the backward induction failure for cooperation in finite games: even a slight probability that one's opponent is irrational (always cooperates) can sustain cooperation for most of the game.

<div class="example">
<strong>Chain-store paradox (Selten, 1978)</strong>: An incumbent monopolist operates in 20 sequential markets; in each, a potential entrant decides to enter or stay out. If the entrant enters, the incumbent decides to fight (incur cost) or accommodate. Backward induction predicts accommodation in the last market, so entry occurs; by induction, entry occurs everywhere. But with a small probability \(\epsilon\) that the incumbent is "tough" (always fights), the strategic incumbent fights in early markets to build a reputation, deterring entry. Reputation effects restore the intuitive "fight to deter entry" behavior.
</div>

---

# Chapter 6: Stochastic and Bayesian Games

## 6.1 Stochastic Games

A **stochastic game** (Shapley, 1953) is a tuple \((N, S, A, P, r, \gamma)\):

- \(S\): state space.
- \(A = \prod_i A_i(s)\): joint action space (may depend on state).
- \(P: S \times A \to \Delta(S)\): stochastic transition.
- \(r_i: S \times A \to \mathbb{R}\): stage reward for player \(i\).
- \(\gamma \in [0,1)\): discount factor.

Player \(i\) maximizes \(V_i = \mathbb{E}[\sum_{t=0}^\infty \gamma^t r_i(s_t, a_t)]\). A **Markov perfect equilibrium (MPE)** restricts strategies to depend only on the current state. MPE value functions satisfy the coupled Bellman equations:

\[
V_i(s) = u_i(\sigma^*(s), s) + \gamma \sum_{s'} P(s' \mid s, \sigma^*(s)) V_i(s')
\]

where \(\sigma^*(s)\) is the Nash equilibrium of the stage game in state \(s\) given continuation values \(V_i\). For two-player zero-sum stochastic games, Shapley (1953) showed the unique MPE value exists and can be computed by value iteration:

\[
V^{k+1}(s) = \text{val}\!\left[r(s,\cdot,\cdot) + \gamma \sum_{s'} P(s' \mid s, \cdot) V^k(s')\right]
\]

where \(\text{val}[\cdot]\) is the value of the matrix game at each state. The iteration contracts by \(\gamma\) per step and converges geometrically.

## 6.2 Bayesian Games and Bayes-Nash Equilibrium

A **Bayesian game** represents incomplete information: player \(i\) has type \(\theta_i \in \Theta_i\) drawn from a joint prior \(P(\theta)\) (common knowledge). Type encodes private information (valuation, cost, signal). A strategy maps type to action: \(s_i: \Theta_i \to A_i\). A **Bayes-Nash equilibrium (BNE)** is a strategy profile where each player maximizes expected utility with respect to the type distribution and others' strategies:

\[
\forall i, \theta_i: \quad s_i(\theta_i) \in \arg\max_{a_i} \mathbb{E}_{\theta_{-i}}[u_i(a_i, s_{-i}(\theta_{-i}), \theta_i, \theta_{-i})]
\]

<div class="example">
<strong>First-price sealed-bid auction</strong>: \(n\) bidders with i.i.d. valuations \(\theta_i \sim U[0,1]\). Each submits a sealed bid; the highest bidder wins and pays their bid. In the symmetric BNE, the optimal strategy for a bidder with value \(\theta\) is:
\[
s(\theta) = \frac{n-1}{n} \theta
\]
<em>Derivation</em>: suppose all other bidders use strategy \(s(\cdot)\). Bidder \(i\) bids \(b\) and wins iff all others bid less, which happens iff \(\theta_j < s^{-1}(b)\) for all \(j \neq i\), probability \(\left(\frac{n \cdot b}{n-1}\right)^{n-1}\) for \(s^{-1}(b) = \frac{n}{n-1}b\). Bidder \(i\)'s expected profit is \((\theta - b) \cdot \Pr[\text{win}]\); maximizing over \(b\) yields \(b^* = \frac{n-1}{n}\theta\). As \(n \to \infty\), bids approach valuations (competitive equilibrium).
</div>

**Second-price auction** (Vickrey): the highest bidder wins and pays the second-highest bid. Bidding truthfully (\(b_i = \theta_i\)) is a dominant strategy: if \(b_i > \max_{j \neq i} b_j\), player \(i\) wins and pays \(\max_{j \neq i} b_j\), independent of \(b_i\) (as long as \(b_i\) remains highest); if \(b_i < \max_{j \neq i} b_j\), player \(i\) loses regardless of reducing \(b_i\). Truthful bidding is dominant regardless of others' strategies, not just in equilibrium.

## 6.3 Common Value Auctions and the Winner's Curse

In **private value auctions**, each bidder's valuation is independent of others' (knowing your rival's value would not change yours). In **common value auctions**, the object has a single true value \(v\) unknown to all, and each bidder receives a noisy signal \(\theta_i = v + \epsilon_i\) where \(\epsilon_i\) are i.i.d. mean-zero errors. Oil tract auctions, timber sales, and financial asset purchases are common value settings.

The **winner's curse**: the bidder who wins did so because they had the highest signal, which likely means their signal is an upward-biased estimate of the true value \(v\). A naive bidder who bids their signal \(\theta_i\) will on average overpay — the expected value of \(v\) conditional on winning is less than \(\theta_i\).

<div class="theorem">
In a common value auction with signals \(\theta_i = v + \epsilon_i\) and \(\epsilon_i \sim U[-e, e]\) i.i.d., the rational BNE strategy shades bids downward: the optimal bid for a bidder with signal \(\theta_i\) satisfies:

\[
b^*(\theta_i) = \mathbb{E}[v \mid \theta_i = \theta_i, \, \theta_j \leq \theta_i \;\forall j \neq i]
\]
which is strictly less than \(\theta_i\) for \(n \geq 2\).
</div>

The winner conditions on the event of winning (the highest signal), which is a downward-biased sample from the signal distribution. This gives: \(\mathbb{E}[v \mid \text{win}] = \mathbb{E}[v \mid \theta_i = \max_j \theta_j]\). In the uniform-error model with \(n\) bidders, the symmetric BNE is:

\[
b^*(\theta) = \theta - \frac{2e}{n+1}
\]

As \(n \to \infty\), bids converge to the signal (competition drives out the curse), but with small \(n\) the correction term \(2e/(n+1)\) is substantial.

**Empirical evidence**: experimental studies (Kagel & Levin, 1986) show human subjects overbid in common value auctions, suffering the winner's curse even when informed about it. Experienced bidders (e.g., professional art dealers at auctions) show less severe winner's curse effects. This has practical implications for bidding in spectrum auctions, M&A auctions, and financial asset purchases.

**Affiliated values model** (Milgrom & Weber, 1982): a general model where signals and the common value are affiliated (positively correlated). Milgrom-Weber show the **linkage principle**: auctions that reveal more information (e.g., publishing all bidder signals after the auction) generate higher expected revenue because revelation reduces the winner's curse, allowing bidders to bid more aggressively. This is why English ascending auctions generate more revenue than sealed-bid auctions in common value settings — bidders learn from others' dropping out.

---

# Chapter 7: Cooperative Game Theory

## 7.1 Transferable Utility Games

While non-cooperative game theory treats agents as acting individually, **cooperative game theory** studies coalitions of agents who can jointly coordinate and distribute payoffs. A **transferable utility (TU) game** is a pair \((N, v)\) where \(N = \{1, \ldots, n\}\) is the player set and \(v: 2^N \to \mathbb{R}\) is the **characteristic function** mapping each coalition \(S \subseteq N\) to the total value \(v(S)\) that the coalition can guarantee for itself, with \(v(\emptyset) = 0\).

**Superadditivity**: \(v(S \cup T) \geq v(S) + v(T)\) for disjoint \(S, T\) — merging coalitions never hurts. Most economic applications satisfy superadditivity.

**Convexity**: \(v(S \cup \{i\}) - v(S) \geq v(T \cup \{i\}) - v(T)\) for \(T \subseteq S\) — the marginal contribution of player \(i\) increases as the coalition grows. Convex games have particularly tractable solutions.

A **payoff vector** (or **imputation**) \(x \in \mathbb{R}^n\) is **individually rational** if \(x_i \geq v(\{i\})\) for all \(i\), and **efficient** if \(\sum_i x_i = v(N)\). An imputation specifies how the grand coalition \(N\) distributes its value.

## 7.2 The Core

<div class="definition">
The <strong>core</strong> of a TU game \((N, v)\) is the set of imputations that no coalition can improve upon:

\[
\text{Core}(v) = \left\{ x \in \mathbb{R}^n : \sum_{i \in N} x_i = v(N), \; \sum_{i \in S} x_i \geq v(S) \;\forall S \subseteq N \right\}
\]
</div>

The core may be empty (no stable allocation exists), a single point, or a convex polytope. In convex games, the core is always non-empty.

<div class="example">
<strong>Airport cost game</strong>: Three airlines share a runway. Airline 1 needs a runway of length \(L_1 = 1\), airline 2 needs \(L_2 = 2\), airline 3 needs \(L_3 = 3\) (cost proportional to length: \(c_1 = 1, c_2 = 2, c_3 = 3\)). \(v(S) = -\max_{i \in S} c_i\) (coalition must build the longest needed runway and splits the cost). The core allocates runway costs as: \(x_1 = 1/3, x_2 = 1/3 + 1/2 = 5/6, x_3 = 1/3 + 1/2 + 1 = 11/6\) — each airline pays its marginal cost contribution to the runway length. No smaller coalition can do better by building separately.
</div>

**Emptiness of the core** has important implications: if the core is empty, any proposed allocation is unstable — some coalition prefers to break away. This limits the applicability of cooperation in settings with complementarities or asymmetric bargaining power.

## 7.3 The Shapley Value

The **Shapley value** (Shapley, 1953) provides a unique efficient, fair allocation characterized by four axioms: efficiency, symmetry, dummy player, and linearity.

<div class="definition">
The <strong>Shapley value</strong> of player \(i\) in game \((N, v)\) is:

\[
\phi_i(v) = \sum_{S \subseteq N \setminus \{i\}} \frac{|S|!\,(|N|-|S|-1)!}{|N|!} [v(S \cup \{i\}) - v(S)]
\]
</div>

The Shapley value is the **average marginal contribution** of player \(i\) over all orderings of \(N\): sample a uniformly random permutation of all \(n!\) orderings of players; when player \(i\) joins the coalition of players before them, they contribute \(v(S \cup \{i\}) - v(S)\). The Shapley value is the expectation of this marginal contribution.

**Axiomatic characterization**: the Shapley value is the unique allocation satisfying:
1. *Efficiency*: \(\sum_i \phi_i(v) = v(N)\).
2. *Symmetry*: if \(v(S \cup \{i\}) = v(S \cup \{j\})\) for all \(S\), then \(\phi_i = \phi_j\).
3. *Dummy*: if \(v(S \cup \{i\}) = v(S)\) for all \(S\), then \(\phi_i = 0\).
4. *Linearity*: \(\phi(v+w) = \phi(v) + \phi(w)\) for any two games.

<div class="example">
<strong>Shapley value of the Glove game</strong>: Player 1 has a left glove; players 2 and 3 each have a right glove. A left-right pair is worth 1. \(v(\{1,2\}) = v(\{1,3\}) = 1\), \(v(\{2,3\}) = 0\), \(v(\{1,2,3\}) = 1\). There are 6 orderings:

<em>(1,2,3)</em>: Player 1 joins \(\emptyset\): contributes 0. Player 2 joins \(\{1\}\): contributes 1. Player 3 joins \(\{1,2\}\): contributes 0.
<em>(1,3,2)</em>: 0, 1, 0.
<em>(2,1,3)</em>: Player 2 joins \(\emptyset\): 0. Player 1 joins \(\{2\}\): contributes 1. Player 3: 0.
<em>(2,3,1)</em>: 0, 0, 1.
<em>(3,1,2)</em>: 0, 1, 0.
<em>(3,2,1)</em>: 0, 0, 1.

Player 1's marginal contributions: 0,0,1,1,1,1 → average 4/6 = 2/3. Players 2, 3 each: 1,1,0,0,0,0 → average 2/6 = 1/6. Shapley value: \(\phi = (2/3, 1/6, 1/6)\). Player 1 (the scarce resource) captures most of the surplus.
</div>

Computing the Shapley value exactly requires \(2^n\) coalition evaluations — exponential in \(n\). For large \(n\), the Shapley value can be estimated by Monte Carlo sampling of random orderings (with \(O(1/\epsilon^2)\) samples for \(\epsilon\)-accuracy). In machine learning, **SHAP (SHapley Additive exPlanations)** applies the Shapley value to attribute model predictions to input features, providing principled, theoretically-grounded feature attribution.

## 7.4 The Nucleolus

The **nucleolus** is an alternative single-point solution concept minimizing, in lexicographic order, the maximum **excess** \(e(S, x) = v(S) - \sum_{i \in S} x_i\) over all coalitions. The excess \(e(S, x)\) measures how much coalition \(S\) prefers to break away from the allocation \(x\) — a positive excess means \(S\) can do better on its own. The nucleolus minimizes the most-dissatisfied coalition's complaint, then minimizes the second-most-dissatisfied, and so on.

<div class="definition">
Given an imputation \(x\), the <strong>excess vector</strong> \(\theta(x) \in \mathbb{R}^{2^n - 2}\) lists the excesses of all non-empty proper coalitions in decreasing order. The <strong>nucleolus</strong> is the unique imputation minimizing \(\theta(x)\) in the lexicographic order:

\[
\eta(v) = \arg\min_{x \in I(v)} \theta(x)_{\text{lex}}
\]
where \(I(v)\) is the set of imputations.
</div>

The nucleolus always exists, is unique, and lies in the core whenever the core is non-empty. If the core is non-empty, the nucleolus is the "most central" point in the core.

<div class="example">
<strong>Nucleolus of a 3-player game</strong>: \(v(\{1\}) = v(\{2\}) = v(\{3\}) = 0\), \(v(\{1,2\}) = 0.8\), \(v(\{1,3\}) = 0.6\), \(v(\{2,3\}) = 0.4\), \(v(\{1,2,3\}) = 1\).

The core requires \(x_1 + x_2 \geq 0.8\), \(x_1 + x_3 \geq 0.6\), \(x_2 + x_3 \geq 0.4\), \(x_1 + x_2 + x_3 = 1\), \(x_i \geq 0\). The largest excess coalition determines the nucleolus. Setting all pair excesses equal: \(e(\{1,2\}) = 0.8 - x_1 - x_2\), \(e(\{1,3\}) = 0.6 - x_1 - x_3\), \(e(\{2,3\}) = 0.4 - x_2 - x_3\). At the nucleolus, excesses are equalized: solving \(e_{12} = e_{13}\) gives \(x_3 - x_2 = 0.2\); \(e_{12} = e_{23}\) gives \(x_1 - x_3 = 0.4\). With \(x_1 + x_2 + x_3 = 1\): nucleolus is approximately \(x_1 \approx 0.6, x_2 \approx 0.2667, x_3 \approx 0.1333\). Compare Shapley value: \(\phi \approx (0.567, 0.300, 0.133)\) — the nucleolus gives slightly less to player 1 and slightly more to player 2, reflecting its egalitarian emphasis.
</div>

**Banzhaf power index**: an alternative to the Shapley value for measuring voting power in weighted majority games. The **Banzhaf index** for player \(i\) is the fraction of coalitions (not orderings) in which player \(i\) is a "swing voter" — their removal changes the outcome from winning to losing:

\[
\beta_i = \frac{|\{S \subseteq N \setminus \{i\} : v(S \cup \{i\}) = 1, \, v(S) = 0\}|}{2^{n-1}}
\]

Unlike the Shapley value, the Banzhaf index does not require normalization to sum to 1, so it measures absolute rather than relative power. In the US Electoral College, both Shapley-Shubik and Banzhaf indices show large states have disproportionate power due to winner-take-all allocation — a key argument in debates over Electoral College reform.

The nucleolus tends to be more egalitarian than the Shapley value — it focuses on the worst-off coalition rather than average marginal contributions.

## 7.5 Matching Markets

**Two-sided matching** studies how to match agents from two groups (e.g., workers and firms, students and schools) based on their preferences.

<div class="definition">
A <strong>matching</strong> \(\mu: W \cup F \to W \cup F\) assigns each worker \(w\) to a firm \(\mu(w) \in F \cup \{w\}\) and each firm \(f\) to a set of workers \(\mu(f) \subseteq W\). A matching is <strong>stable</strong> if there is no blocking pair: a worker \(w\) and firm \(f\) such that \(w\) prefers \(f\) to \(\mu(w)\) and \(f\) prefers \(w\) to some current match (or has an unfilled slot).
</div>

<div class="theorem">
<strong>Gale-Shapley Algorithm (1962)</strong>. The deferred acceptance (DA) algorithm produces a stable matching. Worker-proposing DA:
<ol>
<li>Each unmatched worker proposes to their most preferred firm not yet rejected.</li>
<li>Each firm tentatively holds its most preferred proposal so far and rejects the rest.</li>
<li>Repeat until no unmatched worker can propose.</li>
</ol>
</div>

The worker-proposing DA produces the **worker-optimal** stable matching: every worker weakly prefers this matching to any other stable matching. The firm-proposing DA produces the firm-optimal stable matching. Under DA, it is a dominant strategy for workers to report their preferences truthfully — DA is strategyproof for the proposing side.

**Complexity of stable matching**: the set of stable matchings forms a distributive lattice (Knuth, 1976). Worker-optimal and firm-optimal matchings are the two extreme points; all other stable matchings lie between them. Every worker weakly prefers the worker-optimal matching to any other stable matching, and every firm weakly prefers the firm-optimal — a conflict of interest that cannot be resolved. The number of stable matchings can be exponential in the number of agents, but the worker-optimal and firm-optimal matchings can be found in \(O(n^2)\) time.

**Strategic behavior by firms**: although DA is strategyproof for workers, firms can benefit from misreporting their preferences. A firm may truncate its preference list (reporting only a subset of acceptable workers) to obtain a better match. However, Roth (1984) showed that no firm can benefit from truncation unless it is willing to remain unmatched, and in many practical settings the incentives for strategic behavior are weak.

<div class="theorem">
<strong>Rural Hospital Theorem (Roth, 1986)</strong>. In any two-sided matching market: (1) the set of agents who are matched is the same across all stable matchings; (2) any agent who is unmatched in one stable matching is unmatched in all stable matchings; (3) any hospital that fails to fill all its slots in one stable matching fails to fill all its slots in every stable matching.
</div>

The rural hospital theorem has a striking practical implication: in the NRMP, rural hospitals that fail to fill their residency slots under one stable mechanism will fail under any stable mechanism — the problem is a mismatch of supply and demand, not a deficiency of the matching algorithm. This is used to argue for direct subsidies to rural programs rather than redesigning the matching algorithm.

**One-to-many matching** (college admissions): each hospital (college) has a capacity \(q_h \geq 1\) and may match with multiple workers (students). DA extends directly: workers propose in order of preference; hospitals tentatively hold their top-\(q_h\) proposals and reject the rest. The generalized Gale-Shapley algorithm produces a worker-optimal stable matching in \(O(n^2)\) time even with capacities.

**Applications**: the National Resident Matching Program (NRMP) uses Gale-Shapley to match medical students to residency programs. School choice systems (Boston, NYC, Chicago) use DA-based mechanisms. Kidney exchange programs use variations of matching to find chains and cycles of compatible donor-recipient pairs.

---

# Chapter 8: Social Choice Theory

## 8.1 Social Welfare Functions

**Social choice theory** studies how to aggregate individual preferences into a collective decision. A **social welfare function (SWF)** maps a profile of individual preference orderings \((\succ_1, \ldots, \succ_n)\) to a social preference ordering \(\succ^*\). Desirable properties:

- **Pareto efficiency**: if all agents prefer \(x\) to \(y\), then \(x \succ^* y\).
- **Independence of irrelevant alternatives (IIA)**: the relative ranking of \(x\) and \(y\) in \(\succ^*\) depends only on agents' relative rankings of \(x\) and \(y\), not on rankings of other alternatives.
- **Non-dictatorship**: no single agent \(d\) such that \(\succ^* = \succ_d\) for all profiles.

<div class="theorem">
<strong>Arrow's Impossibility Theorem (1951)</strong>. With at least 3 alternatives and 2 agents, no social welfare function satisfies Pareto efficiency, IIA, and non-dictatorship simultaneously.
</div>

The proof proceeds by showing that any SWF satisfying Pareto and IIA must have a "pivotal voter" who is a dictator. Arrow's theorem is foundational: it shows that no voting rule can simultaneously satisfy these minimal rationality requirements. The escape routes are either to weaken IIA (cardinal utilities), use randomized social choices (lotteries), or restrict the domain of preferences.

## 8.2 Voting Rules

A **social choice function (SCF)** selects a single winner (or ranking) from a preference profile. Major voting rules:

- **Plurality**: each voter names one alternative; the plurality winner has the most first-place votes. Simple but manipulable and can elect a Condorcet loser.
- **Borda count**: each voter ranks all alternatives; the alternative with rank \(k\) receives \(m-k\) points. Sensitive to introduction of irrelevant alternatives.
- **Condorcet winner**: alternative \(x\) beats every other alternative in pairwise majority voting. Condorcet winners need not exist (Condorcet cycles: \(A \succ B \succ C \succ A\) in majority preferences).
- **Kemeny rule**: find the ranking \(\sigma^*\) minimizing the sum of pairwise disagreements with voter preferences. NP-hard to compute but provides a principled Condorcet-consistent rule.
- **Single transferable vote (STV)**: iteratively eliminate the alternative with the fewest first-place votes, redistributing those ballots. Used in Irish elections and Australia.

<div class="theorem">
<strong>Gibbard-Satterthwaite Theorem (1973/1975)</strong>. Any surjective (onto) social choice function over 3 or more alternatives that is strategyproof (truthful reporting is a dominant strategy for every agent) must be dictatorial.
</div>

This is the mechanism design analogue of Arrow's theorem: just as no SWF is Pareto-efficient, IIA-satisfying, and non-dictatorial, no SCF over 3+ alternatives is strategyproof and non-dictatorial. This motivates restricting to structured domains (single-peaked preferences), randomized mechanisms, or approximate strategyproofness.

**Single-peaked preferences** (Black, 1948): preferences are single-peaked if there exists an ordering of alternatives such that each agent's utility is unimodal. Under single-peakedness, the **median voter theorem** holds: the Condorcet winner is the median of agents' ideal points, and plurality voting selects it. This explains why electoral competition often drives candidates toward the center (median voter).

## 8.3 Computational Complexity of Manipulation

**Manipulation** in voting means a voter misreports their preferences to obtain a better outcome under the social choice rule. Gibbard-Satterthwaite shows manipulation is always theoretically possible (except for dictatorships), but the manipulation may require the voter to know others' preferences — which is computationally hard to exploit.

**Manipulation is NP-hard for many rules**: Bartholdi, Tovey & Trick (1989) showed that determining whether a single voter can manipulate the outcome under the Kemeny rule is NP-hard (since computing the Kemeny winner is NP-hard). For the STV rule, determining whether a coalition of \(k\) voters can jointly manipulate is NP-hard even when each voter's preferences are fixed — because of the complex elimination order. Similarly, coalitional manipulation of the Borda rule, Copeland rule, and positional scoring rules is NP-hard for large coalitions.

**Frequency of manipulation**: even when manipulation is computationally easy, it may be rare in practice. Computational social choice theory studies the average-case complexity of manipulation — for many rules and random preference profiles, the probability that a random voter can beneficially manipulate tends to zero as the number of voters grows (Conitzer & Sandholm, 2006). This suggests that manipulation hardness may be less important practically than the rarity of opportunities.

**Approval voting**: each voter submits a subset of alternatives they "approve"; the alternative approved by the most voters wins. Approval voting is simple, strategyproof in the sense that each voter's optimal strategy (report the set of alternatives they prefer to the expected winner) is easy to compute, and resistant to many Arrow-type impossibility arguments. The **Condorcet efficiency** of approval voting — probability it selects the Condorcet winner — is high under probabilistic preference models.

**Liquid democracy**: a hybrid between direct and representative democracy. Each voter can either vote directly on issues or delegate their vote to a trusted representative, who can further delegate. Vote weight accumulates at non-delegating voters. Liquid democracy has been proposed for online communities (Liquid Feedback, DemocracyOS) as a mechanism that interpolates between direct participation (high information cost) and representative democracy (risk of misrepresentation). The game-theoretic analysis of strategic delegation — when to delegate and to whom — is an active research area.

---

# Chapter 9: Mechanism Design

## 9.1 The Mechanism Design Problem

**Mechanism design** (reverse game theory) asks: given a social objective, design the rules of a game so that rational agents' equilibrium behavior achieves that objective. The designer chooses the mechanism (game form); agents' types (private information) determine their strategies.

A **direct mechanism** elicits type reports \(\hat{\theta}_i\) and maps them to outcomes: allocation rule \(x: \Theta \to X\) and payment rule \(p: \Theta \to \mathbb{R}^n\). Under quasi-linear preferences, agent \(i\)'s utility is \(u_i = v_i(x, \theta_i) - p_i\).

## 9.2 Incentive Compatibility and the Revelation Principle

A mechanism is **dominant-strategy incentive compatible (DSIC)** (strategyproof) if truthful reporting dominates all alternatives regardless of others' reports:

\[
\forall i, \theta_i, \hat{\theta}_i, \hat{\theta}_{-i}: \quad u_i(x(\theta_i, \hat{\theta}_{-i}), p(\theta_i, \hat{\theta}_{-i}), \theta_i) \geq u_i(x(\hat{\theta}_i, \hat{\theta}_{-i}), p(\hat{\theta}_i, \hat{\theta}_{-i}), \theta_i)
\]

<div class="theorem">
<strong>Revelation Principle</strong>. For any mechanism \(M\) with a Bayes-Nash equilibrium \(\sigma^*\), there exists a direct mechanism \(M'\) that is Bayesian incentive compatible and implements the same social choice function.
</div>

The revelation principle collapses the design problem: it suffices to search over DSIC (or BIC) direct mechanisms.

**Individual rationality (IR)**: a mechanism is IR (or **participation-compatible**) if each agent prefers participating to staying out: \(u_i(x(\theta), p(\theta), \theta_i) \geq u_i^0\) where \(u_i^0\) is the outside option utility (often normalized to 0).

## 9.3 Vickrey-Clarke-Groves (VCG) Mechanisms

<div class="definition">
A <strong>VCG mechanism</strong>: (1) selects the welfare-maximizing allocation \(x^*(\hat{\theta}) = \arg\max_x \sum_i \hat{v}_i(x, \hat{\theta}_i)\); (2) charges each agent \(i\) the payment \(p_i(\hat{\theta}) = h_i(\hat{\theta}_{-i}) - \sum_{j \neq i} \hat{v}_j(x^*(\hat{\theta}), \hat{\theta}_j)\) for some function \(h_i\) independent of \(\hat{\theta}_i\).
</div>

<div class="theorem">
<strong>VCG Theorem</strong>. Every VCG mechanism is DSIC.
</div>

<div class="proof">
Agent \(i\)'s utility is \(u_i = v_i(x^*, \theta_i) - p_i = v_i(x^*, \theta_i) + \sum_{j \neq i} \hat{v}_j(x^*, \hat{\theta}_j) - h_i(\hat{\theta}_{-i})\). The term \(h_i(\hat{\theta}_{-i})\) is independent of \(\hat{\theta}_i\). The VCG chooses \(x^*\) to maximize \(\hat{v}_i(x^*, \hat{\theta}_i) + \sum_{j \neq i} \hat{v}_j(x^*, \hat{\theta}_j)\). If \(\hat{\theta}_i = \theta_i\), this maximizes exactly \(u_i + h_i(\hat{\theta}_{-i})\), hence maximizes \(u_i\). Truthful reporting maximizes agent \(i\)'s utility regardless of others' reports.
</div>

The standard VCG payment (Clarke pivot rule) sets \(h_i(\hat{\theta}_{-i}) = \max_x \sum_{j \neq i} \hat{v}_j(x, \hat{\theta}_j)\): each agent pays their externality — the loss they impose on everyone else from being in the system.

**Vickrey auction** as VCG: single item, \(v_i(x, \theta_i) = \theta_i \cdot x_i\). VCG allocates to the highest-valuation bidder; the payment is \(h_i - \sum_{j \neq i} v_j(x^*) = \max_{j \neq i} \theta_j\) — the second-highest bid. This makes the Vickrey auction a special case of VCG.

**Limitations of VCG**: (1) VCG may run a deficit (total payments may fall short of the cost of provision). (2) VCG is not group strategyproof: coalitions of agents may jointly misreport to benefit. (3) In combinatorial settings, computing the welfare-maximizing allocation is NP-hard, requiring approximation.

## 9.4 Revenue Equivalence and Optimal Auctions

<div class="theorem">
<strong>Revenue Equivalence Theorem</strong>. Any two auctions allocating the item to the same winner for all valuation profiles and giving zero expected utility to the lowest type yield the same expected revenue.
</div>

As a consequence, first-price, second-price, all-pay, and Dutch auctions all yield the same expected revenue under symmetric i.i.d. risk-neutral bidders. The theorem does not determine which auction maximizes revenue; that is Myerson's contribution.

**Myerson's optimal auction** (1981): maximizes expected revenue over all DSIC, IR mechanisms. Define the **virtual valuation**:

\[
\psi_i(\theta_i) = \theta_i - \frac{1 - F(\theta_i)}{f(\theta_i)}
\]

The optimal mechanism allocates to the bidder with the highest non-negative virtual valuation; if all virtual valuations are negative, the item is withheld. For uniform \(\theta \sim U[0,1]\), \(\psi(\theta) = 2\theta - 1\), and the optimal reserve price is \(r = 1/2\).

**Ironing**: if the virtual valuation function is not monotone, Myerson's "ironing" procedure replaces it with a monotone function over intervals where the revenue function is concave, enabling the revenue-optimal mechanism to be defined even for irregular distributions.

## 9.5 Combinatorial Auctions

A **combinatorial auction** allocates \(m\) items to \(n\) bidders where each bidder has a value for every subset of items. The mechanism must determine both the allocation (which subsets go to which bidders) and payments.

**Winner determination problem (WDP)**: find the allocation maximizing total declared value:

\[
\max_{S_1, \ldots, S_n \subseteq M} \sum_i v_i(S_i, \hat{\theta}_i) \quad \text{s.t.} \quad S_i \cap S_j = \emptyset \;\forall i \neq j
\]

WDP is NP-hard in general (reduces to weighted set packing). For many realistic bidding languages (XOR bids, OR bids), WDP can be solved with branch-and-bound or column generation for moderate instance sizes.

**VCG for combinatorial auctions**: apply VCG to the WDP — each bidder pays their externality. This is DSIC but may run a deficit and requires solving NP-hard optimization for each bid-minus-one profile. The FCC spectrum auctions (1994 onward) use simultaneous ascending auctions rather than VCG, motivated by computational and revenue concerns.

## 9.6 Bilateral Trade and the Myerson-Satterthwaite Impossibility

**Bilateral trade**: a seller has an object with private cost \(c \sim F_S\) on \([0,1]\); a buyer has private valuation \(v \sim F_B\) on \([0,1]\). Trade is efficient iff \(v \geq c\). Can a mechanism implement efficient trade while being DSIC, IR, and **budget-balanced** (no external subsidy)?

<div class="theorem">
<strong>Myerson-Satterthwaite Theorem (1983)</strong>. With a seller whose cost is distributed on \([c_{\min}, c_{\max}]\) and a buyer whose valuation is distributed on \([v_{\min}, v_{\max}]\) with \(c_{\min} < v_{\max}\) and overlapping supports, no DSIC, IR, and budget-balanced mechanism can always implement the efficient allocation.
</div>

The proof uses the envelope theorem to characterize incentive-compatible payment rules, then shows that the expected budget surplus required for efficiency is strictly positive under all IC, IR mechanisms. In other words, efficient bilateral trade always requires either a subsidy (violating budget balance), some inefficiency (violating full efficiency), or some loss of incentive compatibility.

**Practical consequences**: used car markets, labor negotiations, M&A deals, and patent licensing are all bilateral trade settings. Myerson-Satterthwaite implies that some inefficiency is unavoidable in decentralized trade — motivating the use of intermediaries, posted prices, or posted-bid mechanisms that trade off efficiency against budget balance.

**Double auctions** (k-double auction): the seller posts a reservation cost \(r_s\) and the buyer posts a value \(r_b\); trade occurs at price \(p = k r_b + (1-k)r_s\) if \(r_b \geq r_s\), where \(k \in [0,1]\) is a design parameter. Double auctions are budget-balanced (the auctioneer collects zero profit) and DSIC (for \(k = 0\) or \(k = 1\)) but not fully efficient. For \(k = 1/2\) (split-the-difference), no dominant-strategy equilibrium exists, but Bayesian equilibria achieve high efficiency in large markets (Wilson, 1987).

**Large markets**: as the number of buyers and sellers grows, the efficiency loss from double auctions vanishes — competitive equilibrium is approximately achieved. This justifies the use of posted-price mechanisms in large online markets (Amazon, eBay buy-it-now) even though they are not fully efficient in thin markets.

---

# Chapter 10: Learning in Multi-Agent Systems

## 10.1 Fictitious Play

**Fictitious play** is a classical learning rule where each player tracks the **empirical frequency** of opponents' past actions and best-responds to it. At round \(t+1\):

\[
a_i^{t+1} \in \arg\max_{a_i} \; u_i\!\left(a_i, \frac{1}{t}\sum_{\tau=1}^{t} a_{-i}^\tau\right)
\]

**Convergence results**:

- **Zero-sum games**: fictitious play time-averages converge to Nash (Robinson, 1951).
- **Identical interest games** (common payoff): fictitious play converges.
- **2×2 games**: fictitious play converges to Nash or cycles (Monderer-Shapley, 1996).
- **General games**: fictitious play may cycle indefinitely, even in simple 3×3 coordination games (Shapley, 1964 showed a 3-player game where fictitious play cycles).

Despite non-convergence in general, fictitious play is the theoretical ancestor of many practical learning algorithms and provides intuition for why agents' beliefs converge in simple environments.

## 10.2 Regret Minimization

**External regret** measures how much an agent could have improved by fixing a single action:

\[
R_i^T = \max_{a_i^* \in A_i} \sum_{t=1}^T u_i(a_i^*, a_{-i}^t) - \sum_{t=1}^T u_i(a_i^t, a_{-i}^t)
\]

A learning algorithm is **Hannan-consistent** (no-regret) if \(R_i^T / T \to 0\).

**Multiplicative Weights Update (MWU)** achieves no-regret:

\[
w_i^{t+1}(a) = w_i^t(a) \cdot \exp\!\left(\epsilon \cdot u_i(a, a_{-i}^t)\right)
\]

\[
\sigma_i^t(a) = \frac{w_i^t(a)}{\sum_{a'} w_i^t(a')}
\]

With step size \(\epsilon = \sqrt{\ln|A_i|/T}\), MWU achieves \(R_i^T = O(\sqrt{T \ln |A_i|})\), hence average regret \(O(\sqrt{\ln |A_i| / T}) \to 0\).

**EXP3** (Exploration-Exploitation with Expert advice): a bandit variant of MWU where payoffs are observed only for the chosen action. EXP3 achieves \(\tilde{O}(\sqrt{T |A_i|})\) regret in the adversarial bandit model, trading sample efficiency for robustness.

**Internal regret** (swap regret) measures regret for swapping action \(a\) for \(a'\) whenever action \(a\) is played:

\[
R_i^{\text{swap}} = \max_{f: A_i \to A_i} \sum_{t=1}^T u_i(f(a_i^t), a_{-i}^t) - \sum_{t=1}^T u_i(a_i^t, a_{-i}^t)
\]

Algorithms with no internal regret exist and can be constructed from no-external-regret algorithms. Importantly:

<div class="theorem">
If all players run no-external-regret algorithms, time-average joint play converges to the set of <strong>coarse correlated equilibria</strong>. If all players run no-internal-regret algorithms, time-average joint play converges to the set of <strong>correlated equilibria</strong>.
</div>

Since correlated equilibria \(\subseteq\) coarse correlated equilibria, and Nash equilibria \(\subseteq\) correlated equilibria, no-regret learning provides a constructive, decentralized path to equilibrium concepts without explicit coordination.

**Convergence to Nash**: in two-player zero-sum games, if both players run MWU (or any no-regret algorithm), time-average play converges to the Nash equilibrium (minimax strategies). This underpins the training of generative adversarial networks (GANs) and adversarial training in ML.

## 10.3 Counterfactual Regret Minimization

**Counterfactual regret minimization (CFR)** (Zinkevich et al., 2007) is a regret minimization algorithm tailored to extensive-form games, particularly large imperfect information games like poker. CFR decomposes external regret over the game tree into counterfactual regrets at individual information sets, enabling efficient updates via tree traversal.

**Counterfactual value**: for information set \(h\) and action \(a\), the counterfactual value is the expected utility the player would receive in the subgame rooted at \(h\), if they were to reach \(h\) and play action \(a\), weighted by the probability that opponents would have played to reach \(h\):

\[
v_i^\sigma(h, a) = \sum_{z \in Z_h^a} \pi_{-i}^\sigma(h) \cdot \pi^\sigma(h, z) \cdot u_i(z)
\]

where \(\pi_{-i}^\sigma(h)\) is the counterfactual reach probability (probability of reaching \(h\) assuming player \(i\) always tried to reach \(h\)), and \(\pi^\sigma(h, z)\) is the probability of reaching terminal node \(z\) from \(h\) under \(\sigma\).

The **instantaneous counterfactual regret** for action \(a\) at information set \(h\) at time \(t\) is:

\[
r^t(h, a) = v_i^{\sigma^t}(h, a) - v_i^{\sigma^t}(h)
\]

where \(v_i^{\sigma^t}(h) = \sum_a \sigma^t(h, a) \, v_i^{\sigma^t}(h, a)\) is the value of the current strategy at \(h\). CFR updates strategies using cumulative regret:

\[
R^T(h, a) = \sum_{t=1}^T r^t(h, a)
\]

\[
\sigma^{T+1}(h, a) = \frac{\max(R^T(h,a), 0)}{\sum_{a'} \max(R^T(h,a'), 0)}
\]

(defaulting to uniform if all cumulative regrets are non-positive). CFR achieves \(O(\sqrt{T})\) average counterfactual regret at each information set, and the time-average strategy \(\bar{\sigma}^T\) converges to an \(\epsilon\)-Nash equilibrium with \(\epsilon = O(1/\sqrt{T})\).

**CFR+ and Monte Carlo CFR (MCCFR)**: CFR+ (Tammelin et al., 2015) uses a positivity-clipped regret update that converges much faster in practice. MCCFR samples a subset of the game tree (chance sampling, external sampling, or outcome sampling) at each iteration, enabling CFR to scale to games where full tree traversal is infeasible.

**Poker applications**: Libratus (Brown & Sandholm, 2017) defeated four top human poker professionals in heads-up no-limit Texas Hold'em using CFR+ with abstraction, blueprint strategies, and real-time endgame solving. Pluribus (Brown & Sandholm, 2019) extended this to six-player poker, defeating elite professionals in a setting far beyond two-player zero-sum theory.

**CFR in abstracted games**: real-world poker has \(10^{161}\) nodes. CFR is applied to an *abstracted* game (bucketing information sets with similar payoffs) and the resulting blueprint strategy is played in the real game. Game abstraction theory (Sandholm, 2015) bounds the exploitability of the resulting strategies in terms of the quality of the abstraction.

## 10.4 Multi-Agent Reinforcement Learning

**Multi-agent reinforcement learning (MARL)** addresses the full stochastic game setting: agents simultaneously learn optimal policies from experience.

**Independent Q-learning (IQL)**: each agent \(i\) runs Q-learning treating others as part of the environment:

\[
Q_i(s, a_i) \leftarrow Q_i(s, a_i) + \alpha \left[r_i + \gamma \max_{a_i'} Q_i(s', a_i') - Q_i(s, a_i)\right]
\]

IQL is simple but non-stationary from each agent's perspective (others' policies change during learning). Convergence is not guaranteed even in simple cooperative settings.

**Nash Q-learning** (Hu & Wellman, 2003): at each update, compute the Nash equilibrium of the current estimated game in state \(s'\) and use Nash equilibrium values as targets:

\[
Q_i(s, a) \leftarrow Q_i(s, a) + \alpha \left[r_i + \gamma \text{NashVal}_i(Q(s')) - Q_i(s, a)\right]
\]

Nash Q-learning converges under conditions including uniqueness and global optimality of Nash equilibria in every state-game. Computing Nash Q in each step is expensive (PPAD-hard in general).

**MADDPG (Multi-Agent DDPG)** uses centralized training with decentralized execution (CTDE): during training, each agent's critic takes all agents' observations and actions as input:

\[
L(\phi_i) = \mathbb{E}_{s,a,r,s'}\!\left[\left(Q_i^\phi(s, a_1, \ldots, a_n) - y_i\right)^2\right], \quad y_i = r_i + \gamma Q_i^{\phi^-}(s', \pi_1'(o_1'), \ldots, \pi_n'(o_n'))
\]

Each agent's actor sees only its own observation \(o_i\) and outputs its action. CTDE reduces non-stationarity without requiring communication at execution time — the critic uses privileged information during training.

**QMIX** (Rashid et al., 2018): for cooperative multi-agent problems, each agent \(i\) learns a local Q-function \(Q_i(o_i, a_i)\); a mixing network combines them into a joint \(Q_{tot}(s, a)\) satisfying the **monotonicity constraint** \(\partial Q_{tot}/\partial Q_i \geq 0\). This ensures the greedy joint action \(\arg\max_a Q_{tot}\) decomposes into each agent greedily maximizing their own \(Q_i\), enabling decentralized execution. The mixing network is trained end-to-end with a single global reward signal.

**Mean field games (MFG)**: when the number of agents \(n \to \infty\), the influence of any individual agent on the aggregate becomes negligible. MFG theory (Lasry & Lions, 2007; Huang, Malhamé & Caines, 2006) studies the limiting system: each agent interacts not with other individuals but with the mean field distribution of the population. The MFG equilibrium is a pair (policy \(\pi^*\), mean field distribution \(\mu^*\)) satisfying:
- Given mean field \(\mu^*\), \(\pi^*\) is each agent's optimal policy.
- Given policy \(\pi^*\), \(\mu^*\) is the stationary distribution of agents' states.

MFG reduces \(n\)-player games to a two-equation system (Hamilton-Jacobi-Bellman and Fokker-Planck equations), enabling scalable approximate equilibria for large-population settings (ride-sharing, epidemics, financial markets).

## 10.4 Communication in Multi-Agent Systems

When agents can communicate before or during play, outcomes can improve dramatically. Communication is modeled as:

- **Cheap talk**: costless, non-binding messages. In cheap talk equilibria, messages are credible only if sender interests are aligned with truth-telling. Crawford & Sobel (1982) characterized the babbling equilibrium (no information transmitted) and informative equilibria for sender-receiver games.
- **Commitment devices**: agents can credibly commit to strategies (e.g., first-mover advantage in Stackelberg games).
- **Mediated communication**: a trusted mediator implements correlated equilibria via private recommendations.

In MARL, **emergent communication** studies how agents learn communication protocols without predefined languages. CommNet (Sukhbaatar et al., 2016) passes differentiable messages between agents; DIAL (Foerster et al., 2016) backpropagates through discrete communication channels; QMIX and VDN use implicit communication through the joint value function.

**Signaling in network routing**: in routing games, selectively broadcasting traffic conditions can improve or worsen network efficiency. Selten's paradox: if some fraction of agents follows navigation app recommendations (based on broadcast congestion info), the recommender can choose which information to reveal to improve social welfare, exploiting the non-strategic majority. This connects mechanism design (what to reveal?) with routing game equilibria.

## 10.5 Bayesian Learning and Calibration

**Bayesian learning**: each player maintains a prior \(P(\theta_{-i})\) over opponents' types and updates by Bayes' rule. After history \(h^t = (a^1, \ldots, a^t)\):

\[
P(\theta_{-i} \mid h^t) \propto P(\theta_{-i}) \prod_{\tau=1}^{t} P(a_{-i}^\tau \mid \theta_{-i})
\]

Bayesian learning converges to the BNE in static Bayesian games when players' beliefs are consistent with the equilibrium strategies — a foundation for the concept of rational expectations equilibrium.

**Calibration**: a prediction algorithm is **calibrated** if, among all rounds where it predicts probability \(p\) for event \(E\), the fraction of rounds where \(E\) occurs converges to \(p\). Calibrated forecasters cannot be systematically exploited: no betting strategy earns positive expected profit against a calibrated forecaster.

<div class="theorem">
Any Bayesian agent with a positive prior over all possible opponent types is calibrated with probability 1, by the martingale convergence theorem applied to the likelihood ratio process.
</div>

Calibration is weaker than Bayesian consistency (which requires the full posterior to concentrate on the truth) but sufficient for many applications. **Online calibration algorithms** achieve \(O(T^{2/3})\) calibration error using randomized strategies, even against adversarial opponents — enabling fair forecasting in adversarial settings.

---

# Chapter 11: Applications and System Design

## 11.1 Auctions in Practice

**Simultaneous ascending auctions (SAA)**: used by the FCC for spectrum auctions, SAA allows bidders to bid simultaneously on multiple licenses in multiple rounds, with prices ascending until no new bids are placed. SAA approximates the combinatorial problem without requiring bidders to submit full value functions. Package bidding extensions (SMRA, CCA) address exposure problems (a bidder may win partial bundles at losses).

**Procurement auctions**: a buyer solicits bids from suppliers; the lowest bidder wins a contract. Reverse auctions are used in government procurement, online advertising (programmatic ad exchanges), and cloud computing spot markets.

**Pay-per-click advertising (Generalized Second Price, GSP)**: advertisers bid for keyword positions; the highest bidder gets the top slot and pays the second-highest bid. GSP is not strategyproof: Nash equilibria of GSP are locally envy-free (no advertiser wants to swap position at the other's bid) and approximately efficient. Google and Bing use GSP variants with quality scores (effective bids = bid × quality score).

## 11.2 Market Design Case Studies

**National Residency Matching Program (NRMP)**: since 1952, NRMP has matched medical graduates to residency programs using a centralized deferred acceptance algorithm. Roth & Peranson (1999) showed that the DA algorithm produces a nearly unique stable matching even with couples (who must be matched jointly) and large-scale preference lists. The redesign of NRMP in 1997 improved welfare and reduced match failures, winning Alvin Roth the 2012 Nobel Prize in Economics.

**School choice**: New York City's high school admissions (redesigned 2003), Boston's public school assignment, and New Orleans' unified enrollment system all moved from priority-based systems (manipulable, unstable) to DA-based mechanisms. The reforms substantially reduced strategic behavior and improved fairness metrics.

**Organ allocation**: kidney exchange programs match incompatible donor-recipient pairs. Chains and cycles of length 2, 3, or longer allow multiple pairs to exchange simultaneously. Roth et al. (2004) showed that allowing long chains dramatically increases the number of transplants achievable, and the Kidney Paired Donation Pilot Program (KPDPP) implements optimization-based matching.

## 11.3 Multi-Agent Systems in AI

**AlphaGo and AlphaZero** (Silver et al., 2016, 2017): two-player zero-sum perfect-information games. Monte Carlo tree search with policy and value networks trained by self-play (a form of fictitious self-play) achieves superhuman performance. The key insight: self-play creates an ever-stronger opponent sequence, driving the agent toward Nash equilibrium strategies.

**Generative Adversarial Networks (GANs)**: formalize image synthesis as a two-player zero-sum game — generator \(G\) tries to fool discriminator \(D\); discriminator tries to distinguish real from generated images. The minimax objective:

\[
\min_G \max_D \; \mathbb{E}_{x \sim p_{\text{data}}}[\log D(x)] + \mathbb{E}_{z \sim p_z}[\log(1-D(G(z)))]
\]

At equilibrium, \(G\) produces samples indistinguishable from real data (Nash equilibrium). In practice, training is non-stationary and may cycle — an active MARL research problem addressed by techniques like gradient penalties, Wasserstein distance, and spectral normalization.

**Multi-agent path finding (MAPF)**: route \(n\) agents from start to goal positions in a shared grid without collisions. Optimal MAPF is NP-hard in \(n\). Conflict-Based Search (CBS) resolves collisions by adding constraints and replanning individual agents — an application of cooperative MAS to robotics and logistics (Amazon warehouse robots, airport ground traffic).

**Large language model agents**: LLMs deployed as autonomous agents (tool use, web browsing, code execution) form multi-agent systems when multiple LLM instances collaborate or compete. Problems include prompt injection attacks (adversarial agents manipulating agent behavior via crafted text), resource contention, and coordination protocols — an active frontier connecting mechanism design with AI safety.

## 11.4 Mean Field Game Formalism

Mean field games provide a rigorous framework for the \(N \to \infty\) limit of stochastic differential games. In continuous time, the **mean field game system** consists of two coupled partial differential equations:

**Hamilton-Jacobi-Bellman (HJB) equation** — solved backward in time, giving the representative agent's value function \(V(t, x)\) given the mean field distribution \(\mu(t)\):

\[
-\partial_t V - \nu \Delta V + H(x, \nabla V, \mu_t) = 0, \quad V(T, x) = G(x, \mu_T)
\]

where \(H(x, p, \mu)\) is the Hamiltonian \(\sup_\alpha [-f(x, \alpha, \mu) \cdot p - L(x, \alpha, \mu)]\) (running cost \(L\), dynamics \(f\), diffusion coefficient \(\nu\)).

**Fokker-Planck-Kolmogorov (FPK) equation** — solved forward in time, giving the evolution of the distribution \(\mu_t\) when all agents follow the optimal policy \(\alpha^*(t, x) = \arg\max\):

\[
\partial_t \mu - \nu \Delta \mu + \text{div}(f(x, \alpha^*, \mu_t) \mu) = 0, \quad \mu_0 \text{ given}
\]

The MFG equilibrium is a fixed point \((V^*, \mu^*)\) of this coupled system: \(V^*\) is optimal given \(\mu^*\), and \(\mu^*\) is the distribution induced by the optimal policy derived from \(V^*\). Existence and uniqueness results require monotonicity conditions on the interaction structure (Lasry-Lions monotonicity).

**Mean field MARL**: the discrete-time, finite-population analogue replaces the FPK equation with empirical distribution updates. **MF-Q** (Yang et al., 2018) approximates the Nash equilibrium of a large MAS by having each agent interact only with the mean field of its neighbors rather than with every individual agent, reducing \(O(n)\) interactions per agent to \(O(1)\). This scales to thousands of agents without the exponential blowup of standard MARL.

**Applications**: ride-sharing platforms (Uber/Lyft driver positioning modeled as MFG with drivers as agents and passenger demand as the mean field), smart grid demand response (millions of appliances optimizing energy usage given aggregate grid load), pedestrian flow simulation, and epidemic control (individuals optimizing social distancing given aggregate infection prevalence).

---

# Chapter 12: Network Games and Graphical Games

## 12.1 Network Formation Games

**Network formation** asks how the structure of a social or economic network emerges from agents' self-interested link formation decisions. A **network formation game** has players as nodes; each player chooses which links to form. The payoff depends on the resulting network topology — connectivity, distance to others, and brokerage position.

**Strategic network formation** (Jackson & Wolinsky, 1996): two players must both agree to form a link (bilateral consent). A network \(g\) is **pairwise stable** if no existing link can be profitably severed by one player and no non-existing link would benefit both parties simultaneously:

- Stability: \(u_i(g) \geq u_i(g - ij)\) for all links \(ij \in g\) (both \(i\) and \(j\)).
- No profitable additions: if \(u_i(g + ij) > u_i(g)\), then \(u_j(g + ij) < u_j(g)\).

**The tension between stability and efficiency**: the efficient network (maximizing \(\sum_i u_i\)) and the pairwise stable network often diverge. In the connections model (Jackson-Wolinsky), where each player benefits from indirect connections (decaying with distance) but pays a cost per direct link, the unique pairwise stable network may be a star (all agents connected through one hub) even when the efficient structure is a complete graph or a cycle.

**Scale-free networks** (Barabási-Albert model): many real-world networks (the internet, social networks, citation networks) exhibit power-law degree distributions. The preferential attachment model generates scale-free networks via a growth process where new nodes attach to existing nodes with probability proportional to degree. This can be interpreted as a best-response process where new agents connect to the most connected nodes for maximum indirect benefit.

## 12.2 Graphical Games

A **graphical game** (Kearns, Littman & Singh, 2001) represents a normal-form game with a sparse payoff dependency structure. Each player \(i\)'s payoff depends only on the actions of their **neighborhood** \(\mathcal{N}(i)\) in a graph \(G\):

\[
u_i(a) = u_i(a_i, a_{\mathcal{N}(i)})
\]

In a general \(n\)-player game, specifying all payoffs requires exponential space. Graphical games require only \(\sum_i |A_i| \cdot \prod_{j \in \mathcal{N}(i)} |A_j|\) parameters — polynomial in \(n\) when the graph has bounded degree.

**Nash equilibria of graphical games**: computing Nash equilibria of graphical games is PPAD-complete in general but polynomial when the interaction graph has **bounded treewidth**. The algorithm uses message-passing on the tree decomposition: each node sends messages to its tree parent about the marginal distributions of Nash strategies consistent with its subtree. This dynamic programming runs in time \(O(n \cdot |A|^w)\) where \(w\) is the treewidth.

**Applications to MAS**: graphical games model sensor networks (nodes communicate only with local neighbors), distributed control systems (each controller acts on locally available state), and social influence networks (agents' adoption decisions depend on local peer pressure). The sparse interaction structure enables scalable computation of equilibria and learning dynamics.

## 12.3 Network Congestion and Braess Effects

**Wardrop equilibrium** is the continuous-flow analogue of Nash equilibrium in network routing: a flow vector \(f\) is at Wardrop equilibrium if no infinitesimal unit of flow can reduce its delay by switching routes. Formally, for each origin-destination pair \((s,t)\) and routes \(P, P'\):

\[
l_P(f) \leq l_{P'}(f) \quad \text{whenever } f_P > 0
\]

where \(l_P(f) = \sum_{e \in P} \ell_e(f_e)\) is the latency of route \(P\) under flow \(f\). Wardrop equilibrium is the Nash equilibrium in the limit of infinitely many agents.

**Social optimum vs. Wardrop**: the socially optimal flow minimizes total latency \(\sum_e f_e \cdot \ell_e(f_e)\); the Wardrop flow minimizes perceived individual latency. For affine latency functions \(\ell_e(f) = a_e f + b_e\), Roughgarden-Tardos showed the PoA is exactly \(4/3\): any Wardrop equilibrium has social cost at most \(4/3\) times the optimum. This bound is tight and applies to any flow magnitude.

**Braess's paradox in practice**: the paradox has been observed empirically. In Stuttgart (1969), removing a central street reduced average commute times. In New York City (1990), closing 42nd Street on Earth Day decreased city-wide congestion rather than increasing it. The phenomenon also occurs in electrical networks (Braess 1968, formalized by Cohen & Horowitz 1991): adding a zero-resistance wire to certain resistor networks can increase total current drawn from the source, counterintuitively harming all users.

**Stackelberg routing**: a central authority controls a fraction \(\alpha\) of the network flow (e.g., GPS-routed vehicles following recommendations); the remaining fraction \(1-\alpha\) routes selfishly. Optimal Stackelberg routing can reduce the PoA significantly: by routing the compliant fraction to less congested paths, selfish agents are induced to use the best routes. Swamy (2012) showed that routing only a \(1/(1+\text{PoA})\) fraction of traffic suffices to recover the social optimum.

## 12.4 Influence and Opinion Dynamics

**DeGroot model** (1974): \(n\) agents hold beliefs \(x_i(t) \in [0,1]\) (e.g., probability assigned to some proposition). In each round, agents update beliefs as a weighted average of their neighbors' current beliefs:

\[
x(t+1) = T \, x(t)
\]

where \(T\) is a row-stochastic trust matrix (\(T_{ij}\) = weight agent \(i\) places on \(j\)). Beliefs converge if \(T\) is a primitive stochastic matrix (strongly connected and aperiodic). At convergence, all agents reach a common belief equal to a weighted average of initial beliefs with weights given by the stationary distribution of \(T\).

**Friedkin-Johnsen model**: agents have an internal (stubborn) belief \(x_i(0)\) and update toward neighbors but also toward their own initial belief:

\[
x_i(t+1) = \lambda_i \sum_j T_{ij} x_j(t) + (1-\lambda_i) x_i(0)
\]

where \(\lambda_i \in [0,1]\) is agent \(i\)'s susceptibility to influence. At equilibrium, opinions reflect both internal biases and network influence — the FJ model predicts persistent disagreement (unlike the DeGroot model) when agents have \(\lambda_i < 1\). This models political polarization, filter bubbles, and echo chambers in social networks.

**Seeding in social networks** (influence maximization): given a social influence model, choose a seed set \(S^*\) of \(k\) agents to maximize expected total adoption:

\[
S^* = \arg\max_{|S| \leq k} \sigma(S)
\]

where \(\sigma(S)\) is the expected number of agents who adopt given seed set \(S\). Under the **independent cascade model**, each edge activates with probability \(p_{ij}\); activation spreads over \(t\) rounds. Kempe, Kleinberg & Tardos (2003) showed \(\sigma\) is submodular, so greedy hill-climbing gives a \((1-1/e)\)-approximation. This is used for viral marketing, information diffusion, and epidemic intervention targeting.

---

# Chapter 13: Implementation Theory

## 13.1 Nash Implementation

**Implementation theory** asks: which social choice functions can be implemented as Nash equilibria of some mechanism? This differs from mechanism design, which designs mechanisms to implement a *specific* given SCF. Implementation theory characterizes the full class of implementable SCFs.

A mechanism \(\Gamma = (M, g)\) (message space \(M\) and outcome function \(g: M^n \to X\)) **Nash-implements** SCF \(f\) if the set of Nash equilibrium outcomes of \(\Gamma\) exactly equals \(f(\theta)\) for every type profile \(\theta\):

\[
g(\text{NE}(\Gamma, \theta)) = \{f(\theta)\} \quad \forall \theta
\]

<div class="theorem">
<strong>Maskin's Theorem (1999)</strong>. A social choice function \(f\) is Nash-implementable (with \(n \geq 3\) agents) if and only if it satisfies <strong>Maskin monotonicity</strong>: if \(x = f(\theta)\) and the lower contour set of \(x\) for every agent (the set of alternatives weakly worse than \(x\)) expands when moving from \(\theta\) to \(\theta'\) — i.e., \(\{y: u_i(y, \theta) \leq u_i(x, \theta)\} \subseteq \{y: u_i(y, \theta') \leq u_i(x, \theta')\}\) for all \(i\) — then \(f(\theta') = x\).
</div>

Maskin monotonicity is a strong condition: it requires that whenever an alternative \(x\) was chosen and the preference profile changes without reducing the relative ranking of \(x\) for any agent, \(x\) should still be chosen. Many economically natural SCFs (Pareto-optimal, efficient, stable) satisfy Maskin monotonicity.

## 13.2 Dominant Strategy Implementation

A mechanism **dominant-strategy implements** \(f\) if truth-telling is a dominant strategy and \(g(\theta) = f(\theta)\) for all \(\theta\). Dominant-strategy implementation is much more restrictive than Nash implementation: by Gibbard-Satterthwaite, only dictatorial SCFs can be dominant-strategy implemented over unrestricted preference domains.

The resolution is to restrict the class of outcomes or preferences:

- **Quasi-linear preferences and monetary transfers**: VCG mechanisms dominant-strategy implement the welfare-maximizing allocation for any type distribution. The Groves-Clarke-Vickrey family characterizes all dominant-strategy implementable SCFs in quasi-linear environments.
- **Single-peaked preferences**: the median voter rule is strategyproof on the domain of single-peaked preferences over a linear policy space (Moulin, 1980).
- **Object allocation without money** (house allocation): the **top trading cycles (TTC)** mechanism is the unique Pareto-efficient, strategyproof mechanism for exchanging indivisible goods (Shapley-Scarf, 1974).

**Top Trading Cycles**: each agent points to their most preferred object (initially owned by someone else); find all cycles in the resulting directed graph and execute them (agents in cycles get their top choice); remove these agents and repeat. TTC is Pareto-efficient, strategyproof, and individually rational — it is the unique mechanism satisfying all three (Roth, 1982).

## 13.3 Robust Mechanism Design

Standard mechanism design assumes a known type distribution. **Robust mechanism design** (Bergemann & Morris, 2005) seeks mechanisms that perform well across all possible type distributions and all possible beliefs agents might hold about each other's types (all type spaces).

A mechanism is **ex post incentive compatible** if truthful reporting is a Nash equilibrium in the complete-information game for every type realization — i.e., no agent wants to deviate from truthful reporting even if all types are publicly known. Ex post IC is stronger than Bayesian IC but weaker than dominant-strategy IC (which requires no deviation to be profitable even if the agent knew others' reports).

<div class="theorem">
<strong>Bergemann-Morris Theorem</strong>. A social choice function can be implemented robustly (for all Bayesian type spaces) if and only if it can be ex post incentive compatibly implemented.
</div>

This provides a foundation for the VCG mechanism's robustness: VCG is DSIC, hence ex post IC, hence robustly implementable in all environments. Mechanisms that are only BIC (Bayesian incentive compatible) may fail when the type distribution is mis-specified.

**Approximately optimal mechanisms**: in many settings, the exact Myerson-optimal mechanism is complex (it depends on the full distributional form) and may be fragile to distributional misspecification. **Prior-free** mechanism design seeks mechanisms whose revenue approximates the optimal mechanism for every distribution. Dhangwatnotai, Roughgarden & Yan (2015) show that a posted-price mechanism with price equal to the median valuation achieves at least 1/2 the expected optimal auction revenue, making it a simple, robust alternative.

**Approximate strategyproofness (ASP)**: in large markets where exact strategyproofness is too strong, mechanisms may be required only to have small gains from manipulation. A mechanism is \(\epsilon\)-strategyproof if no agent gains more than \(\epsilon\) in utility by misreporting. Many practical mechanisms (including some DA variants with couples and many-to-many matching) are not exactly strategyproof but are \(\epsilon\)-strategyproof for small \(\epsilon\) in large markets. The theory of approximate implementation characterizes which social choice functions can be approximately implemented by approximately strategyproof mechanisms.

**Automated mechanism design** (Conitzer & Sandholm, 2002): rather than designing mechanisms by hand, formulate mechanism design as an optimization problem and solve it computationally. Given a finite type space and outcome set, find the optimal (e.g., revenue-maximizing or welfare-maximizing) DSIC, IR mechanism by solving a linear program over the space of allocation and payment rules. This approach finds globally optimal mechanisms for settings where the closed-form Myerson solution is unavailable (multi-dimensional type spaces, combinatorial outcomes). The LP has \(O(|\Theta|^n \cdot |X|)\) variables and \(O(n \cdot |\Theta|^n)\) incentive constraints — exponential but feasible for small type spaces.

**Connection to AI**: automated mechanism design connects to reinforcement learning for mechanism design (MDPs where the "environment" is agents' responses to the mechanism) and to differentiable economics (gradient-based optimization of mechanism parameters, Dutting et al. 2019). The RegretNet architecture uses neural networks to parameterize allocation and payment rules and trains them to minimize regret subject to approximate IR and IC constraints, learning approximately optimal mechanisms end-to-end from samples of agent types.
