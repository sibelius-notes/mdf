---
title: "ECON 322: Econometric Analysis 1"
prof: "Pierre Chaussé"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Wooldridge, Jeffrey M. (2025). *Introductory Econometrics: A Modern Approach*, 8th ed. Cengage Learning.

**Supplementary texts** — Lecture notes by Pierre Chaussé (StatsReview, SimpleReg, MultiReg, Inference, SpecTopics, Binary, Heterosk, MeasError); Greene, W. H. *Econometric Analysis*, 8th ed.

**Online resources** — MIT OpenCourseWare 14.30 (Introduction to Statistical Methods in Economics); Angrist & Pischke *Mostly Harmless Econometrics* (Princeton UP, 2009) for conceptual depth on identification; Stock & Watson *Introduction to Econometrics* for supplementary exercises.

---

# Chapter 1: Foundations of Probability and Statistics

## 1.1 Random Variables and Distributions

Econometrics rests on the theory of probability. A **random variable** \( X \) is a function mapping outcomes of a random experiment to real numbers. Two fundamental types arise: **discrete** random variables (countable range, described by a probability mass function) and **continuous** random variables (uncountable range, described by a probability density function \( f(x) \) satisfying \( f(x) \geq 0 \) and \( \int_{-\infty}^{\infty} f(x)\,dx = 1 \)).

The **cumulative distribution function** (CDF) is defined as \( F(x) = P(X \leq x) \). For a continuous variable, \( F(x) = \int_{-\infty}^{x} f(t)\,dt \).

<div class="definition">
<strong>Expected Value:</strong> The population mean of a random variable <em>X</em> is
\[ \mu = E[X] = \int_{-\infty}^{\infty} x\, f(x)\,dx \]
for continuous <em>X</em>, or <strong>\( \mu = \sum_x x \cdot P(X=x) \)</strong> for discrete <em>X</em>.
</div>

Key moments of a distribution:

- **Variance:** \( \text{Var}(X) = E\left[(X - \mu)^2\right] = E[X^2] - \mu^2 \)
- **Standard deviation:** \( \sigma = \sqrt{\text{Var}(X)} \)
- **Skewness:** third standardized central moment; measures asymmetry
- **Kurtosis:** fourth standardized central moment; measures tail heaviness

## 1.2 The Normal Distribution

The **normal distribution** \( X \sim N(\mu, \sigma^2) \) has density

\[ f(x) = \frac{1}{\sqrt{2\pi\sigma^2}} \exp\!\left(-\frac{(x-\mu)^2}{2\sigma^2}\right) \]

The **standard normal** \( Z \sim N(0,1) \) is obtained via the standardization \( Z = (X - \mu)/\sigma \). Econometrics relies heavily on the normal because of the **Central Limit Theorem (CLT)**: for i.i.d. random variables with mean \( \mu \) and variance \( \sigma^2 \), the standardized sample mean converges in distribution to \( N(0,1) \) as the sample size grows.

## 1.3 Sampling Distributions and Inference Concepts

Let \( \{X_1, \ldots, X_n\} \) be an i.i.d. sample. The **sample mean** \( \bar{X} = n^{-1}\sum_{i=1}^n X_i \) is an estimator of \( \mu \). Its sampling distribution satisfies \( E[\bar{X}] = \mu \) (unbiasedness) and \( \text{Var}(\bar{X}) = \sigma^2 / n \).

<div class="definition">
<strong>Unbiasedness:</strong> An estimator <strong>\( \hat{\theta} \)</strong> of a parameter <strong>\( \theta \)</strong> is <em>unbiased</em> if <strong>\( E[\hat{\theta}] = \theta \)</strong>. The <em>bias</em> is <strong>\( \text{Bias}(\hat{\theta}) = E[\hat{\theta}] - \theta \)</strong>.
</div>

**Consistency** is a large-sample property: \( \hat{\theta} \) is consistent if \( \hat{\theta} \xrightarrow{p} \theta \) as \( n \to \infty \). A sufficient condition is that both bias and variance vanish asymptotically.

The **chi-squared**, **t**, and **F** distributions are foundational for hypothesis testing in linear models:

- If \( Z_1, \ldots, Z_k \sim N(0,1) \) i.i.d., then \( \sum_{i=1}^k Z_i^2 \sim \chi^2(k) \).
- If \( Z \sim N(0,1) \) and \( W \sim \chi^2(k) \) independently, then \( T = Z/\sqrt{W/k} \sim t(k) \).
- The \( F(q, n-k-1) \) distribution arises in joint hypothesis tests.

## 1.4 Covariance and Correlation

For two random variables \( X \) and \( Y \):

\[ \text{Cov}(X, Y) = E\left[(X - E[X])(Y - E[Y])\right] = E[XY] - E[X]E[Y] \]

The **correlation coefficient** is a scale-free measure:

\[ \rho_{XY} = \frac{\text{Cov}(X,Y)}{\sqrt{\text{Var}(X)\,\text{Var}(Y)}} \in [-1, 1] \]

Independence of \( X \) and \( Y \) implies \( \rho_{XY} = 0 \), but the converse does not hold in general (zero correlation does not imply independence unless the joint distribution is normal).

---

# Chapter 2: The Simple Regression Model

## 2.1 Economic Motivation and Model Setup

A **simple linear regression model** postulates a linear relationship between a scalar dependent variable \( y \) and a single explanatory variable \( x \):

\[ y = \beta_0 + \beta_1 x + u \]

Here \( \beta_0 \) is the **intercept**, \( \beta_1 \) is the **slope** (the marginal effect of \( x \) on \( y \)), and \( u \) is the **error term** (disturbance), which captures all factors other than \( x \) that affect \( y \).

<div class="definition">
<strong>Gauss-Markov Assumption SLR.1–SLR.4 (Simple Regression):</strong>
<ol>
<li><strong>Linearity in parameters:</strong> \( y = \beta_0 + \beta_1 x + u \)</li>
<li><strong>Random sampling:</strong> \( \{(x_i, y_i)\}_{i=1}^n \) is an i.i.d. sample from the population.</li>
<li><strong>Sample variation in <em>x</em>:</strong> \( \sum_{i=1}^n (x_i - \bar{x})^2 > 0 \) (not all <em>x</em> values are the same).</li>
<li><strong>Zero conditional mean:</strong> \( E[u \mid x] = 0 \).</li>
</ol>
</div>

Assumption SLR.4 is the **key identification condition**. It implies that \( x \) and \( u \) are uncorrelated, so that \( \beta_1 \) captures the ceteris paribus effect of \( x \) on \( y \).

## 2.2 Derivation of the OLS Estimator

**Ordinary Least Squares (OLS)** minimizes the sum of squared residuals:

\[ \min_{\beta_0, \beta_1} \sum_{i=1}^n \left(y_i - \beta_0 - \beta_1 x_i\right)^2 \]

Taking first-order conditions and solving yields the closed-form estimators:

\[ \hat{\beta}_1 = \frac{\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y})}{\sum_{i=1}^n (x_i - \bar{x})^2} = \frac{\widehat{\text{Cov}}(x,y)}{\widehat{\text{Var}}(x)} \]

\[ \hat{\beta}_0 = \bar{y} - \hat{\beta}_1 \bar{x} \]

The **fitted values** are \( \hat{y}_i = \hat{\beta}_0 + \hat{\beta}_1 x_i \) and the **OLS residuals** are \( \hat{u}_i = y_i - \hat{y}_i \). By construction, \( \sum_{i=1}^n \hat{u}_i = 0 \) and \( \sum_{i=1}^n x_i \hat{u}_i = 0 \).

## 2.3 Goodness of Fit

The total variation in \( y \) decomposes as:

\[ \underbrace{\sum_{i=1}^n (y_i - \bar{y})^2}_{\text{SST}} = \underbrace{\sum_{i=1}^n (\hat{y}_i - \bar{y})^2}_{\text{SSE}} + \underbrace{\sum_{i=1}^n \hat{u}_i^2}_{\text{SSR}} \]

The **R-squared** (coefficient of determination) measures the fraction of variation in \( y \) explained by \( x \):

\[ R^2 = \frac{\text{SSE}}{\text{SST}} = 1 - \frac{\text{SSR}}{\text{SST}} \in [0, 1] \]

A higher \( R^2 \) indicates a better in-sample fit, but it should not be the sole criterion for model selection — a model with many irrelevant regressors will mechanically have a high \( R^2 \).

