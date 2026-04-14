---
title: "ACTSC 446: Mathematics of Financial Markets"
prof: "Bin Li"
subjects: "ACTSC"
---

## Sources and References

- **Primary textbooks** — Shreve, S.E. *Stochastic Calculus for Finance I: The Binomial Asset Pricing Model*, Springer, 2004; Shreve, S.E. *Stochastic Calculus for Finance II: Continuous-Time Models*, Springer, 2004.
- **Supplementary texts** — McDonald, R.L. *Derivatives Markets*, 3rd ed., Pearson, 2013; Hull, J.C. *Options, Futures, and Other Derivatives*, 11th ed., Pearson, 2021; Björk, T. *Arbitrage Theory in Continuous Time*, 4th ed., Oxford University Press, 2019.
- **Online resources** — MIT OpenCourseWare 18.S096 *Topics in Mathematics of Financial Markets*; Stanford MS&E 348 lecture notes on derivative pricing; Tim Leung's lecture notes on stochastic calculus and option pricing.

# Chapter 1: Derivatives Markets and Basic Strategies

A **derivative** is a contract whose payoff is determined by the future value of an underlying quantity — most often the price of a traded asset such as a stock, bond, commodity, or foreign currency, but possibly also an interest rate, an index, or even another derivative. The mathematics of derivative pricing grew out of the deceptively simple principle that two portfolios with identical future payoffs must, in a frictionless market, command the same price today. This single principle — the absence of arbitrage — underlies essentially every formula in the course.

## Forwards, Futures, and Swaps

A **forward contract** obligates one party to buy, and another to sell, a prescribed asset at a prescribed future date \(T\) for a prescribed delivery price \(K\). No money changes hands at inception. The long forward's payoff at expiry is \(S_T - K\) and the short forward's payoff is \(K - S_T\), where \(S_T\) denotes the spot price at delivery. A replication argument shows that the fair delivery price for a forward on a non-dividend-paying asset is \(F_0 = S_0 e^{rT}\).

**Futures** are exchange-traded forwards that are marked-to-market daily through a margin account; **swaps** exchange streams of cash flows — commonly a fixed leg against a floating leg in an interest-rate swap. Though their payoff structures look different, all three instruments are linear in the underlying and may be priced by a no-arbitrage replication argument alone.

## Options

An **option** grants its holder a right, but not an obligation, to trade the underlying on specified terms. A **European call** with strike \(K\) and maturity \(T\) pays \((S_T - K)^+\) at expiry; a **European put** pays \((K - S_T)^+\). **American** options may be exercised at any time up to and including \(T\), which introduces an optimal-stopping problem on top of the pricing problem.

Options introduce nonlinearity, and it is this nonlinearity that makes them mathematically interesting: a linear combination of call and put payoffs can approximate any reasonable terminal distribution of the underlying, so in a deep sense the collection of European options spans the space of marketed payoffs.

## Payoff Diagrams and Common Strategies

Traders combine calls, puts, and the underlying into strategies whose payoffs express specific views on future prices and volatility.

| Strategy | Construction | Payoff character |
|---|---|---|
| Covered call | Long stock + short call | Caps upside, earns premium |
| Protective put | Long stock + long put | Floors downside |
| Bull call spread | Long call (low K) + short call (high K) | Bounded bullish bet |
| Bear put spread | Long put (high K) + short put (low K) | Bounded bearish bet |
| Butterfly | Long 1 call K_1, short 2 calls K_2, long 1 call K_3 | Bet on pinning near K_2 |
| Straddle | Long call + long put, same K | Long volatility |
| Strangle | Long OTM call + long OTM put | Cheaper long-volatility |

<div class="example">
<strong>Protective put.</strong> An investor holds 100 shares at 50 dollars apiece and is worried about a short-term decline. She buys one put with strike 48 dollars, paying a premium of 2 dollars per share. At expiry her total position is worth \(\max(S_T, 48) - 2\) per share, so her worst-case value per share is 46 dollars while she retains almost all upside. The put behaves like an insurance policy: it charges a premium in exchange for capping the loss.
</div>

## Put–Call Parity

Put–call parity is the single most important static relationship in derivatives. Consider two portfolios on a non-dividend-paying stock:

- Portfolio A: long one European call, short one European put, both with strike \(K\) and maturity \(T\).
- Portfolio B: long one share, short a zero-coupon bond paying \(K\) at \(T\).

