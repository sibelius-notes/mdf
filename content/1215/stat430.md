---
title: "STAT 430: Experimental Design"
subjects: "STAT"
prof: "Nathaniel Stevens"
---

## Sources and References
**Primary notes** — Cameron Roopnarine (Hextical), STAT 430/830, Spring 2021 (term 1215), https://hextical.github.io/university-notes/year-3/semester-3/STAT%20430/stat430.pdf
**Supplementary texts** — Wu & Hamada (2011) *Experiments: Planning, Analysis, and Parameter Design Optimization* 2nd ed; Montgomery (2017) *Design and Analysis of Experiments* 9th ed
**Online resources** — Hextical GitHub: https://github.com/Hextical/university-notes/tree/master; NIST Engineering Statistics Handbook

---

# Chapter 1: Principles of Experimental Design

## 1.1 Notation and Nomenclature

<div class="definition">
<strong>Response variable</strong>: The response variable, denoted <em>y</em>, is the variable of primary interest. It is what must be measured in order for the metric of interest (MOI) to be calculated.
</div>

<div class="definition">
<strong>Factor</strong>: A factor, denoted <em>x</em>, is the variable(s) of secondary interest — also called covariates, explanatory variates, predictors, or independent variables. We usually think the factors influence the response.
</div>

<div class="definition">
<strong>Experimental conditions</strong>: The experimental conditions are the unique combinations of levels of one or more factors. Also known as treatments, variants, or buckets.
</div>

<div class="definition">
<strong>Levels</strong>: The levels are the values that a factor takes on in an experiment.
</div>

<div class="definition">
<strong>Experimental units</strong>: The experimental units are what are assigned to experimental conditions and on which we measure the response variable. In online experiments, the unit is typically a user/customer.
</div>

<div class="definition">
<strong>Metric of interest (MOI)</strong>: The MOI is the statistic we wish the experiment to investigate. Typically we want to either maximize or minimize it. Examples include click-through rates (CTRs), bounce rate, average time on page, 95th percentile page load time.
</div>

**Example — Nike vs. Ad Themes:**
- Nike mobile experiment: response = binary checkout indicator; factor = visual layout {tile view, list view}; units = Nike mobile customers.
- Nixon ad experiment: response = continuous viewing duration; factor = ad theme {surfing, rock climbing, camping, urban professional}; units = Instagram users.

## 1.2 Experiments versus Observational Studies

<div class="definition">
<strong>Experiment</strong>: An experiment is a collection of conditions defined by purposeful changes to one or more factors. The key feature is that we <em>intervene</em> in the data collection — we purposefully control the factors to observe the resulting effect on the response, which facilitates causal conclusions.
</div>

**Counterfactual**: The hypothetical and unobservable value of a unit's response in a condition to which they were not assigned. Because counterfactual outcomes cannot be observed, we require a proxy: randomly assign different units to different conditions and compare their responses.

| | Advantages | Disadvantages |
|---|---|---|
| **Experiment** | Causal inference is clean | May be unethical, risky, or costly |
| **Observational Study** | No additional cost, risk, or ethical concerns | Causal inference is muddy |

**Unethical experiment examples**: Forcing subjects to smoke (to study lung cancer), dynamic surge pricing shown to different users, forced exposure to consistently negative content (Facebook social contagion study).

## 1.3 QPDAC: A Strategy for Answering Questions with Data

The QPDAC cycle — Question → Plan → Data → Analysis → Conclusion — is a systematic strategy:

**Question**: Develop a clear, concise, measurable statement of the question (e.g., "Which ad theme corresponds to the highest average viewing duration?").

**Plan**: Design the experiment. Choose:
- **Response variable**: dictated by the Question and MOI.
- **Factor types**:
  - *Design factors*: manipulated to quantify their impact on the response.
  - *Nuisance factors*: expected to influence response but not of primary interest; controlled with blocking.
  - *Allowed-to-vary factors*: cannot be controlled and are unknown.
- **Experimental units** and sample size.

**Data**: Collect data according to the Plan. An **A/A Test** assigns units to two identical conditions to verify randomization. A **Sample Ratio Mismatch (SRM)** test checks whether the proportion of units in each condition matches expectations under random assignment.

**Analysis**: Estimate parameters, fit models, and perform hypothesis tests. If the experiment was well-designed and data collected correctly, this step should be straightforward.

**Conclusion**: Communicate results clearly to all stakeholders. Communicating "wins" and "losses" fosters a culture of experimentation.

## 1.4 Fundamental Principles of Experimental Design

<div class="definition">
<strong>Randomization</strong>: Randomization refers both to the selection of experimental units for inclusion and to their assignment to experimental conditions. Two levels:
<ul>
<li><em>First level</em>: ensures the sample is representative of the target population, enabling generalization.</li>
<li><em>Second level</em>: balances the effects of extraneous variables (allowed-to-vary factors), making conditions homogenous and facilitating causal inference.</li>
</ul>
</div>

<div class="definition">
<strong>Replication</strong>: Replication refers to the existence of multiple response observations within each experimental condition (assigning more than one unit to each condition). Replication provides assurance that observed results are genuine and not due to chance alone. How much replication is needed is answered via power analysis and sample size calculations.
</div>

<div class="definition">
<strong>Blocking</strong>: Blocking is the mechanism by which we control nuisance factors. We hold nuisance factors fixed during the experiment — running the experiment at fixed levels of nuisance factors within blocks — to eliminate their influence on the response.
</div>

**Example — The GAP Email Promotion**: To test subject-line variations maximizing "open rate," with "send time" as a nuisance factor, send all emails at the same time of day and day of week. By holding send time fixed, that nuisance factor cannot confound conclusions.

## 1.5 The Linear Model Framework for Experiments

Experiments are analyzed using linear regression. For a single-factor experiment with \( m \) conditions and \( N \) total observations, define indicator variables:

\[
x_{ij} = \begin{cases} 1 & \text{if unit } i \text{ is in condition } j \\ 0 & \text{otherwise} \end{cases} \quad j = 1, \ldots, m-1
\]

The model is:

\[
Y_i = \beta_0 + \beta_1 x_{i1} + \cdots + \beta_{m-1} x_{i,m-1} + \varepsilon_i, \quad \varepsilon_i \overset{\text{iid}}{\sim} \mathcal{N}(0, \sigma^2)
\]

Interpretations:
- \( \beta_0 = \mu_m \): expected response in condition \( m \) (reference).
- \( \beta_j = \mu_j - \mu_m \): expected difference between condition \( j \) and condition \( m \).

Testing \( H_0: \beta_1 = \cdots = \beta_{m-1} = 0 \) is equivalent to testing \( H_0: \mu_1 = \cdots = \mu_m \).

## 1.6 Introduction to ANOVA

**One-way ANOVA** compares the variability *between* conditions to the variability *within* conditions. Let \( y_{ij} \) be observation \( i \) in condition \( j \), \( \bar{y}_{\cdot j} \) be the condition mean, and \( \bar{y}_{\cdot\cdot} \) be the overall mean.

<div class="definition">
<strong>Sum of Squares Decomposition</strong>:

\[
\text{SST} = \text{SSC} + \text{SSE}
\]
where:
<ul>
<li><em>SST</em> = total sum of squares = \(\sum_j \sum_i (y_{ij} - \bar{y})^2\)</li>
<li><em>SSC</em> = condition sum of squares = \(\sum_j \sum_i (\bar{y}_{\cdot j} - \bar{y})^2\) (between-condition variation)</li>
<li><em>SSE</em> = error sum of squares = \(\sum_j \sum_i (y_{ij} - \bar{y}_{\cdot j})^2\) (within-condition variation)</li>
</ul>
</div>

**One-Way ANOVA Table:**

| Source | SS | d.f. | MS | F |
|---|---|---|---|---|
| Condition | SSC | \(m-1\) | \(\text{MSC} = \text{SSC}/(m-1)\) | \(F = \text{MSC}/\text{MSE}\) |
| Error | SSE | \(N-m\) | \(\text{MSE} = \text{SSE}/(N-m)\) | |
| Total | SST | \(N-1\) | | |

Under \( H_0: \mu_1 = \cdots = \mu_m \), \( F \sim F(m-1, N-m) \). The p-value is \( P(T \geq F) \) where \( T \sim F(m-1, N-m) \). Under \( H_0 \): \( \mathbb{E}[\text{MSC}] = \mathbb{E}[\text{MSE}] = \sigma^2 \).

---

# Chapter 2: One-Factor Experiments (Completely Randomized Design)

## 2.1 The Completely Randomized Design (CRD)

<div class="definition">
<strong>Completely Randomized Design (CRD)</strong>: In a CRD, experimental units are randomly assigned to treatment conditions with no blocking structure. With <em>m</em> conditions and <em>n<sub>j</sub></em> units in condition <em>j</em>, the model is:

\[
Y_{ij} = \mu_j + \varepsilon_{ij}, \quad \varepsilon_{ij} \overset{\text{iid}}{\sim} \mathcal{N}(0, \sigma^2), \quad i = 1,\ldots,n_j,\ j = 1,\ldots,m
\]
</div>

This is equivalent to the cell-means model. Alternatively, using effects coding:

\[
Y_{ij} = \mu + \tau_j + \varepsilon_{ij}
\]
where \( \mu \) is the overall mean and \( \tau_j \) is the \( j \)-th treatment effect with constraint \( \sum_j \tau_j = 0 \) or \( \tau_m = 0 \).

**Least-squares estimates**: \( \hat{\mu}_j = \bar{y}_{\cdot j} \), \( \hat{\sigma}^2 = \text{MSE} \).

## 2.2 One-Way ANOVA F-Test

**Theorem (ANOVA Decomposition for CRD)**: Under the model above,

\[
\text{SST} = \text{SSC} + \text{SSE}
\]

where:

\[
\text{SSC} = \sum_{j=1}^{m} n_j (\bar{y}_{\cdot j} - \bar{y}_{\cdot\cdot})^2, \quad \text{SSE} = \sum_{j=1}^{m} \sum_{i=1}^{n_j} (y_{ij} - \bar{y}_{\cdot j})^2
\]

Under \( H_0: \mu_1 = \cdots = \mu_m \):

\[
F = \frac{\text{SSC}/(m-1)}{\text{SSE}/(N-m)} \sim F(m-1, N-m)
\]

**Worked Example — Candy Crush Boosters**: Three booster conditions (lollipop hammer, jellyfish, colour bomb) with \( n_1 = 121, n_2 = 135, n_3 = 117 \) users. Testing \( H_0: \mu_1 = \mu_2 = \mu_3 \) yielded \( F = 851.895 \) with \( T \sim F(2, 370) \), giving p-value \( = 3.280 \times 10^{-139} \). Strong evidence the average game play duration differs across booster types.

## 2.3 Power and Sample Size for One-Way ANOVA

The **minimum detectable effect (MDE)** \( \delta \) is the smallest difference between conditions that is practically relevant and we wish to detect.

For a two-sample comparison testing \( H_0: \theta_1 = \theta_2 \) vs. \( H_A: \theta_1 \neq \theta_2 \) at level \( \alpha \) with power \( 1 - \beta \):

\[
n = \frac{(z_{\alpha/2} - z_{1-\beta})^2 [\mathbb{V}(Y_1) + \mathbb{V}(Y_2)]}{\delta^2}
\]

