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

A **discrete rv** takes a finite or countable number of values. The **probability mass function (pmf)** of a discrete rv \(X\) taking values \(\{x_i\}_{i \in \mathbb{N}}\) is:

\[ p_i = P(X = x_i), \quad i \in \mathbb{N}. \]

The **cumulative distribution function (cdf)** is:

\[ F(x) = P(X \leq x) = \sum_{i \in \mathbb{N}} p_i \mathbf{1}(x_i \leq x), \quad x \in \mathbb{R}, \]

and the \(k\)**th raw moment** is \(E[X^k] = \sum_{i \in \mathbb{N}} (x_i)^k p_i\).

For a discrete rv taking only nonnegative integer values, the **probability generating function (pgf)** is:

\[ G(z) := E\left[z^X\right] = \sum_{i \in \mathbb{N}} z^i p_i = p_0 + zp_1 + z^2 p_2 + \cdots \]

Differentiating repeatedly yields:

\[ G^{(n)}(z) = E\left[X(X-1)\cdots(X-n+1)z^{X-n}\right] \]

so the pmf can be recovered from the pgf via \(p_n = G^{(n)}(0)/n!\), and the pgf **uniquely determines** the distribution. The **factorial moments** are:

\[ E[X(X-1)\cdots(X-n+1)] = G^{(n)}(1) \]

