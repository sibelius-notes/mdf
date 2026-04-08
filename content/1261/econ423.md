---
title: "ECON 423: Time Series Econometrics"
prof: "Dinghai Xu"
subjects: "ECON"
---

## Sources and References

**Primary textbooks** — Hamilton, J. D. (1994). *Time Series Analysis*. Princeton UP (TSA); Ruppert, D. (2011). *Statistics and Finance: An Introduction*. Springer (SF); Greene, W. H. (2018). *Econometric Analysis*, 8th ed. Pearson (EA).

**Supplementary texts** — Tsay, R. S. (2010). *Analysis of Financial Time Series*, 3rd ed. Wiley; Enders, W. (2015). *Applied Econometric Time Series*, 4th ed. Wiley; Lütkepohl, H. (2005). *New Introduction to Multiple Time Series Analysis*. Springer.

**Online resources** — MIT OCW 14.384 (Time Series Analysis, Anna Mikusheva); Rob Hyndman, *Forecasting: Principles and Practice*, 3rd ed. (OTexts, free online); FRED database for macroeconomic time series.

---

# Chapter 1: Probability and Statistics Foundations for Time Series

## 1.1 Stochastic Processes

A **stochastic process** is a collection of random variables \( \{Y_t : t \in \mathcal{T}\} \) indexed by time. For discrete-time series, \( \mathcal{T} = \{1, 2, \ldots, T\} \) or \( \mathcal{T} = \mathbb{Z} \). Each realization of the process is a **sample path** (e.g., a recorded time series of GDP or stock prices).

Key concepts from probability that carry over: expectation \( E[Y_t] = \mu_t \), variance \( \text{Var}(Y_t) = \sigma_t^2 \), and covariance between time periods \( \gamma(t, s) = \text{Cov}(Y_t, Y_s) \).

<div class="definition">
<strong>Strict Stationarity:</strong> A process \( \{Y_t\} \) is strictly stationary if the joint distribution of \( (Y_{t_1}, \ldots, Y_{t_k}) \) equals the joint distribution of \( (Y_{t_1+h}, \ldots, Y_{t_k+h}) \) for all \( k \), all \( (t_1, \ldots, t_k) \), and all shifts \( h \).

<strong>Weak (Covariance) Stationarity:</strong> \( \{Y_t\} \) is weakly stationary if:
<ol>
<li>\( E[Y_t] = \mu \) (constant mean, independent of <em>t</em>)</li>
<li>\( \text{Var}(Y_t) = \sigma^2 < \infty \) (constant variance)</li>
<li>\( \text{Cov}(Y_t, Y_{t-h}) = \gamma(h) \) depends only on the lag <em>h</em>, not on <em>t</em></li>
</ol>
</div>

## 1.2 Autocovariance and Autocorrelation Functions

The **autocovariance function (ACVF)** of a weakly stationary process:

\[ \gamma(h) = \text{Cov}(Y_t, Y_{t-h}) = E[(Y_t - \mu)(Y_{t-h} - \mu)] \]

The **autocorrelation function (ACF)** is:

\[ \rho(h) = \frac{\gamma(h)}{\gamma(0)} = \text{Corr}(Y_t, Y_{t-h}) \in [-1, 1] \]

Properties: \( \rho(0) = 1 \), \( \rho(h) = \rho(-h) \), and \( |\rho(h)| \leq 1 \). The sample ACF \( \hat{\rho}(h) \) is computed from the data and compared to the Bartlett \( \pm 1.96/\sqrt{T} \) confidence bands to identify significant autocorrelation.

The **partial autocorrelation function (PACF)** \( \alpha(h) \) measures the correlation between \( Y_t \) and \( Y_{t-h} \) after removing the linear dependence of \( Y_{t-1}, \ldots, Y_{t-h+1} \). The ACF and PACF together form the primary identification tool for ARMA models.

---

# Chapter 2: Financial Returns and Stylized Facts

## 2.1 Prices and Returns

For an asset with price \( P_t \):

