---
title: "ACTSC 432: Property and Casualty Insurance: Pricing"
prof: "Mirabelle Huynh"
subjects: "ACTSC"
---

## Sources and References

- **Primary textbook** — Klugman, S.A., Panjer, H.H., Willmot, G.E. *Loss Models: From Data to Decisions*, 5th ed., Wiley, 2019.
- **Supplementary texts** — Frees, E.W. *Regression Modeling with Actuarial and Financial Applications*, Cambridge University Press, 2010; Bühlmann, H., Gisler, A. *A Course in Credibility Theory and its Applications*, Springer, 2005; Ohlsson, E., Johansson, B. *Non-Life Insurance Pricing with Generalized Linear Models*, Springer, 2010.
- **Online resources** — SOA STAM and CAS MAS-II study materials; CAS Exam 5 syllabus; openacttexts.org GLM chapters by Frees; Wüthrich/Buser ETH Zürich lecture notes on data analytics for non-life insurance pricing.

# Chapter 1: Probability and Estimation Background

Property and casualty ratemaking rests on a handful of probabilistic tools that are worth revisiting with a pricing mindset. The central object is the aggregate loss produced by a policy over a fixed exposure period, which we shall treat as a random variable whose distribution depends on unknown parameters and possibly on an unobserved risk characteristic specific to the policyholder.

## Mixture Distributions

A random variable \(X\) is said to follow a mixture distribution whenever its density can be written as an average of component densities. In the discrete case,

\[
f_X(x) = \sum_{j=1}^{m} p_j f_j(x), \qquad \sum_j p_j = 1,
\]

and in the continuous case,

\[
f_X(x) = \int f(x \mid \theta) \, \pi(\theta) \, d\theta.
\]

Continuous mixtures are pervasive in ratemaking: the Poisson–Gamma mixture produces the negative binomial claim count distribution, and the exponential–inverse Gamma mixture yields a Pareto severity. Mixtures are the natural language for the statement "each policyholder draws its own risk parameter from a population distribution," which is precisely the credibility worldview developed in later chapters.

## Conditional Expectation and the Tower Property

If \(X\) and \(\Theta\) are jointly distributed, the conditional mean \(\mathbb{E}[X \mid \Theta]\) is itself a random variable and satisfies the tower property

\[
\mathbb{E}[X] = \mathbb{E}\bigl[\mathbb{E}[X \mid \Theta]\bigr].
\]

Variance decomposes analogously into the sum of the expected conditional variance and the variance of the conditional mean:

\[
\mathrm{Var}(X) = \mathbb{E}\bigl[\mathrm{Var}(X \mid \Theta)\bigr] + \mathrm{Var}\bigl(\mathbb{E}[X \mid \Theta]\bigr).
\]

The two summands are, respectively, the expected process variance (EPV) and the variance of the hypothetical means (VHM); both will become load-bearing quantities when we build credibility formulas.

<div class="definition">
<strong>Definition 1.1 (Hypothetical mean and process variance).</strong> <em>For a policyholder with risk parameter</em> \(\Theta = \theta\), <em>the hypothetical mean is</em> \(\mu(\theta) = \mathbb{E}[X \mid \Theta = \theta]\) <em>and the process variance is</em> \(v(\theta) = \mathrm{Var}(X \mid \Theta = \theta)\). <em>The collective premium is</em> \(\mu = \mathbb{E}[\mu(\Theta)]\).
</div>

## Maximum Likelihood and the Method of Moments

Given an i.i.d. sample \(X_1, \ldots, X_n\) from a parametric family \(f(\cdot; \boldsymbol\beta)\), the maximum likelihood estimator (MLE) \(\hat{\boldsymbol\beta}\) maximises the log-likelihood

\[
\ell(\boldsymbol\beta) = \sum_{i=1}^{n} \log f(X_i; \boldsymbol\beta).
\]

The method of moments instead equates empirical and theoretical moments \(\mathbb{E}[X^k] = \bar{X^k}\) for as many \(k\) as there are parameters. Method-of-moments estimators are easy to compute but are generally less efficient than MLE when the likelihood is tractable.

## Bayes Estimator under Squared-Error Loss

If \(\boldsymbol\beta\) is itself endowed with a prior \(\pi(\boldsymbol\beta)\), the posterior density given data \(\mathbf{x}\) is

