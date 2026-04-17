---
title: "ECON 323: Econometric Analysis 2"
prof: "Mikal Skuterud"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Wooldridge, Jeffrey M. (2025). *Introductory Econometrics: A Modern Approach*, 8th ed. Cengage Learning. (Chapters 10–15, 17.)

**Supplementary texts** — Angrist, J. D. & Pischke, J.-S. (2009). *Mostly Harmless Econometrics*. Princeton UP; Cameron, A. C. & Trivedi, P. K. (2005). *Microeconometrics: Methods and Applications*. Cambridge UP.

**Online resources** — MIT OCW 14.32 (Econometrics); Wooldridge companion datasets (R package `wooldridge`); Nick Huntington-Klein, *The Effect* (free at theeffectbook.net).

---

# Chapter 1: Review of OLS and Introduction to the Course

## 1.1 The Core Regression Setup

ECON 323 extends the OLS framework of ECON 322 to settings where the standard assumptions break down: data observed over time, panel structures, endogenous regressors, and non-continuous outcomes. A brief review of the multiple regression model sets the stage.

The population model is \( y = \beta_0 + \beta_1 x_1 + \cdots + \beta_k x_k + u \), with OLS estimator:

\[
\hat{\boldsymbol{\beta}} = (\mathbf{X}^{\top}\mathbf{X})^{-1}\mathbf{X}^{\top}\mathbf{y}
\]

Key properties: unbiasedness under MLR.1–MLR.4, efficiency (BLUE) under MLR.1–MLR.5, and asymptotic normality in large samples.

## 1.2 Endogeneity: The Central Problem

The zero conditional mean assumption \( E[u \mid \mathbf{x}] = 0 \) fails — making OLS **biased and inconsistent** — in three main situations:

1. **Omitted variables:** A variable correlated with both \( y \) and at least one included \( x \) is left out.
2. **Measurement error in a regressor:** Classical errors-in-variables attenuate the coefficient toward zero.
3. **Simultaneity:** \( y \) and \( x \) are jointly determined (supply and demand, for instance).

All three generate **endogeneity**: \( \text{Cov}(x_j, u) \neq 0 \). The response is to find instruments or exploit quasi-experimental variation.

---

# Chapter 2: Time Series Regression

## 2.1 Basic Concepts

**Time series data** are observations on one unit (a country, firm, or price index) collected at equally-spaced intervals: \( \{y_t, x_{1t}, \ldots, x_{kt}\}_{t=1}^T \). The ordering of observations is informative, unlike cross-sectional data.

<div class="definition">
<strong>Strict Exogeneity (TS.3):</strong> \( E[u_t \mid \mathbf{x}_1, \ldots, \mathbf{x}_T] = 0 \) for all <em>t</em>. This rules out feedback from past values of <em>y</em> back to the regressors.
</div>

Under the time-series Gauss-Markov assumptions (TS.1–TS.5), OLS is unbiased and consistent for static time-series regression.

## 2.2 Finite Distributed Lag Models

A **finite distributed lag (FDL)** model relates \( y_t \) to current and lagged values of \( x_t \):

\[
y_t = \alpha + \delta_0 x_t + \delta_1 x_{t-1} + \delta_2 x_{t-2} + \cdots + \delta_q x_{t-q} + u_t
\]

The **impact propensity** is \( \delta_0 \) (immediate effect of a unit change in \( x \)). The **long-run propensity (LRP)** is the cumulative effect once all dynamics have played out:

\[
\text{LRP} = \sum_{j=0}^{q} \delta_j
\]

<div class="example">
<strong>Fertility Rate and Tax Exemptions:</strong> A classic Wooldridge example regresses the general fertility rate on the tax exemption for children and several lags. The LRP captures how fertility responds over multiple years to a permanent policy change.
</div>

## 2.3 Serial Correlation

**Serial correlation (autocorrelation)** is the violation of the time-series assumption that errors are uncorrelated across periods: \( \text{Cov}(u_t, u_s) \neq 0 \) for \( t \neq s \). The most common form is first-order autocorrelation:

