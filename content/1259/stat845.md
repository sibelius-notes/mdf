---
title: "STAT 845: Statistical Concepts for Data Science"
prof: "Subha Maity"
subjects: "STAT"
---

## Sources and References
**Primary text** — Maoxin Zhu, *Essential Statistics for Data Science: A Concise Crash Course* (Oxford University Press, 2023).
**Supplementary texts** — Larry Wasserman, *All of Statistics* (Springer, 2004); Morris DeGroot and Mark Schervish, *Probability and Statistics* (4th ed., Addison-Wesley, 2012); Bishop, *Pattern Recognition and Machine Learning* (Springer, 2006).
**Online resources** — CMU 36-700 Probability and Mathematical Statistics lecture notes; Stanford Stats 200 notes; Harvard Statistics 110 (probability) lecture notes by Joe Blitzstein.

---

# Chapter 1: Probability and Random Variables

## 1.1 Sample Spaces and Events

Every probabilistic experiment begins with a **sample space** \(\Omega\), the set of all possible outcomes. An **event** is a subset of \(\Omega\) to which we may assign a probability. Not every subset is automatically admissible; for mathematical coherence we require the collection of events to form a \(\sigma\)-field.

<div class="definition">
<strong>Definition (σ-field / σ-algebra).</strong> A collection <em>F</em> of subsets of Ω is a <em>σ-field</em> if:
<ol>
<li>Ω ∈ F;</li>
<li>if A ∈ F then A<sup>c</sup> ∈ F (closed under complementation);</li>
<li>if A<sub>1</sub>, A<sub>2</sub>, … ∈ F then ∪<sub>i=1</sub><sup>∞</sup> A<sub>i</sub> ∈ F (closed under countable unions).</li>
</ol>
The pair (Ω, F) is called a <em>measurable space</em>.
</div>

The smallest \(\sigma\)-field containing all open sets of \(\mathbb{R}\) is the **Borel \(\sigma\)-field**, denoted \(\mathcal{B}(\mathbb{R})\). It contains all intervals, countable sets, and virtually every set encountered in practice.

## 1.2 Probability Measures and Kolmogorov's Axioms

<div class="definition">
<strong>Definition (Probability Measure).</strong> A function \( P: \mathcal{F} \to [0,1] \) is a <em>probability measure</em> on \((\Omega, \mathcal{F})\) if:
<ol>
<li>\( P(\Omega) = 1 \);</li>
<li>\( P(A) \geq 0 \) for all \( A \in \mathcal{F} \);</li>
<li>For any countable collection of pairwise disjoint events \( A_1, A_2, \ldots \in \mathcal{F} \):
\[ P\!\left(\bigcup_{i=1}^{\infty} A_i\right) = \sum_{i=1}^{\infty} P(A_i). \]
</li>
</ol>
The triple \((\Omega, \mathcal{F}, P)\) is called a <em>probability space</em>.
</div>

From the axioms one derives: \(P(\emptyset) = 0\), \(P(A^c) = 1 - P(A)\), monotonicity (\(A \subseteq B \Rightarrow P(A) \leq P(B)\)), and the **inclusion-exclusion** formula

\[
P(A \cup B) = P(A) + P(B) - P(A \cap B).
\]

## 1.3 Conditional Probability and Bayes' Theorem

<div class="definition">
<strong>Definition (Conditional Probability).</strong> For events \( A, B \) with \( P(B) > 0 \), the <em>conditional probability</em> of \(A\) given \(B\) is

\[ P(A \mid B) = \frac{P(A \cap B)}{P(B)}. \]
</div>

The **law of total probability** states that for a partition \(\{B_1, B_2, \ldots\}\) of \(\Omega\) with \(P(B_i) > 0\),

\[
P(A) = \sum_{i} P(A \mid B_i)\, P(B_i).
\]

