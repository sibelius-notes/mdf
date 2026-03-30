---
title: "AMATH 362: Mathematics of Climate Change"
prof: Alain Gervais
subjects: "AMATH"
---

## Sources and References

**Primary textbook** — No required textbook; readings posted on LEARN.
**Supplementary texts** — Pierrehumbert, R. T. (2010). *Principles of Planetary Climate*. Cambridge University Press; Strogatz, S. H. (2018). *Nonlinear Dynamics and Chaos*, 2nd ed. CRC Press (for dynamical systems sections); Northrop, M., & Hufbauer, G. C. (Eds.) (2019). *Playing It Cool: High-value Strategies for Reducing Greenhouse Gas Emissions*. (Economics.)
**Online resources** — IPCC Assessment Reports (ipcc.ch); NOAA Climate.gov; NASA GISS Surface Temperature Analysis (data.giss.nasa.gov); NCAR Climate Data Guide (climatedataguide.ucar.edu); Fourier Analysis MIT OCW 18.03 notes.

---

# Chapter 1: Overview — Mathematics, Science, and Impacts of Climate Change

## 1.1 Why Mathematics for Climate?

Climate is a complex physical system governed by conservation laws (energy, mass, momentum) and the interactions among atmosphere, ocean, land surface, and biosphere. Mathematical models provide the only rigorous framework for:
- **Understanding** mechanisms and feedback loops.
- **Predicting** future states under different emission scenarios.
- **Quantifying uncertainty** in projections.
- **Evaluating** policy options.

**Reductionism in mathematics**: a hallmark of applied mathematics is deliberately simplifying complex systems to extract essential behaviour. We build a hierarchy of models — from zero-dimensional energy balance to coupled GCMs (General Circulation Models) — each capturing different aspects of climate at different levels of complexity.

## 1.2 Climate vs. Weather

<div class="definition">
<strong>Weather</strong> is the short-term (days to weeks) state of the atmosphere at a specific location. <strong>Climate</strong> is the long-term statistical description (means, variances, extremes) of weather over periods of decades, typically 30-year averages. Climate change refers to statistically significant shifts in climate statistics over time.
</div>

