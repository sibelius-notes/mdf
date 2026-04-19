---
title: "ECON 441: Public Economics"
prof: "Anindya Sen"
subjects: "ECON"
---

## Sources and References

**Primary textbooks** — Rosen, Harvey S., et al. *Public Finance in Canada*, 2016. McGraw-Hill Ryerson. Leach, John. *A Course in Public Economics*. Cambridge University Press, 2004.

**Supplementary texts** — Atkinson, Anthony B., and Joseph E. Stiglitz. *Lectures on Public Economics*. Princeton University Press, 1980 (reissued 2015). Diamond, Peter, and James Mirrlees. "Optimal Taxation and Public Production I–II," *American Economic Review*, 1971. Myles, Gareth D. *Public Economics*. Cambridge University Press, 1995.

**Online resources** — MIT OpenCourseWare 14.471 (Public Economics I) and 14.472 (Public Economics II); NBER Tax Policy and the Economy series; Department of Finance Canada working papers; CBO and Parliamentary Budget Office reports.

---

# Chapter 1: The Role of Government in a Market Economy

## Section 1.1: Rationales for Government Intervention

In a perfectly competitive economy with complete markets, no externalities, no public goods, and symmetric information, the First Welfare Theorem guarantees Pareto efficiency of market outcomes. Government intervention is, in this benchmark, welfare-reducing. Real economies depart from this benchmark in systematic ways that constitute the **positive rationale** for government activity.

The four canonical market failures:

<div class="definition">
<strong>Public Goods:</strong> Goods that are simultaneously non-rival (one person's consumption does not reduce availability) and non-excludable (it is impossible to prevent non-paying consumers from benefiting). Markets under-provide public goods because free-riding prevents cost recovery.
</div>

<div class="definition">
<strong>Externalities:</strong> Costs or benefits imposed on third parties not reflected in market prices. Negative externalities (pollution) cause overconsumption; positive externalities (vaccination, education) cause underconsumption. The social optimum requires Pigouvian taxes or subsidies to internalise these effects.
</div>

<div class="definition">
<strong>Asymmetric Information:</strong> When one party to a transaction has private information, markets may fail through adverse selection (hidden types) or moral hazard (hidden actions). Government can improve outcomes through mandatory disclosure, insurance mandates, or direct provision.
</div>

<div class="definition">
<strong>Market Power:</strong> When firms have pricing power above marginal cost, output is restricted below the social optimum. Government intervenes through antitrust regulation, rate regulation of natural monopolies, or public ownership.
</div>

Beyond efficiency, governments pursue **distributional objectives** — taxation and transfer programmes redistribute income according to social preferences that the market does not internalise.

## Section 1.2: The Scope of Government in Canada

Government expenditure in Canada has risen from under 15% of GDP in 1900 to approximately 40–45% in recent decades (all levels of government combined). Major spending categories:

- Social protection (pensions, income transfers): ~12% of GDP
- Health care: ~11% of GDP
- Education: ~6% of GDP
- Infrastructure, defence, administration: ~6% of GDP

Tax revenues are approximately 33% of GDP at all government levels — less than most Western European countries (often 40–50% of GDP) but above the United States (~25% of GDP).

---

# Chapter 2: General Equilibrium and the Role of Government

## Section 2.1: Welfare Theorems and Their Limits

The welfare theorems underpin the case for and against government intervention simultaneously. The First Welfare Theorem says competitive equilibrium is Pareto efficient — a case for markets. The Second Welfare Theorem says any Pareto optimum can be decentralised through lump-sum redistribution — a case for redistribution followed by market operation.

The Second Theorem is theoretically powerful but practically limited: lump-sum transfers require information about individual utilities or endowments that is unavailable to the government. Distorting taxes — income taxes, consumption taxes — impose deadweight losses that lump-sum taxes avoid in theory.

## Section 2.2: The Diamond-Mirrlees Production Efficiency Theorem

<div class="theorem">
<strong>Diamond-Mirrlees (1971) Production Efficiency Theorem:</strong> If the government can impose taxes on all commodities and factors, the optimal tax system always has the economy producing on its production frontier — even if the optimal consumption allocation is distorted. There should be no wedge between marginal products across firms or sectors.
</div>

Implication: the government should not use output subsidies or taxes to distort the production side of the economy. All distortions should occur on the consumption side. This result rules out intermediate input taxation and provides a foundation for VAT systems that zero-rate inputs (taxing only final consumption, not production).

**Caveat:** The theorem assumes all firms are privately owned and profit-seeking. When some firms have market power or when there are other pre-existing distortions in production, the Diamond-Mirrlees result may not hold.

---

# Chapter 3: Public Goods — Market Failure and Efficient Provision

## Section 3.1: The Samuelson Condition

The efficient provision of a public good \( G \) alongside a private good \( x \) requires:

\[
\sum_{i=1}^{n} MRS_i^{G,x} = MRT^{G,x}
\]

The social marginal benefit (sum of individual MRS values) equals the social marginal cost (MRT). Because the public good is non-rival, the aggregate demand schedule is obtained by vertical summation of individual demand curves — contrasting with the horizontal summation used for private goods.

Graphically: the social demand for the public good at quantity \( G \) is \( \sum_i P_i(G) \), where \( P_i(G) \) is individual \( i \)'s marginal willingness to pay. The optimum sets this aggregate demand equal to the marginal cost of provision.

## Section 3.2: The Free-Rider Problem and Voluntary Provision

In a Nash equilibrium of voluntary public good provision, each consumer \( i \) chooses their contribution \( g_i \) to maximise utility, taking others' contributions as fixed. The Nash provision satisfies:

\[
MRS_i^{G,x} = MRT^{G,x} \quad \forall i
\]

But the Samuelson optimum requires the *sum* of MRS values to equal MRT. The Nash equilibrium equates only each individual's MRS to MRT — ignoring others' positive valuations. The result is systematic under-provision: in the Nash equilibrium, \( G^{Nash} < G^{Samuelson} \).

<div class="example">
<strong>Neutrality Result:</strong> In the private provision Nash equilibrium with identical consumers and a constant MRT, total provision is independent of the number of contributors: each individual contributes less as others contribute more, so total stays the same. This "neutrality result" (Warr, 1983; Bergstrom, Blume, and Varian, 1986) means distributional changes among contributors leave total provision unchanged — a powerful result that limits the effectiveness of pure redistribution as a substitute for public provision.
</div>

## Section 3.3: Lindahl Equilibrium

The Lindahl (1919) mechanism provides a theoretical solution to the free-rider problem: if each consumer faces a personalised price (their Lindahl price) equal to their marginal valuation of the public good, they voluntarily demand the efficient quantity.

At the Lindahl equilibrium:
- Each consumer's Lindahl price-share \( \tau_i \) satisfies \( \tau_i \cdot MC = MRS_i^{G,x} \)
- The shares sum to 1: \( \sum_i \tau_i = 1 \)
- Each consumer demands the same quantity \( G^* \) at their personalised price

The Lindahl equilibrium is Pareto efficient. But it is not **incentive compatible**: consumers have an incentive to understate their valuation to get a lower price, reverting to the free-rider problem. Practical public good provision relies on political mechanisms (voting, revealed social welfare functions) rather than Lindahl prices.

---

# Chapter 4: Welfare Analysis

## Section 4.1: The Measurement of Welfare Changes

Cost-benefit analysis of government policies requires measuring welfare changes in money-metric units. The standard tools are **compensating variation (CV)** and **equivalent variation (EV)**, both derived from the expenditure function.

Let \( e(p, u) \) be the expenditure function — the minimum income needed to achieve utility \( u \) at prices \( p \). When prices change from \( p^0 \) to \( p^1 \):

\[
CV = e(p^1, u^0) - e(p^0, u^0) = e(p^1, u^0) - m
\]

\[
EV = e(p^1, u^1) - e(p^0, u^1) = m - e(p^0, u^1)
\]

CV is the income change (at new prices) that leaves the consumer at the original utility. EV is the income change (at old prices) that is equivalent to the policy change. For a price increase, both CV and EV are positive; for a price decrease, both are negative.

<div class="remark">
<strong>Consumer Surplus as an approximation:</strong> Consumer surplus (the area behind the ordinary demand curve) approximates CV and EV when income effects are small. For most practical policy analyses, CS is adequate. When income effects are large — health care, housing — CV and EV are preferred.
</div>

## Section 4.2: Social Cost-Benefit Analysis

A public project is socially desirable if the aggregate welfare gains exceed the aggregate welfare losses. The standard rule:

\[
\sum_i CV_i > 0
\]

(or equivalently, aggregate EV > 0 using Hicks-Kaldor compensation test). Note that this does not require that losers be compensated — it is a potential Pareto improvement, not an actual one.

**Shadow prices:** When markets are distorted (taxes, monopoly, externalities), market prices do not equal social opportunity costs. Shadow prices correct for these distortions. For a taxed good, the shadow price is between the consumer price and producer price; for a rationed good (e.g., congested roads), the shadow price includes the congestion cost.

**Marginal cost of public funds (MCPF):** Raising one additional dollar of tax revenue costs more than one dollar in welfare because taxes distort behaviour. The MCPF measures this ratio. If the MCPF is 1.25, any public project must generate at least \$1.25 in social benefits per dollar of government expenditure. Canadian estimates of the MCPF range from 1.1 to 1.5, depending on the tax used.

---

# Chapter 5: Externalities and Property Rights

## Section 5.1: Pigouvian Taxation — Theory and Practice

Arthur Pigou (1920) proposed that the government correct negative externalities by taxing the activity at a rate equal to the marginal external cost at the social optimum:

\[
t^* = MEC(Q^*)
\]

The tax internalises the external cost, shifting the supply curve (marginal private cost + tax) to the social marginal cost curve, thereby achieving the efficient output \( Q^* \).

**Practical challenges:**

1. **Information:** The regulator must know the marginal damage function and the marginal abatement cost function. Both are typically unobserved and must be estimated.
2. **Heterogeneous polluters:** When polluters have different abatement costs, a uniform tax achieves cost-effective abatement (each polluter abates until their marginal abatement cost equals the tax), but a uniform standard does not.
3. **Non-linear damages:** If marginal damage is increasing in the pollution level, the Pigouvian tax must be set at the correct output level — a requirement for precision that favours quantity standards over prices when damage is catastrophic above a threshold.

## Section 5.2: Coase Theorem and Bargaining

<div class="theorem">
<strong>Coase Theorem (1960):</strong> With well-defined property rights, zero transaction costs, and rational parties, private bargaining achieves the socially efficient outcome regardless of the initial property rights assignment. The assignment affects distribution but not efficiency.
</div>

**Proof sketch:** Suppose the efficient outcome involves the polluter reducing output from \( Q_m \) to \( Q^* \). The total gain from this reduction equals the area under the marginal damage curve between \( Q^* \) and \( Q_m \). The total loss to the polluter equals the area under the (marginal abatement cost curve). If the former exceeds the latter (which it does by the definition of \( Q^* \)), a deal is possible: the victim pays the polluter to reduce output, or the polluter compensates the victim to allow more output, depending on who has the property right.

**Why Coasian bargaining fails in practice:**
- Transaction costs are high when there are many affected parties (air pollution, climate change)
- Strategic behaviour in bilateral monopoly negotiations
- Asymmetric information about damage and abatement costs
- Poorly defined property rights (common pool resources, international air and water)

## Section 5.3: Emissions Trading and Cap-and-Trade

Cap-and-trade systems set a cap on total emissions (a quantity standard) and distribute permits that can be traded. The permit price equilibrates marginal abatement costs across firms — achieving cost-effectiveness without requiring the regulator to know individual abatement cost functions.

**Weitzman (1974) prices vs. quantities:** Under uncertainty about abatement costs, the choice between a price instrument (tax) and a quantity instrument (cap) depends on the relative slopes of the marginal damage and marginal abatement cost curves. If marginal damage is steep relative to marginal abatement cost (catastrophic threshold pollution), quantities are preferred; if marginal abatement cost is steep (uncertain compliance costs), prices are preferred.

---

# Chapter 6: Methods for Cost-Benefit Analysis

## Section 6.1: Discount Rates and Intergenerational Equity

Cost-benefit analysis of long-lived public investments (infrastructure, environmental protection, pensions) requires discounting future benefits and costs to present values. The **social discount rate** \( r_s \) reflects:

\[
r_s = \rho + \eta \cdot g
\]

where \( \rho \) is pure time preference, \( \eta \) is the elasticity of marginal utility of consumption, and \( g \) is the expected growth rate of consumption (Ramsey rule). If \( \rho = 1\%, \eta = 2, g = 2\% \), then \( r_s = 5\% \).

**Stern Review controversy:** Nicholas Stern (2006) used a very low discount rate (\( r_s \approx 1.4\% \)) in his cost-benefit analysis of climate change, implying very large present values of future climate damages. Nordhaus criticised this on both descriptive (market rates are higher) and normative (very low time preference implies implausibly high savings rates) grounds. The choice of discount rate is both a technical and ethical question.

## Section 6.2: Valuing Non-Market Goods

Many public goods and externalities lack market prices. Valuation methods:

- **Hedonic pricing:** Uses price differences across goods (houses, wages) that vary in their bundled characteristics to infer implicit prices. VSL from wage-risk studies is the canonical example.
- **Travel cost method:** Uses travel expenditures to recreational sites to infer willingness to pay for the site's existence.
- **Contingent valuation:** Surveys respondents about their willingness to pay for non-market goods. Criticised for hypothetical bias and embedding effects but widely used for environmental and health valuation.
- **Revealed preference methods (general):** Use actual behaviour (where people live, what they buy, where they seek health care) to infer valuations without direct questioning.

---

# Chapter 7: Optimal Commodity Taxation

## Section 7.1: The Ramsey Problem

The government must raise a fixed revenue \( R \) by taxing \( n \) commodities, and wishes to minimise the total deadweight loss. This is the **Ramsey (1927) optimal tax problem**. Assuming separable demand and no income effects, the optimal tax rates satisfy the **inverse elasticity rule**:

\[
\frac{t_i}{q_i} = -\frac{\lambda}{\varepsilon_i}
\]

where \( t_i \) is the per-unit tax on good \( i \), \( q_i \) is the consumer price, \( \varepsilon_i \) is the own-price elasticity of demand, and \( \lambda \) is the Lagrange multiplier on the revenue constraint (the marginal cost of public funds).

The inverse elasticity rule says: to minimise deadweight loss, tax goods with inelastic demand more heavily. The intuition is that inelastic demand implies a small quantity distortion per dollar of revenue raised.

**Ramsey rule in relative terms:** Equivalently, the Ramsey rule requires that taxes reduce all compensated demands by the same proportional amount:

\[
\frac{\Delta x_i^c}{x_i^c} = -\mu \quad \forall i
\]

where \( \Delta x_i^c \) is the change in compensated demand and \( \mu \) is a common constant (the Ramsey proportionality condition). This is also called the **equal-proportional reduction rule**.

## Section 7.2: Equity Considerations in Commodity Taxation

The Ramsey rule ignores distributional concerns. If poor households spend a larger share of income on necessities (food, heating fuel), taxing necessities more heavily (because they are price-inelastic) is regressive. The **distributional extension** of the Ramsey rule (Diamond, 1975) introduces distributional weights:

\[
\frac{t_i}{q_i} = -\frac{\lambda - \sum_h \mu_h x_i^h / \lambda}{\varepsilon_i}
\]

Goods disproportionately consumed by high-income households receive higher distributional weights, partially offsetting the inverse elasticity rule. In practice, Canada and most OECD countries zero-rate food and basic necessities under GST/VAT, reflecting distributional concerns.

## Section 7.3: Optimal Taxation of Externalities — Pigouvian Correction and Revenue

When a Pigouvian tax corrects an externality, it also raises revenue. The **double dividend hypothesis** claims that using environmental tax revenue to reduce distorting taxes (income taxes, payroll taxes) generates a double dividend: correcting the externality and reducing the excess burden of the tax system.

However, Bovenberg and de Mooij (1994) showed that the double dividend is not generally available. The Pigouvian tax raises the price of carbon-intensive goods, which are a significant share of low-income household budgets; this erodes the real value of the labour supply, reducing labour supply and adding a new distortion even as the environmental distortion is corrected. The net revenue must be large enough to more than offset the labour supply distortion to generate a true double dividend.

---

# Chapter 8: Optimal Income Taxation

## Section 8.1: Mirrlees (1971) — The Information Problem

The central insight of modern optimal income tax theory is that the government observes income but not ability (productivity). Tax schedules must therefore be designed to raise revenue and redistribute while respecting **incentive compatibility**: the schedule must not induce high-ability workers to mimic the labour supply of low-ability workers to avoid high taxes.

<div class="definition">
<strong>Mirrlees Optimal Income Tax:</strong> The income tax schedule that maximises social welfare subject to government budget balance and incentive compatibility (no individual prefers to mimic another type). The schedule specifies a marginal tax rate as a function of reported income.
</div>

## Section 8.2: The Mirrlees Model

Each worker has ability \( \theta \) drawn from distribution \( F(\theta) \). A worker with ability \( \theta \) choosing labour supply \( l \) earns income \( z = \theta l \). The government observes \( z \) but not \( \theta \).

The worker maximises:

\[
U(c, l) = c - v(l)
\]

where \( c = z - T(z) \) is consumption (income minus tax) and \( v(l) \) is the disutility of effort. The government maximises:

\[
\int W(U(c(\theta), l(\theta))) f(\theta) d\theta
\]

subject to revenue sufficiency and incentive compatibility (the **IC constraint**): each type \( \theta \) prefers the bundle \( (c(\theta), l(\theta)) \) intended for them over any bundle intended for a different type.

## Section 8.3: Key Results from Mirrlees Taxation

<div class="theorem">
<strong>Zero Top Rate Result:</strong> In the Mirrlees model, if the top of the ability distribution is a point mass (a finite number of people at the top), the optimal marginal tax rate at the top is zero. Taxing the top earner more achieves no redistribution benefit (there is no one above them to redistribute from) while imposing a labour supply distortion.
</div>

<div class="theorem">
<strong>Non-Negativity of Marginal Rates:</strong> Under mild regularity conditions, optimal marginal tax rates are non-negative throughout the income distribution. Negative marginal rates (subsidies that increase with income) would relax IC constraints but are usually dominated by other instruments.
</div>

The **optimal marginal tax rate** formula (Saez, 2001 reformulation in terms of observables):

\[
T'(z^*) = \frac{1 - G(z^*)}{1 - G(z^*) + \alpha \cdot e \cdot \frac{z^*}{1 - T'(z^*)}} \cdot \frac{1}{1+e}
\]

