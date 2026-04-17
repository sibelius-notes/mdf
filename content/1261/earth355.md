---
title: "EARTH 355: Water: Data to Decisions"
subjects: "EARTH"
prof: "Andrea Brookfield"
---

## Sources and References
**Online resources** — USGS Water Resources (usgs.gov/water); Environment and Climate Change Canada Hydrometric data (wateroffice.ec.gc.ca); NRCAN Water Survey of Canada; Ontario Integrated Groundwater Monitoring Network; R Project for Statistical Computing (r-project.org); Jupyter Project (jupyter.org)

# Chapter 1: Compiling Environmental Data for Water Decisions

## The Data-to-Decisions Framework

Water management is fundamentally a decision-making enterprise. Whether the decision involves allocating water among competing users, issuing a drinking water advisory, designing a floodplain ordinance, or selecting a remediation strategy for a contaminated aquifer, that decision should be grounded in systematic analysis of relevant data. The field of environmental data science — combining hydrology, statistics, and computational tools — provides the methodological bridge between raw observations and defensible, transparent decisions.

The first and most consequential step in any water management analysis is framing the decision precisely. A poorly posed question leads to data collection that is incomplete, inappropriately designed, or analytically intractable. A well-posed decision question specifies: who the **stakeholder** is (the person or institution for whom the decision is made), what the **decision variable** is (the specific quantity or condition to be determined), what the **decision alternatives** are (the options among which a choice must be made), and what **objectives** the decision must satisfy. This framing exercise, often conducted in consultation with stakeholders, directly determines what data are needed, at what temporal and spatial resolution, and over what period.

<div class="definition">
<strong>Stakeholder involvement</strong> in water data analysis acknowledges that environmental decisions are rarely purely technical — they involve trade-offs among competing values, interests, and knowledge systems. Indigenous communities, municipalities, agricultural users, conservation authorities, and environmental organizations may each hold legitimate perspectives on water use and quality decisions. Meaningful stakeholder engagement from the outset of a study — including consultation on the framing of the decision question and the selection of decision criteria — produces more socially robust and durable outcomes than technical analyses conducted in isolation.
</div>

A stark illustration is provided by the long-standing pattern of drinking water advisories in First Nations communities across Ontario and Canada. As of the early 2020s, many First Nations reserves were under long-term drinking water advisories, some lasting more than a decade, despite Canada's stated commitment to clean water access for all. The technical dimensions of these advisories — infrastructure deficiencies, source water contamination, inadequate treatment capacity, insufficient operator training and funding — are well documented. But the persistence of the crisis also reflects governance structures and resource allocation decisions rooted in colonial history, illustrating that water decisions are inseparable from questions of equity, political will, and institutional capacity.

## Data Requirements and Database Construction

Identifying the data needed to address a decision requires systematic thinking about the system being studied. For hydrological decisions, this typically involves assembling time series of streamflow, water levels, precipitation, temperature, water quality parameters (pH, conductivity, nutrients, metals, pathogens), land use, soil properties, and catchment morphology. Each of these data streams comes with its own characteristics: measurement precision, sampling frequency, spatial density of monitoring stations, period of record, and degree of quality control.

<div class="definition">
<strong>Quality assurance (QA)</strong> and <strong>quality control (QC)</strong> are systematic processes for ensuring that data are fit for their intended purpose. QA refers to the planned system of activities — calibration protocols, standard operating procedures, training of field personnel, documentation — that prevent errors from entering the dataset. QC refers to the post-collection examination of data for errors, including range checks (are values physically plausible?), internal consistency checks (are values consistent with related measurements?), temporal consistency checks (are abrupt changes real or artefactual?), and spatial consistency checks (are values consistent with nearby stations?). Data that fail QC checks are flagged or removed, and the reasons are documented in metadata.
</div>

The construction of a database for environmental analysis requires careful attention to **metadata** — information about the data themselves: measurement units, coordinate reference system, instrument type, detection limits, sampling method, and any known issues or interventions (instrument changes, station relocations, periods of missing record). Without metadata, data cannot be properly interpreted or compared across sources. Modern best practice calls for **FAIR data principles** — data should be Findable, Accessible, Interoperable, and Reusable — which are increasingly mandated by funding agencies and journals for environmental datasets.

