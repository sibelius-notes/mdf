---
title: "STAT 341: Computational Statistics and Data Analysis"
subjects: "STAT"
prof: "MJ Davis"
---


## Sources and References

**Textbooks** — Efron, B. and Tibshirani, R. J. (1993), *An Introduction to the Bootstrap*; Davison, A. C. and Hinkley, D. V. (1997), *Bootstrap Methods and Their Application*; Wasserman, L. (2004), *All of Statistics*
**Supplementary** — Hastie, Tibshirani, and Friedman, *The Elements of Statistical Learning*; James, Witten, Hastie, and Tibshirani, *An Introduction to Statistical Learning*
**Online resources** — Stanford STATS 305 materials; CMU 36-462 lecture notes


# Chapter 1: Populations and Attributes

## 1.1 Finite Populations and Target versus Study Populations

In computational statistics we take a population-centric view of data analysis. A **finite population** is a well-defined collection of \(N\) units, written \(\mathcal{U} = \{u_1, u_2, \ldots, u_N\}\). Each unit carries one or more measured values called **variates**. If the variate of interest on unit \(u_i\) is \(y_i\), the population is fully described by the multiset \(\{y_1, y_2, \ldots, y_N\}\).

<div class="definition">
<strong>Target population.</strong> The collection of all units about which we wish to draw conclusions. This is the population that motivates the study.
</div>

<div class="definition">
<strong>Study population.</strong> The collection of all units that could actually appear in our sample. Ideally the study population equals the target population; in practice the two may differ because of non-response, frame errors, or logistical constraints.
</div>

When the study population is a proper subset of the target population, any inference we make is valid only for the study population unless additional assumptions bridge the gap. A classic example: a telephone survey targets all adults in a country, but its study population is restricted to those who own telephones and answer calls. Awareness of this distinction is essential before any statistical analysis begins.

## 1.2 Population Attributes as Functions

An **attribute** of a population is any real-valued function of the population values. More precisely, if we denote the population data by the vector \(\mathbf{y} = (y_1, \ldots, y_N)\), then an attribute is any mapping \(A : \mathbb{R}^N \to \mathbb{R}\).

<div class="example">
<strong>Example 1.1 (Common population attributes).</strong>

The population mean is defined by

\[
\bar{y}_U = \frac{1}{N}\sum_{i=1}^{N} y_i.
\]
The population variance is

\[
S^2_U = \frac{1}{N-1}\sum_{i=1}^{N}(y_i - \bar{y}_U)^2.
\]
The population median is the middle order statistic when the \(y_i\) are arranged in non-decreasing order.

Each of these is a function of the entire population vector \(\mathbf{y}\), and therefore each is a population attribute.
</div>

We distinguish between two kinds of attributes:

- **Explicit attributes** are defined by a closed-form formula applied directly to the population values, such as the mean, variance, or any moment.
- **Implicit attributes** are defined as the solution to an optimization problem or estimating equation. For instance, the population regression coefficients are the minimizers of \(\sum_{i=1}^{N}(y_i - \mathbf{x}_i^T\boldsymbol{\beta})^2\).

This functional perspective unifies seemingly disparate statistical quantities under one framework and makes it natural to study how attributes change when we observe only a sample from the population.

## 1.3 Graphical Attributes

Graphical attributes describe the shape of the distribution of population values. Although they are not single numbers, they are still functions of the population data and thus count as attributes in the broad sense.

### Histograms

A **histogram** partitions the range of the data into bins and displays the frequency (or relative frequency) of observations in each bin. Given bin boundaries \(b_0 < b_1 < \cdots < b_K\) of equal width \(h = b_k - b_{k-1}\), the histogram estimator of the density at a point \(x \in [b_k, b_{k+1})\) is

\[
\hat{f}_{\text{hist}}(x) = \frac{n_k}{N \cdot h},
\]

where \(n_k\) is the number of population values falling in the \(k\)-th bin. The choice of bin width \(h\) has a profound effect on the appearance of the histogram. Too small and the histogram is noisy; too large and genuine features are smoothed away.

### Kernel Density Estimation

Kernel density estimation (KDE) provides a smoother alternative to the histogram. Given population values \(y_1, \ldots, y_N\), the kernel density estimator is

\[
\hat{f}(x) = \frac{1}{Nh}\sum_{i=1}^{N} K\!\left(\frac{x - y_i}{h}\right),
\]

where \(K\) is a **kernel function** (a symmetric, non-negative function integrating to one) and \(h > 0\) is the **bandwidth**. Common kernels include the Gaussian kernel \(K(u) = \frac{1}{\sqrt{2\pi}}e^{-u^2/2}\) and the Epanechnikov kernel \(K(u) = \frac{3}{4}(1-u^2)\) for \(|u| \leq 1\).

<div class="definition">
<strong>Bandwidth selection.</strong> The bandwidth \(h\) controls the trade-off between bias and variance of the KDE. A small \(h\) gives low bias but high variance (a wiggly curve), while a large \(h\) gives high bias but low variance (an over-smoothed curve). The mean integrated squared error (MISE) provides a global measure of accuracy:

\[
\text{MISE}(h) = E\!\left[\int \bigl(\hat{f}(x) - f(x)\bigr)^2 dx\right].
\]
Minimizing the MISE (or its asymptotic approximation AMISE) yields the optimal bandwidth.
</div>

**Silverman's rule of thumb** provides a quick bandwidth estimate for approximately normal data:

\[
h_{\text{Silverman}} = 0.9 \cdot \min\!\left(\hat{\sigma},\; \frac{\text{IQR}}{1.34}\right) \cdot N^{-1/5},
\]

where \(\hat{\sigma}\) is the sample standard deviation and IQR is the interquartile range. This rule should be used cautiously for multimodal distributions, where it tends to over-smooth.

More sophisticated methods include **cross-validation bandwidth selection**, which chooses \(h\) to minimize the integrated squared error estimated by leave-one-out cross-validation:

\[
\text{CV}(h) = \int \hat{f}(x)^2\,dx - \frac{2}{N}\sum_{i=1}^{N}\hat{f}_{-i}(y_i),
\]

where \(\hat{f}_{-i}\) is the KDE constructed without observation \(y_i\).

<div class="example">
<strong>Example 1.2 (KDE with different bandwidths).</strong>

Consider a population of \(N = 200\) values drawn from a mixture of two normals: \(0.6\,\mathcal{N}(0,1) + 0.4\,\mathcal{N}(4,0.5^2)\). With a small bandwidth \(h = 0.1\), the KDE is spiky and noisy, revealing spurious bumps. With a large bandwidth \(h = 2.0\), the KDE is a single smooth hump that completely misses the bimodality. With the cross-validation bandwidth \(h \approx 0.4\), the KDE clearly reveals both modes while remaining smooth.
</div>

## 1.4 Power Transforms

When population data are skewed or have non-constant variance, **power transformations** can symmetrize the distribution or stabilize variance. The general family of power transforms maps each value \(y > 0\) to \(y^{\lambda}\) for some parameter \(\lambda\).

### The Box-Cox Transformation

The Box-Cox family, introduced by Box and Cox (1964), handles the discontinuity at \(\lambda = 0\) gracefully:

\[
y^{(\lambda)} = \begin{cases} \dfrac{y^{\lambda} - 1}{\lambda}, & \lambda \neq 0, \\[6pt] \ln y, & \lambda = 0. \end{cases}
\]

This definition ensures that \(y^{(\lambda)}\) is a continuous function of \(\lambda\) for each fixed \(y > 0\). Special cases include:

| \(\lambda\) | Transformation |
|---|---|
| 1 | Linear (shifted): \(y - 1\) |
| 0.5 | Square root (scaled): \(2(\sqrt{y} - 1)\) |
| 0 | Logarithm: \(\ln y\) |
| \(-0.5\) | Reciprocal square root (scaled) |
| \(-1\) | Reciprocal (scaled): \(-(1/y - 1)\) |

<div class="theorem">
<strong>Choosing \(\lambda\) by maximum likelihood.</strong> Suppose \(y_1, \ldots, y_n\) are positive observations modelled as \(y_i^{(\lambda)} \sim \mathcal{N}(\mu, \sigma^2)\). The profile log-likelihood for \(\lambda\) is

\[
\ell(\lambda) = -\frac{n}{2}\ln\!\left(\frac{1}{n}\sum_{i=1}^{n}\bigl(y_i^{(\lambda)} - \overline{y^{(\lambda)}}\bigr)^2\right) + (\lambda - 1)\sum_{i=1}^{n}\ln y_i.
\]
The MLE \(\hat{\lambda}\) is the value maximizing \(\ell(\lambda)\). In practice, one evaluates \(\ell(\lambda)\) on a grid of \(\lambda\) values and selects the maximizer.
</div>

### Log and Square Root Transforms

The **logarithmic transform** (\(\lambda = 0\)) is the most commonly used power transform. It is appropriate when the data span several orders of magnitude or when the standard deviation is roughly proportional to the mean (coefficient of variation is approximately constant).

The **square root transform** (\(\lambda = 0.5\)) is commonly used for count data, as it stabilizes the variance of Poisson-distributed counts. If \(Y \sim \text{Poisson}(\mu)\), then \(\text{Var}(Y) = \mu\), and the delta method gives \(\text{Var}(\sqrt{Y}) \approx 1/4\), a constant independent of \(\mu\).

### Standardization

**Standardization** (or z-scoring) transforms each value to have zero mean and unit variance:

\[
z_i = \frac{y_i - \bar{y}}{s},
\]

where \(\bar{y}\) and \(s\) are the sample mean and standard deviation. This is not a power transform but is frequently used alongside them. Standardization is essential when combining variables measured on different scales and is a prerequisite for many multivariate methods.

<div class="example">
<strong>Example 1.3 (Box-Cox on income data).</strong>

Suppose we observe annual incomes (in thousands of dollars) for \(n = 500\) individuals. The raw data are strongly right-skewed with a long tail. Evaluating the Box-Cox profile log-likelihood on a grid \(\lambda \in [-2, 2]\) yields \(\hat{\lambda} \approx 0.12\), which is close to zero. This suggests that the log transform is appropriate. After applying \(\ln(y_i)\), the distribution of transformed incomes is approximately symmetric, satisfying the normality assumption needed for many inferential procedures.
</div>


# Chapter 2: Robust Estimation and Implicit Attributes

## 2.1 The Need for Robust Methods

Classical statistical estimators such as the sample mean and ordinary least squares are optimal under ideal conditions (e.g., normally distributed errors) but can break down catastrophically in the presence of outliers or heavy-tailed distributions. **Robust statistics** seeks estimators that perform well across a range of distributional assumptions.

<div class="example">
<strong>Example 2.1 (Sensitivity of the mean).</strong>

