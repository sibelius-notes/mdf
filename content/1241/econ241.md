---
title: "ECON 241: Introduction to Public Economics"
prof: "Corey Van de Waal"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Rosen, Harvey S., Jean-François Wen, and Tracy Snodden. *Public Finance in Canada*, 5th Canadian edition. McGraw-Hill Ryerson, 2012.

**Supplementary texts** — Stiglitz, Joseph E. *Economics of the Public Sector*, 3rd ed. W.W. Norton, 2000. Gruber, Jonathan. *Public Finance and Public Policy*, 5th ed. Worth Publishers, 2016.

**Online resources** — MIT OpenCourseWare 14.41 (Public Finance and Public Policy); MIT OCW 14.471 (Public Economics I); CBO and Department of Finance Canada working papers; Statistics Canada public use microdata files.

---

# Chapter 1: Welfare Economics and the Role of Government

## Section 1.1: Consumer and Producer Surplus

Before asking *when* government should intervene in markets, we need a common unit of account for welfare. The standard tools are consumer surplus (CS) and producer surplus (PS).

<div class="definition">
<strong>Consumer Surplus:</strong> The aggregate difference between willingness-to-pay (the demand curve) and the market price actually paid. Geometrically, it is the area below the demand curve and above the equilibrium price. For a linear demand <em>P = a − bQ</em>, consumer surplus at equilibrium price <em>P*</em> equals <em>(a − P*)²/(2b)</em>.
</div>

<div class="definition">
<strong>Producer Surplus:</strong> The aggregate difference between the market price received and the minimum price suppliers require (the supply curve). It equals the area above the supply curve and below the equilibrium price.
</div>

**Total Welfare (Social Surplus)** is the sum \( W = CS + PS \). A competitive market maximises total welfare at the intersection of supply and demand — any quantity below or above the equilibrium creates a **deadweight loss (DWL)**, a triangle of foregone surplus.

The welfare loss from a price ceiling set below equilibrium \( P^* \) equals

\[ DWL = \frac{1}{2} \left( P^* - P_{ceil} \right) \left( Q^* - Q_{ceil} \right) \]

This provides the baseline for evaluating taxes and subsidies: any policy that drives a wedge between buyer price and seller price generates a deadweight loss whose size depends on the elasticities of supply and demand.

## Section 1.2: Consumer Theory Foundations

Public economics relies on a well-specified model of individual choice. A consumer maximises utility \( U(x_1, x_2) \) subject to a budget constraint \( p_1 x_1 + p_2 x_2 = m \).

The optimum satisfies the tangency condition

\[ \frac{MU_1}{MU_2} = \frac{p_1}{p_2} \]

which equates the marginal rate of substitution (MRS) to the price ratio.

<div class="definition">
<strong>Weak Axiom of Revealed Preference (WARP):</strong> If bundle <em>A</em> is chosen when bundle <em>B</em> is affordable, then <em>B</em> must not be chosen when <em>A</em> is affordable. WARP is the testable, choice-theoretic foundation for demand theory — it is equivalent to the downward slope of compensated (Hicksian) demand.
</div>

### 1.2.1 Indifference Curves and Budget Constraints

An indifference curve traces all bundles \( (x_1, x_2) \) yielding a fixed utility level \( \bar{U} \). Key properties: downward-sloping (more is preferred to less), convex to the origin (diminishing MRS), and non-intersecting.

A budget constraint shifts outward with rising income \( m \) and rotates when a relative price changes. The tax system operates precisely through these rotations and shifts.

### 1.2.2 Welfare Measures: Equivalent and Compensating Variation

When a government policy changes prices, two money-metric welfare measures are standard:

<div class="definition">
<strong>Compensating Variation (CV):</strong> The income transfer (positive or negative) that, <em>after</em> the price change, returns the consumer to the original utility level. It answers: how much must the government compensate the consumer for the price change to leave them indifferent to the policy?
</div>

<div class="definition">
<strong>Equivalent Variation (EV):</strong> The income transfer that, <em>before</em> the price change, makes the consumer indifferent to the price change occurring. It values the policy using pre-change prices.
</div>

Both CV and EV avoid the index-number problems of consumer surplus, and are the preferred tools in cost-benefit analysis of public programs.

