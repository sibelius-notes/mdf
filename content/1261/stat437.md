---
title: "STAT 437: Statistical Methods for Life History Analysis"
subjects: "STAT"
prof: "Liqun Diao"
---

## Sources and References
**Primary texts** — Fitzmaurice, Laird & Ware (2012) *Applied Longitudinal Analysis* 2nd ed; Diggle, Heagerty, Liang & Zeger (2002) *Analysis of Longitudinal Data* 2nd ed

**Supplementary texts** — Verbeke & Molenberghs (2009) *Linear Mixed Models for Longitudinal Data*; Cook & Lawless (2018) *Multistate Models for the Analysis of Life History Data*; Kalbfleisch & Prentice (2002) *The Statistical Analysis of Failure Time Data* 2nd ed; Aalen, Borgan & Gjessing (2008) *Survival and Event History Analysis*; Klein & Moeschberger (2003) *Survival Analysis: Techniques for Censored and Truncated Data*

---

# Chapter 1: Introduction to Longitudinal and Life History Data

## 1.1 What is Longitudinal Data?

A **longitudinal study** follows a cohort of subjects over time, recording one or more response variables at multiple occasions. This contrasts with a **cross-sectional study**, which measures subjects at a single time point. The key scientific advantage of longitudinal data is the ability to separate **within-subject change** from **between-subject heterogeneity** — two sources of variation that are completely confounded in cross-sectional designs.

<div class="definition">
<strong>Longitudinal data</strong>: A dataset in which <em>n</em> subjects each contribute measurements at <em>n<sub>i</sub></em> time points, yielding a total of <em>N = &sum; n<sub>i</sub></em> observations. The response for subject <em>i</em> at occasion <em>j</em> is denoted <em>Y<sub>ij</sub></em>, with measurement time <em>t<sub>ij</sub></em> and covariate vector <em>x<sub>ij</sub></em>.
</div>

### 1.1.1 The Subject-by-Time Data Matrix

The canonical representation of balanced longitudinal data is an \( n \times m \) matrix where rows correspond to subjects and columns to equally spaced time points \( t_1 < t_2 < \cdots < t_m \). In practice, most biomedical studies produce **unbalanced** data: subjects have different numbers of observations and/or different measurement times.

**Balanced design** — all subjects measured at the same \( m \) times. The data matrix is complete and facilitates multivariate analysis of variance (MANOVA) approaches.

**Unbalanced design** — subjects have varying \( n_i \) and possibly unique \( \{t_{ij}\} \). This is the rule rather than the exception in clinical trials and cohort studies, arising from dropouts, missed visits, and staggered entry.

### 1.1.2 Longitudinal vs. Cross-Sectional Studies

| Feature | Longitudinal | Cross-Sectional |
|---|---|---|
| Temporal ordering | Observed directly | Inferred only |
| Within-subject change | Estimable | Not estimable |
| Cohort effects | Controlled | Confounded with age |
| Cost and dropout | Higher; attrition a concern | Lower |
| Sample size per time point | Smaller | Larger |

A cross-sectional comparison of 30-year-olds and 50-year-olds cannot distinguish **aging effects** from **cohort effects** (the two age groups were born in different eras with different exposures). Longitudinal follow-up of the same individuals resolves this ambiguity.

## 1.2 Life History Processes

Life history analysis extends the longitudinal framework to settings where the outcomes of interest are **events** (transitions between states) rather than continuous measurements.

<div class="definition">
<strong>Life history process</strong>: A stochastic process <em>{X(t), t &ge; 0}</em> taking values in a finite state space <em>S</em>, where transitions between states record the biological or clinical history of a subject. The complete observed history up to time <em>t</em> is <em>H(t) = {X(s) : 0 &le; s &le; t}</em>.
</div>

Three complementary process types appear throughout the course:

**1. Multi-state process** — the state space \( \mathcal{S} = \{1, 2, \ldots, K\} \) with transitions governed by transition intensities \( q_{kl}(t \mid \mathcal{H}(t^-)) \). The **illness-death model** with states \(\{\text{Healthy}, \text{Ill}, \text{Dead}\}\) is the canonical example; the **competing risks model** is the special case where all transitions are from a single living state to one of several absorbing dead states.

**2. Event process** — counts of recurrent events (e.g., epileptic seizures, hospital readmissions). The process \( N(t) \) counts the number of events in \( [0, t] \); the **intensity** \( \lambda(t \mid \mathcal{H}(t^-)) \) is the instantaneous rate given history.

**3. Response process** — a continuously measured outcome \( Y(t) \) recorded at a discrete grid of times. This is the classical longitudinal data setting.

## 1.3 Scientific Questions and Study Design

The choice of statistical model is driven by the scientific question:

- **Population-averaged** (marginal) questions: "What is the average treatment effect in the population?" → GEE, marginal models.
- **Subject-specific** questions: "How does an individual's trajectory change with treatment?" → mixed effects models.
- **Mechanistic** questions: "What is the transition rate from disease to death?" → multistate models, survival analysis.

**Example (MSCM Trial)**: A randomized clinical trial of interferon-beta for multiple sclerosis follows \( n = 338 \) patients every 6 months for 2 years, recording a binary indicator of whether a new lesion appears on MRI. The marginal question is: "Does interferon-beta reduce the population-averaged probability of a new lesion?" The mixed-effects question is: "Does interferon-beta reduce the probability of a new lesion for a patient with a given random effect?"

## 1.4 Response Feature Analysis

Before fitting formal models, **response feature analysis** (also called the **summary statistics approach**) condenses each subject's repeated measurements into a single number that captures the scientifically relevant aspect of their trajectory. Inference is then based on the \( n \) summary statistics using standard univariate methods.

Common summary features:
- **Area under the curve** (AUC): \( \hat{A}_i = \sum_{j=1}^{n_i - 1} \frac{(Y_{i,j+1} + Y_{ij})}{2}(t_{i,j+1} - t_{ij}) \) (trapezoidal rule)
- **Slope** from a subject-specific OLS fit: \( \hat{\beta}_{1i} = \frac{\sum_j (t_{ij} - \bar{t}_i)(Y_{ij} - \bar{Y}_i)}{\sum_j (t_{ij} - \bar{t}_i)^2} \)
- **Time to peak response**, **maximum**, **minimum**

<div class="definition">
<strong>Advantages of response feature analysis</strong>: (1) avoids distributional assumptions about the error process; (2) trivially handles unbalanced data; (3) one-sample and two-sample <em>t</em>-tests are directly applicable. <strong>Disadvantages</strong>: (1) discards within-subject correlation structure; (2) inefficient relative to likelihood methods; (3) cannot accommodate time-varying covariates cleanly; (4) not directly applicable when missingness is outcome-dependent.
</div>

## 1.5 Covariates in Longitudinal Studies

**Time-constant covariates** — measured once per subject (sex, race, baseline disease severity). Denoted \( x_i \); the regression coefficient \(\beta\) has the same interpretation as in cross-sectional regression.

**Time-varying covariates** — measured at each visit alongside the response (age, BMI, treatment dose, concurrent medication). Denoted \( x_{ij} \). These can be **endogenous** (directly related to the outcome process, e.g., a biomarker) or **exogenous** (externally determined, e.g., calendar time, age).

The distinction matters for causal inference: conditioning on an endogenous time-varying covariate can induce collider bias. Marginal structural models (MSMs) with inverse probability weighting address this, though they are beyond the scope of this course.

## 1.6 Within-Subject Correlation

Repeated measurements on the same subject are correlated. Ignoring this correlation leads to:
1. Incorrect standard errors (usually underestimated for continuous outcomes when correlation is positive).
2. Invalid hypothesis tests.
3. Inefficient estimation.

The **marginal correlation matrix** for subject \( i \) is \( \text{Corr}(Y_i) = \mathbf{R}_i \), an \( n_i \times n_i \) matrix. Common parametric structures:

**Exchangeable (compound symmetry)**:
\[
\text{Corr}(Y_{ij}, Y_{ij'}) = \alpha \quad \text{for all } j \neq j'
\]
All pairs are equally correlated; appropriate when time ordering is irrelevant (e.g., cluster-randomized trials).

**AR(1)**:
\[
\text{Corr}(Y_{ij}, Y_{ij'}) = \alpha^{|t_{ij} - t_{ij'}|}
\]
Correlation decays geometrically with time separation; appropriate for equally spaced observations where recent measurements are more informative.

**Unstructured**:
\[
\text{Corr}(Y_{ij}, Y_{ij'}) = \alpha_{jj'}
\]
No constraints; uses \( m(m-1)/2 \) parameters; feasible only when \( m \) is small and the design is balanced.

**Toeplitz (banded)**:
\[
\text{Corr}(Y_{ij}, Y_{ij'}) = \alpha_{|j - j'|}
\]
Correlation depends only on lag; more parsimonious than unstructured for equally spaced data.

## 1.7 Marginal vs. Conditional Models

This distinction is fundamental and often misunderstood.

<div class="definition">
<strong>Marginal model</strong>: Specifies <em>E[Y<sub>ij</sub> | x<sub>ij</sub>]</em> directly, averaging over all unobserved heterogeneity. The regression parameters have <em>population-averaged</em> interpretations: they describe how the mean response in the population changes with covariates.
</div>

<div class="definition">
<strong>Conditional (subject-specific) model</strong>: Specifies <em>E[Y<sub>ij</sub> | b<sub>i</sub>, x<sub>ij</sub>]</em> for subject <em>i</em> with random effect <em>b<sub>i</sub></em>. The regression parameters describe how an <em>individual's</em> response changes with covariates, holding their random effect fixed.
</div>

For **linear** models with an identity link, marginal and subject-specific regression coefficients coincide: \( E[Y_{ij} | x_{ij}] = E_{b_i}[E[Y_{ij} | b_i, x_{ij}]] = x_{ij}^T \beta \). For **nonlinear** models (logistic, Poisson), marginalization does not preserve the link function and the two sets of coefficients differ — a fact with major practical implications in Chapter 5.

## 1.8 Overview of R Software

The course uses R for all data analysis. Key packages:

| Package | Purpose |
|---|---|
| `nlme` | Linear mixed effects models; flexible covariance structures via `corStruct` |
| `lme4` | Mixed effects models; efficient for large datasets; `lmer()`, `glmer()` |
| `geepack` | GEE via `geeglm()`; multiple working correlation structures |
| `gee` | Original GEE implementation |
| `survival` | Kaplan-Meier, Cox proportional hazards, parametric survival |
| `mstate` | Multi-state models |
| `mice` | Multiple imputation by chained equations |
| `msm` | Multi-state Markov models in continuous time |

---

# Chapter 2: Marginal Models and Generalized Estimating Equations

## 2.1 The Marginal Model Framework

A **marginal model** for longitudinal data specifies the first two moments of the response distribution without imposing a full likelihood. Following Liang & Zeger (1986), the three components are:

1. **Mean structure**: \( \mu_{ij} = E[Y_{ij} \mid x_{ij}] = h^{-1}(x_{ij}^T \beta) \), where \( h \) is the link function.
2. **Variance structure**: \( \text{Var}(Y_{ij} \mid x_{ij}) = \phi \cdot v(\mu_{ij}) \), where \( v(\cdot) \) is the variance function and \( \phi \) is a dispersion parameter.
3. **Working correlation structure**: \( \text{Corr}(Y_{ij}, Y_{ij'} \mid x_i) = r_{jj'}(\alpha) \), parametrized by \( \alpha \).

The **working covariance matrix** for subject \( i \) is:
\[
\mathbf{V}_i(\beta, \alpha, \phi) = \phi \cdot \mathbf{A}_i^{1/2} \mathbf{R}_i(\alpha) \mathbf{A}_i^{1/2}
\]
where \( \mathbf{A}_i = \text{diag}\{v(\mu_{i1}), \ldots, v(\mu_{i,n_i})\} \).

## 2.2 Generalized Estimating Equations

The **GEE estimating equation** for \( \beta \) is obtained by stacking the score equations from a quasi-likelihood with working covariance \( \mathbf{V}_i \):

\[
\mathbf{U}(\beta) = \sum_{i=1}^{n} \mathbf{D}_i^T \mathbf{V}_i^{-1} (\mathbf{Y}_i - \boldsymbol{\mu}_i) = \mathbf{0}
\]

where \( \mathbf{D}_i = \partial \boldsymbol{\mu}_i / \partial \beta^T \) is the \( n_i \times p \) matrix of mean derivatives and \( \mathbf{Y}_i - \boldsymbol{\mu}_i \) is the \( n_i \)-vector of residuals.

This is a system of \( p \) equations in \( p \) unknowns. It is solved iteratively using a **Fisher scoring** algorithm analogous to iteratively reweighted least squares (IRLS).

<div class="definition">
<strong>GEE estimator</strong>: The solution <em>&beta;&circ;</em> to the GEE system is <em>consistent</em> and <em>asymptotically normal</em> as <em>n &rarr; &infin;</em>, provided the mean model <em>&mu;<sub>ij</sub>(x<sub>ij</sub>, &beta;)</em> is correctly specified — <em>even if the working correlation structure is misspecified</em>. This is the fundamental robustness property of GEE.
</div>

### 2.2.1 The Sandwich Variance Estimator

Because the working correlation may be misspecified, the naive model-based variance underestimates or overestimates the true sampling variance of \( \hat{\beta} \). The **sandwich (empirical) variance estimator** corrects for this:

\[
\widehat{\text{Var}}(\hat{\beta}) = \mathbf{A}^{-1} \mathbf{B} \mathbf{A}^{-1}
\]

where:
\[
\mathbf{A} = \sum_{i=1}^{n} \mathbf{D}_i^T \mathbf{V}_i^{-1} \mathbf{D}_i, \qquad
\mathbf{B} = \sum_{i=1}^{n} \mathbf{D}_i^T \mathbf{V}_i^{-1} \hat{\mathbf{e}}_i \hat{\mathbf{e}}_i^T \mathbf{V}_i^{-1} \mathbf{D}_i
\]
and \( \hat{\mathbf{e}}_i = \mathbf{Y}_i - \boldsymbol{\mu}_i(\hat{\beta}) \) are the Pearson residuals.

The matrix \( \mathbf{A} \) is the **"bread"** (expected Hessian) and \( \mathbf{B} \) is the **"meat"** (empirical sum of outer products of score contributions). This estimator is also called the **Huber-White** or **robust** variance estimator.

**Small-sample correction**: With few clusters (\( n < 50 \)), the sandwich estimator is downward-biased. Common corrections multiply \( \hat{\mathbf{e}}_i \) by \( (1 - h_{ii})^{-1/2} \) where \( h_{ii} \) is the leverage, analogous to the HC3 correction in ordinary regression.

### 2.2.2 Efficiency vs. Robustness

There is a fundamental tradeoff:
- If the working correlation is **correctly specified**, GEE is as efficient as the GLS (maximum likelihood) estimator.
- If the working correlation is **misspecified**, GEE with sandwich SE is still valid, but loses efficiency relative to a correctly specified GLS estimator.
- Independence working correlation (all off-diagonals zero) is always valid but maximally inefficient when true correlation is strong.

**Practical guideline**: Use exchangeable or AR(1) working correlation when there is substantive reason, and always report sandwich SEs. The choice of working correlation primarily affects efficiency, not validity.

## 2.3 Independence Estimating Equations (IEE)

The simplest special case sets \( \mathbf{R}_i(\alpha) = \mathbf{I}_{n_i} \), yielding:

\[
\mathbf{U}_{\text{IEE}}(\beta) = \sum_{i=1}^n \sum_{j=1}^{n_i} \frac{\partial \mu_{ij}}{\partial \beta} \cdot \frac{Y_{ij} - \mu_{ij}}{v(\mu_{ij})} = \mathbf{0}
\]

This is identical to the ordinary GLM score equation, ignoring all within-subject correlation. The estimator is consistent, and with sandwich SEs, inference is valid. The main advantage is computational simplicity and no need to estimate \( \alpha \). The main disadvantage is efficiency loss when correlation is strong.

## 2.4 Estimation of Working Correlation Parameters

In practice, \( \alpha \) and \( \phi \) are estimated via **method of moments** from Pearson residuals \( r_{ij} = (Y_{ij} - \hat{\mu}_{ij})/\sqrt{v(\hat{\mu}_{ij})} \):

- **Dispersion**: \( \hat{\phi} = \frac{1}{N - p} \sum_{i,j} r_{ij}^2 \)
- **Exchangeable**: \( \hat{\alpha} = \frac{1}{\hat{\phi}\, C} \sum_{i} \sum_{j < j'} r_{ij} r_{ij'} \), where \( C = \frac{1}{2}\sum_i n_i(n_i - 1) - p \)
- **AR(1)**: \( \hat{\alpha} = \frac{1}{\hat{\phi}\, C} \sum_i \sum_j r_{ij} r_{i,j+1} \)

The full GEE algorithm alternates between updating \( \hat{\beta} \) (with \( \hat{\alpha} \) fixed) and updating \( \hat{\alpha} \) (with \( \hat{\beta} \) fixed), iterating until convergence.

## 2.5 QIC: Selecting the Working Correlation

Pan (2001) proposed the **quasi-information criterion (QIC)** as an analog of AIC for GEE, used to select the working correlation structure:

\[
\text{QIC}(\mathbf{R}) = -2\, \hat{Q}(\hat{\beta}_{\mathbf{R}}; \mathbf{I}) + 2\, \text{tr}(\hat{\boldsymbol{\Omega}}_{\mathbf{I}}^{-1} \hat{\mathbf{V}}_{\mathbf{R}})
\]

where \( \hat{Q}(\hat{\beta}; \mathbf{I}) \) is the independence quasi-likelihood evaluated at the GEE estimate, \( \hat{\boldsymbol{\Omega}}_{\mathbf{I}} \) is the model-based covariance under independence, and \( \hat{\mathbf{V}}_{\mathbf{R}} \) is the sandwich variance. Smaller QIC is preferred. A simplified version **QICu** is used for covariate selection holding the correlation structure fixed.

## 2.6 GEE2: Second-Order Estimating Equations

Standard GEE (first-order) estimates only \( \beta \); \( \alpha \) is treated as a nuisance. **GEE2** (Prentice, 1988; Zhao & Prentice, 1990) augments the GEE with a second set of estimating equations for the correlation parameters, treating \( \alpha \) as a parameter of genuine interest:

\[
\begin{pmatrix} \mathbf{U}_1(\beta, \alpha) \\ \mathbf{U}_2(\beta, \alpha) \end{pmatrix} = \mathbf{0}
\]

where \( \mathbf{U}_2 \) is derived from the second moments \( E[e_{ij} e_{ij'}] = \text{Cov}(Y_{ij}, Y_{ij'}) \). GEE2 is more efficient but loses robustness: validity of inference for \( \beta \) now requires correct specification of the third and fourth moments of \( Y_{ij} \).

## 2.7 Worked Example: GEE for a Binary Longitudinal Outcome

**Setting**: A two-arm clinical trial (\( n = 200 \)) measures a binary outcome (depression episode: yes/no) at 4 quarterly follow-up visits. Let \( Y_{ij} \in \{0,1\} \), \( T_i \in \{0 = \text{control}, 1 = \text{treatment}\} \), and \( t_j \in \{3, 6, 9, 12\} \) months.

**Marginal logistic model**:
\[
\text{logit}\, E[Y_{ij} \mid T_i, t_j] = \beta_0 + \beta_1 T_i + \beta_2 t_j
\]

**Fitted model** (exchangeable working correlation, \( \hat{\alpha} = 0.42 \)):

| Parameter | \( \hat{\beta} \) | Model SE | Sandwich SE | \( p \)-value |
|---|---|---|---|---|
| Intercept | \(-0.83\) | 0.14 | 0.17 | — |
| Treatment | \(-0.61\) | 0.19 | 0.24 | 0.011 |
| Time (months) | \(-0.04\) | 0.01 | 0.02 | 0.031 |

Note that the sandwich SE for treatment (0.24) exceeds the model-based SE (0.19) by 26%. Using model-based SEs would incorrectly narrow the confidence interval.

**Interpretation**: The estimated population-averaged odds of a depression episode are \( e^{-0.61} = 0.54 \) times lower in the treatment arm compared to control, adjusting for time.

---

# Chapter 3: Linear Mixed Effects Models

## 3.1 Motivation and Model Formulation

Linear mixed effects models (LMMs) are the workhorse of longitudinal data analysis for continuous outcomes. The key insight is to decompose variability into **population-level** (fixed effects) and **subject-level** (random effects) components.

### 3.1.1 Random Intercept Model

The simplest LMM introduces a subject-specific intercept:

\[
Y_{ij} = \beta_0 + b_i + \beta_1^T x_{ij} + \varepsilon_{ij}
\]

where:
- \( \beta_0, \beta_1 \) are **fixed effects** (population parameters)
- \( b_i \sim N(0, \sigma_b^2) \) is the **random intercept** for subject \( i \) (independent across subjects)
- \( \varepsilon_{ij} \sim N(0, \sigma^2) \) is the within-subject error (independent across \( i \) and \( j \), independent of \( b_i \))

The random intercept \( b_i \) captures stable subject-specific deviations from the population mean — a subject who is chronically higher or lower than average on the response.

The **induced marginal covariance** between two observations on the same subject is:
\[
\text{Cov}(Y_{ij}, Y_{ij'}) = \text{Var}(b_i) = \sigma_b^2, \quad j \neq j'
\]
\[
\text{Var}(Y_{ij}) = \sigma_b^2 + \sigma^2
\]
\[
\text{Corr}(Y_{ij}, Y_{ij'}) = \frac{\sigma_b^2}{\sigma_b^2 + \sigma^2} \equiv \rho
\]

This is exactly the **compound symmetry** (exchangeable) covariance structure. The intraclass correlation coefficient (ICC) \( \rho \) is the fraction of total variability attributable to between-subject differences.

### 3.1.2 Random Intercept and Slope Model

Extending to allow both intercept and slope to vary across subjects:

\[
Y_{ij} = (\beta_0 + b_{0i}) + (\beta_1 + b_{1i}) t_{ij} + \beta_2^T z_{ij} + \varepsilon_{ij}
\]

where \( \mathbf{b}_i = (b_{0i}, b_{1i})^T \sim N(\mathbf{0}, \mathbf{D}) \) with:
\[
\mathbf{D} = \begin{pmatrix} d_{11} & d_{12} \\ d_{12} & d_{22} \end{pmatrix}
\]

Now \( d_{11} = \text{Var}(b_{0i}) \) is the between-subject variance in baseline levels, \( d_{22} = \text{Var}(b_{1i}) \) is the between-subject variance in slopes, and \( d_{12} = \text{Cov}(b_{0i}, b_{1i}) \) captures whether subjects who start higher tend to change faster or slower.

The implied **marginal covariance** between \( Y_{ij} \) and \( Y_{ij'} \) is:
\[
\text{Cov}(Y_{ij}, Y_{ij'}) = d_{11} + d_{12}(t_{ij} + t_{ij'}) + d_{22}\, t_{ij} t_{ij'}, \quad j \neq j'
\]

This is no longer exchangeable — it depends on the actual times \( t_{ij} \) and \( t_{ij'} \).

## 3.2 Matrix Formulation

The general LMM for subject \( i \) in matrix form is:

\[
\mathbf{Y}_i = \mathbf{X}_i \boldsymbol{\beta} + \mathbf{Z}_i \mathbf{b}_i + \boldsymbol{\varepsilon}_i
\]

where:
- \( \mathbf{Y}_i \) is \( n_i \times 1 \)
- \( \mathbf{X}_i \) is \( n_i \times p \) (design matrix for fixed effects)
- \( \boldsymbol{\beta} \) is \( p \times 1 \) (fixed effects vector)
- \( \mathbf{Z}_i \) is \( n_i \times q \) (design matrix for random effects)
- \( \mathbf{b}_i \sim N_q(\mathbf{0}, \mathbf{D}) \) (random effects; \( q \times q \) covariance)
- \( \boldsymbol{\varepsilon}_i \sim N_{n_i}(\mathbf{0}, \boldsymbol{\Sigma}_i) \) (within-subject errors)
- \( \mathbf{b}_i \perp \boldsymbol{\varepsilon}_i \)

The **marginal distribution** of \( \mathbf{Y}_i \), obtained by integrating out \( \mathbf{b}_i \), is:

\[
\mathbf{Y}_i \sim N_{n_i}\!\left(\mathbf{X}_i \boldsymbol{\beta},\; \mathbf{Z}_i \mathbf{D} \mathbf{Z}_i^T + \boldsymbol{\Sigma}_i\right)
\]

Define \( \boldsymbol{\Omega}_i = \mathbf{Z}_i \mathbf{D} \mathbf{Z}_i^T + \boldsymbol{\Sigma}_i \). The **marginal log-likelihood** is:

\[
\ell(\boldsymbol{\beta}, \mathbf{D}, \boldsymbol{\Sigma}) = -\frac{1}{2}\sum_{i=1}^n \left[\log |\boldsymbol{\Omega}_i| + (\mathbf{Y}_i - \mathbf{X}_i\boldsymbol{\beta})^T \boldsymbol{\Omega}_i^{-1}(\mathbf{Y}_i - \mathbf{X}_i\boldsymbol{\beta})\right]
\]

## 3.3 Covariance Structures for Within-Subject Errors

The matrix \( \boldsymbol{\Sigma}_i \) models serial correlation among the residuals \( \boldsymbol{\varepsilon}_i \) after accounting for random effects. Common choices:

**Independent**: \( \boldsymbol{\Sigma}_i = \sigma^2 \mathbf{I}_{n_i} \). Standard assumption; adequate if random effects capture all correlation.

**AR(1)**: The \( (j,j') \) element of \( \boldsymbol{\Sigma}_i \) is \( \sigma^2 \rho^{|t_{ij}-t_{ij'}|} \). Adds decaying serial correlation on top of the random effects.

**Toeplitz**: \( (\boldsymbol{\Sigma}_i)_{jj'} = \sigma^2_{\min(j,j')} \) for a banded structure.

**Unstructured**: \( \boldsymbol{\Sigma}_i = \boldsymbol{\Sigma} \) (same for all subjects when balanced). Most flexible; \( m(m+1)/2 \) parameters.

In `nlme`, these are specified via `corAR1()`, `corCompSymm()`, `corSymm()` etc. within the `correlation` argument.

## 3.4 Best Linear Unbiased Prediction (BLUP)

<div class="definition">
<strong>BLUP</strong>: The <em>best linear unbiased predictor</em> of <em><strong>b</strong><sub>i</sub></em> is the conditional mean:
\[ \hat{\mathbf{b}}_i = \mathbf{D} \mathbf{Z}_i^T \boldsymbol{\Omega}_i^{-1}(\mathbf{Y}_i - \mathbf{X}_i \hat{\boldsymbol{\beta}}) \]
evaluated at the ML/REML estimates. It is "best" in the sense of minimizing mean squared error among all linear predictors that are unbiased for the realized <em><strong>b</strong><sub>i</sub></em>.
</div>

**Theorem (BLUP derivation)**: Under the joint normality of \( \mathbf{b}_i \) and \( \boldsymbol{\varepsilon}_i \), the conditional distribution of \( \mathbf{b}_i \) given \( \mathbf{Y}_i \) is:

\[
\mathbf{b}_i \mid \mathbf{Y}_i \sim N\!\left(\mathbf{D}\mathbf{Z}_i^T \boldsymbol{\Omega}_i^{-1}(\mathbf{Y}_i - \mathbf{X}_i\boldsymbol{\beta}),\; \mathbf{D} - \mathbf{D}\mathbf{Z}_i^T \boldsymbol{\Omega}_i^{-1}\mathbf{Z}_i\mathbf{D}\right)
\]

**Proof sketch**: Apply the multivariate normal conditional distribution formula to the joint distribution of \( (\mathbf{b}_i^T, \mathbf{Y}_i^T)^T \). The joint mean is \( (\mathbf{0}^T, (\mathbf{X}_i\boldsymbol{\beta})^T)^T \) and the joint covariance is:
\[
\begin{pmatrix} \mathbf{D} & \mathbf{D}\mathbf{Z}_i^T \\ \mathbf{Z}_i\mathbf{D} & \boldsymbol{\Omega}_i \end{pmatrix}
\]
The conditional mean formula gives \( E[\mathbf{b}_i \mid \mathbf{Y}_i] = \mathbf{D}\mathbf{Z}_i^T \boldsymbol{\Omega}_i^{-1}(\mathbf{Y}_i - \mathbf{X}_i\boldsymbol{\beta}) \). \( \square \)

The predicted value for subject \( i \) at time \( t \) is:
\[
\hat{Y}_i(t) = \mathbf{x}(t)^T \hat{\boldsymbol{\beta}} + \mathbf{z}(t)^T \hat{\mathbf{b}}_i
\]

This is the **empirical Bayes** (EB) predictor when the random effects distribution is treated as a prior.

## 3.5 Estimation: ML vs. REML

### 3.5.1 Maximum Likelihood (ML)

ML maximizes the marginal log-likelihood simultaneously over \( (\boldsymbol{\beta}, \mathbf{D}, \boldsymbol{\Sigma}) \). The ML estimator of \( \boldsymbol{\beta} \) is:
\[
\hat{\boldsymbol{\beta}}_{\text{ML}} = \left(\sum_i \mathbf{X}_i^T \hat{\boldsymbol{\Omega}}_i^{-1} \mathbf{X}_i\right)^{-1} \sum_i \mathbf{X}_i^T \hat{\boldsymbol{\Omega}}_i^{-1} \mathbf{Y}_i
\]
(generalized least squares). ML variance component estimates are **biased downward** because they do not account for the \( p \) degrees of freedom used in estimating \( \boldsymbol{\beta} \).

### 3.5.2 Restricted Maximum Likelihood (REML)

REML (Patterson & Thompson, 1971) corrects the ML bias by maximizing a **restricted likelihood** that is constructed from \( n-p \) orthogonal contrasts of \( \mathbf{Y} \) that are free of \( \boldsymbol{\beta} \):

**Theorem (REML likelihood)**: The REML log-likelihood is:
\[
\ell_R(\mathbf{D}, \boldsymbol{\Sigma}) = -\frac{1}{2}\sum_i \log|\boldsymbol{\Omega}_i| - \frac{1}{2}\log\left|\sum_i \mathbf{X}_i^T \boldsymbol{\Omega}_i^{-1}\mathbf{X}_i\right| - \frac{1}{2}\sum_i (\mathbf{Y}_i - \mathbf{X}_i\tilde{\boldsymbol{\beta}})^T \boldsymbol{\Omega}_i^{-1}(\mathbf{Y}_i - \mathbf{X}_i\tilde{\boldsymbol{\beta}})
\]
where \( \tilde{\boldsymbol{\beta}} \) is the GLS estimator. The extra term \( -\frac{1}{2}\log|\sum_i \mathbf{X}_i^T \boldsymbol{\Omega}_i^{-1}\mathbf{X}_i| \) accounts for the uncertainty in \( \boldsymbol{\beta} \), analogous to dividing by \( n-p \) instead of \( n \) in sample variance.

**Key rules for REML vs. ML**:
1. Use **REML** to estimate variance components \( (\mathbf{D}, \boldsymbol{\Sigma}) \) — it is less biased than ML.
2. Use **ML** (not REML) for likelihood ratio tests comparing **fixed effects** between nested models with the same covariance structure, because the REML likelihoods are not comparable when the fixed effect design matrix changes.
3. Use **REML** for likelihood ratio tests comparing **covariance structures** with the same fixed effects.

---

# Chapter 4: Inference in Linear Mixed Models

## 4.1 Likelihood Ratio Tests

A **likelihood ratio test** (LRT) comparing a reduced model \( M_0 \) (with \( q_0 \) parameters) against a full model \( M_1 \) (with \( q_1 > q_0 \) parameters) uses the test statistic:

\[
\Lambda = 2[\ell(\hat{\theta}_1) - \ell(\hat{\theta}_0)] \xrightarrow{d} \chi^2_{q_1 - q_0} \quad \text{under } H_0
\]

**Critical caveat for variance components**: When \( H_0 \) places a variance component on the boundary of its parameter space (e.g., \( H_0: \sigma_b^2 = 0 \)), the standard \( \chi^2 \) distribution is **not** the correct null distribution. The correct distribution is a 50:50 mixture of \( \chi^2_0 \) (a point mass at zero) and \( \chi^2_1 \), yielding a conservative test if the standard \( \chi^2_1 \) critical value is used. More generally, testing \( q \) variance components on the boundary gives a mixture of \( \chi^2_j \) for \( j = 0, \ldots, q \).

## 4.2 F-Tests with Finite-Sample Degrees of Freedom

The \( \chi^2 \) distribution is an asymptotic approximation. For moderate sample sizes, **F-tests** are preferred. The challenge is determining the denominator degrees of freedom (ddf) for the F-statistic, because the effective sample size for a mixed model is neither \( n \) (number of subjects) nor \( N \) (total observations).

**Satterthwaite approximation** (1946): Approximates the distribution of a quadratic form in the estimated covariance matrix by matching the first two moments to a scaled \( \chi^2 \) distribution. Implemented in `lmerTest::anova()` with `ddf = "Satterthwaite"`.

**Kenward-Roger correction** (1997): A more sophisticated approach that also inflates the estimated covariance matrix of \( \hat{\boldsymbol{\beta}} \) to account for the variability in estimated variance components. More accurate than Satterthwaite, especially with small \( n \). Implemented via `pbkrtest` package.

## 4.3 Parametric Bootstrap for LRT

When the asymptotic distribution of the LRT statistic is unreliable (e.g., boundary testing, small \( n \)), the **parametric bootstrap** provides a valid finite-sample \( p \)-value:

1. Fit \( M_0 \) and \( M_1 \); compute observed \( \Lambda_{\text{obs}} \).
2. For \( b = 1, \ldots, B \) (e.g., \( B = 1000 \)):
   a. Simulate \( \mathbf{Y}^{(b)} \) from \( M_0 \) using the fitted parameters.
   b. Fit both \( M_0 \) and \( M_1 \) to \( \mathbf{Y}^{(b)} \); compute \( \Lambda^{(b)} \).
3. Bootstrap \( p \)-value: \( \hat{p} = \frac{1}{B}\sum_b \mathbf{1}(\Lambda^{(b)} \geq \Lambda_{\text{obs}}) \).

Implemented in `pbkrtest::PBmodcomp()`.

## 4.4 Profile Likelihood Confidence Intervals

For scalar parameters (especially variance components), **profile likelihood CIs** are more accurate than Wald intervals, particularly when the parameter is near a boundary.

The profile log-likelihood for \( \theta_k \) (the \( k \)-th element of \( \theta \)) is:
\[
\ell_P(\theta_k) = \max_{\theta_{-k}} \ell(\theta_k, \theta_{-k})
\]

A 95% CI is \( \{\theta_k : 2[\ell(\hat{\theta}) - \ell_P(\theta_k)] \leq \chi^2_{1, 0.95}\} \). In `lme4`, `confint(model, method = "profile")` computes these intervals.

## 4.5 Information Criteria for LMMs

**Akaike Information Criterion (AIC)**:
\[
\text{AIC} = -2\ell(\hat{\theta}) + 2k
\]

**Bayesian Information Criterion (BIC)**:
\[
\text{BIC} = -2\ell(\hat{\theta}) + k\log(n^*)
\]

where \( k \) is the number of estimated parameters and \( n^* \) is the effective sample size (use \( n \) = number of subjects for BIC in LMMs, not total \( N \)). BIC penalizes complexity more heavily and is consistent (selects the true model as \( n \to \infty \)) when the true model is in the candidate set.

**Important**: AIC and BIC from REML fits can only be compared across models with **identical fixed effects** structure. Comparing covariance structures with different fixed effects requires ML-based AIC/BIC.

## 4.6 Checking LMM Assumptions

### 4.6.1 Residual Diagnostics

**Marginal residuals**: \( \hat{\mathbf{e}}_i = \mathbf{Y}_i - \mathbf{X}_i\hat{\boldsymbol{\beta}} \)

**Conditional residuals**: \( \hat{\boldsymbol{\varepsilon}}_i = \mathbf{Y}_i - \mathbf{X}_i\hat{\boldsymbol{\beta}} - \mathbf{Z}_i\hat{\mathbf{b}}_i \)

Check for:
- **Normality of conditional residuals**: QQ-plot; Shapiro-Wilk test.
- **Homoscedasticity**: Plot conditional residuals vs. fitted values \( \hat{Y}_i(t) \); should show no fan shape.
- **Linearity**: Residuals vs. individual covariates; residuals vs. time.
- **Influential observations**: Cook's distance analog for LMMs.

### 4.6.2 Random Effects Diagnostics

The BLUP estimates \( \hat{\mathbf{b}}_i \) should approximate a normal distribution. Check:
- QQ-plots of each component of \( \hat{\mathbf{b}}_i \) across subjects.
- Scatter plot of \( \hat{b}_{0i} \) vs. \( \hat{b}_{1i} \) for random intercept-slope models (should be elliptical).

### 4.6.3 Worked Example: REML Estimation

**Data**: \( n = 50 \) subjects, each measured \( n_i = 4 \) times at \( t \in \{0, 1, 2, 3\} \). Random intercept model with one binary covariate \( x_i \) (treatment).

**Model**: \( Y_{ij} = \beta_0 + \beta_1 x_i + \beta_2 t_j + b_i + \varepsilon_{ij} \)

**Fitting in R**:
```r
library(lme4)
fit <- lmer(Y ~ treatment + time + (1 | subject), data = dat, REML = TRUE)
summary(fit)
```

**Hypothetical REML output**:

| Parameter | Estimate | Std. Error |
|---|---|---|
| \(\hat{\beta}_0\) (Intercept) | 5.21 | 0.31 |
| \(\hat{\beta}_1\) (Treatment) | 1.83 | 0.40 |
| \(\hat{\beta}_2\) (Time) | \(-0.47\) | 0.08 |
| \(\hat{\sigma}_b^2\) (Random intercept) | 1.94 | — |
| \(\hat{\sigma}^2\) (Residual) | 0.86 | — |
| ICC \(\hat{\rho}\) | \(1.94/(1.94+0.86) = 0.69\) | — |

The high ICC (0.69) confirms that ignoring within-subject correlation (e.g., using OLS) would severely underestimate standard errors for between-subject effects like treatment.

---

# Chapter 5: Generalized Linear Mixed Models

## 5.1 From LMMs to GLMMs

Generalized linear mixed models (GLMMs) extend LMMs to non-Gaussian outcomes (binary, count, ordinal) by combining a **random effects** specification with a **GLM link function**.

<div class="definition">
<strong>GLMM formulation</strong>: Conditional on the random effect <em><strong>b</strong><sub>i</sub> ~ N<sub>q</sub>(<strong>0</strong>, <strong>D</strong>)</em>, the responses <em>Y<sub>ij</sub> | <strong>b</strong><sub>i</sub></em> are independent with conditional mean:
<br><br>
<em>g(E[Y<sub>ij</sub> | <strong>b</strong><sub>i</sub>, x<sub>ij</sub>]) = x<sub>ij</sub><sup>T</sup>&beta; + z<sub>ij</sub><sup>T</sup><strong>b</strong><sub>i</sub></em>
<br><br>
where <em>g(&middot;)</em> is the link function. Given <em><strong>b</strong><sub>i</sub></em>, each <em>Y<sub>ij</sub></em> follows an exponential family distribution with natural parameter determined by the conditional mean.
</div>

Examples:
- **Binary outcome**: \( Y_{ij} | b_i \sim \text{Bernoulli}(\pi_{ij}) \), logit link: \( \text{logit}(\pi_{ij}) = x_{ij}^T\beta + b_i \)
- **Count outcome**: \( Y_{ij} | b_i \sim \text{Poisson}(\mu_{ij}) \), log link: \( \log(\mu_{ij}) = x_{ij}^T\beta + b_i \)
- **Overdispersed count**: Add observation-level random effects or use negative binomial distribution

## 5.2 Subject-Specific vs. Population-Averaged Interpretation

In the logistic GLMM, the conditional probability for subject \( i \) is:
\[
P(Y_{ij} = 1 \mid b_i, x_{ij}) = \frac{\exp(x_{ij}^T\beta + b_i)}{1 + \exp(x_{ij}^T\beta + b_i)}
\]

The **marginal (population-averaged)** probability requires integrating over \( b_i \):
\[
P(Y_{ij} = 1 \mid x_{ij}) = \int \frac{\exp(x_{ij}^T\beta + b)}{1 + \exp(x_{ij}^T\beta + b)} \phi(b; 0, \sigma_b^2)\, db
\]

This integral does **not** have a closed form. However, an approximation (Zeger, Liang & Albert, 1988) gives:
\[
\text{logit}\, P(Y_{ij} = 1 \mid x_{ij}) \approx \frac{x_{ij}^T\beta}{\sqrt{1 + c^2 \sigma_b^2}}
\]
where \( c = 16\sqrt{3}/(15\pi) \approx 0.588 \). The **attenuation factor** \( (1 + c^2\sigma_b^2)^{-1/2} < 1 \) means the marginal odds ratio \( \exp(\beta_k/(1+c^2\sigma_b^2)^{1/2}) \) is smaller in magnitude than the subject-specific odds ratio \( \exp(\beta_k) \).

**Practical implication**: A logistic GLMM coefficient \( \beta_k = 1.0 \) with \( \sigma_b^2 = 2.0 \) corresponds to a **subject-specific** log-odds ratio of 1.0 but a **population-averaged** log-odds ratio of approximately \( 1.0/\sqrt{1 + 0.346} \approx 0.85 \). This distinction must be communicated clearly in applied reporting.

## 5.3 Estimation Methods for GLMMs

The marginal likelihood requires integrating out the random effects:
\[
L(\beta, \mathbf{D}) = \prod_{i=1}^n \int \left[\prod_{j=1}^{n_i} f(y_{ij} \mid b_i, \beta)\right] \phi(\mathbf{b}_i; \mathbf{0}, \mathbf{D})\, d\mathbf{b}_i
\]

Unlike the LMM, this integral is analytically intractable for non-Gaussian outcomes.

### 5.3.1 Laplace Approximation

The Laplace approximation replaces the integrand with a Gaussian approximation centered at the mode of the integrand (the BLUP \( \hat{\mathbf{b}}_i \)):

\[
\int g(\mathbf{b})\, d\mathbf{b} \approx (2\pi)^{q/2} |\hat{\mathbf{H}}|^{-1/2} g(\hat{\mathbf{b}})
\]

where \( \hat{\mathbf{H}} = -\frac{\partial^2 \log g}{\partial\mathbf{b}\partial\mathbf{b}^T}\big|_{\mathbf{b}=\hat{\mathbf{b}}} \) is the negative Hessian. The Laplace approximation is exact for Gaussian integrands and accurate when the integrand is approximately symmetric and not too flat. It has error \( O(n_i^{-1}) \).

This is the default in `lme4::glmer()`.

### 5.3.2 Gauss-Hermite Quadrature (GHQ)

GHQ approximates the one-dimensional integral \( \int f(b) \phi(b)\, db \approx \sum_{k=1}^K w_k f(z_k) \) using \( K \) quadrature points \( z_k \) with weights \( w_k \) determined by the Gauss-Hermite rule. For scalar random effects (\( q = 1 \)), GHQ with \( K \geq 15 \) is highly accurate.

For \( q > 1 \), the \( q \)-dimensional integral requires \( K^q \) evaluations (tensor product), which becomes computationally prohibitive for \( q > 3 \). **Adaptive GHQ** relocates quadrature points to the mode (like Laplace) and rescales by the curvature, achieving higher accuracy with fewer points.

### 5.3.3 Penalized Quasi-Likelihood (PQL)

PQL (Breslow & Clayton, 1993) treats the random effects as fixed "working" variables and fits a linear mixed model to a working response. It is fast but introduces bias in the variance component estimates, particularly severe for:
- Binary data with \( n_i \) small (cluster sizes \( < 5 \))
- Counts with low mean (\( < 5 \))

PQL is implemented in `MASS::glmmPQL()`. Its results should be treated with caution unless validated against Laplace or GHQ.

## 5.4 Worked Example: Random Effects Logistic Regression

**Study**: Longitudinal study of respiratory illness in children (\( n = 111 \), \( n_i = 4 \) visits). Binary outcome \( Y_{ij} = 1 \) if respiratory illness present. Covariates: \( \text{age}_{ij} \) (centered), \( \text{smoke}_i \) (maternal smoking at baseline), \( \text{gender}_i \).

**GLMM**:
\[
\text{logit}\, P(Y_{ij} = 1 \mid b_i) = \beta_0 + \beta_1 \text{age}_{ij} + \beta_2 \text{smoke}_i + \beta_3 \text{gender}_i + b_i
\]

**Fitted model** (Laplace approximation via `lme4::glmer`):

| Parameter | Estimate | SE | OR (95% CI) |
|---|---|---|---|
| Intercept | \(-1.21\) | 0.29 | — |
| Age | \(-0.18\) | 0.06 | 0.84 (0.74, 0.94) |
| Maternal smoking | \(0.73\) | 0.34 | 2.07 (1.06, 4.05) |
| Female (vs. male) | \(-0.40\) | 0.31 | 0.67 (0.37, 1.23) |
| \(\hat{\sigma}_b\) | 1.63 | — | — |

**Interpretation**: The subject-specific odds of respiratory illness decrease by 16% per year of age (OR = 0.84). Children of maternal smokers have approximately twice the subject-specific odds of illness. The large \( \hat{\sigma}_b = 1.63 \) (\( \hat{\sigma}_b^2 = 2.66 \)) indicates substantial heterogeneity across children.

**Attenuation**: The population-averaged smoking effect is approximately \( \exp(0.73/\sqrt{1 + 0.346 \times 2.66}) \approx \exp(0.73/1.45) \approx \exp(0.50) \approx 1.65 \), smaller than the subject-specific OR of 2.07.

---

# Chapter 6: Missing Data in Longitudinal Studies

## 6.1 Patterns of Missing Data

Missing data in longitudinal studies arises primarily through subject dropout, which creates two distinct patterns:

<div class="definition">
<strong>Monotone missingness</strong>: Subject <em>i</em> has complete data up to time <em>t<sub>i,d<sub>i</sub></sub></em> and then drops out, with <em>Y<sub>ij</sub></em> missing for all <em>j > d<sub>i</sub></em>. This is the most common pattern in clinical trials (subjects withdraw and do not return).
</div>

<div class="definition">
<strong>Intermittent missingness</strong>: Subject <em>i</em> misses some visits but later returns, so the missing data pattern is non-monotone. Common in observational studies and cohort studies with irregular attendance.
</div>

In practice, most longitudinal datasets have a mixture of both patterns. The statistical handling depends critically on the **mechanism** of missingness.

## 6.2 Missing Data Mechanisms

The taxonomy of Rubin (1976) classifies missing data by the relationship between missingness and the data values.

Let \( R_{ij} = 1 \) if \( Y_{ij} \) is observed and \( R_{ij} = 0 \) otherwise. Denote \( \mathbf{Y}_i^{\text{obs}} \) and \( \mathbf{Y}_i^{\text{mis}} \) as the observed and missing components.

<div class="definition">
<strong>Missing Completely At Random (MCAR)</strong>: The probability of missingness does not depend on observed or missing data values:
<br><br>
<em>P(R<sub>ij</sub> = 0 | Y<sub>i</sub><sup>obs</sup>, Y<sub>i</sub><sup>mis</sup>, x<sub>i</sub>) = P(R<sub>ij</sub> = 0)</em>
<br><br>
Example: A random subsample of observations is discarded due to laboratory equipment failure.
</div>

<div class="definition">
<strong>Missing At Random (MAR)</strong>: The probability of missingness depends only on observed data, not on the missing values themselves:
<br><br>
<em>P(R<sub>ij</sub> = 0 | Y<sub>i</sub><sup>obs</sup>, Y<sub>i</sub><sup>mis</sup>, x<sub>i</sub>) = P(R<sub>ij</sub> = 0 | Y<sub>i</sub><sup>obs</sup>, x<sub>i</sub>)</em>
<br><br>
Example: Patients with high depression scores at the <em>previous</em> visit (observed) are more likely to drop out — but dropout does not additionally depend on what their score <em>would have been</em> at the current visit.
</div>

<div class="definition">
<strong>Missing Not At Random (MNAR)</strong>: The probability of missingness depends on the missing values even after conditioning on observed data. Also called <em>informative dropout</em> or <em>non-ignorable missingness</em>.
<br><br>
Example: Patients drop out <em>because</em> their current disease severity (which we do not observe) has worsened. The missingness mechanism is directly tied to the unobserved outcome.
</div>

**Why it matters**: Under MCAR and MAR, valid inference can be obtained using the observed data (with appropriate methods). Under MNAR, the standard likelihood and GEE analyses are biased and no fully satisfactory general solution exists.

## 6.3 Ad Hoc Methods and Their Limitations

### 6.3.1 Complete Case Analysis (CCA)

**Method**: Discard all subjects with any missing observations; analyze only those with complete data.

**Validity**: Strictly valid only under MCAR. Under MAR, the complete cases are a biased sample: subjects who remain observed throughout the study are systematically different from those who drop out.

**When MAR dropout is related to treatment**: In a depression trial, patients in the control arm who worsen (high depression scores on observed visits) are more likely to drop out than patients in the treatment arm. The complete-case means in the two arms will be biased, with control arm dropouts (who would have scored high) excluded.

### 6.3.2 Last Observation Carried Forward (LOCF)

**Method**: Impute \( Y_{ij}^{\text{mis}} = Y_{i, d_i} \) (the last observed value before dropout).

**Validity**: LOCF is valid only if the outcome is truly constant after the last observation — an assumption that is almost always false and particularly implausible in treatment studies where response continues to evolve. LOCF tends to:
- Attenuate treatment effects (if treatment response continues to improve post-dropout)
- Underestimate variability

LOCF is now discouraged in regulatory guidance (e.g., FDA 2019 guidance on missing data) but remains common in practice.

## 6.4 Inverse Probability Weighting (IPW) Under MAR

IPW reweights the observed data by the inverse probability of being observed, creating a **pseudo-population** in which missingness is unrelated to the outcome.

Let \( \pi_{ij} = P(R_{ij} = 1 \mid \mathbf{Y}_i^{\text{obs}}, x_i) \) be the probability that subject \( i \) is observed at time \( j \). The IPW estimating equation is:

\[
\sum_{i=1}^n \sum_{j=1}^{n_i} \frac{R_{ij}}{\hat{\pi}_{ij}} \mathbf{D}_{ij}^T V_{ij}^{-1}(Y_{ij} - \mu_{ij}(\beta)) = \mathbf{0}
\]

The weights \( \hat{\pi}_{ij}^{-1} \) upweight observations from subjects who were "unlikely to be observed" (and thus represent both themselves and similar subjects who dropped out).

**Estimation of weights**: For monotone dropout, fit a logistic regression for the probability of dropout at each visit given the dropout history and observed outcomes:
\[
\text{logit}\, P(R_{ij} = 0 \mid R_{i,j-1} = 1, \mathbf{Y}_i^{\text{obs}}_{\lt j}, x_i) = \gamma_0 + \gamma_1 Y_{i,j-1} + \gamma^T x_i
\]

The cumulative probability of remaining observed up to time \( j \) is:
\[
\pi_{ij} = \prod_{k=1}^{j} P(R_{ik} = 1 \mid R_{i,k-1} = 1, \ldots)
\]

**Doubly robust estimators** combine IPW with direct likelihood modeling; they are consistent if either the dropout model or the outcome model is correctly specified (but not necessarily both).

## 6.5 Direct Likelihood Under MAR

Under MAR with a correctly specified parametric model for the observed data, **full likelihood** analysis based on the marginal distribution of observed responses is valid. The key result (Rubin 1976; Little & Rubin 2002) is that under MAR, the missing data mechanism is **ignorable** — we do not need to model \( P(R \mid Y) \) to obtain valid inference for the response model parameters.

For the LMM, this means: fitting the mixed model by ML/REML using all available data (including subjects with incomplete observations) under MAR gives consistent estimates of \( \boldsymbol{\beta} \), \( \mathbf{D} \), and \( \boldsymbol{\Sigma} \).

This is a significant advantage of likelihood-based LMMs over CCA: **subjects who drop out still contribute information** from their observed time points.

## 6.6 Selection Models and Pattern-Mixture Models

Two model-based frameworks for MNAR:

**Selection models** (Diggle & Kenward, 1994): Factor the joint distribution of outcomes and dropout indicator as:
\[
f(Y_i, R_i \mid x_i) = f(Y_i \mid x_i) \cdot f(R_i \mid Y_i, x_i)
\]
Model the outcome process first, then the dropout mechanism given the (potentially unobserved) outcomes. The challenge is that parameters in the dropout model are not identifiable from the observed data without strong assumptions.

**Pattern-mixture models** (Little, 1993): Factor as:
\[
f(Y_i, R_i \mid x_i) = f(Y_i \mid R_i, x_i) \cdot f(R_i \mid x_i)
\]
Model the outcome distribution separately within each dropout pattern and average over patterns. Identification requires restrictions on the unobservable conditional distributions \( f(Y_i^{\text{mis}} \mid Y_i^{\text{obs}}, R_i, x_i) \).

## 6.7 Sensitivity Analysis for MNAR

Since MNAR assumptions are untestable from the data, sensitivity analysis is essential. Common approaches:

**Tipping point analysis**: Vary the MNAR assumption (e.g., the difference \( E[Y^{\text{mis}}] - E[Y^{\text{obs}}]\) among dropouts) and find the value at which the conclusion changes. If this value is clinically implausible, the result is robust.

**Reference-based imputation** (Carpenter, Roger & Kenward, 2013): Impute missing values using parameters from a reference arm (e.g., the control arm or a "return to baseline" assumption). This implements clinically motivated sensitivity scenarios.

**Delta-adjustment**: Add a constant \( \delta \) to all imputed values in the treatment arm and vary \( \delta \) over a plausible range.

---

# Chapter 7: Multiple Imputation and Advanced Topics

## 7.1 Rubin's Multiple Imputation Framework

**Multiple imputation** (MI; Rubin 1987) is a simulation-based procedure for handling missing data. It generates \( m \) complete datasets by drawing plausible values for missing observations from the posterior predictive distribution, fitting the analysis model to each complete dataset, and then combining the results.

### 7.1.1 The Three Phases

**Phase 1 — Imputation**: Draw \( m \) imputed datasets. For imputation \( l \):
\[
Y_{ij}^{(l),\text{mis}} \sim P(Y_{ij}^{\text{mis}} \mid \mathbf{Y}_i^{\text{obs}}, x_i)
\]

**Phase 2 — Analysis**: Apply the complete-data analysis to each imputed dataset to obtain \( \hat{Q}_l \) (estimate) and \( \hat{W}_l \) (within-imputation variance) for \( l = 1, \ldots, m \).

**Phase 3 — Pooling** (Rubin's rules):

<div class="definition">
<strong>Rubin's combining rules</strong>: The pooled estimate is the arithmetic mean of the <em>m</em> complete-data estimates:
<br><br>
<em>Q&#772; = m<sup>-1</sup> &sum;<sub>l=1</sub><sup>m</sup> Q&#770;<sub>l</sub></em>
<br><br>
The total variance combines within-imputation variance <em>W&#772;</em> and between-imputation variance <em>B</em>:
<br><br>
<em>W&#772; = m<sup>-1</sup> &sum;<sub>l=1</sub><sup>m</sup> W&#770;<sub>l</sub></em>
<br><br>
<em>B = (m-1)<sup>-1</sup> &sum;<sub>l=1</sub><sup>m</sup> (Q&#770;<sub>l</sub> - Q&#772;)<sup>2</sup></em>
<br><br>
<em>T = W&#772; + (1 + m<sup>-1</sup>)B</em>
<br><br>
The term <em>(1 + m<sup>-1</sup>)B</em> accounts for the simulation variability from using a finite number of imputations.
</div>

Inference uses \( (Q&#772; - Q)/\sqrt{T} \sim t_\nu \) where the degrees of freedom is:
\[
\nu = (m-1)\left(1 + \frac{\bar{W}}{(1+m^{-1})B}\right)^2
\]

### 7.1.2 The Fraction of Missing Information

The **fraction of missing information** (FMI) measures how much the missing data inflates variance:
\[
\lambda = \frac{(1 + m^{-1})B}{T}
\]

The relative efficiency of using \( m \) imputations compared to \( m = \infty \) is \( (1 + \lambda/m)^{-1} \). A common guideline (Rubin 1987): \( m = 5\text{–}10 \) is sufficient when FMI \( < 30\% \); for high FMI (\( > 50\% \)), \( m = 50\text{–}100 \) is recommended.

### 7.1.3 Worked Numerical Example

**Setting**: \( m = 5 \) imputations, estimating a treatment effect \( Q = \beta_{\text{trt}} \).

Complete-data estimates from each imputed dataset:

| \( l \) | \( \hat{Q}_l \) | \( \hat{W}_l \) |
|---|---|---|
| 1 | 2.31 | 0.18 |
| 2 | 2.08 | 0.21 |
| 3 | 2.45 | 0.19 |
| 4 | 2.19 | 0.17 |
| 5 | 2.27 | 0.20 |

**Pooled estimate**: \( \bar{Q} = (2.31 + 2.08 + 2.45 + 2.19 + 2.27)/5 = 11.30/5 = 2.26 \)

**Within-imputation variance**: \( \bar{W} = (0.18+0.21+0.19+0.17+0.20)/5 = 0.19 \)

**Between-imputation variance**:
\[
B = \frac{1}{4}\sum_{l=1}^5 (\hat{Q}_l - 2.26)^2 = \frac{(0.05)^2+(0.18)^2+(0.19)^2+(0.07)^2+(0.01)^2}{4} = \frac{0.0025+0.0324+0.0361+0.0049+0.0001}{4} = \frac{0.076}{4} = 0.019
\]

**Total variance**: \( T = 0.19 + (1 + 0.2) \times 0.019 = 0.19 + 0.0228 = 0.213 \)

**95% CI**: \( 2.26 \pm t_{0.975,\nu}\sqrt{0.213} \approx 2.26 \pm 1.96 \times 0.46 = (1.36, 3.16) \)

**FMI**: \( \lambda = 0.0228/0.213 = 0.107 \), i.e., about 11% of variance is due to missing data.

## 7.2 Fully Conditional Specification (FCS/MICE)

**Fully Conditional Specification** (FCS), also known as **Multiple Imputation by Chained Equations (MICE)**, is the dominant practical approach to MI for multivariate incomplete data.

Rather than specifying a joint model for all variables (which may be difficult), FCS imputes each incomplete variable from its **full conditional distribution** given all other variables:

1. Initialize missing values with simple imputes (e.g., mean imputation).
2. For each incomplete variable \( V_k \), \( k = 1, \ldots, K \):
   a. Specify a regression model: \( V_k \sim f(V_k \mid V_{-k}^{\text{obs}}, x) \)
   b. Draw from the posterior predictive distribution: \( V_k^{(l),\text{mis}} \sim P(V_k \mid V_{-k}, x, \hat{\theta}_k) \)
3. Cycle through all \( K \) variables (one pass = one **iteration** or **sweep**).
4. Repeat for \( T \) iterations (typically 10–50) to allow the chain to converge; save the final imputed dataset as one imputed dataset.
5. Repeat steps 1–4 \( m \) times to generate \( m \) imputed datasets.

**Model choices by variable type**:
- Continuous: Linear regression (predictive mean matching for robustness to non-normality)
- Binary: Logistic regression
- Ordinal: Proportional odds model
- Count: Poisson regression
- Categorical: Multinomial logit

**Diagnostic checks for MI**:
- Trace plots of imputed means and variances across iterations (should converge within 10–20 iterations)
- Density plots overlaying observed and imputed values (imputed values should have similar distribution to observed, not identical — especially if MAR assumption involves differences)
- Convergence of pooled estimates across \( m \)

```r
library(mice)
imp <- mice(dat, m = 20, method = "pmm", seed = 123)
fits <- with(imp, lm(Y ~ treatment + time + age))
pool(fits)
summary(pool(fits))
```

## 7.3 Transition Models for Longitudinal Categorical Data

**Transition models** (also called **Markov models** for longitudinal data) specify the conditional distribution of \( Y_{ij} \) given the history of previous responses.

For a **first-order Markov model**:
\[
P(Y_{ij} = y \mid Y_{i,j-1}, Y_{i,j-2}, \ldots, x_{ij}) = P(Y_{ij} = y \mid Y_{i,j-1}, x_{ij})
\]

For a **binary outcome**, the first-order transition model is:
\[
\text{logit}\, P(Y_{ij} = 1 \mid Y_{i,j-1}, x_{ij}) = \alpha_0 + \alpha_1 Y_{i,j-1} + \beta^T x_{ij}
\]

Here \( \alpha_1 \) is the **transition parameter**: the log-odds ratio for being in state 1 at time \( j \) given state 1 at time \( j-1 \) vs. state 0. The covariate effects \( \beta \) have **conditional** interpretations: they describe the effect of \( x \) on the transition probability, holding the previous state fixed.

**Estimation**: Standard logistic regression, treating \( Y_{i,j-1} \) as a covariate. The "data" for the transition model consists of adjacent pairs \( (Y_{i,j-1}, Y_{ij}) \) for \( j \geq 2 \).

**Stationary distribution**: Under a first-order homogeneous Markov chain, the long-run probability of state 1 is:
\[
\pi^* = \frac{P(Y_{ij}=1 \mid Y_{i,j-1}=0)}{P(Y_{ij}=0 \mid Y_{i,j-1}=1) + P(Y_{ij}=1 \mid Y_{i,j-1}=0)}
\]

## 7.4 Introduction to Survival Data

In the second half of the course, the outcome is a **time to event** \( T > 0 \). Key features distinguishing survival data from standard continuous outcomes:

1. **Censoring**: Many subjects have not yet experienced the event by the end of follow-up. For right-censored data, we observe \( \tilde{T}_i = \min(T_i, C_i) \) and indicator \( \Delta_i = \mathbf{1}(T_i \leq C_i) \), where \( C_i \) is the censoring time.

2. **Non-negativity**: \( T > 0 \); normal distribution is inappropriate.

3. **Skewness**: Event times are typically right-skewed.

<div class="definition">
<strong>Survival function</strong>: <em>S(t) = P(T > t)</em>, the probability of surviving (not experiencing the event) beyond time <em>t</em>. A non-increasing function with <em>S(0) = 1</em> and <em>S(&infin;) = 0</em>.
</div>

<div class="definition">
<strong>Hazard function</strong>: The instantaneous rate of the event at time <em>t</em>, given survival to <em>t</em>:
<br><br>
<em>h(t) = lim<sub>&Delta;t&rarr;0</sub> P(t &le; T < t + &Delta;t | T &ge; t) / &Delta;t = f(t)/S(t)</em>
<br><br>
The hazard is non-negative but not bounded above. The cumulative hazard is <em>H(t) = &int;<sub>0</sub><sup>t</sup> h(s) ds</em> and <em>S(t) = exp(-H(t))</em>.
</div>

Common parametric families:

**Exponential**: \( h(t) = \lambda \) (constant hazard). Simple but rigid.

**Weibull**: \( h(t) = \lambda \kappa t^{\kappa - 1} \) with shape \( \kappa \). Reduces to exponential when \( \kappa = 1 \); increasing hazard when \( \kappa > 1 \) (e.g., aging processes); decreasing when \( \kappa < 1 \) (e.g., post-surgical recovery).

**Log-normal**: \( T \sim \text{Lognormal}(\mu, \sigma^2) \). Non-monotone hazard (increases then decreases); used for some cancer survival applications.

**Log-logistic**: Closed-form survivor function; used for accelerated failure time (AFT) models.

## 7.5 Discrete Failure Time Models

When event times are recorded in discrete intervals (e.g., quarterly medical examinations), the **discrete hazard** is:

\[
\lambda_j = P(T = t_j \mid T \geq t_j)
\]

The **complementary log-log model** (grouped continuous hazard):
\[
\log(-\log(1 - \lambda_j)) = \alpha_j + \beta^T x
\]
This arises naturally as the discrete-time analog of the continuous proportional hazards model: if the continuous hazard is \( h(t; x) = h_0(t)\exp(\beta^T x) \), then grouping into intervals gives the complementary log-log form.

The **logistic model** for discrete hazard:
\[
\text{logit}(\lambda_j) = \alpha_j + \beta^T x
\]
Here \( \exp(\beta_k) \) is the odds ratio for the discrete hazard comparing two covariate groups; this does not correspond to a proportional hazards model for continuous time.

## 7.6 Nonparametric and Semiparametric Methods

### 7.6.1 Kaplan-Meier Estimator

The **Kaplan-Meier (KM) product-limit estimator** is the nonparametric MLE of the survival function:

\[
\hat{S}(t) = \prod_{j: t_{(j)} \leq t} \left(1 - \frac{d_j}{n_j}\right)
\]

where \( t_{(1)} < t_{(2)} < \cdots \) are the ordered event times, \( d_j \) is the number of events at \( t_{(j)} \), and \( n_j \) is the number at risk just before \( t_{(j)} \) (those who have not yet experienced the event and have not been censored).

**Greenwood's formula** for the variance:
\[
\widehat{\text{Var}}[\hat{S}(t)] = [\hat{S}(t)]^2 \sum_{j: t_{(j)} \leq t} \frac{d_j}{n_j(n_j - d_j)}
\]

**Log-rank test**: Compares KM curves between two or more groups. Under \( H_0 \) (identical survival functions):
\[
\chi^2_{\text{LR}} = \frac{\left(\sum_j (d_{1j} - e_{1j})\right)^2}{\sum_j v_{1j}} \xrightarrow{d} \chi^2_1
\]
where \( e_{1j} = n_{1j} d_j / n_j \) is the expected number of events in group 1 at time \( t_{(j)} \) under \( H_0 \), and \( v_{1j} \) is the hypergeometric variance. The log-rank test is the most powerful test for proportional hazards alternatives.

### 7.6.2 Cox Proportional Hazards Model

The **Cox model** (Cox, 1972) specifies the hazard for subject \( i \) as:
\[
h(t \mid x_i) = h_0(t)\exp(x_i^T\beta)
\]
where \( h_0(t) \) is the unspecified **baseline hazard** and \( \exp(\beta_k) \) is the **hazard ratio** for a one-unit increase in \( x_k \). The Cox model is semiparametric: \( \beta \) is estimated from the **partial likelihood**:

\[
L_P(\beta) = \prod_{i: \Delta_i = 1} \frac{\exp(x_i^T\beta)}{\sum_{l \in \mathcal{R}(T_i)} \exp(x_l^T\beta)}
\]

where \( \mathcal{R}(t) = \{l : \tilde{T}_l \geq t\} \) is the risk set at time \( t \). Maximizing the partial likelihood gives the **partial likelihood estimator** \( \hat{\beta} \), which is consistent and asymptotically normal without requiring estimation of \( h_0(t) \).

**Breslow estimator** of the cumulative baseline hazard:
\[
\hat{H}_0(t) = \sum_{j: t_{(j)} \leq t} \frac{d_j}{\sum_{l \in \mathcal{R}(t_{(j)})} \exp(x_l^T\hat{\beta})}
\]

## 7.7 Multistate Models

Multistate models generalize survival analysis to settings with multiple event types and recurrent transitions. The **illness-death model** is fundamental:

**States**: \( \mathcal{S} = \{0 = \text{Healthy}, 1 = \text{Ill}, 2 = \text{Dead}\} \)

**Transition intensities** (cause-specific hazards):
- \( q_{01}(t) \): rate of becoming ill (healthy → ill)
- \( q_{02}(t) \): rate of dying while healthy (healthy → dead)
- \( q_{12}(t) \): rate of dying while ill (ill → dead)

(No reverse transition from ill to healthy in the standard illness-death model.)

The **transition probability matrix** \( \mathbf{P}(s, t) \) with \( P_{kl}(s,t) = P(X(t)=l \mid X(s)=k) \) satisfies the **Kolmogorov forward equations**:
\[
\frac{d}{dt} \mathbf{P}(s,t) = \mathbf{P}(s,t)\, \mathbf{Q}(t)
\]
where \( \mathbf{Q}(t) \) is the generator matrix with off-diagonal entries \( q_{kl}(t) \) and diagonal entries \( -\sum_{l \neq k} q_{kl}(t) \).

**Nonparametric estimation**: The **Nelson-Aalen estimator** of the cumulative transition intensity from state \( k \) to \( l \) is:
\[
\hat{A}_{kl}(t) = \sum_{s \leq t} \frac{d_{kl}(s)}{n_k(s)}
\]
where \( d_{kl}(s) \) is the number of \( k \to l \) transitions at time \( s \) and \( n_k(s) \) is the number in state \( k \) just before \( s \). The **Aalen-Johansen estimator** of \( \mathbf{P}(s,t) \) is:
\[
\hat{\mathbf{P}}(s,t) = \prod_{s < u \leq t} (\mathbf{I} + d\hat{\mathbf{A}}(u))
\]
a product integral over the jump times of \( \hat{\mathbf{A}} \).

## 7.8 Recurrent Event Models

When a subject can experience an event multiple times (hospitalizations, seizures, infections), recurrent event models are needed.

**Notation**: Let \( N_i(t) \) count events for subject \( i \) in \( [0,t] \). The **event intensity** is:
\[
\lambda_i(t \mid \mathcal{H}_i(t^-)) = \lim_{\Delta t \to 0} \frac{P(dN_i(t) = 1 \mid \mathcal{H}_i(t^-))}{\Delta t}
\]

**Andersen-Gill (AG) model**: Assumes a multiplicative hazard on the calendar time scale with a common baseline:
\[
\lambda_i(t) = Y_i(t) \cdot \lambda_0(t) \cdot \exp(x_i(t)^T\beta)
\]
where \( Y_i(t) = 1 \) if subject \( i \) is at risk at time \( t \). The AG model is a direct extension of the Cox model to counting processes. It treats each recurrence as a fresh "restart" with no memory of previous events (beyond covariates).

**Gap time model** (Prentice, Williams & Peterson, 1981): Resets the clock after each event. The hazard for the \( k \)-th event is modeled as a function of the time since the \( (k-1) \)-th event (gap time), allowing different baseline hazards by event number.

**Marginal model** (Wei, Lin & Weissfeld, 1989): Fits a separate Cox model for each event number (\( k = 1, 2, \ldots \)) and uses a robust sandwich variance to account for correlation of recurrent events within subjects.

**Negative binomial regression**: For count outcomes observed over a fixed follow-up period \( \tau_i \), model \( E[N_i(\tau_i)] = \tau_i \exp(x_i^T\beta) \) with a negative binomial distribution to accommodate overdispersion relative to Poisson.

---

## Summary: Key Distinctions and Decision Rules

**Which model for which question?**

| Scientific Question | Method | Key Assumption |
|---|---|---|
| Population-averaged effect | GEE | Mean model correctly specified |
| Individual trajectory | LMM/GLMM | Correct distributional assumptions |
| Transition between states | Transition model / Multistate | Markov property |
| Time to first event | Cox / KM | Proportional hazards (Cox) |
| Recurrent events | Andersen-Gill / WLW | Specified intensity model |

**Missing data decision tree**:

1. Is missingness plausibly MCAR? → Complete case analysis (simple but check sensitivity)
2. Is missingness plausibly MAR? → Direct likelihood (LMM), IPW-GEE, or MI with FCS
3. Missingness may be MNAR? → Selection models, pattern-mixture models, sensitivity analysis

**GEE vs. LMM for continuous outcomes**:
- Both give consistent estimates of \( \boldsymbol{\beta} \) under correct mean specification.
- LMM is more efficient when the random effects model is correct.
- GEE with sandwich SE is valid even when covariance is misspecified.
- LMM handles unbalanced data and irregular measurement times naturally.
- LMM predictions at the individual level (BLUP) require the random effects model.

**REML vs. ML**:
- REML for variance components → less biased.
- ML for LRT comparing nested fixed effects models.
- REML for LRT comparing nested covariance structures (same fixed effects).
- AIC/BIC comparable across REML fits only when fixed effects are identical.

---

## Appendix: Key Formulas Reference

**GEE estimating equation**:
\[
\sum_{i=1}^n \mathbf{D}_i^T \mathbf{V}_i^{-1}(\mathbf{Y}_i - \boldsymbol{\mu}_i) = \mathbf{0}
\]

**Sandwich variance**:
\[
\widehat{\text{Var}}(\hat{\beta}) = \left(\sum_i \mathbf{D}_i^T \mathbf{V}_i^{-1}\mathbf{D}_i\right)^{-1} \left(\sum_i \mathbf{D}_i^T\mathbf{V}_i^{-1}\hat{\mathbf{e}}_i\hat{\mathbf{e}}_i^T\mathbf{V}_i^{-1}\mathbf{D}_i\right) \left(\sum_i \mathbf{D}_i^T \mathbf{V}_i^{-1}\mathbf{D}_i\right)^{-1}
\]

**LMM marginal distribution**:
\[
\mathbf{Y}_i \sim N(\mathbf{X}_i\boldsymbol{\beta},\; \mathbf{Z}_i\mathbf{D}\mathbf{Z}_i^T + \boldsymbol{\Sigma}_i)
\]

**BLUP**:
\[
\hat{\mathbf{b}}_i = \mathbf{D}\mathbf{Z}_i^T(\mathbf{Z}_i\mathbf{D}\mathbf{Z}_i^T + \boldsymbol{\Sigma}_i)^{-1}(\mathbf{Y}_i - \mathbf{X}_i\hat{\boldsymbol{\beta}})
\]

**Rubin's total variance**:
\[
T = \bar{W} + \left(1 + m^{-1}\right)B
\]

**Kaplan-Meier estimator**:
\[
\hat{S}(t) = \prod_{j:\, t_{(j)}\leq t}\left(1 - \frac{d_j}{n_j}\right)
\]

**Cox partial likelihood**:
\[
L_P(\beta) = \prod_{i:\Delta_i=1}\frac{\exp(x_i^T\beta)}{\sum_{l\in\mathcal{R}(T_i)}\exp(x_l^T\beta)}
\]

**Nelson-Aalen estimator**:
\[
\hat{H}(t) = \sum_{j:\, t_{(j)}\leq t}\frac{d_j}{n_j}
\]
