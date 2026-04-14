---
title: "ACTSC 431: Casualty and Health Insurance Mathematics 2"
prof: "Jun Cai"
subjects: "ACTSC"
---

This course develops the quantitative machinery that non-life (property and casualty) and health actuaries use to model, price, and transfer risk on portfolios of insurance contracts. Building on an introduction to loss distributions and credibility, the focus here is on **aggregate losses**, **reinsurance**, **simulation**, and **generalized linear models** for tariff pricing. The unifying theme is that individual claims are random in both their number and their size, and an insurer must understand the distribution of their sum — the aggregate loss — well enough to set premiums, buy reinsurance, monitor solvency, and price heterogeneous policies fairly.

## Sources and References

- **Primary textbook** — Klugman, S.A., Panjer, H.H., Willmot, G.E. *Loss Models: From Data to Decisions*, 5th ed., Wiley, 2019.
- **Supplementary texts** — Frees, E.W. *Regression Modeling with Actuarial and Financial Applications*, Cambridge University Press, 2010; Kaas, R., Goovaerts, M., Dhaene, J., Denuit, M. *Modern Actuarial Risk Theory*, 2nd ed., Springer, 2008; Wüthrich, M.V., Buser, C. *Data Analytics for Non-Life Insurance Pricing* (Lecture Notes, ETH Zürich).
- **Online resources** — SOA STAM and CAS MAS-I study materials; Frees actuarial textbook chapters at openacttexts.org; CAS Exam 5 syllabus and study notes.

# Chapter 1: Loss Random Variables and Compound Frequency

Non-life insurance modelling begins with a set of transformations of a ground-up loss random variable \(X\ge 0\). These transformations encode the effect of contractual features such as deductibles, policy limits, and coinsurance, and they also arise naturally when one studies reinsurance layers. Three loss transforms are fundamental.

## 1.1 Excess, Limited, and Stop-Loss Variables

The **excess loss variable** at threshold \(d\) is

\[
(X - d)_+ = \max(X - d, 0),
\]

which equals zero whenever \(X \le d\) and equals the overshoot otherwise. The **limited loss variable** at cap \(u\) is

\[
X \wedge u = \min(X, u),
\]

representing the loss capped at \(u\). The identity \(X = (X \wedge u) + (X - u)_+\) makes clear that ground-up loss decomposes cleanly into a capped part and an excess layer.

The **stop-loss premium** (or mean excess) at \(d\) is the expectation of the excess variable,

\[
\mathbb{E}[(X - d)_+] = \int_d^\infty \bigl(1 - F_X(x)\bigr)\,dx,
\]

and the **limited expected value** satisfies the dual representation

\[
\mathbb{E}[X \wedge u] = \int_0^u \bigl(1 - F_X(x)\bigr)\,dx.
\]

Combining the two, the expected loss in a layer \((d, u]\) is \(\mathbb{E}[X \wedge u] - \mathbb{E}[X \wedge d]\), a formula that underpins layer-based reinsurance pricing in Chapter 3.

<div class="definition">
<strong>Definition 1.1 (Layer)</strong>. A <em>layer</em> of width \(u-d\) attaching at \(d\) is the random variable
\[
L_{d,u}(X) = (X \wedge u) - (X \wedge d) = \min\bigl((X-d)_+, u-d\bigr).
\]
Its expectation equals the difference of two limited expected values and is a key building block of non-proportional reinsurance.
</div>

## 1.2 Mixture Distributions

Real portfolios are heterogeneous — policyholders differ in risk class, vehicle type, age, occupation. A **k-point mixture** models ground-up loss as

\[
F_X(x) = \sum_{i=1}^k w_i\, F_i(x), \qquad w_i \ge 0,\ \sum_i w_i = 1.
\]

Equivalently, draw a latent class \(I\in\{1,\dots,k\}\) with \(\Pr(I=i)=w_i\) and then sample \(X\mid I=i \sim F_i\). Moments of mixtures are weighted averages of component moments, but **variances are not**: the law of total variance gives \(\mathrm{Var}(X) = \mathbb{E}[\mathrm{Var}(X\mid I)] + \mathrm{Var}(\mathbb{E}[X\mid I])\), so mixing always adds parameter uncertainty to process variance. Mixtures with component lognormals or gammas are standard workhorses for heavy-tailed severity modelling.

## 1.3 Compound Frequency Models