\[
\pi(\boldsymbol\beta \mid \mathbf{x}) \propto \pi(\boldsymbol\beta) \prod_{i=1}^{n} f(x_i; \boldsymbol\beta).
\]

Under squared-error loss the Bayes estimator is the posterior mean \(\hat{\boldsymbol\beta}_{\mathrm{Bayes}} = \mathbb{E}[\boldsymbol\beta \mid \mathbf{x}]\). Conjugacy — the phenomenon whereby the posterior stays in the same family as the prior — makes this explicit for Poisson–Gamma, Normal–Normal, and Beta–Bernoulli pairings that recur throughout the course.

## Bias, Variance, and Mean Squared Error

The bias of an estimator \(\hat\theta\) of \(\theta\) is \(\mathrm{bias}(\hat\theta) = \mathbb{E}[\hat\theta] - \theta\), and the mean squared error (MSE) decomposes as

\[
\mathrm{MSE}(\hat\theta) = \mathrm{Var}(\hat\theta) + \bigl[\mathrm{bias}(\hat\theta)\bigr]^2.
\]

An estimator is asymptotically unbiased if \(\mathrm{bias}(\hat\theta) \to 0\) as \(n \to \infty\), and consistent if \(\hat\theta \xrightarrow{p} \theta\). Under regularity conditions the MLE is consistent, asymptotically normal, and attains the Cramér–Rao lower bound, all of which matter when we build Wald-style confidence intervals for GLM relativities.

<div class="example">
<strong>Example 1.1 (Poisson rate estimation).</strong> <em>Suppose</em> \(N_1, \ldots, N_n \stackrel{\text{i.i.d.}}{\sim} \mathrm{Poisson}(\lambda)\). <em>The MLE and the method-of-moments estimator both equal</em> \(\hat\lambda = \bar N\), <em>and its variance is</em> \(\lambda / n\). <em>Placing a</em> \(\mathrm{Gamma}(\alpha, \beta)\) <em>prior on</em> \(\lambda\) <em>gives posterior</em> \(\mathrm{Gamma}(\alpha + \sum N_i, \beta + n)\) <em>and Bayes estimator</em> \((\alpha + \sum N_i) / (\beta + n)\), <em>which is a weighted average of the prior mean</em> \(\alpha/\beta\) <em>and the sample mean</em> \(\bar N\).
</div>

# Chapter 2: Non-Life Insurance Pricing with Generalized Linear Models

Ratemaking in non-life insurance begins from a flat book of policies in which observable risk characteristics — age, territory, vehicle class, building construction — are expected to explain systematic differences in claim behaviour. The industry standard is to translate these characteristics into a small set of categorical **tariff factors** or **rating factors**, each level of which carries a multiplicative **relativity** that scales the base premium up or down.

## Multiplicative Tariff Structure

Let \(i\) index policies and \(k = 1, \ldots, K\) index rating factors. Writing \(l(i,k)\) for the level of factor \(k\) held by policy \(i\), the multiplicative tariff model is

\[
\mu_i = \mu_0 \prod_{k=1}^{K} r_{k, l(i,k)},
\]

where \(\mu_0\) is a base level and \(r_{k,\ell}\) is the relativity of level \(\ell\) of factor \(k\). Taking logs yields an additive linear predictor, which is exactly what a generalized linear model with a log link fits by maximum likelihood.

## The Exponential Dispersion Family

GLMs extend ordinary least squares in two ways: the response is allowed to come from a family richer than the Gaussian, and the linear predictor is connected to the mean through a known link function. The response family is an exponential dispersion family (EDF), with density

\[
f(y; \theta, \phi) = \exp\!\left(\frac{y\theta - b(\theta)}{\phi / w} + c(y, \phi, w)\right),
\]

