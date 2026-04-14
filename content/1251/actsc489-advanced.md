---
title: "ACTSC 489: Advanced Topics in Actuarial Science"
prof: "Angel Yang"
subjects: "ACTSC"
---

# Sources and References

- **Primary references** — Frees, E.W. *Regression Modeling with Actuarial and Financial Applications*, Cambridge University Press, 2010; Ohlsson, E., Johansson, B. *Non-Life Insurance Pricing with Generalized Linear Models*, Springer, 2010; Wüthrich, M.V., Buser, C. *Data Analytics for Non-Life Insurance Pricing* (Lecture Notes, ETH Zürich, 2023 vintage).
- **Supplementary texts** — Klugman, S.A., Panjer, H.H., Willmot, G.E. *Loss Models: From Data to Decisions*, 5th ed., Wiley, 2019; Werner, G., Modlin, C. *Basic Ratemaking*, Casualty Actuarial Society, 5th ed., 2016; James, Witten, Hastie, Tibshirani *An Introduction to Statistical Learning with R*, Springer.
- **Online resources** — openacttexts.org *Loss Data Analytics* by Frees et al.; CAS Exam 5 syllabus and notes; SOA Predictive Analytics & Futurism Section publications; R packages `insuranceData`, `CASdatasets`, `tweedie`, `mgcv`.

This set of notes treats predictive modelling for property and casualty (P&C) insurance pricing as a tightly integrated statistical and business problem. The through-line is a realistic case study: starting from raw policy and claim records, we clean, explore, and transform data; fit three generalized linear models (one each for claim frequency, claim severity, and pure premium); and assemble the fitted components into a multiplicative rating plan. Each chapter develops the theory, then revisits the case study to show how the ideas play out in practice.

# Chapter 1: Property & Casualty Insurance — Structure and Pricing

## Lines of Business

P&C insurance compensates policyholders for losses to property they own or for liabilities they owe to others. The personal lines dominate by policy count: private passenger automobile and homeowners. Commercial lines cover the property and liability exposures of businesses and institutions. A personal auto policy typically bundles third-party liability (bodily injury and property damage), collision, and comprehensive (fire, theft, hail, vandalism, glass). Homeowners policies bundle dwelling, contents, additional living expense, and personal liability. Commercial property, commercial general liability, and workers' compensation round out the core non-life portfolio. Each coverage generates its own frequency-severity profile and, accordingly, its own rating plan.

## Premium Components

The gross premium charged to a policyholder is not a single number handed down by regulation; it is an engineered sum.

\[ P = \text{Pure Premium} + \text{Expenses} + \text{Profit/Contingency Load} + \text{Cost of Capital} \]

The **pure premium** is the actuarial expected cost of claims over the policy period, ignoring expenses and capital. Expense loads cover commissions, underwriting, claims handling, and reinsurance. The profit and contingency load buffers adverse deviation and rewards shareholders; the cost-of-capital charge compensates equity holders for the capital that backs unexpected losses. Predictive modelling's job is to estimate the pure premium with as much granularity and accuracy as data support, while the other components are typically added through a gross-up factor.

## Pure Premium Decomposition

For a policy with random claim count \(N\) and individual claim amounts \(X_1, X_2, \dots, X_N\), the aggregate loss is \(S = \sum_{i=1}^{N} X_i\). Under the classical independence assumption — \(N\) independent of the \(X_i\)'s and the \(X_i\)'s identically distributed — the Wald identity gives

\[ \mathbb{E}[S] = \mathbb{E}[N]\cdot\mathbb{E}[X] . \]

This is the workhorse of frequency-severity modelling: build one model for how often claims happen and another for how much each costs, then multiply.

<div class="definition">
<strong>Pure Premium.</strong> The <em>pure premium</em> per unit exposure is
<br>
\[ \mathrm{PP} = \frac{\mathbb{E}[\text{Losses}]}{\text{Exposure}} = \mathbb{E}[\text{frequency}]\cdot\mathbb{E}[\text{severity}] , \]
<br>
assuming independence between frequency and severity. Exposure is typically measured in car-years for auto and house-years for property.
</div>

## Rating Factors and the Actuarial Cycle