Sometimes the count of claims itself is naturally a sum of counts from independent sub-portfolios or a two-stage process (number of accidents, then number of injuries per accident). A **compound frequency model** represents the total number of claims as

\[
N = M_1 + M_2 + \cdots + M_K,
\]

where \(K\) is a **primary** count (how many accidents) and each \(M_i\) is an independent copy of a **secondary** count (injuries per accident). The probability generating function factorises as \(P_N(z) = P_K(P_M(z))\), which yields the moments \(\mathbb{E}[N] = \mathbb{E}[K]\mathbb{E}[M]\) and \(\mathrm{Var}(N) = \mathbb{E}[K]\mathrm{Var}(M) + \mathrm{Var}(K)\mathbb{E}[M]^2\).

## 1.4 The (a, b, 0) Class and Panjer's Recursion

A remarkable fact that makes compound models computationally tractable is that the three most common counting distributions — **Poisson**, **binomial**, and **negative binomial** — all satisfy a two-term recursion on their probabilities:

\[
p_k = \left(a + \frac{b}{k}\right) p_{k-1}, \qquad k=1,2,\dots
\]

This is the **(a, b, 0) class**. For Poisson\((\lambda)\), \((a,b) = (0,\lambda)\); for negative binomial with parameters \(r,\beta\), \((a,b) = (\beta/(1+\beta), (r-1)\beta/(1+\beta))\); for binomial \((m,q)\), \((a,b) = (-q/(1-q), (m+1)q/(1-q))\). The recursion not only computes the count probabilities themselves but also drives **Panjer's recursion** for compound distributions — the key algorithmic tool of Chapter 2.

<div class="example">
<strong>Example 1.1</strong>. Suppose claim counts are Poisson with \(\lambda = 3\). Then \(p_0 = e^{-3}\approx 0.0498\), and since \(a = 0,\, b = 3\), we get \(p_1 = (0 + 3/1)p_0 = 0.1494\), \(p_2 = (0 + 3/2)p_1 = 0.2240\), \(p_3 = (3/3)p_2 = 0.2240\), \(p_4 = (3/4)p_3 = 0.1680\). The expected count is 3 and the variance is also 3, as required for a Poisson.
</div>

# Chapter 2: Aggregate Loss Models

Having described counts and severities separately, we now study the aggregate loss \(S\) — the random variable that drives premiums, reserves, and capital.

## 2.1 Individual vs Collective Risk Models

The **individual risk model** fixes the portfolio size \(n\) and writes

\[
S = X_1 + X_2 + \cdots + X_n,
\]

where \(X_i\) is the (possibly zero) payment on policy \(i\). Each \(X_i\) may follow a different distribution — often a mixture of a point mass at zero (no claim) and a continuous severity conditional on a claim. This model is natural for group life and short-term health where the policy count is known and each contract contributes independently.

The **collective risk model** treats the number of claims itself as random. Let \(N\) be an integer-valued random variable independent of an i.i.d. sequence of severities \(X_1, X_2, \dots\) with common distribution \(F_X\), and define

\[
S = \sum_{i=1}^N X_i,
\]

with the convention \(S=0\) when \(N=0\). This is the dominant framework for property and casualty portfolios because it naturally separates **frequency** (claim counts) from **severity** (claim sizes), which often depend on different covariates and can be modelled in isolation.

## 2.2 Moments of the Compound Distribution

Conditioning on \(N\) and using the tower property yields

\[
\mathbb{E}[S] = \mathbb{E}[N]\,\mathbb{E}[X], \qquad \mathrm{Var}(S) = \mathbb{E}[N]\,\mathrm{Var}(X) + (\mathbb{E}[X])^2\,\mathrm{Var}(N).
\]

The first term is **process variance** (randomness within a known claim count), the second is **parameter variance** (randomness in the count itself). The moment generating function is \(M_S(t) = P_N(M_X(t))\), a compact way of recording how much information the MGF of \(S\) contains.

The **compound Poisson** case is particularly clean: when \(N\sim\mathrm{Poisson}(\lambda)\), we have \(\mathrm{Var}(N)=\mathbb{E}[N]=\lambda\), so \(\mathrm{Var}(S) = \lambda\,\mathbb{E}[X^2]\). A crucial closure property is that the sum of independent compound Poisson variables is compound Poisson with rate equal to the sum of rates and severity equal to the mixture of severities weighted by rates. This lets insurers combine sub-portfolios while retaining analytical tractability.

