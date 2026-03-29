---
title: "ECON 361: Cost-Benefit Analysis"
prof: "University of Waterloo"
subjects: "ECON"
---

---

# Module 1: The Logic of Cost-Benefit Analysis

## 1.1 What Is Cost-Benefit Analysis?

Imagine a government debating whether to spend $10 billion on a new high-speed rail corridor between Toronto and Windsor. Politicians argue about jobs and growth. Engineers debate safety standards. Environmentalists worry about wetland disruption. Who is right? More importantly, *how do we even decide*? This is precisely the problem that **cost-benefit analysis (CBA)** was designed to solve.

At its core, CBA is a systematic methodology for evaluating whether a policy or project produces net benefits for society. The central idea is disarmingly simple: add up everything a project gives to society, subtract everything it takes away, and check whether the result is positive. We call this the **net social benefit (NSB)**:

\[ \text{NSB} = \text{Total Social Benefits} - \text{Total Social Costs} \]

If NSB > 0, the project is worth doing in principle. If NSB < 0, the resources involved could be put to better use elsewhere. But as we will see, the devil is entirely in the details of measuring those benefits and costs — especially when they involve human health, the environment, or future generations.

CBA is not just an academic exercise. It is embedded in the legal and regulatory frameworks of governments around the world. In the United States, Executive Order 12866 (1993) requires federal agencies to conduct CBA before issuing any major regulation. In Canada, the Treasury Board Secretariat mandates CBA for significant government spending decisions. The methodology is also used extensively by international development organizations like the World Bank and the Inter-American Development Bank to evaluate infrastructure projects in developing countries.

### Types of CBA

Not all CBAs are created equal. The analysis can be conducted at three different points in a project's lifecycle:

An **ex-ante CBA** is conducted *before* a project begins. This is the most common type — it is prospective analysis meant to inform a decision. Because the future is uncertain, ex-ante CBAs necessarily involve forecasts and assumptions that may turn out to be wrong.

An **in-media res CBA** (literally "in the middle of things") is conducted *while a project is underway*. Perhaps initial cost estimates proved wildly optimistic, or early results look surprisingly positive. An in-media res CBA answers the question: given where we are, should we continue or cut our losses?

An **ex-post CBA** is conducted *after* a project is completed. This is the honest reckoning: did the project actually deliver what was promised? Ex-post CBAs are invaluable for improving future decision-making, even though there is very little appetite to do them (governments are rarely eager to audit their own past mistakes).

A famous example of the gap between ex-ante optimism and ex-post reality: the **Boston Big Dig**, a massive highway tunnel project completed in 2007. The original 1985 estimate was $2.8 billion. The final construction cost was $14.6 billion, and once interest payments are included the true bill reached **$24 billion** — a nearly 9-fold overrun. A Boston Globe investigation found that $1.1 billion of the overruns stemmed from Bechtel's own design errors. An honest ex-post CBA would have made for deeply uncomfortable reading. The project also induced additional demand — downtown Boston traffic improved, but congestion worsened at the fringes — illustrating how infrastructure CBAs routinely miss induced-demand effects.

---

## 1.2 The Ten Stages of CBA

Conducting a rigorous CBA involves navigating a well-defined process. The textbook framework identifies ten stages, each of which is both necessary and potentially contentious.

**Stage 1: Specify the set of alternative projects.** Every CBA must compare alternatives — including the "do nothing" baseline. Without a counterfactual, we cannot say whether a project is beneficial. This sounds obvious but is routinely violated in practice.

**Stage 2: Decide whose benefits and costs count (standing).** Should we count impacts on foreign nationals? Future generations? Animals? The question of **standing** — who gets to be included in the analysis — is one of the most philosophically loaded decisions in CBA. Typically, governments count benefits and costs to residents of their jurisdiction. But for projects with global externalities (like greenhouse gas emissions), this restriction can lead to deeply problematic conclusions.

**Stage 3: Catalogue the impacts and select measurement indicators.** What does the project actually *do*? Reduce travel time? Improve air quality? Displace workers? Each impact needs a measurable indicator before it can be valued.

**Stage 4: Predict the impacts quantitatively over the life of the project.** This is where forecasting expertise enters: engineering models, demand projections, epidemiological estimates.

**Stage 5: Monetize all impacts.** Convert everything into dollars. This is the hardest and most controversial step — how do you put a dollar value on a human life, on biodiversity, on a child's asthma episode? Later modules of this course are largely devoted to answering this question.

**Stage 6: Discount costs and benefits to obtain present values.** A dollar received ten years from now is worth less than a dollar today. The **present value (PV)** formula adjusts for this:

\[ PV = \frac{FV}{(1+r)^t} \]

where \(FV\) is the future value, \(r\) is the discount rate, and \(t\) is the number of years in the future.

**Stage 7: Apply the NPV criterion.** The **net present value (NPV)** sums all discounted benefits and costs:

\[ NPV = \sum_{t=0}^{T} \frac{B_t - C_t}{(1+r)^t} \]

Accept the project if NPV > 0. Among mutually exclusive alternatives, choose the one with the highest NPV.

**Stage 8: Perform sensitivity analysis.** Since many inputs are uncertain, we ask: how much do the conclusions change if we vary key assumptions? A project that looks good under a wide range of scenarios is more trustworthy than one that barely clears zero under optimistic assumptions.

**Stage 9: Make a recommendation.** The analyst's job is to translate the numbers into actionable guidance, honestly conveying what the analysis can and cannot tell us.

**Stage 10: If warranted, suggest a compensation mechanism.** Even a positive-NPV project creates winners and losers. Sometimes the political economy requires compensating the losers (or at least being explicit about who they are).

---

## 1.3 The CBA Decision Framework

### When Should We Use CBA?

CBA is the right tool when all of the following conditions hold: (1) the decision is being made by or for a public body, (2) impacts can be meaningfully quantified and monetized, and (3) distributional concerns can be handled adequately (either by weighting or by separate analysis).

CBA is *not* the right tool for decisions where fundamental rights are at stake — most people would find it repugnant to conduct a CBA on whether to allow torture, even if the numbers theoretically came out positive. The methodology has an appropriate domain.

### Common Errors to Avoid

Two errors trip up CBA practitioners repeatedly.

**Double-counting** occurs when the same benefit or cost is counted more than once under different labels. A classic example: suppose a highway project reduces commute times (a real benefit), and also increases nearby property values (because shorter commute times make those locations more attractive). If you count both the travel-time savings *and* the property value increases, you are counting the same benefit twice. Property value increases are typically the *capitalized* value of all local amenity improvements; they do not represent additional benefits on top of those improvements.

**The jobs fallacy** — treating employment created by a project as a pure benefit — is perhaps the most pervasive error in applied CBA. Before examining it, it is worth noting the most notorious example of the opposite error: the Ford Pinto scandal. In the 1970s, Ford engineers discovered that the Pinto's fuel tank would rupture in rear-end collisions. The fix cost **$11 per car**. Ford's internal memo explicitly ran a CBA: it valued each expected death at **$200,000** and each major burn injury at **$67,000**. Total benefit of the safety fix: roughly $49.5 million. Total cost of the fix: roughly $137 million. Conclusion: cheaper to pay the lawsuits. Ford did not make the fix — and subsequently faced a $125 million punitive damages award in the *Grimshaw v. Ford* case (later reduced to $3.5 million on appeal). The scandal became the defining cautionary tale for why monetizing human life, done carelessly and without ethical reflection, can be morally catastrophic even when the arithmetic is technically correct CBA. When an analyst claims "this project will create 500 jobs, each worth $60,000/year, generating $30 million in annual economic benefit," they are almost certainly making an error. In a well-functioning labour market, the workers employed on this project give up their previous work (or their leisure). The *opportunity cost* of their labour must be subtracted from the wage benefit. In aggregate, job creation is a transfer, not a net social benefit. The exception is when the labour market is distorted — specifically when workers are unemployed due to cyclical or structural slack, in which case the opportunity cost of their labour is below the market wage.

---

## 1.4 The Conceptual Framework: Efficiency and Welfare

### Pareto Efficiency

CBA is grounded in **welfare economics**, the branch of economics that asks how we can evaluate social states in terms of individual wellbeing. The foundational concept is **Pareto efficiency**: an allocation is Pareto efficient if no reallocation can make someone better off without making someone else worse off. Conversely, a **Pareto improvement** makes at least one person better off and no one worse off.

In theory, CBA should only approve Pareto improvements. In practice, almost no real policy satisfies this strict criterion — highways displace residents, environmental regulations impose costs on industries, and so on. This is why CBA relies instead on the **Kaldor-Hicks criterion**: a project passes if the winners could hypothetically compensate the losers and still come out ahead. Crucially, the compensation need not actually occur. This is the fundamental sleight-of-hand at the heart of applied CBA, and it will become important again in Module 10 when we discuss distributional concerns.

### Willingness to Pay

The measuring rod of all benefits in CBA is **willingness to pay (WTP)** — the maximum amount an individual would pay to receive a good or avoid a bad outcome. WTP is rooted in consumer preference theory: it is the money equivalent of the utility change caused by the project.

Why WTP and not something else, like votes? Because votes are binary (yes/no) and treat a billionaire's opinion exactly the same as a minimum-wage worker's. WTP is continuous and reflects the intensity of preference, but it is sensitive to the *distribution of income*: a rich person has higher WTP for almost everything simply because they have more dollars to spend. This is not a bug that can be easily fixed — it is a fundamental feature of the framework, and one that generates ongoing controversy.

### Opportunity Cost

Every resource used in a project has an **opportunity cost** — the value it would have produced in its best alternative use. Labour, capital, land, raw materials: none of these are free even when they appear to be. A government building that could have been sold to a developer, vacant land that could have hosted a park, bureaucrats who could have been writing better regulations elsewhere — all of these foregone values must enter the cost column of a CBA.