A **rating factor** is any variable used to differentiate premium: driver age, vehicle use, territory, construction type, deductible. Allowed factors are constrained by regulation (e.g., gender bans in some jurisdictions), by data availability, and by the predictive signal they carry. The **actuarial pricing cycle** runs: collect experience, trend and develop losses to ultimate, fit models, file rates, observe new experience, and repeat. Predictive modelling sits at the heart of the "fit models" step but is tightly coupled to trending, development, and regulatory review.

<div class="example">
<strong>A stylized tariff.</strong> Consider a driver with base pure premium 600 dollars. A rural territory relativity of 0.85, a vehicle-use multiplier of 1.10 for commuting, and an age multiplier of 1.20 for a 22-year-old produces a modelled pure premium of
<br>
\[ 600 \times 0.85 \times 1.10 \times 1.20 \approx 673 \text{ dollars}. \]
<br>
Loaded with 25% expenses and 5% profit, the gross premium lands near 962 dollars.
</div>

# Chapter 2: Exploratory Data Analysis for Insurance Data

## The Policy and Claim Files

Insurance data arrives in two primary tables. The **policy file** has one row per policy term and records exposure, rating variables, and a policy identifier. The **claim file** has one row per claim and records the occurrence date, payment amounts, coverage code, and the same policy identifier. A typical modelling table joins these two, summing claim counts and losses by policy and carrying forward exposure and rating variables as features.

Key columns to watch: `exposure` (fraction of a year at risk), `claim_count`, `claim_amount` (paid plus case reserve, or ultimate if developed), and `earned_premium` used as a denominator in loss-ratio diagnostics.

## Data Cleansing

Real insurance data are messy. A standard cleansing pass handles:

- **Missing values** — imputation (median, KNN, or model-based), indicator flags for "unknown", or omission if the column is corrupt.
- **Outliers** — record errors, duplicate claims, and data-entry artifacts like a 1 dollar deductible.
- **Censoring and truncation** — policy limits (right-censoring) and deductibles (left-truncation) shape the observed loss distribution and must be reflected in the likelihood.
- **Large losses** — catastrophic events are treated separately or capped at a threshold so that a handful of claims do not dominate severity estimation.
- **IBNR adjustments** — losses incurred but not yet reported are developed to ultimate using a chain-ladder or Bornhuetter–Ferguson method before the data are passed to the GLM.

## Univariate and Bivariate Diagnostics

One-way analysis computes the empirical frequency or loss ratio by level of a single rating variable. Two-way tables cross-tabulate, say, territory by vehicle age. These diagnostics reveal obvious signal (young drivers crash more) and expose small-cell problems where a level has too little exposure to support a reliable estimate.

## Visualizing Risk and Validation Plots

- **Lift chart** — sort policies by predicted pure premium, bucket into deciles, and plot actual loss cost. A good model produces a monotone, steep curve.
- **Double-lift chart** — compare two competing models by sorting on the ratio of their predictions and plotting actual losses in each bin.
- **Partial dependence plot** — isolate the marginal effect of one variable with others averaged out.

<div class="example">
<strong>Loss ratio by territory.</strong> Across 150,000 car-years, a pilot analysis finds loss ratio of 0.62 in urban territory A, 0.71 in suburban B, and 0.48 in rural C. The urban-suburban gap of 9 percentage points translates into roughly 45 dollars per car-year for a base premium of 500 dollars, enough to motivate a territory rating factor.
</div>

## Data Splitting

Out-of-sample validation is mandatory. A train/validation/test split with stratification by time isolates the cost of overfitting. For insurance, an **out-of-time holdout** (for example, train on years 1–3 and validate on year 4) is essential because the economic and regulatory environment drifts even when the model is otherwise stable.

<div class="definition">
<strong>Exposure.</strong> <em>Exposure</em> is the measure of risk time that underpins the frequency denominator. For auto it is typically the car-year (one vehicle insured for one full year). A policy cancelled halfway through contributes 0.5 car-years.
</div>

# Chapter 3: Frequency Modelling with GLMs

## The Poisson Starting Point

Claim counts are non-negative integers, so Poisson regression is the natural first model. Let \(N_i\) be the number of claims on policy \(i\) with exposure \(e_i\). We assume

\[ N_i \sim \mathrm{Poisson}(\lambda_i e_i), \qquad \log \lambda_i = \mathbf{x}_i^\top \boldsymbol\beta . \]

