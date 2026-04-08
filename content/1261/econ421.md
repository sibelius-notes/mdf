---
title: "ECON 421: Econometric Theory"
prof: "Tao Chen"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Stock, J. H. & Watson, M. W. (2020). *Introduction to Econometrics*, 4th ed. Pearson.

**Supplementary texts** — Cameron, A. C. & Trivedi, P. K. (2005). *Microeconometrics: Methods and Applications*. Cambridge UP; Greene, W. H. (2018). *Econometric Analysis*, 8th ed. Pearson; White, H. (1984). *Asymptotic Theory for Econometricians*. Academic Press.

**Online resources** — MIT OCW 14.382 (Econometrics, Victor Chernozhukov); Hansen, B. E. *Econometrics* (free at ssc.wisc.edu/~bhansen/econometrics/); Hayashi, F. *Econometrics* (Princeton UP, 2000) — rigorous treatment of GMM and IV.

---

# Chapter 1: Mathematical and Asymptotic Foundations

## 1.1 Linear Algebra Review

Econometric theory makes extensive use of matrix algebra. Let \( \mathbf{A} \) be an \( m \times n \) matrix. Key operations and concepts:

- **Transpose:** \( \mathbf{A}^{\top} \) is \( n \times m \).
- **Matrix multiplication:** \( (\mathbf{AB})_{ij} = \sum_k A_{ik}B_{kj} \); requires inner dimensions to match.
- **Inverse:** For a square non-singular matrix, \( \mathbf{A}\mathbf{A}^{-1} = \mathbf{I} \).
- **Idempotency:** \( \mathbf{A}^2 = \mathbf{A} \); arises in projection matrices.
- **Rank:** \( \text{rank}(\mathbf{A}) \leq \min(m,n) \); full column rank means columns are linearly independent.
- **Positive definiteness:** A symmetric matrix \( \mathbf{A} \) is positive definite (PD) if \( \mathbf{v}^{\top}\mathbf{A}\mathbf{v} > 0 \) for all \( \mathbf{v} \neq \mathbf{0} \). Variance-covariance matrices are positive semidefinite (PSD).

The **projection matrix** (hat matrix) and its complement:

\[ \mathbf{P} = \mathbf{X}(\mathbf{X}^{\top}\mathbf{X})^{-1}\mathbf{X}^{\top}, \qquad \mathbf{M} = \mathbf{I}_n - \mathbf{P} \]

Both are symmetric and idempotent: \( \mathbf{P}^2 = \mathbf{P} \), \( \mathbf{M}^2 = \mathbf{M} \), \( \mathbf{PM} = \mathbf{0} \). \( \mathbf{P} \) projects onto the column space of \( \mathbf{X} \); \( \mathbf{M} \) projects onto the orthogonal complement (residual space).

## 1.2 Modes of Convergence

Let \( \{X_n\} \) be a sequence of random variables.

<div class="definition">
<strong>Convergence in Probability:</strong> \( X_n \xrightarrow{p} c \) if \( \lim_{n\to\infty} P(|X_n - c| > \varepsilon) = 0 \) for every \( \varepsilon > 0 \).

<strong>Convergence in Distribution:</strong> \( X_n \xrightarrow{d} X \) if \( F_{X_n}(x) \to F_X(x) \) at all continuity points of \( F_X \).

<strong>Almost Sure Convergence:</strong> \( X_n \xrightarrow{a.s.} c \) if \( P(\lim_{n\to\infty} X_n = c) = 1 \).
</div>

The hierarchy is: a.s. convergence \( \Rightarrow \) convergence in probability \( \Rightarrow \) convergence in distribution.

**Slutsky's theorem:** If \( X_n \xrightarrow{d} X \) and \( Y_n \xrightarrow{p} c \), then \( X_n + Y_n \xrightarrow{d} X + c \) and \( X_n Y_n \xrightarrow{d} cX \).

