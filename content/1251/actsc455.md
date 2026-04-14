---
title: "ACTSC 455: Life Contingencies 3"
prof: "Diana Skrzydlo"
subjects: "ACTSC"
---

# Sources and References

- **Primary textbook** — Dickson, D.C.M., Hardy, M.R., Waters, H.R. *Actuarial Mathematics for Life Contingent Risks*, 3rd ed., Cambridge University Press, 2020 (Chapters 11–17).
- **Supplementary texts** — Hardy, M.R. *Investment Guarantees: Modeling and Risk Management for Equity-Linked Life Insurance*, Wiley, 2003; Promislow, S.D. *Fundamentals of Actuarial Mathematics*, 3rd ed., Wiley, 2015; Bowers et al. *Actuarial Mathematics*, 2nd ed., SOA, 1997.
- **Online resources** — Society of Actuaries FAM-L / LTAM and Advanced Long Term Actuarial Mathematics (ALTAM) study materials; Pension Research Council working papers; Hardy's published lecture slides on equity-linked guarantees.

# Chapter 1: Diversifiable and Non-Diversifiable Risks

The central financial problem of a life insurer is not that individual lives are uncertain, but that the *aggregate* of many contracts still carries residual uncertainty that cannot be averaged away. To reason about capital, pricing margins, and reinsurance, we need a clean distinction between risks that shrink as the book grows and risks that persist no matter how large the portfolio becomes.

## Definitions and classification

A risk is **diversifiable** if its contribution to the coefficient of variation of aggregate loss tends to zero as the number of independent policies grows. The canonical example is idiosyncratic mortality on a pool of lives whose death times are conditionally independent given a fixed mortality table. A risk is **non-diversifiable** (systematic) when every policy in the book is exposed to the same underlying shock, so pooling does not help. Examples include longevity trend risk (everyone lives longer than priced), equity-market shocks on variable annuity guarantees, and interest rate movements.

<div class="definition">
<strong>Diversifiable risk.</strong> Let \(L_1, L_2, \ldots, L_n\) be i.i.d. policy losses with mean \(\mu\) and standard deviation \(\sigma\). The aggregate loss is \(L_n = \sum_{i=1}^n L_i\). Then \(\mathbb E[L_n] = n\mu\) and \(\mathrm{Var}(L_n) = n\sigma^2\), so the coefficient of variation is

\[ \mathrm{CV}(L_n) = \frac{\sigma\sqrt n}{n\mu} = \frac{\mathrm{CV}(L_1)}{\sqrt n}, \]

which tends to zero as \(n \to \infty\). The risk is diversifiable because its relative uncertainty vanishes in large pools.
</div>

When lives share a common risk factor \(Z\) (for example, a realised improvement in aggregate mortality), one conditions on \(Z\) and applies the law of total variance. The within-\(Z\) component shrinks like \(1/n\), but the between-\(Z\) component remains constant, producing a nonzero limiting coefficient of variation. This is the mathematical signature of systematic risk and is why capital requirements for longevity or asset risk do not evaporate as insurers grow.

<div class="example">
<strong>Diversification in a term insurance pool.</strong> A term insurer writes \(n\) identical one-year policies each paying 100{,}000 dollars on death. Suppose \(q = 0.005\) and lives are independent. The standard deviation of a single loss is \(100{,}000 \cdot \sqrt{q(1-q)} \approx 7056\) dollars and the mean is 500 dollars, giving \(\mathrm{CV}(L_1) \approx 14.1\). For \(n = 10{,}000\) independent policies the coefficient of variation drops to \(14.1 / \sqrt{10{,}000} = 0.141\), small enough that modest loadings suffice. If instead \(q\) itself is random with \(\mathrm{sd}(q) = 0.0005\), a term proportional to this common shock persists in \(\mathrm{CV}(L_n)\) even for extremely large \(n\); that residue is the longevity/mortality trend risk the insurer cannot diversify.
</div>

## Consequences for capital and risk transfer