---

# Chapter 2: General Equilibrium and Social Welfare

## Section 2.1: Walrasian Equilibrium

In a pure exchange economy with two goods and two consumers, equilibrium requires all markets to clear simultaneously. The **Walrasian auctioneer** adjusts prices until excess demand is zero in every market. By Walras's Law, if \( n - 1 \) markets clear, the \( n \)-th must too, so only relative prices matter.

## Section 2.2: Pareto Efficiency

<div class="definition">
<strong>Pareto Efficiency:</strong> An allocation is Pareto efficient if there is no feasible reallocation that makes at least one person better off without making anyone worse off. In an Edgeworth box, Pareto-efficient allocations form the <em>contract curve</em>, where the two consumers' indifference curves are tangent and their MRS values are equal.
</div>

The **Edgeworth Box** provides a powerful diagram: the horizontal axis is total endowment of good 1, the vertical axis is total endowment of good 2, and the two consumers' origins sit at opposite corners. Feasible allocations are interior points; the lens between initial endowments and the contract curve represents mutually beneficial trades.

## Section 2.3: The Fundamental Theorems of Welfare Economics

<div class="theorem">
<strong>First Fundamental Theorem:</strong> Under standard conditions (convexity, no externalities, no public goods, complete markets), every competitive equilibrium is Pareto efficient.
</div>

<div class="theorem">
<strong>Second Fundamental Theorem:</strong> Every Pareto-efficient allocation can be achieved as a competitive equilibrium following an appropriate lump-sum redistribution of endowments.
</div>

The First Theorem justifies a presumption in favour of markets. The Second Theorem tells us that equity and efficiency can be separated in principle — but in practice lump-sum transfers are unobservable and distortionary taxes are necessary. This tension between equity and efficiency is the central theme of public finance.

## Section 2.4: Social Welfare Functions

A **Social Welfare Function (SWF)** \( W = W(U_1, U_2, \dots, U_n) \) aggregates individual utilities into a social ranking. Common forms:

| Type | Formula | Ethical Content |
|---|---|---|
| Utilitarian (Bentham) | \( W = \sum_i U_i \) | maximise the sum of utilities; risk-neutral |
| Weighted utilitarian | \( W = \sum_i \alpha_i U_i \) | distributional weights reflect social priorities |
| Rawlsian (maximin) | \( W = \min_i U_i \) | maximise the welfare of the worst-off person |
| Nash | \( W = \prod_i U_i \) | percentage gains matter equally |

The choice of SWF determines the optimal redistribution policy. A pure Rawlsian government taxes heavily and redistributes to those at the bottom; a utilitarian government cares about marginal utility of income and may accept inequality if it raises total output.

---

# Chapter 3: Market Failures and the Rationale for Government Intervention

## Section 3.1: Taxonomy of Market Failures

The First Welfare Theorem breaks down in four canonical cases: (1) public goods, (2) externalities, (3) information asymmetries, and (4) market power. Government intervention can, in principle, restore or approximate efficiency in each case.

## Section 3.2: Public Goods