At expiry, portfolio A pays \((S_T-K)^+ - (K-S_T)^+ = S_T - K\); portfolio B pays \(S_T - K\). Both portfolios are non-random functions of \(S_T\) and produce identical payoffs, so their time-zero values must agree:

\[
C - P \;=\; S_0 - K e^{-rT}.
\]

With a continuous dividend yield \(q\), the share must be replaced by \(e^{-qT}\) shares to reproduce one share at time \(T\), giving \(C - P = S_0 e^{-qT} - K e^{-rT}\). Any violation of parity creates an immediate arbitrage by holding one portfolio long and the other short.

<div class="theorem">
<strong>Put–call parity.</strong> For European options written on a non-dividend-paying asset with continuously compounded risk-free rate \(r\), strike \(K\), and maturity \(T\), the call price \(C\) and put price \(P\) at time zero satisfy \(C - P = S_0 - K e^{-rT}\).
</div>

# Chapter 2: One-Period and Multi-Period Binomial Models

The binomial model, due to Cox, Ross, and Rubinstein (1979), is the cleanest setting in which no-arbitrage pricing can be carried out by elementary algebra. Despite its simplicity it foreshadows every feature of the continuous-time theory: replication, risk-neutral measures, martingale pricing, and American-style optimal stopping.

## The One-Period Model

Fix a one-period horizon of length \(\Delta t\). The stock takes initial value \(S_0\) and at time \(\Delta t\) moves either up to \(u S_0\) or down to \(d S_0\) with \(0 < d < u\). A riskless bond earns interest at rate \(r\), so one dollar becomes \(e^{r\Delta t}\). A European derivative pays \(V_u\) in the up state and \(V_d\) in the down state.

The central idea is **replication**. Construct a portfolio \((\Delta, B)\) consisting of \(\Delta\) shares and \(B\) dollars in the bond. Its time-\(\Delta t\) value equals \(V_u\) and \(V_d\) respectively when

\[
\Delta \, u S_0 + B e^{r\Delta t} \;=\; V_u, \qquad \Delta \, d S_0 + B e^{r\Delta t} \;=\; V_d.
\]

Solving gives \(\Delta = (V_u - V_d)/((u-d) S_0)\) and \(B = e^{-r\Delta t}(u V_d - d V_u)/(u-d)\). The time-zero cost of this portfolio is

\[
V_0 \;=\; \Delta S_0 + B \;=\; e^{-r\Delta t}\bigl[\tilde p\, V_u + (1-\tilde p)\, V_d\bigr], \qquad \tilde p \;=\; \frac{e^{r\Delta t} - d}{u - d}.
\]

The number \(\tilde p\) is the **risk-neutral probability** of an up move. The absence of arbitrage is exactly the requirement \(d < e^{r\Delta t} < u\), which is what makes \(\tilde p \in (0,1)\).

<div class="definition">
<strong>Risk-neutral probability.</strong> Given a one-period binomial model with up factor \(u\), down factor \(d\), and riskless growth factor \(R = e^{r\Delta t}\) satisfying \(d < R < u\), the risk-neutral probability of an up move is \(\tilde p = (R - d)/(u - d)\). Under this probability the discounted stock price is a martingale: \(\tilde{\mathbb E}[S_{\Delta t}]/R = S_0\).
</div>

## The Multi-Period Tree

Stringing \(N\) one-period models together produces a recombining binomial tree with \(N+1\) terminal nodes. The price of a European claim \(V_N = g(S_N)\) is computed by **backward induction**: at each interior node,

\[
V_n \;=\; e^{-r\Delta t}\bigl[\tilde p\, V_{n+1}^{u} + (1-\tilde p)\, V_{n+1}^{d}\bigr].
\]

Equivalently, under the risk-neutral measure \(\tilde{\mathbb P}\),

\[
V_0 \;=\; e^{-rN\Delta t}\, \tilde{\mathbb E}\bigl[g(S_N)\bigr] \;=\; e^{-rN\Delta t} \sum_{k=0}^{N} \binom{N}{k}\tilde p^{\,k}(1-\tilde p)^{N-k}\, g\bigl(u^k d^{N-k} S_0\bigr).
\]

## American Options and the Snell Envelope

An American option may be exercised at any of the dates \(0,\Delta t,\ldots,N\Delta t\). The replication argument now meets an optimal-stopping problem. Backward induction still works but at each node we must take the larger of the continuation value and the immediate exercise payoff:

\[
V_n \;=\; \max\!\bigl\{\, g(S_n),\; e^{-r\Delta t}\bigl[\tilde p\, V_{n+1}^u + (1-\tilde p)\, V_{n+1}^d\bigr]\,\bigr\}.
\]

The resulting process \((V_n)\) is the **Snell envelope** of the discounted payoff under \(\tilde{\mathbb P}\); it is the smallest supermartingale dominating the payoff.

<div class="example">
<strong>Two-period binomial call.</strong> Let \(S_0 = 100\) dollars, \(u = 1.2\), \(d = 0.8\), \(r = 0.05\), \(\Delta t = 1\), and \(K = 100\) dollars. Then \(R = e^{0.05} \approx 1.0513\) and \(\tilde p \approx 0.628\). Terminal stock values are 144, 96, and 64 dollars, so call payoffs are 44, 0, and 0. Rolling back one period: the up node gives \(e^{-0.05}(0.628 \cdot 44) \approx 26.28\) dollars, the down node gives 0. Rolling back once more: \(V_0 \approx e^{-0.05}(0.628 \cdot 26.28) \approx 15.70\) dollars.
</div>

## Convergence to Black–Scholes

Choose \(u = e^{\sigma\sqrt{\Delta t}}\), \(d = e^{-\sigma\sqrt{\Delta t}}\), and \(\Delta t = T/N\). As \(N \to \infty\), a local central limit argument shows the distribution of \(\ln S_N\) under \(\tilde{\mathbb P}\) converges to a normal with mean \(\ln S_0 + (r - \sigma^2/2)T\) and variance \(\sigma^2 T\). The binomial call price converges to the Black–Scholes call price, and the whole discrete model limits onto the continuous one.

# Chapter 3: General Single- and Multi-Period Pricing

The binomial model is best understood as a particular case of a much more abstract no-arbitrage theory built on measure-theoretic probability. Let \(\Omega\) be a finite sample space, \(\mathbb P\) a probability measure assigning strictly positive mass to each outcome, and \(\mathcal F\) the power set. A market model specifies \(d+1\) assets whose prices form \(\mathcal F\)-measurable random variables.

## State Prices and Arbitrage

A **state-price vector** (or pricing kernel) is a vector \(\psi \in \mathbb R_{>0}^{|\Omega|}\) of strictly positive weights such that every traded asset's current price equals the \(\psi\)-weighted sum of its payoffs across states. If such a \(\psi\) exists, there is no arbitrage: any strictly positive payoff has strictly positive price.

The existence of a positive \(\psi\) is equivalent, by a separating-hyperplane argument (the Farkas lemma), to the absence of arbitrage. Normalising \(\psi\) by the riskless discount factor yields a probability measure \(\tilde{\mathbb P}\) under which each asset's discounted price equals its expected discounted payoff. That measure is the **equivalent martingale measure** (EMM).

## Fundamental Theorems of Asset Pricing

<div class="theorem">
<strong>First Fundamental Theorem.</strong> A finite-state market model admits no arbitrage if and only if there exists at least one equivalent martingale measure — a probability \(\tilde{\mathbb P}\) equivalent to the physical measure \(\mathbb P\) under which the discounted prices of all traded assets are martingales.
</div>

<div class="theorem">
<strong>Second Fundamental Theorem.</strong> A no-arbitrage market is complete (every contingent claim is replicable) if and only if the equivalent martingale measure is unique.
</div>

In an incomplete market several EMMs co-exist, and each assigns a different price to a non-replicable claim — prices are only restricted to lie in the no-arbitrage interval spanned by the EMMs.

## Multi-Period Models and Martingale Pricing

Moving to multiple periods we introduce a filtration \((\mathcal F_n)_{n=0}^{N}\) representing the information available at each time. A trading strategy \((\theta_n)\) is predictable, and the associated wealth process \(X_n\) is **self-financing** if changes in wealth come only from price moves, not from injections or withdrawals of cash. Under an EMM \(\tilde{\mathbb P}\), the discounted wealth of any self-financing strategy is a martingale; for a replicable contingent claim \(V_N\),

\[
V_0 \;=\; \tilde{\mathbb E}\!\left[e^{-rT}\, V_N\right], \qquad V_n \;=\; \tilde{\mathbb E}\!\left[e^{-r(T-n\Delta t)} V_N \,\middle|\, \mathcal F_n\right].
\]