**Continuous Mapping Theorem (CMT):** If \( X_n \xrightarrow{p} X \) (or \( \xrightarrow{d} \)) and \( g \) is a continuous function, then \( g(X_n) \xrightarrow{p} g(X) \) (or \( \xrightarrow{d} \)).

## 1.3 Laws of Large Numbers

The **Weak Law of Large Numbers (WLLN):** For i.i.d. random variables \( \{X_i\}_{i=1}^n \) with \( E[X_i] = \mu < \infty \):

\[ \bar{X}_n = \frac{1}{n}\sum_{i=1}^n X_i \xrightarrow{p} \mu \]

The **Strong Law (Kolmogorov):** Under the same conditions, \( \bar{X}_n \xrightarrow{a.s.} \mu \).

The WLLN is the foundation of consistency proofs for OLS: under mild regularity conditions, \( n^{-1}\mathbf{X}^{\top}\mathbf{X} \xrightarrow{p} \mathbf{Q} \) and \( n^{-1}\mathbf{X}^{\top}\mathbf{u} \xrightarrow{p} \mathbf{0} \).

## 1.4 Central Limit Theorems

The **Lindeberg-Lévy CLT:** For i.i.d. \( \{X_i\} \) with \( E[X_i] = \mu \) and \( \text{Var}(X_i) = \sigma^2 < \infty \):

\[ \sqrt{n}(\bar{X}_n - \mu) \xrightarrow{d} N(0, \sigma^2) \]

The **multivariate CLT:** For i.i.d. random vectors \( \{\mathbf{X}_i\} \) with mean \( \boldsymbol{\mu} \) and covariance \( \boldsymbol{\Sigma} \):

\[ \sqrt{n}(\bar{\mathbf{X}}_n - \boldsymbol{\mu}) \xrightarrow{d} N(\mathbf{0}, \boldsymbol{\Sigma}) \]

The **Delta method:** If \( \sqrt{n}(X_n - \theta) \xrightarrow{d} N(0, \sigma^2) \) and \( g \) is differentiable at \( \theta \):