<div class="definition">
<strong>Public Good:</strong> A good that is simultaneously <em>non-rival</em> (one person's consumption does not reduce what is available to others) and <em>non-excludable</em> (it is impossible or prohibitively costly to prevent non-payers from consuming it).
</div>

Classic examples: national defence, lighthouses, public health surveillance, fireworks displays. Because exclusion is impossible, private markets under-provide public goods — the **free-rider problem** means individuals conceal their true valuation to avoid paying.

### 3.2.1 Samuelson Condition for Public Goods

The efficient provision of a public good requires that the sum of marginal benefits across all consumers equal the marginal cost of provision:

\[ \sum_{i=1}^{n} MRS_i^{G,x} = MRT^{G,x} \]

where \( MRS_i^{G,x} \) is the rate at which consumer \( i \) is willing to substitute the public good \( G \) for the private numeraire \( x \), and \( MRT \) is the economy's transformation rate. This contrasts with the private-good condition, which requires each individual's MRS to equal MRT.

The intuition: because all consumers simultaneously consume the same unit of the public good, we *add* their marginal valuations vertically rather than horizontally.

### 3.2.2 Voluntary Provision and Underprovision

If \( n \) consumers each have utility \( U_i = u_i(x_i, G) \) where \( G = \sum_j g_j \) is total provision, the Nash equilibrium has consumer \( i \) choose \( g_i \) to maximise utility taking others' contributions as given. At the Nash equilibrium,

\[ \frac{\partial u_i / \partial G}{\partial u_i / \partial x_i} = p_G \]

Each consumer sets their own MRS equal to the price, ignoring others' valuations. The equilibrium level of \( G \) is inefficiently low. The degree of underprovision rises with the size of the population and the degree of non-rivalry.

## Section 3.3: Externalities

<div class="definition">
<strong>Externality:</strong> A cost or benefit imposed on a third party that is not reflected in market prices. A <em>negative externality</em> causes the social cost to exceed the private cost; a <em>positive externality</em> causes the social benefit to exceed the private benefit.
</div>

The welfare loss from a negative production externality is shown by the divergence between the marginal private cost (MPC) and marginal social cost (MSC):

\[ MSC = MPC + MEC \]

where MEC is the marginal external cost. The competitive equilibrium output \( Q_m \) exceeds the socially optimal output \( Q^* \), generating a deadweight loss.

### 3.3.1 Pigouvian Tax

A Pigouvian tax equal to the marginal external damage at the optimum corrects the externality by internalising the social cost:

\[ t^* = MEC(Q^*) \]

The tax drives the market price up by \( t^* \), reducing output to \( Q^* \). Unlike a quantity standard (regulation), the Pigouvian tax is cost-effective: abatement occurs among those with the lowest abatement cost.

### 3.3.2 Coase Theorem and Private Solutions

<div class="theorem">
<strong>Coase Theorem:</strong> If property rights are well-defined and transaction costs are zero, private bargaining between the affected parties will achieve an efficient outcome regardless of the initial assignment of property rights. The distribution of income will differ depending on who holds the rights, but the allocation of resources will be the same.
</div>

The Coase Theorem identifies when government intervention is unnecessary — and by implication, when high transaction costs, poorly defined rights, or large numbers of parties make private bargaining fail and government intervention is warranted.

### 3.3.3 Institutional Constraints and the Theory of Second Best

In the presence of pre-existing distortions (e.g., a monopoly in the polluting industry), the first-best Pigouvian tax is no longer optimal. The **Theory of Second Best** (Lipsey and Lancaster, 1956) warns that piecemeal policy improvements can reduce welfare when other distortions persist. Optimal policy in a second-best world must account for the interaction of multiple market failures.

## Section 3.4: Information Asymmetry

<div class="definition">
<strong>Adverse Selection:</strong> A form of information asymmetry where one party to a transaction has private information about their type before contracting. In insurance markets, high-risk individuals are more willing to buy coverage; at a pooling price, low-risk individuals may exit, unravelling the market (Akerlof's lemons model).
</div>

<div class="definition">
<strong>Moral Hazard:</strong> A change in behaviour that occurs after an agent is insured or otherwise protected from the consequences of their actions. Health insurance that fully covers medical costs reduces the incentive to avoid illness or to economise on care.
</div>

Government-mandated insurance (e.g., Employment Insurance, universal health care) can solve adverse selection by forcing pooling across risk types. The key trade-off is between the efficiency gain from broader risk pooling and the moral hazard inefficiency from reduced incentives.

---

# Chapter 4: Taxation — Principles and Efficiency

## Section 4.1: Tax Incidence

<div class="definition">
<strong>Statutory Incidence:</strong> Who is legally obligated to remit the tax to the government.
</div>

<div class="definition">
<strong>Economic Incidence:</strong> Who ultimately bears the burden of a tax through changes in equilibrium prices and quantities.
</div>

The distinction is crucial for policy: a payroll tax levied on employers may be borne entirely by workers through lower wages if labour supply is inelastic. The incidence depends solely on relative elasticities, not on who writes the cheque to the government.

### 4.1.1 Incidence in Competitive Markets

For a per-unit tax \( t \) on a good with demand elasticity \( \varepsilon_D < 0 \) and supply elasticity \( \varepsilon_S > 0 \):

\[ \frac{dP_B}{dt} = \frac{\varepsilon_S}{\varepsilon_S - \varepsilon_D} \]

\[ \frac{dP_S}{dt} = \frac{\varepsilon_D}{\varepsilon_S - \varepsilon_D} \]

where \( P_B \) is the buyer price and \( P_S \) is the seller price. When demand is perfectly inelastic (\( \varepsilon_D = 0 \)), the buyer bears the entire tax. When supply is perfectly inelastic (\( \varepsilon_S = 0 \)), the seller bears it fully.

### 4.1.2 Deadweight Loss of Taxation

The excess burden (deadweight loss) of a small tax \( t \) is approximately

\[ DWL \approx \frac{1}{2} t^2 \frac{\varepsilon_D \varepsilon_S}{\varepsilon_S - \varepsilon_D} \cdot \frac{Q}{P} \]

Two key implications: (1) DWL rises with the *square* of the tax rate, so doubling a tax quadruples the excess burden; (2) DWL is larger when supply and demand are more elastic. This motivates the inverse elasticity rule for optimal commodity taxes (Ramsey 1927): to raise a given revenue with minimum total DWL, tax goods with low demand elasticities more heavily.

## Section 4.2: Income Redistribution

### 4.2.1 Optimal Redistribution

Redistribution is justified on both **efficiency** grounds (declining marginal utility of income) and **equity** grounds (Rawlsian or social contract arguments). The optimal level of redistribution balances:

- Gains to recipients (rising welfare of the poor)
- Deadweight costs of taxation (reduced labour supply, distorted investment)

The **leaky bucket** metaphor (Okun, 1975): transferring income from rich to poor is like carrying water in a leaky bucket — some spills. Society must decide how much leakage is acceptable.

### 4.2.2 In-Kind Transfers vs. Cash Transfers

Cash transfers respect consumer sovereignty: a recipient maximises utility over all goods. In-kind transfers (food stamps, subsidised housing) restrict choice to specific commodities.

Standard indifference-curve analysis shows that cash is preferred by the recipient. Yet governments use in-kind transfers when:

1. **Paternalistic motives** — ensuring consumption of merit goods (nutrition, shelter)
2. **Self-targeting** — only those in genuine need accept stigmatised or low-quality in-kind benefits (reducing adverse incentives)
3. **Political economy** — median voters may support housing subsidies more readily than unrestricted cash

<div class="example">
<strong>Food Stamps (Canada: SNAP equivalent):</strong> A household receiving food vouchers worth $200/month can be shown on an indifference curve diagram: if the household would have spent at least $200 on food anyway (an unconstrained optimiser), the voucher is equivalent to cash — it shifts the budget constraint outward but does not change the tangency point. If the household would have spent less than $200 on food, the voucher constrains them to a corner solution, making them worse off than an equivalent cash transfer.
</div>

---

# Chapter 5: Public Choice and Political Economy

## Section 5.1: Voting and Preference Aggregation

Markets aggregate preferences through prices; democracies aggregate them through votes. These mechanisms have very different welfare properties.

<div class="definition">
<strong>Median Voter Theorem:</strong> If preferences are single-peaked and voters vote sincerely on a one-dimensional issue, the majority-rule outcome is the preference of the median voter. Both parties in a two-party system converge to the median voter's position.
</div>

This predicts that public spending levels are determined by the median voter's income and preferences — in a right-skewed income distribution (mean > median), the median voter favours more redistribution than would be chosen by the average citizen.

## Section 5.2: Arrow's Impossibility Theorem

<div class="theorem">
<strong>Arrow's Impossibility Theorem (1951):</strong> No social welfare function simultaneously satisfies all four of the following conditions: (1) Unrestricted domain, (2) Pareto efficiency (weak), (3) Independence of irrelevant alternatives, and (4) Non-dictatorship.
</div>

The theorem establishes that there is no ideal democratic aggregation procedure. Majority voting, in particular, can produce **Condorcet cycles**: with three voters (A, B, C) and three options (X, Y, Z), it is possible that X beats Y, Y beats Z, and Z beats X — majority preferences are intransitive.

## Section 5.3: Representative Democracy and Fiscal Federalism

**Fiscal Federalism** addresses which level of government (federal, provincial, municipal) should provide each public good or tax service. Key principles:

- **Decentralisation theorem (Oates, 1972):** In the absence of spillovers and economies of scale, decentralised provision is at least as efficient as centralised provision because local governments can tailor provision to local preferences.
- **Spillovers justify centralisation:** If a local public good benefits residents of other jurisdictions (e.g., environmental cleanup, inter-city transit), the local government ignores these external benefits and under-provides — federal grants are warranted.
- **Economies of scale favour centralisation:** Certain public goods (national defence, central bank) have very high fixed costs, so centralised provision reduces average cost.

**Tiebout Model (1956):** Mobile households vote with their feet, sorting across municipalities by preferences for public good and tax bundles. In equilibrium, each jurisdiction provides its residents' preferred bundle. This is the local government analogue of a competitive market. Empirical evidence supports sorting, though mobility costs and housing markets complicate the prediction.

---

# Chapter 6: Social Insurance

## Section 6.1: Rationale for Social Insurance

Social insurance programs (Employment Insurance, public health care, public pensions) exist because private insurance markets fail for idiosyncratic or systemic risks:

- **Adverse selection:** Private insurers cannot distinguish high-risk from low-risk individuals; mandatory government insurance forces pooling.
- **Moral hazard:** Private insurance companies charge actuarially fair premia that vary with behaviour; government insurance may undercharge relative to true risk.
- **Missing markets:** Risks that span long time horizons or that are correlated across all market participants (macroeconomic recessions) cannot be diversified in private markets.

## Section 6.2: Employment Insurance in Canada

Employment Insurance (EI) replaces a fraction of insured earnings for workers who lose their jobs through no fault of their own.

**Benefit calculation:** The benefit rate is 55% of insured earnings, up to a maximum insurable amount. The duration of benefits depends on the regional unemployment rate and the number of insurable hours worked in the qualifying period.

**Efficiency costs:**
1. **Work disincentive:** EI reduces the opportunity cost of unemployment, lengthening spell duration.
2. **Seasonal moral hazard:** Industries with predictable seasonal layoffs (fishing, forestry, tourism) have historically structured employment to qualify workers for EI, raising the effective wage subsidy to seasonal industries.
3. **Regional cross-subsidisation:** More generous entitlement rules in high-unemployment regions subsidise workers and employers in Atlantic Canada relative to Ontario and Alberta.

**Insurance benefit:** Workers in volatile industries gain risk-reduction. Empirical evidence (Card and Levine, 2000; Green and Sargent, 1995) suggests the income-smoothing benefit of EI is substantial, particularly for low-income households with limited saving.

**Optimal EI design (Baily-Chetty framework):**

\[ \frac{b}{w-b} = \frac{\Delta c / c}{\varepsilon_{1-e,b}} \]

where \( b \) is the benefit, \( w \) is the wage, \( \Delta c / c \) is the consumption drop upon unemployment (insurance value), and \( \varepsilon_{1-e,b} \) is the elasticity of employment with respect to the benefit (moral hazard cost). High consumption drops and low behavioural responses call for generous benefits; high moral hazard calls for restraint.

## Section 6.3: Health Care in Canada

Canada operates a publicly financed, single-payer health insurance system. Each province administers its own plan subject to the Canada Health Act's five principles: universality, comprehensiveness, accessibility, portability, and public administration.

**Rationale for public provision:**
1. **Adverse selection** in private markets would leave high-risk individuals uninsured or priced out.
2. **Positive externalities** from infectious disease control and preventive care justify subsidising consumption.
3. **Merit good** arguments: society may wish to guarantee minimum health care regardless of ability to pay.

**Efficiency issues:**
- **Third-party payment:** Patients face near-zero marginal cost at the point of service, creating moral hazard and overconsumption of care.
- **Supplier-induced demand:** Physicians are both suppliers and advisers to patients; information asymmetry may allow suppliers to induce demand beyond the medically necessary level.
- **Queuing:** Without prices to ration demand, non-price rationing (waiting times) allocates care. Waiting lists are an efficiency cost and can generate inequality if wealthy patients travel abroad for private care.

**International comparison:** Canada spends approximately 11–12% of GDP on health care, less than the US (17–18%) but more than comparable OECD nations with mixed public-private systems. Outcomes (life expectancy, infant mortality) are comparable to Europe despite lower spending than the US, suggesting the US system's high cost is partly attributable to administrative overhead and market fragmentation.

---

# Chapter 7: Theory of the Second Best and Policy Interactions

## Section 7.1: Lipsey-Lancaster Theorem

When one or more first-best conditions cannot be met (due to monopoly, taxation, or regulation), removing other distortions does not necessarily improve welfare. The optimal second-best policy generally involves departing from all first-best conditions simultaneously.

<div class="example">
<strong>Second Best in Practice:</strong> Suppose a government wishes to correct an environmental externality but the polluting industry is a monopoly. A Pigouvian tax raises price toward the social optimum, but the monopoly was already pricing above marginal cost. Adding the Pigouvian tax to an already high monopoly price may push output too far below the optimum. The second-best environmental tax is lower than the Pigouvian rate — or possibly even a subsidy — because the monopoly distortion pushes in the opposite direction.
</div>

## Section 7.2: Implications for Public Policy Evaluation

Cost-benefit analysis must account for pre-existing distortions. Standard practice (following Harberger, 1971) applies a "shadow price of public funds" above one in economies with pre-existing distorting taxes. If raising one dollar in tax revenue costs society \$1.20 in welfare (a marginal cost of public funds of 1.20), any public project must pass a threshold of generating \$1.20 in social benefits per dollar of public expenditure.

---

# Chapter 8: Economic Justice and Redistribution

## Section 8.1: Philosophical Foundations

Different ethical frameworks lead to different redistribution policies:

- **Utilitarianism:** Maximise \( \sum U_i \). With diminishing marginal utility of income, there is a case for equalisation, but behavioural responses (labour supply elasticity) set limits.
- **Rawls:** The veil of ignorance leads risk-averse social planners to adopt the maximin criterion — maximise the welfare of the least well-off. In practice, this implies strong redistribution but stops short of perfect equality because incentive effects reduce the size of the pie.
- **Nozick (libertarian):** Distributive justice requires only that holdings arise through just acquisition and voluntary exchange. Redistribution through taxation is coercive and unjustified regardless of outcomes.
- **Capability approach (Sen):** Welfare should be measured in terms of capabilities — what individuals are actually able to do and be. Redistribution of income may be insufficient if disabilities or social structures prevent conversion of income into capabilities.

## Section 8.2: Poverty Measurement

<div class="definition">
<strong>Poverty Line:</strong> A threshold below which a household is considered poor. Canada uses both absolute (low-income cut-off, LICO) and relative (low-income measure, LIM = 50% of median income) thresholds. The choice of threshold significantly affects measured poverty rates.
</div>

**Poverty gap:** Total income shortfall of poor households relative to the poverty line, divided by the number of poor households. Fills in *depth* of poverty beyond headcount.

**Sen poverty index** combines incidence, intensity (gap), and inequality among the poor:

\[ P = H \left[ I + (1-I) G_p \right] \]

where \( H \) is the headcount ratio, \( I \) is the income gap ratio, and \( G_p \) is the Gini coefficient among the poor.

## Section 8.3: Work Incentives and Social Assistance

Social assistance programs create implicit marginal tax rates through benefit reduction rates (clawbacks). If a welfare recipient loses \$0.70 in benefits for every dollar earned, they face an implicit marginal tax rate of 70% — often higher than the explicit tax rate faced by high-income earners.

High implicit tax rates create **poverty traps**: rational individuals remain on welfare because the net gain to working is insufficient to cover costs (transportation, child care) or the utility value of leisure. Policy responses include:

- **Earned Income Tax Credit (EITC / Working Income Tax Benefit in Canada):** Subsidises low earnings, creating a positive implicit wage rate for those at the low end of the earnings distribution.
- **Gradual benefit reduction:** Reducing the benefit reduction rate below 100% extends coverage to working poor but raises program costs.
- **In-kind benefits conditional on work:** Supports like subsidised child care directly offset barriers to work.