- **Simple return:** \( R_t = (P_t - P_{t-1})/P_{t-1} \)
- **Log return (continuously compounded):** \( r_t = \ln P_t - \ln P_{t-1} = \ln(1 + R_t) \approx R_t \) for small returns

Log returns are preferred in time series analysis because they are additive over time: the \( k \)-period log return is \( r_t^{(k)} = \sum_{j=0}^{k-1} r_{t-j} \).

## 2.2 Stylized Facts of Financial Returns

Empirical regularities in financial time series motivate the models developed later:

1. **Low serial correlation in returns:** \( \rho(h) \approx 0 \) for \( h \geq 1 \) in log returns (efficient markets hypothesis).
2. **Volatility clustering:** Large changes tend to follow large changes. \( |r_t| \) or \( r_t^2 \) exhibit strong positive autocorrelation.
3. **Heavy tails:** The distribution of \( r_t \) has excess kurtosis relative to the normal — extreme events are more common than normality predicts.
4. **Leverage effect:** Negative shocks tend to increase volatility more than positive shocks of the same magnitude.
5. **Long memory in volatility:** The ACVF of \( r_t^2 \) decays slowly (hyperbolically) rather than exponentially.

These facts motivate: ARCH/GARCH for volatility clustering, Student-\( t \) or skewed distributions for heavy tails, EGARCH or GJR-GARCH for the leverage effect.

---

# Chapter 3: Linear Time Series Models

## 3.1 White Noise and Moving Average Processes

The simplest time series model is **white noise**: \( \{\varepsilon_t\} \sim WN(0, \sigma^2) \) with \( E[\varepsilon_t] = 0 \), \( E[\varepsilon_t^2] = \sigma^2 \), and \( E[\varepsilon_t\varepsilon_s] = 0 \) for \( t \neq s \). A stronger version, **i.i.d.** white noise, additionally requires independence.

A **Moving Average process of order q** — MA(\( q \)) — is a linear filter applied to white noise:

\[ Y_t = \mu + \varepsilon_t + \theta_1\varepsilon_{t-1} + \theta_2\varepsilon_{t-2} + \cdots + \theta_q\varepsilon_{t-q} \]

In lag operator notation, \( Y_t = \mu + \Theta(L)\varepsilon_t \) where \( \Theta(L) = 1 + \theta_1 L + \cdots + \theta_q L^q \) and \( L^k Y_t = Y_{t-k} \).

Properties of MA(\( q \)):
- Always weakly stationary (finite sum of WN)
- ACVF: \( \gamma(0) = \sigma^2(1 + \theta_1^2 + \cdots + \theta_q^2) \), \( \gamma(h) = 0 \) for \( |h| > q \)
- ACF cuts off after lag \( q \); PACF decays geometrically — this is the signature MA pattern

**Invertibility:** An MA(\( q \)) is invertible if the roots of \( \Theta(z) = 0 \) lie strictly outside the unit circle. Invertibility ensures a unique MA representation and allows expressing the process as an AR(\( \infty \)).

## 3.2 Autoregressive Processes

An **Autoregressive process of order p** — AR(\( p \)) — expresses the current value as a linear combination of past values plus white noise:

\[ Y_t = c + \phi_1 Y_{t-1} + \phi_2 Y_{t-2} + \cdots + \phi_p Y_{t-p} + \varepsilon_t \]

or compactly \( \Phi(L)Y_t = c + \varepsilon_t \) where \( \Phi(L) = 1 - \phi_1 L - \cdots - \phi_p L^p \).

<div class="theorem">
<strong>Stationarity Condition for AR(<em>p</em>):</strong> The AR(<em>p</em>) process is stationary if and only if all roots of the characteristic polynomial \( \Phi(z) = 1 - \phi_1 z - \cdots - \phi_p z^p = 0 \) lie strictly outside the unit circle (equivalently, all eigenvalues of the companion matrix have modulus less than 1).
</div>

Properties of AR(1), \( Y_t = \phi Y_{t-1} + \varepsilon_t \), \( |\phi| < 1 \):

