---
title: "ACTSC 372: Investment Science and Corporate Finance"
prof: "Surya Banerjee"
subjects: "ACTSC"
---

## Sources and References

- **Primary textbook** — Bodie, Z., Kane, A., Marcus, A.J. *Investments*, 12th ed., McGraw-Hill, 2021.
- **Supplementary texts** — Ross, S., Westerfield, R., Jaffe, J., Jordan, B. *Corporate Finance*, 13th ed., McGraw-Hill, 2022; Hull, J.C. *Options, Futures, and Other Derivatives*, 11th ed., Pearson, 2021; Luenberger, D. *Investment Science*, 2nd ed., Oxford University Press, 2014.
- **Online resources** — MIT OpenCourseWare 15.401 *Finance Theory I*; Stanford GSB MS&E 245A lecture notes; SOA FM and IFM study materials.

# Chapter 1: Investment Rules and Capital Budgeting

Capital budgeting is the process by which a firm decides which long-term investment projects to undertake. Because capital is scarce and project cash flows are uncertain and spread over time, managers need a disciplined framework for ranking and accepting projects. The starting point is always the recognition that a dollar today is not equal to a dollar tomorrow: cash flows must be discounted at a rate that reflects their **opportunity cost of capital**, i.e., the expected return on an equivalent-risk alternative available in the financial markets.

## Net Present Value

The gold standard of investment criteria is **Net Present Value (NPV)**. For a project requiring an initial outlay \(C_0\) and generating after-tax cash flows \(C_1, C_2, \ldots, C_T\), the NPV at discount rate \(r\) is

\[
\mathrm{NPV} = -C_0 + \sum_{t=1}^{T} \frac{C_t}{(1+r)^t}.
\]

The decision rule is simple: accept a project if \(\mathrm{NPV} > 0\), reject if \(\mathrm{NPV} < 0\). Because NPV is additive across projects and measured in today's dollars, it directly tells the manager how much shareholder wealth the project creates.

<div class="definition">
<strong>Definition (Net Present Value).</strong> The <em>net present value</em> of a stream of cash flows is the sum of the present values of every cash flow, positive and negative, discounted at the project's opportunity cost of capital.
</div>

## Internal Rate of Return

The **Internal Rate of Return (IRR)** is the discount rate that sets NPV equal to zero:

\[
\sum_{t=0}^{T} C_t\,(1+\mathrm{IRR})^{-t} = 0.
\]

The IRR rule accepts projects with \(\mathrm{IRR} > r\), where \(r\) is the hurdle rate. IRR is attractive because it is expressed as a percentage return, which managers find intuitive, but it has several pitfalls: (1) non-conventional cash flows with sign changes can produce **multiple real roots**; (2) IRR ignores scale, so a small project with a huge percentage return may be preferred to a much larger project with slightly lower IRR but far higher NPV; (3) in mutually exclusive projects, the IRR ranking can directly conflict with the NPV ranking whenever the two projects have different timing of cash flows or different scales.

## Payback, Discounted Payback, and Profitability Index

**Payback period** counts how many years of cash flows are needed to recover the initial outlay. It is easy to compute and penalizes projects whose benefits are far in the future, but it ignores both the time value of money and any cash flows beyond the cutoff. **Discounted payback** partially fixes the first problem by discounting cash flows before cumulating them, but still ignores late cash flows. The **Profitability Index (PI)** is the ratio of the present value of future cash flows to the initial outlay, \(\mathrm{PI} = \mathrm{PV}(C_{1:T})/C_0\); it is useful for ranking projects under **capital rationing**, because it measures NPV per dollar invested.

## NPV vs IRR Conflict — Worked Example

<div class="example">
<strong>Example (Scale conflict).</strong> Consider two mutually exclusive projects at a cost of capital of 10%. Project A requires 10,000 dollars today and returns 13,000 dollars in one year; Project B requires 100,000 dollars today and returns 120,000 dollars in one year.
<br/><br/>
Project A has IRR = 30% and NPV = 13,000/1.10 − 10,000 ≈ 1,818 dollars. Project B has IRR = 20% and NPV = 120,000/1.10 − 100,000 ≈ 9,091 dollars. IRR would rank A above B, but B creates five times more shareholder wealth. The correct choice is B — NPV wins whenever the two rules disagree.
</div>

# Chapter 2: Decision Making Under Uncertainty

Textbook NPV assumes cash flows are known. In practice, every forecast is a probability distribution, and managers need tools for thinking about that uncertainty before committing capital.