## 2.4 Properties of OLS Under SLR.1–SLR.4

Under assumptions SLR.1–SLR.4, OLS is **unbiased**: \( E[\hat{\beta}_0] = \beta_0 \) and \( E[\hat{\beta}_1] = \beta_1 \). The proof follows from substituting the population equation into the OLS formula and using \( E[u \mid x] = 0 \).

Adding **SLR.5** (homoskedasticity: \( \text{Var}(u \mid x) = \sigma^2 \)) gives the sampling variances:

\[ \text{Var}(\hat{\beta}_1) = \frac{\sigma^2}{\text{SST}_x}, \qquad \text{Var}(\hat{\beta}_0) = \frac{\sigma^2 n^{-1} \sum x_i^2}{\text{SST}_x} \]

The **Gauss-Markov Theorem** (for simple regression) states that under SLR.1–SLR.5, the OLS estimators are **BLUE** — Best Linear Unbiased Estimators — in the class of linear unbiased estimators.

An unbiased estimator of \( \sigma^2 \) is the sample variance of residuals:

\[ \hat{\sigma}^2 = \frac{1}{n-2} \sum_{i=1}^n \hat{u}_i^2 \]

Division by \( n-2 \) (not \( n \)) accounts for the two estimated parameters \( \hat{\beta}_0, \hat{\beta}_1 \).

---

# Chapter 3: Multiple Regression Analysis

## 3.1 The Multiple Linear Regression Model

In practice, \( y \) depends on many factors simultaneously. The **multiple linear regression (MLR)** model is:

\[ y = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \cdots + \beta_k x_k + u \]

<div class="definition">
<strong>Gauss-Markov Assumptions MLR.1–MLR.5:</strong>
<ol>
<li><strong>Linearity in parameters.</strong></li>
<li><strong>Random sampling.</strong></li>
<li><strong>No perfect collinearity:</strong> No regressor is an exact linear combination of the others; \( \text{rank}(X) = k+1 \).</li>
<li><strong>Zero conditional mean:</strong> \( E[u \mid x_1, \ldots, x_k] = 0 \).</li>
<li><strong>Homoskedasticity:</strong> \( \text{Var}(u \mid x_1, \ldots, x_k) = \sigma^2 \).</li>
</ol>
</div>

## 3.2 Interpretation of Coefficients

Each slope coefficient \( \beta_j \) measures the partial effect of \( x_j \) on \( y \) **holding all other regressors fixed**:

\[ \beta_j = \frac{\partial E[y \mid x_1, \ldots, x_k]}{\partial x_j} \]

This ceteris paribus interpretation is the central advantage of multiple over simple regression. Including relevant control variables reduces **omitted variable bias**.

<div class="remark">
<strong>Omitted Variable Bias:</strong> Suppose the true model includes \( x_2 \) but we omit it and regress <em>y</em> only on \( x_1 \). The simple regression estimator has expectation:
\[ E[\tilde{\beta}_1] = \beta_1 + \beta_2 \tilde{\delta}_1 \]
where \( \tilde{\delta}_1 \) is the slope from regressing \( x_2 \) on \( x_1 \). Bias arises whenever \( \beta_2 \neq 0 \) and \( x_1 \) and \( x_2 \) are correlated.
</div>

## 3.3 OLS Estimation and the Gauss-Markov Theorem

In matrix notation with \( n \) observations: \( \mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{u} \), where \( \mathbf{X} \) is \( n \times (k+1) \) with a column of ones. OLS minimizes \( \mathbf{u}^{\top}\mathbf{u} \), yielding:

\[ \hat{\boldsymbol{\beta}} = (\mathbf{X}^{\top}\mathbf{X})^{-1}\mathbf{X}^{\top}\mathbf{y} \]

Under MLR.1–MLR.5, the **Gauss-Markov Theorem** guarantees that \( \hat{\boldsymbol{\beta}} \) is BLUE.

## 3.4 Partialling Out and the Frisch-Waugh-Lovell Theorem

A useful algebraic result is the **Frisch-Waugh-Lovell (FWL) theorem**: the OLS estimate \( \hat{\beta}_j \) in the multiple regression equals the coefficient from regressing \( y \) on the residuals \( \tilde{x}_j \) obtained by projecting \( x_j \) on all other regressors. This makes explicit that OLS holds other regressors fixed.

