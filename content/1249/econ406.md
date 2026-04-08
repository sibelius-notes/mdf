---
title: "ECON 406: Money and Banking 2"
prof: "Jean-Paul Lam"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Walsh, Carl E. (2017). *Monetary Theory and Policy*, 4th Edition. MIT Press. (3rd Edition also acceptable.)

**Supplementary texts** — Woodford, Michael (2003). *Interest and Prices: Foundations of a Theory of Monetary Policy*. Princeton University Press. / Galí, Jordi (2015). *Monetary Policy, Inflation, and the Business Cycle: An Introduction to the New Keynesian Framework*, 2nd Edition. Princeton University Press. / Ljungqvist, Lars and Thomas J. Sargent (2018). *Recursive Macroeconomic Theory*, 4th Edition. MIT Press.

**Key journal articles** — Bernanke & Gertler (1995), JEP. / Clarida, Galí & Gertler (1999), JEL. / Galí (2018), JEP. / Nakamura & Steinsson (2013), Annual Review of Economics. / Kuttner (2018), JEP.

**Online resources** — Federal Reserve Board discussion papers; BIS Annual Economic Reports; Bank of Canada Staff Discussion Papers; VoxEU policy analyses; MIT OCW 14.461 Advanced Macroeconomics.

---

# Chapter 1: What is Money? Macroeconomic Foundations

## 1.1 Barter Economies and the Inefficiency of Trade Without Money

To understand why money matters, begin with an economy in which no money exists. In a barter economy, exchange requires a **double coincidence of wants**: each party must want exactly what the other offers. With \(n\) goods, the number of bilateral exchange rates is \(\frac{n(n-1)}{2}\), which grows quadratically. For \(n = 1000\) goods, barter requires nearly 500,000 relative prices — an enormous information and transactions cost burden.

The fundamental contribution of money is to **separate the act of selling from the act of buying**, collapsing the search and matching frictions of barter. A worker sells labor for money, then uses money to buy goods at any time without needing to find the exact employer-grocer bilateral coincidence.

<div class="definition">
<strong>Money as a Medium of Exchange:</strong> Any commodity or token generally accepted in payment for goods and services, valued not for its own intrinsic use but for its purchasing power. The key word is <em>generally</em> — what makes an object money is the social convention of universal acceptance, a coordination equilibrium. Fiat money systems are one Nash equilibrium; barter is another (inferior) one.
</div>

## 1.2 Money in Macroeconomic Models

Incorporating money into general equilibrium models is non-trivial because money is held despite being dominated in return by interest-bearing assets. Three standard approaches:

**Money-in-the-Utility Function (MIU) model (Sidrauski 1967).** Households derive utility directly from real money balances, capturing the convenience services money provides:

\[ U = \sum_{t=0}^{\infty} \beta^t u(c_t, m_t) \]

where \(c_t\) is consumption, \(m_t = M_t/P_t\) is real money balances, and \(\beta \in (0,1)\) is the discount factor. The first-order condition for money demand yields a money demand function relating \(m_t\) to consumption and the nominal interest rate (the opportunity cost of holding money).

**Cash-in-Advance (CIA) model (Clower 1967; Lucas & Stokey 1987).** Goods purchases require prior cash holdings — a constraint on transactions:

\[ P_t c_t \leq M_t \]