\[ \mu = 0, \quad \gamma(0) = \frac{\sigma^2}{1-\phi^2}, \quad \rho(h) = \phi^{|h|} \]

The ACF of a stationary AR(\( p \)) decays geometrically (or sinusoidally for complex roots); the PACF cuts off after lag \( p \). This mirrors the MA pattern with ACF and PACF roles reversed.

## 3.3 ARMA Models

The **ARMA(\( p, q \))** model combines AR and MA components:

\[ \Phi(L)Y_t = c + \Theta(L)\varepsilon_t \]

\[ Y_t - \phi_1 Y_{t-1} - \cdots - \phi_p Y_{t-p} = c + \varepsilon_t + \theta_1\varepsilon_{t-1} + \cdots + \theta_q\varepsilon_{t-q} \]

Stationarity requires roots of \( \Phi(z) \) outside the unit circle; invertibility requires roots of \( \Theta(z) \) outside the unit circle. The **Wold decomposition theorem** states that every covariance-stationary process can be written as MA(\( \infty \)), justifying ARMA as a flexible approximation class.

**ACF/PACF identification table:**

| Model | ACF | PACF |
|-------|-----|------|
| AR(\( p \)) | Decays geometrically | Cuts off at lag \( p \) |
| MA(\( q \)) | Cuts off at lag \( q \) | Decays geometrically |
| ARMA(\( p,q \)) | Decays geometrically (after lag \( q-p \)) | Decays geometrically (after lag \( p-q \)) |

## 3.4 Estimation and Model Selection

ARMA parameters are most commonly estimated by **MLE**, assuming normal errors:

\[ \ell(\boldsymbol{\phi}, \boldsymbol{\theta}, \sigma^2) = -\frac{T}{2}\ln(2\pi\sigma^2) - \frac{1}{2\sigma^2}\sum_{t=1}^T (Y_t - \hat{Y}_t)^2 \]

where \( \hat{Y}_t = E[Y_t \mid Y_{t-1}, Y_{t-2}, \ldots] \) is the one-step-ahead forecast.

Model order is selected by information criteria. For ARMA(\( p, q \)) with \( k = p + q + 1 \) parameters:

\[ \text{AIC}(p,q) = -2\ell + 2k, \qquad \text{BIC}(p,q) = -2\ell + k\ln T \]

Choose \( (p,q) \) minimizing AIC or BIC. BIC is consistent for the true order; AIC tends to overfit in large samples.

---

# Chapter 4: Forecasting with ARMA Models

## 4.1 Optimal Forecasts

The **minimum mean squared error (MMSE) forecast** of \( Y_{T+h} \) given information \( \mathcal{F}_T = \{Y_T, Y_{T-1}, \ldots\} \) is the conditional expectation:

\[ \hat{Y}_{T+h|T} = E[Y_{T+h} \mid \mathcal{F}_T] \]

For AR(1): \( \hat{Y}_{T+h|T} = \phi^h Y_T \). The forecast converges to the mean as \( h \to \infty \) (since \( |\phi| < 1 \)).

The \( h \)-step-ahead **forecast error** is \( e_{T+h|T} = Y_{T+h} - \hat{Y}_{T+h|T} \), with variance:

\[ \text{Var}(e_{T+h|T}) = \sigma^2\sum_{j=0}^{h-1}\psi_j^2 \]

where \( \psi_j \) are the MA(\( \infty \)) coefficients. A \( 95\% \) forecast interval is:

\[ \hat{Y}_{T+h|T} \pm 1.96\,\hat{\sigma}\sqrt{\sum_{j=0}^{h-1}\hat{\psi}_j^2} \]

## 4.2 Forecast Evaluation

**Out-of-sample forecast evaluation** compares competing models on a hold-out sample:

- **RMSE:** \( \sqrt{T^{-1}\sum_t \hat{e}_{t|t-1}^2} \)
- **MAE:** \( T^{-1}\sum_t |\hat{e}_{t|t-1}| \)
- **Diebold-Mariano test:** Tests \( H_0: E[d_t] = 0 \) where \( d_t = L(\hat{e}_{1t}) - L(\hat{e}_{2t}) \) is the loss differential between two models. The DM statistic is asymptotically standard normal under \( H_0 \).

