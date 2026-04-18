---
title: "STAT 931: Causal Inference and Epidemiological Studies"
prof: "Glen McGee"
subjects: "STAT"
---

## Sources and References

**Primary text** — Miguel A. Hernán and James M. Robins, *Causal Inference: What If* (2020), freely available at miguelhernan.org.
**Supplementary texts** — Lash, VanderWeele, Haneuse & Rothman, *Modern Epidemiology* (4th ed.); Agresti, *Categorical Data Analysis* (3rd ed., 2015); Imbens & Rubin, *Causal Inference for Statistics, Social and Biomedical Sciences* (2015); Friedman, Furberg & DeMets, *Fundamentals of Clinical Trials* (4th ed., 2010).
**Online resources** — Harvard T.H. Chan School of Public Health causal inference materials; Miguel Hernán's teaching materials; Stanford STATS 361 lecture notes on causal inference.

---

# Chapter 1: Introduction to Epidemiology and Quantities of Interest

Epidemiology is, at its core, the scientific study of how health and disease are distributed across populations and what determines that distribution. The discipline arose from practical necessity: understanding why cholera clustered around certain water pumps in 1850s London, why tuberculosis was more common among the urban poor, or why lung cancer rates soared after the mid-twentieth century. These questions share a common structure — they ask not merely what is, but why, and implicitly, what would happen if we changed something. This latent causal content is what makes epidemiology both powerful and methodologically demanding.

The transition from description to causal inference requires careful attention to the **quantities of interest** — the parameters we actually wish to estimate. In this chapter we lay the conceptual groundwork for the entire course: we introduce the population perspective, the key epidemiological measures, and the fundamental problem of confounding that motivates the methods developed in all subsequent chapters.

## The Population Framework

Epidemiology works with populations, real or hypothetical. A **study population** (sometimes called the source population or target population) is a collection of individuals who share a defined set of characteristics at a given time. We typically characterize individuals by a **treatment** or **exposure** variable \( A \), measured covariates \( L \), and an **outcome** \( Y \). The treatment \( A \) is often binary — \( A = 1 \) for exposed, \( A = 0 \) for unexposed — though the framework generalizes to multi-valued and continuous exposures.

The most basic epidemiological quantity is **risk**: the probability that a particular event (e.g., disease onset, death) occurs within a specified time period. If we follow a closed cohort of \( n \) individuals over a period \( \left[0, \tau\right] \), the cumulative incidence (or risk) of event \( D \) is

\[
  R = \Pr(D = 1),
\]

estimated by the proportion of the cohort that experiences the event. In open populations where individuals enter and exit observation, we instead work with **incidence rates** — the number of new cases divided by the total person-time at risk — since the denominator itself is a random quantity that depends on follow-up duration.

<div class="definition">
<strong>Incidence Rate.</strong> Let <em>d</em> be the number of new cases of disease occurring in a population during a period of observation, and let <em>PT</em> denote the total person-time contributed by all members of the population during that period. The <em>incidence rate</em> (or incidence density) is

\[ IR = \frac{d}{PT}. \]

The incidence rate has units of inverse time (e.g., cases per person-year) and represents the instantaneous rate at which new cases arise per unit of person-time at risk.
</div>

The distinction between cumulative incidence and incidence rate matters not only for estimation but also for interpretation. Cumulative incidence is dimensionless and directly interpretable as a probability; incidence rate is a rate and must be combined with a time period to yield a probability. Competing risks further complicate this picture: in most realistic settings, individuals can die from causes other than the disease of interest, and naive cumulative incidence estimators that ignore competing events are upwardly biased as probability estimators (though valid as cause-specific cumulative incidence functions in their own right).

## Measures of Association

Given that epidemiology aims to understand determinants of disease, it must move beyond describing marginal risks toward comparing risks across exposure groups. The three most commonly used **measures of association** are the risk difference, the risk ratio, and the odds ratio.

<div class="definition">
<strong>Risk Difference, Risk Ratio, and Odds Ratio.</strong> Let \( R_1 = \Pr(Y = 1 \mid A = 1) \) and \( R_0 = \Pr(Y = 1 \mid A = 0) \) denote the outcome risks in the exposed and unexposed groups, respectively. The three principal measures of association are:

<ul>
<li><em>Risk Difference (RD):</em> \( RD = R_1 - R_0 \). Measures the absolute excess risk attributable to exposure.</li>
<li><em>Risk Ratio (RR):</em> \( RR = R_1 / R_0 \). Measures the relative increase (or decrease) in risk.</li>
<li><em>Odds Ratio (OR):</em> \( OR = \frac{R_1 / (1 - R_1)}{R_0 / (1 - R_0)} \). Approximates the RR when disease is rare.</li>
</ul>
</div>

Each measure answers a subtly different question and each has a different causal interpretation. The risk difference is the most natural measure for public health impact — it quantifies how many excess cases per unit population would be eliminated by removing the exposure. The risk ratio, by contrast, is often the measure of choice in basic science contexts because it is more stable across populations with different baseline risks. The odds ratio has a special mathematical role in logistic regression and case-control studies (Chapter 6), but epidemiologists have become increasingly cautious about its conflation with the risk ratio when the outcome is common.

A critical conceptual point — one that underlies the entire course — is that these observed measures of association are not, in general, equal to the corresponding causal measures. The observed \( R_1 \) and \( R_0 \) are conditional risks among those who happened to be exposed and unexposed; they conflate the effect of exposure with any systematic differences between exposure groups that were present before exposure occurred. The project of causal inference is precisely to recover causal quantities from such observational comparisons under explicitly stated assumptions.

## Standardization and the Marginal Distribution

One of the earliest causal tools in epidemiology is **direct standardization**, which adjusts observed rates to a reference population distribution. If \( L \) is a confounder (a variable associated with both exposure and outcome), then the standardized risk under exposure level \( a \) is

\[
  R^{\text{std}}(a) = \sum_{\ell} \Pr(Y = 1 \mid A = a, L = \ell)\,\Pr(L = \ell),
\]

where the sum is over all strata of \( L \) and the weights \( \Pr(L = \ell) \) come from a reference (often the total study population). This formula looks innocuous, but it conceals a causal assumption: that within each stratum \( \ell \), the association between \( A \) and \( Y \) is unconfounded. We will revisit this assumption rigorously in Chapter 7.

<div class="remark">
The standardized risk \( R^{\text{std}}(a) \) is the <em>g-formula</em> — a special case of what Robins (1986) called the generalized formula for computing counterfactual risks under an intervention. Its validity rests on the no-unmeasured-confounding (exchangeability) assumption, the positivity assumption (that every stratum has both exposed and unexposed individuals), and the consistency assumption (that the observed outcome for exposed individuals equals their counterfactual outcome under exposure). These three assumptions — exchangeability, positivity, consistency — form the identification trinity that recurs throughout this course.
</div>

# Chapter 2: Potential Outcomes and Introduction to Randomized Trials

## The Potential Outcomes Framework

The most influential formal framework for causal inference in statistics is the **potential outcomes** (or counterfactual) framework, developed by Neyman (1923) in the context of agricultural experiments and later extended by Rubin (1974, 1978) to observational studies. The central insight is that a causal effect is defined as a comparison between two potential states of the world: what would have happened under one treatment, versus what would have happened under another.

