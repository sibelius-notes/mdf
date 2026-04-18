---
title: "STAT 910: Bayesian Statistics"
prof: "Shoja'eddin Chenouri"
subjects: "STAT"
---

## Sources and References
**Primary texts** — J.K. Ghosh, M. Delampady, and T. Samanta, *An Introduction to Bayesian Analysis: Theory and Methods* (Springer, 2006); Christian P. Robert, *The Bayesian Choice* (2nd ed., Springer, 2007).
**Supplementary** — Andrew Gelman et al., *Bayesian Data Analysis* (3rd ed., CRC Press, 2013); James O. Berger, *Statistical Decision Theory and Bayesian Analysis* (2nd ed., Springer, 1985); José M. Bernardo and Adrian F.M. Smith, *Bayesian Theory* (Wiley, 1994).
**Online resources** — Harvard Statistics 221 (Statistical Computing) notes; Cornell STSCI 6520 (Bayesian Analysis) lecture notes; Duke STA 702 (Bayesian Theory and Computation) notes.

# Chapter 1: Review of Frequentist Statistical Inference

## Section 1.1: The Frequentist Framework

Classical statistical inference proceeds from the assumption that a parameter \(\theta \in \Theta\) is a fixed but unknown constant, and that randomness enters only through the data \(X = (X_1, \ldots, X_n)\) drawn from a distribution \(P_\theta\). The goal is to draw inferences about \(\theta\) using only the observed data and the assumed model \(\{P_\theta : \theta \in \Theta\}\).

<div class="definition">
<strong>Definition 1.1 (Statistical Model).</strong> A <em>statistical model</em> is a family \(\mathcal{P} = \{P_\theta : \theta \in \Theta\}\) of probability distributions on a measurable space \((\mathcal{X}, \mathcal{B})\). When each \(P_\theta\) has a density \(f(x|\theta)\) with respect to a common dominating measure \(\mu\), the model is called <em>dominated</em>.
</div>

<div class="definition">
<strong>Definition 1.2 (Likelihood Function).</strong> Given observed data \(x\), the <em>likelihood function</em> is the map \(\theta \mapsto L(\theta; x) = f(x|\theta)\), viewed as a function of \(\theta\) with \(x\) fixed. The <em>log-likelihood</em> is \(\ell(\theta; x) = \log L(\theta; x)\).
</div>

The **likelihood principle** asserts that all evidence in the data relevant to \(\theta\) is contained in the likelihood function. Two experiments yielding proportional likelihood functions for the same \(\theta\) should lead to identical inferences.

## Section 1.2: Sufficiency and the Factorisation Theorem

<div class="definition">
<strong>Definition 1.3 (Sufficient Statistic).</strong> A statistic \(T = T(X)\) is <em>sufficient</em> for \(\theta\) if the conditional distribution of \(X\) given \(T = t\) does not depend on \(\theta\) for any value of \(t\).
</div>

<div class="theorem">
<strong>Theorem 1.1 (Neyman–Fisher Factorisation).</strong> A statistic \(T(X)\) is sufficient for \(\theta\) if and only if the joint density factorises as

\[
f(x|\theta) = g(T(x), \theta) \cdot h(x)
\]

for non-negative functions \(g\) and \(h\), where \(h\) does not depend on \(\theta\).
</div>

The **exponential family** provides the most important class of models admitting low-dimensional sufficient statistics. A model belongs to the \(k\)-parameter exponential family if

\[
f(x|\theta) = h(x) \exp\!\left\{ \eta(\theta)^\top T(x) - A(\theta) \right\},
\]

where \(\eta(\theta)\) is the natural parameter, \(T(x)\) is the sufficient statistic of the same dimension as \(\eta\), and \(A(\theta) = \log \int h(x) \exp\{\eta(\theta)^\top T(x)\} \, d\mu(x)\) is the log-partition function.

## Section 1.3: Maximum Likelihood Estimation

<div class="definition">
<strong>Definition 1.4 (Maximum Likelihood Estimator).</strong> The <em>maximum likelihood estimator</em> (MLE) is any value

\[
\hat{\theta}_{\text{MLE}} \in \operatorname{arg\,max}_{\theta \in \Theta} \ell(\theta; x).
\]
</div>

Under regularity conditions — open parameter space, twice-differentiable likelihood, identifiability, existence of a dominating integrable function — the MLE satisfies the score equation

\[
\frac{\partial}{\partial \theta} \ell(\theta; x)\bigg|_{\theta = \hat\theta} = 0.
\]

<div class="definition">
<strong>Definition 1.5 (Fisher Information).</strong> The <em>Fisher information</em> at \(\theta\) is

\[
I(\theta) = \mathbb{E}_\theta\!\left[\left(\frac{\partial}{\partial\theta} \log f(X|\theta)\right)^{\!2}\right] = -\mathbb{E}_\theta\!\left[\frac{\partial^2}{\partial\theta^2} \log f(X|\theta)\right],
\]

where the second equality holds under regularity (interchange of differentiation and integration). For a vector parameter \(\theta \in \mathbb{R}^p\), the Fisher information matrix has \((i,j)\) entry \(I(\theta)_{ij} = -\mathbb{E}_\theta\!\left[\partial^2 \ell / \partial\theta_i \partial\theta_j\right]\).
</div>

<div class="theorem">
<strong>Theorem 1.2 (Cramér–Rao Lower Bound).</strong> Let \(\hat{\theta}\) be any unbiased estimator of \(\theta\) with finite variance. Under regularity conditions,

\[
\operatorname{Var}_\theta(\hat\theta) \geq \frac{1}{I(\theta)}.
\]

An estimator achieving this bound for all \(\theta\) is called <em>efficient</em>.
</div>

<div class="theorem">
<strong>Theorem 1.3 (Asymptotic Normality of MLE).</strong> Under standard regularity conditions, as \(n \to \infty\),

\[
\sqrt{n}\left(\hat\theta_{\text{MLE}} - \theta_0\right) \xrightarrow{d} N\!\left(0, I(\theta_0)^{-1}\right),
\]

where \(\theta_0\) is the true parameter value. In particular, the MLE is asymptotically efficient.
</div>

## Section 1.4: Frequentist Hypothesis Testing

The Neyman–Pearson framework formalises hypothesis testing as a decision problem with two actions. Given hypotheses \(H_0: \theta \in \Theta_0\) versus \(H_1: \theta \in \Theta_1\), a test \(\phi(x)\) specifies the probability of rejecting \(H_0\) upon observing \(x\). The test has **size** \(\alpha = \sup_{\theta \in \Theta_0} \mathbb{E}_\theta[\phi(X)]\) and **power function** \(\beta(\theta) = \mathbb{E}_\theta[\phi(X)]\) for \(\theta \in \Theta_1\).

<div class="theorem">
<strong>Theorem 1.4 (Neyman–Pearson Lemma).</strong> For testing a simple null \(H_0: \theta = \theta_0\) against a simple alternative \(H_1: \theta = \theta_1\), the most powerful level-\(\alpha\) test rejects when

\[
\Lambda(x) = \frac{f(x|\theta_1)}{f(x|\theta_0)} > k_\alpha,
\]

where \(k_\alpha\) is chosen so that \(P_{\theta_0}(\Lambda(X) > k_\alpha) = \alpha\).
</div>

## Section 1.5: Paradoxes in Classical Statistics

These paradoxes motivate the Bayesian approach and are studied carefully in STAT 910.

### Subsection 1.5.1: The Jeffreys–Lindley Paradox

Let \(X_1, \ldots, X_n \overset{\text{iid}}{\sim} N(\theta, \sigma^2)\) with \(\sigma^2\) known. Consider testing \(H_0: \theta = \theta_0\) versus \(H_1: \theta \neq \theta_0\). The frequentist \(z\)-test rejects \(H_0\) at level \(\alpha\) when \(|\bar{X} - \theta_0| > z_{\alpha/2} \sigma / \sqrt{n}\).

