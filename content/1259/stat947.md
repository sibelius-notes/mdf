---
title: "STAT 947: Meta-Analysis Theory & Practice"
prof: "Zelalem Negeri; Audrey Béliveau"
subjects: "STAT"
---

## Sources and References
**Primary texts** — Michael Borenstein, Larry Hedges, Julian Higgins, and Hannah Rothstein, *Introduction to Meta-Analysis* (Wiley, 2009); Mathias Harrer, Pim Cuijpers, Toshi Furukawa, and David Ebert, *Doing Meta-Analysis with R: A Hands-On Guide* (2022); Sofia Dias, A.E. Ades, Nicky Welton, Jeroen Jansen, and Alexander Sutton, *Network Meta-Analysis for Decision-Making* (Wiley, 2018).
**Supplementary** — Hedges and Olkin, *Statistical Methods for Meta-Analysis* (1985); Cochrane Handbook for Systematic Reviews of Diagnostic Test Accuracy.
**Online resources** — Harrer et al. bookdown site; Cochrane Training resources for systematic reviews.

---

# Chapter 1: Introduction to Meta-Analysis and Systematic Reviews

## 1.1 From Narrative to Quantitative Synthesis

The accumulation of empirical research on any given question inevitably produces a body of studies whose results are not perfectly uniform. Individual studies differ in their populations, interventions, outcome measurements, follow-up durations, and quality of execution. The traditional response to this heterogeneity has been the **narrative review**, in which an expert examines the available literature and synthesizes conclusions through expert judgment. Narrative reviews suffer from well-documented limitations: they are susceptible to selection bias, they cannot quantitatively reconcile conflicting results, and they provide no mechanism for assessing the statistical stability of any synthesis conclusion.

**Systematic reviews** were developed as a structured alternative. A systematic review follows a pre-specified protocol to identify, select, critically appraise, and synthesize all available evidence bearing on a precisely formulated research question. When the collected studies report outcomes on a common quantitative scale, or when effects can be converted to a common scale through appropriate transformations, the systematic review can be extended to a **meta-analysis**: a statistical procedure that pools numerical estimates of effect across studies to produce a single summary estimate together with a measure of its precision.

<div class="definition">
<strong>Definition 1.1 (Meta-Analysis).</strong> Let \( k \) primary studies be identified through a systematic search. Study \( i \) reports an effect size estimate \( \hat{\theta}_i \) with associated within-study variance \( \hat{v}_i \), for \( i = 1, \ldots, k \). A <em>meta-analysis</em> is a weighted combination of the \( \hat{\theta}_i \) designed to estimate a target parameter \( \theta \) — the <em>meta-analytic estimand</em> — which may be a common true effect (under fixed-effect assumptions) or the mean of a distribution of true effects (under random-effects assumptions).
</div>

The meta-analytic estimand \( \theta \) must be interpreted carefully. In a fixed-effect model, \( \theta \) is interpreted as the single common true effect that every included study is estimating. In a random-effects model, \( \theta \) is the mean of a superpopulation of true study effects, and the summary estimate speaks to what one expects on average across the range of settings represented by the included studies.

## 1.2 The PICO Framework and Eligibility Criteria

A systematic review begins with a clinical or scientific question articulated in sufficient precision to support the construction of eligibility criteria. The **PICO** framework organizes this specification along four dimensions: **P**opulation (the patient group or study subjects), **I**ntervention (the treatment, exposure, or diagnostic test of interest), **C**omparison (the reference group or comparator), and **O**utcome (the endpoint to be measured). Every eligible study must address the same PICO elements, ensuring that the studies entering the meta-analysis are genuinely measuring the same underlying quantity.

From the PICO specification, the review team constructs inclusion and exclusion criteria governing study design (e.g., only randomized controlled trials, only prospective cohorts), minimum sample sizes, language restrictions, publication date ranges, and outcome reporting requirements. These criteria are documented prospectively in a protocol, ideally registered with PROSPERO or a similar registry, to prevent post-hoc modification that could introduce reporting bias at the review level.

## 1.3 The PRISMA Flow Diagram

The flow of records through a systematic review is documented using the **PRISMA** (Preferred Reporting Items for Systematic Reviews and Meta-Analyses) flow diagram. Records are identified through database searches and supplementary sources, deduplicated, screened by title and abstract, assessed in full text for eligibility, and finally included in the synthesis. At each stage, records excluded are counted and reasons given. The PRISMA flow diagram makes transparent the total evidence base considered and the attrition at each stage, enabling readers to assess potential for selection bias at the review level.

## 1.4 Sources of Between-Study Heterogeneity

Even studies satisfying identical inclusion criteria will not estimate exactly the same true effect. **Between-study heterogeneity** arises from several conceptually distinct sources.

**Clinical heterogeneity** refers to genuine differences in the populations studied (age, disease severity, comorbidities), in how the intervention was implemented (dose, duration, co-interventions), or in how outcomes were measured and timed. Two trials of the same drug at different doses may have different true effects because the dose-response relationship is non-linear.

**Methodological heterogeneity** refers to systematic differences in study design that introduce different levels or types of bias. A meta-analysis mixing randomized and non-randomized studies, or open-label and double-blind trials, may exhibit heterogeneity attributable to design differences rather than to true variation in the intervention effect.

**Statistical heterogeneity** is the observed variation in study effect estimates beyond what would be expected from within-study sampling error alone. It is the component that meta-analytic methods attempt to quantify, and it has both clinical-methodological causes and a pure sampling-variability component.

## 1.5 The Two-Level Hierarchical Model

The random-effects meta-analytic framework is most naturally motivated by a hierarchical model operating at two levels. At the **within-study level**, each study produces an estimate \( \hat{\theta}_i \) that is an unbiased estimator of its own true study-specific effect \( \theta_i \), with known sampling variance \( v_i \):

\[
\hat{\theta}_i \mid \theta_i \sim \mathcal{N}(\theta_i, v_i).
\]

At the **between-study level**, the true study effects are themselves treated as draws from a distribution indexed by the population mean \( \mu \) and between-study variance \( \tau^2 \):

\[
\theta_i \sim \mathcal{N}(\mu, \tau^2).
\]

The marginal distribution of the observed estimate is then

\[
\hat{\theta}_i \sim \mathcal{N}(\mu, \, v_i + \tau^2).
\]

The meta-analytic objective is to estimate \( \mu \) and \( \tau^2 \) from the data \( \{(\hat{\theta}_i, v_i)\}_{i=1}^k \). When \( \tau^2 = 0 \), all studies share a common true effect and the model reduces to the fixed-effect model.

---

# Chapter 2: Effect Sizes and Their Precision

## 2.1 The Role of Effect Sizes