<div class="theorem">
<strong>Theorem 2.1 (Additivity of compound Poissons)</strong>. If \(S_1, \dots, S_m\) are independent compound Poisson variables with parameters \((\lambda_i, F_i)\), then \(S = \sum_i S_i\) is compound Poisson with \(\lambda = \sum_i \lambda_i\) and severity distribution \(F = \sum_i (\lambda_i/\lambda)\,F_i\), a rate-weighted mixture.
</div>

## 2.3 Policy Modifications

Deductibles, limits, and coinsurance reshape the payment per loss. Let \(d\) be an ordinary deductible, \(u\) a maximum covered loss, and \(\alpha\in(0,1]\) a coinsurance factor. The **payment per loss** is

\[
Y^L = \alpha\,\bigl((X\wedge u) - (X\wedge d)\bigr),
\]

which is zero when \(X<d\) and capped at \(\alpha(u-d)\). The **payment per payment** is the conditional version \(Y^P = Y^L \mid X > d\). Crucially, imposing a deductible doesn't just reduce expected payments; it also reduces the **frequency** of non-zero payments, because some losses fall under \(d\). If ground-up claim count is \(N\), the number of claims above the deductible has survival probability \(v = \Pr(X > d)\) and the new frequency is an \(N\)-thinned distribution — still Poisson\((\lambda v)\) for compound Poisson portfolios, still binomial/negative binomial after appropriate parameter changes for binomial/NegBin frequencies.

## 2.4 Computing and Approximating \(F_S\)

The **Panjer recursion** computes the distribution of a discrete compound \(S\) exactly when \(N\) lies in the (a,b,0) class and \(X\) takes values on a lattice \(\{0,h,2h,\dots\}\) with masses \(f_j\). The recursion is

\[
g_s = \frac{1}{1 - a\,f_0}\sum_{j=1}^{s}\left(a + \frac{b\,j}{s}\right)\,f_j\,g_{s-j}, \qquad s\ge 1,
\]

with starting value \(g_0 = P_N(f_0)\) (for Poisson, \(g_0 = e^{-\lambda(1-f_0)}\)). For continuous severities one first **discretises** them by the method of rounding or local moment matching, then applies the recursion.

When exact computation is unnecessary, three approximations are common. The **normal approximation** treats \(S\) as \(\mathcal{N}(\mu_S, \sigma_S^2)\), which is adequate only when \(N\) is large and severities are light-tailed. The **translated gamma** matches the first three moments to a shifted gamma distribution, correcting skewness. The **normal power (NP2)** expansion adds a cubic correction term in the standardised variable to match skewness without changing the support.

<div class="example">
<strong>Example 2.1</strong>. A portfolio has claim frequency \(N\sim\mathrm{Poisson}(\lambda=100)\) and claim severity \(X\) with mean 2000 dollars and standard deviation 3000 dollars. Then \(\mathbb{E}[S] = 200{,}000\) dollars and \(\mathrm{Var}(S) = 100\cdot(3000^2 + 2000^2) = 1.3\times 10^9\) (in dollars squared), so the standard deviation of \(S\) is about 36,056 dollars. Under a normal approximation, the 99th percentile of aggregate loss is roughly \(200{,}000 + 2.326\cdot 36{,}056 \approx 283{,}867\) dollars, which the insurer might use as a target for required capital.
</div>

# Chapter 3: Reinsurance

Reinsurance transfers part of the aggregate or individual-claim risk from the **cedent** (primary insurer) to a **reinsurer**, in exchange for a premium. From the cedent's viewpoint, reinsurance is a tool for managing tail risk, stabilising results, freeing capital, and purchasing catastrophe protection. From a mathematical viewpoint, reinsurance contracts are functionals of either individual claims \(X\) or the aggregate \(S\).

## 3.1 Premium Principles

The **pure premium** of a ceded risk \(X^{\mathrm{re}}\) is its expectation, \(P_0 = \mathbb{E}[X^{\mathrm{re}}]\). Real reinsurance premiums include a **risk loading** that compensates the reinsurer for uncertainty and cost of capital. Four standard loadings are

- **Expected value principle**: \(P = (1+\theta)\,\mathbb{E}[X^{\mathrm{re}}]\),
- **Variance principle**: \(P = \mathbb{E}[X^{\mathrm{re}}] + \alpha\,\mathrm{Var}(X^{\mathrm{re}})\),
- **Standard deviation principle**: \(P = \mathbb{E}[X^{\mathrm{re}}] + \beta\,\sqrt{\mathrm{Var}(X^{\mathrm{re}})}\),
- **Exponential principle**: \(P = \frac{1}{a}\log \mathbb{E}[e^{a X^{\mathrm{re}}}]\).