## Scenario Analysis and Decision Trees

**Scenario analysis** considers a small number of internally consistent futures — typically a base, an upside, and a downside case — and computes NPV under each. **Sensitivity analysis** instead perturbs one input at a time to see which assumptions matter most. **Decision trees** go further by making the *sequential* structure of a project explicit: at each node, nature draws an outcome or management makes a choice, and expected NPV is computed by rolling back from the leaves using backward induction.

## Real Options

A decision tree makes it clear that managers rarely commit to a fixed plan; they retain flexibility. This flexibility is a **real option**. The main types are the option to **delay** an investment (wait for information), to **expand** if early results are good, to **contract** or scale down, and to **abandon** for salvage value. Because optionality is strictly valuable, ignoring real options tends to understate project NPV, particularly for research, mining, and staged product rollouts.

## Utility and Risk Aversion

Expected NPV rules implicitly assume decision-makers care only about expected monetary outcomes. **Expected utility theory** generalizes this: a decision-maker with utility function \(u\) and wealth random variable \(W\) maximizes \(\mathbb{E}[u(W)]\). Concavity of \(u\) captures risk aversion, and the **risk premium** is the difference between expected wealth and its certainty equivalent.

<div class="theorem">
<strong>Theorem (Jensen's inequality).</strong> If <em>u</em> is concave, then <em>E</em>[<em>u</em>(<em>W</em>)] ≤ <em>u</em>(<em>E</em>[<em>W</em>]), with equality iff <em>W</em> is degenerate. Hence a risk-averse investor always prefers the certain payoff <em>E</em>[<em>W</em>] to the gamble <em>W</em>.
</div>

# Chapter 3: Mean–Variance Portfolio Theory

Finance's first rigorous answer to "how should a risk-averse investor combine assets?" is Harry Markowitz's **mean–variance framework**. The investor cares only about the mean and variance of one-period portfolio return, treats returns as random variables, and diversifies to trade off the two.

## Returns as Random Variables

Let asset \(i\) have simple return \(r_i\) with mean \(\mu_i = \mathbb{E}[r_i]\), variance \(\sigma_i^2\), and pairwise covariance \(\sigma_{ij} = \mathrm{Cov}(r_i, r_j) = \rho_{ij}\sigma_i\sigma_j\). For a portfolio with weights \(w = (w_1, \ldots, w_n)^\top\) satisfying \(\mathbf{1}^\top w = 1\), the portfolio return is \(r_p = w^\top r\), with mean \(\mu_p = w^\top \mu\) and variance \(\sigma_p^2 = w^\top \Sigma w\).

## Two-Asset Case and Diversification

For two assets the variance formula collapses to

\[
\sigma_p^2 = w_1^2\sigma_1^2 + w_2^2\sigma_2^2 + 2\,w_1 w_2\,\rho_{12}\,\sigma_1\sigma_2.
\]

When \(\rho_{12} < 1\), the graph of feasible \((\sigma_p, \mu_p)\) pairs bends leftward: combining imperfectly correlated assets reduces variance without reducing the weighted mean. In the extreme \(\rho_{12} = -1\), a riskless combination exists. This curvature is the mathematical content of diversification.

## Minimum-Variance and Efficient Frontier

The set of portfolios with the lowest variance for each given mean is the **minimum-variance frontier**. Its upper branch — portfolios that are not dominated — is the **efficient frontier**. Formally, one solves

\[
\min_w\ \tfrac{1}{2}\,w^\top \Sigma w\quad \text{subject to}\quad w^\top \mu = \mu_p,\ \mathbf{1}^\top w = 1.
\]

<div class="theorem">
<strong>Theorem (Lagrangian solution).</strong> Form L = ½ <em>w</em>ᵀΣ<em>w</em> − λ(<em>w</em>ᵀμ − μ<sub><em>p</em></sub>) − γ(<strong>1</strong>ᵀ<em>w</em> − 1). The first-order condition Σ<em>w</em> = λμ + γ<strong>1</strong> gives <em>w</em>* = λΣ⁻¹μ + γΣ⁻¹<strong>1</strong>. Hence every frontier portfolio is a linear combination of the two fixed portfolios Σ⁻¹μ and Σ⁻¹<strong>1</strong>, suitably normalized — the <em>two-fund separation theorem</em>.
</div>

## Risk-Free Asset, CAL, and Tangency Portfolio

Now introduce a risk-free asset paying \(r_f\). Combining it with any risky portfolio \(P\) produces a straight line in mean–standard-deviation space, the **Capital Allocation Line (CAL)**, whose slope is the **Sharpe ratio**

\[
S_p = \frac{\mathbb{E}[r_p] - r_f}{\sigma_p}.
\]

Rational mean–variance investors all prefer the CAL with the *highest* slope, which is tangent to the risky efficient frontier at a unique portfolio \(T\) — the **tangency portfolio**. Every investor holds some mix of the risk-free asset and \(T\), differing only in risk appetite. This is the strongest form of two-fund separation.

<div class="example">
<strong>Example.</strong> Two assets have μ₁ = 0.08, σ₁ = 0.15, μ₂ = 0.12, σ₂ = 0.25, ρ = 0.2, and <em>r</em><sub><em>f</em></sub> = 0.03. Solving the tangency problem (maximize Sharpe) yields weights near (0.58, 0.42), expected return about 0.097, and Sharpe roughly 0.47 — markedly higher than either asset alone, because the low correlation lets diversification do work.
</div>

# Chapter 4: Asset Pricing — CAPM and APT

Mean–variance theory tells one investor what to do. Asset pricing asks the equilibrium question: if *everyone* behaves this way, what must expected returns look like?

## Deriving the CAPM

Assume homogeneous expectations, a common risk-free rate, frictionless markets, and that investors optimize mean–variance. Every investor then holds the same tangency portfolio \(T\). In equilibrium the aggregate of all risky holdings must equal total market capitalization, so \(T\) is the **market portfolio** \(M\). Substituting \(M\) into the first-order condition for a mean–variance optimum produces the **Capital Asset Pricing Model (CAPM)**:

\[
\mathbb{E}[r_i] = r_f + \beta_i\,\big(\mathbb{E}[r_M] - r_f\big),\qquad \beta_i = \frac{\mathrm{Cov}(r_i, r_M)}{\mathrm{Var}(r_M)}.
\]

Only the part of an asset's risk correlated with the market — its **systematic risk** — is priced; idiosyncratic risk can be diversified away for free.

## CML, SML, and Interpretation

The **Capital Market Line (CML)** is the CAL through \((0, r_f)\) and \(M\); it describes efficient portfolios only, in \((\sigma, \mathbb{E}[r])\) space. The **Security Market Line (SML)** describes *every* asset, efficient or not, in \((\beta, \mathbb{E}[r])\) space. A stock plotting above the SML is underpriced; a stock below is overpriced.

<div class="definition">
<strong>Definition (Beta).</strong> Beta measures the sensitivity of an asset's return to the market return. β = 1 means the asset moves one-for-one with the market; β &gt; 1 is aggressive (amplifies market moves); β &lt; 1 is defensive.
</div>

## Equity Beta vs Asset Beta

A firm's **asset beta** reflects the business risk of its operating assets; its **equity beta** also embeds the financial risk from leverage. Without taxes, the Modigliani–Miller logic gives

\[
\beta_A = \frac{E}{V}\,\beta_E + \frac{D}{V}\,\beta_D,
\]

which, assuming \(\beta_D \approx 0\), rearranges to the re-levering formula

\[
\beta_E = \beta_A\,\Big(1 + \frac{D}{E}\Big).
\]

Analysts use this to **unlever** a comparable firm's equity beta to estimate asset beta, then **re-lever** at the target firm's capital structure.

## Arbitrage Pricing Theory

**APT** starts from a factor model \(r_i = \alpha_i + \sum_k \beta_{ik} F_k + \varepsilon_i\). If arbitrage is impossible, expected returns must satisfy

\[
\mathbb{E}[r_i] = r_f + \sum_k \beta_{ik}\,\lambda_k,
\]

where \(\lambda_k\) is the risk premium per unit of exposure to factor \(k\). CAPM is the one-factor special case with market as the sole factor; Fama–French three- and five-factor models are popular multifactor realizations.

## WACC

When a firm is financed by both debt and equity, the average cost of capital used to discount unlevered free cash flows is the **Weighted Average Cost of Capital**:

\[
r_{\mathrm{WACC}} = \frac{E}{V}\,r_E + \frac{D}{V}\,r_D\,(1 - \tau_c).
\]

The \((1-\tau_c)\) factor captures the tax deductibility of interest.

## Tail Risk: VaR and CVaR

Variance is symmetric and penalizes upside and downside alike, which is undesirable in practice. Two tail-focused measures are standard. **Value at Risk** at level \(\alpha\) is the loss threshold exceeded with probability \(1-\alpha\); for normal returns,

\[
\mathrm{VaR}_\alpha = \mu + \sigma\,\Phi^{-1}(\alpha).
\]

**Conditional VaR** (also called Expected Shortfall) is the expected loss given that VaR is breached; for normal returns,

\[
\mathrm{CVaR}_\alpha = \mu + \sigma\,\frac{\phi(\Phi^{-1}(\alpha))}{1-\alpha}.
\]

CVaR is a coherent risk measure (subadditive), whereas VaR is not.

# Chapter 5: Market Efficiency and Capital Structure

## The Efficient Market Hypothesis

The **Efficient Market Hypothesis (EMH)** states that asset prices rapidly and fully incorporate available information. In its canonical three forms:

| Form | Information set | Implication |
|---|---|---|
| Weak | Past prices and volumes | Technical analysis cannot earn abnormal returns |
| Semi-strong | All public information | Fundamental analysis of public data is useless |
| Strong | All information, public or private | Even insiders cannot earn abnormal returns |

Empirical tests of EMH face the **joint hypothesis problem**: rejecting efficiency requires a model of expected returns, so any test is a joint test of efficiency and that model.

<div class="theorem">
<strong>Theorem (Dutch book / no-arbitrage).</strong> If market prices admit a strategy with zero cost, non-negative payoff in every state, and strictly positive payoff in at least one state, then the market is inefficient and an arbitrageur can profit without risk. Market equilibrium therefore demands absence of such strategies.
</div>

Behavioral finance critiques emphasize systematic biases — overconfidence, anchoring, herding, prospect-theory loss aversion — that may leave prices persistently misaligned when **limits to arbitrage** (short-sale constraints, noise-trader risk, borrowing limits) prevent smart money from correcting them.

## Modigliani–Miller Propositions

The starting question of capital structure theory is: does the mix of debt and equity affect firm value? In a world without taxes, bankruptcy costs, agency costs, or asymmetric information, the answer is no.

<div class="theorem">
<strong>Theorem (MM Proposition I, no taxes).</strong> The total market value of a firm is independent of its capital structure: <em>V</em><sub><em>L</em></sub> = <em>V</em><sub><em>U</em></sub>. Proof sketch — if two otherwise identical firms had different values, an arbitrageur could sell shares of the overpriced firm, borrow or lend on personal account to replicate the other's cash flow, and lock in a riskless profit.
</div>

<div class="definition">
<strong>Definition (MM Proposition II).</strong> The cost of equity is a linear increasing function of leverage: <em>r</em><sub><em>E</em></sub> = <em>r</em><sub>0</sub> + (<em>r</em><sub>0</sub> − <em>r</em><sub><em>D</em></sub>) <em>D</em>/<em>E</em>, where <em>r</em><sub>0</sub> is the cost of capital of the unlevered firm.
</div>

More debt raises the riskiness of equity, so shareholders demand a higher return — but the weighted average exactly offsets this, leaving firm value unchanged.

## MM With Corporate Taxes

Once interest is tax-deductible, debt generates a **tax shield** equal to \(\tau_c r_D D\) per year. Capitalizing this perpetuity gives

\[
V_L = V_U + \tau_c D,
\]

and the cost of equity becomes \(r_E = r_0 + (r_0 - r_D)(1-\tau_c)D/E\). Taken to its logical extreme this would imply 100% debt financing.

## Limits to Debt

Reality bounds leverage through **financial distress costs** (direct bankruptcy costs and indirect costs like lost customers and underinvestment), **agency costs** (risk-shifting and asset substitution by shareholders), and **informational frictions** (debt overhang, pecking order). Optimal capital structure trades off the tax shield against expected distress costs — the **trade-off theory**.

## Dividend Policy

In a frictionless MM world, dividend policy is also irrelevant: a shareholder wanting more cash today can sell shares; one wanting less can reinvest dividends. Once one introduces taxes, transaction costs, signaling, and clientele effects, the choice between dividends and share repurchases becomes nontrivial, though the MM benchmark remains the right starting point.

# Chapter 6: Derivatives — Options, Forwards, Swaps

Derivatives are instruments whose payoff depends on an underlying asset. We treat them in the spirit of **no-arbitrage pricing**: the value of a derivative is the cost of a portfolio that replicates its payoff.

## Payoffs and Basic Strategies

A **European call** pays \((S_T - K)^+\) at maturity \(T\); a **European put** pays \((K - S_T)^+\). Simple strategies combine these with the underlying:

- **Covered call**: long stock + short call — caps upside, earns premium.
- **Protective put**: long stock + long put — floors downside, like insurance.
- **Bull spread (calls)**: long call at \(K_1\), short call at \(K_2 > K_1\) — moderate bullish view.
- **Bear spread (puts)**: symmetric bearish counterpart.
- **Straddle**: long call + long put at the same strike — profits from large moves in either direction.

## Put–Call Parity

<div class="theorem">
<strong>Theorem (Put–call parity).</strong> For a non-dividend-paying stock with European options of strike <em>K</em> and maturity <em>T</em>, <em>C</em> − <em>P</em> = <em>S</em><sub>0</sub> − <em>K</em> <em>e</em><sup>−<em>rT</em></sup>.
</div>

<div class="proof">
Consider two portfolios. Portfolio A is long a call and short a put with identical strike <em>K</em> and maturity <em>T</em>. Portfolio B is long the stock and short <em>K</em> zero-coupon bonds maturing at <em>T</em>. At maturity both pay <em>S</em><sub><em>T</em></sub> − <em>K</em>. By no-arbitrage they must cost the same today, giving <em>C</em> − <em>P</em> = <em>S</em><sub>0</sub> − <em>K</em> <em>e</em><sup>−<em>rT</em></sup>.
</div>

## One-Period Binomial Pricing

Assume that over a period of length \(\Delta t\) the stock either goes up by a factor \(u\) to \(uS_0\) or down by \(d\) to \(dS_0\), with \(d < e^{r\Delta t} < u\) to prevent arbitrage. Let \(C_u, C_d\) be the call payoffs in the two states. Form a replicating portfolio of \(\Delta\) shares and \(B\) bonds with \(\Delta \cdot uS_0 + B e^{r\Delta t} = C_u\) and analogously for the down state. Solving and discounting gives

\[
C_0 = e^{-r\Delta t}\,\big[q\,C_u + (1-q)\,C_d\big],\qquad q = \frac{e^{r\Delta t} - d}{u - d}.
\]

The number \(q\) is the **risk-neutral probability**; under it the discounted stock price is a martingale. This is the seed of the fundamental theorem of asset pricing.

## Multi-Period Binomial and Black–Scholes

Chaining \(n\) one-period binomial steps gives a multi-period lattice priced by backward induction. As \(n \to \infty\) with \(u = e^{\sigma\sqrt{\Delta t}}\), \(d = 1/u\), \(\Delta t = T/n\), the log-stock price converges to a Brownian motion with drift, and the binomial price converges to the **Black–Scholes formula**:

\[
C = S_0\,N(d_1) - K e^{-rT}\,N(d_2),
\]

with

\[
d_1 = \frac{\ln(S_0/K) + (r + \tfrac12 \sigma^2)T}{\sigma\sqrt{T}},\qquad d_2 = d_1 - \sigma\sqrt{T}.
\]

Here \(N(\cdot)\) is the standard normal CDF and \(\sigma\) is the volatility of log-returns.

<div class="example">
<strong>Example (binomial).</strong> Let <em>S</em><sub>0</sub> = 100, <em>K</em> = 100, <em>r</em> = 5<em>%</em>, Δ<em>t</em> = 1, <em>u</em> = 1.2, <em>d</em> = 0.8. Then <em>q</em> = (<em>e</em><sup>0.05</sup> − 0.8)/(1.2 − 0.8) ≈ 0.628. The call pays 20 up and 0 down, so <em>C</em><sub>0</sub> ≈ <em>e</em><sup>−0.05</sup> · 0.628 · 20 ≈ 11.95.
</div>

## Forwards and Swaps

A **forward contract** locks in a purchase price \(F_0\) today for delivery of the asset at \(T\). For a non-dividend asset, cash-and-carry arbitrage pins the forward price at

\[
F_0 = S_0\,e^{rT},
\]

and with continuous dividend yield \(q\), \(F_0 = S_0 e^{(r-q)T}\). A **swap** exchanges two streams of cash flows — most commonly fixed vs floating interest. An interest rate swap can be decomposed into a portfolio of forward rate agreements, each priced individually, and its value is the present-value difference of the two legs. At initiation, the fixed rate is chosen so that this difference is zero, which makes the swap costless to enter.

<div class="remark">
<strong>Remark.</strong> Put–call parity, binomial pricing, Black–Scholes, and forward pricing are all consequences of the same principle — absence of arbitrage — applied under progressively richer models of how the underlying evolves. Mastering one cements the rest.
</div>