Regulators set solvency capital roughly proportional to a tail statistic of aggregate loss. For diversifiable risk, this capital scales sub-linearly with exposure, rewarding larger insurers. For non-diversifiable risk, the required capital scales closer to linearly, motivating the use of reinsurance, longevity swaps, and capital-markets securitization (for example, mortality-linked catastrophe bonds). The chapter's conceptual takeaway is that the product mix and not merely the size of the book determines whether growth improves or preserves an insurer's risk profile.

# Chapter 2: Pension Plan Design and Valuation

Employer-sponsored pensions fall into two families — defined contribution and defined benefit — and each family poses different mathematical problems. A defined contribution plan is essentially a tax-advantaged savings account, so its valuation is forward-looking and stochastic in investment returns. A defined benefit plan promises a stream of retirement income tied to salary and service, so its valuation requires projecting demographic experience and salary growth, then discounting back to today.

## Defined contribution plans

In a defined contribution (DC) plan the sponsor and employee contribute an agreed percentage of salary to an individual account. The retirement benefit is whatever the accumulated account can purchase, typically expressed via a **replacement ratio** — the ratio of post-retirement income to final pre-retirement salary. A member's projected replacement ratio depends on contribution rates, years of service, investment returns net of fees, annuity rates at retirement, and withdrawal policy. Because the investment risk sits with the member, the sponsor's liability is trivial once contributions have been remitted.

## Defined benefit plan designs

Defined benefit (DB) plans express the pension as a function of salary and service. Three standard formulas dominate practice. A **final salary** plan sets the annual pension as the accrual rate times service times the salary earned in (or averaged over) a short window at retirement. A **career average earnings (CAE)** plan replaces the final-salary anchor by the arithmetic average of earnings over the entire career. A **career average revalued earnings (CARE)** plan is like CAE but revalues each past year of earnings by a wage index or fixed revaluation rate, producing benefits between the two extremes.

<div class="definition">
<strong>Accrual formulas.</strong> Let \(\alpha\) be the accrual rate (for example, 1.5% per year of service), let \(s\) denote completed service at valuation, and let \(S^*\) be the relevant salary measure. The accrued annual pension is \(B = \alpha\,s\,S^*\). For final salary, \(S^*\) is a projected final-year salary; for CAE, \(S^* = \tfrac{1}{s}\sum_{k=1}^{s} S_k\); for CARE, \(S^* = \tfrac{1}{s}\sum_{k=1}^{s} S_k \prod_{j=k}^{s-1}(1+\rho_j)\) where \(\rho_j\) is the revaluation rate.
</div>

## Actuarial liabilities and normal cost

The sponsor's obligation at valuation date is summarised by the **accrued liability** (AL) — the present value of benefits already earned — and the **normal cost** (NC) — the present value of benefits attributed to the upcoming year of service. Two actuarial cost methods dominate the discussion. Under the **traditional unit credit (TUC)** method, each year of service is valued using the current salary, producing a back-loaded funding pattern on final-salary plans because future salary increases trigger catch-up revaluations. Under the **projected unit credit (PUC)** method, benefits are valued using the *projected* salary at retirement, so the liability already contains anticipated growth and normal cost is a smoother share of payroll.

For a final-salary plan with accrual rate \(\alpha\), service \(s\), projected final salary \(\widetilde S_r\), retirement age \(r\), retirement annuity factor \(\bar a_r^{\mathrm{ret}}\), survival probability \(_{r-x}p_x\) from age \(x\) to \(r\), and discount factor \(v^{r-x}\),

\[ \mathrm{AL}^{\mathrm{PUC}}_x = \alpha\,s\,\widetilde S_r\,\bar a_r^{\mathrm{ret}}\,v^{r-x}\,_{r-x}p_x, \]

\[ \mathrm{NC}^{\mathrm{PUC}}_x = \alpha\,\widetilde S_r\,\bar a_r^{\mathrm{ret}}\,v^{r-x}\,_{r-x}p_x. \]