## Introduction to Computational Tools: R and Python in Jupyter

Modern environmental data analysis is invariably computational: datasets are too large to work with by hand, standard statistical procedures must be applied systematically across multiple variables and time periods, and results must be reproducible. Two programming languages dominate contemporary environmental science: **R** (a language and environment designed specifically for statistical computing and graphics) and **Python** (a general-purpose language with powerful scientific computing libraries including NumPy, pandas, SciPy, and matplotlib). Both are open-source, free, and available on all major operating platforms.

**Jupyter Notebook** is an interactive computational environment that allows users to combine executable code, richly formatted text (using Markdown), mathematical equations (using LaTeX), and visualizations in a single document. This integration of code and narrative makes analyses transparent, reproducible, and communicable — a notebook can serve simultaneously as analysis tool and report. For environmental applications, typical Jupyter workflows involve reading data from CSV or NetCDF files, performing quality control checks, computing descriptive statistics, visualizing distributions and time series, running inferential tests, and producing publication-quality figures.

# Chapter 2: Descriptive Statistics for Hydrological Data

## Central Tendency and Dispersion

Descriptive statistics summarize the distributional properties of a dataset — its central value, its spread, and its shape — before any inferential analysis is attempted. These summaries are essential both for understanding the data and for selecting appropriate inferential methods (which often assume specific distributional forms).

The three common measures of **central tendency** are the mean (arithmetic average), the median (middle value when data are sorted), and the mode (most frequently occurring value). For environmental data, the choice among these measures is consequential: the **arithmetic mean** \( \bar{x} = \frac{1}{n} \sum_{i=1}^n x_i \) is appropriate for normally distributed data but is sensitive to extreme values (outliers). The **median** (50th percentile) is robust to outliers and is preferable for skewed distributions such as those of flood peaks, pollutant concentrations, and suspended sediment loads, which frequently follow log-normal or Pareto distributions. The **geometric mean** — the \( n \)-th root of the product of \( n \) values, equivalently the antilog of the mean of log-transformed values — is appropriate for data spanning orders of magnitude and is commonly used for bacterial counts and trace metal concentrations:

\[ \bar{x}_g = \exp\left(\frac{1}{n} \sum_{i=1}^n \ln x_i\right) \]

<div class="definition">
A <strong>log-normal distribution</strong> describes a variable whose natural logarithm is normally distributed. It is characterized by right-skewness (a long upper tail), non-negativity, and a geometric mean less than the arithmetic mean. Many environmental variables — stream discharge, suspended sediment concentration, trace metal concentrations in groundwater, rainfall intensity — are approximately log-normally distributed, reflecting multiplicative (rather than additive) generating processes. For log-normal data, central tendency should be reported as the geometric mean and spread as the geometric standard deviation.
</div>

**Measures of dispersion** quantify the spread of data around the central value. The **variance** \( s^2 = \frac{1}{n-1} \sum_{i=1}^n (x_i - \bar{x})^2 \) and **standard deviation** \( s = \sqrt{s^2} \) measure spread in the same units as the data (standard deviation) or the square of those units (variance). The **coefficient of variation** CV = \( s/\bar{x} \times 100\% \) expresses variability relative to the mean and is useful for comparing variability across datasets with different units or magnitudes. The **interquartile range (IQR)** = Q3 − Q1 (the range containing the middle 50% of observations) is a robust measure of spread less sensitive to outliers than the standard deviation.

## The z-Score and Standardization

The **z-score** (or standard score) of an observation \( x_i \) in a dataset with mean \( \bar{x} \) and standard deviation \( s \) is:

\[ z_i = \frac{x_i - \bar{x}}{s} \]

It expresses the value in units of standard deviations from the mean. Positive z-scores indicate values above the mean; negative z-scores indicate values below. A z-score of 2.0 means the observation is two standard deviations above the mean — an event that, under a normal distribution, would occur about 2.3% of the time. Standardization (transforming all values to z-scores) allows comparison of variables measured on different scales and is a prerequisite for some multivariate analyses.

# Chapter 3: Probability and Statistical Inference

## Probability Fundamentals