where \( G(z^*) \) is the average social welfare weight for individuals above income \( z^* \), \( e \) is the elasticity of earnings with respect to the net-of-tax rate, and \( \alpha \) is a measure of the thickness of the top income distribution. Higher elasticity \( e \) reduces optimal top rates; thinner top income distribution (sharper Pareto tails) increases optimal top rates.

**Empirically:** Saez (2001) estimated that the optimal top marginal rate (incorporating the US income distribution) is approximately 70% given the observed top income elasticity of 0.25. Diamond and Saez (2011) reaffirmed this estimate, arguing the current top US marginal rate (roughly 40%) is well below the revenue-maximising rate.

## Section 8.4: Elasticity of Taxable Income (ETI)

The key behavioural parameter for optimal income tax design is the **elasticity of taxable income (ETI)** — the percentage change in reported taxable income in response to a one-percent increase in the net-of-tax rate \( (1 - t) \):

\[
e_{TI} = \frac{\partial \ln z}{\partial \ln(1-t)}
\]

The ETI captures all margins of behavioural response: labour supply, avoidance, evasion, and income shifting. Feldstein (1995) found ETIs of 1–3 for high-income US taxpayers; more recent credible estimates (Chetty, 2012) find ETIs of 0.1–0.5, suggesting the revenue-maximising rate is relatively high.