\[
u_t = \rho u_{t-1} + e_t, \quad e_t \sim \text{i.i.d.}(0, \sigma_e^2), \quad |\rho| < 1
\]

Consequences for OLS parallel heteroskedasticity: estimates remain unbiased and consistent (under strict exogeneity), but OLS is no longer efficient and conventional standard errors are invalid.

The **Durbin-Watson statistic** tests \( H_0: \rho = 0 \) against \( H_1: \rho > 0 \):

\[
DW = \frac{\sum_{t=2}^T (\hat{u}_t - \hat{u}_{t-1})^2}{\sum_{t=1}^T \hat{u}_t^2} \approx 2(1 - \hat{\rho})
\]

Values near 2 indicate no serial correlation; values near 0 (or 4) indicate positive (or negative) autocorrelation. The **Breusch-Godfrey LM test** is more general and allows for testing higher-order autocorrelation.

## 2.4 Serial-Correlation-Robust and HAC Standard Errors

The **Newey-West HAC (Heteroskedasticity and Autocorrelation Consistent)** estimator corrects OLS standard errors for both heteroskedasticity and serial correlation:

\[
\widehat{\text{Var}}_{NW}(\hat{\boldsymbol{\beta}}) = (\mathbf{X}^{\top}\mathbf{X})^{-1} \hat{\boldsymbol{\Omega}}_{NW} (\mathbf{X}^{\top}\mathbf{X})^{-1}
\]

where \( \hat{\boldsymbol{\Omega}}_{NW} \) is the Newey-West kernel estimator with bandwidth \( M \) (often chosen as \( \lfloor 4(T/100)^{2/9} \rfloor \)). HAC standard errors are the time-series analog of Eicker-Huber-White robust standard errors.

## 2.5 Spurious Regression and Trending Variables

When two variables share a **deterministic trend**, OLS may find a statistically significant relationship between them even though they are causally unrelated — **spurious regression**. Including a time trend \( t = 1, 2, \ldots, T \) controls for common deterministic trends.

More seriously, **stochastic trends** (unit roots) can generate spurious regressions even after detrending. The correct treatment depends on whether the series are **cointegrated** (covered in ECON 423).

---

# Chapter 3: Panel Data Methods

## 3.1 Panel Data Structures

**Panel data** (longitudinal data) follow \( N \) units (individuals, firms, countries) over \( T \) time periods, yielding \( NT \) observations \( \{y_{it}, \mathbf{x}_{it}\}_{i=1,t=1}^{N,T} \). Panels are **balanced** if every unit has all \( T \) observations.

The general panel regression model is:

\[
y_{it} = \mathbf{x}_{it}^{\top}\boldsymbol{\beta} + a_i + u_{it}
\]

where \( a_i \) is a unit-specific **unobserved effect** (or fixed effect), constant over time.

## 3.2 Pooled OLS

Simply stacking all \( NT \) observations and running OLS (ignoring \( a_i \)) is **pooled OLS**. If \( \text{Cov}(a_i, \mathbf{x}_{it}) = 0 \) and \( E[u_{it} \mid \mathbf{x}_{i1}, \ldots, \mathbf{x}_{iT}, a_i] = 0 \), pooled OLS is consistent but the standard errors must be **clustered** at the unit level to account for within-unit serial correlation induced by \( a_i \).

## 3.3 The Fixed Effects Estimator

When \( a_i \) is arbitrarily correlated with \( \mathbf{x}_{it} \) (the usual concern in economics), the **Fixed Effects (FE)** or **within estimator** eliminates \( a_i \) by demeaning:

\[
y_{it} - \bar{y}_i = (\mathbf{x}_{it} - \bar{\mathbf{x}}_i)^{\top}\boldsymbol{\beta} + (u_{it} - \bar{u}_i)
\]

where \( \bar{y}_i = T^{-1}\sum_t y_{it} \). OLS on this demeaned equation is the FE estimator. Because \( a_i \) has been differenced out, FE is consistent even when \( \text{Cov}(a_i, \mathbf{x}_{it}) \neq 0 \).