Probability is the mathematical language of uncertainty. In the context of water management, probability allows questions like: "What is the probability that streamflow will exceed the bank-full discharge at least once in the next 10 years?" or "Given that phosphorus concentrations in the lake exceeded the eutrophication threshold last summer, what is the probability that algal blooms will occur this summer?" to be answered rigorously.

The **probability** of an event \( A \) is a number between 0 and 1 representing the long-run relative frequency of that event in a large number of identical trials. For discrete events, probabilities sum to 1 across all mutually exclusive outcomes. **Conditional probability** — the probability of event \( A \) given that event \( B \) has occurred — is written \( P(A \mid B) = P(A \cap B) / P(B) \), and is fundamental to Bayesian updating of beliefs in light of evidence.

Two events \( A \) and \( B \) are **statistically independent** if \( P(A \cap B) = P(A) \cdot P(B) \), equivalently if \( P(A \mid B) = P(A) \). Independence is a key assumption in many statistical models (e.g., that successive annual maximum streamflows are independent draws from the same distribution), and violating this assumption (e.g., due to persistence or trends in a time series) leads to invalid inferences.

## Probability Distributions for Environmental Variables

The **normal (Gaussian) distribution** is the most commonly used probability model in statistics, characterized by its bell-shaped, symmetric probability density function:

\[ f(x) = \frac{1}{\sigma \sqrt{2\pi}} \exp\left(-\frac{(x - \mu)^2}{2\sigma^2}\right) \]

where \( \mu \) is the population mean and \( \sigma^2 \) is the population variance. The normal distribution is appropriate for variables that are the result of many additive random processes (by the Central Limit Theorem). Many water quality variables — dissolved oxygen, temperature, pH in buffered systems — are approximately normally distributed.

The **Student's t distribution** is used when the population standard deviation is unknown (which is nearly always the case in practice) and the sample size is finite. With \( \nu = n - 1 \) degrees of freedom, the t distribution has heavier tails than the normal distribution, reflecting additional uncertainty from estimating \( \sigma \) from the data; as \( n \to \infty \), the t distribution approaches the normal. The t distribution is central to hypothesis testing and confidence interval construction for means.

## Confidence Intervals

A **confidence interval (CI)** for a population parameter (such as the mean annual streamflow or mean nitrate concentration) is a range of values that, under repeated sampling, would contain the true parameter value with a specified long-run probability (the confidence level, typically 90%, 95%, or 99%). The 95% CI for a population mean, using a t distribution, is:

\[ \bar{x} \pm t_{\alpha/2, n-1} \cdot \frac{s}{\sqrt{n}} \]

where \( t_{\alpha/2, n-1} \) is the critical t value with \( n-1 \) degrees of freedom at significance level \( \alpha \). The width of the CI is inversely proportional to \( \sqrt{n} \): quadrupling the sample size halves the interval width. Confidence intervals convey the precision of an estimate and should always accompany reported means in environmental reports.

<div class="remark">
The confidence interval is frequently misinterpreted. A 95% CI does <em>not</em> mean "there is a 95% probability that the true parameter lies in this particular interval" — once computed from a specific dataset, the interval either contains the true value or it does not. The correct interpretation is frequentist: if we were to repeat the sampling procedure and compute a CI many times, approximately 95% of those intervals would contain the true parameter value. The practical implication is the same — when reporting a CI, we communicate the range of parameter values consistent with the data at the specified confidence level.
</div>

# Chapter 4: Hypothesis Testing

## The Logic of Hypothesis Testing

Hypothesis testing is a formal decision procedure for evaluating, on the basis of sample data, whether the evidence is sufficient to reject a default assumption (the **null hypothesis**, \( H_0 \)) in favour of an alternative explanation (the **alternative hypothesis**, \( H_a \)). In environmental science, common null hypotheses include: "Mean nitrate concentrations are the same in agricultural and forested catchments" (\( H_0: \mu_1 = \mu_2 \)), "Streamflow has not changed significantly over the past 50 years," or "The presence of contaminant X is independent of proximity to the industrial site."