**Revenue-maximising tax rate (Laffer peak):**

\[
t^* = \frac{1}{1 + a \cdot e_{TI}}
\]

where \( a \) is the Pareto parameter of the top income distribution. With \( a = 1.5 \) and \( e_{TI} = 0.25 \), \( t^* = 73\% \).

---

# Chapter 9: Optimal Income Redistribution

## Section 9.1: The Optimal Negative Income Tax

A **Negative Income Tax (NIT)** provides a guaranteed basic income \( G \) and reduces benefits at rate \( t \) for every dollar earned:

\[
\text{Transfer} = G - t \cdot \text{Earned Income}
\]

The NIT becomes a positive income tax once earnings exceed \( G/t \) (the break-even income). Milton Friedman (1962) advocated the NIT as a replacement for categorical welfare programmes, arguing it would reduce poverty while preserving work incentives more effectively than programmes with very high implicit marginal tax rates (100% BRRs).

**Trade-offs in NIT design:**
- Higher \( G \) reduces poverty more thoroughly but raises fiscal cost.
- Lower \( t \) (flatter phase-out) extends coverage to the working poor and reduces poverty traps but is more expensive.
- No combination of \( G, t \) simultaneously achieves high benefits, low marginal tax rates, and fiscal sustainability — the **iron triangle** of welfare programme design.