<div class="definition">
<strong>Potential Outcomes.</strong> For a binary treatment \( A \in \{0, 1\} \), the <em>potential outcome</em> \( Y^{a} \) (also written \( Y(a) \) or \( Y^{(a)} \)) is the value the outcome \( Y \) would have taken for a given individual had that individual's treatment been set to \( A = a \), possibly contrary to fact. Each individual possesses two potential outcomes: \( Y^{1} \) (outcome under treatment) and \( Y^{0} \) (outcome under control). The <em>individual causal effect</em> is \( Y^{1} - Y^{0} \).
</div>

The **fundamental problem of causal inference** (Holland, 1986) is that we can observe at most one of \( Y^{1} \) and \( Y^{0} \) for any given individual — the potential outcome under the treatment not received is forever counterfactual. This is not a limitation of our measurement technology; it is a logical impossibility. Because we cannot observe both potential outcomes simultaneously, individual causal effects are fundamentally unidentifiable from data without additional assumptions.

The way around this impossibility is to work with population-level averages. The **Average Causal Effect (ACE)**, also called the **Average Treatment Effect (ATE)**, is

\[
  \text{ACE} = E\!\left[Y^{1} - Y^{0}\right] = E\!\left[Y^{1}\right] - E\!\left[Y^{0}\right],
\]

where the expectation is taken over the distribution of the target population. The ACE is identifiable under assumptions that we make precise below. When treatment is binary and the outcome is also binary, the ACE equals the causal risk difference. Causal risk ratios and odds ratios are defined analogously.

## The Consistency Assumption

Connecting potential outcomes to observed data requires assumptions. The first is **consistency**: the observed outcome equals the potential outcome under the treatment actually received.

<div class="definition">
<strong>Consistency.</strong> The consistency assumption states that if \( A_i = a \) then \( Y_i = Y_i^{a} \). Equivalently, \( Y = Y^{A} \) almost surely. This links the counterfactual world to the observed world.
</div>

Consistency implies what is sometimes called the **stable unit treatment value assumption (SUTVA)**: (i) there is no interference between units (one individual's treatment does not affect another's potential outcomes), and (ii) there is only one version of each treatment level. SUTVA can fail when there are spillover effects (e.g., vaccination confers herd immunity) or when treatment is not well-defined (e.g., "obesity" is not a single intervention). These violations motivate extensions to interference and multiple-versions frameworks that we touch on later.

## Exchangeability and Randomization

The key condition linking the observational distribution to causal quantities is **exchangeability** (also called ignorability or no unmeasured confounding).

<div class="definition">
<strong>Exchangeability.</strong> The treatment groups are <em>exchangeable</em> if the potential outcomes are independent of the treatment assignment:

\[ Y^{0}, Y^{1} \perp\!\!\!\perp A. \]

This is <em>marginal exchangeability</em>. The weaker <em>conditional exchangeability</em> (sufficient for identification given measured covariates \( L \)) states

\[ Y^{0}, Y^{1} \perp\!\!\!\perp A \mid L. \]
</div>

The power of randomization is that it produces (marginal) exchangeability by design. When treatment assignment is determined by a coin flip — independent of any characteristic of the individual — the distribution of potential outcomes is the same in the treatment and control groups. This means the observed outcome in the control group serves as a valid **counterfactual** for the treatment group (and vice versa), and the ACE is simply the difference in observed means.

Under marginal exchangeability plus consistency:

\[
  E\!\left[Y^{a}\right] = E\!\left[Y \mid A = a\right],
\]

and therefore

\[
  \text{ACE} = E\!\left[Y \mid A = 1\right] - E\!\left[Y \mid A = 0\right].
\]

This is the justification for the simple two-sample comparison in a randomized trial.

## Positivity

The third identification assumption is **positivity** (also called overlap or common support).

<div class="definition">
<strong>Positivity.</strong> For all values \( \ell \) of \( L \) with \( \Pr(L = \ell) > 0 \):

\[ \Pr(A = 1 \mid L = \ell) > 0 \quad \text{and} \quad \Pr(A = 0 \mid L = \ell) > 0. \]

This ensures that within every covariate stratum, individuals can receive either treatment level, so both counterfactuals are observable in principle.
</div>

Violations of positivity are called **structural** when certain individuals are by design unable to receive a treatment level (e.g., pregnant women cannot receive a drug contraindicated in pregnancy), and **practical** (or near-violations) when certain strata have very few observed units in one treatment arm, leading to high variance estimators. In finite samples, practical positivity violations are ubiquitous and represent one of the most important sources of failure for methods based on inverse probability weighting.

The triple of assumptions — consistency, (conditional) exchangeability, and positivity — constitute the identifying assumptions for the ACE in observational studies. In a randomized trial, consistency and positivity hold by design (assuming good experimental control), and exchangeability holds by randomization. This is precisely why randomized trials are the gold standard for causal inference.

# Chapter 3: Analyzing Completely Randomized Trials; Sample Size and Power

## The Completely Randomized Design

In a **completely randomized trial (CRT)**, a fixed number \( n \) of study units are randomly assigned to treatment levels, with \( n_1 \) units to treatment and \( n_0 = n - n_1 \) to control, where the assignment mechanism gives each unit equal probability \( n_1/n \) of receiving treatment and the assignment is independent across units. The CRT is the simplest and most transparent experimental design; it is also the canonical setting for understanding what randomization buys us.

Under SUTVA and randomization, the Neyman estimator of the ACE is simply the difference in sample means:

\[
  \widehat{\text{ACE}} = \bar{Y}_1 - \bar{Y}_0 = \frac{1}{n_1}\sum_{i: A_i=1} Y_i - \frac{1}{n_0}\sum_{i: A_i=0} Y_i.
\]

<div class="theorem">
<strong>Unbiasedness of the Neyman Estimator.</strong> Under a completely randomized design with SUTVA, \( E\!\left[\widehat{\text{ACE}}\right] = \text{ACE} \). The variance of \( \widehat{\text{ACE}} \) is

\[ \text{Var}\!\left(\widehat{\text{ACE}}\right) = \frac{S_1^2}{n_1} + \frac{S_0^2}{n_0} - \frac{S_\tau^2}{n}, \]

where \( S_a^2 = \frac{1}{n-1}\sum_{i=1}^n (Y_i^a - \bar{Y}^a)^2 \) is the population variance of the \( a \)-potential outcomes and \( S_\tau^2 \) is the population variance of individual treatment effects \( Y_i^1 - Y_i^0 \).
</div>

The last term \( S_\tau^2/n \) is not estimable from data (because we never observe both potential outcomes for the same individual), but it is non-negative, so the usual two-sample variance estimator \( \hat{S}_1^2/n_1 + \hat{S}_0^2/n_0 \) is a conservative (upwardly biased) estimator of the true variance of \( \widehat{\text{ACE}} \). This conservatism is typically small and is ignored in practice.

## Regression Adjustment in Randomized Trials

Even though randomization ensures exchangeability, baseline covariates \( L \) can be incorporated into the analysis to increase precision. The **ANCOVA estimator** fits an ordinary least squares regression of \( Y \) on \( A \) and \( L \):

\[
  Y = \alpha + \beta A + \gamma^T L + \varepsilon,
\]

and uses the coefficient \( \hat{\beta} \) as an estimate of the ACE. Because randomization ensures \( A \perp\!\!\!\perp L \), the estimator is consistent regardless of whether the regression model is correctly specified. Moreover, Lin (2013) showed that the ANCOVA estimator with a full interaction between \( A \) and \( L \) (i.e., including \( A \cdot L \) terms) is asymptotically at least as efficient as the unadjusted Neyman estimator and is often substantially more efficient when \( L \) is strongly prognostic of \( Y \). This is one of the few "free lunches" in statistics: covariate adjustment after randomization can increase power without any bias risk.

