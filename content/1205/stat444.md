---
title: "STAT 444 - Statistical Learning / Nonparametric Regression"
prof: "Reza Ramezan"
---

# STAT 444: Statistical Learning / Nonparametric Regression

These notes follow Professor Reza Ramezan's Spring 2020 offering of STAT 444 at the University of Waterloo. The course builds from classical multiple regression through modern nonparametric smoothing methods, culminating in applications to neural spike-train data from computational neuroscience.

---

# Module 2: Multiple Regression Review

## The Linear Model and OLS

**Multiple linear regression** models a response variable <span>&#92;(y &#92;)</span> as a linear combination of <span>&#92;(p &#92;)</span> predictors plus Gaussian noise. In matrix form, with <span>&#92;(n &#92;)</span> observations:

<span>&#92;[
\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon}, \quad \boldsymbol{\varepsilon} \sim \mathcal{N}(\mathbf{0}, \sigma^2 \mathbf{I})
&#92;]</span>

where <span>&#92;(\mathbf{X} &#92;)</span> is the <span>&#92;(n \times (p+1) &#92;)</span> design matrix (with a column of ones for the intercept), <span>&#92;(\boldsymbol{\beta} = (\beta&#95;0, \beta&#95;1, \ldots, \beta&#95;p)^\top &#92;)</span> is the parameter vector, and <span>&#92;(\boldsymbol{\varepsilon} &#92;)</span> is a vector of independent errors with constant variance <span>&#92;(\sigma^2 &#92;)</span>.

**Ordinary least squares (OLS)** minimizes the **residual sum of squares**:

<span>&#92;[
\text{RSS}(\boldsymbol{\beta}) = \|\mathbf{y} - \mathbf{X}\boldsymbol{\beta}\|^2 = (\mathbf{y} - \mathbf{X}\boldsymbol{\beta})^\top(\mathbf{y} - \mathbf{X}\boldsymbol{\beta})
&#92;]</span>

Setting the gradient to zero yields the **normal equations** <span>&#92;(\mathbf{X}^\top\mathbf{X}\hat{\boldsymbol{\beta}} = \mathbf{X}^\top\mathbf{y} &#92;)</span>, giving the closed-form solution:

<span>&#92;[
\hat{\boldsymbol{\beta}} = (\mathbf{X}^\top\mathbf{X})^{-1}\mathbf{X}^\top\mathbf{y}
&#92;]</span>

This requires <span>&#92;(\mathbf{X}^\top\mathbf{X} &#92;)</span> to be invertible, which holds when no predictor is an exact linear combination of others (no multicollinearity) and <span>&#92;(n > p &#92;)</span>.

## The Hat Matrix

The **hat matrix** (or **projection matrix**) <span>&#92;(\mathbf{H} &#92;)</span> maps the observed responses to the fitted values:

<span>&#92;[
\hat{\mathbf{y}} = \mathbf{X}\hat{\boldsymbol{\beta}} = \mathbf{X}(\mathbf{X}^\top\mathbf{X})^{-1}\mathbf{X}^\top\mathbf{y} = \mathbf{H}\mathbf{y}
&#92;]</span>