Consider the dataset \(\{1, 2, 3, 4, 5\}\) with mean \(\bar{y} = 3\). If the last observation is contaminated to give \(\{1, 2, 3, 4, 500\}\), the mean jumps to \(\bar{y} = 102\). A single outlier has completely distorted the estimate. The median, by contrast, remains at 3 in both cases.
</div>

## 2.2 Breakdown Point

The **breakdown point** of an estimator quantifies the proportion of arbitrarily corrupted observations the estimator can tolerate before giving an arbitrarily bad result.

<div class="definition">
<strong>Finite-sample breakdown point.</strong> For an estimator \(T(\mathbf{y})\) based on a sample of size \(n\), the breakdown point is

\[
\varepsilon^* = \frac{1}{n}\max\{m : \text{replacing any } m \text{ observations with arbitrary values keeps } T \text{ bounded}\}.
\]
The maximum possible breakdown point is \(\lfloor(n-1)/2\rfloor / n \approx 0.5\).
</div>

The sample mean has a breakdown point of \(1/n\) (a single outlier can make it arbitrarily large), whereas the sample median has a breakdown point of approximately 0.5 (nearly half the data must be corrupted to make it unbounded). This makes the median far more robust than the mean.

## 2.3 Influence Function

The **influence function** measures the effect on an estimator of adding a single observation at a particular value. It was introduced by Hampel (1974) and provides a local measure of robustness.

<div class="definition">
<strong>Influence function.</strong> Let \(T(F)\) be a statistical functional (an estimator viewed as a function of the distribution \(F\)). The influence function of \(T\) at the point \(x\) relative to the distribution \(F\) is

\[
\text{IF}(x; T, F) = \lim_{\varepsilon \to 0}\frac{T\bigl((1-\varepsilon)F + \varepsilon\,\delta_x\bigr) - T(F)}{\varepsilon},
\]
where \(\delta_x\) is a point mass at \(x\).
</div>

For the mean functional \(T(F) = \int x\,dF(x)\), the influence function is \(\text{IF}(x; T, F) = x - \mu\), which is unbounded as \(x \to \pm\infty\). For the median, the influence function is bounded, confirming its robustness.

A robust estimator should have a **bounded influence function**, meaning that no single observation, no matter how extreme, can have an arbitrarily large effect on the estimate.

## 2.4 M-Estimators

**M-estimators** (for "maximum likelihood type") were introduced by Huber (1964) as a generalization of maximum likelihood estimation. An M-estimator \(\hat{\theta}\) of a location parameter is defined as the minimizer of

\[
\hat{\theta} = \arg\min_{\theta} \sum_{i=1}^{n} \rho(y_i - \theta),
\]

where \(\rho\) is a loss function. Equivalently, \(\hat{\theta}\) solves the estimating equation

\[
\sum_{i=1}^{n} \psi(y_i - \hat{\theta}) = 0,
\]

