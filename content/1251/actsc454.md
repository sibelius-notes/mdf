---
title: "ACTSC 454: Longevity and Mortality Using Predictive Analytics"
prof: "Emily Kozlowski"
subjects: "ACTSC"
---

## Sources and References

- **Primary textbook** — Klein, J.P., Moeschberger, M.L. *Survival Analysis: Techniques for Censored and Truncated Data*, 2nd ed., Springer, 2003.
- **Supplementary texts** — Dickson, D.C.M., Hardy, M.R., Waters, H.R. *Actuarial Mathematics for Life Contingent Risks*, 3rd ed., Cambridge University Press, 2020 (Chapters 18–19); Klugman, S.A., Panjer, H.H., Willmot, G.E. *Loss Models*, 5th ed., Wiley, 2019; Pitacco, E., Denuit, M., Haberman, S., Olivieri, A. *Modelling Longevity Dynamics for Pensions and Annuity Business*, Oxford University Press, 2009; Cairns, A.J.G., Blake, D., Dowd, K. "A Two-Factor Model for Stochastic Mortality with Parameter Uncertainty," *Journal of Risk and Insurance*, 2006.
- **Online resources** — Society of Actuaries Mortality Improvement Scale documents (MP-2014, MP-2021); Human Mortality Database (mortality.org); Continuous Mortality Investigation (CMI) Bureau working papers; Hyndman lecture notes on demographic forecasting.

# Chapter 1: Survival Data, Censoring, and Truncation

Longevity and mortality analysis begins with the recognition that lifetime data are rarely observed completely. A subject may leave the study before dying, be enrolled only after reaching a particular age, or be observed only through a window of calendar time. These features motivate the formal machinery of censoring and truncation, which distinguishes survival analysis from classical statistics.

## Types of Censoring

Let \(T\) denote a non-negative random variable representing time until death (or some other event). The survival function is \(S(t) = \Pr(T > t)\) and the hazard function is \(\mu(t) = f(t)/S(t)\), with cumulative hazard \(H(t) = -\ln S(t)\). Censoring describes the situation in which a subject's exact lifetime is not observed, but a bound on it is known.

**Right censoring** — the most common form — occurs when the study ends, the subject withdraws, or a competing event removes the subject from observation while they are still alive. The observed data for individual \(i\) are the pair \((T_i, \delta_i)\), where \(T_i = \min(X_i, C_i)\) is the minimum of the true lifetime \(X_i\) and the censoring time \(C_i\), and \(\delta_i = \mathbb{1}\{X_i \leq C_i\}\) is the death indicator.

**Left censoring** arises when an event is known to have occurred before observation began, but the exact time is unknown. For example, a dementia study might record that a subject already had symptoms at enrollment, without knowing when they first appeared.

**Interval censoring** occurs when the event is known only to lie between two observation times \((L, R)\). This is typical of studies with periodic follow-up visits: if a subject is alive at visit \(k\) but dead at visit \(k+1\), the death time is only known to lie in that interval.

## Truncation and Risk Sets

Truncation differs from censoring in that the subject is entirely unobserved outside a certain region. **Left truncation**, also called delayed entry, is critical in actuarial applications: a life insurance policyholder only enters the data at the age of policy issue, so any death before that age is invisible. Conditional on being observed, the distribution used for likelihood must condition on \(T > L_i\), where \(L_i\) is the entry age.

The **risk set** at time \(t\), denoted \(R(t)\), is the collection of individuals under observation and still alive just before \(t\). With left truncation, a subject contributes to \(R(t)\) only for \(t \in [L_i, T_i]\). Most nonparametric estimators depend on \(R(t)\) only through its size \(n(t) = |R(t)|\) and the number of events \(d(t)\) occurring at \(t\).

<div class="definition">
<strong>Definition (Survival and Hazard).</strong> The survival function <em>S(t)</em> and hazard <em>&mu;(t)</em> of a lifetime <em>T &ge; 0</em> satisfy <em>S(t) = exp(-H(t))</em> where <em>H(t) = &int;<sub>0</sub><sup>t</sup> &mu;(s) ds</em>. Equivalently, the density is <em>f(t) = &mu;(t) S(t)</em>. Under right censoring and left truncation, the observed data consist of triples <em>(L<sub>i</sub>, T<sub>i</sub>, &delta;<sub>i</sub>)</em> with <em>L<sub>i</sub> &le; T<sub>i</sub></em>.
</div>

