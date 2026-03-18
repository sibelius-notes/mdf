---
title: "ECON 212 - Introduction to Game Theory"
prof: "Joel Blit"
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

Formally, there are two players, Suspect 1 and Suspect 2, each choosing from {Quiet, Fink}. Denoting payoffs as <span>&#92;(u_i(ap_1, ap_2)&#92;)</span> for the payoff to player <span>&#92;(i&#92;)</span> when the action profile is <span>&#92;((ap_1, ap_2)&#92;)</span>, their preferences satisfy:

<span>&#92;[&#92;begin{aligned}
u_1(F,Q) &amp;> u_1(Q,Q) > u_1(F,F) > u_1(Q,F) &#92;&#92;
u_2(Q,F) &amp;> u_2(Q,Q) > u_2(F,F) > u_2(F,Q)
&#92;end{aligned}&#92;]</span>

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

where typically <span>&#92;(a > b > c > d&#92;)</span>. The top-right cell illustrates the notation: payoff <span>&#92;(d&#92;)</span> to Suspect 1 means they stayed quiet while the other finked, receiving the harshest sentence; payoff <span>&#92;(a&#92;)</span> to Suspect 2 means they finked and went free.

The prisoner's dilemma captures something profound: there are gains from mutual cooperation (both quiet earns each player <span>&#92;(c&#92;)</span>), yet each player is individually better off finking regardless of what the other does. Finking yields <span>&#92;(b&#92;)</span> when the other finks and <span>&#92;(d&#92;)</span> when the other stays quiet — in both cases better than the corresponding quiet outcome for the fink. This logic drives both suspects toward (Fink, Fink), despite (Quiet, Quiet) being better for both.

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

Two students, Alice and Bob, must each decide whether to exert effort on a joint assignment. Without effort from either, they earn 50%. One working student alone lifts the grade to 70%. Both working earns 90%. Working is costly — each student is indifferent between working and earning grade <span>&#92;(X&#92;)</span> versus shirking and earning <span>&#92;(X - 30&#92;)</span>, placing the effective cost of effort at 30 percentage points.

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

