---
title: "STAT 443: Forecasting"
subjects: "STAT"
prof: "Gregory Rice"
---

## Sources and References

**Primary notes** — Cameron Roopnarine (Hextical), STAT 443, https://hextical.github.io/university-notes/year-3/semester-2/STAT%20443/stat443.pdf
**Supplementary texts** — Box, Jenkins, Reinsel & Ljung (2015) *Time Series Analysis: Forecasting and Control* 5th ed; Hyndman & Athanasopoulos (2021) *Forecasting: Principles and Practice* 3rd ed (https://otexts.com/fpp3); Abraham & Ledolter *Statistical Methods for Forecasting*; Brockwell & Davis *Time Series: Theory and Methods*; Shumway & Stoffer *Time Series Analysis and Its Applications*; Francq & Zakoïan *GARCH Models*
**Online resources** — Hextical GitHub: https://github.com/Hextical/university-notes/tree/master; MIT OCW 18.S096 Topics in Mathematics with Applications in Finance; Princeton ORF 542 Time Series Analysis

# Chapter 1: Introduction to Time Series

## What is a Time Series?

In classical statistics we typically assume we observe \( X_1, \ldots, X_n \in \mathbb{R}^p \) as a simple random sample: observations are independent and identically distributed, each drawn from a common distribution \( F_\theta \). A time series breaks both of these assumptions simultaneously.

<div class="definition">
<strong>Time series (observed)</strong>: We say \( X_1, \ldots, X_T \) is an <em>observed time series</em> of length \( T \) if \( X_t \) denotes an observation obtained at time \( t \). The defining feature is that the observations are ordered in time.
</div>

<div class="definition">
<strong>Time series (stochastic process)</strong>: We say \( \{X_t\}_{t \in \mathbb{Z}} \) is a time series if it is a stochastic process indexed by \( \mathbb{Z} \); that is, there is a common probability space \( (\Omega, \mathcal{F}, \mathbb{P}) \) such that \( X_t \colon \Omega \to \mathbb{R} \) is a random variable for all \( t \). The observed stretch \( X_1, \ldots, X_T \) is one realization (sample path) of length \( T \) from this process.
</div>

A time series can be real-valued (scalar) when \( X_t \in \mathbb{R} \), or multivariate (vector-valued) when \( X_t \in \mathbb{R}^p \). Classic examples include quarterly corporate earnings (the Johnson and Johnson series shows steadily increasing earnings with growing variance over time) and global mean temperature deviations (a trending series with substantial serial correlation).

The two hallmark features that distinguish time series data from i.i.d. data are:

1. **Heterogeneity**: The mean \( \mathbb{E}[X_t] \) and/or variance \( \mathrm{V}(X_t) \) change over time, ruling out a common distribution.
2. **Serial dependence**: Observations that are temporally close depend on each other, ruling out independence.

## Basic Principles of Forecasting

Given an observed time series \( X_1, \ldots, X_T \), the central task is to produce a "best guess" for a future value \( X_{T+h} \). We write

\[
\hat{X}_{T+h} = \hat{X}_{T+h \mid T} = f_h(X_T, \ldots, X_1).
\]

<div class="definition">
<strong>Forecast, Horizon</strong>: For \( h \geq 1 \), the quantity \( \hat{X}_{T+h} = f_h(X_T, \ldots, X_1) \) is called a <em>forecast</em> of \( X_{T+h} \) at <em>horizon</em> \( h \).
</div>

Forecasting has two complementary goals. The first is to choose \( f_h \) optimally with respect to some loss function \( L(\cdot, \cdot) \). The most common choice is the **mean-squared error (MSE)**:

\[
L(X, Y) = \mathbb{E}[(X - Y)^2].
\]

The second goal is to **quantify uncertainty** in the forecast. A point forecast without an accompanying measure of accuracy is, at best, hard to interpret and at worst meaningless. The ideal is the full predictive distribution \( X_{T+h} \mid X_T, \ldots, X_1 \). A practical substitute is a **prediction interval**: for \( \alpha \in (0, 1) \), find an interval \( I_\alpha \) such that

\[
\mathbb{P}(X_{T+h} \in I_\alpha \mid X_T, \ldots, X_1) = \alpha.
\]

A typical 95% interval takes the form \( \hat{X}_{T+h} \pm \hat{\sigma}_h \) where \( \hat{\sigma}_h \) estimates the forecast standard error.

## Stationarity

Without some form of stability in the data-generating process, no amount of data would allow us to forecast reliably. The key concept that imposes this stability is stationarity.

### Mean and Autocovariance Functions

<div class="definition">
<strong>Mean function</strong>: For a time series with \( \mathbb{E}[X_t^2] < \infty \) for all \( t \), the <em>mean function</em> is \( \mu_t = \mathbb{E}[X_t] \).
</div>

<div class="definition">
<strong>Autocovariance function (ACVF)</strong>: The <em>autocovariance function</em> is \( \gamma(t, s) = \mathbb{E}[(X_t - \mu_t)(X_s - \mu_s)] = \mathrm{Cov}(X_t, X_s) \).
</div>

### Strict and Weak Stationarity

<div class="definition">
<strong>Strictly stationary</strong>: We say \( \{X_t\}_{t \in \mathbb{Z}} \) is <em>strictly stationary</em> (strongly stationary) if for each \( k \geq 1 \), \( i_1, \ldots, i_k, h \in \mathbb{Z} \),
\[
(X_{i_1}, \ldots, X_{i_k}) \overset{d}{=} (X_{i_1+h}, \ldots, X_{i_k+h}).
\]
That is, the joint distribution is invariant under time shifts. In particular, all marginal distributions are identical: if \( F_t \) is the CDF of \( X_t \), then \( F_t = F \) for all \( t \).
</div>

<div class="definition">
<strong>Weakly stationary (covariance stationary)</strong>: We say \( \{X_t\}_{t \in \mathbb{Z}} \) is <em>weakly stationary</em> if (i) \( \mathbb{E}[X_t] = \mu \) does not depend on \( t \), and (ii) \( \gamma(t, s) = f(|t - s|) \) depends only on the lag \( |t - s| \). In this case we write \( \gamma(h) = \mathrm{Cov}(X_t, X_{t+h}) \) and call \( h \) the <em>lag parameter</em>.
</div>

Because \( \gamma(h) = \mathrm{Cov}(X_t, X_{t+h}) = \mathrm{Cov}(X_{t-h}, X_t) = \gamma(-h) \), the ACVF is symmetric. We normally record it for \( h \geq 0 \) only.

The relationship between strict and weak stationarity is nuanced. Strict stationarity does **not** imply weak stationarity if the second moment is infinite (e.g., i.i.d. Cauchy random variables are strictly stationary but have no mean). Conversely, weak stationarity does not imply strict stationarity in general — but it does for Gaussian processes.

<div class="theorem">
<strong>Theorem</strong>: If \( \{X_t\} \) is strictly stationary and \( \mathbb{E}[X_0^2] < \infty \), then \( \{X_t\} \) is weakly stationary.
</div>

<div class="theorem">
<strong>Theorem</strong>: If \( \{X_t\} \) is weakly stationary and a Gaussian process, then \( \{X_t\} \) is strictly stationary.
</div>

The second theorem reflects the fact that a Gaussian process is completely characterized by its mean and covariance functions. When those are time-shift invariant, so is the entire joint distribution.

## White Noise

The simplest and most fundamental stationary process is white noise, which serves as the building block for all ARMA models.

<div class="definition">
<strong>Strong white noise</strong>: \( \{W_t\}_{t \in \mathbb{Z}} \) is <em>strong white noise</em> if \( \mathbb{E}[W_t] = 0 \) and the \( W_t \) are i.i.d.
</div>

<div class="definition">
<strong>Weak white noise</strong>: \( \{W_t\}_{t \in \mathbb{Z}} \) is <em>weak white noise</em> with variance \( \sigma^2 \) if \( \mathbb{E}[W_t] = 0 \) and \( \gamma(t, s) = \sigma^2 \cdot \mathbf{1}_{t=s} \); that is, uncorrelated but not necessarily independent.
</div>

<div class="definition">
<strong>Gaussian white noise</strong>: \( \{W_t\}_{t \in \mathbb{Z}} \) is <em>Gaussian white noise</em> if \( W_t \overset{\text{iid}}{\sim} \mathcal{N}(0, \sigma^2) \).
</div>

The name "white" comes from spectral analysis: a white noise series has equal spectral density at all frequencies, just as white light contains all frequencies with equal intensity.

<div class="definition">
<strong>Bernoulli shift</strong>: If \( \{\varepsilon_t\}_{t \in \mathbb{Z}} \) is a strong white noise and \( X_t = g(\varepsilon_t, \varepsilon_{t-1}, \ldots) \) for some measurable function \( g \colon \mathbb{R}^\infty \to \mathbb{R} \), we say \( \{X_t\} \) is a <em>Bernoulli shift</em>. Every Bernoulli shift is strictly stationary.
</div>

## Signal and Noise Models

Most observed time series are evidently non-stationary. A practical strategy is the **signal and noise decomposition**:

\[
X_t = s_t + \varepsilon_t
\]

where \( s_t \) is a deterministic signal (trend) and \( \varepsilon_t \) is stationary noise with \( \mathbb{E}[\varepsilon_t] = 0 \). For example, the global temperature series has an approximately linear trend that can be estimated by OLS: choose \( \hat{\beta}_0, \hat{\beta}_1 \) to minimize \( \sum_{t=1}^T [X_t - (\beta_0 + \beta_1 t)]^2 \). The residuals \( X_t - \hat{s}_t \) should then be approximately stationary.

## Time Series Differencing

An alternative to explicit detrending is differencing. Define the **first-difference operator**:

\[
\nabla X_t = X_t - X_{t-1} = (1 - B) X_t
\]

where \( B \) is the **backshift operator** satisfying \( B^j X_t = X_{t-j} \). Higher order differences are defined recursively: \( \nabla^d X_t = \nabla^{d-1}(\nabla X_t) \).

For a **random walk with drift** \( X_t = \delta + X_{t-1} + \varepsilon_t \), we have \( \nabla X_t = \delta + \varepsilon_t \), which is white noise shifted by the drift \( \delta \). Thus differencing reduces a random walk to stationarity.

Compared to detrending, differencing has the advantage of requiring no parameter estimation, and higher-order differences can handle very "trendy" series. The disadvantages are that it may remove genuine trend information useful for long-range forecasts, and it can introduce more complicated autocorrelation structure (for instance, differencing an i.i.d. series introduces lag-1 correlation).

# Chapter 2: Autocorrelation and the ACF/PACF

## Linear Processes and the ACF

After arriving at an approximately stationary series (via detrending or differencing), the next task is to characterize the serial dependence structure. The primary tool is the autocorrelation function.

<div class="definition">
<strong>Linear process</strong>: A time series \( \{X_t\} \) is a <em>linear process</em> if there exists a strong white noise \( \{W_t\} \) and coefficients \( \{\psi_\ell\}_{\ell \in \mathbb{Z}} \) with \( \sum_{\ell=-\infty}^\infty |\psi_\ell| < \infty \) such that
\[
X_t = \sum_{\ell=-\infty}^\infty \psi_\ell W_{t-\ell}.
\]
If \( \psi_\ell = 0 \) for all \( \ell < 0 \), the process is called a <em>causal linear process</em>.
</div>

Every causal linear process is a Bernoulli shift and hence strictly stationary. The condition \( \sum |\psi_\ell| < \infty \) ensures the infinite sum converges in \( L^2 \).

<div class="definition">
<strong>Autocorrelation function (ACF)</strong>: For a weakly stationary process, the <em>autocorrelation function</em> is
\[
\rho_X(h) = \frac{\gamma(h)}{\gamma(0)}, \quad h \geq 0.
\]
By the Cauchy-Schwarz inequality, \( |\rho(h)| \leq 1 \) for all \( h \), and \( \rho(0) = 1 \) always.
</div>

## Sample ACF and Asymptotic Theory

Given an observed stretch \( X_1, \ldots, X_T \), we estimate the ACVF by

\[
\hat{\gamma}(h) = \frac{1}{T} \sum_{t=1}^{T-h} (X_t - \bar{X})(X_{t+h} - \bar{X}), \quad \hat{\rho}(h) = \frac{\hat{\gamma}(h)}{\hat{\gamma}(0)}
\]

where \( \bar{X} = T^{-1} \sum_{t=1}^T X_t \). The factor \( 1/T \) (rather than \( 1/(T-h) \)) is used to ensure positive semidefiniteness of the resulting matrix.

A key result governs the sampling distribution of \( \hat{\rho}(h) \) when the data arise from a strong white noise:

<div class="theorem">
<strong>Theorem (Bartlett's approximation)</strong>: If \( \{X_t\} \) is a strong white noise with \( \mathbb{E}[X_t^4] < \infty \), then for each fixed \( h \geq 1 \),
\[
\sqrt{T} \hat{\rho}(h) \xrightarrow{d} \mathcal{N}(0, 1).
\]
Moreover, \( \sqrt{T}(\hat{\rho}(1), \ldots, \hat{\rho}(H)) \xrightarrow{d} \mathrm{MVN}(0, I_{H \times H}) \).
</div>

This result implies the "blue lines" \( \pm 1.96/\sqrt{T} \) displayed on ACF plots: autocorrelations falling within these bands are consistent with white noise at the 5% level. The derivation relies on CLT theory for weakly dependent sequences; under strong white noise, the products \( X_t X_{t+h} \) are uncorrelated for different lags, yielding an asymptotically diagonal covariance.

### Interpreting the ACF for Non-Stationary Series

A critical practical point: if the series has a trend that has not been removed, \( \hat{\rho}(h) \to 1 \) as \( T \to \infty \) for every fixed lag \( h \). Specifically, for \( X_t = t + W_t \), one can show that \( \hat{\rho}(h) \xrightarrow{p} C \) for some positive constant \( C < 1 \) regardless of \( h \). Slow, monotone decay of the sample ACF — remaining large and positive at many lags — is the hallmark of non-stationarity.

## Ljung-Box Q Test

The Ljung-Box test (also called Box-Pierce-Ljung) provides a cumulative test for white noise. Given model residuals \( \hat{W}_t \) with sample ACF \( \hat{\rho}_W(h) \), define

\[
Q(T, H) = T(T+2) \sum_{h=1}^H \frac{\hat{\rho}_W^2(h)}{T - h}.
\]

<div class="theorem">
<strong>Ljung-Box theorem</strong>: If the data are generated by an ARMA\((p, q)\) model and \( \hat{W}_t \) are the standardized residuals, then
\[
Q(T, H) \xrightarrow{d} \chi^2(H - p - q).
\]
The \( p \)-value is \( \mathbb{P}(\chi^2(H - p - q) > Q(T, H)) \). Small \( p \)-values indicate the model is under-specified.
</div>

## Convergence Theory for Time Series

### Modes of Convergence

<div class="definition">
<strong>Bounded in probability</strong>: We write \( X_n = \mathcal{O}_p(Y_n) \) if for all \( \varepsilon > 0 \) there exist \( M, N \) such that \( \mathbb{P}(|X_n/Y_n| > M) \leq \varepsilon \) for all \( n \geq N \).
</div>

<div class="definition">
<strong>Converges in probability</strong>: We write \( X_n = o_p(1) \) if \( X_n \xrightarrow{p} 0 \); i.e., \( \mathbb{P}(|X_n| > \varepsilon) \to 0 \) for all \( \varepsilon > 0 \).
</div>

For a strong white noise \( \{X_t\}_{t \in \mathbb{Z}} \) with \( \mathbb{E}[X_0^2] < \infty \), the sample mean satisfies \( \bar{X}_T = \mathcal{O}_p(1/\sqrt{T}) \) and \( \sqrt{T}\bar{X}_T \xrightarrow{d} \mathcal{N}(0, \sigma^2) \) by the CLT. Markov's inequality provides a direct route: \( \mathbb{P}(|\bar{X}_T| > \varepsilon) \leq \mathrm{V}(\bar{X}_T)/\varepsilon^2 = \sigma^2/(T\varepsilon^2) \to 0 \).

### CLT for Dependent Sequences

The central technical challenge of time series inference is that the CLT for i.i.d. sequences does not directly apply. Two powerful extensions cover the ARMA setting:

<div class="theorem">
<strong>\( m \)-dependent CLT</strong>: Let \( \{X_t\} \) be strictly stationary and \( m \)-dependent (meaning observations separated by more than \( m \) time steps are independent) with \( \mathbb{E}[X_t] = 0 \) and \( \mathbb{E}[X_t^2] < \infty \). Then
\[
\frac{1}{\sqrt{T}} \sum_{t=1}^T X_t \xrightarrow{d} \mathcal{N}\!\left(0, \sum_{h=-m}^m \gamma(h)\right) = \mathcal{N}(0, \gamma(0) + 2\sum_{h=1}^m \gamma(h)).
\]
</div>

<div class="theorem">
<strong>Linear process CLT</strong>: Let \( X_t = \sum_{\ell=0}^\infty \psi_\ell W_{t-\ell} \) be a causal linear process with \( \sum_{\ell=0}^\infty |\psi_\ell| < \infty \) and \( \{W_t\} \) a strong white noise in \( L^2 \). Then
\[
\frac{1}{\sqrt{T}} \sum_{t=1}^T X_t \xrightarrow{d} \mathcal{N}\!\left(0, \sum_{h=-\infty}^\infty \gamma(h)\right).
\]
</div>

The proof of the linear process CLT uses the **Bernstein blocking argument** (for the \( m \)-dependent case) combined with the **Basic Approximation Theorem**: approximate the infinite linear process by its \( m \)-dependent truncation, show the approximation error vanishes in \( L^2 \), apply the \( m \)-dependent CLT, and pass to the limit.

# Chapter 3: ARMA Models

## Moving Average Processes

The observation that \( \gamma(h) \) is non-zero only for lags where "lagged terms in the linear process are non-zero" motivates parsimonious models.

<div class="definition">
<strong>MA(\(q\)) process</strong>: A time series \( X_t \) is a <em>moving average process of order \( q \)</em> if there exist \( \theta_1, \ldots, \theta_q \in \mathbb{R} \) with \( \theta_q \neq 0 \) such that
\[
X_t = W_t + \theta_1 W_{t-1} + \cdots + \theta_q W_{t-q} = \theta(B) W_t
\]
where \( \theta(B) = 1 + \theta_1 B + \cdots + \theta_q B^q \) is the <em>moving average polynomial</em>.
</div>

The properties of an MA(\( q \)) process are clean and complete:

- **Mean**: \( \mathbb{E}[X_t] = 0 \).
- **Variance**: \( \gamma(0) = \sigma_W^2 \sum_{j=0}^q \theta_j^2 \) (where \( \theta_0 = 1 \)).
- **ACVF**: For \( 1 \leq h \leq q \),
\[
\gamma(h) = \sigma_W^2 \sum_{j=0}^{q-h} \theta_j \theta_{j+h}, \quad \gamma(h) = 0 \text{ for } h > q.
\]

The **cutoff** of the ACF at lag \( q \) — exact zero for \( h > q \) — is the signature of an MA model. In contrast, an MA process is \( q \)-dependent (Definition: \( X_t \) and \( X_{t+h} \) are independent when \( h > q \)).

## Autoregressive Processes

<div class="definition">
<strong>AR(\(p\)) process</strong>: A time series \( X_t \) is an <em>autoregressive process of order \( p \)</em> if there exist \( \phi_1, \ldots, \phi_p \in \mathbb{R} \) with \( \phi_p \neq 0 \) such that
\[
X_t = \phi_1 X_{t-1} + \cdots + \phi_p X_{t-p} + W_t, \quad \text{i.e.} \quad \phi(B) X_t = W_t
\]
where \( \phi(B) = 1 - \phi_1 B - \cdots - \phi_p B^p \) is the <em>autoregressive polynomial</em>.
</div>

### Causality and Stationarity for AR(1)

The AR(1) model \( X_t = \phi X_{t-1} + W_t \) illustrates the key causality condition. By iterating backwards:

\[
X_t = \phi^k X_{t-k} + \sum_{j=0}^{k-1} \phi^j W_{t-j}.
\]

If \( |\phi| < 1 \), then \( \phi^k \to 0 \) and the sum converges in \( L^2 \) to the causal linear process \( X_t = \sum_{j=0}^\infty \phi^j W_{t-j} \). If \( |\phi| > 1 \), iterating forward gives a non-causal (future-dependent) solution. If \( |\phi| = 1 \), the variance grows as \( t \to \infty \) (random walk), and no stationary solution exists.

### ACF of AR(1) — Worked Derivation

Since \( X_t = \sum_{j=0}^\infty \phi^j W_{t-j} \), we compute

\[
\gamma(0) = \mathrm{V}(X_t) = \sigma_W^2 \sum_{j=0}^\infty \phi^{2j} = \frac{\sigma_W^2}{1 - \phi^2}.
\]

For \( h \geq 1 \):

\[
\gamma(h) = \mathrm{Cov}(X_t, X_{t+h}) = \sigma_W^2 \sum_{j=0}^\infty \phi^j \phi^{j+h} = \phi^h \frac{\sigma_W^2}{1 - \phi^2}.
\]

Therefore \( \rho(h) = \phi^h \). The ACF of an AR(1) decays **geometrically** at rate \( |\phi| \), with the sign pattern determined by the sign of \( \phi \): positive \( \phi \) gives monotone decay, negative \( \phi \) gives alternating signs.

### Yule-Walker Equations for AR(\(p\))

Multiplying \( X_t = \phi_1 X_{t-1} + \cdots + \phi_p X_{t-p} + W_t \) by \( X_{t-h} \) and taking expectations (using independence of \( W_t \) and past \( X_s \)):

\[
\gamma(h) = \phi_1 \gamma(h-1) + \phi_2 \gamma(h-2) + \cdots + \phi_p \gamma(h-p), \quad 1 \leq h \leq p.
\]

In matrix form this is \( \boldsymbol{\gamma}_p = \Gamma_p \boldsymbol{\phi} \) where \( \Gamma_p = [\gamma(j-k)]_{1 \leq j,k \leq p} \) is the Toeplitz autocovariance matrix and \( \boldsymbol{\gamma}_p = (\gamma(1), \ldots, \gamma(p))^\top \). This system is the **Yule-Walker system**. The white noise variance satisfies:

\[
\sigma_W^2 = \gamma(0) - \phi_1 \gamma(1) - \cdots - \phi_p \gamma(p).
\]

The Yule-Walker equations show that the AR parameters are determined by the first \( p \) values of the ACVF — this is the foundation for method-of-moments estimation.

## ARMA Processes

<div class="definition">
<strong>ARMA(\(p, q\)) process</strong>: Given a strong white noise \( \{W_t\} \), a time series \( X_t \) is <em>ARMA(\(p, q\))</em> if it is stationary and satisfies
\[
\phi(B) X_t = \theta(B) W_t,
\]
where \( \phi(z) = 1 - \phi_1 z - \cdots - \phi_p z^p \) (\( \phi_p \neq 0 \)) and \( \theta(z) = 1 + \theta_1 z + \cdots + \theta_q z^q \) (\( \theta_q \neq 0 \)) share no common roots (no parameter redundancy).
</div>

The ARMA model combines the features of MA and AR: the MA part allows specifying the ACF at finitely many lags, while the AR part produces geometric decay. Together they can represent complex autocorrelation structures parsimoniously.

<div class="definition">
<strong>Causal ARMA</strong>: An ARMA(\(p,q\)) is <em>causal</em> if there exist \( \{\psi_\ell\}_{\ell \geq 0} \) with \( \sum |\psi_\ell| < \infty \) such that \( X_t = \sum_{\ell=0}^\infty \psi_\ell W_{t-\ell} \). The coefficients satisfy \( \psi(z) = \theta(z)/\phi(z) \) for \( |z| \leq 1 \).
</div>

<div class="definition">
<strong>Invertible ARMA</strong>: An ARMA(\(p,q\)) is <em>invertible</em> if \( W_t = \sum_{\ell=0}^\infty \pi_\ell X_{t-\ell} \), where \( \pi(z) = \phi(z)/\theta(z) \) for \( |z| \leq 1 \).
</div>

<div class="theorem">
<strong>Causality criterion</strong>: An ARMA(\(p,q\)) process is causal if and only if all roots of \( \phi(z) \) lie outside the unit disk: \( \min_j |z_j| > 1 \).
</div>

<div class="theorem">
<strong>Invertibility criterion</strong>: An ARMA(\(p,q\)) process is invertible if and only if all roots of \( \theta(z) \) lie outside the unit disk.
</div>

When a model is both causal and invertible, the information in \( \{X_t\}_{t \leq T} \) is equivalent to the information in \( \{W_t\}_{t \leq T} \). This equivalence is essential for computing forecasts.

### Worked Example: ARMA(1,1) ACF

Consider \( X_t = -\frac{1}{4} X_{t-1} + W_t - \frac{1}{3} W_{t-1} \), so \( \phi(z) = 1 + \frac{1}{4}z \) (root at \(-4\), outside unit disk — causal) and \( \theta(z) = 1 - \frac{1}{3}z \) (root at \(3\), outside unit disk — invertible).

The causal representation coefficients satisfy \( \psi(z)\phi(z) = \theta(z) \). Matching powers of \( z \):

\[
\psi_0 = 1, \quad \psi_1 = -\frac{1}{3} - \frac{1}{4} \cdot 1 = -\frac{7}{12}, \quad \psi_j = \left(-\frac{1}{4}\right)^{j-1}\left(-\frac{7}{12}\right) \text{ for } j \geq 1.
\]

Using \( \gamma(h) = \sigma_W^2 \sum_{j=0}^\infty \psi_j \psi_{j+h} \), after calculation:

\[
\rho(h) = \frac{91}{23} (-1)^h 2^{-2h-1}, \quad h \geq 1.
\]

In R: `round(ARMAacf(ar = -1/4, ma = -1/3, 5), 6)` confirms \( \rho(1) \approx -0.4946 \).

### ACF/PACF Identification Table

| Model | ACF | PACF |
|---|---|---|
| MA(\(q\)) | Cuts off after lag \(q\) | Geometric decay |
| AR(\(p\)) | Geometric decay | Cuts off after lag \(p\) |
| ARMA(\(p,q\)) | Geometric decay after lag \(q\) | Geometric decay after lag \(p\) |

## Partial Autocorrelation Function (PACF)

<div class="definition">
<strong>PACF</strong>: The <em>partial autocorrelation function</em> of a stationary process is
\[
\phi_{h,h} = \mathrm{Corr}(X_{t+h} - \mathrm{Proj}(X_{t+h} \mid X_{t+h-1}, \ldots, X_{t+1}), \; X_t - \mathrm{Proj}(X_t \mid X_{t+h-1}, \ldots, X_{t+1})).
\]
It measures the correlation between \( X_t \) and \( X_{t+h} \) <em>after removing the linear effect of the intervening values</em>.
</div>

For an AR(\(p\)) process, \( X_{t+h} - \mathrm{Proj}(X_{t+h} \mid X_{t+h-1}, \ldots, X_{t+1}) = W_{t+h} \) (for \( h \geq p+1 \)), which is independent of everything in the past. Hence \( \phi_{h,h} = 0 \) for \( h > p \) — a sharp cutoff.

The PACF is estimated using the Yule-Walker system at each lag \( h \): \( \hat{\phi}_{h,h} = (\hat{\Gamma}_h^{-1} \hat{\boldsymbol{\gamma}}_h)(h) \) where \( \hat{\Gamma}_h \) is the estimated \( h \times h \) Toeplitz matrix.

# Chapter 4: Stationarity Testing and Transformations

## Box-Cox Transformations

When a time series exhibits variance that grows with the level (as in the Johnson and Johnson earnings series), a logarithmic or power transformation can stabilize the variance before fitting a linear model.

<div class="definition">
<strong>Box-Cox transformation</strong>: For \( \lambda \geq 0 \), the Box-Cox transformation is
\[
w_t = \begin{cases} \log(X_t) & \lambda = 0 \\ (X_t^\lambda - 1)/\lambda & \lambda \neq 0. \end{cases}
\]
</div>

The log transformation (\( \lambda = 0 \)) is by far the most common: it converts multiplicative structure to additive, and converts exponential growth to linear growth. After transforming, the signal+noise model applies: \( \log(X_t) = s_t + Y_t \) where \( Y_t \sim \mathrm{ARMA}(p, q) \).

## Unit Root Tests

### The Integrated Model

<div class="definition">
<strong>Integrated of order \(d\)</strong>: A time series \( X_t \) is <em>integrated of order \(d\)</em>, written \( I(d) \), if \( \nabla^d X_t \) is stationary but \( \nabla^j X_t \) is not stationary for \( 1 \leq j < d \).
</div>

A random walk is \( I(1) \): \( \nabla X_t = W_t \) is white noise (stationary), but \( X_t \) itself is not.

### KPSS Test

The Kwiatkowski-Phillips-Schmidt-Shin (KPSS) test has **stationarity as the null hypothesis** and non-stationarity as the alternative. This is the reverse of the Dickey-Fuller framework, and the reversal has practical consequences: we only reject stationarity when there is strong evidence against it.

Define the partial sum process \( Z_T(x) = \frac{1}{\sqrt{T}} \sum_{t=1}^{\lfloor Tx \rfloor} (X_t - \bar{X}) \). The test statistic is

\[
\mathrm{KPSS}_T = \frac{1}{T \hat{\sigma}^2_{\mathrm{LRV}}} \sum_{k=1}^T Z_T^2(k/T)
\]

where \( \hat{\sigma}^2_{\mathrm{LRV}} = \sum_{h=-H}^H \hat{\gamma}(h) \) is the truncated long-run variance estimator with bandwidth \( H \). Under \( H_0 \) (strict stationarity), \( \mathrm{KPSS}_T \xrightarrow{d} \int_0^1 B^2(x)\,dx \) where \( B(x) = W(x) - xW(1) \) is a **Brownian bridge** — the Cramér-von Mises distribution. Under non-stationary alternatives (level shift, trend, random walk), \( \mathrm{KPSS}_T \xrightarrow{p} \infty \). Small \( p \)-values from the Cramér-von Mises table indicate non-stationarity.

The long-run variance plays a central role. The standard bandwidth choices are \( H(T) = \lfloor 4(T/100)^{1/4} \rfloor \) (Newey-West) or \( H(T) = \lfloor 12(T/100)^{1/4} \rfloor \) (Andrews), both satisfying \( H \to \infty \) and \( H/T \to 0 \).

# Chapter 5: ARMA and ARIMA Models

## Best Linear Prediction

The \( L^2 \) Hilbert space framework gives a geometric foundation for forecasting. Define:

\[
\mathcal{M}_2 = \mathrm{Span}(1, X_T, \ldots, X_1) = \left\{Y : Y = \alpha_0 + \sum_{j=1}^T \alpha_j X_j,\; \alpha_j \in \mathbb{R}\right\}.
\]

<div class="theorem">
<strong>Projection Theorem</strong>: If \( \mathcal{M} \) is a closed linear subspace of \( L^2 \) and \( X \in L^2 \), there exists a unique \( \hat{X} \in \mathcal{M} \) minimizing \( \mathbb{E}[(X - \hat{X})^2] \). Moreover, \( \hat{X} \) satisfies the normal equations: \( \mathbb{E}[(X - \hat{X})Y] = 0 \) for all \( Y \in \mathcal{M} \).
</div>

The **best linear predictor (BLP)** is \( \hat{X}_{T+1} = \mathrm{Proj}(X_{T+1} \mid \mathcal{M}_2) \). From the normal equations, assuming \( \mu = 0 \):

\[
\Gamma_T \boldsymbol{\phi}_T = \boldsymbol{\gamma}_T \implies \boldsymbol{\phi}_T = \Gamma_T^{-1} \boldsymbol{\gamma}_T
\]

where \( \Gamma_T = [\gamma(j-k)]_{1 \leq j,k \leq T} \), \( \boldsymbol{\gamma}_T = (\gamma(T), \ldots, \gamma(1))^\top \). The **mean-squared prediction error** is:

\[
P_T^{T+1} = \mathbb{E}[(X_{T+1} - \hat{X}_{T+1})^2] = \gamma(0) - \boldsymbol{\gamma}_T^\top \Gamma_T^{-1} \boldsymbol{\gamma}_T.
\]

## ARMA Forecasting

For a causal and invertible ARMA(\(p,q\)) model, the BLP \( \hat{X}_{T+h} \approx \tilde{X}_{T+h} = \mathbb{E}[X_{T+h} \mid X_T, X_{T-1}, \ldots] \) can be computed via the **truncated prediction recursion**:

\[
\hat{X}_{T+h} = -\sum_{j=1}^{h-1} \pi_j \hat{X}_{T+h-j} - \sum_{j=h}^{T+h-1} \pi_j X_{T+h-j}
\]

where \( \pi(z) = \phi(z)/\theta(z) = \sum_{j=0}^\infty \pi_j z^j \) are the invertibility coefficients. In practice: initialize \( \hat{W}_t = 0 \) for \( t \leq 0 \), compute residuals \( \hat{W}_t = X_t - \phi_1 X_{t-1} - \cdots - \phi_p X_{t-p} - \theta_1 \hat{W}_{t-1} - \cdots - \theta_q \hat{W}_{t-q} \) for \( 1 \leq t \leq T \), then iterate forward.

The **mean-squared prediction error** at horizon \( h \) is approximately:

\[
P_T^{T+h} = \sigma_W^2 \sum_{j=0}^{h-1} \psi_j^2
\]

and an approximate \( (1-\alpha) \) prediction interval is

\[
\hat{X}_{T+h} \pm z_{\alpha/2} \sqrt{\hat{P}_T^{T+h}}.
\]

An important long-range property: since \( \sum_{j=h}^\infty \psi_j W_{T+h-j} \to 0 \) geometrically as \( h \to \infty \), ARMA forecasts converge to the mean (or trend) quickly. For long-horizon forecasting, getting the trend correct is far more important than the ARMA component.

### Worked Example: Cardiovascular Mortality

The weekly cardiovascular mortality series for Los Angeles County (1970–1980) illustrates the full Box-Jenkins pipeline. The mean function is modeled as \( s_t = \beta_0 + \beta_1 t + \beta_2 t^2 + \beta_3 t^3 + \beta_4 \sin(2\pi t/52) + \beta_5 \cos(2\pi t/52) + \beta_6 \sin(2\pi t/26) + \beta_7 \cos(2\pi t/26) \), estimated by OLS (terms selected by AIC). The detrended residuals appear approximately normal and mildly serially correlated. Inspecting the PACF of the residuals reveals significant partial autocorrelations at lags 1 and 2, suggesting AR(2) structure. The fitted model is:

\[
Y_t = 0.0885\,Y_{t-1} + 0.3195\,Y_{t-2} + W_t + 0.1328\,W_{t-1} \quad [\mathrm{ARMA}(2,1)].
\]

Ten-step-ahead forecasts with 95% prediction bands show rapid convergence to the estimated trend, illustrating the geometric decay property.

## ARMA Parameter Estimation

### Yule-Walker and OLS for AR Models

For the AR(\(p\)) case, OLS minimizes \( \sum_{t=p+1}^T (X_t - \phi_1 X_{t-1} - \cdots - \phi_p X_{t-p})^2 \), yielding the same first-order conditions as the Yule-Walker system:

\[
\hat{\boldsymbol{\phi}} = \hat{\Gamma}_p^{-1} \hat{\boldsymbol{\gamma}}_p, \quad \hat{\sigma}_W^2 = \hat{\gamma}(0) - \hat{\boldsymbol{\gamma}}_p^\top \hat{\Gamma}_p^{-1} \hat{\boldsymbol{\gamma}}_p.
\]

<div class="theorem">
<strong>Asymptotic efficiency of Yule-Walker</strong>: If \( X_t \sim \mathrm{AR}(p) \) (causal), then
\[
\sqrt{T}(\hat{\boldsymbol{\phi}}_\mathrm{YW} - \boldsymbol{\phi}) \xrightarrow{d} \mathrm{MVN}(0, \sigma_W^2 \Gamma_p^{-1}).
\]
The estimator is asymptotically efficient (achieves the Cramér-Rao lower bound).
</div>

### Maximum Likelihood Estimation

For general ARMA(\(p,q\)) models, the white noise \( W_t \) is latent, making OLS inapplicable to the MA parameters. MLE provides a unified framework.

When \( W_t \sim \mathcal{N}(0, \sigma_W^2) \), the joint likelihood factors via the prediction error decomposition:

\[
\mathcal{L}(\boldsymbol{\theta}) = \prod_{t=1}^T f(X_t \mid X_{t-1}, \ldots, X_1) = \prod_{t=1}^T \frac{1}{\sqrt{2\pi P_{t-1}^t}} \exp\!\left(-\frac{(X_t - \tilde{X}_{t \mid t-1})^2}{2 P_{t-1}^t}\right)
\]

where \( \tilde{X}_{t \mid t-1} \) and \( P_{t-1}^t \) are the one-step conditional mean and variance computed via the truncated prediction recursion. This likelihood is maximized numerically.

<div class="theorem">
<strong>MLE asymptotic optimality</strong>: The MLEs of \( \phi_1, \ldots, \phi_p, \theta_1, \ldots, \theta_q, \sigma_W^2 \) are \( \sqrt{T} \)-consistent and asymptotically Normal with covariance equal to the inverse Fisher information matrix. In this sense they are asymptotically optimal (Brockwell and Davis; Hannan 1980).
</div>

### Model Selection: AIC and BIC

Let \( k = p + q + 1 \) be the number of parameters. The information criteria penalize model complexity:

\[
\mathrm{AIC}(p,q) = -2\log\hat{\mathcal{L}} + 2k, \qquad \mathrm{BIC}(p,q) = -2\log\hat{\mathcal{L}} + k\log T.
\]

The corrected AIC is \( \mathrm{AIC}_C = \mathrm{AIC} + 2k(k+1)/(T-k-1) \), preferred for small samples. Smaller values indicate better models. Minimizing AIC is related to minimizing expected 1-step forecast MSE, making it the natural criterion when forecasting is the primary goal.

## ARIMA Models

<div class="definition">
<strong>ARIMA(\(p,d,q\))</strong>: A time series \( X_t \) follows an <em>autoregressive integrated moving average</em> model of orders \( p, d, q \) if
\[
\phi(B)(1 - B)^d X_t = \theta(B) W_t.
\]
Equivalently, \( Y_t = \nabla^d X_t \) follows an ARMA(\(p,q\)) model.
</div>

Forecasting proceeds by: (1) computing ARMA forecasts \( \hat{Y}_{T+h \mid T} \) for the differenced series, then (2) reversing the differencing to recover forecasts for \( X_{T+h} \). For ARIMA(0,1,0) (pure random walk), \( \hat{X}_{T+h \mid T} = X_T \) and \( P_T^{T+h} = h\sigma_W^2 \) — prediction intervals widen as \( \sqrt{h} \), reflecting the accumulation of uncertainty.

The prediction MSE for ARIMA(\(p,d,q\)) at horizon \( h \) is \( \sigma_W^2 \sum_{j=0}^{h-1} \psi_{j,*}^2 \) where \( \psi_{j,*} \) are the coefficients of the power series expansion of \( \theta(z)/[\phi(z)(1-z)^d] \) at \( |z| < 1 \).

How to choose \( d \) in practice:
1. Eyeball test: does the series look stationary after \( d \) differences?
2. Formal tests: KPSS test (null: stationary; reject for large values) or Dickey-Fuller test (null: unit root; reject for small values).
3. Cross-validation: compare forecast accuracy of competing \( d \) values.

# Chapter 6: Seasonal ARIMA Models

## SARIMA Models

Real-world time series often exhibit **seasonality**: regular variation with period \( s \) such that \( X_t \approx X_{t-s} \). Examples include monthly data (\( s = 12 \)), quarterly data (\( s = 4 \)), weekly data (\( s = 52 \)), and daily data (\( s = 7 \)). Standard ARIMA models are ill-suited for seasonality because their difference structure corresponds to random walks, which lack periodic structure.

<div class="definition">
<strong>SARIMA(\(p,d,q\)) \(\times\) (\(P,D,Q\))\(_s\)</strong>: A time series \( Y_t \) follows a <em>seasonal ARIMA</em> model if
\[
\Phi_P(B^s)\phi_p(B)(1 - B^s)^D(1 - B)^d Y_t = \Theta_Q(B^s)\theta_q(B) W_t
\]
where \( \Phi_P(z) = 1 - \Phi_1 z - \cdots - \Phi_P z^P \) and \( \Theta_Q(z) = 1 + \Theta_1 z + \cdots + \Theta_Q z^Q \) are the seasonal AR and MA polynomials, evaluated at the seasonal backshift \( B^s \).
</div>

The SARIMA model is simply a large ARMA model for \( Y_t = (1-B^s)^D(1-B)^d X_t \). Its advantage over a generic ARMA is parsimony: the seasonal structure requires only a few additional parameters (\( P, D, Q \)) to capture the dependence at seasonal lags. For example, in SARIMA(1,1,1)\(\times\)(1,1,1)\(_{13}\), the model equation contains terms at lags 1, 13, and 14:

\[
Y_t - \Phi_1 Y_{t-13} - \phi_1 Y_{t-1} + \phi_1 \Phi_1 Y_{t-14} = W_t + \Theta_1 W_{t-13} + \theta_1 W_{t-1} + \theta_1 \Theta_1 W_{t-13}.
\]

## Time Series Cross-Validation

Standard \( K \)-fold cross-validation is inappropriate for time series because randomly splitting the data destroys serial dependence. The correct approach preserves temporal order.

<div class="definition">
<strong>Time series cross-validation (rolling origin evaluation)</strong>: Given a training cutoff \( t_r \approx 0.75 T \), for each \( j \) in \( \{t_r+1, \ldots, T\} \):
<ol>
<li>Fit the model using data \( X_1, \ldots, X_j \).</li>
<li>Compute the forecast \( \hat{X}_{j+1 \mid j} \).</li>
<li>Record the loss \( L_j = L(\hat{X}_{j+1 \mid j}, X_{j+1}) \).</li>
</ol>
The total cross-validation score is \( \mathrm{CV}(M) = \sum_{j=t_r+1}^T L_j \).
</div>

Stationarity is implicitly required: for cross-validation errors observed in the present to predict future errors, the data-generating mechanism must be stable over time.

## Bootstrap Prediction Intervals

When the distributional assumption on \( W_t \) is in doubt, bootstrap prediction intervals provide a non-parametric alternative. Given estimated residuals \( \hat{W}_1, \ldots, \hat{W}_T \):

1. Draw \( W_{T+1}^{(b)}, \ldots, W_{T+h}^{(b)} \) from the empirical distribution of \( \{\hat{W}_t\} \).
2. Simulate \( \hat{X}_{T+h}^{(b)} = g(\hat{X}_{T+h-1}^{(b)}, \ldots, X_T) + W_{T+h}^{(b)} \) (iterate for multi-step).
3. Repeat \( B = 1000 \) or more times; use empirical \( \alpha/2 \) and \( 1-\alpha/2 \) quantiles as the prediction interval.

The bootstrap approach captures non-Gaussian features of the innovation distribution. It requires that the residuals be approximately white — verify using the sample ACF and Ljung-Box test before bootstrapping.

# Chapter 7: Exponential Smoothing Models

## Simple Exponential Smoothing

Exponential smoothing methods provide a flexible alternative to ARIMA for modeling time series with trend and seasonality. Rather than working with a parametric correlation structure, they model the level, slope, and seasonal components directly.

**Simple exponential smoothing (SES)** is appropriate for series without trend or seasonality. It forecasts the next value as a weighted average of past observations, with exponentially decreasing weights:

\[
\hat{X}_{T+1 \mid T} = \alpha X_T + \alpha(1-\alpha)X_{T-1} + \cdots + \alpha(1-\alpha)^{T-1}X_1
\]

where \( \alpha \in [0,1] \) is the smoothing parameter. This is equivalently expressed through the **state-space recursion**:

\[
\hat{X}_{t \mid t-1} = \ell_{t-1}, \qquad \ell_t = \alpha X_t + (1-\alpha)\ell_{t-1} = \ell_{t-1} + \alpha \varepsilon_t
\]

where \( \varepsilon_t = X_t - \ell_{t-1} \) is the one-step-ahead forecast error. Parameters \( (\alpha, \ell_0) \) are estimated by OLS (minimizing sum of squared forecast errors) or MLE.

## Holt's Linear Method and Holt-Winters

**Holt's linear method** (double exponential smoothing) extends SES to series with a locally linear trend:

\[
\hat{X}_{T+h \mid T} = \ell_T + h b_T
\]

\[
\ell_t = \alpha X_t + (1-\alpha)(\ell_{t-1} + b_{t-1}), \qquad b_t = \beta(\ell_t - \ell_{t-1}) + (1-\beta)b_{t-1}.
\]

**Holt-Winters** further adds a seasonal component \( s_t \) (additive version):

\[
\hat{X}_{T+h \mid T} = \ell_T + h b_T + s_{T+h - p(k+1)}, \quad k = \lfloor (h-1)/p \rfloor
\]

\[
\ell_t = \alpha(X_t - s_{t-p}) + (1-\alpha)(\ell_{t-1} + b_{t-1})
\]

\[
b_t = \beta(\ell_t - \ell_{t-1}) + (1-\beta)b_{t-1}
\]

\[
s_t = \gamma(X_t - \ell_{t-1} - b_{t-1}) + (1-\gamma)s_{t-p}.
\]

The parameters \( \alpha, \beta, \gamma \in [0,1] \) and initial states \( (\ell_0, b_0, s_0, \ldots, s_{-p+1}) \) are estimated by MLE.

### Worked Example: Holt-Winters on Johnson and Johnson

For the Johnson and Johnson quarterly earnings series, the data exhibit exponential growth and clear quarterly seasonality. We apply a log-transformation to convert multiplicative structure to additive. After logging, the series has a linear trend and additive seasonality with period \( p = 4 \). Fitting additive Holt-Winters yields forecasts that closely follow the observed pattern, with prediction intervals computed via the state-space simulation approach.

## State-Space Representation and ETS Models

Rearranging the SES equations:

\[
X_t = \ell_{t-1} + \varepsilon_t \quad \text{(Observation)}, \qquad \ell_t = \ell_{t-1} + \alpha \varepsilon_t \quad \text{(State)}.
\]

This is a special case of the **general state space model**:

<div class="definition">
<strong>State space model</strong>: A time series \( X_t \) follows a <em>state space model</em> if
\[
X_t = A_t Y_t + \varepsilon_t \quad \text{(observation equation)}, \qquad Y_t = \Phi Y_{t-1} + W_t \quad \text{(state equation)}
\]
where \( Y_t \) is an unobserved state vector, \( A_t \) is a known measurement matrix, and \( \varepsilon_t, W_t \) are noise terms.
</div>

Every ARMA model, exponential smoothing model, and GARCH model has a state-space formulation. For ARMA(\(p,q\)) with \( r = \max(p, q+1) \):

\[
Y_t = [\theta_{r-1}, \theta_{r-2}, \ldots, \theta_0] \mathbf{X}_t \quad \text{(observation)}, \qquad \mathbf{X}_{t+1} = C \mathbf{X}_t + \mathbf{e} W_t \quad \text{(state)}
\]
where \( C \) is a companion matrix. This unifying framework enables likelihood computation via the Kalman filter for any model in this family.

The **ETS (Error/Trend/Seasonal) taxonomy** classifies exponential smoothing models by their error type (Additive/Multiplicative), trend type (None/Additive/Additive Damped/Multiplicative), and seasonal type (None/Additive/Multiplicative). AIC computed from the Gaussian state-space likelihood is used to select among ETS variants.

**Multiplicative errors** arise when the noise is proportional to the level:

\[
\varepsilon_t = \frac{X_t - \ell_{t-1}}{\ell_{t-1}}, \quad X_t = \ell_{t-1}(1 + \varepsilon_t), \quad \ell_t = \ell_{t-1}(1 + \alpha \varepsilon_t).
\]
The key practical rule: if seasonal fluctuations grow proportionally with the trend level, use multiplicative errors; if they remain constant, use additive. AIC comparison can confirm the choice formally.

# Chapter 8: GARCH and Volatility Models

## Conditional Heteroscedasticity

Standard ARMA models capture serial correlation in the conditional mean but leave the conditional variance constant. Financial time series routinely exhibit **volatility clustering**: large fluctuations tend to cluster together, periods of high volatility are followed by high volatility. This is the defining feature of conditionally heteroscedastic processes.

<div class="definition">
<strong>Conditionally heteroscedastic</strong>: A time series \( X_t \) is <em>conditionally heteroscedastic</em> if \( \mathrm{V}(X_t \mid X_{t-1}, X_{t-2}, \ldots) = \sigma_{X,t}^2 \) depends on the past.
</div>

If \( X_t \sim \mathrm{AR}(1) \) with constant \( \sigma_W^2 \), past observations leave the conditional variance unchanged. Volatility models replace this with a dynamic variance equation.

## ARCH and GARCH

<div class="definition">
<strong>ARCH(\(p\))</strong>: A time series follows an <em>autoregressive conditionally heteroscedastic</em> model of order \( p \) if \( X_t = \sigma_t W_t \) where \( W_t \) is a unit-variance strong white noise and
\[
\sigma_t^2 = \omega + \sum_{j=1}^p \alpha_j X_{t-j}^2
\]
with \( p > 0 \), \( \omega > 0 \), \( \alpha_j \geq 0 \). Introduced by Robert Engle (1982), for which he received the 2003 Nobel Prize in Economics.
</div>

<div class="definition">
<strong>GARCH(\(p,q\))</strong>: A time series follows a <em>generalized ARCH</em> model if \( X_t = \sigma_t W_t \) and
\[
\sigma_t^2 = \omega + \sum_{j=1}^p \alpha_j X_{t-j}^2 + \sum_{k=1}^q \beta_k \sigma_{t-k}^2
\]
with \( \omega > 0 \), \( \alpha_j, \beta_k \geq 0 \). Proposed by Bollerslev (1986). GARCH(p,0) \(\equiv\) ARCH(p).
</div>

Key properties: A GARCH process has \( \mathbb{E}[X_t] = 0 \) and \( \gamma_X(h) = 0 \) for \( h \geq 1 \) — it is a **weak white noise**. But \( X_t^2 \) has ARMA-like serial correlation: for ARCH(1), \( X_t^2 = \omega + \alpha X_{t-1}^2 + V_t \) where \( V_t = \sigma_t^2(W_t^2 - 1) \) is a weak white noise.

### Stationarity Conditions

For GARCH(1,1), a stationary solution exists if and only if the **top Lyapunov exponent** satisfies \( \gamma = \mathbb{E}[\log(\alpha W_0^2 + \beta)] < 0 \). A sufficient (but not necessary) condition is \( \alpha + \beta < 1 \); under this condition the process is also second-order stationary with unconditional variance \( \sigma_X^2 = \omega/(1 - \alpha - \beta) \).

The explicit form of the stationary solution is:

\[
\sigma_t^2 = \omega\!\left(1 + \sum_{j=1}^\infty \prod_{i=1}^j (\alpha W_{t-i}^2 + \beta)\right),
\]

which converges when the Lyapunov exponent is negative. In practice, fitted GARCH models often have \( \alpha + \beta \approx 0.99 \), near the boundary of second-order stationarity, representing "near unit-root" volatility persistence.

## GARCH Parameter Estimation

**Quasi-MLE (QMLE)**: Assume \( W_t \sim \mathcal{N}(0,1) \), so \( X_t \mid X_{t-1}, \ldots \sim \mathcal{N}(0, \sigma_t^2) \). The likelihood is:

\[
\mathcal{L}(\omega, \boldsymbol{\alpha}, \boldsymbol{\beta}) = \prod_{t=\max(p,q)+1}^T \frac{1}{\sqrt{2\pi\sigma_t^2}} \exp\!\left(-\frac{X_t^2}{2\sigma_t^2}\right)
\]

maximized numerically subject to \( \omega > 0 \), \( \alpha_j, \beta_k \geq 0 \), and \( \sum \alpha_j + \sum \beta_k < 1 \).

<div class="theorem">
<strong>Consistency of QMLE</strong>: If \( X_t \sim \mathrm{GARCH}(p,q) \) admits a stationary and causal solution, the QMLE is consistent. If additionally \( W_t \sim \mathcal{N}(0,1) \), the estimator is asymptotically efficient.
</div>

Initial conditions \( X_t^2 = \omega \), \( \sigma_t^2 = \omega \) for \( t \leq 0 \) are used; for long series the effect is negligible.

## Identifying and Diagnosing GARCH Models

Detection of conditional heteroscedasticity: Apply the McLeod-Li (portmanteau) test to \( X_t^2 \): under strong white noise,

\[
Q^2(T, H) = T \sum_{h=1}^H \hat{\rho}_{X^2}^2(h) \xrightarrow{d} \chi^2(H).
\]

Large values (small \( p \)-values) indicate GARCH-type behavior.

Note that for a **weak white noise** (including GARCH), the usual \( \pm 1.96/\sqrt{T} \) ACF bands are too narrow because \( \mathrm{V}(\sqrt{T}\hat{\gamma}(h)) \approx \mathbb{E}[X_0^2 X_{-h}^2] > (\mathbb{E}[X_0^2])^2 \). Wider, heteroscedasticity-robust bands can be constructed using \( \hat{\sigma}_h^2 = T^{-1}\sum X_{t+h}^2 X_t^2 \).

## Value at Risk

<div class="definition">
<strong>Value at Risk (VaR)</strong>: The horizon-\(h\) VaR at level \(\alpha\) is the \((1-\alpha)\) conditional quantile of the loss \( L_{t,t+h} = -(V_{t+h} - V_t) \):
\[
\mathrm{VaR}_{t,h}(\alpha) = \inf\{x : \mathbb{P}(L_{t,t+h} > x \mid \mathcal{F}_t) \leq \alpha\}.
\]
</div>

Under Gaussian GARCH: \( \mathrm{VaR}_{t,1}(\alpha) = \sigma_{t+1} \Phi^{-1}(1-\alpha) \). For general distributions, bootstrap or \( t \)-distribution quantiles can replace \( \Phi^{-1} \). Multi-step VaR is computed either via \( \sqrt{h} \)-scaling (appropriate under i.i.d. returns) or Monte Carlo simulation from the GARCH model.

**Backtesting** (time-series cross-validation for risk models): record hit indicators \( \mathbf{1}\{L_{t,t+1} > \widehat{\mathrm{VaR}}_{t,1}(\alpha)\} \) over the test sample; their empirical frequency should be close to \( \alpha \).

# Chapter 9: Forecast Evaluation

## Forecast Error Measures

Let \( e_t = X_t - \hat{X}_{t \mid t-h} \) denote the \( h \)-step-ahead forecast error.

| Measure | Formula |
|---|---|
| MAE | \( T^{-1}\sum \|e_t\| \) |
| RMSE | \( \sqrt{T^{-1}\sum e_t^2} \) |
| MAPE | \( T^{-1}\sum |e_t/X_t| \times 100\% \) |
| MASE | MAE / (in-sample MAE of naïve method) |

MASE (mean absolute scaled error, Hyndman & Koehler 2006) is unit-free and avoids the instability of MAPE when \( X_t \) is near zero.

## Diebold-Mariano Test

Given two competing models \( M_1 \) and \( M_2 \) with forecast errors \( \hat{e}_{t,1} \) and \( \hat{e}_{t,2} \), and loss difference \( D_t = L(\hat{e}_{t,1}) - L(\hat{e}_{t,2}) \), the Diebold-Mariano (1995) test evaluates equal predictive accuracy:

\[
H_0: \mathbb{E}[D_t] = 0 \quad \text{vs.} \quad H_A: \mathbb{E}[D_t] \neq 0.
\]

The test statistic is

\[
\mathrm{DM}_T = \frac{\sqrt{T}\,\bar{D}}{\hat{\sigma}_{\mathrm{LRV}}(D)} \xrightarrow{d} \mathcal{N}(0,1)
\]

where \( \bar{D} = T^{-1}\sum_{t=t_r+1}^T D_t \) and \( \hat{\sigma}_{\mathrm{LRV}}(D) \) is the long-run standard deviation of \( D_t \) (estimated via the truncated variance estimator). The long-run variance is needed because forecast errors at nearby time points are often correlated.

A two-sided \( p \)-value is \( p = \mathbb{P}(|Z| > |\mathrm{DM}_T|) \). The test is particularly useful when one model has smaller cross-validation score than another — it tells us whether the difference is statistically significant.

# Chapter 10: State-Space Models and Kalman Filter

## Linear Gaussian State-Space Model

State-space models provide a unifying framework that encompasses ARMA, ARIMA, ETS, and transfer function models, while also handling missing data and time-varying systems.

<div class="definition">
<strong>Linear Gaussian state-space model</strong>: The <em>observation equation</em> and <em>state equation</em> are
\[
Y_t = A_t X_t + \Gamma u_t + V_t, \quad V_t \sim \mathcal{N}_d(0, R)
\]
\[
X_t = \Phi X_{t-1} + \xi u_t + W_t, \quad W_t \sim \mathcal{N}_p(0, Q)
\]
where \( Y_t \in \mathbb{R}^d \) is observed, \( X_t \in \mathbb{R}^p \) is the unobserved state, \( A_t \) is the measurement matrix, \( u_t \) are exogenous inputs, and \( V_t, W_t \) are independent noise sequences.
</div>

## Kalman Filter Recursions

Given observations \( Y_1, \ldots, Y_t \), the Kalman filter computes the optimal (MMSE) estimate of the state \( X_t \) recursively — no batch processing required.

Denote \( X_t^s = \mathbb{E}[X_t \mid Y_k, k \leq s] \) and \( P_t^s = \mathbb{E}[(X_t - X_t^s)(X_t - X_t^s)^\top] \). With initial conditions \( X_0^0 \) and \( P_0^0 \):

**Prediction step** (propagate state forward):

\[
X_t^{t-1} = \Phi X_{t-1}^{t-1} + \xi u_t, \qquad P_t^{t-1} = \Phi P_{t-1}^{t-1} \Phi^\top + Q.
\]

**Update step** (incorporate new observation \( Y_t \)):

\[
X_t^t = X_t^{t-1} + K_t(Y_t - A_t X_t^{t-1} - \Gamma u_t), \qquad P_t^t = (I - K_t A_t) P_t^{t-1}
\]

where the **Kalman gain** is:

\[
K_t = P_t^{t-1} A_t^\top \left[A_t P_t^{t-1} A_t^\top + R\right]^{-1}.
\]

The Kalman gain \( K_t \) determines how much weight to place on the new observation versus the prior prediction: when \( R \) is large (high observation noise), \( K_t \) is small and the update is cautious; when \( R \) is small, the filter relies heavily on \( Y_t \).

## Kalman Smoother

The Kalman smoother combines forward Kalman filtering with a backward pass to estimate \( X_t \) given the **entire** observed series \( Y_1, \ldots, Y_T \). For \( t = T, T-1, \ldots, 1 \):

\[
X_{t-1}^T = X_{t-1}^{t-1} + J_{t-1}(X_t^T - X_t^{t-1}), \qquad P_{t-1}^T = P_{t-1}^{t-1} + J_{t-1}(P_t^T - P_t^{t-1})J_{t-1}^\top
\]

where \( J_{t-1} = P_{t-1}^{t-1}\Phi^\top [P_t^{t-1}]^{-1} \) is the smoother gain.

Smoothed state estimates have lower mean-squared error than filtered estimates, because they use all available data. The smoother is used for retrospective analysis (e.g., imputing missing values) whereas the filter is used for real-time prediction.

## Likelihood Evaluation and MLE

The prediction error decomposition gives a simple expression for the Gaussian log-likelihood:

\[
\ell(\boldsymbol{\theta}) = -\frac{1}{2}\sum_{t=1}^T \left[\log|F_t| + (Y_t - \hat{Y}_t^\top) F_t^{-1} (Y_t - \hat{Y}_t)\right]
\]

where \( \hat{Y}_t = A_t X_t^{t-1} + \Gamma u_t \) is the one-step prediction and \( F_t = A_t P_t^{t-1} A_t^\top + R \) is its covariance. This is maximized over \( \boldsymbol{\theta} = (R, Q, \xi, \Gamma, \Phi)^\top \) using Newton-Raphson, EM algorithm, or MCMC.

## Application: Missing Data Imputation

Suppose \( Y_t \) has missing values at some time points. Write \( X_t = Y_t \) as the full (partially missing) series, modeled as an ARIMA process. Set the measurement matrix to \( A_t = 1 \) when \( Y_t \) is observed and \( A_t = 0 \) when it is missing. The Kalman smoother then provides optimal imputed values for the missing observations, together with their posterior uncertainty.

# Chapter 11: Multivariate Time Series

## Vector Autoregressive Models

When \( d \) time series are observed simultaneously, the **vector autoregressive model (VAR)** generalizes the scalar AR model.

<div class="definition">
<strong>VAR(\(1\))</strong>: A vector-valued process \( \{\mathbf{X}_t\}_{t \in \mathbb{Z}} \) in \( \mathbb{R}^d \) follows a <em>vector autoregressive model of order 1</em> if
\[
\mathbf{X}_t = A\mathbf{X}_{t-1} + \mathbf{W}_t
\]
where \( A \in \mathbb{R}^{d \times d} \) and \( \{\mathbf{W}_t\} \) is i.i.d. with \( \mathbb{E}[\mathbf{W}_t] = \mathbf{0} \) and \( \mathrm{V}(\mathbf{W}_t) = \Sigma_W \).
</div>

If \( \|A\|_\mathrm{op} = \sup_{\|\mathbf{x}\|=1} \|A\mathbf{x}\| < 1 \), then a stationary solution exists: \( \mathbf{X}_t = \sum_{\ell=0}^\infty A^\ell \mathbf{W}_{t-\ell} \). The general VAR(\(p\)) model has stationary and causal solution if and only if \( \det(I - A(z)) \neq 0 \) for all \( |z| \leq 1 \), where \( A(z) = A_1 z + \cdots + A_p z^p \).

Parameter estimation is straightforward: OLS applied equation-by-equation minimizes \( \sum_{t=p+1}^T \|\mathbf{X}_t - A_1 \mathbf{X}_{t-1} - \cdots - A_p \mathbf{X}_{t-p}\|^2 \). The multivariate portmanteau (Hosking-Li-McLeod) test:

\[
P_{T,H} = T \sum_{h=1}^H \mathrm{trace}(\hat{\Gamma}_h^\top \hat{\Gamma}_0^{-1} \hat{\Gamma}_h \hat{\Gamma}_0^{-1}) \xrightarrow{d} \chi^2(d^2 H)
\]

provides a joint white-noise test for all cross-correlations.

## Cross-Covariance and Cross-Correlation Functions

For a bivariate stationary process \( (X_{1,t}, X_{2,t}) \), the **cross-covariance function** is \( \gamma_{1,2}(h) = \mathbb{E}[(X_{1,t+h} - \mu_1)(X_{2,t} - \mu_2)] \). Unlike the univariate ACVF, the cross-covariance is not necessarily symmetric: \( \gamma_{1,2}(h) \neq \gamma_{2,1}(h) \) in general. The **cross-correlation function** is \( \rho_{1,2}(h) = \gamma_{1,2}(h)/\sqrt{\gamma_1(0)\gamma_2(0)} \). Under independent strong white-noise components, \( \sqrt{T}\hat{\rho}_{1,2}(h) \xrightarrow{d} \mathcal{N}(0,1) \), so the usual \( \pm 1.96/\sqrt{T} \) bounds apply.

## Transfer Function and ARIMAX Models

<div class="definition">
<strong>ARMAX</strong>: A series \( Y_t \) follows an <em>ARMAX model</em> if
\[
\phi(B)Y_t = \beta X_t + \theta(B)Z_t
\]
where \( X_t \) is an exogenous covariate (contemporaneous), \( \beta \) is a regression coefficient, and \( Z_t \) is white noise.
</div>

More generally, the **transfer function model** allows dynamic (lagged) effects of \( X_t \) on \( Y_t \):

\[
Y_t = \frac{\beta(B)}{\nu(B)} X_t + \frac{\theta(B)}{\phi(B)} Z_t.
\]

Estimation proceeds by: (1) estimating \( \beta \) by OLS to obtain residuals \( \hat{V}_t = Y_t - \hat{\beta} X_t \); (2) fitting an ARIMA model to \( \hat{V}_t \). For the full transfer function, "pre-whitening" the input series \( X_t \) by fitting its own ARIMA model allows identification of the impulse response function \( \{v_j\} \) via cross-correlation with the pre-whitened output \( Y_t \).

# Chapter 12: Advanced Topics

## Diebold-Mariano Test (Formal Statement)

The Diebold-Mariano test rests on the asymptotic normality of \( \bar{D} \), which in turn requires the long-run variance of \( \{D_t\}_{t \geq t_r+1} \) to be consistently estimable. This holds under weak stationarity of \( D_t \) — guaranteed when both model forecasts and the true series are stationary. The test formally requires:

\[
\mathrm{DM}_T = \frac{\sqrt{T}\bar{D}}{\hat{\sigma}_\mathrm{LRV}(D)} \xrightarrow{d} \mathcal{N}(0,1) \text{ under } H_0: \mathbb{E}[D_t] = 0.
\]

The test can be applied with any loss function \( L(\cdot) \), including squared error, absolute error, or quantile (pinball) loss.

## Neural Network Autoregression

A **neural network AR (NNAR(\(p,k\)))** model with \( p \) inputs and \( k \) hidden neurons is:

\[
\hat{X}_{t+1} = f(X_t, X_{t-1}, \ldots, X_{t-p+1}; \mathbf{w})
\]

where \( f \) is a multi-layer perceptron. Each hidden neuron computes \( z_j = b_j + \sum w_{ij} x_i \), then passes through a sigmoid activation \( S(z) = 1/(1 + e^{-z}) \). With \( k = 0 \) (no hidden layer), NNAR(\(p,0\)) = AR(\(p\)).

Seasonal NNAR models (NNSAR) include seasonal lags \( X_{t-m}, \ldots, X_{t-Pm} \) as additional inputs. Parameters are estimated by OLS (minimizing squared residuals). Model selection: use cross-validation to choose \( p, k, P \). Bootstrap prediction intervals are constructed by iterating the model with bootstrap residuals.

Neural networks excel when the true relationship between \( X_{t+1} \) and past values is highly non-linear. In empirical comparisons (the M3-Competition and others), combinations of classical ARIMA and exponential smoothing methods often outperform purely neural approaches for standard economic/business series, though deep learning methods have become competitive on large datasets.

## Comprehensive ARMA Model Building Example

The following illustrates the full Box-Jenkins methodology on a non-seasonal series.

**Step 1 — Identification.** Plot the series. If non-stationary (upward trend, slowly decaying ACF), difference until the sample ACF decays quickly. Apply the KPSS test to confirm. For the global temperature series, first-differencing yields a series with rapidly decaying ACF, consistent with \( d = 1 \).

**Step 2 — Order selection.** Inspect sample ACF and PACF of the differenced series:
- ACF cuts off at lag \( q \) → MA(\(q\)) structure.
- PACF cuts off at lag \( p \) → AR(\(p\)) structure.
- Both decay geometrically → ARMA(\(p,q\)) needed.

Fit all plausible models; compare AIC\(_C\).

**Step 3 — Estimation.** Fit the selected ARIMA(\(p,d,q\)) by MLE. Verify that all roots of \( \phi(z) \) and \( \theta(z) \) are outside the unit disk (causality and invertibility).

**Step 4 — Diagnostic checking.** Compute standardized residuals \( \hat{W}_t = (X_t - \hat{X}_{t \mid t-1})/\sqrt{\hat{P}_{t-1}^t} \). Check:
- Sample ACF of \( \hat{W}_t \): should fall within \( \pm 1.96/\sqrt{T} \) for most lags.
- Ljung-Box test: \( Q(T, H) \) should have \( p \)-value \( > 0.05 \) for \( H = 20 \) or 30.
- QQ-plot: assess normality if Gaussian prediction intervals are desired.

**Step 5 — Forecasting.** Compute \( \hat{X}_{T+h \mid T} \) via the truncated ARMA prediction recursion and construct prediction intervals as \( \hat{X}_{T+h \mid T} \pm z_{0.025}\sqrt{\hat{P}_T^{T+h}} \).

## Summary of Key Model Classes

| Model | Stationarity | Serial correlation | Conditional variance |
|---|---|---|---|
| White noise (strong) | Yes | None | Constant |
| ARMA(\(p,q\)) | Yes | Yes (ACVF geometric) | Constant |
| ARIMA(\(p,d,q\)) | After differencing | Yes | Constant |
| SARIMA | After differencing | Seasonal + non-seasonal | Constant |
| ETS | Trend/seasonal modeled | Implicit | Constant or multiplicative |
| GARCH(\(p,q\)) | Yes (weak white noise) | None in levels | Dynamic |
| VAR(\(p\)) | Yes | Yes (multivariate) | Constant |
| State-space | Flexible | Yes | Flexible |

# Chapter 13: Long-Run Inference, Stationarity Testing, and Forecast Comparison

## Asymptotics of the Sample Mean

When observations are dependent, the classical formula \( \mathrm{V}(\bar{X}) = \sigma^2/T \) is wrong. For a weakly stationary process with autocovariance function \( \gamma(h) \), a direct calculation gives

\[
\mathrm{V}(\bar{X}) = \frac{1}{T^2} \sum_{i=1}^{T} \sum_{j=1}^{T} \gamma(i - j) = \frac{1}{T} \sum_{h=1-T}^{T-1} \left(1 - \frac{|h|}{T}\right)\gamma(h) \approx \frac{\sigma^2_{\mathrm{LRV}}}{T},
\]

where the **long-run variance** is

\[
\sigma^2_{\mathrm{LRV}} = \sum_{h=-\infty}^{\infty} \gamma(h).
\]

Under mild mixing conditions (e.g., the process is a linear process with square-summable coefficients), the CLT still holds:

<div class="theorem">
<strong>CLT for stationary time series</strong>: If \( \{X_t\} \) is strictly stationary and suitably weakly dependent with \( \mathrm{V}(X_t) < \infty \), then
\[ \sqrt{T}(\bar{X} - \mu) \xrightarrow{D} \mathcal{N}(0, \sigma^2_{\mathrm{LRV}}). \]
</div>

This theorem justifies a mean-testing procedure for dependent data: to test \( H_0\colon \mu = \mu_0 \), form the statistic \( Z_T = \sqrt{T}(\bar{X} - \mu_0)/\hat{\sigma}_{\mathrm{LRV}} \) and compare to a standard normal (or, more conservatively, a \( t_{T-1} \) distribution).

## Estimating the Long-Run Variance

The naive plug-in estimator \( \sum_{h=1-T}^{T-1} \hat{\gamma}(h) \) is inconsistent: the sample autocovariances at large lags \( h \approx T-1 \) are estimated from only one or two pairs of observations and are wildly variable. The standard remedy is truncation.

<div class="definition">
<strong>Truncated long-run variance estimator</strong>: Given a bandwidth \( H = H(T) \), the truncated LRV estimator is
\[ \hat{\sigma}^2_{\mathrm{LRV}} = \sum_{h=-H}^{H} \hat{\gamma}(h). \]
For consistency we require \( H \to \infty \) and \( H/T \to 0 \) as \( T \to \infty \). Two common default choices in R are \( H(T) = \lfloor 4(T/100)^{1/4} \rfloor \) and \( H(T) = \lfloor 12(T/100)^{1/4} \rfloor \).
</div>

The truncated estimator is not guaranteed to be non-negative, but in practice it rarely causes problems for typical economic time series of length \( T \geq 100 \). More sophisticated estimators (e.g., Bartlett or Parzen kernel estimators) weight large-lag autocovariances down smoothly and are always non-negative by construction.

## The KPSS Test

Most unit-root tests (notably the Augmented Dickey-Fuller test) place non-stationarity under the null hypothesis and stationarity under the alternative. The **KPSS test** (Kwiatkowski, Phillips, Schmidt, Shin, 1992) reverses this: the null is stationarity, and non-stationarity is the alternative. This reversal matters because failing to reject ADF is weak evidence of stationarity, whereas rejecting KPSS is strong evidence against it.

The test statistic is built from the cumulative partial-sum process. Define

\[
S_T(x) = \frac{1}{\sqrt{T}} \sum_{t=1}^{\lfloor Tx \rfloor} (X_t - \bar{X}), \qquad x \in [0,1].
\]

Large fluctuations in \( S_T(x) \) as \( x \) varies signal a change in level or a random-walk component. The KPSS statistic measures these fluctuations:

\[
\mathrm{KPSS}_T = \frac{1}{T \hat{\sigma}^2_{\mathrm{LRV}}} \sum_{t=1}^{T} S_T(t/T)^2.
\]

<div class="theorem">
<strong>KPSS limiting distribution</strong>: Under \( H_0 \) (stationarity), \( \mathrm{KPSS}_T \xrightarrow{D} \int_0^1 B^2(x)\,dx \), where \( B(x) = W(x) - xW(1) \) is a standard Brownian bridge and the limiting distribution is the Cramér-von Mises distribution. Under \( H_A \) (unit root, level shift, or deterministic trend), \( \mathrm{KPSS}_T \xrightarrow{P} \infty \).
</div>

In practice, the KPSS and ADF tests are used together. If ADF rejects (evidence of stationarity) and KPSS does not reject (no evidence against stationarity), we are reasonably confident the series is stationary. If both reject, the evidence is conflicting and further investigation is needed.

The KPSS test is powerful against level shifts, deterministic trends, and random walks. It is not powerful against heteroscedasticity (changing variance without a change in mean), because the test statistic is normalized by \( \hat{\sigma}^2_{\mathrm{LRV}} \), which absorbs variance changes.

## The Diebold-Mariano Test

After fitting two competing forecasting models \( M_1 \) and \( M_2 \) and evaluating their cross-validation errors on a test set of \( T \) observations, one model will invariably have smaller empirical loss. The question is whether this difference is statistically significant. The **Diebold-Mariano (DM) test** (1995) provides a formal answer.

Define the loss differential at each test observation as \( D_t = L(\hat{e}_{t,1}) - L(\hat{e}_{t,2}) \), where \( L \) is a loss function such as squared error and \( \hat{e}_{t,i} = X_t - \hat{X}_{t,i} \) is the forecast error from model \( i \). The null hypothesis is equal predictive accuracy: \( H_0\colon \mathbb{E}[D_t] = 0 \).

The test statistic is a dependent \( z \)-test for the mean of \( \{D_t\} \):

\[
\mathrm{DM}_T = \frac{\sqrt{T}\,\bar{D}}{\hat{\sigma}_{\mathrm{LRV}}(D)} \xrightarrow{D} \mathcal{N}(0,1),
\]

with \( p\text{-value} = P(|Z| > |\mathrm{DM}_T|) \). The long-run variance of \( D_t \) is estimated by the truncated estimator above, which accounts for serial correlation in the loss differentials induced by overlapping forecast windows.

The DM test is valid under weak conditions: the loss differentials \( D_t \) need only be stationary and weakly dependent. In particular, it does not require the two models to be nested, nor does it assume the innovations are Gaussian. This generality makes it the standard tool for forecast comparison in practice.

# Chapter 14: Multivariate Time Series and VAR Models

## Cross-Covariance and Cross-Correlation

When we observe a vector-valued process \( \mathbf{X}_t = (X_{1,t}, \ldots, X_{d,t})^\top \in \mathbb{R}^d \), the single autocovariance function \( \gamma(h) \) is replaced by an entire matrix-valued function.

<div class="definition">
<strong>Autocovariance matrix</strong>: For a weakly stationary multivariate process, the autocovariance matrix at lag \( h \) is
\[ \Gamma(h) = \mathbb{E}[(\mathbf{X}_{t+h} - \boldsymbol{\mu})(\mathbf{X}_t - \boldsymbol{\mu})^\top] \in \mathbb{R}^{d \times d}. \]
Note that \( \Gamma(h) = \Gamma(-h)^\top \) (not symmetric in general, unlike the scalar case), and the diagonal entry \( \Gamma(h)[i,i] = \gamma_i(h) \) is the ordinary ACVF of component \( X_{i,t} \).
</div>

The off-diagonal entries encode the **cross-covariance** between components at different lags:

\[
\gamma_{i,j}(h) = \mathbb{E}[(X_{i,t+h} - \mu_i)(X_{j,t} - \mu_j)] = \Gamma(h)[i,j].
\]

Note that \( \gamma_{i,j}(h) \neq \gamma_{i,j}(-h) \) in general, so the cross-covariance function is not symmetric in \( h \): the correlation of \( X_{i,t+h} \) with \( X_{j,t} \) measures how much \( X_j \) at time \( t \) leads \( X_i \) at time \( t+h \).

The **autocorrelation matrix** is obtained by standardizing: \( R(h)[i,j] = \Gamma(h)[i,j] / \sqrt{\Gamma(0)[i,i]\,\Gamma(0)[j,j]} \). The empirical version \( \hat{R}(h) \) has entries that are asymptotically standard normal when both component series are strong white noise, so the familiar \( \pm 1.96/\sqrt{T} \) bounds apply for detecting "significant" cross-correlation.

## Vector Autoregressive Models

The natural multivariate extension of AR(\(p\)) is the **Vector Autoregressive** model.

<div class="definition">
<strong>VAR(\(p\))</strong>: A weakly stationary process \( \{\mathbf{X}_t\} \) follows a VAR(\(p\)) model if there exist coefficient matrices \( A_1, \ldots, A_p \in \mathbb{R}^{d \times d} \) and a strong white noise \( \{\mathbf{W}_t\} \) in \( \mathbb{R}^d \) with \( \mathrm{V}(\mathbf{W}_t) = \Sigma_W \) such that
\[ \mathbf{X}_t = A_1\mathbf{X}_{t-1} + \cdots + A_p\mathbf{X}_{t-p} + \mathbf{W}_t. \]
A stationary causal solution exists if and only if \( \det(\mathbf{I} - A_1 z - \cdots - A_p z^p) \neq 0 \) for all \( |z| \leq 1 \).
</div>

For \( p = 1 \), the stationary solution has the form \( \mathbf{X}_t = \sum_{\ell=0}^{\infty} A^\ell \mathbf{W}_{t-\ell} \) provided \( \|A\|_{\mathrm{op}} < 1 \). The condition \( \|A\|_{\mathrm{op}} < 1 \) is stronger than the spectral radius condition, but is sufficient. In general, the spectral radius condition \( \rho(A) < 1 \) (all eigenvalues of \( A \) inside the unit disk) is necessary and sufficient for VAR(1) causality.

**Estimation** is remarkably simple: because the VAR equations are decoupled across components given the past, OLS applied equation-by-equation is consistent and asymptotically efficient when the noise covariance matrix \( \Sigma_W \) is unrestricted. Specifically,

\[
\hat{A}_1, \ldots, \hat{A}_p = \arg\min_{A_1,\ldots,A_p} \sum_{t=p+1}^{T} \|\mathbf{X}_t - A_1\mathbf{X}_{t-1} - \cdots - A_p\mathbf{X}_{t-p}\|^2.
\]

**Model selection** for the lag order \( p \) uses AIC or BIC with the multivariate log-likelihood. A multivariate **Portmanteau test** (Hosking, 1980; Li and McLeod, 1981) checks whether the VAR residuals are white noise:

\[
P_{T,H} = T \sum_{h=1}^{H} \mathrm{tr}(\hat{\Gamma}_h^\top \hat{\Gamma}_0^{-1} \hat{\Gamma}_h \hat{\Gamma}_0^{-1}) \xrightarrow{D} \chi^2(d^2 H),
\]

with \( p\text{-value} = P(\chi^2(d^2 H) > P_{T,H}) \).

VAR models are widely used in macroeconomics (Sims, 1980) as a data-driven alternative to structural models. Their main limitation is the rapid growth in parameters: a VAR(\(p\)) in \( d \) components has \( d^2 p + d(d+1)/2 \) parameters (including \( \Sigma_W \)). For moderate \( d \) and \( p \), the parameter count quickly exceeds the sample size, motivating regularized estimation (LASSO-VAR) or Bayesian approaches.

## Transfer Function Models and ARMAX

When one of the observed time series is an exogenous predictor rather than an endogenous variable, the appropriate model is a **transfer function model**. Suppose \( (Y_t, X_t) \) is a bivariate series and we wish to forecast \( Y_{T+h} \) using past values of both series.

<div class="definition">
<strong>ARMAX model</strong>: \( Y_t \) follows an ARMAX model if there exists a strong white noise \( \{Z_t\} \) such that
\[ \phi(B)Y_t = \beta X_t + \theta(B)Z_t, \]
which can be rearranged as \( Y_t = (\beta/\phi(B))X_t + (\theta(B)/\phi(B))Z_t \). The term \( \beta X_t \) is a contemporaneous regression on the covariate.
</div>

More generally, the **transfer function model** allows a distributed-lag response:

\[
Y_t = \frac{\beta(B)}{\nu(B)} X_t + \frac{\theta(B)}{\phi(B)} Z_t,
\]

where \( \beta(B)/\nu(B) = \sum_{j \geq 0} v_j B^j \) is the impulse-response function (the dynamic multiplier showing how a unit shock to \( X_t \) propagates into \( Y_t \) over subsequent periods). When both series are non-stationary, the model is an **ARIMAX**, applying \( (1-B)^d \) to both sides before fitting.

**Fitting** in the simplest case (regression with ARIMA errors) is a two-step procedure: (1) estimate the contemporaneous regression coefficient \( \hat{\beta} \) by OLS and compute residuals \( \hat{V}_t = Y_t - \hat{\beta}X_t \); (2) fit an ARIMA model to \( \hat{V}_t \). For the full transfer function, a **pre-whitening** approach can identify the impulse-response weights: filter \( X_t \) through its own ARIMA model to obtain white noise \( \alpha_t \), apply the same filter to \( Y_t \) to obtain \( \beta_t \), and then estimate \( v_j = \mathbb{E}[\beta_t \alpha_{t-j}]/\sigma_\alpha^2 \) by the sample cross-correlation of \( \beta_t \) with \( \alpha_t \).

# Chapter 15: State-Space Models and the Kalman Filter

## The Linear Gaussian State-Space Model

The **state-space model** (also called a Dynamic Linear Model) provides a powerful unifying framework that subsumes ARMA, ETS, GARCH, and VAR models as special cases. It is especially valuable when the quantity of interest (the state \( \mathbf{X}_t \)) is only partially or noisily observed through \( \mathbf{Y}_t \).

<div class="definition">
<strong>Linear Gaussian state-space model</strong>: A bivariate process \( (\mathbf{Y}_t, \mathbf{X}_t) \) with \( \mathbf{Y}_t \in \mathbb{R}^d \) and \( \mathbf{X}_t \in \mathbb{R}^p \) follows a linear Gaussian state-space model if
\[
\text{Observation:}\quad \mathbf{Y}_t = A_t \mathbf{X}_t + \Gamma \mathbf{u}_t + \mathbf{V}_t, \qquad \mathbf{V}_t \sim \mathcal{N}_d(\mathbf{0}, R),
\]
\[
\text{State:}\quad \mathbf{X}_t = \Phi \mathbf{X}_{t-1} + \xi \mathbf{u}_t + \mathbf{W}_t, \qquad \mathbf{W}_t \sim \mathcal{N}_p(\mathbf{0}, Q),
\]
where \( A_t \) is a known \( d \times p \) design matrix, \( \mathbf{u}_t \) are exogenous inputs, and \( \mathbf{V}_t, \mathbf{W}_t \) are mutually independent noise sequences also independent of all past states and observations.
</div>

The observation noise \( \mathbf{V}_t \) models measurement error, while the state noise \( \mathbf{W}_t \) models genuine dynamical randomness in the latent process. The design matrix \( A_t \) may vary with time, allowing the model to handle periodic phenomena (seasonal state-space), missing observations (set \( A_t = 0 \) at missing times), and regime changes.

To connect this to familiar models: every ARMA(\(p,q\)) process has a state-space representation with \( r = \max(p, q+1) \), state vector \( \mathbf{X}_t = (X_{t-r+1}, \ldots, X_t)^\top \in \mathbb{R}^r \), and companion matrix structure. Similarly, all ETS models have state-space representations where the state vector tracks the level, trend, and seasonal components.

## The Kalman Filter

Given the linear Gaussian model, the fundamental inference goal is to compute the conditional distribution \( \mathbf{X}_t \mid \mathbf{Y}_1, \ldots, \mathbf{Y}_t \). Because everything is jointly Gaussian, this conditional distribution is itself Gaussian: it suffices to track its mean \( \mathbf{X}_t^t = \mathbb{E}[\mathbf{X}_t \mid \mathbf{Y}_1, \ldots, \mathbf{Y}_t] \) and covariance matrix \( P_t^t = \mathrm{Cov}(\mathbf{X}_t - \mathbf{X}_t^t) \). The **Kalman filter** (Rudolf Kalman, 1960) computes these recursively in two alternating steps.

The **prediction step** (before observing \( \mathbf{Y}_t \)) propagates the state estimate forward through the state equation:

\[
\mathbf{X}_t^{t-1} = \Phi \mathbf{X}_{t-1}^{t-1} + \xi \mathbf{u}_t, \qquad P_t^{t-1} = \Phi P_{t-1}^{t-1} \Phi^\top + Q.
\]

The **update step** (after observing \( \mathbf{Y}_t = \mathbf{y}_t \)) incorporates the new information:

\[
\mathbf{X}_t^t = \mathbf{X}_t^{t-1} + K_t(\mathbf{y}_t - A_t \mathbf{X}_t^{t-1} - \Gamma \mathbf{u}_t), \qquad P_t^t = (I - K_t A_t) P_t^{t-1},
\]

where the **Kalman gain**

\[
K_t = P_t^{t-1} A_t^\top \left[A_t P_t^{t-1} A_t^\top + R\right]^{-1}
\]

balances the uncertainty in the prediction (\( P_t^{t-1} \)) against the measurement noise (\( R \)). When the state prediction is very uncertain (\( P_t^{t-1} \) large) and the observation is precise (\( R \) small), the gain \( K_t \) is close to its maximum and we trust the new observation heavily. In the opposite limit, we trust the prediction and barely update.

The innovation \( \boldsymbol{\varepsilon}_t = \mathbf{y}_t - A_t \mathbf{X}_t^{t-1} - \Gamma \mathbf{u}_t \sim \mathcal{N}(\mathbf{0},\, A_t P_t^{t-1} A_t^\top + R) \) is the one-step-ahead forecast error. The Gaussian log-likelihood can be evaluated via this prediction-error decomposition:

\[
\ell(\boldsymbol{\theta}) = -\frac{1}{2}\sum_{t=1}^{T} \left[\log \det(A_t P_t^{t-1} A_t^\top + R) + \boldsymbol{\varepsilon}_t^\top (A_t P_t^{t-1} A_t^\top + R)^{-1} \boldsymbol{\varepsilon}_t\right],
\]

which is maximized over the parameter vector \( \boldsymbol{\theta} = (\Phi, Q, R, \xi, \Gamma)^\top \) by numerical methods (Newton-Raphson, EM algorithm, or MCMC).

## The Kalman Smoother

The Kalman filter gives the best estimate of \( \mathbf{X}_t \) using only data up to time \( t \) — an online algorithm suitable for real-time forecasting. When the entire series \( \mathbf{Y}_1, \ldots, \mathbf{Y}_T \) is available, a retrospective estimate \( \mathbf{X}_t^T = \mathbb{E}[\mathbf{X}_t \mid \mathbf{Y}_1, \ldots, \mathbf{Y}_T] \) incorporating future observations is better. The **Rauch-Tung-Striebel smoother** computes this backward pass after the forward Kalman filter:

\[
\mathbf{X}_{t-1}^T = \mathbf{X}_{t-1}^{t-1} + J_{t-1}(\mathbf{X}_t^T - \mathbf{X}_t^{t-1}), \qquad P_{t-1}^T = P_{t-1}^{t-1} + J_{t-1}(P_t^T - P_t^{t-1})J_{t-1}^\top,
\]

where the smoother gain is \( J_{t-1} = P_{t-1}^{t-1} \Phi^\top [P_t^{t-1}]^{-1} \). Initialized at \( \mathbf{X}_T^T \) and \( P_T^T \) from the Kalman filter, the smoother sweeps backward for \( t = T, T-1, \ldots, 1 \).

## Missing Data Imputation via Kalman Smoothing

One elegant application of the state-space framework is imputing missing observations in a time series. Suppose \( Y_t \) has a subset of missing values. We can embed the series in a state-space model where the state \( X_t \) follows the ARIMA specification thought to fit the data, and the design matrix is

\[
A_t = \begin{cases} 1 & \text{if } Y_t \text{ is observed,} \\ 0 & \text{if } Y_t \text{ is missing.} \end{cases}
\]

When \( A_t = 0 \), the observation equation provides no information, and the update step reduces to \( \mathbf{X}_t^t = \mathbf{X}_t^{t-1} \) (no update). Kalman smoothing then produces the retrospective estimate \( X_t^T \) at every time point including the missing ones, effectively interpolating the series in a model-consistent way. The estimated variance \( P_t^T \) at missing times quantifies the uncertainty in the imputed values and can be used to construct imputation intervals.

# Chapter 16: GARCH Diagnostics, Estimation, and Value at Risk

## Testing for Conditional Heteroscedasticity

A GARCH process \( X_t = \sigma_t W_t \) has zero serial correlation in levels but exhibits serial correlation in the squared series \( X_t^2 \). This is the key diagnostic signature. Recall that for an ARCH(1), \( X_t^2 = \omega + \alpha X_{t-1}^2 + V_t \) where \( V_t = \sigma_t^2(W_t^2 - 1) \) is a weak white noise, so \( X_t^2 \) literally follows an AR(1) with weak innovation. More generally, \( X_t \sim \mathrm{GARCH}(p,q) \) implies \( X_t^2 \) follows an ARMA process with weak white noise innovations.

<div class="theorem">
<strong>McLeod-Li (portmanteau) test for GARCH</strong>: Let \( \hat{\rho}_{X^2}(h) \) denote the sample ACF of \( X_t^2 \). Under the null hypothesis that \( X_t \) is a strong white noise with \( \mathbb{E}[X^4] < \infty \),
\[ Q(T, H) = T \sum_{h=1}^{H} \hat{\rho}_{X^2}(h)^2 \xrightarrow{D} \chi^2(H). \]
Under a GARCH alternative, \( Q(T, H) \xrightarrow{P} \infty \). A small \( p\text{-value} = P(\chi^2(H) \geq Q(T,H)) \) is evidence of conditional heteroscedasticity.
</div>

In practice one applies the McLeod-Li test to residuals from a fitted ARMA model. If the test rejects, a GARCH layer is added to model the residual variance. The test is also used for goodness-of-fit after fitting GARCH: apply it to the standardized residuals \( \hat{W}_t = X_t/\hat{\sigma}_t \) and to their squares to check whether residual conditional heteroscedasticity remains.

## GARCH Parameter Estimation

For an ARCH(\(p\)) model, the squared process follows \( X_t^2 = \omega + \alpha_1 X_{t-1}^2 + \cdots + \alpha_p X_{t-p}^2 + V_t \), so OLS on \( X_t^2 \) regressed on \( X_{t-1}^2, \ldots, X_{t-p}^2 \) is consistent and, under \( \mathbb{E}[X^8] < \infty \), asymptotically Gaussian.

For general GARCH(\(p,q\)) models the **quasi-maximum likelihood estimator (QMLE)** is the benchmark. We write the conditional Gaussian log-likelihood as

\[
\ell(\omega, \boldsymbol{\alpha}, \boldsymbol{\beta}) = -\frac{1}{2}\sum_{t=\max(p,q)+1}^{T} \left[\log \hat{\sigma}_t^2 + \frac{X_t^2}{\hat{\sigma}_t^2}\right],
\]

where the conditional variances are computed recursively from the GARCH equation

\[
\hat{\sigma}_t^2 = \omega + \sum_{j=1}^{p} \alpha_j X_{t-j}^2 + \sum_{k=1}^{q} \beta_k \hat{\sigma}_{t-k}^2,
\]

initialized at \( X_t^2 = \omega \) and \( \hat{\sigma}_t^2 = \omega \) for \( t \leq 0 \). The prefix "quasi" reflects that the Gaussian assumption on \( W_t \) is imposed for computational convenience even when \( W_t \) may have heavier tails. A key result due to Francq and Zakoïan ensures that the QMLE is consistent as long as the true model admits a stationary solution, and efficient when the Gaussian assumption is correctly specified.

**Stationarity constraint**: If we require the solution to be second-order stationary (finite variance), we must impose \( \sum_{j=1}^{p} \alpha_j + \sum_{k=1}^{q} \beta_k < 1 \). This can be verified from the unconditional variance formula \( \sigma_X^2 = \omega/(1 - \sum \alpha_j - \sum \beta_k) \). In practice, financial return series often yield estimates near the boundary \( \sum \alpha_j + \sum \beta_k \approx 1 \) (so-called **IGARCH**), meaning shocks to volatility decay very slowly. The full stationary region (using the top Lyapunov exponent criterion) is slightly larger than the second-order region and is what more sophisticated packages like SAS search over.

**Model selection**: The strong empirical recommendation is to begin with GARCH(1,1), which has been shown to capture most of the conditional heteroscedasticity in daily financial return series (Hansen and Lunde, 2001, showed that more complex GARCH variants rarely outperform GARCH(1,1) on exchange-rate data). For higher-frequency data or after residual diagnostics indicate remaining structure, larger orders or asymmetric variants (EGARCH, GJR-GARCH) may be warranted.

## Value at Risk

**Value at Risk (VaR)** is the principal regulatory and risk-management quantity for financial institutions. Let \( V_t \) denote the value of a portfolio at time \( t \) and \( L_{t,t+h} = -(V_{t+h} - V_t) \) the horizon-\( h \) loss. The horizon-\( h \) VaR at level \( \alpha \) is the \( (1-\alpha) \) conditional quantile of the loss distribution:

\[
\mathrm{VaR}_{t,h}(\alpha) = \inf\{x : P(L_{t,t+h} > x \mid \mathcal{F}_t) \leq \alpha\}.
\]

A correct VaR at level \( \alpha = 0.05 \) means that on only 5% of days the actual loss exceeds the forecast. Under the Gaussian GARCH model,

\[
\mathrm{VaR}_{t,1}(\alpha) = \hat{\sigma}_{t+1} \Phi^{-1}(1 - \alpha),
\]

where \( \hat{\sigma}_{t+1} \) is the one-step-ahead volatility forecast from the fitted GARCH model and \( \Phi^{-1} \) is the standard normal quantile function. If the innovation distribution is instead estimated empirically from GARCH residuals, one replaces \( \Phi^{-1}(1-\alpha) \) with the corresponding empirical quantile.

For the multi-period VaR at horizon \( h > 1 \), two approaches are common: (1) **\(\sqrt{h}\)-scaling**, which assumes i.i.d. Gaussian returns and approximates \( \mathrm{VaR}_{t,h} \approx \sqrt{h}\,\mathrm{VaR}_{t,1} \); (2) **Monte Carlo simulation**, iterating the GARCH recursion with bootstrapped or parametric innovations to simulate the distribution of the \( h \)-step cumulative return and reading off the empirical quantile. The simulation approach is preferred because \( \sqrt{h}\)-scaling ignores the volatility clustering and consistently underestimates tail risk at longer horizons.

**Backtesting** evaluates VaR forecasts by checking whether the empirical exception rate \( T^{-1}\sum_{t} \mathbf{1}\{L_{t,t+1} > \widehat{\mathrm{VaR}}_{t,1}(\alpha)\} \) is close to \( \alpha \). The **RiskMetrics model** (J.P. Morgan, 1994) uses an IGARCH(1,1) with fixed \( \lambda = 0.94 \): \( \sigma_t^2 = \lambda \sigma_{t-1}^2 + (1-\lambda)r_{t-1}^2 \), initialized from the variance of the previous 250 days. Despite its simplicity it performs reasonably well for 1-day VaR but tends to underestimate tails due to the imposed Gaussian assumption.

## Worked Example: GARCH(1,1) on Daily Returns

Suppose we model the daily log-returns \( r_t = \log(V_t/V_{t-1}) \) of a stock index as GARCH(1,1): \( r_t = \sigma_t W_t \) with \( \sigma_t^2 = \omega + \alpha r_{t-1}^2 + \beta \sigma_{t-1}^2 \).

**Identification.** Plot \( r_t \) and \( r_t^2 \). Expect: \( r_t \) looks like white noise (near-zero ACF), but \( r_t^2 \) shows significant positive autocorrelation at several lags. The McLeod-Li test on \( r_t^2 \) rejects the null of no conditional heteroscedasticity.

**Estimation.** QMLE gives, say, \( \hat{\omega} = 0.00001 \), \( \hat{\alpha} = 0.09 \), \( \hat{\beta} = 0.90 \), yielding \( \hat{\alpha} + \hat{\beta} = 0.99 \approx 1 \) — persistence is near-integrated. The unconditional variance is \( \hat{\omega}/(1 - \hat{\alpha} - \hat{\beta}) = 0.00001/0.01 = 0.001 \), so annualized volatility \( \approx \sqrt{0.001 \times 252} \approx 16\% \).

**Diagnostics.** Compute standardized residuals \( \hat{W}_t = r_t/\hat{\sigma}_t \). Check: (a) sample ACF of \( \hat{W}_t \) — should be white noise; (b) sample ACF of \( \hat{W}_t^2 \) — should also be white noise if GARCH structure is fully captured; (c) QQ-plot of \( \hat{W}_t \) against a standard normal to assess tail behavior.

**Forecasting volatility.** One-step ahead: \( \hat{\sigma}_{T+1}^2 = \hat{\omega} + \hat{\alpha} r_T^2 + \hat{\beta} \hat{\sigma}_T^2 \). Multi-step: by recursion, substituting \( \mathbb{E}[r_{T+j}^2 \mid \mathcal{F}_T] = \hat{\sigma}_{T+j}^2 \) for \( j \geq 1 \) past the current time. As \( h \to \infty \), the conditional variance forecast converges to the unconditional variance: \( \hat{\sigma}_{T+h}^2 \to \hat{\omega}/(1 - \hat{\alpha} - \hat{\beta}) \).

**VaR.** The 1-day 5% VaR is \( \hat{\sigma}_{T+1} \times \Phi^{-1}(0.95) \approx \hat{\sigma}_{T+1} \times 1.645 \). If the QQ-plot shows heavier tails than normal, replace \( \Phi^{-1}(0.95) \) with the 95th empirical quantile of \( \hat{W}_t \), which will be larger (say 1.8 to 2.2 for typical stock return series), producing a more conservative risk estimate.

## Estimation Methods: A Comparative Summary

The table below consolidates the estimation strategies across all major model classes encountered in the course.

| Model class | Primary estimator | Key condition for consistency |
|---|---|---|
| AR(\(p\)) | Yule-Walker or OLS | Causality (\(\phi(z) \neq 0\) for \(\|z\| \leq 1\)) |
| MA(\(q\)) | MLE (Gaussian) | Invertibility |
| ARMA(\(p,q\)) | MLE (Gaussian) | Causality + invertibility, no parameter redundancy |
| ARIMA(\(p,d,q\)) | MLE after \(d\)-fold differencing | After differencing, same as ARMA |
| SARIMA | MLE | Causal/invertible seasonal + non-seasonal polynomials |
| ETS | MLE via state-space likelihood | Stability of smoothing recursion |
| ARCH(\(p\)) | OLS on \(X_t^2\) or QMLE | \(\mathbb{E}[X_t^4] < \infty\), stationarity |
| GARCH(\(p,q\)) | QMLE | Stationary causal solution exists |
| VAR(\(p\)) | OLS equation-by-equation | Spectral radius of companion matrix \(< 1\) |
| State-space | Kalman filter + numerical MLE | Model identifiability, initial conditions |

A recurrent theme across all of these is the **Box-Jenkins philosophy**: identify a plausible model class from visual diagnostics (ACF/PACF, residual plots), estimate parameters, check residual diagnostics rigorously, iterate if necessary, and finally use the validated model to forecast. The details differ — Ljung-Box for ARMA, McLeod-Li for GARCH, multivariate portmanteau for VAR — but the logic is the same. A good forecast model should produce residuals that are indistinguishable from white noise on all relevant tests.

The fundamental insight of this course is that the autocorrelation structure of a time series — summarized by the ACF and PACF, and captured parsimoniously by ARMA polynomials — determines both the appropriate model and the optimal forecasting strategy. Transformations and differencing reduce non-stationary data to stationarity; diagnostic tests and information criteria guide model selection; and the Kalman filter/smoother provides a universal algorithm for filtering and prediction within the state-space framework that unifies all these approaches.
