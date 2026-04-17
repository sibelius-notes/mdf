---
title: "Lab Analysis and Field Sampling Techniques"
prof: "Bill Annable"
subjects: "ENVE"
---

## Sources and References

- Rice, E. W., Baird, R. B., Eaton, A. D., & Clesceri, L. S. (Eds.). (2017). *Standard Methods for the Examination of Water and Wastewater* (23rd ed.). American Public Health Association / American Water Works Association / Water Environment Federation.
- Harris, D. C. (2015). *Quantitative Chemical Analysis* (9th ed.). W. H. Freeman.
- Keith, L. H. (Ed.). (1996). *Principles of Environmental Sampling* (2nd ed.). American Chemical Society.
- U.S. EPA. (2014). *SW-846: Test Methods for Evaluating Solid Waste, Physical/Chemical Methods*. Office of Resource Conservation and Recovery.
- Chapra, S. C., & Canale, R. P. (2010). *Numerical Methods for Engineers* (6th ed.). McGraw-Hill. [statistical background]
- MIT Course 1.017: *Computing and Data Analysis for Environmental Applications*. MIT OpenCourseWare.

---

# Chapter 1: Foundations of Environmental Monitoring and Measurement

## 1.1 Purpose and Scope of Environmental Sampling

Environmental monitoring is the systematic collection and analysis of physical, chemical, and biological data to characterize the state of air, water, and soil compartments. Its objectives range from regulatory compliance and pollution source identification to long-term trend detection and ecological risk assessment. A well-designed monitoring program translates scientific questions into actionable sampling strategies, balancing statistical power against logistical and financial constraints.

The field of environmental sampling draws on principles from analytical chemistry, hydrology, atmospheric science, and statistics. Every measurement in environmental science carries uncertainty arising from spatial and temporal variability of the medium, sample collection artefacts, preservation and transport losses, and analytical instrument error. Quantifying and controlling these uncertainty sources is as important as obtaining the measurement itself.

## 1.2 Measurement Quality: Error, Precision, and Accuracy

Measurement quality is described through accuracy (closeness to the true value) and precision (reproducibility of repeated measurements). Error can be classified as systematic (bias, affecting accuracy) or random (noise, affecting precision). Sources of systematic error include contaminated collection vessels, incorrect calibration standards, analyte adsorption to container walls, and degradation during storage. Random errors arise from subsampling heterogeneous media, instrumental noise, and operator-to-operator variability.

Quality assurance (QA) is the management framework that specifies data quality objectives (DQOs) before sampling begins. Quality control (QC) consists of the specific checks implemented during sample collection and analysis: field blanks (reagent water carried to the site and treated identically to samples), trip blanks (carried but not opened), equipment blanks (rinsate from cleaned equipment), matrix spikes (known analyte additions to a real sample), duplicates, and laboratory control samples (LCS). The ratio of replicate measurements defines the relative percent difference (RPD):

\[
\text{RPD} = \frac{|C_1 - C_2|}{(C_1 + C_2)/2} \times 100\%
\]

Spike recovery is expressed as:

\[
\% \text{Recovery} = \frac{C_\text{spiked sample} - C_\text{unspiked sample}}{C_\text{spike added}} \times 100\%
\]

Acceptable windows for both metrics are stated in the sampling and analysis plan (SAP) before work begins, in accordance with EPA SW-846 method-specific QC criteria.

## 1.3 Sampling Design Strategies

The spatial and temporal structure of a sampling campaign determines what inferences can legitimately be drawn from the data. Keith (1996) classifies major approaches as follows.

**Simple random sampling** selects sample locations with equal probability across the study domain. It is statistically clean but can miss localized contamination (hot spots) if the domain is large.

**Systematic sampling** places samples on a regular grid or at fixed time intervals. It provides uniform spatial coverage and is efficient for interpolation using geostatistical methods, but a systematic design can coincide with a periodic natural pattern and produce aliasing errors.

**Systematic random sampling** starts a grid at a randomly chosen origin, combining the coverage advantage of systematic placement with a degree of randomness.

