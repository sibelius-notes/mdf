---
title: "STAT 337: Introduction to Biostatistics"
subjects: "STAT"
prof: "Alla Slynko"
---

## Sources and References

**Textbook** — Kestenbaum, B. (2019), *Epidemiology and Biostatistics: An Introduction to Clinical Research*
**Supplementary** — Szklo and Nieto, *Epidemiology: Beyond the Basics*; Rothman, *Epidemiology: An Introduction*
**Online resources** — Johns Hopkins Bloomberg School of Public Health OpenCourseWare; MIT OCW Epidemiology materials

# Chapter 1: Introduction to Biostatistics

## 1.1 What Is Biostatistics?

Biostatistics is the application of statistical reasoning to problems in medicine, public health, and biology. It provides the quantitative backbone for evidence-based medicine: every claim about whether a drug works, whether a risk factor causes disease, or whether a screening test is accurate ultimately rests on biostatistical methods.

The field sits at the intersection of three disciplines. Epidemiology asks "who gets sick and why?" Statistics asks "how do we draw reliable conclusions from data?" Clinical medicine asks "what should we do for this patient?" Biostatistics supplies the formal tools that allow epidemiologists and clinicians to answer their questions with measured confidence.

<div class="definition">
<strong>Epidemiology</strong> is the study of the distribution and determinants of disease frequency in human populations. It seeks to identify who is affected, where disease occurs, when it arises, and why certain groups are at higher risk.
</div>

## 1.2 Populations and Samples

A central distinction in all of statistics is between a population and a sample. In biostatistics, the population is the complete collection of individuals about whom we wish to draw conclusions. A sample is a subset of that population that we actually observe.

<div class="definition">
<strong>Target population:</strong> the entire group of individuals to whom we wish to generalize our findings (e.g., all adults in Canada with type 2 diabetes).

<strong>Study population:</strong> the group from which participants are actually drawn (e.g., patients at a particular hospital clinic).

<strong>Sample:</strong> the individuals who are enrolled and provide data.
</div>

The validity of any biostatistical study depends on how well the sample represents the target population. Selection bias arises when the study population differs systematically from the target population in ways that affect the outcome of interest.

## 1.3 Types of Medical Data

Medical research generates several kinds of data, each requiring different statistical techniques.

| Data Type | Description | Examples |
|---|---|---|
| Nominal (categorical) | Unordered categories | Blood type (A, B, AB, O); sex (male, female) |
| Ordinal | Ordered categories without equal spacing | Cancer stage (I, II, III, IV); pain scale (mild, moderate, severe) |
| Discrete numerical | Counts taking integer values | Number of hospitalizations; parity (number of live births) |
| Continuous numerical | Measurements on a continuous scale | Blood pressure (mmHg); serum cholesterol (mg/dL); BMI |
| Time-to-event (survival) | Time until an event occurs, possibly censored | Time from diagnosis to death; time from surgery to recurrence |

Understanding the type of data is the first step in choosing an appropriate analysis. Nominal and ordinal data call for contingency-table methods and nonparametric tests; continuous data often permit parametric approaches such as t-tests and linear regression; time-to-event data require survival analysis techniques.

## 1.4 Descriptive Statistics

Before any formal inference, a researcher must describe the data. The two essential features of any distribution are its centre (location) and spread (variability).

### Measures of Centre

The sample mean of \( n \) observations \( x_1, x_2, \ldots, x_n \) is

\[
\bar{x} = \frac{1}{n}\sum_{i=1}^{n} x_i.
\]

The sample median is the middle value when observations are ranked from smallest to largest. For an odd number of observations it is the \( \frac{n+1}{2} \)-th order statistic; for an even number it is the average of the two central values.

When the distribution is symmetric, the mean and median coincide. When the distribution is skewed (as is common with medical costs or hospital lengths of stay), the median is often more informative because it is resistant to extreme values.

### Measures of Spread

The sample variance is

\[
s^2 = \frac{1}{n-1}\sum_{i=1}^{n}(x_i - \bar{x})^2,
\]

and the sample standard deviation is \( s = \sqrt{s^2} \). The interquartile range (IQR) is defined as \( Q_3 - Q_1 \), where \( Q_1 \) and \( Q_3 \) are the 25th and 75th percentiles respectively.

For skewed data, the IQR is preferred over the standard deviation for the same reason the median is preferred over the mean: it is robust to outliers.

## 1.5 Graphical Displays

Visual summaries are indispensable in biostatistics. The most commonly used displays include:

- Histograms and frequency polygons for continuous data, showing the shape of the distribution (symmetric, skewed, bimodal).
- Box plots, which display the median, IQR, and potential outliers, enabling rapid comparison across groups.
- Bar charts for categorical data, displaying the frequency or proportion in each category.
- Scatter plots for examining the relationship between two continuous variables (e.g., age versus systolic blood pressure).
- Kaplan-Meier curves for survival data, showing the estimated probability of surviving past each time point.

<div class="remark">
A well-chosen graph can reveal patterns that summary statistics miss. Always plot the data before computing any test statistic.
</div>

---

# Chapter 2: Incidence, Prevalence, and Standardization of Rates

## 2.1 Measuring Disease Frequency

Quantifying how often disease occurs is the starting point of epidemiology. The two fundamental measures are prevalence and incidence.

<div class="definition">
<strong>Prevalence</strong> is the proportion of a population that has a particular disease or condition at a specified point in time (point prevalence) or during a specified period (period prevalence).

\[
\text{Prevalence} = \frac{\text{Number of existing cases at a given time}}{\text{Total population at that time}}
\]
</div>

<div class="definition">
<strong>Incidence rate</strong> (also called incidence density or person-time rate) measures the rate at which new cases of disease occur in a population over time.

\[
\text{Incidence rate} = \frac{\text{Number of new cases during a time period}}{\text{Total person-time at risk during that period}}
\]
The units are typically expressed as cases per person-year (or per 1,000 person-years, per 100,000 person-years, etc.).
</div>

<div class="definition">
<strong>Cumulative incidence</strong> (also called incidence proportion or attack rate) is the proportion of an initially disease-free population that develops disease during a specified time period.

\[
\text{Cumulative incidence} = \frac{\text{Number of new cases during a time period}}{\text{Population at risk at the start of the period}}
\]
Unlike the incidence rate, cumulative incidence is dimensionless (a proportion between 0 and 1) and requires that the population at risk be followed for the entire time period.
</div>

### Relationship Between Prevalence and Incidence

Under steady-state conditions (constant incidence rate \( I \) and constant average duration of disease \( D \)), prevalence and incidence are related by the approximation

\[
P \approx I \times D,
\]

where \( P \) is the prevalence. This identity shows that prevalence can be high either because the disease is common (high incidence) or because it lasts a long time (high duration), or both.

<div class="example">
<strong>Example: HIV prevalence and incidence.</strong> Suppose a population of 500,000 has an HIV incidence rate of 2 per 1,000 person-years and the average duration of living with HIV (with treatment) is 25 years. The expected prevalence is approximately

\[
P \approx 0.002 \times 25 = 0.05 = 5\%.
\]
This illustrates why improved treatment (increasing \(D\)) can raise prevalence even as incidence declines.
</div>

## 2.2 Crude Rates

A crude rate is a summary measure computed for an entire population without adjusting for differences in the composition of the population (e.g., age, sex).

\[
\text{Crude death rate} = \frac{\text{Total number of deaths in a year}}{\text{Mid-year population}} \times 1{,}000
\]

Crude rates are simple to compute and directly reflect the actual experience of a population. However, they can be misleading when comparing populations with different age structures. A region with many elderly residents will have a higher crude death rate than a younger region, even if age-specific death rates are identical.

<div class="example">
<strong>Example: Comparing crude mortality.</strong> Country A has a crude death rate of 12 per 1,000, while Country B has a crude death rate of 7 per 1,000. Country A has a much older population. After age-adjustment, Country B may actually have higher age-specific mortality rates. The crude rates are confounded by the different age distributions.
</div>

## 2.3 Direct Standardization

Direct standardization removes the confounding effect of age (or another variable) by computing the rate that each population would have experienced if it had the same age distribution as a chosen standard population.

<div class="definition">
<strong>Directly standardized rate:</strong> Choose a standard population with age-specific weights \( w_i \) (the proportion of the standard population in age group \( i \)). Let \( r_i \) be the age-specific rate in the study population for age group \( i \). Then

\[
\text{Directly standardized rate} = \sum_{i} w_i \cdot r_i.
\]
</div>

The standard population may be a real population (e.g., the 2011 Canadian Census population, the WHO World Standard Population) or a combined total of the populations being compared.

### Steps for Direct Standardization