---

# Chapter 5: Time-Varying Volatility — ARCH and GARCH Models

## 5.1 The ARCH Model

Engle (1982) introduced the **Autoregressive Conditional Heteroskedasticity (ARCH)** model to capture the stylized fact that large return innovations cluster in time. Define the conditional variance \( h_t = \text{Var}(\varepsilon_t \mid \mathcal{F}_{t-1}) \). The ARCH(\( q \)) model:

\[ \varepsilon_t = \sqrt{h_t}\, z_t, \quad z_t \sim \text{i.i.d.}(0,1) \]

\[ h_t = \omega + \alpha_1\varepsilon_{t-1}^2 + \alpha_2\varepsilon_{t-2}^2 + \cdots + \alpha_q\varepsilon_{t-q}^2 \]

Stationarity requires \( \omega > 0 \), \( \alpha_j \geq 0 \), and \( \sum_{j=1}^q \alpha_j < 1 \). The unconditional variance is \( \sigma^2 = \omega / (1 - \sum_j\alpha_j) \). ARCH generates heavy-tailed unconditional distributions even when \( z_t \sim N(0,1) \).

## 5.2 The GARCH Model

Bollerslev (1986) extended ARCH with lagged conditional variance terms — the **Generalized ARCH (GARCH(\( p,q \)))** model:

\[ h_t = \omega + \sum_{i=1}^q \alpha_i\varepsilon_{t-i}^2 + \sum_{j=1}^p \beta_j h_{t-j} \]

The GARCH(1,1) is by far the most widely used volatility model:

\[ h_t = \omega + \alpha\varepsilon_{t-1}^2 + \beta h_{t-1} \]

<div class="theorem">
<strong>GARCH(1,1) Properties:</strong>
<ul>
<li><strong>Variance stationarity condition:</strong> \( \alpha + \beta < 1 \)</li>
<li><strong>Unconditional variance:</strong> \( \sigma^2 = \omega / (1 - \alpha - \beta) \)</li>
<li><strong>Kurtosis:</strong> Excess kurtosis \( 6\alpha^2 / (1 - 2\alpha^2 - (\alpha+\beta)^2) > 0 \) when \( \alpha > 0 \)</li>
<li><strong>Volatility persistence:</strong> \( \alpha + \beta \) measures how quickly shocks to volatility decay</li>
</ul>
</div>

When \( \alpha + \beta = 1 \), the IGARCH (Integrated GARCH) model obtains: shocks have a permanent effect on volatility. This is useful for long financial series but implies infinite unconditional variance.

## 5.3 GARCH Extensions

**EGARCH (Exponential GARCH — Nelson 1991):** Models the log of conditional variance, naturally ensuring \( h_t > 0 \) without sign constraints. Captures the **leverage effect** (asymmetric response to positive vs. negative shocks):

\[ \ln h_t = \omega + \beta\ln h_{t-1} + \gamma\frac{\varepsilon_{t-1}}{\sqrt{h_{t-1}}} + \alpha\!\left(\frac{|\varepsilon_{t-1}|}{\sqrt{h_{t-1}}} - \sqrt{2/\pi}\right) \]

A negative \( \gamma < 0 \) captures the leverage effect: negative returns raise volatility more than positive returns.

**GJR-GARCH (Glosten-Jagannathan-Runkle 1993):**

\[ h_t = \omega + \alpha\varepsilon_{t-1}^2 + \gamma\varepsilon_{t-1}^2\mathbf{1}(\varepsilon_{t-1} < 0) + \beta h_{t-1} \]

Stationarity requires \( \alpha + \gamma/2 + \beta < 1 \). If \( \gamma > 0 \), negative shocks raise volatility disproportionately.

## 5.4 GARCH Estimation

GARCH parameters are estimated by **Quasi-MLE (QMLE)** assuming conditional normality:

\[ \ell(\boldsymbol{\theta}) = \sum_{t=1}^T \left[-\frac{1}{2}\ln h_t - \frac{\varepsilon_t^2}{2h_t}\right] \]

QMLE is consistent and asymptotically normal even if the true conditional distribution is non-normal (provided it has finite fourth moments), with a sandwich standard error correction. For heavy-tailed series, QMLE with Student-\( t \) innovations (with estimated degrees of freedom \( \nu \)) is more efficient.

---

# Chapter 6: Non-Stationary Time Series

## 6.1 Random Walks and Unit Roots

The **random walk** is the simplest non-stationary process:

\[ Y_t = Y_{t-1} + \varepsilon_t, \quad \varepsilon_t \sim WN(0, \sigma^2) \]

This is an AR(1) with \( \phi = 1 \) — a **unit root**. Key properties: \( E[Y_t] = Y_0 \) (no mean reversion), \( \text{Var}(Y_t) = t\sigma^2 \) (growing over time), autocorrelations \( \rho(h) \approx 1 \) for small \( h/t \).

A **random walk with drift** is \( Y_t = \mu + Y_{t-1} + \varepsilon_t \), producing a stochastic trend around a deterministic trend.

## 6.2 The ARIMA Model

An **ARIMA(\( p, d, q \))** model applies differencing to achieve stationarity:

\[ \Phi(L)(1-L)^d Y_t = c + \Theta(L)\varepsilon_t \]

The **first difference** \( \Delta Y_t = Y_t - Y_{t-1} = (1-L)Y_t \) removes a stochastic trend. Most macroeconomic and financial series are I(1) — integrated of order 1 — requiring one difference to achieve stationarity. ARIMA(0,1,0) is the random walk; ARIMA(1,1,0) is a differenced AR(1).

## 6.3 Unit Root Testing

The **Dickey-Fuller (DF) test** tests \( H_0: \phi = 1 \) (unit root, non-stationarity) against \( H_1: |\phi| < 1 \) (stationarity). Rewrite the AR(1):

\[ \Delta Y_t = \delta Y_{t-1} + \varepsilon_t, \quad \delta = \phi - 1 \]

\( H_0: \delta = 0 \) vs. \( H_1: \delta < 0 \). The OLS t-statistic for \( \delta \) does **not** follow a standard t-distribution under \( H_0 \) — it converges to a non-standard **Dickey-Fuller distribution** derived from functionals of Brownian motion. Critical values are more negative than standard t critical values.

The **Augmented Dickey-Fuller (ADF) test** adds lagged differences to control for serial correlation:

\[ \Delta Y_t = \alpha + \beta t + \delta Y_{t-1} + \sum_{j=1}^{p-1}\gamma_j \Delta Y_{t-j} + \varepsilon_t \]

The lag length \( p-1 \) is chosen by AIC/BIC. Three variants: no constant, constant only, constant and trend — critical values differ across variants.

The **Phillips-Perron (PP) test** uses a non-parametric correction to the DF statistic to account for serial correlation, avoiding the need to specify lag length.

The **KPSS test** reverses the null: \( H_0 \) is stationarity, \( H_1 \) is a unit root. Using DF/ADF and KPSS jointly provides stronger evidence.

---

# Chapter 7: Multivariate Time Series — VAR Models

## 7.1 Vector Autoregressions

A **Vector Autoregression (VAR(\( p \)))** extends the univariate AR to a system of \( K \) variables:

\[ \mathbf{y}_t = \mathbf{c} + \mathbf{A}_1\mathbf{y}_{t-1} + \mathbf{A}_2\mathbf{y}_{t-2} + \cdots + \mathbf{A}_p\mathbf{y}_{t-p} + \boldsymbol{\varepsilon}_t \]

where \( \mathbf{y}_t \) is a \( K \times 1 \) vector, \( \mathbf{A}_j \) are \( K \times K \) coefficient matrices, and \( \boldsymbol{\varepsilon}_t \sim WN(\mathbf{0}, \boldsymbol{\Sigma}) \) with \( \boldsymbol{\Sigma} \) the \( K \times K \) error covariance matrix.

