---
title: "ECON 443: Political Economy"
prof: "Jean Guillaume Forand"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Osborne, Martin J. *Models in Political Economy*. Available free online at the author's website (economics.utoronto.ca/osborne/). (Graduate-level reference; course treatment is at undergraduate level.)

**Supplementary texts** — Persson, Torsten and Guido Tabellini. *Political Economics: Explaining Economic Policy*. MIT Press, 2000; Mueller, Dennis. *Public Choice III*. Cambridge University Press, 2003; Acemoglu, Daron and James Robinson. *Economic Origins of Dictatorship and Democracy*. Cambridge University Press, 2006; Downs, Anthony. *An Economic Theory of Democracy*. Harper & Row, 1957; Olson, Mancur. *The Logic of Collective Action*. Harvard University Press, 1965; Buchanan, James M. and Gordon Tullock. *The Calculus of Consent*. University of Michigan Press, 1962.

**Key papers** — May (1952), "A Set of Independent Necessary and Sufficient Conditions for Simple Majority Decision"; Downs (1957) median voter model; Hotelling (1929) spatial model; Barro (1973) and Ferejohn (1986) on electoral accountability; Besley and Case (1995) on yardstick competition; Acemoglu and Robinson (2000) on democratization; Grossman and Helpman (1994) on protection for sale; Olson (1965) on collective action.

**Online resources** — MIT OCW 17.200 (Political Economy); Nolan McCarty lecture notes (Princeton); NBER working papers on political economy; Quarterly Journal of Economics and American Economic Review for empirical political economy literature.

---

# Chapter 1: Collective Decision-Making and the Theory of Majority Rule

## 1.1 The Problem of Social Choice

Economics begins with individual preferences and asks how markets aggregate them into prices and quantities. Political economy begins with a more unsettling question: how should a society aggregate individual preferences into collective decisions? This is the domain of **social choice theory**, and the answers are surprisingly troubling.

A **social welfare function** maps profiles of individual preference orderings into a social preference ordering. Arrow's **Impossibility Theorem** (1951) showed that any social welfare function satisfying four apparently reasonable conditions — **unrestricted domain** (applies to all preference profiles), **Pareto efficiency** (if everyone prefers \( x \) to \( y \), society does too), **independence of irrelevant alternatives** (social ranking of \( x \) vs. \( y \) depends only on individual rankings of \( x \) vs. \( y \)), and **non-dictatorship** (no single individual's preferences always determine the social preference) — cannot produce a consistent (transitive) social ordering for all preference profiles.

Arrow's theorem demonstrates that there is no perfect democratic aggregation rule. Every mechanism either restricts the domain of preferences it handles, violates Pareto efficiency, makes social comparisons between \( x \) and \( y \) depend on a third alternative \( z \) (independence failure), or concentrates decision-making power in a single individual (dictatorship).

## 1.2 May's Theorem and the Justification of Majority Rule

Despite Arrow's pessimism, **May's theorem** (1952) provides a positive justification for **simple majority rule** in the special case of a binary choice (between exactly two alternatives).

<div class="theorem">
<strong>May's Theorem:</strong> A voting rule over two alternatives satisfies the following four conditions if and only if it is simple majority rule:
<ol>
<li><strong>Decisiveness:</strong> The rule selects a winner (or tie) for any configuration of votes.</li>
<li><strong>Anonymity:</strong> The outcome depends only on the profile of votes, not on which individual cast which vote.</li>
<li><strong>Neutrality:</strong> The alternatives are treated symmetrically — if the labels of the alternatives are switched, the winning alternative switches accordingly.</li>
<li><strong>Positive responsiveness:</strong> If the outcome is a tie and one voter switches from "oppose" to "support," the alternative passes.</li>
</ol>
</div>

May's theorem provides an axiomatic foundation for majority rule among two options. The conditions are normatively appealing: anonymity says votes are equal, neutrality says neither alternative has built-in institutional advantage, and positive responsiveness says more support is better. Simple majority rule uniquely satisfies all four.

The limitation is the binary restriction. When there are three or more alternatives, simple majority rule can produce **cycles** (Condorcet cycles): a majority prefers \( A \) to \( B \), a majority prefers \( B \) to \( C \), but a majority also prefers \( C \) to \( A \). No alternative is a Condorcet winner (preferred by a majority to every other alternative), and the social ranking is intransitive.

