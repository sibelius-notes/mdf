---
title: "ENVE 383: Hydrologic Modelling"
subjects: "ENVE"
---

## Sources and References

**Primary texts** — Dingman, S. L., *Physical Hydrology*; Beven, K. J., *Rainfall-Runoff Modelling: The Primer*.

**Supplementary texts** — Chow, V. T., Maidment, D. R., and Mays, L. W., *Applied Hydrology*; Singh, V. P. (ed.), *Computer Models of Watershed Hydrology*; Brutsaert, W., *Hydrology: An Introduction*.

**Online resources** — US Army Corps of Engineers HEC-HMS and HEC-RAS documentation; USDA SWAT public documentation; NOAA National Weather Service hydrology training; Environment and Climate Change Canada climate and hydrology data portals; MIT OpenCourseWare 1.72 *Groundwater Hydrology* and related hydrology open resources.

---

# Chapter 1: Hydrologic Systems and the Water Balance

Hydrologic modelling represents the water cycle at the scale of a watershed. A watershed converts precipitation into streamflow, evapotranspiration, and storage changes through a network of physical processes. Modelling supports water-resource planning, flood forecasting, drought assessment, and climate-change impact studies.

## 1.1 The Water Balance

For a watershed of area \(A\), the conservation of water is

\[
\frac{dS}{dt} = P - ET - Q - G
\]

with \(P\) precipitation, \(ET\) evapotranspiration, \(Q\) streamflow out of the watershed, \(G\) net groundwater export, and \(S\) storage (snow, soil moisture, groundwater, surface water). Closing the balance — even approximately — is a first check on any dataset.

## 1.2 Scales and Modelling Purposes

Models differ in spatial resolution (lumped, semi-distributed, fully distributed), temporal resolution (event, daily, sub-hourly), and process representation (empirical, conceptual, physically based). The choice follows from the purpose: a reconnaissance estimate of mean annual yield uses very different tools than real-time flood forecasting.

<div class="definition">
<strong>Hydrologic model.</strong> A mathematical description of water storage and flow in a watershed used to estimate hydrologic variables for planning, design, operation, and research, while explicitly acknowledging assumptions and uncertainty.
</div>

# Chapter 2: Hydrometeorological Data

## 2.1 Precipitation

Precipitation is measured by gauges and estimated by remote sensing (radar, satellite). Point measurements are extended to the basin via Thiessen polygons, isohyetal methods, or kriging. Gauge undercatch corrections — particularly for snow — can be substantial.

## 2.2 Temperature and Radiation

Temperature drives snowmelt, evapotranspiration, and phase determination. Incident shortwave and longwave radiation provide the energy for evapotranspiration and snowmelt. Instrumentation ranges from standard climate stations to eddy-covariance towers that measure turbulent energy and water fluxes.

## 2.3 Streamflow

Stage is measured continuously; discharge is derived via a rating curve developed from paired stage-discharge measurements using current meters or acoustic Doppler profilers. Flow duration curves and flood frequency curves summarize the streamflow record.

## 2.4 Data Quality and Preprocessing

Preprocessing includes infilling gaps, homogenization, outlier detection, and consistency checks. Mass-curve (double-mass) analysis reveals changes in gauge exposure or watershed conditions. Modern workflows automate these steps but still require visual review.

# Chapter 3: Hydrologic Processes

## 3.1 Interception, Throughfall, Stemflow

Canopies intercept a portion of rainfall, with a storage capacity that depends on leaf area index. Excess becomes throughfall; a small fraction reaches the ground as stemflow. In forested catchments, interception losses can be 10–25% of annual precipitation.

## 3.2 Evapotranspiration

Reference evapotranspiration uses the Penman–Monteith equation:

\[
\lambda E = \frac{\Delta(R_n - G) + \rho_a c_p \left(\frac{e_s - e_a}{r_a}\right)}{\Delta + \gamma(1 + r_s/r_a)}
\]

with \(\Delta\) the slope of the saturation vapour pressure curve, \(\gamma\) the psychrometric constant, \(r_a, r_s\) aerodynamic and surface resistances. Actual ET from a watershed is modulated by soil moisture; reduction functions scale potential ET when soils dry.

## 3.3 Infiltration

Infiltration capacity exceeds rainfall for dry soils; as the soil wets, capacity declines. The Green–Ampt model

\[
f(t) = K\left(1 + \frac{(\theta_s - \theta_i)\psi}{F(t)}\right)
\]

derives from a sharp wetting front; the Horton model uses empirical decay. Variable source areas expand during storms as near-stream soils saturate.

## 3.4 Snowmelt

Snowmelt energy balance combines net radiation, sensible and latent heat, ground conduction, and advected heat:

\[
Q_m = Q^* + Q_h + Q_e + Q_g + Q_p
\]

Temperature-index (degree-day) models approximate melt as \(M = M_f(T - T_0)\) with melt factor \(M_f\). Spatially distributed snow models include snow redistribution by wind and canopy effects.

## 3.5 Routing

Channel routing uses hydraulic (Saint-Venant) or hydrologic (Muskingum, kinematic wave) methods. The Muskingum method

\[
O_2 = C_1 I_2 + C_2 I_1 + C_3 O_1
\]

with coefficients determined by storage and travel-time parameters \(K\) and \(X\), is widely used in semi-distributed models.

<div class="example">
<strong>Rational vs SCS for peak flows.</strong> For a 50 ha urban catchment, the rational method (<em>Q = CiA</em>) and the SCS curve number method give different peak flows and hydrograph shapes. The rational method suits small, quickly responding catchments; SCS suits larger, semi-distributed applications where runoff depth needs abstraction accounting.
</div>

# Chapter 4: Model Types and Architectures

## 4.1 Conceptual Lumped Models

Models such as SAC-SMA, HBV, and GR4J use a handful of conceptual stores and parameters to predict basin response. They calibrate well to streamflow records and support operational flood forecasting.

## 4.2 Semi-Distributed Models

HEC-HMS, HSPF, and SWMM divide the watershed into subbasins or hydrologic response units and route between them. Parameters are lumped within units but vary between units, balancing fidelity and data demand.

## 4.3 Fully Distributed Physically Based Models

MIKE SHE, ParFlow, and VIC represent process physics on spatial grids. They require detailed data (topography, soil, land cover, meteorology) and are computationally intensive but provide insight into spatially variable processes.

## 4.4 Data-Driven Models

Neural networks, especially long-short-term memory (LSTM) networks, have achieved state-of-the-art streamflow prediction when trained on many basins. They complement process models — particularly where physical understanding is limited or data are abundant.

# Chapter 5: Calibration, Validation, and Performance Assessment

## 5.1 Calibration Objectives

Manual and automated calibration adjust parameters to match observed streamflow. Common objective functions include Nash–Sutcliffe efficiency

\[
\mathrm{NSE} = 1 - \frac{\sum (Q_{\text{obs}} - Q_{\text{sim}})^2}{\sum (Q_{\text{obs}} - \bar Q_{\text{obs}})^2}
\]

Kling–Gupta efficiency, root-mean-square error, and volumetric bias. Multi-objective calibration balances performance across flow regimes (high flows, low flows, timing).

## 5.2 Uncertainty Quantification

GLUE (generalized likelihood uncertainty estimation), MCMC, and formal Bayesian approaches sample parameter posterior distributions consistent with data. Predictive uncertainty combines parameter, structural, input, and observation uncertainty; acknowledging each is essential.

## 5.3 Equifinality

Multiple parameter sets can produce similar fits to calibration data but diverge when extrapolated. Equifinality argues for using ensembles rather than single "best" parameters, and for seeking additional observation types (groundwater levels, ET, soil moisture, snow cover) to constrain models.

# Chapter 6: Applications and Modern Software

## 6.1 Flood Forecasting

Real-time flood forecasting pairs hydrologic models with weather forecasts and data assimilation. Ensemble streamflow predictions inform flood warnings with quantified probabilities. Lead time and skill depend on basin size and meteorological forecast quality.

## 6.2 Design Flood Estimation

Design-flood estimation combines frequency analysis of observed peaks (Log-Pearson III, GEV) with rainfall–runoff modelling for ungauged basins and non-stationary conditions. Climate-informed design adjusts IDF curves using climate projections or change factors.

## 6.3 Managed Watersheds

Reservoirs, diversions, and land management change the water balance. Scenario analyses with coupled reservoir operation models support water supply planning, environmental flow negotiations, and trade-off analysis between competing uses.

## 6.4 Modern Software Ecosystem

HEC-HMS and HEC-RAS (USACE, free), SWAT (USDA, free), MIKE SHE (DHI, commercial), PCSWMM (CHI, commercial), ParFlow (research, open source), Raven (University of Waterloo, open source) — the ecosystem is rich. Python (xarray, PyWEM, PyHMT2D) and R packages provide scripted analysis and plotting. Version control, reproducible computing environments (conda, Docker), and open data publishing are becoming standard.

<div class="remark">
<strong>Models as instruments.</strong> Hydrologic models are instruments of reasoning: they make assumptions explicit, quantify uncertainty, and enable structured comparison of alternatives. They are not truth generators. The competent modeller pairs rigorous computation with fieldwork, data curation, and honest acknowledgement of what the model can and cannot say.
</div>