This constraint binds when the nominal interest rate is positive (money's opportunity cost), generating money demand linked directly to consumption. The CIA model yields a cleaner foundation for the Fisher equation and the real effects of inflation.

**Overlapping Generations (OLG) models.** Money can be valued as a store of value in economies where no asset spans generations. Money is held by young savers and passed to the old, creating an intrinsic demand for a "backed" fiat currency even without direct utility from balances.

## 1.3 Empirical Correlations: Money, Output, and Prices

Long-run evidence from cross-country data (covering periods of high and low inflation) robustly confirms the quantity-theoretic prediction: money growth and inflation are highly positively correlated over horizons of a decade or more.

In the short run, monetary expansions are associated with real output increases. The **monetary transmission mechanism** — how central bank actions propagate to the real economy — is studied in detail in Chapter 2.

Key stylized facts (Walsh Chapter 1):
- Money growth and inflation correlate tightly over long horizons across countries.
- In the short run, money-output correlations depend on whether monetary changes are anticipated or unanticipated.
- Velocity \(V = PY/M\) exhibits both secular trends and cyclical variation, complicating simple quantity-theory arithmetic.
- The ratio of currency to M1 rises in recessions (precautionary demand) and fell secularly with the spread of banking before rising again with digital payments uncertainty.

## 1.4 The Future of Money: Digital Currencies and Cryptocurrencies

### 1.4.1 Central Bank Digital Currencies (CBDCs)

A **central bank digital currency (CBDC)** is a digital form of a country's sovereign currency issued directly by the central bank. Unlike commercial bank deposits, a CBDC would be a direct liability of the central bank — equivalent in safety to physical banknotes but in digital form.

The Federal Reserve (2022) identified three potential models:
- **Retail CBDC:** Direct accounts at the central bank for households and firms (disintermediating commercial banks).
- **Wholesale CBDC:** Digital settlement assets for financial institutions only, improving interbank payment efficiency.
- **Indirect/hybrid CBDC:** Privately issued digital currency backed 1:1 by central bank reserves (preserving the two-tier banking system).

**Canada's exploration.** The Bank of Canada's 2022 Staff Discussion Paper examined the case for a digital Canadian dollar, concluding that the primary motivation would be to maintain public access to a safe payment instrument if physical cash use declines below a critical threshold. Adoption would need to be carefully designed to avoid bank disintermediation (a "bank run by design").

### 1.4.2 Cryptocurrencies and Decentralized Finance

**Cryptocurrencies** such as Bitcoin are decentralized digital assets that use cryptographic consensus mechanisms (proof-of-work, proof-of-stake) to record transactions without a central trusted party. They perform the unit-of-account and store-of-value functions imperfectly:
- **High volatility** makes them poor stores of value and poor units of account (price uncertainty creates large real purchasing power risk).
- **Limited acceptance** restricts their medium-of-exchange function outside specialized ecosystems.
- **Pseudonymity** attracts regulatory scrutiny for tax compliance and anti-money-laundering.

**Stablecoins** — private digital tokens pegged to a reference asset (typically the US dollar) — address the volatility problem but introduce their own risks (peg stability, reserve adequacy, run risk), as illustrated by the Terra/LUNA collapse in May 2022.

The **BIS Annual Economic Report 2022** argues that decentralized finance lacks a sound monetary foundation because it cannot provide the finality, stability, and scalability of central bank money, and proposes a "unified ledger" combining CBDC, tokenized bank deposits, and tokenized assets.

---

# Chapter 2: The Monetary Transmission Mechanism

## 2.1 Overview

The **monetary transmission mechanism** describes how changes in the central bank's policy instrument (the overnight interest rate in Canada; the federal funds rate in the US) propagate through financial markets and the real economy to affect output, employment, and inflation. Ben Bernanke famously called this the "black box" of monetary economics — we know policy works, but the precise channels and magnitudes are uncertain.

<div class="definition">
<strong>Monetary Transmission Mechanism:</strong> The set of channels through which monetary policy actions (changes in the policy rate, forward guidance, asset purchases) affect aggregate demand, output, and the price level. Key channels include the interest rate channel, exchange rate channel, asset price channel, and credit channels (bank lending and balance sheet channels).
</div>

## 2.2 The Interest Rate Channel

The textbook channel: a reduction in the nominal short-term rate reduces real short-term rates (under sticky prices in the short run); long-term real rates fall via the expectations hypothesis of the term structure; investment spending and durable goods consumption become cheaper, stimulating aggregate demand.

\[ i_s \downarrow \Rightarrow r_s \downarrow \Rightarrow r_L \downarrow \Rightarrow I \uparrow, C \uparrow \Rightarrow Y \uparrow \]

The channel's effectiveness depends on:
- **The slope of the IS curve:** Inelastic investment weakens the channel.
- **The term premium:** If long-term rates do not fall with short rates (e.g., during the "Greenspan Conundrum" of 2004–2006), the channel is impaired.
- **The zero lower bound (ZLB):** When nominal rates cannot fall further, conventional rate cuts are impossible and the channel is blocked.

## 2.3 The Exchange Rate Channel

Lower domestic interest rates reduce the return on domestic currency assets relative to foreign assets. Capital flows out (or inflows are reduced), depreciating the domestic currency. A weaker currency raises the price of imports (contributing to inflation) and lowers the price of exports (stimulating export demand).

**Uncovered Interest Parity (UIP):**

\[ i_t = i^*_t + E_t[\Delta e_{t+1}] \]

where \(e_t\) is the log nominal exchange rate (units of domestic currency per unit of foreign) and \(i^*_t\) is the foreign interest rate. UIP says the domestic rate exceeds the foreign rate by the expected currency depreciation. Under UIP, a domestic rate cut is associated with an expected future appreciation (after an initial depreciation).

For Canada, with approximately 60–70% of exports going to the US, the exchange rate channel is highly relevant. Studies suggest that a 100 basis point cut in the policy rate depreciates the Canadian dollar by roughly 2–3% within a few months, boosting net exports.

## 2.4 The Asset Price Channel (Tobin's q and Wealth Effects)

**Tobin's q** (Tobin 1969) is the ratio of the market value of installed capital to its replacement cost:

\[ q = \frac{\text{Market value of firm}}{\text{Replacement cost of capital}} \]

When the policy rate is cut, equity prices rise (future earnings are discounted at a lower rate), raising \(q\) above 1. Firms find it profitable to invest in new capital by issuing equity (selling shares at a premium to replacement cost). This stimulates investment without direct reliance on the interest rate.

The **wealth effect** channel: lower interest rates raise household wealth through higher equity and housing prices. Consumption increases as households spend a fraction of their new wealth — the marginal propensity to consume out of wealth (MPC\(_w\)) is estimated at approximately 3–5 cents per dollar of wealth increase.

## 2.5 The Credit Channel

Bernanke and Gertler (1995) argue that the interest rate channel alone is insufficient to explain the size and persistence of monetary policy effects. The credit channel amplifies conventional rate effects through financial frictions.

### 2.5.1 The Bank Lending Channel

Banks play a unique role in credit intermediation — they issue insured deposits and extend loans. When the central bank tightens policy:
1. Banks face higher funding costs and reduced reserve positions.
2. Banks that cannot easily substitute other funding sources (small, less-capitalized banks with limited bond market access) reduce lending.
3. Small, bank-dependent firms (without access to bond markets) face a credit crunch.

<div class="remark">
<strong>Remark — Bank Lending vs. Money View:</strong> The traditional "money view" holds that policy affects only money demand and supply. The bank lending channel adds a supply-side dimension: policy affects the availability and terms of credit, not just its cost. Evidence from cross-sectional bank data (Kashyap and Stein 2000) supports the lending channel: small banks with low liquidity buffers cut lending more aggressively after tightening.
</div>

### 2.5.2 The Balance Sheet Channel and Financial Accelerator

The **balance sheet channel** (Bernanke & Gertler 1989; Bernanke, Gertler & Gilchrist 1999) focuses on borrowers' net worth and collateral values. Higher interest rates:
1. Reduce firm cash flows (higher interest payments).
2. Reduce collateral values (lower asset prices).
3. Worsen borrowers' **agency problems** (higher leverage → more moral hazard → higher external finance premium).

The **external finance premium** (EFP) is the wedge between the cost of external finance (debt) and the opportunity cost of internal finance:

\[ \text{Borrowing rate} = r_f + \text{EFP}(\text{net worth}, \text{collateral}) \]

\(\text{EFP}\) is a decreasing function of net worth and collateral. Because asset prices are procyclical, the EFP is countercyclical — it widens in recessions, amplifying the initial shock (the **financial accelerator**).

**Gertler and Karadi (2011)** extend this framework to model unconventional monetary policy, showing that central bank purchases of financial assets can substitute for disrupted private financial intermediation, reducing the EFP even at the ZLB.

### 2.5.3 The Risk-Taking Channel

Bauer, Bernanke, and Milstein (2023) document a **risk-taking channel**: low interest rates reduce risk aversion and encourage financial institutions to take on more risk (longer duration, more leverage, lower-quality assets). While this stimulates credit supply in the short run, it may build financial vulnerabilities — a concern for macro-prudential policy.

## 2.6 The Silicon Valley Bank Failure and the Credit Channel

Metrick (2024) analyzes the March 2023 failure of Silicon Valley Bank (SVB) as a case study in how interest rate risk can translate into a systemic credit contraction. SVB accumulated long-duration assets (MBS, Treasury bonds) funded by uninsured short-term deposits. When the Fed raised rates aggressively in 2022–23:
1. SVB's bond portfolio fell sharply in market value (duration risk crystallized).
2. Depositors — predominantly large, tech-sector uninsured deposits — became aware of unrealized losses and began withdrawing.
3. A classic **bank run** ensued: SVB failed on March 10, 2023; Signature Bank followed two days later.

The episode illustrates that the transmission of monetary policy can include financial stability effects that conventional models miss: rapid rate increases can impair bank balance sheets and create a contractionary credit channel through bank failures.

## 2.7 Expectations, Lags, and Communication

Monetary policy operates with **long and variable lags** (Friedman's famous observation). The full effect of a rate change on inflation typically takes 18–24 months. Expectations management is therefore critical: if agents expect the central bank to maintain low rates, long-term rates stay low even before any actual rate cut.

Modern central banks have invested heavily in communication strategies (forward guidance, inflation reports, press conferences) to manage expectations. Mann (Bank of England 2023) argues that policy effectiveness depends crucially on how expectations are anchored: if households and firms expect that high inflation is temporary (central bank has credibility), a wage-price spiral is less likely and the sacrifice ratio (output lost per point of inflation reduction) is lower.

---

# Chapter 3: General Equilibrium Models with Money

## 3.1 The Sidrauski Model and Superneutrality

The **Sidrauski (1967) model** is the canonical money-in-the-utility-function framework. A representative household maximizes:

\[ \sum_{t=0}^{\infty} \beta^t u(c_t, m_t) \]

subject to the budget constraint. In steady state, the **Euler equation** for consumption is:

\[ u_c(c, m) = \beta(1+r) u_c(c', m') \]

In steady state with constant inflation \(\pi\), the real interest rate equals \(r = 1/\beta - 1\) regardless of the inflation rate (determined by preferences alone). This is **superneutrality**: the inflation rate does not affect the steady-state capital stock or real variables.

The steady-state money demand condition equates the marginal utility of real balances to the opportunity cost of holding money:

\[ \frac{u_m(c, m)}{u_c(c, m)} = \frac{i}{1+i} = \frac{R-1}{R} \]

where \(R = (1+r)(1+\pi) = 1+i\) is the gross nominal interest rate.

## 3.2 The Friedman Rule

The **Friedman Rule** (Milton Friedman 1969) states that the optimal monetary policy is to set the nominal interest rate to zero: \(i^* = 0\).

At \(i = 0\), the marginal cost of holding money (the opportunity cost, i.e., the nominal interest rate) equals the marginal cost of producing money (approximately zero for fiat money). This is Pareto-optimal: money should be provided to satiation.

Achieving \(i = 0\) requires deflation: if the real interest rate is \(r > 0\), then \(i = r + \pi = 0\) requires \(\pi = -r < 0\). The Friedman Rule prescribes a **deflation** equal in magnitude to the real interest rate.

<div class="theorem">
<strong>Friedman Rule:</strong> In a model where money enters the utility function or is required in a cash-in-advance constraint, the social optimum involves setting the nominal interest rate to zero, achieved by deflating the price level at the rate equal to the real interest rate. At this point, the opportunity cost of holding money is zero, and the marginal utility of real balances equals the (near-zero) marginal cost of producing money.
</div>

**Critique of the Friedman Rule.** In New Keynesian models with sticky prices, zero nominal interest rates at the ZLB forgo the ability to use rate cuts as a stabilization tool. In environments with multiple distortions (e.g., taxes, imperfect competition), the Ramsey-optimal tax on money (i.e., the inflation rate) is generally positive. Benigno and Nisticò (2020) and others show that the Friedman Rule rarely holds outside the simple MIU model.

## 3.3 Optimal Inflation in the Presence of Frictions

What is the **optimal rate of inflation**? This is among the central questions of monetary economics. Arguments for low positive inflation (around 2%):

1. **Downward nominal wage rigidity.** Workers resist nominal pay cuts; low positive inflation "greases the wheels of the labor market" by allowing real wages to fall in recessions without nominal cuts.
2. **Buffer against the ZLB.** A higher inflation target implies higher nominal interest rates in steady state, giving the central bank more room to cut rates before hitting the ZLB. Blanchard, Dell'Ariccia, and Mauro (2010) argued for a 4% target post-GFC.
3. **Revenue from seigniorage.** Governments collect revenue by expanding the money supply (seigniorage = \(\pi \times (M/P)\)); small amounts of seigniorage may allow other distortionary taxes to be reduced.

Arguments against high inflation:
- Relative price distortions (shoe-leather costs, menu costs).
- Erosion of the store-of-value function.
- Redistribution from creditors to debtors (when unanticipated).
- Reduced informational content of prices (Fischer 1981).

<div class="example">
<strong>Example — India's 2016 Demonetization:</strong> Lahiri (2020) analyzes India's unexpected November 2016 demonetization of 500- and 1000-rupee notes, which removed 86% of currency by value almost overnight. This natural experiment revealed money's importance: output fell sharply in cash-dependent sectors (informal economy, agriculture), while digital payments surged. The episode illustrates that abrupt changes to the monetary system impose large transactions costs and disruption even in the short run — underscoring why gradual monetary policy is preferred.
</div>

---

# Chapter 4: Price Rigidities and Their Macroeconomic Implications

## 4.1 Evidence on Price Stickiness

**Nakamura and Steinsson (2013)** survey the microeconomic evidence on price adjustment. Key findings:

- **Frequency of price change.** Using US CPI micro-data, the median duration between price changes is approximately 4–8 months (depending on whether temporary sales are counted). Excluding sales, price durations are considerably longer.
- **Heterogeneity.** Prices in some sectors (energy, fresh food) change almost daily; prices in services (haircuts, healthcare) may remain fixed for a year or more.
- **Asymmetry.** Price increases are more frequent than price decreases, consistent with downward nominal rigidity (menu costs plus money illusion).
- **State-dependence vs. time-dependence.** Calvo pricing assumes a constant probability of price adjustment regardless of economic conditions (time-dependent); empirically, price adjustment accelerates during high-inflation periods (state-dependent).

## 4.2 Theories of Price Rigidity

### 4.2.1 Menu Costs

Even small **menu costs** — the costs of changing a price (reprinting catalogs, updating systems, managerial attention) — can rationalize infrequent price adjustment. Mankiw (1985) showed that menu costs can generate large macroeconomic rigidities: the private cost of adjusting a price is a second-order loss (near a profit maximum), but the social benefit of price flexibility is first-order (aggregate stabilization). Thus even tiny menu costs can deter firms from adjusting prices, causing large aggregate fluctuations.

### 4.2.2 Customer Markets and Implicit Contracts

Firms in markets with long-term customer relationships may maintain stable prices to avoid destroying valuable ongoing relationships. Price stability signals fairness and reduces search costs for customers.

### 4.2.3 Coordination Failure

Ball and Romer (1991) argue that complementarities in pricing create coordination failures: even if all firms would benefit from simultaneous price adjustment, no single firm has incentive to adjust alone. This creates a **strategic complementarity** in price-setting that amplifies nominal rigidities.

### 4.2.4 Sticky Information (Mankiw and Reis 2002)

Rather than prices being fixed, **information** about macroeconomic conditions may be sticky — firms update their pricing information infrequently (a Poisson process). This generates a gradual response of the price level to monetary policy, consistent with the observed hump-shaped impulse response of inflation to monetary shocks.

---

# Chapter 5: New Keynesian Models and Optimal Monetary Policy

## 5.1 The Three-Equation New Keynesian Model

The **New Keynesian (NK) model** is the dominant framework for monetary policy analysis. Its canonical form consists of three equations:

**1. The New Keynesian IS (NKIS) curve** — a forward-looking Euler equation for output:

\[ \tilde{y}_t = E_t \tilde{y}_{t+1} - \frac{1}{\sigma}(i_t - E_t \pi_{t+1} - r^n_t) + \varepsilon^{IS}_t \]

where \(\tilde{y}_t = y_t - y^*_t\) is the output gap, \(\sigma > 0\) is the intertemporal elasticity of substitution (inverse), \(i_t\) is the nominal interest rate, \(E_t \pi_{t+1}\) is expected inflation, \(r^n_t\) is the natural (Wicksellian) real rate of interest, and \(\varepsilon^{IS}_t\) is a demand shock.

**2. The New Keynesian Phillips Curve (NKPC)** — from Calvo (1983) pricing:

\[ \pi_t = \beta E_t \pi_{t+1} + \kappa \tilde{y}_t + \varepsilon^{CP}_t \]

where \(\kappa > 0\) is the slope coefficient (function of the Calvo parameter \(\theta\) — the probability of not adjusting, the elasticity of substitution \(\varepsilon\), and the labor supply elasticity) and \(\varepsilon^{CP}_t\) is a cost-push shock. Unlike the backward-looking Phillips curve, the NKPC is forward-looking: firms set prices based on current marginal cost and expected future marginal costs.

**3. A monetary policy rule (Taylor Rule):**

\[ i_t = r^n + \phi_\pi \pi_t + \phi_y \tilde{y}_t + \varepsilon^{MP}_t \]

with \(\phi_\pi > 1\) (Taylor principle) for a determinate rational expectations equilibrium.

<div class="definition">
<strong>New Keynesian Phillips Curve (NKPC):</strong> A forward-looking inflation equation derived from the Calvo staggered pricing model. Firms adjust prices with probability \((1-\theta)\) per period; firms that cannot adjust set prices to minimize expected loss over the future adjustment-free period. The slope \(\kappa = \frac{(1-\theta)(1-\beta\theta)}{\theta} \cdot \frac{1}{\sigma + \eta^{-1}}\) is decreasing in \(\theta\) (more frequent price adjustment makes inflation more responsive to the gap) and increasing in \(\beta\) (more patient firms weight future inflation more).
</div>

## 5.2 Deriving the NKPC from Calvo Pricing

With Calvo pricing, a measure \((1-\theta)\) of firms adjusts each period. An adjusting firm sets its price \(p^*_t\) to minimize the expected present value of future price deviations from the frictionless optimum, subject to the constraint that it may not adjust next period with probability \(\theta\):

\[ p^*_t = (1-\beta\theta) \sum_{k=0}^{\infty} (\beta\theta)^k E_t \left[ p^*_{t+k} + \mu + mc_{t+k} \right] \]

where \(mc_t\) is real marginal cost (proportional to the output gap in the linearized model) and \(\mu\) is the desired markup. Aggregating across firms and log-linearizing:

\[ \pi_t = \beta E_t \pi_{t+1} + \lambda mc_t \]

where \(\lambda = \frac{(1-\theta)(1-\beta\theta)}{\theta}\). Since marginal cost is proportional to the output gap, this yields the standard NKPC.

## 5.3 Optimal Monetary Policy Under Commitment and Discretion

The central bank minimizes a welfare loss function. Under the standard quadratic approximation to household welfare:

\[ \mathcal{L} = \frac{1}{2} E_0 \sum_{t=0}^{\infty} \beta^t \left[ \pi_t^2 + \frac{\kappa}{\varepsilon} \tilde{y}_t^2 \right] \]

**Policy under commitment:** The central bank commits to a future policy path at time 0 and maintains it even if it would be tempting to deviate later. The optimal commitment policy features **history dependence** — past conditions affect current policy (e.g., if inflation was high in the past, the central bank commits to keeping rates low longer, anchoring expectations).

**Policy under discretion:** The central bank re-optimizes every period, taking private-sector expectations as given. The discretionary equilibrium suffers from the **stabilization bias**: the central bank cannot commit to future actions, so private sector expectations of future slack are higher than under commitment, requiring a tighter current policy stance to achieve the same inflation outcome.

**The Divine Coincidence.** Under the NK model with only demand shocks (no cost-push shocks), there is no trade-off between inflation and output stabilization. Both can be achieved simultaneously by keeping output at potential — this is the "divine coincidence" (Blanchard and Galí 2007). Cost-push shocks \(\varepsilon^{CP}_t\) break the divine coincidence: there is a genuine stabilization trade-off.

## 5.4 Inflation Targeting and Its Alternatives

**Inflation targeting (IT)** commits the central bank to returning inflation to a fixed numerical target (\(\pi^* = 2\%\) in Canada). Benefits: clear communication, anchored expectations, reduced sacrifice ratio. Costs: no automatic stabilization of the price level; a series of above-target inflation shocks permanently raises the price level.

**Price level targeting (PLT):** The central bank targets the path of the price level rather than its growth rate. PLT provides stronger anchoring of long-run inflation expectations (the price level path is credibly defended), reduces the variance of inflation over long horizons, and can be more effective at the ZLB (a commitment to "make up" for deflation by generating future inflation boosts current demand).

**Average inflation targeting (AIT):** The Federal Reserve's 2020 policy framework revision adopted AIT — a flexible form of PLT where periods of below-target inflation are followed by periods of above-target inflation. Canada's 2021 framework renewal moved toward greater flexibility without explicitly adopting AIT, retaining 2% as the midpoint but emphasizing maximum sustainable employment.

**Nominal GDP targeting (NGDP targeting):** Targets the path of nominal GDP (\(P \times Y\)), combining price and output stabilization in a single target. Advocates (Sumner 2012, Woodford 2012) argue NGDP targeting is more robust to supply shocks (which affect the price-output composition of NGDP) and provides a more credible commitment at the ZLB.

<div class="example">
<strong>Example — Canada's Inflation Surge 2021–2023:</strong> Canadian CPI inflation rose from 1% in mid-2020 to a peak of 8.1% in June 2022, driven by pandemic-related supply disruptions, energy price spikes, and excess demand. The Bank of Canada raised rates from 0.25% to 5.0% between March 2022 and July 2023 — the sharpest tightening since the early 1980s. The episode tested the credibility of the 2% target: inflation expectations remained broadly anchored (5-year break-even inflation from bond markets stayed below 3%), suggesting the Bank's credibility was largely maintained, consistent with the benefit of pre-committed inflation targeting.
</div>

## 5.5 Effective Lower Bound and Balance Sheet Policies

When the nominal policy rate reaches its **effective lower bound** (ELB ≈ 0, or slightly negative), the standard NK model predicts that the economy can become trapped in a self-fulfilling **liquidity trap**: deflationary expectations raise the real interest rate even as the nominal rate is at zero, further depressing demand and producing more deflation.

Formally, at the ELB the IS equation becomes:

\[ \tilde{y}_t = E_t \tilde{y}_{t+1} - \frac{1}{\sigma}(0 - E_t \pi_{t+1} - r^n_t) \]

If \(r^n_t < 0\) (negative natural rate, as in a balance-sheet recession), the real rate exceeds \(r^n\) even at \(i=0\), keeping output below potential.

**Forward guidance** shifts \(E_t \pi_{t+1}\) and \(E_t \tilde{y}_{t+1}\) upward by promising low rates for an extended period. **Quantitative easing** reduces the term premium (the wedge between long-term rates and the expected path of short-term rates), lowering the effective long-term real rate and stimulating demand.

Kuttner (2018) surveys evidence on unconventional policies during the Great Recession: large-scale asset purchases reduced long-term Treasury yields by 50–100 basis points, and forward guidance was found to be effective when highly specific ("Odyssean guidance") but less so when merely descriptive ("Delphic guidance").

---

# Chapter 6: The Science of Monetary Policy — The CGG Framework

## 6.1 Clarida, Galí, and Gertler (1999)

Clarida, Galí, and Gertler's (1999) celebrated survey, "The Science of Monetary Policy: A New Keynesian Perspective," synthesized the NK model and its policy implications. Their key contributions:

1. **Forward-looking rules are preferable.** A central bank that responds to expected future inflation (a forward-looking Taylor Rule) performs better than one responding to current inflation, because expected future conditions matter more for current price-setting.

2. **The Taylor Principle is necessary for determinacy.** With \(\phi_\pi > 1\), a rise in inflation causes the central bank to raise the real rate, stabilizing the economy. With \(\phi_\pi < 1\), sunspot equilibria (self-fulfilling inflation spirals) are possible — a potential explanation for the Great Inflation of the 1970s.

3. **Output gap targeting is a complement, not substitute, for inflation targeting.** The optimal policy minimizes a weighted combination of inflation variance and output gap variance.

4. **The case for commitment is strong.** The difference in welfare between commitment and discretion (the "stabilization bias" and "average inflation bias") can be quantitatively significant in calibrated models.

## 6.2 Rules Versus Discretion

The **time consistency problem** (Kydland and Prescott 1977; Barro and Gordon 1983) is central to the rules-versus-discretion debate. A central bank that cannot commit to low inflation has an incentive to generate surprise inflation (to boost output above the natural rate). In a rational expectations equilibrium, private agents anticipate this and set high inflation expectations, yielding an **inflation bias** — equilibrium inflation above the socially optimal level with no gain in output.

Solutions to the time consistency problem:
1. **Reputation.** A central bank that establishes a track record of low inflation faces higher reputational costs from deviating.
2. **Conservative central banker.** Rogoff (1985) showed that appointing a central banker with a stronger preference for price stability than society reduces the inflation bias.
3. **Inflation targeting contracts.** Walsh (1995) proposed an "optimal incentive contract" penalizing the central bank for missing the inflation target.
4. **Structural independence.** Legislative guarantees of central bank independence remove the government's ability to direct inflationary policy, solving the time consistency problem through institutional design.

<div class="remark">
<strong>Remark — The "Imperfect Knowledge" Perspective:</strong> Eusepi and Preston (2018) argue that the standard model's rational expectations assumption is too strong. If agents learn about the economy using econometric models, policy rules that perform well under rational expectations may be destabilizing when agents are learning. This motivates robustly simple policies and clear communication.
</div>

---

# Chapter 7: Monetary Transmission — Special Topics

## 7.1 Macroprudential Policy and Financial Stability

Aikman, Bridges, Kashyap, and Siegert (2019) ask: would macro-prudential regulation have prevented the 2007–09 financial crisis? They find that standard macro-prudential tools (countercyclical capital buffers, loan-to-value limits, leverage caps) applied mechanically to pre-crisis conditions would have partially dampened the boom but likely not prevented the crisis entirely, because:
- Credit growth and leverage ratios were not uniformly elevated before the crisis (shadow banking was less regulated).
- The tools interact with macroeconomic conditions in complex ways.
- Political economy constraints limit timely tightening.

**Macro-prudential policy instruments:**
- **Countercyclical capital buffer (CCyB):** Banks accumulate extra capital during credit booms; they can draw it down during stress periods.
- **Loan-to-value (LTV) caps:** Limit mortgage lending relative to property value; slow housing price bubbles.
- **Debt-service-to-income (DSTI) limits:** Restrict mortgage debt relative to income.
- **Systemic risk surcharges:** D-SIBs (domestically systemically important banks) in Canada hold additional capital, recognizing too-big-to-fail externalities.

## 7.2 What Happened in the Great Recession?

Gertler and Gilchrist (2018) provide a post-mortem of the 2007–09 Great Recession through the lens of the financial accelerator. They document:

1. A run on the wholesale funding markets (repo, commercial paper, money market funds) was the proximate trigger of the financial crisis — not retail bank runs.
2. The collapse of Lehman Brothers in September 2008 caused a near-complete freezing of interbank lending, dramatically tightening the external finance premium.
3. The financial accelerator amplified the initial housing shock: falling collateral values → higher EFP → reduced investment → falling output → further asset price declines.
4. Policy responses (TARP, QE, lending facilities) that directly targeted the EFP were effective; standard interest rate cuts alone would have been insufficient.

---

# Summary: The New Keynesian Model and Policy Equations

**Three-equation NK system:**

\[ \tilde{y}_t = E_t \tilde{y}_{t+1} - \frac{1}{\sigma}(i_t - E_t\pi_{t+1} - r^n_t) \]

\[ \pi_t = \beta E_t\pi_{t+1} + \kappa\tilde{y}_t + u_t \]

\[ i_t = r^n + \phi_\pi \pi_t + \phi_y \tilde{y}_t \]

**Taylor principle:** \(\phi_\pi > 1\) (necessary for determinacy).

**Welfare loss function:**

\[ \mathcal{L} = \frac{1}{2}\sum_{t=0}^{\infty} \beta^t \left(\pi_t^2 + \frac{\kappa}{\varepsilon}\tilde{y}_t^2\right) \]

**Calvo NKPC slope:**

\[ \kappa = \frac{(1-\theta)(1-\beta\theta)}{\theta} \]

**UIP condition:**

\[ i_t = i^*_t + E_t[e_{t+1} - e_t] \]

**Friedman Rule:** \(i^* = 0 \Rightarrow \pi^* = -r\) (deflation at real rate).

**Optimal commitment policy (Woodford 2003):**

\[ \pi_t = -\frac{\kappa}{\varepsilon}(\tilde{y}_t - \tilde{y}_{t-1}) \]

History-dependent: current inflation depends on the change in the output gap (leaning against momentum), not just current slack.