where \( \delta = \theta_1 - \theta_2 \) and \( z_\alpha \) denotes the \( \alpha \)-quantile of \( \mathcal{N}(0,1) \).

**Key relationships**:
- Larger \( \delta \) (bigger effect to detect) → smaller required \( n \).
- Larger variance → larger required \( n \).
- Higher power \( (1-\beta) \) → larger required \( n \).
- Smaller \( \alpha \) → larger required \( n \).

## 2.4 Multiple Comparisons

When testing all pairwise comparisons among \( m \) conditions (\( M = \binom{m}{2} \) tests), Type I errors accumulate.

<div class="definition">
<strong>Family-Wise Error Rate (FWER)</strong>: The probability of committing at least one Type I Error across all \( M \) hypothesis tests:

\[
\text{FWER} = P(V \geq 1)
\]
where <em>V</em> is the number of true null hypotheses that were incorrectly rejected.
</div>

If all \( M \) tests are independent: \( \text{FWER} = 1 - (1-\alpha)^M \). For \( m=5 \), \( \alpha = 0.05 \): \( M = 10 \), \( \text{FWER} = 0.4013 \).

### Bonferroni Correction
Reject \( H_{0,k} \) if \( p_k \leq \alpha^*/M \). Guarantees \( \text{FWER} \leq \alpha^* \) by Boole's Inequality. Adjusted p-values: \( p_k^* = M p_k \).

### Šidák Correction
Reject \( H_{0,k} \) if \( p_k \leq 1 - (1-\alpha^*)^{1/M} \). Exploits independence assumption. Nearly identical to Bonferroni: \( \alpha^*/M \approx 1-(1-\alpha^*)^{1/M} \). Adjusted p-values: \( p_k^* = 1 - (1-p_k)^M \).

### Holm's Step-Down Procedure
Less conservative than Bonferroni. Algorithm:
1. Order p-values: \( p_{(1)} \leq p_{(2)} \leq \cdots \leq p_{(M)} \).
2. Find \( k^* \): the smallest \( k \) such that \( p_{(k)} > \alpha^*/(M-k+1) \).
3. Reject \( H_{0,(1)}, \ldots, H_{0,(k^*-1)} \); do not reject the rest.

**Theorem**: Holm's procedure controls FWER \( \leq \alpha^* \).

**Worked Example** (M=4): \( p_1 = 0.015, p_2 = 0.029, p_3 = 0.008, p_4 = 0.026 \), \( \alpha^* = 0.05 \):
- Bonferroni: threshold \( 0.0125 \) → reject only \( H_{0,3} \).
- Holm: reject \( H_{0,3} \) (\( 0.008 < 0.0125 \)) and \( H_{0,1} \) (\( 0.015 < 0.0167 \)); stop at \( H_{0,4} \) (\( 0.026 > 0.025 \)).

### Benjamini-Hochberg (BH) Procedure — False Discovery Rate
Controls the **False Discovery Rate** \( \text{FDR} = \mathbb{E}[V/R] \) rather than FWER. Less strict; suited for large \( M \).

Algorithm:
1. Order p-values: \( p_{(1)} \leq \cdots \leq p_{(M)} \).
2. Find \( k^* \): the *largest* \( k \) such that \( p_{(k)} \leq k\alpha^*/M \).
3. Reject \( H_{0,(1)}, \ldots, H_{0,(k^*)} \).

Adjusted p-values: \( p_{(k)}^* = \min_{j \geq k}\{M p_{(j)}/j\} \). In R: `p.adjust()`.

### Contrasts and Orthogonal Contrasts

<div class="definition">
<strong>Contrast</strong>: A contrast is a linear combination of treatment means \(\psi = \sum_{j=1}^m c_j \mu_j\) where \(\sum_j c_j = 0\). Estimated by \(\hat{\psi} = \sum_j c_j \bar{y}_{\cdot j}\) with \(\mathbb{V}(\hat{\psi}) = \sigma^2 \sum_j c_j^2/n_j\).
</div>

<div class="definition">
<strong>Orthogonal contrasts</strong>: Two contrasts with coefficients \(\mathbf{c} = (c_1,\ldots,c_m)\) and \(\mathbf{d} = (d_1,\ldots,d_m)\) are orthogonal if \(\sum_j c_j d_j / n_j = 0\). For balanced designs: \(\sum_j c_j d_j = 0\). A set of \(m-1\) mutually orthogonal contrasts partitions \(\text{SSC}\) into \(m-1\) independent single-degree-of-freedom components.
</div>

**Tukey HSD** provides simultaneous confidence intervals for all pairwise differences with familywise coverage \( 1 - \alpha \). The Tukey interval for \( \mu_j - \mu_k \) is:

\[
(\bar{y}_{\cdot j} - \bar{y}_{\cdot k}) \pm \frac{q_{\alpha,m,N-m}}{\sqrt{2}} \cdot \hat{\sigma} \sqrt{\frac{1}{n_j} + \frac{1}{n_k}}
\]
where \( q_{\alpha,m,N-m} \) is the upper \(\alpha\) critical value of the studentized range distribution.

**Scheffé's method** provides protection for *all possible* contrasts:

\[
\hat{\psi} \pm \sqrt{(m-1) F_{\alpha,m-1,N-m}} \cdot \hat{\sigma} \sqrt{\sum_j c_j^2/n_j}
\]

---

# Chapter 3: Randomized Block and Related Designs

## 3.1 Randomized Complete Block Design (RCBD)

<div class="definition">
<strong>Randomized Complete Block Design (RCBD)</strong>: An experimental design with a single design factor (<em>m</em> levels/conditions) and a single nuisance factor (<em>b</em> blocks). Every experimental condition appears in every block. With <em>n<sub>jk</sub></em> units in condition <em>j</em>, block <em>k</em>:
</div>

**Model**:

\[
Y_{ijk} = \mu + \tau_j + \beta_k + \varepsilon_{ijk}, \quad \varepsilon_{ijk} \overset{\text{iid}}{\sim} \mathcal{N}(0, \sigma^2)
\]

where \( \tau_j \) is the \( j \)-th treatment effect and \( \beta_k \) is the \( k \)-th block effect, with \( \sum_j \tau_j = 0 \) and \( \sum_k \beta_k = 0 \).

Equivalently, in regression form:

\[
Y_i = \alpha + \sum_{j=1}^{m-1} \beta_j x_{ij} + \sum_{k=1}^{b-1} \gamma_k z_{ik} + \varepsilon_i
\]

**Two-Way ANOVA Table for RCBD** (balanced, \( n_{jk} = n \), \( N = nbm \)):

| Source | SS | d.f. | MS | F |
|---|---|---|---|---|
| Condition | SSC | \(m-1\) | \(\text{MSC}/(m-1)\) | \(t_C = \text{MSC}/\text{MSE}\) |
| Block | SSB | \(b-1\) | \(\text{MSB}/(b-1)\) | \(t_B = \text{MSB}/\text{MSE}\) |
| Error | SSE | \(N-m-b+1\) | \(\text{MSE}/(N-m-b+1)\) | |
| Total | SST | \(N-1\) | | |

Sum-of-squares formulas (balanced, one obs per cell, \( N = mb \)):

\[
\text{SSC} = b\sum_{j=1}^m (\bar{y}_{\cdot j \cdot} - \bar{y}_{\cdot\cdot\cdot})^2, \quad \text{SSB} = m\sum_{k=1}^b (\bar{y}_{\cdot\cdot k} - \bar{y}_{\cdot\cdot\cdot})^2
\]

\[
\text{SSE} = \sum_{j,k} (y_{jk} - \bar{y}_{\cdot j\cdot} - \bar{y}_{\cdot\cdot k} + \bar{y}_{\cdot\cdot\cdot})^2
\]

**Hypothesis tests**:
- Design factor: \( H_0: \tau_1 = \cdots = \tau_m = 0 \), \( F = \text{MSC}/\text{MSE} \sim F(m-1, N-m-b+1) \).
- Blocking factor: \( H_0: \beta_1 = \cdots = \beta_b = 0 \), \( F = \text{MSB}/\text{MSE} \sim F(b-1, N-m-b+1) \).

**Worked Example — Promotions at The Gap**: Three promotions (\( m=3 \)), five weekdays (\( b=5 \)), \( n_{jk} = 50 \) customers per cell, \( N = 750 \). ANOVA table:

| Source | SS | d.f. | MS | F |
|---|---|---|---|---|
| Condition | 49618.34 | 2 | 24809.17 | 2165.39 |
| Block (Day) | 19258.30 | 4 | 4814.58 | 420.22 |
| Error | 8512.67 | 743 | 11.46 | |
| Total | 77389.32 | 749 | | |

For condition: p-value \( = P(T \geq 2165.39) = 1.10 \times 10^{-310} \), \( T \sim F(2,743) \) → reject \( H_0 \). For blocking: p-value \( = P(T \geq 420.22) \approx 0 \) → blocking was appropriate.

## 3.2 Efficiency of Blocking

The **relative efficiency** of the RCBD relative to the CRD measures how much replication the CRD would need to achieve the same precision:

\[
\text{RE} = \frac{(b-1)\text{MSB} + b(m-1)\text{MSE}}{(bm-1)\text{MSE}}
\]

If \( \text{RE} > 1 \), blocking was beneficial; the CRD would need \( \text{RE} \times n \) observations per treatment to match precision.

## 3.3 Latin Square Designs

A **Latin square of order \( p \)** is a \( p \times p \) grid containing \( p \) unique symbols (typically Latin letters), where each symbol appears exactly once in each row and once in each column. This structure allows **simultaneous blocking on two nuisance factors** while investigating one design factor at \( p \) levels.

**Construction**: Associate the \( p \) rows with levels of Nuisance Factor 1 (NF1), the \( p \) columns with levels of Nuisance Factor 2 (NF2), and the \( p \) Latin letters with levels of the Design Factor (DF). Example (4×4):

|   | **NF2=1** | **NF2=2** | **NF2=3** | **NF2=4** |
|---|---|---|---|---|
| **NF1=1** | A | B | C | D |
| **NF1=2** | D | A | B | C |
| **NF1=3** | C | D | A | B |
| **NF1=4** | B | C | D | A |

**Model** (\( N = np^2 \), \( n \) units per block):

\[
Y_i = \alpha + \sum_{j=1}^{p-1}\beta_j x_{ij} + \sum_{k=1}^{p-1}\gamma_k z_{ik} + \sum_{\ell=1}^{p-1}\delta_\ell w_{i\ell} + \varepsilon_i
\]

**Three-Way ANOVA Table for Latin Square Design:**

| Source | SS | d.f. | MS | F |
|---|---|---|---|---|
| Design Factor | SSC | \(p-1\) | \(\text{MSC}/(p-1)\) | \(t_C = \text{MSC}/\text{MSE}\) |
| NF1 (Rows) | SSB1 | \(p-1\) | \(\text{MSB1}/(p-1)\) | \(t_{B1} = \text{MSB1}/\text{MSE}\) |
| NF2 (Cols) | SSB2 | \(p-1\) | \(\text{MSB2}/(p-1)\) | \(t_{B2} = \text{MSB2}/\text{MSE}\) |
| Error | SSE | \(N-3p+2\) | \(\text{MSE}/(N-3p+2)\) | |
| Total | SST | \(N-1\) | | |

Sums of squares:

\[
\text{SSC} = np\sum_{j=1}^p (\bar{y}_{\cdot j\cdot\cdot} - \bar{y}_{\cdot\cdot\cdot\cdot})^2, \quad \text{SSB1} = np\sum_{k=1}^p (\bar{y}_{\cdot\cdot k\cdot} - \bar{y}_{\cdot\cdot\cdot\cdot})^2, \quad \text{SSB2} = np\sum_{\ell=1}^p (\bar{y}_{\cdot\cdot\cdot\ell} - \bar{y}_{\cdot\cdot\cdot\cdot})^2
\]

**Worked Example — Netflix Latency**: \( p = 4 \) conditions (A, B, C, D), blocked by browser (Chrome, Edge, Firefox, Safari) and time of day (4 periods), \( n = 500 \) users per block, \( N = 8000 \). ANOVA:

| Source | SS | d.f. | MS | F |
|---|---|---|---|---|
| Condition | 203903.38 | 3 | 67967.79 | 679.14 |
| Browser | 32.95 | 3 | 10.98 | 0.1097 |
| Time | 333242.01 | 3 | 111080.67 | 1109.92 |
| Error | 799636.18 | 7990 | 100.08 | |
| Total | 1336815 | 7999 | | |

Condition: p-value \( \approx 0 \) → design factor is significant. Browser: p-value \( = 0.9545 \) → browser blocking was unnecessary. Time: p-value \( \approx 0 \) → time-of-day blocking was justified.

**Extensions**: *Graeco-Latin squares* block by three nuisance factors using a superimposed Greek-letter square orthogonal to the Latin square. *Hyper-Graeco-Latin squares* block by four nuisance factors.

## 3.4 Balanced Incomplete Block Designs (BIBD)

When practical constraints prevent running every condition in every block (\( m^* < m \) conditions per block), we use a BIBD.

<div class="definition">
<strong>BIBD parameters</strong>:
<ul>
<li><em>m</em>: number of conditions</li>
<li><em>b</em>: number of blocks</li>
<li><em>m*</em>: number of conditions per block (block size)</li>
<li><em>r</em>: number of blocks each condition appears in</li>
<li><em>λ</em>: number of blocks in which any pair of conditions appear together</li>
</ul>
<strong>Balance</strong>: Each condition appears in the same number of blocks (<em>r</em>) and each pair of conditions appears together in exactly <em>λ</em> blocks.
</div>

**Design constraints**:

\[
mr = bm^*, \quad r(m^*-1) = \lambda(m-1)
\]

**Design procedure** (specify \( m, m^*, \lambda \)):
1. Compute \( r = \lambda(m-1)/(m^*-1) \) — must be integer.
2. Compute \( b = mr/m^* \) — must be integer.

**Example**: \( m=3, m^*=2, \lambda=2 \): \( r = 2(2)/1 = 4 \), \( b = 3(4)/2 = 6 \). Each pair of conditions shares exactly 2 blocks.

**Analysis**: In a BIBD, condition-specific means must be adjusted for the blocks in which each condition appeared. The adjusted treatment sum of squares accounts for incompleteness. The standard regression approach with condition and block indicators remains valid but produces adjusted estimates.

---

# Chapter 4: Two-Level Full Factorial Designs

## 4.1 The Factorial Approach and 2^k Notation

<div class="definition">
<strong>Factorial experiment</strong>: Experimental conditions are defined as every unique combination of the design factors' levels. With <em>K</em> factors each at 2 levels, there are \(2^K\) conditions. This is denoted a \(2^K\) factorial design.
</div>

**Advantages over OFAT** (one-factor-at-a-time):
1. All possible conditions are observed — the optimal combination cannot be missed.
2. Both main effects and interaction effects can be estimated.

**Main effect**: The expected change in response produced by changing a factor from its low (−) to its high (+) level.

**Interaction effect**: If the main effect of factor A depends on the level of factor B, then A and B interact.

### Coding Variables

Each factor is represented by \( x_j \in \{-1, +1\} \) (coded units). The coding for a quantitative factor with natural-unit levels \( U_L \) (low) and \( U_H \) (high) is:

\[
x = \frac{U - (U_H + U_L)/2}{(U_H - U_L)/2}
\]

The **design matrix** has \( 2^K \) rows (conditions) and \( K \) columns (factors), with entries \( \pm 1 \). Example — \( 2^3 \) design matrix:

| Cond | A | B | C |
|------|---|---|---|
| 1 | − | − | − |
| 2 | + | − | − |
| 3 | − | + | − |
| 4 | + | + | − |
| 5 | − | − | + |
| 6 | + | − | + |
| 7 | − | + | + |
| 8 | + | + | + |

## 4.2 Effect Estimation

**Intuitive formulas** (balanced, \( n \) reps per condition):

\[
\widehat{\text{ME}}_A = \bar{y}_{A+} - \bar{y}_{A-} = \frac{\bar{y}_{A+\cap B+} + \bar{y}_{A+\cap B-}}{2} - \frac{\bar{y}_{A-\cap B+} + \bar{y}_{A-\cap B-}}{2}
\]

\[
\widehat{\text{IE}}_{AB} = \frac{\widehat{\text{ME}}_{A|B+} - \widehat{\text{ME}}_{A|B-}}{2} = \frac{\bar{y}_{A+\cap B+} + \bar{y}_{A-\cap B-} - \bar{y}_{A+\cap B-} - \bar{y}_{A-\cap B+}}{2}
\]

**Toy Example** (\( 2^2 \) design, \( n=3 \)):

| Condition | A | B | Response \( y \) | \( \bar{y} \) |
|---|---|---|---|---|
| 1 | −1 | −1 | {1,1,2} | 4/3 |
| 2 | +1 | −1 | {3,4,5} | 12/3 |
| 3 | −1 | +1 | {2,1,3} | 6/3 |
| 4 | +1 | +1 | {1,2,5} | 8/3 |

\[
\widehat{\text{ME}}_A = \frac{12/3 + 8/3}{2} - \frac{4/3 + 6/3}{2} = \frac{20/3}{2} - \frac{10/3}{2} = \frac{10}{6} \approx 1.667
\]

\[
\widehat{\text{ME}}_B = \frac{6/3 + 8/3}{2} - \frac{4/3 + 12/3}{2} = \frac{14/3}{2} - \frac{16/3}{2} = -\frac{1}{3}
\]

\[
\widehat{\text{IE}}_{AB} = \frac{8/3 + 4/3}{2} - \frac{12/3 + 6/3}{2} = \frac{12/3}{2} - \frac{18/3}{2} = -1
\]

## 4.3 Regression-Based Analysis of 2^k Experiments

The full model for a \( 2^K \) experiment has \( 2^K \) terms in the linear predictor:

\[
\eta = \beta_0 + \sum_{j}\beta_j x_j + \sum_{j<\ell}\beta_{j\ell} x_j x_\ell + \sum_{j<\ell<r}\beta_{j\ell r} x_j x_\ell x_r + \cdots + \beta_{12\cdots K} x_1 x_2 \cdots x_K
\]

**Key property**: With \( \pm 1 \) coding, the model matrix \( \mathbf{X} \) has orthogonal columns:

\[
\mathbf{X}^\top \mathbf{X} = N \mathbf{I}_{2^K} \implies \hat{\boldsymbol{\beta}} = \frac{1}{N}\mathbf{X}^\top \mathbf{y}
\]

**Connection to intuitive estimates** (continuous response):

\[
\widehat{\text{Effect}} = 2\hat{\beta} = \frac{\mathbf{x}^\top \mathbf{y}}{n \cdot 2^{K-1}}
\]

where \( \mathbf{x} \) is the column of \( \mathbf{X} \) corresponding to the effect. For binary response: \( \widehat{\text{Effect}} = e^{2\hat{\beta}} \).

**Significance testing**: Each effect is a single coefficient, so hypotheses \( H_0: \beta = 0 \) are tested with \( t \)-tests (linear regression) or \( Z \)-tests (logistic regression). The orthogonality ensures tests are independent.

## 4.4 Normal Probability Plots of Effects

When \( n=1 \) (no replication), MSE cannot be estimated directly. **Daniel's method** uses a half-normal or normal probability plot of the estimated effects:
- Under \( H_0 \) (all effects zero), effects are approximately normal with zero mean.
- Significant effects appear as outliers from the line fitted through the central bulk.
- Large effects that deviate from the line are flagged as potentially significant.

## 4.5 Center Points in 2^k Designs

Augment a \( 2^K \) factorial with \( n_c \) **center point** observations at \( x_1 = x_2 = \cdots = x_K = 0 \) to:
1. Provide an independent estimate of pure error.
2. Test for quadratic curvature (see Chapter 6).

The **pure quadratic effect** is:

\[
\beta_{PQ} = \sum_{j=1}^K \beta_{jj}
\]

estimated by:

\[
\hat{\beta}_{PQ} = \bar{\hat{\eta}}_F - \hat{\eta}_C
\]

where \( \bar{\hat{\eta}}_F \) = average fitted value at factorial conditions and \( \hat{\eta}_C \) = fitted value at center point. A \( t \)-test of \( H_0: \beta_{PQ} = 0 \) tests for overall quadratic curvature.

## 4.6 Worked Example: 2^4 Credit Card Factorial

A \( 2^4 \) factorial experiment (4 factors, 16 conditions, \( n=7500 \) each) tested factors: Annual Fee (\( x_1 \)), Account-Opening Fee (\( x_2 \)), Initial Interest Rate (\( x_3 \)), Long-term Interest Rate (\( x_4 \)) on credit card conversion rate (binary response → logistic regression). Selected output:

| Effect | \( \hat{\beta} \) | SE | \( z \) | p-value |
|---|---|---|---|---|
| (Intercept) | −3.7397 | 0.0193 | −193.35 | \( < 2 \times 10^{-16} \) |
| \( x_1 \) | 0.0808 | 0.0193 | 4.18 | \( 2.92 \times 10^{-5} \) |
| \( x_2 \) | −0.1062 | 0.0193 | −5.49 | \( 3.99 \times 10^{-8} \) |
| \( x_3 \) | 0.0582 | 0.0193 | 3.01 | 0.0026 |
| \( x_4 \) | −0.1081 | 0.0193 | −5.59 | \( 2.29 \times 10^{-8} \) |
| \( x_1:x_2 \) | −0.0552 | 0.0193 | −2.85 | 0.00434 |
| \( x_3:x_4 \) | 0.0381 | 0.0193 | 1.97 | 0.04899 |

All main effects are significant. The \( x_1:x_2 \) and \( x_3:x_4 \) interactions are also significant. Interpretation: conversion rate is maximized when annual fee is lower, no account-opening fee, and both interest rates are low.

---

# Chapter 5: Fractional Factorial Designs

## 5.1 Motivation: The 2^(k−p) Design

For large \( K \), \( 2^K \) conditions may be impractically many. A **\( 2^{K-p} \) fractional factorial** investigates \( K \) factors in only \( (1/2)^p \) as many conditions.

**Principle of effect sparsity** (justification): In practice, only a small fraction of effects are significant:
- ~40% of main effects are significant.
- ~10% of two-factor interactions are significant.
- ~5% of three-factor-and-higher interactions are significant.

Therefore, higher-order interaction columns in the model matrix can be "borrowed" to accommodate additional factors.

## 5.2 Aliasing and the Defining Relation

**Aliasing**: Associate the main effect of a new factor with an existing interaction column. This confounds the two effects — they cannot be separately estimated.