Lindley (1957) observed the following: suppose \(\bar{x}_n\) is fixed at a value that is marginally significant (e.g., the \(p\)-value is slightly below 0.05). Place prior mass \(\pi_0\) on \(H_0\) and a diffuse prior \(N(\theta_0, \tau^2)\) on \(\theta\) under \(H_1\). As \(\tau^2 \to \infty\) (making the prior under \(H_1\) more diffuse) and simultaneously \(n \to \infty\) while keeping the \(p\)-value fixed, the posterior probability of \(H_0\) approaches 1, while the frequentist test continues to reject \(H_0\). This stark disagreement — called the **Jeffreys–Lindley paradox** — reveals that frequentist \(p\)-values cannot be interpreted as posterior probabilities.

### Subsection 1.5.2: The Stopping Rule Paradox

Suppose an experimenter flips a fair coin and continues until 3 heads appear (negative binomial stopping). Another experimenter flips exactly 12 times (binomial design). Suppose both observe 3 heads in 12 flips. The observed data and the likelihoods are proportional, yet frequentist \(p\)-values differ because the reference distributions differ. The likelihood principle implies identical inferences; frequentist methods violate it. This is the **optional stopping problem**: frequentist error rates depend on the sampling plan, not just the data.

### Subsection 1.5.3: Confidence Interval Reinterpretation Issues

A 95% confidence interval \(C(X)\) satisfies \(P_\theta(\theta \in C(X)) = 0.95\) for all \(\theta\). Once data are observed, the realised interval either contains \(\theta\) or it does not — there is no probability statement about the parameter. Claiming "there is a 95% chance \(\theta\) lies in \([1.2, 3.4]\)" misinterprets the construction. Bayesian credible intervals directly assign probability to \(\theta\), avoiding this conceptual difficulty.

# Chapter 2: Bayesian Decision Theory

## Section 2.1: The Bayesian Framework

The Bayesian paradigm treats \(\theta\) as a random variable endowed with a **prior distribution** \(\pi(\theta)\) reflecting beliefs about \(\theta\) before data are observed. After observing \(X = x\), Bayes' theorem yields the **posterior distribution**:

\[
\pi(\theta | x) = \frac{f(x|\theta)\,\pi(\theta)}{m(x)}, \quad m(x) = \int f(x|\theta)\,\pi(\theta)\,d\theta,
\]

where \(m(x)\) is the **marginal likelihood** (or prior predictive). All Bayesian inference flows from \(\pi(\theta | x)\).

<div class="definition">
<strong>Definition 2.1 (Loss Function).</strong> A <em>loss function</em> \(L: \Theta \times \mathcal{A} \to \left[0, \infty\right)\) quantifies the penalty incurred when the true state of nature is \(\theta\) and the statistician takes action \(a \in \mathcal{A}\). The <em>action space</em> \(\mathcal{A}\) is the set of permissible decisions; in estimation \(\mathcal{A} = \Theta\).
</div>

<div class="definition">
<strong>Definition 2.2 (Posterior Risk).</strong> For a decision rule (estimator) \(\delta\), the <em>posterior risk</em> given observed data \(x\) is

\[
\rho(\delta | x) = \int_\Theta L(\theta, \delta(x))\,\pi(\theta | x)\,d\theta.
\]

The <em>Bayes estimator</em> \(\delta^*(x)\) minimises the posterior risk: \(\delta^*(x) = \operatorname{arg\,min}_{a \in \mathcal{A}} \rho(a | x)\).
</div>

<div class="definition">
<strong>Definition 2.3 (Bayes Risk).</strong> The <em>Bayes risk</em> of a decision rule \(\delta\) with respect to prior \(\pi\) is

\[
r(\pi, \delta) = \mathbb{E}_\pi\!\left[R(\theta, \delta)\right] = \int_\Theta R(\theta, \delta)\,\pi(\theta)\,d\theta,
\]

where \(R(\theta, \delta) = \mathbb{E}_\theta\!\left[L(\theta, \delta(X))\right]\) is the frequentist risk. Minimising \(r(\pi, \delta)\) over all rules is equivalent to minimising posterior risk for each \(x\).
</div>

## Section 2.2: Bayes Estimators Under Common Loss Functions

<div class="theorem">
<strong>Theorem 2.1 (Squared Error Loss).</strong> Under squared error loss \(L(\theta, a) = (\theta - a)^2\), the Bayes estimator is the posterior mean:

\[
\delta^*(x) = \mathbb{E}\left[\theta | x\right] = \int \theta\,\pi(\theta|x)\,d\theta.
\]

<strong>Proof.</strong> The posterior risk is

\[
\rho(a|x) = \int (\theta - a)^2 \pi(\theta|x)\,d\theta = \operatorname{Var}(\theta|x) + \left(a - \mathbb{E}\left[\theta|x\right]\right)^2.
\]

This is minimised at \(a = \mathbb{E}\left[\theta | x\right]\), with minimum value \(\operatorname{Var}(\theta|x) \geq 0\). \(\square\)
</div>

<div class="theorem">
<strong>Theorem 2.2 (Absolute Error Loss).</strong> Under absolute error loss \(L(\theta, a) = |\theta - a|\), the Bayes estimator is the posterior median, i.e., any \(m\) satisfying \(P(\theta \leq m | x) = 1/2\).

<strong>Proof.</strong> Write

\[
\rho(a|x) = \int |\theta - a|\,\pi(\theta|x)\,d\theta = \int_{-\infty}^a (a - \theta)\pi(\theta|x)\,d\theta + \int_a^\infty (\theta - a)\pi(\theta|x)\,d\theta.
\]

Differentiating with respect to \(a\):

\[
\frac{d}{da}\rho(a|x) = \int_{-\infty}^a \pi(\theta|x)\,d\theta - \int_a^\infty \pi(\theta|x)\,d\theta = F_\pi(a|x) - \left[1 - F_\pi(a|x)\right] = 2F_\pi(a|x) - 1.
\]

Setting this to zero gives \(F_\pi(a|x) = 1/2\), so \(a\) is the posterior median. \(\square\)
</div>

<div class="theorem">
<strong>Theorem 2.3 (Zero-One Loss).</strong> Under 0-1 loss \(L(\theta, a) = \mathbf{1}(\theta \neq a)\) (for discrete \(\theta\)), the Bayes estimator is the posterior mode:

\[
\delta^*(x) = \operatorname{arg\,max}_\theta \pi(\theta | x).
\]
</div>

## Section 2.3: Admissibility and the Complete Class Theorem

<div class="definition">
<strong>Definition 2.4 (Admissibility).</strong> A decision rule \(\delta\) is <em>inadmissible</em> if there exists another rule \(\delta'\) such that \(R(\theta, \delta') \leq R(\theta, \delta)\) for all \(\theta\), with strict inequality for some \(\theta\). Otherwise, \(\delta\) is <em>admissible</em>.
</div>

<div class="theorem">
<strong>Theorem 2.4 (Bayes Rules are Admissible).</strong> Under regularity conditions (in particular, when the Bayes risk is finite and the posterior is proper), every Bayes estimator — one that uniquely minimises posterior risk — is admissible.

<strong>Proof sketch.</strong> Suppose \(\delta^*\) is Bayes with respect to \(\pi\) but inadmissible: there exists \(\delta'\) with \(R(\theta, \delta') \leq R(\theta, \delta^*)\) for all \(\theta\) and strict inequality on a set of positive \(\pi\)-measure. Then

\[
r(\pi, \delta') = \int R(\theta, \delta')\,\pi(\theta)\,d\theta < \int R(\theta, \delta^*)\,\pi(\theta)\,d\theta = r(\pi, \delta^*),
\]

contradicting minimality of the Bayes risk of \(\delta^*\). \(\square\)
</div>

## Section 2.4: Minimax Rules and Least Favorable Priors

<div class="definition">
<strong>Definition 2.5 (Minimax Rule).</strong> A decision rule \(\delta^*\) is <em>minimax</em> if

\[
\sup_\theta R(\theta, \delta^*) = \inf_\delta \sup_\theta R(\theta, \delta).
\]
</div>

<div class="theorem">
<strong>Theorem 2.5 (Minimax via Least Favorable Prior).</strong> If \(\delta_\pi\) is a Bayes rule with respect to prior \(\pi\), and if the frequentist risk is constant: \(R(\theta, \delta_\pi) = c\) for all \(\theta\), then \(\delta_\pi\) is minimax and \(\pi\) is the <em>least favorable prior</em>.

<strong>Proof.</strong> For any rule \(\delta\),