<div class="example">
<strong>Replicating a digital in a two-state world.</strong> Suppose only two states exist, a stock is worth 110 or 90 dollars, and a bond grows from 1 to 1.05. A digital option paying 10 dollars if the stock rises is replicated by the portfolio solving \(110\Delta + 1.05 B = 10\), \(90\Delta + 1.05 B = 0\). Solving gives \(\Delta = 0.5\) and \(B \approx -42.86\) dollars. The time-zero cost — the fair price — is \(0.5 \cdot 100 - 42.86 \approx 7.14\) dollars, and indeed \(e^{-r\Delta t}\tilde p \cdot 10\) reproduces this with \(\tilde p = (1.05 - 0.9)/(1.1 - 0.9) = 0.75\).
</div>

# Chapter 4: Brownian Motion and Itô Calculus

Continuous-time finance rests on Brownian motion as its driving noise source. Its construction and calculus, developed by Wiener, Lévy, Itô, and others, turns intuitive differential statements about prices into rigorous stochastic differential equations.

## Standard Brownian Motion

<div class="definition">
<strong>Standard Brownian motion.</strong> A stochastic process \((B_t)_{t \ge 0}\) is a standard Brownian motion if (i) \(B_0 = 0\) almost surely; (ii) for \(0 \le s < t\) the increment \(B_t - B_s\) is normally distributed with mean zero and variance \(t - s\); (iii) increments over disjoint intervals are independent; (iv) sample paths \(t \mapsto B_t\) are continuous.
</div>

Brownian paths are nowhere differentiable and have infinite total variation, so the classical Riemann–Stieltjes integral against \(B_t\) does not exist. Itô resolved the difficulty by defining \(\int_0^t H_s\, dB_s\) for adapted integrands \(H\) as an \(L^2\) limit of simple integrals and showing the resulting process is a martingale.

A defining algebraic fact is the **quadratic variation**:

\[
[B,B]_t \;=\; \lim_{\|\Pi\| \to 0} \sum_{i} (B_{t_{i+1}} - B_{t_i})^2 \;=\; t \quad \text{in probability.}
\]

Heuristically, \((dB_t)^2 = dt\), and it is this non-vanishing second-order term that makes stochastic calculus depart from ordinary calculus.

## Itô's Formula

Itô's formula is the chain rule for stochastic processes. Its simplest version handles smooth functions of time and a single Brownian motion.

<div class="theorem">
<strong>Itô's formula.</strong> Let \(f \in C^{1,2}([0,T] \times \mathbb R)\). Then

\[
df(t, B_t) \;=\; \frac{\partial f}{\partial t}(t,B_t)\, dt + \frac{\partial f}{\partial x}(t,B_t)\, dB_t + \tfrac{1}{2}\, \frac{\partial^2 f}{\partial x^2}(t,B_t)\, dt.
\]

More generally, for an Itô process \(dX_t = \mu_t\,dt + \sigma_t\,dB_t\), the process \(Y_t = f(t,X_t)\) satisfies

\[
dY_t \;=\; f_t\,dt + f_x\,dX_t + \tfrac12 f_{xx}\,\sigma_t^2\, dt.
\]
</div>

## Geometric Brownian Motion

The standard model of a risky asset writes \(dS_t = \mu S_t\, dt + \sigma S_t\, dB_t\). Applying Itô's formula to \(f(x) = \ln x\) gives

\[
d\ln S_t \;=\; \bigl(\mu - \tfrac12 \sigma^2\bigr) dt + \sigma\, dB_t,
\]

which integrates directly to

\[
S_t \;=\; S_0 \exp\!\Bigl(\bigl(\mu - \tfrac12 \sigma^2\bigr)t + \sigma B_t\Bigr).
\]

So \(\ln S_t\) is normal with mean \(\ln S_0 + (\mu - \tfrac12\sigma^2)t\) and variance \(\sigma^2 t\), and \(S_t\) is **lognormal**. The parameter \(\mu\) is the drift (expected log-return plus \(\sigma^2/2\)), and \(\sigma\) is the volatility.

<div class="example">
<strong>Itô for \(B_t^2\).</strong> Setting \(f(x) = x^2\), Itô's formula gives \(d(B_t^2) = 2 B_t\, dB_t + dt\), so \(B_t^2 - t\) is a martingale. This is the prototype verification that the classical product rule must be corrected by a quadratic-variation term in stochastic calculus.
</div>