**Example — \( 2^{3-1} \) design**: Use the AB interaction column of a \( 2^2 \) design to assign levels of a third factor C:

\[
C = AB \implies I = ABC \quad (\text{defining relation})
\]

The **defining relation** \( I = ABC \) generates all aliases by multiplication:

\[
A = BC, \quad B = AC, \quad C = AB
\]

Every main effect is aliased with a two-factor interaction — a Resolution III design.

**Example — \( 2^{4-1} \) design**: Choose \( D = ABC \):

\[
I = ABCD
\]
Aliases:

\[
A = BCD, \quad B = ACD, \quad C = ABD, \quad D = ABC, \quad AB = CD, \quad AC = BD, \quad BC = AD
\]
Resolution IV: main effects aliased with three-factor interactions (not two-factor interactions).

**Example — \( 2^{5-2} \) design**: Choose \( D = ABC, E = BC \):

\[
I = ABCD = BCE = ADE
\]
Every effect is aliased with 3 other effects (\( 2^p - 1 = 3 \)).

**General rule**: In a \( 2^{K-p} \) design, each estimated quantity jointly represents \( 2^p \) aliased effects.

## 5.3 Design Resolution

<div class="definition">
<strong>Resolution R</strong>: A fractional factorial design has resolution <em>R</em> if no <em>s</em>-factor effect is aliased with another effect involving fewer than <em>R − s</em> factors. Equivalently, the resolution equals the length of the shortest word in the defining relation.
</div>

| Resolution | Alias pattern | Example |
|---|---|---|
| III | MEs aliased with 2FIs | \( 2^{3-1}_\text{III} \): \( I = ABC \) |
| IV | MEs aliased with 3FIs; 2FIs aliased with 2FIs | \( 2^{4-1}_\text{IV} \): \( I = ABCD \) |
| V | MEs aliased with 4FIs; 2FIs aliased with 3FIs | \( 2^{5-1}_\text{V} \): \( I = ABCDE \) |

**Higher resolution is preferred** because main effects are not confounded with low-order interactions.

**Projective property**: A resolution \( R \) design projects onto a full factorial on any subset of \( R-1 \) factors. This means that if only \( R-1 \) factors are active, they form a full factorial sub-design without aliasing.

## 5.4 Minimum Aberration

When multiple generator choices yield the same resolution, compare designs by counting words of each length in the defining relation. The **minimum aberration** design minimizes the number of shortest words (length \( R \)), thereby minimizing the number of aliases at the lowest order.

**Example — \( 2^{7-2}_\text{IV} \)**:

| Design | Generators | Word lengths |
|---|---|---|
| 1 | F=ABC, G=ABD | (4,4,4) |
| 2 | F=ABC, G=CDE | (4,4,6) |
| 3 | F=ABCD, G=ABCE | (5,5,4) |

Design 3 has the fewest length-4 words (one), so it is the minimum aberration design.

## 5.5 Analysis of 2^(k−p) Designs

The analysis mirrors that of a full \( 2^K \) design, but with the aliasing structure in mind.

**Steps**:
1. Write out the model matrix for the \( 2^{K-p} \) design.
2. Fit regression (linear or logistic) with up to \( 2^{K-p} \) effects.
3. Interpret significant effects in light of the alias structure — under effect sparsity, attribute significance to the lower-order aliased effect.
4. Follow up with fold-over or additional runs to de-alias if needed.

### Worked Example: \( 2^{8-4}_\text{IV} \) Wine Experiment

\( K=8 \) factors (Pinot clone, oak type, barrel age, yeast contact, stems, barrel toast, whole cluster, fermentation temp) investigated in only 16 conditions. Generators: \( E=BCD, F=ACD, G=ABC, H=ABD \). Defining relation: \( I = BCDE = ACDF = ABCG = ABDH = \cdots \)

| Condition | A | B | C | D | E=BCD | F=ACD | G=ABC | H=ABD | Avg. Rating |
|---|---|---|---|---|---|---|---|---|---|
| 1 | − | − | − | − | − | − | − | − | 9.6 |
| 2 | + | − | − | − | − | + | + | + | 10.8 |
| ... | ... | ... | ... | ... | ... | ... | ... | ... | ... |
| 16 | + | + | + | + | + | + | + | + | 12.6 |

Selected regression output (attributing 3FI estimates to aliased main effects E, F, G, H):

| Effect | \( \hat{\beta} \) | SE | \( t \) | p-value |
|---|---|---|---|---|
| A | 0.875 | 0.266 | 3.29 | 0.0016 |
| D | −2.300 | 0.266 | −8.66 | \( < 0.001 \) |
| E (=BCD) | 1.100 | 0.266 | 4.14 | 0.0001 |
| F (=ACD) | −1.000 | 0.266 | −3.76 | 0.0004 |
| G (=ABC) | 1.575 | 0.266 | 5.93 | \( < 0.001 \) |
| A:C | 1.300 | 0.266 | 4.89 | \( < 0.001 \) |
| A:H (=FG) | 1.225 | 0.266 | 4.61 | \( < 0.001 \) |

All main effects except H (fermentation temperature) are significant. Significant interactions after de-aliasing: DF, EG, FG interactions.

---

# Chapter 6: Response Surface Methods

## 6.1 Overview of Response Optimization

Response Surface Methodology (RSM) is a sequential strategy for optimization:
- **Phase 1**: Factor screening (2-level designs identify important factors).
- **Phase 2**: Method of steepest ascent/descent (locate vicinity of optimum).
- **Phase 3**: Response surface design + second-order model (precisely locate optimum).
- **Phase 4**: Confirmation experiment.

**Natural to coded units transformation**: For factor with low level \( U_L \) and high level \( U_H \):

\[
x = \frac{U - (U_H + U_L)/2}{(U_H - U_L)/2}, \quad U = x \cdot \frac{U_H - U_L}{2} + \frac{U_H + U_L}{2}
\]

**Response surface models** (Taylor approximations):
- *First-order*: \( \eta = \beta_0 + \sum_j \beta_j x_j \) (plane).
- *First-order + interactions*: adds \( \sum_{j<\ell} \beta_{j\ell} x_j x_\ell \) (twisted plane).
- *Second-order*: \( \eta = \beta_0 + \sum_j \beta_j x_j + \sum_{j<\ell}\beta_{j\ell} x_j x_\ell + \sum_j \beta_{jj} x_j^2 \) (quadratic surface — can have maxima/minima).