Intuitively, the AL counts \(s\) accrued years while the NC counts one additional year of accrual, so NC is the AL divided by completed service (for a flat-accrual plan). In practice, full valuations use decrement-weighted service tables that account for withdrawal, disability, and pre-retirement death, discounting each benefit to its expected payment age.

<div class="example">
<strong>PUC calculation.</strong> A member aged 45 has 10 years of service in a final-salary plan with accrual rate 1.8%. Current salary is 80{,}000 dollars, projected to 150{,}000 dollars at retirement age 65 assuming 3.2% annual raises. Suppose the annuity factor at 65 is 14, survival probability from 45 to 65 is 0.96, and the discount factor \(v^{20} = 0.376\). Then \(\mathrm{AL}^{\mathrm{PUC}} = 0.018 \cdot 10 \cdot 150{,}000 \cdot 14 \cdot 0.376 \cdot 0.96 \approx 136{,}460\) dollars and the corresponding normal cost is \(\mathrm{NC}^{\mathrm{PUC}} \approx 13{,}646\) dollars. The actuary would schedule contributions to cover the normal cost plus amortization of any unfunded liability.
</div>

## Funding, hybrids, and retiree health

Funding targets pair the normal cost with an amortization payment that gradually eliminates any unfunded accrued liability — the gap between market value of assets and the AL. Amortization periods are set by statute and smoothing conventions, which is why pension expense can lag economic reality for years.

**Hybrid plans** combine elements of both worlds. A **cash balance** plan credits a hypothetical account with pay credits and interest credits but is legally a DB plan, so the sponsor bears investment shortfalls relative to the credited rate. **Target benefit** plans set a nominal DB formula but adjust benefits if assets underperform. Finally, **post-retirement health benefits** (OPEBs) create long-tail liabilities whose valuation parallels pension accounting but layers medical trend assumptions on top of mortality, typically producing larger actuarial gains and losses than pension plans as health-cost inflation varies.

# Chapter 3: Profit Testing

Profit testing is the core pricing technique for non-participating life insurance and annuities. Unlike equivalence-principle premium calculations, which zero out expected loss, profit testing constructs an explicit year-by-year ledger of emerging surplus under best-estimate assumptions, then discounts this surplus to assess whether the contract meets the insurer's return hurdle.

## The annual ledger

Let \(_{t-1}V\) denote the reserve at the start of policy year \(t\), and suppose the insurer receives premium \(P_{t-1}\) and pays expense \(E_{t-1}\) at the start of the year, earns interest at rate \(i\) through the year on the invested fund \(_{t-1}V + P_{t-1} - E_{t-1}\), and pays death benefit \(S_t^{\mathrm{db}}\) to decedents at year-end. The **profit emerging** per unit in force at the start of year \(t\) is

\[ \Pi_t = (\,_{t-1}V + P_{t-1} - E_{t-1})(1+i) - q_{x+t-1}\,S_t^{\mathrm{db}} - p_{x+t-1}\,_tV. \]

The first term is the accumulated invested fund, the second is expected death benefit outflow, and the third is the reserve that must be set up for survivors at year-end. Taking expectations in this way implicitly assumes best-estimate mortality and a deterministic interest path; stochastic extensions replace the deterministic accumulation by a simulated one.

## From profit emerging to profit signature

Because \(\Pi_t\) is conditional on being in force at time \(t-1\), multiplying by the survival probability \(_{t-1}p_x\) converts it to a cash flow per policy issued:

\[ \sigma_t = {}_{t-1}p_x\,\Pi_t. \]

The sequence \(\{\sigma_t\}_{t=1}^n\) is the **profit signature**. It typically starts negative in year one (the **new-business strain** caused by acquisition expenses and initial reserve set-up) and turns positive as the reserves unwind.

<div class="definition">
<strong>Net present value and internal rate of return.</strong> Given a hurdle rate \(r\) used to discount surplus back to the shareholder, the NPV of the contract is

\[ \mathrm{NPV} = \sum_{t=1}^{n} \sigma_t\,(1 + r)^{-t}. \]

