---
title: "ECON 322: Introduction to Econometrics"
prof: "Multiple Instructors"
term: "1215 (Spring 2021)"
university: "University of Waterloo"
---

# Unit 1: Introduction to Econometrics

## 1.1 What Is Econometrics?

**Econometrics** is, in general, a statistical toolset that helps us evaluate relationships of interest between economic variables. Rather than simply describing data, econometrics provides a rigorous quantitative framework for estimating the strength and direction of relationships in the presence of uncertainty, noise, and the fact that we rarely have access to complete population data.

A classic motivating example is the relationship between an individual's level of education and the wage they can expect to earn. If one were to plot years of education on the horizontal axis against wages on the vertical axis for a sample of individuals, one might observe a general positive tendency: those with more years of education tend to earn higher wages. Econometrics is the toolkit that allows us to draw a line through the centre of those points, quantifying precisely how much wages increase on average for each additional year of education.

<div class="definition"><strong>Microeconometrics:</strong> The branch of econometrics concerned with relationships at the level of individual agents — households, firms, or people — drawing analogy to microeconomics. Examples include the effect of education on wages or the effect of TV advertising spend on a company's sales.</div>

<div class="definition"><strong>Macroeconometrics:</strong> The branch of econometrics concerned with aggregate relationships — for instance, the effect of interest rate changes on inflation, or the relationship between government spending and GDP growth.</div>

In all of these settings, the econometric story is structurally similar. There is some **population** — which, in the case of time-series data, is sometimes called a **data generating process** — within which there exists a true relationship between the variables of interest. That true relationship is governed by **population parameters**, such as \(\beta\), which quantifies the average effect of one additional year of education on wages. Alongside the systematic component, there are idiosyncratic factors — where the individual lives, their career ambitions, their work ethic — which also influence wages but are not directly observable. These are grouped together in what is called the **population error** \(U\).

The fundamental problem in econometrics is that we almost never have access to the entire population. We instead work with a **sample**, and by applying our econometric tools to this sample, we hope to produce estimates that are close to the true population parameters. The gap between a sample estimate and the true population value is called **sampling error**, and the science of econometrics is largely concerned with developing estimators that minimise this gap and allow reliable inference about what is actually going on at the population level.

## 1.2 Econometrics vs. Hard Science

One of the most important conceptual distinctions in econometrics is the difference between experimental and non-experimental data. In hard sciences such as chemistry, physics, or biology, a researcher investigating whether substance A causes outcome B can design a controlled experiment: one test tube contains water plus the substance of interest (the treatment group), while another contains only water (the control). Because the only difference between the two is the presence of the substance, any observed difference in outcomes can be attributed causally to that substance.

In economics, this level of experimental control is almost never feasible — and often morally impermissible. Consider the canonical example of estimating the effect of military participation on lifetime earnings. The ideal experiment would require taking a single individual, cloning them precisely, sending one copy into the military and keeping the other as a civilian, and then comparing their lifetime incomes decades later. By comparing these two versions of the same person, one could isolate the causal effect of military service. In practice this is impossible.

Instead, econometricians must rely on **non-experimental data**: a cross-section of individuals for whom we observe both whether they served in the military and what their lifetime earnings turned out to be. The naive approach — comparing average earnings between veterans and civilians — is misleading because of **reverse causality**. Individuals who choose to enlist in the military may already have lower lifetime earnings capacity to begin with: they may be less academically oriented, or they may simply value financial wealth less than civic duty. Thus the observed gap in earnings between veterans and civilians reflects two things simultaneously: the causal effect of military service itself, and the pre-existing differences in earnings potential between those who self-select into the military and those who do not.

<div class="definition"><strong>Omitted Variable Bias / Reverse Causality:</strong> A situation in which the observed association between two variables is contaminated by a third factor — either a variable correlated with both the treatment and the outcome, or the outcome causally influencing the treatment — making it impossible to estimate the causal effect from the raw correlation alone.</div>

The solution econometricians often seek is a **natural experiment**: a situation in the real world that closely approximates the randomised assignment of a laboratory experiment. Lottery-based military conscription, for instance, randomly assigns some individuals to serve regardless of their pre-existing preferences or earnings potential, allowing researchers to estimate the causal effect of service on income in a much cleaner way. The search for credible natural experiments is one of the central concerns of modern empirical economics.

---

# Unit 2: Simple Linear Regression

## 2.1 Populations and Samples

To understand what econometrics is trying to accomplish, it is essential to be precise about the distinction between populations and samples. A **population** encompasses all objects that share the characteristics of interest — for instance, all individuals under 18 years of age in the United Kingdom, or all products manufactured by a given company.

Within that population, we hypothesise a **population process** linking two variables of interest. Returning to the education-wages example: each individual \(i\) in the population has their own education level \(x_i\) and their own wages \(y_i\). For that individual, we might imagine a relationship of the form

\[ y_i = \alpha + \beta x_i + U_i \]

where \(\beta\) captures how wages respond to education for that individual. Because every individual is different, each person effectively has their own \(\beta_i\): one person might see a \$25 wage gain per extra year of education, while another sees a \$75 gain. When we aggregate across all individuals in the population, the **population parameter** \(\beta\) represents the average effect of one additional year of education on wages across everyone in the population.

The fundamental difficulty is that we rarely observe the entire population. In practice, econometrics works with a **sample** — perhaps 1,000 individuals drawn (ideally, randomly) from the population. For the same reasons that the sample is not an exact replica of the population, the **sample parameter** \(\hat{\beta}_S\) that we estimate from the sample will differ from the true population parameter \(\beta_P\). This discrepancy is **sampling error**: the unavoidable result of making inferences about a large population from a small, imperfect subset.

The central task of econometrics is therefore: given that we only have a sample of data, how do we construct an estimator — a mathematical function that takes sample data as input — that produces an estimate of the population parameter that is as reliable and accurate as possible?

## 2.2 The Population Regression Function

The **Population Regression Function (PRF)** formalises the idea that there is a systematic relationship between a dependent variable \(Y\) and an independent variable \(X\) at the population level. For the education-wages example:

\[ Y_i = \alpha + \beta X_i + U_i \]

Here \(Y_i\) is the wage of individual \(i\), \(X_i\) is their years of education, \(\alpha\) is the intercept (the expected wage when education is zero), \(\beta\) is the slope (the average change in wages per one additional year of education), and \(U_i\) is the **disturbance term** or **population error**.

The disturbance term \(U_i\) captures all the factors that also influence wages but that we are not explicitly modelling. An individual with 15 years of education who becomes a senior investment banker might earn \$5,000 per week — well above the average for their education level. Another individual with the same 15 years of education who becomes a government economic advisor might earn only \$1,000 per week. The idiosyncratic choices and circumstances that led these two people to different positions — their interests, values, social networks — are all absorbed into \(U_i\).

A key assumption about the disturbance term is that the errors \(U_i\) are **independently and identically distributed (i.i.d.)** with mean zero and constant variance \(\sigma^2\):

\[ U_i \overset{i.i.d.}{\sim} (0, \sigma^2) \]

The assumption \(\mathbb{E}[U_i \mid X_i] = 0\) (zero conditional mean) means that, regardless of the level of education, the average of all the unobserved factors affecting wages is zero. **Independence** means that knowing one person's error term tells us nothing about another person's error term. **Identically distributed** means all error terms are drawn from the same underlying process, so the variance of wages around the regression line is constant regardless of education level — an assumption sometimes called **homoskedasticity**.

Taking the conditional expectation of the PRF:

\[ \mathbb{E}[Y_i \mid X_i] = \alpha + \beta X_i \]

because \(\mathbb{E}[U_i \mid X_i] = 0\). This conditional expectation is the population regression function itself: it gives the average value of wages for a person with exactly \(X_i\) years of education.

## 2.3 OLS Estimator Basics

Since we only have a sample, not the full population, we need an **estimator** — a mathematical function that takes sample data as input and outputs an estimate of the population parameter. The most widely used estimator in econometrics is the **Ordinary Least Squares (OLS)** estimator.

The intuition behind OLS is geometric: given a scatter plot of \(n\) observed data points \((x_1, y_1), (x_2, y_2), \ldots, (x_n, y_n)\), we want to find the line \(\hat{y}_i = \hat{\alpha} + \hat{\beta} x_i\) that fits the data as closely as possible. The **residual** for observation \(i\) is the gap between the actual observed value and the fitted value:

\[ \hat{u}_i = y_i - \hat{\alpha} - \hat{\beta} x_i \]

OLS chooses \(\hat{\alpha}\) and \(\hat{\beta}\) to minimise the **Sum of Squared Residuals (SSR)**:

\[ \min_{\hat{\alpha}, \hat{\beta}} \sum_{i=1}^{n} \hat{u}_i^2 = \min_{\hat{\alpha}, \hat{\beta}} \sum_{i=1}^{n} (y_i - \hat{\alpha} - \hat{\beta} x_i)^2 \]

Taking first-order conditions with respect to \(\hat{\alpha}\) and \(\hat{\beta}\) and solving gives the closed-form OLS estimators:

\[ \hat{\beta}_{OLS} = \frac{\sum_{i=1}^{n}(x_i - \bar{x})(y_i - \bar{y})}{\sum_{i=1}^{n}(x_i - \bar{x})^2} = \frac{\widehat{\text{Cov}}(x,y)}{\widehat{\text{Var}}(x)} \]

\[ \hat{\alpha}_{OLS} = \bar{y} - \hat{\beta}_{OLS} \bar{x} \]

where \(\bar{x} = \frac{1}{n}\sum_{i=1}^{n} x_i\) and \(\bar{y} = \frac{1}{n}\sum_{i=1}^{n} y_i\) are the sample means. The OLS slope estimator can also be written as the ratio of the sample covariance between \(x\) and \(y\) to the sample variance of \(x\).

The OLS estimator can equivalently be derived as the solution to the **sample moment conditions** (population counterparts of \(\mathbb{E}[u] = 0\) and \(\mathbb{E}[uX] = 0\)):

\[ \frac{1}{n}\sum_{i=1}^{n}(y_i - \hat{\alpha} - \hat{\beta} x_i) = 0 \]

\[ \frac{1}{n}\sum_{i=1}^{n}(y_i - \hat{\alpha} - \hat{\beta} x_i) x_i = 0 \]

These two equations (the first-order conditions of the SSR minimisation) imply that the OLS residuals always sum to zero (\(\sum \hat{u}_i = 0\)) and are orthogonal to \(x\) (\(\sum \hat{u}_i x_i = 0\)). In practice these sums are not exactly zero but only to numerical precision (e.g., of order \(10^{-12}\)).

**The unfeasible case (no variation in \(x\)):** If all observations have the same value of \(x_i\), then \(\sum(x_i - \bar{x})^2 = 0\) and the slope is undefined — there are infinitely many lines that fit the data. In R, `lm()` returns `NA` for the slope in this case. This is the simplest example of perfect collinearity.

