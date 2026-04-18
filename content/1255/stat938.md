---
title: "STAT 938: Statistical Consulting"
prof: "Chelsea Uggenti"
subjects: "STAT"
---

## Sources and References
**Primary texts** — Janice Derr, *Statistical Consulting: A Guide to Effective Communication* (Duxbury Press, 2000); Javier Cabrera and Andrew McDougall, *Statistical Consulting* (Springer, 2002).
**Supplementary** — Daniel Zelterman, *Biostatistical Design and Analysis Using R* (Wiley-Blackwell, 2010); Frank Harrell, *Regression Modeling Strategies* (2nd ed., Springer, 2015).
**Online resources** — ASA Section on Statistical Consulting resources; IASS guidelines for statistical practice; Biostatistical Consulting Center (various university resources on effective consulting).

---

# Chapter 1: The Statistical Consultation Process

Statistical consulting occupies a distinctive position within applied statistics. Unlike a purely research-oriented statistician who selects problems of inherent mathematical interest, the consultant operates in service of another person's research agenda, bringing statistical expertise to bear on questions that arise from domains as diverse as clinical medicine, ecology, social science, engineering, and business. This chapter examines what consulting actually entails: the roles a consultant may be called to perform, the phases through which a productive consultation typically moves, the ethical obligations that govern the relationship, and the common pitfalls that undermine consulting engagements.

## Section 1.1: Roles of the Statistical Consultant

The role a statistician plays in a given engagement is not fixed. Derr (2000) distinguishes among at least three modes of engagement: the statistician as **advisor**, as **collaborator**, and as **educator**.

In the advisory mode, the client arrives with a well-posed problem and seeks a specific technical recommendation — which test to use, whether a sample size is adequate, how to handle missing data in a particular dataset. The consultant's job is to provide a clear, technically sound answer and to explain the reasoning behind it in terms the client can understand. The engagement is often brief and transactional.

In the collaborative mode, the statistician is embedded in the research from an early stage, participating in study design, contributing to grant applications, and taking part in the interpretation of results. Here the statistician may share authorship and bears co-responsibility for the scientific conclusions. Cabrera and McDougall (2002) emphasize that this mode demands a deeper investment in the substantive research area and requires the consultant to communicate fluently across disciplinary boundaries.

In the educational mode, the consultant's primary goal is to build the client's own statistical competence. A researcher who brings in a dataset and asks "what does this test do?" is seeking instruction as much as analysis. The consultant must gauge when to answer directly and when to guide the client through reasoning for themselves.

Most real consulting engagements blend all three roles to varying degrees. A skilled consultant reads the situation and adjusts. Recognizing which mode is appropriate at a given moment — and transitioning fluidly between them — is one of the core practical skills this course develops.

## Section 1.2: Phases of a Consultation

A statistical consultation typically passes through identifiable phases, though the boundaries between them are porous and the process is often iterative.

<div class="definition">
<strong>The Consultation Lifecycle.</strong> A consultation may be characterized by five overlapping phases: (1) <em>intake</em>, in which the consultant first meets the client and gathers background information; (2) <em>problem formulation</em>, in which the client's research question is translated into a precise statistical question; (3) <em>analysis</em>, in which appropriate statistical methods are selected and applied; (4) <em>communication</em>, in which results are conveyed to the client in a form they can use; and (5) <em>follow-up</em>, in which the consultant addresses subsequent questions and ensures the work is correctly applied and reported.
</div>

**Intake.** The first meeting sets the tone for the entire relationship. Before any statistical work can begin, the consultant must understand the scientific context: What is the research question? What motivated it? What does the client already know about the subject? What data have been collected or are planned? Effective intake requires active listening and thoughtful questioning — skills discussed at length in Chapter 2.

**Problem formulation.** Clients rarely arrive with a problem stated in statistical terms. A physician may ask "Is this drug effective?" A marketing analyst may ask "Which customers are most likely to churn?" Translating these into estimable statistical quantities — a difference in means, a logistic regression coefficient — requires both statistical knowledge and domain sensitivity. This translation is the intellectual heart of consulting and is taken up in detail in Chapter 2.

**Analysis.** Once the problem is formulated, method selection and data analysis proceed. The consultant must choose methods appropriate to the study design, the nature of the outcome and predictors, and the assumptions that can be reasonably sustained. Chapter 4 surveys the statistical methods most commonly encountered in consulting practice.

**Communication.** Analysis is not complete until results are communicated in a form the client can understand and act upon. This includes both the written consulting report and the verbal explanation offered in subsequent meetings. Chapter 5 is devoted to this phase.

**Follow-up.** A consultation rarely ends with the delivery of results. Clients return with additional questions, reviewers request additional analyses, or new data become available. The consultant must maintain enough documentation of the original engagement to respond efficiently to these subsequent needs.

## Section 1.3: Ethical Obligations

Statistical consulting carries ethical responsibilities that extend well beyond those of routine data analysis. The American Statistical Association's *Ethical Guidelines for Statistical Practice* provides the authoritative framework, and several considerations deserve particular attention.

**Authorship.** When the statistician's intellectual contribution to a research project is substantial — designing the study, developing the analytic strategy, interpreting the results — authorship on resulting publications is appropriate and should be discussed at the outset of the engagement. Conversely, the consultant should not accept authorship when the contribution has been merely clerical. The norms around authorship vary by discipline, and it falls to the consultant to navigate these conventions explicitly rather than leaving them to assumption.

**Data confidentiality.** Clients often share sensitive data — patient records, proprietary business information, personally identified survey responses. The consultant must handle such data with strict confidentiality, store it securely, and use it only for the purposes agreed upon. When in doubt, anonymize.

**Reporting negative and inconclusive results.** The pressure to report only statistically significant or favorable findings is real and must be resisted. A consulting report that omits results that fail to support the client's preferred conclusion is scientifically dishonest. The consultant has an obligation to present the complete picture, including null results, sensitivity analyses that challenge the main findings, and frank assessments of what the data do not support.

**Honesty about uncertainty.** Statistical conclusions are always uncertain, and clients frequently want more certainty than the data can provide. The ethical consultant communicates uncertainty clearly — through confidence intervals, sensitivity analyses, and explicit discussion of model assumptions — rather than projecting false confidence to satisfy the client.

**Conflicts of interest.** A consultant who is employed by a sponsor with a financial interest in the outcome of the analysis faces a potential conflict of interest. This situation is common in pharmaceutical research and corporate statistics. The professional response is disclosure, and in some cases recusal.

## Section 1.4: Common Pitfalls

Several failure modes recur in consulting practice and are worth naming explicitly.

**Premature analysis.** Rushing to run a regression or perform a t-test before the problem is adequately formulated wastes effort and often produces results that answer the wrong question. Discipline in the problem formulation phase pays dividends throughout.

**Insufficient domain knowledge.** Statistical expertise without understanding of the subject-matter context leads to technically correct but practically irrelevant analyses. The consultant should invest time in learning enough about the client's field to recognize when a proposed analysis conflicts with established domain knowledge.

