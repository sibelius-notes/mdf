---
title: "STAT 936: Analysis of Longitudinal Data"
prof: "Glen McGee"
subjects: "STAT"
---

## Sources and References
**Primary texts** — Garrett M. Fitzmaurice, Nan M. Laird, and James H. Ware, *Applied Longitudinal Analysis* (2nd ed., Wiley, 2011); Peter Diggle, Patrick Heagerty, Kung-Yee Liang, and Scott Zeger, *Analysis of Longitudinal Data* (2nd ed., Oxford University Press, 2002).
**Supplementary** — Garrett Fitzmaurice et al. (eds.), *Longitudinal Data Analysis* (Chapman and Hall/CRC, 2008).
**Online resources** — Harvard Biostatistics 226 (Analysis of Longitudinal Data) lecture notes; Johns Hopkins Biostatistics longitudinal data notes; UBC Stat 550 notes on mixed models.

---

# Chapter 1: Introduction and Exploratory Data Analysis

## 1.1 What Is Longitudinal Data?

A **longitudinal study** is one in which the same set of subjects is observed repeatedly over time. Each subject \(i\) contributes a vector of responses \(Y_i = (Y_{i1}, \ldots, Y_{in_i})^\top\) measured at times \(t_{i1} < t_{i2} < \cdots < t_{in_i}\). The defining characteristic is that individual subjects serve as their own baseline, making it possible to study *change* over time at both the population and individual level.

Longitudinal data arise throughout health science. Classic examples include:

- CD4 cell counts measured repeatedly in HIV-positive patients enrolled in a clinical trial;
- lung function (FEV1) measured annually in a cohort study of respiratory disease;
- depression scores collected at multiple post-treatment follow-up visits in a psychiatric study;
- blood glucose levels recorded every few hours in a glucose-tolerance experiment.

The key distinction from **cross-sectional** data is that within-subject observations across time are not independent. Ignoring this correlation leads to invalid inference, as we discuss in Section 1.4.

<div class="definition">
<strong>Definition 1.1 (Longitudinal data structure).</strong> Let there be <em>m</em> subjects. Subject <em>i</em> has <em>n<sub>i</sub></em> observations at times <em>t<sub>i1</sub>, &hellip;, t<sub>in<sub>i</sub></sub></em>. The response vector is <em>Y<sub>i</sub> = (Y<sub>i1</sub>, &hellip;, Y<sub>in<sub>i</sub></sub>)<sup>&top;</sup></em>, and the covariate matrix is <em>X<sub>i</sub></em> (n<sub>i</sub> &times; p). The full data set is <em>{(Y<sub>i</sub>, X<sub>i</sub>, t<sub>i</sub>): i = 1, &hellip;, m}</em>. The study is said to be <em>balanced</em> if all <em>n<sub>i</sub> = n</em> and all subjects share the same measurement times.
</div>

## 1.2 Sources of Correlation and Between-Subject Heterogeneity

The within-subject correlation in longitudinal data arises from at least two conceptually distinct sources.

**Random effects (between-subject heterogeneity).** Subjects differ from one another in unmeasured ways — some individuals have systematically higher or lower responses regardless of time. These stable individual characteristics induce correlation among all observations on the same subject. Formally, if each subject has a latent intercept \(b_i\) drawn from some distribution, then

