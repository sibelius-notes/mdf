---
title: "SYDE 262: Engineering Economics and Sustainability"
subjects: "SYDE"
---

## Sources and References

- Newnan, Lavelle, Eschenbach, <em>Engineering Economic Analysis</em> (Oxford)
- Park, <em>Contemporary Engineering Economics</em> (Pearson)
- Daly and Farley, <em>Ecological Economics: Principles and Applications</em> (Island Press)
- Costanza et al., <em>An Introduction to Ecological Economics</em> (CRC)
- Online: NREL Cost Analysis, IPCC Working Group III reports

---

# Chapter 1: Foundations of Engineering Economy

## 1.1 The Time Value of Money

A dollar today is worth more than a dollar tomorrow because it can be invested to earn return. The future value of a present amount \( P \) after \( n \) periods at interest rate \( i \) is

\[
F = P (1+i)^{n}.
\]

Conversely, the present value of a future amount \( F \) is

\[
P = F (1+i)^{-n}.
\]

These compounding relations underlie every engineering economic comparison.

## 1.2 Cash Flow Diagrams

A cash-flow diagram plots inflows (revenue) as upward arrows and outflows (costs) as downward arrows along a time axis. Analysing projects requires cataloguing every significant cash flow, including initial investment, annual operating costs, periodic maintenance, revenues, salvage values, and taxes.

<div class="example">
A solar panel installation costs \$20,000 today, generates \$2,500/year for 25 years, and has \$500 salvage. At 5% interest, the present worth is

\[
PW = -20000 + 2500\,\frac{1-(1.05)^{-25}}{0.05} + 500\,(1.05)^{-25},
\]
which evaluates to roughly +\$15,400, indicating a positive-worth investment.
</div>

# Chapter 2: Evaluating Alternatives

## 2.1 Present Worth, Annual Worth, Rate of Return

Present worth (PW) sums all cash flows discounted to time zero. Annual worth (AW) spreads the same value uniformly. Internal rate of return (IRR) is the interest rate that zeros PW. Decision rules: for a single project, accept if PW > 0 at the MARR (minimum attractive rate of return) or if IRR > MARR; for competing alternatives, choose the highest PW (or incremental IRR greater than MARR).

## 2.2 Payback and Benefit-Cost

Payback period — time until cumulative cash flow turns positive — is intuitive but ignores time value and post-payback benefits. Benefit-cost ratio (BCR) compares discounted benefits to costs; BCR > 1 signals economic viability. Public-sector decisions often use BCR with social discount rates and externalities included.

## 2.3 Depreciation and Taxes

Depreciation allocates a capital asset's cost over its useful life for accounting and tax purposes. Straight-line, declining-balance, and tax-specified schedules (MACRS in the US, CCA in Canada) differ; after-tax cash flow = (revenue − expense − depreciation)(1 − tax rate) + depreciation. Tax treatment materially alters the economic ranking of alternatives.

# Chapter 3: Risk, Uncertainty, and Inflation

## 3.1 Inflation

Inflation erodes the purchasing power of money. Real interest rate \( i_r \) relates to nominal \( i_n \) and inflation \( f \) by

\[
1 + i_r = \frac{1 + i_n}{1 + f}.
\]

Consistent analyses use either all real cash flows with a real rate or all nominal cash flows with the nominal rate. Mixing produces systematic error, often favouring long-lived assets improperly.

## 3.2 Sensitivity and Scenario Analysis

Engineering projects face uncertain parameters: capital cost, energy price, demand, lifetime. Sensitivity analysis varies each input one at a time to identify those that most alter the decision. Scenario analysis constructs coherent bundles (optimistic, baseline, pessimistic). Monte Carlo simulation samples joint distributions to estimate outcome probability.

## 3.3 Decision Under Risk

Expected value ranks alternatives when risk is symmetric or small. Utility theory captures risk aversion; certainty-equivalent values reflect the decision maker's preferences. Real options analysis values flexibility — to expand, delay, or abandon — that conventional DCF (discounted cash flow) underestimates.