**Failure to document.** Consulting engagements generate decisions — about variable definitions, analytic choices, exclusion criteria — that are easy to forget and difficult to reconstruct. Maintaining a written record of these decisions protects both the client and the consultant.

**Over-promising.** Clients often hope that statistical analysis will resolve their scientific uncertainty cleanly and completely. The consultant must set realistic expectations about what any analysis can achieve given the available data and study design.

**Communication breakdown.** The most technically sophisticated analysis is useless if the client does not understand the results. The ability to translate statistical concepts into accessible language — without sacrificing accuracy — is as important as technical skill, and is the central concern of Chapter 5.

---

# Chapter 2: Problem Formulation

The translation of a research question into a precise statistical question is perhaps the most intellectually demanding task in the consulting process. It requires that the consultant extract, from a client's sometimes vague or ambiguous description of their problem, a formal statement that can be operationalized in terms of data, parameters, and inferential goals. This chapter develops a systematic framework for problem formulation and discusses the documentation practices that support it.

## Section 2.1: The Art of Asking Questions

The intake conversation is the consultant's primary instrument for problem formulation. Effective questioning strategies are both an art and a learnable craft.

<div class="definition">
<strong>Open-ended vs. closed questions.</strong> An <em>open-ended question</em> invites the client to describe their problem in their own terms ("Can you tell me about your study?"), while a <em>closed question</em> elicits a specific piece of information ("How many subjects are in each group?"). Good consulting conversations deploy both types strategically — open questions early, to understand the landscape; closed questions later, to pin down specific details.
</div>

A common and useful framework for structuring the intake is to work systematically through the components of the research context:

- **The research question.** What scientific hypothesis or practical question motivates the study? Why does the answer matter?
- **The population.** Who or what are the subjects of inference? To what population do the conclusions need to generalize?
- **The study design.** Was the data collected experimentally or observationally? Were subjects randomly assigned to conditions or merely observed? Is the design prospective or retrospective?
- **The variables.** What is the primary outcome? What are the key predictors? What confounders are present or suspected?
- **Prior analyses.** Has any analysis already been attempted? What did it find? What led the client to seek help?
- **The decision context.** What will happen with the results? Who is the audience? Are regulatory or publication standards relevant?

Derr (2000) recommends that the consultant resist the temptation to jump to method selection before these contextual questions have been answered. The choice of statistical method should follow from a clear understanding of the research context, not precede it.

## Section 2.2: Identifying the Study Design

The study design is a fundamental determinant of what statistical inferences are possible.

<div class="definition">
<strong>Observational study.</strong> In an observational study, the investigator does not control the assignment of subjects to conditions. Data are collected on naturally occurring groups or on a random sample from a population. Causal inference from observational data requires strong additional assumptions and is always more fragile than causal inference from a randomized experiment.
</div>

<div class="definition">
<strong>Experimental study.</strong> In an experimental study, the investigator randomly assigns subjects to treatment conditions. Random assignment ensures that, in expectation, observed and unobserved confounders are balanced across groups, enabling clean causal inference. The randomized controlled trial (RCT) is the gold standard experimental design in clinical research.
</div>

The distinction between **prospective** and **retrospective** designs is also critical. In a prospective study, subjects are enrolled and followed forward in time; in a retrospective study, investigators look back at historical data. Retrospective studies are subject to recall bias, survivor bias, and selection bias in ways that prospective studies are not.

Within observational designs, the consultant should distinguish among **cross-sectional** designs (a snapshot at a single point in time), **cohort** designs (following a defined group forward), and **case-control** designs (comparing subjects with and without an outcome on the basis of prior exposures). Each design implies a different set of estimable parameters and applicable methods.

## Section 2.3: Response and Predictor Variables

Having established the study design, the consultant must identify the variables of interest and characterize their types, since variable types constrain method selection.

<div class="definition">
<strong>Response variable.</strong> The <em>response variable</em> (also called the outcome or dependent variable) is the quantity of primary scientific interest — the quantity whose distribution the investigator seeks to understand or predict. The statistical method is chosen primarily on the basis of the type of the response.
</div>

Common response variable types include: **continuous** (e.g., blood pressure, test score), **binary** (e.g., diseased vs. not diseased), **count** (e.g., number of hospitalizations), **time-to-event** (e.g., time from diagnosis to death), **ordinal** (e.g., Likert-scale ratings), and **multinomial** (e.g., tumor type). Each type calls for a different analytic approach.

**Predictor variables** (also called independent variables, explanatory variables, or covariates) are the variables used to explain or predict variation in the response. The consultant should help the client distinguish between: **primary predictors** (the exposures or treatments of central scientific interest), **confounders** (variables associated with both the primary predictor and the response, whose omission from the model would bias estimates), and **precision variables** (variables not causally related to the predictor but associated with the response, whose inclusion reduces residual variance and improves statistical efficiency).

## Section 2.4: Formulating Estimands

Once variables have been identified, the consultant and client should agree on the **estimand** — the precise population parameter to be estimated.

<div class="definition">
<strong>Estimand.</strong> An estimand is a well-defined function of the population distribution that represents the scientific quantity of interest. Specifying the estimand precisely — before data are analyzed — is a fundamental principle of transparent and reproducible statistical practice.
</div>

For example, if the client is interested in whether a new teaching intervention improves student test scores, the estimand might be:

\[
\delta = \mu_{\text{treatment}} - \mu_{\text{control}}
\]

where \( \mu_{\text{treatment}} \) and \( \mu_{\text{control}} \) are the population mean scores under the intervention and control conditions, respectively. Making this explicit — rather than speaking loosely of "the effect of the intervention" — helps prevent disagreements later about what was actually estimated.

For a logistic regression study, the estimand might be the population-average odds ratio for the primary exposure, conditional on a specified set of covariates. For a survival analysis, it might be the hazard ratio under the Cox proportional hazards model. The point is that the estimand should be stated precisely and agreed upon before analysis begins.

## Section 2.5: Documenting the Consultation

Good documentation is both a professional obligation and a practical necessity. Cabrera and McDougall (2002) recommend maintaining a **consultation log** for each engagement, recording at minimum:

- Date and participants of each meeting
- Statement of the research question as understood by the consultant
- Description of the dataset (source, variables, sample size, time period)
- Agreed-upon estimands and analysis plan
- Decisions made during the engagement, with rationale
- Deliverables produced and dates delivered

This log serves as a reference when the client returns with follow-up questions, as documentation in the event of disputes about what was agreed, and as a record for the consultant's own professional development. Many consulting centers maintain standardized intake forms to ensure that essential information is captured consistently.

<div class="example">
<strong>Example 2.1: A clinical research consultation.</strong> A nurse practitioner (NP) approaches the consulting center seeking help analyzing data from a retrospective chart review. She has extracted records for 200 patients who visited a walk-in clinic over a six-month period and wants to know "whether age and gender affect blood pressure."