\[
\text{Cov}(Y_{ij}, Y_{ij'}) = \text{Var}(b_i) > 0
\]

for any two measurement occasions \(j \neq j'\) on the same subject.

**Serial correlation.** Even after accounting for individual-level random effects, observations that are close in time tend to be more similar than observations that are far apart. This serial dependence decays with the temporal gap \(|t_{ij} - t_{ij'}|\) and is captured by structured correlation models such as AR(1) or exponential decay.

The total marginal covariance of \(Y_i\) is the sum of contributions from both sources, plus measurement error.

## 1.3 Research Questions: Population-Averaged vs. Subject-Specific

A central conceptual distinction in longitudinal analysis concerns the **estimand** — the quantity we wish to estimate.

**Population-averaged (marginal) effects** describe how the mean response in the population changes as a function of covariates. The question is: if we compared two randomly selected subjects who differ in a covariate \(x\) by one unit, by how much would their expected responses differ? Generalized Estimating Equations (Chapter 6) are the canonical tool for this estimand.

**Subject-specific (conditional) effects** describe how the response of a *particular* individual changes as a function of covariates, after adjusting for that individual's random effect. The question is: for *this* individual, what is the expected response at each time point? Mixed effects models (Chapters 4 and 7) are the primary tool here.

In the linear case with identity link, population-averaged and subject-specific regression coefficients coincide. In nonlinear settings — for example, logistic regression for binary outcomes — they diverge, and the choice of estimand has substantive consequences for interpretation.

## 1.4 Implications of Ignoring Correlation

Suppose one naively applies ordinary least squares (OLS) to longitudinal data, treating all \(\sum_i n_i\) observations as independent. Two problems arise.

First, the OLS estimator \(\hat\beta_{\text{OLS}} = (X^\top X)^{-1} X^\top Y\) remains **consistent** for \(\beta\) under mild conditions (the estimating equations are unbiased), so point estimates are not necessarily wrong.

Second — and critically — the **standard errors** are wrong. The naive OLS variance estimate \(\hat\sigma^2 (X^\top X)^{-1}\) ignores the positive within-subject correlation. Because repeated measures on the same individual are correlated, the effective sample size is smaller than the nominal \(\sum_i n_i\), and the true variance of \(\hat\beta_{\text{OLS}}\) is *larger* than the naive estimate suggests. Confidence intervals will be too narrow, and hypothesis tests will reject too often. This is a fundamental problem in practice.

## 1.5 Exploratory Data Analysis for Longitudinal Data

Before fitting any formal model, exploratory analysis is essential. The goals are to understand the mean trajectory over time, the degree of between-subject variability, the structure of within-subject correlation, and the presence of outliers or unusual patterns.

### 1.5.1 Individual Profile Plots (Spaghetti Plots)

A **spaghetti plot** overlays individual response trajectories on a single graph, with time on the horizontal axis. Each line represents one subject's sequence of observations. Key features to look for:

- The overall trend: is the mean response increasing, decreasing, or nonlinear over time?
- The spread: do subjects differ substantially in their level (random intercept) or their rate of change (random slope)?
- Parallel vs. crossing profiles: crossing suggests heterogeneous slopes.
- Outlying trajectories that may warrant investigation.

### 1.5.2 Mean and Variance Trajectories

The **sample mean trajectory** is

\[
\bar{Y}(t_j) = \frac{1}{m_j} \sum_{i: t_{ij} = t_j} Y_{ij}
\]

where \(m_j\) is the number of subjects observed at time \(t_j\). Plotting \(\bar{Y}(t_j)\) against \(t_j\) reveals the average trend, and may be superimposed on the spaghetti plot.

The **sample variance trajectory** \(s^2(t_j)\) characterises whether variability changes over time — an important consideration for choosing covariance structures.

### 1.5.3 Sample Covariance and Correlation Matrices

For balanced data with common times \(t_1, \ldots, t_n\), define the **sample covariance matrix**

\[
\hat\Sigma = \frac{1}{m-1} \sum_{i=1}^m (Y_i - \bar Y)(Y_i - \bar Y)^\top
\]

and the corresponding **sample correlation matrix** with \((j,j')\) entry \(\hat\rho_{jj'} = \hat\sigma_{jj'} / (\hat\sigma_j \hat\sigma_{j'})\). Examining the off-diagonal entries reveals:

- Whether correlation decays with lag (suggesting AR or exponential structures);
- Whether all off-diagonal entries are approximately equal (suggesting compound symmetry);
- The sign and magnitude of correlations.

### 1.5.4 Loess Smoothing and Residual Plots

Superimposing a **loess** (locally weighted scatterplot smoother) curve on the mean trajectory can reveal nonlinear trends without parametric assumptions. Examining residuals from an initial model against time, against fitted values, and across subjects helps identify misspecification.

<div class="remark">
<strong>Remark 1.1.</strong> In unbalanced data — where subjects are measured at different times or with different numbers of observations — exploratory summaries must be adapted carefully. One common approach is to group times into bins and compute summary statistics within each bin.
</div>

---

# Chapter 2: Review of Linear Regression for Independent Data

## 2.1 The Classical Linear Model

Suppose we observe independent responses \(Y_1, \ldots, Y_N\) where

\[
Y_i = x_i^\top \beta + \epsilon_i, \quad \epsilon_i \overset{\text{iid}}{\sim} N(0, \sigma^2)
\]

with \(x_i \in \mathbb{R}^p\) a vector of covariates and \(\beta \in \mathbb{R}^p\) the unknown parameter vector. In matrix notation, \(Y = X\beta + \epsilon\) where \(X\) is \(N \times p\) and \(\epsilon \sim N(0, \sigma^2 I_N)\).

## 2.2 Ordinary Least Squares

The **OLS estimator** minimizes the residual sum of squares:

\[
\hat\beta_{\text{OLS}} = \underset{\beta}{\arg\min} \| Y - X\beta \|^2 = (X^\top X)^{-1} X^\top Y
\]

assuming \(X^\top X\) is invertible. The fitted values are \(\hat Y = X\hat\beta = HY\) where \(H = X(X^\top X)^{-1}X^\top\) is the **hat matrix**, a symmetric idempotent projection onto the column space of \(X\).

<div class="theorem">
<strong>Theorem 2.1 (Gauss-Markov).</strong> Under the assumptions that (i) <em>E[&epsilon;] = 0</em>, (ii) <em>Cov(&epsilon;) = &sigma;<sup>2</sup>I</em>, and (iii) <em>X</em> has full column rank, the OLS estimator <em>&beta;&#x0302;<sub>OLS</sub></em> is the <strong>Best Linear Unbiased Estimator</strong> (BLUE) of <em>&beta;</em>: among all linear unbiased estimators <em>A Y</em> with <em>E[AY] = &beta;</em>, the OLS estimator has the smallest variance matrix in the Loewner order.
</div>

The unbiased estimator of \(\sigma^2\) is

\[
\hat\sigma^2 = \frac{\| Y - X\hat\beta \|^2}{N - p} = \frac{RSS}{N-p}
\]

and the estimated covariance matrix of \(\hat\beta\) is \(\widehat{\text{Cov}}(\hat\beta) = \hat\sigma^2 (X^\top X)^{-1}\).

## 2.3 Properties Under Normality

When \(\epsilon \sim N(0, \sigma^2 I)\), the OLS estimator coincides with the **maximum likelihood estimator**. We have

\[
\hat\beta \sim N\!\left(\beta,\ \sigma^2 (X^\top X)^{-1}\right)
\]

\[
\frac{(N-p)\hat\sigma^2}{\sigma^2} \sim \chi^2_{N-p}
\]

and \(\hat\beta\) and \(\hat\sigma^2\) are independent. These distributional results underlie the \(t\)-tests and \(F\)-tests for hypothesis testing.

## 2.4 Model Comparison: F-test, AIC, and BIC

To compare a **full** model with \(p\) parameters against a **reduced** model with \(q < p\) parameters (the reduced model imposes \(p - q\) linear constraints on \(\beta\)), the partial \(F\)-statistic is

\[
F = \frac{(RSS_{\text{red}} - RSS_{\text{full}}) / (p - q)}{RSS_{\text{full}} / (N - p)} \sim F_{p-q,\, N-p}
\]

under the null hypothesis that the constraints hold.

The **Akaike Information Criterion** and **Bayesian Information Criterion** for model selection are

\[
AIC = -2\ell(\hat\theta) + 2k, \qquad BIC = -2\ell(\hat\theta) + k\log N
\]

where \(\ell(\hat\theta)\) is the maximized log-likelihood and \(k\) is the number of free parameters. Lower values indicate better-fitting models, with BIC imposing a heavier penalty for complexity. These criteria are applicable without nested model assumptions.

## 2.5 Residual Diagnostics

Model adequacy is assessed through residuals \(\hat\epsilon_i = Y_i - x_i^\top \hat\beta\). Standard diagnostics include:

- **Normal Q-Q plot** of standardised residuals to assess normality of errors;
- **Residuals vs. fitted values** to detect heteroscedasticity or nonlinearity;
- **Residuals vs. time** or **vs. observation order** to detect serial correlation;
- **Leverage and Cook's distance** to identify influential observations.

In longitudinal settings these diagnostics must be adapted to handle the within-subject structure, as we discuss in later chapters.

---

# Chapter 3: The General Linear Model for Longitudinal Data

## 3.1 Model Formulation

The **General Linear Model** (GLM) for longitudinal data extends the classical linear model to accommodate correlated errors. For subject \(i = 1, \ldots, m\):

\[
Y_i = X_i \beta + \epsilon_i, \quad \epsilon_i \sim N_{\!n_i}(0,\, \Sigma_i)
\]

where \(Y_i\) is \(n_i \times 1\), \(X_i\) is \(n_i \times p\), \(\beta \in \mathbb{R}^p\) is the fixed-effects parameter vector, and \(\Sigma_i\) is the \(n_i \times n_i\) **within-subject covariance matrix**, assumed positive definite. Observations from different subjects remain independent.

The marginal model is

\[
E[Y_i] = X_i \beta, \qquad \text{Cov}(Y_i) = \Sigma_i.
\]

## 3.2 Generalized Least Squares

When \(\Sigma_i\) is known, the efficient estimator is the **Generalized Least Squares (GLS)** estimator, obtained by minimizing the quadratic form

\[
Q(\beta) = \sum_{i=1}^m (Y_i - X_i\beta)^\top \Sigma_i^{-1} (Y_i - X_i\beta).
\]

Taking the derivative and setting it to zero:

\[
\frac{\partial Q}{\partial \beta} = -2\sum_{i=1}^m X_i^\top \Sigma_i^{-1}(Y_i - X_i\beta) = 0
\]

which yields the **GLS estimator**:

\[
\hat\beta_{\text{GLS}} = \left(\sum_{i=1}^m X_i^\top \Sigma_i^{-1} X_i\right)^{-1} \sum_{i=1}^m X_i^\top \Sigma_i^{-1} Y_i.
\]

<div class="theorem">
<strong>Theorem 3.1 (BLUE under correlated errors).</strong> Let the model be <em>Y<sub>i</sub> = X<sub>i</sub>&beta; + &epsilon;<sub>i</sub></em> with <em>E[&epsilon;<sub>i</sub>] = 0</em> and <em>Cov(&epsilon;<sub>i</sub>) = &Sigma;<sub>i</sub></em> known. Then &beta;&#x0302;<sub>GLS</sub> is the Best Linear Unbiased Estimator of &beta;: it has the smallest variance matrix (in the Loewner order) among all linear unbiased estimators. Its covariance matrix is

\[
\text{Cov}(\hat\beta_{\text{GLS}}) = \left(\sum_{i=1}^m X_i^\top \Sigma_i^{-1} X_i\right)^{-1}.
\]
</div>

**Proof sketch.** Let \(\tilde\beta = CY\) be any linear unbiased estimator, so \(CX = I\) (writing \(X = (X_1^\top, \ldots, X_m^\top)^\top\) in block form). Define \(C_0 = (\sum X_i^\top \Sigma_i^{-1} X_i)^{-1} (X_1^\top \Sigma_1^{-1}, \ldots, X_m^\top \Sigma_m^{-1})\), the GLS weights. Then \(D = C - C_0\) satisfies \(DX = 0\), and

\[
\text{Cov}(\tilde\beta) = \text{Cov}(\hat\beta_{\text{GLS}}) + D\,\text{blockdiag}(\Sigma_i)\,D^\top \succeq \text{Cov}(\hat\beta_{\text{GLS}}).
\]

The non-negative definite remainder vanishes if and only if \(D = 0\), i.e., \(\tilde\beta = \hat\beta_{\text{GLS}}\). \(\square\)

<div class="remark">
<strong>Remark 3.1.</strong> When <em>&Sigma;<sub>i</sub> = &sigma;<sup>2</sup>I</em> for all <em>i</em> (uncorrelated errors), the GLS estimator reduces to the OLS estimator. GLS therefore strictly generalises OLS. The gain in efficiency from GLS over OLS can be substantial when correlations are large.
</div>

## 3.3 Common Covariance Structures

In practice, \(\Sigma_i\) is unknown and must be estimated or parameterized. The choice of covariance structure is a modelling decision with important consequences.

### 3.3.1 Compound Symmetry (Exchangeable)

\[
\Sigma = \sigma^2 \left\lbrack (1-\rho) I_n + \rho \mathbf{1}_n \mathbf{1}_n^\top \right\rbrack
\]

This structure has constant variance \(\sigma^2\) and constant correlation \(\rho\) between any two time points. It is appropriate when the ordering of measurements is irrelevant — for example, in cross-over designs. The compound symmetry structure arises naturally from a random intercept model (Chapter 4).

### 3.3.2 AR(1) (First-Order Autoregressive)

\[
\sigma_{jk} = \sigma^2 \rho^{|j-k|}, \quad |\rho| < 1
\]

Correlation decays geometrically with the lag \(|j-k|\). This is appropriate when measurements are equally spaced and nearby observations are more correlated than distant ones. For unequally spaced times \(t_j\), the continuous-time analogue is \(\sigma_{jk} = \sigma^2 \exp(-\phi|t_j - t_k|)\).

### 3.3.3 Toeplitz

\[
\sigma_{jk} = \sigma_{|j-k|}
\]

Covariance depends only on lag, not on absolute time. This is more flexible than AR(1) but requires estimating \(n-1\) distinct correlation parameters.

### 3.3.4 Unstructured

The most general model allows \(\Sigma\) to be any positive definite matrix, with \(n(n+1)/2\) free parameters. This is maximally flexible but can be difficult to estimate when \(n\) is large relative to \(m\).

<div class="example">
<strong>Example 3.1.</strong> Consider a balanced study with <em>n = 4</em> time points. The unstructured model requires estimating 10 parameters. The AR(1) model requires only 2 (&sigma;<sup>2</sup> and &rho;). If the true structure is close to AR(1), the structured model will give much more precise estimates of &Sigma;<sub>i</sub> and, by extension, more efficient inference on &beta;. However, if the true structure is not AR(1), the structured model introduces bias in the covariance estimate, though the GLS estimate of &beta; may remain approximately unbiased.
</div>

## 3.4 Maximum Likelihood Estimation

When \(\Sigma_i = \Sigma(\alpha)\) depends on an unknown parameter vector \(\alpha\), we jointly estimate \((\beta, \alpha)\) by **maximum likelihood (ML)**. The log-likelihood is

\[
\ell(\beta, \alpha) = -\frac{1}{2} \sum_{i=1}^m \left\lbrack n_i \log(2\pi) + \log|\Sigma_i(\alpha)| + (Y_i - X_i\beta)^\top \Sigma_i(\alpha)^{-1} (Y_i - X_i\beta) \right\rbrack.
\]

ML estimation proceeds by iterating: given \(\hat\alpha\), update \(\hat\beta = \hat\beta_{\text{GLS}}(\hat\alpha)\); given \(\hat\beta\), update \(\hat\alpha\) by maximising \(\ell(\hat\beta, \alpha)\) over \(\alpha\).

**Bias of ML.** The ML estimator of variance components is known to be biased downward, because it does not account for the \(p\) degrees of freedom used in estimating \(\beta\). This parallels the \(N/(N-p)\) bias factor in OLS.

## 3.5 Restricted Maximum Likelihood (REML)

**REML** corrects the bias in ML by maximizing the likelihood of error contrasts that are free of \(\beta\). Specifically, if \(K^\top\) is any \((N-p) \times N\) matrix with \(K^\top X = 0\) (where \(N = \sum n_i\)), the REML log-likelihood is the log-likelihood of \(K^\top Y\):

\[
\ell_{\text{REML}}(\alpha) = -\frac{1}{2}\left\lbrack (N-p)\log(2\pi) + \log\left|K^\top \Sigma(\alpha) K\right| + (K^\top Y)^\top (K^\top \Sigma(\alpha) K)^{-1} (K^\top Y) \right\rbrack.
\]

Equivalently,

\[
\ell_{\text{REML}}(\alpha) = \ell(\hat\beta(\alpha), \alpha) - \frac{1}{2}\log\left|\sum_i X_i^\top \Sigma_i(\alpha)^{-1} X_i\right| + \text{const}.
\]

REML estimates of variance components are less biased than ML, and REML is the default method in most software for mixed effects models.

**Important:** Likelihood ratio tests (LRT) comparing models that differ in their **fixed effects** must use ML, not REML, because the REML likelihood is not comparable across models with different \(X_i\). For comparing **covariance structures** with the same fixed effects, either ML or REML may be used.

## 3.6 Model Selection for Covariance Structures

Information criteria provide a principled way to select among competing covariance structures. The **AIC** and **BIC** based on REML are commonly used. A **likelihood ratio test** between nested covariance models (e.g., AR(1) is not nested in compound symmetry in general, but CS is nested in unstructured) requires care: when testing a variance parameter on its boundary (e.g., \(\rho = 0\)), the standard \(\chi^2\) asymptotic distribution may not apply, and a mixture distribution or bootstrap may be needed.

---

# Chapter 4: Linear Mixed Effects Models

## 4.1 Model Formulation

The **Linear Mixed Effects Model** (LME) provides a unified framework that models both population-level (fixed) effects and individual-level (random) departures. For subject \(i\):

\[
Y_i = X_i \beta + Z_i b_i + \epsilon_i
\]

where:
- \(X_i\) (\(n_i \times p\)) and \(\beta \in \mathbb{R}^p\) are the fixed-effects design matrix and parameter vector;
- \(Z_i\) (\(n_i \times q\)) and \(b_i \in \mathbb{R}^q\) are the random-effects design matrix and random effects;
- \(\epsilon_i \sim N(0, \sigma^2 I_{n_i})\) is the within-subject error;
- \(b_i \sim N(0, D)\) independently, with \(D\) a \(q \times q\) positive definite covariance matrix.

The random effects \(b_i\) and errors \(\epsilon_i\) are assumed independent of each other and across subjects.

<div class="definition">
<strong>Definition 4.1 (Marginal and conditional distributions).</strong> The <em>conditional</em> distribution of <em>Y<sub>i</sub></em> given <em>b<sub>i</sub></em> is

\[
Y_i \mid b_i \sim N_{\!n_i}(X_i\beta + Z_i b_i,\ \sigma^2 I)
\]

The <em>marginal</em> distribution of <em>Y<sub>i</sub></em>, obtained by integrating out <em>b<sub>i</sub></em>, is

\[
Y_i \sim N_{\!n_i}(X_i\beta,\ \Sigma_i)
\]

where <em>&Sigma;<sub>i</sub> = Z<sub>i</sub>DZ<sub>i</sub><sup>&top;</sup> + &sigma;<sup>2</sup>I<sub>n<sub>i</sub></sub></em>.
</div>

This marginal model is precisely the General Linear Model of Chapter 3 with a specific structured covariance. The LME model thus simultaneously provides:

1. A **marginal model** for population-averaged inference through \(\beta\);
2. A **conditional model** for subject-specific inference through \(b_i\).

## 4.2 Common Random Effects Structures

### 4.2.1 Random Intercept Model

Set \(Z_i = \mathbf{1}_{n_i}\) (a column of ones) and \(b_i = b_{0i}\) scalar. Then

\[
Y_{ij} = x_{ij}^\top \beta + b_{0i} + \epsilon_{ij}
\]

with \(b_{0i} \sim N(0, \sigma_b^2)\). The induced marginal covariance is

\[
\text{Cov}(Y_{ij}, Y_{ij'}) = \sigma_b^2 \text{ for } j \neq j', \quad \text{Var}(Y_{ij}) = \sigma_b^2 + \sigma^2.
\]

This is exactly the compound symmetry structure with \(\rho = \sigma_b^2 / (\sigma_b^2 + \sigma^2)\).

### 4.2.2 Random Intercept and Slope Model

Set \(Z_i = \left\lbrack \mathbf{1}_{n_i}\ \mathbf{t}_i \right\rbrack\) where \(\mathbf{t}_i = (t_{i1}, \ldots, t_{in_i})^\top\), and \(b_i = (b_{0i}, b_{1i})^\top \sim N(0, D)\) where

\[
D = \begin{pmatrix} d_{11} & d_{12} \\ d_{12} & d_{22} \end{pmatrix}.
\]

Then

\[
Y_{ij} = (\beta_0 + b_{0i}) + (\beta_1 + b_{1i}) t_{ij} + \epsilon_{ij}.
\]

Each subject has its own intercept \(\beta_0 + b_{0i}\) and slope \(\beta_1 + b_{1i}\). The marginal covariance is

\[
\text{Cov}(Y_{ij}, Y_{ij'}) = d_{11} + d_{12}(t_{ij} + t_{ij'}) + d_{22} t_{ij} t_{ij'}
\]

which is not constant across time pairs — a more flexible structure than compound symmetry.

## 4.3 Best Linear Unbiased Prediction (BLUP)

Estimation of the random effects \(b_i\) is not standard parameter estimation, because \(b_i\) is random. The goal is **prediction** of a random quantity, and the appropriate criterion is minimizing the mean squared prediction error.

<div class="theorem">
<strong>Theorem 4.1 (Henderson's BLUP).</strong> Given known &beta;, D, and &sigma;<sup>2</sup>, the Best Linear Unbiased Predictor of <em>b<sub>i</sub></em> is

\[
\tilde b_i = D Z_i^\top \Sigma_i^{-1} (Y_i - X_i\beta)
\]

where <em>&Sigma;<sub>i</sub> = Z<sub>i</sub>DZ<sub>i</sub><sup>&top;</sup> + &sigma;<sup>2</sup>I</em>. It is the conditional expectation <em>E[b<sub>i</sub> | Y<sub>i</sub>]</em> under the normal model.
</div>

**Derivation.** Under normality, \((b_i, Y_i)\) is jointly normal. The joint covariance block is

\[
\text{Cov}(b_i, Y_i) = \text{Cov}(b_i,\ Z_i b_i + \epsilon_i) = D Z_i^\top.
\]

By the formula for conditional normal distributions:

\[
E\left\lbrack b_i \mid Y_i \right\rbrack = E[b_i] + \text{Cov}(b_i, Y_i) \text{Cov}(Y_i)^{-1} (Y_i - E[Y_i]) = D Z_i^\top \Sigma_i^{-1}(Y_i - X_i\beta).
\]

In practice, \(\beta\), \(D\), and \(\sigma^2\) are replaced by their REML estimates, giving the **Empirical BLUP (eBLUP)**.

**Shrinkage interpretation.** The eBLUP can be written as a weighted compromise between the naive OLS estimate of \(b_i\) from the \(i\)th subject's data alone, and the prior mean of zero. When \(n_i\) is small (little data on subject \(i\)), the eBLUP shrinks toward zero; when \(n_i\) is large, it approaches the OLS estimate. This **shrinkage** borrows strength across subjects and is a key advantage of the mixed effects framework.

**Henderson's mixed model equations.** The joint estimating equations for \((\beta, b_1, \ldots, b_m)\) are obtained by maximising the penalised log-likelihood (treating \(b_i\) as fixed but adding the log prior density as a penalty):

\[
\begin{pmatrix} X^\top R^{-1} X & X^\top R^{-1} Z \\ Z^\top R^{-1} X & Z^\top R^{-1} Z + G^{-1} \end{pmatrix} \begin{pmatrix} \hat\beta \\ \tilde b \end{pmatrix} = \begin{pmatrix} X^\top R^{-1} Y \\ Z^\top R^{-1} Y \end{pmatrix}
\]

where \(R = \sigma^2 \text{blockdiag}(I_{n_i})\), \(G = \text{blockdiag}(D)\), \(Z = \text{blockdiag}(Z_i)\), and the solution \(\hat\beta\) recovers the GLS estimator.

## 4.4 Likelihood Inference and REML

The marginal log-likelihood for \(\theta = (\beta, D, \sigma^2)\) is

\[
\ell(\theta) = -\frac{1}{2} \sum_{i=1}^m \left\lbrack \log|\Sigma_i| + (Y_i - X_i\beta)^\top \Sigma_i^{-1} (Y_i - X_i\beta) \right\rbrack + \text{const}
\]

ML maximisation yields biased estimates of variance components. REML is strongly preferred for estimating \(D\) and \(\sigma^2\). For testing fixed effects (e.g., \(H_0: C\beta = 0\)), either the Wald test or LRT (using ML) is appropriate.

## 4.5 Kenward-Roger Correction

For small samples, the Wald test statistic \(F = (C\hat\beta)^\top \left\lbrack C \widehat{\text{Cov}}(\hat\beta) C^\top \right\rbrack^{-1} (C\hat\beta) / r\) does not have an exact \(F\) distribution because \(\widehat{\text{Cov}}(\hat\beta)\) is an estimated, not known, covariance matrix. The **Kenward-Roger (KR) correction** adjusts both the estimated covariance matrix and the denominator degrees of freedom to account for this variability, using an approximation that performs well in small samples. The KR correction is the default in many software implementations (e.g., SAS PROC MIXED, R package `pbkrtest`).

## 4.6 Variance Components and Intraclass Correlation

In the random intercept model, the **intraclass correlation coefficient (ICC)** is

\[
\rho_{\text{ICC}} = \frac{\sigma_b^2}{\sigma_b^2 + \sigma^2}
\]

It measures the proportion of total variance attributable to between-subject heterogeneity, and equals the within-subject correlation under compound symmetry. A large ICC indicates that subjects are very different from one another and that a substantial fraction of observed variability is due to stable individual characteristics.

## 4.7 Diagnostic Checking

Model diagnostics for LME models include:

- **Marginal residuals** \(\hat\epsilon_i^{\text{mar}} = Y_i - X_i\hat\beta\) for assessing the fixed-effects specification;
- **Conditional residuals** \(\hat\epsilon_i^{\text{cond}} = Y_i - X_i\hat\beta - Z_i\tilde b_i\) for assessing the within-subject error structure;
- **Random effects QQ plots**: the empirical distribution of \(\tilde b_i\) should approximate \(N(0, D)\);
- **Variogram plots** of residuals to assess whether the assumed covariance structure is appropriate.

---

# Chapter 5: Review of Generalized Linear Models for Independent Discrete Data

## 5.1 The Exponential Family

A distribution belongs to the **exponential family** if its density can be written as

\[
f(y; \theta, \phi) = \exp\!\left\lbrack \frac{y\theta - b(\theta)}{a(\phi)} + c(y, \phi) \right\rbrack
\]

where \(\theta\) is the **canonical (natural) parameter**, \(\phi\) is the **dispersion parameter**, and \(a(\cdot)\), \(b(\cdot)\), \(c(\cdot, \cdot)\) are known functions. The mean and variance are

\[
E[Y] = \mu = b'(\theta), \qquad \text{Var}(Y) = a(\phi)\, b''(\theta) = a(\phi)\, V(\mu)
\]

where \(V(\mu) = b''(\theta)\) is the **variance function**.

<div class="example">
<strong>Example 5.1.</strong> For the Poisson distribution with mean <em>&mu;</em>, the canonical parameter is <em>&theta; = log &mu;</em>, <em>b(&theta;) = e<sup>&theta;</sup></em>, <em>a(&phi;) = 1</em>, and <em>V(&mu;) = &mu;</em>. For the Bernoulli distribution with success probability <em>&mu;</em>, the canonical parameter is <em>&theta; = log[&mu;/(1-&mu;)]</em> (log-odds), <em>b(&theta;) = log(1 + e<sup>&theta;</sup>)</em>, and <em>V(&mu;) = &mu;(1-&mu;)</em>.
</div>

## 5.2 Generalized Linear Models

A **Generalized Linear Model** (GLM) consists of three components:

1. **Random component:** \(Y_1, \ldots, Y_N\) independent with \(Y_i \sim\) exponential family with mean \(\mu_i\).
2. **Systematic component:** a linear predictor \(\eta_i = x_i^\top \beta\).
3. **Link function:** \(g(\mu_i) = \eta_i\), where \(g\) is a monotone differentiable function.

The **canonical link** corresponds to \(\eta_i = \theta_i\) (e.g., logit for binary, log for Poisson, identity for normal).

## 5.3 Iteratively Reweighted Least Squares

The **maximum likelihood estimator** \(\hat\beta\) satisfies the score equations

\[
\sum_{i=1}^N \frac{\partial \mu_i}{\partial \beta} \cdot \frac{Y_i - \mu_i}{a(\phi) V(\mu_i)} = 0 \implies \sum_{i=1}^N x_i \frac{(Y_i - \mu_i)}{a(\phi) V(\mu_i) g'(\mu_i)} = 0.
\]

These are solved via **Iteratively Reweighted Least Squares (IRLS)**: at iteration \(t\), form the working response \(Z_i^{(t)} = \eta_i^{(t)} + (Y_i - \mu_i^{(t)}) g'(\mu_i^{(t)})\) and working weight \(W_i^{(t)} = \left\lbrack V(\mu_i^{(t)}) \{g'(\mu_i^{(t)})\}^2 \right\rbrack^{-1}\), then solve the weighted least squares problem:

\[
\hat\beta^{(t+1)} = \underset{\beta}{\arg\min} \sum_{i=1}^N W_i^{(t)} (Z_i^{(t)} - x_i^\top \beta)^2 = (X^\top W^{(t)} X)^{-1} X^\top W^{(t)} Z^{(t)}.
\]

Convergence is typically rapid (5–10 iterations).

## 5.4 Deviance and Likelihood Ratio Tests

The **deviance** is

\[
D = 2\left\lbrack \ell(\hat\mu_{\text{sat}}) - \ell(\hat\beta) \right\rbrack
\]

where the saturated model fits one parameter per observation. For comparing nested models with \(p - q\) extra parameters, the **likelihood ratio test statistic** \(D_{\text{red}} - D_{\text{full}} \sim \chi^2_{p-q}\) asymptotically under the null.

## 5.5 Overdispersion and Quasi-Likelihood

When the observed variance exceeds the GLM-assumed variance (e.g., for Poisson data with \(\text{Var}(Y) > \mu\)), the model exhibits **overdispersion**. Two common remedies:

1. **Scale the variance** by an estimated dispersion parameter: \(\text{Var}(Y_i) = \phi \cdot V(\mu_i)\), estimating \(\hat\phi = D / (N - p)\).
2. **Quasi-likelihood**: define estimating equations \(\sum_i x_i (Y_i - \mu_i) / V(\mu_i) = 0\) without specifying a full likelihood. The resulting quasi-score equations yield consistent estimates of \(\beta\) with standard errors inflated by \(\sqrt{\hat\phi}\).

This quasi-likelihood framework is the intellectual precursor to GEE.

---

# Chapter 6: Generalized Estimating Equations for Fitting Marginal Models

## 6.1 Motivation and Setup

In the longitudinal setting with discrete outcomes (binary, count, ordinal), the within-subject correlation makes direct application of GLMs invalid. **Generalized Estimating Equations (GEE)**, introduced by Liang and Zeger (1986), extend quasi-likelihood to the correlated data setting by specifying:

1. A **marginal mean model**: \(g(\mu_{ij}) = x_{ij}^\top \beta\), so that \(E[Y_{ij}] = \mu_{ij}\) depends only on the fixed effects \(\beta\).
2. A **working correlation structure** \(R_i(\alpha)\) that approximates the true correlation, used to construct efficient estimating equations.

The defining feature of the GEE approach is that \(\beta\) retains its **population-averaged** interpretation regardless of whether the working correlation is correctly specified. Consistency holds under mild conditions even when \(R_i(\alpha)\) is misspecified.

## 6.2 The GEE Estimating Equations

Let \(A_i = \text{diag}(V(\mu_{i1}), \ldots, V(\mu_{in_i}))\) be the diagonal matrix of variance functions. The **working covariance matrix** of \(Y_i\) is

\[
V_i = \phi^{-1} A_i^{1/2} R_i(\alpha) A_i^{1/2}
\]

where \(R_i(\alpha)\) is the \(n_i \times n_i\) **working correlation matrix** parameterized by \(\alpha\). The **GEE estimating equations** for \(\beta\) are:

\[
S(\beta) = \sum_{i=1}^m D_i^\top V_i^{-1} (Y_i - \mu_i) = 0
\]

where \(D_i = \partial \mu_i / \partial \beta^\top\) is the \(n_i \times p\) matrix of derivatives with \((j,k)\)th entry \(\partial \mu_{ij} / \partial \beta_k = V(\mu_{ij}) [g'(\mu_{ij})]^{-1} x_{ijk}\) for canonical links.

These equations are solved iteratively. At convergence, \(\hat\beta_{\text{GEE}}\) is the GEE estimator.

### 6.2.1 Derivation of the Sandwich Variance Estimator

The key theoretical result is the **sandwich (robust) variance estimator** for \(\hat\beta_{\text{GEE}}\). By a standard M-estimator argument, \(\sqrt{m}(\hat\beta - \beta) \xrightarrow{d} N(0, \Lambda)\) where

\[
\Lambda = A^{-1} B A^{-1}
\]

\[
A = E\!\left\lbrack \sum_{i=1}^m D_i^\top V_i^{-1} D_i \right\rbrack, \qquad B = E\!\left\lbrack \sum_{i=1}^m D_i^\top V_i^{-1} \text{Cov}(Y_i) V_i^{-1} D_i \right\rbrack.
\]

The **model-based** variance estimator (valid only when \(V_i = \text{Cov}(Y_i)\)) is \(\hat A^{-1}\). The **sandwich (empirical) estimator** is

\[
\widehat{\Lambda} = \hat A^{-1} \hat B \hat A^{-1}
\]

\[
\hat A = \sum_{i=1}^m D_i^\top \hat V_i^{-1} D_i, \qquad \hat B = \sum_{i=1}^m D_i^\top \hat V_i^{-1} \hat\epsilon_i \hat\epsilon_i^\top \hat V_i^{-1} D_i
\]

where \(\hat\epsilon_i = Y_i - \hat\mu_i\). The sandwich estimator is consistent for \(\Lambda\) whether or not the working correlation is correctly specified.

## 6.3 Consistency and Efficiency

<div class="theorem">
<strong>Theorem 6.1 (Liang-Zeger consistency).</strong> Under regularity conditions — including correct specification of the marginal mean <em>g(&mu;<sub>ij</sub>) = x<sub>ij</sub><sup>&top;</sup>&beta;</em> and suitable smoothness — the GEE estimator &beta;&#x0302;<sub>GEE</sub> is consistent for &beta; regardless of whether <em>R<sub>i</sub>(&alpha;)</em> is correctly specified, as <em>m &rarr; &infin;</em>. The sandwich variance estimator is consistent for the true variance of &beta;&#x0302;<sub>GEE</sub>.
</div>

**Efficiency.** Efficiency is maximized when the working correlation \(R_i(\alpha)\) equals the true correlation structure. In the extreme case of using the independence working correlation (\(R_i = I\)), the GEE estimator reduces to stacking the GLM score equations across subjects, which is consistent but inefficient. In practice, specifying a working correlation that approximates the truth improves efficiency, sometimes substantially.

**Small sample behavior.** The sandwich variance estimator can be biased downward in small samples (\(m < 40\)). Bias-corrected sandwich estimators (Mancl and DeRouen 2001, Fay and Graubard 2001) improve performance.

## 6.4 Working Correlation Structures

The following structures are commonly used:

- **Independence:** \(R_i = I\). Ignores within-subject correlation in the estimation of \(\beta\) but is valid with the sandwich variance.
- **Exchangeable:** \(r_{jk} = \alpha\) for all \(j \neq k\). Appropriate for cluster data or balanced repeated measures with no time ordering.
- **AR(1):** \(r_{jk} = \alpha^{|j-k|}\). Appropriate for ordered time points.
- **Unstructured:** \(r_{jk} = \alpha_{jk}\), all distinct. Most flexible; difficult to estimate for large \(n_i\).
- **M-dependent:** correlation is nonzero for \(|j-k| \leq M\) and zero otherwise.

The nuisance parameter \(\alpha\) is typically estimated by **moment-based methods** in an outer loop, while \(\beta\) is updated in the inner GEE loop.

## 6.5 GEE2 and Simultaneous Regression for Means and Associations

**GEE2** extends the original GEE framework to jointly estimate both \(\beta\) (mean parameters) and \(\alpha\) (association parameters) through a pair of linked estimating equations. While theoretically more efficient under correct model specification, GEE2 is more sensitive to model misspecification and computationally more demanding; GEE1 (the original Liang-Zeger approach) remains far more widely used.

## 6.6 Model Selection: QIC

The **Quasi-Information Criterion (QIC)**, proposed by Pan (2001), extends AIC to GEE for selecting among working correlation structures:

\[
QIC(R) = -2\ell_I(\hat\beta_R) + 2\, \text{tr}\!\left(\hat\Omega_I \hat A_R\right)
\]

where \(\ell_I\) is the independence quasi-likelihood evaluated at \(\hat\beta_R\), \(\hat\Omega_I\) is the empirical variance under independence, and \(\hat A_R\) is the model-based information matrix under structure \(R\). Lower QIC indicates a better model.

<div class="remark">
<strong>Remark 6.1.</strong> A key advantage of GEE over GLMMs is computational simplicity: GEE avoids the need to integrate over random effects distributions and is implemented via simple iterative algorithms. The tradeoff is that GEE produces only <em>population-averaged</em> estimates and provides no mechanism for subject-specific inference.
</div>

---

# Chapter 7: Generalized Linear Mixed Effects Models

## 7.1 Model Formulation

**Generalized Linear Mixed Effects Models (GLMMs)** extend the linear mixed effects model to handle discrete outcomes by incorporating random effects within the GLM framework. For subject \(i\), observation \(j\):

\[
g(\mu_{ij}) = x_{ij}^\top \beta + z_{ij}^\top b_i
\]

where \(\mu_{ij} = E[Y_{ij} \mid b_i]\), \(g(\cdot)\) is a link function, and the random effects \(b_i \sim N(0, D)\) independently. Given \(b_i\), the observations \(Y_{i1}, \ldots, Y_{in_i}\) are **conditionally independent** and follow an exponential family distribution.

<div class="definition">
<strong>Definition 7.1 (GLMM).</strong> The GLMM is defined by three components:

<ol>
<li><em>Conditional distribution:</em> <em>Y<sub>ij</sub> | b<sub>i</sub></em> are independent with conditional mean <em>&mu;<sub>ij</sub> = E[Y<sub>ij</sub> | b<sub>i</sub>]</em> and conditional variance <em>Var(Y<sub>ij</sub> | b<sub>i</sub>) = V(&mu;<sub>ij</sub>)/&phi;</em>.</li>
<li><em>Link function:</em> <em>g(&mu;<sub>ij</sub>) = x<sub>ij</sub><sup>&top;</sup>&beta; + z<sub>ij</sub><sup>&top;</sup>b<sub>i</sub></em>.</li>
<li><em>Random effects:</em> <em>b<sub>i</sub> ~ N(0, D)</em> independently across <em>i</em>.</li>
</ol>
</div>

## 7.2 Marginal vs. Conditional Interpretation

In the GLMM, the parameters \(\beta\) have a **subject-specific (conditional)** interpretation: \(\beta_k\) represents the change in the linear predictor \(g(\mu_{ij})\) associated with a unit change in \(x_{ijk}\), for an individual with fixed random effect \(b_i\). This contrasts with the **population-averaged** interpretation of GEE.

For nonlinear link functions (e.g., logit, log), the marginal mean is

\[
E[Y_{ij}] = E_{b_i}\!\left\lbrack g^{-1}(x_{ij}^\top \beta + z_{ij}^\top b_i) \right\rbrack \neq g^{-1}(x_{ij}^\top \beta)
\]

because \(g^{-1}\) is nonlinear. Thus the GLMM marginal mean does not have the same parametric form as the conditional mean, and the fixed effects \(\beta\) in a GLMM are not population-averaged coefficients.

**Attenuation factor.** For the logistic-normal GLMM with a single random intercept \(b_i \sim N(0, \sigma_b^2)\), the marginal log-odds is approximately

\[
\text{logit}(E[Y_{ij}]) \approx \frac{x_{ij}^\top \beta}{\sqrt{1 + c^2 \sigma_b^2}}
\]

where \(c^2 = 16\sqrt{3} / (15\pi)\). The marginal log-odds ratio is thus **attenuated** relative to the conditional log-odds ratio. This attenuation increases with \(\sigma_b^2\).

## 7.3 Likelihood and Approximation Methods

The marginal likelihood for the GLMM is

\[
L(\theta) = \prod_{i=1}^m \int_{\mathbb{R}^q} \left\lbrack \prod_{j=1}^{n_i} f(Y_{ij} \mid b_i) \right\rbrack \phi(b_i; 0, D)\, db_i
\]

where \(\phi(b_i; 0, D)\) is the \(N(0,D)\) density. This integral is **analytically intractable** for most exponential family distributions (unlike the normal case), necessitating approximation.

### 7.3.1 Laplace Approximation

The Laplace approximation expands the log-integrand around its mode \(\tilde b_i\) (the posterior mode given the data) as a quadratic form:

\[
\int \exp\{h(b_i)\}\, db_i \approx (2\pi)^{q/2} |-H|^{-1/2} \exp\{h(\tilde b_i)\}
\]

where \(h(b_i) = \sum_j \log f(Y_{ij} \mid b_i) - \frac{1}{2} b_i^\top D^{-1} b_i\) and \(H = \partial^2 h / \partial b_i \partial b_i^\top|_{\tilde b_i}\). The Laplace approximation is exact for normal \(Y_{ij}\) and works well when \(n_i\) is large.

### 7.3.2 Adaptive Gauss-Hermite Quadrature (AGHQ)

For scalar random effects (\(q = 1\)), the integral can be computed via Gauss-Hermite quadrature adapted to the mode and curvature of the integrand:

\[
\int h(u)\, \phi(u; 0, \sigma_b^2)\, du \approx \sum_{k=1}^K w_k h(\hat\mu + \hat\sigma \xi_k)
\]

where \(\xi_k\) and \(w_k\) are Gauss-Hermite nodes and weights scaled to the posterior distribution. AGHQ with \(K = 1\) reduces to the Laplace approximation; increasing \(K\) improves accuracy at the cost of computation. For \(q > 1\), the quadrature grid grows as \(K^q\), making AGHQ impractical for high-dimensional random effects.

### 7.3.3 Penalized Quasi-Likelihood (PQL)

**PQL** (Breslow and Clayton 1993) linearizes the link function around the current random effects estimates and fits an LME model to the linearized working responses. It is computationally efficient but can produce biased estimates, particularly for binary outcomes with small cluster sizes.

### 7.3.4 MCMC

Bayesian MCMC methods (e.g., Metropolis-Hastings, Gibbs sampling, Hamiltonian Monte Carlo) can estimate GLMMs without approximation by sampling from the joint posterior of \((\beta, b_1, \ldots, b_m, D)\). Stan (via `rstan`) and JAGS are commonly used. MCMC provides exact inference (in the limit of infinite samples) and handles complex model structures, at the cost of computation and convergence diagnostics.

## 7.4 Overdispersion and Zero-Inflation in GLMMs

**Overdispersion** relative to the standard GLM variance can be addressed within the GLMM framework by including a **observation-level random effect**: for Poisson data, adding an independent normal random effect \(u_{ij} \sim N(0, \sigma_u^2)\) to the linear predictor induces extra-Poisson variation.

**Zero-inflated** models handle count data with excess zeros by mixing a point mass at zero with a GLM distribution:

\[
P(Y_{ij} = 0) = \pi_{ij} + (1-\pi_{ij}) f(0; \mu_{ij})
\]
\[
P(Y_{ij} = y) = (1-\pi_{ij}) f(y; \mu_{ij}) \quad \text{for } y > 0
\]

where \(\pi_{ij}\) is the probability of a structural zero. Both components can include random effects and covariates.

---

# Chapter 8: Marginal Models, Conditional Models and Other Perspectives

## 8.1 A Unified Framework

The analyses in preceding chapters can be organized into three broad model classes, each encoding a different set of assumptions and targeting a different estimand.

**Marginal models** (Chapter 6) specify only the marginal mean \(E[Y_{ij}] = \mu_{ij}\) as a function of covariates, without making assumptions about the joint distribution of \(Y_i\). The within-subject association is treated as a nuisance parameter (via the working correlation). The target of inference is the **population-averaged effect** \(\beta\).

**Conditional (random effects) models** (Chapters 4 and 7) specify the distribution of \(Y_{ij}\) given subject-specific random effects \(b_i\). The target of inference is the **subject-specific effect** \(\beta\), which describes individual-level trajectories.

**Transition models** specify the distribution of \(Y_{ij}\) given the history \(H_{ij} = (Y_{i,j-1}, \ldots, Y_{i1}, x_{ij})\). The within-subject association is modelled through the lagged responses.

## 8.2 Transition Models

A **first-order Markov (transition) model** for a continuous outcome specifies

\[
E\left\lbrack Y_{ij} \mid Y_{i,j-1}, x_{ij} \right\rbrack = x_{ij}^\top \beta + \gamma Y_{i,j-1}
\]

The parameter \(\gamma\) captures the serial dependence through the lagged response. More generally, for binary outcomes with logit link:

\[
\text{logit}\!\left(P(Y_{ij} = 1 \mid H_{ij})\right) = x_{ij}^\top \beta + \sum_{k=1}^K \gamma_k Y_{i,j-k}
\]

Transition models are sometimes called **autoregressive** models in the GLM context. They are natural for time series data and can be fit with standard GLM software by including lagged outcomes as covariates. However, the interpretation of \(\beta\) is conditional on the past history, which differs from both the population-averaged (GEE) and subject-specific (GLMM) interpretations.

## 8.3 Connections Between GEE and GLMM

In the **linear** case (\(g = \text{identity}\), Gaussian outcomes), the GEE estimator with any working correlation structure and the REML estimator from the LME model both target the same population-averaged parameter \(\beta\), and with correctly specified correlation, yield asymptotically equivalent estimates.

In the **nonlinear** case, GEE targets \(\beta_{\text{PA}}\) (population-averaged) and GLMM targets \(\beta_{\text{SS}}\) (subject-specific). These parameters are not equal in general. In the logistic-normal GLMM:

\[
|\beta_{\text{PA}}| < |\beta_{\text{SS}}|
\]

because the averaging over the random effect distribution attenuates the regression coefficient. The choice between GEE and GLMM should be driven by the scientific question: if interest is in effects at the population level (e.g., policy decisions), GEE is appropriate; if interest is in individual trajectories (e.g., clinical decision-making for a particular patient), GLMM is appropriate.

## 8.4 Hybrid and Shared Parameter Models

Some settings call for joint modelling of multiple processes. **Shared parameter models** posit that the longitudinal outcome and another process (e.g., time to dropout, a biomarker) share common random effects. For example, a joint model for longitudinal CD4 counts and time to AIDS event might specify:

\[
Y_{ij} = x_{ij}^\top \beta + b_{0i} + b_{1i} t_{ij} + \epsilon_{ij}
\]
\[
\lambda_i(t) = \lambda_0(t) \exp\!\left\lbrack w_i^\top \gamma + \alpha (b_{0i} + b_{1i} t) \right\rbrack
\]

where \(\lambda_i(t)\) is the hazard of the event for subject \(i\). The shared random effects \((b_{0i}, b_{1i})\) induce dependence between the longitudinal and event processes. Joint models of this type are discussed extensively in the literature on dynamic prediction.

## 8.5 Interpretation in Public Health Settings

The choice between estimands has direct public health consequences. Consider a vaccine trial measuring log antibody titre repeatedly.

- A marginal model asks: if the vaccinated population and control population were compared, what is the average difference in titres?
- A subject-specific model asks: for an individual vaccinated person, what is their trajectory relative to what it would have been without vaccination?

When heterogeneity is small (\(\sigma_b^2 \approx 0\)), these estimands nearly coincide. When heterogeneity is large, they can differ substantially. Transparency about which estimand is being reported is essential for public health communication.

---

# Chapter 9: Modelling Non-Linear Curves: GAMs, GAMMs and MAMs

## 9.1 Beyond Linearity: Motivation

The parametric models of previous chapters assume that the mean response is a linear (or generalized linear) function of covariates and time. In practice, the true mean trajectory may be nonlinear and poorly approximated by low-order polynomials. Flexible nonparametric and semiparametric approaches are needed.

## 9.2 Polynomial Regression

**Polynomial regression** replaces the linear term \(\beta_1 t\) with a polynomial

\[
E[Y_{ij}] = \beta_0 + \beta_1 t_{ij} + \beta_2 t_{ij}^2 + \cdots + \beta_K t_{ij}^K
\]

While simple, polynomial regression is globally smooth and can exhibit wild oscillations (**Runge's phenomenon**) in the tails, especially for high-degree polynomials. Degree selection via cross-validation or AIC mitigates this, but the method lacks local adaptivity.

## 9.3 Regression Splines

**Piecewise polynomial (spline)** functions improve on global polynomials by fitting separate polynomials in subintervals defined by **knots** \(\kappa_1 < \kappa_2 < \cdots < \kappa_K\), subject to continuity and smoothness constraints at the knots.

A **cubic spline** with \(K\) interior knots has basis functions

\[
1, t, t^2, t^3, (t-\kappa_1)_+^3, \ldots, (t-\kappa_K)_+^3
\]

where \((u)_+ = \max(u, 0)\) is the positive part. The model has \(K + 4\) free parameters. **Natural (restricted) cubic splines** additionally constrain the function to be linear beyond the boundary knots, improving stability.

The **B-spline basis** provides a numerically stable alternative representation with compact support, and is the default in many software packages (R's `bs()` and `ns()` functions).

## 9.4 Generalized Additive Models (GAMs)

**GAMs** (Hastie and Tibshirani 1990) decompose the linear predictor into a sum of smooth functions of each covariate:

\[
g(\mu_{ij}) = \beta_0 + f_1(x_{ij1}) + f_2(x_{ij2}) + \cdots + f_r(x_{ijr})
\]

where each \(f_k\) is an unknown smooth function, estimated nonparametrically subject to a roughness penalty:

\[
\hat f_k = \underset{f_k}{\arg\min} \sum_{i,j} \left(Y_{ij} - \beta_0 - \sum_k f_k(x_{ijk})\right)^2 + \sum_k \lambda_k \int \{f_k''(x)\}^2\, dx
\]

The penalty \(\lambda_k\) controls the trade-off between fit and smoothness. As \(\lambda_k \to 0\) the function interpolates the data; as \(\lambda_k \to \infty\) the function becomes linear.

### 9.4.1 Smoothing Parameter Selection

The **effective degrees of freedom** of the smooth function \(f_k\) under smoothing parameter \(\lambda_k\) is

\[
\text{df}(f_k) = \text{tr}(H_k)
\]

where \(H_k\) is the hat matrix mapping \(Y\) to \(\hat f_k(x_k)\). Large \(\text{df}\) indicates a wiggly fit; small \(\text{df}\) indicates a smooth (close to linear) fit.

The smoothing parameter is selected by **Generalized Cross-Validation (GCV)**:

\[
\text{GCV}(\lambda) = \frac{N \cdot RSS(\lambda)}{\left\lbrack N - \text{tr}(H(\lambda)) \right\rbrack^2}
\]

or by **REML-based marginal likelihood** maximisation (Wood 2011), which is generally preferred for its better numerical properties.

### 9.4.2 Backfitting Algorithm

The **backfitting algorithm** estimates the smooth functions iteratively:

1. Initialise \(\hat f_k = 0\) for all \(k\).
2. For each \(k = 1, \ldots, r\), form the partial residuals \(r_{ijk} = Y_{ij} - \hat\beta_0 - \sum_{k'\neq k} \hat f_{k'}(x_{ijk'})\) and fit a smoother to obtain the updated \(\hat f_k\).
3. Repeat until convergence.

Backfitting converges rapidly in practice for orthogonal or nearly orthogonal predictors.

## 9.5 Generalized Additive Mixed Models (GAMMs)

**GAMMs** combine the random effects of LME/GLMM models with the flexible mean functions of GAMs:

\[
g(\mu_{ij}) = f(t_{ij}) + x_{ij}^\top \beta + z_{ij}^\top b_i, \quad b_i \sim N(0, D)
\]

The smooth function \(f(t)\) captures the population-average time trend, while the random effects \(b_i\) capture between-subject heterogeneity. GAMMs can be fit as LME models with appropriately structured design matrices by exploiting the duality between penalized regression and mixed effects (Wood 2006): the penalty \(\lambda \int [f''(t)]^2 dt\) corresponds to a Gaussian prior on the spline coefficients, which can be encoded as a variance component.

<div class="example">
<strong>Example 9.1 (CD4 count trajectories).</strong> In an HIV cohort study, the population-mean CD4 count trajectory over time since seroconversion may be nonlinear — initially declining sharply, then stabilising. A GAMM with a penalized spline for time and random intercepts and slopes across subjects would capture both the nonlinear population trend and individual variation around it. The smooth function <em>f(t)</em> is estimated from all subjects simultaneously, while the random effects <em>b<sub>i</sub></em> capture individual deviations.
</div>

## 9.6 Multivariate Adaptive Regression Splines (MARS/MAMs)

**MARS** (Friedman 1991) builds an adaptive piecewise linear model by adding pairs of hinge functions \((t - \kappa)_+\) and \((\kappa - t)_+\) in a forward-stepwise greedy search, then pruning the model using GCV. The resulting model is parsimonious and interpretable, automatically selecting important knot locations.

In the longitudinal context, MARS can be extended to **Marginal Additive Models (MAMs)** by combining MARS-type basis functions with GEE estimation to account for within-subject correlation. The basis functions are selected data-adaptively, providing flexibility for complex nonlinear trends.

---

# Chapter 10: Missing Data

## 10.1 The Problem of Missing Data in Longitudinal Studies

Longitudinal studies are almost invariably affected by **missing data**. Subjects may drop out before study completion (monotone missingness), miss individual scheduled visits (intermittent missingness), or have item non-response on specific questions. Missing data can bias estimates of the mean trajectory, reduce efficiency, and distort inference if not handled appropriately.

## 10.2 Missing Data Mechanisms: MCAR, MAR, MNAR

The seminal taxonomy of Rubin (1976) and Little and Rubin (2002) classifies missing data mechanisms based on how the probability of missingness depends on the data.

Let \(Y_i = (Y_i^{\text{obs}}, Y_i^{\text{mis}})\) denote the full data (observed and missing components), and let \(R_i\) be the **missing data indicator vector** with \(R_{ij} = 1\) if \(Y_{ij}\) is observed and \(R_{ij} = 0\) if missing.

<div class="definition">
<strong>Definition 10.1.</strong>

<ul>
<li><strong>Missing Completely At Random (MCAR):</strong> <em>P(R<sub>i</sub> | Y<sub>i</sub>, X<sub>i</sub>) = P(R<sub>i</sub> | X<sub>i</sub>)</em>. Missingness is independent of both observed and missing outcomes. MCAR is the strongest assumption and is often unrealistic in practice.</li>

<li><strong>Missing At Random (MAR):</strong> <em>P(R<sub>i</sub> | Y<sub>i</sub>, X<sub>i</sub>) = P(R<sub>i</sub> | Y<sub>i</sub><sup>obs</sup>, X<sub>i</sub>)</em>. Conditional on the observed data, missingness is independent of the missing values. MAR is weaker than MCAR and is the assumption underlying most standard methods.</li>

<li><strong>Missing Not At Random (MNAR):</strong> Missingness depends on the missing values themselves, even after conditioning on the observed data. MNAR is the most realistic in many health studies (e.g., sicker patients are more likely to drop out precisely because of their worse outcomes) but is the hardest to handle.</li>
</ul>
</div>

The distinction has profound practical implications. Under MCAR, complete-case analysis is unbiased. Under MAR, likelihood-based methods and multiple imputation are valid. Under MNAR, all standard methods may yield biased results without additional untestable assumptions.

## 10.3 Complete-Case and Available-Case Analysis

**Complete-case analysis (CCA)** restricts analysis to subjects with no missing data. Under MCAR, CCA is unbiased but inefficient (discards data). Under MAR, CCA is generally biased because subjects who drop out systematically differ from those who complete the study.

**Available-case analysis (ACA)** uses all available observations for each analysis. For example, when computing pairwise correlations, each pair \((Y_{ij}, Y_{ij'})\) is computed from subjects observed at both times \(j\) and \(j'\). ACA uses more data than CCA but can produce inconsistent covariance estimates.

## 10.4 Likelihood-Based Methods Under MAR

Under the assumption that the missing data mechanism is **ignorable** (MAR plus distinctness of parameters), the observed-data likelihood for \(\beta\) obtained by integrating over the missing values is valid for inference. For normally distributed longitudinal data, this means fitting the LME model to all available data (without deleting subjects with missing observations) yields valid ML and REML estimates under MAR.

**Key insight.** The LME model likelihood, evaluated on the observed data, is

\[
\ell(\beta, \theta) = \sum_{i=1}^m \log f(Y_i^{\text{obs}}; \beta, \theta)
\]

Under MAR, this likelihood is proportional to the full-data likelihood, so maximizing it yields consistent estimates of \((\beta, \theta)\) without needing to model the dropout mechanism. This makes LME models particularly robust to informative dropout under MAR.

## 10.5 Multiple Imputation

**Multiple Imputation (MI)**, introduced by Rubin (1987), replaces each missing value with \(L\) plausible values drawn from the posterior predictive distribution of the missing data given the observed data, creating \(L\) complete datasets. Each complete dataset is analyzed separately, and the results are combined via **Rubin's rules**.

Let \(\hat\beta^{(l)}\) and \(\hat U^{(l)} = \widehat{\text{Var}}(\hat\beta^{(l)})\) be the estimate and variance from the \(l\)th completed dataset, \(l = 1, \ldots, L\). Then:

\[
\bar\beta = \frac{1}{L} \sum_{l=1}^L \hat\beta^{(l)} \quad (\text{combined estimate})
\]

\[
\bar U = \frac{1}{L} \sum_{l=1}^L \hat U^{(l)} \quad (\text{within-imputation variance})
\]

\[
B = \frac{1}{L-1} \sum_{l=1}^L (\hat\beta^{(l)} - \bar\beta)(\hat\beta^{(l)} - \bar\beta)^\top \quad (\text{between-imputation variance})
\]

The **total variance** (Rubin's rules) is:

\[
T = \bar U + \left(1 + \frac{1}{L}\right) B
\]

Inference proceeds with \(\bar\beta\) and \(T\). Under MAR, MI with a correctly specified imputation model yields valid, approximately efficient estimates. The effective degrees of freedom for testing is approximated by

\[
\nu = (L-1)\left(1 + \frac{\bar U}{(1+L^{-1})B}\right)^2.
\]

**Congeniality.** For valid inference, the imputation model should be at least as rich as the analysis model — a condition called **congeniality**. In practice, the imputation model should include all variables in the analysis model plus auxiliary predictors of missingness.

## 10.6 Inverse Probability Weighted Complete-Case Analysis (IPCW)

**Inverse probability of censoring weighting (IPCW)** corrects for informative dropout by weighting each observed subject-time combination by the reciprocal of the probability of remaining observed up to that time. This up-weights subjects similar to those who dropped out.

For subject \(i\) at time \(j\), the **stabilised IPCW weight** is

\[
w_{ij} = \frac{\hat P(R_{ij} = 1 \mid X_i)}{\hat P(R_{ij} = 1 \mid X_i, Y_{ij}^{\text{obs}})}
\]

The numerator is the marginal probability of remaining in the study; the denominator conditions on the observed history. The weighted GEE estimating equations become:

\[
\sum_{i=1}^m \sum_{j: R_{ij}=1} w_{ij} D_{ij}^\top V_{ij}^{-1}(Y_{ij} - \mu_{ij}) = 0.
\]

Under MAR and a correctly specified dropout model, the IPCW-GEE estimator is consistent. Like MI, IPCW requires modeling the dropout mechanism, and results are sensitive to model misspecification.

## 10.7 Pattern Mixture Models

**Pattern mixture models** (Little 1993) stratify the population by missing data pattern \(r\) and specify a separate response model within each stratum:

\[
f(Y_i \mid R_i = r;\, \theta_r) \text{ for each pattern } r.
\]

The marginal distribution is then

\[
f(Y_i; \theta, \pi) = \sum_r \pi_r f(Y_i \mid R_i = r; \theta_r)
\]

where \(\pi_r = P(R_i = r)\). This approach makes the MNAR structure explicit: parameters \(\theta_r\) governing the missing-data pattern may differ from those governing the complete-data pattern. Identifying restrictions (e.g., complete-case missing value restriction, available case missing value restriction) are needed to estimate non-identified parameters, and the analysis proceeds as a sensitivity analysis over the restrictions.

## 10.8 Selection Models

**Selection models** (Diggle and Kenward 1994) jointly specify the full-data response distribution and the dropout mechanism:

\[
f(Y_i, R_i) = f(Y_i) \cdot f(R_i \mid Y_i)
\]

The dropout model \(f(R_i \mid Y_i)\) typically takes a logistic regression form where dropout at time \(t\) may depend on the current (possibly missing) value \(Y_{ij}\). This dependence on the missing value makes the model MNAR. The **Diggle-Kenward model** specifies a logistic dropout model:

\[
\text{logit}\!\left(P(d_i = j \mid d_i \geq j, Y_i)\right) = \psi_0 + \psi_1 Y_{i,j-1} + \psi_2 Y_{ij}
\]

where \(d_i\) is the dropout time and \(Y_{ij}\) is unobserved at dropout. The parameter \(\psi_2\) governs MNAR dependence: \(\psi_2 = 0\) reduces to MAR. The selection model is estimated by maximizing the joint likelihood, typically by integrating over the missing data.

## 10.9 Sensitivity Analysis for MNAR

Because MNAR assumptions are **not testable** from the observed data alone, **sensitivity analysis** is essential for any analysis where MNAR dropout is plausible. Common approaches include:

**Tipping point analysis.** Determine how large the MNAR departure (e.g., mean difference between observed and missing outcomes) would need to be to reverse the study conclusion.

**Reference-based imputation.** Impute missing values from a reference distribution (e.g., the control arm distribution), reflecting a clinically meaningful scenario (e.g., a subject who drops out of an active treatment arm will behave like a control subject thereafter).

**\(\delta\)-adjustment.** In a pattern mixture framework, shift the distribution of missing outcomes by a constant \(\delta\) relative to the MAR prediction, then vary \(\delta\) over a range of plausible values.

<div class="remark">
<strong>Remark 10.1.</strong> No statistical method can verify whether the MNAR assumption holds from the observed data — that requires external subject-matter knowledge. The analyst's responsibility is to (i) make the assumed missing data mechanism transparent, (ii) report results under a range of plausible assumptions, and (iii) identify the assumptions under which the primary conclusion would change.
</div>

## 10.10 Prevention: Study Design Considerations

The best remedy for missing data is prevention. Design strategies include:

- **Frequent contact** with participants to maximise retention;
- **Collection of auxiliary variables** that predict future dropout or can be used as covariates in dropout models;
- **Pre-specified sensitivity analyses** in the statistical analysis plan;
- **Multiple data sources** (administrative records, proxy informants) to reduce the impact of primary-data missingness.

---

# Appendix: Summary of Key Estimating Equations

For reference, the key estimating equations across all model classes are collected here.

**GLS (Chapter 3):**

\[
\sum_{i=1}^m X_i^\top \Sigma_i^{-1} (Y_i - X_i\beta) = 0
\]

**Henderson's Mixed Model Equations (Chapter 4):**

\[
\begin{pmatrix} X^\top R^{-1} X & X^\top R^{-1} Z \\ Z^\top R^{-1} X & Z^\top R^{-1} Z + G^{-1} \end{pmatrix} \begin{pmatrix} \hat\beta \\ \tilde b \end{pmatrix} = \begin{pmatrix} X^\top R^{-1} Y \\ Z^\top R^{-1} Y \end{pmatrix}
\]

**GEE Score Equations (Chapter 6):**

\[
\sum_{i=1}^m D_i^\top V_i^{-1} (Y_i - \mu_i) = 0, \quad V_i = \phi^{-1} A_i^{1/2} R_i(\alpha) A_i^{1/2}
\]

**GLMM Penalized Score (Chapter 7):**

\[
\sum_{i=1}^m \left\lbrack \sum_{j=1}^{n_i} \frac{\partial \log f(Y_{ij} \mid b_i)}{\partial \beta} \right\rbrack = 0, \quad \tilde b_i = E[b_i \mid Y_i]
\]

**IPCW-GEE (Chapter 10):**

\[
\sum_{i=1}^m \sum_{j: R_{ij}=1} w_{ij} D_{ij}^\top V_{ij}^{-1}(Y_{ij} - \mu_{ij}) = 0
\]

---

*Notes compiled for STAT 936: Analysis of Longitudinal Data, University of Waterloo. Professor Glen McGee. Based on lectures from Winter 2025 and Winter 2026.*