The internal rate of return (yield on strain) is the value of \(r\) for which \(\mathrm{NPV} = 0\). A contract is acceptable when \(\mathrm{NPV}(r_{\mathrm{hurdle}}) \geq 0\) or, equivalently, when the IRR exceeds the hurdle.
</div>

## Pricing with profit tests

In pre-contract pricing, the actuary treats the premium, commission structure, or profit loading as the unknown and solves for the value that makes the NPV equal to the sponsor's target (often expressed as a percentage of present value of premiums). Sensitivity is then tested by rerunning the projection under stressed mortality, lapse, and interest assumptions.

<div class="example">
<strong>Two-year endowment profit signature.</strong> Consider a two-year endowment on a life age 60 with level annual premium \(P\), death benefit 10{,}000 dollars, survival benefit 10{,}000 dollars, first-year expenses 300 dollars, renewal expenses 30 dollars, and best-estimate \(q_{60} = 0.01\), \(q_{61} = 0.012\). The reserves are set so the policy value at issue equals zero and the end-of-year-one reserve is \(_1V\). With interest 5% and hurdle rate 10%, one can back out the premium that makes the discounted sum \(\sigma_1/1.10 + \sigma_2/1.10^2\) equal to a 5% profit margin on PV premiums. Every assumption is explicit in the ledger, so the margin can be decomposed into mortality, expense, and interest contributions.
</div>

## Profit testing in multi-state models

When a product has multiple live states — for example a critical-illness rider with healthy, sick, and dead states — the single survival factor \(_{t-1}p_x\) is replaced by a vector of occupancy probabilities produced from the Kolmogorov forward equations. Profit emerging is computed state by state, with transition probabilities driving benefit outflow and premium inflow. This extension is essential for products where cash flows depend on which state is occupied rather than merely on whether the life is alive.

# Chapter 4: Modern Insurance Products and Universal Life

Traditional whole life bundles insurance, savings, and surrender value into a single premium. **Universal life (UL)** instead unbundles them, maintaining an explicit **account value** that evolves like a bank account. The policyholder can vary premium deposits (within limits), and the insurer charges an explicit cost of insurance and expense load each period.

## Account value recursion

Let \(\mathrm{AV}_t\) be the account value at time \(t\), \(P_t\) the premium deposited, \(E_t\) the expense charge, \(i_t^c\) the credited interest rate for year \(t\) (often equal to a crediting-rate formula tied to an asset portfolio), and \(\mathrm{COI}_t\) the cost of insurance for the coverage band. The recursion is

\[ \mathrm{AV}_{t+1} = (\mathrm{AV}_t + P_t - E_t)(1 + i_t^c) - \mathrm{COI}_t. \]

The cost of insurance is charged against the **net amount at risk**, namely the face amount in excess of the account value. If \(S_t\) is the face amount and \(q_t^{\mathrm{COI}}\) is a pricing mortality rate,

\[ \mathrm{COI}_t = (S_t - \mathrm{AV}_t)\,q_t^{\mathrm{COI}}. \]

<div class="definition">
<strong>Net amount at risk.</strong> The net amount at risk \((S_t - \mathrm{AV}_t)\) is the portion of the face amount genuinely underwritten by the insurer. As the account value grows, COI charges fall, which is precisely why UL with a large cash value behaves more like a savings product than traditional term insurance.
</div>

## Profit testing universal life

Because the account value is stochastic in both credited interest and policyholder behaviour, UL profit testing is typically carried out by Monte Carlo. For each simulated interest scenario, the AV trajectory is computed, surrender and partial-withdrawal options are exercised according to a behavioural rule, and the insurer's surplus is accumulated from expense loads, spread between earned and credited interest, mortality margins, and surrender charges. The profit signature is averaged across scenarios and discounted at the shareholder's hurdle.