<div class="remark">
Most engineering investment errors are errors of scope, not arithmetic. Define the system boundary carefully, include all relevant cash flows, and name the uncertainties honestly.
</div>

# Chapter 4: Beyond Finance — Externalities and Sustainability

## 4.1 Market Failures

Markets misallocate when prices fail to reflect true costs. Pollution is the textbook externality: a firm's cost of production omits the damage imposed on others by its emissions. The socially optimal price equals marginal private cost plus marginal external cost. Pigouvian taxes, cap-and-trade, subsidies for positive externalities, and direct regulation are policy tools to correct these failures.

## 4.2 Discount Rate and Intergenerational Equity

Conventional discount rates compound over long horizons, making far-future impacts nearly invisible. Environmental economics debates whether the social discount rate should equal market rates (Arrow, Nordhaus) or be lower to respect future generations (Stern). A 1% change in discount rate drastically changes the value of a tonne of CO<sub>2</sub> released today.

## 4.3 Ecological Economics

Ecological economics treats the economy as a subsystem of the biosphere, bounded by physical laws (thermodynamics), not an isolated market. Key concepts include biophysical limits, ecosystem services, throughput (mass and energy flow), and a sufficient rather than maximal economy. Tools such as the ecological footprint, energy return on energy invested (EROEI), and multi-criteria analysis complement monetary metrics.

# Chapter 5: Life-Cycle Analysis and Environmental Impact

## 5.1 Life-Cycle Assessment

ISO 14040 LCA proceeds through four phases: goal and scope definition, inventory analysis, impact assessment, and interpretation. Inventory tracks material and energy flows per functional unit. Impact assessment aggregates flows into categories (global warming potential, acidification, eutrophication, human toxicity, resource depletion) with characterisation factors. Outputs guide comparison — between materials, designs, suppliers — and identify process hotspots.

## 5.2 Triple Bottom Line

Sustainable business frameworks extend accounting to include social and environmental as well as financial performance (people, planet, profit). Reporting standards (GRI, SASB, TCFD) drive disclosure. Integrated reporting links the three dimensions via causal narratives.

## 5.3 Circular Economy

Circular economy principles aim at keeping materials in productive use by design for durability, repair, remanufacture, and recycling. Engineering decisions — material choice, modularity, fastener type, reversible joining — determine circularity. Business-model innovations (product-as-service, leasing, take-back) align incentives with circular outcomes.

<div class="example">
Photovoltaic modules designed with framed construction and glass-glass laminates can be disassembled and silver, copper, and silicon recovered at end of life; design-for-recycling lowers net lifecycle emissions by 10–20%.
</div>

# Chapter 6: Decision-Making in Practice

## 6.1 Multi-Criteria Decision Analysis

Complex decisions balance criteria with different units (cost, emissions, jobs, safety). Multi-criteria decision analysis (MCDA) methods — weighted-sum, AHP, PROMETHEE, ELECTRE — structure trade-offs, invite stakeholder weighting, and document rationale. Transparency matters more than numerical precision; MCDA results should be tested for sensitivity to weights.

## 6.2 Public Project Appraisal

Public projects (transit, water, energy) include social and environmental costs and benefits unlikely to be reflected in market prices. Social cost-benefit analysis uses shadow prices — non-market valuations of time, life, noise, air quality — to inform decisions. Distributional analysis examines who gains and loses, surfacing equity concerns that aggregate BCR can hide.

## 6.3 Sustainability and Professional Practice

Increasingly, professional engineering codes embed sustainability explicitly (PEO guidance, FIDIC Sustainability Charter). Sustainability-literate engineers identify externalities at design stage, apply lifecycle thinking, engage stakeholders, and recommend options that respect planetary limits and human equity even when these differ from the lowest-cost option.

<div class="theorem">
Rigorous engineering economics balances the arithmetic of discounting, taxes, and risk with honest accounting of externalities, equity, and lifecycle impacts; a defensible recommendation integrates both inside a clear ethical frame.
</div>

Graduates who master these tools can evaluate and advocate for projects that not only pay back, but also respect environmental limits and social justice — the core competence an engineering economist-sustainability practitioner brings to 21st-century engineering practice.