**Stratified sampling** divides the domain into internally homogeneous strata (e.g., land-use zones, aquifer layers) and allocates samples within each stratum. Equal allocation assigns the same number of samples to each stratum; proportional allocation assigns sample counts proportional to stratum area or volume. Stratification reduces overall variance when within-stratum variability is smaller than between-stratum variability.

**Judgmental (purposive) sampling** directs effort to locations believed to be most informative based on prior knowledge, such as proximity to a known discharge point. It cannot support probability-based statistical inference but is cost-effective for confirmatory investigations.

**Transect sampling** arranges stations along linear features (stream reaches, fence lines downwind of a facility) and is common for characterizing gradients.

**Hot-spot sampling** is designed specifically to detect localized anomalies using probabilistic grids whose spacing is calibrated to the minimum detectable plume size at a specified confidence level.

The choice of strategy requires that the sampling design team specify, at the outset, the decision rule, the tolerable decision error rates (alpha and beta), and the width of the grey region around the action level—the framework formalized in EPA's Data Quality Objectives process.

---

# Chapter 2: Statistical Analysis of Environmental Data

## 2.1 Basic Descriptive Statistics

Environmental data often exhibit right-skewed distributions because concentrations cannot be negative and high-concentration events (storms, spills) inflate the upper tail. The log-normal distribution is frequently an adequate model: if \( \ln(C) \sim \mathcal{N}(\mu, \sigma^2) \), then the geometric mean \( \exp(\mu) \) and geometric standard deviation \( \exp(\sigma) \) are more informative location and spread parameters than the arithmetic mean and standard deviation.

Standard error of the mean:

\[
SE = \frac{s}{\sqrt{n}}
\]

A confidence interval for the population mean at confidence level \( 1-\alpha \) is:

\[
\bar{x} \pm t_{\alpha/2,\, n-1} \cdot \frac{s}{\sqrt{n}}
\]

The minimum number of samples required to detect a true difference \( \delta \) between two populations with standard deviation \( \sigma \), at significance level \( \alpha \) and power \( 1-\beta \), is approximately:

\[
n = \frac{2\sigma^2 (z_{\alpha/2} + z_\beta)^2}{\delta^2}
\]

## 2.2 Temporal Trend Analysis

Temporal trend analysis evaluates whether a monitored parameter is increasing, decreasing, or stationary over time. Parametric regression (ordinary least squares on log-transformed data) is sensitive to distributional assumptions. The non-parametric **Mann-Kendall test** is more robust for environmental data: it counts the number of concordant minus discordant pairs in the time-ordered series and compares the statistic to a normal approximation under the null hypothesis of no trend. The **Sen's slope estimator** provides a robust estimate of the trend magnitude (units per time period) as the median of all pairwise slopes.

Flow-weighted mean concentration (FWMC) is calculated to separate concentration trends from discharge-driven dilution effects:

\[
\text{FWMC} = \frac{\sum_i C_i Q_i \Delta t_i}{\sum_i Q_i \Delta t_i}
\]

where \( C_i \) is concentration, \( Q_i \) is discharge, and \( \Delta t_i \) is the time step.

## 2.3 Spatial Statistics and Autocorrelation

Spatial autocorrelation describes whether measurements at nearby locations are more similar than those farther apart—Tobler's First Law of Geography. The **Global Moran's I** statistic tests for spatial clustering:

\[
I = \frac{n}{\sum_{i}\sum_{j} w_{ij}} \cdot \frac{\sum_i \sum_j w_{ij}(x_i - \bar{x})(x_j - \bar{x})}{\sum_i (x_i - \bar{x})^2}
\]

where \( w_{ij} \) are spatial weights (e.g., inverse distance). Values near +1 indicate clustering; values near -1 indicate dispersion; values near 0 indicate spatial randomness.

The **experimental semivariogram** characterizes how spatial variance grows with separation distance \( h \):

\[
\hat{\gamma}(h) = \frac{1}{2|N(h)|} \sum_{(i,j)\in N(h)} [z(x_i) - z(x_j)]^2
\]

Fitting a theoretical model (spherical, exponential, Gaussian) to the empirical semivariogram yields range (distance at which spatial correlation vanishes), sill (total variance), and nugget (variance at zero separation, representing measurement error plus micro-scale variability). These parameters enable kriging interpolation and optimization of monitoring network density.