<div class="example">
<strong>Example.</strong> Consider five lives entering a mortality study at ages 60, 62, 65, 68, and 70. By the end of the 10-year study window, death times (measured from age 60 in years) are recorded as 4, 7+, 9, 11+, and 6, where a plus indicates censoring. The risk sets at event times <em>t = 4, 6, 9</em> have sizes <em>n(4) = 5</em>, <em>n(6) = 4</em>, and <em>n(9) = 2</em> respectively, after accounting for withdrawals and staggered entry. Note that the life entering at age 68 has left truncation <em>L = 8</em>, so they are not in the risk set for <em>t &lt; 8</em>.
</div>

# Chapter 2: Empirical Estimation of Survival Functions

Nonparametric estimators of the survival function make no assumption on the shape of \(S\) and form the backbone of descriptive mortality analysis. The two leading estimators — Kaplan–Meier and Nelson–Aalen — rest on the same risk-set logic but treat discrete jumps differently.

## The Kaplan–Meier Estimator

Suppose events occur at the ordered times \(t_1 < t_2 < \cdots < t_k\), with \(d_i\) deaths at time \(t_i\) and risk set size \(n_i\). The Kaplan–Meier (product-limit) estimator of \(S(t)\) is

\[\hat S(t) = \prod_{t_i \leq t}\left(1 - \frac{d_i}{n_i}\right).\]

It is the nonparametric maximum-likelihood estimator of \(S\) under right censoring. The conditional survival probability through each event time, \(1 - d_i/n_i\), is an empirical estimate of the one-step survival. Between event times, \(\hat S\) is constant, producing the characteristic step function. When the largest observation is censored, \(\hat S\) does not drop to zero; when it is a death, it does.

## The Nelson–Aalen Estimator

An alternative is the Nelson–Aalen estimator of the cumulative hazard,

\[\hat H(t) = \sum_{t_i \leq t}\frac{d_i}{n_i},\]

from which one obtains \(\hat S_{NA}(t) = e^{-\hat H(t)}\). The two estimators satisfy \(\hat S_{KM}(t) \approx \exp(-\hat H_{NA}(t))\) for small hazards, since \(\log(1 - x) \approx -x\) when \(x\) is small. In practice Nelson–Aalen tends to be slightly larger than Kaplan–Meier, because \(-\log(1-x) > x\). The Nelson–Aalen estimator is preferred when hazard estimation is the goal or when sample sizes are small and the product form is unstable.

## Greenwood's Variance and Confidence Intervals

The variance of \(\hat S(t)\) is estimated by Greenwood's formula

\[\widehat{\mathrm{Var}}(\hat S(t)) = [\hat S(t)]^2 \sum_{t_i \leq t}\frac{d_i}{n_i(n_i - d_i)}.\]

A naive Wald confidence interval \(\hat S(t) \pm z_{1-\alpha/2}\sqrt{\widehat{\mathrm{Var}}(\hat S(t))}\) may stray outside \([0,1]\). Two remedies are standard.

The **log-transformed interval** uses \(\log \hat S(t)\) and back-transforms:

\[\hat S(t)^{\exp(\pm z_{1-\alpha/2}\,\sigma_L(t)/\log\hat S(t))},\]

where \(\sigma_L^2(t) = \widehat{\mathrm{Var}}(\hat S(t))/[\hat S(t)]^2\). The **log–log interval**, based on \(\log(-\log \hat S(t))\), is

\[\hat S(t)^{\exp(\mp z_{1-\alpha/2}\,\sigma_L(t)/\log\hat S(t))},\]

and has the advantage that both endpoints always lie in \((0,1)\). The log–log transform is preferred in the tails, where \(\hat S(t)\) is close to zero and symmetric intervals distort badly.

## Kernel Density Estimation of the Hazard