Only the exponential principle is consistent with an expected utility framework (exponential utility) and only it preserves additivity under independence without being linear in the claim amount.

## 3.2 Proportional Reinsurance

**Quota share** (QS) with retention \(\alpha\in[0,1]\) cedes the same fraction \(1-\alpha\) of every loss. The cedent keeps \(X^{\mathrm{ce}} = \alpha X\) and the reinsurer receives \(X^{\mathrm{re}} = (1-\alpha)X\). Because the operation is linear, the shape of the distribution is unchanged — if \(X\) is lognormal or Pareto, so is \(\alpha X\) (up to a scale parameter). QS is easy to administer but does little to flatten extreme losses.

**Surplus share** applies quota share on a policy-by-policy basis where the retention percentage depends on the size of the individual risk. A cedent specifies a **retention line** \(R\) and cedes a fraction \(1 - R/S_i\) of policy \(i\) whenever the sum insured \(S_i\) exceeds \(R\), retaining 100% otherwise. It concentrates the cedent's exposure on smaller, more predictable policies.

## 3.3 Non-Proportional Reinsurance

**Excess-of-loss (XL)** reinsurance applies to each individual claim. For retention \(R\), the reinsurer pays \((X - R)_+\), capped at a cover \(C\) so the reinsurer pays \(\min((X-R)_+, C)\). This is precisely a layer \(L_{R,R+C}(X)\). XL is the most common non-proportional structure and is the natural tool for protecting against large individual claims (e.g., liability losses).

**Stop-loss** reinsurance applies on the **aggregate**. The reinsurer pays \((S - L)_+\) when the portfolio's total loss exceeds attachment point \(L\). The pure stop-loss premium is \(\mathbb{E}[(S-L)_+]\); evaluating it requires either the exact distribution of \(S\) (via Panjer recursion) or an approximation. Stop-loss protects the cedent's annual bottom line and is standard for agricultural, catastrophe, and self-insured group health schemes.

<div class="theorem">
<strong>Theorem 3.1 (Variance-optimality of stop-loss)</strong>. Among all reinsurance contracts with a fixed pure premium \(P_0\) that depend only on the aggregate loss \(S\), the stop-loss contract minimises the variance of the retained aggregate \(S - (S-L)_+\). Intuitively, stop-loss cedes exactly the top slice of the distribution, where the variance contribution is highest.
</div>

## 3.4 Choosing a Retention

The cedent selects retention levels by trading off expected retained loss, variance of retained loss, and the cost of reinsurance. Common objective functions are minimising ruin probability subject to a premium budget, or maximising expected utility \(\mathbb{E}[u(w_0 - S^{\mathrm{ce}} - P_{\mathrm{re}})]\) for concave \(u\). Under exponential utility, the optimal individual-claim rule is a deductible rule (XL), matching the theorem above at the claim level.

# Chapter 4: Simulation

When analytic or recursive methods are infeasible — because severities are continuous, covariates are complex, or contracts are path-dependent — **Monte Carlo simulation** provides a flexible fallback. The basic idea is to draw many independent realisations of the loss model, compute the quantity of interest on each, and average.

## 4.1 Inverse-Transform and Acceptance-Rejection

Given a pseudo-random uniform \(U\sim\mathrm{Unif}(0,1)\), the **inverse-transform method** produces \(X = F_X^{-1}(U)\) from any target distribution whose CDF can be inverted. For an exponential with rate \(\lambda\), \(X = -\log(1-U)/\lambda\); for a Pareto with shape \(\alpha\) and scale \(\theta\), \(X = \theta\bigl((1-U)^{-1/\alpha} - 1\bigr)\); for a continuous uniform on \([a,b]\), \(X = a + (b-a)U\).

When \(F^{-1}\) is not available in closed form, **acceptance-rejection** draws a candidate \(Y\sim g\) from an easy-to-sample proposal, accepts it with probability \(f(Y)/(c\,g(Y))\), and retries otherwise. The constant \(c\ge\sup f/g\) is the envelope ratio; smaller \(c\) means higher acceptance rate. This method generates gamma variates with non-integer shape, beta variates, and many others.