Temporal raster analysis of hydrologic data layers sequential spatial grids (e.g., satellite-derived chlorophyll maps or soil moisture products) to examine how spatial patterns evolve through time.

---

# Chapter 3: Site Background Investigations

## 3.1 Desktop Studies

Before deploying field equipment, a thorough desktop study assembles all existing information about a site. Air photo interpretation involves examining time-series aerial and satellite images to identify historical land uses (former industrial operations, spill sites, fill areas), drainage patterns, vegetation stress indicative of contamination, and geomorphic features relevant to subsurface flow. Photo pairs spanning decades can reveal legacy practices that predate regulatory records.

Data mining of existing studies includes reviewing provincial and federal monitoring databases (e.g., PWQMN in Ontario, NAPS for air quality), well records, environmental site assessments (Phase I and Phase II ESAs), geological surveys, and academic literature. The desktop study informs the conceptual site model (CSM), which is a qualitative representation of source, pathway, and receptor linkages that guides subsequent field work.

---

# Chapter 4: Atmospheric Quantity and Quality Sampling

## 4.1 Meteorological Monitoring

Meteorological variables control the transport and dispersion of air pollutants. Instrument types and their limitations are as follows.

**Cup and propeller anemometers** measure horizontal wind speed; they have a threshold wind speed below which rotation does not occur (stall speed, typically 0.2–0.5 m/s) and are inaccurate in highly turbulent or gusty conditions. Ultrasonic anemometers have no moving parts and measure all three wind vector components with fast response (10 Hz), useful for eddy-covariance flux measurements.

**Precipitation gauges** (tipping-bucket, weighing) systematically under-catch in windy conditions because aerodynamic deflection of precipitation around the gauge orifice reduces catch efficiency by 2–10% for rain and up to 50% for snow. Correction factors and windshields (Alter, Nipher) partially address this.

**Pyranometers** measure incoming shortwave solar radiation (W m\(^{-2}\)); albedometers (two-dome pyranometers, one inverted) measure both downwelling and upwelling shortwave to compute surface albedo. Net radiometers integrate all four radiation components (shortwave in/out, longwave in/out).

**Evaporation pans** (Class A pan) record open-water evaporation by daily water-level measurements and are corrected by a pan coefficient (typically 0.7) to estimate lake evaporation.

## 4.2 Near-Surface Air Quality Monitoring

### Sorbent Tubes

Volatile and semi-volatile organic compounds (VOCs and SVOCs) are collected by drawing a metered volume of air through a tube packed with sorbent material (Tenax TA, Carbotrap, Carbopack B, or multi-bed combinations). Compounds adsorb to the sorbent during sampling and are thermally desorbed directly onto a GC column for analysis. The breakthrough volume, the volume of air that can be sampled before the leading analyte passes through the tube, must not be exceeded; it varies with compound volatility, sorbent mass, and sampling temperature.

### Tedlar Bags

Stainless-steel-lined Tedlar (PVDF) bags are used for grab or integrated collection of bulk air samples including greenhouse gases (\( \text{CO}_2 \), \( \text{CH}_4 \), \( \text{N}_2\text{O} \)), light hydrocarbons, and permanent gases. Bags must be pre-cleaned and leak-tested. Reactive species such as \( \text{NO} \) and \( \text{O}_3 \) decay rapidly in bags, so sampling-to-analysis intervals must be minimized.

### Colorimetric Detector Tubes

Draeger and Gastec-type detector tubes offer rapid, semi-quantitative field measurements. A fixed volume of air is drawn through a glass tube containing a reagent that produces a colorimetric reaction proportional to the analyte concentration. Precision is typically ±15–25% and cross-sensitivity to interfering compounds can be significant; tubes are useful for screening and initial hazard assessment rather than regulatory compliance.

## 4.3 Gas Chromatography Techniques

### GC/MS (Gas Chromatography / Mass Spectrometry)

GC/MS is the reference method for identification and quantification of organic compounds in atmospheric samples. The gas chromatograph separates compounds by their partitioning between a carrier gas (helium or hydrogen) and a stationary phase coated inside a capillary column (e.g., DB-5, DB-624). Retention time identifies compound class; the mass spectrometer (quadrupole or ion trap) fragments molecules and records mass-to-charge ratios, providing a compound-specific fingerprint for confirmation. Detection limits for VOCs reach sub-ppb levels with thermal desorption pre-concentration.