where \(\psi = \rho'\) is the derivative of the loss function.

Different choices of \(\rho\) yield different estimators:

| Loss function \(\rho(r)\) | \(\psi(r) = \rho'(r)\) | Estimator |
|---|---|---|
| \(r^2\) | \(2r\) | Sample mean |
| \(|r|\) | \(\text{sign}(r)\) | Sample median |
| Huber loss | Huber \(\psi\) | Huber M-estimator |

### The Huber Loss

The **Huber loss function** combines the best properties of squared and absolute loss:

\[
\rho_k(r) = \begin{cases} \frac{1}{2}r^2, & |r| \leq k, \\ k|r| - \frac{1}{2}k^2, & |r| > k, \end{cases}
\]

where \(k > 0\) is a tuning parameter. The corresponding \(\psi\) function is

\[
\psi_k(r) = \begin{cases} r, & |r| \leq k, \\ k\,\text{sign}(r), & |r| > k. \end{cases}
\]

For observations close to the center (residual \(|r| \leq k\)), the Huber loss behaves like squared-error loss, giving the efficiency of the mean. For outlying observations (\(|r| > k\)), it behaves like absolute-error loss, bounding the influence of extreme values. A common choice is \(k = 1.345\sigma\), which achieves 95% efficiency at the normal distribution while providing substantial protection against outliers.

<div class="remark">
The influence function of the Huber M-estimator is \(\text{IF}(x; T, F) = \psi_k(x - \mu)/\int \psi_k'(x-\mu)\,dF(x)\), which is bounded by \(\pm k / \int\psi_k'\,dF\). This confirms that the Huber estimator is B-robust (has bounded influence function).
</div>

## 2.5 Median and MAD

The **median** is the simplest robust location estimator. For robust scale estimation, the **median absolute deviation** (MAD) is defined as

\[
\text{MAD} = \text{median}_{i}\,|y_i - \text{median}(y_1,\ldots,y_n)|.
\]

To make the MAD consistent for the standard deviation at the normal distribution, we use the scaled version:

\[
\hat{\sigma}_{\text{MAD}} = 1.4826 \cdot \text{MAD}.
\]

The factor 1.4826 arises because for \(Z \sim \mathcal{N}(0,1)\), \(\text{median}(|Z|) = \Phi^{-1}(0.75) \approx 0.6745\), and \(1/0.6745 \approx 1.4826\).

The MAD has a breakdown point of 0.5, making it much more robust than the sample standard deviation (which has a breakdown point of \(1/n\)).

<div class="example">
<strong>Example 2.2 (Robust location and scale).</strong>

Consider the sample \(\{2.1, 2.3, 2.5, 2.4, 2.2, 2.6, 2.3, 100\}\). The sample mean is \(\bar{y} = 14.55\) and the sample standard deviation is \(s = 34.5\), both severely distorted by the outlier 100.

The median is \(\text{median} = 2.35\). The absolute deviations from the median are \(\{0.25, 0.05, 0.15, 0.05, 0.15, 0.25, 0.05, 97.65\}\), and the MAD is 0.15. The scaled MAD estimate of the standard deviation is \(1.4826 \times 0.15 = 0.222\).

These robust estimates are far more representative of the bulk of the data than the classical estimates.
</div>

## 2.6 Implicit Attributes via Optimization

An **implicitly defined attribute** is one that is specified as the solution to an optimization problem rather than as an explicit formula. This concept is central to the STAT 341 framework.

<div class="definition">
<strong>Implicit attribute.</strong> An attribute \(\theta^*\) of a population \(\{y_1, \ldots, y_N\}\) is <em>implicitly defined</em> if

\[
\theta^* = \arg\min_{\theta} \sum_{i=1}^{N} \rho(y_i, \theta)
\]
for some loss function \(\rho\), or equivalently as the solution to the estimating equation \(\sum_{i=1}^{N}\psi(y_i, \theta^*) = 0\) where \(\psi = \partial\rho/\partial\theta\).
</div>

This viewpoint subsumes many familiar quantities. Ordinary least squares regression coefficients are the minimizers of the sum of squared residuals. The population median minimizes the sum of absolute deviations. Quantile regression coefficients minimize an asymmetrically weighted absolute deviation loss.

### Least Absolute Deviations (LAD)

**Least absolute deviations** regression finds the coefficients that minimize the sum of absolute residuals:

\[
\hat{\boldsymbol{\beta}}_{\text{LAD}} = \arg\min_{\boldsymbol{\beta}} \sum_{i=1}^{N} |y_i - \mathbf{x}_i^T\boldsymbol{\beta}|.
\]

Unlike OLS, LAD does not have a closed-form solution and must be computed iteratively (e.g., by linear programming or iteratively reweighted least squares). LAD regression is more robust to outliers in the response variable because the absolute value loss grows linearly rather than quadratically. The fitted line passes through at least \(p\) data points (where \(p\) is the number of predictors), which makes LAD regression equivalent to median regression (the 0.5 quantile regression).

<div class="example">
<strong>Example 2.3 (OLS vs. LAD regression).</strong>

Suppose we fit a simple linear regression \(y = \beta_0 + \beta_1 x + \varepsilon\) to 50 observations where 48 follow the true model \(y = 2 + 3x + \varepsilon\), \(\varepsilon \sim \mathcal{N}(0,1)\), but two observations have responses contaminated by adding 50 to their \(y\) values.

OLS yields \(\hat{\beta}_0 = 4.1\), \(\hat{\beta}_1 = 2.5\), substantially biased. LAD regression yields \(\hat{\beta}_0 = 2.05\), \(\hat{\beta}_1 = 2.98\), very close to the true values. The LAD fit is essentially unaffected by the two outliers because the absolute value loss limits their influence.
</div>

## 2.7 Robust Regression

Beyond LAD, several robust regression methods exist. **M-estimation in regression** minimizes \(\sum_{i=1}^{n}\rho(r_i/\hat{\sigma})\) where \(r_i = y_i - \mathbf{x}_i^T\boldsymbol{\beta}\) and \(\hat{\sigma}\) is a robust scale estimate. Using the Huber loss for \(\rho\) gives a method that is efficient for normal errors and resistant to outliers.

For even higher breakdown, **least trimmed squares** (LTS) minimizes the sum of the \(h\) smallest squared residuals:

\[
\hat{\boldsymbol{\beta}}_{\text{LTS}} = \arg\min_{\boldsymbol{\beta}} \sum_{i=1}^{h} r_{(i)}^2(\boldsymbol{\beta}),
\]

where \(r_{(1)}^2 \leq r_{(2)}^2 \leq \cdots \leq r_{(n)}^2\) are the ordered squared residuals and \(h = \lfloor n/2 \rfloor + \lfloor(p+1)/2\rfloor\). LTS achieves a breakdown point of approximately 0.5, the maximum possible, at the cost of lower efficiency.


# Chapter 3: Numerical Optimization for Statistics

## 3.1 Why Optimization Matters in Statistics

Many statistical problems reduce to optimization: maximum likelihood estimation, M-estimation, penalized regression, and Bayesian MAP estimation all require minimizing (or maximizing) an objective function. When the objective has no closed-form optimum, we must resort to iterative numerical methods.

The three methods covered in this chapter, gradient descent, Newton-Raphson, and iteratively reweighted least squares, form a hierarchy of increasing sophistication and convergence speed.

## 3.2 Gradient Descent

### The Basic Algorithm

**Gradient descent** is the simplest iterative optimization method. To minimize a differentiable function \(f(\boldsymbol{\theta})\), we start from an initial guess \(\boldsymbol{\theta}^{(0)}\) and iterate:

\[
\boldsymbol{\theta}^{(t+1)} = \boldsymbol{\theta}^{(t)} - \alpha_t \nabla f(\boldsymbol{\theta}^{(t)}),
\]

where \(\alpha_t > 0\) is the **step size** (or **learning rate**) and \(\nabla f\) is the gradient of \(f\).

The intuition is straightforward: the negative gradient \(-\nabla f(\boldsymbol{\theta})\) points in the direction of steepest decrease of \(f\) at \(\boldsymbol{\theta}\). Each step moves in this direction, with the step size controlling how far we go.

### Fixed Step Size

With a **fixed step size** \(\alpha_t = \alpha\), convergence is guaranteed under certain conditions. If \(f\) is convex and its gradient is Lipschitz continuous with constant \(L\) (meaning \(\|\nabla f(\mathbf{x}) - \nabla f(\mathbf{y})\| \leq L\|\mathbf{x} - \mathbf{y}\|\) for all \(\mathbf{x}, \mathbf{y}\)), then gradient descent with step size \(\alpha \leq 1/L\) converges.

<div class="theorem">
<strong>Convergence rate of gradient descent (convex case).</strong> Under the Lipschitz gradient assumption with constant \(L\) and step size \(\alpha = 1/L\), gradient descent satisfies

\[
f(\boldsymbol{\theta}^{(t)}) - f(\boldsymbol{\theta}^*) \leq \frac{L\|\boldsymbol{\theta}^{(0)} - \boldsymbol{\theta}^*\|^2}{2t},
\]
where \(\boldsymbol{\theta}^*\) is the minimizer. This is an \(O(1/t)\) convergence rate, meaning we need \(O(1/\varepsilon)\) iterations to achieve \(\varepsilon\)-accuracy.
</div>

<div class="theorem">
<strong>Convergence rate (strongly convex case).</strong> If in addition \(f\) is strongly convex with parameter \(\mu > 0\) (meaning \(f(\mathbf{y}) \geq f(\mathbf{x}) + \nabla f(\mathbf{x})^T(\mathbf{y}-\mathbf{x}) + \frac{\mu}{2}\|\mathbf{y}-\mathbf{x}\|^2\) for all \(\mathbf{x},\mathbf{y}\)), then gradient descent with step size \(\alpha = 1/L\) achieves <em>linear convergence</em>:

\[
f(\boldsymbol{\theta}^{(t)}) - f(\boldsymbol{\theta}^*) \leq \left(1 - \frac{\mu}{L}\right)^t \bigl(f(\boldsymbol{\theta}^{(0)}) - f(\boldsymbol{\theta}^*)\bigr).
\]
The ratio \(\kappa = L/\mu\) is the <em>condition number</em> of \(f\). Ill-conditioned problems (\(\kappa \gg 1\)) converge slowly.
</div>

### Line Search

Instead of fixing \(\alpha\), we can choose it adaptively at each step. **Exact line search** sets

\[
\alpha_t = \arg\min_{\alpha > 0} f\!\left(\boldsymbol{\theta}^{(t)} - \alpha\,\nabla f(\boldsymbol{\theta}^{(t)})\right).
\]

This is optimal in the sense that each step makes the largest possible decrease along the gradient direction, but the one-dimensional optimization may itself be expensive.

**Backtracking line search** is a practical compromise. Given parameters \(0 < \beta < 1\) and \(0 < c < 1\), start with \(\alpha = 1\) and repeatedly set \(\alpha \leftarrow \beta\alpha\) until the **Armijo condition** is satisfied:

\[
f(\boldsymbol{\theta} - \alpha\nabla f) \leq f(\boldsymbol{\theta}) - c\,\alpha\,\|\nabla f\|^2.
\]

This guarantees sufficient decrease at each step while avoiding the cost of exact line search.

<div class="example">
<strong>Example 3.1 (Gradient descent for logistic regression).</strong>

In logistic regression, the negative log-likelihood is

\[
f(\boldsymbol{\beta}) = -\sum_{i=1}^{n}\bigl[y_i\,\mathbf{x}_i^T\boldsymbol{\beta} - \ln(1 + e^{\mathbf{x}_i^T\boldsymbol{\beta}})\bigr].
\]
The gradient is

\[
\nabla f(\boldsymbol{\beta}) = -\sum_{i=1}^{n}(y_i - p_i)\mathbf{x}_i = -\mathbf{X}^T(\mathbf{y} - \mathbf{p}),
\]
where \(p_i = 1/(1+e^{-\mathbf{x}_i^T\boldsymbol{\beta}})\). Starting from \(\boldsymbol{\beta}^{(0)} = \mathbf{0}\), gradient descent with backtracking line search typically converges in 20 to 50 iterations for well-conditioned problems.
</div>

## 3.3 Newton-Raphson Method

### Derivation

**Newton-Raphson** (or simply Newton's method) uses second-order information to achieve much faster convergence. The idea is to approximate \(f\) locally by a quadratic (its second-order Taylor expansion) and minimize that quadratic exactly.

At the current iterate \(\boldsymbol{\theta}^{(t)}\), the second-order Taylor approximation of \(f\) is

\[
f(\boldsymbol{\theta}) \approx f(\boldsymbol{\theta}^{(t)}) + \nabla f(\boldsymbol{\theta}^{(t)})^T(\boldsymbol{\theta} - \boldsymbol{\theta}^{(t)}) + \frac{1}{2}(\boldsymbol{\theta} - \boldsymbol{\theta}^{(t)})^T \mathbf{H}(\boldsymbol{\theta}^{(t)})(\boldsymbol{\theta} - \boldsymbol{\theta}^{(t)}),
\]

where \(\mathbf{H}(\boldsymbol{\theta}) = \nabla^2 f(\boldsymbol{\theta})\) is the **Hessian matrix** of second partial derivatives. Minimizing this quadratic by setting the gradient to zero gives the **Newton-Raphson update**:

\[
\boldsymbol{\theta}^{(t+1)} = \boldsymbol{\theta}^{(t)} - \bigl[\mathbf{H}(\boldsymbol{\theta}^{(t)})\bigr]^{-1}\nabla f(\boldsymbol{\theta}^{(t)}).
\]

<div class="theorem">
<strong>Quadratic convergence of Newton's method.</strong> If \(f\) is twice continuously differentiable, the Hessian is Lipschitz continuous, and the starting point is sufficiently close to a minimizer \(\boldsymbol{\theta}^*\) where \(\mathbf{H}(\boldsymbol{\theta}^*)\) is positive definite, then Newton's method converges quadratically:

\[
\|\boldsymbol{\theta}^{(t+1)} - \boldsymbol{\theta}^*\| \leq C\|\boldsymbol{\theta}^{(t)} - \boldsymbol{\theta}^*\|^2
\]
for some constant \(C > 0\). This means that the number of correct digits roughly doubles at each iteration.
</div>

### Application to Maximum Likelihood

For MLE, we maximize the log-likelihood \(\ell(\boldsymbol{\theta})\), which is equivalent to minimizing \(f = -\ell\). The Newton-Raphson update becomes

\[
\boldsymbol{\theta}^{(t+1)} = \boldsymbol{\theta}^{(t)} + \bigl[-\nabla^2\ell(\boldsymbol{\theta}^{(t)})\bigr]^{-1}\nabla\ell(\boldsymbol{\theta}^{(t)}).
\]

Writing \(\mathbf{U}(\boldsymbol{\theta}) = \nabla\ell(\boldsymbol{\theta})\) for the **score function** and \(\mathcal{J}(\boldsymbol{\theta}) = -\nabla^2\ell(\boldsymbol{\theta})\) for the **observed information matrix**, this becomes

\[
\boldsymbol{\theta}^{(t+1)} = \boldsymbol{\theta}^{(t)} + \bigl[\mathcal{J}(\boldsymbol{\theta}^{(t)})\bigr]^{-1}\mathbf{U}(\boldsymbol{\theta}^{(t)}).
\]

<div class="example">
<strong>Example 3.2 (Newton-Raphson for Poisson MLE).</strong>

Let \(y_1, \ldots, y_n \overset{\text{iid}}{\sim} \text{Poisson}(\lambda)\). The log-likelihood is \(\ell(\lambda) = -n\lambda + \ln(\lambda)\sum y_i - \sum\ln(y_i!)\). The score is \(U(\lambda) = -n + \sum y_i/\lambda\) and the observed information is \(\mathcal{J}(\lambda) = \sum y_i/\lambda^2\).

The Newton-Raphson update is

\[
\lambda^{(t+1)} = \lambda^{(t)} + \frac{-n + \sum y_i/\lambda^{(t)}}{\sum y_i/(\lambda^{(t)})^2} = \lambda^{(t)} + \frac{(\lambda^{(t)})^2(\sum y_i - n\lambda^{(t)})}{\lambda^{(t)}\sum y_i} = \frac{\sum y_i}{n} = \bar{y}.
\]

Newton-Raphson converges in a single step to the MLE \(\hat{\lambda} = \bar{y}\), which is expected because the log-likelihood of an exponential family is a quadratic function of the natural parameter.
</div>

## 3.4 Fisher Scoring

**Fisher scoring** replaces the observed information matrix \(\mathcal{J}(\boldsymbol{\theta})\) with the **expected (Fisher) information matrix** \(\mathcal{I}(\boldsymbol{\theta}) = E[\mathcal{J}(\boldsymbol{\theta})]\):

\[
\boldsymbol{\theta}^{(t+1)} = \boldsymbol{\theta}^{(t)} + \bigl[\mathcal{I}(\boldsymbol{\theta}^{(t)})\bigr]^{-1}\mathbf{U}(\boldsymbol{\theta}^{(t)}).
\]

<div class="remark">
For distributions in the canonical exponential family, the observed and expected information matrices are identical, so Newton-Raphson and Fisher scoring produce the same iterates. For non-canonical models, Fisher scoring may converge more slowly but is often more numerically stable because the expected information is guaranteed to be positive semi-definite (whereas the observed information need not be).
</div>

The Fisher information matrix also connects to the asymptotic variance of the MLE via the Cramer-Rao bound: \(\text{Var}(\hat{\boldsymbol{\theta}}) \approx \mathcal{I}(\hat{\boldsymbol{\theta}})^{-1}\) for large samples. Thus the Fisher scoring iteration naturally produces both the MLE and an estimate of its precision.

## 3.5 Iteratively Reweighted Least Squares (IRLS)

**IRLS** is a powerful technique that reduces certain nonlinear optimization problems to a sequence of weighted least squares problems. It arises naturally in the fitting of generalized linear models (GLMs) and M-estimation.

### IRLS for GLMs

Consider a GLM with response \(\mathbf{y}\), linear predictor \(\boldsymbol{\eta} = \mathbf{X}\boldsymbol{\beta}\), link function \(g(\mu_i) = \eta_i\), and variance function \(V(\mu_i)\). The Fisher scoring update can be rewritten as a weighted least squares problem:

\[
\boldsymbol{\beta}^{(t+1)} = (\mathbf{X}^T\mathbf{W}^{(t)}\mathbf{X})^{-1}\mathbf{X}^T\mathbf{W}^{(t)}\mathbf{z}^{(t)},
\]

where the **working weights** are

\[
w_i^{(t)} = \frac{1}{V(\mu_i^{(t)})\,(g'(\mu_i^{(t)}))^2}
\]

and the **working response** (or adjusted dependent variate) is

\[
z_i^{(t)} = \eta_i^{(t)} + (y_i - \mu_i^{(t)})\,g'(\mu_i^{(t)}).
\]

Each iteration of IRLS thus solves a standard weighted least squares problem with updated weights and working responses.

### IRLS for M-Estimation

For M-estimation with loss \(\rho\), the IRLS algorithm proceeds as follows. Define weights

\[
w_i^{(t)} = \frac{\psi(r_i^{(t)}/\hat{\sigma})}{r_i^{(t)}/\hat{\sigma}},
\]

where \(r_i^{(t)} = y_i - \mathbf{x}_i^T\boldsymbol{\beta}^{(t)}\) and \(\psi = \rho'\). Then update:

\[
\boldsymbol{\beta}^{(t+1)} = (\mathbf{X}^T\mathbf{W}^{(t)}\mathbf{X})^{-1}\mathbf{X}^T\mathbf{W}^{(t)}\mathbf{y}.
\]

Observations with large residuals receive small weights, naturally down-weighting outliers. The iterations continue until the coefficients stabilize.

<div class="example">
<strong>Example 3.3 (IRLS for logistic regression).</strong>

For logistic regression with \(g(\mu) = \ln(\mu/(1-\mu))\), the working weights are \(w_i = \mu_i(1-\mu_i)\) where \(\mu_i = 1/(1+e^{-\mathbf{x}_i^T\boldsymbol{\beta}})\), and the working response is \(z_i = \mathbf{x}_i^T\boldsymbol{\beta} + (y_i - \mu_i)/[\mu_i(1-\mu_i)]\). Each IRLS iteration solves

\[
\boldsymbol{\beta}^{(t+1)} = (\mathbf{X}^T\mathbf{W}^{(t)}\mathbf{X})^{-1}\mathbf{X}^T\mathbf{W}^{(t)}\mathbf{z}^{(t)}.
\]
Convergence typically occurs in 5 to 10 iterations, much faster than gradient descent, because IRLS for canonical GLMs is equivalent to Newton-Raphson.
</div>

## 3.6 Convergence Diagnostics

In practice, we need criteria to decide when an iterative algorithm has converged. Common convergence diagnostics include:

1. **Absolute change in parameters**: Stop when \(\|\boldsymbol{\theta}^{(t+1)} - \boldsymbol{\theta}^{(t)}\| < \varepsilon\).
2. **Relative change in parameters**: Stop when \(\|\boldsymbol{\theta}^{(t+1)} - \boldsymbol{\theta}^{(t)}\|/\|\boldsymbol{\theta}^{(t)}\| < \varepsilon\).
3. **Change in objective**: Stop when \(|f(\boldsymbol{\theta}^{(t+1)}) - f(\boldsymbol{\theta}^{(t)})| < \varepsilon\).
4. **Gradient norm**: Stop when \(\|\nabla f(\boldsymbol{\theta}^{(t)})\| < \varepsilon\).

It is wise to monitor multiple criteria simultaneously and to set a maximum iteration count to prevent infinite loops. One should also inspect the Hessian at convergence to confirm that the solution is a local minimum (positive definite Hessian) rather than a saddle point or maximum.

### Comparison of Methods

| Method | Per-iteration cost | Convergence rate | Storage |
|---|---|---|---|
| Gradient descent | \(O(np)\) | Linear, \(O(1/t)\) | \(O(p)\) |
| Newton-Raphson | \(O(np^2 + p^3)\) | Quadratic | \(O(p^2)\) |
| Fisher scoring | \(O(np^2 + p^3)\) | Quadratic | \(O(p^2)\) |
| IRLS | \(O(np^2 + p^3)\) | Quadratic (canonical) | \(O(np + p^2)\) |

Gradient descent is cheapest per iteration but slowest overall. Newton-Raphson and Fisher scoring converge quadratically but require computing and inverting the Hessian, which is expensive when \(p\) is large. IRLS inherits the fast convergence of Newton-Raphson for GLMs while being conceptually simpler.


# Chapter 4: Sampling Theory and Design

## 4.1 Finite Population Inference

In finite population inference, randomness arises from the **sampling design** rather than from a probability model for the data. The population values \(y_1, \ldots, y_N\) are regarded as fixed but unknown; what is random is which units are selected into the sample.

<div class="definition">
<strong>Sampling design.</strong> A probability sampling design is a probability distribution \(p(\cdot)\) over all possible subsets of the population. For a given subset \(s \subseteq \mathcal{U}\), \(p(s)\) gives the probability that \(s\) is the selected sample. A design is called a <em>probability sampling design</em> if every unit has a positive probability of selection.
</div>

This design-based framework, pioneered by Neyman (1934) and developed by Horvitz and Thompson (1952), provides inferences that are valid regardless of the underlying distribution of the population values.

## 4.2 Simple Random Sampling

**Simple random sampling without replacement** (SRSWOR) is the most fundamental design. A sample of fixed size \(n\) is drawn such that every subset of size \(n\) is equally likely. There are \(\binom{N}{n}\) possible samples, each with probability \(p(s) = 1/\binom{N}{n}\).

Under SRSWOR, the sample mean \(\bar{y}_s = \frac{1}{n}\sum_{i \in s}y_i\) is an unbiased estimator of the population mean:

\[
E[\bar{y}_s] = \bar{y}_U.
\]

<div class="proof">
<strong>Proof of unbiasedness.</strong> Let \(\delta_i\) be the indicator that unit \(i\) is in the sample. Then \(E[\delta_i] = n/N\) for all \(i\) under SRSWOR. We have

\[
E[\bar{y}_s] = E\!\left[\frac{1}{n}\sum_{i=1}^{N}\delta_i y_i\right] = \frac{1}{n}\sum_{i=1}^{N}y_i\,E[\delta_i] = \frac{1}{n}\sum_{i=1}^{N}y_i\cdot\frac{n}{N} = \frac{1}{N}\sum_{i=1}^{N}y_i = \bar{y}_U.
\]
</div>

The variance of the sample mean under SRSWOR is

\[
\text{Var}(\bar{y}_s) = \frac{S^2_U}{n}\left(1 - \frac{n}{N}\right),
\]

where \(S^2_U = \frac{1}{N-1}\sum_{i=1}^{N}(y_i - \bar{y}_U)^2\) and the factor \((1 - n/N)\) is the **finite population correction** (fpc). When the sampling fraction \(n/N\) is small, the fpc is close to 1 and can be ignored.

<div class="example">
<strong>Example 4.1 (SRSWOR).</strong>

A population of \(N = 1000\) households has mean income \(\bar{y}_U = 65\) (thousands) and variance \(S^2_U = 400\). We draw an SRSWOR of size \(n = 100\). The variance of the sample mean is

\[
\text{Var}(\bar{y}_s) = \frac{400}{100}\left(1 - \frac{100}{1000}\right) = 4 \times 0.9 = 3.6.
\]
The standard error is \(\sqrt{3.6} = 1.897\). Without the fpc, the variance would be 4.0, a 10% overestimate.
</div>

## 4.3 Stratified Sampling

In **stratified sampling**, the population is divided into \(H\) non-overlapping subgroups (strata) \(\mathcal{U}_1, \ldots, \mathcal{U}_H\) with sizes \(N_1, \ldots, N_H\) and \(\sum N_h = N\). An independent simple random sample of size \(n_h\) is drawn from each stratum.

The stratified estimator of the population mean is

\[
\bar{y}_{\text{st}} = \sum_{h=1}^{H} W_h\,\bar{y}_h,
\]

where \(W_h = N_h/N\) is the stratum weight and \(\bar{y}_h\) is the sample mean in stratum \(h\).

<div class="theorem">
<strong>Variance of the stratified mean.</strong> Under stratified SRSWOR,

\[
\text{Var}(\bar{y}_{\text{st}}) = \sum_{h=1}^{H}W_h^2\,\frac{S_h^2}{n_h}\left(1 - \frac{n_h}{N_h}\right),
\]
where \(S_h^2\) is the population variance within stratum \(h\).
</div>

### Allocation Methods

The question of how to distribute the total sample size \(n\) among the strata is called **allocation**:

- **Proportional allocation**: \(n_h = n \cdot W_h\). This ensures that each stratum is represented in proportion to its size.
- **Neyman (optimal) allocation**: \(n_h \propto N_h S_h\). This minimizes the variance of \(\bar{y}_{\text{st}}\) for a fixed total sample size. Strata with greater variability receive larger samples.
- **Cost-optimal allocation**: \(n_h \propto N_h S_h / \sqrt{c_h}\), where \(c_h\) is the cost per observation in stratum \(h\).

<div class="example">
<strong>Example 4.2 (Proportional vs. Neyman allocation).</strong>

A population has \(H = 3\) strata with sizes \(N_1 = 500, N_2 = 300, N_3 = 200\) and within-stratum standard deviations \(S_1 = 10, S_2 = 20, S_3 = 50\). Total sample size is \(n = 100\).

Under proportional allocation: \(n_1 = 50, n_2 = 30, n_3 = 20\).
Under Neyman allocation: \(n_h \propto N_h S_h\), so the weights are \(500 \times 10 = 5000\), \(300 \times 20 = 6000\), \(200 \times 50 = 10000\), totalling 21000. Thus \(n_1 = 100 \times 5/21 \approx 24\), \(n_2 = 100 \times 6/21 \approx 29\), \(n_3 = 100 \times 10/21 \approx 48\).

Neyman allocation places far more observations in stratum 3 (which has the highest variability), reducing the overall variance.
</div>

## 4.4 Inclusion Probabilities

The **first-order inclusion probability** of unit \(i\) is

\[
\pi_i = P(i \in s) = \sum_{s \ni i} p(s).
\]

The **second-order inclusion probability** of units \(i\) and \(j\) is

\[
\pi_{ij} = P(i \in s \text{ and } j \in s) = \sum_{s \ni i, j} p(s).
\]

These probabilities play a central role in the Horvitz-Thompson framework.

Under SRSWOR of size \(n\) from a population of \(N\):

\[
\pi_i = \frac{n}{N}, \qquad \pi_{ij} = \frac{n(n-1)}{N(N-1)} \quad (i \neq j).
\]

Under stratified SRSWOR, the inclusion probabilities are stratum-specific: \(\pi_i = n_h/N_h\) for unit \(i\) in stratum \(h\).

In general, a **probability proportional to size** (PPS) design sets \(\pi_i \propto z_i\) where \(z_i\) is a size measure for unit \(i\). This is efficient when larger units contribute more to the population total.

## 4.5 The Horvitz-Thompson Estimator

The **Horvitz-Thompson (HT) estimator** is a general-purpose unbiased estimator of the population total that applies to any probability sampling design with known inclusion probabilities.

<div class="definition">
<strong>Horvitz-Thompson estimator.</strong> The HT estimator of the population total \(\tau = \sum_{i=1}^{N} y_i\) is

\[
\hat{\tau}_{\text{HT}} = \sum_{i \in s}\frac{y_i}{\pi_i},
\]
where \(\pi_i > 0\) is the inclusion probability of unit \(i\).
</div>

<div class="proof">
<strong>Proof of unbiasedness of the HT estimator.</strong>

Let \(\delta_i = \mathbf{1}(i \in s)\) denote the inclusion indicator for unit \(i\). Then \(E[\delta_i] = \pi_i\). We can write the HT estimator as a sum over all population units:

\[
\hat{\tau}_{\text{HT}} = \sum_{i \in s}\frac{y_i}{\pi_i} = \sum_{i=1}^{N}\delta_i\frac{y_i}{\pi_i}.
\]
Taking expectations (over the randomness of the sampling design):

\[
E[\hat{\tau}_{\text{HT}}] = \sum_{i=1}^{N}\frac{y_i}{\pi_i}E[\delta_i] = \sum_{i=1}^{N}\frac{y_i}{\pi_i}\cdot\pi_i = \sum_{i=1}^{N}y_i = \tau.
\]
Thus \(\hat{\tau}_{\text{HT}}\) is unbiased for \(\tau\) under any sampling design with \(\pi_i > 0\) for all \(i\).
</div>

The HT estimator of the population mean is simply \(\hat{\bar{y}}_{\text{HT}} = \hat{\tau}_{\text{HT}}/N\).

### Variance of the HT Estimator

<div class="theorem">
<strong>Horvitz-Thompson variance formula.</strong> The variance of \(\hat{\tau}_{\text{HT}}\) is

\[
\text{Var}(\hat{\tau}_{\text{HT}}) = \sum_{i=1}^{N}\sum_{j=1}^{N}(\pi_{ij} - \pi_i\pi_j)\frac{y_i}{\pi_i}\frac{y_j}{\pi_j}.
\]
This can be rewritten as

\[
\text{Var}(\hat{\tau}_{\text{HT}}) = \sum_{i=1}^{N}\frac{1-\pi_i}{\pi_i}y_i^2 + \sum_{i=1}^{N}\sum_{\substack{j=1 \\ j \neq i}}^{N}\frac{\pi_{ij} - \pi_i\pi_j}{\pi_i\pi_j}y_iy_j.
\]
</div>

An unbiased estimator of this variance, due to Horvitz and Thompson (1952) and Sen (1953) and Yates and Grundy (1953), is

\[
\widehat{\text{Var}}(\hat{\tau}_{\text{HT}}) = \sum_{i \in s}\sum_{j \in s}\frac{\pi_{ij} - \pi_i\pi_j}{\pi_{ij}}\cdot\frac{y_i}{\pi_i}\cdot\frac{y_j}{\pi_j},
\]

provided \(\pi_{ij} > 0\) for all pairs \(i,j\).

## 4.6 Design Effect

The **design effect** (deff) compares the variance of an estimator under a complex design to the variance that would be obtained under SRSWOR of the same sample size:

\[
\text{deff} = \frac{\text{Var}_{\text{complex}}(\hat{\bar{y}})}{\text{Var}_{\text{SRS}}(\hat{\bar{y}})}.
\]

A design effect less than 1 indicates that the complex design is more efficient than SRS; a design effect greater than 1 indicates it is less efficient. Stratified sampling typically has deff < 1 (more efficient), while cluster sampling typically has deff > 1 (less efficient because units within clusters tend to be similar).

The **effective sample size** is \(n_{\text{eff}} = n/\text{deff}\), representing the size of an SRSWOR sample that would achieve the same precision.

## 4.7 Sample Size Determination

Given a desired margin of error \(e\) and confidence level \(1 - \alpha\), the required sample size under SRSWOR is approximately

\[
n = \frac{z_{\alpha/2}^2\,S_U^2}{e^2 + z_{\alpha/2}^2\,S_U^2/N},
\]

where \(z_{\alpha/2}\) is the standard normal critical value. When \(N\) is large relative to \(n\), this simplifies to \(n \approx z_{\alpha/2}^2 S_U^2 / e^2\).

<div class="example">
<strong>Example 4.3 (Sample size calculation).</strong>

We wish to estimate the mean income of a population of \(N = 10{,}000\) to within \(e = 2\) thousand dollars with 95% confidence. A pilot study suggests \(S_U = 20\). The required sample size is

\[
n = \frac{1.96^2 \times 20^2}{2^2 + 1.96^2 \times 20^2/10000} = \frac{1536.64}{4 + 0.1537} = \frac{1536.64}{4.1537} \approx 370.
\]
Without the fpc, we would get \(n \approx 1536.64/4 = 384\), slightly larger.
</div>


# Chapter 5: Statistical Inference and Hypothesis Testing

## 5.1 Test Statistics as Functions of Data

A **test statistic** is a function of the observed data that measures evidence against a null hypothesis. In the computational statistics framework, a test statistic is simply another attribute, this time of the sample rather than the population.

<div class="definition">
<strong>Test statistic.</strong> Given data \(\mathbf{y} = (y_1, \ldots, y_n)\) and a null hypothesis \(H_0\), a test statistic \(T = T(\mathbf{y})\) is a real-valued function of the data chosen so that large values of \(|T|\) (or \(T\)) provide evidence against \(H_0\).
</div>

The **p-value** is the probability, under \(H_0\), of observing a test statistic as extreme as or more extreme than the one actually observed:

\[
p = P_{H_0}(T \geq t_{\text{obs}})
\]

for a one-sided test, or \(p = P_{H_0}(|T| \geq |t_{\text{obs}}|)\) for a two-sided test. Small p-values provide evidence against \(H_0\).

## 5.2 T-Like Measures

A **T-like measure** (or T-like statistic) is a test statistic that has the general form

\[
T = \frac{\text{signal}}{\text{noise}} = \frac{\hat{\theta} - \theta_0}{\widehat{\text{se}}(\hat{\theta})},
\]

where \(\hat{\theta}\) is an estimate of the parameter of interest, \(\theta_0\) is the null hypothesis value, and \(\widehat{\text{se}}(\hat{\theta})\) is an estimated standard error.

The classical Student \(t\)-statistic is the prototypical example. Under the null \(H_0: \mu = \mu_0\),

\[
T = \frac{\bar{y} - \mu_0}{s/\sqrt{n}},
\]

which has a \(t_{n-1}\) distribution if the data are normally distributed. The T-like framework generalizes this to any estimator and any standard error estimate.

T-like measures are useful because they are **pivotal** or approximately pivotal: their distribution under \(H_0\) does not depend (or depends only weakly) on unknown parameters. This makes it possible to compute p-values without knowing the exact distribution of the data.

<div class="example">
<strong>Example 5.1 (Two-sample T-like statistic).</strong>

To compare means of two populations with samples \(\mathbf{x} = (x_1, \ldots, x_{n_1})\) and \(\mathbf{y} = (y_1, \ldots, y_{n_2})\), the Welch T-like statistic is

\[
T = \frac{\bar{x} - \bar{y}}{\sqrt{s_x^2/n_1 + s_y^2/n_2}}.
\]
Under \(H_0: \mu_x = \mu_y\) and approximate normality, this follows a \(t\)-distribution with Satterthwaite degrees of freedom.
</div>

## 5.3 Permutation Tests

**Permutation tests** (also called randomization tests) provide an exact, nonparametric way to test hypotheses. The key idea is that under the null hypothesis of no treatment effect, the assignment of labels to observations is exchangeable.

The procedure for a permutation test is as follows. We compute the test statistic \(T_{\text{obs}}\) on the observed data. Then, for each possible permutation of the data labels (or a large random subset of permutations), we recompute the test statistic. The permutation p-value is the proportion of permutation test statistics that are as extreme as or more extreme than \(T_{\text{obs}}\):

\[
p_{\text{perm}} = \frac{\#\{T_{\pi} \geq T_{\text{obs}}\}}{M},
\]

where \(M\) is the number of permutations considered and \(T_\pi\) denotes the test statistic under permutation \(\pi\).

<div class="theorem">
<strong>Exactness of the permutation test.</strong> Under the null hypothesis that the two groups have identical distributions, the permutation test has exact size \(\alpha\) when all \(\binom{n_1+n_2}{n_1}\) permutations are used. That is, \(P_{H_0}(p_{\text{perm}} \leq \alpha) = \alpha\). No distributional assumptions are needed.
</div>

<div class="example">
<strong>Example 5.2 (Permutation test for two-sample difference).</strong>

Suppose we have treatment group data \(\{4, 7, 8, 9\}\) and control group data \(\{1, 2, 3, 5\}\). The observed difference in means is \(\bar{x} - \bar{y} = 7.0 - 2.75 = 4.25\). Under \(H_0\), all \(\binom{8}{4} = 70\) assignments of the eight values to two groups of four are equally likely.

We enumerate all 70 permutations and compute the mean difference for each. The proportion of permutations with mean difference \(\geq 4.25\) gives the one-sided p-value. If 2 of the 70 permutations yield a difference of 4.25 or larger, then \(p = 2/70 \approx 0.029\).
</div>

## 5.4 The Multiple Testing Problem

When we perform \(m\) simultaneous hypothesis tests, the chance of at least one false rejection increases rapidly. If each test is conducted at level \(\alpha = 0.05\) and the tests are independent, the probability of at least one false positive is \(1 - (1-\alpha)^m\), which approaches 1 as \(m\) grows.

<div class="definition">
<strong>Family-wise error rate (FWER).</strong> The probability of making one or more false rejections among all \(m\) tests:

\[
\text{FWER} = P(\text{at least one false rejection}).
\]
</div>

<div class="definition">
<strong>False discovery rate (FDR).</strong> The expected proportion of rejections that are false:

\[
\text{FDR} = E\!\left[\frac{V}{R \vee 1}\right],
\]
where \(V\) is the number of false rejections, \(R\) is the total number of rejections, and \(R \vee 1 = \max(R, 1)\) avoids division by zero.
</div>

The FDR is a less conservative criterion than the FWER. When many hypotheses are tested, controlling the FDR at level \(q\) tolerates some false discoveries while maintaining that, on average, the proportion of false discoveries among all discoveries is at most \(q\).

## 5.5 Bonferroni Correction

The **Bonferroni correction** is the simplest method for controlling the FWER. It rejects the \(i\)-th hypothesis if \(p_i \leq \alpha/m\), where \(m\) is the number of tests.

<div class="theorem">
<strong>Bonferroni inequality.</strong> For any set of events \(A_1, \ldots, A_m\),

\[
P\!\left(\bigcup_{i=1}^{m}A_i\right) \leq \sum_{i=1}^{m}P(A_i).
\]
Therefore, if each \(P(A_i) \leq \alpha/m\), then \(P(\bigcup A_i) \leq \alpha\), guaranteeing \(\text{FWER} \leq \alpha\).
</div>

The Bonferroni correction is valid regardless of the dependence structure among the tests, making it very general. However, it is also very conservative, especially when \(m\) is large, leading to low power.

## 5.6 Holm's Method

**Holm's method** (1979) is a stepwise improvement over Bonferroni that is uniformly more powerful while still controlling the FWER at level \(\alpha\). The procedure is:

1. Order the p-values: \(p_{(1)} \leq p_{(2)} \leq \cdots \leq p_{(m)}\).
2. Find the smallest index \(k\) such that \(p_{(k)} > \alpha/(m - k + 1)\).
3. Reject hypotheses corresponding to \(p_{(1)}, \ldots, p_{(k-1)}\).

<div class="example">
<strong>Example 5.3 (Holm vs. Bonferroni).</strong>

Suppose \(m = 4\) tests with p-values \(p_1 = 0.001, p_2 = 0.010, p_3 = 0.040, p_4 = 0.060\) and \(\alpha = 0.05\).

Bonferroni threshold: \(0.05/4 = 0.0125\). Only \(p_1\) and \(p_2\) are rejected.

Holm's method:
\(p_{(1)} = 0.001 \leq 0.05/4 = 0.0125\) (reject),
\(p_{(2)} = 0.010 \leq 0.05/3 = 0.0167\) (reject),
\(p_{(3)} = 0.040 \leq 0.05/2 = 0.025\) (not rejected, stop).
Holm rejects the same two hypotheses in this case, but in general Holm can reject strictly more.
</div>

## 5.7 False Discovery Rate: Benjamini-Hochberg Procedure

The **Benjamini-Hochberg (BH) procedure** (1995) controls the FDR at level \(q\). The procedure is:

1. Order the p-values: \(p_{(1)} \leq p_{(2)} \leq \cdots \leq p_{(m)}\).
2. Find the largest index \(k\) such that \(p_{(k)} \leq \frac{k}{m}q\).
3. Reject all hypotheses corresponding to \(p_{(1)}, \ldots, p_{(k)}\).

<div class="theorem">
<strong>Benjamini-Hochberg FDR control.</strong> If the p-values corresponding to the true null hypotheses are independent (or satisfy positive regression dependence on each one, PRDS), the BH procedure controls the FDR:

\[
\text{FDR} \leq \frac{m_0}{m}\,q \leq q,
\]
where \(m_0\) is the number of true null hypotheses.
</div>

The BH procedure is substantially more powerful than Bonferroni or Holm when many hypotheses are tested, because it allows a controlled proportion of false discoveries rather than demanding that the probability of even one false discovery be small.

<div class="example">
<strong>Example 5.4 (BH procedure).</strong>

Consider \(m = 10\) tests with ordered p-values:

| Rank \(k\) | \(p_{(k)}\) | BH threshold \(kq/m\) (at \(q = 0.10\)) | Reject? |
|---|---|---|---|
| 1 | 0.001 | 0.010 | Yes |
| 2 | 0.005 | 0.020 | Yes |
| 3 | 0.012 | 0.030 | Yes |
| 4 | 0.030 | 0.040 | Yes |
| 5 | 0.045 | 0.050 | Yes |
| 6 | 0.070 | 0.060 | No |
| 7 | 0.120 | 0.070 | No |
| 8 | 0.300 | 0.080 | No |
| 9 | 0.500 | 0.090 | No |
| 10 | 0.800 | 0.100 | No |

The largest \(k\) with \(p_{(k)} \leq kq/m\) is \(k = 5\). We reject the first 5 hypotheses. The Bonferroni threshold would be \(0.10/10 = 0.01\), rejecting only the first 2 hypotheses. The BH procedure discovers more significant results while controlling the expected proportion of false discoveries.
</div>


# Chapter 6: Bootstrap Methods

## 6.1 The Bootstrap Principle

The **bootstrap**, introduced by Efron (1979), is a general-purpose resampling method for estimating the sampling distribution of a statistic. The fundamental insight is that the empirical distribution of the observed data can serve as a stand-in for the unknown population distribution.

<div class="definition">
<strong>The bootstrap principle.</strong> Let \(\hat{F}_n\) be the empirical distribution function of the observed sample \(y_1, \ldots, y_n\). A <em>bootstrap sample</em> \(y_1^*, \ldots, y_n^*\) is obtained by sampling \(n\) values independently with replacement from \(\hat{F}_n\) (equivalently, from the original data). The bootstrap estimate of the sampling distribution of a statistic \(T(\mathbf{y})\) is obtained by computing \(T(\mathbf{y}^*)\) on many bootstrap samples.
</div>

The logic is as follows. In the real world, the sample \(\mathbf{y}\) is drawn from an unknown distribution \(F\), and we want to know the distribution of \(T(\mathbf{y})\). In the bootstrap world, the bootstrap sample \(\mathbf{y}^*\) is drawn from \(\hat{F}_n\), and the distribution of \(T(\mathbf{y}^*)\) approximates that of \(T(\mathbf{y})\).

### The Nonparametric Bootstrap Algorithm

The algorithm proceeds as follows.

1. Compute the statistic of interest \(\hat{\theta} = T(\mathbf{y})\) on the original data.
2. For \(b = 1, 2, \ldots, B\):
   - Draw a bootstrap sample \(\mathbf{y}^{*b}\) by sampling \(n\) values with replacement from \(\mathbf{y}\).
   - Compute \(\hat{\theta}^{*b} = T(\mathbf{y}^{*b})\).
3. The collection \(\{\hat{\theta}^{*1}, \ldots, \hat{\theta}^{*B}\}\) approximates the sampling distribution of \(\hat{\theta}\).

Typical values of \(B\) are 200 to 1000 for estimating standard errors and 1000 to 10000 for constructing confidence intervals.

## 6.2 Bootstrap Standard Errors

The bootstrap estimate of the standard error of \(\hat{\theta}\) is the sample standard deviation of the bootstrap replications:

\[
\widehat{\text{se}}_{\text{boot}} = \sqrt{\frac{1}{B-1}\sum_{b=1}^{B}\bigl(\hat{\theta}^{*b} - \bar{\theta}^*\bigr)^2},
\]

where \(\bar{\theta}^* = \frac{1}{B}\sum_{b=1}^{B}\hat{\theta}^{*b}\).

<div class="example">
<strong>Example 6.1 (Bootstrap standard error of the median).</strong>

Consider the sample \(\mathbf{y} = \{3, 5, 7, 8, 12, 14, 18, 22, 25, 30\}\). The sample median is \(\hat{\theta} = 13\). Unlike the mean, there is no simple formula for the standard error of the median. We generate \(B = 2000\) bootstrap samples, compute the median of each, and obtain a bootstrap standard error of approximately 4.2. This gives a sense of the precision of the median estimate without requiring distributional assumptions.
</div>

## 6.3 Bootstrap Bias Estimation

The bootstrap can also estimate the **bias** of an estimator. The bias of \(\hat{\theta}\) for estimating a parameter \(\theta\) is \(\text{Bias}(\hat{\theta}) = E[\hat{\theta}] - \theta\).

<div class="theorem">
<strong>Bootstrap bias estimator.</strong> The bootstrap estimate of bias is

\[
\widehat{\text{Bias}}_{\text{boot}} = \bar{\theta}^* - \hat{\theta},
\]
where \(\bar{\theta}^* = \frac{1}{B}\sum_{b=1}^{B}\hat{\theta}^{*b}\) is the mean of the bootstrap replications and \(\hat{\theta}\) is the original estimate.
</div>

<div class="proof">
<strong>Derivation.</strong> In the bootstrap world, \(\hat{F}_n\) plays the role of the true distribution \(F\), and \(\hat{\theta}\) plays the role of the true parameter \(\theta(F)\). The bootstrap version of the bias is

\[
E^*[\hat{\theta}^*] - \hat{\theta},
\]
where \(E^*\) denotes expectation over the bootstrap distribution. The Monte Carlo approximation to \(E^*[\hat{\theta}^*]\) is \(\bar{\theta}^*\), giving the bootstrap bias estimate \(\bar{\theta}^* - \hat{\theta}\).
</div>

A **bias-corrected** estimate is \(\hat{\theta}_{\text{bc}} = \hat{\theta} - \widehat{\text{Bias}}_{\text{boot}} = 2\hat{\theta} - \bar{\theta}^*\). However, bias correction increases variance, and it should be used judiciously. A useful rule of thumb from Efron and Tibshirani (1993) is to apply bias correction only when the estimated bias is more than 25% of the estimated standard error.

## 6.4 Bootstrap Confidence Intervals

Bootstrap confidence intervals are one of the most important applications of the bootstrap. Several methods exist, each with different theoretical properties.

### Percentile Method

The simplest bootstrap confidence interval is the **percentile interval**. A \(100(1-\alpha)\%\) percentile confidence interval is

\[
\bigl[\hat{\theta}^*_{(\alpha/2)},\;\hat{\theta}^*_{(1-\alpha/2)}\bigr],
\]

where \(\hat{\theta}^*_{(\alpha/2)}\) is the \(\alpha/2\) quantile of the bootstrap distribution. For example, with \(B = 2000\) and \(\alpha = 0.05\), the 95% percentile interval uses the 50th and 1950th ordered bootstrap values.

The percentile method is simple and transformation-respecting (if we apply a monotone transformation \(\phi = g(\theta)\), the percentile interval for \(\phi\) is just \([g(\hat{\theta}^*_{(\alpha/2)}), g(\hat{\theta}^*_{(1-\alpha/2)})]\)). However, it can have poor coverage when the bootstrap distribution is biased or skewed.

### Basic (Pivotal) Bootstrap Interval

The **basic bootstrap interval** (also called the pivotal or reflection method) is based on the idea that the distribution of \(\hat{\theta}^* - \hat{\theta}\) approximates the distribution of \(\hat{\theta} - \theta\). This leads to

\[
\bigl[2\hat{\theta} - \hat{\theta}^*_{(1-\alpha/2)},\; 2\hat{\theta} - \hat{\theta}^*_{(\alpha/2)}\bigr].
\]

Note the reversal of quantiles: the upper quantile of the bootstrap distribution is subtracted from \(2\hat{\theta}\) to get the lower confidence bound, and vice versa.

### BCa (Bias-Corrected and Accelerated) Interval

The **BCa interval**, introduced by Efron (1987), is a second-order accurate method that corrects for both bias and skewness in the bootstrap distribution. The BCa interval adjusts the percentile endpoints:

\[
\bigl[\hat{\theta}^*_{(\alpha_1)},\;\hat{\theta}^*_{(\alpha_2)}\bigr],
\]

where

\[
\alpha_1 = \Phi\!\left(\hat{z}_0 + \frac{\hat{z}_0 + z_{\alpha/2}}{1 - \hat{a}(\hat{z}_0 + z_{\alpha/2})}\right), \qquad \alpha_2 = \Phi\!\left(\hat{z}_0 + \frac{\hat{z}_0 + z_{1-\alpha/2}}{1 - \hat{a}(\hat{z}_0 + z_{1-\alpha/2})}\right).
\]

The two correction parameters are:

- **Bias correction** \(\hat{z}_0\): estimated as \(\hat{z}_0 = \Phi^{-1}\!\left(\frac{\#\{\hat{\theta}^{*b} < \hat{\theta}\}}{B}\right)\), the proportion of bootstrap estimates below the original estimate, transformed to the normal scale.

- **Acceleration** \(\hat{a}\): estimated using the jackknife. Let \(\hat{\theta}_{(-i)}\) be the estimate with the \(i\)-th observation deleted, and \(\bar{\theta}_{(\cdot)} = \frac{1}{n}\sum_{i=1}^{n}\hat{\theta}_{(-i)}\). Then

\[
\hat{a} = \frac{\sum_{i=1}^{n}(\bar{\theta}_{(\cdot)} - \hat{\theta}_{(-i)})^3}{6\left[\sum_{i=1}^{n}(\bar{\theta}_{(\cdot)} - \hat{\theta}_{(-i)})^2\right]^{3/2}}.
\]

<div class="remark">
The BCa interval is <em>second-order accurate</em>, meaning that the error in its coverage probability is \(O(n^{-1})\) rather than the \(O(n^{-1/2})\) of the percentile and basic methods. It is also <em>transformation-respecting</em>: the interval for \(g(\theta)\) is obtained by applying \(g\) to the interval endpoints for \(\theta\). Efron and Tibshirani (1993) recommend the BCa interval as the method of choice for most applications.
</div>

<div class="example">
<strong>Example 6.2 (Comparing bootstrap CIs).</strong>

Consider estimating the skewness \(\gamma = E[(X-\mu)^3]/\sigma^3\) from a sample of size \(n = 50\) drawn from an exponential distribution. The true skewness is \(\gamma = 2\). Using \(B = 5000\) bootstrap replications:

The percentile interval: \([0.42, 2.10]\).
The basic interval: \([0.58, 2.26]\).
The BCa interval: \([0.68, 2.45]\).

The BCa interval is wider on the right, correctly reflecting the positive skewness of the sampling distribution of the skewness estimator. All three intervals contain the true value 2, but the BCa interval has the most accurate coverage over many repetitions.
</div>

### Bootstrap-t Interval

The **bootstrap-t interval** (or studentized bootstrap) is based on the bootstrap distribution of the studentized statistic \(T^* = (\hat{\theta}^* - \hat{\theta})/\widehat{\text{se}}^*\), where \(\widehat{\text{se}}^*\) is the standard error estimate computed within each bootstrap sample. Let \(t^*_{(\alpha/2)}\) and \(t^*_{(1-\alpha/2)}\) be the quantiles of the bootstrap-t distribution. The interval is

\[
\bigl[\hat{\theta} - t^*_{(1-\alpha/2)}\,\widehat{\text{se}},\;\hat{\theta} - t^*_{(\alpha/2)}\,\widehat{\text{se}}\bigr].
\]

This method is also second-order accurate. Its main drawback is that it requires computing a standard error estimate within each bootstrap sample, which may itself require an inner bootstrap loop (a "bootstrap within a bootstrap"), making it computationally expensive.

## 6.5 Parametric Bootstrap

The **parametric bootstrap** replaces the empirical distribution \(\hat{F}_n\) with a fitted parametric model \(\hat{F}_{\hat{\theta}}\). Bootstrap samples are generated from the parametric model rather than by resampling the data.

The parametric bootstrap algorithm is:

1. Fit a parametric model to obtain \(\hat{\theta}\).
2. For \(b = 1, \ldots, B\): generate \(\mathbf{y}^{*b} \sim \hat{F}_{\hat{\theta}}\) and compute \(\hat{\theta}^{*b} = T(\mathbf{y}^{*b})\).
3. Use the distribution of \(\{\hat{\theta}^{*b}\}\) for inference.

<div class="example">
<strong>Example 6.3 (Parametric bootstrap for exponential rate).</strong>

Suppose \(y_1, \ldots, y_n \sim \text{Exp}(\lambda)\) and we estimate \(\lambda\) by \(\hat{\lambda} = 1/\bar{y}\). To get a bootstrap CI for \(\lambda\):

1. Generate each bootstrap sample as \(y_1^*, \ldots, y_n^* \overset{\text{iid}}{\sim} \text{Exp}(\hat{\lambda})\).
2. Compute \(\hat{\lambda}^{*b} = 1/\bar{y}^{*b}\) for each bootstrap sample.
3. The 2.5th and 97.5th percentiles of \(\{\hat{\lambda}^{*b}\}\) give a 95% percentile CI.

If the exponential model is correct, the parametric bootstrap is more efficient than the nonparametric bootstrap because it uses the additional structural information.
</div>

## 6.6 Bootstrap Hypothesis Testing

The bootstrap can also be used for hypothesis testing. To test \(H_0: \theta = \theta_0\), we construct a bootstrap version of the null distribution.

One approach is to generate bootstrap samples from a distribution that satisfies \(H_0\). For example, to test \(H_0: \mu_1 = \mu_2\) for two samples, we can center both samples (subtract their respective means and add the pooled mean), then bootstrap from the centered data. The p-value is the proportion of bootstrap test statistics exceeding the observed test statistic.

## 6.7 When the Bootstrap Fails

The bootstrap is remarkably versatile but not universally applicable. It can fail in several situations:

1. **Extreme order statistics**: For the maximum of the sample, the bootstrap distribution is inconsistent. If \(\hat{\theta} = y_{(n)}\), the bootstrap distribution of \(y^*_{(n)} - y_{(n)}\) does not converge to the distribution of \(y_{(n)} - \theta\).

2. **Non-smooth statistics**: Statistics that are not smooth functions of the empirical distribution (such as the mode) may have unreliable bootstrap distributions.

3. **Heavy tails without finite variance**: If the underlying distribution has infinite variance, the bootstrap for the sample mean is inconsistent because the central limit theorem does not apply.

4. **Dependent data**: The standard iid bootstrap is invalid for dependent data (time series, spatial data). Special bootstrap variants are needed, such as the block bootstrap or the stationary bootstrap.

5. **Small samples**: With very small \(n\), the empirical distribution is a poor approximation to \(F\), and bootstrap inference may be unreliable.

<div class="remark">
A practical guideline: the bootstrap works well for statistics that are smooth functions of means (or, more generally, smooth functions of the empirical distribution). It tends to work poorly for statistics that depend on a few extreme observations or that have discontinuous behavior.
</div>


# Chapter 7: Prediction and Model Assessment

## 7.1 Prediction Error

In supervised learning and regression, the primary goal is often prediction: given a new observation \(\mathbf{x}_{\text{new}}\), we want to predict the response \(y_{\text{new}}\). The quality of a prediction rule \(\hat{f}\) is measured by its **prediction error** (or generalization error).

<div class="definition">
<strong>Expected prediction error.</strong> For a squared-error loss, the expected prediction error of a fitted model \(\hat{f}\) at a new point \(\mathbf{x}_0\) is

\[
\text{Err}(\mathbf{x}_0) = E\bigl[(Y_0 - \hat{f}(\mathbf{x}_0))^2\bigr],
\]
where the expectation is over both the new response \(Y_0\) and the training data used to construct \(\hat{f}\). The overall expected prediction error is \(\text{Err} = E_{\mathbf{x}_0}[\text{Err}(\mathbf{x}_0)]\).
</div>

## 7.2 Training Error vs. Test Error

The **training error** is the average loss on the data used to fit the model:

\[
\overline{\text{err}} = \frac{1}{n}\sum_{i=1}^{n}L(y_i, \hat{f}(\mathbf{x}_i)).
\]

The **test error** (or generalization error) is the expected loss on new, independent data:

\[
\text{Err} = E[L(Y_0, \hat{f}(\mathbf{X}_0))].
\]

Training error systematically underestimates test error because the model was fit to minimize loss on the training data. More flexible models achieve lower training error but may not generalize well; this phenomenon is called **overfitting**.

## 7.3 Bias-Variance Decomposition

The expected prediction error can be decomposed into three components. For a regression problem with squared-error loss:

<div class="theorem">
<strong>Bias-variance decomposition.</strong> At a fixed point \(\mathbf{x}_0\),

\[
E\bigl[(Y_0 - \hat{f}(\mathbf{x}_0))^2\bigr] = \text{Var}(\varepsilon) + \bigl[\text{Bias}(\hat{f}(\mathbf{x}_0))\bigr]^2 + \text{Var}(\hat{f}(\mathbf{x}_0)),
\]
where

\[
\text{Bias}(\hat{f}(\mathbf{x}_0)) = E[\hat{f}(\mathbf{x}_0)] - f(\mathbf{x}_0)
\]
is the bias of the prediction at \(\mathbf{x}_0\), and \(\text{Var}(\hat{f}(\mathbf{x}_0))\) is the variance of the prediction due to randomness in the training data.
</div>

<div class="proof">
<strong>Derivation.</strong> Let \(f(\mathbf{x}_0) = E[Y_0 \mid \mathbf{x}_0]\) be the true regression function, and write \(Y_0 = f(\mathbf{x}_0) + \varepsilon\) where \(E[\varepsilon] = 0\) and \(\text{Var}(\varepsilon) = \sigma^2\). Then

\[
E[(Y_0 - \hat{f})^2] = E[(f + \varepsilon - \hat{f})^2] = E[(f - \hat{f})^2] + E[\varepsilon^2] + 2E[\varepsilon(f - \hat{f})].
\]
Since \(\varepsilon\) is independent of \(\hat{f}\) and has mean zero, the cross-term vanishes. For the first term:

\[
E[(f - \hat{f})^2] = (f - E[\hat{f}])^2 + E[(\hat{f} - E[\hat{f}])^2] = \text{Bias}^2 + \text{Var}(\hat{f}).
\]
Combining: \(E[(Y_0 - \hat{f})^2] = \sigma^2 + \text{Bias}^2 + \text{Var}(\hat{f})\).
</div>

This decomposition reveals the fundamental **bias-variance trade-off**: simple models have high bias and low variance; complex models have low bias and high variance. The optimal model balances these two sources of error. The irreducible error \(\sigma^2\) sets a lower bound on prediction error that no model can beat.

<div class="example">
<strong>Example 7.1 (Bias-variance trade-off in polynomial regression).</strong>

Consider fitting polynomial regressions of degree \(d = 1, 2, \ldots, 15\) to data generated from \(f(x) = \sin(2\pi x) + \varepsilon\), \(\varepsilon \sim \mathcal{N}(0, 0.3^2)\), with \(n = 30\) training points.

For \(d = 1\) (linear fit): high bias (a line cannot capture the sinusoidal shape), low variance. Test error is high.
For \(d = 3\): moderate bias, moderate variance. Test error is near its minimum.
For \(d = 15\): very low bias (the polynomial can fit any shape), very high variance (the fit oscillates wildly between data points). Test error is high.

The optimal degree is around \(d = 3\) or \(d = 4\), where the sum of squared bias and variance is minimized.
</div>

## 7.4 Cross-Validation

**Cross-validation** (CV) is the most widely used method for estimating prediction error from the training data alone. Instead of fitting the model once, we repeatedly hold out part of the data for testing and train on the rest.

### Leave-One-Out Cross-Validation (LOOCV)

In **LOOCV**, each observation is left out one at a time. For \(i = 1, \ldots, n\), fit the model on all data except observation \(i\) to get \(\hat{f}^{(-i)}\), and predict the left-out observation. The LOOCV estimate of prediction error is

\[
\text{CV}_{(n)} = \frac{1}{n}\sum_{i=1}^{n}L(y_i, \hat{f}^{(-i)}(\mathbf{x}_i)).
\]

<div class="remark">
For linear models with squared-error loss, there is a shortcut that avoids refitting \(n\) times:

\[
\text{CV}_{(n)} = \frac{1}{n}\sum_{i=1}^{n}\left(\frac{y_i - \hat{y}_i}{1 - h_{ii}}\right)^2,
\]
where \(\hat{y}_i\) is the fitted value from the full model and \(h_{ii}\) is the \(i\)-th diagonal element of the hat matrix \(\mathbf{H} = \mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\).
</div>

LOOCV is approximately unbiased for the true prediction error because each model is trained on \(n-1\) observations, which is almost the full sample. However, the \(n\) estimates are highly correlated (they share \(n-2\) observations), which can lead to high variance in the CV estimate.

### K-Fold Cross-Validation

In **\(K\)-fold CV**, the data are randomly partitioned into \(K\) roughly equal-sized groups (folds) \(C_1, \ldots, C_K\). For \(k = 1, \ldots, K\), fit the model on all data outside fold \(C_k\) and predict the observations in \(C_k\):

\[
\text{CV}_{(K)} = \frac{1}{n}\sum_{k=1}^{K}\sum_{i \in C_k}L(y_i, \hat{f}^{(-C_k)}(\mathbf{x}_i)).
\]

Common choices are \(K = 5\) or \(K = 10\).

<div class="theorem">
<strong>Bias-variance trade-off in CV.</strong> LOOCV (\(K = n\)) has low bias but potentially high variance because the \(n\) training sets overlap heavily, making the estimates correlated. \(K\)-fold CV with smaller \(K\) has slightly higher bias (each training set has size \(n(K-1)/K\), which is less than \(n-1\)) but lower variance because the training sets are more independent. The choice \(K = 5\) or \(K = 10\) provides a good compromise. Empirical and theoretical studies (Breiman and Spector, 1992; Kohavi, 1995) suggest that \(K = 10\) works well in most situations.
</div>

### Repeated Cross-Validation

To further reduce the variance of the CV estimate, we can repeat \(K\)-fold CV multiple times with different random partitions and average the results. **Repeated \(K\)-fold CV** typically uses 10 to 50 repetitions. While computationally more expensive, it provides more stable estimates of prediction error.

<div class="example">
<strong>Example 7.2 (Model selection via 10-fold CV).</strong>

We fit polynomial regressions of degree \(d = 1, 2, \ldots, 10\) to \(n = 100\) observations and estimate the test error for each using 10-fold CV repeated 20 times.

| Degree | Training MSE | 10-fold CV MSE | Standard Error |
|---|---|---|---|
| 1 | 0.142 | 0.158 | 0.012 |
| 2 | 0.098 | 0.112 | 0.010 |
| 3 | 0.085 | 0.095 | 0.009 |
| 4 | 0.083 | 0.094 | 0.010 |
| 5 | 0.081 | 0.098 | 0.011 |
| 10 | 0.072 | 0.135 | 0.018 |

Training MSE decreases monotonically with degree, but CV MSE reaches a minimum around \(d = 3\) or \(d = 4\), after which it increases due to overfitting. The one-standard-error rule would select \(d = 3\), the simplest model within one standard error of the minimum.
</div>

## 7.5 Information Criteria

Information criteria provide an alternative to cross-validation for model selection. They add a penalty to the training error to account for model complexity.

### Akaike Information Criterion (AIC)

The **AIC** is defined as

\[
\text{AIC} = -2\ell(\hat{\boldsymbol{\theta}}) + 2p,
\]

where \(\ell(\hat{\boldsymbol{\theta}})\) is the maximized log-likelihood and \(p\) is the number of estimated parameters. The first term measures fit (smaller is better) and the second penalizes complexity.

<div class="theorem">
<strong>AIC and cross-validation.</strong> Stone (1977) showed that, for linear models, AIC is asymptotically equivalent to LOOCV. Both estimate the expected Kullback-Leibler divergence between the fitted model and the true data-generating process. This provides a theoretical justification for AIC as a prediction-oriented model selection criterion.
</div>

For linear regression with normal errors, the AIC simplifies to

\[
\text{AIC} = n\ln(\text{RSS}/n) + 2p,
\]

where RSS is the residual sum of squares.

### Bayesian Information Criterion (BIC)

The **BIC** (or Schwarz criterion) replaces the penalty \(2p\) with \(p\ln(n)\):

\[
\text{BIC} = -2\ell(\hat{\boldsymbol{\theta}}) + p\ln(n).
\]

Since \(\ln(n) > 2\) for \(n \geq 8\), the BIC imposes a heavier penalty on model complexity than AIC for moderate to large sample sizes. This makes BIC more conservative, tending to select simpler models.

<div class="remark">
AIC and BIC have different theoretical justifications and different goals. AIC aims to select the model that best predicts future data (minimizes Kullback-Leibler divergence); BIC aims to identify the true model (under the assumption that the true model is among the candidates). In practice, AIC tends to overfit slightly (selecting too-complex models), while BIC tends to underfit slightly (selecting too-simple models). When prediction is the primary goal, AIC (or cross-validation) is preferred; when identifying the correct model structure matters, BIC is preferred.
</div>

<div class="example">
<strong>Example 7.3 (AIC vs. BIC for variable selection).</strong>

Consider a regression with \(n = 200\) observations and 8 candidate predictors. The true model uses 3 predictors. We evaluate all \(2^8 = 256\) possible subsets.

AIC selects a model with 4 predictors (the 3 true ones plus one noise predictor) in about 35% of simulations, and selects the correct 3-predictor model in about 45% of simulations.

BIC selects the correct 3-predictor model in about 70% of simulations, but occasionally selects a 2-predictor model (underfitting) in about 10% of simulations.

The BIC's heavier penalty is better at identifying the true model, but AIC's selected model often has slightly lower prediction error because the extra predictor, while not truly needed, reduces variance slightly.
</div>

## 7.6 Model Selection via Cross-Validation

Cross-validation is often used directly for model selection. The procedure is:

1. For each candidate model \(m \in \mathcal{M}\), compute the CV estimate of prediction error \(\widehat{\text{Err}}_{\text{CV}}(m)\).
2. Select the model \(\hat{m} = \arg\min_{m \in \mathcal{M}} \widehat{\text{Err}}_{\text{CV}}(m)\).

### The One-Standard-Error Rule

The one-standard-error rule, proposed by Breiman et al. (1984) and popularized by Hastie, Tibshirani, and Friedman (2009), selects the simplest model whose CV error is within one standard error of the minimum:

\[
\hat{m}_{1\text{SE}} = \text{simplest } m \text{ such that } \widehat{\text{Err}}_{\text{CV}}(m) \leq \widehat{\text{Err}}_{\text{CV}}(\hat{m}) + \text{SE}(\widehat{\text{Err}}_{\text{CV}}(\hat{m})).
\]

This rule incorporates a preference for parsimony, recognizing that CV estimates have uncertainty and that a simpler model that performs nearly as well is often preferable.

## 7.7 Optimism and the Training-Test Gap

The **optimism** of the training error is the expected difference between the test error and the training error:

\[
\text{op} = E[\text{Err}] - E[\overline{\text{err}}].
\]

For squared-error loss and linear models, the optimism is

\[
\text{op} = \frac{2}{n}\sum_{i=1}^{n}\text{Cov}(y_i, \hat{y}_i) = \frac{2p\sigma^2}{n},
\]

where \(p\) is the number of parameters and \(\sigma^2\) is the error variance. This yields Mallows' \(C_p\) statistic:

\[
C_p = \overline{\text{err}} + \frac{2p\hat{\sigma}^2}{n},
\]

which estimates the expected prediction error. The \(C_p\) statistic, AIC, and LOOCV are all asymptotically equivalent for linear models.

<div class="example">
<strong>Example 7.4 (Comparing model selection methods).</strong>

For the polynomial regression problem in Example 7.2, we compare the model selected by each method:

| Method | Selected degree | Test MSE |
|---|---|---|
| 10-fold CV | 3 | 0.095 |
| LOOCV | 4 | 0.094 |
| AIC | 4 | 0.094 |
| BIC | 3 | 0.095 |
| 1-SE rule | 3 | 0.095 |

All methods select degree 3 or 4, which are very close in test MSE. The differences between methods are small relative to the variability of the test error estimate, confirming that all these approaches work well in practice.
</div>

## 7.8 Summary of Model Assessment Strategies

The following table summarizes the key properties of model assessment methods:

| Method | Type | Computational cost | Best suited for |
|---|---|---|---|
| LOOCV | Resampling | \(n\) model fits | Small datasets, linear models (shortcut) |
| \(K\)-fold CV | Resampling | \(K\) model fits | General purpose, moderate-large datasets |
| AIC | Analytic | 1 model fit per candidate | Large datasets, parametric models |
| BIC | Analytic | 1 model fit per candidate | Model identification, large \(n\) |
| Bootstrap (.632) | Resampling | \(B\) model fits | Small datasets, complex models |

The choice among these methods depends on the sample size, computational budget, and the goal of the analysis (prediction accuracy vs. model identification). In most practical settings, 10-fold cross-validation provides a reliable, general-purpose approach to model assessment.
