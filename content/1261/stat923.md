---
title: "STAT 923: Multivariate Analysis"
prof: "Peijun Sang"
subjects: "STAT"
---

## Sources and References
**Primary texts** — T.W. Anderson, *An Introduction to Multivariate Statistical Analysis* (3rd ed., Wiley, 2003); R.A. Johnson and D.W. Wichern, *Applied Multivariate Statistical Analysis* (6th ed., Prentice Hall, 2007); A.J. Izenman, *Modern Multivariate Statistical Techniques* (Springer, 2008).
**Online resources** — Stanford STATS 306B (Applied Multivariate Analysis) lecture notes; Carnegie Mellon 36-465/665 Multivariate Statistics notes; MIT 18.650 Statistics for Applications (multivariate chapters).

---

# Chapter 1: The Multivariate Normal Distribution

## 1.1 Motivation and Setup

Classical univariate statistical methods are inadequate when observations consist of several measurements recorded simultaneously on each subject. In such settings the variables are typically correlated, and treating them independently discards important structural information. Multivariate analysis provides a unified framework for inference on the joint distribution of \(p\) random variables, with the multivariate normal distribution playing the same central role that the univariate normal plays in classical statistics.

Throughout these notes we work with \(p\)-dimensional column vectors. If \(X = (X_1, \dots, X_p)^\top\) is a random vector, we write \(\mathbf{E}[X] = \mu \in \mathbb{R}^p\) for its mean vector and \(\text{Cov}(X) = \Sigma\) for its \(p \times p\) covariance matrix, where \(\Sigma_{ij} = \text{Cov}(X_i, X_j)\). A covariance matrix is always symmetric and positive semidefinite; when it is positive definite we write \(\Sigma \succ 0\).

## 1.2 Definition via the Density

<div class="definition">
<strong>Definition 1.1 (Multivariate Normal Distribution).</strong> A random vector \(X \in \mathbb{R}^p\) follows the <em>multivariate normal distribution</em> with mean vector \(\mu \in \mathbb{R}^p\) and positive definite covariance matrix \(\Sigma \in \mathbb{R}^{p \times p}\), written \(X \sim N_p(\mu, \Sigma)\), if its density is

\[
f(x) = \frac{1}{(2\pi)^{p/2} |\Sigma|^{1/2}} \exp\!\left( -\frac{1}{2}(x - \mu)^\top \Sigma^{-1}(x - \mu) \right), \quad x \in \mathbb{R}^p.
\]

When \(\Sigma\) is only positive semidefinite, the distribution is called <em>singular multivariate normal</em> and is concentrated on a lower-dimensional affine subspace; we do not treat this degenerate case in detail.
</div>

The scalar quantity \((x - \mu)^\top \Sigma^{-1}(x - \mu)\) appears repeatedly and deserves its own name.

<div class="definition">
<strong>Definition 1.2 (Mahalanobis Distance).</strong> The <em>Mahalanobis distance</em> from a point \(x \in \mathbb{R}^p\) to the distribution \(N_p(\mu, \Sigma)\) is

\[
d_M(x, \mu) = \sqrt{(x - \mu)^\top \Sigma^{-1}(x - \mu)}.
\]

When \(\Sigma = I\) this reduces to ordinary Euclidean distance. The level sets \(\{x : d_M(x, \mu)^2 = c\}\) are ellipsoids aligned with the eigenvectors of \(\Sigma\), scaled inversely with the eigenvalues.
</div>

## 1.3 The Moment Generating Function

<div class="theorem">
<strong>Theorem 1.3.</strong> If \(X \sim N_p(\mu, \Sigma)\), then the moment generating function of \(X\) is

\[
M_X(t) = \mathbf{E}\!\left[ e^{t^\top X} \right] = \exp\!\left( t^\top \mu + \frac{1}{2} t^\top \Sigma t \right), \quad t \in \mathbb{R}^p.
\]
</div>

<div class="proof">
<strong>Proof.</strong> We complete the square in the exponent of the integrand. Write

\[
M_X(t) = \int_{\mathbb{R}^p} \frac{e^{t^\top x}}{(2\pi)^{p/2}|\Sigma|^{1/2}} \exp\!\left(-\frac{1}{2}(x-\mu)^\top\Sigma^{-1}(x-\mu)\right) dx.
\]

The combined exponent is

\[
t^\top x - \frac{1}{2}(x-\mu)^\top\Sigma^{-1}(x-\mu).
\]

Set \(u = x - \mu\) so that \(t^\top x = t^\top u + t^\top \mu\). Then

\[
t^\top u + t^\top \mu - \frac{1}{2} u^\top \Sigma^{-1} u = t^\top \mu + \frac{1}{2}t^\top \Sigma t - \frac{1}{2}(u - \Sigma t)^\top \Sigma^{-1}(u - \Sigma t).
\]

The first two terms are constants. The integral over \(u\) of the remaining Gaussian kernel equals 1 (it is the integral of a \(N_p(\Sigma t, \Sigma)\) density), giving \(M_X(t) = \exp(t^\top \mu + \frac{1}{2}t^\top \Sigma t)\). \(\square\)
</div>

The MGF uniquely characterizes the distribution. In particular, \(X \sim N_p(\mu, \Sigma)\) if and only if \(a^\top X \sim N(a^\top \mu, a^\top \Sigma a)\) for every fixed \(a \in \mathbb{R}^p\) — a characterization we exploit next.

## 1.4 Affine Transformations

<div class="theorem">
<strong>Theorem 1.4 (Affine Stability).</strong> Let \(X \sim N_p(\mu, \Sigma)\). For any fixed matrix \(A \in \mathbb{R}^{q \times p}\) and vector \(b \in \mathbb{R}^q\), the transformed random vector \(Y = AX + b\) satisfies

\[
Y \sim N_q\!\left(A\mu + b,\; A\Sigma A^\top\right).
\]
</div>

<div class="proof">
<strong>Proof.</strong> The MGF of \(Y\) at \(s \in \mathbb{R}^q\) is

\[
M_Y(s) = \mathbf{E}\!\left[e^{s^\top Y}\right] = e^{s^\top b}\, \mathbf{E}\!\left[e^{(A^\top s)^\top X}\right] = e^{s^\top b} \cdot \exp\!\left((A^\top s)^\top \mu + \frac{1}{2}(A^\top s)^\top \Sigma (A^\top s)\right).
\]

This simplifies to \(\exp\!\left(s^\top(A\mu + b) + \frac{1}{2}s^\top A\Sigma A^\top s\right)\), which is the MGF of \(N_q(A\mu + b, A\Sigma A^\top)\). \(\square\)
</div>

A direct consequence is that every marginal distribution of a multivariate normal is again multivariate normal: partition \(X = (X_1^\top, X_2^\top)^\top\) with \(X_1 \in \mathbb{R}^{p_1}\), \(X_2 \in \mathbb{R}^{p_2}\), \(p_1 + p_2 = p\). Partition \(\mu\) and \(\Sigma\) conformably:

\[
\mu = \begin{pmatrix}\mu_1 \\ \mu_2\end{pmatrix}, \quad \Sigma = \begin{pmatrix}\Sigma_{11} & \Sigma_{12} \\ \Sigma_{21} & \Sigma_{22}\end{pmatrix}.
\]

Setting \(A = (I_{p_1}, 0)\) gives \(X_1 \sim N_{p_1}(\mu_1, \Sigma_{11})\).

## 1.5 Conditional Distributions

<div class="theorem">
<strong>Theorem 1.5 (Conditional MVN).</strong> Let \((X_1^\top, X_2^\top)^\top \sim N_p(\mu, \Sigma)\) with \(\Sigma_{22} \succ 0\). Then the conditional distribution of \(X_1\) given \(X_2 = x_2\) is

\[
X_1 \mid X_2 = x_2 \;\sim\; N_{p_1}\!\left(\mu_{1|2},\; \Sigma_{1|2}\right),
\]

where

