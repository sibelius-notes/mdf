---
title: "ECON 212: Introduction to Game Theory"
prof: "Joel Blit"
subjects: "ECON"
---

# Chapter 1: Introduction & Strategic Games

## What Is Game Theory?

Game theory is the study of strategic interactions between agents — situations where the outcome for any one player depends not only on their own choices but on the choices of everyone else involved. This distinguishes it sharply from standard consumer or firm optimization, where each decision-maker faces a fixed environment and simply maximizes subject to given constraints. In game theory, the environment itself responds to what you do.

When we say "game," we mean something much broader than the everyday sense of the word. Chess, poker, and Monopoly all qualify, but so do arms races between nations, firms competing for market share, candidates running for political office, and bidders in an auction. Any arena involving interacting decision-makers who care about each other's choices is a game in this sense.

Why study these situations formally? Because if you understand the game you are in, you are better positioned to play it well. And if you understand it and do not like it, you can sometimes change the rules — or choose not to play at all. Our approach throughout this course is to build models that are necessarily incomplete abstractions, but that nonetheless reveal the essential strategic logic of real situations.

## The Strategic Game

A **strategic game** is a model of interacting decision-makers defined by three elements: a set of **players**, a set of **actions** available to each player, and **preferences** over the possible outcomes. An **action profile** assigns one action to each player, and the outcome of the game is determined by the profile of actions chosen. Players have preferences over these profiles — they care about what everyone does, not just what they themselves do.

One defining feature of strategic games is that time is absent. All players choose their actions simultaneously, and once chosen, an action cannot be changed. This is the contrast with **extensive games**, which we will study later, where players move in sequence and can observe each other's prior decisions.

## The Prisoner's Dilemma

The most famous example of a strategic game is the **prisoner's dilemma**. Two suspects are held in separate cells, unable to communicate. Police have enough evidence to convict each of a minor offense, but not a major one. If one suspect finks on the other, the fink goes free while the other is convicted of the major offense. If both fink, both are convicted of the major offense with a slightly reduced sentence for cooperating with police. If both stay quiet, each is convicted only of the minor offense.

Formally, there are two players, Suspect 1 and Suspect 2, each choosing from {Quiet, Fink}. Denoting payoffs as \(u_i(ap_1, ap_2)\) for the payoff to player \(i\) when the action profile is \((ap_1, ap_2)\), their preferences satisfy:

\[\begin{aligned}
u_1(F,Q) &amp;> u_1(Q,Q) > u_1(F,F) > u_1(Q,F) \\
u_2(Q,F) &amp;> u_2(Q,Q) > u_2(F,F) > u_2(F,Q)
\end{aligned}
\]

We represent these preferences compactly in a **payoff table**, where each cell shows the payoffs (Suspect 1, Suspect 2):

<table>
  <thead>
    <tr>
      <th colspan="2"></th>
      <th>Fink</th>
      <th>Quiet</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">Suspect 1</th>
      <th>Fink</th>
      <td><em>b, b</em></td>
      <td><em>d, a</em></td>
    </tr>
    <tr>
      <th>Quiet</th>
      <td><em>a, d</em></td>
      <td><em>c, c</em></td>
    </tr>
  </tbody>
</table>

where typically \(a > b > c > d\). The top-right cell illustrates the notation: payoff \(d\) to Suspect 1 means they stayed quiet while the other finked, receiving the harshest sentence; payoff \(a\) to Suspect 2 means they finked and went free.

The prisoner's dilemma captures something profound: there are gains from mutual cooperation (both quiet earns each player \(c\), yet each player is individually better off finking regardless of what the other does. Finking yields \(b\) when the other finks and \(d\) when the other stays quiet — in both cases better than the corresponding quiet outcome for the fink. This logic drives both suspects toward (Fink, Fink), despite (Quiet, Quiet) being better for both.

Many real-world situations share this structure. In an **arms race**, two countries each face the temptation to build nuclear weapons even though mutual disarmament would leave both better off. The solution, if it comes, must come from outside the game: a binding treaty that changes the payoffs or makes defection diplomatically costly.

## Tariff Wars

Two trading partners illustrate the same prisoner's dilemma logic at the national level. Each country can choose whether to impose a tariff on the other's goods. A tariff lets the importing country capture value from the other — a gain of 8 at the other country's expense — but also creates a deadweight loss of 5 from the economic inefficiency it introduces.

> A **tariff** is a tax imposed by a government on imports or exports of goods. A **deadweight loss** is a cost to society created by market inefficiency, occurring when supply and demand are pushed out of equilibrium.

<table>
  <thead>
    <tr>
      <th colspan="2"></th>
      <th>No Tariff</th>
      <th>Tariff</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">U.S.</th>
      <th>No Tariff</th>
      <td>0, 0</td>
      <td>−8, 3</td>
    </tr>
    <tr>
      <th>Tariff</th>
      <td>3, −8</td>
      <td>−5, −5</td>
    </tr>
  </tbody>
</table>

When the U.S. alone imposes a tariff, it nets +3 (gains 8, loses 5 to deadweight); Canada loses 8 with no offsetting gain. When both impose tariffs, they each take 8 from the other (net zero on that exchange) and each absorbs 5 in deadweight losses, ending at −5 apiece. Free trade gives both a baseline payoff of 0. Yet from any starting point, the temptation to impose a tariff exists — this is the prisoner's dilemma at the international level.

## Carbon Emissions

Two countries both emitting carbon at high levels face an analogous problem. Reducing emissions costs 6 per country but generates a benefit of 5 to every country in the world. With two countries, mutual reduction is socially beneficial — each gains 5 from the other's clean air and loses only 6 on net, for a payoff of 4. But unilaterally reducing while the other emits yields only −1 (cost 6, benefit 5 to oneself), whereas emitting while the other reduces yields +5 (no cost, full benefit from the other's clean air).

<table>
  <thead>
    <tr>
      <th colspan="2"></th>
      <th>Curb Emissions</th>
      <th>Emit</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">U.S.</th>
      <th>Curb Emissions</th>
      <td>4, 4</td>
      <td>−1, 5</td>
    </tr>
    <tr>
      <th>Emit</th>
      <td>5, −1</td>
      <td>0, 0</td>
    </tr>
  </tbody>
</table>

Emitting is always individually rational — it's better whether the other country curbs (5 > 4) or emits (0 > −1). The result is mutual emission, foregoing the mutual gain from cooperation.

## Location of Production and IP Theft

Over recent decades, many high-tech U.S. firms shifted production to China to reduce costs — only to find that local competitors learned their technologies and entered the market. The strategic logic is transparent. Suppose two U.S. firms currently split the world market equally, each earning $10M. If one firm shifts production to China, its lower costs let it undercut the other and capture the entire market — but the technology transfer attracts Chinese imitators who eventually reduce that firm's profit by $5M.

<table>
  <thead>
    <tr>
      <th colspan="2"></th>
      <th>U.S.</th>
      <th>China</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">Firm 1</th>
      <th>U.S.</th>
      <td>$10M, $10M</td>
      <td>$0M, $15M</td>
    </tr>
    <tr>
      <th>China</th>
      <td>$15M, $0M</td>
      <td>$5M, $5M</td>
    </tr>
  </tbody>
</table>

Shifting to China dominates staying in the U.S. for each firm individually (15 > 10 if the other stays, 5 > 0 if the other also moves). Yet both shifting — the equilibrium outcome — leaves each firm at $5M, half what they'd earn under mutual U.S. production.

## The Joint Project

Two students, Alice and Bob, must each decide whether to exert effort on a joint assignment. Without effort from either, they earn 50%. One working student alone lifts the grade to 70%. Both working earns 90%. Working is costly — each student is indifferent between working and earning grade \(X\) versus shirking and earning \(X - 30\), placing the effective cost of effort at 30 percentage points.

<table>
  <thead>
    <tr>
      <th colspan="2"></th>
      <th>Work</th>
      <th>Shirk</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">Alice</th>
      <th>Work</th>
      <td>60, 60</td>
      <td>40, 70</td>
    </tr>
    <tr>
      <th>Shirk</th>
      <td>70, 40</td>
      <td>50, 50</td>
    </tr>
  </tbody>
</table>

Shirking is always individually optimal: 70 > 60 if Bob works, and 50 > 40 if Bob shirks. Yet both working (60, 60) is better for both than both shirking (50, 50). A professor who monitors individual effort can break this trap. So can repeated interaction — if the students must work together again in future, the threat of uncooperative behaviour in later projects can sustain effort today.

## Contributing to a Public Good

The prisoner's dilemma captures the tension between individual incentives and collective welfare in a two-person setting, but many of the most consequential strategic dilemmas involve larger groups. Consider \(n\) players, each deciding simultaneously whether to **contribute** to a **public good** or to **free-ride**. Contributing costs each contributor \(c > 0\), but a contribution generates a total benefit \(b > c\) that is shared equally among all \(n\) players regardless of who contributed. Thus each player who contributes pays \(c\) and every player (contributors and free-riders alike) receives \(b/n\) per contribution.

Start with \(n = 2\). Label the actions C (contribute) and N (not contribute). If both contribute, each gets \(2 \cdot b/2 - c = b - c\). If exactly one contributes, the contributor gets \(b/2 - c\) while the free-rider gets \(b/2\). If neither contributes, each gets 0. Arrange these payoffs in a matrix:

<table>
  <thead>
    <tr>
      <th colspan="2"></th>
      <th>Contribute</th>
      <th>Not</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">Player 1</th>
      <th>Contribute</th>
      <td>\(b - c,\; b - c\)</td>
      <td>\(b/2 - c,\; b/2\)</td>
    </tr>
    <tr>
      <th>Not</th>
      <td>\(b/2,\; b/2 - c\)</td>
      <td>\(0,\; 0\)</td>
    </tr>
  </tbody>
</table>

Because \(b/n < c\) whenever \(b < nc\) — and since we assumed \(b > c\) but made no assumption that \(b > nc\) — the private marginal benefit of contributing, \(b/n\), may well fall short of the cost \(c\). In the standard formulation where \(c > b/n\), Not is a **strictly dominant strategy** for every player: regardless of what others do, contributing costs you more than the \(b/n\) share of benefit you personally receive. The unique Nash Equilibrium is therefore (N, N, \(\ldots\), N) — nobody contributes. Yet universal contribution yields each player \(nb/n - c = b - c > 0\), which Pareto-dominates the equilibrium payoff of 0. This is the \(n\)-person prisoner's dilemma.

The public-good game differs from the **Volunteer's Dilemma** studied later in Chapter 10. In the Volunteer's Dilemma, the good is binary — either someone volunteers and the good is provided, or no one does and it is not — and a single volunteer suffices. Here, contributions are cumulative: each additional contributor increases the total benefit. This distinction matters for real-world applications. Climate-treaty contributions, open-source software development, and neighbourhood upkeep all have public-good structures where each incremental contribution helps, even if the individually rational choice is to free-ride. Designing institutions that change the payoffs — taxes, subsidies, peer monitoring, or linking the game to future interactions — is central to public economics precisely because the equilibrium of the unmodified game is so bleak (see Osborne, Problem 33.1).

## Battle of the Sexes

Not all strategic games are prisoners' dilemmas. **Battle of the Sexes** (BoS) is a **coordination game** — players prefer to coordinate their actions rather than each pursuing their own preference independently. Barb prefers Ballet; Sam prefers Soccer. But both would rather attend the wrong event together than their preferred event alone. They have forgotten to coordinate before parting, and cell phones have not yet been invented.

<table>
  <thead>
    <tr>
      <th colspan="2"></th>
      <th>Ballet</th>
      <th>Soccer</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">Barb</th>
      <th>Ballet</th>
      <td>2, 1</td>
      <td>0, 0</td>
    </tr>
    <tr>
      <th>Soccer</th>
      <td>0, 0</td>
      <td>1, 2</td>
    </tr>
  </tbody>
</table>

The desirable outcomes are the coordinated ones — (Ballet, Ballet) and (Soccer, Soccer). Unlike the prisoner's dilemma, once both players reach one of these outcomes, neither wants to unilaterally deviate; the problem is selecting *which* coordination point to reach. BoS models any situation where agents must align on a standard: a Prime Minister and Finance Minister agreeing on a policy position, or two firms settling on a technical interface.

## Matching Pennies

In **Matching Pennies**, each of two players simultaneously shows a coin head-up or tail-up. If they match, Player 2 pays Player 1 one dollar. If they differ, Player 1 pays Player 2. This is a **strictly competitive** game — whatever one player gains, the other loses exactly.

<table>
  <thead>
    <tr>
      <th colspan="2"></th>
      <th>Head</th>
      <th>Tail</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">Player I</th>
      <th>Head</th>
      <td>1, −1</td>
      <td>−1, 1</td>
    </tr>
    <tr>
      <th>Tail</th>
      <td>−1, 1</td>
      <td>1, −1</td>
    </tr>
  </tbody>
</table>

The players' interests are diametrically opposed. A canonical real-world instance is the penalty kick in football: the striker wants to kick to the same side the goalkeeper dives to, while the goalkeeper wants to dive to the side of the kick. There is no stable pure-strategy outcome here — we will need the concept of mixed strategies, developed in Chapters 9 and 10, to analyze games like this.

## Stag Hunt

A group of hunters can pursue either a stag together or a hare individually. Catching the stag requires everyone to cooperate — any defector catches a hare instead and the stag escapes. All hunters prefer stag (when successful) over hare over nothing.

With two hunters, the payoff table is:

<table>
  <thead>
    <tr>
      <th colspan="2"></th>
      <th>Stag</th>
      <th>Hare</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">Hunter I</th>
      <th>Stag</th>
      <td>2, 2</td>
      <td>0, 1</td>
    </tr>
    <tr>
      <th>Hare</th>
      <td>1, 0</td>
      <td>1, 1</td>
    </tr>
  </tbody>
</table>

Stag Hunt differs from the prisoner's dilemma in a crucial way. A player *wants* to cooperate — as long as the other cooperates too. If your partner hunts stag, you are better off hunting stag (payoff 2 versus 1). The problem is coordination risk: if you're uncertain whether your partner will cooperate, the safe choice is hare. This makes Stag Hunt a better model than PD for some real cooperation problems, such as an arms race among countries that genuinely prefer mutual disarmament, or a joint project where each student is willing to work as long as their partner works too.

## A Strategic Twist: Golden Balls

A striking example of game theory in the wild appeared on a British television show, where two contestants publicly negotiated before each choosing to "split" or "steal" a jackpot. The payoffs:

<table>
  <thead>
    <tr>
      <th colspan="2"></th>
      <th>Split</th>
      <th>Steal</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">Ibrahim</th>
      <th>Split</th>
      <td>£6.8K, £6.8K</td>
      <td>£0, £13.6K</td>
    </tr>
    <tr>
      <th>Steal</th>
      <td>£13.6K, £0</td>
      <td>£0, £0</td>
    </tr>
  </tbody>
</table>