1. Obtain age-specific rates \( r_i \) for each population being compared.
2. Choose a standard population and compute the proportion \( w_i \) in each age stratum.
3. For each population, multiply each age-specific rate by the corresponding weight and sum: \( \text{ASR} = \sum_i w_i \cdot r_i \).
4. Compare the adjusted rates across populations.

<div class="example">
<strong>Worked Example: Direct age-standardization of mortality.</strong>

Consider two cities. City X has a young population; City Y has an old population. We use a standard population to compare their mortality fairly.

| Age Group | Standard Pop. (\(w_i\)) | City X Rate (per 1,000) | City Y Rate (per 1,000) |
|---|---|---|---|
| 0--34 | 0.40 | 1.0 | 1.5 |
| 35--64 | 0.35 | 4.0 | 3.5 |
| 65+ | 0.25 | 30.0 | 25.0 |

Directly standardized rate for City X:

\[
(0.40)(1.0) + (0.35)(4.0) + (0.25)(30.0) = 0.4 + 1.4 + 7.5 = 9.3 \text{ per 1,000}
\]

Directly standardized rate for City Y:

\[
(0.40)(1.5) + (0.35)(3.5) + (0.25)(25.0) = 0.6 + 1.225 + 6.25 = 8.075 \text{ per 1,000}
\]

After standardization, City Y has a lower mortality rate than City X, even though City Y's crude rate might have been higher due to its older age structure.
</div>

### Advantages and Limitations

Direct standardization produces rates that are easy to interpret and compare. However, it requires reliable age-specific rates in each study population, which may be unstable when the study population is small or when events are rare in certain age groups.

## 2.4 Indirect Standardization and the SMR

When age-specific rates in the study population are unreliable (because the population is small), indirect standardization is used instead. Rather than applying the study population's rates to a standard population, indirect standardization applies the standard population's rates to the study population's age structure.

<div class="definition">
<strong>Indirect standardization</strong> compares the observed number of events in the study population with the number that would be expected if the study population experienced the age-specific rates of a reference (standard) population.

<strong>Expected number of events:</strong>

\[
E = \sum_{i} n_i \cdot R_i,
\]
where \( n_i \) is the number of persons in age group \( i \) of the study population and \( R_i \) is the age-specific rate in the reference population for age group \( i \).
</div>

<div class="definition">
<strong>Standardized Mortality Ratio (SMR):</strong>

\[
\text{SMR} = \frac{O}{E} \times 100,
\]
where \( O \) is the observed number of deaths and \( E \) is the expected number. An SMR of 100 indicates that the study population experiences the same mortality as the reference population. An SMR greater than 100 indicates excess mortality; an SMR less than 100 indicates lower-than-expected mortality.
</div>

<div class="example">
<strong>Worked Example: SMR for an occupational cohort.</strong>

A factory employs 5,000 workers. Over 5 years, 45 deaths are observed. Using national age-specific death rates applied to the factory's age distribution, the expected number of deaths is 30.

\[
\text{SMR} = \frac{45}{30} \times 100 = 150.
\]

The factory workers experienced 50% more deaths than expected based on national rates. This excess might be due to occupational exposures, but the healthy worker effect (whereby employed persons tend to be healthier than the general population) means the true excess relative to comparable workers could be even larger.
</div>

### When to Use Direct vs. Indirect Standardization

| Feature | Direct | Indirect |
|---|---|---|
| Requires age-specific rates in study pop. | Yes | No |
| Produces an adjusted rate | Yes | No (produces a ratio, the SMR) |
| Suitable for small populations | No | Yes |
| Allows direct comparison between study populations | Yes | Not straightforward (different expected values) |

<div class="remark">
The SMR is not a rate; it is a ratio. Strictly speaking, two SMRs computed for different study populations are not directly comparable because they each use their own age structure to compute the expected counts. Comparisons are valid only when the age structures of the study populations are similar.
</div>

---

# Chapter 3: Medical Study Design

## 3.1 Overview of Study Designs

Epidemiological studies can be broadly classified as observational or experimental. In observational studies, the investigator merely observes exposures and outcomes without intervening. In experimental studies (clinical trials), the investigator assigns exposures (treatments) to participants.

The major observational designs, in order of increasing strength of evidence, are:

1. Cross-sectional studies
2. Case-control studies
3. Cohort studies (prospective and retrospective)

Each design involves trade-offs between cost, time, and the strength of causal inference it supports.

## 3.2 Cross-Sectional Studies

A cross-sectional study measures exposure and disease status simultaneously at a single point in time (or over a short period). It provides a snapshot of the population.

<div class="definition">
<strong>Cross-sectional study:</strong> A study in which exposure and outcome are assessed at the same time in a defined population. It measures prevalence, not incidence.
</div>

### Strengths and Limitations

Cross-sectional studies are relatively quick and inexpensive. They are useful for estimating disease prevalence and for generating hypotheses. However, because exposure and disease are measured simultaneously, it is generally impossible to establish temporal sequence: we cannot determine whether the exposure preceded the disease or vice versa. This makes causal inference weak.

<div class="example">
<strong>Example.</strong> A cross-sectional survey of 10,000 adults in Ontario finds that 18% of those with low physical activity levels have type 2 diabetes, compared with 6% of those with high physical activity. While this suggests an association, we cannot tell whether inactivity led to diabetes or whether diabetes led to reduced activity (reverse causation).
</div>

### Measures of Association in Cross-Sectional Studies

The prevalence ratio (PR) and the prevalence odds ratio (POR) are used:

\[
\text{PR} = \frac{\text{Prevalence in exposed}}{\text{Prevalence in unexposed}}, \qquad \text{POR} = \frac{\text{Odds of disease in exposed}}{\text{Odds of disease in unexposed}}.
\]

## 3.3 Cohort Studies

A cohort study follows a group of individuals over time to observe who develops the outcome of interest. Participants are classified by exposure status at baseline, and outcomes are ascertained during follow-up.

<div class="definition">
<strong>Prospective cohort study:</strong> Participants are enrolled and their exposures are measured at baseline. They are then followed forward in time, and the occurrence of new disease (incidence) is recorded.

<strong>Retrospective (historical) cohort study:</strong> Uses existing records to identify a cohort defined at some point in the past, ascertains their exposures from historical records, and follows them forward to the present (or a later point) to determine outcomes.
</div>

<div class="example">
<strong>The Framingham Heart Study</strong> is one of the most influential prospective cohort studies in medical history. Launched in 1948, it enrolled over 5,200 adult residents of Framingham, Massachusetts, who were free of cardiovascular disease at baseline. Participants have been examined approximately every two years. Over the decades, the study identified high blood pressure, high cholesterol, smoking, obesity, and diabetes as major risk factors for cardiovascular disease. By coining the term "risk factor," the Framingham Heart Study fundamentally changed the practice of preventive medicine.
</div>

### Measures of Association in Cohort Studies

The primary measures are the relative risk (risk ratio) and the risk difference.

<div class="definition">
<strong>Relative Risk (Risk Ratio):</strong> the ratio of the cumulative incidence (risk) in the exposed group to the cumulative incidence in the unexposed group.

Consider a standard 2x2 table:

| | Disease + | Disease -- | Total |
|---|---|---|---|
| Exposed | a | b | a + b |
| Unexposed | c | d | c + d |

\[
\text{RR} = \frac{a/(a+b)}{c/(c+d)}
\]

An RR of 1 indicates no association. An RR greater than 1 indicates that exposure is associated with increased risk; an RR less than 1 indicates a protective association.
</div>

<div class="definition">
<strong>Risk Difference (RD):</strong> the absolute difference in risk between the exposed and unexposed groups.

\[
\text{RD} = \frac{a}{a+b} - \frac{c}{c+d}
\]
The risk difference is also called the attributable risk among the exposed when it is positive.
</div>

<div class="definition">
<strong>Attributable Risk Percent (AR%):</strong> the proportion of risk in the exposed group that is attributable to the exposure.

\[
\text{AR\%} = \frac{\text{RR} - 1}{\text{RR}} \times 100\%
\]

<strong>Population Attributable Risk Percent (PAR%):</strong> the proportion of disease in the total population that is attributable to the exposure.

\[
\text{PAR\%} = \frac{p_e(\text{RR} - 1)}{1 + p_e(\text{RR} - 1)} \times 100\%
\]
where \( p_e \) is the prevalence of exposure in the population.
</div>

<div class="example">
<strong>Worked Example: Relative risk and attributable risk.</strong>

A prospective cohort study follows 2,000 smokers and 5,000 non-smokers for 10 years. During follow-up, 80 smokers and 50 non-smokers develop lung cancer.

| | Lung Cancer + | Lung Cancer -- | Total |
|---|---|---|---|
| Smokers | 80 | 1,920 | 2,000 |
| Non-smokers | 50 | 4,950 | 5,000 |