# Chapter 5: The Black–Scholes Model

Black and Scholes (1973) and Merton (1973) showed that in a frictionless market where the underlying follows geometric Brownian motion and a continuously compounded riskless rate \(r\) is available, any European derivative can be dynamically replicated, yielding a unique no-arbitrage price governed by a linear parabolic PDE.

## Risk-Neutral Dynamics

Under the physical measure, \(dS_t = \mu S_t\,dt + \sigma S_t\,dB_t\). Girsanov's theorem lets us change to an equivalent probability \(\tilde{\mathbb P}\) under which \(\tilde B_t = B_t + \theta t\), with market price of risk \(\theta = (\mu - r)/\sigma\), is a standard Brownian motion. Under \(\tilde{\mathbb P}\),

\[
dS_t \;=\; r S_t\, dt + \sigma S_t\, d\tilde B_t,
\]

so discounted prices are martingales. The time-zero price of a derivative paying \(V_T = g(S_T)\) is

\[
V_0 \;=\; e^{-rT}\, \tilde{\mathbb E}\bigl[g(S_T)\bigr].
\]

## The Black–Scholes PDE

Assume \(V_t = V(t, S_t)\) for a smooth function \(V\). Applying Itô's formula to \(V(t,S_t)\) and constructing a self-financing portfolio long one option and short \(V_S\) shares eliminates the \(d\tilde B_t\) term. Setting the drift equal to the riskless rate on the hedged portfolio yields the **Black–Scholes PDE**:

\[
V_t + r S V_S + \tfrac12 \sigma^2 S^2 V_{SS} \;=\; r V, \qquad V(T,S) = g(S).
\]

Solving this PDE with terminal data \(g(S) = (S-K)^+\), or equivalently evaluating the risk-neutral expectation directly using the lognormal density, produces the celebrated closed form.

## The Black–Scholes Call Formula

<div class="theorem">
<strong>Black–Scholes formula.</strong> In the Black–Scholes model with spot \(S_0\), strike \(K\), maturity \(T\), riskless rate \(r\), and volatility \(\sigma\), a European call is worth

\[
C(S_0, T) \;=\; S_0\, N(d_1) - K e^{-rT}\, N(d_2),
\]

where \(N\) is the standard normal cdf,

\[
d_1 \;=\; \frac{\ln(S_0/K) + (r + \sigma^2/2)T}{\sigma\sqrt T}, \qquad d_2 \;=\; d_1 - \sigma\sqrt T.
\]

The matching put price follows from put–call parity: \(P = K e^{-rT} N(-d_2) - S_0 N(-d_1)\).
</div>

## The Greeks

The **Greeks** are partial derivatives of the option value with respect to its inputs and measure exposures a hedger cares about. For a European call:

| Greek | Definition | Call value |
|---|---|---|
| Delta \(\Delta\) | \(\partial C/\partial S\) | \(N(d_1)\) |
| Gamma \(\Gamma\) | \(\partial^2 C/\partial S^2\) | \(\phi(d_1)/(S_0 \sigma \sqrt T)\) |
| Vega \(\nu\) | \(\partial C/\partial \sigma\) | \(S_0 \phi(d_1)\sqrt T\) |
| Theta \(\Theta\) | \(\partial C/\partial t\) | \(-S_0 \phi(d_1)\sigma/(2\sqrt T) - rK e^{-rT} N(d_2)\) |
| Rho \(\rho\) | \(\partial C/\partial r\) | \(K T e^{-rT} N(d_2)\) |

Here \(\phi\) is the standard normal pdf. Delta tells us how many shares to hold to hedge the option locally; Gamma measures the rate at which Delta changes and dictates how often we must rebalance; Vega and Rho capture first-order sensitivities to volatility and interest-rate moves.

## Delta Hedging

A **delta-hedged** portfolio is short one call and long \(\Delta\) shares, instantaneously immune to small moves in \(S\). In continuous time and under the model's assumptions, a self-financing portfolio that is continuously rebalanced to remain delta-neutral replicates the option exactly. In practice hedging is done at discrete times, and the residual hedging error is driven by Gamma and the realised-versus-implied volatility gap.