The opportunity cost principle is why "sunk costs" should not influence CBA. Money already spent cannot be recovered; only future benefits and costs are relevant to the go-forward decision. Ignoring this principle leads to the "Concorde fallacy" — continuing to pour money into a project simply because so much has already been invested.

---

## 1.5 Limitations of CBA

For all its appeal, CBA rests on foundations that deserve scrutiny.

### Transitivity Problems

Rational preferences are supposed to be transitive: if you prefer A to B and B to C, you must prefer A to C. But aggregated social preferences — formed by summing or voting over diverse individual preferences — need not be transitive. **Kenneth Arrow's Impossibility Theorem** (1951) proved this rigorously: there is no voting system that simultaneously satisfies a small set of very reasonable axioms (unanimity, independence of irrelevant alternatives, non-dictatorship) and always produces a consistent social preference ranking. Arrow proved this in his *PhD dissertation* at Columbia University, when he was just 29 years old. It is not a niche mathematical curiosity — it is a fundamental challenge to the idea that a "social welfare function" can be derived from individual preferences. Arrow won the Nobel Prize in Economics in 1972 partly for this result. The theorem implies that the only social ranking procedure that always satisfies the other four conditions is a *dictatorship* — one person's ranking determines everything. Every democratic aggregation method, no matter how clever, will occasionally produce cycles or violate one of the axioms.

CBA typically sidesteps Arrow's theorem by using money as a common unit of account. But this aggregation itself makes distributional assumptions (a dollar is worth the same to everyone) that are economically and ethically contestable.

### Wealth Dependence

WTP is bounded by income. A poor person cannot express a WTP that exceeds their wealth, even for something that matters enormously to them. This means that conventional CBA systematically underweights the preferences of low-income individuals and communities. Projects that benefit the wealthy will tend to score well in CBA even if their distributional impacts are regressive.

### Standing and Scope

Who counts in a CBA is ultimately a political decision. CBA typically ignores impacts on foreign nationals, future generations (via discounting), non-human animals, and ecosystems unless they enter human utility functions. All of these exclusions are contestable. The choice of discount rate alone can change the present value of far-future impacts by orders of magnitude — a crucial issue in climate change policy, as we will see in Module 6.

---

# Module 2: Measuring Benefits and Costs

## 2.1 Consumer Surplus

When the government imposes a tax, removes a subsidy, or builds infrastructure that changes market prices, it creates winners and losers among consumers. To measure the impact on consumer welfare, we use **consumer surplus (CS)** — the difference between what consumers are willing to pay and what they actually pay.

Graphically, consumer surplus is the area below the demand curve and above the price line. When price rises from \(P_0\) to \(P_1\), consumer surplus falls by a trapezoidal area. For small price changes, this loss can be approximated using the **demand elasticity formula**:

\[ \Delta CS \approx -Q_0 \cdot \Delta P \left(1 - \frac{\varepsilon_d \cdot \Delta P}{2 P_0}\right) \]

where \(Q_0\) is the initial quantity, \(\Delta P = P_1 - P_0\) is the price change, \(P_0\) is the initial price, and \(\varepsilon_d\) is the **own-price elasticity of demand** (expressed as a positive number for a downward-sloping demand curve).

This formula is handy because it allows analysts to estimate welfare changes without tracing out the entire demand curve — just the initial price, quantity, and an elasticity estimate (often borrowed from the empirical literature) are sufficient.

### Deadweight Loss

When a tax is imposed, society loses more consumer surplus than the government collects in revenue. The gap is the **deadweight loss (DWL)** — the inefficiency created because some mutually beneficial transactions no longer occur at the higher price. Deadweight loss represents a pure social cost, the triangular area in a supply-and-demand diagram that nobody collects.

This is not just a theoretical abstraction. When Canada imposes a $0.10/litre carbon tax on gasoline, it raises revenue but also causes some drivers to reduce their mileage, cancel trips, or shift to public transit. The surplus destroyed in those foregone trips exceeds the revenue collected from the remaining trips. The DWL is the social cost of using the tax system to raise revenue — which is why economists emphasize designing taxes to minimize DWL (taxing relatively inelastic goods).

---

## 2.2 Producer Surplus

On the supply side, **producer surplus (PS)** is the difference between what sellers receive and the minimum they would have accepted. It equals revenue minus variable costs of production:

\[ PS = TR - TVC \]

where \(TR\) is total revenue and \(TVC\) is total variable cost.

Graphically, producer surplus is the area above the supply curve and below the price line. When price rises, producers capture more surplus; when price falls, they lose surplus.

Under **perfect competition**, the market generates maximum total surplus (CS + PS). No other feasible allocation can make all parties simultaneously better off. This result — the First Welfare Theorem — is the benchmark efficiency justification for competitive markets.

### Total Surplus and the Case for Competition

Total surplus under competition equals the entire area between the demand and supply curves up to the equilibrium quantity. Any deviation from this equilibrium — through monopoly pricing, taxes, subsidies, price controls — destroys some of this surplus. The size of the destruction depends on the elasticities of supply and demand.

A useful rule of thumb: taxes cause large DWL when imposed on elastic markets (consumers and producers can easily substitute away), and small DWL when imposed on inelastic markets. This is why optimal tax theory suggests taxing necessities (inelastic demand) at higher rates than luxuries — though this conflicts with equity objectives, since low-income households spend proportionally more on necessities.

---

## 2.3 Government Surplus and the MCPF

Governments are not passive bystanders in markets. When a government collects a tax, it gains **government surplus (GS)** equal to the tax per unit times the quantity sold. But taxes also impose deadweight losses, and the government itself bears the cost of those distortions.

### The Complete NSB Formula

When a policy changes prices in a market, the total **net social benefit** is:

\[ NSB = \Delta CS + \Delta PS + \Delta GS \]

This additive formula holds because these three measures together exhaust all welfare impacts in a competitive market. Any dollar gained by one party was either gained from another (a transfer, netting to zero in the aggregate) or represents a genuine net social gain or loss.

### The Import Tariff Example

Consider a tariff on imported steel. Domestic consumers pay higher prices (ΔCS < 0). Domestic steel producers receive higher prices (ΔPS > 0). The government collects tariff revenue on imports (ΔGS > 0). But there is also a deadweight loss from the production inefficiency (domestic steel produced at costs above the world price) and a deadweight loss from foregone consumption. Adding everything up, the tariff typically yields a negative NSB — which is exactly why economists almost universally oppose protectionist tariffs on efficiency grounds, even while acknowledging they may serve distributional or strategic objectives.

### The Marginal Cost of Public Funds

Raising $1 in public revenue does not cost society exactly $1. It costs society \(1 + \lambda\) dollars, where \lambda\) is the **marginal cost of public funds (MCPF)** — the deadweight loss per dollar of tax revenue collected.

In Canada, the Treasury Board Secretariat estimated the MCPF at approximately **1.18**. This means that every dollar the government spends requires collecting $1.18 worth of taxes, and the extra $0.18 is pure deadweight loss — inefficiency created by the distortions of the tax system. This has a direct implication for CBA: public project benefits must exceed not just their dollar costs, but their dollar costs multiplied by the MCPF. A program that generates $1.05 in benefits per dollar of government spending is actually a **net loss** to society once you account for the cost of raising that dollar.

Not all taxes are equally distortionary. Research by Bev Dahlby (University of Calgary) and Ergete Ferede finds that the **corporate income tax** has the highest MCPF — a 1 percentage point increase shrinks the corporate tax base by roughly 3.67% in the short run as firms shift activity or avoid the tax. Sales taxes have lower MCPFs. This has implications for public finance: governments should fund projects using the least-distortionary taxes available.

In practice, many government CBA guides set the MCPF at 1.0 for convenience, which systematically understates the true social cost of public spending. A more rigorous analysis would apply the MCPF to all government expenditures, making it harder for marginal projects to pass the NPV test.

---

## 2.4 Compensating Variation and Equivalent Variation

The consumer surplus measure has a well-known theoretical flaw: it uses the *market* (Marshallian) demand curve, which mixes substitution effects and income effects. For welfare economics purposes, we ideally want a "pure" welfare measure that holds utility constant.

Two such measures exist:

**Compensating Variation (CV)** answers: "How much money would we need to take away from (or give to) this person *after* the price change to restore them to their original utility level?" It is the ex-post compensation required to make the change welfare-neutral.

**Equivalent Variation (EV)** answers: "How much money would we need to take away from (or give to) this person *before* the price change to make them indifferent between facing the change and not facing it?" It is the ex-ante income equivalent of the change.

These measures use the **Hicksian (compensated) demand curve**, which holds utility constant rather than income constant. They are theoretically superior to Marshallian consumer surplus but require knowledge of preferences that is rarely available in practice.

For most applied CBA purposes, the Marshallian consumer surplus approximation is adequate. The error involved is proportional to the income effect, which is small when the good in question represents a small share of the consumer's budget. For large price changes or for goods that absorb significant budget shares (housing, healthcare), the distinction becomes more important.

---

# Module 3: Estimating Demand

## 3.1 Demand Functions and Functional Forms

All the welfare calculations in Module 2 require knowing the demand curve — specifically, the price elasticity of demand and some reference point on the curve. In practice, demand functions must be estimated, and this estimation is as much art as science.

Two functional forms dominate applied work:

**Linear demand**: \( Q = a + b \cdot P + c \cdot X \), where \(X\) represents other demand-shifters (income, population, prices of substitutes). The price elasticity varies along a linear demand curve: it is large (in absolute value) at high prices and small at low prices.

**Log-linear (constant elasticity) demand**: \( \ln Q = a + \varepsilon_d \cdot \ln P + \beta \cdot \ln X \). The coefficient on \ln P\) directly gives the price elasticity, which is constant across all price levels. This functional form is very convenient for applied work because elasticities are constant and the equation is linear in parameters (after log transformation).