A primary study may report its results as raw means, proportions, counts, hazard ratios, or a variety of other summaries. Before studies can be pooled, their results must be expressed on a common **effect size** scale. An effect size is a dimensionless (or standardized) statistic that measures the magnitude of a relationship or difference. Precision is the reciprocal of the variance of the effect size estimator, denoted \( w_i = 1 / v_i \).

## 2.2 Continuous Outcomes: Standardized Mean Difference

Consider a study comparing a treatment group (sample size \( n_T \), mean \( \bar{X}_T \), standard deviation \( s_T \)) against a control group (\( n_C \), \( \bar{X}_C \), \( s_C \)). The raw mean difference \( \bar{X}_T - \bar{X}_C \) is measured in the original units and therefore not comparable across studies using different instruments.

**Cohen's \( d \)** standardizes the mean difference by the pooled within-group standard deviation. Define the pooled standard deviation

\[
s_p = \sqrt{ \frac{(n_T - 1)s_T^2 + (n_C - 1)s_C^2}{n_T + n_C - 2} },
\]

and then

\[
d = \frac{\bar{X}_T - \bar{X}_C}{s_p}.
\]

Cohen's \( d \) is biased upward in small samples. **Hedges' \( g \)** corrects for this bias via a multiplicative factor \( J(\nu) \) that depends on the degrees of freedom \( \nu = n_T + n_C - 2 \):

\[
g = J(\nu) \cdot d, \qquad J(\nu) = 1 - \frac{3}{4\nu - 1}.
\]