Risk in smokers: \( 80/2000 = 0.040 \)

Risk in non-smokers: \( 50/5000 = 0.010 \)

\[
\text{RR} = \frac{0.040}{0.010} = 4.0
\]

Smokers have 4 times the risk of developing lung cancer compared to non-smokers.

\[
\text{RD} = 0.040 - 0.010 = 0.030
\]

The excess risk attributable to smoking is 30 per 1,000 over 10 years.

\[
\text{AR\%} = \frac{4.0 - 1}{4.0} \times 100\% = 75\%
\]

Among smokers who develop lung cancer, 75% of their risk is attributable to smoking.
</div>

## 3.4 Hypothesis Testing for 2x2 Tables

When comparing proportions across two groups in a 2x2 table, the chi-squared test is the standard approach.

<div class="definition">
<strong>Pearson's chi-squared test</strong> for a 2x2 table tests the null hypothesis that disease risk is the same in the exposed and unexposed groups (i.e., \( H_0: \text{RR} = 1 \)).

The test statistic is

\[
\chi^2 = \sum_{\text{cells}} \frac{(O_i - E_i)^2}{E_i},
\]
where \( O_i \) is the observed count in each cell and \( E_i \) is the expected count under the null hypothesis of no association. Under \( H_0 \), this statistic follows a chi-squared distribution with 1 degree of freedom.
</div>

For small samples (any expected cell count less than 5), Fisher's exact test should be used instead.

<div class="example">
<strong>Example: Chi-squared test.</strong>

Using the smoking/lung cancer data above:

Expected count for smokers with lung cancer under \( H_0 \):

\[
E_{11} = \frac{(2000)(130)}{7000} = 37.14
\]

The full chi-squared computation yields \( \chi^2 = 38.46 \), which far exceeds the critical value of 3.84 at the 5% significance level (\( df = 1 \)). We reject \( H_0 \) and conclude there is a statistically significant association between smoking and lung cancer.
</div>

### Confidence Interval for the Relative Risk

A 95% confidence interval for \( \ln(\text{RR}) \) is

\[
\ln(\text{RR}) \pm 1.96 \sqrt{\frac{1}{a} - \frac{1}{a+b} + \frac{1}{c} - \frac{1}{c+d}}.
\]

Exponentiating the endpoints gives the 95% CI for RR. If the interval does not contain 1, the association is statistically significant at the 5% level.

---

# Chapter 4: Causation, Confounding, and Regression

## 4.1 Causation in Epidemiology

Establishing that an exposure causes a disease is one of the most important and difficult goals in epidemiology. Statistical association alone does not prove causation. In 1965, Sir Austin Bradford Hill proposed nine considerations (often called "criteria") for evaluating whether an observed association is causal.

<div class="definition">
<strong>The Bradford Hill Considerations:</strong>

<ol>
<li><strong>Strength:</strong> A strong association (large RR or OR) is more likely to be causal, since a large effect is harder to explain by bias or confounding alone.</li>
<li><strong>Consistency:</strong> The association has been observed repeatedly in different populations, settings, and study designs.</li>
<li><strong>Specificity:</strong> The exposure leads to a specific outcome (though multi-causality is now recognized as the norm).</li>
<li><strong>Temporality:</strong> The exposure must precede the disease. This is the only criterion universally regarded as necessary.</li>
<li><strong>Biological gradient:</strong> A dose-response relationship exists: increasing levels of exposure lead to increasing risk of disease.</li>
<li><strong>Plausibility:</strong> The association is biologically plausible given current knowledge.</li>
<li><strong>Coherence:</strong> The causal interpretation does not conflict with known facts about the natural history and biology of the disease.</li>
<li><strong>Experiment:</strong> Experimental evidence (e.g., from a randomized trial or a natural experiment) supports the causal hypothesis.</li>
<li><strong>Analogy:</strong> Similar exposures are known to produce similar effects.</li>
</ol>
</div>

<div class="remark">
Hill himself emphasized that these were <em>viewpoints</em> to consider, not a rigid checklist. No single criterion (except temporality) is either necessary or sufficient to establish causation. Modern causal inference has supplemented these considerations with formal frameworks such as directed acyclic graphs (DAGs), the potential outcomes framework, and sufficient-component cause models.
</div>

<div class="example">
<strong>Example: Doll and Hill's Smoking Studies.</strong>

The case for smoking causing lung cancer was built over decades, exemplifying the Bradford Hill considerations.

<strong>Strength:</strong> Doll and Hill's 1950 case-control study found that heavy smokers (25+ cigarettes/day) had 25 times the risk of lung cancer compared to non-smokers.

<strong>Consistency:</strong> The association was replicated in numerous studies across multiple countries.

<strong>Temporality:</strong> The prospective British Doctors' Study (1951 onwards), which followed 34,440 male physicians, confirmed that smoking preceded lung cancer development.

<strong>Biological gradient:</strong> Risk increased with the number of cigarettes smoked per day.

<strong>Experiment:</strong> Cessation of smoking was shown to reduce lung cancer risk over time.
</div>

## 4.2 Confounding

Confounding occurs when an extraneous variable distorts the association between the exposure and the outcome.

<div class="definition">
A variable \( C \) is a <strong>confounder</strong> of the relationship between exposure \( E \) and outcome \( D \) if it satisfies three conditions:
<ol>
<li>\( C \) is associated with \( E \) (in the study population).</li>
<li>\( C \) is an independent risk factor for \( D \) (i.e., it affects \( D \) even among the unexposed).</li>
<li>\( C \) is not on the causal pathway between \( E \) and \( D \) (i.e., it is not a mediator).</li>
</ol>
</div>

<div class="example">
<strong>Example: Coffee drinking and lung cancer.</strong>

Suppose a study finds that coffee drinkers have a higher rate of lung cancer than non-coffee drinkers. However, coffee drinkers are more likely to smoke. Smoking is associated with coffee drinking (condition 1), smoking causes lung cancer independently (condition 2), and smoking is not a consequence of drinking coffee on the causal pathway to lung cancer (condition 3). Smoking confounds the coffee-lung cancer association. After adjusting for smoking, the association between coffee and lung cancer may disappear entirely.
</div>

### Detecting Confounding

A practical rule of thumb: if adjusting for a potential confounder changes the crude measure of association by more than 10%, confounding is present. Formally, compare the crude (unadjusted) RR or OR to the stratum-specific or adjusted estimates. If they differ meaningfully, confounding was present.

## 4.3 Effect Modification (Interaction)

Effect modification occurs when the magnitude of the association between exposure and outcome differs across levels of a third variable. Unlike confounding, effect modification is a biological phenomenon of interest, not a bias to be eliminated.

<div class="definition">
<strong>Effect modification</strong> (also called interaction) is present when the effect of the exposure on the outcome varies across strata of a third variable. For example, a drug may be effective in younger patients but not in older patients.
</div>

<div class="remark">
The key distinction: confounding is a nuisance to be controlled; effect modification is a finding to be reported. When effect modification is present, one should report stratum-specific estimates rather than a single pooled estimate.
</div>

### Distinguishing Confounding from Effect Modification

Given stratum-specific estimates of the measure of association (e.g., \( \text{RR}_1 \) and \( \text{RR}_2 \) for two strata of a third variable):

- If \( \text{RR}_1 \approx \text{RR}_2 \) but both differ from the crude RR, then confounding is present (but not effect modification). Report the adjusted estimate.
- If \( \text{RR}_1 \neq \text{RR}_2 \), then effect modification is present. Report the stratum-specific estimates.

## 4.4 Stratified Analysis

Stratification is the most transparent method for dealing with confounding. The analysis is conducted separately within strata of the confounding variable, and then a summary adjusted estimate is computed.

<div class="definition">
<strong>Mantel-Haenszel weighted estimate of the common relative risk.</strong> For \( K \) strata, each with a 2x2 table having cells \( a_k, b_k, c_k, d_k \) and total \( N_k \):

\[
\text{RR}_{MH} = \frac{\sum_{k=1}^{K} \frac{a_k (c_k + d_k)}{N_k}}{\sum_{k=1}^{K} \frac{c_k (a_k + b_k)}{N_k}}
\]
This provides a weighted average of the stratum-specific relative risks, with weights that account for the sizes of the strata.
</div>

## 4.5 Introduction to Multiple Linear Regression

Multiple linear regression provides a more flexible alternative to stratification for controlling confounding, especially when there are many confounders or when confounders are continuous.

<div class="definition">
The <strong>multiple linear regression model</strong> for an outcome \( Y \) with predictors \( X_1, X_2, \ldots, X_p \) is

