---
title: "STAT 946: Topics in Probability and Statistics"
prof: "Peijun Sang; Martin Lysy"
subjects: "STAT"
---

## Sources and References

**Part I (Functional Data Analysis)** — J.O. Ramsay and B.W. Silverman, *Functional Data Analysis* (2nd ed., Springer, 2005); Piotr Kokoszka and Matthew Reimherr, *Introduction to Functional Data Analysis* (Chapman and Hall/CRC, 2017); Tailen Hsing and Randall Eubank, *Theoretical Foundations of Functional Data Analysis* (Wiley, 2015).

**Part II (Bayesian Computing)** — Andrew Gelman et al., *Bayesian Data Analysis* (3rd ed., CRC Press); Jun Liu, *Monte Carlo Strategies in Scientific Computing* (Springer, 2001).

**Online resources** — Ramsay and Silverman `fda` R package documentation; Michael Betancourt's HMC conceptual introduction; David Blei's variational inference tutorial.

---

# Part I: Functional Data Analysis (Fall 2025, Peijun Sang)

# Chapter 1: Introduction to Functional Data Analysis

## 1.1 What Is Functional Data?

Classical multivariate statistics treats observations as vectors in \(\mathbb{R}^p\). Functional data analysis (FDA) takes a different perspective: each observation is a **function** — a curve, surface, or other object that varies over a continuum. The continuum is typically time or space, but it can be any ordered domain such as wavelength, age, or spatial coordinate.

<div class="definition">
<strong>Functional Data Object.</strong> Let \(\mathcal{T} \subset \mathbb{R}\) be a compact interval. A <em>functional data object</em> is a random element \(X\) taking values in a function space \(\mathcal{H}\) over \(\mathcal{T}\), typically a Hilbert space such as \(L^2(\mathcal{T})\). A sample of functional data consists of \(n\) independent realizations \(X_1, \ldots, X_n\), each a function on \(\mathcal{T}\).
</div>

In practice, functions are observed discretely: for each subject \(i\), one records measurements \(y_{ij} = X_i(t_{ij}) + \varepsilon_{ij}\) at a finite set of time points \(\{t_{ij}\}\). A central task of FDA is to recover the underlying functions from these noisy, discrete measurements.

FDA subsumes several related areas. Longitudinal data analysis studies repeated measurements on individuals, but the number of time points per subject is typically small and the focus is on population-level parameters. FDA treats curves as the primary objects of inference and routinely works with dozens to thousands of observation points per curve.

## 1.2 Basis Expansions for Functional Objects

The most practical approach to representing functional data is to expand each function in a finite-dimensional basis. Let \(\{\phi_k\}_{k=1}^K\) be a basis for a subspace of \(L^2(\mathcal{T})\). One approximates

\[
X_i(t) \approx \sum_{k=1}^{K} c_{ik}\,\phi_k(t).
\]

The vector \(\mathbf{c}_i = (c_{i1}, \ldots, c_{iK})^\top\) reduces the infinite-dimensional problem to a finite-dimensional one. Three basis systems dominate applications.

**Fourier basis.** For periodic functions on \([0,T]\), the Fourier basis is \(\{1, \sin(2\pi t/T), \cos(2\pi t/T), \sin(4\pi t/T), \cos(4\pi t/T), \ldots\}\). Fourier coefficients decay at a rate governed by the smoothness of \(X\): a function with \(m\) square-integrable derivatives has Fourier coefficients that satisfy \(|c_k| = O(k^{-m})\). The Fourier basis is ideal for signals without sharp local features.

**B-spline basis.** For non-periodic data, B-splines of order \(m\) with knot sequence \(\xi_0 < \xi_1 < \cdots < \xi_{K+m}\) form a basis for piecewise polynomial functions of degree \(m-1\) with \(m-2\) continuous derivatives at the interior knots. B-splines have compact support (each basis function is nonzero on at most \(m\) knot intervals), making the resulting Gram matrix \(\int \phi_k \phi_l\) banded and computationally efficient.

**Wavelet basis.** Wavelets provide multi-resolution representations: a dilation parameter controls the scale and a translation parameter controls the location of each basis function. Wavelets excel at representing functions with spatially localized features such as discontinuities or sharp peaks.

## 1.3 Penalized Least Squares for Smoothing

Given discrete noisy measurements \((t_j, y_j)\) for a single curve, the aim is to estimate the underlying smooth function \(x\). A natural criterion penalizes a goodness-of-fit term by a roughness penalty.

<div class="definition">
<strong>Penalized Least Squares (PLS).</strong> Let \(\mathcal{H}\) be a Hilbert space of functions on \(\mathcal{T}\). For a regularization parameter \(\lambda > 0\) and a roughness operator \(\mathcal{R}\), the <em>penalized least squares estimator</em> is

\[
\hat{x} = \operatorname*{arg\,min}_{x \in \mathcal{H}} \left\{ \sum_{j=1}^{n} \left[y_j - x(t_j)\right]^2 + \lambda \int_{\mathcal{T}} \left[x''(t)\right]^2 \, dt \right\}.
\]

The second term penalizes curvature; larger \(\lambda\) produces smoother estimates.
</div>

When the solution is expanded in a B-spline basis \(x(t) = \boldsymbol{\phi}(t)^\top \mathbf{c}\), the criterion becomes \(\|\mathbf{y} - \boldsymbol{\Phi}\mathbf{c}\|^2 + \lambda\,\mathbf{c}^\top \mathbf{P} \mathbf{c}\), where \(\boldsymbol{\Phi}_{jk} = \phi_k(t_j)\) and \(\mathbf{P}_{kl} = \int \phi_k'' \phi_l''\). The minimizer satisfies the normal equations

\[
\left(\boldsymbol{\Phi}^\top \boldsymbol{\Phi} + \lambda \mathbf{P}\right)\hat{\mathbf{c}} = \boldsymbol{\Phi}^\top \mathbf{y}.
\]

The fitted values \(\hat{\mathbf{y}} = \boldsymbol{\Phi}\hat{\mathbf{c}} = \mathbf{H}_\lambda \mathbf{y}\) are linear in the data, where the hat matrix is

\[
\mathbf{H}_\lambda = \boldsymbol{\Phi}\left(\boldsymbol{\Phi}^\top \boldsymbol{\Phi} + \lambda\mathbf{P}\right)^{-1}\boldsymbol{\Phi}^\top.
\]

The effective degrees of freedom of the smoother is \(\operatorname{tr}(\mathbf{H}_\lambda)\), which decreases from \(K\) (when \(\lambda = 0\)) to 0 (as \(\lambda \to \infty\)).

## 1.4 Smoothing Parameter Selection

The choice of \(\lambda\) governs the bias-variance tradeoff. Two principled selection methods are standard.

**Cross-validation (CV).** The leave-one-out CV score is

\[
\text{CV}(\lambda) = \sum_{j=1}^{n} \left[y_j - \hat{x}^{(-j)}(t_j)\right]^2,
\]

where \(\hat{x}^{(-j)}\) is the PLS estimate computed without observation \(j\). By the influence-function trick for linear smoothers, this equals

\[
\text{CV}(\lambda) = \sum_{j=1}^{n} \left[\frac{y_j - \hat{x}(t_j)}{1 - h_{jj}(\lambda)}\right]^2,
\]

where \(h_{jj}\) is the \(j\)-th diagonal of \(\mathbf{H}_\lambda\). This allows efficient computation without refitting \(n\) times.

**Generalized cross-validation (GCV).** GCV replaces the individual leverage values with their average, yielding

\[
\text{GCV}(\lambda) = \frac{n^{-1} \|\mathbf{y} - \hat{\mathbf{y}}\|^2}{\left[1 - n^{-1}\operatorname{tr}(\mathbf{H}_\lambda)\right]^2}.
\]

GCV is rotation-invariant and avoids the instability that arises when individual \(h_{jj}\) are large.

<div class="remark">
The GCV criterion has an asymptotic justification: minimizing GCV is asymptotically equivalent to minimizing the average squared prediction error under mild conditions on the design points (Craven and Wahba, 1979). In practice, GCV tends to slightly undersmooth but remains the default choice in packages such as the R <code>fda</code> library.
</div>

