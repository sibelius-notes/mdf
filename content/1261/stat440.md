---
title: "STAT 440: Computational Inference"
subjects: "STAT"
prof: "Paul Marriott"
---

## Sources and References

**Primary texts** — Davison & Hinkley (1997) *Bootstrap Methods and Their Application*; Robert & Casella (2004) *Monte Carlo Statistical Methods* 2nd ed; Efron & Hastie (2016) *Computer Age Statistical Inference*

**Supplementary texts** — Gelman, Carlin, Stern, Dunson, Vehtari & Rubin (2013) *Bayesian Data Analysis* 3rd ed; Efron & Tibshirani (1993) *An Introduction to the Bootstrap*

---

# Chapter 1: Likelihood-Based Inference

## Introduction and Course Overview

STAT 440 covers computational methods for statistical inference. The course unifies frequentist and Bayesian ideas through a computational lens: we write algorithms from scratch, study their theoretical guarantees, and apply them to real data. Prerequisites are STAT 330 (Mathematical Statistics) and STAT 341 (Computational Statistics).

The Winter 2026 syllabus (Paul Marriott) covers: exponential families, mixture models, numerical optimisation, frequentist methods, profile likelihood, the EM algorithm, bootstrapping, Monte Carlo experiments, Markov chains, MCMC (Metropolis-Hastings and Gibbs), and software (JAGS/Stan).

## The Likelihood Function

<div class="definition">
<strong>Likelihood function</strong>: Given data <em>x</em> and a parametric model with density or mass function <em>f(x; θ)</em>, the <em>likelihood function</em> is
\[ L(\theta;\, x) = f(x;\, \theta), \]
viewed as a function of <em>θ</em> with <em>x</em> fixed. For an i.i.d. sample \( x_1, \ldots, x_n \),
\[ L(\theta;\, x) = \prod_{i=1}^{n} f(x_i;\, \theta). \]
</div>

Working with the log-likelihood avoids numerical underflow and turns products into sums:

\[ \ell(\theta;\, x) = \log L(\theta;\, x) = \sum_{i=1}^{n} \log f(x_i;\, \theta). \]

<div class="definition">
<strong>Maximum likelihood estimator (MLE)</strong>: The value \( \hat{\theta} = \hat{\theta}(x) \) that maximises \( \ell(\theta; x) \) over the parameter space \( \Theta \):
\[ \hat{\theta} = \underset{\theta \in \Theta}{\arg\max}\; \ell(\theta;\, x). \]
</div>

### Score Function and Observed Information

<div class="definition">
<strong>Score function</strong>: The gradient of the log-likelihood with respect to <em>θ</em>,
\[ s(\theta;\, x) = \frac{\partial \ell(\theta;\, x)}{\partial \theta}. \]
Under regularity conditions, \( \mathrm{E}_\theta[s(\theta; X)] = 0 \).
</div>

<div class="definition">
<strong>Observed information matrix</strong>: The negative Hessian of the log-likelihood,
\[ \mathcal{I}(\theta;\, x) = -\frac{\partial^2 \ell(\theta;\, x)}{\partial \theta \,\partial \theta^\top}. \]
Evaluated at \( \hat{\theta} \), this gives the <em>observed Fisher information</em>.
</div>

<div class="definition">
<strong>Expected (Fisher) information</strong>:
\[ I(\theta) = \mathrm{E}_\theta\!\left[\mathcal{I}(\theta;\, X)\right] = \mathrm{E}_\theta\!\left[s(\theta; X)\, s(\theta; X)^\top\right]. \]
</div>

Under standard regularity conditions the MLE satisfies

\[ \sqrt{n}(\hat{\theta} - \theta_0) \xrightarrow{d} \mathcal{N}\!\left(0,\; I(\theta_0)^{-1}\right), \]

which justifies the **Wald confidence interval** \( \hat{\theta} \pm z_{\alpha/2} / \sqrt{I(\hat{\theta})} \).

### Relative Likelihood and Likelihood Intervals

<div class="definition">
<strong>Relative likelihood</strong>:
\[ R(\theta) = \frac{L(\theta;\, x)}{L(\hat{\theta};\, x)} = \exp\!\bigl[\ell(\theta) - \ell(\hat{\theta})\bigr] \in [0, 1]. \]
</div>

A **likelihood interval** at level \( c \) is \( \{\theta : R(\theta) \geq c\} \). Common choice \( c = \exp(-\chi^2_{1,\alpha}/2) \) gives an approximate \( (1-\alpha) \) confidence set via Wilks' theorem:

\[ W(\theta_0) = 2\bigl[\ell(\hat{\theta}) - \ell(\theta_0)\bigr] \xrightarrow{d} \chi^2_p, \]

where \( p = \dim(\theta) \).

**Likelihood intervals vs. Wald intervals.** Wald intervals can be unsatisfactory (negative lower bounds for scale parameters, non-symmetric shape). Likelihood intervals are parameterisation-invariant and better reflect the geometry of the log-likelihood surface.

## Profile Likelihood for Nuisance Parameters

Partition \( \theta = (\psi, \lambda) \) where \( \psi \) is the scalar of interest and \( \lambda \) are nuisance parameters.

<div class="definition">
<strong>Profile log-likelihood</strong>:
\[ \ell_P(\psi) = \max_{\lambda}\, \ell(\psi, \lambda;\, x) = \ell\!\left(\psi,\, \hat{\lambda}_\psi;\, x\right), \]
where \( \hat{\lambda}_\psi \) is the MLE of \( \lambda \) with \( \psi \) fixed.
</div>

The profile likelihood acts like an ordinary likelihood for \( \psi \): approximate Wald and likelihood-ratio tests can be constructed from it. However, it overcounts the data so standard errors from its curvature can be too small.

### Signed Root Likelihood Ratio Statistic

The **signed root LR statistic** is

\[ r(\psi) = \mathrm{sgn}(\hat{\psi} - \psi)\sqrt{W(\psi)}, \]

where \( W(\psi) = 2[\ell_P(\hat{\psi}) - \ell_P(\psi)] \). Under \( H_0: \psi = \psi_0 \),

\[ r(\psi_0) \xrightarrow{d} \mathcal{N}(0,1). \]

This approximation is often more accurate in small samples than the Wald statistic because it uses the full shape of the log-likelihood.

### Modified Profile Likelihood (Barndorff-Nielsen's \( r^* \))

Barndorff-Nielsen (1983) derived a higher-order adjustment:

\[ r^*(\psi) = r(\psi) + \frac{1}{r(\psi)}\log\frac{u(\psi)}{r(\psi)}, \]

where \( u(\psi) \) is a sample-space derivative involving the observed information. \( r^*(\psi) \sim \mathcal{N}(0,1) \) to third order — i.e., with error \( O(n^{-3/2}) \) vs \( O(n^{-1/2}) \) for \( r \).

## Exponential Families

<div class="definition">
<strong>Exponential family</strong>: A parametric model is an exponential family if its density can be written
\[ f(x;\, \theta) = h(x)\exp\!\bigl[\eta(\theta)^\top T(x) - A(\theta)\bigr], \]
where <em>T(x)</em> is the sufficient statistic, <em>η(θ)</em> the natural parameter, and <em>A(θ)</em> the log-partition function (cumulant-generating function of <em>T</em>).
</div>

Key property: \( \ell(\theta) = \eta(\theta)^\top T(x) - n A(\theta) + \text{const} \), so the score equation is

\[ \frac{\partial A(\theta)}{\partial \theta} = \frac{1}{n}\sum_{i=1}^n T(x_i), \]

i.e., the MLE sets the expected sufficient statistic equal to the observed sufficient statistic. This makes MLE computation tractable for exponential families.

**Example (Poisson).** For \( X_i \sim \mathrm{Poisson}(\lambda) \), \( \ell(\lambda) = \bar{x}\log\lambda - \lambda - \sum\log x_i!\,\), \( \hat{\lambda} = \bar{x} \), \( \mathcal{I}(\hat{\lambda}) = n/\bar{x} \).

---

# Chapter 2: Numerical Optimisation for Statistical Inference

## Newton-Raphson Algorithm

When \( \ell(\theta) \) has no closed-form maximiser, we use iterative methods. Taylor-expanding the score around the current iterate \( \theta^{(t)} \):

\[ s(\theta) \approx s\!\left(\theta^{(t)}\right) + \mathcal{I}\!\left(\theta^{(t)}\right)\!\left(\theta - \theta^{(t)}\right) = 0, \]

which gives the **Newton-Raphson** update:

\[ \theta^{(t+1)} = \theta^{(t)} + \left[\mathcal{I}\!\left(\theta^{(t)}\right)\right]^{-1} s\!\left(\theta^{(t)}\right). \]

**Convergence rate.** Newton-Raphson converges quadratically near the optimum: \( \|\theta^{(t+1)} - \hat{\theta}\| = O(\|\theta^{(t)} - \hat{\theta}\|^2) \). This means the number of correct decimal digits roughly doubles each iteration.

**Practical issues.** Far from \( \hat{\theta} \) the Hessian may not be negative-definite, causing divergence. Remedies: step-halving (line search), ridging the Hessian \( \mathcal{I} + \delta I \), or switching to gradient ascent until closer.

```r
# Newton-Raphson for Gamma MLE
gamma_loglik <- function(par, x) {
  a <- par[1]; b <- par[2]
  if (a <= 0 || b <= 0) return(-Inf)
  sum(dgamma(x, shape = a, rate = b, log = TRUE))
}
newton_raphson <- function(par0, loglik, tol = 1e-8, maxit = 200) {
  par <- par0
  for (i in seq_len(maxit)) {
    g  <- numDeriv::grad(loglik, par)
    H  <- numDeriv::hessian(loglik, par)
    dp <- solve(-H, g)
    par_new <- par + dp
    if (max(abs(dp)) < tol) return(par_new)
    par <- par_new
  }
  warning("Newton-Raphson did not converge"); par
}
```