\[
\sup_\theta R(\theta, \delta) \geq \int R(\theta, \delta)\,\pi(\theta)\,d\theta = r(\pi, \delta) \geq r(\pi, \delta_\pi) = \int R(\theta, \delta_\pi)\,\pi(\theta)\,d\theta = c.
\]

Hence \(\sup_\theta R(\theta, \delta) \geq c = \sup_\theta R(\theta, \delta_\pi)\), proving minimaxity. \(\square\)
</div>

<div class="theorem">
<strong>Theorem 2.6 (Complete Class Theorem, Wald 1950).</strong> Under regularity conditions on the model and loss, every admissible decision rule is a Bayes rule (or a limit of Bayes rules) for some prior \(\pi\). In other words, the class of Bayes rules forms a complete class.
</div>

This theorem has a profound implication: restricting attention to Bayes rules is without loss of generality in decision theory.

# Chapter 3: Prior Distributions and Bayesian Robustness

## Section 3.1: Conjugate Priors

<div class="definition">
<strong>Definition 3.1 (Conjugate Prior).</strong> A family of priors \(\mathcal{F}\) is <em>conjugate</em> to a likelihood \(f(x|\theta)\) if for every \(\pi \in \mathcal{F}\) and every sample, the posterior \(\pi(\theta|x)\) also belongs to \(\mathcal{F}\).
</div>

For exponential families, conjugate priors have a canonical form. If \(f(x|\eta) = h(x)\exp\{\eta^\top T(x) - A(\eta)\}\), then the conjugate prior on the natural parameter \(\eta\) is

\[
\pi(\eta | \lambda, \nu) \propto \exp\!\left\{\eta^\top \lambda - \nu A(\eta)\right\},
\]

where \(\lambda\) and \(\nu > 0\) are hyperparameters interpretable as a prior sum of sufficient statistics and an effective prior sample size, respectively.

**Key examples:**

| Likelihood | Parameter | Conjugate Prior | Posterior |
|---|---|---|---|
| \(\text{Binomial}(n, \theta)\) | \(\theta \in (0,1)\) | \(\text{Beta}(\alpha, \beta)\) | \(\text{Beta}(\alpha + x, \beta + n - x)\) |
| \(\text{Poisson}(\lambda)\) | \(\lambda > 0\) | \(\text{Gamma}(\alpha, \beta)\) | \(\text{Gamma}(\alpha + \sum x_i, \beta + n)\) |
| \(N(\mu, \sigma^2)\), \(\sigma^2\) known | \(\mu \in \mathbb{R}\) | \(N(\mu_0, \tau_0^2)\) | \(N\!\left(\frac{\mu_0/\tau_0^2 + n\bar{x}/\sigma^2}{1/\tau_0^2 + n/\sigma^2}, \frac{1}{1/\tau_0^2 + n/\sigma^2}\right)\) |

## Section 3.2: Improper Priors

When \(\int_\Theta \pi(\theta)\,d\theta = \infty\), the prior is called **improper**. Improper priors are not probability distributions but may still yield proper posteriors. The flat prior \(\pi(\theta) \propto 1\) is the canonical example.

<div class="remark">
<strong>Remark 3.1 (Posterior Propriety).</strong> An improper prior \(\pi\) yields a valid posterior if and only if the marginal likelihood \(m(x) = \int f(x|\theta)\pi(\theta)\,d\theta < \infty\). This must be verified; improper priors can lead to improper posteriors, in which case Bayesian inference breaks down. Hartigan (1983) constructed examples where ostensibly reasonable improper priors yield improper posteriors even for standard problems.
</div>

## Section 3.3: Bayesian Robustness

Bayesian robustness concerns the sensitivity of posterior inferences to the specification of the prior \(\pi\). The concern is especially acute for Bayes factors, which can depend dramatically on the prior placed on the alternative hypothesis.

### Subsection 3.3.1: \(\epsilon\)-Contamination Classes

<div class="definition">
<strong>Definition 3.2 (\(\epsilon\)-Contamination Class).</strong> Given a base prior \(\pi_0\) and \(\epsilon \in \left[0, 1\right]\), the <em>\(\epsilon\)-contamination class</em> is

\[
\Gamma_\epsilon = \left\{(1-\epsilon)\pi_0 + \epsilon q : q \in \mathcal{Q}\right\},
\]

where \(\mathcal{Q}\) is a class of contaminating distributions (e.g., all probability measures, or all unimodal distributions).
</div>

For a posterior quantity of interest \(g(\theta)\) and prior \(\pi \in \Gamma_\epsilon\), the range

\[
\left[\inf_{\pi \in \Gamma_\epsilon} \mathbb{E}^\pi[g(\theta)|x], \; \sup_{\pi \in \Gamma_\epsilon} \mathbb{E}^\pi[g(\theta)|x]\right]
\]

measures sensitivity. If this range is narrow, the inference is robust; if wide, the prior choice is influential.

### Subsection 3.3.2: Global and Local Robustness

**Global robustness** examines how conclusions change over a large class of priors \(\Gamma\). **Local robustness** examines the derivative of a posterior quantity with respect to perturbations of the prior in a neighbourhood of \(\pi_0\), using tools from functional analysis (influence functions, Gâteaux derivatives).

<div class="definition">
<strong>Definition 3.3 (Posterior Sensitivity Measure).</strong> For a posterior quantity \(T(\pi) = \mathbb{E}^\pi[g(\theta)|x]\), the <em>range of posterior expectations</em> over \(\Gamma\) is

\[
\Delta_\Gamma = \sup_{\pi \in \Gamma} T(\pi) - \inf_{\pi \in \Gamma} T(\pi).
\]

Small \(\Delta_\Gamma\) indicates robustness.
</div>

# Chapter 4: Large Sample Theory of Posterior Distributions

## Section 4.1: The Bernstein–von Mises Theorem

The Bernstein–von Mises (BvM) theorem is the cornerstone of Bayesian large-sample theory. It establishes that under regularity conditions, the posterior distribution converges to a normal distribution centred at the MLE, rendering Bayesian and frequentist inferences asymptotically equivalent.

<div class="theorem">
<strong>Theorem 4.1 (Bernstein–von Mises).</strong> Let \(X_1, \ldots, X_n \overset{\text{iid}}{\sim} f(\cdot|\theta_0)\) for \(\theta_0 \in \Theta \subset \mathbb{R}\). Assume:
<ol>
  <li>The model is identifiable and the likelihood is three times continuously differentiable in a neighbourhood of \(\theta_0\).</li>
  <li>The Fisher information \(I(\theta_0) > 0\) exists and is finite.</li>
  <li>The prior \(\pi\) is continuous and positive at \(\theta_0\).</li>
  <li>Uniform law of large numbers conditions (e.g., Wald regularity) hold.</li>
</ol>
Then, as \(n \to \infty\),

\[
\sup_{A \in \mathcal{B}(\mathbb{R})} \left|\Pi\!\left(\sqrt{n}(\theta - \hat\theta_n) \in A \,\Big|\, X^{(n)}\right) - N\!\left(A;\, 0,\, I(\theta_0)^{-1}\right)\right| \to 0 \quad P_{\theta_0}\text{-a.s.},
\]