Only the second-order model can identify an optimum (maximum or minimum). It requires \( (K'+1)(K'+2)/2 \) parameters where \( K' \) is the number of quantitative factors.

## 6.2 Method of Steepest Ascent/Descent

Fit a first-order model \( \hat{\eta} = \hat{\beta}_0 + \hat{\beta}_1 x_1 + \cdots + \hat{\beta}_{K'} x_{K'} \) from a \( 2^{K'} \) factorial. The gradient is:

\[
\mathbf{g} = \nabla\hat{\eta} = (\hat{\beta}_1, \hat{\beta}_2, \ldots, \hat{\beta}_{K'})^\top
\]

**Path of steepest ascent** (maximize): \( \mathbf{x}' = \mathbf{x} + \lambda\mathbf{g} \)

**Path of steepest descent** (minimize): \( \mathbf{x}' = \mathbf{x} - \lambda\mathbf{g} \)

Step size \( \lambda = \Delta x_j / |\hat{\beta}_j| \) where factor \( j \) is chosen as the reference (e.g., the factor with most practical constraint), and \( \Delta x_j \) is the desired step in coded units for that factor.

**Algorithm**:
1. Start at origin \( \mathbf{x}_0 = \mathbf{0} \) (center of current \( 2^{K'} \) design).
2. Determine step size \( \lambda \).
3. Move along the path, collecting data at each step.
4. Continue until improvement ceases.
5. At best point, test for curvature.
   - No curvature → fit new first-order model; repeat.
   - Curvature detected → proceed to response surface design.

### Checking for Curvature

Augment the \( 2^{K'} \) factorial with center-point observations. The **pure quadratic effect** \( \beta_{PQ} = \sum_j \beta_{jj} \) is estimated as:

\[
\hat{\beta}_{PQ} = \bar{\hat{\eta}}_F - \hat{\eta}_C
\]

Test \( H_0: \beta_{PQ} = 0 \) using a \( t \)-test in the model with linear predictor \( \beta_0 + \sum_j \beta_j x_j + \sum_{j<\ell}\beta_{j\ell}x_jx_\ell + \beta_{PQ} x_{PQ} \), where \( x_{PQ}=1 \) for factorial conditions and \( x_{PQ}=0 \) for center points.

### Worked Example: Netflix Steepest Descent

Two factors: Preview Length (\( x_1 \), 90s to 120s) and Preview Size (\( x_2 \), 0.2 to 0.5 screen fraction). Goal: minimize average browsing time (users want to find content quickly). First \( 2^2 + \)CP experiment:

| Cond | \( x_1 \) | \( x_2 \) | Avg. Browse Time (min) |
|---|---|---|---|
| 1 (−,−) | −1 | −1 | 22.163 |
| 2 (+,−) | +1 | −1 | 22.197 |
| 3 (−,+) | −1 | +1 | 20.223 |
| 4 (+,+) | +1 | +1 | 21.982 |
| CP | 0 | 0 | 22.046 |

Curvature test: \( \hat{\beta}_{PQ} = -0.405 \), p-value = 0.064 — no significant curvature yet. First-order fit: \( \hat{\eta} = 21.722 + 0.448 x_1 - 0.539 x_2 \). Gradient: \( \mathbf{g} = (0.448, -0.539)^\top \). Steepest descent: decrease \( x_1 \) and increase \( x_2 \).

Step size with \( \Delta x_1 = 1/3 \) (steps of 5 seconds): \( \lambda = (1/3)/0.448 = 0.744 \). Path results:

| Step | Preview Length (s) | \( x_1 \) | Preview Size | \( x_2 \) | Avg. Browse Time |
|---|---|---|---|---|---|
| 0 | 105 | 0 | 0.35 | 0 | 21.998 |
| 3 | 90 | −1.000 | 0.530 | 1.202 | 19.105 |
| 6 | 75 | −2.000 | 0.711 | 2.404 | **14.889** |
| 7 | 70 | −2.333 | 0.771 | 2.805 | 17.160 |

Minimum at Step 6. Second \( 2^2 + \)CP in the new region (preview length 60–90s, size 0.6–0.8) yielded \( \hat{\beta}_{PQ} = 2.573 \), p-value \( < 10^{-15} \) — significant curvature detected. Proceed to response surface design.

## 6.3 Central Composite Design (CCD)

<div class="definition">
<strong>Central Composite Design (CCD)</strong>: A response surface design composed of three parts:
<ol>
<li><em>Factorial conditions</em>: a full \(2^{K'}\) factorial design.</li>
<li><em>Center point condition</em>: \(x_1 = x_2 = \cdots = x_{K'} = 0\).</li>
<li><em>Axial (star) conditions</em>: \(\pm a\) on each factor axis, with all other factors at 0.</li>
</ol>
Total distinct conditions: \(2^{K'} + 2K' + 1\).
</div>

**Choosing \( a \)**:
- **Face-centered CCD (\( a=1 \))**: reduces to a \( 3^{K'} \) design; only 3 levels per factor; cuboidal.
- **Rotatable CCD (\( a = \sqrt[4]{2^{K'}} = 2^{K'/4} \))**: equal prediction variance at all points equidistant from center; spherical. For \( K'=2 \): \( a = \sqrt{2} \approx 1.414 \).

**CCD design matrix for \( K'=2 \)**:

| Cond | \( x_1 \) | \( x_2 \) |
|---|---|---|
| 1 (factorial) | −1 | −1 |
| 2 | +1 | −1 |
| 3 | −1 | +1 |
| 4 | +1 | +1 |
| 5 (axial) | −a | 0 |
| 6 | +a | 0 |
| 7 | 0 | −a |
| 8 | 0 | +a |
| 9 (center) | 0 | 0 |

### Second-Order Model and Canonical Analysis

The fitted second-order model in matrix notation:

\[
\hat{\eta} = \hat{\beta}_0 + \mathbf{x}^\top \mathbf{b} + \mathbf{x}^\top \mathbf{B}\mathbf{x}
\]

where \( \mathbf{b} = (\hat{\beta}_1, \ldots, \hat{\beta}_{K'})^\top \) and \( \mathbf{B} \) is the symmetric matrix with diagonal entries \( \hat{\beta}_{jj} \) and off-diagonal entries \( \hat{\beta}_{j\ell}/2 \).

**Stationary point**:

\[
\mathbf{x}_s = -\frac{1}{2}\mathbf{B}^{-1}\mathbf{b}
\]

found by solving \( \partial\hat{\eta}/\partial\mathbf{x} = \mathbf{b} + 2\mathbf{B}\mathbf{x} = \mathbf{0} \). Optimal predicted response:

\[
\hat{\eta}_s = \hat{\beta}_0 + \frac{1}{2}\mathbf{x}_s^\top \mathbf{b}
\]

**Canonical form** (eigendecomposition of \( \mathbf{B} \)): Let \( \mathbf{B} = \mathbf{M}\boldsymbol{\Lambda}\mathbf{M}^\top \) with eigenvalues \( \lambda_1, \ldots, \lambda_{K'} \). Substituting \( \mathbf{w} = \mathbf{M}^\top(\mathbf{x} - \mathbf{x}_s) \):

\[
\hat{\eta} = \hat{\eta}_s + \lambda_1 w_1^2 + \lambda_2 w_2^2 + \cdots + \lambda_{K'} w_{K'}^2
\]

- All \( \lambda_i < 0 \): stationary point is a maximum (response surface).
- All \( \lambda_i > 0 \): stationary point is a minimum.
- Mixed signs: stationary point is a saddle point.

### Worked Example: Lyft Booking Rate (CCD)

Two factors: discount amount (\( x_1 \)) and discount duration (\( x_2 \)), with \( n=500 \) users per condition. CCD with \( a=1.4 \) (natural units: discount 15–85%, duration 1–8 days):

| Cond | Discount (%) | \( x_1 \) | Duration (d) | \( x_2 \) | Booking Rate |
|---|---|---|---|---|---|
| 1 | 25 | −1 | 2 | −1 | 0.71 |
| 4 | 75 | +1 | 7 | +1 | 0.35 |
| 5 (axial) | 85 | +1.4 | 4.5 | 0 | 0.53 |
| 9 (center) | 50 | 0 | 4.5 | 0 | 0.72 |

Second-order logistic regression output:

| Term | \( \hat{\beta} \) | SE | \( z \) | p-value |
|---|---|---|---|---|
| Intercept | 0.943 | 0.100 | 9.47 | \( < 10^{-15} \) |
| \( x_1 \) | 0.039 | 0.033 | 1.17 | 0.241 |
| \( x_2 \) | −0.807 | 0.036 | −22.61 | \( < 10^{-15} \) |
| \( x_1^2 \) | −0.442 | 0.058 | −7.64 | \( < 10^{-14} \) |
| \( x_2^2 \) | −0.414 | 0.059 | −6.99 | \( < 10^{-12} \) |
| \( x_1:x_2 \) | 0.034 | 0.048 | 0.70 | 0.484 |

Stationary point (coded): \( x_{1s} = 0.007 \), \( x_{2s} = -0.973 \) → natural units: 50.2% discount, 2.1 days duration. Predicted booking rate: 0.792 (95% PI: 0.769–0.814). Both quadratic terms are significant and negative → the stationary point is a maximum.

## 6.4 Box-Behnken Designs

An alternative to CCD for \( K' \geq 3 \) factors. A **Box-Behnken design** uses 3 levels (−1, 0, +1) but never runs all factors at extreme levels simultaneously. Each condition lies on a sphere of radius \( \sqrt{2} \) for \( K'=3 \). The design is rotatable (or near-rotatable) and avoids extreme conditions (corners). For \( K'=3 \): 12 edge-midpoint conditions + center = 13 runs (vs. CCD's \( 2^3 + 2(3) + 1 = 15 \)).

## 6.5 RSM with Qualitative Factors

When both quantitative and categorical factors are present, treat each combination of categorical factor levels as defining a separate response surface. Conduct RSM independently within each categorical combination, then compare the optima to identify the overall best operating condition.

---

# Chapter 7: Split-Plot Designs and Variance Components

## 7.1 Split-Plot Structure

<div class="definition">
<strong>Split-plot design</strong>: Arises when some factors are harder (or more expensive) to randomize than others. The experiment is divided into two strata:
<ul>
<li><em>Whole plots</em>: larger experimental units to which the <em>hard-to-change (whole-plot) factors</em> are applied.</li>
<li><em>Subplots</em>: subdivisions of whole plots to which the <em>easy-to-change (subplot) factors</em> are applied.</li>
</ul>
Two error terms result: whole-plot error and subplot error.
</div>

**Motivating example**: An experiment studies baking temperature (hard-to-change — oven must preheat) and baking time (easy-to-change). Whole plots are oven batches (set at a specific temperature); subplots are individual loaves within each batch tested at different times.

**Design structure**: With \( a \) whole-plot treatment levels applied to \( r \) whole plots, and \( b \) subplot treatment levels applied within each whole plot:

| Factor type | Applied to | Levels | Error term |
|---|---|---|---|
| Whole-plot factor A | Whole plots | \( a \) | Whole-plot error |
| Subplot factor B | Subplots within whole plots | \( b \) | Subplot error |

## 7.2 Split-Plot Model

The split-plot model with whole-plot factor A and subplot factor B in a RCBD arrangement:

\[
Y_{ijk} = \mu + \alpha_i + \delta_{ij} + \beta_k + (\alpha\beta)_{ik} + \varepsilon_{ijk}
\]

where:
- \( \alpha_i \): effect of whole-plot factor level \( i \), \( i = 1,\ldots,a \).
- \( \delta_{ij} \sim \mathcal{N}(0, \sigma^2_\delta) \): whole-plot random error (whole-plot \( j \) within level \( i \)); \( j = 1,\ldots,r \).
- \( \beta_k \): effect of subplot factor level \( k \), \( k = 1,\ldots,b \).
- \( (\alpha\beta)_{ik} \): interaction between A and B.
- \( \varepsilon_{ijk} \sim \mathcal{N}(0, \sigma^2) \): subplot error (pure error within subplot).

**Critical point**: The two error terms \( \sigma^2_\delta \) and \( \sigma^2 \) are distinct. Whole-plot effects are tested against \( \sigma^2_\delta \) (whole-plot error MS), while subplot effects and interactions are tested against \( \sigma^2 \) (subplot error MS).

## 7.3 Split-Plot ANOVA Table

With \( r \) whole plots per whole-plot treatment (all nested in blocks \( b_0 \)):

| Source | d.f. | EMS |
|---|---|---|
| Blocks | \( r-1 \) | |
| Whole-plot factor A | \( a-1 \) | \( \sigma^2 + b\sigma^2_\delta + rb\phi_\alpha \) |
| Whole-plot error | \( (a-1)(r-1) \) | \( \sigma^2 + b\sigma^2_\delta \) |
| Subplot factor B | \( b-1 \) | \( \sigma^2 + ra\phi_\beta \) |
| A×B interaction | \( (a-1)(b-1) \) | \( \sigma^2 + r\phi_{\alpha\beta} \) |
| Subplot error | \( a(r-1)(b-1) \) | \( \sigma^2 \) |
| Total | \( abr-1 \) | |

where \( \phi_\alpha = \sum_i \alpha_i^2/(a-1) \), etc.

**Hypothesis tests**:
- \( H_0: \alpha_i = 0 \): \( F = \text{MS}_A / \text{MS}_{\text{WP error}} \sim F(a-1, (a-1)(r-1)) \)
- \( H_0: \beta_k = 0 \): \( F = \text{MS}_B / \text{MS}_{\text{SP error}} \sim F(b-1, a(r-1)(b-1)) \)
- \( H_0: (\alpha\beta)_{ik} = 0 \): \( F = \text{MS}_{AB} / \text{MS}_{\text{SP error}} \)

**Common error**: Using a single error term (as in a CRD) for both whole-plot and subplot effects leads to incorrect F-tests.

## 7.4 Variance Components Estimation

<div class="definition">
<strong>Variance components</strong>: In a random or mixed-effects model, the total variance in the response is decomposed into contributions from different random effects. For example, in a one-way random-effects model:

\[
Y_{ij} = \mu + \alpha_i + \varepsilon_{ij}, \quad \alpha_i \overset{\text{iid}}{\sim} \mathcal{N}(0, \sigma^2_\alpha), \quad \varepsilon_{ij} \overset{\text{iid}}{\sim} \mathcal{N}(0, \sigma^2)
\]
The variance components are \(\sigma^2_\alpha\) (between-group) and \(\sigma^2\) (within-group).
</div>

### ANOVA Method of Moments

Set observed mean squares equal to their expected values and solve for variance components.

For a balanced one-way random-effects model with \( a \) groups and \( n \) observations per group:

\[
\text{MS}_\text{between} = \sigma^2 + n\sigma^2_\alpha, \quad \text{MS}_\text{within} = \sigma^2
\]

Equating observed to expected:

\[
\hat{\sigma}^2 = \text{MS}_\text{within}, \quad \hat{\sigma}^2_\alpha = \frac{\text{MS}_\text{between} - \text{MS}_\text{within}}{n}
\]

**Limitation**: ANOVA estimates can be negative (since \( \hat{\sigma}^2_\alpha \) could be \( < 0 \) if \( \text{MS}_\text{between} < \text{MS}_\text{within} \)), which is not meaningful. Convention: truncate negative estimates to 0.

### REML Estimation

**Restricted Maximum Likelihood (REML)** is preferred in practice. REML:
1. Accounts for uncertainty in fixed-effects estimates when estimating variance components.
2. Always yields non-negative variance component estimates (for standard models).
3. Is implemented in R via `lme4::lmer()`.

For the split-plot model with whole-plot factor A (fixed), subplot factor B (fixed), and random whole-plot error, REML estimates both \( \sigma^2_\delta \) and \( \sigma^2 \) while properly accounting for fixed effects.

**Intraclass correlation coefficient (ICC)**:

\[
\rho = \frac{\sigma^2_\alpha}{\sigma^2_\alpha + \sigma^2} \in [0,1]
\]

measures the proportion of total variance attributable to between-group differences. High ICC means observations within the same group are highly correlated.

## 7.5 Mixed Models for Split-Plot Designs

The split-plot model is a **mixed model**: fixed effects (treatment factors A and B, their interaction) plus random effects (whole-plot error).

In matrix notation:

\[
\mathbf{Y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{Z}\mathbf{u} + \boldsymbol{\varepsilon}
\]

where \( \mathbf{X}\boldsymbol{\beta} \) contains fixed treatment effects, \( \mathbf{Z}\mathbf{u} \) contains the random whole-plot effects (\( \mathbf{u} \sim \mathcal{N}(\mathbf{0}, \sigma^2_\delta \mathbf{I}) \)), and \( \boldsymbol{\varepsilon} \sim \mathcal{N}(\mathbf{0}, \sigma^2\mathbf{I}) \).

Marginal distribution: \( \mathbf{Y} \sim \mathcal{N}(\mathbf{X}\boldsymbol{\beta}, \sigma^2_\delta\mathbf{Z}\mathbf{Z}^\top + \sigma^2\mathbf{I}) \).

Fixed-effect estimates are obtained via **generalized least squares**:

\[
\hat{\boldsymbol{\beta}} = (\mathbf{X}^\top\mathbf{V}^{-1}\mathbf{X})^{-1}\mathbf{X}^\top\mathbf{V}^{-1}\mathbf{Y}
\]

where \( \mathbf{V} = \sigma^2_\delta\mathbf{Z}\mathbf{Z}^\top + \sigma^2\mathbf{I} \).

## 7.6 Nested Designs

<div class="definition">
<strong>Nested design</strong>: Factor B is <em>nested within</em> factor A if each level of B appears within only one level of A. Notation: B(A). Unlike crossed designs, nested factors cannot have "interactions" in the usual sense — the B effect is estimated within levels of A.
</div>

**Two-stage nested model**:

\[
Y_{ijk} = \mu + \alpha_i + \beta_{j(i)} + \varepsilon_{ijk}
\]

where \( \beta_{j(i)} \) is the effect of level \( j \) of B nested within level \( i \) of A.

**ANOVA table for two-stage nested design** (balanced, \( a \) levels of A, \( b \) levels of B within each A, \( n \) observations per B):

| Source | d.f. | SS |
|---|---|---|
| A | \( a-1 \) | \( bn\sum_i(\bar{y}_{i\cdot\cdot}-\bar{y}_{\cdot\cdot\cdot})^2 \) |
| B(A) | \( a(b-1) \) | \( n\sum_i\sum_j(\bar{y}_{ij\cdot}-\bar{y}_{i\cdot\cdot})^2 \) |
| Error | \( ab(n-1) \) | \( \sum_{ijk}(y_{ijk}-\bar{y}_{ij\cdot})^2 \) |
| Total | \( abn-1 \) | |

## 7.7 Repeated Measures Designs

**Repeated measures** arise when multiple measurements are taken on the same experimental unit over time or under different conditions. This is analogous to a split-plot design where:
- Whole-plot unit = subject (experimental unit).
- Within-subject factor = time/condition (equivalent to subplot factor).

**Compound symmetry assumption**: The variance-covariance matrix of the repeated measures for each subject is:

\[
\boldsymbol{\Sigma} = \begin{pmatrix} \sigma^2 & \rho\sigma^2 & \cdots & \rho\sigma^2 \\ \rho\sigma^2 & \sigma^2 & \cdots & \rho\sigma^2 \\ \vdots & & \ddots & \vdots \\ \rho\sigma^2 & \cdots & \rho\sigma^2 & \sigma^2 \end{pmatrix}
\]

where \( \rho \) is the correlation between any two measurements on the same subject. The Mauchly sphericity test checks whether this assumption holds; if violated, Greenhouse-Geisser or Huynh-Feldt corrections to the degrees of freedom are applied.

---

# Appendix: Key Formulas and Summary Tables

## A.1 Comparison of Design Structures

| Design | Controls | Nuisance Factors | Error d.f. | Use When |
|---|---|---|---|---|
| CRD | Nothing | None | \( N-m \) | Units are homogeneous |
| RCBD | 1 NF | 1 (by blocks) | \( N-m-b+1 \) | One known NF |
| Latin Square | 2 NFs | 2 (rows + cols) | \( N-3p+2 \) | Two known NFs, same \( p \) |
| BIBD | 1 NF (partial) | 1 (incomplete) | varies | Block size \( < m \) |
| Split-plot | — | — | Two error terms | Hard-to-change factors |

## A.2 2^k and 2^(k−p) Design Summary

| Design | Conditions | Factors | Resolution |
|---|---|---|---|
| \( 2^3 \) | 8 | 3 | — (full) |
| \( 2^{3-1} = 2^2 \) | 4 | 3 | III (\( I=ABC \)) |
| \( 2^{4-1} \) | 8 | 4 | IV (\( I=ABCD \)) |
| \( 2^{5-1} \) | 16 | 5 | V (\( I=ABCDE \)) |
| \( 2^{5-2} \) | 8 | 5 | III (\( I=ABC=CDE=\cdots \)) |
| \( 2^{8-4} \) | 16 | 8 | IV (wine example) |

## A.3 Response Surface Design Comparison

| Design | Factors \( K' \) | Runs | Levels per factor | Rotatable? |
|---|---|---|---|---|
| CCD (spherical, \( a=\sqrt{K'} \)) | \( K' \) | \( 2^{K'} + 2K' + 1 \) | 5 | Yes |
| CCD (face-centered, \( a=1 \)) | \( K' \) | \( 2^{K'} + 2K' + 1 \) | 3 | No |
| Box-Behnken | \( K' \geq 3 \) | varies | 3 | Near-yes |

## A.4 Critical Distributions Reference

| Test | Statistic | Null Distribution |
|---|---|---|
| One-way ANOVA F-test | \( F = \text{MSC}/\text{MSE} \) | \( F(m-1, N-m) \) |
| RCBD Condition F-test | \( F = \text{MSC}/\text{MSE} \) | \( F(m-1, N-m-b+1) \) |
| Latin Square DF test | \( F = \text{MSC}/\text{MSE} \) | \( F(p-1, N-3p+2) \) |
| Regression coefficient \( t \)-test | \( t = \hat{\beta}/\text{SE}(\hat{\beta}) \) | \( t(\nu) \) |
| Likelihood ratio test | \( 2[\ell_\text{full} - \ell_\text{red}] \) | \( \chi^2(\nu) \) |
| \( \chi^2 \) test of independence | \( \sum(O-E)^2/E \) | \( \chi^2(df) \) |

## A.5 Effect Hierarchy Principle

When analyzing factorial experiments, the following hierarchy guides interpretation:
1. **Main effects** are most likely to be important.
2. **Two-factor interactions** are next most likely.
3. **Three-factor and higher interactions** are progressively less likely to be significant.

This principle, combined with **effect sparsity** (few effects are truly active), justifies:
- Using \( 2^{K-p} \) fractional factorials for screening.
- Choosing design generators that alias main effects with high-order interactions.
- Treating significant high-order aliased effects as due to their lower-order alias.

## A.6 Sequential Experimentation Strategy

The overall RSM workflow:

\[
\underbrace{2^K \text{ or } 2^{K-p} \text{ screening}}_{\text{Phase 1: identify active factors}} \longrightarrow \underbrace{\text{steepest ascent/descent}}_{\text{Phase 2: locate optimum vicinity}} \longrightarrow \underbrace{\text{CCD + second-order model}}_{\text{Phase 3: optimize}} \longrightarrow \underbrace{\text{confirmation run}}_{\text{Phase 4: verify}}
\]

Each phase informs the next, making efficient use of experimental resources by not committing all runs to a single large experiment at the outset.

---

# Chapter 8: Advanced Topics and Extensions

## 8.1 Analysis of Covariance (ANCOVA)

<div class="definition">
<strong>Covariate</strong>: A covariate is a continuous variable that is measured on each experimental unit and that may influence the response, but is not itself a factor of primary interest. Including covariates in the model can reduce residual variance and improve precision of treatment comparisons.
</div>

**ANCOVA model** for a CRD with one covariate \( z \):

\[
Y_{ij} = \mu + \tau_j + \gamma(z_{ij} - \bar{z}) + \varepsilon_{ij}
\]

where \( \gamma \) is the common within-group regression coefficient (slope) for the covariate. The ANCOVA F-test for treatments adjusts for the covariate effect.

**ANCOVA ANOVA table** (one covariate, \( m \) treatments, \( N \) total observations):

| Source | d.f. | SS | MS | F |
|---|---|---|---|---|
| Adjusted treatments | \( m-1 \) | \( \text{SS}_{T(\text{adj})} \) | \( \text{MS}_{T(\text{adj})} \) | \( \text{MS}_{T(\text{adj})}/\text{MSE} \) |
| Covariate | 1 | \( \text{SS}_{\text{cov}} \) | \( \text{MS}_{\text{cov}} \) | \( \text{MS}_{\text{cov}}/\text{MSE} \) |
| Error (adjusted) | \( N-m-1 \) | \( \text{SSE}_{\text{adj}} \) | \( \text{MSE}_{\text{adj}} \) | |
| Total | \( N-1 \) | | | |

**Assumptions for ANCOVA**:
1. Common slope \( \gamma \) across all treatment groups (homogeneity of regression slopes). Test with an interaction term \( \tau_j \times z \) in the model.
2. Covariate values \( z_{ij} \) are not influenced by the treatments (measured before treatment application, or known to be independent).
3. Standard regression assumptions for the errors.

**Benefit**: ANCOVA can substantially reduce \( \text{SSE} \), leading to a smaller MSE and more powerful treatment comparisons — especially when the covariate is highly correlated with the response.

## 8.2 Yates' Algorithm for 2^k Designs

**Yates' algorithm** provides a systematic, manual procedure for computing all \( 2^K \) effect estimates from a \( 2^K \) factorial experiment without matrix multiplication. It is especially useful for checking hand calculations.

**Algorithm** (illustrated for \( 2^3 \), standard order: (1), a, b, ab, c, ac, bc, abc):
1. List condition totals \( y_1, \ldots, y_{2^K} \) in standard (Yates) order.
2. Form column (1): upper half = sums of pairs, lower half = differences (later − earlier) of pairs.
3. Repeat \( K \) times total to generate column \( K \).
4. Divide column \( K \) by \( n \cdot 2^{K-1} \) (where \( n \) = reps per condition) to get effect estimates.

**Worked Example** (\( 2^3 \), \( n=1 \), condition totals in standard order):

| Cond | Total | Col 1 | Col 2 | Col 3 | Effect | Estimate |
|---|---|---|---|---|---|---|
| (1) | 6 | 14 | 38 | 58 | \( \mu \) | 58/4 = 14.5 |
| a | 8 | 24 | 20 | 10 | A | 10/4 = 2.5 |
| b | 11 | 12 | 6 | −4 | B | −4/4 = −1 |
| ab | 12 | 8 | 4 | 2 | AB | 2/4 = 0.5 |
| c | 5 | 2 | −4 | 8 | C | 8/4 = 2 |
| ac | 10 | 4 | 0 | 2 | AC | 2/4 = 0.5 |
| bc | 4 | 2 | −2 | −2 | BC | −2/4 = −0.5 |
| abc | 4 | 2 | 4 | 0 | ABC | 0/4 = 0 |

Column 1 example: \( 6+8=14 \), \( 11+12=23 \)... upper half; \( 8-6=2 \), \( 12-11=1 \)... lower half.

The most influential factors are A (effect = 2.5) and C (effect = 2.0). The three-factor interaction ABC is negligible (effect = 0).

## 8.3 Plackett-Burman Designs

**Plackett-Burman (PB) designs** are a class of two-level screening designs that are Resolution III and allow studying \( N-1 \) factors in \( N \) runs, where \( N \) is a multiple of 4 but not necessarily a power of 2 (e.g., \( N = 12, 20, 24, 28, \ldots \)).

**Comparison to \( 2^{K-p} \) designs**:
- PB designs with \( N = 12 \) can accommodate up to 11 factors in 12 runs.
- The smallest \( 2^{K-p} \) design for 11 factors in 12+ runs is \( 2^{11-7} = 16 \) runs.
- PB designs are more economical for large \( K \), but they have **complex, non-structured alias patterns** — main effects are partially aliased with two-factor interactions, not fully confounded.

**Construction**: For \( N=12 \), the generating row is:

\[
(+1, +1, −1, +1, +1, +1, −1, −1, −1, +1, −1)
\]

Subsequent rows are obtained by cyclic shifts; the final row is all \( -1 \).

**Partial aliasing**: Each main effect in a PB design is partially aliased with every two-factor interaction not involving it. The alias coefficient is \( \pm 1/3 \) for \( N=12 \). This means that even after identifying significant main effects, residual bias from interactions may exist, but the bias is spread evenly rather than concentrated.

**Use case**: PB designs are primarily used for initial factor screening when the number of factors is large (up to \( N-1 \)) and resources are very limited, accepting the limitation of complex aliasing.

## 8.4 Fold-Over of Fractional Factorial Designs

A **fold-over** is a follow-up experiment used to de-alias confounded effects identified in a \( 2^{K-p} \) screening experiment.

**Principle**: Run the complementary fraction (obtained by reversing the signs of all factor levels in the original fraction). The combined design has all main effects free of two-factor interaction aliases.

**Complete fold-over of a Resolution III design**: Appending the complementary fraction to a \( 2^{K-p}_\text{III} \) design yields a design where:
- All main effects are de-aliased from all two-factor interactions.
- The combined design is Resolution IV.
- Total runs: \( 2 \times 2^{K-p} \).

**Partial fold-over**: Reverse the signs of only one factor \( F_j \) in the original design. This de-aliases the main effect of \( F_j \) from all two-factor interactions involving \( F_j \). Useful when only one factor's aliases are problematic.

**Example**: If the original \( 2^{5-2}_\text{III} \) design identified factors A, C, D as potentially significant, and the aliases are \( A = DE, C = BE, D = AE \), a fold-over on factor D would separate the \( D \) main effect from the \( AE \) interaction, clarifying whether the signal is due to D or AE.

## 8.5 Projection Properties of Fractional Factorials

**Projection theorem**: A \( 2^{K-p}_R \) design projects onto a full factorial design in any \( R-1 \) factors. Specifically:
- Resolution III design → full \( 2^2 \) in any 2 of the \( K \) factors.
- Resolution IV design → full \( 2^3 \) in any 3 of the \( K \) factors.
- Resolution V design → full \( 2^4 \) in any 4 of the \( K \) factors.

This property enables sequential learning: if the screening experiment identifies 2 (or 3) truly active factors among \( K \), the sub-design defined by those factors is already a full factorial — no further runs are needed to estimate their main effects and interactions.

**Example**: The \( 2^{4-1}_\text{IV} \) design (8 runs, 4 factors) projects onto a full \( 2^3 \) design in any 3 of the 4 factors. If factor D turns out to be inactive, the remaining 3-factor sub-design is a complete \( 2^3 \) factorial.

## 8.6 Desirability Functions for Multiple Responses

When optimizing several response variables simultaneously (multiple responses \( y_1, y_2, \ldots, y_r \)), the **desirability function** approach converts each response to an individual desirability \( d_i \in [0,1] \) and then combines them into an overall desirability \( D \).

**Individual desirability** for maximization (target \( T \), lower limit \( L \), upper limit \( U \)):

\[
d_i = \begin{cases} 0 & y_i < L \\ \left(\frac{y_i - L}{T - L}\right)^s & L \leq y_i \leq T \\ \left(\frac{U - y_i}{U - T}\right)^t & T < y_i \leq U \\ 0 & y_i > U \end{cases}
\]

where \( s, t > 0 \) are shape parameters (s=t=1 gives linear ramps; s,t > 1 penalizes deviations more sharply).

**Overall desirability** (geometric mean):

\[
D = \left(\prod_{i=1}^r d_i^{w_i}\right)^{1/\sum w_i}
\]

where \( w_i > 0 \) are importance weights. The factor settings that maximize \( D \) represent the compromise optimum across all responses.

**Procedure**:
1. Fit separate second-order models for each response \( y_1, \ldots, y_r \).
2. Define individual desirability functions based on goals (maximize, minimize, or hit target).
3. Maximize \( D \) numerically over the factor space.
4. Evaluate the predicted values and desirabilities at the optimal settings.
5. Confirm with a confirmation run.

## 8.7 Robust Parameter Design

Developed by Genichi Taguchi (popularized in the West by Wu & Hamada), **robust parameter design** aims to find factor settings that minimize response variability (due to noise factors) while keeping the mean on target.

**Key concepts**:
- **Control factors** (\( x \)): factors the engineer can set and hold fixed in production.
- **Noise factors** (\( z \)): sources of variability that cannot be controlled during production (environmental conditions, material variation, operator differences) but can be controlled during experimentation.

**Combined array (crossed) approach**: Run a factorial design in the control factors crossed with a factorial design in the noise factors. For each combination of control settings, observe the response across noise conditions.

**Signal-to-noise (SN) ratios** (Taguchi's approach): summarize location and dispersion jointly.
- Larger-is-better: \( \text{SN} = -10 \log_{10}\left(\frac{1}{n}\sum_i y_i^{-2}\right) \)
- Smaller-is-better: \( \text{SN} = -10 \log_{10}\left(\frac{1}{n}\sum_i y_i^{2}\right) \)
- Nominal-is-best: \( \text{SN} = 10 \log_{10}(\bar{y}^2/s^2) \)

**Modern approach (response model method)**: Fit a model for the mean and a model for the log-variance as functions of control and noise factors. Then identify control factor settings that achieve the desired mean while minimizing variance.

The key insight: if a control factor \( x \) interacts with a noise factor \( z \), then changing \( x \) can reduce the effect of \( z \) on the response — making the product or process *robust to noise*.

## 8.8 Summary: Design Selection Guide

The following guide summarizes which design to choose based on the experimental situation:

**Scenario 1: One factor, no nuisance factors, units are homogeneous**
→ Use a **CRD** (one-way ANOVA).

**Scenario 2: One factor, one known nuisance factor**
→ Use an **RCBD** (two-way ANOVA without interaction).

**Scenario 3: One factor, two known nuisance factors, same number of levels**
→ Use a **Latin square design** (three-way ANOVA).

**Scenario 4: One factor, one nuisance factor, but block size < number of treatments**
→ Use a **BIBD**.

**Scenario 5: Multiple factors (screening), all easy to change, budget for \( 2^K \) runs**
→ Use a **\( 2^K \) full factorial**.

**Scenario 6: Many factors (\( K \) large), budget limits runs to \( 2^{K-p} \)**
→ Use a **\( 2^{K-p} \) fractional factorial** with maximum resolution and minimum aberration.

**Scenario 7: Very large \( K \), extreme resource constraints**
→ Use a **Plackett-Burman design** (Resolution III, non-regular).

**Scenario 8: Active factors identified, seeking optimum location**
→ Use **method of steepest ascent/descent**, then a **central composite design** for second-order modelling.

**Scenario 9: Some factors hard-to-change (expensive to reset)**
→ Use a **split-plot design** with appropriate two-error-term analysis.

**Scenario 10: Multiple response variables to optimize simultaneously**
→ Combine RSM with **desirability functions**.

## 8.9 Worked Example: Full 2^3 ANOVA Table

Consider a \( 2^3 \) factorial experiment studying factors A (temperature), B (pressure), C (catalyst) on yield (%), with \( n=2 \) replicates per condition. Condition totals:

| Cond | A | B | C | Total |
|---|---|---|---|---|
| (1) | − | − | − | 28 |
| a | + | − | − | 36 |
| b | − | + | − | 22 |
| ab | + | + | − | 32 |
| c | − | − | + | 34 |
| ac | + | − | + | 50 |
| bc | − | + | + | 30 |
| abc | + | + | + | 48 |

Grand total \( T = 280 \), \( N = 16 \), correction factor \( \text{CF} = T^2/N = 280^2/16 = 4900 \).

\[
\text{SST} = \sum_{all} y^2 - \text{CF} = (14^2 + 14^2 + 18^2 + \cdots) - 4900
\]

Effect estimates (using contrast coefficients, divided by \( n \cdot 2^{K-1} = 2 \times 4 = 8 \)):

\[
A = \frac{-28 + 36 - 22 + 32 - 34 + 50 - 30 + 48}{8} = \frac{52}{8} = 6.5
\]

\[
B = \frac{-28 - 36 + 22 + 32 - 34 - 50 + 30 + 48}{8} = \frac{-16}{8} = -2
\]

\[
C = \frac{-28 - 36 - 22 - 32 + 34 + 50 + 30 + 48}{8} = \frac{44}{8} = 5.5
\]

\[
AB = \frac{28 - 36 - 22 + 32 + 34 - 50 - 30 + 48}{8} = \frac{4}{8} = 0.5
\]

\[
AC = \frac{28 - 36 + 22 - 32 - 34 + 50 - 30 + 48}{8} \approx 2
\]

\[
BC = \frac{28 + 36 - 22 - 32 - 34 - 50 + 30 + 48}{8} = \frac{4}{8} = 0.5
\]

\[
ABC = \frac{-28 + 36 + 22 - 32 + 34 - 50 - 30 + 48}{8} = \frac{0}{8} = 0
\]

Each SS = \( n \cdot 2^{K-1} \cdot (\text{Effect}/2)^2 = 8 \cdot (\text{Effect}/2)^2 \) = \( 2 \cdot \text{Effect}^2 \):

\[
\text{SS}_A = 2(6.5)^2 = 84.5, \quad \text{SS}_B = 2(2)^2 = 8, \quad \text{SS}_C = 2(5.5)^2 = 60.5
\]

\[
\text{SS}_{AB} = 2(0.5)^2 = 0.5, \quad \text{SS}_{AC} = 2(2)^2 = 8, \quad \text{SS}_{BC} = 0.5, \quad \text{SS}_{ABC} = 0
\]

**ANOVA table** (assuming \( \text{SSE} = 22 \) from replication error, df = 8):

| Source | SS | d.f. | MS | F |
|---|---|---|---|---|
| A | 84.5 | 1 | 84.5 | 30.7 |
| B | 8.0 | 1 | 8.0 | 2.9 |
| C | 60.5 | 1 | 60.5 | 22.0 |
| AB | 0.5 | 1 | 0.5 | 0.18 |
| AC | 8.0 | 1 | 8.0 | 2.9 |
| BC | 0.5 | 1 | 0.5 | 0.18 |
| ABC | 0.0 | 1 | 0.0 | 0.0 |
| Error | 22.0 | 8 | 2.75 | |
| Total | 184.0 | 15 | | |

At \( \alpha=0.05 \), \( F_{0.05, 1, 8} = 5.32 \). **Factors A and C are significant**. Factor B, and all interactions, are not significant at this level. The yield is maximized by setting temperature A high and catalyst C high, regardless of pressure B.

## 8.10 Worked Example: 2^(4-1) Alias Structure

Construct a \( 2^{4-1}_\text{IV} \) design with generator \( D = ABC \):

1. Write the \( 2^3 \) design in A, B, C.
2. Set \( D = ABC \) (product of all three factors' signs).

| Cond | A | B | C | D=ABC |
|---|---|---|---|---|
| 1 | − | − | − | − |
| 2 | + | − | − | + |
| 3 | − | + | − | + |
| 4 | + | + | − | − |
| 5 | − | − | + | + |
| 6 | + | − | + | − |
| 7 | − | + | + | − |
| 8 | + | + | + | + |

Defining relation: \( I = ABCD \). Complete alias structure:
- Main effects: \( A = BCD \), \( B = ACD \), \( C = ABD \), \( D = ABC \)
- Two-factor interactions: \( AB = CD \), \( AC = BD \), \( AD = BC \)

This is Resolution IV: main effects are aliased only with three-factor interactions (assumed negligible by effect sparsity), but two-factor interactions are aliased with other two-factor interactions. To de-alias two-factor interactions, a fold-over or additional runs are needed.

**Steepest Ascent Calculation Example**

Suppose after running the \( 2^{4-1} \) design, the first-order model fit to factors A and D (the two significant main effects) is:

\[
\hat{\eta} = 45.2 + 3.1 x_A - 2.4 x_D
\]

To minimize the response, use steepest descent. Choose step size anchored to factor D (harder to change): \( \Delta x_D = 0.5 \), so \( \lambda = 0.5/|{-2.4}| = 0.208 \).

Steps along the path of steepest descent (\( \mathbf{x}' = \mathbf{x} - \lambda\mathbf{g} \), with \( \mathbf{g} = (3.1, -2.4) \)):

| Step | \( x_A \) | \( x_D \) | \( \hat{\eta} \) |
|---|---|---|---|
| 0 | 0 | 0 | 45.2 |
| 1 | \( 0 - 0.208(3.1) = -0.645 \) | \( 0 + 0.208(2.4) = +0.500 \) | \( 45.2 + 3.1(-0.645) - 2.4(0.5) = 41.2 \) |
| 2 | −1.290 | +1.000 | 37.2 |
| 3 | −1.935 | +1.500 | 33.2 |

Each step reduces the predicted response by approximately 4 units. Continue until improvement slows, then augment with center points to test for curvature.

---

# Chapter 9: Inference in Linear Models — Review and Connections

## 9.1 The General Linear Model Framework

All of the experimental designs studied in this course are analyzed through the **general linear model**:

\[
\mathbf{Y} = \mathbf{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon}, \quad \boldsymbol{\varepsilon} \sim \mathcal{N}(\mathbf{0}, \sigma^2\mathbf{I})
\]

where:
- \( \mathbf{Y} \) is the \( N \times 1 \) vector of responses.
- \( \mathbf{X} \) is the \( N \times p \) model (design) matrix — full column rank assumed.
- \( \boldsymbol{\beta} \) is the \( p \times 1 \) vector of unknown parameters.
- \( \boldsymbol{\varepsilon} \) is the \( N \times 1 \) vector of random errors.

**Ordinary Least Squares (OLS) estimator**:

\[
\hat{\boldsymbol{\beta}} = (\mathbf{X}^\top\mathbf{X})^{-1}\mathbf{X}^\top\mathbf{Y}
\]

**Properties** (Gauss-Markov Theorem): \( \hat{\boldsymbol{\beta}} \) is the Best Linear Unbiased Estimator (BLUE) of \( \boldsymbol{\beta} \):

\[
\mathbb{E}[\hat{\boldsymbol{\beta}}] = \boldsymbol{\beta}, \quad \mathbb{V}(\hat{\boldsymbol{\beta}}) = \sigma^2(\mathbf{X}^\top\mathbf{X})^{-1}
\]

**Residual sum of squares**: \( \text{SSE} = \mathbf{Y}^\top(\mathbf{I} - \mathbf{H})\mathbf{Y} \) where \( \mathbf{H} = \mathbf{X}(\mathbf{X}^\top\mathbf{X})^{-1}\mathbf{X}^\top \) is the hat (projection) matrix. Unbiased estimator: \( \hat{\sigma}^2 = \text{SSE}/(N-p) = \text{MSE} \).

## 9.2 The Partial F-Test

The **partial F-test** compares a full model to a reduced model obtained by setting a subset of \( q \) parameters to zero.

\[
F = \frac{(\text{SSE}_\text{red} - \text{SSE}_\text{full})/q}{\text{SSE}_\text{full}/(N-p)} \sim F(q, N-p) \quad \text{under } H_0
\]

This is the workhorse test for:
- Testing significance of a factor in ANOVA (\( q = \) number of levels \( - 1 \)).
- Testing significance of an interaction (\( q = \) number of interaction terms).
- Testing a group of regression coefficients simultaneously.

**Equivalently**, via the coefficient of determination:

\[
F = \frac{(R^2_\text{full} - R^2_\text{red})/q}{(1 - R^2_\text{full})/(N-p)}
\]

## 9.3 Model Diagnostics

After fitting any linear model, residual diagnostics verify the assumptions:

**Residuals**: \( \hat{\varepsilon}_i = y_i - \hat{y}_i = y_i - \mathbf{x}_i^\top\hat{\boldsymbol{\beta}} \).

**Standardized residuals**: \( r_i = \hat{\varepsilon}_i / (\hat{\sigma}\sqrt{1-h_{ii}}) \) where \( h_{ii} \) is the \( i \)-th diagonal of \( \mathbf{H} \).

| Plot | What it checks |
|---|---|
| Residuals vs. fitted | Non-constant variance (heteroscedasticity), non-linearity |
| Normal Q-Q plot | Normality of errors |
| Scale-location plot | Homoscedasticity |
| Residuals vs. leverage | Influential observations (Cook's distance) |

**Normality**: Shapiro-Wilk test on residuals. **Constant variance**: Bartlett test (sensitive to normality) or Levene test (robust).

If normality fails: consider transformations (Box-Cox \( \lambda \)-family: \( y^{(\lambda)} = (y^\lambda - 1)/\lambda \) for \( \lambda \neq 0 \), \( \log y \) for \( \lambda = 0 \)).

## 9.4 Estimability and Aliasing in Matrix Terms

For a \( 2^{K-p} \) design with model matrix \( \mathbf{X} \) (columns = estimable effects), the relationship between the OLS estimate and the true effect is:

\[
\hat{\boldsymbol{\beta}}_\text{estimable} = \boldsymbol{\beta}_\text{estimable} + \mathbf{A}\boldsymbol{\beta}_\text{aliased}
\]

where \( \mathbf{A} \) is the **alias matrix**:

\[
\mathbf{A} = (\mathbf{X}_1^\top\mathbf{X}_1)^{-1}\mathbf{X}_1^\top\mathbf{X}_2
\]

Here \( \mathbf{X}_1 \) = columns for estimable effects, \( \mathbf{X}_2 \) = columns for non-estimable (aliased) effects. For \( \pm 1 \) orthogonal designs, entries of \( \mathbf{A} \) are \( \pm 1/2^p \in \{0, \pm 1\} \), reflecting full confounding. When \( A_{ij} = 1 \), effect \( i \) is completely aliased with effect \( j \).

## 9.5 Confidence Intervals and Multiple Comparison Adjustments

**Individual 95% CI** for \( \beta_j \):

\[
\hat{\beta}_j \pm t_{\alpha/2, N-p} \cdot \text{SE}(\hat{\beta}_j)
\]

**Simultaneous CIs** (Scheffé method, for all linear combinations \( \mathbf{c}^\top\boldsymbol{\beta} \)):

\[
\mathbf{c}^\top\hat{\boldsymbol{\beta}} \pm \sqrt{p \cdot F_{\alpha, p, N-p}} \cdot \hat{\sigma}\sqrt{\mathbf{c}^\top(\mathbf{X}^\top\mathbf{X})^{-1}\mathbf{c}}
\]

**Tukey-Kramer CIs** (all pairwise means, possibly unequal \( n_j \)):

\[
(\bar{y}_{\cdot j} - \bar{y}_{\cdot k}) \pm \frac{q_{\alpha,m,N-m}}{\sqrt{2}} \cdot \hat{\sigma}\sqrt{\frac{1}{n_j} + \frac{1}{n_k}}
\]

These simultaneous methods maintain the familywise confidence level at \( 1-\alpha \) over all comparisons, ensuring that conclusions from the full set of intervals are jointly reliable.

## 9.6 Fixed vs. Random Effects

<div class="definition">
<strong>Fixed effects model</strong>: Treatment levels are specifically chosen and are the only levels of interest. Conclusions apply only to those specific levels. The CRD, RCBD, and Latin square with fixed factors all use fixed-effects models.
</div>

<div class="definition">
<strong>Random effects model</strong>: Treatment levels are a random sample from a larger population of levels. Interest lies in estimating the variance component \(\sigma^2_\tau\) rather than individual level effects. Conclusions generalize to the entire population of levels.
</div>

<div class="definition">
<strong>Mixed model</strong>: Contains both fixed and random effects. The split-plot design is a prime example: treatment factors are fixed, whole-plot grouping introduces random effects.
</div>

**One-way random-effects ANOVA test** (testing \( H_0: \sigma^2_\tau = 0 \)): Same F-statistic as fixed effects (\( F = \text{MSC}/\text{MSE} \)), but the interpretation differs — rejection means between-group variance exceeds within-group variance, not that specific group means differ.

**Expected mean squares for random effects** (one-way, balanced):

\[
\mathbb{E}[\text{MSC}] = \sigma^2 + n\sigma^2_\tau, \quad \mathbb{E}[\text{MSE}] = \sigma^2
\]

Under \( H_0: \sigma^2_\tau = 0 \), both equal \( \sigma^2 \), giving \( F \sim F(m-1, N-m) \).

## 9.7 Power for Factorial Experiments

For a \( 2^K \) experiment with \( n \) replicates per condition (\( N = n \cdot 2^K \)), the test for a single effect (one \( \beta \)) is a \( t \)-test:

\[
T = \frac{\hat{\beta} - 0}{\text{SE}(\hat{\beta})} = \frac{\hat{\beta}}{\hat{\sigma}/\sqrt{n \cdot 2^{K-1}}} \sim t(N - 2^K)
\]

Power for detecting a true effect size \( \delta = 2|\beta| \):

\[
\text{Power} = P\left(|T| > t_{\alpha/2, N-2^K} \mid \beta \neq 0\right)
\]

using the non-central \( t \)-distribution with non-centrality parameter \( \phi = |\beta|/(\sigma/\sqrt{n \cdot 2^{K-1}}) \).

Required replication \( n \) to achieve power \( 1-\beta' \) at level \( \alpha \):

\[
n = \frac{(z_{\alpha/2} + z_{1-\beta'})^2 \sigma^2}{\beta^2 \cdot 2^{K-1}}
\]

(approximately, using normal approximation). **Insight**: For the same power and effect size, a \( 2^K \) design is more efficient than \( 2^K \) separate one-factor experiments because all \( N = n \cdot 2^K \) observations contribute to each main-effect estimate through orthogonality.