<div class="example">
<strong>Account value projection.</strong> A 50-year-old deposits 2{,}000 dollars annually into a UL contract with face amount 100{,}000 dollars, expense charge 120 dollars per year, crediting rate 4%, and COI rate 0.006 in year one. Starting from \(\mathrm{AV}_0 = 0\), the end-of-year-one account value is \((0 + 2000 - 120)(1.04) - (100{,}000 - 0)(0.006) \approx 1955 - 600 = 1355\) dollars. In later years, as the AV grows, the COI charge per dollar of face shrinks because the net amount at risk falls, which accelerates the accumulation for persisting policyholders.
</div>

The interplay between flexible premiums and mortality charges creates embedded options — the right to stop paying premiums, the right to withdraw, and the right to adjust the face amount — that materially affect profitability and demand stochastic valuation techniques. The transparency advantage of UL for consumers becomes a modelling burden for the actuary.

# Chapter 5: Equity-Linked Insurance and Investment Guarantees

Equity-linked products connect the policyholder's benefit to the performance of a reference fund, but layer a **guarantee** that floors downside risk. They include variable annuities (VAs) in the United States and segregated funds in Canada. The guarantees are sold as riders whose fees are deducted from the fund value.

## Guarantee taxonomy

The alphabet soup of variable-annuity guarantees shares a common structure: a guaranteed amount \(G\) and a reference fund value \(F_t\), with a payoff that activates when \(F_t\) falls short of \(G\). The common shapes are

- **GMDB** (death benefit): pays \(\max(G, F_T)\) on death, where \(T\) is the random time of death.
- **GMAB** (accumulation): at a fixed maturity, pays \(\max(G, F_T)\).
- **GMIB** (income): converts the greater of \(G\) and \(F_T\) into an annuity at a guaranteed annuitisation rate.
- **GMWB** (withdrawal): permits guaranteed withdrawals even after the fund exhausts.
- **GMMB** (maturity): generic guaranteed minimum maturity amount, economically identical to a put.

## Modelling the fund

A minimal stochastic model takes the fund value under geometric Brownian motion,

\[ F_t = F_0\,e^{(\mu - \tfrac12\sigma^2)t + \sigma B_t}, \]

where \(B_t\) is a standard Brownian motion, \(\mu\) is the drift, and \(\sigma\) the volatility. Under this assumption the GMMB liability at maturity \(T\) is

\[ L^{\mathrm{GMMB}} = (G - F_T)_+, \]

which is precisely the payoff of a European put option struck at \(G\). Hardy's book exploits this identification to price and hedge the guarantee with equity-derivatives machinery rather than conventional equivalence-principle premiums.

<div class="theorem">
<strong>Black–Scholes put for a GMMB.</strong> Under GBM with risk-free rate \(r\) and volatility \(\sigma\), the fair market-consistent value at issue of a GMMB is

\[ P_0 = G\,e^{-rT}\,N(-d_2) - F_0\,N(-d_1), \]

where \(d_1 = \big(\log(F_0/G) + (r + \tfrac12\sigma^2)T\big)/(\sigma\sqrt T)\) and \(d_2 = d_1 - \sigma\sqrt T\). This is the cost of a replicating put and provides a lower bound on the fee the insurer must charge to eliminate market risk, ignoring mortality and lapses.
</div>

## Risk measures and Monte Carlo

Because the liability distribution has a heavy right tail (the guarantee bites only in poor scenarios), the insurer cares about tail statistics rather than the mean. Two measures dominate. **Value at Risk (VaR)** at level \(\alpha\) is the \(\alpha\)-quantile of the loss. **Conditional tail expectation (CTE)**, also known as Tail VaR, is the expected loss above the VaR:

\[ \mathrm{CTE}_\alpha(L) = \mathbb E[L \mid L > \mathrm{VaR}_\alpha(L)]. \]

In practice the liability distribution is simulated by Monte Carlo. One projects large numbers of real-world fund scenarios (drift \(\mu\)), computes the realised loss on each, and reads off empirical VaR and CTE. Capital and reserves are set using CTE at levels such as 0.95 or 0.99, reflecting the regulatory preference for a coherent risk measure that respects sub-additivity.