<div class="example">
<strong>Pricing a three-month call.</strong> Take \(S_0 = 100\) dollars, \(K = 100\) dollars, \(T = 0.25\), \(r = 0.03\), \(\sigma = 0.20\). Then \(d_1 = (0 + (0.03 + 0.02) \cdot 0.25)/(0.2 \cdot 0.5) = 0.125\), \(d_2 = 0.125 - 0.1 = 0.025\). Using \(N(0.125) \approx 0.5497\) and \(N(0.025) \approx 0.5100\) gives \(C \approx 100 \cdot 0.5497 - 100 \cdot e^{-0.0075} \cdot 0.5100 \approx 4.37\) dollars. A trader who writes the call collects this premium and hedges by holding \(0.55\) shares per option, rebalancing as \(S\) moves.
</div>

# Chapter 6: Interest Rate Models and Bond Pricing

Modelling interest rates is harder than modelling a single stock because the primary object is an entire yield curve, not a scalar price. The short-rate approach writes the instantaneous riskless rate \(r_t\) as a stochastic process and expresses all bond prices as expectations under a risk-neutral measure.

## Short-Rate Models

The **Vasicek model** (1977) posits a mean-reverting Gaussian short rate:

\[
dr_t \;=\; a(b - r_t)\, dt + \sigma\, dB_t,
\]

with mean-reversion speed \(a > 0\), long-run level \(b\), and volatility \(\sigma\). Because the driving noise is Gaussian, \(r_t\) can go negative — a known drawback, though one that has become less of a practical nuisance in low-rate environments. The **Cox–Ingersoll–Ross (CIR) model** (1985) replaces the constant diffusion with a square-root diffusion:

\[
dr_t \;=\; a(b - r_t)\, dt + \sigma\sqrt{r_t}\, dB_t.
\]

Provided the Feller condition \(2ab \ge \sigma^2\) holds, CIR keeps the rate strictly positive.

## Bond Prices under the Risk-Neutral Measure

Let \(P(t,T)\) be the time-\(t\) price of a zero-coupon bond paying one dollar at maturity \(T\). Under the risk-neutral measure \(\tilde{\mathbb P}\),

\[
P(t,T) \;=\; \tilde{\mathbb E}\!\left[\exp\!\Bigl(-\int_t^T r_s\, ds\Bigr) \,\middle|\, \mathcal F_t\right].
\]

For both Vasicek and CIR the conditional expectation is computable in closed form because each belongs to the **affine term-structure** family.

<div class="theorem">
<strong>Affine term structures.</strong> In the Vasicek and CIR models, bond prices take the form \(P(t,T) = \exp\!\bigl(A(t,T) - B(t,T)\, r_t\bigr)\) for deterministic functions \(A\) and \(B\) solving a pair of ODEs (Riccati equations in the CIR case). For Vasicek specifically, \(B(t,T) = (1 - e^{-a(T-t)})/a\).
</div>

## Forward Rates and the Yield Curve

The **continuously compounded yield** \(y(t,T) = -\ln P(t,T)/(T - t)\) summarises the market's average expected discount over \([t,T]\). The **instantaneous forward rate** is \(f(t,T) = -\partial \ln P(t,T)/\partial T\). These functions together form the yield curve, which traders track daily and whose dynamics drive the trillion-dollar fixed-income markets.

<div class="example">
<strong>Vasicek bond price.</strong> Take \(a = 0.2\), \(b = 0.04\), \(\sigma = 0.01\), and \(r_0 = 0.03\). For a five-year zero-coupon bond, \(B(0,5) = (1 - e^{-1})/0.2 \approx 3.16\) and \(A(0,5)\) is computed from the closed-form Vasicek expression, giving \(P(0,5) \approx 0.861\). The implied yield is \(-\ln(0.861)/5 \approx 0.030\), roughly matching today's short rate because mean reversion keeps rates near their long-run level.
</div>

## Closing Remarks

These six chapters trace an arc from payoff diagrams to stochastic differential equations, unified by the single principle that arbitrage-free prices are expectations under a risk-neutral measure. The binomial model shows the mechanism in its purest algebraic form; the Fundamental Theorems of Asset Pricing generalise the idea to abstract probability spaces; Brownian motion and Itô calculus equip us with the continuous-time machinery; and the Black–Scholes and short-rate models apply that machinery to concrete markets. Everything a practitioner does — hedging, model calibration, risk attribution — is ultimately an application of these ideas.