<div class="remark">
There is a subtlety about what "covariate adjustment" means in the linear model. The coefficient \( \beta \) in the ANCOVA model estimates the <em>conditional</em> average treatment effect \( E[Y^1 - Y^0 \mid L] \) only if that conditional effect is the same for all \( \ell \) (i.e., no effect modification by \( L \)). When there is effect modification, \( \beta \) estimates a weighted average of stratum-specific effects, with weights depending on the design (not the population distribution of \( L \)). To estimate the <em>marginal</em> ACE in the presence of effect modification, one should use the G-computation formula: fit the outcome model with the interaction, then average predicted values over the marginal distribution of \( L \).
</div>

## Sample Size and Power Calculations

One of the most practically important tasks in the design of a clinical trial is the determination of an adequate sample size. Underpowered studies waste resources and fail to answer their scientific question; overpowered studies enroll unnecessary participants, raising ethical concerns. The standard framework for sample size determination is the Neyman-Pearson hypothesis testing framework.

Consider testing \( H_0: \text{ACE} = 0 \) versus \( H_1: \text{ACE} = \delta \) for some clinically meaningful effect size \( \delta > 0 \), at significance level \( \alpha \) with power \( 1 - \beta \). For a balanced trial (\( n_1 = n_0 = n/2 \)) with a continuous outcome of variance \( \sigma^2 \), the required total sample size is

\[
  n = \frac{2\sigma^2 (z_{1-\alpha/2} + z_{1-\beta})^2}{\delta^2},
\]

where \( z_p \) denotes the \( p \)-th quantile of the standard normal distribution.

<div class="example">
<strong>Sample size for a binary outcome.</strong> Suppose we wish to detect a reduction in 30-day mortality from \( R_0 = 0.30 \) under control to \( R_1 = 0.20 \) under treatment (i.e., \( \delta = -0.10 \)), using a two-sided test at \( \alpha = 0.05 \) (so \( z_{0.975} = 1.96 \)) with power 0.80 (\( z_{0.80} = 0.842 \)). The pooled variance under the null is approximately \( \sigma^2 \approx \bar{R}(1 - \bar{R}) \) where \( \bar{R} = (R_0 + R_1)/2 = 0.25 \), giving \( \sigma^2 \approx 0.1875 \). Substituting:

\[ n = \frac{2 \times 0.1875 \times (1.96 + 0.842)^2}{0.10^2} \approx \frac{0.375 \times 7.854}{0.01} \approx 294. \]

We need approximately 294 total participants (147 per arm) to achieve 80% power. This calculation assumes perfect adherence, no loss to follow-up, and no interim analyses — each of which will inflate the required sample size in practice.
</div>

The sample size formula reveals important structural relationships: power increases with the effect size \( \delta \) (larger effects are easier to detect), decreases with outcome variability \( \sigma^2 \), and increases with \( (z_{1-\alpha/2} + z_{1-\beta})^2 \), which captures the trade-off between type I and type II error. Multiple comparison corrections (Bonferroni, Holm, Benjamini-Hochberg) are required when the trial has multiple primary endpoints, and each correction effectively reduces \( \alpha \) and thus requires a larger \( n \).

# Chapter 4: Stratified Designs and Other Issues in RCT Analysis

## Stratified Randomization

In a completely randomized design, chance imbalances in important prognostic variables are possible, especially in small trials. **Stratified randomization** guards against this by carrying out separate randomizations within strata defined by key baseline covariates. If \( L \) is a binary stratum variable (e.g., disease severity: low vs. high), we independently randomize within each stratum to ensure balance on \( L \) by design.

<div class="definition">
<strong>Stratified Randomized Design.</strong> Partition the study population into \( K \) strata defined by baseline covariates \( L = 1, \ldots, K \). Within each stratum \( k \), independently randomize \( n_k \) participants (allocated to \( n_{1k} \) treatment and \( n_{0k} \) control). The overall assignment mechanism is

\[ \Pr(A_i = 1 \mid L_i = k) = n_{1k}/n_k, \]

which may vary across strata. The design guarantees balance on \( L \) but creates a <em>cluster structure</em> in the data — analyses that ignore this stratification can be conservative or anti-conservative depending on the direction of the association between \( L \) and \( Y \).
</div>

Analyses of stratified trials should, at minimum, include the stratification variable as a covariate. The Cochran-Mantel-Haenszel (CMH) estimator is a canonical choice for binary outcomes: it computes a weighted average of stratum-specific log-odds ratios, with weights proportional to the inverse within-stratum variance. For continuous outcomes under a linear model, the ordinary ANCOVA with stratum indicators is optimal.

## Adaptive Designs and Group Sequential Methods

Modern clinical trials rarely use a fixed sample size with a single final analysis. **Group sequential designs** pre-specify a sequence of interim analyses, at each of which the trial may be stopped early for efficacy (if the evidence in favor of treatment is overwhelming) or futility (if the treatment shows no promise of achieving the target effect size). Stopping rules must be pre-specified and must control the overall type I error rate across all planned analyses.

The O'Brien-Fleming stopping boundary is the most conservative commonly used efficacy boundary: it requires very strong evidence at early looks and becomes progressively more lenient as the trial approaches the final sample size. The Lan-DeMets alpha-spending function approach generalizes this by allowing unequally-spaced interim analyses and flexibility in the timing of looks.

<div class="remark">
A group sequential trial with \( K \) planned analyses at information fractions \( t_1 < t_2 < \cdots < t_K = 1 \) uses a test statistic \( Z_k \) at each stage. Under \( H_0 \), the joint distribution of \( (Z_1, \ldots, Z_K) \) is multivariate normal with correlation \( \text{Corr}(Z_j, Z_k) = \sqrt{t_j/t_k} \) for \( j \leq k \). The overall type I error rate is controlled by choosing boundaries \( c_1, \ldots, c_K \) such that \( \Pr(\left|Z_k\right| > c_k \text{ for some } k \mid H_0) = \alpha \).
</div>

## Missing Data in Randomized Trials

Missing data is ubiquitous in clinical trials. Participants drop out, miss visits, or die before the primary outcome is measured. The standard taxonomy (Rubin, 1976) classifies missing data mechanisms as **missing completely at random (MCAR)**, **missing at random (MAR)**, and **missing not at random (MNAR)**.

Under MCAR, the probability of missingness does not depend on any observed or unobserved variables; complete-case analysis is unbiased. Under MAR, the probability of missingness depends on observed variables but not on the missing outcome itself; multiple imputation and likelihood-based methods (using all available data under a correctly specified model) are valid. Under MNAR, the probability of missingness depends on the value of the missing outcome even after conditioning on observed variables; sensitivity analyses are required since no method is universally valid.

**Multiple imputation** (Rubin, 1987) creates \( M \) complete datasets by drawing from the posterior predictive distribution of the missing data given observed data, analyzes each complete dataset separately, and combines estimates using Rubin's rules:

\[
  \hat{\theta}_{\text{MI}} = \frac{1}{M}\sum_{m=1}^M \hat{\theta}_m, \quad \widehat{\text{Var}}(\hat{\theta}_{\text{MI}}) = \bar{U} + \left(1 + \frac{1}{M}\right)B,
\]

where \( \bar{U} = M^{-1}\sum_m \hat{U}_m \) is the average within-imputation variance and \( B = (M-1)^{-1}\sum_m (\hat{\theta}_m - \hat{\theta}_{\text{MI}})^2 \) is the between-imputation variance capturing uncertainty due to missing data.