Which functional form is "correct"? Neither, strictly speaking — they are both approximations. The choice should be guided by economic theory and empirical fit. For small price changes, both forms give similar results. For large changes, the choice can matter substantially.

### The Role of Elasticity Estimates

A recurring challenge in applied CBA is that we often lack good local data to estimate demand elasticities. The standard workaround is to **borrow elasticities from the literature** — to use elasticity estimates from similar markets, similar regions, or similar time periods, and apply them to the current context.

This practice is widespread and pragmatic, but it carries risks. An elasticity estimated for urban transit in Tokyo may not apply well to rural bus services in Newfoundland. Meta-analyses that aggregate elasticities across many studies can help identify robust central estimates and their confidence intervals.

---

## 3.2 Extrapolation from Data Points

When only two data points are available (perhaps a before/after comparison or a comparison of two cities), it is possible to fit either a linear or log-linear demand curve. The two approaches yield different slope estimates and different welfare calculations.

Consider a simple example: suppose price rises from $2 to $3 and quantity falls from 100 to 80. The implied arc elasticity is:

\[ \varepsilon_d = \frac{(80 - 100)/90}{(3 - 2)/2.5} = \frac{-0.222}{0.400} \approx -0.56 \]

(using the midpoint formula). A linear demand curve through these two points has slope \(-20\) and implies a different elasticity at other points. The choice of functional form matters for welfare analysis, especially if we wish to predict behaviour outside the range of observed data.

**Rule of thumb**: use the log-linear form when extrapolating far from the observed range, since it prevents the nonsensical prediction of negative quantities that can arise with linear demand. Use the linear form when the price change is small relative to the current price.

---

## 3.3 OLS Regression and Estimation Biases

When multiple data points are available, **Ordinary Least Squares (OLS) regression** can estimate demand parameters more rigorously. The log-linear specification is particularly convenient because it can be estimated by regressing \(\ln Q\) on \(\ln P\) and other log-transformed demand shifters.

### The Problem of Simultaneity

A major pitfall in demand estimation is that prices and quantities are jointly determined by supply and demand. OLS estimates of a demand equation using observed price-quantity data will be biased because price is correlated with the error term — high unobserved demand shifts both price and quantity up. This **simultaneity bias** typically leads to underestimation of the true price elasticity.

The standard solution is **instrumental variables (IV) estimation**: find a variable that shifts supply (and thus price) but has no direct effect on demand. Supply-side cost shifters (fuel prices, wages of production workers) often serve as instruments in demand estimation.

### Systematic Biases in CBA Estimates

Beyond the statistical issues, CBA estimates are subject to several systematic biases that have been documented extensively in the literature:

**Publication bias**: Studies that find large, statistically significant benefits are more likely to be published than those with small or null results. If analysts search the published literature for benefit estimates, they will find a systematically upward-biased picture.

**Optimism bias**: Analysts, especially those hired by project proponents, tend to be optimistic about benefits and pessimistic about costs. The UK Treasury's "Green Book" explicitly recommends applying an "optimism bias uplift" factor to all project cost estimates to counteract this tendency.

**Confirmation bias**: Once a project has political momentum, analysts may unconsciously seek evidence that supports the project and discount evidence against it.

**Scope insensitivity**: People's stated WTP often fails to scale with the magnitude of the benefit. A study might find that people are willing to pay $80 to clean up pollution in one lake, $85 to clean up pollution in two lakes, and $87 to clean up all lakes in a region — even though the benefits clearly differ by an order of magnitude. This psychological phenomenon (related to "mental accounting") poses serious problems for benefit aggregation.

### The Delphi Method

When primary data is unavailable and borrowing from the literature is insufficient, analysts sometimes turn to the **Delphi method** — a structured process of expert elicitation. A panel of experts independently estimates key parameters, their estimates are aggregated and fed back to the panel, and the process repeats until consensus emerges. While this produces expert consensus rather than statistically grounded estimates, it can be valuable when time and data are limited.

---

# Module 4: Output Market Impacts

## 4.1 Benefits in Output Markets

When a public project produces goods or services that are sold in markets (or changes the supply of existing goods), the benefits appear in the **output market**. The analysis depends critically on the market structure.

### Perfectly Competitive Output Markets

If the project increases the supply of a competitively-produced good, the price falls and consumers benefit. The social benefit equals the area under the demand curve above the new price, minus the cost of production. If the market is already at the competitive equilibrium, the benefit of an incremental supply increase equals the market price — which is why analysts can use market prices as measures of marginal social value in competitive markets.

### Monopoly and Market Power

In a **monopolized output market**, price exceeds marginal cost. A project that increases supply in a monopoly market generates a social benefit that *exceeds* the monopolist's revenue, because the price falls and consumer surplus increases. The monopolist captures only part of the social value created; the rest is surplus for consumers.

Analysts working on projects in concentrated industries must be careful to capture this consumer surplus gain, not just the producer's revenue. Simply valuing output at the monopoly price will *understate* the social benefit.

### Externalities and Shadow Prices

When markets fail due to **externalities**, market prices no longer reflect true social values. A factory that pollutes a river imposes costs on downstream users that are not reflected in the price of its output. In such cases, the analyst must use **shadow prices** — adjustments to market prices that account for external effects.

The most prominent application of this concept today is the **social cost of carbon** — an estimate of the damage caused by one additional tonne of CO₂ emitted into the atmosphere. The U.S. Environmental Protection Agency estimated the social cost of carbon at roughly US$51 per tonne in 2021; more recent estimates from the Biden administration pushed this figure above US$190 per tonne, reflecting updated climate damage models. Any CBA involving fossil fuel use should ideally use the social cost of carbon as a shadow price adjustment to energy costs.

**Pigouvian taxes**, named after the economist Arthur Pigou, are designed to align market prices with shadow prices by making producers internalize their external costs. A carbon tax is the classic Pigouvian instrument. When a Pigouvian tax is set correctly, the market price with the tax equals the social shadow price, and no adjustment is needed in CBA — the market price already reflects social costs.

### Asymmetric Information

Markets can also fail when buyers and sellers have unequal information about product quality. In the famous **market for lemons** (Akerlof 1970), used-car sellers know the true quality of their cars but buyers do not. This asymmetry can cause markets to unravel entirely. In such markets, the observed transaction price may not be a reliable measure of social value. Government programs that address information asymmetries (food safety regulations, professional licensing requirements) can generate social benefits that are hard to capture in standard output market analysis.

---

# Module 5: Input and Secondary Markets

## 5.1 Input Market Impacts

Public projects don't just affect output markets — they also draw on inputs: labour, land, materials, capital equipment. The social cost of these inputs depends on whether input markets are themselves well-functioning.

### Efficient Input Markets

When a project bids for inputs in perfectly competitive markets, the market price equals the marginal social cost of those inputs. Labour hired at the market wage forfeits alternative employment worth exactly that wage. Material purchased at the market price reflects its value in alternative uses. In this case, the analyst can simply use observed market prices as input costs. No adjustment is needed.

### Underemployed Labour

The most important exception occurs when workers are **unemployed**. An unemployed worker who takes a construction job gives up their unemployment insurance, some leisure, and perhaps some job-search activity. These opportunity costs are real but much lower than the market wage. The **shadow wage** for unemployed labour is less than the market wage — potentially significantly so.

During recessions or in regions with structural unemployment, this distinction can substantially change a project's cost-benefit calculation. A highway project employing otherwise-idle workers imposes less social cost than one that draws workers away from other productive employment. This is not the same as saying "jobs are a benefit" — it is saying that the *cost* of those workers' time is lower than their wages suggest.

### Monopolist Input Suppliers

When a project purchases from a monopolist input supplier, the price paid exceeds marginal cost. The shadow cost of the input is the supplier's marginal cost, not the monopoly price. The difference represents a transfer to the monopolist, not a net social cost.

For example, suppose a government purchases land from a single large landowner who has market power. The price paid may significantly exceed the land's social opportunity cost. The analyst should estimate the true marginal social cost of the input and use that as the shadow cost.

---

## 5.2 Secondary Market Impacts

Projects affect not just the primary market where they operate, but also related markets — **secondary markets**. Should these secondary impacts be counted in a CBA?

The answer is: *it depends on whether those secondary markets are distorted*.

### When to Ignore Secondary Markets

Consider a road-widening project that reduces trucking costs. Lower trucking costs reduce the price of goods transported by truck. Lower goods prices affect retail markets. Those retail market impacts affect restaurant supply chains. And so on, in an indefinite chain of ripple effects.

In general, **secondary market impacts should be ignored if both the primary and secondary markets are competitive**. The reason is that in competitive markets, all these ripple effects are already captured in the primary market surplus change. Counting them separately would be double-counting.

The rule is: if there are no distortions in secondary markets, your primary-market surplus calculation already captures the full social benefit. Go no further.

### When Secondary Markets Matter

Secondary markets *do* matter when they are **distorted**. Consider a tax on peanut butter that raises its price. This has a direct welfare effect on peanut butter consumers. But peanut butter and almond butter are **substitutes** — as the price of peanut butter rises, consumers switch to almond butter. In the almond butter market, which is also taxed, this demand increase generates additional tax revenue (a gain to the government) and some additional deadweight loss. These secondary market effects are real and should be included in a full welfare analysis.

The key principle: **include secondary market impacts only when those markets contain pre-existing distortions** (taxes, subsidies, monopoly pricing, externalities). In an undistorted secondary market, the effects wash out.

### The Multiplier Effect Fallacy

Politicians and project proponents are fond of claiming that every dollar of public investment generates multiple dollars of economic activity through "multiplier effects." The claim usually looks something like this: "This stadium will create $500 million in direct spending, plus 3× that in multiplier effects, for a total economic impact of $2 billion."