<div class="theorem">
<strong>Fixed Effects Estimator:</strong> Let \( \ddot{y}_{it} = y_{it} - \bar{y}_i \) and \( \ddot{\mathbf{x}}_{it} = \mathbf{x}_{it} - \bar{\mathbf{x}}_i \). The FE estimator is:

\[
\hat{\boldsymbol{\beta}}_{FE} = \left(\sum_{i=1}^N \sum_{t=1}^T \ddot{\mathbf{x}}_{it}\ddot{\mathbf{x}}_{it}^{\top}\right)^{-1} \sum_{i=1}^N \sum_{t=1}^T \ddot{\mathbf{x}}_{it}\ddot{y}_{it}
\]
This is numerically equivalent to OLS with unit (entity) dummies.
</div>

**Limitation:** Because FE differences out all within-unit variation, it cannot identify the effect of any time-invariant variable (e.g., sex, race, country characteristics). Such variables are perfectly collinear with the unit dummies.

## 3.4 First Differences

An alternative elimination strategy is **first differencing**: subtract the previous period from the current period:

\[
\Delta y_{it} = \Delta \mathbf{x}_{it}^{\top}\boldsymbol{\beta} + \Delta u_{it}, \quad \Delta y_{it} = y_{it} - y_{i,t-1}
\]

With \( T = 2 \), FE and FD are identical. With \( T > 2 \), FD is more efficient when \( \Delta u_{it} \) is serially uncorrelated (i.e., \( u_{it} \) follows a random walk), while FE is more efficient when \( u_{it} \) is serially uncorrelated.

## 3.5 Random Effects

If \( \text{Cov}(a_i, \mathbf{x}_{it}) = 0 \), the **Random Effects (RE) estimator** exploits both within- and between-unit variation, yielding more efficient estimates than FE. RE is a weighted average of the within estimator (FE) and the between estimator (cross-sectional OLS on group means). The RE estimator uses a GLS transformation with weight \( \lambda = 1 - \sqrt{\sigma_u^2 / (\sigma_u^2 + T\sigma_a^2)} \).

**Hausman test:** Tests \( H_0: \text{Cov}(a_i, \mathbf{x}_{it}) = 0 \) by comparing RE and FE:

\[
H = (\hat{\boldsymbol{\beta}}_{FE} - \hat{\boldsymbol{\beta}}_{RE})^{\top}\left[\widehat{\text{Var}}(\hat{\boldsymbol{\beta}}_{FE}) - \widehat{\text{Var}}(\hat{\boldsymbol{\beta}}_{RE})\right]^{-1}(\hat{\boldsymbol{\beta}}_{FE} - \hat{\boldsymbol{\beta}}_{RE}) \xrightarrow{d} \chi^2(k)
\]

Rejection of \( H_0 \) favors FE.

---

# Chapter 4: Instrumental Variables and Two-Stage Least Squares

## 4.1 Endogeneity and the Need for Instruments

Recall that if \( \text{Cov}(x_1, u) \neq 0 \) (endogeneity), OLS is inconsistent. An **instrumental variable (IV)** \( z \) satisfies two conditions:

<div class="definition">
<strong>Instrument Relevance:</strong> \( \text{Cov}(z, x_1) \neq 0 \) — the instrument is correlated with the endogenous regressor.
<br><br>
<strong>Instrument Exogeneity (Exclusion Restriction):</strong> \( \text{Cov}(z, u) = 0 \) — the instrument affects <em>y</em> only through its effect on \( x_1 \), not directly.
</div>

The exclusion restriction is an identifying assumption that cannot be directly tested (since \( u \) is unobservable). Economic theory and institutional knowledge must justify it.

## 4.2 The IV Estimator

For the simple model \( y = \beta_0 + \beta_1 x_1 + u \) with one instrument \( z \):

\[
\hat{\beta}_1^{IV} = \frac{\text{Cov}(z, y)}{\text{Cov}(z, x_1)} = \frac{\sum_i (z_i - \bar{z})(y_i - \bar{y})}{\sum_i (z_i - \bar{z})(x_i - \bar{x})}
\]

Consistency: \( \text{plim}(\hat{\beta}_1^{IV}) = \beta_1 + \text{Cov}(z,u)/\text{Cov}(z,x_1) = \beta_1 \) when \( \text{Cov}(z,u) = 0 \).