In particular: \(E[X] = G'(1)\) and \(\text{Var}(X) = G''(1) + G'(1) - G'(1)^2\).

**Example 1.** Let \(p_0 = 0.5, p_1 = 0.4, p_2 = 0.1\). Then the pgf is \(G(z) = 0.5 + 0.4z + 0.1z^2\).

### 2.2 Continuous Random Variables

A **continuous rv** takes values on a continuum, so \(P(X = x) = 0\) for each \(x\). Its cdf is:

\[ F(x) = P(X \leq x) = \int_{-\infty}^{x} f(y)\, dy \]

where \(f\) is the **probability density function (pdf)**, satisfying \(f(x) = \frac{d}{dx}F(x)\). The \(k\)th raw moment is \(E[X^k] = \int_{-\infty}^{\infty} x^k f(x)\, dx\).

The **moment generating function (mgf)** is:

\[ M(t) := E\left[e^{tX}\right] = \int_{-\infty}^{\infty} e^{tx} f(x)\, dx \]

and \(E[X^k] = M^{(k)}(0)\). The mgf uniquely characterizes the probability distribution.

**Example 2.** For \(X \sim \text{EXP}(0.1)\) with pdf \(f(x) = 0.1e^{-0.1x}\), \(x > 0\):

\[ F(x) = 1 - e^{-0.1x}, \quad M(t) = \frac{0.1}{0.1 - t}, \quad t < 0.1. \]

### 2.3 Mixed Random Variables

A **mixed rv** has both discrete and continuous components. These arise naturally when modelling payment amounts after policy adjustments — for example, a policy with a deductible produces a mixed payment rv with a probability mass at 0 (when the loss falls below the deductible).

Let \(\{x_i\}_{i \in \mathbb{N}}\) be discrete mass points with \(P(X = x_i) = p_i\), and let \(f\) be a pdf on each interval between mass points. The cdf is:

\[ F(x) = \sum_{i \in \mathbb{N}} p_i \mathbf{1}_{\{x_i \leq x\}} + \sum_{i \in \mathbb{N}} \int_{x_i}^{x_{i+1}} f(y)\mathbf{1}_{\{y \leq x\}}\, dy \]

and the \(k\)th moment is \(E[X^k] = \sum_{i} x_i^k p_i + \sum_{i} \int_{x_i}^{x_{i+1}} x^k f(x)\, dx\).

**Example 3.** Suppose a payment amount has probability mass \(p\) at 0 and is otherwise continuous with pdf \(f\) over \((0, \infty)\). Then the cdf is \(F(x) = p + \int_0^x f(t)\, dt\) for \(x \geq 0\), the \(k\)th moment is \(\int_0^\infty x^k f(x)\, dx\), and we require \(p + \int_0^\infty f(x)\, dx = 1\).

---

## Chapter 3: Frequency Distributions

This chapter studies the rv that counts the number of claims arising from a portfolio of insurance policies over a given period. A **counting rv** (or **counting distribution**) takes nonnegative integer values. We let \(N\) denote a counting rv with pmf \(p_n = P(N = n)\) and pgf \(G(z) = E[z^N] = \sum_{n=0}^\infty z^n p_n\).

### 3.1 Common Frequency Distributions

#### 3.1.1 Poisson Distribution

A rv \(N \sim \text{POI}(\lambda)\) (with \(\lambda > 0\) has pmf:

\[ p_n = \frac{\lambda^n e^{-\lambda}}{n!}, \quad n = 0, 1, 2, \ldots \]

Its pgf is \(G(z) = e^{\lambda(z-1)}\), giving \(E[N] = \lambda\) and \(\text{Var}(N) = \lambda\). The **equal mean and variance** (\(E[N] = \text{Var}(N)\) is the key diagnostic for the Poisson in model selection.

**Closure under convolution.** If \(N_1, \ldots, N_k\) are independent with \(N_i \sim \text{POI}(\lambda_i)\), then:

\[ N = \sum_{i=1}^k N_i \sim \text{POI}\!\left(\sum_{i=1}^k \lambda_i\right) \]

*Proof.* The pgf of \(N\) is \(\prod_i e^{\lambda_i(z-1)} = e^{(\sum_i \lambda_i)(z-1)}\), which is the pgf of \(\text{POI}(\sum \lambda_i)\). By pgf uniqueness, the result follows.

**Thinning property.** If \(N \sim \text{POI}(\lambda)\) counts events and each event is independently Type \(i\) with probability \(p_i\), then the count of Type \(i\) events \(N_i \sim \text{POI}(\lambda p_i)\), and \(N_1, \ldots, N_k\) are mutually independent.

#### 3.1.2 Binomial Distribution

A rv \(N \sim \text{BIN}(q, m)\) (with \(m \in \mathbb{Z}_+\), \(q \in (0,1)\) has pmf:

\[ p_n = \binom{m}{n} q^n (1-q)^{m-n}, \quad n = 0, 1, \ldots, m \]

The finite support implies a maximum possible claim count. Its pgf is \(G(z) = (1 - q + qz)^m\), giving \(E[N] = mq\) and \(\text{Var}(N) = mq(1-q)\). Note \(E[N] > \text{Var}(N)\).

If \(N_i \sim \text{BIN}(q, m_i)\) independently, then \(\sum_i N_i \sim \text{BIN}(q, \sum_i m_i)\). When \(m = 1\), the Binomial reduces to the **Bernoulli distribution**.

#### 3.1.3 Negative Binomial Distribution

A rv \(N \sim \text{NB}(\beta, r)\) (with \(\beta > 0\), \(r > 0\) has pmf:

\[ p_n = \binom{n+r-1}{n} \left(\frac{1}{1+\beta}\right)^r \left(\frac{\beta}{1+\beta}\right)^n, \quad n = 0, 1, \ldots \]

using the generalized binomial coefficient \(\binom{x}{n} = \frac{\Gamma(x+1)}{n!\,\Gamma(x-n+1)}\). Its pgf is \(G(z) = (1 + \beta - \beta z)^{-r}\), giving \(E[N] = r\beta\) and \(\text{Var}(N) = r\beta(1+\beta)\). Note \(E[N] < \text{Var}(N)\).

If \(N_i \sim \text{NB}(\beta, r_i)\) independently, then \(\sum_i N_i \sim \text{NB}(\beta, \sum_i r_i)\). When \(r = 1\), this reduces to the **geometric distribution** \(\text{GEO}(\beta)\) with cdf \(F(k) = 1 - \left(\frac{\beta}{1+\beta}\right)^{k+1}\).

### 3.2 The (a, b, 0) Class

**Definition.** A counting rv \(N\) belongs to the **(a, b, 0) class** if there exist constants \(a, b\) such that:

\[ p_n = \left(a + \frac{b}{n}\right) p_{n-1}, \quad n = 1, 2, \ldots \]

The Poisson, Binomial, and Negative Binomial are the **only** members of this class. Their parameters are:

| Distribution | \(a\) | \(b\) | \(p_0\) |
|---|---|---|---|
| \(\text{POI}(\lambda)\) | \(0\) | \(\lambda\) | \(e^{-\lambda}\) |
| \(\text{BIN}(q, m)\) | \(-\frac{q}{1-q}\) | \((m+1)\frac{q}{1-q}\) | \((1-q)^m\) |
| \(\text{NB}(\beta, r)\) | \(\frac{\beta}{1+\beta}\) | \((r-1)\frac{\beta}{1+\beta}\) | \((1+\beta)^{-r}\) |

**Example 9.** For \(N \sim \text{POI}(\lambda)\): \(\frac{p_n}{p_{n-1}} = \frac{\lambda}{n}\), so \(a = 0\), \(b = \lambda\).

**Example 12.** If \(N \sim \text{GEO}(\beta)\) is an (a, b, 0) member with \(a = 0.75\), then \(\frac{\beta}{1+\beta} = 0.75\) giving \(\beta = 3\), so \(p_2 = \frac{1}{4}\left(\frac{3}{4}\right)^2 \approx 0.1406\).

### 3.3 Compounding Distributions

For two counting rvs \(K\) (primary) and \(M\) (secondary), the **compound rv** is:

\[ N = \begin{cases} \sum_{i=1}^K M_i, & K > 0, \\ 0, & K = 0, \end{cases} \]

where the \(M_i\) are iid copies of \(M\), independent of \(K\). The pgf of \(N\) is:

\[ G(z) = C(D(z)), \]

i.e., the pgf of the primary evaluated at the pgf of the secondary. The mean and variance are:

\[ E[N] = E[K]\,E[M], \qquad \text{Var}(N) = E[K]\,\text{Var}(M) + E[M]^2\,\text{Var}(K). \]

*In loss modelling,* \(K\) might represent the number of accidents and \(M_i\) the number of claims from the \(i\)th accident.

#### Computing the pmf

Three methods are available:

**1. Pmf method.** \(p_0 = C(d_0)\) and for \(n \geq 1\): \(p_n = \sum_{k=1}^\infty d_n^{*k}\, c_k\) where \(d_n^{*k} = P(M_1 + \cdots + M_k = n)\).

**2. Pgf method.** Compute \(G(z) = C(D(z))\), expand as a power series, and read off coefficients.

**3. Panjer's recursion.** If \(K\) is an (a, b, 0) member:

\[ p_n = \frac{1}{1 - a\,d_0} \sum_{j=1}^n \left(a + \frac{b\,j}{n}\right) d_j\, p_{n-1-j+1}, \quad n \geq 1, \]

with \(p_0 = C(d_0)\). This avoids the expensive convolution in the pmf method.

**Example 18.** If \(K \sim \text{POI}(\lambda)\) and \(M \sim \text{BIN}(q,1)\) (Bernoulli), then \(G(z) = e^{\lambda q(z-1)}\), so \(N \sim \text{POI}(\lambda q)\).

### 3.4 Effect of Policy Adjustments on Frequency

Under a policy with ordinary deductible \(d\), not every loss results in a payment. Define \(\alpha = P(\text{loss results in non-zero payment})\). If \(N\) is the number of losses and \(M\) the number of non-zero payments, then \(M\) is a compound rv with primary \(N\) and secondary Bernoulli(\(\alpha\), giving pgf \(H(z) = P(1 - \alpha + \alpha z)\).

**Key results:**

| Loss distribution | Payment distribution |
|---|---|
| \(N \sim \text{POI}(\lambda)\) | \(M \sim \text{POI}(\alpha\lambda)\) |
| \(N \sim \text{BIN}(q, m)\) | \(M \sim \text{BIN}(\alpha q, m)\) |
| \(N \sim \text{NB}(\beta, r)\) | \(M \sim \text{NB}(\alpha\beta, r)\) |

All three distributions stay within the same parametric family after thinning, which is a useful property for model consistency.

### 3.5 Estimation of Frequency Distributions

Since insurers only observe losses that result in non-zero payments, estimation uses **payment data**. Let \(z_k\) be the number of times \(k\) payments are observed. The **log-likelihood** for the compound payment rv \(M\) with pmf \(\{p_k\}\) is:

\[ \ell = \sum_{k=0}^\infty z_k \ln p_k \]

**Example 20.** If \(N \sim \text{POI}(\lambda)\) and payment probability is \(\alpha\), then \(M \sim \text{POI}(\alpha\lambda)\). The MLE of \(\lambda\) is:

\[ \hat{\lambda} = \frac{1}{\alpha} \cdot \frac{\sum_{k=0}^\infty k\, n_k}{n} = \frac{\bar{k}}{\alpha} \]

where \(n = \sum_k n_k\) is the total number of observations and \(\bar{k}\) is the sample mean of payment counts.

---

## Chapter 4: Severity Distributions

The **severity model** describes the size of each individual claim/payment. The **ground-up loss** rv is denoted \(X\); the insurer's actual payment after policy adjustments differs from \(X\).

### 4.1 Nonparametric Approach

The **empirical distribution function (edf)** assigns probability \(1/n\) to each data point in a sample of size \(n\):

\[ \hat{F}_n(x) = \frac{1}{n} \sum_{i=1}^n \mathbf{1}_{\{X_i \leq x\}} \]

**Example 22.** For losses {30, 80, 80, 150, 150, 150, 200, 300}, the edf assigns \(P(X = 30) = 1/8\), \(P(X = 80) = 1/4\), etc.

### 4.2 Common Severity Distributions

Several parametric families are used for ground-up losses:

- **Exponential** \(\text{EXP}(\theta)\): pdf \(f(x) = \frac{1}{\theta}e^{-x/\theta}\), mean \(\theta\), variance \(\theta^2\)
- **Gamma** \(\text{GAM}(\alpha, \theta)\): includes Erlang as a special case (\(\alpha \in \mathbb{Z}_+\)
- **Pareto** \(\text{PAR}(\alpha, \theta)\): heavy-tailed; survival function \(\bar{F}(x) = \left(\frac{\theta}{x+\theta}\right)^\alpha\)
- **Lognormal** \(\text{LOGN}(\mu, \sigma)\): \(X = e^Y\) where \(Y \sim N(\mu, \sigma^2)\)
- **Weibull**, **Burr**, and others

An important property is the **limited expected value**:

\[ E[X \wedge u] = \int_0^u \bar{F}(x)\, dx \]

where \(X \wedge u = \min(X, u)\). More generally, the \(k\)th moment of the limited rv is:

\[ E\left[(X \wedge u)^k\right] = k\int_0^u x^{k-1}\bar{F}(x)\, dx \]

### 4.3 Constructing New Distributions

New distributions can be constructed from existing ones via:

- **Scaling:** if \(X \sim \text{EXP}(\theta)\) then \(cX \sim \text{EXP}(c\theta)\) (exponential is a **scale distribution**)
- **Power transformations:** if \(Y = X^{1/\tau}\), the resulting distribution has a modified shape
- **Lognormal:** if \(X \sim N(\mu, \sigma^2)\), then \(Y = e^X \sim \text{LOGN}(\mu, \sigma)\)

### 4.4 Policy Adjustments

Three standard adjustments affect the payment amount:

- **Ordinary deductible** \(d\): insurer pays \((X - d)_+\)
- **Policy limit** \(u\): insurer pays at most \(u\)
- **Coinsurance factor** \(\alpha \in (0,1]\): insurer pays fraction \(\alpha\) of each dollar

The **amount paid per loss** under all three adjustments is:

\[ Y^L = \alpha\left[(X \wedge u) - d\right]_+ \]

The **amount paid per payment** (conditional on a non-zero payment) is:

\[ Y^P = Y^L \mid Y^L > 0 \]

**Proposition 32.** The cdf of \(Y^P\) is:

\[ F_{Y^P}(y) = \frac{F\!\left(\frac{y}{\alpha} + d\right) - F(d)}{1 - F(d)}, \quad 0 \leq y < \alpha(u-d) \]

and the expected amount paid per payment satisfies:

\[ E[Y^P] = \frac{E[Y^L]}{1 - F(d)} \]

**Proposition 33.** For a nonnegative rv \(Y\) with survival function \(\bar{F}_Y\):

\[ E[Y] = \int_0^\infty \bar{F}_Y(y)\, dy \]

#### Loss Elimination Ratio

The **loss elimination ratio (LER)** measures the proportion of expected loss eliminated by policy adjustments:

\[ \text{LER} = 1 - \frac{E[Y^L]}{E[X]} \]

For a policy with only an ordinary deductible \(d\): \(\text{LER} = \frac{E[X \wedge d]}{E[X]}\).

**Example 37.** For \(X \sim \text{PAR}(2, 1000)\) with \(\bar{F}(x) = \left(\frac{1000}{x+1000}\right)^2\), setting \(\text{LER} = 0.2\) gives \(\frac{d}{d+1000} = 0.2\), so \(d = 250\).

### 4.5 Estimation of Severity Distributions

Estimating parameters for the ground-up loss \(X\) is complicated because the insurer's data is **truncated from below** (losses below \(d\) are not reported) and **censored from above** (losses above \(u\) are recorded only as the maximum payment).

The likelihood contribution for each observation is:

- **Non-maximum payments** \(y \in (0, \alpha(u-d))\): \(\frac{\frac{1}{\alpha} f\!\left(\frac{y}{\alpha} + d\right)}{1 - F(d)}\)
- **Maximum payment** \(y = \alpha(u-d)\): \(\frac{1 - F(u)}{1 - F(d)}\)

**Example 38.** Policy with limit 100, deductible 10, coinsurance 0.9. Payment data: 1.8, 15.3, 73.8, 81, 81 (where 81 is the maximum payment). For \(X \sim \text{EXP}(\theta)\), the MLE is \(\hat{\theta} = 281/3 \approx 93.67\).

For **grouped data** in payment intervals \((c_{i-1}, c_i]\) with counts \(n_i\):

\[ L = \prod_{i=1}^n \left[\frac{F\!\left(\frac{c_i}{\alpha} + d\right) - F\!\left(\frac{c_{i-1}}{\alpha} + d\right)}{1 - F(d)}\right]^{n_i} \]

**Example 39.** Policy limit 1100, deductible 100, coinsurance 80%. Payment intervals (0, 400], (400, 800], and maximum 800. For \(X \sim \text{EXP}(\theta)\), solving \(\frac{d\ell}{d\theta} = 0\) yields \(\hat{\theta} = \frac{500}{-\ln(2/3)} \approx 1233.15\).

---

## Chapter 5: Aggregate Loss/Payment Distributions

### 5.1 The Collective Risk Model

The **aggregate loss** is the compound rv:

\[ S = \begin{cases} \sum_{i=1}^N X_i, & N > 0, \\ 0, & N = 0, \end{cases} \]

where \(N\) is the frequency rv and \(X_i\) are iid severity rvs. Equivalently, the **aggregate payment** can be expressed as a compound rv using either (N, \(Y^L\) or (M, \(Y^P\) as the (primary, secondary) pair.

### 5.2 Distributional Properties

Treating \(S\) as a general compound rv with primary \(K\) (pgf \(C(z)\) and secondary \(Z\) (mgf \(\tilde{G}(t)\):

**CDF:**
\[ P(S \leq x) = c_0 + \sum_{k=1}^\infty c_k G^{*k}(x) \]

where \(G^{*k}(x) = P(Z_1 + \cdots + Z_k \leq x)\) is the \(k\)-fold convolution.

**MGF:**
\[ E\!\left[e^{tS}\right] = C\!\left(\tilde{G}(t)\right) \]

**Mean and variance:**
\[ E[S] = E[K]\,E[Z], \qquad \text{Var}(S) = E[K]\,\text{Var}(Z) + E[Z]^2\,\text{Var}(K) \]

**Example 40.** If \(Z \sim \text{EXP}(\theta)\), then \(G^{*k}\) is the cdf of an Erlang\((k, \theta)\) rv, allowing an explicit closed-form for \(P(S \leq x)\).

**Example 41.** For \(K \sim \text{GEO}(\beta)\) and \(Z \sim \text{EXP}(\theta)\), the mgf of \(S\) simplifies to \(\frac{1 - \theta t}{1 - (1+\beta)\theta t}\), which corresponds to a **mixed rv** with probability mass \(\frac{1}{1+\beta}\) at 0 and exponential density with rate \(\frac{1}{(1+\beta)\theta}\) for \(x > 0\). The cdf is:

\[ P(S \leq s) = 1 - \frac{\beta}{1+\beta} e^{-\frac{s}{(1+\beta)\theta}}, \quad s \geq 0 \]

### 5.3 Approximation Methods

In general, closed-form expressions for \(P(S \leq x)\) are rare. Two approximation methods are widely used.

#### 5.3.1 Normal Approximation

Approximate \(\frac{S - E[S]}{\sqrt{\text{Var}(S)}} \approx N(0,1)\), so:

\[ P(S \leq s) \approx \Phi\!\left(\frac{s - E[S]}{\sqrt{\text{Var}(S)}}\right) \]

This approximation is good when \(\lambda\) is large (Poisson), \(m\) is large (Binomial), or \(r\) is large (Negative Binomial). **Caution:** the normal approximation may underestimate the right tail of \(S\), which is dangerous from a risk management standpoint.

**Example 42.** \(K \sim \text{POI}(50)\), \(Z \sim \text{EXP}(2)\). Then \(E[S] = 100\), \(\text{Var}(S) = 400\). The 95th percentile is approximately \(1.645\sqrt{400} + 100 = 132.9\).

#### 5.3.2 Method of Rounding (Discretization)

**Discretize** \(Z\) to a discrete rv \(Z^*\) on multiples of span \(h > 0\):

\[ g_0 = G\!\left(\frac{h}{2}\right), \qquad g_k = G\!\left(kh + \frac{h}{2}\right) - G\!\left(kh - \frac{h}{2}\right), \quad k \geq 1 \]

Then use Panjer's recursion on the discretized distribution to obtain the pmf of \(S^* \approx S\). The approximation improves as \(h \to 0\).

**Example 43.** \(K \sim \text{POI}(3)\), \(Z \sim \text{PAR}(4, 10)\), span \(h = 2.5\). The discretized probabilities are \(g_0 \approx 0.3757\), \(g_1 \approx 0.3445\), \(g_2 \approx 0.1364\). Panjer's recursion then gives \(P(S^* = 0) \approx 0.1537\), \(P(S^* = 2.5) \approx 0.1588\), \(P(S^* = 5) \approx 0.1450\).

For aggregate **payment** approximation, it is recommended to discretize \(Y^P\) rather than \(Y^L\) for better accuracy (Example 44).

### 5.4 Introduction to Reinsurance

**Reinsurance** is insurance purchased by an insurer (the **cedant**) from a reinsurer. Two common treaties:

- **Quota share:** reinsurer pays fraction \(\kappa\) of aggregate payment \(S\); premium is \((1+\theta)E[\kappa S]\)
- **Stop-loss:** insurer pays \(\min(S, \xi)\); reinsurer pays \((S - \xi)_+\), effectively capping the insurer's liability

The **net stop-loss premium** (expected reinsurer payment) is:

\[ E[I_\xi] = E[(S-\xi)_+] = \int_\xi^\infty P(S > x)\, dx \]

For integer-valued \(S\), the stop-loss premium satisfies the recursion:

\[ E[I_{\xi+1}] = E[I_\xi] - P(S > \xi), \quad \xi \in \mathbb{N} \]

with starting point \(E[I_0] = E[S]\).

**Example 45.** \(S\) compound Poisson with \(\lambda = 2.5\), \(g_1 = 0.8\), \(g_2 = 0.2\). Then \(E[S] = 3\), \(P(S = 0) = e^{-2.5}\), \(P(S = 1) = 2.5(0.8)e^{-2.5} \approx 0.1642\). Applying the recursion:

\[ E[I_2] \approx 3 - (1 - e^{-2.5}) - 0.1642 \approx 1.3284 \]

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
| **Volume-weighted average** | Sum of DY\((i+1)\) entries divided by sum of DY\(i\) entries across all AYs |

**Step 4.** Project each incomplete AY's cumulative payments forward by multiplying by the selected development factors.

**Step 5.** The **IBNR (Incurred But Not Reported) reserve** for each AY is:

\[ \text{Reserve}_{AY} = \text{Projected Ultimate} - \text{Current Cumulative} \]

**Example 46.** (Numerical example with full development triangle and three averaging methods, leading to projected ultimates and IBNR reserves for each accident year.)

### 6.3 Expected Loss Ratio Method

The **expected loss ratio (ELR) method** projects the ultimate loss using an a priori expected loss ratio:

\[ \text{Ultimate Loss}_{AY} = \text{Earned Premium}_{AY} \times \text{ELR} \]

The reserve for each AY is the projected ultimate minus current cumulative payments. This method is most useful for immature accident years where there is little development history.

### 6.4 Bornhuetter-Ferguson Method

The **Bornhuetter-Ferguson (BF) method** blends the chain-ladder and expected loss ratio methods. It is particularly useful for immature accident years where the chain-ladder may over-react to sparse early data.

For accident year \(i\) currently at development year \(j\):

\[ \text{Ultimate}_{i} = C_{ij} + (1 - 1/f_j) \times \text{Expected Ultimate}_{i} \]

where:
- \(C_{ij}\) is the current cumulative paid loss
- \(f_j\) is the **tail factor** (product of all remaining development factors from DY\(j\) to ultimate)
- \((1 - 1/f_j)\) is the **percent unreported** (the fraction of ultimate losses yet to emerge)
- Expected Ultimate = Earned Premium × ELR

The BF reserve for AY \(i\) is:

\[ \text{Reserve}_{i} = (1 - 1/f_j) \times \text{Expected Ultimate}_{i} \]

This interpretation is intuitive: the reserve equals the expected unreported losses, where "unreported" is estimated from the tail factor rather than from actual data.

**Example 48/49.** Given a development triangle and ELR, the BF method produces ultimate estimates that are a credibility-weighted blend of actual development (chain-ladder component) and expected losses (ELR component), with more weight on the expected losses for younger, less developed accident years.