Quantification relies on the external standard method (calibration curve of peak area vs. concentration) or internal standard method (addition of a labelled analogue at known concentration before analysis). The latter corrects for variability in injection volume and instrument response.

### GC/TCD (Gas Chromatography / Thermal Conductivity Detector)

The thermal conductivity detector measures the difference in thermal conductivity between the carrier gas and the column effluent. It is universal (responds to all compounds), non-destructive, and well-suited to permanent gases and high-concentration light hydrocarbons (\( \text{CH}_4 \), \( \text{CO}_2 \), \( \text{N}_2 \), \( \text{O}_2 \)). Sensitivity is lower than flame ionization (FID) or MS detectors; detection limits are typically in the ppm range by volume.

---

# Chapter 5: Infiltration Measurement

## 5.1 Saturated Hydraulic Conductivity and Infiltration Theory

Infiltration is the downward movement of water from the land surface into the soil matrix. The saturated hydraulic conductivity, \( K_s \), is a fundamental soil hydraulic property controlling the rate at which water moves through saturated soil under unit hydraulic gradient. Darcy's Law describes saturated flow:

\[
q = -K_s \frac{dh}{dz}
\]

where \( q \) is the specific discharge (m/s), and \( dh/dz \) is the hydraulic gradient. Field measurement of \( K_s \) at representative spatial scales is critical for groundwater recharge estimation, stormwater infiltration design, and contaminant transport modelling.

## 5.2 Double-Ring Infiltrometer

The double-ring infiltrometer isolates a column of soil from lateral flow by confining water within an inner ring (typically 30 cm diameter) while an outer ring (60 cm) buffers the inner zone from diverging flow lines. Water is maintained at a constant shallow head (2–5 cm) in both rings, and the rate of water addition to the inner ring is recorded over time. Steady-state infiltration rate (field-saturated hydraulic conductivity, \( K_{fs} \)) is approached as the wetting front advances and the hydraulic gradient approaches unity.

Early-time data are influenced by sorptivity (capillary suction driving initial rapid uptake), which can be modelled using the Philip two-term equation:

\[
f(t) = \frac{S}{2\sqrt{t}} + K_s
\]

where \( S \) is sorptivity (m s\(^{-1/2}\)) and \( K_s \) is the saturated hydraulic conductivity (m/s).

## 5.3 Guelph Permeameter

The Guelph Permeameter (GP) is a constant-head well permeameter that operates in a shallow, hand-augered borehole (typically 0.06 m radius). Water is maintained at a constant head \( H \) in the borehole using a Mariotte bottle reservoir, and the steady-state flow rate \( Q \) is measured. The GP can simultaneously estimate both \( K_{fs} \) and the matric flux potential \( \phi_m \) by conducting measurements at two different heads (\( H_1 \) and \( H_2 \)):

\[
K_{fs} = \frac{C \cdot Q}{2\pi H^2 + \pi a^2 C + (2\pi H / \alpha^*)}
\]

where \( C \) is a dimensionless shape factor, \( a \) is borehole radius, and \( \alpha^* \) is a soil texture-structure parameter. Measurements are sensitive to smearing of borehole walls during augering and to preferential flow along macropores (roots, worm channels), which can increase apparent \( K_{fs} \) by orders of magnitude.

---

# Chapter 6: Surface Water Quantity and Quality

## 6.1 Streamflow Measurement

### Velocity-Area Method

The velocity-area method divides a stream cross-section into vertical panels, measuring mean velocity in each panel at 0.6 of the depth (for shallow sections) or averaging velocities at 0.2 and 0.8 depth (for deeper sections). Velocity is measured with electromagnetic current meters or acoustic Doppler current profilers (ADCP). Discharge is computed as:

\[
Q = \sum_{i} \bar{v}_i \cdot w_i \cdot d_i
\]

where \( \bar{v}_i \) is mean velocity, \( w_i \) is panel width, and \( d_i \) is flow depth for panel \( i \).