From a CBA perspective, **multiplier effects typically should not be added to primary benefits**. Here is why: multiplier effects describe how spending ripples through an economy via income effects. But this spending involves resources that have opportunity costs — they could have been used elsewhere. Unless the economy is operating well below capacity (significant unemployment of resources), the multiplier merely redistributes activity from one part of the economy to another. It does not represent a net addition to social welfare.

There is a legitimate case for including Keynesian multiplier effects during deep recessions, when resources would otherwise be idle. But applying multipliers to normal-times CBA systematically overstates project benefits. The observation that economic impact analyses of sports arenas, convention centers, and festivals routinely produce glowing numbers while rigorous CBAs typically find neutral or negative outcomes is well-documented in the academic literature.

---

# Module 6: Discounting and Time

## 6.1 The Time Value of Money

Money has time value. A dollar available today can be invested to produce more than a dollar in the future. This is not merely a financial convention — it reflects a deep truth about how economies work: resources employed now generate returns over time, and individuals prefer present consumption over future consumption.

### Present Value and Future Value

The relationship between present and future values is:

\[ FV = PV \cdot (1 + r)^t \]

Equivalently, a future payment of \(FV\) received \(t\) years from now has a present value of:

\[ PV = \frac{FV}{(1 + r)^t} \]

For a stream of annual payments \(B_t\) over \(T\) years, the NPV is:

\[ NPV = \sum_{t=0}^{T} \frac{B_t - C_t}{(1 + r)^t} \]

### Annuities and Perpetuities

When a project generates a constant annual net benefit \(A\) for \(T\) years, the NPV simplifies to:

\[ NPV = A \cdot \frac{1 - (1+r)^{-T}}{r} \]

The term \frac{1-(1+r)^{-T}}{r}\) is the **annuity factor**. When \(T \to \infty\), this becomes the **perpetuity formula**: \(NPV = A / r\). Interestingly, even for long-lived projects, the annuity factor converges quickly. A 5% discount rate makes a 50-year perpetuity worth only 10% more than a 30-year annuity — the distant future has minimal present value.

### Alternative Decision Criteria

**Internal Rate of Return (IRR)**: the discount rate at which NPV = 0. A project passes the IRR test if IRR > the social discount rate. The IRR is popular in the private sector but has well-known pathologies when applied to public projects: it assumes cash flows are reinvested at the IRR (unrealistic for large rates), it can give multiple solutions when cash flows change sign more than once, and it cannot be used to rank mutually exclusive projects.

**The Roll-Over Method**: for comparing projects with different lifespans, repeat each project until they have a common terminal date. The NPV of the longer-lived project will naturally dominate, unless the shorter-lived project's roll-overs make it competitive.

**Equivalent Annual Net Benefit (EANB)**: converts NPV into an equivalent uniform annual flow. Two projects with different lifespans can be compared by their EANBs even without using the roll-over method:

\[ EANB = NPV \cdot \frac{r}{1 - (1+r)^{-T}} \]

**Payback Period**: the number of years required to recover the initial investment from net benefits. Despite its simplicity and popularity in business, the payback criterion ignores all cash flows after the payback date and fails to account for the time value of money. It should not be used as a primary decision criterion in public CBA.

---

## 6.2 Inflation: Nominal vs. Real

Economic analysis must carefully distinguish between **nominal** and **real** values.

**Nominal values** are measured in current dollars — the actual dollar amounts paid or received. **Real values** strip out inflation, expressing everything in dollars of constant purchasing power (e.g., "2020 dollars").

The price level is typically measured by the **Consumer Price Index (CPI)**, which tracks the cost of a fixed basket of consumer goods, or the **GDP deflator**, which tracks the price level of all goods and services produced in the economy. The GDP deflator is a more comprehensive measure but changes in its composition over time; the CPI is more stable but may not reflect the prices relevant to a particular project.

### The Fisher Equation

When performing CBA in nominal terms, use the **nominal discount rate** \(i\). When working in real terms (constant dollars), use the **real discount rate** \(r\). The relationship between them is given by the **Fisher equation**:

\[ r = \frac{i - m}{1 + m} \]

where \(m\) is the inflation rate. For small inflation rates, this approximates to \(r \approx i - m\).

**The cardinal rule of CBA**: be consistent. If benefits and costs are expressed in nominal dollars, discount at the nominal rate. If they are in real (constant) dollars, discount at the real rate. Mixing real benefits with a nominal discount rate, or vice versa, will systematically distort the NPV.

In practice, most public CBAs work in real terms. This avoids the need to forecast future price levels and makes it easier to compare costs and benefits across different time periods.

---

## 6.3 The Social Discount Rate

### Why Social Discounting Is Different

In private investment analysis, the appropriate discount rate is the firm's cost of capital — the rate of return it could earn on alternative investments. For public projects, the choice of discount rate is more complex and more consequential.

Two schools of thought have dominated the policy debate:

**The prescriptive approach** argues that the social discount rate should reflect *how much society ought to discount the future*, based on ethical principles about intergenerational equity. If future generations have equal moral standing with present generations, perhaps we should use a very low discount rate — or even zero. This view was famously articulated by the economist Nicholas Stern in his 2006 *Stern Review on the Economics of Climate Change*, which used a near-zero "pure rate of time preference" and concluded that aggressive climate action was urgently cost-effective.

**The descriptive approach** argues that the social discount rate should reflect *how society actually trades off present against future*, as revealed by market interest rates. Nordhaus (2008) criticized the Stern Review for using an unrealistically low discount rate and argued for rates of 5–6%, which substantially reduces the present value of future climate damages and implies a more gradual approach to emissions reduction.

The Stern–Nordhaus debate is not merely academic. At Stern's 1.4% consumption discount rate, a $100 benefit arriving in 100 years is worth **$24.90 today**. At Nordhaus's higher rate (~4.3%), the same future benefit is worth only roughly **$1.48 today** — a 16-fold difference that drives entirely different policy conclusions. Stern's policy prescription: cut emissions roughly 3% per year immediately, with an optimal carbon price of ~$85/tonne. Nordhaus's prescription: go slowly, with an optimal carbon price of ~$7.40/tonne rising gradually. Neither position is purely technical — both embed deep ethical judgments about intergenerational equity that no model can resolve. As Arrow's impossibility theorem would predict, there is no neutral, preference-aggregating procedure for making these judgments.

### The Marginal Rate of Time Preference

The **marginal rate of time preference (MRTP)** is the premium individuals require to postpone consumption. In a competitive capital market, the real risk-free interest rate equals the MRTP. In practice, the MRTP is estimated from observed savings behaviour, long-term government bond yields, or explicit ethical arguments.

The standard decomposition (Ramsey formula) is:

\[ r = \delta + \eta \cdot g \]

where \delta\) is the "pure rate of time preference" (impatience), \eta\) is the elasticity of marginal utility of consumption, and \(g\) is the expected growth rate of per capita consumption. This formula says: if the economy is growing (g > 0), future people will be richer and therefore each additional dollar of consumption is worth less to them than it is to present consumers — justifying a positive discount rate even with zero pure impatience.

### The Arrow-Lind Theorem

An important argument for using a *lower* social discount rate for public projects than the market rate comes from the **Arrow-Lind Theorem** (1970). The theorem shows that when a government project's risk is spread across a large number of taxpayers, each individual bears only a tiny amount of risk, and the risk premium associated with that risk approaches zero as the number of taxpayers grows.

The implication: public projects should be evaluated at the *risk-free* rate, not at the risk-adjusted market rate that private firms use. This is because the government's ability to diversify risk across millions of taxpayers eliminates the risk premium that would be required by a private investor bearing the full project risk.

### What Rate Should Canada Use?

In practice, Canada's Treasury Board Secretariat has historically recommended a real discount rate of approximately **10%** — reflecting the government's estimate of the social opportunity cost of capital (the foregone return on private investment crowded out by public borrowing). Many academic economists argue this is too high; they prefer rates in the **7%** range, reflecting a more moderate view of crowding out. For long-horizon projects like climate policy or nuclear waste storage, even 7% implies near-zero weight on impacts beyond 50–100 years, which many find ethically troubling.

---

# Module 7: Risk and Uncertainty

## 7.1 The Distinction Between Risk and Uncertainty

The study of how decisions should be made when outcomes are not known in advance was famously clarified by the economist Frank Knight in his 1921 book *Risk, Uncertainty, and Profit*. Knight drew a sharp distinction that remains fundamental to CBA:

**Risk** exists when the possible outcomes and their probabilities are known. A roulette wheel has risk: 38 possible outcomes, each with probability 1/38. An actuarial table assigns known probabilities to death at each age. When probabilities are known, expected-value calculations can guide decisions.

**Uncertainty** (sometimes called "Knightian uncertainty") exists when the possible outcomes or their probabilities are not known. A novel technology whose failure modes haven't been mapped. A pandemic disease whose transmission rate is unknown. Climate tipping points that may or may not be triggered. Uncertainty cannot be handled by expected-value calculations alone — there is no well-defined probability distribution to compute expectations over.

This distinction matters enormously for policy. Treating genuine uncertainty as if it were risk — plugging in arbitrary probability numbers and computing expected values — gives false confidence in the analysis.

---

## 7.2 Decision-Making Under Risk

### Expected Value Analysis

When probabilities are known, the standard decision criterion is **expected value (EV)**: the probability-weighted average of all possible outcomes. A project with outcomes \(V_i\) occurring with probabilities \(p_i\) has expected value:

\[ EV = \sum_i p_i \cdot V_i \]

An **expected net social benefit** criterion says: accept the project if the expected NSB is positive.

### Risk Aversion and Utility Theory

Expected value analysis implicitly assumes **risk neutrality** — the decision-maker is indifferent between a certain $50 and a 50-50 gamble between $0 and $100. Most people are not risk neutral: they prefer certainty and are willing to pay a **risk premium** to avoid variance. This is **risk aversion**.

