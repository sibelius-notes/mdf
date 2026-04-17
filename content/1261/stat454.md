---
title: "STAT 454: Sampling Theory and Practice"
subjects: "STAT"
prof: "Changbao Wu"
---

## Sources and References
**Primary texts** — Wu & Thompson (2020) *Sampling Theory and Practice*, Springer; Lohr (2022) *Sampling: Design and Analysis* 3rd ed
**Supplementary texts** — Cochran (1977) *Sampling Techniques* 3rd ed; Särndal, Swensson & Wretman (1992) *Model Assisted Survey Sampling*; Fuller (2009) *Sampling Statistics*

# Chapter 1: Foundations of Probability Sampling

## 1.1 Finite Populations and Basic Setup

A **finite population** is a fixed, identifiable collection of \( N \) units:

\[
U = \{1, 2, \ldots, N\}
\]

Each unit \( i \in U \) carries a value \( y_i \) of the variable of interest. The primary inferential targets are:

- **Population total**: \( T = \sum_{i=1}^N y_i \)
- **Population mean**: \( \bar{Y} = T/N \)
- **Population variance**: \( S^2 = \frac{1}{N-1}\sum_{i=1}^N (y_i - \bar{Y})^2 \)
- **Population proportion**: \( P = \bar{Y} \) when \( y_i \in \{0,1\} \)

The key distinction from classical statistics: there is no probability model generating \( y_1, \ldots, y_N \). All randomness comes solely from the **sampling design** — the mechanism by which a subset \( s \subset U \) is selected.

## 1.2 Sampling Designs and Inclusion Probabilities

A **sampling design** \( p(\cdot) \) is a probability distribution over all possible subsets of \( U \):

\[
p(s) \geq 0 \quad \text{for all } s \subset U, \qquad \sum_{s \subset U} p(s) = 1
\]

The **first-order inclusion probability** of unit \( i \) is:

\[
\pi_i = P(i \in s) = \sum_{s \ni i} p(s)
\]

The **second-order inclusion probability** for units \( i \neq j \) is:

\[
\pi_{ij} = P(i \in s \text{ and } j \in s) = \sum_{s \ni i, j} p(s)
\]

Note \( \pi_{ii} = \pi_i \). For the design to be valid for inference about \( T \), we require \( \pi_i > 0 \) for all \( i \in U \).

The **expected sample size** under design \( p \) is:

\[
E[n(s)] = \sum_{s} n(s) p(s) = \sum_{i=1}^N \pi_i
\]

A design has **fixed sample size** \( n \) if \( n(s) = n \) for every \( s \) with \( p(s) > 0 \).

## 1.3 The Horvitz-Thompson Estimator

The fundamental estimator of the population total \( T \) is the **Horvitz-Thompson (HT) estimator**:

\[
\hat{T}_{HT} = \sum_{i \in s} \frac{y_i}{\pi_i} = \sum_{i \in s} w_i y_i
\]

where \( w_i = 1/\pi_i \) are called **design weights** or **sampling weights**. The weight \( w_i \) represents the number of population units that sampled unit \( i \) "represents."

<div class="theorem">
<strong>Theorem (Unbiasedness of HT Estimator)</strong>: Under any probability sampling design with <em>positive inclusion probabilities</em> \( \pi_i > 0 \) for all \( i \in U \), the HT estimator satisfies \( E[\hat{T}_{HT}] = T \).
</div>

**Proof.** Introduce the indicator variable \( I_i = \mathbf{1}(i \in s) \), so that \( E[I_i] = \pi_i \). Write:

\[
\hat{T}_{HT} = \sum_{i=1}^N I_i \cdot \frac{y_i}{\pi_i}
\]

Taking expectations under the sampling design:

\[
E[\hat{T}_{HT}] = \sum_{i=1}^N \frac{y_i}{\pi_i} \cdot E[I_i] = \sum_{i=1}^N \frac{y_i}{\pi_i} \cdot \pi_i = \sum_{i=1}^N y_i = T \quad \square
\]

The estimator of the population mean is \( \hat{\bar{Y}}_{HT} = \hat{T}_{HT}/N \), also unbiased.

## 1.4 Variance of the HT Estimator

Writing \( \hat{T}_{HT} = \sum_{i=1}^N I_i y_i/\pi_i \), and using \( \text{Var}(I_i) = \pi_i(1-\pi_i) \), \( \text{Cov}(I_i, I_j) = \pi_{ij} - \pi_i \pi_j \):

\[
\text{Var}(\hat{T}_{HT}) = \sum_{i=1}^N \sum_{j=1}^N (\pi_{ij} - \pi_i \pi_j) \frac{y_i}{\pi_i} \frac{y_j}{\pi_j}
\]

where \( \pi_{ii} = \pi_i \) so the diagonal terms contribute \( \sum_i (1 - \pi_i) y_i^2/\pi_i \).

### Sen-Yates-Grundy Form

For **fixed-size designs**, an equivalent expression useful for variance estimation is the **Sen-Yates-Grundy (SYG) form**:

\[
\text{Var}(\hat{T}_{HT}) = -\frac{1}{2} \sum_{i=1}^N \sum_{j \neq i}^N (\pi_{ij} - \pi_i \pi_j)\left(\frac{y_i}{\pi_i} - \frac{y_j}{\pi_j}\right)^2
\]

An unbiased variance estimator using the SYG form is:

\[
\hat{V}_{SYG}(\hat{T}_{HT}) = -\frac{1}{2} \sum_{i \in s} \sum_{j \in s, j \neq i} \frac{\pi_{ij} - \pi_i \pi_j}{\pi_{ij}} \left(\frac{y_i}{\pi_i} - \frac{y_j}{\pi_j}\right)^2
\]

This requires \( \pi_{ij} - \pi_i\pi_j < 0 \) (or \( > 0 \)) for the variance to be non-negative. For many fixed-size designs, \( \pi_{ij} < \pi_i \pi_j \), so the SYG variance is non-negative.

## 1.5 EPSEM Designs and Design Effect

A design is **EPSEM** (Equal Probability of Selection Method) if \( \pi_i = n/N \) for all \( i \in U \). Under EPSEM, the HT estimator simplifies to:

\[
\hat{T}_{HT} = \frac{N}{n}\sum_{i \in s} y_i = N\bar{y}
\]

The **design effect (DEFF)** measures efficiency relative to SRS:

\[
\text{DEFF} = \frac{\text{Var}_{design}(\hat{\bar{Y}})}{\text{Var}_{SRS}(\hat{\bar{Y}})}
\]

A DEFF \(> 1\) indicates the design is less efficient than SRS; DEFF \(< 1\) indicates it is more efficient.

## 1.6 Worked Example: HT Estimator

**Setup.** Population \( U = \{1, 2, 3, 4, 5\} \) with values \( y = (8, 4, 3, 10, 6) \), so \( T = 31 \). Suppose a design selects samples of size 2 with:

| Sample \(s\) | \(p(s)\) |
|---|---|
| \(\{1,2\}\) | 0.15 |
| \(\{1,3\}\) | 0.10 |
| \(\{1,4\}\) | 0.20 |
| \(\{2,3\}\) | 0.10 |
| \(\{2,4\}\) | 0.15 |
| \(\{3,4\}\) | 0.10 |
| \(\{1,5\}\) | 0.05 |
| \(\{2,5\}\) | 0.05 |
| \(\{3,5\}\) | 0.05 |
| \(\{4,5\}\) | 0.05 |

Inclusion probabilities: \( \pi_1 = 0.15+0.10+0.20+0.05 = 0.50 \), \( \pi_2 = 0.45 \), \( \pi_3 = 0.35 \), \( \pi_4 = 0.50 \), \( \pi_5 = 0.20 \).

If \( s = \{1, 4\} \) is observed:

\[
\hat{T}_{HT} = \frac{8}{0.50} + \frac{10}{0.50} = 16 + 20 = 36
\]

One can verify \( E[\hat{T}_{HT}] = 31 = T \) by computing the weighted sum over all samples.

---

# Chapter 2: Simple Random Sampling

## 2.1 Definition and Inclusion Probabilities

**Simple random sampling without replacement (SRSWOR)** selects an unordered subset of size \( n \) from \( N \) units with equal probability:

\[
p(s) = \binom{N}{n}^{-1} \quad \text{for every } |s| = n
\]

The inclusion probabilities follow immediately:

\[
\pi_i = \frac{n}{N} \equiv f, \qquad \pi_{ij} = \frac{n(n-1)}{N(N-1)} \quad (i \neq j)
\]

where \( f = n/N \) is the **sampling fraction**.

## 2.2 Estimators and Exact Variance

Under SRSWOR, the HT estimator of \( T \) is \( \hat{T}_{HT} = (N/n)\sum_{i \in s} y_i = N\bar{y} \), and the estimator of the mean is \( \hat{\bar{Y}} = \bar{y} = n^{-1}\sum_{i \in s} y_i \).

<div class="theorem">
<strong>Theorem (Variance of the Sample Mean under SRSWOR)</strong>: The exact variance of \( \bar{y} \) under SRSWOR is

\[
\text{Var}(\bar{y}) = \frac{1-f}{n} S^2
\]
where \( S^2 = \frac{1}{N-1}\sum_{i=1}^N (y_i - \bar{Y})^2 \) is the population variance and \( 1-f \) is the finite population correction (FPC) factor.
</div>

**Proof via indicator variables.** Write \( \bar{y} = n^{-1}\sum_{i=1}^N I_i y_i \). Then:

\[
\text{Var}(\bar{y}) = \frac{1}{n^2}\left[\sum_{i=1}^N y_i^2 \text{Var}(I_i) + \sum_{i \neq j} y_i y_j \text{Cov}(I_i, I_j)\right]
\]

We have \( \text{Var}(I_i) = \pi_i(1-\pi_i) = \frac{n}{N}\cdot\frac{N-n}{N} \) and \( \text{Cov}(I_i, I_j) = \pi_{ij} - \pi_i\pi_j = \frac{n(n-1)}{N(N-1)} - \frac{n^2}{N^2} = -\frac{n(N-n)}{N^2(N-1)} \).

Substituting and simplifying:

\[
\text{Var}(\bar{y}) = \frac{1}{n^2}\left[\frac{n(N-n)}{N^2}\sum_i y_i^2 - \frac{n(N-n)}{N^2(N-1)}\sum_{i\neq j} y_i y_j\right]
\]

\[
= \frac{N-n}{nN^2}\left[\sum_i y_i^2 - \frac{1}{N-1}\sum_{i\neq j}y_iy_j\right]
\]

Since \( (N-1)\sum_i y_i^2 - \sum_{i\neq j}y_iy_j = N\sum_i(y_i-\bar{Y})^2 = N(N-1)S^2 \):

\[
\text{Var}(\bar{y}) = \frac{N-n}{nN^2} \cdot \frac{N(N-1)S^2}{N-1} = \frac{(1-f)S^2}{n} \quad \square
\]

## 2.3 Variance Estimation and Confidence Intervals

The sample variance \( s^2 = \frac{1}{n-1}\sum_{i \in s}(y_i - \bar{y})^2 \) satisfies \( E[s^2] = S^2 \) under SRSWOR. Therefore, an **unbiased estimator** of \( \text{Var}(\bar{y}) \) is:

\[
\hat{V}(\bar{y}) = \frac{(1-f)s^2}{n}
\]

**Central Limit Theorem for SRS.** Under mild regularity conditions (specifically, that \( \max_i (y_i - \bar{Y})^2 / (NS^2) \to 0 \) as \( N, n \to \infty \) with \( f \to f_0 \in [0,1) \)), the Erdős-Rényi CLT gives:

\[
\frac{\bar{y} - \bar{Y}}{\sqrt{(1-f)S^2/n}} \xrightarrow{d} N(0,1)
\]

An approximate \( 95\% \) confidence interval for \( \bar{Y} \) is:

\[
\bar{y} \pm 1.96\sqrt{\frac{(1-f)s^2}{n}}
\]

## 2.4 Sample Size Determination

To achieve a margin of error \( e \) with confidence level \( 1-\alpha \):

\[
n \geq \frac{z_{\alpha/2}^2 S^2}{e^2 + z_{\alpha/2}^2 S^2 / N}
\]

Ignoring FPC (when \( n \ll N \)): \( n_0 = z_{\alpha/2}^2 S^2 / e^2 \). With FPC: \( n = n_0/(1 + n_0/N) \).

For a proportion \( P \), replace \( S^2 \) by \( P(1-P) \leq 1/4 \), giving a conservative bound:

\[
n \geq \frac{z_{\alpha/2}^2 / 4}{e^2 + z_{\alpha/2}^2/(4N)}
\]

## 2.5 Estimation of Proportions and Subpopulations

For a binary variable \( y_i \in \{0,1\} \), the sample proportion \( \hat{P} = \bar{y} \) estimates \( P = \bar{Y} \) with variance:

\[
\text{Var}(\hat{P}) = \frac{(1-f)}{n} \cdot \frac{NP(1-P)}{N-1} \approx \frac{(1-f)P(1-P)}{n}
\]

For a **subpopulation (domain)** \( U_d \subset U \) of size \( N_d \) (possibly unknown), define \( y_{di} = y_i \cdot \mathbf{1}(i \in U_d) \). The domain total estimator \( \hat{T}_d = (N/n)\sum_{i \in s \cap U_d} y_i \) is unbiased, with variance accounting for random domain sample size \( n_d \).

---

# Chapter 3: Stratified Sampling

## 3.1 Stratification Framework

Partition \( U \) into \( H \) non-overlapping strata \( U_1, \ldots, U_H \) with \( \sum_{h=1}^H N_h = N \). Within each stratum \( h \), take an independent SRS of size \( n_h \), where \( \sum_h n_h = n \).

The **stratified estimator** of the population total is:

\[
\hat{T}_{st} = \sum_{h=1}^H \hat{T}_h = \sum_{h=1}^H N_h \bar{y}_h
\]

Since the stratum estimates are independent:

\[
\text{Var}(\hat{T}_{st}) = \sum_{h=1}^H N_h^2 \cdot \frac{(1-f_h)S_h^2}{n_h}
\]

where \( f_h = n_h/N_h \) and \( S_h^2 = \frac{1}{N_h - 1}\sum_{i \in U_h}(y_i - \bar{Y}_h)^2 \).

## 3.2 Allocation Schemes

Given total sample size \( n \), allocate \( n_h \) to minimize \( \text{Var}(\hat{T}_{st}) \).

**Proportional allocation**: \( n_h = n \cdot N_h / N \). The variance simplifies to:

\[
\text{Var}_{prop}(\hat{\bar{Y}}_{st}) = \frac{1-f}{n}\sum_{h=1}^H W_h S_h^2
\]

where \( W_h = N_h/N \) are stratum weights.

**Neyman (optimal) allocation**: Minimize variance subject to fixed \( n = \sum_h n_h \). Using Lagrange multipliers with \( L = \sum_h N_h^2 S_h^2/n_h - \lambda(\sum_h n_h - n) \):

\[
\frac{\partial L}{\partial n_h} = -\frac{N_h^2 S_h^2}{n_h^2} - \lambda = 0 \implies n_h \propto N_h S_h
\]

<div class="theorem">
<strong>Theorem (Neyman Allocation)</strong>: The allocation minimizing \( \text{Var}(\hat{T}_{st}) \) for fixed total \( n \) is

\[
n_h = n \cdot \frac{N_h S_h}{\sum_{k=1}^H N_k S_k}
\]
and the resulting optimal variance is

\[
\text{Var}_{opt}(\hat{\bar{Y}}_{st}) = \frac{1}{n}\left(\sum_{h=1}^H W_h S_h\right)^2 - \frac{1}{N}\sum_{h=1}^H W_h S_h^2
\]
</div>

**Variance inequalities.** One can show:

\[
\text{Var}_{opt} \leq \text{Var}_{prop} \leq \text{Var}_{SRS}
\]

The second inequality holds with equality only when all stratum means are equal. The gain from proportional over SRS is:

\[
\text{Var}_{SRS} - \text{Var}_{prop} = \frac{1-f}{n}\sum_{h=1}^H W_h(\bar{Y}_h - \bar{Y})^2 \geq 0
\]

This is the **between-stratum variance component** — stratification gains by eliminating it from the estimator's variance.

**Cost-optimal allocation.** If surveying a unit in stratum \( h \) costs \( c_h \) and total budget is \( C \), the cost-constrained optimum is:

\[
n_h \propto \frac{N_h S_h}{\sqrt{c_h}}
\]

**Power allocation**: A compromise \( n_h \propto N_h^q \) for \( q \in [0,1] \). When \( q=1 \): proportional; when \( q \to 0 \): equal allocation.

## 3.3 Post-Stratification

When stratum membership is only known after sampling (e.g., gender observed at interview), define the **post-stratified estimator**:

\[
\hat{\bar{Y}}_{ps} = \sum_{h=1}^H W_h \bar{y}_h
\]

The post-stratified estimator is approximately (conditionally) unbiased. Its approximate variance is:

\[
\text{Var}(\hat{\bar{Y}}_{ps}) \approx \frac{1}{n}\sum_{h=1}^H W_h S_h^2\left(1 - W_h\right) + \frac{1}{n^2}\sum_{h=1}^H \frac{W_h S_h^2(1-W_h)^2}{n\cdot W_h}
\]

In practice, the simpler approximation \( \text{Var}(\hat{\bar{Y}}_{ps}) \approx (1/n)\sum_h W_h S_h^2 \) is used for large \( n \). Post-stratification nearly achieves proportional allocation efficiency when strata are well-chosen.

## 3.4 Worked Example: Neyman Allocation

**Problem.** A survey of household incomes has \( N = 10{,}000 \) households in 3 strata. Stratum sizes and income standard deviations:

| Stratum | \( N_h \) | \( S_h \) (\$1000) | \( N_h S_h \) |
|---|---|---|---|
| 1 (low) | 5000 | 10 | 50000 |
| 2 (middle) | 3000 | 20 | 60000 |
| 3 (high) | 2000 | 40 | 80000 |
| Total | 10000 | — | 190000 |

With \( n = 500 \): \( n_1 = 500 \cdot 50000/190000 \approx 132 \), \( n_2 \approx 158 \), \( n_3 \approx 211 \).

Compare to proportional: \( n_1 = 250 \), \( n_2 = 150 \), \( n_3 = 100 \). Neyman over-samples the high-income stratum because its variance is larger.

---

# Chapter 4: Ratio and Regression Estimation

## 4.1 Auxiliary Information

Suppose we observe an auxiliary variable \( x_i \) correlated with \( y_i \), and the population mean \( \bar{X} \) (or total \( T_x \)) is known. Exploiting this relationship can substantially reduce variance.

## 4.2 Ratio Estimator

The **ratio estimator** of \( \bar{Y} \) is:

\[
\hat{\bar{Y}}_R = \hat{R}\bar{X} = \frac{\bar{y}}{\bar{x}}\bar{X}
\]

where \( \hat{R} = \bar{y}/\bar{x} \) estimates the ratio \( R = \bar{Y}/\bar{X} \).

**Bias of the ratio estimator.** Using a first-order Taylor expansion about \( (\bar{Y}, \bar{X}) \):

\[
\hat{R} \approx R + \frac{1}{\bar{X}}(\bar{y} - \bar{Y}) - \frac{R}{\bar{X}}(\bar{x} - \bar{X})
\]

Taking expectations:

\[
\text{Bias}(\hat{\bar{Y}}_R) = -\frac{\bar{X}}{\bar{X}}\text{Cov}(\bar{y}, \bar{x})\frac{R}{\bar{X}} + \frac{R}{\bar{X}}\text{Var}(\bar{x}) \approx \frac{(1-f)}{n\bar{X}}(RS_x^2 - S_{xy})
\]

where \( S_{xy} = \frac{1}{N-1}\sum_{i=1}^N (y_i - \bar{Y})(x_i - \bar{X}) \). The bias is \( O(n^{-1}) \) and is negligible for large \( n \).

**Approximate variance.** Let \( d_i = y_i - Rx_i \). Then:

\[
\text{Var}(\hat{\bar{Y}}_R) \approx \frac{(1-f)}{n}S_d^2, \qquad S_d^2 = \frac{1}{N-1}\sum_{i=1}^N (y_i - Rx_i)^2
\]

