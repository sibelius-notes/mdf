---
title: "STAT 450: Estimation and Hypothesis Testing"
subjects: "STAT"
prof: "Liqun Diao"
---

## Sources and References

**Primary notes** — D. L. McLeish and C. A. Struthers, STAT 450 course notes, https://sas.uwaterloo.ca/~dlmcleis/s850/s4508502002.pdf

**Primary texts** — Casella & Berger (2002) *Statistical Inference* 2nd ed; Lehmann & Casella (1998) *Theory of Point Estimation* 2nd ed

**Supplementary texts** — Lehmann & Romano (2005) *Testing Statistical Hypotheses* 3rd ed; Bickel & Doksum (2015) *Mathematical Statistics* 2nd ed; Hogg, McKean & Craig (2005) *Introduction to Mathematical Statistics* 6th ed

---

# Chapter 1: Sufficient Statistics

## Prerequisites and Notation

Before launching into the theory of sufficient statistics, it is worth reviewing the notational conventions that will be used throughout these notes. We write \(E_\theta\), \(\operatorname{Var}_\theta\), and \(P_\theta\) to indicate that the expectation, variance, and probability are computed under the assumption that the parameter is \(\theta\). The **parameter space** \(\Omega\) may be a subset of the real line, a Euclidean space, or a more abstract space. When we write \(\theta = (\theta_1, \ldots, \theta_k)\), we mean a vector parameter, and the model may be called a **\(k\)-parameter family**.

The joint density of an iid sample \(X_1, \ldots, X_n\) with common marginal density \(f_\theta\) is

\[
f_\theta(x_1, \ldots, x_n) = \prod_{i=1}^n f_\theta(x_i).
\]
The distinction between the random vector \(X = (X_1, \ldots, X_n)\) and its observed value \(x = (x_1, \ldots, x_n)\) will be maintained throughout: capital letters for random variables, lower case for observed values.

## Introduction and the Concept of a Statistic

Statistical inference begins with observations \(X_1, \ldots, X_n\) drawn from a probability model \(\{f_\theta(x);\; \theta \in \Omega\}\), where \(\Omega\) is the **parameter space** and \(f_\theta(x)\) is the joint density or mass function. The parameter \(\theta\) may be a scalar or a vector; it encodes everything we do not know about the generating process. A **statistic** \(T(X)\) is any measurable function of the data \((X_1, \ldots, X_n)\) that does not itself depend on \(\theta\). Although a statistic's definition is parameter-free, its distribution typically varies with \(\theta\), which is precisely what makes it useful for inference.

The central challenge is that the data may contain far more raw information than we actually need to draw conclusions about \(\theta\). Compressing the data without losing any relevant information is the goal of **data reduction**. The practical value is enormous: in modern applications with sample sizes in the millions, reducing data to a fixed-dimensional sufficient statistic makes inference both computationally feasible and conceptually transparent.

An **estimator** is any statistic used to estimate a feature \(\tau(\theta)\) of the parameter. The most fundamental criterion for evaluating an estimator is the **mean squared error (MSE)**:

\[
\operatorname{MSE}(\theta, T) = E_\theta\!\left[(T(X) - \tau(\theta))^2\right].
\]

The identity \(\operatorname{MSE} = \operatorname{Var}_\theta(T) + [\operatorname{Bias}(\theta,T)]^2\), where \(\operatorname{Bias}(\theta,T) = E_\theta[T] - \tau(\theta)\), decomposes estimation error into systematic bias and random variability. This decomposition is the foundation of the **bias-variance trade-off** that recurs throughout the course.

### Unbiasedness

A statistic \(T(X)\) is an **unbiased estimator** of \(\tau(\theta)\) if \(E_\theta[T(X)] = \tau(\theta)\) for all \(\theta \in \Omega\). Unbiasedness eliminates the systematic component of MSE, so for unbiased estimators \(\operatorname{MSE} = \operatorname{Var}\). However, unbiasedness alone does not make an estimator good: one can construct unbiased estimators with arbitrarily large variance. The search for the unbiased estimator with minimum variance — the UMVUE — is the main theme of the first three chapters.

A subtlety: unbiasedness is not preserved under nonlinear transformations. If \(T\) is unbiased for \(\theta\), then \(g(T)\) is generally not unbiased for \(g(\theta)\). For example, \(S^2\) is unbiased for \(\sigma^2\), but \(S\) is not unbiased for \(\sigma\). Jensen's inequality quantifies the direction of the bias: if \(g\) is convex, \(E[g(T)] \geq g(E[T]) = g(\theta)\), so \(g(T)\) overestimates \(g(\theta)\) on average.

## Sufficiency: Definition and Motivation

<div class="definition">
<strong>Definition (Sufficient Statistic)</strong>: A statistic \(T(X)\) is <em>sufficient</em> for the model \(\{f_\theta(x);\; \theta \in \Omega\}\) if the conditional distribution of the data \((X_1, \ldots, X_n)\) given \(T(X) = t\) does not depend on \(\theta\) for any value \(t\).
</div>

The intuition is best explained by a thought experiment. Suppose you have observed only the value of \(T\) and wish to reconstruct a dataset with the same joint distribution as the original. If \(T\) is sufficient, you can do so by sampling from the conditional distribution of \(X\) given \(T\) — and since this conditional distribution does not depend on \(\theta\), you need no further knowledge of the parameter. The sufficient statistic has captured everything the data have to say about \(\theta\).

The **Sufficiency Principle** formalizes the operational consequence: if \(T(x_1) = T(x_2)\) for two possible datasets \(x_1, x_2\), then any inference about \(\theta\) from \(x_1\) should be identical to the inference from \(x_2\). The two datasets are equivalent from the standpoint of learning about \(\theta\).

## The Neyman-Fisher Factorization Theorem

Verifying sufficiency via the conditional distribution is cumbersome. The factorization theorem reduces sufficiency to a simple algebraic condition on the density.

<div class="theorem">
<strong>Theorem (Neyman-Fisher Factorization)</strong>: Let \(X = (X_1, \ldots, X_n)\) have joint density (or mass function) \(f_\theta(x)\). A statistic \(T(X)\) is sufficient for \(\theta\) if and only if there exist non-negative functions \(g\) and \(h\) such that
\[
f_\theta(x) = g(T(x);\; \theta)\; h(x) \qquad \text{for all } x \in \mathcal{X},\; \theta \in \Omega.
\]
The function \(g\) depends on the data only through \(T(x)\), and \(h\) is free of \(\theta\).
</div>

<div class="proof">
<strong>Proof (discrete case)</strong>: Suppose the factorization holds. Then for any fixed \(t\):
\[
P_\theta(X = x \mid T = t) = \frac{P_\theta(X = x,\; T = t)}{P_\theta(T = t)} = \frac{g(t;\theta)\,h(x)}{\sum_{x': T(x')=t} g(t;\theta)\,h(x')} = \frac{h(x)}{\sum_{x': T(x')=t} h(x')},
\]
which is independent of \(\theta\), confirming sufficiency. Conversely, if the conditional distribution does not depend on \(\theta\), write

\[
f_\theta(x) = P_\theta(X = x) = P_\theta(T = T(x))\cdot P_\theta(X = x \mid T = T(x)).
\]
Set \(g(T(x);\theta) = P_\theta(T = T(x))\) and \(h(x) = P(X = x \mid T = T(x))\) (which is \(\theta\)-free by assumption). This gives the required factorization.
</div>

The factorization theorem was proved independently by Fisher (1922) in a special case and in full generality by Neyman (1935). It is the most-used tool in the first weeks of a graduate inference course, because checking the factorization condition is typically a matter of simple algebra.

### Applying the Factorization Theorem

**Example: Poisson iid sample.** For \(X_1, \ldots, X_n \overset{\text{iid}}{\sim} \text{Poi}(\theta)\):

\[
f_\theta(x_1, \ldots, x_n) = \prod_{i=1}^n \frac{e^{-\theta}\theta^{x_i}}{x_i!} = e^{-n\theta}\,\theta^{\sum_{i=1}^n x_i} \cdot \prod_{i=1}^n \frac{1}{x_i!}.
\]
Setting \(g(t;\theta) = e^{-n\theta}\theta^t\) and \(h(x) = \prod (x_i!)^{-1}\), sufficiency of \(T = \sum_{i=1}^n X_i\) follows immediately.

**Example: Normal two-parameter model.** For \(X_i \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\):

\[
f_{\mu,\sigma^2}(x) = (2\pi\sigma^2)^{-n/2}\exp\!\left\{-\frac{1}{2\sigma^2}\sum_{i=1}^n(x_i - \mu)^2\right\}.
\]
Expanding \(\sum(x_i-\mu)^2 = \sum x_i^2 - 2\mu\sum x_i + n\mu^2\), the density factors through \(T = (\sum X_i, \sum X_i^2)\), which is equivalent to \((\bar{X}, S^2)\). The two-dimensional sufficient statistic cannot be reduced to one dimension when both \(\mu\) and \(\sigma^2\) are unknown.

**Example: Uniform family.** For \(X_i \overset{\text{iid}}{\sim} \text{Unif}(0,\theta)\), the joint density is \(\theta^{-n}\mathbf{1}(X_{(n)} \leq \theta)\). This factors as \(g(X_{(n)};\theta) = \theta^{-n}\mathbf{1}(X_{(n)} \leq \theta)\) and \(h \equiv 1\), so \(T = X_{(n)}\) is sufficient. Notice that the sufficient statistic here is an order statistic, not a sum — the shape of the sufficient statistic depends fundamentally on the model family.

## Minimal Sufficient Statistics

Because one-to-one functions of a sufficient statistic are also sufficient (they carry identical information), sufficiency alone does not identify a canonical representative. The concept of **minimality** pins down the most compressed sufficient statistic.

<div class="definition">
<strong>Definition (Minimal Sufficient Statistic)</strong>: A sufficient statistic \(T(X)\) is <em>minimal sufficient</em> if for every other sufficient statistic \(U(X)\), there exists a function \(g\) such that \(T(X) = g(U(X))\) with probability 1.
</div>

Equivalently, a minimal sufficient statistic induces the **coarsest partition** of the sample space among all sufficient partitions — coarser meaning that any two outcomes in the same cell of the minimal sufficient partition are also in the same cell of any other sufficient partition. The sets \(\{x : T(x) = t\}\) are as large as they can be while retaining sufficiency.

The constructive characterization of minimal sufficiency is the key theorem:

<div class="theorem">
<strong>Theorem (Lehmann-Scheffé, Minimal Sufficiency)</strong>: Define an equivalence relation on the sample space by \(x \sim y\) if and only if the likelihood ratio \(f_\theta(x)/f_\theta(y)\) is free of \(\theta\) (i.e., is a function of \(x\) and \(y\) alone). Any statistic \(T\) that is constant on equivalence classes and takes distinct values on distinct classes is a minimal sufficient statistic.
</div>