Risk aversion is captured by a **concave utility function** \(U(W)\), where \(U''(W) < 0\). A concave utility function implies that the marginal utility of wealth decreases as wealth increases — an extra dollar is worth more to someone who has little money than to someone who is wealthy. Under risk aversion:

\[ E[U(W)] < U(E[W]) \]

That is, the expected utility of a gamble is less than the utility of the expected value of the gamble. Decision-makers maximize expected utility, not expected monetary value.

**Risk loving** behaviour corresponds to a convex utility function \(U''(W) > 0\) — the decision-maker prefers gambles to certainties of equal expected value. This is less common as a general disposition, but people exhibit risk-loving behaviour in specific contexts (gambling, extreme sports, lottery purchase).

### Decision Trees

For complex projects with sequential decisions and uncertain outcomes, **decision trees** provide a structured way to map out scenarios. Each node represents either a decision point (choosing among options) or a chance event (governed by known probabilities). Working backwards from terminal outcomes, the analyst computes expected values at each node and identifies the optimal decision path.

The COVID-19 vaccination decision offers a compelling real-world illustration. In early 2020, governments had to decide how much to invest in vaccine development before knowing whether vaccines would succeed. The decision tree would have included branches for vaccine success/failure, different speeds of vaccine delivery, and varying disease severity scenarios. Even under highly uncertain probabilities, the enormous potential benefits justified large-scale investment — a conclusion borne out ex-post.

---

## 7.3 Decision-Making Under Uncertainty

When probabilities are unknown, we cannot compute expected values. Several alternative decision criteria have been proposed.

### The Bayes (Laplace) Criterion

In the absence of any information about probabilities, assign **equal probability** to all possible outcomes and maximize expected value. This is sometimes called the "principle of insufficient reason" — if we have no reason to think one scenario more likely than another, treat them as equally likely.

This criterion is intuitive but arbitrary. Why equal probabilities? Why not weight scenarios by how plausible they seem to the analyst?

### Maximin (Maxi-min)

The **maximin criterion** directs the decision-maker to choose the option with the best *worst-case* outcome. This is an extremely conservative, risk-averse rule: it focuses entirely on avoiding catastrophic scenarios and ignores upside potential.

For potentially catastrophic or irreversible risks (nuclear accidents, species extinction, global pandemics), the maximin criterion has strong appeal. **The Precautionary Principle** in environmental policy is a version of maximin reasoning. However, applied literally to every decision, maximin would paralyze most activity — almost anything can go catastrophically wrong in some scenario.

### Maximax

The **maximax criterion** does the opposite: choose the option with the best *best-case* outcome. This is an optimistic, risk-loving criterion. It is rarely recommended for serious policy analysis because it ignores downside risks entirely.

### Minimax Regret

The **minimax regret criterion** defines *regret* as the difference between the outcome you achieved and the best outcome you could have achieved if you had known the state of the world in advance. Minimax regret minimizes the maximum regret across all possible scenarios.

This criterion is intuitively appealing because it captures the psychological reality of regret and may avoid extreme outcomes. However, it violates the axiom of independence of irrelevant alternatives — adding a new (irrelevant) option to the choice set can change the minimax-regret decision. This is a serious theoretical weakness.

### Hurwicz Criterion

The **Hurwicz criterion** is a compromise between maximin and maximax. The analyst chooses a **coefficient of optimism** \(\alpha \in [0, 1]\) and computes a weighted average of each option's best and worst outcomes:

\[ H = \alpha \cdot (\text{best outcome}) + (1 - \alpha) \cdot (\text{worst outcome}) \]

With \alpha = 0\), this reduces to maximin. With \alpha = 1\), it becomes maximax. The analyst's subjective degree of optimism determines \alpha\). This criterion is flexible but relies on a subjective parameter that is hard to defend in public analysis.

---

## 7.4 Sensitivity Analysis and Quasi-Option Value

### Sensitivity Analysis

Since CBAs rest on many uncertain assumptions, it is essential to test how sensitive the conclusions are to those assumptions. Three levels of sensitivity analysis are standard:

**Partial sensitivity analysis** varies one parameter at a time — holding all else equal — to identify which parameters the NPV is most sensitive to. This identifies the "critical variables" that deserve the most attention in data collection.

**Best-case/worst-case analysis** simultaneously sets all parameters to their most favourable (or least favourable) values. This gives an envelope of possible outcomes. If the NPV is positive even in the worst case, the project is robust; if it is negative in the best case, it should be rejected.

**Monte Carlo simulation** treats uncertain parameters as random variables with specified probability distributions, then simulates thousands of possible outcomes. The result is a probability distribution over NPV. This is the most informative form of sensitivity analysis, but it requires specifying probability distributions for each uncertain parameter — which may not be feasible under genuine uncertainty.

### Quasi-Option Value

When a project involves **irreversible decisions** — damming a river, draining a wetland, bulldozing an ecosystem — and the future holds relevant information that is not yet available, there is value in *waiting*. This value is called **quasi-option value** (or **option value**).

The basic intuition: by waiting, you avoid the possibility of taking an irreversible action that you would later regret when better information arrives. This quasi-option value represents a real benefit of delay, even apart from any direct benefits from preservation.

The concept was formalized by Arrow and Fisher (1974) and has important implications for environmental CBA. It provides a rigorous economic argument for the Precautionary Principle: even if the expected NPV of development is positive, the option value of waiting might tip the balance toward preservation — especially for unique or irreplaceable natural assets.

---

# Module 8: Revealed Preference and Experimental Methods

## 8.1 Experimental Approaches in CBA

Many of the most important benefits and costs in CBA are not traded in markets. How do you value a 10% reduction in the risk of a fatal car accident? How much is clean air worth to an asthma sufferer? To answer these questions without directly observing market prices, economists use two broad strategies: revealed preferences (inferring values from observable behaviour) and stated preferences (asking people directly). This module covers the first; Module 9 covers the second.

### Classical Experiments

**Classical randomized controlled trials (RCTs)** are the gold standard for establishing causal effects. A group of subjects is randomly assigned to treatment (receives the policy or project) or control (does not), and the difference in outcomes identifies the causal impact.

RCTs are powerful but expensive, slow, and often ethically constrained. You cannot randomly assign some families to live near a polluted site to study health effects. You cannot randomly expose some workers to unsafe conditions to study the value of safety.

Key concepts for evaluating experimental evidence:
- **Internal validity**: does the study identify a true causal effect within the study population?
- **External validity**: does the effect generalize to other populations, places, and contexts?
- **Selection bias**: do treatment and control groups differ systematically in ways that confound the treatment effect?

### Quasi-Experimental Designs

When true random assignment is impossible, quasi-experimental methods exploit *natural* sources of variation to mimic experimental conditions:

**Difference-in-differences (DiD)**: compare the change in outcomes for a treated group before and after treatment to the change for a control group over the same period. This removes time-invariant confounders and common time trends.

**Regression discontinuity (RD)**: exploit sharp eligibility cutoffs (e.g., a program that applies only to households below a certain income threshold) to identify effects near the threshold, where treatment and control units are otherwise comparable.

**Instrumental variables (IV)**: find an instrument that affects treatment assignment but has no direct effect on outcomes. This isolates the causal effect of treatment on outcomes.

These methods have transformed applied microeconomics over the past three decades and are increasingly the standard toolkit for rigorous impact evaluation.

---

## 8.2 Indirect Market Methods for Non-Market Valuation

### The Market Analogy

The core insight of revealed preference methods is that even when a good (like clean air or quiet) is not traded directly in markets, people's choices in *related* markets reveal how much they value it. If people pay more for houses near quiet parks than near noisy highways, the price differential tells us something about their WTP for quiet.

### Trade-Off Methods

**Value of Travel Time Savings (VTS)**: When people choose between transportation modes — driving (faster but costly) versus transit (slower but cheap) — their choices reveal how they value time. Empirical studies typically find VTS in the range of 40–60% of the hourly wage, depending on the quality of travel time and trip purpose.

**Value of Statistical Life (VSL)**: This is perhaps the most important and controversial parameter in all of CBA. The VSL is not the value placed on any specific person's life — it is derived from WTP for *small* reductions in mortality risk. If a thousand people each pay $600 for a safety device that reduces their annual mortality risk by 1-in-1000, then collectively they pay $600,000 to prevent 1 expected death, implying a VSL of $600,000.

Methods for estimating VSL include:
- **Forgone earnings approach**: value a life at the present value of lifetime earnings. This is theoretically weak (ignores WTP over and above financial contributions) and ethically problematic (implies rich lives are worth more than poor lives).
- **Consumer purchases of safety**: revealed WTP for safety products (car airbags, smoke detectors, safety equipment).
- **Labour market studies (hedonic wage studies)**: workers in riskier occupations demand a wage premium. This wage-risk tradeoff identifies VSL. Modern estimates typically yield VSLs of $6–$14 million (USD, 2020 prices) for working-age adults in developed countries.

The U.S. Department of Transportation uses a VSL of approximately **USD$13.7 million** (2024 base year). Canada's Treasury Board guidance recommends around CAD$6–7 million, but a 2022 meta-analysis by Chestnut and de Civita — using preferred studies with representative samples — found a weighted mean of **CAD$13 million (2020 dollars)**, which is 43% higher than the government's current recommended figure. This gap is consequential: government agencies using the older, lower number are systematically under-investing in life-saving regulations. The variation reflects genuine methodological differences but also political and bureaucratic inertia — updating VSL estimates is a technically uncontroversial step that somehow always gets delayed.

### Intermediate Good Method

When a natural resource or environmental good is an **intermediate input** into an economic activity, it can be valued by its marginal contribution to that activity's output. The value of water for irrigation, for example, can be estimated from how much agricultural output declines when water is reduced by one unit.

### Defensive Expenditures

People and firms sometimes spend money to *protect themselves* from an environmental bad — buying air purifiers, bottled water, sound-proofing. These **defensive expenditures** provide a lower bound on the WTP to avoid the bad: if you spend $300/year on air filters, you are willing to pay at least $300 to have clean air (otherwise you would not buy the filters).