## Noncompliance and Intention-to-Treat Analysis

Noncompliance — when participants do not adhere to their assigned treatment — is nearly universal in real trials. The **intention-to-treat (ITT) principle** specifies that participants should be analyzed according to their randomized assignment, regardless of compliance. The ITT analysis preserves the benefits of randomization (exchangeability holds for assigned treatment) and gives a conservative estimate of the treatment effect relevant to the clinical decision of assignment.

The **complier-average causal effect (CACE)**, also called the local average treatment effect (LATE), is the causal effect among the subgroup of participants who would comply with their assignment regardless of which arm they are assigned to (the "compliers"). It can be estimated by the instrumental variables method (Chapter 9), using randomized assignment as an instrument for actual treatment received.

# Chapter 5: Observational Studies in Epidemiology; Regression Review

## The Challenge of Observational Studies

When randomization is not feasible — for ethical, practical, or economic reasons — epidemiologists must rely on observational data. The fundamental challenge is that in an observational study, treatment assignment is not under the investigator's control, and individuals self-select into exposure categories based on characteristics that may themselves be related to the outcome. This creates **confounding**: systematic differences between exposure groups that distort the observed association.

The formal definition of confounding in the potential outcomes framework is the failure of (conditional) exchangeability: \( Y^0, Y^1 \not\perp\!\!\!\perp A \). This failure means that \( E[Y \mid A = 1] \neq E[Y^1] \) and \( E[Y \mid A = 0] \neq E[Y^0] \), so the naive difference in observed means does not equal the ACE. The methods of causal inference are, at their core, methods for recovering \( E[Y^a] \) from observational data under assumptions that approximately restore exchangeability.

## Cohort Studies

A **cohort study** follows a group of individuals who are initially free of the outcome of interest over time, measuring exposure at baseline (or over time) and ascertaining outcomes prospectively. Cohort studies naturally yield incidence rates and cumulative incidence estimates; relative risks and rate ratios are the natural measures of association. The key analytical advantage of a cohort study is that exposure is measured before outcome, reinforcing the temporal ordering required for causal interpretation.

<div class="example">
<strong>The Nurses' Health Study.</strong> One of the most influential cohort studies in epidemiology, the Nurses' Health Study enrolled 121,700 married female registered nurses aged 30–55 in 1976 and has followed them biennially ever since. Through linkage to medical records and death certificates, it has generated causal evidence (under exchangeability assumptions) on associations between hormone replacement therapy, diet, physical activity, and chronic disease outcomes including cardiovascular disease, cancer, and diabetes.
</div>

## Cross-Sectional Studies and Ecological Studies

A **cross-sectional study** measures exposure and outcome simultaneously at a single point in time, making it impossible to establish temporal precedence. Cross-sectional studies are appropriate for studying prevalence and for generating hypotheses, but the lack of temporal ordering severely limits causal inference. The **ecological study** (or aggregate study) uses group-level (not individual-level) data and is subject to the **ecological fallacy**: associations observed at the group level need not hold at the individual level.

## Linear Regression Review

Because regression models appear throughout this course as both analytic tools and components of more complex causal procedures, we briefly review their key properties. A **linear regression model** specifies

\[
  E[Y \mid X] = X\beta,
\]

for a design matrix \( X \) and parameter vector \( \beta \). The OLS estimator \( \hat{\beta} = (X^T X)^{-1} X^T Y \) is the best linear unbiased estimator (BLUE) under the Gauss-Markov conditions. In the context of causal inference, however, we must be careful: the coefficient on treatment in a regression of \( Y \) on \( A \) and \( L \) is a valid estimate of the conditional ACE only if (a) the regression model is correctly specified, (b) there is no unmeasured confounding given \( L \), and (c) there is no treatment-by-covariate interaction (or we are content to estimate a model-based weighted average of conditional effects).

**Logistic regression** is the standard model for binary outcomes. The logistic model specifies

\[
  \log\frac{\Pr(Y = 1 \mid X)}{\Pr(Y = 0 \mid X)} = X\beta,
\]

so the odds of the outcome are log-linearly related to \( X \). The coefficient \( \beta_A \) on treatment \( A \) estimates the log-odds ratio, which approximates the log-risk-ratio only when the outcome is rare. For common outcomes, the prevalence ratio (estimated via log-binomial or Poisson regression with robust standard errors) is a more interpretable measure than the odds ratio.

# Chapter 6: Case-Control Studies and Causal Inference in Observational Studies

## The Case-Control Design

The **case-control study** is the design of choice when the outcome of interest is rare. Rather than following a full cohort until the outcome develops (which would require enormous sample sizes for rare diseases), the case-control design samples everyone who develops the outcome (the **cases**) and a subset of those who do not (the **controls**), then looks backward at exposure histories.

<div class="definition">
<strong>Case-Control Study.</strong> Let the source population be a cohort of \( N \) individuals followed over time \( \left[0, \tau\right] \). Among the \( D \) individuals who develop the outcome (cases) and the \( N - D \) who do not (controls), we sample all \( D \) cases and a random sample of \( m \) controls. We then measure exposure \( A \) and covariates \( L \) in the sampled individuals. The key quantity estimable from this design is the <em>odds ratio</em>:

\[ OR = \frac{\Pr(A = 1 \mid \text{case}) / \Pr(A = 0 \mid \text{case})}{\Pr(A = 1 \mid \text{control}) / \Pr(A = 0 \mid \text{control})}, \]

which equals the population odds ratio by Bayes' theorem.
</div>

The mathematics that makes case-control studies work is a consequence of Bayes' theorem: the odds ratio is symmetric in exposure and disease, so the odds ratio computed among cases and controls equals the exposure odds ratio in the source population, which in turn equals the disease odds ratio (the quantity of epidemiological interest). This symmetry breaks down for risks and risk ratios, which is why case-control studies cannot directly estimate the risk ratio without knowing the baseline prevalence.

## Nested Case-Control and Case-Cohort Designs

Two important variants overcome some limitations of the basic case-control design. In a **nested case-control study**, cases and controls are drawn from a pre-existing prospectively-defined cohort (the "risk set sampling" approach). Each case is matched to controls who are in the risk set at the time the case occurs (i.e., have not yet had the event and are still under follow-up). This design is particularly valuable when exposure measurement is expensive, because only the sampled subset requires detailed exposure assessment.

In a **case-cohort study**, the controls are drawn as a random sub-cohort at baseline, before any outcomes occur. The same sub-cohort serves as the comparison group for all outcomes, making the design efficient when multiple outcomes are of interest. Both designs require special analysis methods (conditional logistic regression for nested case-control; weighted Cox regression for case-cohort) to account for the sampling.

## Confounding, Effect Modification, and Selection Bias

Three major sources of error in observational epidemiology are **confounding**, **effect modification** (which is not a bias but a substantive feature), and **selection bias**.

Confounding occurs when a third variable \( L \) is associated with both the exposure \( A \) and the outcome \( Y \), and is not on the causal pathway from \( A \) to \( Y \). In the potential outcomes framework, a confounder is a common cause of treatment and outcome, and its presence violates (marginal) exchangeability. The solution is conditional exchangeability: adjust for \( L \) in the analysis so that \( Y^0, Y^1 \perp\!\!\!\perp A \mid L \).

**Effect modification** (or heterogeneous treatment effects) occurs when the causal effect of \( A \) on \( Y \) differs across strata of a third variable \( V \). Effect modification is not a bias — it is a real feature of the world — but it means that a single summary measure (marginal ACE) may conceal important heterogeneity. Methods for effect modification are developed in Chapter 11.

