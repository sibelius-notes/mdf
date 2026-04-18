---
title: "STAT 946: Nonparametric Regression"
prof: "Pengfei Li"
subjects: "STAT"
---

## Sources and References

**Primary texts** — P. Groeneboom and G. Jongbloed, *Nonparametric Estimation under Shape Constraints* (Cambridge, 2015); M.P. Wand and M.C. Jones, *Kernel Smoothing* (Chapman & Hall, 1995); J. Fan and I. Gijbels, *Local Polynomial Modelling and its Applications* (Chapman & Hall, 1996).

**Supplementary texts** — P.J. Green and B.W. Silverman, *Nonparametric Regression and Generalized Linear Models* (1993); T.J. Hastie and R.J. Tibshirani, *Generalized Additive Models* (Chapman & Hall, 1990); L. Wasserman, *All of Nonparametric Statistics* (Springer, 2006); S. Wood, *Generalized Additive Models: An Introduction with R* (2nd ed., 2017).

**Online resources** — Tibshirani (Carnegie Mellon) nonparametric statistics lecture notes; Larry Wasserman's CMU 10-702/36-702 notes.

---

# Chapter 1: Introduction to Nonparametric Regression

## 1.1 The Nonparametric Regression Model

Classical regression analysis proceeds by postulating a parametric family for the relationship between a response variable and one or more predictors. The analyst chooses a functional form — linear, quadratic, logistic — and estimates a finite-dimensional parameter vector. This approach yields interpretable, efficient estimators when the assumed form is correct, but it suffers from a fundamental fragility: misspecification of the functional form leads to biased inference that no amount of additional data can correct.

Nonparametric regression relaxes the parametric assumption entirely. The basic model is

\[
Y_i = f(x_i) + \epsilon_i, \quad i = 1, \ldots, n,
\]

where \(x_1, \ldots, x_n\) are fixed design points (or realisations of a covariate), \(f : \mathcal{X} \subseteq \mathbb{R} \to \mathbb{R}\) is an unknown regression function belonging to some infinite-dimensional function class, and \(\epsilon_1, \ldots, \epsilon_n\) are independent errors with \(\mathbb{E}[\epsilon_i] = 0\) and \(\text{Var}(\epsilon_i) = \sigma^2 < \infty\). The goal is to estimate \(f\) from the observed pairs \((x_i, Y_i)\) without assuming a specific parametric form, imposing instead mild regularity conditions such as smoothness, monotonicity, or convexity.

<div class="remark">
<strong>Remark 1.1 (What "nonparametric" means).</strong> The term is slightly misleading: nonparametric methods are not parameter-free. Rather, the complexity of the model — measured by the effective number of degrees of freedom — grows with the sample size. The practitioner specifies a smoothness class (e.g., twice-differentiable functions, isotonic functions, or functions with square-integrable second derivative) rather than a finite-dimensional family.
</div>

## 1.2 Comparison with Parametric Regression

In parametric regression with \(f(x) = x^\top \beta\) for \(\beta \in \mathbb{R}^p\), the ordinary least squares estimator \(\hat\beta = (X^\top X)^{-1} X^\top Y\) achieves the parametric rate of convergence: the mean squared error of \(\hat{f}(x_0) = x_0^\top \hat\beta\) is \(O(n^{-1})\). When the model is correctly specified, this rate is optimal.

In nonparametric regression, the best achievable rate depends on the smoothness of \(f\). If \(f\) belongs to a Hölder class \(\mathcal{C}^s\) of functions with \(s\) bounded derivatives, then the minimax rate for estimating \(f\) at a point is \(O(n^{-2s/(2s+1)})\). For \(s = 2\) (twice-differentiable functions), this gives \(O(n^{-4/5})\), substantially slower than the parametric rate. The price of flexibility is a slower convergence rate, manifested in the celebrated **bias-variance tradeoff**.

## 1.3 The Bias-Variance Tradeoff

For any estimator \(\hat{f}(x_0)\) of \(f(x_0)\), the mean squared error decomposes as

\[
\text{MSE}(\hat{f}(x_0)) = \left[\text{Bias}(\hat{f}(x_0))\right]^2 + \text{Var}(\hat{f}(x_0)).
\]

In nonparametric estimation, tuning parameters (bandwidth \(h\), smoothing parameter \(\lambda\), number of knots \(K\)) control the smoothness of the estimator. Increasing smoothness (larger \(h\), larger \(\lambda\), fewer knots) reduces variance by averaging over more data, but increases bias by forcing the estimator to miss local structure in \(f\). Decreasing smoothness reduces bias but inflates variance. Optimal tuning balances these two terms, yielding rates of convergence that depend on the assumed regularity of \(f\).

## 1.4 Overview of Methods

This course surveys the major families of nonparametric regression estimators:

**Isotonic regression** (Chapter 2) imposes a monotonicity shape constraint on \(f\). The estimator is a projection onto the convex cone of nondecreasing functions, computed exactly via the pool-adjacent-violators algorithm. The method is distribution-free and achieves the rate \(n^{-1/3}\) at interior points where \(f\) has a nonzero derivative, irrespective of smoothness.

**Kernel methods** (Chapter 3) estimate \(f(x_0)\) by forming a weighted average of nearby observations, with weights determined by a kernel function \(K\) and bandwidth \(h\). Local polynomial regression, a refinement of the Nadaraya-Watson estimator, fits a polynomial locally using weighted least squares. The optimal bandwidth achieves MSE rate \(O(n^{-4/5})\) for twice-differentiable \(f\).

**Spline methods** (Chapter 4) estimate \(f\) as the solution to a penalised least squares problem, where the penalty on the roughness of \(f\) is measured by the integrated squared second derivative \(\int [f''(t)]^2 \, dt\). The solution is a natural cubic spline interpolating the data, and the smoothing parameter \(\lambda\) trades bias against variance.

**Generalized additive models** (Chapter 5) extend nonparametric regression to multivariate settings by modelling the conditional mean as a sum of univariate functions: \(\mathbb{E}[Y | X_1, \ldots, X_p] = \alpha + \sum_{j=1}^p f_j(X_j)\). The backfitting algorithm iteratively updates each component, reducing a \(p\)-dimensional estimation problem to a sequence of one-dimensional problems.

## 1.5 The Curse of Dimensionality

A fundamental obstacle in multivariate nonparametric regression is the **curse of dimensionality**: the sample size required to achieve a given accuracy grows exponentially with the number of predictors. If \(f : \mathbb{R}^d \to \mathbb{R}\) is \(s\) times differentiable, the minimax rate for estimation at a point is \(O(n^{-2s/(2s+d)})\). For fixed \(s\) this deteriorates rapidly as \(d\) increases, rendering fully nonparametric estimation infeasible in moderate-to-high dimensions. Additive models and single-index models impose structural constraints that circumvent this curse by reducing the effective dimension.

---

# Chapter 2: Isotonic Regression

## 2.1 The Monotone Regression Problem

Suppose we observe \(Y_i = f(x_i) + \epsilon_i\) for \(i = 1, \ldots, n\), where \(x_1 < x_2 < \cdots < x_n\) are ordered design points and the unknown regression function \(f\) is assumed to be **nondecreasing**: \(f(x_1) \leq f(x_2) \leq \cdots \leq f(x_n)\). Such a constraint arises naturally in dose-response studies, reliability analysis, and survival analysis.