where \(\theta\) is the canonical parameter, \(\phi\) the dispersion parameter, \(w\) a known prior weight, and \(b(\cdot)\), \(c(\cdot)\) family-specific functions. One verifies that \(\mathbb{E}[Y] = b'(\theta) = \mu\) and \(\mathrm{Var}(Y) = b''(\theta) \, \phi / w = V(\mu) \, \phi / w\), so the variance of a GLM response is a known function of its mean up to the dispersion.

Three members of the EDF drive almost all actuarial ratemaking work:

| Component | Distribution | Variance function \(V(\mu)\) | Typical link |
|-----------|--------------|------------------------------|--------------|
| Claim count | Poisson | \(\mu\) | \(\log\) |
| Severity (positive) | Gamma | \(\mu^2\) | \(\log\) (canonical is \(1/\mu\)) |
| Pure premium | Tweedie (compound Poisson–Gamma) | \(\mu^p\), \(1<p<2\) | \(\log\) |

The Tweedie distribution with power \(p \in (1,2)\) corresponds exactly to a compound Poisson sum of i.i.d. Gamma severities and places positive mass at zero, making it the natural single-model choice for pure premium.

## Link Function and Linear Predictor

A GLM fits

\[
g(\mu_i) = \eta_i = \mathbf{x}_i^{\top} \boldsymbol\beta,
\]

where \(\mathbf{x}_i\) encodes the rating factors (usually as dummy variables for factor levels) and \(g\) is the link. Taking \(g(\mu) = \log\mu\) makes the tariff exactly multiplicative: \(\mu_i = \exp(\mathbf{x}_i^{\top} \boldsymbol\beta)\), so \(\exp(\beta_{k,\ell})\) is directly the relativity of level \(\ell\) of factor \(k\).

<div class="definition">
<strong>Definition 2.1 (Canonical link).</strong> <em>The canonical link of an exponential dispersion family is the function</em> \(g^\ast\) <em>for which</em> \(\theta = g^\ast(\mu)\). <em>For the Poisson family</em> \(g^\ast(\mu) = \log\mu\); <em>for the Gamma family</em> \(g^\ast(\mu) = 1/\mu\). <em>Canonical links simplify the score equations but are not mandatory; the log link is preferred for Gamma severity models because it enforces the multiplicative tariff.</em>
</div>

## Frequency, Severity, and Pure Premium Models

Non-life pricing is commonly split into two pieces, each of which is estimated by its own GLM.

**Frequency model.** Let \(N_i\) be the number of claims on policy \(i\) with exposure \(e_i\) (in policy-years). Under a Poisson model,

\[
N_i \sim \mathrm{Poisson}(e_i \mu_i), \qquad \log(e_i \mu_i) = \log e_i + \mathbf{x}_i^{\top} \boldsymbol\beta,
\]

where the term \(\log e_i\) enters the linear predictor with coefficient fixed to one and is called an **offset**. The fitted \(\mu_i\) is the claim frequency per unit of exposure.

**Severity model.** Conditional on \(N_i = n\) claims, the average severity \(\bar Y_i\) is modelled as Gamma with mean \(\mu_i^{S}\) and a log link. Fitting is usually done with prior weights equal to the claim counts, which reflects the fact that averages over more claims are more informative.

**Pure premium model.** The pure premium \(P_i = (\text{total losses}_i) / e_i\) can be fit directly by a Tweedie GLM with log link, which bypasses the separate frequency/severity split. The final premium multiplies the pure premium by expense loadings and profit margins, but these happen downstream of the GLM.

## Estimation and Inference

The MLE for a GLM is found by solving the score equations

\[
\sum_i \frac{(y_i - \mu_i) x_{ij}}{V(\mu_i) \, g'(\mu_i)} = 0, \qquad j = 1, \ldots, p,
\]

which are nonlinear in \(\boldsymbol\beta\) and are solved by iteratively reweighted least squares (IRLS). At convergence the estimated information matrix gives asymptotic standard errors for \(\hat{\boldsymbol\beta}\), and Wald intervals for a relativity follow by exponentiating the interval for the corresponding coefficient.

## Goodness of Fit and Model Selection

Two omnibus measures of fit are routinely reported. The **scaled deviance** compares the fitted model to the saturated model and takes the form

\[
D^{\ast} = 2\bigl[\ell(\tilde{\boldsymbol\theta}) - \ell(\hat{\boldsymbol\theta})\bigr],
\]

where \(\tilde{\boldsymbol\theta}\) is the saturated-model MLE. For the Poisson family the deviance simplifies to

\[
D = 2 \sum_i \left[y_i \log\frac{y_i}{\hat\mu_i} - (y_i - \hat\mu_i)\right].
\]

The **Pearson chi-square statistic**

\[
X^2 = \sum_i \frac{(y_i - \hat\mu_i)^2}{V(\hat\mu_i)}
\]

estimates the dispersion \(\phi\) via \(\hat\phi = X^2 / (n - p)\). For nested models \(B \subset A\) with \(p_B\) and \(p_A\) parameters respectively, hierarchical model selection uses the **likelihood ratio test**,

\[
-2 \log \Lambda = 2(\ell_A - \ell_B) \ \ \dot\sim \ \ \chi^2_{p_A - p_B},
\]

so that a large test statistic rejects the reduced model in favour of the richer one. In R this is produced by `anova(fitB, fitA, test = "Chisq")` on two `glm` objects.

<div class="example">
<strong>Example 2.1 (Territory relativities).</strong> <em>A motor insurer fits a Poisson frequency GLM on a portfolio with three territories (urban, suburban, rural), using rural as the reference level and the log of earned car-years as an offset. The estimated coefficients for urban and suburban are</em> \(\hat\beta_{\mathrm{urban}} = 0.25\) <em>and</em> \(\hat\beta_{\mathrm{sub}} = 0.10\) <em>with base frequency</em> \(\hat\mu_0 = 0.08\). <em>The relativities are</em> \(e^{0.25} \approx 1.284\) <em>and</em> \(e^{0.10} \approx 1.105\), <em>so that an urban policyholder with base severity and a base pure premium of 600 dollars pays approximately</em> \(600 \times 1.284 = 770\) <em>dollars for the frequency piece. A subsequent likelihood ratio test against a null model with no territory effect returns</em> \(-2\log\Lambda = 42.3\) <em>on 2 degrees of freedom, strongly rejecting the hypothesis of no territorial differences.</em>
</div>

# Chapter 3: Bayesian and Credibility Premiums

Rating factors capture only observable heterogeneity. Two policyholders who look identical in the tariff may still differ in unobserved ways — driving style, maintenance habits, building occupancy patterns — and their individual claim histories carry information about those differences. Credibility theory is the framework for blending individual experience with collective averages in a statistically principled way.

## The Credibility Setup

Let \(\Theta\) be a random risk parameter drawn from a prior \(\pi\) and let \(X_1, \ldots, X_n \mid \Theta = \theta\) be i.i.d. with mean \(\mu(\theta)\) and variance \(v(\theta)\). The collective premium is the unconditional mean

\[
\mu = \mathbb{E}[\mu(\Theta)],
\]

the expected process variance is \(\mathrm{EPV} = \mathbb{E}[v(\Theta)]\), and the variance of the hypothetical means is \(\mathrm{VHM} = \mathrm{Var}(\mu(\Theta))\). By the variance decomposition of Chapter 1,

\[
\mathrm{Var}(X) = \mathrm{EPV} + \mathrm{VHM}.
\]

The quantity we really want to charge is the **individual premium** \(\mu(\Theta)\) of this specific policyholder — unobservable, because \(\Theta\) is unobservable — so we replace it with an estimator that uses the data the insurer actually sees.

## The Bayesian Premium

Under squared-error loss the best estimator of \(\mu(\Theta)\) given past experience \(\mathbf{X} = (X_1, \ldots, X_n)\) is

\[
P_{\mathrm{Bayes}} = \mathbb{E}\bigl[\mu(\Theta) \mid \mathbf{X}\bigr] = \int \mu(\theta) \, \pi(\theta \mid \mathbf{x}) \, d\theta.
\]

In conjugate settings this integral is computed in closed form.

<div class="theorem">
<strong>Theorem 3.1 (Poisson–Gamma conjugacy).</strong> <em>If</em> \(\Theta \sim \mathrm{Gamma}(\alpha, \beta)\) <em>(rate parametrization, so that</em> \(\mathbb{E}[\Theta] = \alpha/\beta\)<em>) and</em> \(X_i \mid \Theta \stackrel{\text{i.i.d.}}{\sim} \mathrm{Poisson}(\Theta)\), <em>then the posterior is</em> \(\mathrm{Gamma}(\alpha + \sum x_i, \beta + n)\) <em>and the Bayesian premium is</em>

\[
P_{\mathrm{Bayes}} = \frac{\alpha + \sum_{i=1}^{n} x_i}{\beta + n}.
\]
</div>

The Normal–Normal and Bernoulli–Beta conjugate pairs yield analogously tidy posterior means; the general pattern is that the posterior mean is a weighted average of the prior mean and the sample mean, with weights that depend on sample size.

## Bühlmann (Linear) Credibility

When conjugacy fails — or when only the first two moments of the model are trusted — one restricts attention to estimators that are linear in the observed claims. The **Bühlmann credibility premium** is the best linear estimator of \(\mu(\Theta)\) in mean square:

\[
P^{\mathrm{Bu}} = a_0 + \sum_{i=1}^{n} a_i X_i.
\]

Minimising \(\mathbb{E}[(\mu(\Theta) - P^{\mathrm{Bu}})^2]\) over \((a_0, a_1, \ldots, a_n)\) yields the celebrated form

\[
P^{\mathrm{Bu}} = Z \bar X + (1 - Z) \mu, \qquad Z = \frac{n}{n + k}, \qquad k = \frac{\mathrm{EPV}}{\mathrm{VHM}},
\]

a weighted average of the sample mean and the collective mean, with weight determined by how much process noise there is relative to between-risk variability. When \(k\) is small, process variance is small and the risks differ a lot, so the individual's own experience is believable and \(Z\) is close to 1; when \(k\) is large, the individual's experience is drowned out by process noise and we pool back to the collective.

<div class="theorem">
<strong>Theorem 3.2 (Bühlmann credibility).</strong> <em>Let</em> \(X_1, \ldots, X_n \mid \Theta\) <em>be i.i.d. with</em> \(\mathbb{E}[X_i \mid \Theta] = \mu(\Theta)\) <em>and</em> \(\mathrm{Var}(X_i \mid \Theta) = v(\Theta)\). <em>Define</em> \(\mu = \mathbb{E}[\mu(\Theta)]\), \(\mathrm{EPV} = \mathbb{E}[v(\Theta)]\), \(\mathrm{VHM} = \mathrm{Var}(\mu(\Theta))\). <em>Then the estimator that minimises the mean squared error of the form</em> \(a_0 + \sum a_i X_i\) <em>for</em> \(\mu(\Theta)\) <em>is the Bühlmann credibility premium</em>

\[
P^{\mathrm{Bu}} = Z \bar X + (1-Z) \mu, \qquad Z = \frac{n}{n + k}, \qquad k = \frac{\mathrm{EPV}}{\mathrm{VHM}}.
\]
</div>

## Exact Credibility

In a handful of special cases the Bayesian premium is already linear in \(\bar X\), so the Bayesian and Bühlmann premiums coincide. This phenomenon is called **exact credibility** and is observed for the Poisson–Gamma pair (claim counts), the Normal–Normal pair (Gaussian aggregate losses with a Gaussian prior on the mean), the Bernoulli–Beta pair (binary outcomes), and the exponential–inverse Gamma pair (exponential severities with an inverse-Gamma scale prior). In each case, the weights in the posterior mean are exactly \(Z\) and \(1-Z\) from the credibility formula, which provides a comforting consistency check.

<div class="example">
<strong>Example 3.1 (Exact credibility with claim counts).</strong> <em>A workers' compensation block of 200 insured firms has reported collective claim frequencies consistent with a Gamma prior</em> \(\mathrm{Gamma}(4, 100)\) <em>on the per-firm Poisson rate, so</em> \(\mu = 0.04\). <em>One firm shows</em> \(\sum X_i = 6\) <em>claims over</em> \(n = 3\) <em>years. The posterior is</em> \(\mathrm{Gamma}(10, 103)\), <em>giving a Bayes premium of</em> \(10/103 \approx 0.0971\) <em>claims per year. The Bühlmann calculation gives</em> \(\mathrm{EPV} = \mathbb{E}[\Theta] = 0.04\), \(\mathrm{VHM} = \mathrm{Var}(\Theta) = 4/10000 = 4 \times 10^{-4}\), \(k = 100\), \(Z = 3/103 \approx 0.0291\), <em>and</em> \(P^{\mathrm{Bu}} = 0.0291 \times 2 + 0.9709 \times 0.04 \approx 0.0971\), <em>matching the Bayes answer exactly. Applied to an exposure that earns base pure premium of 5000 dollars, the firm's credibility-adjusted pure premium is about</em> \(5000 \times 0.0971 / 0.04 \approx 12{,}140\) <em>dollars.</em>
</div>

# Chapter 4: Bühlmann–Straub and Empirical Bayes

Real insurance portfolios rarely consist of policyholders with equal exposure, and credibility formulas should reward a firm that has been observed for longer or over a bigger book. The Bühlmann–Straub model handles this natively.

## The Bühlmann–Straub Model

For each of \(r\) policyholders \(i = 1, \ldots, r\) observed over years \(j = 1, \ldots, n_i\), let \(X_{ij}\) denote the average claim amount per unit of exposure and \(m_{ij}\) the exposure. Conditional on \(\Theta_i\),

\[
\mathbb{E}[X_{ij} \mid \Theta_i] = \mu(\Theta_i), \qquad \mathrm{Var}(X_{ij} \mid \Theta_i) = \frac{v(\Theta_i)}{m_{ij}},
\]

which is the natural scaling of process variance when \(X_{ij}\) is an average over \(m_{ij}\) i.i.d. observations. Defining total exposure \(m_i = \sum_j m_{ij}\) and the weighted individual mean

\[
\bar X_i = \frac{1}{m_i} \sum_{j} m_{ij} X_{ij},
\]

the Bühlmann–Straub credibility premium for policyholder \(i\) is

\[
P_i^{\mathrm{BS}} = Z_i \bar X_i + (1 - Z_i) \mu, \qquad Z_i = \frac{m_i}{m_i + k}, \qquad k = \frac{\mathrm{EPV}}{\mathrm{VHM}}.
\]

The factor \(Z_i\) now depends on the individual's total exposure, not on a shared sample size, so a large policyholder is naturally credited more weight than a small one.

## Non-Parametric Empirical Bayes Estimation

So far we have pretended that \(\mu\), EPV, and VHM are known. In practice they must be estimated from the same data used to compute credibility premiums, which is the **empirical Bayes** programme. In the non-parametric Bühlmann–Straub estimators,

\[
\hat\mu = \frac{\sum_i m_i \bar X_i}{\sum_i m_i},
\]

the expected process variance is estimated by pooling within-firm sample variances,

\[
\widehat{\mathrm{EPV}} = \frac{\sum_i \sum_j m_{ij}(X_{ij} - \bar X_i)^2}{\sum_i (n_i - 1)},
\]

and the variance of hypothetical means by subtracting the within-firm noise from the between-firm variance,

\[
\widehat{\mathrm{VHM}} = \frac{\sum_i m_i (\bar X_i - \hat\mu)^2 - (r - 1)\widehat{\mathrm{EPV}}}{m_{\bullet} - m_{\bullet}^{-1} \sum_i m_i^2},
\]

where \(m_{\bullet} = \sum_i m_i\). In the classical Bühlmann setup (no exposure weighting) these reduce to the familiar within and between group mean squares. If \(\widehat{\mathrm{VHM}}\) turns out negative — possible because variance of hypothetical means is estimated by a difference of sums of squares — it is standard to truncate it at zero, which collapses all \(Z_i\) to zero and reverts to the collective premium.

## Semi-Parametric and Parametric Variants

If the conditional distribution family is known, one can often skip estimating EPV directly. For Poisson-distributed claim counts, \(v(\Theta) = \mu(\Theta)\), so \(\widehat{\mathrm{EPV}} = \hat\mu\); this is the **semi-parametric** estimator, and it is typically more efficient when the Poisson assumption is reasonable. If both the conditional distribution and the prior family are specified (say Poisson conditional on a Gamma prior), one can fit the prior hyperparameters by maximum likelihood on the marginal distribution — this is the **parametric empirical Bayes** approach and connects credibility to mixed-effects GLMs.

<div class="definition">
<strong>Definition 4.1 (Empirical Bayes).</strong> <em>An empirical Bayes procedure replaces the prior parameters in a Bayesian or credibility premium by estimators computed from the data, typically under one of three regimes:</em>
<em>non-parametric (estimate</em> \(\mu\), <em>EPV, VHM from sample moments only),</em>
<em>semi-parametric (assume the conditional distribution family, e.g. Poisson, and use its moment constraints), and</em>
<em>parametric (assume both conditional and prior families, and estimate their parameters).</em>
</div>

## Limited Fluctuation Credibility

A parallel, older tradition for credibility — still ubiquitous in US casualty ratemaking — is **limited fluctuation** (classical) credibility. Rather than minimising mean squared error, it asks: how much data do we need so that the observed mean lies within a relative tolerance \(r\) of the true mean with probability \(1 - \alpha\)?

Under the Normal approximation \(\sqrt{n}(\bar X - \mu)/\sigma \ \dot\sim \ N(0,1)\), the requirement \(\Pr(|\bar X - \mu| \leq r\mu) \geq 1 - \alpha\) rearranges to the **full credibility standard**

\[
n \geq \left(\frac{z_{\alpha/2}}{r}\right)^{2} \frac{\sigma^{2}}{\mu^{2}} = n_0 \cdot \mathrm{CV}^{2}, \qquad n_0 = \left(\frac{z_{\alpha/2}}{r}\right)^{2},
\]

where \(\mathrm{CV} = \sigma / \mu\) is the coefficient of variation. Typical choices are \(\alpha = 0.10\) and \(r = 0.05\), giving \(z_{0.05} \approx 1.645\) and \(n_0 \approx 1082\) — the familiar "1082 claim" full credibility standard for pure Poisson counts.

When the exposure does not reach the full credibility standard, partial credibility is assigned by the square-root rule

\[
Z = \min\!\left(1, \sqrt{\frac{n}{n_0}}\right),
\]

and the credibility-weighted estimator is again \(Z \bar X + (1-Z) \mu\). The limited fluctuation framework is simpler than Bühlmann–Straub but does not reward within-class heterogeneity: two books with identical exposures receive the same \(Z\) even if one is far more homogeneous than the other. Modern actuarial practice therefore tends to use Bühlmann–Straub for individual rate relativities and to keep the limited fluctuation standard for regulatory and reporting conventions.

<div class="example">
<strong>Example 4.1 (Bühlmann–Straub in a small commercial book).</strong> <em>Three firms report the following loss ratios and exposures (in units of 1000 dollars of payroll) over three policy years:</em>

| Firm | Year 1 loss ratio | Year 2 loss ratio | Year 3 loss ratio | Total exposure |
|------|-------------------|-------------------|-------------------|----------------|
| A    | 0.60              | 0.50              | 0.55              | 300            |
| B    | 0.80              | 0.90              | 0.85              | 150            |
| C    | 0.40              | 0.45              | 0.35              | 600            |

<em>Exposure-weighted collective mean</em> \(\hat\mu = 0.510\), <em>within-firm variance estimate</em> \(\widehat{\mathrm{EPV}} = 0.0021\), <em>between-firm variance estimate</em> \(\widehat{\mathrm{VHM}} = 0.0325\), <em>so</em> \(\hat k = 0.0646\) <em>and</em> \(Z_A \approx 0.9998\), \(Z_B \approx 0.9996\), \(Z_C \approx 0.9999\). <em>With such strong between-firm signal the credibility-weighted loss ratio for firm B stays near its own mean of 0.85, and multiplied by an exposure of 150 units this produces an expected loss of about</em> \(0.85 \times 150 \times 1000 = 127{,}500\) <em>dollars. Had the between-firm variance been much smaller, say</em> \(\widehat{\mathrm{VHM}} = 0.0005\), <em>then</em> \(\hat k = 4.2\) <em>and</em> \(Z_B = 150/154.2 \approx 0.973\), <em>shifting firm B's rate marginally towards the collective mean and lowering the expected loss accordingly.</em>
</div>

Credibility in non-life pricing is therefore best understood as a two-layer construction. The GLM of Chapter 2 delivers the base rate and the observable relativities on a large, homogeneous data set, treating the portfolio as a cross-section. On top of that base, the Bühlmann–Straub machinery layers experience rating that reflects each policyholder's own history relative to the portfolio average, using the empirical Bayes estimates of EPV and VHM to decide how much weight to put on each individual story. The blend captures both the statistical regularity of the portfolio and the idiosyncrasies of the insured, which is precisely the balance that property and casualty ratemaking demands.