### Slope-Area Method

Where direct measurement is impractical (e.g., flood events), discharge can be estimated from channel geometry and energy slope using Manning's equation:

\[
Q = \frac{1}{n} A R^{2/3} S^{1/2}
\]

where \( n \) is Manning's roughness coefficient, \( A \) is cross-sectional flow area, \( R \) is hydraulic radius (area/wetted perimeter), and \( S \) is the energy slope estimated from high-water marks between surveyed cross-sections.

### Float-Tracer Method

Surface floats provide a rough estimate of surface velocity (converted to mean velocity by a factor of approximately 0.85 for turbulent natural channels) over a measured reach length. Float timing is simple and requires no instrumentation but underestimates mean velocity in channels with significant velocity variation with depth.

## 6.2 Tracer Dilution Gauging

### Slug Injection

A known mass \( M \) of tracer (sodium chloride, rhodamine WT, lithium bromide) is rapidly introduced at an upstream point. The tracer concentration is monitored continuously downstream at a fully mixed section. Discharge is calculated from the dilution:

\[
Q = \frac{M}{\int_0^\infty C(t)\, dt}
\]

where \( \int_0^\infty C(t)\, dt \) is the area under the concentration-time curve (breakthrough curve). Complete lateral mixing is required; the distance to full mixing scales with channel width squared divided by diffusivity and must be verified before selecting the monitoring station.

### Continuous Injection

A tracer solution at concentration \( C_T \) is pumped at a constant known rate \( q \) until a plateau concentration \( C_P \) is achieved downstream:

\[
Q = q \cdot \frac{C_T - C_P}{C_P - C_b}
\]

where \( C_b \) is background concentration. Continuous injection is more precise than slug injection for large rivers because it avoids uncertainty in the temporal integral, but it requires larger tracer quantities and a calibrated pump.

## 6.3 Water Sample Collection

### Flowing Waters

Depth-integrated sampling collects water throughout the entire water column at each vertical, weighting the contribution proportional to depth and velocity. The US-DH-48 hand-held depth integrating sampler uses a transit-rate method: the sampler is lowered and raised at a rate slow enough that it fills completely but does not overflow, ensuring the sample represents the depth-integrated composite at each vertical.

Grab (point) samples capture conditions at a single point in space and time; they are suitable for rapidly variable parameters (dissolved oxygen, pH, temperature, specific conductance) measured in situ with multi-parameter sondes or Hach colorimetric kits, and for parameters where depth gradients are negligible.

### Lakes and Reservoirs

Kemmerer (van Dorn) bottles are messenger-operated water samplers that seal at a pre-selected depth, enabling discrete depth profiling of stratified water bodies. The Eckman dredge is a spring-loaded box corer used for surface sediment collection (0–10 cm layer), suitable for benthic invertebrate surveys and sediment chemistry. Sediment cores preserve the stratigraphic record and allow paleolimnological reconstruction when dated by \( {}^{210}\text{Pb} \) or \( {}^{137}\text{Cs} \) geochronology.

## 6.4 Field Water Quality Analysis

### In Situ Measurements

Multiparameter sondes (YSI Pro Series, In-Situ Aqua TROLL) measure temperature, pH, specific conductance (SC), dissolved oxygen (DO), turbidity, and chlorophyll-a fluorescence at a single deployment. Dissolved oxygen is measured by polarographic (Clark cell) or optical (luminescence quenching) sensors; optical sensors are less susceptible to biofouling and membrane degradation.

Hach field kits provide colorimetric analysis of nutrients (ammonia, nitrate, phosphate), metal ions, and chlorine using pre-packaged reagent pillows and a portable spectrophotometer (DR 900). Beer-Lambert absorbance:

\[
A = \varepsilon \cdot b \cdot C
\]

where \( A \) is absorbance, \( \varepsilon \) is the molar absorptivity (L mol\(^{-1}\) cm\(^{-1}\)), \( b \) is path length (cm), and \( C \) is concentration (mol/L).

### Laboratory Analytical Methods (Standard Methods)