\[
Y = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \cdots + \beta_p X_p + \varepsilon,
\]
where \( \varepsilon \sim N(0, \sigma^2) \). Each coefficient \( \beta_j \) represents the change in the expected value of \( Y \) for a one-unit increase in \( X_j \), holding all other predictors constant.
</div>

In biostatistics, the key distinction is between crude and adjusted estimates:

- The crude estimate of the association between \( X_1 \) and \( Y \) comes from a simple regression of \( Y \) on \( X_1 \) alone.
- The adjusted estimate comes from a multiple regression that includes confounders \( X_2, \ldots, X_p \). The coefficient \( \beta_1 \) in the multiple regression represents the association between \( X_1 \) and \( Y \) after controlling for the other variables.

<div class="example">
<strong>Example: Adjusting for age in a study of blood pressure.</strong>

Suppose we regress systolic blood pressure (SBP) on daily sodium intake (\( X_1 \), in grams) and age (\( X_2 \), in years):

\[
\widehat{\text{SBP}} = 95.0 + 3.2 \cdot X_1 + 0.8 \cdot X_2
\]

Interpretation: holding age constant, each additional gram of daily sodium is associated with a 3.2 mmHg increase in SBP. Without adjusting for age (crude model), the coefficient for sodium might have been 4.5, reflecting the fact that older people tend to consume more sodium and also have higher blood pressure. The difference (4.5 vs. 3.2) reveals that age was confounding the crude association.
</div>

### Model Assumptions and Diagnostics

The assumptions of multiple linear regression are:

1. Linearity: the relationship between each predictor and the outcome is linear.
2. Independence: observations are independent of one another.
3. Homoscedasticity: the variance of the residuals is constant across levels of the predictors.
4. Normality: the residuals are approximately normally distributed.

Residual plots (residuals vs. fitted values, Q-Q plots) are used to check these assumptions.

---

# Chapter 5: Case-Control Studies

## 5.1 Design Principles

In a case-control study, the investigator starts by identifying individuals who have the disease (cases) and individuals who do not (controls), and then looks back in time to compare their past exposures.

<div class="definition">
<strong>Case-control study:</strong> An observational study that begins with the selection of cases (persons with the disease) and controls (persons without the disease), and retrospectively compares the frequency of exposure between the two groups.
</div>

Case-control studies are particularly efficient for studying rare diseases because they start by assembling a sufficient number of cases. A cohort study of a rare disease would require following an enormous population to observe enough cases.

### Selection of Cases and Controls

- Cases should be representative of all cases in the target population (or a well-defined subset). Incident cases (newly diagnosed) are preferred over prevalent cases to avoid survival bias.
- Controls should come from the same source population that gave rise to the cases. If cases come from a hospital, controls should ideally come from the same catchment area (population-based controls) or from the same hospital (hospital-based controls, with appropriate exclusions).

<div class="remark">
The fundamental principle of control selection: a control should be someone who, had they developed the disease, would have been identified as a case in the study. This is sometimes called the "would criterion."
</div>

## 5.2 The Odds Ratio

In a case-control study, we cannot directly compute the incidence of disease in exposed and unexposed groups (because we selected on disease status, not exposure). Instead, we compute the odds ratio.

<div class="definition">
<strong>Odds Ratio (OR):</strong> Using the standard 2x2 table:

| | Cases (D+) | Controls (D--) |
|---|---|---|
| Exposed (E+) | a | b |
| Unexposed (E--) | c | d |

The odds of exposure among cases is \( a/c \). The odds of exposure among controls is \( b/d \).

\[
\text{OR} = \frac{a/c}{b/d} = \frac{ad}{bc}
\]

Under the <strong>rare disease assumption</strong> (prevalence less than about 10%), the OR approximates the RR. This is because when disease is rare, \( a \ll b \) and \( c \ll d \), so \( a + b \approx b \) and \( c + d \approx d \), and

\[
\text{RR} = \frac{a/(a+b)}{c/(c+d)} \approx \frac{a/b}{c/d} = \frac{ad}{bc} = \text{OR}.
\]
</div>

<div class="example">
<strong>Worked Example: Odds ratio in a case-control study.</strong>

A case-control study investigates whether occupational asbestos exposure is associated with mesothelioma. 200 mesothelioma cases and 400 controls are enrolled.

| | Cases | Controls |
|---|---|---|
| Asbestos exposed | 120 | 80 |
| Not exposed | 80 | 320 |

\[
\text{OR} = \frac{120 \times 320}{80 \times 80} = \frac{38{,}400}{6{,}400} = 6.0
\]

The odds of asbestos exposure among cases are 6 times those among controls. Since mesothelioma is a rare disease, this OR of 6.0 closely approximates the relative risk.
</div>

## 5.3 Confidence Interval for the Odds Ratio

Since the sampling distribution of the OR is right-skewed, we work on the natural log scale where the distribution is approximately normal.

<div class="definition">
A 95% confidence interval for the OR is constructed as follows:

\[
\ln(\text{OR}) \pm 1.96 \cdot \text{SE}(\ln \text{OR}),
\]

where

\[
\text{SE}(\ln \text{OR}) = \sqrt{\frac{1}{a} + \frac{1}{b} + \frac{1}{c} + \frac{1}{d}}.
\]

Exponentiating both endpoints gives the 95% CI for the OR.
</div>

<div class="example">
<strong>Continuing the asbestos example:</strong>

\[
\ln(6.0) = 1.7918
\]

\[
\text{SE} = \sqrt{\frac{1}{120} + \frac{1}{80} + \frac{1}{80} + \frac{1}{320}} = \sqrt{0.00833 + 0.0125 + 0.0125 + 0.003125} = \sqrt{0.03646} = 0.1909
\]

\[
95\% \text{ CI for } \ln(\text{OR}): 1.7918 \pm 1.96(0.1909) = (1.4177, 2.1660)
\]

\[
95\% \text{ CI for OR}: (e^{1.4177}, e^{2.1660}) = (4.13, 8.72)
\]

Since the interval does not include 1, the association is statistically significant.
</div>

## 5.4 Mantel-Haenszel Adjusted Odds Ratio

When confounding is present, stratified analysis using the Mantel-Haenszel method provides an adjusted OR.

<div class="definition">
<strong>Mantel-Haenszel OR:</strong> For \( K \) strata, each with 2x2 table entries \( a_k, b_k, c_k, d_k \) and stratum total \( N_k \):

\[
\text{OR}_{MH} = \frac{\sum_{k=1}^{K} \frac{a_k d_k}{N_k}}{\sum_{k=1}^{K} \frac{b_k c_k}{N_k}}
\]
This is valid when the stratum-specific ORs are approximately equal (i.e., no effect modification).
</div>

<div class="definition">
<strong>Mantel-Haenszel chi-squared test:</strong>

\[
\chi^2_{MH} = \frac{\left[\sum_k \left(a_k - \frac{(a_k + b_k)(a_k + c_k)}{N_k}\right)\right]^2}{\sum_k \frac{(a_k + b_k)(c_k + d_k)(a_k + c_k)(b_k + d_k)}{N_k^2(N_k - 1)}}
\]
Under the null hypothesis of no association (after adjusting for the stratifying variable), this statistic follows a chi-squared distribution with 1 degree of freedom.
</div>

## 5.5 Matched Case-Control Studies

In a matched case-control study, each case is individually matched with one or more controls on potential confounders (e.g., age, sex). The most common design is 1:1 matching.

<div class="definition">
In a <strong>1:1 matched case-control study</strong>, we classify the matched pairs according to the exposure status of the case and the control:

| | Control Exposed | Control Unexposed |
|---|---|---|
| Case Exposed | w (concordant) | x (discordant) |
| Case Unexposed | y (discordant) | z (concordant) |

The <strong>matched OR</strong> is computed only from discordant pairs:

\[
\text{OR}_{\text{matched}} = \frac{x}{y}
\]
Concordant pairs (both exposed or both unexposed) provide no information about the association.
</div>

## 5.6 McNemar's Test

McNemar's test is used to test the null hypothesis that the matched OR equals 1 (i.e., no association between exposure and disease after accounting for matching).

<div class="definition">
<strong>McNemar's test statistic:</strong>

\[
\chi^2 = \frac{(x - y)^2}{x + y}
\]
Under \( H_0 \), this follows a chi-squared distribution with 1 degree of freedom.
</div>

<div class="example">
<strong>Worked Example: Matched case-control study of cell phone use and brain tumours.</strong>

A 1:1 matched case-control study (matched on age and sex) investigates cell phone use and brain tumours. There are 250 matched pairs.

| | Control: heavy user | Control: light user |
|---|---|---|
| Case: heavy user | 30 | 65 |
| Case: light user | 25 | 130 |

Matched OR:

\[
\text{OR} = \frac{65}{25} = 2.6
\]

McNemar's test:

\[
\chi^2 = \frac{(65 - 25)^2}{65 + 25} = \frac{1600}{90} = 17.78
\]

With 1 degree of freedom, \( p < 0.001 \). There is strong evidence that cases were more likely to be heavy cell phone users than their matched controls.
</div>

## 5.7 Logistic Regression

When there are multiple confounders or when matching on many variables is impractical, logistic regression provides a flexible modelling approach for binary outcomes.

<div class="definition">
<strong>Logistic regression model:</strong> For a binary outcome \( D \) (1 = disease, 0 = no disease) and predictors \( X_1, \ldots, X_p \):

\[
\ln\left(\frac{P(D=1)}{1 - P(D=1)}\right) = \beta_0 + \beta_1 X_1 + \cdots + \beta_p X_p
\]
The left-hand side is the log-odds (logit) of disease. The key property is that \( e^{\beta_j} \) is the <strong>adjusted odds ratio</strong> for a one-unit increase in \( X_j \), holding all other variables constant.
</div>

<div class="example">
<strong>Example: Logistic regression for CHD risk.</strong>

A logistic regression model predicting coronary heart disease (CHD) yields:

\[
\ln\left(\frac{P(\text{CHD})}{1-P(\text{CHD})}\right) = -6.0 + 0.05 \cdot \text{Age} + 0.7 \cdot \text{Smoking} + 0.02 \cdot \text{SBP}
\]

where Smoking = 1 for current smokers, 0 otherwise.

The adjusted OR for smoking:

\[
\text{OR}_{\text{smoking}} = e^{0.7} = 2.01
\]

After adjusting for age and systolic blood pressure, current smokers have approximately twice the odds of CHD compared to non-smokers.
</div>

### Advantages of Logistic Regression

1. It can adjust for many confounders simultaneously, including continuous variables.
2. It provides adjusted odds ratios with confidence intervals for each predictor.
3. It can test for interaction (effect modification) by including product terms.
4. It is the standard analytical method for case-control studies and for any study with a binary outcome.

---

# Chapter 6: Randomized Controlled Trials

## 6.1 Design Principles

The randomized controlled trial (RCT) is considered the gold standard for evaluating the efficacy of medical interventions. By randomly assigning participants to treatment or control groups, the RCT eliminates confounding (both known and unknown) in expectation.

<div class="definition">
<strong>Randomized controlled trial (RCT):</strong> An experimental study in which participants are randomly allocated to receive either the intervention under investigation or a control (placebo, standard care, or no treatment). Outcomes are compared between groups.
</div>

### Key Design Elements

The fundamental elements of an RCT are:

1. A clearly defined study population with inclusion and exclusion criteria.
2. Random allocation of participants to intervention and control groups.
3. An intervention (new treatment, vaccine, behavioural program, etc.).
4. A comparison group (placebo, active comparator, or usual care).
5. Blinding (masking) of participants, investigators, and/or outcome assessors.
6. Objective outcome measurement.
7. Adequate follow-up.

## 6.2 Randomization

Randomization is the defining feature of the RCT. It serves two purposes: (1) it eliminates selection bias in the assignment of treatments, and (2) in large trials, it tends to balance both known and unknown confounders between groups.

Common randomization methods include:

- Simple randomization: each participant is assigned by an independent random mechanism (like a coin flip), giving equal probability to each group.
- Block randomization: participants are randomized within blocks of a fixed size to ensure that the groups remain balanced throughout the trial.
- Stratified randomization: randomization is performed within strata defined by important prognostic factors (e.g., age group, disease severity) to ensure balance on these factors.

## 6.3 Blinding

Blinding (masking) prevents knowledge of treatment assignment from influencing the assessment of outcomes.

| Level | Who is blinded | Purpose |
|---|---|---|
| Single-blind | Participant only | Prevents placebo effect and reporting bias |
| Double-blind | Participant and investigator | Additionally prevents observer bias |
| Triple-blind | Participant, investigator, and data analyst | Additionally prevents analysis bias |

Double-blinding is the standard for drug trials. It is not always possible (e.g., surgical vs. medical treatment), in which case blinded outcome assessment is used.

## 6.4 Intention-to-Treat vs. Per-Protocol Analysis

<div class="definition">
<strong>Intention-to-treat (ITT) analysis:</strong> All participants are analyzed in the group to which they were randomly assigned, regardless of whether they actually received or completed the assigned treatment. This preserves the benefits of randomization and prevents bias due to selective non-compliance.

<strong>Per-protocol (PP) analysis:</strong> Only participants who completed the study according to the protocol are included. This estimates the efficacy of the treatment among compliant participants but may be biased because the reasons for non-compliance may be related to the outcome.
</div>

<div class="remark">
The CONSORT guidelines consider ITT analysis the primary analysis for RCTs. However, both ITT and PP analyses should typically be reported. The ITT analysis provides a conservative estimate of effectiveness (as it would apply in practice), while the PP analysis provides an estimate of efficacy under ideal conditions.
</div>

<div class="example">
<strong>Example: ITT vs. PP in a drug trial.</strong>

A trial randomizes 500 patients to a new drug and 500 to placebo. In the drug group, 50 patients stop taking the drug due to side effects. Under ITT analysis, all 500 are analyzed in the drug group. Under PP analysis, only the 450 who completed therapy are included. If dropouts had worse outcomes, the ITT estimate will be diluted (biased toward the null), while the PP estimate reflects the drug's effect among those who tolerated it.
</div>

## 6.5 Crossover Designs

<div class="definition">
In a <strong>crossover trial</strong>, each participant serves as their own control by receiving both the intervention and the control in sequence, with a washout period between them. The order of treatments is randomly assigned.
</div>

Advantages of crossover designs include:

- Elimination of between-subject variability, since each subject is compared to themselves.
- Smaller sample sizes are typically needed.

Limitations include:

- A sufficient washout period is required to eliminate carryover effects.
- The design is inappropriate for conditions that change over time or for treatments with permanent effects.
- Period effects (the natural course of disease changing over time) can bias results.

## 6.6 Measures of Treatment Effect in RCTs

Several measures quantify the treatment effect:

<div class="definition">
<strong>Absolute Risk Reduction (ARR):</strong>

\[
\text{ARR} = p_{\text{control}} - p_{\text{treatment}}
\]

<strong>Relative Risk Reduction (RRR):</strong>

\[
\text{RRR} = \frac{p_{\text{control}} - p_{\text{treatment}}}{p_{\text{control}}} = 1 - \text{RR}
\]

<strong>Number Needed to Treat (NNT):</strong>

\[
\text{NNT} = \frac{1}{\text{ARR}}
\]
The NNT is the number of patients who need to be treated with the intervention (instead of the control) to prevent one additional adverse outcome.
</div>

<div class="example">
<strong>Worked Example: Treatment effect in an RCT.</strong>

A trial of a new statin drug enrolls 3,000 patients at high cardiovascular risk, randomized 1:1. After 5 years:

| | MI event | No MI | Total |
|---|---|---|---|
| Statin | 90 | 1,410 | 1,500 |
| Placebo | 150 | 1,350 | 1,500 |

Risk in statin group: \( 90/1500 = 0.060 \)

Risk in placebo group: \( 150/1500 = 0.100 \)

\[
\text{ARR} = 0.100 - 0.060 = 0.040
\]

\[
\text{RRR} = \frac{0.040}{0.100} = 40\%
\]

\[
\text{NNT} = \frac{1}{0.040} = 25
\]

We need to treat 25 patients with the statin for 5 years to prevent one myocardial infarction.
</div>

## 6.7 Vaccine Efficacy and Infectious Disease Epidemiology

RCTs are the standard method for evaluating vaccines. Vaccine efficacy (VE) measures the proportionate reduction in disease incidence among vaccinated individuals compared to unvaccinated individuals.

<div class="definition">
<strong>Vaccine Efficacy (VE):</strong>

\[
\text{VE} = \frac{\text{ARR}}{\text{Risk in unvaccinated}} = 1 - \text{RR} = 1 - \frac{\text{Risk in vaccinated}}{\text{Risk in unvaccinated}}
\]
A VE of 0.80 (80%) means the vaccine reduces the risk of disease by 80% compared to no vaccination.
</div>

<div class="example">
<strong>Example: COVID-19 vaccine efficacy.</strong>

In the Pfizer-BioNTech Phase III trial (2020), approximately 21,720 participants received the vaccine and 21,728 received placebo. There were 8 COVID-19 cases in the vaccine group and 162 in the placebo group (at least 7 days after the second dose).

Risk in vaccine group: \( 8/21720 = 0.000368 \)

Risk in placebo group: \( 162/21728 = 0.007455 \)

\[
\text{VE} = 1 - \frac{0.000368}{0.007455} = 1 - 0.0494 = 0.951 = 95.1\%
\]
</div>