where \(\hat\theta_n\) is the MLE and \(N(\cdot; 0, I(\theta_0)^{-1})\) denotes the Gaussian measure with mean 0 and variance \(I(\theta_0)^{-1}\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Write the log-posterior as

\[
\log \pi(\theta|x^{(n)}) = \log\pi(\theta) + \sum_{i=1}^n \log f(x_i|\theta) + \text{const}.
\]

Taylor-expand the log-likelihood around the MLE \(\hat\theta_n\):

\[
\sum_{i=1}^n \log f(x_i|\theta) = \sum_{i=1}^n \log f(x_i|\hat\theta_n) + \frac{1}{2}(\theta - \hat\theta_n)^2 \sum_{i=1}^n \frac{\partial^2}{\partial\theta^2}\log f(x_i|\theta^*_n) + O_p((\theta-\hat\theta_n)^3),
\]

where \(\theta^*_n\) lies between \(\hat\theta_n\) and \(\theta\). By the law of large numbers,

\[
\frac{1}{n}\sum_{i=1}^n \frac{\partial^2}{\partial\theta^2}\log f(x_i|\theta^*_n) \to -I(\theta_0) \quad P_{\theta_0}\text{-a.s.}
\]

Hence the log-posterior is asymptotically quadratic in \(\theta\):

\[
\log \pi(\theta|x^{(n)}) \approx -\frac{n I(\theta_0)}{2}(\theta - \hat\theta_n)^2 + \log\pi(\hat\theta_n) + \text{const},
\]

corresponding to a \(N(\hat\theta_n, [n I(\theta_0)]^{-1})\) distribution. Since \(\pi(\theta)\) is continuous and positive at \(\theta_0\), the prior contributes only \(\log\pi(\hat\theta_n)\), which is absorbed into the normalisation. Controlling the Taylor remainder uniformly over the set \(\{|\theta - \hat\theta_n| \leq M/\sqrt{n}\}\) for any \(M\) and showing that the tails are negligible complete the argument. \(\square\)
</div>

<div class="remark">
<strong>Remark 4.1.</strong> The BvM theorem has several important consequences. First, Bayesian credible intervals are asymptotically equal to frequentist confidence intervals. Second, the choice of prior is asymptotically irrelevant — the data overwhelm prior information as \(n \to \infty\). Third, the posterior mean, median, and mode all converge to the MLE. For multiparameter models, the posterior converges to \(N(\hat\theta_n, [n I(\theta_0)]^{-1})\) in total variation.
</div>

## Section 4.2: Laplace Approximation

The **Laplace approximation** provides an analytic approximation to the posterior that is closely related to the BvM result. It is particularly useful for computing marginal likelihoods and normalising constants.

<div class="theorem">
<strong>Theorem 4.2 (Laplace Approximation).</strong> Let \(h(\theta) = \log f(x|\theta) + \log\pi(\theta)\) be the log-unnormalized posterior. Let \(\hat\theta_{\text{MAP}} = \operatorname{arg\,max}_\theta h(\theta)\) be the maximum a posteriori (MAP) estimate, and define \(\Sigma_n = [-h''(\hat\theta_{\text{MAP}})]^{-1}\). Under smoothness conditions,

\[
\pi(\theta | x) \approx N(\hat\theta_{\text{MAP}},\, \Sigma_n).
\]

Moreover, the normalising constant satisfies

\[
m(x) = \int f(x|\theta)\pi(\theta)\,d\theta \approx f(x|\hat\theta_{\text{MAP}})\pi(\hat\theta_{\text{MAP}})\left(2\pi\right)^{p/2}|\Sigma_n|^{1/2}.
\]
</div>

<div class="proof">
<strong>Derivation.</strong> Taylor-expand \(h(\theta)\) about \(\hat\theta_{\text{MAP}}\):

\[
h(\theta) \approx h(\hat\theta_{\text{MAP}}) + \frac{1}{2}(\theta - \hat\theta_{\text{MAP}})^\top h''(\hat\theta_{\text{MAP}})(\theta - \hat\theta_{\text{MAP}}),
\]

where the linear term vanishes because \(\hat\theta_{\text{MAP}}\) is a critical point. Since \(-h''(\hat\theta_{\text{MAP}}) \succ 0\) at a maximum, writing \(A = -h''(\hat\theta_{\text{MAP}})\):

\[
\int e^{h(\theta)}\,d\theta \approx e^{h(\hat\theta_{\text{MAP}})} \int \exp\!\left\{-\frac{1}{2}(\theta - \hat\theta_{\text{MAP}})^\top A\,(\theta - \hat\theta_{\text{MAP}})\right\}\!d\theta = e^{h(\hat\theta_{\text{MAP}})}(2\pi)^{p/2}|A|^{-1/2}. \quad \square
\]
</div>

Under large-sample regularity, \(\hat\theta_{\text{MAP}} \to \hat\theta_{\text{MLE}}\) and \(\Sigma_n \to [n I(\theta_0)]^{-1}\), so the Laplace approximation and the BvM result agree to leading order.

## Section 4.3: Posterior Consistency

<div class="definition">
<strong>Definition 4.1 (Posterior Consistency).</strong> The posterior is <em>consistent</em> at \(\theta_0\) if, for every neighbourhood \(U\) of \(\theta_0\),

\[
\Pi(U^c | X_1, \ldots, X_n) \to 0 \quad P_{\theta_0}^\infty\text{-a.s.}
\]
</div>

<div class="theorem">
<strong>Theorem 4.3 (Schwartz, 1965).</strong> Suppose the prior \(\pi\) assigns positive mass to every Kullback-Leibler neighbourhood of \(f(\cdot|\theta_0)\):

\[
\pi\!\left(\left\{\theta : K(f_{\theta_0}, f_\theta) < \epsilon\right\}\right) > 0 \quad \text{for all } \epsilon > 0,
\]

where \(K(f_{\theta_0}, f_\theta) = \mathbb{E}_{\theta_0}\left[\log(f_{\theta_0}(X)/f_\theta(X))\right]\). Then the posterior is consistent at \(\theta_0\).
</div>

This is the Bayesian analogue of consistency of the MLE. The condition requires that the prior gives positive probability to any neighbourhood of the true parameter — a mild requirement satisfied by any prior that is continuous and positive at \(\theta_0\).

# Chapter 5: Choice of Priors

## Section 5.1: Jeffreys Prior

Harold Jeffreys (1946) proposed a principled rule for constructing reference priors that are invariant under reparametrisation.

<div class="definition">
<strong>Definition 5.1 (Jeffreys Prior).</strong> The <em>Jeffreys prior</em> is

\[
\pi_J(\theta) \propto \left|I(\theta)\right|^{1/2},
\]

where \(I(\theta)\) is the Fisher information (matrix, for vector parameters) and \(|\cdot|\) denotes the determinant.
</div>

<div class="theorem">
<strong>Theorem 5.1 (Invariance of Jeffreys Prior).</strong> The Jeffreys prior is invariant under smooth reparametrisation. If \(\phi = g(\theta)\) is a one-to-one smooth map, then the Jeffreys prior in the \(\phi\) parametrisation is \(\pi_J(\phi) \propto |I_\phi(\phi)|^{1/2}\), which coincides with the image measure of \(\pi_J(\theta)\) under \(g\).

<strong>Proof.</strong> Fisher information transforms as \(I_\phi(\phi) = I(\theta)\,(d\theta/d\phi)^2\). Then

\[
\pi_J(\phi) = \pi_J(\theta(\phi))\left|\frac{d\theta}{d\phi}\right| \propto I(\theta(\phi))^{1/2} \left|\frac{d\theta}{d\phi}\right| = \left[I(\theta(\phi))\left(\frac{d\theta}{d\phi}\right)^{\!2}\right]^{1/2} = I_\phi(\phi)^{1/2}. \quad \square
\]
</div>

### Subsection 5.1.1: Jeffreys Prior for the Binomial

Let \(X \sim \text{Binomial}(n, \theta)\). Then \(\ell(\theta) = x\log\theta + (n-x)\log(1-\theta)\) and

\[
-\frac{\partial^2 \ell}{\partial\theta^2} = \frac{x}{\theta^2} + \frac{n-x}{(1-\theta)^2}.
\]

Taking expectation: \(I(\theta) = \mathbb{E}_\theta[x]/\theta^2 + \mathbb{E}_\theta[n-x]/(1-\theta)^2 = n/\theta + n/(1-\theta) = n/[\theta(1-\theta)]\). Therefore

\[
\pi_J(\theta) \propto I(\theta)^{1/2} = \left[\frac{n}{\theta(1-\theta)}\right]^{1/2} \propto \theta^{-1/2}(1-\theta)^{-1/2},
\]

which is the \(\text{Beta}(1/2, 1/2)\) distribution — the arcsine distribution.

### Subsection 5.1.2: Jeffreys Prior for the Poisson

Let \(X \sim \text{Poisson}(\lambda)\). Then \(\ell(\lambda) = x\log\lambda - \lambda - \log x!\), so \(-\partial^2\ell/\partial\lambda^2 = x/\lambda^2\) and \(I(\lambda) = 1/\lambda\). Hence

\[
\pi_J(\lambda) \propto \lambda^{-1/2},
\]

which is an improper prior proportional to \(\lambda^{-1/2}\) (or equivalently, a \(\text{Gamma}(1/2, 0)\) limit).

### Subsection 5.1.3: Jeffreys Prior for the Normal Mean

Let \(X_1,\ldots,X_n \overset{\text{iid}}{\sim} N(\mu, \sigma^2)\) with \(\sigma^2\) known. Then \(I(\mu) = n/\sigma^2\) (constant in \(\mu\)), so

\[
\pi_J(\mu) \propto 1,
\]

the flat improper prior on \(\mathbb{R}\). This yields a proper posterior \(N(\bar{x}, \sigma^2/n)\) as expected.

## Section 5.2: Reference Priors

Bernardo (1979) extended Jeffreys' approach by defining reference priors as maximisers of the expected Kullback-Leibler divergence between prior and posterior.

<div class="definition">
<strong>Definition 5.2 (Reference Prior).</strong> The <em>reference prior</em> \(\pi^*\) maximises the expected information gained through experimentation:

\[
\pi^* = \operatorname{arg\,max}_\pi \mathbb{E}_{m(x)}\!\left[K(\pi(\cdot|x), \pi(\cdot))\right],
\]

where the expectation is over the marginal distribution of \(X\) and \(K\) denotes KL divergence. In the one-parameter regular case, the reference prior coincides with the Jeffreys prior.
</div>

For nuisance parameters, reference priors are constructed sequentially, prioritising parameters of interest. The reference prior approach respects the asymmetry between interest and nuisance parameters in a way that the Jeffreys rule does not.

## Section 5.3: Maximum Entropy Priors

E.T. Jaynes advocated for priors derived from the principle of maximum entropy: among all distributions consistent with available information (expressed as moment constraints), choose the one with the largest Shannon entropy.

<div class="theorem">
<strong>Theorem 5.2 (Maximum Entropy Distribution).</strong> Subject to constraints \(\mathbb{E}[f_k(\theta)] = \mu_k\) for \(k = 1,\ldots,m\), the maximum entropy prior is the exponential family

\[
\pi^*(\theta) \propto \exp\!\left\{\sum_{k=1}^m \lambda_k f_k(\theta)\right\},
\]

where \(\lambda_1,\ldots,\lambda_m\) are Lagrange multipliers determined by the moment constraints.
</div>

For example, subject only to \(\theta \in \left[a, b\right]\), the maximum entropy prior is \(\text{Uniform}(a, b)\). Subject to \(\mathbb{E}[\theta] = \mu\) and \(\mathbb{E}[\theta^2] = \mu^2 + \sigma^2\) on \(\mathbb{R}\), the maximum entropy prior is \(N(\mu, \sigma^2)\).

## Section 5.4: Exchangeability and de Finetti's Theorem

<div class="definition">
<strong>Definition 5.3 (Exchangeability).</strong> An infinite sequence of random variables \(X_1, X_2, \ldots\) is <em>exchangeable</em> if for every finite permutation \(\sigma\) of \(\{1,\ldots,n\}\),

\[
(X_1,\ldots,X_n) \overset{d}{=} (X_{\sigma(1)},\ldots,X_{\sigma(n)}).
\]
</div>

<div class="theorem">
<strong>Theorem 5.3 (de Finetti's Representation Theorem).</strong> A sequence \(X_1, X_2, \ldots\) of \(\{0,1\}\)-valued random variables is infinitely exchangeable if and only if there exists a probability measure \(\pi\) on \(\left[0,1\right]\) such that

\[
P(X_1 = x_1, \ldots, X_n = x_n) = \int_0^1 \theta^{\sum x_i}(1-\theta)^{n - \sum x_i}\,d\pi(\theta).
\]

More generally, for real-valued exchangeable sequences, the joint distribution is a scale mixture of i.i.d. distributions:

\[
P(X_1 \in A_1, \ldots, X_n \in A_n) = \int \prod_{i=1}^n P_\theta(X_i \in A_i)\,d\pi(\theta).
\]
</div>

De Finetti's theorem provides a subjective foundation for Bayesian statistics: the prior \(\pi(\theta)\) is not merely a technical device but represents the beliefs of an agent who regards the observations as exchangeable. The theorem shows that any coherent exchangeable model is inherently Bayesian.

## Section 5.5: Zellner's \(g\)-Prior for Regression

In Bayesian linear regression with \(Y = X\beta + \epsilon\), \(\epsilon \sim N(0, \sigma^2 I)\), Zellner (1986) proposed the conjugate prior

\[
\beta|\sigma^2 \sim N\!\left(\beta_0,\, g\sigma^2(X^\top X)^{-1}\right), \quad \sigma^2 \sim \text{Inverse-Gamma}(a/2, b/2),
\]

where \(g > 0\) is a scalar hyperparameter. The matrix \(X^\top X\) encodes the information structure of the design, and the factor \(g\) controls the ratio of prior to data information. The posterior has the same form with updated parameters, and model comparison via Bayes factors has closed form.

# Chapter 6: Hypothesis Testing and Model Selection

## Section 6.1: Bayes Factors

<div class="definition">
<strong>Definition 6.1 (Bayes Factor).</strong> For models \(M_0\) and \(M_1\) with marginal likelihoods \(m_j(x) = \int f(x|\theta_j, M_j)\pi(\theta_j|M_j)\,d\theta_j\), the <em>Bayes factor</em> in favour of \(M_1\) against \(M_0\) is

\[
B_{10} = \frac{m_1(x)}{m_0(x)} = \frac{P(X=x|M_1)}{P(X=x|M_0)}.
\]

The posterior odds relate to the Bayes factor via

\[
\frac{P(M_1|x)}{P(M_0|x)} = B_{10} \cdot \frac{P(M_1)}{P(M_0)}.
\]
</div>

Jeffreys (1961) proposed an evidence scale for \(\log_{10} B_{10}\): values in \((0, 0.5)\) are "barely worth mentioning," \((0.5, 1)\) are "substantial," \((1, 2)\) are "strong," and \(> 2\) are "decisive."

## Section 6.2: Bayes Factor Sensitivity and Intrinsic Bayes Factors

When comparing a point null \(H_0: \theta = \theta_0\) against \(H_1: \theta \neq \theta_0\) using an improper prior \(\pi(\theta|H_1)\), the Bayes factor is undefined because \(m_1(x)\) involves the undefined normalising constant of the improper prior. Several solutions exist.

The **intrinsic Bayes factor** (Berger and Pericchi, 1996) uses a minimal training sample \(x^{(l)}\) to update the improper prior to a proper one, then computes the Bayes factor on the remaining data:

\[
B_{10}^I = \text{average over training samples of }\frac{m_1(x \setminus x^{(l)}|x^{(l)})}{m_0(x \setminus x^{(l)}|x^{(l)})}.
\]

## Section 6.3: BIC Approximation

The Bayesian Information Criterion (BIC) provides a large-sample approximation to the log marginal likelihood.

<div class="theorem">
<strong>Theorem 6.1 (BIC Approximation).</strong> Under Laplace approximation regularity conditions, for model \(M_k\) with \(d_k\) parameters,

\[
\log m_k(x) \approx \log f(x|\hat\theta_k) - \frac{d_k}{2}\log n + O(1),
\]

where \(\hat\theta_k\) is the MLE under \(M_k\). Define \(\text{BIC}_k = -2\log f(x|\hat\theta_k) + d_k \log n\). Then

\[
2\log B_{10} = 2\log m_1(x) - 2\log m_0(x) \approx \text{BIC}_0 - \text{BIC}_1.
\]

<strong>Derivation.</strong> Applying Laplace approximation to \(m_k(x)\):

\[
m_k(x) \approx f(x|\hat\theta_k)\pi(\hat\theta_k)(2\pi)^{d_k/2}|[-H_k]|^{-1/2},
\]

where \(H_k = \partial^2\log f(x|\theta)/\partial\theta\partial\theta^\top|_{\hat\theta_k}\). Since \(|{-H_k}| = O(n^{d_k})\), we have \(|{-H_k}|^{-1/2} = O(n^{-d_k/2})\), so

\[
\log m_k(x) = \log f(x|\hat\theta_k) - \frac{d_k}{2}\log n + O(1).
\]

The \(O(1)\) terms include \(\log\pi(\hat\theta_k) + (d_k/2)\log(2\pi)\) and are absorbed into the approximation. \(\square\)
</div>

## Section 6.4: Credible Intervals and HPD Regions

<div class="definition">
<strong>Definition 6.2 (Credible Interval).</strong> A set \(C \subset \Theta\) is a \((1-\alpha)\)-<em>credible region</em> if

\[
\Pi(C | x) = \int_C \pi(\theta|x)\,d\theta \geq 1 - \alpha.
\]
</div>

<div class="definition">
<strong>Definition 6.3 (Highest Posterior Density Region).</strong> The <em>highest posterior density</em> (HPD) region of level \(1-\alpha\) is

\[
C^* = \left\{\theta : \pi(\theta|x) \geq k_\alpha\right\},
\]

where \(k_\alpha\) is the largest constant such that \(\Pi(C^*|x) \geq 1-\alpha\). HPD regions are the shortest credible regions.
</div>

<div class="remark">
<strong>Remark 6.1 (Credible vs. Confidence Intervals).</strong> A Bayesian credible interval \(C\) satisfies \(P(\theta \in C | x) = 1-\alpha\): the parameter lies in \(C\) with probability \(1-\alpha\) given the data. A frequentist confidence interval satisfies \(P_\theta(C(X) \ni \theta) = 1-\alpha\) for all \(\theta\): the procedure covers the true parameter with probability \(1-\alpha\) over repeated experiments. These are fundamentally different statements, though they numerically agree to leading asymptotic order.
</div>

## Section 6.5: Bayesian \(p\)-Values and Posterior Predictive Checks

A **Bayesian \(p\)-value** (Meng, 1994; Gelman et al., 1996) is defined using a test statistic \(T(x, \theta)\) via

\[
p_B = P(T(X^{\text{rep}}, \theta) \geq T(x_{\text{obs}}, \theta) | x_{\text{obs}}),
\]

where the probability is over the **posterior predictive distribution** \(X^{\text{rep}} | x_{\text{obs}} \sim \int f(\cdot|\theta)\pi(\theta|x_{\text{obs}})\,d\theta\). Values of \(p_B\) near 0 or 1 indicate model misfit. Unlike classical \(p\)-values, Bayesian \(p\)-values do not require a reference distribution and can be used for complex models.

# Chapter 7: Bayesian Computation

## Section 7.1: The Monte Carlo Problem

For most nontrivial models, the posterior \(\pi(\theta|x)\) is not available in closed form. Bayesian computation seeks to approximate posterior quantities \(\mathbb{E}[g(\theta)|x] = \int g(\theta)\pi(\theta|x)\,d\theta\) numerically. **Markov chain Monte Carlo** (MCMC) methods generate a Markov chain with stationary distribution \(\pi(\theta|x)\), enabling consistent estimation of posterior expectations.

## Section 7.2: The Metropolis–Hastings Algorithm

<div class="definition">
<strong>Definition 7.1 (Metropolis–Hastings Algorithm).</strong> Given a target density \(\pi(\theta)\) (the posterior) and a proposal kernel \(q(\theta'|\theta)\), the <em>Metropolis–Hastings</em> (MH) algorithm generates a Markov chain as follows:
<ol>
  <li>Initialise \(\theta^{(0)}\).</li>
  <li>At step \(t\), draw a proposal \(\theta' \sim q(\cdot|\theta^{(t)})\).</li>
  <li>Compute the acceptance ratio

  \[
  \alpha(\theta^{(t)}, \theta') = \min\!\left(1,\, \frac{\pi(\theta')\,q(\theta^{(t)}|\theta')}{\pi(\theta^{(t)})\,q(\theta'|\theta^{(t)})}\right).
  \]
  </li>
  <li>Set \(\theta^{(t+1)} = \theta'\) with probability \(\alpha\), and \(\theta^{(t+1)} = \theta^{(t)}\) otherwise.</li>
</ol>
</div>

<div class="theorem">
<strong>Theorem 7.1 (Stationarity of Metropolis–Hastings).</strong> The MH Markov chain has \(\pi\) as its stationary distribution.

<strong>Proof.</strong> We verify the <em>detailed balance</em> condition: for all \(\theta, \theta'\),

\[
\pi(\theta)\,T(\theta'|\theta) = \pi(\theta')\,T(\theta|\theta'),
\]

where \(T(\theta'|\theta)\) is the MH transition kernel. For \(\theta \neq \theta'\),

\[
T(\theta'|\theta) = q(\theta'|\theta)\,\alpha(\theta, \theta').
\]

Assume without loss of generality that \(\pi(\theta')q(\theta|\theta') \leq \pi(\theta)q(\theta'|\theta)\), so

\[
\alpha(\theta, \theta') = \frac{\pi(\theta')q(\theta|\theta')}{\pi(\theta)q(\theta'|\theta)}, \quad \alpha(\theta', \theta) = 1.
\]

Then

\[
\pi(\theta)\,T(\theta'|\theta) = \pi(\theta)\cdot q(\theta'|\theta)\cdot \frac{\pi(\theta')q(\theta|\theta')}{\pi(\theta)q(\theta'|\theta)} = \pi(\theta')q(\theta|\theta') = \pi(\theta')\cdot q(\theta|\theta')\cdot 1 = \pi(\theta')\,T(\theta|\theta').
\]

Hence detailed balance holds. Since \(\pi\) satisfies detailed balance with \(T\), it is stationary: \(\int \pi(\theta) T(\theta'|\theta)\,d\theta = \pi(\theta')\). Under irreducibility and aperiodicity (which hold for virtually all practical MH implementations with continuous proposals), the chain converges in total variation to \(\pi\). \(\square\)
</div>

Special cases include: **random walk MH** with \(q(\theta'|\theta) = q(|\theta'-\theta|)\) (symmetric, so the proposal ratio cancels); **independent MH** with \(q(\theta'|\theta) = q(\theta')\); and **Langevin diffusion** proposals incorporating gradient information.

## Section 7.3: The Gibbs Sampler

The Gibbs sampler is an MH algorithm tailored to multivariate targets when **full conditional distributions** are available in closed form.

<div class="definition">
<strong>Definition 7.2 (Gibbs Sampler).</strong> Partition \(\theta = (\theta_1,\ldots,\theta_p)\). The <em>Gibbs sampler</em> iteratively samples each component from its full conditional:

At step \(t\), for \(j = 1, \ldots, p\), draw

\[
\theta_j^{(t+1)} \sim \pi\!\left(\theta_j \,\Big|\, \theta_1^{(t+1)}, \ldots, \theta_{j-1}^{(t+1)}, \theta_{j+1}^{(t)}, \ldots, \theta_p^{(t)}, x\right).
\]
</div>

<div class="theorem">
<strong>Theorem 7.2 (Stationarity of Gibbs Sampler).</strong> Each full conditional update is a special case of MH with acceptance probability identically 1. Therefore the Gibbs sampler has \(\pi(\theta|x)\) as its stationary distribution.
</div>

The Gibbs sampler is especially effective for hierarchical models, where full conditionals are often standard distributions (normal, gamma, beta).

## Section 7.4: Convergence Diagnostics

Convergence of MCMC chains is assessed by several diagnostics.

**Gelman–Rubin \(\hat{R}\):** Run \(m \geq 2\) chains of length \(n\). Let \(B\) be the between-chain variance and \(W\) be the average within-chain variance of the target quantity. The potential scale reduction factor is

\[
\hat{R} = \sqrt{\frac{\hat{V}}{W}}, \quad \hat{V} = \frac{n-1}{n}W + \frac{1}{n}B.
\]

Values \(\hat{R} > 1.1\) (or 1.05 by modern standards) indicate non-convergence.

**Trace plots** display sampled values over iterations; a well-mixed chain resembles white noise around a stable mean.

**Effective sample size:** \(\text{ESS} = n / (1 + 2\sum_{k=1}^\infty \rho_k)\), where \(\rho_k\) is the lag-\(k\) autocorrelation.

## Section 7.5: Hamiltonian Monte Carlo

**Hamiltonian Monte Carlo** (HMC, Duane et al. 1987; Neal 2011) introduces auxiliary momentum variables \(p \sim N(0, M)\) and simulates Hamiltonian dynamics to propose distant moves with high acceptance probability.

Define the Hamiltonian \(H(\theta, p) = -\log\pi(\theta|x) + \frac{1}{2}p^\top M^{-1}p\). The dynamics follow

\[
\frac{d\theta}{dt} = M^{-1}p, \quad \frac{dp}{dt} = \nabla_\theta \log\pi(\theta|x).
\]

These are discretised using the leapfrog integrator, which preserves volume and is time-reversible, ensuring the MH acceptance step leaves the joint density \(\pi(\theta|x)\cdot N(p; 0, M)\) invariant. HMC dramatically reduces autocorrelation compared to random walk MH for high-dimensional problems.

## Section 7.6: Variational Inference

**Variational inference** (VI) recasts posterior approximation as an optimisation problem. Approximate the posterior \(\pi(\theta|x)\) by a member \(q_\lambda(\theta)\) of a tractable family \(\mathcal{Q}\), minimising the KL divergence:

\[
q^*_\lambda = \operatorname{arg\,min}_{q \in \mathcal{Q}} K(q(\theta) \| \pi(\theta|x)).
\]

Expanding:

\[
\log m(x) = \text{ELBO}(q) + K(q(\theta)\|\pi(\theta|x)),
\]

where the **evidence lower bound** is

\[
\text{ELBO}(q) = \mathbb{E}_q\left[\log f(x|\theta)\right] - K(q(\theta)\|\pi(\theta)).
\]

Since \(\log m(x)\) is fixed, minimising \(K(q\|\pi(\cdot|x))\) is equivalent to maximising the ELBO.

**Mean-field variational inference** restricts \(q\) to the class \(\mathcal{Q}_{MF} = \{q: q(\theta) = \prod_{j=1}^p q_j(\theta_j)\}\). The optimal factors satisfy

\[
\log q_j^*(\theta_j) = \mathbb{E}_{q_{-j}}\!\left[\log\pi(\theta, x)\right] + \text{const},
\]

yielding coordinate ascent updates (**CAVI**). VI is typically faster than MCMC but can underestimate posterior variance due to the mode-seeking nature of forward KL.

### Subsection 7.6.1: Integrated Nested Laplace Approximation

**INLA** (Rue, Martino, Chopin, 2009) provides accurate posterior approximations for latent Gaussian models by combining Laplace approximations with numerical integration. It is particularly effective for spatial models and is orders of magnitude faster than MCMC for supported model classes.

# Chapter 8: Advanced Topics

## Section 8.1: Hierarchical Models

Hierarchical models (also called multilevel models) encode structured prior information through a cascade of distributions.

**Three-level hierarchy:**

\[
\theta_i | \mu, \tau \overset{\text{iid}}{\sim} N(\mu, \tau^2), \quad X_i | \theta_i, \sigma^2 \overset{\text{ind}}{\sim} N(\theta_i, \sigma^2), \quad (\mu, \tau^2) \sim \pi(\mu, \tau^2).
\]

The observed data \(X_i\) inform \(\theta_i\); the \(\theta_i\) are linked through the shared hyperparameters \((\mu, \tau^2)\), enabling **partial pooling** — each estimate borrows strength from all groups.

**The James–Stein Estimator as Empirical Bayes.** For \(X_i \overset{\text{ind}}{\sim} N(\theta_i, \sigma^2)\) with \(i = 1,\ldots,p\) and \(p \geq 3\), the MLE \(\hat\theta_i = X_i\) is inadmissible. The James–Stein estimator

\[
\hat\theta_i^{JS} = \left(1 - \frac{(p-2)\sigma^2}{\|X\|^2}\right) X_i
\]

dominates the MLE under squared error loss. From the Bayesian perspective, this arises from the empirical Bayes hierarchical model with \(\theta_i \overset{\text{iid}}{\sim} N(0, \tau^2)\): the posterior mean is

\[
\mathbb{E}[\theta_i | X_i] = \left(\frac{\tau^2}{\tau^2 + \sigma^2}\right) X_i = \left(1 - \frac{\sigma^2}{\tau^2 + \sigma^2}\right) X_i,
\]

and substituting the marginal MLE of \(\tau^2\) (from \(X_i \sim N(0, \tau^2 + \sigma^2)\)) gives the James–Stein shrinkage factor.

## Section 8.2: Bayesian Nonparametrics

Bayesian nonparametrics places priors directly on infinite-dimensional spaces of distributions, allowing the data to determine the complexity of the model.

### Subsection 8.2.1: The Dirichlet Process

<div class="definition">
<strong>Definition 8.1 (Dirichlet Process).</strong> A random probability measure \(G\) on a measurable space \((\Theta, \mathcal{B})\) is a <em>Dirichlet process</em> with base measure \(G_0\) and concentration parameter \(\alpha > 0\), written \(G \sim \text{DP}(\alpha, G_0)\), if for every finite measurable partition \((A_1, \ldots, A_k)\) of \(\Theta\),

\[
(G(A_1), \ldots, G(A_k)) \sim \text{Dirichlet}(\alpha G_0(A_1), \ldots, \alpha G_0(A_k)).
\]
</div>

The DP was introduced by Ferguson (1973), who proved existence via Kolmogorov's consistency theorem.

<div class="theorem">
<strong>Theorem 8.1 (Posterior of Dirichlet Process).</strong> If \(G \sim \text{DP}(\alpha, G_0)\) and \(\theta_1,\ldots,\theta_n | G \overset{\text{iid}}{\sim} G\), then

\[
G | \theta_1,\ldots,\theta_n \sim \text{DP}\!\left(\alpha + n,\, \frac{\alpha G_0 + \sum_{i=1}^n \delta_{\theta_i}}{\alpha + n}\right).
\]

The posterior is again a DP with updated base measure — a convex combination of the prior \(G_0\) and the empirical measure.
</div>

**Stick-breaking representation** (Sethuraman, 1994): A DP sample \(G\) has the constructive representation

\[
G = \sum_{k=1}^\infty w_k \delta_{\theta_k^*}, \quad w_k = V_k\prod_{j<k}(1-V_j), \quad V_k \overset{\text{iid}}{\sim} \text{Beta}(1, \alpha), \quad \theta_k^* \overset{\text{iid}}{\sim} G_0.
\]

This representation shows that DP samples are almost surely discrete (even when \(G_0\) is continuous), concentrated on a countably infinite set of atoms.

**Chinese Restaurant Process (CRP):** The marginal distribution of \(\theta_1,\ldots,\theta_n\) when \(\theta_i | G \sim G\) and \(G \sim \text{DP}(\alpha, G_0)\) follows the CRP: given \(\theta_1,\ldots,\theta_{n-1}\), the next observation satisfies

\[
\theta_n | \theta_1,\ldots,\theta_{n-1} \sim \frac{\alpha}{\alpha + n - 1}G_0 + \frac{1}{\alpha + n - 1}\sum_{i=1}^{n-1}\delta_{\theta_i}.
\]

This induces a random partition of \(\{1,\ldots,n\}\) into clusters (tables), where the number of clusters grows as \(\alpha \log n\).

**DP Mixture Models:** The DP is used as a prior in mixture models:

\[
X_i | \theta_i \sim f(\cdot|\theta_i), \quad \theta_i | G \sim G, \quad G \sim \text{DP}(\alpha, G_0).
\]

This places a nonparametric prior on the number of mixture components, allowing the model to adapt to the complexity of the data.

## Section 8.3: High-Dimensional Bayesian Regression and Sparse Priors

In regression with \(p \gg n\), sparsity-inducing priors encode the belief that most coefficients are near zero.

**Spike-and-slab prior:** The canonical Bayesian variable selection prior is

\[
\beta_j | \gamma_j \sim (1 - \gamma_j)\delta_0 + \gamma_j N(0, \sigma_\beta^2), \quad \gamma_j | \pi_0 \overset{\text{iid}}{\sim} \text{Bernoulli}(\pi_0),
\]

where \(\gamma_j\) is a binary inclusion indicator. The posterior distribution over \(\gamma = (\gamma_1,\ldots,\gamma_p)\) assigns probability to each subset of variables.

**Horseshoe prior** (Carvalho, Polson, Scott, 2010): A global-local shrinkage prior

\[
\beta_j | \lambda_j, \tau \sim N(0, \lambda_j^2\tau^2), \quad \lambda_j \sim C^+(0,1), \quad \tau \sim C^+(0,1),
\]

where \(C^+(0,1)\) is the standard half-Cauchy. The horseshoe performs aggressive shrinkage of noise coefficients while preserving large signals, with minimax properties.

**LASSO as Laplace prior:** The Bayesian LASSO (Park and Casella, 2008) places independent Laplace (double-exponential) priors on coefficients:

\[
\pi(\beta_j|\lambda) = \frac{\lambda}{2}e^{-\lambda|\beta_j|}.
\]

The posterior mode under a Laplace prior with a Gaussian likelihood equals the LASSO estimate, establishing the connection between penalised likelihood and Bayesian MAP estimation.

## Section 8.4: Latent Variable Models

**Mixture models** from the Bayesian perspective: Introduce latent class assignments \(z_i \in \{1,\ldots,K\}\) with prior \(z_i | \pi \sim \text{Categorical}(\pi)\), \(\pi \sim \text{Dirichlet}(\alpha/K, \ldots, \alpha/K)\). Conditional on \(z_i = k\), \(X_i \sim f(\cdot|\theta_k)\). The posterior over \(z_i\) assigns each observation a probability of belonging to each cluster.

**Factor models:** For high-dimensional data \(X \in \mathbb{R}^p\), the factor model assumes

\[
X = \Lambda F + \epsilon, \quad F \sim N(0, I_q), \quad \epsilon \sim N(0, \Psi),
\]

where \(\Lambda\) is the \(p \times q\) loading matrix (\(q \ll p\)) and \(\Psi\) is diagonal. The Bayesian treatment places priors on \(\Lambda\) and \(\Psi\), with the latent factors \(F\) integrated out analytically or sampled by MCMC.

**Missing data (Rubin's framework):** In the Bayesian approach, missing data \(X_{\text{mis}}\) are treated as additional parameters. The posterior is

\[
\pi(\theta, X_{\text{mis}} | X_{\text{obs}}) \propto f(X_{\text{obs}}, X_{\text{mis}}|\theta)\,\pi(\theta),
\]

and multiple imputation draws from the posterior predictive \(p(X_{\text{mis}}|X_{\text{obs}})\) obtained by marginalising over \(\theta\).

# Chapter 9: Applications

## Section 9.1: Bayesian Clinical Trials

Bayesian methods are increasingly used in adaptive clinical trials, where accumulating data is used to modify the trial in progress.

**Posterior probability stopping rule:** In a Phase II trial, the drug is declared effective if

\[
P(\theta > \theta^* | \text{data}) > p_{\text{stop}},
\]

where \(\theta\) is the true response rate and \(\theta^*\) is the minimum clinically meaningful effect. With a Beta prior and Binomial likelihood, the posterior is Beta with closed form, and the stopping rule can be evaluated exactly at each interim analysis.

**Adaptive dose-finding:** The Continual Reassessment Method (CRM) models the dose-toxicity curve parametrically, updates the Bayesian posterior after each cohort, and assigns the next patient to the dose with posterior probability of toxicity closest to a target.

## Section 9.2: Bayesian Variable Selection in Genomics

In genome-wide association studies (GWAS) with \(p \sim 10^6\) single nucleotide polymorphisms (SNPs) and \(n \sim 10^4\) individuals, Bayesian variable selection methods offer principled multiplicity control.

The spike-and-slab model assigns prior inclusion probability \(\pi_0 \sim \text{Beta}(a, b)\) to each SNP, inducing adaptive multiplicity correction through the posterior distribution. The Bayesian FDR at threshold \(t\) is

\[
\text{BFDR}(t) = \frac{\sum_j P(\gamma_j = 0|x)\cdot\mathbf{1}(P(\gamma_j = 1|x) > t)}{\sum_j \mathbf{1}(P(\gamma_j = 1|x) > t)}.
\]

Computational efficiency is achieved via EM algorithms, variational Bayes, or stochastic search variable selection (SSVS).

## Section 9.3: Bayesian Spatial Models

The **Conditional Autoregressive (CAR) model** (Besag, 1974) is widely used for spatial data on areal units (e.g., disease mapping). Let \(\phi = (\phi_1,\ldots,\phi_m)\) be spatially structured random effects with

\[
\phi_i | \phi_{j \neq i} \sim N\!\left(\frac{\rho\sum_{j \sim i}\phi_j}{1 + \rho\sum_{j \sim i}1},\, \frac{\sigma^2}{1 + \rho\sum_{j \sim i}1}\right),
\]

where \(j \sim i\) denotes areal units sharing a boundary. The joint distribution is

\[
\phi \sim N(0, \sigma^2(D - \rho W)^{-1}),
\]

where \(D\) is diagonal with \(D_{ii} = \sum_j w_{ij}\) (degree matrix) and \(W\) is the adjacency matrix. The parameter \(\rho \in [0, 1/\lambda_{\max}]\) controls spatial correlation. The **intrinsic CAR** sets \(\rho = 1\), yielding an improper prior that is conditionally proper.

## Section 9.4: Bayesian Neural Networks

A **Bayesian neural network** (BNN) places a prior over network weights \(w\) and computes the posterior \(\pi(w|x_{\text{train}})\). Predictions are obtained by marginalisation:

\[
p(y^* | x^*, x_{\text{train}}) = \int p(y^*|x^*, w)\,\pi(w|x_{\text{train}})\,dw.
\]

This integral is intractable for deep networks. Approximate methods include:

- **Laplace approximation:** Fit network by MAP, then approximate the posterior by a Gaussian centered at the MAP with covariance given by the inverse Hessian.
- **Variational inference (mean-field):** Minimise ELBO over factored Gaussian approximations (\(\text{VI} = \text{Bayes by Backprop}\), Blundell et al., 2015).
- **Monte Carlo dropout:** Dropout at test time approximates a deep Gaussian process posterior.
- **Deep ensembles:** Multiple networks trained from different initialisations approximate the posterior predictive.

Bayesian neural networks provide principled uncertainty quantification — distinguishing epistemic uncertainty (reducible with more data) from aleatoric uncertainty (irreducible noise).

---

## Appendix A: Notation Summary

| Symbol | Meaning |
|---|---|
| \(\Theta\) | Parameter space |
| \(\theta\) | Parameter (random variable in Bayesian framework) |
| \(\pi(\theta)\) | Prior distribution |
| \(\pi(\theta \mid x)\) | Posterior distribution |
| \(f(x \mid \theta)\) | Likelihood (data generating density) |
| \(m(x)\) | Marginal likelihood (prior predictive) |
| \(I(\theta)\) | Fisher information |
| \(L(\theta, a)\) | Loss function |
| \(R(\theta, \delta)\) | Frequentist risk |
| \(r(\pi, \delta)\) | Bayes risk |
| \(B_{10}\) | Bayes factor for \(M_1\) vs. \(M_0\) |
| \(\hat\theta_{\text{MLE}}\) | Maximum likelihood estimator |
| \(\hat\theta_{\text{MAP}}\) | Maximum a posteriori estimator |
| \(K(p\|q)\) | Kullback-Leibler divergence from \(q\) to \(p\) |
| \(\text{DP}(\alpha, G_0)\) | Dirichlet process with concentration \(\alpha\), base \(G_0\) |

## Appendix B: Key Theorems at a Glance

1. **Bernstein–von Mises:** Posterior \(\approx N(\hat\theta_{\text{MLE}}, [nI(\theta_0)]^{-1})\) as \(n \to \infty\).
2. **Bayes estimators under squared error:** Posterior mean.
3. **Bayes estimators under absolute error:** Posterior median.
4. **MH stationarity:** Detailed balance implies \(\pi\) is stationary.
5. **Jeffreys prior invariance:** \(\pi_J \propto |I(\theta)|^{1/2}\) is invariant under reparametrisation.
6. **BIC approximation:** \(2\log B_{10} \approx \text{BIC}_0 - \text{BIC}_1\).
7. **de Finetti:** Exchangeable sequences are mixtures of i.i.d. sequences.
8. **Complete class:** Every admissible rule is Bayes (or a limit of Bayes rules).
9. **DP posterior:** \(\text{DP}(\alpha, G_0)\) updated by \(n\) observations gives \(\text{DP}(\alpha+n, \tilde G)\).
10. **Schwartz consistency:** Positive KL support implies posterior consistency.