Discrete distributions can be simulated by inversion of the CDF, or, for the Poisson, by summing exponential inter-arrival times until the sum exceeds 1. The negative binomial is naturally simulated as a Poisson-gamma mixture: draw \(\Lambda\sim\mathrm{Gamma}(r, \beta)\), then \(N\mid\Lambda\sim\mathrm{Poisson}(\Lambda)\).

## 4.2 Estimating Quantities and MC Error

Given \(n\) independent realisations \(\{S^{(j)}\}_{j=1}^n\) of aggregate loss, the sample mean \(\bar S_n\) estimates \(\mathbb{E}[S]\), and the central limit theorem gives a Monte Carlo standard error

\[
\mathrm{SE}(\bar S_n) = \frac{\hat\sigma_S}{\sqrt n},
\]

so halving the error requires quadrupling the sample size. Quantile estimation (e.g., 99.5% VaR for Solvency II) uses the empirical quantile, whose variance can be large in the tail — variance reduction techniques are therefore especially valuable here.

## 4.3 Variance Reduction

Three standard techniques reduce MC error without increasing sample size. **Antithetic variates** pair each uniform \(U\) with \(1-U\), exploiting negative correlation. **Control variates** subtract an adjustment based on a correlated auxiliary variable whose mean is known exactly. **Importance sampling** draws from a distribution tilted toward the tail and reweights, which is crucial for estimating small probabilities of extreme losses.

<div class="example">
<strong>Example 4.1</strong>. To price a stop-loss treaty with attachment 500,000 dollars on a compound Poisson portfolio, simulate 100,000 independent realisations of \(S\). On each trajectory compute \((S - 500{,}000)_+\), then take the sample mean. If the sample mean is 28,400 dollars with sample standard deviation 62,000 dollars, the Monte Carlo standard error is \(62{,}000/\sqrt{100{,}000}\approx 196\) dollars, so a 95% confidence interval for the pure premium is roughly 28,400 plus or minus 384 dollars.
</div>

# Chapter 5: GLMs for Insurance Pricing

Real tariffs must differentiate policyholders by age, location, vehicle class, claim history, and many other covariates. The industry-standard tool is the **generalized linear model**, which extends linear regression to handle non-normal, non-negative, and heteroskedastic responses such as claim counts, claim amounts, and pure premiums.

## 5.1 Non-Life Pricing Structure

A multiplicative tariff expresses the expected pure premium for a policy with rating characteristics \((x_1, x_2, \dots, x_p)\) as

\[
\mu(\mathbf x) = b_0 \cdot \prod_{j=1}^p r_j(x_j),
\]

where \(b_0\) is a base premium and the \(r_j\) are **rating relativities**. Taking logs turns this into a linear model for \(\log\mu\), which motivates using a GLM with a logarithmic link function.

## 5.2 Exponential Dispersion Family

The responses tackled by GLMs belong to the **exponential dispersion family**, whose density (or mass function) has the form

\[
f(y;\theta,\phi) = \exp\!\left\{\frac{y\theta - b(\theta)}{\phi} + c(y,\phi)\right\},
\]