Under instrument relevance and exogeneity, the IV estimator is consistent and asymptotically normal, though **less efficient than OLS** when OLS is consistent. The asymptotic variance of IV exceeds that of OLS by a factor proportional to \( 1/\rho_{zx}^2 \).

<div class="example">
<strong>Card (1995) — Returns to Education:</strong> OLS estimates of the return to schooling are upward biased if ability is omitted (ability positively affects both schooling and wages). Card uses proximity to a 4-year college as an instrument for years of schooling. The exclusion restriction is that living near a college affects wages only through its effect on schooling, not directly.
</div>

## 4.3 Two-Stage Least Squares (2SLS)

With multiple endogenous regressors and multiple instruments, **Two-Stage Least Squares (2SLS)** is the standard approach.

**Stage 1:** Regress each endogenous variable \( x_j \) on all exogenous variables (including instruments):

\[
x_{j} = \pi_{j0} + \pi_{j1} z_1 + \cdots + \pi_{jm} z_m + \pi_{j,m+1} w_1 + \cdots + v_j
\]
Obtain fitted values \( \hat{x}_j \).

**Stage 2:** Replace endogenous \( x_j \) with \( \hat{x}_j \) in the structural equation and run OLS.

The 2SLS estimator has the closed-form:

\[
\hat{\boldsymbol{\beta}}_{2SLS} = \left(\hat{\mathbf{X}}^{\top}\mathbf{X}\right)^{-1}\hat{\mathbf{X}}^{\top}\mathbf{y}
\]

where \( \hat{\mathbf{X}} \) contains the first-stage fitted values. Standard errors must be computed using the original \( \mathbf{X} \), not \( \hat{\mathbf{X}} \), to be valid.

**Order condition for identification:** Number of instruments \( \geq \) number of endogenous variables. If equal, the equation is **exactly identified** (unique IV); if greater, **overidentified** (2SLS uses all instruments efficiently).

## 4.4 Testing Instruments

**Weak Instruments:** If \( \rho_{zx}^2 \) is small, the first-stage F-statistic will be low. A common rule of thumb: first-stage \( F < 10 \) signals weak instruments, causing IV estimates to be nearly as biased as OLS and inference to be unreliable. Use Stock-Yogo critical values for formal testing.

**Overidentification Test (Sargan-Hansen J-test):** When there are more instruments than endogenous variables, the excess moment conditions can be tested. Under the joint null that all instruments are exogenous:

\[
J = n \cdot R^2_{\hat{u}, \mathbf{Z}} \xrightarrow{d} \chi^2(m - k_{endog})
\]

where the \( R^2 \) is from regressing 2SLS residuals on all instruments and exogenous regressors. Rejection casts doubt on at least one instrument's exogeneity.

---

# Chapter 5: Limited Dependent Variable Models

## 5.1 Binary Outcomes and Maximum Likelihood Estimation

When the dependent variable is binary (\( y \in \{0,1\} \)), the **linear probability model** provides a starting point (Chapter 6 of ECON 322 notes), but its predictions can exceed \([0,1]\). **Probit** and **Logit** models impose proper probability bounds via a link function.

**Maximum Likelihood Estimation (MLE)** finds the parameter vector that maximizes the likelihood of observing the data. For a binary model with \( P(y_i=1\mid\mathbf{x}_i) = G(\mathbf{x}_i^{\top}\boldsymbol{\beta}) \):

\[
\mathcal{L}(\boldsymbol{\beta}) = \sum_{i=1}^n \left[y_i \ln G(\mathbf{x}_i^{\top}\boldsymbol{\beta}) + (1-y_i)\ln\!\left(1 - G(\mathbf{x}_i^{\top}\boldsymbol{\beta})\right)\right]
\]

MLE is found by maximizing \( \mathcal{L}(\boldsymbol{\beta}) \) numerically (no closed form).

<div class="definition">
<strong>Probit Model:</strong> \( G(z) = \Phi(z) \), the standard normal CDF. The probit model is:

\[
P(y = 1 \mid \mathbf{x}) = \Phi(\mathbf{x}^{\top}\boldsymbol{\beta})
\]

