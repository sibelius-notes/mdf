---
title: "STAT 431: Generalized Linear Models and their Applications"
subjects: "STAT"
prof: "Leilei Zeng"
---

## Sources and References

**Primary notes** — Cameron Roopnarine (Hextical), STAT 431, https://hextical.github.io/university-notes/year-4/semester-1/STAT%20431/stat431.pdf
**Supplementary texts** — Dunn & Smyth (2018) *Generalized Linear Models with Examples in R*; McCullagh & Nelder (1989) *Generalized Linear Models* 2nd ed; Dobson & Barnett (2018) *An Introduction to Generalized Linear Models* 4th ed
**Online resources** — Hextical GitHub: https://github.com/Hextical/university-notes/tree/master; Woldford GLM course: https://sas.uwaterloo.ca/~rwoldfor/courses/GeneralizedLinearModels/2015/

# Chapter 1: Review of Linear Models and Likelihood

## The Normal Linear Model

Classical statistics rests on the normal linear model, which serves as the conceptual prototype for every generalized linear model developed in this course. The model fitting process has four stages: exploratory data analysis, model specification, parameter estimation, and inference. Understanding each stage deeply in the familiar normal setting makes the generalisation to GLMs feel natural rather than arbitrary.

The framework begins with \( n \) independent response variables \( Y_1, Y_2, \ldots, Y_n \) and for each subject \( i \) a vector of explanatory variables \( \mathbf{x}_i = (1, x_{i1}, \ldots, x_{ip})^\top \). The model postulates that each response is drawn from a normal distribution:

\[
Y_i \sim N(\mu_i, \sigma^2), \quad \text{independently,}
\]

where the mean \( \mu_i \) is a linear function of the covariates:

\[
E[Y_i] = \mu_i = \beta_0 + \beta_1 x_{i1} + \cdots + \beta_p x_{ip} = \mathbf{x}_i^\top \boldsymbol{\beta}.
\]

The errors \( \varepsilon_i = Y_i - \mu_i \) are independent and identically distributed as \( N(0, \sigma^2) \), so the full model in matrix form is \( \mathbf{Y} = \mathbf{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon} \) with \( \boldsymbol{\varepsilon} \sim \mathrm{MVN}(\mathbf{0}, \sigma^2 \mathbf{I}) \). The \( n \times (p+1) \) **design matrix** \( \mathbf{X} \) has rows \( \mathbf{x}_i^\top \).

**Dobson's birthweight example.** For \( n = 24 \) babies, the response \( Y_i \) is birthweight in grams, \( x_{i1} \) is sex (0 = female, 1 = male), and \( x_{i2} \) is gestational age in weeks. The main effects model \( Y_i = \beta_0 + \beta_1 x_{i1} + \beta_2 x_{i2} + \varepsilon_i \) fitted in R gives \( \hat\beta_1 = 163.04 \) g (95% CI: 11.60 to 314.48, \( p = 0.036 \)) and \( \hat\beta_2 = 120.89 \) g per week (\( p < 0.001 \)), with residual standard error 177.1 g on 21 degrees of freedom and \( R^2 = 0.64 \). The intercept (\( -1773 \) g) has no direct interpretation since gestational age zero is biologically impossible, but the interpretation of \( \beta_1 \) is the expected difference in birthweight between male and female babies at the same gestational age, and \( \beta_2 \) is the expected change per additional week of gestation, adjusted for sex.

## Estimation: Least Squares and Maximum Likelihood

The **least squares estimator** (LSE) minimises the residual sum of squares:

\[
S(\boldsymbol{\beta}) = \sum_{i=1}^n \left(y_i - \mathbf{x}_i^\top \boldsymbol{\beta}\right)^2 = (\mathbf{y} - \mathbf{X}\boldsymbol{\beta})^\top(\mathbf{y} - \mathbf{X}\boldsymbol{\beta}).
\]

Setting \( \partial S / \partial \boldsymbol{\beta} = \mathbf{0} \) yields the normal equations \( \mathbf{X}^\top \mathbf{X}\boldsymbol{\beta} = \mathbf{X}^\top \mathbf{y} \), whose unique solution (when \( \mathbf{X}^\top \mathbf{X} \) has full rank) is:

\[
\hat{\boldsymbol{\beta}} = (\mathbf{X}^\top \mathbf{X})^{-1} \mathbf{X}^\top \mathbf{Y}.
\]

Under the normality assumption, the log-likelihood for \( \boldsymbol{\beta} \) (treating \( \sigma^2 \) as fixed) is:

\[
\ell(\boldsymbol{\beta}; \mathbf{y}) = -\frac{n}{2}\log(2\pi\sigma^2) - \frac{1}{2\sigma^2}\sum_{i=1}^n \left(y_i - \mathbf{x}_i^\top \boldsymbol{\beta}\right)^2,
\]

which is maximised by the same \( \hat{\boldsymbol{\beta}} \). Thus the LSE and MLE of \( \boldsymbol{\beta} \) coincide in the normal linear model — a coincidence that does not hold for other GLM families.

The **fitted values** are \( \hat{\mathbf{Y}} = \mathbf{X}\hat{\boldsymbol{\beta}} = \mathbf{H}\mathbf{Y} \), where the **hat matrix** \( \mathbf{H} = \mathbf{X}(\mathbf{X}^\top \mathbf{X})^{-1}\mathbf{X}^\top \) is the orthogonal projection onto the column space of \( \mathbf{X} \). The diagonal entries \( h_{ii} \) are the **leverage values**, measuring how far observation \( i \) is from the centre of the predictor space. The **raw residuals** \( \hat{\mathbf{r}} = \mathbf{y} - \hat{\mathbf{y}} \) satisfy \( \mathbf{H}\hat{\mathbf{r}} = \mathbf{0} \), confirming orthogonality between residuals and fitted values. An unbiased estimate of \( \sigma^2 \) is:

\[
\hat\sigma^2 = \frac{1}{n - p - 1}\sum_{i=1}^n \hat r_i^2.
\]

The **standardized residuals** \( d_i = \hat r_i / [\hat\sigma\sqrt{1 - h_{ii}}] \) have approximate \( N(0,1) \) distribution and are used to detect outliers and assess model adequacy. Under the normal linear model, \( \hat{\boldsymbol{\beta}} \sim \mathrm{MVN}(\boldsymbol{\beta}, \sigma^2 (\mathbf{X}^\top \mathbf{X})^{-1}) \), and inference on individual \( \beta_j \) uses the \( t_{n-p-1} \) distribution.

## Model Checking

If the model provides a good fit, the standardized residuals should behave like independent \( N(0,1) \) random variables. Standard residual plots include: (1) standardized residuals versus fitted values, to check constant variance and linearity; (2) standardized residuals versus each explanatory variable, to detect systematic patterns; (3) a normal probability (QQ) plot to check normality; and (4) added variable plots. These diagnostics carry over to GLMs with appropriate modifications.

## Limitations of Linear Regression and Motivation for GLMs

Linear regression rests on assumptions that are routinely violated when the response is binary (\( Y \in \{0,1\} \)) or a count (\( Y \in \{0,1,2,\ldots\} \)). A probability must lie in \( [0,1] \); a count must be non-negative; and the variance of a Poisson or binomial response depends on the mean, violating the constant-variance assumption. Fitting a linear regression to binary data can yield predicted probabilities outside \( [0,1] \), which is theoretically incoherent. Generalized Linear Models address both problems by (a) allowing the response distribution to be any member of the exponential family, and (b) modelling a smooth transformation of the mean rather than the mean itself.

## Likelihood Methods for a Scalar Parameter

The likelihood framework underpins all inference for GLMs, so a thorough review is warranted. Let \( Y \) have density or mass function \( f(y \mid \theta) \) for an unknown scalar \( \theta \in \Omega \). Given data \( y \), the **likelihood function** is:

\[
L(\theta \mid y) = c \cdot f(y \mid \theta),
\]

where \( c > 0 \) is any positive constant free of \( \theta \). The likelihood is not a probability distribution over \( \theta \); it is a function that ranks how consistent different parameter values are with the observed data. The **MLE** \( \hat\theta \) is the value maximising \( L(\theta) \), or equivalently the log-likelihood \( \ell(\theta) = \log L(\theta) \).

Three related functions characterise the curvature and location of the log-likelihood:

<div class="definition">
<strong>Score function</strong>: \( S(\theta) = \ell'(\theta) \). The MLE solves \( S(\hat\theta) = 0 \). The score has mean zero: \( E[S(\theta)] = 0 \) — a fundamental identity obtained by differentiating \( \int f(y|\theta)\,dy = 1 \).
</div>

<div class="definition">
<strong>Observed information</strong>: \( I(\theta) = -\ell''(\theta) \). A positive value at \( \hat\theta \) confirms a maximum.
</div>

<div class="definition">
<strong>Expected (Fisher) information</strong>: \( \mathcal{I}(\theta) = E[I(\theta)] = \mathrm{Var}(S(\theta)) \). This equality — the second Bartlett identity — follows from differentiating the score identity a second time with respect to \( \theta \).
</div>

The Cramér–Rao lower bound states that any unbiased estimator of \( \theta \) has variance at least \( \mathcal{I}(\theta)^{-1} \), and the MLE achieves this bound asymptotically.

**Poisson MLE — worked example.** Let \( Y_1, \ldots, Y_n \overset{\mathrm{iid}}{\sim} \mathrm{Poisson}(\theta) \). The likelihood is \( L(\theta) = \theta^{\sum y_i} e^{-n\theta} / \prod y_i! \), giving log-likelihood:

\[
\ell(\theta) = \left(\sum_i y_i\right)\log\theta - n\theta - \sum_i \log(y_i!).
\]

Score: \( S(\theta) = \sum_i y_i / \theta - n \). Setting to zero: \( \hat\theta = \bar y \). Information: \( I(\theta) = \sum_i y_i / \theta^2 \), so \( I(\hat\theta) = n/\bar y > 0 \), confirming a maximum. For the **tropical cyclone dataset** — 13 successive seasons from 1956–57 to 1968–69 in Northeastern Australia with total 72 cyclones — \( \hat\theta = 72/13 \approx 5.538 \).

The **log relative likelihood** \( r(\theta) = \ell(\theta) - \ell(\hat\theta) = n\bar y \log(\theta/\bar y) - n(\theta - \bar y) \) has maximum 0 at \( \hat\theta \). The function \( -2r(\theta) \) traces a parabola-like shape, with values of \( \theta \) where \( -2r(\theta) < \chi^2_{(1)}(0.95) = 3.84 \) forming the 95% likelihood ratio confidence interval. For the cyclone data: LR 95% CI \( = (4.36, 6.92) \), Wald 95% CI \( = (4.26, 6.82) \).

## Asymptotic Inference: Three Paradigms

For large \( n \), all three statistics follow \( \chi^2_{(1)} \) under \( H_0: \theta = \theta_0 \):

| Method | Statistic | 95% CI |
|---|---|---|
| Likelihood ratio | \( -2[\ell(\theta_0) - \ell(\hat\theta)] \) | \( \{\theta: -2r(\theta) < 3.84\} \) |
| Score (Rao) | \( S(\theta_0)^2 / \mathcal{I}(\theta_0) \) | Invert score test |
| Wald | \( (\hat\theta - \theta_0)^2 \mathcal{I}(\hat\theta) \) | \( \hat\theta \pm 1.96\,\mathcal{I}(\hat\theta)^{-1/2} \) |

The LR interval is generally preferred: it is invariant to reparametrisation, typically has better coverage, and respects the natural shape of the likelihood. The Wald interval is always explicitly computable and coincides with the standard \( z \)-interval. The score test is most useful when the restricted model is easy to compute but the unrestricted one is not.

## Newton–Raphson and Fisher Scoring

When \( S(\theta) = 0 \) has no closed form, the MLE is found iteratively. A first-order Taylor expansion about the current estimate \( \theta^{(r)} \) gives:

\[
S(\theta) \approx S(\theta^{(r)}) - I(\theta^{(r)})(\theta - \theta^{(r)}),
\]

leading to the **Newton–Raphson update**:

\[
\theta^{(r+1)} = \theta^{(r)} + I^{-1}(\theta^{(r)}) S(\theta^{(r)}).
\]

**Fisher scoring** replaces the observed information \( I(\theta^{(r)}) \) with the expected information \( \mathcal{I}(\theta^{(r)}) \). The algorithms are identical under the canonical link (shown in Chapter 3). For vector parameters \( \boldsymbol{\theta} \), the update becomes \( \boldsymbol{\theta}^{(r+1)} = \boldsymbol{\theta}^{(r)} + \mathbf{I}^{-1}(\boldsymbol{\theta}^{(r)}) \mathbf{S}(\boldsymbol{\theta}^{(r)}) \), iterating until convergence. For the cyclone example starting at \( \theta^{(0)} = 5 \), the algorithm reaches \( \hat\theta = 5.538 \) in four steps.

## Likelihood for Vector Parameters

When \( \boldsymbol{\theta} = (\alpha^\top, \boldsymbol{\beta}^\top)^\top \) with \( \alpha \) a nuisance parameter and \( \boldsymbol{\beta} \) the parameter of interest, the **partitioned information matrix** is:

\[
\mathbf{I}(\boldsymbol{\theta}) = \begin{pmatrix} \mathbf{I}_{\alpha\alpha} & \mathbf{I}_{\alpha\beta} \\ \mathbf{I}_{\beta\alpha} & \mathbf{I}_{\beta\beta} \end{pmatrix}.
\]

The relevant block of the inverse information for \( \boldsymbol{\beta} \) is:

\[
\mathbf{I}^{\beta\beta} = \left(\mathbf{I}_{\beta\beta} - \mathbf{I}_{\beta\alpha}\mathbf{I}_{\alpha\alpha}^{-1}\mathbf{I}_{\alpha\beta}\right)^{-1},
\]

which is the **Schur complement**. The Wald statistic for testing \( H_0: \boldsymbol{\beta} = \boldsymbol{\beta}_0 \) is:

\[
W = (\hat{\boldsymbol{\beta}} - \boldsymbol{\beta}_0)^\top [\mathbf{I}^{\beta\beta}(\hat{\boldsymbol{\theta}})]^{-1} (\hat{\boldsymbol{\beta}} - \boldsymbol{\beta}_0) \overset{\text{approx}}{\sim} \chi^2_q.
\]

# Chapter 2: Exponential Dispersion Families

## Definition and Structure

The bridge from linear models to GLMs is the **exponential family**, which encompasses nearly every distribution encountered in statistical applications. Koopman, Darmois, and Pitman independently characterized this class in the 1930s, and Fisher's work on sufficient statistics showed that its special structure makes it uniquely suited to likelihood-based inference.

<div class="definition">
<strong>Exponential family</strong>: A random variable \( Y_i \) belongs to the <em>exponential family</em> if its density or mass function can be written:

\[
f(y_i \mid \theta_i, \phi) = \exp\!\left\{ \frac{y_i \theta_i - b(\theta_i)}{a_i(\phi)} + c(y_i; \phi) \right\}
\]
for specific functions \( a_i(\cdot) \), \( b(\cdot) \), and \( c(\cdot,\cdot) \). The parameter \( \theta_i \) is the <em>canonical parameter</em> and \( \phi \) is the <em>dispersion parameter</em> (assumed known for now).
</div>

The function \( b(\theta_i) \) is the **cumulant function** or log-partition function — the normalising term ensuring the density integrates to 1. Its derivatives encode the mean and variance, as shown below. The function \( a_i(\phi) \) is typically written \( a_i(\phi) = \phi/w_i \), where \( w_i \) is a known weight for observation \( i \).

## Mean, Variance, and Variance Function: The Fundamental Results

The mean and variance of an exponential family member follow from two general results, derived by differentiating the identity \( \int f(y \mid \theta, \phi)\,dy = 1 \) with respect to \( \theta \).

**Result 1:** \( E[S_i(\theta_i)] = 0 \). Differentiating once: \( \int f S_i \,dy = 0 \), so the score has zero expectation.

**Result 2:** \( \mathrm{Var}(S_i) = \mathcal{I}_i(\theta_i) \). Differentiating twice and using Result 1: \( E[S_i^2] = E[I_i] \).

Applying these to the exponential family (where \( S_i = (Y_i - b'(\theta_i))/a_i(\phi) \)) immediately gives:

<div class="definition">
<strong>Mean and variance for the exponential family</strong>:

\[
E[Y_i] = b'(\theta_i) = \mu_i, \qquad \mathrm{Var}(Y_i) = b''(\theta_i)\, a_i(\phi).
\]
The <em>variance function</em> is \( V(\mu_i) = b''(\theta_i) \), capturing the mean–variance relationship. When \( a_i(\phi) = \phi/w_i \), we write \( \mathrm{Var}(Y_i) = \phi\, V(\mu_i) / w_i \).
</div>

The variance function is the single most important concept distinguishing exponential family members from one another. It specifies how variability scales with the mean, and choosing the right GLM family amounts to choosing the right variance function for the data at hand.

## The Five Standard Distributions

**Normal distribution.** For \( Y \sim N(\mu, \sigma^2) \):

\[
f(y) = \exp\!\left\{ \frac{y\mu - \mu^2/2}{\sigma^2} - \frac{y^2}{2\sigma^2} - \frac{1}{2}\log(2\pi\sigma^2) \right\}.
\]

Canonical parameter \( \theta = \mu \), cumulant \( b(\theta) = \theta^2/2 \), dispersion \( a(\phi) = \sigma^2 \). Then \( b'(\theta) = \theta = \mu \) and \( V(\mu) = b''(\theta) = 1 \). The variance is constant, independent of the mean — the defining property of normal data.

**Poisson distribution.** For \( Y \sim \mathrm{Poisson}(\lambda) \), \( y = 0, 1, 2, \ldots \):

\[
f(y) = \frac{\lambda^y e^{-\lambda}}{y!} = \exp\!\left\{ y\log\lambda - \lambda - \log(y!) \right\}.
\]

Canonical parameter \( \theta = \log\lambda \), cumulant \( b(\theta) = e^\theta \). Then \( \mu = b'(\theta) = e^\theta = \lambda \) and \( V(\mu) = b''(\theta) = e^\theta = \mu \). **Variance equals mean** — the characteristic property of Poisson data. The canonical link is \( \log \).

**Binomial distribution.** For \( Y \sim \mathrm{Binomial}(m, \pi) \), \( y = 0, 1, \ldots, m \):

\[
f(y) = \binom{m}{y} \pi^y(1-\pi)^{m-y} = \exp\!\left\{ y\log\!\frac{\pi}{1-\pi} + m\log(1-\pi) + \log\binom{m}{y} \right\}.
\]

Canonical parameter \( \theta = \log[\pi/(1-\pi)] \) (the **logit**), cumulant \( b(\theta) = m\log(1 + e^\theta) \). Mean \( \mu = m\pi \) and \( V(\mu) = m\pi(1-\pi) = \mu(1 - \mu/m) \). The canonical link is the **logit link**.

**Gamma distribution.** For positive continuous data where variance grows with the square of the mean: \( V(\mu) = \mu^2 \). Canonical link is \( g(\mu) = 1/\mu \) (reciprocal), though the log link is far more commonly used due to interpretability.

**Inverse Gaussian distribution.** For strongly right-skewed positive data: \( V(\mu) = \mu^3 \). Canonical link is \( g(\mu) = 1/\mu^2 \). Arises in first-passage time models and actuarial science.

## The Canonical Link Function

For each exponential family member, the **canonical link** sets the linear predictor equal to the canonical parameter: \( g(\mu_i) = \theta_i = \mathbf{x}_i^\top \boldsymbol{\beta} \). This is the link obtained by expressing the canonical parameter as a function of the mean through \( \mu = b'(\theta) \), then inverting. Using the canonical link has two advantages: it makes the score equations sufficient statistics for \( \boldsymbol{\beta} \), and it ensures that observed and expected information matrices are equal (so Fisher scoring equals Newton–Raphson). However, scientific interpretability often outweighs these computational conveniences.

# Chapter 3: The GLM Framework

## Definition

The **Generalized Linear Model**, introduced by Nelder and Wedderburn in their landmark 1972 *JRSS* paper, unifies a rich collection of regression models under three components:

<div class="definition">
<strong>Generalized Linear Model (GLM)</strong>: A GLM has three components:
<ol>
<li><strong>Random component</strong>: The responses \( Y_1, \ldots, Y_n \) are independent, each with a distribution from the exponential family.</li>
<li><strong>Systematic component (linear predictor)</strong>: \( \eta_i = \mathbf{x}_i^\top \boldsymbol{\beta} \), a linear combination of covariates.</li>
<li><strong>Link function</strong>: A smooth monotone function \( g \) with \( g(\mu_i) = \eta_i \).</li>
</ol>
</div>

The normal linear model is the special case where the family is normal, the link is identity, and \( V(\mu) = 1 \). The separation of the distribution (random component) from the structural equation (link) is the key architectural insight: one can independently choose which exponential family captures the data-generating process and which transformation of the mean is linear in the predictors.

## Common Link Functions for Binomial Data

For the binomial family, the linear predictor must map to \( (0,1) \). Five link functions are used in practice:

| Link | Formula | Notes |
|---|---|---|
| Identity | \( g(\pi) = \pi \) | Requires constrained MLE; rarely used |
| Log-log | \( g(\pi) = \log(-\log \pi) \) | Skewed toward 1 |
| Complementary log-log | \( g(\pi) = \log(-\log(1-\pi)) \) | Asymmetric; extreme value model |
| Probit | \( g(\pi) = \Phi^{-1}(\pi) \) | Latent normal; standard in econometrics |
| Logit | \( g(\pi) = \log[\pi/(1-\pi)] \) | Canonical; log-odds interpretation |

The logit and probit links are nearly indistinguishable in the central range of probabilities (they differ by a scale factor of roughly 1.7) but diverge in the tails. The complementary log-log arises when the data are generated by an underlying extreme-value process, such as a time-to-event model with a Gompertz hazard.

## Fisher Scoring and IRLS: Full Derivation

Fitting a GLM requires maximising the log-likelihood over \( \boldsymbol{\beta} \). Because the log-likelihood is nonlinear in \( \boldsymbol{\beta} \) (unlike the normal linear model), iteration is necessary. The algorithm is **Iteratively Reweighted Least Squares (IRLS)**.

**The score vector.** The log-likelihood for a single exponential family observation is:

\[
\ell_i = \frac{y_i\theta_i - b(\theta_i)}{a_i(\phi)} + c(y_i;\phi).
\]

Applying the chain rule \( \partial\ell_i/\partial\beta_j = (\partial\ell_i/\partial\theta_i) \cdot (\partial\theta_i/\partial\mu_i) \cdot (\partial\mu_i/\partial\eta_i) \cdot (\partial\eta_i/\partial\beta_j) \):

\[
\frac{\partial\ell_i}{\partial\theta_i} = \frac{y_i - \mu_i}{a_i(\phi)}, \quad \frac{\partial\theta_i}{\partial\mu_i} = \frac{a_i(\phi)}{\mathrm{Var}(Y_i)}, \quad \frac{\partial\mu_i}{\partial\eta_i} = [g'(\mu_i)]^{-1}, \quad \frac{\partial\eta_i}{\partial\beta_j} = x_{ij}.
\]

Combining and summing over all \( n \) observations, the \( j \)-th score equation is:

\[
\left[\mathbf{S}(\boldsymbol{\beta})\right]_j = \sum_{i=1}^n \frac{(y_i - \mu_i)}{\mathrm{Var}(Y_i)} \cdot \frac{\partial\mu_i}{\partial\eta_i} \cdot x_{ij},
\]

or in matrix form \( \mathbf{S}(\boldsymbol{\beta}) = \mathbf{X}\mathbf{W}(\mathbf{y} - \boldsymbol{\mu}) \circ (\partial\boldsymbol{\eta}/\partial\boldsymbol{\mu}) \), where the **GLM weight** is:

\[
w_i = \frac{1}{\mathrm{Var}(Y_i)\left(\partial\eta_i/\partial\mu_i\right)^2}.
\]

**The expected information matrix.** Since \( E[y_i - \mu_i] = 0 \), the cross-term in \( E[-\partial^2\ell/\partial\beta_j\partial\beta_k] \) vanishes, leaving:

\[
[\mathbf{I}(\boldsymbol{\beta})]_{jk} = \sum_{i=1}^n x_{ij} w_i x_{ik} = [\mathbf{X}\mathbf{W}\mathbf{X}^\top]_{jk}.
\]

**The IRLS update.** The Fisher scoring step \( \boldsymbol{\beta}^{(r+1)} = \boldsymbol{\beta}^{(r)} + \mathbf{I}^{-1}(\boldsymbol{\beta}^{(r)})\mathbf{S}(\boldsymbol{\beta}^{(r)}) \) can be rewritten. Define the **working response**:

\[
z_i^{(r)} = \eta_i^{(r)} + (y_i - \mu_i^{(r)})\frac{\partial\eta_i}{\partial\mu_i}\bigg|^{(r)}.
\]

Then:

\[
\boldsymbol{\beta}^{(r+1)} = \left(\mathbf{X}\mathbf{W}^{(r)}\mathbf{X}^\top\right)^{-1} \mathbf{X}\mathbf{W}^{(r)}\mathbf{z}^{(r)},
\]

which is precisely the weighted least squares estimator of \( \boldsymbol{\beta} \) with response \( \mathbf{z}^{(r)} \) and weights \( \mathbf{W}^{(r)} \). At each iteration, one solves a standard weighted linear regression — hence the name IRLS. This insight is what makes GLM software efficient: every IRLS step reuses the linear algebra infrastructure of weighted least squares.

**Canonical link and NR.** Under the canonical link, \( \theta_i = \eta_i \), which forces \( w_i = 1/a_i(\phi) \) independently of the link. In this case, the term involving \( (y_i - \mu_i) \) in the observed information also vanishes, so the observed and expected information matrices are identical. Fisher scoring therefore reduces to Newton–Raphson under the canonical link.

**Poisson example (Problem 1.4).** For \( Y_i \sim \mathrm{Poisson}(\lambda_i) \) with log link \( \log\lambda_i = \mathbf{x}_i^\top \boldsymbol{\beta} \), the weight is \( w_i = \lambda_i \) (since \( V(\lambda_i) = \lambda_i \) and \( \partial\eta_i/\partial\mu_i = 1/\lambda_i \)). The score is \( S_j(\boldsymbol{\beta}) = \sum_i x_{ij}(y_i - \lambda_i) \) and the information matrix is \( \mathbf{I}(\boldsymbol{\beta}) = \mathbf{X}\,\mathrm{diag}(\lambda_1, \ldots, \lambda_n)\,\mathbf{X}^\top \). Since the Poisson log link is canonical, observed and expected information agree, and the largest weights \( \lambda_i \) are assigned to observations with the largest expected counts.

## Asymptotic Distribution of the MLE

Under standard regularity conditions (identifiability, correct specification, bounded third derivatives), the MLE satisfies:

\[
\hat{\boldsymbol{\beta}} \overset{\text{approx}}{\sim} \mathrm{MVN}\!\left(\boldsymbol{\beta},\, \mathbf{I}^{-1}(\boldsymbol{\beta})\right),
\]

with the information matrix evaluated at \( \hat{\boldsymbol{\beta}} \) in practice. Marginal distributions give Wald \( z \)-tests: \( z_j = \hat\beta_j / \widehat{\mathrm{se}}(\hat\beta_j) \overset{\text{approx}}{\sim} N(0,1) \), where \( \widehat{\mathrm{se}}(\hat\beta_j) = \sqrt{[\mathbf{I}^{-1}(\hat{\boldsymbol{\beta}})]_{jj}} \). These are the \( z \)-values reported by R's `summary(glm(...))`.

# Chapter 4: Inference for GLMs

## The Saturated Model and Deviance

To assess absolute fit, one compares the fitted model against the **saturated model**, which uses one parameter per observation and fits exactly: \( \tilde\mu_i = y_i \). The **deviance** is:

\[
D(\mathbf{y}; \hat{\boldsymbol{\mu}}) = 2\left[\ell(\tilde{\boldsymbol{\mu}}) - \ell(\hat{\boldsymbol{\mu}})\right] = 2\sum_{i=1}^n \left[\ell_i(y_i) - \ell_i(\hat\mu_i)\right].
\]

Under the null hypothesis that the \( p \)-dimensional model is correct, \( D \overset{\text{approx}}{\sim} \chi^2_{n-p} \) for large \( n \) (the approximation requires sufficient replication within cells; it is poor for ungrouped binary data with \( m_i = 1 \)).

**Binomial deviance.** The saturated log-likelihood is \( \tilde\ell_i = y_i\log(y_i/m_i) + (m_i-y_i)\log(1 - y_i/m_i) \). The deviance becomes:

\[
D = 2\sum_{i=1}^n \left[ y_i \log\!\frac{y_i}{m_i\hat\pi_i} + (m_i - y_i)\log\!\frac{m_i - y_i}{m_i(1-\hat\pi_i)} \right] = 2\sum_i \left[O_i\log\!\frac{O_i}{E_i}\right],
\]

where \( O_i \) and \( E_i \) denote observed and expected counts (in the two-cell sense). R reports this as `Residual deviance`.

**Poisson deviance.** With saturated \( \tilde\mu_i = y_i \):

\[
D = 2\sum_{i=1}^n \left[ y_i \log\!\frac{y_i}{\hat\mu_i} - (y_i - \hat\mu_i) \right].
\]

When the model includes an intercept, \( \sum_i y_i = \sum_i \hat\mu_i \) and the second term vanishes, yielding \( D = 2\sum_i O_i \log(O_i/E_i) \).

## Analysis of Deviance: Nested Model Tests

The most powerful use of deviance is comparing **nested models**. If model \( M_0 \) is nested within \( M_1 \) (differing by \( q \) parameters):

\[
\Delta D = D(M_0) - D(M_1) = 2\left[\ell(\hat{\boldsymbol{\mu}}_1) - \ell(\hat{\boldsymbol{\mu}}_0)\right] \overset{\text{approx}}{\sim} \chi^2_q \quad \text{under } H_0.
\]

This is the **likelihood ratio test (LRT)** for GLMs. The \( \chi^2 \) approximation for \( \Delta D \) is far better than for the individual deviances \( D(M_0) \) or \( D(M_1) \), because errors in the asymptotic approximation largely cancel.

**Prenatal care — logistic regression models.** Fitting four nested logistic regression models to the prenatal care data (\( n = 4 \) cells, response = fetal mortality):

| Model | Variables | Residual deviance | \( p \) | df |
|---|---|---|---|---|
| 3 | clinic + loc + clinic×loc | \( \approx 0 \) | 4 | 0 |
| 2 | clinic + loc | 0.107 | 3 | 1 |
| 1 | loc only | 10.814 | 2 | 2 |
| 4 | clinic only | 0.315 | 2 | 2 |

Testing whether level-of-care effect (loc) is needed given clinic: \( \Delta D = 0.315 - 0.107 = 0.208 \) on 1 df, \( p = 0.648 \). After adjusting for clinic, level of care is not significant — the confounding with clinic explains the apparent protective effect of intensive care seen in the marginal analysis. Testing whether the interaction clinic×loc is needed: \( \Delta D = 0.107 - 0 = 0.107 \) on 1 df, \( p = 0.74 \). No significant interaction.

**Neuroblastoma — analysis of deviance.** For 15 grouped binomial cells (binary 2-year survival, age and stage of disease):

| Model | Predictors | Residual deviance | Residual df |
|---|---|---|---|
| 1 | Age + Stage | 9.625 | 8 |
| 2 | Age only | 83.583 | 12 |
| 3 | Stage only | 42.446 | 10 |
| 4 | Intercept | 162.832 | 14 |

Is Stage important (given Age)? \( \Delta D = 83.583 - 9.625 = 73.958 \) on 4 df, \( p < 0.001 \). Is Age important (given Stage)? \( \Delta D = 42.446 - 9.625 = 32.821 \) on 2 df, \( p < 0.001 \). Is the fit of Model 1 adequate vs the saturated model? \( D_1 = 9.625 \) on 8 df, \( p = 0.292 \) — no significant lack of fit.

## Pearson Chi-Squared Statistic

The **Pearson chi-squared statistic** provides an alternative goodness-of-fit measure:

\[
X^2 = \sum_{i=1}^n \frac{(y_i - \hat\mu_i)^2}{V(\hat\mu_i)},
\]

where \( V(\hat\mu_i) \) is the estimated variance function value. Like \( D \), we have \( X^2 \overset{\text{approx}}{\sim} \chi^2_{n-p} \) under the null. The two statistics are not identical but agree well for large grouped data. For ungrouped binary data (\( m_i = 1 \)), both approximations are unreliable; in that case the Hosmer–Lemeshow test groups predictions into deciles and tests goodness of fit within groups.

## Wald and Score Tests

The **Wald test** for \( H_0: \boldsymbol{\beta}_B = \mathbf{0} \) (\( q \)-dimensional subvector) uses:

\[
W = \hat{\boldsymbol{\beta}}_B^\top \left[\mathbf{I}^{BB}(\hat{\boldsymbol{\beta}})\right]^{-1} \hat{\boldsymbol{\beta}}_B \overset{\text{approx}}{\sim} \chi^2_q,
\]

where \( \mathbf{I}^{BB} \) is the appropriate block of \( \mathbf{I}^{-1}(\hat{\boldsymbol{\beta}}) \). For a scalar \( \beta_k \), the Wald \( z \)-statistic \( z = \hat\beta_k / \widehat{\mathrm{se}}(\hat\beta_k) \) is reported in R's GLM summary. The **score test** evaluates the score at the restricted MLE \( \tilde{\boldsymbol{\beta}} \) (fitted under \( H_0 \)):

\[
U = \mathbf{S}^\top(\tilde{\boldsymbol{\beta}})\, \mathbf{I}^{-1}(\tilde{\boldsymbol{\beta}})\, \mathbf{S}(\tilde{\boldsymbol{\beta}}) \overset{\text{approx}}{\sim} \chi^2_q.
\]

All three tests (LRT, Wald, score) are asymptotically equivalent, but for moderate samples the LRT generally has the best finite-sample behaviour.

## Model Selection Criteria

When comparing non-nested models, penalised likelihood criteria are used:

\[
\mathrm{AIC} = -2\ell(\hat{\boldsymbol{\beta}}) + 2p, \qquad \mathrm{BIC} = -2\ell(\hat{\boldsymbol{\beta}}) + p\log n.
\]

AIC targets predictive accuracy; BIC targets model identification (the true model). BIC penalises complexity more severely for large \( n \), tending to select simpler models. For the neuroblastoma example, Model 1 (Age + Stage) has AIC 55.4, compared to AIC 84.2 for Stage only — confirming Model 1 as preferred.

# Chapter 5: Logistic Regression

## Odds, Odds Ratios, and the 2×2 Table

The simplest context for binary data is a \( 2 \times 2 \) table: two groups (\( k = 1, 2 \)) with \( Y_k \sim \mathrm{Binomial}(m_k, \pi_k) \) independently.

<div class="definition">
<strong>Odds</strong>: For probability \( \pi \), the odds is \( \pi/(1-\pi) \in [0,\infty) \). When \( \pi = 0.5 \), odds = 1; when \( \pi > 0.5 \), odds > 1.
</div>

<div class="definition">
<strong>Odds ratio (OR)</strong>: \( \psi = [\pi_1/(1-\pi_1)] \,/\, [\pi_2/(1-\pi_2)] \). Values: \( \psi = 1 \) (equal risk), \( \psi > 1 \) (higher odds in group 1), \( \psi < 1 \) (lower odds in group 1).
</div>

For rare events (\( \pi_1, \pi_2 \approx 0 \)), \( \psi \approx \pi_1/\pi_2 \) (relative risk), making OR a practical surrogate in case-control studies where relative risk cannot be directly estimated. Numerical examples: if \( \pi_1 = 0.10 \), \( \pi_2 = 0.05 \), then RR = 2.0 but OR = 2.11; if \( \pi_1 = 0.50 \), \( \pi_2 = 0.25 \), then RR = 2.0 but OR = 3.0. The two diverge substantially when probabilities are not small.

**Likelihood-based estimation.** Reparameterising with \( \theta_1 = \log\psi \) and \( \theta_2 = \log[\pi_2/(1-\pi_2)] \), solving the score equations gives:

\[
\hat\psi = \frac{y_1(m_2 - y_2)}{y_2(m_1 - y_1)}.
\]

The asymptotic variance of \( \log\hat\psi \) is:

\[
\widehat{\mathrm{Var}}(\log\hat\psi) = \frac{1}{y_1} + \frac{1}{m_1-y_1} + \frac{1}{y_2} + \frac{1}{m_2-y_2},
\]

the sum of four reciprocals corresponding to the four cells of the table. The Wald 95% CI for \( \psi \) is:

\[
\exp\!\left\{ \log\hat\psi \pm 1.96\sqrt{\frac{1}{y_1} + \frac{1}{m_1-y_1} + \frac{1}{y_2} + \frac{1}{m_2-y_2}} \right\}.
\]

**Prenatal care example (2×2 table).** Level of Care: Intensive (20 deaths, 316 survived, total 336) vs Regular (46 deaths, 373 survived, total 419).

\[
\log\hat\psi = \log\!\frac{20 \times 373}{46 \times 316} = -0.6671, \qquad \hat\psi = 0.513.
\]

\[
\widehat{\mathrm{Var}}(\log\hat\psi) = \frac{1}{20} + \frac{1}{316} + \frac{1}{46} + \frac{1}{373} = 0.0776.
\]

95% CI for \( \log\psi \): \( -0.667 \pm 1.96\sqrt{0.0776} = (-1.213, -0.121) \). 95% CI for \( \psi \): \( (0.297, 0.886) \). Intensive care appears strongly protective. However, stratifying by clinic reveals \( \hat\psi_A = 0.80 \), \( \hat\psi_B = 1.01 \), both compatible with no effect — a striking instance of **Simpson's paradox**. Clinic is a confounder: Clinic A (better outcomes overall) disproportionately received intensive-care patients. Multiple logistic regression resolves this.

## The Logistic Regression Model

For \( Y_i \sim \mathrm{Binomial}(m_i, \pi_i) \) with multiple covariates \( \mathbf{x}_i = (1, x_{i1}, \ldots, x_{i,p-1})^\top \):

\[
\mathrm{logit}(\pi_i) = \log\!\frac{\pi_i}{1 - \pi_i} = \mathbf{x}_i^\top \boldsymbol{\beta} = \beta_0 + \beta_1 x_{i1} + \cdots + \beta_{p-1} x_{i,p-1}.
\]

The logit is the canonical link for the binomial. The inverse — the **expit** (logistic) function — maps back to probability:

\[
\pi_i = \frac{e^{\eta_i}}{1 + e^{\eta_i}} = \mathrm{expit}(\eta_i).
\]

**Interpretation of coefficients.** For a binary predictor \( x_j \in \{0,1\} \):

\[
\beta_j = \log\!\frac{\pi(x_j=1)/(1-\pi(x_j=1))}{\pi(x_j=0)/(1-\pi(x_j=0))} = \log\psi_j,
\]

so \( e^{\beta_j} \) is the **odds ratio** comparing \( x_j = 1 \) to \( x_j = 0 \), adjusted for all other covariates. For a continuous predictor, \( e^{\beta_j} \) is the odds ratio per unit increase in \( x_j \).

**Prenatal care — four logistic regression models.** The four models for the prenatal care data, with explanatory variables \( x_1 = I(\text{Clinic A}) \) and \( x_2 = I(\text{Intensive care}) \), give the following key estimates:

| Model | Formula | Key estimate |
|---|---|---|
| 1 (loc only) | \( \beta_0 + \beta_2 x_2 \) | \( e^{\hat\beta_2} = 0.513 \) (OR, marginal) |
| 2 (main effects) | \( \beta_0 + \beta_1 x_1 + \beta_2 x_2 \) | \( e^{\hat\beta_2} = 0.860 \) (OR, adjusted for clinic) |
| 3 (interaction) | \( \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \beta_3 x_1 x_2 \) | \( e^{\hat\beta_2 + \hat\beta_3} = 0.80 \) (Clinic A), \( e^{\hat\beta_2} = 1.01 \) (Clinic B) |
| 4 (clinic only) | \( \beta_0 + \beta_1 x_1 \) | \( e^{\hat\beta_1} = 0.35 \) (Clinic A vs B) |

Model 2 (main effects) is selected as the final model for scientific reasons — the primary question concerns level-of-care effect adjusted for clinic. Its AIC = 23.3, residual deviance = 0.107 on 1 df (\( p = 0.74 \)), indicating an adequate fit. The OR for intensive vs regular care, adjusted for clinic, is \( e^{-0.150} = 0.860 \), 95% CI \( (0.450, 1.643) \) — not significant (\( p = 0.649 \)).

## Deviance Residuals for Binomial Data

The total deviance decomposes as \( D = \sum_{i=1}^n d_i \). The **deviance residuals** are:

\[
r_i^D = \mathrm{sign}(y_i - m_i\hat\pi_i)\sqrt{d_i},
\]

where \( d_i \) is the \( i \)-th contribution to the deviance. Under the adequately fitting model, \( r_i^D \overset{\text{approx}}{\sim} N(0,1) \). Plotting deviance residuals against fitted values \( \hat\pi_i \) or against explanatory variables reveals systematic misfit.

The **Pearson residuals** are:

\[
r_i^P = \frac{y_i - m_i\hat\pi_i}{\sqrt{m_i\hat\pi_i(1-\hat\pi_i)}}.
\]

Both types are used in practice; deviance residuals are slightly preferred because they have a distribution closer to \( N(0,1) \) for skewed data.

**Neuroblastoma example.** For Model 1 (Age + Stage) fitted to 15 grouped cells, the deviance residuals range from −1.474 to 1.521, all within \( \pm 2 \). The residual plot shows no systematic patterns. The analysis of deviance confirms that both age and stage are highly significant predictors, and the OR for Stage IV vs Stage I (controlling for age) is \( e^{-4.368} = 0.013 \) (95% CI: 0.003 to 0.060), an extremely strong effect.

## Confidence Intervals for Nonlinear Functions

The delta method extends confidence intervals to nonlinear functions of \( \boldsymbol{\beta} \). Since \( \hat{\boldsymbol{\beta}} \approx \mathrm{MVN}(\boldsymbol{\beta}, \mathbf{I}^{-1}(\hat{\boldsymbol{\beta}})) \), any linear combination \( \mathbf{c}^\top \boldsymbol{\beta} \) has approximate distribution:

\[
\mathbf{c}^\top \hat{\boldsymbol{\beta}} \sim N\!\left(\mathbf{c}^\top\boldsymbol{\beta},\; \mathbf{c}^\top \mathbf{I}^{-1}(\hat{\boldsymbol{\beta}})\mathbf{c}\right).
\]

A 95% CI for \( e^{\mathbf{c}^\top\boldsymbol{\beta}} \) is:

\[
\exp\!\left\{ \mathbf{c}^\top\hat{\boldsymbol{\beta}} \pm 1.96\sqrt{\mathbf{c}^\top \mathbf{I}^{-1}(\hat{\boldsymbol{\beta}})\mathbf{c}} \right\}.
\]

For the neuroblastoma example, the OR comparing age 24+ to age 12–23 (controlling for stage) is \( e^{\beta_2 - \beta_1} \), so \( \mathbf{c} = (0,-1,1,0,0,0,0)^\top \). One needs \( \mathrm{Var}(\hat\beta_2 - \hat\beta_1) = \mathrm{Var}(\hat\beta_2) + \mathrm{Var}(\hat\beta_1) - 2\mathrm{Cov}(\hat\beta_1,\hat\beta_2) \), obtainable from `summary(model1)$cov.unscaled`. The estimated OR is \( e^{-2.613 - (-2.118)} = 0.61 \).

For predicted probabilities: a 95% CI for \( \pi_0 = \mathrm{expit}(\mathbf{x}_0^\top\boldsymbol{\beta}) \) at a new covariate vector \( \mathbf{x}_0 \) is obtained by constructing a CI for \( \eta_0 = \mathbf{x}_0^\top\boldsymbol{\beta} \) and then applying expit to both endpoints.

# Chapter 6: Poisson Regression and Log-Linear Models

## Setting Up a Poisson GLM

Count data — the number of events in a fixed period or region — are naturally modelled by the Poisson distribution. Poisson regression with the canonical log link specifies:

\[
Y_i \sim \mathrm{Poisson}(\mu_i), \quad \log\mu_i = \mathbf{x}_i^\top \boldsymbol{\beta}.
\]

The log link ensures \( \hat\mu_i > 0 \) always. The model parameters have **log rate ratio** interpretations: \( e^{\beta_j} \) is the multiplicative change in the expected count per unit increase in \( x_j \), holding all other covariates fixed.

**Score and information.** The score for \( \beta_j \) is \( \partial\ell/\partial\beta_j = \sum_i x_{ij}(y_i - \mu_i) \), and the information matrix is \( \mathbf{I}(\boldsymbol{\beta}) = \mathbf{X}\,\mathrm{diag}(\mu_1, \ldots, \mu_n)\,\mathbf{X}^\top \). The MLE satisfies \( \sum_i x_{ij}y_i = \sum_i x_{ij}\hat\mu_i \) for each \( j \) — a generalised balance condition analogous to the normal equations. In R, Poisson regression is fitted with `glm(..., family = poisson(link = log))`.

**Wald tests for Poisson regression.** For \( H_0: \beta_k = \beta_{k0} \) vs \( H_A: \beta_k \neq \beta_{k0} \):

\[
z = \frac{\hat\beta_k - \beta_{k0}}{\widehat{\mathrm{se}}(\hat\beta_k)} \overset{\text{approx}}{\sim} N(0,1).
\]

The summary output from R's `glm()` reports these statistics directly.

## Offset Terms for Rate Data

When \( Y_i \) counts events in an exposure period \( t_i \) (person-years, area, population at risk), the appropriate model is for the **rate** \( \lambda_i = \mu_i/t_i \):

\[
\log\mu_i = \log t_i + \mathbf{x}_i^\top \boldsymbol{\beta}.
\]

The term \( \log t_i \) is an **offset** — a known covariate with coefficient fixed at 1. In R: `glm(y ~ x + offset(log(t)), family = poisson)`. The regression coefficients describe effects on the log rate; \( e^{\beta_j} \) is now a **rate ratio**.

## Ship Damage Example

The McCullagh–Nelder ship damage dataset records 40 incident counts for cargo ships classified by type (5 levels), period of construction (4 levels), and period of operation (2 levels), with months of service as offset. The main effects model:

\[
\log\mu_i = \log t_i + \beta_0 + \sum_j \alpha_j^{\text{type}} + \sum_k \gamma_k^{\text{con}} + \sum_l \delta_l^{\text{op}},
\]

is fitted and compared to models including interactions. An analysis of deviance table guides model selection. For this dataset, the interaction between construction period and operation period is significant (\( \Delta D \) large on limited df), while other interactions are not needed. The selected model gives log rate ratio estimates for each ship type, construction era, and operation period, interpretable as multiplicative effects on the incident rate per aggregate month of service.

## Log-Linear Models for Contingency Tables

One of the most important applications of Poisson regression is modelling **contingency table cell counts**. The connection is: if counts \( Y_{ij} \) are Poisson-distributed with means \( \mu_{ij} \) depending on row and column factors, then the Poisson log-linear model is identical to the multinomial log-linear model conditional on the total count.

**Two-way \( I \times J \) table.** The saturated log-linear model:

\[
\log\mu_{ij} = u + u_i^V + u_j^W + u_{ij}^{VW},
\]

has \( I \cdot J \) parameters (one per cell). The **independence model** drops the interaction:

\[
\log\mu_{ij} = u + u_i^V + u_j^W.
\]

The MLEs under independence are \( \hat\mu_{ij} = y_{i\cdot}y_{\cdot j}/y_{\cdot\cdot} \) (expected cell counts). The deviance:

\[
D = 2\sum_{ij} O_{ij}\log\!\frac{O_{ij}}{E_{ij}} \overset{\text{approx}}{\sim} \chi^2_{(I-1)(J-1)},
\]

is the standard log-likelihood chi-square test for independence.

**Multinomial likelihood and independence.** Fixing the total count \( y_{\cdot\cdot} \), cell counts follow a multinomial distribution with probabilities \( \pi_{ij} \). Testing independence (\( H_0: \pi_{ij} = \pi_{i\cdot}\pi_{\cdot j} \)) yields exactly the same deviance statistic, with MLEs \( \hat\pi_{i\cdot} = y_{i\cdot}/y_{\cdot\cdot} \) and \( \hat\pi_{\cdot j} = y_{\cdot j}/y_{\cdot\cdot} \).

**Log-linear vs logistic regression.** In a two-way table with the column variable as the "response" and the row variable as the "predictor", the log-linear independence model is equivalent to a logistic regression with no predictor (intercept only). Adding the row-column interaction to the log-linear model corresponds to adding the row predictor to the logistic regression, and the interaction parameter has a log odds ratio interpretation.

## Three-Way Tables and Hierarchical Models

For a three-way \( I \times J \times K \) table, the saturated log-linear model includes all main effects, two-way interactions, and the three-way interaction:

\[
\log\mu_{ijk} = u + u_i^V + u_j^W + u_k^Z + u_{ij}^{VW} + u_{ik}^{VZ} + u_{jk}^{WZ} + u_{ijk}^{VWZ}.
\]

**Hierarchical models** require: whenever an interaction is in the model, all lower-order relatives of those variables must also be present. Models are described by their highest-order terms (generators):

| Model | Generator notation | Parameters | Interpretation |
|---|---|---|---|
| Saturated | \( (VWZ) \) | Full | All interactions |
| Homogeneous association | \( (VW, VZ, WZ) \) | — | All pairs associated; three-way absent |
| Conditional independence V,W | \( (VW, VZ) \) | — | V,W assoc; W,Z assoc; V indep Z \|W |
| Mutual independence | \( (V, W, Z) \) | — | All pairs independent |

**Accidents example.** Three-way table: seatbelt use (\( V \)), ejection status (\( W \)), and injury severity (\( Z \)) for a large sample of car accidents. Model comparison:

| Model | Form | Residual deviance | df | \( p \) vs Model 2 |
|---|---|---|---|---|
| 1 (saturated) | \( (VWZ) \) | 0 | 0 | — |
| 2 | \( (VW, VZ, WZ) \) | 2.85 | 1 | 0.09 (vs 1) |
| 3 | \( (VW, VZ) \) | 1680.4 | 2 | \( <0.001 \) |
| 4 | \( (VW, WZ) \) | 1144.6 | 2 | \( <0.001 \) |
| 5 | \( (VZ, WZ) \) | 7134.0 | 2 | \( <0.001 \) |

Model 2 is the most parsimonious adequate fit: all three variables are pairwise associated, but the three-way interaction is negligible. The interpretation is **homogeneous association**: the odds ratio between any two variables (e.g., ejection and injury severity) is the same at both levels of the third variable (seatbelt use). Parameters in this model have log **conditional odds ratio** interpretations, not log rate ratio interpretations.

**Skin cancer and rat tumour examples.** The Poisson log-linear model also applies to analysis of time-inhomogeneous Poisson processes. In the rat tumour example, the rate of tumour incidence is modelled as a function of dose and time, with the log link and a time offset. Deviance tests compare dose-response models of varying complexity.

# Chapter 7: Overdispersion and Quasi-Likelihood

## Diagnosing Overdispersion

The Poisson model assumes \( \mathrm{Var}(Y_i) = \mu_i \) and the binomial assumes \( \mathrm{Var}(Y_i) = m_i\pi_i(1-\pi_i) \). In practice, the observed variance often exceeds these theoretical values — **overdispersion**. The key diagnostic is the **scaled Pearson statistic**:

\[
\hat\phi = \frac{X^2}{n - p} = \frac{\sum_i (y_i - \hat\mu_i)^2 / V(\hat\mu_i)}{n - p}.
\]

Values substantially exceeding 1 indicate overdispersion; values near 1 suggest the standard model is appropriate; values below 1 (**underdispersion**) are rare but possible with inhibitory processes.

**Sources of overdispersion:** (i) omitted heterogeneity — important covariates are missing, creating extra variation among nominally identical observations; (ii) clustering — binary or count outcomes for individuals within groups are positively correlated; (iii) wrong link function or misspecified systematic component; (iv) excess zeros beyond what the Poisson or binomial predicts.

## The Ad Hoc Quasi-Poisson and Quasi-Binomial Approach

The simplest correction is to multiply all standard errors by \( \hat\phi^{1/2} \), where \( \hat\phi \) is estimated from the Pearson statistic. In R, `family = quasipoisson` and `family = quasibinomial` implement this automatically. When \( \hat\phi > 1 \), confidence intervals widen and \( z \)-tests become more conservative. Deviance-based LRTs are replaced by quasi-\( F \) tests:

\[
F = \frac{\Delta D / q}{\hat\phi} \sim F_{q, n-p}.
\]

**Epilepsy trial example.** An epilepsy clinical trial records seizure counts for each patient over successive observation periods, with treatment and baseline factors as covariates. The Poisson model gives \( \hat\phi = X^2/(n-p) \approx 12.1 \), indicating severe overdispersion — variance about 12 times the Poisson mean. Refitting with `quasipoisson` inflates all standard errors by \( \hat\phi^{1/2} \approx 3.5 \), substantially widening confidence intervals and reducing the apparent significance of treatment effects.

## Mixed Models: The Negative Binomial

A parametric approach posits a random effect \( U_i \sim \mathrm{Gamma}(1/k, k) \) (mean 1, variance \( k \)) acting multiplicatively on the Poisson mean: \( Y_i \mid U_i \sim \mathrm{Poisson}(\mu_i U_i) \). Marginalising over \( U_i \):

\[
Y_i \sim \mathrm{NegativeBinomial}(\mu_i, k), \qquad \mathrm{Var}(Y_i) = \mu_i(1 + k\mu_i).
\]

The variance function is \( V(\mu) = \mu + k\mu^2 \), which is the Poisson variance plus a quadratic overdispersion term. As \( k \to 0 \), the model converges to Poisson. The parameter \( k \) is estimated by maximum likelihood jointly with \( \boldsymbol{\beta} \). In R, `MASS::glm.nb()` fits the negative binomial GLM.

## Clustered Binomial Data

Overdispersion in grouped binary data typically arises from within-group correlation. The **beta-binomial** model places a Beta prior on \( \pi_i \): given \( \Pi_i \sim \mathrm{Beta}(\alpha, \beta) \), \( Y_i \mid \Pi_i \sim \mathrm{Binomial}(m_i, \Pi_i) \). The marginal moments are:

\[
E[Y_i] = m_i\mu, \quad \mathrm{Var}(Y_i) = m_i\mu(1-\mu)\left[1 + (m_i-1)\rho\right],
\]

where \( \mu = \alpha/(\alpha+\beta) \) is the mean probability and \( \rho = 1/(\alpha+\beta+1) \) is the **intraclass correlation coefficient**. The variance inflation factor \( 1 + (m_i-1)\rho \) grows with cluster size \( m_i \) and correlation \( \rho \). 

**Pacific cod example.** The proportion of Pacific cod schools exhibiting a foraging behaviour is modelled as quasi-binomial. The estimated \( \hat\phi = 3.2 \) indicates that the binomial variance is substantially underestimated, and all standard errors are inflated by \( \sqrt{3.2} \approx 1.79 \).

## Quasi-Likelihood Theory

Wedderburn (1974) showed that specifying only the mean function \( \mu(\boldsymbol{\beta}) \) and the variance function \( V(\mu) \phi \) is sufficient to define consistent estimating equations. The **quasi-score** is:

\[
\mathbf{Q}(\boldsymbol{\beta}) = \sum_{i=1}^n \frac{(y_i - \mu_i)}{\phi V(\mu_i)} \cdot \frac{\partial\mu_i}{\partial\boldsymbol{\beta}} = \mathbf{0}.
\]

The solution \( \hat{\boldsymbol{\beta}} \) is the **quasi-MLE**, consistent and asymptotically normal with variance \( \phi(\mathbf{X}\mathbf{W}\mathbf{X}^\top)^{-1} \) regardless of the true distribution (as long as the mean function and variance function are correctly specified). This semi-parametric approach is particularly valuable when the exact distribution is unknown but the mean–variance relationship can be specified.

The **sandwich (robust) variance estimator** relaxes even the mean–variance specification:

\[
\widehat{\mathrm{Var}}(\hat{\boldsymbol{\beta}}) = (\mathbf{X}\mathbf{W}\mathbf{X}^\top)^{-1} \left[\sum_i \mathbf{x}_i \hat r_i^2 w_i^2 \mathbf{x}_i^\top\right] (\mathbf{X}\mathbf{W}\mathbf{X}^\top)^{-1},
\]

where \( \hat r_i = (y_i - \hat\mu_i)/V(\hat\mu_i)^{1/2} \) are the Pearson residuals. The sandwich estimator is consistent even when the variance function is misspecified, though it requires large samples to be reliable.

# Chapter 8: Model Diagnostics for GLMs

## Types of Residuals

In linear regression, raw residuals \( r_i = y_i - \hat y_i \) are the natural measure of model misfit. For GLMs, responses have non-constant variance and asymmetric distributions, making raw residuals less interpretable. Several standardised residual types are used:

<div class="definition">
<strong>Pearson residuals</strong>:

\[
r_i^P = \frac{y_i - \hat\mu_i}{\sqrt{V(\hat\mu_i)\hat\phi}},
\]
scaled by the estimated standard deviation. They measure departure in units of the standard deviation and sum of squares gives \( X^2 \).
</div>

<div class="definition">
<strong>Deviance residuals</strong>:

\[
r_i^D = \mathrm{sign}(y_i - \hat\mu_i)\sqrt{d_i},
\]
where \( d_i \) is the \( i \)-th deviance contribution. Deviance residuals have a distribution closer to \( N(0,1) \) for skewed families.
</div>

<div class="definition">
<strong>Standardized residuals</strong>: Either \( r_i^P \) or \( r_i^D \) divided by \( \sqrt{1 - h_{ii}} \), where \( h_{ii} \) is the diagonal of the <em>GLM hat matrix</em> \( \mathbf{H} = \mathbf{W}^{1/2}\mathbf{X}(\mathbf{X}^\top\mathbf{W}\mathbf{X})^{-1}\mathbf{X}^\top\mathbf{W}^{1/2} \).
</div>

<div class="definition">
<strong>Working residuals</strong>:

\[
r_i^W = (y_i - \hat\mu_i)\frac{\partial\eta_i}{\partial\mu_i},
\]
the residuals from the weighted linear regression solved at each IRLS step. They equal the difference between the working response \( z_i \) and the fitted linear predictor \( \hat\eta_i \).
</div>

The leverage values \( h_{ii} \in [0,1] \) measure the influence of observation \( i \) on its own fitted value. Observations with high leverage have extreme covariate patterns and deserve special attention. The trace of \( \mathbf{H} \) equals \( p \) (the number of parameters).

## Diagnostic Plots

Standard diagnostic plots for a GLM are:

1. **Residuals vs fitted values:** Plot \( r_i^D \) (or \( r_i^P \)) against \( \hat\eta_i \) or \( \hat\mu_i \). Under the adequately fitting model, this should show a random scatter with no trend or funnel shape. Systematic curvature suggests a wrong link function; a funnel suggests overdispersion.

2. **Residuals vs each covariate:** Plots \( r_i^D \) against each \( x_{ij} \). Nonlinear trends indicate that the predictor should be transformed or a polynomial term added.

3. **Normal QQ plot of residuals:** Checks whether the residuals have approximately normal marginal distributions. Heavy tails suggest outliers or model misspecification.

4. **Scale-location plot:** Plot of \( \sqrt{|r_i^D|} \) against \( \hat\eta_i \), checking variance homogeneity.

For the neuroblastoma example, the residual plot (deviance residuals vs fitted probabilities \( \hat\pi_i \)) shows all residuals within \( \pm 2 \), with no systematic pattern — consistent with an adequate fit.

## Influence Diagnostics

An observation is **influential** if its removal substantially changes the parameter estimates. **Cook's distance** for GLMs:

\[
D_i \approx \frac{h_{ii} (r_i^{S})^2}{p(1 - h_{ii})},
\]

where \( r_i^S \) is the standardised deviance (or Pearson) residual. Large \( D_i \) flags both high leverage (\( h_{ii} \)) and large residual — either alone is insufficient to be influential. Observations with \( D_i > 1 \) (or \( D_i > 4/n \) by a more sensitive threshold) warrant investigation.

**Dfbetas** measure the change in each individual coefficient when observation \( i \) is removed: \( \mathrm{DFBETA}_{ij} = (\hat\beta_j - \hat\beta_{j(-i)})/\widehat{\mathrm{se}}(\hat\beta_j) \). Large values identify which predictor's estimate is most affected by each influential point.

## Checking the Link Function and Component-Plus-Residual Plots

The **component-plus-residual plot** (partial residual plot) assesses linearity of the relationship between predictor \( x_j \) and the linear predictor. The partial residuals are:

\[
r_i^{(j)} = r_i^W + \hat\beta_j x_{ij},
\]

the sum of working residuals and the fitted linear component for predictor \( j \). Plotting \( r_i^{(j)} \) against \( x_{ij} \) reveals whether the relationship is truly linear. A smooth curve through the plotted points that departs from the fitted line \( \hat\beta_j x_{ij} \) suggests a transformation is needed. In R, `car::crPlots()` produces these for any GLM.

## Added Variable Plots

An **added variable plot** for predictor \( x_j \) plots the residuals from regressing the working response on all covariates except \( x_j \) against the residuals from regressing \( x_j \) on all other covariates. The slope of the resulting scatterplot equals \( \hat\beta_j \). Influential observations in this plot are those most responsible for the estimate of \( \beta_j \) specifically, making it useful for identifying which observations drive questionable coefficient estimates.

# Chapter 9: Extensions of the GLM Framework

## Ordered Logistic Regression: Proportional Odds Model

When the response has \( J \geq 3 \) **ordered** categories, the **proportional odds model** (McCullagh 1980) extends binary logistic regression. Define cumulative probabilities \( \gamma_{ij} = P(Y_i \leq j) \) for \( j = 1, \ldots, J-1 \). The model:

\[
\mathrm{logit}(P(Y_i \leq j)) = \alpha_j - \mathbf{x}_i^\top \boldsymbol{\beta}, \quad j = 1, \ldots, J-1,
\]

uses a single coefficient vector \( \boldsymbol{\beta} \) common to all \( J-1 \) cumulative logit equations, with ordered cutpoints \( \alpha_1 < \alpha_2 < \cdots < \alpha_{J-1} \). The convention of subtracting \( \mathbf{x}_i^\top\boldsymbol{\beta} \) ensures that positive \( \beta_j \) corresponds to stochastically larger outcomes.

The **proportional odds assumption** states that the log odds ratio for \( Y_i \leq j \) vs \( Y_i > j \) is the same for every threshold \( j \) — i.e., the effect of \( \mathbf{x}_i \) "shifts" the entire response distribution uniformly. This can be tested by comparing the proportional odds model to a general model with threshold-specific \( \boldsymbol{\beta}_j \); the likelihood ratio test statistic is \( \chi^2_{(J-2)(p-1)} \) under the null.

Cell probabilities are recovered as:

\[
P(Y_i = j) = \mathrm{expit}(\alpha_j - \mathbf{x}_i^\top\boldsymbol{\beta}) - \mathrm{expit}(\alpha_{j-1} - \mathbf{x}_i^\top\boldsymbol{\beta}).
\]

The model is fitted by maximum likelihood in R via `MASS::polr()`.

## Multinomial Logistic Regression

For unordered categorical responses with \( J \geq 3 \) categories, the **multinomial logistic regression model** generalises binary logistic regression. With category \( J \) as reference:

\[
\log\!\frac{P(Y_i = j)}{P(Y_i = J)} = \mathbf{x}_i^\top \boldsymbol{\beta}_j, \quad j = 1, \ldots, J-1.
\]

Category probabilities must sum to 1:

\[
P(Y_i = j) = \frac{e^{\mathbf{x}_i^\top\boldsymbol{\beta}_j}}{1 + \sum_{k=1}^{J-1} e^{\mathbf{x}_i^\top\boldsymbol{\beta}_k}}, \quad P(Y_i = J) = \frac{1}{1 + \sum_{k=1}^{J-1} e^{\mathbf{x}_i^\top\boldsymbol{\beta}_k}}.
\]

There are \( (J-1)(p) \) free parameters. The coefficients \( \boldsymbol{\beta}_j \) are category-specific; \( e^{\beta_{jk}} \) is the odds ratio for category \( j \) vs \( J \) per unit increase in \( x_k \).

The **Poisson trick** (Palmgren 1981): the multinomial logistic regression model can be recast as a Poisson log-linear model by including subject-specific intercepts (one per individual). This connection enables multinomial models to be fitted using Poisson GLM software and clarifies why contingency table log-linear models and multinomial logistic regression are so closely related.

## Gamma and Inverse Gaussian Regression

For continuous positive responses, the **Gamma GLM** models right-skewed data where variance grows proportionally with the square of the mean. With log link:

\[
\log\mu_i = \mathbf{x}_i^\top\boldsymbol{\beta}, \quad \mathrm{Var}(Y_i) = \mu_i^2/k,
\]

where the shape parameter \( k \) is constant across observations. The coefficients have multiplicative interpretations on the mean: a one-unit increase in \( x_j \) multiplies the expected response by \( e^{\beta_j} \). Applications include insurance claims, survival times (Weibull and log-normal are special cases), and reaction times in psychology.

The **Inverse Gaussian GLM** has \( V(\mu) = \mu^3 \) and arises in first-passage time models where variability grows even more rapidly with the mean. The canonical link \( g(\mu) = 1/\mu^2 \) is rarely used; the log link is preferred for interpretability. Both models are fitted by IRLS with the appropriate family.

## Zero-Inflated Models

Count data sometimes contain far more zeros than predicted by the Poisson or negative binomial — a phenomenon called **zero inflation**. The **Zero-Inflated Poisson (ZIP)** mixes a point mass at zero with a Poisson component:

\[
P(Y_i = 0) = \omega_i + (1-\omega_i)e^{-\mu_i}, \quad P(Y_i = k) = (1-\omega_i)\frac{e^{-\mu_i}\mu_i^k}{k!} \text{ for } k \geq 1,
\]

where \( \omega_i \in [0,1] \) is the probability of a **structural zero** (an observation from a permanently non-responding subpopulation). Both \( \omega_i \) and \( \mu_i \) can depend on covariates:

\[
\mathrm{logit}(\omega_i) = \mathbf{z}_i^\top \boldsymbol{\gamma}, \quad \log\mu_i = \mathbf{x}_i^\top\boldsymbol{\beta}.
\]

The covariates \( \mathbf{z}_i \) and \( \mathbf{x}_i \) may differ. The ZIP model is estimated by EM or direct maximum likelihood. A **Zero-Inflated Negative Binomial (ZINB)** further accommodates overdispersion in the count component.

The **Vuong test** distinguishes between the standard Poisson and ZIP: under the null (\( \omega_i = 0 \)), the test statistic is asymptotically standard normal. Large positive values favour the ZIP.

## Introduction to Generalised Additive Models

A natural generalisation relaxes the linearity constraint. A **Generalised Additive Model (GAM)** replaces the linear predictor with a sum of smooth functions:

\[
g(\mu_i) = \alpha + f_1(x_{i1}) + f_2(x_{i2}) + \cdots + f_p(x_{ip}),
\]

where each \( f_j \) is estimated from the data using **smoothing splines**, local polynomial regression, or regression splines with a roughness penalty. The GLM structure (exponential family, link function) is retained; only linearity in the systematic component is relaxed.

GAMs are fitted by **penalised IRLS**: at each step, instead of solving a weighted linear regression, one fits a weighted additive model using backfitting or the mixed model representation, with a smoothing parameter \( \lambda_j \) controlling roughness. The smoothing parameters are typically chosen by generalised cross-validation (GCV) or restricted maximum likelihood (REML). The degrees of freedom consumed by each smooth term — the **effective degrees of freedom** — serve as a complexity measure analogous to the number of parameters in a GLM.

---

## Summary: The GLM Ecosystem

The table below collects the key properties of the standard GLM families:

| Family | Canonical link | Variance function | Deviance \( d_i \) contribution |
|---|---|---|---|
| Normal | Identity \( \mu \) | 1 | \( (y_i - \hat\mu_i)^2 \) |
| Poisson | Log \( \log\mu \) | \( \mu \) | \( 2[y_i\log(y_i/\hat\mu_i) - (y_i - \hat\mu_i)] \) |
| Binomial | Logit | \( \mu(1-\mu)/m \) | \( 2[y_i\log(y_i/\hat\mu_i) + (m_i-y_i)\log((m_i-y_i)/(m_i(1-\hat\pi_i)))] \) |
| Gamma | Reciprocal | \( \mu^2 \) | \( 2[-\log(y_i/\hat\mu_i) + (y_i-\hat\mu_i)/\hat\mu_i] \) |
| Inverse Gaussian | \( 1/\mu^2 \) | \( \mu^3 \) | \( (y_i - \hat\mu_i)^2/(y_i\hat\mu_i^2) \) |

The following correspondences summarise the unified IRLS structure:

| GLM quantity | Formula | Role |
|---|---|---|
| Linear predictor | \( \eta_i = \mathbf{x}_i^\top\boldsymbol{\beta} \) | Systematic component |
| Mean | \( \mu_i = g^{-1}(\eta_i) \) | Connects \( \eta_i \) to response scale |
| GLM weight | \( w_i = 1/[V(\mu_i)(g'(\mu_i))^2] \) | Determines contribution to information |
| Working response | \( z_i = \eta_i + (y_i - \mu_i)g'(\mu_i) \) | IRLS dependent variable |
| Information matrix | \( \mathbf{I}(\boldsymbol{\beta}) = \mathbf{X}\mathbf{W}\mathbf{X}^\top \) | Drives inference |
| Score vector | \( \mathbf{S}(\boldsymbol{\beta}) = \mathbf{X}\mathbf{W}(\mathbf{y}-\boldsymbol{\mu})\circ g'(\boldsymbol{\mu}) \) | MLE equation |

The unifying thread across all chapters is that GLM software — whether fitting logistic, Poisson, gamma, or any other GLM — executes the same IRLS algorithm, produces the same asymptotic normal distribution for the MLE, and uses the same deviance-based framework for inference. The choice of family and link function encodes scientific knowledge about the data-generating mechanism, and residual analysis ensures those choices are appropriate.

---

# Appendix A: Likelihood Theory Supplement

## A.1 Properties of the Exponential Family in Detail

The exponential family has a rich set of moment-generating properties that underpin the clean likelihood theory of GLMs. Let \( Y \) have density \( f(y \mid \theta) = \exp\{y\theta - b(\theta) + c(y)\} \) (the canonical form with unit dispersion). The **moment generating function** of \( Y \) is:

\[
M_Y(t) = E[e^{tY}] = \int e^{ty}\exp\{y\theta - b(\theta) + c(y)\}\,dy = \exp\{b(\theta + t) - b(\theta)\},
\]

confirming that \( b(\theta) \) is literally the cumulant generating function of \( Y \) shifted to \( \theta \). Taking derivatives at \( t = 0 \):

\[
E[Y] = b'(\theta), \quad \mathrm{Var}(Y) = b''(\theta), \quad \kappa_3 = b'''(\theta), \quad \kappa_4 = b^{(4)}(\theta), \ldots
\]

All cumulants of \( Y \) are derivatives of \( b(\theta) \). This is the reason \( b \) is called the cumulant function. It further implies that the exponential family is characterised entirely by \( b \) — knowing the cumulant function determines all moments and hence the entire distribution (within the family).

**Sufficient statistics.** By the factorisation theorem, \( \sum_i y_i \) is a sufficient statistic for \( \theta \) in the canonical exponential family with iid observations. More generally, \( \mathbf{t}(y) = \sum_i \mathbf{t}_i(y_i) \) is sufficient for the canonical parameter \( \boldsymbol{\theta} \) in the \( k \)-parameter natural exponential family \( \exp\{\boldsymbol{\theta}^\top \mathbf{t}(y) - b(\boldsymbol{\theta}) + c(y)\} \). For GLMs, sufficiency has a practical implication: the MLE score equations \( S(\boldsymbol{\beta}) = \mathbf{0} \) depend on the data only through the sufficient statistics \( \mathbf{X}\mathbf{y} \), not through the individual \( y_i \)'s.

## A.2 Worked Derivation: Normal Distribution as Exponential Family

To see the exponential family structure concretely, we work through the normal distribution \( Y \sim N(\mu, \sigma^2) \) with \( \sigma^2 \) known.

The density is:

\[
f(y \mid \mu, \sigma^2) = \frac{1}{\sqrt{2\pi\sigma^2}}\exp\!\left\{-\frac{(y-\mu)^2}{2\sigma^2}\right\}.
\]

Expanding the exponent:

\[
-\frac{(y-\mu)^2}{2\sigma^2} = -\frac{y^2 - 2y\mu + \mu^2}{2\sigma^2} = \frac{y\mu}{\sigma^2} - \frac{\mu^2}{2\sigma^2} - \frac{y^2}{2\sigma^2}.
\]

Collecting terms by role:

\[
f(y \mid \mu, \sigma^2) = \exp\!\left\{ \underbrace{\frac{y\mu - \mu^2/2}{\sigma^2}}_{\text{exponential family kernel}} + \underbrace{\left(-\frac{y^2}{2\sigma^2} - \frac{1}{2}\log(2\pi\sigma^2)\right)}_{c(y;\sigma^2)} \right\}.
\]

Identifying terms: \( \theta = \mu \) (canonical parameter), \( b(\theta) = \theta^2/2 = \mu^2/2 \) (cumulant function), \( a(\phi) = \phi = \sigma^2 \) (dispersion), \( c(y;\phi) = -y^2/(2\phi) - \frac{1}{2}\log(2\pi\phi) \).

Verification:
- \( b'(\theta) = \theta = \mu \) ✓ (so \( E[Y] = \mu \))
- \( b''(\theta) = 1 \) ✓ (so \( V(\mu) = 1 \); variance function is constant)
- \( \mathrm{Var}(Y) = b''(\theta) \cdot a(\phi) = 1 \cdot \sigma^2 = \sigma^2 \) ✓

The canonical link for the normal distribution is thus the **identity link** \( g(\mu) = \mu \).

## A.3 Worked Derivation: Binomial Distribution as Exponential Family

For \( Y \sim \mathrm{Binomial}(m, \pi) \):

\[
f(y \mid \pi) = \binom{m}{y}\pi^y(1-\pi)^{m-y} = \binom{m}{y}\exp\!\left\{y\log\pi + (m-y)\log(1-\pi)\right\}.
\]

Rewrite:

\[
= \binom{m}{y}\exp\!\left\{y\log\!\frac{\pi}{1-\pi} + m\log(1-\pi)\right\}.
\]

Let \( \theta = \log[\pi/(1-\pi)] \) (the logit), so \( \pi = e^\theta/(1+e^\theta) \) and \( 1-\pi = 1/(1+e^\theta) \). Then \( m\log(1-\pi) = -m\log(1+e^\theta) \). Identifying:

- \( \theta = \log[\pi/(1-\pi)] \) (canonical parameter = logit of \( \pi \))
- \( b(\theta) = m\log(1+e^\theta) \) (cumulant function)
- \( a(\phi) = 1 \) (no dispersion)
- \( c(y;\phi) = \log\binom{m}{y} \)

Verification:
- \( b'(\theta) = me^\theta/(1+e^\theta) = m\pi \) ✓ (so \( E[Y] = m\pi \))
- \( b''(\theta) = me^\theta/(1+e^\theta)^2 = m\pi(1-\pi) \) ✓ (so \( V(\mu) = \pi(1-\pi) \) per trial, or \( m\pi(1-\pi) \) total)
- Canonical link: \( g(\mu) = g(m\pi) = \theta = \log[\pi/(1-\pi)] = \log[\mu/(m-\mu)] \), i.e., the **logit link**.

## A.4 Fisher Information for the Exponential Family

For a single observation from the exponential family (with \( a(\phi) = \phi \) and \( w = 1 \)):

\[
I(\theta) = -E\!\left[\frac{\partial^2 \ell}{\partial\theta^2}\right] = \frac{b''(\theta)}{\phi} = \frac{V(\mu)}{\phi}.
\]

The expected information equals the variance function divided by the dispersion. For a sample of \( n \) iid observations from a GLM, the total expected information for \( \theta_i \) is:

\[
\mathcal{I}(\theta) = \frac{n\,b''(\theta)}{\phi}.
\]

The asymptotic standard error of the MLE \( \hat\theta \) is therefore \( \sqrt{\phi/(nb''(\theta))} \), which decreases as \( \sqrt{1/n} \) as expected from the central limit theorem.

# Appendix B: Detailed GLM Examples

## B.1 Logistic Regression: Birdkeeping and Lung Cancer

The birdkeeping and lung cancer dataset (from Ramsey and Schafer) examines whether keeping birds is an independent risk factor for lung cancer, after controlling for smoking, age, and sex. The study has 147 cases (lung cancer) and 75 controls.

**Model setup.** The binary response \( Y_i = 1 \) if lung cancer is present. Covariates include: \( x_1 \) = birdkeeping (1 = yes), \( x_2 \) = sex (1 = male), \( x_3 \) = age (continuous), \( x_4 \) = socioeconomic status (0 = low, 1 = high), \( x_5 \) = years smoked (continuous), \( x_6 \) = cigarettes per day (continuous).

**Fitted model.** The main effects logistic regression gives:

\[
\mathrm{logit}(\hat\pi_i) = -1.933 + 1.362 x_1 + 0.560 x_2 + 0.025 x_3 - 0.387 x_4 + 0.031 x_5 + 0.020 x_6.
\]

The coefficient for birdkeeping: \( e^{1.362} = 3.91 \) (95% CI: 1.97 to 7.75). After adjusting for smoking, sex, age, and socioeconomic status, bird owners have nearly 4 times the odds of developing lung cancer compared to non-bird owners. This is a substantial and statistically significant effect (\( z = 3.87 \), \( p < 0.001 \)).

**Analysis of deviance.** Testing whether birdkeeping adds to the model with all other covariates included: \( \Delta D = 16.4 \) on 1 df, \( p < 0.001 \). Birdkeeping is highly significant even after controlling for confounders.

**Model checking.** The Hosmer–Lemeshow test groups the 222 subjects into deciles of predicted probability and tests \( H_0 \): the logistic model fits using \( \chi^2_8 \). With \( X^2_\mathrm{HL} = 6.3 \) (\( p = 0.61 \)), there is no significant lack of fit.

## B.2 Poisson Regression with Offset: Rat Tumour Incidence

A time-inhomogeneous Poisson process model for the incidence of tumours in rats exposed to a carcinogen. For each rat \( i \), let \( Y_i \) be the number of tumours observed in a follow-up period of length \( t_i \), and let \( x_i \) be the dose of carcinogen received.

**Model.** \( Y_i \sim \mathrm{Poisson}(\lambda_i t_i) \) where \( \log\lambda_i = \beta_0 + \beta_1 x_i \), and \( \log t_i \) is the offset:

\[
\log\mu_i = \log t_i + \beta_0 + \beta_1 x_i.
\]

**Fitting and interpretation.** The MLE satisfies \( \hat\beta_1 > 0 \) if higher doses lead to higher rates. The rate ratio per unit dose is \( e^{\hat\beta_1} \). A 95% CI is \( \exp(\hat\beta_1 \pm 1.96\,\widehat{\mathrm{se}}(\hat\beta_1)) \). Testing \( H_0: \beta_1 = 0 \) (no dose effect) uses either the Wald test or the likelihood ratio test.

**Deviance analysis.** The deviance of the log-linear dose-response model (2 parameters) against the saturated model (one parameter per rat) follows \( \chi^2_{n-2} \) approximately. If the deviance is large relative to its degrees of freedom, there is either overdispersion (extra-Poisson variation in tumour rates across rats) or model misspecification (perhaps a quadratic dose-response is more appropriate).

## B.3 Log-Linear Models: Melanoma Study

A two-way contingency table from Aitkin et al. (1989) classifies 400 cases of melanoma by site (head/neck = 1, trunk = 2, extremity = 3) and histological type (Hutchinson's freckle = 1, superficial spreading = 2, nodular = 3, indeterminate = 4):

| Site | Type 1 | Type 2 | Type 3 | Type 4 | Total |
|---|---|---|---|---|---|
| Head/neck | 22 | 2 | 10 | 23 | 57 |
| Trunk | 2 | 16 | 54 | 115 | 187 |
| Extremity | 10 | 54 | 22 | 70 | 156 |
| **Total** | 34 | 72 | 86 | 208 | 400 |

**Independence model.** Fitting the log-linear independence model \( \log\mu_{ij} = u + u_i^V + u_j^W \) in R:

```r
mel.dat <- data.frame(
  count = c(22,2,10,23, 2,16,54,115, 10,54,22,70),
  site = rep(1:3, each=4), type = rep(1:4, 3))
mod.ind <- glm(count ~ factor(site) + factor(type),
               family = poisson, data = mel.dat)
```

The residual deviance is 51.79 on \( (3-1)(4-1) = 6 \) df, \( p < 0.001 \). The independence model is a very poor fit — site and histological type are strongly associated.

**Saturated model.** Fitting the saturated model \( \log\mu_{ij} = u + u_i^V + u_j^W + u_{ij}^{VW} \) gives a perfect fit (residual deviance = 0). The 6 interaction parameters \( u_{ij}^{VW} \) quantify the association in log odds ratio form: e.g., the log odds ratio of Site 1 vs 3 at Type 1 vs Type 2 is \( u_{11}^{VW} - u_{12}^{VW} - u_{31}^{VW} + u_{32}^{VW} \).

## B.4 Negative Binomial vs Poisson: Epilepsy Trial

The epilepsy trial data (Thall and Vail 1990) records seizure counts for 59 patients over four successive 2-week periods, with treatment assignment (progabide vs placebo) and baseline seizure count.

**Poisson model.** Fitting a Poisson log-linear model with treatment, period, and baseline (log-transformed) as covariates gives:

\[
\log\hat\mu_{ij} = \hat\beta_0 + \hat\beta_1 \cdot \text{trt}_i + \hat\beta_2 \cdot \text{period}_{ij} + \hat\beta_3 \cdot \log(\text{base}_i).
\]

The Pearson statistic is \( X^2 = 1208 \) on 228 df, giving \( \hat\phi = 5.3 \) — severe overdispersion. The quasiPoisson standard errors are inflated by \( \sqrt{5.3} = 2.3 \), making the treatment effect non-significant.

**Negative binomial model.** Fitting the negative binomial with the same covariates estimates \( \hat k = 0.43 \) (so overdispersion is substantial). The deviance is 256 on 228 df (\( \hat\phi \approx 1.1 \)), consistent with an adequate fit. The treatment effect is \( e^{\hat\beta_1} = 0.86 \) (95% CI: 0.73 to 1.01), borderline non-significant.

**Clustered structure.** The overdispersion likely arises from subject-to-subject heterogeneity in baseline seizure propensity (unaccounted individual random effects) and within-subject correlation across periods. A proper analysis should use a mixed effects Poisson model or GEE, but the negative binomial provides a reasonable marginal approximation.

## B.5 IRLS in Practice: Binomial Example

To see IRLS concretely, consider a simple binomial logistic regression with \( n = 4 \) observations, \( m_i = 10 \) trials each, responses \( y = (2, 4, 6, 8) \), and a single predictor \( x = (0, 1, 2, 3) \). Model: \( \mathrm{logit}(\pi_i) = \beta_0 + \beta_1 x_i \).

**Iteration 0.** Starting values: \( \hat\beta_0 = \log(\bar y / (m - \bar y)) = \log(5/5) = 0 \), \( \hat\beta_1 = 0 \). All \( \hat\pi_i = 0.5 \), all \( \hat\mu_i = 5 \).

**Weights.** \( w_i = m_i\hat\pi_i(1-\hat\pi_i) = 10 \times 0.5 \times 0.5 = 2.5 \) for all \( i \).

**Working responses.** \( z_i = \hat\eta_i + (y_i - \hat\mu_i)/[m_i\hat\pi_i(1-\hat\pi_i)] \cdot m_i\hat\pi_i(1-\hat\pi_i)/(m_i\hat\pi_i(1-\hat\pi_i)) \). More directly: \( z_i = \hat\eta_i + (y_i - \hat\mu_i) \cdot (d\eta/d\mu)|_i \) where \( d\eta_i/d\mu_i = 1/[m_i\hat\pi_i(1-\hat\pi_i)] \):

\[
z_i = 0 + \frac{y_i - 5}{2.5}: \quad z = (-1.2, -0.4, 0.4, 1.2).
\]

**Weighted LS.** Regress \( z \) on \( (1, x) \) with weights \( (2.5, 2.5, 2.5, 2.5) \). Since weights are equal, the WLS estimate equals the OLS estimate: \( \hat\beta_0^{(1)} = -1.2 \), \( \hat\beta_1^{(1)} = 0.8 \). (More precisely, \( \hat\beta_1 = \sum w_i(x_i - \bar x)(z_i - \bar z)/\sum w_i(x_i-\bar x)^2 = [(-1.5)(-1.2)+(-0.5)(-0.4)+(0.5)(0.4)+(1.5)(1.2)]/5 = 3.6/5 = 0.72 \).)

After several iterations the algorithm converges to \( \hat\beta_0 = -1.099 \), \( \hat\beta_1 = 0.693 \) — a log odds ratio of about 0.69 per unit increase in \( x \), corresponding to a twofold increase in odds per step.

# Appendix C: R Code Reference

## C.1 GLM Fitting in R

R's `glm()` function fits all standard GLMs via IRLS. The key arguments are `formula`, `family`, and `data`. The `family` argument specifies both the distribution and the default link, but alternative links can be specified:

```r
# Logistic regression (binomial with logit link — the default)
mod.logit <- glm(cbind(y, m-y) ~ x1 + x2,
                 family = binomial(link = "logit"), data = df)

# Logistic regression with probit link
mod.probit <- glm(cbind(y, m-y) ~ x1 + x2,
                  family = binomial(link = "probit"), data = df)

# Poisson regression with log link (default)
mod.pois <- glm(y ~ x1 + x2 + offset(log(t)),
                family = poisson(link = "log"), data = df)

# Quasi-Poisson (estimates overdispersion)
mod.qpois <- glm(y ~ x1 + x2,
                 family = quasipoisson(link = "log"), data = df)

# Gamma regression with log link
mod.gamma <- glm(y ~ x1 + x2,
                 family = Gamma(link = "log"), data = df)

# Negative binomial (requires MASS package)
library(MASS)
mod.nb <- glm.nb(y ~ x1 + x2, data = df)
```

## C.2 Extracting GLM Outputs

The `summary()` function for GLM objects returns coefficients, standard errors, \( z \)-values, deviance residuals, null and residual deviances, degrees of freedom, and AIC. Key components accessible programmatically:

```r
summary(mod)$coefficients      # matrix: estimate, se, z, p
summary(mod)$cov.unscaled      # I^{-1}(beta_hat) = (X'WX)^{-1}
mod$deviance                   # residual deviance
mod$null.deviance              # null deviance (intercept only)
mod$df.residual                # residual degrees of freedom
mod$fitted.values              # hat{mu}_i
mod$linear.predictors          # hat{eta}_i
AIC(mod)                       # AIC = -2*ell + 2*p
```

For deviance/LRT between nested models:

```r
# Method 1: difference in deviances
delta.D <- mod0$deviance - mod1$deviance
delta.df <- mod0$df.residual - mod1$df.residual
p.value <- 1 - pchisq(delta.D, delta.df)

# Method 2: anova() function
anova(mod0, mod1, test = "LRT")   # for Poisson/binomial
anova(mod0, mod1, test = "F")     # for quasi families
```

## C.3 Residuals and Diagnostics

```r
# Residual types
residuals(mod, type = "deviance")   # deviance residuals r_i^D
residuals(mod, type = "pearson")    # Pearson residuals r_i^P
residuals(mod, type = "working")    # working residuals z_i - eta_hat_i
residuals(mod, type = "response")   # raw residuals y_i - mu_hat_i

# Leverage values
hatvalues(mod)                      # h_{ii}

# Cook's distance
cooks.distance(mod)

# Influence measures
influence.measures(mod)

# Standard diagnostic plots
plot(mod)                           # 4-panel residual diagnostics

# Component-plus-residual plots (requires car package)
library(car)
crPlots(mod)

# Added variable plots
avPlots(mod)
```

## C.4 Confidence Intervals for Odds Ratios and Rate Ratios

```r
# Wald-based CI for coefficients
confint.default(mod)           # uses normal approximation

# Profile likelihood CI (usually preferred, especially for small samples)
confint(mod)                   # uses profile likelihood

# CI for ORs / rate ratios (exponentiated)
exp(confint(mod))

# CI for a contrast c'*beta (e.g., comparing two non-reference levels)
c.vec <- c(0, -1, 1, 0, 0)    # contrast vector
est <- sum(c.vec * coef(mod))
se <- sqrt(t(c.vec) %*% vcov(mod) %*% c.vec)
ci <- est + c(-1, 1) * qnorm(0.975) * se
exp(ci)                        # CI for OR or rate ratio
```

# Appendix D: Key Theorems and Proofs

## D.1 Derivation of GLM Score Equations as Sufficient Statistics

Under the canonical link, the score vector \( \mathbf{S}(\boldsymbol{\beta}) = \mathbf{X}(\mathbf{y} - \boldsymbol{\mu}) \) depends on the data only through \( \mathbf{X}\mathbf{y} = \sum_i \mathbf{x}_i y_i \). By the factorisation theorem, \( \mathbf{X}\mathbf{y} \) is a sufficient statistic for \( \boldsymbol{\beta} \) under the canonical link. This justifies: (1) the MLE \( \hat{\boldsymbol{\beta}} \) is a function of the sufficient statistics; (2) the analysis of deviance depends on the data only through \( \mathbf{X}\mathbf{y} \) and the fitted values \( \hat{\boldsymbol{\mu}} \).

**Proof sketch.** Write the joint density of \( (Y_1, \ldots, Y_n) \) under the canonical exponential family:

\[
f(\mathbf{y} \mid \boldsymbol{\theta}) = \exp\!\left\{\sum_i y_i\theta_i - \sum_i b(\theta_i) + \sum_i c(y_i;\phi)\right\}.
\]

Under the canonical link \( \theta_i = \mathbf{x}_i^\top\boldsymbol{\beta} \), this becomes:

\[
= \exp\!\left\{ \boldsymbol{\beta}^\top \underbrace{\sum_i \mathbf{x}_i y_i}_{\mathbf{X}\mathbf{y}} - \sum_i b(\mathbf{x}_i^\top\boldsymbol{\beta}) + \sum_i c(y_i;\phi)\right\},
\]

which factors as \( g(\mathbf{X}\mathbf{y}, \boldsymbol{\beta}) \cdot h(\mathbf{y}) \) with \( h(\mathbf{y}) = \exp\{\sum_i c(y_i;\phi)\} \). By the Neyman–Pearson factorisation theorem, \( \mathbf{X}\mathbf{y} \) is sufficient for \( \boldsymbol{\beta} \). \( \square \)

## D.2 Asymptotic Normality of the GLM MLE

Under standard regularity conditions, the MLE \( \hat{\boldsymbol{\beta}} \) in a GLM satisfies:

\[
\sqrt{n}(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta}) \overset{d}{\to} N(\mathbf{0}, \mathbf{I}^{-1}(\boldsymbol{\beta})),
\]

where \( \mathbf{I}(\boldsymbol{\beta}) = \mathbf{X}\mathbf{W}\mathbf{X}^\top/n \) (scaled information). The key steps are:

1. **Score consistency:** \( \mathbf{S}(\boldsymbol{\beta})/\sqrt{n} \overset{d}{\to} N(\mathbf{0}, \mathbf{I}(\boldsymbol{\beta})) \) by the CLT applied to the independent score contributions \( \mathbf{S}_i = (y_i - \mu_i)w_i(\partial\eta_i/\partial\mu_i)\mathbf{x}_i \), each with mean zero and variance \( w_i\mathbf{x}_i\mathbf{x}_i^\top \).

2. **Information convergence:** \( \mathbf{I}(\boldsymbol{\beta})/n \overset{p}{\to} \overline{\mathbf{I}}(\boldsymbol{\beta}) \) (positive definite) by the LLN.

3. **Taylor expansion of the score about \( \boldsymbol{\beta} \):** At the MLE, \( \mathbf{0} = \mathbf{S}(\hat{\boldsymbol{\beta}}) \approx \mathbf{S}(\boldsymbol{\beta}) - \mathbf{I}(\boldsymbol{\beta})(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta}) \), giving \( \sqrt{n}(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta}) \approx [\mathbf{I}(\boldsymbol{\beta})/n]^{-1}[\mathbf{S}(\boldsymbol{\beta})/\sqrt{n}] \overset{d}{\to} N(\mathbf{0}, \overline{\mathbf{I}}^{-1}) \).

## D.3 Consistency and Efficiency of IRLS

At convergence, the IRLS algorithm finds a stationary point of \( \ell(\boldsymbol{\beta}) \), i.e., a solution to \( \mathbf{S}(\boldsymbol{\beta}) = \mathbf{0} \). Under conditions ensuring the log-likelihood is strictly concave (which holds for exponential families with full rank design matrix), the stationary point is unique and equals the global MLE. The convergence rate of IRLS is quadratic (Newton's method) under the canonical link, and linear under non-canonical links (Fisher scoring converges at a linear rate in general).

In practice, IRLS may fail to converge in cases of **complete separation** in logistic regression: when a linear combination of predictors perfectly separates the two response groups, the MLE does not exist (coefficients diverge to \( \pm\infty \)). This is diagnosed by checking for very large estimated coefficients or standard errors, and can be addressed by Firth's penalised likelihood or exact logistic regression.

## D.4 Deviance as a Likelihood Ratio Statistic

The deviance is a likelihood ratio statistic comparing the fitted model to the saturated model. Its asymptotic \( \chi^2 \) distribution follows from Wilks' theorem applied to the LRT between the two models. The key steps:

1. **Wilks' theorem:** For an LRT between a \( q \)-parameter model and a \( p \)-parameter nested sub-model (\( p < q \)), the log-likelihood ratio statistic \( -2\log R \) converges in distribution to \( \chi^2_{q-p} \) under the null (\( p \)-parameter model is correct).

2. **Application to deviance:** The saturated model has \( q = n \) parameters; the fitted GLM has \( p \) parameters. Under Wilks, \( D = -2\log R \overset{d}{\to} \chi^2_{n-p} \).

3. **Caveats:** Wilks' theorem requires that \( n \to \infty \) with \( p \) fixed, which is violated for grouped binomial data when cell sizes \( m_i \) remain fixed while the number of groups \( n \) grows. The approximation is also poor for sparse Poisson data (many zero counts) or for ungrouped binary data with \( m_i = 1 \). In these cases, the deviance should not be used as a standalone goodness-of-fit test.

## D.5 The Variance-Stabilising Transformation

For a GLM with variance function \( V(\mu) \), the **variance-stabilising transformation** \( h(\mu) \) satisfies \( h'(\mu) \propto 1/\sqrt{V(\mu)} \), so that \( \mathrm{Var}(h(Y)) \approx \mathrm{const} \). This is useful for constructing diagnostic tools with approximately homoscedastic residuals.

| Distribution | \( V(\mu) \) | Variance-stabilising transformation |
|---|---|---|
| Normal | 1 | Identity: \( h(\mu) = \mu \) |
| Poisson | \( \mu \) | Square root: \( h(\mu) = 2\sqrt{\mu} \) |
| Binomial | \( \mu(1-\mu) \) | Arcsine: \( h(\mu) = \arcsin\sqrt{\mu} \) |
| Gamma | \( \mu^2 \) | Log: \( h(\mu) = \log\mu \) |
| Inverse Gaussian | \( \mu^3 \) | \( h(\mu) = -1/\sqrt{\mu} \) |

In the GLM context, the working response \( z_i = \eta_i + (y_i - \mu_i)g'(\mu_i) \) can be viewed as a variance-stabilised version of \( y_i \) in the working linear regression — the canonical link makes this connection exact.

# Appendix E: Theory of Quasi-Likelihood

## E.1 Wedderburn's Quasi-Likelihood

Wedderburn (1974) introduced **quasi-likelihood** by observing that the GLM estimating equations for \( \boldsymbol{\beta} \) — the score equations — depend on the distribution only through the mean function \( \mu(\boldsymbol{\beta}) \) and the variance function \( V(\mu)\phi \). He defined the **quasi-score** for a single observation:

\[
Q(\mu; y) = \int_\mu^y \frac{y - t}{V(t)}\,dt,
\]

and the quasi-likelihood as \( q(\mu; y) = Q(\mu; y)/\phi \). The quasi-score functions like a log-likelihood: \( \partial q/\partial\mu = (y - \mu)/(V(\mu)\phi) \), \( E[\partial q/\partial\mu] = 0 \), and \( E[(\partial q/\partial\mu)^2] = -E[\partial^2 q/\partial\mu^2] \). The estimating equations \( \sum_i (\partial q_i/\partial\boldsymbol{\beta}) = \mathbf{0} \) coincide with the GLM score equations, so IRLS solves them regardless of whether a full likelihood is available.

The quasi-MLE is consistent and asymptotically normal under the sole assumption that the mean and variance functions are correctly specified:

\[
\sqrt{n}(\hat{\boldsymbol{\beta}} - \boldsymbol{\beta}) \overset{d}{\to} N\!\left(\mathbf{0},\; \phi \left(\sum_i w_i \mathbf{x}_i\mathbf{x}_i^\top\right)^{-1}\right).
\]

No distributional assumption beyond correct mean and variance function specification is required for consistency or asymptotic normality. This makes quasi-likelihood methods semi-parametric and robust to distributional misspecification.

## E.2 Extended Quasi-Likelihood

McCullagh and Nelder (1989) proposed the **extended quasi-likelihood** (EQL), which generalises quasi-likelihood to allow estimation of the dispersion parameter \( \phi \) alongside \( \boldsymbol{\beta} \). The EQL is:

\[
Q^+(\boldsymbol{\beta}, \phi; \mathbf{y}) = -\frac{1}{2}\sum_i \left[\frac{d_i}{\phi} + \log(2\pi\phi V(y_i))\right],
\]

where \( d_i = 2\int_{y_i}^{\hat\mu_i} (y_i - t)/V(t)\,dt \) are the deviance contributions. Maximising over \( \phi \) gives \( \hat\phi = D/(n-p) \) — the familiar moment estimator from the deviance. The EQL framework provides a principled basis for AIC-like model selection under quasi-likelihood: \( \mathrm{QAIC} = D/\hat\phi + 2p \).

## E.3 Generalised Estimating Equations

For correlated data (repeated measurements, clustered observations), **Generalised Estimating Equations (GEE)** extend quasi-likelihood by modelling the within-cluster correlation structure through a working correlation matrix \( \mathbf{R}(\boldsymbol{\alpha}) \). The GEE estimating equations for subject \( i \) with cluster \( \{Y_{i1}, \ldots, Y_{im_i}\} \) are:

\[
\sum_{i=1}^n \frac{\partial\boldsymbol{\mu}_i^\top}{\partial\boldsymbol{\beta}} \mathbf{V}_i^{-1}(\mathbf{y}_i - \boldsymbol{\mu}_i) = \mathbf{0},
\]

where \( \mathbf{V}_i = \phi\mathbf{A}_i^{1/2}\mathbf{R}(\boldsymbol{\alpha})\mathbf{A}_i^{1/2} \) with \( \mathbf{A}_i = \mathrm{diag}(V(\mu_{i1}), \ldots, V(\mu_{im_i})) \). The GEE estimator is consistent for \( \boldsymbol{\beta} \) regardless of whether the working correlation structure is correctly specified, and inference uses the **sandwich variance estimator**:

\[
\widehat{\mathrm{Var}}(\hat{\boldsymbol{\beta}}) = \mathbf{B}^{-1}\mathbf{M}\mathbf{B}^{-1},
\]

where \( \mathbf{B} = \sum_i \partial\boldsymbol{\mu}_i^\top/\partial\boldsymbol{\beta}\cdot\mathbf{V}_i^{-1}\cdot\partial\boldsymbol{\mu}_i/\partial\boldsymbol{\beta}^\top \) and \( \mathbf{M} = \sum_i \partial\boldsymbol{\mu}_i^\top/\partial\boldsymbol{\beta}\cdot\mathbf{V}_i^{-1}(\mathbf{y}_i - \boldsymbol{\mu}_i)(\mathbf{y}_i - \boldsymbol{\mu}_i)^\top\mathbf{V}_i^{-1}\cdot\partial\boldsymbol{\mu}_i/\partial\boldsymbol{\beta}^\top \).

GEE gives population-average (marginal) estimates of \( \boldsymbol{\beta} \), appropriate when the scientific question concerns the average effect across subjects rather than individual-level effects. The epilepsy trial is a prime candidate for GEE, given the repeated measurements within each patient.

---

## Quick Reference: GLM Families and Links in R

| Response type | Typical distribution | Recommended link | R `family` argument |
|---|---|---|---|
| Continuous unbounded | Normal | Identity | `gaussian()` |
| Positive continuous, right-skewed | Gamma | Log | `Gamma(link="log")` |
| Positive continuous, very right-skewed | Inverse Gaussian | Log | `inverse.gaussian(link="log")` |
| Count (rare events) | Poisson | Log | `poisson(link="log")` |
| Count with overdispersion | Negative Binomial | Log | `MASS::glm.nb()` |
| Count (many zeros) | Zero-inflated Poisson | Log (count) + Logit (zero) | `pscl::zeroinfl()` |
| Binary (\( m_i = 1 \)) | Binomial | Logit | `binomial(link="logit")` |
| Grouped binary | Binomial | Logit | `binomial(link="logit")` |
| Ordered categories | Multinomial | Logit (cumulative) | `MASS::polr()` |
| Unordered categories | Multinomial | Logit | `nnet::multinom()` |
| Binary with overdispersion | Quasi-binomial | Logit | `quasibinomial()` |
| Count with overdispersion | Quasi-Poisson | Log | `quasipoisson()` |

---

# Appendix F: Advanced Topics and Connections

## F.1 The GLM and Exponential Dispersion Models

The standard GLM framework as presented assumes the dispersion parameter \( \phi \) is known. In the normal linear model, \( \phi = \sigma^2 \) is estimated by \( \hat\sigma^2 = D/(n-p) \) separately from \( \boldsymbol{\beta} \). For the Poisson and binomial, \( \phi = 1 \) is known by assumption (the distributional mean–variance relationship determines \( \phi \)). The **exponential dispersion model** (EDM) of Jørgensen (1987) provides a unified framework in which \( \phi \) is an additional parameter:

\[
f(y \mid \theta, \phi) = a(y, \phi)\exp\!\left\{\frac{y\theta - b(\theta)}{\phi}\right\},
\]

where the unit deviance \( d(y; \mu) = 2[y(\tilde\theta - \hat\theta) - b(\tilde\theta) + b(\hat\theta)] \) with \( \tilde\theta \) the canonical parameter at the saturated value \( y \) and \( \hat\theta \) the canonical parameter at the fitted value \( \hat\mu \). The deviance is \( D = \sum_i d(y_i;\hat\mu_i)/\phi \), and the MLE of \( \phi \) from the EDM is the Pearson estimator \( \hat\phi = X^2/(n-p) \).

## F.2 Generalized Estimating Equations vs Mixed Effects Models

When analysing clustered or longitudinal data with a binary or count response, two broad approaches exist:

**GEE (population-average/marginal models).** As described in Appendix E.3, GEE estimates the average effect of covariates on the marginal mean \( E[Y_{ij}] = \mu_{ij}(\boldsymbol{\beta}) \). The regression parameters \( \boldsymbol{\beta} \) describe how a one-unit change in \( x_{ij} \) shifts the population-average response on the link scale. GEE is appropriate when the research question is about the population effect (e.g., "what is the average treatment effect across all patients?").

**GLMMs (subject-specific/conditional models).** A **Generalised Linear Mixed Model** (GLMM) adds random effects \( \mathbf{b}_i \) to the linear predictor:

\[
g(\mu_{ij}) = \mathbf{x}_{ij}^\top\boldsymbol{\beta} + \mathbf{z}_{ij}^\top\mathbf{b}_i, \quad \mathbf{b}_i \sim N(\mathbf{0}, \mathbf{G}).
\]

The fixed-effect estimates \( \boldsymbol{\beta} \) describe how a one-unit change in \( x_{ij} \) affects a specific individual's response on the link scale, conditional on their random effect. For non-identity links (logit, log), the marginal (population-average) and conditional (subject-specific) parameters differ; the subject-specific parameters are larger in magnitude. GLMMs are fitted by maximum likelihood after integrating out the random effects — typically by Laplace approximation or Gaussian–Hermite quadrature — using R packages `lme4` (`glmer()`) or `glmmTMB`.

**When to choose which.** Use GEE when: the marginal mean is the target of inference; the correlation structure is a nuisance; and large samples allow the sandwich estimator to be reliable. Use GLMMs when: individual-level prediction is required; the random effects are scientifically meaningful; or the data have unbalanced clusters.

## F.3 Complete Separation in Logistic Regression

**Complete separation** occurs in logistic regression when there exists a linear combination \( \mathbf{c}^\top\mathbf{x}_i \) that perfectly predicts the response:

\[
\mathbf{c}^\top\mathbf{x}_i > 0 \implies y_i = 1, \qquad \mathbf{c}^\top\mathbf{x}_i < 0 \implies y_i = 0.
\]

When complete separation holds, the MLE does not exist: the log-likelihood increases without bound as \( \|\boldsymbol{\beta}\| \to \infty \) along the separating direction. R will produce very large estimates with very large standard errors and a warning about non-convergence.

**Diagnosis.** Look for: \( |\hat\beta_j| > 10 \) with \( \widehat{\mathrm{se}}(\hat\beta_j) > 5 \); `glm()` warning "fitted probabilities numerically 0 or 1 occurred"; extremely large deviance residuals.

**Remedies.**
- **Firth's penalised likelihood**: adds a Jeffreys prior penalty \( -\frac{1}{2}\log|\mathbf{I}(\boldsymbol{\beta})| \) to the log-likelihood, which regularises the estimates. Implemented in R's `logistf` package.
- **Exact logistic regression**: conditions on the sufficient statistics and computes exact \( p \)-values from the conditional distribution. Implemented in `elrm` or SAS `PROC LOGISTIC EXACT`.
- **Data collapsing**: combine covariate cells to eliminate empty cells.
- **Bayesian logistic regression** with informative priors (e.g., weakly informative Cauchy(0, 2.5) priors; default in `rstanarm::stan_glm()`).

## F.4 Model Checking Beyond Residual Plots

Beyond standard residual plots, several additional checks are recommended for GLMs:

**Checking the variance function.** If the variance function is misspecified, systematic patterns appear in plots of squared Pearson residuals \( (r_i^P)^2 \) against \( \hat\mu_i \). Under the correct variance function, \( E[(r_i^P)^2] \approx 1 \) uniformly. A smooth curve through \( (r_i^P)^2 \) vs \( \hat\mu_i \) that is not flat suggests a different variance function (e.g., switching from Poisson \( V=\mu \) to Negative Binomial \( V=\mu + k\mu^2 \)).

**Half-normal plots with simulation envelopes.** Atkinson (1985) proposed plotting the ordered absolute deviance residuals against the quantiles of the folded normal, with simulation envelopes generated by refitting the model to \( B = 99 \) simulated datasets under the fitted model. Observations outside the envelope suggest either outliers or systematic misfit.

**Randomised quantile residuals** (Dunn and Smyth 1996). For discrete distributions (Poisson, binomial), deviance residuals are not continuous and their distribution can deviate substantially from \( N(0,1) \) even under the true model. Randomised quantile residuals solve this by jittering the discrete CDF values to create continuous uniform residuals, then transforming to normal scores. These are nearly exactly \( N(0,1) \) under the true model regardless of sample size. Implemented in the R package `statmod::qresid()`.

**Hosmer–Lemeshow test for logistic regression.** For ungrouped binary data (\( m_i = 1 \)), the standard Pearson and deviance statistics have poor \( \chi^2 \) approximations. The Hosmer–Lemeshow test partitions the data into \( g = 10 \) groups based on deciles of the estimated probabilities \( \hat\pi_i \), and computes a Pearson-type statistic on the resulting \( 10 \times 2 \) table:

\[
C = \sum_{k=1}^{g} \frac{(O_{1k} - n_k\bar\pi_k)^2}{n_k\bar\pi_k(1-\bar\pi_k)} \overset{\text{approx}}{\sim} \chi^2_{g-2},
\]

where \( O_{1k} \) is the number of events in group \( k \), \( n_k \) is the group size, and \( \bar\pi_k \) is the mean fitted probability. Implemented in `ResourceSelection::hoslem.test()`.

## F.5 Iterative Proportional Fitting for Contingency Tables

For contingency tables with many cells and complex hierarchical log-linear models, **Iterative Proportional Fitting (IPF)** (also called the iterative scaling algorithm) provides an efficient way to compute fitted values without forming the full Poisson regression design matrix. The algorithm exploits the sufficient statistics structure:

For a model with generators \( \{S_1, S_2, \ldots, S_k\} \) (sets of variables whose marginal totals are preserved), IPF cycles through each generator and adjusts the fitted values \( \hat\mu_{ijk\ldots} \) so that the fitted marginal totals equal the observed marginals:

\[
\hat\mu^{(r+1)}_{ijk\ldots} = \hat\mu^{(r)}_{ijk\ldots} \times \frac{y_{s_j}}{\hat\mu^{(r)}_{s_j}}, \quad \text{for each generator } S_j \text{ at iteration } r.
\]

IPF converges to the MLE for log-linear models, and its convergence is guaranteed for hierarchical models when the MLEs exist. For a two-way table under the independence model, IPF converges in one step: \( \hat\mu_{ij} = y_{i\cdot}y_{\cdot j}/y_{\cdot\cdot} \). For the three-way homogeneous association model \( (VW, VZ, WZ) \), IPF requires multiple cycles but converges rapidly.

## F.6 Connection Between Logistic Regression and Discriminant Analysis

Fisher's linear discriminant analysis (LDA) and logistic regression both address binary classification, but from different perspectives:

**LDA** models the class-conditional densities \( f(\mathbf{x} \mid Y = k) \sim N(\boldsymbol{\mu}_k, \boldsymbol{\Sigma}) \) with equal covariance matrices, then applies Bayes' theorem. The resulting decision boundary is linear in \( \mathbf{x} \), and the posterior log odds:

\[
\log\!\frac{P(Y=1|\mathbf{x})}{P(Y=0|\mathbf{x})} = \boldsymbol{\alpha}^\top\mathbf{x} + \alpha_0,
\]

is exactly a logistic regression model with specific coefficients determined by the LDA estimates.

**Logistic regression** models the posterior probabilities directly without specifying the class-conditional distributions. It is more flexible (no normality assumption) but requires more data to estimate reliably.

When the class-conditional distributions are truly Gaussian with equal covariance, LDA is more efficient than logistic regression (LDA uses the information in the joint distribution; logistic regression uses only the conditional). When the Gaussian assumption is violated, logistic regression tends to outperform LDA.

For the birdkeeping/lung cancer example, LDA would require assuming multivariate normality for the joint distribution of age, smoking history, and other predictors — a dubious assumption for binary and count predictors. Logistic regression is clearly preferable here.

## F.7 Score Tests for GLM Specification

The **score test** (Rao 1948) is particularly useful for testing whether a GLM requires an additional term, because it requires fitting only the restricted model (under \( H_0 \)). The test statistic is:

\[
U = \mathbf{S}^\top(\tilde{\boldsymbol{\beta}})\, \mathbf{I}^{-1}(\tilde{\boldsymbol{\beta}})\, \mathbf{S}(\tilde{\boldsymbol{\beta}}) \overset{\text{approx}}{\sim} \chi^2_q,
\]

where \( \tilde{\boldsymbol{\beta}} \) is the restricted MLE (under \( H_0: \boldsymbol{\beta}_B = \mathbf{0} \)).

**Score test for overdispersion.** A standard application is testing \( H_0: \phi = 1 \) (no overdispersion) against the alternative that \( \phi > 1 \). For the Poisson, the score test for overdispersion based on the negative binomial alternative has statistic:

\[
U_\phi = \frac{[\sum_i(y_i - \hat\mu_i)^2/\hat\mu_i - (n-p)]^2}{2(n-p)} \overset{\text{approx}}{\sim} \chi^2_1 \quad \text{under } H_0:\phi=1.
\]

This is a one-sided test (\( \phi > 1 \) only), and the \( p \)-value is \( P(\chi^2_1 > U_\phi)/2 \). For the epilepsy data, \( U_\phi \) is highly significant, confirming substantial overdispersion.

**Score test for link function.** The Pregibon (1980) link test tests whether the chosen link function is correct by augmenting the model with the squared linear predictor \( \hat\eta_i^2 \) and testing its coefficient. Under the correct link, the coefficient should be zero; significant coefficient suggests link misspecification. In R: `glm(y ~ eta_hat + I(eta_hat^2), family = binomial)` where `eta_hat <- predict(mod)`.

## F.8 Empirical Logit and Observed Proportions

Before fitting a logistic regression to grouped data, it is helpful to plot the **empirical logit**:

\[
\tilde\eta_i = \log\!\frac{y_i/m_i}{1 - y_i/m_i} = \log\!\frac{y_i}{m_i - y_i},
\]

against each continuous predictor. If the logistic model with a given predictor is appropriate, this plot should be approximately linear. Cells with \( y_i = 0 \) or \( y_i = m_i \) produce \( \tilde\eta_i = -\infty \) or \( +\infty \) and must be handled by continuity corrections: \( (y_i + 0.5)/(m_i + 1) \).

For the neuroblastoma example, plotting the empirical logits \( \tilde\eta_i \) by stage and age level shows that the logit of the survival probability decreases with stage (especially Stage IV, where \( \tilde\eta \approx -3.4 \)) and increases with younger age at diagnosis, consistent with the fitted model's parameter signs.

The empirical logit plot is a valuable exploratory tool that can reveal: (1) whether the logit scale is appropriate (versus probit or cloglog); (2) whether continuous predictors have linear effects on the logit; (3) potential outlying cells worth investigating before formal model fitting.

---

## Summary Table: Inference Methods for GLMs

The following table summarises when to use each inference method:

| Situation | Recommended method | R function |
|---|---|---|
| Test single coefficient | Wald \( z \)-test | `summary(mod)` |
| Test multiple coefficients jointly | LRT (deviance difference) | `anova(mod0, mod1, test="LRT")` |
| Compare non-nested models | AIC or BIC | `AIC(mod)`, `BIC(mod)` |
| Overdispersion present | Quasi-\( F \) test | `anova(mod0, mod1, test="F")` |
| CI for coefficient | Wald or profile likelihood | `confint.default()`, `confint()` |
| CI for OR/rate ratio | Exponentiated profile CI | `exp(confint(mod))` |
| CI for predicted probability | Delta method on logit scale | Manual calculation |
| Goodness of fit (grouped data) | Deviance or Pearson \( \chi^2 \) | `mod$deviance`, `sum((y-mu.hat)^2/V)` |
| Goodness of fit (binary data) | Hosmer–Lemeshow test | `ResourceSelection::hoslem.test()` |
| Detect outliers/influence | Cook's distance, leverage | `cooks.distance()`, `hatvalues()` |
| Detect overdispersion | Scaled Pearson statistic | `sum((y-mu)^2/V) / (n-p)` |
| Complete separation | Firth's penalised likelihood | `logistf::logistf()` |

---

# Appendix G: Glossary of Key Terms

<div class="definition">
<strong>Canonical link</strong>: The link function obtained by setting the linear predictor equal to the canonical parameter of the exponential family. For the normal, this is the identity link; for the Poisson, the log link; for the binomial, the logit link; for the gamma, the reciprocal link.
</div>

<div class="definition">
<strong>Canonical parameter</strong>: The natural parameter \( \theta \) in the exponential family representation \( f(y|\theta,\phi) = \exp\{(y\theta - b(\theta))/a(\phi) + c(y;\phi)\} \). Related to the mean by \( \mu = b'(\theta) \).
</div>

<div class="definition">
<strong>Cumulant function</strong>: The function \( b(\theta) \) in the exponential family density. Its first derivative gives the mean \( \mu = b'(\theta) \), its second derivative the variance function \( V(\mu) = b''(\theta) \), and higher derivatives give higher-order cumulants.
</div>

<div class="definition">
<strong>Deviance</strong>: \( D = 2[\ell(\tilde{\boldsymbol{\mu}}) - \ell(\hat{\boldsymbol{\mu}})] \), twice the log-likelihood difference between the saturated model (perfect fit) and the fitted model. Under the fitted model, \( D \approx \chi^2_{n-p} \) for large \( n \). Used for both goodness-of-fit tests and comparison of nested models.
</div>

<div class="definition">
<strong>Deviance residual</strong>: \( r_i^D = \mathrm{sign}(y_i - \hat\mu_i)\sqrt{d_i} \), where \( d_i \) is the \( i \)-th deviance contribution. Under the correct model, \( r_i^D \approx N(0,1) \).
</div>

<div class="definition">
<strong>Dispersion parameter</strong>: The parameter \( \phi \) scaling the variance in the exponential family: \( \mathrm{Var}(Y_i) = \phi V(\mu_i)/w_i \). For the Poisson and binomial, \( \phi = 1 \) by assumption. For the normal, \( \phi = \sigma^2 \). For quasi-models, \( \phi \) is estimated from the data.
</div>

<div class="definition">
<strong>Expected information (Fisher information)</strong>: \( \mathcal{I}(\boldsymbol{\beta}) = E[-\partial^2\ell/\partial\boldsymbol{\beta}\partial\boldsymbol{\beta}^\top] = \mathbf{X}\mathbf{W}\mathbf{X}^\top \) for a GLM. Equals the variance of the score: \( \mathcal{I} = \mathrm{Var}(\mathbf{S}) \).
</div>

<div class="definition">
<strong>Exponential family</strong>: A parametric family of distributions sharing the common density form \( \exp\{(y\theta - b(\theta))/a(\phi) + c(y;\phi)\} \). Includes normal, Poisson, binomial, gamma, inverse Gaussian, and many others. Distinguished by the existence of sufficient statistics and the canonical form.
</div>

<div class="definition">
<strong>Generalised Linear Model (GLM)</strong>: A regression model with three components: (1) a random component from the exponential family, (2) a linear predictor \( \eta_i = \mathbf{x}_i^\top\boldsymbol{\beta} \), and (3) a link function \( g(\mu_i) = \eta_i \). Fitted by IRLS (Fisher scoring).
</div>

<div class="definition">
<strong>Hat matrix</strong>: For a GLM, \( \mathbf{H} = \mathbf{W}^{1/2}\mathbf{X}(\mathbf{X}^\top\mathbf{W}\mathbf{X})^{-1}\mathbf{X}^\top\mathbf{W}^{1/2} \). The diagonal elements \( h_{ii} \) are the leverage values. In the normal linear model with identity link, \( \mathbf{H} = \mathbf{X}(\mathbf{X}^\top\mathbf{X})^{-1}\mathbf{X}^\top \).
</div>

<div class="definition">
<strong>IRLS (Iteratively Reweighted Least Squares)</strong>: The algorithm for fitting GLMs. At each step, a weighted least squares problem is solved with working response \( z_i = \hat\eta_i + (y_i - \hat\mu_i)g'(\hat\mu_i) \) and weights \( w_i = [V(\hat\mu_i)(g'(\hat\mu_i))^2]^{-1} \). Equivalent to Fisher scoring.
</div>

<div class="definition">
<strong>Link function</strong>: A smooth monotone function \( g \) mapping the mean \( \mu \) to the linear predictor \( \eta = g(\mu) \). Must have a well-defined inverse \( g^{-1}: \mathbb{R} \to \mathrm{range}(\mu) \). The canonical link uses \( g = (b')^{-1} \).
</div>

<div class="definition">
<strong>Log-likelihood</strong>: \( \ell(\theta; y) = \log L(\theta; y) = \log f(y|\theta) \). For a GLM, \( \ell(\boldsymbol{\beta}; \mathbf{y}) = \sum_i [(y_i\theta_i - b(\theta_i))/a_i(\phi) + c(y_i;\phi)] \).
</div>

<div class="definition">
<strong>Logit link</strong>: \( g(\mu) = \log[\mu/(1-\mu)] \). Canonical link for the binomial. Maps \( (0,1) \to (-\infty, \infty) \). Coefficients have log odds ratio interpretation.
</div>

<div class="definition">
<strong>MLE (Maximum Likelihood Estimator)</strong>: The parameter value \( \hat\theta \) that maximises the likelihood \( L(\theta;y) \). Asymptotically: consistent, efficient (achieves Cramér–Rao bound), and normally distributed.
</div>

<div class="definition">
<strong>Odds ratio</strong>: For groups 1 and 2 with event probabilities \( \pi_1, \pi_2 \): \( \psi = [\pi_1/(1-\pi_1)] / [\pi_2/(1-\pi_2)] \). In logistic regression, \( e^{\beta_j} \) is the odds ratio for a one-unit change in \( x_j \).
</div>

<div class="definition">
<strong>Overdispersion</strong>: When the observed variance exceeds the theoretical variance specified by the GLM family. Diagnosed by \( \hat\phi = X^2/(n-p) \gg 1 \). Addressed by quasi-likelihood, negative binomial, or mixed models.
</div>

<div class="definition">
<strong>Pearson statistic</strong>: \( X^2 = \sum_i (y_i - \hat\mu_i)^2/V(\hat\mu_i) \). Under the fitted model, \( X^2 \approx \chi^2_{n-p} \). The scaled version \( \hat\phi = X^2/(n-p) \) estimates the dispersion.
</div>

<div class="definition">
<strong>Quasi-likelihood</strong>: An estimating equations approach that specifies only the mean function and variance function, without a full distributional assumption. The quasi-score \( Q = (y-\mu)/[V(\mu)\phi] \cdot d\mu/d\boldsymbol{\beta} \) has the same form as the GLM score. The resulting estimator is consistent and asymptotically normal under correct mean and variance specifications.
</div>

<div class="definition">
<strong>Saturated model</strong>: A model with one parameter per observation (\( p = n \)), fitting the data exactly with \( \hat\mu_i = y_i \). Serves as the upper bound in the deviance calculation.
</div>

<div class="definition">
<strong>Score function</strong>: \( \mathbf{S}(\boldsymbol{\beta}) = \partial\ell/\partial\boldsymbol{\beta} \). For a GLM: \( [\mathbf{S}]_j = \sum_i (y_i - \mu_i) w_i (d\eta_i/d\mu_i) x_{ij} \). The MLE solves \( \mathbf{S}(\hat{\boldsymbol{\beta}}) = \mathbf{0} \). Under the canonical link, the score depends on the data only through the sufficient statistics \( \mathbf{X}\mathbf{y} \).
</div>

<div class="definition">
<strong>Variance function</strong>: The function \( V(\mu) = b''(\theta) \) encoding the mean–variance relationship in the exponential family: \( \mathrm{Var}(Y) = \phi V(\mu)/w \). Determines the GLM family: \( V=1 \) for normal, \( V=\mu \) for Poisson, \( V=\mu(1-\mu) \) for binomial, \( V=\mu^2 \) for gamma, \( V=\mu^3 \) for inverse Gaussian.
</div>

<div class="definition">
<strong>Working response</strong>: \( z_i = \eta_i + (y_i - \mu_i)g'(\mu_i) \). The pseudo-dependent variable in the weighted least squares step of IRLS. At convergence, the IRLS residuals \( z_i - \hat\eta_i \) equal the working residuals.
</div>