**Chemical Oxygen Demand (COD)** is measured by oxidizing organic matter in acidic dichromate solution at elevated temperature; residual dichromate or generated Cr\(^{3+}\) is measured spectrophotometrically (Standard Methods 5220). COD values exceed biological oxygen demand (BOD\(_5\)) because chemical oxidation is more complete.

**Total Nitrogen (TN)** is determined by persulfate oxidation of all nitrogen forms (organic N, ammonia, nitrate, nitrite) to nitrate, followed by spectrophotometric measurement at 220 nm (corrected for organic interference at 275 nm) or by ion chromatography. Standard Methods method 4500-N.

**Total Phosphorus (TP)** requires digestion (persulfate or acid hydrolysis) to convert all phosphorus species (organic P, polyphosphates) to orthophosphate, which is then measured colorimetrically as the molybdenum blue complex at 880 nm (ascorbic acid method, Standard Methods 4500-P E).

### Long-Term Monitoring with Data Loggers

Continuous data loggers (sondes) deployed in streams or boreholes record parameters at intervals of 15 minutes to 1 hour for weeks to months. Data processing requires removal of fouling artifacts (drift correction, spike filtering), gap-filling, and quality flagging. Diurnal patterns in dissolved oxygen, temperature, and pH reflect photosynthesis, respiration, and carbonate equilibrium, providing information on ecosystem metabolism.

---

# Chapter 7: Groundwater Quantity and Quality

## 7.1 Aquifer Characterization and Well Hydraulics

Groundwater monitoring wells are installed in a screen interval that intersects the zone of interest (water table for unconfined aquifers; the confined zone for artesian systems). Well construction details (casing diameter, screen slot size, filter pack gradation, bentonite seal depth) must be documented because they influence purging volume calculations and sample representativeness.

The hydraulic gradient and groundwater flow direction are determined from potentiometric surface maps constructed from water level measurements in a network of at least three wells not collinear with the flow direction:

\[
i = \frac{\Delta h}{\Delta l}
\]

Groundwater velocity (seepage velocity) is:

\[
v_s = \frac{K_s \cdot i}{n_e}
\]

where \( n_e \) is effective porosity.

## 7.2 Well Purging and Groundwater Sampling

Before collecting a representative groundwater sample, stagnant water that has equilibrated with casing materials and is no longer representative of the formation must be removed. Two approaches are in common use.

**Fixed-volume purging** removes a set number of well volumes (typically 3–5) calculated from the volume of water stored in the casing and screen. This is conservative but may overpurge low-yield wells, causing drawdown and air entrainment.

**Low-flow (micro-purge) purging** uses a peristaltic pump or submersible pump set to a low rate (0.1–0.5 L/min) and monitors field parameters (pH, DO, SC, temperature, ORP) at the wellhead. Sampling is initiated when three consecutive readings of all parameters are stable within specified tolerance windows (e.g., SC ±3%, DO ±0.3 mg/L). Low-flow purging minimizes turbulence, reduces purge water volumes, and provides more representative samples for dissolved-phase contaminants, particularly metals.

**Bailer sampling** uses a single or double-valve bailer lowered on a line to collect water at the desired depth. Bailing is simple and requires no power source, but it generates turbulence and is not suitable for dissolved gas or volatile organic compound sampling.

**Waterra inertial pumps** use a foot-valve on the bottom of a polyethylene tube; repeated up-down movement of the tube draws water upward. They are low-cost and portable for shallow wells.

## 7.3 Laboratory Analytical Methods for Groundwater and Leachate

### Ion Chromatography (IC)

Ion chromatography separates anions (chloride, sulfate, nitrate, phosphate, bromide, fluoride) and cations (sodium, potassium, calcium, magnesium, ammonium) on ion-exchange columns using a suppressed conductivity detector. The suppressor module converts the eluent to a low-conductivity form (e.g., carbonate/bicarbonate eluent converted to carbonic acid), reducing background conductance and enhancing sensitivity. Method detection limits are typically in the range of 0.01–0.5 mg/L for common anions, in accordance with EPA Method 300.0 and Standard Methods 4110.

Charge balance error is a diagnostic check on IC data quality:

\[
\text{CBE} (\%) = \frac{\sum \text{cations (meq/L)} - \sum \text{anions (meq/L)}}{\sum \text{cations} + \sum \text{anions}} \times 100
\]

