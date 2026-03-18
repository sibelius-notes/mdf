---
title: "ACTSC 445/845 - Quantitative Enterprise Risk Management"
prof: "Fan Yang"
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

<span>&#92;[ &#92;text{value of assets} = &#92;text{value of liabilities} = &#92;text{debt} + &#92;text{equity} &#92;]</span>

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

*Remark:* More details on Sections 2.3 and 3.1 can be found in the "Chapter 1 Supplement" on Learn. For a broader overview of QRM, the lecture by Dr. Paul Embrechts (a leading researcher in the field) is highly recommended.

---

# Chapter 2: Risk Measures

## 1. Introduction

### 1.1 Risk Measurement

For quantifiable risks we model potential losses with a statistical distribution. Simple parametric families include the Normal, Lognormal, Pareto, and Compound Poisson (recall the distributions from "Loss Models"). More complex loss distributions can arise as functions of simple parametric ones — for example, <span>&#92;((K - S_T)^+ = &#92;max&#92;{K - S_T, 0&#92;&#125;</span>, the payoff of a European put option at maturity <span>&#92;(T&#92;)</span> with strike <span>&#92;(K&#92;)</span>, where <span>&#92;(S&#95;T&#92;)</span> is a random variable following some distribution.

We assume we have a **loss random variable** <span>&#92;(L&#92;)</span> defined over a specified time horizon. <span>&#92;(L&#92;)</span> is a random variable (static), not a process — we consider the loss over a fixed time period only.

### 1.2 Risk Measure

Most modern risk measures are characteristics of the underlying loss distribution over some predetermined time horizon. Given a random loss <span>&#92;(L&#92;)</span> measured over a specified time horizon, a **risk measure** is a real-valued function <span>&#92;(&#92;rho(L)&#92;)</span> which quantifies the potential losses arising from the risk. It is an attempt to provide a single number summarizing the risk represented by <span>&#92;(L&#92;)</span>. In most cases we assume <span>&#92;(L &#92;geq 0&#92;)</span>, though this is not required — the convention focuses on the loss, not the profit side.