The **p-value** is the probability, under the assumption that \( H_0 \) is true, of obtaining test statistics at least as extreme as those observed in the sample. A small p-value indicates that the observed data would be unlikely if \( H_0 \) were true, providing evidence against \( H_0 \). The conventional significance threshold \( \alpha = 0.05 \) means we reject \( H_0 \) when \( p < 0.05 \) — accepting a 5% risk of incorrectly rejecting a true null hypothesis (**Type I error**). The complementary risk — failing to reject a false null hypothesis (**Type II error**) — has probability \( \beta \), and the **statistical power** of a test is \( 1 - \beta \).

<div class="definition">
A <strong>one-sample t-test</strong> evaluates whether the sample mean differs significantly from a specified hypothesized value \( \mu_0 \). The test statistic is:

\[ t = \frac{\bar{x} - \mu_0}{s / \sqrt{n}} \]

which follows a t distribution with \( n - 1 \) degrees of freedom under \( H_0 \). The <strong>two-sample t-test</strong> compares the means of two independent groups, using the test statistic \( t = (\bar{x}_1 - \bar{x}_2) / SE \) where SE is the standard error of the difference. When group variances cannot be assumed equal, Welch's modification uses adjusted degrees of freedom.
</div>

## Case Study: Methylmercury Exposure and Risk

The application of hypothesis testing to environmental health questions is illustrated by the assessment of methylmercury exposure in human populations consuming fish from mercury-contaminated lakes. Methylmercury (MeHg) is a potent neurotoxin produced by the methylation of inorganic mercury by anaerobic bacteria in lake sediments; it bioaccumulates through food webs so that predatory fish (walleye, pike, largemouth bass) may contain MeHg concentrations orders of magnitude higher than the surrounding water. Health agencies establish guideline values (e.g., 0.3 µg/g wet weight in Canada for commercial fish species) based on tolerable daily intake estimates.

Testing whether mean MeHg concentrations in walleye from a lake exceed the guideline value (\( H_0: \mu \leq 0.3 \) µg/g vs. \( H_a: \mu > 0.3 \) µg/g) is a one-sided hypothesis test. If a random sample of 25 fish yields \( \bar{x} = 0.41 \) µg/g with \( s = 0.15 \) µg/g, the t-statistic is \( t = (0.41 - 0.30)/(0.15/5) = 3.67 \), with a p-value of approximately 0.0006 — strong evidence that mean concentrations exceed the guideline, warranting a fish consumption advisory.

# Chapter 5: Analysis of Frequency Data and Chi-Square Tests

## The Chi-Square Test of Association

Many environmental data are categorical: land use (agricultural, urban, forested), flood event occurrence (yes/no in a given year), pollution source type (point vs. non-point), or exceedance of a regulatory standard (compliant/non-compliant). The **chi-square test** (χ² test) is the standard procedure for evaluating whether two categorical variables are statistically associated (dependent) or independent.

For a contingency table with \( r \) rows and \( c \) columns, the chi-square test statistic is:

\[ \chi^2 = \sum_{i=1}^r \sum_{j=1}^c \frac{(O_{ij} - E_{ij})^2}{E_{ij}} \]

where \( O_{ij} \) is the observed count in cell \( (i,j) \) and \( E_{ij} = (\text{row}_i \text{ total}) \times (\text{col}_j \text{ total}) / n \) is the expected count under the null hypothesis of independence. Under \( H_0 \), this statistic follows a chi-square distribution with \( (r-1)(c-1) \) degrees of freedom. Large values of \( \chi^2 \) indicate departure from independence.

<div class="example">
<strong>Flooding Frequency Analysis.</strong> Annual maximum streamflow data from a long-gauge record can be used to fit a frequency distribution (commonly the Gumbel or GEV distribution) and estimate the discharge associated with specified return periods. The 2019 flooding of Offutt Air Force Base (Nebraska, USA) — where the Missouri River inundated approximately 40% of the base — was later attributed in part to a compound event: the combination of an above-average snowpack, rapid warm-season melt, heavy rainfall, and frozen ground (inhibiting infiltration) coinciding. Attribution of such compound events requires moving beyond single-variable frequency analysis to joint probability methods that account for dependence among multiple flood drivers.
</div>

# Chapter 6: Time Series Analysis

## Temporal Structure in Hydrological Data