A CBE within ±5% is typically considered acceptable for natural water samples.

### Inductively Coupled Plasma (ICP-OES and ICP-MS)

ICP-OES (optical emission spectrometry) and ICP-MS (mass spectrometry) are the primary methods for multi-element analysis of dissolved metals in water and digested solid samples. An argon plasma at ~6,000–8,000 K atomizes and ionizes the sample. In ICP-OES, excited atoms emit characteristic wavelengths quantified against calibration standards (EPA Method 200.7). In ICP-MS, ions are extracted through differential-pressure interfaces into a quadrupole or sector-field mass analyzer, enabling detection at ng/L (sub-ppb) levels (EPA Method 200.8). Matrix interferences (e.g., chloride on arsenic at m/z 75 via \(^{40}\text{Ar}^{35}\text{Cl}^+\)) are addressed by collision/reaction cell technology or mathematical correction equations.

Sample preparation for total metals analysis requires acid digestion (EPA SW-846 Method 3050B for solid matrices, 3005A for water) to dissolve particulate-bound metals.

### Total Organic Carbon (TOC) Analyzer

TOC is measured by combustion at high temperature (680–900°C) in the presence of a platinum catalyst (high-temperature combustion, HTC) or by UV-persulfate oxidation (wet chemical oxidation). The CO\(_2\) evolved from carbon oxidation is quantified by non-dispersive infrared (NDIR) detection. Standard Methods Method 5310 C/D. TOC is distinguished into dissolved organic carbon (DOC, filtered through 0.45 µm) and total organic carbon (unfiltered), and can be further resolved into non-purgeable organic carbon (NPOC) and purgeable organic carbon (POC) by sparging the sample with inert gas to volatilize inorganic carbon before combustion.

---

# Chapter 8: Remote Sensing and Monitoring Strategy Design

## 8.1 Remote Sensing in Environmental Monitoring

Satellite and airborne remote sensing platforms extend the spatial coverage of in-situ monitoring to regional and global scales. Multispectral and hyperspectral imagers measure upwelling radiance at discrete wavelengths, from which surface reflectance is derived after atmospheric correction. Environmental applications include mapping of turbidity and chlorophyll-a in water bodies (MODIS, Sentinel-2), land surface temperature and evapotranspiration (Landsat thermal bands), soil moisture (passive microwave SMOS, SMAP), and land cover change (Landsat, Sentinel-1 SAR).

The normalized difference vegetation index:

\[
\text{NDVI} = \frac{\rho_\text{NIR} - \rho_\text{Red}}{\rho_\text{NIR} + \rho_\text{Red}}
\]

relates plant canopy density and health to the contrast between near-infrared (NIR) and red reflectance. Stressed or contaminated vegetation often shows reduced NDVI relative to healthy reference areas.

Temporal stacking of remote sensing imagery into raster time series allows detection of seasonal cycles, anomalies, and directional trends across large areas without the logistical burden of a dense ground network.

## 8.2 Monitoring Program Design

A complete environmental monitoring program integrates the elements introduced throughout this course into a coherent, defensible framework. Design steps include:

1. **Problem formulation**: Identify the environmental question, regulatory drivers, and relevant parameters (physical, chemical, biological).
2. **Conceptual site model**: Map source-pathway-receptor linkages based on desktop study.
3. **Data quality objectives**: Specify tolerable decision error rates, measurement uncertainty limits, and minimum detectable change or concentration.
4. **Sampling strategy selection**: Choose spatial design (random, stratified, systematic, transect), sampling frequency, and temporal coverage to satisfy DQOs given budget and personnel constraints.
5. **Sample collection protocols**: Specify container types, preservation methods (acidification, refrigeration, desiccation), maximum holding times, and chain-of-custody procedures for each parameter group, following Standard Methods or EPA SW-846 as appropriate.
6. **Analytical methods selection**: Match detection limits, precision, and accuracy requirements to certified laboratory methods.
7. **Data management and QA/QC**: Implement electronic data management, field and laboratory QC sample schedules, and data validation protocols.
8. **Reporting and interpretation**: Apply appropriate statistical and spatial analysis methods, contextualize results against regulatory criteria and background concentrations, and communicate uncertainty.