---

# Chapter 2: Nonparametric Regression

## 2.1 Kernel Regression

Kernel regression provides nonparametric estimates of a regression function \(m(t) = E\left[Y \mid T = t\right]\) without assuming a global parametric form.

<div class="definition">
<strong>Nadaraya–Watson Estimator.</strong> Given pairs \((t_1, y_1), \ldots, (t_n, y_n)\), the <em>Nadaraya–Watson estimator</em> with bandwidth \(h > 0\) and kernel function \(K\) is

\[
\hat{m}_h(t) = \frac{\sum_{i=1}^{n} K\!\left(\frac{t - t_i}{h}\right) y_i}{\sum_{i=1}^{n} K\!\left(\frac{t - t_i}{h}\right)}.
\]
</div>

The kernel \(K\) is typically a symmetric, non-negative function integrating to one, such as the Epanechnikov kernel \(K(u) = \frac{3}{4}(1-u^2)\mathbf{1}_{|u|\le 1}\) or the Gaussian kernel \(K(u) = (2\pi)^{-1/2}e^{-u^2/2}\). The bandwidth \(h\) plays the role of \(\lambda^{-1}\): small \(h\) gives a rough, high-variance estimate; large \(h\) gives a smooth, high-bias estimate.

**Local polynomial regression.** The Nadaraya–Watson estimator is the zeroth-order member of a family. Local polynomial regression of degree \(p\) fits, at each target point \(t\), a degree-\(p\) polynomial to the nearby data using weighted least squares with kernel weights:

\[
\hat{\boldsymbol{\beta}}(t) = \operatorname*{arg\,min}_{\boldsymbol{\beta}} \sum_{i=1}^{n} K\!\left(\frac{t - t_i}{h}\right) \left[y_i - \sum_{j=0}^{p} \beta_j (t_i - t)^j\right]^2.
\]

The estimate of \(m(t)\) is \(\hat{\beta}_0(t)\). Local linear regression (\(p=1\)) is preferred in practice because it automatically corrects boundary bias and achieves the minimax optimal rate for estimating functions with two bounded derivatives.

<div class="theorem">
<strong>Asymptotic Bias and Variance (Local Linear).</strong> Suppose \(m\) has two continuous derivatives and the design density \(f\) is positive and continuous. Under standard conditions on \(K\) and \(h = h_n \to 0\) with \(nh \to \infty\),

\[
\operatorname{Bias}\!\left[\hat{m}_h(t)\right] \approx \frac{h^2}{2}\,\mu_2(K)\,m''(t),
\]

\[
\operatorname{Var}\!\left[\hat{m}_h(t)\right] \approx \frac{\sigma^2(t)\,\|K\|_2^2}{n h\,f(t)},
\]

where \(\mu_2(K) = \int u^2 K(u)\,du\) and \(\|K\|_2^2 = \int K^2(u)\,du\). The MSE-optimal bandwidth satisfies \(h_{\text{opt}} \propto n^{-1/5}\), yielding MSE of order \(n^{-4/5}\).
</div>

## 2.2 Reproducing Kernel Hilbert Spaces

Reproducing kernel Hilbert spaces (RKHS) provide a unifying framework for a broad class of smoothing methods and connect kernel regression, spline smoothing, and Gaussian process methods.

<div class="definition">
<strong>Reproducing Kernel Hilbert Space.</strong> A Hilbert space \(\mathcal{H}\) of functions on \(\mathcal{T}\) is a <em>reproducing kernel Hilbert space</em> (RKHS) if, for every \(t \in \mathcal{T}\), the evaluation functional \(L_t : f \mapsto f(t)\) is bounded (continuous) on \(\mathcal{H}\). By the Riesz representation theorem, there exists a unique element \(R(\cdot, t) \in \mathcal{H}\) such that

\[
f(t) = \langle f,\, R(\cdot, t)\rangle_{\mathcal{H}} \quad \text{for all } f \in \mathcal{H}.
\]

The function \(R : \mathcal{T} \times \mathcal{T} \to \mathbb{R}\) defined this way is called the <em>reproducing kernel</em> of \(\mathcal{H}\). It satisfies (i) \(R(s,t) = R(t,s)\) (symmetry) and (ii) \(\sum_{i,j} a_i a_j R(t_i, t_j) \ge 0\) for all finite collections (positive semi-definiteness).
</div>

Conversely, given any symmetric, positive semi-definite kernel \(R\) on \(\mathcal{T} \times \mathcal{T}\), the Moore–Aronszajn theorem guarantees the existence of a unique RKHS \(\mathcal{H}_R\) for which \(R\) is the reproducing kernel.

**Examples.** (a) The Sobolev space \(W^m_2[0,1] = \{f : f^{(m-1)}\text{ abs. continuous},\, f^{(m)} \in L^2\}\) with inner product \(\langle f, g\rangle = \sum_{k=0}^{m-1} f^{(k)}(0)g^{(k)}(0) + \int_0^1 f^{(m)}g^{(m)}\) is an RKHS. (b) The Gaussian kernel \(R(s,t) = \exp(-\|s-t\|^2/2\sigma^2)\) on \(\mathbb{R}^d\) is the reproducing kernel of a specific RKHS of smooth functions.

<div class="theorem">
<strong>Representer Theorem.</strong> Let \(\mathcal{H}\) be an RKHS with kernel \(R\), and let \(\ell : \mathbb{R}^n \times \mathbb{R}^n \to \mathbb{R}\) be a loss function depending on \(f\) only through its values at \(t_1, \ldots, t_n\). Consider

\[
\min_{f \in \mathcal{H}} \left\{ \ell\!\left(y_1, \ldots, y_n,\, f(t_1), \ldots, f(t_n)\right) + \lambda \|f\|_{\mathcal{H}}^2 \right\}.
\]

Any minimizer admits the finite-dimensional representation

\[
\hat{f}(\cdot) = \sum_{i=1}^{n} \alpha_i\, R(\cdot, t_i).
\]
</div>

The Representer Theorem is fundamental: despite optimizing over an infinite-dimensional space, the solution lives in the \(n\)-dimensional span of kernel sections. This reduces the optimization to finding \(\boldsymbol{\alpha} \in \mathbb{R}^n\).

## 2.3 Smoothing Splines as RKHS Minimizers

The cubic smoothing spline minimizer of the PLS criterion in Section 1.3 is precisely the solution to an RKHS problem in \(W^2_2[0,1]\). The reproducing kernel for the penalty \(\int (f'')^2\) is

\[
R(s,t) = \int_0^1 (s - u)_+\,(t - u)_+\,du,
\]

where \((x)_+ = \max(x,0)\). By the Representer Theorem, the natural cubic smoothing spline interpolates the data at the \(n\) observation points in the RKHS norm sense, and its explicit form has knots exactly at \(t_1, \ldots, t_n\).

## 2.4 Penalized Splines

Smoothing splines place a knot at every data point, giving \(O(n)\) basis functions. **Penalized splines** (P-splines) use a fixed, modest number of knots \(K \ll n\), making them computationally lighter while retaining most of the smoothing-spline flexibility.

A P-spline fit uses \(K\) B-spline basis functions with evenly spaced knots and penalizes the \(d\)-th order differences of adjacent B-spline coefficients:

\[
\hat{\mathbf{c}} = \operatorname*{arg\,min}_{\mathbf{c}} \left\{ \|\mathbf{y} - \boldsymbol{\Phi}\mathbf{c}\|^2 + \lambda\,\mathbf{c}^\top \mathbf{D}_d^\top \mathbf{D}_d\,\mathbf{c} \right\},
\]

where \(\mathbf{D}_d\) is the \(d\)-th difference matrix. When \(d = 2\), this approximately penalizes curvature. P-splines admit a mixed-model representation (Ruppert, Wand, and Carroll), enabling REML-based selection of \(\lambda\).

## 2.5 Semiparametric Regression

Semiparametric models combine a parametric component for covariates with known structure and a nonparametric component for covariates with unknown form.

<div class="definition">
<strong>Partially Linear Model.</strong> The <em>partially linear model</em> is