An important conceptual distinction must be drawn between the **estimator** — the mathematical function \(\hat{\beta}_{OLS}(\cdot)\), which is a rule for constructing an estimate from any given dataset — and the **estimate** \(\hat{\beta}^* \), which is a specific numerical value (say, \$47 per year of education) produced when that rule is applied to a particular sample. The estimator is a random variable (its value changes from sample to sample); the estimate is a realisation of that random variable.

## 2.5 Goodness of Fit: SST, SSE, SSR, and R²

A fundamental decomposition of total variation in \(y\) is:

\[ \underbrace{\sum_{i=1}^n (y_i - \bar{y})^2}_{\text{SST}} = \underbrace{\sum_{i=1}^n (\hat{y}_i - \bar{y})^2}_{\text{SSE}} + \underbrace{\sum_{i=1}^n \hat{u}_i^2}_{\text{SSR}} \]

where **SST** (Total Sum of Squares) measures total variation in \(y\), **SSE** (Explained Sum of Squares) is the variation explained by the regression, and **SSR** (Sum of Squared Residuals) is the unexplained residual variation. Note that \(\bar{\hat{y}} = \bar{y}\) (a direct consequence of the OLS first-order conditions), which is why the "explained" and "residual" components are orthogonal and the decomposition holds exactly.

The **R-squared** (\(R^2\)) is defined as the fraction of total variation explained by the model:

\[ R^2 = \frac{\text{SSE}}{\text{SST}} = 1 - \frac{\text{SSR}}{\text{SST}} \]

\(R^2 \in [0, 1]\) always. \(R^2 = 0\) means the regressors explain nothing; \(R^2 = 1\) means a perfect fit with zero residuals. In the simple bivariate regression, \(R^2\) equals the square of the sample correlation between \(x\) and \(y\): \(R^2 = [\widehat{\text{Corr}}(x,y)]^2\).

**Caveats about \(R^2\):**
- A high \(R^2\) does not imply causality or good model specification.
- Adding any regressor to the model always (weakly) increases \(R^2\), even if the variable is irrelevant noise. This motivates the **adjusted \(R^2\)** (see Tutorial 9 / Unit 4).
- \(R^2\) cannot be directly compared between models with different dependent variables (e.g., a level model vs. a log model).

**Standard Error of the Regression (SER):** The SER measures the average magnitude of the residuals in units of \(y\):

\[ \text{SER} = \hat{\sigma} = \sqrt{\frac{\text{SSR}}{n - k - 1}} \]

where \(k\) is the number of slope coefficients and the denominator \(n - k - 1\) is the **degrees of freedom**. For a simple regression (\(k = 1\)), this is \(\sqrt{\text{SSR}/(n-2)}\). Dividing by \(n-2\) rather than \(n\) corrects for the fact that two parameters (\(\hat{\alpha}, \hat{\beta}\)) have been estimated, consuming two degrees of freedom. For large \(n\), the distinction is negligible.

## 2.4 OLS Estimator Properties

What makes OLS a good estimator? We evaluate estimators along three key dimensions: **unbiasedness**, **consistency**, and **efficiency**.

<div class="definition"><strong>Unbiasedness:</strong> An estimator \(\hat{\beta}\) is unbiased if, in expectation over all possible samples, it equals the true population parameter: \(\mathbb{E}[\hat{\beta}] = \beta_P\). This means that even though any single estimate will differ from \(\beta_P\) due to sampling error, if we were to take infinitely many samples and average our estimates, we would recover the true value exactly.</div>

<div class="definition"><strong>Consistency:</strong> An estimator is consistent if, as the sample size \(n \to \infty\), the estimator converges in probability to the true population parameter: \(\hat{\beta} \xrightarrow{p} \beta_P\). Intuitively, a larger sample reduces the spread of the sampling distribution, and in the limit the sample perfectly represents the population.</div>

<div class="definition"><strong>Efficiency:</strong> Among all unbiased estimators, the most efficient one has the smallest variance. A smaller variance in the sampling distribution means that any given estimate is likely to be closer to the true population parameter.</div>

The **Gauss-Markov Theorem** establishes when OLS achieves all three of these properties simultaneously. Under the classical linear regression assumptions — (1) the model is correctly specified (linear in parameters), (2) the error term has zero conditional mean \(\mathbb{E}[U_i \mid X_i] = 0\), (3) homoskedasticity \(\text{Var}(U_i \mid X_i) = \sigma^2\), (4) no perfect multicollinearity among regressors, and (5) the observations are i.i.d. — OLS is the **Best Linear Unbiased Estimator (BLUE)**: it is the most efficient (lowest variance) among all linear unbiased estimators.

When we apply OLS to a sample and obtain \(\hat{\beta}_{OLS}\), we can show that:

\[ \hat{\beta}_{OLS} = \beta_P + \frac{\sum_{i=1}^{n}(x_i - \bar{x}) U_i}{\sum_{i=1}^{n}(x_i - \bar{x})^2} \]

This expression makes clear that the estimator equals the true population parameter plus a term involving the error \(U_i\). Under the zero-conditional-mean assumption, taking expectations of this expression yields \(\mathbb{E}[\hat{\beta}_{OLS}] = \beta_P\), establishing unbiasedness. The additional term — the source of sampling error — shrinks as \(n\) grows, establishing consistency.

The variance of \(\hat{\beta}_{OLS}\) (under homoskedasticity) is:

\[ \text{Var}(\hat{\beta}_{OLS}) = \frac{\sigma^2}{\sum_{i=1}^{n}(x_i - \bar{x})^2} \]

This expression has intuitive implications. First, a larger error variance \(\sigma^2\) (more noise in the population process) increases the variance of our estimator, making estimates less precise. Second, more variation in the explanatory variable \(x\) (larger denominator) reduces the variance of the estimator, making it more precise. This is why it is beneficial to have explanatory variables that vary substantially across observations.

---

# Unit 3: Hypothesis Testing

## 3.1 Hypothesis Testing: Motivation and the Sampling Distribution

A point estimate such as \(\hat{\beta}_{OLS} = 0.1\) answers the question "what is our best guess of the population parameter?" but it cannot answer the deeper question: "is this effect real, or did it arise merely by chance due to the particular sample we happened to draw?" **Hypothesis testing** is the formal statistical framework for making statements about population parameters based on sample evidence.

The setup is always the same: there is some population in which the true parameter \(\beta_P\) exists. We have drawn a sample and computed \(\hat{\beta}^* = 0.1\). Now, is this value surprising if in fact the true effect were zero? Could we have obtained 0.1 purely by sampling a weird subset of the population?

To answer this, we need the **sampling distribution** of \(\hat{\beta}_{OLS}\). It can be shown — via asymptotic theory — that as \(n \to \infty\):

\[ \hat{\beta}_{OLS} \overset{a}{\sim} \mathcal{N}\left(\beta_P, \frac{\sigma^2}{\sum(x_i - \bar{x})^2}\right) \]

The problem is that this distribution depends on \(\sigma^2\), the variance of the population error, which we do not observe. We must estimate \(\sigma^2\) from the data. Replacing \(\sigma^2\) with its sample estimator \(\hat{\sigma}^2\) introduces additional uncertainty, and as a result the standardised statistic no longer follows a normal distribution but instead follows a **t-distribution**:

\[ t = \frac{\hat{\beta}^* - \beta_0}{\widehat{SE}(\hat{\beta}_{OLS})} \sim t_{n-k} \]

where \(\beta_0\) is the hypothesised null value (typically zero), \(\widehat{SE}(\hat{\beta}_{OLS})\) is the estimated standard error of the OLS estimator, \(n\) is the number of observations, and \(k\) is the number of regressors including the constant.

The **t-distribution** resembles the standard normal but has heavier tails, reflecting the additional uncertainty introduced by estimating \(\sigma^2\). Crucially, as \(n \to \infty\) (so the degrees of freedom grow), the t-distribution converges exactly to the standard normal.

## 3.2 Constructing a Hypothesis Test

The general procedure for a hypothesis test in regression is as follows.

**Step 1 — Specify the null and alternative hypotheses.** The null hypothesis \(H_0\) specifies a particular value for the population parameter, most commonly:

\[ H_0: \beta_P = 0 \]

The alternative hypothesis \(H_1\) specifies the region of departures from \(H_0\) that we would find economically meaningful. For a **two-tailed test**, \(H_1: \beta_P \neq 0\), meaning we care about both positive and negative effects. For a **one-tailed test**, either \(H_1: \beta_P > 0\) or \(H_1: \beta_P < 0\).

**Step 2 — Compute the t-statistic.** Under \(H_0: \beta_P = \beta_0\):

\[ t = \frac{\hat{\beta}^* - \beta_0}{\widehat{SE}(\hat{\beta}_{OLS})} \]

Most statistical software assumes \(\beta_0 = 0\) by default, so the t-statistic reported in regression output is simply \(t = \hat{\beta}^* / \widehat{SE}(\hat{\beta}_{OLS})\).

**Step 3 — Determine the critical value.** Look up the critical value \(t_{\text{crit}}\) from a t-distribution table with \(n - k\) degrees of freedom and the chosen significance level \(\alpha\) (typically 0.05). For a two-tailed test, we use the \(\alpha/2\) percentile; for a one-tailed test, the \(\alpha\) percentile.

**Step 4 — Make a decision.** Reject \(H_0\) if \(|t| > t_{\text{crit}}\) (two-tailed) or \(t > t_{\text{crit}}\) (one-tailed, upper). A commonly used rule of thumb is that if the absolute value of the t-statistic exceeds approximately 2, the coefficient is statistically significant at the 5% level.

As a worked example: suppose we have estimated the effect of TV advertising spend on company sales, obtaining a coefficient of 10 with a standard error of 3. The t-statistic is \(t = 10/3 \approx 3.33\). With, say, 30 degrees of freedom and a one-tailed test at the 5% level, the critical value is approximately 1.70. Since \(3.33 > 1.70\), we reject \(H_0: \beta_{TV} = 0\) and conclude that TV advertising has a statistically significant positive effect on sales.

## 3.3 Hypothesis Testing: Worked Example

Consider a regression attempting to identify the determinants of a company's weekly sales. We estimate:

\[ \widehat{\text{Sales}}_t = \hat{\alpha} + \hat{\beta}_1 \text{TV}_t + \hat{\beta}_2 \text{Radio}_t + \cdots \]

and obtain \(\hat{\beta}_1 = 10\) with \(\widehat{SE}(\hat{\beta}_1) = 3\). The null hypothesis is \(H_0: \beta_1 = 0\) (TV has no effect on sales), and the one-tailed alternative is \(H_1: \beta_1 > 0\) (TV increases sales). The t-statistic is:

\[ t = \frac{10 - 0}{3} = \frac{10}{3} \approx 3.33 \]

The degrees of freedom for this statistic are \(n - k\), where \(k\) is the total number of parameters estimated (including the constant). Looking up the t-distribution at a 5% significance level for a one-tailed test with the appropriate degrees of freedom gives a critical value of approximately 1.7. Because \(3.33 > 1.7\), we reject the null hypothesis and conclude, with statistical confidence, that TV advertising spending positively and significantly affects weekly sales.