The link makes \(\log \mathbb{E}[N_i] = \log e_i + \mathbf{x}_i^\top \boldsymbol\beta\), with \(\log e_i\) entering as an **offset** — a term with coefficient fixed at one. This parametrizes claim rates rather than counts and automatically scales predictions with exposure.

Maximum likelihood estimation of \(\boldsymbol\beta\) is done by iteratively reweighted least squares. Standard errors come from the observed Fisher information, and Wald tests are the default inferential tool.

## Overdispersion

A hallmark of the Poisson distribution is \(\mathrm{Var}(N) = \mathbb{E}[N]\). Real claim counts rarely satisfy this: heterogeneity among policyholders inflates variance. Diagnostically, overdispersion appears as a Pearson chi-square statistic substantially greater than the residual degrees of freedom.

Two remedies:

1. **Quasi-Poisson** — keep the Poisson mean structure but fit a dispersion parameter \(\phi\) so that \(\mathrm{Var}(N) = \phi\mu\). Point estimates of \(\boldsymbol\beta\) are unchanged; standard errors are scaled by \(\sqrt{\phi}\).
2. **Negative Binomial** — derive \(N\) by mixing Poisson rates across a Gamma-distributed frailty:

\[ N \mid \mu, W \sim \mathrm{Poisson}(\mu W), \qquad W \sim \mathrm{Gamma}(\kappa, \kappa) . \]

Marginalizing over \(W\) yields a negative binomial with

\[ \mathrm{Var}(N) = \mu\left(1 + \frac{\mu}{\kappa}\right) = \mu + \frac{\mu^2}{\kappa} . \]

Smaller \(\kappa\) means more heterogeneity; as \(\kappa \to \infty\), the negative binomial collapses back to Poisson.

## Excess Zeros: Zero-Inflated and Hurdle Models

Many policies report zero claims — a feature, not a bug. If the observed number of zeros exceeds what a Poisson or NB predicts, a **zero-inflated** model posits two populations: a "structural zero" group with probability \(\pi\) (never claims) and an "at-risk" group following a count distribution. A **hurdle** model instead splits the likelihood into a Bernoulli "any claim" component and a zero-truncated count component. Hurdle models often fit insurance data cleanly because the decision to file a claim and the number of subsequent claims can genuinely be driven by different mechanisms.

## Model Selection and Goodness of Fit

Candidate models are compared with AIC and BIC,

\[ \mathrm{AIC} = -2\ell(\hat\theta) + 2p , \qquad \mathrm{BIC} = -2\ell(\hat\theta) + p\log n , \]

and nested models with a likelihood ratio test,

\[ -2(\ell_R - \ell_F) \sim \chi^2_{p_F - p_R} . \]

Residual analysis uses Pearson residuals \((y_i - \hat\mu_i)/\sqrt{V(\hat\mu_i)}\) and deviance residuals that respect the exponential family form. Out-of-sample lift charts close the loop: a model that fits well in-sample but has a flat lift curve on held-out data is not fit for pricing.