\[
Y = \mathbf{Z}^\top \boldsymbol{\gamma} + m(T) + \varepsilon,
\]

where \(\mathbf{Z} \in \mathbb{R}^q\) is a vector of parametric covariates, \(T\) is a scalar covariate, \(m\) is an unknown smooth function, and \(\varepsilon\) has mean zero and variance \(\sigma^2\).
</div>

Robinson's (1988) double-residual estimator achieves \(\sqrt{n}\)-consistency for \(\boldsymbol{\gamma}\): partial out \(m(T)\) and \(E[\mathbf{Z} \mid T]\) by nonparametric regression, then run OLS on the residuals. The functional form \(m\) can subsequently be estimated by kernel or spline methods after removing \(\hat{\boldsymbol{\gamma}}^\top \mathbf{Z}\).

---

# Chapter 3: Covariance Modeling and Functional PCA

## 3.1 Mean and Covariance Functions

Let \(X\) be a square-integrable stochastic process on \(\mathcal{T}\), meaning \(E\left[\int_{\mathcal{T}} X^2(t)\,dt\right] < \infty\). The fundamental second-order summary statistics are the mean function and the covariance kernel.

<div class="definition">
<strong>Mean Function and Covariance Kernel.</strong> The <em>mean function</em> is \(\mu(t) = E\left[X(t)\right]\). The <em>covariance kernel</em> is

\[
C(s,t) = \operatorname{Cov}(X(s), X(t)) = E\!\left[(X(s) - \mu(s))(X(t) - \mu(t))\right].
\]

The covariance operator \(\mathcal{C} : L^2(\mathcal{T}) \to L^2(\mathcal{T})\) acts as \((\mathcal{C} f)(s) = \int_{\mathcal{T}} C(s,t)\,f(t)\,dt\).
</div>

The covariance operator is self-adjoint, positive semi-definite (since \(\int\!\int C(s,t)f(s)f(t)\,ds\,dt = \operatorname{Var}\!\left[\int f(t)X(t)\,dt\right] \ge 0\)), and of trace class when \(\int C(t,t)\,dt < \infty\).

## 3.2 Mercer's Theorem

Mercer's theorem is the continuous analogue of the spectral theorem for positive semi-definite matrices. It guarantees that the covariance operator has an eigendecomposition and provides the foundation for FPCA.

<div class="theorem">
<strong>Mercer's Theorem.</strong> Let \(C : \mathcal{T} \times \mathcal{T} \to \mathbb{R}\) be a continuous, symmetric, positive semi-definite kernel on a compact set \(\mathcal{T}\). Then there exist eigenvalues \(\lambda_1 \ge \lambda_2 \ge \cdots \ge 0\) and corresponding eigenfunctions \(\{\psi_k\}_{k \ge 1}\) forming an orthonormal basis of \(L^2(\mathcal{T})\) such that

\[
C(s,t) = \sum_{k=1}^{\infty} \lambda_k\,\psi_k(s)\,\psi_k(t),
\]

where the series converges absolutely and uniformly.
</div>

<div class="remark">
Mercer's theorem implies that \(C\) is determined by its spectrum \(\{(\lambda_k, \psi_k)\}\). Finite-rank approximations \(C_K(s,t) = \sum_{k=1}^{K} \lambda_k \psi_k(s)\psi_k(t)\) minimize the integrated squared error \(\int\!\int \left[C(s,t) - \tilde{C}(s,t)\right]^2 ds\,dt\) among all rank-\(K\) kernels, in direct analogy to the Eckart–Young theorem for matrices.
</div>

## 3.3 Functional Principal Component Analysis

Functional PCA (FPCA) seeks directions of maximal variation in the function space.

<div class="definition">
<strong>Functional Principal Components.</strong> The <em>functional principal components</em> are the solutions to the sequence of problems

\[
\psi_k = \operatorname*{arg\,max}_{\|f\|_{L^2}=1,\; f \perp \psi_1,\ldots,\psi_{k-1}} \operatorname{Var}\!\left[\langle X - \mu, f\rangle\right].
\]

The \(k\)-th eigenfunction \(\psi_k\) solves \(\mathcal{C}\psi_k = \lambda_k \psi_k\). The <em>functional principal component score</em> of observation \(X_i\) on the \(k\)-th component is \(\xi_{ik} = \langle X_i - \mu, \psi_k \rangle = \int_{\mathcal{T}} (X_i(t) - \mu(t))\psi_k(t)\,dt\).
</div>

The Karhunen–Loève expansion expresses the process as

\[
X(t) = \mu(t) + \sum_{k=1}^{\infty} \xi_k\,\psi_k(t),
\]

where the scores satisfy \(E[\xi_k] = 0\), \(E[\xi_k \xi_l] = \lambda_k \delta_{kl}\), and the convergence is in mean square. Truncating at \(K\) components gives the best rank-\(K\) approximation in the \(L^2\) sense, explaining a fraction \(\sum_{k=1}^{K} \lambda_k / \sum_{k=1}^{\infty} \lambda_k\) of total variance.

## 3.4 Estimation of Covariance and Eigenfunctions

In practice, the mean function and covariance kernel must be estimated from data. When curves are densely observed, one can:

1. Estimate \(\mu(t)\) by the pointwise sample mean \(\bar{X}(t) = n^{-1}\sum_i X_i(t)\).
2. Estimate \(C(s,t)\) by the pointwise sample covariance \(\hat{C}(s,t) = (n-1)^{-1}\sum_i (X_i(s) - \bar{X}(s))(X_i(t) - \bar{X}(t))\).
3. Compute the empirical covariance operator and solve the eigenproblem numerically.

When functions are observed on a common grid \(\{t_1, \ldots, t_J\}\), this reduces to the eigendecomposition of the \(J \times J\) sample covariance matrix, weighted by the quadrature weights for the integral \(\int \psi_k \psi_l\).

## 3.5 PACE for Sparse Functional Data

A critical challenge in biomedical applications is **sparse and irregular** functional data: subject \(i\) is observed only at a few time points \(\{t_{ij}\}_{j=1}^{m_i}\) with \(m_i\) often between 2 and 10, and the grids differ across subjects.

The **PACE** algorithm (Principal Analysis by Conditional Estimation; Yao, Müller, and Wang, 2005) addresses this by pooling information across subjects.

<div class="definition">
<strong>PACE Algorithm.</strong>
<ol>
<li>Smooth all pairs \((t_{ij}, y_{ij})\) pooled across subjects to estimate \(\mu(t)\) by local polynomial regression.</li>
<li>Form raw covariance products \(\tilde{C}_{ijl} = (y_{ij} - \hat{\mu}(t_{ij}))(y_{il} - \hat{\mu}(t_{il}))\) for \(j \ne l\), excluding diagonal to avoid noise contamination. Smooth the off-diagonal products by local polynomial surface smoothing to obtain \(\hat{C}(s,t)\).</li>
<li>Estimate eigenvalues \(\hat{\lambda}_k\) and eigenfunctions \(\hat{\psi}_k\) from the discretized \(\hat{C}\).</li>
<li>Predict scores by conditional expectation: \(\hat{\xi}_{ik} = \hat{\lambda}_k \hat{\boldsymbol{\psi}}_k^i{}^\top \hat{\boldsymbol{\Sigma}}_{Y_i}^{-1} (\mathbf{y}_i - \hat{\boldsymbol{\mu}}_i)\), where \(\hat{\boldsymbol{\Sigma}}_{Y_i} = \hat{\mathbf{C}}_i + \hat{\sigma}^2 \mathbf{I}\) and the subscript \(i\) denotes restriction to subject \(i\)'s grid.</li>
</ol>
</div>

The PACE score estimates are the best linear predictors of \(\xi_{ik}\) given the observations \(\mathbf{y}_i\), exploiting the structure of the Karhunen–Loève expansion. Under Gaussianity, these are the full conditional expectations \(E[\xi_{ik} \mid \mathbf{y}_i]\).

---

# Chapter 4: Functional Linear Models and Functional GLMs

## 4.1 Scalar-on-Function Regression

The scalar-on-function regression model relates a scalar response \(Y\) to a functional predictor \(X(\cdot)\) through an integral transform involving a coefficient function \(\beta(\cdot)\).