Is this a prisoner's dilemma? Almost — but not quite. In a true PD we need the strict inequality \(u_2(\text{Steal}, \text{Split}) > u_2(\text{Steal}, \text{Steal})\). Here both cells yield £0 to the loser, so the strict inequality fails. In one famous episode, contestant Nick announced he would *definitely* steal — then promised to share his winnings with Ibrahim afterward. This unconventional declaration changed Ibrahim's rational calculation: if Nick will steal regardless, Ibrahim might as well split (both outcomes give £0, but splitting at least leaves room for Nick's promised post-game transfer). It worked — Ibrahim split, and Nick split too.

<div class="embed-container"><iframe src="https://www.youtube.com/embed/S0qjK3TWZE8?rel=0" frameborder="0" allowfullscreen></iframe></div>

<em>Nick's announcement effectively eliminated the "Steal" column from Ibrahim's decision, transforming the game.</em>

---

# Chapter 2: Nash Equilibrium

## The Need for a Solution Concept

We now have a collection of strategic games. But which action profile will actually be played? To make a principled prediction, we need a <strong>solution concept</strong> — a theoretical criterion for identifying plausible outcomes.

The key insight comes from thinking about equilibrium beliefs. Consider <strong>Odd-Even</strong>: both players simultaneously say "even" or "odd." If both say the same word, both receive payoff 1; if they differ, both receive −1. Imagine playing this game repeatedly with many different classmates. Over time, you form beliefs about what others will choose. If those beliefs are correct — if everyone expects everyone else to say "even," and everyone therefore says "even" — then no one wants to deviate. This stable state of mutually correct beliefs is what Nash Equilibrium captures.

## Definition

The action profile \(a^*\) in a strategic game with ordinal preferences is a <strong>Nash Equilibrium</strong> if, for every player \(i\) and every action \(a_i\) of player \(i\), the equilibrium profile is at least as good for player \(i\) as any unilateral deviation:

\[
u_i(a^<em>) \geq u_i(a_i, a_{-i}^</em>) \quad \forall\ i \in N, \quad \forall\ a_i \in A_i
\]

where \(a_{-i}^*\) denotes the equilibrium actions of all players other than \(i\), and \(N = \{1, \ldots, n\}\) is the set of players. The notation \(a_{-i}\) always refers to "the action profile with player \(i\)'s action removed."

## Why Nash Equilibrium?

Two compelling rationales support NE as the central solution concept in game theory.

<strong>Stable social convention.</strong> When players from a large population are repeatedly matched to play the same game, they develop beliefs about how others play. Those beliefs shape their own choices. Eventually the process converges: beliefs become correct, and each player's action is a best response to those correct beliefs. Nash Equilibrium is precisely this resting point. Think of the convention in Canada that people keep to the right when passing in a corridor — once established, no individual benefits from deviating.

<strong>Self-enforcing agreement.</strong> If players could communicate beforehand and reach an agreement, a NE is an agreement that no player wants to renege on once the game is played. It is self-enforcing — no external enforcement is needed, because each player's equilibrium action is already optimal given what the others are doing. By contrast, (Quiet, Quiet) in the prisoner's dilemma is <em>not</em> a NE: even if both suspects agree to stay quiet, each has an individual incentive to fink. Self-enforcing agreements are far more likely to be observed in practice.

It is worth noting what NE does <em>not</em> guarantee. Not every player is fully rational. NE says nothing about the path to equilibrium — only that once there, no one deviates.

## Finding Nash Equilibria

One approach is to check every action profile and rule out those where some player can profitably deviate. Best response functions, developed in the next chapter, often make this more efficient.

<strong>Stag Hunt with many players.</strong> Consider the Stag Hunt with \(n\) hunters. There are exactly two Nash Equilibria: everyone hunts Stag, or everyone hunts Hare. Under the all-Stag profile, each hunter receives the highest possible payoff and no one can improve by switching to Hare (which would leave them with nothing). Under the all-Hare profile, any hunter who deviates to Stag gets nothing (since no one else cooperates) — not an improvement. No other profile is a NE: in any profile with at least one Stag-hunter and at least one Hare-hunter, the Stag-hunter can profitably switch to Hare.

<strong>Guessing two-thirds of the average.</strong> In the game introduced in Lecture 1 — choose an integer from 1 to 100, win if you're closest to two-thirds of the average — rational reasoning leads to a unique Nash Equilibrium. With two players, the action "1" weakly dominates all others: regardless of the opponent's choice, choosing 1 wins or ties but never strictly loses. With three players, the unique NE can be found by iteratively eliminating weakly dominated strategies, converging to all players choosing 1. We analyze this formally using best response functions in the next chapter.

## Selfish and Altruistic Social Behaviour

Up to now we have assumed that each player cares only about her own material payoff. But what if players also care — positively or negatively — about what happens to others? Modifying preferences in this way can dramatically change the strategic landscape and, in particular, can transform the set of Nash Equilibria.

The simplest formalization proceeds as follows. Suppose two players face a game with material payoff functions \(w_1\) and \(w_2\). Instead of maximizing \(w_i\) directly, player \(i\) maximizes a **modified utility**:

\[
u_i = w_i + \alpha_i \, w_j
\]

where \(\alpha_i\) is a parameter capturing player \(i\)'s attitude toward the other. When \(\alpha_i > 0\), the player is **altruistic** — she places positive weight on the other's material well-being. When \(\alpha_i < 0\), the player is **spiteful** — she derives disutility from the other's success.

Consider the Prisoner's Dilemma with the familiar material payoffs: (Quiet, Quiet) gives each 2, (Fink, Quiet) gives the fink 3 and the other 0, and (Fink, Fink) gives each 1. Under standard selfish preferences (\(\alpha = 0\)), Fink is strictly dominant and the unique NE is (Fink, Fink). Now suppose both players are altruistic with common parameter \(\alpha > 0\). Player 1's modified payoff from (Q, Q) is \(2 + 2\alpha\), from (F, Q) is \(3 + 0\alpha = 3\), from (Q, F) is \(0 + 3\alpha\), and from (F, F) is \(1 + \alpha\). Player 1 prefers Q to F when the other plays Q if \(2 + 2\alpha > 3\), i.e., \(\alpha > 1/2\). She prefers Q to F when the other plays F if \(0 + 3\alpha > 1 + \alpha\), i.e., \(\alpha > 1/2\). So whenever \(\alpha > 1/2\), Quiet becomes a strictly dominant strategy, and the unique NE flips to (Quiet, Quiet). Altruism strong enough to outweigh the temptation to defect restores cooperation.

Conversely, introducing spite can destroy cooperation even in games where it would otherwise emerge. In a coordination game like the Stag Hunt, where (Stag, Stag) is an equilibrium under selfish preferences, sufficiently negative \(\alpha\) can make each player prefer the outcome where the other fails, undermining the incentive to coordinate on the efficient outcome.

The broader lesson is that **preferences are not fixed features of the environment — they are modeling choices**, and the Nash Equilibrium concept adapts seamlessly to richer preference specifications. Social norms, cultural values, and institutional design can all be understood as mechanisms that shift \(\alpha\), changing the equilibrium of the underlying game without changing the rules. A society that cultivates reciprocity effectively raises \(\alpha\), making cooperative equilibria sustainable in situations that would otherwise be prisoners' dilemmas. This perspective connects game theory to the economics of institutions and the psychology of prosocial behavior (see Osborne, Problem 27.2).

## Equilibrium in a Single Population

In the strategic games we have studied so far, each player occupies a distinct role — Suspect 1 versus Suspect 2, Firm versus Union, Player 1 versus Player 2. But many real strategic interactions involve anonymous participants drawn from the same pool. Drivers on a highway choose whether to speed or obey the limit; pedestrians decide whether to walk on the left or the right; animals compete for food using aggressive or passive strategies. In these settings it is natural to model the interaction as a **symmetric game** in which a single large population of identical players is randomly matched in pairs.

A **symmetric strategic game** is one where every player has the same action set and the payoff depends only on the actions chosen, not on which player chose which action. Formally, if \(u(a, a')\) is the payoff to a player choosing action \(a\) when the opponent chooses \(a'\), symmetry requires that if we swapped labels, payoffs would be the same function of actions. A **symmetric Nash Equilibrium** is an action \(a^*\) such that \(a^*\) is a best response to itself:

\[
u(a^*, a^*) \geq u(a, a^*) \quad \text{for all actions } a.
\]

This captures a **population equilibrium**: if everyone in the population plays \(a^*\), no individual drawn at random can do better by deviating. The concept is closely related to the idea of an **evolutionarily stable strategy** (ESS) from biology — an ESS is a symmetric NE with an additional stability condition ensuring that small groups of mutants cannot invade.

The canonical example is the **Hawk-Dove game**. Two animals contest a resource of value \(v\). Each chooses Hawk (fight) or Dove (yield). If both play Dove, they share the resource: each gets \(v/2\). If one plays Hawk and the other Dove, the Hawk takes the entire resource and the Dove gets 0. If both play Hawk, they fight; each gets \((v - c)/2\), where \(c > 0\) is the cost of fighting. When \(c > v\) (fighting is very costly), the payoff matrix is:

<table>
  <thead>
    <tr>
      <th></th>
      <th>Hawk</th>
      <th>Dove</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Hawk</th>
      <td>\(\frac{v-c}{2},\; \frac{v-c}{2}\)</td>
      <td>\(v,\; 0\)</td>
    </tr>
    <tr>
      <th>Dove</th>
      <td>\(0,\; v\)</td>
      <td>\(\frac{v}{2},\; \frac{v}{2}\)</td>
    </tr>
  </tbody>
</table>

Neither (Hawk, Hawk) nor (Dove, Dove) is a symmetric NE when \(c > v\). Playing Hawk against a Hawk-playing population yields \((v-c)/2 < 0\), so a Dove mutant would invade. Playing Dove against a Dove-playing population yields \(v/2\), but a Hawk mutant would get \(v > v/2\), so Dove is not stable either. The symmetric equilibrium must be in **mixed strategies**: each animal plays Hawk with probability \(p^* = v/c\). In a population interpretation, this means a fraction \(v/c\) of the population adopts the Hawk strategy and the rest play Dove. This mixed equilibrium is the unique symmetric NE and, when supplemented with the ESS invasion criterion, is evolutionarily stable (see Osborne, Problem 52.2 and Section 2.10).

---

# Chapter 3: Best Response Functions

## Definition

A player's <strong>best response function</strong> answers the question: given what the others are doing, what is my best action? Formally, for player \(i\), the best response function \(B_i(a_{-i})\) maps each list of opponents' actions to the set of payoff-maximizing actions for player \(i\):

\[
B_i(a_{-i}) = \left\{ a_i \in A_i \;\middle|\; u_i(a_i, a_{-i}) \geq u_i(a_i', a_{-i}) \quad \forall\ a_i' \in A_i \right\}
\]

Each element of \(B_i(a_{-i})\) is a best response of player \(i\) to the opponents' action list \(a_{-i}\): given that every other player chooses their action in \(a_{-i}\), player \(i\) can do no better than to pick some element of \(B_i(a_{-i})\).

## Nash Equilibrium via Best Responses

The best response function gives a clean characterization of Nash Equilibrium. An action profile \(a^*\) is a Nash Equilibrium if and only if every player's action is a best response to the others':

\[
a_i^<em> \in B_i(a_{-i}^</em>) \quad \forall\ i \in N
\]

This is exactly the NE definition restated: at equilibrium, no player can do better by deviating, which means each player is playing a best response. When each player has a <em>unique</em> best response to every action list, this becomes a system of \(n\) equations in \(n\) unknowns:

\[
a_i^<em> = b_i(a_{-i}^</em>) \quad \forall\ i \in N
\]

where \(b_i\) is the single-valued best response. Solving this system yields the Nash Equilibrium.

<strong>Geometrically</strong>, the NE corresponds to the intersection of the players' best response functions. When two best response curves cross on a graph, each player is simultaneously best-responding to the other's action — and that is precisely the definition.

## The Two-Player Guessing Game

In the two-player version of the 2/3-of-average game with action sets \(A_i = \{1, 2, \ldots, 10\}\), plotting the best response functions on a grid reveals their structure. Player 2's best response to any choice by Player 1 is the integer closest to two-thirds of that number, and vice versa. The two best response functions share a unique crossing point at \((1, 1)\) — the unique Nash Equilibrium. At any other action profile, at least one player has a profitable deviation downward, meaning the other intersection points are not Nash Equilibria.

## A Continuous Example: The Relationship Model

Best response functions are especially powerful for games with continuous action sets, where we can use calculus. Consider two players each choosing an effort level \(a_i \geq 0\) to invest in a relationship. Player \(i\)'s payoff is:

\[
u_i(a_i, a_j) = a_i(c + a_j - a_i)
\]

where \(c > 0\) is a parameter capturing the baseline value of the relationship. Two features stand out. First, there is <strong>complementarity</strong> between the players' efforts: a higher \(a_j\) increases the return to player \(i\)'s own effort — investing in a relationship matters more when your partner also invests. Second, the \(-a_i^2\) term introduces diminishing returns, ensuring an interior optimum exists.

To find the best response, we maximize player \(i\)'s quadratic payoff over \(a_i\). Since the payoff is concave in \(a_i\), there is a unique maximum for any \(a_j\):

\[
b_i(a_j) = \frac{1}{2}(c + a_j)
\]

Both players have identical best response functions: optimal effort is half the sum of the baseline value and the partner's effort. This directly captures the complementarity — the harder your partner works, the harder you should work too.

The Nash Equilibrium satisfies:

\[
a_1^<em> = \frac{1}{2}(c + a_2^</em>) \quad \text{and} \quad a_2^<em> = \frac{1}{2}(c + a_1^</em>)
\]

By symmetry, suppose \(a_1^<em> = a_2^</em> = a^*\). Substituting into either equation:

\[
a^<em> = \frac{1}{2}(c + a^</em>) \implies 2a^<em> = c + a^</em> \implies a^* = c
\]

The unique Nash Equilibrium is \((c, c)\) — both players exert effort equal to the baseline relationship value. The geometry confirms this: the two best response lines (each with slope \(\frac{1}{2}\) and intercept \(\frac{c}{2}\) cross exactly at \((c, c)\).

---

# Chapter 4: Dominated Strategies

## Strict Domination

Best response functions identify <em>optimal</em> actions. An equally useful idea identifies actions that are <em>never</em> optimal — actions a rational player would never choose, regardless of what the opponents do. Such actions are <strong>strictly dominated</strong>.

Formally, in a strategic game, player \(i\)'s action \(a_i''\) <strong>strictly dominates</strong> action \(a_i'\) if:

\[
u_i(a_i'', a_{-i}) > u_i(a_i', a_{-i}) \quad \forall\ a_{-i}
\]

The action \(a_i'\) is then said to be <strong>strictly dominated</strong>. Since a strictly dominated action is never a best response to <em>any</em> action list, and Nash Equilibrium actions are always best responses to the opponents' NE actions, it follows immediately that <strong>strictly dominated actions are never used in any Nash Equilibrium</strong>. We can therefore safely delete them before searching for NE.

More powerfully, we can iterate. After eliminating a strictly dominated action, the reduced game may reveal <em>new</em> dominated actions — actions that were not dominated in the original game but become so once certain opponent actions are removed. Continuing until no more eliminations are possible is called <strong>Iterative Deletion of Dominated Strategies</strong> (IDDS), or equivalently Iterated Elimination of Strictly Dominated Strategies (IESDS). Any Nash Equilibrium of the original game survives this process.

## Weak Domination

<strong>Weak domination</strong> relaxes the strictness condition. Player \(i\)'s action \(a_i''\) <strong>weakly dominates</strong> action \(a_i'\) if:

\[
u_i(a_i'', a_{-i}) \geq u_i(a_i', a_{-i}) \quad \forall\ a_{-i}
\]

with at least one strict inequality. The key difference: <strong>weakly dominated actions can appear in Nash Equilibria</strong>, so we cannot simply discard them.

## The Voting Game

A voting game illustrates the distinction clearly. Suppose there are two candidates, A and B, and many voters. Each voter can vote for A or for B. Voters care only about who wins — not about their individual vote per se. Consider a voter who prefers candidate A. Is voting for B ever rational?

Voting for B is a <strong>weakly dominated</strong> strategy for this voter. In the vast majority of scenarios, a single vote makes no difference to the outcome — the margin is too large. But in the rare event that the election comes down to a single vote, the voter is <strong>pivotal</strong>: their choice determines the outcome, and they receive a strictly higher payoff by voting for the candidate they prefer. Voting for B is therefore weakly dominated by voting for A — never strictly better and sometimes strictly worse.

Yet the game has Nash Equilibria in which <em>all</em> voters vote for the less popular candidate. If every voter believes everyone else will vote for B, then no single voter can change the outcome no matter what they do. They are indifferent, and voting for B is a valid best response. This NE is composed entirely of weakly dominated strategies.

The lesson: unlike strict domination, weak domination does not justify elimination of strategies when searching for all Nash Equilibria. However, the procedure of <strong>Iterative Elimination of Weakly Dominated Strategies</strong> (IEWDS) — repeatedly removing weakly dominated actions until a unique profile remains — can serve as a refinement criterion, selecting among multiple NE by focusing on those that survive scrutiny. Under IEWDS, all voters voting for their preferred candidate is the uniquely surviving outcome of the voting game.

---

# Chapter 5: Cournot Competition

## Why the Cournot Model Matters

The Cournot model is far more than a classroom exercise in applying best response functions. It is a model that is important in its own right in economics because it allows us to study <strong>strategic interaction within an industry</strong> — specifically, it lets us predict how prices and quantities respond to changes in demand, changes in the cost structure of firms, and changes in the number of firms competing in a given market.

To understand why this matters in practice, consider the role of the Competition Bureau of Canada. Suppose two firms operating in the same industry apply to merge. The Bureau knows that a merger will reduce the number of competing firms, and it may also change costs if there are economies of scale. The central question it must answer is whether consumers will be better or worse off if the merger is approved. A Cournot-type model — estimated using real data on the industry — provides exactly the framework needed to answer that question. This is one reason why models of oligopoly competition are not merely theoretical abstractions; they are working tools in applied competition policy.

## The General Model

### Players, Actions, and Preferences

The <strong>Cournot oligopoly game</strong> involves \(n\) firms, each of which must simultaneously decide how much output to produce. Following the standard framework for a strategic game, we define three elements.

The <strong>players</strong> are the \(n\) firms.

The <strong>actions</strong> available to each firm \(i\) constitute the set of feasible output levels. Formally, firm \(i\) chooses a quantity \(q_i \geq 0\). Notice that \(q_i\) is a continuous variable: there is no requirement that output be a whole number. Think of firms producing grain or some other divisible commodity rather than discrete units like automobiles.

The <strong>preferences</strong> of each firm are represented by its profit. Firms are assumed to be profit-maximizing, so each firm \(i\) has a payoff function equal to revenues minus costs:

\[
\pi_i(q_1, \ldots, q_n) = q_i \, P(q_1 + \cdots + q_n) - C_i(q_i)
\]

Here \(C_i(q_i)\) is the total cost function for firm \(i\), which is increasing in \(q_i\) — the more you produce, the higher your costs. The term \(P(q_1 + \cdots + q_n)\) is the <strong>inverse demand function</strong>, which gives the equilibrium market price as a function of the total quantity produced across all firms. We call it an inverse demand function because, while a conventional demand function tells us how much consumers will buy at a given price, this function inverts that relationship and tells us what price will prevail given total market output. Crucially, this price is decreasing in total output: the more all firms collectively produce, the lower the market price — as long as price remains above zero.

The strategic tension in this model is immediate. Each firm wants to produce more output because that means more units to sell at the prevailing price. But when any single firm produces more, it floods the market, depresses the equilibrium price, and thereby hurts not only its own per-unit revenue but also the revenues of every other firm. This is the negative externality that lies at the heart of Cournot competition.

### The Specific Duopoly Case

To make the model tractable, we work through a specific case in detail. We assume \(n = 2\), so we have a <strong>duopoly</strong>. The cost function is linear with a constant <strong>unit cost</strong> \(c\), so \(C_i(q_i) = c q_i\) for each firm. The inverse demand function is linear:

\[
P(q_1 + q_2) = \begin{cases} \alpha - q_1 - q_2 &amp;\text{if } q_1 + q_2 \leq \alpha \\ 0 &amp;\text{if } q_1 + q_2 &gt; \alpha \end{cases}
\]

The parameter \(\alpha &gt; 0\) is the maximum price this market can sustain — the price at which consumers would demand nothing, so it is the intercept of the demand curve. We require \(c &gt; 0\) as a basic economic assumption, and we require \(c &lt; \alpha\). This second condition deserves a moment's explanation: if \(c \geq \alpha\), the market price could never exceed the unit cost of production, and no firm would ever find it worthwhile to produce anything. The case \(c &lt; \alpha\) is therefore the only situation worth analyzing.

## Payoffs in the Linear Duopoly

Substituting the linear inverse demand and the unit cost into the profit function, firm \(i\)'s payoff is:

\[
\pi_i(q_1, q_2) = \begin{cases} q_i(\alpha - c - q_1 - q_2) &amp;\text{if } q_1 + q_2 \leq \alpha \\ -c q_i &amp;\text{if } q_1 + q_2 &gt; \alpha \end{cases}
\]

When total output exceeds \(\alpha\), the market price is zero and firm \(i\)'s only cash flow is the negative cost \(-c q_i\). In that region the firm clearly maximizes its payoff by choosing \(q_i = 0\). Since both firms would choose zero output there, neither will ever find it optimal to push output so high that it exceeds \(\alpha\) in equilibrium. Our analysis therefore focuses on the interior case where \(q_1 + q_2 \leq \alpha\), and we will verify that the equilibrium quantities we find do indeed satisfy this condition.

## Deriving the Best Response Functions

### The Interior Solution

To find each firm's best response, we proceed as follows. Firm 1 takes \(q_2\) as given — it cannot control what the other firm produces — and chooses \(q_1\) to maximize its profit. This profit function is quadratic in \(q_1\):

\[
\pi_1(q_1, q_2) = q_1(\alpha - c - q_1 - q_2)
\]

Taking the derivative with respect to \(q_1\) and setting it equal to zero gives the <strong>first-order condition</strong>:

\[
\frac{\partial \pi_1}{\partial q_1} = \alpha - c - 2q_1 - q_2 = 0
\]

Solving for \(q_1\):

\[
q_1 = \frac{1}{2}(\alpha - c - q_2)
\]

This is the interior solution. It says that firm 1's optimal output is decreasing in \(q_2\): the more the rival produces, the less firm 1 wants to produce. This negative slope is the hallmark of <strong>strategic substitutes</strong> — quantities are strategic substitutes because each firm's best response calls for less of the good when its rival chooses more.

For those uncomfortable with calculus, there is an equivalent way to arrive at the same expression. Since \(\pi_1\) is a downward-opening quadratic in \(q_1\), its maximum lies at the midpoint of its two roots (the values of \(q_1\) at which profit equals zero). Finding those roots and taking the midpoint yields exactly \(\frac{1}{2}(\alpha - c - q_2)\).

### The Corner Solution

We must be careful, however. Quantities must be non-negative. If \(q_2\) is large enough that the formula above would give a negative number, it is no longer valid. Specifically, when \(q_2 &gt; \alpha - c\), the term \(\alpha - c - q_2\) is negative. The profit function \(\pi_1 = q_1(\alpha - c - q_1 - q_2)\) then has a negative second factor for any positive \(q_1\), making profit negative. Firm 1 is better off choosing \(q_1 = 0\) and earning zero rather than producing anything and incurring a loss.

### The Complete Best Response Function

Combining the interior and corner cases, firm 1's <strong>best response function</strong> is:

\[
b_1(q_2) = \begin{cases} \dfrac{1}{2}(\alpha - c - q_2) &amp;\text{if } q_2 \leq \alpha - c \\[6pt] 0 &amp;\text{if } q_2 &gt; \alpha - c \end{cases}
\]

Because firm 2 has the same cost function, its best response function is obtained by symmetry — simply interchange the labels 1 and 2:

\[
b_2(q_1) = \begin{cases} \dfrac{1}{2}(\alpha - c - q_1) &amp;\text{if } q_1 \leq \alpha - c \\[6pt] 0 &amp;\text{if } q_1 &gt; \alpha - c \end{cases}
\]

## The Best Response Function Graph

Before solving algebraically, it is worth drawing these functions, as the graph provides important geometric intuition and guards against errors that pure algebra might conceal.

Place \(q_1\) on the horizontal axis and \(q_2\) on the vertical axis. Firm 1's best response function \(b_1(q_2)\) is drawn as a function of \(q_2\), so it describes a downward-sloping line segment. When \(q_2 = 0\), the best response is \(q_1 = \frac{1}{2}(\alpha - c)\), which is the horizontal intercept of this line. When \(q_2 = \alpha - c\), the interior formula gives \(q_1 = 0\), which is the point where the line meets the vertical axis. For values of \(q_2\) above \(\alpha - c\), the best response is zero, so the function runs along the vertical axis. Together these two segments — the downward-sloping interior piece and the flat portion along the axis — form the complete best response curve for firm 1.

Firm 2's best response function \(b_2(q_1)\) is symmetric: it is also a downward-sloping line (with slope \(-\frac{1}{2}\) starting at \(q_2 = \frac{1}{2}(\alpha - c)\) when \(q_1 = 0\) and reaching zero when \(q_1 = \alpha - c\), beyond which it lies flat along the horizontal axis.

The two interior segments intersect at a single point. That intersection is the Nash equilibrium, because it is the unique pair \((q_1, q_2)\) at which both firms are simultaneously best-responding to each other. Visually checking this is essential: with different cost structures across firms, the two curves could intersect on the axis portion rather than in the interior, leading to a corner equilibrium rather than the symmetric interior one we find here. Always drawing the graph prevents being misled by algebra alone.

## Nash Equilibrium

### Computing the Equilibrium Quantities

The Nash equilibrium is found by solving the two best response functions simultaneously. Setting each firm's output equal to its best response to the other's output:

\[
\begin{aligned} q_1 &amp;= \tfrac{1}{2}(\alpha - c - q_2) \\ q_2 &amp;= \tfrac{1}{2}(\alpha - c - q_1) \end{aligned}
\]

By the symmetry of the system, we can guess — and then verify — that \(q_1^<em> = q_2^</em>\). Substituting \(q_2^<em> = q_1^</em>\) into the first equation:

\[
q_1^<em> = \frac{1}{2}(\alpha - c - q_1^</em>) \implies \frac{3}{2}q_1^<em> = \frac{\alpha - c}{2} \implies q_1^</em> = \frac{\alpha - c}{3}
\]

The unique <strong>Nash equilibrium</strong> of the linear Cournot duopoly is therefore the <strong>symmetric Nash equilibrium</strong>:

\[
(q_1^<em>, q_2^</em>) = \left(\frac{\alpha - c}{3},\ \frac{\alpha - c}{3}\right)
\]

We can now verify our earlier assumption: total output is \(q_1^<em> + q_2^</em> = \frac{2}{3}(\alpha - c)\), which is less than \(\alpha\) since \(c &gt; 0\). The assumption \(q_1 + q_2 \leq \alpha\) is confirmed.

### Equilibrium Price

With both firms producing \(\frac{\alpha - c}{3}\), the equilibrium market price is:

\[
P^<em> = \alpha - q_1^</em> - q_2^* = \alpha - \frac{2}{3}(\alpha - c) = \frac{\alpha}{3} + \frac{2c}{3}
\]

This price is strictly positive (since \(c &gt; 0\) and \(\alpha &gt; 0\), confirming that we are in the valid region of the demand function.

## Comparative Statics

The equilibrium results allow us to trace how the market outcome responds to changes in the underlying parameters, an exercise known as <strong>comparative statics</strong>.

Consider first an increase in \(\alpha\). Recall that \(\alpha\) is the intercept of the inverse demand function — it captures how much consumers are willing to pay at zero output, and hence represents the strength of demand. When \(\alpha\) rises, both the equilibrium quantity \(\frac{\alpha - c}{3}\) and the equilibrium price \(\frac{\alpha}{3} + \frac{2c}{3}\) increase. Higher consumer willingness to pay draws out more production and supports a higher market price. This is the intuitive result one would expect from any supply-and-demand analysis.

Now consider an increase in the unit cost \(c\). Higher costs reduce each firm's willingness to produce: equilibrium output \(\frac{\alpha - c}{3}\) falls. With less total output on the market, the equilibrium price \(\frac{\alpha}{3} + \frac{2c}{3}\) rises. This too is intuitive: when production becomes more expensive, firms produce less and prices go up.

## Collusion and Competition Policy

### Why Firms Would Want to Collude

Once we know the Nash equilibrium, a natural question arises: are these firms satisfied with this outcome, or could they do better? The answer is striking. There exists a <strong>collusive outcome</strong> at which both firms would earn higher profits than they do in the Nash equilibrium. This outcome is <strong>Pareto superior</strong> for the firms — both are better off compared to the Nash equilibrium.

How would such an outcome look? Both firms would agree to produce quantities smaller than the Cournot equilibrium quantities. With less total output flooding the market, the equilibrium price would rise. The higher price more than compensates for the lower volume, so both firms earn larger profits. In other words, by jointly restricting their output relative to what they would individually choose, the two firms can collectively capture more surplus from the market.

The intuition runs through the concept of a negative externality. When firm 1 produces an additional unit of output, it depresses the market price. That price reduction hurts not only firm 1's own revenues but also firm 2's revenues on every unit firm 2 sells. Firm 1, however, does not account for the harm it inflicts on firm 2 — it cares only about its own profit. As a result, each firm produces more than would be jointly optimal, and the Nash equilibrium involves too much output from the perspective of the firms' collective interest.

### Why Collusion Is Illegal

This analysis explains precisely why competition authorities prohibit collusive behavior. If the two firms were allowed to get together and agree to restrict their output, prices would rise, profits would increase, and consumers would pay more. The Competition Bureau of Canada — along with analogous agencies in other jurisdictions — forbids firms from entering into agreements to fix prices, restrict output, or divide markets for exactly this reason. The Cournot model makes the mechanism transparent: the Nash equilibrium, while bad for firms relative to collusion, is the outcome consumers prefer.

## The Effect of Entry: Price and the Number of Firms

One of the most powerful applications of the Cournot model is to ask what happens to the equilibrium price as the number of competing firms grows. With \(n\) symmetric firms each facing a unit cost of \(c\) and the same linear inverse demand, the symmetric Nash equilibrium output per firm is \(\frac{\alpha - c}{n+1}\), so the equilibrium price is:

\[
P^*(n) = \frac{\alpha + nc}{n+1}
\]

As \(n \to \infty\), this expression approaches \(c\). In other words, as the number of firms in the industry grows without bound, the equilibrium price converges to the <strong>marginal cost</strong> of production. Firms will never sell goods below their cost — doing so would mean choosing to incur a loss — but with increasing competition they are driven ever closer to that lower bound.

This result is both intuitive and reassuring. More competition keeps prices low and benefits consumers. The Cournot model thus captures the same fundamental insight as the perfectly competitive model, but derives it endogenously from firms' strategic behavior rather than from an assumption of price-taking. The outcome where price equals marginal cost is the best possible outcome for consumers given that firms must at least break even, and the Cournot model shows that this outcome is approached in the limit of free entry.

## Generalization: The Commons Problem

The Cournot model turns out to capture something much more general than firms competing in a market. Notice that each firm's profit can be written in the form:

\[
\pi_i = f_i(q_i,\ q_1 + q_2 + \cdots + q_n)
\]

where \(f_i\) is decreasing in its second argument. The payoff to any one player falls as the total aggregate action of all players rises, while each player controls only their own contribution to that aggregate. This structure captures any situation in which players compete to exploit a piece of <strong>common property</strong> whose value to each individual diminishes with total use.

A classic example is a <strong>village grazing field</strong>. Imagine a community of farmers who share a common pasture. Each farmer decides how many sheep to put out to graze. The more sheep there are on the pasture in total, the less grass each sheep gets, the less weight each sheep gains, and the lower the value of the flock to any individual farmer. When a farmer adds one more sheep, she receives the full benefit of that additional sheep but imposes the cost of reduced grazing quality on every other farmer's flock. Just as in the Cournot game, each individual ignores the negative externality she inflicts on others, and as a result the commons is overused in equilibrium.

The parallel between the two games is exact. In the Cournot game the common property is the consumer market, whose capacity to support high prices diminishes as more output floods in. In the grazing game the common property is the pasture, whose productivity diminishes as more sheep are added. In both cases, there is a collusive outcome — restricting individual use below the Nash equilibrium level — that would make every participant better off. And in both cases, reaching that outcome requires some form of coordination or enforcement that the non-cooperative equilibrium cannot deliver on its own.

From the consumers' perspective, overuse of the market is actually a good thing — it means more output and lower prices. But for common resources like forests or fisheries, overuse leads to depletion that harms everyone, including future generations. The Cournot model thus provides the conceptual foundation for understanding the <strong>tragedy of the commons</strong>, the pervasive tendency for individually rational behavior to collectively exhaust shared resources.

---

# Chapter 6: Bertrand Competition

## Overview and Contrast with Cournot

The Cournot model, developed in the previous chapter, gives us one way to think about how firms compete in an industry with a small number of players. Recall that in Cournot's framework the strategic variable is <strong>quantity</strong>: each firm simultaneously chooses how many units to produce, the market-clearing price then adjusts to balance supply and demand, and firms earn profits accordingly. The <strong>Bertrand model of oligopoly</strong>, named after the French mathematician Joseph Bertrand who critiqued Cournot's work in 1883, addresses many of the same questions — equilibrium output, equilibrium prices, how market structure relates to social welfare — but from a fundamentally different angle. In Bertrand's model, firms choose a <strong>price</strong>, not a quantity. That single change in the strategic variable turns out to have far-reaching consequences for the equilibrium prediction.

In many real-world industries this is in fact the more natural description of competition. Retail chains post price tags; airlines publish fares; internet retailers display a price and commit to filling any order placed at that price. Once a firm names a price and customers arrive, the firm is obligated to satisfy demand at that price. This commitment is built directly into the Bertrand model.

## The General Model Setup

### Players, Actions, and Preferences

Consider an industry with \(n\) firms. Firm \(i\) incurs a cost \(C_i(q_i)\) to produce \(q_i\) units, where \(C_i\) is an increasing function of output. The total quantity that consumers demand when the market price is \(p\) is given by the <strong>demand function</strong> \(D(p)\), which is decreasing in \(p\) for all \(p\) at which demand is non-negative. Notice the contrast with Cournot: there we used an inverse demand function expressing price as a function of aggregate quantity; here we express quantity demanded as a function of price. The underlying relationship between price and quantity is the same — it is simply written in one direction versus the other.

Firms simultaneously announce prices. Consumers, observing all posted prices, purchase entirely from whichever firm has set the lowest price. If more than one firm ties for the lowest price, they share demand equally among themselves. Critically, once a firm sets a price it must satisfy whatever demand arrives at that price.

Formalised as a strategic game:

- <strong>Players:</strong> the \(n\) firms.
- <strong>Actions:</strong> each firm \(i\) chooses a price \(p_i \geq 0\). Importantly, prices are treated as continuous — not restricted to whole cents — and this continuity assumption will matter when we derive best response functions.
- <strong>Preferences:</strong> each firm's preferences are represented by its profit \(\pi_i\). If firm \(i\) is one of \(m\) firms that jointly set the lowest price, then each receives \(1/m\) of total demand and earns

\[
\pi_i = p_i \cdot \frac{D(p_i)}{m} - C_i\!\left(\frac{D(p_i)}{m}\right).
\]

If some other firm has set a strictly lower price, firm \(i\) sells nothing and earns \(\pi_i = 0\).

## A Tractable Example: Duopoly with Linear Demand and Constant Unit Cost

### Setup

As with Cournot, a specific functional form makes the analysis concrete. Take \(n = 2\) firms. Each firm has a <strong>constant unit cost</strong> \(c > 0\), so that \(C_i(q_i) = c \, q_i\). The demand function is linear:

\[
D(p) = \begin{cases} \alpha - p &amp; \text{if } p \leq \alpha \\ 0 &amp; \text{if } p > \alpha, \end{cases}
\]

where \(\alpha > 0\) is the intercept of demand (the quantity demanded if price were zero) and \(\alpha\) also serves as the <strong>choke price</strong> beyond which no consumer is willing to buy. The parameter restriction \(c &lt; \alpha\) ensures that production is worthwhile: if \(c \geq \alpha\), demand would be zero at every price at or above the unit cost, so the market would be economically vacuous.

### Payoff Structure

With two firms the profit for firm \(i\) (where \(j\) denotes the other firm) takes three forms depending on how the prices compare:

\[
\pi_i(p_1, p_2) = \begin{cases} (p_i - c)(\alpha - p_i) &amp; \text{if } p_i &lt; p_j \\ \frac{1}{2}(p_i - c)(\alpha - p_i) &amp; \text{if } p_i = p_j \\ 0 &amp; \text{if } p_i > p_j. \end{cases}
\]

When firm \(i\) charges the strictly lower price it captures all demand \(\alpha - p_i\) and earns \(p_i - c\) on each unit. When both prices are equal they split the market. When firm \(i\) charges more it is priced out entirely.

### The Monopoly Price

Before deriving best responses it is useful to define the <strong>monopoly price</strong> \(p^M\) as the value of \(p\) that maximises the expression \((p - c)(\alpha - p)\). Why is this the monopoly price? Imagine a single firm in the market. It would choose \(p\) to maximise profit \((p - c) \cdot D(p) = (p - c)(\alpha - p)\). That maximising price is precisely \(p^M\). The expression is quadratic in \(p\) and concave, so there is a unique interior maximum. Setting the derivative to zero gives

\[
p^M = \frac{\alpha + c}{2}.
\]

No firm would ever voluntarily set a price above \(p^M\), because doing so would reduce profit relative to charging \(p^M\) even when capturing the whole market. This ceiling will organise the case analysis below.

## Best Response Functions

### Case 1: \(p_j &lt; c\)

Suppose the rival firm has set a price strictly below the common marginal cost. What should firm \(i\) do?

- Setting \(p_i &lt; p_j\) means firm \(i\) captures the entire market but sells every unit at a price strictly below cost, yielding strictly negative profit.
- Setting \(p_i = p_j\) still means selling at below cost — firm \(i\) earns half the market but still loses money on each unit, so profit is again negative.
- Setting \(p_i > p_j\) means firm \(i\) sells nothing and earns exactly zero.

Zero beats any negative number, so the best response here is to <strong>lose the price war intentionally</strong> — to set any price strictly above \(p_j\):

\[
B_i(p_j) = \{p_i : p_i > p_j\} \quad \text{if } p_j &lt; c.
\]

### Case 2: \(p_j = c\)

Now suppose the rival prices exactly at marginal cost.

- Setting \(p_i &lt; c\) means selling below cost, earning negative profit.
- Setting \(p_i = c\) means splitting demand but earning zero margin per unit — profit is zero.
- Setting \(p_i > c\) means being undercut, selling nothing — profit is again zero.

Both \(p_i = c\) and any \(p_i > c\) yield zero profit, which is the best achievable. The best response set is therefore all prices at or above \(c\):

\[
B_i(p_j) = \{p_i : p_i \geq c\} \quad \text{if } p_j = c.
\]

### Case 3: \(c &lt; p_j \leq p^M\)

This is the most subtle case. The rival's price is above cost but no higher than the monopoly price. Any \(p_i\) in the open interval \((c, p_j)\) earns firm \(i\) a strictly positive profit — it captures the whole market at a price above cost. Moreover, this profit is increasing in \(p_i\) as \(p_i\) rises toward \(p_j\) (since we are still below the monopoly price and the per-unit margin is rising). At exactly \(p_i = p_j\) profit drops discontinuously: firm \(i\) now splits demand with the rival and earns only half the profit it would have earned by charging infinitesimally less. For any \(p_i > p_j\) profit collapses to zero.

The picture is of a profit function that climbs steadily as \(p_i\) approaches \(p_j\) from below, then drops sharply at \(p_j\), then remains at zero. Firm \(i\) wants to get as close to \(p_j\) as possible without actually reaching it — but because prices are drawn from a continuum, there is no such closest point. For any candidate price \(p_j - \varepsilon\) one can always find \(p_j - \varepsilon/2\), which is even better. Consequently, <strong>the best response set is empty</strong>:

\[
B_i(p_j) = \emptyset \quad \text{if } c &lt; p_j \leq p^M.
\]

This empty best response would not arise if prices were restricted to a discrete grid (say, whole cents). In that discrete setting the best response would simply be to charge one cent below \(p_j\). The textbook exercise 67.2 asks you to work through that case explicitly.

### Case 4: \(p_j > p^M\)

If the rival prices strictly above the monopoly price it has effectively removed itself from competition. Consumers will never buy from a firm charging above \(p^M\) when firm \(i\) can do better. From firm \(i\)'s perspective it is as though there is no rival at all. The profit-maximising response is simply to act as a monopolist and charge \(p^M\):

\[
B_i(p_j) = \{p^M\} \quad \text{if } p_j > p^M.
\]

### Summary of the Best Response Function

Combining the four cases:

\[
B_i(p_j) = \begin{cases} \{p_i : p_i > p_j\} &amp; \text{if } p_j &lt; c \\ \{p_i : p_i \geq c\} &amp; \text{if } p_j = c \\ \emptyset &amp; \text{if } c &lt; p_j \leq p^M \\ \{p^M\} &amp; \text{if } p_j > p^M. \end{cases}
\]

Notice two distinctive features of this best response correspondence. For some values of \(p_j\) (cases 1 and 2) there are multiple best responses; for others (case 3) there is no best response at all. This is a set-valued, and in places empty-valued, correspondence — qualitatively different from the smooth best response functions encountered in Cournot.

## Finding the Nash Equilibrium via Best Response Functions

A Nash equilibrium is a pair of prices \((p_1^<em>, p_2^</em>)\) such that each price is in the best response set to the other: \(p_1^<em> \in B_1(p_2^</em>)\) and \(p_2^<em> \in B_2(p_1^</em>)\). Graphically, a Nash equilibrium lies at the intersection of the graphs of the two best response correspondences.

When we superimpose the best response graph of firm 1 (plotting the best responses to each value of \(p_2\) onto that of firm 2, the only point at which they intersect is the single point \((c, c)\). For \(p_j\) below \(c\), best responses exclude the 45-degree line (the equal-price diagonal); for \(p_j\) strictly between \(c\) and \(p^M\), no best response exists at all. The graphs come together at exactly one point: both firms charging \(c\).

The <strong>unique Nash equilibrium</strong> of the Bertrand duopoly game is therefore:

\[
(p_1^<em>, p_2^</em>) = (c, c).
\]

## Verification by Profitable Deviation

The same conclusion can be reached by the first method we learned — examining every possible action profile and checking whether any player can make a profitable deviation. This approach is instructive because it makes the logic of the equilibrium transparent. There are two steps: show that \((c, c)\) is indeed a Nash equilibrium, then show that nothing else can be.

### Step 1: \((c, c)\) Is a Nash Equilibrium

At \((c, c)\) both firms split demand and earn zero profit. Can either deviate profitably?

- If firm \(i\) lowers its price below \(c\), it captures the entire market but sells every unit at below cost, earning strictly negative profit. That is worse than zero, so this is not a profitable deviation.
- If firm \(i\) raises its price above \(c\), the rival (still at \(c\) captures all demand. Firm \(i\) sells nothing and earns zero — no better than before. This too is not a profitable deviation.

Neither firm can do strictly better by changing its price unilaterally, confirming that \((c, c)\) is a Nash equilibrium.

### Step 2: No Other Price Profile Is a Nash Equilibrium

Every possible price profile \((p_1, p_2) \neq (c, c)\) falls into one of three exhaustive cases.

<strong>Case A: At least one firm prices below cost.</strong> If \(p_i &lt; c\) for some \(i\), that firm earns negative profit (it either has the lowest price and sells at a loss, or ties for the lowest price and sells at a loss on its share). That firm can raise its price to \(c\) and guarantee zero profit — a strictly profitable deviation. So no such profile is a Nash equilibrium.

<strong>Case B: \(p_i = c\) and \(p_j > c\).</strong> Firm \(i\) is currently charging cost and earning zero profit. But if it raises its price slightly — to any value strictly between \(c\) and \(p_j\) — it still has the lower price, captures the entire market, and now earns a strictly positive margin on every unit. That is a profitable deviation, so this profile is not a Nash equilibrium.

<strong>Case C: Both firms price strictly above cost.</strong> Without loss of generality suppose \(p_i \geq p_j\). Firm \(i\) is either tied for the high price or is the outright high-price firm; in either case it can do better. If \(p_j &lt; \alpha\), firm \(i\) can undercut by pricing just below \(p_j\), capturing the whole market at a price well above cost and earning a large positive profit. If \(p_j \geq \alpha\), demand is zero anyway, and firm \(i\) can profitably deviate to \(p^M\) which generates strictly positive profit. In either sub-case, a profitable deviation exists.

Since every profile other than \((c, c)\) admits a profitable deviation for at least one firm, \((c, c)\) is the <strong>unique Nash equilibrium</strong> of the Bertrand game.

## The Bertrand Paradox

The equilibrium result is striking enough to have earned its own name. The <strong>Bertrand paradox</strong> is the observation that, in the model described above, just two firms competing on price are sufficient to reproduce the outcome of perfect competition: price equals marginal cost, and economic profit is zero. In Cournot's model with two firms we obtained a price strictly above marginal cost (and falling toward the competitive price only as the number of firms grows to infinity). Bertrand's model collapses to the competitive outcome immediately with only two competitors.

Why is this called a paradox? In practice, markets with two or three firms very rarely look like perfectly competitive markets. Prices typically exceed marginal cost even in duopolies, firms earn positive profits, and consumers do not capture all surplus. The model's starkly competitive prediction seems to strain credulity.

The resolution lies in examining the model's assumptions. Several of them are particularly severe:

1. <strong>Homogeneous goods.</strong> The model assumes that the two firms sell perfectly identical products. If consumers care even slightly about brand, convenience, or quality differences, the demand-goes-entirely-to-the-cheapest-firm rule breaks down.

2. <strong>No capacity constraints.</strong> After setting a price each firm must satisfy all demand. If firms face capacity limits they may not be able to serve the entire market even at the lowest price, which changes the strategic incentives fundamentally.

3. <strong>Continuous prices.</strong> The no-best-response result in case 3 depends on prices being drawn from a continuum. With discrete prices (whole cents) the equilibrium changes in character.

<strong>Product differentiation</strong> is the most commonly invoked resolution in economics. When firms sell goods that are imperfect substitutes — differentiated by branding, location, quality, or features — a firm that prices slightly above its rival does not lose all its customers. Some customers prefer firm \(i\)'s product and will pay a modest premium for it. This restores the existence of a best response and typically yields an equilibrium with prices above marginal cost and positive profits, as observed in most real oligopolies. Chapters on differentiated competition develop this idea formally.

## Cournot versus Bertrand: A Comparison

The contrast between Cournot and Bertrand is one of the central lessons of oligopoly theory. Both models feature a small number of firms producing the same good and competing strategically; they differ only in the choice variable. Yet the equilibrium predictions diverge sharply.

In Cournot competition the Nash equilibrium involves positive profit, output below the competitive level, and price above marginal cost — though below the monopoly price. The degree of market power falls continuously as the number of firms increases. In Bertrand competition with homogeneous goods and no capacity constraints, even two firms are enough to drive price to marginal cost and eliminate economic profit entirely.

This sensitivity of the equilibrium to the nature of competition — quantity versus price — illustrates a broader principle in game theory: the equilibrium outcome depends critically on what the players choose, not just on how many of them there are. Choosing the right model of competition for a given industry requires understanding what firms actually commit to in practice: production plans and capacity investments, or posted prices.

---

# Chapter 7: Electoral Competition

## Motivation: Why Do Parties Converge on Policy?

Consider the puzzle of political positioning. In any election, a political party has every incentive to ask: given what our opponents are doing, what platform should we adopt to maximize our chances of winning? The answer that game theory delivers is both elegant and surprising — and it flies in the face of what we sometimes observe in practice.

To motivate the model, think about what Vote Compass revealed in a recent Canadian federal election, where it mapped the four main parties along two axes: social conservatism on the horizontal and fiscal conservatism on the vertical. What emerged was that the NDP, the Greens, and the Liberals clustered relatively close together, while the PCs sat quite far away — and the centre of the political map was, remarkably, left almost vacant. A meme circulated at the time labelling the empty centre "the zone of despair," the territory where centrist voters found themselves with nobody genuinely representing them. This is the puzzle: if a party cares only about winning, why would it leave the centre unoccupied?

The model we build in this chapter offers a clear answer for the stylized, one-dimensional case, and the result is the famous <strong>median voter theorem</strong>.

## The Model: Hotelling's Electoral Competition

The framework we study is known as <strong>Hotelling's model of electoral competition</strong>, after the economist Harold Hotelling, who first applied a similar spatial logic to firms competing for customers. The political science version models candidates as players competing for votes by choosing positions along a single policy dimension.

### Compressing Policy Into One Dimension

Real policy debates span countless issues — immigration, reconciliation, fiscal balance, taxation, healthcare. Hotelling's approach compresses all of these into a single number, a <strong>position</strong> on a line. Think of the left end of the line as representing progressive, high-spending policies and the right end as representing conservative, fiscally restrained policies. Any voter's ideal set of policies maps to some point on this line, and any candidate's platform is likewise a single number.

This simplification is strong, but it is precisely what makes the model tractable. In two dimensions things already become considerably more complicated; in three or four dimensions, far more so. The one-dimensional model is where the cleanest insights live.

### Players, Actions, and Preferences

Hotelling's model is a strategic game with the following formal structure.

<strong>Players.</strong> The players are the \( n \) candidates. Voters are present in the model but are passive — they do not make strategic decisions. A voter simply looks at the positions chosen by all candidates and casts her ballot for the one closest to her own ideal point.

<strong>Actions.</strong> Each candidate chooses a <strong>position</strong>, which is a real number representing a point on the policy line. The action space is continuous.

<strong>Preferences.</strong> Candidates care only about whether they win, tie, or lose — they have no ideological attachment to any position whatsoever. Formally, each candidate's preferences are represented by a payoff function that assigns \( n \) to every action profile in which she wins outright, \( k \) to every action profile in which she ties for first place with \( n - k \) other candidates (for \( 1 \leq k \leq n-1 \), and \( 0 \) to every action profile in which she loses.

This payoff structure captures a strict preference ordering: winning outright is best, losing outright is worst, and ties are ranked in between according to how many candidates share the victory. A tie between two candidates (each receiving half the vote) is preferred to losing, but is less preferred than winning outright.

It is worth acknowledging that this assumption is a deliberate abstraction. In reality, parties contain members with genuine ideological commitments, and the gap between, say, a Liberal platform and a Conservative platform reflects those attachments. A richer model could give candidates partial payoffs based on the ideological proximity of the winner's platform to their own. Another variant would have candidates who care only about the policy implemented, not whether they personally win. Hotelling's model strips all of that away to isolate the pure vote-maximizing logic.

### The Distribution of Voters and the Median

There is a <strong>continuum of voters</strong>, each with a <strong>favourite position</strong> — the policy point they would most prefer to see implemented. These favourite positions are distributed according to some continuous distribution across the policy line. The model does not require a uniform distribution; it works for any continuous distribution.

Each voter's distaste for any candidate's position is measured by the <strong>distance</strong> between that position and her own favourite position. She votes for whichever candidate has chosen the position closest to hers. If two candidates are equidistant from her favourite position, she splits her vote equally between them.

This rule for vote allocation means that when two candidates choose positions \( x_1 \) and \( x_2 \), with \( x_1 &lt; x_2 \), every voter whose favourite position lies to the left of the midpoint \( \frac{1}{2}(x_1 + x_2) \) votes for candidate 1, and every voter whose favourite position lies to the right of that midpoint votes for candidate 2. With three candidates at positions \( x_1 &lt; x_2 &lt; x_3 \), candidate 1 attracts voters to the left of \( \frac{1}{2}(x_1 + x_2) \), candidate 2 attracts voters between \( \frac{1}{2}(x_1 + x_2) \) and \( \frac{1}{2}(x_2 + x_3) \), and candidate 3 attracts voters to the right of \( \frac{1}{2}(x_2 + x_3) \).

### The Median Favourite Position

The key concept in solving the model is the <strong>median favourite position</strong>, denoted \( m \). This is the position such that exactly half of all voters' favourite positions are at most \( m \), and half are at least \( m \). In other words, if you draw the density of voter ideal points along the policy line, \( m \) is the point that splits the area under that density curve into two equal halves.

The definition requires a little care. We cannot simply say "half the voters are strictly to the left and half strictly to the right," because there could be a mass of voters whose favourite position is exactly \( m \). The correct statement is that the set of voters with favourite positions at or below \( m \) constitutes exactly 50% of the electorate, and the set with favourite positions at or above \( m \) also constitutes exactly 50%.

As the analysis below makes clear, \( m \) plays a pivotal role in determining equilibrium behaviour.

## Solving the Two-Candidate Game

With the model formally defined, we now solve for the Nash equilibrium in the case of two candidates. There are two complementary methods available: deriving best response functions and finding their intersection, or enumerating the possible cases for action profiles and ruling out all non-equilibria. Both are instructive, and we work through both.

### Method 1: Best Response Functions

To find candidate 1's best response function, we fix candidate 2's position \( x_2 \) and ask what position maximizes candidate 1's payoff. There are three cases based on where \( x_2 \) falls relative to the median \( m \).

<strong>Case 1: \( x_2 &lt; m \).</strong> Suppose candidate 2 has positioned herself strictly to the left of the median. If candidate 1 also positions to the left of \( x_2 \), then candidate 2 attracts all voters to her right — a set that, since \( x_2 &lt; m \), contains more than 50% of the electorate. Candidate 1 loses. On the other hand, if candidate 1 moves to the right of \( x_2 \), she begins winning votes. She wins as long as the dividing midpoint \( \frac{1}{2}(x_1 + x_2) \) lies to the left of \( m \), which means that candidate 1 holds a majority. The constraint for candidate 1 to win is:

\[
\frac{1}{2}(x_1 + x_2) &lt; m
\]

Rearranging, this requires \( x_1 &lt; 2m - x_2 \). The point \( 2m - x_2 \) is the mirror image of \( x_2 \) reflected through \( m \). Candidate 1's best response is therefore the open interval of all positions strictly between \( x_2 \) and \( 2m - x_2 \):

\[
B_1(x_2) = \{ x_1 : x_2 &lt; x_1 &lt; 2m - x_2 \} \quad \text{if } x_2 &lt; m
\]

Any position in this interval secures a win; any position outside it results in a loss or a tie.

<strong>Case 2: \( x_2 &gt; m \).</strong> This case is perfectly symmetric. Candidate 2 is now to the right of the median, so any position to the right of \( x_2 \) causes candidate 1 to lose. For candidate 1 to win, she must be to the left of \( x_2 \), and the midpoint \( \frac{1}{2}(x_1 + x_2) \) must lie to the right of \( m \), which requires \( x_1 &gt; 2m - x_2 \). The best response is:

\[
B_1(x_2) = \{ x_1 : 2m - x_2 &lt; x_1 &lt; x_2 \} \quad \text{if } x_2 &gt; m
\]

<strong>Case 3: \( x_2 = m \).</strong> When candidate 2 sits exactly at the median, any deviation by candidate 1 to either side results in a loss. If candidate 1 moves to the right of \( m \), the midpoint between the two positions lies to the right of \( m \), meaning candidate 2 captures more than half the electorate. The same logic applies if candidate 1 moves to the left. The only option that does not result in a loss is to match candidate 2 exactly at \( m \), which produces a tie. Since a tie is strictly better than a loss:

\[
B_1(x_2) = \{ m \} \quad \text{if } x_2 = m
\]

Putting the three cases together, candidate 1's complete best response function is:

\[
B_1(x_2) = \begin{cases} \{ x_1 : x_2 &lt; x_1 &lt; 2m - x_2 \} &amp;amp; \text{if } x_2 &lt; m \\ \{ m \} &amp;amp; \text{if } x_2 = m \\ \{ x_1 : 2m - x_2 &lt; x_1 &lt; x_2 \} &amp;amp; \text{if } x_2 &gt; m \end{cases}
\]

Candidate 2 faces entirely symmetric incentives and has an identical best response function with the roles of \( x_1 \) and \( x_2 \) exchanged.

### Finding the Nash Equilibrium from Best Response Functions

Graphing the two best response functions reveals two triangular regions in the \( (x_1, x_2) \) plane — one for \( x_2 &lt; m \) and one for \( x_2 &gt; m \) — along with the single point \( (m, m) \). Crucially, because the best response sets are open (the boundary positions are excluded), the two triangular regions share no interior overlap with one another. The only point that lies in both players' best response sets simultaneously is the single point \( (m, m) \).

Superimposing the two best response functions, the game has a <strong>unique Nash equilibrium</strong> in which both candidates choose the voters' median position:

\[
(x_1^<em>, x_2^</em>) = (m, m)
\]

### Method 2: Direct Enumeration of Cases

An alternative — and in this instance, somewhat more transparent — approach is to verify directly that \( (m, m) \) is a Nash equilibrium and then show that no other action profile can be one. Because there are infinitely many possible profiles, this requires partitioning the space of profiles into exhaustive, non-overlapping cases.

<strong>Part 1: \( (m, m) \) is a Nash equilibrium.</strong> When both candidates choose \( m \), the outcome is a tie, with each candidate receiving 50% of the vote. If either candidate deviates by moving to the left of \( m \), the midpoint between the two positions shifts left of \( m \), and the candidate who remains at \( m \) captures more than half the electorate — the deviating candidate loses. By the symmetric argument, a deviation to the right of \( m \) also results in a loss. Since no profitable deviation exists, \( (m, m) \) is a Nash equilibrium.

<strong>Part 2: No other action profile is a Nash equilibrium.</strong> Consider any profile \( (x_1, x_2) \neq (m, m) \). There are three exhaustive sub-cases.

<em>Sub-case (a): \( x_1 = x_2 \neq m \).</em> Both candidates have chosen the same position, but not the median. The current outcome is a tie. Either candidate can deviate to \( m \); after such a deviation the midpoint between \( m \) and the unchanged candidate's position is strictly between \( m \) and that position, so the deviating candidate captures more than 50% of the vote and wins outright. Winning is strictly better than tying. Therefore, this profile is not a Nash equilibrium.

<em>Sub-case (b): \( x_1 \neq x_2 \) and \( \frac{1}{2}(x_1 + x_2) \neq m \).</em> The candidates are at different positions and the midpoint between them is not at the median. One candidate is therefore winning outright and the other is losing. The losing candidate can deviate to \( m \) and at minimum tie — which is strictly better than losing. This is a profitable deviation, so the profile is not a Nash equilibrium.

<em>Sub-case (c): \( x_1 \neq x_2 \) and \( \frac{1}{2}(x_1 + x_2) = m \).</em> The candidates are at different positions but are symmetrically placed around the median, so they are currently tied. Either candidate can deviate to \( m \); the deviating candidate then wins outright rather than tying, which is a profitable deviation. Therefore, this profile is also not a Nash equilibrium.

Since all three sub-cases exhaust the space of profiles other than \( (m, m) \), and each contains a profitable deviation for at least one player, we conclude that \( (m, m) \) is the <strong>unique Nash equilibrium</strong> of Hotelling's model.

## The Median Voter Theorem

The result established above is the <strong>median voter theorem</strong>: in a two-candidate election where candidates care only about winning and voters vote for the closest candidate, both candidates converge in equilibrium to the median voter's ideal policy position. The theorem is one of the most cited results in political economy.

The logic of the proof illuminates why convergence is so powerful. Whenever a candidate is positioned anywhere other than the median, her opponent can strictly improve by moving toward the median and peeling away votes from the side that contains more than half the electorate. The median is the unique fixed point of this process — the only position from which neither candidate can gain by moving.

## Extensions and Limitations

Hotelling's model is deliberately simple, and much subsequent work has explored what happens when its assumptions are relaxed.

### Three or More Candidates

The clean convergence result breaks down once a third candidate enters the race. With three candidates, the centre becomes a dangerous place: a candidate at the median is flanked on both sides, and either of the other two candidates can leapfrog to just inside the median's vote share. No pure-strategy Nash equilibrium typically exists in the three-candidate version of the game, which helps explain why multi-party systems exhibit more ideological differentiation than two-party systems.

### Abstention and Turnout

The baseline model assumes all voters always vote. If voters can abstain — say, because no candidate is close enough to their ideal point — the incentives change. A candidate far from the median might prefer to energize her ideological base rather than chase centrist voters, because those base voters might otherwise stay home. Introducing elastic turnout can sustain equilibria away from the median.

### Probabilistic Voting

Another important extension replaces the deterministic vote rule with <strong>probabilistic voting</strong>: each voter's probability of voting for a candidate is a smooth function of the distance between her ideal point and the candidate's position, rather than a step function that jumps at the midpoint. With probabilistic voting, best response functions become smoother and the convergence result can be recovered under broader distributional assumptions, but the exact equilibrium location depends on the shape of the voter density.

### Ideological Candidates

The starkest departure from reality in Hotelling's model is its assumption that candidates are purely office-motivated — they care only about winning, not about what policy gets implemented. A richer model would give each candidate an intrinsic preference over policy and allow them to trade off ideological purity against electoral success. Such models typically predict incomplete convergence: candidates differentiate their platforms enough to satisfy their partisan bases while still moving toward the centre to pick up swing voters. This is more consistent with observed patterns in most liberal democracies.

## Competition in Product Characteristics

The Hotelling spatial model is not confined to politics. Its earliest and most natural application is to **firms choosing product characteristics**. Imagine a street one mile long, with consumers uniformly distributed along it. Each consumer wants to buy exactly one unit of a product, and her ideal product corresponds to her location on the street. Two firms simultaneously choose where on the interval \([0, 1]\) to locate. Each consumer buys from whichever firm is closer (splitting evenly if equidistant), and each firm wants to maximize its market share.

The strategic logic is identical to the political competition model. If Firm 1 locates at \(x_1\) and Firm 2 at \(x_2 > x_1\), then all consumers to the left of the midpoint \((x_1 + x_2)/2\) buy from Firm 1 and all those to the right buy from Firm 2. Each firm can increase its share by moving toward the other, capturing additional consumers on the far side while losing none — because any consumer between the two firms who was already closest to you remains closest after you move inward. By exactly the same median-voter reasoning as in the political model, the unique Nash Equilibrium has both firms locating at the centre: \(x_1^* = x_2^* = 1/2\). This is the principle of **minimum differentiation** — competitive pressure drives firms to offer virtually identical products.

The prediction is strikingly visible in everyday life. Fast-food restaurants cluster at highway exits. Gas stations sit on opposite corners of the same intersection. Major television networks schedule near-identical programming in the same time slots. Cereal manufacturers crowd the sweet-and-crunchy segment of product space, leaving unusual flavour profiles underrepresented. In each case, firms could serve consumers better by differentiating, but the competitive incentive to steal market share by moving toward the rival dominates.

An important caveat arises when firms compete on **price** as well as location. D'Aspremont, Gabszewicz, and Thisse (1979) showed that if firms first choose locations and then compete in prices, the minimum-differentiation result can reverse: firms **maximally differentiate**, locating at opposite ends of the line. The intuition is that proximity triggers fierce price competition that erodes profits, so firms spread apart to soften the price war. The contrast between the pure-location model (minimum differentiation) and the location-then-price model (maximum differentiation) illustrates a fundamental theme in industrial organization: the relationship between product positioning and the intensity of competition depends critically on which dimensions of strategy are in play (see Osborne, Problem 76.1).

## Real-World Applications and Limitations

Despite its simplicity, Hotelling's model has been remarkably influential in shaping how political scientists and economists think about party competition. It predicts that competitive pressure should push parties toward the centre — a tendency observable in many two-party systems, where both major parties often appear to adopt surprisingly similar positions on many issues.

At the same time, the Canadian electoral map described at the outset of this chapter illustrates a genuine limitation: in practice, parties do not always converge to the centre. Factors outside the model — primary election incentives that reward ideological purity, activist donors who demand differentiation, and strong in-group identity among party members — all push against centrist convergence. The model is best understood not as a literal description of political behaviour but as a baseline that clarifies what pure vote-maximizing logic predicts, against which deviations can be measured and explained.

---

# Chapter 8: Auctions

## Why Study Auctions?

Auctions are one of humanity's oldest economic institutions — records of their use stretch back at least 2,500 years. In ancient Babylonia women were auctioned off for marriage. In ancient Athens the rights to collect taxes were put up for auction, though in practice collusion among bidders drove prices artificially low and the government failed to recover full value. More recently, the great auction houses Sotheby's and Christie's, both founded in the mid-eighteenth century, became synonymous with the sale of fine art and rare objects. Today eBay, Amazon, and services like Quibids have moved auctions online and made them part of daily commerce.

The fundamental reason auctions persist is that they are a good mechanism for allocating goods when no prevailing market price exists — when a good is unique, when the market is thin, or when the seller simply does not know how much buyers value the object. A well-designed auction can recover a price close to the true value of the good, and game theory lets us analyze precisely how different designs perform.

The sale that opens this chapter's motivating example is the 2017 Christie's auction of the <em>Salvator Mundi</em>, a painting attributed to Leonardo da Vinci. It sold for a world-record price of $450 million, inclusive of fees. That outcome — one object, many bidders, competing private estimates of value — is exactly the setting game theory is built to analyze.

## Types of Auctions

Auctions differ along two key dimensions. The first is whether bids are <strong>open</strong> or <strong>sealed</strong>. In an open auction every participant can observe the bids being made; in a sealed-bid auction each participant submits a bid privately, without seeing anyone else's offer. The second distinguishing feature is <strong>which price the winner pays</strong>: their own highest bid, or some other price such as the second-highest bid.

The <strong>English auction</strong> is the classic open ascending-price format. The auctioneer begins at a low price and bidders call out increasingly higher offers. A bidder who wishes to remain in must top the previous standing bid. The auction closes when no one is willing to go higher, and the last bidder wins at the price they named. The Christie's sale of the <em>Salvator Mundi</em> was conducted this way.

The <strong>Dutch auction</strong> is an open descending-price format. A clock or display begins at a very high price and drops continuously. The first bidder to press a button or call out wins the object immediately at the price shown when they acted. Because the auction ends the moment anyone bids, this format is fast — it is commonly used for perishable goods such as cut flowers in the Netherlands, which gives it its name.

The <strong>first-price sealed-bid auction</strong> requires every bidder to submit a single bid privately and simultaneously. The highest bid wins, and the winner pays exactly the amount they bid. This is the format used in many government procurement contracts and in auctions for offshore oil leases.

The <strong>second-price sealed-bid auction</strong>, also called a <strong>Vickrey auction</strong> after economist William Vickrey, follows the same sealed submission procedure, but the winner pays only the amount of the second-highest bid rather than their own. This seemingly odd rule turns out to have remarkable strategic properties that we will derive below.

Beyond these four main types, there are <strong>all-pay auctions</strong> (in which every bidder pays their bid regardless of whether they win, a model relevant for lobbying or R&D races), <strong>bidding fee auctions</strong> (in which each submitted bid costs a small fee, making the revenue calculation highly non-transparent to participants), and many other variants.

Different auction formats have different implications for both sides of the transaction. For <strong>bidders</strong>, the optimal strategy — when to jump in, how much to bid, whether to shade one's true valuation — depends critically on the rules. For <strong>sellers</strong>, different formats yield different expected revenues and different amounts of information about bidder valuations. A seller who knows they will need to auction a similar good again in the future may value the information extracted from the current auction nearly as much as the revenue itself.

## Theoretical Framework

Throughout our formal analysis we adopt two working assumptions. First, every bidder knows their own <strong>valuation</strong> of the object — the maximum they would willingly pay to obtain it. Second, under the <strong>private-value</strong> model, every bidder also knows every other bidder's valuation exactly, giving the game perfect information. (The assumption of perfect information is relaxed in section 9.6 of the textbook, which introduces private and common value uncertainty.)

We denote the number of bidders by \( n \) where \( n \geq 2 \), and we write \( v_i \) for the value player \( i \) attaches to the object. We label players so that valuations are strictly ordered:

\[
v_1 > v_2 > v_3 > \cdots > v_n > 0
\]

That is, player 1 is whoever values the object most, player 2 values it second most, and so on. If player \( i \) wins the object at price \( p \), their payoff is \( v_i - p \); if they lose, their payoff is zero. In the event of a tied highest bid, we break the tie in favor of the player with the smallest index — equivalently, the tied bidder who values the object most.

## The Second-Price Sealed-Bid Auction

### Formalizing the Game

The second-price sealed-bid auction is a strategic game in which the <strong>players</strong> are the \( n \) bidders; the <strong>actions</strong> for each player are the set of non-negative real numbers (any bid is admissible); and <strong>preferences</strong> are determined as follows. Write \( b_i \) for player \( i \)'s bid and \( \bar{b} \) for the highest bid submitted by any player other than \( i \). Player \( i \) wins if either \( b_i > \bar{b} \), or \( b_i = \bar{b} \) and player \( i \) has the smallest index among all tied bidders. The winner's payoff is \( v_i - \bar{b} \); every other player receives zero.

### Nash Equilibria of the Second-Price Auction

This game has many Nash Equilibria. A natural candidate is the profile where every player bids their own valuation: \( (b_1, \ldots, b_n) = (v_1, \ldots, v_n) \). The outcome is that player 1 wins the object and pays \( v_2 \), earning a payoff of \( v_1 - v_2 > 0 \). Every other player earns zero.

Is this a Nash Equilibrium? We verify that no player can gain by deviating. Player 1 is currently winning with a positive payoff. If player 1 changes their bid to any amount at or above \( v_2 \), the outcome is unchanged — they still win and still pay \( v_2 \). If player 1 lowers their bid below \( v_2 \), they lose and receive zero, which is strictly worse. So player 1 has no profitable deviation. For any other player \( j \neq 1 \): lowering or maintaining their bid at most \( v_1 \) leaves the outcome unchanged (player 1 still wins). If player \( j \) raises their bid above \( v_1 \), they win, but the second-highest bid is then \( v_1 \), and since \( v_j < v_1 \) for \( j \neq 1 \), their payoff would be \( v_j - v_1 < 0 \). No profitable deviation exists, confirming this is a Nash Equilibrium.

Another Nash Equilibrium is \( (b_1, \ldots, b_n) = (v_1, 0, \ldots, 0) \). Here player 1 bids their valuation and everyone else bids zero. Player 1 still wins, but the second-highest bid is zero, so player 1 pays nothing and earns \( v_1 \). No player can profitably deviate: player 1's outcome is unchanged by any bid they submit (they always win against bids of zero, by the tie-breaking rule), and any other player who raises their bid above \( v_1 \) wins but earns a negative payoff \( v_j - v_1 < 0 \).

There is even a Nash Equilibrium where player 1 does <strong>not</strong> win. Consider \( (b_1, \ldots, b_n) = (v_2, v_1, v_3, \ldots, v_n) \): player 2 bids \( v_1 \) and player 1 bids only \( v_2 \). Player 2 wins but pays the second-highest bid, which is player 1's bid \( v_2 = b_1 \), so player 2's payoff is \( v_2 - v_2 = 0 \). Player 1 can raise their bid to \( v_1 \) or higher and win — but then the second price becomes \( v_1 \) and player 1 earns \( v_1 - v_1 = 0 \), no better. Any other player who overbids above \( v_1 \) wins but earns a negative payoff. So this too is a Nash Equilibrium.

### Bidding Your Valuation Is a Dominant Strategy

These examples reveal that the game has infinitely many Nash Equilibria, and some of them yield strange outcomes — player 1 losing, or everyone else bidding zero. The Nash Equilibrium concept alone does not select among them. What singles out the truthful equilibrium \( (v_1, \ldots, v_n) \) is something stronger: <strong>weak dominance</strong>.

<strong>Proposition.</strong> In a second-price sealed-bid auction with perfect information, a player's bid equal to their valuation weakly dominates all other bids. That is, for any player \( i \) and any alternative bid \( b_i \neq v_i \), bidding \( v_i \) yields at least as high a payoff as \( b_i \) for every possible combination of other players' bids, and yields a strictly higher payoff for some combinations.

The intuition is clean. In a second-price auction, changing your bid affects whether you win or lose, but it does not change the price you pay if you win — that price is determined by someone else's bid. You want to win precisely when the highest of all other bids, \( \bar{b} \), is below your valuation \( v_i \) (winning is profitable), and you want to lose when \( \bar{b} > v_i \) (winning would cost more than the object is worth to you). Bidding exactly \( v_i \) achieves this perfectly: you win whenever \( \bar{b} < v_i \) and lose whenever \( \bar{b} > v_i \).

A bid \( b_i < v_i \) (underbidding) has no upside — it cannot reduce the price you pay when you win — but it has a specific downside: if \( b_i < \bar{b} < v_i \), you lose an auction you should have won at a price below your valuation. A bid \( b_i > v_i \) (overbidding) also has no upside over truthful bidding — if \( \bar{b} < v_i \), you win either way and pay the same price — but it has a specific downside: if \( v_i < \bar{b} < b_i \), you win at a price above your valuation and earn a negative payoff. In both cases, any departure from truthful bidding is weakly dominated.

Because the dominant strategy for every player is to bid their valuation, the truthful Nash Equilibrium \( (v_1, \ldots, v_n) \) is the only equilibrium in which no player uses a weakly dominated action. From the seller's perspective, this property is enormously useful: the bids submitted reveal every player's true valuation, providing perfect information about the demand side of the market. From the bidder's perspective, the strategy is trivially simple — just bid what the object is worth to you, and you are done.

<div class="embed-container"><iframe src="https://www.youtube.com/embed/b70MWFITsd4?rel=0" frameborder="0" allowfullscreen></iframe></div>
<em>An English auction for the Salvator Mundi at Christie's — the ascending-price format whose strategic logic parallels the second-price sealed-bid auction.</em>

## The First-Price Sealed-Bid Auction

### Why Truthful Bidding Fails

In a <strong>first-price sealed-bid auction</strong> the winner pays their own bid, not someone else's. This single change destroys the dominant-strategy property of truthful bidding. If you bid your true valuation \( v_i \) and win, your payoff is \( v_i - v_i = 0 \) — you capture no surplus whatsoever. Every bidder therefore has an incentive to <strong>shade their bid</strong> downward: submit a bid strictly below their valuation in order to earn a positive payoff when they win. The question is how far to shade.

### Nash Equilibrium with Symmetric Bidders

To derive the Nash Equilibrium bid in the first-price auction we introduce a richer model. Suppose there are \( n \) bidders whose valuations are drawn independently and uniformly from the interval \[ 0, 1 \]. Each bidder knows their own valuation but not others'. We look for a <strong>symmetric Nash Equilibrium</strong> in which every bidder uses the same increasing bidding function \( b(v) \).

If all other bidders use the strategy \( b(v) \), bidder \( i \) with valuation \( v_i \) who submits bid \( x \) wins if and only if \( x \) exceeds every other bidder's bid. Because the bidding function is increasing, this is equivalent to \( v_i \) being the highest valuation, which happens with probability \( x^{n-1} \) when \( x = b(v_i) \). The expected payoff to bidder \( i \) from submitting bid \( x \) is:

\[
\pi(x, v_i) = (v_i - x) \cdot x^{n-1}
\]

Maximizing over \( x \) and imposing the equilibrium condition \( x = b(v_i) \) yields the first-order condition:

\[
\frac{d\pi}{dx} = x^{n-1} - (v_i - x)(n-1)x^{n-2} = 0
\]

Dividing through by \( x^{n-2} \) and rearranging:

\[
x - (v_i - x)(n-1) = 0 \implies x \cdot n = v_i (n-1) \implies x = \frac{n-1}{n} v_i
\]

The symmetric Nash Equilibrium bidding strategy is therefore:

\[
b_i = \frac{n-1}{n} \, v_i
\]

Every bidder shades their bid to a fraction \( (n-1)/n \) of their true valuation. As the number of bidders \( n \) grows, this fraction approaches 1 and bids converge toward true valuations — competition disciplines bid shading. With only two bidders (\( n = 2 \), each bids exactly half their valuation. With ten bidders, each bids 90% of their valuation.

## Revenue Equivalence

A striking result connects the first-price and second-price formats. Under the standard assumptions — bidders draw valuations independently from the same distribution, are risk-neutral, and the object is awarded to the highest bidder — the <strong>Revenue Equivalence Theorem</strong> states that both auction formats yield the <strong>same expected revenue</strong> for the seller and the <strong>same expected payoff</strong> for every bidder type.

The result seems paradoxical at first. In a second-price auction, the winner pays the second-highest bid, which is generally less than their own bid. In a first-price auction, the winner pays their own (shaded) bid. Yet the equilibrium shading in the first-price format is precisely large enough to equalize expected revenues. Intuitively, the bidder who wins in the first-price auction expects to pay the same amount that the second-highest bidder would have bid in the second-price auction — because equilibrium shading tracks the expected value of the second-highest draw.

Revenue equivalence is a theoretical benchmark, not an empirical claim about all settings. It breaks down when bidders are risk-averse (risk-averse bidders shade less aggressively in first-price auctions, raising revenue), when valuations are correlated across bidders, or when there are asymmetries in the distribution of valuations. Nevertheless, the theorem identifies the precise conditions under which auction format is irrelevant for revenue, making deviations from those conditions empirically informative.

## Common-Value Auctions and the Winner's Curse

The private-value model assumes each bidder's valuation is independent of others'. This is appropriate for goods whose value is purely personal — a painting whose appeal depends entirely on the buyer's taste. But many goods have a <strong>common value</strong>: an underlying objective worth that is the same for all bidders, even though each bidder observes only a private, noisy signal of that value. Oil lease auctions are the canonical example: the oil in the ground is worth a fixed amount, but each oil company's geologists produce an independent estimate.

In a common-value auction with \( n \) bidders, each bidder \( i \) observes a signal \( s_i = V + \varepsilon_i \), where \( V \) is the true common value and the errors \( \varepsilon_i \) are independent with mean zero. If each bidder bids their observed signal, the winner is the bidder with the highest signal. But the highest signal is almost certainly an overestimate of the true value — the winner has drawn the most favorable error. This is the <strong>winner's curse</strong>: winning the auction is bad news, because it reveals that you were more optimistic than everyone else.

Rational bidders anticipate the winner's curse and adjust. They recognize that winning is informative: conditional on winning, the true value is almost surely below their signal. The correct response is to <strong>shade the bid below the private signal</strong>, with the discount proportional to the expected upward bias of the highest signal among \( n \) draws. With more bidders, the highest signal is more likely to be an extreme overestimate, so the rational discount grows larger.

The winner's curse has been documented in many real-world markets. Companies that win corporate takeover auctions frequently overpay — acquirers systematically earn negative abnormal returns around the announcement date, a pattern sometimes called the "acquisition premium puzzle." Bidders for offshore oil tracts in early US government auctions similarly earned subnormal returns. Recognizing the winner's curse and computing the appropriate bid shade is one of the most practically important applications of auction theory.

## War of Attrition

A <strong>war of attrition</strong> is a dynamic game in which two or more players compete by choosing how long to wait before conceding. The player who concedes first loses; the player who holds out wins the prize, but at the cost of the time spent waiting. Unlike sealed-bid auctions, the war of attrition unfolds over time, and each player's decision to concede depends on their beliefs about the other player's type.

The war of attrition appears in biology (competing animals waiting each other out for a resource), industrial organization (firms burning money in a declining market, each hoping the rival exits first), and patent races (firms investing in R&D hoping the competitor stops first). It also models political standoffs — budget negotiations, trade disputes, and military standoffs all have war-of-attrition structures.

In the symmetric Nash Equilibrium of the two-player war of attrition, each player randomizes their concession time according to an exponential distribution. The key result is that the expected total waiting cost equals the value of the prize — all the surplus is dissipated in waiting. This is directly analogous to the all-pay auction, in which every bidder pays their bid regardless of outcome and equilibrium total payments equal the prize value. Both games illustrate the principle that competition for a fixed prize can consume the entire value of that prize through the costs of competing.

## The Third-Price Auction

The second-price (Vickrey) auction has a beautifully clean dominant-strategy property: every bidder optimally bids her true valuation, regardless of what others do. One might wonder whether this elegant property extends to other auction formats in which the winner pays less than her own bid. The **third-price auction** — in which the highest bidder wins but pays the third-highest bid — shows that it does not.

Suppose there are \(n \geq 3\) bidders with valuations \(v_1 > v_2 > \cdots > v_n > 0\). Each bidder submits a sealed bid; the highest bidder wins the object and pays the third-highest bid. First, observe that bidding one's true valuation is **not** a dominant strategy. Consider bidder 2 with valuation \(v_2\). If bidder 1 bids \(v_1\) and bidder 3 bids \(v_3\), then by bidding \(v_2\), bidder 2 loses (since \(v_2 < v_1\)) and gets payoff 0. But if bidder 2 bids above \(v_1\), she wins and pays \(v_3\), earning a positive surplus \(v_2 - v_3 > 0\). So overbidding is profitable — truth-telling is not dominant.

We can construct a Nash Equilibrium as follows. Let bidder 1 bid \(v_1\), let bidder 2 bid any amount \(b_2 \geq v_1\) (for instance, \(b_2 = v_1\)), and let every other bidder \(i \geq 3\) bid \(v_i\). In this profile, bidder 2 wins (or ties with bidder 1) and pays the third-highest bid, which is \(v_3\). Bidder 2's payoff is \(v_2 - v_3 > 0\). No bidder can profitably deviate: bidder 1 could win by outbidding bidder 2, but would still pay \(v_3\), earning \(v_1 - v_3\) — yet this requires bidding higher than \(b_2\), and since bidder 2 may bid arbitrarily high, the equilibrium is sustained. Bidders \(i \geq 3\) cannot win without bidding above \(v_1\), and winning at a price of \(v_3\) (or higher) when your valuation is at most \(v_3\) yields non-positive surplus.

The lesson for **mechanism design** is sobering. The second-price auction's dominant-strategy incentive compatibility is a special and fragile property. Moving to a third-price format — which might seem like a minor tweak — destroys truthful bidding, introduces overbidding, and generates equilibria where the "wrong" bidder wins the object. Auction designers cannot casually assume that any "pay less than your bid" format will inherit the Vickrey auction's virtues (see Osborne, Problem 88.1).

---

# Chapter 9: Mixed Strategy Equilibrium

## Motivation: When Pure Strategies Fail

So far every strategy we have considered has been an <strong>action</strong> — a deterministic choice. Each player simply decides which action to take and commits to it. We are now moving to a richer world in which players can also choose a <strong>probability distribution</strong> over their actions. Instead of saying "I will play my first action," a player can say "I will play my first action with probability one-third and my second action with probability two-thirds." That probability distribution is what we will call a mixed strategy.

The motivation for this extension comes directly from games that have no Nash equilibrium in pure strategies at all. Consider <strong>Rock–Paper–Scissors</strong>. The matrix is:

<table>
  <tr>
    <th></th>
    <th>Rock</th>
    <th>Paper</th>
    <th>Scissors</th>
  </tr>
  <tr>
    <th>Rock</th>
    <td>0, 0</td>
    <td>-1, 1</td>
    <td>1, -1</td>
  </tr>
  <tr>
    <th>Paper</th>
    <td>1, -1</td>
    <td>0, 0</td>
    <td>-1, 1</td>
  </tr>
  <tr>
    <th>Scissors</th>
    <td>-1, 1</td>
    <td>1, -1</td>
    <td>0, 0</td>
  </tr>
</table>

Are any of the three actions ever unambiguously optimal? The answer is no. If your opponent always plays Rock, you should play Paper. If your opponent plays Paper, you should play Scissors. There is always a different best response to whatever the other person does. Why, then, would you not always play the same action? The answer is that if you always play Rock, the other player will eventually catch on and play Paper. Any predictable pure strategy can be exploited.

The key insight is this: when all of your actions yield exactly the same expected payoff, you do not care which one you use. Any mix of them is equally good. But the exact mix that pins down an equilibrium is the one that makes your opponent indifferent between each of their actions — so that they, too, are willing to randomize. You are not mixing because randomization is intrinsically better; you are mixing because that is what prevents the other player from having a dominant deviation. This reciprocal indifference is the heart of mixed strategy equilibrium.

### Matching Pennies as Canonical Example

<strong>Matching Pennies</strong> distills this logic to its simplest form. Two players simultaneously choose Heads or Tails. Player 1 wins if the coins match; Player 2 wins if they differ:

<table>
  <tr>
    <th></th>
    <th>Heads</th>
    <th>Tails</th>
  </tr>
  <tr>
    <th>Heads</th>
    <td>1, -1</td>
    <td>-1, 1</td>
  </tr>
  <tr>
    <th>Tails</th>
    <td>-1, 1</td>
    <td>1, -1</td>
  </tr>
</table>

You can think of this as a soccer penalty kick: the kicker picks a direction, the goalkeeper picks a direction to dive, and exactly one of them is right. Marking best responses with stars reveals that no cell receives two stars — there is no Nash equilibrium in pure strategies. Player 2 always wants to mismatch Player 1, and Player 1 always wants to match Player 2. Any deterministic strategy is predictable and therefore exploitable.

There is a <strong>stochastic steady state</strong> in which each player chooses each action with probability one-half. This can be interpreted in two ways. The first interpretation is that each player literally randomizes, flipping a mental coin each time. The second interpretation — consistent with our view of Nash equilibrium as a stable social convention — is that half the population always plays Heads and the other half always plays Tails, so that when you meet a random opponent you face a fifty-fifty distribution over their choices. Either way, the equilibrium requires each player to make the other genuinely indifferent.

## Lotteries and the Problem of Preferences

When players mix, the outcome of the game is no longer deterministic. There is a probability attached to each possible outcome. We call such a probability distribution over outcomes a <strong>lottery</strong>. To say anything coherent about which mixed strategies a player prefers, we need a theory of preferences over lotteries.

For games with only two possible outcomes, this is straightforward. If a player prefers outcome \( a \) to outcome \( b \), then they prefer any lottery that gives \( a \) higher probability. But for games with three or more outcomes, comparing lotteries is genuinely more complex. Suppose a player prefers outcome \( a \) to outcome \( b \) to outcome \( c \). Does she prefer to receive \( b \) with certainty, or a fifty-fifty lottery between \( a \) and \( c \)? Ordinal preferences — which say only that \( a \) is better than \( b \) is better than \( c \) — cannot answer this question.

To see why, consider two games. In both, the payoffs represent the ordinal ranking \( a \) best, \( b \) middle, \( c \) worst. On the left, suppose the Bernoulli numbers are 1000, 1, and 0. On the right, suppose they are 1000, 999, and 0. The ordinal ranking is identical in both games; any pure-strategy analysis would treat them as the same. But if you now ask whether you prefer \( b \) for sure or a fifty-fifty lottery over \( a \) and \( c \), most people would prefer the lottery in the left-hand game (because \( a \) is so much better than \( b \) that the risk of getting \( c \) is worth taking) but would prefer the certainty of \( b \) in the right-hand game (because \( b \) is nearly as good as \( a \). The numbers are carrying cardinal, not merely ordinal, information.

## Von Neumann–Morgenstern Preferences and Bernoulli Payoffs

To handle preferences over lotteries, we adopt the framework of <strong>von Neumann–Morgenstern (vNM) preferences</strong>. We say a player has vNM preferences if there exists a <strong>Bernoulli payoff function</strong> \( u_i \) over deterministic outcomes such that the player's preferences over lotteries are represented by the expected value of that function. Formally, given two lotteries \( P \) and \( Q \) that yield outcomes \( a_1, a_2, \ldots, a_k \) with probabilities \( p_1, \ldots, p_k \) and \( q_1, \ldots, q_k \) respectively, player \( i \) prefers \( P \) to \( Q \) if and only if:

\[
\sum_{j} p_j \, u_i(a_j) \;&gt;\; \sum_{j} q_j \, u_i(a_j)
\]

In other words, the player simply computes the expected Bernoulli payoff of each lottery and chooses the higher one. This is the natural thing to do — it just requires that the numbers inside the payoff boxes carry cardinal meaning, not merely ordinal ranking.

This is a substantive assumption, not a logical necessity. Not all conceivable preferences over lotteries satisfy it. But it is the standard assumption in game theory with mixed strategies, and from here forward we adopt it. The payoff tables we have used throughout this course can now be reinterpreted as tables of Bernoulli payoffs whose expected values represent the players' preferences over lotteries.

### Bernoulli Payoffs and Cardinal Information

The distinction between the two games in the lottery example above illustrates why Bernoulli payoffs carry more information than ordinal payoffs. Two games that are identical when payoffs are ordinal can represent genuinely different strategic situations under vNM preferences. On the left side of the example, Player 1's payoff to outcome \( (Q,Q) \) equals her expected payoff from a lottery yielding \( (F,Q) \) and \( (F,F) \) each with probability one-half — she is indifferent. On the right side, Player 1 strictly prefers \( (Q,Q) \) with certainty to that same lottery. These two games have different strategic implications even though they share the same ordinal rankings.

A <strong>strategic game with vNM preferences</strong> has the same formal structure as before — a set of players, for each player a set of actions, and for each player preferences over outcomes — except that the preferences are now vNM preferences representable by expected Bernoulli payoffs.

## Mixed Strategies: Definition and Notation

<strong>Definition.</strong> A <strong>mixed strategy</strong> of player \( i \) in a strategic game is a probability distribution over that player's set of actions.

We write \( \alpha_i \) for player \( i \)'s mixed strategy, and \( \alpha_i(a_i) \) for the probability that \( \alpha_i \) assigns to action \( a_i \). A <strong>profile</strong> of mixed strategies is denoted \( \alpha = (\alpha_1, \alpha_2, \ldots) \), where each \( \alpha_i \) is a probability distribution over \( A_i \). Formally:

\[
\alpha = \bigl((\alpha_1(a_1), \alpha_1(a_2), \ldots),\; (\alpha_2(a_1), \alpha_2(a_2), \ldots),\; \ldots\bigr)
\]

A mixed strategy that assigns probability 1 to a single action is called a <strong>pure strategy</strong>. The world we lived in before this chapter was the world of pure strategies — a special case of mixed strategies. By expanding to allow probability distributions over actions, we are strictly generalizing our earlier framework.

For convenience, when a player has only two actions, we write a mixed strategy as an ordered pair of probabilities: \( \alpha_1 = (p, 1-p) \) means Player 1 plays the first action with probability \( p \) and the second with probability \( 1 - p \). In Matching Pennies, for example, the strategy where Player 1 plays each action with equal probability is written \( \alpha_1 = ({\textstyle\frac{1}{2}}, {\textstyle\frac{1}{2}}) \).

### Expected Payoffs Under Mixed Strategies

Player \( i \)'s expected payoff to a mixed strategy profile \( \alpha \) is:

\[
U_i(\alpha) \;=\; \sum_{a_i \in A_i} \alpha_i(a_i) \cdot E_i(a_i,\, \alpha_{-i})
\]

where \( E_i(a_i, \alpha_{-i}) \) is player \( i \)'s expected payoff when she plays the pure strategy \( a_i \) and the other players use their mixed strategies \( \alpha_{-i} \). This is a weighted average of the expected payoffs to each of her actions, with weights given by the probabilities in \( \alpha_i \). The critical observation is that player \( i \) does not control \( E_i(a_i, \alpha_{-i}) \) — that depends on what others do. The only thing player \( i \) controls is the weight \( \alpha_i(a_i) \) she places on each action.

## Mixed Strategy Nash Equilibrium

<strong>Definition.</strong> A mixed strategy profile \( \alpha^* \) in a strategic game with vNM preferences is a <strong>mixed strategy Nash equilibrium (MSNE)</strong> if for each player \( i \):

\[
U_i(\alpha^<em>) \;\geq\; U_i(\alpha_i,\, \alpha^</em>_{-i}) \quad \text{for every mixed strategy } \alpha_i \text{ of player } i
\]

where \( U_i(\alpha) \) is player \( i \)'s expected payoff to the mixed strategy profile \( \alpha \).

This is fundamentally the same idea as Nash equilibrium: given the strategies everyone else is playing, no player can make a strictly profitable deviation — not to any other mixed strategy, not to any pure strategy. A mixed strategy profile is a MSNE if and only if every player's mixed strategy is a best response to the others' mixed strategies.

<strong>Best response functions</strong> extend naturally: \( B_i(\alpha_{-i}) \) is the set of player \( i \)'s best mixed strategies when the others play \( \alpha_{-i} \). A mixed strategy profile \( \alpha^<em> \) is a MSNE if and only if \( \alpha_i^</em> \in B_i(\alpha_{-i}^*) \) for every player \( i \).

### A Key Observation About Mixing

There is an important structural fact about best responses with mixed strategies: a mixed strategy \( \alpha_i = (p, 1-p) \) with \( 0 &lt; p &lt; 1 \) is <strong>never</strong> the unique best response to any strategy of the opponents. Either it is not a best response at all, or all mixed strategies are equally good.

Why? Suppose player \( i \) is mixing between two actions. Player \( i \)'s expected payoff is a weighted average of the expected payoffs to each of those actions. If one action yields a strictly higher expected payoff than the other, the player would be leaving value on the table by putting any probability on the inferior action — they should deviate to placing all weight on the better action. So mixing can only be optimal when both actions yield exactly the same expected payoff. But when both actions yield the same payoff, any mix is equally optimal; no particular mix is uniquely best. This means that a genuinely mixed strategy is always part of a continuum of equally good strategies, never uniquely optimal. This observation becomes the cornerstone of Proposition 116.2.

## Proposition 116.2: The Indifference Characterization

The practical tool for both computing and verifying MSNE is the following result.

<strong>Proposition 116.2.</strong> A mixed strategy profile \( \alpha^* \) in a strategic game with vNM preferences in which each player has finitely many actions is a mixed strategy Nash equilibrium if and only if for each player \( i \):

1. The expected payoff, given \( \alpha^<em>_{-i} \), to every action to which \( \alpha^</em>_i \) assigns strictly positive probability is the same.
2. The expected payoff, given \( \alpha^<em>_{-i} \), to every action to which \( \alpha^</em>_i \) assigns zero probability is at most the expected payoff to any action to which \( \alpha^*_i \) assigns strictly positive probability.

This proposition is one of the most important results in the course. The two conditions together say: <strong>every action in the support of</strong> \( \alpha^*_i \) <strong>must yield the same expected payoff, and every action outside the support must yield no higher expected payoff.</strong> In other words, the player must be indifferent among all the actions she is willing to play in equilibrium.

### Derivation

The logic behind Proposition 116.2 flows directly from the expected-payoff formula. Player \( i \)'s total expected payoff is a weighted average of the expected payoffs to each action in her support, with weights given by the mixing probabilities. To maximize this weighted average, player \( i \) should put all weight on the action with the highest expected payoff. The only time she is willing to spread weight across multiple actions is when they all give the same expected payoff — since then redistributing weight changes nothing. Condition 1 captures this. Condition 2 says that an action outside the support cannot give a strictly higher payoff, otherwise the player would profitably deviate by switching to that action.

A common student error is to check only Condition 1 while forgetting Condition 2. Both conditions must be verified.

### An Important Corollary

Each player's expected payoff in a MSNE equals her expected payoff to any single action she plays with positive probability. Since all actions in the support give the same expected payoff, the weighted average is simply that common value.

### Using Proposition 116.2 to Check a Candidate MSNE

Consider the mixed strategy profile \( \alpha = ((\,0.4,\, 0.6\,),\; (\,0.2,\, 0.8\,)) \) in a game where Player 1 has actions \( T \) and \( B \) and Player 2 has actions \( L \) and \( R \), with Bernoulli payoffs (for Player 1) of 1, 5, 2, 3 in the cells \( (T,L) \), \( (T,R) \), \( (B,L) \), \( (B,R) \) respectively. Player 1's expected payoff to \( T \) given Player 2's strategy is \( 0.2 \cdot 1 + 0.8 \cdot 5 = 4.2 \). Player 1's expected payoff to \( B \) is \( 0.2 \cdot 2 + 0.8 \cdot 3 = 2.8 \). Since \( 4.2 \neq 2.8 \), Condition 1 is violated: Player 1 is strictly better off playing \( T \), so she would never voluntarily put 0.6 weight on \( B \). This profile is not a MSNE.

## Finding MSNE Using Best Response Functions

### Example: Matching Pennies

Let \( p \) denote the probability Player 1's mixed strategy assigns to Heads, and \( q \) the probability Player 2's mixed strategy assigns to Heads. Given Player 2's strategy, Player 1's expected payoffs are:

\[
E_1(\text{H},\, q) \;=\; q \cdot 1 + (1-q) \cdot (-1) \;=\; 2q - 1
\]

\[
E_1(\text{T},\, q) \;=\; q \cdot (-1) + (1-q) \cdot 1 \;=\; 1 - 2q
\]

Player 1 strictly prefers Heads when \( 2q - 1 > 1 - 2q \), i.e., when \( q > {\textstyle\frac{1}{2}} \); strictly prefers Tails when \( q &lt; {\textstyle\frac{1}{2}} \); and is indifferent — willing to play any mix — when \( q = {\textstyle\frac{1}{2}} \). Therefore:

\[
B_1(q) \;=\; \begin{cases} (0, 1) &amp; \text{if } q &lt; {\textstyle\frac{1}{2}} \\[4pt] (p,\, 1-p) \text{ for all } 0 \leq p \leq 1 &amp; \text{if } q = {\textstyle\frac{1}{2}} \\[4pt] (1, 0) &amp; \text{if } q > {\textstyle\frac{1}{2}} \end{cases}
\]

By symmetry, Player 2's best response function satisfies \( B_2(p) \): play \( q = 0 \) (always Tails) when \( p > {\textstyle\frac{1}{2}} \), play \( q = 1 \) (always Heads) when \( p &lt; {\textstyle\frac{1}{2}} \), and mix freely when \( p = {\textstyle\frac{1}{2}} \).

When these two best response functions are plotted — with \( p \) on the horizontal axis and \( q \) on the vertical axis — they cross at exactly one point: \( p = {\textstyle\frac{1}{2}}, q = {\textstyle\frac{1}{2}} \). This is the unique MSNE:

\[
\alpha^* \;=\; \Bigl(\Bigl({\textstyle\frac{1}{2}},\, {\textstyle\frac{1}{2}}\Bigr),\; \Bigl({\textstyle\frac{1}{2}},\, {\textstyle\frac{1}{2}}\Bigr)\Bigr)
\]

### Example: Battle of the Sexes — Best Response Approach

Recall the <strong>Battle of the Sexes (BoS)</strong> game, in which a couple wants to go out together — one prefers Ballet, the other prefers Soccer — but each prefers going together to going alone:

<table>
  <tr>
    <th></th>
    <th>B (Player 2)</th>
    <th>S (Player 2)</th>
  </tr>
  <tr>
    <th>B (Player 1)</th>
    <td>2, 1</td>
    <td>0, 0</td>
  </tr>
  <tr>
    <th>S (Player 1)</th>
    <td>0, 0</td>
    <td>1, 2</td>
  </tr>
</table>

Let \( p \) be the probability Player 1 plays B and \( q \) be the probability Player 2 plays B. Player 1's expected payoffs are:

\[
E_1(B, q) = 2q + 0 \cdot (1-q) = 2q
\]

\[
E_1(S, q) = 0 \cdot q + 1 \cdot (1-q) = 1 - q
\]

Player 1 is indifferent when \( 2q = 1 - q \), giving \( q = {\textstyle\frac{1}{3}} \). So:

\[
B_1(q) \;=\; \begin{cases} (0, 1) &amp; \text{if } q &lt; {\textstyle\frac{1}{3}} \\[4pt] (p,\, 1-p) \text{ for all } 0 \leq p \leq 1 &amp; \text{if } q = {\textstyle\frac{1}{3}} \\[4pt] (1, 0) &amp; \text{if } q > {\textstyle\frac{1}{3}} \end{cases}
\]

For Player 2, \( E_2(B, p) = p \) and \( E_2(S, p) = 2(1-p) \). Player 2 is indifferent when \( p = 2(1-p) \), giving \( p = {\textstyle\frac{2}{3}} \). So:

\[
B_2(p) \;=\; \begin{cases} (0, 1) &amp; \text{if } p &lt; {\textstyle\frac{2}{3}} \\[4pt] (q,\, 1-q) \text{ for all } 0 \leq q \leq 1 &amp; \text{if } p = {\textstyle\frac{2}{3}} \\[4pt] (1, 0) &amp; \text{if } p > {\textstyle\frac{2}{3}} \end{cases}
\]

When plotted, the two best response functions cross at <strong>three</strong> points, giving three MSNE:

- \( ((1,0),\,(1,0)) \) — both play B (pure strategy NE)
- \( ((0,1),\,(0,1)) \) — both play S (pure strategy NE)
- \( \bigl(({\textstyle\frac{2}{3}},{\textstyle\frac{1}{3}}),\,({\textstyle\frac{1}{3}},{\textstyle\frac{2}{3}})\bigr) \) — the fully mixed equilibrium

The two corner points are the familiar pure-strategy Nash equilibria we found before. The new one in the interior is the fully mixed equilibrium. Notice that this is no coincidence: we will shortly see that any Nash equilibrium found without mixing carries over as a MSNE once mixing is allowed.

## Solving for the Fully Mixed MSNE: Proposition 116.2 in Practice

Using Proposition 116.2 is generally more convenient than graphing best response functions, especially when players have more than two actions. The technique is direct: to find a fully mixed MSNE, write down the condition that each player must be indifferent between every action in her support, then solve for the mixing probabilities of the other player.

### Battle of the Sexes: Fully Mixed MSNE Derivation

We look for a MSNE in which both players mix strictly between B and S, so that \( 0 &lt; p &lt; 1 \) and \( 0 &lt; q &lt; 1 \).

<strong>Step 1.</strong> By Condition 1 of Proposition 116.2, Player 1 must be indifferent between B and S. Her expected payoffs are:

\[
E_1(B, q) = 2q \quad \text{and} \quad E_1(S, q) = 1 - q
\]

Setting these equal:

\[
2q = 1 - q \;\implies\; 3q = 1 \;\implies\; q = {\textstyle\frac{1}{3}}
\]

So Player 2 must play B with probability \( \frac{1}{3} \) — that is the mix that makes Player 1 indifferent.

<strong>Step 2.</strong> Player 2 must be indifferent between B and S. Her expected payoffs are:

\[
E_2(B, p) = p \quad \text{and} \quad E_2(S, p) = 2(1-p)
\]

Setting these equal:

\[
p = 2 - 2p \;\implies\; 3p = 2 \;\implies\; p = {\textstyle\frac{2}{3}}
\]

So Player 1 must play B with probability \( \frac{2}{3} \).

<strong>Result.</strong> The unique fully mixed MSNE is:

\[
\alpha^* \;=\; \Bigl(\Bigl({\textstyle\frac{2}{3}},\, {\textstyle\frac{1}{3}}\Bigr),\; \Bigl({\textstyle\frac{1}{3}},\, {\textstyle\frac{2}{3}}\Bigr)\Bigr)
\]

Combined with the two pure-strategy MSNE, there are exactly three MSNE in BoS.

### The Logic of Mutual Indifference

There is a subtle but crucial point here that is worth emphasizing. In the fully mixed MSNE, each player is completely indifferent between continuing to play the equilibrium mix and switching to any other mix of the two actions — because both actions give exactly the same expected payoff. So what pins down the exact mixing probabilities? It is not that the equilibrium mix is uniquely optimal for the player using it. Rather, the equilibrium mix is uniquely determined by the condition that it must make the <strong>other</strong> player indifferent. Player 1 plays \( p = \frac{2}{3} \) not because that is optimal for Player 1, but because that is the value of \( p \) at which Player 2 is indifferent between B and S and is therefore willing to randomize at all. This reciprocal structure is the defining feature of mixed strategy equilibrium.

### Verifying a MSNE: A Three-Action Example

Proposition 116.2 also works for verifying proposed MSNE in richer games. Consider whether \( \alpha^* = (({\textstyle\frac{3}{4}}, 0, {\textstyle\frac{1}{4}}),\; (0, {\textstyle\frac{1}{3}}, {\textstyle\frac{2}{3}})) \) is a MSNE of:

<table>
  <tr>
    <th></th>
    <th>L</th>
    <th>C</th>
    <th>R</th>
  </tr>
  <tr>
    <th>T</th>
    <td>&#183;, 2</td>
    <td>3, &#183;</td>
    <td>1, &#183;</td>
  </tr>
  <tr>
    <th>M</th>
    <td>0, &#183;</td>
    <td>&#183;, &#183;</td>
    <td>2, 4</td>
  </tr>
  <tr>
    <th>B</th>
    <td>5, 1</td>
    <td>&#183;, &#183;</td>
    <td>0, 7</td>
  </tr>
</table>

Player 2 never plays L (\( \alpha_2(L) = 0 \), so Player 1's payoff in any column-L cell is irrelevant. Player 1's expected payoffs to each action, given Player 2's mix \( (0, \frac{1}{3}, \frac{2}{3}) \):

- \( E_1(T) = {\textstyle\frac{1}{3}} \cdot 3 + {\textstyle\frac{2}{3}} \cdot 1 = {\textstyle\frac{5}{3}} \)
- \( E_1(M) = {\textstyle\frac{1}{3}} \cdot 0 + {\textstyle\frac{2}{3}} \cdot 2 = {\textstyle\frac{4}{3}} \)
- \( E_1(B) = {\textstyle\frac{1}{3}} \cdot 5 + {\textstyle\frac{2}{3}} \cdot 0 = {\textstyle\frac{5}{3}} \)

<strong>Condition 1 for Player 1:</strong> Player 1 assigns positive probability to T and B (both \( > 0 \). Both give expected payoff \( \frac{5}{3} \). ✓

<strong>Condition 2 for Player 1:</strong> Player 1 assigns zero probability to M. \( E_1(M) = \frac{4}{3} \leq \frac{5}{3} \). ✓

Computing Player 2's expected payoffs to L, C, R given Player 1's mix \( (\frac{3}{4}, 0, \frac{1}{4}) \) yields \( E_2(L) = E_2(C) = E_2(R) = \frac{5}{2} \) (all equal). Both conditions are satisfied for Player 2 as well. Therefore \( \alpha^* \) is a MSNE.

Note that Player 2 is indifferent between all three actions including L, yet assigns zero probability to L. The second condition permits this — zero probability on an action is consistent with MSNE as long as that action is not strictly better than actions in the support.

## A Continuum of MSNE

Matching Pennies and BoS both have finitely many MSNE. It is also possible to construct games with a continuum of MSNE — infinitely many. This occurs when segments of the best response functions coincide rather than merely crossing at isolated points. Consider a modified BoS where Player 2's payoff in the (B, B) cell is changed from 1 to 0:

<table>
  <tr>
    <th></th>
    <th>B</th>
    <th>S</th>
  </tr>
  <tr>
    <th>B</th>
    <td>2, 0</td>
    <td>0, 0</td>
  </tr>
  <tr>
    <th>S</th>
    <td>0, 0</td>
    <td>1, 2</td>
  </tr>
</table>

Player 1's best response function is unchanged. But now Player 2 is weakly better off playing S for any \( p &lt; 1 \), since (B, S) and (S, S) both give zero while (S, S) gives 2. Only when \( p = 1 \) is Player 2 indifferent, receiving zero regardless. This creates an overlap: Player 1's best response includes a horizontal segment, and Player 2's best response includes a vertical segment, and they share a line. The result is a continuum of MSNE along that boundary.

## Existence of MSNE in Finite Games

<strong>Proposition 119.1.</strong> Every strategic game with vNM preferences in which each player has finitely many actions has at least one mixed strategy Nash equilibrium.

This is one of the foundational existence results in game theory, due to Nash (1950). The proof uses Kakutani's fixed-point theorem applied to the best response correspondence and is beyond the scope of this course (see Osborne and Rubinstein, 1994, pp. 19–20 for a proof). The practical implication is important: the concept of MSNE is universally applicable to any finite game. No finite game is "without equilibrium" once mixed strategies are permitted.

A useful corollary concerns the number of MSNE: in generic finite games (where small perturbations to payoffs do not change the qualitative structure), the number of MSNE is odd. BoS has three. Matching Pennies has one. Rock–Paper–Scissors has one. The modified BoS above is non-generic and has a continuum.

## Pure Strategy NE Are Also MSNE

The two pure-strategy Nash equilibria of BoS — (B, B) and (S, S) — also appeared as MSNE. This is no coincidence. There is a general correspondence between Nash equilibria in the pure-strategy world and MSNE in the mixed-strategy world.

<strong>Proposition 122.2 (Allowing Randomization).</strong> Let \( a^<em> \) be a Nash equilibrium of a strategic game \( G \) with ordinal preferences. For each player \( i \), let \( \alpha^</em>_i \) be the pure strategy that assigns probability 1 to \( a^<em>_i \). Then \( \alpha^</em> \) is a MSNE of the corresponding game \( G' \) with vNM preferences.

The argument is immediate from Proposition 116.2. Since \( a^<em> \) is a Nash equilibrium of \( G \), no player has a pure strategy that beats \( a^</em>_i \) when others play \( a^*_{-i} \). Condition 1 of Proposition 116.2 is satisfied trivially (each player puts positive probability on only one action). Condition 2 is satisfied because no pure strategy yields a strictly higher payoff — and since pure strategies include all the actions, this means no action outside the trivial support does better.

<strong>Proposition 123.1 (Prohibiting Randomization).</strong> Let \( \alpha^<em> \) be a MSNE of \( G' \) in which each player's mixed strategy assigns probability 1 to a single action \( a^</em>_i \). Then \( a^* \) is a Nash equilibrium of \( G \).

Since \( \alpha^<em> \) is a MSNE of \( G' \), no mixed strategy of player \( i \) gives a higher expected payoff than \( \alpha^</em>_i \). Pure strategies are a subset of mixed strategies, so in particular no pure strategy beats \( a^<em>_i \). Hence \( a^</em> \) is a Nash equilibrium of \( G \).

Together, these propositions say that pure-strategy NE and MSNE in pure strategies are the same thing. When searching for all MSNE of a game, you can find the pure-strategy equilibria first (using the star method), then turn to the fully mixed ones using Proposition 116.2.

## Strict Domination by Mixed Strategies

In earlier chapters we found that strictly dominated actions are never played in Nash equilibrium, which allowed us to simplify games through iterated elimination. The same principle applies — in an extended form — to MSNE.

<strong>Definition 120.1.</strong> In a strategic game with vNM preferences, player \( i \)'s mixed strategy \( \alpha_i \) <strong>strictly dominates</strong> her action \( a'_i \) if:

\[
U_i(\alpha_i,\, a_{-i}) \;&gt;\; u_i(a'_i,\, a_{-i}) \quad \text{for every action list } a_{-i}
\]

We say that action \( a'_i \) is <strong>strictly dominated</strong> (by a mixed strategy).

The key extension over earlier chapters is that an action may be strictly dominated by a mixed strategy even if no pure strategy dominates it. Consider the game:

<table>
  <tr>
    <th></th>
    <th>L</th>
    <th>R</th>
  </tr>
  <tr>
    <th>T</th>
    <td>1, &#183;</td>
    <td>1, &#183;</td>
  </tr>
  <tr>
    <th>M</th>
    <td>4, &#183;</td>
    <td>0, &#183;</td>
  </tr>
  <tr>
    <th>B</th>
    <td>0, &#183;</td>
    <td>3, &#183;</td>
  </tr>
</table>

None of M or B strictly dominates T as a pure strategy. But the mixed strategy that plays M and B each with probability \( \frac{1}{2} \) gives expected payoffs of \( \frac{1}{2} \cdot 4 + \frac{1}{2} \cdot 0 = 2 \) against L and \( \frac{1}{2} \cdot 0 + \frac{1}{2} \cdot 3 = 1.5 \) against R — both strictly above T's payoffs of 1 and 1. So T is strictly dominated by the mixed strategy \( (0, \frac{1}{2}, \frac{1}{2}) \), even though no pure strategy dominates T.

### Why Dominated Actions Are Not Played in MSNE

<strong>Claim.</strong> If action \( a'_i \) is strictly dominated by a mixed strategy \( \alpha_i \), then \( a'_i \) is not played with positive probability in any MSNE.

<strong>Argument.</strong> Suppose the other players use mixed strategies \( \alpha_{-i} \). Player \( i \)'s expected payoff to using \( \alpha_i \) is a weighted average of \( U_i(\alpha_i, a_{-i}) \) as \( a_{-i} \) varies over all action profiles of the others, where the weights are given by the probability each \( a_{-i} \) occurs under \( \alpha_{-i} \). Similarly, player \( i \)'s expected payoff to using \( a'_i \) is a weighted average of \( u_i(a'_i, a_{-i}) \) with exactly the same weights. Since strict domination gives \( U_i(\alpha_i, a_{-i}) > u_i(a'_i, a_{-i}) \) for every \( a_{-i} \), and the weights are identical, the entire expected payoff to \( \alpha_i \) exceeds that to \( a'_i \) for any \( \alpha_{-i} \). Therefore \( a'_i \) is never a best response and is never used with positive probability in any MSNE.

<strong>Corollary.</strong> A strictly dominated action can be eliminated before searching for MSNE, and this elimination can be applied <strong>iteratively</strong>: after removing one dominated action, a new action may become dominated in the reduced game, and can itself be removed. Any MSNE of the original game corresponds to a MSNE of the reduced game after iterated elimination of strictly dominated strategies — by pure or mixed strategies alike. This can dramatically simplify the computation.

## Weak Domination by Mixed Strategies

<strong>Definition.</strong> Player \( i \)'s mixed strategy \( \alpha_i \) <strong>weakly dominates</strong> her action \( a'_i \) if:

\[
U_i(\alpha_i,\, a_{-i}) \;\geq\; u_i(a'_i,\, a_{-i}) \quad \text{for every } a_{-i}
\]

and additionally \( U_i(\alpha_i, a_{-i}) > u_i(a'_i, a_{-i}) \) for at least one \( a_{-i} \). Weak domination permits elimination in some contexts but requires more care: iterative elimination of weakly dominated strategies can remove equilibria, whereas iterative elimination of strictly dominated strategies never does.

## Finding All MSNE in Practice

The practical procedure for finding all MSNE of a finite game proceeds in stages. First, delete any action strictly dominated by a pure or mixed strategy — and repeat iteratively. Second, find all pure-strategy equilibria using the best response (star) method; these are also MSNE. Third, apply Proposition 116.2 to find fully mixed MSNE: for each candidate support profile (specifying which actions each player mixes over), write down the indifference conditions and solve for the mixing probabilities, then verify that actions outside the candidate support indeed fail to exceed the common equilibrium payoff. In a two-player game where each player has two actions, the fully mixed MSNE (if it exists) is found by setting Player 1's expected payoffs to her two actions equal and solving for Player 2's mix, and vice versa.

The key discipline is to remember that a player's equilibrium mix is determined by the condition that it keeps the <strong>other</strong> player indifferent — not by any optimality condition on the mixer's own payoff. Once you internalize this, the computation becomes routine.

## The Interpretation of Mixed Strategy Equilibrium

Mixed strategy Nash equilibria raise a deep conceptual question: do people actually randomize? The mathematical apparatus tells us that in games like Matching Pennies or Battle of the Sexes, equilibrium requires players to mix over their actions with specific probabilities. But what does this mean in practice? There are three leading interpretations, each illuminating a different aspect of strategic uncertainty.

**Interpretation 1: Deliberate randomization.** In some settings, players genuinely benefit from being unpredictable. A poker player who always bluffs is easily exploited; one who never bluffs leaves money on the table. By mixing — sometimes bluffing, sometimes not — the player prevents opponents from exploiting any detectable pattern. Similarly, a soccer player taking a penalty kick should not always aim left, because the goalkeeper would anticipate this. Laboratory evidence from penalty kicks, tennis serves, and auditing games confirms that professionals' choice frequencies closely match MSNE predictions. In these competitive zero-sum-like environments, deliberate randomization is both plausible and empirically supported.

**Interpretation 2: Population frequencies.** Rather than thinking of a single player randomizing, we can interpret the MSNE probabilities as describing the **fraction of a large population** that plays each pure strategy. If two-thirds of a population plays action A and one-third plays action B, and individuals are randomly matched, then from any one player's perspective, the opponent's action is uncertain in exactly the way a mixed strategy describes. Under this interpretation, every individual plays a pure strategy — there is no coin-flipping — but the aggregate distribution of behavior in the population matches the MSNE mixing probabilities. This interpretation is especially natural in biological and evolutionary applications, where "strategies" are inherited traits rather than conscious choices.

**Interpretation 3: Harsanyi's purification theorem.** The most profound interpretation was proposed by John Harsanyi in 1973. Suppose that each player's payoffs are not known exactly by the other players. Instead, each player \(i\) has a small private **perturbation** \(\epsilon_i\) to her payoffs — perhaps player \(i\) slightly prefers one action over another for idiosyncratic reasons unknown to opponents. Formally, we model this as a Bayesian game in which each player observes her own perturbation but not the other's, and the perturbations are drawn from a continuous distribution with small support.

Harsanyi showed that as the perturbations shrink to zero, the Bayesian Nash equilibria of the perturbed game converge to the mixed strategy Nash equilibrium of the original (unperturbed) game. The striking implication is that **every player is playing a pure strategy** — each chooses the action that is optimal given her particular realization of the perturbation. But because the perturbations are private information, from an outsider's perspective (or from any one player's perspective regarding the other), behavior appears random. The mixed equilibrium is the **limit of pure-strategy equilibria** in nearby games of incomplete information.

To see this concretely, consider Battle of the Sexes. Barb and Sam normally prefer to coordinate, but suppose each has a small private shock: with some tiny probability, Barb has an unusually strong preference for Ballet that makes her choose Ballet regardless, and similarly Sam may have a shock pushing him to Soccer. Each player, knowing her own shock but not the other's, plays a pure best response. When the shocks are very small, the fraction of realizations in which Barb chooses Ballet (from Sam's perspective) approximates the MSNE mixing probability. As the variance of the shocks shrinks to zero, the equilibrium of the Bayesian game converges exactly to the fully mixed MSNE.

The **purification theorem** resolves much of the philosophical discomfort with mixed strategies. Players need not literally flip coins or consult random-number generators. They simply need to have slight private information — which is essentially always the case in practice — and the "randomness" in the equilibrium arises naturally from the other player's uncertainty about this private information. The mixed equilibrium is best understood not as a prescription to randomize, but as a summary of the strategic uncertainty that persists in equilibrium when players have even slightly imperfect knowledge of each other's exact preferences (see Osborne, Section 4.10).

---

# Chapter 10: Applications of Mixed Strategies

This chapter brings the machinery of mixed strategy Nash equilibria (MSNE) to bear on three concrete situations drawn from everyday economic and social life: expert diagnosis, soccer penalty kicks, and the problem of reporting a crime. Each example illuminates a different facet of strategic reasoning under uncertainty, and each produces predictions that are sometimes surprising even after a moment's careful thought.

## Section 1: Expert Diagnosis

### The Problem

Something you know nothing about breaks down. It could be your car making a strange noise, your computer crashing, a toothache that won't quit, or an appliance that has stopped working. The key feature is not the object itself but the asymmetry of knowledge: you are ill-informed, and you must consult someone who knows far more than you do. When that expert makes a diagnosis and recommends a course of action, you face a genuine dilemma. The expert is self-interested — he wants to sell his services — and you have no independent way to verify whether his diagnosis is accurate. He might tell you there is a major problem requiring expensive repair when in fact only a minor fix is needed. Do you trust him?

This is the <strong>expert diagnosis problem</strong>, and it turns out that game theory has quite a lot to say about it. We will focus on the car-mechanic version throughout, though the analysis applies equally to doctors, dentists, lawyers, financial advisers, and any other setting where expertise is asymmetric.

### The Model

A good model captures the essential features of a situation without becoming so complicated that it is impossible to solve. Here, the essential features are the information asymmetry and the conflict of interest. We strip away everything else.

There are two <strong>types</strong> of problems a car can have: <strong>major</strong> and <strong>minor</strong>. A major problem occurs with probability \(r\) and a minor problem with probability \(1 - r\), where \(0 &lt; r &lt; 1\). When the customer brings the car to the mechanic, the mechanic inspects it — we assume inspection is costless — and learns the true type. The customer never learns the true type directly. The only information the customer has is the prior probability \(r\) and whatever the expert chooses to tell her.

### Player Actions

Now consider what each player actually decides. For the <strong>expert</strong>, the action set has a subtle but important structure. When the problem is genuinely major, the expert has no incentive to understate it — claiming it is minor would only cost him revenue. So we can take it as given that the expert always reports a major problem as major. The only decision the expert faces is what to do when the problem is minor: does he report it honestly as minor, or does he lie and claim it is major? This binary choice defines his two strategies.

- <strong>Honest (H):</strong> recommend the repair that is actually needed — minor repair for minor problems, major repair for major problems.
- <strong>Dishonest (D):</strong> always recommend a major repair, regardless of the true type.

For the <strong>customer</strong>, the analogous logic applies. When the expert recommends a minor repair, the customer has no reason to doubt him — the expert has no incentive to understate a problem. The customer's decision concerns only what to do when she is told the problem is major: does she believe him and pay for the major repair, or does she walk away?

- <strong>Accept (A):</strong> always follow the expert's advice, including when a major repair is recommended.
- <strong>Reject (R):</strong> follow the expert's advice for minor repairs, but walk away whenever a major repair is recommended.

### Payoffs

<strong>Expert profits.</strong> Let \(\pi\) denote the expert's profit from performing a minor repair and also from performing a major repair when the problem genuinely is major. The dishonest profit — earned when the expert sells a major repair for what is in fact a minor problem — is \(\pi'\), where \(\pi' &gt; \pi\). The premium \(\pi' - \pi\) is the temptation to cheat: the expert charges for hours of labor and expensive parts when the job was really a twenty-minute fix.

<strong>Customer costs.</strong> Four cost parameters describe the customer's situation:

- \(I\): cost of a minor repair (the bill when the minor problem is correctly diagnosed and fixed).
- \(I'\): cost borne by the customer when she rejects a major-repair recommendation and the problem turns out to be minor. She drives away with a car that still has a small issue but is not dangerous. This costs more than a minor repair because she now has to live with the problem or find another solution. So \(I &lt; I'\).
- \(E\): cost of a major repair. This is larger than \(I'\) — if she knew it were only a minor problem, she would rather leave without any repair than pay the major-repair price. So \(I' &lt; E\).
- \(E'\): cost borne by the customer when she rejects a major-repair recommendation and the problem turns out to actually be major. She drives away with failing brakes or a serious engine fault. This is the worst outcome of all. So \(E &lt; E'\).

Throughout we assume:

\[
I &lt; I' &lt; E &lt; E'
\]

### The Strategic Game

We now have everything needed to write down the payoff matrix. We compute the expected payoff for each action profile, weighting by the probability that the underlying problem is major (\(r\) or minor (\(1-r\).

<strong>(H, A):</strong> The expert is honest and the customer accepts. Every car that comes in is diagnosed correctly, so a major problem gets a major repair and a minor problem gets a minor repair. The expert earns \(\pi\) regardless of car type. The customer pays \(E\) with probability \(r\) and \(I\) with probability \(1-r\), giving expected cost \(rE + (1-r)I\).

<strong>(D, A):</strong> The expert is dishonest and the customer accepts. Every diagnosis is "major." With probability \(r\) the problem really is major, so the expert earns \(\pi\). With probability \(1-r\) the problem is minor, but the expert claims it is major and the customer accepts, so the expert earns \(\pi'\). Expected expert profit: \(r\pi + (1-r)\pi'\). The customer always pays for a major repair, so her cost is \(E\) with certainty.

<strong>(H, R):</strong> The expert is honest and the customer rejects all major-repair recommendations. With probability \(r\) the problem is major, the expert truthfully says so, and the customer walks away — the expert earns nothing. With probability \(1-r\) the problem is minor, the expert says so, the customer accepts, and the expert earns \(\pi\). Expert's expected profit: \((1-r)\pi\). The customer faces cost \(E'\) when the problem is major (she rejected a truthful warning) and cost \(I\) when it is minor (she accepted the accurate minor diagnosis).

<strong>(D, R):</strong> The expert is dishonest and the customer rejects all major-repair recommendations. The expert always recommends a major repair, and the customer always rejects it, so the expert earns zero. The customer faces cost \(E'\) with probability \(r\) (the problem was major and she rejected the recommendation) and cost \(I'\) with probability \(1-r\) (the problem was minor, the expert lied, she rejected, and now the minor problem goes unrepaired).

The full payoff matrix, with expert payoffs listed first and customer costs (negated) second:

<table>
  <thead>
    <tr>
      <th colspan="2" rowspan="2"></th>
      <th colspan="2" style="text-align:center;">Customer</th>
    </tr>
    <tr>
      <th>Accept</th>
      <th>Reject</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" style="vertical-align:middle;">Expert</th>
      <th>Honest</th>
      <td>\(\pi,\ -rE-(1-r)I\)</td>
      <td>\((1-r)\pi,\ -rE'-(1-r)I\)</td>
    </tr>
    <tr>
      <th>Dishonest</th>
      <td>\(r\pi+(1-r)\pi',\ -E\)</td>
      <td>\(0,\ -rE'-(1-r)I'\)</td>
    </tr>
  </tbody>
</table>

### Identifying Best Responses

Before solving for the equilibria formally, it helps to reason through each player's best responses at the corners of the strategy space.

<strong>Expert's best responses.</strong> If the customer is definitely going to accept (Accept), the expert does better by being dishonest: \(r\pi + (1-r)\pi' &gt; \pi\) because \(\pi' &gt; \pi\), so the weighted average of \(\pi\) and \(\pi'\) exceeds \(\pi\) alone. If the customer is definitely going to reject, the expert does better by being honest: a dishonest expert always claims major and is always rejected, earning zero; an honest expert at least picks up the minor-repair business, earning \((1-r)\pi &gt; 0\).

<strong>Customer's best responses.</strong> If the expert is definitely being honest, the customer should always accept — she is receiving truthful advice, so rejecting only exposes her to the cost \(E'\) of a major problem going unrepaired, which is worse than paying \(E\). If the expert is definitely dishonest, the customer's best response depends on the relative magnitudes of parameters. She must compare the cost of always accepting (\(E\) against the expected cost of always rejecting (\(rE' + (1-r)I'\). This comparison is not determined by the ordering \(I &lt; I' &lt; E &lt; E'\) alone, so we must consider cases.

### Pure Strategy Nash Equilibria

<strong>Case 1: \(E &lt; rE' + (1-r)I'\).</strong> When the cost of accepting a (possibly fraudulent) major repair is less than the expected cost of always rejecting, the customer's best response to a dishonest expert is to accept. Combined with the fact that the expert's best response to an accepting customer is to be dishonest, we get a pure strategy Nash equilibrium: <strong>(Dishonest, Accept)</strong>. In this equilibrium the expert always lies when problems are minor and the customer always complies. There is no incentive for either to deviate: the expert would lose profit by being honest, and the customer would suffer a higher expected cost by rejecting.

<strong>Case 2: \(E &gt; rE' + (1-r)I'\).</strong> Now rejecting is the customer's best response when the expert is dishonest. But accepting is the customer's best response when the expert is honest. Since neither player has a dominant strategy in this case, there is no pure strategy Nash equilibrium. The game must have a mixed strategy Nash equilibrium.

<strong>Case 3: \(E = rE'+(1-r)I'\).</strong> The boundary case yields a continuum of equilibria — discussed briefly below.

### Finding the Mixed Strategy Nash Equilibrium

Let \(p\) denote the probability that the expert is Honest and \(1-p\) the probability that he is Dishonest. Let \(q\) denote the probability that the customer Accepts and \(1-q\) the probability that she Rejects.

We focus on Case 2 where \(E &gt; rE' + (1-r)I'\).

<strong>Expert's indifference condition.</strong> For the expert to mix between Honest and Dishonest, he must be indifferent between them. His expected payoff to Honest is:

\[
q \cdot \pi + (1-q) \cdot (1-r)\pi
\]

With probability \(q\) the customer accepts and the honest expert earns \(\pi\). With probability \(1-q\) the customer rejects; since the honest expert only earns anything when the problem is minor (probability \(1-r\), his payoff is \((1-r)\pi\). His expected payoff to Dishonest is:

\[
q \cdot (r\pi + (1-r)\pi') + (1-q) \cdot 0
\]

When the customer accepts, the dishonest expert earns the weighted average \(r\pi + (1-r)\pi'\). When the customer rejects, the dishonest expert always gets zero (every customer told about a major repair walks away). Setting these equal:

\[
q\pi + (1-q)(1-r)\pi = q(r\pi + (1-r)\pi')
\]

Expanding the left side: \(q\pi + (1-r)\pi - q(1-r)\pi\). Expanding the right side: \(qr\pi + q(1-r)\pi'\). After simplification (terms involving \(qr\pi\) cancel on both sides along with the non-\(q\) terms), we arrive at:

\[
q^* = \frac{\pi}{\pi'}
\]

This is the equilibrium probability with which the customer must accept in order to keep the expert indifferent. Notice that it depends only on the expert's own profit parameters — not on the customer's costs or on \(r\).

<strong>Customer's indifference condition.</strong> For the customer to mix, she must be indifferent between Accept and Reject. Her expected payoff (as a cost) to Accepting is:

\[
p(-rE - (1-r)I) - (1-p)E
\]

Her expected payoff to Rejecting is:

\[
p(-rE' - (1-r)I) + (1-p)(-rE' - (1-r)I')
\]

Setting these equal and solving for \(p\) yields:

\[
p^* = \frac{E - [rE' + (1-r)I']}{(1-r)(E - I')}
\]

One can verify that this is positive whenever \(E &gt; rE' + (1-r)I'\) (our Case 2 assumption) and less than one whenever \(E &lt; E'\), which holds by assumption. So \(p^* \in (0,1)\) is a valid mixing probability.

<strong>The unique MSNE.</strong> When \(E &gt; rE' + (1-r)I'\), there is a unique mixed strategy Nash equilibrium:

\[
\bigl((p^<em>,\, 1-p^</em>),\, (q^<em>,\, 1-q^</em>)\bigr)
\]

where

\[
p^<em> = \frac{E - [rE' + (1-r)I']}{(1-r)(E - I')}, \qquad q^</em> = \frac{\pi}{\pi'}
\]

<strong>The boundary case.</strong> When \(E = rE' + (1-r)I'\), the customer is exactly indifferent between Accept and Reject whenever the expert is dishonest. In this case, the best response functions overlap along a line segment, and there is a continuum of MSNE: all profiles \(((0,1),\,(q^<em>,\,1-q^</em>))\) with \(q^* \in [\pi/\pi',\,1]\) are equilibria — the expert is always dishonest and the customer mixes with any acceptance probability above the threshold \(\pi/\pi'\).

### Comparative Statics: Counterintuitive Predictions

The payoff of game theory is not just finding equilibria but understanding how they respond to changes in the environment. The expert diagnosis MSNE delivers three predictions that violate naive intuition.

<strong>Major problems become less common (\(r\) falls).</strong> One might expect that as major problems become rarer, a rational customer would trust the expert less — after all, any given "major" diagnosis is now more likely to be a lie. Intuition says the customer should reject more, so \(q^<em>\) should fall. But look at the formula: \(q^</em> = \pi/\pi'\) contains no \(r\). The acceptance probability does not change at all. The resolution is that this partial reasoning ignores how the expert responds. To see what actually adjusts, rewrite \(p^*\) as:

\[
p^* = 1 - \frac{r(E' - E)}{(1-r)(E - I')}
\]

As \(r\) falls, \(p^<em>\) rises — the expert becomes </em>more* honest. The mechanism: when major problems are rare, the customer has less at stake when rejecting (she is unlikely to be driving away from a truly dangerous repair). To keep the customer indifferent — a necessary condition for the customer to ever accept in equilibrium — the expert must compensate by being honest more often. A more honest expert is one with whom the customer is again willing to engage. The customer's strategy stays put; the expert's strategy adjusts.

<strong>Major repairs become less expensive (\(E\) falls).</strong> Now one might expect the customer to accept more readily — a major repair is cheaper, so what is the harm? Again, \(q^<em>\) is unchanged. The formula for \(p^</em>\) shows that as \(E\) falls, \(p^<em>\) falls too — the expert becomes </em>less* honest. The mechanism: cheaper major repairs reduce the customer's cost of being deceived. She is willing to accept even if the expert is more likely to be lying. Sensing this, the expert takes advantage and becomes less scrupulous. The customer's indifference is restored not by any change in her strategy but by the deterioration of the expert's honesty. This is a striking result: <strong>improving the affordability of a service can paradoxically increase the dishonesty of providers</strong>.

<strong>Gain from dishonesty falls (\(\pi'\) falls).</strong> Suppose regulators or professional norms reduce the premium that an expert can extract from a fraudulent major repair. One might expect experts to become more honest — the temptation has diminished. But \(p^<em>\) contains no \(\pi'\), so expert honesty is unchanged. What adjusts is \(q^</em> = \pi/\pi'\): as \(\pi'\) falls, \(q^<em>\) rises and the customer becomes </em>more accepting*. The intuition: with a smaller temptation, the expert is less attracted to dishonesty. For the expert to remain indifferent between honest and dishonest behavior, the customer must make dishonesty more profitable by accepting more often. Reducing the gain from fraud thus makes customers more credulous — the opposite of what you might hope for.

These three comparative statics share a common lesson. <strong>In a mixed strategy Nash equilibrium, a player's mixing probability is determined by the opponent's payoffs, not their own.</strong> Each player adjusts their strategy to keep the other player indifferent. Reasoning about one player's incentives in isolation — without accounting for the opponent's strategic response — consistently leads to wrong answers. The model forces us to think through both sides simultaneously.

---

## Section 2: Soccer Penalty Kicks

<div class="embed-container"><iframe src="https://www.youtube.com/embed/mKmcxZtFvQ4?rel=0&start=380" frameborder="0" allowfullscreen></iframe></div>

<em>A penalty kick compilation illustrating the simultaneous-move structure of the kicker–goalkeeper game.</em>

### Why Penalty Kicks Are a Natural Laboratory

Soccer penalty kicks offer a remarkably clean test of MSNE theory. Several features make them ideal. First, the ball travels at over 200 kilometers per hour and reaches the net in roughly 0.2 seconds — far too fast for the goalkeeper to observe the kick direction and then dive. Both players must commit to their direction essentially simultaneously, making this a genuine simultaneous-move game. Second, the game is <strong>purely competitive</strong>: whatever is good for the kicker (a goal) is bad for the goalkeeper, and vice versa. This is the zero-sum structure of Matching Pennies, and it guarantees a unique MSNE in mixed strategies. Third, the stakes are high — penalty shootouts often decide major tournaments — so we expect players to have developed close-to-optimal behavior over many repetitions. Fourth, data on what players actually did are publicly available.

### The Two-Action Model

Normalizing to a right-footed kicker, the kicker's <strong>natural side</strong> is the left of the net (where his shot is hardest and most accurate) and his <strong>weak side</strong> is the right. The goalkeeper can dive toward either side. This gives a 2×2 game structure analogous to Matching Pennies, though with asymmetric success probabilities reflecting real skill differences.

Data from 1,417 penalty kicks taken in major European leagues between 1995 and 2000 (Chiappori, Levitt, and Groseclose, AER 2002) provide the empirical payoffs. Payoffs are scored as the probability of a goal (kicker's payoff) and its negative (goalkeeper's payoff):

<table>
  <thead>
    <tr>
      <th colspan="2" rowspan="2"></th>
      <th colspan="2" style="text-align:center;">Goalkeeper</th>
    </tr>
    <tr>
      <th>Dives Left</th>
      <th>Dives Right</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" style="vertical-align:middle;">Kicker</th>
      <th>Shoots Left (natural)</th>
      <td>70, −70</td>
      <td>95, −95</td>
    </tr>
    <tr>
      <th>Shoots Right (weak)</th>
      <td>92, −92</td>
      <td>58, −58</td>
    </tr>
  </tbody>
</table>

The asymmetries are intuitive: shooting to the natural side while the goalkeeper guesses correctly is still relatively likely to score (70%), because the shot is hit so hard. Shooting to the weak side when the goalkeeper guesses correctly yields only 58%. When the goalkeeper guesses wrong, both directions score at very high rates (95% and 92%).

### Computing the MSNE

Since this is a zero-sum game with no dominant strategies, there is no pure strategy Nash equilibrium — a kicker who always shoots left gives the goalkeeper a free best response (always dive left), which in turn gives the kicker a reason to switch, and so on. There must be a unique MSNE.

Let \(q\) be the probability that the goalkeeper dives Left. The kicker mixes only if he is indifferent between Left and Right:

\[
70q + 95(1-q) = 92q + 58(1-q)
\]

\[
95 - 25q = 58 + 34q
\]

\[
59q = 37 \implies q^* = 62.7\%
\]

Now let \(p\) be the probability that the kicker shoots Left. The goalkeeper mixes only if he is indifferent between diving Left and diving Right (where his payoffs are negatives of the kicker's):

\[
-70p - 92(1-p) = -95p - 58(1-p)
\]

\[
-92 + 22p = -58 - 37p
\]

\[
59p = 34 \implies p^* = 57.6\%
\]

The unique MSNE is: kicker shoots Left with probability 57.6% and Right with probability 42.4%; goalkeeper dives Left with probability 62.7% and Right with probability 37.3%.

### Comparing Theory to Data

How does this theoretical prediction compare to what professional players actually do? The data show that kickers chose their natural (left) side 60% of the time, and goalkeepers dove to the natural side 57.7% of the time. These observed frequencies are strikingly close to the MSNE predictions of 57.6% and 62.7% respectively. Professional players, through experience, competition, and perhaps intuition honed over thousands of kicks, appear to behave in ways that closely approximate theoretically optimal mixed strategies.

Another notable feature is that in the MSNE, each player's expected success rate should be the same regardless of which action they choose. This <strong>indifference condition</strong> is in fact approximately satisfied in the data: the overall scoring rates from left and right kicks, and the overall save rates from diving left versus right, are close to equal across action choices.

### The Three-Action Extension

What if each player has three options — Left, Centre, and Right? Data from 459 penalty kicks in the French and Italian first divisions between 1997 and 1999 allow estimation of a 3×3 payoff matrix. The scoring percentages by cell are:

<table>
  <thead>
    <tr>
      <th colspan="2" rowspan="2"></th>
      <th colspan="3" style="text-align:center;">Goalkeeper</th>
    </tr>
    <tr>
      <th>Left</th>
      <th>Centre</th>
      <th>Right</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="3" style="vertical-align:middle;">Kicker</th>
      <th>Left</th>
      <td>63.2%</td>
      <td>100%</td>
      <td>94.1%</td>
    </tr>
    <tr>
      <th>Centre</th>
      <td>81.2%</td>
      <td>0%</td>
      <td>89.3%</td>
    </tr>
    <tr>
      <th>Right</th>
      <td>89.5%</td>
      <td>100%</td>
      <td>44.0%</td>
    </tr>
  </tbody>
</table>

The most striking cells are (Centre, Centre): a shot right down the middle when the goalkeeper stays put results in a 0% scoring rate — an almost certain save — while a shot to either side when the goalkeeper dives to the centre is a near-certain goal (100%). The unique MSNE for this 3×3 game implies kickers should play (Left 42.9%, Centre 23.7%, Right 33.4%) and goalkeepers should play (Left 56.5%, Centre 9.7%, Right 33.9%).

The observed frequencies are: kickers chose (44.9%, 17.2%, 37.9%) and goalkeepers chose (56.6%, 2.4%, 41.0%). Once again, left and right frequencies are approximately consistent with the theory. The main discrepancy is that both kickers and goalkeepers use the centre less than the MSNE prescribes — kickers shoot down the middle only 17.2% of the time versus a predicted 23.7%, and goalkeepers stay centre only 2.4% of the time versus a predicted 9.7%. This may reflect risk aversion or a psychological aversion to looking foolish by staying still when the ball goes to a corner.

Overall, the penalty kick evidence is one of the most convincing empirical validations of MSNE in any domain of economics or social science. Players at the highest professional level behave in ways that closely approximate equilibrium play.

---

## Section 3: Reporting a Crime — The Volunteer's Dilemma

### The Problem

On March 13, 1964, Kitty Genovese was murdered outside her apartment in New York City. Thirty-seven neighbors reportedly witnessed the attack or heard her cries for help over a period of more than thirty minutes. None called the police. The case became a touchstone for social psychologists studying what they called the <strong>bystander effect</strong> — the observed tendency for individuals to be less likely to offer help when other bystanders are present.

Game theory offers a complementary and formally precise account of this phenomenon. The <strong>Volunteer's Dilemma</strong>, as economists call it, shows that the bystander effect is not a failure of character or empathy but an equilibrium outcome of rational behavior when there are many potential helpers.

### The Model

A crime is observed by \(n\) people, where \(n \geq 2\). Each person would like the police to be informed, but each prefers that someone else make the call. Formally:

- Each person attaches <strong>value</strong> \(v &gt; 0\) to the police being notified (the crime is stopped or investigated).
- Making the call imposes a personal <strong>cost</strong> \(c\) on the caller, where \(0 &lt; c &lt; v\). The cost might be time, effort, the discomfort of getting involved, or fear of retaliation.
- The police need to be called only once — a single call is sufficient.

This makes reporting a <strong>public good</strong> with a twist: the good is provided as soon as one person contributes, so additional contributors add nothing. Each person's payoffs are:

- <strong>0</strong> if no one calls (the crime goes unreported).
- <strong>\(v - c\)</strong> if she calls (she bears the cost but the good is provided).
- <strong>\(v\)</strong> if at least one other person calls and she does not (she gets the benefit for free).

Since \(c &gt; 0\), a person strictly prefers that someone else make the call. Since \(c &lt; v\), she would rather call herself than have no one call at all.

### Pure Strategy Nash Equilibria

There are exactly \(n\) pure strategy Nash equilibria: in each, exactly one specific person calls and everyone else does not. These equilibria are straightforward to verify — the caller cannot do better by not calling (she would get 0 instead of \(v - c &gt; 0\), and no non-caller can do better by calling (she already receives \(v\) for free, and calling would reduce her payoff to \(v - c\).

These pure equilibria are compelling when the group is <strong>heterogeneous</strong> — if one person is obviously the most appropriate caller (say, the person closest to a phone, or the most senior member of a group), coordination is easy. But when the group is <strong>homogeneous</strong> — all witnesses are essentially identical in their costs and values — there is no natural way to pick who should be the designated caller. In a symmetric setting, a symmetric equilibrium is the right concept.

### The Symmetric Mixed Strategy Nash Equilibrium

In a symmetric MSNE, every person calls with the same probability \(p\) and does not call with probability \(1-p\), where \(0 &lt; p &lt; 1\). By Proposition 116.2, for this to be an equilibrium each person must be indifferent between calling and not calling.

<strong>Payoff to calling:</strong> \(v - c\) (certain, since the call itself ensures the police are notified).

<strong>Expected payoff to not calling:</strong> The person gets \(v\) if at least one of the other \(n-1\) people calls, and 0 if none of the others call. The probability that none of the other \(n-1\) people call is \((1-p)^{n-1}\) (since each person independently does not call with probability \(1-p\). Therefore:

\[
\text{Expected payoff to Not Call} = v \cdot \bigl(1 - (1-p)^{n-1}\bigr) + 0 \cdot (1-p)^{n-1} = v\bigl(1-(1-p)^{n-1}\bigr)
\]

Setting the two payoffs equal:

\[
v - c = v\bigl(1 - (1-p)^{n-1}\bigr)
\]

\[
\frac{c}{v} = (1-p)^{n-1}
\]

This is the <strong>equilibrium condition</strong>: the probability that none of the other \(n-1\) people call must equal the ratio \(c/v\). Solving for \(p\):

\[
p^* = 1 - \left(\frac{c}{v}\right)^{1/(n-1)}
\]

Since \(0 &lt; c/v &lt; 1\), we have \(0 &lt; (c/v)^{1/(n-1)} &lt; 1\), so \(p^* \in (0,1)\) — a valid mixing probability.

The symmetric MSNE is the strategy profile in which each of the \(n\) people calls with probability:

\[
p^* = 1 - \left(\frac{c}{v}\right)^{1/(n-1)}
\]

### The Bystander Effect: Equilibrium and Group Size

How does the equilibrium change as the number of witnesses \(n\) grows? As \(n\) increases, the exponent \(1/(n-1)\) decreases toward zero. Since \(c/v &lt; 1\), raising a number smaller than 1 to a smaller exponent brings it closer to 1. Therefore \((c/v)^{1/(n-1)}\) increases toward 1, and \(p^* = 1 - (c/v)^{1/(n-1)}\) decreases toward 0. <strong>Each individual is less likely to call as the group grows.</strong> This is the first dimension of the bystander effect.

But is the <em>overall</em> probability that the crime gets reported higher or lower with more witnesses? One might hope that even if each individual is less likely to call, having more individuals compensates. The equilibrium calculation shows otherwise.

The probability that <strong>no one</strong> calls is:

\[
\Pr[\text{no one calls}] = (1-p^*)^n = \left(\frac{c}{v}\right)^{n/(n-1)}
\]

Note that \(n/(n-1)\) is a decreasing function of \(n\): it starts at 2 when \(n=2\) and decreases toward 1 as \(n \to \infty\). Since \(c/v &lt; 1\), raising it to a smaller exponent makes it larger. Therefore:

\[
\frac{d}{dn}\left(\frac{c}{v}\right)^{n/(n-1)} &gt; 0
\]

<strong>The probability that the crime goes unreported strictly increases with the number of witnesses.</strong> A group of 37 neighbors is less likely to call the police than a group of 2, in equilibrium. This is the bystander effect derived as a theorem, not merely observed as a behavioral tendency.

### Interpretation

Two interpretations of the symmetric MSNE are possible. One interpretation is that each individual genuinely randomizes — flipping an internal coin with bias \(p^<em>\) every time they witness a crime. A perhaps more natural interpretation is that \(p^</em>\) is the <strong>fraction of the population</strong> that would call given their particular personal costs and values. In a large population, some people have low \(c/v\) ratios and almost always call; others have high ratios and almost never do. The equilibrium \(p^*\) describes the average behavior of this population.

Social psychologists have proposed three mechanisms for the bystander effect: <strong>diffusion of responsibility</strong> (each person feels less morally obligated when others are present), <strong>audience inhibition</strong> (fear of embarrassment if it turns out not to be an emergency), and <strong>social influence</strong> (inferring from others' inaction that intervention is unnecessary). Game theory suggests a fourth mechanism — <strong>strategic free-riding</strong> — that operates even when all of these psychological factors are absent. The bystander effect is a prediction of rational equilibrium behavior, and that makes it robust across a wide range of settings and motivations.

## Heterogeneous Witnesses in the Volunteer's Dilemma

The symmetric Volunteer's Dilemma assumes all witnesses face the same cost of calling. But in reality, some witnesses bear higher costs than others — a nurse may find it much easier to provide emergency medical assistance than a bystander with no training, or a person standing next to a phone pays less than someone who would have to run several blocks. How does this **heterogeneity** affect the mixed strategy equilibrium, and which witness is more likely to volunteer?

Consider two witnesses, person 1 with cost \(c_1\) and person 2 with cost \(c_2\), where \(0 < c_1 < c_2 < v\) (both costs are below the value of the public good being provided, and person 1 has the lower cost). In any mixed strategy Nash equilibrium, each person must be indifferent between calling and not calling. Person \(i\) is indifferent when:

\[
v - c_i = v \cdot p_j
\]

where \(p_j\) is the probability that the other person calls. This gives:

\[
p_j = 1 - \frac{c_i}{v}
\]

So person 2 calls with probability \(p_2 = 1 - c_1/v\) and person 1 calls with probability \(p_1 = 1 - c_2/v\). Since \(c_1 < c_2\), we have \(1 - c_1/v > 1 - c_2/v\), which means \(p_2 > p_1\). The person with the **lower** cost of calling volunteers with **lower** probability in equilibrium.

This result is counterintuitive at first glance — shouldn't the person who finds it cheaper to help be more willing to do so? The resolution lies in the logic of mixed equilibria. Because person 1's cost is low, person 2 knows that person 1 has a strong incentive to call. This makes person 2 more comfortable free-riding, so person 2 calls less often... but wait, that is not what we found. Let us be precise: the equilibrium probability with which person \(i\) calls is determined by the condition that makes the **other** person indifferent. Person 1's low cost means person 2 needs a higher probability of someone else calling to be indifferent — and that higher probability comes from person 2 herself calling more. The algebra confirms: \(p_2 = 1 - c_1/v\) is large precisely because \(c_1\) is small.

For a numerical example, let \(v = 10\), \(c_1 = 2\), \(c_2 = 6\). Then \(p_1 = 1 - 6/10 = 0.4\) and \(p_2 = 1 - 2/10 = 0.8\). The low-cost person calls only 40% of the time, while the high-cost person calls 80% of the time. The probability that nobody calls is \((1 - p_1)(1 - p_2) = 0.6 \times 0.2 = 0.12\), compared to \((1 - p^*)^2\) in the symmetric case. Heterogeneity here actually reduces the chance of the public good going unprovided, because the asymmetry in costs generates asymmetry in equilibrium behavior that is more efficient than symmetric mixing.

The general lesson reinforces a recurring theme: in mixed strategy equilibria, a player's mixing probability is pinned down by the **other** player's indifference condition, not by her own costs. Changes to your own cost affect the other player's equilibrium behavior, not yours. This feature — which often generates surprising comparative statics — is one of the most important conceptual insights from the theory of mixed strategies (see Osborne, Problem 132.2).

---

# Chapter 11: Extensive Games & Subgame Perfect Equilibrium

## Section 1: Extensive Games with Perfect Information

### Why Sequential Games Matter

The model of a strategic game, which dominated earlier chapters, suppresses the sequential nature of decision-making. In a strategic game, players cannot respond to what other players do — everyone chooses simultaneously, once and for all, before any action is revealed. Many real-world interactions, however, are genuinely sequential: one player moves first, another observes what happened, and then responds. To capture this structure we need a richer model.

An <strong>extensive game with perfect information</strong> models this sequential structure explicitly. The qualifying phrase "perfect information" means that whenever a player is about to move, she knows the complete history of every action taken up to that point. Imperfect information — where players may not observe earlier actions — is a further generalisation covered in a later chapter.

### Defining an Extensive Game

To describe an extensive game with perfect information, we still need to specify the set of players and their preferences. In addition, we need to specify the order of moves and the actions available at each point. We do this through two new objects: <strong>terminal histories</strong> and a <strong>player function</strong>.

A <strong>terminal history</strong> is a sequence of actions that traces the complete play of the game from beginning to end. More precisely, the terminal histories form a set of sequences with the property that no sequence is a proper subhistory of any other — once a sequence reaches a terminal node, play is over and nothing further follows. Formally, the structure of an extensive game is given by Definition 155.1:

> An extensive game with perfect information consists of: (i) a set of players; (ii) a set of sequences (terminal histories) with the property that no sequence is a proper subhistory of any other sequence; (iii) a function (the <strong>player function</strong>) that assigns a player to every sequence that is a proper subhistory of some terminal history; and (iv) for each player, preferences over the set of terminal histories.

The player function \( P \) tells us who moves after any given partial sequence of actions. A <strong>history</strong> is any sequence of actions that is a subhistory of some terminal history — it represents a point the game may reach. A <strong>proper subhistory</strong> of a terminal history is any strict initial segment of it (not including the terminal history itself).

### Subhistories and the Consistency Constraint

To make sure a set of sequences can legitimately represent the terminal histories of a game, exactly one restriction is needed: no sequence in the set may be a proper subhistory of another sequence in the set. This ensures that choosing action \( A \) cannot simultaneously end the game and leave room for further play.

For a sequence \( (a_1, a_2, \ldots, a_k) \), its subhistories are the empty history \( \emptyset \) and all sequences of the form \( (a_1, a_2, \ldots, a_m) \) for \( 1 \leq m \leq k \). Any subhistory not equal to the full sequence is a proper subhistory. So if \( (A, D, F) \) is a terminal history, none of \( \emptyset \), \( (A) \), or \( (A, D) \) may itself be a terminal history.

### The Entry Game

A running example throughout this chapter is the <strong>entry game</strong>, which models competition between an incumbent monopolist and a potential challenger. The setup: a challenger decides whether to enter an industry. If the challenger enters, the incumbent decides whether to acquiesce (peacefully share the market) or fight (engage in costly price competition).

The terminal histories, player function, and payoffs are:

- Terminal histories: \( (\text{In},\,\text{Acquiesce}) \), \( (\text{In},\,\text{Fight}) \), \( (\text{Out}) \)
- Player function: \( P(\emptyset) = \text{Challenger} \); \( P(\text{In}) = \text{Incumbent} \)
- Payoffs (Challenger, Incumbent):
  - \( (\text{In},\,\text{Acquiesce}) \mapsto (2,\,1) \)
  - \( (\text{In},\,\text{Fight}) \mapsto (0,\,0) \)
  - \( (\text{Out}) \mapsto (1,\,2) \)

The challenger's best outcome is entry followed by acquiescence; her worst is entry followed by a fight. The incumbent most prefers that the challenger stay out; his worst outcome is a fight.

### Strategies in Extensive Games

In a strategic game, a player's strategy is simply an action (or, in the mixed-extension, a probability distribution over actions). In an extensive game, the concept of a <strong>strategy</strong> is more demanding.

<strong>Definition 159.1.</strong> A strategy of player \( i \) in an extensive game with perfect information is a function that assigns to each history \( h \) after which it is player \( i \)'s turn to move an action in \( A(h) \), the set of actions available after \( h \).

The key point is that a strategy specifies an action at every decision point — including histories that may never be reached given the strategy itself. A strategy is a full contingency plan. If player 1 intends to choose \( B \) at the start of the game, she may never face the node that follows \( A \). Yet her strategy must still specify what she would do there. One interpretation: the strategy describes what she would do if she were to make a mistake and accidentally choose \( A \). Another interpretation: she gives complete instructions to an agent before the game starts, and those instructions must cover every contingency.

Consider the game with terminal histories \( (A,C) \), \( (A,D,F) \), \( (A,D,G) \), \( (A,D,H) \), and \( (B,E) \), with player function \( P(\emptyset)=1 \), \( P(A)=2 \), \( P(A,D)=1 \), \( P(B)=2 \). Player 1 moves at the empty history and again, possibly, after \( (A,D) \). Her strategies therefore each have two components: an action at \( \emptyset \) (either \( A \) or \( B \) and an action at \( (A,D) \) (one of \( F \), \( G \), \( H \). Her strategy set is \( \{AF,\,AG,\,AH,\,BF,\,BG,\,BH\} \). Player 2 moves after \( A \) (choosing \( C \) or \( D \) and after \( B \) (choosing \( E \), the only option). Her strategy set is \( \{CE,\,DE\} \).

### Outcomes

The <strong>outcome</strong> \( O(s) \) of a strategy profile \( s \) is the terminal history that results when all players implement their strategies. The outcome is what actually happens — the path through the tree. Different strategy profiles can generate the same outcome. For example, \( (BF,\,CE) \) and \( (BG,\,DE) \) both produce the terminal history \( (B,E) \), because the second entry of each player's strategy is never relevant when player 1 begins by playing \( B \).

---

## Section 2: Nash Equilibrium in Extensive Games

### Adapting the Definition

We adapt the definition of Nash equilibrium from strategic games to extensive games in a natural way. A strategy profile \( s^<em> \) is a <strong>Nash equilibrium</strong> of an extensive game with perfect information if, for every player \( i \) and every strategy \( r_i \) of player \( i \), the outcome generated by \( s^</em> \) is at least as good for player \( i \) as the outcome generated when player \( i \) deviates to \( r_i \) and everyone else remains at \( s^* \).

<strong>Definition 161.2.</strong> The strategy profile \( s^* \) in an extensive game with perfect information is a Nash equilibrium if, for every player \( i \) and every strategy \( r_i \) of player \( i \):

\[
u_i\!\left(O(s^<em>)\right) \;\geq\; u_i\!\left(O(r_i,\, s^</em>_{-i})\right)
\]

where \( u_i \) is a payoff function representing player \( i \)'s preferences over terminal histories and \( O(\cdot) \) is the outcome function. In other words, no player can make a profitable deviation, given the other players' strategies.

### The Strategic Form of an Extensive Game

For finite extensive games, there is a systematic method for finding all Nash equilibria: convert the extensive game to its <strong>strategic form</strong>. The strategic form is a strategic game defined as follows:

- <strong>Players:</strong> the same set of players as in the extensive game.
- <strong>Actions:</strong> each player's set of actions in the strategic form is her set of strategies in the extensive game.
- <strong>Preferences:</strong> each player's payoff to an action profile in the strategic form equals the payoff she receives in the terminal history generated by that strategy profile in the extensive game.

The critical fact is that the set of Nash equilibria of any extensive game with perfect information is exactly the set of Nash equilibria of its strategic form. This means we can apply all our earlier tools — best response functions, the STAR method — once we write down the strategic form.

### Nash Equilibria of the Entry Game

For the entry game, the challenger has two strategies (In, Out) and the incumbent has two strategies (Acquiesce, Fight). The strategic form, with payoffs (Challenger, Incumbent), is:

<table>
  <thead>
    <tr>
      <th></th>
      <th></th>
      <th>Acquiesce</th>
      <th>Fight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2">Challenger</th>
      <th>In</th>
      <td>2, 1</td>
      <td>0, 0</td>
    </tr>
    <tr>
      <th>Out</th>
      <td>1, 2</td>
      <td>1, 2</td>
    </tr>
  </tbody>
</table>

Applying best response analysis: if the incumbent plays Acquiesce, the challenger's best response is In (payoff 2 > 1); if the incumbent plays Fight, the challenger's best response is Out (payoff 1 > 0). If the challenger plays In, the incumbent's best response is Acquiesce (payoff 1 > 0); if the challenger plays Out, both Acquiesce and Fight are best responses for the incumbent (each yields payoff 2, regardless of what the challenger does, because the challenger never enters).

This yields two Nash equilibria:

1. <strong>(In, Acquiesce)</strong> — the challenger enters and the incumbent accommodates.
2. <strong>(Out, Fight)</strong> — the challenger stays out, with the incumbent threatening to fight if entry occurs.

### The Credibility Problem

The first equilibrium, (In, Acquiesce), is exactly what backward induction predicts: knowing the incumbent would prefer to acquiesce once challenged, the challenger safely enters. This equilibrium is intuitive and realistic.

The second equilibrium, (Out, Fight), is more troubling. It is technically a Nash equilibrium — given that the incumbent threatens to fight, the challenger's best response is to stay out, and given that the challenger stays out, the incumbent's threat of fighting is costless (the threat is never called upon). The logic is mutually consistent.

But is this equilibrium credible? Consider what would happen if the challenger were actually to enter. At that moment, the incumbent would have to choose between acquiescing (earning 1) and fighting (earning 0). The incumbent would clearly prefer to acquiesce. The threat to fight is therefore <strong>not credible</strong> — the incumbent cannot commit to fighting before the game begins, and at the moment the threat is tested, they would back down.

A useful way to see this fragility: suppose players occasionally make small mistakes, so that every node in the game tree is reached with some small positive probability. In that case, the incumbent would sometimes find themselves at the node where they must choose between acquiescing and fighting. At that node, acquiescing strictly dominates fighting. So (Out, Fight) cannot be an equilibrium of this "perturbed" game, no matter how small the probability of mistakes. A Nash equilibrium that collapses under the smallest perturbation is not a robust prediction.

This problem arises because the Nash equilibrium concept treats strategies as commitments made once and for all before play begins. It does not require strategies to be optimal off the equilibrium path. We need a stronger solution concept that rules out non-credible threats.

---

## Section 3: Subgame Perfect Equilibrium

### The Intuition

The idea behind <strong>subgame perfect equilibrium</strong> is to require not just that players are acting optimally along the equilibrium path, but that they are acting optimally after every possible history — including histories that would never be reached under the equilibrium strategies. The reasoning is simple: if a node were ever reached, we would expect the player moving there to act optimally. Therefore, in any genuinely robust equilibrium, strategies must be optimal everywhere, not merely on the path that the equilibrium actually travels.

This is a refinement of Nash equilibrium. It eliminates equilibria that rest on empty threats — promises of actions the player would never actually want to carry out if called upon.

### Subgames

To formalise this, we need the concept of a <strong>subgame</strong>.

<strong>Definition 164.1.</strong> Let \( \Gamma \) be an extensive game with perfect information and player function \( P \). For any nonterminal history \( h \) of \( \Gamma \), the subgame \( \Gamma(h) \) following the history \( h \) is the extensive game with:

- <strong>Players:</strong> the same players as in \( \Gamma \).
- <strong>Terminal histories:</strong> the set of all sequences \( h' \) of actions such that \( (h, h') \) is a terminal history of \( \Gamma \).
- <strong>Player function:</strong> the player \( P(h, h') \) is assigned to each proper subhistory \( h' \) of a terminal history.
- <strong>Preferences:</strong> each player prefers \( h' \) to \( h'' \) in \( \Gamma(h) \) if and only if she prefers \( (h, h') \) to \( (h, h'') \) in \( \Gamma \).

In words: follow the history \( h \) through the game tree; the subgame \( \Gamma(h) \) is everything that remains below that node. Payoffs are inherited unchanged from \( \Gamma \).

Two important notes. First, the subgame following the <strong>empty history</strong> \( \emptyset \) is the entire game itself. Every other subgame is called a <strong>proper subgame</strong>. Second, the number of subgames equals the number of nonterminal histories, because there is one subgame for each nonterminal history.

For the five-terminal-history game introduced in Section 1 (with player function \( P(\emptyset)=1 \), \( P(A)=2 \), \( P(A,D)=1 \), \( P(B)=2 \), there are four nonterminal histories — \( \emptyset \), \( (A) \), \( (A,D) \), \( (B) \) — and therefore four subgames.

### The Notation \( O_h(s) \)

Before stating the formal definition, we introduce notation for the outcome of a strategy profile within a subgame. Let \( h \) be a history (not necessarily on the path generated by \( s \) and let \( s \) be a strategy profile. Suppose history \( h \) occurs and the players thereafter follow \( s \). Denote by \( O_h(s) \) the resulting terminal history: it consists of \( h \) followed by the path generated by \( s \) in the subgame \( \Gamma(h) \). Note that \( O_\emptyset(s) = O(s) \).

### Formal Definition of SPE

<strong>Definition 166.1.</strong> The strategy profile \( s^* \) in an extensive game with perfect information is a <strong>subgame perfect equilibrium (SPE)</strong> if, for every player \( i \), every history \( h \) after which it is player \( i \)'s turn to move, and every strategy \( r_i \) of player \( i \):

\[
u_i\!\left(O_h(s^<em>)\right) \;\geq\; u_i\!\left(O_h(r_i,\, s^</em>_{-i})\right)
\]

In plain language: in every subgame, the player who moves first at the start of that subgame cannot profitably deviate from \( s^<em> \), given that all other players adhere to \( s^</em> \). Crucially, this must hold in every subgame — not only in subgames that are actually reached under \( s^* \).

A practical implication for checking SPE: you only need to verify that the player who <strong>moves first</strong> in each subgame is acting optimally. Players who move second, third, and so on in a given subgame are themselves moving first in smaller subgames that will be checked separately.

### SPE is a Refinement of NE

Every subgame perfect equilibrium is a Nash equilibrium, but not every Nash equilibrium is a subgame perfect equilibrium. The reasoning for the first direction: one of the subgames is the entire game itself (the subgame following the empty history). So a strategy profile that induces a Nash equilibrium in every subgame certainly induces a Nash equilibrium in the entire game. Hence every SPE is a NE. The converse fails, as the entry game demonstrates.

The set of SPE is a subset of the set of NE:

\[
\text{SPE} \;\subseteq\; \text{NE}
\]

SPE is described as a <strong>refinement</strong> of NE because it retains only those NE that survive the additional requirement of optimality off the equilibrium path.

### Checking SPE in the Entry Game

The entry game has two subgames: the entire game (following \( \emptyset \) and the proper subgame following the history (In), where the incumbent chooses between Acquiesce and Fight.

<strong>Is (Out, Fight) an SPE?</strong> Consider the subgame following history (In). Here the incumbent moves first. Under the strategy profile (Out, Fight), the incumbent is prescribed to Fight. But in this subgame, fighting yields payoff 0 while acquiescing yields payoff 1. The incumbent is not acting optimally. Therefore (Out, Fight) is <strong>not</strong> an SPE.

<strong>Is (In, Acquiesce) an SPE?</strong> Check each subgame:
- Subgame following \( \emptyset \): the challenger moves first and plays In, earning payoff 2. Deviating to Out yields payoff 1. So In is optimal. ✓
- Subgame following (In): the incumbent moves first and plays Acquiesce, earning payoff 1. Deviating to Fight yields payoff 0. So Acquiesce is optimal. ✓

Both subgames check out. Therefore <strong>(In, Acquiesce) is the unique SPE</strong> of the entry game.

### Interpretation: No Empty Threats

Subgame perfect equilibrium can be interpreted in two complementary ways.

The first is that it rules out <strong>empty threats</strong>. A player cannot credibly threaten to take an action off the equilibrium path if, were that node ever reached, the player would prefer to do something else. The incumbent in the entry game cannot credibly threaten to fight because fighting is suboptimal at the moment it would actually be required.

The second interpretation is that of a <strong>robust steady state</strong>. Imagine that each player occasionally makes small mistakes, so that every node in the game is reached with some small positive probability. In such a "perturbed" game, every player must be acting optimally at every node, because every node is sometimes reached. As mistake probabilities shrink to zero, the equilibria that survive are exactly the SPE. Nash equilibria that rest on non-credible off-path strategies do not survive this perturbation.

---

## Section 4: Finding SPE — Methods and Backward Induction

### Three Approaches

There are essentially three methods for finding subgame perfect equilibria.

The first is to convert the extensive game to its strategic form, identify all Nash equilibria, and then check each one to determine whether it induces optimal play in every subgame. This is what we did for the entry game: we found the two NE, then checked each for SPE. This approach is reliable but can be laborious when the number of strategies is large.

The second, and most practical, approach for finite-horizon games is <strong>backward induction</strong>. This is the method we will use in most applications.

The third is to conjecture a strategy profile, verify directly from the SPE definition that every player moves optimally in every subgame, and conclude that the conjectured profile is an SPE. This approach does not rule out other SPE — it merely confirms that one particular profile qualifies. It becomes useful for games with infinite horizons, where the first two methods break down.

### The Backward Induction Procedure

Define the <strong>length</strong> of a subgame to be the length of the longest history in that subgame — in other words, how many periods of play remain from the start of the subgame to the furthest terminal node.

The backward induction procedure is:

1. Find the optimal actions of the players who move at the start of the subgames of <strong>length 1</strong> (the "last" subgames — those immediately preceding terminal nodes). Record these actions.
2. Taking these actions as given, find the optimal actions of the players who move at the start of the subgames of <strong>length 2</strong>. Roll the resulting payoffs back up to the node at the start of the length-2 subgame.
3. Continue working backwards toward the beginning of the game until reaching the subgame of the full game.

At each stage, a player at the start of a subgame knows what will happen in all subsequent subgames (already resolved in earlier steps) and chooses the action that maximises her payoff given this knowledge.

<strong>Uniqueness result.</strong> If at the start of every subgame there is a single optimal action, the procedure identifies a unique SPE. If at the start of some subgame more than one action is optimal (a tie), all optimal actions are consistent with an SPE and the procedure identifies all SPE by considering each case separately.

### Worked Example 1: The Five-Terminal Game (Unique SPE)

Consider the game with payoffs:

- Terminal history \( (A,C) \): payoffs \( (0,1) \)
- Terminal history \( (A,D,F) \): payoffs \( (5,2) \)
- Terminal history \( (A,D,G) \): payoffs \( (1,3) \)
- Terminal history \( (A,D,H) \): payoffs \( (4,4) \)
- Terminal history \( (B,E) \): payoffs \( (1,3) \)

with \( P(\emptyset)=1 \), \( P(A)=2 \), \( P(A,D)=1 \), \( P(B)=2 \).

<strong>Step 1 — Subgames of length 1.</strong> Two subgames have length 1:
- Subgame after \( (A,D) \): Player 1 chooses among \( F \) (payoff 5), \( G \) (payoff 1), \( H \) (payoff 4). Optimal action: \( F \). Roll up payoff \( (5,2) \) to node \( (A,D) \).
- Subgame after \( (B) \): Player 2 has only one action, \( E \). Roll up payoff \( (1,3) \) to node \( (B) \).

<strong>Step 2 — Subgame of length 2.</strong> The subgame after \( (A) \) has length 2. Player 2 chooses between \( C \) (payoff 1 for player 2) and \( D \) (payoff 2 for player 2, from the rolled-up value). Optimal action: \( D \). Roll up payoff \( (5,2) \) to node \( (A) \).

<strong>Step 3 — Subgame of length 3 (entire game).</strong> Player 1 chooses between \( A \) (payoff 5 for player 1) and \( B \) (payoff 1 for player 1). Optimal action: \( A \).

<strong>Unique SPE:</strong> \( (AF,\, DE) \). Player 1 plays \( A \) at the empty history and \( F \) at \( (A,D) \); player 2 plays \( D \) after \( (A) \) and \( E \) after \( (B) \). The terminal history (outcome) generated is \( (A,D,F) \) with payoffs \( (5,2) \).

It is important to keep the SPE strategy profile distinct from the outcome it generates. The strategy profile \( (AF,\,DE) \) specifies what both players would do in every contingency. The outcome \( (A,D,F) \) is merely the path that actually occurs.

We can also verify this directly. Consider whether \( (AF,\,DE) \) is indeed an SPE by checking each subgame:
- Subgame after \( \emptyset \): player 1 plays \( A \) and will earn 5 (the absolute maximum payoff available), so no profitable deviation exists.
- Subgame after \( (A) \): player 2 plays \( D \) and earns 2 versus 1 for playing \( C \). Optimal.
- Subgame after \( (A,D) \): player 1 plays \( F \) and earns 5 versus 1 for \( G \) and 4 for \( H \). Optimal.
- Subgame after \( (B) \): player 2 has only one action. Trivially optimal.

All four subgames check out, confirming \( (AF,\,DE) \) is an SPE.

### Distinguishing NE from SPE

The strategy profile \( (BF,\,CE) \) is also a Nash equilibrium of this game. We can verify: player 1 plays \( B \) at the start and earns payoff 1 (from terminal history \( (B,E) \). If player 1 deviates to \( A \), the path would be \( (A,C) \) (since player 2 is playing \( CE \), meaning they play \( C \) after \( A \), yielding payoff 0. So player 1 has no profitable deviation. Player 2 is playing \( C \) after \( A \), but player 1 never goes to \( A \), so the choice at that node does not affect player 2's payoff. Player 2 has no profitable deviation either. Hence \( (BF,\,CE) \) is a NE.

But \( (BF,\,CE) \) is <strong>not</strong> an SPE. In the subgame after history \( (A) \), player 2 moves first and is prescribed to play \( C \), earning payoff 1. But deviating to \( D \) (given player 1 would subsequently play \( F \) yields payoff 2. Player 2 has a profitable deviation in this subgame. Therefore \( (BF,\,CE) \) fails the SPE condition — it rests on player 2's implicit "threat" to play \( C \) after \( A \), which player 2 would never actually carry out.

### Worked Example 2: A Game with Multiple SPE

Consider a game where player 1 moves first and chooses among \( C \), \( D \), and \( E \). Following \( C \) and \( D \), player 2 makes further choices; following \( E \), player 2 makes a different choice. Specifically:

- After \( C \), player 2 chooses between \( F \) (payoffs \( (3,0) \) and \( G \) (payoffs \( (3,0) \) — player 2 is indifferent.
- After \( D \), player 2 chooses between \( H \) (payoffs \( (1,1) \) and \( I \) (payoffs \( (2,1) \) — player 2 is again indifferent.
- After \( E \), player 2 chooses between \( J \) (payoffs \( (2,2) \) and \( K \) (payoffs \( (1,3) \) — player 2 strictly prefers \( K \).

<strong>Step 1.</strong> In the three subgames of length 1, we determine player 2's optimal play. After \( E \), player 2 strictly prefers \( K \) (payoff 3 > 2), so \( K \) is the unique optimal action there. After \( C \), player 2 is indifferent between \( F \) and \( G \) (both give payoff 0). After \( D \), player 2 is indifferent between \( H \) and \( I \) (both give payoff 1).

Since player 2 is indifferent in two of the three length-1 subgames, all four combinations — \( FHK \), \( FIK \), \( GHK \), \( GIK \) — are consistent with an SPE. We must consider each.

<strong>Step 2 — Case (FHK):</strong> Roll up payoffs to player 1's initial node. Player 1 earns 3 from \( C \), 1 from \( D \), 1 from \( E \). Optimal: \( C \). SPE: \( (C,\,FHK) \).

<strong>Step 2 — Case (FIK):</strong> Player 1 earns 3 from \( C \), 2 from \( D \), 1 from \( E \). Optimal: \( C \). SPE: \( (C,\,FIK) \).

<strong>Step 2 — Case (GIK):</strong> Player 1 earns 3 from \( C \), 2 from \( D \), 1 from \( E \). Wait — after \( C \) with player 2 playing \( G \), player 1 earns 3; after \( D \) with player 2 playing \( I \), player 1 earns 2; after \( E \), player 1 earns 1. Optimal: \( D \)... actually let us re-read: after \( C \) with \( G \), payoff to player 1 is 3... but wait — let us use the payoffs as given in the slide: after \( C \) the payoffs for \( F \) and \( G \) both give player 1 a payoff of 3 (from the rolled-up value 3,0 and 3,0). After \( D \), playing \( H \) gives player 1 payoff 1 and playing \( I \) gives player 1 payoff 2. After \( E \), playing \( K \) gives player 1 payoff 1. For case (GIK): player 1's payoffs are 3 from \( C \), 2 from \( D \), 1 from \( E \). Optimal: \( C \). But hold on — let us read the slides carefully: for GIK, player 1's payoffs at the top are listed as 1, 0, 1, 1. Actually, looking at slide 47: for case (GIK), after rolling up, player 1's payoffs are 1 from \( C \), 2 from \( D \), 1 from \( E \). (The G action in the C-branch gives player 1 payoff 1, not 3.) So optimal for player 1: \( D \). SPE: \( (D,\,GIK) \).

<strong>Step 2 — Case (GHK):</strong> After rolling up: player 1 earns 1 from \( C \), 1 from \( D \), 1 from \( E \). Player 1 is indifferent among all three actions. All are consistent with SPE, giving three more equilibria: \( (C,\,GHK) \), \( (D,\,GHK) \), and \( (E,\,GHK) \).

The game therefore has <strong>six subgame perfect equilibria</strong> in total:

\[
(C,\,FHK),\quad (C,\,FIK),\quad (D,\,GIK),\quad (C,\,GHK),\quad (D,\,GHK),\quad (E,\,GHK)
\]

This example illustrates the general rule: whenever backward induction reveals a player indifferent between actions at some node, every combination of those optimal actions — together with the optimal continuations in all other subgames — constitutes a distinct SPE.

---

## Section 5: The One-Deviation Property

A powerful tool for verifying SPE in more complex games (including infinite-horizon games where backward induction cannot be applied directly) is the <strong>one-deviation property</strong>. It states that a strategy profile \( s^<em> \) is a subgame perfect equilibrium if and only if no player can profitably deviate at any single history while following \( s^</em> \) everywhere else — including everywhere else in the continuation after that history.

More precisely: \( s^<em> \) is an SPE if and only if there is no player \( i \) and no history \( h \) after which it is player \( i \)'s turn to move such that player \( i \) can gain by choosing a different action at \( h \) alone — while adhering to \( s^</em>_i \) at all subsequent histories and while all other players follow \( s^*_{-i} \).

The value of the one-deviation property is that it reduces the SPE verification problem to a collection of local, one-step deviations. Rather than comparing a player's strategy in a subgame against every possible alternative strategy in that subgame (which can be a vast set), it suffices to check that no single-action deviation is profitable at any individual history. This makes the property particularly useful when strategies must be verified in infinite-horizon settings, where "every alternative strategy" is an uncountably infinite object.

---

## Summary

This chapter extended our toolkit from strategic games to <strong>extensive games</strong>, which capture the sequential structure of decision-making. The four components of an extensive game — players, terminal histories, player function, and preferences — together with the notion of a strategy as a complete contingency plan, provide a precise and flexible model.

The <strong>Nash equilibrium</strong> concept carries over directly via the strategic form: the NE of an extensive game are exactly the NE of its strategic form. However, NE may include equilibria resting on non-credible off-path threats, as the entry game's (Out, Fight) equilibrium demonstrated.

<strong>Subgame perfect equilibrium</strong> refines NE by requiring optimal play in every subgame, not just along the equilibrium path. SPE eliminates equilibria based on empty threats and corresponds to robust steady states in which even occasional mistakes do not destabilise equilibrium behaviour. Every SPE is a NE, but the converse fails.

<strong>Backward induction</strong> provides the practical algorithm for finding SPE in finite-horizon games: solve from the last subgames forward, rolling up optimal payoffs at each stage. When each node has a unique optimal action, backward induction yields a unique SPE. When ties occur, all optimal combinations must be considered, and backward induction finds all SPE. The <strong>one-deviation property</strong> extends SPE verification to settings where backward induction is unavailable.

---

# Chapter 12: Stackelberg Duopoly

## Sequential Quantity Competition

Cournot's model assumes firms set quantities simultaneously. In many markets, one firm commits first — perhaps through public announcements, capacity investments, or simply by being an incumbent. The <strong>Stackelberg model</strong> captures this sequential structure: Firm 1 (the leader) chooses its output first, then Firm 2 (the follower) observes Firm 1's output and responds.

This is the Cournot game played as an extensive game. The player function is \(P(\emptyset) = 1\) and \(P(q_1) = 2\) for all \(q_1 \geq 0\). Firm 1's strategy is simply an output level \(q_1\). Firm 2's strategy is a function \(b_2 : \mathbb{R}_+ \to \mathbb{R}_+\) mapping any possible Firm 1 output to Firm 2's response.

The game has a finite horizon; we find the SPE by backward induction.

## Firm 2's Best Response

In the subgame following history \(q_1\), Firm 2 maximizes its profit:

\[
\pi_2(q_1, q_2) = q_2(\alpha - c - q_1 - q_2)
\]

This is exactly the Cournot best response problem. The solution is:

\[
b_2(q_1) = \frac{1}{2}(\alpha - c - q_1) \quad \text{for } q_1 \leq \alpha - c
\]

In any SPE, Firm 2's strategy is this function \(b_2\).

## Firm 1's Optimal Output

Given that Firm 2 will use strategy \(b_2\), Firm 1 substitutes to find its own optimal output. Firm 1's effective profit is:

\[
\pi_1 = q_1 \cdot (\alpha - c - q_1 - b_2(q_1)) = q_1\left(\alpha - c - q_1 - \frac{\alpha - c - q_1}{2}\right) = \frac{1}{2}q_1(\alpha - c - q_1)
\]

Maximizing over \(q_1\):

\[
\frac{d\pi_1}{dq_1} = \frac{1}{2}(\alpha - c - 2q_1) = 0 \implies q_1^* = \frac{1}{2}(\alpha - c)
\]

Firm 2 then produces \(q_2^<em> = b_2(q_1^</em>) = \frac{1}{4}(\alpha - c)\).

## Comparing Cournot and Stackelberg

The SPE of the Stackelberg game generates strictly different quantities than the Nash Equilibrium of the Cournot game:

<table>
  <thead>
    <tr>
      <th></th>
      <th>Cournot Output</th>
      <th>Cournot Profit</th>
      <th>Stackelberg Output</th>
      <th>Stackelberg Profit</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Firm 1 (Leader)</th>
      <td>\(\frac{1}{3}(\alpha-c)\)</td>
      <td>\(\frac{(\alpha-c)^2}{9}\)</td>
      <td>\(\frac{1}{2}(\alpha-c)\)</td>
      <td>\(\frac{(\alpha-c)^2}{8}\)</td>
    </tr>
    <tr>
      <th>Firm 2 (Follower)</th>
      <td>\(\frac{1}{3}(\alpha-c)\)</td>
      <td>\(\frac{(\alpha-c)^2}{9}\)</td>
      <td>\(\frac{1}{4}(\alpha-c)\)</td>
      <td>\(\frac{(\alpha-c)^2}{16}\)</td>
    </tr>
  </tbody>
</table>

The leader produces more and earns more; the follower produces less and earns less. This is the <strong>first-mover advantage</strong>. The intuition: by committing to a large quantity, Firm 1 forces Firm 2 into a less favourable position on its best response function. Firm 2, knowing Firm 1's large output, must respond with a smaller quantity. Firm 1 exploits this strategic response.

## Commitment Value

Crucially, in the Stackelberg SPE, Firm 1 is not playing a best response to Firm 2's equilibrium output \(q_2^<em>\). The Cournot best response to \(q_2^</em> = \frac{1}{4}(\alpha-c)\) would call for Firm 1 to produce \(b_1(q_2^<em>) = \frac{3}{8}(\alpha-c)\), less than \(q_1^</em> = \frac{1}{2}(\alpha-c)\). Why does Firm 1 overproduce? Because it is playing a best response not to Firm 2's equilibrium <em>output</em>, but to Firm 2's equilibrium <em>strategy</em> \(b_2\). Firm 1 knows that any increase in its output will cause Firm 2 to reduce its output. The value of moving first comes entirely from the ability to <strong>commit</strong>: Firm 1's output choice in period 1 cannot be revised after Firm 2 responds.

If Firm 1 could freely revise its output after seeing Firm 2's response, the game would collapse to Cournot — the first-stage choice would be irrelevant. The first-mover advantage is generated by <em>credible commitment</em>.


## Firm-Union Bargaining

Backward induction finds natural application in labor economics. Consider a simple model of wage negotiation between a **union** and a **firm**. The union moves first, demanding a wage \(w \geq 0\). The firm observes the demand and either **accepts** or **rejects**. If the firm rejects, both parties receive a payoff of 0 (the factory shuts down, no production occurs). If the firm accepts, it hires \(L\) workers at wage \(w\) per worker and produces output \(f(L)\), where \(f\) is an increasing, concave production function. The firm's profit is \(f(L) - wL\) and the union's payoff is \(wL\) (total wages paid to its members).

To find the **subgame perfect equilibrium**, we apply backward induction. At the second stage, the firm accepts the demand \(w\) if and only if \(f(L) - wL \geq 0\), i.e., \(w \leq f(L)/L\). The critical threshold is the **average product of labor**, \(f(L)/L\). Any wage demand at or below this level leaves the firm with non-negative profit, so it accepts. Any demand above it makes the firm prefer shutdown.

The union, anticipating this, chooses the highest wage the firm will accept: \(w^* = f(L)/L\). At this wage, the firm is exactly indifferent between accepting and rejecting, and (by convention, or by the union shading its demand down by an infinitesimal amount) the firm accepts. The SPE outcome is:

\[
w^* = \frac{f(L)}{L}, \quad \text{firm accepts}, \quad \pi_{\text{firm}} = 0, \quad \pi_{\text{union}} = f(L).
\]

The union extracts **all the surplus**. This is a direct analogue of the ultimatum game: the proposer (union) captures the entire pie because the responder (firm) is indifferent between accepting and rejecting the most aggressive feasible offer. The result depends critically on the structure of the game — the union has all the bargaining power because it moves first and the firm has no opportunity to make a counteroffer.

In practice, of course, bargaining rarely gives one side everything. Introducing **counteroffers** — the firm can reject and propose an alternative wage, then the union can accept or reject, and so on — changes the game fundamentally. As we will see in the Rubinstein bargaining model in the next chapter, the division of surplus in a counteroffer game depends on the players' relative patience (discount factors). The more patient party captures a larger share. The firm-union model with a single take-it-or-leave-it offer is the limiting case where the proposer is infinitely patient relative to the responder (see Osborne, Problem 177.1).

## Sequential Bertrand Duopoly

In Chapter 12 we saw how moving from simultaneous to sequential quantity competition (Cournot to Stackelberg) gave the first mover a strategic advantage. Does the same logic apply to **price competition**? The answer, perhaps surprisingly, is no.

Consider two firms producing a homogeneous product with identical constant marginal cost \(c\) and facing a linear demand function \(Q = \alpha - p\) (with \(\alpha > c\)). In the **sequential Bertrand** game, Firm 1 sets a price \(p_1\) first. Firm 2 observes \(p_1\) and then sets \(p_2\). Consumers buy from the cheapest firm (splitting equally if prices are tied).

We solve by backward induction. **Firm 2's best response** given \(p_1\):
- If \(p_1 > c\): Firm 2 undercuts slightly, setting \(p_2 = p_1 - \epsilon\) for infinitesimally small \(\epsilon > 0\), capturing the entire market at a price above cost. Firm 2's profit is approximately \((p_1 - c)(\alpha - p_1) > 0\).
- If \(p_1 = c\): Firm 2 sets \(p_2 = c\) (or any \(p_2 \geq c\)), earning zero profit either way.
- If \(p_1 < c\): Firm 2 sets \(p_2 = c\) (or above), conceding the market to Firm 1 who is selling below cost.

**Firm 1's problem**: Firm 1 anticipates that any price \(p_1 > c\) will be undercut, giving Firm 1 zero sales and zero profit. Setting \(p_1 < c\) yields negative profit. Setting \(p_1 = c\) yields zero profit. Therefore Firm 1's best strategy is \(p_1 = c\), and Firm 2 responds with \(p_2 = c\). The **subgame perfect equilibrium** is \((p_1^*, p_2^*) = (c, c)\) — the same outcome as the simultaneous Bertrand equilibrium. Sequentiality provides **no first-mover advantage**.

The contrast with the Cournot-to-Stackelberg transition is instructive. In quantity competition, quantities are **strategic substitutes**: when Firm 1 increases output, Firm 2's best response is to decrease output. The first mover exploits this by committing to a large quantity, knowing the follower will accommodate by producing less. In price competition, prices are **strategic complements**: when Firm 1 raises its price, Firm 2's best response is to raise its price too (or in the homogeneous-good case, to undercut by just enough). The follower does not accommodate the leader — it exploits any price above cost by undercutting. Commitment to a high price is not valuable because it invites undercutting rather than matching.

This result underscores a general principle in sequential games: **first-mover advantage depends on the nature of strategic interaction**, not merely on the order of moves. When the follower's best response is to reduce its own action (strategic substitutes), the leader benefits from moving first. When the follower's best response is to match or slightly undercut (strategic complements), sequentiality confers no advantage — and may even be a disadvantage if the leader's choice is publicly observed before it can be revised (see Osborne, Problem 192.1).

---

# Chapter 13: Bargaining

Bargaining — the process by which two or more parties divide a surplus — is ubiquitous in economic life. Bert and Ernie haggling over cookies, a buyer and seller negotiating the price of a car, a business owner and workers dividing revenues, trade representatives hammering out a tariff schedule, streaming services and artists arguing over royalties: in every case there are gains to be had from agreeing, and the question is how those gains are split. Before sitting down at any bargaining table it helps to know what game theory predicts, how much you are likely to get, and whether you can change the structure of the game if you do not like the answer. This chapter develops the theory of bargaining from the ground up, beginning with the starkest possible model and progressively enriching it until we arrive at Rubinstein's landmark infinite-horizon result.

A useful preliminary distinction is between <strong>bargaining</strong> and <strong>negotiations</strong>. Bargaining is about splitting an existing pie — there is a winner and a loser. Negotiations, by contrast, are about making the pie as large as possible and then splitting it, so all parties can win. The two are often confused, and you would be surprised how often what looks like a bargaining problem turns into a negotiation if you get creative.

---

## Section 13.1: The Ultimatum Game

### The Game

Suppose you are in a class and the instructor offers to give away five dollars. You are paired with another student. You decide how much of the five dollars to offer your partner. If they accept, you each keep what was agreed. If they reject the offer, the instructor takes the money back and neither of you receives anything. There are no counteroffers — you make one proposal, your partner says yes or no, and the game is over. Because you can make a single ultimatum and your partner must either accept or walk away empty-handed, this is called the <strong>ultimatum game</strong>.

In more general terms, two players use the following procedure to split an amount \( c \). Person 1 offers Person 2 an amount \( x \), where \( 0 \leq x \leq c \). If Player 2 accepts, Player 1 keeps \( c - x \) and Player 2 keeps \( x \). If Player 2 rejects, both players receive zero.

Formally this is an extensive game with the following four elements. The <strong>players</strong> are the two people. The <strong>terminal histories</strong> are all sequences of the form \( (x, Z) \), where \( x \in [0,c] \) and \( Z \in \{Y, N\} \) — that is, any offer followed by either acceptance or rejection. Note that \( x \) is continuous: it need not be a whole number of cents, and this matters for the analysis. The <strong>player function</strong> assigns Player 1 to the empty history (the opening node) and assigns Player 2 to the decision node following any offer \( x \). The <strong>preferences</strong> are given by monetary payoffs: following the terminal history \( (x, Y) \), Player 1 receives \( c - x \) and Player 2 receives \( x \); following any history \( (x, N) \), both receive zero.

Although the game tree is infinitely wide — there is an infinite number of possible offers — it can be represented with a shaded triangular area from the opening node, with a single representative branch labelled \( x \) indicating that Player 2 faces a binary choice (Y or N) after any offer.

### Solving by Backward Induction

This game has a finite horizon (the longest possible history has length two), so we can apply backward induction. We begin with the <strong>subgames of length one</strong> — the nodes where Player 2 must accept or reject some offer \( x \).

If Player 2 is offered \( x > 0 \), accepting yields \( x \) while rejecting yields \( 0 \). The strictly dominant action is to accept. If Player 2 is offered exactly \( x = 0 \), she is indifferent: she gets zero whether she accepts or rejects. This indifference means two strategies of Player 2 are consistent with optimality in these length-one subgames: Strategy A — accept all offers including zero; and Strategy B — accept any offer \( x > 0 \) but reject the offer of zero.

Working back to the opening node, we ask what Player 1 would optimally offer under each of these two cases for Player 2.

If Player 2 is using Strategy A (accept everything), Player 1's optimal offer is \( x = 0 \), keeping the entire pie.

If Player 2 is using Strategy B (reject zero, accept any positive offer), Player 1 faces a problem. She would like to offer the smallest positive amount, but because \( x \) is continuous, no such smallest positive number exists. For any candidate offer \( \epsilon > 0 \), Player 1 could do better by offering \( \epsilon/2 \), and then \( \epsilon/4 \), and so on. Player 1 has no optimal offer under Strategy B, so no subgame perfect equilibrium exists in this case.

The <strong>unique subgame perfect equilibrium</strong> of the ultimatum game is therefore the strategy pair in which Player 1 offers \( 0 \) and Player 2 accepts all offers. The equilibrium payoffs are \( (c, 0) \) — Player 1 keeps the entire pie.

The lesson is stark: whoever can make a credible take-it-or-leave-it offer holds all the bargaining power. This has a direct real-world implication. If you are buying a car, one way to put yourself in the position of the ultimatum-maker is to send a written offer — by email or fax — to multiple dealerships and state that this is your maximum willingness to pay. If they want your business, they can call; otherwise you will go elsewhere. You have, in effect, made an ultimatum.

### Experimental Evidence

Theory predicts that Player 1 should offer zero, or close to it. Laboratory experiments tell a different story.

In practice, offerers typically propose close to a fifty-fifty split, and responders reject low but positive offers at surprisingly high rates. Responders seem willing to sacrifice a payoff in order to punish an offer they perceive as unfair. This behaviour is inconsistent with pure monetary self-interest but consistent with preferences for <strong>fairness</strong> or <strong>reciprocity</strong>, and has made the ultimatum game a central workhorse of behavioural economics. Understanding where rational game theory succeeds and where social preferences cause deviations is one of the central questions in the discipline.

Despite this divergence between theory and experiment, the ultimatum game remains important for two reasons. First, it models take-it-or-leave-it offers that genuinely occur in real life — understanding the logic clarifies the distribution of power. Second, and more important for what follows, it is a <strong>building block</strong> for richer models of bargaining where players can make counteroffers. Every model we study in the rest of this chapter uses the ultimatum game as its foundation.

---

## Section 13.2: The Holdup Problem

### Setup

The ultimatum game teaches us that the ability to make a credible take-it-or-leave-it offer is enormously valuable. This has a disturbing implication when one party must invest <em>before</em> the pie is divided.

Consider an ultimatum game that is preceded by a stage in which Player 2 takes an action that affects the size \( c \) of the pie subsequently divided. Player 2 can exert <strong>low effort</strong>, producing a small pie of size \( c_L \), or <strong>high effort</strong>, producing a large pie of size \( c_H \). Because effort is costly, Player 2's payoff is \( x - L \) if she chooses low effort and \( x - H \) if she chooses high effort, where \( H > L \) and \( x \) is whatever she receives from Player 1's offer. After Player 2 commits to an effort level, Player 1 observes this choice and then proposes how to divide the resulting pie. Player 2 can then accept or reject exactly as in the ultimatum game.

The game tree branches first on Player 2's effort choice (L or H), then on Player 1's offer (any \( x \) between zero and \( c_L \) or \( c_H \) as appropriate), and finally on Player 2's accept/reject decision. This game is infinitely wide, since Player 1 can make any offer on a continuum, but it has a finite horizon of length three, so backward induction applies.

### Backward Induction

We start at the end. The <strong>subgames of length one</strong> are Player 2's accept/reject decisions following any offer by Player 1. We have already solved this game: these are just ultimatum subgames, and Player 2 has two candidate strategies on each branch — accept all offers, or accept any strictly positive offer and reject zero. Because the effort choice was made on the left branch (low effort) and the right branch (high effort) independently, this gives Player 2 four possible strategy combinations across the two branches.

Moving to the <strong>subgames of length two</strong> — Player 1's offer decisions after observing the effort level — we apply the same logic as in the ultimatum game. If Player 2 is accepting all offers on a given branch, Player 1 optimally offers zero. If Player 2 is rejecting zero on a given branch, Player 1 has no optimal offer (the continuity argument applies). Therefore, the only way to find a subgame perfect equilibrium is for Player 2 to accept all offers on both branches, and for Player 1 to offer zero on both branches.

Knowing this, we now look at the <strong>subgame of length three</strong> — the entire game, including Player 2's initial effort choice. If Player 2 chooses low effort, the continuation gives her a payoff of \( 0 - L = -L \). If she chooses high effort, the continuation gives her \( 0 - H = -H \). Since \( H > L \), Player 2 strictly prefers to choose low effort.

The <strong>unique SPE of the holdup game</strong> is: Player 1 offers zero after both the history L and the history H; Player 2 chooses low effort at the start, and accepts all offers whatever the effort level. The outcome is that Player 2 exerts low effort, Player 1 offers zero, and Player 2 accepts.

### Why This Is Economically Dismal

This result is troubling for two distinct reasons. It is distributively unfair — Player 2 bears all the costs while Player 1 captures all the surplus — but it is also <strong>inefficient</strong>. Even in cases where it would be socially optimal for Player 2 to exert high effort, she will not do so, because she anticipates that once the effort is sunk, Player 1 can extract all the gains. The result holds even when \( c_H \) is vastly larger than \( c_L \) and the cost difference between high and low effort is only a tiny \( \epsilon \). The economy loses all those gains simply because of the bargaining structure.

Nor does the problem require such an extreme split. Even if the pie is divided fifty-fifty, a player who must invest knowing that half the benefits will accrue to her counterpart may underinvest or not invest at all. The <strong>holdup problem</strong> — the general phenomenon of underinvestment driven by the fear of expropriation after costs are sunk — is one of the most important concepts in economics. It explains reluctance to invest in relationship-specific assets without contractual protection, problems in joint ventures and long-term supplier relationships, and difficulties in employment relationships when workers must acquire firm-specific skills.

### Application: Patent Trolls

One of the most striking real-world examples of holdup involves <strong>patent trolls</strong> — entities that hold patents solely for the purpose of holding up other firms. Patent trolls (formally called <strong>non-practicing entities</strong>) accumulate as many patents as possible, often vaguely worded ones that cast a wide net, but never use those patents to create products. Instead, they wait in the bushes while entrepreneurs invest in developing a product, building a market, and generating revenues. Once those investments are sunk and cannot be taken back, the patent troll steps forward and claims infringement, threatening a court injunction that would force the entrepreneur out of the market entirely.

The parallel with the holdup game is exact. The entrepreneur is Player 2, making an effort investment (product development, marketing, distribution) that creates a large pie. The patent troll is Player 1, making a take-it-or-leave-it ultimatum after the investment has been made: pay a large fraction of the value you have created, or lose the right to operate in this market. The crappier and more vaguely written the patent, the more firms it might plausibly cover, and the more valuable it is to the troll — not for production, but for holdup.

A prominent example involved <strong>NTP Inc.</strong> and <strong>Research In Motion (RIM)</strong>, the maker of the BlackBerry. NTP held a patent on the concept of pushing emails to mobile devices. RIM's BlackBerry did precisely that, and it had become the dominant mobile email device in the United States market after enormous investments in product development, manufacturing, marketing, and distribution. Once all those investments were sunk, NTP filed suit and obtained a threatened injunction that would have forced BlackBerry off the US market until the case was resolved — a process that could have taken years. RIM was held up. Rather than face market exit, they paid a ransom settlement. From the point of view of game theory, it was a classic SPE outcome: anticipating the injunction threat, and with investments already made, paying was rational.

The holdup problem is not merely academic. When advising on the intellectual property chapter of the renegotiated NAFTA agreement, the insight from this analysis mattered directly: even entrepreneurs with genuinely valuable ideas may rationally decline to develop them if they anticipate being held up by a patent troll. The solution — if one exists — typically involves contracting around the holdup problem before investments are made, though this is not always possible.

---

## Section 13.3: Bargaining with Counteroffers and Discounting

### Why Counteroffers Alone Are Not Enough

The ultimatum game is one-sided because Player 2 has no outside option except outright rejection with a payoff of zero. A natural remedy is to allow Player 2 to make a <strong>counteroffer</strong> if she rejects Player 1's proposal, and to allow Player 1 to counteroffer in turn, and so on. Does this produce a more balanced outcome?

Without discounting the answer is no. Consider a two-period game: Player 1 proposes in Period 1; if rejected, Player 2 proposes in Period 2; if that is also rejected, both receive zero. Working backward: in Period 2, Player 2 is in the position of an ultimatum-maker and keeps the whole pie, proposing \( (0, 1) \). Moving back to Period 1, Player 1 knows that rejecting any offer leads to Player 2 taking everything in Period 2, so Player 1 will accept any non-negative offer. Player 2 therefore prefers to have the game reach Period 2, and Player 1 must offer everything to Player 2 or risk rejection. In any SPE without discounting, the player who makes the last offer keeps the entire pie. Adding more rounds simply shifts this advantage to whoever has the last move. The conclusion is general: regardless of the number of periods, the last proposer gets everything.

### Adding Time Discounting

The key ingredient for a balanced outcome is <strong>time discounting</strong>. Receiving the pie next period is worth less than receiving it today. Formally, Player \( i \) has a <strong>discount factor</strong> \( \delta_i \in (0, 1) \): she regards obtaining a payoff of 1 after a one-period delay as equivalent to obtaining \( \delta_i \) today. A smaller \( \delta_i \) means greater impatience. We normalise the pie to size 1, so a <strong>proposal</strong> is a pair \( x = (x_1, x_2) \) with \( x_1 + x_2 = 1 \) and \( x_i \geq 0 \).

<strong>Two periods with discounting.</strong> Player 1 proposes in Period 1; if rejected, Player 2 proposes in Period 2; if rejected again, both get zero, but now Period 2 payoffs are discounted. In Period 2, Player 2 is again the ultimatum-maker and proposes \( y = (0, 1) \), keeping the whole pie. From the perspective of Period 1, this proposal is worth \( (\delta_1 \cdot 0,\, \delta_2 \cdot 1) = (0, \delta_2) \) to the two players. Player 2 will therefore only accept Player 1's Period-1 offer if she receives at least \( \delta_2 \). Player 1 optimally offers exactly \( \delta_2 \) to Player 2, keeping \( 1 - \delta_2 \) for herself. The SPE outcome is the proposal \[ x = (1 - \delta_2,\; \delta_2), \] which Player 2 accepts in Period 1. Player 2's impatience — the fact that she discounts the future — is what gives Player 1 a strictly positive payoff. Player 2's threat to reject is only credible if she is offered less than \( \delta_2 \), so Player 1 never needs to offer more.

<strong>Three periods with discounting.</strong> Now Player 1 proposes in Period 1, Player 2 counter-proposes in Period 2 if rejected, and Player 1 counter-proposes in Period 3 if rejected again. Any subgame starting in Period 2 is a two-period discounted bargaining game with Player 2 as first proposer, which we have just solved. In that subgame, Player 2 offers \( (\delta_1, 1 - \delta_1) \) and Player 1 accepts. From the perspective of Period 1, if Player 1's opening offer is rejected, the continuation payoffs are \( (\delta_1^2,\; \delta_2(1-\delta_1)) \). Player 2 will accept Player 1's Period-1 offer only if it gives her at least \( \delta_2(1 - \delta_1) \). Player 1 therefore offers exactly that, keeping \[ x_1 = 1 - \delta_2(1 - \delta_1). \] The three-period SPE outcome is \( x = (1 - \delta_2(1-\delta_1),\; \delta_2(1-\delta_1)) \).

### The Pattern as Periods Increase

Extending this backward induction to \( n \) periods generates a recursive pattern in Player 2's equilibrium payoff. The table below, reproduced from the slides for the two discount-factor cases \( \delta_1 = \delta_2 = 0.9 \) and \( \delta_1 = \delta_2 = 0.5 \), illustrates the convergence.

| \( n \) | Player 2 payoff (formula) | \( \delta=0.9 \) | \( \delta=0.5 \) |
|---|---|---|---|
| 1 | \( 0 \) | 0 | 0 |
| 2 | \( \delta_2 \) | 0.9 | 0.5 |
| 3 | \( \delta_2(1-\delta_1) \) | 0.09 | 0.25 |
| 4 | \( \delta_2(1-\delta_1(1-\delta_2)) \) | 0.819 | 0.375 |
| 5 | \( \delta_2(1-\delta_1(1-\delta_2(1-\delta_1))) \) | 0.181 | 0.281 |
| 6 | \( \delta_2(1-\delta_1(1-\delta_2(1-\delta_1(1-\delta_2)))) \) | 0.753 | 0.344 |

Two trends are visible. First, the player who makes the last offer still benefits — Player 2's payoff oscillates depending on whether the final period belongs to her. Second, and crucially, this last-offer advantage <strong>shrinks</strong> as the number of rounds increases. With \( \delta = 0.9 \) the oscillations are wild and slow to converge, while with \( \delta = 0.5 \) they dampen faster. As \( n \to \infty \), the payoffs converge to a limit that no longer depends on who has the last offer — and that limit is precisely what the infinite-horizon model delivers.

It is also worth asking whether it is realistic to suppose that a bargaining session has a hard deadline. In most real negotiations, if the current round collapses, the parties can simply resume the next day. Removing any artificial deadline is the motivation for moving to the infinite-horizon model.

---

## Section 13.4: Infinite Horizon Bargaining — The Rubinstein Model

### Defining the Game

The <strong>Bargaining Game of Alternating Offers</strong>, developed by Ariel Rubinstein (and textbook author Martin Osborne is co-credited for this strand of work), removes the deadline entirely. The formal extensive game has the following elements.

<strong>Players:</strong> two people, Player 1 and Player 2.

<strong>Terminal histories:</strong> any sequence of the form \( (x^1, N, x^2, N, \ldots, x^t, Y) \) for \( t \geq 1 \), where each \( x^r = (x^r_1, x^r_2) \) is a division of the pie (two numbers summing to 1), together with the infinite sequence \( (x^1, N, x^2, N, x^3, N, \ldots) \) of perpetual disagreement.

<strong>Player function:</strong> \( P(\emptyset) = 1 \) (Player 1 opens). After the history \( (x^1, N, \ldots, x^t) \), it is Player 1's turn to respond if \( t \) is even and Player 2's turn if \( t \) is odd. After a rejection appended to such a history, the same assignment determines who makes the next proposal.

<strong>Preferences:</strong> if agreement \( x^t \) is reached in period \( t \), player \( i \) receives \( \delta_i^{t-1} x_i^t \), where \( \delta_i \in (0,1) \) is her discount factor. The infinite disagreement history gives both players a payoff of zero, since the discount factors drive any delayed payoff to zero in the limit.

### Why Backward Induction Fails

We cannot apply backward induction here: the game has no finite horizon, no last period from which to work backwards. We also cannot convert to the strategic form and look for Nash equilibria, because each player has infinitely many strategies (specifying an action at each of infinitely many information sets). We are left with what might be called the "half method": make an educated guess about what a subgame perfect equilibrium looks like, and then verify that the guess is correct.

### Stationarity

The key structural feature of this game is that it is <strong>stationary</strong>: every subgame that begins with Player 1 making a proposal is identical to every other such subgame (same players, same terminal histories, same player function, same preferences). The same holds for all subgames beginning with Player 2's proposal, and for all subgames beginning with a response to a given offer. Because the game looks the same every time a player is in the same situation, it is reasonable to conjecture that the SPE involves players using <strong>stationary strategies</strong> — always making the same proposal when it is their turn to propose, and always applying the same acceptance cutoff when it is their turn to respond.

A stationary strategy for Player 1 is therefore specified by two objects: the proposal \( x^<em> = (x_1^</em>, x_2^<em>) \) that she always makes, and the cutoff \( y_1^</em> \) such that she accepts any offer \( y \) from Player 2 if and only if \( y_1 \geq y_1^<em> \). Similarly, Player 2's stationary strategy is specified by the proposal \( y^</em> = (y_1^<em>, y_2^</em>) \) she always makes and the cutoff \( x_2^<em> \) such that she accepts \( x \) if and only if \( x_2 \geq x_2^</em> \).

### Deriving the Equilibrium

From finite-horizon games we know that in every SPE, every proposal is accepted immediately. We conjecture the same holds here, which means the proposer never offers more than the other player's cutoff — offering strictly more would be leaving money on the table. This pins down:

\[
x_2^<em> = w_2^</em> \quad \text{and} \quad z_1^<em> = y_1^</em>,
\]

where \( w_2^<em> \) is Player 2's acceptance cutoff and \( z_1^</em> \) is the share Player 2 offers to Player 1. After substituting, we need to find only \( x_1^<em>, x_2^</em>, y_1^<em>, y_2^</em> \).

Consider the <strong>subgame starting with Player 2 responding</strong> to Player 1's proposal \( x \). If Player 2 rejects, her stationary strategy calls for her to propose \( y^<em> \), which Player 1 accepts (since what Player 2 offers Player 1 exactly equals Player 1's cutoff \( y_1^</em> \). So rejecting yields Player 2 a payoff of \( y_2^<em> \), but with a one-period delay, worth \( \delta_2 y_2^</em> \) today. Player 2 will reject if offered less than \( \delta_2 y_2^* \). For Player 1 to optimally offer exactly Player 2's cutoff:

\[
x_2^<em> = \delta_2 y_2^</em>.
\]

By a symmetric argument, considering the <strong>subgame starting with Player 1 responding</strong> to Player 2's proposal, Player 1 will reject if offered less than \( \delta_1 x_1^* \) (the discounted value of what Player 1 gets next period after Player 2 rejects and the game continues with Player 1 proposing). Player 2 therefore offers exactly:

\[
y_1^<em> = \delta_1 x_1^</em>.
\]

We now have <strong>four equations in four unknowns</strong>:

\[
\begin{aligned}
x_2^<em> &amp;= \delta_2\, y_2^</em> \\
y_1^<em> &amp;= \delta_1\, x_1^</em> \\
x_1^<em> + x_2^</em> &amp;= 1 \\
y_1^<em> + y_2^</em> &amp;= 1
\end{aligned}
\]

Solving these simultaneously yields the unique solution:

\[
x_1^<em> = \frac{1 - \delta_2}{1 - \delta_1\delta_2}, \qquad x_2^</em> = \frac{\delta_2(1-\delta_1)}{1-\delta_1\delta_2},
\]

and correspondingly:

\[
y_1^<em> = \frac{\delta_1(1-\delta_2)}{1-\delta_1\delta_2}, \qquad y_2^</em> = \frac{1 - \delta_1}{1 - \delta_1\delta_2}.
\]

<strong>Proposition 471.3.</strong> <em>The bargaining game of alternating offers has a unique subgame perfect equilibrium. In it, Player 1 always proposes \( x^</em> \) and accepts any offer \( y \) such that \( y_1 \geq y_1^<em> \); Player 2 always proposes \( y^</em> \) and accepts any offer \( x \) such that \( x_2 \geq x_2^<em> \), where \( x^</em> \) and \( y^<em> \) are as given above.</em>

---

## Section 13.5: The One-Deviation Property and Verification

### The Tool

We arrived at Proposition 471.3 through a series of educated guesses — stationarity, immediate acceptance, exact indifference offers. We now need to verify that the resulting strategy profile \( s^* \) is indeed a subgame perfect equilibrium. The tool for this is the <strong>one-deviation property (ODP)</strong>.

<strong>Definition.</strong> A strategy profile satisfies the one-deviation property if no player can increase her payoff by changing her action at the start of any subgame in which she is the first mover, given the other player's strategies and the rest of her own strategy.

<strong>Propositions 438.1 and 439.2</strong> establish that for extensive games with a finite horizon, or for infinitely repeated games with discounting (which the bargaining game is), a strategy profile is a subgame perfect equilibrium <strong>if and only if</strong> it satisfies the one-deviation property.

This equivalence is enormously useful. Sub-game perfection requires that no player can improve by changing her entire strategy in any subgame — an daunting thing to check directly when strategies are infinite-dimensional. The ODP reduces this to a single check per subgame: can the first mover do better by deviating in just the very first action, keeping everything else fixed?

Why does the ODP imply SPE? The intuition is that any change in a player's strategy can be decomposed into a sequence of single deviations. If none of those single deviations is profitable — which is what the ODP checks — then neither is any combination of them. More precisely: if no profitable single deviation exists at the start of any subgame, it follows by an inductive argument that no profitable multi-step deviation exists either, because each step in a hypothetical multi-step deviation would itself constitute a profitable single deviation somewhere in the game tree.

### A Simple Illustration

Consider a one-player game with three decision nodes, where the strategy \( C\text{-}E\text{-}G \) is shown in red. The terminal payoffs are \( w, x, y, z \) at the four leaves.

For \( C\text{-}E\text{-}G \) to satisfy the ODP, we need three conditions:
- At the start of the game, deviating from C to D (keeping E and G fixed) is not profitable: \( w \geq y \).
- In the subgame after C, deviating from E to F is not profitable: \( w \geq x \).
- In the subgame after D, deviating from G to H is not profitable: \( y \geq z \).

For \( C\text{-}E\text{-}G \) to be a SPE, we additionally need that no multi-step deviation is profitable, including switching to D-F-H (requiring \( w \geq z \). But the ODP conditions already give us \( w \geq y \) and \( y \geq z \), which together imply \( w \geq z \). The single-deviation conditions cascade into multi-deviation conditions — that is why ODP implies SPE.

### Verifying \( s^* \) in the Bargaining Game

The bargaining game has exactly <strong>four types of subgames</strong>, and we must verify the ODP in each.

<strong>Type 1: Player 1 making an offer.</strong> Under \( s^<em> \), Player 1 proposes \( x^</em> \), Player 2 accepts (since \( x_2^<em> \) equals Player 2's cutoff), and Player 1 gets \( x_1^</em> \). Could Player 1 deviate profitably?

- If Player 1 offers Player 2 <em>more</em> than \( x_2^<em> \): Player 2 still accepts, but Player 1 receives less than \( x_1^</em> \). Not profitable.
- If Player 1 offers Player 2 <em>less</em> than \( x_2^<em> \): Player 2 rejects (below her cutoff), then proposes \( y^</em> \) per her strategy, and Player 1 accepts (since \( y_1^<em> \) equals Player 1's cutoff). Player 1 then receives \( y_1^</em> \) one period later, worth \( \delta_1 y_1^<em> \) today. One can verify from the solution equations that \( \delta_1 y_1^</em> < x_1^* \). Not profitable.

<strong>Type 2: Player 2 making an offer.</strong> By a symmetric argument, under \( s^<em> \) Player 2 gets \( y_2^</em> \). Offering Player 1 more gives Player 2 less; offering Player 1 less leads Player 1 to reject, propose \( x^<em> \), Player 2 accepts, and Player 2 gets \( \delta_2 x_2^</em> \), which is less than \( y_2^* \) by the solution equations. Neither deviation is profitable.

<strong>Type 3: Player 1 responding to an offer \( (y_1, y_2) \).</strong> Under \( s^<em> \), Player 1 applies the cutoff \( y_1^</em> \). Her payoff is at least \( y_1^<em> \) under this rule: if she accepts it is because she is getting at least \( y_1^</em> \); if she rejects, she proposes \( x^<em> \) next period, Player 2 accepts, and she gets \( \delta_1 x_1^</em> = y_1^* \). Could deviating help?

- If Player 1 <em>raises</em> her cutoff and rejects some \( y_1 \geq y_1^<em> \): she then proposes \( x^</em> \), gets \( \delta_1 x_1^<em> = y_1^</em> \), which is no more than \( y_1 \). Not profitable (weakly worse).
- If Player 1 <em>lowers</em> her cutoff and accepts some \( y_1 < y_1^<em> \): she gets less than \( y_1^</em> \), which is less than what rejecting would give her. Not profitable.

<strong>Type 4: Player 2 responding to an offer \( (x_1, x_2) \).</strong> By the same argument with \( x_2^<em> \) and \( \delta_2 y_2^</em> = x_2^<em> \): raising the cutoff and rejecting some \( x_2 \geq x_2^</em> \) gives Player 2 at most \( \delta_2 y_2^<em> = x_2^</em> \leq x_2 \) (not profitable); accepting some \( x_2 < x_2^<em> \) gives less than \( x_2^</em> \) (not profitable).

In all four subgame types, the first mover cannot increase her payoff by a single deviation. The ODP is satisfied. By Propositions 438.1 and 439.2, \( s^* \) is a <strong>subgame perfect equilibrium</strong>. (Proving uniqueness — that no non-stationary SPE exists — is beyond the scope of this course.)

### Properties of the Equilibrium

The SPE \( s^* \) has three notable properties.

<strong>Efficiency.</strong> Player 2 accepts Player 1's very first offer. No delay occurs, no pie is wasted through discounting. This makes sense given perfect information: both players know exactly what the equilibrium outcome will be, so there is no reason to delay and lose value. Perfect information does not always guarantee efficiency (see Exercise 473.2 on constant-cost delay), but it does here.

<strong>Patience is power.</strong> Fix \( \delta_2 \) and increase \( \delta_1 \) toward 1. Looking at the formula for \( x_1^<em> \), Player 1's share increases. As \( \delta_1 \to 1 \), \( x_1^</em> \to 1 \): a perfectly patient Player 1 gets the entire pie. The intuition is clear — a player who can wait indefinitely without caring about delay can credibly threaten to hold out forever, forcing the impatient opponent to capitulate. Both players are perfectly informed and recognise this, so agreement is immediate but on terms extremely favourable to the patient player.

<strong>First-mover advantage vanishes with patience.</strong> Suppose both players are equally patient: \( \delta_1 = \delta_2 = \delta \). Then the only asymmetry is that Player 1 moves first. Substituting into the formula:

\[
x_1^* = \frac{1 - \delta}{1 - \delta^2} = \frac{1 - \delta}{(1-\delta)(1+\delta)} = \frac{1}{1+\delta}.
\]

Since \( \delta < 1 \), we have \( x_1^<em> = 1/(1+\delta) > 1/2 \): Player 1 gets strictly more than half. Player 1's advantage stems entirely from the fact that Player 2 is impatient — Player 2 would rather accept a slightly unfavourable offer today than wait a period to make her own proposal. As \( \delta \to 1 \), \( x_1^</em> \to 1/2 \): the first-mover advantage disappears and the outcome converges to a perfectly equal split. When neither player cares about delay, the only remaining asymmetry — who moves first — becomes irrelevant.

This model, known as the Rubinstein bargaining model, is both theoretically elegant and practically useful. Before entering any bargaining session, the framework tells you how much to expect, which parameters (your own patience, your counterpart's patience, the bargaining protocol) matter, and how to change the game if you do not like the predicted outcome. After this chapter, that analysis should be within your reach.

---

# Chapter 14: Repeated Games

## Why Repetition Matters

The Prisoner's Dilemma predicts mutual defection, yet we observe cooperation everywhere in the world around us. A worker and an employer bargain over wages year after year. Two firms in a duopoly decide on output month after month. Your auto mechanic diagnoses your car every time you bring it in. Classmates collaborate on one joint project after another. In every one of these situations the same parties interact repeatedly, and experience tells us that trust and cooperation can emerge even when a one-shot analysis would predict pure self-interest.

The reason is that repetition changes the strategic landscape in a fundamental way. When players interact more than once, each player can <strong>condition her action at each point in time on the other players' previous actions</strong>. Cooperation can be rewarded with further cooperation; defection can be punished with future defection. A player who is tempted to exploit a partner today must weigh that short-run gain against the long-run cost of triggering retaliatory punishment. If the future matters enough — if the players are sufficiently <strong>patient</strong> — the threat of punishment is credible and powerful enough to sustain cooperation as an equilibrium.

This chapter formalises that intuition through the repeated Prisoner's Dilemma. Along the way we develop the key tools: discounting, the concept of a strategy in an infinitely repeated game, and the Nash Folk Theorem.

---

## Section 14.1: Discounting and the Value of a Payoff Stream

### The Discount Factor

In a repeated game players receive a payoff in each period. A dollar (or a unit of payoff) received today is worth more than one received next period, for two reasons: impatience, and the fact that resources available today can be invested. We capture both by a <strong>discount factor</strong> \( \delta \in (0,1) \). A payoff of \( v \) received one period from now is worth \( \delta v \) today, a payoff received two periods from now is worth \( \delta^2 v \) today, and so on. The closer \( \delta \) is to 1, the more the player values the future — the more <strong>patient</strong> she is.

### Discounted Sum and Discounted Average

Given a stream of payoffs \( (v_1, v_2, v_3, \ldots) \), the <strong>discounted sum</strong> is

\[
\sum_{t=1}^{\infty} \delta^{t-1} v_t
\]

This is the present value of the entire payoff stream. Because sums grow without bound as the game goes on, it is often more convenient to work with the <strong>discounted average payoff</strong>, defined as the constant per-period payoff that the player would need to receive in order to be indifferent between that constant stream and the original stream. If a player receives the constant value \( c \) in every period, her discounted sum is \( c \sum_{t=0}^{\infty} \delta^t = c/(1-\delta) \). Setting this equal to the discounted sum of the original stream and solving for \( c \) gives:

\[
\text{Discounted average} = (1-\delta) \sum_{t=0}^{\infty} \delta^t v_{t+1}
\]

The factor \( (1-\delta) \) normalises the expression so that a constant stream of value \( v \) in every period has a discounted average of exactly \( v \). This makes discounted averages directly comparable to one-shot payoffs, which is why they are the natural measure of welfare in repeated games. Throughout this chapter we assume all players share the same discount factor \( \delta \).

### The Geometric Series Formula

One formula will be used repeatedly. For \( \delta \in (0,1) \):

\[
\sum_{t=0}^{\infty} \delta^t = \frac{1}{1-\delta}
\]

A related formula handles finite sums. For any non-negative integer \( T \):

\[
\sum_{t=0}^{T} \delta^t = \frac{1 - \delta^{T+1}}{1 - \delta}
\]

These two results are workhorses of the analysis that follows.

### Definition of a Repeated Game

Given a <strong>stage game</strong> — a strategic game \( G \) played once — the <strong>repeated game</strong> of \( G \) is an extensive game with perfect information and simultaneous moves. After every non-terminal history, every player simultaneously chooses an action from her set of actions in \( G \). If the game ends after exactly \( T \) rounds it is a <strong>finitely repeated game</strong>; if it continues forever it is an <strong>infinitely repeated game</strong>. Each player evaluates a terminal history by its discounted average payoff.

---

## Section 14.2: Finitely Repeated Games and the Unravelling of Cooperation

The stage game we focus on throughout this chapter is the Prisoner's Dilemma. Two players each choose either Cooperate (C) or Defect (D) simultaneously. The payoff matrix is:

|  | <strong>C</strong> | <strong>D</strong> |
|---|---|---|
| <strong>C</strong> | 2, 2 | 0, 3 |
| <strong>D</strong> | 3, 0 | 1, 1 |

In the stage game, D is a strictly dominant strategy for both players, so the unique Nash Equilibrium is (D, D) with payoffs (1, 1). Mutual cooperation (C, C) would give both players 2, but neither can unilaterally sustain it.

Now suppose this game is played exactly \( T \) times and both players know \( T \). We solve for the subgame perfect equilibrium by <strong>backward induction</strong>. In the very last period — period \( T \) — there are no future periods, so the threat of future punishment carries no weight. D is strictly dominant in period \( T \) regardless of history, and both players defect. Now consider period \( T-1 \). Each player knows that the outcome in period \( T \) will be (D, D) no matter what happens in period \( T-1 \). Therefore, a player's action in period \( T-1 \) affects only that period's payoff. D is again strictly dominant, and both players defect. The same argument applies to period \( T-2 \), period \( T-3 \), and so on all the way back to period 1.

<strong>Result (Unique SPE of Finitely Repeated PD):</strong> The finitely repeated Prisoner's Dilemma has a unique subgame perfect equilibrium in which each player chooses D in every period regardless of history. The equilibrium outcome is (D, D) in every period.

This result extends beyond SPE. One can show that <em>every</em> Nash Equilibrium of the finitely repeated Prisoner's Dilemma generates the outcome (D, D) in every period. The argument proceeds by contradiction: suppose some strategy pair generates an outcome path in which at least one player's action differs from D in some period. Let \( t \) be the <em>last</em> such period, and suppose without loss of generality that Player 1 plays C in period \( t \). Player 1 can profitably deviate by switching to D in period \( t \) and playing D in every subsequent period — this raises her payoff in period \( t \) and leaves it unchanged or higher in every period after \( t \) (since the original path had (D, D) from period \( t+1 \) onward, and the deviating strategy also plays D in those periods). Therefore no such strategy pair can be a Nash Equilibrium.

<strong>Unique NE Outcome:</strong> Every Nash Equilibrium of the finitely repeated Prisoner's Dilemma generates the outcome (D, D) in every period.

Our intuition told us that repetition should enable cooperation. For finitely repeated games, theory disappoints that intuition. The trouble is backward induction, anchored by the known final period. To rescue cooperation we need to remove that anchor.

---

## Section 14.3: Infinitely Repeated Games — Why Cooperation Becomes Possible

### The Failure of Backward Induction

When the Prisoner's Dilemma is repeated infinitely — that is, it goes on forever with no predetermined endpoint — backward induction cannot be applied. There is no last period from which to start the unravelling argument. We cannot say "in the very last period both players defect, therefore in the second-to-last period…" because no last period exists.

Moreover, the Nash equilibrium argument for the finitely repeated game also fails. That argument depended on every outcome path having a <em>last period</em> in which at least one player plays C — a final moment of cooperation that some player would want to deviate from. In the infinitely repeated game, a strategy pair can generate outcome paths in which C is played in infinitely many periods with no last occurrence. For example, one player might cooperate every third period forever, or both players might cooperate in every single period forever. Without a last C, the profitable deviation argument has no foothold.

This does not yet <em>prove</em> that cooperation is achievable; it merely eliminates the argument against it. To find cooperative equilibria we must do the actual work of constructing strategies and verifying that neither player has an incentive to deviate.

### Strategies in the Infinitely Repeated Game

A <strong>strategy</strong> of player \( i \) in the infinitely repeated game of \( G \) specifies an action of player \( i \) after the empty history and for every finite sequence \( (a^1, a^2, \ldots, a^t) \) of outcomes of \( G \), for every \( t \geq 1 \). In other words, a strategy is a complete contingent plan: it says what to do in period 1 (no history yet), what to do in period 2 as a function of the four possible outcomes in period 1, what to do in period 3 as a function of the sixteen possible outcomes in periods 1 and 2, and so on indefinitely.

The set of strategies is immense — effectively infinite in size — so we cannot enumerate all Nash Equilibria. Instead, we focus on a small number of natural, easily described strategies and ask whether they form Nash Equilibria that generate cooperative outcomes.

---

## Section 14.4: Three Cooperative Strategies

### The Grim Trigger Strategy

The first strategy is the <strong>grim trigger</strong>:

- Play C after the empty history (in the first period).
- In any subsequent period, play C if the other player has played C in every previous period; play D if the other player has ever played D.

In other words: cooperate as long as there has been mutual cooperation, but the moment the other player defects — even once — switch to D forever. The nickname is apt: once the trigger is pulled, retaliation is permanent. The grim trigger represents the most severe credible punishment available: any deviation triggers an eternal breakdown of cooperation.

### The k-Period Punishment Strategy

The grim trigger is harsh. A less draconian alternative is the <strong>k-period punishment strategy</strong>, denoted \( s^P(k) \):

- Play C at the start.
- If the other player deviates by playing D, respond by playing D for exactly \( k \) periods, then revert to C regardless of what the other player did during the punishment phase.
- After reverting, continue cooperating until the next deviation, at which point impose another k-period punishment, and so on.

The punishment here is finite and bounded. Think of it as a suspension rather than a lifetime ban: misbehave, serve your k-period suspension, and return to good standing. Crucially, the reversion to C after k periods is unconditional — it does not depend on whether the other player was well-behaved during the punishment.

### Tit-for-Tat

The third strategy is perhaps the most famous in game theory: <strong>tit-for-tat</strong>:

- Play C after the empty history (in the first period).
- In every subsequent period, do whatever the other player did in the immediately preceding period.

Tit-for-tat is a copycat strategy. It starts cooperatively, immediately mirrors defection with defection, and immediately mirrors cooperation with cooperation. It never defects first, retaliates exactly once for each defection, and forgives the moment the other player returns to C.

---

## Section 14.5: Nash Equilibria of the Infinitely Repeated Prisoner's Dilemma

The infinitely repeated Prisoner's Dilemma has infinitely many strategy profiles that are Nash Equilibria. We examine three.

### NE 1: Always Defect

First, consider the strategy pair in which each player plays D after every history regardless. If one player always plays D, the best the other can do is also play D (since cooperating unilaterally yields 0 rather than 1 per period). Therefore the strategy pair in which each player chooses D after every history is a Nash Equilibrium of the infinitely repeated game. This is the dismal equilibrium — the same outcome as in the finitely repeated game. Repetition does not <em>force</em> cooperation; it merely makes it <em>possible</em>.

### NE 2: Grim Trigger vs. Grim Trigger

<strong>Claim:</strong> If \( \delta \geq \frac{1}{2} \), the strategy pair in which both players use the grim trigger is a Nash Equilibrium of the infinitely repeated Prisoner's Dilemma.

<strong>Verification:</strong> Suppose Player 1 uses the grim trigger. Consider any period in which cooperation has prevailed up to that point (so Player 1 remains in the cooperative phase). Player 2 has two broad options: keep cooperating, or deviate.

<em>If Player 2 keeps cooperating</em>, her payoff stream going forward is \( (2, 2, 2, \ldots) \), giving a discounted average of 2.

<em>If Player 2 deviates</em>, she plays D in the current period, earning 3 (since Player 1 is still playing C). Player 1 then switches to D forever. Player 2's best response to Player 1 playing D forever is to also play D forever (since D dominates C in the stage game). So Player 2's payoff stream from the period of deviation forward is \( (3, 1, 1, 1, \ldots) \). The discounted average of this stream is:

\[
(1-\delta)(3 + \delta + \delta^2 + \cdots) = (1-\delta)\left(3 + \frac{\delta}{1-\delta}\right) = 3(1-\delta) + \delta
\]

Player 2 cannot profitably deviate if and only if the cooperation payoff is at least as large as the defection payoff:

\[
3(1-\delta) + \delta \leq 2
\]

Expanding: \( 3 - 3\delta + \delta \leq 2 \), so \( 3 - 2\delta \leq 2 \), giving:

\[
\delta \geq \frac{1}{2}
\]

By symmetry the same condition applies to Player 1. Any strategy that always plays C in response to the grim trigger is a best response (not just grim trigger itself), but grim trigger is one such strategy. Since each player is playing a best response to the other, the grim trigger pair is a Nash Equilibrium when \( \delta \geq \frac{1}{2} \). The equilibrium outcome is (C, C) in every period — the cooperative outcome we were looking for.

The condition \( \delta \geq \frac{1}{2} \) has a clean interpretation. The gain from deviating is 1 extra unit today (3 instead of 2). The cost is losing 1 unit per period forever after (1 instead of 2). Cooperation is sustainable when players care enough about the future that the permanent loss outweighs the one-time gain.

> <strong>Exercise 429.1</strong> generalises this result to a Prisoner's Dilemma with general payoffs: the mutual cooperation payoff is \( x \), the temptation payoff is \( y \) (with \( y &gt; x &gt; 1 &gt; 0 \). Determine the condition on \( \delta \) for grim trigger vs. grim trigger to be a Nash Equilibrium.

### NE 3: k-Period Punishment vs. k-Period Punishment

Now consider whether the strategy pair in which both players use \( s^P(k) \) can be a Nash Equilibrium.

Suppose Player 1 uses \( s^P(k) \). If Player 2 also uses \( s^P(k) \), the outcome is (C, C) every period (since neither player has a reason to defect first). Any profitable deviation for Player 2 must therefore involve playing D in at least one period. Let \( t \) be the <em>first</em> period in which Player 2 plays D.

What happens? Player 1 punishes by playing D from period \( t+1 \) through period \( t+k \), then reverts to C in period \( t+k+1 \) regardless of Player 2's behaviour during the punishment. During periods \( t+1 \) through \( t+k \), Player 2 is being punished (Player 1 plays D). Player 2 should play D during her own punishment — playing C there yields 0 rather than 1, a worse outcome, and it does not shorten the punishment (which is unconditional). In period \( t+k+1 \), Player 1 returns to C and the whole situation repeats from scratch.

The only relevant comparison is over the \( k+1 \) periods from \( t \) through \( t+k \). If Player 2 deviates and plays D throughout these periods, her discounted average payoff over this window is:

\[
(1-\delta)(3 + \delta + \delta^2 + \cdots + \delta^k) = 3(1-\delta) + \delta(1-\delta^k)
\]

If instead Player 2 cooperates throughout (sticking to \( s^P(k) \) and playing C every period), her discounted average payoff over these same \( k+1 \) periods is:

\[
(1-\delta)(2 + 2\delta + 2\delta^2 + \cdots + 2\delta^k) = 2(1-\delta^{k+1})
\]

The strategy \( s^P(k) \) is a best response to itself if and only if the cooperation payoff is at least as large as the deviation payoff:

\[
3(1-\delta) + \delta(1-\delta^k) \leq 2(1-\delta^{k+1})
\]

After algebraic simplification this reduces to:

\[
\delta^{k+1} - 2\delta + 1 \leq 0
\]

Consider the cases:

- <strong>\( k = 1 \):</strong> The condition becomes \( \delta^2 - 2\delta + 1 \leq 0 \), i.e. \( (\delta-1)^2 \leq 0 \). Since \( (\delta-1)^2 \geq 0 \) always, the only solution is \( \delta = 1 \) — which is ruled out by assumption. <strong>A one-period punishment is never sufficient to deter deviation, no matter how patient the players are.</strong>

- <strong>\( k = 2 \):</strong> Solving \( \delta^3 - 2\delta + 1 \leq 0 \) yields \( \delta \geq 0.62 \) (approximately). A two-period punishment can sustain cooperation if the players are sufficiently patient.

- <strong>\( k = 3 \):</strong> The required cutoff falls to \( \delta \geq 0.55 \) (approximately).

- <strong>\( k \to \infty \):</strong> As \( k \) grows, the required discount factor approaches \( \delta \geq \frac{1}{2} \). This is exactly what we found for the grim trigger, which is simply the limit of the k-period punishment as \( k \to \infty \).

<strong>Result:</strong> The strategy pair in which each player uses \( s^P(k) \) is a Nash Equilibrium of the infinitely repeated Prisoner's Dilemma as long as \( k \geq 2 \) and \( \delta \) is large enough. The longer the punishment, the lower the patience required. Short punishments can only sustain cooperation among very patient players.

> <strong>Exercise 430.1</strong> asks you to generalise this analysis to the Prisoner's Dilemma with payoffs \( x \) and \( y \).

### NE 4: Tit-for-Tat vs. Tit-for-Tat

<strong>Claim:</strong> If \( \delta \geq \frac{1}{2} \), the strategy pair in which both players use tit-for-tat is a Nash Equilibrium of the infinitely repeated Prisoner's Dilemma.

<strong>Verification:</strong> Suppose Player 1 uses tit-for-tat. If Player 2 also uses tit-for-tat, the outcome is (C, C) every period, and Player 2's discounted average payoff is 2. Any profitable deviation must involve Player 2 playing D in at least one period. Let \( t \) be the first such period.

After Player 2 defects in period \( t \), Player 1 (using tit-for-tat) plays D in period \( t+1 \). In period \( t+1 \) Player 2 faces a choice that determines the shape of all future play:

1. <strong>Player 2 reverts to C in period \( t+1 \).</strong> Player 1 then plays C in period \( t+2 \) (copying Player 2's C in period \( t+1 \), and the game resets to the same situation as the beginning. Player 2 can defect again in period \( t+2 \), perpetuating the alternating pattern D, C, D, C, ... The payoff stream from period \( t \) onward is then \( (3, 0, 3, 0, \ldots) \) — defect and earn 3 in odd periods (when Player 1 is still cooperating), earn 0 in even periods (when Player 1 is retaliating).

2. <strong>Player 2 continues to play D in period \( t+1 \).</strong> Player 1 then plays D in period \( t+2 \), and by the same logic both players end up playing D forever. Player 2's payoff stream from period \( t \) onward is \( (3, 1, 1, 1, \ldots) \).

These are the two extreme deviations; any mixture of them is also possible, but if neither extreme is a profitable deviation, neither is any mixture.

<strong>Alternating (D, C, D, C, ...) deviation:</strong> The discounted average of \( (3, 0, 3, 0, \ldots) \) is:

\[
(1-\delta) \cdot \frac{3}{1-\delta^2} = \frac{3(1-\delta)}{(1-\delta)(1+\delta)} = \frac{3}{1+\delta}
\]

(Here we used the fact that \( \sum_{t=0}^{\infty} \delta^{2t} = 1/(1-\delta^2) \).)

<strong>Always D deviation:</strong> The discounted average of \( (3, 1, 1, 1, \ldots) \) is:

\[
(1-\delta)\left(3 + \frac{\delta}{1-\delta}\right) = 3(1-\delta) + \delta = 3 - 2\delta
\]

For tit-for-tat to be a best response to tit-for-tat, neither deviation must be profitable:

\[
2 \geq \frac{3}{1+\delta} \quad \text{and} \quad 2 \geq 3 - 2\delta
\]

Both conditions simplify to \( \delta \geq \frac{1}{2} \). (If the two conditions had given different cutoffs, the binding constraint would be the more demanding one.)

<strong>Result:</strong> The strategy pair in which each player uses tit-for-tat is a Nash Equilibrium of the infinitely repeated Prisoner's Dilemma as long as \( \delta \geq \frac{1}{2} \).

We have now found several Nash Equilibria that produce the cooperative outcome (C, C) in every period. What it took was removing the finite horizon. Once we allow the game to go on indefinitely — or equivalently, once players face uncertainty about when the game ends — the threat of future punishment becomes a credible and effective enforcer of cooperation.

> <strong>A note on interpretation.</strong> An infinitely repeated game is not the only way to reach these results. Suppose the game ends after each period with probability \( 1-p \), and with probability \( p \) it continues for another period. A player with per-period discount factor \( \delta_0 \) now effectively discounts the future by \( \delta = p \delta_0 \), since future payoffs are both discounted and stochastic. The mathematics is identical to the infinitely repeated game with discount factor \( \delta \). In the classroom Prisoner's Dilemma experiment run alongside this course, each period ended with 10% probability, making it equivalent to an infinitely repeated game with \( \delta = 0.9 \).

---

## Section 14.6: The Folk Theorem — How Many Payoffs Can Be Sustained?

### Feasible Payoff Pairs

Up to now, every Nash Equilibrium we constructed has generated either (D, D) every period — discounted average payoffs of (1, 1) — or (C, C) every period — discounted average payoffs of (2, 2). Are these the only possibilities? The Folk Theorem says no: when players are sufficiently patient, almost any pair of individually rational payoffs can be sustained as a Nash Equilibrium of the infinitely repeated game.

The set of <strong>feasible payoff pairs</strong> consists of all pairs \( (x_1, x_2) \) that can be generated by some (possibly correlated or randomised) choice of action profiles in the stage game. In the Prisoner's Dilemma with payoffs (C,C)→(2,2), (C,D)→(0,3), (D,C)→(3,0), (D,D)→(1,1), the feasible set is the convex hull of these four points — a quadrilateral with vertices at (2,2), (0,3), (3,0), and (1,1).

The individual rationality constraint is that each player must receive at least what she can guarantee herself regardless of the other's play, which in the Prisoner's Dilemma is the payoff from always defecting: \( u_i(D,D) = 1 \) for each player \( i \). The set of <strong>individually rational feasible payoffs</strong> is the portion of the feasible set lying strictly above 1 for each player.

### The Nash Folk Theorem

<strong>Nash Folk Theorem:</strong> Let \( G \) be a Prisoner's Dilemma. Then:

1. The discounted average payoff of each player in any Nash Equilibrium of the infinitely repeated game is at least \( u_i(D,D) \).

2. Let \( (x_1, x_2) \) be a feasible pair of payoffs in \( G \) for which \( x_i > u_i(D,D) \) for each player \( i \). For \( \delta \) sufficiently close to 1, the infinitely repeated game of \( G \) has a Nash Equilibrium in which the discounted average payoffs are \( (x_1, x_2) \).

Part 1 says that Nash Equilibrium payoffs must be individually rational — no player will accept less than their minmax payoff. Part 2 says that every individually rational feasible payoff pair can be achieved. Together they characterise <em>exactly</em> which payoff pairs are achievable as Nash Equilibrium discounted average payoffs when players are sufficiently patient.

The theorem is called the Folk Theorem because the result was known informally among game theorists long before it was formally proved — it was "folk knowledge."

### Implementing an Asymmetric Payoff: The Example of (6/4, 9/4)

To make the Folk Theorem concrete, consider the payoff pair \( (6/4,\, 9/4) \). This lies strictly above (1, 1) for both players and within the feasible set. Player 1's payoff is below 2, while Player 2's payoff is above 2 — the pair is asymmetric. Can it be implemented as a Nash Equilibrium outcome?

Yes. The target payoffs can be achieved as a mix of (C, C) — generating (2, 2) — and (C, D) — generating (0, 3). If we repeat the cycle (C, D), (C, C), (C, C), (C, C) indefinitely (one period of (C, D) for every three periods of (C, C)), the long-run average approaches \( (6/4, 9/4) \). When \( \delta \) is close to 1, the discounted average payoffs are close to these long-run averages.

To implement this as a Nash Equilibrium, we use a modified grim trigger:

- <strong>Player 1's strategy:</strong> Play C so long as Player 2 has been repeatedly playing the cycle (D, C, C, C); switch to playing D forever after any deviation by Player 2.
- <strong>Player 2's strategy:</strong> Repeatedly play the cycle (D, C, C, C) so long as Player 1 has always played C; switch to playing D forever after any period in which Player 1 does not play C.

Each player's strategy threatens permanent defection if the other deviates from the prescribed path. When \( \delta \) is close to 1, the loss from triggering the punishment phase outweighs any short-run gain from deviating, so neither player has an incentive to deviate. The asymmetric payoff pair \( (6/4, 9/4) \) is thereby sustained as a Nash Equilibrium discounted average.

The Folk Theorem is a powerful and somewhat unsettling result. It shows that patience alone is sufficient to sustain a vast array of outcomes — including asymmetric ones that favour one player over the other. Repeated interaction does not converge on a unique cooperative outcome; it opens an enormous landscape of equilibria. Knowing what <em>can</em> be sustained tells us much less than we might hope about what <em>will</em> be sustained in practice.

---

## Section 14.7: Axelrod's Tournaments — Cooperation in Practice

Theory tells us which strategies can sustain cooperation. But which strategies actually <em>perform well</em> when real people (or real programs) compete against a variety of opponents? Robert Axelrod answered this question empirically through a pair of famous computer tournaments.

### The First Tournament

In the late 1970s, Axelrod invited economists, psychologists, mathematicians, and sociologists to submit computer programs representing strategies for a <strong>finitely repeated Prisoner's Dilemma</strong> played over 200 rounds. He received 14 entries. Each strategy was pitted against every other strategy (and against itself) in a round-robin format. The question was simple: which strategy would earn the highest total payoff summed across all matchups?

The puzzle is that standard theory predicts mutual defection in every period of a finitely repeated game. Yet Axelrod found that the winning strategy — submitted by psychologist Anatol Rapoport of the University of Toronto — was none other than <strong>tit-for-tat</strong>: cooperate in round 1, then copy the opponent's previous action in every subsequent round. Among the top eight strategies in the first tournament, all eight were "nice" (they never defected first); all six of the bottom strategies were not.

### The Second Tournament

Axelrod published the results of the first tournament and invited a second round of submissions, this time informing all participants exactly which strategies had competed and how each had performed. Sixty-two strategies were submitted — a much larger and more sophisticated field, with entrants aware of tit-for-tat's prior success and strategising to exploit or outcompete it.

Tit-for-tat, submitted again by Rapoport, won the second tournament as well.

<div class="embed-container"><iframe src="https://www.youtube.com/embed/BOvAbjfJ0x0?rel=0" frameborder="0" allowfullscreen></iframe></div>

<em>The evolution of cooperation: Axelrod's tournaments and the success of tit-for-tat.</em>

### What Made Tit-for-Tat Successful?

Axelrod synthesised the lessons of his tournaments into a set of properties shared by the strategies that performed well:

<strong>Nice</strong> — Cooperate first; never be the first to defect. Tit-for-tat never starts a fight. This earns high payoffs against other nice strategies, which make up the majority of well-performing opponents.

<strong>Provocable</strong> — Immediately retaliate when the opponent defects. Tit-for-tat does not allow exploitation; a single defection is answered with a defection in the very next period. This deters would-be exploiters.

<strong>Forgiving</strong> — Return to cooperation as soon as the opponent does. Unlike the grim trigger, tit-for-tat does not hold a grudge indefinitely. The moment the opponent cooperates, tit-for-tat cooperates too, avoiding the trap of extended mutual punishment.

<strong>Not envious</strong> — Care only about your own payoff, not your payoff relative to your opponent's. Tit-for-tat never beats its opponent in any given matchup — at best it ties. Players who try to do <em>better</em> than their partner often end up provoking retaliation that hurts both.

<strong>Not too clever</strong> — Simple, transparent strategies outperform deceptive or complex ones. Opponents quickly learn how tit-for-tat works, which makes cooperation easy to establish and maintain. Elaborate strategies that attempt to exploit others tend to trigger punishment and miscoordination.

The success of tit-for-tat in a finite-horizon tournament is not predicted by the standard backward induction argument. But in a world of diverse opponents — some cooperative, some exploitative, some erring randomly — a reciprocal, forgiving, transparent strategy turns out to be the best overall performer. The Axelrod results have influenced thinking in evolutionary biology (the emergence of reciprocal altruism), political science (international cooperation), and economics (the design of institutions to foster collaboration).

---

## Course Takeaways

This course has traced a path through the major frameworks of non-cooperative game theory, connecting formal models to the world of real strategic decisions.

<strong>Strategic games</strong> provided the foundation: simultaneous interaction, Nash Equilibrium, best-response functions, and the logic of dominance. The applications — Cournot quantity competition, Bertrand price competition, electoral competition, and auctions — showed how the same framework can illuminate very different economic settings.

<strong>Mixed strategy equilibria</strong> extended the analysis to probabilistic play. When no pure-strategy Nash Equilibrium exists, players randomise in a way that makes opponents indifferent between their own options. The examples of expert diagnosis, penalty kicks in soccer, and the decision to report a crime illustrated how mixed strategies capture the unpredictability of real strategic interaction.

<strong>Extensive games</strong> introduced sequential interaction and the refinement of subgame perfect equilibrium via backward induction. Sequential rationality — requiring that strategies be optimal not just overall but at every decision node — disciplines the set of predictions and rules out threats that are not credible. The Stackelberg duopoly, the ultimatum game, the hold-up problem, and the Rubinstein alternating-offers bargaining model all turn on the logic of backward induction and the value of commitment.

<strong>Repeated games</strong> showed how cooperation can emerge from self-interest when interactions are ongoing and players are patient. Backward induction destroys cooperation in finitely repeated games with a unique stage-game equilibrium. But in infinitely repeated games, the grim trigger, k-period punishments, and tit-for-tat can all sustain the cooperative outcome (C, C) when the discount factor exceeds \( \frac{1}{2} \). The Folk Theorem tells us that patience makes almost any individually rational payoff achievable in equilibrium — the landscape of possible outcomes is vast. And Axelrod's tournaments remind us that in the messy, multi-opponent world of real interaction, simple reciprocal strategies like tit-for-tat outperform cleverness and exploitation.

The final lesson: in repeated interaction, the winning formula is not cunning or aggression. It is being <strong>nice</strong>, <strong>responsive</strong>, <strong>forgiving</strong>, and <strong>not envious</strong>. In the real world you will face strategic choices at every turn. Game theory gives you the tools to analyse them clearly. But its deepest lesson may be this — forget the pure theory when it tells you to defect, and instead trust others, cooperate, and forgive.