The hat matrix satisfies two fundamental properties: it is **symmetric** (<span>&#92;(\mathbf{H}^\top = \mathbf{H} &#92;)</span>) and **idempotent** (<span>&#92;(\mathbf{H}^2 = \mathbf{H} &#92;)</span>). Geometrically, <span>&#92;(\mathbf{H} &#92;)</span> is an orthogonal projection onto the column space of <span>&#92;(\mathbf{X} &#92;)</span>. Similarly, <span>&#92;(\mathbf{I} - \mathbf{H} &#92;)</span> projects onto the orthogonal complement, so the **residuals** are:

<span>&#92;[
\mathbf{e} = \mathbf{y} - \hat{\mathbf{y}} = (\mathbf{I} - \mathbf{H})\mathbf{y}
&#92;]</span>

The diagonal entries <span>&#92;(h&#95;{ii} = \mathbf{H}&#95;{ii} &#92;)</span>, called **leverage values**, satisfy <span>&#92;(0 \leq h&#95;{ii} \leq 1 &#92;)</span> and <span>&#92;(\sum&#95;i h&#95;{ii} = p + 1 &#92;)</span>. A large <span>&#92;(h&#95;{ii} &#92;)</span> indicates that observation <span>&#92;(i &#92;)</span> has unusual predictor values and thus exerts strong influence on its own fitted value.

The RSS decomposes cleanly using the hat matrix:

<span>&#92;[
\text{RSS} = \mathbf{y}^\top(\mathbf{I} - \mathbf{H})\mathbf{y}
&#92;]</span>

and the unbiased estimator of <span>&#92;(\sigma^2 &#92;)</span> is:

<span>&#92;[
\hat{\sigma}^2 = \frac{\text{RSS}}{n - p - 1} = \frac{\sum&#95;{i=1}^n e&#95;i^2}{n - p - 1}
&#92;]</span>

The denominator <span>&#92;(n - p - 1 &#92;)</span> accounts for the <span>&#92;(p + 1 &#92;)</span> degrees of freedom consumed by estimating <span>&#92;(\boldsymbol{\beta} &#92;)</span>.

## Sampling Distributions and Inference

Under the Gaussian noise assumption, the OLS estimator follows:

<span>&#92;[
\hat{\boldsymbol{\beta}} \sim \mathcal{N}\!\left(\boldsymbol{\beta},\; \sigma^2 (\mathbf{X}^\top\mathbf{X})^{-1}\right)
&#92;]</span>

This is an **exact** (not asymptotic) result. The standard error of <span>&#92;(\hat\beta&#95;j &#92;)</span> is <span>&#92;(\hat\sigma\sqrt{[(\mathbf{X}^\top\mathbf{X})^{-1}]&#95;{jj}} &#92;)</span>, and the pivot statistic for a t-test of <span>&#92;(H&#95;0: \beta&#95;j = 0 &#92;)</span> is:

<span>&#92;[
T&#95;j = \frac{\hat\beta&#95;j}{\hat\sigma\sqrt{[(\mathbf{X}^\top\mathbf{X})^{-1}]&#95;{jj}}} \sim t&#95;{n-p-1}
&#92;]</span>

The overall **F-test** for <span>&#92;(H&#95;0: \beta&#95;1 = \cdots = \beta&#95;p = 0 &#92;)</span> uses the decomposition of total variation:

<span>&#92;[
\text{TSS} = \text{RegSS} + \text{RSS}
&#92;]</span>

where <span>&#92;(\text{TSS} = \sum&#95;i(y&#95;i - \bar y)^2 &#92;)</span> and <span>&#92;(\text{RegSS} = \text{TSS} - \text{RSS} &#92;)</span>. The F-statistic is:

<span>&#92;[
F = \frac{\text{RegSS}/p}{\text{RSS}/(n-p-1)} \sim F&#95;{p,\, n-p-1} \quad \text{under } H&#95;0
&#92;]</span>

The **coefficient of determination** <span>&#92;(R^2 = \text{RegSS}/\text{TSS} = 1 - \text{RSS}/\text{TSS} &#92;)</span> measures the proportion of variance explained, though it is non-decreasing in the number of predictors. The **adjusted** <span>&#92;(R^2 &#92;)</span> penalizes for model complexity:

<span>&#92;[
R^2&#95;\text{adj} = 1 - \frac{\text{RSS}/(n-p-1)}{\text{TSS}/(n-1)}
&#92;]</span>

## Extra Sum of Squares and Partial F-Tests

When comparing a **full model** (with predictors <span>&#92;(\mathbf{x}&#95;1, \ldots, \mathbf{x}&#95;p &#92;)</span>) to a **reduced model** (omitting predictors <span>&#92;(\mathbf{x}&#95;{q+1}, \ldots, \mathbf{x}&#95;p &#92;)</span>), the **extra sum of squares** is:

<span>&#92;[
\text{ESS} = \text{RSS}&#95;R - \text{RSS}&#95;F
&#92;]</span>

The partial F-test statistic:

<span>&#92;[
F = \frac{(\text{RSS}&#95;R - \text{RSS}&#95;F)/(p - q)}{\text{RSS}&#95;F/(n - p - 1)} \sim F&#95;{p-q,\; n-p-1} \quad \text{under } H&#95;0
&#92;]</span>

tests whether the additional predictors jointly improve the fit. This nesting structure is the foundation of systematic variable selection.

## Confidence and Prediction Intervals

The **confidence interval** for the mean response at a new point <span>&#92;(\mathbf{x}&#95;0 &#92;)</span> quantifies uncertainty about <span>&#92;(E[y|\mathbf{x}&#95;0] = \mathbf{x}&#95;0^\top\boldsymbol{\beta} &#92;)</span>:

<span>&#92;[
\hat y&#95;0 \;\pm\; t&#95;{n-p-1,\;\alpha/2}\;\hat\sigma\sqrt{\mathbf{x}&#95;0^\top(\mathbf{X}^\top\mathbf{X})^{-1}\mathbf{x}&#95;0}
&#92;]</span>

The **prediction interval** for a new observation <span>&#92;(y&#95;0 = \mathbf{x}&#95;0^\top\boldsymbol{\beta} + \varepsilon&#95;0 &#92;)</span> must also account for the irreducible noise <span>&#92;(\varepsilon&#95;0 &#92;)</span>:

<span>&#92;[
\hat y&#95;0 \;\pm\; t&#95;{n-p-1,\;\alpha/2}\;\hat\sigma\sqrt{1 + \mathbf{x}&#95;0^\top(\mathbf{X}^\top\mathbf{X})^{-1}\mathbf{x}&#95;0}
&#92;]</span>

The extra 1 under the square root ensures that prediction intervals are always wider than confidence intervals, reflecting the inherent unpredictability of individual outcomes.

## Residual Diagnostics and Influential Points

Standard diagnostic plots — residuals vs. fitted values (checking non-constant variance and non-linearity), quantile-quantile plots (checking normality), and scale-location plots — are the first line of defence against model misspecification.

**Cook's distance** measures the influence of observation <span>&#92;(i &#92;)</span> by computing how much all fitted values change when it is deleted:

<span>&#92;[
D&#95;i = \frac{(\hat{\boldsymbol{\beta}} - \hat{\boldsymbol{\beta}}&#95;{(-i)})^\top \mathbf{X}^\top\mathbf{X}(\hat{\boldsymbol{\beta}} - \hat{\boldsymbol{\beta}}&#95;{(-i)})}{(p+1)\hat\sigma^2} = \frac{e&#95;i^2}{(p+1)\hat\sigma^2} \cdot \frac{h&#95;{ii}}{(1-h&#95;{ii})^2}
&#92;]</span>

Observations with <span>&#92;(D&#95;i > 4/(n-p-1) &#92;)</span> are conventionally flagged as influential. Note that Cook's distance couples two concerns: large residuals (poor fit) and high leverage (unusual predictor values). A high-leverage point is only influential if it also has a large residual; a perfect-fit outlier on the predictor space causes no distortion.

**DFFITS** and **DFBETAS** provide finer-grained measures of observation influence on individual fitted values and specific coefficients, respectively.

---

# Module 3: The Bias-Variance Trade-Off

## Error Decomposition

The expected prediction error at a new point <span>&#92;(x&#95;0 &#92;)</span> can be decomposed into three irreducible components. Suppose we use a fitting procedure that produces an estimator <span>&#92;(\hat f(x&#95;0) &#92;)</span> trained on data <span>&#92;(\mathcal{D} &#92;)</span>, and the true model is <span>&#92;(y = f(x) + \varepsilon &#92;)</span> with <span>&#92;(\mathrm{Var}(\varepsilon) = \sigma^2 &#92;)</span>:

<span>&#92;[
\mathrm{EPE}(x&#95;0) = E\!\left[(y&#95;0 - \hat f(x&#95;0))^2\right] = \underbrace{\left[f(x&#95;0) - E[\hat f(x&#95;0)]\right]^2}&#95;{\text{Bias}^2} + \underbrace{\mathrm{Var}(\hat f(x&#95;0))}&#95;{\text{Variance}} + \underbrace{\sigma^2}&#95;{\text{Irreducible}}
&#92;]</span>

The **bias** measures the systematic error: how far, on average, the estimator is from the truth. The **variance** measures estimation instability: how much the estimator fluctuates across different training datasets. The **irreducible error** <span>&#92;(\sigma^2 &#92;)</span> is the noise inherent in the data-generating process and cannot be reduced by any model.

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 1, 200)
complexity = np.linspace(0, 1, 200)

bias2 = np.exp(-5 * complexity)
variance = 0.05 * np.exp(4 * complexity)
irreducible = np.full_like(complexity, 0.05)
mse = bias2 + variance + irreducible

fig, ax = plt.subplots(figsize=(7, 4))
ax.plot(complexity, bias2,   label=r'Bias$^2$',          color='steelblue', lw=2)
ax.plot(complexity, variance, label='Variance',           color='tomato',    lw=2)
ax.plot(complexity, irreducible, label='Irreducible',    color='gray',      lw=1.5, ls='--')
ax.plot(complexity, mse,      label='MSE = Bias²+Var+σ²', color='black',     lw=2.5)
ax.axvline(complexity[np.argmin(mse)], color='green', ls=':', label='Optimal complexity')
ax.set_xlabel('Model Complexity')
ax.set_ylabel('Error')
ax.set_title('Bias-Variance Trade-off')
ax.legend()
plt.tight_layout()
plt.savefig('bias_variance_tradeoff.png', dpi=150)
plt.show()
```

## Reducible vs. Irreducible Error

The key insight is that only the **reducible error** — the sum of bias² and variance — can be controlled through model selection. A simple model (few parameters) has high bias but low variance; a complex model (many parameters) has low bias but high variance. The optimal model minimises the total reducible error, producing a U-shaped MSE curve as a function of model complexity.

For the OLS estimator specifically, the Gauss-Markov theorem guarantees that it is the **best linear unbiased estimator (BLUE)**: among all linear estimators with zero bias, OLS has the smallest variance. However, this optimality within the unbiased class does not mean OLS is optimal overall — biased estimators (like ridge regression) can achieve lower MSE by trading a small amount of bias for a large reduction in variance.

---

# Module 4: Cross-Validation

## The Need for Out-of-Sample Evaluation

A model's training error (evaluated on the same data used to fit it) systematically underestimates the **generalisation error** (performance on new observations). Cross-validation is the standard remedy: it estimates out-of-sample performance by partitioning the available data so that evaluation never occurs on training observations.

## k-Fold Cross-Validation

In **k-fold cross-validation**, the data is randomly divided into <span>&#92;(k &#92;)</span> equal-sized folds. The model is fitted on <span>&#92;(k-1 &#92;)</span> folds and evaluated on the held-out fold; this is repeated <span>&#92;(k &#92;)</span> times, and the CV error is:

<span>&#92;[
\text{CV}&#95;k = \frac{1}{n}\sum&#95;{i=1}^n \left(y&#95;i - \hat f^{(-\kappa(i))}(x&#95;i)\right)^2
&#92;]</span>

where <span>&#92;(\hat f^{(-\kappa(i))} &#92;)</span> denotes the fit computed with fold <span>&#92;(\kappa(i) &#92;)</span> omitted. Common choices are <span>&#92;(k = 5 &#92;)</span> or <span>&#92;(k = 10 &#92;)</span>, which balance computational cost against bias.

## Leave-One-Out Cross-Validation

**Leave-one-out cross-validation (LOOCV)** takes <span>&#92;(k = n &#92;)</span>: each observation is held out in turn. For linear smoothers (where <span>&#92;(\hat{\mathbf{y}} = \mathbf{S}\mathbf{y} &#92;)</span> for some smoother matrix <span>&#92;(\mathbf{S} &#92;)</span>), there is a remarkable computational shortcut that avoids refitting the model <span>&#92;(n &#92;)</span> times. For OLS, <span>&#92;(\mathbf{S} = \mathbf{H} &#92;)</span>, and the shortcut formula is:

<span>&#92;[
\text{CV}&#95;{\text{LOO}} = \frac{1}{n}\sum&#95;{i=1}^n \left(\frac{e&#95;i}{1 - h&#95;{ii}}\right)^2
&#92;]</span>

where <span>&#92;(e&#95;i = y&#95;i - \hat y&#95;i &#92;)</span> is the ordinary residual and <span>&#92;(h&#95;{ii} &#92;)</span> is the <span>&#92;(i &#92;)</span>th diagonal of the hat matrix. Observations with high leverage <span>&#92;(h&#95;{ii} \to 1 &#92;)</span> receive very large weight in LOOCV — the model fits them almost exactly, so leaving them out would dramatically change the fit.

## Generalised Cross-Validation

**Generalised cross-validation (GCV)** replaces the individual leverages <span>&#92;(h&#95;{ii} &#92;)</span> with their average <span>&#92;(\bar h = (p+1)/n &#92;)</span>:

<span>&#92;[
\text{GCV} = \frac{1}{n}\sum&#95;{i=1}^n \left(\frac{e&#95;i}{1 - (p+1)/n}\right)^2 = \frac{\text{RSS}/n}{\left(1 - (p+1)/n\right)^2}
&#92;]</span>

GCV is computationally cheaper than LOOCV and generalises naturally beyond linear models to any smoother with a well-defined effective degrees of freedom <span>&#92;(\text{df} = \mathrm{tr}(\mathbf{S}) &#92;)</span>:

<span>&#92;[
\text{GCV} = \frac{1}{n}\sum&#95;{i=1}^n \left(\frac{e&#95;i}{1 - \mathrm{tr}(\mathbf{S})/n}\right)^2
&#92;]</span>

This formulation is particularly important for smoothing splines and kernel regression, where the smoother matrix depends on a tuning parameter.

---

# Module 5: Variable Selection

## The Challenge of Many Predictors

When <span>&#92;(p &#92;)</span> predictors are available, including all of them may overfit the data and inflate variance. The goal of **variable selection** is to identify a parsimonious model — using a subset of the predictors — that achieves low out-of-sample prediction error or provides interpretable inference.

**Best-subset selection** examines all <span>&#92;(2^p &#92;)</span> possible subsets of predictors and selects the best by some criterion. This is computationally feasible only for small <span>&#92;(p &#92;)</span> (say <span>&#92;(p \leq 30 &#92;)</span>); for larger problems, greedy algorithms are the practical alternative.

## Greedy Approaches

**Forward stepwise selection** begins with an intercept-only model and iteratively adds the predictor that most improves the fit criterion, stopping when no further improvement exceeds a threshold. It examines at most <span>&#92;(1 + p + (p-1) + \cdots + 1 = O(p^2) &#92;)</span> models, making it tractable for large <span>&#92;(p &#92;)</span>.

**Backward stepwise selection** begins with the full model and iteratively removes the predictor whose deletion least degrades fit. It requires <span>&#92;(n > p &#92;)</span> to fit the initial model but can explore a different path through model space than forward selection.

Neither approach guarantees finding the globally best subset, but both often perform comparably to exhaustive search in practice.

## Model Selection Criteria

**Mallows' Cp** estimates the mean squared prediction error (scaled by <span>&#92;(\sigma^2 &#92;)</span>) for a model with <span>&#92;(p' &#92;)</span> predictors:

<span>&#92;[
C&#95;p = \frac{\text{RSS}&#95;{p'}}{\hat\sigma^2} + 2p' - n
&#92;]</span>

where <span>&#92;(\hat\sigma^2 &#92;)</span> is estimated from the full model. Models with <span>&#92;(C&#95;p \approx p' &#92;)</span> are desirable; a model with <span>&#92;(C&#95;p \gg p' &#92;)</span> has systematic prediction bias.

**Akaike's Information Criterion (AIC)** and **Bayesian Information Criterion (BIC)** are likelihood-based criteria applicable beyond least squares:

<span>&#92;[
\text{AIC} = -2\log\hat L + 2p', \qquad \text{BIC} = -2\log\hat L + p'\log n
&#92;]</span>

BIC imposes a heavier penalty on model size, favouring sparser models, especially for large <span>&#92;(n &#92;)</span>. For Gaussian errors with known <span>&#92;(\sigma^2 &#92;)</span>, AIC is equivalent to Cp up to a constant.

All these **in-sample** criteria are proxies for out-of-sample performance. They work by adjusting the training error upward to penalise complexity, approximating the expected test error without requiring a separate test set.

---

# Module 6: Weighted Least Squares

## Heteroscedastic Errors

The OLS assumption of constant error variance <span>&#92;(\text{Var}(\varepsilon&#95;i) = \sigma^2 &#92;)</span> is frequently violated. When the variance is observation-specific, <span>&#92;(\text{Var}(\varepsilon&#95;i) = \sigma^2/w&#95;i &#92;)</span>, with known weights <span>&#92;(w&#95;i > 0 &#92;)</span>, the **weighted least squares (WLS)** estimator minimises the **weighted residual sum of squares**:

<span>&#92;[
\text{WRSS}(\boldsymbol{\beta}) = \sum&#95;{i=1}^n w&#95;i(y&#95;i - \mathbf{x}&#95;i^\top\boldsymbol{\beta})^2 = (\mathbf{y} - \mathbf{X}\boldsymbol{\beta})^\top\mathbf{W}(\mathbf{y} - \mathbf{X}\boldsymbol{\beta})
&#92;]</span>

where <span>&#92;(\mathbf{W} = \text{diag}(w&#95;1, \ldots, w&#95;n) &#92;)</span>. The WLS estimator has the closed form:

<span>&#92;[
\hat{\boldsymbol{\beta}}&#95;{\text{WLS}} = (\mathbf{X}^\top\mathbf{W}\mathbf{X})^{-1}\mathbf{X}^\top\mathbf{W}\mathbf{y}
&#92;]</span>

and satisfies <span>&#92;(\hat{\boldsymbol{\beta}}&#95;{\text{WLS}} \sim \mathcal{N}(\boldsymbol{\beta}, \sigma^2(\mathbf{X}^\top\mathbf{W}\mathbf{X})^{-1}) &#92;)</span>. Observations with larger <span>&#92;(w&#95;i &#92;)</span> are more precise and thus receive greater influence on the fit.

## Common Weighting Schemes

| Setting | Weight choice | Motivation |
|---------|--------------|------------|
| Variance proportional to a predictor | <span>&#92;(w&#95;i = 1/x&#95;i &#92;)</span> | Stabilise variance |
| Variance known from replication | <span>&#92;(w&#95;i = n&#95;i &#92;)</span> | Group means with unequal group sizes |
| Robust iterative reweighting | <span>&#92;(w&#95;i = \psi(r&#95;i/\hat\sigma)/r&#95;i &#92;)</span> | Downweight outliers |
| Inverse variance known | <span>&#92;(w&#95;i = 1/\sigma&#95;i^2 &#92;)</span> | Meta-analysis, calibration data |

## Generalised Least Squares

When errors are correlated — <span>&#92;(\text{Var}(\boldsymbol{\varepsilon}) = \sigma^2\boldsymbol{\Sigma} &#92;)</span> for a known positive-definite matrix <span>&#92;(\boldsymbol{\Sigma} &#92;)</span> — **generalised least squares (GLS)** achieves BLUE by transforming the problem. Since <span>&#92;(\boldsymbol{\Sigma} &#92;)</span> is positive definite, there exists a lower-triangular **Cholesky factor** <span>&#92;(\mathbf{B} &#92;)</span> such that <span>&#92;(\boldsymbol{\Sigma} = \mathbf{B}\mathbf{B}^\top &#92;)</span>. Pre-multiplying both sides of the model by <span>&#92;(\mathbf{B}^{-1} &#92;)</span>:

<span>&#92;[
\mathbf{B}^{-1}\mathbf{y} = \mathbf{B}^{-1}\mathbf{X}\boldsymbol{\beta} + \mathbf{B}^{-1}\boldsymbol{\varepsilon}
&#92;]</span>

yields a transformed model <span>&#92;(\tilde{\mathbf{y}} = \tilde{\mathbf{X}}\boldsymbol{\beta} + \tilde{\boldsymbol{\varepsilon}} &#92;)</span> where <span>&#92;(\text{Var}(\tilde{\boldsymbol{\varepsilon}}) = \sigma^2\mathbf{I} &#92;)</span>. OLS on the transformed data gives the GLS estimator <span>&#92;(\hat{\boldsymbol{\beta}}&#95;{\text{GLS}} = (\mathbf{X}^\top\boldsymbol{\Sigma}^{-1}\mathbf{X})^{-1}\mathbf{X}^\top\boldsymbol{\Sigma}^{-1}\mathbf{y} &#92;)</span>.

---

# Module 7: Robust Regression

## The Failure of OLS under Contamination

OLS minimises the sum of **squared** residuals, which means even a single extreme outlier can dramatically distort the estimated regression line. The squared loss function gives unbounded influence to large residuals. **Robust regression** seeks estimators that are resistant to a small fraction of contaminated observations.

## M-Estimators

**M-estimators** generalise OLS by replacing the squared loss with a more slowly growing **loss function** <span>&#92;(\rho(\cdot) &#92;)</span>:

<span>&#92;[
\hat{\boldsymbol{\beta}}&#95;M = \arg\min&#95;{\boldsymbol{\beta}} \sum&#95;{i=1}^n \rho\!\left(\frac{y&#95;i - \mathbf{x}&#95;i^\top\boldsymbol{\beta}}{\hat\sigma}\right)
&#92;]</span>

where <span>&#92;(\hat\sigma &#92;)</span> is a robust scale estimate (typically the **median absolute deviation** <span>&#92;(\hat\sigma = \mathrm{MAD}/0.6745 &#92;)</span>). Setting the gradient to zero yields the estimating equations:

<span>&#92;[
\sum&#95;{i=1}^n \psi\!\left(\frac{r&#95;i}{\hat\sigma}\right) \mathbf{x}&#95;i = \mathbf{0}, \quad \psi = \rho'
&#92;]</span>

Different choices of <span>&#92;(\psi &#92;)</span> define different M-estimators:

**Huber's ψ** is piecewise linear, behaving like OLS for small residuals and like LAD (L1) for large ones:

<span>&#92;[
\psi&#95;H(u) = \begin{cases} u & |u| \leq k \\ k\,\mathrm{sign}(u) & |u| > k \end{cases}
&#92;]</span>

with the default tuning constant <span>&#92;(k = 1.345 &#92;)</span> (giving 95% efficiency at the normal model).

**Hampel's ψ** adds a descending limb for very large residuals, giving them declining weight:

<span>&#92;[
\psi_{\text{Hamp}}(u) = \begin{cases} u & 0 \leq |u| \leq a \\ a\,\mathrm{sign}(u) & a < |u| \leq b \\ a\,\frac{c - |u|}{c - b}\,\mathrm{sign}(u) & b < |u| \leq c \\ 0 & |u| > c \end{cases}
&#92;]</span>

**Tukey's bisquare ψ** zeroes out residuals beyond a threshold, completely discarding severe outliers:

<span>&#92;[
\psi&#95;T(u) = \begin{cases} u(1 - u^2/c^2)^2 & |u| \leq c \\ 0 & |u| > c \end{cases}
&#92;]</span>

with <span>&#92;(c = 4.685 &#92;)</span> for 95% efficiency. Unlike Huber, Tukey's bisquare yields a non-convex objective and may have local minima.

```python
import numpy as np
import matplotlib.pyplot as plt

u = np.linspace(-5, 5, 500)

# Huber psi
k = 1.345
psi_huber = np.where(np.abs(u) <= k, u, k * np.sign(u))

# Tukey bisquare psi
c_t = 4.685
psi_tukey = np.where(np.abs(u) <= c_t, u * (1 - (u/c_t)**2)**2, 0)

# OLS (for reference)
psi_ols = u

fig, ax = plt.subplots(figsize=(7, 4))
ax.plot(u, psi_ols,   label='OLS (identity)', color='gray', ls='--', lw=1.5)
ax.plot(u, psi_huber, label="Huber (k=1.345)", color='steelblue', lw=2)
ax.plot(u, psi_tukey, label="Tukey bisquare (c=4.685)", color='tomato', lw=2)
ax.axhline(0, color='black', lw=0.8)
ax.axvline(0, color='black', lw=0.8)
ax.set_xlabel('Standardised residual u')
ax.set_ylabel(r'ψ(u)')
ax.set_title('M-Estimator ψ Functions')
ax.legend()
plt.tight_layout()
plt.savefig('m_estimator_psi.png', dpi=150)
plt.show()
```

## Iteratively Reweighted Least Squares

The M-estimating equations can be rewritten as a WLS problem by defining weights <span>&#92;(w&#95;i = \psi(r&#95;i/\hat\sigma)/r&#95;i &#92;)</span>:

<span>&#92;[
\sum&#95;{i=1}^n w&#95;i r&#95;i \mathbf{x}&#95;i = \mathbf{0}
&#92;]</span>

The **Iteratively Reweighted Least Squares (IRLS)** algorithm alternates between:
1. Computing weights <span>&#92;(w&#95;i^{(t)} = \psi(r&#95;i^{(t)}/\hat\sigma^{(t)})/r&#95;i^{(t)} &#92;)</span>,
2. Solving the WLS problem <span>&#92;(\hat{\boldsymbol{\beta}}^{(t+1)} = (\mathbf{X}^\top\mathbf{W}^{(t)}\mathbf{X})^{-1}\mathbf{X}^\top\mathbf{W}^{(t)}\mathbf{y} &#92;)</span>,

until convergence. Each iteration is a standard WLS computation, making IRLS straightforward to implement.

## The Breakdown Point and High-Breakdown Estimators

The **breakdown point** of an estimator is the smallest fraction of contaminated observations needed to make the estimate arbitrarily bad. OLS has a breakdown point of <span>&#92;(1/n \to 0 &#92;)</span>: a single outlier can be arbitrarily influential. M-estimators improve on this but still have breakdown points tending to zero for regression.

**Least Median of Squares (LMS)** minimises the **median** of squared residuals:

<span>&#92;[
\hat{\boldsymbol{\beta}}&#95;{\text{LMS}} = \arg\min&#95;{\boldsymbol{\beta}} \;\text{median}&#95;i\, r&#95;i^2(\boldsymbol{\beta})
&#92;]</span>

**Least Trimmed Squares (LTS)** minimises the sum of the <span>&#92;(\lceil n/2 \rceil &#92;)</span> smallest squared residuals, discarding the largest half. Both LMS and LTS achieve a **breakdown point of approximately 50%**: up to nearly half the data can be arbitrarily contaminated without breaking the estimator. This comes at the cost of efficiency (LTS is only 7% as efficient as OLS at the Gaussian model), so LTS is typically used as a **preliminary estimator** to identify outliers, followed by OLS or M-estimation on the cleaned data.

## The Sensitivity Curve

The **influence function** (or **sensitivity curve**) describes how an estimator responds to a single new observation added to the data. For OLS, the influence function is unbounded — a single observation at an extreme predictor value can have arbitrarily large influence. For Tukey's bisquare M-estimator, the influence function re-descends to zero for very large residuals, making the estimator **redescending** and hence robust.

---

# Module 8: Piecewise Regression and Local Methods

## Indicator Basis Functions

**Piecewise regression** partitions the predictor range into intervals and fits a separate polynomial on each piece, allowing the regression function to change shape abruptly. The building blocks are **truncated power basis functions**:

<span>&#92;[
(x - t)&#95;+^q = \begin{cases} (x-t)^q & x > t \\ 0 & x \leq t \end{cases}
&#92;]</span>

A **piecewise linear model** with a single knot at <span>&#92;(t &#92;)</span> is:

<span>&#92;[
f(x) = \beta&#95;0 + \beta&#95;1 x + \beta&#95;2(x-t)&#95;+
&#92;]</span>

This is continuous at <span>&#92;(t &#92;)</span> (no jump) but has a slope change of <span>&#92;(\beta&#95;2 &#92;)</span>. To allow a **jump discontinuity** (as in regression discontinuity designs), an indicator <span>&#92;(1(x > t) &#92;)</span> is added. Adding <span>&#92;(K &#92;)</span> knots <span>&#92;(t_1 < \cdots < t_K &#92;)</span> expands to:

<span>&#92;[
f(x) = \beta&#95;0 + \beta&#95;1 x + \sum&#95;{k=1}^K \gamma&#95;k(x - t&#95;k)&#95;+
&#92;]</span>

For piecewise cubic with continuous first and second derivatives — the building blocks of splines — the basis is <span>&#92;(\{1, x, x^2, x^3, (x-t&#95;1)&#95;+^3, \ldots, (x-t&#95;K)&#95;+^3\} &#92;)</span>.

## K-Nearest Neighbours Regression

**K-nearest neighbours (KNN) regression** predicts <span>&#92;(f(x) &#92;)</span> by averaging the responses of the <span>&#92;(K &#92;)</span> training observations closest to <span>&#92;(x &#92;)</span>:

<span>&#92;[
\hat f(x) = \frac{1}{K}\sum&#95;{x&#95;i \in \mathcal{N}&#95;K(x)} y&#95;i
&#92;]</span>

where <span>&#92;(\mathcal{N}&#95;K(x) &#92;)</span> is the set of <span>&#92;(K &#92;)</span> nearest neighbours of <span>&#92;(x &#92;)</span>. Small <span>&#92;(K &#92;)</span> gives a wiggly, low-bias fit; large <span>&#92;(K &#92;)</span> gives a smooth, low-variance fit. KNN is a special case of local constant regression (Nadaraya-Watson with a uniform kernel and bandwidth determined by the <span>&#92;(K &#92;)</span>th nearest neighbour distance).

## Weighted Local Fitting

**Local polynomial regression** fits a polynomial of degree <span>&#92;(d &#92;)</span> at each query point <span>&#92;(x &#92;)</span> by solving a locally weighted least squares problem:

<span>&#92;[
\min&#95;{a&#95;0, \ldots, a&#95;d} \sum&#95;{i=1}^n K&#95;h(x&#95;i - x)\left(y&#95;i - \sum&#95;{j=0}^d a&#95;j(x&#95;i - x)^j\right)^2
&#92;]</span>

where <span>&#92;(K&#95;h(\cdot) = K(\cdot/h)/h &#92;)</span> is a kernel that downweights distant observations. The estimate at <span>&#92;(x &#92;)</span> is <span>&#92;(\hat f(x) = \hat a&#95;0 &#92;)</span>. Local linear regression (<span>&#92;(d=1 &#92;)</span>) is particularly attractive because it has no boundary bias, whereas the Nadaraya-Watson estimator (<span>&#92;(d=0 &#92;)</span>) suffers from boundary effects.

---

# Module 9: Smoothing Methods

## The Linear Basis Expansion Framework

Many nonparametric methods can be unified through the concept of **linear basis expansion**. Rather than fitting <span>&#92;(f &#92;)</span> directly, we express it as a linear combination of basis functions <span>&#92;(h&#95;j(x) &#92;)</span>:

<span>&#92;[
f(x) = \sum&#95;{j=1}^M \beta&#95;j h&#95;j(x)
&#92;]</span>

The model is then linear in <span>&#92;(\boldsymbol{\beta} &#92;)</span>, and OLS or penalised regression applies. Different choices of <span>&#92;(\{h&#95;j\} &#92;)</span> yield different smoothers: polynomial regression, piecewise polynomials, splines, and Fourier series are all instances of this framework.

## Regression Splines

**Regression splines** use the truncated power basis of degree <span>&#92;(q &#92;)</span> with knots <span>&#92;(t_1 < \cdots < t_K &#92;)</span>:

<span>&#92;[
\mathcal{B} = \{1, x, x^2, \ldots, x^q,\; (x-t&#95;1)&#95;+^q, \ldots, (x-t&#95;K)&#95;+^q\}
&#92;]</span>

The resulting spline function is a piecewise polynomial of degree <span>&#92;(q &#92;)</span> that is <span>&#92;((q-1) &#92;)</span>-times continuously differentiable at each knot. Cubic splines (<span>&#92;(q=3 &#92;)</span>) are the most popular: they are smooth to the eye (continuous up to the second derivative) while being computationally and analytically tractable.

**Natural cubic splines** add two additional boundary constraints: the function must be **linear** beyond the outermost knots <span>&#92;(t&#95;1 &#92;)</span> and <span>&#92;(t&#95;K &#92;)</span> (i.e., <span>&#92;(f''(x) = 0 &#92;)</span> for <span>&#92;(x < t_1 &#92;)</span> and <span>&#92;(x > t&#95;K &#92;)</span>). These constraints reduce the effective degrees of freedom from <span>&#92;(K + q + 1 &#92;)</span> to <span>&#92;(K &#92;)</span> and improve behaviour at the boundaries where data is sparse. Natural cubic splines are asymptotically optimal among all smoothers in MISE.

**B-splines** (basis splines) provide a numerically superior representation of the same spline space. Each B-spline basis function is locally supported (non-zero only on a few consecutive knot intervals), making the resulting design matrix banded and linear system computationally efficient. The B-spline basis is preferable to the truncated power basis for numerical implementation, though both span the same function space.

## Smoothing Splines

Rather than fixing the knot locations in advance, **smoothing splines** place a knot at every observed data point and regularise the fit through a **roughness penalty**. The estimator is the minimiser of:

<span>&#92;[
\text{PRSS}(f, \lambda) = \sum&#95;{i=1}^n (y&#95;i - f(x&#95;i))^2 + \lambda \int&#95;a^b [f''(t)]^2\, dt
&#92;]</span>

The tuning parameter <span>&#92;(\lambda \geq 0 &#92;)</span> controls the bias-variance trade-off: <span>&#92;(\lambda = 0 &#92;)</span> interpolates the data, and <span>&#92;(\lambda \to \infty &#92;)</span> forces <span>&#92;(f &#92;)</span> to be linear. The remarkable fact is that **the exact minimiser of this infinite-dimensional problem is a natural cubic spline** with knots at the observed data points. This means the solution is computable in finite dimensions.

The smoothing spline estimator is a **linear smoother**: <span>&#92;(\hat{\mathbf{y}} = \mathbf{S}&#95;\lambda \mathbf{y} &#92;)</span>, where the **smoother matrix** is:

<span>&#92;[
\mathbf{S}&#95;\lambda = \mathbf{N}(\mathbf{N}^\top\mathbf{N} + \lambda\boldsymbol{\Omega}&#95;N)^{-1}\mathbf{N}^\top
&#92;]</span>

Here <span>&#92;(\mathbf{N} &#92;)</span> is the matrix of natural spline basis functions evaluated at the data points, and <span>&#92;(\boldsymbol{\Omega}&#95;N &#92;)</span> is the penalty matrix with entries <span>&#92;(\{\boldsymbol{\Omega}&#95;N\}&#95;{jk} = \int N&#95;j''(t)N&#95;k''(t)\,dt &#92;)</span>.

## Eigendecomposition of the Smoother Matrix

Since <span>&#92;(\mathbf{S}&#95;\lambda &#92;)</span> is symmetric and positive semi-definite, it has a real eigendecomposition <span>&#92;(\mathbf{S}&#95;\lambda = \mathbf{U}\mathbf{D}&#95;\lambda\mathbf{U}^\top &#92;)</span> with eigenvalues:

<span>&#92;[
d&#95;k(\lambda) = \frac{1}{1 + \lambda \rho&#95;k}
&#92;]</span>

where <span>&#92;(\rho&#95;k \geq 0 &#92;)</span> are the eigenvalues of the penalty matrix. The eigenvectors <span>&#92;(\mathbf{u}&#95;k &#92;)</span> (**Demmler-Reinsch basis**) are ordered from smoothest to roughest. Smooth components (small <span>&#92;(\rho&#95;k &#92;)</span>) are nearly unshrunken (<span>&#92;(d&#95;k \approx 1 &#92;)</span>); rough components (large <span>&#92;(\rho&#95;k &#92;)</span>) are heavily shrunk toward zero. The first two eigenvectors always correspond to the intercept and linear trend, which have zero roughness penalty (<span>&#92;(\rho&#95;1 = \rho&#95;2 = 0 &#92;)</span>, <span>&#92;(d&#95;1 = d&#95;2 = 1 &#92;)</span>).

The **effective degrees of freedom** of the smoothing spline is:

<span>&#92;[
\text{df}&#95;\lambda = \mathrm{tr}(\mathbf{S}&#95;\lambda) = \sum&#95;{k=1}^n d&#95;k(\lambda) = \sum&#95;{k=1}^n \frac{1}{1+\lambda\rho&#95;k}
&#92;]</span>

As <span>&#92;(\lambda &#92;)</span> increases from 0 to <span>&#92;(\infty &#92;)</span>, <span>&#92;(\text{df}&#95;\lambda &#92;)</span> decreases from <span>&#92;(n &#92;)</span> to 2. Users can equivalently specify a target degrees of freedom and solve for the corresponding <span>&#92;(\lambda &#92;)</span>.

## Bandwidth Selection for Smoothing Splines

The LOOCV criterion for the smoothing spline has the same shortcut form as for OLS:

<span>&#92;[
\text{CV}&#95;\text{LOO}(\lambda) = \frac{1}{n}\sum&#95;{i=1}^n \left(\frac{y&#95;i - \hat f&#95;\lambda(x&#95;i)}{1 - \{S&#95;\lambda\}&#95;{ii}}\right)^2
&#92;]</span>

and GCV replaces individual diagonal entries with their mean:

<span>&#92;[
\text{GCV}(\lambda) = \frac{\text{RSS}(\lambda)/n}{\left(1 - \text{df}&#95;\lambda/n\right)^2}
&#92;]</span>

In practice, GCV is the standard default in R's `smooth.spline()` function.

```python
import numpy as np
import matplotlib.pyplot as plt

np.random.seed(42)
x = np.linspace(0, 1, 100)
f_true = np.sin(2 * np.pi * x)
y = f_true + 0.3 * np.random.randn(100)

# Simulate smoothing spline effect at different lambda
from scipy.interpolate import UnivariateSpline
lambdas = [1e-5, 1e-3, 0.1]
labels  = ['λ small (overfit)', 'λ optimal', 'λ large (underfit)']
colors  = ['tomato', 'steelblue', 'green']

fig, axes = plt.subplots(1, 3, figsize=(12, 4), sharey=True)
for ax, lam, lab, col in zip(axes, lambdas, labels, colors):
    spl = UnivariateSpline(x, y, s=lam*len(x))
    ax.scatter(x, y, s=10, color='gray', alpha=0.5)
    ax.plot(x, f_true, 'k--', lw=1.5, label='True f')
    ax.plot(x, spl(x), color=col, lw=2, label=lab)
    ax.set_title(lab)
    ax.legend(fontsize=8)
    ax.set_xlabel('x')
axes[0].set_ylabel('y')
plt.suptitle('Smoothing Spline at Different λ')
plt.tight_layout()
plt.savefig('smoothing_splines.png', dpi=150)
plt.show()
```

## Multidimensional Smoothing

When the predictors are multivariate <span>&#92;(\mathbf{x} = (x&#95;1, \ldots, x&#95;d) &#92;)</span>, several extensions are available.

**Tensor product splines** construct a basis by taking all products of univariate spline bases in each dimension: <span>&#92;(\{h&#95;{j&#95;1}(x&#95;1) \cdot h&#95;{j&#95;2}(x&#95;2) : j&#95;1 = 1,\ldots,M&#95;1,\; j&#95;2 = 1,\ldots,M&#95;2\} &#92;)</span>. The number of basis functions grows exponentially with dimension — the **curse of dimensionality**.

**Thin-plate splines** generalise smoothing splines to multiple dimensions by penalising all mixed partial derivatives of order <span>&#92;(m &#92;)</span>. For <span>&#92;(d=2 &#92;)</span> with <span>&#92;(m=2 &#92;)</span>, the penalty is:

<span>&#92;[
J&#95;2(f) = \iint \left[\left(\frac{\partial^2 f}{\partial x&#95;1^2}\right)^2 + 2\left(\frac{\partial^2 f}{\partial x&#95;1 \partial x&#95;2}\right)^2 + \left(\frac{\partial^2 f}{\partial x&#95;2^2}\right)^2\right] dx&#95;1\, dx&#95;2
&#92;]</span>

Thin-plate splines are radially symmetric (rotation-invariant) and do not require the user to specify a product structure, but they are computationally intensive for large <span>&#92;(n &#92;)</span>.

## Additive Models and GAMs

**Additive models** sidestep the curse of dimensionality by assuming the regression function decomposes as a sum of univariate terms:

<span>&#92;[
y = \alpha + \sum&#95;{j=1}^p f&#95;j(x&#95;j) + \varepsilon
&#92;]</span>

where each <span>&#92;(f&#95;j &#92;)</span> is an arbitrary smooth function. **Generalised Additive Models (GAMs)** extend this to non-Gaussian responses through a link function <span>&#92;(g(\mu) = \alpha + \sum&#95;j f&#95;j(x&#95;j) &#92;)</span>. The component functions are estimated by the **backfitting algorithm**: repeatedly cycle through predictors, fitting each <span>&#92;(f&#95;j &#92;)</span> by applying a univariate smoother to the **partial residuals** <span>&#92;(y&#95;i - \hat\alpha - \sum&#95;{k \neq j} \hat f&#95;k(x&#95;{ik}) &#92;)</span>, until convergence.

The additive assumption sacrifices interaction terms but allows the model to handle moderate-dimensional problems without parametric constraints. In R, GAMs are implemented via the `gam` package (Hastie and Tibshirani) or `mgcv` (Wood), using penalised regression splines.

## Kernel Smoothing and the Nadaraya-Watson Estimator

**Kernel regression** estimates <span>&#92;(f(x) = E[y|X=x] &#92;)</span> directly as a locally weighted average. The **Nadaraya-Watson estimator** is:

<span>&#92;[
\hat f(x) = \frac{\sum&#95;{i=1}^n K&#95;h(x&#95;i - x)\, y&#95;i}{\sum&#95;{i=1}^n K&#95;h(x&#95;i - x)}
&#92;]</span>

where <span>&#92;(K&#95;h(u) = K(u/h)/h &#92;)</span> is a kernel function scaled by bandwidth <span>&#92;(h &#92;)</span>. Common kernels include the **Gaussian** <span>&#92;(K(u) = \phi(u) &#92;)</span>, **Epanechnikov** <span>&#92;(K(u) = \frac{3}{4}(1-u^2)&#95;+ &#92;)</span> (MSE-optimal), and **tricube** <span>&#92;(K(u) = \frac{70}{81}(1-|u|^3)&#95;+^3 &#92;)</span> (used in LOESS). The bias of the Nadaraya-Watson estimator at the boundary is of order <span>&#92;(O(h) &#92;)</span>, larger than in the interior, motivating local linear regression.

## LOESS (Locally Weighted Scatter Plot Smoother)

**LOESS** (or LOWESS, Cleveland 1979) fits a local polynomial of degree <span>&#92;(d &#92;)</span> at each <span>&#92;(x &#92;)</span>, using the tricube kernel with the bandwidth determined by the nearest-neighbour fraction <span>&#92;(\alpha &#92;)</span>:

<span>&#92;[
h&#95;i(x) = \text{(distance to the }\lfloor \alpha n \rfloor\text{-th nearest neighbour of } x)
&#92;]</span>

The span <span>&#92;(\alpha \in (0,1] &#92;)</span> controls smoothness: large <span>&#92;(\alpha &#92;)</span> uses more neighbours and produces smoother fits. LOESS is the default smoother in R's `geom_smooth()` with `method="loess"`.

## Comparing LOESS and Smoothing Splines via SVD

Both LOESS and smoothing splines are linear smoothers: <span>&#92;(\hat{\mathbf{y}} = \mathbf{S}\mathbf{y} &#92;)</span>. The SVD of <span>&#92;(\mathbf{S} &#92;)</span> reveals their structure:

<span>&#92;[
\mathbf{S} = \mathbf{U}\mathbf{D}\mathbf{V}^\top
&#92;]</span>

For a **symmetric** smoother matrix (smoothing splines), <span>&#92;(\mathbf{U} = \mathbf{V} &#92;)</span> and this is an eigendecomposition. LOESS has an asymmetric smoother matrix; its SVD reveals which linear combinations of responses it preferentially amplifies. In practice, the effective degrees of freedom for both smoothers is approximately <span>&#92;(\mathrm{tr}(\mathbf{S}) &#92;)</span>, providing a unified scale for comparison.

---

# Module 10: Shrinkage Estimators

## Ridge Regression

When predictors are correlated (multicollinearity), <span>&#92;(\mathbf{X}^\top\mathbf{X} &#92;)</span> becomes nearly singular, and OLS estimates have inflated variance. **Ridge regression** adds a ridge penalty to the objective:

<span>&#92;[
\hat{\boldsymbol{\beta}}&#95;R(\lambda) = \arg\min&#95;{\boldsymbol{\beta}} \left\{\|\mathbf{y} - \mathbf{X}\boldsymbol{\beta}\|^2 + \lambda\|\boldsymbol{\beta}\|^2\right\}
&#92;]</span>

The closed-form solution is:

<span>&#92;[
\hat{\boldsymbol{\beta}}&#95;R(\lambda) = (\mathbf{X}^\top\mathbf{X} + \lambda\mathbf{I})^{-1}\mathbf{X}^\top\mathbf{y}
&#92;]</span>

Adding <span>&#92;(\lambda\mathbf{I} &#92;)</span> to <span>&#92;(\mathbf{X}^\top\mathbf{X} &#92;)</span> ensures the matrix is invertible for all <span>&#92;(\lambda > 0 &#92;)</span>, regardless of multicollinearity. Ridge regression shrinks all coefficients toward zero simultaneously, with more shrinkage for coefficients corresponding to directions of small variation in the predictors.

The SVD representation illuminates ridge's mechanism. With <span>&#92;(\mathbf{X} = \mathbf{U}\mathbf{D}\mathbf{V}^\top &#92;)</span>:

<span>&#92;[
\hat{\boldsymbol{\beta}}&#95;R = \mathbf{V}\mathrm{diag}\!\left(\frac{d&#95;j}{d&#95;j^2 + \lambda}\right)\mathbf{U}^\top\mathbf{y}
&#92;]</span>

Each singular value component is shrunk by the factor <span>&#92;(d&#95;j^2/(d&#95;j^2 + \lambda) &#92;)</span>. Small singular values (directions of near-collinearity) are shrunk most. The effective degrees of freedom is:

<span>&#92;[
\text{df}(\lambda) = \mathrm{tr}\!\left[\mathbf{X}(\mathbf{X}^\top\mathbf{X} + \lambda\mathbf{I})^{-1}\mathbf{X}^\top\right] = \sum&#95;{j=1}^p \frac{d&#95;j^2}{d&#95;j^2 + \lambda}
&#92;]</span>

At <span>&#92;(\lambda=0 &#92;)</span>, <span>&#92;(\text{df} = p &#92;)</span> (OLS); as <span>&#92;(\lambda \to \infty &#92;)</span>, <span>&#92;(\text{df} \to 0 &#92;)</span>.

It is critical to **standardise predictors** before applying ridge (and LASSO): otherwise the penalty treats predictors on different scales unequally.

## The LASSO

The **LASSO** (Least Absolute Shrinkage and Selection Operator, Tibshirani 1996) replaces the L2 penalty with an L1 penalty:

<span>&#92;[
\hat{\boldsymbol{\beta}}&#95;L(\lambda) = \arg\min&#95;{\boldsymbol{\beta}} \left\{\|\mathbf{y} - \mathbf{X}\boldsymbol{\beta}\|^2 + \lambda\|\boldsymbol{\beta}\|&#95;1\right\}
&#92;]</span>

Unlike ridge, the LASSO has no closed-form solution for <span>&#92;(p > 1 &#92;)</span>. For the orthonormal design case, the LASSO solution is **soft thresholding**: <span>&#92;(\hat\beta&#95;j = \text{sign}(\hat\beta&#95;j^\text{OLS})(|\hat\beta&#95;j^\text{OLS}| - \lambda)&#95;+ &#92;)</span>. In general, LASSO solutions must be obtained by convex optimisation.

The crucial difference from ridge is **sparsity**: the L1 penalty has a corner at zero, so the optimal solution sets some coefficients exactly to zero — the LASSO performs automatic **variable selection**. As <span>&#92;(\lambda &#92;)</span> increases from 0, predictors enter (or leave) the model at discrete thresholds, tracing a **regularisation path**.

```python
import numpy as np
import matplotlib.pyplot as plt

# Conceptual ridge vs LASSO coefficient paths
lambdas = np.logspace(-2, 2, 200)

# Simulate: suppose beta_OLS = [2, -1, 0.5, -0.1, 0.05]
beta_ols = np.array([2.0, -1.0, 0.5, -0.1, 0.05])
colors_coef = ['steelblue', 'tomato', 'green', 'orange', 'purple']
labels_coef = [f'β{j+1} (OLS={b:.2f})' for j, b in enumerate(beta_ols)]

fig, axes = plt.subplots(1, 2, figsize=(12, 5))

# Ridge: continuous shrinkage
for j, (b, c, lab) in enumerate(zip(beta_ols, colors_coef, labels_coef)):
    # X'X ~ I approximation for illustration
    ridge_path = b / (1 + lambdas)
    axes[0].plot(lambdas, ridge_path, color=c, label=lab, lw=2)
axes[0].axhline(0, color='gray', lw=0.8)
axes[0].set_xscale('log')
axes[0].set_xlabel('λ')
axes[0].set_ylabel('Coefficient value')
axes[0].set_title('Ridge Regularisation Path')
axes[0].legend(fontsize=7)

# LASSO: soft thresholding (orthonormal X approximation)
for j, (b, c, lab) in enumerate(zip(beta_ols, colors_coef, labels_coef)):
    lasso_path = np.sign(b) * np.maximum(np.abs(b) - lambdas * 0.1, 0)
    axes[1].plot(lambdas * 0.1, lasso_path, color=c, label=lab, lw=2)
axes[1].axhline(0, color='gray', lw=0.8)
axes[1].set_xlabel('λ')
axes[1].set_ylabel('Coefficient value')
axes[1].set_title('LASSO Regularisation Path (sparse solutions)')
axes[1].legend(fontsize=7)

plt.tight_layout()
plt.savefig('ridge_lasso_paths.png', dpi=150)
plt.show()
```

## The Elastic Net

The **elastic net** (Zou and Hastie 2005) combines ridge and LASSO penalties:

<span>&#92;[
\hat{\boldsymbol{\beta}}&#95;{\text{EN}} = \arg\min&#95;{\boldsymbol{\beta}} \left\{\|\mathbf{y} - \mathbf{X}\boldsymbol{\beta}\|^2 + \lambda&#95;1\|\boldsymbol{\beta}\|&#95;1 + \lambda&#95;2\|\boldsymbol{\beta}\|^2\right\}
&#92;]</span>

The L1 component induces sparsity (variable selection) while the L2 component handles correlated predictors by encouraging **grouped selection**: correlated predictors tend to enter or leave the model together, rather than one arbitrarily dominating. The elastic net strictly contains both ridge (<span>&#92;(\lambda&#95;1 = 0 &#92;)</span>) and LASSO (<span>&#92;(\lambda&#95;2 = 0 &#92;)</span>) as special cases.

In R, all three methods are efficiently implemented via the `glmnet` package (Friedman, Hastie, and Tibshirani 2010), which computes the full regularisation path using coordinate descent. The mixing parameter <span>&#92;(\alpha \in [0,1] &#92;)</span> in `glmnet` controls the ridge-LASSO mix: <span>&#92;(\alpha=0 &#92;)</span> is pure ridge, <span>&#92;(\alpha=1 &#92;)</span> is pure LASSO.

```r
library(glmnet)
# fit LASSO path
fit <- glmnet(X, y, alpha = 1)  # LASSO
plot(fit, xvar = "lambda", label = TRUE)
# cross-validated lambda
cv_fit <- cv.glmnet(X, y, alpha = 1)
best_lambda <- cv_fit$lambda.1se
coef(cv_fit, s = "lambda.1se")
```

---

# Module 11: Kernel Density Estimation

## The Kernel Density Estimator

Given an i.i.d. sample <span>&#92;(u&#95;1, \ldots, u&#95;n \sim f &#92;)</span>, the **kernel density estimator (KDE)** is:

<span>&#92;[
\hat f&#95;h(u) = \frac{1}{nh}\sum&#95;{i=1}^n K\!\left(\frac{u - u&#95;i}{h}\right)
&#92;]</span>

where <span>&#92;(K &#92;)</span> is a symmetric kernel (typically <span>&#92;(\int K = 1 &#92;)</span>, <span>&#92;(K \geq 0 &#92;)</span>) and <span>&#92;(h > 0 &#92;)</span> is the **bandwidth**. The estimator places a scaled kernel centred at each data point and sums them up, yielding a smooth estimate of the density.

## Bias-Variance Analysis

For a fixed point <span>&#92;(u &#92;)</span>, the pointwise MSE of the KDE is:

<span>&#92;[
\mathrm{MSE}[\hat f&#95;h(u)] = \left(\mathrm{Bias}[\hat f&#95;h(u)]\right)^2 + \mathrm{Var}[\hat f&#95;h(u)]
&#92;]</span>

Under standard smoothness conditions on <span>&#92;(f &#92;)</span>, as <span>&#92;(h \to 0 &#92;)</span> and <span>&#92;(nh \to \infty &#92;)</span>:

<span>&#92;[
\mathrm{Bias}[\hat f&#95;h(u)] \approx \frac{h^2}{2} f''(u) \int u^2 K(u)\,du = \frac{h^2 \kappa&#95;2(K)}{2} f''(u)
&#92;]</span>

<span>&#92;[
\mathrm{Var}[\hat f&#95;h(u)] \approx \frac{f(u)}{nh} R(K), \quad R(K) = \int K^2(u)\,du
&#92;]</span>

The bias grows with <span>&#92;(h^2 &#92;)</span> (oversmoothing), and the variance decays as <span>&#92;(1/(nh) &#92;)</span> (more data → less variance). The **asymptotic mean integrated squared error (AMISE)** integrates over all <span>&#92;(u &#92;)</span>:

<span>&#92;[
\mathrm{AMISE}(h) = \frac{h^4 \kappa&#95;2(K)^2}{4}\int [f''(u)]^2\,du + \frac{R(K)}{nh}
&#92;]</span>

Minimising over <span>&#92;(h &#92;)</span> gives the optimal bandwidth:

<span>&#92;[
h&#95;\text{AMISE} = \left(\frac{R(K)}{\kappa&#95;2(K)^2 \int [f''(u)]^2\,du}\right)^{1/5} n^{-1/5}
&#92;]</span>

The rate <span>&#92;(n^{-1/5} &#92;)</span> is characteristic of one-dimensional density estimation: slower than the parametric <span>&#92;(n^{-1/2} &#92;)</span> rate, reflecting the difficulty of nonparametric estimation.

The **Epanechnikov kernel** <span>&#92;(K&#95;E(u) = \frac{3}{4}(1-u^2)\mathbf{1}&#95;{|u|\leq 1} &#92;)</span> minimises AMISE among all kernel functions, providing a theoretical benchmark. In practice, the choice of kernel matters little compared to the choice of bandwidth.

```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import gaussian_kde

np.random.seed(42)
# Bimodal sample
n = 300
sample = np.concatenate([np.random.normal(-2, 0.8, n//2),
                          np.random.normal(2, 0.8, n//2)])

u_grid = np.linspace(-6, 6, 400)
# True density
from scipy.stats import norm
f_true = 0.5 * norm.pdf(u_grid, -2, 0.8) + 0.5 * norm.pdf(u_grid, 2, 0.8)

fig, axes = plt.subplots(1, 3, figsize=(13, 4), sharey=True)
for ax, bw, title in zip(axes,
                         [0.2, 0.7, 2.0],
                         ['h small (undersmooth)', 'h optimal', 'h large (oversmooth)']):
    kde = gaussian_kde(sample, bw_method=bw)
    ax.hist(sample, bins=30, density=True, color='lightgray', alpha=0.6, label='Data')
    ax.plot(u_grid, f_true, 'k--', lw=1.5, label='True f')
    ax.plot(u_grid, kde(u_grid), 'steelblue', lw=2, label=f'KDE h={bw}')
    ax.set_title(title)
    ax.legend(fontsize=7)
    ax.set_xlabel('u')
axes[0].set_ylabel('Density')
plt.suptitle('Kernel Density Estimation at Different Bandwidths')
plt.tight_layout()
plt.savefig('kde_bandwidths.png', dpi=150)
plt.show()
```

## The Nadaraya-Watson Regression Estimator

Kernel ideas extend directly to regression. The **Nadaraya-Watson estimator** can be derived as follows: assume <span>&#92;((X, Y) &#92;)</span> have a joint density, and estimate both the joint and marginal densities with the same kernel:

<span>&#92;[
\hat f(x) = \frac{\hat f&#95;{X,Y}(x, y) \text{ integrated over }y}{\hat f&#95;X(x)} = \frac{\sum&#95;i K&#95;h(x&#95;i - x) y&#95;i}{\sum&#95;i K&#95;h(x&#95;i - x)}
&#92;]</span>

This directly motivates the estimator as the kernel-weighted average of responses near <span>&#92;(x &#92;)</span>. The bandwidth for regression is selected by **cross-validation** using the ISE or equivalently the pseudo-likelihood criterion:

<span>&#92;[
h^&#42; = \arg\min&#95;h \text{CV}(h) = \arg\min&#95;h \int [\hat f&#95;h(u)]^2\,du - \frac{2}{n}\sum&#95;{i=1}^n \hat f&#95;{h,-i}(u&#95;i)
&#92;]</span>

where <span>&#92;(\hat f&#95;{h,-i} &#92;)</span> is the leave-one-out density estimate. The first term (squared integral of the estimate) penalises rough estimates, while the second term rewards fit to the data.

---

# Module 12: Estimating an Intensity Function

## Neural Spike Trains

This module applies the smoothing methods developed throughout the course to a specific problem in **computational neuroscience**: estimating the firing rate of a neuron from repeated experimental trials.

In a typical electrophysiology experiment, a stimulus is applied to a subject repeatedly across <span>&#92;(m &#92;)</span> trials over an observation window <span>&#92;([0, T] &#92;)</span>. In each trial <span>&#92;(i &#92;)</span>, the neuron generates <span>&#92;(n&#95;i &#92;)</span> **action potentials** (spikes) at times <span>&#92;(t&#95;{i,1}, \ldots, t&#95;{i,n&#95;i} &#92;)</span>. The spike train is a random point process, and the goal is to estimate its underlying **intensity function** <span>&#92;(\lambda(t) &#92;)</span> — the instantaneous probability of firing per unit time.

## The Peri-Stimulus Time Histogram

The **Peri-Stimulus Time Histogram (PSTH)** is the classical estimator: the observation window is divided into equal bins of width <span>&#92;(\Delta &#92;)</span>, and the count of spikes across all trials in bin <span>&#92;(k &#92;)</span> is divided by <span>&#92;(m \cdot \Delta &#92;)</span> to estimate the average firing rate:

<span>&#92;[
\hat\lambda&#95;k = \frac{\text{(total spikes in bin }k\text{)}}{m \cdot \Delta}
&#92;]</span>

The PSTH is simply a histogram estimator applied to the pooled spike times. Its limitation is the familiar bias-variance trade-off: small bins (narrow <span>&#92;(\Delta &#92;)</span>) give noisy estimates; large bins smooth away temporal structure. Additionally, the PSTH must be followed by a separate smoothing step, introducing two bandwidth choices.

## Poisson Process Models

The standard model for spike generation is the **Poisson process**. A **homogeneous Poisson process** on <span>&#92;([0,T] &#92;)</span> with constant rate <span>&#92;(\lambda &#92;)</span> satisfies:
- Spike counts in disjoint intervals are independent,
- The number of spikes in any interval of length <span>&#92;(s &#92;)</span> follows a Poisson distribution with mean <span>&#92;(\lambda s &#92;)</span>.

The **inhomogeneous (non-homogeneous) Poisson process** allows the rate to vary: the expected number of spikes in <span>&#92;([a,b] &#92;)</span> is <span>&#92;(\int&#95;a^b \lambda(t)\,dt &#92;)</span>. The **conditional intensity function** (CIF) <span>&#92;(\lambda(t|\mathcal{H}&#95;t) &#92;)</span> generalises this further to allow spike history <span>&#92;(\mathcal{H}&#95;t &#92;)</span> to influence future rates, capturing **refractoriness** (the neuron cannot fire immediately after a spike) and **bursting** patterns.

## Multiscale Penalized Likelihood (Recursive Dyadic Partitioning)

The multiscale approach of Kolaczyk and Nowak (2004, 2005), with neuroscience applications by Ramezan et al. (2014), avoids the two-step histogram-then-smooth procedure by directly estimating a piecewise-constant intensity function of varying resolution.

The observation window <span>&#92;([0,T] &#92;)</span> is recursively bisected into a binary tree of sub-intervals. Setting <span>&#92;(N = 2^J &#92;)</span> leaves at the bottom of the tree, the splitting proceeds as follows: at each node, the interval is split at its midpoint, producing two child intervals. Let <span>&#92;(X&#95;{jk} &#92;)</span> denote the spike count in the sub-interval at depth <span>&#92;(j &#92;)</span> and position <span>&#92;(k &#92;)</span>. By the **Thinning Property of Poisson processes**:

<span>&#92;[
X&#95;{jk} \mid X&#95;{j-1,\lfloor k/2\rfloor} \sim \text{Binomial}\!\left(X&#95;{j-1,\lfloor k/2\rfloor},\; p&#95;{jk}\right)
&#92;]</span>

where <span>&#92;(p&#95;{jk} &#92;)</span> is the proportion of the parent interval's expected count in the left child. Under the piecewise-constant assumption, <span>&#92;(p_{jk} = 1/2 &#92;)</span >, but the model learns adaptive proportions from the data.

The tree is built **top-down** (recursive splitting) and pruned **bottom-up** using a penalised likelihood criterion that tests, at each internal node, whether to merge two children back into a constant block:

<span>&#92;[
\text{decision: merge or not? compare } \log L(\text{merged}) + \lambda \text{ vs } \log L(\text{split})
&#92;]</span>

A small penalty <span>&#92;(\lambda &#92;)</span> allows many splits (detailed histogram); a large <span>&#92;(\lambda &#92;)</span> forces aggressive merging (smooth estimate). The tuning parameters <span>&#92;(N = 2^J &#92;)</span> (maximum resolution) and <span>&#92;(\lambda &#92;)</span> (penalty) are selected by **leave-one-trial-out cross-validation**:

<span>&#92;[
(N^&#42;, \lambda^&#42;)&#95;{\text{ISE}} = \arg\min&#95;{N,\lambda} \left\{\int&#95;0^T \left[\frac{1}{m}\sum&#95;{i=1}^m \hat c&#95;i(t)\right]^2 dt - \frac{2}{m}\sum&#95;{i=1}^m \frac{1}{n&#95;i(m-1)}\sum&#95;{\ell=1}^{n&#95;i}\sum&#95;{j\neq i}\hat c&#95;j(t&#95;{i\ell})\right\}
&#92;]</span>

where <span>&#92;(\hat c&#95;i(t) &#92;)</span> is the estimate of <span>&#92;(c(t) = m\lambda(t) &#92;)</span> based on trial <span>&#92;(i &#92;)</span> alone. The RDP estimator is implemented in the `mmnst` R package as `PoissonRDP`.

Alternative cross-validation approaches include: leave-one-**spike**-out on pooled data, per-trial cross-validation with the mode of <span>&#92;(N&#95;i &#92;)</span>, or replacing ISE with **Kullback-Leibler divergence** as the discrepancy measure.

## Goodness of Fit: The Time Rescaling Theorem

A discretised version of the **Time Rescaling Theorem** (Brown, Barbieri, et al.) converts the fitted intensity function into a test of model adequacy. If <span>&#92;(\hat\lambda(t) &#92;)</span> is the true intensity, then the **rescaled inter-spike intervals**:

<span>&#92;[
z&#95;k = 1 - \exp\!\left(-\int&#95;{t&#95;{k-1}}^{t&#95;k} \hat\lambda(s)\,ds\right)
&#92;]</span>

should be i.i.d. Uniform(0,1) if the model is correct. A **probability-probability (pp) plot** of the empirical CDF of <span>&#92;(\{z&#95;k\} &#92;)</span> against the uniform CDF provides a visual goodness-of-fit test; departure from the diagonal, especially outside Kolmogorov-Smirnov confidence bands, indicates misfit.

## Bayesian Adaptive Regression Splines (BARS)

An alternative to the multiscale approach is the **BARS model** of DiMatteo, Genovese, and Kass (2001), which uses **free-knot regression splines** in a Bayesian framework.

The key challenge in regression spline fitting is that the number and location of knots are unknown. Rather than fixing knots in advance or placing them densely (as smoothing splines do), BARS treats the knots as random variables and estimates their distribution from the data.

In the **Bayesian framework**, all parameters are random variables with prior distributions. The posterior distribution <span>&#92;(g(\theta|\mathbf{x}) &#92;)</span> combines prior knowledge <span>&#92;(p(\theta) &#92;)</span> with the likelihood of the observed data:

<span>&#92;[
g(\theta|\mathbf{x}) = \frac{f(\mathbf{x}|\theta)\, p(\theta)}{m(\mathbf{x})} \propto f(\mathbf{x}|\theta)\, p(\theta)
&#92;]</span>

In short: **posterior <span>&#92;(\propto &#92;)</span> likelihood <span>&#92;(\times &#92;)</span> prior**. Since the normalising constant <span>&#92;(m(\mathbf{x}) = \int f(\mathbf{x}|\theta)p(\theta)\,d\theta &#92;)</span> is often intractable, **Markov Chain Monte Carlo (MCMC)** methods generate samples from the posterior without requiring <span>&#92;(m(\mathbf{x}) &#92;)</span>. From a large MCMC sample, the posterior mean or mode gives a point estimate of <span>&#92;(\theta &#92;)</span>.

In BARS, the model is:

<span>&#92;[
\mu(x) = \sum&#95;{j=1}^{k+2} \beta&#95;j b&#95;j(x)
&#92;]</span>

where <span>&#92;(b&#95;j &#92;)</span> are cubic B-spline basis functions, <span>&#92;(k &#92;)</span> is the (random) number of inner knots, and <span>&#92;(\boldsymbol{\xi} = (\xi&#95;1, \ldots, \xi&#95;k) &#92;)</span> are the (random) knot locations. The joint prior factorises as:

<span>&#92;[
p(\boldsymbol{\beta}, k, \boldsymbol{\xi}, \sigma) = p&#95;\beta(\boldsymbol{\beta}|\boldsymbol{\xi}, k, \sigma)\, p&#95;\xi(\boldsymbol{\xi}|k)\, p&#95;k(k)\, p&#95;\sigma(\sigma)
&#92;]</span>

Conditionally on <span>&#92;((k, \boldsymbol{\xi}) &#92;)</span>, the model is a standard linear regression. The hard part is the joint inference on <span>&#92;((k, \boldsymbol{\xi}) &#92;)</span>, which lives in a **variable-dimension** space — ordinary MCMC cannot move between models of different dimension.

**Reversible-jump MCMC (RJMCMC)**, introduced by Green (1995), handles variable-dimension posteriors by proposing three types of moves at each iteration:
1. **Birth**: add a new knot at a proposed location,
2. **Death**: remove an existing knot,
3. **Relocation**: move an existing knot to a new position.

Each move is accepted with a Metropolis-Hastings probability that accounts for the change in dimensionality. The chain produces a sequence of spline fits of varying complexity; the posterior mean over this sequence provides the final estimate, naturally averaging over the uncertainty in knot number and location.

BARS correctly identifies the number and location of knots even at moderate signal-to-noise ratios. Its main drawback is **computational cost**: RJMCMC requires many iterations to explore the knot space, making BARS impractical for large datasets. The multiscale RDP approach is computationally faster and can handle data with structural zeros (bins with no spikes due to biological refractoriness).

---

*Notes compiled from lecture slides by Reza Ramezan, STAT 444 Spring 2020, University of Waterloo. Graphs are illustrative Python reproductions; refer to lecture slides for original R-generated figures.*