where \(\theta\) is the **canonical parameter**, \(\phi\) is the **dispersion parameter**, and \(b,c\) are known functions. The mean and variance are \(\mathbb{E}[Y] = b'(\theta) = \mu\) and \(\mathrm{Var}(Y) = \phi\,b''(\theta) = \phi\,V(\mu)\), where \(V(\mu) = b''(\theta(\mu))\) is the **variance function** — the signature that distinguishes family members.

Common members and their variance functions:

| Distribution | \(V(\mu)\) | Typical use |
|---|---|---|
| Normal | 1 | general continuous response |
| Poisson | \(\mu\) | claim counts, frequency |
| Gamma | \(\mu^2\) | claim sizes, severity |
| Inverse Gaussian | \(\mu^3\) | heavy-tailed severity |
| Tweedie | \(\mu^p,\ 1<p<2\) | pure premium (joint frequency-severity) |

## 5.3 Link Functions and Estimation

A GLM postulates a linear predictor \(\eta = X\beta\) and links it to the mean via a monotone smooth **link function**, \(g(\mu) = \eta\). The **canonical link** is \(g = (b')^{-1}\), which gives Normal-identity, Poisson-log, Gamma-reciprocal (although log is overwhelmingly preferred in practice for tariff work), and Binomial-logit. For insurance pricing the log link is standard because it renders the tariff multiplicative and keeps predicted means non-negative.

Parameters are estimated by **maximum likelihood**, implemented via **iteratively reweighted least squares (IRLS)**. Each iteration solves a weighted regression where the weights depend on the current mean and the variance function — which is why the variance function, rather than the full distribution, is what matters for consistent point estimation.

<div class="definition">
<strong>Definition 5.1 (Deviance)</strong>. The <em>deviance</em> of a fitted GLM is
\[
D = 2\sum_i\bigl\{y_i(\tilde\theta_i - \hat\theta_i) - b(\tilde\theta_i) + b(\hat\theta_i)\bigr\},
\]
where \(\tilde\theta_i\) parameterises the <em>saturated model</em> that fits each observation exactly and \(\hat\theta_i\) parameterises the fitted model. It is a likelihood-ratio statistic and plays the role the residual sum of squares plays in ordinary least squares.
</div>

## 5.4 Poisson, Gamma, and Tweedie Models

**Poisson regression** is the default for **claim frequency**: model the observed number of claims \(N_i\) for policy \(i\) as Poisson with mean \(e_i\,\mu_i\), where \(e_i\) is the **exposure** (duration in years) and \(\log\mu_i = \mathbf x_i^\top\beta\). Exposure enters as an offset \(\log e_i\) in the linear predictor. When empirical variance exceeds the mean — **overdispersion** — one uses a quasi-Poisson, a negative binomial GLM, or a mixed effects model.

**Gamma regression** with log link is standard for **severity**: conditional on a claim occurring, the cost \(Y_i\) has mean \(\mu_i\) satisfying \(\log\mu_i = \mathbf x_i^\top\gamma\) and variance \(\phi\mu_i^2\). The constant coefficient of variation is a reasonable empirical description of many casualty lines.

**Tweedie regression** with \(1<p<2\) directly models **pure premium** as a compound Poisson-gamma, absorbing zero claims into the continuous distribution's point mass at zero. It is a single-model shortcut that is convenient when there is no need to decompose into frequency and severity.

## 5.5 Tariff Analysis and Goodness of Fit

**Tariff analysis** converts the fitted coefficients into multiplicative rating factors. For a categorical variable coded with a reference level, the relativity for level \(k\) is \(\exp(\hat\beta_k)\), and the base premium absorbs the intercept, the offset for exposure, and the reference-level relativities. Because the model is multiplicative in \(\mu\), relativities can be read directly off the exponentiated coefficients, which is why the log link is favoured in practice even when it is not strictly canonical.

Goodness of fit uses the **scaled deviance** \(D/\phi\), which is asymptotically chi-square under the null that the fitted model is correct, or equivalently the **Pearson chi-square** \(\sum_i (y_i - \hat\mu_i)^2/V(\hat\mu_i)\). Both support likelihood-ratio tests between nested models, e.g., adding a new rating variable. Residual analysis uses **deviance residuals**, which play the role standardised residuals play in OLS, or **Pearson residuals** \((y_i - \hat\mu_i)/\sqrt{V(\hat\mu_i)}\). In practice actuaries also examine lift curves, Gini-like metrics, and out-of-sample loss ratios before accepting a tariff for production use.

<div class="example">
<strong>Example 5.1</strong>. Suppose a Poisson GLM with log link estimates the claim frequency of motor policies as \(\log\mu = -2.50 + 0.35\cdot\mathrm{urban} + 0.20\cdot\mathrm{young}\). The base rate is \(e^{-2.50}\approx 0.082\) claims per year, the urban relativity is \(e^{0.35}\approx 1.419\), and the young-driver relativity is \(e^{0.20}\approx 1.221\). A young urban driver therefore has expected frequency \(0.082\cdot 1.419\cdot 1.221\approx 0.142\) claims per year. If the Gamma severity model estimates an average severity of 4,500 dollars for that cell, the expected pure premium is \(0.142\cdot 4{,}500 \approx 640\) dollars per year, to which the insurer adds expenses, profit, and a risk margin before quoting.
</div>

## 5.6 From Model to Tariff

Building a production tariff is an iterative process. The actuary fits competing GLMs for frequency and severity, inspects coefficients for stability and sign consistency, groups rare levels of categorical variables to avoid over-parameterisation, validates on hold-out data and across accident years, reconciles model relativities with commercial judgment and regulatory constraints, and only then publishes the final multiplicative tariff. The GLM is a lens — not a verdict — but it provides the single most defensible statistical foundation for modern non-life pricing, which is why every actuarial exam syllabus and every working casualty actuary devotes substantial time to it.