---

# Chapter 2: The Median Voter Theorem

## 2.1 The Spatial Model of Politics

The **spatial model of politics** imagines policy as a point in some policy space (typically one-dimensional — a line from left to right) and represents voter preferences as single-peaked preferences over this space. Each voter has an ideal point (bliss point) and prefers policies closer to their ideal to policies farther away.

<div class="definition">
<strong>Single-Peaked Preferences:</strong> Voter \( i \) has single-peaked preferences over policy \( x \in \mathbb{R} \) if there exists a unique ideal point \( x_i^* \) such that \( i \)'s utility \( u_i(x) \) is increasing for \( x < x_i^* \) and decreasing for \( x > x_i^* \). Equivalently, for \( y < z \leq x_i^* \), voter \( i \) prefers \( z \) to \( y \); for \( x_i^* \leq z < y \), voter \( i \) prefers \( z \) to \( y \).
</div>

Single-peakedness rules out the cyclical preferences that generate Condorcet paradoxes. The key result is:

<div class="theorem">
<strong>Median Voter Theorem (Black, 1948):</strong> If all voters have single-peaked preferences over a one-dimensional policy space, then the preference of the <strong>median voter</strong> — the voter whose ideal point is such that at least half of all voters have ideal points at or to the left and at least half at or to the right — is a Condorcet winner. That is, the median ideal point defeats any other policy in a pairwise majority vote.
</div>

<div class="proof">
<strong>Proof sketch.</strong> Let \( m \) denote the median voter's ideal point and let \( y \neq m \) be any other policy. Without loss of generality, say \( y < m \). By definition of the median, at least half the voters have ideal points \( \geq m > y \). All such voters, having ideal points at or to the right of \( m \), prefer \( m \) to \( y \) (by single-peakedness, moving from \( y \) toward their ideal point is an improvement). So a majority prefers \( m \) to \( y \). Since \( y \) was arbitrary, \( m \) is the Condorcet winner. \( \square \)
</div>

## 2.2 Downsian Electoral Competition

Anthony Downs's *An Economic Theory of Democracy* (1957) applied the median voter logic to electoral competition between two office-seeking political parties. The central result — often called the **Downs convergence theorem** — is that both parties converge to the median voter's ideal point in equilibrium.

**Setup:** Two parties, Left (L) and Right (R), simultaneously announce policy platforms \( x_L, x_R \in [0,1] \) (normalized policy space). Each party seeks to maximize its vote share (or probability of winning). Voters are uniformly distributed over \( [0,1] \) with ideal points equal to their position. Voters vote for the party whose platform is closest to their ideal point; ties are broken randomly.