In the intake conversation, the consultant asks clarifying questions and learns: (1) the NP is interested in systolic blood pressure as the outcome; (2) the primary predictors are patient age (continuous, in years) and sex (binary, male/female); (3) the data also include smoking status, BMI, and presence of diabetes — potential confounders the NP had not initially mentioned; (4) the goal is a summary for a quality improvement report, not a peer-reviewed publication.

The consultant documents the estimand as the partial regression coefficients for age and sex in a linear regression model for systolic blood pressure, adjusted for smoking status, BMI, and diabetes status. This formulation is more precise than "whether age and gender affect blood pressure" and makes the analysis plan explicit.
</div>

---

# Chapter 3: Exploratory Data Analysis and Communication

Exploratory data analysis (EDA) serves two purposes in the consulting context. First, it is a necessary step in understanding the data before formal modeling — identifying data quality issues, understanding distributions, detecting outliers and anomalous patterns. Second, EDA produces the visualizations and summary statistics that communicate the character of the data to the client, often forming the descriptive section of a consulting report. This chapter addresses both functions.

## Section 3.1: Univariate Summaries

For a single variable, the consultant's first task is to characterize its distribution. For **continuous** variables, the standard descriptive statistics are: the mean \( \bar{x} \), the median, the standard deviation \( s \), the interquartile range (IQR = Q3 − Q1), and measures of shape (skewness and excess kurtosis). For **categorical** variables, frequencies and proportions suffice.

<div class="definition">
<strong>Skewness.</strong> The skewness of a distribution is a measure of its asymmetry. For a sample \( x_1, \ldots, x_n \), the sample skewness is

\[
\hat{\gamma}_1 = \frac{\frac{1}{n} \sum_{i=1}^n (x_i - \bar{x})^3}{\left[\frac{1}{n} \sum_{i=1}^n (x_i - \bar{x})^2\right]^{3/2}}.
\]

A distribution with \( \hat{\gamma}_1 > 0 \) has a long right tail (positively skewed); \( \hat{\gamma}_1 < 0 \) indicates a long left tail. Heavy right skew is common in biological and economic data (e.g., income, serum biomarker concentrations) and motivates logarithmic transformations.
</div>

The choice between mean and median as the summary of center depends on context. In a consulting report for a non-specialist audience, the median and IQR are often more interpretable than the mean and standard deviation for skewed variables, because they are not distorted by extreme values.

## Section 3.2: Data Visualization Principles

Edward Tufte's foundational principle of the **data-ink ratio** holds that a good statistical graphic maximizes the proportion of ink devoted to representing actual data, and minimizes decorative or redundant elements. Applied to consulting graphics, this means: avoid chartjunk (gratuitous three-dimensional effects, heavy gridlines, unnecessary legends), prefer direct labels to legends where space permits, and choose the plot type that most clearly represents the data structure.

The **grammar of graphics** (Wilkinson, 1999; Wickham, 2010) conceptualizes a plot as a mapping from data variables to aesthetic attributes (position, color, size, shape) within a geometric object (point, line, bar, polygon) layered on a coordinate system. In R, the `ggplot2` package implements this grammar and provides a principled framework for constructing complex visualizations. In Tableau, the same underlying logic governs the placement of fields into rows, columns, and marks.

**Key principles for consulting graphics:**

- Match the plot type to the variable type and the question being asked.
- Label axes with variable names and units; never leave axes unlabeled.
- Use color purposefully — to encode a variable, not for decoration. Ensure colorblind accessibility.
- Show the data whenever possible (e.g., overlay raw points on a boxplot) rather than hiding them in summaries.
- State the sample size on every descriptive graphic.

## Section 3.3: Common Plot Types

<div class="definition">
<strong>Histogram.</strong> A histogram divides the range of a continuous variable into bins of equal width and displays the frequency or density within each bin. It is the primary tool for visualizing the shape of a univariate distribution. The choice of bin width is consequential: too few bins obscures shape; too many creates noise. The Freedman-Diaconis rule sets bin width to \( 2 \cdot \text{IQR} \cdot n^{-1/3} \), where \( n \) is the sample size.
</div>

<div class="definition">
<strong>Boxplot.</strong> A boxplot displays the median as a horizontal line, the IQR as a box, whiskers extending to the most extreme observations within 1.5 IQR of the box, and individual points beyond the whiskers as potential outliers. Boxplots are particularly useful for comparing distributions across groups.
</div>

<div class="definition">
<strong>QQ-plot.</strong> A quantile-quantile (QQ) plot compares the quantiles of an empirical distribution to the quantiles of a theoretical distribution (typically the standard normal). Observations lying along the diagonal reference line indicate agreement with the theoretical distribution; systematic departures reveal skewness, heavy tails, or multimodality. QQ-plots are the standard diagnostic for normality assumptions in linear regression.
</div>

<div class="definition">
<strong>Scatterplot.</strong> A scatterplot displays pairs \( (x_i, y_i) \) as points in two-dimensional space and is the primary tool for exploring bivariate relationships between continuous variables. Adding a smooth regression line (e.g., a LOESS curve in R via <code>geom_smooth(method = "loess")</code>) helps reveal nonlinear patterns that a straight line would obscure.
</div>

<div class="definition">
<strong>Heatmap.</strong> A heatmap encodes a matrix of values using color intensity. In consulting practice, heatmaps are used to display correlation matrices, to explore patterns in longitudinal data, or to visualize the results of cluster analyses. In Tableau, heatmaps are constructed by placing continuous variables on both rows and columns and encoding a third variable in the color mark.
</div>

## Section 3.4: Identifying Outliers and Influential Observations

An **outlier** is an observation that appears inconsistent with the bulk of the data. Outliers arise for several reasons: data entry errors, measurement failures, genuine extreme values from the same distribution, or observations from a different population. The statistical consultant must resist the temptation to delete outliers without investigation.

In regression contexts, two concepts are crucial:

- **Leverage.** An observation has high leverage if its predictor values are far from the center of the predictor space. High-leverage points have the potential to strongly influence the fitted regression line.
- **Influence.** An observation is influential if its removal would substantially change the fitted coefficients. Cook's distance is the standard measure of influence for ordinary least squares regression.

<div class="remark">
<strong>Remark.</strong> An observation can have high leverage without being influential (if it falls close to the regression line) and can be an outlier in the response direction without having high leverage. Cook's distance combines both dimensions and is preferred as a single diagnostic.
</div>

## Section 3.5: Missing Data Patterns

Missing data are endemic in consulting datasets and must be addressed before formal analysis. The framework due to Rubin (1976) classifies missingness into three mechanisms:

<div class="definition">
<strong>Missing Completely At Random (MCAR).</strong> Data are MCAR if the probability of missingness is independent of both the observed and unobserved values. Under MCAR, complete-case analysis (restricting to observations with no missing values) yields unbiased estimates, though with efficiency loss.
</div>

<div class="definition">
<strong>Missing At Random (MAR).</strong> Data are MAR if the probability of missingness, conditional on the observed data, is independent of the unobserved values. Under MAR, multiple imputation and full-information maximum likelihood yield valid inferences, while complete-case analysis is generally biased.
</div>