## Fisher Scoring

Replace the observed information \( \mathcal{I}(\theta^{(t)}) \) with the expected information \( I(\theta^{(t)}) \):

\[ \theta^{(t+1)} = \theta^{(t)} + \left[I\!\left(\theta^{(t)}\right)\right]^{-1} s\!\left(\theta^{(t)}\right). \]

Advantages: (1) \( I(\theta) \) can sometimes be computed analytically; (2) the update matrix is guaranteed positive-definite; (3) equivalent to Newton-Raphson for canonical exponential families (where \( I(\theta) = \mathcal{I}(\theta) \) in expectation).

## Quasi-Newton Methods

When computing the full Hessian is expensive, **quasi-Newton** methods build an approximation \( B^{(t)} \approx \mathcal{I}(\theta^{(t)}) \) using only gradient evaluations, updated via the **BFGS** formula:

\[ B^{(t+1)} = B^{(t)} - \frac{B^{(t)} s^{(t)} s^{(t)\top} B^{(t)}}{s^{(t)\top} B^{(t)} s^{(t)}} + \frac{y^{(t)} y^{(t)\top}}{y^{(t)\top} s^{(t)}}, \]

where \( s^{(t)} = \theta^{(t+1)} - \theta^{(t)} \) and \( y^{(t)} = \nabla\ell(\theta^{(t+1)}) - \nabla\ell(\theta^{(t)}) \). **L-BFGS-B** stores only the last \( m \) updates (typically \( m = 5\text{–}20 \)) and supports box constraints, making it the default for high-dimensional optimisation in R (`optim(..., method = "L-BFGS-B")`).

## The EM Algorithm

The **Expectation-Maximisation** algorithm (Dempster, Laird & Rubin 1977) maximises the observed-data log-likelihood \( \ell(\theta; y) \) by iterating between two steps involving complete data \( (y, z) \) where \( z \) is unobserved.

<div class="definition">
<strong>EM Algorithm</strong>:
<ul>
  <li><strong>E-step</strong>: Compute \( Q(\theta \mid \theta^{(t)}) = \mathrm{E}_{z \mid y,\,\theta^{(t)}}\!\left[\log L_c(\theta;\, y, z)\right] \).</li>
  <li><strong>M-step</strong>: \( \theta^{(t+1)} = \underset{\theta}{\arg\max}\; Q(\theta \mid \theta^{(t)}) \).</li>
</ul>
</div>

### Ascent Property (Proof)

**Theorem.** The EM algorithm satisfies \( \ell(\theta^{(t+1)}; y) \geq \ell(\theta^{(t)}; y) \) at each iteration, with equality iff \( Q(\theta^{(t+1)} \mid \theta^{(t)}) = Q(\theta^{(t)} \mid \theta^{(t)}) \).

*Proof.* Write the complete-data factorisation:
\[ \log L_c(\theta) = \ell(\theta; y) + \log p(z \mid y, \theta). \]
Taking expectations under \( p(z \mid y, \theta^{(t)}) \):
\[ Q(\theta \mid \theta^{(t)}) = \ell(\theta; y) + H(\theta \mid \theta^{(t)}), \]
where \( H(\theta \mid \theta^{(t)}) = \mathrm{E}[\log p(z \mid y, \theta)] \). By Jensen's inequality (log is concave),
\[ H(\theta \mid \theta^{(t)}) \leq H(\theta^{(t)} \mid \theta^{(t)}). \]
Since the M-step gives \( Q(\theta^{(t+1)} \mid \theta^{(t)}) \geq Q(\theta^{(t)} \mid \theta^{(t)}) \):
\[ \ell(\theta^{(t+1)}) = Q(\theta^{(t+1)} \mid \theta^{(t)}) - H(\theta^{(t+1)} \mid \theta^{(t)}) \geq Q(\theta^{(t)} \mid \theta^{(t)}) - H(\theta^{(t)} \mid \theta^{(t)}) = \ell(\theta^{(t)}). \quad \square \]

### EM for a Two-Component Gaussian Mixture

**Model.** \( y_1, \ldots, y_n \) i.i.d. from

\[ f(y;\, \theta) = \pi \phi(y;\, \mu_1, \sigma_1^2) + (1-\pi)\phi(y;\, \mu_2, \sigma_2^2), \]

where \( \phi(\cdot;\, \mu, \sigma^2) \) is the Gaussian density. Hidden labels \( z_i \in \{1, 2\} \) with \( P(z_i = 1) = \pi \).

**E-step.** Compute responsibilities (posterior mixture weights):
\[ r_i^{(t)} = \frac{\pi^{(t)}\phi\!\left(y_i;\, \mu_1^{(t)}, \sigma_1^{2(t)}\right)}{\pi^{(t)}\phi\!\left(y_i;\, \mu_1^{(t)}, \sigma_1^{2(t)}\right) + (1-\pi^{(t)})\phi\!\left(y_i;\, \mu_2^{(t)}, \sigma_2^{2(t)}\right)}. \]

**M-step.** Let \( n_k = \sum_i r_i \) for \( k=1 \) and \( \sum_i (1-r_i) \) for \( k=2 \):
\[ \pi^{(t+1)} = \frac{1}{n}\sum_{i=1}^n r_i^{(t)}, \quad \mu_k^{(t+1)} = \frac{\sum_i w_{ki} y_i}{\sum_i w_{ki}}, \quad \sigma_k^{2(t+1)} = \frac{\sum_i w_{ki}(y_i - \mu_k^{(t+1)})^2}{\sum_i w_{ki}}, \]

where \( w_{1i} = r_i^{(t)} \) and \( w_{2i} = 1 - r_i^{(t)} \).

```r
em_gaussian_mix <- function(y, K = 2, niter = 200, tol = 1e-8) {
  n <- length(y)
  # initialise
  pi_k  <- rep(1/K, K)
  mu_k  <- quantile(y, seq(0.25, 0.75, length.out = K))
  sig_k <- rep(sd(y)/K, K)

  loglik_prev <- -Inf
  for (it in seq_len(niter)) {
    # E-step
    R <- sapply(1:K, function(k) pi_k[k] * dnorm(y, mu_k[k], sig_k[k]))
    R <- R / rowSums(R)

    # M-step
    for (k in 1:K) {
      nk      <- sum(R[, k])
      pi_k[k] <- nk / n
      mu_k[k] <- sum(R[, k] * y) / nk
      sig_k[k]<- sqrt(sum(R[, k] * (y - mu_k[k])^2) / nk)
    }
    # log-likelihood
    ll <- sum(log(rowSums(sapply(1:K, function(k)
               pi_k[k] * dnorm(y, mu_k[k], sig_k[k])))))
    if (abs(ll - loglik_prev) < tol) break
    loglik_prev <- ll
  }
  list(pi = pi_k, mu = mu_k, sigma = sig_k, loglik = ll)
}
```

### EM for Missing Data and Robust Regression

The Student-\( t \) distribution can be written as a scale mixture of normals: \( t_\nu(\mu, \sigma^2) \) corresponds to \( y \mid w \sim \mathcal{N}(\mu, \sigma^2/w) \), \( w \sim \mathrm{Gamma}(\nu/2, \nu/2) \). The EM algorithm treats the weights \( w_i \) as missing data, giving robust regression with automatic downweighting of outliers.

### ECM and ECME Variants

When the M-step has no closed form, **Expectation-Conditional Maximisation (ECM)** replaces the full M-step with a sequence of conditional maximisations over partitions of \( \theta \). **ECME** allows each conditional step to maximise over the observed-data likelihood instead of \( Q \), improving convergence speed.

---

# Chapter 3: Monte Carlo Integration and Simulation

## Monte Carlo Estimator

<div class="definition">
<strong>Monte Carlo estimator</strong>: To estimate \( \mu = \mathrm{E}_p[h(X)] = \int h(x)\,p(x)\,dx \), draw \( X_1, \ldots, X_n \overset{\text{iid}}{\sim} p \) and compute
\[ \hat{\mu}_n = \frac{1}{n}\sum_{i=1}^{n} h(X_i). \]
</div>

By the Strong Law of Large Numbers, \( \hat{\mu}_n \to \mu \) almost surely. By the CLT,

\[ \sqrt{n}(\hat{\mu}_n - \mu) \xrightarrow{d} \mathcal{N}(0,\, \mathrm{Var}_p[h(X)]). \]

The **Monte Carlo standard error** is

\[ \widehat{\mathrm{SE}} = \frac{s_h}{\sqrt{n}}, \quad s_h^2 = \frac{1}{n-1}\sum_{i=1}^n (h(X_i) - \hat{\mu}_n)^2. \]

Crucially, this converges at rate \( O(n^{-1/2}) \) regardless of dimension, unlike deterministic quadrature which suffers the curse of dimensionality (\( O(n^{-k/d}) \) for smooth functions in \( d \) dimensions with \( k \) derivatives).

## Variance Reduction Techniques

### Antithetic Variates

Generate pairs \( (U_i, 1 - U_i) \) and use both to compute \( h \). If \( h \) is monotone then \( h(F^{-1}(U)) \) and \( h(F^{-1}(1-U)) \) are negatively correlated, so

\[ \mathrm{Var}\!\left[\frac{h(X) + h(X')}{2}\right] = \frac{\mathrm{Var}[h] + \mathrm{Cov}(h(X), h(X'))}{2} < \mathrm{Var}[h]/2. \]

### Control Variates

Find a function \( g(X) \) with known expectation \( \mathrm{E}[g(X)] = \mu_g \). The estimator