It is important to remember that this inference is only valid if the model has been correctly specified — that is, if we have included all variables that are both important determinants of sales and correlated with TV spending, so that the OLS estimator is unbiased. Ignoring relevant variables leads to the **omitted variable bias** discussed in Unit 4.

## 3.4 Confidence Intervals

A **confidence interval** for a regression coefficient provides a range of plausible values for the population parameter, rather than just a single point estimate. A \(95\%\) confidence interval for \(\beta_P\) is constructed as:

\[ \left[\hat{\beta}^* - t_{\alpha/2, \, n-k} \cdot \widehat{SE}(\hat{\beta}_{OLS}), \quad \hat{\beta}^* + t_{\alpha/2, \, n-k} \cdot \widehat{SE}(\hat{\beta}_{OLS})\right] \]

where \(t_{\alpha/2, \, n-k}\) is the \((1 - \alpha/2)\) percentile (i.e., the 97.5th percentile for a 95% interval) of the t-distribution with \(n - k\) degrees of freedom. The choice of the 97.5th percentile arises because the two tails each contribute \(2.5\%\) probability, totalling the \(5\%\) outside the 95% region.

The correct interpretation of a \(95\%\) confidence interval is the following: if we were to draw repeated samples from the population and construct a confidence interval from each one, then \(95\%\) of those intervals would contain the true population parameter \(\beta_P\). This is not the same as saying "we are \(95\%\) confident that the true parameter lies in this interval" — because once a specific interval is computed for a specific sample, \(\beta_P\) either lies inside it or it does not, and we have no way of knowing which.

The width of the confidence interval is determined by the standard error of the estimator. A larger standard error — arising from small sample sizes, large residual variance, or low variation in the explanatory variable — produces wider, less informative confidence intervals. Conversely, precise estimation (low \(\widehat{SE}\)) yields narrow, informative intervals.

---

# Unit 4: Multiple Regression and Omitted Variable Bias

## 4.1 Omitted Variable Bias: The Problem

One of the most pernicious threats to valid econometric inference is **omitted variable bias (OVB)**, which arises when an important determinant of the dependent variable is excluded from the regression model and that omitted variable is correlated with one of the included regressors.

To see the mechanism concretely, consider the goal of estimating the effect of education on wages. Suppose we estimate the simple regression:

\[ \text{Wage}_i = \alpha + \beta_1 \text{Education}_i + U_i \]

The population, however, contains a richer truth: wages are also determined by an individual's innate **ability**, denoted \(A_i\), which affects earnings positively:

\[ \text{Wage}_i = \alpha + \beta_1 \text{Education}_i + \beta_2 A_i + V_i \]

where \(\beta_2 > 0\) and \(V_i\) is the truly idiosyncratic component. The problem is that ability \(A_i\) is not included in our regression — it may be unobservable. Furthermore, there is a positive correlation between education and ability: more academically able individuals tend to stay in education longer. Therefore, when we omit ability, our error term \(U_i\) implicitly contains \(\beta_2 A_i + V_i\).

## 4.2 Omitted Variable Bias: Derivation

The OLS formula for \(\hat{\beta}_1\) in the simple regression is:

\[ \hat{\beta}_1 = \beta_1 + \frac{\sum_{i=1}^{n}(\text{Education}_i - \overline{\text{Education}}) \cdot U_i}{\sum_{i=1}^{n}(\text{Education}_i - \overline{\text{Education}})^2} \]

Since \(U_i = \beta_2 A_i + V_i\), substituting gives:

\[ \hat{\beta}_1 = \beta_1 + \frac{\sum_{i=1}^{n}(\text{Education}_i - \overline{\text{Education}})(\beta_2 A_i + V_i)}{\sum_{i=1}^{n}(\text{Education}_i - \overline{\text{Education}})^2} \]

Taking expectations (and using the fact that \(V_i\) is orthogonal to education by assumption):

\[ \mathbb{E}[\hat{\beta}_1] = \beta_1 + \beta_2 \cdot \frac{\sum_{i=1}^{n}(\text{Education}_i - \overline{\text{Education}}) \cdot \mathbb{E}[A_i]}{\sum_{i=1}^{n}(\text{Education}_i - \overline{\text{Education}})^2} \]

The second term is the **bias**. Its sign depends on (a) the sign of \(\beta_2\) — the effect of the omitted variable on the dependent variable — and (b) the sign of the correlation between the omitted variable and the included regressor. In our example:

- \(\beta_2 > 0\): ability increases wages
- \(\text{Corr}(\text{Education}, \text{Ability}) > 0\): more able people get more education

Both factors are positive, so the bias term is **positive**, meaning \(\mathbb{E}[\hat{\beta}_1] > \beta_{1,P}\). Our estimate of the return to education is **upwardly biased** because it is inadvertently capturing part of the return to ability. We are over-attributing the earnings of high-ability individuals (who also happen to be highly educated) to education, when part of that earnings premium is really due to ability.

A general rule for the direction of OVB: if the omitted variable positively affects \(Y\) and is positively correlated with the included regressor, the bias is upward. If the signs are opposite, the bias is downward. The table below summarises:

| \(\text{Corr}(\text{omitted}, X)\) | \(\beta_{\text{omitted}} > 0\) | \(\beta_{\text{omitted}} < 0\) |
|---|---|---|
| Positive | Upward bias | Downward bias |
| Negative | Downward bias | Upward bias |

The solution to OVB is to include the omitted variable if it can be measured, or to use instrumental variables or other advanced methods if it cannot.

## 4.3 The Classical Regression Assumptions (Formal Statement)

Chaussé's Topic 3 formally enumerates the six classical assumptions for the multiple regression model \(y = \beta_0 + \beta_1 x_1 + \cdots + \beta_k x_k + u\):

- **A1 — Linear in parameters:** The model is correctly specified as linear in the \(\beta_j\)'s (though \(x_j\)'s may be nonlinear functions of underlying variables).
- **A2 — Random sampling:** The observations \(\{y_i, x_{1i}, \ldots, x_{ki}\}\) are independently and identically distributed (i.i.d.), which holds under simple random sampling.
- **A3 — No perfect collinearity:** No regressor is an exact linear combination of other regressors. If this fails, OLS cannot be computed.
- **A4 — Zero conditional mean:** \(\mathbb{E}[u \mid x_1, \ldots, x_k] = 0\). This is the key identifying assumption; it ensures OLS is unbiased.
- **A5 — Homoskedasticity:** \(\text{Var}(u_i \mid x_1, \ldots, x_k) = \sigma^2\) for all \(i\). If violated, OLS is still unbiased but no longer BLUE.
- **A6 — Normality of errors:** \(u_i \mid \{x_1, \ldots, x_k\} \sim \mathcal{N}(0, \sigma^2)\). Required for exact finite-sample t and F distributions; in large samples, A6 is not needed (see Unit 10 on asymptotic theory).

Under A1–A5, OLS is BLUE (Gauss-Markov). Under A1–A6, OLS is the best unbiased estimator (BUE) overall, not just among linear estimators.