Potential applications of risk measures include: determining the amount of capital to hold as a buffer against unexpected future losses (in order to satisfy regulators or managers concerned with solvency); limiting the amount of risk of a business unit (e.g., requiring that the daily 95% VaR of a trader's position not exceed a given bound); and determining the riskiness (and thus fair premium) of an insurance contract.

## 2. Two Commonly Used Risk Measures

### 2.1 Two Examples of Loss Distributions

We introduce two running examples that will be used throughout the chapter.

**Example 2.1** (Normal Loss): A loss which is normally distributed with mean <span>&#92;(&#92;mu = 33&#92;)</span> and standard deviation <span>&#92;(&#92;sigma = 109&#92;)</span>.

**Example 2.2** (Put Option Loss): A loss random variable defined as <span>&#92;(L = 1000 &#92;max(1 - S&#95;{10}, 0)&#92;)</span>, where <span>&#92;(S&#95;{10}&#92;)</span> is the price at time <span>&#92;(T = 10&#92;)</span> of an underlying equity investment with initial value <span>&#92;(S&#95;0 = 1&#92;)</span>. We assume <span>&#92;(S&#95;t &#92;sim &#92;text{Lognormal}&#92;)</span> with parameters <span>&#92;(\mu = 0.8&#92;)</span> and <span>&#92;(&#92;sigma = 0.6957&#92;)</span>. This loss is the payoff of a put option. Both loss distributions in Examples 2.1 and 2.2 have the same mean (33.0) and standard deviation (109.0), yet they are quite different in shape — illustrating that a single summary statistic is insufficient to characterize risk.

### 2.2 Value-at-Risk (VaR)

**Definition 2.1.** For a random variable <span>&#92;(L&#92;)</span> with distribution function <span>&#92;(F&#95;L(x) = &#92;Pr(L &#92;leq x)&#92;)</span>, the **Value-at-Risk** (VaR) at confidence level <span>&#92;(0 &#92;leq &#92;alpha &#92;leq 1&#92;)</span> is

<span>&#92;[ &#92;text{VaR}&#95;{&#92;alpha}(L) = F&#95;L^{&#92;leftarrow}(&#92;alpha) = &#92;inf&#92;{x &#92;in &#92;mathbb{R} : F&#95;L(x) &#92;geq &#92;alpha&#92;&#125;. &#92;]</span>

In words, <span>&#92;(&#92;text{VaR}&#95;&#92;alpha(L)&#92;)</span> is the <span>&#92;(&#92;alpha&#92;)</span>-quantile of <span>&#92;(F&#95;L&#92;)</span>, with <span>&#92;(&#92;alpha&#92;)</span> close to 1 in practice (e.g., 95% or 99%). Intuitively: <span>&#92;(&#92;text{VaR}&#95;&#92;alpha(L)&#92;)</span> is the loss that, with probability at least <span>&#92;(&#92;alpha&#92;)</span>, will not be exceeded; equivalently, the risk has a loss larger than <span>&#92;(&#92;text{VaR}&#95;&#92;alpha(L)&#92;)</span> in at most <span>&#92;(100(1-&#92;alpha)&#92;\%&#92;)</span> of cases on average; and it is the smallest loss which is exceeded with probability at most <span>&#92;(1 - &#92;alpha&#92;)</span>.

VaR is the most widely used risk measure in practice (required under Basel II and Solvency II). An important limitation: VaR is **not** a "what-if" risk measure — it does not provide information about the severity of losses that occur with probability <span>&#92;(\leq 1 - &#92;alpha&#92;)</span>.

There are three distinct cases in calculating VaR based on the shape of <span>&#92;(F&#95;L&#92;)</span>. If <span>&#92;(F&#95;L&#92;)</span> is continuous, then <span>&#92;(&#92;Pr[L &#92;leq &#92;text{VaR}&#95;&#92;alpha] = &#92;alpha &#92;Leftrightarrow &#92;text{VaR}&#95;&#92;alpha = F&#95;L^{-1}(&#92;alpha)&#92;)</span>. If <span>&#92;(&#92;alpha&#92;)</span> corresponds to a flat part of <span>&#92;(F&#95;L&#92;)</span>, then <span>&#92;(&#92;text{VaR}&#95;&#92;alpha(L)&#92;)</span> is the leftmost point of that flat region. If <span>&#92;(&#92;alpha&#92;)</span> falls inside a jump of <span>&#92;(F&#95;L&#92;)</span>, then <span>&#92;(&#92;text{VaR}&#95;&#92;alpha(L)&#92;)</span> is the point where the jump occurs. All three cases can appear in a single distribution.

**Example 2.3** (Discrete VaR): Suppose

<span>&#92;[ L = &#92;begin{cases&#92;} 100 & &#92;text{with probability } 0.005 &#92;&#92; 50 & &#92;text{with probability } 0.045 &#92;&#92; 10 & &#92;text{with probability } 0.10 &#92;&#92; 0 & &#92;text{with probability } 0.85 &#92;end{cases&#92;} &#92;]</span>

The CDF gives <span>&#92;(&#92;Pr[L &#92;leq 10] = 0.950&#92;)</span> and <span>&#92;(&#92;Pr[L &#92;leq 50] = 0.995&#92;)</span>. Therefore <span>&#92;(&#92;text{VaR}&#95;{0.95} = 10&#92;)</span> and <span>&#92;(&#92;text{VaR}&#95;{0.99} = 50&#92;)</span>.

**Example 2.4** (VaR for Normal Risk): For <span>&#92;(L &#92;sim N(&#92;mu, &#92;sigma^2)&#92;)</span>,

<span>&#92;[ &#92;text{VaR}&#95;&#92;alpha(L) = &#92;mu + &#92;sigma &#92;Phi^{-1}(&#92;alpha). &#92;]</span>

*Proof.* Since <span>&#92;(&#92;Pr(L &#92;leq x) = &#92;Phi&#92;left(&#92;frac{x - &#92;mu}{&#92;sigma}&#92;right)&#92;)</span>, setting this equal to <span>&#92;(&#92;alpha&#92;)</span> and solving for <span>&#92;(x&#92;)</span> gives <span>&#92;(x = &#92;mu + &#92;sigma &#92;Phi^{-1}(&#92;alpha)&#92;)</span>.

**Example 2.5** (Normal VaR Calculation): For Example 2.1 with <span>&#92;(&#92;mu = 33&#92;)</span>, <span>&#92;(&#92;sigma = 109&#92;)</span>:

<span>&#92;[ &#92;text{VaR}&#95;{0.95}(L) = 33 + 109 &#92;cdot &#92;Phi^{-1}(0.95) = 212.29. &#92;]</span>

**Example 2.6** (VaR of Put Option): For Example 2.2 with <span>&#92;(L = 1000 &#92;max&#92;{1 - S&#95;{10}, 0&#92;&#125;&#92;)</span> and <span>&#92;(S&#95;{10} &#92;sim &#92;text{LogN}(0.8, 0.6957^2)&#92;)</span>: first, <span>&#92;(&#92;Pr(L = 0) = &#92;Pr(S_{10} > 1) = 0.8749 < 0.95&#92;)</span>, so the 95th percentile lies in the continuous part of <span>&#92;(L&#92;)</span>. Solving <span>&#92;(&#92;Pr(L &#92;leq Q&#95;&#92;alpha) = &#92;alpha&#92;)</span> yields

<span>&#92;[ &#92;text{VaR}&#95;&#92;alpha(L) = &#92;left(1 - &#92;exp&#92;left(&#92;mu + &#92;sigma &#92;Phi^{-1}(1 - &#92;alpha)&#92;right)&#92;right) &#92;cdot 1000. &#92;]</span>

For <span>&#92;(&#92;alpha = 0.95&#92;)</span>, <span>&#92;(&#92;text{VaR}&#95;{0.95}(L) = 291.37&#92;)</span>.

### 2.3 Expected Shortfall (ES)

Besides VaR, **expected shortfall** is the most important risk measure in practice.

**Definition 2.2.** For a loss random variable <span>&#92;(L&#92;)</span> with finite expectation, the **expected shortfall** (ES) at confidence level <span>&#92;(&#92;alpha &#92;in (0, 1)&#92;)</span> is defined as

<span>&#92;[ &#92;text{ES}&#95;&#92;alpha(L) = &#92;frac{1}{1 - &#92;alpha} &#92;int&#95;&#92;alpha^1 &#92;text{VaR}&#95;s(L) &#92;, ds. &#92;]</span>

ES is the average of <span>&#92;(&#92;text{VaR}&#95;s(L)&#92;)</span> over all <span>&#92;(s &#92;geq &#92;alpha&#92;)</span>, so <span>&#92;(&#92;text{ES}&#95;&#92;alpha &#92;geq &#92;text{VaR}&#95;&#92;alpha(L)&#92;)</span>. ES looks further into the tail of <span>&#92;(F&#95;L&#92;)</span>. Where VaR is frequency-based (it only asks "how often does loss exceed this threshold?"), ES is **severity-based** — it is the expected loss *given* that the loss falls in the worst <span>&#92;((1-&#92;alpha)&#92;)</span> portion of the distribution. For this reason, ES is sometimes called Conditional Tail Expectation (CTE), Tail Conditional Expectation (TCE), Conditional Value-at-Risk (CVaR), or Tail Value-at-Risk (TVaR).

**Proposition 2.1.** If <span>&#92;(L&#92;)</span> is continuous, then

<span>&#92;[ &#92;text{ES}&#95;&#92;alpha(L) = E[L &#92;mid L > &#92;text{VaR}&#95;&#92;alpha(L)]. &#92;]</span>

Furthermore, for <span>&#92;(L > 0&#92;)</span>, VaR and ES satisfy:

<span>&#92;[ &#92;text{ES}&#95;&#92;alpha(L) = &#92;text{VaR}&#95;&#92;alpha(L) + &#92;frac{1}{1-&#92;alpha} E[L - &#92;text{VaR}&#95;&#92;alpha(L)]^+, &#92;]</span>

where <span>&#92;(a &#92;wedge b = &#92;min(a, b)&#92;)</span> and <span>&#92;([x]^+ = &#92;max(x, 0)&#92;)</span>.

*Proof.* Using integration by parts on <span>&#92;(E[L \mid L > &#92;text{VaR}&#95;&#92;alpha(L)]&#92;)</span>:

<span>&#92;[ &#92;text{ES}&#95;&#92;alpha(L) = &#92;text{VaR}&#95;&#92;alpha(L) + &#92;frac{1}{1-&#92;alpha} &#92;int&#95;{&#92;text{VaR}&#95;&#92;alpha(L)}^&#92;infty &#92;Pr(L > x) &#92;, dx = &#92;text{VaR}&#95;&#92;alpha(L) + &#92;frac{1}{1-&#92;alpha} E[L - &#92;text{VaR}&#95;&#92;alpha(L)]^+. &#92;]</span>

**Example 2.7** (Discrete ES): For the discrete loss

<span>&#92;[ L = &#92;begin{cases&#92;} 0 & &#92;text{with probability } 0.9 &#92;&#92; 100 & &#92;text{with probability } 0.06 &#92;&#92; 1000 & &#92;text{with probability } 0.04 &#92;end{cases&#92;} &#92;]</span>

Using the VaR formula:

<span>&#92;[ &#92;text{VaR}_s(L) = &#92;begin{cases&#92;} 0 & s &#92;leq 0.9 &#92;&#92; 100 & 0.9 < s &#92;leq 0.96 &#92;&#92; 1000 & 0.96 < s &#92;leq 1 &#92;end{cases&#92;} &#92;]</span>

Then:

<span>&#92;[ &#92;text{ES}&#95;{0.9}(L) = &#92;frac{1}{0.1}&#92;left(100 &#92;times 0.06 + 1000 &#92;times 0.04&#92;right) = 460, &#92;]</span>

<span>&#92;[ &#92;text{ES}&#95;{0.95}(L) = &#92;frac{1}{0.05}&#92;left(100 &#92;times 0.01 + 1000 &#92;times 0.04&#92;right) = 820. &#92;]</span>

**Example 2.8** (ES for Normal Risk): For <span>&#92;(L &#92;sim N(&#92;mu, &#92;sigma^2)&#92;)</span>,

<span>&#92;[ &#92;text{ES}&#95;&#92;alpha(L) = &#92;mu + &#92;frac{&#92;phi[&#92;Phi^{-1}(&#92;alpha)]}{1-&#92;alpha} &#92;sigma, &#92;]</span>

where <span>&#92;(&#92;phi&#92;)</span> and <span>&#92;(&#92;Phi&#92;)</span> are the standard normal pdf and cdf. *Proof.* Since <span>&#92;(&#92;text{VaR}&#95;s(L) = &#92;mu + &#92;sigma&#92;Phi^{-1}(s)&#92;)</span>, substituting and using the identity <span>&#92;(x&#92;phi(x) = -&#92;phi'(x)&#92;)</span> yields the result. Equivalently, for a standard normal <span>&#92;(&#92;tilde{L} &#92;sim N(0,1)&#92;)</span>: <span>&#92;(&#92;text{ES}&#95;&#92;alpha(&#92;tilde{L}) = &#92;frac{1}{1-&#92;alpha}&#92;phi(&#92;Phi^{-1}(&#92;alpha))&#92;)</span>, and for a general normal <span>&#92;(&#92;text{ES}&#95;&#92;alpha(L) = &#92;mu + &#92;sigma &#92;text{ES}&#95;&#92;alpha(&#92;tilde{L})&#92;)</span>.

For the put option in Example 2.2, for <span>&#92;(&#92;alpha > 0.8749&#92;)</span>:

<span>&#92;[ &#92;text{ES}&#95;&#92;alpha(L) = 1000&#92;left(1 - &#92;frac{e^{&#92;mu + &#92;sigma^2/2}}{1-&#92;alpha} &#92;Phi&#92;left(&#92;Phi^{-1}(1-&#92;alpha) - &#92;sigma&#92;right)&#92;right). &#92;]</span>

At <span>&#92;(&#92;alpha = 0.95&#92;)</span>, <span>&#92;(&#92;text{ES}&#95;{0.95}(L) = 454.14&#92;)</span>. For <span>&#92;(&#92;alpha = 0.80 < 0.8745&#92;)</span> a portion of the integral is over the zero part of the distribution, giving <span>&#92;(&#92;text{ES}&#95;{0.80}(L) = 165.2&#92;)</span>.

## 3. Coherence

### 3.1 Axioms of Coherence

Artzner et al. (1999) proposed axioms for a "good" risk measure, defining the class of **coherent risk measures**. Let <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span> be any two risks.

**Axiom 3.1 (Monotonicity):** If <span>&#92;(X &#92;leq Y&#92;)</span> a.s., then <span>&#92;(&#92;rho(X) &#92;leq &#92;rho(Y)&#92;)</span>. *Interpretation:* Positions leading to higher losses require more risk capital.

**Axiom 3.2 (Translation Invariance):** For any constant <span>&#92;(c &#92;in &#92;mathbb{R}&#92;)</span>, <span>&#92;(&#92;rho(X + c) = &#92;rho(X) + c&#92;)</span>. *Interpretation:* Shifting a position's loss by a constant alters the capital requirement accordingly.

**Axiom 3.3 (Subadditivity):** <span>&#92;(&#92;rho(X + Y) &#92;leq &#92;rho(X) + &#92;rho(Y)&#92;)</span>. *Interpretation:* Reflects diversification — "a merger does not create extra risk." A non-subadditive measure would encourage institutions to legally break into subsidiaries to reduce regulatory capital requirements.

**Axiom 3.4 (Positive Homogeneity):** For any non-random <span>&#92;(&#92;lambda > 0&#92;)</span>, <span>&#92;(&#92;rho(&#92;lambda X) = &#92;lambda &#92;rho(X)&#92;)</span>. *Interpretation:* Subadditivity implies <span>&#92;(&#92;rho(nX) &#92;leq n&#92;rho(X)&#92;)</span>; since there is no diversification among identical risks, equality should hold. Note: for large <span>&#92;(&#92;lambda&#92;)</span>, liquidity risk may argue for <span>&#92;(&#92;rho(&#92;lambda X) > &#92;lambda &#92;rho(X)&#92;)</span>, motivating the broader class of **convex risk measures**.

A risk measure satisfying all four axioms is **coherent**.

### 3.2 Coherence Check

**Is VaR coherent?** VaR satisfies all axioms *except* subadditivity (unless <span>&#92;(L&#92;)</span> has an elliptical distribution). Therefore, **VaR is not coherent**.

**Example 3.1** (VaR fails subadditivity): Let <span>&#92;(U &#92;sim U(0,1)&#92;)</span> and define

<span>&#92;[ X = &#92;begin{cases&#92;} 1000 & U &#92;leq 0.04 &#92;&#92; 0 & U > 0.04 &#92;end{cases&#92;}, &#92;quad Y = &#92;begin{cases&#92;} 0 & U &#92;leq 0.96 &#92;&#92; 1000 & U > 0.96. &#92;end{cases&#92;} &#92;]</span>

Both <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span> have CDF: 0.96 on <span>&#92;([0, 1000)&#92;)</span>, so <span>&#92;(&#92;text{VaR}&#95;{0.95}(X) = &#92;text{VaR}&#95;{0.95}(Y) = 0&#92;)</span>. However, <span>&#92;(X + Y&#92;)</span> equals 1000 with probability 0.08 (when <span>&#92;(U &#92;leq 0.04&#92;)</span> or <span>&#92;(U > 0.96&#92;)</span>), so <span>&#92;(&#92;text{VaR}&#95;{0.95}(X+Y) = 1000 > 0 = &#92;text{VaR}&#95;{0.95}(X) + &#92;text{VaR}&#95;{0.95}(Y)&#92;)</span>.

**Theorem 3.1:** *ES is a coherent risk measure.* Monotonicity, translation invariance, and positive homogeneity of ES follow from VaR. Subadditivity of ES is more involved but can be shown.

## 4. Estimation

### 4.1 Estimation of VaR

In risk management applications we often use Monte Carlo (MC) simulation to estimate loss distributions, particularly when underlying processes are too complex for analytical treatment. Let <span>&#92;(L&#95;j&#92;)</span> be the <span>&#92;(j&#92;)</span>-th simulated loss for <span>&#92;(j = 1, &#92;ldots, N&#92;)</span>, and let <span>&#92;(L&#95;{(j)}&#92;)</span> be the order statistics with <span>&#92;(L&#95;{(1)} &#92;leq L&#95;{(2)} &#92;leq &#92;cdots &#92;leq L&#95;{(N)}&#92;)</span>. Estimating VaR reduces to estimating quantiles. Three possible estimators (assuming <span>&#92;(N&#92;alpha&#92;)</span> is an integer):

1. <span>&#92;(L&#95;{(&#92;alpha N)}&#92;)</span>
2. <span>&#92;(L&#95;{(&#92;alpha N + 1)}&#92;)</span>
3. Smoothed empirical estimate: <span>&#92;(L&#95;{(&#92;alpha(N+1))}&#92;)</span>, obtained by linear interpolation between <span>&#92;(L&#95;{(k)}&#92;)</span> and <span>&#92;(L&#95;{(k+1)}&#92;)</span>, where <span>&#92;(k&#92;)</span> is the integer part of <span>&#92;((N+1)&#92;alpha&#92;)</span>.

None is guaranteed to dominate the others. All are asymptotically unbiased. The smoothed estimate is a safe choice; in practice most use <span>&#92;(L&#95;{(&#92;alpha N)}&#92;)</span>, though <span>&#92;(L&#95;{(&#92;alpha(N+1))}&#92;)</span> tends to have lower bias for standard loss distributions.

**Example 4.1** (MC Estimation): For <span>&#92;(L &#92;sim N(33, 109^2)&#92;)</span> with <span>&#92;(N = 1000&#92;)</span> simulated losses, the true values are <span>&#92;(&#92;text{VaR}&#95;{0.95} = 212.3&#92;)</span> and <span>&#92;(&#92;text{VaR}&#95;{0.99} = 286.6&#92;)</span>. The three estimators at 95% give <span>&#92;(L&#95;{(950)} = 209.2&#92;)</span>, <span>&#92;(L&#95;{(951)} = 209.5&#92;)</span>, and <span>&#92;(L&#95;{(950.95)} = 209.5&#92;)</span>, all within ~1.3% of the true value. At 99%, estimates range from <span>&#92;(L&#95;{(990)} = 287.8&#92;)</span> to <span>&#92;(L&#95;{(991)} = 287.9&#92;)</span>, within ~0.5% of truth.

### 4.2 Estimation of ES

Since ES is the mean of the worst <span>&#92;(100(1-&#92;alpha)&#92;\%&#92;)</span> of the loss distribution, the natural estimator — assuming <span>&#92;(N&#92;alpha&#92;)</span> is an integer — is:

<span>&#92;[ &#92;widehat{&#92;text{ES}}&#95;&#92;alpha = &#92;frac{1}{N(1-&#92;alpha)} &#92;sum&#95;{j=N&#92;alpha+1}^{N} L&#95;{(j)}. &#92;]</span>

---

# Chapter 3: Empirical Properties of Financial Data

## 1. Single Financial Return Series

### 1.1 Stylized Facts

**Stylized facts** are a collection of empirical observations and related inferences that apply to many time series of risk-factor changes — for example, log-returns on equities, indices, exchange rates, and commodity prices. We consider the discrete-time risk-factor change (daily log-return)

<span>&#92;[ X&#95;t = &#92;log &#92;frac{S&#95;t}{S&#95;{t-1}}, &#92;]</span>

where <span>&#92;(S&#95;t&#92;)</span> is the price at time <span>&#92;(t&#92;)</span>. The following stylized facts hold for daily log-returns and, to a lesser extent, intradaily and weekly returns. For low-frequency annual returns, data is too sparse and non-stationarity is a concern.

For a single time series of financial returns:

1. Return series are **not iid**, although they show little serial correlation.
2. Series of **absolute or squared returns** show profound serial correlation.
3. **Conditional expected returns** are close to zero — our best estimate for tomorrow's return based on today's information is zero.
4. **Volatility appears to vary over time.**
5. **Extreme returns appear in clusters.**
6. Return series are **leptokurtic** (heavy-tailed with excess kurtosis).

### 1.2 Volatility Clustering

Examining daily log-returns of the S&P 500 index from 2000-01-03 to 2015-12-31 (4025 observations), we observe extreme values and **volatility clustering** — the tendency for extreme returns to be followed by further extreme returns. When we compare the autocorrelation function (ACF) of the raw S&P 500 data against simulated iid Normal data and simulated iid Student-*t* data (with <span>&#92;(&#92;nu = 3&#92;)</span> degrees of freedom estimated from the data):

- The ACF of **raw returns** shows very little evidence of serial correlation for all three data sets (consistent with fact 1).
- The ACF of **absolute values** of S&P 500 returns shows strong positive serial dependence (confirming facts 2 and 5), while the simulated datasets do not. This confirms volatility clustering is a real feature of market data, not captured by iid models.

The **autocorrelation function** with lag <span>&#92;(h&#92;)</span> is

<span>&#92;[ &#92;rho(h) = &#92;text{corr}(X&#95;t, X&#95;{t+h}), &#92;quad h &#92;in &#92;mathbb{Z}. &#92;]</span>

### 1.3 Non-Normality and Heavy Tails

The normal distribution is frequently a poor model for daily (and even weekly and monthly) returns. This can be confirmed using formal normality tests — Kolmogorov–Smirnov, Cramér–von Mises, Anderson–Darling (for general <span>&#92;(F&#92;)</span>), or Shapiro–Wilk, D'Agostino, Jarque–Bera (specifically for normality) — and graphically via **Q–Q plots**.

The **empirical distribution** of an iid sample <span>&#92;(X&#95;1, &#92;ldots, X&#95;n&#92;)</span> is

<span>&#92;[ &#92;hat{F}&#95;n(x) = &#92;frac{1}{n} &#92;sum&#95;{i=1}^n &#92;mathbf{1}&#92;{X&#95;i &#92;leq x&#92;&#125;. &#92;]</span>

The order statistics <span>&#92;(X&#95;{(1)} &#92;leq X&#95;{(2)} &#92;leq &#92;cdots &#92;leq X&#95;{(n)}&#92;)</span> contain all relevant information. A **P–P plot** plots <span>&#92;((p&#95;i, F(X&#95;{(i)}))&#92;)</span> with <span>&#92;(p&#95;i = (i-1/2)/n&#92;)</span>; if <span>&#92;(F &#92;approx &#92;hat{F}&#95;n&#92;)</span> the points lie on a line with slope 1. A **Q–Q plot** plots <span>&#92;((F^&#92;leftarrow(p&#95;i), X&#95;{(i)})&#92;)</span>; an S-shape indicates a **leptokurtic** distribution — narrower centre, heavier tails than <span>&#92;(N(&#92;mu, &#92;sigma^2)&#92;)</span>, whose kurtosis is <span>&#92;(&#92;kappa = 3&#92;)</span>. Daily returns typically exhibit <span>&#92;(&#92;kappa > 3&#92;)</span>. The Q–Q plot of S&P 500 returns against standard normal quantiles confirms this: points deviate substantially from the line in the tails.

### 1.4 Longer-Interval Return Series

As we move from daily to weekly, monthly, quarterly, and yearly data, the non-iid and heavy-tail effects become less pronounced. The <span>&#92;(h&#92;)</span>-period log-return is

<span>&#92;[ X&#95;t^{(h)} = &#92;log &#92;frac{S&#95;t}{S&#95;{t-h}} = &#92;sum&#95;{k=0}^{h-1} X&#95;{t-k}, &#92;]</span>

so a Central Limit Theorem effect takes place as <span>&#92;(h&#92;)</span> grows, making returns look more nearly iid and less heavy-tailed. The tradeoff is that larger <span>&#92;(h&#92;)</span> leaves fewer data points available.

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

Recall the CLT for sums: if <span>&#92;(X&#95;1, &#92;ldots, X&#95;n&#92;)</span> are iid with mean <span>&#92;(&#92;mu&#92;)</span> and variance <span>&#92;(&#92;sigma^2&#92;)</span>, then the normalized partial sum <span>&#92;((S&#95;n - n&#92;mu) / (&#92;sigma &#92;sqrt{n}) &#92;xrightarrow{d} N(0,1)&#92;)</span>. We seek an analogous result for maxima.

For iid <span>&#92;(X&#95;1, &#92;ldots, X&#95;n&#92;)</span> with common cdf <span>&#92;(F&#92;)</span>, the **block maximum** is <span>&#92;(M&#95;n = &#92;max&#92;{X&#95;1, &#92;ldots, X&#95;n&#92;&#125;&#92;)</span>. Without normalization, <span>&#92;(M&#95;n &#92;xrightarrow{a.s.} x&#95;F&#92;)</span> where <span>&#92;(x_F = &#92;sup&#92;{x : F(x) < 1&#92;&#125;&#92;)</span> is the right endpoint of <span>&#92;(F&#92;)</span>, and <span>&#92;(\lim&#95;{n\to\infty} F^n(x)&#92;)</span> is degenerate. To obtain a non-trivial limit, we normalize:

<span>&#92;[ &#92;lim&#95;{n&#92;to&#92;infty} &#92;Pr&#92;left(&#92;frac{M&#95;n - d&#95;n}{c&#95;n} &#92;leq x&#92;right) = &#92;lim&#95;{n&#92;to&#92;infty} F^n(c&#95;n x + d&#95;n) = H(x) &#92;]</span>

for norming constants <span>&#92;(c&#95;n > 0&#92;)</span> and <span>&#92;(d&#95;n&#92;)</span>.

**Definition 2.1.** If the limit above holds for some non-degenerate df <span>&#92;(H&#92;)</span>, then <span>&#92;(F&#92;)</span> is said to be in the **maximum domain of attraction** (MDA) of <span>&#92;(H&#92;)</span>, written <span>&#92;(F &#92;in &#92;text{MDA}(H)&#92;)</span>.

### 2.2 Generalized Extreme Value Distribution

**Definition 2.2.** The **generalized extreme value (GEV) distribution** is

<span>&#92;[ H&#95;&#92;xi(x) = &#92;begin{cases&#92;} &#92;exp&#92;left(-(1 + &#92;xi x)^{-1/&#92;xi}&#92;right), & &#92;xi &#92;neq 0 &#92;&#92; &#92;exp&#92;left(-e^{-x}&#92;right), & &#92;xi = 0 &#92;end{cases&#92;} &#92;]</span>

where <span>&#92;((1 + &#92;xi x) > 0&#92;)</span>. The parameterization is continuous in <span>&#92;(&#92;xi&#92;)</span>. The **shape parameter** <span>&#92;(&#92;xi&#92;)</span> determines the moments and tail behaviour:

- <span>&#92;(&#92;xi < 0&#92;)</span>: **Weibull** class — short-tailed, finite upper endpoint <span>&#92;(x_{H_&#92;xi} < &#92;infty&#92;)</span>.
- <span>&#92;(&#92;xi = 0&#92;)</span>: **Gumbel** class — tails decay exponentially, <span>&#92;(x&#95;{H&#95;&#92;xi} = &#92;infty&#92;)</span>.
- <span>&#92;(&#92;xi > 0&#92;)</span>: **Fréchet** class — **heavy-tailed**, <span>&#92;(x&#95;{H&#95;&#92;xi} = &#92;infty&#92;)</span>; the most important case for financial practice.

**Theorem 2.1 (Fisher–Tippett–Gnedenko).** *If <span>&#92;(F &#92;in &#92;text{MDA}(H)&#92;)</span> for some non-degenerate df <span>&#92;(H&#92;)</span>, then <span>&#92;(H&#92;)</span> must be of GEV type (i.e., a location-scale transform <span>&#92;(H&#95;{&#92;xi,&#92;mu,&#92;sigma}(x) = H&#95;&#92;xi((x-&#92;mu)/&#92;sigma)&#92;)</span> for some <span>&#92;(&#92;mu &#92;in &#92;mathbb{R}&#92;)</span>, <span>&#92;(&#92;sigma > 0&#92;)</span>).*

This is the analogue of the CLT for maxima: if normalized maxima converge in distribution, the limit must be GEV. Remarkably, all commonly encountered continuous distributions belong to the MDA of some GEV distribution.

**Example 2.1** (Exponential → Gumbel): For <span>&#92;(F &#92;sim &#92;exp(&#92;lambda)&#92;)</span>, choose <span>&#92;(c&#95;n = 1/&#92;lambda&#92;)</span> and <span>&#92;(d&#95;n = &#92;log(n)/&#92;lambda&#92;)</span>. Then <span>&#92;(F^n(c&#95;n x + d&#95;n) = (1 - e^{-x}/n)^n &#92;to e^{-e^{-x}} = H&#95;0(x)&#92;)</span>, so <span>&#92;(F &#92;in &#92;\text{MDA}(H&#95;0)&#92;)</span>.

**Example 2.2** (Pareto → Fréchet): For <span>&#92;(F(x) = 1 - (&#92;kappa/(&#92;kappa + x))^&#92;theta&#92;)</span>, choose <span>&#92;(c&#95;n = &#92;kappa n^{1/&#92;theta}/&#92;theta&#92;)</span> and <span>&#92;(d&#95;n = &#92;kappa(n^{1/&#92;theta}-1)&#92;)</span>. Then <span>&#92;(F^n(c&#95;n x + d&#95;n) &#92;to &#92;exp(-(1+x/&#92;theta)^{-&#92;theta}) = H&#95;{1/&#92;theta}(x)&#92;)</span>, so <span>&#92;(F &#92;in &#92;\text{MDA}(H&#95;{1/&#92;theta})&#92;)</span>.

### 2.3 Maximum Domains of Attraction

To characterize which distributions belong to each MDA, we introduce **regular variation**.

**Definition 2.3.** A distribution <span>&#92;(F&#92;)</span> is said to be **regularly varying with index** <span>&#92;(&#92;alpha > 0&#92;)</span>, denoted <span>&#92;(F &#92;in RV&#95;{-&#92;alpha}&#92;)</span>, if for any <span>&#92;(x > 0&#92;)</span>:

<span>&#92;[ &#92;lim&#95;{t &#92;to &#92;infty} &#92;frac{&#92;bar{F}(tx)}{&#92;bar{F}(t)} = x^{-&#92;alpha}, &#92;]</span>

where <span>&#92;(&#92;bar{F} = 1 - F&#92;)</span> is the survival function. If <span>&#92;(F &#92;in RV&#95;{-&#92;alpha}&#92;)</span>, then the tail decays like a power function (heavy-tailed). Examples: Pareto, Inverse gamma, Student-<span>&#92;(t&#92;)</span>, log-gamma, Cauchy, <span>&#92;(&#92;alpha&#92;)</span>-stable with <span>&#92;(0 < &#92;alpha < 2&#92;)</span>, Burr.

**Theorem 2.2 (Fréchet class):**

<span>&#92;[ F &#92;in &#92;text{MDA}(H&#95;&#92;xi) &#92;text{ for } &#92;xi > 0 &#92;iff F &#92;in RV&#95;{-&#92;alpha} &#92;text{ with } &#92;alpha = 1/&#92;xi. &#92;]</span>

Moreover, norming constants can be chosen as <span>&#92;(c&#95;n = F^&#92;leftarrow(1 - 1/n)&#92;)</span> and <span>&#92;(d&#95;n = 0&#92;)</span>. Distributions in this class are heavy-tailed (tails decay like power functions), all unbounded (<span>&#92;(x&#95;F = &#92;infty&#92;)</span>), and have moments only up to order <span>&#92;(1/&#92;xi&#92;)</span>: <span>&#92;(E[|X|^m] < &#92;infty&#92;)</span> if <span>&#92;(m < 1/&#92;xi&#92;)</span> and <span>&#92;(= &#92;infty&#92;)</span> if <span>&#92;(m > 1/&#92;xi&#92;)</span>.

**Gumbel class** (<span>&#92;(&#92;xi = 0&#92;)</span>): Contains distributions with roughly exponentially decaying tails (light-tailed), though the tails can be quite varied (up to moderately heavy). Distributions may be bounded or unbounded; all moments exist. Examples: Normal, Lognormal, Gamma, standard Weibull, generalized hyperbolic (except Student-<span>&#92;(t&#92;)</span>).

**Theorem 2.3 (Weibull class):**

<span>&#92;[ F &#92;in &#92;text{MDA}(H_&#92;xi) &#92;text{ for } &#92;xi < 0 &#92;iff x_F < &#92;infty &#92;text{ and } &#92;bar{F}(x_F - &#92;tfrac{1}{&#92;cdot}) &#92;in RV_{1/&#92;xi}. &#92;]</span>

These distributions are bounded (<span>&#92;(x_F < &#92;infty&#92;)</span>), all moments exist. Examples: Uniform, Beta.

### 2.4 The Block Maxima Method

Given <span>&#92;(F &#92;in &#92;text{MDA}(H&#95;&#92;xi)&#92;)</span>, the Fisher–Tippett–Gnedenko Theorem implies that for large <span>&#92;(n&#92;)</span>:

<span>&#92;[ &#92;Pr(M&#95;n &#92;leq x) &#92;approx H&#95;{&#92;xi, &#92;mu = d&#95;n, &#92;sigma = c&#95;n}(x). &#92;]</span>

The **block maxima method** fits a GEV distribution <span>&#92;(H&#95;{&#92;xi, &#92;mu, &#92;sigma}&#92;)</span> to the maxima of blocks. Procedure: divide the data into <span>&#92;(m&#92;)</span> blocks of size <span>&#92;(n&#92;)</span>, extract block maxima <span>&#92;(M&#95;n^1, &#92;ldots, M&#95;n^m&#92;)</span>, assume block size <span>&#92;(n&#92;)</span> is large enough that block maxima can be treated as independent, then apply MLE to fit <span>&#92;(&#92;theta = (&#92;xi, &#92;mu, &#92;sigma)&#92;)</span>.

**Remarks on the block maxima method:** The method requires many large blocks, demanding large amounts of data. There is a **bias–variance trade-off**: larger blocks improve the GEV approximation (reduce bias), but fewer blocks means less data for MLE (increase variance). There is no universally best block size. MLE regularity conditions for consistency and asymptotic efficiency were established by Smith (1985) for <span>&#92;(&#92;xi > -1/2&#92;)</span>. A major defect: the method retains only the maximum per block, discarding all other large observations — it is very wasteful of data.

## 3. Threshold Exceedances

Because the block maxima method retains only one observation per block, it has been largely superseded by **threshold exceedances** methods, which use all data exceeding a high threshold. This makes much more efficient use of the limited data on extreme outcomes.

### 3.1 Generalized Pareto Distribution (GPD)

The main distributional model for threshold exceedances is the **generalized Pareto distribution (GPD)**.

**Definition 3.1.** The cdf of the GPD is, for scale <span>&#92;(&#92;beta > 0&#92;)</span> and shape <span>&#92;(&#92;xi&#92;)</span>:

<span>&#92;[ G&#95;{&#92;xi, &#92;beta}(x) = &#92;begin{cases&#92;} 1 - &#92;left(1 + &#92;xi &#92;frac{x}{&#92;beta}&#92;right)^{-1/&#92;xi}, & &#92;xi &#92;neq 0 &#92;&#92; 1 - e^{-x/&#92;beta}, & &#92;xi = 0 &#92;end{cases&#92;} &#92;]</span>

where <span>&#92;(x &#92;geq 0&#92;)</span> for <span>&#92;(&#92;xi &#92;geq 0&#92;)</span>, and <span>&#92;(0 &#92;leq x &#92;leq -&#92;beta/&#92;xi&#92;)</span> for <span>&#92;(&#92;xi < 0&#92;)</span>. Special cases: <span>&#92;(&#92;xi > 0&#92;)</span> gives a Pareto distribution; <span>&#92;(&#92;xi = 0&#92;)</span> gives Exponential(<span>&#92;(1/&#92;beta&#92;)</span>); <span>&#92;(&#92;xi < 0&#92;)</span> gives a generalized Beta distribution (bounded and short-tailed).

Key properties: the larger <span>&#92;(&#92;xi&#92;)</span>, the heavier the tail; for <span>&#92;(&#92;xi > 0&#92;)</span>, <span>&#92;(E[X^k] = &#92;infty&#92;)</span> iff <span>&#92;(k &#92;geq 1/&#92;xi&#92;)</span>; for <span>&#92;(&#92;xi < 1&#92;)</span>, the mean is

<span>&#92;[ E[X] = &#92;frac{&#92;beta}{1 - &#92;xi}. &#92;]</span>

*Proof:* Using the survival function representation and the substitution <span>&#92;(y = 1 + &#92;xi x/&#92;beta&#92;)</span>:

<span>&#92;[ E[X] = &#92;int&#95;0^&#92;infty &#92;bar{G}&#95;{&#92;xi,&#92;beta}(x) &#92;, dx = &#92;int&#95;0^&#92;infty &#92;left(1 + &#92;xi &#92;frac{x}{&#92;beta}&#92;right)^{-1/&#92;xi} dx = &#92;frac{&#92;beta}{1-&#92;xi}. &#92;]</span>

Also, <span>&#92;(G&#95;{&#92;xi,&#92;beta} &#92;in &#92;text{MDA}(H&#95;&#92;xi)&#92;)</span> — the GPD and GEV share the same shape parameter <span>&#92;(&#92;xi&#92;)</span>. The GPD density is

<span>&#92;[ g&#95;{&#92;xi,&#92;beta}(x) = &#92;frac{1}{&#92;beta}&#92;left(1 + &#92;frac{&#92;xi x}{&#92;beta}&#92;right)^{-1/&#92;xi - 1}, &#92;]</span>

useful for MLE.

### 3.2 Exceedances

**Definition 3.2.** For <span>&#92;(X &#92;sim F&#92;)</span>, the **excess distribution** over threshold <span>&#92;(u&#92;)</span> is

<span>&#92;[ F&#95;u(x) = &#92;Pr(X - u &#92;leq x &#92;mid X > u) = &#92;frac{F(x + u) - F(u)}{1 - F(u)}, &#92;quad x &#92;in [0, x&#95;F - u). &#92;]</span>

The **mean excess function** is <span>&#92;(e(u) = E[X - u &#92;mid X > u]&#92;)</span>. One can show:

<span>&#92;[ e(u) = &#92;int&#95;0^{x&#95;F - u} &#92;bar{F}&#95;u(x) &#92;, dx = &#92;frac{&#92;int&#95;u^{x&#95;F} &#92;bar{F}(x) &#92;, dx}{&#92;bar{F}(u)}. &#92;]</span>

**Example 3.1** (Exponential is memoryless): For <span>&#92;(F &#92;sim &#92;exp(&#92;lambda)&#92;)</span>, by the memoryless property, <span>&#92;(F&#95;u(x) = 1 - e^{-&#92;lambda x} = F(x)&#92;)</span>, and <span>&#92;(e(u) = 1/&#92;lambda = E[X]&#92;)</span> — constant in <span>&#92;(u&#92;)</span>.

**Example 3.2** (GPD excess is GPD): For <span>&#92;(X &#92;sim G&#95;{&#92;xi,&#92;beta}&#92;)</span>, computing <span>&#92;(F&#95;u&#92;)</span> gives:

<span>&#92;[ F&#95;u(x) = G&#95;{&#92;xi, &#92;beta + &#92;xi u}(x). &#92;]</span>

The excess distribution over <span>&#92;(u&#92;)</span> is still GPD with the *same* shape <span>&#92;(&#92;xi&#92;)</span>, but scale growing linearly in <span>&#92;(u&#92;)</span>. For the mean excess function: <span>&#92;(e(u) = (&#92;beta + &#92;xi u)/(1-&#92;xi)&#92;)</span>, linear in <span>&#92;(u&#92;)</span>. Linearity of <span>&#92;(e(u)&#92;)</span> is a **characterizing property** of the GPD.

### 3.3 Pickands–Balkema–De Haan Theorem

The fundamental theoretical justification for the POT method:

**Theorem 3.1 (Pickands–Balkema–De Haan).** <span>&#92;(F &#92;in &#92;text{MDA}(H&#95;&#92;xi)&#92;)</span> if and only if there exists <span>&#92;(&#92;beta(u) > 0&#92;)</span> such that

<span>&#92;[ &#92;lim_{u &#92;to x_F} &#92;sup_{0 &#92;leq x < x_F - u} |F_u(x) - G_{&#92;xi, &#92;beta(u)}(x)| = 0. &#92;]</span>

*Interpretation:* Every distribution in the MDA of some GEV has excess losses converging to a GPD as the threshold approaches the distribution's upper endpoint. The shape parameter <span>&#92;(&#92;xi&#92;)</span> is the same for both the limiting GEV (for maxima) and the limiting GPD (for excesses). The GPD is therefore the **canonical distribution for excess losses** over high thresholds.

### 3.4 Peaks Over Threshold (POT) Method

The **POT method** uses all exceedances of a threshold <span>&#92;(u&#92;)</span>. Given losses <span>&#92;(X&#95;1, &#92;ldots, X&#95;n &#92;sim F &#92;in &#92;text{MDA}(H&#95;&#92;xi)&#92;)</span>: let <span>&#92;(N&#95;u = |&#92;{i : X&#95;i > u&#92;&#125;|&#92;)</span> be the number of exceedances, <span>&#92;(\tilde{X}&#95;1, &#92;ldots, &#92;\tilde{X}&#95;{N&#95;u}&#92;)</span> the exceedances, and <span>&#92;(Y&#95;k = &#92;\tilde{X}&#95;k - u&#92;)</span> the excesses. By the Pickands–Balkema–De Haan Theorem, <span>&#92;(Y&#95;1, &#92;ldots, Y&#95;{N&#95;u}&#92;)</span> are approximately iid <span>&#92;(G&#95;{&#92;xi,&#92;beta}&#92;)</span>, so we apply MLE to estimate <span>&#92;(&#92;xi&#92;)</span> and <span>&#92;(&#92;beta&#92;)</span>.

**Lemma 3.1** (Stability of GPD): Assume <span>&#92;(F&#95;u(x) = G&#95;{&#92;xi,&#92;beta}(x)&#92;)</span> exactly. Then for all <span>&#92;(v &#92;geq u&#92;)</span>:

<span>&#92;[ F&#95;v(x) = G&#95;{&#92;xi,&#92;\beta + &#92;xi(v-u)}(x). &#92;]</span>

The mean excess function over <span>&#92;(v &#92;geq u&#92;)</span> is:

<span>&#92;[ e(v) = &#92;frac{&#92;beta + &#92;xi(v - u)}{1 - &#92;xi} = &#92;frac{&#92;xi}{1-&#92;xi} v + &#92;frac{&#92;beta - &#92;xi u}{1-&#92;xi}, &#92;]</span>

**linear in <span>&#92;(v&#92;)</span>** — forming the basis for a graphical method to choose <span>&#92;(u&#92;)</span>.

**Definition 3.3** (Sample Mean Excess Function): For positive data <span>&#92;(X&#95;1, &#92;ldots, X&#95;n&#92;)</span>:

<span>&#92;[ e_n(v) = &#92;frac{&#92;sum_{i=1}^n (X_i - v) &#92;mathbf{1}_{&#92;{X_i > v&#92;&#125;}}}{&#92;sum_{i=1}^n &#92;mathbf{1}_{&#92;{X_i > v&#92;&#125;}}}, &#92;quad v < X_{(n)}. &#92;]</span>

The **mean excess plot** plots <span>&#92;((X&#95;{(i)}, e&#95;n(X&#95;{(i)}))&#92;)</span> for <span>&#92;(1 &#92;leq i < n-1&#92;)</span>. If the GPD model holds above <span>&#92;(u&#92;)</span>, the plot should become approximately linear for <span>&#92;(v &#92;geq u&#92;)</span>. An upward trend indicates <span>&#92;(&#92;xi > 0&#92;)</span> (heavy tail); flat indicates <span>&#92;(&#92;xi = 0&#92;)</span> (exponential-like tail); downward indicates <span>&#92;(&#92;xi < 0&#92;)</span> (bounded tail).

**Choosing the threshold:** Select <span>&#92;(u&#92;)</span> as the smallest point where the mean excess plot becomes linear for all <span>&#92;(v &#92;geq u&#92;)</span>. Rule of thumb: with a few thousand data points, <span>&#92;(u&#92;)</span> can often be taken around the 0.9-quantile. There is an inherent **bias–variance trade-off**: too small <span>&#92;(u&#92;)</span> means the GPD may not approximate <span>&#92;(F&#95;u&#92;)</span> well (bias); too large <span>&#92;(u&#92;)</span> leaves too few excesses for reliable MLE (variance). Always analyze data for several thresholds.

### 3.5 Tail Modelling and Risk Measures

Assuming <span>&#92;(F&#95;u(x) = G&#95;{&#92;xi,&#92;beta}(x)&#92;)</span> for <span>&#92;(x &#92;in [0, x&#95;F - u)&#92;)</span>, the GPD-based tail formula is:

<span>&#92;[ &#92;bar{F}(x) = &#92;bar{F}(u)&#92;left(1 + &#92;xi &#92;frac{x-u}{&#92;beta}&#92;right)^{-1/&#92;xi}, &#92;quad x > u. &#92;]</span>

We also need to estimate <span>&#92;(&#92;xi&#92;)</span>, <span>&#92;(&#92;beta&#92;)</span>, and <span>&#92;(u&#92;)</span> (the threshold). Inverting for VaR and ES (for <span>&#92;(&#92;alpha &#92;geq F(u)&#92;)</span>):

<span>&#92;[ &#92;text{VaR}&#95;&#92;alpha(X) = u + &#92;frac{&#92;beta}{&#92;xi}&#92;left[&#92;left(&#92;frac{1-&#92;alpha}{&#92;bar{F}(u)}&#92;right)^{-&#92;xi} - 1&#92;right], &#92;]</span>

<span>&#92;[ &#92;text{ES}_&#92;alpha(X) = &#92;frac{&#92;text{VaR}_&#92;alpha(X)}{1-&#92;xi} + &#92;frac{&#92;beta - &#92;xi u}{1-&#92;xi}, &#92;quad &#92;xi < 1. &#92;]</span>

*Proof of ES formula:* Since GPD is continuous and <span>&#92;(&#92;text{VaR}&#95;&#92;alpha(X)&#92;)</span> can be treated as a threshold <span>&#92;(v &#92;geq u&#92;)</span>, we apply the mean excess formula: <span>&#92;(&#92;text{ES}&#95;&#92;alpha(X) = e(&#92;text{VaR}&#95;&#92;alpha(X)) + &#92;text{VaR}&#95;&#92;alpha(X)&#92;)</span>. Substituting the linear form of <span>&#92;(e(v)&#92;)</span> yields the result.

**Application — S&P 500:** Using the POT method on 1955–2007 data, EVT estimates the probability of a daily loss exceeding 8% at about 0.015%, corresponding to once per roughly 6637 days (~26.5 years). Indeed, in the 53-year history shown, such an event occurred twice (Oct 19 and Oct 26, 1987).

**Application — Hurricane losses:** Using 179 US hurricane/tropical storm losses since 1940 (adjusted to 2017 values, in $millions), fitting a GPD with threshold $20,000M using MLE gives <span>&#92;(\hat{&#92;xi} = 0.75&#92;)</span> (SE 0.41) and <span>&#92;(\hat{&#92;beta} = 7005&#92;)</span> (SE 3066). GPD-based estimates:

| <span>&#92;(&#92;alpha&#92;)</span> | Emp. VaR | Emp. ES | GPD VaR | GPD ES |
|-----------|----------|---------|---------|--------|
| 90% | 21,140 | 38,783 | 20,424 | 49,716 |
| 95% | 26,070 | 56,273 | 27,081 | 76,345 |

Note that VaR estimates are close to empirical values, while GPD ES estimates are substantially larger than empirical ES — reflecting the heavy-tail extrapolation the GPD provides for the worst outcomes.

### 3.6 Hill Estimator

For heavy-tailed distributions (<span>&#92;(&#92;xi > 0&#92;)</span>), the **Hill estimator** is the most widely applied estimator of <span>&#92;(&#92;xi&#92;)</span>. Assume <span>&#92;(F &#92;in &#92;text{MDA}(H&#95;&#92;xi)&#92;)</span> with <span>&#92;(&#92;xi > 0&#92;)</span>, so <span>&#92;(F &#92;in RV&#95;{-&#92;alpha}&#92;)</span> with <span>&#92;(&#92;alpha = 1/&#92;xi&#92;)</span>. For iid sample <span>&#92;(X&#95;1, &#92;ldots, X&#95;n&#92;)</span> with reverse order statistics <span>&#92;(X&#95;{n,n} &#92;geq X&#95;{n,n-1} &#92;geq &#92;cdots &#92;geq X&#95;{n,1}&#92;)</span>:

<span>&#92;[ &#92;hat{&#92;xi} = &#92;frac{1}{k} &#92;sum&#95;{i=0}^{k-1} &#92;log X&#95;{n,n-i} - &#92;log X&#95;{n,n-k} &#92;]</span>

for some small <span>&#92;(k&#92;)</span>. **Choosing <span>&#92;(k&#92;)</span>:** look for a stable region in the **Hill plot** <span>&#92;(&#92;{(k, &#92;hat{&#92;xi}(k)) : 2 &#92;leq k &#92;leq n&#92;&#125;&#92;)</span>, typically setting <span>&#92;(k = &#92;lfloor &#92;beta n &#92;rfloor&#92;)</span> for <span>&#92;(&#92;beta &#92;in [0.01, 0.05]&#92;)</span>. Interpreting Hill plots can be difficult; if the data do not have a regularly varying tail, or if there is serial dependence, Hill plots can be misleading.

For the special case <span>&#92;(F(x) = cx^{-&#92;alpha}&#92;)</span> (a pure Pareto tail), using <span>&#92;(X&#95;{n-k,n}&#92;)</span> as the threshold, the semi-parametric **Hill tail estimator** is

<span>&#92;[ &#92;hat{F}(x) = &#92;frac{k}{n} &#92;left(&#92;frac{x}{X&#95;{n-k,n}}&#92;right)^{-&#92;hat{&#92;alpha}&#95;H}, &#92;quad x > X&#95;{n-k,n}, &#92;]</span>

and the corresponding **Hill VaR estimator** is

<span>&#92;[ &#92;widehat{&#92;text{VaR}}&#95;p(X) = &#92;left(&#92;frac{n}{k}&#92;right)^{1/&#92;hat{&#92;alpha}&#95;H} (1-p)^{-1/&#92;hat{&#92;alpha}&#95;H} X&#95;{n-k,n}. &#92;]</span>

For <span>&#92;(\hat{&#92;alpha}&#95;H > 1&#92;)</span>, the **Hill ES estimator** is

<span>&#92;[ &#92;\widehat{&#92;text{ES}}&#95;p(X) = &#92;frac{&#92;\hat{&#92;alpha}&#95;H}{&#92;\hat{&#92;alpha}&#95;H - 1} &#92;\widehat{&#92;\text{VaR}}&#95;p(X). &#92;]</span>

---

# Chapter 5: *[Notes Unavailable]*

*Chapter 5 notes could not be prepared — the source file (ACTSC445 Ch5.pdf) was not found in the course materials directory. Please check Learn for the Chapter 5 PDF.*

---

# Chapter 6: Copulas and Dependence

In this chapter we use the concept of a **copula** to examine the modelling of a random vector of dependent financial risk factors. Every joint distribution function implicitly contains two ingredients: a description of the marginal behaviour of individual risk factors, and a description of their dependence structure. The copula approach isolates the dependence structure. In short:

> <span>&#92;(F &#92;text{ "=" } F&#95;1, &#92;ldots, F&#95;d &#92;text{ (marginals) "+" dependence structure } C&#92;)</span>

Advantages of the copula approach: it is most natural in a static distributional context; it allows us to study dependence independently of the margins; and it allows a **bottom-up** approach to multivariate model building, combining our better-understood marginal models with a variety of dependence models.

## 1. Copulas

### 1.1 Basic Properties

**Definition 1.1 (Copula).** A **copula** <span>&#92;(C&#92;)</span> is a distribution function with <span>&#92;(U(0,1)&#92;)</span> margins. That is, <span>&#92;(C&#92;)</span> is the df of a random vector <span>&#92;((U&#95;1, &#92;ldots, U&#95;d)^T&#92;)</span> with <span>&#92;(U&#95;j &#92;sim &#92;text{Uniform}(0,1)&#92;)</span>:

<span>&#92;[ C(u&#95;1, &#92;ldots, u&#95;d) = &#92;Pr(U&#95;1 &#92;leq u&#95;1, &#92;ldots, U&#95;d &#92;leq u&#95;d). &#92;]</span>

A function <span>&#92;(C: [0,1]^d &#92;to [0,1]&#92;)</span> is a copula if and only if: (1) it is **grounded** — <span>&#92;(C(u) = 0&#92;)</span> whenever any <span>&#92;(u&#95;j = 0&#92;)</span>; (2) it has **standard uniform margins** — <span>&#92;(C(1,&#92;ldots,1,u&#95;j,1,&#92;ldots,1) = u&#95;j&#92;)</span>; and (3) it is **d-increasing** (has non-negative probability measure on all hyper-rectangles).

Two fundamental lemmas connect copulas to arbitrary distributions.

**Lemma 1.1 (Probability Transform).** If <span>&#92;(X&#92;)</span> has continuous df <span>&#92;(F&#92;)</span>, then <span>&#92;(F(X) &#92;sim U(0,1)&#92;)</span>.

*Proof:* <span>&#92;(&#92;Pr(F(X) &#92;leq u) = &#92;Pr(X &#92;leq F^&#92;leftarrow(u)) = F(F^&#92;leftarrow(u)) = u&#92;)</span>.

**Lemma 1.2 (Quantile Transform).** If <span>&#92;(U &#92;sim U(0,1)&#92;)</span>, then <span>&#92;(F^&#92;leftarrow(U) &#92;sim F&#92;)</span>.

*Proof:* <span>&#92;(&#92;Pr(F^&#92;leftarrow(U) &#92;leq x) = &#92;Pr(U &#92;leq F(x)) = F(x)&#92;)</span>.

These two transformations allow us to travel freely between <span>&#92;(&#92;mathbb{R}^d&#92;)</span> and <span>&#92;([0,1]^d&#92;)</span>.

**Theorem 1.1 (Sklar's Theorem).** (1) For any df <span>&#92;(F&#92;)</span> with margins <span>&#92;(F&#95;1, &#92;ldots, F&#95;d&#92;)</span>, there exists a copula <span>&#92;(C&#92;)</span> such that

<span>&#92;[ F(x&#95;1, &#92;ldots, x&#95;d) = C(F&#95;1(x&#95;1), &#92;ldots, F&#95;d(x&#95;d)). &#92;]</span>

<span>&#92;(C&#92;)</span> is unique on <span>&#92;(&#92;prod&#95;{j=1}^d &#92;\text{ran}\, F&#95;j&#92;)</span> and is given by <span>&#92;(C(u) = F(F&#95;1^&#92;leftarrow(u&#95;1), &#92;ldots, F&#95;d^&#92;leftarrow(u&#95;d))&#92;)</span>. (2) Conversely, for any copula <span>&#92;(C&#92;)</span> and univariate dfs <span>&#92;(F&#95;1, &#92;ldots, F&#95;d&#92;)</span>, the function <span>&#92;(F(x) = C(F&#95;1(x&#95;1), &#92;ldots, F&#95;d(x&#95;d))&#92;)</span> is a df with those margins.

Sklar's Theorem has two key interpretations: (1) Part 1 enables **decomposing** any joint df into its margins and copula, allowing dependence to be studied independently of marginal behaviour via the **probability-transformed** vector <span>&#92;((F&#95;1(X&#95;1), &#92;ldots, F&#95;d(X&#95;d))^T&#92;)</span>. (2) Part 2 enables **constructing** flexible multivariate distributions for any application by combining chosen marginal models with a chosen copula.

**Theorem 1.2 (Invariance Principle).** If <span>&#92;(X &#92;sim F&#92;)</span> has continuous margins and copula <span>&#92;(C&#92;)</span>, and <span>&#92;(T&#95;j&#92;)</span> is strictly increasing on ran <span>&#92;(X&#95;j&#92;)</span> for all <span>&#92;(j&#92;)</span>, then <span>&#92;((T&#95;1(X&#95;1), &#92;ldots, T&#95;d(X&#95;d))&#92;)</span> also has copula <span>&#92;(C&#92;)</span>.

The invariance principle shows that copulas are preserved under strictly increasing marginal transformations — copulas capture pure dependence structure, invariant to the choice of marginal distributions.

**Theorem 1.3 (Fréchet–Hoeffding Bounds).** Let <span>&#92;(W(u) = &#92;max(&#92;\sum&#95;{j=1}^d u&#95;j - d + 1, 0)&#92;)</span> and <span>&#92;(M(u) = &#92;\min&#95;{1 &#92;\leq j &#92;\leq d}&#92;{u&#95;j&#92;&#125;&#92;)</span>. For any <span>&#92;(d&#92;)</span>-dimensional copula <span>&#92;(C&#92;)</span>:

<span>&#92;[ W(u) &#92;leq C(u) &#92;leq M(u), &#92;quad u &#92;in [0,1]^d. &#92;]</span>

<span>&#92;(W&#92;)</span> is a copula if and only if <span>&#92;(d = 2&#92;)</span>; <span>&#92;(M&#92;)</span> is a copula for all <span>&#92;(d &#92;geq 2&#92;)</span>. The copula <span>&#92;(M&#92;)</span> corresponds to **perfect positive dependence** (comonotonicity): <span>&#92;((U, U, &#92;ldots, U) &#92;sim M&#92;)</span>. The copula <span>&#92;(W&#92;)</span> (for <span>&#92;(d=2&#92;)</span>) corresponds to **perfect negative dependence** (counter-comonotonicity): <span>&#92;((U, 1-U) &#92;sim W&#92;)</span>.

### 1.2 Examples of Copulas

Copulas fall into three broad categories.

**Fundamental copulas** are important special cases. The **independence copula** is <span>&#92;(&#92;Pi(u) = &#92;\prod&#95;{j=1}^d u&#95;j&#92;)</span>; <span>&#92;(X&#95;1, &#92;ldots, X&#95;d&#92;)</span> are independent iff their copula is <span>&#92;(&#92;\Pi&#92;)</span>. The **countermonotonicity copula** is <span>&#92;(W(u&#95;1, u&#95;2) = &#92;\max&#92;{u&#95;1 + u&#95;2 - 1, 0&#92;&#125;&#92;)</span>, the df of <span>&#92;((U, 1-U)&#92;)</span>. The **comonotonicity copula** is <span>&#92;(M(u) = &#92;\min&#95;j u&#95;j&#92;)</span>, the df of <span>&#92;((U, &#92;ldots, U)&#92;)</span>.

**Implicit (elliptical) copulas** are extracted from known multivariate distributions via Sklar's Theorem.

The **Gaussian copula** arises from <span>&#92;(X &#92;sim N&#95;d(0, P)&#92;)</span>:

<span>&#92;[ C&#95;P^{Ga}(u) = &#92;Phi&#95;P(&#92;\Phi^{-1}(u&#95;1), &#92;ldots, &#92;\Phi^{-1}(u&#95;d)), &#92;]</span>

where <span>&#92;(&#92;\Phi&#95;P&#92;)</span> is the cdf of <span>&#92;(N&#95;d(0,P)&#92;)</span>. Special cases: <span>&#92;(P = I&#95;d &#92;\Rightarrow C = &#92;\Pi&#92;)</span>; <span>&#92;(P = \mathbf{1}\mathbf{1}^T &#92;\Rightarrow C = M&#92;)</span>; for <span>&#92;(d=2&#92;)</span> with <span>&#92;(&#92;\rho = -1 &#92;\Rightarrow C = W&#92;)</span>.

The **t copula** arises from <span>&#92;(X &#92;\sim t&#95;d(&#92;\nu, 0, P)&#92;)</span>:

<span>&#92;[ C&#95;{\nu,P}^t(u) = t&#95;{\nu,P}(t&#95;\nu^{-1}(u&#95;1), &#92;\ldots, t&#95;\nu^{-1}(u&#95;d)), &#92;]</span>

where <span>&#92;(t&#95;{\nu,P}&#92;)</span> is the df of <span>&#92;(t&#95;d(&#92;\nu, 0, P)&#92;)</span> and <span>&#92;(t&#95;&#92;\nu&#92;)</span> the univariate-t cdf. Unlike the Gaussian copula, the t copula assigns substantially more mass to the joint tails (corners of the unit square), reflecting **tail dependence** that increases as <span>&#92;(&#92;\nu&#92;)</span> decreases. As <span>&#92;(&#92;\nu &#92;\to &#92;\infty&#92;)</span>, <span>&#92;(C&#95;{\nu,P}^t &#92;\to C&#95;P^{Ga}&#92;)</span>. Both elliptical copulas are **radially symmetric** — they assign equal probability mass to lower and upper tails.

**Explicit (Archimedean) copulas** have the form <span>&#92;(C(u) = &#92;\psi(&#92;\psi^{-1}(u&#95;1) + &#92;\cdots + &#92;\psi^{-1}(u&#95;d))&#92;)</span>, where the **generator** <span>&#92;(\psi: [0,&#92;\infty) &#92;\to [0,1]&#92;)</span> is continuous, decreasing, convex, with <span>&#92;\psi(0)=1&#92;)</span> and <span>&#92;(\psi(&#92;\infty)=0&#92;)</span>.

**Clayton copulas**: <span>&#92;(\psi(t) = (1+t)^{-1/&#92;\theta}&#92;)</span> for <span>&#92;\theta &#92;in (0,&#92;\infty)&#92;)</span>; as <span>&#92;\theta &#92;downarrow 0&#92;), C &#92;\to &#92;\Pi&#92;)</span>; as <span>&#92;\theta &#92;\uparrow &#92;\infty&#92;), C &#92;\to M&#92;)</span>. The Clayton copula shows strong lower-tail dependence, making it appropriate for modelling joint losses in a credit portfolio.

**Gumbel copulas**: <span>&#92;(\psi(t) = &#92;\exp(-t^{-1/&#92;\theta})&#92;)</span> for <span>&#92;\theta &#92;in [1,&#92;\infty)&#92;)</span>; <span>&#92;\theta = 1 &#92;\Rightarrow C = &#92;\Pi&#92;)</span>; <span>&#92;\theta &#92;\uparrow &#92;\infty &#92;\Rightarrow C &#92;\to M&#92;)</span>. The Gumbel copula shows strong upper-tail dependence.

Advantages of Archimedean copulas: typically explicit (closed form when <span>&#92;(\psi^{-1}&#92;)</span> is available), properties expressible in terms of <span>&#92;\psi&#92;)</span>, not restricted to radial symmetry. Drawbacks: all margins of the same dimension are equal (exchangeability), fewer parameters than elliptical copulas (limited pairwise flexibility).

### 1.3 Meta Distributions

The **Fréchet class** is the class of all dfs <span>&#92;(F&#92;)</span> with given marginal dfs <span>&#92;(F&#95;1, &#92;\ldots, F&#95;d&#92;)</span>. A **meta-C model** refers to all dfs <span>&#92;(F&#92;)</span> with the same copula <span>&#92;(C&#92;)</span>. For example, a **meta-t model** is a multivariate df with a t copula and some specified margins <span>&#92;(F&#95;1, &#92;\ldots, F&#95;d&#92;)</span>. Meta distributions allow us to build flexible multivariate models by choosing margins and copulas independently.

### 1.4 Simulation of Copulas and Meta Distributions

**Sampling implicit copulas**: via the probability transform (Lemma 1.1). (1) Sample <span>&#92;(X &#92;\sim F&#92;)</span> where <span>&#92;(F&#92;)</span> has continuous margins <span>&#92;(F&#95;1, &#92;\ldots, F&#95;d&#92;)</span>. (2) Return <span>&#92;(U = (F&#95;1(X&#95;1), &#92;\ldots, F&#95;d(X&#95;d))&#92;)</span>.

**Example 1.1** (Gaussian copula): (1) Sample <span>&#92;(X &#92;\sim N&#95;d(0,P)&#92;)</span> (e.g., <span>&#92;(X = AZ&#92;)</span> for <span>&#92;(AA^T = &#92;\Sigma&#92;)</span>, <span>&#92;(Z &#92;\sim N&#95;d(0,I)&#92;)</span>). (2) Return <span>&#92;(U = (&#92;\Phi(X&#95;1), &#92;\ldots, &#92;\Phi(X&#95;d))&#92;)</span>. For t copulas: sample <span>&#92;(X &#92;\sim t&#95;d(&#92;\nu,0,P)&#92;)</span> (i.e., <span>&#92;(X = &#92;\sqrt{W} AZ&#92;)</span> for <span>&#92;(W = 1/V&#92;)</span>, <span>&#92;(V &#92;\sim &#92;\Gamma(&#92;\nu/2, &#92;\nu/2)&#92;)</span>), then return <span>&#92;(U = (t&#95;&#92;\nu(X&#95;1), &#92;\ldots, t&#95;&#92;\nu(X&#95;d))&#92;)</span>.

**Sampling meta distributions**: via the quantile transform (Lemma 1.2). (1) Sample <span>&#92;(U &#92;\sim C&#92;)</span>. (2) Return <span>&#92;(X = (F&#95;1^&#92;\leftarrow(U&#95;1), &#92;\ldots, F&#95;d^&#92;\leftarrow(U&#95;d))&#92;)</span>.

An important observation: samples from four different copulas (Gauss, Gumbel, Clayton, t<sub>4</sub>) that all have linear correlation <span>&#92;(\approx 0.7&#92;)</span>, when transformed to <span>&#92;(N(0,1)&#92;)</span> margins, all produce the same linear correlation — yet their scatter plots look very different, especially in the tails. Linear correlation alone is insufficient to describe dependence structure.

### 1.5 Further Properties of Copulas

**Survival copulas**: If <span>&#92;(U &#92;\sim C&#92;)</span>, then <span>&#92;(1 - U &#92;\sim &#92;\hat{C}&#92;)</span>, the **survival copula**. For <span>&#92;(d=2&#92;)</span>:

<span>&#92;[ &#92;hat{C}(u&#95;1, u&#95;2) = u&#95;1 + u&#95;2 - 1 + C(1-u&#95;1, 1-u&#95;2). &#92;]</span>

If <span>&#92;(\hat{C} = C&#92;)</span>, then <span>&#92;(C&#92;)</span> is called **radially symmetric**. The fundamental copulas <span>&#92;(W&#92;)</span>, <span>&#92;(\Pi&#92;)</span>, and <span>&#92;(M&#92;)</span> are all radially symmetric, as are all elliptical copulas. A random vector <span>&#92;(X&#92;)</span> with continuous symmetric marginals is radially symmetric about a constant vector if and only if its copula satisfies <span>&#92;(\hat{C} = C&#92;)</span>. Note that Clayton copulas are *not* radially symmetric — they have heavier lower-tail dependence than upper-tail dependence, in contrast to Gumbel copulas which have heavier upper-tail dependence.

**Exchangeability**: A copula <span>&#92;(C&#92;)</span> is **exchangeable** if it is symmetric in its arguments: <span>&#92;(C(u&#95;1, &#92;\ldots, u&#95;d) = C(u&#95;{\pi(1)}, &#92;\ldots, u&#95;{\pi(d)})&#92;)</span> for all permutations <span>&#92;(\pi&#92;)</span>. Archimedean copulas are always exchangeable. Elliptical copulas are exchangeable when the correlation matrix is equicorrelated (<span>&#92;(P = &#92;\rho J&#95;d + (1-&#92;\rho) I&#95;d&#92;)</span>). Exchangeable copulas are useful for approximate modelling of homogeneous portfolios.

**Copula densities and two-stage estimation**: By Sklar's Theorem, if <span>&#92;(F&#95;j&#92;)</span> has density <span>&#92;(f&#95;j&#92;)</span> and <span>&#92;(C&#92;)</span> has density <span>&#92;(c&#92;)</span>, then the joint density satisfies:

<span>&#92;[ f(x) = c(F&#95;1(x&#95;1), &#92;\ldots, F&#95;d(x&#95;d)) &#92;\prod&#95;{j=1}^d f&#95;j(x&#95;j). &#92;]</span>

Taking logs:

<span>&#92;[ &#92;\log f(x) = &#92;\log c(F&#95;1(x&#95;1), &#92;\ldots, F&#95;d(x&#95;d)) + &#92;\sum&#95;{j=1}^d &#92;\log f&#95;j(x&#95;j). &#92;]</span>

This additive decomposition enables **two-stage estimation**: marginal and copula parameters can be estimated separately. One first estimates the marginal distributions (e.g., by fitting parametric families or using empirical distributions), then estimates the copula parameters given the estimated marginals. This approach is computationally much more tractable than joint estimation of all parameters simultaneously, and is the standard method in practice.