The ratio estimator outperforms \( \bar{y} \) when \( S_d^2 < S_y^2 \), i.e., when \( \rho_{xy} > C_x/(2C_y) \) where \( C_x, C_y \) are the coefficients of variation. A rough rule: the ratio estimator helps when \( \rho_{xy} > 0.5 \cdot (C_x/C_y) \).

## 4.3 Regression Estimator

The **difference estimator** corrects \( \bar{y} \) using the discrepancy between \( \bar{x} \) and \( \bar{X} \):

\[
\hat{\bar{Y}}_{reg} = \bar{y} + \hat{B}(\bar{X} - \bar{x})
\]

where \( \hat{B} = s_{xy}/s_x^2 \) is the sample regression coefficient, with:

\[
s_{xy} = \frac{1}{n-1}\sum_{i \in s}(y_i - \bar{y})(x_i - \bar{x}), \quad s_x^2 = \frac{1}{n-1}\sum_{i \in s}(x_i - \bar{x})^2
\]

The regression estimator is **approximately unbiased** (bias is \( O(n^{-2}) \)) with approximate variance:

\[
\text{Var}(\hat{\bar{Y}}_{reg}) \approx \frac{(1-f)S_y^2(1-\rho^2)}{n}
\]

where \( \rho = S_{xy}/(S_x S_y) \) is the population correlation coefficient. This is always \( \leq \text{Var}(\bar{y}) \), with equality when \( \rho = 0 \). The **variance reduction factor** is \( (1-\rho^2) \): if \( |\rho| = 0.9 \), the variance is reduced by \( 81\% \).

**Comparison: ratio vs. regression.** The ratio estimator imposes the constraint that the regression line passes through the origin. When the true model is \( y_i = \beta x_i + \epsilon_i \) (no intercept), ratio and regression estimators are equivalent. When an intercept is appropriate, the regression estimator is superior.

## 4.4 Calibration and GREG Estimators

The **generalized regression (GREG) estimator** arises from model-assisted estimation and produces **calibrated weights** \( g_i \) satisfying:

\[
\sum_{i \in s} g_i \mathbf{x}_i = \mathbf{X}_{total}
\]

where \( \mathbf{x}_i \) is a vector of auxiliary variables and \( \mathbf{X}_{total} = \sum_{i=1}^N \mathbf{x}_i \) is the known population total.

The GREG estimator of \( T \) is:

\[
\hat{T}_{GREG} = \sum_{i \in s} g_i w_i y_i
\]

where the calibration weights are:

\[
g_i = 1 + (\mathbf{X}_{total} - \hat{\mathbf{X}}_{HT})^T (\hat{\mathbf{V}})^{-1} \mathbf{x}_i / w_i
\]

with \( \hat{\mathbf{V}} = \sum_{i \in s} \mathbf{x}_i \mathbf{x}_i^T w_i^2 / (w_i - 1) \) (under equal-probability sampling, this simplifies). The GREG estimator is **design-consistent** regardless of whether the working model is correct.

**Worked example (GREG weights).** Suppose \( n = 4 \), \( N = 20 \), with design weights \( w_i = 5 \) (SRSWOR), one auxiliary variable \( x \) with \( \bar{X} = 10 \) (known). Observed \( x \) values: \( 8, 12, 9, 11 \), so \( \bar{x} = 10 \). The calibration equation \( \sum g_i w_i x_i = 20 \times 10 = 200 \) gives \( 5\sum g_i x_i = 200 \), so \( \sum g_i x_i = 40 \). The GREG solution here simplifies to the regression estimator since the one-dimensional calibration has a closed form.

---

# Chapter 5: Unequal Probability Sampling

## 5.1 Motivation for Unequal Probabilities

When units have a known size measure \( x_i > 0 \) (e.g., establishment size, household size), sampling with probability proportional to size (PPS) can yield a self-weighting estimator with substantially lower variance than SRS.

The ideal: \( \pi_i \propto y_i \), giving \( y_i/\pi_i = T/n \) (constant), so \( \text{Var}(\hat{T}_{HT}) = 0 \). Since \( y_i \) is unknown, we use the correlated proxy \( x_i \).

## 5.2 PPS Sampling With Replacement

In **PPS with replacement**, at each of \( n \) draws, select unit \( i \) with probability \( p_i = x_i / X_{total} \). The **Hansen-Hurwitz (HH) estimator** is:

\[
\hat{T}_{HH} = \frac{1}{n}\sum_{k=1}^n \frac{y_{i_k}}{p_{i_k}}
\]

where \( i_k \) is the unit selected on draw \( k \).

<div class="theorem">
<strong>Theorem (Unbiasedness and Variance of HH Estimator)</strong>: The HH estimator is unbiased for \( T \) with variance

\[
\text{Var}(\hat{T}_{HH}) = \frac{1}{n}\sum_{i=1}^N p_i \left(\frac{y_i}{p_i} - T\right)^2
\]
</div>

This is zero when \( y_i \propto p_i \propto x_i \). An unbiased variance estimator is:

\[
\hat{V}(\hat{T}_{HH}) = \frac{1}{n(n-1)}\sum_{k=1}^n\left(\frac{y_{i_k}}{p_{i_k}} - \hat{T}_{HH}\right)^2
\]

## 5.3 PPS Without Replacement

Sampling without replacement with \( \pi_i \propto x_i \) is theoretically superior to PPS WR, but constructing such designs for \( n > 2 \) is more complex.

**Brewer's method (n = 2).** For \( n = 2 \) from population of \( N \) units with \( p_i = x_i/X_{total} \):

1. Select unit \( i \) with probability \( p_i^* = p_i(1-p_i) / \sum_k p_k(1-p_k) \)
2. Select unit \( j \neq i \) with probability \( p_j / (1 - p_i) \)

Then \( \pi_i = 2p_i \) and \( \pi_{ij} = 2p_i p_j(1-p_i)^{-1}(1-p_j)^{-1}\cdot \sum_k p_k(1-p_k)/(2(\sum_k p_k(1-p_k))) \).

**Sampford's method.** For general \( n \), Sampford's rejective procedure draws with probability proportional to \( p_i/(1-np_i) \) subject to no repeats, yielding \( \pi_i = np_i \) exactly.

**Rao-Hartley-Cochran (RHC) scheme.** Divide the population into \( n \) groups randomly, then sample one unit from each group with PPS:
- Simple to implement, gives approximately PPS sampling
- Variance estimator is straightforward

## 5.4 Systematic PPS Sampling

List units with cumulative size measures \( C_i = \sum_{k=1}^i x_k \). Select a uniform random start \( u \sim \text{Uniform}(0, X_{total}/n) \), then sample units where \( C_{i-1} < u + (k-1)X_{total}/n \leq C_i \) for \( k = 1, \ldots, n \). This gives \( \pi_i = nx_i/X_{total} \).

Systematic PPS is widely used in practice. Its drawback is that second-order inclusion probabilities are not easily computed, complicating variance estimation.

## 5.5 Self-Weighting Designs

A design is **self-weighting** (or approximately self-weighting) when \( w_i = 1/\pi_i \approx c \) for all units. This simplifies weighting and reduces nonresponse bias. PPS systematic sampling combined with a compact listing tends to produce approximately self-weighting designs.

---

# Chapter 6: Systematic Sampling

## 6.1 Linear Systematic Sampling

With \( N = nk \) (\( k = N/n \) an integer), a **1-in-\(k\) systematic sample** proceeds:

1. Select a random start \( r \sim \text{Uniform}\{1, 2, \ldots, k\}\ \)
2. Include units \( r, r+k, r+2k, \ldots, r+(n-1)k \)

All \( k \) possible samples are equally likely: \( p(s_r) = 1/k \). Inclusion probabilities are \( \pi_i = n/N \) (same as SRSWOR), so the sample mean \( \bar{y} \) is unbiased for \( \bar{Y} \).

**Circular systematic sampling.** When \( N/n \) is not an integer, number units \( 0, \ldots, N-1 \), select random start \( r \in \{0,\ldots,N-1\}\ \), and include units \( r, r+\lfloor N/n \rfloor, r+2\lfloor N/n\rfloor,\ldots \pmod{N} \). All units have equal inclusion probability.

## 6.2 Systematic Sampling as a Cluster

A systematic sample with start \( r \) can be viewed as **one cluster** selected from \( k \) possible clusters \( s_1, \ldots, s_k \). Since only one cluster is observed, the **within-design variance cannot be estimated** from the data alone:

\[
\text{Var}_{sys}(\bar{y}) = \frac{1}{k}\sum_{r=1}^k (\bar{y}_{s_r} - \bar{Y})^2
\]

This is the variance across the \( k \) possible samples — a fixed quantity, not estimable from a single realization.

## 6.3 Efficiency Under Different Population Orderings

The efficiency of systematic sampling depends critically on how units are ordered:

| Population type | Comparison to SRS |
|---|---|
| Random order | \( \approx \) Equal efficiency |
| Monotone trend | More efficient (systematic captures spread) |
| Periodic with period dividing \( k \) | Much less efficient (all samples similar) |
| Sorted on correlated \( x \) | More efficient |

Analytically, define the **intraclass correlation** within a systematic sample:

\[
\rho_{sys} = 1 - \frac{S^2_{within}}{S^2}
\]

Then \( \text{Var}_{sys} = \text{Var}_{SRS}[1 + (n-1)\rho_{sys}] \). When \( \rho_{sys} < 0 \) (monotone trend), systematic is better than SRS.

## 6.4 Variance Estimation

Since only one systematic sample is observed, approximation methods are needed:

**Successive differences estimator:**

\[
\hat{V}_{SD}(\bar{y}) = \frac{1}{2n(n-1)}\sum_{j=1}^{n-1}(y_{r+jk} - y_{r+(j+1)k})^2
\]

**Collapsed strata approximation.** Treat pairs of consecutive units as strata with \( n_h = 2 \), and apply the two-observation variance estimator for each stratum. Under systematic sampling, this typically overestimates the variance.

**Wolter's method.** Divide the systematic sample into \( g \) random groups of size \( m = n/g \), compute group means, and estimate variance from between-group variation.

---

# Chapter 7: Cluster and Multi-Stage Sampling

## 7.1 Rationale for Cluster Sampling