**Equilibrium:** Both parties announce \( x_L^* = x_R^* = 1/2 \) (the median voter's position). Any deviation by one party toward an extreme loses it votes to the center. The Nash equilibrium is full convergence.

<div class="remark">
<strong>Limitations of Downs convergence:</strong> The model predicts policy convergence that is rarely observed empirically. Extensions that generate policy divergence include: (1) parties that have policy preferences themselves (not purely office-seeking); (2) uncertainty about voter preferences, combined with risk-averse parties that position away from extremes; (3) multi-dimensional policy spaces (where no Condorcet winner typically exists); (4) primaries that force candidates to appeal to ideologically extreme bases; (5) voter abstention models where turnout depends on ideological proximity to candidates.
</div>

## 2.3 Hotelling's Model and the "Principle of Minimum Differentiation"

Harold Hotelling (1929) originally formulated the spatial model for product differentiation, not politics. Two firms choose locations on a unit interval of consumers uniformly distributed; each consumer buys from the closer firm. Hotelling found that both firms cluster at the center — the **principle of minimum differentiation**. This model maps directly onto Downs's electoral model and explains its convergence result.

Hotelling's model also has a normatively interesting implication: the equilibrium locations (both at the center) are not socially efficient — the efficient solution would locate the firms at the first and third quartile points, minimizing total travel distance. Social efficiency and competitive equilibrium diverge.

---

# Chapter 3: Electoral Accountability and Selection

## 3.1 The Principal-Agent Problem in Politics

Democratic elections are often analyzed through the lens of the **principal-agent problem**: voters (principal) delegate policy-making authority to politicians (agent), but voters cannot perfectly observe what politicians do or what type they are. The information asymmetry creates two distinct problems:

1. **Moral hazard (accountability):** Even a good politician, once elected, may shirk effort or pursue personal gain. Elections serve as a mechanism to discipline incumbent behavior.
2. **Adverse selection (selection/screening):** Politicians vary in competence, integrity, and policy preferences. Elections serve to select high-quality politicians and screen out low-quality ones.

## 3.2 The Barro-Ferejohn Model of Electoral Accountability

The classic model of electoral accountability follows Barro (1973) and Ferejohn (1986). Voters face a stream of overlapping-generations incumbents; each incumbent chooses how much to **appropriate** (capture as private rents) versus deliver as public goods.

**Setup (simplified two-period version):** An incumbent serves for one period and may be re-elected for a second (final) period. Let \( r \) be the rents extracted by the incumbent, constrained by the government's budget \( R \): public goods provision is \( R - r \). Voters observe public goods provision but not the budget \( R \) (so they cannot distinguish a bad incumbent from an unlucky one). Voters adopt a **threshold rule**: re-elect if public goods \( \geq \bar{g} \), otherwise vote the incumbent out.

**Incumbent's trade-off:** In the first period, extracting more rents \( r \) increases immediate payoff but risks losing re-election and the second-period rents. The equilibrium rent level \( r^*(\bar{g}) \) balances current extraction against the re-election prize.

**Key results:**
- Higher second-period rents make re-election more valuable, inducing better first-period behavior — the value of office disciplines incumbents.
- Perfect electoral accountability requires voters to be able to observe and verify incumbents' actions — information is critical.
- If voters cannot distinguish performance from luck, accountability is imperfect.

## 3.3 Electoral Screening and Adverse Selection

The **screening** or **selection** rationale for elections emphasizes that elections should identify and retain competent, honest politicians. In a **signaling model**, incumbent politicians can demonstrate their quality through observable policy choices; voters update their beliefs about politician quality and re-elect high-quality signals.

**Besley and Case (1995) — yardstick competition:** Voters in one jurisdiction can use the performance of neighboring jurisdictions as a **yardstick** to evaluate their own government. If common shocks (recessions, droughts) affect all jurisdictions simultaneously, a governor who performs poorly relative to neighboring governors is likely bad, not merely unlucky. This comparative information improves voter inference and thus electoral accountability.

---

# Chapter 4: Collective Action and Interest Group Politics

## 4.1 Olson's Logic of Collective Action

**Mancur Olson**'s *The Logic of Collective Action* (1965) challenged the naive view that groups with common interests will naturally organize to pursue those interests. Olson argued that this view ignores the **free-rider problem**: a collective good (clean air, a favorable trade policy) that benefits all members of a group will be under-provided, because each individual has an incentive to let others bear the cost of provision.

**Setup:** Consider a group of \( n \) members each with utility \( u(G) - c \) if they contribute to a public good (providing benefit \( G \) and incurring cost \( c \)) or \( u(G) \) if they free-ride (getting benefit \( G \) without paying). In Nash equilibrium, the public good is under-provided relative to the Pareto optimum because each individual ignores the benefit their contribution provides to others — the standard **positive externality** problem.

**Olson's key insight:** Large groups face more severe collective action problems than small groups:
- In a large group, each individual's contribution has a negligible effect on total provision, so the individual incentive to contribute is minimal.
- In a small group, each individual's contribution is a significant fraction of total provision; the individual cannot plausibly free-ride because their absence would substantially reduce the public good.

**Selective incentives:** Olson argued that large groups can overcome free-riding only through **selective incentives** — private benefits provided only to members who contribute (e.g., union membership giving access to benefit programs, professional associations offering services only to dues-paying members). Pure reliance on collective goods is insufficient.

**Implication for policy:** Special interests (small, concentrated groups) are better organized than large, diffuse groups. A small number of firms in an industry can organize an effective lobby; the millions of consumers who pay slightly higher prices due to protectionist policies cannot. This asymmetry explains why political outcomes systematically favor concentrated interests at the expense of the general public.

## 4.2 Public Choice Theory: Buchanan and Tullock

**James Buchanan** (1919–2013) and **Gordon Tullock** (1922–2014) founded the **public choice** school, which applies economic methods and assumptions to the analysis of political decision-making. The fundamental premise: politicians, bureaucrats, and voters are self-interested agents pursuing their own objectives, not benevolent social planners seeking to maximize social welfare.

**Constitutional economics:** Buchanan's central contribution was to distinguish two levels of political decision-making. **Constitutional choice** is the selection of rules for making collective decisions — the choice of voting rules, property rights, and constitutional constraints. **Postconstitutional choice** is decision-making within those rules. Buchanan argued that welfare analysis of policy should occur at the constitutional level — evaluating whether the rules are ones that all citizens would consent to behind a "veil of uncertainty" about their future positions (Buchanan's version of Rawls's veil of ignorance).

## 4.3 Rent-Seeking

**Rent-seeking** (a term coined by Anne Krueger, 1974, building on Tullock's earlier work) refers to the use of resources to compete for transfers from the political system rather than to create new wealth. A monopolist, for example, will spend up to the present value of monopoly profits lobbying for monopoly protection — this expenditure is socially wasteful, as it does not produce any goods or services but merely redistributes wealth from consumers to the monopolist.

**Tullock's model:** Suppose \( n \) firms compete for a rent of value \( V \). Firm \( i \) spends \( r_i \) on lobbying; the probability of winning the rent is \( r_i / \sum_j r_j \). In Nash equilibrium, each firm spends \( r^* = V(n-1)/n^2 \) and total lobbying expenditure is \( (n-1)V/n \). As \( n \to \infty \), total rent dissipation approaches \( V \) — the entire value of the rent is consumed in lobbying.

The social cost of rent-seeking extends beyond the direct lobbying expenditure: it includes the distortionary policy that creates the rent in the first place, the resources devoted to maintaining and expanding the political apparatus that distributes rents, and the talent diverted from productive activity to political manipulation.

## 4.4 Grossman-Helpman: Protection for Sale

**Grossman and Helpman**'s "Protection for Sale" (1994) provides the canonical formal model of special interest politics. Organized interest groups offer the government a **contribution schedule** \( C_i(t) \) that specifies how much they will contribute as a function of the trade policy vector \( t \) (tariffs and subsidies). The government selects \( t \) to maximize a weighted sum of aggregate welfare and total contributions.

The equilibrium characterization: for any organized sector \( i \), the equilibrium tariff satisfies:

\[
\frac{t_i}{1 + t_i} = \frac{a_i - \alpha_L}{e_i \alpha_L} \cdot \frac{X_i}{M_i}
\]

where \( a_i \) is an indicator of whether the sector is organized, \( \alpha_L \) is the weight on aggregate welfare in the government's objective, \( e_i \) is the import demand elasticity, \( X_i \) is domestic production, and \( M_i \) is imports. Organized sectors receive protection while unorganized sectors may face negative effective protection. Empirical tests (Goldberg and Maggi 1999, Gawande and Bandyopadhyay 2000) find support for the model's predictions.

---

# Chapter 5: The Politics of Redistribution

## 5.1 The Meltzer-Richard Model

The **Meltzer-Richard model** (1981) generates a simple positive prediction about the size of government in a democracy: redistribution will increase with income inequality.

**Setup:** Voters have heterogeneous incomes. The government levies a flat tax rate \( \tau \) on all income \( y_i \) and redistributes the revenue as a lump-sum transfer \( T \) to all citizens. The government's budget constraint gives \( T = \tau \bar{y} - D(\tau) \) where \( \bar{y} \) is mean income and \( D(\tau) \) captures deadweight loss (distortionary cost of taxation, increasing in \( \tau \)).

Each voter has ideal tax rate \( \tau_i^* \) that maximizes their net benefit \( T + (1-\tau)y_i = \tau(\bar{y} - y_i) - D(\tau) \). For voters with \( y_i < \bar{y} \) (below-mean income), the benefit from redistribution (\( \bar{y} - y_i \)) exceeds the cost, so they prefer positive taxation. For \( y_i > \bar{y} \), the opposite holds. Since voter preferences are single-peaked in \( \tau \), the **median voter's ideal tax rate** is the equilibrium outcome.

Since income distributions are typically right-skewed (mean exceeds median), the **median voter has below-median income**. As inequality rises (mean rises relative to median), the median voter's preferred tax rate rises: higher taxes and more redistribution are the democratic equilibrium.

**Empirical tension:** The model predicts that more unequal countries should have larger governments — but the cross-national evidence is mixed. The United States, the most unequal major rich country, has smaller government than the more equal Scandinavian countries. Extensions to explain this contradiction include: probabilistic voting models, differences in social insurance (vs. redistribution), institutional constraints (constitutions, federalism), and the role of racial or ethnic heterogeneity in reducing support for redistribution.

## 5.2 Political Constraints on Redistribution: The Acemoglu-Robinson Framework

Acemoglu and Robinson (2000, 2001, 2006) embed the politics of redistribution in a dynamic model of democratization and political change. Their framework addresses a fundamental question: why do elites ever concede democracy, given that democracy leads to redistribution away from them?

**Two-period setup (simplified):** Society consists of a rich elite (fraction \( 1-\delta \)) and poor majority (fraction \( \delta \)). In period 1, the elite hold political power and choose a tax rate. In period 2, the poor may revolt if not given sufficient concessions.

The **commitment problem** is central: the elite cannot credibly commit to maintaining redistribution in the future, since once the threat of revolution recedes, they would prefer to reverse policy. Extending the franchise — creating democracy — is one mechanism for committing to continued redistribution, since the poor will then hold political power permanently.

Democratization occurs when:
- The cost of revolution to the poor is low (revolution is cheap)
- Inequality is sufficiently high (the gain from redistribution is large)
- The elite cannot credibly promise temporary redistribution

The model generates a non-monotonic relationship between inequality and democratization: at very low inequality, the poor do not threaten revolution; at very high inequality, the elite prefer coups or repression to redistribution; democratization occurs at intermediate levels.

---

# Chapter 6: Models of Bureaucracy and Non-Democratic Policy-Making

## 6.1 The Bureaucracy Problem

**William Niskanen**'s model of budget-maximizing bureaucracy (1971) applied public choice logic to the administrative state. Bureaucrats, like other agents, pursue their private interests — and in bureaucratic organizations, prestige, power, and income are positively correlated with budget size. Bureaucrats therefore seek to maximize their agency's budget, subject to the constraint that the legislature approves appropriations.

**Setup:** A bureaucrat produces a public good at cost \( C(Q) \) and requests a total budget \( B \) from the legislature. The legislature knows the social value \( V(Q) \) but not the production cost. The bureaucrat exploits this information advantage to extract a budget \( B^* > C(Q^*)_{efficient} \), producing beyond the socially optimal quantity — **over-provision** of public goods relative to the social optimum.

The model predicts that public sector agencies will be bloated and inefficient — a prediction that resonated with the critique of "big government" in the 1970s and 1980s. Critics noted that the model assumed monopoly provision; adding competition between agencies or privatization could mitigate over-provision.

## 6.2 Non-Democratic Policy-Making

Political economy extends beyond democratic contexts. Even autocratic rulers face political constraints — they depend on the support of a winning coalition of elites, military officers, and other power-holders. **Bueno de Mesquita et al.**'s "selectorate theory" (*The Logic of Political Survival*, 2003) models the ruler's incentive to distribute private goods to a small winning coalition versus public goods to the broader population.

The key variable is the **size of the winning coalition** relative to the **selectorate** (the set of people who have a formal role in choosing leaders). In democracies with large winning coalitions, rulers must distribute broadly — public goods and policies benefiting large majorities are the equilibrium. In autocracies with small winning coalitions, rulers concentrate private benefits on a few key supporters. This generates the empirical pattern that democracies provide more public goods (education, health, infrastructure) while autocracies provide more private goods to elites.

---

# Chapter 7: Electoral Institutions and Political Economy

## 7.1 Majoritarian vs. Proportional Representation

Electoral systems shape the incentives of politicians and parties, with systematic consequences for policy outcomes. A large literature compares **majoritarian** (plurality or majority rule in single-member districts) with **proportional representation** (PR) systems.

**Persson and Tabellini (2000, 2003)** find systematic empirical differences: PR countries tend to have larger welfare states, more universal social programs, and lower levels of targeted transfers to swing districts. Majoritarian systems create stronger incentives for geographically targeted spending (constituency service, pork-barrel) while PR creates incentives for broad programmatic policies.

**Milesi-Ferretti, Perotti, and Rostagno (2002)** demonstrate that majoritarian systems generate more targeted transfers and less spending on broad social insurance programs — a finding consistent with the theoretical prediction that single-member-district elections create incentives to concentrate benefits on pivotal constituencies.

## 7.2 Federalism and Fiscal Competition

**Fiscal federalism** raises distinct political economy questions about the optimal assignment of taxing and spending powers across levels of government. The Tiebout model (1956) suggests that competition among local jurisdictions for mobile residents can discipline local governments: residents "vote with their feet," choosing jurisdictions that offer their preferred tax-service bundle. This creates a competitive market for public goods provision.

**Tax competition** has a less benign implication: competition among jurisdictions for mobile capital may drive tax rates on capital below the socially optimal level — a "race to the bottom." Each jurisdiction, fearing capital flight, restrains capital taxation; the equilibrium has all jurisdictions offering low taxes on capital, with potentially inadequate public goods provision.

**Political business cycles** arise when incumbents manipulate fiscal policy to maximize their re-election probability. **Nordhaus (1975)** modeled a simple electoral cycle: in the period before an election, incumbents expand fiscal policy to boost output and employment; after the election, they allow the inflationary consequences to materialize (which can then be blamed on their predecessors). Empirical evidence for this model is mixed — it requires voters to be myopic, which conflicts with rational expectations.

---

# Chapter 8: Empirical Political Economy

## 8.1 Identification Challenges

Empirical political economy faces severe **identification** challenges. Political institutions and economic outcomes are jointly determined — countries with better institutions also have higher incomes, but causality could run in either direction, or both could be driven by a third factor (geography, culture, history).

The most influential solution has been the use of **instrumental variables** (IV) that affect political institutions through a plausible channel unrelated to other determinants of economic outcomes. Acemoglu, Johnson, and Robinson (2001) use **settler mortality** (the death rate of European colonizers in different territories) as an instrument for the quality of institutions: in places where colonizers faced high mortality (tropical Africa, tropical Asia), they established extractive institutions rather than settler colonies; these extractive institutions persisted after independence. The IV estimates show a large, robust, positive effect of good institutions on per capita income.

## 8.2 Natural Experiments in Political Economy

Natural experiments exploit **exogenous variation** in political institutions or policies to identify causal effects. Examples include:

- **Redistricting:** Randomly assigned changes in district boundaries affect which incumbent politicians face competitive elections, allowing identification of the effect of electoral competition on legislative behavior.
- **Close elections:** Regression discontinuity designs that compare outcomes in districts barely won or barely lost by incumbents (or their party) can identify the causal effect of party control of office on policy outcomes. Lee, Moretti, and Butler (2004) find that US House incumbents shift their roll-call voting toward their party's median position when elected — evidence for ideological policy positions rather than pure Downsian convergence.
- **Lottery-assigned constitutions:** Some historical episodes involved elements of randomization in the adoption of institutions — these provide natural experiments for studying the long-run effects of institutional design.

## 8.3 The Political Economy of Trade Policy

The application of political economy to trade policy illustrates the empirical research program. Standard welfare economics predicts that free trade maximizes aggregate welfare; yet most countries maintain substantial trade barriers. The political economy explanation emphasizes the asymmetry between concentrated producer interests and diffuse consumer interests (Olson's collective action logic).

**Trefler (2004)** — directly relevant to the Canadian economic context — estimated the effects of the Canada-US Free Trade Agreement (1988). Using a difference-in-differences strategy that compares industries that experienced large tariff cuts with those that experienced small cuts, Trefler found that the industries most exposed to Canadian tariff cuts suffered significant employment losses in the short run (8–15% contraction), while the industries most exposed to US tariff reductions (i.e., obtaining improved access to the US market) gained substantially in labor productivity (up to 14% over a decade). The aggregate welfare gains were positive but the distributional consequences were severe for import-competing industries.

This empirical work illustrates a general political economy lesson: trade liberalization creates winners and losers. Even when aggregate gains exceed aggregate losses, the losers face large concentrated costs while the winners gain diffusely. The political pressure against liberalization reflects rational behavior by concentrated interest groups, not irrational protectionism.