### Basic Concepts in Infectious Disease Epidemiology

<div class="definition">
<strong>Basic reproduction number \( R_0 \):</strong> the average number of secondary infections produced by a single infected individual in a completely susceptible population. If \( R_0 > 1 \), the infection can spread through the population; if \( R_0 < 1 \), the infection will die out.

<strong>Herd immunity threshold:</strong> the proportion of the population that must be immune to prevent sustained transmission:

\[
p_c = 1 - \frac{1}{R_0}
\]
For example, measles has \( R_0 \approx 12\text{--}18 \), giving a herd immunity threshold of approximately 92--94%.
</div>

---

# Chapter 7: Diagnostic Testing and Screening

## 7.1 Sensitivity and Specificity

Diagnostic tests are evaluated by their ability to correctly identify those with and without disease. The two fundamental properties are sensitivity and specificity.

<div class="definition">
Consider a diagnostic test applied to individuals who truly have or do not have a disease:

| | Disease Present (D+) | Disease Absent (D--) |
|---|---|---|
| Test Positive (T+) | True Positive (TP) | False Positive (FP) |
| Test Negative (T--) | False Negative (FN) | True Negative (TN) |

<strong>Sensitivity</strong> (true positive rate): the probability that the test is positive given the person has the disease.

\[
\text{Sensitivity} = \frac{\text{TP}}{\text{TP} + \text{FN}} = P(T+ \mid D+)
\]

<strong>Specificity</strong> (true negative rate): the probability that the test is negative given the person does not have the disease.

\[
\text{Specificity} = \frac{\text{TN}}{\text{FP} + \text{TN}} = P(T- \mid D-)
\]
</div>

Sensitivity and specificity are intrinsic properties of the test and do not depend on the prevalence of disease in the population being tested. A highly sensitive test is good for ruling out disease (mnemonic: SnNOut -- Sensitivity, Negative result, rules Out). A highly specific test is good for ruling in disease (mnemonic: SpPIn -- Specificity, Positive result, rules In).

## 7.2 Predictive Values

While sensitivity and specificity describe the test's performance from the perspective of the disease status, clinicians care about the reverse question: given a test result, what is the probability the patient has the disease?

<div class="definition">
<strong>Positive Predictive Value (PPV):</strong> the probability that the disease is present given a positive test.

\[
\text{PPV} = \frac{\text{TP}}{\text{TP} + \text{FP}} = P(D+ \mid T+)
\]

<strong>Negative Predictive Value (NPV):</strong> the probability that the disease is absent given a negative test.

\[
\text{NPV} = \frac{\text{TN}}{\text{FN} + \text{TN}} = P(D- \mid T-)
\]
</div>

### The Effect of Prevalence on Predictive Values

Unlike sensitivity and specificity, predictive values depend heavily on the prevalence of disease. Using Bayes' theorem:

\[
\text{PPV} = \frac{\text{Sensitivity} \times \text{Prevalence}}{\text{Sensitivity} \times \text{Prevalence} + (1 - \text{Specificity}) \times (1 - \text{Prevalence})}
\]

\[
\text{NPV} = \frac{\text{Specificity} \times (1 - \text{Prevalence})}{\text{Specificity} \times (1 - \text{Prevalence}) + (1 - \text{Sensitivity}) \times \text{Prevalence}}
\]

<div class="example">
<strong>Worked Example: Effect of prevalence on PPV.</strong>

A screening test for breast cancer has sensitivity = 90% and specificity = 95%.

<strong>Scenario 1: High-risk population (prevalence = 5%)</strong>

Consider 10,000 women, of whom 500 have breast cancer and 9,500 do not.

| | D+ | D-- | Total |
|---|---|---|---|
| T+ | 450 | 475 | 925 |
| T-- | 50 | 9,025 | 9,075 |

\[
\text{PPV} = \frac{450}{925} = 48.6\%
\]

\[
\text{NPV} = \frac{9025}{9075} = 99.4\%
\]

<strong>Scenario 2: General population (prevalence = 0.5%)</strong>

Consider 10,000 women, of whom 50 have breast cancer and 9,950 do not.

| | D+ | D-- | Total |
|---|---|---|---|
| T+ | 45 | 497.5 | 542.5 |
| T-- | 5 | 9,452.5 | 9,457.5 |

\[
\text{PPV} = \frac{45}{542.5} = 8.3\%
\]

\[
\text{NPV} = \frac{9452.5}{9457.5} = 99.95\%
\]

When prevalence drops from 5% to 0.5%, the PPV drops from 49% to 8%, even though sensitivity and specificity are unchanged. This is why screening tests applied to low-prevalence populations generate many false positives.
</div>

## 7.3 Likelihood Ratios

Likelihood ratios provide an alternative way to express test performance that is independent of prevalence and directly links pre-test to post-test probability.

<div class="definition">
<strong>Positive Likelihood Ratio (LR+):</strong>

\[
\text{LR}+ = \frac{\text{Sensitivity}}{1 - \text{Specificity}} = \frac{P(T+ \mid D+)}{P(T+ \mid D-)}
\]

<strong>Negative Likelihood Ratio (LR--):</strong>

\[
\text{LR}- = \frac{1 - \text{Sensitivity}}{\text{Specificity}} = \frac{P(T- \mid D+)}{P(T- \mid D-)}
\]
</div>

Likelihood ratios are used with pre-test odds to compute post-test odds:

\[
\text{Post-test odds} = \text{Pre-test odds} \times \text{LR}
\]

where Pre-test odds \( = \text{Prevalence} / (1 - \text{Prevalence}) \). A test with LR+ greater than 10 or LR-- less than 0.1 is generally considered clinically useful.

<div class="example">
<strong>Example: Using likelihood ratios.</strong>

For the breast cancer screening test above (sensitivity = 90%, specificity = 95%):

\[
\text{LR}+ = \frac{0.90}{1 - 0.95} = \frac{0.90}{0.05} = 18
\]

\[
\text{LR}- = \frac{1 - 0.90}{0.95} = \frac{0.10}{0.95} = 0.105
\]

If the pre-test probability (prevalence) is 5%, pre-test odds = 0.05/0.95 = 0.0526. After a positive test:

\[
\text{Post-test odds} = 0.0526 \times 18 = 0.947
\]

\[
\text{Post-test probability} = \frac{0.947}{1 + 0.947} = 0.486 = 48.6\%
\]

This matches the PPV calculated earlier.
</div>

## 7.4 ROC Curves

Many diagnostic tests produce a continuous measurement (e.g., blood glucose level, tumour marker concentration) rather than a simple positive/negative result. Different cutoff values produce different combinations of sensitivity and specificity.

<div class="definition">
<strong>Receiver Operating Characteristic (ROC) curve:</strong> A plot of sensitivity (true positive rate) on the y-axis versus 1 -- specificity (false positive rate) on the x-axis, for all possible cutoff values of the test.
</div>

### Interpreting ROC Curves

- A test with no discriminatory power produces a diagonal line from (0, 0) to (1, 1), representing random guessing.
- A perfect test produces a curve that passes through the point (0, 1), indicating 100% sensitivity and 100% specificity.
- The closer the curve hugs the upper-left corner, the better the test.

### Area Under the Curve (AUC)

<div class="definition">
The <strong>Area Under the ROC Curve (AUC)</strong> summarizes the overall discriminatory ability of the test in a single number.
<ul>
<li>AUC = 0.5: no discrimination (no better than chance)</li>
<li>AUC = 0.7--0.8: acceptable discrimination</li>
<li>AUC = 0.8--0.9: excellent discrimination</li>
<li>AUC greater than 0.9: outstanding discrimination</li>
<li>AUC = 1.0: perfect discrimination</li>
</ul>
The AUC has a useful probabilistic interpretation: it equals the probability that a randomly chosen diseased individual has a higher test value than a randomly chosen non-diseased individual.
</div>

### Choosing the Optimal Cutoff

The choice of cutoff depends on the clinical context:

- When the cost of missing a disease is high (e.g., cancer screening), choose a cutoff that maximizes sensitivity, accepting lower specificity.
- When the cost of a false positive is high (e.g., confirmatory tests for HIV), choose a cutoff that maximizes specificity.
- A common approach is to choose the cutoff that maximizes the Youden index: \( J = \text{Sensitivity} + \text{Specificity} - 1 \).

<div class="example">
<strong>Example: Comparing two diagnostic tests using ROC curves.</strong>

Two biomarkers are evaluated for detecting early-stage pancreatic cancer. Biomarker A has AUC = 0.85; Biomarker B has AUC = 0.72. Biomarker A has superior overall discriminatory ability. However, at a specific clinical cutoff, Biomarker B might have higher sensitivity, so the choice depends on the clinical question.
</div>