In large geographic surveys, a complete sampling frame may be unavailable, or travel costs may make it prohibitive to interview dispersed individuals. **Cluster sampling** selects groups (clusters) rather than individual units, reducing costs at the expense of statistical efficiency.

## 7.2 Single-Stage Cluster Sampling

Partition \( U \) into \( K \) clusters \( C_1, \ldots, C_K \) of sizes \( M_1, \ldots, M_K \), with \( N = \sum_k M_k \). Select a SRS of \( k \) clusters (no subsampling). The unbiased estimator of \( T \) is:

\[
\hat{T}_{cl} = \frac{K}{k}\sum_{i \in s_{cl}} T_i, \qquad T_i = \sum_{j \in C_i} y_{ij}
\]

The variance is that of a SRS of cluster totals:

\[
\text{Var}(\hat{T}_{cl}) = K^2 \cdot \frac{(1 - k/K)}{k} S_T^2, \qquad S_T^2 = \frac{1}{K-1}\sum_{i=1}^K (T_i - \bar{T})^2
\]

## 7.3 Design Effect and Intracluster Correlation

For equal-size clusters of size \( M \), define the **intracluster correlation coefficient (ICC)**:

\[
\rho = \frac{\frac{1}{K M(M-1)}\sum_{i=1}^K\sum_{j\neq j'} (y_{ij} - \bar{Y})(y_{ij'} - \bar{Y})}{S^2}
\]

<div class="theorem">
<strong>Theorem (DEFF for Cluster Sampling)</strong>: For equal-size clusters of size \( M \) under SRS of clusters,

\[
\text{DEFF} = 1 + (M-1)\rho
\]
</div>

This shows:
- \( \rho > 0 \) (units within clusters are similar): DEFF \(> 1\), efficiency loss
- \( \rho = 0 \) (no clustering effect): DEFF \(= 1\), same as SRS
- \( \rho < 0 \) (unusual): DEFF \(< 1\)

Typical surveys have \( \rho \in (0.01, 0.3) \). With \( M = 20 \) and \( \rho = 0.1 \), DEFF \(= 2.9\) — nearly 3× as many units needed for same precision!

## 7.4 Optimal Cluster Size

In a two-cost model with cost-per-cluster \( c_1 \) and cost-per-unit-within-cluster \( c_2 \), total cost \( C = kc_1 + kMc_2 \). The optimal cluster size minimizing variance for fixed cost is:

\[
M^* = \sqrt{\frac{c_1}{c_2} \cdot \frac{1 - \rho}{\rho}}
\]

Interpretation: take **smaller** clusters when \( \rho \) is large (high homogeneity) or when within-cluster costs are low relative to cluster-opening costs.

## 7.5 Two-Stage Sampling

**Two-stage design**: Select \( k \) primary sampling units (PSUs) by SRS; within each selected PSU \( i \), select \( m_i \) secondary units (SSUs) by SRS from \( M_i \).

The two-stage HT estimator is:

\[
\hat{T}_{2st} = \frac{K}{k}\sum_{i \in s_1} \frac{M_i}{m_i}\sum_{j \in s_{2i}} y_{ij}
\]

**Variance decomposition.** The total variance has two components:

\[
\text{Var}(\hat{T}_{2st}) = \underbrace{K^2\frac{1-f_1}{k}S_{T}^2}_{\text{between-PSU}} + \underbrace{\frac{K}{k}\sum_{i=1}^K M_i^2 \frac{1-f_{2i}}{m_i}S_{wi}^2}_{\text{within-PSU}}
\]

where \( f_1 = k/K \), \( f_{2i} = m_i/M_i \), \( S_{wi}^2 \) is the within-PSU variance.

**Unequal cluster sizes and PPS at first stage.** If PSUs are selected with PPS (\( \pi_i \propto M_i \)) and SSUs by SRS of constant size \( m \), the design is approximately self-weighting with \( \pi_i = km_i/N \approx km/N \).

**Three-stage sampling.** In large national surveys (e.g., provinces → counties → households), three stages are common. The variance formula extends recursively. The dominant term is typically between-PSU variation, so increasing the number of PSUs is more efficient than increasing within-PSU sample sizes.

---

# Chapter 8: Model-Based Inference

## 8.1 The Superpopulation Model Approach

In the **model-based (or prediction) approach**, we view the finite population values \( y_1, \ldots, y_N \) as realizations of random variables from a **superpopulation model** \( \xi \):

\[
y_i = \mathbf{x}_i^T \boldsymbol{\beta} + \varepsilon_i, \qquad E_\xi[\varepsilon_i] = 0, \quad \text{Var}_\xi[\varepsilon_i] = \sigma^2 v_i
\]

where \( v_i \) are known constants (often \( v_i = x_i \) for proportional-to-size models), and the errors are uncorrelated: \( \text{Cov}_\xi(\varepsilon_i, \varepsilon_j) = 0 \) for \( i \neq j \).

**Notation:** \( E_\xi \) denotes expectation under the model; \( E_p \) denotes expectation under the design.

## 8.2 Best Linear Unbiased Predictor

The population total is \( T = \sum_{i \in s} y_i + \sum_{i \notin s} y_i \). The sampled part is observed; the **prediction problem** is to estimate \( T_r = \sum_{i \notin s} y_i \) (non-sampled total).

Under the model \( \xi \), the **BLUP** of \( T_r \) is:

\[
\tilde{T}_r = \sum_{i \notin s} \mathbf{x}_i^T \hat{\boldsymbol{\beta}}
\]

where \( \hat{\boldsymbol{\beta}} = (\mathbf{X}_s^T \mathbf{V}_s^{-1} \mathbf{X}_s)^{-1} \mathbf{X}_s^T \mathbf{V}_s^{-1} \mathbf{y}_s \) is the GLS estimator, with \( \mathbf{V}_s = \text{diag}(v_i, i \in s) \).

The model-based estimator of \( T \) is:

\[
\hat{T}_{MB} = \sum_{i \in s} y_i + \sum_{i \notin s} \mathbf{x}_i^T \hat{\boldsymbol{\beta}}
\]

This equals the GREG estimator under the design-based approach — the two frameworks converge.

## 8.3 Design Consistency and Robustness

A key property: the GREG/model-based estimator is **design-consistent** even if the working model is wrong. Specifically, as \( n, N \to \infty \):

\[
\hat{T}_{GREG} - T = O_p\left(\sqrt{N/n}\right)
\]

regardless of the model. This **robustness** makes GREG widely used in official statistics.

<div class="theorem">
<strong>Theorem (Design Consistency of GREG)</strong>: Under regularity conditions (bounded \( y_i, x_i \), \( \pi_i \geq cn/N \) for some \( c > 0 \)), the GREG estimator satisfies

\[
\frac{\hat{T}_{GREG} - T}{\sqrt{\text{Var}_p(\hat{T}_{GREG})}} \xrightarrow{d} N(0,1)
\]
under repeated sampling from the fixed population.
</div>

## 8.4 Synthetic and Composite Estimators

For **small area estimation**, when the domain sample size \( n_d \) is small, the direct estimator \( \hat{\bar{Y}}_d \) has high variance. Alternatives:

**Synthetic estimator:** Borrow strength from the full sample using the model:

\[
\hat{\bar{Y}}_d^{syn} = \bar{\mathbf{X}}_d^T \hat{\boldsymbol{\beta}}
\]

Potentially biased but low variance if the model holds.

**Composite estimator:** Trade-off between direct (unbiased, high variance) and synthetic (biased, low variance):

\[
\hat{\bar{Y}}_d^{comp} = \phi_d \hat{\bar{Y}}_d^{dir} + (1-\phi_d)\hat{\bar{Y}}_d^{syn}
\]

The optimal weight \( \phi_d^* \) minimizes mean squared error:

\[
\phi_d^* = \frac{\sigma^2_d / n_d}{\sigma^2_d / n_d + B_d^2}
\]

where \( B_d \) is the synthetic estimator's bias. In practice \( \phi_d^* \) is estimated, leading to the **empirical BLUP (EBLUP)**.

## 8.5 Godambe's Unified Framework

Godambe (1955) showed that no **uniformly minimum variance unbiased estimator (UMVUE)** of \( T \) exists for most designs and populations. This demonstrates the fundamental limitation of the design-based approach and motivates combining design and model considerations.

The **optimal estimating equation** approach seeks estimators satisfying:

\[
\sum_{i \in s} \frac{y_i - \hat{T}/N}{\pi_i} = 0
\]

which leads back to the HT estimator — confirming its central role.

---

# Chapter 9: Variance Estimation for Complex Surveys

## 9.1 The Problem of Variance Estimation

In complex surveys with stratification, clustering, and unequal probabilities, standard variance formulas are not applicable. We need methods that:
1. Account for the actual design features
2. Are computable from the observed sample
3. Produce consistent estimates as \( n \to \infty \)

The three main approaches are **linearization (Taylor series)**, **jackknife**, and **bootstrap/BRR**.

## 9.2 Linearization (Taylor Series / Delta Method)

For a nonlinear statistic \( \hat{\theta} = g(\hat{\mathbf{T}}) \) where \( \hat{\mathbf{T}} = (\hat{T}_1, \ldots, \hat{T}_p) \) are HT estimators of population totals:

\[
\hat{\theta} - \theta \approx \sum_{k=1}^p \left.\frac{\partial g}{\partial T_k}\right|_{\mathbf{T}} (\hat{T}_k - T_k) = \sum_{i \in s} \frac{z_i}{\pi_i} - Z
\]

where \( z_i \) are **linearized values** (influence function values). The variance is then approximated by:

\[
\text{Var}(\hat{\theta}) \approx \text{Var}(\hat{Z}_{HT})
\]

which can be estimated using the standard HT variance estimator for \( z_i \).

**Example: ratio estimator.** For \( \hat{R} = \hat{T}_y/\hat{T}_x \), linearize about \( (T_y, T_x) \):

\[
\hat{R} - R \approx \frac{\hat{T}_y - T_y}{T_x} - \frac{T_y}{T_x^2}(\hat{T}_x - T_x) = \frac{1}{T_x}(\hat{T}_y - R\hat{T}_x)
\]

so the linearized variable is \( z_i = (y_i - Rx_i)/\bar{X} \), and:

\[
\hat{V}_{lin}(\hat{R}) = \frac{1}{\hat{T}_x^2}\hat{V}(\hat{T}_y - \hat{R}\hat{T}_x) = \frac{(1-f)}{n\bar{x}^2}s_d^2
\]

where \( s_d^2 = \frac{1}{n-1}\sum_{i \in s}(y_i - \hat{R}x_i)^2 \).

## 9.3 Jackknife Variance Estimation

The **delete-one jackknife** removes one observation at a time and recomputes the statistic:

\[
\hat{\theta}_{(l)} = \text{estimator computed from } s \setminus \{l\}
\]

The jackknife variance estimate is:

\[
v_{JK}(\hat{\theta}) = \frac{n-1}{n}\sum_{l \in s}(\hat{\theta}_{(l)} - \hat{\theta})^2
\]

**Properties:**
- Consistent for smooth statistics (differentiable functions of totals)
- Fails for non-smooth statistics (e.g., quantiles, max)
- Computationally intensive for large \( n \) but straightforward to implement

**Delete-one-cluster jackknife** for multi-stage designs: Delete the entire PSU \( l \) at a time, adjusting weights within the remaining PSUs:

\[
v_{JK,cl}(\hat{\theta}) = \frac{k-1}{k}\sum_{l=1}^k (\hat{\theta}_{(l)} - \hat{\theta})^2
\]

where \( k \) is the number of sampled PSUs and \( \hat{\theta}_{(l)} \) uses adjusted weights \( w_i^{(l)} = w_i \cdot k/(k-1) \) for \( i \) in PSUs other than \( l \). This correctly accounts for PSU-level clustering.

## 9.4 Balanced Repeated Replication (BRR)

**Setup.** Assume a stratified design with \( H \) strata, each with exactly 2 PSUs sampled (\( n_h = 2 \)). A BRR **replicate** \( \alpha \) selects one PSU from each stratum using a \( \pm 1 \) assignment.

**Hadamard matrix construction.** For \( A \) replicates (where \( A \geq H \) and \( A \) is a multiple of 4), construct a Hadamard matrix \( \mathbf{H}_{A\times A} \) with entries \( \pm 1 \). Replicate \( \alpha \) selects PSU 1 in stratum \( h \) if \( H_{\alpha h} = +1 \) and PSU 2 if \( H_{\alpha h} = -1 \). The adjusted weight for replicate \( \alpha \) in stratum \( h \) is:

\[
w_i^{(\alpha)} = \begin{cases} 2w_i & \text{if PSU } i \text{ is selected in replicate } \alpha \\ 0 & \text{otherwise} \end{cases}
\]

The BRR variance estimate is:

\[
v_{BRR}(\hat{\theta}) = \frac{1}{A}\sum_{\alpha=1}^A (\hat{\theta}_\alpha - \hat{\theta})^2
\]

<div class="theorem">
<strong>Theorem (Unbiasedness of BRR)</strong>: For a linear statistic \( \hat{\theta} = \sum_{h=1}^H \sum_{j=1}^2 c_{hj} y_{hj} \), the BRR variance estimator is exactly unbiased: \( E[v_{BRR}(\hat{\theta})] = \text{Var}(\hat{\theta}) \).
</div>

For nonlinear statistics, BRR is approximately unbiased and consistent. The **Fay modification** uses \( w_i^{(\alpha)} = \epsilon w_i \) for the non-selected PSU (typically \( \epsilon = 0.5 \)) to reduce instability.

## 9.5 Bootstrap Methods for Complex Surveys

Standard nonparametric bootstrap (resample with replacement) does not respect the survey design. The **Rao-Wu-Yue (1992) rescaling bootstrap** corrects this.

**Algorithm for stratified multistage sampling:**

1. From stratum \( h \) with \( n_h \) sampled PSUs, draw \( m_h = n_h - 1 \) PSUs with replacement
2. Rescale bootstrap weights: \( w_i^* = w_i \cdot \frac{n_h}{m_h}\left[1 + \sqrt{\frac{n_h - m_h}{m_h}} (r_i^* - 1)\right] \) where \( r_i^* \) = number of times PSU \( i \) appears in the bootstrap draw
3. Compute \( \hat{\theta}^* \) using bootstrap weights
4. Repeat \( B \) times; estimate variance as \( v_{boot} = B^{-1}\sum_{b=1}^B (\hat{\theta}^{(b)} - \hat{\theta})^2 \)

The rescaling ensures that the bootstrap variance is approximately equal to the design variance. The method generalizes to \( m_h \neq n_h - 1 \); the factor \( \sqrt{(n_h - m_h)/m_h} \) corrects for using \( m_h < n_h - 1 \) to save computation.

## 9.6 Confidence Intervals and Degrees of Freedom

For complex surveys, the effective degrees of freedom for a \( t \)-based confidence interval is:

\[
\nu = \frac{[\hat{V}(\hat{\theta})]^2}{\sum_h \frac{[\hat{V}_h(\hat{\theta})]^2}{n_h - 1}} \quad \text{(Satterthwaite approximation)}
\]

The confidence interval is:

\[
\hat{\theta} \pm t_{\nu, \alpha/2} \sqrt{\hat{V}(\hat{\theta})}
\]

When \( \nu \) is large (many strata and PSUs), \( t_{\nu, 0.025} \approx 1.96 \). For small surveys with few PSUs, using the correct \( t \)-distribution critical value can be important.

---

# Chapter 10: Advanced Topics and Current Research

## 10.1 Nonresponse and Weighting Adjustments

Survey nonresponse introduces **selection bias** if respondents differ systematically from nonrespondents. The total survey error model decomposes error into sampling error, nonresponse bias, and measurement error.

**Weighting for nonresponse.** Under the quasi-randomization model, unit \( i \) responds with probability \( \phi_i \). If \( \phi_i \) depends only on observed auxiliaries \( \mathbf{x}_i \), we can estimate \( \phi_i \) via logistic regression:

\[
\text{logit}(\phi_i) = \mathbf{x}_i^T \boldsymbol{\gamma}
\]

The **nonresponse-adjusted weight** is \( w_i^{adj} = w_i / \hat{\phi}_i \). The resulting estimator is:

\[
\hat{T}_{NR} = \sum_{i \in r} w_i^{adj} y_i
\]

where \( r \) is the set of respondents. This is consistent when the response propensity model is correctly specified (**propensity score weighting**).

**Imputation.** Rather than reweighting, **imputation** fills in missing values:
- **Mean imputation**: Replace \( y_i \) with \( \bar{y}_{R} \) (respondent mean) — biases variance downward
- **Hot-deck imputation**: Replace with value from a similar respondent (donor)
- **Multiple imputation (MI)**: Create \( M \) imputed datasets, analyze each, and combine via Rubin's rules: \( \hat{\theta}_{MI} = M^{-1}\sum_{m=1}^M \hat{\theta}^{(m)} \), variance \( = \bar{U} + (1+M^{-1})B \) where \( \bar{U} \) is within-imputation variance and \( B \) is between-imputation variance

## 10.2 Analytical Inference from Survey Data

When the goal is **analytical** (fitting a model, testing a hypothesis) rather than **descriptive** (estimating a population total), design-based corrections are needed.

**Design-based regression.** Fit \( y_i = \mathbf{x}_i^T \boldsymbol{\beta} + \epsilon_i \) using the **weighted estimating equations**:

\[
\hat{\boldsymbol{\beta}}_{WLS} = \left(\sum_{i \in s} w_i \mathbf{x}_i \mathbf{x}_i^T\right)^{-1} \sum_{i \in s} w_i \mathbf{x}_i y_i
\]

This estimates the **census coefficient** \( \boldsymbol{\beta}_U = (\mathbf{X}_U^T \mathbf{X}_U)^{-1}\mathbf{X}_U^T \mathbf{y}_U \). The variance is:

\[
\text{Var}(\hat{\boldsymbol{\beta}}_{WLS}) = \mathbf{A}^{-1} \text{Var}\left(\sum_{i \in s} w_i \mathbf{x}_i e_i\right) \mathbf{A}^{-1}
\]

where \( \mathbf{A} = \sum_{i \in s} w_i \mathbf{x}_i\mathbf{x}_i^T / N \) and \( e_i = y_i - \mathbf{x}_i^T \hat{\boldsymbol{\beta}} \) are residuals. The sandwich (robust) estimator of variance is consistent under the design.

**Linearization approach.** The function \( \hat{\boldsymbol{\beta}}_{WLS} \) is a smooth function of estimated totals \( (\hat{T}_{xy_k}, \hat{T}_{x_k x_l}) \), so the delta method applies. This yields the same sandwich estimator.

**Chi-square tests for complex surveys.** The Rao-Scott correction adjusts the standard Pearson chi-square statistic for design effects:

\[
X_{RS}^2 = \frac{X_P^2}{\hat{\delta}} \sim \chi^2_{df} \quad \text{approximately}
\]

where \( \hat{\delta} \) is an estimated design effect for the test statistic.

## 10.3 Calibration and Raking

**Raking (iterative proportional fitting)** extends calibration to multiple auxiliary variables when only marginal totals (not joint totals) are known. Starting from design weights, alternately calibrate to each auxiliary variable's marginal total until convergence.

The raking estimator satisfies \( \sum_{i \in s} \tilde{w}_i x_{ik} = X_{k,total} \) for each auxiliary \( k \), and minimizes a distance function \( \sum_{i \in s} d(w_i, \tilde{w}_i) \) where \( d \) is a chi-squared distance or entropy distance.

**Properties of calibrated estimators:**
- Consistent under the design
- Model-assisted: more efficient when auxiliaries are correlated with \( y \)
- Reproducible marginals (useful for official statistics)

## 10.4 Simulation Studies in Survey Sampling

**Simulation methodology** in survey sampling typically involves:

1. **Generate a finite population** from a superpopulation model: \( y_i = \mathbf{x}_i^T \boldsymbol{\beta} + \varepsilon_i \), \( \varepsilon_i \sim N(0, \sigma^2 v_i) \), \( i = 1,\ldots,N \)

2. **Repeatedly draw samples**: For \( B = 1000\) iterations, draw sample \( s_b \) according to design, compute \( \hat{\theta}_b \)