## Section 9.2: Cash vs. In-Kind Transfers

Standard consumer theory predicts that unrestricted cash transfers are at least as welfare-enhancing as in-kind transfers of equal market value, because cash respects individual preferences while in-kind transfers may force consumption of goods below the individual's desired level.

Yet governments provide substantial in-kind transfers (food stamps, subsidised housing, Medicaid, child care, public education). Rationales:

1. **Paternalism / merit goods:** Society believes recipients would under-consume certain goods (nutrition, health care, education) without in-kind mandates.
2. **Externalities:** The consumption of some goods (vaccinations, education) generates positive externalities, justifying subsidisation.
3. **Self-targeting / adverse incentives:** In-kind transfers of low-quality goods (public housing in isolated locations, nutritionally adequate but unpalatable food) deter non-poor applicants, reducing programme costs without deterring the genuinely needy.
4. **Political economy:** Middle-class voters support in-kind transfers for the poor when they know the transfer goes to specific goods they value (housing, food, children's health) — building a political coalition that pure cash transfers do not.

**Empirical evidence:** Studies using lottery-generated income windfalls or quasi-experimental cash transfer programmes (e.g., SNAP cash equivalents) find that recipients spend cash similarly to how they would spend in-kind transfers — suggesting demand for food and housing at low income levels exceeds the in-kind benefit level anyway (the constraint does not bind). The welfare cost of in-kind transfers relative to cash may be modest.

---

# Chapter 10: Social Welfare Programs, Unemployment Insurance, and Health Care in Canada

## Section 10.1: Architecture of the Canadian Welfare State

Canada's welfare state is a layered system:

| Level | Programme | Federal/Provincial |
|---|---|---|
| Old Age Security (OAS) | Universal pension at 65 | Federal |
| Canada Pension Plan (CPP) | Earnings-related pension | Federal (joint) |
| Employment Insurance (EI) | Earnings replacement on job loss | Federal |
| Canada Child Benefit (CCB) | Income-tested child benefit | Federal |
| Guaranteed Income Supplement (GIS) | Low-income elderly supplement | Federal |
| Social Assistance (SA) | Last-resort income support | Provincial |
| Canada Health Act (CHA) | Universal health insurance framework | Federal framework, provincial delivery |

The federal-provincial architecture creates a complex web of incentives and cost-sharing that interacts with optimal tax design: provincial social assistance benefit reduction rates interact with federal EI eligibility, and together with federal income tax marginal rates, determine the effective marginal tax rate faced by low-income workers.

## Section 10.2: Optimal Unemployment Insurance

The optimal design of EI involves balancing two forces:

- **Insurance value:** Workers with insufficient savings face sharp consumption drops upon job loss. EI provides consumption smoothing that completes an otherwise missing insurance market.
- **Moral hazard cost:** Higher benefits lengthen unemployment spells by reducing search intensity and raising the reservation wage.

**Baily (1978) – Chetty (2006) formula:**

\[
\frac{b^*}{w - b^*} = \frac{\gamma \cdot \Delta c / c}{\varepsilon_{1-e, b}}
\]

where \( b^* \) is the optimal benefit, \( w \) is the wage, \( \gamma \) is the coefficient of relative risk aversion, \( \Delta c / c \) is the proportional consumption drop upon unemployment (the consumption-smoothing benefit of EI), and \( \varepsilon_{1-e, b} \) is the elasticity of employment with respect to the benefit level (the moral hazard cost).

Chetty (2008) estimated \( \Delta c / c \approx 6\% \) in the US using consumption data. With \( \gamma = 2 \) and \( \varepsilon \approx 0.5 \), the optimal replacement rate is around 50–60% — broadly consistent with the 55% Canadian EI replacement rate, though the calculation is sensitive to empirical parameters.

**Duration of benefits:** The optimal benefit duration is longer when job search involves significant match quality learning (workers learn about their preferences by searching) and when aggregate unemployment is high (cyclically extended benefits are efficient).

## Section 10.3: Health Care Economics and Canadian Policy

### 10.3.1 Why Health Care Is Different

Health markets are plagued by multiple simultaneous failures:

1. **Adverse selection** in private insurance
2. **Moral hazard** from third-party payment
3. **Supplier-induced demand** from physician agency
4. **Asymmetric information** between patients and providers
5. **Public good externalities** in public health and research
6. **Catastrophic cost** risk that exceeds private savings capacity

The co-existence of these failures makes health care the most regulated sector of every developed economy.

### 10.3.2 Models of Health Care Organisation

| System | Country | Funding | Delivery |
|---|---|---|---|
| Beveridge (NHS) | UK, Sweden | General taxation | Public provision |
| Bismarck (Social insurance) | Germany, France | Payroll taxes | Private/mixed |
| Single-payer (Canadian model) | Canada | General taxation | Private delivery, public insurance |
| Multi-payer | US | Mixed (Medicare, Medicaid, private) | Private |

Canada's single-payer model separates insurance (publicly provided by provinces) from delivery (largely private physicians and hospitals). This eliminates adverse selection in primary insurance but retains payment incentives: fee-for-service physician payment creates incentives for over-provision of services; global hospital budgets create incentives for under-provision.

### 10.3.3 Efficiency and Equity

**Efficiency issues:**
- **Waiting times** are the non-price rationing mechanism. An efficient waiting time balances the cost of waiting (foregone health, reduced productivity) against the cost of excess capacity. Canadian wait times for specialist care and elective procedures are longer than in comparable OECD countries with mixed systems.
- **Physician payment:** Capitation (per-patient payment) gives incentives for risk selection (enrolling healthy patients) and under-provision; fee-for-service gives incentives for over-provision; salary gives incentives for effort reduction. No single payment method is dominant.
- **Pharmaceutical pricing:** Single-payer systems can negotiate bulk prices below market; the Patented Medicine Prices Review Board (PMPRB) limits excess prices in Canada.

**Equity:**
- Universal coverage eliminates income barriers to access in principle.
- In practice, queue-jumping via private care in other provinces (or the US) advantages high-income patients.
- The social gradient in health — poorer Canadians have worse health outcomes even with universal insurance — reflects the non-medical determinants of health (housing, diet, stress, working conditions).

---

# Chapter 11: Public Choice — When Government Fails

## Section 11.1: Rational Ignorance and the Political Economy of Taxation

Public choice theory (Buchanan and Tullock, 1962; Downs, 1957) applies the tools of microeconomics to political behaviour. Key insights:

<div class="definition">
<strong>Rational Ignorance:</strong> Since a single vote has negligible effect on election outcomes, rational individuals invest little in acquiring information about candidates' policies. This gives organised interest groups — who gain concentrated benefits from specific policies — disproportionate political influence relative to the diffuse majority who bear the cost.
</div>

Concentrated benefits and diffuse costs create a systematic bias toward policies that benefit organised minorities (tariff protection, agricultural subsidies, targeted tax expenditures) at the expense of the majority. This helps explain why actual tax policy deviates substantially from optimal tax prescriptions.

## Section 11.2: The Political Economy of the Tax Mix

Why do governments use the particular mix of taxes they do? Optimal tax theory prescribes taxing consumption (VAT), correcting externalities (carbon taxes), and imposing broad income taxes with declining marginal rates as the ETI rises. Actual tax systems feature:

- **Tax expenditures** (deductions, credits, exemptions) that narrow the base and raise rates relative to the revenue-neutral base-broadening alternative
- **Mortgage interest deductibility** that subsidises homeownership above the socially optimal level
- **Capital income tax preferences** (capital gains deferral, dividend credits) that depart from comprehensive income taxation
- **Commodity tax exemptions** for politically influential sectors

Each deviation can be explained by political economy: concentrated beneficiaries lobby effectively for preferences; diffuse taxpayers have no incentive to organise against specific tax expenditures.

## Section 11.3: Government Failure and Regulation

Government intervention to correct market failures can itself be captured by private interests. **Regulatory capture** (Stigler, 1971): regulated industries have strong incentives to influence the regulatory process, while consumers (who individually benefit little from any particular regulation) have weak incentives. Over time, regulators may serve the regulated industry rather than the public.

**Implications for policy design:**
- Transparency and independent oversight reduce capture risk
- Automatic (formula-based) adjustments to benefits and taxes (e.g., CPP indexing, EI regional rate adjustments) limit discretionary political manipulation
- Economic analysis of regulatory impacts (regulatory impact analysis, RIA) builds institutional capacity to evaluate policies against explicit criteria

---

# Chapter 12: Synthesis — Welfare State Design in the 21st Century

## Section 12.1: Redistributive Efficiency Frontier

Any welfare state design occupies a point on a redistribution-efficiency frontier: more redistribution comes at the cost of greater behavioural distortion. The frontier's slope (the trade-off between redistribution and efficiency) depends on:

- **Elasticities:** Higher labour supply and taxable income elasticities steepen the frontier (redistribution is more costly)
- **Administrative capacity:** Better information technology and third-party reporting reduce avoidance, flattening the frontier (redistribution becomes less costly)
- **Behavioural responses:** If workers have strong intrinsic work motivation and low responsiveness to taxes, the frontier is flat and generous redistribution is feasible

Canada's welfare state evolved from a more limited system in the 1940s to a comprehensive one by the 1970s–80s. Fiscal pressures since the 1990s have constrained expansion but not reversed the basic architecture. Emerging challenges — automation, the gig economy, climate change costs — will test the adequacy of existing social insurance structures.

## Section 12.2: The Future of Optimal Tax Policy

Three emerging areas reshape optimal tax policy:

1. **Global tax competition:** Mobile capital and skilled workers respond to international tax differentials, constraining national tax policy. The OECD/G20 global minimum corporate tax (15%, Pillar Two) attempts to establish a floor. Optimal national capital income taxation must account for mobility responses.

2. **Top income concentration:** The dramatic rise of top incomes in Canada and the US since the 1980s (driven by technology, globalisation, and declining unionisation) raises the social marginal utility of redistribution. Diamond and Saez (2011) argue this justifies higher top marginal rates; opponents emphasise potentially large behavioural responses.

3. **Carbon pricing:** Optimal externality correction requires carbon prices of \$150–\$250/tonne CO₂e by 2030 (IPCC estimates). Canada's federal carbon price trajectory reaches \$170/tonne by 2030. Integration with the income tax system (revenue recycling) determines the distributional impact.