\[ \sqrt{n}(g(X_n) - g(\theta)) \xrightarrow{d} N\!\left(0,\, [g'(\theta)]^2 \sigma^2\right) \]

This is used extensively to derive asymptotic distributions of nonlinear functions of parameter estimates (e.g., elasticities, predicted probabilities).

---

# Chapter 2: The Classical Linear Model in Matrix Form

## 2.1 Setup and Assumptions

The model \( \mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{u} \) with \( n \) observations and \( k+1 \) parameters (including an intercept).

<div class="definition">
<strong>Classical Assumptions (Matrix Form):</strong>
<ul>
<li><strong>A1 — Linearity:</strong> \( \mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{u} \)</li>
<li><strong>A2 — Full rank:</strong> \( \text{rank}(\mathbf{X}) = k + 1 \) (no perfect multicollinearity)</li>
<li><strong>A3 — Strict exogeneity:</strong> \( E[\mathbf{u} \mid \mathbf{X}] = \mathbf{0} \)</li>
<li><strong>A4 — Spherical errors:</strong> \( E[\mathbf{u}\mathbf{u}^{\top} \mid \mathbf{X}] = \sigma^2 \mathbf{I}_n \) (homoskedasticity + no serial correlation)</li>
<li><strong>A5 — Normality:</strong> \( \mathbf{u} \mid \mathbf{X} \sim N(\mathbf{0}, \sigma^2\mathbf{I}_n) \)</li>
</ul>
</div>

## 2.2 OLS Derivation and Algebraic Properties

Minimizing \( S(\boldsymbol{\beta}) = (\mathbf{y} - \mathbf{X}\boldsymbol{\beta})^{\top}(\mathbf{y} - \mathbf{X}\boldsymbol{\beta}) \) with respect to \( \boldsymbol{\beta} \):

\[ \frac{\partial S}{\partial \boldsymbol{\beta}} = -2\mathbf{X}^{\top}(\mathbf{y} - \mathbf{X}\boldsymbol{\beta}) = \mathbf{0} \implies \mathbf{X}^{\top}\mathbf{X}\hat{\boldsymbol{\beta}} = \mathbf{X}^{\top}\mathbf{y} \]

The **normal equations** \( \mathbf{X}^{\top}\mathbf{X}\hat{\boldsymbol{\beta}} = \mathbf{X}^{\top}\mathbf{y} \) have unique solution (under A2):

\[ \hat{\boldsymbol{\beta}} = (\mathbf{X}^{\top}\mathbf{X})^{-1}\mathbf{X}^{\top}\mathbf{y} \]

Residuals: \( \hat{\mathbf{u}} = \mathbf{M}\mathbf{y} = \mathbf{M}\mathbf{u} \) (since \( \mathbf{M}\mathbf{X} = \mathbf{0} \)). Key properties: \( \mathbf{X}^{\top}\hat{\mathbf{u}} = \mathbf{0} \), \( \mathbf{1}^{\top}\hat{\mathbf{u}} = 0 \) (when intercept included).

<div class="theorem">
<strong>Gauss-Markov Theorem (Matrix Form):</strong> Under A1–A4, the OLS estimator \( \hat{\boldsymbol{\beta}} \) is the Best Linear Unbiased Estimator (BLUE): for any other linear unbiased estimator \( \tilde{\boldsymbol{\beta}} = \mathbf{C}\mathbf{y} \), we have
\[ \text{Var}(\tilde{\boldsymbol{\beta}} \mid \mathbf{X}) - \text{Var}(\hat{\boldsymbol{\beta}} \mid \mathbf{X}) \]
is positive semidefinite, meaning OLS has the smallest variance in any linear direction.
</div>

<div class="proof">
Let \( \tilde{\boldsymbol{\beta}} = \mathbf{C}\mathbf{y} \) be linear and unbiased: \( E[\mathbf{C}\mathbf{y} \mid \mathbf{X}] = \mathbf{C}\mathbf{X}\boldsymbol{\beta} = \boldsymbol{\beta} \) requires \( \mathbf{C}\mathbf{X} = \mathbf{I} \). Write \( \mathbf{C} = (\mathbf{X}^{\top}\mathbf{X})^{-1}\mathbf{X}^{\top} + \mathbf{D} \) where \( \mathbf{D}\mathbf{X} = \mathbf{0} \). Then \( \text{Var}(\tilde{\boldsymbol{\beta}} \mid \mathbf{X}) = \sigma^2\mathbf{C}\mathbf{C}^{\top} = \sigma^2[(\mathbf{X}^{\top}\mathbf{X})^{-1} + \mathbf{D}\mathbf{D}^{\top}] \geq \text{Var}(\hat{\boldsymbol{\beta}} \mid \mathbf{X}) \) since \( \mathbf{D}\mathbf{D}^{\top} \) is PSD.
</div>

## 2.3 Partitioned Regression and FWL

Given \( \mathbf{y} = \mathbf{X}_1\boldsymbol{\beta}_1 + \mathbf{X}_2\boldsymbol{\beta}_2 + \mathbf{u} \), the **Frisch-Waugh-Lovell theorem** states that \( \hat{\boldsymbol{\beta}}_2 \) from the full regression equals the OLS coefficient from regressing \( \mathbf{M}_1\mathbf{y} \) on \( \mathbf{M}_1\mathbf{X}_2 \), where \( \mathbf{M}_1 = \mathbf{I} - \mathbf{X}_1(\mathbf{X}_1^{\top}\mathbf{X}_1)^{-1}\mathbf{X}_1^{\top} \).

This theorem has deep implications: it shows that adding control variables partials them out algebraically, and it forms the basis for within-group and fixed effects estimators.

## 2.4 Hypothesis Testing Under Normality

Under A1–A5:

\[ \hat{\boldsymbol{\beta}} \mid \mathbf{X} \sim N\!\left(\boldsymbol{\beta},\, \sigma^2(\mathbf{X}^{\top}\mathbf{X})^{-1}\right) \]

For testing \( H_0: \boldsymbol{r}^{\top}\boldsymbol{\beta} = r_0 \):

\[ t = \frac{\boldsymbol{r}^{\top}\hat{\boldsymbol{\beta}} - r_0}{\hat{\sigma}\sqrt{\boldsymbol{r}^{\top}(\mathbf{X}^{\top}\mathbf{X})^{-1}\boldsymbol{r}}} \sim t(n-k-1) \]

For \( q \) linear restrictions \( H_0: \mathbf{R}\boldsymbol{\beta} = \mathbf{r} \):

\[ F = \frac{(\mathbf{R}\hat{\boldsymbol{\beta}} - \mathbf{r})^{\top}\left[\mathbf{R}(\mathbf{X}^{\top}\mathbf{X})^{-1}\mathbf{R}^{\top}\right]^{-1}(\mathbf{R}\hat{\boldsymbol{\beta}} - \mathbf{r})}{q\hat{\sigma}^2} \sim F(q, n-k-1) \]

---

# Chapter 3: Generalized Least Squares

## 3.1 Non-Spherical Errors

Relax A4 to allow \( E[\mathbf{u}\mathbf{u}^{\top}\mid\mathbf{X}] = \sigma^2\boldsymbol{\Omega} \) where \( \boldsymbol{\Omega} \neq \mathbf{I}_n \). This encompasses:

- **Heteroskedasticity:** \( \boldsymbol{\Omega} = \text{diag}(\omega_1, \ldots, \omega_n) \)
- **Serial correlation:** off-diagonal elements of \( \boldsymbol{\Omega} \) are non-zero
- Both simultaneously

OLS remains unbiased and consistent under A1–A3 alone. Its variance is now:

\[ \text{Var}(\hat{\boldsymbol{\beta}} \mid \mathbf{X}) = \sigma^2 (\mathbf{X}^{\top}\mathbf{X})^{-1}\mathbf{X}^{\top}\boldsymbol{\Omega}\mathbf{X}(\mathbf{X}^{\top}\mathbf{X})^{-1} \]

This is the **sandwich** (Eicker-Huber-White) form.

## 3.2 GLS Estimator

Since \( \boldsymbol{\Omega} \) is PD symmetric, write \( \boldsymbol{\Omega} = \mathbf{P}\mathbf{P}^{\top} \) (Cholesky) and let \( \boldsymbol{\Omega}^{-1/2} \) be the transformation matrix. Pre-multiply the model by \( \boldsymbol{\Omega}^{-1/2} \):

\[ \boldsymbol{\Omega}^{-1/2}\mathbf{y} = \boldsymbol{\Omega}^{-1/2}\mathbf{X}\boldsymbol{\beta} + \boldsymbol{\Omega}^{-1/2}\mathbf{u} \]

The transformed errors \( \boldsymbol{\Omega}^{-1/2}\mathbf{u} \) have covariance \( \sigma^2\mathbf{I}_n \). OLS on the transformed model is **Generalized Least Squares (GLS)**:

\[ \hat{\boldsymbol{\beta}}_{GLS} = (\mathbf{X}^{\top}\boldsymbol{\Omega}^{-1}\mathbf{X})^{-1}\mathbf{X}^{\top}\boldsymbol{\Omega}^{-1}\mathbf{y} \]

<div class="theorem">
<strong>Aitken's Theorem:</strong> Under A1–A3 and \( E[\mathbf{u}\mathbf{u}^{\top} \mid \mathbf{X}] = \sigma^2\boldsymbol{\Omega} \), the GLS estimator \( \hat{\boldsymbol{\beta}}_{GLS} \) is BLUE. Its variance is \( \sigma^2(\mathbf{X}^{\top}\boldsymbol{\Omega}^{-1}\mathbf{X})^{-1} \), which is no larger (in the PSD sense) than the variance of any other linear unbiased estimator.
</div>

**Feasible GLS (FGLS):** In practice, \( \boldsymbol{\Omega} \) is unknown and must be estimated. Replace \( \boldsymbol{\Omega} \) with a consistent estimator \( \hat{\boldsymbol{\Omega}} \):

\[ \hat{\boldsymbol{\beta}}_{FGLS} = (\mathbf{X}^{\top}\hat{\boldsymbol{\Omega}}^{-1}\mathbf{X})^{-1}\mathbf{X}^{\top}\hat{\boldsymbol{\Omega}}^{-1}\mathbf{y} \]

FGLS is asymptotically equivalent to GLS but loses the finite-sample BLUE property.

---

# Chapter 4: Instrumental Variables and GMM

## 4.1 IV in the Matrix Framework

For the model \( \mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{u} \) with \( \mathbf{X} \) potentially endogenous, let \( \mathbf{Z} \) be an \( n \times m \) matrix of instruments (\( m \geq k+1 \)) satisfying:

- \( E[\mathbf{Z}^{\top}\mathbf{u}] = \mathbf{0} \) (exogeneity of instruments)
- \( \text{rank}(E[\mathbf{Z}^{\top}\mathbf{X}]) = k+1 \) (relevance / rank condition)

The **IV estimator** (exactly identified case, \( m = k+1 \)):

\[ \hat{\boldsymbol{\beta}}_{IV} = (\mathbf{Z}^{\top}\mathbf{X})^{-1}\mathbf{Z}^{\top}\mathbf{y} \]

The **2SLS estimator** (overidentified case):

\[ \hat{\boldsymbol{\beta}}_{2SLS} = (\hat{\mathbf{X}}^{\top}\hat{\mathbf{X}})^{-1}\hat{\mathbf{X}}^{\top}\mathbf{y} = (\mathbf{X}^{\top}\mathbf{P}_Z\mathbf{X})^{-1}\mathbf{X}^{\top}\mathbf{P}_Z\mathbf{y} \]

where \( \mathbf{P}_Z = \mathbf{Z}(\mathbf{Z}^{\top}\mathbf{Z})^{-1}\mathbf{Z}^{\top} \) is the projection onto the instrument space.

## 4.2 Asymptotic Theory for IV/2SLS

Under instrument relevance and exogeneity, 2SLS is consistent and asymptotically normal:

\[ \sqrt{n}(\hat{\boldsymbol{\beta}}_{2SLS} - \boldsymbol{\beta}) \xrightarrow{d} N\!\left(\mathbf{0},\, \sigma^2\left(E\left[\frac{\mathbf{X}^{\top}\mathbf{P}_Z\mathbf{X}}{n}\right]\right)^{-1}\right) \]

The asymptotic variance of 2SLS exceeds that of OLS (when OLS is consistent) by a factor related to the \( R^2 \) of the first stage. Weak instruments (small first-stage \( R^2 \)) make this loss of efficiency severe and can cause large finite-sample bias.

## 4.3 Method of Moments and GMM

**Method of Moments (MoM)** matches sample moments to their population counterparts. For the regression model, the OLS moment conditions are:

\[ E[\mathbf{x}_i u_i] = E[\mathbf{x}_i(y_i - \mathbf{x}_i^{\top}\boldsymbol{\beta})] = \mathbf{0} \]

Replacing expectations with sample averages gives the normal equations.

The **Generalized Method of Moments (GMM)** generalizes to \( m > k+1 \) moment conditions \( E[\mathbf{g}(\mathbf{w}_i, \boldsymbol{\theta})] = \mathbf{0} \). With overidentification, the sample moment vector \( \bar{\mathbf{g}}_n(\boldsymbol{\theta}) = n^{-1}\sum_i \mathbf{g}(\mathbf{w}_i, \boldsymbol{\theta}) \) cannot be set exactly to zero. GMM minimizes the weighted quadratic form:

\[ \hat{\boldsymbol{\theta}}_{GMM} = \argmin_{\boldsymbol{\theta}}\, \bar{\mathbf{g}}_n(\boldsymbol{\theta})^{\top} \mathbf{W} \, \bar{\mathbf{g}}_n(\boldsymbol{\theta}) \]

<div class="theorem">
<strong>Efficient GMM:</strong> The asymptotically optimal weighting matrix is \( \mathbf{W}^* = \boldsymbol{\Sigma}^{-1} \) where \( \boldsymbol{\Sigma} = E[\mathbf{g}_i\mathbf{g}_i^{\top}] \) is the variance of the moment conditions. Under i.i.d. sampling:
\[ \sqrt{n}(\hat{\boldsymbol{\theta}}_{GMM} - \boldsymbol{\theta}_0) \xrightarrow{d} N\!\left(\mathbf{0},\, (\mathbf{G}^{\top}\boldsymbol{\Sigma}^{-1}\mathbf{G})^{-1}\right) \]
where \( \mathbf{G} = E[\partial \mathbf{g}/\partial\boldsymbol{\theta}^{\top}] \). Efficient GMM achieves the semiparametric efficiency bound when only moment conditions are imposed.
</div>

In practice, \( \boldsymbol{\Sigma} \) is estimated in a first-stage GMM (using \( \mathbf{W} = \mathbf{I} \)), then the efficient second-stage GMM is run. Two-step GMM and continuously-updated GMM (CUE-GMM) are common implementations.

---

# Chapter 5: Maximum Likelihood Estimation

## 5.1 The MLE Principle

Given a parametric model with density \( f(y \mid \mathbf{x}; \boldsymbol{\theta}) \) and i.i.d. sample, the **log-likelihood function** is:

\[ \ell(\boldsymbol{\theta}) = \sum_{i=1}^n \ln f(y_i \mid \mathbf{x}_i; \boldsymbol{\theta}) \]

The **MLE** is \( \hat{\boldsymbol{\theta}}_{MLE} = \argmax_{\boldsymbol{\theta}} \ell(\boldsymbol{\theta}) \). First-order conditions (**score equations**):

\[ \mathbf{s}(\hat{\boldsymbol{\theta}}) = \frac{\partial \ell}{\partial \boldsymbol{\theta}}\bigg|_{\boldsymbol{\theta} = \hat{\boldsymbol{\theta}}} = \mathbf{0} \]

## 5.2 Asymptotic Properties of MLE

Under standard regularity conditions (correct specification, compact parameter space, identifying conditions):

<div class="theorem">
<strong>MLE Asymptotic Theory:</strong>
<ul>
<li><strong>Consistency:</strong> \( \hat{\boldsymbol{\theta}}_{MLE} \xrightarrow{p} \boldsymbol{\theta}_0 \).</li>
<li><strong>Asymptotic normality:</strong> \( \sqrt{n}(\hat{\boldsymbol{\theta}}_{MLE} - \boldsymbol{\theta}_0) \xrightarrow{d} N(\mathbf{0}, \mathcal{I}(\boldsymbol{\theta}_0)^{-1}) \) where \( \mathcal{I} \) is the Fisher information matrix.</li>
<li><strong>Asymptotic efficiency:</strong> MLE achieves the Cramér-Rao lower bound.</li>
</ul>
</div>

The **Fisher information matrix** is:

\[ \mathcal{I}(\boldsymbol{\theta}) = E\!\left[-\frac{\partial^2 \ln f}{\partial\boldsymbol{\theta}\,\partial\boldsymbol{\theta}^{\top}}\right] = E\!\left[\frac{\partial \ln f}{\partial\boldsymbol{\theta}}\frac{\partial \ln f}{\partial\boldsymbol{\theta}^{\top}}\right] \]

(These two expressions are equal under standard regularity — the **information matrix equality**.)

## 5.3 MLE for the Linear Model

For the normal linear model \( \mathbf{y} \mid \mathbf{X} \sim N(\mathbf{X}\boldsymbol{\beta}, \sigma^2\mathbf{I}) \):

\[ \ell(\boldsymbol{\beta}, \sigma^2) = -\frac{n}{2}\ln(2\pi) - \frac{n}{2}\ln\sigma^2 - \frac{1}{2\sigma^2}(\mathbf{y} - \mathbf{X}\boldsymbol{\beta})^{\top}(\mathbf{y} - \mathbf{X}\boldsymbol{\beta}) \]

Maximizing over \( \boldsymbol{\beta} \) gives \( \hat{\boldsymbol{\beta}}_{MLE} = \hat{\boldsymbol{\beta}}_{OLS} \). Maximizing over \( \sigma^2 \):

\[ \hat{\sigma}^2_{MLE} = \frac{1}{n}\sum_{i=1}^n \hat{u}_i^2 \]

This is biased (divides by \( n \) rather than \( n-k-1 \)). The unbiased OLS estimator \( s^2 = \text{SSR}/(n-k-1) \) differs from MLE.

## 5.4 Hypothesis Testing: Wald, LR, and LM Tests

Three asymptotically equivalent tests for \( H_0: \boldsymbol{r}(\boldsymbol{\theta}) = \mathbf{0} \) (\( q \) restrictions):

**Wald test:** Estimated at the unrestricted MLE:
\[ W = n\,\boldsymbol{r}(\hat{\boldsymbol{\theta}})^{\top}\left[\frac{\partial\boldsymbol{r}}{\partial\boldsymbol{\theta}^{\top}}\mathcal{I}(\hat{\boldsymbol{\theta}})^{-1}\frac{\partial\boldsymbol{r}^{\top}}{\partial\boldsymbol{\theta}}\right]^{-1}\boldsymbol{r}(\hat{\boldsymbol{\theta}}) \xrightarrow{d} \chi^2(q) \]

**Likelihood Ratio (LR) test:** Compare log-likelihoods:
\[ LR = 2\left[\ell(\hat{\boldsymbol{\theta}}_{ur}) - \ell(\hat{\boldsymbol{\theta}}_r)\right] \xrightarrow{d} \chi^2(q) \]

**Lagrange Multiplier (LM) / Score test:** Evaluated at the restricted MLE (computationally attractive when the unrestricted model is hard to estimate):
\[ LM = \frac{1}{n}\mathbf{s}(\hat{\boldsymbol{\theta}}_r)^{\top}\mathcal{I}(\hat{\boldsymbol{\theta}}_r)^{-1}\mathbf{s}(\hat{\boldsymbol{\theta}}_r) \xrightarrow{d} \chi^2(q) \]

All three tests have the same asymptotic distribution but differ in finite samples and computational requirements.

---

# Chapter 6: Nonlinear Least Squares

## 6.1 Setup

The **Nonlinear Least Squares (NLS)** model is:

\[ y_i = f(\mathbf{x}_i, \boldsymbol{\theta}) + u_i \]

where \( f \) is a known but nonlinear function of the parameter vector \( \boldsymbol{\theta} \). NLS minimizes:

\[ S(\boldsymbol{\theta}) = \sum_{i=1}^n \left[y_i - f(\mathbf{x}_i, \boldsymbol{\theta})\right]^2 \]

The first-order condition \( \mathbf{F}(\boldsymbol{\theta})^{\top}[\mathbf{y} - \mathbf{f}(\boldsymbol{\theta})] = \mathbf{0} \) (where \( \mathbf{F} \) is the Jacobian matrix of partial derivatives) is generally nonlinear in \( \boldsymbol{\theta} \) and must be solved numerically, e.g., by the **Gauss-Newton algorithm**:

\[ \boldsymbol{\theta}^{(m+1)} = \boldsymbol{\theta}^{(m)} + \left[\mathbf{F}^{(m)\top}\mathbf{F}^{(m)}\right]^{-1}\mathbf{F}^{(m)\top}\left[\mathbf{y} - \mathbf{f}(\boldsymbol{\theta}^{(m)})\right] \]

## 6.2 Asymptotic Properties of NLS

Under standard regularity conditions and \( E[u_i \mid \mathbf{x}_i] = 0 \):

\[ \sqrt{n}(\hat{\boldsymbol{\theta}}_{NLS} - \boldsymbol{\theta}_0) \xrightarrow{d} N\!\left(\mathbf{0},\, \sigma^2\left(E\left[\mathbf{f}_{\boldsymbol{\theta}}\mathbf{f}_{\boldsymbol{\theta}}^{\top}\right]\right)^{-1}\right) \]

where \( \mathbf{f}_{\boldsymbol{\theta}} = \partial f / \partial \boldsymbol{\theta} \). The structure mirrors OLS asymptotics, with \( \mathbf{X} \) replaced by the Jacobian evaluated at the true parameter.

---

# Chapter 7: Limited Dependent Variables — Theoretical Treatment

## 7.1 Binary Models: Latent Variable Interpretation

Binary and ordered models are most naturally understood via a **latent variable** framework:

\[ y_i^* = \mathbf{x}_i^{\top}\boldsymbol{\beta} + u_i, \qquad y_i = \mathbf{1}(y_i^* > 0) \]

- If \( u_i \mid \mathbf{x}_i \sim N(0,1) \): **probit model**, \( P(y_i=1\mid\mathbf{x}_i) = \Phi(\mathbf{x}_i^{\top}\boldsymbol{\beta}) \).
- If \( u_i \mid \mathbf{x}_i \sim \text{Logistic}(0,1) \): **logit model**, \( P(y_i=1\mid\mathbf{x}_i) = \Lambda(\mathbf{x}_i^{\top}\boldsymbol{\beta}) \).

Note that only the sign of \( y_i^* \) is observed, so scale is not identified: the error variance is normalized to 1 (probit) or \( \pi^2/3 \) (logit). The coefficients \( \boldsymbol{\beta} \) are identified only up to this normalization.

## 7.2 Censored and Truncated Regression

The **Tobit model** (Tobin 1958) is designed for outcomes censored at zero:

\[ y_i^* = \mathbf{x}_i^{\top}\boldsymbol{\beta} + u_i, \quad u_i \sim N(0,\sigma^2); \qquad y_i = \max(0, y_i^*) \]

The log-likelihood combines a probit component (for \( y_i = 0 \)) and a normal density component (for \( y_i > 0 \)):

\[ \ell = \sum_{y_i=0} \ln\!\left[1 - \Phi\!\left(\frac{\mathbf{x}_i^{\top}\boldsymbol{\beta}}{\sigma}\right)\right] + \sum_{y_i>0} \left[-\frac{1}{2}\ln(2\pi\sigma^2) - \frac{(y_i - \mathbf{x}_i^{\top}\boldsymbol{\beta})^2}{2\sigma^2}\right] \]

OLS applied to the observed \( y_i > 0 \) observations (**truncated regression**) gives biased estimates due to sample selection.

## 7.3 An Introduction to Machine Learning in Econometrics

The final portion of the course introduces a contrast between econometric and machine-learning approaches to prediction. Key concepts: **bias-variance tradeoff**, **cross-validation** for model selection, **LASSO** (which performs variable selection by adding an \( \ell_1 \) penalty to OLS), and **ridge regression** (which shrinks coefficients via an \( \ell_2 \) penalty).

These ideas are developed more fully in ECON 424. The econometric perspective emphasizes that prediction accuracy and causal identification are distinct goals — high predictive power does not imply valid causal inference.