Environmental data collected through time — streamflow records, water temperature series, nutrient concentration time series — often exhibit systematic temporal structure: trends, seasonal cycles, multi-year oscillations (teleconnections to ENSO, NAO, PDO), and autocorrelation (correlation between successive observations). Ignoring this structure when applying standard statistical methods (which assume independence of observations) leads to inflated false positive rates and incorrect conclusions.

A **time series** is a sequence of measurements taken at successive, equally spaced time intervals. The decomposition of a time series into components is conceptually useful: a long-term **trend** (monotonic increase or decrease), a **seasonal cycle** (predictable annual variation), a **cyclical component** (longer-period non-seasonal oscillations), and an **irregular residual** (unpredictable fluctuations). Hydrological time series are typically dominated by the seasonal cycle (snowmelt spring flood, summer low flow, autumn storm response), which must be removed or accounted for before analysing trends or anomalies.

<div class="definition">
<strong>Autocorrelation</strong> is the correlation between values in a time series and lagged versions of the same series. The autocorrelation function (ACF) plots the autocorrelation coefficient \( r_k \) at each lag \( k \) against the lag number. Positive autocorrelation at lag 1 (r₁ > 0) is common in streamflow series because high flows tend to persist for days or weeks due to basin storage; this persistence means that successive daily streamflow values are not independent. The presence of significant autocorrelation violates the independence assumption of many statistical tests and must be accounted for in trend analysis and hypothesis testing.
</div>

## Detecting Temporal Trends

The **Mann-Kendall test** is the most widely used non-parametric test for detecting monotonic trends in time series. It is based on the sign of the differences between all pairs of observations: the test statistic \( S = \sum_{i < j} \text{sgn}(x_j - x_i) \) is the excess of concordant over discordant pairs. Under the null hypothesis of no trend (random temporal ordering), \( S \) is approximately normally distributed for large \( n \), allowing a z-test. The Mann-Kendall test is preferred over linear regression for trend detection because it is distribution-free, robust to non-normality and outliers, and unaffected by the magnitude of the trend.

**Sen's slope** — the median of all pairwise slopes \( (x_j - x_i)/(j - i) \) for \( j > i \) — provides a robust estimate of the trend magnitude. It is paired with the Mann-Kendall test to characterize both the statistical significance and the practical magnitude of a trend. The combination of Mann-Kendall significance test and Sen's slope estimator is the standard in hydrology for assessing long-term changes in streamflow, groundwater levels, and water quality. For example, analyses of long-term streamflow records across Canadian watersheds have documented statistically significant increasing trends in winter baseflows in many regions, consistent with increased groundwater recharge from altered snowmelt and precipitation regimes under a warming climate.

# Chapter 7: Correlation and Regression Analysis

## Pearson Correlation Coefficient

The **Pearson product-moment correlation coefficient** \( R \) measures the strength and direction of the linear association between two continuous variables \( x \) and \( y \):

\[ R = \frac{\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y})}{\sqrt{\sum_{i=1}^n (x_i - \bar{x})^2 \sum_{i=1}^n (y_i - \bar{y})^2}} \]

\( R \) ranges from −1 (perfect negative linear relationship) through 0 (no linear relationship) to +1 (perfect positive linear relationship). The square of the correlation coefficient, \( R^2 \), gives the proportion of variance in \( y \) explained by linear association with \( x \). Hypothesis testing for whether \( R \) is significantly different from zero uses the test statistic \( t = R\sqrt{(n-2)/(1-R^2)} \), which follows a t distribution with \( n-2 \) degrees of freedom under \( H_0: \rho = 0 \).

A fundamental caution: **correlation does not imply causation**. The observation that two variables are correlated may reflect a direct causal relationship, a reverse causal relationship (y causes x), a common cause (a third variable drives both x and y), or pure coincidence. The history of environmental science contains many cautionary tales of spurious correlations mistaken for causal mechanisms. The Flint, Michigan water crisis — in which the switch to the Flint River as a water source in 2014 coincided with dramatic increases in blood lead levels in children — provides a context for examining correlation between infrastructure decisions, water chemistry (corrosive, low-pH water leaching lead from pipes), and public health outcomes, while underscoring the importance of mechanistic understanding alongside statistical correlation.

## Simple and Multiple Linear Regression

**Simple linear regression** models the relationship between a response variable \( y \) and a single predictor \( x \) as:

\[ y_i = \beta_0 + \beta_1 x_i + \varepsilon_i \]

where \( \beta_0 \) (intercept) and \( \beta_1 \) (slope) are population parameters estimated from the data by the **ordinary least squares (OLS)** criterion — minimizing the sum of squared residuals \( \sum (y_i - \hat{y}_i)^2 \). The OLS estimates are:

\[ \hat{\beta}_1 = \frac{\sum (x_i - \bar{x})(y_i - \bar{y})}{\sum (x_i - \bar{x})^2}, \quad \hat{\beta}_0 = \bar{y} - \hat{\beta}_1 \bar{x} \]

The **coefficient of determination** \( R^2 = 1 - SS_{\text{res}}/SS_{\text{tot}} \) quantifies the proportion of total variance in \( y \) explained by the regression model. In hydrology, simple regression is used for rating curves (relating stream stage to discharge), load calculations (relating concentration to discharge), and climate-hydrology relationships (relating temperature to snowmelt timing). **Multiple linear regression** extends the model to several predictors \( \mathbf{x} = (x_1, x_2, \ldots, x_p) \), allowing more complex relationships and control for confounding variables.

# Chapter 8: Trends and Model Fit Metrics

## Evaluating Model Performance

Whether assessing a regression model, a hydrological simulation model, or a machine-learning algorithm applied to water data, the evaluation of model performance is essential before using model outputs for decision-making. A suite of **fit metrics** allows quantitative comparison of model predictions \( \hat{y}_i \) against observations \( y_i \).

The **Nash-Sutcliffe efficiency (NSE)** is the most widely used performance metric in hydrology:

\[ \text{NSE} = 1 - \frac{\sum_{i=1}^n (y_i - \hat{y}_i)^2}{\sum_{i=1}^n (y_i - \bar{y})^2} \]

NSE ranges from \( -\infty \) to 1. A value of 1 indicates a perfect model; NSE = 0 means the model performs no better than simply predicting the observed mean for every time step; NSE < 0 means the mean is a better predictor than the model. NSE > 0.75 is generally considered satisfactory for streamflow simulation. NSE is sensitive to high-flow peaks (squared differences weight large errors heavily), so **log-transformed NSE** (applying NSE to log-transformed values) is often used to evaluate model performance during low-flow periods.

The **root mean squared error (RMSE)** \( = \sqrt{\sum (y_i - \hat{y}_i)^2 / n} \) and **mean absolute error (MAE)** \( = \sum |y_i - \hat{y}_i| / n \) are absolute error metrics that quantify prediction error in the units of the variable. **Percent bias (PBIAS)** \( = 100 \times \sum (y_i - \hat{y}_i) / \sum y_i \) measures the systematic tendency of the model to over- or under-predict.

# Chapter 9: Spatial Analysis and Point Patterns

## Spatial Data in Water Science

Water management decisions are inherently spatial: contamination plumes spread through groundwater in three dimensions; non-point-source pollutant loads depend on land use patterns across watersheds; flood inundation extents are determined by topography. Spatial analysis — the set of methods for identifying, quantifying, and testing patterns in spatially distributed data — is therefore indispensable in environmental hydrology.

<div class="definition">
A <strong>point pattern</strong> is a spatial dataset in which the observations are individual events or measurements located at specific geographic coordinates. Point pattern analysis asks whether events are distributed randomly, clustered (occurring close together more often than expected by chance), or regularly (more evenly spaced than random). The distinction has practical importance: a clustered pattern of cancer cases near a contaminated well suggests a spatial causal relationship; a random pattern suggests the cases are not associated with proximity to the well.
</div>

The **variance-mean ratio (VMR)**, also called the **index of dispersion**, tests for spatial pattern in count data by comparing the observed variance of counts per quadrat to the mean count:

\[ \text{VMR} = \frac{s^2}{\bar{x}} \]

For a random (Poisson) point process, the variance equals the mean, so VMR ≈ 1. VMR > 1 indicates clustering (overdispersion); VMR < 1 indicates regularity (underdispersion). The statistical significance of departure from VMR = 1 is assessed with a chi-square test with \( n-1 \) degrees of freedom.

## Spatial Interpolation Methods