## 3.5 Adjusted R-Squared and Model Selection

The standard \( R^2 \) never decreases when a variable is added, even if it is irrelevant. The **adjusted R-squared** penalizes for additional parameters:

\[ \bar{R}^2 = 1 - \frac{\text{SSR}/(n-k-1)}{\text{SST}/(n-1)} \]

\( \bar{R}^2 \) can decrease if the added variable contributes little explanatory power relative to the degrees-of-freedom cost. Additional model-selection criteria include the **Akaike Information Criterion (AIC)** and **Bayesian Information Criterion (BIC)**, which trade off fit against model complexity.

---

# Chapter 4: Inference and Large-Sample Properties

## 4.1 Exact Inference Under Normality

Adding assumption **MLR.6** (normality: \( u \mid \mathbf{x} \sim N(0, \sigma^2) \)) implies that \( \hat{\boldsymbol{\beta}} \mid \mathbf{X} \sim N\!\left(\boldsymbol{\beta},\, \sigma^2(\mathbf{X}^{\top}\mathbf{X})^{-1}\right) \).

The **t-statistic** for testing \( H_0: \beta_j = c \) is:

\[ t = \frac{\hat{\beta}_j - c}{\text{se}(\hat{\beta}_j)} \sim t(n - k - 1) \quad \text{under } H_0 \]

where \( \text{se}(\hat{\beta}_j) = \hat{\sigma}\sqrt{[(X^{\top}X)^{-1}]_{jj}} \).

## 4.2 Confidence Intervals

A \( (1-\alpha) \times 100\% \) confidence interval for \( \beta_j \) is:

\[ \hat{\beta}_j \pm t_{\alpha/2,\, n-k-1} \cdot \text{se}(\hat{\beta}_j) \]

The correct interpretation: if the experiment were repeated many times, \( (1-\alpha) \times 100\% \) of such intervals would contain the true \( \beta_j \).

## 4.3 F-Tests for Joint Hypotheses

To test \( q \) joint linear restrictions \( H_0: R\boldsymbol{\beta} = \mathbf{r} \), the **F-statistic** is:

\[ F = \frac{(\text{SSR}_r - \text{SSR}_{ur})/q}{\text{SSR}_{ur}/(n-k-1)} \sim F(q,\, n-k-1) \quad \text{under } H_0 \]

where subscripts \( r \) and \( ur \) denote restricted and unrestricted models. The **overall F-test** (\( H_0: \beta_1 = \cdots = \beta_k = 0 \)) tests whether any regressor explains \( y \).

## 4.4 Large-Sample (Asymptotic) Theory

Under MLR.1–MLR.5 without normality, OLS remains unbiased and consistent. The **asymptotic normality** of OLS follows from the CLT: as \( n \to \infty \),

\[ \sqrt{n}(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta}) \xrightarrow{d} N\!\left(\mathbf{0},\, \sigma^2 \mathbf{Q}^{-1}\right) \]

where \( \mathbf{Q} = \text{plim}\left(n^{-1}\mathbf{X}^{\top}\mathbf{X}\right) \). This justifies using t and F critical values in large samples even without the normality assumption MLR.6.

<div class="theorem">
<strong>Consistency of OLS:</strong> Under MLR.1–MLR.4 and the assumption that \( E[\mathbf{x}^{\top}\mathbf{x}] \) is finite and non-singular, the OLS estimator satisfies \( \hat{\boldsymbol{\beta}} \xrightarrow{p} \boldsymbol{\beta} \) as \( n \to \infty \).
</div>

---

# Chapter 5: Functional Forms and Forecasting

## 5.1 Logarithmic Transformations

Economic relationships frequently exhibit non-linearity in levels but approximate linearity in logarithms. The **log-log model** (constant elasticity form) is:

\[ \ln y = \beta_0 + \beta_1 \ln x + u \]