**Stationarity condition:** All roots of \( \det(\mathbf{I}_K - \mathbf{A}_1z - \cdots - \mathbf{A}_pz^p) = 0 \) lie outside the unit circle.

Each equation of the VAR can be estimated by OLS equation-by-equation (equivalent to SUR when the same regressors appear in each equation). Lag length selection uses multivariate AIC/BIC.

## 7.2 Granger Causality

<div class="definition">
<strong>Granger Causality:</strong> Variable \( X_t \) <em>Granger-causes</em> \( Y_t \) if past values of \( X_t \) contain information useful for forecasting \( Y_t \) beyond what is already in past values of \( Y_t \) itself.
</div>

Test by regressing \( Y_t \) on lags of \( Y_t \) and lags of \( X_t \), and testing the joint significance of the \( X_t \) lags via an F-test. Granger causality is a statistical concept — it captures predictive content, not structural causality.

## 7.3 Impulse Response Functions

An **impulse response function (IRF)** traces the dynamic response of each variable in a VAR to a one-unit shock in one variable's error. Write the VAR in MA(\( \infty \)) form:

\[ \mathbf{y}_t = \boldsymbol{\mu} + \sum_{j=0}^{\infty}\boldsymbol{\Psi}_j\boldsymbol{\varepsilon}_{t-j} \]

The matrix \( \boldsymbol{\Psi}_j \) gives the impulse response at horizon \( j \): the \( (i,k) \) element is the response of variable \( i \) at time \( t+j \) to a shock in variable \( k \) at time \( t \).

**Identification:** The reduced-form VAR errors \( \boldsymbol{\varepsilon}_t \) are correlated. **Structural identification** is needed to recover orthogonal structural shocks. The standard **Cholesky decomposition** of \( \hat{\boldsymbol{\Sigma}} = \mathbf{P}\mathbf{P}^{\top} \) imposes a recursive causal ordering — the first variable does not respond contemporaneously to any other variable's shock.

**Forecast Error Variance Decomposition (FEVD):** Decomposes the forecast variance of each variable at each horizon into contributions from each structural shock. This quantifies the relative importance of different shocks.

---

# Chapter 8: Cointegration and Error Correction Models

## 8.1 Cointegration

Two I(1) series \( X_t \) and \( Y_t \) are **cointegrated** (CI(1,1)) if there exists a vector \( \boldsymbol{\beta} = (1, -\beta) \) such that \( Y_t - \beta X_t \) is I(0) (stationary). The linear combination \( Y_t - \beta X_t \) is the **cointegrating relationship** or **long-run equilibrium**.

<div class="example">
<strong>Purchasing Power Parity (PPP):</strong> The PPP hypothesis implies that the nominal exchange rate and relative price levels are cointegrated with cointegrating vector \( (1, -1, 1) \). Deviations from PPP are stationary (mean-revert).
</div>

## 8.2 The Engle-Granger Two-Step Procedure

1. **Step 1:** Regress \( Y_t \) on \( X_t \) (the **cointegrating regression**) and test whether the residuals \( \hat{e}_t = Y_t - \hat{\beta}X_t \) are stationary (using ADF on \( \hat{e}_t \) with Engle-Granger critical values, which are more negative than standard ADF values).
2. **Step 2:** If cointegration is not rejected, estimate the **Error Correction Model (ECM)**:

\[ \Delta Y_t = \alpha\hat{e}_{t-1} + \gamma_1\Delta Y_{t-1} + \cdots + \gamma_q\Delta X_{t-1} + \cdots + \nu_t \]

The error-correction term \( \hat{e}_{t-1} \) captures the speed of adjustment back to the long-run equilibrium. The coefficient \( \alpha < 0 \) for stability — when \( Y \) is above its long-run value, the EC term pulls it back down.

## 8.3 The Johansen Procedure

For systems with more than two I(1) variables, the **Johansen (1988) cointegration test** is preferred. The VECM (Vector Error Correction Model) for a \( K \)-variable system with \( r \) cointegrating vectors:

\[ \Delta\mathbf{y}_t = \boldsymbol{\Pi}\mathbf{y}_{t-1} + \sum_{j=1}^{p-1}\boldsymbol{\Gamma}_j\Delta\mathbf{y}_{t-j} + \boldsymbol{\varepsilon}_t \]

where \( \boldsymbol{\Pi} = \boldsymbol{\alpha}\boldsymbol{\beta}^{\top} \) has rank \( r \) (the cointegrating rank), \( \boldsymbol{\beta} \) contains the \( r \) cointegrating vectors, and \( \boldsymbol{\alpha} \) contains the adjustment coefficients.

The **trace test** and **maximum eigenvalue test** test \( H_0: \text{rank}(\boldsymbol{\Pi}) = r_0 \) sequentially (starting from \( r_0 = 0 \)) using critical values from Johansen's asymptotic tables.

---

# Chapter 9: Risk Measures and Financial Applications

## 9.1 Value-at-Risk

**Value-at-Risk (VaR)** at confidence level \( (1-\alpha) \) and horizon \( h \) is the quantile of the loss distribution:

\[ \text{VaR}_\alpha^h = -Q_\alpha(R_{T+h}) = \inf\{v : P(R_{T+h} < -v) \leq \alpha\} \]

For a GARCH(1,1) model, the one-step VaR is:

\[ \text{VaR}_\alpha^1 = -\hat{\mu}_{T+1} + \sqrt{\hat{h}_{T+1}} \cdot z_\alpha \]

where \( z_\alpha \) is the \( \alpha \)-quantile of the standardized innovation distribution.

**Conditional VaR (CVaR) / Expected Shortfall (ES):** The expected loss given that the loss exceeds VaR:

\[ ES_\alpha = E[-R_{T+1} \mid -R_{T+1} \geq \text{VaR}_\alpha] \]

CVaR is a coherent risk measure (satisfies sub-additivity); VaR is not.

## 9.2 Portfolio Theory and Efficient Frontiers

For a portfolio with weight vector \( \mathbf{w} \) over \( K \) assets with expected returns \( \boldsymbol{\mu} \) and covariance matrix \( \boldsymbol{\Sigma} \):

\[ E[R_p] = \mathbf{w}^{\top}\boldsymbol{\mu}, \qquad \text{Var}(R_p) = \mathbf{w}^{\top}\boldsymbol{\Sigma}\mathbf{w} \]

The **minimum variance frontier** traces out the set of portfolios minimizing variance for each level of expected return. The **efficient frontier** is the upper portion. A time-varying \( \boldsymbol{\Sigma}_t \) from a multivariate GARCH model (DCC-GARCH) allows dynamic portfolio optimization.

---

# Chapter 10: Implementation

## 10.1 Time Series in R

```r
library(forecast)
library(tseries)

# Fit ARIMA model (automatic order selection)
y <- ts(data = returns, frequency = 12)
auto.arima(y, ic = "bic")

# ADF test
adf.test(y, k = 4)  # k = number of lagged differences

# ACF and PACF plots
Acf(y, lag.max = 24)
Pacf(y, lag.max = 24)
```

## 10.2 GARCH Estimation

```r
library(rugarch)
spec <- ugarchspec(
  variance.model = list(model = "sGARCH", garchOrder = c(1,1)),
  mean.model = list(armaOrder = c(0,0), include.mean = TRUE),
  distribution.model = "std"   # Student-t innovations
)
fit <- ugarchfit(spec, data = log_returns)
show(fit)
plot(fit, which = 11)  # Conditional SD plot
```

## 10.3 VAR and Cointegration in R

```r
library(vars)
# VAR with automatic lag selection
var_fit <- VAR(data, p = 2, type = "const")
causality(var_fit, cause = "gdp")  # Granger causality test
irf_out <- irf(var_fit, impulse = "gdp", response = "inflation", n.ahead = 20)
plot(irf_out)

# Johansen cointegration test
library(urca)
jo_test <- ca.jo(data, type = "trace", ecdet = "const", K = 2)
summary(jo_test)
```