<div class="theorem">
<strong>Theorem (Bayes' Theorem).</strong> Let \( \{B_1, \ldots, B_k\} \) partition \(\Omega\) and let \(A\) be an event with \(P(A) > 0\). Then

\[ P(B_j \mid A) = \frac{P(A \mid B_j)\, P(B_j)}{\sum_{i=1}^{k} P(A \mid B_i)\, P(B_i)}. \]

<strong>Proof.</strong> By definition of conditional probability, \( P(B_j \mid A) = P(A \cap B_j) / P(A) = P(A \mid B_j) P(B_j) / P(A) \). Applying the law of total probability to expand \(P(A)\) in the denominator completes the proof. ∎
</div>

<div class="example">
<strong>Example (Disease Screening).</strong> A disease has prevalence 0.1%. A test has sensitivity 99% and specificity 95%. Given a positive test, what is the probability of having the disease?

Let \(D\) = disease, \(T^+\) = positive test. We have \(P(D) = 0.001\), \(P(T^+ \mid D) = 0.99\), \(P(T^+ \mid D^c) = 0.05\).

\[ P(D \mid T^+) = \frac{0.99 \times 0.001}{0.99 \times 0.001 + 0.05 \times 0.999} \approx \frac{0.00099}{0.05094} \approx 0.0194. \]

Despite 99% sensitivity, the positive predictive value is under 2% due to low prevalence — a classic illustration of Bayes' theorem.
</div>

## 1.4 Independence

<div class="definition">
<strong>Definition (Independence of Events).</strong> Events \(A\) and \(B\) are <em>independent</em> if \( P(A \cap B) = P(A)\, P(B) \). A collection \(\{A_i\}\) is <em>mutually independent</em> if for every finite subcollection \(P\!\left(\bigcap_{i \in S} A_i\right) = \prod_{i \in S} P(A_i)\).
</div>

Note that pairwise independence does not imply mutual independence.

## 1.5 Random Variables and Their Distributions

A **random variable** \(X\) is a measurable function \(X: \Omega \to \mathbb{R}\). Its distribution is completely characterized by the **cumulative distribution function (CDF)**:

\[
F_X(x) = P(X \leq x), \quad x \in \mathbb{R}.
\]

A CDF satisfies: non-decreasing, right-continuous, \(\lim_{x \to -\infty} F(x) = 0\), \(\lim_{x \to \infty} F(x) = 1\).

For a **discrete** random variable taking values in a countable set \(\mathcal{X}\), the **probability mass function (PMF)** is \(p(x) = P(X = x)\). For a **continuous** random variable, a **probability density function (PDF)** \(f\) exists such that

\[
F(x) = \int_{-\infty}^{x} f(t)\, dt, \quad f(x) = F'(x).
\]

## 1.6 Common Discrete Distributions

**Bernoulli(\(p\)):** \(P(X=1) = p\), \(P(X=0) = 1-p\). Mean \(p\), variance \(p(1-p)\).

**Binomial(\(n, p\)):** Models the number of successes in \(n\) independent Bernoulli trials.

\[
P(X = k) = \binom{n}{k} p^k (1-p)^{n-k}, \quad k = 0, 1, \ldots, n.
\]

Mean \(np\), variance \(np(1-p)\).

**Poisson(\(\lambda\)):** Arises as a limit of Binomial when \(n \to \infty\), \(p \to 0\), \(np \to \lambda\).

\[
P(X = k) = \frac{e^{-\lambda} \lambda^k}{k!}, \quad k = 0, 1, 2, \ldots
\]

Mean and variance both equal \(\lambda\). The Poisson distribution models rare events and is **closed under convolution**: if \(X_i \sim \text{Poisson}(\lambda_i)\) independently, then \(\sum X_i \sim \text{Poisson}(\sum \lambda_i)\).

**Geometric(\(p\)):** Number of trials until first success. \(P(X = k) = (1-p)^{k-1} p\), mean \(1/p\), variance \((1-p)/p^2\). Enjoys the **memoryless property**: \(P(X > m+n \mid X > m) = P(X > n)\).

## 1.7 Common Continuous Distributions

**Uniform(\(a,b\)):** \(f(x) = 1/(b-a)\) on \([a,b]\). Mean \((a+b)/2\), variance \((b-a)^2/12\).

**Exponential(\(\lambda\)):** \(f(x) = \lambda e^{-\lambda x}\) for \(x \geq 0\). Mean \(1/\lambda\), variance \(1/\lambda^2\). Memoryless among continuous distributions.

**Normal(\(\mu, \sigma^2\)):** The cornerstone distribution of statistics.

\[
f(x) = \frac{1}{\sqrt{2\pi}\,\sigma} \exp\!\left(-\frac{(x-\mu)^2}{2\sigma^2}\right).
\]

Key properties: symmetric about \(\mu\), the sum of independent normals is normal, and the standard normal \(Z = (X - \mu)/\sigma \sim N(0,1)\).

**Gamma(\(\alpha, \beta\)):** \(f(x) = \frac{\beta^\alpha}{\Gamma(\alpha)} x^{\alpha-1} e^{-\beta x}\) for \(x > 0\). Mean \(\alpha/\beta\), variance \(\alpha/\beta^2\). Special cases: Exponential(\(\lambda\)) = Gamma(1, \(\lambda\)); \(\chi^2_k\) = Gamma(\(k/2\), \(1/2\)).

**Beta(\(\alpha, \beta\)):** \(f(x) = \frac{1}{B(\alpha,\beta)} x^{\alpha-1}(1-x)^{\beta-1}\) on \((0,1)\). Mean \(\alpha/(\alpha+\beta)\). Natural prior for probabilities.

## 1.8 Expectation, Variance, and Moments

<div class="definition">
<strong>Definition (Expectation).</strong> For a discrete r.v., \( \mathbb{E}[X] = \sum_x x\, p(x) \). For a continuous r.v., \( \mathbb{E}[X] = \int_{-\infty}^{\infty} x\, f(x)\, dx \), provided absolute integrability holds. More generally, for a Borel function \(g\), \( \mathbb{E}[g(X)] = \int g(x)\, f(x)\, dx \).
</div>

Expectation is **linear**: \(\mathbb{E}[aX + bY] = a\mathbb{E}[X] + b\mathbb{E}[Y]\) regardless of dependence.

The **variance** is \(\text{Var}(X) = \mathbb{E}\!\left[(X - \mathbb{E}[X])^2\right] = \mathbb{E}[X^2] - (\mathbb{E}[X])^2\). It satisfies \(\text{Var}(aX + b) = a^2 \text{Var}(X)\).

## 1.9 Moment Generating Functions

<div class="definition">
<strong>Definition (MGF).</strong> The <em>moment generating function</em> of \(X\) is \( M_X(t) = \mathbb{E}[e^{tX}] \), defined for all \(t\) in an open interval containing zero.
</div>

When the MGF exists, \(\mathbb{E}[X^k] = M_X^{(k)}(0)\). Crucially, if \(X\) and \(Y\) have the same MGF on an open interval about zero, they have the same distribution. This uniqueness property makes MGFs a powerful tool for identifying distributions. If \(X\) and \(Y\) are independent, \(M_{X+Y}(t) = M_X(t) M_Y(t)\).

<div class="example">
<strong>Example (MGF of the Normal).</strong> For \(X \sim N(\mu, \sigma^2)\):

\[ M_X(t) = \exp\!\left(\mu t + \frac{\sigma^2 t^2}{2}\right). \]

This follows by completing the square in the exponent. Differentiating at \(t=0\): \(M_X'(0) = \mu\), \(M_X''(0) = \sigma^2 + \mu^2\), confirming \(\text{Var}(X) = \sigma^2\).
</div>

---

# Chapter 2: Dealing with Multiple Random Quantities

## 2.1 Joint, Marginal, and Conditional Distributions

For two random variables \((X, Y)\), the **joint CDF** is \(F(x,y) = P(X \leq x, Y \leq y)\). In the continuous case, the **joint PDF** \(f(x,y)\) satisfies

\[
P\!\left((X,Y) \in A\right) = \iint_A f(x,y)\, dx\, dy.
\]

The **marginal PDF** of \(X\) is obtained by integrating out \(Y\):

\[
f_X(x) = \int_{-\infty}^{\infty} f(x,y)\, dy.
\]

The **conditional PDF** of \(Y\) given \(X = x\) is

\[
f_{Y \mid X}(y \mid x) = \frac{f(x,y)}{f_X(x)}, \quad f_X(x) > 0.
\]

## 2.2 Independence of Random Variables

<div class="definition">
<strong>Definition (Independence).</strong> Random variables \(X\) and \(Y\) are <em>independent</em> if \( f(x,y) = f_X(x)\, f_Y(y) \) for all \(x, y\), equivalently if \( F(x,y) = F_X(x) F_Y(y) \).
</div>

A fundamental consequence: if \(X \perp\!\!\!\perp Y\) then \(\mathbb{E}[g(X) h(Y)] = \mathbb{E}[g(X)]\, \mathbb{E}[h(Y)]\) for any Borel functions \(g, h\).

## 2.3 Covariance and Correlation

The **covariance** between \(X\) and \(Y\) is

\[
\text{Cov}(X,Y) = \mathbb{E}\!\left[(X - \mu_X)(Y - \mu_Y)\right] = \mathbb{E}[XY] - \mu_X \mu_Y.
\]

The **Pearson correlation coefficient** is \(\rho(X,Y) = \text{Cov}(X,Y) / (\sigma_X \sigma_Y) \in [-1, 1]\). Independence implies \(\rho = 0\) but the converse fails in general (zero correlation does not imply independence, unless jointly normal).

For a linear combination \(a^\top X\) where \(X = (X_1, \ldots, X_p)^\top\),

\[
\text{Var}(a^\top X) = a^\top \Sigma\, a,
\]

where \(\Sigma\) is the \(p \times p\) **covariance matrix** with \(\Sigma_{ij} = \text{Cov}(X_i, X_j)\).

## 2.4 Law of Total Expectation and Total Variance

<div class="theorem">
<strong>Theorem (Law of Total Expectation).</strong> For any random variables \(X\) and \(Y\),

\[ \mathbb{E}[X] = \mathbb{E}\!\left[\mathbb{E}[X \mid Y]\right]. \]

<strong>Proof.</strong> In the continuous case,

\[ \mathbb{E}\!\left[\mathbb{E}[X \mid Y]\right] = \int \mathbb{E}[X \mid Y = y]\, f_Y(y)\, dy = \int \!\int x\, f_{X\mid Y}(x\mid y)\, dx\, f_Y(y)\, dy = \int \!\int x\, f(x,y)\, dx\, dy = \mathbb{E}[X]. \quad \square \]
</div>

<div class="theorem">
<strong>Theorem (Law of Total Variance).</strong>

\[ \text{Var}(X) = \mathbb{E}\!\left[\text{Var}(X \mid Y)\right] + \text{Var}\!\left(\mathbb{E}[X \mid Y]\right). \]

The first term is the <em>expected within-group variance</em>; the second is the <em>between-group variance</em>.
</div>

## 2.5 The Multivariate Normal Distribution

<div class="definition">
<strong>Definition (Multivariate Normal).</strong> A random vector \(X \in \mathbb{R}^p\) follows the <em>multivariate normal distribution</em> \(N_p(\mu, \Sigma)\) if its PDF is

\[ f(x) = \frac{1}{(2\pi)^{p/2} \lvert\Sigma\rvert^{1/2}} \exp\!\left(-\frac{1}{2}(x-\mu)^\top \Sigma^{-1}(x-\mu)\right), \]

where \(\mu \in \mathbb{R}^p\) is the mean vector and \(\Sigma\) is a positive-definite covariance matrix.
</div>

**Key properties:**

1. Any linear transformation is normal: if \(X \sim N_p(\mu, \Sigma)\), then \(AX + b \sim N_q(A\mu + b, A\Sigma A^\top)\).
2. **Marginals are normal:** if \(X = (X_1^\top, X_2^\top)^\top\) with conformable partitioning, then \(X_1 \sim N(\mu_1, \Sigma_{11})\).
3. **For jointly normal variables, uncorrelated implies independent.**

**Conditional distribution:** Partition \(X = (X_1^\top, X_2^\top)^\top\) with

\[
\mu = \begin{pmatrix} \mu_1 \\ \mu_2 \end{pmatrix}, \quad \Sigma = \begin{pmatrix} \Sigma_{11} & \Sigma_{12} \\ \Sigma_{21} & \Sigma_{22} \end{pmatrix}.
\]

<div class="theorem">
<strong>Theorem (Conditional Multivariate Normal).</strong> The conditional distribution of \(X_1\) given \(X_2 = x_2\) is

\[ X_1 \mid X_2 = x_2 \;\sim\; N\!\left(\mu_1 + \Sigma_{12}\Sigma_{22}^{-1}(x_2 - \mu_2),\; \Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\right). \]

The conditional mean is linear in \(x_2\), and the conditional variance \(\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\) (the <em>Schur complement</em>) is always less than or equal to the marginal variance \(\Sigma_{11}\).
</div>

## 2.6 Transformations of Random Variables

Given \(Y = g(X)\) for a monotone differentiable \(g\), the **change-of-variables formula** (Jacobian method) gives

\[
f_Y(y) = f_X\!\left(g^{-1}(y)\right) \left\lvert\frac{d}{dy} g^{-1}(y)\right\rvert.
\]

In the multivariate case, for a bijection \(Y = g(X)\) with \(X = h(Y)\),

\[
f_Y(y) = f_X(h(y)) \cdot \lvert J \rvert,
\]

where \(J\) is the Jacobian matrix \(\partial h / \partial y\) and \(\lvert J \rvert\) is its absolute determinant.

<div class="example">
<strong>Example (Ratio of Normals).</strong> If \(X \sim N(0,1)\) and \(Y \sim \chi^2_\nu\) independently, then \(T = X / \sqrt{Y/\nu}\) follows a Student's \(t\)-distribution with \(\nu\) degrees of freedom. This is proved by computing the joint density and integrating out \(Y\) — a classic Jacobian calculation.
</div>

## 2.7 The Delta Method

The delta method provides first-order approximations to the distribution of a smooth function of an asymptotically normal statistic.

<div class="theorem">
<strong>Theorem (Delta Method).</strong> Suppose \(\sqrt{n}(T_n - \theta) \xrightarrow{d} N(0, \sigma^2)\). If \(g\) is differentiable at \(\theta\) with \(g'(\theta) \neq 0\), then

\[ \sqrt{n}\!\left(g(T_n) - g(\theta)\right) \xrightarrow{d} N\!\left(0,\; \left[g'(\theta)\right]^2 \sigma^2\right). \]
</div>

This follows from a first-order Taylor expansion \(g(T_n) \approx g(\theta) + g'(\theta)(T_n - \theta)\) and Slutsky's theorem. The multivariate version states: if \(\sqrt{n}(\mathbf{T}_n - \boldsymbol{\theta}) \xrightarrow{d} N(\mathbf{0}, \Sigma)\) and \(g: \mathbb{R}^p \to \mathbb{R}\) is differentiable, then

\[
\sqrt{n}(g(\mathbf{T}_n) - g(\boldsymbol{\theta})) \xrightarrow{d} N\!\left(0,\; [\nabla g(\boldsymbol{\theta})]^\top \Sigma\, \nabla g(\boldsymbol{\theta})\right).
\]

<div class="example">
<strong>Example (Variance of log-transform).</strong> Let \(\bar X_n\) be the sample mean of i.i.d. \(X_i\) with mean \(\mu\) and variance \(\sigma^2\). Then \(\sqrt{n}(\log \bar X_n - \log \mu) \xrightarrow{d} N(0, \sigma^2/\mu^2)\) by the delta method with \(g(x) = \log x\), \(g'(\mu) = 1/\mu\).
</div>

---

# Chapter 3: Overview of Statistics

## 3.1 Statistical Models and Identifiability

A **statistical model** is a family of distributions \(\mathcal{P} = \{P_\theta : \theta \in \Theta\}\) indexed by a parameter \(\theta\) ranging over a parameter space \(\Theta \subseteq \mathbb{R}^d\). We observe data \(X_1, \ldots, X_n\) and wish to make inferences about \(\theta\).

<div class="definition">
<strong>Definition (Identifiability).</strong> The model is <em>identifiable</em> if \(\theta \neq \theta'\) implies \(P_\theta \neq P_{\theta'}\), i.e., distinct parameters yield distinct distributions.
</div>

Identifiability is a prerequisite for consistent estimation. Mixture models are a common source of non-identifiability (e.g., a two-component Gaussian mixture is not identifiable without a label constraint).

## 3.2 Fisher Information

<div class="definition">
<strong>Definition (Score Function and Fisher Information).</strong> Let \(f(x;\theta)\) be the density. The <em>score function</em> is

\[ s(x;\theta) = \frac{\partial}{\partial\theta} \log f(x;\theta). \]

The <em>Fisher information</em> is

\[ I(\theta) = \mathbb{E}_\theta\!\left[\left(\frac{\partial \log f(X;\theta)}{\partial\theta}\right)^2\right] = \mathbb{E}_\theta\!\left[s(X;\theta)^2\right]. \]
</div>

Under regularity conditions (differentiability under the integral sign),

\[
\mathbb{E}_\theta[s(X;\theta)] = 0,
\]

which follows by differentiating \(\int f(x;\theta)\, dx = 1\). An equivalent formula is

\[
I(\theta) = -\mathbb{E}_\theta\!\left[\frac{\partial^2 \log f(X;\theta)}{\partial \theta^2}\right].
\]

For a sample of \(n\) i.i.d. observations, the total Fisher information is \(n\, I(\theta)\).

## 3.3 The Cramér–Rao Lower Bound

<div class="theorem">
<strong>Theorem (Cramér–Rao Lower Bound).</strong> Let \(T = T(X_1, \ldots, X_n)\) be any unbiased estimator of \(\theta\), i.e., \(\mathbb{E}_\theta[T] = \theta\) for all \(\theta\). Under regularity conditions,

\[ \text{Var}_\theta(T) \geq \frac{1}{n\, I(\theta)}. \]

<strong>Proof.</strong> By the Cauchy-Schwarz inequality applied to \(\text{Cov}(T, s)\):

\[ \text{Cov}(T, s)^2 \leq \text{Var}(T) \cdot \text{Var}(s) = \text{Var}(T) \cdot n I(\theta). \]

Since \(T\) is unbiased, differentiating \(\mathbb{E}[T] = \theta\) under the integral gives \(\text{Cov}(T, s) = 1\). Hence \(1 \leq \text{Var}(T) \cdot n I(\theta)\), yielding the result. ∎
</div>

An estimator achieving the CRLB is called **efficient**. The MLE is asymptotically efficient (it attains the CRLB in the limit \(n \to \infty\)).

<div class="example">
<strong>Example (CRLB for Poisson).</strong> For \(X_i \sim \text{Poisson}(\lambda)\), \(\log f = -\lambda + x \log\lambda - \log(x!)\), so \(\partial \log f / \partial \lambda = x/\lambda - 1\) and \(I(\lambda) = \mathbb{E}[(X/\lambda - 1)^2] = \text{Var}(X)/\lambda^2 = 1/\lambda\). The CRLB for unbiased estimators of \(\lambda\) based on \(n\) observations is \(\lambda/n\). The sample mean \(\bar X_n\) achieves this bound, as \(\text{Var}(\bar X_n) = \lambda/n\).
</div>

## 3.4 Sufficiency

<div class="definition">
<strong>Definition (Sufficient Statistic).</strong> A statistic \(T = T(X_1, \ldots, X_n)\) is <em>sufficient</em> for \(\theta\) if the conditional distribution of \((X_1, \ldots, X_n)\) given \(T\) does not depend on \(\theta\).
</div>

Intuitively, \(T\) captures all information about \(\theta\) contained in the data.

<div class="theorem">
<strong>Theorem (Fisher–Neyman Factorization).</strong> \(T\) is sufficient for \(\theta\) if and only if the joint density can be factored as

\[ f(x_1, \ldots, x_n; \theta) = g(T(x);\theta) \cdot h(x_1, \ldots, x_n), \]

where \(g\) depends on the data only through \(T\), and \(h\) does not depend on \(\theta\).
</div>

<div class="example">
<strong>Example.</strong> For \(X_i \sim \text{Bernoulli}(p)\), the joint PMF is \(p^{\sum x_i}(1-p)^{n - \sum x_i}\). By factorization, \(T = \sum X_i\) is sufficient for \(p\). Knowing the total number of successes is all that matters.
</div>

## 3.5 Completeness and the Rao–Blackwell Theorem

<div class="definition">
<strong>Definition (Completeness).</strong> A sufficient statistic \(T\) is <em>complete</em> if for every measurable function \(g\), \(\mathbb{E}_\theta[g(T)] = 0\) for all \(\theta\) implies \(g(T) = 0\) a.s. for all \(\theta\).
</div>

<div class="theorem">
<strong>Theorem (Rao–Blackwell).</strong> Let \(W\) be an unbiased estimator of \(\theta\) and let \(T\) be a sufficient statistic. Define \(W^* = \mathbb{E}[W \mid T]\). Then \(W^*\) is also unbiased and \(\text{Var}_\theta(W^*) \leq \text{Var}_\theta(W)\) for all \(\theta\).

<strong>Proof sketch.</strong> By the law of total expectation, \(\mathbb{E}[W^*] = \mathbb{E}[\mathbb{E}[W \mid T]] = \mathbb{E}[W] = \theta\). By the law of total variance, \(\text{Var}(W) = \mathbb{E}[\text{Var}(W \mid T)] + \text{Var}(\mathbb{E}[W \mid T]) \geq \text{Var}(W^*)\). ∎
</div>

The **Lehmann–Scheffé theorem** states that a complete sufficient statistic \(T\) yields a unique UMVUE: any unbiased function of \(T\) is the **uniformly minimum variance unbiased estimator (UMVUE)**.

---

# Chapter 4: Frequentist Approach

## 4.1 Method of Moments

The **method of moments** equates population moments to sample moments to solve for parameters. For a \(k\)-parameter model, solve

\[
\mu_j(\theta) = \hat\mu_j, \quad j = 1, \ldots, k,
\]

where \(\mu_j(\theta) = \mathbb{E}_\theta[X^j]\) and \(\hat\mu_j = n^{-1}\sum_{i=1}^n X_i^j\).

<div class="example">
<strong>Example (Gamma MOM).</strong> For \(X_i \sim \text{Gamma}(\alpha, \beta)\), \(\mu_1 = \alpha/\beta\) and \(\mu_2 - \mu_1^2 = \alpha/\beta^2\). Setting \(\hat\mu_1 = \bar X\) and \(\widehat{\mu_2 - \mu_1^2} = S^2\), we solve: \(\hat\beta = \bar X / S^2\), \(\hat\alpha = \bar X^2 / S^2\).
</div>

## 4.2 Maximum Likelihood Estimation

<div class="definition">
<strong>Definition (MLE).</strong> Given observations \(x_1, \ldots, x_n\), the <em>likelihood function</em> is

\[ L(\theta) = \prod_{i=1}^n f(x_i;\theta). \]

The <em>maximum likelihood estimator</em> \(\hat\theta_{MLE}\) maximizes \(L(\theta)\) (equivalently, the log-likelihood \(\ell(\theta) = \sum_{i=1}^n \log f(x_i; \theta)\)).
</div>

In practice, we solve the **score equation** \(\partial \ell / \partial \theta = 0\). For multiparameter models, we set \(\nabla_\theta \ell(\theta) = 0\).

<div class="example">
<strong>Example (MLE for Normal).</strong> For \(X_i \sim N(\mu, \sigma^2)\),

\[ \ell(\mu, \sigma^2) = -\frac{n}{2}\log(2\pi\sigma^2) - \frac{1}{2\sigma^2}\sum_{i=1}^n (x_i - \mu)^2. \]

Differentiating: \(\hat\mu = \bar X_n\) and \(\hat\sigma^2 = n^{-1}\sum(x_i - \bar X)^2\) (note the MLE uses \(n\), not \(n-1\), so it is slightly biased for \(\sigma^2\)).
</div>

**Invariance of MLE:** If \(\hat\theta\) is the MLE of \(\theta\), then for any function \(g\), the MLE of \(g(\theta)\) is \(g(\hat\theta)\). This follows from the profile likelihood definition.

## 4.3 Asymptotic Theory of MLE

<div class="theorem">
<strong>Theorem (Asymptotic Normality of MLE).</strong> Under standard regularity conditions (identifiability, twice-differentiability of log-likelihood, etc.), the MLE satisfies

\[ \sqrt{n}\!\left(\hat\theta_{MLE} - \theta_0\right) \xrightarrow{d} N\!\left(0,\; I(\theta_0)^{-1}\right), \]

where \(\theta_0\) is the true parameter.
</div>

This means the MLE is **asymptotically efficient** — it achieves the Cramér–Rao lower bound asymptotically. The result follows from a Taylor expansion of the score equation around \(\theta_0\):

\[
0 = \ell'(\hat\theta) \approx \ell'(\theta_0) + \ell''(\theta_0)(\hat\theta - \theta_0),
\]

so \(\sqrt{n}(\hat\theta - \theta_0) \approx -\frac{\sqrt{n}\,\ell'(\theta_0)/n}{\ell''(\theta_0)/n}\). By the CLT, \(\sqrt{n}\ell'(\theta_0)/n \to N(0, I(\theta_0))\), and by the LLN, \(-\ell''(\theta_0)/n \to I(\theta_0)\), giving the result.

## 4.4 Linear Regression

Consider the model

\[
Y = X\beta + \varepsilon, \quad \varepsilon \sim N_n(0, \sigma^2 I_n),
\]

where \(Y \in \mathbb{R}^n\), \(X \in \mathbb{R}^{n \times p}\) (design matrix with full column rank), \(\beta \in \mathbb{R}^p\).

The **OLS estimator** minimizes the residual sum of squares:

\[
\hat\beta_{OLS} = \arg\min_\beta \lVert Y - X\beta \rVert_2^2 = (X^\top X)^{-1} X^\top Y.
\]

Properties: \(\mathbb{E}[\hat\beta] = \beta\) (unbiased), \(\text{Var}(\hat\beta) = \sigma^2 (X^\top X)^{-1}\). Under normality, \(\hat\beta \sim N(\beta, \sigma^2 (X^\top X)^{-1})\).

<div class="theorem">
<strong>Theorem (Gauss–Markov).</strong> Among all linear unbiased estimators \(\tilde\beta = CY\) with \(\mathbb{E}[\tilde\beta] = \beta\), the OLS estimator has the smallest variance in the sense that \(\text{Var}(\tilde\beta_j) \geq \text{Var}(\hat\beta_{OLS,j})\) for each \(j\). Equivalently, \(\text{Var}(c^\top \tilde\beta) \geq \text{Var}(c^\top \hat\beta_{OLS})\) for any \(c\). (This requires only \(\mathbb{E}[\varepsilon] = 0\) and \(\text{Var}(\varepsilon) = \sigma^2 I\), not normality.)
</div>

The **F-test** for joint significance tests \(H_0: R\beta = r\) for a constraint matrix \(R\). The test statistic is

\[
F = \frac{(R\hat\beta - r)^\top \left[R(X^\top X)^{-1} R^\top\right]^{-1} (R\hat\beta - r)/q}{s^2} \sim F_{q,\, n-p}
\]

under \(H_0\), where \(q\) is the number of constraints and \(s^2 = \lVert Y - X\hat\beta \rVert^2 / (n-p)\).

## 4.5 Logistic Regression

For binary outcomes \(Y_i \in \{0,1\}\), we model

\[
P(Y_i = 1 \mid x_i) = \sigma(x_i^\top \beta) = \frac{e^{x_i^\top\beta}}{1 + e^{x_i^\top\beta}},
\]

where \(\sigma\) is the logistic sigmoid. The log-likelihood is

\[
\ell(\beta) = \sum_{i=1}^n \left[y_i\, x_i^\top \beta - \log(1 + e^{x_i^\top\beta})\right].
\]

This is concave in \(\beta\), so gradient-based methods converge globally. The gradient is \(\nabla \ell = X^\top(y - \pi)\) where \(\pi_i = \sigma(x_i^\top\beta)\), and the Hessian is \(-X^\top W X\) where \(W = \text{diag}(\pi_i(1-\pi_i))\). **Newton–Raphson** updates:

\[
\beta^{(t+1)} = \beta^{(t)} + (X^\top W^{(t)} X)^{-1} X^\top (y - \pi^{(t)}).
\]

This is equivalent to iteratively reweighted least squares (IRLS).

## 4.6 Survey Sampling

**Simple random sampling (SRS):** Each subset of size \(n\) from a population of \(N\) is equally likely. The sample mean \(\bar y\) is unbiased for the population mean \(\bar Y\) with variance \(\text{Var}(\bar y) = \frac{S^2}{n}\left(1 - \frac{n}{N}\right)\), where the factor \((1 - n/N)\) is the **finite population correction**.

**Stratified sampling:** Partition population into \(H\) strata of sizes \(N_h\). Sample \(n_h\) from stratum \(h\). The stratified estimator \(\bar y_{st} = \sum_h W_h \bar y_h\) (where \(W_h = N_h/N\)) is unbiased and more efficient than SRS when strata are internally homogeneous.

**Cluster sampling:** Population divided into clusters; a random sample of clusters is chosen and all units within selected clusters are surveyed. More practical but less efficient than SRS due to intra-cluster correlation.

## 4.7 The EM Algorithm

The **Expectation-Maximization (EM) algorithm** is an iterative method for MLE when data are incomplete (latent variables or missing observations).

**Setup:** Let \(X\) be observed data, \(Z\) be latent data, and \(\theta\) be parameters. The complete-data log-likelihood is \(\ell_c(\theta) = \log f(X, Z; \theta)\), which is easier to optimize than \(\ell(\theta) = \log f(X;\theta) = \log \int f(X,Z;\theta)\, dZ\).

**E-step:** Compute

\[
Q(\theta \mid \theta^{(t)}) = \mathbb{E}_{Z \mid X,\, \theta^{(t)}}\!\left[\log f(X, Z;\theta)\right].
\]

**M-step:** Set

\[
\theta^{(t+1)} = \arg\max_\theta Q(\theta \mid \theta^{(t)}).
\]

<div class="theorem">
<strong>Theorem (Monotone Convergence of EM).</strong> The observed-data log-likelihood is non-decreasing at each EM iteration: \(\ell(\theta^{(t+1)}) \geq \ell(\theta^{(t)})\).

<strong>Proof sketch.</strong> By Jensen's inequality applied to the concavity of the log:

\[ \ell(\theta) - \ell(\theta^{(t)}) \geq Q(\theta \mid \theta^{(t)}) - Q(\theta^{(t)} \mid \theta^{(t)}). \]

Since the M-step ensures \(Q(\theta^{(t+1)} \mid \theta^{(t)}) \geq Q(\theta^{(t)} \mid \theta^{(t)})\), the right-hand side is non-negative. ∎
</div>

<div class="example">
<strong>Example (EM for Gaussian Mixture).</strong> Suppose \(X_i \sim \sum_{k=1}^K \pi_k\, N(\mu_k, \sigma_k^2)\). Latent variable \(Z_i \in \{1,\ldots,K\}\) indicates component membership.

<em>E-step:</em> Compute responsibilities \( r_{ik} = P(Z_i = k \mid X_i, \theta^{(t)}) = \pi_k^{(t)} \phi(X_i; \mu_k^{(t)}, \sigma_k^{2(t)}) / \sum_j \pi_j^{(t)} \phi(X_i; \mu_j^{(t)}, \sigma_j^{2(t)}) \).

<em>M-step:</em> Update \(\pi_k^{(t+1)} = \bar r_k\), \(\mu_k^{(t+1)} = \sum_i r_{ik} X_i / \sum_i r_{ik}\), \(\sigma_k^{2(t+1)} = \sum_i r_{ik}(X_i - \mu_k^{(t+1)})^2 / \sum_i r_{ik}\).
</div>

---

# Chapter 5: Bayesian Approach

## 5.1 The Bayesian Framework

The **Bayesian paradigm** treats parameters \(\theta\) as random variables with a **prior distribution** \(\pi(\theta)\) encoding beliefs before observing data. After observing \(X = x\), we update to the **posterior distribution** via Bayes' theorem:

\[
\pi(\theta \mid x) = \frac{f(x \mid \theta)\, \pi(\theta)}{f(x)} \propto f(x \mid \theta)\, \pi(\theta),
\]

where \(f(x) = \int f(x \mid \theta)\, \pi(\theta)\, d\theta\) is the **marginal likelihood** or **evidence**.

The posterior contains all inferential information about \(\theta\) given the data.

## 5.2 Conjugate Families

A prior is **conjugate** to a likelihood if the posterior belongs to the same distributional family as the prior, making the update analytically tractable.

**Beta–Binomial conjugacy:** Let \(X \mid p \sim \text{Binomial}(n, p)\) and \(p \sim \text{Beta}(\alpha, \beta)\). Then

\[
\pi(p \mid x) \propto p^x(1-p)^{n-x} \cdot p^{\alpha-1}(1-p)^{\beta-1} = p^{\alpha+x-1}(1-p)^{\beta+n-x-1},
\]

so \(p \mid x \sim \text{Beta}(\alpha + x,\; \beta + n - x)\).

<div class="remark">
<strong>Remark.</strong> The hyperparameters \(\alpha\) and \(\beta\) can be interpreted as "pseudo-counts": \(\alpha - 1\) prior successes and \(\beta - 1\) prior failures. As \(n \to \infty\), the posterior mean \((\alpha + x)/(\alpha + \beta + n) \to x/n = \hat p_{MLE}\), illustrating that the prior becomes negligible with sufficient data.
</div>

**Normal–Normal conjugacy:** Suppose \(X_1, \ldots, X_n \mid \mu \sim N(\mu, \sigma^2)\) with \(\sigma^2\) known, and prior \(\mu \sim N(\mu_0, \tau^2)\). The posterior is

\[
\mu \mid X \;\sim\; N\!\left(\frac{\mu_0/\tau^2 + n\bar X/\sigma^2}{1/\tau^2 + n/\sigma^2},\; \frac{1}{1/\tau^2 + n/\sigma^2}\right).
\]

The posterior mean is a **weighted average** of the prior mean and sample mean, with weights inversely proportional to their variances (precisions add).

**Gamma–Poisson conjugacy:** Let \(X_1, \ldots, X_n \mid \lambda \sim \text{Poisson}(\lambda)\) and \(\lambda \sim \text{Gamma}(\alpha, \beta)\). Then

\[
\pi(\lambda \mid x) \propto \lambda^{\sum x_i} e^{-n\lambda} \cdot \lambda^{\alpha-1} e^{-\beta\lambda} = \lambda^{\alpha + \sum x_i - 1} e^{-(\beta+n)\lambda},
\]

so \(\lambda \mid x \sim \text{Gamma}(\alpha + \sum x_i,\; \beta + n)\). The posterior mean is \((\alpha + \sum x_i)/(\beta + n)\).

## 5.3 Bayesian Point Estimates

Given the posterior \(\pi(\theta \mid x)\), two common point summaries are:

- **MAP estimate (Maximum A Posteriori):** \(\hat\theta_{MAP} = \arg\max_\theta \pi(\theta \mid x)\). Reduces to MLE when the prior is uniform.
- **Posterior mean:** \(\hat\theta_{PM} = \mathbb{E}[\theta \mid x]\). Minimizes the posterior expected squared error loss.
- **Posterior median:** Minimizes the posterior expected absolute error loss.

## 5.4 Credible Intervals

A **\((1-\alpha)\) credible interval** \([a,b]\) satisfies \(P(\theta \in [a,b] \mid x) = 1-\alpha\). Unlike frequentist confidence intervals, this admits a direct probability statement about \(\theta\).

The **highest posterior density (HPD) interval** is the shortest credible interval for a given coverage level, containing the most probable values of \(\theta\).

## 5.5 Hierarchical Models and Empirical Bayes

In a **hierarchical model**, parameters themselves have distributions governed by **hyperparameters**:

\[
X_i \mid \theta_i \sim f(x;\theta_i), \quad \theta_i \mid \phi \sim \pi(\theta;\phi), \quad \phi \sim \pi(\phi).
\]

**Empirical Bayes** estimates \(\phi\) from the marginal likelihood \(f(x \mid \phi) = \int f(x\mid\theta)\pi(\theta\mid\phi)\, d\theta\), then plugs \(\hat\phi\) back in. This gives the **James–Stein estimator** as a special case: for \(X_i \sim N(\theta_i, 1)\) with prior \(\theta_i \sim N(0, \tau^2)\), the empirical Bayes estimator shrinks observations toward zero, reducing total mean squared error when \(p \geq 3\).

## 5.6 Markov Chain Monte Carlo

When posterior distributions are analytically intractable, **MCMC** methods simulate samples that converge to the posterior distribution.

**Metropolis–Hastings Algorithm:**

Given current state \(\theta^{(t)}\):
1. Propose \(\theta^* \sim q(\cdot \mid \theta^{(t)})\) from a proposal distribution.
2. Compute acceptance ratio \(r = \frac{\pi(\theta^* \mid x)\, q(\theta^{(t)} \mid \theta^*)}{\pi(\theta^{(t)} \mid x)\, q(\theta^* \mid \theta^{(t)})}\).
3. Set \(\theta^{(t+1)} = \theta^*\) with probability \(\min(1, r)\), else \(\theta^{(t+1)} = \theta^{(t)}\).

The chain is aperiodic and irreducible (under mild conditions), and its stationary distribution is \(\pi(\theta \mid x)\). In practice, the first \(B\) samples (the **burn-in**) are discarded.

**Gibbs Sampler:** A special case of MH for multivariate \(\theta = (\theta_1, \ldots, \theta_d)\). At each step, sample each component from its **full conditional distribution**:

\[
\theta_j^{(t+1)} \sim \pi\!\left(\theta_j \mid \theta_{-j}^{(t)},\, x\right),
\]

where \(\theta_{-j}\) denotes all components except the \(j\)-th. Every proposal is accepted (acceptance ratio is always 1). Gibbs sampling is effective when full conditionals are available in closed form, as in many conjugate hierarchical models.

<div class="example">
<strong>Example (Gibbs for Normal–Normal hierarchy).</strong> Consider \(X_i \mid \mu \sim N(\mu, \sigma^2)\) and \(\mu \sim N(\mu_0, \tau^2)\). The full conditional for \(\mu\) given data and hyperparameters is the Normal posterior derived above. Gibbs sampling iterates between sampling \(\mu\) from this conditional and (if \(\sigma^2\) is also unknown) sampling \(\sigma^2\) from its conjugate inverse-gamma conditional.
</div>

## 5.7 Compound Distributions and Mixture Models

A **compound distribution** arises when a parameter is itself random. If \(X \mid \lambda \sim \text{Poisson}(\lambda)\) and \(\lambda \sim \text{Gamma}(\alpha, \beta)\), the marginal distribution of \(X\) is **Negative Binomial**:

\[
P(X = k) = \binom{\alpha + k - 1}{k} \left(\frac{\beta}{\beta+1}\right)^\alpha \left(\frac{1}{\beta+1}\right)^k.
\]

A **mixture model** with \(K\) components has density

\[
f(x;\theta) = \sum_{k=1}^K \pi_k\, f_k(x;\theta_k), \quad \pi_k > 0, \sum_k \pi_k = 1.
\]

The EM algorithm (Chapter 4.7) provides an elegant framework for fitting Gaussian mixtures by treating component assignments as latent variables.

---

# Chapter 6: Confidence Sets and Significance Testing

## 6.1 Confidence Intervals

<div class="definition">
<strong>Definition (Confidence Interval).</strong> A random interval \([L(X), U(X)]\) is a <em>\((1-\alpha)\) confidence interval</em> for \(\theta\) if

\[ P_\theta(\theta \in [L(X), U(X)]) \geq 1 - \alpha \quad \text{for all } \theta \in \Theta. \]
</div>

The key frequentist interpretation: in repeated experiments, at least \((1-\alpha) \times 100\%\) of such intervals will contain the true \(\theta\). A particular realized interval either contains \(\theta\) or it does not — \(\theta\) is fixed, not random.

**Pivotal method:** A random variable \(Q(X, \theta)\) is a **pivot** if its distribution does not depend on \(\theta\). For example, if \(X_1, \ldots, X_n \sim N(\mu, \sigma^2)\) with \(\sigma^2\) known, then

\[
Z = \frac{\bar X - \mu}{\sigma/\sqrt{n}} \sim N(0,1)
\]

is a pivot. Inverting the event \(\{|Z| \leq z_{\alpha/2}\}\) gives the CI:

\[
\bar X \pm z_{\alpha/2} \cdot \frac{\sigma}{\sqrt{n}}.
\]

When \(\sigma^2\) is unknown, we replace \(\sigma\) with \(s = \sqrt{S^2}\) (sample standard deviation) and use the \(t\)-distribution: the pivot \(T = (\bar X - \mu)/(s/\sqrt{n}) \sim t_{n-1}\), yielding the **Student's t-interval**

\[
\bar X \pm t_{n-1,\,\alpha/2} \cdot \frac{s}{\sqrt{n}}.
\]

## 6.2 Bootstrap Confidence Intervals

The **bootstrap** resamples from the empirical distribution \(\hat F_n\) (the uniform distribution on \(\{X_1, \ldots, X_n\}\)) to approximate the sampling distribution of a statistic.

**Percentile bootstrap CI:** Draw \(B\) bootstrap samples \(X^{*(b)}\) and compute \(\hat\theta^{*(b)}\) for each. The \(95\%\) CI is \([\hat\theta^{*(\lfloor 0.025B \rfloor)},\; \hat\theta^{*(\lceil 0.975B \rceil)}]\).

**BCa (Bias-Corrected and Accelerated) CI:** Adjusts for bias and skewness in the bootstrap distribution using bias-correction constant \(\hat z_0\) and acceleration constant \(\hat a\). More accurate than the percentile method for non-symmetric distributions. The BCa interval has second-order accuracy, i.e., coverage error \(O(1/n)\) rather than \(O(1/\sqrt{n})\).

## 6.3 Hypothesis Testing Framework

In a **hypothesis test**, we specify a null hypothesis \(H_0\) and alternative \(H_1\), then use data to decide whether to reject \(H_0\).

- **Test statistic** \(T_n = T(X_1, \ldots, X_n)\): a function of the data.
- **Rejection region** \(\mathcal{R}\): reject \(H_0\) if \(T_n \in \mathcal{R}\).
- **Type I error (false positive):** \(\alpha = P_{H_0}(T_n \in \mathcal{R})\) — the significance level.
- **Type II error (false negative):** \(\beta = P_{H_1}(T_n \notin \mathcal{R})\).
- **Power:** \(1 - \beta = P_{H_1}(T_n \in \mathcal{R})\) — probability of correctly rejecting \(H_0\).

<div class="definition">
<strong>Definition (p-value).</strong> The <em>p-value</em> is the probability, under \(H_0\), of observing a test statistic at least as extreme as the observed value:

\[ p = P_{H_0}(T_n \geq t_{obs}). \]

We reject \(H_0\) at level \(\alpha\) if \(p \leq \alpha\).
</div>

## 6.4 The Neyman–Pearson Lemma

<div class="theorem">
<strong>Theorem (Neyman–Pearson Lemma).</strong> For a simple null \(H_0: \theta = \theta_0\) versus simple alternative \(H_1: \theta = \theta_1\), the most powerful test at level \(\alpha\) has rejection region

\[ \mathcal{R} = \left\{x : \frac{f(x;\theta_1)}{f(x;\theta_0)} > c_\alpha\right\}, \]

where \(c_\alpha\) is chosen so that \(P_{\theta_0}(\mathcal{R}) = \alpha\). This is the <em>likelihood ratio test</em> and no other test at the same level has higher power against \(\theta_1\).
</div>

For composite hypotheses, the generalized likelihood ratio test statistic \(\Lambda = 2[\ell(\hat\theta) - \ell(\hat\theta_0)] \xrightarrow{d} \chi^2_k\) under \(H_0\) (Wilks' theorem), where \(k\) is the number of constraints.

## 6.5 Common Tests

**One-sample t-test:** For \(H_0: \mu = \mu_0\), the test statistic is \(T = (\bar X - \mu_0)/(s/\sqrt{n}) \sim t_{n-1}\) under \(H_0\).

**Two-sample t-test:** For \(H_0: \mu_1 = \mu_2\) with equal variances,

\[
T = \frac{\bar X_1 - \bar X_2}{s_p\sqrt{1/n_1 + 1/n_2}} \sim t_{n_1+n_2-2},
\]

where \(s_p^2 = [(n_1-1)s_1^2 + (n_2-1)s_2^2]/(n_1+n_2-2)\) is the pooled variance.

**Chi-squared test for independence:** Given a contingency table with observed counts \(O_{ij}\) and expected counts \(E_{ij} = (\text{row total}_i)(\text{col total}_j)/n\),

\[
\chi^2 = \sum_{i,j} \frac{(O_{ij} - E_{ij})^2}{E_{ij}} \xrightarrow{d} \chi^2_{(r-1)(c-1)}
\]

under the null of independence, where \(r\) and \(c\) are the numbers of rows and columns.

## 6.6 Multiple Testing

When conducting \(m\) simultaneous hypothesis tests, the probability of at least one false rejection (the **family-wise error rate, FWER**) inflates rapidly. The **Bonferroni correction** controls FWER at level \(\alpha\) by rejecting test \(i\) only if \(p_i \leq \alpha/m\).

The **Benjamini–Hochberg (BH) procedure** controls the **false discovery rate (FDR)** \(= \mathbb{E}[\text{false discoveries}/\text{total discoveries}]\):

1. Order the \(p\)-values: \(p_{(1)} \leq p_{(2)} \leq \cdots \leq p_{(m)}\).
2. Find the largest \(k\) such that \(p_{(k)} \leq k\alpha/m\).
3. Reject all null hypotheses \(H_{(1)}, \ldots, H_{(k)}\).

<div class="theorem">
<strong>Theorem (BH FDR Control).</strong> Under independent test statistics, the BH procedure controls FDR at level \(\alpha m_0/m \leq \alpha\), where \(m_0\) is the number of true nulls.
</div>

The BH procedure is more powerful than Bonferroni because it controls a less stringent error measure, and it is the standard in genomics and large-scale inference.

<div class="example">
<strong>Example (Genomic Application).</strong> In a differential expression study, \(m = 10{,}000\) genes are tested. Setting \(\alpha = 0.05\) with Bonferroni requires \(p \leq 5 \times 10^{-6}\) per gene — extremely conservative. The BH procedure at FDR 5% will reject far more true positives while maintaining that at most 5% of declared discoveries are false.
</div>

## 6.7 Limitations of p-values and Bayesian Alternatives

The p-value does **not** represent the probability that \(H_0\) is true; it is \(P(\text{data at least this extreme} \mid H_0)\), not \(P(H_0 \mid \text{data})\). This confusion (the **prosecutor's fallacy**) leads to widespread misinterpretation.

Additional concerns: p-values are sensitive to sample size (any tiny effect becomes significant with \(n\) large enough); they conflate statistical and practical significance; and they fail to quantify evidence in favor of \(H_0\).

**Bayesian alternatives** address these directly:

- **Bayes factor:** \(\text{BF}_{10} = f(x \mid H_1) / f(x \mid H_0)\) — the ratio of marginal likelihoods. Directly measures evidence for \(H_1\) relative to \(H_0\).
- **Posterior probability of \(H_0\):** Given prior \(P(H_0)\), the posterior is \(P(H_0 \mid x) = \left[1 + \text{BF}_{10} \cdot P(H_1)/P(H_0)\right]^{-1}\).

The **Savage-Dickey density ratio** provides a convenient formula: for a sharp null \(H_0: \theta = \theta_0\), \(\text{BF}_{10} = \pi(\theta_0) / \pi(\theta_0 \mid x)\) — the ratio of prior to posterior density at \(\theta_0\).

<div class="remark">
<strong>Remark.</strong> Even within the frequentist framework, <strong>effect sizes</strong> (Cohen's \(d\), odds ratios, correlation coefficients) and <strong>confidence intervals</strong> are more informative than p-values alone. The American Statistical Association's 2019 statement recommends moving beyond a binary "significant/not significant" paradigm entirely.
</div>

---

## Summary: Core Results Table

| **Topic** | **Key Result** |
|---|---|
| Bayes' theorem | \(P(B_j \mid A) \propto P(A \mid B_j) P(B_j)\) |
| CRLB | \(\text{Var}(\hat\theta) \geq [n\, I(\theta)]^{-1}\) |
| MLE asymptotics | \(\sqrt{n}(\hat\theta_{MLE} - \theta) \to N(0, I(\theta)^{-1})\) |
| Fisher–Neyman factorization | \(T\) sufficient iff \(f(x;\theta) = g(T;\theta)h(x)\) |
| Rao–Blackwell | Conditioning on sufficient statistic cannot increase MSE |
| Gauss–Markov | OLS is BLUE under \(\mathbb{E}[\varepsilon]=0\), \(\text{Var}(\varepsilon)=\sigma^2 I\) |
| EM convergence | Observed log-likelihood non-decreasing at each step |
| Beta-Binomial | \(\text{Beta}(\alpha,\beta) \to \text{Beta}(\alpha+x, \beta+n-x)\) |
| BH procedure | Controls FDR at \(\alpha m_0/m\) under independence |
| Delta method | \(\sqrt{n}(g(T_n)-g(\theta)) \to N(0, [g'(\theta)]^2\sigma^2)\) |