Here \( \beta_1 \) is the **elasticity** of \( y \) with respect to \( x \): a 1% increase in \( x \) leads to a \( \beta_1 \% \) change in \( y $.

The **log-linear (semi-log) model** is:

\[ \ln y = \beta_0 + \beta_1 x + u \]

Here \( 100 \cdot \beta_1 \) is the approximate percentage change in \( y \) for a one-unit increase in \( x \). More precisely, the exact percentage change is \( 100(e^{\beta_1} - 1) \).

<div class="example">
<strong>Wage Equation:</strong> The regression
\[ \ln(\text{wage}) = \beta_0 + \beta_1 \,\text{educ} + \beta_2 \,\text{exper} + u \]
gives the return to an additional year of education as approximately \( 100\hat{\beta}_1 \) percent (the Mincer equation).
</div>

## 5.2 Quadratic and Interaction Terms

Non-linear relationships in \( x \) can be accommodated with polynomial terms. The **quadratic specification** is:

\[ y = \beta_0 + \beta_1 x + \beta_2 x^2 + u \]

The marginal effect of \( x \) on \( y \) is \( \partial y / \partial x = \beta_1 + 2\beta_2 x \), which depends on the level of \( x \). The turning point (maximum or minimum) is at \( x^* = -\beta_1 / (2\beta_2) \).

**Interaction terms** capture how the effect of one variable depends on the level of another:

\[ y = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \beta_3 (x_1 \cdot x_2) + u \]

The marginal effect of \( x_1 \) is \( \beta_1 + \beta_3 x_2 \), varying with \( x_2 \).

## 5.3 Prediction and Forecast Intervals

Given a new observation \( \mathbf{x}_0 \), the **point prediction** of \( y_0 \) is \( \hat{y}_0 = \mathbf{x}_0^{\top}\hat{\boldsymbol{\beta}} \). The **prediction error** \( \hat{e}_0 = y_0 - \hat{y}_0 \) has variance:

\[ \text{Var}(\hat{e}_0) = \sigma^2\!\left(1 + \mathbf{x}_0^{\top}(\mathbf{X}^{\top}\mathbf{X})^{-1}\mathbf{x}_0\right) \]

A \( 95\% \) prediction interval accounts for both parameter uncertainty and the irreducible error variance \( \sigma^2 \), making it wider than a confidence interval for the conditional mean \( E[y_0 \mid \mathbf{x}_0] \).

## 5.4 Model Selection Criteria

When comparing non-nested models or models with different sets of regressors:

\[ \text{AIC} = \ln\!\left(\frac{\text{SSR}}{n}\right) + \frac{2(k+1)}{n}, \qquad \text{BIC} = \ln\!\left(\frac{\text{SSR}}{n}\right) + \frac{(k+1)\ln n}{n} \]

Lower values indicate a preferred model. BIC penalizes extra parameters more heavily than AIC when \( n \geq 8 \) (since \( \ln n > 2 \)), and BIC is consistent for the true model order under regularity conditions.

---

# Chapter 6: Regression with Dummy Variables

## 6.1 Binary (Indicator) Variables

Many economically relevant variables are qualitative: sex, race, employment status, geographic region, and so on. A **dummy variable** (indicator variable) takes value 1 if a condition is satisfied and 0 otherwise. Including a dummy \( D_i \) in a regression shifts the intercept:

\[ y_i = \beta_0 + \delta D_i + \beta_1 x_i + u_i \]

Here \( \delta \) measures the average difference in \( y \) between the \( D=1 \) and \( D=0 \) groups, holding \( x \) constant. The **base category** (group with \( D=0 \)) determines the reference intercept \( \beta_0 \).

## 6.2 The Dummy Variable Trap

If a categorical variable has \( m \) categories, one should include at most \( m-1 \) dummy variables. Including all \( m \) creates **perfect multicollinearity** (the column of ones is an exact linear combination of the dummies), making \( \mathbf{X}^{\top}\mathbf{X} \) singular — the **dummy variable trap**.

<div class="remark">
<strong>Example:</strong> For a variable "season" with categories {spring, summer, autumn, winter}, define three dummies for spring, summer, and autumn. Winter is the omitted base category. The coefficient on each included dummy measures the seasonal effect relative to winter.
</div>

## 6.3 Interactions with Dummy Variables

An interaction between a dummy \( D \) and a continuous regressor \( x \) allows the slope to differ between groups:

\[ y_i = \beta_0 + \delta D_i + \beta_1 x_i + \beta_2 (D_i \cdot x_i) + u_i \]

For \( D=0 \): \( E[y] = \beta_0 + \beta_1 x \); for \( D=1 \): \( E[y] = (\beta_0 + \delta) + (\beta_1 + \beta_2) x \). This is a **Chow-style decomposition**: the two groups may have different intercepts and slopes.

## 6.4 The Linear Probability Model

When the dependent variable is binary (\( y \in \{0, 1\} \)), OLS applied directly gives the **linear probability model (LPM)**:

\[ P(y = 1 \mid \mathbf{x}) = \mathbf{x}^{\top}\boldsymbol{\beta} \]

The OLS coefficient \( \beta_j \) measures the change in probability for a unit increase in \( x_j \). Limitations include predicted probabilities outside \([0,1]\) and inherent heteroskedasticity (since \( \text{Var}(y \mid \mathbf{x}) = p(1-p) \) depends on \( \mathbf{x} \)).

---

# Chapter 7: Heteroskedasticity

## 7.1 Nature and Consequences

**Heteroskedasticity** occurs when the variance of the error term depends on the regressors: \( \text{Var}(u_i \mid \mathbf{x}_i) = \sigma_i^2 \neq \sigma^2 \). This violates Gauss-Markov assumption MLR.5.

<div class="theorem">
<strong>Consequences of Heteroskedasticity for OLS:</strong>
<ul>
<li>OLS estimates remain <em>unbiased</em> and <em>consistent</em> (MLR.1–MLR.4 still hold).</li>
<li>OLS is <em>no longer efficient</em> — GLS dominates in the class of linear unbiased estimators.</li>
<li>Conventional standard errors (based on homoskedastic formula) are <em>inconsistent</em>, invalidating standard t and F tests.</li>
</ul>
</div>

## 7.2 Testing for Heteroskedasticity

**Breusch-Pagan (BP) test:** Regress squared residuals \( \hat{u}_i^2 \) on the regressors and test the joint significance of all slopes using an LM statistic:

\[ LM = n \cdot R^2_{\hat{u}^2} \xrightarrow{d} \chi^2(k) \quad \text{under } H_0 \text{ (homoskedasticity)} \]

**White test:** Similar, but includes squares and cross-products of all regressors in the auxiliary regression, detecting more general forms of heteroskedasticity.

## 7.3 Robust Standard Errors

The simplest remedy is to use **heteroskedasticity-robust (HC) standard errors** (Eicker-Huber-White sandwich estimator):

\[ \widehat{\text{Var}}_{HC}(\hat{\boldsymbol{\beta}}) = (\mathbf{X}^{\top}\mathbf{X})^{-1} \left(\sum_{i=1}^n \hat{u}_i^2\, \mathbf{x}_i \mathbf{x}_i^{\top}\right) (\mathbf{X}^{\top}\mathbf{X})^{-1} \]

This estimator is consistent regardless of the form of heteroskedasticity, so t and F statistics formed with these standard errors are valid asymptotically.

## 7.4 Weighted Least Squares

If the heteroskedastic structure is known — say \( \text{Var}(u_i \mid \mathbf{x}_i) = \sigma^2 h_i(\mathbf{x}_i) \) — **Weighted Least Squares (WLS)** achieves efficiency by minimizing the weighted sum of squares:

\[ \sum_{i=1}^n \frac{1}{h_i}(y_i - \mathbf{x}_i^{\top}\boldsymbol{\beta})^2 \]

This is equivalent to dividing the observation \( (y_i, \mathbf{x}_i) \) by \( \sqrt{h_i} \) and applying OLS to the transformed data. Under correct specification of \( h_i \), WLS is BLUE.

<div class="example">
<strong>Feasible GLS (FGLS):</strong> Since the true \( h_i \) is usually unknown, a common approach is to regress \( \ln\hat{u}_i^2 \) on functions of the regressors, obtain fitted values \( \hat{h}_i = \exp(\hat{g}_i) \), and use these as weights in WLS. This is <em>feasible GLS</em> (or feasible WLS).
</div>

---

# Chapter 8: Misspecification, Measurement Error, and Missing Data

## 8.1 Omitted Variables and Functional Form Misspecification

Even with no measurement problems, a model can be misspecified by omitting relevant variables or using the wrong functional form. As shown in Chapter 3, omitting a variable correlated with included regressors produces **omitted variable bias**.

The **RESET test** (Ramsey Regression Equation Specification Error Test) checks functional form by adding fitted-value polynomials to the regression:

\[ y = \mathbf{x}^{\top}\boldsymbol{\beta} + \delta_1 \hat{y}^2 + \delta_2 \hat{y}^3 + \text{error} \]

Rejection of \( H_0: \delta_1 = \delta_2 = 0 \) suggests functional form misspecification. The test does not, however, point to a particular remedy.

## 8.2 Measurement Error in the Dependent Variable

If the dependent variable is measured with classical error — \( y^* = y + e_0 \) where \( e_0 \) is independent of all regressors and the true error — then regressing \( y^* \) on \( \mathbf{x} \) adds \( e_0 \) to the composite error. OLS remains unbiased and consistent, but standard errors are larger (less efficiency).

## 8.3 Measurement Error in an Independent Variable

This case is more damaging. Suppose \( x_1^* = x_1 + e_1 \) is the mismeasured version of the true regressor \( x_1 \), where \( e_1 \) is classical measurement error (independent of \( x_1 \) and \( u \)). Substituting into the simple regression:

\[ y = \beta_0 + \beta_1 x_1^* + (u - \beta_1 e_1) = \beta_0 + \beta_1 x_1^* + v \]

The composite error \( v = u - \beta_1 e_1 \) is correlated with \( x_1^* = x_1 + e_1 \) because \( e_1 \) appears in both. This is the **errors-in-variables** or **attenuation bias** problem:

\[ \text{plim}(\hat{\beta}_1) = \beta_1 \cdot \frac{\sigma_{x_1}^2}{\sigma_{x_1}^2 + \sigma_{e_1}^2} \]

The factor \( \sigma_{x_1}^2 / (\sigma_{x_1}^2 + \sigma_{e_1}^2) < 1 \) is the **reliability ratio**. OLS attenuates the estimated effect toward zero. Instrumental variables (covered in ECON 323) provide a remedy.

<div class="remark">
<strong>Proxy Variables:</strong> When the true variable \( x_1 \) is unobservable but a proxy \( x_1^p = \delta_0 + \delta_1 x_1 + v \) is available (with \( v \) independent of other regressors and the structural error), including \( x_1^p \) partially controls for \( x_1 \). The proxy variable estimator is consistent if \( E[u \mid x_1, x_2, x_1^p] = E[u \mid x_1] \) (the "conditional independence" condition).
</div>

## 8.4 Missing Data and Sample Selection

**Missing completely at random (MCAR):** Data are missing irrespective of observed or unobserved characteristics. OLS on the complete cases is unbiased (though less precise).

**Missing at random (MAR):** Missingness depends on observed characteristics but not on the missing values themselves. Imputation or IPW methods can recover consistent estimates.

**Non-random sample selection:** When sample inclusion is correlated with the outcome, OLS on the selected sample is biased. This motivates **Heckman's selection model** (covered in ECON 422/423).

---

# Chapter 9: Practical Implementation in R

## 9.1 Basic OLS in R

```r
# Estimate a multiple regression
model <- lm(log(wage) ~ educ + exper + tenure, data = wage1)
summary(model)

# Heteroskedasticity-robust standard errors
library(sandwich)
library(lmtest)
coeftest(model, vcov = vcovHC(model, type = "HC1"))
```

## 9.2 Testing and Diagnostics

```r
# Breusch-Pagan test
library(lmtest)
bptest(model)

# RESET test for functional form
resettest(model, power = 2:3, type = "fitted")

# Joint F-test: H0: beta_educ = beta_exper = 0
linearHypothesis(model, c("educ = 0", "exper = 0"),
                 vcov = vcovHC(model, type = "HC1"))
```

## 9.3 Prediction

```r
# New data point
newdata <- data.frame(educ = 16, exper = 5, tenure = 3)

# Confidence interval for the conditional mean
predict(model, newdata, interval = "confidence", level = 0.95)

# Prediction interval for a new observation
predict(model, newdata, interval = "prediction", level = 0.95)
```

Producing output in **R Markdown** is essential for reproducible reporting: code, output, and prose coexist in a single `.Rmd` document compiled to PDF via `knitr` and `tinytex`.
