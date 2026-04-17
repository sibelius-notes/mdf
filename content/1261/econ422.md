---
title: "ECON 422: Microeconometric Analysis"
prof: "Tom Parker"
subjects: "ECON"
---

## Sources and References

**Primary textbooks** — Huntington-Klein, N. (2022). *The Effect: An Introduction to Research Design and Causality*. CRC Press (free at theeffectbook.net); Hernán, M. A. & Robins, J. M. (2020). *Causal Inference: What If*. Chapman & Hall (free on Hernán's Harvard website).

**Supplementary texts** — Angrist, J. D. & Pischke, J.-S. (2009). *Mostly Harmless Econometrics*. Princeton UP; Wooldridge, J. M. (2010). *Econometric Analysis of Cross Section and Panel Data*, 2nd ed. MIT Press.

**Online resources** — MIT OCW 14.771 (Development Economics); Andrew Goodman-Bacon (2021) on staggered DiD; Callaway & Sant'Anna (2021) on heterogeneous treatment effects in DiD.

---

# Chapter 1: Causal Inference and Potential Outcomes

## 1.1 The Fundamental Problem of Causal Inference

The core challenge of microeconometrics is moving from observed data to **causal claims**. The **potential outcomes framework** (Rubin Causal Model) provides a rigorous language for causality.

<div class="definition">
<strong>Potential Outcomes:</strong> For each unit <em>i</em> and treatment \( D_i \in \{0, 1\} \), define:
<ul>
<li>\( Y_i(1) \): the outcome unit <em>i</em> would experience <em>if treated</em>.</li>
<li>\( Y_i(0) \): the outcome unit <em>i</em> would experience <em>if untreated</em>.</li>
</ul>
The <em>individual treatment effect</em> is \( \tau_i = Y_i(1) - Y_i(0) \).
</div>

The **fundamental problem** is that we observe only one potential outcome: \( Y_i = D_i Y_i(1) + (1-D_i)Y_i(0) \). We never observe the **counterfactual** for any individual.

Key estimands:

- **ATE (Average Treatment Effect):** \( \tau_{ATE} = E[Y_i(1) - Y_i(0)] \)
- **ATT (Average Treatment Effect on the Treated):** \( \tau_{ATT} = E[Y_i(1) - Y_i(0) \mid D_i = 1] \)
- **ATC (Average Treatment Effect on Controls):** \( \tau_{ATC} = E[Y_i(1) - Y_i(0) \mid D_i = 0] \)

The naive comparison \( E[Y_i \mid D_i = 1] - E[Y_i \mid D_i = 0] \) decomposes as:

\[
E[Y_i \mid D_i = 1] - E[Y_i \mid D_i = 0] = \underbrace{\tau_{ATT}}_{\text{ATT}} + \underbrace{E[Y_i(0)\mid D_i=1] - E[Y_i(0)\mid D_i=0]}_{\text{selection bias}}
\]

Selection bias arises because treated and untreated units have different counterfactual outcomes even absent treatment.

## 1.2 Assignment Mechanisms

An **assignment mechanism** describes how treatment is allocated. Rubin's taxonomy:

1. **Randomized assignment:** \( D_i \perp (Y_i(0), Y_i(1)) \). Randomization eliminates selection bias: \( E[Y_i(0)\mid D_i=1] = E[Y_i(0)\mid D_i=0] \), so the ATE and ATT coincide with the naive difference.

2. **Unconfounded (ignorable) assignment:** \( D_i \perp (Y_i(0), Y_i(1)) \mid \mathbf{X}_i \). Conditional on observables, treatment is as good as random. This is the identifying assumption for observational study methods like matching and regression.

3. **Non-ignorable assignment:** Unmeasured confounders exist. IV, DiD, RD, and synthetic control methods are needed.

## 1.3 SUTVA

The **Stable Unit Treatment Value Assumption (SUTVA)** has two parts:
1. **No interference:** Unit \( i \)'s potential outcomes do not depend on other units' treatment status.
2. **No hidden variations of treatment:** There is only one version of treatment.

SUTVA is required for the potential outcomes notation to be well-defined. Violations (e.g., spillovers in network experiments) require extended models.

---

# Chapter 2: Experiments and Regression in Experiments

## 2.1 Randomized Controlled Trials

In a randomized experiment, random assignment ensures \( E[Y_i(0)\mid D_i=1] = E[Y_i(0)\mid D_i=0] \), so:

\[
\hat{\tau}_{ATE} = \bar{Y}_1 - \bar{Y}_0 = \frac{1}{n_1}\sum_{D_i=1}Y_i - \frac{1}{n_0}\sum_{D_i=0}Y_i
\]

This is the **Neyman estimator**. Its variance is:

\[
\text{Var}(\hat{\tau}) = \frac{\sigma_1^2}{n_1} + \frac{\sigma_0^2}{n_0}
\]

where \( \sigma_j^2 = \text{Var}(Y_i(j)) \). Under the **sharp null hypothesis** \( H_0: Y_i(1) = Y_i(0) \) for all \( i \), **randomization inference** (Fisher's exact p-value) is exact and requires no distributional assumptions.

## 2.2 Regression Adjustment in Experiments

Even in a randomized experiment, including pre-treatment covariates \( \mathbf{X}_i \) in a regression:

\[
Y_i = \alpha + \tau D_i + \mathbf{X}_i^{\top}\boldsymbol{\gamma} + \varepsilon_i
\]

can improve **precision** by reducing residual variance, without affecting consistency of \( \hat{\tau} \). This is the Lin (2013) estimator with saturated interactions:

\[
Y_i = \alpha + \tau D_i + (\mathbf{X}_i - \bar{\mathbf{X}})^{\top}\boldsymbol{\gamma} + D_i(\mathbf{X}_i - \bar{\mathbf{X}})^{\top}\boldsymbol{\delta} + \varepsilon_i
\]

The coefficient \( \hat{\tau} \) estimates the ATE without any bias even if the regression model is misspecified.

---

# Chapter 3: Unconfounded Assignment — Matching and Weighting

## 3.1 The Propensity Score

<div class="definition">
<strong>Propensity Score (Rosenbaum & Rubin 1983):</strong> The propensity score is the conditional probability of treatment given observed covariates:

\[
p(\mathbf{X}_i) = P(D_i = 1 \mid \mathbf{X}_i)
\]
If unconfoundedness holds given \( \mathbf{X}_i \), it also holds given \( p(\mathbf{X}_i) \) alone (the balancing property). This dramatically reduces the dimensionality of the adjustment problem.
</div>

The propensity score is typically estimated by logit or probit. The overlap (common support) condition requires \( 0 < p(\mathbf{x}) < 1 \) for all \( \mathbf{x} \) — both treatment arms must be possible for every covariate value.

## 3.2 Matching Estimators

**Matching** pairs each treated unit with one or more control units having similar covariate values (or propensity scores) and computes the average outcome difference.

For **nearest-neighbor matching** (1-to-1, without replacement):

\[
\hat{\tau}_{ATT} = \frac{1}{n_1}\sum_{D_i=1}\left[Y_i - Y_{\mathcal{M}(i)}\right]
\]

where \( \mathcal{M}(i) \) is the matched control unit. Matching bias arises from imperfect covariate balance; **bias correction** (Abadie-Imbens 2006) adds a regression adjustment to the match.

**Propensity score matching** matches on \( \hat{p}(\mathbf{X}_i) \) instead of the full covariate vector. **Caliper matching** discards treated units with no control within a specified propensity score distance.

## 3.3 Inverse Probability Weighting

**IPW estimators** reweight the sample to balance covariate distributions across treatment groups. The **Horvitz-Thompson estimator** for the ATE:

\[
\hat{\tau}_{IPW} = \frac{1}{n}\sum_{i=1}^n \left[\frac{D_i Y_i}{p(\mathbf{X}_i)} - \frac{(1-D_i)Y_i}{1 - p(\mathbf{X}_i)}\right]
\]

The **augmented IPW (AIPW)** or **doubly-robust** estimator combines a regression model \( \mu_j(\mathbf{x}) = E[Y_i(j)\mid\mathbf{X}_i = \mathbf{x}] \) with IPW weighting:

\[
\hat{\tau}_{AIPW} = \frac{1}{n}\sum_{i=1}^n \left[\hat{\mu}_1(\mathbf{X}_i) - \hat{\mu}_0(\mathbf{X}_i) + \frac{D_i(Y_i - \hat{\mu}_1(\mathbf{X}_i))}{p(\mathbf{X}_i)} - \frac{(1-D_i)(Y_i - \hat{\mu}_0(\mathbf{X}_i))}{1-p(\mathbf{X}_i)}\right]
\]

AIPW is **doubly robust**: consistent if either the propensity score model or the outcome model is correctly specified (but not necessarily both).

---

# Chapter 4: Instrumental Variables for Causal Inference

## 4.1 Local Average Treatment Effect

In the IV framework with binary treatment and binary instrument, the Wald estimator identifies the **Local Average Treatment Effect (LATE)**:

\[
\hat{\tau}_{LATE} = \frac{E[Y_i \mid Z_i=1] - E[Y_i \mid Z_i=0]}{E[D_i \mid Z_i=1] - E[D_i \mid Z_i=0]}
\]

Under the potential outcomes IV assumptions (exclusion, relevance, monotonicity), this equals the ATE for **compliers** — units whose treatment status changes when the instrument changes (\( D_i(1) > D_i(0) \)).

<div class="definition">
<strong>Monotonicity:</strong> \( D_i(1) \geq D_i(0) \) for all <em>i</em> (no defiers). This assumption guarantees that the instrument moves all responsive units in the same direction.
</div>

The four compliance types under binary \( Z \) and binary \( D \):

| Type | \( D_i(0) \) | \( D_i(1) \) |
|------|-------------|-------------|
| Always-taker | 1 | 1 |
| Never-taker | 0 | 0 |
| Complier | 0 | 1 |
| Defier | 1 | 0 |

Monotonicity rules out defiers. IV identifies the LATE for compliers only — the ATE for always-takers and never-takers is not identified.

## 4.2 Identification, Relevance, and Exclusion

Valid instruments must satisfy:
- **Relevance:** \( \text{Cov}(Z_i, D_i) \neq 0 \) (empirically testable via first-stage F-statistic).
- **Exclusion restriction:** \( Z_i \) affects \( Y_i \) only through \( D_i \) (non-testable assumption requiring substantive justification).
- **Independence:** \( Z_i \perp (Y_i(0), Y_i(1), D_i(0), D_i(1)) \) (approximately met by randomization or "as-good-as-random" assignment of \( Z_i \)).

<div class="example">
<strong>Vietnam Draft Lottery (Angrist 1990):</strong> Uses random draft lottery numbers as an instrument for military service. Relevance: draft numbers strongly predict service. Exclusion: lottery numbers affect earnings only through military service (no direct effect). Monotonicity: those with low lottery numbers were more likely to serve (no one chose not to serve because they won a lottery). LATE is the effect on compliers — men who served because of their draft number.
</div>

---

# Chapter 5: Difference-in-Differences

## 5.1 The Basic DiD Design

**Difference-in-Differences (DiD)** exploits panel data with two groups (treated and control) and two periods (pre and post intervention).

<div class="definition">
<strong>DiD Estimator:</strong>

\[
\hat{\tau}_{DiD} = \underbrace{(\bar{Y}_{treated,post} - \bar{Y}_{treated,pre})}_{\text{change in treated group}} - \underbrace{(\bar{Y}_{control,post} - \bar{Y}_{control,pre})}_{\text{change in control group}}
\]
</div>

This can be estimated by OLS:

\[
Y_{it} = \alpha + \beta\,\text{Post}_t + \gamma\,\text{Treated}_i + \tau\,(\text{Post}_t \times \text{Treated}_i) + \varepsilon_{it}
\]

The coefficient \( \tau \) on the interaction term is the DiD estimate.

## 5.2 The Parallel Trends Assumption

DiD identifies \( \tau_{ATT} \) under the **parallel trends assumption**: absent treatment, the average outcome of the treated group would have evolved in parallel with the control group:

\[
E[Y_{it}(0) \mid \text{Treated}_i = 1, t = \text{post}] - E[Y_{it}(0) \mid \text{Treated}_i = 1, t = \text{pre}]
\]

\[
= E[Y_{it}(0) \mid \text{Treated}_i = 0, t = \text{post}] - E[Y_{it}(0) \mid \text{Treated}_i = 0, t = \text{pre}]
\]

This assumption is untestable for the post-treatment period but can be assessed with **pre-treatment placebo tests**: testing whether the treated and control groups have parallel trends in periods before treatment.

<div class="example">
<strong>Card & Krueger (1994) — Minimum Wage and Employment:</strong> New Jersey raised its minimum wage; Pennsylvania did not. DiD compares fast-food employment changes in NJ versus PA. The identifying assumption is that NJ employment would have trended like PA employment absent the wage increase.
</div>

## 5.3 Event Study Specification

An **event study** regression tests pre-trends and traces out treatment effects over time:

\[
Y_{it} = \sum_{k \neq -1} \beta_k\, \mathbf{1}(t - T_i^* = k) \cdot \text{Treated}_i + \alpha_i + \lambda_t + \varepsilon_{it}
\]

where \( T_i^* \) is the treatment timing, \( \alpha_i \) are unit fixed effects, \( \lambda_t \) are time fixed effects, and \( k = -1 \) is the omitted period (normalization). Coefficients for \( k < 0 \) are pre-treatment betas — if they are jointly zero, parallel pre-trends is supported.

## 5.4 Staggered DiD

When treatment is adopted at different times by different units (**staggered adoption**), the two-way fixed effects (TWFE) regression with a single binary treatment indicator \( D_{it} \):

\[
Y_{it} = \alpha_i + \lambda_t + \tau D_{it} + \varepsilon_{it}
\]

estimates a weighted average of unit-time treatment effects, but the weights can be negative when treatment effects are heterogeneous across cohorts. This is the **Goodman-Bacon (2021) decomposition** problem. Modern estimators (Callaway-Sant'Anna, Sun-Abraham, de Chaisemartin-D'Haultfoeuille) construct valid ATT estimates by comparing each treated cohort only to clean control units not yet treated.

---

# Chapter 6: Fixed Effects and Panel Data

## 6.1 Within-Unit Variation and Fixed Effects

As developed in ECON 323, the fixed effects estimator:

\[
\hat{\boldsymbol{\beta}}_{FE} = \argmin_{\boldsymbol{\beta}} \sum_{i=1}^N \sum_{t=1}^T (Y_{it} - \bar{Y}_i - (\mathbf{X}_{it} - \bar{\mathbf{X}}_i)^{\top}\boldsymbol{\beta})^2
\]

exploits within-unit variation while absorbing time-invariant unobservables. The ATT interpretation of \( \hat{\beta}_{FE} \) (in the DiD sense) relies on:

1. **Strict exogeneity:** \( E[\varepsilon_{it} \mid \mathbf{X}_{i1}, \ldots, \mathbf{X}_{iT}, a_i] = 0 \)
2. **No anticipation** and other timing assumptions

The workhorse causal panel model combines unit and time fixed effects (TWFE):

\[
Y_{it} = \alpha_i + \lambda_t + \mathbf{X}_{it}^{\top}\boldsymbol{\beta} + \varepsilon_{it}
\]

Unit FE control for any time-invariant confounders; time FE control for any unit-invariant shocks (e.g., aggregate business cycle, policy changes affecting all units simultaneously).

---

# Chapter 7: Regression Discontinuity Designs

## 7.1 The Sharp RD Design

**Regression Discontinuity (RD)** exploits a **cutoff rule**: treatment is assigned based on whether a running variable \( X_i \) exceeds a threshold \( c \):

\[
D_i = \mathbf{1}(X_i \geq c)
\]

The identifying assumption is that potential outcomes \( E[Y_i(0) \mid X_i = x] \) and \( E[Y_i(1) \mid X_i = x] \) are **continuous at the cutoff** \( c \). Under this assumption, the discontinuous jump in observed outcomes at \( c \) identifies the treatment effect at the cutoff:

\[
\tau_{RD} = \lim_{x \downarrow c} E[Y_i \mid X_i = x] - \lim_{x \uparrow c} E[Y_i \mid X_i = x]
\]

<div class="remark">
<strong>Local Randomization Interpretation:</strong> Near the cutoff, units are approximately randomly assigned to treatment because precise control over the running variable is difficult. RD estimates an ATE for the subpopulation near the cutoff — a <em>local</em> effect.
</div>

## 7.2 Estimation: Local Polynomial Regression

The standard estimator fits separate polynomial regressions on each side of the cutoff, evaluated at \( X_i = c \). Local linear regression (order 1):

\[
\hat{\tau}_{RD} = \hat{\alpha}_R - \hat{\alpha}_L
\]

where \( \hat{\alpha}_R \) and \( \hat{\alpha}_L \) are intercepts from local linear regressions within a bandwidth \( h \) on each side. The **optimal bandwidth** trades off bias (wider bandwidth picks up curvature in the regression function) and variance (narrower bandwidth uses fewer observations). The Imbens-Kalyanaraman (2012) and Calonico-Cattaneo-Titiunik (CCT 2014) data-driven bandwidth selectors are standard.

## 7.3 Validity Checks

1. **Sorting test (McCrary density test):** If units can precisely manipulate \( X_i \) to be just above \( c \), there will be a jump in the density of \( X_i \) at \( c \). Test for a discontinuity in the running variable density.
2. **Covariate continuity:** Pre-determined baseline covariates should be continuous at the cutoff if the design is valid.
3. **Placebo cutoffs:** Test for jumps in outcomes at arbitrary thresholds away from \( c \) — finding none supports the design.

## 7.4 The Fuzzy RD Design

When the cutoff only changes the **probability** of treatment (rather than determining it deterministically), the design is **fuzzy**. The Wald estimate for the fuzzy RD is:

\[
\tau_{FRD} = \frac{\lim_{x\downarrow c}E[Y_i\mid X_i=x] - \lim_{x\uparrow c}E[Y_i\mid X_i=x]}{\lim_{x\downarrow c}E[D_i\mid X_i=x] - \lim_{x\uparrow c}E[D_i\mid X_i=x]}
\]

This is a LATE for compliers at the cutoff, analogous to the IV LATE.

---

# Chapter 8: Synthetic Control Method

## 8.1 Motivation

When the treated unit is a single region, country, or firm — and there is no natural comparison group satisfying parallel trends — the **Synthetic Control Method (Abadie, Diamond & Hainmueller 2010)** constructs a weighted combination of control units that best reproduces the treated unit's pre-treatment trajectory.

## 8.2 Construction

Let unit 1 be treated at time \( T_0 \) and units \( 2, \ldots, J+1 \) be potential controls. Find weights \( \mathbf{w} = (w_2, \ldots, w_{J+1}) \) with \( w_j \geq 0 \) and \( \sum w_j = 1 \) solving:

\[
\min_{\mathbf{w}} \left\| \mathbf{X}_1 - \sum_{j=2}^{J+1} w_j \mathbf{X}_j \right\|_V^2
\]

where \( \mathbf{X}_j \) is a vector of pre-treatment predictors (lagged outcomes and covariates) for unit \( j \), and \( \|\cdot\|_V \) is a weighted norm with \( V \) chosen to minimize pre-treatment fit.

The synthetic control estimate is:

\[
\hat{\tau}_{1t} = Y_{1t} - \sum_{j=2}^{J+1} w_j^* Y_{jt}, \qquad t > T_0
\]

## 8.3 Inference via Placebo Tests

Classical asymptotics do not apply (usually \( J \) is small). Inference proceeds by applying the same synthetic control method to each control unit (as if it were treated at \( T_0 \)) and comparing the treatment unit's post-treatment RMSPE to the distribution of placebo RMSPEs. A low p-value results when the treatment unit's post-treatment gap is large relative to the placebo distribution.

<div class="example">
<strong>California Tobacco Control Program (Abadie et al. 2010):</strong> Proposition 99 (1988) raised tobacco taxes. A synthetic California constructed from a weighted average of other states closely tracks California's pre-1988 per-capita cigarette sales. The post-1988 gap estimates the reduction in smoking caused by the program.
</div>

---

# Chapter 9: Implementation in R and Stata

## 9.1 Matching and IPW in R

```r
library(MatchIt)
# Propensity score matching
m_out <- matchit(treat ~ age + educ + re74 + re75,
                 data = lalonde, method = "nearest",
                 distance = "logit", ratio = 1)
summary(m_out)  # balance statistics

library(WeightIt)
# IPW with logit propensity score
w_out <- weightit(treat ~ age + educ + re74 + re75,
                  data = lalonde, method = "ps", estimand = "ATT")
# Estimate ATT
library(marginaleffects)
```

## 9.2 Difference-in-Differences

```r
library(did)
# Callaway-Sant'Anna estimator for staggered DiD
cs_out <- att_gt(yname = "lemp", gname = "first.treat",
                 idname = "countyreal", tname = "year",
                 data = mpdta, control_group = "nevertreated")
aggte(cs_out, type = "dynamic")  # event-study plot
```

## 9.3 Regression Discontinuity

```r
library(rdrobust)
# Sharp RD with data-driven bandwidth
rdd_out <- rdrobust(y = outcome, x = running_var, c = cutoff)
summary(rdd_out)

# McCrary density test
library(rddensity)
rdd_density <- rddensity(X = running_var, c = cutoff)
summary(rdd_density)
```