<div class="theorem">
<strong>Theorem 2.1 (Variance of Hedges' g).</strong> Under the assumption of normality and equal population variances, the large-sample variance of Hedges' <em>g</em> is

\[
\operatorname{Var}(g) \approx \frac{n_T + n_C}{n_T n_C} + \frac{g^2}{2(n_T + n_C)}.
\]

<em>Derivation.</em> The variance of Cohen's <em>d</em> is obtained by the delta method applied to \( d = (\bar{X}_T - \bar{X}_C)/s_p \). The first term \( (n_T + n_C)/(n_T n_C) \) arises from the variance of the mean difference \( \bar{X}_T - \bar{X}_C \), which equals \( \sigma^2(1/n_T + 1/n_C) \), divided by \( \sigma^2 \). The second term \( g^2 / [2(n_T + n_C)] \) arises from the sampling variability of \( s_p^2 \), since \( (n_T + n_C - 2)s_p^2 / \sigma^2 \sim \chi^2_{n_T + n_C - 2} \) and hence \( \operatorname{Var}(s_p^2) = 2\sigma^4/(n_T + n_C - 2) \). Applying the delta method and multiplying through by \( J(\nu)^2 \approx 1 \) gives the stated expression.
</div>

## 2.3 Binary Outcomes: Risk Difference, Relative Risk, and Odds Ratio

For binary outcomes, study \( i \) reports a \( 2 \times 2 \) table with cell counts \( a_i, b_i, c_i, d_i \) (events and non-events in treatment and control groups). The three principal effect size measures are:

**Risk difference (RD):**

\[
\widehat{RD}_i = \hat{p}_{Ti} - \hat{p}_{Ci} = \frac{a_i}{n_{Ti}} - \frac{c_i}{n_{Ci}}.
\]

The variance is estimated by

\[
\hat{v}_{RD,i} = \frac{\hat{p}_{Ti}(1-\hat{p}_{Ti})}{n_{Ti}} + \frac{\hat{p}_{Ci}(1-\hat{p}_{Ci})}{n_{Ci}}.
\]

**Relative risk (RR):**

\[
\widehat{RR}_i = \frac{a_i / n_{Ti}}{c_i / n_{Ci}}.
\]

Because the sampling distribution of \( \widehat{RR} \) is skewed, analysis is conducted on the log scale. The log relative risk \( \widehat{lRR}_i = \log \widehat{RR}_i \) has approximate variance

\[
\hat{v}_{lRR,i} = \frac{1}{a_i} - \frac{1}{n_{Ti}} + \frac{1}{c_i} - \frac{1}{n_{Ci}}.
\]

**Odds ratio (OR):**

\[
\widehat{OR}_i = \frac{a_i d_i}{b_i c_i}.
\]

The **Woolf log-transformation** stabilizes the sampling distribution and yields the log odds ratio \( \widehat{lOR}_i = \log \widehat{OR}_i \) with approximate variance

\[
\hat{v}_{lOR,i} = \frac{1}{a_i} + \frac{1}{b_i} + \frac{1}{c_i} + \frac{1}{d_i}.
\]

<div class="remark">
<strong>Remark 2.2.</strong> The log-transformation is essential for all ratio measures. It converts a strictly positive, right-skewed distribution into one that is approximately symmetric and normally distributed, validating the use of normal-theory inference. Meta-analysis is conducted on the log scale and results are back-transformed for reporting. The variance on the log scale is computed by the delta method: if \( \hat{\theta} = \log \hat{R} \), then \( \operatorname{Var}(\hat{\theta}) \approx \operatorname{Var}(\hat{R}) / R^2 \).
</div>

## 2.4 Survival Outcomes: Log Hazard Ratio

In survival analysis, studies commonly report a hazard ratio \( \hat{HR}_i \) with confidence interval \( [L_i, U_i] \). The log hazard ratio \( \hat{\delta}_i = \log \hat{HR}_i \) is approximately normally distributed, and its standard error can be recovered from the reported confidence interval as

\[
\hat{s}_i = \frac{\log U_i - \log L_i}{2 z_{\alpha/2}},
\]

where \( z_{\alpha/2} \) is the appropriate normal quantile. When only an overall \( p \)-value is reported alongside the log HR, the variance can be approximated using the observed number of events \( d_i \) and the allocation ratio, exploiting the relation that the efficient score statistic for the log hazard ratio under the Cox model has variance approximately equal to \( d_i / 4 \) under balanced allocation.

## 2.5 Precision and the Inverse-Variance Weight

The **precision** of estimate \( \hat{\theta}_i \) is defined as

\[
w_i = \frac{1}{v_i},
\]

where \( v_i = \hat{s}_i^2 \) is the estimated within-study variance. Precision quantifies how much information study \( i \) contributes to the pooled estimate: studies with larger sample sizes, more events, or reduced outcome variability contribute more precision and therefore receive higher weight in any sensible pooling procedure. This is the central justification for the inverse-variance weighting scheme developed in the next chapter.

---

# Chapter 3: Aggregate Data Meta-Analysis of Interventions

## 3.1 The Fixed-Effect Model

In the fixed-effect model, all \( k \) studies are assumed to estimate a common true effect \( \theta \), so that

\[
\hat{\theta}_i \mid \theta \sim \mathcal{N}(\theta, v_i), \quad i = 1, \ldots, k.
\]

The log-likelihood is

\[
\ell(\theta) = -\frac{1}{2} \sum_{i=1}^k \frac{(\hat{\theta}_i - \theta)^2}{v_i} + \text{const},
\]

and maximizing yields the **inverse-variance weighted estimator**:

\[
\hat{\theta}_{FE} = \frac{\sum_{i=1}^k w_i \hat{\theta}_i}{\sum_{i=1}^k w_i}, \qquad w_i = \frac{1}{v_i}.
\]

<div class="theorem">
<strong>Theorem 3.1 (Optimality of Inverse-Variance Weighting).</strong> Among all unbiased linear estimators of the form \( \tilde{\theta} = \sum_{i=1}^k c_i \hat{\theta}_i \) with \( \sum_{i=1}^k c_i = 1 \), the inverse-variance weighted estimator \( \hat{\theta}_{FE} \) minimizes \( \operatorname{Var}(\tilde{\theta}) \).

<em>Proof.</em> We minimize \( \operatorname{Var}(\tilde{\theta}) = \sum_{i=1}^k c_i^2 v_i \) subject to \( \sum_i c_i = 1 \). Using a Lagrange multiplier \( \lambda \), the stationarity conditions are \( 2 c_i v_i = \lambda \) for each \( i \), giving \( c_i \propto 1/v_i \). Normalizing by the constraint \( \sum c_i = 1 \) yields \( c_i = w_i / \sum_j w_j \), which is precisely the inverse-variance weight. The minimum variance is \( \operatorname{Var}(\hat{\theta}_{FE}) = 1 / \sum_i w_i \).
</div>

## 3.2 The DerSimonian–Laird Random-Effects Model

When studies are drawn from heterogeneous settings, the fixed-effect model is inappropriate. The **DerSimonian–Laird (DL)** estimator extends the inverse-variance framework to accommodate between-study variability.

The marginal model is \( \hat{\theta}_i \sim \mathcal{N}(\mu, \, v_i + \tau^2) \), where \( \tau^2 \geq 0 \) is the unknown between-study variance. **Cochran's Q statistic** is the weighted sum of squared deviations from the fixed-effect estimate:

\[
Q = \sum_{i=1}^k w_i (\hat{\theta}_i - \hat{\theta}_{FE})^2.
\]

Under the null \( \tau^2 = 0 \), \( Q \sim \chi^2_{k-1} \) approximately. DerSimonian and Laird proposed a method-of-moments estimator for \( \tau^2 \) obtained by equating \( Q \) to its expected value under the random-effects model:

\[
E\left[Q\right] = (k - 1) + \tau^2 \left(\sum_i w_i - \frac{\sum_i w_i^2}{\sum_i w_i}\right).
\]

Defining \( c = \sum_i w_i - (\sum_i w_i^2)/(\sum_i w_i) \), the DL estimator is

\[
\hat{\tau}^2_{DL} = \max\!\left(0, \, \frac{Q - (k-1)}{c}\right).
\]

The random-effects summary estimate replaces each \( w_i \) by \( w_i^* = 1/(v_i + \hat{\tau}^2_{DL}) \):

\[
\hat{\mu}_{RE} = \frac{\sum_{i=1}^k w_i^* \hat{\theta}_i}{\sum_{i=1}^k w_i^*}, \qquad \operatorname{Var}(\hat{\mu}_{RE}) = \frac{1}{\sum_{i=1}^k w_i^*}.
\]

<div class="remark">
<strong>Remark 3.2.</strong> The DL estimator for \( \tau^2 \) is consistent but can be substantially biased in small samples and tends to underestimate \( \tau^2 \) when \( k \) is small. The REML estimator (obtained by profiling out the fixed effect before maximizing the likelihood) is generally preferred for estimation of \( \tau^2 \), while the Paule-Mandel estimator provides an alternative method-of-moments approach with better small-sample properties.
</div>

## 3.3 Hartung–Knapp–Sidik–Jonkman Correction

A persistent problem with standard random-effects meta-analysis is that the Wald-type confidence interval for \( \mu \) uses a standard normal reference distribution, which undercovers in small samples. The **Hartung–Knapp–Sidik–Jonkman (HKSJ)** correction replaces the standard normal quantile with a \( t \) quantile on \( k - 1 \) degrees of freedom and employs a modified variance estimator:

\[
\hat{q} = \frac{1}{k-1} \sum_{i=1}^k w_i^* (\hat{\theta}_i - \hat{\mu}_{RE})^2,
\]

so that the HKSJ confidence interval is

\[
\hat{\mu}_{RE} \pm t_{k-1, 1-\alpha/2} \sqrt{\frac{\hat{q}}{\sum_i w_i^*}}.
\]

This correction has been shown in simulation studies to maintain nominal coverage more reliably than the standard Wald interval, particularly when \( k \) is small (fewer than 20 studies) and \( \tau^2 \) is large.

## 3.4 Rare Events: Peto and Mantel–Haenszel Methods

Standard inverse-variance meta-analysis based on the log odds ratio breaks down when cell counts are zero, because the Woolf variance estimator \( \hat{v}_{lOR,i} = 1/a_i + 1/b_i + 1/c_i + 1/d_i \) is undefined. Two alternatives are well established.

The **Mantel–Haenszel (MH) estimator** of the combined odds ratio is

\[
\widehat{OR}_{MH} = \frac{\sum_i a_i d_i / n_i}{\sum_i b_i c_i / n_i},
\]

where \( n_i = n_{Ti} + n_{Ci} \). The MH estimator is defined even when some studies have a zero in one margin, and it has excellent efficiency properties when event rates are low and sample sizes are large.

**Rücker's arcsine transformation** works directly with proportions. Define \( p_i = a_i/n_{Ti} \) and transform to

\[
\phi_i = \arcsin\!\sqrt{p_i},
\]

for which the variance \( \operatorname{Var}(\phi_i) \approx 1/(4n_{Ti}) \) is free of the proportion \( p_i \). This stabilization allows standard inverse-variance meta-analysis to proceed even when proportions approach zero or one.

## 3.5 Heterogeneity Statistics

<div class="definition">
<strong>Definition 3.3 (Cochran's Q and the \( I^2 \) Statistic).</strong> Cochran's Q is defined as in Section 3.2. The <em>I-squared statistic</em> is

\[
I^2 = \max\!\left(0, \frac{Q - (k-1)}{Q}\right) \times 100\%,
\]

and represents the percentage of total variability in the effect size estimates attributable to between-study heterogeneity rather than within-study sampling error.
</div>

Higgins and colleagues proposed heuristic benchmarks: \( I^2 \) values of approximately 25%, 50%, and 75% indicate low, moderate, and high heterogeneity, respectively. However, these thresholds depend critically on the number of studies and the within-study precision; \( I^2 \) should not be interpreted as an absolute measure of heterogeneity but rather as a proportion. The complementary statistic \( H^2 = Q / (k-1) \) (the ratio of observed to expected Q) is sometimes preferred because it has a natural scale: \( H^2 = 1 \) corresponds to no between-study heterogeneity.

The absolute measure of between-study heterogeneity is \( \hat{\tau}^2 \) itself, and its square root \( \hat{\tau} \) is directly interpretable on the effect size scale: it quantifies the standard deviation of the distribution of true effects across the population of studies.

---

# Chapter 4: Meta-Analysis of Diagnostic Test Accuracy

## 4.1 Sensitivity and Specificity as Effect Sizes

A diagnostic test applied to a population of diseased and non-diseased individuals produces a \( 2 \times 2 \) classification table. The two fundamental accuracy measures are **sensitivity** (Se: the probability that the test is positive given disease) and **specificity** (Sp: the probability that the test is negative given no disease). Each study reports estimates \( \hat{Se}_i \) and \( \hat{Sp}_i \), and the meta-analytic objective is to synthesize these jointly.

The complication is that sensitivity and specificity are not independent across studies: studies using a stricter positivity threshold achieve higher specificity at the cost of lower sensitivity, and vice versa. Any model that treats sensitivity and specificity independently ignores this threshold-induced negative correlation and will produce misleading results.

## 4.2 The Bivariate Normal Model

The standard approach transforms sensitivity and specificity to the logit scale, which maps the \( (0,1) \) interval to the real line and stabilizes variance:

\[
Y_{1i} = \text{logit}\,\hat{Se}_i = \log \frac{\hat{Se}_i}{1 - \hat{Se}_i}, \quad Y_{2i} = \text{logit}\,\hat{Sp}_i = \log \frac{\hat{Sp}_i}{1 - \hat{Sp}_i}.
\]

Within-study variances are approximated by the delta method:

\[
\hat{v}_{1i} = \frac{1}{n_{Di} \hat{Se}_i (1 - \hat{Se}_i)}, \quad \hat{v}_{2i} = \frac{1}{n_{\bar{D}i} \hat{Sp}_i (1 - \hat{Sp}_i)},
\]

where \( n_{Di} \) and \( n_{\bar{D}i} \) are the numbers of diseased and non-diseased subjects in study \( i \).

<div class="definition">
<strong>Definition 4.1 (Bivariate Random-Effects Model).</strong> The Reitsma et al. bivariate random-effects model assumes

\[
\begin{pmatrix} Y_{1i} \\ Y_{2i} \end{pmatrix} \mid \begin{pmatrix} \mu_{1i} \\ \mu_{2i} \end{pmatrix} \sim \mathcal{N}_2\!\left(\begin{pmatrix} \mu_{1i} \\ \mu_{2i} \end{pmatrix}, \begin{pmatrix} \hat{v}_{1i} & 0 \\ 0 & \hat{v}_{2i} \end{pmatrix}\right)
\]

at the within-study level, and

\[
\begin{pmatrix} \mu_{1i} \\ \mu_{2i} \end{pmatrix} \sim \mathcal{N}_2\!\left(\begin{pmatrix} \mu_1 \\ \mu_2 \end{pmatrix}, \boldsymbol{\Sigma}\right), \quad \boldsymbol{\Sigma} = \begin{pmatrix} \tau_1^2 & \rho \tau_1 \tau_2 \\ \rho \tau_1 \tau_2 & \tau_2^2 \end{pmatrix}
\]

at the between-study level. The parameters \( \mu_1, \mu_2 \) are the mean logit sensitivity and logit specificity across studies, \( \tau_1^2, \tau_2^2 \) are the between-study variances, and \( \rho \) is the between-study correlation capturing threshold effects.
</div>

The model is estimated by maximum likelihood or restricted maximum likelihood. The marginal covariance of the bivariate observations is \( \boldsymbol{\Sigma} + \operatorname{diag}(\hat{v}_{1i}, \hat{v}_{2i}) \), which varies across studies. Parameters are estimated jointly, enabling valid inference about the mean sensitivity and specificity while accounting for their correlation.

## 4.3 The SROC Curve

The **Summary Receiver Operating Characteristic (SROC)** curve is the locus of expected (logit Se, logit Sp) pairs as the threshold parameter varies, generated from the fitted bivariate model. In the original Moses–Littenberg approach, the SROC was derived by regressing the log diagnostic odds ratio on the logit of the proportion of test-positive results; Rutter and Gatsonis provided a more principled hierarchical model. In the Reitsma bivariate framework, the SROC is traced by varying a scalar threshold parameter \( \lambda \) that generates pairs

\[
(\mu_1 + \lambda \rho \tau_1 / \tau_2, \; \mu_2 - \lambda \rho \tau_2 / \tau_1)
\]

on the logit scale, which map back to a curve in the (Se, 1-Sp) plane.

The **area under the SROC curve (AUC)** summarizes overall diagnostic accuracy in a single scalar. For the bivariate model, the AUC can be approximated numerically by integrating the estimated SROC curve over the \( [0,1] \) interval on the false-positive rate axis. AUC near 1 indicates excellent discriminatory ability; AUC near 0.5 corresponds to a non-informative test.

## 4.4 Sources of Heterogeneity in Diagnostic Accuracy

Between-study heterogeneity in diagnostic accuracy arises from **threshold effects** (different studies apply different cut-off values), **spectrum effects** (variation in the severity distribution of disease in the study population), **incorporation bias** (when the index test forms part of the reference standard), and **partial verification bias** (when only test-positive subjects receive the reference standard). Meta-regression extensions of the bivariate model allow covariates — such as study design, geographic region, or patient selection criteria — to be included to explain observed heterogeneity.

---

# Chapter 5: Publication Bias and Small-Study Effects

## 5.1 The Funnel Plot and Its Rationale

**Publication bias** is the systematic tendency for studies with statistically significant or large effects to be published at higher rates than studies with null or small effects. If the included studies in a meta-analysis are a non-random sample of all studies conducted, the pooled estimate will be biased. The **funnel plot**, introduced by Light and Pillemer (1984) and formalized by Egger and colleagues, is the principal visual tool for detecting this bias.

In a funnel plot, each study is represented as a point with the effect size estimate \( \hat{\theta}_i \) on the horizontal axis and a measure of study precision (commonly \( 1/\hat{s}_i \) or \( 1/v_i \), or equivalently the standard error \( \hat{s}_i \) on an inverted scale) on the vertical axis. In the absence of bias, the plot should resemble an inverted funnel: large, precise studies cluster tightly near the top, while small, imprecise studies are dispersed at the bottom, symmetrically about the pooled estimate. Asymmetry — typically a missing region in the lower left corner — suggests that small studies with small or null effects are absent, consistent with publication bias or small-study effects.

## 5.2 Egger's Regression Test

**Egger's test** formalizes the visual inspection of funnel plot asymmetry as a regression test. Define \( z_i = \hat{\theta}_i / \hat{s}_i \) (the standardized effect, equivalent to the study's \( z \)-statistic) and \( x_i = 1 / \hat{s}_i \) (the precision).

<div class="theorem">
<strong>Theorem 5.1 (Egger's Regression).</strong> Consider the weighted linear regression

\[
z_i = \alpha + \beta x_i + \epsilon_i,
\]

where \( \epsilon_i \sim \mathcal{N}(0, \sigma^2) \) and weights are set to 1 (ordinary least squares). Equivalently,

\[
\frac{\hat{\theta}_i}{\hat{s}_i} = \alpha + \beta \cdot \frac{1}{\hat{s}_i},
\]

so that \( \beta \) estimates the true effect size \( \theta \) and \( \alpha \) (the intercept) measures funnel plot asymmetry. Under publication bias or small-study effects, small studies (small \( x_i \)) have inflated \( z_i \), yielding a non-zero intercept. The test of \( H_0: \alpha = 0 \) provides a formal test of funnel plot asymmetry, with test statistic following a \( t \)-distribution on \( k - 2 \) degrees of freedom.
</div>

Egger's test has low power when \( k \) is small and suffers from inflated type I error when effect sizes and study sizes are correlated for methodological rather than bias-related reasons (e.g., smaller studies use more intensive interventions). These limitations motivate alternatives.

## 5.3 Peters' Test

**Peters' test** addresses a limitation of Egger's test: when the outcome is binary and the log odds ratio is used as the effect size, Egger's regression conflates the true effect with the standard error because both depend on the sample size. Peters et al. proposed regressing the effect size estimate on \( 1/n_i \) (the reciprocal of total sample size) with weights \( n_{Ti} n_{Ci} / n_i^2 \):

\[
\hat{\theta}_i = \alpha + \beta (1/n_i) + \epsilon_i.
\]

The test of \( H_0: \alpha = 0 \) is interpreted analogously to Egger's test. Peters' test has been shown to maintain better type I error control than Egger's test for binary outcomes, particularly for the log odds ratio.

## 5.4 Contour-Enhanced Funnel Plot

The **contour-enhanced funnel plot** superimposes contour lines corresponding to conventional significance thresholds (\( p = 0.10 \), \( p = 0.05 \), \( p = 0.01 \)) on the funnel plot. This allows the analyst to distinguish between two interpretations of funnel plot asymmetry: if missing studies fall outside the regions of statistical significance, this suggests they would have been publishable and their absence is consistent with true publication bias; if missing studies fall within non-significant regions, the asymmetry may reflect genuine heterogeneity or chance rather than selective reporting.

## 5.5 Trim-and-Fill

The **trim-and-fill** method of Duval and Tweedie provides a non-parametric procedure for estimating the number of missing studies and adjusting the pooled estimate accordingly. The algorithm iteratively trims the most extreme studies on the "overrepresented" side of the funnel, re-estimates the center, and repeats until convergence. The number of trimmed studies \( L_0 \) is then estimated, and \( L_0 \) mirror-image studies are imputed on the opposite side. The adjusted pooled estimate is computed from the augmented dataset.

<div class="remark">
<strong>Remark 5.2.</strong> The trim-and-fill method rests on strong assumptions — specifically, that the cause of funnel plot asymmetry is the absence of small negative studies — and can produce misleading adjusted estimates when asymmetry has other causes (genuine small-study effects, between-study heterogeneity, methodological quality differences). It should be used as a sensitivity analysis, not a primary analysis.
</div>

## 5.6 Selection Models and p-Uniform

**Copas selection models** provide a parametric framework for publication bias. The selection process is modeled explicitly: study \( i \) is selected for publication with probability

\[
P(\text{selected}_i) = \Phi(a + b / \hat{s}_i),
\]

where \( \Phi \) is the standard normal CDF and \( a, b \) are selection parameters. This induces a truncated likelihood, from which the selection-corrected pooled estimate is obtained. The Copas model provides a range of sensitivity analyses by varying the severity of the selection process.

The **p-uniform** and **p-curve** methods exploit the conditional distribution of \( p \)-values given that they fall below a threshold. Under the null of no true effect, the \( p \)-values are uniform on \( (0, 1) \); under a true effect, they are right-skewed toward zero. By fitting the observed distribution of \( p \)-values, these methods estimate the true effect and detect evidence of \( p \)-hacking (an excess of \( p \)-values just below 0.05).

---

# Chapter 6: Network Meta-Analysis — Fundamentals

## 6.1 Geometry of Evidence Networks

Standard pairwise meta-analysis synthesizes studies comparing the same two treatments. **Network meta-analysis (NMA)** extends this to settings where multiple treatments have been compared in a connected network of randomized studies, allowing simultaneous estimation of all pairwise treatment contrasts including those never directly compared in a trial. The evidence network is represented as a graph \( \mathcal{G} = (\mathcal{V}, \mathcal{E}) \) where nodes \( \mathcal{V} = \{1, \ldots, T\} \) are treatments and edges \( \mathcal{E} \) correspond to treatment comparisons addressed by at least one study.

A comparison \( (b, c) \) is said to have **direct evidence** if at least one study directly randomizes participants to treatments \( b \) and \( c \). **Indirect evidence** about \( (b, c) \) is available through any path in the network connecting \( b \) and \( c \) via other treatments. The **consistency assumption** (also called coherence) posits that direct and indirect evidence about each comparison are estimating the same underlying treatment contrast.

## 6.2 The Bucher Method for Indirect Comparison

The simplest indirect comparison arises in a three-treatment network with treatments A, B, and C, where direct evidence is available for A vs. B and A vs. C but not for B vs. C.

<div class="theorem">
<strong>Theorem 6.1 (Bucher Indirect Estimate).</strong> Let \( \hat{d}_{AB} \) and \( \hat{d}_{AC} \) denote the pooled direct estimates of the log effect of B vs. A and C vs. A, respectively, with variances \( \hat{v}_{AB} \) and \( \hat{v}_{AC} \). The indirect estimate of the B vs. C contrast is

\[
\hat{d}_{BC}^{\text{ind}} = \hat{d}_{AC} - \hat{d}_{AB},
\]

with variance

\[
\hat{v}_{BC}^{\text{ind}} = \hat{v}_{AB} + \hat{v}_{AC}.
\]

<em>Derivation.</em> By transitivity, the true contrast satisfies \( d_{BC} = d_{AC} - d_{AB} \). Assuming independence of the two direct meta-analyses (i.e., no shared studies), the variance of the difference is the sum of the variances. The indirect estimate is therefore unbiased for \( d_{BC} \) under the consistency assumption.
</div>

When both direct and indirect evidence are available for a comparison, they can be combined using the inverse-variance weighted formula:

\[
\hat{d}_{BC}^{\text{NMA}} = \frac{\hat{d}_{BC}^{\text{dir}} / \hat{v}_{BC}^{\text{dir}} + \hat{d}_{BC}^{\text{ind}} / \hat{v}_{BC}^{\text{ind}}}{1/\hat{v}_{BC}^{\text{dir}} + 1/\hat{v}_{BC}^{\text{ind}}}.
\]

The discrepancy between direct and indirect estimates, \( \hat{\omega}_{BC} = \hat{d}_{BC}^{\text{dir}} - \hat{d}_{BC}^{\text{ind}} \), is the **inconsistency factor** for comparison BC, with variance \( \hat{v}_{BC}^{\text{dir}} + \hat{v}_{BC}^{\text{ind}} \). A significant \( z \)-test on \( \hat{\omega}_{BC} \) indicates violation of the consistency assumption.

## 6.3 The Consistency Assumption

The consistency assumption is the fundamental identifying assumption of NMA. It states that the treatment effect of B vs. C estimated through any path in the network equals the same underlying quantity \( d_{BC} \). More formally, for any cycle in the network, the sum of directional log-contrasts around the cycle equals zero.

<div class="definition">
<strong>Definition 6.2 (Loop Inconsistency).</strong> For a cycle involving treatments \( t_1, t_2, \ldots, t_m, t_1 \), the <em>inconsistency factor</em> is

\[
\omega = d_{t_1 t_2} + d_{t_2 t_3} + \cdots + d_{t_m t_1}.
\]

Under consistency, \( \omega = 0 \). Testing \( H_0: \omega = 0 \) for each loop in the network provides a cycle-by-cycle assessment of consistency.
</div>

The consistency assumption is more plausible when the evidence is generated by a network of studies with comparable populations, outcome measurement, and follow-up, and when the study designs across different comparisons are similar.

## 6.4 Arm-Level and Contrast-Level Data

NMA models can be formulated using two data representations. **Contrast-level data** expresses each study as one or more log-contrast estimates (e.g., log hazard ratios), analogous to standard pairwise meta-analysis. **Arm-level data** retains the raw outcome data from each treatment arm (e.g., mean and standard deviation for continuous outcomes, or counts for binary outcomes). Arm-level models are more general but require careful handling of the within-study correlation induced by multi-arm trials, which share a common control arm.

---

# Chapter 7: Frequentist Network Meta-Analysis

## 7.1 The Graph-Theoretic Framework

The structure of the evidence network is encoded in an **incidence matrix** \( \mathbf{B} \) of dimension \( |\mathcal{E}| \times T \). For each study comparison (row), the entry is \( +1 \) for the treatment in the numerator, \( -1 \) for the reference, and \( 0 \) otherwise. The columns correspond to treatments, with one column removed to impose identifiability (the reference treatment). This matrix characterizes the mapping from the \( T - 1 \) basic parameters to the full set of estimable contrasts.

The **design matrix** \( \mathbf{X} \) of the NMA regression is constructed from \( \mathbf{B} \): each row represents a study-comparison datum, and columns encode the treatment contrasts relative to a common reference treatment. The NMA model is then a weighted regression problem.

## 7.2 The Arm-Level Mixed-Treatment Comparisons Model

The frequentist arm-level NMA model for continuous outcomes is formulated as follows. Let study \( i \) compare treatments from the set \( \mathcal{A}_i \subseteq \mathcal{V} \). For arm \( j \in \mathcal{A}_i \), let \( \bar{y}_{ij} \) denote the observed mean outcome with within-arm standard error \( s_{ij} \). Define treatment \( b_i \) as the baseline (reference) arm in study \( i \). The model for each non-baseline arm is:

\[
\bar{y}_{ij} - \bar{y}_{i b_i} = d_{b_i, t_{ij}} + \delta_{i, b_i t_{ij}} + \epsilon_{ij},
\]

where \( d_{b, t} \) is the fixed population mean treatment contrast between \( t \) and \( b \), \( \delta_{i, b_i t_{ij}} \sim \mathcal{N}(0, \tau^2) \) is the study-specific random deviation under a common heterogeneity assumption, and \( \epsilon_{ij} \sim \mathcal{N}(0, \sigma_{ij}^2) \) is the within-study error with known variance.

<div class="remark">
<strong>Remark 7.1.</strong> The consistency assumption is imposed by parameterizing all treatment contrasts as differences of basic parameters: \( d_{bt} = d_{1t} - d_{1b} \) where treatment 1 is the global reference. This means only \( T - 1 \) basic parameters \( d_{12}, d_{13}, \ldots, d_{1T} \) are estimated, and all other contrasts are derived by transitivity.
</div>

The parameters are estimated by REML to account for the estimation of \( \tau^2 \). The REML objective function for the between-study variance in NMA is analogous to that in standard meta-analysis but applied to the multivariate residuals of the contrast-level model.

## 7.3 Treatment Hierarchy: P-Scores

After fitting the NMA model, the central applied question is: which treatment is best? **P-scores** (Rücker and Schwarzer, 2015) formalize treatment ranking in the frequentist framework.

<div class="definition">
<strong>Definition 7.2 (P-Score).</strong> For treatment \( t \), the P-score is

\[
P\text{-score}(t) = \frac{1}{T-1} \sum_{u \neq t} \Phi\!\left(\frac{\hat{d}_{tu}}{\sqrt{\widehat{\operatorname{Var}}(\hat{d}_{tu})}}\right),
\]

where \( \Phi \) is the standard normal CDF, \( \hat{d}_{tu} \) is the NMA estimate of the \( t \) vs. \( u \) contrast (positive favoring \( t \)), and the sum is over all other treatments \( u \). The P-score ranges from 0 to 1, with higher values indicating treatments more likely to be better than all comparators simultaneously.
</div>

P-scores aggregate the one-sided \( p \)-values for each pairwise comparison into a single summary ranking measure. They are the frequentist analog of the Bayesian SUCRA (Surface Under the Cumulative Ranking curve) and produce numerically similar rankings.

## 7.4 League Tables and Net Heat Plots

A **league table** presents all \( T(T-1)/2 \) pairwise NMA estimates in a symmetric matrix format. Entry \( (t, u) \) above the diagonal gives \( \hat{d}_{tu} \) (with confidence interval), while the entry below the diagonal gives the reciprocal. Direct comparisons are sometimes distinguished by formatting from indirect or mixed estimates. League tables are the primary tool for communicating NMA results to clinicians and health technology assessment bodies.

The **net heat plot** (Krahn et al., 2013) provides a visual diagnostic for inconsistency. It displays, for each comparison, the net contribution of each direct evidence source to the NMA estimate and highlights which direct contrasts contribute most heavily to any estimated inconsistency. Comparisons contributing disproportionately to inconsistency warrant further investigation for clinical or methodological reasons.

## 7.5 Design-by-Treatment Interaction Model

A more systematic approach to inconsistency is the **design-by-treatment interaction model**. A "design" is a specific set of treatments randomized within a study. The interaction between design and treatment contrast tests whether the treatment effect varies across designs — a signal of inconsistency.

The model adds an interaction term \( \gamma_{de} \) for design \( d \) and comparison \( e \):

\[
\hat{d}_{ij}^{(s)} = d_{ij} + \gamma_{ij}^{(s)} + \epsilon_{ij}^{(s)},
\]

where the superscript \( s \) indexes the study design. Under consistency, all \( \gamma_{ij}^{(s)} = 0 \). A global Wald test of this restriction provides an overall \( Q \)-test for inconsistency, decomposable into within-design and between-design components.

---

# Chapter 8: Bayesian Network Meta-Analysis

## 8.1 The Hierarchical Bayesian Model

The Bayesian formulation of NMA places prior distributions on all unknown parameters, enabling full probabilistic inference about treatment contrasts, rankings, and model parameters simultaneously. The model structure mirrors the frequentist arm-level model but is embedded in a Bayesian hierarchy.

<div class="definition">
<strong>Definition 8.1 (Bayesian NMA Hierarchy).</strong> At the likelihood level, observed contrast estimates \( \hat{d}_{ij}^{(s)} \) are modeled as

\[
\hat{d}_{ij}^{(s)} \mid \delta_{ij}^{(s)} \sim \mathcal{N}(\delta_{ij}^{(s)}, \hat{v}_{ij}^{(s)}).
\]

At the between-study level, study-specific effects are modeled as

\[
\delta_{ij}^{(s)} \mid d_{ij}, \tau \sim \mathcal{N}(d_{ij}, \tau^2),
\]

where \( d_{ij} = d_{1j} - d_{1i} \) (the basic parameters under consistency). At the prior level:

\[
d_{1t} \sim \mathcal{N}(0, \sigma_d^2) \text{ for } t = 2, \ldots, T,
\]
\[
\tau \sim \text{Half-Normal}(0, \sigma_\tau^2) \quad \text{or} \quad \tau \sim \text{Uniform}(0, A).
\]
</div>

The choice of prior for \( \tau \) is consequential. Turner et al. (2012) derived empirical prior distributions for \( \tau \) in different clinical domains from a large database of meta-analyses; these informative priors can substantially affect posterior estimates when the number of studies is small.

## 8.2 MCMC via Gibbs Sampling

Posterior inference in the Bayesian NMA model is intractable analytically due to the non-conjugate prior-likelihood combinations that arise in practice. **Markov Chain Monte Carlo (MCMC)** methods, and specifically Gibbs sampling, are the standard computational approach.

In Gibbs sampling, parameters are updated iteratively by drawing from their full conditional distributions. For the Gaussian NMA model with conjugate normal priors on the basic parameters \( d_{1t} \), the full conditional distributions are normal and closed-form. The full conditional for each study-specific random effect \( \delta_{ij}^{(s)} \) is also normal, centered at a precision-weighted average of the likelihood information and the between-study prior. The full conditional for \( \tau^2 \) (under a half-normal prior) requires a Metropolis-Hastings step because it is not of standard form.

Convergence is assessed using the **Gelman–Rubin diagnostic** \( \hat{R} \), which compares within-chain to between-chain variance across multiple parallel chains. Values of \( \hat{R} < 1.01 \) indicate acceptable convergence.

## 8.3 Prior Specification

The choice of prior distributions is a scientifically substantive decision in Bayesian NMA. For the treatment effect parameters \( d_{1t} \), a weakly informative normal prior \( d_{1t} \sim \mathcal{N}(0, 100^2) \) on the log scale is commonly used, placing essentially no constraint on the magnitude of treatment differences. For the heterogeneity parameter \( \tau \), the uniform prior \( \tau \sim \text{Uniform}(0, A) \) for some large \( A \) has been widely used following Spiegelhalter et al., but has been criticized for implying an improper distribution as \( A \to \infty \) and for placing excessive mass on large heterogeneity values. The half-normal prior \( \tau \sim \text{Half-Normal}(0, \sigma^2) \) is generally preferred as it is proper, concentrates mass near zero (consistent with the prior belief that heterogeneity is typically moderate), and can be calibrated using empirical evidence from similar clinical domains.

## 8.4 Ranking Treatments: SUCRA

The **Surface Under the Cumulative Ranking (SUCRA)** curve is the Bayesian analog of the P-score. From the posterior samples, for each treatment \( t \), compute the posterior probability that it is ranked \( r \)-th best:

\[
p_{tr} = P(\text{rank}(t) = r \mid \text{data}), \quad r = 1, \ldots, T.
\]

The cumulative ranking probability is \( P_{tr} = \sum_{j=1}^r p_{tj} \). The SUCRA for treatment \( t \) is the area under the cumulative ranking curve:

\[
\text{SUCRA}(t) = \frac{1}{T-1} \sum_{r=1}^{T-1} P_{tr}.
\]

SUCRA ranges from 0 (treatment always ranked worst) to 1 (treatment always ranked best). It aggregates the entire posterior distribution over rankings into a single summary, making it a convenient communication tool, though care must be taken not to overinterpret small SUCRA differences.

## 8.5 Bayesian Model Comparison: DIC

The **Deviance Information Criterion (DIC)** is the primary model comparison tool in Bayesian NMA. It penalizes model fit (measured by posterior mean deviance \( \bar{D} \)) by model complexity (measured by the effective number of parameters \( p_D = \bar{D} - D(\bar{\theta}) \)):

\[
\text{DIC} = \bar{D} + p_D = D(\bar{\theta}) + 2 p_D.
\]

Lower DIC indicates better model fit. DIC is used to compare the NMA consistency model against an inconsistency model (which relaxes the consistency constraint and allows direct and indirect estimates to differ). A difference in DIC greater than 5 is conventionally regarded as meaningful. DIC can also be used to compare random-effects NMA models with different prior specifications for \( \tau \).

## 8.6 R Implementation

The `gemtc` package implements Bayesian NMA in R using JAGS or OpenBUGS as the MCMC engine. The `bnma` package provides an alternative implementation with built-in prior elicitation tools and visualization. The core workflow involves specifying the data in long format (one row per study-arm), defining the network via the treatment comparison structure, fitting the model with `mtc.model()` and `mtc.run()`, and summarizing results with `summary()`, `gemtc::forest()`, and ranking functions.

A typical SUCRA computation in `gemtc` proceeds by extracting the posterior treatment effect samples with `as.mcmc.list()`, computing ranks using the `rank()` function across MCMC iterations, and aggregating to obtain \( p_{tr} \) and SUCRA.

---

# Chapter 9: Advanced Topics in Network Meta-Analysis

## 9.1 Component Network Meta-Analysis

Many clinical interventions are **complex interventions** comprising multiple components that can be combined in different ways. For example, a psychological treatment for depression might combine cognitive restructuring, behavioural activation, mindfulness, and homework. Different trials may have evaluated different subsets of these components. **Component NMA** extends the standard NMA model by decomposing treatment effects into additive contributions from individual components.

<div class="definition">
<strong>Definition 9.1 (Additive Component NMA).</strong> Let each treatment \( t \) be characterised by a binary indicator vector \( \mathbf{x}_t = (x_{t1}, \ldots, x_{tC})^\top \) where \( x_{tc} = 1 \) if treatment \( t \) contains component \( c \). Under the additive model, the effect of treatment \( t \) relative to a reference (no components) is

\[
d_t = \sum_{c=1}^C x_{tc} \beta_c,
\]

where \( \beta_c \) is the incremental effect of component \( c \). The NMA model is then a regression of study contrasts on the component indicators, and inference about \( \beta_c \) identifies which components drive efficacy.
</div>

Component NMA requires a connected component network — the component design matrix \( \mathbf{X}_c \) must have full column rank — and assumes no component-component interactions. When interactions are scientifically plausible, interaction terms can be added, though this substantially increases the number of parameters and requires correspondingly dense networks.

## 9.2 Dose-Response Network Meta-Analysis

When treatments differ not only in type but in dose, dose-response NMA models the treatment effect as a smooth function of dose. A fractional polynomial or Emax model is commonly employed:

\[
d(x) = \beta_1 f_1(x) + \beta_2 f_2(x),
\]

where \( f_1, f_2 \) are transformations of dose \( x \) (e.g., \( x \) and \( x^2 \), or \( x \) and \( \log x \)). The model is embedded in the NMA framework by replacing the treatment-specific parameters \( d_{1t} \) with dose-response parameters \( \beta \), which are shared across treatments and doses. This allows borrowing of information across doses and extrapolation to untested dose levels.

## 9.3 Meta-Regression

**Meta-regression** extends the standard meta-analysis or NMA model by including study-level covariates as explanatory variables for between-study heterogeneity. In the pairwise context, the random-effects model is augmented as:

\[
\hat{\theta}_i = \mu + \gamma (x_i - \bar{x}) + \epsilon_i + \delta_i,
\]

where \( x_i \) is the covariate value for study \( i \) (e.g., mean age, proportion of female participants, year of publication), \( \bar{x} \) is the mean covariate value across studies, \( \gamma \) is the regression coefficient, and \( \delta_i \sim \mathcal{N}(0, \tau^2) \) is the residual between-study heterogeneity after accounting for the covariate.

In the NMA context, meta-regression can be used to investigate whether treatment contrasts vary across studies as a function of patient-level or study-level moderators, providing a formal test of treatment-by-covariate interaction.

<div class="remark">
<strong>Remark 9.2.</strong> Meta-regression is subject to the ecological fallacy: the covariate-outcome association at the study level (where \( x_i \) is typically a group mean) does not necessarily reflect the individual-level association. A positive meta-regression coefficient for mean age does not imply that older individuals benefit more; it means studies enrolling older patients tend to report larger effects on average, which could be due to confounding at the study level. Causal interpretation requires individual patient data (IPD) analysis.
</div>

## 9.4 NMA with Individual Participant Data

When raw patient-level data are available from multiple studies, **individual participant data (IPD) meta-analysis** offers substantial advantages over aggregate data methods. IPD allows covariate-adjusted treatment effect estimation within each study, consistent handling of missing data and time-varying covariates, and investigation of treatment-by-covariate interactions at the individual level (avoiding the ecological fallacy).

In the NMA-IPD context, a one-stage model simultaneously fits all studies, with study-specific intercepts and random treatment effects:

\[
g(E\left[Y_{ijk}\right]) = \mu_i + d_{1,t_{ij}} + \delta_{i, t_{ij}} + \boldsymbol{\gamma}^\top \mathbf{z}_{ijk},
\]

where \( g(\cdot) \) is an appropriate link function, \( Y_{ijk} \) is the outcome for patient \( k \) in arm \( j \) of study \( i \), and \( \mathbf{z}_{ijk} \) is a vector of individual-level covariates. This model provides the most efficient and bias-resistant estimates when IPD are available, but requires data sharing agreements that are often difficult to obtain in practice.

## 9.5 Sensitivity Analyses in NMA

Robust NMA practice requires a pre-specified program of sensitivity analyses to assess the stability of conclusions. Standard sensitivity analyses include: restricting to studies at low risk of bias; excluding multi-arm studies; using alternative priors for \( \tau \); applying an inconsistency model and comparing results; excluding outlier studies identified through influence diagnostics; and repeating the analysis under alternative effect size choices (e.g., odds ratio vs. risk ratio vs. risk difference).

Influence diagnostics adapt the classical Cook's distance to the NMA setting: the influence of study \( s \) is assessed by the change in the vector of treatment effect estimates when study \( s \) is excluded. Studies whose exclusion substantially shifts any treatment comparison or the treatment hierarchy warrant clinical discussion about their comparability with the rest of the network.

---

# Appendix: Key Notation and Formulas

The following table consolidates the principal notation used throughout these notes. Effect sizes are always computed on their natural analytical scale (log scale for ratios, original scale for differences), with back-transformation applied only for reporting.

**Within-study variance:**

\[
v_i = \widehat{\operatorname{Var}}(\hat{\theta}_i)
\]

**Fixed-effect pooled estimate:**

\[
\hat{\theta}_{FE} = \left. \sum_i w_i \hat{\theta}_i \right/ \sum_i w_i, \quad w_i = 1/v_i
\]

**DL between-study variance:**

\[
\hat{\tau}^2_{DL} = \max\!\left(0, \frac{Q - (k-1)}{c}\right), \quad c = \sum_i w_i - \frac{\sum_i w_i^2}{\sum_i w_i}
\]

**Random-effects pooled estimate:**

\[
\hat{\mu}_{RE} = \left. \sum_i w_i^* \hat{\theta}_i \right/ \sum_i w_i^*, \quad w_i^* = 1/(v_i + \hat{\tau}^2)
\]

**\( I^2 \) statistic:**

\[
I^2 = \max\!\left(0, \frac{Q - (k-1)}{Q}\right)
\]

**Bucher indirect estimate:**

\[
\hat{d}_{BC}^{\text{ind}} = \hat{d}_{AC} - \hat{d}_{AB}, \quad \hat{v}_{BC}^{\text{ind}} = \hat{v}_{AB} + \hat{v}_{AC}
\]

**SUCRA:**

\[
\text{SUCRA}(t) = \frac{1}{T-1} \sum_{r=1}^{T-1} P_{tr}
\]