---

# Chapter 8: Survival Analysis

## 8.1 Introduction to Survival Data

Survival analysis deals with time-to-event data: the time from a defined starting point (e.g., diagnosis, enrollment in a study, start of treatment) until the occurrence of an event of interest (e.g., death, disease recurrence, hospital readmission).

The key feature that distinguishes survival data from ordinary continuous data is censoring.

<div class="definition">
<strong>Right censoring</strong> occurs when the event of interest has not occurred by the end of the observation period, or when a participant is lost to follow-up. We know the individual survived at least until the censoring time, but we do not know when (or if) the event will occur.
</div>

Standard statistical methods (e.g., comparing mean times using a t-test) cannot be directly applied to survival data because censored observations are not simply "missing data" -- they provide partial information (the individual survived at least this long).

### Survival and Hazard Functions

<div class="definition">
The <strong>survival function</strong> \( S(t) \) gives the probability of surviving beyond time \( t \):

\[
S(t) = P(T > t),
\]
where \( T \) is the random variable representing the time to the event. \( S(0) = 1 \) (everyone is alive at time 0) and \( S(t) \) is a non-increasing function.

The <strong>hazard function</strong> (hazard rate, instantaneous failure rate) \( h(t) \) gives the instantaneous rate of the event occurring at time \( t \), given survival up to that time:

\[
h(t) = \lim_{\Delta t \to 0} \frac{P(t \leq T < t + \Delta t \mid T \geq t)}{\Delta t}
\]

The relationship between the survival function and the cumulative hazard function \( H(t) = \int_0^t h(u)\, du \) is:

\[
S(t) = e^{-H(t)}
\]
</div>

## 8.2 Period Life Tables

Life tables are among the oldest statistical tools, used for centuries by actuaries and demographers. A period life table describes the mortality experience of a population during a fixed time period.

<div class="definition">
A <strong>period (current) life table</strong> uses age-specific mortality rates observed in a population during a given year (or short period) to construct a hypothetical cohort that experiences those rates throughout life. It does not follow a real cohort; instead, it answers: "If current mortality rates persist, what would be the survival experience of a hypothetical cohort?"
</div>

### Constructing a Period Life Table

The standard columns of a period life table are:

| Column | Symbol | Description |
|---|---|---|
| Age interval | \( [x, x+n) \) | Age range (e.g., 0--1, 1--5, 5--10, ...) |
| Mortality rate | \( {}_nM_x \) | Observed death rate in the interval |
| Probability of dying | \( {}_nq_x \) | Probability of dying during the interval, given alive at start |
| Number surviving | \( l_x \) | Number alive at exact age \( x \) (starting from a radix, e.g., \( l_0 = 100{,}000 \)) |
| Deaths | \( {}_nd_x \) | Number dying during the interval: \( {}_nd_x = l_x \cdot {}_nq_x \) |
| Person-years lived | \( {}_nL_x \) | Total person-years lived in the interval |
| Total person-years remaining | \( T_x \) | Total person-years lived from age \( x \) onward: \( T_x = \sum_{y \geq x} {}_nL_y \) |
| Life expectancy | \( e_x \) | Expected remaining years of life at age \( x \): \( e_x = T_x / l_x \) |

The conversion from the observed mortality rate to the probability of dying within the interval is:

\[
{}_nq_x = \frac{n \cdot {}_nM_x}{1 + (n - {}_na_x) \cdot {}_nM_x},
\]

where \( {}_na_x \) is the average number of years lived in the interval by those who die during it (often approximated as \( n/2 \) for most age groups).

<div class="example">
<strong>Worked Example: Life table excerpt.</strong>

For the age interval 60--65 (\( n = 5 \)), suppose the observed mortality rate is \( {}_5M_{60} = 0.020 \) per person-year. Assuming \( {}_5a_{60} = 2.5 \):

\[
{}_5q_{60} = \frac{5 \times 0.020}{1 + (5 - 2.5) \times 0.020} = \frac{0.10}{1 + 0.05} = \frac{0.10}{1.05} = 0.0952
\]

If \( l_{60} = 85{,}000 \), then the number dying in this interval is:

\[
{}_5d_{60} = 85{,}000 \times 0.0952 = 8{,}092
\]
and \( l_{65} = 85{,}000 - 8{,}092 = 76{,}908 \).
</div>

## 8.3 Clinical (Actuarial) Life Tables

Clinical life tables adapt the period life table methodology to clinical data, where follow-up times vary and censoring (withdrawal) occurs.

<div class="definition">
A <strong>clinical (actuarial) life table</strong> divides the follow-up period into fixed intervals and estimates the survival probability within each interval, accounting for both events and withdrawals (censoring).

For each interval \( i \):
<ul>
<li>\( n_i \): number at risk at the start of the interval</li>
<li>\( d_i \): number of events (deaths) during the interval</li>
<li>\( w_i \): number withdrawn (censored) during the interval</li>
</ul>

The <strong>effective number at risk</strong> (actuarial adjustment) is:

\[
n_i' = n_i - \frac{w_i}{2}
\]
This assumes withdrawals are uniformly distributed within the interval.

The estimated probability of the event in interval \( i \) is:

\[
\hat{q}_i = \frac{d_i}{n_i'}
\]

The estimated survival probability through interval \( i \) is:

\[
\hat{p}_i = 1 - \hat{q}_i
\]

The cumulative survival probability to the end of interval \( i \) is:

\[
\hat{S}(t_i) = \prod_{j=1}^{i} \hat{p}_j
\]
</div>

<div class="example">
<strong>Worked Example: Clinical life table.</strong>

A study follows 200 cancer patients after diagnosis. Follow-up is divided into 1-year intervals.

| Year | \( n_i \) | \( d_i \) | \( w_i \) | \( n_i' \) | \( \hat{q}_i \) | \( \hat{p}_i \) | \( \hat{S}(t_i) \) |
|---|---|---|---|---|---|---|---|
| 0--1 | 200 | 30 | 10 | 195 | 0.154 | 0.846 | 0.846 |
| 1--2 | 160 | 20 | 15 | 152.5 | 0.131 | 0.869 | 0.735 |
| 2--3 | 125 | 15 | 10 | 120 | 0.125 | 0.875 | 0.643 |
| 3--4 | 100 | 10 | 8 | 96 | 0.104 | 0.896 | 0.576 |
| 4--5 | 82 | 8 | 12 | 76 | 0.105 | 0.895 | 0.516 |

The estimated 5-year survival probability is 51.6%.
</div>

## 8.4 The Kaplan-Meier Estimator

The Kaplan-Meier (KM) estimator, introduced by Edward Kaplan and Paul Meier in 1958, is the most widely used method for estimating the survival function. Unlike the actuarial life table, which uses fixed intervals, the KM estimator recalculates the survival probability at each observed event time.

<div class="definition">
<strong>Kaplan-Meier estimator:</strong> Let \( t_1 < t_2 < \cdots < t_m \) be the distinct ordered event times. At each event time \( t_j \), let \( n_j \) be the number at risk (alive and not yet censored just before \( t_j \)) and \( d_j \) be the number of events at \( t_j \). The KM estimate of the survival function is:

\[
\hat{S}(t) = \prod_{j: t_j \leq t} \left(1 - \frac{d_j}{n_j}\right)
\]
</div>

The resulting KM curve is a step function that decreases at each event time and remains flat between events. Censored observations are typically marked with tick marks on the curve.

<div class="example">
<strong>Worked Example: Kaplan-Meier estimation.</strong>

Ten patients are enrolled in a study. Their follow-up times (in months) are:

2, 3+, 5, 7, 7, 8+, 10, 12+, 15, 18

where + denotes censored observations.

Distinct event times: 2, 5, 7, 10, 15, 18.

| Time \( t_j \) | \( n_j \) | \( d_j \) | \( d_j/n_j \) | \( 1 - d_j/n_j \) | \( \hat{S}(t_j) \) |
|---|---|---|---|---|---|
| 2 | 10 | 1 | 0.100 | 0.900 | 0.900 |
| 5 | 8 | 1 | 0.125 | 0.875 | 0.788 |
| 7 | 7 | 2 | 0.286 | 0.714 | 0.563 |
| 10 | 4 | 1 | 0.250 | 0.750 | 0.422 |
| 15 | 2 | 1 | 0.500 | 0.500 | 0.211 |
| 18 | 1 | 1 | 1.000 | 0.000 | 0.000 |

Note: At time 2, all 10 are at risk. At time 5, one patient was censored at 3 months and one died at 2 months, so 8 remain. At time 7, 7 are at risk, and 2 events occur simultaneously. At time 10, one patient was censored at 8 and another at 12 (not yet reached), so 4 are at risk, and so on.

The estimated median survival time is the time at which \( \hat{S}(t) \) first drops to or below 0.50, which is approximately 7 months.
</div>

### Properties of the KM Estimator

- It is a nonparametric method: no assumptions about the underlying distribution of survival times.
- It provides a consistent estimate of the survival function.
- It handles censoring naturally, using the number at risk at each event time.
- Confidence intervals can be constructed using Greenwood's formula for the variance of \( \hat{S}(t) \).

<div class="definition">
<strong>Greenwood's formula</strong> for the estimated variance of the KM estimator:

\[
\widehat{\text{Var}}[\hat{S}(t)] = [\hat{S}(t)]^2 \sum_{j: t_j \leq t} \frac{d_j}{n_j(n_j - d_j)}
\]
A pointwise 95% confidence interval for \( S(t) \) is then \( \hat{S}(t) \pm 1.96 \sqrt{\widehat{\text{Var}}[\hat{S}(t)]} \).
</div>

## 8.5 The Log-Rank Test

The log-rank test is the standard method for comparing survival curves between two or more groups.

<div class="definition">
<strong>Log-rank test:</strong> Tests the null hypothesis that the survival functions are identical across groups: \( H_0: S_1(t) = S_2(t) \) for all \( t \).

At each distinct event time \( t_j \), construct a 2x2 table:

| | Events | Non-events | At risk |
|---|---|---|---|
| Group 1 | \( d_{1j} \) | \( n_{1j} - d_{1j} \) | \( n_{1j} \) |
| Group 2 | \( d_{2j} \) | \( n_{2j} - d_{2j} \) | \( n_{2j} \) |
| Total | \( d_j \) | \( n_j - d_j \) | \( n_j \) |

The expected number of events in Group 1 at time \( t_j \) under \( H_0 \) is:

\[
E_{1j} = \frac{n_{1j} \cdot d_j}{n_j}
\]

The log-rank test statistic is:

\[
\chi^2 = \frac{\left(\sum_j d_{1j} - \sum_j E_{1j}\right)^2}{\sum_j V_{1j}},
\]
where

\[
V_{1j} = \frac{n_{1j} \cdot n_{2j} \cdot d_j \cdot (n_j - d_j)}{n_j^2(n_j - 1)}.
\]
Under \( H_0 \), this statistic approximately follows a chi-squared distribution with 1 degree of freedom (for 2 groups; \( g - 1 \) degrees of freedom for \( g \) groups).
</div>

<div class="remark">
The log-rank test gives equal weight to all event times. When the hazard ratio is not constant over time (non-proportional hazards), the log-rank test may have reduced power. Alternative tests such as the Wilcoxon (Breslow) test place greater weight on earlier events.
</div>

<div class="example">
<strong>Example: Comparing survival between treatment groups.</strong>

A clinical trial compares a new chemotherapy regimen (Group 1) to standard care (Group 2) in 100 patients with advanced colorectal cancer (50 per group). The KM curves diverge after 6 months, with the new regimen showing longer survival. The log-rank test yields \( \chi^2 = 5.12 \) with 1 degree of freedom (\( p = 0.024 \)). We reject \( H_0 \) and conclude there is a statistically significant difference in survival between the two groups.
</div>

## 8.6 Introduction to the Cox Proportional Hazards Model

While the log-rank test compares survival curves between groups, it cannot adjust for multiple covariates simultaneously. The Cox proportional hazards (PH) model, introduced by Sir David Cox in 1972, is the most widely used regression model for survival data.

<div class="definition">
<strong>Cox proportional hazards model:</strong>

\[
h(t \mid X_1, \ldots, X_p) = h_0(t) \exp(\beta_1 X_1 + \beta_2 X_2 + \cdots + \beta_p X_p),
\]
where:
<ul>
<li>\( h(t \mid X_1, \ldots, X_p) \) is the hazard at time \( t \) for an individual with covariate values \( X_1, \ldots, X_p \)</li>
<li>\( h_0(t) \) is the <strong>baseline hazard function</strong> (the hazard when all covariates equal zero)</li>
<li>\( \beta_1, \ldots, \beta_p \) are the regression coefficients</li>
</ul>

The model is <strong>semi-parametric</strong>: the baseline hazard \( h_0(t) \) is left completely unspecified (nonparametric part), while the effect of covariates is modeled parametrically through the exponential term.
</div>

### Interpreting Hazard Ratios

The hazard ratio (HR) for a one-unit increase in \( X_j \), holding other covariates constant, is:

\[
\text{HR} = e^{\beta_j}
\]

- HR = 1: no effect of the covariate on survival
- HR > 1: the covariate is associated with increased hazard (worse survival)
- HR < 1: the covariate is associated with decreased hazard (better survival)

<div class="example">
<strong>Example: Cox model for cancer survival.</strong>

A Cox PH model for overall survival in lung cancer patients yields:

\[
h(t) = h_0(t) \exp(0.45 \cdot \text{Stage}_{\text{III}} + 0.92 \cdot \text{Stage}_{\text{IV}} - 0.35 \cdot \text{Chemo})
\]

where Stage III and Stage IV are indicator variables (compared to Stages I/II combined) and Chemo = 1 if the patient received chemotherapy.

Interpretation:
<ul>
<li>Stage III vs. I/II: HR = \( e^{0.45} = 1.57 \). Stage III patients have 57% higher hazard of death.</li>
<li>Stage IV vs. I/II: HR = \( e^{0.92} = 2.51 \). Stage IV patients have 2.5 times the hazard of death.</li>
<li>Chemotherapy: HR = \( e^{-0.35} = 0.70 \). Chemotherapy is associated with a 30% reduction in the hazard of death, after adjusting for stage.</li>
</ul>
</div>

### The Proportional Hazards Assumption

The fundamental assumption is that the hazard ratio between any two individuals is constant over time. That is, the covariate effects multiply the baseline hazard by a fixed factor at all time points. This can be checked by:

1. Plotting \( \log[-\log \hat{S}(t)] \) vs. \( \log(t) \) for each group: the curves should be approximately parallel.
2. Including time-by-covariate interaction terms in the model: if these are statistically significant, the PH assumption is violated.
3. Examining Schoenfeld residuals: a systematic trend in these residuals over time indicates non-proportional hazards.

<div class="remark">
The Cox model estimates the regression coefficients \( \beta_j \) using a partial likelihood that does not require specifying \( h_0(t) \). This is what makes the method semi-parametric and widely applicable: it provides valid inference about hazard ratios without assuming any particular distributional form for the survival times.
</div>

---

# Summary of Key Formulas

## Disease Frequency Measures

| Measure | Formula |
|---|---|
| Prevalence | \( \frac{\text{Existing cases}}{\text{Total population}} \) |
| Incidence rate | \( \frac{\text{New cases}}{\text{Person-time at risk}} \) |
| Cumulative incidence | \( \frac{\text{New cases}}{\text{Population at risk at start}} \) |

## Measures of Association

| Measure | Formula | Study design |
|---|---|---|
| Relative Risk (RR) | \( \frac{a/(a+b)}{c/(c+d)} \) | Cohort, RCT |
| Odds Ratio (OR) | \( \frac{ad}{bc} \) | Case-control, cross-sectional |
| Risk Difference (RD) | \( \frac{a}{a+b} - \frac{c}{c+d} \) | Cohort, RCT |
| NNT | \( \frac{1}{\text{ARR}} \) | RCT |

## Diagnostic Testing

| Measure | Formula |
|---|---|
| Sensitivity | \( \frac{\text{TP}}{\text{TP} + \text{FN}} \) |
| Specificity | \( \frac{\text{TN}}{\text{FP} + \text{TN}} \) |
| PPV | \( \frac{\text{TP}}{\text{TP} + \text{FP}} \) |
| NPV | \( \frac{\text{TN}}{\text{FN} + \text{TN}} \) |
| LR+ | \( \frac{\text{Sensitivity}}{1 - \text{Specificity}} \) |
| LR-- | \( \frac{1 - \text{Sensitivity}}{\text{Specificity}} \) |

## Standardization

| Method | Key quantity |
|---|---|
| Direct standardization | \( \text{ASR} = \sum_i w_i \cdot r_i \) |
| Indirect standardization | \( \text{SMR} = \frac{O}{E} \times 100 \) |

## Survival Analysis

| Method | Formula |
|---|---|
| Kaplan-Meier | \( \hat{S}(t) = \prod_{j: t_j \leq t} \left(1 - \frac{d_j}{n_j}\right) \) |
| Cox PH model | \( h(t \mid \mathbf{X}) = h_0(t) \exp(\boldsymbol{\beta}^T \mathbf{X}) \) |
| Hazard ratio | \( \text{HR} = e^{\beta_j} \) |