3. **Evaluate performance metrics**:
   - Monte Carlo bias: \( \widehat{\text{Bias}} = B^{-1}\sum_b \hat{\theta}_b - \theta \)
   - Monte Carlo variance: \( \widehat{\text{Var}} = (B-1)^{-1}\sum_b (\hat{\theta}_b - \bar{\hat{\theta}})^2 \)
   - Relative bias: \( \widehat{\text{RB}} = \widehat{\text{Bias}}/\theta \)
   - Coverage probability of \( 95\% \) CI: \( \hat{CP} = B^{-1}\sum_b \mathbf{1}(\theta \in CI_b) \)

4. **Compare estimators**: DEFF, relative efficiency \( = \hat{V}_{ref}/\hat{V}_{alt} \)

R software (`survey` package) and SAS (PROC SURVEYMEANS, PROC SURVEYREG) implement most standard design-based analyses.

## 10.5 Current Research Topics

**Small area estimation (SAE).** When domain-level estimates are needed for geographic areas or demographic subgroups with small sample sizes, model-based methods borrowing strength from related areas are essential. The Fay-Herriot model for area-level data and the Battese-Harter-Fuller unit-level model are the two workhorses. Empirical BLUP with bootstrap MSE estimation is an active research area.

**Non-probability sampling.** Web panels, opt-in surveys, and administrative data do not arise from probability samples. Calibration with propensity score adjustment and doubly-robust estimation are active research areas for making inference from non-probability samples.

**Measurement error in survey sampling.** The observed \( y_i^* = y_i + u_i \) may differ from the true value. Combining design-based and measurement-error-model approaches requires careful variance decomposition.

**High-dimensional auxiliary information.** When the dimension of \( \mathbf{x}_i \) is large relative to \( n \), standard GREG calibration overfits. LASSO-penalized calibration and model selection in survey contexts are active areas.

---

# Appendix: Key Formulas Reference Sheet

## Population Quantities

| Symbol | Definition |
|---|---|
| \( N \) | Population size |
| \( \bar{Y} = N^{-1}\sum_i y_i \) | Population mean |
| \( T = \sum_i y_i = N\bar{Y} \) | Population total |
| \( S^2 = (N-1)^{-1}\sum_i(y_i-\bar{Y})^2 \) | Population variance |
| \( \pi_i = P(i \in s) \) | First-order inclusion probability |
| \( \pi_{ij} = P(i \in s, j \in s) \) | Second-order inclusion probability |

## HT Estimator

\[
\hat{T}_{HT} = \sum_{i \in s} \frac{y_i}{\pi_i}, \qquad E[\hat{T}_{HT}] = T
\]

\[
\text{Var}(\hat{T}_{HT}) = \sum_i\sum_j (\pi_{ij} - \pi_i\pi_j)\frac{y_i}{\pi_i}\frac{y_j}{\pi_j}
\]

## SRSWOR

\[
\pi_i = \frac{n}{N}, \quad \pi_{ij} = \frac{n(n-1)}{N(N-1)}, \quad \text{Var}(\bar{y}) = \frac{(1-f)S^2}{n}
\]

## Stratified SRS

\[
\hat{\bar{Y}}_{st} = \sum_h W_h \bar{y}_h, \quad \text{Var}(\hat{\bar{Y}}_{st}) = \sum_h W_h^2 \frac{(1-f_h)S_h^2}{n_h}
\]

Neyman: \( n_h = n\cdot N_hS_h/\sum_k N_kS_k \)

## Ratio and Regression

\[
\hat{\bar{Y}}_R = \frac{\bar{y}}{\bar{x}}\bar{X}, \quad \text{Var} \approx \frac{(1-f)}{n}S_d^2, \quad d_i = y_i - Rx_i
\]

\[
\hat{\bar{Y}}_{reg} = \bar{y} + \hat{B}(\bar{X}-\bar{x}), \quad \text{Var} \approx \frac{(1-f)S_y^2(1-\rho^2)}{n}
\]

## Cluster Sampling

\[
\text{DEFF} = 1 + (M-1)\rho, \quad M^* = \sqrt{\frac{c_1(1-\rho)}{c_2\rho}}
\]

## Variance Estimation

\[
v_{JK} = \frac{n-1}{n}\sum_{l \in s}(\hat{\theta}_{(l)} - \hat{\theta})^2
\]

\[
v_{BRR} = \frac{1}{A}\sum_{\alpha=1}^A(\hat{\theta}_\alpha - \hat{\theta})^2
\]

---

# Supplement A: Probability Theory Background for Finite Populations

## A.1 Indicator Variables and Design Moments

The indicator \( I_i = \mathbf{1}(i \in s) \) is a Bernoulli random variable under the design. Key moments:

\[
E[I_i] = \pi_i, \qquad E[I_i^2] = \pi_i, \qquad \text{Var}(I_i) = \pi_i(1-\pi_i)
\]

\[
E[I_i I_j] = \pi_{ij} \quad (i \neq j), \qquad \text{Cov}(I_i, I_j) = \pi_{ij} - \pi_i\pi_j
\]

Any estimator of the form \( \hat{T} = \sum_{i \in s} a_i = \sum_{i=1}^N I_i a_i \) (with fixed \( a_i \)) has:

\[
E[\hat{T}] = \sum_{i=1}^N \pi_i a_i, \qquad \text{Var}(\hat{T}) = \sum_{i=1}^N\sum_{j=1}^N (\pi_{ij}-\pi_i\pi_j)a_i a_j
\]

## A.2 Unbiased Estimation of Population Variance

The population variance \( S^2 \) can be expressed as:

\[
S^2 = \frac{1}{N-1}\left(\sum_{i=1}^N y_i^2 - N\bar{Y}^2\right) = \frac{N}{N-1}\left(\overline{y^2} - \bar{Y}^2\right)
\]

Under SRSWOR, the sample variance \( s^2 = \frac{1}{n-1}\sum_{i \in s}(y_i - \bar{y})^2 \) satisfies \( E[s^2] = S^2 \). The proof uses:

\[
E\left[\sum_{i \in s}(y_i - \bar{y})^2\right] = E\left[\sum_{i \in s} y_i^2 - n\bar{y}^2\right]
\]

Since \( E[\sum_{i \in s} y_i^2] = n\overline{y^2} \) (where \( \overline{y^2} = N^{-1}\sum_i y_i^2 \)) and \( E[\bar{y}^2] = \bar{Y}^2 + (1-f)S^2/n \):

\[
E[s^2] = \frac{1}{n-1}\left(n\overline{y^2} - n\bar{Y}^2 - (1-f)S^2\right) = \frac{n}{n-1}\left(\overline{y^2} - \bar{Y}^2\right) - \frac{(1-f)S^2}{n-1}
\]

Substituting \( \overline{y^2} - \bar{Y}^2 = (N-1)S^2/N \) and simplifying yields \( E[s^2] = S^2 \).

## A.3 Covariance Structure Under SRSWOR

A fundamental identity: for any variables \( u_i, v_i \) on \( U \),

\[
\text{Cov}_{SRS}(\bar{u}, \bar{v}) = \frac{(1-f)}{n}\cdot\frac{1}{N-1}\sum_{i=1}^N(u_i - \bar{U})(v_i - \bar{V}) = \frac{(1-f)S_{uv}}{n}
\]

This covariance formula underlies the variance calculations for the ratio and regression estimators, both of which can be written as functions of \( (\bar{y}, \bar{x}) \).

---

# Supplement B: Design-Based Central Limit Theorems

## B.1 The Isaki-Fuller Conditions

For the sample mean \( \bar{y} \) under SRSWOR to satisfy a CLT, the **Isaki-Fuller (1982) conditions** require:

1. \( N, n \to \infty \) with \( f = n/N \to f_0 \in [0, 1) \)
2. \( \max_{i \in U} (y_i - \bar{Y})^2 / (NS^2) \to 0 \) (no single unit dominates)

Under these conditions:

\[
\frac{\bar{y} - \bar{Y}}{\sqrt{(1-f)S^2/n}} \xrightarrow{d} N(0,1)
\]

The condition (2) is the **negligibility condition** analogous to the Lindeberg condition in classical CLTs. It rules out populations where a single observation contributes a non-negligible fraction of the total variance.

## B.2 CLT for the HT Estimator (General Design)

For the HT estimator under a general design with fixed sample size \( n \), a CLT holds under:
- All \( \pi_i \geq cn/N \) for some constant \( c > 0 \) (bounded inclusion probabilities)
- \( \max_{i \in U} y_i^2/(NS^2) \to 0 \) (negligibility)
- \( \pi_{ij}/(\pi_i \pi_j) \to 1 \) uniformly in some sense (independence-like condition)

The asymptotic normality of \( (\hat{T}_{HT} - T)/\sqrt{\text{Var}(\hat{T}_{HT})} \) under these conditions is established in Hájek (1960, 1964).

## B.3 Studentization and Confidence Intervals

Replacing \( \text{Var}(\hat{T}_{HT}) \) by a consistent estimator \( \hat{V} \) in the pivot:

\[
\frac{\hat{T}_{HT} - T}{\sqrt{\hat{V}}} \xrightarrow{d} N(0,1)
\]

requires that \( \hat{V}/\text{Var}(\hat{T}_{HT}) \xrightarrow{p} 1 \). Under SRSWOR:

\[
\frac{\hat{V}(\bar{y})}{\text{Var}(\bar{y})} = \frac{s^2}{S^2} \xrightarrow{p} 1
\]

by the law of large numbers, establishing the asymptotic validity of the standard confidence interval.

---

# Supplement C: Stratification Theory — Proofs and Extensions

## C.1 Proof of the Stratification Inequality

<div class="theorem">
<strong>Theorem</strong>: Under proportional allocation, \( \text{Var}_{prop}(\hat{\bar{Y}}_{st}) \leq \text{Var}_{SRS}(\hat{\bar{Y}}) \), with equality if and only if all stratum means are equal.
</div>

**Proof.** Decompose the population variance using the law of total variance:

\[
S^2 = \frac{N-1}{N}\sigma^2 = \frac{1}{N}\sum_h\sum_{i \in U_h}(y_i - \bar{Y})^2
\]

\[
= \frac{1}{N}\sum_h \sum_{i \in U_h}[(y_i - \bar{Y}_h) + (\bar{Y}_h - \bar{Y})]^2
\]