<div class="definition">
<strong>Missing Not At Random (MNAR).</strong> Data are MNAR if the probability of missingness depends on the unobserved values themselves (e.g., patients with high blood pressure are less likely to attend follow-up visits). MNAR is the most challenging mechanism and requires sensitivity analysis or explicit modeling of the missingness process.
</div>

In practice, distinguishing among these mechanisms from the data alone is impossible without additional assumptions. The consultant should explore missingness patterns graphically (e.g., using the `naniar` package in R), examine whether missingness is associated with observed covariates, and make a principled judgment about the most plausible mechanism.

**Multiple imputation** (Rubin, 1987) is the preferred approach for handling MAR missingness in most consulting settings. The procedure generates \( m \) complete datasets by imputing missing values from their predictive distribution given the observed data, fits the analysis model to each imputed dataset, and combines the results using Rubin's rules:

\[
\bar{Q} = \frac{1}{m} \sum_{j=1}^{m} \hat{Q}_j, \qquad T = \bar{U} + \left(1 + \frac{1}{m}\right) B,
\]

where \( \bar{Q} \) is the pooled estimate, \( \bar{U} \) is the average within-imputation variance, and \( B \) is the between-imputation variance. In R, the `mice` package implements multiple imputation by chained equations (MICE).

---

# Chapter 4: Common Statistical Consulting Problems

This chapter surveys the statistical methods most frequently encountered in consulting practice, with emphasis on the practical knowledge a consultant needs to advise clients effectively: what assumptions the methods require, how to diagnose violations, and how to explain results to non-specialists.

## Section 4.1: Linear Regression

**Ordinary least squares (OLS)** regression models a continuous response \( Y \) as a linear function of predictors \( X_1, \ldots, X_p \):

\[
Y_i = \beta_0 + \beta_1 X_{i1} + \cdots + \beta_p X_{ip} + \varepsilon_i, \quad \varepsilon_i \overset{\text{iid}}{\sim} N(0, \sigma^2).
\]

The OLS estimator minimizes the residual sum of squares and, under the Gauss-Markov assumptions, is the best linear unbiased estimator (BLUE).

**Core assumptions.** The four key assumptions, easily remembered via the acronym LINE, are: **L**inearity (the mean of \( Y \) is a linear function of the predictors), **I**ndependence (observations are independent), **N**ormal errors (the residuals are normally distributed), and **E**qual variance (homoscedasticity — the residual variance does not depend on the predictors or the fitted values).

**Residual diagnostics.** Each assumption is assessed via residual plots:

- *Residuals vs. fitted values:* a random horizontal band indicates linearity and homoscedasticity; a fan pattern suggests heteroscedasticity; a curved pattern suggests nonlinearity.
- *QQ-plot of residuals:* departures from the diagonal indicate non-normality.
- *Scale-location plot:* plots \( \sqrt{|\text{residual}|} \) vs. fitted values; an increasing trend signals heteroscedasticity.
- *Residuals vs. leverage:* identifies high-influence observations.

**Transformations.** When linearity or homoscedasticity is violated, a transformation of the response is often effective. The Box-Cox family of power transformations includes the log transformation as the special case \( \lambda \to 0 \):

\[
Y^{(\lambda)} = \begin{cases} \frac{Y^\lambda - 1}{\lambda} & \lambda \neq 0 \\ \log Y & \lambda = 0. \end{cases}
\]

The R function `MASS::boxcox()` estimates \( \lambda \) by maximum likelihood. In practice, transformations should be chosen to satisfy model assumptions, not to optimize statistical significance.

**Multicollinearity.** When predictors are highly correlated, OLS estimates remain unbiased but have inflated variance, making individual coefficient estimates unstable and difficult to interpret. The **variance inflation factor** for predictor \( j \) is:

\[
\text{VIF}_j = \frac{1}{1 - R_j^2},
\]

where \( R_j^2 \) is the \( R^2 \) from regressing \( X_j \) on all other predictors. A VIF exceeding 10 (some sources use 5) is often taken as evidence of problematic multicollinearity. Remedies include removing redundant predictors, centering continuous predictors, or using ridge regression.

## Section 4.2: Logistic Regression

When the response is binary, OLS regression is inappropriate because predicted values need not lie in \( \left[0, 1\right] \) and because the variance of a binary outcome depends on its mean. Logistic regression models the log-odds of the response as a linear function of the predictors:

\[
\log\left(\frac{\pi_i}{1 - \pi_i}\right) = \beta_0 + \beta_1 X_{i1} + \cdots + \beta_p X_{ip},
\]

where \( \pi_i = P(Y_i = 1 \mid \mathbf{X}_i) \). The model is estimated by maximum likelihood.

**Interpretation.** The exponentiated coefficient \( e^{\hat\beta_j} \) is the estimated **odds ratio** (OR) for a one-unit increase in \( X_j \), holding other predictors constant. For rare outcomes, the odds ratio approximates the relative risk; for common outcomes, the approximation breaks down and the distinction is clinically important.

<div class="example">
<strong>Example 4.1: Interpreting an odds ratio.</strong> A logistic regression of 30-day hospital readmission (binary) on age, sex, and comorbidity index yields a coefficient of 0.45 for the comorbidity index. The corresponding odds ratio is \( e^{0.45} \approx 1.57 \). This means that for each one-unit increase in the comorbidity index, the odds of 30-day readmission increase by a factor of 1.57, adjusting for age and sex. If the baseline readmission rate is, say, 8%, an odds ratio of 1.57 corresponds to an approximate relative risk of 1.51 — a reasonable approximation — but at a 40% baseline rate, the odds ratio and relative risk diverge substantially.
</div>

**Goodness of fit.** The **Hosmer-Lemeshow test** assesses whether the observed proportions of outcomes match the model's predicted probabilities across deciles of predicted probability. The test statistic is:

\[
\hat{C} = \sum_{k=1}^{10} \frac{(O_k - E_k)^2}{E_k(1 - E_k / n_k)},
\]

where \( O_k \) and \( E_k \) are the observed and expected numbers of events in the \( k \)-th decile and \( n_k \) is the number of observations in that decile. Under good fit, \( \hat{C} \) is approximately \( \chi^2 \) with 8 degrees of freedom. A large \( p \)-value indicates no evidence of lack of fit; however, the test has low power in small samples and excessive power in large samples, so it should be supplemented by graphical diagnostics.

**Model diagnostics for logistic regression** include: deviance residuals, Pearson residuals, and plots of residuals against fitted values or covariates. The ROC curve and its area (AUC, or c-statistic) measure the model's discriminative ability and are often more useful than the Hosmer-Lemeshow test for assessing overall model quality.

## Section 4.3: Analysis of Variance (ANOVA)

**One-way ANOVA** tests whether the means of a continuous response differ across \( k \geq 2 \) groups. The model is:

\[
Y_{ij} = \mu + \alpha_i + \varepsilon_{ij}, \quad \varepsilon_{ij} \overset{\text{iid}}{\sim} N(0, \sigma^2),
\]