<div class="definition">
<strong>Scalar-on-Function Regression Model.</strong>

\[
Y_i = \alpha + \int_{\mathcal{T}} \beta(t)\,X_i(t)\,dt + \varepsilon_i,
\]

where \(\alpha \in \mathbb{R}\) is an intercept, \(\beta \in L^2(\mathcal{T})\) is the <em>slope function</em>, and \(\varepsilon_i\) are i.i.d. errors with mean zero and variance \(\sigma^2\).
</div>

The functional inner product \(\int \beta(t) X_i(t)\,dt\) generalizes the linear predictor \(\boldsymbol{\beta}^\top \mathbf{x}_i\) of classical regression to the infinite-dimensional setting. Identifiability requires that the distribution of \(X\) is not supported on a proper closed subspace of \(L^2(\mathcal{T})\).

## 4.2 Estimation via Basis Expansion

**Approach 1: Basis expansion for \(\beta\).** Write \(\beta(t) = \sum_{k=1}^{K_\beta} b_k \phi_k(t)\) in a chosen basis. Then

\[
\int_{\mathcal{T}} \beta(t)\,X_i(t)\,dt = \sum_{k=1}^{K_\beta} b_k \int_{\mathcal{T}} \phi_k(t)\,X_i(t)\,dt = \mathbf{b}^\top \mathbf{w}_i,
\]

where \(w_{ik} = \int \phi_k(t) X_i(t)\,dt\). This reduces to a standard linear regression of \(Y\) on \(\mathbf{w}_i\). Penalization of \(\mathbf{b}\) via \(\lambda \mathbf{b}^\top \mathbf{P} \mathbf{b}\) (roughness penalty on \(\beta\)) corresponds to ridge regression with a structured penalty.

**Approach 2: FPCA reduction.** Project \(X_i\) onto the leading \(K\) functional principal components: the model becomes \(Y_i = \alpha + \sum_{k=1}^{K} \xi_{ik} \beta_k + \varepsilon_i\), where \(\beta_k = \int \beta(t)\psi_k(t)\,dt\) are the FPC coefficients of \(\beta\). This is standard multiple regression on the FPC scores.

<div class="theorem">
<strong>RKHS Penalization.</strong> In the RKHS framework with \(\beta \in \mathcal{H}_R\), the penalized estimator

\[
\hat{\beta} = \operatorname*{arg\,min}_{\beta \in \mathcal{H}_R} \left\{ \sum_{i=1}^{n} \left[Y_i - \alpha - \langle \beta, X_i \rangle_{L^2}\right]^2 + \lambda \|\beta\|_{\mathcal{H}_R}^2 \right\}
\]

has the representer form \(\hat{\beta}(\cdot) = \sum_{i=1}^{n} \hat{a}_i \int_{\mathcal{T}} R(\cdot, t) X_i(t)\,dt\). Estimation reduces to a finite-dimensional penalized least squares problem in the coefficients \(\hat{\mathbf{a}}\).
</div>

## 4.3 Function-on-Function Regression

When both the response and predictor are functions, the regression coefficient becomes an integral operator.

<div class="definition">
<strong>Function-on-Function Linear Model.</strong>

\[
Y_i(s) = \alpha(s) + \int_{\mathcal{T}} \beta(s,t)\,X_i(t)\,dt + \varepsilon_i(s), \quad s \in \mathcal{S},
\]

where \(\beta(s,t)\) is a bivariate coefficient surface and \(\varepsilon_i\) is a zero-mean stochastic process on \(\mathcal{S}\).
</div>

Estimation proceeds by expanding \(\beta(s,t) = \sum_{k,l} b_{kl}\,\phi_k(s)\phi_l(t)\) in a tensor product basis. The surface is penalized to enforce smoothness simultaneously in \(s\) and \(t\) directions. Alternatively, a concurrent model \(\beta(s,t) = \beta(t)\mathbf{1}_{s=t}\) restricts to \(Y_i(t) = \alpha(t) + \beta(t)X_i(t) + \varepsilon_i(t)\), a pointwise regression.

## 4.4 Functional Generalized Linear Models

Functional GLMs extend scalar-on-function regression to non-Gaussian responses by linking the conditional distribution to the functional predictor through a link function.

<div class="definition">
<strong>Functional Logistic Regression.</strong> For a binary response \(Y_i \in \{0,1\}\),

\[
\log\frac{P(Y_i = 1 \mid X_i)}{P(Y_i = 0 \mid X_i)} = \alpha + \int_{\mathcal{T}} \beta(t)\,X_i(t)\,dt.
\]
</div>

More generally, for a response \(Y_i\) in an exponential family with canonical link \(g\),

\[
g\!\left(E[Y_i \mid X_i]\right) = \alpha + \int_{\mathcal{T}} \beta(t)\,X_i(t)\,dt.
\]

Estimation uses penalized likelihood. The log-likelihood is

\[
\ell(\alpha, \beta) = \sum_{i=1}^{n} \ell_i\!\left(\alpha + \int \beta(t)X_i(t)\,dt\right) - \lambda \int \left[\beta''(t)\right]^2 dt,
\]

and Newton–Raphson (IRLS) adapted to the functional setting applies iteratively.

## 4.5 Inference for Functional Coefficients

Pointwise confidence bands for \(\hat{\beta}(t)\) can be constructed by bootstrap or by asymptotic theory. The functional t-test for \(H_0 : \beta = 0\) requires careful treatment of the infinite-dimensional null hypothesis; popular approaches include the global F-type test using the \(L^2\) norm \(\|\hat{\beta}\|^2\) and permutation-based p-values.

<div class="remark">
Multiple testing corrections for pointwise tests across \(t\) (simultaneous inference) must account for the correlation of \(\hat{\beta}(s)\) and \(\hat{\beta}(t)\). Simultaneous confidence bands based on the supremum of a Gaussian process approximation are preferred over Bonferroni correction.
</div>

---

# Part II: Bayesian Computing (Winter 2025, Martin Lysy)

# Chapter 5: Bayesian Foundations and Normal Approximation

## 5.1 Prior, Posterior, and Predictive Distributions

The Bayesian paradigm treats all unknowns — parameters, latent variables, and future observations — as random variables. Uncertainty about a parameter vector \(\boldsymbol{\theta} \in \Theta\) is encoded in a prior distribution \(p(\boldsymbol{\theta})\), and updated upon observing data \(\mathbf{y}\) via Bayes' rule.

<div class="definition">
<strong>Posterior Distribution.</strong> Given a likelihood \(p(\mathbf{y} \mid \boldsymbol{\theta})\) and prior \(p(\boldsymbol{\theta})\), the <em>posterior distribution</em> is

\[
p(\boldsymbol{\theta} \mid \mathbf{y}) = \frac{p(\mathbf{y} \mid \boldsymbol{\theta})\,p(\boldsymbol{\theta})}{p(\mathbf{y})}, \quad p(\mathbf{y}) = \int_\Theta p(\mathbf{y} \mid \boldsymbol{\theta})\,p(\boldsymbol{\theta})\,d\boldsymbol{\theta}.
\]

The normalizing constant \(p(\mathbf{y})\) is the <em>marginal likelihood</em> or <em>evidence</em>.
</div>

**Conjugate models.** A prior \(p(\boldsymbol{\theta})\) is conjugate to the likelihood \(p(\mathbf{y} \mid \boldsymbol{\theta})\) if the posterior \(p(\boldsymbol{\theta} \mid \mathbf{y})\) is in the same parametric family. The Beta-Binomial, Normal-Normal, Dirichlet-Multinomial, and Normal-Inverse-Gamma models are the canonical conjugate examples.

The **posterior predictive distribution** for a new observation \(\tilde{y}\) marginalizes out \(\boldsymbol{\theta}\):

\[
p(\tilde{y} \mid \mathbf{y}) = \int p(\tilde{y} \mid \boldsymbol{\theta})\,p(\boldsymbol{\theta} \mid \mathbf{y})\,d\boldsymbol{\theta}.
\]

This propagates full posterior uncertainty into predictions, in contrast to plug-in estimators.