The distinction matters mathematically: weather is chaotic (sensitive to initial conditions; predictability horizon ~2 weeks), while climate statistics can be much more predictable because they are governed by slower physical processes (Earth's energy balance, ocean heat uptake, ice feedbacks).

## 1.3 Key Climate Observations

- **Global mean surface temperature (GMST)** has increased ~1.1°C above pre-industrial levels (IPCC AR6, 2021).
- **Atmospheric CO₂**: pre-industrial ~280 ppm; current ~420 ppm (Keeling Curve, Mauna Loa Observatory, 1958–present).
- **Sea level rise**: ~20 cm since 1900; accelerating.
- **Arctic sea ice**: summer minimum area declined ~13%/decade since 1979.
- **Extreme events**: increased frequency and intensity of heat waves, heavy precipitation, tropical cyclones.

---

# Chapter 2: Energy Balance Models

## 2.1 The Earth as a Blackbody

The simplest climate model treats Earth as a sphere in radiative equilibrium with the Sun.

<div class="definition">
A <strong>blackbody</strong> is an idealized object that absorbs all incident electromagnetic radiation and emits radiation according to the <strong>Stefan-Boltzmann law</strong>:
\[ F = \sigma T^4 \]
where \( F \) (W m\(^{-2}\)) is the emitted power per unit area, \( \sigma = 5.67 \times 10^{-8} \, \text{W m}^{-2}\text{K}^{-4} \) is the Stefan-Boltzmann constant, and \( T \) (K) is the absolute temperature.
</div>

**Solar constant**: the solar flux at Earth's mean orbital distance is \( S_0 \approx 1361 \, \text{W m}^{-2} \).

**Energy input**: the Earth intercepts solar radiation over a cross-sectional area \( \pi R_E^2 \) (disk area). Averaged over the spherical surface area \( 4\pi R_E^2 \), the average insolation is \( S_0/4 \approx 340 \, \text{W m}^{-2} \). Accounting for planetary albedo \( \alpha \approx 0.30 \) (fraction of sunlight reflected):
\[ Q_{in} = \frac{S_0(1-\alpha)}{4} \approx 238 \, \text{W m}^{-2} \]

**Energy output** (longwave/OLR): the Earth emits as a greybody:
\[ Q_{out} = \epsilon\sigma T_s^4 \]
where \( \epsilon \approx 1 \) for the surface but greenhouse gases reduce the effective emissivity to space.

## 2.2 Zero-Dimensional Energy Balance Model (EBM)

**Equilibrium**: set absorbed solar = outgoing longwave:
\[ \frac{S_0(1-\alpha)}{4} = \sigma T_e^4 \]

Solving for the **effective radiating temperature**:
\[ T_e = \left(\frac{S_0(1-\alpha)}{4\sigma}\right)^{1/4} \approx 255 \, \text{K} = -18°\text{C} \]

The observed mean surface temperature is ~288 K = +15°C. The difference (~33 K) is the **greenhouse effect**: greenhouse gases (CO₂, H₂O, CH₄, N₂O) absorb outgoing longwave radiation and re-emit it, warming the surface.

## 2.3 The Greenhouse Effect and Forcing

**Radiative forcing** \( \Delta F \): the change in net radiative flux at the tropopause due to a perturbation (e.g., doubling CO₂). For CO₂:
\[ \Delta F_{2\times CO_2} \approx 3.7 \, \text{W m}^{-2} \]

**No-feedback temperature response**: if the climate responded linearly and the only change was the CO₂ forcing:
\[ \Delta T_0 = \frac{\Delta F}{4\sigma T_e^3} \approx \frac{3.7}{3.3} \approx 1.1 \, \text{K} \]

## 2.4 Climate Feedbacks

<div class="definition">
A <strong>climate feedback</strong> is a process in which a change in climate (e.g., warming) triggers a secondary change that in turn affects the original forcing. <strong>Positive feedbacks</strong> amplify the initial change; <strong>negative feedbacks</strong> dampen it.
</div>

**Feedback parameter** \( \lambda \) (W m\(^{-2}\) K\(^{-1}\)): total feedback is \( \lambda = \lambda_0 + \sum \lambda_i \), where \( \lambda_0 = -4\sigma T_e^3 \approx -3.3 \, \text{W m}^{-2}\text{K}^{-1} \) is the Planck (blackbody) feedback (stabilizing).

**Equilibrium Climate Sensitivity (ECS)**:
\[ \text{ECS} = -\frac{\Delta F_{2\times CO_2}}{\lambda} = \frac{3.7}{3.3 - \sum \lambda_i^{pos}} \]

| Feedback | \( \lambda_i \) (W m\(^{-2}\)K\(^{-1}\)) | Sign | Mechanism |
|---------|----------------------------------------|------|-----------|
| Water vapour | ~+1.6 | Positive | Warmer atmosphere holds more H₂O (strong GHG) |
| Lapse rate | ~−0.6 | Negative | Warming alters temperature gradient; tropical troposphere warms more than surface |
| Surface albedo (ice-albedo) | ~+0.4 | Positive | Melting ice → less reflection → more absorption |
| Cloud (SW) | ~+0.4 | Positive (uncertain) | High clouds decrease, reducing SW reflection |
| Cloud (LW) | ~−0.6 | Negative (uncertain) | High clouds decrease, reducing LW trapping |

Net feedback is positive (amplifying), giving ECS ~2.5–4.0 K (IPCC likely range: 2.5–4.0°C per doubling CO₂).

## 2.5 Ice-Albedo Feedback and Bifurcations

Including the ice-albedo feedback, the albedo becomes a function of temperature \( \alpha(T) \). The EBM becomes:
\[ C\frac{dT}{dt} = \frac{S_0(1-\alpha(T))}{4} - \sigma T^4 \]

where \( C \) is the ocean heat capacity.

**Snowball Earth**: for sufficiently low solar forcing or high albedo, the system can **bifurcate** to a fully ice-covered state (snowball Earth). The system exhibits **hysteresis** — different equilibria are reached depending on initial conditions, and recovering from a snowball state requires dramatically higher solar forcing than caused it.

**Mathematical structure**: The equilibrium condition \( dT/dt = 0 \) may have up to three fixed points (cold glaciated, ice-free, and an unstable intermediate). Stability analysis reveals which fixed points are attractors.

---

# Chapter 3: Climate Data and Fourier Analysis

## 3.1 Time Series Analysis of Climate Data

Climate datasets (temperature, precipitation, sea level, CO₂) are time series: sequences of measurements \( \{x_1, x_2, \ldots, x_N\} \) at times \( \{t_1, t_2, \ldots, t_N\} \). Key tasks:
- Identify trends (long-term changes).
- Identify periodic cycles (seasonal, annual, decadal).
- Identify anomalies (El Niño, volcanic eruptions).
- Quantify noise and variability.

## 3.2 The Discrete Fourier Transform

<div class="definition">
The <strong>Discrete Fourier Transform (DFT)</strong> of a time series \( \{x_n\}_{n=0}^{N-1} \) is:
\[ X_k = \sum_{n=0}^{N-1} x_n e^{-2\pi i kn/N}, \quad k = 0, 1, \ldots, N-1 \]
The inverse DFT recovers the original series:
\[ x_n = \frac{1}{N}\sum_{k=0}^{N-1} X_k e^{2\pi i kn/N} \]
</div>

**Physical interpretation**: \( |X_k|^2 \) is proportional to the **power spectral density** at frequency \( f_k = k/(N\Delta t) \) (Hz), where \( \Delta t \) is the sampling interval. The Fourier transform decomposes the signal into sinusoidal components at different frequencies.

**Sampling theorem (Nyquist)**: to detect cycles at frequency \( f \), the sampling rate must be at least \( 2f \) (Nyquist frequency \( f_N = 1/(2\Delta t) \)).

## 3.3 Climate Signals in the Frequency Domain

**Seasonal cycle**: dominant annual periodicity (\( f = 1 \, \text{yr}^{-1} \)) in virtually all surface climate records.

**Milanković cycles**: periodic changes in Earth's orbital parameters:
- **Eccentricity**: ~100 kyr cycle (shape of orbit).
- **Obliquity**: ~41 kyr cycle (tilt of spin axis, 22.1°–24.5°).
- **Precession**: ~26 kyr cycle (orientation of spin axis).

These cycles are visible as spectral peaks in paleoclimate proxy records (ice cores, deep-sea sediments) and are the **pacemaker of the ice ages**.

**Trend removal**: climate records exhibit superimposed trends (anthropogenic warming) plus variability. Linear detrending isolates the variability; or compute anomalies by subtracting the climatological mean for each calendar month.

**ENSO spectral signature**: El Niño events have a characteristic period of 2–7 years, visible in power spectra of tropical Pacific SST anomalies.

## 3.4 Moving Averages and Filters

A **low-pass filter** retains low-frequency (slowly varying) components and removes high-frequency noise:
- **Running mean** over \( M \) time steps: \( \bar{x}_n = \frac{1}{M}\sum_{m=0}^{M-1} x_{n-m} \).
- In Fourier space, multiplication by a window function.

A **high-pass filter** retains variability; a **band-pass filter** selects a range of frequencies (e.g., to isolate ENSO signal: ~2–7 year band).

---

# Chapter 4: Spatial Data and Linear Algebra — EOF Analysis

## 4.1 Climate Fields as Matrices

Climate observations often have both **spatial** and **temporal** dimensions. For example, monthly sea surface temperature (SST) observations at \( M \) spatial grid points over \( N \) months form a data matrix:
\[ \mathbf{X} \in \mathbb{R}^{M\times N} \]

Each row is a spatial location's time series; each column is a global spatial snapshot.

## 4.2 Empirical Orthogonal Functions (EOF Analysis / PCA)

<div class="definition">
<strong>EOF analysis</strong> (also called Principal Component Analysis, PCA) finds the dominant patterns of spatial variability in a climate dataset. The <strong>EOFs</strong> (empirical orthogonal functions) are the eigenvectors of the spatial covariance matrix; the corresponding <strong>principal components (PCs)</strong> are the associated time series.
</div>

**Mathematical procedure**:
1. Form the anomaly matrix by subtracting the temporal mean: \( \mathbf{X}' = \mathbf{X} - \bar{\mathbf{X}} \).
2. Compute the **spatial covariance matrix**: \( \mathbf{C} = \frac{1}{N}\mathbf{X}'\mathbf{X}'^T \in \mathbb{R}^{M\times M} \).
3. Eigendecompose: \( \mathbf{C} = \mathbf{E}\mathbf{\Lambda}\mathbf{E}^T \) where columns of \( \mathbf{E} \) are the EOFs (orthogonal) and \( \mathbf{\Lambda} = \text{diag}(\lambda_1, \ldots, \lambda_M) \) with \( \lambda_1 \geq \lambda_2 \geq \ldots \).
4. **Principal components**: \( \mathbf{PC}_k = \mathbf{e}_k^T \mathbf{X}' \) (time series of amplitude of EOF \( k \)).

**Interpretation**: EOF 1 (associated with the largest eigenvalue \( \lambda_1 \)) explains the largest fraction of total variance \( \lambda_1 / \sum_k \lambda_k \). Each EOF is a spatial pattern; its PC is how that pattern varies in time.

## 4.3 SVD Connection

Equivalently, the EOF analysis is the **Singular Value Decomposition (SVD)** of the anomaly matrix:
\[ \mathbf{X}' = \mathbf{U}\mathbf{\Sigma}\mathbf{V}^T \]

The columns of \( \mathbf{U} \) are the EOFs; the columns of \( \mathbf{V} \) are the normalized PCs; the diagonal of \( \mathbf{\Sigma} \) contains the singular values (related to the square roots of eigenvalues). The SVD is computationally more efficient and numerically stable than eigendecomposition of the covariance matrix.

## 4.4 Physical Application: EOF of SST → ENSO

EOF 1 of tropical Pacific SST anomalies is the **ENSO mode**: a large warm or cool anomaly centered in the eastern tropical Pacific. PC 1 is the **Niño 3.4 index** (time series of east-central Pacific SST anomaly, a standard ENSO index).

Higher EOFs capture other modes of variability (e.g., Pacific Decadal Oscillation, Indian Ocean Dipole).

---

# Chapter 5: El Niño–Southern Oscillation (ENSO)

## 5.1 What is ENSO?

<div class="definition">
<strong>ENSO</strong> (El Niño–Southern Oscillation) is the dominant mode of interannual (2–7 year) climate variability globally. It consists of coupled ocean-atmosphere oscillations in the tropical Pacific Ocean:
<ul>
<li><strong>El Niño</strong>: warm phase; anomalously warm SST in the central and eastern tropical Pacific; weakened trade winds.</li>
<li><strong>La Niña</strong>: cold phase; anomalously cool SST; strengthened trade winds.</li>
<li><strong>Neutral</strong>: intermediate state.</li>
</ul>
</div>

## 5.2 Walker Circulation and Normal Conditions

Under normal (non-ENSO) conditions, **trade winds** blow westward across the tropical Pacific, piling up warm water in the western Pacific (warm pool). Cold water upwells in the eastern Pacific (La Niña-like conditions). This sustains the **Walker Circulation**: rising air over the warm west Pacific, east-west pressure gradient.

## 5.3 ENSO Dynamics — Bjerknes Feedback

**Bjerknes positive feedback** (1969): the key amplifying mechanism:
- Anomalous warming in eastern Pacific → weakens trade winds.
- Weaker trades → less cold upwelling → further warming.
- Self-reinforcing loop creates El Niño.

**Recharge oscillator model** (Jin, 1997): simple mathematical model capturing ENSO as an oscillator. Two variables: eastern Pacific SST anomaly \( T \) and equatorial Pacific warm water volume (thermocline depth) \( h \):
\[ \frac{dT}{dt} = \mu_a b T - \alpha T + \mu_a h \]
\[ \frac{dh}{dt} = -r h - \mu_b T \]

This linear system oscillates with a period of ~3–4 years for physically realistic parameters. ENSO arises from the interaction between fast SST dynamics and slow thermocline recharge/discharge.

## 5.4 Global Teleconnections

El Niño events affect weather worldwide through atmospheric **teleconnections**:
- **North America**: warmer, drier winters in the Pacific Northwest; wetter winters in the southeastern US.
- **Australia/Indonesia**: drought, bushfire risk.
- **East Africa**: above-normal rainfall.
- **Peru/Ecuador**: heavy rainfall, flooding.
- **India**: weakened monsoon (correlation not deterministic).

ENSO is the single most important source of global interannual climate variability.

---

# Chapter 6: The Role of Oceans and Earth's Rotation

## 6.1 The Coriolis Effect

<div class="definition">
The <strong>Coriolis effect</strong> is an apparent force in a rotating reference frame (the Earth) that deflects moving objects: to the right in the Northern Hemisphere (NH) and to the left in the Southern Hemisphere (SH).
</div>

For a parcel moving at velocity \( \mathbf{v} \) on a rotating Earth (angular velocity \( \mathbf{\Omega} \)):
\[ \mathbf{F}_{Cor} = -2m\mathbf{\Omega}\times\mathbf{v} \]

The **Coriolis parameter** \( f = 2\Omega\sin\phi \) (s\(^{-1}\)), where \( \phi \) is latitude.

**Consequences**:
- **Geostrophic balance**: large-scale atmospheric and oceanic flows balance pressure gradient against Coriolis force → winds/currents flow along, not across, isobars.
- **Cyclones/anticyclones**: low-pressure systems spin counterclockwise in NH, clockwise in SH.
- **Ocean gyres**: large-scale circulation cells driven by wind stress; western boundary currents (Gulf Stream, Kuroshio) are intense and narrow due to **Sverdrup balance**.
- **Ekman transport**: surface ocean layer driven perpendicular to wind direction (90° to the right in NH), causing coastal upwelling/downwelling.

## 6.2 Ocean Heat Uptake and the Thermohaline Circulation

**Oceans as heat buffers**: the ocean has ~1000× the heat capacity of the atmosphere; it takes up ~90% of the excess heat from the enhanced greenhouse effect, slowing surface warming.

**Thermohaline circulation (THC)** / **Atlantic Meridional Overturning Circulation (AMOC)**:
- Surface heat loss in the North Atlantic makes water cold and dense → sinks.
- Deep water flows south; surface water flows north (Gulf Stream extension).
- Returns heat to Europe; maintains European climate significantly warmer than similar latitudes elsewhere.

**AMOC weakening**: freshwater input from Greenland ice sheet melt can reduce deep water formation → weaken AMOC → potential tipping point in the climate system.

---

# Chapter 7: Natural Climate Variability (Extra Topics)

## 7.1 Paleoclimate and Ice Ages

**Ice cores** (Vostok, EPICA Dome C, NEEM): provide records of temperature (from δ¹⁸O and δD), CO₂, CH₄, dust, and other quantities over hundreds of thousands of years. Key findings:
- CO₂ and temperature are tightly correlated over glacial-interglacial cycles.
- Pre-industrial CO₂ never exceeded ~300 ppm in the past 800,000 years; current ~420 ppm is unprecedented.
- Glacial-interglacial temperature changes: ~5°C global average, ~10°C at the poles.

**Milanković theory**: glacial cycles are paced by orbital forcing; however, the orbital changes are small (< 1 W m⁻²) and amplified by feedbacks (ice-albedo, CO₂, methane).

## 7.2 Volcanic Forcing

Large volcanic eruptions (Pinatubo 1991, Tambora 1815) inject sulfur dioxide into the stratosphere → sulfate aerosols → increased albedo → temporary surface cooling (~0.3–0.5°C for 1–3 years). Detected as negative spikes in temperature records and in ice core sulfate layers.

## 7.3 Solar Variability

The Sun's luminosity varies by ~0.1% over the ~11-year sunspot cycle — a small forcing (~0.1 W m⁻²). Solar activity has been flat or slightly declining since 1980, ruling it out as a cause of recent warming.

---

# Chapter 8: Population Dynamics and Climate Change

## 8.1 Malthus and Logistic Growth

**Malthusian (exponential) growth**: unlimited resources → population grows exponentially:
\[ \frac{dN}{dt} = rN \implies N(t) = N_0 e^{rt} \]

where \( r \) is the intrinsic growth rate.

**Logistic equation** (Verhulst, 1838): incorporates carrying capacity \( K \):
\[ \frac{dN}{dt} = rN\left(1 - \frac{N}{K}\right) \]

**Equilibria**: \( N^* = 0 \) (unstable) and \( N^* = K \) (stable).

**Solution**:
\[ N(t) = \frac{K}{1 + \left(\frac{K}{N_0} - 1\right)e^{-rt}} \]

S-shaped (sigmoidal) growth; approaches \( K \) asymptotically.

## 8.2 Effect of Climate Change on Carrying Capacity

Climate change affects the carrying capacity \( K(t) \) through:
- **Agricultural productivity**: higher temperatures and altered precipitation patterns reduce crop yields in many regions; CO₂ fertilization partially offsets this.
- **Water availability**: shifting precipitation patterns, glacial retreat, increased drought frequency.
- **Extreme events**: floods, heat waves, tropical cyclones reduce food production.
- **Ecosystem services**: biodiversity loss, ocean acidification (reduced fisheries), deforestation.

**Modified logistic model with climate-dependent K**:
\[ \frac{dN}{dt} = rN\left(1 - \frac{N}{K(T(t))}\right) \]
where \( T(t) \) is the time-evolving global mean temperature and \( K(T) \) is a decreasing function of temperature above an optimum.

## 8.3 Multi-Species Models (Lotka-Volterra)

The Lotka-Volterra equations describe predator-prey dynamics:
\[ \frac{dN}{dt} = \alpha N - \beta NP \quad \text{(prey)} \]
\[ \frac{dP}{dt} = \delta NP - \gamma P \quad \text{(predator)} \]

Climate change affects prey and predator parameters differently, potentially desynchronizing oscillations (**phenological mismatch**) and causing species collapse.

---

# Chapter 9: The Economics of Climate Change

## 9.1 The Social Cost of Carbon

<div class="definition">
The <strong>social cost of carbon (SCC)</strong> is the net economic harm done by emitting one additional tonne of CO₂, expressed in present dollars. It is the key parameter for cost-benefit analysis of climate policy.
</div>

Estimating the SCC requires:
1. An **emissions scenario**: how much CO₂ is emitted over time.
2. A **climate model**: relating CO₂ to temperature change.
3. A **damage function**: relating temperature change to economic losses.
4. A **discount rate**: how to weigh future losses against present costs.

**Discount rate controversy**: choosing a 5% vs. 1% discount rate dramatically changes the SCC. Nordhaus (2018 Nobel Prize) uses ~4%: SCC ~$40/tonne. Stern Review (2006) uses ~1.4%: SCC ~$85–$350/tonne. The choice reflects ethical judgements about intergenerational equity.

## 9.2 Integrated Assessment Models (IAMs)

**IAMs** combine economic and climate models:
- **DICE model** (Nordhaus): a single-region, aggregate model. Economy emits CO₂; CO₂ warms climate; damage function reduces GDP; optimal policy minimizes total cost (mitigation + damages) over time.

Simple DICE-like model:
\[ Y(t) = A(t) K(t)^\gamma L(t)^{1-\gamma} \quad \text{(production)} \]
\[ C(t) = Y(t)\left[1 - \Omega(T)\right] - I(t) \quad \text{(consumption, net of climate damage)} \]
where \( \Omega(T) = 1 - (1 + \psi_1 T + \psi_2 T^2)^{-1} \) is the damage function.

## 9.3 Policy Instruments

| Instrument | Description | Mathematical form |
|-----------|-------------|------------------|
| **Carbon tax** | Price placed on each tonne of CO₂ emitted | Sets \( p_{CO_2} = \text{SCC} \); emitters reduce until marginal abatement cost = \( p_{CO_2} \) |
| **Cap-and-trade** | Total emissions cap; permits traded | Market price = shadow price of cap; efficient allocation via equilibrium |
| **Regulation** | Technology or performance standards | Minimum efficiency or maximum emission rate |
| **Subsidy** | Support for clean technologies | Reduces cost of low-carbon alternatives |

**Efficiency theorem** (Pigou): a Pigouvian tax equal to the externality (SCC) achieves the socially optimal level of emissions without command-and-control mandates.

**Political economy**: even efficient policies face distributional concerns (carbon taxes can be regressive unless revenues are recycled) and political barriers (concentrated fossil fuel interests; short political time horizons relative to climate time horizons).

## 9.4 Tipping Points and Non-Linearity

The economic analysis is complicated by **tipping elements** — large, potentially irreversible changes at climate thresholds:
- West Antarctic and Greenland ice sheet collapse.
- Amazon rainforest dieback.
- Permafrost carbon release.
- AMOC collapse.

These introduce non-linearity, fat-tailed risk distributions, and the possibility of **climate tipping cascades** — one tipping point triggering others, potentially precluding stabilization.

**Weitzman's Dismal Theorem**: if there is significant probability of catastrophic, arbitrarily large damages (fat-tailed distribution), standard cost-benefit analysis may assign infinite weight to mitigation — making the discount rate irrelevant. The key policy question becomes: how much insurance is worth buying against low-probability catastrophic outcomes?