**Selection bias** arises when the study sample is not representative of the target population due to the selection process being related to both exposure and outcome. In a case-control study, selection bias occurs if the sampling probabilities for controls depend on their exposure status.

# Chapter 7: Directed Acyclic Graphs and Estimating Average Causal Effects

## Directed Acyclic Graphs

**Directed acyclic graphs (DAGs)** provide a graphical language for encoding and reasoning about causal assumptions. A DAG consists of nodes (variables) and directed edges (arrows), where an arrow from \( X \) to \( Y \) asserts that \( X \) is a direct cause of \( Y \) (relative to the other variables in the graph). The acyclicity constraint — no variable is its own ancestor — is the graphical analogue of the requirement that causes precede their effects.

<div class="definition">
<strong>DAG and d-Separation.</strong> A <em>directed acyclic graph (DAG)</em> \( \mathcal{G} \) over variables \( V = (V_1, \ldots, V_p) \) is a graph with directed edges and no directed cycles. Variables \( X \) and \( Y \) are <em>d-separated</em> by a set \( Z \) in \( \mathcal{G} \) (written \( X \perp_d Y \mid Z \) in \( \mathcal{G} \)) if every path between \( X \) and \( Y \) is blocked by \( Z \). A path is blocked by \( Z \) if it contains either (a) a non-collider node in \( Z \), or (b) a collider node not in \( Z \) and with no descendant in \( Z \). The <em>Markov condition</em> says that d-separation in \( \mathcal{G} \) implies conditional independence in the distribution: \( X \perp_d Y \mid Z \Rightarrow X \perp\!\!\!\perp Y \mid Z \).
</div>

The three fundamental path structures in a DAG are chains (\( X \to M \to Y \)), forks (\( X \leftarrow L \rightarrow Y \)), and colliders (\( X \to C \leftarrow Y \)). Chains and forks transmit association but are blocked by conditioning on the middle variable. Colliders block association but are opened (create spurious association) when the collider or its descendants are conditioned upon. This last point — that conditioning on a collider induces association — is one of the most important and counterintuitive facts in causal inference.