## 5.2 Hierarchical Models

Hierarchical models introduce a structured prior with multiple levels, allowing partial pooling of information across groups.

<div class="definition">
<strong>Hierarchical Model.</strong> A two-level hierarchical model has the form

\[
\mathbf{y}_i \mid \boldsymbol{\theta}_i \sim p(\mathbf{y}_i \mid \boldsymbol{\theta}_i), \quad \boldsymbol{\theta}_i \mid \boldsymbol{\phi} \sim p(\boldsymbol{\theta}_i \mid \boldsymbol{\phi}), \quad \boldsymbol{\phi} \sim p(\boldsymbol{\phi}),
\]

for groups \(i = 1, \ldots, m\). The hyperparameter \(\boldsymbol{\phi}\) links the groups. The joint posterior is \(p(\boldsymbol{\theta}_1, \ldots, \boldsymbol{\theta}_m, \boldsymbol{\phi} \mid \mathbf{y}) \propto p(\boldsymbol{\phi})\prod_{i=1}^{m} p(\boldsymbol{\theta}_i \mid \boldsymbol{\phi})\,p(\mathbf{y}_i \mid \boldsymbol{\theta}_i)\).
</div>

The eight-schools example of Gelman et al. illustrates shrinkage: group-level estimates \(\hat{\theta}_i\) are pulled toward the grand mean \(\bar{\theta}\), with more shrinkage for groups with smaller sample sizes.

## 5.3 Bayesian Normal Approximation (Laplace)

When the posterior is unimodal and the sample size is large, a normal approximation centered at the posterior mode (MAP estimate) is often accurate.

<div class="definition">
<strong>Laplace Approximation.</strong> Let \(\hat{\boldsymbol{\theta}} = \operatorname*{arg\,max}_{\boldsymbol{\theta}} \log p(\boldsymbol{\theta} \mid \mathbf{y})\) be the posterior mode. Define the observed information matrix

\[
\hat{\mathbf{I}} = -\nabla^2_{\boldsymbol{\theta}} \log p(\boldsymbol{\theta} \mid \mathbf{y})\big|_{\boldsymbol{\theta} = \hat{\boldsymbol{\theta}}}.
\]

The <em>Laplace approximation</em> is \(p(\boldsymbol{\theta} \mid \mathbf{y}) \approx \mathcal{N}\!\left(\hat{\boldsymbol{\theta}},\, \hat{\mathbf{I}}^{-1}\right)\).
</div>

The approximation is justified by a Taylor expansion of \(\log p(\boldsymbol{\theta} \mid \mathbf{y})\) around \(\hat{\boldsymbol{\theta}}\). Under mild regularity conditions (Bernstein–von Mises), the posterior concentrates around the MLE at rate \(n^{-1/2}\) and is asymptotically normal with covariance \(\mathbf{I}(\boldsymbol{\theta}_0)^{-1}/n\), where \(\mathbf{I}(\boldsymbol{\theta}_0)\) is the Fisher information at the true parameter.

**Bayes factors and model comparison.** The Bayes factor comparing models \(\mathcal{M}_1\) and \(\mathcal{M}_2\) is

\[
\text{BF}_{12} = \frac{p(\mathbf{y} \mid \mathcal{M}_1)}{p(\mathbf{y} \mid \mathcal{M}_2)}.
\]

The Laplace approximation to \(\log p(\mathbf{y}) \approx \log p(\mathbf{y} \mid \hat{\boldsymbol{\theta}}) + \frac{p}{2}\log(2\pi) - \frac{1}{2}\log\det\hat{\mathbf{I}}\) connects to the BIC via the leading terms.

---

# Chapter 6: Markov Chain Monte Carlo

## 6.1 The Metropolis-Hastings Algorithm

When the posterior is intractable, MCMC constructs a Markov chain whose stationary distribution is the target \(\pi(\boldsymbol{\theta}) \propto p(\mathbf{y} \mid \boldsymbol{\theta})\,p(\boldsymbol{\theta})\).

<div class="theorem">
<strong>Metropolis–Hastings Algorithm.</strong> Given current state \(\boldsymbol{\theta}^{(t)}\):
<ol>
<li>Propose \(\boldsymbol{\theta}^* \sim q(\cdot \mid \boldsymbol{\theta}^{(t)})\) from a proposal distribution.</li>
<li>Compute the acceptance ratio
\[
\alpha = \min\!\left(1,\; \frac{\pi(\boldsymbol{\theta}^*)\,q(\boldsymbol{\theta}^{(t)} \mid \boldsymbol{\theta}^*)}{\pi(\boldsymbol{\theta}^{(t)})\,q(\boldsymbol{\theta}^* \mid \boldsymbol{\theta}^{(t)})}\right).
\]
</li>
<li>Set \(\boldsymbol{\theta}^{(t+1)} = \boldsymbol{\theta}^*\) with probability \(\alpha\); otherwise \(\boldsymbol{\theta}^{(t+1)} = \boldsymbol{\theta}^{(t)}\).</li>
</ol>