where \( \mu \) is the overall mean, \( \alpha_i \) is the effect of the \( i \)-th group (with \( \sum_i \alpha_i = 0 \)), and \( \varepsilon_{ij} \) are independent errors. The \( F \)-statistic compares the between-group mean square to the within-group mean square:

\[
F = \frac{\text{MS}_\text{between}}{\text{MS}_\text{within}} \sim F(k-1, N-k) \text{ under } H_0.
\]

The assumptions are: normality of residuals within each group, homogeneity of variance across groups (assessed with Levene's test), and independence of observations. When variance homogeneity is violated, Welch's ANOVA is a robust alternative.

**Post-hoc testing.** A significant \( F \)-test tells the investigator that at least one pair of group means differs, but does not identify which pairs. Post-hoc tests address this:

- **Tukey's HSD** controls the familywise error rate (FWER) at \( \alpha \) for all pairwise comparisons. It is the recommended default when all pairwise comparisons are of equal interest.
- **Bonferroni correction** divides \( \alpha \) by the number of comparisons \( m \), testing each at level \( \alpha / m \). It is conservative but simple and appropriate when comparisons are pre-specified.
- **Dunnett's test** compares each treatment group to a control group and is more powerful than Tukey's HSD when this is the structure of the comparisons.

**Two-way ANOVA** extends the model to two crossed factors:

\[
Y_{ijk} = \mu + \alpha_i + \beta_j + (\alpha\beta)_{ij} + \varepsilon_{ijk}.
\]

The interaction term \( (\alpha\beta)_{ij} \) captures whether the effect of one factor depends on the level of the other. An interaction plot (plotting cell means with lines connecting the levels of one factor, for each level of the other) is the natural graphical diagnostic for interaction. Non-parallel lines suggest an interaction; crossed lines indicate a qualitative interaction (the direction of the effect reverses).

## Section 4.4: Survival Analysis

Survival analysis deals with time-to-event outcomes, where the event of interest (death, disease recurrence, equipment failure) may not have occurred for all subjects by the end of the study period — a phenomenon known as **censoring**.

<div class="definition">
<strong>Right censoring.</strong> An observation is right-censored if the event had not occurred by the time of last contact. The censored observation contributes information about the survival distribution up to the censoring time, but the exact event time is unknown. Kaplan-Meier and Cox model analyses assume that censoring is <em>uninformative</em> (non-informative censoring): the reason for censoring is unrelated to the subject's prognosis.
</div>

**Kaplan-Meier estimator.** The Kaplan-Meier (KM) estimator is a nonparametric estimate of the survival function \( S(t) = P(T > t) \):

\[
\hat{S}(t) = \prod_{t_j \leq t} \left(1 - \frac{d_j}{n_j}\right),
\]

where the product is taken over all observed event times \( t_j \leq t \), \( d_j \) is the number of events at time \( t_j \), and \( n_j \) is the number of subjects at risk just before \( t_j \). The KM curve is a step function that decreases at each observed event time.

**Log-rank test.** The log-rank test compares the survival functions of two or more groups without imposing a parametric form:

\[
\chi^2 = \frac{\left(\sum_j (O_{1j} - E_{1j})\right)^2}{\sum_j V_{1j}},
\]

where \( O_{1j} \) and \( E_{1j} \) are the observed and expected number of events in group 1 at time \( t_j \), and \( V_{1j} \) is the variance of the hypergeometric distribution under the null hypothesis. The statistic is approximately \( \chi^2(1) \) under \( H_0 \) for a two-group comparison.

<div class="remark">
<strong>Remark.</strong> The log-rank test is most powerful when the hazard ratio between groups is constant over time (the proportional hazards assumption). When hazards cross — that is, when one group has better early survival but worse late survival — the log-rank test may fail to detect a difference. In such cases, weighted versions (e.g., the Wilcoxon-Gehan test, which upweights early differences) may be more appropriate.
</div>

**Cox proportional hazards model.** The Cox model is a semiparametric regression model for the hazard function:

\[
h(t \mid \mathbf{X}) = h_0(t) \exp\!\left(\beta_1 X_1 + \cdots + \beta_p X_p\right),
\]

where \( h_0(t) \) is the unspecified baseline hazard. The model is estimated by partial likelihood, which eliminates \( h_0(t) \) from the likelihood. The key quantity of interest is the hazard ratio: for a one-unit increase in \( X_j \), the hazard is multiplied by \( e^{\beta_j} \). The **proportional hazards assumption** — that the hazard ratio between any two subjects is constant over time — should be assessed with Schoenfeld residual plots or a formal test (e.g., `cox.zph()` in R).

## Section 4.5: Sample Size and Power

One of the most common consulting requests is the calculation of sample size for a planned study. Sample size calculations require explicit specifications of:

- The primary outcome and the statistical test to be used
- The effect size of practical or clinical significance (the smallest difference worth detecting)
- The significance level \( \alpha \) (typically 0.05)
- The desired power \( 1 - \beta \) (typically 0.80 or 0.90)
- The assumed variability in the outcome (for continuous outcomes)
- The anticipated event rate (for binary or time-to-event outcomes)

For a two-sample comparison of means with equal group sizes \( n \) per group, common variance \( \sigma^2 \), and two-sided test at level \( \alpha \):

\[
n = \frac{2\sigma^2 (z_{\alpha/2} + z_\beta)^2}{\delta^2},
\]

where \( \delta = |\mu_1 - \mu_2| \) is the target difference and \( z_p \) is the \( p \)-th quantile of the standard normal distribution. For \( \alpha = 0.05 \) and \( 1 - \beta = 0.80 \), \( (z_{0.025} + z_{0.20})^2 = (1.96 + 0.84)^2 \approx 7.85 \).

<div class="remark">
<strong>Remark.</strong> For complex designs — cluster-randomized trials, crossover designs, designs with stratified randomization, or outcomes requiring survival analysis — closed-form formulas are often unavailable or make strong assumptions. Simulation-based sample size calculation is then preferred: one specifies the data-generating process and the analysis plan, simulates many replicate datasets, applies the analysis to each, and estimates the proportion of simulations that yield a statistically significant result. In R, this approach is readily implemented and allows the analyst to relax assumptions that closed-form formulas impose.
</div>

The sample size formula should always be presented with its assumptions made explicit. A consulting report should state the assumed effect size, variability, and event rate, and explain where these values came from (literature estimates, pilot data, clinical judgment). Sensitivity analyses showing how the required sample size changes as assumptions vary are strongly recommended.

## Section 4.6: Repeated Measures and Longitudinal Data

Longitudinal studies follow subjects over time and collect multiple measurements per subject. The observations within a subject are correlated, violating the independence assumption of standard ANOVA and regression. Two major approaches address this:

**Linear mixed-effects models.** The linear mixed-effects (LME) model extends the linear regression model by including both **fixed effects** (population-level parameters, as in standard regression) and **random effects** (subject-specific deviations that account for within-subject correlation):

\[
\mathbf{Y}_i = \mathbf{X}_i \boldsymbol{\beta} + \mathbf{Z}_i \mathbf{b}_i + \boldsymbol{\varepsilon}_i,
\]

where \( \mathbf{b}_i \sim N(\mathbf{0}, \mathbf{D}) \) are the random effects for subject \( i \) and \( \boldsymbol{\varepsilon}_i \sim N(\mathbf{0}, \sigma^2 \mathbf{I}) \) are the residual errors. The random effects induce a within-subject covariance structure. In R, LME models are fitted with `lme4::lmer()` or `nlme::lme()`.

**Generalized estimating equations.** Generalized estimating equations (GEE) extend generalized linear models to correlated data by specifying a "working" correlation structure for the within-subject observations. Unlike LME models, GEE targets **marginal** (population-average) effects rather than subject-specific effects. GEE estimates are consistent even if the working correlation structure is misspecified, provided the mean model is correct. The R package `geepack` provides an implementation.

<div class="definition">
<strong>Subject-specific vs. population-average interpretation.</strong> In a mixed-effects logistic regression, the coefficient \( \beta_1 \) represents the change in log-odds for a one-unit increase in \( X_1 \) <em>for a given individual at their random-effect value</em>. In GEE, the coefficient represents the change in log-odds averaged over the population distribution of random effects. For linear models, subject-specific and population-average coefficients coincide; for nonlinear models (logistic, Poisson), they differ, and the choice between them should be driven by the scientific question.
</div>

The specification of the **covariance structure** in an LME model is both a modeling choice and a source of uncertainty. Common structures include: unstructured (most general, most parameter-intensive), compound symmetry (equal correlations between all pairs of time points — the assumption underlying repeated-measures ANOVA), AR(1) (correlations decay geometrically with time lag), and Toeplitz (arbitrary correlation at each lag). Structure selection is typically guided by AIC or BIC, compared across models fit by maximum likelihood (not REML, when comparing mean structures; REML is appropriate when comparing variance structures only).

---

# Chapter 5: Communicating Statistical Results

The statistical analysis is complete when it is communicated — not when the last model has been fitted. A consulting engagement that produces technically impeccable analyses but fails to convey the findings to the client in a form they can understand and use has failed. This chapter addresses the two primary modes of communication: the written consulting report and the oral presentation.

## Section 5.1: Structuring a Consulting Report

A consulting report is a professional document addressed to a client who may have limited statistical background. Its structure should prioritize the client's needs: what do they need to know, in what order, to make use of the findings?

The standard structure of a consulting report comprises:

**Executive summary.** A brief (one-half to one page) non-technical summary of the main findings and their implications. Written last, placed first. The executive summary should be comprehensible to a reader who does not read the rest of the report. It should not contain statistical jargon, \( p \)-values, or model names.

**Introduction and background.** A statement of the research question in the client's own terms, contextualizing the analysis within the client's research area.

**Data description.** A description of the dataset: source, variables, sample size, time period, and any data cleaning or exclusions performed. This section should include Table 1 — the descriptive statistics table that characterizes the analytic sample.

**Statistical methods.** A clear description of the statistical methods used, at a level of detail sufficient for a statistically literate reader to reproduce the analysis. Software and version should be cited. This section is typically written for a peer reviewer, not the client — it is the technical section of the report.

**Results.** Presentation of findings, typically organized to mirror the methods section. Point estimates and confidence intervals are preferred over \( p \)-values alone. Figures and tables should be numbered, captioned, and integrated into the narrative.

**Conclusions and limitations.** Interpretation of the findings in the context of the research question. What do the results mean? What are the limitations of the analysis (sample size, potential confounding, missing data, generalizability)? What follow-up analyses or data collection would address the limitations?

## Section 5.2: Writing for Non-Specialists

Statistical prose written for clients without a quantitative background requires translation — not simplification — of the statistical content. Several principles apply.

**Replace jargon with plain language.** "The difference was statistically significant at the 5% level" can be replaced with "We found strong evidence of a difference between the two groups; if there were no true difference, results as extreme as ours would arise less than 5% of the time by chance." This is longer, but it is honest and interpretable.

**Lead with the finding, not the method.** Clients are interested in conclusions, not procedures. "The intervention reduced hospital readmission rates by 12 percentage points (95% CI: 5 to 19 percentage points)" is more useful than "The logistic regression coefficient for the intervention indicator was −0.55 (SE = 0.18, \( p = 0.002 \))."

**Distinguish statistical from practical significance.** With large samples, even trivially small effects reach statistical significance. The report should address the magnitude of the effect and its practical importance, not merely its statistical significance.

**Present uncertainty visually.** Error bars, shaded confidence bands on regression curves, and forest plots communicate uncertainty more intuitively than numerical confidence intervals for many readers. Use these tools in figures even when numerical intervals are provided in the text.

## Section 5.3: Presenting Uncertainty

The communication of statistical uncertainty is one of the most consequential aspects of the consulting report. Two frameworks are in common use.

**Confidence intervals.** A \( 100(1-\alpha)\% \) confidence interval for a parameter \( \theta \) is an interval \( \left[\hat{L}, \hat{U}\right] \) constructed such that, under repeated sampling, the interval covers \( \theta \) with probability at least \( 1 - \alpha \). The interval conveys both the magnitude of the estimate and the precision with which it is determined. A wide interval signals that the data provide little information about \( \theta \); a narrow interval signals high precision.

<div class="remark">
<strong>A common misconception.</strong> A 95% confidence interval does not mean "there is a 95% probability that the true parameter lies in the interval." The parameter is fixed (frequentist framework); the interval is random. The correct interpretation is that the procedure produces intervals that contain the true parameter 95% of the time in repeated samples. When communicating to non-specialists, Bayesian credible intervals (which do permit probability statements about the parameter) may be more intuitive, provided the analysis uses a Bayesian framework.
</div>

**\( p \)-values.** The \( p \)-value is the probability, under the null hypothesis, of observing test statistics at least as extreme as the one computed. It is a measure of the strength of evidence against the null hypothesis, not the probability that the null is true, and not a measure of effect size. The consultant should be prepared to explain these common misinterpretations to clients.

## Section 5.4: Oral Presentation Skills

Many consulting engagements conclude with an oral presentation to the client, their research group, or (in the case of graduate student clients) a thesis committee. The oral presentation demands a different set of skills than the written report.

**Structure.** A consulting presentation should follow the same logical arc as the report — question, data, methods, results, conclusions — but at a higher level of abstraction. The audience cannot re-read slides; every point must be comprehensible on first hearing.

**Slide design.** Each slide should make one point. The title of the slide should be a declarative sentence stating the conclusion (e.g., "Patients receiving the intervention had significantly lower readmission rates") rather than a label (e.g., "Logistic Regression Results"). Slides should not be read aloud; the presenter's spoken words should complement the visual, not duplicate it.

**Handling questions.** Consultants are frequently asked questions whose honest answer is "I don't know" or "the data cannot answer that." The professional response is to say so clearly and to explain what additional data or analysis would be needed. Attempting to bluff or to answer a different question than the one asked damages the consultant's credibility.

**Visualization in presentations.** Graphics in presentations should be simpler than graphics in reports. Remove all elements that cannot be seen clearly from the back of the room. Use animation sparingly and purposefully — to reveal elements sequentially when the sequence supports understanding.

## Section 5.5: Responding to Reviewer Comments

When a client's manuscript is submitted for peer review, the statistical analyses may attract reviewer criticism. Statistical consultants are often called upon to help respond to such criticism. A few principles:

- Address every statistical comment substantively. "We have addressed the reviewer's concern" is not a response.
- When a reviewer requests an analysis that is inappropriate (e.g., a parametric test when the data clearly violate its assumptions), explain politely and in writing why the original approach is preferred and, if feasible, present the requested analysis as a sensitivity check.
- When a reviewer identifies a genuine error or oversight, acknowledge it directly, correct it, and describe the impact on the conclusions.
- Maintain a detailed revision log documenting what changed and why; this protects the consultant and the client if further rounds of review raise the same issues.

---

# Chapter 6: Managing the Consulting Relationship

Beyond the technical and communicative dimensions of consulting, there are practical dimensions of relationship management that determine whether an engagement is successful. This chapter addresses the processes and professional skills that support effective consulting relationships over time.

## Section 6.1: Intake Forms and Documentation

Many statistical consulting centers use standardized intake forms to ensure that essential information is captured at the first meeting. A well-designed intake form collects:

- Client contact information and affiliation
- Funding source and any relevant conflicts of interest
- Description of the research project (in the client's own words)
- Study design, sample size, and data availability
- Proposed timeline and any imminent deadlines
- Prior statistical analyses performed
- Specific questions for the consultant

The intake form serves as the foundation of the consultation log and ensures that nothing critical is omitted from the first meeting. It also signals professionalism and sets appropriate expectations about the consulting process.

## Section 6.2: Scope Management

One of the most common sources of dissatisfaction in consulting relationships is scope creep: the gradual expansion of the agreed-upon work beyond what was originally planned. Scope creep is costly for the consultant and leads to frustration on both sides.

Effective scope management begins at the first meeting, with an explicit conversation about what the engagement will and will not include. The agreed scope should be documented in writing — informally in a follow-up email, or formally in a consulting agreement if the engagement is substantial. When a client requests work outside the agreed scope, the consultant should acknowledge the request, assess its feasibility, and renegotiate the timeline or resources before proceeding.

<div class="definition">
<strong>The consulting agreement.</strong> For substantive engagements — particularly those involving grant-funded research or commercial clients — a written consulting agreement specifying the scope of work, deliverables, timeline, compensation, authorship arrangements, and data handling procedures provides legal and professional protection for both parties.
</div>

## Section 6.3: Setting Realistic Expectations

Clients often arrive with unrealistic expectations about what statistical analysis can achieve. Common unrealistic expectations include:

- Expecting a definitive answer from an underpowered study
- Expecting the statistician to "fix" methodological problems in an existing dataset that cannot be corrected after the fact
- Expecting rapid turnaround on complex analyses
- Expecting statistical significance from a study with an effect size smaller than the minimum detectable under the sample size

The consultant's responsibility is to set realistic expectations early — not to discourage the client, but to help them allocate their time and resources effectively. When a study is underpowered, this is best communicated before the data are collected; after the fact, the consultant can only report what was found, with appropriate caveats about precision.

## Section 6.4: Collaboration Dynamics

The statistical consultant may occupy different positions within a research team, and these positions carry different obligations and opportunities.

**The statistician as hired consultant.** In this model, the client retains the statistician to perform specified analyses in exchange for compensation. The statistician is answerable to the client and is not typically a co-investigator. The risk in this model is that pressure from the client may compromise the statistician's independence; the professional response is to maintain independence and to document decisions clearly.

**The statistician as co-investigator.** When the statistician is involved from the study design stage, contributes to grant applications, and shares responsibility for the scientific conclusions, co-investigator status — and co-authorship — is appropriate. This model requires a deeper investment in the research area and entails co-responsibility for the scientific integrity of the work.

**The statistician as employee.** In an industry context, the statistician is typically an employee who reports to a manager and works within a regulated environment (e.g., pharmaceutical GxP regulations, financial reporting requirements). Here, professional independence may be in tension with organizational pressures, and the statistician must navigate this tension with care and, where necessary, escalate concerns through appropriate channels.

## Section 6.5: Managing Revisions

Consulting reports are rarely final on first delivery. Clients review the report, identify areas of confusion or new questions, and request revisions. Managing revisions effectively requires:

- **Version control.** Every version of the report and the analysis code should be saved and labeled clearly. The R script or R Markdown document used to generate the results should be committed to version control (e.g., Git) so that any version can be reproduced exactly.
- **A clear revision process.** Agree with the client on a process for submitting revision requests (e.g., track changes in a Word document, annotated PDF, or a structured email) so that revisions are specific and documented.
- **Distinguishing revisions from new work.** If a revision request constitutes substantially new analysis — new models, new outcome variables, new subgroup analyses — this should be recognized as a scope change and managed accordingly.

## Section 6.6: Professional Development for Statistical Consultants

Statistical consulting is a craft that develops over a career. Several practices support ongoing professional development:

**Peer consultation.** Difficult consulting problems benefit from a second perspective. Many consulting centers hold regular case review meetings where consultants present challenging cases to their colleagues. This peer review process improves individual analyses and builds collective expertise.

**Domain learning.** The breadth of subject areas a consultant encounters is both the greatest challenge and the greatest intellectual reward of consulting practice. Consultants should invest systematically in learning the fundamentals of the domains in which they work most frequently — whether that means reading epidemiology textbooks, attending seminars in the client's department, or completing online courses in domain-specific methodology.

**Staying current in methodology.** Statistical methods evolve continuously. The consultant should maintain awareness of developments in the fields most relevant to their practice — causal inference, Bayesian computation, machine learning, or whatever the client base demands — and should be honest with clients about the limits of their current expertise.

**Reflective practice.** After each consulting engagement, the thoughtful consultant asks: What worked? What would I do differently? Where did I lack the knowledge I needed? Keeping a private reflective journal of lessons learned from consulting engagements is a practice recommended by Derr (2000) and one that has deep roots in professional education across the learned professions.

<div class="remark">
<strong>Remark.</strong> The American Statistical Association (ASA) Section on Statistical Consulting provides resources for consulting practitioners at all career stages, including webinars, a newsletter, and guidance documents on professional practice. Graduate students preparing for consulting careers are encouraged to engage with these resources and to participate in the ASA's consulting community.
</div>

---

# Chapter 7: Integrated Case Studies

The preceding chapters have treated the components of statistical consulting — problem formulation, EDA, method selection, communication, and relationship management — as distinct topics. In practice they are intertwined: decisions made in the formulation phase constrain what analyses are possible; the audience for the report shapes how results are communicated; the client relationship affects what questions can be asked. This chapter presents integrated case studies that illustrate the full consulting process from intake to delivery.

## Section 7.1: Case Study — Evaluating a Health Intervention

A public health researcher approaches the consulting center three weeks before a grant deadline. She has collected data from 180 adults enrolled in a community wellness program (90 in an intervention group, 90 in a wait-list control group) and needs to demonstrate that the intervention reduced BMI over a 12-week period.

**Intake.** The consultant learns that (1) subjects were not randomly assigned — they chose whether to enroll in the program; (2) BMI was measured at baseline and at 12 weeks; (3) the dataset contains age, sex, baseline BMI, and self-reported physical activity level, but 22 subjects (12%) are missing the 12-week BMI measurement; (4) the grant deadline is immovable.

**Problem formulation.** The scientific question is whether the intervention reduces BMI. Because assignment was not random, the intervention and control groups may differ systematically at baseline — indeed, the intervention group has a higher baseline mean BMI (32.1 vs. 29.4 kg/m²). The estimand is the **adjusted mean difference** in 12-week BMI change between groups, after controlling for baseline BMI, age, sex, and physical activity.

The consultant explains to the researcher that no statistical adjustment can fully correct for unmeasured confounding in an observational study, and that the grant narrative should describe the findings as "associations" rather than "effects of the intervention."

**EDA.** Histograms of BMI at baseline and 12 weeks, stratified by group, reveal that the distributions are approximately symmetric. A scatter plot of 12-week vs. baseline BMI shows a strong positive linear relationship. The missing data pattern suggests that subjects with higher baseline BMI are more likely to be missing 12-week measurements — a pattern consistent with MAR (missingness related to observed baseline BMI).

**Analysis.** The consultant fits a linear regression of change in BMI (12-week minus baseline) on group indicator, adjusting for baseline BMI, age, sex, and physical activity. Multiple imputation with 20 imputed datasets is used to handle the missing 12-week measurements, with baseline BMI, age, sex, and physical activity as imputation covariates.

The adjusted mean difference is −1.2 kg/m² (95% CI: −2.1 to −0.3 kg/m²), indicating that intervention participants showed a greater reduction in BMI than control participants, on average, after adjusting for the baseline covariates.

**Communication.** The consulting report leads with the finding: "Participants in the wellness program showed a greater average reduction in BMI than wait-list controls (−1.2 kg/m²; 95% CI: −2.1 to −0.3 kg/m²), after adjusting for baseline BMI, age, sex, and physical activity level." The limitations section explicitly acknowledges the observational design, the potential for residual confounding, and the missing data.

## Section 7.2: Case Study — Sample Size Consultation for a Clinical Trial

A medical resident seeks advice on the sample size required for a planned randomized controlled trial comparing two antibiotic regimens for skin and soft-tissue infections. The primary outcome is clinical cure (binary) at day 10. Based on the literature, the cure rate under the standard regimen is approximately 75%, and a difference of 10 percentage points is considered clinically meaningful. The trial will use a two-sided test at \( \alpha = 0.05 \) with desired power of 80%.

**Calculation.** For a two-sample comparison of proportions with \( p_1 = 0.75 \), \( p_2 = 0.85 \), two-sided \( \alpha = 0.05 \), and \( 1 - \beta = 0.80 \), the required sample size per group is approximately:

\[
n = \frac{(z_{\alpha/2} + z_\beta)^2 (p_1(1-p_1) + p_2(1-p_2))}{(p_1 - p_2)^2} \approx \frac{7.85 \times (0.1875 + 0.1275)}{0.01} \approx 247 \text{ per group}.
\]

Accounting for an anticipated 15% dropout rate, the required enrollment is \( 247 / 0.85 \approx 291 \) per group, or 582 total.

**Sensitivity analysis.** The consultant presents a table showing required sample sizes under varying assumptions about the baseline cure rate and the minimum detectable difference. This allows the research team to understand how sensitive the sample size requirement is to the assumed parameters and to discuss whether 582 subjects is feasible given recruitment constraints.

**Report.** The sample size section of the grant application reads: "We estimate that 291 subjects per arm (582 total) will be required to detect a 10 percentage point difference in clinical cure rates (75% vs. 85%) with 80% power at a two-sided significance level of 5%, accounting for 15% loss to follow-up. Sample size was calculated using the formula for the comparison of two independent proportions."

---

## Appendix: R Code Reference for Common Consulting Tasks

The following R code snippets illustrate implementations of the statistical methods discussed in this course. They are intended as starting points for consulting practice, not as production-ready scripts.

**Linear regression with diagnostics:**
```r
# Fit linear regression
fit <- lm(systolic_bp ~ age + sex + smoking + bmi + diabetes, data = df)
summary(fit)

# Residual diagnostic plots
par(mfrow = c(2, 2))
plot(fit)

# Variance inflation factors
library(car)
vif(fit)
```

**Logistic regression with Hosmer-Lemeshow test:**
```r
# Fit logistic regression
fit_logit <- glm(readmit ~ age + sex + comorbidity, 
                 data = df, family = binomial)
summary(fit_logit)
exp(coef(fit_logit))            # Odds ratios
exp(confint(fit_logit))         # 95% CIs for odds ratios

# Hosmer-Lemeshow test
library(ResourceSelection)
hoslem.test(fit_logit[["y"]], fitted(fit_logit), g = 10)
```

**Kaplan-Meier curve and log-rank test:**
```r
library(survival)
library(survminer)

# Kaplan-Meier estimator
km_fit <- survfit(Surv(time, event) ~ group, data = df)
ggsurvplot(km_fit, data = df, pval = TRUE, 
           risk.table = TRUE, conf.int = TRUE)

# Log-rank test
survdiff(Surv(time, event) ~ group, data = df)

# Cox proportional hazards model
cox_fit <- coxph(Surv(time, event) ~ group + age + sex, data = df)
summary(cox_fit)
cox.zph(cox_fit)   # Test proportional hazards assumption
```

**Multiple imputation:**
```r
library(mice)

# Impute missing data
imp <- mice(df, m = 20, method = "pmm", seed = 42)

# Fit model to each imputed dataset and pool
fit_imp <- with(imp, lm(outcome ~ treatment + age + sex + bmi))
pool(fit_imp)
summary(pool(fit_imp))
```

**Mixed-effects model for longitudinal data:**
```r
library(lme4)

# Random intercept model
fit_lme <- lmer(outcome ~ time * treatment + age + (1 | subject_id), 
                data = df_long, REML = TRUE)
summary(fit_lme)

# Random intercept and slope
fit_lme2 <- lmer(outcome ~ time * treatment + age + (time | subject_id),
                 data = df_long, REML = TRUE)
AIC(fit_lme, fit_lme2)   # Compare models
```

**Power and sample size:**
```r
# Two-sample t-test power
power.t.test(n = NULL, delta = 5, sd = 10, 
             sig.level = 0.05, power = 0.80,
             type = "two.sample", alternative = "two.sided")

# Two-sample proportions
power.prop.test(n = NULL, p1 = 0.75, p2 = 0.85,
                sig.level = 0.05, power = 0.80,
                alternative = "two.sided")
```