### Asset Valuation

The value of many environmental goods is capitalized into asset prices. A home near a quiet, clean lake is worth more than an otherwise identical home near a polluted site. The difference is a measure of WTP for the environmental amenity.

### Hedonic Pricing

**Hedonic pricing** uses statistical methods to decompose the price of a complex good (like a house or job) into the implicit prices of its constituent attributes. A house price regression might control for square footage, number of bedrooms, age of structure, school quality, and distance to amenities — and then the coefficient on an environmental variable (proximity to a park, local air quality) reveals the implicit price of that characteristic.

Hedonic property value studies have been used to estimate the benefits of air quality improvements, noise reductions, and superfund site cleanups. A landmark study by Chay and Greenstone (2005) found that a one-unit reduction in total suspended particulates raised housing values by approximately 0.2–0.4%, consistent with households having meaningful WTP for air quality.

### Travel Cost Method (TCM)

The **travel cost method** uses visits to a recreation site (park, beach, nature reserve) to infer the site's value. People who live farther away face higher "costs" (time + transportation) to visit; by observing how visitation rates fall with distance, the analyst can trace out a demand curve for the site's amenity.

The demand curve for recreation visits represents WTP for the site's services. The area under this demand curve (above the minimum cost) is the consumer surplus — the recreation value of the site. TCM is most appropriate for sites that attract visitors who make specific trips for that purpose (rather than passing by incidentally).

---

# Module 9: Non-Market Valuation — Total Economic Value

## 9.1 Total Economic Value Framework

The natural environment provides a far richer array of values than those captured by market prices or even by travel costs and hedonic regressions. To capture the full social value of an ecosystem, resource, or environmental policy, CBA practitioners use the **Total Economic Value (TEV)** framework:

\[ TEV = UV + OV + NUV \]

where:
- \(UV\) = **Use value** (value derived from direct or indirect use)
- \(OV\) = **Option value** (value of the *option* to use in the future)
- \(NUV\) = **Non-use value** (value independent of any current or future use)

### Use Value

**Direct use value** comes from activities that directly consume or interact with the resource: fishing, hiking, drinking clean water, breathing clean air.

**Indirect use value** derives from ecosystem services that support economic activity without direct extraction: flood control, carbon sequestration, pollination services. These are the "invisible" benefits of intact natural systems that are hardest to value but often the most important.

### Option Value

**Option value** is the premium people are willing to pay today to preserve the *option* to use a resource in the future, even if they do not currently use it. A non-hiker may still value the option to visit a wilderness area someday, even if they never actually exercise that option. This is analogous to the value of a financial option: it is positive as long as there is positive probability of the option being exercised and the asset might be irreversibly lost.

### Non-Use Value

This is perhaps the most philosophically provocative component of TEV. Non-use (or "passive use") values include:

**Existence value**: the value people place on knowing that something exists, independent of any current or future use. Many people feel enriched by knowing that the Amazon rainforest exists, the blue whale hasn't gone extinct, or the Grand Canyon remains undammed — even if they will never personally visit these places.

**Bequest value**: the value of ensuring that future generations will have the opportunity to experience or benefit from a resource.

**Altruistic value**: the satisfaction from knowing that others can benefit from a resource.

Non-use values are real and potentially large, but they pose extreme measurement challenges. They cannot be revealed by any observed behaviour — they must be *stated* by survey respondents.

---

## 9.2 Existence Value and Non-Use Values

The inclusion of existence values in CBA remains controversial. Skeptics argue that:

1. Non-use values are not constrained by budget realities in the same way that market prices are — respondents can state any value they wish without having to actually pay it.
2. Aggregating existence values over entire populations can produce enormous numbers that dwarf all other project impacts.
3. Stated existence values may reflect social desirability bias (saying what sounds virtuous) rather than genuine preference intensity.

Supporters counter that:

1. Existence values are real psychological states with genuine welfare implications.
2. Ignoring them systematically understates the cost of environmental destruction.
3. Methodological improvements in survey design can substantially reduce bias.

A common **rule of thumb** in the literature: if a project would damage a natural asset for which it is plausible that large numbers of people have significant existence values (charismatic species, iconic landscapes, culturally significant sites), non-use values should be actively estimated rather than assumed to be zero. Assuming zero is itself a strong and often unjustifiable assumption.

---

## 9.3 Contingent Valuation Method

The **contingent valuation method (CVM)** is the most widely used technique for estimating non-use values. It presents respondents with a hypothetical market — a carefully constructed scenario describing a policy change — and asks how much they would pay for it.

### The Steps of CVM

**Step 1: Construct the hypothetical market.** The policy change must be described in enough detail that respondents understand what they are being asked to value. The institutional mechanism for provision and payment must be specified.

**Step 2: Survey administration.** The survey can be administered by mail, telephone, in-person, or online. Response mode affects the quality and magnitude of responses, and choice of mode should be considered carefully.

**Step 3: Bid elicitation.** Several formats are used to ask about WTP:
- **Open-ended**: "What is the maximum you would pay?" Simple but produces many zero and extreme responses.
- **Payment card**: present a range of dollar values and ask the respondent to indicate the maximum they would pay. Anchoring effects are a concern.
- **Bidding game**: start with a trial bid, adjust up or down based on yes/no responses. Anchoring is a major problem.
- **Referendum (dichotomous choice)**: "Would you pay $X for this policy?" — where $X varies randomly across respondents. This format mimics real market decisions and is considered theoretically superior. Endorsed by the NOAA Blue Ribbon Panel (1993) after the Exxon Valdez disaster.

**Step 4: Estimate the bid curve.** Use regression analysis to relate stated WTP to the bid amount (for referendum format) or to respondent characteristics (for open-ended format).

**Step 5: Aggregate.** Multiply per-household WTP by the number of households in the affected population to get total willingness to pay.

### The Exxon Valdez and the Battle Over CVM

The CVM's biggest moment in the public spotlight came after the 1989 Exxon Valdez oil spill, which released 11 million gallons of crude oil into Prince William Sound, Alaska. The U.S. government commissioned a CVM study to estimate the non-use (existence) value of the damaged ecosystem as part of the damages case against Exxon.

The study (Carson et al., 1992) produced an estimate of **$2.8 billion in non-use (passive use) damages** — the loss to American households of knowing that a pristine Alaskan wilderness had been contaminated. Exxon responded by funding its own team of economists to attack the methodology; the resulting debates produced two entire academic edited volumes and some of the most methodologically important papers in environmental economics. Paul Diamond and Jerry Hausman published a devastating 1994 critique concluding that "*no number is better than a CVM number*" — their core complaint was the "embedding effect": survey respondents gave essentially the same WTP to save 2,000 birds as to save 200,000 birds, suggesting they were expressing "moral satisfaction" rather than measuring genuine welfare changes.

The actual legal settlement: Exxon paid **$1 billion** in damages and restitution — well below the $2.8 billion CV estimate, but still one of the largest environmental damage payments in history.

The NOAA Panel (1993), chaired by Nobel laureates Kenneth Arrow and Robert Solow, concluded that CVM could produce reliable estimates *if* conducted according to best practices — especially using the referendum format, in-person interviews, careful scenario description, and including follow-up debriefing questions. The "NOAA guidelines" remain the gold standard for CVM practice.

---

## 9.4 Biases in CVM Estimates

CVM studies are susceptible to a long list of potential biases that can distort WTP estimates significantly:

**Sampling bias**: if the survey sample does not represent the relevant population (people with standing), the aggregate estimate will be distorted.

**Strategic bias**: respondents who understand that their stated WTP will influence policy outcomes may overstate WTP (free-riding problems actually suggest understatement, but environmental advocates may overstate to push for conservation). In practice, strategic behaviour in referendum-format CVM appears limited.

**Design bias** (framing effects): the way the question is framed, the order of questions, and the payment vehicle (taxes vs. entrance fees vs. donations) all affect stated WTP. These effects can be large.

**Mental accounting bias**: respondents may draw on a general "environmental donation" mental account rather than carefully thinking about the specific good being valued. This is related to the **embedding effect** — WTP for a specific program is often not much less than WTP for a broader program that includes it. Valuing "cleaning up one lake in Ontario" produces similar responses to "cleaning up all lakes in Ontario."

**Hypothetical market bias**: because respondents don't actually pay what they say they will, their stated values may be inflated relative to their true WTP. The ratio of hypothetical to real WTP has been estimated at 1.5–3× in calibration studies.

**Yea-saying**: some respondents say "yes" to any reasonable-sounding proposal simply because they want to be agreeable, regardless of their actual preferences.

---

## 9.5 WTP vs. WTA: The Endowment Effect

Theory predicts that for small income changes, **WTP** (what you would pay to gain a good) and **WTA** (willingness to accept compensation to give up a good) should be approximately equal. In practice, WTA is consistently and substantially larger than WTP — often by a factor of 2–5 for environmental goods.

This gap, known as the **endowment effect** or **loss aversion**, was identified experimentally by Kahneman and Tversky and is a cornerstone of **behavioural economics**. People feel losses more acutely than equivalent gains — a loss of $100 causes about twice as much psychological pain as a gain of $100 causes pleasure. This asymmetry means that the welfare measure used in CBA matters:

- **WTP** is appropriate when the baseline scenario is that the good does not exist, and the policy would create it ("gains" framing).
- **WTA** is appropriate when the baseline is that the good already exists, and the policy would destroy it ("losses" framing).

For environmental goods that already exist (existing wilderness, existing species), **WTA is theoretically the correct welfare measure** — we are asking how much compensation people require for their loss. But WTA estimates are so much larger and more variable than WTP estimates that practitioners overwhelmingly prefer WTP in applied work. The NOAA Panel endorsed WTP over WTA for CVM studies, citing its conservatism (underestimating rather than overestimating losses) and its greater reliability.