\[
= \frac{1}{N}\sum_h N_h S_h^2\frac{N_h-1}{N_h} + \sum_h W_h(\bar{Y}_h - \bar{Y})^2 \approx \sum_h W_h S_h^2 + \sum_h W_h(\bar{Y}_h-\bar{Y})^2
\]

(using \( (N_h-1)/N_h \approx 1 \) for large \( N_h \)). Under proportional allocation with large \( n \):

\[
\text{Var}_{prop} \approx \frac{1-f}{n}\sum_h W_h S_h^2 \leq \frac{1-f}{n}\left[\sum_h W_h S_h^2 + \sum_h W_h(\bar{Y}_h-\bar{Y})^2\right] \approx \text{Var}_{SRS}
\]

Equality holds iff \( \sum_h W_h(\bar{Y}_h - \bar{Y})^2 = 0 \), i.e., all stratum means \( \bar{Y}_h = \bar{Y} \). \( \square \)

## C.2 Optimal Number of Strata

When choosing how many strata \( H \) to use (with equal-width intervals and proportional allocation), the variance decreases as \( H \) increases. For a uniform population on \( [a,b] \):

\[
\text{Var}_{st} \approx \frac{(1-f)}{n} \cdot \frac{(b-a)^2}{12H^2}
\]

The variance decreases as \( 1/H^2 \), but with diminishing returns: going from \( H=1 \) to \( H=4 \) gives a 16-fold reduction; from \( H=4 \) to \( H=8 \) only another 4-fold reduction. In practice, \( H = 4 \) to \( H = 8 \) strata are often sufficient.

## C.3 Cumulative Root-f Rule for Stratum Boundaries

When constructing strata from a single continuous variable \( x \) to minimize variance of the \( y \) estimator (and \( y \approx x \)), the **Dalenius-Hodges cumulative root-f rule** is:

1. Compute the frequency density \( f(x) \) of \( x \)
2. Divide the range of \( \sqrt{f(x)} \) into \( H \) equal parts
3. Define stratum boundaries at the corresponding quantiles of \( x \)

This minimizes (approximately) the variance under Neyman allocation.

---

# Supplement D: Ratio Estimator — Bias and MSE Analysis

## D.1 Second-Order Bias Expansion

A second-order Taylor expansion of \( \hat{R} = \bar{y}/\bar{x} \) about \( (\bar{Y}, \bar{X}) \) gives:

\[
\hat{R} \approx R + \frac{\bar{y} - \bar{Y}}{\bar{X}} - R\frac{\bar{x} - \bar{X}}{\bar{X}} + R\left(\frac{\bar{x}-\bar{X}}{\bar{X}}\right)^2 - \frac{(\bar{y}-\bar{Y})(\bar{x}-\bar{X})}{\bar{X}^2} + \ldots
\]

Taking expectations (where \( \bar{y}-\bar{Y} \) and \( \bar{x}-\bar{X} \) have zero mean):

\[
\text{Bias}(\hat{R}) \approx \frac{R}{\bar{X}^2}\text{Var}(\bar{x}) - \frac{\text{Cov}(\bar{y},\bar{x})}{\bar{X}^2} = \frac{(1-f)}{n\bar{X}^2}(RS_x^2 - S_{xy}) = \frac{(1-f)}{n}\cdot\frac{R(C_x^2 - \rho C_x C_y)}{\bar{X}}
\]

The relative bias is approximately \( (1-f)(C_x^2 - \rho C_x C_y)/n \), which is small when \( n \) is large or \( C_x \) is small.

## D.2 Mean Squared Error

The MSE of \( \hat{\bar{Y}}_R \) is:

\[
\text{MSE}(\hat{\bar{Y}}_R) = \text{Var}(\hat{\bar{Y}}_R) + [\text{Bias}(\hat{\bar{Y}}_R)]^2 \approx \frac{(1-f)}{n}(S_y^2 + R^2 S_x^2 - 2RS_{xy})
\]

The ratio estimator has lower MSE than \( \bar{y} \) when:

\[
R^2 S_x^2 - 2RS_{xy} < 0 \iff 2RS_{xy} > R^2 S_x^2 \iff 2\rho S_y S_x > RS_x^2 \iff \rho > \frac{RS_x}{2S_y} = \frac{C_x}{2C_y}
\]

This is the **rule of thumb**: use ratio estimation when the correlation \( \rho > C_x / (2C_y) \), which simplifies to \( \rho > 0.5 \) when \( C_x = C_y \).

---

# Supplement E: Multi-Phase Sampling and Double Sampling

## E.1 Two-Phase (Double) Sampling

**Two-phase sampling** is useful when auxiliary information \( x_i \) is available for all \( N \) units (or cheaply obtained), but \( y_i \) is expensive. The procedure:

1. **Phase 1**: Draw a large sample \( s_1 \) of size \( n_1 \) and measure \( x_i \) for all \( i \in s_1 \)
2. **Phase 2**: Draw a subsample \( s_2 \subset s_1 \) of size \( n_2 \) and measure \( y_i \) for \( i \in s_2 \)

The **two-phase ratio estimator** is:

\[
\hat{\bar{Y}}_{2ph,R} = \frac{\bar{y}_{s_2}}{\bar{x}_{s_2}} \cdot \bar{x}_{s_1}
\]

exploiting the Phase 1 estimate \( \bar{x}_{s_1} \) (more precise than \( \bar{x}_{s_2} \)) as a proxy for \( \bar{X} \).

**Variance.** Conditioning on the Phase 1 sample:

\[
\text{Var}(\hat{\bar{Y}}_{2ph,R}) \approx \frac{(1-f_1)}{n_1}S_y^2\rho^2 + \frac{(f_1 - f_2)}{n_2}S_y^2(1-\rho^2) + \frac{(1-f_2)}{n_2}S_y^2(1-\rho^2)
\]

which simplifies (when \( f_1 \approx 0 \)) to:

\[
\text{Var} \approx \frac{\rho^2 S_y^2}{n_1} + \frac{(1-\rho^2)S_y^2}{n_2}
\]

**Optimal allocation.** For total cost \( C = c_1 n_1 + c_2 n_2 \), the optimal ratio is:

\[
\frac{n_2}{n_1} = \sqrt{\frac{c_1(1-\rho^2)}{c_2\rho^2}}
\]

Two-phase sampling is most beneficial when \( \rho^2 \) is large (strong correlation) and \( c_2 \gg c_1 \) (Phase 2 is expensive).

## E.2 Double Sampling for Stratification

When the stratum membership is known only for the Phase 1 sample (not the whole population), use the Phase 1 sample to post-stratify the Phase 2 estimates:

\[
\hat{\bar{Y}}_{2ph,st} = \sum_h \hat{W}_h \bar{y}_{s_{2h}}
\]

where \( \hat{W}_h = n_{1h}/n_1 \) are estimated stratum weights from Phase 1. This two-phase stratified estimator is approximately unbiased with variance:

\[
\text{Var}(\hat{\bar{Y}}_{2ph,st}) \approx \frac{1}{n_1}\sum_h W_h(\bar{Y}_h - \bar{Y})^2 + \frac{1}{n_2}\sum_h W_h S_h^2
\]

(where the first term reflects uncertainty in strata weights, and the second is the stratified sampling variance).

---

# Supplement F: Sources of Survey Error and Survey Quality

## F.1 The Total Survey Error Framework

**Total Survey Error (TSE)** decomposes all sources of inaccuracy in a survey estimate into:

| Error Source | Type | Description |
|---|---|---|
| Sampling error | Variable | Due to observing only part of population |
| Coverage error | Bias | Frame does not match target population |
| Nonresponse error | Bias + variable | Sampled units do not respond |
| Measurement error | Bias + variable | Reported \( y_i^* \neq y_i \) |
| Processing error | Bias + variable | Data entry, editing errors |

The MSE of an estimate incorporates all these components:

\[
\text{MSE}(\hat{\theta}) = \text{Var}(\hat{\theta}) + \text{Bias}^2(\hat{\theta})
\]

where Bias encompasses all systematic errors (coverage, nonresponse, measurement).

## F.2 Probability Proportional to Size: A Unified View

PPS designs appear across multiple contexts:
- PPS WR (Hansen-Hurwitz) — simplest, but slightly less efficient than WOR
- PPS WOR (various methods) — more efficient, more complex
- Systematic PPS — easy to implement, no exact variance formula
- Poisson sampling — each unit included independently with \( \pi_i = n p_i \), random sample size

**Poisson sampling.** Select unit \( i \) independently with probability \( \pi_i \) (set \( \pi_i = nx_i/X_{total} \leq 1 \)). The sample size is random with \( E[n] = \sum_i \pi_i = n \). HT estimator is unbiased; the SYG form gives:

\[
\text{Var}(\hat{T}_{HT}) = \sum_i \frac{(1-\pi_i)}{\pi_i}y_i^2
\]

since under Poisson sampling \( \pi_{ij} = \pi_i\pi_j \) (independence), so the double sum vanishes except for the diagonal.

## F.3 Bernoulli Sampling

**Bernoulli sampling** is Poisson sampling with constant \( \pi_i = \pi \) for all \( i \). The sample size is \( n \sim \text{Binomial}(N, \pi) \) with \( E[n] = N\pi \). Since all inclusion probabilities are equal, the HT estimator of \( T \) is:

\[
\hat{T}_{HT} = \frac{1}{\pi}\sum_{i \in s} y_i = \frac{N}{n_0}\sum_{i \in s} y_i
\]

where \( n_0 = N\pi \) is the expected sample size. Bernoulli sampling is used in online surveys and systematic sampling approximations. Its variance is slightly larger than SRSWOR because of the random sample size.

## F.4 Nonresponse Mechanisms (Rubin's Taxonomy)

**Missing Completely at Random (MCAR)**: Probability of response does not depend on \( y_i \) or \( \mathbf{x}_i \). Complete-case analysis is unbiased.

**Missing at Random (MAR)**: Probability of response depends on observed \( \mathbf{x}_i \) but not on \( y_i \) given \( \mathbf{x}_i \). Propensity score weighting and imputation conditional on \( \mathbf{x}_i \) correct for nonresponse.