### Budgeting and Safety Considerations

Program scope must reconcile the number of samples, analytical costs, field personnel days, equipment rental, and travel expenses within a defined budget. Sensitivity analyses on sample number vs. statistical power guide prioritization. Field work safety planning addresses site-specific hazards: working near fast-moving water (personal flotation devices, throw bags, buddy system), entry into confined spaces, chemical exposure during sample collection (gloves, eye protection, air monitoring for VOC-contaminated sites), and remote-area emergency protocols.

---

# Chapter 9: Introduction to Analytical Measurement Techniques

## 9.1 Colorimetry and Spectrophotometry

Colorimetric methods couple a chemical reaction that produces a coloured product with spectrophotometric quantification via Beer-Lambert's law. The reaction must be specific to the target analyte, produce a stable colour of adequate intensity over the working concentration range, and not be significantly interfered with by common matrix constituents. Wavelength selection is based on the absorption maximum (\( \lambda_\text{max} \)) of the coloured product. Modern field photometers (Hach DR 900) and laboratory UV-Vis spectrophotometers operate from ~190 to 1100 nm. Turbid samples require filtration or subtraction of blank absorbance.

## 9.2 Chromatographic Methods Overview

Chromatography separates mixtures by differential migration through a stationary phase under the influence of a mobile phase. In gas chromatography (GC), the mobile phase is an inert carrier gas and separation is determined by analyte volatility and affinity for the stationary phase coating. In liquid chromatography (LC), a liquid mobile phase gradient elutes analytes in order of polarity. The ion chromatographic variant uses ionic eluents and ion-exchange stationary phases.

Resolution between two adjacent peaks depends on the selectivity factor \( \alpha \) and the column efficiency \( N \) (number of theoretical plates):

\[
R_s = \frac{\sqrt{N}}{4} \cdot \frac{\alpha - 1}{\alpha} \cdot \frac{k}{1+k}
\]

where \( k \) is the retention factor. Increasing column length, reducing particle size, or selecting a more selective stationary phase all improve resolution at the cost of longer analysis time or higher pressure.

## 9.3 Electrochemical Probes

In-situ electrochemical sensors measure analyte activity directly in the sample matrix without the need for collection and laboratory transport. pH electrodes rely on the Nernst equation:

\[
E = E^\circ - \frac{RT}{nF} \ln Q
\]

For pH at 25°C, each pH unit corresponds to approximately 59.16 mV potential difference across the glass membrane. Ion-selective electrodes (ISEs) for nitrate, ammonium, fluoride, and dissolved oxygen operate on similar principles. Dissolved oxygen optical sensors based on luminescence quenching exhibit a response described by the Stern-Volmer equation:

\[
\frac{I_0}{I} = 1 + K_{SV} [O_2]
\]

where \( I_0 \) and \( I \) are luminescence intensities in the absence and presence of oxygen, and \( K_{SV} \) is the Stern-Volmer quenching constant.

Oxidation-reduction potential (ORP or Eh) measured by a platinum electrode referenced to the standard hydrogen electrode indicates redox status; values above approximately +200 mV indicate aerobic conditions, while values below -100 mV indicate methanogenic or sulfate-reducing conditions. ORP, together with pH, locates the system on a Pourbaix diagram, useful for predicting speciation of redox-sensitive metals (iron, manganese, arsenic).

## 9.4 Separation Principle: Summary Table

| Method | Mobile Phase | Stationary Phase | Primary Environmental Applications |
|---|---|---|---|
| GC/FID | He or H\(_2\) carrier | Capillary column | VOCs, petroleum hydrocarbons, pesticides |
| GC/MS | He carrier | Capillary column | VOC identification, semi-SVOCs, GHGs |
| GC/TCD | He or Ar carrier | Packed or capillary | Permanent gases, high-conc. hydrocarbons |
| IC | Aqueous eluent | Ion exchange resin | Anions, cations in water |
| ICP-OES/MS | Aqueous nebulized | Plasma atomization | Dissolved metals, trace elements |
| UV-Vis spectrophotometry | – | Solution cell | Nutrients (N, P), COD, metals (coloured complex) |

---

*End of notes.*
