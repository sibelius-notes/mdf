---
title: "STAT 435: Statistical Methods for Process Improvements"
subjects: "STAT"
prof: "Joslin Goh"
---

## Sources and References

**Primary texts** — Montgomery (2020) *Introduction to Statistical Quality Control* 8th ed; Steiner & MacKay (2005) *Statistical Engineering: An Algorithm for Reducing Variation in Manufacturing Processes*; DeVor, Chang & Sutherland (2007) *Statistical Quality Design and Control* 2nd ed

**Supplementary texts** — Kenett & Zacks (2014) *Modern Industrial Statistics* 2nd ed; Ryan (2011) *Statistical Methods for Quality Improvement* 3rd ed; Taguchi, Chowdhury & Wu (2005) *Taguchi's Quality Engineering Handbook*

**Online resources** — NIST/SEMATECH Engineering Statistics Handbook (https://www.itl.nist.gov/div898/handbook/); ASQ Body of Knowledge (https://asq.org); MIT OCW 6.871 and 15.066 quality management materials

---

# Chapter 1: Quality Management and Process Variation

## 1.1 Defining Quality

Quality means different things in different contexts. Three dominant perspectives appear throughout the literature:

**Fitness for use** (Juran): a product or service is high quality if it accomplishes its intended purpose under the conditions its user expects. This is a customer-centric definition that emphasises function over conformance.

**Conformance to requirements** (Crosby): quality is the degree to which a process output meets a pre-specified standard. This perspective is well-suited to manufacturing, where tolerances and specifications are measurable.

**Customer satisfaction** (Deming): quality is ultimately judged by the customer's experience. Even a product that conforms to all internal specifications is low quality if customers are dissatisfied.

Modern quality management synthesises all three. A product must conform to specifications that were themselves derived from genuine customer needs, and final quality is judged by the customer's total experience.

<div class="definition">
<strong>Quality characteristic</strong>: a measurable or observable feature of a product or service — also called a <em>critical-to-quality (CTQ) attribute</em> — that is causally linked to customer satisfaction. Examples include tensile strength, fill volume, response time, and surface roughness.
</div>

## 1.2 Sources of Variation

Every manufacturing or service process exhibits variation in its outputs. Understanding the nature of that variation is the first step towards improving the process.

### 1.2.1 Common Cause vs. Special Cause

Walter Shewhart distinguished between two fundamentally different types of variation:

<div class="definition">
<strong>Common cause variation</strong> (Shewhart) / <strong>chance cause</strong>: variation inherent to the process when it is operating as designed. It results from the cumulative effect of many small, independent sources — raw material heterogeneity, ambient temperature fluctuations, minor tool wear — none of which individually dominates. A process exhibiting only common cause variation is said to be <em>in statistical control</em>.
</div>

<div class="definition">
<strong>Special cause variation</strong> (Shewhart) / <strong>assignable cause</strong>: variation due to an identifiable, intermittent, or sporadic source that is <em>not</em> part of the stable process. Examples include a worn bearing, an improperly calibrated instrument, a batch of nonstandard input material, or an untrained operator. Detection and elimination of special causes is the primary purpose of control charts.
</div>

### 1.2.2 Deming's Funnel Experiment

W. Edwards Deming illustrated the danger of over-reacting to common cause variation through the *funnel experiment*. A marble is dropped through a funnel aimed at a target on a table. Four rules are compared:

- **Rule 1**: Leave the funnel stationary over the target. The marble lands in a roughly circular distribution around the target — the minimum achievable spread under the current common-cause system.
- **Rule 2**: After each drop, move the funnel by the negative of the last error. This causes an expanding zigzag pattern — tampering amplifies variation.
- **Rule 3**: Always aim the funnel at the last landing point. This causes the marble to drift unboundedly from the target over time.
- **Rule 4**: Always place the funnel directly over the last landing point. The output diverges even faster.

The central lesson: when a process is in control, adjusting it in response to individual readings *increases* variation. Intervention is only warranted when a special cause is detected.

## 1.3 Process Capability Indices

Once a process is in statistical control, the question becomes whether its natural spread fits within the specification limits set by engineering or customer requirements.

### 1.3.1 Basic Capability: Cp

Let \( \text{USL} \) and \( \text{LSL} \) denote the upper and lower specification limits. Process capability is summarised by

\[
C_p = \frac{\text{USL} - \text{LSL}}{6\sigma}
\]

where \( \sigma \) is the process standard deviation. \( C_p \) compares the width of the specification window to the natural spread of the process (taken as \( 6\sigma \), covering ±3σ = 99.73 % of a normal distribution). A value \( C_p \geq 1 \) means the process could potentially fit within specifications; \( C_p \geq 1.33 \) is a common industry minimum; \( C_p \geq 1.67 \) is required for safety-critical applications.

**Limitation**: \( C_p \) ignores process centering. A process shifted far from the specification midpoint could have a large \( C_p \) yet produce many nonconforming units.

### 1.3.2 Centered Capability: Cpk

To account for centering, define

\[
C_{pk} = \min\!\left(\frac{\text{USL} - \mu}{3\sigma},\; \frac{\mu - \text{LSL}}{3\sigma}\right)
\]

where \( \mu \) is the process mean. \( C_{pk} \) equals \( C_p \) only when \( \mu \) is exactly centered between the specification limits. When the process is off-center, \( C_{pk} < C_p \). A process with \( C_{pk} \geq 1.33 \) is considered capable and centered.

### 1.3.3 Taguchi Capability Index: Cpm

The *Taguchi* or *third-generation* capability index penalises deviation from the target \( T \):

\[
C_{pm} = \frac{\text{USL} - \text{LSL}}{6\tau}, \qquad \tau = \sqrt{\sigma^2 + (\mu - T)^2}
\]

Here \( \tau \) is the root mean square deviation from the target, which inflates the effective spread whenever the process mean \( \mu \) deviates from \( T \). \( C_{pm} \) is particularly relevant when the target \( T \) is not the midpoint of the specification interval, or when economic losses grow quadratically with deviation from target (see Section 7.2 on the Taguchi loss function).

### 1.3.4 Process Yield and Sigma Level

The *sigma level* of a process translates a defect rate into a Z-score under the assumption of normality. If the process mean is centered and the nearest specification limit is \( k\sigma \) away, the short-term sigma level is \( k \).

The Motorola convention adds a 1.5σ long-term shift:

\[
\text{Defects per million opportunities (DPMO)} = 10^6 \times \Phi(-Z_{lt})
\]

where \( Z_{lt} = Z_{st} - 1.5 \) and \( \Phi \) is the standard normal CDF. For a 6σ process (short-term), \( Z_{lt} = 4.5 \), giving DPMO \( \approx 3.4 \).

| Short-term \(\sigma\) level | DPMO (with 1.5σ shift) | Yield (%) |
|---|---|---|
| 3 | 66,807 | 93.32 |
| 4 | 6,210 | 99.379 |
| 5 | 233 | 99.977 |
| 6 | 3.4 | 99.9997 |

## 1.4 Measurement Uncertainty

No measurement is perfect. The *observed* value \( y \) equals the *true* value \( x \) plus measurement error \( \epsilon \):

\[
y = x + \epsilon
\]

If measurement error is random with variance \( \sigma^2_{\text{meas}} \) and the true process variance is \( \sigma^2_{\text{proc}} \), then the observed variance is

\[
\sigma^2_{\text{obs}} = \sigma^2_{\text{proc}} + \sigma^2_{\text{meas}}
\]

This inflates estimates of process spread and deflates capability indices. Gauge repeatability and reproducibility (R&R) studies, covered in Chapter 5, quantify \( \sigma^2_{\text{meas}} \) and its components.

## 1.5 DMAIC Framework

**DMAIC** (Define–Measure–Analyze–Improve–Control) is the standard roadmap for process improvement projects within Six Sigma:

<div class="definition">
<strong>Define</strong>: Identify the problem, the customer CTQ characteristics, the project scope, and the improvement goal. Deliverables include a project charter and a SIPOC diagram (Suppliers, Inputs, Process, Outputs, Customers).
</div>

<div class="definition">
<strong>Measure</strong>: Quantify the current process performance. Validate the measurement system (gauge R&R). Establish a baseline capability (C<sub>pk</sub>). Identify input variables (X's) and output variables (Y's).
</div>

<div class="definition">
<strong>Analyze</strong>: Use statistical tools (hypothesis tests, regression, designed experiments) to identify root causes of variation. Distinguish vital few X's from trivial many.
</div>

<div class="definition">
<strong>Improve</strong>: Design and implement solutions that optimise the process with respect to the vital X's. Use designed experiments, response surface methods, or robust design techniques (Chapter 7).
</div>

<div class="definition">
<strong>Control</strong>: Institutionalise the improvement using control plans, control charts (Chapters 2–4), and mistake-proofing (poka-yoke). Monitor the process to detect any return to the old behaviour.
</div>

---

# Chapter 2: Shewhart Control Charts for Variables

## 2.1 Rational Subgroups

A *rational subgroup* is a sample collected in such a way that variation within the subgroup reflects only common-cause variation, while differences *between* subgroups can reveal special causes. Key principles:

- Subgroup items should be produced under homogeneous conditions (same machine, operator, material lot, short time window).
- Subgroup size \( n \) is typically 4 or 5 for \( \bar{X} \)–\( R \) charts; size \( n = 1 \) uses individuals charts.
- The subgroup frequency should be high enough to detect shifts promptly but low enough to be economically feasible.

<div class="remark">
<strong>Remark</strong>: Forming poor rational subgroups is one of the most common errors in SPC implementation. If within-subgroup variation includes special causes, the control limits will be too wide and the chart will miss real signals.
</div>

## 2.2 Derivation of 3σ Control Limits

Shewhart chose ±3 standard deviations from the centre line as the control limit criterion. For a statistic \( W \) with mean \( \mu_W \) and standard deviation \( \sigma_W \):

\[
\text{UCL} = \mu_W + 3\sigma_W, \qquad \text{LCL} = \mu_W - 3\sigma_W
\]

Under normality, the probability of a false alarm (a point outside limits when the process is in control) is

\[
\alpha = 2\Phi(-3) \approx 0.0027
\]

corresponding to about 2.7 false alarms per 1,000 subgroups. Shewhart's 3σ rule is an economic compromise — 2σ limits give too many false alarms; 4σ limits detect real shifts too slowly.

## 2.3 The X̄ and R Chart

### 2.3.1 Construction

Collect \( m \) subgroups, each of size \( n \). For subgroup \( i \), compute the sample mean \( \bar{X}_i \) and sample range \( R_i = X_{i,\max} - X_{i,\min} \).

The process mean is estimated by \( \bar{\bar{X}} = \frac{1}{m}\sum_{i=1}^m \bar{X}_i \) and the average range by \( \bar{R} = \frac{1}{m}\sum_{i=1}^m R_i \).

The process standard deviation is estimated via the unbiasing constant \( d_2 \) (tabulated by \( n \)):

\[
\hat{\sigma} = \frac{\bar{R}}{d_2}
\]

**R chart control limits**:

\[
\text{UCL}_R = D_4 \bar{R}, \qquad \text{LCL}_R = D_3 \bar{R}
\]

**\( \bar{X} \) chart control limits**:

\[
\text{UCL}_{\bar{X}} = \bar{\bar{X}} + A_2 \bar{R}, \qquad \text{LCL}_{\bar{X}} = \bar{\bar{X}} - A_2 \bar{R}
\]

where \( A_2 = 3/(d_2\sqrt{n}) \), and \( D_3 \), \( D_4 \) are tabulated constants. Always plot the R chart first: if the R chart shows out-of-control points, the \( \bar{X} \) chart limits are unreliable.

### 2.3.2 Worked Example: X̄–R Chart

**Setup**: 20 subgroups of size \( n = 5 \) from a milling operation measuring shaft diameter (mm).

| Subgroup | \(\bar{X}_i\) | \(R_i\) | Subgroup | \(\bar{X}_i\) | \(R_i\) |
|---|---|---|---|---|---|
| 1 | 20.12 | 0.31 | 11 | 20.09 | 0.28 |
| 2 | 19.98 | 0.45 | 12 | 20.17 | 0.39 |
| 3 | 20.05 | 0.22 | 13 | 20.03 | 0.33 |
| 4 | 20.21 | 0.38 | 14 | 19.97 | 0.41 |
| 5 | 20.08 | 0.29 | 15 | 20.11 | 0.26 |
| 6 | 19.95 | 0.44 | 16 | 20.06 | 0.35 |
| 7 | 20.14 | 0.31 | 17 | 20.19 | 0.48 |
| 8 | 20.02 | 0.27 | 18 | 20.00 | 0.30 |
| 9 | 20.09 | 0.36 | 19 | 20.07 | 0.22 |
| 10 | 19.93 | 0.41 | 20 | 20.10 | 0.37 |

**Computations** (using \( n=5 \): \( d_2 = 2.326 \), \( A_2 = 0.577 \), \( D_3 = 0 \), \( D_4 = 2.114 \)):

\[
\bar{\bar{X}} = \frac{\sum \bar{X}_i}{20} = 20.07, \qquad \bar{R} = \frac{\sum R_i}{20} = 0.342
\]

**R chart**:
\[
\text{UCL}_R = 2.114 \times 0.342 = 0.723, \qquad \text{LCL}_R = 0 \times 0.342 = 0
\]

**\(\bar{X}\) chart**:
\[
\text{UCL}_{\bar{X}} = 20.07 + 0.577 \times 0.342 = 20.27
\]
\[
\text{LCL}_{\bar{X}} = 20.07 - 0.577 \times 0.342 = 19.87
\]

**Process standard deviation estimate**:
\[
\hat{\sigma} = \frac{0.342}{2.326} = 0.147 \text{ mm}
\]

All 20 R values fall below 0.723 and all \( \bar{X} \) values fall between 19.87 and 20.27, so the process appears in control.

## 2.4 The X̄ and S Chart

For larger subgroup sizes (\( n \geq 10 \)) or when estimating \( \sigma \) more efficiently, the sample standard deviation \( S_i \) is preferred over the range.

\[
\text{UCL}_S = B_4 \bar{S}, \qquad \text{LCL}_S = B_3 \bar{S}
\]
\[
\text{UCL}_{\bar{X}} = \bar{\bar{X}} + A_3 \bar{S}, \qquad \text{LCL}_{\bar{X}} = \bar{\bar{X}} - A_3 \bar{S}
\]

where \( \bar{S} = \frac{1}{m}\sum S_i \) and constants \( A_3, B_3, B_4 \) depend on \( n \) (tabulated). The estimator \( \hat{\sigma} = \bar{S}/c_4 \) uses the unbiasing constant \( c_4 \).

## 2.5 Individuals and Moving Range Chart

When only one measurement per time period is available (e.g., destructive testing, slow processes), use the *individuals and moving range (I–MR)* chart.

The moving range of span 2:
\[
MR_i = |X_i - X_{i-1}|, \qquad i = 2, 3, \ldots, m
\]

\[
\bar{X} = \frac{1}{m}\sum X_i, \qquad \overline{MR} = \frac{1}{m-1}\sum_{i=2}^m MR_i
\]

\[
\text{UCL}_X = \bar{X} + 3\frac{\overline{MR}}{d_2}, \qquad d_2 = 1.128 \text{ (for span 2)}
\]
\[
\text{UCL}_{MR} = D_4 \overline{MR} = 3.267\,\overline{MR}
\]

<div class="remark">
<strong>Caution</strong>: The I–MR chart is sensitive to non-normality. If the underlying distribution is skewed, consider a transformation or a nonparametric chart before interpreting signals.
</div>

## 2.6 Interpretation Rules and Run Rules

### 2.6.1 Western Electric Rules

The Western Electric Handbook (1956) defined four zone-based tests:

1. One point beyond Zone A (outside 3σ limits).
2. Two of three consecutive points in Zone A or beyond (beyond 2σ on the same side).
3. Four of five consecutive points in Zone B or beyond (beyond 1σ on the same side).
4. Eight consecutive points on the same side of the centre line.

### 2.6.2 Nelson Rules

Nelson (1984) extended the Western Electric rules to eight tests, adding:

5. Six consecutive points steadily increasing or decreasing (trend).
6. Fifteen consecutive points within Zone C (within ±1σ — stratification, suggesting subgroups are drawn from different distributions).
7. Fourteen consecutive points alternating up and down.
8. Eight consecutive points outside Zone C with none in Zone A (mixture).

Adding more rules increases the probability of detecting certain patterns but also inflates the false alarm rate. Using all eight Nelson rules on a single chart roughly doubles the false alarm rate compared to Rule 1 alone.

## 2.7 Average Run Length

<div class="definition">
<strong>Average run length (ARL)</strong>: the expected number of subgroups plotted before an out-of-control signal is generated. For a Shewhart chart with independent subgroups:
\[
\text{ARL} = \frac{1}{p}
\]
where <em>p</em> is the probability of a signal on any one subgroup. When the process is in control, <em>p</em> = 0.0027 (for ±3σ limits), giving <strong>ARL<sub>0</sub> = 370</strong>.
</div>

For a shift of \( \delta\sigma \) in the mean:
\[
p = \Phi\!\left(-3 + \delta\sqrt{n}\right) + \Phi\!\left(-3 - \delta\sqrt{n}\right)
\]

| \(\delta\) (mean shift in \(\sigma\) units) | Subgroup size \(n=1\) ARL | \(n=5\) ARL |
|---|---|---|
| 0 (in control) | 370 | 370 |
| 0.5 | 155 | 28 |
| 1.0 | 44 | 6.3 |
| 1.5 | 15 | 2.9 |
| 2.0 | 6.3 | 2.0 |

## 2.8 Phase I vs. Phase II Control Charting

**Phase I** (retrospective analysis): use a historical dataset of \( m \geq 20 \) subgroups to estimate control limits. Identify and remove subgroups caused by known special causes; re-estimate limits until the remaining data are in control. The goal is a stable set of control limits representing the process in its "best" state.

**Phase II** (prospective monitoring): apply the Phase I limits to future production. Signals in Phase II prompt investigation of the current process.

<div class="remark">
<strong>Phase I warning</strong>: Trial control limits computed from Phase I data have sampling variability — estimated ARL<sub>0</sub> can be substantially below 370 with only <em>m</em> = 20–30 subgroups. Montgomery recommends <em>m</em> ≥ 25 subgroups of size <em>n</em> ≥ 4 for stable Phase I estimation.
</div>

---

# Chapter 3: Shewhart Control Charts for Attributes

## 3.1 Attribute vs. Variable Data

Attribute data classifies each unit as conforming or nonconforming (or counts the number of defects per unit), rather than measuring a continuous characteristic. Attribute charts are simpler to implement — classification requires less skill than precise measurement — but are generally less sensitive to small process shifts.

## 3.2 The p-Chart (Fraction Nonconforming)

Let \( D_i \) be the number of nonconforming units in a subgroup of size \( n_i \), and \( \hat{p}_i = D_i/n_i \).

Under a binomial model, \( E[\hat{p}] = p \) and \( \text{Var}[\hat{p}] = p(1-p)/n \). The centre line is \( \bar{p} = \sum D_i / \sum n_i \) (weighted average).

For constant \( n \):
\[
\text{UCL}_p = \bar{p} + 3\sqrt{\frac{\bar{p}(1-\bar{p})}{n}}, \qquad \text{LCL}_p = \bar{p} - 3\sqrt{\frac{\bar{p}(1-\bar{p})}{n}}
\]

(LCL set to 0 if negative.)

### Variable Sample Size p-Chart

When \( n_i \) varies, two approaches are used:

1. **Individual limits**: compute separate UCL\(_i\) and LCL\(_i\) for each subgroup using \( n_i \). The control limits form a stepped pattern.
2. **Average \( \bar{n} \)**: use \( \bar{n} = \sum n_i / m \) for all limits. Acceptable when \( n_i \) does not vary by more than ±25 % of \( \bar{n} \).

## 3.3 The np-Chart (Number Nonconforming)

When \( n \) is constant, it is sometimes more natural to plot \( D_i = n\hat{p}_i \) directly:

\[
\text{UCL}_{np} = n\bar{p} + 3\sqrt{n\bar{p}(1-\bar{p})}, \qquad \text{LCL}_{np} = n\bar{p} - 3\sqrt{n\bar{p}(1-\bar{p})}
\]

## 3.4 The c-Chart (Count of Defects per Unit)

When each inspection unit can have multiple defects and the Poisson model applies (defects are rare and many opportunities exist), the c-chart monitors counts \( c_i \).

\[
\bar{c} = \frac{1}{m}\sum_{i=1}^m c_i
\]
\[
\text{UCL}_c = \bar{c} + 3\sqrt{\bar{c}}, \qquad \text{LCL}_c = \bar{c} - 3\sqrt{\bar{c}}
\]

(LCL set to 0 if negative.)

## 3.5 The u-Chart (Defects per Unit, Variable Inspection Area)

When the inspection unit size varies (e.g., rolls of fabric with different lengths), define \( u_i = c_i / n_i \) where \( n_i \) is the number of inspection units in sample \( i \).

\[
\bar{u} = \frac{\sum c_i}{\sum n_i}
\]
\[
\text{UCL}_{u,i} = \bar{u} + 3\sqrt{\frac{\bar{u}}{n_i}}, \qquad \text{LCL}_{u,i} = \bar{u} - 3\sqrt{\frac{\bar{u}}{n_i}}
\]

## 3.6 Overdispersion in Attribute Charts

The binomial and Poisson models assume independent units with constant defect probability. In practice:

- Lot-to-lot variation in incoming material quality violates the constant-\( p \) assumption.
- Batch effects (all units in a subgroup share the same raw material batch) create within-subgroup correlation.

Both phenomena produce *overdispersion* — the observed variance exceeds the nominal model variance. The *negative binomial* distribution generalises the Poisson to accommodate overdispersion, with variance \( \mu + \mu^2/r \) (where \( r \) is a dispersion parameter). In overdispersed data, Poisson-based control limits will be too narrow, generating excessive false alarms.

---

# Chapter 4: CUSUM and EWMA Control Charts

## 4.1 Limitations of Shewhart Charts for Small Shifts

Shewhart charts use only the most recent subgroup; past values are ignored. This gives them fast response to large shifts (e.g., 3σ) but poor sensitivity to small, sustained shifts. For a 1σ shift with \( n=1 \), ARL ≈ 44, meaning nearly 44 subgroups must pass before a signal is expected — often unacceptably slow.

## 4.2 The CUSUM Chart

The *cumulative sum* (CUSUM) chart accumulates deviations from a target \( \mu_0 \), making it inherently sensitive to sustained drift.

### 4.2.1 Tabular CUSUM

Define the reference value \( K = k\sigma \) (typically \( k = 0.5 \) to detect a 1σ shift quickly). The one-sided statistics are:

\[
C^+_i = \max\!\left[0,\; (X_i - \mu_0 - K) + C^+_{i-1}\right]
\]
\[
C^-_i = \max\!\left[0,\; (\mu_0 - K - X_i) + C^-_{i-1}\right]
\]

starting with \( C^+_0 = C^-_0 = 0 \). A signal is generated when either statistic exceeds the decision interval \( H = h\sigma \) (typically \( h = 4 \) or \( h = 5 \)).

Standard parameterisation: \( k = 0.5 \) (detects 1σ shifts quickly), \( h = 4 \) (ARL\(_0 \approx 168\)) or \( h = 5 \) (ARL\(_0 \approx 465\)).

<div class="example">
<strong>CUSUM ARL Calculation</strong>: For the tabular CUSUM with <em>k</em> = 0.5, <em>h</em> = 5, and a process shift of <em>δ</em> = 1.0σ, the ARL is approximately <strong>10.4</strong> — compared to ARL ≈ 44 for the Shewhart chart with individual observations. This illustrates the CUSUM's superiority for detecting persistent small shifts.

The ARL for a one-sided CUSUM is obtained from the integral equation of Siegmund (1985):
\[
\text{ARL}(\delta) \approx \frac{1 - e^{-2\lambda(h+1.166)}}{\lambda + \frac{1}{2}\lambda^2}  + \frac{1}{\delta}\left(h + 1.166\right)
\]
where <em>λ</em> = 2(<em>δ</em> − <em>k</em>). In practice, ARL tables from Montgomery (2020) Table 9.2 are used directly.
</div>

### 4.2.2 V-Mask CUSUM

An equivalent graphical representation uses a V-shaped mask with lead distance \( d \) and half-angle \( \theta \). The process is signalled out of control when the V-mask placed at the current observation covers any previous plotted point. The parameters relate to the tabular CUSUM via \( d = h/(2k) \) and \( \tan\theta = k \). The tabular form is preferred in software implementations.

### 4.2.3 ARL Comparison: Shewhart vs. CUSUM

| Process shift \(\delta\) (in \(\sigma\)) | Shewhart ARL (\(n=1\)) | CUSUM ARL (\(k=0.5, h=5\)) |
|---|---|---|
| 0 (in control) | 370 | 465 |
| 0.5 | 155 | 38 |
| 1.0 | 44 | 10.4 |
| 1.5 | 15 | 5.8 |
| 2.0 | 6.3 | 4.0 |
| 3.0 | 2.0 | 2.6 |

For shifts below 1.5σ, the CUSUM substantially outperforms the Shewhart chart.

## 4.3 The EWMA Chart

The *exponentially weighted moving average* chart uses a weighted average of all past and current observations, with exponentially decreasing weights on older data:

\[
Z_i = \lambda X_i + (1-\lambda) Z_{i-1}, \qquad Z_0 = \mu_0
\]

where \( \lambda \in (0,1] \) is the smoothing parameter. Small \( \lambda \) (e.g., 0.05–0.20) detects small, sustained shifts; \( \lambda = 1 \) recovers the Shewhart chart.

**Steady-state control limits** (reached after the EWMA "forgets" the initial value):

\[
\text{UCL} = \mu_0 + L\sigma\sqrt{\frac{\lambda}{2-\lambda}}, \qquad \text{LCL} = \mu_0 - L\sigma\sqrt{\frac{\lambda}{2-\lambda}}
\]

The constant \( L \) (analogous to the 3σ factor) is chosen to achieve a target ARL\(_0\). Montgomery recommends \( \lambda = 0.1 \) with \( L = 2.703 \) for ARL\(_0 \approx 500 \), or \( \lambda = 0.2 \) with \( L = 2.962 \).

For exact (time-varying) limits during the start-up phase:

\[
\text{UCL}_i = \mu_0 + L\sigma\sqrt{\frac{\lambda}{2-\lambda}\left[1-(1-\lambda)^{2i}\right]}
\]

## 4.4 Combined CUSUM–Shewhart Scheme

The CUSUM excels at detecting small shifts but is slower than Shewhart for large shifts. A combined scheme uses both simultaneously:

- A CUSUM with \( k = 0.5, h = 5 \) for small shifts.
- A Shewhart ±3.5σ supplementary rule for large shifts.

This gives near-optimal ARL performance across the entire range of shift sizes, at the cost of slightly more complex operation.

## 4.5 Multivariate CUSUM and MEWMA

When monitoring \( p \) quality characteristics simultaneously, univariate charts on each variable do not account for correlations and inflate the overall false alarm rate. Multivariate extensions include:

- **MCUSUM**: accumulates the Mahalanobis distance of the mean vector from target.
- **MEWMA**: the multivariate EWMA, with chart statistic \( T^2_i = \mathbf{Z}_i^\top \Sigma_Z^{-1} \mathbf{Z}_i \) where \( \mathbf{Z}_i = \lambda \mathbf{X}_i + (1-\lambda)\mathbf{Z}_{i-1} \). Signal when \( T^2_i > H \).

## 4.6 Control Chart Selection Strategy

| Situation | Recommended chart |
|---|---|
| Continuous data, subgroups of 2–5 | \(\bar{X}\)–\(R\) chart |
| Continuous data, subgroups of 10+ | \(\bar{X}\)–\(S\) chart |
| Individual observations | I–MR chart |
| Small sustained shifts (\(\delta < 1.5\sigma\)) | CUSUM or EWMA |
| Large + small shifts | Combined CUSUM–Shewhart |
| Fraction nonconforming | p-chart or np-chart |
| Counts per unit | c-chart or u-chart |
| Correlated multivariate data | Hotelling \(T^2\) or MEWMA |

---

# Chapter 5: Process Capability Analysis

## 5.1 Normal Process Capability

### 5.1.1 Point Estimates and Confidence Intervals for Cp

Given \( m \) subgroups of size \( n \) with \( \hat{\sigma} = \bar{R}/d_2 \):

\[
\hat{C}_p = \frac{\text{USL} - \text{LSL}}{6\hat{\sigma}}
\]

A confidence interval for \( C_p \) exploits the relationship \( (n-1)S^2/\sigma^2 \sim \chi^2_{n-1} \). For \( N = mn \) total observations:

\[
\hat{C}_p \sqrt{\frac{\chi^2_{\alpha/2, N-1}}{N-1}} \leq C_p \leq \hat{C}_p \sqrt{\frac{\chi^2_{1-\alpha/2, N-1}}{N-1}}
\]

<div class="example">
<strong>Worked CI for C<sub>pk</sub></strong>: Suppose 25 subgroups of size 4 give <em>Ĉ<sub>pk</sub></em> = 1.40 and <em>N</em> = 100 total observations. An approximate 95 % confidence interval for <em>C<sub>pk</sub></em> uses:
\[
\hat{C}_{pk} \pm 1.96\sqrt{\frac{1}{9N\hat{C}_{pk}^2} + \frac{1}{2(N-1)}}
\]
\[
= 1.40 \pm 1.96\sqrt{\frac{1}{9(100)(1.40)^2} + \frac{1}{2(99)}}
\]
\[
= 1.40 \pm 1.96\sqrt{0.000570 + 0.00505}
\]
\[
= 1.40 \pm 1.96 \times 0.0746 = 1.40 \pm 0.146
\]
The 95 % CI is approximately (1.25, 1.55). Because the lower bound exceeds 1.33, we have statistical evidence that the process is capable.
</div>

### 5.1.2 Cpm Confidence Interval

The Cpm index involves a non-central chi-squared distribution. An asymptotic CI is:

\[
\hat{C}_{pm} \pm z_{\alpha/2} \cdot \frac{\hat{C}_{pm}}{\sqrt{2N}}\sqrt{1 + 2\left(\frac{\mu - T}{\sigma}\right)^2}
\]

## 5.2 Non-Normal Process Capability

Many quality characteristics — flatness, cycle time, particle counts — are non-normal. Applying normal-based formulas to non-normal data leads to incorrect capability estimates.

### 5.2.1 Johnson Transformation

Johnson (1949) proposed a family of transformations mapping an arbitrary distribution to normality:

- **S\(_U\) system**: \( Z = \gamma + \delta \sinh^{-1}\!\left(\frac{X - \xi}{\lambda}\right) \) (unbounded range)
- **S\(_B\) system**: \( Z = \gamma + \delta \ln\!\left(\frac{X-\xi}{\xi+\lambda-X}\right) \) (bounded range)
- **S\(_L\) system**: \( Z = \gamma + \delta \ln(X - \xi) \) (lognormal, semi-bounded)

After transforming the data to normality, standard \( C_p \) and \( C_{pk} \) formulas apply to the transformed variable, with specification limits transformed accordingly.

### 5.2.2 Clements Method (Percentile-Based)

Clements (1989) proposed a distribution-free approach using Pearson curves:

\[
C_p^* = \frac{\text{USL} - \text{LSL}}{U_{0.99865} - L_{0.00135}}, \qquad C_{pk}^* = \min\!\left(\frac{\text{USL} - M}{U_{0.99865} - M},\; \frac{M - \text{LSL}}{M - L_{0.00135}}\right)
\]

where \( M \) is the sample median, and \( U_{0.99865}, L_{0.00135} \) are the 99.865th and 0.135th sample percentiles. These replace the ±3σ spread with the actual tails of the empirical distribution.

### 5.2.3 Nonparametric Capability Indices

A purely nonparametric index replaces the specification coverage directly:

\[
C_{np} = \frac{\text{USL} - \text{LSL}}{\hat{q}_{0.9986} - \hat{q}_{0.0014}}
\]

where \( \hat{q}_p \) is the \( p \)-th sample quantile. No distributional assumption is required, but sample sizes of at least 300–500 are needed for stable extreme quantile estimates.

## 5.3 Gauge Repeatability and Reproducibility (Gauge R&R)

Measurement system variation inflates the observed process variance and deflates capability indices. A gauge R&R study decomposes total measurement variability into its sources.

### 5.3.1 Crossed Gauge R&R ANOVA Model

With \( p \) parts, \( o \) operators, and \( r \) replications, the model is:

\[
Y_{ijk} = \mu + P_i + O_j + (PO)_{ij} + E_{ijk}
\]

where \( P_i \sim \mathcal{N}(0, \sigma^2_P) \), \( O_j \sim \mathcal{N}(0, \sigma^2_O) \), \( (PO)_{ij} \sim \mathcal{N}(0, \sigma^2_{PO}) \), and \( E_{ijk} \sim \mathcal{N}(0, \sigma^2_E) \).

The total observed variance is:

\[
\sigma^2_{\text{total}} = \sigma^2_P + \sigma^2_O + \sigma^2_{PO} + \sigma^2_E
\]

The *gauge R&R* variance is:

\[
\sigma^2_{R\&R} = \sigma^2_{\text{repeatability}} + \sigma^2_{\text{reproducibility}}
\]
\[
\sigma^2_{\text{repeatability}} = \sigma^2_E, \qquad \sigma^2_{\text{reproducibility}} = \sigma^2_O + \sigma^2_{PO}
\]

### 5.3.2 Percent Gauge R&R and Number of Distinct Categories

<div class="definition">
<strong>%GR&amp;R</strong>: the fraction of total process variation attributable to measurement system error:
\[
\%GR\&R = 100 \times \frac{\hat{\sigma}_{R\&R}}{\hat{\sigma}_{\text{total}}}
\]
AIAG guidelines: %GR&amp;R &lt; 10 % is excellent; 10–30 % is marginal (decision depends on application importance and cost); &gt;30 % is unacceptable — the measurement system must be improved before using it for capability analysis.
</div>

<div class="definition">
<strong>Number of distinct categories (ndc)</strong>: the number of non-overlapping confidence intervals that span the product variation:
\[
\text{ndc} = \left\lfloor 1.41 \frac{\hat{\sigma}_P}{\hat{\sigma}_{R\&R}} \right\rfloor
\]
AIAG requires ndc ≥ 5 for the measurement system to be usable for process control.
</div>

### 5.3.3 Impact of Measurement Error on Capability Indices

If the true process standard deviation is \( \sigma_P \) and gauge R&R contributes \( \sigma_G \):

\[
\hat{C}_p^{\text{observed}} = \frac{\text{USL} - \text{LSL}}{6\sqrt{\sigma^2_P + \sigma^2_G}} < C_p^{\text{true}}
\]

To recover the true capability: \( \hat{C}_p^{\text{true}} = \hat{C}_p^{\text{observed}} / \sqrt{1 - (\%GR\&R/100)^2} \).

---

# Chapter 6: Acceptance Sampling

## 6.1 Fundamentals and the OC Curve

Acceptance sampling decides whether to accept or reject a lot of incoming (or outgoing) material based on a sample. It is not a substitute for process control but is used when 100 % inspection is impractical or destructive.

<div class="definition">
<strong>Operating characteristic (OC) curve</strong>: the function <em>P</em><sub>a</sub>(<em>p</em>) giving the probability of accepting a lot as a function of the true lot fraction defective <em>p</em>. An ideal OC curve would be a step function: <em>P</em><sub>a</sub> = 1 for <em>p</em> ≤ AQL and 0 for <em>p</em> > AQL. In practice, the OC curve is an S-shaped monotone decreasing function.
</div>

### 6.1.1 Key Points on the OC Curve

<div class="definition">
<strong>AQL (Acceptable Quality Level)</strong>: the maximum fraction defective at which the producer is willing to accept a 95 % (or higher) probability of lot acceptance. Lots at the AQL have a high probability of being accepted — this protects the producer. Formally, Pa(AQL) ≈ 1 − α where α is the producer's risk (typically 0.05).
</div>

<div class="definition">
<strong>LTPD / RQL (Lot Tolerance Percent Defective / Rejectable Quality Level)</strong>: the fraction defective at which the consumer is willing to accept no more than a 10 % probability of acceptance. Pa(LTPD) ≈ β (consumer's risk, typically 0.10).
</div>

## 6.2 Single Sampling Plans

A single sampling plan is characterised by two numbers: sample size \( n \) and acceptance number \( c \). Inspect \( n \) units; accept the lot if the number of defectives \( D \leq c \); otherwise reject.

### 6.2.1 OC Curve via Binomial and Poisson

Under exact binomial sampling:
\[
P_a(p) = P(D \leq c \mid n, p) = \sum_{d=0}^{c}\binom{n}{d}p^d(1-p)^{n-d}
\]

For large \( n \) and small \( p \) (\( np \leq 5 \)), the Poisson approximation \( D \sim \text{Poisson}(np) \) gives:
\[
P_a(p) \approx e^{-np}\sum_{d=0}^{c}\frac{(np)^d}{d!}
\]

<div class="example">
<strong>Single Sampling OC Curve</strong>: Consider plan <em>n</em> = 50, <em>c</em> = 2.

Using the Poisson approximation, compute P<sub>a</sub>(<em>p</em>) at selected values:

| <em>p</em> | <em>np</em> = 50<em>p</em> | P<sub>a</sub>(<em>p</em>) |
|---|---|---|
| 0.01 | 0.5 | 0.986 |
| 0.02 | 1.0 | 0.920 |
| 0.04 | 2.0 | 0.677 |
| 0.06 | 3.0 | 0.423 |
| 0.08 | 4.0 | 0.238 |
| 0.10 | 5.0 | 0.125 |
| 0.15 | 7.5 | 0.020 |

The AQL (P<sub>a</sub> ≈ 0.95) is approximately <em>p</em> = 1.5 %; the LTPD (P<sub>a</sub> ≈ 0.10) is approximately <em>p</em> = 9.5 %.
</div>

### 6.2.2 Designing a Single Sampling Plan

Given AQL = \( p_1 \) with producer's risk \( \alpha \), and LTPD = \( p_2 \) with consumer's risk \( \beta \):

The ratio \( p_2/p_1 \) determines the discriminating power of the plan. Tables in Montgomery (2020) Chapter 14 or the Dodge–Romig tables give \( (n, c) \) pairs achieving the required \( (\alpha, \beta) \) constraints.

Approximate formulas using the Poisson:
- Solve \( c_1 = np_1 \) (99.865th quantile of Poisson) and \( c_2 = np_2 \) (0.135th quantile) simultaneously.

## 6.3 Double and Sequential Sampling Plans

**Double sampling**: take an initial sample of \( n_1 \). Accept immediately if \( D_1 \leq c_1 \); reject immediately if \( D_1 > c_2 \); take a second sample \( n_2 \) if \( c_1 < D_1 \leq c_2 \). Accept if \( D_1 + D_2 \leq c_3 \), reject otherwise. Double sampling can reduce average sample number (ASN) compared to single sampling at the AQL.

**Sequential sampling**: units are inspected one at a time, and the cumulative count \( D \) is plotted against \( n \). Three regions are delineated by two parallel lines on the \( (n, D) \) plane: accept region, reject region, and continue region. This minimises ASN but complicates administration.

## 6.4 ANSI/ASQ Z1.4 and Z1.9 Standards

**ANSI/ASQ Z1.4** (formerly MIL-STD-105E): attribute sampling plans. The user specifies the AQL and lot size; the standard provides the sample size code letter and the corresponding \( (n, c) \) plan for normal, tightened, or reduced inspection levels.

**ANSI/ASQ Z1.9** (formerly MIL-STD-414): variables sampling plans. When the quality characteristic is normally distributed, variables sampling achieves the same AQL protection as attribute sampling with a smaller sample size.

## 6.5 Rectifying Inspection and AOQL

In *rectifying inspection*, rejected lots are 100 % inspected and all defectives replaced with conforming units. The average outgoing quality (AOQ) after rectifying inspection is:

\[
\text{AOQ}(p) = \frac{p \cdot P_a(p) \cdot (N - n)}{N}
\]

where \( N \) is the lot size. The *average outgoing quality limit* (AOQL) is the maximum of AOQ\((p)\) over all \( p \):

\[
\text{AOQL} = \max_p \text{AOQ}(p)
\]

The AOQL is a guarantee: regardless of the incoming quality, the long-run outgoing quality will never exceed AOQL. Dodge–Romig tables list \( (n, c) \) plans indexed by AOQL and lot size.

---

# Chapter 7: Design of Experiments for Quality Improvement

## 7.1 Taguchi Philosophy of Robust Design

Genichi Taguchi reframed quality improvement around the concept of *robustness* — designing products and processes that perform consistently well despite uncontrollable variation in environmental conditions (noise factors).

<div class="definition">
<strong>Parameter design</strong>: selecting the nominal values of controllable factors (design parameters) so that the product response is both on-target and insensitive to variation in noise factors. Parameter design is Taguchi's primary tool — it achieves quality without eliminating the noise sources themselves.
</div>

<div class="definition">
<strong>Tolerance design</strong>: tightening tolerances on components that remain dominant after parameter design has been optimised. Tolerance design is more expensive (requires higher-grade materials and tighter manufacturing) and is reserved for residual variation that cannot be addressed through parameter design.
</div>

## 7.2 The Taguchi Loss Function

Taguchi proposed that any deviation from the target value \( T \) results in a quality loss, even if the product remains within specifications. For a nominal-the-best characteristic:

\[
L(y) = k(y - T)^2
\]

where \( k \) is a constant calibrated so that \( L = A_0 \) (the cost of a customer complaint or warranty claim) when \( y = T \pm \Delta_0 \) (the consumer tolerance):

\[
k = \frac{A_0}{\Delta_0^2}
\]

The expected loss for a process with mean \( \mu \) and standard deviation \( \sigma \) is:

\[
E[L] = k\!\left[\sigma^2 + (\mu - T)^2\right] = k\tau^2
\]

This directly motivates minimising \( \tau^2 = \sigma^2 + (\mu - T)^2 \), the quantity appearing in the denominator of \( C_{pm} \). A process with low variability and centred on target has minimum expected loss.

## 7.3 Signal-to-Noise Ratios

Taguchi defined signal-to-noise (S/N) ratios to simultaneously pursue small variance and correct mean in a single objective. Three cases:

**Nominal-is-best (NB)**: response should equal a target value.
\[
\eta_{NB} = 10\log_{10}\!\left(\frac{\bar{y}^2}{s^2}\right) \qquad [\text{dB}]
\]

**Smaller-is-better (SB)**: response should be as small as possible (e.g., shrinkage, defect rate).
\[
\eta_{SB} = -10\log_{10}\!\left(\frac{1}{n}\sum_{i=1}^n y_i^2\right) \qquad [\text{dB}]
\]

**Larger-is-better (LB)**: response should be as large as possible (e.g., strength, yield).
\[
\eta_{LB} = -10\log_{10}\!\left(\frac{1}{n}\sum_{i=1}^n \frac{1}{y_i^2}\right) \qquad [\text{dB}]
\]

In all cases, the goal is to **maximise** the S/N ratio. A 3 dB increase in S/N corresponds to halving the variance.

## 7.4 Inner and Outer Arrays

Taguchi's crossed-array design separates controllable factors from noise factors:

- **Inner array**: design matrix for the control factors. A standard orthogonal array (OA) such as \( L_8(2^7) \) or \( L_9(3^4) \).
- **Outer array**: design matrix for the noise factors, run at each inner array row.
- **Combined experiment**: each row of the inner array is replicated across all columns of the outer array.

The S/N ratio is computed across the outer array replicates for each inner array run, then analysed using main-effects plots to identify control factor settings that maximise S/N.

## 7.5 Worked Example: S/N Ratio Analysis for a 2³ Inner Array

**Process**: injection moulding of a plastic component. Nominal-is-best: target shrinkage = 0.50 mm.

**Control factors** (inner array, \( L_8 = 2^3 \) full factorial):

| Factor | Low (−) | High (+) |
|---|---|---|
| A: Melt temperature | 200°C | 230°C |
| B: Injection speed | 50 mm/s | 80 mm/s |
| C: Packing pressure | 40 MPa | 60 MPa |

**Noise factor**: Material moisture content (Low, High). Each inner-array run is conducted at both noise levels (outer array of 2).

| Run | A | B | C | \(y_1\) (noise −) | \(y_2\) (noise +) | \(\bar{y}\) | \(s\) | \(\eta_{NB}\) (dB) |
|---|---|---|---|---|---|---|---|---|
| 1 | − | − | − | 0.42 | 0.58 | 0.500 | 0.113 | 12.9 |
| 2 | + | − | − | 0.39 | 0.53 | 0.460 | 0.099 | 13.3 |
| 3 | − | + | − | 0.55 | 0.65 | 0.600 | 0.071 | 18.5 |
| 4 | + | + | − | 0.48 | 0.60 | 0.540 | 0.085 | 16.1 |
| 5 | − | − | + | 0.46 | 0.54 | 0.500 | 0.057 | 18.9 |
| 6 | + | − | + | 0.43 | 0.55 | 0.490 | 0.085 | 15.2 |
| 7 | − | + | + | 0.51 | 0.61 | 0.560 | 0.071 | 17.9 |
| 8 | + | + | + | 0.49 | 0.57 | 0.530 | 0.057 | 19.4 |

**S/N computation for Run 5** (nominal-is-best):
\[
\eta = 10\log_{10}\!\left(\frac{0.500^2}{0.057^2}\right) = 10\log_{10}(76.9) = 18.9 \text{ dB}
\]

**Main effects on S/N** (average S/N at each level):

| Factor | Low level avg (dB) | High level avg (dB) | Effect (High − Low) |
|---|---|---|---|
| A | 17.1 | 16.0 | −1.1 |
| B | 15.1 | 18.0 | +2.9 |
| C | 15.2 | 17.9 | +2.7 |

**Optimal settings**: B at high (+), C at high (+), A at low (−) → Run 7 conditions maximise S/N. However, the mean \( \bar{y} = 0.56 \) at Run 7 deviates from target 0.50; a two-step optimisation (first maximise S/N, then adjust mean via a *scaling factor* with minimal effect on S/N) would use factor A to bring the mean to target.

## 7.6 Comparison with Classical RSM Approach

Classical *response surface methodology* (RSM) differs from the Taguchi approach in several key respects:

| Aspect | Taguchi | Classical RSM |
|---|---|---|
| Noise treatment | Explicit outer array | Blocked or combined with error |
| Objective | Maximise S/N ratio | Fit response surface model, then optimise |
| Model fitting | No (main effects only) | Yes (full model with interactions) |
| Interaction handling | Implicit confounding | Explicit estimation |
| Number of runs | Inner × outer array (can be large) | Central composite or Box-Behnken |
| Criticism | Ignores control×noise interactions | Requires distributional assumptions |

Myers, Montgomery & Anderson-Cook (2016) show that classical RSM with a combined array (noise factors included in the RSM design) is more efficient and captures control-by-noise interactions that the Taguchi approach misses. Modern practice often uses *dual-response surface optimisation*, fitting separate models for the mean and variance of the response as functions of the control factors.

## 7.7 Screening Designs for Quality

Before RSM optimisation, screening designs identify the *vital few* factors (Pareto principle) among many potential candidates.

**Two-level fractional factorial designs** reduce the full \( 2^k \) run count:

- \( 2^{k-1} \) half-fraction: resolution IV (two-factor interactions confounded with each other, not with main effects).
- \( 2^{k-2} \) quarter-fraction: resolution IV designs available for \( k \leq 7 \); resolution III for larger \( k \).

**Plackett–Burman designs**: \( N = 12, 20, 24, \ldots \) run designs that accommodate \( N-1 \) factors in \( N \) runs. These are resolution III (main effects partially confounded with two-factor interactions) and are used solely for screening.

## 7.8 DMAIC Case Study: A 2^(4-1) Quality Improvement Example

### Background

A chemical etching process for printed circuit boards is producing excessive etch-rate variability. The CTQ characteristic is etch rate (μm/min), with target 25 μm/min (nominal-is-best). The DMAIC team identifies four potentially influential factors:

| Factor | Levels |
|---|---|
| A: Temperature | 40°C / 50°C |
| B: Acid concentration | 30 % / 40 % |
| C: Agitation rate | 50 rpm / 100 rpm |
| D: Immersion time | 5 min / 8 min |

**Measure phase**: baseline Cpk = 0.72. Gauge R&R = 8.1 % (acceptable). The measurement system is adequate.

**Analyze phase**: a \( 2^{4-1} \) fractional factorial (8 runs, resolution IV, generator \( D = ABC \)) is used for screening. The defining relation is \( I = ABCD \), so each main effect is aliased with a three-factor interaction (negligible), and two-factor interactions are aliased in pairs: \( AB \equiv CD \), \( AC \equiv BD \), \( AD \equiv BC \).

| Run | A | B | C | D=ABC | Etch rate |
|---|---|---|---|---|---|
| 1 | − | − | − | − | 22.3 |
| 2 | + | − | − | + | 27.1 |
| 3 | − | + | − | + | 24.8 |
| 4 | + | + | − | − | 29.4 |
| 5 | − | − | + | + | 23.1 |
| 6 | + | − | + | − | 26.0 |
| 7 | − | + | + | − | 25.5 |
| 8 | + | + | + | + | 31.2 |

Estimated main effects:

\[
\hat{A} = \frac{(27.1+29.4+26.0+31.2)-(22.3+24.8+23.1+25.5)}{4} = \frac{113.7-95.7}{4} = 4.50
\]

Similarly: \( \hat{B} = 2.90 \), \( \hat{C} = 0.65 \), \( \hat{D} = 1.40 \). Normal probability plot of effects identifies A and B as the dominant factors (largest absolute effects, deviating from the normal line). Factors C and D appear negligible.

**Improve phase**: A full \( 2^2 \) factorial in A and B (with C and D at their current levels) plus centre points confirms the significant A×B interaction (aliased with CD in the half-fraction). Optimum: A = 40°C (low), B = 40 % (high) — brings mean etch rate to 24.9 μm/min with minimised variability.

**Control phase**: an \( \bar{X} \)–S chart on etch rate is established with subgroup size \( n = 4 \), one subgroup per batch. At the improved settings, the process standard deviation drops from 1.85 to 0.94 μm/min. Revised Cpk = 1.48, exceeding the target of 1.33. Control chart parameters:

\[
\hat{\sigma} = 0.94, \quad \bar{X} = 24.9, \quad n = 4
\]
\[
\text{UCL}_{\bar{X}} = 24.9 + 1.628 \times \hat{S} \approx 24.9 + 1.53 = 26.4
\]
\[
\text{LCL}_{\bar{X}} = 24.9 - 1.53 = 23.4
\]

The process improvement project reduced DPMO from approximately 25,000 to under 600, moving the process from a 3.5σ to a 4.7σ level.

---

## Appendix: Control Chart Constants

| \(n\) | \(d_2\) | \(d_3\) | \(A_2\) | \(D_3\) | \(D_4\) | \(c_4\) | \(B_3\) | \(B_4\) | \(A_3\) |
|---|---|---|---|---|---|---|---|---|---|
| 2 | 1.128 | 0.853 | 1.880 | 0 | 3.267 | 0.7979 | 0 | 3.267 | 2.659 |
| 3 | 1.693 | 0.888 | 1.023 | 0 | 2.575 | 0.8862 | 0 | 2.568 | 1.954 |
| 4 | 2.059 | 0.880 | 0.729 | 0 | 2.282 | 0.9213 | 0 | 2.266 | 1.628 |
| 5 | 2.326 | 0.864 | 0.577 | 0 | 2.114 | 0.9400 | 0 | 2.089 | 1.427 |
| 6 | 2.534 | 0.848 | 0.483 | 0 | 2.004 | 0.9515 | 0.030 | 1.970 | 1.287 |
| 7 | 2.704 | 0.833 | 0.419 | 0.076 | 1.924 | 0.9594 | 0.118 | 1.882 | 1.182 |
| 8 | 2.847 | 0.820 | 0.373 | 0.136 | 1.864 | 0.9650 | 0.185 | 1.815 | 1.099 |
| 9 | 2.970 | 0.808 | 0.337 | 0.184 | 1.816 | 0.9693 | 0.239 | 1.761 | 1.032 |
| 10 | 3.078 | 0.797 | 0.308 | 0.223 | 1.777 | 0.9727 | 0.284 | 1.716 | 0.975 |

---

## Appendix: Glossary of Key Terms

<div class="definition">
<strong>AQL (Acceptable Quality Level)</strong>: the maximum fraction defective at which a producer is willing to have lots accepted with high probability (typically 95 %).
</div>

<div class="definition">
<strong>ARL (Average Run Length)</strong>: the expected number of samples before a control chart signals. ARL<sub>0</sub> refers to the in-control ARL; ARL<sub>1</sub> refers to the out-of-control ARL after a shift.
</div>

<div class="definition">
<strong>Assignable cause</strong>: a specific, identifiable source of variation that can be found and eliminated. Synonymous with Shewhart's <em>special cause</em>.
</div>

<div class="definition">
<strong>Common cause variation</strong>: random variation inherent to a stable process; cannot be reduced without fundamentally changing the process.
</div>

<div class="definition">
<strong>C<sub>p</sub></strong>: process capability index measuring the ratio of the specification spread to the natural process spread (6σ). Does not account for process centering.
</div>

<div class="definition">
<strong>C<sub>pk</sub></strong>: process capability index accounting for both process spread and centering relative to specification limits.
</div>

<div class="definition">
<strong>C<sub>pm</sub></strong>: Taguchi capability index that penalises deviation of the process mean from the engineering target, beyond mere specification compliance.
</div>

<div class="definition">
<strong>CUSUM</strong>: cumulative sum control chart; accumulates deviations from a target to detect small sustained shifts efficiently.
</div>

<div class="definition">
<strong>DMAIC</strong>: Define–Measure–Analyze–Improve–Control; the Six Sigma project roadmap for process improvement.
</div>

<div class="definition">
<strong>EWMA</strong>: exponentially weighted moving average control chart; uses a weighted average of current and historical observations, sensitive to small process shifts.
</div>

<div class="definition">
<strong>Gauge R&amp;R</strong>: a study decomposing measurement system variation into repeatability (within-operator) and reproducibility (between-operator) components.
</div>

<div class="definition">
<strong>LTPD (Lot Tolerance Percent Defective)</strong>: the fraction defective at which a consumer insists that lots be rejected with high probability (90 %).
</div>

<div class="definition">
<strong>OC curve (Operating Characteristic curve)</strong>: the function relating the probability of lot acceptance to the true lot fraction defective for an acceptance sampling plan.
</div>

<div class="definition">
<strong>Rational subgroup</strong>: a sample collected under homogeneous conditions such that within-subgroup variation reflects only common causes; differences between subgroups can reveal special causes.
</div>

<div class="definition">
<strong>S/N ratio (Signal-to-Noise ratio)</strong>: a Taguchi metric combining mean and variance into a single quantity (in dB) to be maximised during robust parameter design.
</div>

<div class="definition">
<strong>Special cause variation</strong>: variation due to an identifiable, intermittent source not part of the stable process; detected by control charts and eliminated through investigation.
</div>
