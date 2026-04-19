---
title: "AMATH 900: Mathematics of Climate Change"
subjects: "AMATH"
---

## Sources and References

These notes draw on the following publicly accessible references:

- Pierrehumbert, R. T. *Principles of Planetary Climate*. Cambridge University Press, 2010. (Second edition PDF freely available from the author.)
- Washington, W. M. and Parkinson, C. L. *An Introduction to Three-Dimensional Climate Modeling*. University Science Books, 2005.
- Henderson-Sellers, A. and McGuffie, K. *A Climate Modelling Primer*. Wiley, 4th edition.
- IPCC AR6 Working Group I. *The Physical Science Basis*. 2021. Publicly available at [ipcc.ch](https://www.ipcc.ch/report/ar6/wg1/).
- Strogatz, S. H. *Nonlinear Dynamics and Chaos*. Westview Press, 2nd edition.
- Bishop, C. M. *Pattern Recognition and Machine Learning*. Springer, 2006. (Free PDF from Microsoft Research.)
- Majda, A. J. and Wang, X. *Nonlinear Dynamics and Statistical Theories for Basic Geophysical Flows*. Cambridge University Press, 2006.

---

# Chapter 1: The Physical Basis of Climate

## 1.1 Earth's Energy Budget

Climate is, at its most fundamental level, a thermodynamic phenomenon: the atmosphere, ocean, land surface, and cryosphere collectively respond to a persistent imbalance between incoming solar radiation and outgoing infrared emission. Understanding the mathematics of this balance — and its response to perturbations — forms the conceptual backbone of all climate science.

The Sun delivers energy to Earth at a rate governed by the **solar constant** \( S_0 \approx 1361 \, \text{W m}^{-2} \), defined as the flux of solar radiation incident on a surface perpendicular to the Sun-Earth line at the mean orbital distance of one astronomical unit. Because Earth is a sphere, only one quarter of its surface area intercepts incoming radiation at any instant, so the globally averaged incident flux is \( S_0 / 4 \approx 340 \, \text{W m}^{-2} \).

Not all of this incident radiation is absorbed. Earth's **planetary albedo** \( \alpha \) (approximately 0.30 under present conditions) represents the fraction reflected back to space by clouds, aerosols, ice, and bright land surfaces. The absorbed solar flux averaged over Earth's surface is therefore

\[
Q_{\text{in}} = \frac{S_0 (1 - \alpha)}{4} \approx 238 \, \text{W m}^{-2}.
\]

In equilibrium, this must equal the outgoing longwave radiation \( Q_{\text{out}} \) emitted as thermal infrared by Earth's surface and atmosphere. Departures from this balance — whether due to changes in solar output, volcanic eruptions, or the accumulation of greenhouse gases — drive changes in the climate state.

## 1.2 Blackbody Radiation

To quantify outgoing radiation, one invokes the physics of thermal emission. A **blackbody** is an idealized object that absorbs all incident radiation and emits according to the **Planck function**

\[
B_\nu(T) = \frac{2 h \nu^3}{c^2} \frac{1}{e^{h\nu / k_B T} - 1},
\]

where \( \nu \) is frequency, \( T \) is absolute temperature, \( h \) is Planck's constant, \( c \) is the speed of light, and \( k_B \) is Boltzmann's constant. Integrating \( B_\nu \) over all frequencies and solid angles yields the total emitted flux

\[
F = \sigma T^4,
\]

where \( \sigma = 5.67 \times 10^{-8} \, \text{W m}^{-2} \text{K}^{-4} \) is the **Stefan-Boltzmann constant**. This relation — known as the **Stefan-Boltzmann law** — is the cornerstone of energy balance analysis. If Earth radiated as a perfect blackbody at a single effective temperature \( T_e \), the energy balance condition \( \sigma T_e^4 = Q_{\text{in}} \) gives

\[
T_e = \left( \frac{S_0 (1-\alpha)}{4\sigma} \right)^{1/4} \approx 255 \, \text{K}.
\]

Earth's observed global mean surface temperature is approximately 288 K — some 33 K warmer. This discrepancy is the fingerprint of the **greenhouse effect**.

## 1.3 The Greenhouse Effect and Radiative Forcing

The greenhouse effect arises because the atmosphere is largely transparent to incoming shortwave solar radiation but partially opaque to outgoing longwave infrared. Greenhouse gases — water vapor, carbon dioxide, methane, nitrous oxide, and others — absorb and re-emit thermal infrared, effectively reducing the rate at which energy escapes to space. This forces the surface to warm until emission from higher, cooler levels in the atmosphere restores top-of-atmosphere balance.

The quantitative measure of how a given change in atmospheric composition alters the energy budget is called **radiative forcing**. For a doubling of CO\(_2\) concentration relative to pre-industrial levels, the instantaneous radiative forcing at the tropopause is approximately \( \Delta F \approx 3.7 \, \text{W m}^{-2} \), derived from line-by-line radiative transfer calculations. The logarithmic dependence of forcing on CO\(_2\) concentration \( C \) is often written

\[
\Delta F = \alpha_{\text{CO}_2} \ln\!\left(\frac{C}{C_0}\right),
\]

where \( C_0 \) is the reference concentration and \( \alpha_{\text{CO}_2} \approx 5.35 \, \text{W m}^{-2} \).

## 1.4 The Keeling Curve and CO\(_2\) Records

Systematic measurements of atmospheric CO\(_2\) have been conducted at Mauna Loa Observatory since 1958, producing the iconic **Keeling curve**. This record reveals two superimposed signals: a seasonal oscillation driven by the annual cycle of Northern Hemisphere vegetation, and a relentless long-term increase from approximately 315 ppm in 1958 to over 420 ppm by the mid-2020s. The rate of increase has itself accelerated, from roughly 1 ppm yr\(^{-1}\) in the 1960s to over 2.5 ppm yr\(^{-1}\) in the 2020s, reflecting growing global emissions.

## 1.5 Ice Cores and Paleoclimate Proxies

Ice cores extracted from Greenland and Antarctica provide a remarkable archive of past climate. Air bubbles trapped in the ice preserve ancient atmospheric samples, allowing direct measurement of CO\(_2\) and methane concentrations going back over 800,000 years. The **deuterium** or **\(\delta^{18}\text{O}\)** isotopic composition of the ice itself serves as a temperature proxy: lighter isotopes evaporate more readily from the ocean and condense preferentially at moderate temperatures, so ice deposited during cold glacial periods is enriched in the lighter isotope relative to warm interglacials.

These records reveal a striking correlation between Antarctic temperature and greenhouse gas concentrations across multiple glacial-interglacial cycles. They also reveal the Milankovitch frequencies (discussed in Chapter 2) imprinted in climate. The pre-industrial CO\(_2\) range over the past 800,000 years was approximately 180–280 ppm; present concentrations have no analog in this record and are unprecedented on timescales of millions of years.

---

# Chapter 2: Energy Balance Models

## 2.1 The Zero-Dimensional Energy Balance Model

The simplest mathematical model of Earth's mean temperature treats the planet as a single well-mixed body exchanging radiation with space. This **zero-dimensional energy balance model** (EBM) balances the rate of energy storage against net radiative fluxes:

\[
C \frac{dT}{dt} = \frac{S_0}{4}(1-\alpha(T)) - \sigma T^4,
\]

where \( C \) (units J m\(^{-2}\) K\(^{-1}\)) is the effective heat capacity of the climate system (dominated by the ocean mixed layer), \( T \) is global mean surface temperature, and \( \alpha(T) \) is a temperature-dependent albedo reflecting the ice-albedo feedback.

At equilibrium, \( dT/dt = 0 \) and the right side vanishes. Defining \( R_{\text{in}}(T) = S_0(1-\alpha)/4 \) and \( R_{\text{out}}(T) = \sigma T^4 \) (or a linearized approximation thereof), equilibrium occurs at the intersection of incoming and outgoing curves in the \( (T, R) \) plane. Multiple intersections correspond to multiple stable and unstable equilibria.

## 2.2 Ice-Albedo Feedback

A crucial nonlinearity arises from the **ice-albedo feedback**: cold temperatures promote ice formation, which increases albedo, which reduces absorbed solar energy, which further cools the planet. A simple parameterization captures this:

\[
\alpha(T) = \begin{cases} \alpha_{\text{ice}} & T < T_1 \\ \alpha_{\text{ice}} + (\alpha_{\text{land}} - \alpha_{\text{ice}})\dfrac{T - T_1}{T_2 - T_1} & T_1 \le T \le T_2 \\ \alpha_{\text{land}} & T > T_2, \end{cases}
\]

where \( \alpha_{\text{ice}} \approx 0.6 \), \( \alpha_{\text{land}} \approx 0.3 \), and \( T_1, T_2 \) are transition temperatures. With this nonlinear albedo, the EBM can exhibit three equilibria: a warm state (present-day climate), an unstable intermediate state, and a cold **snowball Earth** state in which the entire planet is glaciated.

## 2.3 The Budyko-Sellers Model

The Budyko-Sellers model extends the zero-dimensional EBM to one spatial dimension, resolving latitudinal structure. In the Budyko formulation, the meridional heat transport is parameterized diffusively and outgoing longwave radiation is linearized around a reference temperature:

\[
C \frac{\partial T}{\partial t} = \frac{S_0}{4} s(x)(1-\alpha(x,T)) - \left\lbrack A + B T \right\rbrack + D \frac{\partial^2 T}{\partial x^2},
\]

where \( x = \sin\phi \) is the sine of latitude \( \phi \), \( s(x) \) is the latitudinal distribution of solar insolation, \( A \) and \( B \) are empirical constants relating outgoing longwave radiation to temperature (\( R_{\text{out}} \approx A + BT \) with \( A \approx 210 \, \text{W m}^{-2} \) and \( B \approx 2 \, \text{W m}^{-2} \text{K}^{-1} \)), and \( D \) is a diffusive heat transport coefficient.

This PDE admits both a warm and a cold equilibrium, and the stability of the ice line — the latitude at which the surface transitions from ice-free to ice-covered — can be analyzed by linearizing about each steady state.

## 2.4 Stability Analysis of EBM Equilibria

To assess the stability of an equilibrium \( T^* \), one linearizes the zero-dimensional EBM. Setting \( T = T^* + \epsilon \) and expanding to first order:

\[
C \frac{d\epsilon}{dt} = \left.\frac{d}{dT}\left\lbrack R_{\text{in}}(T) - R_{\text{out}}(T) \right\rbrack\right|_{T^*} \epsilon \equiv \lambda \epsilon.
\]

The equilibrium is stable if \( \lambda < 0 \) and unstable if \( \lambda > 0 \). The stability condition

\[
\lambda = \frac{S_0}{4} \frac{d(1-\alpha)}{dT} - 4\sigma (T^*)^3 < 0
\]

shows that a strongly positive ice-albedo feedback (large \( d\alpha/dT < 0 \)) can overcome the stabilizing radiative restoring force, leading to instability and a rapid transition to snowball Earth.

## 2.5 The Snowball Earth Bifurcation

As the solar constant \( S_0 \) or greenhouse gas concentration is varied, the number and character of equilibria can change. This is a classical **fold bifurcation** (saddle-node bifurcation) in the theory of dynamical systems. When \( S_0 \) is reduced sufficiently, the warm and unstable equilibria merge and annihilate, leaving only the snowball state. Conversely, for the snowball to deglaciate requires a very large increase in \( S_0 \) (or greenhouse forcing), because the high-albedo ice surface strongly suppresses absorption.

This hysteresis is captured by the bifurcation diagram of equilibrium temperature versus solar constant: it traces an S-shaped curve with upper (warm) and lower (snowball) branches connected by an unstable middle branch. The geological evidence for global glaciation events roughly 700 million years ago, and the subsequent sudden deglaciation, is broadly consistent with this bifurcation structure.

## 2.6 Milankovitch Forcing

On orbital timescales of 10,000–100,000 years, the distribution of insolation is modulated by periodic variations in Earth's orbital parameters. These **Milankovitch cycles** comprise three components: (1) changes in orbital **eccentricity** with dominant periods near 100,000 and 413,000 years; (2) changes in the **obliquity** (axial tilt) with a dominant period of approximately 41,000 years; and (3) **precession** of the equinoxes with periods near 23,000 and 19,000 years. In the Budyko-Sellers framework, Milankovitch variations enter as time-dependent perturbations to the insolation distribution \( s(x) \), driving the ice line to oscillate between glacial and interglacial positions.

---

# Chapter 3: Time Series Analysis for Climate

## 3.1 The Discrete Fourier Transform

Climate records are inherently time series: sequences of measurements at discrete times \( t_n = n \Delta t \) for \( n = 0, 1, \ldots, N-1 \). The **discrete Fourier transform** (DFT) decomposes such a series into contributions at discrete frequencies, forming the mathematical foundation for spectral analysis. For a real-valued series \( \{x_n\} \), the DFT is defined as

\[
\hat{x}_k = \sum_{n=0}^{N-1} x_n \, e^{-2\pi i k n / N}, \quad k = 0, 1, \ldots, N-1.
\]

The corresponding frequencies are \( f_k = k / (N \Delta t) \), and the inverse DFT recovers the original series:

\[
x_n = \frac{1}{N} \sum_{k=0}^{N-1} \hat{x}_k \, e^{2\pi i k n / N}.
\]

**Parseval's theorem** guarantees that the total variance is conserved:

\[
\sum_{n=0}^{N-1} |x_n|^2 = \frac{1}{N} \sum_{k=0}^{N-1} |\hat{x}_k|^2.
\]

## 3.2 Power Spectral Density

The **power spectral density** (PSD) \( P(f) \) describes how variance is distributed across frequencies. For a finite record, an estimate of the PSD at frequency \( f_k \) is

\[
\hat{P}(f_k) = \frac{\Delta t}{N} |\hat{x}_k|^2.
\]

This periodogram estimate is unbiased but has high variance; smoothing over adjacent frequency bins (using Welch's method or multitaper approaches) yields more reliable estimates. In climate science, the PSD often follows a **red noise** background, meaning power increases at lower frequencies. This red character reflects the integrating effect of the ocean: high-frequency atmospheric forcing is integrated by the slowly responding ocean, producing a spectrum that falls off roughly as \( f^{-2} \).

Identifying statistically significant spectral peaks against this red-noise background is essential for detecting genuine periodicities such as the annual cycle, ENSO variability (period 2–7 years), and Milankovitch cycles.

## 3.3 Wavelet Transforms and Time-Frequency Localization

A limitation of the Fourier transform is that it provides no information about when a particular frequency is active. The **wavelet transform** addresses this by convolving the signal with a localized, oscillatory **mother wavelet** \( \psi(t) \) that is both time-localized and frequency-selective. For the continuous wavelet transform, the wavelet coefficients at scale \( s \) and time \( \tau \) are

\[
W(s, \tau) = \frac{1}{\sqrt{s}} \int_{-\infty}^{\infty} x(t) \, \psi^*\!\left(\frac{t-\tau}{s}\right) dt.
\]

The **Morlet wavelet** is a common choice in climate analysis:

\[
\psi(\eta) = \pi^{-1/4} e^{i \omega_0 \eta} e^{-\eta^2/2},
\]

where \( \omega_0 \) (typically set to 6) controls the trade-off between time and frequency resolution governed by the Heisenberg-Gabor uncertainty principle: \( \Delta t \cdot \Delta f \ge 1/(4\pi) \). The squared modulus \( |W(s,\tau)|^2 \) is the **wavelet power spectrum**, which reveals how the strength of variability at different scales changes over time — ideal for nonstationary climate signals like ENSO, which has varying amplitude and frequency.

## 3.4 Empirical Orthogonal Functions

Climate datasets are high-dimensional: a global temperature field might contain \( O(10^4) \) spatial grid points observed over thousands of time steps. **Empirical orthogonal functions** (EOFs), equivalent to principal component analysis (PCA), provide an optimal low-rank representation of such data.

Let \( \mathbf{X} \in \mathbb{R}^{N \times p} \) be the data matrix with \( N \) time steps and \( p \) spatial grid points, each column anomaly from its temporal mean. The covariance matrix is \( \mathbf{C} = \mathbf{X}^T \mathbf{X} / (N-1) \in \mathbb{R}^{p \times p} \). The EOFs are the eigenvectors of \( \mathbf{C} \), or equivalently the right singular vectors of \( \mathbf{X} \) via the **singular value decomposition** (SVD)

\[
\mathbf{X} = \mathbf{U} \boldsymbol{\Sigma} \mathbf{V}^T,
\]

where \( \mathbf{U} \in \mathbb{R}^{N \times N} \) and \( \mathbf{V} \in \mathbb{R}^{p \times p} \) are orthogonal matrices and \( \boldsymbol{\Sigma} \) is diagonal with non-negative singular values \( \sigma_1 \ge \sigma_2 \ge \cdots \). The \( j \)-th column of \( \mathbf{V} \) is the \( j \)-th EOF — the spatial pattern of the \( j \)-th mode of variability — and the \( j \)-th column of \( \mathbf{U}\boldsymbol{\Sigma} \) is the corresponding **principal component** time series (PC). The fraction of total variance explained by the \( j \)-th mode is \( \sigma_j^2 / \sum_k \sigma_k^2 \).

<div class="theorem">
<strong>Optimality of EOF Decomposition.</strong> Among all rank-\( r \) approximations \( \hat{\mathbf{X}} \) of \( \mathbf{X} \), the truncated SVD \( \hat{\mathbf{X}}_r = \mathbf{U}_r \boldsymbol{\Sigma}_r \mathbf{V}_r^T \) minimizes the Frobenius norm \( \|\mathbf{X} - \hat{\mathbf{X}}\|_F^2 \). This is the Eckart-Young-Mirsky theorem.
</div>

In practice, EOFs must be interpreted carefully. The orthogonality constraint can force physically distinct processes into a single mode or mix physically coherent modes. Rotated EOFs (e.g., varimax rotation) and non-negative matrix factorization relax the orthogonality constraint to produce more interpretable spatial patterns.

## 3.5 Teleconnections and ENSO

**Teleconnections** are statistically significant correlations between climate anomalies at widely separated locations, arising from large-scale wave propagation and dynamical linkages. The most prominent is the **El Niño-Southern Oscillation** (ENSO), which dominates interannual climate variability globally.

ENSO is a coupled ocean-atmosphere phenomenon centered in the tropical Pacific. In its neutral state, easterly trade winds pile up warm water in the western Pacific and drive upwelling of cold water along the South American coast. During an **El Niño** event, the trade winds weaken, warm water surges eastward, and sea surface temperatures in the central and eastern equatorial Pacific rise by 1–3 K above normal. The atmosphere responds with altered precipitation patterns that propagate via Rossby waves to affect weather across North America, South America, Africa, and Australia.

The **Southern Oscillation Index** (SOI), defined as the normalized sea-level pressure difference between Tahiti and Darwin, serves as an atmospheric index of ENSO. The coupled ocean-atmosphere instability driving ENSO — the **Bjerknes feedback** — is a positive feedback loop: warm SST anomalies weaken the trade winds, which reduces upwelling and further warms SSTs. The ENSO cycle is regulated by negative feedbacks including the delayed ocean response (equatorial Kelvin and Rossby waves) and the annual seasonal cycle.

Mathematically, ENSO dynamics can be represented as a low-order delay-differential equation or as a stochastically forced linear oscillator, and the first EOF of tropical Pacific SST anomalies closely captures the characteristic warming pattern of El Niño.

---

# Chapter 4: Statistical and Machine Learning Methods

## 4.1 Linear Regression and Least Squares

Much of quantitative climate science involves fitting models to data. The workhorse is **ordinary least squares** (OLS) regression. Given observations \( \mathbf{y} \in \mathbb{R}^N \) and a design matrix \( \mathbf{X} \in \mathbb{R}^{N \times p} \) whose columns represent predictor variables, the linear model assumes

\[
\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \boldsymbol{\epsilon},
\]

where \( \boldsymbol{\beta} \in \mathbb{R}^p \) are regression coefficients and \( \boldsymbol{\epsilon} \sim \mathcal{N}(\mathbf{0}, \sigma^2 \mathbf{I}) \) is noise. The OLS estimator minimizes the residual sum of squares:

\[
\hat{\boldsymbol{\beta}} = \arg\min_{\boldsymbol{\beta}} \|\mathbf{y} - \mathbf{X}\boldsymbol{\beta}\|^2 = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{y},
\]

provided \( \mathbf{X}^T\mathbf{X} \) is invertible. By the Gauss-Markov theorem, \( \hat{\boldsymbol{\beta}} \) is the best linear unbiased estimator (BLUE). A confidence interval for the trend in a time series — for example, the global mean temperature trend of approximately 0.2 K per decade over recent decades — is obtained from the standard error \( \hat{\sigma}\sqrt{(\mathbf{X}^T\mathbf{X})^{-1}_{jj}} \), though serial autocorrelation in climate data requires an effective sample size correction.

## 4.2 Polynomial Regression

When the relationship between predictor and response is nonlinear, one constructs a polynomial design matrix using powers of the predictor. For scalar predictor \( t \) and degree \( d \):

\[
\mathbf{X} = \begin{pmatrix} 1 & t_1 & t_1^2 & \cdots & t_1^d \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ 1 & t_N & t_N^2 & \cdots & t_N^d \end{pmatrix}.
\]

The OLS solution proceeds identically. However, high-degree polynomials suffer from **overfitting**: the model fits the training data closely but generalizes poorly to new data. This motivates regularization.

## 4.3 Ridge Regression and Regularization

**Ridge regression** (Tikhonov regularization) adds a penalty on the \( \ell^2 \) norm of coefficients to the least-squares objective:

\[
\hat{\boldsymbol{\beta}}_{\lambda} = \arg\min_{\boldsymbol{\beta}} \left\lbrack \|\mathbf{y} - \mathbf{X}\boldsymbol{\beta}\|^2 + \lambda \|\boldsymbol{\beta}\|^2 \right\rbrack = (\mathbf{X}^T\mathbf{X} + \lambda \mathbf{I})^{-1}\mathbf{X}^T\mathbf{y}.
\]

The regularization parameter \( \lambda \ge 0 \) controls the **bias-variance tradeoff**: larger \( \lambda \) shrinks coefficients toward zero, reducing variance at the cost of increased bias. As \( \lambda \to 0 \), the ridge estimator recovers OLS; as \( \lambda \to \infty \), all coefficients are shrunk to zero.

The singular value decomposition of \( \mathbf{X} = \mathbf{U}\boldsymbol{\Sigma}\mathbf{V}^T \) illuminates the effect of regularization:

\[
\hat{\boldsymbol{\beta}}_{\lambda} = \mathbf{V} \text{diag}\!\left(\frac{\sigma_j}{\sigma_j^2 + \lambda}\right) \mathbf{U}^T \mathbf{y}.
\]

Small singular values — corresponding to ill-constrained directions in parameter space — are effectively suppressed when \( \lambda \gg \sigma_j^2 \). In climate applications, ridge regression is widely used for **statistical downscaling**: relating coarse-resolution GCM output to local observations.

## 4.4 Cross-Validation

**Cross-validation** is the standard framework for selecting hyperparameters (such as \( \lambda \)) and estimating generalization error without a large independent test set. In \( k \)-fold cross-validation, the training data are partitioned into \( k \) roughly equal folds. The model is trained on \( k-1 \) folds and evaluated on the held-out fold; this is repeated \( k \) times and the average validation error is reported. For time series data, the folds must respect temporal order — shuffled cross-validation is invalid because it leaks future information into training.

<div class="example">
<strong>Example: Selecting Ridge Regularization for Temperature Downscaling.</strong> Suppose we wish to predict daily local temperature from 50 large-scale predictors from a reanalysis product. Leave-one-year-out cross-validation over 40 years of training data is used to select <em>λ</em> over a grid from 10<sup>−3</sup> to 10<sup>3</sup>. The cross-validation curve typically shows a U-shape: high training error (underfitting) for large <em>λ</em>, and high validation error (overfitting) for small <em>λ</em>, with an optimal <em>λ</em>* near the minimum.
</div>

## 4.5 Random Forests

**Random forests** are an ensemble learning method that aggregates predictions from many **decision trees**, each trained on a bootstrap resample of the data with a random subset of features considered at each split. Decision trees recursively partition the feature space into rectangular regions by sequentially choosing splits that minimize impurity (e.g., mean squared error for regression). A single deep tree has low bias but high variance; averaging over many trees reduces variance while retaining low bias — an instance of the **wisdom-of-crowds** effect formalized as the bias-variance decomposition.

Formally, if \( \hat{f}_b(\mathbf{x}) \) denotes the prediction of the \( b \)-th tree, the random forest prediction is

\[
\hat{f}(\mathbf{x}) = \frac{1}{B} \sum_{b=1}^{B} \hat{f}_b(\mathbf{x}).
\]

An important diagnostic is **feature importance**, measured by the mean decrease in impurity when a variable is used in splits, averaged over all trees. In climate applications, random forests have been used for detecting extreme events, predicting drought indices, and learning nonlinear relationships between large-scale circulation patterns and regional precipitation.

---

# Chapter 5: Fluid Dynamics of the Climate System

## 5.1 Equations of Motion in a Rotating Frame

The atmosphere and ocean are rotating fluids, and Earth's rotation fundamentally shapes their large-scale dynamics. The momentum equation in a frame rotating at angular velocity \( \boldsymbol{\Omega} \) (with \( |\boldsymbol{\Omega}| = \Omega = 7.27 \times 10^{-5} \, \text{rad s}^{-1} \)) takes the form

\[
\frac{D\mathbf{u}}{Dt} + 2\boldsymbol{\Omega} \times \mathbf{u} = -\frac{1}{\rho}\nabla p - g\hat{z} + \mathbf{F},
\]

where \( \mathbf{u} \) is the velocity field, \( \rho \) is density, \( p \) is pressure, \( g \) is gravitational acceleration, and \( \mathbf{F} \) represents friction and other body forces. The term \( 2\boldsymbol{\Omega} \times \mathbf{u} \) is the **Coriolis acceleration**, which deflects moving parcels of air or water to the right in the Northern Hemisphere and to the left in the Southern Hemisphere. Combined with mass conservation \( \partial \rho / \partial t + \nabla \cdot (\rho \mathbf{u}) = 0 \) and thermodynamic equations for temperature and humidity (or salinity in the ocean), these equations constitute the complete governing system.

## 5.2 Geostrophic Balance

At large horizontal scales (synoptic scale and above), the Rossby number \( \text{Ro} = U/(fL) \) — where \( U \) is a characteristic velocity, \( f = 2\Omega\sin\phi \) is the **Coriolis parameter** at latitude \( \phi \), and \( L \) is a length scale — is small (\( \text{Ro} \ll 1 \)). In this limit, the dominant balance in the horizontal momentum equation is between the Coriolis force and the pressure gradient force:

\[
f \hat{z} \times \mathbf{u}_g = -\frac{1}{\rho}\nabla_H p,
\]

or equivalently

\[
u_g = -\frac{1}{\rho f}\frac{\partial p}{\partial y}, \qquad v_g = \frac{1}{\rho f}\frac{\partial p}{\partial x}.
\]

This is **geostrophic balance**, and \( (u_g, v_g) \) is the **geostrophic wind** (or current). Geostrophic flow is parallel to isobars, with low pressure to the left of the flow direction in the Northern Hemisphere. Cyclones (low-pressure systems) have counterclockwise flow in the Northern Hemisphere; anticyclones rotate clockwise.

## 5.3 Hydrostatic Balance

In the vertical direction, the atmosphere is nearly in **hydrostatic balance**: the vertical pressure gradient balances gravity,

\[
\frac{\partial p}{\partial z} = -\rho g.
\]

This approximation is valid when vertical velocities are much smaller than horizontal velocities and the aspect ratio \( H/L \ll 1 \). Integrating the hydrostatic equation with the ideal gas law \( p = \rho R_d T \) (where \( R_d \) is the specific gas constant for dry air) yields the **hypsometric equation** relating the thickness of a pressure layer to its mean temperature, and ultimately the pressure-height relationship \( p(z) = p_0 \exp(-z/H) \) with scale height \( H = R_d T / g \approx 8 \, \text{km} \).

## 5.4 The Primitive Equations

The **primitive equations** of the atmosphere retain the hydrostatic balance in the vertical but include the full horizontal dynamics, thermodynamics, and moisture. In pressure coordinates \( (x, y, p, t) \):

\[
\frac{\partial \mathbf{v}}{\partial t} + (\mathbf{v} \cdot \nabla)\mathbf{v} + \omega \frac{\partial \mathbf{v}}{\partial p} + f\hat{z}\times\mathbf{v} = -\nabla_p \Phi + \mathbf{F}_v,
\]

\[
\frac{\partial \Phi}{\partial p} = -\frac{R_d T}{p},
\]

\[
\frac{\partial T}{\partial t} + \mathbf{v}\cdot\nabla T + \omega\left(\frac{\partial T}{\partial p} - \frac{R_d T}{c_p p}\right) = \frac{Q}{c_p},
\]

\[
\nabla_p \cdot \mathbf{v} + \frac{\partial \omega}{\partial p} = 0,
\]

where \( \mathbf{v} = (u,v) \) is horizontal velocity, \( \omega = Dp/Dt \) is the pressure vertical velocity, \( \Phi = gz \) is geopotential, and \( Q \) is diabatic heating. These equations, discretized on a global grid, form the dynamical core of atmospheric general circulation models.

## 5.5 The Boussinesq Approximation for the Ocean

In ocean modeling, the **Boussinesq approximation** simplifies the equations by assuming that density variations are small compared to a reference density \( \rho_0 \), except where they multiply \( g \). Writing \( \rho = \rho_0 + \rho'(\mathbf{x},t) \) with \( |\rho'| \ll \rho_0 \), the momentum equation becomes

\[
\frac{D\mathbf{u}}{Dt} + 2\boldsymbol{\Omega}\times\mathbf{u} = -\frac{\nabla p}{\rho_0} - \frac{\rho'}{\rho_0}g\hat{z} + \nu\nabla^2\mathbf{u},
\]

and continuity reduces to \( \nabla \cdot \mathbf{u} = 0 \) (incompressibility). The buoyancy \( b = -g\rho'/\rho_0 \) evolves according to an advection-diffusion equation forced by surface heat and freshwater fluxes. This system is the foundation for ocean general circulation models and for theories of the **thermohaline circulation** — the density-driven component of global ocean overturning.

## 5.6 Boundary Layer Theory

Near the surface, friction is significant, and the geostrophic balance is perturbed by viscous effects. The **Ekman layer** is the thin layer (thickness \( \delta_E \sim (2\nu/f)^{1/2} \) or, with turbulent eddy viscosity \( K_v \), \( \delta_E \sim (2K_v/f)^{1/2} \approx 50\text{–}1000 \, \text{m} \)) over which velocity rotates from the surface wind direction to the geostrophic value with increasing depth (the **Ekman spiral**). The depth-integrated Ekman transport is directed 90° to the right of the surface wind in the Northern Hemisphere, a result with important consequences for upwelling zones, subtropical gyres, and ocean-atmosphere coupling.

---

# Chapter 6: Climate Model Building Blocks

## 6.1 The Hierarchy of Climate Models

Climate models exist on a hierarchy of complexity, from simple analytical EBMs to comprehensive **general circulation models** (GCMs) that couple atmosphere, ocean, land surface, and sea ice. Simple models illuminate the physics of specific feedbacks with clarity and mathematical transparency. Complex models attempt to simulate the full range of processes and provide quantitative predictions. The hierarchy is valuable because understanding gained from simple models guides interpretation of GCM output, while GCM simulations constrain parameters in simpler models.

A **GCM** discretizes the primitive equations on a global grid and integrates them forward in time from a specified initial state under prescribed or interactively simulated forcings (solar irradiance, greenhouse gas concentrations, aerosol loading). Modern coupled GCMs typically operate at horizontal resolutions of 50–100 km in the atmosphere and 10–25 km in the ocean, though higher-resolution models are increasingly feasible.

## 6.2 Numerical Discretization

The continuous PDEs governing climate must be discretized for numerical solution. On a **spherical coordinate** grid \( (\lambda, \phi, z) \) (longitude, latitude, altitude), the simplest approach is finite differences. For a scalar field \( f(\lambda_i, \phi_j)  \), a second-order centered finite difference approximates the zonal derivative as

\[
\frac{\partial f}{\partial \lambda} \approx \frac{f_{i+1,j} - f_{i-1,j}}{2\Delta\lambda}.
\]

Spectral methods, which represent horizontal fields as truncated series of spherical harmonics \( Y_n^m(\lambda,\phi) \), were long favored for the dynamical core because the Laplacian and gradient operators diagonalize in spherical harmonic space, eliminating spurious grid-scale noise. Finite-volume methods have become dominant in modern atmospheric models because they conserve mass, energy, and other integral quantities exactly by construction.

**Time integration** of climate models uses explicit or semi-implicit methods. The leapfrog scheme is widely used for the advective terms (explicit, second-order accurate), while stiff terms such as gravity waves are treated implicitly to avoid a severe Courant-Friedrichs-Lewy (CFL) stability constraint on the time step.

<div class="definition">
<strong>CFL Condition.</strong> For an explicit time-stepping scheme applied to an advection equation with phase speed <em>c</em> on a grid with spacing Δ<em>x</em>, numerical stability requires the Courant number

\[ \text{Co} = \frac{c \Delta t}{\Delta x} \le C_{\max}, \]

where <em>C</em><sub>max</sub> depends on the scheme. For the leapfrog scheme, <em>C</em><sub>max</sub> = 1. Gravity waves with phase speeds ~300 m s<sup>-1</sup> on a 50-km grid require Δ<em>t</em> ≤ 167 s for explicit treatment.
</div>

## 6.3 Boundary Conditions and Forcing

Climate models require specification of boundary conditions at the surface (topography, land-surface properties, sea surface temperature or ocean dynamics), at the top of the atmosphere (incoming solar flux), and at lateral boundaries if the domain is regional. For global models the lower boundary conditions are inherently coupled: the atmosphere exchanges heat, momentum, and moisture with the underlying ocean or land via **bulk aerodynamic formulae** that parameterize turbulent surface fluxes in terms of near-surface wind speed and temperature/humidity gradients.

External **forcings** include solar irradiance (relatively steady on decadal scales but varying by \( \sim 0.1\% \) over the 11-year solar cycle), volcanic stratospheric aerosols (short-lived but large in magnitude), and well-mixed greenhouse gas concentrations prescribed from observations or emissions scenarios. Anthropogenic aerosols — sulfate, black carbon, organic carbon — affect both the direct radiative forcing and cloud properties (the **aerosol indirect effect**), and remain the largest source of uncertainty in historical forcing estimates.

## 6.4 Parameterizations

Processes that occur on scales smaller than the model grid must be **parameterized** — represented in terms of resolved-scale variables through empirical or semi-empirical relationships. Key parameterizations include:

**Convective parameterization**: Deep moist convection organizes on scales of kilometers but transfers heat, moisture, and momentum over the depth of the troposphere. Cumulus parameterization schemes (e.g., mass-flux schemes) represent the aggregate effect of convective updrafts and downdrafts as a function of the large-scale thermodynamic state.

**Cloud microphysics and radiation**: The formation of cloud droplets and ice crystals, precipitation processes, and the interaction of clouds with radiation are highly complex and occur at sub-grid scales. Cloud fraction and cloud optical depth are parameterized as functions of relative humidity and temperature, though uncertainties in cloud feedbacks dominate the spread in climate sensitivity among GCMs.

**Ocean mixing**: Sub-grid-scale turbulence in the ocean mixed layer, convective overturning, and mesoscale eddies all mix heat and tracers. These are parameterized through diffusivity tensors aligned with density surfaces (isopycnal mixing) and empirical vertical mixing schemes.

---

# Chapter 7: Sensitivity, Tipping Points, and Nonlinear Dynamics

## 7.1 Climate Sensitivity and Feedback Analysis

The **equilibrium climate sensitivity** (ECS) is defined as the equilibrium global mean surface temperature increase resulting from a doubling of atmospheric CO\(_2\). It can be written as

\[
\Delta T_{2\times} = \frac{F_{2\times}}{\lambda_0 - \sum_i \lambda_i},
\]

where \( F_{2\times} \approx 3.7 \, \text{W m}^{-2} \) is the radiative forcing from CO\(_2\) doubling, \( \lambda_0 = 4\sigma T_e^3 \approx 3.2 \, \text{W m}^{-2} \text{K}^{-1} \) is the Planck feedback (the stabilizing blackbody response), and \( \lambda_i \) are the various climate feedbacks (water vapor, lapse rate, albedo, cloud). Positive feedbacks (\( \lambda_i > 0 \)) amplify warming; the sum determines the total effective feedback parameter \( \lambda_{\text{eff}} = \lambda_0 - \sum_i \lambda_i \).

The **feedback factor** or gain \( g = \sum_i \lambda_i / \lambda_0 \) quantifies amplification. If \( g < 1 \), the system has a stable equilibrium with \( \Delta T = F_{2\times}/(\lambda_0(1-g)) \). The IPCC AR6 assessed ECS is likely in the range 2.5–4.0 K, with a best estimate of 3.0 K.

## 7.2 Lyapunov Exponents and Predictability

The atmosphere is a chaotic dynamical system: nearby initial conditions diverge exponentially. This sensitivity is quantified by the **Lyapunov exponent**. For a dynamical system \( \dot{\mathbf{x}} = \mathbf{F}(\mathbf{x}) \), the maximal Lyapunov exponent \( \Lambda \) is defined by

\[
\Lambda = \lim_{t\to\infty} \lim_{\|\delta\mathbf{x}_0\|\to 0} \frac{1}{t} \ln\frac{\|\delta\mathbf{x}(t)\|}{\|\delta\mathbf{x}_0\|},
\]

where \( \delta\mathbf{x}(t) \) is the evolution of an infinitesimal perturbation. For the atmosphere, \( \Lambda^{-1} \approx 2\text{–}5 \) days, implying that initial condition errors double roughly every 2–5 days. This sets a **practical predictability limit** of approximately 2 weeks for deterministic weather forecasting.

Climate prediction — as distinct from weather forecasting — is nonetheless possible because climate is a boundary value problem: the statistical properties of the climate system are determined by slowly evolving boundary conditions (greenhouse gas concentrations, ocean temperatures) rather than by the precise initial state of the atmosphere. The analogy is the predictability of seasonal statistics (summer will be warmer than winter) even though day-to-day weather is unpredictable.

## 7.3 Tipping Elements of the Climate System

Beyond smooth, reversible responses to forcing, the climate system contains **tipping elements**: large-scale subsystems that, if pushed past a critical threshold, can undergo rapid, self-reinforcing change that is difficult or impossible to reverse. Major tipping elements identified in the literature include:

- **West Antarctic and Greenland ice sheets**: Partial collapse driven by marine ice sheet instability and surface-elevation feedback, contributing multiple meters of sea level rise on centennial timescales.
- **Atlantic Meridional Overturning Circulation (AMOC)**: Potential weakening or collapse due to freshwater input from melting ice sheets, reducing poleward heat transport and altering precipitation patterns over Europe and the Sahel.
- **Amazon rainforest dieback**: Drying and deforestation could push the Amazon beyond a threshold where it can no longer sustain rainfall through vegetation-moisture feedbacks, leading to replacement by savanna and a significant carbon source.
- **Permafrost carbon feedback**: Thawing permafrost releases previously frozen organic carbon as CO\(_2\) and CH\(_4\), constituting a positive feedback that could significantly amplify warming.

## 7.4 Bifurcation Theory for Tipping Points

The mathematical framework for tipping points is **bifurcation theory**. Consider a scalar system

\[
\frac{dx}{dt} = f(x, \mu),
\]

where \( \mu \) is a slowly varying forcing parameter. At a **fold bifurcation** (saddle-node bifurcation), two equilibria (one stable, one unstable) collide and disappear as \( \mu \) passes through a critical value \( \mu_c \). Near the bifurcation, the dynamics are well approximated by

\[
\frac{dx}{dt} \approx a(\mu - \mu_c) - b(x - x_c)^2,
\]

with \( a, b > 0 \). As \( \mu \to \mu_c^- \) from the stable side, the stable equilibrium approaches the unstable one and the restoring force \( |f'(x^*)| \to 0 \) — a phenomenon called **critical slowing down**. The characteristic time for relaxation from a small perturbation scales as \( \tau \sim (\mu_c - \mu)^{-1/2} \).

<div class="theorem">
<strong>Critical Slowing Down as an Early Warning Signal.</strong> As a tipping point is approached, the autocorrelation at lag-1 of a slowly varying stochastic system approaches 1, and the variance of the system state increases. These statistical signatures — increasing variance and increasing autocorrelation — can in principle serve as early warning signals of an approaching tipping point.
</div>

These early warning signals have been identified in paleoclimate records preceding abrupt climate transitions (such as Dansgaard-Oeschger events) and in monitoring data for tipping elements including sea ice extent and AMOC fingerprints. However, false positives are possible, and the lead time before tipping can be short.

## 7.5 Multi-Stability and Hysteresis

Many components of the climate system exhibit **multi-stability** — the coexistence of two or more distinct stable states under the same external forcing. The snowball Earth EBM (Chapter 2) is the canonical example, but multi-stability also arises in AMOC (on vs. off states), Arctic sea ice (perennial vs. seasonal ice), and monsoon systems (active vs. collapsed). 

Hysteresis means that the transition from warm to cold state occurs at a different forcing level than the reverse transition. Specifically, if \( \mu_c^{\downarrow} \) is the forcing at which the system tips from warm to cold, and \( \mu_c^{\uparrow} \) is the forcing at which it recovers, then \( \mu_c^{\uparrow} > \mu_c^{\downarrow} \), and the area enclosed by the hysteresis loop measures the energy dissipated in the transition. For the AMOC, model studies suggest that even if greenhouse gas forcing were reduced after a collapse, full recovery might require centuries to millennia.

---

# Chapter 8: Uncertainty Quantification

## 8.1 Sources of Uncertainty in Climate Projections

Climate projections are uncertain, and rigorously characterizing this uncertainty is essential for informing decision-making. Three major sources are commonly distinguished:

**Initial condition uncertainty** (or internal variability): The chaotic nature of the climate system means that small differences in the initial state produce different realizations of internal variability (e.g., ENSO, decadal variability). This uncertainty is irreducible for specific future trajectories but can be quantified via ensemble methods.

**Forcing uncertainty** (scenario uncertainty): Future greenhouse gas emissions depend on human decisions, policies, and economic trajectories. The IPCC uses **Shared Socioeconomic Pathways** (SSPs) that span a wide range of futures, from aggressive decarbonization (SSP1-1.9) to continued high emissions (SSP5-8.5).

**Structural (model) uncertainty**: Different GCMs make different assumptions about parameterizations, numerical schemes, and sub-grid representations, leading to spread in their responses to the same forcing. This spread is quantified by the **multi-model ensemble** (e.g., the CMIP6 archive of approximately 100 models from dozens of modeling centers).

## 8.2 Bayesian Inference for Climate Parameters

**Bayesian inference** provides a principled framework for combining prior information with observational data to update probability distributions over climate parameters. Let \( \theta \) denote a vector of uncertain parameters (e.g., ECS, aerosol forcing), \( \mathbf{y} \) represent observations, and \( \mathcal{M}(\theta) \) denote the model prediction. By Bayes' theorem:

\[
p(\theta | \mathbf{y}) = \frac{p(\mathbf{y} | \theta) \, p(\theta)}{p(\mathbf{y})},
\]

where \( p(\theta) \) is the prior distribution encoding beliefs before observing data, \( p(\mathbf{y} | \theta) \) is the likelihood function, and \( p(\theta | \mathbf{y}) \) is the posterior distribution updated by the data. The denominator \( p(\mathbf{y}) = \int p(\mathbf{y}|\theta)p(\theta)d\theta \) is the model evidence (normalizing constant).

A key application is constraining ECS from the historical temperature record. The likelihood is constructed from the discrepancy between observed global mean temperature and model-simulated temperature under the forcing history:

\[
p(\mathbf{y} | \theta) \propto \exp\!\left(-\frac{1}{2}(\mathbf{y} - \mathcal{M}(\theta))^T \mathbf{C}_\epsilon^{-1} (\mathbf{y} - \mathcal{M}(\theta))\right),
\]

where \( \mathbf{C}_\epsilon \) is the observation error covariance (including internal variability). Posterior samples obtained via MCMC (Section 8.3) then provide a probability distribution over ECS consistent with both prior knowledge and observations.

## 8.3 Markov Chain Monte Carlo

For high-dimensional parameter spaces, direct numerical integration of the posterior is infeasible. **Markov Chain Monte Carlo** (MCMC) methods draw samples from the posterior by constructing a Markov chain whose stationary distribution is the target \( p(\theta|\mathbf{y}) \).

The **Metropolis-Hastings** algorithm is the fundamental MCMC method. Starting from a current state \( \theta^{(t)} \), a proposal \( \theta^* \sim q(\theta^* | \theta^{(t)}) \) is drawn from a proposal distribution. The proposal is accepted with probability

\[
\alpha = \min\!\left(1, \frac{p(\theta^* | \mathbf{y}) \, q(\theta^{(t)} | \theta^*)}{p(\theta^{(t)} | \mathbf{y}) \, q(\theta^* | \theta^{(t)})}\right).
\]

If accepted, \( \theta^{(t+1)} = \theta^* \); otherwise \( \theta^{(t+1)} = \theta^{(t)} \). After a **burn-in** period during which the chain converges to its stationary distribution, the subsequent samples approximate the posterior. Convergence is diagnosed using the Gelman-Rubin statistic \( \hat{R} \) from multiple independent chains — values close to 1 indicate convergence.

<div class="remark">
In climate applications, each likelihood evaluation may require running a computationally expensive model. MCMC algorithms tailored for this setting use emulators — fast statistical surrogate models trained on a small set of model runs — to approximate the likelihood function at low computational cost, enabling posterior exploration with \( O(10^4\text{–}10^5) \) evaluations rather than the millions required with a naive Metropolis scheme.
</div>

## 8.4 Ensemble Forecasting

**Ensemble forecasting** generates multiple simulations from different initial conditions (to sample initial condition uncertainty) or different model configurations (to sample structural uncertainty). The ensemble mean is a more accurate predictor of the expected outcome than any individual member; the ensemble spread quantifies forecast uncertainty.

Probabilistic skill is assessed using proper scoring rules such as the **Continuous Ranked Probability Score** (CRPS) and the **Brier score** for binary events. A forecast system is **reliable** (well-calibrated) if the observed outcome falls within the ensemble spread with the correct frequency: events assigned 20% probability should occur roughly 20% of the time. Reliability is assessed via rank histograms (Talagrand diagrams) — a flat rank histogram indicates reliability.

## 8.5 Bayesian Model Averaging

When multiple competing models exist, **Bayesian model averaging** (BMA) combines their predictions weighted by their posterior probabilities given observations:

\[
p(y_{\text{new}} | \mathbf{y}) = \sum_{k=1}^{K} p(y_{\text{new}} | \mathcal{M}_k, \mathbf{y}) \, p(\mathcal{M}_k | \mathbf{y}),
\]

where \( p(\mathcal{M}_k | \mathbf{y}) \propto p(\mathbf{y}|\mathcal{M}_k) p(\mathcal{M}_k) \) is the posterior model probability, proportional to the model evidence \( p(\mathbf{y}|\mathcal{M}_k) \) times the model prior. BMA naturally penalizes overfitting because complex models incur an Occam factor that reduces their evidence unless the added complexity is justified by the data.

In practice, computing model evidence for expensive GCMs is approximated using techniques such as thermodynamic integration or information criteria (AIC, BIC). BMA has been applied to constrain probabilistic projections of ECS, sea level rise, and regional precipitation change from multi-model ensembles.

---

# Chapter 9: Societal Impacts and Integrated Assessment

## 9.1 Temperature-Impact Relationships and Damage Functions

Translating physical climate projections into economic and societal impacts requires **damage functions** — relationships between temperature change and economic costs. The most widely used functional forms are polynomial in temperature anomaly \( \Delta T \):

\[
D(\Delta T) = 1 - \frac{1}{1 + a_1 \Delta T + a_2 (\Delta T)^2},
\]

where \( D \) is the fraction of economic output lost and \( a_1, a_2 > 0 \) are empirically calibrated parameters. The quadratic form implies that damage accelerates with warming: a 2 K warming causes relatively modest losses, but 4 K or 6 K warming could imply catastrophic economic disruption.

A fundamental limitation of polynomial damage functions is that they are extrapolated well beyond the range of historical experience; the behavior of economic systems near tipping thresholds (Section 7.3) is particularly uncertain. Alternative approaches use meta-analyses of empirical studies relating temperature to agricultural yields, labor productivity, conflict risk, and mortality, yielding sectoral damage functions aggregated across impacts.

## 9.2 Integrated Assessment Models

**Integrated assessment models** (IAMs) couple simplified representations of the climate system with economic models to analyze the interaction between human activities and climate change. The **DICE** (Dynamic Integrated model of Climate and the Economy) model, developed by Nordhaus, is a representative example. It consists of:

- A **carbon cycle module** tracking the flow of carbon between atmosphere, upper ocean, and deep ocean compartments;
- An **energy balance climate module** relating atmospheric carbon to global mean temperature;
- An **economic module** with a Ramsey growth framework maximizing discounted social welfare subject to the constraint that climate damage reduces output;
- An **abatement cost module** specifying the cost of emissions reductions as a function of the mitigation rate.

The social optimum maximizes the integral of discounted utility:

\[
W = \int_0^\infty U(c(t)) e^{-\rho t} dt,
\]

where \( c(t) \) is per-capita consumption, \( U(c) = c^{1-\eta}/(1-\eta) \) is a constant-relative-risk-aversion utility function, and \( \rho \) is the pure rate of time preference. The **social cost of carbon** (SCC) is the shadow price on atmospheric CO\(_2\) at the optimum — the marginal damage caused by emitting one additional tonne of carbon. The SCC is highly sensitive to the discount rate \( \rho \) and the damage function curvature \( a_2 \), which are themselves contested.

## 9.3 Sea Level Rise Projections

**Sea level rise** (SLR) results from two physical mechanisms: **thermal expansion** of seawater as it warms (**thermosteric** SLR) and the melting of land ice (glaciers, ice caps, ice sheets). Global mean sea level has risen approximately 20 cm since 1900, with the rate accelerating to over 3.6 mm yr\(^{-1}\) in the most recent satellite era (post-1993).

Projections of SLR over the 21st century must account for the large uncertainty in the dynamic response of the West Antarctic and Greenland ice sheets, which could contribute anywhere from a few centimetres to over 1 m by 2100 under high-emissions scenarios. The probability of **high-end** SLR scenarios — including potential marine ice sheet instability — is especially important for coastal planning, since even low-probability, high-consequence events drive risk management decisions. The statistical framework for combining multiple uncertain components (thermal expansion, glaciers, ice sheets, groundwater) into a total SLR distribution is itself a non-trivial Bayesian problem.

## 9.4 Extreme Events and Return Periods

The frequency and intensity of extreme climate events — heat waves, extreme precipitation, droughts, hurricanes — are changing with warming. Extreme value statistics provides the rigorous framework for analyzing rare events.

For a stationary time series, the distribution of block maxima (e.g., annual maximum temperature) converges to the **Generalized Extreme Value** (GEV) distribution:

\[
G(x; \mu, \sigma, \xi) = \exp\!\left(-\left\lbrack 1 + \xi\frac{x-\mu}{\sigma}\right\rbrack^{-1/\xi}\right),
\]

where \( \mu \) is the location parameter, \( \sigma > 0 \) the scale, and \( \xi \) the shape parameter (encompassing Gumbel, Fréchet, and Weibull families for \( \xi = 0, \xi > 0, \xi < 0 \) respectively). The **return period** \( T_r \) of an event with threshold \( x \) is \( T_r = 1/(1-G(x)) \) — the expected number of years between occurrences.

Climate change renders this framework non-stationary: the location and scale parameters shift with time as the climate warms. **Fraction Attributable Risk** (FAR) and **probability ratio** (PR) quantify the change in event probability due to anthropogenic influence:

\[
\text{PR} = \frac{P(\text{event}|\text{anthropogenic forcing})}{P(\text{event}|\text{no anthropogenic forcing})},
\]

obtained by comparing event probabilities in large ensembles of model runs with and without historical human emissions.

## 9.5 Population Dynamics Under Climate Stress

Climate change interacts with population dynamics through multiple pathways: reduced agricultural yields increase food insecurity; heat stress reduces labor productivity and increases mortality; sea level rise and extreme weather force displacement; and changes in the distribution of vector-borne diseases alter mortality patterns.

A simple mathematical framework couples a **logistic population model** to a climate-dependent carrying capacity. Let \( N(t) \) be population and \( K(T(t)) \) be the carrying capacity dependent on mean temperature \( T(t) \):

\[
\frac{dN}{dt} = r N\left(1 - \frac{N}{K(T(t))}\right),
\]

where \( r \) is the intrinsic rate of natural increase. If climate warming reduces \( K \) — through lower agricultural yields or increased mortality — the equilibrium population declines. More sophisticated models partition the population spatially, track migration flows driven by climate stress, and couple population to economic output.

**Integrated assessment models** of the second generation attempt to endogenize these feedbacks, allowing climate impacts to affect human capital, productivity, and thereby emissions trajectories. The resulting coupled human-natural system can exhibit complex nonlinear dynamics including tipping points in societal responses to climate stress.

---

# Appendix: Mathematical Foundations

## A.1 Dimensional Analysis and Scaling

Dimensional analysis is a powerful technique for deriving order-of-magnitude estimates and checking the self-consistency of equations. For the energy balance model, a natural timescale emerges from the ratio of heat capacity to the feedback parameter:

\[
\tau = \frac{C}{\lambda_{\text{eff}}} \approx \frac{2 \times 10^8 \, \text{J m}^{-2}\text{K}^{-1}}{2 \, \text{W m}^{-2}\text{K}^{-1}} \approx 3 \, \text{years},
\]

reflecting the characteristic e-folding time for the mixed-layer ocean to respond to a radiative perturbation. In the atmosphere, the relevant dynamical timescale for Rossby wave propagation across an ocean basin is \( \tau_R \sim L/c_R \) where \( c_R = -\beta/(k^2 + l^2 + f^2/c^2) \) is the Rossby wave phase speed; for baroclinic Rossby waves in the tropical Pacific, \( \tau_R \sim 6\text{–}12 \, \text{months} \), comparable to the adjustment timescale of ENSO.

## A.2 The Diffusion Equation and Heat Transport

The latitudinal redistribution of energy in the Budyko-Sellers model is governed by an equation of the form

\[
\frac{\partial T}{\partial t} = D \frac{\partial^2 T}{\partial y^2} + \mathcal{S}(y,t),
\]

where \( y \) is a meridional coordinate and \( \mathcal{S} \) represents sources and sinks. The Green's function solution for a delta-function initial condition gives a Gaussian temperature pulse that broadens as \( \sigma^2 = 2Dt \) over time, illustrating how diffusive transport smooths temperature gradients. The **diffusivity** \( D \) in the climate context is an effective transport coefficient representing the aggregate effect of baroclinic eddies, and its value (\( D \approx 0.4\text{–}0.6 \, \text{W m}^{-2} \text{K}^{-1} \) per degree latitude squared in standard Budyko-Sellers formulations) can itself be constrained from observed meridional temperature gradients.

## A.3 Spectral Methods and Spherical Harmonics

On the sphere, the natural basis functions for spectral models are the **spherical harmonics**

\[
Y_n^m(\lambda, \phi) = P_n^m(\sin\phi) \, e^{im\lambda},
\]

where \( P_n^m \) are the associated Legendre polynomials, \( n \ge 0 \) is the total wavenumber, and \( -n \le m \le n \) is the zonal wavenumber. Any square-integrable function on the sphere can be expanded as

\[
f(\lambda,\phi) = \sum_{n=0}^{\infty} \sum_{m=-n}^{n} \hat{f}_n^m Y_n^m(\lambda, \phi),
\]

with coefficients \( \hat{f}_n^m = \int_{\mathbb{S}^2} f(\lambda,\phi) \overline{Y_n^m(\lambda,\phi)} \, d\Omega \). Spectral atmospheric models truncate this expansion at total wavenumber \( N \), yielding horizontal resolution \( \sim \pi a / N \) where \( a \) is Earth's radius. A triangular truncation T85, for example, corresponds to roughly 140 km resolution. The Laplacian operator \( \nabla^2 Y_n^m = -n(n+1)a^{-2} Y_n^m \), so diffusion and Helmholtz operators are diagonal in spectral space — a key computational advantage.

## A.4 Linear Algebra in Climate Data Analysis

The central linear algebra operations in climate analysis — EOF decomposition, optimal fingerprinting, and data assimilation — all rely on the spectral properties of symmetric positive semidefinite matrices. The **covariance matrix** \( \mathbf{C} = \mathbf{X}^T\mathbf{X}/(N-1) \) has eigendecomposition \( \mathbf{C} = \mathbf{V}\boldsymbol{\Lambda}\mathbf{V}^T \) with non-negative eigenvalues \( \lambda_1 \ge \lambda_2 \ge \cdots \ge 0 \). In **optimal fingerprinting** for climate change detection, the signal-to-noise ratio is maximized by projecting observations onto patterns that maximize signal relative to natural variability, leading to the **generalized eigenvalue problem**

\[
\mathbf{C}_s \mathbf{v} = \lambda \mathbf{C}_n \mathbf{v},
\]

where \( \mathbf{C}_s \) is the signal covariance and \( \mathbf{C}_n \) is the natural variability (noise) covariance. Detection is achieved when the projection of observations onto the dominant eigenvector \( \mathbf{v}_1 \) is statistically inconsistent with natural variability alone.

## A.5 Stochastic Climate Models

The climate system responds to both deterministic forcing and stochastic noise from unresolved processes. The **Hasselmann stochastic climate model** treats the slow ocean as a red-noise integrator of white-noise atmospheric forcing:

\[
C\frac{dT}{dt} = -\lambda T + F(t),
\]

where \( F(t) \) is a white-noise stochastic forcing (representing weather variability) with \( \langle F(t) F(t') \rangle = Q\delta(t-t') \). The steady-state solution is an **Ornstein-Uhlenbeck process** with power spectrum

\[
S_T(f) = \frac{Q/C^2}{\lambda^2/C^2 + (2\pi f)^2},
\]

which is white at high frequencies (\( f \gg \lambda/2\pi C \)) and red (\( \propto f^{-2} \)) at low frequencies. This simple model reproduces the observed red spectrum of sea surface temperature anomalies, explaining much of apparent low-frequency climate variability as the passive response of the ocean to weather noise rather than genuine low-frequency forcing.

Stochastic differential equations also arise naturally in MCMC (Section 8.3) via Langevin dynamics, in the theory of stochastic resonance (whereby a system subjected to noise and weak periodic forcing can exhibit enhanced response near tipping thresholds), and in data assimilation schemes that propagate uncertainty forward in time through ensemble methods.

---

<div class="remark">
These notes synthesize material from both the W24 and W25 offerings of AMATH 900 and aim to present the mathematical foundations at a graduate level. The field of climate mathematics is rapidly evolving: machine learning methods (Chapter 4) are increasingly used for emulation, bias correction, and pattern recognition; data assimilation techniques from numerical weather prediction are being adapted for climate reanalysis; and new theoretical frameworks from non-equilibrium statistical mechanics are being applied to understand tipping points and rare events. Students are encouraged to engage with the primary literature, particularly the IPCC AR6 report and the references listed at the beginning of these notes, to deepen their understanding beyond what these notes can provide.
</div>