\[ \hat{\mu}_c = \hat{\mu}_n - c(\hat{g}_n - \mu_g) \]

has variance \( \mathrm{Var}[h] - 2c\,\mathrm{Cov}(h, g) + c^2\mathrm{Var}[g] \), minimised at \( c^* = \mathrm{Cov}(h,g)/\mathrm{Var}[g] \), giving variance reduction of \( \rho^2_{h,g}\,\mathrm{Var}[h] \).

### Stratified Sampling

Partition the sample space into strata \( A_1, \ldots, A_K \) with probabilities \( p_k = P(X \in A_k) \). Draw \( n_k \) samples within each stratum and estimate

\[ \hat{\mu}_{\text{strat}} = \sum_{k=1}^K p_k \hat{\mu}_k. \]

Variance is always \( \leq \) the unstratified estimator.

### Importance Sampling

<div class="definition">
<strong>Importance sampling</strong>: Draw \( X_1, \ldots, X_n \sim q \) (the <em>proposal</em>) and estimate
\[ \mu = \int h(x)\frac{p(x)}{q(x)}\,q(x)\,dx \approx \frac{1}{n}\sum_{i=1}^n h(X_i)\,w(X_i), \quad w(x) = \frac{p(x)}{q(x)}. \]
</div>

**Self-normalized IS.** When \( p \) is known only up to a constant \( Z \), use normalised weights \( \tilde{w}_i = w_i / \sum_j w_j \):

\[ \hat{\mu}_{\mathrm{SN}} = \sum_{i=1}^n \tilde{w}_i\, h(X_i). \]

This is consistent but slightly biased for finite \( n \).

**Optimal proposal.** The zero-variance proposal is \( q^*(x) \propto |h(x)|\,p(x) \), which is generally not computable, but it motivates choosing \( q \) with heavy tails and support matching \( p \).

**IS for rare events.** When \( p(A) \ll 1 \), standard MC has huge relative error. IS shifts probability mass toward \( A \) by choosing \( q \) concentrated there, reducing variance by orders of magnitude.

```r
# Importance sampling: E[X^2] under N(3,1) using N(0,1) proposal
set.seed(1)
n <- 1e5
x   <- rnorm(n)                   # q = N(0,1)
h   <- x^2
w   <- dnorm(x, mean=3) / dnorm(x) # p/q weights
cat("IS estimate:", mean(h * w), "\n")    # should be ~10
cat("Exact:       ", 3^2 + 1,    "\n")
```

---

# Chapter 4: Markov Chain Monte Carlo

## Motivation

The posterior distribution \( \pi(\theta \mid y) \propto \pi(\theta)\,L(\theta; y) \) is typically intractable. Direct sampling is impossible in high dimensions. MCMC constructs a Markov chain whose stationary distribution is \( \pi(\theta \mid y) \), then uses the chain's trajectory to estimate posterior quantities.

## Metropolis-Hastings Algorithm

<div class="definition">
<strong>Metropolis-Hastings</strong>: Given current state \( \theta^{(t)} \), propose \( \theta^* \sim q(\cdot \mid \theta^{(t)}) \). Accept with probability
\[ \alpha\!\left(\theta^{(t)}, \theta^*\right) = \min\!\left(1,\; \frac{\pi(\theta^*)\,q\!\left(\theta^{(t)} \mid \theta^*\right)}{\pi\!\left(\theta^{(t)}\right)\,q\!\left(\theta^* \mid \theta^{(t)}\right)}\right). \]
Set \( \theta^{(t+1)} = \theta^* \) with probability \( \alpha \), else \( \theta^{(t+1)} = \theta^{(t)} \).
</div>

**Special case — Random Walk MH.** Take \( q(\theta^* \mid \theta^{(t)}) = \mathcal{N}(\theta^{(t)}, \Sigma) \). Since the proposal is symmetric, \( q(\theta^{(t)} \mid \theta^*) = q(\theta^* \mid \theta^{(t)}) \), so the ratio simplifies to \( \pi(\theta^*)/\pi(\theta^{(t)}) \).

### Detailed Balance (Proof)