<div class="example">
<strong>Collider bias (Berkson's paradox).</strong> Suppose we study the association between smoking (\( A \)) and lung cancer (\( Y \)) in a hospital population. Hospitalization (\( C \)) is a collider: both smoking and lung cancer increase the probability of hospitalization, so there is an arrow from each into \( C \). If we restrict our analysis to hospitalized patients (condition on \( C = 1 \)), we open the collider and induce a spurious negative association between smoking and lung cancer among the hospitalized — because individuals with lung cancer who are not smokers must have had another reason to be hospitalized (e.g., a different smoking-related disease), making non-smokers with lung cancer look as if lung cancer is associated with lower smoking rates in this restricted sample. This is Berkson's paradox, a classic illustration of collider-stratification bias.
</div>

## The Back-Door Criterion

DAGs provide a graphical criterion for identifying valid adjustment sets — sets of variables \( Z \) such that conditioning on \( Z \) removes all confounding for the effect of \( A \) on \( Y \).

<div class="definition">
<strong>Back-Door Criterion.</strong> A set of variables \( Z \) satisfies the <em>back-door criterion</em> relative to the ordered pair \( (A, Y) \) in a DAG \( \mathcal{G} \) if (i) no node in \( Z \) is a descendant of \( A \), and (ii) \( Z \) blocks every path between \( A \) and \( Y \) that has an arrow <em>into</em> \( A \) (the back-door paths). If \( Z \) satisfies the back-door criterion, then adjusting for \( Z \) (via stratification, regression, or reweighting) identifies the causal effect of \( A \) on \( Y \):

\[ E\!\left[Y^a\right] = \sum_z E\!\left[Y \mid A = a, Z = z\right]\Pr(Z = z). \]
</div>

The requirement that no element of \( Z \) is a descendant of \( A \) is crucial: adjusting for a mediator (a variable on the causal pathway from \( A \) to \( Y \)) or a descendant of a mediator can block part of the causal effect and introduce bias. This is why we must have a DAG — or at least a qualitative causal model — before selecting adjustment variables.

## The G-Computation Formula

Robins (1986) derived the **G-computation formula** (or G-formula) as a general nonparametric identification formula for causal effects under a set of conditional exchangeability and positivity assumptions. For a static treatment \( A \):

\[
  E\!\left[Y^a\right] = \sum_\ell E\!\left[Y \mid A = a, L = \ell\right]\Pr(L = \ell).
\]

Estimation proceeds by (i) fitting an outcome regression model \( \hat{E}[Y \mid A, L] \), (ii) predicting each individual's outcome under each treatment level \( a \) using the fitted model, and (iii) averaging the predictions. The G-formula estimator is consistent when the outcome model is correctly specified and the identification conditions hold.

## Inverse Probability Weighting

An alternative identification strategy is **inverse probability weighting (IPW)**. The key idea is to create a pseudo-population by weighting each individual by the inverse probability of receiving their observed treatment:

\[
  w_i = \frac{1}{\Pr(A_i \mid L_i)}.
\]

<div class="theorem">
<strong>IPW Identification.</strong> Under consistency, conditional exchangeability \( Y^0, Y^1 \perp\!\!\!\perp A \mid L \), and positivity, the IPW estimator

\[ \hat{E}\!\left[Y^a\right]_{\text{IPW}} = \frac{\sum_{i: A_i = a} w_i Y_i}{\sum_{i: A_i = a} w_i} \]

is consistent for \( E[Y^a] \). The weighted pseudo-population eliminates confounding: in the pseudo-population, the distribution of \( L \) is the same in all treatment groups (marginal exchangeability holds), so the simple comparison of weighted means gives the causal effect.
</div>

The propensity score \( e(L) = \Pr(A = 1 \mid L) \) is the central quantity in IPW estimation. Rosenbaum and Rubin (1983) showed that the propensity score is a **balancing score**: conditioning on the propensity score is sufficient to eliminate confounding, even though the propensity score summarizes potentially high-dimensional \( L \) into a scalar. This remarkable dimensionality reduction is what makes propensity score methods practical.

In practice, the propensity score is estimated (e.g., using logistic regression of \( A \) on \( L \)). The estimated propensity score \( \hat{e}(L) \) is then used in place of the true \( e(L) \). Because estimating the propensity score actually improves the efficiency of the IPW estimator under certain conditions (Hirano, Imbens & Ridder, 2003), the plug-in IPW estimator with an estimated propensity score is the norm.

**Stabilized weights** replace the denominator propensity score with the marginal probability of treatment:

\[
  w_i^{\text{stab}} = \frac{\Pr(A_i)}{\Pr(A_i \mid L_i)}.
\]

Stabilized weights have the same expectation as unstabilized weights (both estimate the causal risk difference) but have smaller variance, particularly when some strata have very small propensity scores (near-positivity violations).

## Doubly Robust Estimation

Both the G-formula estimator and the IPW estimator require correct specification of a nuisance model — the outcome model or the propensity score model, respectively. **Doubly robust (DR) estimators** combine both models and remain consistent if either (but not necessarily both) is correctly specified.

The augmented inverse probability weighted (AIPW) estimator is

\[
  \hat{E}\!\left[Y^a\right]_{\text{AIPW}} = \frac{1}{n}\sum_{i=1}^n \left\{\frac{\mathbf{1}(A_i = a)Y_i}{\hat{\pi}_a(L_i)} - \frac{\mathbf{1}(A_i = a) - \hat{\pi}_a(L_i)}{\hat{\pi}_a(L_i)}\hat{\mu}_a(L_i)\right\},
\]

where \( \hat{\pi}_a(L) = \Pr(A = a \mid L) \) is the estimated propensity score and \( \hat{\mu}_a(L) = E[Y \mid A = a, L] \) is the estimated outcome model. The AIPW estimator has the double robustness property and is also **semiparametrically efficient** when both nuisance models are correctly specified. In the era of machine learning, targeted learning (van der Laan & Rose, 2011) and debiased machine learning (Chernozhukov et al., 2018) extend this idea: one can use flexible ML estimators for both nuisance models while maintaining valid inference via sample-splitting (cross-fitting).

# Chapter 8: Marginal Structural Models

## Time-Varying Treatments and the Inadequacy of Standard Regression

Many epidemiological questions involve treatments that vary over time: patients may initiate, discontinue, or change medications at multiple time points; exposure to a hazardous substance accumulates over a career; dietary patterns evolve throughout life. The naive approach of fitting a regression of outcome on all past treatment values fails badly in this setting due to **time-varying confounding**.

A **time-varying confounder** is a variable \( L_t \) at time \( t \) that (a) is a cause of subsequent treatment \( A_{t+1} \) and of the outcome, and (b) is itself affected by prior treatment \( A_{t-1} \). Blood pressure in a hypertension trial is a canonical example: prior antihypertensive treatment lowers blood pressure, which in turn influences subsequent treatment decisions; blood pressure also directly affects cardiovascular outcomes. In this setting, blood pressure at time \( t \) is simultaneously a confounder (we should adjust for it) and a mediator (we should not adjust for it). Standard regression cannot resolve this contradiction; adjustment for a time-varying mediator-confounder introduces collider bias.

## The G-Formula for Longitudinal Data

Robins (1986) showed that the counterfactual outcome \( E[Y^{\bar{a}}] \) under a static treatment regime \( \bar{a} = (a_0, a_1, \ldots, a_{T-1}) \) is identified by the sequential conditional G-formula:

\[
  E\!\left[Y^{\bar{a}}\right] = \sum_{\bar{l}} E\!\left[Y \mid \bar{A} = \bar{a}, \bar{L} = \bar{l}\right] \prod_{t=0}^{T-1} \Pr(L_t = l_t \mid \bar{A}_{t-1} = \bar{a}_{t-1}, \bar{L}_{t-1} = \bar{l}_{t-1}),
\]

where \( \bar{A}_t = (A_0, \ldots, A_t) \) and \( \bar{L}_t = (L_0, \ldots, L_t) \) denote histories through time \( t \). This formula is the fundamental identification result for longitudinal causal inference and underlies all of the methods developed in this chapter.

## Marginal Structural Models

**Marginal structural models (MSMs)**, introduced by Robins, Hernán & Brumback (2000), specify a model for the marginal counterfactual mean as a function of treatment history:

\[
  E\!\left[Y^{\bar{a}}\right] = g(\bar{a};\psi),
\]

for some parametric function \( g \). A linear MSM specifies \( E[Y^{\bar{a}}] = \psi_0 + \psi_1 \sum_t a_t \) (cumulative treatment), while a logistic MSM specifies \( \text{logit}\,E[Y^{\bar{a}}] = \psi_0 + \psi_1 \sum_t a_t \). The parameters \( \psi \) have a causal interpretation: \( \psi_1 \) is the marginal causal effect of one additional unit of cumulative treatment on the (log-odds of the) outcome.

<div class="definition">
<strong>Inverse Probability of Treatment Weights for Longitudinal Data.</strong> To fit a marginal structural model, we weight each individual's contribution by the inverse probability of their observed treatment history, given their covariate history:

\[ W_i = \prod_{t=0}^{T-1} \frac{1}{\Pr(A_{it} \mid \bar{A}_{i,t-1}, \bar{L}_{it})}. \]

Stabilized weights replace the numerator 1 with \( \Pr(A_{it} \mid \bar{A}_{i,t-1}) \) (the probability of treatment given only treatment history, not covariate history), giving

\[ W_i^{\text{stab}} = \prod_{t=0}^{T-1} \frac{\Pr(A_{it} \mid \bar{A}_{i,t-1})}{\Pr(A_{it} \mid \bar{A}_{i,t-1}, \bar{L}_{it})}. \]

Under the sequential exchangeability assumption \( Y^{\bar{a}} \perp\!\!\!\perp A_t \mid \bar{A}_{t-1}, \bar{L}_t \) for all \( t \) and all regimes \( \bar{a} \), the MSM parameters can be consistently estimated by solving the weighted estimating equations.
</div>

The key insight of the MSM/IPTW approach is that weighting creates a pseudo-population in which there is no time-varying confounding: in the pseudo-population, the distribution of \( L_t \) does not depend on \( A_{t-1} \), so ordinary weighted regression on the pseudo-population estimates the marginal structural model parameters without bias.

<div class="theorem">
<strong>Consistency of the IPTW-MSM Estimator.</strong> Under sequential consistency (\( Y = Y^{\bar{A}} \)), sequential positivity (\( \Pr(A_t \mid \bar{A}_{t-1}, \bar{L}_t) > 0 \) a.s. for all \( t \)), and sequential exchangeability, the solution \( \hat{\psi} \) to the weighted estimating equations

\[ \sum_{i=1}^n W_i^{\text{stab}} U(O_i; \psi) = 0 \]

(for an appropriate estimating function \( U \)) is consistent for the true MSM parameters \( \psi_0 \).
</div>

## Structural Nested Models

An alternative to MSMs, also developed by Robins, is the class of **structural nested models (SNMs)**. Rather than modeling the marginal counterfactual mean, SNMs model the within-individual treatment effect using a "blip-down" or "blip-up" function. Structural nested mean models specify

\[
  E\!\left[Y^{\bar{a}} - Y^{(a_{T-1} = 0, \bar{a}_{T-2})} \mid \bar{A} = \bar{a}, \bar{L}\right] = \gamma(a_{T-1}, \bar{a}_{T-2}, \bar{l}; \psi),
\]

which characterizes the effect of treatment at the last time point. SNMs are estimated using g-estimation and have the advantage of being doubly robust in a different sense than MSMs. They are particularly natural for point exposures and for settings where effect modification by covariates is of primary interest.

# Chapter 9: Instrumental Variables and Time-Varying Confounding

## The Instrumental Variables Strategy

When unmeasured confounding is present and cannot be eliminated by conditioning on observed covariates, **instrumental variables (IV)** provide an alternative identification strategy. An instrument \( Z \) is a variable that (a) affects treatment \( A \), (b) affects the outcome \( Y \) only through \( A \) (the exclusion restriction), and (c) is independent of all unmeasured confounders of the \( A \)–\( Y \) relationship (the relevance and exogeneity conditions).

<div class="definition">
<strong>Instrumental Variable Assumptions.</strong> Let \( U \) denote all unmeasured confounders. A variable \( Z \) is a valid instrument for the effect of \( A \) on \( Y \) if:
<ol>
<li><em>Relevance:</em> \( Z \not\perp\!\!\!\perp A \) (the instrument must be associated with treatment).</li>
<li><em>Exogeneity:</em> \( Z \perp\!\!\!\perp U \) (the instrument is independent of unmeasured confounders; equivalently, \( Z \perp\!\!\!\perp Y^a \) for all \( a \)).</li>
<li><em>Exclusion restriction:</em> The effect of \( Z \) on \( Y \) is entirely mediated by \( A \); i.e., \( Y^{a,z} = Y^a \) for all \( a, z \).</li>
</ol>
</div>

Under these assumptions, the IV estimand for a binary instrument and binary treatment identifies the **local average treatment effect (LATE)** — the causal effect among the subgroup of **compliers**: individuals whose treatment status is changed by the instrument (those for whom \( A^{Z=1} = 1 \) and \( A^{Z=0} = 0 \)).

<div class="theorem">
<strong>LATE Theorem (Angrist, Imbens & Rubin, 1996).</strong> Under the IV assumptions plus monotonicity (no defiers: \( A^{Z=1} \geq A^{Z=0} \) for all individuals), the IV estimand

\[ \text{LATE} = \frac{E[Y \mid Z = 1] - E[Y \mid Z = 0]}{E[A \mid Z = 1] - E[A \mid Z = 0]} \]

equals the average causal effect of \( A \) on \( Y \) among the complier subpopulation.
</div>

Two-stage least squares (2SLS) is the canonical estimator when both \( A \) and \( Y \) are continuous: the first stage regresses \( A \) on \( Z \) (and any covariates), and the second stage regresses \( Y \) on the first-stage fitted values \( \hat{A} \) (and the same covariates). The 2SLS coefficient on \( \hat{A} \) is consistent for the LATE under the IV assumptions.

Examples of natural instruments in epidemiology include: genetic variants that influence exposure but are independent of confounders (Mendelian randomization); physician prescribing preferences as an instrument for drug treatment; geographic distance to a specialty hospital as an instrument for specialty care; and the timing of randomization assignment relative to administrative cut-offs.

## The Limits of IV

The IV strategy has important limitations. First, the exclusion restriction is fundamentally untestable; one must rely on subject-matter knowledge to argue that \( Z \) affects \( Y \) only through \( A \). Second, the LATE is an effect only for compliers, who may not be the population of primary scientific interest. Third, weak instruments (where \( Z \) is only weakly associated with \( A \)) lead to severely biased 2SLS estimates in finite samples; the bias can be even worse than the unadjusted (naive) estimate when the instrument is weak. The weak instrument problem is diagnosed by the first-stage F-statistic; a rule of thumb requires \( F > 10 \), though this threshold is increasingly recognized as insufficient in many practical settings.

## Time-Varying Confounding and the Limits of Standard Methods

The problem of **time-varying confounding** was introduced in Chapter 8 in the context of marginal structural models. Here we provide the formal result that motivates the need for these methods.

<div class="theorem">
<strong>Bias of Standard Regression with Time-Varying Mediator-Confounders.</strong> Suppose the true data-generating process involves time-varying treatment \( \bar{A} \), time-varying mediator-confounders \( \bar{L} \), and outcome \( Y \), where each \( L_t \) is affected by prior treatment \( A_{t-1} \) and affects subsequent treatment \( A_t \) and the outcome \( Y \). Then a regression of \( Y \) on \( \bar{A} \) and \( \bar{L} \) (adjusting for all time-varying confounders) does not in general recover the causal effect of \( \bar{A} \) on \( Y \). Specifically, the regression coefficient on \( A_t \) is biased due to two competing biases: (a) failure to adjust for confounding and (b) introduction of collider bias by conditioning on \( L_t \), which is a descendant of \( A_{t-1} \).
</div>

This theorem is the fundamental theoretical justification for the G-methods (G-formula, IPTW-MSMs, G-estimation of SNMs) over standard regression in longitudinal settings with time-varying confounders.

# Chapter 10: Mediation

## Total, Direct, and Indirect Effects

When we ask not only whether a treatment causes an outcome but how it does so — through which intermediate pathways — we enter the domain of **mediation analysis**. The goal is to decompose the total causal effect of \( A \) on \( Y \) into a component that operates through a mediator \( M \) (the indirect effect) and a component that operates through other pathways (the direct effect).

In the potential outcomes framework, the **natural direct effect (NDE)** and **natural indirect effect (NIE)** provide a precise decomposition.

<div class="definition">
<strong>Natural Direct and Indirect Effects (Pearl, 2001; Robins & Greenland, 1992).</strong> Define \( Y^{a,m} \) as the potential outcome when treatment is set to \( A = a \) and mediator is set to \( M = m \), and let \( M^a \) be the potential mediator value under treatment \( A = a \). The <em>natural direct effect</em> of changing \( A \) from 0 to 1 (with the mediator fixed at its natural value under \( A = 0 \)) is

\[ \text{NDE} = E\!\left[Y^{1, M^0} - Y^{0, M^0}\right]. \]

The <em>natural indirect effect</em> is

\[ \text{NIE} = E\!\left[Y^{1, M^1} - Y^{1, M^0}\right]. \]

The total effect decomposes as \( \text{TE} = \text{NDE} + \text{NIE} \).
</div>

The identification of natural direct and indirect effects requires strong assumptions beyond those needed for total effect identification: we need no unmeasured confounding of (a) the \( A \)–\( Y \) relationship, (b) the \( A \)–\( M \) relationship, (c) the \( M \)–\( Y \) relationship given \( A \), and (d) no \( A \)–\( M \) interaction mediated by \( L \) (the "cross-world" independence assumption or "no unmeasured mediator-outcome confounders affected by treatment" assumption). The last condition is often stated as: there is no variable \( L \) that is a common cause of \( M \) and \( Y \) and is itself affected by \( A \).

## Identification and the Product Method

Under the four assumptions above, natural direct and indirect effects can be identified from the observed data. For a linear structural equation model (no interactions), the identification is particularly simple and corresponds to the classical **product method** (or difference method):

\[
  \text{NIE} = \alpha_A \cdot \beta_M,
\]

where \( \alpha_A \) is the coefficient of \( A \) in a regression of \( M \) on \( A \) and covariates \( L \), and \( \beta_M \) is the coefficient of \( M \) in a regression of \( Y \) on \( A \), \( M \), and \( L \). This product formula is the basis of the Baron-Kenny (1986) causal steps approach, though that approach conflates identification conditions with testing conditions in ways that have since been clarified.

<div class="example">
<strong>Mediation by inflammation.</strong> We are interested in the effect of physical activity (\( A \)) on cardiovascular disease (\( Y \)) and whether this effect is mediated by systemic inflammation (\( M \), measured by C-reactive protein level). We fit: (1) a regression of \( M \) on \( A \) and baseline covariates (age, sex, BMI, smoking), obtaining \( \hat{\alpha}_A \); and (2) a regression of \( Y \) on \( A \), \( M \), and the same covariates, obtaining \( \hat{\beta}_M \). The estimated indirect effect is \( \hat{\alpha}_A \times \hat{\beta}_M \). Standard errors for the indirect effect are computed via the delta method or bootstrap. The proportion mediated is estimated as \( \text{NIE}/\text{TE} \).
</div>

## Sensitivity Analysis for Mediation

Because the identification of natural effects requires untestable cross-world independence assumptions, sensitivity analysis is essential. VanderWeele & Chiba (2014) derived bounds on the natural indirect effect under violations of the assumption that there are no unmeasured mediator-outcome confounders affected by treatment. These sensitivity parameters quantify how large unmeasured confounding would need to be to nullify the estimated indirect effect.

# Chapter 11: Interaction

## Effect Modification versus Interaction

The terms **effect modification** and **interaction** are often used interchangeably in epidemiology, but they have distinct technical meanings. Effect modification refers to the variation in the effect of a treatment \( A \) on \( Y \) across strata of a third variable \( V \); it is a property of the causal effect in a given population. Interaction refers to the joint effect of two treatments \( A_1 \) and \( A_2 \) being different from what would be expected based on their individual effects; it is a property of the causal mechanism.

<div class="definition">
<strong>Additive and Multiplicative Interaction.</strong> Let \( Y^{a_1, a_2} \) denote the potential outcome when \( A_1 = a_1 \) and \( A_2 = a_2 \). The <em>interaction contrast</em> on the additive scale is

\[ IC = E[Y^{1,1}] - E[Y^{1,0}] - E[Y^{0,1}] + E[Y^{0,0}]. \]

If \( IC \neq 0 \), there is additive interaction (also called departurefrom additivity or super-additivity/sub-additivity). Multiplicative interaction is present when

\[ \frac{E[Y^{1,1}]}{E[Y^{0,0}]} \neq \frac{E[Y^{1,0}]}{E[Y^{0,0}]} \times \frac{E[Y^{0,1}]}{E[Y^{0,0}]}. \]

Additive interaction is more relevant for public health decisions (synergy of interventions), while multiplicative interaction is more commonly reported in epidemiology.
</div>

## Synergism, Antagonism, and Public Health Relevance

VanderWeele & Robins (2007, 2008) showed that **biological synergism** (the joint effect of two exposures exceeds the sum of individual effects through a mechanistic pathway involving both) is implied by, but does not imply, additive interaction. They derived the **sufficient cause interaction** framework, which provides a rigorous basis for claims about mechanistic interaction from population-level data.

The public health implications of additive versus multiplicative interaction are important. If two interventions have positive additive interaction (super-additivity), then targeting individuals with both risk factors yields greater absolute benefit than the sum of individual benefits; the joint intervention is synergistic from a population perspective. If interaction is only multiplicative (not additive), the absolute benefit of joint intervention equals the sum of individual absolute benefits. Rothman's RERI (relative excess risk due to interaction) is the standard measure of additive interaction on the risk difference scale:

\[
  \text{RERI} = RR_{11} - RR_{10} - RR_{01} + 1,
\]

where \( RR_{ab} = \Pr(Y = 1 \mid A_1 = a, A_2 = b)/\Pr(Y = 1 \mid A_1 = 0, A_2 = 0) \). A positive RERI indicates super-additive interaction; negative indicates sub-additive.

## Effect Modification in Randomized Trials and Observational Studies

In a randomized trial, the heterogeneous treatment effect (HTE) across subgroups is estimated by including treatment-by-subgroup interaction terms in the outcome regression. This is a well-powered test only when the trial was designed with sufficient sample size for subgroup analyses; post hoc subgroup analyses in underpowered trials are notoriously unreliable.

In observational studies, effect modification analysis faces the additional complication that the variable \( V \) may itself be a confounder or mediator. If \( V \) is a pre-exposure variable unaffected by treatment, then stratum-specific effect estimates can be obtained by stratifying on \( V \) (or equivalently, including the \( A \times V \) interaction in a propensity-score-adjusted outcome regression). If \( V \) is post-treatment, interpretation requires the mediation framework of Chapter 10.

<div class="remark">
The distinction between effect modification (a population-level statistical phenomenon) and mechanistic interaction (a statement about individual-level causal processes) is fundamental. The former can be identified from observational data under exchangeability assumptions; the latter is much harder to establish without experimental data. VanderWeele's <em>Explanation in Causal Inference</em> (2015) provides a comprehensive modern treatment of both concepts.
</div>

---

# Appendix: Key Assumptions and Identification Results

The following table summarizes the identification assumptions introduced throughout this course.

| Setting | Exchangeability | Positivity | Consistency | Additional |
|---|---|---|---|---|
| Point treatment, RCT | Marginal: \( Y^a \perp\!\!\!\perp A \) (by design) | \( \Pr(A=a) > 0 \) (by design) | SUTVA | — |
| Point treatment, observational | Conditional: \( Y^a \perp\!\!\!\perp A \mid L \) | \( \Pr(A=a \mid L) > 0 \) a.s. | SUTVA | Back-door set valid |
| Longitudinal, MSM | Sequential: \( Y^{\bar{a}} \perp\!\!\!\perp A_t \mid \bar{A}_{t-1}, \bar{L}_t \) | Sequential positivity | Longitudinal consistency | — |
| IV estimation | \( Z \perp\!\!\!\perp U \) | \( Z \not\perp\!\!\!\perp A \) | SUTVA | Exclusion restriction, monotonicity |
| Mediation | Exchangeability for \( A\text{-}Y \), \( A\text{-}M \), \( M\text{-}Y \) | Positivity for all | Consistency | No treatment-induced \( M\text{-}Y \) confounder |

<div class="remark">
A central lesson of this course is that causal inference always requires assumptions that go beyond what the data alone can verify. The scientific credibility of a causal analysis rests on (a) the plausibility of the identifying assumptions, argued from subject-matter knowledge and supported by sensitivity analysis; (b) the technical validity of the estimation method, which must be consistent under the chosen identification strategy; and (c) transparency in reporting, so that readers can evaluate whether the assumptions are defensible in the specific scientific context. DAGs are an invaluable tool for the first task; semiparametric efficiency theory for the second; and the reporting guidelines of modern epidemiology (STROBE, CONSORT) for the third.
</div>

---

# Appendix: R and SAS Implementation Notes

Throughout the course, several R packages and SAS procedures are central to the implementation of the methods discussed.

For propensity score estimation and inverse probability weighting, the `WeightIt` and `MatchIt` packages in R provide comprehensive support for propensity score models, diagnostics (standardized mean differences, Love plots), and weighted analyses. The `ipw` package specializes in IPTW for marginal structural models with time-varying treatments. For doubly robust estimation, the `AIPW` package implements the augmented IPW estimator with cross-fitting using arbitrary machine learning estimators for nuisance parameters.

The G-formula for longitudinal data is implemented in the `gfoRmula` package, which supports parametric implementations of the G-computation formula for observational data with time-varying treatments, mediators, and competing events. For causal mediation analysis, the `mediation` package implements the Imai, Keele & Tingley (2010) framework, and `CMAverse` provides a unified interface for multiple mediation estimators.

For instrumental variables, the `AER` (Applied Econometrics with R) package provides the `ivreg` function for two-stage least squares, while `ivpack` provides heteroskedasticity-robust and cluster-robust standard errors. Mendelian randomization analyses are supported by the `MendelianRandomization` and `TwoSampleMR` packages.

In SAS, `PROC LOGISTIC` is used for propensity score estimation, `PROC GENMOD` with `WEIGHT` statement for IPTW analyses, and `PROC SURVEYREG`/`PROC SURVEYLOGISTIC` for analyses that account for survey sampling weights. `PROC LIFEREG` and `PROC PHREG` handle survival outcomes, with the latter supporting time-varying covariates essential for longitudinal analyses.

Simulation studies are an essential pedagogical tool for understanding the finite-sample behavior of causal estimators. A well-designed simulation should (a) specify a data-generating process (DGP) consistent with a DAG, (b) introduce confounding, effect modification, or other complications of interest, (c) implement multiple estimation strategies, and (d) compare estimators on bias, variance, mean squared error, and confidence interval coverage under both correctly specified and misspecified models. The distinction between bias under correct specification and robustness to misspecification is often more illuminating than asymptotic efficiency calculations alone.