<div class="definition">
<strong>Definition 2.1 (Isotonic function).</strong> A function \(g : \mathcal{X} \to \mathbb{R}\) is <em>isotonic</em> (nondecreasing) with respect to the natural order on \(\mathcal{X} \subseteq \mathbb{R}\) if \(x \leq x'\) implies \(g(x) \leq g(x')\). The set of all isotonic sequences in \(\mathbb{R}^n\) forms a closed convex cone

\[
\mathcal{C}_n = \left\{ \theta \in \mathbb{R}^n : \theta_1 \leq \theta_2 \leq \cdots \leq \theta_n \right\}.
\]
</div>

The **least squares isotonic estimator** (or isotonic regression) is the projection of \(Y = (Y_1, \ldots, Y_n)^\top\) onto \(\mathcal{C}_n\) with respect to the Euclidean metric (or, more generally, a weighted Euclidean metric):

\[
\hat\theta = \underset{\theta \in \mathcal{C}_n}{\arg\min} \sum_{i=1}^n w_i (Y_i - \theta_i)^2,
\]

where \(w_i > 0\) are known weights (often \(w_i = 1\)).

## 2.2 The Pool-Adjacent-Violators Algorithm

Since \(\mathcal{C}_n\) is a closed convex set in \(\mathbb{R}^n\), the projection \(\hat\theta\) exists and is unique. The **pool-adjacent-violators (PAV) algorithm** computes this projection exactly in \(O(n)\) time by exploiting the ordered structure of the constraint.

<div class="theorem">
<strong>Theorem 2.1 (PAV Algorithm and Correctness).</strong> The following algorithm computes the least squares isotonic regression \(\hat\theta\) exactly.

<strong>Algorithm (PAV):</strong>
<ol>
<li>Initialise each block as a singleton: \(B_i = \{i\}\) with level \(\ell_i = Y_i\), for \(i = 1, \ldots, n\).</li>
<li>Scan blocks left to right. If the current block \(B_j\) has level \(\ell_j\) greater than the level \(\ell_{j+1}\) of the next block \(B_{j+1}\), merge them into a single block with level equal to the weighted average of the \(Y_i\) values in the merged block. Repeat the merging step with the new block and its predecessor until no violation remains or the first block is reached.</li>
<li>Assign \(\hat\theta_i = \ell_{B(i)}\) where \(B(i)\) is the block containing index \(i\).</li>
</ol>

<em>The output satisfies \(\hat\theta \in \mathcal{C}_n\) and minimises \(\sum_{i=1}^n (Y_i - \theta_i)^2\) over all \(\theta \in \mathcal{C}_n\).</em>
</div>

<div class="proof">
<strong>Proof sketch.</strong> Because \(\mathcal{C}_n\) is a closed convex cone, the projection \(\hat\theta\) is characterised by the KKT conditions. Specifically, \(\hat\theta\) is the isotonic regression of \(Y\) if and only if:
<ol>
<li>\(\hat\theta \in \mathcal{C}_n\) (feasibility).</li>
<li>\(\sum_{i=1}^n (Y_i - \hat\theta_i)(\theta_i - \hat\theta_i) \leq 0\) for all \(\theta \in \mathcal{C}_n\) (optimality).</li>
</ol>

Equivalently, the Lagrangian conditions require that if \(\hat\theta_i < \hat\theta_{i+1}\) (the constraint \(\theta_i \leq \theta_{i+1}\) is not active), then the Lagrange multiplier for that constraint is zero; and if \(\hat\theta_i = \hat\theta_{i+1}\), the multiplier is nonnegative.

The PAV algorithm produces a piecewise-constant function on blocks of consecutive indices. Within each block \(B_k = \{i : a_k \leq i \leq b_k\}\), the value assigned is the block average

\[
\ell_k = \frac{\sum_{i \in B_k} Y_i}{|B_k|}.
\]

By construction, consecutive block averages are nondecreasing, so feasibility holds. For optimality, note that for any feasible \(\theta\):

\[
\sum_{i=1}^n (Y_i - \hat\theta_i)(\theta_i - \hat\theta_i) = \sum_k \sum_{i \in B_k} (Y_i - \ell_k)(\theta_i - \ell_k).
\]

Within each block \(B_k\), \(\sum_{i \in B_k}(Y_i - \ell_k) = 0\) by the definition of \(\ell_k\) as the block mean. Since \(\theta\) is feasible (nondecreasing) and the blocks are ordered, one can show that \(\sum_{i \in B_k}(\theta_i - \ell_k)\) has the correct sign for all \(k\), establishing optimality. The full argument uses induction on the number of blocks and the ordering property of block averages. \(\square\)
</div>

<div class="example">
<strong>Example 2.1 (PAV on five observations).</strong> Let \(Y = (3, 1, 4, 2, 5)\). The PAV algorithm proceeds as follows:

<em>Step 1:</em> Blocks: \([3], [1], [4], [2], [5]\).

<em>Step 2:</em> Compare blocks 1 and 2: \(3 > 1\), so merge into \([3,1]\) with average \(2\). Now blocks: \([2], [4], [2], [5]\).

<em>Step 3:</em> Compare merged block \([2]\) with previous? No predecessor. Scan forward. Compare \([2]\) and \([4]\): \(2 < 4\), no violation. Compare \([4]\) and \([2]\): \(4 > 2\), merge into \([4,2]\) with average \(3\). Now blocks: \([2], [3], [5]\).

<em>Step 4:</em> Compare new block \([3]\) and its predecessor \([2]\): \(2 < 3\), OK. Compare \([3]\) and \([5]\): \(3 < 5\), OK.

<em>Result:</em> \(\hat\theta = (2, 2, 3, 3, 5)\).

One can verify: \(\hat\theta\) is nondecreasing, and any perturbation that restores monotonicity increases \(\sum (Y_i - \theta_i)^2\).
</div>

## 2.3 KKT Conditions and the Min-Max Formula

The isotonic regression admits a clean characterisation via the min-max formula (also known as the greatest convex minorant characterisation).

<div class="theorem">
<strong>Theorem 2.2 (Min-Max Formula).</strong> For equally-weighted data, the isotonic regression \(\hat\theta_i\) satisfies

\[
\hat\theta_i = \min_{j \geq i} \max_{k \leq i} \frac{\sum_{\ell=k}^j Y_\ell}{j - k + 1}.
\]

Equivalently, define the cumulative sum process \(F_n(i) = \sum_{k=1}^i Y_k\) for \(i = 0, 1, \ldots, n\). Then \(\hat\theta_i\) equals the left derivative (slope) of the greatest convex minorant of the points \(\{(i, F_n(i)) : i = 0, 1, \ldots, n\}\) at the point \(i\).
</div>

This geometric characterisation is powerful: it connects isotonic regression to convex analysis and provides intuition for the Grenander estimator of a decreasing density.

## 2.4 Consistency and Rate of Convergence

