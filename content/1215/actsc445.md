---
title: "ACTSC 445/845: Quantitative Enterprise Risk Management"
prof: "Fan Yang"
subjects: "ACTSC"
---

# Chapter 1: Introduction to Risk Management

## 1. Risk

### 1.1 What Is Risk?

The Concise Oxford English Dictionary defines risk as "hazard, a chance of bad consequences, loss or exposure to mischance." In the financial and insurance context, risk carries several related meanings: it is any event or action that may adversely affect an organization's ability to achieve its objectives and execute its strategies; it is the quantifiable likelihood of loss or less-than-expected returns; and for an investor, it is the uncertain return on a risky asset, which could be negative (the downside) or positive (the upside).

Risk is an essential feature of all business. There is always some uncertainty surrounding the outcome of any enterprise — "no pain, no gain." Risk is not always bad: insurance companies deliberately pursue risk for profit, and the SOA's slogan is "Risk is Opportunity." Modern organizations aim to operate in a **risk corridor** — not too little risk, which would prevent the business from thriving, but not so much that foreseeable adverse events could destroy it.

No single sentence captures all aspects of risk. For the purposes of this course:

> risk = chance of loss ⟹ randomness

We therefore use probabilistic notions — random variables, random vectors, distributions, stochastic processes — and the tools of statistics.

### 1.2 Financial Risk

In the context of finance and insurance we focus on three central risk categories. **Market risk** is the risk of loss in a financial position due to changes in underlying components such as stock, bond, or commodity prices. **Credit risk** is the risk that a counterparty fails to meet its obligations (default), i.e., the risk of not receiving promised repayments on loans or bonds. **Operational risk** (OpRisk) is the risk of loss resulting from inadequate or failed internal processes, people, and systems, or from external events such as fraud, fat-finger trades, or natural disasters.

These three categories do not form an exhaustive list, and their boundaries are not always clear. Other important types include **liquidity risk** (the risk that an investment cannot be sold quickly enough to prevent a loss, and the related funding liquidity risk concerning ease of raising capital), **underwriting risk** (in insurance, risk inherent in policies sold, related to catastrophes or demographic changes), and **model risk** (the risk of using a misspecified or inappropriate model for measuring risk — this is always present to some degree). The ideal approach to handling financial risk is a holistic one: an integrated view taking all types of risk and their interactions into account.

## 2. Risk Management for a Financial Firm

### 2.1 Risk Capital

A balance sheet is a financial statement showing assets and liabilities. Roughly speaking, assets describe the institution's investments, while liabilities describe how funds were raised and the obligations that ensue. The fundamental identity is:

\[ \text{value of assets} = \text{value of liabilities} = \text{debt} + \text{equity} \]

**Capital** refers to items on the liability side that entail no (or very limited) obligations to outside creditors, and which can therefore serve as a buffer against losses. Three distinct notions of capital are important:

**Equity capital** equals the value of assets minus debt, measuring the firm's value to its shareholders. **Regulatory capital** is the capital required under regulatory rules — for European insurers this means the minimum capital requirement (MCR) and solvency capital requirement (SCR); for Canadian life insurers it means the Life Insurance Capital Adequacy Test (LICAT). **Economic capital** is the internal assessment of the capital required to control the probability of insolvency, typically over one year, aiming at a holistic view of assets and liabilities.

Much of QRM is concerned with the **capital charge**: the study of risk measures, extreme risk analysis, multivariate risk modelling, and credit risk.

### 2.2 Risk Management

Risk management is about ensuring resilience to future events. Banks and insurers actively and willingly take risks because they seek a return — RM therefore belongs to their core competence. Managing risks involves: determining the capital to hold to absorb losses (both for regulatory compliance and for economic capital purposes to survive as a firm); ensuring portfolios are well diversified; and optimizing portfolios via derivatives to hedge exposures or via securitization to repackage and sell risks to investors.

While general principles, guidelines, and quantitative tools can be discussed systematically, soft skills — communication, relationship management, business acumen — are equally important as hard mathematics and IT infrastructure. After all, risk management involves managing people.

### 2.3 A Brief History of Risk Management

Risk management as a discipline was shaped by a series of high-profile disasters. The **disasters of the 1990s** included the 1995 ruin of Barings Bank, the 1998 collapse of Long Term Capital Management (LTCM), and the difficulties of the life insurer Equitable Life. **The turn of the century** brought the dot-com bubble of 1996–2000 and eventually the financial crisis of 2007–2009. **Recent concerns** include the recession and sovereign debt crises triggered by the financial crisis, as well as High Frequency Trading (HFT), where computer algorithms execute trades in fractions of a second with computer centers positioned near exchanges for microsecond advantages. An ongoing concern is **systemic risk**: the risk of collapse of the entire financial system due to the propagation of financial stress through a network of participants.

## 3. Regulation

### 3.1 Overview

The main aim of regulation is to ensure that financial institutions hold enough capital to withstand financial shocks and remain solvent. A company is **solvent** at a given time if its equity is nonnegative; otherwise it is **insolvent**. Insolvency should be distinguished from **default**, which occurs when a firm misses a payment to creditors — an otherwise-solvent company can default due to liquidity problems.

The **Basel Committee on Banking Supervision (BCBS)**, established by the G10 central bank governors in 1974, does not have direct legal force but formulates standards and guidelines — the **Basel Accords** — that national authorities are expected to implement: Basel I, Basel II, Basel 2.5, and Basel III. Insurance regulation has developed in parallel: in Europe, Solvency I and Solvency II, overseen by EIOPA; in the US, regulation is state-governed, coordinated by the National Association of Insurance Commissioners (NAIC). The 2010 **Dodd-Frank Act** followed the 2007–2009 crisis. Switzerland operates the Swiss Solvency Test (SST).

### 3.2 The Regulation Framework

The Basel framework rests on three pillars. **Pillar 1** (Minimal capital charge) sets quantitative requirements for calculating regulatory capital against market risk in the trading book, credit risk in the banking book, and operational risk. **Pillar 2** (Supervisory review process) involves local regulators reviewing banks' capital adequacy assessments, ensuring sufficient capital, and performing stress tests. **Pillar 3** (Market discipline) addresses better public disclosure of risk measures and other RM-relevant information, requiring banks to give better insight into the adequacy of their capitalization.

## 4. Quantitative Risk Management

QRM treats risk management as a quantitative science using the language of probability and statistics. We use these tools to describe financial risks precisely, to put current practice onto a firmer mathematical footing, and to develop techniques that address deficiencies in current practice.

Several challenges define the QRM programme. **Extremes matter**: models must address unexpected, abnormal, or extreme outcomes. As Lord Turner (2009) wrote, price movements during the crisis were often of a size whose probability was calculated by models to be "almost infinitesimally small," suggesting that models systematically underestimated fat-tail events. **Interdependence and concentration of risks**: risk is multivariate in nature; we care about aggregate risk depending on high-dimensional vectors of risk factors, and are especially concerned with dependence between extremes when many risk factors move against us simultaneously. **The problem of scale**: detailed multivariate models for all risk factors are infeasible; dimension reduction is essential. **Interdisciplinarity**: QRM draws on mathematical finance, statistics, financial econometrics, financial economics, and actuarial mathematics simultaneously.