---

# Module 10: Distributional Concerns

## 10.1 Who Benefits? The Kaldor-Hicks Framework and Its Discontents

Standard CBA aggregates benefits and costs across all affected parties without weighting them by income. A dollar's benefit to a billionaire counts the same as a dollar's benefit to someone in poverty. This is the Kaldor-Hicks criterion in action: if aggregate benefits exceed aggregate costs, the project passes — regardless of who bears the costs and who reaps the benefits.

The implications can be disturbing. Consider a policy that takes $1 million from 10,000 low-income households (averaging $100 each) and delivers $1.5 million to 10 wealthy households ($150,000 each). This policy has a positive NPV of $500,000 and would pass standard CBA. Most people's moral intuitions rebel against this outcome — but standard CBA cannot see the problem.

### Three Responses

Analysts faced with this critique can take three approaches:

1. **Ignore distributional impacts** and apply the Kaldor-Hicks criterion. This is defensible only if we believe society will separately address distributional concerns through progressive taxation and transfers — and if those mechanisms actually function well.

2. **Report impacts by group** without weighting them. This is the most common approach: identify the income distribution of beneficiaries and cost-bearers, present these distributional impacts transparently alongside the aggregate NPV, and leave the weighting to policymakers.

3. **Apply distributional weights** to different groups and compute a weighted NPV. This is the most ambitious approach and is explored in Modules 10b–10d.

---

## 10.2 Income Distribution and CBA

### One Person, One Vote vs. One Dollar, One Vote

Standard CBA implements an implicit "one dollar, one vote" rule: those with higher WTP have more influence on whether a project passes. Critics argue that a democratic society committed to "one person, one vote" should be uncomfortable with this principle.

The yacht excise tax example illustrates the tension. In 1991, the U.S. Congress imposed a 10% luxury tax on yachts priced above $100,000. The intent was progressive redistribution: make the wealthy pay more. The actual outcome: the domestic yacht industry collapsed as wealthy buyers purchased abroad, shipyard workers lost jobs, and the tax was repealed in 1993. A CBA of the yacht tax might find negative net benefits, even though the intent was redistributive. This illustrates that well-intentioned redistributive policies can have perverse efficiency consequences.

### Diminishing Marginal Utility of Income (DMUI)

The theoretical underpinning of distributional weighting is **diminishing marginal utility of income (DMUI)**: as income rises, each additional dollar generates less additional welfare. This is widely supported both empirically and by most ethical frameworks.

If \(U(Y)\) is the utility of income \(Y\), DMUI means \(U''(Y) < 0\). Redistributing income from rich to poor increases total utility even without changing the total income — the rich lose less utility than the poor gain.

### Social Welfare Functions

A **social welfare function (SWF)** maps individual utility levels into a social welfare ranking. Different SWFs encode different distributional judgments:

- **Utilitarian SWF**: \(W = \sum_i U_i\). Sum individual utilities. With DMUI, this favours redistribution to low-income individuals, but does not fully prioritize equality.
- **Rawlsian (Maximin) SWF**: \(W = \min_i U_i\). Maximize the utility of the worst-off individual. This is extremely egalitarian.
- **Iso-elastic SWF**: \(W = \sum_i \frac{U_i^{1-\sigma}}{1-\sigma}\). A parameterized family; \sigma = 0\) gives utilitarianism, \sigma \to \infty\) approaches Rawls.

---

## 10.3 Distributional Weights in Practice

### The Weighted CBA Formula

Distributional weighting modifies the standard NPV formula to give greater weight to impacts on lower-income groups:

\[ NPV_{weighted} = \sum_j w_j \cdot NPV_j \]

where \(w_j\) is the distributional weight for group \(j\) and \(NPV_j\) is the (unweighted) net present value accruing to group \(j\).

The weights are typically set relative to a reference income group (often the average household): households with below-average income receive weights greater than 1, and households with above-average income receive weights less than 1.

### Comparing Weighted and Unweighted Analysis

Distributional weighting can change project rankings significantly. Consider two projects:
- Project A: $100 benefit to 1,000 low-income families, $0 to wealthy families. Unweighted NPV = $100,000.
- Project B: $50 benefit to 1,000 low-income families, $100 benefit to 500 wealthy families. Unweighted NPV = $100,000.

Both projects have the same unweighted NPV. But if low-income families receive weight 2 and wealthy families receive weight 0.5:
- Weighted NPV of Project A = $200,000
- Weighted NPV of Project B = $125,000

Project A is now clearly preferred on distributional grounds, even though they were indistinguishable under standard CBA.

---

## 10.4 Determining Distributional Weights: The Iso-Elastic Approach

### Iso-Elastic Utility

The most widely used utility specification for computing distributional weights is the **iso-elastic (constant relative risk aversion) utility function**:

\[ U(Y) = \frac{Y^{1-\eta}}{1 - \eta} \]

where \eta > 0\) is the **elasticity of marginal utility of income**. With this utility function, marginal utility is:

\[ U'(Y) = Y^{-\eta} \]

which decreases with income at a rate governed by \eta\). The distributional weight for a household with income \(Y_j\) relative to a reference income \(\bar{Y}\) is:

\[ w_j = \left(\frac{\bar{Y}}{Y_j}\right)^{\eta} \]

### The Value of η

Empirical estimates of \eta\) typically fall in the range of **1.2 to 1.34** for Canada, derived from analysis of income tax structures (what implicit redistribution does the tax code reveal about society's preferences?). These estimates suggest moderate but meaningful concern for distributional equity.

At \eta = 1.2\), a household with half the average income receives a distributional weight of approximately 2.3. A household with double the average income receives a weight of approximately 0.44.

### Internal vs. External Distributional Weights

An important distinction:

**External distributional weights** are specified by the analyst based on the chosen utility function. These are consistent and transparent but require a value judgment about \eta\).

**Internal distributional weights** are implied by the decision-maker's revealed choices: if the government chose project X over project Y even though X had lower unweighted NPV, the implied distributional weights are those that make project X preferred. Working backwards from past decisions reveals the government's *de facto* distributional preferences, even if these have never been explicitly stated.

The World Bank has a long history with distributional weighting in project appraisal. The approach was introduced in the 1970s (associated with Squire and van der Tak, 1975), fell out of favour in the 1980s as neoclassical efficiency analysis dominated, and has seen renewed interest in the 21st century as inequality concerns have risen on the global policy agenda.

---

# Module 11: Alternative Evaluation Methods

## 11.1 Cost-Effectiveness Analysis

**Cost-effectiveness analysis (CEA)** is a close cousin of CBA that sidesteps the most controversial step: monetizing benefits. Instead of asking "what are benefits worth in dollars?", CEA asks: "what is the least expensive way to achieve a given goal?"

### The Cost-Effectiveness Ratio

The **cost-effectiveness (CE) ratio** is:

\[ CE = \frac{C}{E} \]

where \(C\) is the cost and \(E\) is the effectiveness measure (e.g., lives saved, test score points gained, tonnes of CO₂ reduced). A lower CE ratio means more effectiveness per dollar spent.

### The Incremental Cost-Effectiveness Ratio

When comparing two programs that both achieve positive effectiveness, the **incremental cost-effectiveness (ICE) ratio** measures the *additional* cost of additional effectiveness:

\[ ICE = \frac{C_2 - C_1}{E_2 - E_1} \]

where Program 2 is more effective (and more expensive) than Program 1. This answers: "Is it worth paying more for the better program?"

### The Cost-Effectiveness Frontier (CEF)

When multiple programs achieve different levels of effectiveness at different costs, the **CEF** is the envelope of programs that cannot be improved: for any given effectiveness level, no other program achieves it more cheaply; for any given cost, no other program achieves more effectiveness.

Programs not on the CEF are either:
- **Dominated** by a program that costs less *and* achieves more — these should be immediately rejected.
- **Weakly dominated** by a convex combination of two other programs — these are also inefficient.

### When to Use CEA vs. CBA

CEA is preferable when benefits are genuinely difficult to monetize (health outcomes, educational achievement, safety) but comparable across alternatives. Its weakness: it cannot tell you whether the most cost-effective program is *worth doing at all*, only which among competing programs is most efficient. CBA answers both questions; CEA answers only the second.

**Ontario Math Education Example**: Suppose the Ministry of Education is evaluating three approaches to improving Grade 6 math scores: intensive tutoring (costly, effective), teacher training (moderate cost, moderate effect), and curriculum overhaul (moderate cost, high initial disruption but long-run benefit). CEA would plot these on a cost-effectiveness frontier and identify which program is on the frontier. But without a dollar value for a math score point, we cannot determine whether any of these programs is worth doing relative to, say, spending the same money on healthcare.

---

## 11.2 Cost-Utility Analysis

**Cost-utility analysis (CUA)** is a specialized form of CEA used primarily in healthcare, where effectiveness is measured in **quality-adjusted life years (QALYs)**.

### The QALY

A **QALY** is a measure of health outcome that combines:
- The *quantity* of life (years of survival)
- The *quality* of those years (a utility weight between 0 and 1)

\[ QALY = \text{Years of life} \times \text{Quality weight} \]

A year in perfect health has a QALY value of 1. Death has a QALY value of 0. A year spent with a chronic condition reducing health-related quality of life to 0.7 contributes 0.7 QALYs.

### Measuring Health Utility Weights

Three methods are used to measure the quality weight component:

**Health rating scale (visual analogue scale)**: respondents rate health states on a 0–100 scale, where 0 is death and 100 is perfect health.

**Time Trade-Off (TTO)**: respondents are asked how many years in perfect health they would accept in exchange for a longer period in the health state being valued. If someone is indifferent between 10 years in perfect health and 20 years with a condition, the condition's utility weight is 0.5.