**Missing Not at Random (MNAR)**: Probability of response depends on \( y_i \) even after conditioning on \( \mathbf{x}_i \). Standard corrections are insufficient; sensitivity analysis is required.

In survey practice, MAR is the typical working assumption. MNAR is particularly problematic for income surveys (high earners may refuse), health surveys (sicker individuals may not respond), and sensitive topics.

---

# Supplement G: Computational Methods and Software

## G.1 The `survey` Package in R

The R `survey` package (Lumley 2010) implements all standard design-based analyses. The workflow:

```r
library(survey)

# Define survey design
des <- svydesign(
  id = ~psu,          # PSU variable
  strata = ~stratum,  # Stratum variable
  weights = ~weight,  # Sampling weights (1/pi_i)
  data = mydata,
  nest = TRUE         # PSUs nested within strata
)

# Estimate mean with SE
svymean(~income, design = des)

# Estimate total
svytotal(~income, design = des)

# Regression
fit <- svyglm(income ~ age + education, design = des)
```

Variance estimation uses the linearization (default) or jackknife (`type = "JK1"` or `"JKn"`).

## G.2 SAS PROC SURVEYMEANS

SAS implements design-based estimation in PROC SURVEYMEANS, PROC SURVEYREG, and PROC SURVEYLOGISTIC:

```sas
PROC SURVEYMEANS DATA=mydata MEAN SUM STDERR CLM;
  CLUSTER psu;
  STRATA stratum;
  WEIGHT weight;
  VAR income;
RUN;
```

The `VARMETHOD=` option selects Taylor linearization (default), jackknife (`JK`), or BRR (`BRR`).

## G.3 Design Effect Estimation

The estimated DEFF for an estimated mean \( \hat{\bar{Y}} \) from a complex survey is:

\[
\widehat{\text{DEFF}} = \frac{\hat{V}_{complex}(\hat{\bar{Y}})}{\hat{V}_{SRS}(\hat{\bar{Y}})} = \frac{\hat{V}_{complex}(\hat{\bar{Y}})}{(1 - n/N)s^2/n}
\]

Reporting DEFF alongside estimates is standard practice in survey documentation. DEFFs well above 1 (e.g., \( > 2 \)) indicate the sample is substantially less efficient than SRS, often due to geographic clustering.

---

# Supplement H: Selected Proofs and Derivations

## H.1 Proof of Sen-Yates-Grundy Equivalence

For a fixed-size design, \( \sum_{j=1}^N \pi_{ij} = (n-1)\pi_i \) (since conditional on \( i \in s \), the remaining \( n-1 \) units are drawn from \( N-1 \)). Using this:

\[
\sum_i \sum_{j \neq i}(\pi_{ij} - \pi_i\pi_j)\left(\frac{y_i^2}{\pi_i^2} - \frac{2y_iy_j}{\pi_i\pi_j} + \frac{y_j^2}{\pi_j^2}\right)
\]

The cross terms \( -2(\pi_{ij}-\pi_i\pi_j)y_iy_j/(\pi_i\pi_j) \) match the double sum in the original variance formula. The squared terms telescope using \( \sum_j (\pi_{ij} - \pi_i\pi_j) = (n-1)\pi_i - (n-1)\pi_i^2 \cdot \text{(something)} \). After careful algebra, the SYG form is obtained.

## H.2 Derivation of the Regression Estimator Variance

The regression estimator can be written as:

\[
\hat{\bar{Y}}_{reg} = \bar{y} + \hat{B}(\bar{X} - \bar{x})
\]

Treating \( \hat{B} \approx B = S_{xy}/S_x^2 \) (consistent estimator), the linearized error is:

\[
\hat{\bar{Y}}_{reg} - \bar{Y} \approx (\bar{y} - \bar{Y}) - B(\bar{x} - \bar{X}) = \frac{1}{n}\sum_{i \in s}(y_i - Bx_i) - \frac{1}{N}\sum_{i=1}^N(y_i - Bx_i)
\]

\[
= \bar{e} - \bar{E}
\]

where \( e_i = y_i - Bx_i \) are residuals with population mean \( \bar{E} = \bar{Y} - B\bar{X} \). Applying the SRS variance formula to the \( e_i \):

\[
\text{Var}(\hat{\bar{Y}}_{reg}) \approx \frac{(1-f)}{n}S_e^2 = \frac{(1-f)}{n}(S_y^2 - B^2 S_x^2) = \frac{(1-f)S_y^2}{n}\left(1 - \frac{S_{xy}^2}{S_x^2 S_y^2}\right) = \frac{(1-f)S_y^2(1-\rho^2)}{n}
\]

## H.3 Unbiasedness of the Stratified Estimator

The stratified estimator \( \hat{T}_{st} = \sum_{h=1}^H N_h \bar{y}_h \) is unbiased because:

\[
E[\hat{T}_{st}] = \sum_{h=1}^H N_h E[\bar{y}_h] = \sum_{h=1}^H N_h \bar{Y}_h = T
\]

using the fact that \( E[\bar{y}_h] = \bar{Y}_h \) under SRS within each stratum, and the strata are sampled independently.

## H.4 Consistency of the Jackknife Variance Estimator

For a smooth statistic \( \hat{\theta} = g(\bar{y}_1, \ldots, \bar{y}_p) \) (a differentiable function of sample means), the pseudo-values are:

\[
\tilde{\theta}_l = n\hat{\theta} - (n-1)\hat{\theta}_{(l)} \approx \hat{\theta} + (n-1)(\hat{\theta} - \hat{\theta}_{(l)})
\]

The jackknife variance equals \( s^2(\tilde{\theta})/n \) where \( s^2(\tilde{\theta}) \) is the sample variance of pseudo-values. By the delta method, the pseudo-values \( \tilde{\theta}_l \approx g'(\bar{Y}) \cdot y_l + \text{const} \), so:

\[
v_{JK}(\hat{\theta}) \approx \frac{(n-1)}{n}\sum_l (\hat{\theta}_{(l)} - \hat{\theta})^2 \approx \frac{[g'(\bar{Y})]^2(1-f)s^2}{n} \approx \text{Var}(\hat{\theta})
\]

confirming consistency. The approximation becomes exact asymptotically under standard regularity conditions.

---

# Supplement I: Practice Problems

## Problem Set 1: HT Estimator and SRSWOR

**Problem 1.1.** A population has \( N = 6 \) units with values \( y = (3, 7, 2, 9, 4, 5) \). An SRS of size \( n = 3 \) is selected. (a) Compute \( \bar{Y} \), \( S^2 \). (b) Enumerate all \( \binom{6}{3} = 20 \) samples. (c) For the sample \( \{2, 4, 6\} \) (i.e., units 2, 4, 6 with values 7, 9, 5), compute \( \bar{y} \), \( s^2 \), and \( \hat{V}(\bar{y}) \). (d) Verify that \( E[\bar{y}] = \bar{Y} \) by computing the weighted average over all 20 samples.

*Key result*: \( \bar{Y} = 5 \), \( S^2 = 6.8 \), \( \text{Var}(\bar{y}) = (1 - 3/6) \cdot 6.8/3 = 1.133 \).

**Problem 1.2.** Under SRSWOR with \( N = 1000 \), \( n = 100 \), \( s^2 = 144 \): (a) Compute the estimated variance of \( \bar{y} \). (b) Construct a 95% CI for \( \bar{Y} \). (c) What sample size would be needed to halve the margin of error?

**Problem 1.3** (HT for unequal probabilities). Population \( U = \{1,2,3\} \), \( y = (10, 20, 30) \). A design selects \( s = \{1,2\} \) with \( p = 0.3 \), \( s = \{1,3\} \) with \( p = 0.4 \), \( s = \{2,3\} \) with \( p = 0.3 \). (a) Find \( \pi_1, \pi_2, \pi_3 \). (b) Compute \( \hat{T}_{HT} \) for each possible sample. (c) Verify unbiasedness.

## Problem Set 2: Stratified Sampling

**Problem 2.1.** A university surveys student loan debt with three strata: undergraduate (size 8000, \( S_h = 5000 \)), master's (size 3000, \( S_h = 8000 \)), doctoral (size 1000, \( S_h = 12000 \)). Total budget allows \( n = 200 \). (a) Compute proportional allocation. (b) Compute Neyman allocation. (c) Estimate the variance reduction from Neyman vs. proportional.

**Problem 2.2.** Show that under proportional allocation, the stratified estimator simplifies to:

\[
\hat{\bar{Y}}_{st} = \sum_h W_h \bar{y}_h = \frac{1}{n}\sum_{i \in s} y_i = \bar{y}
\]
Conclude that proportional allocation gives a self-weighting design.

## Problem Set 3: Ratio and Regression Estimation

**Problem 3.1.** An agricultural survey of \( n = 30 \) farms from \( N = 300 \) farms observes wheat yield \( y_i \) and farm area \( x_i \). Results: \( \bar{y} = 120 \) bushels, \( \bar{x} = 50 \) acres, \( s_y = 40 \), \( s_x = 15 \), \( r_{xy} = 0.8 \). The population mean area is \( \bar{X} = 52 \) acres. (a) Compute the ratio estimate \( \hat{\bar{Y}}_R \). (b) Compute the regression estimate \( \hat{\bar{Y}}_{reg} \). (c) Compare the approximate variances.

**Problem 3.2.** Derive the condition under which the ratio estimator has lower MSE than the simple expansion estimator \( \bar{y} \), and interpret it in terms of the coefficient of variation and correlation.

## Problem Set 4: Cluster and Variance Estimation

**Problem 4.1.** A company with \( K = 50 \) departments selects \( k = 10 \) departments (clusters) by SRS. The department totals of sales are: \( 42, 55, 38, 67, 50, 44, 61, 53, 48, 45 \) (in \$1000). (a) Estimate the total sales. (b) Compute \( s_T^2 \) (variance of cluster totals). (c) Estimate the variance of your estimate. (d) If the mean cluster size is \( \bar{M} = 15 \) and SRS of the same total \( n = 150 \) individuals gave \( s^2 = 200 \), compute the estimated ICC.

**Problem 4.2.** For a stratified design with \( H = 4 \) strata, each with \( n_h = 2 \) PSUs, describe how to construct a BRR Hadamard matrix of size \( A = 4 \) and compute one replicate estimate.