*Remark:* For a broader overview of QRM, the lecture by Dr. Paul Embrechts (a leading researcher in the field) is highly recommended.

---

# Chapter 2: Risk Measures

## 1. Introduction

### 1.1 Risk Measurement

For quantifiable risks we model potential losses with a statistical distribution. Simple parametric families include the Normal, Lognormal, Pareto, and Compound Poisson (recall the distributions from "Loss Models"). More complex loss distributions can arise as functions of simple parametric ones — for example, \((K - S_T)^+ = \max\{K - S_T, 0\&#125;, the payoff of a European put option at maturity \(T\) with strike \(K\), where \(S_T\) is a random variable following some distribution.

We assume we have a **loss random variable** \(L\) defined over a specified time horizon. \(L\) is a random variable (static), not a process — we consider the loss over a fixed time period only.

### 1.2 Risk Measure

Most modern risk measures are characteristics of the underlying loss distribution over some predetermined time horizon. Given a random loss \(L\) measured over a specified time horizon, a **risk measure** is a real-valued function \(\rho(L)\) which quantifies the potential losses arising from the risk. It is an attempt to provide a single number summarizing the risk represented by \(L\). In most cases we assume \(L \geq 0\), though this is not required — the convention focuses on the loss, not the profit side.

Potential applications of risk measures include: determining the amount of capital to hold as a buffer against unexpected future losses (in order to satisfy regulators or managers concerned with solvency); limiting the amount of risk of a business unit (e.g., requiring that the daily 95% VaR of a trader's position not exceed a given bound); and determining the riskiness (and thus fair premium) of an insurance contract.

## 2. Two Commonly Used Risk Measures

### 2.1 Two Examples of Loss Distributions

We introduce two running examples that will be used throughout the chapter.

**Example 2.1** (Normal Loss): A loss which is normally distributed with mean \(\mu = 33\) and standard deviation \(\sigma = 109\).

**Example 2.2** (Put Option Loss): A loss random variable defined as \(L = 1000 \max(1 - S_{10}, 0)\), where \(S_{10}\) is the price at time \(T = 10\) of an underlying equity investment with initial value \(S_0 = 1\). We assume \(S_t \sim \text{Lognormal}\) with parameters \(\mu = 0.8\) and \(\sigma = 0.6957\). This loss is the payoff of a put option. Both loss distributions in Examples 2.1 and 2.2 have the same mean (33.0) and standard deviation (109.0), yet they are quite different in shape — illustrating that a single summary statistic is insufficient to characterize risk.

### 2.2 Value-at-Risk (VaR)

**Definition 2.1.** For a random variable \(L\) with distribution function \(F_L(x) = \Pr(L \leq x)\), the **Value-at-Risk** (VaR) at confidence level \(0 \leq \alpha \leq 1\) is

\[ \text{VaR}_{\alpha}(L) = F_L^{\leftarrow}(\alpha) = \inf\{x \in \mathbb{R} : F_L(x) \geq \alpha\&#125;. \]

In words, \(\text{VaR}_\alpha(L)\) is the \(\alpha\)-quantile of \(F_L\), with \(\alpha\) close to 1 in practice (e.g., 95% or 99%). Intuitively: \(\text{VaR}_\alpha(L)\) is the loss that, with probability at least \(\alpha\), will not be exceeded; equivalently, the risk has a loss larger than \(\text{VaR}_\alpha(L)\) in at most \(100(1-\alpha)\\%\) of cases on average; and it is the smallest loss which is exceeded with probability at most \(1 - \alpha\).

VaR is the most widely used risk measure in practice (required under Basel II and Solvency II). An important limitation: VaR is **not** a "what-if" risk measure — it does not provide information about the severity of losses that occur with probability \(\leq 1 - \alpha\).

There are three distinct cases in calculating VaR based on the shape of \(F_L\). If \(F_L\) is continuous, then \(\Pr[L \leq \text{VaR}_\alpha] = \alpha \Leftrightarrow \text{VaR}_\alpha = F_L^{-1}(\alpha)\). If \(\alpha\) corresponds to a flat part of \(F_L\), then \(\text{VaR}_\alpha(L)\) is the leftmost point of that flat region. If \(\alpha\) falls inside a jump of \(F_L\), then \(\text{VaR}_\alpha(L)\) is the point where the jump occurs. All three cases can appear in a single distribution.

**Example 2.3** (Discrete VaR): Suppose

\[ L = \begin{cases\} 100 & \text{with probability } 0.005 \\ 50 & \text{with probability } 0.045 \\ 10 & \text{with probability } 0.10 \\ 0 & \text{with probability } 0.85 \end{cases\} \]

The CDF gives \(\Pr[L \leq 10] = 0.950\) and \(\Pr[L \leq 50] = 0.995\). Therefore \(\text{VaR}_{0.95} = 10\) and \(\text{VaR}_{0.99} = 50\).

**Example 2.4** (VaR for Normal Risk): For \(L \sim N(\mu, \sigma^2)\),

\[ \text{VaR}_\alpha(L) = \mu + \sigma \Phi^{-1}(\alpha). \]

*Proof.* Since \(\Pr(L \leq x) = \Phi\left(\frac{x - \mu}{\sigma}\right)\), setting this equal to \(\alpha\) and solving for \(x\) gives \(x = \mu + \sigma \Phi^{-1}(\alpha)\).

**Example 2.5** (Normal VaR Calculation): For Example 2.1 with \(\mu = 33\), \(\sigma = 109\):

\[ \text{VaR}_{0.95}(L) = 33 + 109 \cdot \Phi^{-1}(0.95) = 212.29. \]

**Example 2.6** (VaR of Put Option): For Example 2.2 with \(L = 1000 \max\{1 - S_{10}, 0\&#125;\) and \(S_{10} \sim \text{LogN}(0.8, 0.6957^2)\): first, \(\Pr(L = 0) = \Pr(S_{10} > 1) = 0.8749 < 0.95\), so the 95th percentile lies in the continuous part of \(L\). Solving \(\Pr(L \leq Q_\alpha) = \alpha\) yields

\[ \text{VaR}_\alpha(L) = \left(1 - \exp\left(\mu + \sigma \Phi^{-1}(1 - \alpha)\right)\right) \cdot 1000. \]

For \(\alpha = 0.95\), \(\text{VaR}_{0.95}(L) = 291.37\).

### 2.3 Expected Shortfall (ES)

Besides VaR, **expected shortfall** is the most important risk measure in practice.

**Definition 2.2.** For a loss random variable \(L\) with finite expectation, the **expected shortfall** (ES) at confidence level \(\alpha \in (0, 1)\) is defined as

\[ \text{ES}_\alpha(L) = \frac{1}{1 - \alpha} \int_\alpha^1 \text{VaR}_s(L) \, ds. \]

ES is the average of \(\text{VaR}_s(L)\) over all \(s \geq \alpha\), so \(\text{ES}_\alpha \geq \text{VaR}_\alpha(L)\). ES looks further into the tail of \(F_L\). Where VaR is frequency-based (it only asks "how often does loss exceed this threshold?"), ES is **severity-based** — it is the expected loss *given* that the loss falls in the worst \((1-\alpha)\) portion of the distribution. For this reason, ES is sometimes called Conditional Tail Expectation (CTE), Tail Conditional Expectation (TCE), Conditional Value-at-Risk (CVaR), or Tail Value-at-Risk (TVaR).

**Proposition 2.1.** If \(L\) is continuous, then

\[ \text{ES}_\alpha(L) = E[L \mid L > \text{VaR}_\alpha(L)]. \]

Furthermore, for \(L > 0\), VaR and ES satisfy:

\[ \text{ES}_\alpha(L) = \text{VaR}_\alpha(L) + \frac{1}{1-\alpha} E[L - \text{VaR}_\alpha(L)]^+, \]

where \(a \wedge b = \min(a, b)\) and \([x]^+ = \max(x, 0)\).

*Proof.* Using integration by parts on \(E[L \mid L > \text{VaR}_\alpha(L)]\):

\[ \text{ES}_\alpha(L) = \text{VaR}_\alpha(L) + \frac{1}{1-\alpha} \int_{\text{VaR}_\alpha(L)}^\infty \Pr(L > x) \, dx = \text{VaR}_\alpha(L) + \frac{1}{1-\alpha} E[L - \text{VaR}_\alpha(L)]^+. \]

**Example 2.7** (Discrete ES): For the discrete loss

\[ L = \begin{cases\} 0 & \text{with probability } 0.9 \\ 100 & \text{with probability } 0.06 \\ 1000 & \text{with probability } 0.04 \end{cases\} \]

Using the VaR formula:

\[ \text{VaR}_s(L) = \begin{cases\} 0 & s \leq 0.9 \\ 100 & 0.9 < s \leq 0.96 \\ 1000 & 0.96 < s \leq 1 \end{cases\} \]

Then:

\[ \text{ES}_{0.9}(L) = \frac{1}{0.1}\left(100 \times 0.06 + 1000 \times 0.04\right) = 460, \]

\[ \text{ES}_{0.95}(L) = \frac{1}{0.05}\left(100 \times 0.01 + 1000 \times 0.04\right) = 820. \]

**Example 2.8** (ES for Normal Risk): For \(L \sim N(\mu, \sigma^2)\),

\[ \text{ES}_\alpha(L) = \mu + \frac{\phi[\Phi^{-1}(\alpha)]}{1-\alpha} \sigma, \]

where \(\phi\) and \(\Phi\) are the standard normal pdf and cdf. *Proof.* Since \(\text{VaR}_s(L) = \mu + \sigma\Phi^{-1}(s)\), substituting and using the identity \(x\phi(x) = -\phi'(x)\) yields the result. Equivalently, for a standard normal \(\tilde{L} \sim N(0,1)\): \(\text{ES}_\alpha(\tilde{L}) = \frac{1}{1-\alpha}\phi(\Phi^{-1}(\alpha))\), and for a general normal \(\text{ES}_\alpha(L) = \mu + \sigma \text{ES}_\alpha(\tilde{L})\).

For the put option in Example 2.2, for \(\alpha > 0.8749\):

\[ \text{ES}_\alpha(L) = 1000\left(1 - \frac{e^{\mu + \sigma^2/2}}{1-\alpha} \Phi\left(\Phi^{-1}(1-\alpha) - \sigma\right)\right). \]

At \(\alpha = 0.95\), \(\text{ES}_{0.95}(L) = 454.14\). For \(\alpha = 0.80 < 0.8745\) a portion of the integral is over the zero part of the distribution, giving \(\text{ES}_{0.80}(L) = 165.2\).

## 3. Coherence

### 3.1 Axioms of Coherence

Artzner et al. (1999) proposed axioms for a "good" risk measure, defining the class of **coherent risk measures**. Let \(X\) and \(Y\) be any two risks.

**Axiom 3.1 (Monotonicity):** If \(X \leq Y\) a.s., then \(\rho(X) \leq \rho(Y)\). *Interpretation:* Positions leading to higher losses require more risk capital.

**Axiom 3.2 (Translation Invariance):** For any constant \(c \in \mathbb{R}\), \(\rho(X + c) = \rho(X) + c\). *Interpretation:* Shifting a position's loss by a constant alters the capital requirement accordingly.

**Axiom 3.3 (Subadditivity):** \(\rho(X + Y) \leq \rho(X) + \rho(Y)\). *Interpretation:* Reflects diversification — "a merger does not create extra risk." A non-subadditive measure would encourage institutions to legally break into subsidiaries to reduce regulatory capital requirements.

**Axiom 3.4 (Positive Homogeneity):** For any non-random \(\lambda > 0\), \(\rho(\lambda X) = \lambda \rho(X)\). *Interpretation:* Subadditivity implies \(\rho(nX) \leq n\rho(X)\); since there is no diversification among identical risks, equality should hold. Note: for large \(\lambda\), liquidity risk may argue for \(\rho(\lambda X) > \lambda \rho(X)\), motivating the broader class of **convex risk measures**.

A risk measure satisfying all four axioms is **coherent**.

### 3.2 Coherence Check

**Is VaR coherent?** VaR satisfies all axioms *except* subadditivity (unless \(L\) has an elliptical distribution). Therefore, **VaR is not coherent**.

**Example 3.1** (VaR fails subadditivity): Let \(U \sim U(0,1)\) and define

\[ X = \begin{cases\} 1000 & U \leq 0.04 \\ 0 & U > 0.04 \end{cases\}, \quad Y = \begin{cases\} 0 & U \leq 0.96 \\ 1000 & U > 0.96. \end{cases\} \]

Both \(X\) and \(Y\) have CDF: 0.96 on \([0, 1000)\), so \(\text{VaR}_{0.95}(X) = \text{VaR}_{0.95}(Y) = 0\). However, \(X + Y\) equals 1000 with probability 0.08 (when \(U \leq 0.04\) or \(U > 0.96\), so \(\text{VaR}_{0.95}(X+Y) = 1000 > 0 = \text{VaR}_{0.95}(X) + \text{VaR}_{0.95}(Y)\).

**Theorem 3.1:** *ES is a coherent risk measure.* Monotonicity, translation invariance, and positive homogeneity of ES follow from VaR. Subadditivity of ES is more involved but can be shown.

## 4. Estimation

### 4.1 Estimation of VaR

In risk management applications we often use Monte Carlo (MC) simulation to estimate loss distributions, particularly when underlying processes are too complex for analytical treatment. Let \(L_j\) be the \(j\)-th simulated loss for \(j = 1, \ldots, N\), and let \(L_{(j)}\) be the order statistics with \(L_{(1)} \leq L_{(2)} \leq \cdots \leq L_{(N)}\). Estimating VaR reduces to estimating quantiles. Three possible estimators (assuming \(N\alpha\) is an integer):

1. \(L_{(\alpha N)}\)
2. \(L_{(\alpha N + 1)}\)
3. Smoothed empirical estimate: \(L_{(\alpha(N+1))}\), obtained by linear interpolation between \(L_{(k)}\) and \(L_{(k+1)}\), where \(k\) is the integer part of \((N+1)\alpha\).

None is guaranteed to dominate the others. All are asymptotically unbiased. The smoothed estimate is a safe choice; in practice most use \(L_{(\alpha N)}\), though \(L_{(\alpha(N+1))}\) tends to have lower bias for standard loss distributions.

**Example 4.1** (MC Estimation): For \(L \sim N(33, 109^2)\) with \(N = 1000\) simulated losses, the true values are \(\text{VaR}_{0.95} = 212.3\) and \(\text{VaR}_{0.99} = 286.6\). The three estimators at 95% give \(L_{(950)} = 209.2\), \(L_{(951)} = 209.5\), and \(L_{(950.95)} = 209.5\), all within ~1.3% of the true value. At 99%, estimates range from \(L_{(990)} = 287.8\) to \(L_{(991)} = 287.9\), within ~0.5% of truth.

### 4.2 Estimation of ES

Since ES is the mean of the worst \(100(1-\alpha)\\%\) of the loss distribution, the natural estimator — assuming \(N\alpha\) is an integer — is:

\[ \widehat{\text{ES}}_\alpha = \frac{1}{N(1-\alpha)} \sum_{j=N\alpha+1}^{N} L_{(j)}. \]

---

# Chapter 3: Empirical Properties of Financial Data

## 1. Single Financial Return Series

### 1.1 Stylized Facts

**Stylized facts** are a collection of empirical observations and related inferences that apply to many time series of risk-factor changes — for example, log-returns on equities, indices, exchange rates, and commodity prices. We consider the discrete-time risk-factor change (daily log-return)

\[ X_t = \log \frac{S_t}{S_{t-1}}, \]

where \(S_t\) is the price at time \(t\). The following stylized facts hold for daily log-returns and, to a lesser extent, intradaily and weekly returns. For low-frequency annual returns, data is too sparse and non-stationarity is a concern.

For a single time series of financial returns:

1. Return series are **not iid**, although they show little serial correlation.
2. Series of **absolute or squared returns** show profound serial correlation.
3. **Conditional expected returns** are close to zero — our best estimate for tomorrow's return based on today's information is zero.
4. **Volatility appears to vary over time.**
5. **Extreme returns appear in clusters.**
6. Return series are **leptokurtic** (heavy-tailed with excess kurtosis).

### 1.2 Volatility Clustering

Examining daily log-returns of the S&P 500 index from 2000-01-03 to 2015-12-31 (4025 observations), we observe extreme values and **volatility clustering** — the tendency for extreme returns to be followed by further extreme returns. When we compare the autocorrelation function (ACF) of the raw S&P 500 data against simulated iid Normal data and simulated iid Student-*t* data (with \(\nu = 3\) degrees of freedom estimated from the data):

- The ACF of **raw returns** shows very little evidence of serial correlation for all three data sets (consistent with fact 1).
- The ACF of **absolute values** of S&P 500 returns shows strong positive serial dependence (confirming facts 2 and 5), while the simulated datasets do not. This confirms volatility clustering is a real feature of market data, not captured by iid models.

The **autocorrelation function** with lag \(h\) is

\[ \rho(h) = \text{corr}(X_t, X_{t+h}), \quad h \in \mathbb{Z}. \]

### 1.3 Non-Normality and Heavy Tails

The normal distribution is frequently a poor model for daily (and even weekly and monthly) returns. This can be confirmed using formal normality tests — Kolmogorov–Smirnov, Cramér–von Mises, Anderson–Darling (for general \(F\), or Shapiro–Wilk, D'Agostino, Jarque–Bera (specifically for normality) — and graphically via **Q–Q plots**.

The **empirical distribution** of an iid sample \(X_1, \ldots, X_n\) is

\[ \hat{F}_n(x) = \frac{1}{n} \sum_{i=1}^n \mathbf{1}\{X_i \leq x\&#125;. \]

The order statistics \(X_{(1)} \leq X_{(2)} \leq \cdots \leq X_{(n)}\) contain all relevant information. A **P–P plot** plots \((p_i, F(X_{(i)}))\) with \(p_i = (i-1/2)/n\); if \(F \approx \hat{F}_n\) the points lie on a line with slope 1. A **Q–Q plot** plots \((F^\leftarrow(p_i), X_{(i)})\); an S-shape indicates a **leptokurtic** distribution — narrower centre, heavier tails than \(N(\mu, \sigma^2)\), whose kurtosis is \(\kappa = 3\). Daily returns typically exhibit \(\kappa > 3\). The Q–Q plot of S&P 500 returns against standard normal quantiles confirms this: points deviate substantially from the line in the tails.

### 1.4 Longer-Interval Return Series

As we move from daily to weekly, monthly, quarterly, and yearly data, the non-iid and heavy-tail effects become less pronounced. The \(h\)-period log-return is

\[ X_t^{(h)} = \log \frac{S_t}{S_{t-h}} = \sum_{k=0}^{h-1} X_{t-k}, \]

so a Central Limit Theorem effect takes place as \(h\) grows, making returns look more nearly iid and less heavy-tailed. The tradeoff is that larger \(h\) leaves fewer data points available.

## 2. Multivariate Stylized Facts

Commonly observed multivariate stylized facts include: multivariate return series show little evidence of **cross-correlation** except for contemporaneous returns; multivariate series of **absolute returns** show profound cross-correlation; **correlations between series** vary over time; and extreme returns in one series often coincide with extreme returns in several others.

This last point — **tail dependence** — is illustrated by the log-returns of JPMorgan Chase (JPM) and Wells Fargo (WFC) from 1985 to 2015. In volatile or extreme periods (Black Monday on 1987-10-19, the dot-com bubble peaking in March 2000, and the 2007–2008 financial crisis), joint extremes are much more common than in normal times, suggesting that dependence in the tails is stronger than dependence near the centre of the distribution. Standard linear correlation cannot capture this asymmetry — motivating the study of copulas (Chapter 6).

---

# Chapter 4: Extreme Value Theory

## 1. Introduction

Extreme value theory (EVT) is the tool of choice when we need to estimate the probability of rare, extreme events — exactly the events that matter most for risk management. To see why, consider an investor in the S&P 500 index. Using daily returns from 2000–2007 (2009 days), we can count that loss exceeded 2% on 79 out of 2009 days, giving an empirical probability of 79/2009 ≈ 3.9%. But if we want to estimate the probability that tomorrow's loss exceeds 8% — an event that never occurred in this 2000–2007 window — the empirical answer is exactly zero. We know this must be wrong.

EVT provides a solution. In QRM, extreme losses typically have the characteristics of **high severity and low frequency**. EVT is a branch of probability theory concerned with the limiting laws for extreme values in large samples. Two main approaches exist:

- **Block Maxima Model:** Models for the largest observations collected from large samples. Leads to the Generalized Extreme Value (GEV) distribution.
- **Threshold Exceedances Model:** Models for all observations exceeding a high threshold; more efficient use of data, and generally preferred for practical applications. Leads to the Generalized Pareto Distribution (GPD).

## 2. Block Maxima Model

### 2.1 Convergence of Maxima

Recall the CLT for sums: if \(X_1, \ldots, X_n\) are iid with mean \(\mu\) and variance \(\sigma^2\), then the normalized partial sum \((S_n - n\mu) / (\sigma \sqrt{n}) \xrightarrow{d} N(0,1)\). We seek an analogous result for maxima.

For iid \(X_1, \ldots, X_n\) with common cdf \(F\), the **block maximum** is \(M_n = \max\{X_1, \ldots, X_n\&#125;\). Without normalization, \(M_n \xrightarrow{a.s.} x_F\) where \(x_F = \sup\{x : F(x) < 1\&#125;\) is the right endpoint of \(F\), and \(\lim_{n\to\infty} F^n(x)\) is degenerate. To obtain a non-trivial limit, we normalize:

\[ \lim_{n\to\infty} \Pr\left(\frac{M_n - d_n}{c_n} \leq x\right) = \lim_{n\to\infty} F^n(c_n x + d_n) = H(x) \]

for norming constants \(c_n > 0\) and \(d_n\).

**Definition 2.1.** If the limit above holds for some non-degenerate df \(H\), then \(F\) is said to be in the **maximum domain of attraction** (MDA) of \(H\), written \(F \in \text{MDA}(H)\).

### 2.2 Generalized Extreme Value Distribution

**Definition 2.2.** The **generalized extreme value (GEV) distribution** is

\[ H_\xi(x) = \begin{cases\} \exp\left(-(1 + \xi x)^{-1/\xi}\right), & \xi \neq 0 \\ \exp\left(-e^{-x}\right), & \xi = 0 \end{cases\} \]

where \((1 + \xi x) > 0\). The parameterization is continuous in \(\xi\). The **shape parameter** \(\xi\) determines the moments and tail behaviour:

- \(\xi < 0\): **Weibull** class — short-tailed, finite upper endpoint \(x_{H_\xi} < \infty\).
- \(\xi = 0\): **Gumbel** class — tails decay exponentially, \(x_{H_\xi} = \infty\).
- \(\xi > 0\): **Fréchet** class — **heavy-tailed**, \(x_{H_\xi} = \infty\); the most important case for financial practice.

**Theorem 2.1 (Fisher–Tippett–Gnedenko).** *If \(F \in \text{MDA}(H)\) for some non-degenerate df \(H\), then \(H\) must be of GEV type (i.e., a location-scale transform \(H_{\xi,\mu,\sigma}(x) = H_\xi((x-\mu)/\sigma)\) for some \(\mu \in \mathbb{R}\), \(\sigma > 0\).*

This is the analogue of the CLT for maxima: if normalized maxima converge in distribution, the limit must be GEV. Remarkably, all commonly encountered continuous distributions belong to the MDA of some GEV distribution.

**Example 2.1** (Exponential → Gumbel): For \(F \sim \exp(\lambda)\), choose \(c_n = 1/\lambda\) and \(d_n = \log(n)/\lambda\). Then \(F^n(c_n x + d_n) = (1 - e^{-x}/n)^n \to e^{-e^{-x}} = H_0(x)\), so \(F \in \text{MDA}(H_0)\).

**Example 2.2** (Pareto → Fréchet): For \(F(x) = 1 - (\kappa/(\kappa + x))^\theta\), choose \(c_n = \kappa n^{1/\theta}/\theta\) and \(d_n = \kappa(n^{1/\theta}-1)\). Then \(F^n(c_n x + d_n) \to \exp(-(1+x/\theta)^{-\theta}) = H_{1/\theta}(x)\), so \(F \in \text{MDA}(H_{1/\theta})\).

### 2.3 Maximum Domains of Attraction

To characterize which distributions belong to each MDA, we introduce **regular variation**.

**Definition 2.3.** A distribution \(F\) is said to be **regularly varying with index** \(\alpha > 0\), denoted \(F \in RV_{-\alpha}\), if for any \(x > 0\):

\[ \lim_{t \to \infty} \frac{\bar{F}(tx)}{\bar{F}(t)} = x^{-\alpha}, \]

where \(\bar{F} = 1 - F\) is the survival function. If \(F \in RV_{-\alpha}\), then the tail decays like a power function (heavy-tailed). Examples: Pareto, Inverse gamma, Student-\(t\), log-gamma, Cauchy, \(\alpha\)-stable with \(0 < \alpha < 2\), Burr.

**Theorem 2.2 (Fréchet class):**

\[ F \in \text{MDA}(H_\xi) \text{ for } \xi > 0 \iff F \in RV_{-\alpha} \text{ with } \alpha = 1/\xi. \]

Moreover, norming constants can be chosen as \(c_n = F^\leftarrow(1 - 1/n)\) and \(d_n = 0\). Distributions in this class are heavy-tailed (tails decay like power functions), all unbounded (\(x_F = \infty\), and have moments only up to order \(1/\xi\): \(E[|X|^m] < \infty\) if \(m < 1/\xi\) and \(= \infty\) if \(m > 1/\xi\).

**Gumbel class** (\(\xi = 0\): Contains distributions with roughly exponentially decaying tails (light-tailed), though the tails can be quite varied (up to moderately heavy). Distributions may be bounded or unbounded; all moments exist. Examples: Normal, Lognormal, Gamma, standard Weibull, generalized hyperbolic (except Student-\(t\).

**Theorem 2.3 (Weibull class):**

\[ F \in \text{MDA}(H_\xi) \text{ for } \xi < 0 \iff x_F < \infty \text{ and } \bar{F}(x_F - \tfrac{1}{\cdot}) \in RV_{1/\xi}. \]

These distributions are bounded (\(x_F < \infty\), all moments exist. Examples: Uniform, Beta.

### 2.4 The Block Maxima Method

Given \(F \in \text{MDA}(H_\xi)\), the Fisher–Tippett–Gnedenko Theorem implies that for large \(n\):

\[ \Pr(M_n \leq x) \approx H_{\xi, \mu = d_n, \sigma = c_n}(x). \]

The **block maxima method** fits a GEV distribution \(H_{\xi, \mu, \sigma}\) to the maxima of blocks. Procedure: divide the data into \(m\) blocks of size \(n\), extract block maxima \(M_n^1, \ldots, M_n^m\), assume block size \(n\) is large enough that block maxima can be treated as independent, then apply MLE to fit \(\theta = (\xi, \mu, \sigma)\).

**Remarks on the block maxima method:** The method requires many large blocks, demanding large amounts of data. There is a **bias–variance trade-off**: larger blocks improve the GEV approximation (reduce bias), but fewer blocks means less data for MLE (increase variance). There is no universally best block size. MLE regularity conditions for consistency and asymptotic efficiency were established by Smith (1985) for \(\xi > -1/2\). A major defect: the method retains only the maximum per block, discarding all other large observations — it is very wasteful of data.

## 3. Threshold Exceedances

Because the block maxima method retains only one observation per block, it has been largely superseded by **threshold exceedances** methods, which use all data exceeding a high threshold. This makes much more efficient use of the limited data on extreme outcomes.

### 3.1 Generalized Pareto Distribution (GPD)

The main distributional model for threshold exceedances is the **generalized Pareto distribution (GPD)**.

**Definition 3.1.** The cdf of the GPD is, for scale \(\beta > 0\) and shape \(\xi\):

\[ G_{\xi, \beta}(x) = \begin{cases\} 1 - \left(1 + \xi \frac{x}{\beta}\right)^{-1/\xi}, & \xi \neq 0 \\ 1 - e^{-x/\beta}, & \xi = 0 \end{cases\} \]

where \(x \geq 0\) for \(\xi \geq 0\), and \(0 \leq x \leq -\beta/\xi\) for \(\xi < 0\). Special cases: \(\xi > 0\) gives a Pareto distribution; \(\xi = 0\) gives Exponential(\(1/\beta\); \(\xi < 0\) gives a generalized Beta distribution (bounded and short-tailed).

Key properties: the larger \(\xi\), the heavier the tail; for \(\xi > 0\), \(E[X^k] = \infty\) iff \(k \geq 1/\xi\); for \(\xi < 1\), the mean is

\[ E[X] = \frac{\beta}{1 - \xi}. \]

*Proof:* Using the survival function representation and the substitution \(y = 1 + \xi x/\beta\):

\[ E[X] = \int_0^\infty \bar{G}_{\xi,\beta}(x) \, dx = \int_0^\infty \left(1 + \xi \frac{x}{\beta}\right)^{-1/\xi} dx = \frac{\beta}{1-\xi}. \]

Also, \(G_{\xi,\beta} \in \text{MDA}(H_\xi)\) — the GPD and GEV share the same shape parameter \(\xi\). The GPD density is

\[ g_{\xi,\beta}(x) = \frac{1}{\beta}\left(1 + \frac{\xi x}{\beta}\right)^{-1/\xi - 1}, \]

useful for MLE.

### 3.2 Exceedances

**Definition 3.2.** For \(X \sim F\), the **excess distribution** over threshold \(u\) is

\[ F_u(x) = \Pr(X - u \leq x \mid X > u) = \frac{F(x + u) - F(u)}{1 - F(u)}, \quad x \in [0, x_F - u). \]

The **mean excess function** is \(e(u) = E[X - u \mid X > u]\). One can show:

\[ e(u) = \int_0^{x_F - u} \bar{F}_u(x) \, dx = \frac{\int_u^{x_F} \bar{F}(x) \, dx}{\bar{F}(u)}. \]

**Example 3.1** (Exponential is memoryless): For \(F \sim \exp(\lambda)\), by the memoryless property, \(F_u(x) = 1 - e^{-\lambda x} = F(x)\), and \(e(u) = 1/\lambda = E[X]\) — constant in \(u\).

**Example 3.2** (GPD excess is GPD): For \(X \sim G_{\xi,\beta}\), computing \(F_u\) gives:

\[ F_u(x) = G_{\xi, \beta + \xi u}(x). \]

The excess distribution over \(u\) is still GPD with the *same* shape \(\xi\), but scale growing linearly in \(u\). For the mean excess function: \(e(u) = (\beta + \xi u)/(1-\xi)\), linear in \(u\). Linearity of \(e(u)\) is a **characterizing property** of the GPD.

### 3.3 Pickands–Balkema–De Haan Theorem

The fundamental theoretical justification for the POT method:

**Theorem 3.1 (Pickands–Balkema–De Haan).** \(F \in \text{MDA}(H_\xi)\) if and only if there exists \(\beta(u) > 0\) such that

\[ \lim_{u \to x_F} \sup_{0 \leq x < x_F - u} |F_u(x) - G_{\xi, \beta(u)}(x)| = 0. \]

*Interpretation:* Every distribution in the MDA of some GEV has excess losses converging to a GPD as the threshold approaches the distribution's upper endpoint. The shape parameter \(\xi\) is the same for both the limiting GEV (for maxima) and the limiting GPD (for excesses). The GPD is therefore the **canonical distribution for excess losses** over high thresholds.

### 3.4 Peaks Over Threshold (POT) Method

The **POT method** uses all exceedances of a threshold \(u\). Given losses \(X_1, \ldots, X_n \sim F \in \text{MDA}(H_\xi)\): let \(N_u = |\{i : X_i > u\&#125;|\) be the number of exceedances, \(\tilde{X}_1, \ldots, \tilde{X}_{N_u}\) the exceedances, and \(Y_k = \tilde{X}_k - u\) the excesses. By the Pickands–Balkema–De Haan Theorem, \(Y_1, \ldots, Y_{N_u}\) are approximately iid \(G_{\xi,\beta}\), so we apply MLE to estimate \(\xi\) and \(\beta\).

**Lemma 3.1** (Stability of GPD): Assume \(F_u(x) = G_{\xi,\beta}(x)\) exactly. Then for all \(v \geq u\):

\[ F_v(x) = G_{\xi,\beta + \xi(v-u)}(x). \]

The mean excess function over \(v \geq u\) is:

\[ e(v) = \frac{\beta + \xi(v - u)}{1 - \xi} = \frac{\xi}{1-\xi} v + \frac{\beta - \xi u}{1-\xi}, \]

**linear in \(v\)** — forming the basis for a graphical method to choose \(u\).

**Definition 3.3** (Sample Mean Excess Function): For positive data \(X_1, \ldots, X_n\):

\[ e_n(v) = \frac{\sum_{i=1}^n (X_i - v) \mathbf{1}_{\{X_i > v\&#125;}}}{\sum_{i=1}^n \mathbf{1}_{\{X_i > v\&#125;}}}, \quad v < X_{(n)}. \]

The **mean excess plot** plots \((X_{(i)}, e_n(X_{(i)}))\) for \(1 \leq i < n-1\). If the GPD model holds above \(u\), the plot should become approximately linear for \(v \geq u\). An upward trend indicates \(\xi > 0\) (heavy tail); flat indicates \(\xi = 0\) (exponential-like tail); downward indicates \(\xi < 0\) (bounded tail).

**Choosing the threshold:** Select \(u\) as the smallest point where the mean excess plot becomes linear for all \(v \geq u\). Rule of thumb: with a few thousand data points, \(u\) can often be taken around the 0.9-quantile. There is an inherent **bias–variance trade-off**: too small \(u\) means the GPD may not approximate \(F_u\) well (bias); too large \(u\) leaves too few excesses for reliable MLE (variance). Always analyze data for several thresholds.

### 3.5 Tail Modelling and Risk Measures

Assuming \(F_u(x) = G_{\xi,\beta}(x)\) for \(x \in [0, x_F - u)\), the GPD-based tail formula is:

\[ \bar{F}(x) = \bar{F}(u)\left(1 + \xi \frac{x-u}{\beta}\right)^{-1/\xi}, \quad x > u. \]

We also need to estimate \(\xi\), \(\beta\), and \(u\) (the threshold). Inverting for VaR and ES (for \(\alpha \geq F(u)\):

\[ \text{VaR}_\alpha(X) = u + \frac{\beta}{\xi}\left[\left(\frac{1-\alpha}{\bar{F}(u)}\right)^{-\xi} - 1\right], \]

\[ \text{ES}_\alpha(X) = \frac{\text{VaR}_\alpha(X)}{1-\xi} + \frac{\beta - \xi u}{1-\xi}, \quad \xi < 1. \]

*Proof of ES formula:* Since GPD is continuous and \(\text{VaR}_\alpha(X)\) can be treated as a threshold \(v \geq u\), we apply the mean excess formula: \(\text{ES}_\alpha(X) = e(\text{VaR}_\alpha(X)) + \text{VaR}_\alpha(X)\). Substituting the linear form of \(e(v)\) yields the result.

**Application — S&P 500:** Using the POT method on 1955–2007 data, EVT estimates the probability of a daily loss exceeding 8% at about 0.015%, corresponding to once per roughly 6637 days (~26.5 years). Indeed, in the 53-year history shown, such an event occurred twice (Oct 19 and Oct 26, 1987).

**Application — Hurricane losses:** Using 179 US hurricane/tropical storm losses since 1940 (adjusted to 2017 values, in $millions), fitting a GPD with threshold $20,000M using MLE gives \(\hat{\xi} = 0.75\) (SE 0.41) and \(\hat{\beta} = 7005\) (SE 3066). GPD-based estimates:

| \(\alpha\) | Emp. VaR | Emp. ES | GPD VaR | GPD ES |
|-----------|----------|---------|---------|--------|
| 90% | 21,140 | 38,783 | 20,424 | 49,716 |
| 95% | 26,070 | 56,273 | 27,081 | 76,345 |

Note that VaR estimates are close to empirical values, while GPD ES estimates are substantially larger than empirical ES — reflecting the heavy-tail extrapolation the GPD provides for the worst outcomes.

### 3.6 Hill Estimator

For heavy-tailed distributions (\(\xi > 0\), the **Hill estimator** is the most widely applied estimator of \(\xi\). Assume \(F \in \text{MDA}(H_\xi)\) with \(\xi > 0\), so \(F \in RV_{-\alpha}\) with \(\alpha = 1/\xi\). For iid sample \(X_1, \ldots, X_n\) with reverse order statistics \(X_{n,n} \geq X_{n,n-1} \geq \cdots \geq X_{n,1}\):

\[ \hat{\xi} = \frac{1}{k} \sum_{i=0}^{k-1} \log X_{n,n-i} - \log X_{n,n-k} \]

for some small \(k\). **Choosing \(k\):** look for a stable region in the **Hill plot** \(\{(k, \hat{\xi}(k)) : 2 \leq k \leq n\&#125;\), typically setting \(k = \lfloor \beta n \rfloor\) for \(\beta \in [0.01, 0.05]\). Interpreting Hill plots can be difficult; if the data do not have a regularly varying tail, or if there is serial dependence, Hill plots can be misleading.

For the special case \(F(x) = cx^{-\alpha}\) (a pure Pareto tail), using \(X_{n-k,n}\) as the threshold, the semi-parametric **Hill tail estimator** is

\[ \hat{F}(x) = \frac{k}{n} \left(\frac{x}{X_{n-k,n}}\right)^{-\hat{\alpha}_H}, \quad x > X_{n-k,n}, \]

and the corresponding **Hill VaR estimator** is

\[ \widehat{\text{VaR}}_p(X) = \left(\frac{n}{k}\right)^{1/\hat{\alpha}_H} (1-p)^{-1/\hat{\alpha}_H} X_{n-k,n}. \]

For \(\hat{\alpha}_H > 1\), the **Hill ES estimator** is

\[ \widehat{\text{ES}}_p(X) = \frac{\hat{\alpha}_H}{\hat{\alpha}_H - 1} \widehat{\text{VaR}}_p(X). \]

---

# Chapter 5: *[Notes Unavailable]*

*Chapter 5 notes could not be prepared — the source file (ACTSC445 Ch5.pdf) was not found in the course materials directory. Please check Learn for the Chapter 5 PDF.*

---

# Chapter 6: Copulas and Dependence

In this chapter we use the concept of a **copula** to examine the modelling of a random vector of dependent financial risk factors. Every joint distribution function implicitly contains two ingredients: a description of the marginal behaviour of individual risk factors, and a description of their dependence structure. The copula approach isolates the dependence structure. In short:

> \(F \text{ "=" } F_1, \ldots, F_d \text{ (marginals) "+" dependence structure } C\)

Advantages of the copula approach: it is most natural in a static distributional context; it allows us to study dependence independently of the margins; and it allows a **bottom-up** approach to multivariate model building, combining our better-understood marginal models with a variety of dependence models.

## 1. Copulas

### 1.1 Basic Properties

**Definition 1.1 (Copula).** A **copula** \(C\) is a distribution function with \(U(0,1)\) margins. That is, \(C\) is the df of a random vector \((U_1, \ldots, U_d)^T\) with \(U_j \sim \text{Uniform}(0,1)\):

\[ C(u_1, \ldots, u_d) = \Pr(U_1 \leq u_1, \ldots, U_d \leq u_d). \]

A function \(C: [0,1]^d \to [0,1]\) is a copula if and only if: (1) it is **grounded** — \(C(u) = 0\) whenever any \(u_j = 0\); (2) it has **standard uniform margins** — \(C(1,\ldots,1,u_j,1,\ldots,1) = u_j\); and (3) it is **d-increasing** (has non-negative probability measure on all hyper-rectangles).

Two fundamental lemmas connect copulas to arbitrary distributions.

**Lemma 1.1 (Probability Transform).** If \(X\) has continuous df \(F\), then \(F(X) \sim U(0,1)\).

*Proof:* \(\Pr(F(X) \leq u) = \Pr(X \leq F^\leftarrow(u)) = F(F^\leftarrow(u)) = u\).

**Lemma 1.2 (Quantile Transform).** If \(U \sim U(0,1)\), then \(F^\leftarrow(U) \sim F\).

*Proof:* \(\Pr(F^\leftarrow(U) \leq x) = \Pr(U \leq F(x)) = F(x)\).

These two transformations allow us to travel freely between \(\mathbb{R}^d\) and \([0,1]^d\).

**Theorem 1.1 (Sklar's Theorem).** (1) For any df \(F\) with margins \(F_1, \ldots, F_d\), there exists a copula \(C\) such that

\[ F(x_1, \ldots, x_d) = C(F_1(x_1), \ldots, F_d(x_d)). \]

\(C\) is unique on \(\prod_{j=1}^d \text{ran}\, F_j\) and is given by \(C(u) = F(F_1^\leftarrow(u_1), \ldots, F_d^\leftarrow(u_d))\). (2) Conversely, for any copula \(C\) and univariate dfs \(F_1, \ldots, F_d\), the function \(F(x) = C(F_1(x_1), \ldots, F_d(x_d))\) is a df with those margins.

Sklar's Theorem has two key interpretations: (1) Part 1 enables **decomposing** any joint df into its margins and copula, allowing dependence to be studied independently of marginal behaviour via the **probability-transformed** vector \((F_1(X_1), \ldots, F_d(X_d))^T\). (2) Part 2 enables **constructing** flexible multivariate distributions for any application by combining chosen marginal models with a chosen copula.

**Theorem 1.2 (Invariance Principle).** If \(X \sim F\) has continuous margins and copula \(C\), and \(T_j\) is strictly increasing on ran \(X_j\) for all \(j\), then \((T_1(X_1), \ldots, T_d(X_d))\) also has copula \(C\).

The invariance principle shows that copulas are preserved under strictly increasing marginal transformations — copulas capture pure dependence structure, invariant to the choice of marginal distributions.

**Theorem 1.3 (Fréchet–Hoeffding Bounds).** Let \(W(u) = \max(\sum_{j=1}^d u_j - d + 1, 0)\) and \(M(u) = \min_{1 \leq j \leq d}\{u_j\&#125;\). For any \(d\)-dimensional copula \(C\):

\[ W(u) \leq C(u) \leq M(u), \quad u \in [0,1]^d. \]

\(W\) is a copula if and only if \(d = 2\); \(M\) is a copula for all \(d \geq 2\). The copula \(M\) corresponds to **perfect positive dependence** (comonotonicity): \((U, U, \ldots, U) \sim M\). The copula \(W\) (for \(d=2\) corresponds to **perfect negative dependence** (counter-comonotonicity): \((U, 1-U) \sim W\).

### 1.2 Examples of Copulas

Copulas fall into three broad categories.

**Fundamental copulas** are important special cases. The **independence copula** is \(\Pi(u) = \prod_{j=1}^d u_j\); \(X_1, \ldots, X_d\) are independent iff their copula is \(\Pi\). The **countermonotonicity copula** is \(W(u_1, u_2) = \max\{u_1 + u_2 - 1, 0\&#125;\), the df of \((U, 1-U)\). The **comonotonicity copula** is \(M(u) = \min_j u_j\), the df of \((U, \ldots, U)\).

**Implicit (elliptical) copulas** are extracted from known multivariate distributions via Sklar's Theorem.

The **Gaussian copula** arises from \(X \sim N_d(0, P)\):

\[ C_P^{Ga}(u) = \Phi_P(\Phi^{-1}(u_1), \ldots, \Phi^{-1}(u_d)), \]

where \(\Phi_P\) is the cdf of \(N_d(0,P)\). Special cases: \(P = I_d \Rightarrow C = \Pi\); \(P = \mathbf{1}\mathbf{1}^T \Rightarrow C = M\); for \(d=2\) with \(\rho = -1 \Rightarrow C = W\).

The **t copula** arises from \(X \sim t_d(\nu, 0, P)\):

\[ C_{\nu,P}^t(u) = t_{\nu,P}(t_\nu^{-1}(u_1), \ldots, t_\nu^{-1}(u_d)), \]

where \(t_{\nu,P}\) is the df of \(t_d(\nu, 0, P)\) and \(t_\nu\) the univariate-t cdf. Unlike the Gaussian copula, the t copula assigns substantially more mass to the joint tails (corners of the unit square), reflecting **tail dependence** that increases as \(\nu\) decreases. As \(\nu \to \infty\), \(C_{\nu,P}^t \to C_P^{Ga}\). Both elliptical copulas are **radially symmetric** — they assign equal probability mass to lower and upper tails.

**Explicit (Archimedean) copulas** have the form \(C(u) = \psi(\psi^{-1}(u_1) + \cdots + \psi^{-1}(u_d))\), where the **generator** \(\psi: [0,\infty) \to [0,1]\) is continuous, decreasing, convex, with \psi(0)=1\) and \(\psi(\infty)=0\).

**Clayton copulas**: \(\psi(t) = (1+t)^{-1/\theta}\) for \theta \in (0,\infty)\); as \theta \downarrow 0\), C \to \Pi\); as \theta \uparrow \infty\), C \to M\). The Clayton copula shows strong lower-tail dependence, making it appropriate for modelling joint losses in a credit portfolio.

**Gumbel copulas**: \(\psi(t) = \exp(-t^{-1/\theta})\) for \theta \in [1,\infty)\); \theta = 1 \Rightarrow C = \Pi\); \theta \uparrow \infty \Rightarrow C \to M\). The Gumbel copula shows strong upper-tail dependence.

Advantages of Archimedean copulas: typically explicit (closed form when \(\psi^{-1}\) is available), properties expressible in terms of \psi\), not restricted to radial symmetry. Drawbacks: all margins of the same dimension are equal (exchangeability), fewer parameters than elliptical copulas (limited pairwise flexibility).

### 1.3 Meta Distributions

The **Fréchet class** is the class of all dfs \(F\) with given marginal dfs \(F_1, \ldots, F_d\). A **meta-C model** refers to all dfs \(F\) with the same copula \(C\). For example, a **meta-t model** is a multivariate df with a t copula and some specified margins \(F_1, \ldots, F_d\). Meta distributions allow us to build flexible multivariate models by choosing margins and copulas independently.

### 1.4 Simulation of Copulas and Meta Distributions

**Sampling implicit copulas**: via the probability transform (Lemma 1.1). (1) Sample \(X \sim F\) where \(F\) has continuous margins \(F_1, \ldots, F_d\). (2) Return \(U = (F_1(X_1), \ldots, F_d(X_d))\).

**Example 1.1** (Gaussian copula): (1) Sample \(X \sim N_d(0,P)\) (e.g., \(X = AZ\) for \(AA^T = \Sigma\), \(Z \sim N_d(0,I)\). (2) Return \(U = (\Phi(X_1), \ldots, \Phi(X_d))\). For t copulas: sample \(X \sim t_d(\nu,0,P)\) (i.e., \(X = \sqrt{W} AZ\) for \(W = 1/V\), \(V \sim \Gamma(\nu/2, \nu/2)\), then return \(U = (t_\nu(X_1), \ldots, t_\nu(X_d))\).

**Sampling meta distributions**: via the quantile transform (Lemma 1.2). (1) Sample \(U \sim C\). (2) Return \(X = (F_1^\leftarrow(U_1), \ldots, F_d^\leftarrow(U_d))\).

An important observation: samples from four different copulas (Gauss, Gumbel, Clayton, t<sub>4</sub>) that all have linear correlation \(\approx 0.7\), when transformed to \(N(0,1)\) margins, all produce the same linear correlation — yet their scatter plots look very different, especially in the tails. Linear correlation alone is insufficient to describe dependence structure.

### 1.5 Further Properties of Copulas

**Survival copulas**: If \(U \sim C\), then \(1 - U \sim \hat{C}\), the **survival copula**. For \(d=2\):

\[ \hat{C}(u_1, u_2) = u_1 + u_2 - 1 + C(1-u_1, 1-u_2). \]

If \(\hat{C} = C\), then \(C\) is called **radially symmetric**. The fundamental copulas \(W\), \(\Pi\), and \(M\) are all radially symmetric, as are all elliptical copulas. A random vector \(X\) with continuous symmetric marginals is radially symmetric about a constant vector if and only if its copula satisfies \(\hat{C} = C\). Note that Clayton copulas are *not* radially symmetric — they have heavier lower-tail dependence than upper-tail dependence, in contrast to Gumbel copulas which have heavier upper-tail dependence.

**Exchangeability**: A copula \(C\) is **exchangeable** if it is symmetric in its arguments: \(C(u_1, \ldots, u_d) = C(u_{\pi(1)}, \ldots, u_{\pi(d)})\) for all permutations \(\pi\). Archimedean copulas are always exchangeable. Elliptical copulas are exchangeable when the correlation matrix is equicorrelated (\(P = \rho J_d + (1-\rho) I_d\). Exchangeable copulas are useful for approximate modelling of homogeneous portfolios.

**Copula densities and two-stage estimation**: By Sklar's Theorem, if \(F_j\) has density \(f_j\) and \(C\) has density \(c\), then the joint density satisfies:

\[ f(x) = c(F_1(x_1), \ldots, F_d(x_d)) \prod_{j=1}^d f_j(x_j). \]

Taking logs:

\[ \log f(x) = \log c(F_1(x_1), \ldots, F_d(x_d)) + \sum_{j=1}^d \log f_j(x_j). \]

This additive decomposition enables **two-stage estimation**: marginal and copula parameters can be estimated separately. One first estimates the marginal distributions (e.g., by fitting parametric families or using empirical distributions), then estimates the copula parameters given the estimated marginals. This approach is computationally much more tractable than joint estimation of all parameters simultaneously, and is the standard method in practice.