**Standard Gamble (SG)**: respondents are offered a gamble between perfect health (with probability \(p\) and death (with probability \(1-p\), versus the certainty of living in the health state. The probability \(p\) at which the respondent is indifferent is the utility weight.

Standard gamble is theoretically most consistent with von Neumann-Morgenstern expected utility theory. In practice, TTO is more commonly used because it does not require respondents to process probabilistic reasoning.

### QALY Controversies

The QALY framework is widely used in healthcare technology assessment but is also deeply controversial. Critics argue that:

1. **QALYs discriminate against the elderly and disabled**: since elderly patients have fewer remaining life-years, treatments that extend their lives generate fewer QALYs. Similarly, treatments for people with chronic conditions generate fewer QALYs per year because their baseline quality weight is below 1.

2. **QALYs ignore severity**: a QALY gained by preventing mild discomfort is counted the same as a QALY gained by preventing severe suffering.

3. **The tyranny of the threshold**: healthcare systems that use a cost-per-QALY threshold (e.g., the UK's NICE uses £20,000–30,000/QALY) create perverse incentives for pharmaceutical companies to price drugs just below the threshold.

In Canada, the **Canadian Agency for Drugs and Technologies in Health (CADTH)**, through its **Common Drug Review (CDR)**, evaluates pharmaceuticals using CUA. Provincial formularies use these recommendations to decide which drugs to publicly fund.

QALY-based rationing also has a checkered political history. In 1989, Oregon attempted to explicitly prioritize Medicaid services by cost-per-QALY. The U.S. federal government rejected the plan in 1992 as violating the Americans with Disabilities Act — HHS Secretary Louis Sullivan explicitly stated: *"Oregon's plan in substantial part values the life of a person with a disability less than the life of a person without a disability."* The UK's NICE has faced persistent criticism for the same reason: by construction, QALY analysis implies that treatments for elderly patients (who have fewer remaining life-years) and patients with chronic conditions (whose baseline health utility is below 1.0) generate fewer QALYs per treatment, systematically disadvantaging these groups. NICE's cost-per-QALY threshold, which had not been formally updated since 1999, was finally revised in 2026 to approximately **£35,000/QALY** from the prior £20,000–30,000 range.

### Health Utility Instruments: The HUI

The **Health Utilities Index (HUI)**, developed at McMaster University, is a standardized questionnaire that generates utility weights for health states based on eight attributes: vision, hearing, speech, ambulation, dexterity, emotion, cognition, and pain. The HUI has been widely used in Canadian population health surveys and clinical trials.

---

## 11.3 Economic Impact Assessment

**Economic Impact Assessment (EIA)** is a technique used to estimate the total effects of a project on economic activity — jobs created, GDP generated, local income effects. It is routinely used to justify public investments in sports arenas, convention centers, festivals, and industrial facilities.

### The Multiplier Effect

EIA's signature concept is the **multiplier effect**: an initial injection of spending creates additional rounds of income and spending as the initial recipients spend their earnings, and so on. In input-output models, this cascade of spending is represented by the **Leontief inverse matrix**, which captures the total (direct + indirect + induced) effects of a demand shock.

A multiplier of 2 means that every $1 of initial spending generates $2 in total economic activity. Regional multipliers are typically in the range of 1.5–2.5, depending on how "leaky" the regional economy is (how much spending leaves the region).

### Why EIA Is Not CBA

Despite its surface similarity to CBA, EIA has fundamental differences:

1. **EIA counts gross impacts; CBA counts net impacts.** EIA counts the new jobs and spending generated by a project. CBA subtracts the opportunity cost: the jobs and spending that would have occurred anyway if the resources had been used elsewhere. In a fully employed economy, all EIA impacts are offset by losses elsewhere.

2. **EIA counts transfers.** Much of the "economic activity" counted in EIA is redistribution — spending that moves from taxpayers to project workers, not new social value created.

3. **EIA ignores costs.** EIA typically only counts the positive impacts (jobs created, output generated) and ignores the negative impacts (taxes collected to fund the project, environmental damage, opportunity costs of public resources).

### Five Critiques of EIA

Academic economists have been devastating critics of EIA as applied to public spending decisions:

1. **The substitution effect**: dollars spent on a stadium are not spent at restaurants, cinemas, or other local businesses. Fans do not magically produce more income; they reallocate existing income.

2. **The counterfactual problem**: what would have happened to the resources if not spent on this project? A rigorous analysis requires specifying this counterfactual and subtracting it.

3. **The leakage problem**: multiplier estimates assume spending stays local. In practice, much of it leaks to imported goods, national chains, and out-of-region workers.

4. **The displacement effect**: new activity in one sector crowds out activity in competing sectors.

5. **Regional vs. national perspective**: what looks like an economic gain at the regional level may simply be redistribution from other regions at the national level.

### The Sports Arena Literature

The most rigorous empirical literature on sports arena economics is almost unanimous: professional sports teams generate far less economic activity for their host cities than the impact studies commissioned by teams and leagues claim. Victor Matheson of Holy Cross College and others have documented that independent academic studies find near-zero or even negative net impacts from professional sports subsidies, while industry-commissioned studies find large positive impacts. The divergence is almost entirely due to the industry studies' failure to account for substitution, displacement, and the opportunity cost of public funds.

The scale of the problem is staggering. Between 1970 and 2020, U.S. and Canadian governments spent approximately **$33 billion** in public funds subsidizing major-league venues. The Brookings Institution found that cities that invested heavily in sports venues experienced **slower income growth on average** than comparable cities that did not. The mechanism: fans attending a hockey game spend money they would have spent somewhere else in the same city. There is no net new spending — just rearranged spending within the local economy. Even where localized benefits exist, they tend to be small and confined to a tight geographic radius around the venue. Why do cities keep doing it? Because promoters routinely commission economic impact studies that use inflated multiplier effects, and there is an entire consulting industry that reliably produces the numbers that stadium advocates need to justify the subsidies.

---

# Module 12: Case Study — The Trans Labrador Highway

## 12.1 Applying CBA to Infrastructure Investment

The final module applies the analytical framework of the entire course to a real-world infrastructure investment: the **Trans Labrador Highway** project in Labrador, Canada, studied by P.J. Townley (1998).

The Trans Labrador Highway (TLH) is a 1,149-kilometre corridor connecting communities across Labrador that previously had no year-round road access. The project was enormously important for remote communities that faced extremely high transportation costs — goods had to be flown in or transported by seasonal ice roads. The paving of the entire highway was **completed in July 2022**, after more than 40 years of construction. Total investment: approximately **$1 billion** — roughly **$870,000 per kilometre** through some of the most remote and challenging terrain in eastern Canada.

The cost overruns were severe. Newfoundland and Labrador's Auditor General reported in 2012 that Phase I alone was originally budgeted at **$290 million** but had consumed **$501 million** by 2011, with a further $428 million forecast for completion — a total projected Phase I cost of $929 million against the original $290 million budget, a **220% overrun**. Causes included non-competitive contract extensions, unresolved historical payment claims (a $1.5 million claim from 2001 was only settled in 2010), and inadequate oversight of bridge inspections. The population served was small.

### The CBA Framework Applied

A CBA of the TLH would need to address all the components discussed in this course:

**Benefits**: reduced transportation costs for residents and businesses; improved access to healthcare, education, and emergency services; resource extraction facilitated by year-round road access; tourism potential; reduced isolation and its social consequences.

**Costs**: construction costs (enormous in remote terrain); maintenance costs (harsh winters, long distances); environmental impacts on boreal ecosystems and waterways.

**Discount rate and time horizon**: with a 25–50 year project life, the choice of discount rate matters significantly.

**Standing**: should the analysis count only Labradorian residents, or all Canadians (since the project is federally funded)?

**Distribution**: the highway would particularly benefit low-income, remote, Indigenous communities who face the highest transportation cost burden. Should distributional weights be applied?

### Lessons from the Case Study

The Trans Labrador Highway illustrates several recurring themes in public CBA:

*Small numbers are powerful in remote contexts*. A small population experiencing very large transportation cost reductions can generate significant total surplus — the per-person benefit is high even if aggregate benefits appear small nationally.

*Option value matters for remote communities*. Even the theoretical availability of road access (for emergency evacuations, for example) has option value that is hard to quantify but potentially very large for isolated communities.

*Distributional considerations often favour investment in remote, Indigenous, and low-income communities* — even when aggregate unweighted NPVs are borderline — because the people served tend to have high marginal utility of income.

*CBA cannot substitute for political judgment about regional development priorities*, but it can structure the conversation and make trade-offs explicit.

---

# Conclusion: The Uses and Limits of Cost-Benefit Analysis

Cost-benefit analysis is a powerful tool for organizing information about public decisions, forcing analysts to make their assumptions explicit, and identifying projects where benefits genuinely exceed costs. At its best, it disciplines wishful thinking, counters the influence of well-organized lobbies, and protects public resources from politically attractive but economically wasteful projects.

At its worst, CBA can:
- Rationalize predetermined conclusions by selectively choosing benefit estimates and discount rates
- Systematically disadvantage poor communities whose WTP is constrained by income
- Ignore important values that resist monetization (rights, dignity, irreversibility)
- Create false precision, obscuring genuine uncertainty behind confident-looking numbers

The right attitude toward CBA is neither uncritical embrace nor wholesale rejection. It is a tool — a powerful and legitimate tool — that must be wielded with intellectual honesty, methodological rigor, and humility about its limitations. Kenneth Arrow, one of the towering figures of welfare economics, once observed that the hardest part of CBA is not the economics — it is the ethics. Deciding whose preferences count, how much to discount the future, and how to weigh efficiency against equity are fundamentally moral choices that no model can make for us.

What CBA *can* do is ensure that those moral choices are made consciously, with full information about their implications — rather than accidentally, by default.

---

*ECON 361 — Cost-Benefit Analysis. University of Waterloo, Winter 2021. Notes compiled from course materials.*