**A weaker sufficient condition for consistency** (replacing A4): A4\('\): \(\mathbb{E}[u] = 0\) and \(\text{Cov}(x_j, u) = 0\) for all \(j\). This is weaker than full zero conditional mean but still ensures unbiasedness of OLS.

## 4.4 Multicollinearity

**Multicollinearity** refers to the situation in which two or more of the explanatory variables in a regression are highly correlated with one another. This is distinct from **perfect collinearity**, in which one regressor is an exact linear function of another (which would prevent OLS from being estimated at all). In the case of multicollinearity, estimation is still possible — but it becomes very imprecise.

Consider a model explaining a company's sales using both TV advertising spend and radio advertising spend as regressors. If the company tends to run TV and radio campaigns simultaneously, these two variables will be highly correlated. Intuitively, to estimate the separate effect of TV advertising, one would ideally observe cases where TV spend increases while radio spend stays constant — and similarly for radio. High multicollinearity means there are few such "controlled" observations in the data.

The practical manifestation in regression output is that the **standard errors** of the multicollinear coefficients become very large. Even if the model as a whole has high explanatory power (high \(R^2\)), the individual coefficients may each be statistically insignificant when tested individually. This occurs because OLS cannot reliably apportion the joint effect of the two collinear variables between them. The estimate for the effect of TV might range widely depending on which particular sample is drawn.

<div class="definition"><strong>Multicollinearity:</strong> High correlation between two or more explanatory variables in a regression model, resulting in inflated standard errors for the affected coefficients and difficulty in separately identifying their individual effects on the dependent variable.</div>

There is no bias introduced by multicollinearity — the OLS coefficients remain unbiased. However, efficiency is severely compromised. From the variance formula \(\text{Var}(\hat{\beta}_j) = \frac{\sigma^2}{\text{SST}_j (1 - R_j^2)}\), where \(R_j^2\) is the \(R^2\) from regressing \(x_j\) on all other regressors, it is clear that as \(R_j^2 \to 1\) (perfect collinearity with other regressors), the variance of \(\hat{\beta}_j\) explodes to infinity.

Possible remedies for multicollinearity include: collecting more data (which reduces the variance of all estimators), combining the collinear variables into a single composite index, or dropping one of the highly correlated variables if there is theoretical justification for doing so.

## 4.5 Interpreting Regression Coefficients

In a bivariate regression \(Y_i = \alpha + \beta X_i + U_i\), the coefficient \(\beta\) represents the slope of the estimated line: a one-unit increase in \(X\) is associated with a \(\beta\)-unit change in \(Y\) on average. The intercept \(\alpha\) is the expected value of \(Y\) when \(X = 0\), which may or may not have a meaningful economic interpretation depending on the context (a house with zero square metres, for instance, does not exist).

In a multiple regression model with several explanatory variables:

\[ Y_i = \alpha + \beta_1 X_{1i} + \beta_2 X_{2i} + \cdots + \beta_k X_{ki} + U_i \]

each coefficient \(\beta_j\) is interpreted as the **partial effect** of variable \(X_j\) on \(Y\), holding all other explanatory variables constant. This is sometimes called the **ceteris paribus** interpretation. Mathematically, it is the partial derivative of the conditional expectation of \(Y\) with respect to \(X_j\):

\[ \frac{\partial \mathbb{E}[Y \mid X_1, \ldots, X_k]}{\partial X_j} = \beta_j \]

For example, in a model explaining house prices as a function of both the number of bedrooms and the square meterage:

\[ \text{Price}_i = \alpha + \beta_1 \text{Bedrooms}_i + \beta_2 \text{SqMetres}_i + U_i \]

\(\beta_1\) represents the expected increase in house price for one additional bedroom, **holding square meterage constant**. Without the "holding constant" clause, \(\beta_1\) cannot be cleanly interpreted because larger houses tend to have both more bedrooms and more square metres, confounding the two effects.

This partial-effects interpretation is one of the primary motivations for using multiple regression rather than a series of bivariate regressions. By including all relevant control variables, we hold them constant and isolate the marginal effect of the variable of interest.

---

# Unit 5: F-Statistics and Joint Hypothesis Testing

## 5.1 Introduction to F-Statistics

The t-test developed in Unit 3 is designed for testing a single restriction on a single population parameter, such as \(H_0: \beta_j = 0\). When we wish to test whether **multiple** coefficients are simultaneously zero — a **joint hypothesis** — the t-test is insufficient, because conducting multiple individual t-tests inflates the probability of incorrectly rejecting at least one true null hypothesis.

The appropriate tool for joint hypothesis testing is the **F-test**, which uses the **F-statistic**. The null hypothesis for a standard F-test of overall model significance is:

\[ H_0: \beta_1 = \beta_2 = \cdots = \beta_p = 0 \]

(all slope coefficients are zero), with the alternative that at least one \(\beta_j \neq 0\).

The construction of the F-statistic rests on comparing two regressions:

1. The **unrestricted model**: the full regression including all regressors, yielding sum of squared residuals \(\text{SSR}_U\).
2. The **restricted model**: the regression that imposes \(H_0\), yielding sum of squared residuals \(\text{SSR}_R\).

Because adding regressors always reduces (or at worst leaves unchanged) the SSR, we always have \(\text{SSR}_R \geq \text{SSR}_U\). The question is whether the reduction is large enough to be statistically significant — that is, whether including those extra variables genuinely improves the model's fit, or whether the reduction is only what we would expect even if those variables were irrelevant noise.

The F-statistic is:

\[ F = \frac{(\text{SSR}_R - \text{SSR}_U) / q}{\text{SSR}_U / (n - k - 1)} \]

where \(q\) is the number of restrictions being tested (the number of coefficients set to zero under \(H_0\)), \(n\) is the number of observations, and \(k\) is the number of slope coefficients in the unrestricted model. Under \(H_0\) and the classical regression assumptions, this statistic follows an **F-distribution** with \((q, \, n - k - 1)\) degrees of freedom.

<div class="definition"><strong>F-Distribution:</strong> A continuous probability distribution that is the ratio of two independent chi-squared random variables, each divided by their respective degrees of freedom. It is strictly positive and skewed to the right, and it depends on two parameters: the numerator degrees of freedom \(d_1\) and denominator degrees of freedom \(d_2\).</div>

We reject \(H_0\) when the computed F-statistic exceeds the critical value \(F_{q, n-k-1}^{\alpha}\) looked up from an F-distribution table at significance level \(\alpha\) (typically 0.05). Typical critical values for the F-distribution are around 3 to 5, depending on the degrees of freedom.

## 5.2 F-Test: Example 1 (Crowding Out and Interest Rates)

Consider the following regression explaining interest rates on government debt:

\[ r_t = \alpha + \beta_1 G_t + \beta_2 D_t + U_t \]

where \(G_t\) is government spending and \(D_t\) is the debt-to-GDP ratio. The hypothesis, grounded in standard economic theory, is that both variables should increase interest rates: government spending crowds out private investment (driving up \(r\)), and higher debt levels increase the perceived risk of default (also driving up \(r\)).

We want to test jointly whether \(H_0: \beta_1 = \beta_2 = 0\) (neither spending nor debt affects interest rates). Suppose the unrestricted model is estimated on \(n = 200\) observations and yields \(\text{SSR}_U = 1{,}000\). The restricted model — which simply regresses \(r_t\) on a constant — yields \(\text{SSR}_R = 2{,}000\).

The F-statistic is:

\[ F = \frac{(2000 - 1000)/2}{1000/(200 - 2 - 1)} = \frac{500}{1000/197} = \frac{500}{5.08} \approx 98.4 \]

With \(q = 2\) numerator degrees of freedom and \(197\) denominator degrees of freedom, the critical value at the 5% level is approximately 3. Since \(98.4 \gg 3\), we strongly reject \(H_0\) and conclude that government spending and debt jointly have a significant effect on interest rates.

## 5.3 F-Test: Example 2 (SAT Scores)

Suppose we wish to explain SAT scores using three variables: parental SAT scores, class size, and number of siblings. The unrestricted regression is:

\[ \text{SAT}_i = \alpha + \beta_1 \text{ParentalSAT}_i + \beta_2 \text{ClassSize}_i + \beta_3 \text{Siblings}_i + U_i \]

The t-statistic on \(\hat{\beta}_1\) is high (parental SAT scores appear significant), but the t-statistics on \(\hat{\beta}_2\) and \(\hat{\beta}_3\) are marginal. We test the joint hypothesis \(H_0: \beta_2 = \beta_3 = 0\).

The restricted model is:

\[ \text{SAT}_i = \alpha + \beta_1 \text{ParentalSAT}_i + U_i \]

Suppose with \(n = 30\) observations, \(\text{SSR}_U = 110\) and \(\text{SSR}_R = 120\). The number of restrictions is \(q = 2\), and the denominator degrees of freedom are \(n - k - 1 = 30 - 3 - 1 = 26\).

\[ F = \frac{(120 - 110)/2}{110/26} = \frac{5}{4.23} \approx 1.18 \]

With the critical value for \(F_{2, 26}\) at the 5% level being approximately 3.37, the computed F-statistic of 1.18 does not exceed this threshold. We therefore **fail to reject** \(H_0\) and cannot conclude that class size and number of siblings jointly explain variation in SAT scores at the 5% significance level. In a case this marginal, it is especially important to consult the F-table rather than relying on approximations.

## 5.4 Testing Non-Standard Hypotheses

Not all economically interesting hypotheses are of the form \(\beta_j = 0\). Consider the hypothesis that a two-year college degree has the same return as a four-year degree: \(H_0: \beta_{jc} = \beta_{univ}\). There are three equivalent approaches:

**Direct t-test:** Compute the t-statistic using the variance-covariance matrix of \(\hat{\beta}\):

\[ t = \frac{\hat{\beta}_{jc} - \hat{\beta}_{univ}}{\sqrt{\widehat{\text{Var}}(\hat{\beta}_{jc}) + \widehat{\text{Var}}(\hat{\beta}_{univ}) - 2\widehat{\text{Cov}}(\hat{\beta}_{jc}, \hat{\beta}_{univ})}} \]

This requires `vcov(res)` to extract the full covariance matrix.

**F-test approach:** Compare the unrestricted model (with both `jc` and `univ`) against the restricted model (with their sum `jc + univ` as a single regressor):

```r
res_u <- lm(lwage ~ jc + univ + exper, data = data)
res_r <- lm(lwage ~ I(jc + univ) + exper, data = data)
```

The F-statistic is \(F = t^2\) when there is one restriction.

**Indirect (reparametrisation) t-test:** Rewrite the model so the coefficient of interest directly appears. Replace `jc` by `jc` and `jc + univ` (or similarly), so the coefficient on `jc` in the new model equals \(\beta_{jc} - \beta_{univ}\), and its t-statistic directly tests the hypothesis.

For the two-year vs. four-year example with \(n = 6763\):
\[ \widehat{\log(\text{wage})} = 1.472 + 0.067\,jc + 0.077\,univ + 0.005\,exper \]
\(t = -1.47\) for \(H_0: \beta_{jc} = \beta_{univ}\), failing to reject at 5%.

For testing \(H_0: \beta_1 = \beta_2 = 0.1\) (both returns equal 0.1):
```r
linearHypothesis(res, c("jc=0.1", "univ=0.1"))
# F = 56.93, p < 0.001 — reject strongly
```

## 5.5 F-Test vs. T-Test

An illuminating relationship exists between the F-test and the t-test: when the F-test is used to test a single restriction (\(q = 1\)), it is mathematically equivalent to the t-test. Specifically:

\[ F_{1, \, n-k-1} \equiv t_{n-k-1}^2 \]

That is, an F-statistic with one numerator degree of freedom and \(n-k-1\) denominator degrees of freedom equals the square of the t-statistic with \(n-k-1\) degrees of freedom. This means that for testing the significance of a single coefficient, the two tests yield exactly the same conclusion, and the t-test is preferred purely for convenience (it does not require running an auxiliary restricted regression).

The F-test becomes essential when testing **joint restrictions** — that is, when we wish to ask "are these variables, taken together, significant?" The F-test properly accounts for the correlations among coefficient estimates and avoids the multiple-testing inflation that would arise from running many individual t-tests.

---

# Probability Theory and Distributions

## Random Variables and Expected Values

Econometrics is built on probability theory. A **random variable** \(X\) is a variable whose value is determined by a random experiment. For our purposes, we work exclusively with continuous random variables, characterised by a probability density function \(f(x)\) that satisfies:

\[ f(x) \geq 0 \quad \text{and} \quad \int_{-\infty}^{\infty} f(x) \, dx = 1 \]

The **expected value** (or **population mean**) of a random variable is:

\[ \mathbb{E}[X] = \int_{-\infty}^{\infty} x \, f(x) \, dx \]

Because integration is a linear operator, the expected value inherits a linearity property that is fundamental to all the derivations in this course:

\[ \mathbb{E}[a + bX + cY] = a + b\,\mathbb{E}[X] + c\,\mathbb{E}[Y] \]

for any scalars \(a, b, c\) and random variables \(X, Y\). Critically, linearity does **not** extend to non-linear functions: in general, \(\mathbb{E}[g(X)] \neq g(\mathbb{E}[X])\) unless \(g\) is linear. In particular, \(\mathbb{E}[X^2] \neq (\mathbb{E}[X])^2\).

The **variance** of \(X\) measures the dispersion of \(X\) around its mean:

\[ \text{Var}(X) = \mathbb{E}\left[(X - \mathbb{E}[X])^2\right] = \mathbb{E}[X^2] - (\mathbb{E}[X])^2 \]

Key variance properties are:

\[ \text{Var}(aX) = a^2 \, \text{Var}(X), \qquad \text{Var}(a + X) = \text{Var}(X) \]

\[ \text{Var}(aX + bY) = a^2 \text{Var}(X) + b^2 \text{Var}(Y) + 2ab \, \text{Cov}(X,Y) \]

The **covariance** between two random variables \(X\) and \(Y\) is:

\[ \text{Cov}(X, Y) = \mathbb{E}\left[(X - \mathbb{E}[X])(Y - \mathbb{E}[Y])\right] = \mathbb{E}[XY] - \mathbb{E}[X]\mathbb{E}[Y] \]

If \(X\) and \(Y\) tend to move together (both above their means at the same time), the covariance is positive. If they tend to move in opposite directions, the covariance is negative.

**Independence** between \(X\) and \(Y\) means that knowing the value of one provides no information about the other. Independence is a stronger condition than zero correlation: if \(X \perp Y\), then \(\text{Cov}(X, Y) = 0\), but not vice versa. Independence implies that \(\text{Cov}(g(X), h(Y)) = 0\) for all functions \(g\) and \(h\).

## The Normal Distribution

The **normal distribution** is the most important distribution in econometrics. We write \(X \sim \mathcal{N}(\mu, \sigma^2)\) to mean that \(X\) is normally distributed with mean \(\mu\) and variance \(\sigma^2\). The normal distribution is characterised by its perfect bell-shaped, symmetric density centred at \(\mu\); knowing \(\mu\) and \(\sigma^2\) completely describes the distribution.

A crucial closure property of the normal is that linear combinations of independent normal random variables are also normal. If \(X \sim \mathcal{N}(\mu_X, \sigma^2_X)\) and \(Y \sim \mathcal{N}(\mu_Y, \sigma^2_Y)\) are independent, then:

\[ Z = a + bX + cY \sim \mathcal{N}\left(a + b\mu_X + c\mu_Y, \; b^2\sigma^2_X + c^2\sigma^2_Y + 2bc\,\text{Cov}(X,Y)\right) \]

This property is the reason why OLS estimators (which are linear functions of the observations) are normally distributed when the errors are normal — and approximately so by the Central Limit Theorem even when errors are not normal, for large samples.

## The Chi-Squared Distribution

The **chi-squared distribution** \(\chi^2(d)\) with \(d\) degrees of freedom is defined as the sum of \(d\) independent squared standard normal random variables:

\[ Z = \sum_{i=1}^{d} X_i^2, \quad X_i \overset{i.i.d.}{\sim} \mathcal{N}(0,1) \implies Z \sim \chi^2(d) \]

Properties: \(\mathbb{E}[Z] = d\) and \(\text{Var}(Z) = 2d\). The chi-squared distribution is strictly positive (as it is a sum of squares) and skewed to the right. As \(d\) increases, the distribution becomes more symmetric and approaches a normal distribution.

## The t-Distribution

The **t-distribution** with \(d\) degrees of freedom arises as the ratio of a standard normal to the square root of a chi-squared divided by its degrees of freedom:

\[ T = \frac{X}{\sqrt{Y/d}}, \quad X \sim \mathcal{N}(0,1), \quad Y \sim \chi^2(d), \quad X \perp Y \implies T \sim t_d \]

The t-distribution is symmetric around zero (for \(d > 1\)) but has heavier tails than the standard normal, reflecting the additional uncertainty introduced by estimating the variance. As \(d \to \infty\), the t-distribution converges to \(\mathcal{N}(0,1)\). This is why, for large samples, one can use normal critical values instead of t critical values.

The t-distribution is the distribution of the OLS t-statistic under the null hypothesis, which is why it is central to all of our hypothesis testing in Units 3 and 5.

## The F-Distribution

The **F-distribution** with degrees of freedom \(d_1\) and \(d_2\) is defined as the ratio of two independent chi-squared random variables, each divided by its degrees of freedom:

\[ F = \frac{X/d_1}{Y/d_2}, \quad X \sim \chi^2(d_1), \quad Y \sim \chi^2(d_2), \quad X \perp Y \implies F \sim F(d_1, d_2) \]

The F-distribution is strictly positive and skewed to the right. It is the sampling distribution of the F-statistic under \(H_0\), and as established in Section 5.4, \(F(1, d_2) \equiv t_{d_2}^2\).

## Conditional Expectation and the Law of Iterated Expectations

The **conditional expectation** \(\mathbb{E}[Y \mid X]\) is the expected value of \(Y\) given that \(X\) is fixed at a particular value. When \(X\) is treated as a known constant, all of the usual properties of expectation apply with \(X\) treated as a scalar. In particular:

\[ \mathbb{E}[a + bX + cY \mid X] = a + bX + c\,\mathbb{E}[Y \mid X] \]

The zero conditional mean assumption \(\mathbb{E}[U \mid X] = 0\) is the core identifying assumption of OLS. It states that the average value of the unobservable error, conditional on any given level of the regressor, is zero. This assumption ensures that OLS is unbiased and underlies all the inference procedures developed in this course.

---

# R Tutorials

## Tutorial 1: Installing R and RStudio

**R** is a free, open-source statistical programming language. It is a scripting language with a vast ecosystem of user-contributed packages (over 1,300 at the time of these tutorials). R is used at scale by organisations including Google, Facebook, Twitter, and the New York Times for data analysis and visualisation.

To install R, go to `r-project.org`, select your operating system (Windows, Mac, or Linux), and download the base installation. For Windows users, selecting the `base` option and following the prompts through the installer is sufficient. After installation, it is recommended to create a dedicated working directory (e.g., `C:\Users\<name>\R\`) and configure the R shortcut to launch from that directory, so that all data files and workspace files are kept together.

**RStudio** is an integrated development environment (IDE) for R that makes working with R far more productive. Download it from `rstudio.com`. RStudio provides:
- A **console** for running R commands interactively
- A **source editor** for writing and saving scripts
- A **workspace panel** showing all currently defined objects
- A **history panel** tracking all commands entered
- A **file browser** for navigating directories and setting the working directory
- A **plots panel** for visualising output
- Integrated **help** and **code completion** (via the Tab key)

RStudio also supports **projects**, which save the workspace, history, and layout so that you can resume exactly where you left off.

## Tutorial 2: Scalars and Vectors in R

R uses the `<-` operator for assignment (the `=` operator also works). R is **case-sensitive**, so `a` and `A` are different objects.

```r
# Assigning a scalar
a <- 5
print(a)

# Assigning a vector using c()
a <- c(1, 3, 7)
a

# Creating a range
a <- 1:10
a <- 5:10
a <- -4:3

# Using seq() for more control
a <- seq(-40, 60)             # step size 1 by default
a <- seq(-40, 60, by = 0.5)  # step size 0.5
a <- seq(from = 1.6, by = 0.2, length.out = 40)

# Arithmetic on scalars and vectors
b <- 1 / a          # scalar divided by each element of a
a * 8
a + 2
a - 3

# Common statistical functions
mean(a)
var(a)
sum(a)
prod(a)
sqrt(a)
length(a)
min(a)
which.min(a)        # index of minimum
max(a)
sort(a)
```

## Tutorial 3: More About Vectors

R can combine range notation and explicit values, and will recycle shorter vectors when performing arithmetic on vectors of different lengths (provided the longer length is a multiple of the shorter):

```r
# Combining notation
a <- c(3, 2, 1:5)

# Adding vectors of different lengths (recycling)
a <- 1:3
b <- 1:6
a + b   # b[4] + a[1], b[5] + a[2], b[6] + a[3]

# Logical vectors
a <- 1:4
logic <- a > 3     # returns FALSE FALSE FALSE TRUE

# Logical operators
TRUE & FALSE       # AND
TRUE | FALSE       # OR
!TRUE              # NOT

# Character vectors
s <- c("Hello", "World")

# Indexing by position
b[c(2, 3)]

# Indexing by logical vector
b[a > 3]           # elements of b where a > 3

# Named vectors
a <- c(1, 2, 3, 4)
names(a) <- c("Harry", "Ron", "Tom", "Jerry")
a["Ron"]
a[c("Ron", "Tom")]
```

## Tutorial 4: Objects in R

Every object in R has at least two attributes: **mode** (the type of data — `numeric`, `character`, `logical`) and **length** (the number of elements). A vector can only contain elements of the same mode; if you mix types, R automatically coerces them (e.g., mixing numeric and character produces a character vector).

```r
a <- c(1, 2, 3)
b <- c("one", "two", "three")
c <- c(TRUE, FALSE, TRUE)

mode(a)         # "numeric"
mode(b)         # "character"
mode(c)         # "logical"

# Check all objects in workspace
objects()
ls()

# Remove objects
rm(b, c)
ls()            # only a remains
```

## Tutorial 5: Arrays and Matrices

A **matrix** is a two-dimensional array. Elements are filled column-by-column by default.

```r
# Create a vector and give it dimensions (turns it into a matrix)
a <- 1:20
dim(a) <- c(4, 5)   # 4 rows, 5 columns
a

# Reference an element: row 2, column 4
a[2, 4]

# Create a matrix using array()
a <- array(1:20, dim = c(4, 5))

# Matrix of zeros
z <- array(0, dim = c(4, 5))

# Transpose
t(a)

# Element-wise multiplication
a * b

# True matrix multiplication
a %*% b

# Diagonal elements
diag(a)

# Eigenvalues and eigenvectors (requires square matrix)
sq <- array(1:16, dim = c(4, 4))
eigen(sq)$values
eigen(sq)$vectors

# Dimensions
nrow(a)
ncol(a)
```

## Tutorial 6: Reading Data from Files

R can import data from comma-separated (CSV) or tab-separated (TSV) files using `read.table()` or the convenience function `read.csv()`.

```r
# Reading a CSV file
chessplayer <- read.table("chessplayer.csv", header = TRUE, sep = ",")

# Reading a tab-separated file
chessplayer <- read.table("chessplayer.tab", header = TRUE, sep = "\t")

# Shortcut for CSV
chessplayer <- read.csv("chessplayer.csv", header = TRUE)

# Inspect the data
print(chessplayer)
summary(chessplayer)       # summary statistics for all columns

# Access a specific column using the $ operator
mean(chessplayer$Rating)

# Get help on any function
?read.table
```

The working directory determines where R looks for files. Set it in RStudio via **Session > Set Working Directory**, or in code with `setwd("path/to/directory")`.

## Tutorial 7: Scatter Plots

R's base graphics system provides the `plot()` function as the primary tool for creating scatter plots and line graphs.

```r
# Basic plot of a vector (x-axis is index)
a <- c(1, 4, 2, 7, 6)
plot(a)

# Plot with explicit x and y
plot(x = 1:5, y = a)

# Add a single point to an existing plot
points(4.5, 3)

# Plot a mathematical function
plot(sin, from = -pi, to = pi)

# Plot as a line (type = "l"), points (type = "p"), or both (type = "b")
x <- 0:10
y <- log(x + 1)
plot(x, y, type = "l")

# Customise with parameters
plot(sin, from = -pi, to = pi,
     type = "p",
     main = "Fun with Sine",
     sub = "A trigonometric function",
     xlab = "x",
     ylab = "y",
     lwd = 2,
     col = "darkblue")

# See all available colours
colours()
```

## Tutorial 8: Simple Linear Regression in R

Simple linear regression in R uses the `lm()` function (linear model). The first argument is a **formula** of the form `y ~ x`, where `y` is the dependent variable and `x` is the explanatory variable.

```r
# Import data (lung capacity dataset)
# attach() makes variable names directly accessible
data <- read.csv("lungcapacity.csv")
attach(data)

# Scatter plot: age (x) vs lung capacity (y)
plot(Age, LungCap, main = "Age vs Lung Capacity",
     xlab = "Age", ylab = "Lung Capacity")

# Pearson correlation
cor(Age, LungCap)

# Fit the linear model and store in object 'mod'
mod <- lm(LungCap ~ Age)

# Print full regression summary
summary(mod)

# The summary output includes:
# - Residuals: summary statistics for the residuals
# - Coefficients: estimate, std. error, t-statistic, p-value for each parameter
# - Residual standard error (= sqrt of MSE)
# - R-squared and Adjusted R-squared
# - F-statistic and p-value for overall model significance

# Extract coefficients
coef(mod)
mod$coefficients

# Add regression line to scatter plot
abline(mod, col = "red", lwd = 2)

# 95% confidence intervals for coefficients
confint(mod)

# 99% confidence intervals
confint(mod, level = 0.99)

# ANOVA table (corresponds to the F-test)
anova(mod)

# Attributes stored in the model object
attributes(mod)
mod$residuals
mod$fitted.values
```

The residual standard error reported in the `summary()` output is \(\hat{\sigma} = \sqrt{\text{MSE}} = \sqrt{\text{SSR}/(n-2)}\) for a simple regression, and equals the square root of the mean squared residual from the ANOVA table.

## Tutorial 8.5: Simple Linear Regression in RStudio

RStudio makes the process of running regressions more interactive through its script editor, workspace browser, and integrated help. Key workflow steps:

1. Import the data using `read.csv()` or `read.table()` and verify the import with `summary()`.
2. Produce a scatter plot to visually assess whether a linear relationship is plausible.
3. Compute the correlation coefficient to get a numerical summary of the linear association.
4. Use `lm()` to fit the model and `summary()` to examine the results.
5. Use `confint()` to compute confidence intervals and `anova()` to view the ANOVA decomposition.

For the lung capacity example, the intercept of the fitted model gives the estimated mean lung capacity when age is zero (not directly interpretable), while the slope gives the estimated increase in lung capacity per one additional year of age. The \(R^2\) reported in the summary measures the proportion of total variation in lung capacity that is explained by age.

## Tutorial 9: Multiple Linear Regression in RStudio

Multiple linear regression in R is a straightforward extension of `lm()`: simply list additional explanatory variables separated by `+` in the formula.

```r
# Fit model with age and height as predictors
model1 <- lm(LungCap ~ Age + Height)
summary(model1)

# The summary now shows:
# - Slopes for each predictor (partial effects)
# - Overall F-statistic tests H0: all slopes = 0
# - Adjusted R-squared (penalises for adding extra variables)

# Check for collinearity between predictors
cor(Age, Height)

# Confidence intervals for all coefficients
confint(model1)

# Fit model with all available predictors
model2 <- lm(LungCap ~ .)

# Examine residual plots to assess model assumptions
plot(model2)
# The four diagnostic plots show:
# 1. Residuals vs Fitted (linearity)
# 2. Normal Q-Q (normality of residuals)
# 3. Scale-Location (homoskedasticity)
# 4. Residuals vs Leverage (influential observations)
```

The slope for `Age` in `model1` is the **partial effect** of age on lung capacity, holding height constant. As noted in Tutorial 9, age and height are highly correlated, which is a source of multicollinearity: the individual slopes should not be interpreted as pure causal effects of each variable alone.

The **adjusted \(R^2\)**:

\[ \bar{R}^2 = 1 - \frac{\text{SSR}/(n-k-1)}{\text{SST}/(n-1)} \]

penalises the inclusion of additional predictors that do not materially improve model fit, unlike the unadjusted \(R^2\) which always increases when a variable is added. Comparing adjusted \(R^2\) values across models is one way to assess whether including additional regressors is warranted.

---

---

# Unit 6: Functional Form, Nonlinearities, and Measurement

## 6.1 Effect of Measurement Units on Regression Output

A key invariance property of OLS is that rescaling the dependent or independent variables affects the coefficient estimates but leaves the model's inferential conclusions unchanged. Suppose the model is

\[ \text{salary}_i = \beta_0 + \beta_1 \text{sales}_i + u_i \]

where salary is in thousands of dollars and sales in millions. Multiplying salary by 1,000 multiplies \(\hat{\beta}_0\) and \(\hat{\beta}_1\) by 1,000, but the t-statistics, p-values, \(R^2\), and SSR (on the same relative scale) are unchanged. Multiplying sales by \(10^6\) divides \(\hat{\beta}_1\) by \(10^6\) and the standard error of \(\hat{\beta}_1\) by the same factor, leaving the t-statistic unchanged.

<div class="definition"><strong>Invariance to rescaling:</strong> If you multiply \(Y\) by a constant \(c\), the new coefficients are \(c\hat{\beta}_j\); if you multiply \(X_j\) by a constant \(d\), the new \(\hat{\beta}_j\) is \(\hat{\beta}_j / d\). In both cases, t-statistics, F-statistics, \(R^2\), and significance conclusions are unaffected.</div>

## 6.2 Standardised (Beta) Coefficients

When comparing the relative importance of several regressors that are measured in different units, raw OLS coefficients are not directly comparable. **Standardised coefficients** (also called beta coefficients) are obtained by first standardising all variables to have mean zero and standard deviation one before running the regression. The resulting coefficient on variable \(j\) gives the expected change in \(Y\) (in standard deviation units of \(Y\)) for a one-standard-deviation increase in \(X_j\), holding all other regressors fixed.

In R, this is accomplished via `scale()`:

```r
res_std <- lm(scale(price) ~ scale(nox) + scale(dist) + scale(rooms) + scale(proptax) - 1,
              data = data)
```

Note the `-1` to suppress the intercept, since scaled variables have mean zero. The standardised coefficients allow direct comparison: in a housing price regression with nitrogen oxide, distance, rooms, and property tax, the coefficient on rooms (\(0.595\)) is much larger in absolute value than that on distance (\(-0.165\)), indicating that room count explains more variation in prices per standard-deviation unit than distance does.

## 6.3 Nonlinear Functional Forms: Logarithms

A fundamental modelling choice is whether to enter variables in levels or logarithms. The four standard specifications and their interpretations are:

<div class="definition">
<strong>Level-Level:</strong> \( Y = \beta_0 + \beta_1 X + u \). A one-unit increase in \(X\) changes \(Y\) by \(\hat{\beta}_1\) units.
</div>

<div class="definition">
<strong>Log-Level (semilog):</strong> \( \log(Y) = \beta_0 + \beta_1 X + u \). A one-unit increase in \(X\) changes \(Y\) by approximately \(100\hat{\beta}_1\) percent. Precisely: \(\%\Delta Y \approx 100\hat{\beta}_1 \Delta X\).
</div>

<div class="definition">
<strong>Level-Log:</strong> \( Y = \beta_0 + \beta_1 \log(X) + u \). A one-percent increase in \(X\) changes \(Y\) by \(\hat{\beta}_1 / 100\) units.
</div>

<div class="definition">
<strong>Log-Log (double log, constant elasticity):</strong> \( \log(Y) = \beta_0 + \beta_1 \log(X) + u \). A one-percent increase in \(X\) changes \(Y\) by approximately \(\hat{\beta}_1\) percent. The coefficient \(\hat{\beta}_1\) is directly the elasticity of \(Y\) with respect to \(X\).
</div>

In the Stock & Watson California school districts example:

\[ \widehat{\log(\text{salary})} = 4.504 + 0.163\log(\text{sales}) + 0.109\log(\text{mktval}) + 0.012\,\text{ceoten} \]

Here the coefficient 0.163 means that a 1% increase in firm sales is associated with a 0.163% increase in CEO salary. The `ceoten` coefficient 0.012 (level regressor in a log model) means one additional year of tenure is associated with a 1.2% salary increase.

## 6.4 Quadratic Relationships

When theory suggests a relationship that first rises then falls (or vice versa), we include a squared term. The model

\[ Y_i = \beta_0 + \beta_1 X_i + \beta_2 X_i^2 + u_i \]

has partial effect

\[ \frac{\partial \mathbb{E}[Y \mid X]}{\partial X} = \beta_1 + 2\beta_2 X \]

which depends on the current value of \(X\). The effect changes sign at the **turning point**:

\[ X^* = -\frac{\hat{\beta}_1}{2\hat{\beta}_2} \]

For example, in the wage-experience model:

\[ \widehat{\text{wage}} = 861.48 + 18.84\,\text{exper} - 0.794\,\text{exper}^2 \]

The marginal effect of experience is \(18.84 - 2(0.794)\,\text{exper} = 18.84 - 1.588\,\text{exper}\), which equals zero at \(\text{exper}^* = 18.84 / 1.588 \approx 11.9\) years — wages peak at about 12 years of experience and decline thereafter (due to physical depreciation or technological obsolescence).

### 6.4.1 Average Partial Effect (APE)

Because the marginal effect of \(X\) varies across observations, one summary measure is the **average partial effect**:

\[ \text{APE} = \hat{\beta}_1 + 2\hat{\beta}_2 \bar{X} \]

where \(\bar{X}\) is the sample mean of \(X\). To test whether the APE is zero (\(H_0: \beta_1 + 2\bar{X}\beta_2 = 0\)), one can use the indirect t-test: reparametrise by including \(X\) and \(X^2 - 2\bar{X} \cdot X\) as regressors, so the coefficient on the first term directly equals the APE, with the appropriate standard error.

## 6.5 Prediction in Regression

Once a regression has been estimated, it can be used for prediction. There are two types of intervals for a new observation \(X^*\):

<div class="definition"><strong>Confidence interval for the average prediction:</strong> Gives a range for the expected value \(\mathbb{E}[Y \mid X = X^*]\). This is tighter because it concerns only the uncertainty about the regression line itself.</div>

<div class="definition"><strong>Prediction interval for a single new observation:</strong> Gives a range for a new individual realisation \(Y^* = \hat{Y}^* + u^*\). This is wider because it adds the variance of the idiosyncratic error \(u^*\).</div>

Formally, the prediction interval is:

\[ \hat{Y}^* \pm t_{n-k-1, \alpha/2} \cdot \widehat{SE}_{\text{pred}} \]

where \(\widehat{SE}_{\text{pred}}^2 = \widehat{SE}_{\text{fit}}^2 + \hat{\sigma}^2\). In R: `predict(res, newdata = ..., interval = "prediction")` versus `interval = "confidence"`.

For log-linear models, predicted values require retransformation. If the model is \(\log(Y) = X\beta + u\) with \(u \sim N(0, \sigma^2)\), then

\[ \mathbb{E}[Y \mid X] = e^{X\beta + \sigma^2/2} \approx e^{\hat{X\beta}} \cdot e^{\hat{\sigma}^2/2} \]

Omitting the correction factor \(e^{\hat{\sigma}^2/2}\) systematically underestimates \(\mathbb{E}[Y]\).

---

# Unit 7: Qualitative Variables and Dummy Regressors

## 7.1 Binary (Dummy) Variables

A **dummy variable** (or indicator variable) takes only two values: 1 if some condition holds, 0 otherwise. For example, in a housing price regression, `colonial` = 1 if the house is colonial style, 0 otherwise. The regression

\[ \text{price}_i = \beta_0 + \beta_1 \text{colonial}_i + u_i \]

gives \(\hat{\beta}_0 = \bar{Y}_{\text{non-colonial}}\) (the average price of non-colonial houses, i.e., the intercept for the base group) and \(\hat{\beta}_1 = \bar{Y}_{\text{colonial}} - \bar{Y}_{\text{non-colonial}}\) (the difference in means). This is exactly equivalent to the pooled two-sample t-test with equal variance. The t-statistic on \(\hat{\beta}_1\) tests \(H_0: \mu_{\text{colonial}} = \mu_{\text{non-colonial}}\).

**The dummy variable trap:** If you have a categorical variable with \(m\) categories (e.g., season: spring, summer, autumn, winter), you should include \(m - 1\) dummy variables. Including all \(m\) creates **perfect collinearity** (the sum of all category dummies equals 1, identical to the constant term), so OLS cannot be estimated. The omitted category is the **reference group** or **base category**, and all other coefficients are interpreted relative to it.

## 7.2 Interaction Terms: Allowing Slopes to Differ

**Interaction terms** between a dummy variable \(D\) and a continuous variable \(X\) allow the slope of \(X\) to differ across groups. Consider:

\[ Y_i = \beta_0 + \beta_1 X_i + \beta_2 D_i + \beta_3 (D_i \cdot X_i) + u_i \]

For \(D = 0\) (base group): \(\mathbb{E}[Y \mid X, D=0] = \beta_0 + \beta_1 X\)

For \(D = 1\): \(\mathbb{E}[Y \mid X, D=1] = (\beta_0 + \beta_2) + (\beta_1 + \beta_3) X\)

Thus \(\beta_2\) shifts the intercept and \(\beta_3\) shifts the slope. Testing \(H_0: \beta_2 = \beta_3 = 0\) (via F-test) asks whether the entire regression function differs between groups.

For example, in a wage regression including a female dummy and its interaction with education:

\[ \widehat{\log(\text{wage})} = \hat{\beta}_0 + \hat{\beta}_1\,\text{educ} + \hat{\beta}_2\,\text{female} + \hat{\beta}_3\,(\text{female} \times \text{educ}) \]

\(\hat{\beta}_3 < 0\) would indicate that the return to education is lower for women than for men.

## 7.3 Gender and Wage Gap: A Worked Example

Using PSID 1982 data, a simple comparison of means shows a large raw wage gap:

\[ \widehat{\text{wage}} = 1200.35 - 464.53\,\text{genderfemale} \]

Controlling for experience, education, union status, occupation, industry, ethnicity, marital status, and region dramatically reduces this gap to:

\[ \widehat{\log(\text{wage})} = 6.053 - 0.307\,\text{genderfemale} + 0.061\,\text{education} + \cdots \]

The controlled gap (approximately 26% lower earnings for women with otherwise similar characteristics) is substantially smaller than the raw gap. However, interpreting this residual 26% as discrimination is hazardous: characteristics that we cannot observe (e.g., motivation, negotiating behaviour, job preferences) may still differ systematically between men and women and would need to be controlled for before drawing causal conclusions.

## 7.4 The Linear Probability Model (LPM)

When the dependent variable is binary (\(Y_i \in \{0, 1\}\)), applying OLS directly is called the **Linear Probability Model**. The predicted value \(\hat{Y}_i\) is interpreted as the estimated probability that \(Y_i = 1\):

\[ \Pr(Y_i = 1 \mid X_i) = \beta_0 + \beta_1 X_i + \cdots + \beta_k X_{ki} \]

The coefficient \(\beta_j\) is the marginal effect of \(X_j\) on the probability of \(Y = 1\), holding other regressors fixed.

**Advantages of LPM:** Simple to estimate and interpret; partial effects are directly given by the coefficients.

**Problems with LPM:**
1. Predicted probabilities can fall outside \([0, 1]\) — logically inconsistent.
2. The error term is heteroskedastic by construction, since \(\text{Var}(u_i \mid X_i) = p_i(1 - p_i)\) where \(p_i = \hat{Y}_i\), so standard errors need to be robust.
3. The linear approximation may be poor at extreme values.

In R, using the `weights` argument with \(w_i = 1/[\hat{Y}_i(1 - \hat{Y}_i)]\) implements Feasible GLS (WLS) for the LPM, which is more efficient but requires that all \(\hat{Y}_i\) fall inside \((0, 1)\).

## 7.5 Program Evaluation and the Selection Problem

Dummy variables representing participation in a programme (e.g., job training grants) appear in many policy evaluations. However, if programme participation is not randomly assigned — if certain types of firms or workers are more likely to receive training — then OLS suffers from omitted variable bias and the estimated effect of the programme cannot be interpreted causally. True causal identification requires either random assignment or a credible natural experiment (see Unit 1.2).

---

# Unit 8: Heteroskedasticity

## 8.1 What Heteroskedasticity Is and Why It Matters

**Heteroskedasticity** occurs when the variance of the error term is not constant across observations:

\[ \text{Var}(u_i \mid X_i) = \sigma_i^2 \quad (\text{varies with } i) \]

instead of the homoskedastic assumption \(\text{Var}(u_i \mid X_i) = \sigma^2\).

Under heteroskedasticity:
1. OLS estimators remain **unbiased and consistent** (assumptions A1–A4 are not violated).
2. OLS is **no longer BLUE**: it is no longer the most efficient linear unbiased estimator. Weighted Least Squares (WLS) with weights \(w_i = 1/\sigma_i^2\) is more efficient.
3. The usual OLS standard error formula \(\hat{\sigma}^2 / \text{SST}_x\) is **invalid**: it over- or understates the true sampling variation, leading to incorrect t-statistics and F-statistics.

A simulation makes this vivid. With homoskedastic errors, the reported standard error is close to the true sampling standard deviation of \(\hat{\beta}_1\). With heteroskedastic errors (variance proportional to \(|X_i|\)), the true standard deviation of \(\hat{\beta}_1\) is much larger than what OLS reports, causing invalid inference.

## 8.2 Heteroskedasticity-Robust Standard Errors

The solution to invalid standard errors under heteroskedasticity is to use **heteroskedasticity-robust** (or **sandwich**) standard errors. The standard OLS variance estimator

\[ \widehat{\text{Var}}_{\text{OLS}}(\hat{\beta}_1) = \frac{\hat{\sigma}^2}{\sum(x_i - \bar{x})^2} \]

is replaced by the HC (heteroskedasticity-consistent) estimator:

\[ \widehat{\text{Var}}_{\text{HC}}(\hat{\beta}_1) = \frac{\sum_{i=1}^n (x_i - \bar{x})^2 \hat{u}_i^2}{\left[\sum_{i=1}^n (x_i - \bar{x})^2\right]^2} \]

There are several versions (HC0, HC1, HC2, HC3), differing in how they adjust the residuals. All are asymptotically equivalent. In R:

```r
library(sandwich)
library(lmtest)
coeftest(res, vcov = vcovHC(res, "HC0"))       # HC0 robust SEs
linearHypothesis(res, ..., vcov = vcovHC(res)) # Robust F/Wald tests
```

Robust standard errors do not change the OLS coefficient estimates; they only affect the standard errors and hence the t-statistics and confidence intervals.

## 8.3 Testing for Heteroskedasticity

### Breusch-Pagan (BP) Test

The **Breusch-Pagan test** formally tests \(H_0: \text{Var}(u_i \mid X) = \sigma^2\) (homoskedasticity). The procedure:

1. Estimate the original regression and save squared residuals \(\hat{u}_i^2\).
2. Regress \(\hat{u}_i^2\) on all regressors (and any other suspected drivers of variance).
3. Compute \(n \cdot R^2\) from step 2. Under \(H_0\), this statistic is asymptotically \(\chi^2(q)\) where \(q\) is the number of regressors in step 2 (excluding the constant).

In R: `bptest(res)` from the `lmtest` package implements the studentised version of this test.

### White Test

The **White test** is a more general test that also detects non-linear forms of heteroskedasticity. It regresses \(\hat{u}_i^2\) on all regressors, their squares, and their cross-products. A shortcut version regresses \(\hat{u}_i^2\) on \(\hat{Y}_i\) and \(\hat{Y}_i^2\) (the "special White test").

If the BP or White test rejects \(H_0\), the appropriate response is to use robust standard errors (or to model the heteroskedasticity explicitly via GLS).

## 8.4 Generalised Least Squares (GLS) and Weighted Least Squares (WLS)

If the form of heteroskedasticity is known — say, \(\text{Var}(u_i \mid X_i) = \sigma^2 h(X_i)\) for some known function \(h\) — we can achieve efficiency by dividing the entire regression equation by \(\sqrt{h(X_i)}\). This is equivalent to **Weighted Least Squares (WLS)** with weights \(w_i = 1/h(X_i)\):

\[ \min_{\beta} \sum_{i=1}^n \frac{(y_i - \beta_0 - \beta_1 x_{1i} - \cdots)^2}{h(x_i)} \]

The WLS estimator is BLUE under the correctly specified heteroskedastic model.

When the form of \(h\) is unknown, it must be estimated. **Feasible GLS (FGLS)** estimates \(h\) in a first stage by regressing \(\log(\hat{u}_i^2)\) on the regressors, exponentiating the fitted values to get \(\hat{h}_i\), and then running WLS with weights \(1/\hat{h}_i$.

```r
lu2 <- log(residuals(res)^2)
res_h <- lm(lu2 ~ x1 + x2 + ..., data = data)
h <- exp(fitted(res_h))
res_fgls <- lm(y ~ x1 + x2 + ..., weights = 1/h, data = data)
```

FGLS is asymptotically more efficient than OLS but is not guaranteed to be better in small samples.

---

# Unit 9: Model Specification, Misspecification, and Outliers

## 9.1 Functional Form Misspecification

If the true relationship between \(Y\) and \(X\) is nonlinear but the estimated model is linear, the model is **misspecified**. A simulation example: if the true DGP is

\[ y = 1 + x_1 + x_2 - 0.3 x_2^2 + u \]

but we estimate \(y = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + u\) (omitting \(x_2^2\)), we get biased estimates for all coefficients — not just \(\beta_2\). This is because \(x_2^2\) is correlated with \(x_2\) (and often with \(x_1\)), so omitting it contaminates all coefficients.

Functional form misspecification is therefore a special case of omitted variable bias.

### RESET Test (Regression Equation Specification Error Test)

The **Ramsey RESET test** provides a general test for functional form misspecification:

1. Estimate the original model and save fitted values \(\hat{Y}_i\).
2. Regress \(Y_i\) on all original regressors plus \(\hat{Y}_i^2, \hat{Y}_i^3, \ldots\)
3. Test jointly whether the added powers of \(\hat{Y}_i\) are significant using an F-test.

Rejection suggests that the functional form is misspecified.

```r
library(lmtest)
resettest(res)
```

## 9.2 Influential Observations and Outliers

An **outlier** is an observation with an extreme residual; an **influential observation** is one whose removal substantially changes the regression estimates. These are distinct concepts: an outlier in \(Y\) may or may not be influential, depending on whether its \(X\) value is extreme.

**Cook's distance** measures the influence of each observation by computing the change in all fitted values when that observation is deleted. A large Cook's distance (greater than 1, or larger than \(4/n\) as a rule of thumb) flags an observation as potentially influential.

```r
plot(res, 4)   # Cook's distance plot
```

**Strategies for handling outliers:**
1. Check whether the observation is a data entry error.
2. Consider an alternative functional form (e.g., log transformation) that reduces leverage of extreme values.
3. Use **Least Absolute Deviations (LAD)** regression, also called **median regression**, which minimises \(\sum |\hat{u}_i|\) rather than \(\sum \hat{u}_i^2\). LAD is robust to outliers in \(Y\) because extreme residuals are not squared.

```r
library(quantreg)
res_lad <- rq(y ~ x1 + x2, data = data)
summary(res_lad)   # tau = 0.5 by default (median regression)
```

## 9.3 Interaction Terms and Heterogeneous Effects

When different subgroups may follow different regression functions, we can test this via interaction terms. With a continuous variable \(X\) and binary variable \(D\) (e.g., female), the interaction model

\[ Y_i = \beta_0 + \beta_1 X_i + \beta_2 D_i + \beta_3 (D_i \cdot X_i) + u_i \]

allows both intercepts and slopes to differ. An F-test of \(H_0: \beta_2 = \beta_3 = 0\) tests the null that the regression function is identical across groups. Alternatively, one can estimate separate regressions for each group and compare.

For example, with wage, education, and gender:

\[ \widehat{\text{wage}} = -4.808 + 0.645\,\text{educ} - 0.184(\text{female} \times \text{educ}) + 2.893\,\text{female} \]

The interaction coefficient \(-0.184\) indicates that the return to education is 0.184 per year lower for women than for men. An F-test confirms whether this differential is statistically significant.

---

# Unit 10: Asymptotic Theory and Bootstrap

## 10.1 Large-Sample (Asymptotic) Theory

The classical assumptions (A1–A6) include normality of the error term (A6). However, for many applications — especially with non-normal data — normality is unrealistic. The **asymptotic** properties of OLS rely on weaker assumptions and on the **Central Limit Theorem (CLT)**.

**Key asymptotic theorems** (Wooldridge Chapter 5 / Chaussé Topic 3):

<div class="definition"><strong>Theorem 1 (Consistency):</strong> Under assumptions A1–A4, the OLS estimator \(\hat{\beta}_j\) is consistent for all \(j\). This result also holds under the weaker assumption A4': \(\mathbb{E}[u] = 0\) and \(\text{Cov}(x_j, u) = 0\) for all \(j\) (zero mean and zero covariance, but not necessarily full zero conditional mean).</div>

<div class="definition"><strong>Theorem 2 (Asymptotic Normality):</strong> Under assumptions A1–A5 (normality not required), as \(n \to \infty\):
\[
\frac{\hat{\beta}_j - \beta_j}{\hat{\sigma}_{\beta_j}} \xrightarrow{d} \mathcal{N}(0,1)
\]
That is, the standardised OLS estimator is asymptotically standard normal, regardless of the distribution of the error term. This justifies using normal (or t-distribution) critical values for inference in large samples.</div>

<div class="definition"><strong>Theorem 3 (Asymptotic Efficiency):</strong> Under A1–A5, the OLS estimator is asymptotically the most efficient among a class of estimators satisfying A4: \(\mathbb{E}[u \mid x] = 0\).</div>

## 10.2 Bootstrap Inference

The **bootstrap** is a simulation-based method for conducting inference when the standard asymptotic approximations may be unreliable — for example, when the sample size is small, the error distribution is highly non-normal (skewed or heavy-tailed), or when the estimator of interest has no closed-form standard error.

### 10.2.1 Bootstrap Critical Values for Hypothesis Tests

The standard t-test uses critical values from the t-distribution (or normal). The bootstrap replaces these with critical values computed directly from the data. The procedure for testing \(H_0: \mu = c\):

1. Compute the test statistic from the original sample:
\[ t = \frac{\bar{x} - c}{s/\sqrt{n}} \]

2. Generate \(B\) **bootstrap samples** by sampling with replacement from the original data \(\{x_1, \ldots, x_n\}\).

3. For each bootstrap sample \(b\), compute the bootstrap test statistic:
\[ t^*_b = \frac{\bar{x}^*_b - \bar{x}}{s^*_b/\sqrt{n}} \]
Note: the null value \(c\) is replaced by \(\bar{x}\), so the distribution of \(t^*\) is centred under what the data imply.

4. Use the empirical 2.5th and 97.5th percentiles of \(\{t^*_1, \ldots, t^*_B\}\) as the bootstrap critical values. Reject if \(t\) falls outside this range.

```r
set.seed(112233)
x <- rchisq(20, 3)
xbar <- mean(x)
test <- sqrt(20) * (xbar - 3) / sd(x)

teststar <- rep(0, 2000)
for (i in 1:2000) {
    xstar <- sample(x, replace = TRUE)
    teststar[i] <- sqrt(20) * (mean(xstar) - xbar) / sd(xstar)
}
quantile(teststar, c(0.025, 0.975))   # Bootstrap critical values
```

### 10.2.2 When Does the Bootstrap Outperform Standard Tests?

A simulation study comparing rejection rates across five data distributions (Normal, Uniform, Chi-squared, t, Binomial) and three inferential methods (standard normal, t-distribution, bootstrap) reveals:

- For **normally distributed** data: the t-distribution is most accurate; the normal slightly over-rejects in small samples; bootstrap is acceptable.
- For **skewed distributions** (e.g., chi-squared): the t-distribution over-rejects (actual rejection rate above 5% at small \(n\)); the bootstrap is much better calibrated.
- For **heavy-tailed distributions** (e.g., t with 3 df): the bootstrap can over-reject if \(n\) is small, because bootstrap samples drawn from a heavy-tailed empirical distribution may miss the tail behaviour.
- For **discrete distributions** (e.g., Binomial): the bootstrap can under-reject because the discreteness prevents the 2.5th and 97.5th quantiles from being achieved exactly.

In general, the bootstrap improves on the t-distribution when the data are skewed or non-normal and \(n\) is moderate (40–100+). The t-distribution is preferred for small samples from symmetric distributions.

### 10.2.3 Bootstrap Standard Errors

The bootstrap can estimate standard errors for any estimator, not just the mean. For example, to test \(H_0: \mathbb{E}[X^2] = 1\):

```r
x <- rnorm(30)
theta <- rep(0, 1000)
for (i in 1:1000) {
    xstar <- sample(x, replace = TRUE)
    theta[i] <- mean(xstar^2)
}
(s <- sd(theta))           # Bootstrap standard error of theta-hat
thetaHat <- mean(x^2)
(test <- (thetaHat - 1) / s)   # Use N(0,1) critical values
```

The bootstrap standard error is the standard deviation of the bootstrap distribution of \(\hat{\theta}^*\).

---

# Unit 11: Applications

## 11.1 The 2016 US Presidential Election: Fair Model

The **Fair model** (Ray Fair, Yale) predicts the Democratic share of the two-party presidential vote using macroeconomic variables. The model estimated on elections from 1916–2012 is:

\[ \widehat{VP} = 47.754 + 0.667\,I \cdot G - 0.690\,I \cdot P + 0.968\,I \cdot Z + 3.008\,\text{DPER} - 3.805\,\text{DUR} - 1.563\,I + 4.892\,\text{WAR} \]

\(n = 25\), \(R^2 = 0.897\), SSR = 117.07.

Variable definitions:
- \(G\): growth rate of real per capita GDP in the first 3 quarters of the election year (favours incumbent when positive)
- \(P\): growth rate of the GDP deflator in the first 15 quarters of the administration (hurts incumbent when positive)
- \(Z\): number of quarters in the first 15 quarters with growth \(> 3.2\%\) (favours incumbent)
- \(I\): equals 1 if the incumbent party is Democrat, \(-1\) if Republican
- \(DPER\): 1 if a Democratic presidential incumbent is running again, \(-1\) if Republican, 0 otherwise
- \(DUR\): duration indicator for how long the incumbent party has held office (hurts incumbent)
- \(WAR\): 1 for WWI and WWII elections

Note the variables \(G\), \(P\), \(Z\) are interacted with \(I\) so that good economic news always benefits the incumbent party regardless of affiliation.

For the 2016 election (\(G = 0.97\), \(P = 1.42\), \(Z = 2\), \(DUR = 1\), \(WAR = 0\), \(I = 1\), \(DPER = 0\)):

```r
newdat <- data.frame(G = 0.97, P = 1.42, Z = 2, DUR = 1,
                     WAR = 0, DPER = 0, I = 1)
predict(res, newdata = newdat, interval = "confidence")
##   fit      lwr      upr
## 1 43.99  40.77   47.21
predict(res, newdata = newdat, interval = "prediction")
##   fit      lwr      upr
## 1 43.99  37.58   50.39
```

The model predicted a Democratic vote share of 43.99% — below 50% — correctly predicting a Republican victory. However, the wide prediction interval \([37.6\%, 50.4\%]\) illustrates substantial uncertainty. The confidence interval for the average prediction is much narrower at \([40.8\%, 47.2\%]\), but both intervals included values above and below 50%, making the prediction inherently uncertain.

The Redskins Rule (if Washington Redskins win their last home game before the election, the incumbent party wins) predicted a Democratic victory in 2016 — and was wrong. This illustrates the danger of **spurious correlations**: a relationship that has held historically by chance (19 of 21 elections correct up to 2012) need not reflect any causal mechanism and will eventually fail.

## 11.2 Campus Crime: Applying Two-Sample Tests

Using the Wooldridge campus crime dataset (\(n = 97\) universities), we can apply the statistical tools from Unit 1/Topic 1:

**Test 1:** Is the mean crime count equal to 350? (\(H_0: \mu = 350\) vs \(H_1: \mu > 350\))
\[ t = \frac{\sqrt{97}(\bar{x} - 350)}{s} = 0.95 < 1.645 \]
Fail to reject at 5%.

**Test 2:** Is mean crime equal in private vs public universities? (two-sample test with unequal variances)
\[ t = \frac{\bar{x}_{\text{private}} - \bar{x}_{\text{public}}}{\sqrt{s_{\text{pr}}^2/n_{\text{pr}} + s_{\text{pu}}^2/n_{\text{pu}}}} = -4.85 \]
Strongly reject \(H_0\): public universities have far more crimes on average. But the mean enrollment is also much larger in public universities (17,473 vs 6,183). After normalising by enrollment (crimes per 100 students), the test statistic is only \(-0.19\), failing to reject — students in public and private universities are equally likely to be crime victims per capita.

**Test 3:** Is the variance of crime equal across sectors? (F-test for equality of variances)
\[ F = \frac{s_{\text{public}}^2}{s_{\text{private}}^2} = \frac{477.95^2}{129.44^2} = 13.63 \]
Compared to the critical value \(F_{0.95}(n_{\text{pu}}-1, n_{\text{pr}}-1) \approx 2.47\), we strongly reject \(H_0: \sigma_{\text{pr}}^2 = \sigma_{\text{pu}}^2\). Crime counts are much more dispersed in public universities.

---

*These notes were compiled from 32 lecture and tutorial transcripts for ECON 322: Introduction to Econometrics, Spring 2021, University of Waterloo (Term 1215), and enriched with content from the Chaussé lecture slides (Topic 1–9, Bootstrap, Election) and Stock & Watson textbook chapters 4–7.*