While \(\hat H\) is a step function, the hazard \(\mu(t) = H'(t)\) is not directly estimable without smoothing. A kernel estimator replaces each jump \(\Delta \hat H(t_i) = d_i/n_i\) by a smooth bump of bandwidth \(b\):

\[\hat \mu(t) = \frac{1}{b}\sum_{t_i \leq \tau} K\!\left(\frac{t - t_i}{b}\right)\frac{d_i}{n_i},\]

where \(K\) is a symmetric kernel (Epanechnikov, biweight, Gaussian). The bandwidth \(b\) trades bias against variance; cross-validation or plug-in rules select it. Kernel hazards are indispensable for drawing smooth mortality curves from raw data.

<div class="theorem">
<strong>Theorem (Asymptotic Normality of Kaplan&ndash;Meier).</strong> Under mild regularity and independent censoring, for any fixed <em>t</em> at which <em>S(t) &gt; 0</em>,

<em>&radic;n (S&#770;(t) - S(t)) &rarr; N(0, &sigma;&sup2;(t))</em>

in distribution, with <em>&sigma;&sup2;(t)</em> consistently estimated by Greenwood's formula scaled by <em>n</em>. The proof proceeds via the martingale central limit theorem applied to the counting process <em>N(t) = &sum;<sub>i</sub> &delta;<sub>i</sub> 1{T<sub>i</sub> &le; t}</em>.
</div>

<div class="example">
<strong>Example.</strong> A portfolio of 100 annuitants is followed for 5 years. Deaths occur at times <em>t = 1.2, 2.5, 3.1, 4.0</em> with <em>d = 2, 3, 1, 2</em> and risk set sizes <em>n = 100, 95, 90, 85</em>. The Kaplan&ndash;Meier values are 0.9800, 0.9491, 0.9385, 0.9164. The Nelson&ndash;Aalen cumulative hazards are 0.0200, 0.0516, 0.0627, 0.0862, yielding <em>S&#770;<sub>NA</sub>(4) = exp(-0.0862) = 0.9174</em>, close to the product-limit figure. Greenwood's formula at <em>t = 4</em> gives standard error approximately 0.028, so a 95 percent log&ndash;log CI is roughly (0.845, 0.955).
</div>

# Chapter 3: Cox Proportional Hazards Model

When the analyst wishes to attach covariates to a lifetime distribution, the Cox proportional hazards model offers a semiparametric framework of striking elegance. It decomposes the hazard into a baseline function of time multiplied by a covariate-dependent scale.

## Model Specification

For a subject with covariate vector \(\mathbf{x}\), the hazard is

\[h(t \mid \mathbf{x}) = h_0(t)\,\exp(\boldsymbol\beta^\top \mathbf{x}),\]

where \(h_0(t)\) is an unspecified baseline hazard and \(\boldsymbol\beta\) is the coefficient vector. The defining feature is that the ratio \(h(t \mid \mathbf{x}_1)/h(t \mid \mathbf{x}_2) = \exp(\boldsymbol\beta^\top(\mathbf{x}_1 - \mathbf{x}_2))\) does not depend on \(t\): hazards are proportional through time. A one-unit increase in a covariate multiplies the hazard by \(e^{\beta_j}\), the **hazard ratio**.

## Partial Likelihood

The genius of Cox's approach is that \(\boldsymbol\beta\) can be estimated without specifying \(h_0\). Conditional on the risk set \(R(t_i)\) at an event time \(t_i\), the probability that the actual death is subject \(i\) is

\[\frac{e^{\boldsymbol\beta^\top \mathbf{x}_i}}{\sum_{j \in R(t_i)} e^{\boldsymbol\beta^\top \mathbf{x}_j}}.\]

Multiplying across all event times gives the **partial likelihood**

\[L(\boldsymbol\beta) = \prod_{i : d_i = 1}\frac{e^{\boldsymbol\beta^\top \mathbf{x}_i}}{\sum_{j \in R(t_i)} e^{\boldsymbol\beta^\top \mathbf{x}_j}}.\]

Maximising \(\log L\) numerically yields \(\hat{\boldsymbol\beta}\); the observed information matrix provides standard errors. The baseline cumulative hazard is then estimated by the **Breslow estimator**

\[\hat H_0(t) = \sum_{t_i \leq t}\frac{d_i}{\sum_{j \in R(t_i)} e^{\hat{\boldsymbol\beta}^\top \mathbf{x}_j}}.\]

## Extensions

Time-varying covariates are incorporated by letting \(\mathbf{x}\) depend on \(t\); the risk-set sums are recomputed at each event. **Stratification** allows different baseline hazards for subgroups (e.g., smokers versus non-smokers) while sharing \(\boldsymbol\beta\) — useful when proportionality fails for a categorical factor.

<div class="definition">
<strong>Definition (Proportional Hazards Assumption).</strong> A regression model satisfies proportional hazards if for any two covariate vectors, the ratio of hazards is constant in <em>t</em>. Graphical checks plot <em>log(-log S&#770;(t))</em> across subgroups: parallel curves support proportionality, crossing or diverging curves contradict it.
</div>

<div class="example">
<strong>Example.</strong> In a life insurance dataset, let <em>x<sub>1</sub></em> be smoker status (1 = smoker) and <em>x<sub>2</sub></em> be age at issue minus 50. Fitted Cox coefficients are <em>&beta;&#770;<sub>1</sub> = 0.60</em> and <em>&beta;&#770;<sub>2</sub> = 0.07</em>. A smoker aged 60 has hazard <em>exp(0.60 + 0.70) = e<sup>1.30</sup> &asymp; 3.67</em> times that of a non-smoker aged 50. A premium loading of 267 percent above base, or equivalently an additional 2670 dollars on a 1000-dollar base premium, could be justified by such a hazard ratio before adjusting for selection effects.
</div>

# Chapter 4: Parametric Mortality Models and Graduation

Insurance applications demand a single mortality table \(\{q_x\}\) indexed by integer age. Raw crude rates \(D_x / E_x\) are noisy, especially at older ages with few exposures. The process of smoothing crude rates into a regular sequence is called **graduation**, and the underlying statistical machinery rests on the binomial and Poisson models of death counts.

## Binomial Model

Assume that \(E_x\) lives are observed through age \([x, x+1]\), with each life independently dying with probability \(q_x\) during the year. Then

\[D_x \sim \mathrm{Binomial}(E_x, q_x), \quad \hat q_x = D_x/E_x.\]

Here \(E_x\) is the **initial exposure**, counting each life as a full year of exposure regardless of whether they died mid-year. The variance is \(E_x q_x (1-q_x)\). This model is conceptually simple but requires that every life be observed for the entire age interval, which is unrealistic under withdrawals.

## Poisson Model

Letting \(E^c_x\) denote **central exposure** — the total person-years actually lived between ages \(x\) and \(x+1\) — and assuming a constant force of mortality \(\mu_x\) across the year,

\[D_x \sim \mathrm{Poisson}(E^c_x \mu_x), \quad \hat\mu_x = D_x/E^c_x.\]

The maximum-likelihood estimator has standard error \(\sqrt{D_x}/E^c_x\). Under the constant-force assumption, \(q_x = 1 - e^{-\mu_x}\). The Poisson model handles withdrawals naturally because each life contributes only the time it was actually observed.

The two exposure concepts are related approximately by \(E^c_x \approx E_x - \tfrac12 D_x\) when deaths are assumed to occur uniformly through the year, or more generally by careful bookkeeping of withdrawals and new entrants.

## Parametric Mortality Laws

Several analytic families are used to describe how \(\mu_x\) varies with age:

- **Gompertz law**: \(\mu_x = B c^x\), capturing exponential ageing.
- **Makeham law**: \(\mu_x = A + B c^x\), adding a constant accidental term.
- **Heligman–Pollard** 8-parameter law:

\[\frac{q_x}{p_x} = A^{(x+B)^C} + D\,e^{-E(\ln(x/F))^2} + G H^x.\]

The Heligman–Pollard form decomposes mortality into three components: infant and childhood mortality (first term), an adult accident hump centred near young adult ages (second term), and senescent Gompertz ageing (third term). Each parameter has an interpretable role.

## Spline and Whittaker–Henderson Graduation

When no parametric form is imposed, the graduated values \(\{\dot q_x\}\) are chosen to balance fidelity to the data against smoothness. The **Whittaker–Henderson** penalty minimises

\[\sum_x w_x (\dot q_x - \hat q_x)^2 + h\sum_x (\Delta^z \dot q_x)^2,\]

where \(\Delta^z\) is the \(z\)-th finite difference (usually \(z = 3\)) and \(h\) is a smoothing parameter. Larger \(h\) gives smoother graduations. Cubic or P-splines offer similar flexibility with a basis-expansion interpretation.

## Tests of Fit

After graduation, the analyst checks whether the smoothed rates \(\dot q_x\) are statistically consistent with the data. Common tests include:

- **Chi-square test**: compute \(\sum_x (D_x - E_x \dot q_x)^2/[E_x \dot q_x (1 - \dot q_x)]\) and compare to \(\chi^2\) with degrees of freedom equal to the number of age cells minus parameters estimated.
- **Signs test**: count the number of ages where the crude rate exceeds the graduated rate; under the null this count is binomial with parameter 0.5.
- **Runs test** (Stevens test): count the runs of consecutive positive or negative deviations; too few runs indicates clumping, too many indicates alternation.
- **Serial correlation test**: correlation of standardised deviations at lag 1.

<div class="example">
<strong>Example.</strong> For ages 65 to 69 the central exposures are 1200, 1150, 1100, 1050, 1000 and the observed deaths are 18, 20, 22, 26, 29. The Poisson MLEs of the force are 0.01500, 0.01739, 0.02000, 0.02476, 0.02900, and the corresponding <em>q<sub>x</sub> = 1 - exp(-&mu;<sub>x</sub>)</em> are approximately 0.01489, 0.01724, 0.01980, 0.02446, 0.02858. Fitting Gompertz <em>&mu;<sub>x</sub> = B c<sup>x</sup></em> by log-linear regression gives <em>c &asymp; 1.17</em> and <em>B &asymp; 1.6 &times; 10<sup>-7</sup></em>, in line with typical adult ageing coefficients.
</div>

# Chapter 5: MLE for Markov Multi-State Mortality

Many actuarial products involve more than a simple alive/dead dichotomy: think of disability income (healthy, disabled, dead), critical illness (healthy, diagnosed, dead), or long-term care models with multiple impairment levels. These are described by Markov multi-state models with transition intensities \(\mu^{ij}_t\) between states \(i\) and \(j\).

## The Multi-State Likelihood

Let \(N^{ij}(t)\) denote the count of transitions from \(i\) to \(j\) by time \(t\), and \(v^i_t\) the number of lives in state \(i\) at time \(t\). Under the assumption of piecewise-constant intensities \(\mu^{ij}\), the log-likelihood contribution is

\[\ell(\mu^{ij}) = N^{ij}\log\mu^{ij} - \mu^{ij}\int v^i_t\,dt,\]

summed over all transition types. Maximising gives the natural estimator

\[\hat\mu^{ij} = \frac{N^{ij}}{\int v^i_t\,dt},\]

which generalises the Poisson force estimator to the multi-state setting. The denominator \(\int v^i_t\,dt\) is the total person-time spent in state \(i\), a direct multi-state analogue of central exposure.

## Poisson Approximation

Because transitions out of state \(i\) at rate \(\mu^{ij}\) on a population of total exposure \(E^i = \int v^i_t\,dt\) yield \(N^{ij} \sim \mathrm{Poisson}(\mu^{ij} E^i)\) (approximately, under independence), standard errors follow the Poisson form: \(\mathrm{se}(\hat\mu^{ij}) = \sqrt{\hat\mu^{ij}/E^i} = \sqrt{N^{ij}}/E^i\). Confidence intervals, hypothesis tests on intensities, and likelihood-ratio comparisons of nested models all proceed as in standard GLM theory.

The framework accommodates competing risks (multiple absorbing states), reversible transitions (e.g., recovery from disability), and duration-dependent intensities via time-since-entry as a covariate.

<div class="theorem">
<strong>Theorem (MLE for piecewise-constant intensities).</strong> Let data on a Markov chain with states <em>1, ..., n</em> be observed over a time interval. Assume within each age band <em>[x, x+1)</em> the transition intensities are constant. Then the maximum-likelihood estimator of <em>&mu;<sup>ij</sup><sub>x</sub></em> is <em>N<sup>ij</sup><sub>x</sub> / E<sup>i</sup><sub>x</sub></em>, and conditional on exposures, <em>N<sup>ij</sup><sub>x</sub></em> has an approximate Poisson distribution with mean <em>&mu;<sup>ij</sup><sub>x</sub> E<sup>i</sup><sub>x</sub></em>.
</div>

<div class="example">
<strong>Example.</strong> A disability income portfolio records total time in the healthy state of 5000 person-years for ages 55&ndash;60. During that exposure there are 40 transitions to disabled and 25 transitions to dead-from-healthy. The MLE intensities are <em>&mu;&#770;<sup>HD</sup> = 40/5000 = 0.008</em> and <em>&mu;&#770;<sup>HX</sup> = 25/5000 = 0.005</em>, with standard errors <em>&radic;40/5000 &asymp; 0.00126</em> and <em>&radic;25/5000 = 0.001</em>. A 95 percent CI for the disability incidence rate is roughly (0.0055, 0.0105).
</div>

# Chapter 6: Longevity Risk and Stochastic Mortality

Insurance and pension liabilities extending over decades are sensitive to *changes* in mortality, not merely its current level. Since the 1950s developed-country mortality has declined steadily, especially at older ages, producing substantial longevity risk: the risk that people live longer than anticipated, increasing the cost of life annuities, defined-benefit pensions, and longevity-indexed reinsurance treaties.

## Deterministic Mortality Improvement

The simplest approach projects a base-year table forward using improvement factors. Let \(q_{x,0}\) denote the base rate and \(\phi_{x,s}\) the one-year improvement in year \(s\). Then

\[q_{x,t} = q_{x,0}\prod_{s=1}^{t}(1 - \phi_{x,s}).\]

Two-dimensional improvement scales such as **Scale BB**, **MP-2014**, **MP-2021**, and the Canadian **CPM2014** publish tables of \(\phi_{x,s}\) varying by age and calendar year. The improvement structure may include a cohort component (lives born in the same year share a common improvement), as in the Continuous Mortality Investigation CMI Model used in the United Kingdom.

Deterministic scales are easy to implement and communicate, but they provide only a central projection and do not quantify uncertainty. For solvency capital or reinsurance pricing, a stochastic model is essential.

## The Lee–Carter Model

The Lee–Carter (1992) model is the canonical stochastic mortality model. It assumes

\[\log m_{x,t} = a_x + b_x k_t + \epsilon_{x,t},\]

where \(m_{x,t}\) is the central death rate at age \(x\) in year \(t\), \(a_x\) is an age-specific average log-rate, \(k_t\) is a time index capturing overall mortality level, and \(b_x\) describes how strongly each age responds to changes in \(k_t\). Identification is pinned down by the constraints \(\sum_x b_x = 1\) and \(\sum_t k_t = 0\).

Estimation proceeds by setting \(\hat a_x\) equal to the mean of \(\log m_{x,t}\) over \(t\), then extracting the first singular vector of the demeaned matrix by **singular value decomposition**. The resulting \(\hat k_t\) is a unidimensional summary of period mortality which is then forecast with an ARIMA model (typically a random walk with drift) to produce projections and prediction intervals.

## The Cairns–Blake–Dowd Model

For older ages, where the accident hump is absent and mortality rises almost linearly in log-odds space, Cairns, Blake, and Dowd (2006) proposed the two-factor model

\[\mathrm{logit}\,q_{x,t} = \kappa^{(1)}_t + (x - \bar x)\,\kappa^{(2)}_t,\]

where \(\bar x\) is the mean age in the fit and \(\kappa^{(1)}_t, \kappa^{(2)}_t\) follow a bivariate random walk with drift. \(\kappa^{(1)}\) measures the overall level and \(\kappa^{(2)}\) the slope (the spread between young-old and old-old mortality). Unlike Lee–Carter, CBD has no age-specific \(b_x\), which both simplifies estimation and avoids overfitting when only older ages are modelled.

Extensions add cohort effects (CBD-X), quadratic age terms (M7), or additional period factors. The choice between models is typically made by out-of-sample forecast accuracy on held-back calendar years.

## Comparison and Longevity Risk Transfer

Lee–Carter is flexible across the full age range but imposes perfectly correlated innovations across ages; CBD is parsimonious and well-suited to ages 60+, with a transparent interpretation of level and slope shocks. Both permit Monte Carlo simulation of future liabilities to compute value at risk and conditional tail expectation on annuity books.

Longevity risk is increasingly transferred to capital markets via **longevity bonds** (coupons indexed to a survivor fraction of a reference cohort), **longevity swaps** (fixed payments exchanged for realised annuity payments), and **index-based reinsurance** tied to published population mortality. Pricing such instruments requires a stochastic model, a risk-neutral adjustment, and calibration to available market prices.

<div class="definition">
<strong>Definition (Longevity Risk).</strong> Longevity risk is the risk that realised survival probabilities exceed those assumed in the pricing or reserving of life-contingent liabilities. It decomposes into <em>trend risk</em> (the expected rate of improvement is mis-estimated), <em>volatility risk</em> (year-to-year noise around the trend), and <em>catastrophe / level risk</em> (large unexpected shocks, such as a medical breakthrough).
</div>

<div class="example">
<strong>Example.</strong> Suppose base mortality at age 70 is <em>q<sub>70,0</sub> = 0.015</em> and the improvement scale predicts <em>&phi;<sub>70,s</sub> = 0.015</em> per year for the next 20 years. Then <em>q<sub>70,20</sub> = 0.015 &times; (0.985)<sup>20</sup> &asymp; 0.01109</em>, a 26 percent reduction. An annuity paying 10000 dollars per year to a life now aged 70 has expected present value increased by roughly 3 to 4 percent under this projection compared with no improvement, illustrating the leverage of longevity on long-dated liabilities. Stochastic Lee&ndash;Carter simulation of the same contract might show a 99th-percentile liability 10 to 15 percent above the deterministic figure, quantifying the economic capital attributable to trend and volatility longevity risk together.
</div>