<div class="theorem">
<strong>Exponential family mean and variance.</strong> For a response \(Y\) with density
<br>
\[ f(y;\theta,\phi) = \exp\!\left\{\frac{y\theta - b(\theta)}{a(\phi)} + c(y,\phi)\right\}, \]
<br>
we have \(\mathbb{E}[Y] = b'(\theta) = \mu\) and \(\mathrm{Var}(Y) = a(\phi)\, b''(\theta) = a(\phi)\, V(\mu)\). The <em>variance function</em> \(V(\mu)\) determines the family: \(V(\mu) = \mu\) gives Poisson, \(V(\mu) = \mu^2\) gives Gamma, and \(V(\mu) = \mu^p\) with \(1 < p < 2\) gives the Tweedie compound Poisson–Gamma that appears in Chapter 5.
</div>

<div class="example">
<strong>Young driver frequency effect.</strong> A Poisson GLM on 200,000 car-years finds the coefficient for drivers aged 18–24 is 0.42 relative to the 35–50 base. Exponentiating, the frequency relativity is \(e^{0.42} \approx 1.52\). A driver in this age band is modelled to have claim frequency 52% higher than base, all else equal.
</div>

# Chapter 4: Severity Modelling

## Distributional Candidates

Conditional on a claim occurring, the loss amount is a positive continuous random variable, usually right-skewed with a heavy tail. Candidate distributions:

- **Gamma** — scale-family, constant coefficient of variation, tractable in GLMs.
- **Lognormal** — log of loss is normal; closed-form ML and intuitive for multiplicative effects.
- **Inverse Gaussian** — heavier tail than Gamma, used when very small claims dominate.
- **Pareto and generalized Pareto** — for the tail only, often spliced above a threshold.

## Gamma GLM

Assume per-claim severity \(Y \sim \mathrm{Gamma}(\mu, \nu)\) with shape \(\nu\) and mean \(\mu\), and use the log link,

\[ \log \mu_i = \mathbf{x}_i^\top \boldsymbol\beta . \]

The Gamma density rewritten in exponential family form has \(V(\mu) = \mu^2\), so \(\mathrm{Var}(Y) = \phi\mu^2\) — the coefficient of variation is constant. The canonical link is the inverse link, but the log link is overwhelmingly preferred because it produces a **multiplicative** tariff consistent with the frequency model. The Gamma deviance,

\[ D = 2\sum_i \left[ -\log(y_i/\hat\mu_i) + \frac{y_i - \hat\mu_i}{\hat\mu_i} \right] , \]

drops out of the likelihood and plays the role that sum of squared errors plays in Gaussian regression.

## Lognormal Regression

A practical alternative is to take logs and fit ordinary least squares:

\[ \log Y_i = \mathbf{x}_i^\top \boldsymbol\beta + \varepsilon_i, \qquad \varepsilon_i \sim N(0,\sigma^2) . \]

Predictions on the original scale require bias correction: \(\mathbb{E}[Y_i] = \exp(\mathbf{x}_i^\top\boldsymbol\beta + \sigma^2/2)\). Lognormal regression is convenient but can be unstable if some losses are very small or if a claim reopens with zero additional payment.

## Deductibles, Limits, and Trend

Policyholder-level features shape the observed distribution:

- **Deductibles** left-truncate losses at the retention. The GLM likelihood must condition on exceeding the deductible, otherwise coefficients are biased.
- **Policy limits** right-censor losses. A Tobit-style likelihood or an explicit censored Gamma fit keeps estimates consistent.
- **Loss trend** is economic inflation on severity, typically 3–6% per year for auto physical damage. Losses are brought to a common cost level before modelling by applying a trend index.

## Outliers and Large Losses

A single million-dollar liability claim can swing severity coefficients. Two practical treatments:

1. **Capping** at a loss ceiling (say 250,000 dollars) and pricing the excess separately.
2. **Splicing** a Gamma body with a Pareto tail above a threshold, estimated jointly with extreme-value methods.

<div class="definition">
<strong>Censored loss.</strong> A loss \(Y\) is <em>right-censored</em> at limit \(u\) when the observed value is \(\min(Y, u)\) together with a flag for whether the limit was reached. Its log-likelihood contribution is \(\log f(y)\) if uncensored and \(\log \mathbb{P}(Y > u)\) if censored.
</div>

<div class="example">
<strong>Severity lift by vehicle class.</strong> A Gamma GLM estimates mean severity for sedans at 5,400 dollars and for sports cars at 8,200 dollars. The relativity 8,200 divided by 5,400 is approximately 1.52, suggesting a severity multiplier near 1.50 for the sports-car class — a sharper signal than typical frequency relativities for vehicle class.
</div>

# Chapter 5: Loss Cost (Pure Premium) and Tweedie

## Why Model Pure Premium Directly?

The frequency-severity approach fits two models and multiplies. An alternative fits a single model to pure premium

\[ Y_i = \frac{\text{losses}_i}{\text{exposure}_i} \]

directly. The challenge is that \(Y_i\) is zero for policies with no claims and a positive continuous value otherwise — a mixture that no single exponential-family member with strictly positive support accommodates. The **Tweedie** family does.

## The Tweedie Compound Poisson–Gamma

Let \(N \sim \mathrm{Poisson}(\lambda)\) and, conditional on \(N = n\), let losses be iid \(X_j \sim \mathrm{Gamma}(\alpha, \gamma)\). The aggregate \(S = \sum_{j=1}^{N} X_j\) is a compound Poisson–Gamma random variable. Its distribution has a point mass at zero (when \(N = 0\)) and a continuous positive density otherwise. Tweedie showed that \(S\) belongs to the exponential dispersion family with variance function

\[ V(\mu) = \mu^p , \qquad 1 < p < 2 , \]

and that \(p\) encodes the Poisson-Gamma mixture through \(p = (\alpha + 2)/(\alpha + 1)\). The GLM with log link and Tweedie variance is the pure-premium analogue of Gamma and Poisson GLMs.

The full variance is

\[ \mathrm{Var}(Y) = \phi \mu^p . \]

The index \(p\) is estimated by profile likelihood; values around 1.5–1.7 are typical for personal auto, with higher \(p\) for lower-frequency, heavier-tailed commercial lines.

## Multiplicative Tariff Equivalence

A remarkable and practically convenient result: if frequency is modelled as Poisson with log link and severity as Gamma with log link, the implied pure premium has the same **multiplicative** structure as a Tweedie GLM on pure premium directly.

\[ \mu_i = \mu_0 \prod_{k} r_{k,\, l(i,k)} , \]

where \(\mu_0\) is the base rate, \(k\) indexes rating variables, \(l(i,k)\) is the level of variable \(k\) on policy \(i\), and \(r_{k,l}\) is the level's relativity. In principle, frequency-severity and Tweedie should produce similar tariffs; in practice they can diverge when data are thin, when different variables carry frequency versus severity signal, or when the \(p\) assumption is off. Best practice is to fit both and reconcile.

## Validation

Three tools dominate pure-premium validation:

- **Lift chart** — sort by predicted pure premium, bucket into deciles, plot actual loss cost. A steep, monotone curve is the goal.
- **Normalized Gini coefficient** — twice the area between the Lorenz curve and the diagonal,

\[ G = 2\int_0^1 \bigl(L(u) - u\bigr)\, du , \]

where \(L(u)\) is the cumulative proportion of actual losses captured in the lowest \(u\) fraction of predictions. Normalized Gini divides by the maximum achievable, making values comparable across portfolios.
- **Double-lift chart** — overlay two candidate models, sort on the ratio of their predictions, and check which tracks actual losses in each bin.

<div class="theorem">
<strong>Tweedie as exponential dispersion member.</strong> For \(1 < p < 2\) the Tweedie compound Poisson–Gamma has density of the exponential dispersion form
<br>
\[ f(y; \mu, \phi, p) = a(y, \phi, p) \exp\!\left\{\frac{1}{\phi}\!\left(y\, \frac{\mu^{1-p}}{1-p} - \frac{\mu^{2-p}}{2-p}\right)\right\}, \]
<br>
on \(y \ge 0\) with a point mass at \(y = 0\). The normalizing constant \(a(y,\phi,p)\) is an infinite series — intractable in closed form but handled numerically by the <code>tweedie</code> R package.
</div>

<div class="example">
<strong>Pure-premium decile lift.</strong> A Tweedie GLM with \(p = 1.55\) sorts a held-out book of 40,000 policies by prediction. Decile 1 has observed pure premium 180 dollars, decile 10 has 1,420 dollars, and the curve is monotone. The ratio 1,420 divided by 180 is about 7.9 — strong lift for a personal auto model.
</div>

# Chapter 6: Spatial Analysis and Territorial Rating

## Why Geography Matters

Location drives loss experience through weather (hail, freezing, flood), crime (theft, vandalism), traffic density (collisions), repair costs (urban wage structures), and demographic composition. Territory is one of the most predictive variables in personal auto and homeowners, often rivalling age and vehicle class combined. The territorial rating problem is: given claim experience by fine geographic unit, produce a set of relativities that is credible (not driven by random noise), smooth (neighbouring areas have similar rates), and defensible (regulators can audit the method).

## Aggregation Units

The raw unit is the six-character Canadian postal code or its U.S. analogue, but at that resolution most cells have few exposures and zero claims. Typical aggregation steps:

- **Forward sortation area (FSA)** — the first three characters of a postal code, corresponding to a neighbourhood or small town.
- **Census dissemination area** — a few hundred households, attached to demographic and income covariates.
- **Custom rating territories** — clusters of FSAs grouped so that each cluster has enough exposure for credible estimation.

## Smoothing Methods

Several families of methods trade bias for variance:

1. **K-nearest neighbours** — average the pure premium of an area with its \(k\) geographic neighbours, weighted by exposure.
2. **Kernel smoothing** — a spatially weighted moving average with a bandwidth chosen by cross-validation.
3. **Conditional autoregressive (CAR) priors** — a Bayesian framework where each area's rate is shrunk toward the mean of its neighbours. CAR models are the workhorse of disease mapping and transfer cleanly to insurance.
4. **Integrated Nested Laplace Approximation (INLA)** — a fast deterministic approximation for Bayesian latent Gaussian models, allowing CAR and other spatial priors to be fit in seconds rather than hours of MCMC.

## Generalized Additive Models with Spatial Smoothers

A Generalized Additive Model (GAM) replaces some of the linear terms in a GLM with smooth functions estimated by penalized splines. For territorial rating, a two-dimensional smoother on longitude and latitude captures geography as a continuous surface:

\[ \log \mu_i = \mathbf{x}_i^\top \boldsymbol\beta + s(\text{lon}_i, \text{lat}_i) . \]

The `mgcv` package fits this with thin-plate regression splines and automatic smoothing-parameter selection by REML. The output is a smooth relativity surface that can be overlaid on a map, inspected visually, and then discretized into territory bins for the filed rating plan.

## Constructing a Territorial Relativity Table

The workflow:

1. Fit a baseline GLM with all non-spatial variables.
2. Compute residual pure premium by FSA.
3. Smooth the residuals using a CAR prior, GAM, or KNN.
4. Cluster FSAs with similar smoothed residuals into a small number of territories — 10 to 30 is typical.
5. Refit the GLM with the new territorial factor and iterate until convergence.

## Boundary Effects and Rebinning

Neighbouring FSAs on opposite sides of a territory boundary may have nearly identical experience yet receive different rates — a classic cliff-edge problem. Regulators and policyholders dislike arbitrary jumps. Two mitigations: enforce contiguity constraints in the clustering step, and add rate caps that limit year-over-year premium change for any single policy. When a cliff is unavoidable for defensibility, an explanatory memo describing the statistical basis accompanies the rate filing.

<div class="definition">
<strong>CAR prior.</strong> The <em>intrinsic conditional autoregressive</em> prior on an area-level random effect \(\phi_i\) specifies
<br>
\[ \phi_i \mid \phi_{-i} \sim N\!\left(\frac{1}{n_i}\sum_{j \sim i}\phi_j,\; \frac{\sigma^2}{n_i}\right) , \]
<br>
where \(j \sim i\) denotes adjacency and \(n_i\) is the number of neighbours of area \(i\). The prior shrinks each area toward the average of its neighbours.
</div>

<div class="example">
<strong>Toronto versus Thunder Bay.</strong> A CAR-smoothed map of Ontario auto pure premium shows downtown Toronto FSAs clustered around 1,150 dollars per car-year, suburban Toronto around 820 dollars, and Thunder Bay around 540 dollars. The 2.1-times spread between the richest and leanest territories maps onto relativities of about 1.65, 1.18, and 0.77 against a provincial base of 700 dollars.
</div>

## Case Study Synthesis

Bringing the six chapters together: a case-study pricing exercise starts with raw policy and claim tables, performs exploratory analysis to identify candidate rating variables, fits a Poisson frequency GLM with overdispersion diagnostics, fits a Gamma severity GLM on capped losses, multiplies the two for a frequency-severity pure premium, independently fits a Tweedie pure-premium GLM, and compares them on lift and normalized Gini over an out-of-time holdout. Geography is handled either as a GAM smoother fit jointly with the other variables or as a post-hoc CAR smoother on residuals. The final deliverable is a multiplicative rating plan with base rate, rating-variable relativities, and a territorial relativity table — the essential ingredients of a filed P&C rate manual.

The themes that recur across every chapter: exponential-family structure gives coherent estimation and testing; the log link makes tariffs multiplicative and interpretable; overdispersion, censoring, and trending are the first-order complications; and out-of-sample validation (lift, Gini, double lift) is the final arbiter of whether a model should actually go into production.