When point measurements of a water variable (groundwater level, nitrate concentration, rainfall amount) exist at a set of monitoring stations, **spatial interpolation** is used to estimate the variable at unmonitored locations across the study area, producing continuous spatial surfaces (maps).

**Nearest-neighbour interpolation** assigns to each unsampled point the value of the closest observation. It is simple but produces a discontinuous (step-function) surface with abrupt transitions at boundaries equidistant from two observation points. **Local averaging** estimates the value at a prediction point as the mean of observations within a specified neighbourhood radius. **Inverse distance weighting (IDW)** assigns weights to observation points proportional to \( 1/d^p \) (where \( d \) is distance and \( p \) is a power parameter, typically 2), so that nearby observations receive higher weights than distant ones:

\[ \hat{z}(\mathbf{s}_0) = \frac{\sum_{i=1}^n w_i z(\mathbf{s}_i)}{\sum_{i=1}^n w_i}, \quad w_i = d(\mathbf{s}_0, \mathbf{s}_i)^{-p} \]

**Kriging** is a geostatistical interpolation technique that provides optimal (minimum variance) linear unbiased predictions by explicitly modelling the spatial autocorrelation structure of the variable through a **variogram** — a function describing how the variance between paired observations increases with separation distance. Kriging produces not only interpolated values but also maps of prediction uncertainty (kriging variance), which are invaluable for communicating the reliability of interpolated surfaces and for informing decisions about where additional monitoring stations would most reduce uncertainty. The application of kriging to interpolate nitrate concentrations or groundwater head surfaces across monitoring networks is standard practice in groundwater quality assessment.

## Nearest-Neighbour Analysis

The **nearest-neighbour statistic** \( \bar{d}_{\text{obs}} \) is the mean distance from each event point to its nearest neighbour. Under complete spatial randomness (a Poisson process with intensity \( \lambda \) events per unit area), the expected nearest-neighbour distance is \( \bar{d}_E = 1/(2\sqrt{\lambda}) \), and the ratio \( R = \bar{d}_{\text{obs}} / \bar{d}_E \) tests for pattern: \( R < 1 \) suggests clustering, \( R > 1 \) suggests regularity. A z-test with known variance provides formal significance assessment. The nearest-neighbour analysis has been applied to investigate whether cancer cluster locations are spatially random relative to contaminated well locations — a case study that vividly illustrates the societal stakes of spatial analysis in environmental science, as exemplified by communities like Woburn, Massachusetts (the basis for the book and film *A Civil Action*) where childhood leukemia clusters were investigated in relation to groundwater contamination.

# Chapter 10: Integrating Analyses — The Final Project Framework

## From Dataset to Decision: The Poster Framework

The culminating product of this course is a scientific poster that demonstrates the complete data-to-decisions arc: from a clearly articulated decision question and hypothesis through systematic data compilation and quality control, descriptive characterization, inferential analysis, spatial or temporal pattern identification, and finally a concrete, evidence-based recommendation to a named stakeholder.

A well-constructed environmental decision poster is organized around a clear narrative: first establishing the **context** (why is this decision important? who is the stakeholder? what are the consequences of a bad decision?), then stating the **hypothesis or objective** (what specific claim is being tested or what quantity is being estimated?), presenting the **data and methods** (what data were used, how were they collected or accessed, what statistical methods were applied and why?), reporting the **results** (what did the analyses find?), discussing the **implications** (what do the results mean for the decision? what uncertainties remain?), and closing with **conclusions and recommendations** (what should the stakeholder do, and why?).

The poster format enforces conciseness and visual clarity that long-form reports can obscure. Every figure must earn its place: its purpose must be clear from context, its axes must be labelled with units, and its interpretation must be stated explicitly. Tables summarizing key parameter estimates should include measures of uncertainty (confidence intervals or standard errors). The use of appropriate statistical terminology — distinguishing, for example, between correlation and causation, between statistical and practical significance, between model calibration and validation — signals the analytical rigour that distinguishes scientific from anecdotal environmental decision support.

The complete journey from raw data to a defensible recommendation to a stakeholder exemplifies the core mission of environmental data science: to render the Earth's complex water systems legible, quantifiable, and ultimately governable in the service of human and ecological wellbeing.