Is this a prisoner's dilemma? Almost — but not quite. In a true PD we need the strict inequality <span>&#92;(u_2(&#92;text{Steal}, &#92;text{Split}) > u_2(&#92;text{Steal}, &#92;text{Steal})&#92;)</span>. Here both cells yield £0 to the loser, so the strict inequality fails. In one famous episode, contestant Nick announced he would *definitely* steal — then promised to share his winnings with Ibrahim afterward. This unconventional declaration changed Ibrahim's rational calculation: if Nick will steal regardless, Ibrahim might as well split (both outcomes give £0, but splitting at least leaves room for Nick's promised post-game transfer). It worked — Ibrahim split, and Nick split too.

<div class="embed-container"><iframe src="https://www.youtube.com/embed/S0qjK3TWZE8?rel=0" frameborder="0" allowfullscreen></iframe></div>

*Nick's announcement effectively eliminated the "Steal" column from Ibrahim's decision, transforming the game.*

---

# Chapter 2: Nash Equilibrium

## The Need for a Solution Concept

We now have a collection of strategic games. But which action profile will actually be played? To make a principled prediction, we need a **solution concept** — a theoretical criterion for identifying plausible outcomes.

The key insight comes from thinking about equilibrium beliefs. Consider **Odd-Even**: both players simultaneously say "even" or "odd." If both say the same word, both receive payoff 1; if they differ, both receive −1. Imagine playing this game repeatedly with many different classmates. Over time, you form beliefs about what others will choose. If those beliefs are correct — if everyone expects everyone else to say "even," and everyone therefore says "even" — then no one wants to deviate. This stable state of mutually correct beliefs is what Nash Equilibrium captures.

## Definition

The action profile <span>&#92;(a^*&#92;)</span> in a strategic game with ordinal preferences is a **Nash Equilibrium** if, for every player <span>&#92;(i&#92;)</span> and every action <span>&#92;(a_i&#92;)</span> of player <span>&#92;(i&#92;)</span>, the equilibrium profile is at least as good for player <span>&#92;(i&#92;)</span> as any unilateral deviation:

<span>&#92;[u_i(a^*) &#92;geq u_i(a_i, a_{-i}^*) &#92;quad &#92;forall\ i &#92;in N, &#92;quad &#92;forall\ a_i &#92;in A_i&#92;]</span>

where <span>&#92;(a_{-i}^*&#92;)</span> denotes the equilibrium actions of all players other than <span>&#92;(i&#92;)</span>, and <span>&#92;(N = &#92;{1, &#92;ldots, n&#92;}&#92;)</span> is the set of players. The notation <span>&#92;(a_{-i}&#92;)</span> always refers to "the action profile with player <span>&#92;(i&#92;)</span>'s action removed."

## Why Nash Equilibrium?

Two compelling rationales support NE as the central solution concept in game theory.

**Stable social convention.** When players from a large population are repeatedly matched to play the same game, they develop beliefs about how others play. Those beliefs shape their own choices. Eventually the process converges: beliefs become correct, and each player's action is a best response to those correct beliefs. Nash Equilibrium is precisely this resting point. Think of the convention in Canada that people keep to the right when passing in a corridor — once established, no individual benefits from deviating.

**Self-enforcing agreement.** If players could communicate beforehand and reach an agreement, a NE is an agreement that no player wants to renege on once the game is played. It is self-enforcing — no external enforcement is needed, because each player's equilibrium action is already optimal given what the others are doing. By contrast, (Quiet, Quiet) in the prisoner's dilemma is *not* a NE: even if both suspects agree to stay quiet, each has an individual incentive to fink. Self-enforcing agreements are far more likely to be observed in practice.

It is worth noting what NE does *not* guarantee. Not every player is fully rational. NE says nothing about the path to equilibrium — only that once there, no one deviates.

## Finding Nash Equilibria

One approach is to check every action profile and rule out those where some player can profitably deviate. Best response functions, developed in the next chapter, often make this more efficient.

**Stag Hunt with many players.** Consider the Stag Hunt with <span>&#92;(n&#92;)</span> hunters. There are exactly two Nash Equilibria: everyone hunts Stag, or everyone hunts Hare. Under the all-Stag profile, each hunter receives the highest possible payoff and no one can improve by switching to Hare (which would leave them with nothing). Under the all-Hare profile, any hunter who deviates to Stag gets nothing (since no one else cooperates) — not an improvement. No other profile is a NE: in any profile with at least one Stag-hunter and at least one Hare-hunter, the Stag-hunter can profitably switch to Hare.

**Guessing two-thirds of the average.** In the game introduced in Lecture 1 — choose an integer from 1 to 100, win if you're closest to two-thirds of the average — rational reasoning leads to a unique Nash Equilibrium. With two players, the action "1" weakly dominates all others: regardless of the opponent's choice, choosing 1 wins or ties but never strictly loses. With three players, the unique NE can be found by iteratively eliminating weakly dominated strategies, converging to all players choosing 1. We analyze this formally using best response functions in the next chapter.

---

# Chapter 3: Best Response Functions

## Definition

A player's **best response function** answers the question: given what the others are doing, what is my best action? Formally, for player <span>&#92;(i&#92;)</span>, the best response function <span>&#92;(B_i(a_{-i})&#92;)</span> maps each list of opponents' actions to the set of payoff-maximizing actions for player <span>&#92;(i&#92;)</span>:

<span>&#92;[B_i(a_{-i}) = &#92;left&#92;{ a_i &#92;in A_i &#92;;\middle|\; u_i(a_i, a_{-i}) &#92;geq u_i(a_i', a_{-i}) &#92;quad &#92;forall\ a_i' &#92;in A_i &#92;right&#92;}&#92;]</span>

Each element of <span>&#92;(B_i(a_{-i})&#92;)</span> is a best response of player <span>&#92;(i&#92;)</span> to the opponents' action list <span>&#92;(a_{-i}&#92;)</span>: given that every other player chooses their action in <span>&#92;(a_{-i}&#92;)</span>, player <span>&#92;(i&#92;)</span> can do no better than to pick some element of <span>&#92;(B_i(a_{-i})&#92;)</span>.

## Nash Equilibrium via Best Responses

The best response function gives a clean characterization of Nash Equilibrium. An action profile <span>&#92;(a^*&#92;)</span> is a Nash Equilibrium if and only if every player's action is a best response to the others':

<span>&#92;[a_i^* &#92;in B_i(a_{-i}^*) &#92;quad &#92;forall\ i &#92;in N&#92;]</span>

This is exactly the NE definition restated: at equilibrium, no player can do better by deviating, which means each player is playing a best response. When each player has a *unique* best response to every action list, this becomes a system of <span>&#92;(n&#92;)</span> equations in <span>&#92;(n&#92;)</span> unknowns:

<span>&#92;[a_i^* = b_i(a_{-i}^*) &#92;quad &#92;forall\ i &#92;in N&#92;]</span>

where <span>&#92;(b_i&#92;)</span> is the single-valued best response. Solving this system yields the Nash Equilibrium.

**Geometrically**, the NE corresponds to the intersection of the players' best response functions. When two best response curves cross on a graph, each player is simultaneously best-responding to the other's action — and that is precisely the definition.

## The Two-Player Guessing Game

In the two-player version of the 2/3-of-average game with action sets <span>&#92;(A_i = &#92;{1, 2, &#92;ldots, 10&#92;}&#92;)</span>, plotting the best response functions on a grid reveals their structure. Player 2's best response to any choice by Player 1 is the integer closest to two-thirds of that number, and vice versa. The two best response functions share a unique crossing point at <span>&#92;((1, 1)&#92;)</span> — the unique Nash Equilibrium. At any other action profile, at least one player has a profitable deviation downward, meaning the other intersection points are not Nash Equilibria.

## A Continuous Example: The Relationship Model

Best response functions are especially powerful for games with continuous action sets, where we can use calculus. Consider two players each choosing an effort level <span>&#92;(a_i &#92;geq 0&#92;)</span> to invest in a relationship. Player <span>&#92;(i&#92;)</span>'s payoff is:

<span>&#92;[u_i(a_i, a_j) = a_i(c + a_j - a_i)&#92;]</span>

where <span>&#92;(c > 0&#92;)</span> is a parameter capturing the baseline value of the relationship. Two features stand out. First, there is **complementarity** between the players' efforts: a higher <span>&#92;(a_j&#92;)</span> increases the return to player <span>&#92;(i&#92;)</span>'s own effort — investing in a relationship matters more when your partner also invests. Second, the <span>&#92;(-a_i^2&#92;)</span> term introduces diminishing returns, ensuring an interior optimum exists.

To find the best response, we maximize player <span>&#92;(i&#92;)</span>'s quadratic payoff over <span>&#92;(a_i&#92;)</span>. Since the payoff is concave in <span>&#92;(a_i&#92;)</span>, there is a unique maximum for any <span>&#92;(a_j&#92;)</span>:

<span>&#92;[b_i(a_j) = &#92;frac{1}{2}(c + a_j)&#92;]</span>

Both players have identical best response functions: optimal effort is half the sum of the baseline value and the partner's effort. This directly captures the complementarity — the harder your partner works, the harder you should work too.

The Nash Equilibrium satisfies:

<span>&#92;[a_1^* = &#92;frac{1}{2}(c + a_2^*) &#92;quad &#92;text{and} &#92;quad a_2^* = &#92;frac{1}{2}(c + a_1^*)&#92;]</span>

By symmetry, suppose <span>&#92;(a_1^* = a_2^* = a^*&#92;)</span>. Substituting into either equation:

<span>&#92;[a^* = &#92;frac{1}{2}(c + a^*) &#92;implies 2a^* = c + a^* &#92;implies a^* = c&#92;]</span>

The unique Nash Equilibrium is <span>&#92;((c, c)&#92;)</span> — both players exert effort equal to the baseline relationship value. The geometry confirms this: the two best response lines (each with slope <span>&#92;(\frac{1}{2}&#92;)</span> and intercept <span>&#92;(\frac{c}{2}&#92;)</span>) cross exactly at <span>&#92;((c, c)&#92;)</span>.

---

# Chapter 4: Dominated Strategies

## Strict Domination

Best response functions identify *optimal* actions. An equally useful idea identifies actions that are *never* optimal — actions a rational player would never choose, regardless of what the opponents do. Such actions are **strictly dominated**.

Formally, in a strategic game, player <span>&#92;(i&#92;)</span>'s action <span>&#92;(a_i''&#92;)</span> **strictly dominates** action <span>&#92;(a_i'&#92;)</span> if:

<span>&#92;[u_i(a_i'', a_{-i}) > u_i(a_i', a_{-i}) &#92;quad &#92;forall\ a_{-i}&#92;]</span>

The action <span>&#92;(a_i'&#92;)</span> is then said to be **strictly dominated**. Since a strictly dominated action is never a best response to *any* action list, and Nash Equilibrium actions are always best responses to the opponents' NE actions, it follows immediately that **strictly dominated actions are never used in any Nash Equilibrium**. We can therefore safely delete them before searching for NE.

More powerfully, we can iterate. After eliminating a strictly dominated action, the reduced game may reveal *new* dominated actions — actions that were not dominated in the original game but become so once certain opponent actions are removed. Continuing until no more eliminations are possible is called **Iterative Deletion of Dominated Strategies** (IDDS), or equivalently Iterated Elimination of Strictly Dominated Strategies (IESDS). Any Nash Equilibrium of the original game survives this process.

## Weak Domination

**Weak domination** relaxes the strictness condition. Player <span>&#92;(i&#92;)</span>'s action <span>&#92;(a_i''&#92;)</span> **weakly dominates** action <span>&#92;(a_i'&#92;)</span> if:

<span>&#92;[u_i(a_i'', a_{-i}) &#92;geq u_i(a_i', a_{-i}) &#92;quad &#92;forall\ a_{-i}&#92;]</span>

with at least one strict inequality. The key difference: **weakly dominated actions can appear in Nash Equilibria**, so we cannot simply discard them.

## The Voting Game

A voting game illustrates the distinction clearly. Suppose there are two candidates, A and B, and many voters. Each voter can vote for A or for B. Voters care only about who wins — not about their individual vote per se. Consider a voter who prefers candidate A. Is voting for B ever rational?

Voting for B is a **weakly dominated** strategy for this voter. In the vast majority of scenarios, a single vote makes no difference to the outcome — the margin is too large. But in the rare event that the election comes down to a single vote, the voter is **pivotal**: their choice determines the outcome, and they receive a strictly higher payoff by voting for the candidate they prefer. Voting for B is therefore weakly dominated by voting for A — never strictly better and sometimes strictly worse.

Yet the game has Nash Equilibria in which *all* voters vote for the less popular candidate. If every voter believes everyone else will vote for B, then no single voter can change the outcome no matter what they do. They are indifferent, and voting for B is a valid best response. This NE is composed entirely of weakly dominated strategies.

The lesson: unlike strict domination, weak domination does not justify elimination of strategies when searching for all Nash Equilibria. However, the procedure of **Iterative Elimination of Weakly Dominated Strategies** (IEWDS) — repeatedly removing weakly dominated actions until a unique profile remains — can serve as a refinement criterion, selecting among multiple NE by focusing on those that survive scrutiny. Under IEWDS, all voters voting for their preferred candidate is the uniquely surviving outcome of the voting game.

---

# Chapter 5: Cournot Competition

## Why the Cournot Model Matters

The Cournot model is far more than a classroom exercise in applying best response functions. It is a model that is important in its own right in economics because it allows us to study **strategic interaction within an industry** — specifically, it lets us predict how prices and quantities respond to changes in demand, changes in the cost structure of firms, and changes in the number of firms competing in a given market.

To understand why this matters in practice, consider the role of the Competition Bureau of Canada. Suppose two firms operating in the same industry apply to merge. The Bureau knows that a merger will reduce the number of competing firms, and it may also change costs if there are economies of scale. The central question it must answer is whether consumers will be better or worse off if the merger is approved. A Cournot-type model — estimated using real data on the industry — provides exactly the framework needed to answer that question. This is one reason why models of oligopoly competition are not merely theoretical abstractions; they are working tools in applied competition policy.

## The General Model

### Players, Actions, and Preferences

The **Cournot oligopoly game** involves <span>&#92;(n&#92;)</span> firms, each of which must simultaneously decide how much output to produce. Following the standard framework for a strategic game, we define three elements.

The **players** are the <span>&#92;(n&#92;)</span> firms.

The **actions** available to each firm <span>&#92;(i&#92;)</span> constitute the set of feasible output levels. Formally, firm <span>&#92;(i&#92;)</span> chooses a quantity <span>&#92;(q_i &#92;geq 0&#92;)</span>. Notice that <span>&#92;(q_i&#92;)</span> is a continuous variable: there is no requirement that output be a whole number. Think of firms producing grain or some other divisible commodity rather than discrete units like automobiles.

The **preferences** of each firm are represented by its profit. Firms are assumed to be profit-maximizing, so each firm <span>&#92;(i&#92;)</span> has a payoff function equal to revenues minus costs:

<span>&#92;[&#92;pi_i(q_1, &#92;ldots, q_n) = q_i &#92;, P(q_1 + &#92;cdots + q_n) - C_i(q_i)&#92;]</span>

Here <span>&#92;(C_i(q_i)&#92;)</span> is the total cost function for firm <span>&#92;(i&#92;)</span>, which is increasing in <span>&#92;(q_i&#92;)</span> — the more you produce, the higher your costs. The term <span>&#92;(P(q_1 + &#92;cdots + q_n)&#92;)</span> is the **inverse demand function**, which gives the equilibrium market price as a function of the total quantity produced across all firms. We call it an inverse demand function because, while a conventional demand function tells us how much consumers will buy at a given price, this function inverts that relationship and tells us what price will prevail given total market output. Crucially, this price is decreasing in total output: the more all firms collectively produce, the lower the market price — as long as price remains above zero.

The strategic tension in this model is immediate. Each firm wants to produce more output because that means more units to sell at the prevailing price. But when any single firm produces more, it floods the market, depresses the equilibrium price, and thereby hurts not only its own per-unit revenue but also the revenues of every other firm. This is the negative externality that lies at the heart of Cournot competition.

### The Specific Duopoly Case

To make the model tractable, we work through a specific case in detail. We assume <span>&#92;(n = 2&#92;)</span>, so we have a **duopoly**. The cost function is linear with a constant **unit cost** <span>&#92;(c&#92;)</span>, so <span>&#92;(C_i(q_i) = c q_i&#92;)</span> for each firm. The inverse demand function is linear:

<span>&#92;[P(q_1 + q_2) = &#92;begin{cases} &#92;alpha - q_1 - q_2 &amp;&#92;text{if } q_1 + q_2 &#92;leq &#92;alpha &#92;&#92; 0 &amp;&#92;text{if } q_1 + q_2 &gt; &#92;alpha &#92;end{cases}&#92;]</span>

The parameter <span>&#92;(&#92;alpha &gt; 0&#92;)</span> is the maximum price this market can sustain — the price at which consumers would demand nothing, so it is the intercept of the demand curve. We require <span>&#92;(c &gt; 0&#92;)</span> as a basic economic assumption, and we require <span>&#92;(c &lt; &#92;alpha&#92;)</span>. This second condition deserves a moment's explanation: if <span>&#92;(c &#92;geq &#92;alpha&#92;)</span>, the market price could never exceed the unit cost of production, and no firm would ever find it worthwhile to produce anything. The case <span>&#92;(c &lt; &#92;alpha&#92;)</span> is therefore the only situation worth analyzing.

## Payoffs in the Linear Duopoly

Substituting the linear inverse demand and the unit cost into the profit function, firm <span>&#92;(i&#92;)</span>'s payoff is:

<span>&#92;[&#92;pi_i(q_1, q_2) = &#92;begin{cases} q_i(&#92;alpha - c - q_1 - q_2) &amp;&#92;text{if } q_1 + q_2 &#92;leq &#92;alpha &#92;&#92; -c q_i &amp;&#92;text{if } q_1 + q_2 &gt; &#92;alpha &#92;end{cases}&#92;]</span>

When total output exceeds <span>&#92;(&#92;alpha&#92;)</span>, the market price is zero and firm <span>&#92;(i&#92;)</span>'s only cash flow is the negative cost <span>&#92;(-c q_i&#92;)</span>. In that region the firm clearly maximizes its payoff by choosing <span>&#92;(q_i = 0&#92;)</span>. Since both firms would choose zero output there, neither will ever find it optimal to push output so high that it exceeds <span>&#92;(&#92;alpha&#92;)</span> in equilibrium. Our analysis therefore focuses on the interior case where <span>&#92;(q_1 + q_2 &#92;leq &#92;alpha&#92;)</span>, and we will verify that the equilibrium quantities we find do indeed satisfy this condition.

## Deriving the Best Response Functions

### The Interior Solution

To find each firm's best response, we proceed as follows. Firm 1 takes <span>&#92;(q_2&#92;)</span> as given — it cannot control what the other firm produces — and chooses <span>&#92;(q_1&#92;)</span> to maximize its profit. This profit function is quadratic in <span>&#92;(q_1&#92;)</span>:

<span>&#92;[&#92;pi_1(q_1, q_2) = q_1(&#92;alpha - c - q_1 - q_2)&#92;]</span>

Taking the derivative with respect to <span>&#92;(q_1&#92;)</span> and setting it equal to zero gives the **first-order condition**:

<span>&#92;[&#92;frac{&#92;partial &#92;pi_1}{&#92;partial q_1} = &#92;alpha - c - 2q_1 - q_2 = 0&#92;]</span>

Solving for <span>&#92;(q_1&#92;)</span>:

<span>&#92;[q_1 = &#92;frac{1}{2}(&#92;alpha - c - q_2)&#92;]</span>

This is the interior solution. It says that firm 1's optimal output is decreasing in <span>&#92;(q_2&#92;)</span>: the more the rival produces, the less firm 1 wants to produce. This negative slope is the hallmark of **strategic substitutes** — quantities are strategic substitutes because each firm's best response calls for less of the good when its rival chooses more.

For those uncomfortable with calculus, there is an equivalent way to arrive at the same expression. Since <span>&#92;(&#92;pi_1&#92;)</span> is a downward-opening quadratic in <span>&#92;(q_1&#92;)</span>, its maximum lies at the midpoint of its two roots (the values of <span>&#92;(q_1&#92;)</span> at which profit equals zero). Finding those roots and taking the midpoint yields exactly <span>&#92;(&#92;frac{1}{2}(&#92;alpha - c - q_2)&#92;)</span>.

### The Corner Solution

We must be careful, however. Quantities must be non-negative. If <span>&#92;(q_2&#92;)</span> is large enough that the formula above would give a negative number, it is no longer valid. Specifically, when <span>&#92;(q_2 &gt; &#92;alpha - c&#92;)</span>, the term <span>&#92;(&#92;alpha - c - q_2&#92;)</span> is negative. The profit function <span>&#92;(&#92;pi_1 = q_1(&#92;alpha - c - q_1 - q_2)&#92;)</span> then has a negative second factor for any positive <span>&#92;(q_1&#92;)</span>, making profit negative. Firm 1 is better off choosing <span>&#92;(q_1 = 0&#92;)</span> and earning zero rather than producing anything and incurring a loss.

### The Complete Best Response Function

Combining the interior and corner cases, firm 1's **best response function** is:

<span>&#92;[b_1(q_2) = &#92;begin{cases} &#92;dfrac{1}{2}(&#92;alpha - c - q_2) &amp;&#92;text{if } q_2 &#92;leq &#92;alpha - c &#92;&#92;[6pt] 0 &amp;&#92;text{if } q_2 &gt; &#92;alpha - c &#92;end{cases}&#92;]</span>

Because firm 2 has the same cost function, its best response function is obtained by symmetry — simply interchange the labels 1 and 2:

<span>&#92;[b_2(q_1) = &#92;begin{cases} &#92;dfrac{1}{2}(&#92;alpha - c - q_1) &amp;&#92;text{if } q_1 &#92;leq &#92;alpha - c &#92;&#92;[6pt] 0 &amp;&#92;text{if } q_1 &gt; &#92;alpha - c &#92;end{cases}&#92;]</span>

## The Best Response Function Graph

Before solving algebraically, it is worth drawing these functions, as the graph provides important geometric intuition and guards against errors that pure algebra might conceal.

Place <span>&#92;(q_1&#92;)</span> on the horizontal axis and <span>&#92;(q_2&#92;)</span> on the vertical axis. Firm 1's best response function <span>&#92;(b_1(q_2)&#92;)</span> is drawn as a function of <span>&#92;(q_2&#92;)</span>, so it describes a downward-sloping line segment. When <span>&#92;(q_2 = 0&#92;)</span>, the best response is <span>&#92;(q_1 = &#92;frac{1}{2}(&#92;alpha - c)&#92;)</span>, which is the horizontal intercept of this line. When <span>&#92;(q_2 = &#92;alpha - c&#92;)</span>, the interior formula gives <span>&#92;(q_1 = 0&#92;)</span>, which is the point where the line meets the vertical axis. For values of <span>&#92;(q_2&#92;)</span> above <span>&#92;(&#92;alpha - c&#92;)</span>, the best response is zero, so the function runs along the vertical axis. Together these two segments — the downward-sloping interior piece and the flat portion along the axis — form the complete best response curve for firm 1.

Firm 2's best response function <span>&#92;(b_2(q_1)&#92;)</span> is symmetric: it is also a downward-sloping line (with slope <span>&#92;(-&#92;frac{1}{2}&#92;)</span>) starting at <span>&#92;(q_2 = &#92;frac{1}{2}(&#92;alpha - c)&#92;)</span> when <span>&#92;(q_1 = 0&#92;)</span> and reaching zero when <span>&#92;(q_1 = &#92;alpha - c&#92;)</span>, beyond which it lies flat along the horizontal axis.

The two interior segments intersect at a single point. That intersection is the Nash equilibrium, because it is the unique pair <span>&#92;((q_1, q_2)&#92;)</span> at which both firms are simultaneously best-responding to each other. Visually checking this is essential: with different cost structures across firms, the two curves could intersect on the axis portion rather than in the interior, leading to a corner equilibrium rather than the symmetric interior one we find here. Always drawing the graph prevents being misled by algebra alone.

## Nash Equilibrium

### Computing the Equilibrium Quantities

The Nash equilibrium is found by solving the two best response functions simultaneously. Setting each firm's output equal to its best response to the other's output:

<span>&#92;[&#92;begin{aligned} q_1 &amp;= &#92;tfrac{1}{2}(&#92;alpha - c - q_2) &#92;&#92; q_2 &amp;= &#92;tfrac{1}{2}(&#92;alpha - c - q_1) &#92;end{aligned}&#92;]</span>

By the symmetry of the system, we can guess — and then verify — that <span>&#92;(q_1^* = q_2^*&#92;)</span>. Substituting <span>&#92;(q_2^* = q_1^*&#92;)</span> into the first equation:

<span>&#92;[q_1^* = &#92;frac{1}{2}(&#92;alpha - c - q_1^*) &#92;implies &#92;frac{3}{2}q_1^* = &#92;frac{&#92;alpha - c}{2} &#92;implies q_1^* = &#92;frac{&#92;alpha - c}{3}&#92;]</span>

The unique **Nash equilibrium** of the linear Cournot duopoly is therefore the **symmetric Nash equilibrium**:

<span>&#92;[(q_1^*, q_2^*) = &#92;left(&#92;frac{&#92;alpha - c}{3},&#92; &#92;frac{&#92;alpha - c}{3}&#92;right)&#92;]</span>

We can now verify our earlier assumption: total output is <span>&#92;(q_1^* + q_2^* = &#92;&#92;frac{2}{3}(&#92;alpha - c)&#92;)</span>, which is less than <span>&#92;(&#92;alpha&#92;)</span> since <span>&#92;(c &gt; 0&#92;)</span>. The assumption <span>&#92;(q_1 + q_2 &#92;leq &#92;alpha&#92;)</span> is confirmed.

### Equilibrium Price

With both firms producing <span>&#92;(&#92;&#92;frac{&#92;alpha - c}{3}&#92;)</span>, the equilibrium market price is:

<span>&#92;[P^* = &#92;alpha - q_1^* - q_2^* = &#92;alpha - &#92;frac{2}{3}(&#92;alpha - c) = &#92;frac{&#92;alpha}{3} + &#92;frac{2c}{3}&#92;]</span>

This price is strictly positive (since <span>&#92;(c &gt; 0&#92;)</span> and <span>&#92;(&#92;alpha &gt; 0&#92;)</span>), confirming that we are in the valid region of the demand function.

## Comparative Statics

The equilibrium results allow us to trace how the market outcome responds to changes in the underlying parameters, an exercise known as **comparative statics**.

Consider first an increase in <span>&#92;(&#92;alpha&#92;)</span>. Recall that <span>&#92;(&#92;alpha&#92;)</span> is the intercept of the inverse demand function — it captures how much consumers are willing to pay at zero output, and hence represents the strength of demand. When <span>&#92;(&#92;alpha&#92;)</span> rises, both the equilibrium quantity <span>&#92;(&#92;&#92;frac{&#92;alpha - c}{3}&#92;)</span> and the equilibrium price <span>&#92;(&#92;&#92;frac{&#92;alpha}{3} + &#92;&#92;frac{2c}{3}&#92;)</span> increase. Higher consumer willingness to pay draws out more production and supports a higher market price. This is the intuitive result one would expect from any supply-and-demand analysis.

Now consider an increase in the unit cost <span>&#92;(c&#92;)</span>. Higher costs reduce each firm's willingness to produce: equilibrium output <span>&#92;(&#92;&#92;frac{&#92;alpha - c}{3}&#92;)</span> falls. With less total output on the market, the equilibrium price <span>&#92;(&#92;&#92;frac{&#92;alpha}{3} + &#92;&#92;frac{2c}{3}&#92;)</span> rises. This too is intuitive: when production becomes more expensive, firms produce less and prices go up.

## Collusion and Competition Policy

### Why Firms Would Want to Collude

Once we know the Nash equilibrium, a natural question arises: are these firms satisfied with this outcome, or could they do better? The answer is striking. There exists a **collusive outcome** at which both firms would earn higher profits than they do in the Nash equilibrium. This outcome is **Pareto superior** for the firms — both are better off compared to the Nash equilibrium.

How would such an outcome look? Both firms would agree to produce quantities smaller than the Cournot equilibrium quantities. With less total output flooding the market, the equilibrium price would rise. The higher price more than compensates for the lower volume, so both firms earn larger profits. In other words, by jointly restricting their output relative to what they would individually choose, the two firms can collectively capture more surplus from the market.

The intuition runs through the concept of a negative externality. When firm 1 produces an additional unit of output, it depresses the market price. That price reduction hurts not only firm 1's own revenues but also firm 2's revenues on every unit firm 2 sells. Firm 1, however, does not account for the harm it inflicts on firm 2 — it cares only about its own profit. As a result, each firm produces more than would be jointly optimal, and the Nash equilibrium involves too much output from the perspective of the firms' collective interest.

### Why Collusion Is Illegal

This analysis explains precisely why competition authorities prohibit collusive behavior. If the two firms were allowed to get together and agree to restrict their output, prices would rise, profits would increase, and consumers would pay more. The Competition Bureau of Canada — along with analogous agencies in other jurisdictions — forbids firms from entering into agreements to fix prices, restrict output, or divide markets for exactly this reason. The Cournot model makes the mechanism transparent: the Nash equilibrium, while bad for firms relative to collusion, is the outcome consumers prefer.

## The Effect of Entry: Price and the Number of Firms

One of the most powerful applications of the Cournot model is to ask what happens to the equilibrium price as the number of competing firms grows. With <span>&#92;(n&#92;)</span> symmetric firms each facing a unit cost of <span>&#92;(c&#92;)</span> and the same linear inverse demand, the symmetric Nash equilibrium output per firm is <span>&#92;(&#92;&#92;frac{&#92;alpha - c}{n+1}&#92;)</span>, so the equilibrium price is:

<span>&#92;[P^*(n) = &#92;frac{&#92;alpha + nc}{n+1}&#92;]</span>

As <span>&#92;(n &#92;to &#92;infty&#92;)</span>, this expression approaches <span>&#92;(c&#92;)</span>. In other words, as the number of firms in the industry grows without bound, the equilibrium price converges to the **marginal cost** of production. Firms will never sell goods below their cost — doing so would mean choosing to incur a loss — but with increasing competition they are driven ever closer to that lower bound.

This result is both intuitive and reassuring. More competition keeps prices low and benefits consumers. The Cournot model thus captures the same fundamental insight as the perfectly competitive model, but derives it endogenously from firms' strategic behavior rather than from an assumption of price-taking. The outcome where price equals marginal cost is the best possible outcome for consumers given that firms must at least break even, and the Cournot model shows that this outcome is approached in the limit of free entry.

## Generalization: The Commons Problem

The Cournot model turns out to capture something much more general than firms competing in a market. Notice that each firm's profit can be written in the form:

<span>&#92;[&#92;pi_i = f_i(q_i,&#92; q_1 + q_2 + &#92;cdots + q_n)&#92;]</span>

where <span>&#92;(f_i&#92;)</span> is decreasing in its second argument. The payoff to any one player falls as the total aggregate action of all players rises, while each player controls only their own contribution to that aggregate. This structure captures any situation in which players compete to exploit a piece of **common property** whose value to each individual diminishes with total use.

A classic example is a **village grazing field**. Imagine a community of farmers who share a common pasture. Each farmer decides how many sheep to put out to graze. The more sheep there are on the pasture in total, the less grass each sheep gets, the less weight each sheep gains, and the lower the value of the flock to any individual farmer. When a farmer adds one more sheep, she receives the full benefit of that additional sheep but imposes the cost of reduced grazing quality on every other farmer's flock. Just as in the Cournot game, each individual ignores the negative externality she inflicts on others, and as a result the commons is overused in equilibrium.

The parallel between the two games is exact. In the Cournot game the common property is the consumer market, whose capacity to support high prices diminishes as more output floods in. In the grazing game the common property is the pasture, whose productivity diminishes as more sheep are added. In both cases, there is a collusive outcome — restricting individual use below the Nash equilibrium level — that would make every participant better off. And in both cases, reaching that outcome requires some form of coordination or enforcement that the non-cooperative equilibrium cannot deliver on its own.

From the consumers' perspective, overuse of the market is actually a good thing — it means more output and lower prices. But for common resources like forests or fisheries, overuse leads to depletion that harms everyone, including future generations. The Cournot model thus provides the conceptual foundation for understanding the **tragedy of the commons**, the pervasive tendency for individually rational behavior to collectively exhaust shared resources.

---

# Chapter 6: Bertrand Competition

## Overview and Contrast with Cournot

The Cournot model, developed in the previous chapter, gives us one way to think about how firms compete in an industry with a small number of players. Recall that in Cournot's framework the strategic variable is **quantity**: each firm simultaneously chooses how many units to produce, the market-clearing price then adjusts to balance supply and demand, and firms earn profits accordingly. The **Bertrand model of oligopoly**, named after the French mathematician Joseph Bertrand who critiqued Cournot's work in 1883, addresses many of the same questions — equilibrium output, equilibrium prices, how market structure relates to social welfare — but from a fundamentally different angle. In Bertrand's model, firms choose a **price**, not a quantity. That single change in the strategic variable turns out to have far-reaching consequences for the equilibrium prediction.

In many real-world industries this is in fact the more natural description of competition. Retail chains post price tags; airlines publish fares; internet retailers display a price and commit to filling any order placed at that price. Once a firm names a price and customers arrive, the firm is obligated to satisfy demand at that price. This commitment is built directly into the Bertrand model.

## The General Model Setup

### Players, Actions, and Preferences

Consider an industry with <span>&#92;(n&#92;)</span> firms. Firm <span>&#92;(i&#92;)</span> incurs a cost <span>&#92;(C_i(q_i)&#92;)</span> to produce <span>&#92;(q_i&#92;)</span> units, where <span>&#92;(C_i&#92;)</span> is an increasing function of output. The total quantity that consumers demand when the market price is <span>&#92;(p&#92;)</span> is given by the **demand function** <span>&#92;(D(p)&#92;)</span>, which is decreasing in <span>&#92;(p&#92;)</span> for all <span>&#92;(p&#92;)</span> at which demand is non-negative. Notice the contrast with Cournot: there we used an inverse demand function expressing price as a function of aggregate quantity; here we express quantity demanded as a function of price. The underlying relationship between price and quantity is the same — it is simply written in one direction versus the other.

Firms simultaneously announce prices. Consumers, observing all posted prices, purchase entirely from whichever firm has set the lowest price. If more than one firm ties for the lowest price, they share demand equally among themselves. Critically, once a firm sets a price it must satisfy whatever demand arrives at that price.

Formalised as a strategic game:

- **Players:** the <span>&#92;(n&#92;)</span> firms.
- **Actions:** each firm <span>&#92;(i&#92;)</span> chooses a price <span>&#92;(p_i &#92;geq 0&#92;)</span>. Importantly, prices are treated as continuous — not restricted to whole cents — and this continuity assumption will matter when we derive best response functions.
- **Preferences:** each firm's preferences are represented by its profit <span>&#92;(&#92;pi_i&#92;)</span>. If firm <span>&#92;(i&#92;)</span> is one of <span>&#92;(m&#92;)</span> firms that jointly set the lowest price, then each receives <span>&#92;(1/m&#92;)</span> of total demand and earns

<span>&#92;[ &#92;pi_i = p_i &#92;cdot &#92;frac{D(p_i)}{m} - C_i&#92;!\left(&#92;frac{D(p_i)}{m}&#92;right). &#92;]</span>

If some other firm has set a strictly lower price, firm <span>&#92;(i&#92;)</span> sells nothing and earns <span>&#92;(&#92;pi_i = 0&#92;)</span>.

## A Tractable Example: Duopoly with Linear Demand and Constant Unit Cost

### Setup

As with Cournot, a specific functional form makes the analysis concrete. Take <span>&#92;(n = 2&#92;)</span> firms. Each firm has a **constant unit cost** <span>&#92;(c > 0&#92;)</span>, so that <span>&#92;(C_i(q_i) = c &#92;, q_i&#92;)</span>. The demand function is linear:

<span>&#92;[ D(p) = &#92;begin{cases} &#92;alpha - p &amp; &#92;text{if } p &#92;leq &#92;alpha &#92;&#92; 0 &amp; &#92;text{if } p > &#92;alpha, &#92;end{cases} &#92;]</span>

where <span>&#92;(&#92;alpha > 0&#92;)</span> is the intercept of demand (the quantity demanded if price were zero) and <span>&#92;(&#92;alpha&#92;)</span> also serves as the **choke price** beyond which no consumer is willing to buy. The parameter restriction <span>&#92;(c &lt; &#92;alpha&#92;)</span> ensures that production is worthwhile: if <span>&#92;(c &#92;geq &#92;alpha&#92;)</span>, demand would be zero at every price at or above the unit cost, so the market would be economically vacuous.

### Payoff Structure

With two firms the profit for firm <span>&#92;(i&#92;)</span> (where <span>&#92;(j&#92;)</span> denotes the other firm) takes three forms depending on how the prices compare:

<span>&#92;[ &#92;pi_i(p_1, p_2) = &#92;begin{cases} (p_i - c)(&#92;alpha - p_i) &amp; &#92;text{if } p_i &lt; p_j &#92;&#92; &#92;frac{1}{2}(p_i - c)(&#92;alpha - p_i) &amp; &#92;text{if } p_i = p_j &#92;&#92; 0 &amp; &#92;text{if } p_i > p_j. &#92;end{cases} &#92;]</span>

When firm <span>&#92;(i&#92;)</span> charges the strictly lower price it captures all demand <span>&#92;(&#92;alpha - p_i&#92;)</span> and earns <span>&#92;(p_i - c&#92;)</span> on each unit. When both prices are equal they split the market. When firm <span>&#92;(i&#92;)</span> charges more it is priced out entirely.

### The Monopoly Price

Before deriving best responses it is useful to define the **monopoly price** <span>&#92;(p^M&#92;)</span> as the value of <span>&#92;(p&#92;)</span> that maximises the expression <span>&#92;((p - c)(&#92;alpha - p)&#92;)</span>. Why is this the monopoly price? Imagine a single firm in the market. It would choose <span>&#92;(p&#92;)</span> to maximise profit <span>&#92;((p - c) \cdot D(p) = (p - c)(&#92;alpha - p)&#92;)</span>. That maximising price is precisely <span>&#92;(p^M&#92;)</span>. The expression is quadratic in <span>&#92;(p&#92;)</span> and concave, so there is a unique interior maximum. Setting the derivative to zero gives

<span>&#92;[ p^M = &#92;frac{&#92;alpha + c}{2}. &#92;]</span>

No firm would ever voluntarily set a price above <span>&#92;(p^M&#92;)</span>, because doing so would reduce profit relative to charging <span>&#92;(p^M&#92;)</span> even when capturing the whole market. This ceiling will organise the case analysis below.

## Best Response Functions

### Case 1: <span>&#92;(p_j &lt; c&#92;)</span>

Suppose the rival firm has set a price strictly below the common marginal cost. What should firm <span>&#92;(i&#92;)</span> do?

- Setting <span>&#92;(p_i &lt; p_j&#92;)</span> means firm <span>&#92;(i&#92;)</span> captures the entire market but sells every unit at a price strictly below cost, yielding strictly negative profit.
- Setting <span>&#92;(p_i = p_j&#92;)</span> still means selling at below cost — firm <span>&#92;(i&#92;)</span> earns half the market but still loses money on each unit, so profit is again negative.
- Setting <span>&#92;(p_i > p_j&#92;)</span> means firm <span>&#92;(i&#92;)</span> sells nothing and earns exactly zero.

Zero beats any negative number, so the best response here is to **lose the price war intentionally** — to set any price strictly above <span>&#92;(p_j&#92;)</span>:

<span>&#92;[ B_i(p_j) = &#92;{p_i : p_i > p_j&#92;} &#92;quad &#92;text{if } p_j &lt; c. &#92;]</span>

### Case 2: <span>&#92;(p_j = c&#92;)</span>

Now suppose the rival prices exactly at marginal cost.

- Setting <span>&#92;(p_i &lt; c&#92;)</span> means selling below cost, earning negative profit.
- Setting <span>&#92;(p_i = c&#92;)</span> means splitting demand but earning zero margin per unit — profit is zero.
- Setting <span>&#92;(p_i > c&#92;)</span> means being undercut, selling nothing — profit is again zero.

Both <span>&#92;(p_i = c&#92;)</span> and any <span>&#92;(p_i > c&#92;)</span> yield zero profit, which is the best achievable. The best response set is therefore all prices at or above <span>&#92;(c&#92;)</span>:

<span>&#92;[ B_i(p_j) = &#92;{p_i : p_i &#92;geq c&#92;} &#92;quad &#92;text{if } p_j = c. &#92;]</span>

### Case 3: <span>&#92;(c &lt; p_j &#92;leq p^M&#92;)</span>

This is the most subtle case. The rival's price is above cost but no higher than the monopoly price. Any <span>&#92;(p_i&#92;)</span> in the open interval <span>&#92;((c, p_j)&#92;)</span> earns firm <span>&#92;(i&#92;)</span> a strictly positive profit — it captures the whole market at a price above cost. Moreover, this profit is increasing in <span>&#92;(p_i&#92;)</span> as <span>&#92;(p_i&#92;)</span> rises toward <span>&#92;(p_j&#92;)</span> (since we are still below the monopoly price and the per-unit margin is rising). At exactly <span>&#92;(p_i = p_j&#92;)</span> profit drops discontinuously: firm <span>&#92;(i&#92;)</span> now splits demand with the rival and earns only half the profit it would have earned by charging infinitesimally less. For any <span>&#92;(p_i > p_j&#92;)</span> profit collapses to zero.

The picture is of a profit function that climbs steadily as <span>&#92;(p_i&#92;)</span> approaches <span>&#92;(p_j&#92;)</span> from below, then drops sharply at <span>&#92;(p_j&#92;)</span>, then remains at zero. Firm <span>&#92;(i&#92;)</span> wants to get as close to <span>&#92;(p_j&#92;)</span> as possible without actually reaching it — but because prices are drawn from a continuum, there is no such closest point. For any candidate price <span>&#92;(p_j - &#92;varepsilon&#92;)</span> one can always find <span>&#92;(p_j - &#92;varepsilon/2&#92;)</span>, which is even better. Consequently, **the best response set is empty**:

<span>&#92;[ B_i(p_j) = &#92;emptyset &#92;quad &#92;text{if } c &lt; p_j &#92;leq p^M. &#92;]</span>

This empty best response would not arise if prices were restricted to a discrete grid (say, whole cents). In that discrete setting the best response would simply be to charge one cent below <span>&#92;(p_j&#92;)</span>. The textbook exercise 67.2 asks you to work through that case explicitly.

### Case 4: <span>&#92;(p_j > p^M&#92;)</span>

If the rival prices strictly above the monopoly price it has effectively removed itself from competition. Consumers will never buy from a firm charging above <span>&#92;(p^M&#92;)</span> when firm <span>&#92;(i&#92;)</span> can do better. From firm <span>&#92;(i&#92;)</span>'s perspective it is as though there is no rival at all. The profit-maximising response is simply to act as a monopolist and charge <span>&#92;(p^M&#92;)</span>:

<span>&#92;[ B_i(p_j) = &#92;{p^M&#92;} &#92;quad &#92;text{if } p_j > p^M. &#92;]</span>

### Summary of the Best Response Function

Combining the four cases:

<span>&#92;[ B_i(p_j) = &#92;begin{cases} &#92;{p_i : p_i > p_j&#92;} &amp; &#92;text{if } p_j &lt; c &#92;&#92; &#92;{p_i : p_i &#92;geq c&#92;} &amp; &#92;text{if } p_j = c &#92;&#92; &#92;emptyset &amp; &#92;text{if } c &lt; p_j &#92;leq p^M &#92;&#92; &#92;{p^M&#92;} &amp; &#92;text{if } p_j > p^M. &#92;end{cases} &#92;]</span>

Notice two distinctive features of this best response correspondence. For some values of <span>&#92;(p_j&#92;)</span> (cases 1 and 2) there are multiple best responses; for others (case 3) there is no best response at all. This is a set-valued, and in places empty-valued, correspondence — qualitatively different from the smooth best response functions encountered in Cournot.

## Finding the Nash Equilibrium via Best Response Functions

A Nash equilibrium is a pair of prices <span>&#92;((p_1^*, p_2^*)&#92;)</span> such that each price is in the best response set to the other: <span>&#92;(p_1^* &#92;in B_1(p_2^*)&#92;)</span> and <span>&#92;(p_2^* &#92;in B_2(p_1^*)&#92;)</span>. Graphically, a Nash equilibrium lies at the intersection of the graphs of the two best response correspondences.

When we superimpose the best response graph of firm 1 (plotting the best responses to each value of <span>&#92;(p_2&#92;)</span>) onto that of firm 2, the only point at which they intersect is the single point <span>&#92;((c, c)&#92;)</span>. For <span>&#92;(p_j&#92;)</span> below <span>&#92;(c&#92;)</span>, best responses exclude the 45-degree line (the equal-price diagonal); for <span>&#92;(p_j&#92;)</span> strictly between <span>&#92;(c&#92;)</span> and <span>&#92;(p^M&#92;)</span>, no best response exists at all. The graphs come together at exactly one point: both firms charging <span>&#92;(c&#92;)</span>.

The **unique Nash equilibrium** of the Bertrand duopoly game is therefore:

<span>&#92;[ (p_1^*, p_2^*) = (c, c). &#92;]</span>

## Verification by Profitable Deviation

The same conclusion can be reached by the first method we learned — examining every possible action profile and checking whether any player can make a profitable deviation. This approach is instructive because it makes the logic of the equilibrium transparent. There are two steps: show that <span>&#92;((c, c)&#92;)</span> is indeed a Nash equilibrium, then show that nothing else can be.

### Step 1: <span>&#92;((c, c)&#92;)</span> Is a Nash Equilibrium

At <span>&#92;((c, c)&#92;)</span> both firms split demand and earn zero profit. Can either deviate profitably?

- If firm <span>&#92;(i&#92;)</span> lowers its price below <span>&#92;(c&#92;)</span>, it captures the entire market but sells every unit at below cost, earning strictly negative profit. That is worse than zero, so this is not a profitable deviation.
- If firm <span>&#92;(i&#92;)</span> raises its price above <span>&#92;(c&#92;)</span>, the rival (still at <span>&#92;(c&#92;)</span>) captures all demand. Firm <span>&#92;(i&#92;)</span> sells nothing and earns zero — no better than before. This too is not a profitable deviation.

Neither firm can do strictly better by changing its price unilaterally, confirming that <span>&#92;((c, c)&#92;)</span> is a Nash equilibrium.

### Step 2: No Other Price Profile Is a Nash Equilibrium

Every possible price profile <span>&#92;((p_1, p_2) &#92;neq (c, c)&#92;)</span> falls into one of three exhaustive cases.

**Case A: At least one firm prices below cost.** If <span>&#92;(p_i &lt; c&#92;)</span> for some <span>&#92;(i&#92;)</span>, that firm earns negative profit (it either has the lowest price and sells at a loss, or ties for the lowest price and sells at a loss on its share). That firm can raise its price to <span>&#92;(c&#92;)</span> and guarantee zero profit — a strictly profitable deviation. So no such profile is a Nash equilibrium.

**Case B: <span>&#92;(p_i = c&#92;)</span> and <span>&#92;(p_j > c&#92;)</span>.** Firm <span>&#92;(i&#92;)</span> is currently charging cost and earning zero profit. But if it raises its price slightly — to any value strictly between <span>&#92;(c&#92;)</span> and <span>&#92;(p_j&#92;)</span> — it still has the lower price, captures the entire market, and now earns a strictly positive margin on every unit. That is a profitable deviation, so this profile is not a Nash equilibrium.

**Case C: Both firms price strictly above cost.** Without loss of generality suppose <span>&#92;(p_i &#92;geq p_j&#92;)</span>. Firm <span>&#92;(i&#92;)</span> is either tied for the high price or is the outright high-price firm; in either case it can do better. If <span>&#92;(p_j &lt; &#92;alpha&#92;)</span>, firm <span>&#92;(i&#92;)</span> can undercut by pricing just below <span>&#92;(p_j&#92;)</span>, capturing the whole market at a price well above cost and earning a large positive profit. If <span>&#92;(p_j &#92;geq &#92;alpha&#92;)</span>, demand is zero anyway, and firm <span>&#92;(i&#92;)</span> can profitably deviate to <span>&#92;(p^M&#92;)</span> which generates strictly positive profit. In either sub-case, a profitable deviation exists.

Since every profile other than <span>&#92;((c, c)&#92;)</span> admits a profitable deviation for at least one firm, <span>&#92;((c, c)&#92;)</span> is the **unique Nash equilibrium** of the Bertrand game.

## The Bertrand Paradox

The equilibrium result is striking enough to have earned its own name. The **Bertrand paradox** is the observation that, in the model described above, just two firms competing on price are sufficient to reproduce the outcome of perfect competition: price equals marginal cost, and economic profit is zero. In Cournot's model with two firms we obtained a price strictly above marginal cost (and falling toward the competitive price only as the number of firms grows to infinity). Bertrand's model collapses to the competitive outcome immediately with only two competitors.

Why is this called a paradox? In practice, markets with two or three firms very rarely look like perfectly competitive markets. Prices typically exceed marginal cost even in duopolies, firms earn positive profits, and consumers do not capture all surplus. The model's starkly competitive prediction seems to strain credulity.

The resolution lies in examining the model's assumptions. Several of them are particularly severe:

1. **Homogeneous goods.** The model assumes that the two firms sell perfectly identical products. If consumers care even slightly about brand, convenience, or quality differences, the demand-goes-entirely-to-the-cheapest-firm rule breaks down.

2. **No capacity constraints.** After setting a price each firm must satisfy all demand. If firms face capacity limits they may not be able to serve the entire market even at the lowest price, which changes the strategic incentives fundamentally.

3. **Continuous prices.** The no-best-response result in case 3 depends on prices being drawn from a continuum. With discrete prices (whole cents) the equilibrium changes in character.

**Product differentiation** is the most commonly invoked resolution in economics. When firms sell goods that are imperfect substitutes — differentiated by branding, location, quality, or features — a firm that prices slightly above its rival does not lose all its customers. Some customers prefer firm <span>&#92;(i&#92;)</span>'s product and will pay a modest premium for it. This restores the existence of a best response and typically yields an equilibrium with prices above marginal cost and positive profits, as observed in most real oligopolies. Chapters on differentiated competition develop this idea formally.

## Cournot versus Bertrand: A Comparison

The contrast between Cournot and Bertrand is one of the central lessons of oligopoly theory. Both models feature a small number of firms producing the same good and competing strategically; they differ only in the choice variable. Yet the equilibrium predictions diverge sharply.

In Cournot competition the Nash equilibrium involves positive profit, output below the competitive level, and price above marginal cost — though below the monopoly price. The degree of market power falls continuously as the number of firms increases. In Bertrand competition with homogeneous goods and no capacity constraints, even two firms are enough to drive price to marginal cost and eliminate economic profit entirely.

This sensitivity of the equilibrium to the nature of competition — quantity versus price — illustrates a broader principle in game theory: the equilibrium outcome depends critically on what the players choose, not just on how many of them there are. Choosing the right model of competition for a given industry requires understanding what firms actually commit to in practice: production plans and capacity investments, or posted prices.

---

# Chapter 7: Electoral Competition

## Motivation: Why Do Parties Converge on Policy?

Consider the puzzle of political positioning. In any election, a political party has every incentive to ask: given what our opponents are doing, what platform should we adopt to maximize our chances of winning? The answer that game theory delivers is both elegant and surprising — and it flies in the face of what we sometimes observe in practice.

To motivate the model, think about what Vote Compass revealed in a recent Canadian federal election, where it mapped the four main parties along two axes: social conservatism on the horizontal and fiscal conservatism on the vertical. What emerged was that the NDP, the Greens, and the Liberals clustered relatively close together, while the PCs sat quite far away — and the centre of the political map was, remarkably, left almost vacant. A meme circulated at the time labelling the empty centre "the zone of despair," the territory where centrist voters found themselves with nobody genuinely representing them. This is the puzzle: if a party cares only about winning, why would it leave the centre unoccupied?

The model we build in this chapter offers a clear answer for the stylized, one-dimensional case, and the result is the famous **median voter theorem**.

## The Model: Hotelling's Electoral Competition

The framework we study is known as **Hotelling's model of electoral competition**, after the economist Harold Hotelling, who first applied a similar spatial logic to firms competing for customers. The political science version models candidates as players competing for votes by choosing positions along a single policy dimension.

### Compressing Policy Into One Dimension

Real policy debates span countless issues — immigration, reconciliation, fiscal balance, taxation, healthcare. Hotelling's approach compresses all of these into a single number, a **position** on a line. Think of the left end of the line as representing progressive, high-spending policies and the right end as representing conservative, fiscally restrained policies. Any voter's ideal set of policies maps to some point on this line, and any candidate's platform is likewise a single number.

This simplification is strong, but it is precisely what makes the model tractable. In two dimensions things already become considerably more complicated; in three or four dimensions, far more so. The one-dimensional model is where the cleanest insights live.

### Players, Actions, and Preferences

Hotelling's model is a strategic game with the following formal structure.

**Players.** The players are the <span>&#92;( n &#92;)</span> candidates. Voters are present in the model but are passive — they do not make strategic decisions. A voter simply looks at the positions chosen by all candidates and casts her ballot for the one closest to her own ideal point.

**Actions.** Each candidate chooses a **position**, which is a real number representing a point on the policy line. The action space is continuous.

**Preferences.** Candidates care only about whether they win, tie, or lose — they have no ideological attachment to any position whatsoever. Formally, each candidate's preferences are represented by a payoff function that assigns <span>&#92;( n &#92;)</span> to every action profile in which she wins outright, <span>&#92;( k &#92;)</span> to every action profile in which she ties for first place with <span>&#92;( n - k &#92;)</span> other candidates (for <span>&#92;( 1 &#92;leq k &#92;leq n-1 &#92;)</span>), and <span>&#92;( 0 &#92;)</span> to every action profile in which she loses.

This payoff structure captures a strict preference ordering: winning outright is best, losing outright is worst, and ties are ranked in between according to how many candidates share the victory. A tie between two candidates (each receiving half the vote) is preferred to losing, but is less preferred than winning outright.

It is worth acknowledging that this assumption is a deliberate abstraction. In reality, parties contain members with genuine ideological commitments, and the gap between, say, a Liberal platform and a Conservative platform reflects those attachments. A richer model could give candidates partial payoffs based on the ideological proximity of the winner's platform to their own. Another variant would have candidates who care only about the policy implemented, not whether they personally win. Hotelling's model strips all of that away to isolate the pure vote-maximizing logic.

### The Distribution of Voters and the Median

There is a **continuum of voters**, each with a **favourite position** — the policy point they would most prefer to see implemented. These favourite positions are distributed according to some continuous distribution across the policy line. The model does not require a uniform distribution; it works for any continuous distribution.

Each voter's distaste for any candidate's position is measured by the **distance** between that position and her own favourite position. She votes for whichever candidate has chosen the position closest to hers. If two candidates are equidistant from her favourite position, she splits her vote equally between them.

This rule for vote allocation means that when two candidates choose positions <span>&#92;( x_1 &#92;)</span> and <span>&#92;( x_2 &#92;)</span>, with <span>&#92;( x_1 &lt; x_2 &#92;)</span>, every voter whose favourite position lies to the left of the midpoint <span>&#92;( &#92;frac{1}{2}(x_1 + x_2) &#92;)</span> votes for candidate 1, and every voter whose favourite position lies to the right of that midpoint votes for candidate 2. With three candidates at positions <span>&#92;( x_1 &lt; x_2 &lt; x_3 &#92;)</span>, candidate 1 attracts voters to the left of <span>&#92;( &#92;frac{1}{2}(x_1 + x_2) &#92;)</span>, candidate 2 attracts voters between <span>&#92;( &#92;frac{1}{2}(x_1 + x_2) &#92;)</span> and <span>&#92;( &#92;frac{1}{2}(x_2 + x_3) &#92;)</span>, and candidate 3 attracts voters to the right of <span>&#92;( &#92;frac{1}{2}(x_2 + x_3) &#92;)</span>.

### The Median Favourite Position

The key concept in solving the model is the **median favourite position**, denoted <span>&#92;( m &#92;)</span>. This is the position such that exactly half of all voters' favourite positions are at most <span>&#92;( m &#92;)</span>, and half are at least <span>&#92;( m &#92;)</span>. In other words, if you draw the density of voter ideal points along the policy line, <span>&#92;( m &#92;)</span> is the point that splits the area under that density curve into two equal halves.

The definition requires a little care. We cannot simply say "half the voters are strictly to the left and half strictly to the right," because there could be a mass of voters whose favourite position is exactly <span>&#92;( m &#92;)</span>. The correct statement is that the set of voters with favourite positions at or below <span>&#92;( m &#92;)</span> constitutes exactly 50% of the electorate, and the set with favourite positions at or above <span>&#92;( m &#92;)</span> also constitutes exactly 50%.

As the analysis below makes clear, <span>&#92;( m &#92;)</span> plays a pivotal role in determining equilibrium behaviour.

## Solving the Two-Candidate Game

With the model formally defined, we now solve for the Nash equilibrium in the case of two candidates. There are two complementary methods available: deriving best response functions and finding their intersection, or enumerating the possible cases for action profiles and ruling out all non-equilibria. Both are instructive, and we work through both.

### Method 1: Best Response Functions

To find candidate 1's best response function, we fix candidate 2's position <span>&#92;( x_2 &#92;)</span> and ask what position maximizes candidate 1's payoff. There are three cases based on where <span>&#92;( x_2 &#92;)</span> falls relative to the median <span>&#92;( m &#92;)</span>.

**Case 1: <span>&#92;( x_2 &lt; m &#92;)</span>.** Suppose candidate 2 has positioned herself strictly to the left of the median. If candidate 1 also positions to the left of <span>&#92;( x_2 &#92;)</span>, then candidate 2 attracts all voters to her right — a set that, since <span>&#92;( x_2 &lt; m &#92;)</span>, contains more than 50% of the electorate. Candidate 1 loses. On the other hand, if candidate 1 moves to the right of <span>&#92;( x_2 &#92;)</span>, she begins winning votes. She wins as long as the dividing midpoint <span>&#92;( &#92;frac{1}{2}(x_1 + x_2) &#92;)</span> lies to the left of <span>&#92;( m &#92;)</span>, which means that candidate 1 holds a majority. The constraint for candidate 1 to win is:

<span>&#92;[ &#92;frac{1}{2}(x_1 + x_2) &lt; m &#92;]</span>

Rearranging, this requires <span>&#92;( x_1 &lt; 2m - x_2 &#92;)</span>. The point <span>&#92;( 2m - x_2 &#92;)</span> is the mirror image of <span>&#92;( x_2 &#92;)</span> reflected through <span>&#92;( m &#92;)</span>. Candidate 1's best response is therefore the open interval of all positions strictly between <span>&#92;( x_2 &#92;)</span> and <span>&#92;( 2m - x_2 &#92;)</span>:

<span>&#92;[ B_1(x_2) = &#92;{ x_1 : x_2 &lt; x_1 &lt; 2m - x_2 &#92;} &#92;quad &#92;text{if } x_2 &lt; m &#92;]</span>

Any position in this interval secures a win; any position outside it results in a loss or a tie.

**Case 2: <span>&#92;( x_2 &gt; m &#92;)</span>.** This case is perfectly symmetric. Candidate 2 is now to the right of the median, so any position to the right of <span>&#92;( x_2 &#92;)</span> causes candidate 1 to lose. For candidate 1 to win, she must be to the left of <span>&#92;( x_2 &#92;)</span>, and the midpoint <span>&#92;( &#92;frac{1}{2}(x_1 + x_2) &#92;)</span> must lie to the right of <span>&#92;( m &#92;)</span>, which requires <span>&#92;( x_1 &gt; 2m - x_2 &#92;)</span>. The best response is:

<span>&#92;[ B_1(x_2) = &#92;{ x_1 : 2m - x_2 &lt; x_1 &lt; x_2 &#92;} &#92;quad &#92;text{if } x_2 &gt; m &#92;]</span>

**Case 3: <span>&#92;( x_2 = m &#92;)</span>.** When candidate 2 sits exactly at the median, any deviation by candidate 1 to either side results in a loss. If candidate 1 moves to the right of <span>&#92;( m &#92;)</span>, the midpoint between the two positions lies to the right of <span>&#92;( m &#92;)</span>, meaning candidate 2 captures more than half the electorate. The same logic applies if candidate 1 moves to the left. The only option that does not result in a loss is to match candidate 2 exactly at <span>&#92;( m &#92;)</span>, which produces a tie. Since a tie is strictly better than a loss:

<span>&#92;[ B_1(x_2) = &#92;{ m &#92;} &#92;quad &#92;text{if } x_2 = m &#92;]</span>

Putting the three cases together, candidate 1's complete best response function is:

<span>&#92;[ B_1(x_2) = &#92;begin{cases} &#92;{ x_1 : x_2 &lt; x_1 &lt; 2m - x_2 &#92;} &amp;amp; &#92;text{if } x_2 &lt; m &#92;&#92; &#92;{ m &#92;} &amp;amp; &#92;text{if } x_2 = m &#92;&#92; &#92;{ x_1 : 2m - x_2 &lt; x_1 &lt; x_2 &#92;} &amp;amp; &#92;text{if } x_2 &gt; m &#92;end{cases} &#92;]</span>

Candidate 2 faces entirely symmetric incentives and has an identical best response function with the roles of <span>&#92;( x_1 &#92;)</span> and <span>&#92;( x_2 &#92;)</span> exchanged.

### Finding the Nash Equilibrium from Best Response Functions

Graphing the two best response functions reveals two triangular regions in the <span>&#92;( (x_1, x_2) &#92;)</span> plane — one for <span>&#92;( x_2 &lt; m &#92;)</span> and one for <span>&#92;( x_2 &gt; m &#92;)</span> — along with the single point <span>&#92;( (m, m) &#92;)</span>. Crucially, because the best response sets are open (the boundary positions are excluded), the two triangular regions share no interior overlap with one another. The only point that lies in both players' best response sets simultaneously is the single point <span>&#92;( (m, m) &#92;)</span>.

Superimposing the two best response functions, the game has a **unique Nash equilibrium** in which both candidates choose the voters' median position:

<span>&#92;[ (x_1^*, x_2^*) = (m, m) &#92;]</span>

### Method 2: Direct Enumeration of Cases

An alternative — and in this instance, somewhat more transparent — approach is to verify directly that <span>&#92;( (m, m) &#92;)</span> is a Nash equilibrium and then show that no other action profile can be one. Because there are infinitely many possible profiles, this requires partitioning the space of profiles into exhaustive, non-overlapping cases.

**Part 1: <span>&#92;( (m, m) &#92;)</span> is a Nash equilibrium.** When both candidates choose <span>&#92;( m &#92;)</span>, the outcome is a tie, with each candidate receiving 50% of the vote. If either candidate deviates by moving to the left of <span>&#92;( m &#92;)</span>, the midpoint between the two positions shifts left of <span>&#92;( m &#92;)</span>, and the candidate who remains at <span>&#92;( m &#92;)</span> captures more than half the electorate — the deviating candidate loses. By the symmetric argument, a deviation to the right of <span>&#92;( m &#92;)</span> also results in a loss. Since no profitable deviation exists, <span>&#92;( (m, m) &#92;)</span> is a Nash equilibrium.

**Part 2: No other action profile is a Nash equilibrium.** Consider any profile <span>&#92;( (x_1, x_2) &#92;neq (m, m) &#92;)</span>. There are three exhaustive sub-cases.

*Sub-case (a): <span>&#92;( x_1 = x_2 &#92;neq m &#92;)</span>.* Both candidates have chosen the same position, but not the median. The current outcome is a tie. Either candidate can deviate to <span>&#92;( m &#92;)</span>; after such a deviation the midpoint between <span>&#92;( m &#92;)</span> and the unchanged candidate's position is strictly between <span>&#92;( m &#92;)</span> and that position, so the deviating candidate captures more than 50% of the vote and wins outright. Winning is strictly better than tying. Therefore, this profile is not a Nash equilibrium.

*Sub-case (b): <span>&#92;( x_1 &#92;neq x_2 &#92;)</span> and <span>&#92;( &#92;frac{1}{2}(x_1 + x_2) &#92;neq m &#92;)</span>.* The candidates are at different positions and the midpoint between them is not at the median. One candidate is therefore winning outright and the other is losing. The losing candidate can deviate to <span>&#92;( m &#92;)</span> and at minimum tie — which is strictly better than losing. This is a profitable deviation, so the profile is not a Nash equilibrium.

*Sub-case (c): <span>&#92;( x_1 &#92;neq x_2 &#92;)</span> and <span>&#92;( &#92;frac{1}{2}(x_1 + x_2) = m &#92;)</span>.* The candidates are at different positions but are symmetrically placed around the median, so they are currently tied. Either candidate can deviate to <span>&#92;( m &#92;)</span>; the deviating candidate then wins outright rather than tying, which is a profitable deviation. Therefore, this profile is also not a Nash equilibrium.

Since all three sub-cases exhaust the space of profiles other than <span>&#92;( (m, m) &#92;)</span>, and each contains a profitable deviation for at least one player, we conclude that <span>&#92;( (m, m) &#92;)</span> is the **unique Nash equilibrium** of Hotelling's model.

## The Median Voter Theorem

The result established above is the **median voter theorem**: in a two-candidate election where candidates care only about winning and voters vote for the closest candidate, both candidates converge in equilibrium to the median voter's ideal policy position. The theorem is one of the most cited results in political economy.

The logic of the proof illuminates why convergence is so powerful. Whenever a candidate is positioned anywhere other than the median, her opponent can strictly improve by moving toward the median and peeling away votes from the side that contains more than half the electorate. The median is the unique fixed point of this process — the only position from which neither candidate can gain by moving.

## Extensions and Limitations

Hotelling's model is deliberately simple, and much subsequent work has explored what happens when its assumptions are relaxed.

### Three or More Candidates

The clean convergence result breaks down once a third candidate enters the race. With three candidates, the centre becomes a dangerous place: a candidate at the median is flanked on both sides, and either of the other two candidates can leapfrog to just inside the median's vote share. No pure-strategy Nash equilibrium typically exists in the three-candidate version of the game, which helps explain why multi-party systems exhibit more ideological differentiation than two-party systems.

### Abstention and Turnout

The baseline model assumes all voters always vote. If voters can abstain — say, because no candidate is close enough to their ideal point — the incentives change. A candidate far from the median might prefer to energize her ideological base rather than chase centrist voters, because those base voters might otherwise stay home. Introducing elastic turnout can sustain equilibria away from the median.

### Probabilistic Voting

Another important extension replaces the deterministic vote rule with **probabilistic voting**: each voter's probability of voting for a candidate is a smooth function of the distance between her ideal point and the candidate's position, rather than a step function that jumps at the midpoint. With probabilistic voting, best response functions become smoother and the convergence result can be recovered under broader distributional assumptions, but the exact equilibrium location depends on the shape of the voter density.

### Ideological Candidates

The starkest departure from reality in Hotelling's model is its assumption that candidates are purely office-motivated — they care only about winning, not about what policy gets implemented. A richer model would give each candidate an intrinsic preference over policy and allow them to trade off ideological purity against electoral success. Such models typically predict incomplete convergence: candidates differentiate their platforms enough to satisfy their partisan bases while still moving toward the centre to pick up swing voters. This is more consistent with observed patterns in most liberal democracies.

## Real-World Applications and Limitations

Despite its simplicity, Hotelling's model has been remarkably influential in shaping how political scientists and economists think about party competition. It predicts that competitive pressure should push parties toward the centre — a tendency observable in many two-party systems, where both major parties often appear to adopt surprisingly similar positions on many issues.

At the same time, the Canadian electoral map described at the outset of this chapter illustrates a genuine limitation: in practice, parties do not always converge to the centre. Factors outside the model — primary election incentives that reward ideological purity, activist donors who demand differentiation, and strong in-group identity among party members — all push against centrist convergence. The model is best understood not as a literal description of political behaviour but as a baseline that clarifies what pure vote-maximizing logic predicts, against which deviations can be measured and explained.

---

# Chapter 8: Auctions

## Why Study Auctions?

Auctions are one of humanity's oldest economic institutions — records of their use stretch back at least 2,500 years. In ancient Babylonia women were auctioned off for marriage. In ancient Athens the rights to collect taxes were put up for auction, though in practice collusion among bidders drove prices artificially low and the government failed to recover full value. More recently, the great auction houses Sotheby's and Christie's, both founded in the mid-eighteenth century, became synonymous with the sale of fine art and rare objects. Today eBay, Amazon, and services like Quibids have moved auctions online and made them part of daily commerce.

The fundamental reason auctions persist is that they are a good mechanism for allocating goods when no prevailing market price exists — when a good is unique, when the market is thin, or when the seller simply does not know how much buyers value the object. A well-designed auction can recover a price close to the true value of the good, and game theory lets us analyze precisely how different designs perform.

The sale that opens this chapter's motivating example is the 2017 Christie's auction of the *Salvator Mundi*, a painting attributed to Leonardo da Vinci. It sold for a world-record price of $450 million, inclusive of fees. That outcome — one object, many bidders, competing private estimates of value — is exactly the setting game theory is built to analyze.

## Types of Auctions

Auctions differ along two key dimensions. The first is whether bids are **open** or **sealed**. In an open auction every participant can observe the bids being made; in a sealed-bid auction each participant submits a bid privately, without seeing anyone else's offer. The second distinguishing feature is **which price the winner pays**: their own highest bid, or some other price such as the second-highest bid.

The **English auction** is the classic open ascending-price format. The auctioneer begins at a low price and bidders call out increasingly higher offers. A bidder who wishes to remain in must top the previous standing bid. The auction closes when no one is willing to go higher, and the last bidder wins at the price they named. The Christie's sale of the *Salvator Mundi* was conducted this way.

The **Dutch auction** is an open descending-price format. A clock or display begins at a very high price and drops continuously. The first bidder to press a button or call out wins the object immediately at the price shown when they acted. Because the auction ends the moment anyone bids, this format is fast — it is commonly used for perishable goods such as cut flowers in the Netherlands, which gives it its name.

The **first-price sealed-bid auction** requires every bidder to submit a single bid privately and simultaneously. The highest bid wins, and the winner pays exactly the amount they bid. This is the format used in many government procurement contracts and in auctions for offshore oil leases.

The **second-price sealed-bid auction**, also called a **Vickrey auction** after economist William Vickrey, follows the same sealed submission procedure, but the winner pays only the amount of the second-highest bid rather than their own. This seemingly odd rule turns out to have remarkable strategic properties that we will derive below.

Beyond these four main types, there are **all-pay auctions** (in which every bidder pays their bid regardless of whether they win, a model relevant for lobbying or R&D races), **bidding fee auctions** (in which each submitted bid costs a small fee, making the revenue calculation highly non-transparent to participants), and many other variants.

Different auction formats have different implications for both sides of the transaction. For **bidders**, the optimal strategy — when to jump in, how much to bid, whether to shade one's true valuation — depends critically on the rules. For **sellers**, different formats yield different expected revenues and different amounts of information about bidder valuations. A seller who knows they will need to auction a similar good again in the future may value the information extracted from the current auction nearly as much as the revenue itself.

## Theoretical Framework

Throughout our formal analysis we adopt two working assumptions. First, every bidder knows their own **valuation** of the object — the maximum they would willingly pay to obtain it. Second, under the **private-value** model, every bidder also knows every other bidder's valuation exactly, giving the game perfect information. (The assumption of perfect information is relaxed in section 9.6 of the textbook, which introduces private and common value uncertainty.)

We denote the number of bidders by <span>&#92;( n &#92;)</span> where <span>&#92;( n &#92;geq 2 &#92;)</span>, and we write <span>&#92;( v_i &#92;)</span> for the value player <span>&#92;( i &#92;)</span> attaches to the object. We label players so that valuations are strictly ordered:

<span>&#92;[ v_1 > v_2 > v_3 > &#92;cdots > v_n > 0 &#92;]</span>

That is, player 1 is whoever values the object most, player 2 values it second most, and so on. If player <span>&#92;( i &#92;)</span> wins the object at price <span>&#92;( p &#92;)</span>, their payoff is <span>&#92;( v_i - p &#92;)</span>; if they lose, their payoff is zero. In the event of a tied highest bid, we break the tie in favor of the player with the smallest index — equivalently, the tied bidder who values the object most.

## The Second-Price Sealed-Bid Auction

### Formalizing the Game

The second-price sealed-bid auction is a strategic game in which the **players** are the <span>&#92;( n &#92;)</span> bidders; the **actions** for each player are the set of non-negative real numbers (any bid is admissible); and **preferences** are determined as follows. Write <span>&#92;( b_i &#92;)</span> for player <span>&#92;( i &#92;)</span>'s bid and <span>&#92;( &#92;bar{b} &#92;)</span> for the highest bid submitted by any player other than <span>&#92;( i &#92;)</span>. Player <span>&#92;( i &#92;)</span> wins if either <span>&#92;( b_i > &#92;bar{b} &#92;)</span>, or <span>&#92;( b_i = &#92;bar{b} &#92;)</span> and player <span>&#92;( i &#92;)</span> has the smallest index among all tied bidders. The winner's payoff is <span>&#92;( v_i - &#92;bar{b} &#92;)</span>; every other player receives zero.

### Nash Equilibria of the Second-Price Auction

This game has many Nash Equilibria. A natural candidate is the profile where every player bids their own valuation: <span>&#92;( (b_1, &#92;ldots, b_n) = (v_1, &#92;ldots, v_n) &#92;)</span>. The outcome is that player 1 wins the object and pays <span>&#92;( v_2 &#92;)</span>, earning a payoff of <span>&#92;( v_1 - v_2 > 0 &#92;)</span>. Every other player earns zero.

Is this a Nash Equilibrium? We verify that no player can gain by deviating. Player 1 is currently winning with a positive payoff. If player 1 changes their bid to any amount at or above <span>&#92;( v_2 &#92;)</span>, the outcome is unchanged — they still win and still pay <span>&#92;( v_2 &#92;)</span>. If player 1 lowers their bid below <span>&#92;( v_2 &#92;)</span>, they lose and receive zero, which is strictly worse. So player 1 has no profitable deviation. For any other player <span>&#92;( j &#92;neq 1 &#92;)</span>: lowering or maintaining their bid at most <span>&#92;( v_1 &#92;)</span> leaves the outcome unchanged (player 1 still wins). If player <span>&#92;( j &#92;)</span> raises their bid above <span>&#92;( v_1 &#92;)</span>, they win, but the second-highest bid is then <span>&#92;( v_1 &#92;)</span>, and since <span>&#92;( v_j < v_1 &#92;)</span> for <span>&#92;( j &#92;neq 1 &#92;)</span>, their payoff would be <span>&#92;( v_j - v_1 < 0 &#92;)</span>. No profitable deviation exists, confirming this is a Nash Equilibrium.

Another Nash Equilibrium is <span>&#92;( (b_1, &#92;ldots, b_n) = (v_1, 0, &#92;ldots, 0) &#92;)</span>. Here player 1 bids their valuation and everyone else bids zero. Player 1 still wins, but the second-highest bid is zero, so player 1 pays nothing and earns <span>&#92;( v_1 &#92;)</span>. No player can profitably deviate: player 1's outcome is unchanged by any bid they submit (they always win against bids of zero, by the tie-breaking rule), and any other player who raises their bid above <span>&#92;( v_1 &#92;)</span> wins but earns a negative payoff <span>&#92;( v_j - v_1 < 0 &#92;)</span>.

There is even a Nash Equilibrium where player 1 does **not** win. Consider <span>&#92;( (b_1, &#92;ldots, b_n) = (v_2, v_1, v_3, &#92;ldots, v_n) &#92;)</span>: player 2 bids <span>&#92;( v_1 &#92;)</span> and player 1 bids only <span>&#92;( v_2 &#92;)</span>. Player 2 wins but pays the second-highest bid, which is player 1's bid <span>&#92;( v_2 = b_1 &#92;)</span>, so player 2's payoff is <span>&#92;( v_2 - v_2 = 0 &#92;)</span>. Player 1 can raise their bid to <span>&#92;( v_1 &#92;)</span> or higher and win — but then the second price becomes <span>&#92;( v_1 &#92;)</span> and player 1 earns <span>&#92;( v_1 - v_1 = 0 &#92;)</span>, no better. Any other player who overbids above <span>&#92;( v_1 &#92;)</span> wins but earns a negative payoff. So this too is a Nash Equilibrium.

### Bidding Your Valuation Is a Dominant Strategy

These examples reveal that the game has infinitely many Nash Equilibria, and some of them yield strange outcomes — player 1 losing, or everyone else bidding zero. The Nash Equilibrium concept alone does not select among them. What singles out the truthful equilibrium <span>&#92;( (v_1, &#92;ldots, v_n) &#92;)</span> is something stronger: **weak dominance**.

**Proposition.** In a second-price sealed-bid auction with perfect information, a player's bid equal to their valuation weakly dominates all other bids. That is, for any player <span>&#92;( i &#92;)</span> and any alternative bid <span>&#92;( b_i &#92;neq v_i &#92;)</span>, bidding <span>&#92;( v_i &#92;)</span> yields at least as high a payoff as <span>&#92;( b_i &#92;)</span> for every possible combination of other players' bids, and yields a strictly higher payoff for some combinations.

The intuition is clean. In a second-price auction, changing your bid affects whether you win or lose, but it does not change the price you pay if you win — that price is determined by someone else's bid. You want to win precisely when the highest of all other bids, <span>&#92;( &#92;bar{b} &#92;)</span>, is below your valuation <span>&#92;( v_i &#92;)</span> (winning is profitable), and you want to lose when <span>&#92;( &#92;bar{b} > v_i &#92;)</span> (winning would cost more than the object is worth to you). Bidding exactly <span>&#92;( v_i &#92;)</span> achieves this perfectly: you win whenever <span>&#92;( &#92;bar{b} < v_i &#92;)</span> and lose whenever <span>&#92;( &#92;bar{b} > v_i &#92;)</span>.

A bid <span>&#92;( b_i < v_i &#92;)</span> (underbidding) has no upside — it cannot reduce the price you pay when you win — but it has a specific downside: if <span>&#92;( b_i < &#92;bar{b} < v_i &#92;)</span>, you lose an auction you should have won at a price below your valuation. A bid <span>&#92;( b_i > v_i &#92;)</span> (overbidding) also has no upside over truthful bidding — if <span>&#92;( &#92;bar{b} < v_i &#92;)</span>, you win either way and pay the same price — but it has a specific downside: if <span>&#92;( v_i < &#92;bar{b} < b_i &#92;)</span>, you win at a price above your valuation and earn a negative payoff. In both cases, any departure from truthful bidding is weakly dominated.

Because the dominant strategy for every player is to bid their valuation, the truthful Nash Equilibrium <span>&#92;( (v_1, &#92;ldots, v_n) &#92;)</span> is the only equilibrium in which no player uses a weakly dominated action. From the seller's perspective, this property is enormously useful: the bids submitted reveal every player's true valuation, providing perfect information about the demand side of the market. From the bidder's perspective, the strategy is trivially simple — just bid what the object is worth to you, and you are done.

<div class="embed-container"><iframe src="https://www.youtube.com/embed/b70MWFITsd4?rel=0" frameborder="0" allowfullscreen></iframe></div>
*An English auction for the Salvator Mundi at Christie's — the ascending-price format whose strategic logic parallels the second-price sealed-bid auction.*

## The First-Price Sealed-Bid Auction

### Why Truthful Bidding Fails

In a **first-price sealed-bid auction** the winner pays their own bid, not someone else's. This single change destroys the dominant-strategy property of truthful bidding. If you bid your true valuation <span>&#92;( v_i &#92;)</span> and win, your payoff is <span>&#92;( v_i - v_i = 0 &#92;)</span> — you capture no surplus whatsoever. Every bidder therefore has an incentive to **shade their bid** downward: submit a bid strictly below their valuation in order to earn a positive payoff when they win. The question is how far to shade.

### Nash Equilibrium with Symmetric Bidders

To derive the Nash Equilibrium bid in the first-price auction we introduce a richer model. Suppose there are <span>&#92;( n &#92;)</span> bidders whose valuations are drawn independently and uniformly from the interval <span>&#92;[ 0, 1 &#92;]</span>. Each bidder knows their own valuation but not others'. We look for a **symmetric Nash Equilibrium** in which every bidder uses the same increasing bidding function <span>&#92;( b(v) &#92;)</span>.

If all other bidders use the strategy <span>&#92;( b(v) &#92;)</span>, bidder <span>&#92;( i &#92;)</span> with valuation <span>&#92;( v_i &#92;)</span> who submits bid <span>&#92;( x &#92;)</span> wins if and only if <span>&#92;( x &#92;)</span> exceeds every other bidder's bid. Because the bidding function is increasing, this is equivalent to <span>&#92;( v_i &#92;)</span> being the highest valuation, which happens with probability <span>&#92;( x^{n-1} &#92;)</span> when <span>&#92;( x = b(v_i) &#92;)</span>. The expected payoff to bidder <span>&#92;( i &#92;)</span> from submitting bid <span>&#92;( x &#92;)</span> is:

<span>&#92;[ &#92;pi(x, v_i) = (v_i - x) &#92;cdot x^{n-1} &#92;]</span>

Maximizing over <span>&#92;( x &#92;)</span> and imposing the equilibrium condition <span>&#92;( x = b(v_i) &#92;)</span> yields the first-order condition:

<span>&#92;[ &#92;frac{d&#92;pi}{dx} = x^{n-1} - (v_i - x)(n-1)x^{n-2} = 0 &#92;]</span>

Dividing through by <span>&#92;( x^{n-2} &#92;)</span> and rearranging:

<span>&#92;[ x - (v_i - x)(n-1) = 0 &#92;implies x &#92;cdot n = v_i (n-1) &#92;implies x = &#92;frac{n-1}{n} v_i &#92;]</span>

The symmetric Nash Equilibrium bidding strategy is therefore:

<span>&#92;[ b_i = &#92;frac{n-1}{n} \, v_i &#92;]</span>

Every bidder shades their bid to a fraction <span>&#92;( (n-1)/n &#92;)</span> of their true valuation. As the number of bidders <span>&#92;( n &#92;)</span> grows, this fraction approaches 1 and bids converge toward true valuations — competition disciplines bid shading. With only two bidders (<span>&#92;( n = 2 &#92;)</span>), each bids exactly half their valuation. With ten bidders, each bids 90% of their valuation.

## Revenue Equivalence

A striking result connects the first-price and second-price formats. Under the standard assumptions — bidders draw valuations independently from the same distribution, are risk-neutral, and the object is awarded to the highest bidder — the **Revenue Equivalence Theorem** states that both auction formats yield the **same expected revenue** for the seller and the **same expected payoff** for every bidder type.

The result seems paradoxical at first. In a second-price auction, the winner pays the second-highest bid, which is generally less than their own bid. In a first-price auction, the winner pays their own (shaded) bid. Yet the equilibrium shading in the first-price format is precisely large enough to equalize expected revenues. Intuitively, the bidder who wins in the first-price auction expects to pay the same amount that the second-highest bidder would have bid in the second-price auction — because equilibrium shading tracks the expected value of the second-highest draw.

Revenue equivalence is a theoretical benchmark, not an empirical claim about all settings. It breaks down when bidders are risk-averse (risk-averse bidders shade less aggressively in first-price auctions, raising revenue), when valuations are correlated across bidders, or when there are asymmetries in the distribution of valuations. Nevertheless, the theorem identifies the precise conditions under which auction format is irrelevant for revenue, making deviations from those conditions empirically informative.

## Common-Value Auctions and the Winner's Curse

The private-value model assumes each bidder's valuation is independent of others'. This is appropriate for goods whose value is purely personal — a painting whose appeal depends entirely on the buyer's taste. But many goods have a **common value**: an underlying objective worth that is the same for all bidders, even though each bidder observes only a private, noisy signal of that value. Oil lease auctions are the canonical example: the oil in the ground is worth a fixed amount, but each oil company's geologists produce an independent estimate.

In a common-value auction with <span>&#92;( n &#92;)</span> bidders, each bidder <span>&#92;( i &#92;)</span> observes a signal <span>&#92;( s_i = V + &#92;varepsilon_i &#92;)</span>, where <span>&#92;( V &#92;)</span> is the true common value and the errors <span>&#92;( &#92;varepsilon_i &#92;)</span> are independent with mean zero. If each bidder bids their observed signal, the winner is the bidder with the highest signal. But the highest signal is almost certainly an overestimate of the true value — the winner has drawn the most favorable error. This is the **winner's curse**: winning the auction is bad news, because it reveals that you were more optimistic than everyone else.

Rational bidders anticipate the winner's curse and adjust. They recognize that winning is informative: conditional on winning, the true value is almost surely below their signal. The correct response is to **shade the bid below the private signal**, with the discount proportional to the expected upward bias of the highest signal among <span>&#92;( n &#92;)</span> draws. With more bidders, the highest signal is more likely to be an extreme overestimate, so the rational discount grows larger.

The winner's curse has been documented in many real-world markets. Companies that win corporate takeover auctions frequently overpay — acquirers systematically earn negative abnormal returns around the announcement date, a pattern sometimes called the "acquisition premium puzzle." Bidders for offshore oil tracts in early US government auctions similarly earned subnormal returns. Recognizing the winner's curse and computing the appropriate bid shade is one of the most practically important applications of auction theory.

## War of Attrition

A **war of attrition** is a dynamic game in which two or more players compete by choosing how long to wait before conceding. The player who concedes first loses; the player who holds out wins the prize, but at the cost of the time spent waiting. Unlike sealed-bid auctions, the war of attrition unfolds over time, and each player's decision to concede depends on their beliefs about the other player's type.

The war of attrition appears in biology (competing animals waiting each other out for a resource), industrial organization (firms burning money in a declining market, each hoping the rival exits first), and patent races (firms investing in R&D hoping the competitor stops first). It also models political standoffs — budget negotiations, trade disputes, and military standoffs all have war-of-attrition structures.

In the symmetric Nash Equilibrium of the two-player war of attrition, each player randomizes their concession time according to an exponential distribution. The key result is that the expected total waiting cost equals the value of the prize — all the surplus is dissipated in waiting. This is directly analogous to the all-pay auction, in which every bidder pays their bid regardless of outcome and equilibrium total payments equal the prize value. Both games illustrate the principle that competition for a fixed prize can consume the entire value of that prize through the costs of competing.

---

# Chapter 9: Mixed Strategy Equilibrium

## Motivation: When Pure Strategies Fail

So far every strategy we have considered has been an **action** — a deterministic choice. Each player simply decides which action to take and commits to it. We are now moving to a richer world in which players can also choose a **probability distribution** over their actions. Instead of saying "I will play my first action," a player can say "I will play my first action with probability one-third and my second action with probability two-thirds." That probability distribution is what we will call a mixed strategy.

The motivation for this extension comes directly from games that have no Nash equilibrium in pure strategies at all. Consider **Rock–Paper–Scissors**. The matrix is:

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

**Matching Pennies** distills this logic to its simplest form. Two players simultaneously choose Heads or Tails. Player 1 wins if the coins match; Player 2 wins if they differ:

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

There is a **stochastic steady state** in which each player chooses each action with probability one-half. This can be interpreted in two ways. The first interpretation is that each player literally randomizes, flipping a mental coin each time. The second interpretation — consistent with our view of Nash equilibrium as a stable social convention — is that half the population always plays Heads and the other half always plays Tails, so that when you meet a random opponent you face a fifty-fifty distribution over their choices. Either way, the equilibrium requires each player to make the other genuinely indifferent.

## Lotteries and the Problem of Preferences

When players mix, the outcome of the game is no longer deterministic. There is a probability attached to each possible outcome. We call such a probability distribution over outcomes a **lottery**. To say anything coherent about which mixed strategies a player prefers, we need a theory of preferences over lotteries.

For games with only two possible outcomes, this is straightforward. If a player prefers outcome <span>&#92;( a &#92;)</span> to outcome <span>&#92;( b &#92;)</span>, then they prefer any lottery that gives <span>&#92;( a &#92;)</span> higher probability. But for games with three or more outcomes, comparing lotteries is genuinely more complex. Suppose a player prefers outcome <span>&#92;( a &#92;)</span> to outcome <span>&#92;( b &#92;)</span> to outcome <span>&#92;( c &#92;)</span>. Does she prefer to receive <span>&#92;( b &#92;)</span> with certainty, or a fifty-fifty lottery between <span>&#92;( a &#92;)</span> and <span>&#92;( c &#92;)</span>? Ordinal preferences — which say only that <span>&#92;( a &#92;)</span> is better than <span>&#92;( b &#92;)</span> is better than <span>&#92;( c &#92;)</span> — cannot answer this question.

To see why, consider two games. In both, the payoffs represent the ordinal ranking <span>&#92;( a &#92;)</span> best, <span>&#92;( b &#92;)</span> middle, <span>&#92;( c &#92;)</span> worst. On the left, suppose the Bernoulli numbers are 1000, 1, and 0. On the right, suppose they are 1000, 999, and 0. The ordinal ranking is identical in both games; any pure-strategy analysis would treat them as the same. But if you now ask whether you prefer <span>&#92;( b &#92;)</span> for sure or a fifty-fifty lottery over <span>&#92;( a &#92;)</span> and <span>&#92;( c &#92;)</span>, most people would prefer the lottery in the left-hand game (because <span>&#92;( a &#92;)</span> is so much better than <span>&#92;( b &#92;)</span> that the risk of getting <span>&#92;( c &#92;)</span> is worth taking) but would prefer the certainty of <span>&#92;( b &#92;)</span> in the right-hand game (because <span>&#92;( b &#92;)</span> is nearly as good as <span>&#92;( a &#92;)</span>). The numbers are carrying cardinal, not merely ordinal, information.

## Von Neumann–Morgenstern Preferences and Bernoulli Payoffs

To handle preferences over lotteries, we adopt the framework of **von Neumann–Morgenstern (vNM) preferences**. We say a player has vNM preferences if there exists a **Bernoulli payoff function** <span>&#92;( u_i &#92;)</span> over deterministic outcomes such that the player's preferences over lotteries are represented by the expected value of that function. Formally, given two lotteries <span>&#92;( P &#92;)</span> and <span>&#92;( Q &#92;)</span> that yield outcomes <span>&#92;( a_1, a_2, &#92;ldots, a_k &#92;)</span> with probabilities <span>&#92;( p_1, &#92;ldots, p_k &#92;)</span> and <span>&#92;( q_1, &#92;ldots, q_k &#92;)</span> respectively, player <span>&#92;( i &#92;)</span> prefers <span>&#92;( P &#92;)</span> to <span>&#92;( Q &#92;)</span> if and only if:

<span>&#92;[ &#92;sum_{j} p_j \, u_i(a_j) \;&gt;\; &#92;sum_{j} q_j \, u_i(a_j) &#92;]</span>

In other words, the player simply computes the expected Bernoulli payoff of each lottery and chooses the higher one. This is the natural thing to do — it just requires that the numbers inside the payoff boxes carry cardinal meaning, not merely ordinal ranking.

This is a substantive assumption, not a logical necessity. Not all conceivable preferences over lotteries satisfy it. But it is the standard assumption in game theory with mixed strategies, and from here forward we adopt it. The payoff tables we have used throughout this course can now be reinterpreted as tables of Bernoulli payoffs whose expected values represent the players' preferences over lotteries.

### Bernoulli Payoffs and Cardinal Information

The distinction between the two games in the lottery example above illustrates why Bernoulli payoffs carry more information than ordinal payoffs. Two games that are identical when payoffs are ordinal can represent genuinely different strategic situations under vNM preferences. On the left side of the example, Player 1's payoff to outcome <span>&#92;( (Q,Q) &#92;)</span> equals her expected payoff from a lottery yielding <span>&#92;( (F,Q) &#92;)</span> and <span>&#92;( (F,F) &#92;)</span> each with probability one-half — she is indifferent. On the right side, Player 1 strictly prefers <span>&#92;( (Q,Q) &#92;)</span> with certainty to that same lottery. These two games have different strategic implications even though they share the same ordinal rankings.

A **strategic game with vNM preferences** has the same formal structure as before — a set of players, for each player a set of actions, and for each player preferences over outcomes — except that the preferences are now vNM preferences representable by expected Bernoulli payoffs.

## Mixed Strategies: Definition and Notation

**Definition.** A **mixed strategy** of player <span>&#92;( i &#92;)</span> in a strategic game is a probability distribution over that player's set of actions.

We write <span>&#92;( &#92;alpha_i &#92;)</span> for player <span>&#92;( i &#92;)</span>'s mixed strategy, and <span>&#92;( &#92;alpha_i(a_i) &#92;)</span> for the probability that <span>&#92;( &#92;alpha_i &#92;)</span> assigns to action <span>&#92;( a_i &#92;)</span>. A **profile** of mixed strategies is denoted <span>&#92;( &#92;alpha = (&#92;alpha_1, &#92;alpha_2, &#92;ldots) &#92;)</span>, where each <span>&#92;( &#92;alpha_i &#92;)</span> is a probability distribution over <span>&#92;( A_i &#92;)</span>. Formally:

<span>&#92;[ &#92;alpha = &#92;bigl((&#92;alpha_1(a_1), &#92;alpha_1(a_2), &#92;ldots),\; (&#92;alpha_2(a_1), &#92;alpha_2(a_2), &#92;ldots),\; &#92;ldots&#92;bigr) &#92;]</span>

A mixed strategy that assigns probability 1 to a single action is called a **pure strategy**. The world we lived in before this chapter was the world of pure strategies — a special case of mixed strategies. By expanding to allow probability distributions over actions, we are strictly generalizing our earlier framework.

For convenience, when a player has only two actions, we write a mixed strategy as an ordered pair of probabilities: <span>&#92;( &#92;alpha_1 = (p, 1-p) &#92;)</span> means Player 1 plays the first action with probability <span>&#92;( p &#92;)</span> and the second with probability <span>&#92;( 1 - p &#92;)</span>. In Matching Pennies, for example, the strategy where Player 1 plays each action with equal probability is written <span>&#92;( &#92;alpha_1 = ({&#92;textstyle&#92;frac{1}{2}}, {&#92;textstyle&#92;frac{1}{2}}) &#92;)</span>.

### Expected Payoffs Under Mixed Strategies

Player <span>&#92;( i &#92;)</span>'s expected payoff to a mixed strategy profile <span>&#92;( &#92;alpha &#92;)</span> is:

<span>&#92;[ U_i(&#92;alpha) \;=\; &#92;sum_{a_i &#92;in A_i} &#92;alpha_i(a_i) &#92;cdot E_i(a_i,\, &#92;alpha_{-i}) &#92;]</span>

where <span>&#92;( E_i(a_i, &#92;alpha_{-i}) &#92;)</span> is player <span>&#92;( i &#92;)</span>'s expected payoff when she plays the pure strategy <span>&#92;( a_i &#92;)</span> and the other players use their mixed strategies <span>&#92;( &#92;alpha_{-i} &#92;)</span>. This is a weighted average of the expected payoffs to each of her actions, with weights given by the probabilities in <span>&#92;( &#92;alpha_i &#92;)</span>. The critical observation is that player <span>&#92;( i &#92;)</span> does not control <span>&#92;( E_i(a_i, &#92;alpha_{-i}) &#92;)</span> — that depends on what others do. The only thing player <span>&#92;( i &#92;)</span> controls is the weight <span>&#92;( &#92;alpha_i(a_i) &#92;)</span> she places on each action.

## Mixed Strategy Nash Equilibrium

**Definition.** A mixed strategy profile <span>&#92;( &#92;alpha^* &#92;)</span> in a strategic game with vNM preferences is a **mixed strategy Nash equilibrium (MSNE)** if for each player <span>&#92;( i &#92;)</span>:

<span>&#92;[ U_i(&#92;alpha^*) \;&#92;geq\; U_i(&#92;alpha_i,\, &#92;alpha^*_{-i}) &#92;quad &#92;text{for every mixed strategy } &#92;alpha_i &#92;text{ of player } i &#92;]</span>

where <span>&#92;( U_i(&#92;alpha) &#92;)</span> is player <span>&#92;( i &#92;)</span>'s expected payoff to the mixed strategy profile <span>&#92;( &#92;alpha &#92;)</span>.

This is fundamentally the same idea as Nash equilibrium: given the strategies everyone else is playing, no player can make a strictly profitable deviation — not to any other mixed strategy, not to any pure strategy. A mixed strategy profile is a MSNE if and only if every player's mixed strategy is a best response to the others' mixed strategies.

**Best response functions** extend naturally: <span>&#92;( B_i(&#92;alpha_{-i}) &#92;)</span> is the set of player <span>&#92;( i &#92;)</span>'s best mixed strategies when the others play <span>&#92;( &#92;alpha_{-i} &#92;)</span>. A mixed strategy profile <span>&#92;( &#92;alpha^* &#92;)</span> is a MSNE if and only if <span>&#92;( &#92;alpha_i^* &#92;in B_i(&#92;alpha_{-i}^*) &#92;)</span> for every player <span>&#92;( i &#92;)</span>.

### A Key Observation About Mixing

There is an important structural fact about best responses with mixed strategies: a mixed strategy <span>&#92;( &#92;alpha_i = (p, 1-p) &#92;)</span> with <span>&#92;( 0 &lt; p &lt; 1 &#92;)</span> is **never** the unique best response to any strategy of the opponents. Either it is not a best response at all, or all mixed strategies are equally good.

Why? Suppose player <span>&#92;( i &#92;)</span> is mixing between two actions. Player <span>&#92;( i &#92;)</span>'s expected payoff is a weighted average of the expected payoffs to each of those actions. If one action yields a strictly higher expected payoff than the other, the player would be leaving value on the table by putting any probability on the inferior action — they should deviate to placing all weight on the better action. So mixing can only be optimal when both actions yield exactly the same expected payoff. But when both actions yield the same payoff, any mix is equally optimal; no particular mix is uniquely best. This means that a genuinely mixed strategy is always part of a continuum of equally good strategies, never uniquely optimal. This observation becomes the cornerstone of Proposition 116.2.

## Proposition 116.2: The Indifference Characterization

The practical tool for both computing and verifying MSNE is the following result.

**Proposition 116.2.** A mixed strategy profile <span>&#92;( &#92;alpha^* &#92;)</span> in a strategic game with vNM preferences in which each player has finitely many actions is a mixed strategy Nash equilibrium if and only if for each player <span>&#92;( i &#92;)</span>:

1. The expected payoff, given <span>&#92;( &#92;alpha^*_{-i} &#92;)</span>, to every action to which <span>&#92;( &#92;alpha^*_i &#92;)</span> assigns strictly positive probability is the same.
2. The expected payoff, given <span>&#92;( &#92;alpha^*_{-i} &#92;)</span>, to every action to which <span>&#92;( &#92;alpha^*_i &#92;)</span> assigns zero probability is at most the expected payoff to any action to which <span>&#92;( &#92;alpha^*_i &#92;)</span> assigns strictly positive probability.

This proposition is one of the most important results in the course. The two conditions together say: **every action in the support of** <span>&#92;( &#92;alpha^*_i &#92;)</span> **must yield the same expected payoff, and every action outside the support must yield no higher expected payoff.** In other words, the player must be indifferent among all the actions she is willing to play in equilibrium.

### Derivation

The logic behind Proposition 116.2 flows directly from the expected-payoff formula. Player <span>&#92;( i &#92;)</span>'s total expected payoff is a weighted average of the expected payoffs to each action in her support, with weights given by the mixing probabilities. To maximize this weighted average, player <span>&#92;( i &#92;)</span> should put all weight on the action with the highest expected payoff. The only time she is willing to spread weight across multiple actions is when they all give the same expected payoff — since then redistributing weight changes nothing. Condition 1 captures this. Condition 2 says that an action outside the support cannot give a strictly higher payoff, otherwise the player would profitably deviate by switching to that action.

A common student error is to check only Condition 1 while forgetting Condition 2. Both conditions must be verified.

### An Important Corollary

Each player's expected payoff in a MSNE equals her expected payoff to any single action she plays with positive probability. Since all actions in the support give the same expected payoff, the weighted average is simply that common value.

### Using Proposition 116.2 to Check a Candidate MSNE

Consider the mixed strategy profile <span>&#92;( &#92;alpha = ((\,0.4,\, 0.6\,),\; (\,0.2,\, 0.8\,)) &#92;)</span> in a game where Player 1 has actions <span>&#92;( T &#92;)</span> and <span>&#92;( B &#92;)</span> and Player 2 has actions <span>&#92;( L &#92;)</span> and <span>&#92;( R &#92;)</span>, with Bernoulli payoffs (for Player 1) of 1, 5, 2, 3 in the cells <span>&#92;( (T,L) &#92;)</span>, <span>&#92;( (T,R) &#92;)</span>, <span>&#92;( (B,L) &#92;)</span>, <span>&#92;( (B,R) &#92;)</span> respectively. Player 1's expected payoff to <span>&#92;( T &#92;)</span> given Player 2's strategy is <span>&#92;( 0.2 &#92;cdot 1 + 0.8 &#92;cdot 5 = 4.2 &#92;)</span>. Player 1's expected payoff to <span>&#92;( B &#92;)</span> is <span>&#92;( 0.2 &#92;cdot 2 + 0.8 &#92;cdot 3 = 2.8 &#92;)</span>. Since <span>&#92;( 4.2 &#92;neq 2.8 &#92;)</span>, Condition 1 is violated: Player 1 is strictly better off playing <span>&#92;( T &#92;)</span>, so she would never voluntarily put 0.6 weight on <span>&#92;( B &#92;)</span>. This profile is not a MSNE.

## Finding MSNE Using Best Response Functions

### Example: Matching Pennies

Let <span>&#92;( p &#92;)</span> denote the probability Player 1's mixed strategy assigns to Heads, and <span>&#92;( q &#92;)</span> the probability Player 2's mixed strategy assigns to Heads. Given Player 2's strategy, Player 1's expected payoffs are:

<span>&#92;[ E_1(&#92;text{H},\, q) \;=\; q &#92;cdot 1 + (1-q) &#92;cdot (-1) \;=\; 2q - 1 &#92;]</span>

<span>&#92;[ E_1(&#92;text{T},\, q) \;=\; q &#92;cdot (-1) + (1-q) &#92;cdot 1 \;=\; 1 - 2q &#92;]</span>

Player 1 strictly prefers Heads when <span>&#92;( 2q - 1 > 1 - 2q &#92;)</span>, i.e., when <span>&#92;( q > {&#92;textstyle&#92;frac{1}{2}} &#92;)</span>; strictly prefers Tails when <span>&#92;( q &lt; {&#92;textstyle&#92;frac{1}{2}} &#92;)</span>; and is indifferent — willing to play any mix — when <span>&#92;( q = {&#92;textstyle&#92;frac{1}{2}} &#92;)</span>. Therefore:

<span>&#92;[ B_1(q) \;=\; &#92;begin{cases} (0, 1) &amp; &#92;text{if } q &lt; {&#92;textstyle&#92;frac{1}{2}} &#92;\[4pt] (p,\, 1-p) &#92;text{ for all } 0 &#92;leq p &#92;leq 1 &amp; &#92;text{if } q = {&#92;textstyle&#92;frac{1}{2}} &#92;\[4pt] (1, 0) &amp; &#92;text{if } q > {&#92;textstyle&#92;frac{1}{2}} &#92;end{cases} &#92;]</span>

By symmetry, Player 2's best response function satisfies <span>&#92;( B_2(p) &#92;)</span>: play <span>&#92;( q = 0 &#92;)</span> (always Tails) when <span>&#92;( p > {&#92;textstyle&#92;frac{1}{2}} &#92;)</span>, play <span>&#92;( q = 1 &#92;)</span> (always Heads) when <span>&#92;( p &lt; {&#92;textstyle&#92;frac{1}{2}} &#92;)</span>, and mix freely when <span>&#92;( p = {&#92;textstyle&#92;frac{1}{2}} &#92;)</span>.

When these two best response functions are plotted — with <span>&#92;( p &#92;)</span> on the horizontal axis and <span>&#92;( q &#92;)</span> on the vertical axis — they cross at exactly one point: <span>&#92;( p = {&#92;textstyle&#92;frac{1}{2}}, q = {&#92;textstyle&#92;frac{1}{2}} &#92;)</span>. This is the unique MSNE:

<span>&#92;[ &#92;alpha^* \;=\; &#92;Bigl(&#92;Bigl({&#92;textstyle&#92;frac{1}{2}},\, {&#92;textstyle&#92;frac{1}{2}}&#92;Bigr),\; &#92;Bigl({&#92;textstyle&#92;frac{1}{2}},\, {&#92;textstyle&#92;frac{1}{2}}&#92;Bigr)&#92;Bigr) &#92;]</span>

### Example: Battle of the Sexes — Best Response Approach

Recall the **Battle of the Sexes (BoS)** game, in which a couple wants to go out together — one prefers Ballet, the other prefers Soccer — but each prefers going together to going alone:

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

Let <span>&#92;( p &#92;)</span> be the probability Player 1 plays B and <span>&#92;( q &#92;)</span> be the probability Player 2 plays B. Player 1's expected payoffs are:

<span>&#92;[ E_1(B, q) = 2q + 0 &#92;cdot (1-q) = 2q &#92;]</span>
<span>&#92;[ E_1(S, q) = 0 &#92;cdot q + 1 &#92;cdot (1-q) = 1 - q &#92;]</span>

Player 1 is indifferent when <span>&#92;( 2q = 1 - q &#92;)</span>, giving <span>&#92;( q = {&#92;textstyle&#92;frac{1}{3}} &#92;)</span>. So:

<span>&#92;[ B_1(q) \;=\; &#92;begin{cases} (0, 1) &amp; &#92;text{if } q &lt; {&#92;textstyle&#92;frac{1}{3}} &#92;\[4pt] (p,\, 1-p) &#92;text{ for all } 0 &#92;leq p &#92;leq 1 &amp; &#92;text{if } q = {&#92;textstyle&#92;frac{1}{3}} &#92;\[4pt] (1, 0) &amp; &#92;text{if } q > {&#92;textstyle&#92;frac{1}{3}} &#92;end{cases} &#92;]</span>

For Player 2, <span>&#92;( E_2(B, p) = p &#92;)</span> and <span>&#92;( E_2(S, p) = 2(1-p) &#92;)</span>. Player 2 is indifferent when <span>&#92;( p = 2(1-p) &#92;)</span>, giving <span>&#92;( p = {&#92;textstyle&#92;frac{2}{3}} &#92;)</span>. So:

<span>&#92;[ B_2(p) \;=\; &#92;begin{cases} (0, 1) &amp; &#92;text{if } p &lt; {&#92;textstyle&#92;frac{2}{3}} &#92;\[4pt] (q,\, 1-q) &#92;text{ for all } 0 &#92;leq q &#92;leq 1 &amp; &#92;text{if } p = {&#92;textstyle&#92;frac{2}{3}} &#92;\[4pt] (1, 0) &amp; &#92;text{if } p > {&#92;textstyle&#92;frac{2}{3}} &#92;end{cases} &#92;]</span>

When plotted, the two best response functions cross at **three** points, giving three MSNE:

- <span>&#92;( ((1,0),\,(1,0)) &#92;)</span> — both play B (pure strategy NE)
- <span>&#92;( ((0,1),\,(0,1)) &#92;)</span> — both play S (pure strategy NE)
- <span>&#92;( &#92;bigl(({&#92;textstyle&#92;frac{2}{3}},{&#92;textstyle&#92;frac{1}{3}}),\,({&#92;textstyle&#92;frac{1}{3}},{&#92;textstyle&#92;frac{2}{3}})&#92;bigr) &#92;)</span> — the fully mixed equilibrium

The two corner points are the familiar pure-strategy Nash equilibria we found before. The new one in the interior is the fully mixed equilibrium. Notice that this is no coincidence: we will shortly see that any Nash equilibrium found without mixing carries over as a MSNE once mixing is allowed.

## Solving for the Fully Mixed MSNE: Proposition 116.2 in Practice

Using Proposition 116.2 is generally more convenient than graphing best response functions, especially when players have more than two actions. The technique is direct: to find a fully mixed MSNE, write down the condition that each player must be indifferent between every action in her support, then solve for the mixing probabilities of the other player.

### Battle of the Sexes: Fully Mixed MSNE Derivation

We look for a MSNE in which both players mix strictly between B and S, so that <span>&#92;( 0 &lt; p &lt; 1 &#92;)</span> and <span>&#92;( 0 &lt; q &lt; 1 &#92;)</span>.

**Step 1.** By Condition 1 of Proposition 116.2, Player 1 must be indifferent between B and S. Her expected payoffs are:

<span>&#92;[ E_1(B, q) = 2q &#92;quad &#92;text{and} &#92;quad E_1(S, q) = 1 - q &#92;]</span>

Setting these equal:

<span>&#92;[ 2q = 1 - q \;&#92;implies\; 3q = 1 \;&#92;implies\; q = {&#92;textstyle&#92;frac{1}{3}} &#92;]</span>

So Player 2 must play B with probability <span>&#92;( &#92;frac{1}{3} &#92;)</span> — that is the mix that makes Player 1 indifferent.

**Step 2.** Player 2 must be indifferent between B and S. Her expected payoffs are:

<span>&#92;[ E_2(B, p) = p &#92;quad &#92;text{and} &#92;quad E_2(S, p) = 2(1-p) &#92;]</span>

Setting these equal:

<span>&#92;[ p = 2 - 2p \;&#92;implies\; 3p = 2 \;&#92;implies\; p = {&#92;textstyle&#92;frac{2}{3}} &#92;]</span>

So Player 1 must play B with probability <span>&#92;( &#92;frac{2}{3} &#92;)</span>.

**Result.** The unique fully mixed MSNE is:

<span>&#92;[ &#92;alpha^* \;=\; &#92;Bigl(&#92;Bigl({&#92;textstyle&#92;frac{2}{3}},\, {&#92;textstyle&#92;frac{1}{3}}&#92;Bigr),\; &#92;Bigl({&#92;textstyle&#92;frac{1}{3}},\, {&#92;textstyle&#92;frac{2}{3}}&#92;Bigr)&#92;Bigr) &#92;]</span>

Combined with the two pure-strategy MSNE, there are exactly three MSNE in BoS.

### The Logic of Mutual Indifference

There is a subtle but crucial point here that is worth emphasizing. In the fully mixed MSNE, each player is completely indifferent between continuing to play the equilibrium mix and switching to any other mix of the two actions — because both actions give exactly the same expected payoff. So what pins down the exact mixing probabilities? It is not that the equilibrium mix is uniquely optimal for the player using it. Rather, the equilibrium mix is uniquely determined by the condition that it must make the **other** player indifferent. Player 1 plays <span>&#92;( p = &#92;frac{2}{3} &#92;)</span> not because that is optimal for Player 1, but because that is the value of <span>&#92;( p &#92;)</span> at which Player 2 is indifferent between B and S and is therefore willing to randomize at all. This reciprocal structure is the defining feature of mixed strategy equilibrium.

### Verifying a MSNE: A Three-Action Example

Proposition 116.2 also works for verifying proposed MSNE in richer games. Consider whether <span>&#92;( &#92;alpha^* = (({&#92;textstyle&#92;frac{3}{4}}, 0, {&#92;textstyle&#92;frac{1}{4}}),\; (0, {&#92;textstyle&#92;frac{1}{3}}, {&#92;textstyle&#92;frac{2}{3}})) &#92;)</span> is a MSNE of:

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

Player 2 never plays L (<span>&#92;( &#92;alpha_2(L) = 0 &#92;)</span>), so Player 1's payoff in any column-L cell is irrelevant. Player 1's expected payoffs to each action, given Player 2's mix <span>&#92;( (0, &#92;frac{1}{3}, &#92;frac{2}{3}) &#92;)</span>:

- <span>&#92;( E_1(T) = {&#92;textstyle&#92;frac{1}{3}} &#92;cdot 3 + {&#92;textstyle&#92;frac{2}{3}} &#92;cdot 1 = {&#92;textstyle&#92;frac{5}{3}} &#92;)</span>
- <span>&#92;( E_1(M) = {&#92;textstyle&#92;frac{1}{3}} &#92;cdot 0 + {&#92;textstyle&#92;frac{2}{3}} &#92;cdot 2 = {&#92;textstyle&#92;frac{4}{3}} &#92;)</span>
- <span>&#92;( E_1(B) = {&#92;textstyle&#92;frac{1}{3}} &#92;cdot 5 + {&#92;textstyle&#92;frac{2}{3}} &#92;cdot 0 = {&#92;textstyle&#92;frac{5}{3}} &#92;)</span>

**Condition 1 for Player 1:** Player 1 assigns positive probability to T and B (both <span>&#92;( > 0 &#92;)</span>). Both give expected payoff <span>&#92;( &#92;frac{5}{3} &#92;)</span>. ✓

**Condition 2 for Player 1:** Player 1 assigns zero probability to M. <span>&#92;( E_1(M) = &#92;frac{4}{3} &#92;leq &#92;frac{5}{3} &#92;)</span>. ✓

Computing Player 2's expected payoffs to L, C, R given Player 1's mix <span>&#92;( (&#92;frac{3}{4}, 0, &#92;frac{1}{4}) &#92;)</span> yields <span>&#92;( E_2(L) = E_2(C) = E_2(R) = &#92;frac{5}{2} &#92;)</span> (all equal). Both conditions are satisfied for Player 2 as well. Therefore <span>&#92;( &#92;alpha^* &#92;)</span> is a MSNE.

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

Player 1's best response function is unchanged. But now Player 2 is weakly better off playing S for any <span>&#92;( p &lt; 1 &#92;)</span>, since (B, S) and (S, S) both give zero while (S, S) gives 2. Only when <span>&#92;( p = 1 &#92;)</span> is Player 2 indifferent, receiving zero regardless. This creates an overlap: Player 1's best response includes a horizontal segment, and Player 2's best response includes a vertical segment, and they share a line. The result is a continuum of MSNE along that boundary.

## Existence of MSNE in Finite Games

**Proposition 119.1.** Every strategic game with vNM preferences in which each player has finitely many actions has at least one mixed strategy Nash equilibrium.

This is one of the foundational existence results in game theory, due to Nash (1950). The proof uses Kakutani's fixed-point theorem applied to the best response correspondence and is beyond the scope of this course (see Osborne and Rubinstein, 1994, pp. 19–20 for a proof). The practical implication is important: the concept of MSNE is universally applicable to any finite game. No finite game is "without equilibrium" once mixed strategies are permitted.

A useful corollary concerns the number of MSNE: in generic finite games (where small perturbations to payoffs do not change the qualitative structure), the number of MSNE is odd. BoS has three. Matching Pennies has one. Rock–Paper–Scissors has one. The modified BoS above is non-generic and has a continuum.

## Pure Strategy NE Are Also MSNE

The two pure-strategy Nash equilibria of BoS — (B, B) and (S, S) — also appeared as MSNE. This is no coincidence. There is a general correspondence between Nash equilibria in the pure-strategy world and MSNE in the mixed-strategy world.

**Proposition 122.2 (Allowing Randomization).** Let <span>&#92;( a^* &#92;)</span> be a Nash equilibrium of a strategic game <span>&#92;( G &#92;)</span> with ordinal preferences. For each player <span>&#92;( i &#92;)</span>, let <span>&#92;( &#92;alpha^*_i &#92;)</span> be the pure strategy that assigns probability 1 to <span>&#92;( a^*_i &#92;)</span>. Then <span>&#92;( &#92;alpha^* &#92;)</span> is a MSNE of the corresponding game <span>&#92;( G' &#92;)</span> with vNM preferences.

The argument is immediate from Proposition 116.2. Since <span>&#92;( a^* &#92;)</span> is a Nash equilibrium of <span>&#92;( G &#92;)</span>, no player has a pure strategy that beats <span>&#92;( a^*_i &#92;)</span> when others play <span>&#92;( a^*_{-i} &#92;)</span>. Condition 1 of Proposition 116.2 is satisfied trivially (each player puts positive probability on only one action). Condition 2 is satisfied because no pure strategy yields a strictly higher payoff — and since pure strategies include all the actions, this means no action outside the trivial support does better.

**Proposition 123.1 (Prohibiting Randomization).** Let <span>&#92;( &#92;alpha^* &#92;)</span> be a MSNE of <span>&#92;( G' &#92;)</span> in which each player's mixed strategy assigns probability 1 to a single action <span>&#92;( a^*_i &#92;)</span>. Then <span>&#92;( a^* &#92;)</span> is a Nash equilibrium of <span>&#92;( G &#92;)</span>.

Since <span>&#92;( &#92;alpha^* &#92;)</span> is a MSNE of <span>&#92;( G' &#92;)</span>, no mixed strategy of player <span>&#92;( i &#92;)</span> gives a higher expected payoff than <span>&#92;( &#92;alpha^*_i &#92;)</span>. Pure strategies are a subset of mixed strategies, so in particular no pure strategy beats <span>&#92;( a^*_i &#92;)</span>. Hence <span>&#92;( a^* &#92;)</span> is a Nash equilibrium of <span>&#92;( G &#92;)</span>.

Together, these propositions say that pure-strategy NE and MSNE in pure strategies are the same thing. When searching for all MSNE of a game, you can find the pure-strategy equilibria first (using the star method), then turn to the fully mixed ones using Proposition 116.2.

## Strict Domination by Mixed Strategies

In earlier chapters we found that strictly dominated actions are never played in Nash equilibrium, which allowed us to simplify games through iterated elimination. The same principle applies — in an extended form — to MSNE.

**Definition 120.1.** In a strategic game with vNM preferences, player <span>&#92;( i &#92;)</span>'s mixed strategy <span>&#92;( &#92;alpha_i &#92;)</span> **strictly dominates** her action <span>&#92;( a'_i &#92;)</span> if:

<span>&#92;[ U_i(&#92;alpha_i,\, a_{-i}) \;&gt;\; u_i(a'_i,\, a_{-i}) &#92;quad &#92;text{for every action list } a_{-i} &#92;]</span>

We say that action <span>&#92;( a'_i &#92;)</span> is **strictly dominated** (by a mixed strategy).

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

None of M or B strictly dominates T as a pure strategy. But the mixed strategy that plays M and B each with probability <span>&#92;( &#92;frac{1}{2} &#92;)</span> gives expected payoffs of <span>&#92;( &#92;frac{1}{2} &#92;cdot 4 + &#92;frac{1}{2} &#92;cdot 0 = 2 &#92;)</span> against L and <span>&#92;( &#92;frac{1}{2} &#92;cdot 0 + &#92;frac{1}{2} &#92;cdot 3 = 1.5 &#92;)</span> against R — both strictly above T's payoffs of 1 and 1. So T is strictly dominated by the mixed strategy <span>&#92;( (0, &#92;frac{1}{2}, &#92;frac{1}{2}) &#92;)</span>, even though no pure strategy dominates T.

### Why Dominated Actions Are Not Played in MSNE

**Claim.** If action <span>&#92;( a'_i &#92;)</span> is strictly dominated by a mixed strategy <span>&#92;( &#92;alpha_i &#92;)</span>, then <span>&#92;( a'_i &#92;)</span> is not played with positive probability in any MSNE.

**Argument.** Suppose the other players use mixed strategies <span>&#92;( &#92;alpha_{-i} &#92;)</span>. Player <span>&#92;( i &#92;)</span>'s expected payoff to using <span>&#92;( &#92;alpha_i &#92;)</span> is a weighted average of <span>&#92;( U_i(&#92;alpha_i, a_{-i}) &#92;)</span> as <span>&#92;( a_{-i} &#92;)</span> varies over all action profiles of the others, where the weights are given by the probability each <span>&#92;( a_{-i} &#92;)</span> occurs under <span>&#92;( &#92;alpha_{-i} &#92;)</span>. Similarly, player <span>&#92;( i &#92;)</span>'s expected payoff to using <span>&#92;( a'_i &#92;)</span> is a weighted average of <span>&#92;( u_i(a'_i, a_{-i}) &#92;)</span> with exactly the same weights. Since strict domination gives <span>&#92;( U_i(&#92;alpha_i, a_{-i}) > u_i(a'_i, a_{-i}) &#92;)</span> for every <span>&#92;( a_{-i} &#92;)</span>, and the weights are identical, the entire expected payoff to <span>&#92;( &#92;alpha_i &#92;)</span> exceeds that to <span>&#92;( a'_i &#92;)</span> for any <span>&#92;( &#92;alpha_{-i} &#92;)</span>. Therefore <span>&#92;( a'_i &#92;)</span> is never a best response and is never used with positive probability in any MSNE.

**Corollary.** A strictly dominated action can be eliminated before searching for MSNE, and this elimination can be applied **iteratively**: after removing one dominated action, a new action may become dominated in the reduced game, and can itself be removed. Any MSNE of the original game corresponds to a MSNE of the reduced game after iterated elimination of strictly dominated strategies — by pure or mixed strategies alike. This can dramatically simplify the computation.

## Weak Domination by Mixed Strategies

**Definition.** Player <span>&#92;( i &#92;)</span>'s mixed strategy <span>&#92;( &#92;alpha_i &#92;)</span> **weakly dominates** her action <span>&#92;( a'_i &#92;)</span> if:

<span>&#92;[ U_i(&#92;alpha_i,\, a_{-i}) \;&#92;geq\; u_i(a'_i,\, a_{-i}) &#92;quad &#92;text{for every } a_{-i} &#92;]</span>

and additionally <span>&#92;( U_i(&#92;alpha_i, a_{-i}) > u_i(a'_i, a_{-i}) &#92;)</span> for at least one <span>&#92;( a_{-i} &#92;)</span>. Weak domination permits elimination in some contexts but requires more care: iterative elimination of weakly dominated strategies can remove equilibria, whereas iterative elimination of strictly dominated strategies never does.

## Finding All MSNE in Practice

The practical procedure for finding all MSNE of a finite game proceeds in stages. First, delete any action strictly dominated by a pure or mixed strategy — and repeat iteratively. Second, find all pure-strategy equilibria using the best response (star) method; these are also MSNE. Third, apply Proposition 116.2 to find fully mixed MSNE: for each candidate support profile (specifying which actions each player mixes over), write down the indifference conditions and solve for the mixing probabilities, then verify that actions outside the candidate support indeed fail to exceed the common equilibrium payoff. In a two-player game where each player has two actions, the fully mixed MSNE (if it exists) is found by setting Player 1's expected payoffs to her two actions equal and solving for Player 2's mix, and vice versa.

The key discipline is to remember that a player's equilibrium mix is determined by the condition that it keeps the **other** player indifferent — not by any optimality condition on the mixer's own payoff. Once you internalize this, the computation becomes routine.

---

# Chapter 10: Applications of Mixed Strategies

This chapter brings the machinery of mixed strategy Nash equilibria (MSNE) to bear on three concrete situations drawn from everyday economic and social life: expert diagnosis, soccer penalty kicks, and the problem of reporting a crime. Each example illuminates a different facet of strategic reasoning under uncertainty, and each produces predictions that are sometimes surprising even after a moment's careful thought.

## Section 1: Expert Diagnosis

### The Problem

Something you know nothing about breaks down. It could be your car making a strange noise, your computer crashing, a toothache that won't quit, or an appliance that has stopped working. The key feature is not the object itself but the asymmetry of knowledge: you are ill-informed, and you must consult someone who knows far more than you do. When that expert makes a diagnosis and recommends a course of action, you face a genuine dilemma. The expert is self-interested — he wants to sell his services — and you have no independent way to verify whether his diagnosis is accurate. He might tell you there is a major problem requiring expensive repair when in fact only a minor fix is needed. Do you trust him?

This is the **expert diagnosis problem**, and it turns out that game theory has quite a lot to say about it. We will focus on the car-mechanic version throughout, though the analysis applies equally to doctors, dentists, lawyers, financial advisers, and any other setting where expertise is asymmetric.

### The Model

A good model captures the essential features of a situation without becoming so complicated that it is impossible to solve. Here, the essential features are the information asymmetry and the conflict of interest. We strip away everything else.

There are two **types** of problems a car can have: **major** and **minor**. A major problem occurs with probability <span>&#92;(r&#92;)</span> and a minor problem with probability <span>&#92;(1 - r&#92;)</span>, where <span>&#92;(0 &lt; r &lt; 1&#92;)</span>. When the customer brings the car to the mechanic, the mechanic inspects it — we assume inspection is costless — and learns the true type. The customer never learns the true type directly. The only information the customer has is the prior probability <span>&#92;(r&#92;)</span> and whatever the expert chooses to tell her.

### Player Actions

Now consider what each player actually decides. For the **expert**, the action set has a subtle but important structure. When the problem is genuinely major, the expert has no incentive to understate it — claiming it is minor would only cost him revenue. So we can take it as given that the expert always reports a major problem as major. The only decision the expert faces is what to do when the problem is minor: does he report it honestly as minor, or does he lie and claim it is major? This binary choice defines his two strategies.

- **Honest (H):** recommend the repair that is actually needed — minor repair for minor problems, major repair for major problems.
- **Dishonest (D):** always recommend a major repair, regardless of the true type.

For the **customer**, the analogous logic applies. When the expert recommends a minor repair, the customer has no reason to doubt him — the expert has no incentive to understate a problem. The customer's decision concerns only what to do when she is told the problem is major: does she believe him and pay for the major repair, or does she walk away?

- **Accept (A):** always follow the expert's advice, including when a major repair is recommended.
- **Reject (R):** follow the expert's advice for minor repairs, but walk away whenever a major repair is recommended.

### Payoffs

**Expert profits.** Let <span>&#92;(&#92;pi&#92;)</span> denote the expert's profit from performing a minor repair and also from performing a major repair when the problem genuinely is major. The dishonest profit — earned when the expert sells a major repair for what is in fact a minor problem — is <span>&#92;(&#92;pi'&#92;)</span>, where <span>&#92;(&#92;pi' &gt; &#92;pi&#92;)</span>. The premium <span>&#92;(&#92;pi' - &#92;pi&#92;)</span> is the temptation to cheat: the expert charges for hours of labor and expensive parts when the job was really a twenty-minute fix.

**Customer costs.** Four cost parameters describe the customer's situation:

- <span>&#92;(I&#92;)</span>: cost of a minor repair (the bill when the minor problem is correctly diagnosed and fixed).
- <span>&#92;(I'&#92;)</span>: cost borne by the customer when she rejects a major-repair recommendation and the problem turns out to be minor. She drives away with a car that still has a small issue but is not dangerous. This costs more than a minor repair because she now has to live with the problem or find another solution. So <span>&#92;(I &lt; I'&#92;)</span>.
- <span>&#92;(E&#92;)</span>: cost of a major repair. This is larger than <span>&#92;(I'&#92;)</span> — if she knew it were only a minor problem, she would rather leave without any repair than pay the major-repair price. So <span>&#92;(I' &lt; E&#92;)</span>.
- <span>&#92;(E'&#92;)</span>: cost borne by the customer when she rejects a major-repair recommendation and the problem turns out to actually be major. She drives away with failing brakes or a serious engine fault. This is the worst outcome of all. So <span>&#92;(E &lt; E'&#92;)</span>.

Throughout we assume:

<span>&#92;[ I &lt; I' &lt; E &lt; E' &#92;]</span>

### The Strategic Game

We now have everything needed to write down the payoff matrix. We compute the expected payoff for each action profile, weighting by the probability that the underlying problem is major (<span>&#92;(r&#92;)</span>) or minor (<span>&#92;(1-r&#92;)</span>).

**(H, A):** The expert is honest and the customer accepts. Every car that comes in is diagnosed correctly, so a major problem gets a major repair and a minor problem gets a minor repair. The expert earns <span>&#92;(&#92;pi&#92;)</span> regardless of car type. The customer pays <span>&#92;(E&#92;)</span> with probability <span>&#92;(r&#92;)</span> and <span>&#92;(I&#92;)</span> with probability <span>&#92;(1-r&#92;)</span>, giving expected cost <span>&#92;(rE + (1-r)I&#92;)</span>.

**(D, A):** The expert is dishonest and the customer accepts. Every diagnosis is "major." With probability <span>&#92;(r&#92;)</span> the problem really is major, so the expert earns <span>&#92;(&#92;pi&#92;)</span>. With probability <span>&#92;(1-r&#92;)</span> the problem is minor, but the expert claims it is major and the customer accepts, so the expert earns <span>&#92;(&#92;pi'&#92;)</span>. Expected expert profit: <span>&#92;(r&#92;pi + (1-r)&#92;pi'&#92;)</span>. The customer always pays for a major repair, so her cost is <span>&#92;(E&#92;)</span> with certainty.

**(H, R):** The expert is honest and the customer rejects all major-repair recommendations. With probability <span>&#92;(r&#92;)</span> the problem is major, the expert truthfully says so, and the customer walks away — the expert earns nothing. With probability <span>&#92;(1-r&#92;)</span> the problem is minor, the expert says so, the customer accepts, and the expert earns <span>&#92;(&#92;pi&#92;)</span>. Expert's expected profit: <span>&#92;((1-r)&#92;pi&#92;)</span>. The customer faces cost <span>&#92;(E'&#92;)</span> when the problem is major (she rejected a truthful warning) and cost <span>&#92;(I&#92;)</span> when it is minor (she accepted the accurate minor diagnosis).

**(D, R):** The expert is dishonest and the customer rejects all major-repair recommendations. The expert always recommends a major repair, and the customer always rejects it, so the expert earns zero. The customer faces cost <span>&#92;(E'&#92;)</span> with probability <span>&#92;(r&#92;)</span> (the problem was major and she rejected the recommendation) and cost <span>&#92;(I'&#92;)</span> with probability <span>&#92;(1-r&#92;)</span> (the problem was minor, the expert lied, she rejected, and now the minor problem goes unrepaired).

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
      <td><span>&#92;(&#92;pi,\ -rE-(1-r)I&#92;)</span></td>
      <td><span>&#92;((1-r)&#92;pi,\ -rE'-(1-r)I&#92;)</span></td>
    </tr>
    <tr>
      <th>Dishonest</th>
      <td><span>&#92;(r&#92;pi+(1-r)&#92;pi',\ -E&#92;)</span></td>
      <td><span>&#92;(0,\ -rE'-(1-r)I'&#92;)</span></td>
    </tr>
  </tbody>
</table>

### Identifying Best Responses

Before solving for the equilibria formally, it helps to reason through each player's best responses at the corners of the strategy space.

**Expert's best responses.** If the customer is definitely going to accept (Accept), the expert does better by being dishonest: <span>&#92;(r&#92;pi + (1-r)&#92;pi' &gt; &#92;pi&#92;)</span> because <span>&#92;(&#92;pi' &gt; &#92;pi&#92;)</span>, so the weighted average of <span>&#92;(&#92;pi&#92;)</span> and <span>&#92;(&#92;pi'&#92;)</span> exceeds <span>&#92;(&#92;pi&#92;)</span> alone. If the customer is definitely going to reject, the expert does better by being honest: a dishonest expert always claims major and is always rejected, earning zero; an honest expert at least picks up the minor-repair business, earning <span>&#92;((1-r)&#92;pi &gt; 0&#92;)</span>.

**Customer's best responses.** If the expert is definitely being honest, the customer should always accept — she is receiving truthful advice, so rejecting only exposes her to the cost <span>&#92;(E'&#92;)</span> of a major problem going unrepaired, which is worse than paying <span>&#92;(E&#92;)</span>. If the expert is definitely dishonest, the customer's best response depends on the relative magnitudes of parameters. She must compare the cost of always accepting (<span>&#92;(E&#92;)</span>) against the expected cost of always rejecting (<span>&#92;(rE' + (1-r)I'&#92;)</span>). This comparison is not determined by the ordering <span>&#92;(I &lt; I' &lt; E &lt; E'&#92;)</span> alone, so we must consider cases.

### Pure Strategy Nash Equilibria

**Case 1: <span>&#92;(E &lt; rE' + (1-r)I'&#92;)</span>.** When the cost of accepting a (possibly fraudulent) major repair is less than the expected cost of always rejecting, the customer's best response to a dishonest expert is to accept. Combined with the fact that the expert's best response to an accepting customer is to be dishonest, we get a pure strategy Nash equilibrium: **(Dishonest, Accept)**. In this equilibrium the expert always lies when problems are minor and the customer always complies. There is no incentive for either to deviate: the expert would lose profit by being honest, and the customer would suffer a higher expected cost by rejecting.

**Case 2: <span>&#92;(E &gt; rE' + (1-r)I'&#92;)</span>.** Now rejecting is the customer's best response when the expert is dishonest. But accepting is the customer's best response when the expert is honest. Since neither player has a dominant strategy in this case, there is no pure strategy Nash equilibrium. The game must have a mixed strategy Nash equilibrium.

**Case 3: <span>&#92;(E = rE'+(1-r)I'&#92;)</span>.** The boundary case yields a continuum of equilibria — discussed briefly below.

### Finding the Mixed Strategy Nash Equilibrium

Let <span>&#92;(p&#92;)</span> denote the probability that the expert is Honest and <span>&#92;(1-p&#92;)</span> the probability that he is Dishonest. Let <span>&#92;(q&#92;)</span> denote the probability that the customer Accepts and <span>&#92;(1-q&#92;)</span> the probability that she Rejects.

We focus on Case 2 where <span>&#92;(E &gt; rE' + (1-r)I'&#92;)</span>.

**Expert's indifference condition.** For the expert to mix between Honest and Dishonest, he must be indifferent between them. His expected payoff to Honest is:

<span>&#92;[ q &#92;cdot &#92;pi + (1-q) &#92;cdot (1-r)&#92;pi &#92;]</span>

With probability <span>&#92;(q&#92;)</span> the customer accepts and the honest expert earns <span>&#92;(&#92;pi&#92;)</span>. With probability <span>&#92;(1-q&#92;)</span> the customer rejects; since the honest expert only earns anything when the problem is minor (probability <span>&#92;(1-r&#92;)</span>), his payoff is <span>&#92;((1-r)&#92;pi&#92;)</span>. His expected payoff to Dishonest is:

<span>&#92;[ q &#92;cdot (r&#92;pi + (1-r)&#92;pi') + (1-q) &#92;cdot 0 &#92;]</span>

When the customer accepts, the dishonest expert earns the weighted average <span>&#92;(r&#92;pi + (1-r)&#92;pi'&#92;)</span>. When the customer rejects, the dishonest expert always gets zero (every customer told about a major repair walks away). Setting these equal:

<span>&#92;[ q&#92;pi + (1-q)(1-r)&#92;pi = q(r&#92;pi + (1-r)&#92;pi') &#92;]</span>

Expanding the left side: <span>&#92;(q&#92;pi + (1-r)&#92;pi - q(1-r)&#92;pi&#92;)</span>. Expanding the right side: <span>&#92;(qr&#92;pi + q(1-r)&#92;pi'&#92;)</span>. After simplification (terms involving <span>&#92;(qr&#92;pi&#92;)</span> cancel on both sides along with the non-<span>&#92;(q&#92;)</span> terms), we arrive at:

<span>&#92;[ q^* = &#92;frac{&#92;pi}{&#92;pi'} &#92;]</span>

This is the equilibrium probability with which the customer must accept in order to keep the expert indifferent. Notice that it depends only on the expert's own profit parameters — not on the customer's costs or on <span>&#92;(r&#92;)</span>.

**Customer's indifference condition.** For the customer to mix, she must be indifferent between Accept and Reject. Her expected payoff (as a cost) to Accepting is:

<span>&#92;[ p(-rE - (1-r)I) - (1-p)E &#92;]</span>

Her expected payoff to Rejecting is:

<span>&#92;[ p(-rE' - (1-r)I) + (1-p)(-rE' - (1-r)I') &#92;]</span>

Setting these equal and solving for <span>&#92;(p&#92;)</span> yields:

<span>&#92;[ p^* = &#92;frac{E - [rE' + (1-r)I']}{(1-r)(E - I')} &#92;]</span>

One can verify that this is positive whenever <span>&#92;(E &gt; rE' + (1-r)I'&#92;)</span> (our Case 2 assumption) and less than one whenever <span>&#92;(E &lt; E'&#92;)</span>, which holds by assumption. So <span>&#92;(p^* &#92;in (0,1)&#92;)</span> is a valid mixing probability.

**The unique MSNE.** When <span>&#92;(E &gt; rE' + (1-r)I'&#92;)</span>, there is a unique mixed strategy Nash equilibrium:

<span>&#92;[ &#92;bigl((p^*,\, 1-p^*),\, (q^*,\, 1-q^*)&#92;bigr) &#92;]</span>

where

<span>&#92;[ p^* = &#92;frac{E - [rE' + (1-r)I']}{(1-r)(E - I')}, &#92;qquad q^* = &#92;frac{&#92;pi}{&#92;pi'} &#92;]</span>

**The boundary case.** When <span>&#92;(E = rE' + (1-r)I'&#92;)</span>, the customer is exactly indifferent between Accept and Reject whenever the expert is dishonest. In this case, the best response functions overlap along a line segment, and there is a continuum of MSNE: all profiles <span>&#92;(((0,1),\,(q^*,\,1-q^*))&#92;)</span> with <span>&#92;(q^* &#92;in [&#92;pi/&#92;pi',\,1]&#92;)</span> are equilibria — the expert is always dishonest and the customer mixes with any acceptance probability above the threshold <span>&#92;(&#92;pi/&#92;pi'&#92;)</span>.

### Comparative Statics: Counterintuitive Predictions

The payoff of game theory is not just finding equilibria but understanding how they respond to changes in the environment. The expert diagnosis MSNE delivers three predictions that violate naive intuition.

**Major problems become less common (<span>&#92;(r&#92;)</span> falls).** One might expect that as major problems become rarer, a rational customer would trust the expert less — after all, any given "major" diagnosis is now more likely to be a lie. Intuition says the customer should reject more, so <span>&#92;(q^*&#92;)</span> should fall. But look at the formula: <span>&#92;(q^* = &#92;pi/&#92;pi'&#92;)</span> contains no <span>&#92;(r&#92;)</span>. The acceptance probability does not change at all. The resolution is that this partial reasoning ignores how the expert responds. To see what actually adjusts, rewrite <span>&#92;(p^*&#92;)</span> as:

<span>&#92;[ p^* = 1 - &#92;frac{r(E' - E)}{(1-r)(E - I')} &#92;]</span>

As <span>&#92;(r&#92;)</span> falls, <span>&#92;(p^*&#92;)</span> rises — the expert becomes *more* honest. The mechanism: when major problems are rare, the customer has less at stake when rejecting (she is unlikely to be driving away from a truly dangerous repair). To keep the customer indifferent — a necessary condition for the customer to ever accept in equilibrium — the expert must compensate by being honest more often. A more honest expert is one with whom the customer is again willing to engage. The customer's strategy stays put; the expert's strategy adjusts.

**Major repairs become less expensive (<span>&#92;(E&#92;)</span> falls).** Now one might expect the customer to accept more readily — a major repair is cheaper, so what is the harm? Again, <span>&#92;(q^*&#92;)</span> is unchanged. The formula for <span>&#92;(p^*&#92;)</span> shows that as <span>&#92;(E&#92;)</span> falls, <span>&#92;(p^*&#92;)</span> falls too — the expert becomes *less* honest. The mechanism: cheaper major repairs reduce the customer's cost of being deceived. She is willing to accept even if the expert is more likely to be lying. Sensing this, the expert takes advantage and becomes less scrupulous. The customer's indifference is restored not by any change in her strategy but by the deterioration of the expert's honesty. This is a striking result: **improving the affordability of a service can paradoxically increase the dishonesty of providers**.

**Gain from dishonesty falls (<span>&#92;(&#92;pi'&#92;)</span> falls).** Suppose regulators or professional norms reduce the premium that an expert can extract from a fraudulent major repair. One might expect experts to become more honest — the temptation has diminished. But <span>&#92;(p^*&#92;)</span> contains no <span>&#92;(&#92;pi'&#92;)</span>, so expert honesty is unchanged. What adjusts is <span>&#92;(q^* = &#92;pi/&#92;pi'&#92;)</span>: as <span>&#92;(&#92;pi'&#92;)</span> falls, <span>&#92;(q^*&#92;)</span> rises and the customer becomes *more accepting*. The intuition: with a smaller temptation, the expert is less attracted to dishonesty. For the expert to remain indifferent between honest and dishonest behavior, the customer must make dishonesty more profitable by accepting more often. Reducing the gain from fraud thus makes customers more credulous — the opposite of what you might hope for.

These three comparative statics share a common lesson. **In a mixed strategy Nash equilibrium, a player's mixing probability is determined by the opponent's payoffs, not their own.** Each player adjusts their strategy to keep the other player indifferent. Reasoning about one player's incentives in isolation — without accounting for the opponent's strategic response — consistently leads to wrong answers. The model forces us to think through both sides simultaneously.

---

## Section 2: Soccer Penalty Kicks

<div class="embed-container"><iframe src="https://www.youtube.com/embed/mKmcxZtFvQ4?rel=0&start=380" frameborder="0" allowfullscreen></iframe></div>

*A penalty kick compilation illustrating the simultaneous-move structure of the kicker–goalkeeper game.*

### Why Penalty Kicks Are a Natural Laboratory

Soccer penalty kicks offer a remarkably clean test of MSNE theory. Several features make them ideal. First, the ball travels at over 200 kilometers per hour and reaches the net in roughly 0.2 seconds — far too fast for the goalkeeper to observe the kick direction and then dive. Both players must commit to their direction essentially simultaneously, making this a genuine simultaneous-move game. Second, the game is **purely competitive**: whatever is good for the kicker (a goal) is bad for the goalkeeper, and vice versa. This is the zero-sum structure of Matching Pennies, and it guarantees a unique MSNE in mixed strategies. Third, the stakes are high — penalty shootouts often decide major tournaments — so we expect players to have developed close-to-optimal behavior over many repetitions. Fourth, data on what players actually did are publicly available.

### The Two-Action Model

Normalizing to a right-footed kicker, the kicker's **natural side** is the left of the net (where his shot is hardest and most accurate) and his **weak side** is the right. The goalkeeper can dive toward either side. This gives a 2×2 game structure analogous to Matching Pennies, though with asymmetric success probabilities reflecting real skill differences.

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

Let <span>&#92;(q&#92;)</span> be the probability that the goalkeeper dives Left. The kicker mixes only if he is indifferent between Left and Right:

<span>&#92;[ 70q + 95(1-q) = 92q + 58(1-q) &#92;]</span>

<span>&#92;[ 95 - 25q = 58 + 34q &#92;]</span>

<span>&#92;[ 59q = 37 &#92;implies q^* = 62.7&#92;% &#92;]</span>

Now let <span>&#92;(p&#92;)</span> be the probability that the kicker shoots Left. The goalkeeper mixes only if he is indifferent between diving Left and diving Right (where his payoffs are negatives of the kicker's):

<span>&#92;[ -70p - 92(1-p) = -95p - 58(1-p) &#92;]</span>

<span>&#92;[ -92 + 22p = -58 - 37p &#92;]</span>

<span>&#92;[ 59p = 34 &#92;implies p^* = 57.6&#92;% &#92;]</span>

The unique MSNE is: kicker shoots Left with probability 57.6% and Right with probability 42.4%; goalkeeper dives Left with probability 62.7% and Right with probability 37.3%.

### Comparing Theory to Data

How does this theoretical prediction compare to what professional players actually do? The data show that kickers chose their natural (left) side 60% of the time, and goalkeepers dove to the natural side 57.7% of the time. These observed frequencies are strikingly close to the MSNE predictions of 57.6% and 62.7% respectively. Professional players, through experience, competition, and perhaps intuition honed over thousands of kicks, appear to behave in ways that closely approximate theoretically optimal mixed strategies.

Another notable feature is that in the MSNE, each player's expected success rate should be the same regardless of which action they choose. This **indifference condition** is in fact approximately satisfied in the data: the overall scoring rates from left and right kicks, and the overall save rates from diving left versus right, are close to equal across action choices.

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

On March 13, 1964, Kitty Genovese was murdered outside her apartment in New York City. Thirty-seven neighbors reportedly witnessed the attack or heard her cries for help over a period of more than thirty minutes. None called the police. The case became a touchstone for social psychologists studying what they called the **bystander effect** — the observed tendency for individuals to be less likely to offer help when other bystanders are present.

Game theory offers a complementary and formally precise account of this phenomenon. The **Volunteer's Dilemma**, as economists call it, shows that the bystander effect is not a failure of character or empathy but an equilibrium outcome of rational behavior when there are many potential helpers.

### The Model

A crime is observed by <span>&#92;(n&#92;)</span> people, where <span>&#92;(n &#92;geq 2&#92;)</span>. Each person would like the police to be informed, but each prefers that someone else make the call. Formally:

- Each person attaches **value** <span>&#92;(v &gt; 0&#92;)</span> to the police being notified (the crime is stopped or investigated).
- Making the call imposes a personal **cost** <span>&#92;(c&#92;)</span> on the caller, where <span>&#92;(0 &lt; c &lt; v&#92;)</span>. The cost might be time, effort, the discomfort of getting involved, or fear of retaliation.
- The police need to be called only once — a single call is sufficient.

This makes reporting a **public good** with a twist: the good is provided as soon as one person contributes, so additional contributors add nothing. Each person's payoffs are:

- **0** if no one calls (the crime goes unreported).
- **<span>&#92;(v - c&#92;)</span>** if she calls (she bears the cost but the good is provided).
- **<span>&#92;(v&#92;)</span>** if at least one other person calls and she does not (she gets the benefit for free).

Since <span>&#92;(c &gt; 0&#92;)</span>, a person strictly prefers that someone else make the call. Since <span>&#92;(c &lt; v&#92;)</span>, she would rather call herself than have no one call at all.

### Pure Strategy Nash Equilibria

There are exactly <span>&#92;(n&#92;)</span> pure strategy Nash equilibria: in each, exactly one specific person calls and everyone else does not. These equilibria are straightforward to verify — the caller cannot do better by not calling (she would get 0 instead of <span>&#92;(v - c &gt; 0&#92;)</span>), and no non-caller can do better by calling (she already receives <span>&#92;(v&#92;)</span> for free, and calling would reduce her payoff to <span>&#92;(v - c&#92;)</span>).

These pure equilibria are compelling when the group is **heterogeneous** — if one person is obviously the most appropriate caller (say, the person closest to a phone, or the most senior member of a group), coordination is easy. But when the group is **homogeneous** — all witnesses are essentially identical in their costs and values — there is no natural way to pick who should be the designated caller. In a symmetric setting, a symmetric equilibrium is the right concept.

### The Symmetric Mixed Strategy Nash Equilibrium

In a symmetric MSNE, every person calls with the same probability <span>&#92;(p&#92;)</span> and does not call with probability <span>&#92;(1-p&#92;)</span>, where <span>&#92;(0 &lt; p &lt; 1&#92;)</span>. By Proposition 116.2, for this to be an equilibrium each person must be indifferent between calling and not calling.

**Payoff to calling:** <span>&#92;(v - c&#92;)</span> (certain, since the call itself ensures the police are notified).

**Expected payoff to not calling:** The person gets <span>&#92;(v&#92;)</span> if at least one of the other <span>&#92;(n-1&#92;)</span> people calls, and 0 if none of the others call. The probability that none of the other <span>&#92;(n-1&#92;)</span> people call is <span>&#92;((1-p)^{n-1}&#92;)</span> (since each person independently does not call with probability <span>&#92;(1-p&#92;)</span>). Therefore:

<span>&#92;[ &#92;text{Expected payoff to Not Call} = v &#92;cdot &#92;bigl(1 - (1-p)^{n-1}&#92;bigr) + 0 &#92;cdot (1-p)^{n-1} = v&#92;bigl(1-(1-p)^{n-1}&#92;bigr) &#92;]</span>

Setting the two payoffs equal:

<span>&#92;[ v - c = v&#92;bigl(1 - (1-p)^{n-1}&#92;bigr) &#92;]</span>

<span>&#92;[ &#92;frac{c}{v} = (1-p)^{n-1} &#92;]</span>

This is the **equilibrium condition**: the probability that none of the other <span>&#92;(n-1&#92;)</span> people call must equal the ratio <span>&#92;(c/v&#92;)</span>. Solving for <span>&#92;(p&#92;)</span>:

<span>&#92;[ p^* = 1 - &#92;left(&#92;frac{c}{v}&#92;right)^{1/(n-1)} &#92;]</span>

Since <span>&#92;(0 &lt; c/v &lt; 1&#92;)</span>, we have <span>&#92;(0 &lt; (c/v)^{1/(n-1)} &lt; 1&#92;)</span>, so <span>&#92;(p^* &#92;in (0,1)&#92;)</span> — a valid mixing probability.

The symmetric MSNE is the strategy profile in which each of the <span>&#92;(n&#92;)</span> people calls with probability:

<span>&#92;[ p^* = 1 - &#92;left(&#92;frac{c}{v}&#92;right)^{1/(n-1)} &#92;]</span>

### The Bystander Effect: Equilibrium and Group Size

How does the equilibrium change as the number of witnesses <span>&#92;(n&#92;)</span> grows? As <span>&#92;(n&#92;)</span> increases, the exponent <span>&#92;(1/(n-1)&#92;)</span> decreases toward zero. Since <span>&#92;(c/v &lt; 1&#92;)</span>, raising a number smaller than 1 to a smaller exponent brings it closer to 1. Therefore <span>&#92;((c/v)^{1/(n-1)}&#92;)</span> increases toward 1, and <span>&#92;(p^* = 1 - (c/v)^{1/(n-1)}&#92;)</span> decreases toward 0. **Each individual is less likely to call as the group grows.** This is the first dimension of the bystander effect.

But is the *overall* probability that the crime gets reported higher or lower with more witnesses? One might hope that even if each individual is less likely to call, having more individuals compensates. The equilibrium calculation shows otherwise.

The probability that **no one** calls is:

<span>&#92;[ &#92;Pr[&#92;text{no one calls}] = (1-p^*)^n = &#92;left(&#92;frac{c}{v}&#92;right)^{n/(n-1)} &#92;]</span>

Note that <span>&#92;(n/(n-1)&#92;)</span> is a decreasing function of <span>&#92;(n&#92;)</span>: it starts at 2 when <span>&#92;(n=2&#92;)</span> and decreases toward 1 as <span>&#92;(n &#92;to &#92;infty&#92;)</span>. Since <span>&#92;(c/v &lt; 1&#92;)</span>, raising it to a smaller exponent makes it larger. Therefore:

<span>&#92;[ &#92;frac{d}{dn}&#92;left(&#92;frac{c}{v}&#92;right)^{n/(n-1)} &gt; 0 &#92;]</span>

**The probability that the crime goes unreported strictly increases with the number of witnesses.** A group of 37 neighbors is less likely to call the police than a group of 2, in equilibrium. This is the bystander effect derived as a theorem, not merely observed as a behavioral tendency.

### Interpretation

Two interpretations of the symmetric MSNE are possible. One interpretation is that each individual genuinely randomizes — flipping an internal coin with bias <span>&#92;(p^*&#92;)</span> every time they witness a crime. A perhaps more natural interpretation is that <span>&#92;(p^*&#92;)</span> is the **fraction of the population** that would call given their particular personal costs and values. In a large population, some people have low <span>&#92;(c/v&#92;)</span> ratios and almost always call; others have high ratios and almost never do. The equilibrium <span>&#92;(p^*&#92;)</span> describes the average behavior of this population.

Social psychologists have proposed three mechanisms for the bystander effect: **diffusion of responsibility** (each person feels less morally obligated when others are present), **audience inhibition** (fear of embarrassment if it turns out not to be an emergency), and **social influence** (inferring from others' inaction that intervention is unnecessary). Game theory suggests a fourth mechanism — **strategic free-riding** — that operates even when all of these psychological factors are absent. The bystander effect is a prediction of rational equilibrium behavior, and that makes it robust across a wide range of settings and motivations.

---

# Chapter 11: Extensive Games & Subgame Perfect Equilibrium

## Section 1: Extensive Games with Perfect Information

### Why Sequential Games Matter

The model of a strategic game, which dominated earlier chapters, suppresses the sequential nature of decision-making. In a strategic game, players cannot respond to what other players do — everyone chooses simultaneously, once and for all, before any action is revealed. Many real-world interactions, however, are genuinely sequential: one player moves first, another observes what happened, and then responds. To capture this structure we need a richer model.

An **extensive game with perfect information** models this sequential structure explicitly. The qualifying phrase "perfect information" means that whenever a player is about to move, she knows the complete history of every action taken up to that point. Imperfect information — where players may not observe earlier actions — is a further generalisation covered in a later chapter.

### Defining an Extensive Game

To describe an extensive game with perfect information, we still need to specify the set of players and their preferences. In addition, we need to specify the order of moves and the actions available at each point. We do this through two new objects: **terminal histories** and a **player function**.

A **terminal history** is a sequence of actions that traces the complete play of the game from beginning to end. More precisely, the terminal histories form a set of sequences with the property that no sequence is a proper subhistory of any other — once a sequence reaches a terminal node, play is over and nothing further follows. Formally, the structure of an extensive game is given by Definition 155.1:

> An extensive game with perfect information consists of: (i) a set of players; (ii) a set of sequences (terminal histories) with the property that no sequence is a proper subhistory of any other sequence; (iii) a function (the **player function**) that assigns a player to every sequence that is a proper subhistory of some terminal history; and (iv) for each player, preferences over the set of terminal histories.

The player function <span>&#92;( P &#92;)</span> tells us who moves after any given partial sequence of actions. A **history** is any sequence of actions that is a subhistory of some terminal history — it represents a point the game may reach. A **proper subhistory** of a terminal history is any strict initial segment of it (not including the terminal history itself).

### Subhistories and the Consistency Constraint

To make sure a set of sequences can legitimately represent the terminal histories of a game, exactly one restriction is needed: no sequence in the set may be a proper subhistory of another sequence in the set. This ensures that choosing action <span>&#92;( A &#92;)</span> cannot simultaneously end the game and leave room for further play.

For a sequence <span>&#92;( (a_1, a_2, &#92;ldots, a_k) &#92;)</span>, its subhistories are the empty history <span>&#92;( &#92;emptyset &#92;)</span> and all sequences of the form <span>&#92;( (a_1, a_2, &#92;ldots, a_m) &#92;)</span> for <span>&#92;( 1 &#92;leq m &#92;leq k &#92;)</span>. Any subhistory not equal to the full sequence is a proper subhistory. So if <span>&#92;( (A, D, F) &#92;)</span> is a terminal history, none of <span>&#92;( &#92;emptyset &#92;)</span>, <span>&#92;( (A) &#92;)</span>, or <span>&#92;( (A, D) &#92;)</span> may itself be a terminal history.

### The Entry Game

A running example throughout this chapter is the **entry game**, which models competition between an incumbent monopolist and a potential challenger. The setup: a challenger decides whether to enter an industry. If the challenger enters, the incumbent decides whether to acquiesce (peacefully share the market) or fight (engage in costly price competition).

The terminal histories, player function, and payoffs are:

- Terminal histories: <span>&#92;( (&#92;text{In},\,&#92;text{Acquiesce}) &#92;)</span>, <span>&#92;( (&#92;text{In},\,&#92;text{Fight}) &#92;)</span>, <span>&#92;( (&#92;text{Out}) &#92;)</span>
- Player function: <span>&#92;( P(&#92;emptyset) = &#92;text{Challenger} &#92;)</span>; <span>&#92;( P(&#92;text{In}) = &#92;text{Incumbent} &#92;)</span>
- Payoffs (Challenger, Incumbent):
  - <span>&#92;( (&#92;text{In},\,&#92;text{Acquiesce}) &#92;mapsto (2,\,1) &#92;)</span>
  - <span>&#92;( (&#92;text{In},\,&#92;text{Fight}) &#92;mapsto (0,\,0) &#92;)</span>
  - <span>&#92;( (&#92;text{Out}) &#92;mapsto (1,\,2) &#92;)</span>

The challenger's best outcome is entry followed by acquiescence; her worst is entry followed by a fight. The incumbent most prefers that the challenger stay out; his worst outcome is a fight.

### Strategies in Extensive Games

In a strategic game, a player's strategy is simply an action (or, in the mixed-extension, a probability distribution over actions). In an extensive game, the concept of a **strategy** is more demanding.

**Definition 159.1.** A strategy of player <span>&#92;( i &#92;)</span> in an extensive game with perfect information is a function that assigns to each history <span>&#92;( h &#92;)</span> after which it is player <span>&#92;( i &#92;)</span>'s turn to move an action in <span>&#92;( A(h) &#92;)</span>, the set of actions available after <span>&#92;( h &#92;)</span>.

The key point is that a strategy specifies an action at every decision point — including histories that may never be reached given the strategy itself. A strategy is a full contingency plan. If player 1 intends to choose <span>&#92;( B &#92;)</span> at the start of the game, she may never face the node that follows <span>&#92;( A &#92;)</span>. Yet her strategy must still specify what she would do there. One interpretation: the strategy describes what she would do if she were to make a mistake and accidentally choose <span>&#92;( A &#92;)</span>. Another interpretation: she gives complete instructions to an agent before the game starts, and those instructions must cover every contingency.

Consider the game with terminal histories <span>&#92;( (A,C) &#92;)</span>, <span>&#92;( (A,D,F) &#92;)</span>, <span>&#92;( (A,D,G) &#92;)</span>, <span>&#92;( (A,D,H) &#92;)</span>, and <span>&#92;( (B,E) &#92;)</span>, with player function <span>&#92;( P(&#92;emptyset)=1 &#92;)</span>, <span>&#92;( P(A)=2 &#92;)</span>, <span>&#92;( P(A,D)=1 &#92;)</span>, <span>&#92;( P(B)=2 &#92;)</span>. Player 1 moves at the empty history and again, possibly, after <span>&#92;( (A,D) &#92;)</span>. Her strategies therefore each have two components: an action at <span>&#92;( &#92;emptyset &#92;)</span> (either <span>&#92;( A &#92;)</span> or <span>&#92;( B &#92;)</span>) and an action at <span>&#92;( (A,D) &#92;)</span> (one of <span>&#92;( F &#92;)</span>, <span>&#92;( G &#92;)</span>, <span>&#92;( H &#92;)</span>). Her strategy set is <span>&#92;( &#92;{AF,\,AG,\,AH,\,BF,\,BG,\,BH\} &#92;)</span>. Player 2 moves after <span>&#92;( A &#92;)</span> (choosing <span>&#92;( C &#92;)</span> or <span>&#92;( D &#92;)</span>) and after <span>&#92;( B &#92;)</span> (choosing <span>&#92;( E &#92;)</span>, the only option). Her strategy set is <span>&#92;( &#92;{CE,\,DE\} &#92;)</span>.

### Outcomes

The **outcome** <span>&#92;( O(s) &#92;)</span> of a strategy profile <span>&#92;( s &#92;)</span> is the terminal history that results when all players implement their strategies. The outcome is what actually happens — the path through the tree. Different strategy profiles can generate the same outcome. For example, <span>&#92;( (BF,\,CE) &#92;)</span> and <span>&#92;( (BG,\,DE) &#92;)</span> both produce the terminal history <span>&#92;( (B,E) &#92;)</span>, because the second entry of each player's strategy is never relevant when player 1 begins by playing <span>&#92;( B &#92;)</span>.

---

## Section 2: Nash Equilibrium in Extensive Games

### Adapting the Definition

We adapt the definition of Nash equilibrium from strategic games to extensive games in a natural way. A strategy profile <span>&#92;( s^* &#92;)</span> is a **Nash equilibrium** of an extensive game with perfect information if, for every player <span>&#92;( i &#92;)</span> and every strategy <span>&#92;( r_i &#92;)</span> of player <span>&#92;( i &#92;)</span>, the outcome generated by <span>&#92;( s^* &#92;)</span> is at least as good for player <span>&#92;( i &#92;)</span> as the outcome generated when player <span>&#92;( i &#92;)</span> deviates to <span>&#92;( r_i &#92;)</span> and everyone else remains at <span>&#92;( s^* &#92;)</span>.

**Definition 161.2.** The strategy profile <span>&#92;( s^* &#92;)</span> in an extensive game with perfect information is a Nash equilibrium if, for every player <span>&#92;( i &#92;)</span> and every strategy <span>&#92;( r_i &#92;)</span> of player <span>&#92;( i &#92;)</span>:

<span>&#92;[ u_i\!&#92;left(O(s^*)&#92;right) \;&#92;geq\; u_i\!&#92;left(O(r_i,\, s^*_{-i})&#92;right) &#92;]</span>

where <span>&#92;( u_i &#92;)</span> is a payoff function representing player <span>&#92;( i &#92;)</span>'s preferences over terminal histories and <span>&#92;( O(&#92;cdot) &#92;)</span> is the outcome function. In other words, no player can make a profitable deviation, given the other players' strategies.

### The Strategic Form of an Extensive Game

For finite extensive games, there is a systematic method for finding all Nash equilibria: convert the extensive game to its **strategic form**. The strategic form is a strategic game defined as follows:

- **Players:** the same set of players as in the extensive game.
- **Actions:** each player's set of actions in the strategic form is her set of strategies in the extensive game.
- **Preferences:** each player's payoff to an action profile in the strategic form equals the payoff she receives in the terminal history generated by that strategy profile in the extensive game.

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

1. **(In, Acquiesce)** — the challenger enters and the incumbent accommodates.
2. **(Out, Fight)** — the challenger stays out, with the incumbent threatening to fight if entry occurs.

### The Credibility Problem

The first equilibrium, (In, Acquiesce), is exactly what backward induction predicts: knowing the incumbent would prefer to acquiesce once challenged, the challenger safely enters. This equilibrium is intuitive and realistic.

The second equilibrium, (Out, Fight), is more troubling. It is technically a Nash equilibrium — given that the incumbent threatens to fight, the challenger's best response is to stay out, and given that the challenger stays out, the incumbent's threat of fighting is costless (the threat is never called upon). The logic is mutually consistent.

But is this equilibrium credible? Consider what would happen if the challenger were actually to enter. At that moment, the incumbent would have to choose between acquiescing (earning 1) and fighting (earning 0). The incumbent would clearly prefer to acquiesce. The threat to fight is therefore **not credible** — the incumbent cannot commit to fighting before the game begins, and at the moment the threat is tested, they would back down.

A useful way to see this fragility: suppose players occasionally make small mistakes, so that every node in the game tree is reached with some small positive probability. In that case, the incumbent would sometimes find themselves at the node where they must choose between acquiescing and fighting. At that node, acquiescing strictly dominates fighting. So (Out, Fight) cannot be an equilibrium of this "perturbed" game, no matter how small the probability of mistakes. A Nash equilibrium that collapses under the smallest perturbation is not a robust prediction.

This problem arises because the Nash equilibrium concept treats strategies as commitments made once and for all before play begins. It does not require strategies to be optimal off the equilibrium path. We need a stronger solution concept that rules out non-credible threats.

---

## Section 3: Subgame Perfect Equilibrium

### The Intuition

The idea behind **subgame perfect equilibrium** is to require not just that players are acting optimally along the equilibrium path, but that they are acting optimally after every possible history — including histories that would never be reached under the equilibrium strategies. The reasoning is simple: if a node were ever reached, we would expect the player moving there to act optimally. Therefore, in any genuinely robust equilibrium, strategies must be optimal everywhere, not merely on the path that the equilibrium actually travels.

This is a refinement of Nash equilibrium. It eliminates equilibria that rest on empty threats — promises of actions the player would never actually want to carry out if called upon.

### Subgames

To formalise this, we need the concept of a **subgame**.

**Definition 164.1.** Let <span>&#92;( &#92;Gamma &#92;)</span> be an extensive game with perfect information and player function <span>&#92;( P &#92;)</span>. For any nonterminal history <span>&#92;( h &#92;)</span> of <span>&#92;( &#92;Gamma &#92;)</span>, the subgame <span>&#92;( &#92;Gamma(h) &#92;)</span> following the history <span>&#92;( h &#92;)</span> is the extensive game with:

- **Players:** the same players as in <span>&#92;( &#92;Gamma &#92;)</span>.
- **Terminal histories:** the set of all sequences <span>&#92;( h' &#92;)</span> of actions such that <span>&#92;( (h, h') &#92;)</span> is a terminal history of <span>&#92;( &#92;Gamma &#92;)</span>.
- **Player function:** the player <span>&#92;( P(h, h') &#92;)</span> is assigned to each proper subhistory <span>&#92;( h' &#92;)</span> of a terminal history.
- **Preferences:** each player prefers <span>&#92;( h' &#92;)</span> to <span>&#92;( h'' &#92;)</span> in <span>&#92;( &#92;Gamma(h) &#92;)</span> if and only if she prefers <span>&#92;( (h, h') &#92;)</span> to <span>&#92;( (h, h'') &#92;)</span> in <span>&#92;( &#92;Gamma &#92;)</span>.

In words: follow the history <span>&#92;( h &#92;)</span> through the game tree; the subgame <span>&#92;( &#92;Gamma(h) &#92;)</span> is everything that remains below that node. Payoffs are inherited unchanged from <span>&#92;( &#92;Gamma &#92;)</span>.

Two important notes. First, the subgame following the **empty history** <span>&#92;( &#92;emptyset &#92;)</span> is the entire game itself. Every other subgame is called a **proper subgame**. Second, the number of subgames equals the number of nonterminal histories, because there is one subgame for each nonterminal history.

For the five-terminal-history game introduced in Section 1 (with player function <span>&#92;( P(&#92;emptyset)=1 &#92;)</span>, <span>&#92;( P(A)=2 &#92;)</span>, <span>&#92;( P(A,D)=1 &#92;)</span>, <span>&#92;( P(B)=2 &#92;)</span>), there are four nonterminal histories — <span>&#92;( &#92;emptyset &#92;)</span>, <span>&#92;( (A) &#92;)</span>, <span>&#92;( (A,D) &#92;)</span>, <span>&#92;( (B) &#92;)</span> — and therefore four subgames.

### The Notation <span>&#92;( O_h(s) &#92;)</span>

Before stating the formal definition, we introduce notation for the outcome of a strategy profile within a subgame. Let <span>&#92;( h &#92;)</span> be a history (not necessarily on the path generated by <span>&#92;( s &#92;)</span>) and let <span>&#92;( s &#92;)</span> be a strategy profile. Suppose history <span>&#92;( h &#92;)</span> occurs and the players thereafter follow <span>&#92;( s &#92;)</span>. Denote by <span>&#92;( O_h(s) &#92;)</span> the resulting terminal history: it consists of <span>&#92;( h &#92;)</span> followed by the path generated by <span>&#92;( s &#92;)</span> in the subgame <span>&#92;( &#92;Gamma(h) &#92;)</span>. Note that <span>&#92;( O_&#92;emptyset(s) = O(s) &#92;)</span>.

### Formal Definition of SPE

**Definition 166.1.** The strategy profile <span>&#92;( s^* &#92;)</span> in an extensive game with perfect information is a **subgame perfect equilibrium (SPE)** if, for every player <span>&#92;( i &#92;)</span>, every history <span>&#92;( h &#92;)</span> after which it is player <span>&#92;( i &#92;)</span>'s turn to move, and every strategy <span>&#92;( r_i &#92;)</span> of player <span>&#92;( i &#92;)</span>:

<span>&#92;[ u_i\!&#92;left(O_h(s^*)&#92;right) \;&#92;geq\; u_i\!&#92;left(O_h(r_i,\, s^*_{-i})&#92;right) &#92;]</span>

In plain language: in every subgame, the player who moves first at the start of that subgame cannot profitably deviate from <span>&#92;( s^* &#92;)</span>, given that all other players adhere to <span>&#92;( s^* &#92;)</span>. Crucially, this must hold in every subgame — not only in subgames that are actually reached under <span>&#92;( s^* &#92;)</span>.

A practical implication for checking SPE: you only need to verify that the player who **moves first** in each subgame is acting optimally. Players who move second, third, and so on in a given subgame are themselves moving first in smaller subgames that will be checked separately.

### SPE is a Refinement of NE

Every subgame perfect equilibrium is a Nash equilibrium, but not every Nash equilibrium is a subgame perfect equilibrium. The reasoning for the first direction: one of the subgames is the entire game itself (the subgame following the empty history). So a strategy profile that induces a Nash equilibrium in every subgame certainly induces a Nash equilibrium in the entire game. Hence every SPE is a NE. The converse fails, as the entry game demonstrates.

The set of SPE is a subset of the set of NE:

<span>&#92;[ &#92;text{SPE} \;&#92;subseteq\; &#92;text{NE} &#92;]</span>

SPE is described as a **refinement** of NE because it retains only those NE that survive the additional requirement of optimality off the equilibrium path.

### Checking SPE in the Entry Game

The entry game has two subgames: the entire game (following <span>&#92;( &#92;emptyset &#92;)</span>) and the proper subgame following the history (In), where the incumbent chooses between Acquiesce and Fight.

**Is (Out, Fight) an SPE?** Consider the subgame following history (In). Here the incumbent moves first. Under the strategy profile (Out, Fight), the incumbent is prescribed to Fight. But in this subgame, fighting yields payoff 0 while acquiescing yields payoff 1. The incumbent is not acting optimally. Therefore (Out, Fight) is **not** an SPE.

**Is (In, Acquiesce) an SPE?** Check each subgame:
- Subgame following <span>&#92;( &#92;emptyset &#92;)</span>: the challenger moves first and plays In, earning payoff 2. Deviating to Out yields payoff 1. So In is optimal. ✓
- Subgame following (In): the incumbent moves first and plays Acquiesce, earning payoff 1. Deviating to Fight yields payoff 0. So Acquiesce is optimal. ✓

Both subgames check out. Therefore **(In, Acquiesce) is the unique SPE** of the entry game.

### Interpretation: No Empty Threats

Subgame perfect equilibrium can be interpreted in two complementary ways.

The first is that it rules out **empty threats**. A player cannot credibly threaten to take an action off the equilibrium path if, were that node ever reached, the player would prefer to do something else. The incumbent in the entry game cannot credibly threaten to fight because fighting is suboptimal at the moment it would actually be required.

The second interpretation is that of a **robust steady state**. Imagine that each player occasionally makes small mistakes, so that every node in the game is reached with some small positive probability. In such a "perturbed" game, every player must be acting optimally at every node, because every node is sometimes reached. As mistake probabilities shrink to zero, the equilibria that survive are exactly the SPE. Nash equilibria that rest on non-credible off-path strategies do not survive this perturbation.

---

## Section 4: Finding SPE — Methods and Backward Induction

### Three Approaches

There are essentially three methods for finding subgame perfect equilibria.

The first is to convert the extensive game to its strategic form, identify all Nash equilibria, and then check each one to determine whether it induces optimal play in every subgame. This is what we did for the entry game: we found the two NE, then checked each for SPE. This approach is reliable but can be laborious when the number of strategies is large.

The second, and most practical, approach for finite-horizon games is **backward induction**. This is the method we will use in most applications.

The third is to conjecture a strategy profile, verify directly from the SPE definition that every player moves optimally in every subgame, and conclude that the conjectured profile is an SPE. This approach does not rule out other SPE — it merely confirms that one particular profile qualifies. It becomes useful for games with infinite horizons, where the first two methods break down.

### The Backward Induction Procedure

Define the **length** of a subgame to be the length of the longest history in that subgame — in other words, how many periods of play remain from the start of the subgame to the furthest terminal node.

The backward induction procedure is:

1. Find the optimal actions of the players who move at the start of the subgames of **length 1** (the "last" subgames — those immediately preceding terminal nodes). Record these actions.
2. Taking these actions as given, find the optimal actions of the players who move at the start of the subgames of **length 2**. Roll the resulting payoffs back up to the node at the start of the length-2 subgame.
3. Continue working backwards toward the beginning of the game until reaching the subgame of the full game.

At each stage, a player at the start of a subgame knows what will happen in all subsequent subgames (already resolved in earlier steps) and chooses the action that maximises her payoff given this knowledge.

**Uniqueness result.** If at the start of every subgame there is a single optimal action, the procedure identifies a unique SPE. If at the start of some subgame more than one action is optimal (a tie), all optimal actions are consistent with an SPE and the procedure identifies all SPE by considering each case separately.

### Worked Example 1: The Five-Terminal Game (Unique SPE)

Consider the game with payoffs:

- Terminal history <span>&#92;( (A,C) &#92;)</span>: payoffs <span>&#92;( (0,1) &#92;)</span>
- Terminal history <span>&#92;( (A,D,F) &#92;)</span>: payoffs <span>&#92;( (5,2) &#92;)</span>
- Terminal history <span>&#92;( (A,D,G) &#92;)</span>: payoffs <span>&#92;( (1,3) &#92;)</span>
- Terminal history <span>&#92;( (A,D,H) &#92;)</span>: payoffs <span>&#92;( (4,4) &#92;)</span>
- Terminal history <span>&#92;( (B,E) &#92;)</span>: payoffs <span>&#92;( (1,3) &#92;)</span>

with <span>&#92;( P(&#92;emptyset)=1 &#92;)</span>, <span>&#92;( P(A)=2 &#92;)</span>, <span>&#92;( P(A,D)=1 &#92;)</span>, <span>&#92;( P(B)=2 &#92;)</span>.

**Step 1 — Subgames of length 1.** Two subgames have length 1:
- Subgame after <span>&#92;( (A,D) &#92;)</span>: Player 1 chooses among <span>&#92;( F &#92;)</span> (payoff 5), <span>&#92;( G &#92;)</span> (payoff 1), <span>&#92;( H &#92;)</span> (payoff 4). Optimal action: <span>&#92;( F &#92;)</span>. Roll up payoff <span>&#92;( (5,2) &#92;)</span> to node <span>&#92;( (A,D) &#92;)</span>.
- Subgame after <span>&#92;( (B) &#92;)</span>: Player 2 has only one action, <span>&#92;( E &#92;)</span>. Roll up payoff <span>&#92;( (1,3) &#92;)</span> to node <span>&#92;( (B) &#92;)</span>.

**Step 2 — Subgame of length 2.** The subgame after <span>&#92;( (A) &#92;)</span> has length 2. Player 2 chooses between <span>&#92;( C &#92;)</span> (payoff 1 for player 2) and <span>&#92;( D &#92;)</span> (payoff 2 for player 2, from the rolled-up value). Optimal action: <span>&#92;( D &#92;)</span>. Roll up payoff <span>&#92;( (5,2) &#92;)</span> to node <span>&#92;( (A) &#92;)</span>.

**Step 3 — Subgame of length 3 (entire game).** Player 1 chooses between <span>&#92;( A &#92;)</span> (payoff 5 for player 1) and <span>&#92;( B &#92;)</span> (payoff 1 for player 1). Optimal action: <span>&#92;( A &#92;)</span>.

**Unique SPE:** <span>&#92;( (AF,\, DE) &#92;)</span>. Player 1 plays <span>&#92;( A &#92;)</span> at the empty history and <span>&#92;( F &#92;)</span> at <span>&#92;( (A,D) &#92;)</span>; player 2 plays <span>&#92;( D &#92;)</span> after <span>&#92;( (A) &#92;)</span> and <span>&#92;( E &#92;)</span> after <span>&#92;( (B) &#92;)</span>. The terminal history (outcome) generated is <span>&#92;( (A,D,F) &#92;)</span> with payoffs <span>&#92;( (5,2) &#92;)</span>.

It is important to keep the SPE strategy profile distinct from the outcome it generates. The strategy profile <span>&#92;( (AF,\,DE) &#92;)</span> specifies what both players would do in every contingency. The outcome <span>&#92;( (A,D,F) &#92;)</span> is merely the path that actually occurs.

We can also verify this directly. Consider whether <span>&#92;( (AF,\,DE) &#92;)</span> is indeed an SPE by checking each subgame:
- Subgame after <span>&#92;( &#92;emptyset &#92;)</span>: player 1 plays <span>&#92;( A &#92;)</span> and will earn 5 (the absolute maximum payoff available), so no profitable deviation exists.
- Subgame after <span>&#92;( (A) &#92;)</span>: player 2 plays <span>&#92;( D &#92;)</span> and earns 2 versus 1 for playing <span>&#92;( C &#92;)</span>. Optimal.
- Subgame after <span>&#92;( (A,D) &#92;)</span>: player 1 plays <span>&#92;( F &#92;)</span> and earns 5 versus 1 for <span>&#92;( G &#92;)</span> and 4 for <span>&#92;( H &#92;)</span>. Optimal.
- Subgame after <span>&#92;( (B) &#92;)</span>: player 2 has only one action. Trivially optimal.

All four subgames check out, confirming <span>&#92;( (AF,\,DE) &#92;)</span> is an SPE.

### Distinguishing NE from SPE

The strategy profile <span>&#92;( (BF,\,CE) &#92;)</span> is also a Nash equilibrium of this game. We can verify: player 1 plays <span>&#92;( B &#92;)</span> at the start and earns payoff 1 (from terminal history <span>&#92;( (B,E) &#92;)</span>). If player 1 deviates to <span>&#92;( A &#92;)</span>, the path would be <span>&#92;( (A,C) &#92;)</span> (since player 2 is playing <span>&#92;( CE &#92;)</span>, meaning they play <span>&#92;( C &#92;)</span> after <span>&#92;( A &#92;)</span>), yielding payoff 0. So player 1 has no profitable deviation. Player 2 is playing <span>&#92;( C &#92;)</span> after <span>&#92;( A &#92;)</span>, but player 1 never goes to <span>&#92;( A &#92;)</span>, so the choice at that node does not affect player 2's payoff. Player 2 has no profitable deviation either. Hence <span>&#92;( (BF,\,CE) &#92;)</span> is a NE.

But <span>&#92;( (BF,\,CE) &#92;)</span> is **not** an SPE. In the subgame after history <span>&#92;( (A) &#92;)</span>, player 2 moves first and is prescribed to play <span>&#92;( C &#92;)</span>, earning payoff 1. But deviating to <span>&#92;( D &#92;)</span> (given player 1 would subsequently play <span>&#92;( F &#92;)</span>) yields payoff 2. Player 2 has a profitable deviation in this subgame. Therefore <span>&#92;( (BF,\,CE) &#92;)</span> fails the SPE condition — it rests on player 2's implicit "threat" to play <span>&#92;( C &#92;)</span> after <span>&#92;( A &#92;)</span>, which player 2 would never actually carry out.

### Worked Example 2: A Game with Multiple SPE

Consider a game where player 1 moves first and chooses among <span>&#92;( C &#92;)</span>, <span>&#92;( D &#92;)</span>, and <span>&#92;( E &#92;)</span>. Following <span>&#92;( C &#92;)</span> and <span>&#92;( D &#92;)</span>, player 2 makes further choices; following <span>&#92;( E &#92;)</span>, player 2 makes a different choice. Specifically:

- After <span>&#92;( C &#92;)</span>, player 2 chooses between <span>&#92;( F &#92;)</span> (payoffs <span>&#92;( (3,0) &#92;)</span>) and <span>&#92;( G &#92;)</span> (payoffs <span>&#92;( (3,0) &#92;)</span>) — player 2 is indifferent.
- After <span>&#92;( D &#92;)</span>, player 2 chooses between <span>&#92;( H &#92;)</span> (payoffs <span>&#92;( (1,1) &#92;)</span>) and <span>&#92;( I &#92;)</span> (payoffs <span>&#92;( (2,1) &#92;)</span>) — player 2 is again indifferent.
- After <span>&#92;( E &#92;)</span>, player 2 chooses between <span>&#92;( J &#92;)</span> (payoffs <span>&#92;( (2,2) &#92;)</span>) and <span>&#92;( K &#92;)</span> (payoffs <span>&#92;( (1,3) &#92;)</span>) — player 2 strictly prefers <span>&#92;( K &#92;)</span>.

**Step 1.** In the three subgames of length 1, we determine player 2's optimal play. After <span>&#92;( E &#92;)</span>, player 2 strictly prefers <span>&#92;( K &#92;)</span> (payoff 3 > 2), so <span>&#92;( K &#92;)</span> is the unique optimal action there. After <span>&#92;( C &#92;)</span>, player 2 is indifferent between <span>&#92;( F &#92;)</span> and <span>&#92;( G &#92;)</span> (both give payoff 0). After <span>&#92;( D &#92;)</span>, player 2 is indifferent between <span>&#92;( H &#92;)</span> and <span>&#92;( I &#92;)</span> (both give payoff 1).

Since player 2 is indifferent in two of the three length-1 subgames, all four combinations — <span>&#92;( FHK &#92;)</span>, <span>&#92;( FIK &#92;)</span>, <span>&#92;( GHK &#92;)</span>, <span>&#92;( GIK &#92;)</span> — are consistent with an SPE. We must consider each.

**Step 2 — Case (FHK):** Roll up payoffs to player 1's initial node. Player 1 earns 3 from <span>&#92;( C &#92;)</span>, 1 from <span>&#92;( D &#92;)</span>, 1 from <span>&#92;( E &#92;)</span>. Optimal: <span>&#92;( C &#92;)</span>. SPE: <span>&#92;( (C,\,FHK) &#92;)</span>.

**Step 2 — Case (FIK):** Player 1 earns 3 from <span>&#92;( C &#92;)</span>, 2 from <span>&#92;( D &#92;)</span>, 1 from <span>&#92;( E &#92;)</span>. Optimal: <span>&#92;( C &#92;)</span>. SPE: <span>&#92;( (C,\,FIK) &#92;)</span>.

**Step 2 — Case (GIK):** Player 1 earns 3 from <span>&#92;( C &#92;)</span>, 2 from <span>&#92;( D &#92;)</span>, 1 from <span>&#92;( E &#92;)</span>. Wait — after <span>&#92;( C &#92;)</span> with player 2 playing <span>&#92;( G &#92;)</span>, player 1 earns 3; after <span>&#92;( D &#92;)</span> with player 2 playing <span>&#92;( I &#92;)</span>, player 1 earns 2; after <span>&#92;( E &#92;)</span>, player 1 earns 1. Optimal: <span>&#92;( D &#92;)</span>... actually let us re-read: after <span>&#92;( C &#92;)</span> with <span>&#92;( G &#92;)</span>, payoff to player 1 is 3... but wait — let us use the payoffs as given in the slide: after <span>&#92;( C &#92;)</span> the payoffs for <span>&#92;( F &#92;)</span> and <span>&#92;( G &#92;)</span> both give player 1 a payoff of 3 (from the rolled-up value 3,0 and 3,0). After <span>&#92;( D &#92;)</span>, playing <span>&#92;( H &#92;)</span> gives player 1 payoff 1 and playing <span>&#92;( I &#92;)</span> gives player 1 payoff 2. After <span>&#92;( E &#92;)</span>, playing <span>&#92;( K &#92;)</span> gives player 1 payoff 1. For case (GIK): player 1's payoffs are 3 from <span>&#92;( C &#92;)</span>, 2 from <span>&#92;( D &#92;)</span>, 1 from <span>&#92;( E &#92;)</span>. Optimal: <span>&#92;( C &#92;)</span>. But hold on — let us read the slides carefully: for GIK, player 1's payoffs at the top are listed as 1, 0, 1, 1. Actually, looking at slide 47: for case (GIK), after rolling up, player 1's payoffs are 1 from <span>&#92;( C &#92;)</span>, 2 from <span>&#92;( D &#92;)</span>, 1 from <span>&#92;( E &#92;)</span>. (The G action in the C-branch gives player 1 payoff 1, not 3.) So optimal for player 1: <span>&#92;( D &#92;)</span>. SPE: <span>&#92;( (D,\,GIK) &#92;)</span>.

**Step 2 — Case (GHK):** After rolling up: player 1 earns 1 from <span>&#92;( C &#92;)</span>, 1 from <span>&#92;( D &#92;)</span>, 1 from <span>&#92;( E &#92;)</span>. Player 1 is indifferent among all three actions. All are consistent with SPE, giving three more equilibria: <span>&#92;( (C,\,GHK) &#92;)</span>, <span>&#92;( (D,\,GHK) &#92;)</span>, and <span>&#92;( (E,\,GHK) &#92;)</span>.

The game therefore has **six subgame perfect equilibria** in total:

<span>&#92;[ (C,\,FHK),&#92;quad (C,\,FIK),&#92;quad (D,\,GIK),&#92;quad (C,\,GHK),&#92;quad (D,\,GHK),&#92;quad (E,\,GHK) &#92;]</span>

This example illustrates the general rule: whenever backward induction reveals a player indifferent between actions at some node, every combination of those optimal actions — together with the optimal continuations in all other subgames — constitutes a distinct SPE.

---

## Section 5: The One-Deviation Property

A powerful tool for verifying SPE in more complex games (including infinite-horizon games where backward induction cannot be applied directly) is the **one-deviation property**. It states that a strategy profile <span>&#92;( s^* &#92;)</span> is a subgame perfect equilibrium if and only if no player can profitably deviate at any single history while following <span>&#92;( s^* &#92;)</span> everywhere else — including everywhere else in the continuation after that history.

More precisely: <span>&#92;( s^* &#92;)</span> is an SPE if and only if there is no player <span>&#92;( i &#92;)</span> and no history <span>&#92;( h &#92;)</span> after which it is player <span>&#92;( i &#92;)</span>'s turn to move such that player <span>&#92;( i &#92;)</span> can gain by choosing a different action at <span>&#92;( h &#92;)</span> alone — while adhering to <span>&#92;( s^*_i &#92;)</span> at all subsequent histories and while all other players follow <span>&#92;( s^*_{-i} &#92;)</span>.

The value of the one-deviation property is that it reduces the SPE verification problem to a collection of local, one-step deviations. Rather than comparing a player's strategy in a subgame against every possible alternative strategy in that subgame (which can be a vast set), it suffices to check that no single-action deviation is profitable at any individual history. This makes the property particularly useful when strategies must be verified in infinite-horizon settings, where "every alternative strategy" is an uncountably infinite object.

---

## Summary

This chapter extended our toolkit from strategic games to **extensive games**, which capture the sequential structure of decision-making. The four components of an extensive game — players, terminal histories, player function, and preferences — together with the notion of a strategy as a complete contingency plan, provide a precise and flexible model.

The **Nash equilibrium** concept carries over directly via the strategic form: the NE of an extensive game are exactly the NE of its strategic form. However, NE may include equilibria resting on non-credible off-path threats, as the entry game's (Out, Fight) equilibrium demonstrated.

**Subgame perfect equilibrium** refines NE by requiring optimal play in every subgame, not just along the equilibrium path. SPE eliminates equilibria based on empty threats and corresponds to robust steady states in which even occasional mistakes do not destabilise equilibrium behaviour. Every SPE is a NE, but the converse fails.

**Backward induction** provides the practical algorithm for finding SPE in finite-horizon games: solve from the last subgames forward, rolling up optimal payoffs at each stage. When each node has a unique optimal action, backward induction yields a unique SPE. When ties occur, all optimal combinations must be considered, and backward induction finds all SPE. The **one-deviation property** extends SPE verification to settings where backward induction is unavailable.

---

# Chapter 12: Stackelberg Duopoly

## Sequential Quantity Competition

Cournot's model assumes firms set quantities simultaneously. In many markets, one firm commits first — perhaps through public announcements, capacity investments, or simply by being an incumbent. The **Stackelberg model** captures this sequential structure: Firm 1 (the leader) chooses its output first, then Firm 2 (the follower) observes Firm 1's output and responds.

This is the Cournot game played as an extensive game. The player function is <span>&#92;(P(&#92;emptyset) = 1&#92;)</span> and <span>&#92;(P(q_1) = 2&#92;)</span> for all <span>&#92;(q_1 &#92;geq 0&#92;)</span>. Firm 1's strategy is simply an output level <span>&#92;(q_1&#92;)</span>. Firm 2's strategy is a function <span>&#92;(b_2 : &#92;mathbb{R}_+ &#92;to &#92;mathbb{R}_+&#92;)</span> mapping any possible Firm 1 output to Firm 2's response.

The game has a finite horizon; we find the SPE by backward induction.

## Firm 2's Best Response

In the subgame following history <span>&#92;(q_1&#92;)</span>, Firm 2 maximizes its profit:

<span>&#92;[&#92;pi_2(q_1, q_2) = q_2(&#92;alpha - c - q_1 - q_2)&#92;]</span>

This is exactly the Cournot best response problem. The solution is:

<span>&#92;[b_2(q_1) = &#92;frac{1}{2}(&#92;alpha - c - q_1) &#92;quad &#92;text{for } q_1 &#92;leq &#92;alpha - c&#92;]</span>

In any SPE, Firm 2's strategy is this function <span>&#92;(b_2&#92;)</span>.

## Firm 1's Optimal Output

Given that Firm 2 will use strategy <span>&#92;(b_2&#92;)</span>, Firm 1 substitutes to find its own optimal output. Firm 1's effective profit is:

<span>&#92;[&#92;pi_1 = q_1 &#92;cdot (&#92;alpha - c - q_1 - b_2(q_1)) = q_1&#92;left(&#92;alpha - c - q_1 - &#92;frac{&#92;alpha - c - q_1}{2}&#92;right) = &#92;frac{1}{2}q_1(&#92;alpha - c - q_1)&#92;]</span>

Maximizing over <span>&#92;(q_1&#92;)</span>:

<span>&#92;[&#92;frac{d&#92;pi_1}{dq_1} = &#92;frac{1}{2}(&#92;alpha - c - 2q_1) = 0 &#92;implies q_1^* = &#92;frac{1}{2}(&#92;alpha - c)&#92;]</span>

Firm 2 then produces <span>&#92;(q_2^* = b_2(q_1^*) = &#92;frac{1}{4}(&#92;alpha - c)&#92;)</span>.

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
      <td><span>&#92;(&#92;frac{1}{3}(&#92;alpha-c)&#92;)</span></td>
      <td><span>&#92;(&#92;frac{(&#92;alpha-c)^2}{9}&#92;)</span></td>
      <td><span>&#92;(&#92;frac{1}{2}(&#92;alpha-c)&#92;)</span></td>
      <td><span>&#92;(&#92;frac{(&#92;alpha-c)^2}{8}&#92;)</span></td>
    </tr>
    <tr>
      <th>Firm 2 (Follower)</th>
      <td><span>&#92;(&#92;frac{1}{3}(&#92;alpha-c)&#92;)</span></td>
      <td><span>&#92;(&#92;frac{(&#92;alpha-c)^2}{9}&#92;)</span></td>
      <td><span>&#92;(&#92;frac{1}{4}(&#92;alpha-c)&#92;)</span></td>
      <td><span>&#92;(&#92;frac{(&#92;alpha-c)^2}{16}&#92;)</span></td>
    </tr>
  </tbody>
</table>

The leader produces more and earns more; the follower produces less and earns less. This is the **first-mover advantage**. The intuition: by committing to a large quantity, Firm 1 forces Firm 2 into a less favourable position on its best response function. Firm 2, knowing Firm 1's large output, must respond with a smaller quantity. Firm 1 exploits this strategic response.

## Commitment Value

Crucially, in the Stackelberg SPE, Firm 1 is not playing a best response to Firm 2's equilibrium output <span>&#92;(q_2^*&#92;)</span>. The Cournot best response to <span>&#92;(q_2^* = &#92;frac{1}{4}(&#92;alpha-c)&#92;)</span> would call for Firm 1 to produce <span>&#92;(b_1(q_2^*) = &#92;frac{3}{8}(&#92;alpha-c)&#92;)</span>, less than <span>&#92;(q_1^* = &#92;frac{1}{2}(&#92;alpha-c)&#92;)</span>. Why does Firm 1 overproduce? Because it is playing a best response not to Firm 2's equilibrium *output*, but to Firm 2's equilibrium *strategy* <span>&#92;(b_2&#92;)</span>. Firm 1 knows that any increase in its output will cause Firm 2 to reduce its output. The value of moving first comes entirely from the ability to **commit**: Firm 1's output choice in period 1 cannot be revised after Firm 2 responds.

If Firm 1 could freely revise its output after seeing Firm 2's response, the game would collapse to Cournot — the first-stage choice would be irrelevant. The first-mover advantage is generated by *credible commitment*.


---

# Chapter 13: Bargaining

Bargaining — the process by which two or more parties divide a surplus — is ubiquitous in economic life. Bert and Ernie haggling over cookies, a buyer and seller negotiating the price of a car, a business owner and workers dividing revenues, trade representatives hammering out a tariff schedule, streaming services and artists arguing over royalties: in every case there are gains to be had from agreeing, and the question is how those gains are split. Before sitting down at any bargaining table it helps to know what game theory predicts, how much you are likely to get, and whether you can change the structure of the game if you do not like the answer. This chapter develops the theory of bargaining from the ground up, beginning with the starkest possible model and progressively enriching it until we arrive at Rubinstein's landmark infinite-horizon result.

A useful preliminary distinction is between **bargaining** and **negotiations**. Bargaining is about splitting an existing pie — there is a winner and a loser. Negotiations, by contrast, are about making the pie as large as possible and then splitting it, so all parties can win. The two are often confused, and you would be surprised how often what looks like a bargaining problem turns into a negotiation if you get creative.

---

## Section 13.1: The Ultimatum Game

### The Game

Suppose you are in a class and the instructor offers to give away five dollars. You are paired with another student. You decide how much of the five dollars to offer your partner. If they accept, you each keep what was agreed. If they reject the offer, the instructor takes the money back and neither of you receives anything. There are no counteroffers — you make one proposal, your partner says yes or no, and the game is over. Because you can make a single ultimatum and your partner must either accept or walk away empty-handed, this is called the **ultimatum game**.

In more general terms, two players use the following procedure to split an amount <span>&#92;( c &#92;)</span>. Person 1 offers Person 2 an amount <span>&#92;( x &#92;)</span>, where <span>&#92;( 0 &#92;leq x &#92;leq c &#92;)</span>. If Player 2 accepts, Player 1 keeps <span>&#92;( c - x &#92;)</span> and Player 2 keeps <span>&#92;( x &#92;)</span>. If Player 2 rejects, both players receive zero.

Formally this is an extensive game with the following four elements. The **players** are the two people. The **terminal histories** are all sequences of the form <span>&#92;( (x, Z) &#92;)</span>, where <span>&#92;( x &#92;in [0,c] &#92;)</span> and <span>&#92;( Z &#92;in &#92;{Y, N\} &#92;)</span> — that is, any offer followed by either acceptance or rejection. Note that <span>&#92;( x &#92;)</span> is continuous: it need not be a whole number of cents, and this matters for the analysis. The **player function** assigns Player 1 to the empty history (the opening node) and assigns Player 2 to the decision node following any offer <span>&#92;( x &#92;)</span>. The **preferences** are given by monetary payoffs: following the terminal history <span>&#92;( (x, Y) &#92;)</span>, Player 1 receives <span>&#92;( c - x &#92;)</span> and Player 2 receives <span>&#92;( x &#92;)</span>; following any history <span>&#92;( (x, N) &#92;)</span>, both receive zero.

Although the game tree is infinitely wide — there is an infinite number of possible offers — it can be represented with a shaded triangular area from the opening node, with a single representative branch labelled <span>&#92;( x &#92;)</span> indicating that Player 2 faces a binary choice (Y or N) after any offer.

### Solving by Backward Induction

This game has a finite horizon (the longest possible history has length two), so we can apply backward induction. We begin with the **subgames of length one** — the nodes where Player 2 must accept or reject some offer <span>&#92;( x &#92;)</span>.

If Player 2 is offered <span>&#92;( x > 0 &#92;)</span>, accepting yields <span>&#92;( x &#92;)</span> while rejecting yields <span>&#92;( 0 &#92;)</span>. The strictly dominant action is to accept. If Player 2 is offered exactly <span>&#92;( x = 0 &#92;)</span>, she is indifferent: she gets zero whether she accepts or rejects. This indifference means two strategies of Player 2 are consistent with optimality in these length-one subgames: Strategy A — accept all offers including zero; and Strategy B — accept any offer <span>&#92;( x > 0 &#92;)</span> but reject the offer of zero.

Working back to the opening node, we ask what Player 1 would optimally offer under each of these two cases for Player 2.

If Player 2 is using Strategy A (accept everything), Player 1's optimal offer is <span>&#92;( x = 0 &#92;)</span>, keeping the entire pie.

If Player 2 is using Strategy B (reject zero, accept any positive offer), Player 1 faces a problem. She would like to offer the smallest positive amount, but because <span>&#92;( x &#92;)</span> is continuous, no such smallest positive number exists. For any candidate offer <span>&#92;( &#92;epsilon > 0 &#92;)</span>, Player 1 could do better by offering <span>&#92;( &#92;epsilon/2 &#92;)</span>, and then <span>&#92;( &#92;epsilon/4 &#92;)</span>, and so on. Player 1 has no optimal offer under Strategy B, so no subgame perfect equilibrium exists in this case.

The **unique subgame perfect equilibrium** of the ultimatum game is therefore the strategy pair in which Player 1 offers <span>&#92;( 0 &#92;)</span> and Player 2 accepts all offers. The equilibrium payoffs are <span>&#92;( (c, 0) &#92;)</span> — Player 1 keeps the entire pie.

The lesson is stark: whoever can make a credible take-it-or-leave-it offer holds all the bargaining power. This has a direct real-world implication. If you are buying a car, one way to put yourself in the position of the ultimatum-maker is to send a written offer — by email or fax — to multiple dealerships and state that this is your maximum willingness to pay. If they want your business, they can call; otherwise you will go elsewhere. You have, in effect, made an ultimatum.

### Experimental Evidence

Theory predicts that Player 1 should offer zero, or close to it. Laboratory experiments tell a different story.

In practice, offerers typically propose close to a fifty-fifty split, and responders reject low but positive offers at surprisingly high rates. Responders seem willing to sacrifice a payoff in order to punish an offer they perceive as unfair. This behaviour is inconsistent with pure monetary self-interest but consistent with preferences for **fairness** or **reciprocity**, and has made the ultimatum game a central workhorse of behavioural economics. Understanding where rational game theory succeeds and where social preferences cause deviations is one of the central questions in the discipline.

Despite this divergence between theory and experiment, the ultimatum game remains important for two reasons. First, it models take-it-or-leave-it offers that genuinely occur in real life — understanding the logic clarifies the distribution of power. Second, and more important for what follows, it is a **building block** for richer models of bargaining where players can make counteroffers. Every model we study in the rest of this chapter uses the ultimatum game as its foundation.

---

## Section 13.2: The Holdup Problem

### Setup

The ultimatum game teaches us that the ability to make a credible take-it-or-leave-it offer is enormously valuable. This has a disturbing implication when one party must invest *before* the pie is divided.

Consider an ultimatum game that is preceded by a stage in which Player 2 takes an action that affects the size <span>&#92;( c &#92;)</span> of the pie subsequently divided. Player 2 can exert **low effort**, producing a small pie of size <span>&#92;( c_L &#92;)</span>, or **high effort**, producing a large pie of size <span>&#92;( c_H &#92;)</span>. Because effort is costly, Player 2's payoff is <span>&#92;( x - L &#92;)</span> if she chooses low effort and <span>&#92;( x - H &#92;)</span> if she chooses high effort, where <span>&#92;( H > L &#92;)</span> and <span>&#92;( x &#92;)</span> is whatever she receives from Player 1's offer. After Player 2 commits to an effort level, Player 1 observes this choice and then proposes how to divide the resulting pie. Player 2 can then accept or reject exactly as in the ultimatum game.

The game tree branches first on Player 2's effort choice (L or H), then on Player 1's offer (any <span>&#92;( x &#92;)</span> between zero and <span>&#92;( c_L &#92;)</span> or <span>&#92;( c_H &#92;)</span> as appropriate), and finally on Player 2's accept/reject decision. This game is infinitely wide, since Player 1 can make any offer on a continuum, but it has a finite horizon of length three, so backward induction applies.

### Backward Induction

We start at the end. The **subgames of length one** are Player 2's accept/reject decisions following any offer by Player 1. We have already solved this game: these are just ultimatum subgames, and Player 2 has two candidate strategies on each branch — accept all offers, or accept any strictly positive offer and reject zero. Because the effort choice was made on the left branch (low effort) and the right branch (high effort) independently, this gives Player 2 four possible strategy combinations across the two branches.

Moving to the **subgames of length two** — Player 1's offer decisions after observing the effort level — we apply the same logic as in the ultimatum game. If Player 2 is accepting all offers on a given branch, Player 1 optimally offers zero. If Player 2 is rejecting zero on a given branch, Player 1 has no optimal offer (the continuity argument applies). Therefore, the only way to find a subgame perfect equilibrium is for Player 2 to accept all offers on both branches, and for Player 1 to offer zero on both branches.

Knowing this, we now look at the **subgame of length three** — the entire game, including Player 2's initial effort choice. If Player 2 chooses low effort, the continuation gives her a payoff of <span>&#92;( 0 - L = -L &#92;)</span>. If she chooses high effort, the continuation gives her <span>&#92;( 0 - H = -H &#92;)</span>. Since <span>&#92;( H > L &#92;)</span>, Player 2 strictly prefers to choose low effort.

The **unique SPE of the holdup game** is: Player 1 offers zero after both the history L and the history H; Player 2 chooses low effort at the start, and accepts all offers whatever the effort level. The outcome is that Player 2 exerts low effort, Player 1 offers zero, and Player 2 accepts.

### Why This Is Economically Dismal

This result is troubling for two distinct reasons. It is distributively unfair — Player 2 bears all the costs while Player 1 captures all the surplus — but it is also **inefficient**. Even in cases where it would be socially optimal for Player 2 to exert high effort, she will not do so, because she anticipates that once the effort is sunk, Player 1 can extract all the gains. The result holds even when <span>&#92;( c_H &#92;)</span> is vastly larger than <span>&#92;( c_L &#92;)</span> and the cost difference between high and low effort is only a tiny <span>&#92;( &#92;epsilon &#92;)</span>. The economy loses all those gains simply because of the bargaining structure.

Nor does the problem require such an extreme split. Even if the pie is divided fifty-fifty, a player who must invest knowing that half the benefits will accrue to her counterpart may underinvest or not invest at all. The **holdup problem** — the general phenomenon of underinvestment driven by the fear of expropriation after costs are sunk — is one of the most important concepts in economics. It explains reluctance to invest in relationship-specific assets without contractual protection, problems in joint ventures and long-term supplier relationships, and difficulties in employment relationships when workers must acquire firm-specific skills.

### Application: Patent Trolls

One of the most striking real-world examples of holdup involves **patent trolls** — entities that hold patents solely for the purpose of holding up other firms. Patent trolls (formally called **non-practicing entities**) accumulate as many patents as possible, often vaguely worded ones that cast a wide net, but never use those patents to create products. Instead, they wait in the bushes while entrepreneurs invest in developing a product, building a market, and generating revenues. Once those investments are sunk and cannot be taken back, the patent troll steps forward and claims infringement, threatening a court injunction that would force the entrepreneur out of the market entirely.

The parallel with the holdup game is exact. The entrepreneur is Player 2, making an effort investment (product development, marketing, distribution) that creates a large pie. The patent troll is Player 1, making a take-it-or-leave-it ultimatum after the investment has been made: pay a large fraction of the value you have created, or lose the right to operate in this market. The crappier and more vaguely written the patent, the more firms it might plausibly cover, and the more valuable it is to the troll — not for production, but for holdup.

A prominent example involved **NTP Inc.** and **Research In Motion (RIM)**, the maker of the BlackBerry. NTP held a patent on the concept of pushing emails to mobile devices. RIM's BlackBerry did precisely that, and it had become the dominant mobile email device in the United States market after enormous investments in product development, manufacturing, marketing, and distribution. Once all those investments were sunk, NTP filed suit and obtained a threatened injunction that would have forced BlackBerry off the US market until the case was resolved — a process that could have taken years. RIM was held up. Rather than face market exit, they paid a ransom settlement. From the point of view of game theory, it was a classic SPE outcome: anticipating the injunction threat, and with investments already made, paying was rational.

The holdup problem is not merely academic. When advising on the intellectual property chapter of the renegotiated NAFTA agreement, the insight from this analysis mattered directly: even entrepreneurs with genuinely valuable ideas may rationally decline to develop them if they anticipate being held up by a patent troll. The solution — if one exists — typically involves contracting around the holdup problem before investments are made, though this is not always possible.

---

## Section 13.3: Bargaining with Counteroffers and Discounting

### Why Counteroffers Alone Are Not Enough

The ultimatum game is one-sided because Player 2 has no outside option except outright rejection with a payoff of zero. A natural remedy is to allow Player 2 to make a **counteroffer** if she rejects Player 1's proposal, and to allow Player 1 to counteroffer in turn, and so on. Does this produce a more balanced outcome?

Without discounting the answer is no. Consider a two-period game: Player 1 proposes in Period 1; if rejected, Player 2 proposes in Period 2; if that is also rejected, both receive zero. Working backward: in Period 2, Player 2 is in the position of an ultimatum-maker and keeps the whole pie, proposing <span>&#92;( (0, 1) &#92;)</span>. Moving back to Period 1, Player 1 knows that rejecting any offer leads to Player 2 taking everything in Period 2, so Player 1 will accept any non-negative offer. Player 2 therefore prefers to have the game reach Period 2, and Player 1 must offer everything to Player 2 or risk rejection. In any SPE without discounting, the player who makes the last offer keeps the entire pie. Adding more rounds simply shifts this advantage to whoever has the last move. The conclusion is general: regardless of the number of periods, the last proposer gets everything.

### Adding Time Discounting

The key ingredient for a balanced outcome is **time discounting**. Receiving the pie next period is worth less than receiving it today. Formally, Player <span>&#92;( i &#92;)</span> has a **discount factor** <span>&#92;( &#92;delta_i &#92;in (0, 1) &#92;)</span>: she regards obtaining a payoff of 1 after a one-period delay as equivalent to obtaining <span>&#92;( &#92;delta_i &#92;)</span> today. A smaller <span>&#92;( &#92;delta_i &#92;)</span> means greater impatience. We normalise the pie to size 1, so a **proposal** is a pair <span>&#92;( x = (x_1, x_2) &#92;)</span> with <span>&#92;( x_1 + x_2 = 1 &#92;)</span> and <span>&#92;( x_i &#92;geq 0 &#92;)</span>.

**Two periods with discounting.** Player 1 proposes in Period 1; if rejected, Player 2 proposes in Period 2; if rejected again, both get zero, but now Period 2 payoffs are discounted. In Period 2, Player 2 is again the ultimatum-maker and proposes <span>&#92;( y = (0, 1) &#92;)</span>, keeping the whole pie. From the perspective of Period 1, this proposal is worth <span>&#92;( (&#92;delta_1 &#92;cdot 0,\, &#92;delta_2 &#92;cdot 1) = (0, &#92;delta_2) &#92;)</span> to the two players. Player 2 will therefore only accept Player 1's Period-1 offer if she receives at least <span>&#92;( &#92;delta_2 &#92;)</span>. Player 1 optimally offers exactly <span>&#92;( &#92;delta_2 &#92;)</span> to Player 2, keeping <span>&#92;( 1 - &#92;delta_2 &#92;)</span> for herself. The SPE outcome is the proposal <span>&#92;[ x = (1 - &#92;delta_2,\; &#92;delta_2), &#92;]</span> which Player 2 accepts in Period 1. Player 2's impatience — the fact that she discounts the future — is what gives Player 1 a strictly positive payoff. Player 2's threat to reject is only credible if she is offered less than <span>&#92;( &#92;delta_2 &#92;)</span>, so Player 1 never needs to offer more.

**Three periods with discounting.** Now Player 1 proposes in Period 1, Player 2 counter-proposes in Period 2 if rejected, and Player 1 counter-proposes in Period 3 if rejected again. Any subgame starting in Period 2 is a two-period discounted bargaining game with Player 2 as first proposer, which we have just solved. In that subgame, Player 2 offers <span>&#92;( (&#92;delta_1, 1 - &#92;delta_1) &#92;)</span> and Player 1 accepts. From the perspective of Period 1, if Player 1's opening offer is rejected, the continuation payoffs are <span>&#92;( (&#92;delta_1^2,\; &#92;delta_2(1-&#92;delta_1)) &#92;)</span>. Player 2 will accept Player 1's Period-1 offer only if it gives her at least <span>&#92;( &#92;delta_2(1 - &#92;delta_1) &#92;)</span>. Player 1 therefore offers exactly that, keeping <span>&#92;[ x_1 = 1 - &#92;delta_2(1 - &#92;delta_1). &#92;]</span> The three-period SPE outcome is <span>&#92;( x = (1 - &#92;delta_2(1-&#92;delta_1),\; &#92;delta_2(1-&#92;delta_1)) &#92;)</span>.

### The Pattern as Periods Increase

Extending this backward induction to <span>&#92;( n &#92;)</span> periods generates a recursive pattern in Player 2's equilibrium payoff. The table below, reproduced from the slides for the two discount-factor cases <span>&#92;( &#92;delta_1 = &#92;delta_2 = 0.9 &#92;)</span> and <span>&#92;( &#92;delta_1 = &#92;delta_2 = 0.5 &#92;)</span>, illustrates the convergence.

| <span>&#92;( n &#92;)</span> | Player 2 payoff (formula) | <span>&#92;( &#92;delta=0.9 &#92;)</span> | <span>&#92;( &#92;delta=0.5 &#92;)</span> |
|---|---|---|---|
| 1 | <span>&#92;( 0 &#92;)</span> | 0 | 0 |
| 2 | <span>&#92;( &#92;delta_2 &#92;)</span> | 0.9 | 0.5 |
| 3 | <span>&#92;( &#92;delta_2(1-&#92;delta_1) &#92;)</span> | 0.09 | 0.25 |
| 4 | <span>&#92;( &#92;delta_2(1-&#92;delta_1(1-&#92;delta_2)) &#92;)</span> | 0.819 | 0.375 |
| 5 | <span>&#92;( &#92;delta_2(1-&#92;delta_1(1-&#92;delta_2(1-&#92;delta_1))) &#92;)</span> | 0.181 | 0.281 |
| 6 | <span>&#92;( &#92;delta_2(1-&#92;delta_1(1-&#92;delta_2(1-&#92;delta_1(1-&#92;delta_2)))) &#92;)</span> | 0.753 | 0.344 |

Two trends are visible. First, the player who makes the last offer still benefits — Player 2's payoff oscillates depending on whether the final period belongs to her. Second, and crucially, this last-offer advantage **shrinks** as the number of rounds increases. With <span>&#92;( &#92;delta = 0.9 &#92;)</span> the oscillations are wild and slow to converge, while with <span>&#92;( &#92;delta = 0.5 &#92;)</span> they dampen faster. As <span>&#92;( n &#92;to &#92;infty &#92;)</span>, the payoffs converge to a limit that no longer depends on who has the last offer — and that limit is precisely what the infinite-horizon model delivers.

It is also worth asking whether it is realistic to suppose that a bargaining session has a hard deadline. In most real negotiations, if the current round collapses, the parties can simply resume the next day. Removing any artificial deadline is the motivation for moving to the infinite-horizon model.

---

## Section 13.4: Infinite Horizon Bargaining — The Rubinstein Model

### Defining the Game

The **Bargaining Game of Alternating Offers**, developed by Ariel Rubinstein (and textbook author Martin Osborne is co-credited for this strand of work), removes the deadline entirely. The formal extensive game has the following elements.

**Players:** two people, Player 1 and Player 2.

**Terminal histories:** any sequence of the form <span>&#92;( (x^1, N, x^2, N, &#92;ldots, x^t, Y) &#92;)</span> for <span>&#92;( t &#92;geq 1 &#92;)</span>, where each <span>&#92;( x^r = (x^r_1, x^r_2) &#92;)</span> is a division of the pie (two numbers summing to 1), together with the infinite sequence <span>&#92;( (x^1, N, x^2, N, x^3, N, &#92;ldots) &#92;)</span> of perpetual disagreement.

**Player function:** <span>&#92;( P(&#92;emptyset) = 1 &#92;)</span> (Player 1 opens). After the history <span>&#92;( (x^1, N, &#92;ldots, x^t) &#92;)</span>, it is Player 1's turn to respond if <span>&#92;( t &#92;)</span> is even and Player 2's turn if <span>&#92;( t &#92;)</span> is odd. After a rejection appended to such a history, the same assignment determines who makes the next proposal.

**Preferences:** if agreement <span>&#92;( x^t &#92;)</span> is reached in period <span>&#92;( t &#92;)</span>, player <span>&#92;( i &#92;)</span> receives <span>&#92;( &#92;delta_i^{t-1} x_i^t &#92;)</span>, where <span>&#92;( &#92;delta_i &#92;in (0,1) &#92;)</span> is her discount factor. The infinite disagreement history gives both players a payoff of zero, since the discount factors drive any delayed payoff to zero in the limit.

### Why Backward Induction Fails

We cannot apply backward induction here: the game has no finite horizon, no last period from which to work backwards. We also cannot convert to the strategic form and look for Nash equilibria, because each player has infinitely many strategies (specifying an action at each of infinitely many information sets). We are left with what might be called the "half method": make an educated guess about what a subgame perfect equilibrium looks like, and then verify that the guess is correct.

### Stationarity

The key structural feature of this game is that it is **stationary**: every subgame that begins with Player 1 making a proposal is identical to every other such subgame (same players, same terminal histories, same player function, same preferences). The same holds for all subgames beginning with Player 2's proposal, and for all subgames beginning with a response to a given offer. Because the game looks the same every time a player is in the same situation, it is reasonable to conjecture that the SPE involves players using **stationary strategies** — always making the same proposal when it is their turn to propose, and always applying the same acceptance cutoff when it is their turn to respond.

A stationary strategy for Player 1 is therefore specified by two objects: the proposal <span>&#92;( x^* = (x_1^*, x_2^*) &#92;)</span> that she always makes, and the cutoff <span>&#92;( y_1^* &#92;)</span> such that she accepts any offer <span>&#92;( y &#92;)</span> from Player 2 if and only if <span>&#92;( y_1 &#92;geq y_1^* &#92;)</span>. Similarly, Player 2's stationary strategy is specified by the proposal <span>&#92;( y^* = (y_1^*, y_2^*) &#92;)</span> she always makes and the cutoff <span>&#92;( x_2^* &#92;)</span> such that she accepts <span>&#92;( x &#92;)</span> if and only if <span>&#92;( x_2 &#92;geq x_2^* &#92;)</span>.

### Deriving the Equilibrium

From finite-horizon games we know that in every SPE, every proposal is accepted immediately. We conjecture the same holds here, which means the proposer never offers more than the other player's cutoff — offering strictly more would be leaving money on the table. This pins down:

<span>&#92;[ x_2^* = w_2^* &#92;quad &#92;text{and} &#92;quad z_1^* = y_1^*, &#92;]</span>

where <span>&#92;( w_2^* &#92;)</span> is Player 2's acceptance cutoff and <span>&#92;( z_1^* &#92;)</span> is the share Player 2 offers to Player 1. After substituting, we need to find only <span>&#92;( x_1^*, x_2^*, y_1^*, y_2^* &#92;)</span>.

Consider the **subgame starting with Player 2 responding** to Player 1's proposal <span>&#92;( x &#92;)</span>. If Player 2 rejects, her stationary strategy calls for her to propose <span>&#92;( y^* &#92;)</span>, which Player 1 accepts (since what Player 2 offers Player 1 exactly equals Player 1's cutoff <span>&#92;( y_1^* &#92;)</span>). So rejecting yields Player 2 a payoff of <span>&#92;( y_2^* &#92;)</span>, but with a one-period delay, worth <span>&#92;( &#92;delta_2 y_2^* &#92;)</span> today. Player 2 will reject if offered less than <span>&#92;( &#92;delta_2 y_2^* &#92;)</span>. For Player 1 to optimally offer exactly Player 2's cutoff:

<span>&#92;[ x_2^* = &#92;delta_2 y_2^*. &#92;]</span>

By a symmetric argument, considering the **subgame starting with Player 1 responding** to Player 2's proposal, Player 1 will reject if offered less than <span>&#92;( &#92;delta_1 x_1^* &#92;)</span> (the discounted value of what Player 1 gets next period after Player 2 rejects and the game continues with Player 1 proposing). Player 2 therefore offers exactly:

<span>&#92;[ y_1^* = &#92;delta_1 x_1^*. &#92;]</span>

We now have **four equations in four unknowns**:

<span>&#92;[
&#92;begin{aligned}
x_2^* &amp;= &#92;delta_2\, y_2^* &#92;\
y_1^* &amp;= &#92;delta_1\, x_1^* &#92;\
x_1^* + x_2^* &amp;= 1 &#92;\
y_1^* + y_2^* &amp;= 1
&#92;end{aligned}
&#92;]</span>

Solving these simultaneously yields the unique solution:

<span>&#92;[
x_1^* = &#92;frac{1 - &#92;delta_2}{1 - &#92;delta_1&#92;delta_2}, &#92;qquad x_2^* = &#92;frac{&#92;delta_2(1-&#92;delta_1)}{1-&#92;delta_1&#92;delta_2},
&#92;]</span>

and correspondingly:

<span>&#92;[
y_1^* = &#92;frac{&#92;delta_1(1-&#92;delta_2)}{1-&#92;delta_1&#92;delta_2}, &#92;qquad y_2^* = &#92;frac{1 - &#92;delta_1}{1 - &#92;delta_1&#92;delta_2}.
&#92;]</span>

**Proposition 471.3.** *The bargaining game of alternating offers has a unique subgame perfect equilibrium. In it, Player 1 always proposes <span>&#92;( x^* &#92;)</span> and accepts any offer <span>&#92;( y &#92;)</span> such that <span>&#92;( y_1 &#92;geq y_1^* &#92;)</span>; Player 2 always proposes <span>&#92;( y^* &#92;)</span> and accepts any offer <span>&#92;( x &#92;)</span> such that <span>&#92;( x_2 &#92;geq x_2^* &#92;)</span>, where <span>&#92;( x^* &#92;)</span> and <span>&#92;( y^* &#92;)</span> are as given above.*

---

## Section 13.5: The One-Deviation Property and Verification

### The Tool

We arrived at Proposition 471.3 through a series of educated guesses — stationarity, immediate acceptance, exact indifference offers. We now need to verify that the resulting strategy profile <span>&#92;( s^* &#92;)</span> is indeed a subgame perfect equilibrium. The tool for this is the **one-deviation property (ODP)**.

**Definition.** A strategy profile satisfies the one-deviation property if no player can increase her payoff by changing her action at the start of any subgame in which she is the first mover, given the other player's strategies and the rest of her own strategy.

**Propositions 438.1 and 439.2** establish that for extensive games with a finite horizon, or for infinitely repeated games with discounting (which the bargaining game is), a strategy profile is a subgame perfect equilibrium **if and only if** it satisfies the one-deviation property.

This equivalence is enormously useful. Sub-game perfection requires that no player can improve by changing her entire strategy in any subgame — an daunting thing to check directly when strategies are infinite-dimensional. The ODP reduces this to a single check per subgame: can the first mover do better by deviating in just the very first action, keeping everything else fixed?

Why does the ODP imply SPE? The intuition is that any change in a player's strategy can be decomposed into a sequence of single deviations. If none of those single deviations is profitable — which is what the ODP checks — then neither is any combination of them. More precisely: if no profitable single deviation exists at the start of any subgame, it follows by an inductive argument that no profitable multi-step deviation exists either, because each step in a hypothetical multi-step deviation would itself constitute a profitable single deviation somewhere in the game tree.

### A Simple Illustration

Consider a one-player game with three decision nodes, where the strategy <span>&#92;( C&#92;text{-}E&#92;text{-}G &#92;)</span> is shown in red. The terminal payoffs are <span>&#92;( w, x, y, z &#92;)</span> at the four leaves.

For <span>&#92;( C&#92;text{-}E&#92;text{-}G &#92;)</span> to satisfy the ODP, we need three conditions:
- At the start of the game, deviating from C to D (keeping E and G fixed) is not profitable: <span>&#92;( w &#92;geq y &#92;)</span>.
- In the subgame after C, deviating from E to F is not profitable: <span>&#92;( w &#92;geq x &#92;)</span>.
- In the subgame after D, deviating from G to H is not profitable: <span>&#92;( y &#92;geq z &#92;)</span>.

For <span>&#92;( C&#92;text{-}E&#92;text{-}G &#92;)</span> to be a SPE, we additionally need that no multi-step deviation is profitable, including switching to D-F-H (requiring <span>&#92;( w &#92;geq z &#92;)</span>). But the ODP conditions already give us <span>&#92;( w &#92;geq y &#92;)</span> and <span>&#92;( y &#92;geq z &#92;)</span>, which together imply <span>&#92;( w &#92;geq z &#92;)</span>. The single-deviation conditions cascade into multi-deviation conditions — that is why ODP implies SPE.

### Verifying <span>&#92;( s^* &#92;)</span> in the Bargaining Game

The bargaining game has exactly **four types of subgames**, and we must verify the ODP in each.

**Type 1: Player 1 making an offer.** Under <span>&#92;( s^* &#92;)</span>, Player 1 proposes <span>&#92;( x^* &#92;)</span>, Player 2 accepts (since <span>&#92;( x_2^* &#92;)</span> equals Player 2's cutoff), and Player 1 gets <span>&#92;( x_1^* &#92;)</span>. Could Player 1 deviate profitably?

- If Player 1 offers Player 2 *more* than <span>&#92;( x_2^* &#92;)</span>: Player 2 still accepts, but Player 1 receives less than <span>&#92;( x_1^* &#92;)</span>. Not profitable.
- If Player 1 offers Player 2 *less* than <span>&#92;( x_2^* &#92;)</span>: Player 2 rejects (below her cutoff), then proposes <span>&#92;( y^* &#92;)</span> per her strategy, and Player 1 accepts (since <span>&#92;( y_1^* &#92;)</span> equals Player 1's cutoff). Player 1 then receives <span>&#92;( y_1^* &#92;)</span> one period later, worth <span>&#92;( &#92;delta_1 y_1^* &#92;)</span> today. One can verify from the solution equations that <span>&#92;( &#92;delta_1 y_1^* < x_1^* &#92;)</span>. Not profitable.

**Type 2: Player 2 making an offer.** By a symmetric argument, under <span>&#92;( s^* &#92;)</span> Player 2 gets <span>&#92;( y_2^* &#92;)</span>. Offering Player 1 more gives Player 2 less; offering Player 1 less leads Player 1 to reject, propose <span>&#92;( x^* &#92;)</span>, Player 2 accepts, and Player 2 gets <span>&#92;( &#92;delta_2 x_2^* &#92;)</span>, which is less than <span>&#92;( y_2^* &#92;)</span> by the solution equations. Neither deviation is profitable.

**Type 3: Player 1 responding to an offer <span>&#92;( (y_1, y_2) &#92;)</span>.** Under <span>&#92;( s^* &#92;)</span>, Player 1 applies the cutoff <span>&#92;( y_1^* &#92;)</span>. Her payoff is at least <span>&#92;( y_1^* &#92;)</span> under this rule: if she accepts it is because she is getting at least <span>&#92;( y_1^* &#92;)</span>; if she rejects, she proposes <span>&#92;( x^* &#92;)</span> next period, Player 2 accepts, and she gets <span>&#92;( &#92;delta_1 x_1^* = y_1^* &#92;)</span>. Could deviating help?

- If Player 1 *raises* her cutoff and rejects some <span>&#92;( y_1 &#92;geq y_1^* &#92;)</span>: she then proposes <span>&#92;( x^* &#92;)</span>, gets <span>&#92;( &#92;delta_1 x_1^* = y_1^* &#92;)</span>, which is no more than <span>&#92;( y_1 &#92;)</span>. Not profitable (weakly worse).
- If Player 1 *lowers* her cutoff and accepts some <span>&#92;( y_1 < y_1^* &#92;)</span>: she gets less than <span>&#92;( y_1^* &#92;)</span>, which is less than what rejecting would give her. Not profitable.

**Type 4: Player 2 responding to an offer <span>&#92;( (x_1, x_2) &#92;)</span>.** By the same argument with <span>&#92;( x_2^* &#92;)</span> and <span>&#92;( &#92;delta_2 y_2^* = x_2^* &#92;)</span>: raising the cutoff and rejecting some <span>&#92;( x_2 &#92;geq x_2^* &#92;)</span> gives Player 2 at most <span>&#92;( &#92;delta_2 y_2^* = x_2^* &#92;leq x_2 &#92;)</span> (not profitable); accepting some <span>&#92;( x_2 < x_2^* &#92;)</span> gives less than <span>&#92;( x_2^* &#92;)</span> (not profitable).

In all four subgame types, the first mover cannot increase her payoff by a single deviation. The ODP is satisfied. By Propositions 438.1 and 439.2, <span>&#92;( s^* &#92;)</span> is a **subgame perfect equilibrium**. (Proving uniqueness — that no non-stationary SPE exists — is beyond the scope of this course.)

### Properties of the Equilibrium

The SPE <span>&#92;( s^* &#92;)</span> has three notable properties.

**Efficiency.** Player 2 accepts Player 1's very first offer. No delay occurs, no pie is wasted through discounting. This makes sense given perfect information: both players know exactly what the equilibrium outcome will be, so there is no reason to delay and lose value. Perfect information does not always guarantee efficiency (see Exercise 473.2 on constant-cost delay), but it does here.

**Patience is power.** Fix <span>&#92;( &#92;delta_2 &#92;)</span> and increase <span>&#92;( &#92;delta_1 &#92;)</span> toward 1. Looking at the formula for <span>&#92;( x_1^* &#92;)</span>, Player 1's share increases. As <span>&#92;( &#92;delta_1 &#92;to 1 &#92;)</span>, <span>&#92;( x_1^* &#92;to 1 &#92;)</span>: a perfectly patient Player 1 gets the entire pie. The intuition is clear — a player who can wait indefinitely without caring about delay can credibly threaten to hold out forever, forcing the impatient opponent to capitulate. Both players are perfectly informed and recognise this, so agreement is immediate but on terms extremely favourable to the patient player.

**First-mover advantage vanishes with patience.** Suppose both players are equally patient: <span>&#92;( &#92;delta_1 = &#92;delta_2 = &#92;delta &#92;)</span>. Then the only asymmetry is that Player 1 moves first. Substituting into the formula:

<span>&#92;[
x_1^* = &#92;frac{1 - &#92;delta}{1 - &#92;delta^2} = &#92;frac{1 - &#92;delta}{(1-&#92;delta)(1+&#92;delta)} = &#92;frac{1}{1+&#92;delta}.
&#92;]</span>

Since <span>&#92;( &#92;delta < 1 &#92;)</span>, we have <span>&#92;( x_1^* = 1/(1+&#92;delta) > 1/2 &#92;)</span>: Player 1 gets strictly more than half. Player 1's advantage stems entirely from the fact that Player 2 is impatient — Player 2 would rather accept a slightly unfavourable offer today than wait a period to make her own proposal. As <span>&#92;( &#92;delta &#92;to 1 &#92;)</span>, <span>&#92;( x_1^* &#92;to 1/2 &#92;)</span>: the first-mover advantage disappears and the outcome converges to a perfectly equal split. When neither player cares about delay, the only remaining asymmetry — who moves first — becomes irrelevant.

This model, known as the Rubinstein bargaining model, is both theoretically elegant and practically useful. Before entering any bargaining session, the framework tells you how much to expect, which parameters (your own patience, your counterpart's patience, the bargaining protocol) matter, and how to change the game if you do not like the predicted outcome. After this chapter, that analysis should be within your reach.

---

# Chapter 14: Repeated Games

## Why Repetition Matters

The Prisoner's Dilemma predicts mutual defection, yet we observe cooperation everywhere in the world around us. A worker and an employer bargain over wages year after year. Two firms in a duopoly decide on output month after month. Your auto mechanic diagnoses your car every time you bring it in. Classmates collaborate on one joint project after another. In every one of these situations the same parties interact repeatedly, and experience tells us that trust and cooperation can emerge even when a one-shot analysis would predict pure self-interest.

The reason is that repetition changes the strategic landscape in a fundamental way. When players interact more than once, each player can **condition her action at each point in time on the other players' previous actions**. Cooperation can be rewarded with further cooperation; defection can be punished with future defection. A player who is tempted to exploit a partner today must weigh that short-run gain against the long-run cost of triggering retaliatory punishment. If the future matters enough — if the players are sufficiently **patient** — the threat of punishment is credible and powerful enough to sustain cooperation as an equilibrium.

This chapter formalises that intuition through the repeated Prisoner's Dilemma. Along the way we develop the key tools: discounting, the concept of a strategy in an infinitely repeated game, and the Nash Folk Theorem.

---

## Section 14.1: Discounting and the Value of a Payoff Stream

### The Discount Factor

In a repeated game players receive a payoff in each period. A dollar (or a unit of payoff) received today is worth more than one received next period, for two reasons: impatience, and the fact that resources available today can be invested. We capture both by a **discount factor** <span>&#92;( &#92;delta &#92;in (0,1) &#92;)</span>. A payoff of <span>&#92;( v &#92;)</span> received one period from now is worth <span>&#92;( &#92;delta v &#92;)</span> today, a payoff received two periods from now is worth <span>&#92;( &#92;delta^2 v &#92;)</span> today, and so on. The closer <span>&#92;( &#92;delta &#92;)</span> is to 1, the more the player values the future — the more **patient** she is.

### Discounted Sum and Discounted Average

Given a stream of payoffs <span>&#92;( (v_1, v_2, v_3, &#92;ldots) &#92;)</span>, the **discounted sum** is

<span>&#92;[ &#92;sum_{t=1}^{&#92;infty} &#92;delta^{t-1} v_t &#92;]</span>

This is the present value of the entire payoff stream. Because sums grow without bound as the game goes on, it is often more convenient to work with the **discounted average payoff**, defined as the constant per-period payoff that the player would need to receive in order to be indifferent between that constant stream and the original stream. If a player receives the constant value <span>&#92;( c &#92;)</span> in every period, her discounted sum is <span>&#92;( c &#92;sum_{t=0}^{&#92;infty} &#92;delta^t = c/(1-&#92;delta) &#92;)</span>. Setting this equal to the discounted sum of the original stream and solving for <span>&#92;( c &#92;)</span> gives:

<span>&#92;[ &#92;text{Discounted average} = (1-&#92;delta) &#92;sum_{t=0}^{&#92;infty} &#92;delta^t v_{t+1} &#92;]</span>

The factor <span>&#92;( (1-&#92;delta) &#92;)</span> normalises the expression so that a constant stream of value <span>&#92;( v &#92;)</span> in every period has a discounted average of exactly <span>&#92;( v &#92;)</span>. This makes discounted averages directly comparable to one-shot payoffs, which is why they are the natural measure of welfare in repeated games. Throughout this chapter we assume all players share the same discount factor <span>&#92;( &#92;delta &#92;)</span>.

### The Geometric Series Formula

One formula will be used repeatedly. For <span>&#92;( &#92;delta &#92;in (0,1) &#92;)</span>:

<span>&#92;[ &#92;sum_{t=0}^{&#92;infty} &#92;delta^t = &#92;frac{1}{1-&#92;delta} &#92;]</span>

A related formula handles finite sums. For any non-negative integer <span>&#92;( T &#92;)</span>:

<span>&#92;[ &#92;sum_{t=0}^{T} &#92;delta^t = &#92;frac{1 - &#92;delta^{T+1}}{1 - &#92;delta} &#92;]</span>

These two results are workhorses of the analysis that follows.

### Definition of a Repeated Game

Given a **stage game** — a strategic game <span>&#92;( G &#92;)</span> played once — the **repeated game** of <span>&#92;( G &#92;)</span> is an extensive game with perfect information and simultaneous moves. After every non-terminal history, every player simultaneously chooses an action from her set of actions in <span>&#92;( G &#92;)</span>. If the game ends after exactly <span>&#92;( T &#92;)</span> rounds it is a **finitely repeated game**; if it continues forever it is an **infinitely repeated game**. Each player evaluates a terminal history by its discounted average payoff.

---

## Section 14.2: Finitely Repeated Games and the Unravelling of Cooperation

The stage game we focus on throughout this chapter is the Prisoner's Dilemma. Two players each choose either Cooperate (C) or Defect (D) simultaneously. The payoff matrix is:

|  | **C** | **D** |
|---|---|---|
| **C** | 2, 2 | 0, 3 |
| **D** | 3, 0 | 1, 1 |

In the stage game, D is a strictly dominant strategy for both players, so the unique Nash Equilibrium is (D, D) with payoffs (1, 1). Mutual cooperation (C, C) would give both players 2, but neither can unilaterally sustain it.

Now suppose this game is played exactly <span>&#92;( T &#92;)</span> times and both players know <span>&#92;( T &#92;)</span>. We solve for the subgame perfect equilibrium by **backward induction**. In the very last period — period <span>&#92;( T &#92;)</span> — there are no future periods, so the threat of future punishment carries no weight. D is strictly dominant in period <span>&#92;( T &#92;)</span> regardless of history, and both players defect. Now consider period <span>&#92;( T-1 &#92;)</span>. Each player knows that the outcome in period <span>&#92;( T &#92;)</span> will be (D, D) no matter what happens in period <span>&#92;( T-1 &#92;)</span>. Therefore, a player's action in period <span>&#92;( T-1 &#92;)</span> affects only that period's payoff. D is again strictly dominant, and both players defect. The same argument applies to period <span>&#92;( T-2 &#92;)</span>, period <span>&#92;( T-3 &#92;)</span>, and so on all the way back to period 1.

**Result (Unique SPE of Finitely Repeated PD):** The finitely repeated Prisoner's Dilemma has a unique subgame perfect equilibrium in which each player chooses D in every period regardless of history. The equilibrium outcome is (D, D) in every period.

This result extends beyond SPE. One can show that *every* Nash Equilibrium of the finitely repeated Prisoner's Dilemma generates the outcome (D, D) in every period. The argument proceeds by contradiction: suppose some strategy pair generates an outcome path in which at least one player's action differs from D in some period. Let <span>&#92;( t &#92;)</span> be the *last* such period, and suppose without loss of generality that Player 1 plays C in period <span>&#92;( t &#92;)</span>. Player 1 can profitably deviate by switching to D in period <span>&#92;( t &#92;)</span> and playing D in every subsequent period — this raises her payoff in period <span>&#92;( t &#92;)</span> and leaves it unchanged or higher in every period after <span>&#92;( t &#92;)</span> (since the original path had (D, D) from period <span>&#92;( t+1 &#92;)</span> onward, and the deviating strategy also plays D in those periods). Therefore no such strategy pair can be a Nash Equilibrium.

**Unique NE Outcome:** Every Nash Equilibrium of the finitely repeated Prisoner's Dilemma generates the outcome (D, D) in every period.

Our intuition told us that repetition should enable cooperation. For finitely repeated games, theory disappoints that intuition. The trouble is backward induction, anchored by the known final period. To rescue cooperation we need to remove that anchor.

---

## Section 14.3: Infinitely Repeated Games — Why Cooperation Becomes Possible

### The Failure of Backward Induction

When the Prisoner's Dilemma is repeated infinitely — that is, it goes on forever with no predetermined endpoint — backward induction cannot be applied. There is no last period from which to start the unravelling argument. We cannot say "in the very last period both players defect, therefore in the second-to-last period…" because no last period exists.

Moreover, the Nash equilibrium argument for the finitely repeated game also fails. That argument depended on every outcome path having a *last period* in which at least one player plays C — a final moment of cooperation that some player would want to deviate from. In the infinitely repeated game, a strategy pair can generate outcome paths in which C is played in infinitely many periods with no last occurrence. For example, one player might cooperate every third period forever, or both players might cooperate in every single period forever. Without a last C, the profitable deviation argument has no foothold.

This does not yet *prove* that cooperation is achievable; it merely eliminates the argument against it. To find cooperative equilibria we must do the actual work of constructing strategies and verifying that neither player has an incentive to deviate.

### Strategies in the Infinitely Repeated Game

A **strategy** of player <span>&#92;( i &#92;)</span> in the infinitely repeated game of <span>&#92;( G &#92;)</span> specifies an action of player <span>&#92;( i &#92;)</span> after the empty history and for every finite sequence <span>&#92;( (a^1, a^2, &#92;ldots, a^t) &#92;)</span> of outcomes of <span>&#92;( G &#92;)</span>, for every <span>&#92;( t &#92;geq 1 &#92;)</span>. In other words, a strategy is a complete contingent plan: it says what to do in period 1 (no history yet), what to do in period 2 as a function of the four possible outcomes in period 1, what to do in period 3 as a function of the sixteen possible outcomes in periods 1 and 2, and so on indefinitely.

The set of strategies is immense — effectively infinite in size — so we cannot enumerate all Nash Equilibria. Instead, we focus on a small number of natural, easily described strategies and ask whether they form Nash Equilibria that generate cooperative outcomes.

---

## Section 14.4: Three Cooperative Strategies

### The Grim Trigger Strategy

The first strategy is the **grim trigger**:

- Play C after the empty history (in the first period).
- In any subsequent period, play C if the other player has played C in every previous period; play D if the other player has ever played D.

In other words: cooperate as long as there has been mutual cooperation, but the moment the other player defects — even once — switch to D forever. The nickname is apt: once the trigger is pulled, retaliation is permanent. The grim trigger represents the most severe credible punishment available: any deviation triggers an eternal breakdown of cooperation.

### The k-Period Punishment Strategy

The grim trigger is harsh. A less draconian alternative is the **k-period punishment strategy**, denoted <span>&#92;( s^P(k) &#92;)</span>:

- Play C at the start.
- If the other player deviates by playing D, respond by playing D for exactly <span>&#92;( k &#92;)</span> periods, then revert to C regardless of what the other player did during the punishment phase.
- After reverting, continue cooperating until the next deviation, at which point impose another k-period punishment, and so on.

The punishment here is finite and bounded. Think of it as a suspension rather than a lifetime ban: misbehave, serve your k-period suspension, and return to good standing. Crucially, the reversion to C after k periods is unconditional — it does not depend on whether the other player was well-behaved during the punishment.

### Tit-for-Tat

The third strategy is perhaps the most famous in game theory: **tit-for-tat**:

- Play C after the empty history (in the first period).
- In every subsequent period, do whatever the other player did in the immediately preceding period.

Tit-for-tat is a copycat strategy. It starts cooperatively, immediately mirrors defection with defection, and immediately mirrors cooperation with cooperation. It never defects first, retaliates exactly once for each defection, and forgives the moment the other player returns to C.

---

## Section 14.5: Nash Equilibria of the Infinitely Repeated Prisoner's Dilemma

The infinitely repeated Prisoner's Dilemma has infinitely many strategy profiles that are Nash Equilibria. We examine three.

### NE 1: Always Defect

First, consider the strategy pair in which each player plays D after every history regardless. If one player always plays D, the best the other can do is also play D (since cooperating unilaterally yields 0 rather than 1 per period). Therefore the strategy pair in which each player chooses D after every history is a Nash Equilibrium of the infinitely repeated game. This is the dismal equilibrium — the same outcome as in the finitely repeated game. Repetition does not *force* cooperation; it merely makes it *possible*.

### NE 2: Grim Trigger vs. Grim Trigger

**Claim:** If <span>&#92;( &#92;delta &#92;geq &#92;frac{1}{2} &#92;)</span>, the strategy pair in which both players use the grim trigger is a Nash Equilibrium of the infinitely repeated Prisoner's Dilemma.

**Verification:** Suppose Player 1 uses the grim trigger. Consider any period in which cooperation has prevailed up to that point (so Player 1 remains in the cooperative phase). Player 2 has two broad options: keep cooperating, or deviate.

*If Player 2 keeps cooperating*, her payoff stream going forward is <span>&#92;( (2, 2, 2, &#92;ldots) &#92;)</span>, giving a discounted average of 2.

*If Player 2 deviates*, she plays D in the current period, earning 3 (since Player 1 is still playing C). Player 1 then switches to D forever. Player 2's best response to Player 1 playing D forever is to also play D forever (since D dominates C in the stage game). So Player 2's payoff stream from the period of deviation forward is <span>&#92;( (3, 1, 1, 1, &#92;ldots) &#92;)</span>. The discounted average of this stream is:

<span>&#92;[ (1-&#92;delta)(3 + &#92;delta + &#92;delta^2 + &#92;cdots) = (1-&#92;delta)&#92;left(3 + &#92;frac{&#92;delta}{1-&#92;delta}&#92;right) = 3(1-&#92;delta) + &#92;delta &#92;]</span>

Player 2 cannot profitably deviate if and only if the cooperation payoff is at least as large as the defection payoff:

<span>&#92;[ 3(1-&#92;delta) + &#92;delta &#92;leq 2 &#92;]</span>

Expanding: <span>&#92;( 3 - 3&#92;delta + &#92;delta &#92;leq 2 &#92;)</span>, so <span>&#92;( 3 - 2&#92;delta &#92;leq 2 &#92;)</span>, giving:

<span>&#92;[ &#92;delta &#92;geq &#92;frac{1}{2} &#92;]</span>

By symmetry the same condition applies to Player 1. Any strategy that always plays C in response to the grim trigger is a best response (not just grim trigger itself), but grim trigger is one such strategy. Since each player is playing a best response to the other, the grim trigger pair is a Nash Equilibrium when <span>&#92;( &#92;delta &#92;geq &#92;frac{1}{2} &#92;)</span>. The equilibrium outcome is (C, C) in every period — the cooperative outcome we were looking for.

The condition <span>&#92;( &#92;delta &#92;geq &#92;frac{1}{2} &#92;)</span> has a clean interpretation. The gain from deviating is 1 extra unit today (3 instead of 2). The cost is losing 1 unit per period forever after (1 instead of 2). Cooperation is sustainable when players care enough about the future that the permanent loss outweighs the one-time gain.

> **Exercise 429.1** generalises this result to a Prisoner's Dilemma with general payoffs: the mutual cooperation payoff is <span>&#92;( x &#92;)</span>, the temptation payoff is <span>&#92;( y &#92;)</span> (with <span>&#92;( y &gt; x &gt; 1 &gt; 0 &#92;)</span>). Determine the condition on <span>&#92;( &#92;delta &#92;)</span> for grim trigger vs. grim trigger to be a Nash Equilibrium.

### NE 3: k-Period Punishment vs. k-Period Punishment

Now consider whether the strategy pair in which both players use <span>&#92;( s^P(k) &#92;)</span> can be a Nash Equilibrium.

Suppose Player 1 uses <span>&#92;( s^P(k) &#92;)</span>. If Player 2 also uses <span>&#92;( s^P(k) &#92;)</span>, the outcome is (C, C) every period (since neither player has a reason to defect first). Any profitable deviation for Player 2 must therefore involve playing D in at least one period. Let <span>&#92;( t &#92;)</span> be the *first* period in which Player 2 plays D.

What happens? Player 1 punishes by playing D from period <span>&#92;( t+1 &#92;)</span> through period <span>&#92;( t+k &#92;)</span>, then reverts to C in period <span>&#92;( t+k+1 &#92;)</span> regardless of Player 2's behaviour during the punishment. During periods <span>&#92;( t+1 &#92;)</span> through <span>&#92;( t+k &#92;)</span>, Player 2 is being punished (Player 1 plays D). Player 2 should play D during her own punishment — playing C there yields 0 rather than 1, a worse outcome, and it does not shorten the punishment (which is unconditional). In period <span>&#92;( t+k+1 &#92;)</span>, Player 1 returns to C and the whole situation repeats from scratch.

The only relevant comparison is over the <span>&#92;( k+1 &#92;)</span> periods from <span>&#92;( t &#92;)</span> through <span>&#92;( t+k &#92;)</span>. If Player 2 deviates and plays D throughout these periods, her discounted average payoff over this window is:

<span>&#92;[ (1-&#92;delta)(3 + &#92;delta + &#92;delta^2 + &#92;cdots + &#92;delta^k) = 3(1-&#92;delta) + &#92;delta(1-&#92;delta^k) &#92;]</span>

If instead Player 2 cooperates throughout (sticking to <span>&#92;( s^P(k) &#92;)</span> and playing C every period), her discounted average payoff over these same <span>&#92;( k+1 &#92;)</span> periods is:

<span>&#92;[ (1-&#92;delta)(2 + 2&#92;delta + 2&#92;delta^2 + &#92;cdots + 2&#92;delta^k) = 2(1-&#92;delta^{k+1}) &#92;]</span>

The strategy <span>&#92;( s^P(k) &#92;)</span> is a best response to itself if and only if the cooperation payoff is at least as large as the deviation payoff:

<span>&#92;[ 3(1-&#92;delta) + &#92;delta(1-&#92;delta^k) &#92;leq 2(1-&#92;delta^{k+1}) &#92;]</span>

After algebraic simplification this reduces to:

<span>&#92;[ &#92;delta^{k+1} - 2&#92;delta + 1 &#92;leq 0 &#92;]</span>

Consider the cases:

- **<span>&#92;( k = 1 &#92;)</span>:** The condition becomes <span>&#92;( &#92;delta^2 - 2&#92;delta + 1 &#92;leq 0 &#92;)</span>, i.e. <span>&#92;( (&#92;delta-1)^2 &#92;leq 0 &#92;)</span>. Since <span>&#92;( (&#92;delta-1)^2 &#92;geq 0 &#92;)</span> always, the only solution is <span>&#92;( &#92;delta = 1 &#92;)</span> — which is ruled out by assumption. **A one-period punishment is never sufficient to deter deviation, no matter how patient the players are.**

- **<span>&#92;( k = 2 &#92;)</span>:** Solving <span>&#92;( &#92;delta^3 - 2&#92;delta + 1 &#92;leq 0 &#92;)</span> yields <span>&#92;( &#92;delta &#92;geq 0.62 &#92;)</span> (approximately). A two-period punishment can sustain cooperation if the players are sufficiently patient.

- **<span>&#92;( k = 3 &#92;)</span>:** The required cutoff falls to <span>&#92;( &#92;delta &#92;geq 0.55 &#92;)</span> (approximately).

- **<span>&#92;( k &#92;to &#92;infty &#92;)</span>:** As <span>&#92;( k &#92;)</span> grows, the required discount factor approaches <span>&#92;( &#92;delta &#92;geq &#92;frac{1}{2} &#92;)</span>. This is exactly what we found for the grim trigger, which is simply the limit of the k-period punishment as <span>&#92;( k &#92;to &#92;infty &#92;)</span>.

**Result:** The strategy pair in which each player uses <span>&#92;( s^P(k) &#92;)</span> is a Nash Equilibrium of the infinitely repeated Prisoner's Dilemma as long as <span>&#92;( k &#92;geq 2 &#92;)</span> and <span>&#92;( &#92;delta &#92;)</span> is large enough. The longer the punishment, the lower the patience required. Short punishments can only sustain cooperation among very patient players.

> **Exercise 430.1** asks you to generalise this analysis to the Prisoner's Dilemma with payoffs <span>&#92;( x &#92;)</span> and <span>&#92;( y &#92;)</span>.

### NE 4: Tit-for-Tat vs. Tit-for-Tat

**Claim:** If <span>&#92;( &#92;delta &#92;geq &#92;frac{1}{2} &#92;)</span>, the strategy pair in which both players use tit-for-tat is a Nash Equilibrium of the infinitely repeated Prisoner's Dilemma.

**Verification:** Suppose Player 1 uses tit-for-tat. If Player 2 also uses tit-for-tat, the outcome is (C, C) every period, and Player 2's discounted average payoff is 2. Any profitable deviation must involve Player 2 playing D in at least one period. Let <span>&#92;( t &#92;)</span> be the first such period.

After Player 2 defects in period <span>&#92;( t &#92;)</span>, Player 1 (using tit-for-tat) plays D in period <span>&#92;( t+1 &#92;)</span>. In period <span>&#92;( t+1 &#92;)</span> Player 2 faces a choice that determines the shape of all future play:

1. **Player 2 reverts to C in period <span>&#92;( t+1 &#92;)</span>.** Player 1 then plays C in period <span>&#92;( t+2 &#92;)</span> (copying Player 2's C in period <span>&#92;( t+1 &#92;)</span>), and the game resets to the same situation as the beginning. Player 2 can defect again in period <span>&#92;( t+2 &#92;)</span>, perpetuating the alternating pattern D, C, D, C, ... The payoff stream from period <span>&#92;( t &#92;)</span> onward is then <span>&#92;( (3, 0, 3, 0, &#92;ldots) &#92;)</span> — defect and earn 3 in odd periods (when Player 1 is still cooperating), earn 0 in even periods (when Player 1 is retaliating).

2. **Player 2 continues to play D in period <span>&#92;( t+1 &#92;)</span>.** Player 1 then plays D in period <span>&#92;( t+2 &#92;)</span>, and by the same logic both players end up playing D forever. Player 2's payoff stream from period <span>&#92;( t &#92;)</span> onward is <span>&#92;( (3, 1, 1, 1, &#92;ldots) &#92;)</span>.

These are the two extreme deviations; any mixture of them is also possible, but if neither extreme is a profitable deviation, neither is any mixture.

**Alternating (D, C, D, C, ...) deviation:** The discounted average of <span>&#92;( (3, 0, 3, 0, &#92;ldots) &#92;)</span> is:

<span>&#92;[ (1-&#92;delta) &#92;cdot &#92;frac{3}{1-&#92;delta^2} = &#92;frac{3(1-&#92;delta)}{(1-&#92;delta)(1+&#92;delta)} = &#92;frac{3}{1+&#92;delta} &#92;]</span>

(Here we used the fact that <span>&#92;( &#92;sum_{t=0}^{&#92;infty} &#92;delta^{2t} = 1/(1-&#92;delta^2) &#92;)</span>.)

**Always D deviation:** The discounted average of <span>&#92;( (3, 1, 1, 1, &#92;ldots) &#92;)</span> is:

<span>&#92;[ (1-&#92;delta)&#92;left(3 + &#92;frac{&#92;delta}{1-&#92;delta}&#92;right) = 3(1-&#92;delta) + &#92;delta = 3 - 2&#92;delta &#92;]</span>

For tit-for-tat to be a best response to tit-for-tat, neither deviation must be profitable:

<span>&#92;[ 2 &#92;geq &#92;frac{3}{1+&#92;delta} &#92;quad &#92;text{and} &#92;quad 2 &#92;geq 3 - 2&#92;delta &#92;]</span>

Both conditions simplify to <span>&#92;( &#92;delta &#92;geq &#92;frac{1}{2} &#92;)</span>. (If the two conditions had given different cutoffs, the binding constraint would be the more demanding one.)

**Result:** The strategy pair in which each player uses tit-for-tat is a Nash Equilibrium of the infinitely repeated Prisoner's Dilemma as long as <span>&#92;( &#92;delta &#92;geq &#92;frac{1}{2} &#92;)</span>.

We have now found several Nash Equilibria that produce the cooperative outcome (C, C) in every period. What it took was removing the finite horizon. Once we allow the game to go on indefinitely — or equivalently, once players face uncertainty about when the game ends — the threat of future punishment becomes a credible and effective enforcer of cooperation.

> **A note on interpretation.** An infinitely repeated game is not the only way to reach these results. Suppose the game ends after each period with probability <span>&#92;( 1-p &#92;)</span>, and with probability <span>&#92;( p &#92;)</span> it continues for another period. A player with per-period discount factor <span>&#92;( &#92;delta_0 &#92;)</span> now effectively discounts the future by <span>&#92;( &#92;delta = p &#92;delta_0 &#92;)</span>, since future payoffs are both discounted and stochastic. The mathematics is identical to the infinitely repeated game with discount factor <span>&#92;( &#92;delta &#92;)</span>. In the classroom Prisoner's Dilemma experiment run alongside this course, each period ended with 10% probability, making it equivalent to an infinitely repeated game with <span>&#92;( &#92;delta = 0.9 &#92;)</span>.

---

## Section 14.6: The Folk Theorem — How Many Payoffs Can Be Sustained?

### Feasible Payoff Pairs

Up to now, every Nash Equilibrium we constructed has generated either (D, D) every period — discounted average payoffs of (1, 1) — or (C, C) every period — discounted average payoffs of (2, 2). Are these the only possibilities? The Folk Theorem says no: when players are sufficiently patient, almost any pair of individually rational payoffs can be sustained as a Nash Equilibrium of the infinitely repeated game.

The set of **feasible payoff pairs** consists of all pairs <span>&#92;( (x_1, x_2) &#92;)</span> that can be generated by some (possibly correlated or randomised) choice of action profiles in the stage game. In the Prisoner's Dilemma with payoffs (C,C)→(2,2), (C,D)→(0,3), (D,C)→(3,0), (D,D)→(1,1), the feasible set is the convex hull of these four points — a quadrilateral with vertices at (2,2), (0,3), (3,0), and (1,1).

The individual rationality constraint is that each player must receive at least what she can guarantee herself regardless of the other's play, which in the Prisoner's Dilemma is the payoff from always defecting: <span>&#92;( u_i(D,D) = 1 &#92;)</span> for each player <span>&#92;( i &#92;)</span>. The set of **individually rational feasible payoffs** is the portion of the feasible set lying strictly above 1 for each player.

### The Nash Folk Theorem

**Nash Folk Theorem:** Let <span>&#92;( G &#92;)</span> be a Prisoner's Dilemma. Then:

1. The discounted average payoff of each player in any Nash Equilibrium of the infinitely repeated game is at least <span>&#92;( u_i(D,D) &#92;)</span>.

2. Let <span>&#92;( (x_1, x_2) &#92;)</span> be a feasible pair of payoffs in <span>&#92;( G &#92;)</span> for which <span>&#92;( x_i > u_i(D,D) &#92;)</span> for each player <span>&#92;( i &#92;)</span>. For <span>&#92;( &#92;delta &#92;)</span> sufficiently close to 1, the infinitely repeated game of <span>&#92;( G &#92;)</span> has a Nash Equilibrium in which the discounted average payoffs are <span>&#92;( (x_1, x_2) &#92;)</span>.

Part 1 says that Nash Equilibrium payoffs must be individually rational — no player will accept less than their minmax payoff. Part 2 says that every individually rational feasible payoff pair can be achieved. Together they characterise *exactly* which payoff pairs are achievable as Nash Equilibrium discounted average payoffs when players are sufficiently patient.

The theorem is called the Folk Theorem because the result was known informally among game theorists long before it was formally proved — it was "folk knowledge."

### Implementing an Asymmetric Payoff: The Example of (6/4, 9/4)

To make the Folk Theorem concrete, consider the payoff pair <span>&#92;( (6/4,\, 9/4) &#92;)</span>. This lies strictly above (1, 1) for both players and within the feasible set. Player 1's payoff is below 2, while Player 2's payoff is above 2 — the pair is asymmetric. Can it be implemented as a Nash Equilibrium outcome?

Yes. The target payoffs can be achieved as a mix of (C, C) — generating (2, 2) — and (C, D) — generating (0, 3). If we repeat the cycle (C, D), (C, C), (C, C), (C, C) indefinitely (one period of (C, D) for every three periods of (C, C)), the long-run average approaches <span>&#92;( (6/4, 9/4) &#92;)</span>. When <span>&#92;( &#92;delta &#92;)</span> is close to 1, the discounted average payoffs are close to these long-run averages.

To implement this as a Nash Equilibrium, we use a modified grim trigger:

- **Player 1's strategy:** Play C so long as Player 2 has been repeatedly playing the cycle (D, C, C, C); switch to playing D forever after any deviation by Player 2.
- **Player 2's strategy:** Repeatedly play the cycle (D, C, C, C) so long as Player 1 has always played C; switch to playing D forever after any period in which Player 1 does not play C.

Each player's strategy threatens permanent defection if the other deviates from the prescribed path. When <span>&#92;( &#92;delta &#92;)</span> is close to 1, the loss from triggering the punishment phase outweighs any short-run gain from deviating, so neither player has an incentive to deviate. The asymmetric payoff pair <span>&#92;( (6/4, 9/4) &#92;)</span> is thereby sustained as a Nash Equilibrium discounted average.

The Folk Theorem is a powerful and somewhat unsettling result. It shows that patience alone is sufficient to sustain a vast array of outcomes — including asymmetric ones that favour one player over the other. Repeated interaction does not converge on a unique cooperative outcome; it opens an enormous landscape of equilibria. Knowing what *can* be sustained tells us much less than we might hope about what *will* be sustained in practice.

---

## Section 14.7: Axelrod's Tournaments — Cooperation in Practice

Theory tells us which strategies can sustain cooperation. But which strategies actually *perform well* when real people (or real programs) compete against a variety of opponents? Robert Axelrod answered this question empirically through a pair of famous computer tournaments.

### The First Tournament

In the late 1970s, Axelrod invited economists, psychologists, mathematicians, and sociologists to submit computer programs representing strategies for a **finitely repeated Prisoner's Dilemma** played over 200 rounds. He received 14 entries. Each strategy was pitted against every other strategy (and against itself) in a round-robin format. The question was simple: which strategy would earn the highest total payoff summed across all matchups?

The puzzle is that standard theory predicts mutual defection in every period of a finitely repeated game. Yet Axelrod found that the winning strategy — submitted by psychologist Anatol Rapoport of the University of Toronto — was none other than **tit-for-tat**: cooperate in round 1, then copy the opponent's previous action in every subsequent round. Among the top eight strategies in the first tournament, all eight were "nice" (they never defected first); all six of the bottom strategies were not.

### The Second Tournament

Axelrod published the results of the first tournament and invited a second round of submissions, this time informing all participants exactly which strategies had competed and how each had performed. Sixty-two strategies were submitted — a much larger and more sophisticated field, with entrants aware of tit-for-tat's prior success and strategising to exploit or outcompete it.

Tit-for-tat, submitted again by Rapoport, won the second tournament as well.

<div class="embed-container"><iframe src="https://www.youtube.com/embed/BOvAbjfJ0x0?rel=0" frameborder="0" allowfullscreen></iframe></div>

*The evolution of cooperation: Axelrod's tournaments and the success of tit-for-tat.*

### What Made Tit-for-Tat Successful?

Axelrod synthesised the lessons of his tournaments into a set of properties shared by the strategies that performed well:

**Nice** — Cooperate first; never be the first to defect. Tit-for-tat never starts a fight. This earns high payoffs against other nice strategies, which make up the majority of well-performing opponents.

**Provocable** — Immediately retaliate when the opponent defects. Tit-for-tat does not allow exploitation; a single defection is answered with a defection in the very next period. This deters would-be exploiters.

**Forgiving** — Return to cooperation as soon as the opponent does. Unlike the grim trigger, tit-for-tat does not hold a grudge indefinitely. The moment the opponent cooperates, tit-for-tat cooperates too, avoiding the trap of extended mutual punishment.

**Not envious** — Care only about your own payoff, not your payoff relative to your opponent's. Tit-for-tat never beats its opponent in any given matchup — at best it ties. Players who try to do *better* than their partner often end up provoking retaliation that hurts both.

**Not too clever** — Simple, transparent strategies outperform deceptive or complex ones. Opponents quickly learn how tit-for-tat works, which makes cooperation easy to establish and maintain. Elaborate strategies that attempt to exploit others tend to trigger punishment and miscoordination.

The success of tit-for-tat in a finite-horizon tournament is not predicted by the standard backward induction argument. But in a world of diverse opponents — some cooperative, some exploitative, some erring randomly — a reciprocal, forgiving, transparent strategy turns out to be the best overall performer. The Axelrod results have influenced thinking in evolutionary biology (the emergence of reciprocal altruism), political science (international cooperation), and economics (the design of institutions to foster collaboration).

---

## Course Takeaways

This course has traced a path through the major frameworks of non-cooperative game theory, connecting formal models to the world of real strategic decisions.

**Strategic games** provided the foundation: simultaneous interaction, Nash Equilibrium, best-response functions, and the logic of dominance. The applications — Cournot quantity competition, Bertrand price competition, electoral competition, and auctions — showed how the same framework can illuminate very different economic settings.

**Mixed strategy equilibria** extended the analysis to probabilistic play. When no pure-strategy Nash Equilibrium exists, players randomise in a way that makes opponents indifferent between their own options. The examples of expert diagnosis, penalty kicks in soccer, and the decision to report a crime illustrated how mixed strategies capture the unpredictability of real strategic interaction.

**Extensive games** introduced sequential interaction and the refinement of subgame perfect equilibrium via backward induction. Sequential rationality — requiring that strategies be optimal not just overall but at every decision node — disciplines the set of predictions and rules out threats that are not credible. The Stackelberg duopoly, the ultimatum game, the hold-up problem, and the Rubinstein alternating-offers bargaining model all turn on the logic of backward induction and the value of commitment.

**Repeated games** showed how cooperation can emerge from self-interest when interactions are ongoing and players are patient. Backward induction destroys cooperation in finitely repeated games with a unique stage-game equilibrium. But in infinitely repeated games, the grim trigger, k-period punishments, and tit-for-tat can all sustain the cooperative outcome (C, C) when the discount factor exceeds <span>&#92;( &#92;frac{1}{2} &#92;)</span>. The Folk Theorem tells us that patience makes almost any individually rational payoff achievable in equilibrium — the landscape of possible outcomes is vast. And Axelrod's tournaments remind us that in the messy, multi-opponent world of real interaction, simple reciprocal strategies like tit-for-tat outperform cleverness and exploitation.

The final lesson: in repeated interaction, the winning formula is not cunning or aggression. It is being **nice**, **responsive**, **forgiving**, and **not envious**. In the real world you will face strategic choices at every turn. Game theory gives you the tools to analyse them clearly. But its deepest lesson may be this — forget the pure theory when it tells you to defect, and instead trust others, cooperate, and forgive.