<div class="theorem">
<strong>Theorem 2.3 (Pointwise consistency rate).</strong> Suppose \(f\) is nondecreasing and continuously differentiable near \(x_0\), with \(f'(x_0) > 0\). Assume the design points are equally spaced: \(x_i = i/n\). Then the isotonic regression estimator \(\hat\theta_{\lfloor nx_0 \rfloor}\) satisfies

\[
n^{1/3}\left(\hat\theta_{\lfloor nx_0 \rfloor} - f(x_0)\right) \xrightarrow{d} \left(\frac{\sigma^2 f'(x_0)}{4}\right)^{1/3} Z,
\]

where \(Z\) is the "Chernoff distribution" — the argmax of two-sided standard Brownian motion minus a parabola: \(Z = \arg\max_{t \in \mathbb{R}} \{W(t) - t^2\}\).
</div>

The rate \(n^{-1/3}\) is slower than the \(n^{-2/5}\) rate of smooth nonparametric estimators at twice-differentiable \(f\), but the isotonic estimator does not require any bandwidth or smoothing parameter selection, and it adapts automatically to flat regions of \(f\). Moreover, the rate is non-standard: the limiting distribution is not Gaussian, reflecting the qualitative difference between shape-constrained and kernel-smoothed estimation.

<div class="remark">
<strong>Remark 2.2 (Global risk).</strong> The \(L_2\) risk satisfies \(\mathbb{E}\|\hat\theta - f\|_n^2 = O(n^{-2/3})\), compared to \(O(n^{-4/5})\) for kernel estimators. Here \(\|g\|_n^2 = n^{-1}\sum g(x_i)^2\).
</div>

## 2.5 Generalised Isotonic Regression

The isotonic regression framework extends naturally to **generalised linear model settings** and to more general partial orders. The key structural observation is that \(\mathcal{C}_n\) is a convex cone, and projection onto a convex cone in a Hilbert space is a well-studied operation.

For a log-likelihood objective \(\ell(\theta) = \sum_{i=1}^n \ell_i(\theta_i)\) with concave \(\ell_i\), one can compute the isotonic MLE by replacing block averages with block pooled MLEs in the PAV algorithm, provided \(\ell_i(\theta_i)\) is strictly concave. The resulting estimator inherits the \(n^{-1/3}\) pointwise rate.

## 2.6 Application: Current Status Data

**Current status data** (also called interval-censored data of type I) arise when, for subject \(i\), we observe only a monitoring time \(C_i\) and an indicator \(\Delta_i = \mathbf{1}(T_i \leq C_i)\), where \(T_i\) is the survival time of interest. The probability

\[
F(c) = P(T \leq c) = \mathbb{E}[\Delta \mid C = c]
\]

is a nondecreasing function (a CDF). Estimation of \(F\) from current status data reduces directly to isotonic regression: we observe pairs \((C_i, \Delta_i)\) and seek the nondecreasing function \(\hat F\) minimising the least squares criterion (or, more appropriately, maximising the Bernoulli log-likelihood). The PAV algorithm applied to the ordered \((C_{(i)}, \Delta_{(i)})\) pairs yields the nonparametric MLE.

<div class="theorem">
<strong>Theorem 2.4 (Rate for NPMLE of current status data).</strong> Under regularity conditions (positive density of monitoring times, \(F\) strictly increasing near the truth), the NPMLE \(\hat F(t_0)\) satisfies

\[
n^{1/3}\left(\hat F(t_0) - F(t_0)\right) \xrightarrow{d} \left(\frac{F(t_0)(1-F(t_0))f_C(t_0)}{4 f(t_0)}\right)^{1/3} Z,
\]

where \(Z\) is the Chernoff random variable, \(f_C\) is the density of the monitoring time, and \(f\) is the density of \(T\).
</div>

## 2.7 The Two-Sample Isotonic Problem

In the two-sample problem, we observe paired data \((x_i, Y_i^{(1)}, Y_i^{(2)})\) and wish to test or estimate the difference \(f_1 - f_2\) under the constraint that this difference is nondecreasing (or nonpositive). This arises in clinical trials where treatment effect is believed to be monotone in a biomarker. The methodology combines isotonic regression with two-sample comparison techniques, and inference can be conducted via bootstrap or based on the Chernoff distribution.

---

# Chapter 3: Kernel Methods

## 3.1 Kernel Density Estimation

Before discussing kernel regression, it is instructive to review kernel density estimation, which shares the same fundamental ideas. Given i.i.d. observations \(X_1, \ldots, X_n\) from an unknown density \(f\), the **Rosenblatt-Parzen kernel density estimator** is

\[
\hat f_h(x) = \frac{1}{nh} \sum_{i=1}^n K\!\left(\frac{x - X_i}{h}\right),
\]

where \(K : \mathbb{R} \to [0, \infty)\) is a kernel function satisfying \(\int K(u)\,du = 1\), and \(h > 0\) is the **bandwidth**.

<div class="definition">
<strong>Definition 3.1 (Kernel function).</strong> A function \(K : \mathbb{R} \to \mathbb{R}\) is a <em>second-order kernel</em> if:
<ol>
<li>\(\int_{-\infty}^\infty K(u)\,du = 1\),</li>
<li>\(\int_{-\infty}^\infty u K(u)\,du = 0\) (symmetry),</li>
<li>\(\mu_2(K) := \int_{-\infty}^\infty u^2 K(u)\,du < \infty\),</li>
<li>\(R(K) := \int_{-\infty}^\infty K(u)^2\,du < \infty\).</li>
</ol>

Common kernels include the <em>Epanechnikov kernel</em> \(K(u) = \frac{3}{4}(1 - u^2)\mathbf{1}(|u| \leq 1)\) and the <em>Gaussian kernel</em> \(K(u) = (2\pi)^{-1/2}\exp(-u^2/2)\).
</div>

### 3.1.1 Bias-Variance Decomposition of KDE

A Taylor expansion of \(f\) yields the pointwise bias of the KDE:

\[
\text{Bias}(\hat f_h(x)) = \mathbb{E}[\hat f_h(x)] - f(x) = \frac{h^2}{2} \mu_2(K) f''(x) + o(h^2),
\]

and the variance is

\[
\text{Var}(\hat f_h(x)) = \frac{R(K)}{nh} f(x) + o\!\left(\frac{1}{nh}\right).
\]

Therefore the mean squared error at a point is

\[
\text{MSE}(\hat f_h(x)) = \frac{h^4}{4} \mu_2(K)^2 [f''(x)]^2 + \frac{R(K)}{nh} f(x) + o(h^4) + o\!\left(\frac{1}{nh}\right).
\]

Minimising over \(h\) gives the **pointwise optimal bandwidth**:

\[
h^*(x) = \left(\frac{R(K) f(x)}{\mu_2(K)^2 [f''(x)]^2 n}\right)^{1/5} = O(n^{-1/5}),
\]

yielding MSE\(_{\min} = O(n^{-4/5})\), which matches the minimax lower bound for the Hölder class \(\mathcal{C}^2\).

## 3.2 Bandwidth Selection

The pointwise optimal \(h^*(x)\) depends on the unknown \(f''(x)\), so it cannot be used directly. Practical methods include:

**MISE and the global bandwidth.** The **mean integrated squared error** is

\[
\text{MISE}(h) = \mathbb{E}\!\int [\hat f_h(x) - f(x)]^2 dx = \frac{h^4}{4}\mu_2(K)^2 \int [f''(x)]^2 dx + \frac{R(K)}{nh} + o(\cdots).
\]

Minimising the leading terms gives the **AMISE-optimal bandwidth**:

\[
h^*_{\text{AMISE}} = \left(\frac{R(K)}{\mu_2(K)^2 \|f''\|_2^2 \cdot n}\right)^{1/5}.
\]

**Plug-in rules.** Estimate \(\|f''\|_2^2\) from a pilot estimator (e.g., assuming \(f\) is Gaussian), then plug into the formula for \(h^*_{\text{AMISE}}\). The Silverman rule-of-thumb uses the normal reference: \(\hat h = 1.06 \hat\sigma n^{-1/5}\).

**Cross-validation.** The **leave-one-out cross-validation** score is

\[
\text{CV}(h) = \frac{1}{n} \sum_{i=1}^n \left(Y_i - \hat f_{h,-i}(X_i)\right)^2,
\]

where \(\hat f_{h,-i}\) is the estimator computed without the \(i\)th observation. For kernel density estimation, the corresponding LSCV criterion is

\[
\text{LSCV}(h) = \int \hat f_h(x)^2\,dx - \frac{2}{n}\sum_{i=1}^n \hat f_{h,-i}(X_i).
\]

This is an unbiased estimator of MISE up to a constant, and minimising \(\text{LSCV}(h)\) over a grid of \(h\) values gives a data-driven bandwidth choice.

## 3.3 Local Polynomial Regression

### 3.3.1 Motivation

The Nadaraya-Watson estimator, which locally fits a constant, is the simplest kernel regression estimator. However, it suffers from boundary bias and has suboptimal asymptotic bias structure. **Local polynomial regression** of degree \(p\) remedies this by fitting a \(p\)th-degree polynomial locally at each evaluation point.

<div class="definition">
<strong>Definition 3.2 (Local polynomial estimator).</strong> Fix an evaluation point \(x_0\) and bandwidth \(h\). The local polynomial estimator of degree \(p\) solves

\[
(\hat\beta_0, \ldots, \hat\beta_p) = \underset{\beta_0, \ldots, \beta_p}{\arg\min} \sum_{i=1}^n \left[Y_i - \sum_{j=0}^p \beta_j (x_i - x_0)^j\right]^2 K\!\left(\frac{x_i - x_0}{h}\right).
\]

The estimator of \(f(x_0)\) is \(\hat f(x_0) = \hat\beta_0\), and the estimator of the \(r\)th derivative \(f^{(r)}(x_0)\) is \(r!\,\hat\beta_r\).
</div>

### 3.3.2 Design Matrix Formulation

Define the design matrix

\[
\mathbf{X}_{x_0} = \begin{pmatrix} 1 & (x_1 - x_0) & (x_1-x_0)^2 & \cdots & (x_1-x_0)^p \\ \vdots & \vdots & \vdots & & \vdots \\ 1 & (x_n - x_0) & (x_n-x_0)^2 & \cdots & (x_n-x_0)^p \end{pmatrix},
\]

and the diagonal weight matrix \(\mathbf{W}_{x_0} = \text{diag}\!\left(K\!\left(\frac{x_1-x_0}{h}\right), \ldots, K\!\left(\frac{x_n-x_0}{h}\right)\right)\). The local polynomial estimator is the weighted least squares solution:

\[
\hat\beta = \left(\mathbf{X}_{x_0}^\top \mathbf{W}_{x_0} \mathbf{X}_{x_0}\right)^{-1} \mathbf{X}_{x_0}^\top \mathbf{W}_{x_0} Y.
\]

The estimator of \(f(x_0)\) is linear in \(Y\): \(\hat f(x_0) = \mathbf{e}_1^\top \hat\beta = \ell(x_0)^\top Y\) for a vector of equivalent kernel weights \(\ell(x_0)\).

### 3.3.3 Asymptotic Bias and Variance

<div class="theorem">
<strong>Theorem 3.1 (Asymptotic bias and variance of local polynomial estimator).</strong> Assume \(f\) is \((p+1)\) times continuously differentiable near \(x_0\), the kernel \(K\) is a symmetric second-order kernel with compact support, and \(nh \to \infty\), \(h \to 0\). For the local polynomial estimator of degree \(p\):

<ol>
<li><em>Bias:</em>

\[
\text{Bias}(\hat f(x_0)) = \frac{f^{(p+1)}(x_0)}{(p+1)!} \mu_{p+1}^* h^{p+1} + o(h^{p+1}),
\]

where \(\mu_{p+1}^*\) is an explicit constant depending on \(K\) and \(p\).</li>

<li><em>Variance:</em>

\[
\text{Var}(\hat f(x_0)) = \frac{\sigma^2 R_p(K)}{nh \cdot \pi(x_0)} + o\!\left(\frac{1}{nh}\right),
\]

where \(R_p(K)\) is a constant depending on \(K\) and \(p\), and \(\pi(x_0)\) is the marginal density of the design at \(x_0\).</li>
</ol>

In particular, the bias depends on the \((p+1)\)th derivative of \(f\), not the \(p\)th. This means increasing \(p\) by 1 (from even to odd) does not change the leading bias term but does change the constant.
</div>

### 3.3.4 Boundary Bias Advantage of Local Linear

A key practical advantage of local linear regression (degree \(p = 1\)) over the Nadaraya-Watson estimator (degree \(p = 0\)) is its behaviour at the boundary of the design. Near the boundary \(x_0 = 0\) or \(x_0 = 1\) (with support \([0,1]\)), the Nadaraya-Watson estimator has bias of order \(O(h)\) (rather than \(O(h^2)\) in the interior), due to the asymmetry of the kernel weights. Local linear regression maintains bias of order \(O(h^2)\) uniformly, even at the boundary, because the local linear fit automatically adjusts for the one-sided data.

More precisely, for the Nadaraya-Watson estimator at a boundary point \(x_0 = ch\):

\[
\text{Bias}(\hat f_{\text{NW}}(x_0)) = f'(x_0) \cdot \frac{\int_0^\infty u K(u)\,du}{\int_0^\infty K(u)\,du} \cdot h + o(h),
\]

which is \(O(h)\). For local linear regression at the same boundary point, the bias remains \(O(h^2)\).

## 3.4 Optimal Bandwidth for Local Polynomial Regression

From Theorem 3.1, the MSE-optimal bandwidth satisfies

\[
h^*(x_0) \propto \left(\frac{\sigma^2 R_p(K) / \pi(x_0)}{[f^{(p+1)}(x_0)]^2 / [(p+1)!]^2 \cdot n}\right)^{1/(2p+3)},
\]

yielding MSE \(= O(n^{-2(p+1)/(2p+3)})\). For \(p=1\) (local linear), this is \(O(n^{-4/5})\), matching the optimal rate for \(f \in \mathcal{C}^2\). Cross-validation or plug-in methods analogous to KDE bandwidth selection apply here.

## 3.5 Kernel Methods for Exponential Family Models

When the response is binary, count-valued, or otherwise non-Gaussian, the regression function \(f\) is connected to the mean through a link function. The **local quasi-likelihood** approach extends local polynomial regression to generalised linear models.

Suppose \(Y_i | x_i \sim\) some exponential family distribution with canonical parameter \(\eta(x_i)\) and \(\mathbb{E}[Y_i|x_i] = \mu(x_i) = b'(\eta(x_i))\). The log-likelihood contribution is \(\ell_i(\eta) = Y_i \eta - b(\eta)\). The local log-likelihood at \(x_0\) is

\[
\mathcal{L}_{x_0}(\beta) = \sum_{i=1}^n \left[Y_i \sum_{j=0}^p \beta_j (x_i - x_0)^j - b\!\left(\sum_{j=0}^p \beta_j (x_i - x_0)^j\right)\right] K\!\left(\frac{x_i - x_0}{h}\right).
\]

Maximising this over \(\beta\) yields the **local MLE**, computed iteratively via Newton-Raphson or **iteratively reweighted least squares (IRLS)**:

\[
\hat\beta^{(t+1)} = \hat\beta^{(t)} + \left[\sum_i K_{x_0,i} \ddot\ell_i(\hat\eta_i^{(t)}) \mathbf{x}_i \mathbf{x}_i^\top\right]^{-1} \sum_i K_{x_0,i} \dot\ell_i(\hat\eta_i^{(t)}) \mathbf{x}_i,
\]

where \(\mathbf{x}_i = (1, x_i - x_0, \ldots, (x_i - x_0)^p)^\top\). The asymptotic theory parallels the Gaussian case, with \(\sigma^2\) replaced by the inverse Fisher information \([b''(\eta(x_0))]^{-1}\).

---

# Chapter 4: Spline Methods

## 4.1 Regression Splines

A **regression spline** approximates \(f\) by a piecewise polynomial with a fixed set of knots \(\xi_1 < \xi_2 < \cdots < \xi_K\).

<div class="definition">
<strong>Definition 4.1 (Regression spline).</strong> A function \(g\) is a <em>polynomial spline of degree \(m\) with knots \(\xi_1 < \cdots < \xi_K\)</em> if:
<ol>
<li>On each interval \((-\infty, \xi_1), [\xi_1, \xi_2), \ldots, [\xi_K, \infty)\), \(g\) is a polynomial of degree at most \(m\).</li>
<li>\(g\) has \((m-1)\) continuous derivatives at each knot.</li>
</ol>
The space of such splines has dimension \(m + 1 + K\).
</div>

A convenient basis for the space of regression splines of degree \(m\) with knots \(\xi_1, \ldots, \xi_K\) consists of:
- Monomials: \(1, x, x^2, \ldots, x^m\),
- Truncated power functions: \((x - \xi_k)_+^m\) for \(k = 1, \ldots, K\).

The regression spline estimator regresses \(Y\) on these \(m + 1 + K\) basis functions by ordinary least squares.

### 4.1.1 B-Spline Basis

Numerically, the truncated power basis is ill-conditioned for large \(K\) or \(m\). The **B-spline basis** provides a numerically stable, locally supported alternative. B-splines of degree \(m\) are defined recursively via the de Boor recurrence:

\[
B_{j,m}(x) = \frac{x - t_j}{t_{j+m} - t_j} B_{j,m-1}(x) + \frac{t_{j+m+1} - x}{t_{j+m+1} - t_{j+1}} B_{j+1,m-1}(x),
\]

with \(B_{j,0}(x) = \mathbf{1}(t_j \leq x < t_{j+1})\), where \(t_0 \leq t_1 \leq \cdots\) is an augmented knot sequence. Each \(B_{j,m}\) is nonnegative, supported on \([t_j, t_{j+m+1}]\), and the B-splines sum to one.

## 4.2 Natural Cubic Splines

<div class="definition">
<strong>Definition 4.2 (Natural cubic spline).</strong> A <em>natural cubic spline</em> with knots at \(x_1 < \cdots < x_n\) is a cubic spline \(g\) (piecewise cubic with two continuous derivatives at each knot) that additionally satisfies the <em>natural boundary conditions</em>:

\[
g''(x_1) = g''(x_n) = 0.
\]

These conditions force \(g\) to be linear beyond the outermost knots, eliminating erratic boundary behaviour.
</div>

The space of natural cubic splines with knots at \(x_1, \ldots, x_n\) has dimension \(n\). An explicit basis (the natural spline basis) can be constructed from the B-spline basis by enforcing the boundary conditions. Natural cubic splines arise as the solution to Reinsch's variational problem, as shown in the next section.

## 4.3 Smoothing Splines

### 4.3.1 Reinsch's Variational Problem

The **smoothing spline** estimator balances goodness of fit against roughness via the penalised criterion

\[
\hat f_\lambda = \underset{f \in W^{2,2}[a,b]}{\arg\min} \left[\sum_{i=1}^n (Y_i - f(x_i))^2 + \lambda \int_a^b [f''(t)]^2 \, dt\right],
\]

where \(W^{2,2}[a,b] = \{f : f, f', f'' \in L^2[a,b]\}\) is the Sobolev space of twice weakly differentiable functions, and \(\lambda > 0\) is the **smoothing parameter**. Large \(\lambda\) penalises curvature heavily, forcing \(\hat f_\lambda\) toward a linear function; small \(\lambda\) allows \(\hat f_\lambda\) to interpolate the data.

<div class="theorem">
<strong>Theorem 4.1 (Smoothing spline is a natural cubic spline).</strong> The solution \(\hat f_\lambda\) to Reinsch's variational problem exists, is unique, and is a <em>natural cubic spline</em> with knots at the data points \(x_1, \ldots, x_n\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(\mathbf{f} = (f(x_1), \ldots, f(x_n))^\top\) denote the values of a candidate function at the design points. Any function \(f \in W^{2,2}\) can be decomposed as \(f = g + r\), where \(g\) is the natural cubic spline interpolant of \(\mathbf{f}\) (i.e., the unique natural cubic spline passing through all \((x_i, f(x_i))\)) and \(r = f - g\) satisfies \(r(x_i) = 0\) for all \(i\).

The key identity is:

\[
\int [f''(t)]^2\,dt = \int [g''(t)]^2\,dt + 2\int g''(t)r''(t)\,dt + \int [r''(t)]^2\,dt.
\]

Integrating by parts (twice), the cross term becomes:

\[
2\int g''(t) r''(t)\,dt = 2\left[g''(t) r'(t)\right]_a^b - 2\int g'''(t) r'(t)\,dt.
\]

The boundary term vanishes because \(g''(a) = g''(b) = 0\) (natural boundary conditions). Continuing:

\[
-2\int g'''(t) r'(t)\,dt = -2\left[g'''(t) r(t)\right]_a^b + 2\int g^{(4)}(t) r(t)\,dt.
\]

Since \(g\) is a cubic spline, \(g^{(4)} = 0\) on each interval, and \(g'''\) is piecewise constant with jumps only at knots \(x_i\) where \(r(x_i) = 0\). Thus the entire cross term vanishes.

Therefore \(\int [f'']^2 = \int [g'']^2 + \int [r'']^2 \geq \int [g'']^2\), with equality iff \(r'' \equiv 0\), i.e., \(r\) is linear. Since \(r(x_i) = 0\) for all \(i\) and \(n \geq 2\), \(r \equiv 0\).

This shows that for any \(f\) matching \(\mathbf{f}\) at the data points, its integrated squared second derivative is at least as large as that of the natural cubic spline interpolant \(g\). Consequently, the minimiser of Reinsch's criterion must be the natural cubic spline interpolant of the optimal \(\mathbf{f}\).

The criterion over natural cubic splines reduces to minimising over the finite-dimensional vector \(\mathbf{f} \in \mathbb{R}^n\):

\[
\|\mathbf{Y} - \mathbf{f}\|^2 + \lambda \mathbf{f}^\top \Omega \mathbf{f},
\]

where \(\Omega_{jk} = \int N_j''(t) N_k''(t)\,dt\) and \(N_1, \ldots, N_n\) is the natural spline basis. This is a finite-dimensional penalised least squares problem with unique solution \(\hat{\mathbf{f}} = (\mathbf{I} + \lambda \Omega)^{-1} \mathbf{Y}\). \(\square\)
</div>

### 4.3.2 The Hat Matrix and Effective Degrees of Freedom

Since \(\hat{\mathbf{f}} = \mathbf{H}_\lambda \mathbf{Y}\) where \(\mathbf{H}_\lambda = (\mathbf{I} + \lambda \Omega)^{-1}\), the smoothing spline is a linear smoother with **hat matrix** \(\mathbf{H}_\lambda\). Several important properties:

- \(\mathbf{H}_\lambda\) is symmetric and positive semidefinite.
- The eigenvalues of \(\mathbf{H}_\lambda\) lie in \([0, 1]\).
- As \(\lambda \to 0\), \(\mathbf{H}_\lambda \to \mathbf{I}\) (interpolation).
- As \(\lambda \to \infty\), \(\mathbf{H}_\lambda \to \mathbf{H}_{\text{lin}}\) (projection onto linear functions).

The **effective degrees of freedom** of the smoothing spline is defined by analogy with linear regression:

\[
\text{df}(\lambda) = \text{tr}(\mathbf{H}_\lambda) = \sum_{j=1}^n \frac{1}{1 + \lambda \gamma_j},
\]

where \(\gamma_1, \ldots, \gamma_n\) are the eigenvalues of \(\Omega\). This decreases from \(n\) (as \(\lambda \to 0\)) to \(2\) (as \(\lambda \to \infty\), corresponding to the 2 degrees of freedom of a linear fit). The practitioner may specify \(\text{df}(\lambda)\) directly, determining \(\lambda\) implicitly.

### 4.3.3 Smoothing Parameter Selection: GCV

The **generalised cross-validation (GCV)** criterion avoids the \(O(n)\) leave-one-out computations by using the diagonal of \(\mathbf{H}_\lambda\):

\[
\text{GCV}(\lambda) = \frac{n \|\mathbf{Y} - \mathbf{H}_\lambda \mathbf{Y}\|^2}{[n - \text{tr}(\mathbf{H}_\lambda)]^2} = \frac{n \sum_{i=1}^n (Y_i - \hat f_\lambda(x_i))^2}{[n - \text{df}(\lambda)]^2}.
\]

<div class="theorem">
<strong>Theorem 4.2 (GCV as approximate CV).</strong> The GCV criterion equals

\[
\text{GCV}(\lambda) = \frac{1}{n} \sum_{i=1}^n \left(\frac{Y_i - \hat f_\lambda(x_i)}{1 - [\mathbf{H}_\lambda]_{ii}}\right)^2 \cdot \frac{1}{n}\sum_i [\mathbf{H}_\lambda]_{ii} \approx \text{LOOCV}(\lambda),
\]

where the approximation replaces each diagonal entry \([\mathbf{H}_\lambda]_{ii}\) by its average \(\text{tr}(\mathbf{H}_\lambda)/n\). The minimiser \(\hat\lambda_{\text{GCV}}\) is a consistent selector of the optimal \(\lambda\).
</div>

<div class="example">
<strong>Example 4.1 (Smoothing spline in practice).</strong> Consider the motorcycle dataset (\(n = 133\) observations of head acceleration vs. time after a simulated crash). Fitting a smoothing spline via GCV yields \(\hat\lambda_{\text{GCV}} \approx 0.0012\) and \(\text{df}(\hat\lambda) \approx 12\). The resulting fit captures the nonlinear, heteroscedastic structure of the data — a rapid initial drop, complex oscillatory recovery — that a linear or quadratic fit would miss. The effective degrees of freedom of 12 reflects a moderately flexible fit, much fewer than the 133 available.
</div>

### 4.3.4 Bayesian Interpretation of Smoothing Splines

The smoothing spline admits a Bayesian interpretation that motivates GCV and provides a framework for uncertainty quantification. Place the prior

\[
f \sim \text{GP}\!\left(0, \frac{\sigma^2}{\lambda} C\right),
\]

where the covariance kernel \(C\) is chosen so that \(\mathbb{E}\!\left[\int [f''(t)]^2\,dt\right] = \text{tr}(\Omega C)\). Then, given data \(Y = f + \epsilon\) with \(\epsilon \sim N(0, \sigma^2 \mathbf{I})\), the posterior mean is exactly \(\hat f_\lambda = \mathbf{H}_\lambda Y\). The posterior covariance is \(\sigma^2 \mathbf{H}_\lambda\), giving pointwise credible bands \(\hat f_\lambda(x) \pm z_{\alpha/2} \sigma \sqrt{[\mathbf{H}_\lambda]_{x,x}}\). When \(\sigma^2\) is estimated, these Bayesian confidence bands have good frequentist coverage.

## 4.4 Smoothing Splines for Exponential Family Models

For non-Gaussian responses (binary, count, etc.), the smoothing spline idea extends to penalised likelihood:

\[
\hat f_\lambda = \underset{f}{\arg\max} \left[\sum_{i=1}^n \ell(Y_i; f(x_i)) - \frac{\lambda}{2} \int [f''(t)]^2\,dt\right],
\]

where \(\ell(y; \eta)\) is the log-likelihood for the exponential family. The solution is still a natural cubic spline at the data points, and the optimisation proceeds via a Newton algorithm that reduces to **iteratively reweighted smoothing splines**: at each iteration, form a working response \(Z_i = \hat\eta_i + (Y_i - \hat\mu_i)/\hat\mu_i'(\hat\eta_i)\) and working weight \(w_i = b''(\hat\eta_i)\), then solve the weighted smoothing spline problem:

\[
\underset{f}{\arg\min} \sum_{i=1}^n w_i (Z_i - f(x_i))^2 + \lambda \int [f''(t)]^2\,dt.
\]

This is the **penalised IRLS algorithm**, and convergence is guaranteed for canonical link functions.

## 4.5 Additive Isotonic Regression

**Additive isotonic regression** combines the shape constraints of isotonic regression with the additive structure of Chapter 5. The model is

\[
\mathbb{E}[Y_i] = \mu + \sum_{j=1}^p f_j(x_{ij}),
\]

where each component function \(f_j\) is constrained to be nondecreasing. Estimation proceeds via a component-wise backfitting algorithm (Section 5.2) in which each step updates one component by applying the PAV algorithm to the partial residuals. This approach requires no smoothing parameter selection and adapts to the shape of each component.

---

# Chapter 5: Generalized Additive Models

## 5.1 The Additive Model

The curse of dimensionality makes fully nonparametric regression infeasible when \(p\) is moderate. **Generalized additive models (GAMs)** impose the additive structure

\[
\mathbb{E}[Y | X_1, \ldots, X_p] = \alpha + \sum_{j=1}^p f_j(X_j),
\]

where each \(f_j : \mathbb{R} \to \mathbb{R}\) is an unknown smooth function. For non-Gaussian responses, a link function \(g\) relates the additive predictor to the mean:

\[
g\!\left(\mathbb{E}[Y | X_1, \ldots, X_p]\right) = \alpha + \sum_{j=1}^p f_j(X_j).
\]

This model achieves the best univariate nonparametric rate \(O(n^{-4/5})\) for each component, regardless of \(p\), provided the additive structure holds.

### 5.1.1 Identifiability

The additive decomposition \(\alpha + \sum_j f_j(X_j)\) is not identifiable without constraints, since adding a constant to one \(f_j\) and subtracting it from \(\alpha\) leaves the model unchanged.

<div class="definition">
<strong>Definition 5.1 (Identifiability constraint).</strong> The standard identifiability constraint for GAMs is

\[
\mathbb{E}[f_j(X_j)] = 0 \quad \text{for each } j = 1, \ldots, p,
\]

equivalently, in the sample version, \(\sum_{i=1}^n f_j(x_{ij}) = 0\) for each \(j\). Under this constraint, \(\alpha = \mathbb{E}[Y]\) (or \(\bar Y\) in the sample), and the components \(f_1, \ldots, f_p\) are uniquely determined (given the function class and identifiability constraints).
</div>

## 5.2 The Backfitting Algorithm

The **backfitting algorithm** of Hastie and Tibshirani (1990) estimates the components \(f_1, \ldots, f_p\) iteratively by cyclic coordinate descent in function space. The key observation is that, holding all other components fixed,

\[
Y_i - \alpha - \sum_{k \neq j} f_k(x_{ik}) = f_j(x_{ij}) + \epsilon_i,
\]

which is a univariate nonparametric regression of the **partial residuals** on \(X_j\). Thus each update reduces to a one-dimensional smoothing problem.

### 5.2.1 Algorithm Statement

<div class="definition">
<strong>Algorithm 5.1 (Backfitting).</strong>

<ol>
<li><em>Initialise:</em> Set \(\hat\alpha = \bar Y\), \(\hat f_j \equiv 0\) for all \(j\).</li>
<li><em>Cycle:</em> For \(j = 1, \ldots, p\) (and repeat until convergence):
  <ul>
    <li>Form partial residuals: \(R_{ij} = Y_i - \hat\alpha - \sum_{k \neq j} \hat f_k(x_{ik})\).</li>
    <li>Update: \(\hat f_j \leftarrow S_j(\mathbf{R}_j)\), where \(S_j\) is a univariate smoother for predictor \(X_j\).</li>
    <li>Centre: \(\hat f_j \leftarrow \hat f_j - n^{-1}\sum_i \hat f_j(x_{ij})\) (enforce identifiability).</li>
  </ul>
</li>
<li><em>Terminate</em> when \(\sum_j \|\hat f_j^{(\text{new})} - \hat f_j^{(\text{old})}\|_n^2 < \delta\) for a tolerance \(\delta\).</li>
</ol>
</div>

### 5.2.2 Derivation as Block Gauss-Seidel

The backfitting algorithm is precisely the **block Gauss-Seidel** method applied to the normal equations of the additive model. To see this, write the fitted values as \(\hat{\mathbf{f}} = \hat\alpha \mathbf{1} + \sum_j \hat{\mathbf{f}}_j\), where \(\hat{\mathbf{f}}_j = (\hat f_j(x_{1j}), \ldots, \hat f_j(x_{nj}))^\top\). The smoother matrices \(\mathbf{S}_j\) satisfy \(\hat{\mathbf{f}}_j = \mathbf{S}_j \mathbf{R}_j\). The optimality conditions for minimising

\[
\|\mathbf{Y} - \hat\alpha \mathbf{1} - \sum_k \hat{\mathbf{f}}_k\|^2
\]

subject to \(\hat{\mathbf{f}}_j = \mathbf{S}_j \hat{\mathbf{f}}_j\) (each component lies in the column space of \(\mathbf{S}_j\)) are:

\[
\hat{\mathbf{f}}_j = \mathbf{S}_j\!\left(\mathbf{Y} - \hat\alpha \mathbf{1} - \sum_{k \neq j} \hat{\mathbf{f}}_k\right), \quad j = 1, \ldots, p.
\]

Solving these simultaneously is a block linear system; backfitting solves it by sequential updates — exactly Gauss-Seidel. The system matrix is

\[
\begin{pmatrix} \mathbf{I} & \mathbf{S}_1 & \cdots & \mathbf{S}_1 \\ \mathbf{S}_2 & \mathbf{I} & \cdots & \mathbf{S}_2 \\ \vdots & & \ddots & \vdots \\ \mathbf{S}_p & \cdots & \mathbf{S}_p & \mathbf{I} \end{pmatrix} \begin{pmatrix} \hat{\mathbf{f}}_1 \\ \hat{\mathbf{f}}_2 \\ \vdots \\ \hat{\mathbf{f}}_p \end{pmatrix} = \begin{pmatrix} \mathbf{S}_1 \mathbf{Y} \\ \mathbf{S}_2 \mathbf{Y} \\ \vdots \\ \mathbf{S}_p \mathbf{Y} \end{pmatrix}.
\]

## 5.3 Convergence of Backfitting

<div class="theorem">
<strong>Theorem 5.1 (Convergence of backfitting, Buja et al. 1989).</strong> Suppose each smoother matrix \(\mathbf{S}_j\) is symmetric and idempotent (\(\mathbf{S}_j^2 = \mathbf{S}_j\)). Then the backfitting algorithm converges to a unique solution, which is the orthogonal projection of \(\mathbf{Y}\) onto the sum of column spaces \(\text{col}(\mathbf{S}_1) + \cdots + \text{col}(\mathbf{S}_p)\).
</div>

<div class="remark">
<strong>Remark 5.1 (Non-idempotent smoothers).</strong> In practice, smoothers such as smoothing splines and kernel smoothers are <em>not</em> idempotent. Convergence of backfitting still holds under the condition that the spectral radius of the iteration matrix is less than 1, which holds when the predictors \(X_1, \ldots, X_p\) are sufficiently "uncorrelated" in a functional sense. For highly correlated predictors, backfitting may converge slowly or produce non-unique solutions.
</div>

## 5.4 Spline-Based Estimation in GAMs: P-Splines

**P-splines** (penalised B-splines, Eilers and Marx 1996) provide a computationally attractive alternative to smoothing splines for GAMs. The idea is to approximate each \(f_j\) by a B-spline with a moderate number of knots (e.g., \(K = 20\)) and penalise the differences between adjacent B-spline coefficients:

\[
\hat{\boldsymbol\beta}_j = \underset{\boldsymbol\beta_j}{\arg\min} \sum_{i=1}^n \left(Y_i - \sum_k \beta_{jk} B_{jk}(x_{ij})\right)^2 + \lambda_j \boldsymbol\beta_j^\top \mathbf{D}^\top \mathbf{D} \boldsymbol\beta_j,
\]

where \(\mathbf{D}\) is the matrix of second differences: \((\mathbf{D}\boldsymbol\beta)_k = \beta_{k+2} - 2\beta_{k+1} + \beta_k\). The penalty \(\boldsymbol\beta^\top \mathbf{D}^\top \mathbf{D} \boldsymbol\beta\) approximates \(\int [f_j''(t)]^2\,dt\) when enough knots are used, but is parameterised in terms of the coefficient vector rather than the function value vector.

Advantages of P-splines include:
- **Computational efficiency**: the design matrix \(\mathbf{B}_j\) is banded (B-splines have local support), enabling fast matrix operations.
- **Equivalence to smoothing splines**: as \(K \to \infty\) with appropriate knot placement, the P-spline estimator converges to the smoothing spline estimator.
- **Easy multivariate extension**: tensor product P-splines handle smooth interaction effects \(f(X_j, X_k)\) by forming tensor products of univariate B-spline bases.

The `mgcv` package in R (Wood 2006) implements GAMs using P-splines with GCV or restricted maximum likelihood (REML) for automatic smoothing parameter selection.

## 5.5 GAMs for Exponential Family Responses

For a response \(Y\) from an exponential family, the **generalised additive model** replaces the Gaussian likelihood with a penalised log-likelihood:

\[
\hat f_1, \ldots, \hat f_p = \underset{f_1, \ldots, f_p}{\arg\max} \left[\sum_{i=1}^n \ell\!\left(Y_i; \alpha + \sum_j f_j(x_{ij})\right) - \sum_j \frac{\lambda_j}{2} \int [f_j''(t)]^2\,dt\right].
\]

The penalised IRLS algorithm (PIRLS) extends IRLS to the additive model:

**Algorithm (PIRLS for GAMs):**
1. Initialise \(\hat\eta_i = g(\bar Y)\), \(\hat\alpha = g(\bar Y)\), \(\hat f_j \equiv 0\).
2. Iterate until convergence:
   - Compute working response \(Z_i = \hat\eta_i + (Y_i - \hat\mu_i)/g'(\hat\mu_i)\) and weights \(w_i = [g'(\hat\mu_i)]^{-2} b''(\hat\eta_i)^{-1}\).
   - Apply backfitting with weighted smoothing splines to the working responses \(Z_i\) with weights \(w_i\).
   - Update \(\hat\eta_i = \hat\alpha + \sum_j \hat f_j(x_{ij})\), \(\hat\mu_i = g^{-1}(\hat\eta_i)\).

This is the **local scoring algorithm** of Hastie and Tibshirani (1990). Convergence follows from the concavity of the log-likelihood and the properties of IRLS.

### 5.5.1 Smoothing Parameter Selection in GAMs

For GAMs, each component \(f_j\) has its own smoothing parameter \(\lambda_j\). Selection of all \(\lambda_j\) simultaneously by GCV requires evaluating the effective degrees of freedom of the entire additive fit. The **REML** approach (Wood 2011) treats the random effects representation of smoothing splines to form a marginal likelihood for the \(\lambda_j\), which is more stable and less prone to overfitting than GCV, especially in small samples.

<div class="example">
<strong>Example 5.1 (GAM for logistic regression).</strong> In a case-control study of disease status \(Y \in \{0,1\}\), with covariates age (\(X_1\)) and BMI (\(X_2\)), a GAM with logistic link models

\[
\log\frac{P(Y=1|X_1,X_2)}{P(Y=0|X_1,X_2)} = \alpha + f_1(X_1) + f_2(X_2).
\]

The model allows for a nonlinear, potentially non-monotone relationship between each covariate and log-odds of disease, while maintaining interpretability through the additive structure. The PIRLS algorithm converges in 5–10 iterations. The estimated \(\hat f_1\) might show a J-shaped relationship with age, while \(\hat f_2\) shows a monotone increasing relationship with BMI.

Testing whether \(f_j\) is linear (i.e., whether a parametric component suffices) can be done using the approximate chi-squared test based on the change in deviance, with degrees of freedom approximated by \(\text{df}(\hat\lambda_j) - 1\).
</div>

## 5.6 Practical Considerations and the `mgcv` Package

The `mgcv` package in R (Wood 2006, 2017) implements the full GAM framework discussed in this chapter. Key features include:

- Automatic smoothing parameter selection via GCV or REML.
- Tensor product smooths for interaction effects.
- A variety of smooth classes: thin plate splines, P-splines, Duchon splines, cyclic splines.
- Approximate inference based on the Bayesian posterior covariance of the spline coefficients.
- Concurvity diagnostics (the additive model analogue of multicollinearity).

The user specifies a GAM in R as:
```
library(mgcv)
fit <- gam(y ~ s(x1) + s(x2), family = binomial(), data = df, method = "REML")
```

The `s()` wrapper specifies a smooth term, with the degree of smoothing selected automatically. The `method = "REML"` argument requests REML-based smoothing parameter selection.

---

# Appendix: Mathematical Foundations

## A.1 Convex Cones and Projections

<div class="definition">
<strong>Definition A.1 (Convex cone).</strong> A set \(\mathcal{C} \subseteq \mathbb{R}^n\) is a <em>convex cone</em> if:
<ol>
<li>For all \(x, y \in \mathcal{C}\) and \(\alpha, \beta \geq 0\): \(\alpha x + \beta y \in \mathcal{C}\).</li>
</ol>

The set \(\mathcal{C}_n = \{\theta \in \mathbb{R}^n : \theta_1 \leq \cdots \leq \theta_n\}\) of nondecreasing sequences is a closed convex cone.
</div>

<div class="theorem">
<strong>Theorem A.1 (Projection theorem).</strong> For any closed convex set \(\mathcal{C} \subseteq \mathbb{R}^n\) and any \(y \in \mathbb{R}^n\), there exists a unique \(\hat\theta = \Pi_\mathcal{C}(y) \in \mathcal{C}\) minimising \(\|y - \theta\|^2\) over \(\theta \in \mathcal{C}\), characterised by the variational inequality

\[
\langle y - \hat\theta, \theta - \hat\theta \rangle \leq 0 \quad \text{for all } \theta \in \mathcal{C}.
\]
</div>

## A.2 Sobolev Spaces

The smoothing spline lives in the Sobolev space \(W^{2,2}[a,b]\), the space of functions \(f\) on \([a,b]\) such that \(f\), \(f'\), and \(f''\) are all square-integrable. This is a Hilbert space with inner product

\[
\langle f, g \rangle_{W^{2,2}} = \int_a^b f(t)g(t)\,dt + \int_a^b f''(t)g''(t)\,dt.
\]

The reproducing kernel Hilbert space (RKHS) associated with the roughness penalty \(\int [f'']^2\,dt\) characterises the smoothing spline solution and its convergence properties.

## A.3 Summary of Convergence Rates

The following table summarises the pointwise MSE rates achieved by the estimators studied in this course.

| Method | Regularity | Optimal bandwidth/parameter | MSE rate |
|--------|------------|----------------------------|----------|
| Isotonic regression | \(f\) nondecreasing, \(f'(x_0) > 0\) | — (no tuning) | \(n^{-2/3}\) |
| KDE | \(f \in \mathcal{C}^2\) | \(h \asymp n^{-1/5}\) | \(n^{-4/5}\) |
| Local linear | \(f \in \mathcal{C}^2\) | \(h \asymp n^{-1/5}\) | \(n^{-4/5}\) |
| Local polynomial, deg \(p\) | \(f \in \mathcal{C}^{p+1}\) | \(h \asymp n^{-1/(2p+3)}\) | \(n^{-2(p+1)/(2p+3)}\) |
| Smoothing spline | \(f \in W^{2,2}\) | \(\lambda \asymp n^{-4/5}\) | \(n^{-4/5}\) |
| GAM (additive, \(p\) predictors) | Each \(f_j \in \mathcal{C}^2\) | per-component \(h_j\) | \(n^{-4/5}\) |

The striking fact that GAMs achieve the same rate as univariate nonparametric regression, regardless of \(p\), reflects the dimension-reduction property of the additive structure — provided the true model is indeed additive.