The resulting chain satisfies <em>detailed balance</em> with respect to \(\pi\): \(\pi(\boldsymbol{\theta})\,q(\boldsymbol{\theta}' \mid \boldsymbol{\theta})\,\alpha(\boldsymbol{\theta}, \boldsymbol{\theta}') = \pi(\boldsymbol{\theta}')\,q(\boldsymbol{\theta} \mid \boldsymbol{\theta}')\,\alpha(\boldsymbol{\theta}', \boldsymbol{\theta})\), ensuring \(\pi\) is the stationary distribution.
</div>

**Random-walk MH.** The proposal \(\boldsymbol{\theta}^* = \boldsymbol{\theta}^{(t)} + \epsilon\), \(\epsilon \sim \mathcal{N}(\mathbf{0}, \sigma^2 \mathbf{I})\) is symmetric, so \(q(\boldsymbol{\theta}' \mid \boldsymbol{\theta}) = q(\boldsymbol{\theta} \mid \boldsymbol{\theta}')\) and the acceptance ratio simplifies to \(\min(1, \pi(\boldsymbol{\theta}^*)/\pi(\boldsymbol{\theta}^{(t)}))\). The optimal acceptance rate for a \(d\)-dimensional Gaussian target is approximately 0.234 (Roberts, Gelman, and Gilks, 1997), achieved by scaling \(\sigma^2 \approx 2.38^2/d\).

## 6.2 Gibbs Sampler

The Gibbs sampler exploits conditional independence structure by cycling through full conditional distributions.

<div class="definition">
<strong>Gibbs Sampler.</strong> Partition \(\boldsymbol{\theta} = (\theta_1, \ldots, \theta_p)\). At each iteration, update each component by drawing from its full conditional:

\[
\theta_j^{(t+1)} \sim p\!\left(\theta_j \mid \theta_1^{(t+1)}, \ldots, \theta_{j-1}^{(t+1)}, \theta_{j+1}^{(t)}, \ldots, \theta_p^{(t)}, \mathbf{y}\right).
\]

Each Gibbs step is an MH step with acceptance probability exactly 1.
</div>

In hierarchical models, the full conditionals are often available in closed form (conjugate structure), making the Gibbs sampler the algorithm of choice. Data augmentation (Tanner and Wong, 1987) introduces auxiliary variables to render full conditionals tractable.

## 6.3 Convergence Diagnostics

Assessing convergence is critical; MCMC provides a biased estimate until the chain has mixed.

The **Gelman–Rubin diagnostic** \(\hat{R}\) runs \(M \ge 2\) parallel chains from overdispersed starting values. Let \(W\) be the within-chain variance and \(B\) the between-chain variance. The potential scale reduction factor is

\[
\hat{R} = \sqrt{\frac{\hat{V}}{W}}, \quad \hat{V} = \frac{T-1}{T}W + \frac{M+1}{MT}B,
\]

where \(T\) is the chain length after warmup. Values \(\hat{R} < 1.01\) are considered adequate (Vehtari et al., 2021 revision).

The **effective sample size** (ESS) accounts for autocorrelation:

\[
\text{ESS} = \frac{MT}{1 + 2\sum_{\tau=1}^{\infty} \rho_\tau},
\]

where \(\rho_\tau\) is the autocorrelation at lag \(\tau\). Highly correlated chains (slow mixing) produce low ESS. A rule of thumb is ESS \(\ge 400\) for reliable posterior summaries.

## 6.4 Adaptive MCMC

Adaptive MCMC tunes the proposal distribution using past samples, trading off the simplicity of fixed-kernel MCMC for improved mixing.

The **Adaptive Metropolis (AM) algorithm** (Haario, Saksman, and Tamminen, 2001) uses a proposal covariance that adapts to the empirical covariance of the chain:

\[
q_t(\boldsymbol{\theta}^* \mid \boldsymbol{\theta}^{(t)}) = \mathcal{N}\!\left(\boldsymbol{\theta}^{(t)},\; \frac{2.38^2}{d}\hat{\boldsymbol{\Sigma}}_t + \varepsilon \mathbf{I}\right),
\]

where \(\hat{\boldsymbol{\Sigma}}_t\) is the sample covariance of \(\boldsymbol{\theta}^{(1)}, \ldots, \boldsymbol{\theta}^{(t)}\) and \(\varepsilon > 0\) prevents degeneracy. Although adaptation violates the Markov property, the AM chain is ergodic if adaptation diminishes asymptotically (Atchadé and Rosenthal, 2003).

---

# Chapter 7: Hamiltonian Monte Carlo

## 7.1 Hamiltonian Dynamics

Hamiltonian Monte Carlo (HMC) exploits gradient information to make large moves in parameter space while maintaining high acceptance rates, dramatically improving over random-walk MH in high dimensions.

HMC augments the target with an auxiliary momentum variable \(\mathbf{p} \in \mathbb{R}^d\) and simulates Hamiltonian dynamics on the joint space \((\boldsymbol{\theta}, \mathbf{p})\). The **Hamiltonian** is

\[
H(\boldsymbol{\theta}, \mathbf{p}) = U(\boldsymbol{\theta}) + K(\mathbf{p}),
\]

where \(U(\boldsymbol{\theta}) = -\log\pi(\boldsymbol{\theta})\) is the potential energy and \(K(\mathbf{p}) = \frac{1}{2}\mathbf{p}^\top \mathbf{M}^{-1}\mathbf{p}\) is the kinetic energy (with mass matrix \(\mathbf{M}\)). Hamilton's equations are

\[
\frac{d\boldsymbol{\theta}}{d\tau} = \frac{\partial H}{\partial \mathbf{p}} = \mathbf{M}^{-1}\mathbf{p}, \qquad \frac{d\mathbf{p}}{d\tau} = -\frac{\partial H}{\partial \boldsymbol{\theta}} = \nabla_{\boldsymbol{\theta}} \log\pi(\boldsymbol{\theta}).
\]

The Hamiltonian is conserved along trajectories, and the flow preserves the canonical distribution \(p(\boldsymbol{\theta}, \mathbf{p}) \propto e^{-H(\boldsymbol{\theta},\mathbf{p})}\).

## 7.2 The Leapfrog Integrator

Exact Hamiltonian dynamics are approximated by the **leapfrog integrator**, which is time-reversible and volume-preserving (symplectic):

\[
\mathbf{p}^{(\ell + 1/2)} = \mathbf{p}^{(\ell)} + \frac{\epsilon}{2}\nabla_{\boldsymbol{\theta}}\log\pi\!\left(\boldsymbol{\theta}^{(\ell)}\right),
\]

\[
\boldsymbol{\theta}^{(\ell+1)} = \boldsymbol{\theta}^{(\ell)} + \epsilon\,\mathbf{M}^{-1}\mathbf{p}^{(\ell+1/2)},
\]

\[
\mathbf{p}^{(\ell+1)} = \mathbf{p}^{(\ell+1/2)} + \frac{\epsilon}{2}\nabla_{\boldsymbol{\theta}}\log\pi\!\left(\boldsymbol{\theta}^{(\ell+1)}\right),
\]

for step size \(\epsilon\). After \(L\) leapfrog steps, the proposed \((\boldsymbol{\theta}^*, \mathbf{p}^*)\) is accepted with MH probability \(\min(1, e^{-H(\boldsymbol{\theta}^*, \mathbf{p}^*) + H(\boldsymbol{\theta}^{(t)}, \mathbf{p}^{(t)})})\). For an ideal integrator with no discretization error, acceptance would be 1; in practice, the optimal acceptance rate is approximately 0.651.

## 7.3 The No-U-Turn Sampler and Stan

HMC requires tuning the step size \(\epsilon\) and number of leapfrog steps \(L\). The **No-U-Turn Sampler (NUTS)** (Hoffman and Gelman, 2014) eliminates the need to specify \(L\) by dynamically extending the trajectory until it makes a U-turn (i.e., until \(\mathbf{p} \cdot (\boldsymbol{\theta} - \boldsymbol{\theta}^{(t)}) < 0\)).

<div class="definition">
<strong>NUTS Criterion.</strong> Starting from position \(\boldsymbol{\theta}^{(t)}\) and momentum \(\mathbf{p}\), the trajectory doubles until the <em>no-U-turn condition</em> is violated:

\[
(\boldsymbol{\theta}^+ - \boldsymbol{\theta}^-) \cdot \mathbf{p}^+ \ge 0 \quad \text{and} \quad (\boldsymbol{\theta}^+ - \boldsymbol{\theta}^-) \cdot \mathbf{p}^- \ge 0,
\]

where \(\boldsymbol{\theta}^+\) and \(\boldsymbol{\theta}^-\) are the rightmost and leftmost positions of the current tree.
</div>

**Stan** is a probabilistic programming language implementing NUTS with dual averaging for automatic step-size adaptation during warmup. Users specify a joint model in Stan's modeling language; Stan auto-differentiates the log-posterior to supply the required gradients. Stan's performance degrades in the presence of non-identifiabilities and discrete parameters (which it cannot handle directly), motivating the use of marginalization or alternative parameterizations.

<div class="remark">
HMC is particularly effective in high dimensions where random-walk MH mixes at a rate \(O(d)\) (in terms of number of gradient evaluations needed to traverse the posterior). HMC achieves \(O(d^{1/4})\) gradient evaluations for well-conditioned posteriors, a dramatic improvement.
</div>

---

# Chapter 8: State-Space Models and Particle Filtering

## 8.1 Hidden Markov Models and State-Space Models

State-space models (SSMs) describe a latent process \(\{X_t\}_{t \ge 0}\) observed noisily through \(\{Y_t\}_{t \ge 0}\). The Markov structure is:

\[
X_{t+1} \mid X_t \sim p(x_{t+1} \mid x_t), \quad Y_t \mid X_t \sim p(y_t \mid x_t),
\]

with \(Y_t \perp (X_{0:t-1}, Y_{0:t-1}) \mid X_t\) and \(X_{t+1} \perp (X_{0:t-1}, Y_{0:t}) \mid X_t\).

**Hidden Markov models (HMMs)** are discrete-state SSMs. **Linear Gaussian SSMs** (also called Gaussian linear dynamical systems) have

\[
X_{t+1} = \mathbf{F} X_t + \mathbf{q}_t, \quad Y_t = \mathbf{H} X_t + \mathbf{r}_t,
\]

with \(\mathbf{q}_t \sim \mathcal{N}(\mathbf{0}, \mathbf{Q})\) and \(\mathbf{r}_t \sim \mathcal{N}(\mathbf{0}, \mathbf{R})\). This special case admits a closed-form solution: the Kalman filter.

## 8.2 The Kalman Filter

<div class="theorem">
<strong>Kalman Filter Recursion.</strong> For the linear Gaussian SSM, the filtering distribution \(p(x_t \mid y_{0:t})\) is Gaussian at every time \(t\). Initializing with \(p(x_0) = \mathcal{N}(\mathbf{m}_0, \mathbf{P}_0)\), the recursion is:

<strong>Predict:</strong>
\[
\mathbf{m}_t^- = \mathbf{F}\mathbf{m}_{t-1}, \quad \mathbf{P}_t^- = \mathbf{F}\mathbf{P}_{t-1}\mathbf{F}^\top + \mathbf{Q}.
\]

<strong>Update:</strong>
\[
\mathbf{K}_t = \mathbf{P}_t^- \mathbf{H}^\top \left(\mathbf{H}\mathbf{P}_t^- \mathbf{H}^\top + \mathbf{R}\right)^{-1},
\]

\[
\mathbf{m}_t = \mathbf{m}_t^- + \mathbf{K}_t\!\left(\mathbf{y}_t - \mathbf{H}\mathbf{m}_t^-\right), \quad \mathbf{P}_t = (\mathbf{I} - \mathbf{K}_t \mathbf{H})\mathbf{P}_t^-.
\]

The matrix \(\mathbf{K}_t\) is the <em>Kalman gain</em>.
</div>

The Kalman smoother (Rauch–Tung–Striebel) computes the smoothing distribution \(p(x_t \mid y_{0:T})\) for all \(t \le T\) using a backward pass.

## 8.3 The Bootstrap Particle Filter

For nonlinear, non-Gaussian SSMs, the Kalman filter is not exact. Particle filters approximate the filtering distribution \(p(x_t \mid y_{0:t})\) by a weighted empirical distribution over \(N\) particles \(\{x_t^{(j)}, w_t^{(j)}\}_{j=1}^N\).

<div class="definition">
<strong>Bootstrap Particle Filter.</strong>
<ol>
<li><strong>Initialize:</strong> Draw \(x_0^{(j)} \sim p(x_0)\), set \(w_0^{(j)} = 1/N\).</li>
<li><strong>At each time \(t\):</strong>
<ul>
<li><em>Resample:</em> Draw indices \(a^{(j)} \sim \text{Multinomial}(\mathbf{w}_{t-1})\), set \(\tilde{x}_{t-1}^{(j)} = x_{t-1}^{(a^{(j)})}\).</li>
<li><em>Propagate:</em> Draw \(x_t^{(j)} \sim p(x_t \mid \tilde{x}_{t-1}^{(j)})\) from the transition kernel.</li>
<li><em>Weight:</em> Set \(w_t^{(j)} \propto p(y_t \mid x_t^{(j)})\).</li>
</ul>
</li>
</ol>

The filtering expectation \(E\left[h(X_t) \mid y_{0:t}\right]\) is approximated by \(\sum_{j=1}^N w_t^{(j)} h(x_t^{(j)})\).
</div>

The **sequential importance resampling** (SIR) step prevents weight degeneracy, where a single particle would accumulate all weight. The effective sample size \(\text{ESS}_t = \left(\sum_j (w_t^{(j)})^2\right)^{-1}\) diagnoses degeneracy; resampling is typically triggered when \(\text{ESS}_t < N/2\).

Particle filters form the basis of **particle MCMC** (Andrieu, Doucet, and Holenstein, 2010), which uses particle filter estimates of the likelihood \(p(\mathbf{y} \mid \boldsymbol{\theta})\) inside an MH sampler for \(\boldsymbol{\theta}\).

---

# Chapter 9: Nonparametric Bayes

## 9.1 The Dirichlet Process

The Dirichlet process (DP) is the fundamental building block of Bayesian nonparametric inference. It defines a prior over the infinite-dimensional space of probability measures.

<div class="definition">
<strong>Dirichlet Process (Ferguson, 1973).</strong> A random probability measure \(G\) on a measurable space \((\Omega, \mathcal{F})\) follows a <em>Dirichlet process</em> with concentration parameter \(\alpha > 0\) and base measure \(G_0\), written \(G \sim \text{DP}(\alpha, G_0)\), if for every finite measurable partition \((A_1, \ldots, A_k)\) of \(\Omega\),

\[
(G(A_1), \ldots, G(A_k)) \sim \text{Dirichlet}(\alpha G_0(A_1), \ldots, \alpha G_0(A_k)).
\]
</div>

Key properties of the DP: (i) \(E[G(A)] = G_0(A)\), so \(G_0\) is the prior mean measure; (ii) \(\operatorname{Var}(G(A)) = G_0(A)(1 - G_0(A))/(\alpha + 1)\), so \(\alpha\) controls concentration around \(G_0\); (iii) realizations of \(G\) are almost surely discrete — a foundational fact exploited in mixture models.

**Stick-breaking construction (Sethuraman, 1994).** An equivalent constructive definition is:

\[
G = \sum_{k=1}^{\infty} \pi_k\,\delta_{\theta_k},
\]

where \(\theta_k \overset{\text{iid}}{\sim} G_0\), \(V_k \overset{\text{iid}}{\sim} \text{Beta}(1, \alpha)\), and \(\pi_k = V_k \prod_{l=1}^{k-1}(1 - V_l)\). The weights \(\pi_k\) are a random partition of unity, constructed by successively "breaking" a unit stick.

**Chinese Restaurant Process (CRP).** The predictive distribution of the DP yields the CRP: given a sequence \(\theta_1, \ldots, \theta_{n-1}\) drawn from a DP-based model, the next draw satisfies

\[
\theta_n \mid \theta_1, \ldots, \theta_{n-1} \sim \frac{\alpha}{\alpha + n - 1}\,G_0 + \frac{1}{\alpha + n - 1}\sum_{i=1}^{n-1}\delta_{\theta_i}.
\]

With probability proportional to \(\alpha\), a new table (cluster) is opened; with probability proportional to its current count, an existing table is joined. This gives a distribution over partitions of \(\{1, \ldots, n\}\) with the property that the number of clusters grows as \(\alpha\log n\).

## 9.2 Dirichlet Process Mixture Models

Since DP realizations are discrete, they are directly useful as mixing distributions in mixture models.

<div class="definition">
<strong>DP Mixture Model.</strong>

\[
G \mid \alpha, G_0 \sim \text{DP}(\alpha, G_0), \quad \theta_i \mid G \overset{\text{iid}}{\sim} G, \quad Y_i \mid \theta_i \sim p(y \mid \theta_i).
\]
</div>

Marginalizing out \(G\), the CRP structure induces a random clustering of the observations. The DP mixture allows an unbounded number of components, with the data determining the effective number. Posterior inference is typically via:

- **Blocked Gibbs sampler:** Truncate the stick-breaking at \(K\) terms and use conjugate updates.
- **Algorithm 8 of Neal (2000):** A non-conjugate collapsed sampler that updates cluster assignments using the CRP prior and a Metropolis step for cluster parameters.

## 9.3 Gaussian Process Priors and Regression

A Gaussian process (GP) is a stochastic process such that any finite-dimensional marginal is multivariate Gaussian. GPs provide flexible, nonparametric priors over function spaces.

<div class="definition">
<strong>Gaussian Process.</strong> A stochastic process \(f : \mathcal{T} \to \mathbb{R}\) is a <em>Gaussian process</em> with mean function \(m(\cdot)\) and covariance kernel \(k(\cdot, \cdot)\), written \(f \sim \mathcal{GP}(m, k)\), if for any \(t_1, \ldots, t_n \in \mathcal{T}\),

\[
\left(f(t_1), \ldots, f(t_n)\right)^\top \sim \mathcal{N}\!\left(\mathbf{m}, \mathbf{K}\right),
\]

where \(m_i = m(t_i)\) and \(K_{ij} = k(t_i, t_j)\).
</div>

In **GP regression**, one places a GP prior on a latent function \(f\) and observes \(Y_i = f(t_i) + \varepsilon_i\) with \(\varepsilon_i \sim \mathcal{N}(0, \sigma^2)\). The posterior is also a GP:

<div class="theorem">
<strong>GP Posterior.</strong> Given observations \(\mathbf{y} = (y_1, \ldots, y_n)^\top\) at inputs \(\mathbf{t}\), the posterior of \(f\) is \(\mathcal{GP}(m_*, k_*)\) with

\[
m_*(t) = m(t) + \mathbf{k}(t)^\top \left(\mathbf{K} + \sigma^2\mathbf{I}\right)^{-1}(\mathbf{y} - \mathbf{m}),
\]

\[
k_*(s,t) = k(s,t) - \mathbf{k}(s)^\top \left(\mathbf{K} + \sigma^2\mathbf{I}\right)^{-1}\mathbf{k}(t),
\]

where \(\mathbf{k}(t) = (k(t, t_1), \ldots, k(t, t_n))^\top\) and \(\mathbf{K}_{ij} = k(t_i, t_j)\).
</div>

Computing the GP posterior requires solving a linear system with the \(n \times n\) matrix \(\mathbf{K} + \sigma^2\mathbf{I}\), costing \(O(n^3)\) via Cholesky decomposition. Sparse approximations (inducing points, Nyström) reduce this to \(O(nm^2)\) for \(m \ll n\) inducing inputs.

**Deep GPs** compose multiple GP layers, \(f^{(L)} \circ \cdots \circ f^{(1)}\), yielding richer representations but requiring approximate inference (variational or MCMC).

---

# Chapter 10: Approximate Inference

## 10.1 Variational Inference

Variational inference (VI) converts posterior inference into optimization. One approximates the intractable posterior \(p(\boldsymbol{\theta} \mid \mathbf{y})\) by the closest member of a tractable family \(\mathcal{Q} = \{q_\phi : \phi \in \Phi\}\), measured by KL divergence.

<div class="definition">
<strong>Evidence Lower Bound (ELBO).</strong> For any density \(q_\phi\),

\[
\log p(\mathbf{y}) = \text{KL}\!\left(q_\phi \| p(\cdot \mid \mathbf{y})\right) + \mathcal{L}(\phi),
\]

where the <em>ELBO</em> is

\[
\mathcal{L}(\phi) = E_{q_\phi}\!\left[\log p(\mathbf{y}, \boldsymbol{\theta})\right] - E_{q_\phi}\!\left[\log q_\phi(\boldsymbol{\theta})\right].
\]

Since \(\text{KL} \ge 0\), maximizing \(\mathcal{L}(\phi)\) minimizes the KL divergence and tightens the lower bound on the log-evidence.
</div>

## 10.2 Mean-Field Variational Inference and CAVI

The **mean-field** family assumes full factorization: \(q_\phi(\boldsymbol{\theta}) = \prod_{j=1}^{d} q_j(\theta_j)\). While this ignores posterior correlations, it often yields reasonable marginal approximations.

The **Coordinate Ascent Variational Inference (CAVI)** algorithm iteratively optimizes each factor \(q_j\) while holding the others fixed.

<div class="theorem">
<strong>CAVI Update.</strong> For the mean-field approximation, the optimal factor for \(\theta_j\) is

\[
\log q_j^*(\theta_j) = E_{q_{-j}}\!\left[\log p(\boldsymbol{\theta}, \mathbf{y})\right] + \text{const},
\]

where the expectation is over all variables except \(\theta_j\). CAVI iterates these updates to convergence.
</div>

For exponential family models with conjugate structure, the CAVI updates are available in closed form and reduce to updating natural parameters of the variational distributions.

## 10.3 Stochastic Gradient Variational Bayes

For large datasets, the ELBO sum over \(n\) observations is expensive to compute. **Stochastic gradient variational Bayes (SGVB)** uses mini-batches and the **reparameterization trick** to obtain low-variance gradient estimates.

If \(\boldsymbol{\theta} = g_\phi(\boldsymbol{\epsilon})\) for \(\boldsymbol{\epsilon} \sim p(\boldsymbol{\epsilon})\) independent of \(\phi\) (a differentiable reparameterization), then

\[
\nabla_\phi\, E_{q_\phi}[f(\boldsymbol{\theta})] = E_{p(\boldsymbol{\epsilon})}\!\left[\nabla_\phi f(g_\phi(\boldsymbol{\epsilon}))\right].
\]

This expectation is estimated by Monte Carlo and differentiated by automatic differentiation, enabling gradient ascent on \(\mathcal{L}(\phi)\). For Gaussian \(q_\phi = \mathcal{N}(\boldsymbol{\mu}, \boldsymbol{\Sigma})\), the reparameterization is \(\boldsymbol{\theta} = \boldsymbol{\mu} + \mathbf{L}\boldsymbol{\epsilon}\), where \(\mathbf{L}\mathbf{L}^\top = \boldsymbol{\Sigma}\).

**Variational autoencoders (VAEs)** use this technique with neural network encoders and decoders; the encoder outputs \((\boldsymbol{\mu}_\phi(y), \boldsymbol{\Sigma}_\phi(y))\) and the decoder models \(p_\theta(y \mid z)\).

## 10.4 Approximate Bayesian Computation

In some models, the likelihood \(p(\mathbf{y} \mid \boldsymbol{\theta})\) is intractable but data can be simulated from the model. **Approximate Bayesian computation (ABC)** replaces likelihood evaluation with simulation.

<div class="definition">
<strong>ABC Rejection Algorithm.</strong>
<ol>
<li>Draw \(\boldsymbol{\theta}^* \sim p(\boldsymbol{\theta})\) from the prior.</li>
<li>Simulate \(\mathbf{y}^* \sim p(\cdot \mid \boldsymbol{\theta}^*)\).</li>
<li>Accept \(\boldsymbol{\theta}^*\) if \(\rho(S(\mathbf{y}^*), S(\mathbf{y})) \le \varepsilon\), where \(S\) is a summary statistic vector, \(\rho\) is a distance, and \(\varepsilon > 0\) is a tolerance.</li>
</ol>

The resulting sample approximates the <em>ABC posterior</em> \(p_\varepsilon(\boldsymbol{\theta} \mid \mathbf{y}) \propto P(\rho(S(\mathbf{y}^*), S(\mathbf{y})) \le \varepsilon \mid \boldsymbol{\theta})\,p(\boldsymbol{\theta})\).
</div>

As \(\varepsilon \to 0\), the ABC posterior converges to the exact posterior only if \(S\) is a sufficient statistic. In practice, \(S\) is a lower-dimensional summary chosen to retain information about \(\boldsymbol{\theta}\).

**ABC-MCMC** embeds the acceptance step within a Metropolis scheme, targeting the ABC posterior. **Synthetic likelihood** (Wood, 2010) replaces the indicator \(\mathbf{1}[\rho \le \varepsilon]\) with a Gaussian likelihood for \(S(\mathbf{y}^*)\), running MH on the resulting approximation to \(p(S(\mathbf{y}) \mid \boldsymbol{\theta})\).

## 10.5 Normalizing Flows

**Normalizing flows** construct flexible variational approximations by transforming a simple base density \(p(\boldsymbol{\epsilon})\) through a sequence of invertible differentiable maps \(f = f_K \circ \cdots \circ f_1\).

<div class="definition">
<strong>Normalizing Flow.</strong> Let \(\boldsymbol{\epsilon} \sim p(\boldsymbol{\epsilon})\) and \(\boldsymbol{\theta} = f(\boldsymbol{\epsilon})\). The transformed density is

\[
q(\boldsymbol{\theta}) = p\!\left(f^{-1}(\boldsymbol{\theta})\right)\left|\det \nabla f^{-1}(\boldsymbol{\theta})\right|.
\]

For a composition \(f = f_K \circ \cdots \circ f_1\),

\[
\log q(\boldsymbol{\theta}) = \log p(\boldsymbol{\epsilon}) - \sum_{k=1}^{K} \log \left|\det \mathbf{J}_{f_k}(\boldsymbol{\epsilon}_{k-1})\right|,
\]

where \(\boldsymbol{\epsilon}_{k} = f_k(\boldsymbol{\epsilon}_{k-1})\).
</div>

Popular flow architectures include **planar flows**, **RealNVP** (affine coupling layers with triangular Jacobians), and **autoregressive flows**. The ELBO can be maximized via gradient ascent using the reparameterization gradient, as each \(f_k\) is differentiable and invertible. Normalizing flows offer richer approximations than mean-field VI at the cost of more complex architectures and longer training times.

<div class="remark">
The connection between normalizing flows and variational inference has driven substantial progress in probabilistic deep learning. Modern implementations in probabilistic programming languages (Pyro, NumPyro, TensorFlow Probability) allow automatic construction of flow-based variational posteriors alongside HMC-based posteriors, enabling direct comparison of approximate and exact (asymptotically exact) inference.
</div>
