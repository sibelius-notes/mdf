---
title: ECON 392
layout: toc
parent: Fall 2021
prof: Ahmet Ozkardas
---

<style>
.embed-container {
  position: relative;
  padding-bottom: 56.25%;
  height: 0;
  overflow: hidden;
  max-width: 100%;
}
.embed-container iframe,
.embed-container object,
.embed-container embed {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
</style>

# ECON 392: Strategic Situations and Welfare Economics

# Lecture 1: What is Game Theory?

Game theory is a discipline concerned with situations in which the outcome for one person depends not only on their own choices, but on the choices of others. Economics, sociology, psychology, and political science all study human behavior, but they often treat individuals in isolation — assuming that one person's decisions do not materially affect others. Game theory relaxes this assumption and focuses precisely on the **strategic interactions** that arise when people are interdependent.

Consider a simple illustration. A small farmer in Elmira who sets the price of wheat is unlikely to affect global wheat prices — that is a non-strategic situation. But whether that same farmer charges more or less than her local competitors directly determines how much she and her neighbors earn. That is a strategic situation. Game theory is built to analyze exactly this kind of interdependence.

## Strategic Interdependence and Common Knowledge

For a situation to qualify as a game-theoretic problem, two conditions must hold. First, each individual must **know** that their actions affect others. Second, they must know that others know this fact — and know that others know that they know it, and so on, indefinitely. This infinite chain is called **common knowledge**: a fact X is common knowledge if everybody knows it, if everybody knows that everybody knows it, if everybody knows that everybody knows that everybody knows it, and so on.

Without common knowledge, strategic reasoning collapses. If farmer A does not know that farmer B is aware of their mutual interdependence, farmer A has little reason to think strategically about what farmer B will do. The whole apparatus of game theory rests on the premise that each player's rationality, and the rules of the game, are common knowledge.

## Definition

We may define game theory as a technique used to analyze situations where, for two or more individuals (or institutions), the outcome of an action by one of them depends not only on the particular action taken by that individual but also on the actions taken by the others. The plans or strategies of individuals are thus **interdependently related** — this is called **strategic interdependence**, and such situations are commonly known as **games**, while participants are called **players**.

## Examples of Strategic Interaction

Strategic thinking characterizes a vast range of human interactions:

- Two firms with large market shares making decisions about price and output
- Leaders of two countries contemplating war with each other
- A firm deciding whether to enter a new market where the incumbent may fight entry
- A tennis player deciding where to place a serve
- Family members arguing over the division of household work

In all of these cases, the outcome for each player depends on what the others do — and each player knows this.

## Non-Strategic vs. Strategic Situations

Not every decision problem is strategic. If an investor named Arya is choosing between government bonds (certain 10% return) and a risky stock (20% or 0% depending on company performance), her choice depends on her preferences and the probability of each state of the world — but not on the choices of any other person. Any uncertainty involved is **exogenous**, meaning it is not influenced by anyone's behavior. This is a single-person decision problem, not a game.

The moment another player's decision enters the picture — when the outcome for Arya depends on what some other agent does — we move into the domain of game theory.

---

# Lecture 2: Game Forms

Games can be analyzed along two key dimensions: the **order of moves** (do players act simultaneously or sequentially?) and the **information** available to players when they act (does each player know what others have done?).

## Strategic Form Games (Complete Information)

In a **strategic form** (or normal form) game with complete information, players either move simultaneously or, equivalently, they move without observing what the others have chosen. Each player knows the payoff functions of all other players. The key modeling challenge is that each player must formulate a strategy based on what they expect others to do, without observing their actual choices.

**The Investment Game.** Arya has $100 to invest. She may put it in bonds (certain 10% return) or a risky venture that requires $200 total to succeed. There is exactly one other potential investor, Zoey, in an identical situation. If both invest in the venture it succeeds and each gets $120; if only one invests, that investor gets her $100 back while the other keeps $110 from bonds. If both choose bonds, each earns $110.

|  | **Bonds (Zoey)** | **Venture (Zoey)** |
|---|---|---|
| **Bonds (Arya)** | 110, 110 | 110, 100 |
| **Venture (Arya)** | 100, 110 | 120, 120 |

Because Arya and Zoey cannot communicate and must decide simultaneously, this is a strategic form game. Both players know the payoff table — that is what "complete information" means.

## Extensive Form Games (Complete Information)

In an **extensive form** game with complete information, players move in a specified order and observe each other's prior moves before acting. The game is represented as a decision tree.

**The Entry Game.** Pepsi (P) first decides whether to enter a market currently monopolized by Coke (C). If Pepsi enters, Coke then decides whether to fight (F) the entry — through price cuts or advertising — or acquiesce (A). The tree structure captures the fact that Coke's decision is made *after* observing Pepsi's entry.

## Bayesian Games (Incomplete Information)

In a **Bayesian game**, players move simultaneously but do not have full information about their opponents. In particular, players may have private information — about their own payoffs, types, or intentions — that others must account for when forming expectations.

**Investment Game with Incomplete Information.** Suppose Arya is unsure about Zoey's preferences. With probability *p*, Zoey is a "normal" rational investor (same payoff structure as before); with probability *1 − p*, Zoey is "a little crazy" and has an inherent tendency to take risks regardless of expected returns. This uncertainty is incorporated by considering two separate payoff matrices, one for each of Zoey's types, weighted by the respective probabilities. This game form is Bayesian.

## Extensive Form Games (Incomplete Information)

When players move sequentially but some payoffs or types are private information, we have an **extensive form game with incomplete information**. The classic example is a **signaling game**.

**Signaling Game.** A population of job applicants is either Smart (probability 3/8) or Stupid (probability 5/8). Each applicant can choose to go to College or Party. A potential employer observes the educational choice but not the applicant's type, and must decide whether to Hire or Pass. The employer's uncertainty about the applicant's type — despite observing the education signal — creates a game of incomplete information in extensive form.

---

# Lecture 3: Strategic Form

## Formal Definition

A **strategic game** is a model of a situation with multiple interacting decision-makers. Formally, a strategic game (with ordinal preferences) consists of:

1. A set of players <span>&#92;( N &#92;)</span>
2. For each player, a set of actions <span>&#92;( A_i &#92;)</span> for <span>&#92;( i = 1, \ldots, N &#92;)</span>
3. For each player, preferences over the set of action profiles, represented by a payoff function <span>&#92;( u_i : A \to \mathbb{R} &#92;)</span>

We write the game as <span>&#92;( \langle N, \{A_i\}_{i \in N}, \{u_i\}_{i \in N} \rangle &#92;)</span>. The **outcome space** is the Cartesian product of all action sets:

<span>&#92;[ A = \times_{i \in N} A_i = \{(a_1, \ldots, a_n) : a_i \in A_i,\ i = 1, \ldots, n\} &#92;]</span>

An outcome <span>&#92;( a = (a_1, \ldots, a_n) &#92;)</span> is an **action profile**.

**Payoff functions** represent players' preferences. The interpretation mirrors utility functions in standard microeconomics, except that each player's payoff depends not only on their own action but on the actions of all others: <span>&#92;( u_i(a_1, \ldots, a_n) &#92;)</span>. If <span>&#92;( u_i(a) > u_i(b) &#92;)</span>, player <span>&#92;( i &#92;)</span> strictly prefers action profile <span>&#92;( a &#92;)</span> to profile <span>&#92;( b &#92;)</span>. At this stage the payoff is treated as purely **ordinal** — we only know how players rank outcomes, not the magnitude of the differences.

## The Payoff Matrix

In a two-player game, we need four pieces of information: <span>&#92;( (A_1, A_2, u_1, u_2) &#92;)</span>. When each player has finitely many actions, this can be represented as a **bimatrix** (payoff matrix). Player 1's choice is the row and player 2's choice is the column. Each cell contains the pair <span>&#92;( (u_1, u_2) &#92;)</span>.

## Classic Games

### Prisoner's Dilemma

Two suspects are arrested and held separately. Each can either stay **Quiet (Q)** or **Confess (C)**. If both confess, each gets 5 years. If one confesses and the other stays quiet, the confessor goes free and the quiet suspect gets 6 years. If both stay quiet, each gets 1 year. The payoff matrix (using negative years to reflect disutility):

|  | **Quiet (2)** | **Confess (2)** |
|---|---|---|
| **Quiet (1)** | −1, −1 | −6, 0 |
| **Confess (1)** | 0, −6 | −5, −5 |

Or equivalently, with positive payoffs representing cooperation value:

|  | **Quiet** | **Confess** |
|---|---|---|
| **Quiet** | 2, 2 | 0, 3 |
| **Confess** | 3, 0 | 1, 1 |

The **general Prisoner's Dilemma** is any game of the form:

|  | **C** | **N** |
|---|---|---|
| **C** | b, b | d, a |
| **N** | a, d | c, c |

whenever <span>&#92;( a < b < c < d &#92;)</span>. Applications include: firms competing on price (each wants to undercut the other); workers on a joint project (each wants the other to work harder); arms races between countries.

### Pure Coordination Game

Arya and Zoey want to meet, either in Uptown Waterloo (W) or Downtown Guelph (G). Both would rather meet in Waterloo, but either meeting place is better than no meeting:

|  | **W** | **G** |
|---|---|---|
| **W** | α, α | 0, 0 |
| **G** | 0, 0 | β, β |

where <span>&#92;( \alpha, \beta > 0 &#92;)</span>. Both players want to do whatever the other does — miscoordination is bad. When both players agree on the preferred outcome, this is called a **game of common interest**.

### Matching Pennies

Arya and Zoey each conceal a penny, face up (H) or face down (T), and reveal simultaneously. If the pennies match, Arya wins; if they differ, Zoey wins:

|  | **H** | **T** |
|---|---|---|
| **H** | 1, −1 | −1, 1 |
| **T** | −1, 1 | 1, −1 |

Player 1 wants to coordinate; player 2 wants to miscoordinate. This is a **game of conflict** (also called a zero-sum game).

### Battle of the Sexes (BoS)

Arya and Jack want to go out together but disagree on the activity: Arya prefers Opera, Jack prefers Movie. Being alone is equally bad for both:

|  | **Opera** | **Movie** |
|---|---|---|
| **Opera** | 2, 1 | 0, 0 |
| **Movie** | 0, 0 | 1, 2 |

Both want to coordinate but have conflicting preferences over the outcome. Like the Prisoner's Dilemma, BoS models a wide variety of situations: partners choosing a joint technology platform, countries negotiating a treaty standard, etc.

---

# Lecture 4: Dominance

## Solution Concepts

We analyze games in a **non-cooperative** setting: players either cannot communicate or any communication is non-binding. Even when players can talk, nothing forces them to honor pre-game agreements. In this environment, a player needs to reason carefully about what others will do — and to recognize that others are doing the same reasoning about them. This mutual reasoning about incentives is what game theory formalizes.

## Dominated Strategies

Fix a game with outcome space <span>&#92;( A = \times_{j \in N} A_j &#92;)</span>. For player <span>&#92;( i &#92;)</span>, write an action profile as <span>&#92;( a = (a_i, a_{-i}) &#92;)</span> where <span>&#92;( a_{-i} = (a_1, \ldots, a_{i-1}, a_{i+1}, \ldots, a_n) &#92;)</span> is the profile of actions taken by all players other than <span>&#92;( i &#92;)</span>.

Action <span>&#92;( a_i \in A_i &#92;)</span> **weakly dominates** <span>&#92;( b_i \in A_i &#92;)</span> for player <span>&#92;( i &#92;)</span> if:

<span>&#92;[ u_i(a_i, a_{-i}) \geq u_i(b_i, a_{-i}) \text{ for all } a_{-i} \in A_{-i} &#92;]</span>

with strict inequality for at least one <span>&#92;( a_{-i} &#92;)</span>. Action <span>&#92;( a_i &#92;)</span> **strictly dominates** <span>&#92;( b_i &#92;)</span> if:

<span>&#92;[ u_i(a_i, a_{-i}) > u_i(b_i, a_{-i}) \text{ for all } a_{-i} \in A_{-i} &#92;]</span>

A **dominant strategy** is an action that is optimal for a player no matter what the opponents do. If a player has a dominant action, they need not think at all about what others will choose.

## Prisoner's Dilemma: Strict Dominance

|  | **Quiet** | **Confess** |
|---|---|---|
| **Quiet** | 2, 2 | 0, 3 |
| **Confess** | 3, 0 | 1, 1 |

Regardless of what player 2 does, player 1 is always better off choosing Confess: if player 2 picks Quiet, player 1 gets 2 from Quiet vs. 3 from Confess; if player 2 picks Confess, player 1 gets 0 from Quiet vs. 1 from Confess. **Confess strictly dominates Quiet** for player 1 (and symmetrically for player 2). The equilibrium in dominant strategies is **(Confess, Confess)**.

This is the tragedy embedded in the Prisoner's Dilemma: individual rationality leads to (1, 1), far worse than the (2, 2) that could be achieved if both cooperated. The tension between individual and collective rationality is at the heart of many real-world problems.

## Weak Dominance

|  | **Left** | **Right** |
|---|---|---|
| **Top** | 0, 0 | 0, 0 |
| **Bottom** | 0, 0 | 1, 1 |

For player 1, Bottom weakly dominates Top (at least as good everywhere, strictly better for Right). For player 2, Right weakly dominates Left. The equilibrium in weakly dominant actions is **(Bottom, Right)**.

## Iterated Elimination of Strictly Dominated (IESD) Actions

A fundamental premise of game theory is that **rational players do not play strictly dominated actions**. This gives us an iterative refinement procedure: eliminate all strictly dominated actions for any player, then re-examine the reduced game, and repeat.

Consider:

|  | **L** | **M** | **R** |
|---|---|---|---|
| **U** | 1, 0 | 1, 2 | 0, 1 |
| **D** | 0, 3 | 0, 1 | 2, 0 |

**Step 1:** R is strictly dominated by M for player 2 (M gives 2 or 1, R gives 1 or 0). Eliminate R.

**Step 2:** In the reduced game with only L and M, D is strictly dominated by U for player 1 (U gives 1 in both columns; D gives 0). Eliminate D.

**Step 3:** In the further reduced game (only row U, columns L and M), L is dominated by M for player 2. Eliminate L.

The IESD process converges to the unique outcome **(U, M)**. When IESD yields a single outcome, we say the game is **dominance solvable**.

**A three-action example.** In the game:

|  | **Left** | **Right** |
|---|---|---|
| **Top** | 0, 2 | 0, 0 |
| **Middle** | 2, 1 | 1, 2 |
| **Bottom** | 1, 1 | 2, 2 |

Top is strictly dominated by both Middle and Bottom, so player 2 eliminates it from consideration. Given that player 1 will not play Top, player 2 can always do better by playing Right (which dominates Left in the reduced game without Top). Player 1 anticipates this and plays Bottom. The equilibrium is **(Bottom, Right)**.

---

# Lecture 5: Nash Equilibrium

## Motivation

Dominant strategy equilibria are powerful because they require minimal assumptions — a player only needs to know that they themselves are rational. But many interesting games have no dominant strategy for either player. Iterated elimination helps, but may leave many outcomes surviving.

**Nash equilibrium** provides a more general solution concept. The key idea is that each player forms a **belief** about what others will do, and plays optimally given that belief. What makes it an *equilibrium* is the additional requirement that **these beliefs are correct** — each player's belief about others' actions is confirmed by what those players actually choose.

## Definition

A **Nash equilibrium** of a strategic game <span>&#92;( G &#92;)</span> is any action profile <span>&#92;( (a_1^*, \ldots, a_n^*) &#92;)</span> such that for each player <span>&#92;( i &#92;)</span>:

<span>&#92;[ u_i(a_i^*, a_{-i}^*) \geq u_i(a_i, a_{-i}^*) \text{ for all } a_i \in A_i &#92;]</span>

In words: no player can improve their payoff by **unilaterally deviating** from the equilibrium action, given that everyone else plays their equilibrium action. The set of all Nash equilibria of <span>&#92;( G &#92;)</span> is denoted <span>&#92;( N(G) &#92;)</span>.

A Nash equilibrium may be interpreted as a **steady state** of a strategic interaction: if everyone expects the Nash equilibrium outcome and plays accordingly, no one has reason to behave differently.

## Best Response Functions

The **best response function** of player <span>&#92;( i &#92;)</span> assigns, to each profile of opponents' actions, the set of actions that maximize player <span>&#92;( i &#92;)</span>'s payoff:

<span>&#92;[ B_i(a_{-i}) = \{a_i \in A_i : u_i(a_i, a_{-i}) \geq u_i(a_i', a_{-i}) \text{ for all } a_i' \in A_i\} &#92;]</span>

An action profile <span>&#92;( (a_1^*, a_2^*) &#92;)</span> is a Nash equilibrium if and only if each player's action is a best response to the others':

<span>&#92;[ a_1^* \in B_1(a_2^*) \quad \text{and} \quad a_2^* \in B_2(a_1^*) &#92;]</span>

## Finding Nash Equilibria: The Star Method

To find Nash equilibria in a payoff matrix:

1. For each column (each action of player 2), find the row giving player 1 the highest payoff and mark it with a star.
2. For each row (each action of player 1), find the column giving player 2 the highest payoff and mark it with a star.
3. Any cell where **both** payoffs are starred is a Nash equilibrium.

**Example:**

|  | **L** | **C** | **R** |
|---|---|---|---|
| **T** | 1, 2★ | 2★, 1 | 1★, 0 |
| **M** | 2★, 1★ | 0, 1★ | 0, 0 |
| **B** | 0, 1 | 0, 0 | 1★, 2★ |

Nash equilibria: **(M, L)** and **(B, R)**.

## Applications

**Prisoner's Dilemma.** Best responses:

<span>&#92;[ B_i(\text{Quiet}) = B_i(\text{Confess}) = \text{Confess}, \quad i = 1, 2 &#92;]</span>

The unique Nash equilibrium is **(Confess, Confess)**, confirming what we found using dominance.

**Pure Coordination Game.** Best responses: <span>&#92;( B_1(\text{Left}) = \text{Top} &#92;)</span>, <span>&#92;( B_1(\text{Right}) = \text{Bottom} &#92;)</span>, and symmetrically for player 2. There are **two Nash equilibria**: (Top, Left) and (Bottom, Right). When multiple equilibria exist, game theory cannot always predict which one will be played — coordination problems are genuinely hard.

**Battle of the Sexes.** Again two Nash equilibria: (Opera, Opera) and (Movie, Movie). Each player prefers a different equilibrium, creating a coordination problem with conflicting interests.

**Matching Pennies.** No Nash equilibrium in pure strategies exists — for any pure strategy profile, one player wants to deviate. This motivates the introduction of mixed strategies.

---

# Lecture 6: Mixed Strategies

## Introduction

In some games, no pure strategy Nash equilibrium exists. Matching Pennies is the canonical example: whatever one player does, the other wants to deviate. This motivates allowing players to **randomize** over their actions.

A **mixed strategy** for player <span>&#92;( i &#92;)</span> is a probability distribution over their action set <span>&#92;( A_i &#92;)</span>. If player <span>&#92;( i &#92;)</span> has <span>&#92;( m &#92;)</span> actions available, a mixed strategy is a vector <span>&#92;( (\alpha_i^1, \alpha_i^2, \ldots, \alpha_i^m) &#92;)</span> with <span>&#92;( \alpha_i^k \geq 0 &#92;)</span> for all <span>&#92;( k &#92;)</span> and <span>&#92;( \sum_{k=1}^m \alpha_i^k = 1 &#92;)</span>. A pure strategy is a degenerate mixed strategy with probability 1 on one action.

## Why Randomize? The Matching Pennies Argument

Consider Matching Pennies. If player 2 plays H and T each with probability 1/2, then player 1's expected payoffs are:

<span>&#92;[ u_1(H, \alpha_2) = \frac{1}{2}(1) + \frac{1}{2}(-1) = 0 &#92;]</span>
<span>&#92;[ u_1(T, \alpha_2) = \frac{1}{2}(-1) + \frac{1}{2}(1) = 0 &#92;]</span>

Player 1 is **indifferent** between H and T — and therefore willing to randomize as well. This mutual willingness to randomize constitutes a mixed strategy Nash equilibrium. It is a steady state in the sense that neither player has reason to deviate: whatever mixing probability player 1 uses, its expected payoff equals zero.

## Von Neumann–Morgenstern Preferences

Once we allow mixed strategies, outcomes become lotteries rather than certain payoffs. We need to specify preferences over lotteries. We assume that each player's preferences satisfy the **von Neumann–Morgenstern (vNM)** axioms, which implies that a player's payoff to a lottery equals the **expected value** of the underlying payoff function:

<span>&#92;[ u_i(p) = \sum_{a \in A} p(a) \cdot u_i(a) &#92;]</span>

where <span>&#92;( p(a) &#92;)</span> is the probability of action profile <span>&#92;( a &#92;)</span> under the mixed strategy profile.

**Important:** Two payoff matrices that represent the same ordinal game may represent *different* games with vNM preferences. For the Prisoner's Dilemma, consider:

|  | **Q** | **F** |
|---|---|---|
| **Q** | 2, 2 | 0, 3★ |
| **F** | 3★, 0 | 1★, 1★ |

vs.

|  | **Q** | **F** |
|---|---|---|
| **Q** | 3, 3 | 0, 4★ |
| **F** | 4★, 0 | 1★, 1★ |

In the left game, player 1's payoff to (Q, Q) equals <span>&#92;( \frac{1}{2} u_1(F,Q) + \frac{1}{2} u_1(F,F) = \frac{1}{2}(3) + \frac{1}{2}(1) = 2 &#92;)</span> — the player is **indifferent** between the certain outcome (Q,Q) and the lottery. In the right game, <span>&#92;( \frac{1}{2}(4) + \frac{1}{2}(1) = 2.5 < 3 = u_1(Q,Q) &#92;)</span> — the player **strictly prefers** the certain outcome. The behavioral implications differ even though the ordinal ranking is the same.

## Computing Expected Payoffs in BoS

In Battle of the Sexes (let player 1 be the opera-preferring player):

|  | **m (prob q)** | **o (prob 1−q)** |
|---|---|---|
| **m (prob p)** | 2, 1 | 0, 0 |
| **o (prob 1−p)** | 0, 0 | 1, 2 |

Expected payoffs:

<span>&#92;[ u_1(p, q) = 2pq + (1-p)(1-q) &#92;]</span>
<span>&#92;[ u_2(p, q) = pq + 2(1-p)(1-q) &#92;]</span>

These expressions capture the idea that payoffs depend multiplicatively on both players' mixing probabilities — the cross-product structure reflects independence of randomization.

---

# Lecture 7: Mixed Strategy Nash Equilibria

## Best Response Correspondences in Mixed Strategies

For a strategic game with vNM preferences, the **best response correspondence** of player <span>&#92;( i &#92;)</span> to a mixed strategy profile <span>&#92;( \alpha_{-i} &#92;)</span> is:

<span>&#92;[ B_i(\alpha_{-i}) = \arg\max_{\alpha_i \in \Delta(A_i)} u_i(\alpha_i, \alpha_{-i}) &#92;]</span>

where <span>&#92;( \Delta(A_i) &#92;)</span> denotes the set of all probability distributions over <span>&#92;( A_i &#92;)</span>.

A **mixed strategy Nash equilibrium** is a profile <span>&#92;( (\alpha_1^*, \ldots, \alpha_n^*) &#92;)</span> such that <span>&#92;( \alpha_i^* \in B_i(\alpha_{-i}^*) &#92;)</span> for all <span>&#92;( i &#92;)</span>.

In a two-player game, there are three cases for player 1's best response to player 2's mixed strategy:

1. If <span>&#92;( u_1(T, \alpha_2) > u_1(B, \alpha_2) &#92;)</span>, the unique best response is the pure strategy T
2. If <span>&#92;( u_1(B, \alpha_2) > u_1(T, \alpha_2) &#92;)</span>, the unique best response is the pure strategy B
3. If <span>&#92;( u_1(T, \alpha_2) = u_1(B, \alpha_2) &#92;)</span>, **all** mixed strategies of player 1 are best responses — player 1 is willing to randomize

## Matching Pennies: Full Solution

Let <span>&#92;( p &#92;)</span> be the probability player 1 places on Heads, and <span>&#92;( q &#92;)</span> the probability player 2 places on Heads.

Player 1's expected payoffs:

<span>&#92;[ u_1(H, q) = q(1) + (1-q)(-1) = 2q - 1 &#92;]</span>
<span>&#92;[ u_1(T, q) = q(-1) + (1-q)(1) = 1 - 2q &#92;]</span>

Player 1 is indifferent when <span>&#92;( 2q - 1 = 1 - 2q &#92;)</span>, i.e., <span>&#92;( q = 1/2 &#92;)</span>.

Best response of player 1:

<span>&#92;[ B_1(q) = \begin{cases} \{0\} & \text{if } q < 1/2 \\ [0,1] & \text{if } q = 1/2 \\ \{1\} & \text{if } q > 1/2 \end{cases} &#92;]</span>

By symmetry (recall player 2 wants to *mismatch*):

<span>&#92;[ B_2(p) = \begin{cases} \{0\} & \text{if } p > 1/2 \\ [0,1] & \text{if } p = 1/2 \\ \{1\} & \text{if } p < 1/2 \end{cases} &#92;]</span>

The unique mixed strategy Nash equilibrium is <span>&#92;( p^* = q^* = 1/2 &#92;)</span>, i.e., both players randomize 50-50.

## Battle of the Sexes: Three Equilibria

With Opera as "m" for player 1 and Opera as "m" for player 2, let <span>&#92;( p &#92;)</span> be player 1's probability on Opera and <span>&#92;( q &#92;)</span> be player 2's probability on Opera.

Player 1 indifferent when <span>&#92;( 2q = 1 - q &#92;)</span>, i.e., <span>&#92;( q^* = 1/3 &#92;)</span>.

Player 2 indifferent when <span>&#92;( p = 2(1-p) &#92;)</span>, i.e., <span>&#92;( p^* = 2/3 &#92;)</span>.

Battle of the Sexes has **three Nash equilibria**:
- Two pure strategy equilibria: (Opera, Opera) and (Movie, Movie)
- One mixed strategy equilibrium: <span>&#92;( (p^*, q^*) = (2/3, 1/3) &#92;)</span>

At the mixed equilibrium, player 1 (opera-preferring) plays Opera with probability 2/3 and player 2 (movie-preferring) plays Opera with only probability 1/3. Counterintuitively, each player's mixing probability is chosen to make *the other player* indifferent — not to maximize their own payoff directly.

---

# Lecture 8: Nash Equilibrium in Continuous Action Spaces

## Motivation

When players have finitely many actions, we can find Nash equilibria by inspecting the payoff matrix. With a **continuous action space**, the payoff matrix approach is impossible, but the best response function approach generalizes naturally. We find Nash equilibria by solving systems of equations defined by the best response functions.

## The Synergistic Relationship

Two individuals are involved in a synergistic relationship. If both devote more effort, both are better off. For any given effort <span>&#92;( a_j &#92;)</span> of the other, individual <span>&#92;( i &#92;)</span>'s payoff first increases then decreases with own effort. Specifically, individual <span>&#92;( i &#92;)</span>'s payoff is:

<span>&#92;[ u_i(a_1, a_2) = a_i(c + a_j - a_i) &#92;]</span>

where <span>&#92;( a_i, a_j \geq 0 &#92;)</span> are effort levels and <span>&#92;( c > 0 &#92;)</span> is a constant.

Taking the first-order condition with respect to <span>&#92;( a_i &#92;)</span>:

<span>&#92;[ c + a_j - 2a_i = 0 \implies a_i = \frac{1}{2}(c + a_j) &#92;]</span>

So each individual's best response function is <span>&#92;( b_i(a_j) = \frac{1}{2}(c + a_j) &#92;)</span>. This is upward sloping — if the other works harder, you want to work harder too (strategic complements).

To find the Nash equilibrium, solve the two-equation system simultaneously:

<span>&#92;[ a_1 = \frac{1}{2}(c + a_2) \quad \text{and} \quad a_2 = \frac{1}{2}(c + a_1) &#92;]</span>

Substituting: <span>&#92;( a_1 = \frac{1}{2}(c + \frac{1}{2}(c + a_1)) = \frac{3c}{4} + \frac{a_1}{4} &#92;)</span>, which gives <span>&#92;( a_1^* = c &#92;)</span> and by symmetry <span>&#92;( a_2^* = c &#92;)</span>.

The unique Nash equilibrium is <span>&#92;( (a_1^*, a_2^*) = (c, c) &#92;)</span>.

## The Location Game

Two geographically distinct firms compete by setting prices. Consumers are uniformly distributed on the interval <span>&#92;( [0, 1] &#92;)</span>. Firm 1 is at location 0 and firm 2 is at location 1. Both firms have a fixed cost <span>&#92;( \alpha &#92;)</span> and must set prices between 0 and <span>&#92;( k &#92;)</span>.

A consumer at location <span>&#92;( x &#92;)</span> gets utility <span>&#92;( k - cx - p_1 &#92;)</span> from firm 1 or <span>&#92;( k - c(1-x) - p_2 &#92;)</span> from firm 2, where <span>&#92;( c &#92;)</span> is a travel cost constant. The **marginal consumer** <span>&#92;( x^*(p_1, p_2) &#92;)</span> who is indifferent satisfies:

<span>&#92;[ k - cx^* - p_1 = k - c(1 - x^*) - p_2 \implies x^* = \frac{p_2 - p_1 + c}{2c} &#92;]</span>

Firm profits: <span>&#92;( \pi_1 = \frac{1}{2c}(p_1 p_2 - p_1^2 + p_1 c) - \alpha &#92;)</span> and symmetrically for firm 2.

First-order conditions yield best response functions:

<span>&#92;[ BR_1(p_2) = \frac{p_2 + c}{2}, \qquad BR_2(p_1) = \frac{p_1 + c}{2} &#92;]</span>

Solving the system: <span>&#92;( p_1^* = p_2^* = c &#92;)</span>, and profits are <span>&#92;( \pi_1^* = \pi_2^* = \frac{c}{2} - \alpha &#92;)</span>.

---

# Lecture 9: Cournot Competition

## Introduction

Industrial organization asks: how does competition among firms depend on demand characteristics, cost functions, and the number of firms? Antoine Augustin Cournot proposed the first rigorous model of oligopoly in 1838 — over 100 years before Nash's equilibrium concept. Cournot's insight was that when firms compete by **choosing quantities**, the market price adjusts to clear the market.

## General Model

A single good is produced by <span>&#92;( n &#92;)</span> firms. Each firm <span>&#92;( i &#92;)</span> chooses a quantity <span>&#92;( q_i \in [0, \infty) &#92;)</span> to produce. The cost to firm <span>&#92;( i &#92;)</span> is <span>&#92;( C_i(q_i) &#92;)</span>, where <span>&#92;( C_i'(q_i) > 0 &#92;)</span> and <span>&#92;( C_i''(q_i) \geq 0 &#92;)</span>. The market price is given by the inverse demand function <span>&#92;( P(\sum_{i=1}^N q_i) &#92;)</span> with <span>&#92;( \partial P/\partial q_i \leq 0 &#92;)</span>. Each firm's profit is:

<span>&#92;[ \pi_i(q_1, \ldots, q_N) = q_i P(q_1 + \cdots + q_N) - C_i(q_i) &#92;]</span>

The game is: players = the firms; actions = quantities chosen; preferences = profit functions.

## Cournot Duopoly

Suppose <span>&#92;( n = 2 &#92;)</span>, with linear costs <span>&#92;( C_i(q_i) = cq_i &#92;)</span> and linear inverse demand <span>&#92;( P(Q) = \alpha - Q &#92;)</span> for <span>&#92;( Q \leq \alpha &#92;)</span>, where <span>&#92;( \alpha > c &#92;)</span>. Each firm's profit:

<span>&#92;[ \pi_i(q_1, q_2) = q_i(\alpha - c - q_1 - q_2), \quad \text{when } q_1 + q_2 \leq \alpha &#92;]</span>

First-order conditions:

<span>&#92;[ \frac{\partial \pi_1}{\partial q_1} = \alpha - c - 2q_1 - q_2 = 0, \qquad \frac{\partial \pi_2}{\partial q_2} = \alpha - c - q_1 - 2q_2 = 0 &#92;]</span>

Best response functions:

<span>&#92;[ b_1(q_2) = \frac{1}{2}(\alpha - c - q_2), \qquad b_2(q_1) = \frac{1}{2}(\alpha - c - q_1) &#92;]</span>

(with <span>&#92;( b_i = 0 &#92;)</span> if the other firm produces more than <span>&#92;( \alpha - c &#92;)</span>). These are downward sloping — if the rival produces more, it is optimal to produce less (**strategic substitutes**).

Solving simultaneously:

<span>&#92;[ q_1^* = q_2^* = \frac{1}{3}(\alpha - c) &#92;]</span>

**Equilibrium outcomes:**

<span>&#92;[ Q^* = \frac{2}{3}(\alpha - c), \quad P^* = \frac{1}{3}(\alpha + 2c), \quad \pi_1^* = \pi_2^* = \frac{1}{9}(\alpha - c)^2 &#92;]</span>

## Comparison: Cartel, Cournot, and Perfect Competition

**Monopoly/Cartel** (firms collude to maximize joint profit):

From <span>&#92;( MR = MC &#92;)</span>: <span>&#92;( Q^M = \frac{1}{2}(\alpha - c) &#92;)</span>, <span>&#92;( P^M = \frac{1}{2}(\alpha + c) &#92;)</span>, <span>&#92;( \pi^M = \frac{1}{4}(\alpha - c)^2 &#92;)</span>, so each firm gets <span>&#92;( \frac{1}{8}(\alpha - c)^2 &#92;)</span>.

**Perfect competition** (<span>&#92;( P = MC &#92;)</span>):

<span>&#92;[ Q^{PC} = \alpha - c, \quad P^{PC} = c, \quad \pi^{PC} = 0 &#92;]</span>

**Ranking:**

<span>&#92;[ Q^{PC} > Q^* > Q^M \qquad \text{and} \qquad P^M > P^* > P^{PC} \qquad \text{and} \qquad \pi^M_i > \pi^*_i > \pi^{PC}_i &#92;]</span>

Cournot competition lies between monopoly and perfect competition in terms of output, price, and profit. Consumers benefit from Cournot competition relative to monopoly, but less so than under perfect competition.

## n Homogeneous Firms

With <span>&#92;( n &#92;)</span> firms, all with cost <span>&#92;( C_i(q_i) = cq_i &#92;)</span> and linear inverse demand <span>&#92;( P(Q) = a - bQ &#92;)</span>, symmetric equilibrium gives:

<span>&#92;[ q^* = \frac{a - c}{(n+1)b}, \quad Q^* = \frac{a-c}{b} \cdot \frac{n}{n+1}, \quad p^* = \frac{a + nc}{n+1}, \quad \pi_i^* = \frac{(a-c)^2}{(n+1)^2 b} &#92;]</span>

As <span>&#92;( n \to \infty &#92;)</span>:

<span>&#92;[ \lim_{n \to \infty} Q^* = \frac{a-c}{b}, \quad \lim_{n \to \infty} p^* = c &#92;]</span>

As the number of Cournot competitors tends to infinity, the market converges to perfect competition. This result is known as the **Cournot convergence theorem** and formalizes the intuition that more competition benefits consumers.

---

# Lecture 10: Bertrand Competition

## Introduction

Cournot competition assumes firms choose **quantities** and the market price adjusts. **Bertrand competition**, proposed by Joseph Bertrand in 1883 as a critique of Cournot, has firms choose **prices** instead: each firm posts a price and produces whatever demand it faces. The key demand rule is that consumers all go to the lowest-priced firm (splitting equally in case of ties).

The game: players = firms; actions = prices (non-negative numbers); preferences = profits.

## Duopoly Model

With two firms, linear demand <span>&#92;( D(p) = \alpha - p &#92;)</span>, and constant marginal cost <span>&#92;( c &#92;)</span>:

<span>&#92;[ \pi_i(p_1, p_2) = \begin{cases} (p_i - c)(\alpha - p_i) & \text{if } p_i < p_j \\ \frac{1}{2}(p_i - c)(\alpha - p_i) & \text{if } p_i = p_j \\ 0 & \text{if } p_i > p_j \end{cases} &#92;]</span>

The monopoly price is <span>&#92;( p^M = \frac{\alpha + c}{2} &#92;)</span>.

## Best Responses and the Bertrand Paradox

The best response of firm <span>&#92;( i &#92;)</span> to price <span>&#92;( p_j &#92;)</span>:

- If <span>&#92;( p_j > p^M &#92;)</span>: set <span>&#92;( p_i = p^M &#92;)</span> (capture the whole market at the monopoly price)
- If <span>&#92;( p_j \leq c &#92;)</span>: set <span>&#92;( p_i \geq p_j &#92;)</span> (avoid selling at a loss)
- If <span>&#92;( c < p_j \leq p^M &#92;)</span>: the best response is the **empty set** — firm <span>&#92;( i &#92;)</span> would want to set <span>&#92;( p_i &#92;)</span> just below <span>&#92;( p_j &#92;)</span>, but since prices are continuous, there is no such optimal price

**The unique Nash equilibrium is <span>&#92;( (p_1^*, p_2^*) = (c, c) &#92;)</span>.**

*Proof:* First, (c, c) is a NE: if both price at cost, deviating upward earns zero sales (no improvement), deviating downward earns negative profits (worse). Second, nothing else can be a NE:
- If any <span>&#92;( p_i < c &#92;)</span>, the low-price firm makes a loss and can improve by raising to <span>&#92;( c &#92;)</span>
- If <span>&#92;( p_i = c &#92;)</span> and <span>&#92;( p_j > c &#92;)</span>, firm <span>&#92;( i &#92;)</span> can profitably raise its price
- If both <span>&#92;( p_i, p_j > c &#92;)</span>, the higher-priced firm can undercut slightly and capture the whole market

This striking result — that **two competing firms are sufficient to achieve the perfectly competitive outcome** — is called the **Bertrand paradox**. In practice, the paradox is resolved by relaxing assumptions: capacity constraints (Edgeworth cycles), product differentiation, repeated interactions, or discrete pricing (undercutting by one cent rather than a continuum).

---

# Lecture 11: Extensive Games

## Motivation

Strategic form games model situations where players act simultaneously or without observing each other's choices. But many important economic and political situations involve **sequential moves**: a buyer makes an offer, the seller responds; an entrant decides whether to enter, then the incumbent decides whether to fight.

The **extensive form** provides a richer specification that captures who moves when, with what information. It builds on the idea of a decision tree.

## Game Trees: Key Components

A game tree consists of:

- **Nodes**: either *decision nodes* (where a player acts) or *terminal nodes* (where the game ends with payoffs). The initial decision node is the root.
- **Branches**: edges from a node to its successors, each corresponding to an available action
- **Information sets**: collections of decision nodes that a player cannot distinguish — reflecting imperfect information about prior moves

**Perfect information** means each player knows exactly where in the game tree they are when they move. This requires every information set to contain exactly one node.

## Formal Definition

An **extensive game with perfect information** consists of:

1. A set of players
2. A set of **terminal histories** — sequences of actions from the root to the end of play — with no terminal history being a proper subhistory of another
3. A **player function** that assigns a player to each non-terminal history
4. For each player, **preferences** over the set of terminal histories

**Histories.** The empty history <span>&#92;( \emptyset &#92;)</span> is the start of the game. A subhistory <span>&#92;( (a_1, \ldots, a_m) &#92;)</span> of <span>&#92;( (a_1, \ldots, a_k) &#92;)</span> (for <span>&#92;( m \leq k &#92;)</span>) is a partial play of the game. A proper subhistory has <span>&#92;( m < k &#92;)</span>.

In the entry game with terminal histories (In, Acquiesce), (In, Fight), and Out: the subhistories of (In, Acquiesce) are <span>&#92;( \emptyset &#92;)</span>, In, and (In, Acquiesce); the proper subhistories are <span>&#92;( \emptyset &#92;)</span> and In.

## Strategies in Extensive Form Games

A pure strategy in an extensive form game is not simply an action — it must specify an action at **every** decision node of the player, even nodes that the player's own prior choices would prevent from being reached. This complete contingent plan is necessary because other players (and the equilibrium analysis) require knowing what a player *would* do at every contingency.

**Definition.** A pure strategy of player <span>&#92;( i &#92;)</span> is a function that assigns an action <span>&#92;( a_i \in A_i(x) &#92;)</span> to every node <span>&#92;( x &#92;)</span> where it is <span>&#92;( i &#92;)</span>'s turn to move.

**Example: Bargaining game.** Buyer (player 1) moves first by offering either $100 or $500 for an object she values at $600 (seller values it at $50). Seller responds by accepting (A) or rejecting (R).

- Buyer's strategies: {100, 500} — just the offer
- Seller's strategies: {AA, AR, RA, RR} — must specify a response to *each* possible offer, even the one the buyer doesn't make

This is why the strategy space grows rapidly: a player with <span>&#92;( k &#92;)</span> information sets each offering <span>&#92;( m &#92;)</span> actions has <span>&#92;( m^k &#92;)</span> pure strategies.

---

# Lecture 12: Extensive vs. Strategic Forms

## Translating Extensive Games to Strategic Form

Every extensive form game can be represented as a strategic form game by listing all pure strategies (complete contingent action plans) for each player as rows and columns.

**Example.** Consider a game where player 1 has one information set with actions {T, B} and player 2 has two information sets, each with two actions {L, R} and {ℓ, r}:

<span>&#92;[ S_1 = \{T, B\} \qquad S_2 = \{L\ell, Lr, R\ell, Rr\} &#92;]</span>

The strategic form is:

|  | **Lℓ** | **Lr** | **Rℓ** | **Rr** |
|---|---|---|---|---|
| **T** | 1, 2 | 1, 2 | 1, −1 | 1, −1 |
| **B** | 2, 2 | 1, 3 | 2, 2 | 1, 3 |

## Nash Equilibria in Extensive Form

Once we have the strategic form, we find Nash equilibria using the star method. For the game above, marking best responses:

|  | **Lℓ** | **Lr** | **Rℓ** | **Rr** |
|---|---|---|---|---|
| **T** | 1★, 2★ | 1★, 2★ | 1★, −1 | 1★, −1 |
| **B** | 2★, 2 | 1★, 3★ | 2★, 2 | 1★, 3★ |

Nash equilibria: **(T, Lℓ)**, **(T, Lr)**, **(B, Lr)**, **(B, Rr)**.

We can visualize these on the extensive form tree by drawing an arrow over each branch corresponding to an equilibrium action. However, not all Nash equilibria are equally compelling. Some — like (T, Rℓ) — involve player 2 planning to play Rℓ (her best action at her second information set) but also planning to play R at her first information set, even though L is better for her there. Such equilibria involve **non-credible threats**.

## The Issue with Nash Equilibrium in Extensive Games

The problem is that Nash equilibrium only requires optimality "on the equilibrium path." A player is free to plan suboptimal actions at information sets that are never reached — and those off-path plans can sustain equilibria that seem unreasonable.

In the entry game's strategic form, (Out, F) is a Nash equilibrium: the entrant stays out because the incumbent threatens to fight, and the incumbent never has to fight so its threat is never tested. But if entry *did* occur, fighting would be costly for the incumbent — the threat is not credible. We need a stronger equilibrium concept.

---

# Lecture 13: Subgame Perfect Equilibrium

## Backward Induction

**Backward induction** is an algorithm that finds the unique "sensible" outcome of a finite game of perfect information by reasoning from the end of the game back to the beginning:

1. Go to the **final decision nodes** and determine the best action available. Since no further moves follow, this simply means choosing the action with the highest payoff.
2. Replace those nodes with their equilibrium payoffs (prune non-chosen branches).
3. Move to the penultimate decision nodes and repeat.
4. Continue until reaching the initial node.

**Bargaining example.** Buyer offers $100 or $500; seller accepts or rejects. Working backwards: seller accepts $100 (gets $100 − $50 = $50 net gain) and accepts $500 (even better). Given the seller accepts any offer, the buyer offers $100 to maximize her own payoff. The **backward induction equilibrium** is (100, AA) and the outcome is (100, A).

## Subgame Perfect Equilibrium (SPE)

**Subgame perfect equilibrium** generalizes backward induction to all extensive form games, including those with imperfect information.

**Definition.** A **subgame** is a portion of the game tree that (1) starts at a single decision node, (2) contains every successor to that node, and (3) if it contains any node in an information set, it contains all nodes in that information set. The entire game is always a (trivial) subgame; all others are called **proper subgames**.

**Definition.** A strategy profile <span>&#92;( s^* &#92;)</span> in extensive form game <span>&#92;( \Gamma &#92;)</span> is a **subgame perfect equilibrium (SPE)** if for every subgame <span>&#92;( g &#92;)</span> of <span>&#92;( \Gamma &#92;)</span>, the restriction <span>&#92;( s^*|_g &#92;)</span> is a Nash equilibrium of <span>&#92;( g &#92;)</span>.

**Theorem.** Every finite extensive form game of perfect information possesses a pure strategy subgame perfect equilibrium.

In fact, SPE are essentially unique in perfect information games: the only non-uniqueness arises if a player is indifferent between two actions at some penultimate node.

## The Entry Game Revisited

The entry game has two Nash equilibria: (In, A) and (Out, F). The subgame beginning after the entrant plays In is a proper subgame, in which the incumbent must choose A or F. Since A gives the incumbent payoff 1 and F gives 0, the incumbent's unique best response is A. Thus the unique SPE is **(In, A)**: entry occurs and the incumbent accommodates. The equilibrium (Out, F) is ruled out because F is not optimal in the subgame following entry.

## The Centipede Game

Consider the Centipede Game, where two players alternately decide whether to "Continue" (C) or "Stop" (S). The payoffs increase the deeper the game goes:

```
1   C   2   C   1   C   2   C   1   C   2   C
                                              (6, 5)
S       S       S       S       S       S
(1,0)  (0,2)  (3,1)  (2,4)  (5,3)  (4,6)
```

Backward induction: at the last node, player 2 prefers C (payoff 5 rather than 4). But at the second-to-last node, player 1 can get 5 by stopping versus the result of player 2 continuing. And so on. The unique SPNE is for **both players to Stop immediately** at every node, yielding (1, 0).

This is a famous paradox: players would be collectively better off continuing for a long time, but individual rationality — applied backward — unravels cooperation from the very start. The SPNE prediction (immediate stopping) conflicts with experimental evidence, where subjects often continue for several rounds.

---

# Lecture 14: Stackelberg Competition

## Sequential Moves with Continuous Actions

Stackelberg competition extends the Cournot model to allow one firm to move first. The **leader** chooses its quantity, the **follower** observes this and then chooses. We use backward induction (subgame perfection) to solve the game.

## General Setup

Firm 1 (leader) chooses <span>&#92;( q_1 &#92;)</span> first. Firm 2 (follower) observes <span>&#92;( q_1 &#92;)</span> and chooses <span>&#92;( q_2 &#92;)</span>. Inverse demand is <span>&#92;( P(Q) = \alpha - \beta Q &#92;)</span> with linear costs <span>&#92;( C_i(q_i) = cq_i &#92;)</span>, <span>&#92;( c < \alpha &#92;)</span>.

**Step 1: Firm 2's optimization.** For any <span>&#92;( q_1 &#92;)</span>, firm 2 maximizes <span>&#92;( q_2[\alpha - \beta(q_1 + q_2)] - cq_2 &#92;)</span>:

<span>&#92;[ b_2(q_1) = \frac{\alpha - c - \beta q_1}{2\beta} &#92;]</span>

This is exactly the same best response function as in the Cournot game — the follower behaves like a Cournot competitor taking the leader's quantity as given.

**Step 2: Firm 1's optimization.** Knowing firm 2 will respond with <span>&#92;( b_2(q_1) &#92;)</span>, firm 1 maximizes:

<span>&#92;[ q_1 \left[\alpha - \beta\left(q_1 + \frac{\alpha - c - \beta q_1}{2\beta}\right)\right] - cq_1 &#92;]</span>

First-order condition yields:

<span>&#92;[ q_1^* = \frac{\alpha - c}{2\beta} &#92;]</span>

Substituting back: <span>&#92;( q_2^* = \frac{\alpha - c}{4\beta} &#92;)</span>.

## Stackelberg vs. Cournot

In the simultaneous Cournot game (with <span>&#92;( \beta = 1 &#92;)</span>), each firm produced <span>&#92;( \frac{1}{3}(\alpha - c) &#92;)</span> and earned <span>&#92;( \frac{1}{9}(\alpha-c)^2 &#92;)</span>. In the Stackelberg game:

| | **Stackelberg** | **Cournot** |
|---|---|---|
| <span>&#92;( q_1 &#92;)</span> | <span>&#92;( \frac{1}{2}(\alpha-c) &#92;)</span> | <span>&#92;( \frac{1}{3}(\alpha-c) &#92;)</span> |
| <span>&#92;( q_2 &#92;)</span> | <span>&#92;( \frac{1}{4}(\alpha-c) &#92;)</span> | <span>&#92;( \frac{1}{3}(\alpha-c) &#92;)</span> |
| <span>&#92;( \pi_1 &#92;)</span> | <span>&#92;( \frac{1}{8}(\alpha-c)^2 &#92;)</span> | <span>&#92;( \frac{1}{9}(\alpha-c)^2 &#92;)</span> |
| <span>&#92;( \pi_2 &#92;)</span> | <span>&#92;( \frac{1}{16}(\alpha-c)^2 &#92;)</span> | <span>&#92;( \frac{1}{9}(\alpha-c)^2 &#92;)</span> |

The leader produces **more** than in Cournot and earns **higher** profits; the follower produces **less** and earns **lower** profits. This is the **first-mover advantage**.

The intuition: by moving first and committing to a large quantity, the leader reduces the residual demand facing the follower, who then responds by producing less. The leader essentially exploits the follower's best response function. The leader could always mimic the Cournot outcome (by choosing <span>&#92;( \frac{1}{3}(\alpha-c) &#92;)</span>), so the Stackelberg equilibrium must be at least as good for the leader as Cournot.

---

# Lecture 15: Nash Bargaining

## Bargaining Situations

A **bargaining situation** arises whenever two players have a mutual interest in cooperating but conflicting interests over the exact terms of cooperation. Consider: an owner values a house at $500,000 (her minimum selling price) and a buyer values it at $700,000 (her maximum buying price). Any price between $500k and $700k makes both better off — but both prefer the price to favor themselves.

More generally, a bargaining situation requires a set of possible agreements that both parties prefer to disagreement, combined with conflicting preferences over which agreement to reach.

## The Nash Bargaining Solution

**Setup.** Two players A and B bargain over the partition of a cake of size <span>&#92;( \pi > 0 &#92;)</span>. Player <span>&#92;( i &#92;)</span>'s utility from receiving a share <span>&#92;( x_i &#92;)</span> is <span>&#92;( U_i(x_i) &#92;)</span>, strictly increasing and concave. If they fail to reach agreement, player <span>&#92;( i &#92;)</span> gets utility <span>&#92;( d_i &#92;)</span> — the **disagreement point** <span>&#92;( d = (d_A, d_B) &#92;)</span>.

The **utility possibility set** <span>&#92;( \Omega &#92;)</span> is the set of utility pairs achievable through agreement. The function <span>&#92;( g(u_A) = U_B(\pi - U_A^{-1}(u_A)) &#92;)</span> traces the Pareto frontier of <span>&#92;( \Omega &#92;)</span> (it is strictly decreasing and concave).

The **Nash bargaining solution (NBS)** is the unique pair <span>&#92;( (u_A^N, u_B^N) &#92;)</span> that maximizes the **Nash product**:

<span>&#92;[ \max_{(u_A, u_B) \in \Theta} (u_A - d_A)(u_B - d_B) &#92;]</span>

where <span>&#92;( \Theta = \{(u_A, u_B) \in \Omega : u_A \geq d_A, u_B \geq d_B\} &#92;)</span>.

The NBS has a geometric interpretation: it is the point on the Pareto frontier where the **slope of the frontier equals the ratio of the players' "gains from agreement"**:

<span>&#92;[ -g'(u_A^N) = \frac{u_B^N - d_B}{u_A^N - d_A} &#92;]</span>

## The Split-the-Difference Rule

When players have linear utility and bargain over <span>&#92;( \pi &#92;)</span> with disagreement point <span>&#92;( (d_A, d_B) &#92;)</span>, the Nash bargaining solution is:

<span>&#92;[ x_A^N = d_A + \frac{1}{2}(\pi - d_A - d_B), \qquad x_B^N = d_B + \frac{1}{2}(\pi - d_A - d_B) &#92;]</span>

The interpretation: each player first receives their disagreement payoff, and then the **remaining surplus** <span>&#92;( \pi - d_A - d_B &#92;)</span> is split **equally**. Player <span>&#92;( i &#92;)</span>'s share is strictly increasing in <span>&#92;( d_i &#92;)</span> and strictly decreasing in <span>&#92;( d_j &#92;)</span> — having a better outside option (higher disagreement payoff) strengthens one's bargaining position.

Special case: if <span>&#92;( d_A = d_B = 0 &#92;)</span>, the cake is split equally: <span>&#92;( x_A^N = x_B^N = \frac{\pi}{2} &#92;)</span>.

## Worked Example: Quadratic Utility Frontier

Suppose the utility frontier is <span>&#92;( u_1^2 + u_2^2 = 50 &#92;)</span> with disagreement point <span>&#92;( (0, 0) &#92;)</span). Maximize <span>&#92;( u_1 u_2 &#92;)</span> subject to <span>&#92;( u_1^2 + u_2^2 = 50 &#92;)</span> using a Lagrangian:

<span>&#92;[ \mathcal{L} = u_1 u_2 + \lambda(50 - u_1^2 - u_2^2) &#92;]</span>

FOCs: <span>&#92;( u_2 = 2\lambda u_1 &#92;)</span>, <span>&#92;( u_1 = 2\lambda u_2 &#92;)</span>, <span>&#92;( u_1^2 + u_2^2 = 50 &#92;)</span>. These give <span>&#92;( u_1 = u_2 &#92;)</span> and <span>&#92;( 2u_1^2 = 50 &#92;)</span>, so <span>&#92;( u_1^* = u_2^* = 5 &#92;)</span>.

With disagreement point <span>&#92;( (1, 3) &#92;)</span> and linear frontier <span>&#92;( u_1 + u_2 = 10 &#92;)</span>:

<span>&#92;[ \max_{u_1}\ (u_1 - 1)(7 - u_1) &#92;]</span>

FOC: <span>&#92;( (7 - u_1) - (u_1 - 1) = 0 \implies u_1^* = 4 &#92;)</span>, and <span>&#92;( u_2^* = 6 &#92;)</span>.

---

# Lecture 16: Finite Horizon Sequential Bargaining

## Sequential Bargaining

In **strategic bargaining theory**, the process is modeled as a dynamic game where players take turns making proposals and counter-proposals. The game ends when one party accepts an offer. Since players move sequentially, the appropriate equilibrium concept is subgame perfect Nash equilibrium (SPNE), and we solve by backward induction.

## Ultimatum Bargaining (1-Period)

Two players bargain over a cake of size 1. Player 1 makes an offer <span>&#92;( x \in [0,1] &#92;)</span> to player 2 (keeping <span>&#92;( 1 - x &#92;)</span>). If player 2 accepts (A), they get <span>&#92;( (1-x, x) &#92;)</span>; if player 2 rejects (R), both get 0.

Backward induction: player 2 accepts any <span>&#92;( x \geq 0 &#92;)</span> (accepts even <span>&#92;( x = 0 &#92;)</span> since it weakly dominates rejection). Player 1 therefore offers <span>&#92;( x^* = 1 &#92;)</span>, keeping everything. The unique SPNE outcome is **(1, Y)** — the proposer takes everything.

## Double Ultimatum (2-Period, No Discounting)

If player 2 can reject and make a counter-offer: player 1 makes an offer, and if rejected, player 2 makes a final offer that player 1 can accept or reject.

Working backwards: at the final stage, player 1 accepts any <span>&#92;( y \geq 0 &#92;)</span> from player 2, so player 2 offers (0, 1). Knowing this, player 2 would get 1 by rejecting any offer from player 1 less than the full cake. The result: whoever makes the **last offer** gets everything.

## Discounting: 2-Period Model

Suppose both players discount future payoffs. If player <span>&#92;( i &#92;)</span> receives <span>&#92;( x_i &#92;)</span> in period <span>&#92;( t &#92;)</span>, the present value is <span>&#92;( \delta_i^{t-1} x_i &#92;)</span>, where <span>&#92;( 0 < \delta_i < 1 &#92;)</span>.

**Setup.** Player 1 offers <span>&#92;( (x_1, 1-x_1) &#92;)</span> in period 1. If rejected, player 2 offers <span>&#92;( (y_2, 1-y_2) &#92;)</span> in period 2. If accepted in period 2, payoffs are <span>&#92;( (\delta_1 y_2, \delta_2(1-y_2)) &#92;)</span>.

**Backward induction.** In period 2, player 1 accepts any <span>&#92;( y_2 \geq 0 &#92;)</span>. So player 2 offers <span>&#92;( (0, 1) &#92;)</span>, yielding discounted payoffs <span>&#92;( (0, \delta_2) &#92;)</span> for the parties.

In period 1, player 2 accepts any offer where <span>&#92;( 1 - x_1 \geq \delta_2 &#92;)</span> (her continuation value). Player 1 therefore offers exactly <span>&#92;( 1 - x_1 = \delta_2 &#92;)</span>, keeping <span>&#92;( x_1 = 1 - \delta_2 &#92;)</span>.

**Unique SPNE.** Player 1 offers <span>&#92;( (1 - \delta_2,\ \delta_2) &#92;)</span> in period 1, and player 2 accepts. The first mover extracts most of the surplus, but patience (higher <span>&#92;( \delta_2 &#92;)</span>) for player 2 means player 2 gets more.

## 3-Period Extension

In a 3-period game (1 offers, 2 offers, 1 offers), the last proposer again gets everything in the final period, but this is now discounted. Working back:

- Period 3: player 1 offers (1, 0); player 2 accepts. Discounted payoffs: <span>&#92;( (\delta_1^2, 0) &#92;)</span>.
- Period 2: player 2 must offer player 1 at least <span>&#92;( \delta_1 &#92;)</span> (what player 1 would get by waiting); player 2 offers <span>&#92;( (\delta_1, 1-\delta_1) &#92;)</span>. Discounted payoffs: <span>&#92;( (\delta_1^2, \delta_2(1-\delta_1)) &#92;)</span>.
- Period 1: player 2 will accept any offer giving at least <span>&#92;( \delta_2(1-\delta_1) &#92;)</span>; player 1 offers <span>&#92;( 1 - \delta_2(1 - \delta_1) &#92;)</span> to herself.

The SPNE outcome is that player 1 offers <span>&#92;( (1 - \delta_2(1 - \delta_1),\ \delta_2(1-\delta_1)) &#92;)</span> and player 2 accepts immediately.

The first-mover advantage is **diluted** compared to the 1-period case, and the dilution depends on both discount factors.

---

# Lecture 17: Infinite Horizon Sequential Bargaining

## The Rubinstein Bargaining Model

Why should bargaining have a last period? **Rubinstein (1982)** considers a game where players can alternate offers in perpetuity — there is no deadline. Player A makes offers in all odd periods, player B makes offers in all even periods. Payoffs are discounted: an agreement <span>&#92;( x^t &#92;)</span> in period <span>&#92;( t &#92;)</span> is worth <span>&#92;( (\delta_A^{t-1} x_A^t,\ \delta_B^{t-1} x_B^t) &#92;)</span>.

Because there is no last period, backward induction cannot be directly applied. Instead, we exploit the **stationary structure**: any subgame starting with player A making an offer looks identical to any other such subgame.

## Deriving the Rubinstein Solution

Let <span>&#92;( V_B &#92;)</span> be player B's **continuation value** — the undiscounted payoff B would receive if no agreement is reached in the current odd period (so B rejects and it becomes B's turn to propose).

**In an odd period (A proposes):** Player A must offer B at least <span>&#92;( \delta_B V_B &#92;)</span> to induce acceptance. So A offers <span>&#92;( \delta_B V_B &#92;)</span> to B and keeps <span>&#92;( 1 - \delta_B V_B &#92;)</span>.

**In the preceding even period (B proposes):** B knows A will receive <span>&#92;( 1 - \delta_B V_B &#92;)</span> next period, so B must offer A at least <span>&#92;( \delta_A(1 - \delta_B V_B) &#92;)</span>. B keeps <span>&#92;( 1 - \delta_A(1 - \delta_B V_B) &#92;)</span>.

**Stationarity.** If the game is stationary, <span>&#92;( V_B &#92;)</span> (what B gets upon rejecting in an odd period) must equal what B gets in an even period when B proposes:

<span>&#92;[ V_B = 1 - \delta_A(1 - \delta_B V_B) = 1 - \delta_A + \delta_A \delta_B V_B &#92;]</span>
<span>&#92;[ V_B(1 - \delta_A \delta_B) = 1 - \delta_A &#92;]</span>
<span>&#92;[ V_B = \frac{1 - \delta_A}{1 - \delta_A \delta_B} &#92;]</span>

**The unique SPNE** (Rubinstein's Proposition):

<span>&#92;[ x_A^* = 1 - \delta_B V_B = 1 - \frac{\delta_B(1 - \delta_A)}{1 - \delta_A \delta_B} = \frac{1 - \delta_B}{1 - \delta_A \delta_B} &#92;]</span>
<span>&#92;[ x_B^* = \frac{\delta_B(1 - \delta_A)}{1 - \delta_A \delta_B} &#92;]</span>

Player A proposes this split in period 1, and player B accepts immediately.

## Properties of the Rubinstein Equilibrium

**1. Efficiency.** Agreement is reached immediately — no delay. This is efficient because delay is costly (payoffs are discounted).

**2. Patience pays.** Player A's payoff <span>&#92;( \frac{1-\delta_B}{1-\delta_A\delta_B} &#92;)</span> is increasing in <span>&#92;( \delta_A &#92;)</span> and decreasing in <span>&#92;( \delta_B &#92;)</span>. If player A is perfectly patient (<span>&#92;( \delta_A = 1 &#92;)</span>), A gets everything: <span>&#92;( x_A^* = 1 &#92;)</span>. If player B is perfectly patient, B gets everything. Patience is bargaining power.

**3. First-mover advantage.** The proposer (player A) gets <span>&#92;( \frac{1-\delta_B}{1-\delta_A\delta_B} &#92;)</span>, while player B (if playing first) would get <span>&#92;( \frac{1-\delta_A}{1-\delta_A\delta_B} &#92;)</span>. Since <span>&#92;( 1 - \delta_B > \delta_A(1-\delta_B) &#92;)</span> iff <span>&#92;( 1 > \delta_A &#92;)</span>, the first mover has an advantage whenever both players are impatient.

**4. Convergence to equal split.** As <span>&#92;( \delta_A, \delta_B \to 1 &#92;)</span> (both players become perfectly patient), <span>&#92;( x_A^* \to 1/2 &#92;)</span> and <span>&#92;( x_B^* \to 1/2 &#92;)</span>. Patient players split the surplus equally — a connection to the Nash bargaining solution.

---

# Lecture 18: Voting Games

## Introduction

Voting is an essential mechanism for collective decision-making, used in everything from corporate board decisions to public bond referenda. The outcome of any vote depends on both the **voting rules** and the **ballots submitted**. When ballots are cast secretly, voters are playing a static game. A voter is **naïve** if she always votes honestly; she is a **strategic voter** if she votes to obtain the best possible outcome given her information and beliefs about others.

## Voting Mechanisms

Given voter rankings of candidates, different mechanisms may yield different winners.

**Plurality voting.** The candidate with the most first-place votes wins. Example (percentage of voters): 28% rank Montreal ≻ Vancouver ≻ Toronto, 23% rank Toronto ≻ Montreal ≻ Vancouver, 17% rank Toronto ≻ Vancouver ≻ Montreal, 25% rank Vancouver ≻ Montreal ≻ Toronto, 7% rank Vancouver ≻ Toronto ≻ Montreal. Toronto has a plurality with 40% first-place votes but is ranked last by 53% of voters — plurality may elect an unpopular candidate.

**The Elimination Method (Instant Runoff Voting).** Repeatedly eliminate the candidate with the fewest first-place votes, redistributing those ballots to the next-ranked surviving candidate, until one candidate has a majority.

**The Borda Count.** Assign points by rank: last place gets 0, second-to-last gets 1, and so on. Sum each candidate's weighted votes. The Borda winner is the candidate with the highest total.

**The Condorcet Method.** A **Condorcet winner** is the candidate who beats every other candidate in pairwise head-to-head elections. Not all preference profiles have a Condorcet winner (see below).

## Arrow's Impossibility Theorem

Beyond choosing a winner, we might want to construct a **social ranking** (complete social preferences over all alternatives) from individual rankings. Kenneth Arrow formalized four desirable properties of any such ranking procedure (social choice mechanism):

1. **Unanimity:** If every individual prefers <span>&#92;( x &#92;)</span> to <span>&#92;( y &#92;)</span>, then so does society: <span>&#92;( \forall i,\ x \succ_i y \Rightarrow x \succ y &#92;)</span>.

2. **Non-dictatorship:** No single individual's preferences automatically become society's preferences: <span>&#92;( \nexists i &#92;)</span> such that <span>&#92;( x \succ_i y \Rightarrow x \succ y &#92;)</span> always.

3. **Transitivity:** Social preferences must be internally consistent: <span>&#92;( x \succ y &#92;)</span> and <span>&#92;( y \succ z &#92;)</span> implies <span>&#92;( x \succ z &#92;)</span>.

4. **Independence of Irrelevant Alternatives (IIA):** The social ranking of <span>&#92;( x &#92;)</span> versus <span>&#92;( y &#92;)</span> should depend only on individual preferences between <span>&#92;( x &#92;)</span> and <span>&#92;( y &#92;)</span>, not on how a third alternative <span>&#92;( z &#92;)</span> is ranked.

**Arrow's Impossibility Theorem:** No social choice mechanism satisfies all four axioms simultaneously.

## Why Majority Voting Fails Transitivity

With three individuals and three options:

| Agent | Ranking |
|---|---|
| 1 | <span>&#92;( x \succ_1 y \succ_1 z &#92;)</span> |
| 2 | <span>&#92;( y \succ_2 z \succ_2 x &#92;)</span> |
| 3 | <span>&#92;( z \succ_3 x \succ_3 y &#92;)</span> |

Under majority voting (a strict majority of 2 needed):

- **x vs. y:** Agents 1 and 3 prefer x, so <span>&#92;( x \succ y &#92;)</span>.
- **y vs. z:** Agents 1 and 2 prefer y, so <span>&#92;( y \succ z &#92;)</span>.
- **x vs. z:** Agents 2 and 3 prefer z, so <span>&#92;( z \succ x &#92;)</span>.

The result is an **intransitive cycle**: <span>&#92;( x \succ y \succ z \succ x &#92;)</span>. These are called **Condorcet cycles** or voting paradoxes.

The root of the failure: transitivity and IIA are in tension. IIA says that the ranking of x vs. z depends only on direct comparisons between x and z. But transitivity wants to infer <span>&#92;( x \succ z &#92;)</span> from the chain through y — using y as an "irrelevant" intermediary. The two requirements pull in opposite directions.

<div class="embed-container"><iframe src="https://www.youtube.com/embed/Q60ZXoXP6Hg?rel=0" frameborder="0" allowfullscreen></iframe></div>
<p align="center"><i>3Blue1Brown — The paradox at the heart of mathematics (Arrow's Impossibility Theorem)</i></p>

**Pareto Efficiency and Arrow.** Note that Pareto efficiency — an outcome <span>&#92;( x &#92;)</span> is Pareto efficient if there is no feasible <span>&#92;( y &#92;)</span> such that <span>&#92;( y \succeq_i x &#92;)</span> for all <span>&#92;( i &#92;)</span> with at least one strict preference — is a useful but insufficient criterion for evaluating social outcomes. Many inefficient situations are Pareto improvements over something, and many Pareto-efficient states can be very unequal or otherwise undesirable. Arrow's theorem tells us that there is no clean, axiomatically satisfying way to aggregate individual preferences into a coherent social preference order.