\[
\mu_{1|2} = \mu_1 + \Sigma_{12}\Sigma_{22}^{-1}(x_2 - \mu_2), \qquad \Sigma_{1|2} = \Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> We use a standard conditioning technique: subtract the linear predictor of \(X_1\) from \(X_2\). Define

\[
Z = X_1 - \Sigma_{12}\Sigma_{22}^{-1} X_2.
\]

By Theorem 1.4, \(Z\) is a linear function of \(X\) and hence normal. Its mean is \(\mu_1 - \Sigma_{12}\Sigma_{22}^{-1}\mu_2\). Its covariance with \(X_2\) is

\[
\text{Cov}(Z, X_2) = \text{Cov}(X_1, X_2) - \Sigma_{12}\Sigma_{22}^{-1}\text{Cov}(X_2, X_2) = \Sigma_{12} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{22} = 0.
\]

Since \(Z\) and \(X_2\) are jointly normal and uncorrelated, they are independent. Therefore

\[
X_1 \mid X_2 = x_2 \;=\; Z + \Sigma_{12}\Sigma_{22}^{-1} X_2 \;\Big|_{X_2 = x_2} \;=\; Z + \Sigma_{12}\Sigma_{22}^{-1}x_2,
\]

and since \(Z\) is independent of \(X_2\), conditioning replaces \(X_2\) by the constant \(x_2\). The conditional mean is \(\mathbf{E}[Z] + \Sigma_{12}\Sigma_{22}^{-1}x_2 = \mu_1 - \Sigma_{12}\Sigma_{22}^{-1}\mu_2 + \Sigma_{12}\Sigma_{22}^{-1}x_2 = \mu_1 + \Sigma_{12}\Sigma_{22}^{-1}(x_2 - \mu_2)\). The conditional variance is \(\text{Var}(Z) = \Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\). \(\square\)
</div>

<div class="remark">
<strong>Remark 1.6.</strong> The matrix \(\Sigma_{1|2} = \Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\) is the <em>Schur complement</em> of \(\Sigma_{22}\) in \(\Sigma\). It is always positive semidefinite, and positive definite when \(\Sigma \succ 0\). The conditional mean \(\mu_{1|2}\) is the best linear predictor of \(X_1\) from \(X_2\) in the mean-squared-error sense, and in the Gaussian case it is also the best (not just best linear) predictor.
</div>

## 1.6 Quadratic Forms and the Chi-Squared Distribution

<div class="theorem">
<strong>Theorem 1.7.</strong> If \(X \sim N_p(\mu, \Sigma)\) with \(\Sigma \succ 0\), then

\[
(X - \mu)^\top \Sigma^{-1}(X - \mu) \;\sim\; \chi^2_p.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Write \(\Sigma = \Gamma^\top \Gamma\) (Cholesky). Set \(Z = \Gamma^{-\top}(X - \mu)\). Then \(Z \sim N_p(0, I_p)\), and \((X-\mu)^\top \Sigma^{-1}(X-\mu) = Z^\top Z = \sum_{i=1}^p Z_i^2\). Since \(Z_1, \dots, Z_p\) are i.i.d. \(N(0,1)\), their sum of squares is \(\chi^2_p\). \(\square\)
</div>

This result underpins most hypothesis tests in multivariate analysis: test statistics are often quadratic forms in sample means, and their null distributions are related to the chi-squared distribution.

## 1.7 Independence and Zero Correlation

<div class="theorem">
<strong>Theorem 1.8.</strong> Let \((X_1^\top, X_2^\top)^\top \sim N_p(\mu, \Sigma)\). Then \(X_1\) and \(X_2\) are independent if and only if \(\Sigma_{12} = 0\).
</div>

This theorem is a hallmark of the Gaussian distribution. In general, uncorrelated random variables need not be independent; the Gaussian case is the notable exception. The proof follows immediately from the joint density factoring into the product of marginal densities exactly when \(\Sigma_{12} = 0\), or equivalently from the independence of \(Z\) and \(X_2\) established in the proof of Theorem 1.5.

---

# Chapter 2: Inference on Mean Vectors

## 2.1 Sample Mean and Sample Covariance Matrix

Let \(X_1, \dots, X_n\) be i.i.d. \(N_p(\mu, \Sigma)\). The sufficient statistics for \((\mu, \Sigma)\) are the **sample mean vector**

\[
\bar{X} = \frac{1}{n} \sum_{i=1}^n X_i
\]

and the **sample covariance matrix**

\[
S = \frac{1}{n-1}\sum_{i=1}^n (X_i - \bar{X})(X_i - \bar{X})^\top.
\]

By the multivariate central limit theorem (and directly from the Gaussian assumption), \(\bar{X} \sim N_p(\mu, \Sigma/n)\). The matrix \(S\) is unbiased: \(\mathbf{E}[S] = \Sigma\).

The **maximum likelihood estimators** are \(\hat{\mu} = \bar{X}\) and \(\hat{\Sigma} = \frac{n-1}{n}S\) (the biased version). The MLE \(\hat{\Sigma}\) is consistent as \(n \to \infty\) with \(p\) fixed.

## 2.2 Hotelling's \(T^2\) Statistic

To test \(H_0: \mu = \mu_0\) against \(H_1: \mu \neq \mu_0\), the natural generalization of the univariate \(t\)-statistic is Hotelling's \(T^2\).

<div class="definition">
<strong>Definition 2.1 (Hotelling's \(T^2\)).</strong> Given \(X_1, \dots, X_n\) i.i.d. \(N_p(\mu, \Sigma)\) with \(\Sigma\) unknown, <em>Hotelling's \(T^2\) statistic</em> is

\[
T^2 = n(\bar{X} - \mu_0)^\top S^{-1}(\bar{X} - \mu_0).
\]
</div>

<div class="theorem">
<strong>Theorem 2.2 (Distribution of \(T^2\)).</strong> Under \(H_0: \mu = \mu_0\),

\[
\frac{n - p}{p(n-1)} T^2 \;\sim\; F_{p,\, n-p}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Under \(H_0\), set \(Z = \sqrt{n}(\bar{X} - \mu_0)\). Then \(Z \sim N_p(0, \Sigma)\). Independently, \((n-1)S \sim W_p(n-1, \Sigma)\) (the Wishart distribution, discussed in Chapter 3). Write

\[
T^2 = Z^\top \!\left(\frac{(n-1)S}{n-1}\right)^{-1} Z \;=\; Z^\top S^{-1}Z.
\]

Factor \(\Sigma = \Gamma^\top \Gamma\) and set \(W = \Gamma^{-\top}Z \sim N_p(0, I)\) and \(M = \Gamma^{-\top}(n-1)S\Gamma^{-1} \sim W_p(n-1, I)\). Then

\[
T^2 = W^\top M^{-1} W \cdot (n-1).
\]

The quantity \(W^\top M^{-1}W / p\) follows an \(F_{p, n-p}\) distribution by the multivariate analogue of the \(t\)-to-\(F\) relationship (since \(\|W\|^2 \sim \chi^2_p\) and \(M\) is a Wishart matrix). After algebra, \(\frac{n-p}{p(n-1)}T^2 \sim F_{p,n-p}\). \(\square\)
</div>

The test rejects \(H_0\) at level \(\alpha\) when \(\frac{n-p}{p(n-1)}T^2 > F_{p, n-p, \alpha}\).

<div class="example">
<strong>Example 2.3.</strong> A nutritionist measures \(p = 3\) variables (protein intake, calcium intake, iron intake) on \(n = 40\) subjects. The sample mean is \(\bar{x} = (72, 950, 15)^\top\) (in appropriate units) and \(S\) is computed from the data. To test whether the population mean equals the recommended daily allowance \(\mu_0 = (70, 1000, 18)^\top\), compute

\[
T^2 = 40 \cdot (\bar{x} - \mu_0)^\top S^{-1}(\bar{x} - \mu_0).
\]

Suppose this yields \(T^2 = 12.4\). Then \(\frac{40 - 3}{3 \cdot 39} \cdot 12.4 = \frac{37}{117} \cdot 12.4 \approx 3.92\). The critical value is \(F_{3, 37, 0.05} \approx 2.86\), so we reject \(H_0\) at the 5% level and conclude the population mean differs significantly from the recommended values.
</div>

## 2.3 Two-Sample Hotelling's \(T^2\)

Suppose we have two independent samples: \(X_1, \dots, X_{n_1}\) i.i.d. \(N_p(\mu_1, \Sigma)\) and \(Y_1, \dots, Y_{n_2}\) i.i.d. \(N_p(\mu_2, \Sigma)\), with a common (unknown) covariance matrix \(\Sigma\). We test \(H_0: \mu_1 = \mu_2\).

The **pooled sample covariance matrix** is

\[
S_p = \frac{(n_1 - 1)S_1 + (n_2 - 1)S_2}{n_1 + n_2 - 2},
\]

and the two-sample Hotelling statistic is

\[
T^2 = \frac{n_1 n_2}{n_1 + n_2}(\bar{X} - \bar{Y})^\top S_p^{-1}(\bar{X} - \bar{Y}).
\]

Under \(H_0\), \(\frac{n_1 + n_2 - p - 1}{p(n_1 + n_2 - 2)} T^2 \sim F_{p,\, n_1 + n_2 - p - 1}\).

## 2.4 One-Way MANOVA

**MANOVA** (Multivariate Analysis of Variance) generalizes one-way ANOVA to the multivariate setting. Suppose we have \(g\) groups with \(n_k\) observations in group \(k\), \(n = \sum_k n_k\), and the model is

\[
X_{ki} = \mu + \tau_k + \varepsilon_{ki}, \quad \varepsilon_{ki} \overset{\text{i.i.d.}}{\sim} N_p(0, \Sigma), \quad k = 1,\dots,g, \quad i = 1,\dots,n_k.
\]

We test \(H_0: \tau_1 = \cdots = \tau_g = 0\) (equivalently, all group means are equal).

Define the **between-group** sum-of-squares matrix

\[
B = \sum_{k=1}^g n_k (\bar{X}_k - \bar{X})(\bar{X}_k - \bar{X})^\top
\]

and the **within-group** sum-of-squares matrix

\[
W = \sum_{k=1}^g \sum_{i=1}^{n_k} (X_{ki} - \bar{X}_k)(X_{ki} - \bar{X}_k)^\top.
\]

Under \(H_0\), \(W \sim W_p(n - g, \Sigma)\) and \(B\) is independently distributed as \(W_p(g-1, \Sigma)\) (approximately). The four standard MANOVA test statistics are based on the eigenvalues \(\lambda_1 \geq \cdots \geq \lambda_s > 0\) of \(W^{-1}B\) where \(s = \min(p, g-1)\):

<div class="definition">
<strong>Definition 2.4 (MANOVA Test Statistics).</strong> Let \(\lambda_1 \geq \cdots \geq \lambda_s\) be the eigenvalues of \(W^{-1}B\), and \(\theta_i = \lambda_i/(1 + \lambda_i)\).

<ol>
<li><strong>Wilks' Lambda:</strong>

\[
\Lambda = \frac{|W|}{|W + B|} = \prod_{i=1}^s \frac{1}{1 + \lambda_i} = \prod_{i=1}^s (1 - \theta_i).
\]

Small values indicate departure from \(H_0\). Bartlett's approximation: \(-\left(n - 1 - \frac{p+g}{2}\right)\ln\Lambda \approx \chi^2_{p(g-1)}\) under \(H_0\).</li>

<li><strong>Pillai's Trace:</strong>

\[
V = \sum_{i=1}^s \theta_i = \text{tr}\!\left[B(W+B)^{-1}\right].
\]
</li>

<li><strong>Lawley-Hotelling Trace:</strong>

\[
U = \sum_{i=1}^s \lambda_i = \text{tr}(W^{-1}B).
\]
</li>

<li><strong>Roy's Largest Root:</strong>

\[
\theta_{\max} = \max_i \theta_i = \frac{\lambda_1}{1 + \lambda_1}.
\]

Roy's statistic provides an upper bound on the \(F\)-statistic for any linear combination of the group means.</li>
</ol>
</div>

<div class="remark">
<strong>Remark 2.5.</strong> When \(g = 2\), all four statistics reduce to a monotone function of Hotelling's two-sample \(T^2\), and thus agree on the same test. When \(g > 2\) they differ, and their power properties diverge: Pillai's trace is the most robust to departures from normality; Wilks' lambda is most commonly used and has an exact \(F\)-distribution in certain cases; Roy's largest root is the most powerful when the true difference lies in a single direction.
</div>

---

# Chapter 3: The Wishart Distribution and Covariance Testing

## 3.1 Wishart Distribution

<div class="definition">
<strong>Definition 3.1 (Wishart Distribution).</strong> Let \(Z_1, \dots, Z_n \overset{\text{i.i.d.}}{\sim} N_p(0, \Sigma)\). The distribution of

\[
W = \sum_{i=1}^n Z_i Z_i^\top
\]

is called the <em>Wishart distribution</em> with \(n\) degrees of freedom and scale matrix \(\Sigma\), written \(W \sim W_p(n, \Sigma)\). We require \(n \geq p\) for \(W\) to be almost surely positive definite.
</div>

Key properties follow directly from the construction:

1. **Additivity:** If \(W_1 \sim W_p(n_1, \Sigma)\) and \(W_2 \sim W_p(n_2, \Sigma)\) independently, then \(W_1 + W_2 \sim W_p(n_1 + n_2, \Sigma)\).

2. **Scaling:** If \(W \sim W_p(n, \Sigma)\) and \(A\) is \(q \times p\), then \(AWA^\top \sim W_q(n, A\Sigma A^\top)\).

3. **Connection to sample covariance:** If \(X_1, \dots, X_n \overset{\text{i.i.d.}}{\sim} N_p(\mu, \Sigma)\), then \((n-1)S \sim W_p(n-1, \Sigma)\) and is independent of \(\bar{X}\). This is the multivariate analogue of \((n-1)s^2/\sigma^2 \sim \chi^2_{n-1}\) being independent of \(\bar{x}\) in univariate statistics.

4. **Mean:** \(\mathbf{E}[W] = n\Sigma\).

## 3.2 Likelihood Ratio Test for \(\Sigma = \Sigma_0\)

Suppose \(X_1, \dots, X_n \overset{\text{i.i.d.}}{\sim} N_p(\mu, \Sigma)\) with \(\mu\) unknown. We test \(H_0: \Sigma = \Sigma_0\) against \(H_1: \Sigma \neq \Sigma_0\).

The log-likelihood ratio statistic can be shown to equal

\[
-2\ln\Lambda = n\!\left[\text{tr}(\Sigma_0^{-1}S) - \ln|\Sigma_0^{-1}S| - p\right],
\]

where \(S = \frac{1}{n}\sum_i (X_i - \bar{X})(X_i - \bar{X})^\top\) (the MLE). Under \(H_0\), by Wilks' theorem, \(-2\ln\Lambda \xrightarrow{d} \chi^2_{p(p+1)/2}\) as \(n \to \infty\). **Bartlett's correction** modifies the multiplier from \(n\) to \(n - 1 - \frac{2p+1}{6}\) for better finite-sample chi-squared approximation.

## 3.3 Tests for Sphericity and Independence

**Sphericity:** \(H_0: \Sigma = \sigma^2 I\) for some unknown \(\sigma^2 > 0\). This tests whether all variables have equal variance and are uncorrelated. The **Mauchly test** statistic is

\[
W_M = \frac{|S|}{(\text{tr}(S)/p)^p},
\]

which equals 1 when \(S\) is a scalar multiple of the identity and is less than 1 otherwise. Under \(H_0\), an appropriate function of \(W_M\) is approximately chi-squared with \(p(p+1)/2 - 1\) degrees of freedom.

**Independence (block diagonal \(\Sigma\)):** Partition the variables into groups and test whether the cross-group covariances are all zero. For the two-group case \(\Sigma = \begin{pmatrix}\Sigma_{11} & \Sigma_{12} \\ \Sigma_{21} & \Sigma_{22}\end{pmatrix}\), we test \(H_0: \Sigma_{12} = 0\). The LRT statistic is

\[
\Lambda = \frac{|S|}{|S_{11}||S_{22}|},
\]

and under \(H_0\), \(-n\ln\Lambda\) is approximately chi-squared with \(p_1 p_2\) degrees of freedom.

## 3.4 High-Dimensional Covariance Estimation

When the dimension \(p\) is comparable to or larger than the sample size \(n\), the sample covariance matrix \(S\) becomes unreliable as an estimator of \(\Sigma\).

**Random Matrix Theory:** When \(p/n \to c \in (0, \infty)\), the empirical spectral distribution of \(S\) converges to the **Marchenko-Pastur law** with density

\[
f_{MP}(\lambda) = \frac{\sqrt{(\lambda_+ - \lambda)(\lambda - \lambda_-)}}{2\pi c \lambda}, \quad \lambda \in [\lambda_-, \lambda_+],
\]

where \(\lambda_\pm = (1 \pm \sqrt{c})^2\). This means that even when \(\Sigma = I\), the sample eigenvalues spread from \((1-\sqrt{c})^2\) to \((1+\sqrt{c})^2\). The largest sample eigenvalue is inflated and the smallest are deflated — \(S\) is a poor estimator of \(\Sigma\) in the high-dimensional regime.

**Regularized Estimators:**

1. **Ridge (Ledoit-Wolf shrinkage):** Replace \(S\) by \(\hat{\Sigma}_\delta = (1-\delta)S + \delta I\) for some \(\delta \in (0,1)\). The optimal \(\delta\) minimizes the expected Frobenius loss \(\mathbf{E}\|\hat{\Sigma}_\delta - \Sigma\|_F^2\) and can be estimated consistently from data (Ledoit-Wolf formula).

2. **Factor model covariance (POET):** Decompose \(\hat{\Sigma} = \hat{\Lambda}\hat{\Lambda}^\top + \hat{\Psi}\) where \(\hat{\Lambda}\) captures the \(K\) leading principal components and \(\hat{\Psi}\) is a diagonal or sparse residual. This is useful when \(\Sigma\) has a low-rank plus sparse structure.

3. **Graphical LASSO (GLASSO):** Estimate the **precision matrix** \(\Omega = \Sigma^{-1}\) by solving the \(\ell_1\)-penalized log-likelihood problem:

\[
\hat{\Omega} = \operatorname*{arg\,max}_{\Omega \succ 0} \left[ \log|\Omega| - \text{tr}(S\Omega) - \lambda \|\Omega\|_1 \right],
\]

where \(\|\Omega\|_1 = \sum_{i \neq j}|\Omega_{ij}|\). Zeros in \(\hat{\Omega}\) correspond to conditional independence relations in the Gaussian graphical model. The GLASSO estimator is consistent under sparsity assumptions on \(\Omega\).

---

# Chapter 4: Principal Component Analysis

## 4.1 Population PCA

Let \(X \in \mathbb{R}^p\) be a random vector with \(\text{Cov}(X) = \Sigma \succ 0\). The goal of **Principal Component Analysis (PCA)** is to find linear combinations of \(X\) that successively capture as much variance as possible.

<div class="definition">
<strong>Definition 4.1.</strong> The <em>first principal component</em> is \(Y_1 = a_1^\top X\) where

\[
a_1 = \operatorname*{arg\,max}_{\|a\|=1} \text{Var}(a^\top X) = \operatorname*{arg\,max}_{\|a\|=1} a^\top \Sigma a.
\]

The <em>k-th principal component</em> is \(Y_k = a_k^\top X\) where

\[
a_k = \operatorname*{arg\,max}_{\substack{\|a\|=1 \\ a \perp a_1, \dots, a_{k-1}}} a^\top \Sigma a.
\]
</div>

<div class="theorem">
<strong>Theorem 4.2 (Spectral Theorem for PCA).</strong> Let \(\Sigma = \Gamma \Lambda \Gamma^\top\) be the eigendecomposition of \(\Sigma\), where \(\Lambda = \text{diag}(\lambda_1, \dots, \lambda_p)\) with \(\lambda_1 \geq \cdots \geq \lambda_p > 0\) and \(\Gamma = [\gamma_1, \dots, \gamma_p]\) is orthogonal. Then the \(k\)-th principal component direction is \(a_k = \gamma_k\) (the \(k\)-th eigenvector of \(\Sigma\)), and \(\text{Var}(Y_k) = \lambda_k\). The principal components \(Y_1, \dots, Y_p\) are uncorrelated.
</div>

<div class="proof">
<strong>Proof.</strong> For the first PC, by the method of Lagrange multipliers, maximizing \(a^\top \Sigma a\) subject to \(a^\top a = 1\) gives the Lagrangian \(a^\top \Sigma a - \lambda(a^\top a - 1)\). Differentiating and setting to zero: \(2\Sigma a = 2\lambda a\), so \(\Sigma a = \lambda a\). Thus \(a\) must be an eigenvector of \(\Sigma\). Since \(a^\top \Sigma a = \lambda\) and we maximize, we choose \(a_1 = \gamma_1\) (eigenvector for largest eigenvalue \(\lambda_1\)). The same argument applies inductively for the \(k\)-th PC with the orthogonality constraint. Uncorrelatedness follows from \(\text{Cov}(Y_j, Y_k) = \gamma_j^\top \Sigma \gamma_k = \lambda_k \gamma_j^\top \gamma_k = 0\) for \(j \neq k\). \(\square\)
</div>

**Proportion of variance explained** by the first \(k\) PCs:

\[
\text{PVE}(k) = \frac{\sum_{i=1}^k \lambda_i}{\sum_{i=1}^p \lambda_i} = \frac{\sum_{i=1}^k \lambda_i}{\text{tr}(\Sigma)}.
\]

## 4.2 Choosing the Number of Components

Several criteria exist for choosing \(k\):

1. **Scree plot:** Plot \(\lambda_i\) versus \(i\). Look for an "elbow" — a point where the eigenvalues level off.

2. **Cumulative variance threshold:** Choose the smallest \(k\) such that \(\text{PVE}(k) \geq 0.80\) (or some other threshold, commonly 80–90%).

3. **Kaiser's rule:** Retain components with \(\lambda_i > 1\) when working with the correlation matrix (standardized PCA). The intuition is that a component should explain more variance than a single original variable.

4. **Parallel analysis:** Compare sample eigenvalues to eigenvalues from simulated random data of the same dimensions to assess significance.

## 4.3 Sample PCA via SVD

Given data matrix \(\mathbf{X} \in \mathbb{R}^{n \times p}\) (centered so each column has mean zero), the sample covariance matrix is \(S = \frac{1}{n-1}\mathbf{X}^\top \mathbf{X}\).

The **Singular Value Decomposition** of \(\mathbf{X}\) is \(\mathbf{X} = U D V^\top\), where \(U \in \mathbb{R}^{n \times r}\) and \(V \in \mathbb{R}^{p \times r}\) have orthonormal columns, and \(D = \text{diag}(d_1, \dots, d_r)\) with \(d_1 \geq \cdots \geq d_r > 0\). Then

\[
S = \frac{1}{n-1}V D^2 V^\top,
\]

so the columns of \(V\) are the sample eigenvectors (loadings), and the sample eigenvalues are \(\hat{\lambda}_i = d_i^2/(n-1)\).

The **PC scores** are \(\mathbf{Z} = \mathbf{X} V\), with the \(k\)-th column \(\mathbf{z}_k = \mathbf{X}v_k\) giving the scores on the \(k\)-th PC. A **biplot** displays both observations (as points using their PC scores) and variables (as arrows using their loadings) in the same low-dimensional space, facilitating interpretation.

## 4.4 PCA as Best Linear Approximation

PCA is also characterized as the best low-rank linear approximation:

<div class="theorem">
<strong>Theorem 4.3 (Eckart-Young).</strong> Among all rank-\(k\) matrices \(L\), the Frobenius-norm minimizer of \(\|\mathbf{X} - L\|_F^2\) is

\[
\hat{L} = U_k D_k V_k^\top,
\]

where the subscript \(k\) denotes retaining only the top \(k\) singular values/vectors.
</div>

This theorem establishes that PCA is not merely a variance-maximization procedure but also an optimal compression method: the first \(k\) principal components provide the best reconstruction of the data in the least-squares sense.

<div class="example">
<strong>Example 4.4.</strong> We apply PCA to a dataset of \(n = 200\) students on \(p = 5\) test scores (mathematics, physics, chemistry, English, history). After centering, the sample eigenvalues are \(\hat{\lambda}_1 = 2.8, \hat{\lambda}_2 = 1.1, \hat{\lambda}_3 = 0.6, \hat{\lambda}_4 = 0.3, \hat{\lambda}_5 = 0.2\). The first two PCs explain \((2.8 + 1.1)/5 = 78\%\) of total variance. By Kaiser's rule (eigenvalues > 1), we retain 2 components. The first loading vector might be approximately \(v_1 \approx (0.45, 0.48, 0.47, 0.37, 0.42)^\top\), representing overall academic ability. The second loading vector might contrast science (positive) against humanities (negative), capturing a subject-preference dimension.
</div>

---

# Chapter 5: Factor Analysis

## 5.1 The Factor Model

Factor analysis posits that the observed \(p\)-dimensional vector \(X\) arises from a small number \(m < p\) of latent factors plus independent noise.

<div class="definition">
<strong>Definition 5.1 (Factor Model).</strong> The <em>orthogonal factor model</em> is

\[
X = \mu + \Lambda f + \varepsilon,
\]

where:
<ul>
<li>\(f \in \mathbb{R}^m\) is the vector of <em>common factors</em>, with \(\mathbf{E}[f] = 0\) and \(\text{Cov}(f) = I_m\);</li>
<li>\(\Lambda \in \mathbb{R}^{p \times m}\) is the <em>loading matrix</em>;</li>
<li>\(\varepsilon \in \mathbb{R}^p\) is the vector of <em>specific (unique) factors</em>, with \(\mathbf{E}[\varepsilon] = 0\), \(\text{Cov}(\varepsilon) = \Psi = \text{diag}(\psi_1, \dots, \psi_p)\);</li>
<li>\(f\) and \(\varepsilon\) are uncorrelated.</li>
</ul>
</div>

Under this model, the covariance structure decomposes as

\[
\Sigma = \text{Cov}(X) = \Lambda\Lambda^\top + \Psi.
\]

For the \(i\)-th variable, \(\text{Var}(X_i) = \sum_{j=1}^m \lambda_{ij}^2 + \psi_i\). The term \(h_i^2 = \sum_{j=1}^m \lambda_{ij}^2\) is the **communality** — the proportion of variance in \(X_i\) explained by the common factors. The residual \(\psi_i\) is the **specific variance**.

## 5.2 Identifiability and Rotational Indeterminacy

The factor model is not identified without additional constraints. For any orthogonal matrix \(T\) (\(TT^\top = I\)), substituting \(\Lambda^* = \Lambda T\) and \(f^* = T^\top f\) gives the same covariance \(\Lambda^*(\Lambda^*)^\top = \Lambda TT^\top \Lambda^\top = \Lambda\Lambda^\top\). Thus loadings are only determined up to orthogonal rotation.

Standard identifiability constraints include:

- **Uniqueness constraint:** \(\Lambda^\top \Psi^{-1}\Lambda\) is diagonal with distinct diagonal entries in decreasing order.
- **Fixed loadings:** Set certain elements of \(\Lambda\) to zero (confirmatory factor analysis).

## 5.3 Estimation

**Method of Principal Factors:** Start with communality estimates \(\hat{h}_i^2\) (initially set to the squared multiple correlation of \(X_i\) on the other variables). Replace the diagonal of \(S\) by \(\hat{h}_i^2\), yielding a reduced correlation matrix \(R^*\). Perform eigendecomposition of \(R^*\) and retain the top \(m\) eigenvectors. Iterate until communalities stabilize.

**Maximum Likelihood Estimation:** Assuming \(X \sim N_p(\mu, \Lambda\Lambda^\top + \Psi)\), maximize the log-likelihood over \((\Lambda, \Psi)\) subject to the identifiability constraint. The MLE satisfies the factor equations:

\[
\hat{\Lambda} = \hat{\Sigma}_\Lambda \hat{\Lambda} \hat{M}^{-1}, \quad \hat{\psi}_i = s_{ii} - \hat{\lambda}_i^\top \hat{\lambda}_i,
\]

where these are iterated until convergence (the EM algorithm provides a natural approach). The MLE allows likelihood ratio tests for the number of factors.

**Testing the number of factors:** Under MLE, the test statistic for \(H_0: m = m_0\) factors is

\[
\chi^2 = \left(n - 1 - \frac{2p + 4m_0 + 5}{6}\right)\ln\frac{|\hat{\Sigma}|}{|S|} \sim \chi^2_{\nu},
\]

where \(\nu = \frac{1}{2}\left[(p-m_0)^2 - (p + m_0)\right]\).

## 5.4 Factor Rotation

After estimating \(\Lambda\), we can apply any orthogonal rotation \(T\) to get \(\Lambda^* = \Lambda T\) without changing model fit (communalities, \(\Psi\), or \(\hat{\Sigma}\) are unchanged). Rotation is used to improve interpretability.

**Varimax rotation** maximizes the variance of the squared loadings within each factor, seeking a "simple structure" where each variable loads highly on one factor and near zero on others:

\[
\text{Varimax criterion} = \sum_{j=1}^m \left[ \frac{1}{p}\sum_{i=1}^p \lambda_{ij}^{*4} - \left(\frac{1}{p}\sum_{i=1}^p \lambda_{ij}^{*2}\right)^2 \right].
\]

**Promax rotation** (oblique) allows factors to be correlated, often yielding cleaner structure at the cost of factor independence.

## 5.5 PCA vs. Factor Analysis

Both methods seek low-dimensional representations, but differ fundamentally:

- **PCA** is a variance decomposition with no model: it finds directions of maximal variance deterministically from the data covariance. There is no error term, and components depend on the scale of variables.
- **Factor Analysis** posits a generative model with latent structure, separates common from specific variance, and the residual \(\Psi\) absorbs variable-specific noise.

In practice, FA is preferred when the goal is to uncover latent constructs (e.g., intelligence factors, personality traits); PCA is preferred for dimensionality reduction and when all variance is of interest.

---

# Chapter 6: Discrimination and Classification

## 6.1 The Classification Problem

We observe \(X \in \mathbb{R}^p\) and wish to assign it to one of \(g\) classes \(\Pi_1, \dots, \Pi_g\). The Bayesian framework specifies prior probabilities \(\pi_k = P(Y = k)\) and class-conditional densities \(f_k(x) = f(x | Y = k)\). By Bayes' theorem, the posterior probability is

\[
P(Y = k | X = x) = \frac{\pi_k f_k(x)}{\sum_{j=1}^g \pi_j f_j(x)}.
\]

The **Bayes optimal classifier** assigns \(x\) to the class with the highest posterior probability, minimizing the overall misclassification rate.

## 6.2 Linear Discriminant Analysis

**LDA** assumes \(f_k(x) = N_p(\mu_k, \Sigma)\) — all classes share the same covariance matrix.

<div class="theorem">
<strong>Theorem 6.1 (LDA Decision Rule).</strong> Under the equal-covariance Gaussian assumption, the Bayes classifier assigns \(x\) to class \(k^*\) where

\[
k^* = \operatorname*{arg\,max}_k \left[ x^\top \Sigma^{-1}\mu_k - \frac{1}{2}\mu_k^\top \Sigma^{-1}\mu_k + \ln\pi_k \right].
\]

The term \(\delta_k(x) = x^\top \Sigma^{-1}\mu_k - \frac{1}{2}\mu_k^\top \Sigma^{-1}\mu_k + \ln\pi_k\) is the <em>linear discriminant function</em> for class \(k\).
</div>

<div class="proof">
<strong>Proof.</strong> Assign \(x\) to class \(k\) if \(\pi_k f_k(x) > \pi_j f_j(x)\) for all \(j \neq k\). Taking logarithms and substituting the Gaussian density:

\[
\ln(\pi_k f_k(x)) = \ln\pi_k - \frac{p}{2}\ln(2\pi) - \frac{1}{2}\ln|\Sigma| - \frac{1}{2}(x - \mu_k)^\top\Sigma^{-1}(x - \mu_k).
\]

Expanding the quadratic: \(-\frac{1}{2}(x - \mu_k)^\top\Sigma^{-1}(x-\mu_k) = x^\top\Sigma^{-1}\mu_k - \frac{1}{2}\mu_k^\top\Sigma^{-1}\mu_k - \frac{1}{2}x^\top\Sigma^{-1}x\). The term \(-\frac{1}{2}x^\top\Sigma^{-1}x\) is the same for all classes and cancels in comparisons. The result is \(\delta_k(x)\). \(\square\)
</div>

The decision boundary between classes \(j\) and \(k\) is \(\{x : \delta_j(x) = \delta_k(x)\}\), which is a **hyperplane** in \(\mathbb{R}^p\) — hence "linear" discriminant analysis.

In practice, \(\Sigma\), \(\mu_k\), and \(\pi_k\) are replaced by estimates: \(\hat{\mu}_k = \bar{X}_k\), \(\hat{\Sigma} = S_p\) (pooled), \(\hat{\pi}_k = n_k/n\).

## 6.3 Fisher's Linear Discriminant

Fisher approached classification differently: find the linear combination \(a^\top X\) that **maximally separates** the classes relative to within-class variance.

<div class="definition">
<strong>Definition 6.2 (Fisher's Criterion).</strong> For two classes, Fisher's linear discriminant maximizes

\[
J(a) = \frac{a^\top B a}{a^\top W a},
\]

where \(B = (\bar{X}_1 - \bar{X}_2)(\bar{X}_1 - \bar{X}_2)^\top\) is the between-class scatter and \(W = (n_1 - 1)S_1 + (n_2 - 1)S_2\) is the within-class scatter.
</div>

<div class="theorem">
<strong>Theorem 6.3.</strong> The maximizer of \(J(a)\) is

\[
a^* \propto W^{-1}(\bar{X}_1 - \bar{X}_2).
\]
</div>

<div class="proof">
<strong>Proof.</strong> Taking the derivative and setting to zero: \(2Ba = \lambda \cdot 2Wa\), i.e., \(Ba = \lambda Wa\). This is a generalized eigenvalue problem. Since \(B = (\bar{X}_1 - \bar{X}_2)(\bar{X}_1 - \bar{X}_2)^\top\) has rank 1, there is only one nonzero eigenvalue. The generalized eigenvector is \(W^{-1}(\bar{X}_1 - \bar{X}_2)\). \(\square\)
</div>

Fisher's approach and the Bayes LDA rule are equivalent when the classes have equal covariance and equal priors, but Fisher's approach remains valid beyond the Gaussian assumption.

## 6.4 Quadratic Discriminant Analysis

**QDA** relaxes the equal-covariance assumption, allowing each class to have its own covariance \(\Sigma_k\). The log-posterior becomes

\[
\delta_k^Q(x) = -\frac{1}{2}\ln|\Sigma_k| - \frac{1}{2}(x-\mu_k)^\top\Sigma_k^{-1}(x-\mu_k) + \ln\pi_k.
\]

The decision boundary between classes is now a **quadratic surface** in \(\mathbb{R}^p\), giving QDA greater flexibility but requiring estimation of \(g \cdot p(p+1)/2\) parameters — substantially more than LDA's \(p(p+1)/2\) for the shared \(\Sigma\).

## 6.5 Misclassification Rates and Cross-Validation

The **apparent error rate (APER)** is the proportion of training observations misclassified by the fitted rule. APER is optimistically biased. **Leave-one-out cross-validation (LOO-CV)** provides a better estimate: for each observation \(i\), fit the classifier on all data except \(i\) and assess whether \(x_i\) is correctly classified. The LOO error rate is nearly unbiased.

**Regularized LDA** for high dimensions: when \(p > n\), \(S_p\) is singular. Remedies include:
- **Ridge-regularized LDA:** Replace \(S_p\) by \(S_p + \delta I\).
- **Diagonal LDA:** Set off-diagonal elements of \(S_p\) to zero (assumes within-class independence).
- **PCA-then-LDA:** First reduce dimension via PCA, then apply LDA in the PC subspace.

---

# Chapter 7: Canonical Correlation Analysis

## 7.1 Setup and Definition

Let \((X^\top, Y^\top)^\top\) where \(X \in \mathbb{R}^p\) and \(Y \in \mathbb{R}^q\) with joint covariance

\[
\Sigma = \begin{pmatrix}\Sigma_{11} & \Sigma_{12} \\ \Sigma_{21} & \Sigma_{22}\end{pmatrix}.
\]

**Canonical Correlation Analysis (CCA)** seeks linear combinations \(U = a^\top X\) and \(V = b^\top Y\) that are maximally correlated.

<div class="definition">
<strong>Definition 7.1 (Canonical Correlations).</strong> The <em>first canonical correlation</em> \(\rho_1^*\) and <em>canonical variates</em> \(U_1 = a_1^\top X\), \(V_1 = b_1^\top Y\) solve

\[
\rho_1^* = \max_{a, b} \text{Cor}(a^\top X, b^\top Y) = \max_{a, b} \frac{a^\top \Sigma_{12} b}{\sqrt{a^\top\Sigma_{11}a}\sqrt{b^\top\Sigma_{22}b}}.
\]

The \(k\)-th canonical correlation \(\rho_k^*\) is defined analogously with the constraint that \(U_k\) is uncorrelated with \(U_1, \dots, U_{k-1}\) and \(V_k\) is uncorrelated with \(V_1, \dots, V_{k-1}\).
</div>

## 7.2 Reduction to a Generalized Eigenvalue Problem

<div class="theorem">
<strong>Theorem 7.2.</strong> The squared canonical correlations \(\rho_1^{*2} \geq \cdots \geq \rho_s^{*2}\) (where \(s = \min(p,q)\)) are the eigenvalues of the matrix

\[
M = \Sigma_{11}^{-1/2}\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\Sigma_{11}^{-1/2}.
\]

The canonical variate weights satisfy \(a_k = \Sigma_{11}^{-1/2}u_k\) and \(b_k = \rho_k^{*-1}\Sigma_{22}^{-1}\Sigma_{21}a_k\), where \(u_k\) is the \(k\)-th eigenvector of \(M\).
</div>

<div class="proof">
<strong>Proof.</strong> Standardize \(\tilde{a} = \Sigma_{11}^{1/2}a\), so \(a^\top\Sigma_{11}a = \tilde{a}^\top\tilde{a} = 1\). Similarly, standardize \(\tilde{b} = \Sigma_{22}^{1/2}b\). The correlation becomes \(\text{Cor}(a^\top X, b^\top Y) = \tilde{a}^\top \Sigma_{11}^{-1/2}\Sigma_{12}\Sigma_{22}^{-1/2}\tilde{b}\). By the Cauchy-Schwarz inequality, this is maximized when \(\tilde{a}\) and \(\tilde{b}\) are aligned with the left and right singular vectors of \(\Sigma_{11}^{-1/2}\Sigma_{12}\Sigma_{22}^{-1/2}\). Let this matrix have SVD \(P D Q^\top\); then \(u_1 = p_1\) and \(\rho_1^* = d_1\) (the largest singular value). The matrix \(M = (P D Q^\top)(Q D P^\top) = P D^2 P^\top\) has the same eigenvectors \(p_k\) with eigenvalues \(d_k^2 = \rho_k^{*2}\). \(\square\)
</div>

Equivalently, the generalized eigenvalue problem is \(\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}u = \rho^2 \Sigma_{11}u\).

## 7.3 Sample CCA and Testing

Replace \(\Sigma\) by the sample covariance \(S\) to obtain sample canonical correlations \(\hat{\rho}_1 \geq \cdots \geq \hat{\rho}_s\).

**Testing significance:** To test that all canonical correlations beyond the first \(k\) are zero, i.e., \(H_0: \rho_{k+1} = \cdots = \rho_s = 0\), Bartlett's chi-squared approximation uses

\[
\chi^2 = -\left(n - 1 - \frac{p + q + 1}{2}\right)\sum_{i=k+1}^s \ln(1 - \hat{\rho}_i^2) \;\sim\; \chi^2_{(p-k)(q-k)}.
\]

A sequential testing procedure starts with \(k=0\) and proceeds until the test fails to reject.

**Connections:** CCA generalizes multiple regression (take \(q = 1\)) and PCA (take \(Y = X\)). The first canonical correlation between \(X\) and \(Y\) equals the multiple correlation coefficient \(R\) when \(q = 1\). When \(p = q\) and \(\Sigma_{11} = \Sigma_{22}\), the canonical variates reduce to PCA on the cross-covariance structure.

---

# Chapter 8: Clustering

## 8.1 Hierarchical Clustering

Hierarchical clustering builds a dendrogram representing nested partitions of the data. Given pairwise distances \(d(x_i, x_j)\) (e.g., Euclidean), the agglomerative algorithm starts with each observation as its own cluster and iteratively merges the two closest clusters. The merge criterion distinguishes the variants:

- **Single linkage (nearest neighbor):** \(d(C_1, C_2) = \min_{x \in C_1, y \in C_2} d(x,y)\). Produces elongated, "chaining" clusters.
- **Complete linkage (farthest neighbor):** \(d(C_1, C_2) = \max_{x \in C_1, y \in C_2} d(x,y)\). Produces compact, roughly equal-sized clusters.
- **Average linkage (UPGMA):** \(d(C_1, C_2) = \frac{1}{|C_1||C_2|}\sum_{x \in C_1, y \in C_2} d(x,y)\). A compromise between single and complete.
- **Ward's method:** Merges the pair of clusters minimizing the increase in total within-cluster sum of squares \(\sum_k \sum_{x \in C_k} \|x - \bar{x}_{C_k}\|^2\). Often produces the most interpretable clusters for Gaussian data.

## 8.2 K-Means Clustering

<div class="definition">
<strong>Definition 8.1 (K-Means Objective).</strong> Given data \(x_1, \dots, x_n \in \mathbb{R}^p\) and a target number of clusters \(K\), <em>K-means clustering</em> minimizes the within-cluster sum of squares:

\[
\min_{\{C_1,\dots,C_K\}} \sum_{k=1}^K \sum_{x_i \in C_k} \left\| x_i - \bar{x}_{C_k} \right\|^2,
\]

where \(\bar{x}_{C_k} = \frac{1}{|C_k|}\sum_{x_i \in C_k} x_i\) is the centroid of cluster \(k\).
</div>

**Lloyd's algorithm:**
1. Initialize cluster centroids \(m_1, \dots, m_K\) (e.g., by random selection of \(K\) data points).
2. **Assignment step:** Assign each \(x_i\) to the nearest centroid: \(c_i = \arg\min_k \|x_i - m_k\|^2\).
3. **Update step:** Recompute centroids \(m_k = \frac{1}{|C_k|}\sum_{i: c_i=k}x_i\).
4. Repeat steps 2–3 until assignments no longer change.

The algorithm converges in finite steps (since there are finitely many partitions) to a local minimum, not necessarily the global minimum. Multiple random restarts with the best final objective are recommended. **K-means++** initialization (choosing centroids proportionally to squared distance from the nearest already-chosen centroid) improves convergence.

## 8.3 Gaussian Mixture Models and the EM Algorithm

A **Gaussian mixture model (GMM)** posits that the data arise from a mixture of \(K\) Gaussian distributions:

\[
f(x) = \sum_{k=1}^K \pi_k \, \phi(x; \mu_k, \Sigma_k),
\]

where \(\phi(x; \mu_k, \Sigma_k)\) is the \(N_p(\mu_k, \Sigma_k)\) density, \(\pi_k > 0\), and \(\sum_k \pi_k = 1\).

The parameters \(\theta = \{(\pi_k, \mu_k, \Sigma_k)\}_{k=1}^K\) are estimated by maximum likelihood. The observed-data log-likelihood \(\sum_i \ln f(x_i)\) is not tractable in closed form due to the log of a sum. The **EM algorithm** introduces the latent class membership \(Z_i \in \{1, \dots, K\}\) and iterates:

**E-step:** Compute the soft assignments (responsibilities)

\[
r_{ik} = \frac{\pi_k \phi(x_i; \mu_k, \Sigma_k)}{\sum_{j=1}^K \pi_j \phi(x_i; \mu_j, \Sigma_j)}.
\]

**M-step:** Update parameters

\[
\hat{\pi}_k = \frac{\sum_i r_{ik}}{n}, \quad \hat{\mu}_k = \frac{\sum_i r_{ik} x_i}{\sum_i r_{ik}}, \quad \hat{\Sigma}_k = \frac{\sum_i r_{ik}(x_i - \hat{\mu}_k)(x_i - \hat{\mu}_k)^\top}{\sum_i r_{ik}}.
\]

The EM algorithm monotonically increases the observed log-likelihood and converges to a local maximum. K-means is the limit of the EM algorithm for GMMs as the covariances \(\Sigma_k \to \epsilon I\) with \(\epsilon \to 0\) (hard assignments).

## 8.4 Model Selection and Validation

**Choosing K:** The **Bayesian Information Criterion (BIC)** for GMMs is

\[
\text{BIC} = -2\hat{\ell} + (\text{number of parameters}) \cdot \ln n,
\]

where \(\hat{\ell}\) is the maximized log-likelihood. Smaller BIC is better. The BIC penalizes model complexity and typically selects parsimonious models.

**Silhouette score:** For each observation \(i\), let \(a_i\) = average distance to points in the same cluster, and \(b_i\) = minimum average distance to points in any other cluster. The silhouette is

\[
s_i = \frac{b_i - a_i}{\max(a_i, b_i)} \in [-1, 1].
\]

Values near 1 indicate a well-classified observation; values near \(-1\) indicate likely misclassification. The average silhouette over all observations provides a summary measure for cluster quality and can guide the choice of \(K\).

**Gap statistic:** Compare the within-cluster sum of squares for the observed data to the expected value under a reference null distribution (data uniformly distributed in a bounding box). The optimal \(K\) is where the gap is largest.

---

# Chapter 9: High-Dimensional PCA and Beyond

## 9.1 The Spiked Covariance Model

Classical PCA theory assumes \(p\) fixed as \(n \to \infty\). When \(p/n \to c > 0\), sample eigenvectors and eigenvalues behave very differently from their population counterparts.

<div class="definition">
<strong>Definition 9.1 (Spiked Covariance Model).</strong> The <em>spiked covariance model</em> (Johnstone, 2001) assumes

\[
\Sigma = \sum_{k=1}^K \alpha_k v_k v_k^\top + I_p,
\]

where \(\alpha_1 \geq \cdots \geq \alpha_K > 0\) are the <em>spikes</em> and \(v_1, \dots, v_K\) are the signal directions. The remaining \(p - K\) population eigenvalues equal 1 (noise).
</div>

## 9.2 The BBP Phase Transition

<div class="theorem">
<strong>Theorem 9.2 (Baik-Ben Arous-Péché, 2005).</strong> Under the spiked covariance model with \(p/n \to c \in (0,\infty)\), for a spike of strength \(\alpha > 0\):

<ul>
<li>If \(\alpha > \sqrt{c}\) (above the phase transition), the largest sample eigenvalue satisfies

\[
\hat{\lambda}_1 \xrightarrow{\text{a.s.}} \left(1 + \alpha\right)\!\left(1 + \frac{c}{\alpha}\right),
\]

and the sample eigenvector \(\hat{v}_1\) is consistent: \(|\hat{v}_1^\top v_1|^2 \to 1 - \frac{c}{\alpha^2} > 0\).</li>

<li>If \(\alpha \leq \sqrt{c}\) (at or below the phase transition), the largest sample eigenvalue converges to the edge of the Marchenko-Pastur bulk \((1 + \sqrt{c})^2\), and \(|\hat{v}_1^\top v_1|^2 \to 0\). The sample eigenvector is asymptotically orthogonal to the true signal — completely uninformative.</li>
</ul>
</div>

<div class="remark">
<strong>Remark 9.3.</strong> The BBP theorem reveals a fundamental difficulty: if the signal-to-noise ratio is too small relative to the dimensionality ratio \(c = p/n\), PCA cannot recover the true signal direction at all. This motivates corrections and alternative methods. Notably, the sample eigenvalue \(\hat{\lambda}_1 = (1+\alpha)(1+c/\alpha)\) is always larger than the true eigenvalue \(1 + \alpha\), exhibiting positive bias even above the phase transition. Bias-corrected estimators of \(\alpha\) can be constructed by inverting the BBP formula.
</div>

## 9.3 Sparse PCA

When the true loading vectors \(v_k\) are sparse (few nonzero entries), standard PCA does not exploit this structure and yields dense, hard-to-interpret loadings. **Sparse PCA** adds an \(\ell_1\) penalty to encourage sparsity.

**SPCA (Zou, Hastie, Tibshirani 2006):** Formulate PCA as a regression problem and impose an elastic net penalty. The sparse loadings \(A\) and auxiliary matrix \(B\) are estimated by alternating:

\[
\min_{A, B} \sum_{i=1}^n \|x_i - AB^\top x_i\|^2 + \lambda_1 \|B\|_1 + \lambda_2 \|B\|_F^2, \quad \text{s.t. } A^\top A = I.
\]

**DSPCA (d'Aspremont et al. 2007):** Solve the SDP relaxation of

\[
\max_{\|v\|=1,\ \|v\|_0 \leq k} v^\top S v,
\]

where \(\|v\|_0\) is the number of nonzero entries. The SDP provides a convex relaxation of the cardinality constraint.

**TPower (Yuan and Zhang 2013):** An iterative truncated-power-method algorithm that alternates between a power step \(z \leftarrow Sv\) and a thresholding step that zeroes out all but the top \(k\) entries of \(z\) in magnitude, then normalizes.

Sparse PCA estimators are consistent under the spiked covariance model with sparsity constraints even when \(p \gg n\), bypassing the BBP phase transition.

## 9.4 Kernel PCA

**Kernel PCA** (Schölkopf, Smola, Müller 1998) extends PCA to nonlinear structures by implicitly mapping data to a high-dimensional feature space via a kernel function \(k(x, y) = \langle \phi(x), \phi(y)\rangle\).

The kernel matrix \(K \in \mathbb{R}^{n \times n}\) has entries \(K_{ij} = k(x_i, x_j)\). After centering, the principal components in feature space are found by solving the eigenvalue problem for the centered kernel matrix. The projection of a new point \(x\) onto the \(k\)-th kernel PC is

\[
y_k(x) = \sum_{i=1}^n \alpha_{ki}\, k(x, x_i),
\]

where \(\alpha_k\) is the \(k\)-th eigenvector of the centered kernel matrix, scaled by \(1/\sqrt{\hat{\lambda}_k}\).

Common kernels: polynomial \(k(x,y) = (x^\top y + c)^d\), Gaussian RBF \(k(x,y) = \exp(-\|x-y\|^2/(2\sigma^2))\). Kernel PCA can capture nonlinear manifold structure that linear PCA misses.

## 9.5 t-SNE (Conceptual Overview)

**t-distributed Stochastic Neighbor Embedding (t-SNE)** (van der Maaten and Hinton, 2008) is a nonlinear dimensionality reduction method primarily used for visualization. Unlike PCA, t-SNE focuses on preserving local structure.

The algorithm defines a probability \(p_{ij}\) (proportional to a Gaussian kernel) for each pair of high-dimensional points measuring their similarity. In the low-dimensional embedding, a Student-t kernel is used to define \(q_{ij}\). The embedding is found by minimizing the Kullback-Leibler divergence \(\text{KL}(P \| Q) = \sum_{ij} p_{ij} \ln \frac{p_{ij}}{q_{ij}}\) via gradient descent.

The use of the heavy-tailed Student-t kernel in low dimensions addresses the "crowding problem" by allowing moderate distances to be represented as large distances, separating clusters more clearly. Key limitations: t-SNE is computationally expensive, stochastic (results vary with random seed), and distances/sizes of clusters in the embedding are not directly interpretable. It is not suitable for inference or as a preprocessing step for supervised learning.

---

# Appendix: Key Results Summary

## A.1 Distribution Reference

The following table summarizes the key distributional results:

| Statistic | Distribution |
|-----------|-------------|
| \(\bar{X}\) when \(X_i \overset{\text{i.i.d.}}{\sim} N_p(\mu,\Sigma)\) | \(N_p(\mu, \Sigma/n)\) |
| \((n-1)S\) | \(W_p(n-1, \Sigma)\) |
| \((X-\mu)^\top\Sigma^{-1}(X-\mu)\) | \(\chi^2_p\) |
| \(\frac{n-p}{p(n-1)}T^2\) under \(H_0\) | \(F_{p, n-p}\) |
| \(AX + b\) when \(X \sim N_p(\mu,\Sigma)\) | \(N_q(A\mu+b, A\Sigma A^\top)\) |
| \(X_1 \mid X_2 = x_2\) (joint normal) | \(N_{p_1}(\mu_{1\|2}, \Sigma_{1\|2})\) |

## A.2 Matrix Identities

Several matrix identities are used throughout the course:

**Schur complement:** \(|\Sigma| = |\Sigma_{22}| \cdot |\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}|\)

**Woodbury identity:** \((A + UCV)^{-1} = A^{-1} - A^{-1}U(C^{-1} + VA^{-1}U)^{-1}VA^{-1}\)

**Matrix determinant lemma:** \(|A + uv^\top| = (1 + v^\top A^{-1}u)|A|\)

**Spectral norm of Wishart:** If \(W \sim W_p(n, I)\), the largest eigenvalue satisfies \(\hat{\lambda}_{\max} \to (1 + \sqrt{p/n})^2\) almost surely as \(n, p \to \infty\) with \(p/n \to c\).

## A.3 Optimization Problems in Multivariate Analysis

| Method | Optimization Problem |
|--------|---------------------|
| PCA | \(\max_{\|a\|=1} a^\top \Sigma a\) |
| LDA | \(\max_a J(a) = a^\top B a / a^\top W a\) |
| CCA | \(\max_{a,b} a^\top \Sigma_{12}b / \sqrt{a^\top\Sigma_{11}a \cdot b^\top\Sigma_{22}b}\) |
| GLASSO | \(\max_{\Omega\succ 0} \left[\ln\det(\Omega) - \text{tr}(S\Omega) - \lambda\lVert\Omega\rVert_1\right]\) |
| Sparse PCA | \(\max_{\|v\|=1, \|v\|_0 \leq k} v^\top S v\) |
| K-means | \(\min_{\{C_k\}} \sum_k \sum_{i \in C_k} \|x_i - \bar{x}_{C_k}\|^2\) |
| GMM (EM) | \(\max_\theta \sum_i \ln \sum_k \pi_k \phi(x_i;\mu_k,\Sigma_k)\) |
