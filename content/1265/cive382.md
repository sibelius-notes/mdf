---
title: "CIVE 382: Hydrology and Open Channel Flow"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Chow, V.T., Maidment, D.R., and Mays, L.W., *Applied Hydrology*, McGraw-Hill, 1988; Chaudhry, M.H., *Open-Channel Flow*, 2nd ed., Springer, 2008.

**Supplementary texts** — Viessman, W. and Lewis, G.L., *Introduction to Hydrology*, 5th ed., Prentice Hall, 2002; Sturm, T.W., *Open Channel Hydraulics*, 2nd ed., McGraw-Hill, 2010.

**Online resources** — MIT OCW 1.72 "Groundwater Hydrology" and 1.061 "Transport Processes in the Environment"; USGS Water Resources publications; Environment and Climate Change Canada hydrometric data; USACE HEC-HMS and HEC-RAS public documentation.

---

# Chapter 1: The Hydrologic Cycle

## 1.1 Water Balance

Conservation at any scale:

\[ P = ET + Q + \Delta S, \]

with precipitation \( P \), evapotranspiration \( ET \), runoff \( Q \), and storage change \( \Delta S \). Watershed-scale: add interception, infiltration, subsurface flow. Annual totals, monthly means, event-based: different balances for different purposes.

## 1.2 Precipitation

Measurement: non-recording (daily) and recording (continuous) gauges; radar (Canadian Radar Network); satellite (GPM, TRMM). Spatial averaging: Thiessen polygons, isohyetal, inverse-distance weighting, kriging. Depth-duration-frequency (DDF) curves derived from annual maxima for design storm selection.

## 1.3 Evapotranspiration

Penman-Monteith the reference equation:

\[ \lambda E = \frac{\Delta(R_n - G) + \rho_a c_p (e_s - e_a)/r_a}{\Delta + \gamma(1 + r_s/r_a)}. \]

Pan evaporation, Thornthwaite, Hargreaves provide simpler estimates. ET typically 60-80% of precipitation in temperate climates.

## 1.4 Infiltration and Subsurface

Horton: \( f(t) = f_c + (f_0 - f_c)e^{-kt} \). Green-Ampt piston-flow model for wetting front. Saturated hydraulic conductivity varies 10\(^8\) across materials (gravel to clay). Soil moisture dynamics govern vegetation stress, recharge, and antecedent conditions for flooding.

# Chapter 2: Frequency Analysis

## 2.1 Statistical Characterization

Annual maxima series for floods, or peaks-over-threshold for partial-duration. Fit distributions: lognormal, Gumbel, Generalized Extreme Value (GEV), log-Pearson Type III (standard for floods in Canada, US). Estimation by method of moments, L-moments, maximum likelihood.

## 2.2 Return Period

\( T = 1/p \) with exceedance probability \( p \). "100-year flood" has 1% chance of being exceeded in any year; ~63% chance over 100 years. Hazard and risk communication must avoid implication of regular recurrence.

## 2.3 Design Storms

DDF curve reads intensity for design return period and duration. SCS Type II, Chicago, Huff, Canadian storms: synthetic hyetographs for runoff calculations. Duration = watershed time of concentration (for peak-flow design).

## 2.4 Regional Analysis and Nonstationarity

Index-flood method pools data across similar basins. Regional regression equations relate flood quantiles to drainage area, impervious cover, slope, storage. Climate nonstationarity invalidates stationary assumptions; moving-window, climate-informed, or trend-fitted approaches adapt.

# Chapter 3: Rainfall-Runoff Processes

## 3.1 Runoff Generation Mechanisms

- **Hortonian overland flow**: rainfall rate exceeds infiltration; dominant in arid and paved areas.
- **Dunne (saturation excess)**: soil saturates from below (rising water table or lateral subsurface convergence); dominant in humid, low-relief areas.
- **Subsurface stormflow**: lateral unsaturated or saturated flow through shallow soil.

Different mechanisms produce different hydrograph shapes and recovery times.

## 3.2 Unit Hydrograph

Linear, time-invariant response of watershed to unit depth of rainfall excess over unit duration. Derived from observed storm-runoff pairs; Snyder and SCS synthetic unit hydrographs estimate from watershed characteristics. Total hydrograph = convolution of excess rainfall with unit hydrograph.

Peak flow \( Q_p = \frac{484 A}{T_p} \) (SCS, Imperial units; metric equivalent with 2.08).

## 3.3 Distributed Models

Physically-based (MIKE SHE, HEC-HMS, SWAT) solve balance equations on grid or subbasin elements. Data demands high; calibration against flow records essential. Returns on complexity diminish unless spatial heterogeneity drives the question.

## 3.4 Urban Hydrology

Impervious cover concentrates and accelerates runoff. Rational method:

\[ Q = C i A, \]

with runoff coefficient \( C \) (0.9 for pavement, 0.1 for forest), intensity \( i \) at time of concentration, area \( A \). Quick peak, higher volume, reduced baseflow, degraded water quality—the hydrologic signature of urbanization.

