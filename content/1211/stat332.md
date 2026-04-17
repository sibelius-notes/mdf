---
title: "STAT 332: Sampling and Experimental Design"
subjects: "STAT"
prof: "Riley Metzger"
---

## Sources and References

**Primary notes** — Cameron Roopnarine (Hextical), *STAT 332: Sampling and Experimental Design, Winter 2021*, [hextical.github.io/university-notes](https://hextical.github.io/university-notes/)
**Textbooks** — Lohr, *Sampling: Design and Analysis*, 3rd Edition (2022); Särndal, Swensson, and Wretman, *Model Assisted Survey Sampling* (1992)

---

# Chapter 1: Introduction to Survey Sampling

The goal of survey sampling is to learn about a finite population by observing only a subset of its units. This chapter establishes the conceptual framework (populations, samples, errors) and introduces the Horvitz-Thompson estimator, the foundational tool of design-based inference.

## 1.1 The PPDAC Framework

Every statistical investigation follows five stages: **Problem**, **Plan**, **Data**, **Analysis**, **Conclusion**.

1. **Problem.** Identify the question and the **target population** (TP) --- the group about which information is sought. The **response** is the quantity each unit provides, and the **attribute** is the summary of interest (e.g., the population mean).

2. **Plan.** Specify the **study population** (SP), which is the set of units that *can* actually be observed. The SP need not equal the TP; for example, a drug study may target humans but observe mice. A **sample** is a subset of the SP drawn according to a well-defined protocol.

3. **Data.** Collect the observations according to the plan.

4. **Analysis.** Apply statistical methods to the data.

5. **Conclusion.** Relate findings back to the original problem, being mindful of three common errors:
   - **Study error**: the attribute of the TP differs from that of the SP.
   - **Sampling error**: the sample statistic differs from the population parameter.
   - **Measurement error**: what we *want* to measure differs from what we *actually* measure.

## 1.2 Finite Populations and Basic Quantities

<div class="definition">
<strong>Definition (Finite Population).</strong> A <strong>finite population</strong> (or frame) is a set \(U = \{1, 2, \ldots, N\}\) of \(N\) identifiable units. Associated with unit \(i\) is a fixed, non-random value \(y_i\).
</div>

The two most important population quantities are the **population mean** and the **population variance**:

\[
\mu = \frac{1}{N}\sum_{i=1}^{N} y_i, \qquad \sigma^2 = \frac{\sum_{i=1}^{N}(y_i - \mu)^2}{N-1}.
\]

Note that the population variance uses \(N-1\) in the denominator, following the convention in Lohr (2022). The **population total** is \(\tau = N\mu = \sum_{i=1}^{N} y_i\).

When \(y_i \in \{0,1\}\), the population mean becomes a **population proportion**:

\[
\pi = \frac{1}{N}\sum_{i=1}^{N} y_i.
\]

## 1.3 Samples, Inclusion Probabilities, and Sampling Designs

<div class="definition">
<strong>Definition (Sample and Sampling Design).</strong> A <strong>sample</strong> \(\mathcal{S}\) is a subset of \(U\) of size \(n \leq N\). A <strong>sampling design</strong> (or sampling protocol) is a probability distribution over all possible samples, specifying \(P(\mathcal{S})\) for every admissible \(\mathcal{S}\).
</div>

<div class="definition">
<strong>Definition (Inclusion Probabilities).</strong> The <strong>first-order inclusion probability</strong> of unit \(i\) is

\[
\pi_i = P(i \in \mathcal{S}) = \sum_{\mathcal{S} \ni i} P(\mathcal{S}).
\]
The <strong>second-order inclusion probability</strong> for units \(i\) and \(j\) is

\[
\pi_{ij} = P(i \in \mathcal{S} \text{ and } j \in \mathcal{S}).
\]
Note that \(\pi_{ii} = \pi_i\).
</div>

It is useful to introduce a **sample membership indicator**:

\[
I_i = \begin{cases} 1 & \text{if unit } i \text{ is in the sample,} \\ 0 & \text{otherwise.} \end{cases}
\]
Then \(E[I_i] = \pi_i\), \(\text{Var}(I_i) = \pi_i(1-\pi_i)\), and \(\text{Cov}(I_i, I_j) = \pi_{ij} - \pi_i \pi_j\) for \(i \neq j\).

## 1.4 The Horvitz-Thompson Estimator

The cornerstone of design-based inference is the Horvitz-Thompson (HT) estimator for the population total:

<div class="theorem">
<strong>Theorem (Horvitz-Thompson Estimator).</strong> Suppose every unit has \(\pi_i > 0\). The HT estimator of the population total \(\tau = \sum_{i=1}^{N} y_i\) is

\[
\hat{\tau}_{\text{HT}} = \sum_{i \in \mathcal{S}} \frac{y_i}{\pi_i} = \sum_{i=1}^{N} \frac{I_i\, y_i}{\pi_i}.
\]
This estimator is <strong>design-unbiased</strong>:

\[
E[\hat{\tau}_{\text{HT}}] = \sum_{i=1}^{N} \frac{y_i}{\pi_i}\, E[I_i] = \sum_{i=1}^{N} y_i = \tau.
\]
</div>

The corresponding HT estimator of the population mean is \(\hat{\mu}_{\text{HT}} = \hat{\tau}_{\text{HT}} / N\).

<div class="theorem">
<strong>Theorem (Variance of the HT Estimator).</strong> The design variance of \(\hat{\tau}_{\text{HT}}\) is

\[
\text{Var}(\hat{\tau}_{\text{HT}}) = \sum_{i=1}^{N}\sum_{j=1}^{N} (\pi_{ij} - \pi_i \pi_j)\,\frac{y_i}{\pi_i}\,\frac{y_j}{\pi_j}.
\]
</div>

This framework applies to any probability sampling design. The following chapters specialize it to particular designs.

---

# Chapter 2: Simple Random Sampling

Simple random sampling without replacement (SRSWOR, or simply SRS) is the most fundamental probability sampling design. Every subset of size \(n\) is equally likely.

## 2.1 Definition and Inclusion Probabilities

<div class="definition">
<strong>Definition (SRS).</strong> In <strong>simple random sampling without replacement</strong>, each of the \(\binom{N}{n}\) possible samples of size \(n\) is selected with equal probability:

\[
P(\mathcal{S}) = \frac{1}{\binom{N}{n}}.
\]
</div>

Under SRS, the first-order inclusion probability for every unit is

\[
\pi_i = \frac{\binom{N-1}{n-1}}{\binom{N}{n}} = \frac{n}{N},
\]
and the second-order inclusion probability is

\[
\pi_{ij} = \frac{\binom{N-2}{n-2}}{\binom{N}{n}} = \frac{n(n-1)}{N(N-1)}, \quad i \neq j.
\]

## 2.2 The HT Estimator under SRS

Since every \(\pi_i = n/N\), the HT estimator of the total simplifies to

\[
\hat{\tau}_{\text{HT}} = \sum_{i \in \mathcal{S}} \frac{y_i}{n/N} = N \bar{y},
\]
and the HT estimator of the mean is just the sample mean:

\[
\hat{\mu}_{\text{HT}} = \bar{y} = \frac{1}{n}\sum_{i \in \mathcal{S}} y_i.
\]

## 2.3 Estimating Means, Totals, and Proportions

The sample mean \(\bar{y}\) is an unbiased estimator of \(\mu\), and \(N\bar{y}\) is an unbiased estimator of \(\tau\).

<div class="theorem">
<strong>Theorem (Variance of the Sample Mean under SRS).</strong>

\[
\text{Var}(\bar{y}) = \left(1 - \frac{n}{N}\right)\frac{\sigma^2}{n},
\]
where \(\sigma^2 = \frac{1}{N-1}\sum_{i=1}^{N}(y_i - \mu)^2\) is the population variance and \(f = n/N\) is the <strong>sampling fraction</strong>. The factor \((1 - n/N)\) is the <strong>finite population correction</strong> (fpc).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Write \(\bar{y} = \sum_{i=1}^{N} I_i y_i / n\). Then

\[
\text{Var}(\bar{y}) = \frac{1}{n^2}\left[\sum_{i=1}^{N} y_i^2\,\text{Var}(I_i) + \sum_{i \neq j} y_i y_j\,\text{Cov}(I_i, I_j)\right].
\]
Substituting \(\text{Var}(I_i) = \frac{n}{N}\bigl(1 - \frac{n}{N}\bigr)\) and \(\text{Cov}(I_i,I_j) = \frac{n(n-1)}{N(N-1)} - \frac{n^2}{N^2}\), algebraic simplification yields the result.
</div>

An unbiased estimator of the variance is

\[
\widehat{\text{Var}}(\bar{y}) = \left(1 - \frac{n}{N}\right)\frac{s^2}{n}, \qquad s^2 = \frac{\sum_{i \in \mathcal{S}}(y_i - \bar{y})^2}{n-1}.
\]

For **proportions**, when \(y_i \in \{0,1\}\), the sample proportion \(\hat{\pi} = \bar{y}\) estimates \(\pi\), with

\[
\hat{\sigma}^2 = \frac{n}{n-1}\hat{\pi}(1-\hat{\pi}) \quad \text{(for large } n \text{, approximately } \hat{\pi}(1-\hat{\pi})).
\]

## 2.4 Sample Size Determination

To guarantee a margin of error \(E\) at confidence level \(1-\alpha\), set

\[
E = c\,\frac{\hat{\sigma}}{\sqrt{n}}\sqrt{1 - \frac{n}{N}},
\]
where \(c = z_{\alpha/2}\). Solving for \(n\):

\[
n = \left(\frac{E^2}{c^2 \sigma^2} + \frac{1}{N}\right)^{-1}.
\]

<div class="remark">
If \(N\) is very large (or the population is effectively infinite), the fpc is negligible and the formula reduces to \(n = c^2 \sigma^2 / E^2\), which is the standard infinite-population result.
</div>

For proportions, the worst-case variance is maximized at \(\hat{\pi} = 1/2\), so a conservative sample size uses \(\hat{\sigma}^2 = 1/4\).

<div class="example">
<strong>Example.</strong> A class has \(N = 200\) students. A preliminary sample gives \(\hat{\sigma} = 3\). For a 95% CI with margin of error \(E = 0.1\):

\[
n = \left(\frac{0.1^2}{1.96^2 \cdot 3^2} + \frac{1}{200}\right)^{-1} \approx 190.
\]
Without the fpc (treating \(N \to \infty\)), one would need \(n = 1.96^2 \cdot 9 / 0.01 = 3458\), a vast overestimate.
</div>

## 2.5 CLT for Finite Populations and Confidence Intervals

Under SRS, as \(n\) and \(N\) both grow (with \(n/N \to f \in (0,1)\)), the sample mean is asymptotically normal:

\[
\frac{\bar{y} - \mu}{\sqrt{(1 - n/N)\,\sigma^2/n}} \;\xrightarrow{d}\; \mathcal{N}(0,1).
\]

A \(100(1-\alpha)\%\) confidence interval for \(\mu\) is

\[
\bar{y} \;\pm\; z_{\alpha/2}\,\frac{\hat{\sigma}}{\sqrt{n}}\,\sqrt{1 - \frac{n}{N}},
\]
and for \(\pi\):

\[
\hat{\pi} \;\pm\; z_{\alpha/2}\,\sqrt{\frac{\hat{\pi}(1-\hat{\pi})}{n}\left(1-\frac{n}{N}\right)}.
\]

---

# Chapter 3: Stratification

Stratification divides the population into non-overlapping subgroups (strata) and samples independently within each stratum. This can improve precision substantially when strata are internally homogeneous.

## 3.1 Stratified Simple Random Sampling

<div class="definition">
<strong>Definition (Stratified SRS).</strong> Partition the frame \(U\) into \(H\) strata \(U_1, U_2, \ldots, U_H\) with sizes \(N_1, N_2, \ldots, N_H\) where \(N_1 + \cdots + N_H = N\). Within each stratum \(h\), draw an independent SRS of size \(n_h\). The total sample size is \(n = n_1 + \cdots + n_H\).
</div>

The **stratum weight** is \(w_h = N_h / N\). The population mean can be written as a weighted combination of stratum means:

\[
\mu = \sum_{h=1}^{H} w_h \mu_h, \qquad \mu_h = \frac{1}{N_h}\sum_{i \in U_h} y_i.
\]

## 3.2 The HT Estimator under Stratified SRS

Under stratified SRS, the inclusion probability for unit \(i\) in stratum \(h\) is \(\pi_i = n_h / N_h\). The HT estimator of the mean is the **stratified mean**:

\[
\hat{\mu}_{\text{str}} = \sum_{h=1}^{H} w_h \bar{y}_h, \qquad \bar{y}_h = \frac{1}{n_h}\sum_{i \in \mathcal{S}_h} y_i.
\]

<div class="theorem">
<strong>Theorem (Unbiasedness and Variance under Stratified SRS).</strong> The stratified mean is unbiased for \(\mu\), and its variance is

\[
\text{Var}(\hat{\mu}_{\text{str}}) = \sum_{h=1}^{H} w_h^2\,\frac{\sigma_h^2}{n_h}\left(1 - \frac{n_h}{N_h}\right),
\]
where \(\sigma_h^2\) is the population variance within stratum \(h\).
</div>

An unbiased variance estimator is obtained by substituting sample variances:

\[
\widehat{\text{Var}}(\hat{\mu}_{\text{str}}) = \sum_{h=1}^{H} w_h^2\,\frac{s_h^2}{n_h}\left(1 - \frac{n_h}{N_h}\right).
\]

A confidence interval for \(\mu\) is

\[
\hat{\mu}_{\text{str}} \;\pm\; z_{\alpha/2}\,\sqrt{\widehat{\text{Var}}(\hat{\mu}_{\text{str}})}.
\]

For proportions, replace \(\sigma_h^2\) with \(\pi_h(1-\pi_h)\) and use the estimator \(\hat{\pi}_{\text{str}} = \sum_{h=1}^{H} w_h \hat{\pi}_h\).

## 3.3 Optimal Allocation

The allocation question is: given a fixed total sample size \(n\), how should we distribute \(n_1, \ldots, n_H\) to minimize \(\text{Var}(\hat{\mu}_{\text{str}})\)?

### Proportional Allocation

Allocate in proportion to stratum size: \(n_h = n \cdot w_h\). This is simple and guarantees that each unit has the same overall inclusion probability \(n/N\).

<div class="example">
<strong>Example.</strong> For four Canadian provinces with populations 10, 5, 3, 2 million (total 20 million), proportional allocation with \(n = 100\) gives \(n_{\text{ON}} = 50, n_{\text{QUE}} = 25, n_{\text{BC}} = 15, n_{\text{ALB}} = 10\).
</div>

### Neyman (Optimal) Allocation

Allocate more to strata with higher variability. Minimizing \(\text{Var}(\hat{\mu}_{\text{str}})\) subject to \(\sum n_h = n\) via Lagrange multipliers yields:

<div class="theorem">
<strong>Theorem (Neyman Allocation).</strong>

\[
n_h = \frac{n \,\sigma_h\, w_h}{\sum_{j=1}^{H} \sigma_j\, w_j}.
\]
</div>

<div class="remark">
Two observations: (i) \(n_h \propto \sigma_h\), so strata with more variability get larger samples; (ii) \(n_h \propto w_h\), so larger strata also get more units. If all \(\sigma_h\) are equal, Neyman allocation reduces to proportional allocation.
</div>

In practice, the stratum variances are unknown. A common approach is to take a small pilot sample to estimate them.

## 3.4 Poststratification

<div class="definition">
<strong>Definition (Poststratification).</strong> In poststratification, a single SRS of size \(n\) is drawn from the entire population, and units are classified into strata <em>after</em> sampling. The sample sizes \(n_h\) within each stratum are now random.
</div>

The poststratified estimator is

\[
\hat{\mu}_{\text{post}} = \sum_{h=1}^{H} w_h \bar{y}_h,
\]
which looks identical to \(\hat{\mu}_{\text{str}}\) but differs because \(n_h\) is random. The estimated variance is

\[
\widehat{\text{Var}}(\hat{\mu}_{\text{post}}) = \sum_{h=1}^{H} w_h^2\left(1 - \frac{n_h}{N_h}\right)\frac{s_h^2}{n_h}.
\]

Poststratification is useful when stratum membership is unknown before sampling, or when administrative convenience prevents separate sampling.

## 3.5 Comparing Stratified Designs: A Worked Example

<div class="example">
<strong>Example (Employee satisfaction survey).</strong> A company with \(N = 1000\) employees in three departments wants to estimate mean job satisfaction (scale 1--10) with \(n = 100\). The departments have:

| Stratum \(h\) | Department | \(N_h\) | \(w_h\) | \(\sigma_h\) |
|---|---|---|---|---|
| 1 | Engineering | 500 | 0.50 | 2.0 |
| 2 | Sales | 300 | 0.30 | 3.0 |
| 3 | Admin | 200 | 0.20 | 1.5 |

<strong>Proportional allocation</strong>: \(n_1 = 50, n_2 = 30, n_3 = 20\). The variance is

\[
\text{Var}_{\text{prop}} = \sum w_h^2 \frac{\sigma_h^2}{n_h}(1 - n_h/N_h) = 0.25 \cdot \frac{4}{50}\cdot 0.9 + 0.09 \cdot \frac{9}{30}\cdot 0.9 + 0.04 \cdot \frac{2.25}{20}\cdot 0.9 = 0.0423.
\]

<strong>Neyman allocation</strong>: \(\sum w_h\sigma_h = 0.5(2) + 0.3(3) + 0.2(1.5) = 2.2\). So \(n_1 = 100(1.0/2.2) = 45\), \(n_2 = 100(0.9/2.2) = 41\), \(n_3 = 100(0.3/2.2) = 14\). The variance under Neyman is

\[
\text{Var}_{\text{Ney}} = \frac{(\sum w_h \sigma_h)^2}{n} = \frac{2.2^2}{100} = 0.0484 \cdot (1 - \text{fpc adjustments}) \approx 0.0387.
\]

<strong>SRS (no stratification)</strong>: \(\sigma^2 \approx \sum w_h[\sigma_h^2 + (\mu_h - \mu)^2]\). If department means differ, the overall variance includes a between-stratum component, making SRS less efficient.

The Neyman allocation shifted 11 units from Engineering (low variance) to Sales (high variance), reducing the overall variance by about 8.5% compared to proportional allocation.
</div>

---

# Chapter 4: Auxiliary Information

When a variable \(x\) correlated with the response \(y\) is known for the entire population (or at least its population mean \(\mu_x\) is known), we can use this **auxiliary information** to improve estimation.

## 4.1 The Regression Estimator

Suppose \(y_i\) is linearly related to \(x_i\):

\[
y_i = \alpha + \beta(x_i - \bar{x}) + R_i, \qquad R_i \sim \mathcal{N}(0, \sigma^2).
\]

Using least squares on the sample,

\[
\hat{\alpha} = \bar{y}, \qquad \hat{\beta} = \frac{s_{xy}}{s_x^2} = \frac{\sum_{i \in \mathcal{S}} y_i(x_i - \bar{x})}{\sum_{i \in \mathcal{S}} (x_i - \bar{x})^2},
\]
where \(s_{xy} = S_{xy}/(n-1)\) and \(s_x^2 = S_{xx}/(n-1)\).

<div class="definition">
<strong>Definition (Regression Estimator).</strong> The regression estimator of the population mean \(\mu_y\) is

\[
\hat{\mu}_{\text{reg}} = \bar{y} + \hat{\beta}(\mu_x - \bar{x}).
\]
</div>

When the sample mean of \(x\) equals the population mean (\(\bar{x} = \mu_x\)), the regression estimator collapses to the SRS estimator \(\bar{y}\). When \(\bar{x} \neq \mu_x\), the correction term \(\hat{\beta}(\mu_x - \bar{x})\) adjusts for the discrepancy.

<div class="remark">
The regression estimator is <strong>approximately unbiased</strong> (biased for finite \(n\), unbiased in the limit). Its approximate variance is

\[
\text{Var}(\hat{\mu}_{\text{reg}}) \approx \left(1 - \frac{n}{N}\right)\frac{\sigma_r^2}{n},
\]
where \(\sigma_r^2\) is the variance of the residuals \(r_i = y_i - \hat{\alpha} - \hat{\beta}(x_i - \bar{x})\). Since \(\sigma_r^2 \leq \sigma_y^2\) when \(x\) and \(y\) are correlated, the regression estimator has smaller variance than the SRS estimator.
</div>

A confidence interval is

\[
\hat{\mu}_{\text{reg}} \;\pm\; c\,\frac{\hat{\sigma}_r}{\sqrt{n}}\,\sqrt{1 - \frac{n}{N}}, \qquad \hat{\sigma}_r^2 = \frac{\sum_{i \in \mathcal{S}} (r_i - \bar{r})^2}{n-1}.
\]

## 4.2 The Ratio Estimator

<div class="definition">
<strong>Definition (Ratio Estimator).</strong> When the relationship between \(y\) and \(x\) passes through the origin (i.e., \(y_i = \beta x_i + R_i\) with \(R_i \sim \mathcal{N}(0, x_i \sigma^2)\)), the ratio estimator is

\[
\hat{\mu}_{\text{ratio}} = \frac{\bar{y}}{\bar{x}}\,\mu_x.
\]
</div>

The ratio model assumes that the variance of \(y_i\) increases with \(x_i\). To handle this heteroscedasticity, divide by \(\sqrt{x_i}\) to equalize variances:

\[
\frac{y_i}{\sqrt{x_i}} = \beta\sqrt{x_i} + \frac{R_i}{\sqrt{x_i}}, \qquad \frac{R_i}{\sqrt{x_i}} \sim \mathcal{N}(0, \sigma^2).
\]

Using least squares on the transformed model (with no intercept) gives \(\hat{\beta} = \bar{y}/\bar{x}\). The confidence interval is

\[
\hat{\mu}_{\text{ratio}} \;\pm\; c\,\frac{\hat{\sigma}_{\text{ratio}}}{\sqrt{n}}\,\sqrt{1 - \frac{n}{N}},
\]
where \(\hat{\sigma}_{\text{ratio}}^2 = W/(n-1)\) and \(W\) is the residual sum of squares from the ratio model.

### Ratio Estimation for Subgroup Means

When the goal is to estimate the mean of a subgroup (e.g., the mean grade of male students), ratio estimation applies naturally. If \(z_i\) is a binary indicator for subgroup membership, the subgroup mean is \(\theta = \mu / \pi\) where \(\mu\) is the average of \(y_i z_i\) and \(\pi\) is the proportion of units in the subgroup. The estimate is \(\hat{\theta} = \hat{\mu}/\hat{\pi}\).

Using Taylor's approximation for the ratio \(\tilde{\mu}/\tilde{\pi}\) about \((\mu, \pi)\):

\[
\frac{\tilde{\mu}}{\tilde{\pi}} \approx \frac{\mu}{\pi} + \frac{1}{\pi}(\tilde{\mu} - \mu) - \frac{\mu}{\pi^2}(\tilde{\pi} - \pi),
\]
which yields

\[
\text{Var}\!\left(\frac{\tilde{\mu}}{\tilde{\pi}}\right) \approx \frac{1}{\pi^2}\,\text{Var}\!\left(\tilde{\mu} - \frac{\mu}{\pi}\tilde{\pi}\right).
\]

A confidence interval is

\[
\hat{\theta} \;\pm\; c\,\frac{1}{\hat{\pi}}\,\frac{\hat{\sigma}_{\text{ratio}}}{\sqrt{n}}\,\sqrt{1 - \frac{n}{N}}, \qquad \hat{\sigma}_{\text{ratio}}^2 = \frac{\sum_{i \in \mathcal{S}}(y_i - \hat{\theta} z_i)^2}{n-1}.
\]

## 4.3 Comparing SRS, Regression, and Ratio Estimators

| Technique | Estimate | CI |
|---|---|---|
| SRS | \(\hat{\mu}_y = \bar{y}\) | \(\bar{y} \pm c\,\frac{\hat{\sigma}_y}{\sqrt{n}}\sqrt{1 - n/N}\) |
| Regression | \(\hat{\mu}_{\text{reg}} = \bar{y} + \hat{\beta}(\mu_x - \bar{x})\) | \(\hat{\mu}_{\text{reg}} \pm c\,\frac{\hat{\sigma}_r}{\sqrt{n}}\sqrt{1 - n/N}\) |
| Ratio | \(\hat{\mu}_{\text{ratio}} = \frac{\bar{y}}{\bar{x}}\mu_x\) | \(\hat{\mu}_{\text{ratio}} \pm c\,\frac{\hat{\sigma}_{\text{ratio}}}{\sqrt{n}}\sqrt{1 - n/N}\) |

<div class="remark">
Both regression and ratio estimators require knowledge of \(\mu_x\) and a strong linear relationship between \(y\) and \(x\). The ratio estimator additionally requires the relationship to pass through the origin. Both are biased for finite \(n\) but can produce substantially narrower intervals than SRS.
</div>

## 4.4 The Hajek Estimator

<div class="definition">
<strong>Definition (Hajek Estimator).</strong> The Hajek estimator of the population mean is

\[
\hat{\mu}_{\text{H}} = \frac{\sum_{i \in \mathcal{S}} y_i / \pi_i}{\sum_{i \in \mathcal{S}} 1/\pi_i}.
\]
Under SRS, this reduces to the sample mean \(\bar{y}\). It is an alternative to \(\hat{\tau}_{\text{HT}}/N\) that is often more stable.
</div>

The Hajek estimator can be viewed as a ratio estimator where the auxiliary variable is the constant \(x_i = 1\). It is particularly useful when \(N\) is unknown or when the design produces highly variable weights.

---

# Chapter 5: Cluster and Two-Stage Sampling

In many practical surveys, a list of individual units does not exist, but a list of *clusters* (groups of units) does. Cluster sampling selects entire clusters first, then observes units within them.

## 5.1 Single-Stage Cluster Sampling

<div class="definition">
<strong>Definition (Cluster Sampling).</strong> Partition the population into \(M\) clusters \(C_1, \ldots, C_M\) with \(N_j\) units in cluster \(j\), so that \(N = \sum_{j=1}^M N_j\). In single-stage cluster sampling, we select a sample of \(m\) clusters and observe <em>every</em> unit within each selected cluster.
</div>

If clusters are selected by SRS of clusters, each cluster has inclusion probability \(\pi_j^{(c)} = m/M\). The HT estimator of the population total is

\[
\hat{\tau}_{\text{cl}} = \frac{M}{m}\sum_{j \in \mathcal{S}_c} t_j, \qquad t_j = \sum_{i \in C_j} y_i,
\]
where \(t_j\) is the \(j\)-th cluster total. The variance under SRS of clusters is

\[
\text{Var}(\hat{\tau}_{\text{cl}}) = M^2 \frac{1 - f_c}{m}\, S_t^2, \qquad S_t^2 = \frac{1}{M-1}\sum_{j=1}^{M}(t_j - \bar{t})^2,
\]
where \(f_c = m/M\) and \(\bar{t} = \tau/M\). The estimated variance replaces \(S_t^2\) with the sample variance of observed cluster totals \(s_t^2\).

For the population mean \(\bar{y} = \tau/N\), the natural estimator is \(\hat{\bar{y}}_{\text{cl}} = \hat{\tau}_{\text{cl}}/N\) when \(N\) is known. When \(N\) is unknown, the **ratio estimator of the mean** is

\[
\hat{\bar{y}}_r = \frac{\sum_{j \in \mathcal{S}_c} t_j}{\sum_{j \in \mathcal{S}_c} N_j}.
\]

### Design Effect for Cluster Sampling

The **design effect** (deff) compares the variance of a cluster design to the variance of an SRS of the same total sample size \(n\):

\[
\text{deff} = \frac{\text{Var}_{\text{cluster}}(\hat{\bar{y}})}{\text{Var}_{\text{SRS}}(\hat{\bar{y}})}.
\]

For clusters of equal size \(N_j = \bar{N}\), the design effect is approximately

\[
\text{deff} \approx 1 + (\bar{N} - 1)\rho,
\]
where \(\rho\) is the **intraclass correlation coefficient** measuring the similarity of units within the same cluster. When \(\rho > 0\) (units within a cluster are more alike than units across clusters), the design effect exceeds 1, meaning cluster sampling is less efficient than SRS.

<div class="example">
<strong>Example (School survey).</strong> Suppose we sample \(m = 20\) schools from \(M = 200\), each school has \(\bar{N} = 30\) students, and the intraclass correlation for test scores is \(\rho = 0.05\). The total sample size is \(n = 600\), and the design effect is

\[
\text{deff} \approx 1 + (30 - 1)(0.05) = 2.45.
\]
Thus the effective sample size is only \(600/2.45 \approx 245\), and the cluster-based confidence interval is roughly \(\sqrt{2.45} \approx 1.57\) times wider than an SRS-based interval of the same nominal size.
</div>

## 5.2 Two-Stage Sampling: SRS-SRS

<div class="definition">
<strong>Definition (Two-Stage Sampling).</strong> In two-stage sampling, first select \(m\) clusters from \(M\) (first stage), then within each selected cluster \(j\), select \(n_j\) units from the \(N_j\) units in that cluster (second stage). This approach is practical when cluster lists are available but complete enumeration of selected clusters is expensive.
</div>

Under **SRS-SRS** (SRS at both stages), the inclusion probability for unit \(i\) in cluster \(j\) is

\[
\pi_{ij} = \frac{m}{M}\cdot\frac{n_j}{N_j}.
\]

The Horvitz-Thompson estimator of the population total is

\[
\hat{\tau} = \frac{M}{m}\sum_{j=1}^{m}\frac{N_j}{n_j}\sum_{i \in \mathcal{S}_j} y_{ij} = \frac{M}{m}\sum_{j=1}^{m} N_j \bar{y}_j,
\]
where \(\bar{y}_j\) is the sample mean within cluster \(j\).

The variance decomposes into a **between-cluster** component and a **within-cluster** component:

\[
\text{Var}(\hat{\tau}) = M^2 \frac{1 - f_c}{m}\, S_b^2 + \frac{M}{m}\sum_{j=1}^{M} N_j^2 \frac{1 - f_j}{n_j}\, S_{wj}^2,
\]
where \(S_b^2\) is the variance of the cluster means \(N_j\bar{Y}_j\), \(S_{wj}^2\) is the within-cluster variance, \(f_c = m/M\), and \(f_j = n_j/N_j\). The first term reflects uncertainty from sampling clusters; the second reflects uncertainty from subsampling within clusters.

<div class="remark">
<strong>Remark.</strong> In practice, the Hajek estimator \(\hat{\bar{y}} = \sum_{j,i} d_{ij} y_{ij} / \sum_{j,i} d_{ij}\) (where \(d_{ij} = 1/\pi_{ij}\)) is often preferred over \(\hat{\tau}/N\) because it does not require knowledge of \(N\) and tends to have lower MSE when cluster sizes vary.
</div>

## 5.3 STSRS-SRS Designs

When the first stage uses **stratified SRS of clusters** and the second stage uses SRS within selected clusters, we combine stratification's variance reduction with cluster sampling's operational convenience.

Suppose the \(M\) clusters are partitioned into \(H\) strata, with stratum \(h\) containing \(M_h\) clusters. We select \(m_h\) clusters from stratum \(h\) by SRS, and then subsample \(n_{hj}\) units within each selected cluster.

The estimator of the total is

\[
\hat{\tau}_{\text{STSRS-SRS}} = \sum_{h=1}^{H} \frac{M_h}{m_h} \sum_{j=1}^{m_h} N_{hj}\,\bar{y}_{hj},
\]
and its variance combines the stratified between-cluster term with within-cluster terms from each stratum. Stratifying clusters by geography, institution type, or size reduces the between-cluster variance component, yielding tighter confidence intervals than unstratified cluster sampling.

## 5.4 Probability Proportional to Size Sampling

When clusters vary greatly in size, SRS of clusters is inefficient because a sample dominated by small clusters underrepresents the population. **PPS sampling** corrects this.

<div class="definition">
<strong>Definition (PPS Sampling).</strong> In probability proportional to size (PPS) sampling, each cluster \(j\) is selected with probability proportional to a known size measure \(M_j\) (often the cluster population size \(N_j\)). The selection probability for cluster \(j\) in a single draw is

\[
p_j = \frac{M_j}{\sum_{k=1}^{M} M_k}.
\]
</div>

Under **PPS with replacement** (drawing \(m\) clusters independently with probabilities \(p_j\)), the **Hansen-Hurwitz estimator** of the population total is

\[
\hat{\tau}_{\text{HH}} = \frac{1}{m}\sum_{k=1}^{m}\frac{t_{j_k}}{p_{j_k}},
\]
where \(j_k\) is the cluster selected on the \(k\)-th draw and \(t_{j_k}\) is its cluster total. This estimator is unbiased with variance

\[
\text{Var}(\hat{\tau}_{\text{HH}}) = \frac{1}{m}\sum_{j=1}^{M} p_j\!\left(\frac{t_j}{p_j} - \tau\right)^{\!2}.
\]

If \(t_j/p_j\) is approximately constant across clusters (i.e., cluster totals are roughly proportional to their sizes), then the variance is near zero, making PPS highly efficient for populations with heterogeneous cluster sizes.

<div class="example">
<strong>Example.</strong> In a survey of hospital patients, hospitals range from 50 to 5000 beds. Under SRS of hospitals, a sample might include many small hospitals contributing few patients. Under PPS sampling with size proportional to bed count, large hospitals are selected more often, yielding an estimator with much lower variance for the average patient outcome.
</div>

---

# Chapter 6: Surveys in Practice

## 6.1 Sampling Weights

Every probability sampling design assigns each unit a known inclusion probability \(\pi_i\). The **sampling weight** of unit \(i\) is \(d_i = 1/\pi_i\), representing the number of population units that unit \(i\) represents. The HT estimator can then be written compactly as

\[
\hat{\tau}_{\text{HT}} = \sum_{i \in \mathcal{S}} d_i\, y_i.
\]

In complex surveys, weights undergo several adjustments:

### Base Weights and Weight Adjustments

The **base weight** (or design weight) is simply \(d_i = 1/\pi_i\). In practice, the final weight applied to each respondent is

\[
w_i = d_i \times a_i \times g_i,
\]
where \(a_i\) is a **nonresponse adjustment** factor and \(g_i\) is a **calibration** (or post-stratification) factor.

### Calibration and Post-Stratification Weights

If external information is available --- for instance, census counts by age-sex groups --- the weights can be **calibrated** so that the survey-weighted totals match the known population totals. For \(K\) calibration groups with known sizes \(N_k\), the calibrated weight for unit \(i\) in group \(k\) is

\[
w_i^{\text{cal}} = d_i \times \frac{N_k}{\sum_{j \in \mathcal{S} \cap \text{group } k} d_j}.
\]

This is a special case of **raking** (iterative proportional fitting), which adjusts weights to simultaneously match marginal totals along multiple dimensions.

## 6.2 Nonresponse

**Nonresponse** occurs when selected units fail to provide data. It introduces bias because respondents may differ systematically from non-respondents.

Two types of nonresponse:

- **Unit nonresponse**: the sampled individual does not participate at all. Common in household surveys, telephone polls, and mail questionnaires.
- **Item nonresponse**: the individual participates but fails to answer specific questions. This is typically addressed by **imputation** (filling in missing values using observed data).

### Two-Phase Sampling for Nonresponse

<div class="definition">
<strong>Definition (Two-Phase Sampling for Nonresponse).</strong> To address nonresponse, a two-phase design can be used:
<ul>
<li>Phase 1: Draw an SRS of size \(n\). Let \(n_R\) units respond.</li>
<li>Phase 2: Draw a subsample of \(m\) non-respondents and follow up intensively (e.g., in-person interviews).</li>
</ul>
The adjusted estimator is

\[
\hat{\mu} = \frac{n_R}{n}\hat{\mu}_R + \frac{n - n_R}{n}\hat{\mu}_m,
\]
where \(\hat{\mu}_R\) is the respondent mean and \(\hat{\mu}_m\) is the mean from the non-respondent subsample.
</div>

This estimator is approximately unbiased for the population mean, as the follow-up subsample represents the non-respondent stratum. Similarly, for proportions, \(\hat{p} = (n_R/n)\hat{p}_R + (n_m/n)\hat{p}_m\).

### Nonresponse Weight Adjustment

When follow-up of non-respondents is not feasible, a common approach is **response propensity weighting**. If units are grouped into **response homogeneity groups** (RHGs) where the response probability \(\phi_k\) is approximately constant within group \(k\), the adjusted weight is

\[
w_i^{\text{adj}} = \frac{d_i}{\hat{\phi}_k}, \qquad \hat{\phi}_k = \frac{\sum_{j \in \mathcal{S} \cap \text{group } k} R_j \, d_j}{\sum_{j \in \mathcal{S} \cap \text{group } k} d_j},
\]
where \(R_j = 1\) if unit \(j\) responded. The weight inflation compensates for the "missing" non-respondents, under the assumption that within each group, respondents and non-respondents have similar values of \(y\).

## 6.3 Variance Estimation Methods

For complex designs (stratification + clustering + unequal weights), analytic variance formulas may be intractable. Three approaches are standard in practice:

### Linearization (Taylor Series)

For a nonlinear estimator \(\hat{\theta} = g(\hat{\tau}_1, \hat{\tau}_2, \ldots)\), approximate by the first-order Taylor expansion about the true values:

\[
\hat{\theta} \approx g(\tau_1, \tau_2, \ldots) + \sum_k \frac{\partial g}{\partial \tau_k}\bigg|_{\boldsymbol{\tau}} (\hat{\tau}_k - \tau_k).
\]

The variance is then estimated as the design-based variance of the linearized statistic. For example, for the ratio \(\hat{R} = \hat{\tau}_y/\hat{\tau}_x\), the linearized residuals are \(e_i = y_i - \hat{R}\, x_i\), and \(\widehat{\text{Var}}(\hat{R}) \approx (1/\hat{\tau}_x^2)\,\widehat{\text{Var}}(\hat{\tau}_e)\).

### Jackknife Variance Estimation

<div class="definition">
<strong>Definition (Delete-One-Cluster Jackknife).</strong> In a stratified cluster design with \(H\) strata and \(m_h\) clusters per stratum, the jackknife proceeds as follows. For each stratum \(h\) and cluster \(j = 1, \ldots, m_h\), compute the estimate \(\hat{\theta}_{(hj)}\) obtained by dropping cluster \(j\) from stratum \(h\) and reweighting the remaining clusters. The jackknife variance is

\[
\widehat{\text{Var}}_{\text{JK}}(\hat{\theta}) = \sum_{h=1}^{H} \frac{m_h - 1}{m_h}\sum_{j=1}^{m_h} \bigl(\hat{\theta}_{(hj)} - \hat{\theta}\bigr)^2.
\]
</div>

The jackknife is attractive because it requires only the ability to recompute the point estimate, and it automatically accounts for the complex design structure.

### Bootstrap for Surveys

The survey bootstrap resamples at the **primary sampling unit** (PSU) level, respecting the stratified cluster structure. A common approach (Rao and Wu, 1988):

1. Within each stratum \(h\), draw \(m_h - 1\) PSUs with replacement from the \(m_h\) observed PSUs.
2. Adjust the weights of the resampled PSUs to maintain the total weight.
3. Compute \(\hat{\theta}^{*(b)}\) for each of \(B\) bootstrap replicates.
4. Estimate the variance as \(\widehat{\text{Var}}_{\text{boot}} = \frac{1}{B}\sum_{b=1}^{B}(\hat{\theta}^{*(b)} - \bar{\theta}^*)^2\).

The bootstrap is the most flexible of the three methods, handling nonlinear statistics, percentiles, and complex multi-stage designs with ease.

---

# Chapter 7: One-Way ANOVA

The second half of the course addresses experimental design. In an experiment, the investigator controls which units receive which treatments, whereas in a survey the investigator only observes.

## 7.1 The Completely Randomized Design

<div class="definition">
<strong>Definition (One-Way ANOVA Model / CRD).</strong> The <strong>completely randomized design</strong> (CRD) assigns \(n = tr\) experimental units at random to \(t\) treatments, with \(r\) replicates per treatment. The model is

\[
Y_{ij} = \mu + \tau_i + R_{ij}, \qquad R_{ij} \sim \mathcal{N}(0, \sigma^2),
\]
for \(i = 1, \ldots, t\) and \(j = 1, \ldots, r\), where \(\mu\) is the overall mean, \(\tau_i\) is the effect of treatment \(i\), and \(R_{ij}\) is the random error. The constraint \(\sum_{i=1}^{t} \tau_i = 0\) ensures identifiability.
</div>

The least-squares estimates are:

\[
\hat{\mu} = \bar{y}_{++}, \qquad \hat{\tau}_i = \bar{y}_{i+} - \bar{y}_{++}, \qquad \hat{\sigma}^2 = \frac{W}{n - q + c} = \frac{W}{tr - t},
\]
where \(W = \sum_{ij}(y_{ij} - \hat{\mu} - \hat{\tau}_i)^2\) is the residual sum of squares.

The **estimator** of \(\tau_i\) is \(\tilde{\tau}_i = \bar{Y}_{i+} - \bar{Y}_{++}\). It is unbiased: \(E[\tilde{\tau}_i] = \tau_i\).

For the **variance** of the estimators:

\[
\text{Var}(\tilde{\mu}) = \frac{\sigma^2}{tr}, \qquad \text{Var}(\tilde{\tau}_i) = \frac{\sigma^2}{2r}.
\]

A confidence interval for \(\tau_i\) is

\[
\hat{\tau}_i \;\pm\; t^*\,\sqrt{\frac{\hat{\sigma}^2}{2r}}, \qquad t^* \sim t(n - q + c).
\]

## 7.2 Sum of Squares Decomposition

<div class="theorem">
<strong>Theorem (ANOVA Decomposition).</strong> The total variability in the data can be partitioned as

\[
\underbrace{\sum_{ij}(y_{ij} - \bar{y}_{++})^2}_{\text{SS(Tot)}} = \underbrace{r\sum_{i}(\bar{y}_{i+} - \bar{y}_{++})^2}_{\text{SS(Trt)}} + \underbrace{\sum_{ij}(y_{ij} - \bar{y}_{i+})^2}_{\text{SS(Res)}}.
\]
</div>

The degrees of freedom also partition: \(\text{df}_{\text{Tot}} = n-1 = (\text{df}_{\text{Trt}} = t-1) + (\text{df}_{\text{Res}} = n-t)\).

| Source | df | SS | MS |
|---|---|---|---|
| Treatment | \(t-1\) | SS(Trt) | SS(Trt)/\((t-1)\) |
| Residual | \(n-t\) | SS(Res) | SS(Res)/\((n-t)\) |
| Total | \(n-1\) | SS(Tot) | |

## 7.3 The F Test

<div class="theorem">
<strong>Theorem (F Statistic).</strong> Under \(H_0: \tau_1 = \tau_2 = \cdots = \tau_t = 0\),

\[
F = \frac{\text{MS(Trt)}}{\text{MS(Res)}} \sim F(t-1, n-t).
\]
</div>

<div class="remark">
The expected value of \(F\) is

\[
E[\tilde{F}] = 1 + \frac{r\sum_{i=1}^{t}\tau_i^2}{(t-1)\sigma^2}.
\]
Under \(H_0\), all \(\tau_i = 0\) so \(E[\tilde{F}] = 1\). If any \(\tau_i \neq 0\), then \(E[\tilde{F}] > 1\), and we reject \(H_0\) for large observed values of \(F\).
</div>

The **F test** procedure:
1. \(H_0: \tau_1 = \cdots = \tau_t = 0\) vs. \(H_a:\) at least one \(\tau_i \neq 0\).
2. Compute \(d = \text{MS(Trt)}/\text{MS(Res)}\).
3. The \(p\)-value is \(P(F(t-1, n-t) > d)\).
4. Reject \(H_0\) if the \(p\)-value is small.

## 7.4 Contrasts and Multiple Comparisons

<div class="definition">
<strong>Definition (Contrast).</strong> A <strong>contrast</strong> is a linear combination \(\theta = a_1\tau_1 + a_2\tau_2 + \cdots + a_t\tau_t\) where \(\sum_{i=1}^{t} a_i = 0\). For example, \(\tau_1 - \tau_2\) is a contrast comparing treatments 1 and 2.
</div>

The estimator is \(\hat{\theta} = \sum a_i \hat{\tau}_i\), which is unbiased with variance \(\text{Var}(\tilde{\theta}) = \sigma^2 \sum a_i^2 / r\).

### Tukey's Honestly Significant Difference

When all pairwise comparisons \(\tau_i - \tau_j\) are of interest, Tukey's method controls the **familywise error rate** (the probability of at least one false rejection). The simultaneous confidence intervals are

\[
(\hat{\tau}_i - \hat{\tau}_j) \;\pm\; q_{\alpha}(t, n-t)\,\frac{\hat{\sigma}}{\sqrt{r}},
\]
where \(q_{\alpha}(t, n-t)\) is the critical value from the Studentized range distribution.

### Bonferroni Correction

For \(k\) pre-planned comparisons, each at significance level \(\alpha/k\), the Bonferroni method ensures that the overall error rate does not exceed \(\alpha\). This is more conservative than Tukey for all pairwise comparisons but can be applied to any set of contrasts.

## 7.5 Unbalanced CRD

<div class="definition">
<strong>Definition (Unbalanced CRD).</strong> When treatment groups have unequal sizes \(r_1, r_2, \ldots, r_t\) (so \(n = r_1 + \cdots + r_t\)), the model is

\[
Y_{ij} = \mu + \tau_i + R_{ij}, \qquad R_{ij} \sim \mathcal{N}(0, \sigma^2),
\]
for \(j = 1, \ldots, r_i\), with constraint \(\sum_{i=1}^{t} r_i \tau_i = 0\).
</div>

The LS estimates are \(\hat{\mu} = \bar{y}_{++}\), \(\hat{\tau}_i = \bar{y}_{i+} - \bar{y}_{++}\), and \(\hat{\sigma}^2 = W / (n - t)\).

The variance of \(\tilde{\tau}_i - \tilde{\tau}_j\) is \(\sigma^2(1/r_i + 1/r_j)\), so confidence intervals for treatment comparisons must account for the unequal group sizes.

## 7.6 Model Diagnostics

The ANOVA model assumes: (i) \(E[R_{ij}] = 0\); (ii) \(\text{Var}(R_{ij}) = \sigma^2\) (constant variance); (iii) normality; (iv) independence. These are checked with:

- **Residuals vs. fitted values plot**: checks zero mean and constant variance.
- **Normal Q-Q plot**: checks normality.
- **Residuals vs. order plot**: checks independence.

---

# Chapter 8: Two-Way ANOVA

## 8.1 The Two-Factor Model

<div class="definition">
<strong>Definition (Two-Way ANOVA / Factorial CRD).</strong> For two factors with \(\ell_1\) and \(\ell_2\) levels respectively, each combination observed \(r\) times, the model is

\[
Y_{ijk} = \mu + \tau_{ij} + R_{ijk}, \qquad R_{ijk} \sim \mathcal{N}(0, \sigma^2),
\]
for \(i = 1, \ldots, \ell_1\), \(j = 1, \ldots, \ell_2\), \(k = 1, \ldots, r\), with constraint \(\sum_{ij}\tau_{ij} = 0\).
</div>

The LS estimates are \(\hat{\mu} = \bar{y}_{+++}\) and \(\hat{\tau}_{ij} = \bar{y}_{ij+} - \bar{y}_{+++}\).

## 8.2 Interaction

**Interaction** means that the effect of one factor depends on the level of the other. If the main effects of factor A are denoted \(\alpha_i\) and the main effects of factor B are \(\beta_j\), the full model is

\[
Y_{ijk} = \mu + \alpha_i + \beta_j + (\alpha\beta)_{ij} + R_{ijk},
\]
where \((\alpha\beta)_{ij}\) represents the interaction. No interaction means \((\alpha\beta)_{ij} = 0\) for all \(i,j\).

### Detecting Interaction

Three methods to detect interaction:

1. **Interaction plot**: Plot the group means against levels of one factor, with separate lines for each level of the other. Parallel lines suggest no interaction; non-parallel lines suggest interaction.

2. **Contrast method**: For a \(2 \times 2\) design, compute \(\hat{\theta} = \hat{\tau}_{11} - \hat{\tau}_{01} - \hat{\tau}_{10} + \hat{\tau}_{00}\). If the confidence interval for \(\theta\) includes 0, there is no evidence of interaction.

3. **ANOVA table**: The treatment SS decomposes as

\[
\text{SS(Trt)} = \text{SS(A)} + \text{SS(B)} + \text{SS(A:B)}.
\]
Test \(H_0: \text{no interaction}\) using \(F = \text{MS(A:B)} / \text{MS(Res)}\).

## 8.3 The Two-Way ANOVA Table

| Source | df | SS | MS | F |
|---|---|---|---|---|
| Factor A | \(\ell_1 - 1\) | SS(A) | MS(A) | MS(A)/MS(Res) |
| Factor B | \(\ell_2 - 1\) | SS(B) | MS(B) | MS(B)/MS(Res) |
| A:B Interaction | \((\ell_1-1)(\ell_2-1)\) | SS(A:B) | MS(A:B) | MS(A:B)/MS(Res) |
| Residual | \(\ell_1\ell_2(r-1)\) | SS(Res) | MS(Res) | |
| Total | \(n-1\) | SS(Tot) | | |

## 8.4 Sum of Squares Decomposition

In a balanced design (equal replication \(r\) in every cell), the treatment sum of squares decomposes cleanly:

\[
\text{SS(Trt)} = \text{SS(A)} + \text{SS(B)} + \text{SS(A:B)},
\]
where

\[
\text{SS(A)} = r\ell_2 \sum_{i=1}^{\ell_1}(\bar{y}_{i++} - \bar{y}_{+++})^2, \qquad \text{SS(B)} = r\ell_1 \sum_{j=1}^{\ell_2}(\bar{y}_{+j+} - \bar{y}_{+++})^2,
\]

\[
\text{SS(A:B)} = r \sum_{i=1}^{\ell_1}\sum_{j=1}^{\ell_2}(\bar{y}_{ij+} - \bar{y}_{i++} - \bar{y}_{+j+} + \bar{y}_{+++})^2.
\]

### Type I, II, and III Sums of Squares

In **unbalanced designs** (unequal cell sizes), the decomposition is no longer unique and the three standard types of sums of squares differ:

- **Type I (Sequential)**: Each term is adjusted only for terms already in the model. The result depends on the order of entry --- \(\text{SS(A | 1)}\) differs from \(\text{SS(A | 1, B)}\). Used mainly when there is a natural ordering of factors.

- **Type II**: Each main effect is adjusted for the other main effect but *not* for the interaction:

  \[
  \text{SS}_{\text{II}}(A) = \text{SS}(A \mid B), \qquad \text{SS}_{\text{II}}(B) = \text{SS}(B \mid A).
  \]
  Type II is appropriate when there is no significant interaction, as it uses more degrees of freedom for testing main effects.

- **Type III**: Each effect is adjusted for all other effects, including the interaction:

  \[
  \text{SS}_{\text{III}}(A) = \text{SS}(A \mid B, A\!:\!B).
  \]
  This is the default in many software packages and is recommended for unbalanced designs, particularly when the interaction may be present.

In a **balanced** design, all three types are identical. The choice matters only when cell sizes differ.

<div class="example">
<strong>Example (Crop yield).</strong> A \(2 \times 3\) factorial studies the effect of irrigation (2 levels: low, high) and fertilizer (3 levels: A, B, C) on crop yield. In a balanced design with \(r = 4\) replicates per cell (\(n = 24\) total), the ANOVA table is:

| Source | df | SS | MS | F |
|---|---|---|---|---|
| Irrigation | 1 | 112.5 | 112.5 | 18.75 |
| Fertilizer | 2 | 84.3 | 42.15 | 7.03 |
| Interaction | 2 | 9.8 | 4.90 | 0.82 |
| Residual | 18 | 108.0 | 6.00 | |
| Total | 23 | 314.6 | | |

At \(\alpha = 0.05\): irrigation is significant (\(F_{1,18} = 18.75\), \(p < 0.001\)), fertilizer is significant (\(F_{2,18} = 7.03\), \(p = 0.006\)), and the interaction is not significant (\(F_{2,18} = 0.82\), \(p = 0.46\)). Since the interaction is non-significant, an additive model \(Y_{ijk} = \mu + \alpha_i + \beta_j + R_{ijk}\) is adequate, and the main effects have clear interpretations.
</div>

## 8.5 Multiple Comparisons in Two-Way Designs

When a main effect is significant, **pairwise comparisons** identify which levels differ. Tukey's HSD can be applied within each significant factor. For factor A with \(\ell_1\) levels:

\[
\bar{y}_{i++} - \bar{y}_{i'++} \pm q_{\alpha, \ell_1, \nu}\sqrt{\frac{\text{MS(Res)}}{r\ell_2}},
\]
where \(q_{\alpha,\ell_1,\nu}\) is the studentized range critical value and \(\nu\) is the residual degrees of freedom.

When the interaction is significant, comparisons of one factor at fixed levels of the other (**simple effects**) are more informative than marginal comparisons.

## 8.6 Diagnostics

The same diagnostic tools used in one-way ANOVA apply:

1. **Residuals vs. fitted values**: check for non-constant variance (fanning patterns suggest heteroscedasticity).
2. **Normal Q-Q plot of residuals**: check for non-normality. Moderate departures are tolerable with balanced designs due to the robustness of the F test.
3. **Residuals by factor level**: plot residuals separately for each factor to detect level-specific variance patterns.
4. **Tukey's one-degree-of-freedom test for nonadditivity**: specifically tests whether the interaction has a multiplicative form \((\alpha\beta)_{ij} = c\,\alpha_i\beta_j\), which would suggest a transformation (e.g., log) could remove the interaction.

---

# Chapter 9: Randomized Block Designs

## 9.1 The Rationale for Blocking

In a CRD, all variability not explained by treatments goes into the residual. If there is a known source of variability (e.g., different batches, different days), **blocking** removes it from the error term, increasing the power of treatment comparisons.

<div class="definition">
<strong>Definition (Randomized Complete Block Design).</strong> The <strong>RCBD model</strong> has \(t\) treatments and \(r\) blocks. Each treatment appears exactly once in each block. The model is

\[
Y_{ij} = \mu + \tau_i + \beta_j + R_{ij}, \qquad R_{ij} \sim \mathcal{N}(0, \sigma^2),
\]
for \(i = 1, \ldots, t\) and \(j = 1, \ldots, r\), where \(\beta_j\) is the effect of block \(j\). Constraints: \(\sum \tau_i = 0\) and \(\sum \beta_j = 0\).
</div>

## 9.2 Analysis of the RCBD

The LS estimates are:

\[
\hat{\mu} = \bar{y}_{++}, \qquad \hat{\tau}_i = \bar{y}_{i+} - \bar{y}_{++}, \qquad \hat{\beta}_j = \bar{y}_{+j} - \bar{y}_{++},
\]

\[
\hat{\sigma}^2 = \frac{W}{rt - (t + r + 1) + 2} = \frac{W}{(r-1)(t-1)}.
\]

### ANOVA Table for RCBD

| Source | df | SS | MS |
|---|---|---|---|
| Treatment | \(t-1\) | SS(Trt) | SS(Trt)/\((t-1)\) |
| Block | \(r-1\) | SS(Block) | SS(Block)/\((r-1)\) |
| Residual | \((r-1)(t-1)\) | SS(Res) | SS(Res)/\(((r-1)(t-1))\) |
| Total | \(rt-1\) | SS(Tot) | |

The F test for treatment effects is \(F = \text{MS(Trt)}/\text{MS(Res)} \sim F(t-1, (r-1)(t-1))\) under \(H_0\).

The F test for block effects is \(F = \text{MS(Block)}/\text{MS(Res)} \sim F(r-1, (r-1)(t-1))\). A significant block effect confirms that blocking was beneficial.

## 9.3 Treatment Comparisons in RCBD

The difference in treatment effects is estimated by \(\hat{\tau}_i - \hat{\tau}_j = \bar{y}_{i+} - \bar{y}_{j+}\). Because each treatment appears in every block, the block effects cancel in the difference, giving

\[
\text{Var}(\hat{\tau}_i - \hat{\tau}_j) = \frac{2\sigma^2}{r}.
\]

A \((1-\alpha)\) confidence interval for \(\tau_i - \tau_j\) is

\[
(\bar{y}_{i+} - \bar{y}_{j+}) \;\pm\; t_{\alpha/2,(r-1)(t-1)}\,\sqrt{\frac{2\,\text{MS(Res)}}{r}}.
\]

For simultaneous comparisons of all \(\binom{t}{2}\) treatment pairs, Tukey's HSD replaces the \(t\)-critical value with \(q_{\alpha,t,(r-1)(t-1)}/\sqrt{2}\).

<div class="example">
<strong>Example.</strong> Willow tree cuttings from 6 trees are assigned to high and low acidity soils (\(t = 2\), \(r = 6\)). The RCBD model accounts for tree-to-tree variability. The ANOVA table yields \(\hat{\sigma} = 1.065\) on 5 df. The CI for the treatment difference is

\[
(\hat{\tau}_1 - \hat{\tau}_2) \pm 2.57\,\frac{1.065}{\sqrt{3}} = (-0.167 - 0.167) \pm 1.58 = (-1.91, 1.25).
\]
Since 0 is in the interval, there is no significant difference between soil types. However, the block effect (trees) is highly significant (\(F = 136.18\), \(p < 0.001\)), confirming that blocking was essential.
</div>

## 9.4 RCBD vs. CRD

When blocking is effective, the RCBD has a smaller residual variance than the CRD, yielding narrower confidence intervals and more powerful tests. The CRD ANOVA table is obtained from the RCBD by combining the Block and Residual sums of squares.

<div class="remark">
If blocks are not effective (the block effect is not significant), the RCBD may actually lose power compared to the CRD because the block term uses up degrees of freedom. In practice, blocking is almost always worthwhile when a natural blocking factor exists.
</div>

## 9.5 Latin Squares

A **Latin square** design controls for two blocking factors simultaneously. For \(t\) treatments, a \(t \times t\) Latin square assigns each treatment exactly once to each row and each column. The model is

\[
Y_{ijk} = \mu + \tau_i + \beta_j + \gamma_k + R_{ijk},
\]
where \(\beta_j\) and \(\gamma_k\) are the row and column block effects respectively.

<div class="example">
<strong>Example (\(4 \times 4\) Latin square).</strong> An experiment tests 4 tire compounds (A, B, C, D) on 4 cars, with each car driven on 4 road surfaces. The rows represent cars and the columns represent road surfaces:

|  | Surface 1 | Surface 2 | Surface 3 | Surface 4 |
|---|---|---|---|---|
| Car 1 | A | B | C | D |
| Car 2 | B | C | D | A |
| Car 3 | C | D | A | B |
| Car 4 | D | A | B | C |

Each compound appears exactly once in each row and column. The ANOVA decomposes \(\text{SS(Tot)}\) into SS(Compound), SS(Car), SS(Surface), and SS(Residual), with \((t-1)(t-2) = 6\) residual degrees of freedom.
</div>

The ANOVA table for a Latin square has:

| Source | df |
|---|---|
| Rows | \(t - 1\) |
| Columns | \(t - 1\) |
| Treatments | \(t - 1\) |
| Residual | \((t-1)(t-2)\) |
| Total | \(t^2 - 1\) |

Latin squares are efficient but have few residual degrees of freedom when \(t\) is small. **Graeco-Latin squares** extend the idea to control for three blocking factors simultaneously.

---

# Chapter 10: Two-Level Factorial Designs

Factorial designs study the effects of multiple factors simultaneously. **Two-level factorial designs** restrict each factor to exactly two levels (coded as \(-1\) and \(+1\), or low and high).

## 10.1 The \(2^2\) Factorial Design

<div class="definition">
<strong>Definition (\(2^2\) Design).</strong> Two factors, A and B, each at two levels, yield \(2^2 = 4\) treatment combinations: \((1), a, b, ab\). With \(r\) replicates per combination, the total sample size is \(n = 4r\).
</div>

The **main effect of A** is the average difference in response when A changes from low to high:

\[
\text{ME}(A) = \frac{1}{2}[(\bar{y}_{ab} + \bar{y}_{a}) - (\bar{y}_{b} + \bar{y}_{(1)})].
\]

The **main effect of B** is defined analogously. The **interaction effect AB** measures how the effect of A changes across levels of B:

\[
\text{Int}(AB) = \frac{1}{2}[(\bar{y}_{ab} - \bar{y}_{b}) - (\bar{y}_{a} - \bar{y}_{(1)})].
\]

Under the CRD model, the ANOVA table decomposes \(\text{SS(Trt)}\) into:

\[
\text{SS(Trt)} = \text{SS(A)} + \text{SS(B)} + \text{SS(AB)},
\]
each with 1 degree of freedom.

<div class="example">
<strong>Example.</strong> An experiment studies the effect of step height and stepping frequency on heart rate increase. With \(r = 5\) replicates per combination, the ANOVA yields:
<ul>
<li>SS(Freq) = 304.2, \(F = 2.97\), \(p = 0.10\) (not significant)</li>
<li>SS(Height) = 793.8, \(F = 7.75\), \(p = 0.013\) (significant)</li>
<li>SS(Interaction) = 45.0, \(F = 0.44\), \(p = 0.52\) (no interaction)</li>
</ul>
Height significantly affects heart rate increase, but frequency and the interaction do not.
</div>

## 10.2 The \(2^3\) Factorial Design

With three factors A, B, C at two levels each, there are \(2^3 = 8\) treatment combinations. The effects decompose into:

- 3 main effects: A, B, C
- 3 two-factor interactions: AB, AC, BC
- 1 three-factor interaction: ABC

Each effect has 1 degree of freedom, for a total of 7 treatment df. The main effects and interactions are computed by the **Yates algorithm** or by using contrast coefficients.

<div class="definition">
<strong>Definition (Effect Computation in \(2^3\) Designs).</strong> The main effect of factor A is

\[
\text{ME}(A) = \frac{1}{4}[(ab + a + ac + abc) - (b + (1) + bc + c)],
\]
where each symbol represents the average response at that treatment combination. Similar formulas apply to B, C, and all interactions.
</div>

## 10.3 Fractional Factorial Designs

When the number of factors is large, a **full factorial** requires too many runs. A **fractional factorial** uses only a fraction (e.g., \(1/2\) or \(1/4\)) of the full design, sacrificing information about high-order interactions (which are often negligible) to reduce the experiment size.

<div class="definition">
<strong>Definition (\(2^{k-p}\) Fractional Factorial).</strong> A \(2^{k-p}\) design studies \(k\) factors in \(2^{k-p}\) runs. The \(p\) generators define which runs to include, and they also define the <strong>alias structure</strong> --- which effects are confounded with one another.
</div>

<div class="remark">
The <strong>resolution</strong> of a fractional factorial determines the extent of aliasing:
<ul>
<li><strong>Resolution III</strong>: Main effects are aliased with two-factor interactions.</li>
<li><strong>Resolution IV</strong>: Main effects are free of two-factor interaction aliases, but two-factor interactions are aliased with each other.</li>
<li><strong>Resolution V</strong>: Main effects and two-factor interactions are free of aliases with each other.</li>
</ul>
Higher resolution designs provide cleaner estimates of lower-order effects.
</div>

### Example: \(2^{3-1}\) Half-Fraction

A \(2^{3-1}\) design uses 4 runs instead of 8. If the generator is \(C = AB\), the defining relation is \(I = ABC\). This means:
- A is aliased with BC (since \(A \cdot ABC = BC\))
- B is aliased with AC
- C is aliased with AB

Under the **effect sparsity principle** (higher-order interactions are often negligible), we assume the two-factor interactions are small and interpret the estimated contrasts as main effects.

<div class="example">
<strong>Example.</strong> A chemical engineer studies temperature (A), pressure (B), and catalyst (C) on yield. With \(C = AB\), the \(2^{3-1}\) design runs the 4 combinations where A, B, C satisfy \(C = AB\):

| Run | A | B | C = AB | Yield |
|---|---|---|---|---|
| 1 | \(-1\) | \(-1\) | \(+1\) | 72 |
| 2 | \(+1\) | \(-1\) | \(-1\) | 65 |
| 3 | \(-1\) | \(+1\) | \(-1\) | 78 |
| 4 | \(+1\) | \(+1\) | \(+1\) | 84 |

The estimated effect of A (aliased with BC) is \(\frac{1}{2}[(65 + 84) - (72 + 78)] = -0.5\). The estimated effect of B (aliased with AC) is \(\frac{1}{2}[(78 + 84) - (72 + 65)] = 12.5\). If two-factor interactions are small, temperature has negligible effect while pressure strongly increases yield.
</div>

### General \(2^{k-p}\) Designs

For \(k\) factors, a \(2^{k-p}\) fractional factorial uses \(p\) generators to define the fraction. The **defining relation** is the set of all words formed from products of generators and their products. The **word length pattern** determines the resolution: the shortest word length in the defining relation is the design's resolution.

Choosing an appropriate fraction involves balancing run economy against the ability to estimate effects of interest. **Minimum aberration** designs minimize aliasing among the most important (lowest-order) effects and are tabulated for common values of \(k\) and \(p\) in standard references.

---

# Appendix: Summary of Key Formulas

## Sampling Formulas

| Quantity | Parameter | Estimator | Variance of Estimator |
|---|---|---|---|
| Mean (SRS) | \(\mu\) | \(\bar{y}\) | \(\left(1 - \frac{n}{N}\right)\frac{\sigma^2}{n}\) |
| Proportion (SRS) | \(\pi\) | \(\hat{\pi} = \bar{y}\) | \(\left(1 - \frac{n}{N}\right)\frac{\pi(1-\pi)}{n}\) |
| Mean (Stratified) | \(\mu\) | \(\sum w_h \bar{y}_h\) | \(\sum w_h^2 \frac{\sigma_h^2}{n_h}\left(1 - \frac{n_h}{N_h}\right)\) |
| Regression | \(\mu_y\) | \(\bar{y} + \hat{\beta}(\mu_x - \bar{x})\) | \(\left(1 - \frac{n}{N}\right)\frac{\sigma_r^2}{n}\) |
| Ratio | \(\mu_y\) | \(\frac{\bar{y}}{\bar{x}}\mu_x\) | \(\left(1 - \frac{n}{N}\right)\frac{\sigma_{\text{ratio}}^2}{n}\) |

## Experimental Design Formulas

| Design | Model | df (Residual) | F Statistic |
|---|---|---|---|
| CRD (balanced) | \(Y_{ij} = \mu + \tau_i + R_{ij}\) | \(t(r-1)\) | MS(Trt)/MS(Res) |
| CRD (unbalanced) | \(Y_{ij} = \mu + \tau_i + R_{ij}\) | \(n - t\) | MS(Trt)/MS(Res) |
| RCBD | \(Y_{ij} = \mu + \tau_i + \beta_j + R_{ij}\) | \((r-1)(t-1)\) | MS(Trt)/MS(Res) |
| Factorial CRD | \(Y_{ijk} = \mu + \tau_{ij} + R_{ijk}\) | \(\ell_1\ell_2(r-1)\) | MS(A:B)/MS(Res) |
| Factorial RBD | \(Y_{ijk} = \mu + \tau_{ij} + \beta_k + R_{ijk}\) | By design | MS(Trt)/MS(Res) |

## Confidence Interval Summary

| Model | CI | Distribution of Critical Value |
|---|---|---|
| SRS Mean | \(\bar{y} \pm c\,\frac{\hat{\sigma}}{\sqrt{n}}\sqrt{1 - n/N}\) | \(\mathcal{N}(0,1)\) |
| SRS Proportion | \(\hat{\pi} \pm c\sqrt{\frac{\hat{\pi}(1-\hat{\pi})}{n}(1 - n/N)}\) | \(\mathcal{N}(0,1)\) |
| CRD Treatment Effect | \(\hat{\tau}_i \pm t^*\sqrt{\hat{\sigma}^2/(2r)}\) | \(t(n - q + c)\) |
| CRD Mean Difference | \(\hat{\tau}_i - \hat{\tau}_j \pm t^*\sqrt{\hat{\sigma}^2 \cdot 2/r}\) | \(t(n - t)\) |
| RCBD Treatment Diff. | \(\hat{\tau}_i - \hat{\tau}_j \pm t^*\sqrt{2\hat{\sigma}^2/r}\) | \(t((r-1)(t-1))\) |

## Distributional Results

<div class="theorem">
<strong>Key Distribution Facts.</strong>
<ol>
<li>If \(Z \sim \mathcal{N}(0,1)\), then \(Z^2 \sim \chi^2(1)\).</li>
<li>If \(X \sim \chi^2(m)\) and \(Y \sim \chi^2(n)\) are independent, then \(X + Y \sim \chi^2(m+n)\).</li>
<li>If \(Z \sim \mathcal{N}(0,1)\) and \(X \sim \chi^2(m)\) are independent, then \(Z/\sqrt{X/m} \sim t(m)\).</li>
<li>If \(X \sim \chi^2(m)\) and \(Y \sim \chi^2(n)\) are independent, then \((X/m)/(Y/n) \sim F(m,n)\).</li>
<li>The LS residual satisfies \((n-q+c)\hat{\sigma}^2/\sigma^2 \sim \chi^2(n-q+c)\).</li>
</ol>
</div>