<strong>Logit Model:</strong> \( G(z) = \Lambda(z) = e^z/(1 + e^z) \), the logistic function:

\[
P(y = 1 \mid \mathbf{x}) = \frac{\exp(\mathbf{x}^{\top}\boldsymbol{\beta})}{1 + \exp(\mathbf{x}^{\top}\boldsymbol{\beta})}
\]
</div>

## 5.2 Interpreting Probit and Logit Coefficients

Unlike OLS, probit/logit coefficients do not directly measure marginal effects. The **marginal effect at the mean (MEM)** for a continuous regressor \( x_j \) is:

\[
\frac{\partial P(y=1 \mid \mathbf{x})}{\partial x_j} = g(\mathbf{x}^{\top}\boldsymbol{\beta})\,\beta_j
\]

where \( g = G' \) is the density of the link function (standard normal density for probit; \( \Lambda(1-\Lambda) \) for logit). This must be evaluated at specific values of \( \mathbf{x} \) (e.g., sample means). The **average marginal effect (AME)** averages across all observations:

\[
\text{AME}_j = \frac{1}{n}\sum_{i=1}^n g(\mathbf{x}_i^{\top}\hat{\boldsymbol{\beta}})\,\hat{\beta}_j
\]

The AME is generally preferred over the MEM as it better represents the population average.

For a **dummy variable** \( x_j \in \{0,1\} \), the discrete change in probability is:

\[
\Delta P = G(\hat{\boldsymbol{\beta}}_{-j}^{\top}\mathbf{x} + \hat{\beta}_j) - G(\hat{\boldsymbol{\beta}}_{-j}^{\top}\mathbf{x})
\]

## 5.3 Model Fit for Binary Models

Standard \( R^2 \) is not meaningful for binary models. Alternative measures:

- **McFadden's pseudo-\( R^2 \):** \( 1 - \mathcal{L}_{ur}/\mathcal{L}_0 \), where \( \mathcal{L}_0 \) is the log-likelihood of the intercept-only model.
- **Percent correctly predicted** (comparing \( \hat{P}(y=1) \) to a threshold of 0.5).
- **Log-likelihood ratio test** (LR test): \( LR = -2(\mathcal{L}_r - \mathcal{L}_{ur}) \xrightarrow{d} \chi^2(q) \) under \( H_0 \) of \( q \) restrictions.

## 5.4 Multinomial and Ordered Models

When \( y \) has more than two unordered categories (e.g., transportation mode: car/bus/train), the **multinomial logit** specifies:

\[
P(y = j \mid \mathbf{x}) = \frac{\exp(\mathbf{x}^{\top}\boldsymbol{\beta}_j)}{\sum_{m=0}^{J} \exp(\mathbf{x}^{\top}\boldsymbol{\beta}_m)}, \quad j = 0, 1, \ldots, J
\]

with \( \boldsymbol{\beta}_0 = \mathbf{0} \) (base category normalization).

When \( y \) is **ordered** (e.g., satisfaction scores 1–5), the **ordered probit/logit** is appropriate. It assumes a single latent variable \( y^* = \mathbf{x}^{\top}\boldsymbol{\beta} + u \) with cutpoints \( \mu_1 < \mu_2 < \cdots < \mu_{J-1} \) mapping \( y^* \) to the observed \( y \).

## 5.5 Count Data: Poisson Regression

For non-negative integer outcomes (number of patents, doctor visits, etc.), the **Poisson regression** model specifies:

\[
P(y = k \mid \mathbf{x}) = \frac{e^{-\lambda}\lambda^k}{k!}, \quad \lambda = E[y \mid \mathbf{x}] = \exp(\mathbf{x}^{\top}\boldsymbol{\beta})
\]

The log-link ensures \( \lambda > 0 \). The coefficient \( \beta_j \) is the **log incidence rate ratio**: a unit increase in \( x_j \) multiplies the expected count by \( e^{\beta_j} \). The log-likelihood is:

\[
\mathcal{L}(\boldsymbol{\beta}) = \sum_{i=1}^n \left[y_i \mathbf{x}_i^{\top}\boldsymbol{\beta} - \exp(\mathbf{x}_i^{\top}\boldsymbol{\beta}) - \ln(y_i!)\right]
\]

**Overdispersion** (\( \text{Var}(y) > E[y] \)) is common in count data and violates the Poisson assumption. The **negative binomial** model addresses this by adding a gamma-distributed individual heterogeneity term.

---

# Chapter 6: Sample Selection Models

## 6.1 The Selection Problem

A **sample selection problem** arises when the sample is not a random draw from the population of interest, but rather a draw from a selected subgroup. For example, wages are only observed for individuals who work; test scores are only observed for students who enroll.

<div class="definition">
<strong>Heckman (1979) Selection Model:</strong> Specifies two equations jointly:
<ul>
<li><strong>Outcome equation:</strong> \( y_i = \mathbf{x}_i^{\top}\boldsymbol{\beta} + u_i \), observed only when \( s_i = 1 \).</li>
<li><strong>Selection equation:</strong> \( s_i = \mathbf{1}(\mathbf{z}_i^{\top}\boldsymbol{\gamma} + v_i > 0) \), a probit determining sample inclusion.</li>
</ul>
Errors \( (u_i, v_i) \sim \text{bivariate normal}(0, 0, \sigma_u^2, 1, \rho) \).
</div>

The fundamental issue: \( E[u_i \mid s_i = 1, \mathbf{x}_i] = \rho\sigma_u \lambda(\mathbf{z}_i^{\top}\hat{\boldsymbol{\gamma}}) \neq 0 \) unless \( \rho = 0 \), where \( \lambda(c) = \phi(c)/\Phi(c) \) is the **inverse Mills ratio**.

## 6.2 Heckit Estimation

The two-step (Heckit) procedure:

1. **Step 1:** Estimate the selection probit using all observations. Compute \( \hat{\lambda}_i = \phi(\mathbf{z}_i^{\top}\hat{\boldsymbol{\gamma}})/\Phi(\mathbf{z}_i^{\top}\hat{\boldsymbol{\gamma}}) \).
2. **Step 2:** Add \( \hat{\lambda}_i \) as a regressor in the outcome equation and estimate by OLS on the selected sample.

The coefficient on \( \hat{\lambda}_i \) estimates \( \rho\sigma_u \). A significant coefficient indicates selection bias in the naive OLS. Standard errors from step 2 must be corrected (or bootstrapped) because \( \hat{\lambda}_i \) uses estimated parameters.

**Exclusion restriction for Heckit:** The model is technically identified by functional form, but it is much more credible when \( \mathbf{z}_i \) contains at least one variable affecting selection but not the outcome — analogous to an instrument in IV estimation.

---

# Chapter 7: Implementation in R

## 7.1 Time Series and Panel Data

```r
library(plm)
# Fixed effects
fe_model <- plm(log(wage) ~ exper + married, data = panel_data,
                index = c("id","year"), model = "within")
summary(fe_model)

# Clustered standard errors
library(lmtest)
coeftest(fe_model, vcov = vcovHC(fe_model, type = "HC1", cluster = "group"))

# Hausman test
re_model <- plm(log(wage) ~ exper + married, data = panel_data,
                index = c("id","year"), model = "random")
phtest(fe_model, re_model)
```

## 7.2 Instrumental Variables

```r
library(AER)
# 2SLS: endogenous = educ, instrument = nearc4 (proximity to college)
iv_model <- ivreg(log(wage) ~ educ + exper | nearc4 + exper,
                  data = card_data)
summary(iv_model, diagnostics = TRUE)
# diagnostics = TRUE reports Wu-Hausman test, weak instruments F, and Sargan J-test
```

## 7.3 Binary and Count Models

```r
# Probit
probit_model <- glm(inlf ~ nwifeinc + educ + exper + kidslt6,
                    family = binomial(link = "probit"), data = mroz)
# Average marginal effects
library(margins)
summary(margins(probit_model))

# Poisson regression
pois_model <- glm(patents ~ R_D + sales, family = poisson, data = rdchem)
# Incidence rate ratios
exp(coef(pois_model))
```