<div class="proof">
<strong>Proof</strong>: Let \(T\) be defined as above, so \(T(x) = T(y)\) iff \(f_\theta(x)/f_\theta(y) = H(x,y)\) independent of \(\theta\). Choose any representative \(y_t\) in each equivalence class \(\{x: T(x)=t\}\). Then for \(x\) in the class of \(y_t\):
\[
f_\theta(x) = H(x,y_t)\,f_\theta(y_t),
\]
so the conditional distribution \(f_\theta(x \mid T = t) = H(x, y_t)/\sum_{x': T(x')=t}H(x',y_t)\) is \(\theta\)-free. Thus \(T\) is sufficient. To show minimality, suppose \(U\) is any sufficient statistic, and \(U(x) = U(y)\). By the factorization theorem \(f_\theta(x)/f_\theta(y) = h(x)/h(y)\), which is \(\theta\)-free. Therefore \(x \sim y\), so \(T(x) = T(y)\). This means \(T\) is a function of \(U\), confirming minimality.
</div>

The practical procedure: compute the likelihood ratio \(f_\theta(x)/f_\theta(y)\) and identify which combinations of \(x\) and \(y\) make this ratio parameter-free. The resulting equivalence classes are the level sets of the minimal sufficient statistic.

**Example: \(N(\theta, \theta^2)\).** Here both mean and variance depend on \(\theta\). The likelihood ratio

\[
\frac{f_\theta(x)}{f_\theta(y)} = \exp\!\left\{\frac{1}{2\theta^2}\!\left(\sum y_i^2 - \sum x_i^2\right) + \frac{1}{\theta}\!\left(\sum x_i - \sum y_i\right)\right\}
\]
is free of \(\theta\) iff both \(\sum x_i^2 = \sum y_i^2\) and \(\sum x_i = \sum y_i\). So the minimal sufficient statistic is \(T = (\sum X_i,\, \sum X_i^2)\). This is not a regular exponential family because the natural parameters \(1/(2\theta^2)\) and \(1/\theta\) satisfy a constraint, so we expect neither completeness nor the UMVUE structure that comes with the regular exponential family.

## The Exponential Family: Canonical Form and Sufficiency

The **exponential family** is the most important class of distributions in theoretical statistics. Nearly every distribution studied in classical statistics belongs to it, and the theory of estimation, testing, and confidence intervals is most complete for this class.

<div class="definition">
<strong>Definition (Exponential Family)</strong>: A parametric family of densities belongs to the <em>\(k\)-parameter exponential family</em> if the density can be written
\[
f_\theta(x) = C(\theta)\exp\!\left\{\sum_{j=1}^k q_j(\theta)\,T_j(x)\right\} h(x). \tag{1.1}
\]
The vector \((T_1(X), \ldots, T_k(X))\) is the <em>natural sufficient statistic</em>, and \(q_1(\theta), \ldots, q_k(\theta)\) are the natural parameters.
</div>

By the factorization theorem, \((T_1(X), \ldots, T_k(X))\) is immediately seen to be sufficient. The **canonical** or **natural parameter** form is obtained by letting \(\eta_j = q_j(\theta)\) be the new parameter:

\[
f_\eta(x) = C(\eta)\exp\!\left\{\sum_{j=1}^k \eta_j\,T_j(x)\right\} h(x).
\]

The **natural parameter space** is \(\mathcal{H} = \bigl\{\eta : \int f_\eta(x)\,dx < \infty\bigr\}\), which is always convex (by Hölder's inequality). A family is **regular exponential** if: (i) the representation is in canonical form; (ii) neither the \(\eta_j\) nor the \(T_j\) satisfy any linear constraints (full rank); and (iii) \(\mathcal{H}\) contains a \(k\)-dimensional open rectangle. Regularity ensures differentiation under the integral sign is valid and that the natural sufficient statistic is complete.

The exponential family is closed under independent sampling:

<div class="theorem">
<strong>Theorem (Closure under sampling)</strong>: If \(X_1, \ldots, X_n\) are iid from a density of the form (1.1), then the joint density is again in the exponential family with natural sufficient statistic \(\left(\sum_{i=1}^n T_1(X_i), \ldots, \sum_{i=1}^n T_k(X_i)\right)\).
</div>

This closure property is the reason why the exponential family is so central: drawing a sample preserves the structure, with only the sufficient statistics accumulating.

**Standard examples:**

| Distribution | \(f_\theta(x)\) | \(T(X)\) (for a sample) | \(\eta\) |
|---|---|---|---|
| \(\text{Poi}(\theta)\) | \(e^{-\theta}\theta^x/x!\) | \(\sum X_i\) | \(\log\theta\) |
| \(\text{Bin}(m,\theta)\) | \(\binom{m}{x}\theta^x(1-\theta)^{m-x}\) | \(\sum X_i\) | \(\log\frac{\theta}{1-\theta}\) |
| \(N(\mu,\sigma^2)\) | \(\frac{1}{\sigma}\phi\!\left(\frac{x-\mu}{\sigma}\right)\) | \((\sum X_i,\, \sum X_i^2)\) | \((\mu/\sigma^2,\,-1/(2\sigma^2))\) |
| \(\text{Exp}(\lambda)\) | \(\lambda e^{-\lambda x}\) | \(\sum X_i\) | \(-\lambda\) |
| \(\text{Gamma}(\alpha,\beta)\) | \(\frac{x^{\alpha-1}e^{-x/\beta}}{\beta^\alpha\Gamma(\alpha)}\) | \((\sum X_i,\,\sum\log X_i)\) | \((-1/\beta,\, \alpha-1)\) |
| \(\text{Beta}(\alpha,\beta)\) | \(\frac{x^{\alpha-1}(1-x)^{\beta-1}}{B(\alpha,\beta)}\) | \((\sum\log X_i,\,\sum\log(1-X_i))\) | \((\alpha-1,\,\beta-1)\) |
| \(\text{NegBin}(r,\theta)\) | \(\binom{x+r-1}{x}\theta^x(1-\theta)^r\) | \(\sum X_i\) | \(\log\theta\) |

Distributions that are *not* exponential family include the Cauchy family (for which no sufficient reduction below the order statistic exists), the Uniform\((0,\theta)\) family (whose support boundary depends on \(\theta\)), and any mixture model with unknown mixing proportions.

### Two-Parameter Exponential Family and the Bivariate Normal

For the **bivariate normal distribution** \((X_1, X_2)^T \sim \text{MVN}(\mu, \Sigma)\) with

\[
\Sigma = \begin{pmatrix}\sigma_1^2 & \rho\sigma_1\sigma_2 \\ \rho\sigma_1\sigma_2 & \sigma_2^2\end{pmatrix},
\]
the joint density is a 5-parameter exponential family. The MLE of \((\mu_1, \mu_2)\) is \((\bar{X}_1, \bar{X}_2)\), and the MLE of \(\Sigma\) is the sample covariance matrix (with \(n\) in the denominator, not \(n-1\)). The complete sufficient statistic is \((\sum X_{1i}, \sum X_{2i}, \sum X_{1i}^2, \sum X_{2i}^2, \sum X_{1i}X_{2i})\).

The UMVUE of \(\rho\) (the correlation) is a complex function of the data. The unbiased estimator based on the sample correlation \(r\) requires a correction factor. The Fisher information matrix for \((\mu_1, \mu_2, \sigma_1^2, \sigma_2^2, \rho)\) is block-diagonal between \((\mu_1, \mu_2)\) and \((\sigma_1^2, \sigma_2^2, \rho)\), reflecting that the means and second-order parameters are orthogonal in the information sense.

### Identifiability and the Natural Parameter Space

The exponential family representation may not be unique: multiplying \(T_j\) by a constant and dividing \(\eta_j\) by the same constant gives an equivalent representation. More seriously, if the \(T_j\) satisfy a linear constraint \(\sum_j c_j T_j(x) = 0\) a.s., then the corresponding \(\eta_j\) are not individually identifiable — only their projections orthogonal to the constraint are. Similarly, if the \(\eta_j\) satisfy a linear constraint, the parameterization is redundant. A **full-rank** (or **minimal**) exponential family removes all such redundancies. The natural parameter space of a full-rank family is an open convex set.

### Differentiating Under the Integral in Exponential Families

One of the most useful properties of regular exponential families is that all moments of the sufficient statistic \(T\) can be obtained by differentiating the log-normalizing constant \(-\log C(\eta)\):

\[
E_\eta[T_j(X)] = \frac{\partial}{\partial\eta_j}[-\log C(\eta)] = -\frac{\partial\log C}{\partial\eta_j},
\]
\[
\operatorname{Cov}_\eta(T_i(X), T_j(X)) = \frac{\partial^2}{\partial\eta_i\partial\eta_j}[-\log C(\eta)].
\]
In other words, the cumulant generating function of \(T\) equals \(-\log C(\eta + \cdot) + \log C(\eta)\). This makes moment computations purely algebraic once the normalizing constant is known.

---

# Chapter 2: Completeness and Ancillarity

## Completeness

The property of completeness is closely linked to uniqueness of estimators. To see why, suppose \(T(X)\) is sufficient and we want to know whether there is a unique unbiased estimator that is a function of \(T\). If \(u_1(T)\) and \(u_2(T)\) are both unbiased for \(\tau(\theta)\), their difference \(h(T) = u_1(T) - u_2(T)\) satisfies \(E_\theta[h(T)] = 0\) for all \(\theta\). If the only zero-mean function of \(T\) is the identically zero function, then \(u_1 = u_2\) and the unbiased estimator is unique. This is exactly completeness.

<div class="definition">
<strong>Definition (Complete Statistic)</strong>: A statistic \(T\), or the family of its distributions indexed by \(\theta\), is <em>complete</em> if
\[
E_\theta[h(T)] = 0 \text{ for all } \theta \in \Omega \implies P_\theta(h(T) = 0) = 1 \text{ for all } \theta \in \Omega.
\]
</div>

Completeness is a property of richness: the family of distributions of \(T\) is large enough that no nontrivial function of \(T\) can have expectation identically zero. A complete family cannot "hide" functions that look like zero on average across all parameters.

### Completeness in Exponential Families

<div class="theorem">
<strong>Theorem (Completeness of Regular Exponential Families)</strong>: If \(X\) has a regular exponential family distribution, then the natural sufficient statistic \((T_1(X), \ldots, T_k(X))\) is complete.
</div>

The proof uses the uniqueness of the Laplace/moment generating transform: \(E_\eta[h(T)] = 0\) for all \(\eta\) in an open set implies that the Laplace transform of \(h\) is identically zero, hence \(h = 0\) a.e.

As a consequence, a complete sufficient statistic is always minimal sufficient, though the converse fails. The Uniform\((\theta-1, \theta+1)\) distribution provides the standard counterexample: its minimal sufficient statistic \((X_{(1)}, X_{(n)})\) is not complete because \(h = X_{(n)} - X_{(1)} - (n-1)/(n+1)\) has mean zero for all \(\theta\) but is not identically zero.

**Testing completeness by inspection.** Consider \(X_1, \ldots, X_n \overset{\text{iid}}{\sim} N(\theta, 1)\). The sufficient statistic \(T = \sum X_i\) has distribution \(N(n\theta, n)\). For any Borel function \(h\) with \(E_\theta[h(T)] = \int h(t)\, \phi((t-n\theta)/\sqrt{n})\, dt/\sqrt{n} = 0\) for all \(\theta\), this is the convolution of \(h\) with a Gaussian evaluated at each \(n\theta\) equaling zero. Since the Fourier transform of this convolution is continuous and vanishes on a dense set, \(h = 0\) a.e. This confirms completeness.

## The Rao-Blackwell Theorem

The Rao-Blackwell theorem is the bridge between any unbiased estimator and the best unbiased estimator achievable by conditioning on the sufficient statistic.

<div class="theorem">
<strong>Theorem (Rao-Blackwell)</strong>: Let \(W(X)\) be an unbiased estimator of \(\tau(\theta)\) with \(E_\theta[W^2] < \infty\), and let \(T(X)\) be a sufficient statistic. Define \(\phi(T) = E_\theta[W(X) \mid T(X)]\). Then:
<ol>
  <li>\(\phi(T)\) is well-defined (does not depend on \(\theta\) by sufficiency).</li>
  <li>\(E_\theta[\phi(T)] = \tau(\theta)\) — the Rao-Blackwellized estimator is unbiased.</li>
  <li>\(\operatorname{Var}_\theta(\phi(T)) \leq \operatorname{Var}_\theta(W(X))\) for all \(\theta\), with equality iff \(W\) is already a function of \(T\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof</strong>: Point 1 follows from the definition of sufficiency: the conditional distribution of \(X\) given \(T\) is \(\theta\)-free, so \(E[W \mid T]\) is also \(\theta\)-free. Point 2 is the tower property: \(E_\theta[\phi(T)] = E_\theta[E[W \mid T]] = E_\theta[W] = \tau(\theta)\). For point 3, use the law of total variance:
\[
\operatorname{Var}_\theta(W) = E_\theta[\operatorname{Var}(W \mid T)] + \operatorname{Var}_\theta(E[W \mid T]) = E_\theta[\operatorname{Var}(W \mid T)] + \operatorname{Var}_\theta(\phi(T)).
\]
Since conditional variance is non-negative, \(\operatorname{Var}_\theta(W) \geq \operatorname{Var}_\theta(\phi(T))\), with equality iff \(\operatorname{Var}(W \mid T) = 0\) a.s., i.e., \(W\) is already a function of \(T\).
</div>

The Rao-Blackwell theorem tells us to always condition on the sufficient statistic. However, even after conditioning, there may be multiple functions of \(T\) that are unbiased. The Lehmann-Scheffé theorem selects the unique one.

## The Lehmann-Scheffé Theorem

<div class="theorem">
<strong>Theorem (Lehmann-Scheffé, UMVUE)</strong>: Let \(T(X)\) be a complete sufficient statistic for \(\theta\). If \(h(T)\) is any function of \(T\) with \(E_\theta[h(T)] = \tau(\theta)\) for all \(\theta\), then \(h(T)\) is the unique UMVUE of \(\tau(\theta)\).
</div>

<div class="proof">
<strong>Proof</strong>: Let \(W\) be any unbiased estimator of \(\tau(\theta)\). By Rao-Blackwell, \(\phi(T) = E[W \mid T]\) is an unbiased estimator of \(\tau(\theta)\) that is a function of \(T\). Both \(h(T)\) and \(\phi(T)\) are unbiased functions of the complete sufficient statistic \(T\). Their difference \(h(T) - \phi(T)\) has expectation zero for all \(\theta\). By completeness, \(h(T) - \phi(T) = 0\) a.s., so \(h(T) = \phi(T)\) a.s. By Rao-Blackwell applied to \(W\): \(\operatorname{Var}(\phi) \leq \operatorname{Var}(W)\). Hence \(\operatorname{Var}(h(T)) \leq \operatorname{Var}(W)\) for every unbiased estimator \(W\), with equality iff \(W\) is already (a.s.) equal to \(h(T)\). Thus \(h(T)\) is the UMVUE.
</div>

### Recipe for Finding UMVUEs

1. **Identify the complete sufficient statistic** \(T\) (use the exponential family theorem for regular families).
2. **Find a function** \(h(T)\) with \(E_\theta[h(T)] = \tau(\theta)\). Often the easiest route is to guess a simple unbiased estimator \(W\) and compute \(E[W \mid T]\).
3. **Verify** the expectation. The resulting \(h(T)\) is the UMVUE by Lehmann-Scheffé.

**Example: UMVUE of \(\theta^2\) for Bernoulli.** For \(X_1, \ldots, X_n \overset{\text{iid}}{\sim} \text{Ber}(\theta)\), the complete sufficient statistic is \(T = \sum X_i \sim \text{Bin}(n,\theta)\). Take \(W = X_1 X_2\) (unbiased for \(\theta^2\)). Then

\[
E[X_1 X_2 \mid T = t] = P(X_1 = 1, X_2 = 1 \mid \textstyle\sum X_i = t) = \frac{\binom{n-2}{t-2}}{\binom{n}{t}} = \frac{t(t-1)}{n(n-1)}.
\]
So the UMVUE of \(\theta^2\) is \(T(T-1)/(n(n-1))\).

**Example: UMVUE of \(e^{-\theta}\) for Poisson.** For \(X_i \overset{\text{iid}}{\sim} \text{Poi}(\theta)\), \(T = \sum X_i \sim \text{Poi}(n\theta)\). Take \(W = \mathbf{1}_{X_1 = 0}\) (unbiased for \(e^{-\theta}\)). Then

\[
E[\mathbf{1}_{X_1=0} \mid T = t] = P(X_1 = 0 \mid \textstyle\sum X_i = t).
\]
Since \((X_1 \mid \sum X_i = t) \sim \text{Bin}(t, 1/n)\), this equals \(P(\text{Bin}(t,1/n) = 0) = (1-1/n)^t\). So the UMVUE of \(e^{-\theta}\) is \((1 - 1/n)^{\sum X_i}\).

**Example: Normal UMVUE.** For \(X_i \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\), the complete sufficient statistic is \((\bar{X}, S^2)\). Since \(E[\bar{X}] = \mu\) and \(E[S^2] = \sigma^2\), the UMVUEs of \(\mu\) and \(\sigma^2\) are \(\bar{X}\) and \(S^2\) respectively. The UMVUE of \(\sigma\) is \(c_n S\) where the unbiasing constant is \(c_n = \sqrt{(n-1)/2}\,\Gamma((n-1)/2)/\Gamma(n/2)\).

## Ancillarity

<div class="definition">
<strong>Definition (Ancillary Statistic)</strong>: A statistic \(U(X)\) is <em>ancillary</em> for \(\theta\) if its distribution does not depend on \(\theta\).
</div>

Ancillary statistics arise naturally in location and scale families. In a **location family** \(f(x - \theta)\), any function of the centered observations, such as \(X_i - X_j\) or the sample range \(X_{(n)} - X_{(1)}\), is ancillary. In a **scale family** \(\sigma^{-1}f(x/\sigma)\), the ratios \(X_i/X_j\) are ancillary. First-order ancillarity is a weaker property: \(U\) is first-order ancillary if \(E_\theta[U]\) does not depend on \(\theta\) (the mean, but not necessarily the distribution, is parameter-free).

The **Conditionality Principle** says that when the minimal sufficient statistic decomposes as \((T, A)\) with \(A\) ancillary, inference should be performed conditionally on the observed value of \(A\). The intuition is that \(A\) plays the role of the experimental design: conditioning on the "design" that happened to be realized focuses attention on the appropriate reference set for inference.

## Basu's Theorem

Basu's theorem is one of the most elegant results in all of mathematical statistics. It says that complete sufficiency and ancillarity are "orthogonal" in the strongest possible sense: they are stochastically independent.

<div class="theorem">
<strong>Theorem (Basu, 1955)</strong>: If \(T(X)\) is a complete sufficient statistic and \(U(X)\) is ancillary, then \(T\) and \(U\) are independent.
</div>

<div class="proof">
<strong>Proof</strong>: For any Borel set \(B\), define
\[
g(t) = P(U \in B \mid T = t) - P(U \in B).
\]
By sufficiency, \(P(U \in B \mid T = t)\) is \(\theta\)-free; by ancillarity, \(P(U \in B)\) is \(\theta\)-free. So \(g(T)\) is a valid statistic. Now:

\[
E_\theta[g(T)] = E_\theta[P(U \in B \mid T)] - P(U \in B) = P_\theta(U \in B) - P_\theta(U \in B) = 0
\]
for all \(\theta\). By completeness of \(T\), we conclude \(g(T) = 0\) a.s., i.e., \(P(U \in B \mid T = t) = P(U \in B)\) a.s. for every \(B\). This is independence.
</div>

**Application 1: Independence of \(\bar{X}\) and \(S^2\) in the normal model.** For \(X_i \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\) with \(\sigma^2\) known, \(\bar{X}\) is complete sufficient for \(\mu\), and \(S^2\) has a distribution depending only on \(\sigma^2\), making it ancillary for \(\mu\). By Basu's theorem, \(\bar{X} \perp S^2\). This classical result — usually derived by a delicate computation with chi-squared distributions — follows in one line from Basu.

**Application 2: Exponential spacings.** For \(X_i \overset{\text{iid}}{\sim} \text{Exp}(\theta)\), the total \(T = \sum X_i\) is complete sufficient, and the vector of proportions \((X_1/T, \ldots, X_n/T)\) has a Dirichlet distribution that does not depend on \(\theta\), making it ancillary. By Basu's theorem, \(\sum X_i\) and \((X_i/\sum X_j)\) are independent. This gives \(E(X_1/T) = E(X_1)\cdot E(1/T)\) (by independence), which can be computed explicitly.

---

# Chapter 3: Point Estimation — MOM and MLE

## Method of Moments

The **method of moments** is the oldest systematic estimation procedure, attributed to Karl Pearson (1894). For a model with \(k\) unknown parameters, the method equates the first \(k\) theoretical moments to the corresponding sample moments:

\[
E_\theta[X^j] = \frac{1}{n}\sum_{i=1}^n X_i^j, \quad j = 1, \ldots, k.
\]
Solving these equations yields the MOM estimator \(\hat\theta_{\text{MOM}}\).

MOM estimators are consistent whenever the moment equations have a unique solution and the moment functions are smooth: by the WLLN, sample moments converge to population moments, and continuous functions of consistent estimators are consistent. They are also often easy to compute even when the likelihood is intractable. Their main shortcomings are: they may not use the data efficiently (leading to higher MSE than the MLE), they may not stay in the parameter space, and they can fail when moments do not exist (e.g., Cauchy distribution).

## Maximum Likelihood Estimation

**Maximum likelihood estimation** (MLE), also due to Fisher (1922, 1925), is the most widely used estimation method in modern statistics. Given observed data \(x = (x_1, \ldots, x_n)\) from a model \(\{f_\theta;\, \theta \in \Omega\}\), the **likelihood function** is

\[
L(\theta) = L(\theta; x) = \prod_{i=1}^n f_\theta(x_i) \quad \text{(for iid data)}
\]

and the **log-likelihood** is \(\ell(\theta) = \sum_{i=1}^n \log f_\theta(x_i)\). Both are functions of \(\theta\) with data held fixed.

<div class="definition">
<strong>Definition (Maximum Likelihood Estimator)</strong>: The <em>MLE</em> \(\hat\theta\) is any maximizer of \(L(\theta)\) (or equivalently \(\ell(\theta)\)) over \(\theta \in \Omega\):
\[
\hat\theta = \arg\max_{\theta \in \Omega}\, \ell(\theta).
\]
</div>

For differentiable log-likelihoods on an open parameter space, \(\hat\theta\) solves the **score equation** \(S(\theta) = \partial\ell/\partial\theta = 0\) and satisfies \(\ell''(\hat\theta) \leq 0\). The quantity \(I(\theta; x) = -\ell''(\theta)\) is the **observed information** and \(\mathcal{I}(\theta) = E_\theta[I(\theta; X)]\) is the **Fisher information** (discussed fully in Chapter 5).

### MLE in Exponential Families

For a regular exponential family in canonical form \(f_\eta(x) = C(\eta)\exp\{\sum_j \eta_j T_j(x)\}h(x)\), the log-likelihood for iid data is

\[
\ell(\eta) = n\log C(\eta) + \sum_{j=1}^k \eta_j \sum_{i=1}^n T_j(X_i).
\]
The score equations \(\partial\ell/\partial\eta_j = 0\) become **moment equations**:

\[
E_{\hat\eta}[T_j(X)] = \frac{1}{n}\sum_{i=1}^n T_j(x_i), \quad j = 1, \ldots, k.
\]
The MLE sets the expected value of each natural sufficient statistic equal to its observed sample mean. For the normal model \((\mu, \sigma^2)\) unknown, these give \(\hat\mu = \bar{X}\) and \(\hat\sigma^2 = n^{-1}\sum(X_i - \bar{X})^2\). Note that \(\hat\sigma^2\) is biased (it uses \(n\) in the denominator, not \(n-1\)), which illustrates that the MLE may not be unbiased.

### Invariance of the MLE

<div class="theorem">
<strong>Theorem (Invariance of MLE)</strong>: If \(\hat\theta\) is the MLE of \(\theta\) and \(\tau = g(\theta)\) is any (not necessarily one-to-one) function of \(\theta\), then the MLE of \(\tau\) is \(\hat\tau = g(\hat\theta)\).
</div>

Proof: When \(g\) is one-to-one, substitute and observe the same maximizer works. In general, define the induced likelihood \(L^*(\tau) = \sup_{\theta: g(\theta) = \tau} L(\theta)\); then \(L^*(\tau)\) is maximized at \(\tau = g(\hat\theta)\). This invariance property makes MLEs extremely convenient in practice: the MLE of any function of the parameter is automatically the same function of the parameter MLE. For example, the MLE of \(\sigma = \sqrt{\sigma^2}\) is \(\hat\sigma = \sqrt{\hat\sigma^2}\), and the MLE of \(\log\theta\) is \(\log\hat\theta\).

### Numerical Computation: Newton-Raphson

When the score equation \(S(\theta) = 0\) has no analytic solution, **Newton-Raphson** iteration is used. Starting from an initial estimate \(\theta^{(0)}\):

\[
\theta^{(k+1)} = \theta^{(k)} + \frac{S(\theta^{(k)})}{I(\theta^{(k)})}.
\]
The algorithm replaces the log-likelihood by its second-order Taylor approximation at the current estimate and finds the maximum of that approximation. In the multiparameter case: \(\theta^{(k+1)} = \theta^{(k)} + I(\theta^{(k)})^{-1} S(\theta^{(k)})\). **Fisher scoring** replaces the observed information \(I\) by the expected Fisher information \(\mathcal{I}\), which can be more stable numerically.

### The EM Algorithm

The **EM (Expectation-Maximization) algorithm** of Dempster, Laird, and Rubin (1977) computes MLEs when the data are incomplete. Let \(X\) be the **complete data** with density \(f_\theta(x)\) and \(Y = Y(X)\) be the **observed (incomplete) data**. The key identity connecting the two log-likelihoods is:

\[
\frac{\partial}{\partial\theta}\log g_\theta(y) = E_\theta\!\left[S(\theta; X) \mid Y = y\right],
\]
where \(g_\theta(y)\) is the marginal density of \(Y\). The MLE of \(\theta\) from \(Y\) satisfies \(E_{\hat\theta}[S(\hat\theta; X) \mid Y = y] = 0\).

The EM algorithm solves this by alternating two steps from current estimate \(\theta^{(k)}\):

**E-step:** Compute \(Q(\theta, \theta^{(k)}) = E_{\theta^{(k)}}[\log f_\theta(X) \mid Y = y]\).

**M-step:** Set \(\theta^{(k+1)} = \arg\max_\theta Q(\theta, \theta^{(k)})\).

Each EM iteration is guaranteed to increase \(\log g_\theta(y)\): this follows from Jensen's inequality applied to the decomposition of the complete-data log-likelihood. The algorithm converges (possibly slowly) to a local maximum of the observed-data likelihood.

For complete-data exponential families, the M-step has a closed form: set the expected natural sufficient statistics under \(\theta^{(k)}\) equal to their conditional expectations given the observed data.

---

# Chapter 4: Uniformly Minimum Variance Unbiased Estimation

## The UMVUE Problem

The UMVUE framework, developed in Chapters 1–2, reaches its most powerful form in the regular exponential family. The recipe — find the complete sufficient statistic, find any unbiased function of it — reduces the UMVUE problem to a computation in probability theory. This chapter consolidates the theory and develops further examples, including the important case where the parameter of interest is not a natural moment of the exponential family.

Recall the two main theorems:
- **Rao-Blackwell**: Conditioning any unbiased estimator on the sufficient statistic never increases variance.
- **Lehmann-Scheffé**: If the sufficient statistic is also complete, any unbiased function of it is the unique UMVUE.

Together, these say: in a complete sufficient family, find any unbiased estimator and condition it on \(T\); the result is the unique UMVUE.

## UMVUE in Non-Standard Parametrizations

The method shines when estimating nonlinear functions of the parameter. The key technique is to find a simple unbiased estimator \(W\) and compute \(E[W \mid T]\), exploiting the conditional distribution of \(W\) given \(T\).

**UMVUE of \(\Phi(c - \theta)\) in the normal model.** For \(X_i \overset{\text{iid}}{\sim} N(\theta, 1)\), we want the UMVUE of \(P(X_1 \leq c) = \Phi(c - \theta)\). The complete sufficient statistic is \(\bar{X}\). Take \(W = \mathbf{1}_{X_1 \leq c}\), which is unbiased for \(\Phi(c - \theta)\). We need \(E[\mathbf{1}_{X_1 \leq c} \mid \bar{X}]\). Since

\[
X_1 \mid \bar{X} = \bar{x} \sim N\!\left(\bar{x},\; 1 - \frac{1}{n}\right),
\]
we get \(E[\mathbf{1}_{X_1 \leq c} \mid \bar{X}] = \Phi\!\left(\frac{c - \bar{X}}{\sqrt{1 - 1/n}}\right)\). This is the UMVUE of \(\Phi(c - \theta)\).

**UMVUE of \((1+\theta)e^{-\theta}\) for Poisson.** For \(X_i \overset{\text{iid}}{\sim} \text{Poi}(\theta)\), note that \((1+\theta)e^{-\theta} = P(X \leq 1)\). Taking \(W = \mathbf{1}_{X_1 \leq 1}\) and conditioning on \(T = \sum X_i\):

\[
E[\mathbf{1}_{X_1 \leq 1} \mid T = t] = P(X_1 \in \{0,1\} \mid T = t).
\]
Using the fact that \((X_1 \mid T = t) \sim \text{Bin}(t, 1/n)\):

\[
= (1-1/n)^t + t(1/n)(1-1/n)^{t-1} = (1-1/n)^{t-1}\!\left[(1-1/n) + t/n\right].
\]
This is the UMVUE.

## The Characterization via Uncorrelated Zero-Mean Functions

<div class="theorem">
<strong>Theorem (Orthogonality Characterization)</strong>: An unbiased estimator \(T^*(X)\) of \(\tau(\theta)\) is the UMVUE if and only if
\[
E_\theta[T^*(X)\cdot U(X)] = 0 \quad \text{for all } \theta \in \Omega
\]
for every statistic \(U\) satisfying \(E_\theta[U(X)] = 0\) for all \(\theta\).
</div>

This characterization, though less commonly used for finding UMVUEs, is important for verifying their optimality in non-exponential-family settings.

## Limits of the UMVUE: When They Do Not Exist or Are Inadmissible

The UMVUE does not always exist. For the Cauchy distribution \(\text{Cau}(\theta, 1)\), the moments do not exist, so no unbiased estimator with finite variance exists. Even when a UMVUE does exist, it may have undesirable properties. For example, the UMVUE of \(e^{-2\theta}\) in the Poisson family with \(n = 1\) is \((-1)^X\), which is negative for odd \(X\) — a probability estimate that is negative is clearly problematic.

Furthermore, UMVUEs can be **inadmissible** under MSE: in the normal mean estimation problem with dimension \(k \geq 3\), the James-Stein estimator uniformly dominates the UMVUE \(\bar{X}\) in total MSE, demonstrating that the UMVUE criterion does not guarantee global optimality. This is one of the deepest results in estimation theory (Stein, 1956).

---

# Chapter 5: Fisher Information and the Cramér-Rao Lower Bound

## The Score Function

The score function measures how sensitively the log-likelihood varies with the parameter. It is the key quantity connecting estimation and information theory.

<div class="definition">
<strong>Definition (Score Function)</strong>: For a model \(\{f_\theta;\, \theta \in \Omega\}\) satisfying regularity conditions, the <em>score function</em> for a single observation is
\[
S(\theta; x) = \frac{\partial}{\partial\theta}\log f_\theta(x).
\]
For iid data, \(S(\theta; X) = \sum_{i=1}^n S(\theta; X_i)\) is the sum of individual scores.
</div>

The score has two fundamental properties under regularity:

<div class="theorem">
<strong>Theorem (Score identities)</strong>: For a regular model,
\[
E_\theta[S(\theta; X)] = 0 \qquad \text{and} \qquad \operatorname{Var}_\theta[S(\theta; X)] = -E_\theta\!\left[\frac{\partial^2\log f_\theta(X)}{\partial\theta^2}\right].
\]
</div>

<div class="proof">
<strong>Proof</strong>: Differentiate the identity \(\int f_\theta(x)\, dx = 1\) under the integral:
\[
0 = \frac{\partial}{\partial\theta}\int f_\theta\, dx = \int \frac{\partial f_\theta}{\partial\theta}\, dx = \int \frac{\partial\log f_\theta}{\partial\theta}\, f_\theta\, dx = E_\theta[S(\theta; X)].
\]
Differentiate once more:

\[
0 = \int \frac{\partial^2\log f_\theta}{\partial\theta^2}\, f_\theta\, dx + \int \!\left(\frac{\partial\log f_\theta}{\partial\theta}\right)^{\!2} f_\theta\, dx = E_\theta\!\left[\frac{\partial^2\ell}{\partial\theta^2}\right] + E_\theta[S^2].
\]
Since \(E[S] = 0\), we have \(\operatorname{Var}[S] = E[S^2] = -E[\partial^2\ell/\partial\theta^2]\).
</div>

## Fisher Information

<div class="definition">
<strong>Definition (Fisher Information)</strong>: The <em>Fisher information</em> for a single observation is
\[
\mathcal{I}(\theta) = E_\theta\!\left[S(\theta; X)^2\right] = \operatorname{Var}_\theta[S(\theta; X)] = -E_\theta\!\left[\frac{\partial^2\log f_\theta(X)}{\partial\theta^2}\right].
\]
For iid data of size \(n\): \(\mathcal{I}_n(\theta) = n\,\mathcal{I}(\theta)\).
</div>

The Fisher information quantifies the sensitivity of the distribution to the parameter: large \(\mathcal{I}(\theta)\) means the log-likelihood changes rapidly near \(\theta\), implying that small perturbations are easily detectable. The information is additive over independent observations because the scores are independent and uncorrelated.

**Reparameterization.** Under the transformation \(\lambda = g(\theta)\), the Fisher information transforms as \(\mathcal{I}^*(\lambda) = \mathcal{I}(\theta)\, [g'(\theta)]^{-2}\). Equivalently, in the parameterization where \(\mathcal{I}^*(\lambda) = 1\) (variance-stabilizing transformation), the MLE \(\hat\lambda\) has asymptotic variance exactly \(1/n\) regardless of the value of \(\lambda\).

**Computing Fisher information: key examples.**

For \(X \sim \text{Poi}(\theta)\): \(\ell(\theta; x) = x\log\theta - \theta - \log(x!)\), \(S = x/\theta - 1\), \(-\ell'' = X/\theta^2\), so \(\mathcal{I}(\theta) = E[X/\theta^2] = 1/\theta\).

For \(X \sim \text{Bin}(m, \theta)\): \(\mathcal{I}(\theta) = m/(\theta(1-\theta))\).

For \(X \sim N(\theta, \sigma^2)\) (\(\sigma^2\) known): \(\ell = -\frac{1}{2\sigma^2}(x-\theta)^2 + \text{const}\), \(S = (x-\theta)/\sigma^2\), \(\mathcal{I}(\theta) = 1/\sigma^2\).

For \(X \sim \text{Exp}(\theta)\) (rate parameterization): \(\mathcal{I}(\theta) = 1/\theta^2\).

For \(X \sim \text{Gamma}(\alpha, \theta)\) (scale parameterization, \(\alpha\) known): \(\mathcal{I}(\theta) = \alpha/\theta^2\).

For \(X \sim \text{Beta}(\theta, \beta)\) (\(\beta\) known): \(\mathcal{I}(\theta) = \psi'(\theta) - \psi'(\theta + \beta)\) where \(\psi' = d^2\log\Gamma/d\theta^2\) is the trigamma function.

### Fisher Information and Sufficiency

There is an important relationship between Fisher information and sufficiency:

<div class="theorem">
<strong>Theorem (Information and Sufficiency)</strong>: Let \(T = T(X)\) be a statistic. The Fisher information in \(T\) (computed from the marginal distribution of \(T\)) satisfies \(\mathcal{I}_T(\theta) \leq \mathcal{I}_X(\theta)\), with equality for all \(\theta\) if and only if \(T\) is sufficient for \(\theta\).
</div>

This result, sometimes called the **data processing inequality** for Fisher information, formalizes the intuition that no statistic can extract more information about \(\theta\) than is in the original data, and only sufficient statistics preserve all of it. The proof uses the formula for conditional expectation of the score: \(S(\theta; X) = E[S(\theta; X) \mid T] + \text{residual}\), and the residual is orthogonal to \(E[S \mid T]\). Hence \(\mathcal{I}_X = \mathcal{I}_T + \mathcal{I}_{\text{residual}} \geq \mathcal{I}_T\), with equality iff the residual carries no information, i.e., \(S(\theta; X) = S(\theta; T)\) a.s., i.e., \(T\) is sufficient.

## The Cramér-Rao Lower Bound

<div class="theorem">
<strong>Theorem (Cramér-Rao Information Inequality)</strong>: Let \(\{f_\theta;\, \theta \in \Omega\}\) be a regular model and \(T(X)\) an unbiased estimator of \(\tau(\theta)\) with \(E_\theta[T^2] < \infty\). Then
\[
\operatorname{Var}_\theta(T) \geq \frac{[\tau'(\theta)]^2}{\mathcal{I}(\theta)}. \tag{CR}
\]
Equality holds if and only if \(f_\theta\) is a regular exponential family with natural sufficient statistic \(T(X)\).
</div>

<div class="proof">
<strong>Proof</strong>: Since \(T\) is unbiased: \(\int T(x)\, f_\theta(x)\, dx = \tau(\theta)\). Differentiating:
\[
\int T(x)\, \frac{\partial f_\theta}{\partial\theta}\, dx = \tau'(\theta) \implies \operatorname{Cov}_\theta(T,\, S(\theta; X)) = \tau'(\theta).
\]
By Cauchy-Schwarz: \([\tau'(\theta)]^2 = [\operatorname{Cov}(T, S)]^2 \leq \operatorname{Var}(T)\cdot\operatorname{Var}(S) = \operatorname{Var}(T)\cdot\mathcal{I}(\theta)\). Dividing by \(\mathcal{I}(\theta)\) gives (CR). Equality in Cauchy-Schwarz requires \(T\) and \(S\) to be affinely related: \(S(\theta; x) = c_1(\theta) T(x) + c_2(\theta)\). Integrating in \(\theta\) gives \(\log f_\theta(x) = C_1(\theta) T(x) + C_2(\theta) + C_3(x)\), i.e., a one-parameter exponential family.
</div>

The CRLB \([\tau'(\theta)]^2/\mathcal{I}(\theta)\) is the best possible variance for any unbiased estimator. An estimator achieving it is called **efficient**. The **efficiency** of an unbiased estimator \(T\) is the ratio \(e(T) = \text{CRLB}/\operatorname{Var}(T) \in (0, 1]\).

### Attainment of the CRLB

The CRLB is attained if and only if the model is an exponential family and \(T(X)\) is the natural sufficient statistic (up to scaling and centering). In particular:

- For \(X_i \overset{\text{iid}}{\sim} \text{Poi}(\theta)\): \(\bar{X}\) is the UMVUE of \(\theta\) and achieves CRLB \(\theta/n\).
- For \(X_i \overset{\text{iid}}{\sim} N(\theta, \sigma^2)\) known \(\sigma^2\): \(\bar{X}\) achieves CRLB \(\sigma^2/n\).
- For \(X_i \overset{\text{iid}}{\sim} \text{Exp}(\theta)\): \(\bar{X}\) is the UMVUE of \(1/\theta\) and achieves CRLB \(\theta^{-2}/n\). But \(1/\bar{X}\) is the UMVUE of \(\theta\) (more precisely a Rao-Blackwellized version); its variance exceeds the CRLB for \(\theta\) because the exponential family natural parameter is \(-\theta\), not \(\theta\).

### Hodge's Superefficient Estimator

For some time it was believed that no estimator could have variance below \(1/\mathcal{I}(\theta)\) at any \(\theta\). Hodges showed this is false: define

\[
T_n(X) = \begin{cases} \bar{X}/2 & \text{if } |\bar{X}| \leq n^{-1/4} \\ \bar{X} & \text{otherwise}\end{cases}
\]
for iid \(N(\theta, 1)\). Then \(\operatorname{Var}_\theta(T_n) \approx 1/(4n)\) at \(\theta = 0\), which is one quarter of the CRLB \(1/n\). However, for \(\theta \neq 0\), the extra factor \(1/4\) in efficiency is lost, and it can be shown that any estimator with variance below \(1/\mathcal{I}(\theta)\) at any \(\theta\) must have worse variance than the CRLB on a set of positive measure. This is Le Cam's bound.

## Multiparameter Fisher Information

When \(\theta = (\theta_1, \ldots, \theta_k)^T \in \mathbb{R}^k\), the score is the gradient \(S(\theta) = \nabla_\theta \ell(\theta)\) and the **Fisher information matrix** is

\[
\mathcal{I}(\theta) = E_\theta[S(\theta)S(\theta)^T] = \left[-E_\theta\!\left(\frac{\partial^2\ell}{\partial\theta_i\partial\theta_j}\right)\right]_{i,j=1}^k.
\]

For any unbiased estimator \(T(X)\) of a scalar function \(\tau(\theta)\) with gradient \(D(\theta) = \nabla_\theta \tau\):

\[
\operatorname{Var}_\theta(T) \geq D(\theta)^T\, \mathcal{I}(\theta)^{-1}\, D(\theta).
\]

For the bivariate normal model \((\mu_1, \mu_2, \sigma_1^2, \sigma_2^2, \rho)\), the Fisher information matrix is block-diagonal between the mean parameters and the covariance parameters, reflecting their orthogonality.

---

# Chapter 6: Fundamentals of Hypothesis Testing

## Order Statistics and Their Role

**Order statistics** \(X_{(1)} \leq X_{(2)} \leq \cdots \leq X_{(n)}\) are the sorted values of the sample. For a continuous model with completely unspecified density \(f\), the order statistic is the minimal sufficient statistic: the data contain no information about \(f\) beyond the sorted values, because the likelihood is symmetric in all permutations. For a parametric model, the order statistic is typically not minimal sufficient — further reduction is possible.

Order statistics arise repeatedly as sufficient statistics in location and scale families:

- **Uniform\((0,\theta)\)**: \(X_{(n)}\) is sufficient.
- **Uniform\((\theta-1,\theta+1)\)**: \((X_{(1)}, X_{(n)})\) is minimal sufficient (but not complete).
- **Shift-exponential \(\text{Exp}(1,\theta)\)**: \(X_{(1)}\) is sufficient.
- **Two-parameter exponential \(\text{Exp}(\beta, \gamma)\)**: \((X_{(1)}, \sum X_i)\) is jointly sufficient.

For **iid continuous data with completely unknown** density \(f \in \mathcal{F}\) (nonparametric model), the joint density is symmetric in all permutations of the data, so the conditional distribution of data given the order statistic does not depend on \(f\). The order statistic \((X_{(1)}, \ldots, X_{(n)})\) is minimal sufficient for \(f\).

## The Concept of Data Reduction

Data reduction proceeds in stages. Starting from the full data \((X_1, \ldots, X_n)\):

1. **Sufficient reduction**: compress to a sufficient statistic \(T\), losing no information about \(\theta\).
2. **Minimal sufficient reduction**: \(T\) is as small as possible while remaining sufficient.
3. **Complete sufficient reduction**: \(T\) is both minimal sufficient and complete (no unbiasedly-estimable zero-mean functions).

Each stage is strictly sharper than the previous one. The relationship is:

\[
\text{complete sufficient} \Rightarrow \text{minimal sufficient} \Rightarrow \text{sufficient}
\]

but no implication runs in the reverse direction (as the uniform\((\theta-1,\theta+1)\) example shows for the first implication, and any one-to-one function of a sufficient statistic shows for the second).

---

## Verifying Completeness in Practice

Completeness is most easily verified for exponential families using the moment generating function argument. For a one-parameter regular exponential family with natural sufficient statistic \(T\) and natural parameter \(\eta\), suppose \(E_\eta[h(T)] = 0\) for all \(\eta\) in an open interval. This means

\[
\int h(t)\, e^{\eta t}\, d\mu(t) = 0 \quad \text{for all } \eta \in (\eta_{\min}, \eta_{\max}).
\]

This is the bilateral Laplace transform of the measure \(h(t)\,d\mu(t)\) equaling zero on an open set. By the uniqueness theorem for Laplace transforms (analytic functions that vanish on an open set vanish identically), \(h(t) = 0\) \(\mu\)-a.e. Hence \(T\) is complete.

For the Bernoulli example: \(T = \sum X_i \sim \text{Bin}(n, \theta)\), and \(E_\theta[h(T)] = \sum_{t=0}^n h(t)\binom{n}{t}\theta^t(1-\theta)^{n-t} = 0\) for all \(\theta \in (0,1)\). Dividing by \((1-\theta)^n\) and setting \(u = \theta/(1-\theta)\), this becomes a polynomial in \(u\) that is zero for all \(u > 0\), hence all coefficients are zero: \(h(t)\binom{n}{t} = 0\) for all \(t\), meaning \(h = 0\).

## Non-Complete Sufficient Statistics: Examples

Not every sufficient statistic is complete. Two important examples:

**Example 1: \(N(\theta, a\theta^2)\).** The minimal sufficient statistic is \((\bar{X}, S^2)\). Completeness fails because the ratio \(\bar{X}/S\) has a distribution (related to the non-central \(t\)) that does depend on \(\theta\), but the function \(h = S^2/\bar{X}^2 - a(1 + 1/(n-1))\) satisfies \(E_\theta[h] = 0\) for all \(\theta > 0\) by standard moment computations — yet \(h\) is not identically zero.

**Example 2: Uniform\((\theta-1, \theta+1)\).** The minimal sufficient statistic is \(T = (X_{(1)}, X_{(n)})\). The function \(h(T) = X_{(n)} - X_{(1)} - (n-1)/(n+1)\) satisfies \(E_\theta[h(T)] = 0\) for all \(\theta\) (this follows from the formula \(E[X_{(n)} - X_{(1)}] = (n-1)/(n+1)\) in the Uniform(−1,1) distribution), but \(h\) is not identically zero.

## The Conditionality Principle and its Implications

The conditionality principle, like the sufficiency principle, shapes how Bayesian and frequentist statistics differ. The **sufficiency principle** says: if two data sets yield the same sufficient statistic, they should give the same inference. The **conditionality principle** says: if the data arise via a two-stage process (first choose "which experiment" from an ancillary variable, then observe the outcome), inference should condition on which experiment was actually performed.

Birnbaum (1962) showed that sufficiency and conditionality together imply the **likelihood principle**: all information in the data about \(\theta\) is contained in the likelihood function \(L(\theta; x)\), up to a constant free of \(\theta\). The likelihood principle is accepted by Bayesians but controversial among frequentists: it implies, for example, that sequential and fixed-sample experiments with the same likelihood should give the same inference, which conflicts with standard frequentist practice.

## The Decision Problem

Hypothesis testing is estimation's companion: rather than estimating the value of \(\theta\), we decide between two competing claims. The parameter space \(\Omega\) is partitioned into a **null hypothesis** region \(\Omega_0\) and an **alternative** \(\Omega_1 = \Omega \setminus \Omega_0\). A **null hypothesis** \(H_0: \theta \in \Omega_0\) is the "status quo" claim; it is maintained unless the data provide sufficient evidence against it. The asymmetry is intentional: rejecting \(H_0\) when it is true (Type I error) is considered more serious than failing to reject it when it is false (Type II error).

When \(\Omega_0\) consists of a single point, the hypothesis is **simple**; otherwise it is **composite**.

A **test** is specified by a **critical (rejection) region** \(R \subseteq \mathcal{X}\): we reject \(H_0\) iff \(X \in R\). Randomized tests allow a probability of rejection \(\phi(x) \in [0,1]\) at each point; randomization is needed to achieve exact size in discrete models.

## The Power Function

<div class="definition">
<strong>Definition (Power Function)</strong>: The <em>power function</em> of a test with critical region \(R\) is
\[
\beta(\theta) = P_\theta(X \in R), \quad \theta \in \Omega.
\]
</div>

The power function summarizes all operating characteristics:
- For \(\theta \in \Omega_0\): \(\beta(\theta)\) is the Type I error rate; we want this small (bounded by \(\alpha\)).
- For \(\theta \in \Omega_1\): \(\beta(\theta)\) is the power; we want this large (close to 1).

An ideal test would have \(\beta(\theta) = 0\) on \(\Omega_0\) and \(\beta(\theta) = 1\) on \(\Omega_1\), but this is generally unattainable. The convention is to fix the **size** — the maximum Type I error rate — at \(\alpha\) and then maximize power subject to this constraint.

<div class="definition">
<strong>Definition (Size and Level)</strong>: A test has <em>level</em> \(\alpha\) if \(\beta(\theta) \leq \alpha\) for all \(\theta \in \Omega_0\). Its <em>size</em> is \(\sup_{\theta \in \Omega_0}\beta(\theta)\).
</div>

## p-Values

A **p-value** \(p(X)\) is a statistic satisfying \(P_\theta(p(X) \leq u) \leq u\) for all \(\theta \in \Omega_0\) and all \(u \in [0,1]\). In the continuous case, \(p(X)\) is uniformly distributed on \([0,1]\) under any \(\theta \in \Omega_0\). The conventional interpretation: a small p-value is strong evidence against \(H_0\). Rejecting when \(p(X) \leq \alpha\) gives a level-\(\alpha\) test.

The p-value for a one-sided test based on statistic \(T\) (reject for large \(T\)) is \(P_{\theta_0}(T(X) \geq T(x_\text{obs}))\). The two-sided p-value for a symmetric null distribution is twice the one-sided value.

### Misinterpretation of p-Values

The p-value is frequently misinterpreted. It is **not** the probability that \(H_0\) is true. It is not the probability that the result occurred by chance. It is not the probability that a replication would give the same result. It is the probability, under the null model, of observing data as extreme or more extreme than observed. The p-value says nothing about effect size, practical significance, or the probability of the hypothesis.

The American Statistical Association (2016) statement on p-values emphasizes: a p-value does not measure the probability that the hypothesis is true; decisions should not be made solely by thresholding p at 0.05; and p-values should be accompanied by effect size estimates and confidence intervals.

## Unbiased and Consistent Tests

A test is **unbiased** of level \(\alpha\) if additionally \(\beta(\theta) \geq \alpha\) for all \(\theta \in \Omega_1\). Unbiasedness says the probability of rejecting is at least as large under the alternative as under the null — the test performs at least as well as a random coin flip at every alternative. For symmetric distributions and two-sided alternatives, requiring unbiasedness often characterizes the standard test (e.g., two-sided \(t\)-test).

A test is **consistent** if \(\beta(\theta) \to 1\) as \(n \to \infty\) for every \(\theta \in \Omega_1\). Consistency is a minimal large-sample requirement: as data accumulate, the test should eventually detect any fixed alternative.

## Confidence Sets via Test Inversion

The duality between tests and confidence sets is a cornerstone of frequentist inference:

<div class="theorem">
<strong>Theorem (Test Inversion)</strong>: For each \(\theta_0 \in \Omega\), let \(A(\theta_0)\) be the acceptance region of a level-\(\alpha\) test for \(H_0: \theta = \theta_0\). Then
\[
C(x) = \{\theta_0 \in \Omega : x \in A(\theta_0)\}
\]
is a \((1-\alpha)\) confidence set, i.e., \(P_\theta(\theta \in C(X)) \geq 1-\alpha\) for all \(\theta\).
</div>

Conversely, for any \((1-\alpha)\) confidence set \(C(X)\), rejecting \(H_0: \theta = \theta_0\) when \(\theta_0 \notin C(X)\) gives a level-\(\alpha\) test. The most powerful tests yield the shortest confidence intervals, and vice versa. This connection means that results from Chapter 7 on optimal tests immediately translate into optimal confidence intervals.

---

# Chapter 7: The Neyman-Pearson Lemma and UMP Tests

## Most Powerful Tests for Simple Hypotheses

The Neyman-Pearson lemma gives the complete solution to the simplest testing problem: choosing between two fully specified distributions.

<div class="theorem">
<strong>Theorem (Neyman-Pearson Lemma, 1933)</strong>: Consider testing \(H_0: \theta = \theta_0\) vs. \(H_1: \theta = \theta_1\). For any \(k \geq 0\), define the critical region
\[
R = \left\{x : \frac{f_{\theta_1}(x)}{f_{\theta_0}(x)} > k\right\}.
\]
If \(P_{\theta_0}(X \in R) = \alpha\), then \(R\) is the <em>most powerful test</em> of level \(\alpha\): for any other critical region \(R^*\) with \(P_{\theta_0}(R^*) \leq \alpha\), we have \(P_{\theta_1}(R) \geq P_{\theta_1}(R^*)\). Moreover, any MP level-\(\alpha\) test has the form of \(R\) (possibly with randomization on the boundary).
</div>

<div class="proof">
<strong>Proof</strong>: Let \(R^*\) be any critical region with \(P_{\theta_0}(R^*) \leq \alpha = P_{\theta_0}(R)\). Consider the four regions \(R \cap R^*\), \(R \cap \bar R^*\), \(\bar R \cap R^*\), \(\bar R \cap \bar R^*\). From the size constraint:
\[
\int_{R \cap \bar{R}^*} f_{\theta_0}\, dx \leq \int_{\bar R \cap R^*} f_{\theta_0}\, dx. \tag{*}
\]
On \(R \cap \bar{R}^*\): the likelihood ratio exceeds \(k\), so \(f_{\theta_1}(x) > k\, f_{\theta_0}(x)\). On \(\bar R \cap R^*\): the ratio is at most \(k\), so \(f_{\theta_1}(x) \leq k\, f_{\theta_0}(x)\). Therefore:

\[
P_{\theta_1}(R) - P_{\theta_1}(R^*) = \int_{R \cap \bar{R}^*} f_{\theta_1}\, dx - \int_{\bar{R} \cap R^*} f_{\theta_1}\, dx \geq k\!\left(\int_{R \cap \bar{R}^*} f_{\theta_0}\, dx - \int_{\bar{R} \cap R^*} f_{\theta_0}\, dx\right) \geq 0
\]
using (*) in the last step.
</div>

The NP lemma delivers a remarkably clean message: among all tests with the same Type I error rate, the one based on the likelihood ratio maximizes power. The likelihood ratio \(f_{\theta_1}(x)/f_{\theta_0}(x)\) is the sufficient statistic for the problem of testing two simple hypotheses.

**Example: Normal mean.** For \(X_i \overset{\text{iid}}{\sim} N(\theta, \sigma^2)\) known \(\sigma^2\), testing \(H_0: \theta = 0\) vs. \(H_1: \theta = \theta_1 > 0\):

\[
\frac{f_{\theta_1}(x)}{f_0(x)} = \exp\!\left\{\frac{\theta_1}{\sigma^2}\sum x_i - \frac{n\theta_1^2}{2\sigma^2}\right\}.
\]
This is increasing in \(\sum x_i = n\bar{x}\), so the NP critical region is \(\{\bar{X} > c\}\) for some \(c\). The threshold \(c = z_\alpha \sigma/\sqrt{n}\) gives size \(\alpha\). Crucially, the critical region does not depend on the specific value of \(\theta_1 > 0\) (only on its sign), which leads directly to the UMP test.

## Monotone Likelihood Ratio and UMP Tests

<div class="definition">
<strong>Definition (Monotone Likelihood Ratio)</strong>: A family \(\{f_\theta;\, \theta \in \mathbb{R}\}\) has <em>monotone likelihood ratio (MLR)</em> in a statistic \(T(X)\) if for any \(\theta_1 > \theta_0\), the ratio \(f_{\theta_1}(x)/f_{\theta_0}(x)\) is a non-decreasing function of \(T(x)\).
</div>

Every one-parameter regular exponential family has MLR in its natural sufficient statistic \(T(X)\), because

\[
\frac{f_{\eta_1}(x)}{f_{\eta_0}(x)} \propto \exp\{(\eta_1 - \eta_0)T(x)\},
\]
which is increasing in \(T(x)\) when \(\eta_1 > \eta_0\).

<div class="theorem">
<strong>Theorem (Karlin-Rubin)</strong>: Suppose the family has MLR in \(T(X)\). For testing \(H_0: \theta \leq \theta_0\) vs. \(H_1: \theta > \theta_0\), the test that rejects when \(T(X) > c_\alpha\) (where \(c_\alpha\) is determined by \(P_{\theta_0}(T > c_\alpha) = \alpha\)) is UMP of size \(\alpha\). Its power function \(\beta(\theta)\) is non-decreasing in \(\theta\).
</div>

**Proof sketch:** By the NP lemma, the most powerful test of \(\theta = \theta_0\) vs. \(\theta = \theta_1 > \theta_0\) rejects when the likelihood ratio exceeds a threshold, which by MLR is equivalent to \(T(X) > c_{\alpha, \theta_1}\). Since the critical region \(\{T > c_\alpha\}\) is the NP rejection region for *every* \(\theta_1 > \theta_0\) (with the same threshold determined by size), it is uniformly most powerful.

**Non-existence of UMP for two-sided alternatives.** For testing \(H_0: \theta = \theta_0\) vs. \(H_1: \theta \neq \theta_0\), no UMP test generally exists. The NP lemma gives the rejection region \(\{T > c\}\) for \(\theta_1 > \theta_0\) and \(\{T < c'\}\) for \(\theta_1 < \theta_0\). No single region can be simultaneously most powerful against alternatives on both sides. This necessitates either restricting to unbiased tests (yielding the UMPU test) or employing the GLRT.

## UMP Unbiased Tests in Exponential Families

For a one-parameter exponential family with natural sufficient statistic \(T\) and natural parameter \(\eta\), the UMPU test of \(H_0: \eta = \eta_0\) vs. \(H_1: \eta \neq \eta_0\) has critical region

\[
R = \{x : T(x) < c_1\} \cup \{x : T(x) > c_2\}
\]
where \(c_1 < c_2\) are chosen so that:
1. \(P_{\eta_0}(T \in R) = \alpha\) (size condition).
2. \(E_{\eta_0}[T(X) \cdot \mathbf{1}_R(X)] = \alpha \cdot E_{\eta_0}[T(X)]\) (unbiasedness condition).

The second condition ensures the power function has a minimum at \(\eta_0\) (derivative of power equals zero at the null). For the normal distribution, this gives the standard equal-tailed test.

**Example: Poisson two-sided test.** For \(X_1, \ldots, X_n \overset{\text{iid}}{\sim} \text{Poi}(\lambda)\), testing \(H_0: \lambda = \lambda_0\) vs. \(H_1: \lambda \neq \lambda_0\). The sufficient statistic \(T = \sum X_i \sim \text{Poi}(n\lambda)\). The UMPU test has critical region \(\{T < c_1\} \cup \{T > c_2\}\) with \(c_1, c_2\) determined by the two conditions above. For discrete distributions, the exact conditions may require randomization on the boundary.

## Power Calculations and Sample Size Determination

A central practical problem in experimental design is determining how large a sample is needed to achieve a desired power. For the one-sample normal test of \(H_0: \mu = \mu_0\) vs. \(H_1: \mu = \mu_1 > \mu_0\) at level \(\alpha\) with known \(\sigma\), the power is

\[
\beta(\mu_1) = \Phi\!\left(\frac{(\mu_1-\mu_0)\sqrt{n}}{\sigma} - z_\alpha\right).
\]

Setting \(\beta(\mu_1) = 1 - \beta_0\) (desired power) and solving:

\[
n = \left\lceil\frac{(z_\alpha + z_{\beta_0})^2\sigma^2}{(\mu_1 - \mu_0)^2}\right\rceil.
\]

This formula reveals that the required sample size grows as \(\sigma^2/\delta^2\) where \(\delta = |\mu_1 - \mu_0|\) is the **effect size**. For a two-sided test, replace \(z_\alpha\) by \(z_{\alpha/2}\). Doubling the effect size reduces the required sample size by a factor of four.

For tests where the variance is unknown (which is typical in practice), the sample size calculation must use the non-central \(t\) distribution, and since \(\sigma\) is also estimated, the power depends on both \(\delta/\sigma\) and \(n\). Software typically solves this numerically.

**Operating characteristic curves** graphically display power as a function of the effect size \(\delta/\sigma\) for various \(n\), facilitating the choice of sample size based on practical significance thresholds.

---

# Chapter 8: Generalized Likelihood Ratio Tests

## The GLRT Framework

When no UMP or UMPU test is available — which is the case for most multi-parameter problems — the **generalized likelihood ratio test** (GLRT) provides a general, principled procedure. Its philosophy: compare how much better the data fit the unconstrained model versus the null model.

<div class="definition">
<strong>Definition (GLRT Statistic)</strong>: For testing \(H_0: \theta \in \Omega_0\) vs. \(H_1: \theta \in \Omega \setminus \Omega_0\), the <em>GLRT statistic</em> is
\[
\Lambda(x) = \frac{\sup_{\theta \in \Omega} L(\theta; x)}{\sup_{\theta \in \Omega_0} L(\theta; x)} = \frac{L(\hat\theta)}{L(\hat\theta_0)},
\]
where \(\hat\theta\) is the unrestricted MLE and \(\hat\theta_0 = \arg\max_{\theta \in \Omega_0} L(\theta)\) is the restricted MLE. The GLRT rejects \(H_0\) when \(\Lambda > c\).
</div>

Since \(\Omega_0 \subseteq \Omega\), we always have \(L(\hat\theta) \geq L(\hat\theta_0)\), so \(\Lambda \geq 1\). A large \(\Lambda\) means the unrestricted model fits the data substantially better than the null model. The constant \(c\) is determined by the size requirement \(\sup_{\theta \in \Omega_0} P_\theta(\Lambda > c) = \alpha\).

## Wilks' Theorem

The key to using the GLRT is determining the null distribution of \(\Lambda\). Wilks' theorem provides a universal asymptotic answer.

<div class="theorem">
<strong>Theorem (Wilks, 1938)</strong>: Let \(X_1, \ldots, X_n\) be iid from a regular model \(\{f_\theta;\, \theta \in \Omega\}\) where \(\Omega\) is open in \(\mathbb{R}^k\). Consider \(H_0: \theta \in \Omega_0\) where \(\Omega_0 = \{\theta(\eta) : \eta \in H\}\) for \(H\) open in \(\mathbb{R}^q\) with \(q < k\). Under \(H_0\),
\[
W_n = 2\log\Lambda_n(X) \overset{d}{\to} \chi^2(k - q).
\]
</div>

<div class="proof">
<strong>Proof sketch</strong>: Let \(\theta_0\) be the true parameter. The key is the Taylor expansion of the log-likelihood ratio:
\[
2\log\Lambda_n = 2[\ell(\hat\theta) - \ell(\hat\theta_0)] \approx n(\hat\theta - \hat\theta_0)^T \mathcal{I}(\theta_0)(\hat\theta - \hat\theta_0).
\]
Under \(H_0\), the asymptotic normality of MLEs gives \(\sqrt{n}(\hat\theta - \theta_0) \overset{d}{\to} N(0, \mathcal{I}(\theta_0)^{-1})\). The null constraint restricts \(\hat\theta_0\) to the \(q\)-dimensional manifold \(\Omega_0\), so the difference \(\hat\theta - \hat\theta_0\) lives asymptotically in the \((k-q)\)-dimensional space orthogonal to the constraint surface. The quadratic form \((\hat\theta - \hat\theta_0)^T \mathcal{I}(\theta_0)(\hat\theta - \hat\theta_0)\) thus converges in distribution to \(\chi^2(k-q)\).
</div>

The degrees of freedom \(k - q\) equal the number of constraints imposed by \(H_0\), or equivalently the difference between the dimensions of the unconstrained and constrained parameter spaces. This is the "effective number of parameters freed" by rejecting \(H_0\).

### Applications of Wilks' Theorem

**Normal mean with unknown variance.** Test \(H_0: \mu = 0\) vs. \(H_1: \mu \neq 0\) for \(X_i \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\). Here \(\Omega \subseteq \mathbb{R}^2\) (\(k=2\)), \(\Omega_0 = \{0\} \times (0,\infty)\) (\(q=1\)), so \(k-q=1\). The GLR statistic simplifies to

\[
\Lambda = \left(1 + \frac{T^2}{n-1}\right)^{n/2}, \quad T = \frac{\bar{X}\sqrt{n}}{S}.
\]
For any finite \(n\), the exact test rejects when \(T^2 > F_{1-\alpha}(1, n-1)\) (using the \(F\) distribution); by Wilks, \(T^2 \overset{d}{\to} \chi^2(1)\) under \(H_0\) as \(n \to \infty\).

**Likelihood ratio test for normal mean vs. normal variance.** Consider \(X_i \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\) and test \(H_0: \mu = \mu_0, \sigma^2 = \sigma_0^2\) vs. \(H_1: (\mu, \sigma^2) \neq (\mu_0, \sigma_0^2)\). Here \(k=2, q=0\), giving \(2\log\Lambda \overset{d}{\to} \chi^2(2)\). This test simultaneously checks both parameters.

**Multinomial goodness-of-fit.** For a multinomial with \(m\) categories and \(n\) observations, testing \(H_0: p_j = p_j(\theta)\) for some parametric model. The GLRT statistic is

\[
G^2 = 2\sum_{j=1}^m O_j \log\frac{O_j}{E_j},
\]
where \(E_j = n\,p_j(\hat\theta)\) are expected counts and \(O_j\) observed. Under \(H_0\), \(G^2 \overset{d}{\to} \chi^2(m-1-d)\) where \(d = \dim\theta\). Note \(G^2\) and Pearson's \(\chi^2 = \sum (O_j - E_j)^2/E_j\) are asymptotically equivalent to first order.

## The Wald Test

The **Wald test** does not require fitting the restricted model \(\hat\theta_0\), using only the unrestricted MLE:

\[
W = (\hat\theta - \theta_0)^T\, \mathcal{I}(\hat\theta)\, (\hat\theta - \theta_0) \overset{d}{\to} \chi^2(k) \quad \text{under } H_0: \theta = \theta_0.
\]
For a scalar \(\theta\): \(W = (\hat\theta - \theta_0)^2 / \operatorname{Var}(\hat\theta) \overset{d}{\to} \chi^2(1)\), or equivalently \(\sqrt{W} \overset{d}{\to} N(0,1)\).

The Wald test is computationally convenient but can have poor coverage properties in small samples when the parameter is near a boundary or the information matrix is ill-conditioned.

## The Score Test (Rao Test)

The **score test** requires only the restricted MLE \(\hat\theta_0\). Under \(H_0: \theta = \theta_0\):

\[
R = S(\theta_0)^T\, \mathcal{I}(\theta_0)^{-1}\, S(\theta_0) \overset{d}{\to} \chi^2(k).
\]
This is also called the **Rao test**. Its advantage is that it only requires computing the score at the null value, which is often much easier than finding the unrestricted MLE.

**Asymptotic equivalence.** Under both \(H_0\) and local alternatives \(\theta_n = \theta_0 + h/\sqrt{n}\), the GLRT, Wald, and score test statistics all converge to the same distribution. Specifically, each converges to a non-central \(\chi^2(k, \delta)\) under local alternatives where \(\delta = h^T\mathcal{I}(\theta_0)h\) is the non-centrality parameter. This means the three tests have the same asymptotic power against local alternatives.

**Locally most powerful test.** For testing \(H_0: \theta = \theta_0\) vs. \(H_1: \theta > \theta_0\) in a one-parameter regular model, the score test with critical region \(\{S(\theta_0; X) > c\}\) is the locally most powerful test (LMP). This follows from the Taylor expansion of the power function: any test that beats the score test for alternatives close to \(\theta_0\) would have to be inadmissible under the NP lemma.

### Choosing Among the Three Tests

In finite samples, the three tests differ and the choice matters:

**Wald test**: Easy to compute after fitting the unconstrained model. Works poorly near boundaries of the parameter space and is not transformation-invariant. For testing \(H_0: \sigma^2 = 1\), testing via \(\hat\sigma - 1\) (scale) or \(\hat\sigma^2 - 1\) (squared scale) give different \(p\)-values. A severe weakness.

**Score test**: Only requires fitting the null model. Well-suited for testing goodness of fit or testing that extra parameters are zero in a larger model. Computationally attractive when the null model is simple and the unconstrained model is hard to fit.

**GLRT**: Best overall operating characteristics in practice. Transformation-invariant and always range-respecting. The "default" for routine testing in regular parametric models.

For small samples in non-normal models, exact conditional tests (when available) should be preferred over all three asymptotic procedures. In generalized linear models (logistic, Poisson regression), the GLRT (likelihood ratio statistic) is the standard choice.

---

# Chapter 9: Confidence Intervals and Regions

## Bayesian Inference: Conjugate Priors and Point Estimation

Bayesian inference provides an alternative to the frequentist UMVUE and MLE framework. The key concept is the **posterior distribution**: given data \(x\) and prior \(\pi(\theta)\), the posterior is

\[
\pi(\theta \mid x) \propto L(\theta; x)\,\pi(\theta).
\]

A **conjugate prior** is one where the posterior is in the same family as the prior. For exponential family models, conjugate priors always exist and take the form

\[
\pi_{\eta_0, \tau_0}(\theta) \propto C(\eta)^{\tau_0}\exp\{\eta_0^T\theta\},
\]
where \(\eta_0, \tau_0\) are hyperparameters. After observing data with sufficient statistic \(t\) and sample size \(n\), the posterior is the same family with updated hyperparameters \((\eta_0 + t,\, \tau_0 + n)\).

**Conjugate priors for standard families:**

| Model | Prior | Posterior |
|---|---|---|
| Binomial\((n,\theta)\) | Beta\((\alpha, \beta)\) | Beta\((\alpha + x, \beta + n - x)\) |
| Poisson\((\theta)\) | Gamma\((\alpha, \beta)\) | Gamma\((\alpha + \sum x_i, \beta + n)\) |
| Normal\((\theta, \sigma^2)\) known \(\sigma^2\) | Normal\((\mu_0, \tau_0^2)\) | Normal\(\left(\frac{\sigma^2 \mu_0 + n\tau_0^2 \bar x}{\sigma^2 + n\tau_0^2}, \frac{\sigma^2\tau_0^2}{\sigma^2 + n\tau_0^2}\right)\) |
| Exponential\((\theta)\) | Gamma\((\alpha, \beta)\) | Gamma\((\alpha + n,\; \beta + \sum x_i)\) |

The **Bayes estimator** minimizing posterior MSE is the posterior mean \(\tilde\theta = E[\theta \mid X]\). For squared error loss, the Bayes estimator is always the posterior mean. For absolute error loss, it is the posterior median. The **Jeffreys prior** is \(\pi(\theta) \propto [\mathcal{I}(\theta)]^{1/2}\), which is invariant under reparameterization and serves as a "default" noninformative prior.

For the normal model with prior \(\theta \sim N(\mu_0, \tau_0^2)\) and \(X_i \overset{\text{iid}}{\sim} N(\theta, \sigma^2)\), the posterior mean is

\[
\tilde\theta = \frac{n/\sigma^2}{n/\sigma^2 + 1/\tau_0^2}\bar{X} + \frac{1/\tau_0^2}{n/\sigma^2 + 1/\tau_0^2}\mu_0,
\]
a weighted average of the data mean and the prior mean. As \(n \to \infty\), the weight on \(\bar{X}\) dominates; as \(\tau_0^2 \to \infty\) (diffuse prior), the Bayes estimate approaches \(\bar{X}\), the MLE.

## From Tests to Confidence Sets

The test-inversion method converts any family of hypothesis tests into confidence sets. For a one-parameter model, inverting the acceptance regions \(A(\theta_0) = \{x : H_0:\theta=\theta_0 \text{ not rejected}\}\) over all \(\theta_0\) yields a \((1-\alpha)\) confidence set:

\[
C(x) = \{\theta_0 : x \in A(\theta_0)\}.
\]

The optimality of tests translates to optimality of confidence sets. UMP tests yield uniformly shortest confidence intervals; UMPU tests yield shortest unbiased confidence intervals.

## Exact Confidence Intervals via Pivots

A **pivot** \(Q(X, \theta)\) is a function of data and parameter whose distribution is known and independent of \(\theta\). From the pivot, an exact \((1-\alpha)\) CI is constructed by solving \(q_{\alpha/2} \leq Q(X,\theta) \leq q_{1-\alpha/2}\) for \(\theta\).

**Normal mean, known variance.** \(Q = \sqrt{n}(\bar{X} - \mu)/\sigma \sim N(0,1)\). Solving gives \(C = [\bar{X} - z_{\alpha/2}\sigma/\sqrt{n},\; \bar{X} + z_{\alpha/2}\sigma/\sqrt{n}]\).

**Normal mean, unknown variance.** \(Q = \sqrt{n}(\bar{X} - \mu)/S \sim t(n-1)\). Solving gives the **Student \(t\)-interval**:

\[
C = \left[\bar{X} - t_{\alpha/2, n-1}\frac{S}{\sqrt{n}},\; \bar{X} + t_{\alpha/2, n-1}\frac{S}{\sqrt{n}}\right].
\]
This is the prototypical frequentist confidence interval and the unique UMVUE-based shortest interval for the normal mean.

**Normal variance.** \(Q = (n-1)S^2/\sigma^2 \sim \chi^2(n-1)\). Solving gives

\[
C = \left[\frac{(n-1)S^2}{\chi^2_{\alpha/2, n-1}},\; \frac{(n-1)S^2}{\chi^2_{1-\alpha/2, n-1}}\right].
\]
Because the \(\chi^2\) distribution is asymmetric, the equal-tail CI is not the shortest possible. The shortest CI uses \(\chi^2\) quantiles satisfying \(\chi^2_{u} = \chi^2_{u - (1-\alpha)}\) with \(f(q_1) = f(q_2)\) (matching the pdf at endpoints), but this requires numerical computation.

## Large-Sample Confidence Intervals

### Wald Intervals

The asymptotic normality of the MLE gives the **Wald interval** for a scalar parameter \(\theta\):

\[
C_n = \left[\hat\theta_n \pm z_{\alpha/2}\,\frac{1}{\sqrt{n\,\mathcal{I}(\hat\theta_n)}}\right].
\]
Replacing the Fisher information by the observed information \(-\ell''(\hat\theta)/n\) gives an equivalent interval. The Wald interval is first-order correct: \(P_\theta(\theta \in C_n) = 1-\alpha + O(1/\sqrt{n})\).

**Delta method intervals.** For a function \(g(\theta)\) with \(g'(\hat\theta) \neq 0\):

\[
g(\hat\theta) \pm z_{\alpha/2}\,\frac{|g'(\hat\theta)|}{\sqrt{n\,\mathcal{I}(\hat\theta)}}.
\]
For example, a CI for \(e^{-\lambda}\) from Poisson data: \(e^{-\bar{X}} \pm z_{\alpha/2}\, e^{-\bar{X}}/\sqrt{n\bar{X}}\).

### Likelihood Ratio Intervals

From Wilks' theorem, the **likelihood ratio confidence set** is

\[
C_n = \left\{\theta_0 : 2[\ell(\hat\theta) - \ell(\theta_0)] \leq \chi^2_\alpha(1)\right\} = \left\{\theta_0 : \frac{L(\theta_0)}{L(\hat\theta)} \geq e^{-\chi^2_\alpha(1)/2}\right\}.
\]
This is the set of parameter values whose relative likelihood exceeds \(\exp(-\chi^2_\alpha(1)/2) \approx 0.147\) for \(\alpha = 0.05\). Likelihood ratio CIs are:
- **Transformation-equivariant**: the CI for \(g(\theta)\) is exactly \(g\) applied to the CI for \(\theta\).
- **Range-respecting**: automatically contained in the parameter space \(\Omega\).
- **Second-order accurate**: error in coverage is \(O(1/n)\) vs. \(O(1/\sqrt{n})\) for Wald intervals.

### Profile Likelihood Intervals

When there are nuisance parameters \(\lambda\), inference on a scalar \(\psi = \psi(\theta)\) uses the **profile log-likelihood**:

\[
\ell_p(\psi) = \max_{\lambda:\, \psi(\theta)=\psi}\, \ell(\theta, \lambda).
\]
The profile likelihood CI is \(\{\psi_0 : 2[\ell_p(\hat\psi) - \ell_p(\psi_0)] \leq \chi^2_\alpha(1)\}\), which has the same Wilks asymptotic coverage guarantee. Profile likelihood intervals automatically account for uncertainty in the nuisance parameters.

## Bayesian Credible Intervals

In Bayesian inference, a **credible interval** (or **credible region** in higher dimensions) of level \(1-\alpha\) is any set \(C\) satisfying

\[
P(\theta \in C \mid X = x) = \int_C \pi(\theta \mid x)\, d\theta = 1-\alpha,
\]
where \(\pi(\theta \mid x) \propto L(\theta; x)\, \pi(\theta)\) is the posterior distribution with prior \(\pi(\theta)\).

The interpretation is fundamentally different from a frequentist CI: a Bayesian can say "the probability that the parameter lies in \(C\) is \(1-\alpha\)," conditioning on the observed data. A frequentist CI only guarantees that the procedure generates an interval containing the true parameter with frequency \(1-\alpha\) over repeated experiments.

The **highest posterior density (HPD) interval** is \(\{\theta : \pi(\theta \mid x) \geq c\}\) where \(c\) is the largest value maintaining \(1-\alpha\) posterior probability. HPD intervals are the shortest credible intervals for unimodal posteriors, analogous to how the equal-tail CI minimizes length for symmetric pivots.

**Asymptotic equivalence.** For large \(n\), the posterior concentrates around \(\hat\theta\) and approximates \(N(\hat\theta, (n\mathcal{I}(\hat\theta))^{-1})\) by the Bernstein-von Mises theorem (for priors smooth and positive near the true \(\theta\)). Thus frequentist and Bayesian intervals agree to first order for large samples: \(C_{\text{HPD}} \approx C_{\text{Wald}}\).

## Shortest Confidence Intervals in Location Families

For a location family pivot \(T - \theta \sim G\) (distribution-free of \(\theta\)), the \((1-\alpha)\) CI is \([T - q_2, T - q_1]\) where \(G(q_2) - G(q_1) = 1-\alpha\). Its expected length is \(q_2 - q_1\), which is minimized subject to the coverage constraint by finding \(q_1, q_2\) that minimize \(q_2 - q_1\) subject to \(G(q_2) - G(q_1) = 1-\alpha\). For unimodal symmetric distributions (normal, \(t\)), the equal-tail choice \(q_1 = -q_{1-\alpha/2}\), \(q_2 = q_{1-\alpha/2}\) is optimal. For asymmetric distributions, the optimal \(q_1, q_2\) satisfy \(g(q_1) = g(q_2)\) (equal density at the endpoints).

## Simultaneous Inference

When constructing intervals for multiple parameters or an entire regression function, marginal \((1-\alpha)\) intervals do not control the **familywise error rate** (FWER): the probability that at least one interval fails to cover its target. **Scheffé bands** for linear contrasts in a normal linear model are:

\[
\left|a^T\hat\theta - a^T\theta\right| \leq \sqrt{k\, F_\alpha(k, n-p)}\cdot\sqrt{a^T(X^TX)^{-1}a\cdot\hat\sigma^2}
\]
simultaneously for all \(a\). These bands are exact (not asymptotic) for normal linear models and give \(1-\alpha\) simultaneous coverage for all linear contrasts.

For simultaneous coverage at a finite collection of parameters \(\theta_1, \ldots, \theta_m\), the **Bonferroni method** uses \(\alpha/m\) for each individual CI, giving a FWER of at most \(\alpha\). It is conservative when the parameters are positively correlated.

## Fiducial and Objective Bayesian Intervals

Fisher's **fiducial inference** attempts to assign a probability distribution to the parameter without a prior. For a scalar parameter \(\theta\) with a strictly monotone sufficient statistic \(T\), the fiducial distribution is obtained by "inverting" the sampling distribution: since \(P_\theta(T \leq t) = F(t;\theta)\) is monotone in \(\theta\) for fixed \(t\), treating \(F(t;\theta)\) as a CDF in \(\theta\) gives the fiducial distribution. For location families, fiducial intervals coincide with frequentist pivot-based intervals and Bayesian intervals under flat priors. For other models, fiducial inference is ambiguous and has largely been superseded by Bayesian and likelihood methods.

**Jeffreys prior and objective Bayes.** The **Jeffreys prior** \(\pi(\theta) \propto [\mathcal{I}(\theta)]^{1/2}\) is invariant under reparameterization: if \(\lambda = g(\theta)\), the Jeffreys prior for \(\lambda\) is obtained by applying the change-of-variables to the Jeffreys prior for \(\theta\). For the normal mean (known \(\sigma^2\)), Jeffreys prior is flat and the resulting HPD interval is the Wald interval. For the binomial proportion, Jeffreys prior is \(\text{Beta}(1/2, 1/2)\), giving credible intervals with substantially better frequentist coverage than the Wald interval in small samples, particularly near \(\theta = 0\) or \(\theta = 1\).

## Bootstrap Confidence Intervals

Bootstrap CIs are non-parametric and rely only on the consistency of the estimator. Given the iid sample \(X_1, \ldots, X_n\), draw \(B\) bootstrap samples \(X^{*1}, \ldots, X^{*B}\) (each of size \(n\) with replacement) and compute \(\hat\tau^{*b} = \hat\tau(X^{*b})\).

**Percentile bootstrap CI:** \([\hat\tau^*_{(\alpha/2)},\; \hat\tau^*_{(1-\alpha/2)}]\), the \(\alpha/2\) and \(1-\alpha/2\) quantiles of the bootstrap distribution.

**Percentile-t bootstrap CI:** Standardize by the bootstrap SE and take quantiles of \((\hat\tau^* - \hat\tau)/\hat{SE}^*\), then back-transform. First-order accurate.

**BCa (bias-corrected and accelerated) CI:** Adjusts for bias and skewness in the bootstrap distribution. Achieves second-order accuracy \(O(1/n)\) in coverage error, the same as the likelihood ratio CI, but without requiring the likelihood.

### Comparison of CI Methods

The following table summarizes the key properties of the main CI methods for a scalar parameter \(\theta\):

| Method | Requires | Coverage accuracy | Invariant under \(g(\theta)\) | Respects \(\Omega\) |
|---|---|---|---|---|
| Exact pivot | Exact pivot exists | Exact | Usually yes | Yes |
| Wald | MLE, Fisher info | \(O(n^{-1/2})\) | No | No |
| Likelihood ratio | MLE, full likelihood | \(O(n^{-1})\) | Yes | Yes |
| Profile LR | MLE, profile likelhood | \(O(n^{-1})\) | Yes | Yes |
| Bootstrap (BCa) | MLE or estimator | \(O(n^{-1})\) | Yes | Approximately |
| Bayesian HPD | Prior + posterior | Coverage is Bayesian | Yes | Yes |

For practical recommendations: use the likelihood ratio interval when the full likelihood is available; use Wald intervals for quick computation when \(n\) is large; use profile likelihood for nuisance parameters; use bootstrap BCa for complex estimators without tractable likelihoods.

## Bayesian Hypothesis Testing

The Bayesian approach to hypothesis testing is coherent and avoids some of the logical difficulties of p-values. Given prior probabilities \(\pi_0 = P(H_0)\) and \(\pi_1 = 1 - \pi_0 = P(H_1)\), the **posterior odds** after observing data \(x\) are:

\[
\frac{P(H_1 \mid x)}{P(H_0 \mid x)} = \frac{P(x \mid H_1)}{P(x \mid H_0)} \cdot \frac{\pi_1}{\pi_0} = B_{10} \cdot \frac{\pi_1}{\pi_0},
\]
where \(B_{10} = P(x \mid H_1)/P(x \mid H_0)\) is the **Bayes factor**. The Bayes factor compares the marginal likelihoods of the data under the two hypotheses, integrating out unknown parameters under each:

\[
P(x \mid H_j) = \int L(\theta_j; x)\, \pi_j(\theta_j)\, d\theta_j.
\]

For simple hypotheses \(H_0: \theta = \theta_0\) and \(H_1: \theta = \theta_1\), \(B_{10} = L(\theta_1)/L(\theta_0)\) reduces to the likelihood ratio, connecting to the Neyman-Pearson framework.

For composite hypotheses, the Bayes factor requires specifying prior distributions under each hypothesis. This is the main practical challenge of Bayesian testing: the Bayes factor is typically sensitive to the choice of prior on the alternative, unlike p-values which are prior-free.

**Decision rule.** Reject \(H_0\) in favor of \(H_1\) when the posterior probability \(P(H_1 \mid x) > c\) for some threshold \(c\). Under 0-1 loss (equal cost for both error types), reject when \(P(H_1 \mid x) > 1/2\), i.e., posterior odds exceed 1. Under asymmetric costs, the threshold is adjusted accordingly.

Jeffreys (1961) proposed a scale for interpreting Bayes factors: \(B_{10} > 10\) is "strong evidence" for \(H_1\), \(B_{10} > 100\) is "decisive." These guidelines have no frequentist analog and should be used with caution.

## Relationship Between Power and Confidence Interval Width

The duality between tests and CIs has a quantitative form: a more powerful test against a specific alternative corresponds to a shorter confidence interval at the same level. Specifically, if a test of \(H_0: \theta = \theta_0\) has power \(\beta(\theta_1)\) against \(\theta_1\), then the expected length of the corresponding CI is approximately proportional to \(1/\sqrt{n\mathcal{I}(\theta)}\). The NP lemma guarantees that likelihood-ratio-based CIs minimize expected length among level-\((1-\alpha)\) confidence sets.

For the normal mean problem with known variance, the inversion of the UMP test for one-sided \(H_0\) gives a one-sided CI \(\bar{X} - z_\alpha\sigma/\sqrt{n} \leq \theta < \infty\); the inversion of the UMPU test for two-sided \(H_0\) gives the symmetric two-sided CI \(\bar{X} \pm z_{\alpha/2}\sigma/\sqrt{n}\). The two-sided CI is the shortest unbiased CI for \(\mu\) in the normal model.

---

# Chapter 10: Asymptotic Theory of MLEs

## Review of Convergence Concepts

Before stating the main asymptotic results, we recall the key modes of convergence. A sequence of random variables \(X_n\) **converges in probability** to a constant \(c\) if \(P(|X_n - c| > \varepsilon) \to 0\) for every \(\varepsilon > 0\), written \(X_n \overset{p}{\to} c\). It **converges in distribution** to a random variable \(X\) if \(P(X_n \leq x) \to P(X \leq x)\) at all continuity points of \(F_X\), written \(X_n \overset{d}{\to} X\).

Key results:
- **WLLN**: For iid \(X_i\) with \(E[X_i] = \mu\), \(\bar{X}_n \overset{p}{\to} \mu\).
- **CLT**: For iid \(X_i\) with mean \(\mu\) and variance \(\sigma^2 < \infty\), \(\sqrt{n}(\bar{X}_n - \mu)/\sigma \overset{d}{\to} N(0,1)\).
- **Slutsky**: If \(X_n \overset{p}{\to} a\) and \(Y_n \overset{d}{\to} Y\), then \(X_n Y_n \overset{d}{\to} aY\) and \(X_n + Y_n \overset{d}{\to} a + Y\).
- **Continuous mapping**: If \(X_n \overset{d}{\to} X\) and \(g\) is continuous, then \(g(X_n) \overset{d}{\to} g(X)\).
- **Delta method**: If \(\sqrt{n}(T_n - \theta) \overset{d}{\to} N(0, \sigma^2)\) and \(g'(\theta)\) exists, then \(\sqrt{n}(g(T_n) - g(\theta)) \overset{d}{\to} N(0, [g'(\theta)]^2\sigma^2)\).

Convergence in probability implies convergence in distribution; convergence in distribution to a constant implies convergence in probability.

## Consistency of MLEs

One of the fundamental large-sample properties of the MLE is consistency: as \(n \to \infty\), the MLE converges to the true parameter value.

<div class="theorem">
<strong>Theorem (Consistency of MLE)</strong>: For iid \(X_1, \ldots, X_n\) from a regular model \(\{f_\theta;\, \theta \in \Omega\}\) with distinct densities for distinct parameter values, the likelihood equation \(\sum_{i=1}^n S(\theta; X_i) = 0\) has, with probability tending to 1, a root \(\hat\theta_n\) such that \(\hat\theta_n \overset{p}{\to} \theta_0\) (the true value).
</div>

The key insight is that the log-likelihood ratio \(\ell(\theta)/n - \ell(\theta_0)/n\) converges by the WLLN to \(E_{\theta_0}[\log f_\theta(X)/f_{\theta_0}(X)]\), which is the negative **Kullback-Leibler divergence** \(-\text{KL}(\theta_0 \| \theta) \leq 0\) with equality only at \(\theta = \theta_0\). The KL divergence \(\text{KL}(P \| Q) = E_P[\log dP/dQ] \geq 0\) by Jensen's inequality (applied to the convex function \(-\log\)), with equality iff \(P = Q\). Thus the global maximizer of the average log-likelihood converges to \(\theta_0\). This is sometimes called the **strong law for likelihoods**.

## Asymptotic Normality

The asymptotic distribution of the MLE is the most fundamental result in large-sample theory.

<div class="theorem">
<strong>Theorem (Asymptotic Normality of MLE)</strong>: Under the regularity conditions for a regular model, if \(\hat\theta_n\) is a consistent root of the likelihood equation, then
\[
\sqrt{n}\,(\hat\theta_n - \theta_0) \overset{d}{\to} N\!\left(0,\; \mathcal{I}_1(\theta_0)^{-1}\right)
\]
where \(\mathcal{I}_1(\theta_0) = E_{\theta_0}[S_1(\theta_0; X)^2]\) is the single-observation Fisher information.
</div>

<div class="proof">
<strong>Proof sketch</strong>: Taylor expand the score equation \(0 = n^{-1}\sum_{i=1}^n S(\theta_0; X_i) + (\hat\theta_n - \theta_0)\cdot n^{-1}\sum_{i=1}^n S'(\theta_0; X_i) + o_p(1)\). By the CLT, \(n^{-1/2}\sum S(\theta_0; X_i) \overset{d}{\to} N(0, \mathcal{I}_1(\theta_0))\). By the WLLN, \(n^{-1}\sum S'(\theta_0; X_i) \overset{p}{\to} E[S'] = -\mathcal{I}_1(\theta_0)\). Solving for \(\sqrt{n}(\hat\theta_n - \theta_0)\):
\[
\sqrt{n}(\hat\theta_n - \theta_0) \approx \frac{n^{-1/2}\sum S(\theta_0; X_i)}{-n^{-1}\sum S'(\theta_0; X_i)} \overset{d}{\to} \frac{N(0, \mathcal{I}_1)}{\mathcal{I}_1} = N(0, \mathcal{I}_1^{-1}).
\]
</div>

This result says the MLE is **asymptotically efficient**: its asymptotic variance equals the Cramér-Rao lower bound \(1/(n\mathcal{I}_1(\theta))\). No consistent estimator can have a smaller asymptotic variance (a consequence of Le Cam's theory of local asymptotic normality).

By the delta method, for any smooth function \(g\):

\[
\sqrt{n}\,[g(\hat\theta_n) - g(\theta_0)] \overset{d}{\to} N\!\left(0,\; \frac{[g'(\theta_0)]^2}{\mathcal{I}_1(\theta_0)}\right).
\]

### Multiparameter Asymptotics

For \(\theta \in \mathbb{R}^k\):

\[
\sqrt{n}\,(\hat\theta_n - \theta_0) \overset{d}{\to} \text{MVN}\!\left(0,\; \mathcal{I}_1(\theta_0)^{-1}\right).
\]
For a scalar function \(\tau(\theta)\) with gradient \(D(\theta_0) = \nabla\tau(\theta_0)\):

\[
\sqrt{n}\,[\tau(\hat\theta_n) - \tau(\theta_0)] \overset{d}{\to} N\!\left(0,\; D(\theta_0)^T\mathcal{I}_1(\theta_0)^{-1}D(\theta_0)\right).
\]

Joint confidence ellipsoids: the \((1-\alpha)\) confidence ellipsoid for \(\theta\) is \(\{(\hat\theta_n - \theta)^T \mathcal{I}(\hat\theta_n)(\hat\theta_n - \theta) \leq \chi^2_\alpha(k)\}\).

## Best Linear Unbiased Estimators (BLUE)

When the model is partially specified — only the mean and variance of observations are assumed, not their full distribution — the **best linear unbiased estimator** (BLUE) is the optimal estimator within the restricted class of linear functions of the data.

Suppose \(Y = X\beta + \varepsilon\) where \(E[\varepsilon] = 0\) and \(\operatorname{Var}[\varepsilon] = \sigma^2 I\). The **Gauss-Markov theorem** states that among all linear unbiased estimators of any estimable function \(c^T\beta\), the ordinary least squares estimator \(c^T\hat\beta_{\text{OLS}} = c^T(X^TX)^{-1}X^TY\) has the smallest variance. Crucially, this result requires no distributional assumption beyond zero mean and common finite variance.

For more general covariance \(\operatorname{Var}[\varepsilon] = \sigma^2 V\), the BLUE is the generalized least squares estimator \(\hat\beta_{\text{GLS}} = (X^TV^{-1}X)^{-1}X^TV^{-1}Y\). This can also be derived by transforming the model to have uncorrelated errors using the Cholesky decomposition of \(V\).

The BLUE is generally not the same as the UMVUE. The UMVUE requires the full distribution of \(Y\); the BLUE requires only the first two moments. Under normality, BLUE = UMVUE = MLE for linear models.

## Equivariant Estimators

**Equivariance** (or **invariance**) is a structural constraint on estimators based on the symmetry of the problem. For a **location family** \(\{f(x-\theta);\, \theta \in \mathbb{R}\}\), an estimator \(T(X)\) is **location equivariant** if \(T(X + c\mathbf{1}) = T(X) + c\) for any constant \(c\). The sample mean and sample median are both location equivariant; the geometric mean is not.

The best location equivariant estimator (minimum risk equivariant, or MRE) minimizes the risk \(E_\theta[\rho(T(X) - \theta)]\) uniformly over all equivariant estimators. For squared error loss in a location family, the MRE is the Pitman estimator:

\[
T^*(X) = \frac{\int \theta\, \prod f(x_i - \theta)\, d\theta}{\int \prod f(x_i - \theta)\, d\theta},
\]
which is the posterior mean under the improper uniform prior.

For a **scale family** \(\{\sigma^{-n}\prod f(x_i/\sigma);\, \sigma > 0\}\), scale equivariance requires \(T(cX) = cT(X)\). The MRE under squared error is an analogous integral formula.

## Estimating Equations and M-Estimators

An **estimating equation** is a condition on the data and parameter that defines an estimator implicitly:

\[
\sum_{i=1}^n \psi(X_i, \theta) = 0.
\]
The MLE is the special case \(\psi(x, \theta) = S(\theta; x) = \partial\log f_\theta(x)/\partial\theta\). The sample mean satisfies \(\psi(x, \theta) = x - \theta\). The **method of moments** equations are estimating equations with \(\psi(x, \theta) = g(x) - E_\theta[g(X)]\).

An estimator defined by an estimating equation is called an **M-estimator** (maximum-likelihood-type). Under regularity conditions, M-estimators satisfy:

\[
\sqrt{n}(\hat\theta_n - \theta_0) \overset{d}{\to} N\!\left(0,\; \frac{E_{\theta_0}[\psi^2(X,\theta_0)]}{[E_{\theta_0}[\partial\psi/\partial\theta(X,\theta_0)]]^2}\right).
\]
For the MLE, \(E[\psi^2] = \mathcal{I}(\theta)\) and \(E[\partial\psi/\partial\theta] = -\mathcal{I}(\theta)\), so the asymptotic variance reduces to \(1/\mathcal{I}(\theta)\), recovering the usual MLE asymptotics.

The **Gauss-Markov theorem** for linear models is a special case: \(\psi(x, \beta) = X^T(Y - X\beta)\) gives the OLS estimating equations \(X^TX\hat\beta = X^TY\), and the BLUE property follows from the general theory of estimating equations restricted to linear functions.

**Robustness.** M-estimators can be made robust by choosing \(\psi\) to downweight outliers. The **Huber estimator** uses \(\psi(x, \theta) = \min(k, \max(-k, x-\theta))\) for some tuning constant \(k\), trading some efficiency for robustness against heavy-tailed contamination. Robust estimators are not UMVUEs (they sacrifice efficiency in the base model) but may have lower MSE in contaminated settings.

## Comparison of UMVUEs and MLEs

Both the UMVUE and MLE are important estimation procedures, and the choice between them depends on the context:

1. **Small samples:** The UMVUE is finite-sample optimal (minimum variance among unbiased estimators); the MLE may be biased (e.g., \(\hat\sigma^2_{\text{MLE}} = n^{-1}\sum(X_i-\bar{X})^2\) vs. \(S^2\)). However, the MLE may still have lower MSE if its bias reduces variance.

2. **Exponential families, natural moments:** Both MLE and UMVUE are the same (the sample mean of the natural sufficient statistic).

3. **Invariance:** The MLE is automatically invariant under reparameterization. UMVUEs are not: the UMVUE of \(\theta^2\) is not the square of the UMVUE of \(\theta\).

4. **Non-regular models:** When the support depends on \(\theta\) (e.g., uniform), the MLE (the maximum order statistic) is consistent and efficient but not asymptotically normal in the standard sense. The UMVUE theory still applies.

5. **Large samples:** Both converge to each other and to the truth. The MLE is easier to compute and is the universal default in large samples.

---

# Appendix: Key Regularity Conditions

## Pivotal Quantities and Asymptotic Pivots

A **pivot** is a function \(Q(X, \theta)\) of both data and parameter whose distribution is completely known (independent of \(\theta\)). Pivots are the basis for exact inference.

Common exact pivots:
- \(Z = \sqrt{n}(\bar{X} - \mu)/\sigma \sim N(0,1)\) for \(N(\mu, \sigma^2)\) with known \(\sigma\).
- \(T = \sqrt{n}(\bar{X} - \mu)/S \sim t(n-1)\) for \(N(\mu, \sigma^2)\) with unknown \(\sigma\).
- \(V = (n-1)S^2/\sigma^2 \sim \chi^2(n-1)\) for \(N(\mu, \sigma^2)\) with unknown \(\mu\).
- \(F = S_1^2/S_2^2 \sim F(m-1, n-1)\) for comparing two normal variances.

An **asymptotic pivot** is a function whose distribution converges (as \(n \to \infty\)) to a known distribution independent of \(\theta\). The three main asymptotic pivots for regular models are:

\[
Q_1 = \sqrt{n\mathcal{I}(\hat\theta)}\,(\hat\theta - \theta) \overset{d}{\to} N(0,1), \quad Q_2 = \sqrt{I(\hat\theta)}\,(\hat\theta - \theta) \overset{d}{\to} N(0,1), \quad Q_3 = -2\log R(\theta) \overset{d}{\to} \chi^2(1),
\]
where \(R(\theta) = L(\theta)/L(\hat\theta)\) is the relative likelihood. The pivots \(Q_1\) and \(Q_2\) correspond to Wald intervals; \(Q_3\) corresponds to the likelihood ratio interval. All three are asymptotically equivalent, but the LR interval (\(Q_3\)) typically has better finite-sample coverage.

## Second-Order Asymptotics and Bartlett Correction

First-order asymptotics (\(O(n^{-1/2})\) coverage accuracy) are sometimes insufficient for small to moderate samples. **Bartlett correction** provides a second-order (\(O(n^{-1})\)) adjustment to the GLRT statistic. Specifically, if \(E_\theta[2\log\Lambda] = k(1 + c(\theta)/n + O(n^{-2}))\) under \(H_0\), then the corrected statistic

\[
\tilde W = \frac{2\log\Lambda}{1 + \hat c/n}
\]
has \(\chi^2(k)\) distribution accurate to \(O(n^{-2})\). Here \(c(\theta)\) is a constant depending on cumulants of the log-likelihood, estimated by plugging in \(\hat\theta\). Bartlett correction is one of the rare cases where a simple multiplier dramatically improves the chi-squared approximation without requiring stronger assumptions.

## Regular Model (McLeish-Struthers).

A model \(\{f_\theta(x);\, \theta \in \Omega\}\) is regular if: (1) \(\log f_\theta(x)\) is three-times continuously differentiable in \(\theta\) for all \(x\) in the common support; (2) differentiation under the integral is permitted to order 2; (3) the third derivative of \(\log f_\theta\) is dominated by an integrable function uniformly in \(\theta\); (4) \(0 < \mathcal{I}(\theta) < \infty\).

Under these conditions: (i) \(E[S] = 0\); (ii) \(\operatorname{Var}[S] = \mathcal{I}(\theta)\); (iii) the CRLB holds; (iv) the MLE is consistent and asymptotically normal; (v) Wilks' theorem holds for GLRTs; (vi) the likelihood equation characterizes the MLE asymptotically.

Models that fail regularity include: (a) **Uniform\((0,\theta)\)** — support depends on \(\theta\), so differentiation under the integral is not valid. The MLE \(X_{(n)}\) converges at rate \(n\) (not \(\sqrt{n}\)) and has an exponential limit distribution; (b) **Cauchy** — the likelihood equation has multiple roots and the score variance calculation requires careful verification; (c) **Scale mixtures of normals** — the likelihood may be unbounded for degenerate mixing distributions.

For non-regular models, case-by-case asymptotic analysis is needed. For the Uniform\((0,\theta)\) model, \(n(\theta - X_{(n)}) \overset{d}{\to} \text{Exp}(\theta^{-1})\) under the true \(\theta\), leading to an exact CI based on the exponential distribution rather than the normal.

The **shift-exponential model** \(\text{Exp}(1, \theta)\) with density \(e^{-(x-\theta)}\mathbf{1}(x \geq \theta)\) is another non-regular case. The MLE is \(\hat\theta = X_{(1)}\), which converges at rate \(n\) with \(n(X_{(1)} - \theta) \overset{d}{\to} \text{Exp}(1)\). The UMVUE of \(\theta\) is \(X_{(1)} - 1/n\), which subtracts the asymptotic bias. No Cramér-Rao bound applies in the standard form because the regularity conditions fail.

## Worked Example: Logistic Regression (Worked Example from McLeish Notes)

Consider binary outcomes \(Y_{ij} \sim \text{Bin}(1, p_i)\) where the probability of success depends on a covariate \(x_i\) through the logistic model:

\[
p_i = \frac{e^{\alpha + \beta(x_i - \bar x)}}{1 + e^{\alpha + \beta(x_i - \bar x)}}.
\]

The log-likelihood is \(\ell(\alpha, \beta) = \sum_i \sum_j [y_{ij}(\alpha + \beta(x_i-\bar x)) - \log(1 + e^{\alpha + \beta(x_i-\bar x)})]\). The score equations are

\[
\frac{\partial\ell}{\partial\alpha} = \sum_i(y_{i\cdot} - n_i p_i) = 0, \qquad \frac{\partial\ell}{\partial\beta} = \sum_i(x_i - \bar x)(y_{i\cdot} - n_i p_i) = 0.
\]
These have no closed-form solution and must be solved by Newton-Raphson. The observed (and expected) Fisher information matrix is

\[
\mathcal{I}(\alpha,\beta) = \sum_i n_i p_i(1-p_i)\begin{pmatrix}1 & x_i - \bar x \\ x_i - \bar x & (x_i-\bar x)^2\end{pmatrix}.
\]

To test \(H_0: \beta = 0\) (no covariate effect), the Wald test uses \(Z = \hat\beta / \widehat{\text{SE}}(\hat\beta) \overset{d}{\to} N(0,1)\). The score test uses \(R = [S_\beta(\alpha_0, 0)]^2 / [\mathcal{I}^{-1}(\alpha_0, 0)]_{22}\) where \(\alpha_0\) is the MLE of \(\alpha\) under \(\beta = 0\). The GLRT uses \(2[\ell(\hat\alpha,\hat\beta) - \ell(\hat\alpha_0, 0)] \overset{d}{\to} \chi^2(1)\). All three are asymptotically equivalent and give the same limiting power against local alternatives \(\beta = h/\sqrt{n}\).

The **profile likelihood** for \(\beta\) eliminates the nuisance parameter \(\alpha\) by substituting \(\hat\alpha(\beta) = \arg\max_\alpha \ell(\alpha, \beta)\):

\[
\ell_p(\beta) = \max_\alpha \ell(\alpha, \beta).
\]
The profile likelihood CI for \(\beta\) is \(\{|\beta_0| : 2[\ell_p(\hat\beta) - \ell_p(\beta_0)] \leq \chi^2_\alpha(1)\}\), which has better coverage than the Wald CI for logistic regression, particularly when the covariate range is wide.

## Connections to Information Theory

The Fisher information has a deep connection to information theory. The **Kullback-Leibler divergence** between distributions \(P_\theta\) and \(P_{\theta+d\theta}\) for infinitesimally close parameters satisfies:

\[
\text{KL}(P_\theta \| P_{\theta+d\theta}) = \tfrac{1}{2}\mathcal{I}(\theta)(d\theta)^2 + O((d\theta)^3).
\]
Thus Fisher information is literally the KL divergence per unit parameter squared near \(\theta\) — it measures how rapidly the model changes as the parameter is varied. This is the information-geometric interpretation: the parameter space equipped with the Fisher information metric is a **Riemannian manifold**, and geodesic distances in this geometry correspond to statistical distinguishability.

The **Cramér-Rao bound** in this language says: no unbiased estimator can achieve variance below the squared reciprocal of the KL "speed" of the model. Geometrically, this is a statement that the statistical manifold cannot be "navigated" faster than the Fisher information allows.

The connection to Shannon information is more subtle. The Fisher information for a location family \(f(x-\theta)\) equals the Fisher information \(J(f) = \int (f'/f)^2 f\, dx\), and the **Fisher information inequality** \(J(f) \geq 1/\operatorname{Var}(f)\) (de Bruijn identity) links Fisher information to entropy production in diffusion processes. This connection underlies the use of the Fisher information matrix in modern deep learning and natural gradient methods.

**Summary Table of Major Results.**

| Theorem | Statement | Key Conditions |
|---|---|---|
| Neyman-Fisher | \(T\) sufficient \(\Leftrightarrow\) \(f_\theta = g(T;\theta)h(x)\) | None |
| Minimal sufficiency | LR const. in \(\theta \Leftrightarrow\) same min. suf. class | None |
| Basu | Complete suf. \(T\) \(\perp\) ancillary \(U\) | \(T\) complete sufficient |
| Rao-Blackwell | \(\operatorname{Var}(E[W|T]) \leq \operatorname{Var}(W)\) | \(T\) sufficient, \(W\) unbiased |
| Lehmann-Scheffé | Complete suf. + unbiased \(\Rightarrow\) UMVUE | \(T\) complete sufficient |
| Cramér-Rao | \(\operatorname{Var}(T) \geq [\tau']^2/\mathcal{I}\) | Regular model, \(T\) unbiased |
| CRLB attainment | Equality iff regular exp. family | Regular model |
| Neyman-Pearson | LR test is MP for simple vs. simple | Any regular model |
| Karlin-Rubin | MLR \(\Rightarrow\) UMP for one-sided | MLR property |
| MLE consistency | \(\hat\theta_n \overset{p}{\to} \theta_0\) | Regular, identifiable |
| MLE asymptotics | \(\sqrt{n}(\hat\theta_n - \theta_0) \overset{d}{\to} N(0, \mathcal{I}_1^{-1})\) | Regular model |
| Wilks | \(2\log\Lambda \overset{d}{\to} \chi^2(k-q)\) under \(H_0\) | Regular, \(H_0\) smooth |
| Test inversion | Test acceptance regions \(\to\) CI | Any test family |

## Worked Example: Normal Mean with Unknown Variance

This example integrates the main themes of the course for a single parametric problem.

**Setup.** Let \(X_1, \ldots, X_n \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\) with both \(\mu\) and \(\sigma^2\) unknown. We want to: (a) find the UMVUE of \(\mu\) and \(\sigma^2\); (b) derive the Fisher information; (c) test \(H_0: \mu = \mu_0\); (d) construct a CI for \(\mu\).

**Sufficient statistic.** From the factorization theorem, \(T = (\bar{X}, S^2)\) is jointly sufficient. Since the \(N(\mu,\sigma^2)\) family is a regular exponential family (in the parameterization \((\mu/\sigma^2, -1/(2\sigma^2))\)), \(T\) is also complete sufficient.

**UMVUEs.** Since \(E[\bar{X}] = \mu\) and \(E[S^2] = \sigma^2\), the UMVUEs of \(\mu\) and \(\sigma^2\) are \(\bar{X}\) and \(S^2\). Basu's theorem (T complete suff., \(S^2\) ancillary for \(\mu\)) gives \(\bar{X} \perp S^2\). The UMVUE of \(\sigma\) is \(c_n S\) where \(c_n = \sqrt{(n-1)/2}\, \Gamma((n-1)/2) / \Gamma(n/2)\).

**Fisher information.** The Fisher information matrix for \((\mu, \sigma^2)\) is diagonal:

\[
\mathcal{I}(\mu, \sigma^2) = \begin{pmatrix} n/\sigma^2 & 0 \\ 0 & n/(2\sigma^4) \end{pmatrix}.
\]
The CRLB for \(\mu\) is \(\sigma^2/n\), achieved by \(\bar{X}\). The CRLB for \(\sigma^2\) is \(2\sigma^4/n\), while \(\operatorname{Var}(S^2) = 2\sigma^4/(n-1) > 2\sigma^4/n\). So \(S^2\) does not achieve the CRLB for \(\sigma^2\) — this is not a contradiction since the family is a two-parameter exponential family but \(\sigma^2\) is not the natural parameter.

**Hypothesis test for \(\mu\).** Test \(H_0: \mu = \mu_0\) vs. \(H_1: \mu \neq \mu_0\). The GLRT statistic:

\[
\Lambda = \left(1 + \frac{n(\bar{X}-\mu_0)^2}{(n-1)S^2}\right)^{n/2}, \quad T = \frac{(\bar{X} - \mu_0)\sqrt{n}}{S} \sim t(n-1) \text{ under } H_0.
\]
The test rejects when \(|T| > t_{\alpha/2, n-1}\). This is also the UMPU test for this problem (within the class of tests depending only on \(\bar{X}\) and \(S^2\), this two-sided \(t\)-test is uniformly most powerful among unbiased tests). Power against \(\mu = \mu_1\) is \(P(|T'| > t_{\alpha/2, n-1})\) where \(T' \sim t'(n-1, \delta)\), the non-central \(t\) with non-centrality parameter \(\delta = \sqrt{n}(\mu_1 - \mu_0)/\sigma\).

**Confidence interval.** Inverting the \(t\)-test gives the \((1-\alpha)\) CI:

\[
\bar{X} \pm t_{\alpha/2, n-1}\frac{S}{\sqrt{n}}.
\]
This is the unique shortest unbiased CI for \(\mu\) in the normal model.
