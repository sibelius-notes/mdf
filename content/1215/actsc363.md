---
title: "ACTSC 363 — Loss Models"
prof: "Mirabelle Huynh"
---

# ACTSC 363: Loss Models

**Instructor:** Mirabelle Huynh | Spring 2021 | University of Waterloo

---

## Table of Contents

1. [Introduction](#chapter-1-introduction)
2. [Review of Probability](#chapter-2-review-of-probability)
3. [Frequency Distributions](#chapter-3-frequency-distributions)
4. [Severity Distributions](#chapter-4-severity-distributions)
5. [Aggregate Loss/Payment Distributions](#chapter-5-aggregate-losspayment-distributions)
6. [Loss Reserving](#chapter-6-loss-reserving)

---

## Chapter 1: Introduction

This course presents tools for modelling the loss and assessing the risk of a portfolio of insurance business. The first part constructs mathematical models to predict insurance loss — primarily in a non-life insurance framework — and highlights key characteristics and limitations. We examine the effects of **policy adjustments** (deductibles, limits, coinsurance) and their impact on risk mitigation. The **collective risk model** is used throughout to model the aggregate amount of claims arising from a portfolio over a given time period. Quantitative risk measures (VaR, TVaR, stop-loss moments) and stochastic reserving are outside the scope of this course and are covered in ACTSC 431 and ACTSC 463 respectively.

### 1.1 Why These Topics Are Important to Insurers

Insurers need to protect themselves from losses arising from random events that not only impact their balance sheet but threaten their solvency. Significant losses can result from a few large claims or even too many small claims. Insurers need tools to quantify these risks and seek adequate protection through risk management activities such as reinsurance and asset-liability management.

### 1.2 Types of Random Events

Common insurable random events and the losses they generate:

- **Car accident:** damages to vehicles, personal injury
- **Storm, fire, or other hazards:** partial or complete destruction of property
- **Death:** loss of financial support to family, loss of mortgage payments
- **Illness (stroke, heart attack, cancer):** costs of recovery, hired assistance, home modifications
- **Short- or long-term disability:** loss of income, additional medical expenses

### 1.3 Distinction Between Claim/Loss and Payment

In this course, **claim** and **loss** are used interchangeably. A **payment** is the amount the insurer pays after policy adjustments (deductible, limit, coinsurance) are applied to the claim/loss amount. For example, under a deductible, the insurer pays only the portion of the loss exceeding the deductible.

### 1.4 Collective Risk Model for Aggregate Claim/Payment

The **collective risk model** models the aggregate claim over a given period by combining:

- **Frequency model:** the total number of claims from a portfolio (Chapter 3)
- **Severity model:** the amount of each individual claim (Chapter 4)
- **Aggregate model:** the total claim, combining frequency and severity (Chapter 5)

Policy adjustments are factored in to model aggregate payments rather than raw losses.

---

## Chapter 2: Review of Probability

Random variables (rvs) represent the randomness of insurance loss events. This course encounters three types: discrete, continuous, and mixed.

### 2.1 Discrete Random Variables

A **discrete rv** takes a finite or countable number of values. The **probability mass function (pmf)** of a discrete rv <span>&#92;(X&#92;)</span> taking values <span>&#92;(\{x_i\}_{i \in \mathbb{N}}&#92;)</span> is:

<span>&#92;[ p_i = P(X = x_i), \quad i \in \mathbb{N}. &#92;]</span>

The **cumulative distribution function (cdf)** is:

<span>&#92;[ F(x) = P(X \leq x) = \sum_{i \in \mathbb{N}} p_i \mathbf{1}(x_i \leq x), \quad x \in \mathbb{R}, &#92;]</span>

and the <span>&#92;(k&#92;)</span>**th raw moment** is <span>&#92;(E[X^k] = \sum_{i \in \mathbb{N}} (x_i)^k p_i&#92;)</span>.

For a discrete rv taking only nonnegative integer values, the **probability generating function (pgf)** is:

<span>&#92;[ G(z) := E\left[z^X\right] = \sum_{i \in \mathbb{N}} z^i p_i = p_0 + zp_1 + z^2 p_2 + \cdots &#92;]</span>

Differentiating repeatedly yields:

<span>&#92;[ G^{(n)}(z) = E\left[X(X-1)\cdots(X-n+1)z^{X-n}\right] &#92;]</span>

so the pmf can be recovered from the pgf via <span>&#92;(p_n = G^{(n)}(0)/n!&#92;)</span>, and the pgf **uniquely determines** the distribution. The **factorial moments** are:

<span>&#92;[ E[X(X-1)\cdots(X-n+1)] = G^{(n)}(1) &#92;]</span>

In particular: <span>&#92;(E[X] = G'(1)&#92;)</span> and <span>&#92;(\text{Var}(X) = G''(1) + G'(1) - G'(1)^2&#92;)</span>.

**Example 1.** Let <span>&#92;(p_0 = 0.5, p_1 = 0.4, p_2 = 0.1&#92;)</span>. Then the pgf is <span>&#92;(G(z) = 0.5 + 0.4z + 0.1z^2&#92;)</span>.

### 2.2 Continuous Random Variables

A **continuous rv** takes values on a continuum, so <span>&#92;(P(X = x) = 0&#92;)</span> for each <span>&#92;(x&#92;)</span>. Its cdf is:

<span>&#92;[ F(x) = P(X \leq x) = \int_{-\infty}^{x} f(y)\, dy &#92;]</span>

where <span>&#92;(f&#92;)</span> is the **probability density function (pdf)**, satisfying <span>&#92;(f(x) = \frac{d}{dx}F(x)&#92;)</span>. The <span>&#92;(k&#92;)</span>th raw moment is <span>&#92;(E[X^k] = \int_{-\infty}^{\infty} x^k f(x)\, dx&#92;)</span>.

The **moment generating function (mgf)** is:

<span>&#92;[ M(t) := E\left[e^{tX}\right] = \int_{-\infty}^{\infty} e^{tx} f(x)\, dx &#92;]</span>

and <span>&#92;(E[X^k] = M^{(k)}(0)&#92;)</span>. The mgf uniquely characterizes the probability distribution.

**Example 2.** For <span>&#92;(X \sim \text{EXP}(0.1)&#92;)</span> with pdf <span>&#92;(f(x) = 0.1e^{-0.1x}&#92;)</span>, <span>&#92;(x > 0&#92;)</span>:

<span>&#92;[ F(x) = 1 - e^{-0.1x}, \quad M(t) = \frac{0.1}{0.1 - t}, \quad t < 0.1. &#92;]</span>

### 2.3 Mixed Random Variables

A **mixed rv** has both discrete and continuous components. These arise naturally when modelling payment amounts after policy adjustments — for example, a policy with a deductible produces a mixed payment rv with a probability mass at 0 (when the loss falls below the deductible).

Let <span>&#92;(\{x_i\}_{i \in \mathbb{N}}&#92;)</span> be discrete mass points with <span>&#92;(P(X = x_i) = p_i&#92;)</span>, and let <span>&#92;(f&#92;)</span> be a pdf on each interval between mass points. The cdf is:

<span>&#92;[ F(x) = \sum_{i \in \mathbb{N}} p_i \mathbf{1}_{\{x_i \leq x\}} + \sum_{i \in \mathbb{N}} \int_{x_i}^{x_{i+1}} f(y)\mathbf{1}_{\{y \leq x\}}\, dy &#92;]</span>

and the <span>&#92;(k&#92;)</span>th moment is <span>&#92;(E[X^k] = \sum_{i} x_i^k p_i + \sum_{i} \int_{x_i}^{x_{i+1}} x^k f(x)\, dx&#92;)</span>.

**Example 3.** Suppose a payment amount has probability mass <span>&#92;(p&#92;)</span> at 0 and is otherwise continuous with pdf <span>&#92;(f&#92;)</span> over <span>&#92;((0, \infty)&#92;)</span>. Then the cdf is <span>&#92;(F(x) = p + \int_0^x f(t)\, dt&#92;)</span> for <span>&#92;(x \geq 0&#92;)</span>, the <span>&#92;(k&#92;)</span>th moment is <span>&#92;(\int_0^\infty x^k f(x)\, dx&#92;)</span>, and we require <span>&#92;(p + \int_0^\infty f(x)\, dx = 1&#92;)</span>.

---

## Chapter 3: Frequency Distributions

This chapter studies the rv that counts the number of claims arising from a portfolio of insurance policies over a given period. A **counting rv** (or **counting distribution**) takes nonnegative integer values. We let <span>&#92;(N&#92;)</span> denote a counting rv with pmf <span>&#92;(p_n = P(N = n)&#92;)</span> and pgf <span>&#92;(G(z) = E[z^N] = \sum_{n=0}^\infty z^n p_n&#92;)</span>.

### 3.1 Common Frequency Distributions

#### 3.1.1 Poisson Distribution

A rv <span>&#92;(N \sim \text{POI}(\lambda)&#92;)</span> (with <span>&#92;(\lambda > 0&#92;)</span>) has pmf:

<span>&#92;[ p_n = \frac{\lambda^n e^{-\lambda}}{n!}, \quad n = 0, 1, 2, \ldots &#92;]</span>

Its pgf is <span>&#92;(G(z) = e^{\lambda(z-1)}&#92;)</span>, giving <span>&#92;(E[N] = \lambda&#92;)</span> and <span>&#92;(\text{Var}(N) = \lambda&#92;)</span>. The **equal mean and variance** (<span>&#92;(E[N] = \text{Var}(N)&#92;)</span>) is the key diagnostic for the Poisson in model selection.

**Closure under convolution.** If <span>&#92;(N_1, \ldots, N_k&#92;)</span> are independent with <span>&#92;(N_i \sim \text{POI}(\lambda_i)&#92;)</span>, then:

<span>&#92;[ N = \sum_{i=1}^k N_i \sim \text{POI}\!\left(\sum_{i=1}^k \lambda_i\right) &#92;]</span>

*Proof.* The pgf of <span>&#92;(N&#92;)</span> is <span>&#92;(\prod_i e^{\lambda_i(z-1)} = e^{(\sum_i \lambda_i)(z-1)}&#92;)</span>, which is the pgf of <span>&#92;(\text{POI}(\sum \lambda_i)&#92;)</span>. By pgf uniqueness, the result follows.

**Thinning property.** If <span>&#92;(N \sim \text{POI}(\lambda)&#92;)</span> counts events and each event is independently Type <span>&#92;(i&#92;)</span> with probability <span>&#92;(p_i&#92;)</span>, then the count of Type <span>&#92;(i&#92;)</span> events <span>&#92;(N_i \sim \text{POI}(\lambda p_i)&#92;)</span>, and <span>&#92;(N_1, \ldots, N_k&#92;)</span> are mutually independent.

#### 3.1.2 Binomial Distribution

A rv <span>&#92;(N \sim \text{BIN}(q, m)&#92;)</span> (with <span>&#92;(m \in \mathbb{Z}_+&#92;)</span>, <span>&#92;(q \in (0,1)&#92;)</span>) has pmf:

<span>&#92;[ p_n = \binom{m}{n} q^n (1-q)^{m-n}, \quad n = 0, 1, \ldots, m &#92;]</span>

The finite support implies a maximum possible claim count. Its pgf is <span>&#92;(G(z) = (1 - q + qz)^m&#92;)</span>, giving <span>&#92;(E[N] = mq&#92;)</span> and <span>&#92;(\text{Var}(N) = mq(1-q)&#92;)</span>. Note <span>&#92;(E[N] > \text{Var}(N)&#92;)</span>.

If <span>&#92;(N_i \sim \text{BIN}(q, m_i)&#92;)</span> independently, then <span>&#92;(\sum_i N_i \sim \text{BIN}(q, \sum_i m_i)&#92;)</span>. When <span>&#92;(m = 1&#92;)</span>, the Binomial reduces to the **Bernoulli distribution**.

#### 3.1.3 Negative Binomial Distribution

A rv <span>&#92;(N \sim \text{NB}(\beta, r)&#92;)</span> (with <span>&#92;(\beta > 0&#92;)</span>, <span>&#92;(r > 0&#92;)</span>) has pmf:

<span>&#92;[ p_n = \binom{n+r-1}{n} \left(\frac{1}{1+\beta}\right)^r \left(\frac{\beta}{1+\beta}\right)^n, \quad n = 0, 1, \ldots &#92;]</span>

using the generalized binomial coefficient <span>&#92;(\binom{x}{n} = \frac{\Gamma(x+1)}{n!\,\Gamma(x-n+1)}&#92;)</span>. Its pgf is <span>&#92;(G(z) = (1 + \beta - \beta z)^{-r}&#92;)</span>, giving <span>&#92;(E[N] = r\beta&#92;)</span> and <span>&#92;(\text{Var}(N) = r\beta(1+\beta)&#92;)</span>. Note <span>&#92;(E[N] < \text{Var}(N)&#92;)</span>.

If <span>&#92;(N_i \sim \text{NB}(\beta, r_i)&#92;)</span> independently, then <span>&#92;(\sum_i N_i \sim \text{NB}(\beta, \sum_i r_i)&#92;)</span>. When <span>&#92;(r = 1&#92;)</span>, this reduces to the **geometric distribution** <span>&#92;(\text{GEO}(\beta)&#92;)</span> with cdf <span>&#92;(F(k) = 1 - \left(\frac{\beta}{1+\beta}\right)^{k+1}&#92;)</span>.

### 3.2 The (a, b, 0) Class

**Definition.** A counting rv <span>&#92;(N&#92;)</span> belongs to the **(a, b, 0) class** if there exist constants <span>&#92;(a, b&#92;)</span> such that:

<span>&#92;[ p_n = \left(a + \frac{b}{n}\right) p_{n-1}, \quad n = 1, 2, \ldots &#92;]</span>

The Poisson, Binomial, and Negative Binomial are the **only** members of this class. Their parameters are:

| Distribution | <span>&#92;(a&#92;)</span> | <span>&#92;(b&#92;)</span> | <span>&#92;(p_0&#92;)</span> |
|---|---|---|---|
| <span>&#92;(\text{POI}(\lambda)&#92;)</span> | <span>&#92;(0&#92;)</span> | <span>&#92;(\lambda&#92;)</span> | <span>&#92;(e^{-\lambda}&#92;)</span> |
| <span>&#92;(\text{BIN}(q, m)&#92;)</span> | <span>&#92;(-\frac{q}{1-q}&#92;)</span> | <span>&#92;((m+1)\frac{q}{1-q}&#92;)</span> | <span>&#92;((1-q)^m&#92;)</span> |
| <span>&#92;(\text{NB}(\beta, r)&#92;)</span> | <span>&#92;(\frac{\beta}{1+\beta}&#92;)</span> | <span>&#92;((r-1)\frac{\beta}{1+\beta}&#92;)</span> | <span>&#92;((1+\beta)^{-r}&#92;)</span> |

**Example 9.** For <span>&#92;(N \sim \text{POI}(\lambda)&#92;)</span>: <span>&#92;(\frac{p_n}{p_{n-1}} = \frac{\lambda}{n}&#92;)</span>, so <span>&#92;(a = 0&#92;)</span>, <span>&#92;(b = \lambda&#92;)</span>.

**Example 12.** If <span>&#92;(N \sim \text{GEO}(\beta)&#92;)</span> is an (a, b, 0) member with <span>&#92;(a = 0.75&#92;)</span>, then <span>&#92;(\frac{\beta}{1+\beta} = 0.75&#92;)</span> giving <span>&#92;(\beta = 3&#92;)</span>, so <span>&#92;(p_2 = \frac{1}{4}\left(\frac{3}{4}\right)^2 \approx 0.1406&#92;)</span>.

### 3.3 Compounding Distributions

For two counting rvs <span>&#92;(K&#92;)</span> (primary) and <span>&#92;(M&#92;)</span> (secondary), the **compound rv** is:

<span>&#92;[ N = \begin{cases} \sum_{i=1}^K M_i, & K > 0, \\ 0, & K = 0, \end{cases} &#92;]</span>

where the <span>&#92;(M_i&#92;)</span> are iid copies of <span>&#92;(M&#92;)</span>, independent of <span>&#92;(K&#92;)</span>. The pgf of <span>&#92;(N&#92;)</span> is:

<span>&#92;[ G(z) = C(D(z)), &#92;]</span>

i.e., the pgf of the primary evaluated at the pgf of the secondary. The mean and variance are:

<span>&#92;[ E[N] = E[K]\,E[M], \qquad \text{Var}(N) = E[K]\,\text{Var}(M) + E[M]^2\,\text{Var}(K). &#92;]</span>

*In loss modelling,* <span>&#92;(K&#92;)</span> might represent the number of accidents and <span>&#92;(M_i&#92;)</span> the number of claims from the <span>&#92;(i&#92;)</span>th accident.

#### Computing the pmf

Three methods are available:

**1. Pmf method.** <span>&#92;(p_0 = C(d_0)&#92;)</span> and for <span>&#92;(n \geq 1&#92;)</span>: <span>&#92;(p_n = \sum_{k=1}^\infty d_n^{*k}\, c_k&#92;)</span> where <span>&#92;(d_n^{*k} = P(M_1 + \cdots + M_k = n)&#92;)</span>.

**2. Pgf method.** Compute <span>&#92;(G(z) = C(D(z))&#92;)</span>, expand as a power series, and read off coefficients.

**3. Panjer's recursion.** If <span>&#92;(K&#92;)</span> is an (a, b, 0) member:

<span>&#92;[ p_n = \frac{1}{1 - a\,d_0} \sum_{j=1}^n \left(a + \frac{b\,j}{n}\right) d_j\, p_{n-1-j+1}, \quad n \geq 1, &#92;]</span>

with <span>&#92;(p_0 = C(d_0)&#92;)</span>. This avoids the expensive convolution in the pmf method.

**Example 18.** If <span>&#92;(K \sim \text{POI}(\lambda)&#92;)</span> and <span>&#92;(M \sim \text{BIN}(q,1)&#92;)</span> (Bernoulli), then <span>&#92;(G(z) = e^{\lambda q(z-1)}&#92;)</span>, so <span>&#92;(N \sim \text{POI}(\lambda q)&#92;)</span>.

### 3.4 Effect of Policy Adjustments on Frequency

Under a policy with ordinary deductible <span>&#92;(d&#92;)</span>, not every loss results in a payment. Define <span>&#92;(\alpha = P(\text{loss results in non-zero payment})&#92;)</span>. If <span>&#92;(N&#92;)</span> is the number of losses and <span>&#92;(M&#92;)</span> the number of non-zero payments, then <span>&#92;(M&#92;)</span> is a compound rv with primary <span>&#92;(N&#92;)</span> and secondary Bernoulli(<span>&#92;(\alpha&#92;)</span>), giving pgf <span>&#92;(H(z) = P(1 - \alpha + \alpha z)&#92;)</span>.

**Key results:**

| Loss distribution | Payment distribution |
|---|---|
| <span>&#92;(N \sim \text{POI}(\lambda)&#92;)</span> | <span>&#92;(M \sim \text{POI}(\alpha\lambda)&#92;)</span> |
| <span>&#92;(N \sim \text{BIN}(q, m)&#92;)</span> | <span>&#92;(M \sim \text{BIN}(\alpha q, m)&#92;)</span> |
| <span>&#92;(N \sim \text{NB}(\beta, r)&#92;)</span> | <span>&#92;(M \sim \text{NB}(\alpha\beta, r)&#92;)</span> |

All three distributions stay within the same parametric family after thinning, which is a useful property for model consistency.

### 3.5 Estimation of Frequency Distributions

Since insurers only observe losses that result in non-zero payments, estimation uses **payment data**. Let <span>&#92;(z_k&#92;)</span> be the number of times <span>&#92;(k&#92;)</span> payments are observed. The **log-likelihood** for the compound payment rv <span>&#92;(M&#92;)</span> with pmf <span>&#92;(\{p_k\}&#92;)</span> is:

<span>&#92;[ \ell = \sum_{k=0}^\infty z_k \ln p_k &#92;]</span>

**Example 20.** If <span>&#92;(N \sim \text{POI}(\lambda)&#92;)</span> and payment probability is <span>&#92;(\alpha&#92;)</span>, then <span>&#92;(M \sim \text{POI}(\alpha\lambda)&#92;)</span>. The MLE of <span>&#92;(\lambda&#92;)</span> is:

<span>&#92;[ \hat{\lambda} = \frac{1}{\alpha} \cdot \frac{\sum_{k=0}^\infty k\, n_k}{n} = \frac{\bar{k}}{\alpha} &#92;]</span>

where <span>&#92;(n = \sum_k n_k&#92;)</span> is the total number of observations and <span>&#92;(\bar{k}&#92;)</span> is the sample mean of payment counts.

---

## Chapter 4: Severity Distributions

The **severity model** describes the size of each individual claim/payment. The **ground-up loss** rv is denoted <span>&#92;(X&#92;)</span>; the insurer's actual payment after policy adjustments differs from <span>&#92;(X&#92;)</span>.

### 4.1 Nonparametric Approach

The **empirical distribution function (edf)** assigns probability <span>&#92;(1/n&#92;)</span> to each data point in a sample of size <span>&#92;(n&#92;)</span>:

<span>&#92;[ \hat{F}_n(x) = \frac{1}{n} \sum_{i=1}^n \mathbf{1}_{\{X_i \leq x\}} &#92;]</span>

**Example 22.** For losses {30, 80, 80, 150, 150, 150, 200, 300}, the edf assigns <span>&#92;(P(X = 30) = 1/8&#92;)</span>, <span>&#92;(P(X = 80) = 1/4&#92;)</span>, etc.

### 4.2 Common Severity Distributions

Several parametric families are used for ground-up losses:

- **Exponential** <span>&#92;(\text{EXP}(\theta)&#92;)</span>: pdf <span>&#92;(f(x) = \frac{1}{\theta}e^{-x/\theta}&#92;)</span>, mean <span>&#92;(\theta&#92;)</span>, variance <span>&#92;(\theta^2&#92;)</span>
- **Gamma** <span>&#92;(\text{GAM}(\alpha, \theta)&#92;)</span>: includes Erlang as a special case (<span>&#92;(\alpha \in \mathbb{Z}_+&#92;)</span>)
- **Pareto** <span>&#92;(\text{PAR}(\alpha, \theta)&#92;)</span>: heavy-tailed; survival function <span>&#92;(\bar{F}(x) = \left(\frac{\theta}{x+\theta}\right)^\alpha&#92;)</span>
- **Lognormal** <span>&#92;(\text{LOGN}(\mu, \sigma)&#92;)</span>: <span>&#92;(X = e^Y&#92;)</span> where <span>&#92;(Y \sim N(\mu, \sigma^2)&#92;)</span>
- **Weibull**, **Burr**, and others

An important property is the **limited expected value**:

<span>&#92;[ E[X \wedge u] = \int_0^u \bar{F}(x)\, dx &#92;]</span>

where <span>&#92;(X \wedge u = \min(X, u)&#92;)</span>. More generally, the <span>&#92;(k&#92;)</span>th moment of the limited rv is:

<span>&#92;[ E\left[(X \wedge u)^k\right] = k\int_0^u x^{k-1}\bar{F}(x)\, dx &#92;]</span>

### 4.3 Constructing New Distributions

New distributions can be constructed from existing ones via:

- **Scaling:** if <span>&#92;(X \sim \text{EXP}(\theta)&#92;)</span> then <span>&#92;(cX \sim \text{EXP}(c\theta)&#92;)</span> (exponential is a **scale distribution**)
- **Power transformations:** if <span>&#92;(Y = X^{1/\tau}&#92;)</span>, the resulting distribution has a modified shape
- **Lognormal:** if <span>&#92;(X \sim N(\mu, \sigma^2)&#92;)</span>, then <span>&#92;(Y = e^X \sim \text{LOGN}(\mu, \sigma)&#92;)</span>

### 4.4 Policy Adjustments

Three standard adjustments affect the payment amount:

- **Ordinary deductible** <span>&#92;(d&#92;)</span>: insurer pays <span>&#92;((X - d)_+&#92;)</span>
- **Policy limit** <span>&#92;(u&#92;)</span>: insurer pays at most <span>&#92;(u&#92;)</span>
- **Coinsurance factor** <span>&#92;(\alpha \in (0,1]&#92;)</span>: insurer pays fraction <span>&#92;(\alpha&#92;)</span> of each dollar

The **amount paid per loss** under all three adjustments is:

<span>&#92;[ Y^L = \alpha\left[(X \wedge u) - d\right]_+ &#92;]</span>

The **amount paid per payment** (conditional on a non-zero payment) is:

<span>&#92;[ Y^P = Y^L \mid Y^L > 0 &#92;]</span>

**Proposition 32.** The cdf of <span>&#92;(Y^P&#92;)</span> is:

<span>&#92;[ F_{Y^P}(y) = \frac{F\!\left(\frac{y}{\alpha} + d\right) - F(d)}{1 - F(d)}, \quad 0 \leq y < \alpha(u-d) &#92;]</span>

and the expected amount paid per payment satisfies:

<span>&#92;[ E[Y^P] = \frac{E[Y^L]}{1 - F(d)} &#92;]</span>

**Proposition 33.** For a nonnegative rv <span>&#92;(Y&#92;)</span> with survival function <span>&#92;(\bar{F}_Y&#92;)</span>:

<span>&#92;[ E[Y] = \int_0^\infty \bar{F}_Y(y)\, dy &#92;]</span>

#### Loss Elimination Ratio

The **loss elimination ratio (LER)** measures the proportion of expected loss eliminated by policy adjustments:

<span>&#92;[ \text{LER} = 1 - \frac{E[Y^L]}{E[X]} &#92;]</span>

For a policy with only an ordinary deductible <span>&#92;(d&#92;)</span>: <span>&#92;(\text{LER} = \frac{E[X \wedge d]}{E[X]}&#92;)</span>.

**Example 37.** For <span>&#92;(X \sim \text{PAR}(2, 1000)&#92;)</span> with <span>&#92;(\bar{F}(x) = \left(\frac{1000}{x+1000}\right)^2&#92;)</span>, setting <span>&#92;(\text{LER} = 0.2&#92;)</span> gives <span>&#92;(\frac{d}{d+1000} = 0.2&#92;)</span>, so <span>&#92;(d = 250&#92;)</span>.

### 4.5 Estimation of Severity Distributions

Estimating parameters for the ground-up loss <span>&#92;(X&#92;)</span> is complicated because the insurer's data is **truncated from below** (losses below <span>&#92;(d&#92;)</span> are not reported) and **censored from above** (losses above <span>&#92;(u&#92;)</span> are recorded only as the maximum payment).

The likelihood contribution for each observation is:

- **Non-maximum payments** <span>&#92;(y \in (0, \alpha(u-d))&#92;)</span>: <span>&#92;(\frac{\frac{1}{\alpha} f\!\left(\frac{y}{\alpha} + d\right)}{1 - F(d)}&#92;)</span>
- **Maximum payment** <span>&#92;(y = \alpha(u-d)&#92;)</span>: <span>&#92;(\frac{1 - F(u)}{1 - F(d)}&#92;)</span>

**Example 38.** Policy with limit 100, deductible 10, coinsurance 0.9. Payment data: 1.8, 15.3, 73.8, 81, 81 (where 81 is the maximum payment). For <span>&#92;(X \sim \text{EXP}(\theta)&#92;)</span>, the MLE is <span>&#92;(\hat{\theta} = 281/3 \approx 93.67&#92;)</span>.

For **grouped data** in payment intervals <span>&#92;((c_{i-1}, c_i]&#92;)</span> with counts <span>&#92;(n_i&#92;)</span>:

<span>&#92;[ L = \prod_{i=1}^n \left[\frac{F\!\left(\frac{c_i}{\alpha} + d\right) - F\!\left(\frac{c_{i-1}}{\alpha} + d\right)}{1 - F(d)}\right]^{n_i} &#92;]</span>

**Example 39.** Policy limit 1100, deductible 100, coinsurance 80%. Payment intervals (0, 400], (400, 800], and maximum 800. For <span>&#92;(X \sim \text{EXP}(\theta)&#92;)</span>, solving <span>&#92;(\frac{d\ell}{d\theta} = 0&#92;)</span> yields <span>&#92;(\hat{\theta} = \frac{500}{-\ln(2/3)} \approx 1233.15&#92;)</span>.

---

## Chapter 5: Aggregate Loss/Payment Distributions

### 5.1 The Collective Risk Model

The **aggregate loss** is the compound rv:

<span>&#92;[ S = \begin{cases} \sum_{i=1}^N X_i, & N > 0, \\ 0, & N = 0, \end{cases} &#92;]</span>

where <span>&#92;(N&#92;)</span> is the frequency rv and <span>&#92;(X_i&#92;)</span> are iid severity rvs. Equivalently, the **aggregate payment** can be expressed as a compound rv using either (N, <span>&#92;(Y^L&#92;)</span>) or (M, <span>&#92;(Y^P&#92;)</span>) as the (primary, secondary) pair.

### 5.2 Distributional Properties

Treating <span>&#92;(S&#92;)</span> as a general compound rv with primary <span>&#92;(K&#92;)</span> (pgf <span>&#92;(C(z)&#92;)</span>) and secondary <span>&#92;(Z&#92;)</span> (mgf <span>&#92;(\tilde{G}(t)&#92;)</span>):

**CDF:**
<span>&#92;[ P(S \leq x) = c_0 + \sum_{k=1}^\infty c_k G^{*k}(x) &#92;]</span>

where <span>&#92;(G^{*k}(x) = P(Z_1 + \cdots + Z_k \leq x)&#92;)</span> is the <span>&#92;(k&#92;)</span>-fold convolution.

**MGF:**
<span>&#92;[ E\!\left[e^{tS}\right] = C\!\left(\tilde{G}(t)\right) &#92;]</span>

**Mean and variance:**
<span>&#92;[ E[S] = E[K]\,E[Z], \qquad \text{Var}(S) = E[K]\,\text{Var}(Z) + E[Z]^2\,\text{Var}(K) &#92;]</span>

**Example 40.** If <span>&#92;(Z \sim \text{EXP}(\theta)&#92;)</span>, then <span>&#92;(G^{*k}&#92;)</span> is the cdf of an Erlang<span>&#92;((k, \theta)&#92;)</span> rv, allowing an explicit closed-form for <span>&#92;(P(S \leq x)&#92;)</span>.

**Example 41.** For <span>&#92;(K \sim \text{GEO}(\beta)&#92;)</span> and <span>&#92;(Z \sim \text{EXP}(\theta)&#92;)</span>, the mgf of <span>&#92;(S&#92;)</span> simplifies to <span>&#92;(\frac{1 - \theta t}{1 - (1+\beta)\theta t}&#92;)</span>, which corresponds to a **mixed rv** with probability mass <span>&#92;(\frac{1}{1+\beta}&#92;)</span> at 0 and exponential density with rate <span>&#92;(\frac{1}{(1+\beta)\theta}&#92;)</span> for <span>&#92;(x > 0&#92;)</span>. The cdf is:

<span>&#92;[ P(S \leq s) = 1 - \frac{\beta}{1+\beta} e^{-\frac{s}{(1+\beta)\theta}}, \quad s \geq 0 &#92;]</span>

### 5.3 Approximation Methods

In general, closed-form expressions for <span>&#92;(P(S \leq x)&#92;)</span> are rare. Two approximation methods are widely used.

#### 5.3.1 Normal Approximation

Approximate <span>&#92;(\frac{S - E[S]}{\sqrt{\text{Var}(S)}} \approx N(0,1)&#92;)</span>, so:

<span>&#92;[ P(S \leq s) \approx \Phi\!\left(\frac{s - E[S]}{\sqrt{\text{Var}(S)}}\right) &#92;]</span>

This approximation is good when <span>&#92;(\lambda&#92;)</span> is large (Poisson), <span>&#92;(m&#92;)</span> is large (Binomial), or <span>&#92;(r&#92;)</span> is large (Negative Binomial). **Caution:** the normal approximation may underestimate the right tail of <span>&#92;(S&#92;)</span>, which is dangerous from a risk management standpoint.

**Example 42.** <span>&#92;(K \sim \text{POI}(50)&#92;)</span>, <span>&#92;(Z \sim \text{EXP}(2)&#92;)</span>. Then <span>&#92;(E[S] = 100&#92;)</span>, <span>&#92;(\text{Var}(S) = 400&#92;)</span>. The 95th percentile is approximately <span>&#92;(1.645\sqrt{400} + 100 = 132.9&#92;)</span>.

#### 5.3.2 Method of Rounding (Discretization)

**Discretize** <span>&#92;(Z&#92;)</span> to a discrete rv <span>&#92;(Z^*&#92;)</span> on multiples of span <span>&#92;(h > 0&#92;)</span>:

<span>&#92;[ g_0 = G\!\left(\frac{h}{2}\right), \qquad g_k = G\!\left(kh + \frac{h}{2}\right) - G\!\left(kh - \frac{h}{2}\right), \quad k \geq 1 &#92;]</span>

Then use Panjer's recursion on the discretized distribution to obtain the pmf of <span>&#92;(S^* \approx S&#92;)</span>. The approximation improves as <span>&#92;(h \to 0&#92;)</span>.

**Example 43.** <span>&#92;(K \sim \text{POI}(3)&#92;)</span>, <span>&#92;(Z \sim \text{PAR}(4, 10)&#92;)</span>, span <span>&#92;(h = 2.5&#92;)</span>. The discretized probabilities are <span>&#92;(g_0 \approx 0.3757&#92;)</span>, <span>&#92;(g_1 \approx 0.3445&#92;)</span>, <span>&#92;(g_2 \approx 0.1364&#92;)</span>. Panjer's recursion then gives <span>&#92;(P(S^* = 0) \approx 0.1537&#92;)</span>, <span>&#92;(P(S^* = 2.5) \approx 0.1588&#92;)</span>, <span>&#92;(P(S^* = 5) \approx 0.1450&#92;)</span>.

For aggregate **payment** approximation, it is recommended to discretize <span>&#92;(Y^P&#92;)</span> rather than <span>&#92;(Y^L&#92;)</span> for better accuracy (Example 44).

### 5.4 Introduction to Reinsurance

**Reinsurance** is insurance purchased by an insurer (the **cedant**) from a reinsurer. Two common treaties:

- **Quota share:** reinsurer pays fraction <span>&#92;(\kappa&#92;)</span> of aggregate payment <span>&#92;(S&#92;)</span>; premium is <span>&#92;((1+\theta)E[\kappa S]&#92;)</span>
- **Stop-loss:** insurer pays <span>&#92;(\min(S, \xi)&#92;)</span>; reinsurer pays <span>&#92;((S - \xi)_+&#92;)</span>, effectively capping the insurer's liability

The **net stop-loss premium** (expected reinsurer payment) is:

<span>&#92;[ E[I_\xi] = E[(S-\xi)_+] = \int_\xi^\infty P(S > x)\, dx &#92;]</span>

For integer-valued <span>&#92;(S&#92;)</span>, the stop-loss premium satisfies the recursion:

<span>&#92;[ E[I_{\xi+1}] = E[I_\xi] - P(S > \xi), \quad \xi \in \mathbb{N} &#92;]</span>

with starting point <span>&#92;(E[I_0] = E[S]&#92;)</span>.

**Example 45.** <span>&#92;(S&#92;)</span> compound Poisson with <span>&#92;(\lambda = 2.5&#92;)</span>, <span>&#92;(g_1 = 0.8&#92;)</span>, <span>&#92;(g_2 = 0.2&#92;)</span>. Then <span>&#92;(E[S] = 3&#92;)</span>, <span>&#92;(P(S = 0) = e^{-2.5}&#92;)</span>, <span>&#92;(P(S = 1) = 2.5(0.8)e^{-2.5} \approx 0.1642&#92;)</span>. Applying the recursion:

<span>&#92;[ E[I_2] \approx 3 - (1 - e^{-2.5}) - 0.1642 \approx 1.3284 &#92;]</span>

---

## Chapter 6: Loss Reserving

*Based on Brown & Lennox, Introduction to Ratemaking and Loss Reserving.*

### 6.1 Introduction

**Loss reserving** is the actuarial function of determining the **loss reserve** — the estimated present liability for future claim payments. Reserves are the largest liabilities on a property and casualty insurer's balance sheet, and their accuracy is essential for solvency and regulatory compliance.

Claims can remain open for years after the accident date. Key terminology:

- **Accident year (AY):** the year the loss-causing event occurred
- **Calendar year (CY):** the year in which a payment was actually made
- **Development year (DY):** years elapsed since the accident year

### 6.2 Chain-Ladder Method

The **chain-ladder method** (also called the **loss development triangle method**) assumes that past loss payment patterns can be used to project future payments. The data is arranged in a **development triangle** showing cumulative payments by accident year and development year.

**Step 1.** Construct the **incremental** and **cumulative** payment triangles.

**Step 2.** Compute **age-to-age loss development factors** (link ratios): ratio of cumulative payments in successive development years for each accident year.

**Step 3.** Determine a single set of age-to-age factors for each development year column using one of three methods:

| Method | Description |
|--------|-------------|
| **Average method** | Arithmetic mean of all link ratios in the column |
| **Five-year average** | Arithmetic mean of the 5 most recent link ratios |
| **Volume-weighted average** | Sum of DY<span>&#92;((i+1)&#92;)</span> entries divided by sum of DY<span>&#92;(i&#92;)</span> entries across all AYs |

**Step 4.** Project each incomplete AY's cumulative payments forward by multiplying by the selected development factors.

**Step 5.** The **IBNR (Incurred But Not Reported) reserve** for each AY is:

<span>&#92;[ \text{Reserve}_{AY} = \text{Projected Ultimate} - \text{Current Cumulative} &#92;]</span>

**Example 46.** (Numerical example with full development triangle and three averaging methods, leading to projected ultimates and IBNR reserves for each accident year.)

### 6.3 Expected Loss Ratio Method

The **expected loss ratio (ELR) method** projects the ultimate loss using an a priori expected loss ratio:

<span>&#92;[ \text{Ultimate Loss}_{AY} = \text{Earned Premium}_{AY} \times \text{ELR} &#92;]</span>

The reserve for each AY is the projected ultimate minus current cumulative payments. This method is most useful for immature accident years where there is little development history.

### 6.4 Bornhuetter-Ferguson Method

The **Bornhuetter-Ferguson (BF) method** blends the chain-ladder and expected loss ratio methods. It is particularly useful for immature accident years where the chain-ladder may over-react to sparse early data.

For accident year <span>&#92;(i&#92;)</span> currently at development year <span>&#92;(j&#92;)</span>:

<span>&#92;[ \text{Ultimate}_{i} = C_{ij} + (1 - 1/f_j) \times \text{Expected Ultimate}_{i} &#92;]</span>

where:
- <span>&#92;(C_{ij}&#92;)</span> is the current cumulative paid loss
- <span>&#92;(f_j&#92;)</span> is the **tail factor** (product of all remaining development factors from DY<span>&#92;(j&#92;)</span> to ultimate)
- <span>&#92;((1 - 1/f_j)&#92;)</span> is the **percent unreported** (the fraction of ultimate losses yet to emerge)
- Expected Ultimate = Earned Premium × ELR

The BF reserve for AY <span>&#92;(i&#92;)</span> is:

<span>&#92;[ \text{Reserve}_{i} = (1 - 1/f_j) \times \text{Expected Ultimate}_{i} &#92;]</span>

This interpretation is intuitive: the reserve equals the expected unreported losses, where "unreported" is estimated from the tail factor rather than from actual data.

**Example 48/49.** Given a development triangle and ELR, the BF method produces ultimate estimates that are a credibility-weighted blend of actual development (chain-ladder component) and expected losses (ELR component), with more weight on the expected losses for younger, less developed accident years.