**Theorem.** The MH algorithm satisfies detailed balance with respect to \( \pi \):
\[ \pi(\theta)\,P(\theta, \theta') = \pi(\theta')\,P(\theta', \theta) \quad \forall\, \theta \neq \theta', \]
where \( P(\theta, d\theta') \) is the transition kernel.

*Proof.* For \( \theta \neq \theta' \),
\[
\pi(\theta)\,q(\theta' \mid \theta)\,\alpha(\theta, \theta')
= \pi(\theta)\,q(\theta' \mid \theta)\min\!\left(1, \frac{\pi(\theta')\,q(\theta \mid \theta')}{\pi(\theta)\,q(\theta' \mid \theta)}\right).
\]
Without loss of generality assume \( \pi(\theta)\,q(\theta' \mid \theta) \leq \pi(\theta')\,q(\theta \mid \theta') \). Then
\[
= \pi(\theta)\,q(\theta' \mid \theta) \cdot 1
\]
while
\[
\pi(\theta')\,q(\theta \mid \theta')\,\alpha(\theta', \theta)
= \pi(\theta')\,q(\theta \mid \theta')\min\!\left(1, \frac{\pi(\theta)\,q(\theta' \mid \theta)}{\pi(\theta')\,q(\theta \mid \theta')}\right)
= \pi(\theta')\,q(\theta \mid \theta') \cdot \frac{\pi(\theta)\,q(\theta' \mid \theta)}{\pi(\theta')\,q(\theta \mid \theta')}
= \pi(\theta)\,q(\theta' \mid \theta).
\]
So both sides are equal. Detailed balance implies \( \pi \) is a stationary distribution. \( \square \)

### Worked Example: Bivariate Normal Target

Let \( \pi(\theta) = \mathcal{N}_2(\mathbf{0}, \Sigma) \) with \( \Sigma = \begin{pmatrix} 1 & 0.9 \\ 0.9 & 1 \end{pmatrix} \). Use random-walk proposal with scale \( \sigma_{\text{prop}} \).

```r
mh_bivariate <- function(n, sigma_prop = 1, seed = 42) {
  set.seed(seed)
  Sigma   <- matrix(c(1, 0.9, 0.9, 1), 2, 2)
  Sigma_i <- solve(Sigma)
  log_pi  <- function(th) -0.5 * t(th) %*% Sigma_i %*% th

  chain <- matrix(0, nrow = n, ncol = 2)
  th    <- c(0, 0)
  acc   <- 0
  for (i in seq_len(n)) {
    th_star <- th + rnorm(2, 0, sigma_prop)
    log_r   <- log_pi(th_star) - log_pi(th)
    if (log(runif(1)) < log_r) { th <- th_star; acc <- acc + 1 }
    chain[i, ] <- th
  }
  cat("Acceptance rate:", acc/n, "\n")
  chain
}
chain <- mh_bivariate(50000, sigma_prop = 2.38/sqrt(2))
# Target acceptance ~0.44 in 1d, ~0.234 in d dims (Roberts et al. 1997)
colMeans(chain)   # should be near (0,0)
cov(chain)        # should be near Sigma
```

The optimal acceptance rate for a \( d \)-dimensional Gaussian target in the random-walk MH is \( 0.234 \) for large \( d \) (Roberts, Gelman & Gilks 1997), achieved by scaling the proposal as \( \sigma_{\text{prop}} = 2.38/\sqrt{d} \).

## Gibbs Sampler

<div class="definition">
<strong>Gibbs sampler</strong>: When \( \theta = (\theta_1, \ldots, \theta_p) \), the Gibbs sampler cycles through components, drawing each from its <em>full conditional</em>:
\[ \theta_j^{(t+1)} \sim \pi\!\left(\theta_j \mid \theta_{-j}^{(t)}\right), \quad j = 1, \ldots, p. \]
</div>

This is a special case of MH with acceptance rate 1. **Random scan** Gibbs selects \( j \) uniformly at random each iteration. The Gibbs sampler is efficient when full conditionals are conjugate (e.g., in hierarchical models) but mixes poorly when parameters are highly correlated.

## Hamiltonian Monte Carlo

HMC augments \( \theta \) with an auxiliary momentum variable \( \rho \sim \mathcal{N}(0, M) \) and simulates Hamiltonian dynamics with Hamiltonian

\[ H(\theta, \rho) = -\log\pi(\theta) + \frac{1}{2}\rho^\top M^{-1}\rho. \]

The **leapfrog integrator** approximates the dynamics:

\[ \rho_{t + \varepsilon/2} = \rho_t + \frac{\varepsilon}{2}\nabla\log\pi(\theta_t), \]
\[ \theta_{t+\varepsilon} = \theta_t + \varepsilon M^{-1}\rho_{t+\varepsilon/2}, \]
\[ \rho_{t+\varepsilon} = \rho_{t+\varepsilon/2} + \frac{\varepsilon}{2}\nabla\log\pi(\theta_{t+\varepsilon}). \]

After \( L \) leapfrog steps the proposal is accepted with the standard MH correction for energy error. HMC explores the parameter space in large, auto-correlated jumps by exploiting gradient information, greatly reducing random-walk behaviour. **NUTS** (No-U-Turn Sampler) automatically tunes \( L \) and \( \varepsilon \) and is the default in Stan.

## Convergence Diagnostics

### \( \hat{R} \) Statistic (Gelman-Rubin)

Run \( m \) parallel chains of length \( n \). Let \( B \) = between-chain variance, \( W \) = within-chain variance. The potential scale reduction factor is

\[ \hat{R} = \sqrt{\frac{(n-1)/n \cdot W + B/n}{W}}. \]

\( \hat{R} \approx 1 \) (say \( < 1.01 \)) indicates convergence. Values \( > 1.1 \) suggest poor mixing.

### Effective Sample Size

The **effective sample size** (ESS) corrects for autocorrelation:

\[ \text{ESS} = \frac{n}{1 + 2\sum_{k=1}^{\infty} \rho_k}, \]

where \( \rho_k \) is the lag-\( k \) autocorrelation. Aim for \( \text{ESS} \geq 400 \) for stable estimates. For tails/quantiles, aim for \( \geq 1000 \).

### Warm-Up, Thinning, and Trace Plots

**Warm-up (burn-in):** Discard initial samples before the chain reaches stationarity. Rule of thumb: discard first half of samples. Stan's NUTS uses the first half for adaptation (step size, mass matrix tuning).

**Thinning:** Retain every \( k\text{th} \) sample to reduce storage and autocorrelation. Generally wasteful — better to run a longer chain. Useful only when storage is the bottleneck.

**Trace plots** show \( \theta^{(t)} \) vs. \( t \) and should look like "fat hairy caterpillars" — stationary, well-mixing, with all chains overlapping.

## Stan and JAGS

```r
# Bayesian logistic regression in Stan (interface via rstan)
library(rstan)
stan_code <- "
data {
  int<lower=0> N;
  int<lower=0> P;
  matrix[N, P] X;
  int<lower=0, upper=1> y[N];
}
parameters {
  vector[P] beta;
}
model {
  beta ~ normal(0, 10);
  y ~ bernoulli_logit(X * beta);
}
generated quantities {
  vector[N] y_rep;
  for (n in 1:N)
    y_rep[n] = bernoulli_logit_rng(X[n] * beta);
}
"
# fit <- stan(model_code = stan_code,
#             data = list(N=nrow(X), P=ncol(X), X=X, y=y),
#             chains = 4, iter = 2000, warmup = 1000)
```

JAGS (Just Another Gibbs Sampler) uses a declarative model specification similar to BUGS; the R interface is `rjags`. Stan uses automatic differentiation for HMC/NUTS and requires gradients; it is preferred for continuous parameters.

---

# Chapter 5: Bootstrap Inference

## Nonparametric Bootstrap

The **empirical distribution function** \( \hat{F}_n \) places mass \( 1/n \) at each observation. The bootstrap principle replaces the unknown \( F \) with \( \hat{F}_n \):

<div class="definition">
<strong>Bootstrap resample</strong>: Draw \( X_1^*, \ldots, X_n^* \overset{\text{iid}}{\sim} \hat{F}_n \) (i.e., resample with replacement from the data). Compute the <em>bootstrap statistic</em> \( \hat{\theta}^* = T(X_1^*, \ldots, X_n^*) \). Repeat \( B \) times to obtain \( \hat{\theta}_1^*, \ldots, \hat{\theta}_B^* \).
</div>

### Bootstrap Estimates of Bias and Standard Error

\[ \widehat{\mathrm{bias}} = \bar{\theta}^* - \hat{\theta}, \qquad \bar{\theta}^* = \frac{1}{B}\sum_{b=1}^B \hat{\theta}_b^*, \]

\[ \widehat{\mathrm{SE}} = \left[\frac{1}{B-1}\sum_{b=1}^B (\hat{\theta}_b^* - \bar{\theta}^*)^2\right]^{1/2}. \]

**How many bootstrap replicates?** \( B = 200 \) suffices for SE estimation; \( B = 1000\text{–}2000 \) for confidence intervals; \( B = 5000\text{–}10000 \) for BCa or small tail probabilities.

## Bootstrap Confidence Intervals

Let \( Q_\alpha^* \) denote the \( \alpha \)-quantile of \( \{\hat{\theta}_b^*\} \).

### Basic (Pivotal) Bootstrap CI

\[ \left[2\hat{\theta} - Q_{1-\alpha/2}^*,\; 2\hat{\theta} - Q_{\alpha/2}^*\right]. \]

Derived by assuming \( \hat{\theta}^* - \hat{\theta} \approx \hat{\theta} - \theta \), so pivoting the distribution of the bootstrap error.

### Percentile CI

\[ \left[Q_{\alpha/2}^*,\; Q_{1-\alpha/2}^*\right]. \]

Simple but only valid when the sampling distribution of \( \hat{\theta} \) is unbiased and symmetric.

### Bootstrap-\( t \) CI

Standardise each bootstrap replicate: \( t_b^* = (\hat{\theta}_b^* - \hat{\theta})/\widehat{\mathrm{SE}}_b^* \), where \( \widehat{\mathrm{SE}}_b^* \) is a nested bootstrap SE (or analytic SE). The CI is

\[ \left[\hat{\theta} - Q_{1-\alpha/2}^{t^*}\,\widehat{\mathrm{SE}},\; \hat{\theta} - Q_{\alpha/2}^{t^*}\,\widehat{\mathrm{SE}}\right]. \]

This achieves second-order accuracy.

### BCa (Bias-Corrected and Accelerated) CI

The BCa CI (Efron 1987) corrects for both bias and skewness through two constants:

**Bias-correction constant:**
\[ z_0 = \Phi^{-1}\!\left(\frac{\#\{\hat{\theta}_b^* < \hat{\theta}\}}{B}\right). \]

**Acceleration constant** (via jackknife influence values):
\[ \hat{\theta}_{(i)} = T(x_1, \ldots, x_{i-1}, x_{i+1}, \ldots, x_n) \quad \text{(leave-one-out)}, \]
\[ a = \frac{\sum_{i=1}^n (\bar{\theta}_{(\cdot)} - \hat{\theta}_{(i)})^3}{6\left[\sum_{i=1}^n (\bar{\theta}_{(\cdot)} - \hat{\theta}_{(i)})^2\right]^{3/2}}. \]

The BCa CI uses adjusted quantile levels:
\[ \alpha_1 = \Phi\!\left(z_0 + \frac{z_0 + z_{\alpha/2}}{1 - a(z_0 + z_{\alpha/2})}\right), \quad \alpha_2 = \Phi\!\left(z_0 + \frac{z_0 + z_{1-\alpha/2}}{1 - a(z_0 + z_{1-\alpha/2})}\right). \]

The BCa CI is \( [Q_{\alpha_1}^*, Q_{\alpha_2}^*] \).

### Worked Example: BCa CI for a Correlation Coefficient

```r
bca_ci <- function(data, stat_fn, B = 2000, alpha = 0.05, seed = 1) {
  set.seed(seed)
  n      <- nrow(data)
  theta_hat <- stat_fn(data)

  # Bootstrap replicates
  boot_vals <- replicate(B, {
    idx <- sample(n, n, replace = TRUE)
    stat_fn(data[idx, , drop = FALSE])
  })

  # Bias correction z0
  z0 <- qnorm(mean(boot_vals < theta_hat))

  # Acceleration a (jackknife)
  jack_vals <- sapply(1:n, function(i) stat_fn(data[-i, , drop = FALSE]))
  jack_mean <- mean(jack_vals)
  num   <- sum((jack_mean - jack_vals)^3)
  denom <- sum((jack_mean - jack_vals)^2)
  a     <- num / (6 * denom^(3/2))

  # Adjusted quantiles
  za  <- qnorm(alpha/2)
  z1a <- qnorm(1 - alpha/2)
  adj_alpha1 <- pnorm(z0 + (z0 + za)   / (1 - a*(z0 + za)))
  adj_alpha2 <- pnorm(z0 + (z0 + z1a)  / (1 - a*(z0 + z1a)))

  quantile(boot_vals, c(adj_alpha1, adj_alpha2))
}

# Example: correlation between two variables
set.seed(42)
df <- data.frame(x = rnorm(50), y = rnorm(50))
df$y <- df$y + 0.6 * df$x
bca_ci(df, function(d) cor(d[,1], d[,2]), B = 3000)
```

## Bootstrap Consistency (Sketch)

**Theorem.** (Bickel & Freedman 1981) Let \( \hat{F}_n \) be the empirical CDF and \( T_n = \sqrt{n}(\hat{\theta} - \theta_0) \) with limiting distribution \( J \). Under regularity conditions, the bootstrap distribution \( T_n^* = \sqrt{n}(\hat{\theta}^* - \hat{\theta}) \mid X_1,\ldots,X_n \) converges weakly to \( J \) in probability.

*Key idea.* The bootstrap resamples from \( \hat{F}_n \), which converges to \( F_0 \) uniformly (Glivenko-Cantelli). When \( T_n \) is a smooth functional of \( F \) (e.g., via the functional delta method), the bootstrap inherits the correct limiting distribution.

## Parametric Bootstrap

When a parametric model is assumed: fit \( \hat{\theta} \) from data, then generate \( x_1^*, \ldots, x_n^* \sim f(\cdot;\, \hat{\theta}) \) and refit. This exploits model structure and can give more efficient inference but is sensitive to model misspecification.

## Bootstrap for Regression

**Residual bootstrap:** Fit the model, obtain residuals \( \hat{e}_i = y_i - \hat{y}_i \). Resample residuals to generate \( y_i^* = \hat{y}_i + e_{\sigma(i)}^* \). Assumes homoscedasticity.

**Pairs (case) bootstrap:** Resample rows \( (x_i, y_i) \) with replacement. Robust to heteroscedasticity and misspecification.

## Bootstrap for Time Series

Standard bootstrap violates the independence assumption for time series. **Block bootstrap** methods preserve local dependence structure.

<div class="definition">
<strong>Moving Block Bootstrap (MBB)</strong>: Divide the series into overlapping blocks of length <em>l</em>: \( B_i = (X_i, X_{i+1}, \ldots, X_{i+l-1}) \), \( i = 1, \ldots, n-l+1 \). Sample \( \lceil n/l \rceil \) blocks with replacement and concatenate.
</div>

<div class="definition">
<strong>Circular Block Bootstrap (CBB)</strong>: Treat the series as circular (wrap around) so all blocks have the same length. Reduces end-effects.
</div>

<div class="definition">
<strong>Stationary Bootstrap (SB)</strong>: Use random block lengths \( L \sim \mathrm{Geometric}(p) \) so the resampled series is (marginally) stationary. Optimal average block length \( l^* \approx C\,n^{1/3} \) (Politis & Romano 1994).
</div>

**Choosing block length.** Undersmoothing (small \( l \)) fails to capture dependence; oversmoothing (large \( l \)) reduces effective sample size. Data-driven methods: flat-top lag window bandwidth selection (Politis & White 2004).

---

# Chapter 6: Permutation and Rank-Based Tests

## Permutation Tests

<div class="definition">
<strong>Permutation test</strong>: Under the null hypothesis \( H_0 \) of exchangeability, all \( n! \) permutations of the labels are equally likely. The exact permutation <em>p</em>-value is
\[ p = \frac{\#\{\pi :\; T(\pi(y)) \geq T(y_{\text{obs}})\}}{n!}, \]
where the count is over all \( n! \) permutations.
</div>

**Two-sample permutation test.** Combine \( m \) observations from group 1 and \( n \) from group 2. Test statistic: difference in means \( T = \bar{Y}_1 - \bar{Y}_2 \). Permute group labels \( B \) times and compare observed \( T \) to permutation distribution.

```r
perm_test <- function(x, y, B = 9999, seed = 1) {
  set.seed(seed)
  combined <- c(x, y)
  n1 <- length(x); n2 <- length(y); n <- n1 + n2
  T_obs <- mean(x) - mean(y)
  T_perm <- replicate(B, {
    perm <- sample(combined)
    mean(perm[1:n1]) - mean(perm[(n1+1):n])
  })
  p_val <- mean(c(T_obs, T_perm) >= T_obs)
  list(statistic = T_obs, p.value = p_val)
}
```

**Permutation for regression (Freedman-Lane procedure).** To test \( H_0:\,\beta_j = 0 \) in \( y = X\beta + \varepsilon \): (1) fit the reduced model without \( x_j \), obtain residuals \( \hat{e} \); (2) permute \( \hat{e} \) to get \( \hat{e}^* \); (3) refit full model on \( \hat{y}_{\text{reduced}} + \hat{e}^* \). This preserves the null distribution under the reduced model.

## Monte Carlo Permutation

When \( n \) is large, enumerating all \( n! \) permutations is infeasible. Draw \( B \) random permutations:

\[ \hat{p} = \frac{1 + \#\{b : T_b^* \geq T_{\text{obs}}\}}{B + 1}. \]

The \( +1 \) in numerator and denominator counts the observed statistic itself and ensures \( \hat{p} \) is a valid \( p \)-value.

## Rank-Based Tests

### Wilcoxon Rank-Sum Test

Pool \( m + n \) observations, rank them 1 through \( m+n \). Let \( W = \sum_{i=1}^{m} R_i \) (sum of ranks from group 1). Under \( H_0 \) (equal distributions):

\[ \mathrm{E}[W] = \frac{m(m+n+1)}{2}, \qquad \mathrm{Var}(W) = \frac{mn(m+n+1)}{12}. \]

The **Mann-Whitney U statistic** \( U = W - m(m+1)/2 \) counts the number of pairs \( (X_i, Y_j) \) with \( X_i > Y_j \). Normal approximation: \( Z = (W - \mathrm{E}[W])/\sqrt{\mathrm{Var}(W)} \xrightarrow{d} \mathcal{N}(0,1) \) under \( H_0 \).

### Wilcoxon Signed-Rank Test

For paired data \( D_i = X_i - Y_i \), rank \( |D_i| \) and compute

\[ W^+ = \sum_{i: D_i > 0} R_i. \]

Under \( H_0: \mathrm{median}(D) = 0 \), \( \mathrm{E}[W^+] = n(n+1)/4 \) and \( \mathrm{Var}(W^+) = n(n+1)(2n+1)/24 \).

### Kruskal-Wallis Test

Generalises Wilcoxon to \( K > 2 \) groups. Let \( R_{ij} \) be the rank of observation \( j \) in group \( i \) within the pooled sample of size \( N = \sum n_i \). Test statistic:

\[ H = \frac{12}{N(N+1)}\sum_{i=1}^K \frac{1}{n_i}\left(\sum_{j=1}^{n_i} R_{ij}\right)^2 - 3(N+1). \]

Under \( H_0 \), \( H \xrightarrow{d} \chi^2_{K-1} \).

### Spearman Rank Correlation

\[ r_s = 1 - \frac{6\sum d_i^2}{n(n^2-1)}, \]

where \( d_i = \mathrm{rank}(x_i) - \mathrm{rank}(y_i) \). Equals Pearson correlation on the ranks. Test: under \( H_0: \rho_s = 0 \), \( t = r_s\sqrt{(n-2)/(1-r_s^2)} \sim t_{n-2} \).

## Power Comparison: Rank vs. Parametric

For Gaussian data, the asymptotic relative efficiency (ARE) of the Wilcoxon rank-sum to the two-sample \( t \)-test is \( 3/\pi \approx 0.955 \) — nearly as powerful. For heavy-tailed or skewed distributions, rank tests can be substantially more powerful (ARE \( > 1 \)).

## Multiple Testing: Benjamini-Hochberg FDR

For \( m \) simultaneous tests with \( p\text{-values} \) \( p_{(1)} \leq \cdots \leq p_{(m)} \), the **Benjamini-Hochberg** (BH) procedure controls FDR at level \( q \):

\[ \text{Reject } H_{(i)} \text{ for all } i \leq \hat{k}, \quad \hat{k} = \max\!\left\{i : p_{(i)} \leq \frac{i\,q}{m}\right\}. \]

Under independence, \( \mathrm{FDR} \leq (m_0/m)\,q \leq q \), where \( m_0 \) is the number of true nulls.

**Permutation for FDR.** Rather than relying on theoretical null distributions, generate the null distribution of each test statistic via permutation, yielding sharper FDR estimates when the parametric null is questionable.

---

# Chapter 7: Bayesian Computational Methods

## Bayesian Framework

<div class="definition">
<strong>Bayes' theorem</strong>: The posterior distribution combines the prior \( \pi(\theta) \) and likelihood \( L(\theta; y) \):
\[ \pi(\theta \mid y) = \frac{\pi(\theta)\,L(\theta;\, y)}{\int \pi(\theta')\,L(\theta';\, y)\,d\theta'} \propto \pi(\theta)\,L(\theta;\, y). \]
</div>

Posterior inference: \( \mathrm{E}[\theta \mid y] \), \( \mathrm{Var}(\theta \mid y) \), credible intervals, predictive distributions \( p(\tilde{y} \mid y) = \int f(\tilde{y} \mid \theta)\,\pi(\theta \mid y)\,d\theta \).

## Conjugate Families

<div class="definition">
<strong>Conjugate prior</strong>: A prior \( \pi(\theta) \) is conjugate for likelihood \( L(\theta; y) \) if the posterior \( \pi(\theta \mid y) \) belongs to the same parametric family as \( \pi(\theta) \).
</div>

| Likelihood | Prior | Posterior |
|---|---|---|
| \( y \mid \mu \sim \mathcal{N}(\mu, \sigma^2) \) | \( \mu \sim \mathcal{N}(\mu_0, \tau^2) \) | \( \mu \mid y \sim \mathcal{N}(\mu_n, \sigma_n^2) \) |
| \( y \mid p \sim \mathrm{Bin}(n, p) \) | \( p \sim \mathrm{Beta}(\alpha, \beta) \) | \( p \mid y \sim \mathrm{Beta}(\alpha + y, \beta + n - y) \) |
| \( y \mid \lambda \sim \mathrm{Poisson}(\lambda) \) | \( \lambda \sim \mathrm{Gamma}(a, b) \) | \( \lambda \mid y \sim \mathrm{Gamma}(a + \sum y_i, b + n) \) |

For the normal-normal case: \( \mu_n = \sigma_n^2(\mu_0/\tau^2 + n\bar{y}/\sigma^2) \), \( \sigma_n^{-2} = \tau^{-2} + n\sigma^{-2} \). The posterior mean is a precision-weighted average of prior mean and data mean.

## Laplace Approximation

For non-conjugate posteriors, approximate \( \pi(\theta \mid y) \) by a Gaussian centred at the posterior mode \( \hat{\theta}_{\text{MAP}} \):

\[ \log\pi(\theta \mid y) \approx \log\pi(\hat{\theta}_{\text{MAP}} \mid y) - \frac{1}{2}(\theta - \hat{\theta}_{\text{MAP}})^\top \mathcal{H}(\theta - \hat{\theta}_{\text{MAP}}), \]

where \( \mathcal{H} = -\nabla^2 \log\pi(\theta \mid y)\big|_{\hat{\theta}_{\text{MAP}}} \). Thus

\[ \pi(\theta \mid y) \approx \mathcal{N}\!\left(\hat{\theta}_{\text{MAP}},\, \mathcal{H}^{-1}\right). \]

This gives \( O(n^{-1}) \) error in the posterior mean (Tierney & Kadane 1986). The marginal likelihood approximation is

\[ p(y) \approx (2\pi)^{p/2}|\mathcal{H}|^{-1/2}\,\pi(\hat{\theta}_{\text{MAP}})\,L(\hat{\theta}_{\text{MAP}};\,y). \]

## INLA (Integrated Nested Laplace Approximation)

INLA (Rue, Martino & Chopin 2009) extends the Laplace approximation to latent Gaussian models:

\[ y_i \mid x_i, \psi \sim p(y_i \mid x_i, \psi), \quad x \mid \psi \sim \mathcal{N}(0, Q(\psi)^{-1}), \quad \psi \sim p(\psi). \]

Key insight: compute marginals \( \pi(x_i \mid y) \) and \( \pi(\psi_j \mid y) \) via nested Laplace approximations on a grid over \( \psi \), avoiding full MCMC. INLA is orders of magnitude faster than MCMC for this model class (spatial models, GLMMs, survival models).

## Variational Bayes

Variational inference (VI) approximates \( \pi(\theta \mid y) \) with a tractable distribution \( q(\theta) \) from a family \( \mathcal{Q} \) by minimising the KL divergence:

\[ q^*(\theta) = \underset{q \in \mathcal{Q}}{\arg\min}\;\mathrm{KL}(q \,\|\, \pi(\cdot \mid y)). \]

Equivalently, maximise the **Evidence Lower Bound (ELBO)**:

\[ \mathcal{L}(q) = \mathrm{E}_q[\log p(y, \theta)] - \mathrm{E}_q[\log q(\theta)] = \log p(y) - \mathrm{KL}(q \,\|\, \pi). \]

**Mean-field approximation:** Assume \( q(\theta) = \prod_{j=1}^p q_j(\theta_j) \). Each factor satisfies

\[ \log q_j^*(\theta_j) = \mathrm{E}_{-j}[\log p(y, \theta)] + \text{const}. \]

This gives coordinate ascent VI (CAVI), which updates each factor in turn. VI is faster than MCMC but biases posterior uncertainty downward (underestimates variance) due to the independence assumption.

## Sequential Monte Carlo and Particle Filtering

**Particle filter (Sequential Importance Resampling):** Approximate \( \pi(\theta_{1:t} \mid y_{1:t}) \) sequentially using a weighted set of \( N \) particles \( \{(\theta^{(i)}_{1:t}, w^{(i)}_t)\}_{i=1}^N \).

1. **Predict:** Propagate particles \( \theta_t^{(i)} \sim p(\theta_t \mid \theta_{t-1}^{(i)}) \).
2. **Update:** Reweight \( w_t^{(i)} \propto w_{t-1}^{(i)} p(y_t \mid \theta_t^{(i)}) \).
3. **Resample:** When ESS \( = (\sum w^{(i)})^2 / \sum (w^{(i)})^2 \) drops below \( N/2 \), resample.

SMC is exact (unbiased) as \( N \to \infty \) and naturally handles online inference, time-varying parameters, and multimodal posteriors.

## Bayesian Model Comparison

### Bayes Factors

<div class="definition">
<strong>Bayes factor</strong>: For models \( M_1 \) and \( M_2 \),
\[ B_{12} = \frac{p(y \mid M_1)}{p(y \mid M_2)} = \frac{\int L(\theta_1;\, y)\,\pi(\theta_1 \mid M_1)\,d\theta_1}{\int L(\theta_2;\, y)\,\pi(\theta_2 \mid M_2)\,d\theta_2}. \]
</div>

Jeffreys' scale: \( B_{12} > 100 \) is "decisive" evidence for \( M_1 \). Bayes factors are sensitive to the prior on parameters (not just the prior over models).

### DIC (Deviance Information Criterion)

\[ \mathrm{DIC} = D(\bar{\theta}) + 2\,p_D, \]

where \( D(\theta) = -2\log L(\theta; y) \) is the deviance, \( \bar{\theta} = \mathrm{E}[\theta \mid y] \), and \( p_D = \bar{D} - D(\bar{\theta}) \) is the effective number of parameters. Lower DIC indicates better out-of-sample predictive fit.

### WAIC (Widely Applicable Information Criterion)

\[ \mathrm{WAIC} = -2\sum_{i=1}^n \log\mathrm{E}_{\theta \mid y}[p(y_i \mid \theta)] + 2\sum_{i=1}^n \mathrm{Var}_{\theta \mid y}[\log p(y_i \mid \theta)]. \]

WAIC is fully Bayesian, uses the posterior predictive rather than a point estimate, and is asymptotically equivalent to leave-one-out cross-validation. It is preferred over DIC for hierarchical models.

## Worked Example: Bayesian Logistic Regression with MCMC

**Model.** For \( i = 1, \ldots, n \), \( y_i \in \{0,1\} \),

\[ p(y_i = 1 \mid x_i, \beta) = \sigma(x_i^\top \beta), \quad \sigma(z) = \frac{e^z}{1+e^z}. \]

Prior: \( \beta \sim \mathcal{N}(0, \sigma_0^2 I) \). Posterior not conjugate — use MCMC.

```r
library(rstan)
options(mc.cores = parallel::detectCores())

# Simulate data
set.seed(99)
n  <- 200; p <- 3
X  <- cbind(1, matrix(rnorm(n*(p-1)), n, p-1))
b0 <- c(0.5, -1, 0.8)
y  <- rbinom(n, 1, plogis(X %*% b0))

stan_model_str <- "
data {
  int<lower=0> N;
  int<lower=1> P;
  matrix[N,P]  X;
  int<lower=0,upper=1> y[N];
  real<lower=0> sigma0;
}
parameters { vector[P] beta; }
model {
  beta ~ normal(0, sigma0);
  y    ~ bernoulli_logit(X * beta);
}
"
fit <- stan(model_code = stan_model_str,
            data = list(N=n, P=p, X=X, y=as.integer(y), sigma0=10),
            chains = 4, iter = 2000, warmup = 1000, seed = 1)

print(fit, pars = "beta", probs = c(0.025, 0.5, 0.975))
# Check convergence
stan_trace(fit, pars = "beta")
# Rhat should be < 1.01, n_eff should be > 400
```

## Posterior Predictive Checking

To assess model fit, simulate replicated data from the posterior predictive distribution and compare to observed data:

\[ p(y^{\text{rep}} \mid y) = \int p(y^{\text{rep}} \mid \theta)\,\pi(\theta \mid y)\,d\theta. \]

**Posterior predictive p-value** for test statistic \( T \):

\[ p_B = P(T(y^{\text{rep}}) \geq T(y) \mid y). \]

Values near 0.5 indicate good fit; values near 0 or 1 indicate systematic discrepancy. Common checks: compare histograms, extreme quantiles, mean, standard deviation between \( y^{\text{rep}} \) and \( y_{\text{obs}} \).

---

# Chapter 8: Saddlepoint Approximations and Advanced Likelihood Methods

## Saddlepoint Approximation

For the density of a sum \( S_n = \sum_{i=1}^n X_i \), the saddlepoint approximation (Lugannani & Rice 1980) gives:

\[ \hat{f}_{S_n}(s) = \left[\frac{n}{2\pi K''(\hat{t})}\right]^{1/2} \exp\!\left[n K(\hat{t}) - \hat{t}\,s\right], \]

where \( K(t) = \log \mathrm{E}[e^{tX}] \) is the cumulant-generating function and \( \hat{t} \) solves \( K'(\hat{t}) = s/n \). This approximation has **relative** error \( O(n^{-1}) \), vs. \( O(n^{-1/2}) \) for the normal approximation — it is far more accurate in the tails.

The **Lugannani-Rice tail probability formula** for the MLE \( \hat{\theta} \):

\[ P(\hat{\theta} \geq \hat{\theta}_{\text{obs}}) \approx 1 - \Phi(r) - \phi(r)\left(\frac{1}{u} - \frac{1}{r}\right), \]

where \( r \) is the signed root LR statistic and \( u \) involves the saddlepoint.

## Adjusted Profile Likelihood

Profile likelihood overestimates information (treats \( \hat{\lambda}_\psi \) as known). Several adjustments exist:

**Cox-Reid adjusted profile likelihood** (for orthogonal parameterisations):

\[ \ell_{A}(\psi) = \ell_P(\psi) - \frac{1}{2}\log|j_{\lambda\lambda}(\psi, \hat{\lambda}_\psi)|, \]

where \( j_{\lambda\lambda} \) is the observed information matrix for \( \lambda \) at fixed \( \psi \). The adjustment accounts for the uncertainty in estimating nuisance parameters and gives third-order accurate inference on \( \psi \).

---

# Chapter 9: Computational Implementation and Software

## R Implementation Patterns

### Numerical Differentiation

```r
# Hessian via finite differences (numDeriv package)
library(numDeriv)
log_post <- function(theta, y, sigma_prior = 10) {
  beta <- theta
  lp   <- sum(dbinom(y$resp, 1, plogis(y$X %*% beta), log = TRUE))
  lp   + sum(dnorm(beta, 0, sigma_prior, log = TRUE))
}
# MAP via optimisation
map_est <- optim(rep(0, p), function(th) -log_post(th, data_list),
                 method = "BFGS", hessian = TRUE)
H <- hessian(log_post, map_est$par, y = data_list)
# Laplace approximation covariance
Sigma_lap <- solve(-H)
```

### Parallel Bootstrap

```r
library(parallel)
cl <- makeCluster(detectCores() - 1)
clusterExport(cl, c("data_mat", "stat_fn"))
boot_vals <- parSapply(cl, seq_len(B), function(b) {
  idx <- sample(nrow(data_mat), replace = TRUE)
  stat_fn(data_mat[idx, ])
})
stopCluster(cl)
```

### Diagnosing MCMC with coda

```r
library(coda)
chain_list <- lapply(1:4, function(c) as.mcmc(chain_draws[[c]]))
mc_list    <- mcmc.list(chain_list)
gelman.diag(mc_list)          # Rhat
effectiveSize(mc_list)        # ESS
autocorr.plot(chain_list[[1]])
```

## Reproducibility and Workflow

Best practice for reproducible computational inference:

1. **Set seeds** explicitly before any random operation; record in output.
2. **Version control** algorithm code and data; use `renv` or `packrat` for R package management.
3. **Report diagnostics**: always report \( \hat{R} \), ESS, and acceptance rates alongside MCMC results.
4. **Sanity checks**: test samplers on problems with known analytic solutions; compare bootstrap and asymptotic CIs.
5. **Computational efficiency**: profile code before optimising; use vectorised R, `Rcpp`, or Stan for bottlenecks.

---

# Appendix: Key Formulae Reference

## Likelihood and Information

\[ \ell(\theta) = \sum_{i=1}^n \log f(x_i;\theta), \quad s(\theta) = \frac{\partial\ell}{\partial\theta}, \quad \mathcal{I}(\theta) = -\frac{\partial^2\ell}{\partial\theta\partial\theta^\top}. \]

\[ \text{Wald CI: } \hat\theta \pm z_{\alpha/2}\,[\mathcal{I}(\hat\theta)]^{-1/2}, \quad \text{LR CI: } \{\theta : 2[\ell(\hat\theta)-\ell(\theta)] \leq \chi^2_{1,\alpha}\}. \]

## EM Update

\[ Q(\theta|\theta^{(t)}) = \mathrm{E}_{z|y,\theta^{(t)}}[\log L_c(\theta)], \quad \theta^{(t+1)} = \arg\max_\theta Q(\theta|\theta^{(t)}). \]

## MH Accept-Reject

\[ \alpha(\theta,\theta^*) = \min\!\left(1,\frac{\pi(\theta^*)q(\theta|\theta^*)}{\pi(\theta)q(\theta^*|\theta)}\right). \]

## Bootstrap CIs

\[ \text{Basic: } [2\hat\theta - Q_{1-\alpha/2}^*,\ 2\hat\theta - Q_{\alpha/2}^*], \quad \text{Percentile: } [Q_{\alpha/2}^*,\ Q_{1-\alpha/2}^*]. \]

\[ \text{BCa: use adjusted quantile levels } \alpha_1, \alpha_2 \text{ from } z_0, a. \]

## Bayesian

\[ \pi(\theta|y) \propto \pi(\theta)L(\theta;y), \quad \text{ELBO: } \mathcal{L}(q) = \mathrm{E}_q[\log p(y,\theta)] - \mathrm{E}_q[\log q(\theta)]. \]

\[ \text{WAIC} = -2\sum_i \log\mathrm{E}_{\theta|y}[p(y_i|\theta)] + 2\sum_i \mathrm{Var}_{\theta|y}[\log p(y_i|\theta)]. \]

---

# Appendix A: Exponential Family Properties and the Score Equations

## Cumulants from the Log-Partition Function

For an exponential family with natural parameter \( \eta \) and log-partition function \( A(\eta) \):

\[ \frac{\partial A(\eta)}{\partial \eta} = \mathrm{E}[T(X)], \qquad \frac{\partial^2 A(\eta)}{\partial \eta^2} = \mathrm{Var}(T(X)). \]

This identity is fundamental: it says the MLE condition \( \nabla A(\hat\eta) = \bar{T} \) equates the model expectation of the sufficient statistic to the observed value, and the curvature of \( A \) gives the Fisher information.

## Score Equations for Common Models

| Model | Sufficient stat | Score equation | MLE |
|---|---|---|---|
| \( \mathcal{N}(\mu, \sigma^2) \), \( \mu \) unknown | \( \sum x_i \) | \( n\mu = \sum x_i \) | \( \hat\mu = \bar x \) |
| \( \mathrm{Poisson}(\lambda) \) | \( \sum x_i \) | \( n\lambda = \sum x_i \) | \( \hat\lambda = \bar x \) |
| \( \mathrm{Bin}(m, p) \), \( p \) unknown | \( \sum x_i \) | \( nm p = \sum x_i \) | \( \hat p = \bar x/m \) |
| \( \mathrm{Gamma}(\alpha, \beta) \) | \( (\sum x_i, \sum \log x_i) \) | coupled nonlinear system | Newton-Raphson |

For the Gamma model, the score equations are:
\[ n\frac{\partial}{\partial\alpha}\log\Gamma(\alpha) - n\log\beta = -\sum\log x_i, \qquad \frac{n\alpha}{\beta} = \sum x_i. \]

The second gives \( \hat\beta = \hat\alpha/\bar x \); substituting into the first gives an equation in \( \hat\alpha \) alone, solved numerically (Newton's method with initialisation \( \hat\alpha_0 \approx 1/(2(s^2 - \log\bar x + \overline{\log x})) \) via the moment approximation of Choi & Wette 1969).

## Profile Likelihood for the Gamma Scale

With \( \alpha \) as the parameter of interest and \( \beta \) profiled out:

\[ \hat\beta_\alpha = \frac{\alpha}{\bar x}, \qquad \ell_P(\alpha) = n\alpha\log\alpha - n\alpha\log\bar x - n\log\Gamma(\alpha) + (\alpha - 1)\sum\log x_i - n\alpha. \]

The profile likelihood ratio statistic \( W(\alpha_0) = 2[\ell_P(\hat\alpha) - \ell_P(\alpha_0)] \sim \chi^2_1 \) for large \( n \), giving a likelihood interval that is more accurate than the Wald interval especially for small \( n \) or when \( \alpha \) is near zero.

---

# Appendix B: Selected Proofs and Derivations

## Proof: Consistency of the Bootstrap for the Sample Mean

Let \( X_1, \ldots, X_n \overset{\text{iid}}{\sim} F \) with mean \( \mu \) and variance \( \sigma^2 < \infty \). The CLT gives \( \sqrt{n}(\bar{X}_n - \mu) \xrightarrow{d} \mathcal{N}(0, \sigma^2) \).

Under the bootstrap, \( X_1^*, \ldots, X_n^* \overset{\text{iid}}{\sim} \hat{F}_n \). The bootstrap CLT gives

\[ \sqrt{n}(\bar{X}_n^* - \bar{X}_n) \xrightarrow{d} \mathcal{N}(0, \hat{\sigma}_n^2) \quad \text{almost surely,} \]

where \( \hat{\sigma}_n^2 = n^{-1}\sum(x_i - \bar{x})^2 \xrightarrow{a.s.} \sigma^2 \) by the LLN. Since the Gaussian distribution is continuous, convergence of the variance implies convergence of the whole distribution (Slutsky's theorem + continuous mapping). The bootstrap distribution consistently estimates the sampling distribution of \( \sqrt{n}(\bar{X}_n - \mu) \). \( \square \)

**Extension.** The same argument extends to smooth functionals \( T(F) \) via the functional delta method: if \( T \) has a Hadamard derivative \( T_F' \), then \( \sqrt{n}(T(\hat{F}_n) - T(F)) \xrightarrow{d} T_F'(\mathbb{B}) \) where \( \mathbb{B} \) is a Brownian bridge, and the bootstrap approximates this limit consistently.

## Proof: EM Monotone Ascent (Alternative Presentation)

The observed-data log-likelihood and the complete-data log-likelihood satisfy

\[ \ell(\theta; y) = \log L_c(\theta; y, z) - \log p(z \mid y, \theta) \]

for any \( z \). Integrating both sides with respect to \( p(z \mid y, \theta^{(t)}) \):

\[ \ell(\theta; y) = Q(\theta \mid \theta^{(t)}) - H(\theta \mid \theta^{(t)}). \]

Now compare \( \theta^{(t+1)} \) to \( \theta^{(t)} \):

\[
\ell(\theta^{(t+1)}) - \ell(\theta^{(t)})
= \underbrace{Q(\theta^{(t+1)}) - Q(\theta^{(t)})}_{\geq\, 0\;\text{(M-step)}}
- \underbrace{\left[H(\theta^{(t+1)}) - H(\theta^{(t)})\right]}_{\leq\, 0\;\text{(non-expansiveness of KL)}}.
\]

The second term: by the non-negativity of KL divergence,
\[
H(\theta \mid \theta^{(t)}) - H(\theta^{(t)} \mid \theta^{(t)})
= -\mathrm{KL}\!\left(p(z \mid y, \theta^{(t)}) \,\|\, p(z \mid y, \theta)\right) \leq 0.
\]
Thus both terms combine to give \( \ell(\theta^{(t+1)}) \geq \ell(\theta^{(t)}) \). \( \square \)

## Bias of the Jackknife Variance Estimate

The jackknife estimator of variance of \( \hat{\theta} \) is

\[ v_J = \frac{n-1}{n}\sum_{i=1}^n \!\left(\hat{\theta}_{(i)} - \hat{\theta}_{(\cdot)}\right)^2. \]

For \( \hat{\theta} = \bar{X} \), \( \hat{\theta}_{(i)} = (n\bar{X} - X_i)/(n-1) \), so

\[ v_J = \frac{n-1}{n}\sum_{i=1}^n \left(\frac{X_i - \bar{X}}{n-1}\right)^2 \cdot (n-1)^2 = \frac{1}{n(n-1)}\sum(X_i - \bar{X})^2 = \frac{s^2}{n}. \]

This equals the classical variance estimator — the jackknife is consistent for the variance of the sample mean. For nonlinear statistics, the jackknife uses a linear approximation and may underestimate variance for heavy-tailed or highly nonlinear statistics; the bootstrap is preferred.

---

# Appendix C: Practice Problems

## Chapter 1 — Likelihood

**P1.1.** Let \( X_1, \ldots, X_n \overset{\text{iid}}{\sim} \mathrm{Gamma}(\alpha, \beta) \). Write the log-likelihood, derive the score equations, and show that the MLE of \( \beta \) is \( \hat{\beta} = \hat{\alpha}/\bar{X} \). Describe a Newton-Raphson scheme to find \( \hat{\alpha} \).

**P1.2.** For the Gamma model, compute the observed information matrix at \( (\hat{\alpha}, \hat{\beta}) \) and construct 95% Wald confidence intervals. Compare these with likelihood intervals at level \( c = e^{-\chi^2_{1,0.05}/2} \).

**P1.3.** Suppose \( X_1, \ldots, X_n \overset{\text{iid}}{\sim} \mathcal{N}(\mu, \sigma^2) \) and interest is in \( \psi = \mu/\sigma \) (the signal-to-noise ratio). Derive the profile log-likelihood \( \ell_P(\psi) \) and sketch it as a function of \( \psi \).

## Chapter 2 — Optimisation and EM

**P2.1.** Implement the EM algorithm for a three-component Gaussian mixture in R. Apply it to the `faithful` dataset (eruption durations). Compare the fitted model to `mclust::Mclust`.

**P2.2.** Show that the EM algorithm applied to a complete-data exponential family reduces the M-step to setting the expected sufficient statistics equal to their observed values.

**P2.3.** Derive the EM update equations for a Poisson mixture model \( f(x) = \sum_{k=1}^K \pi_k \mathrm{Poisson}(\lambda_k) \).

## Chapter 3 — Monte Carlo

**P3.1.** Estimate \( \Phi(3) = P(Z \leq 3) \) for \( Z \sim \mathcal{N}(0,1) \) using (a) standard MC, (b) IS with an exponential tilting proposal, (c) antithetic variates. Compare variances.

**P3.2.** Use MC integration to compute \( \mathrm{E}[X^4] \) for \( X \sim t_5 \). Verify against the known moment formula. How does the MC standard error scale with \( n \)?

## Chapter 4 — MCMC

**P4.1.** Implement a Metropolis-Hastings sampler for the posterior of \( \lambda \) in a Poisson-Gamma model with \( n = 50 \) observations. Compare the posterior with the conjugate analytic result.

**P4.2.** Code a Gibbs sampler for the bivariate normal posterior with both mean and covariance unknown, using Normal-Inverse-Wishart conjugate priors. Diagnose convergence using \( \hat{R} \) and trace plots.

**P4.3.** For the random-walk MH algorithm on a target \( \pi \propto e^{-|x|} \) (double exponential), tune the proposal variance to achieve the recommended acceptance rate. Report ESS per second.

## Chapter 5 — Bootstrap

**P5.1.** Compute the basic, percentile, and BCa 95% confidence intervals for the median of a sample of size 30 drawn from \( \text{Exp}(1) \). Use \( B = 5000 \) bootstrap replicates.

**P5.2.** Apply the moving block bootstrap to the `AirPassengers` time series to compute a 95% CI for the lag-1 autocorrelation. Try block lengths \( l \in \{5, 12, 24\} \) and discuss sensitivity.

## Chapter 6 — Permutation Tests

**P6.1.** Conduct a permutation test comparing medians of two groups with \( m = n = 25 \) using \( B = 9999 \) permutations. Estimate power via simulation under \( H_1: \mu_2 - \mu_1 = 0.5 \) for \( \mathcal{N}(0,1) \) distributions.

**P6.2.** Apply the Kruskal-Wallis test to compare three groups of exam scores. Perform post-hoc Wilcoxon rank-sum tests with BH correction at \( q = 0.10 \).

## Chapter 7 — Bayesian

**P7.1.** Fit a Bayesian Poisson regression model for count data using Stan. Use weakly informative \( \mathcal{N}(0, 2.5) \) priors on log-scale coefficients. Perform posterior predictive checks and compute WAIC.

**P7.2.** Compare the Laplace approximation to the exact posterior for a logistic regression model with \( n = 100 \) and \( p = 5 \) predictors. Overlay the marginal posterior densities from MCMC and the Laplace approximation.

**P7.3.** Implement variational inference (CAVI) for a simple mean-field Bayesian linear regression model. Compare the posterior mean and credible intervals to those from MCMC.

---

# Appendix D: Glossary of Key Terms

**Acceptance rate** — In Metropolis-Hastings, the fraction of proposed moves that are accepted. Optimal values: \( \approx 0.44 \) in 1D, \( \approx 0.234 \) for high-dimensional Gaussian targets.

**ARE (Asymptotic Relative Efficiency)** — The ratio of sample sizes needed by two procedures to achieve the same asymptotic variance. ARE \( > 1 \) favours the numerator procedure.

**BCa interval** — Bias-corrected and accelerated bootstrap confidence interval; second-order accurate and transformation-invariant.

**Burn-in / Warm-up** — Initial MCMC samples discarded before the chain reaches stationarity. Stan uses warm-up for adapting step size and mass matrix.

**Complete data** — In the EM framework, the augmented data \( (y, z) \) including unobserved components \( z \). The complete-data log-likelihood is typically tractable.

**Conjugate prior** — A prior that yields a posterior in the same parametric family, enabling closed-form Bayesian updating.

**Control variate** — A random variable with known expectation used to reduce MC variance by subtracting a mean-zero correction.

**Curse of dimensionality** — The exponential growth in volume (and required sample size) as dimension increases; makes deterministic quadrature impractical in high dimensions.

**Detailed balance** — The condition \( \pi(\theta)P(\theta, d\theta') = \pi(\theta')P(\theta', d\theta) \) that ensures a Markov chain has stationary distribution \( \pi \).

**ELBO** — Evidence Lower BOund; the objective maximised in variational inference; equals \( \log p(y) - \mathrm{KL}(q \,\|\, \pi(\cdot\mid y)) \).

**EM algorithm** — Expectation-Maximisation; iteratively maximises the observed-data log-likelihood via a surrogate \( Q \) function. Guarantees monotone ascent but may converge to local maxima.

**Empirical distribution** — The discrete distribution \( \hat{F}_n = n^{-1}\sum_{i=1}^n \delta_{x_i} \) placing equal mass \( 1/n \) at each observation.

**ESS (Effective Sample Size)** — The number of independent draws equivalent to the correlated MCMC chain, accounting for autocorrelation.

**Fisher information** — The expected negative Hessian of the log-likelihood; \( I(\theta) = \mathrm{E}[-\partial^2\ell/\partial\theta^2] \). Sets the Cramér-Rao lower bound for unbiased estimators.

**INLA** — Integrated Nested Laplace Approximation; a fast deterministic alternative to MCMC for latent Gaussian models.

**Importance sampling** — A variance-reduction technique that samples from a proposal \( q \) and reweights by \( w(x) = p(x)/q(x) \).

**Jeffreys prior** — The non-informative prior \( \pi(\theta) \propto |I(\theta)|^{1/2} \); invariant under reparameterisation.

**Leapfrog integrator** — The symplectic numerical integrator used in HMC to approximately simulate Hamiltonian dynamics while preserving volume.

**Likelihood interval** — The set \( \{\theta : R(\theta) \geq c\} \) where \( R(\theta) = L(\theta)/L(\hat\theta) \); preferred over Wald intervals for small samples or bounded parameters.

**Log-likelihood** — \( \ell(\theta) = \log L(\theta; x) \); numerically more stable and analytically more convenient than the likelihood itself.

**MAP estimate** — Maximum A Posteriori; the mode of the posterior \( \pi(\theta \mid y) \); used as the centre of the Laplace approximation.

**MCMC** — Markov Chain Monte Carlo; algorithms for sampling from intractable distributions by constructing an ergodic Markov chain with the target as its stationary distribution.

**Metropolis-Hastings** — A general MCMC algorithm using a proposal distribution and accept-reject step to maintain detailed balance.

**Nuisance parameter** — A model parameter not of primary interest; dealt with by profiling (frequentist) or marginalisation (Bayesian).

**NUTS** — No-U-Turn Sampler; an adaptive extension of HMC that automatically tunes the number of leapfrog steps; default in Stan.

**Observed information** — The negative Hessian of the log-likelihood at the MLE, \( \mathcal{I}(\hat\theta) \); used for standard error estimation.

**Permutation test** — An exact test based on the reference distribution obtained by permuting observation labels under \( H_0 \).

**Profile likelihood** — The log-likelihood with nuisance parameters replaced by their conditional MLEs; treats nuisance parameters as if known.

**Rejection sampling** — Draw \( x \sim q \) and accept with probability \( p(x)/(Mq(x)) \) where \( M = \sup p(x)/q(x) \); produces exact iid samples from \( p \).

**Relative likelihood** — \( R(\theta) = L(\theta)/L(\hat\theta) \in [0,1] \); the likelihood normalised to its maximum value.

**Rhat (\( \hat{R} \))** — The Gelman-Rubin potential scale reduction factor; values close to 1 indicate MCMC convergence.

**Saddlepoint approximation** — A highly accurate approximation to the density or tail probability of a sum, with relative error \( O(n^{-1}) \).

**Signed root LR statistic** — \( r(\psi) = \mathrm{sgn}(\hat\psi - \psi)\sqrt{2[\ell(\hat\psi)-\ell_P(\psi)]} \); approximately \( \mathcal{N}(0,1) \).

**Sufficient statistic** — A function \( T(x) \) that captures all information about \( \theta \) in the data; \( f(x \mid T(x)) \) does not depend on \( \theta \).

**WAIC** — Widely Applicable Information Criterion; a fully Bayesian predictive accuracy measure asymptotically equivalent to LOO cross-validation.

**Wilks' theorem** — The likelihood ratio statistic \( 2[\ell(\hat\theta) - \ell(\theta_0)] \xrightarrow{d} \chi^2_p \) under \( H_0 \); the basis of likelihood-ratio tests and intervals.