# Chapter 4: Watershed Analysis

## 4.1 Delineation and Parameters

Watershed boundaries from topographic maps or DEMs (ArcGIS, QGIS). Area, average slope, stream network density, relief ratio, time of concentration, storage. Watershed shape (circular vs. elongated) affects hydrograph.

## 4.2 Land Use Change Impact

Conversion from forest/agriculture to impervious urban increases runoff volume and peak, reduces infiltration and baseflow. Rule of thumb: 10% impervious threshold for aquatic impairment; 25% for severe impairment. Low-impact development (LID) and green infrastructure partially mitigate through distributed storage and infiltration.

## 4.3 Hydrograph Separation

Baseflow vs. direct runoff: graphical methods (N-day, master recession), digital filters (Lyne-Hollick). Separation used to identify groundwater contribution, antecedent conditions, and to develop unit hydrograph.

## 4.4 Routing

- **Hydrologic (lumped)**: Muskingum \( O(t+\Delta t) = C_0 I + C_1 I_{prev} + C_2 O_{prev} \); storage reservoir.
- **Hydraulic (distributed)**: Saint-Venant equations (1D full dynamic) or simplifications (kinematic, diffusion wave).

Routing attenuates and translates flood peaks as they propagate downstream.

# Chapter 5: Open-Channel Flow Fundamentals

## 5.1 Conservation Equations

Continuity: \( \partial A/\partial t + \partial Q/\partial x = 0 \).

Energy for steady flow along a streamline:

\[ z_1 + y_1 + \frac{v_1^2}{2g} = z_2 + y_2 + \frac{v_2^2}{2g} + h_f. \]

Specific energy \( E = y + v^2/(2g) \); plotted versus \( y \) shows minimum at critical depth.

## 5.2 Uniform Flow

Manning's equation for steady uniform:

\[ v = \frac{1}{n}R^{2/3}S^{1/2}, \]

with hydraulic radius \( R = A/P \) and Manning's \( n \) (0.011 smooth concrete, 0.030 natural channel, 0.100 with heavy vegetation). Normal depth \( y_n \) from iteration of Manning's.

## 5.3 Critical Flow

Critical depth minimizes specific energy; Froude number \( Fr = v/\sqrt{gD_h} = 1 \). Subcritical (Fr < 1, tranquil): disturbances propagate upstream; normal for most rivers. Supercritical (Fr > 1, rapid): disturbances only travel downstream; e.g., spillways, steep culverts. Hydraulic jump transitions supercritical to subcritical, dissipating energy.

## 5.4 Energy and Momentum

Energy equation fails across dissipative phenomena (jumps, weirs); momentum equation prevails for force balance. Applied to: hydraulic jumps (depth ratio from momentum conservation), gate forces, bridge piers.

# Chapter 6: Non-Uniform Flow and Hydraulic Structures

## 6.1 Gradually Varied Flow

Steady, nonuniform: \( dy/dx = (S_0 - S_f)/(1 - Fr^2) \). Twelve water surface profiles (M1, M2, M3, S1, S2, S3, C1, C2, C3, H2, H3, A2, A3) based on slope and depth relative to normal and critical. Computed by direct-step or standard-step methods (HEC-RAS).

## 6.2 Rapidly Varied Flow

Hydraulic jumps, weirs, gates, culverts, bridges. Each has characteristic discharge equations:

- Broad-crested weir: \( Q = C_d L H^{3/2} \).
- Sharp-crested weir: \( Q = \tfrac{2}{3}C_d L\sqrt{2g}\, H^{3/2} \).
- Sluice gate: \( Q = C_d b a\sqrt{2g y_1} \).

Culverts: inlet vs. outlet control depending on geometry, submergence, slope.

## 6.3 Dynamic Forces on Submerged Structures

Drag \( F_D = \tfrac{1}{2}\rho C_D A v^2 \); \( C_D \) depends on shape and Reynolds number. Lift forces (asymmetric cross-sections), vortex-induced vibration for slender members. Scour: general (channel-wide degradation), contraction (at bridge), local (around piers, abutments).

## 6.4 Bridge Hydraulics and Scour

Scour at piers: HEC-18 equation \( y_s/y_1 = 2.0 K_1 K_2 K_3 (a/y_1)^{0.65} Fr^{0.43} \), with pier shape \( K_1 \), flow angle \( K_2 \), bed conditions \( K_3 \), pier width \( a \). Flow contraction causes additional scour; abutment scour modeled separately. Scour can exceed pier footing depth and cause catastrophic failures (Schoharie Creek, 1987).

<div class="remark">
Hydrology and open-channel flow join the atmospheric, surface, and subsurface in a continuous water cycle at watershed scale. Design storms, runoff models, channel hydraulics, and scour formulas appear disparate but serve one purpose: predicting water&rsquo;s behavior well enough to accommodate it with robust, economic infrastructure.
</div>