<div class="example">
<strong>Stand-alone GMMB liability.</strong> A segregated fund contract issued for ten years has \(F_0 = 100{,}000\) dollars, \(G = 100{,}000\) dollars, drift 6%, volatility 18%, and annual guarantee fee 0.5% of fund. A Monte Carlo simulation with 100{,}000 paths produces a mean loss near zero but a 95% CTE of roughly 14{,}000 dollars per contract — more than twenty times the mean. This gap explains why equity-linked insurers must hold capital well in excess of expected liability, and why market-consistent pricing gives a starkly different answer than real-world expected value.
</div>

# Chapter 6: Hedging Embedded Guarantees

Unhedged equity-linked guarantees expose the insurer to market risk that cannot be diversified across lives. The response is to convert market-risk exposure into options positions and to rebalance dynamically as market conditions move, so that shareholder losses are bounded by hedging costs rather than unbounded equity moves.

## Static versus dynamic hedging

A **static hedge** buys an off-the-shelf instrument at policy issue whose payoff matches the guarantee. For a GMMB this is the put described above, paid for out of guarantee fees. Static hedges are operationally simple but expensive for long-dated guarantees and impossible when the hedge has no liquid market analogue (as with path-dependent guarantees).

A **dynamic hedge** holds a self-financing portfolio of the underlying fund (and cash) designed to replicate the option's payoff through continuous rebalancing. The portfolio weight is chosen so that the hedge has the same first-order sensitivity as the liability to fund movements. For a European put on a non-dividend stock this delta is

\[ \Delta_P = N(d_1) - 1, \]

which is negative, meaning the replicating portfolio is short the underlying (or equivalently long cash, short fund). The insurer adjusts the short position daily or weekly as \(d_1\) drifts.

<div class="definition">
<strong>The Greeks.</strong> Sensitivities of the guarantee value \(V\) with respect to inputs are labelled delta \(\Delta = \partial V/\partial F\), gamma \(\Gamma = \partial^2 V/\partial F^2\), vega \(\mathcal V = \partial V/\partial \sigma\), rho \(\rho = \partial V/\partial r\), and theta \(\Theta = \partial V/\partial t\). Delta hedging neutralises first-order exposure to the fund; gamma measures how fast that exposure changes and drives rebalancing frequency; vega captures volatility risk (often unhedged because long-dated volatility derivatives are illiquid).
</div>

## Practical complications

Three complications keep actuaries busy. First, **basis risk** arises when the reference fund tracks a specific manager's portfolio while hedges trade against broad-market indices — the two drift apart. Second, **transaction costs and discrete rebalancing** cause hedge slippage that reduces effectiveness and must be priced into guarantee fees. Third, **mortality-market interaction** means that the exposure shrinks when policyholders die, so hedges must be periodically resized to reflect the in-force; a pure options overlay that ignores mortality is over-hedged in expectation.

<div class="example">
<strong>Delta rebalancing.</strong> An insurer has sold a GMMB rider on 10{,}000 dollars of fund value with 10 years to maturity, \(\sigma = 0.18\), and \(r = 0.03\). Initially the put has delta near \(-0.28\), so the hedge shorts 2{,}800 dollars of fund. After an equity shock drops the fund to 8{,}000 dollars, the put is deeper in the money and its delta moves toward \(-0.55\), requiring the hedger to increase the short position to roughly 4{,}400 dollars. The gamma-driven rebalancing locks in cash consistent with the option's accumulating intrinsic value, leaving residual risk that originates from the model assumptions themselves.
</div>

Hedging connects the actuarial and financial-engineering views of guaranteed products. Model risk — the possibility that fund returns are not lognormal, that volatility is stochastic, that interest rates are correlated with equities — becomes the binding constraint once delta hedging is in place. Sophisticated programmes layer stochastic-volatility models, regime-switching lognormal specifications, and stress tests onto the base Black–Scholes skeleton, accepting that no hedge is perfect and that capital held against residual risk remains the final backstop.
