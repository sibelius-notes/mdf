---
title: "ENVE 277: Air Quality Engineering"
prof: "Prof. Rebecca Saari, P.Eng."
subjects: "ENVE"
---

## Sources and References

- Cooper, C. D. & Alley, F. C. *Air Pollution Control: A Design Approach*, 4th ed. Waveland Press.
- Seinfeld, J. H. & Pandis, S. N. *Atmospheric Chemistry and Physics: From Air Pollution to Climate Change*, 3rd ed. Wiley.
- Wark, K., Warner, C. F. & Davis, W. T. *Air Pollution: Its Origin and Control*, 3rd ed. Addison-Wesley.
- Jacob, D. J. *Introduction to Atmospheric Chemistry*. Princeton University Press, 2000. (freely available online)
- MIT 1.818J / 2.65J / 10.391J Environmental Engineering (lecture materials, open courseware).
- Stanford CEE 265: Air Quality Engineering (course notes and problem sets).

---

# Chapter 1: Atmospheric Composition

## 1.1 The Structure of the Atmosphere

The atmosphere is divided into concentric layers defined by the vertical temperature profile. The **troposphere** extends from the surface to roughly 10–15 km and contains approximately 80% of total atmospheric mass. Temperature decreases with altitude at the **environmental lapse rate** (ELR), averaging about 6.5 K km\(^{-1}\). The tropopause marks the boundary with the **stratosphere**, where temperature increases due to ozone absorption of ultraviolet radiation. Above the stratosphere lie the mesosphere and thermosphere, which are of secondary concern for surface-level air quality engineering.

## 1.2 Composition of Dry Air

Dry air is dominated by nitrogen (N\(_2\), 78.09% by volume), oxygen (O\(_2\), 20.95%), and argon (Ar, 0.93%). Carbon dioxide (CO\(_2\)) currently constitutes approximately 420 ppm by volume and is rising at roughly 2–3 ppm yr\(^{-1}\). Trace constituents — including ozone (O\(_3\)), methane (CH\(_4\)), nitrous oxide (N\(_2\)O), and a broad suite of volatile organic compounds (VOCs) — are present at parts-per-billion to parts-per-trillion levels yet exert disproportionate influence on radiative forcing, photochemistry, and human health.

## 1.3 Concentration Units

Air quality data are reported in several unit conventions that require careful conversion.

**Volume mixing ratio** (dimensionless, or reported as ppm\(_v\), ppb\(_v\), ppt\(_v\)) expresses the mole fraction of the pollutant. For an ideal gas, the mole fraction equals the partial-pressure fraction.

**Mass concentration** in \(\mu\text{g m}^{-3}\) or \(\text{mg m}^{-3}\) depends on temperature and pressure. The conversion between ppb\(_v\) and \(\mu\text{g m}^{-3}\) at standard conditions (T = 298 K, P = 101.325 kPa) is:

\[
C\,[\mu\text{g m}^{-3}] = \frac{C\,[\text{ppb}_v] \times M}{24.45}
\]

where \(M\) is the molecular weight in g mol\(^{-1}\) and 24.45 L mol\(^{-1}\) is the molar volume at 298 K.

**Number concentration** (\(\text{cm}^{-3}\)) is used for aerosol particles and cloud condensation nuclei.

---

# Chapter 2: Atmospheric Science and Meteorology

## 2.1 The Ideal Gas Law and Hydrostatic Equation

Air behaves as an ideal gas to good approximation:

\[
P = \rho R_d T
\]

where \(P\) is pressure (Pa), \(\rho\) is density (kg m\(^{-3}\)), \(R_d = 287\) J kg\(^{-1}\) K\(^{-1}\) is the specific gas constant for dry air, and \(T\) is absolute temperature (K). Pressure decreases with altitude according to the hydrostatic equation:

\[
\frac{dP}{dz} = -\rho g
\]

Combining with the ideal gas law yields the barometric formula, indicating exponential pressure decay with a scale height of approximately 8.5 km.

## 2.2 Adiabatic Lapse Rate and Atmospheric Stability

When a parcel of dry air rises adiabatically (without exchange of heat with surroundings), it cools at the **dry adiabatic lapse rate** (DALR):

\[
\Gamma_d = \frac{g}{c_p} \approx 9.8\;\text{K km}^{-1}
\]

where \(g = 9.81\) m s\(^{-2}\) and \(c_p = 1005\) J kg\(^{-1}\) K\(^{-1}\). If ambient air cools more steeply than \(\Gamma_d\) (superadiabatic), the atmosphere is **unstable** — rising parcels are buoyant and convection is enhanced. If the ambient lapse rate is less steep (**stable** conditions), vertical mixing is suppressed and pollutants accumulate near the source. A **temperature inversion** — where temperature increases with height — represents extreme stability and is a primary meteorological factor in air pollution episodes.

## 2.3 Wind and the Planetary Boundary Layer

The **planetary boundary layer** (PBL) is the lowest 100 m to 2 km of the troposphere, directly influenced by surface friction and diurnal heating. Within the PBL, wind speed typically increases logarithmically with height:

\[
u(z) = \frac{u_*}{\kappa} \ln\!\left(\frac{z}{z_0}\right)
\]

where \(u_*\) is the friction velocity, \(\kappa \approx 0.41\) is the von Kármán constant, and \(z_0\) is the aerodynamic roughness length. Horizontal wind direction is governed by geostrophic balance above the PBL and modified by surface friction and thermal effects near the ground. Wind roses summarise the frequency distribution of wind direction and speed at a monitoring site and are essential inputs to dispersion modelling.

## 2.4 Mixing Height and Ventilation

The **mixing height** (also called mixing depth, \(z_i\)) is the altitude up to which turbulent mixing distributes pollutants. It varies diurnally: the nocturnal boundary layer may be only 100–200 m deep, while daytime convective heating can drive \(z_i\) to 1–2 km. The **ventilation coefficient** \(VC = \bar{u} \cdot z_i\) (m\(^2\) s\(^{-1}\)) is a simple index of the atmosphere's capacity to dilute surface emissions; low \(VC\) values correspond to poor air quality conditions.

---

# Chapter 3: Atmospheric Issues

## 3.1 Criteria Air Pollutants and Health Effects

Regulatory frameworks in Canada (National Ambient Air Quality Standards, NAAQO) and the United States (NAAQS) identify **criteria pollutants** for which ambient concentration standards are set based on health evidence: particulate matter (PM\(_{2.5}\) and PM\(_{10}\)), ozone (O\(_3\)), nitrogen dioxide (NO\(_2\)), sulfur dioxide (SO\(_2\)), carbon monoxide (CO), and lead (Pb). Each pollutant is associated with specific health endpoints: fine PM penetrates deep into the alveolar region of the lung causing cardiovascular and respiratory disease; ground-level ozone causes airway inflammation and reduced lung function; CO impairs oxygen transport by binding haemoglobin.

## 3.2 Photochemical Smog

Ground-level ozone forms via a photochemical cycle driven by solar UV radiation, nitrogen oxides (NO\(_x\) = NO + NO\(_2\)), and VOCs. The key initiation step is photolysis of NO\(_2\):

\[
\text{NO}_2 + h\nu \;\longrightarrow\; \text{NO} + \text{O}(^3P)
\]
\[
\text{O}(^3P) + \text{O}_2 + M \;\longrightarrow\; \text{O}_3 + M
\]

In clean air, ozone reaches a **photostationary state** with NO rapidly destroying it. VOCs perturb this balance by converting NO to NO\(_2\) without consuming ozone, leading to net O\(_3\) accumulation. The relationship between NO\(_x\), VOCs, and ozone production is captured in **isopleths diagrams**, which show that different NO\(_x\)/VOC regimes require different control strategies.

## 3.3 Acid Deposition

Sulfur dioxide and nitrogen oxides emitted from combustion sources undergo oxidation in the atmosphere to form sulfuric acid (H\(_2\)SO\(_4\)) and nitric acid (HNO\(_3\)), which are removed by wet and dry deposition. Wet deposition (acid rain) lowers the pH of precipitation below the natural carbonic-acid baseline of approximately 5.6. Acid deposition acidifies lakes and soils, leaches base cations, and damages forest ecosystems.

## 3.4 Global Climate Change and the Greenhouse Effect

The earth's radiation balance is governed by the difference between incoming shortwave solar radiation and outgoing longwave (infrared) radiation. **Greenhouse gases** — CO\(_2\), CH\(_4\), N\(_2\)O, O\(_3\), and fluorinated gases — absorb and re-emit outgoing IR, warming the lower atmosphere. Radiative forcing (\(\Delta F\), W m\(^{-2}\)) quantifies the perturbation to the energy balance. Since pre-industrial times, human activities have increased atmospheric CO\(_2\) from about 280 ppm to over 420 ppm, contributing a positive forcing of approximately +2.1 W m\(^{-2}\).

## 3.5 Stratospheric Ozone Depletion

Stratospheric ozone is maintained by a balance of photochemical production and catalytic destruction cycles involving NO\(_x\), OH, and halogen radicals. Anthropogenic chlorofluorocarbons (CFCs) and halons release reactive chlorine and bromine upon UV photolysis, catalytically destroying ozone:

\[
\text{Cl} + \text{O}_3 \;\longrightarrow\; \text{ClO} + \text{O}_2
\]
\[
\text{ClO} + \text{O} \;\longrightarrow\; \text{Cl} + \text{O}_2
\]

The Montreal Protocol (1987) and its amendments have successfully phased out the major ozone-depleting substances, and stratospheric ozone is slowly recovering.

---

# Chapter 4: Emission Sources

## 4.1 Classification of Sources

Emission sources are classified by physical form and spatial scale. **Point sources** are identifiable stationary facilities (e.g., stacks, vents) with well-characterised flow rates. **Area sources** represent diffuse emissions over a geographic region (e.g., residential heating, fugitive dust, agricultural ammonia). **Mobile sources** include on-road vehicles, non-road equipment, aircraft, and marine vessels. **Line sources** approximate roads or railways as continuous linear emitters.

## 4.2 Combustion Emissions

Fossil fuel combustion is the dominant anthropogenic source of SO\(_2\), NO\(_x\), CO, CO\(_2\), and primary PM. Combustion chemistry produces NO thermally (Zeldovich mechanism) at high temperatures:

\[
\text{N}_2 + \text{O} \;\rightleftharpoons\; \text{NO} + \text{N}
\]
\[
\text{N} + \text{O}_2 \;\rightleftharpoons\; \text{NO} + \text{O}
\]

The thermal NO formation rate is strongly temperature-dependent. Fuel-bound nitrogen produces **fuel NO**, while prompt NO arises from hydrocarbon-nitrogen reactions in the flame front.

## 4.3 Emission Factors and the AP-42 Approach

An **emission factor** relates the mass of pollutant emitted to a unit of activity:

\[
E = A \times EF \times (1 - \eta/100)
\]

where \(E\) is the emission rate (e.g., kg yr\(^{-1}\)), \(A\) is the activity level, \(EF\) is the emission factor (mass per unit activity), and \(\eta\) is the control efficiency (%). The US EPA AP-42 compilation tabulates emission factors for hundreds of source categories. Emission factors carry uncertainty ratings (A through E) reflecting data quality.

---

# Chapter 5: Emission Reporting and Inventories

## 5.1 National and Regional Inventories

Emission inventories aggregate activity data and emission factors across all source categories to estimate total pollutant mass released over a defined period and geographic domain. In Canada, the **National Pollutant Release Inventory** (NPRI) requires facilities above threshold activity levels to report annual emissions of specified substances. The **Canadian Air Pollutant Emission Inventory** (APEI) covers criteria air contaminants and greenhouse gases by province and sector. In the United States, the **National Emissions Inventory** (NEI) is compiled every three years by the EPA.

## 5.2 Uncertainty in Emission Estimates

Emission inventories carry inherent uncertainty from variability in activity data, representativeness of emission factors, incomplete source coverage, and measurement limitations. Bottom-up inventories built from activity-based factors often diverge from top-down atmospheric inversion estimates that use observed concentrations to back-calculate emissions. Reconciling these discrepancies is an active research area.

---

# Chapter 6: Emission Estimation Methods

## 6.1 Mass Balance and Stoichiometric Approaches

For fuel combustion, SO\(_2\) emissions can be estimated directly from the sulfur content of the fuel and mass balance principles. If fuel of mass flow rate \(\dot{m}_f\) (kg s\(^{-1}\)) contains sulfur fraction \(f_S\) (kg S kg\(^{-1}\) fuel), the SO\(_2\) emission rate is:

\[
\dot{E}_{\text{SO}_2} = 2\, f_S\, \dot{m}_f
\]

reflecting the stoichiometry S + O\(_2\) → SO\(_2\) (molar mass ratio 64/32 = 2).

## 6.2 Continuous Emission Monitoring

Stack-mounted **continuous emission monitoring systems** (CEMS) measure pollutant concentrations and volumetric flow in real time. The mass emission rate is:

\[
\dot{E} = C \times Q
\]

where \(C\) is the measured concentration (kg m\(^{-3}\)) and \(Q\) is the volumetric flow rate (m\(^3\) s\(^{-1}\)). CEMS data support regulatory compliance and hourly emission inventories.

## 6.3 Fugitive and Area Source Estimation

Fugitive emissions from equipment leaks, open storage piles, unpaved roads, and agricultural activities are estimated through screening methodologies. For wind erosion from storage piles or unpaved roads, empirical models relate emission rates to wind speed, particle size distribution, and surface moisture.

---

# Chapter 7: Vertical Motion and Atmospheric Turbulence

## 7.1 Turbulence and Diffusion

Atmospheric turbulence is the irregular, three-dimensional wind fluctuations superimposed on the mean flow. Turbulence drives the mechanical spreading of pollutant plumes. The turbulent diffusion of a scalar is described by the **K-theory** (gradient-transport) approximation:

\[
\frac{\partial C}{\partial t} = \frac{\partial}{\partial z}\left(K_z \frac{\partial C}{\partial z}\right)
\]

where \(K_z\) is the eddy diffusivity (m\(^2\) s\(^{-1}\)) in the vertical direction. The value of \(K_z\) depends on atmospheric stability and height.

## 7.2 Pasquill-Gifford Stability Classes

Atmospheric stability is often characterised using the **Pasquill-Gifford (PG) stability classes** A through F (A = very unstable, F = moderately stable), determined from surface wind speed and insolation (daytime) or cloud cover (night-time). These classes are the basis for the widely used Gaussian dispersion coefficients \(\sigma_y\) and \(\sigma_z\).

## 7.3 Plume Rise

Buoyant or momentum-driven plumes rise above the physical stack height. The **effective stack height** \(H\) is the sum of the physical stack height \(h_s\) and the plume rise \(\Delta h\):

\[
H = h_s + \Delta h
\]

The most widely used plume rise formulas are those of Briggs. For a buoyancy-dominated plume in a neutral atmosphere:

\[
\Delta h = 1.6\, F^{1/3}\, x^{2/3}\, u^{-1}
\]

in the near field, where \(F\) is the buoyancy flux (m\(^4\) s\(^{-3}\)):

\[
F = g\, Q_H\, / (\pi \rho_a c_p T_s)
\]

with \(Q_H\) the sensible heat emission rate (W), \(\rho_a\) ambient air density, and \(T_s\) stack gas temperature.

---

# Chapter 8: Horizontal Motion and Gaussian Dispersion Modelling

## 8.1 The Gaussian Plume Model

Under steady-state, uniform wind conditions, the time-averaged concentration downwind of a continuous point source is described by the **Gaussian plume equation**:

\[
C(x, y, z) = \frac{Q}{2\pi\, u\, \sigma_y\, \sigma_z}
\exp\!\left(-\frac{y^2}{2\sigma_y^2}\right)
\left[\exp\!\left(-\frac{(z-H)^2}{2\sigma_z^2}\right)
+ \exp\!\left(-\frac{(z+H)^2}{2\sigma_z^2}\right)\right]
\]

where \(Q\) (g s\(^{-1}\)) is the source emission rate, \(u\) (m s\(^{-1}\)) is the mean wind speed at stack height, \(\sigma_y\) and \(\sigma_z\) (m) are the horizontal and vertical spread parameters, \(H\) is the effective stack height, \(x\) is the downwind distance, and \(y\) is the crosswind distance. The second exponential in the bracket accounts for ground reflection (the image-source method).

The ground-level centreline concentration at \(y = 0, z = 0\) simplifies to:

\[
C(x, 0, 0) = \frac{Q}{\pi\, u\, \sigma_y\, \sigma_z} \exp\!\left(-\frac{H^2}{2\sigma_z^2}\right)
\]

## 8.2 Spread Parameters

The dispersion coefficients \(\sigma_y\) and \(\sigma_z\) increase with downwind distance \(x\) and depend on stability class. Pasquill-Gifford curves or the empirical power-law forms (\(\sigma = ax^b\)) tabulated by Green et al. or Seinfeld & Pandis are commonly used. Under unstable (Class A) conditions both \(\sigma_y\) and \(\sigma_z\) grow rapidly, leading to lower peak concentrations closer to the source. Under stable (Class F) conditions the plume remains narrow and elevated, producing maximum ground-level impact at greater distances.

## 8.3 Special Cases

**Maximum ground-level concentration** and the distance at which it occurs can be found by differentiating the centreline expression with respect to \(x\) and setting to zero. At the maximum, \(\sigma_z = H/\sqrt{2}\).

**Fumigation** occurs when a stable nocturnal inversion breaks up in the morning and plume material trapped aloft is brought to the surface in a brief, high-concentration episode.

**Terrain effects**, **building downwash**, and **calm wind conditions** require modifications to the basic Gaussian model or alternative regulatory models such as AERMOD and CALPUFF.

---

# Chapter 9: Dispersion — Practical Modelling and Regulatory Application

## 9.1 Regulatory Dispersion Models

The US EPA designates **AERMOD** as the preferred near-field steady-state model for regulatory applications. AERMOD incorporates modern boundary-layer meteorological theory, uses surface and upper-air data to characterise the PBL, and accounts for plume rise, terrain, and building wake effects. **CALPUFF** is a Lagrangian puff model appropriate for longer distances (> 50 km) and complex terrain.

In Canada, provincial regulations (e.g., Ontario Regulation 419/05) prescribe approved models and procedures for point source impact assessments.

## 9.2 Model Inputs and Outputs

Required inputs include: emission rate and stack parameters (diameter, exit velocity, temperature); meteorological data (wind speed and direction, stability class, mixing height); and receptor locations. Model outputs are time-averaged concentration fields (e.g., hourly, 24-hour, annual averages) that are compared against ambient standards.

## 9.3 Box Model for Well-Mixed Airsheds

For urban or regional assessments, the **box model** treats the airshed as a well-mixed volume:

\[
V \frac{dC}{dt} = S - C \cdot u \cdot A_{vent} - \Lambda \cdot V \cdot C
\]

where \(V\) is the box volume (m\(^3\)), \(S\) is the source strength (g s\(^{-1}\)), \(u \cdot A_{vent}\) represents advective ventilation, and \(\Lambda\) is a first-order removal rate (s\(^{-1}\)) accounting for chemical transformation and deposition. At steady state \(dC/dt = 0\).

---

# Chapter 10: Gaseous Pollution Control

## 10.1 Absorption (Scrubbing)

Gas absorption transfers a soluble pollutant from the gas phase into a liquid solvent. **Henry's Law** governs the equilibrium between gas and liquid phases:

\[
p_A = H_c \cdot C_{A,liq}
\]

where \(p_A\) is the partial pressure of component A (Pa), \(C_{A,liq}\) is its liquid-phase concentration (mol m\(^{-3}\)), and \(H_c\) is Henry's constant (Pa m\(^3\) mol\(^{-1}\)). The overall driving force for mass transfer is the departure from this equilibrium.

In packed-column scrubbers, the **number of transfer units** (NTU) determines column height:

\[
\text{NTU} = \int_{y_{out}}^{y_{in}} \frac{dy}{y - y^*}
\]

where \(y\) and \(y^*\) are the actual and equilibrium mole fractions in the gas phase. The height of a transfer unit (HTU) is a packing-specific parameter. Wet scrubbers are commonly applied to SO\(_2\) and HCl removal.

## 10.2 Adsorption

Adsorption involves the accumulation of gaseous pollutants onto a solid surface. **Activated carbon** is the most widely used adsorbent for VOC and odour control due to its high surface area (500–1500 m\(^2\) g\(^{-1}\)). Adsorption equilibrium is described by isotherms; the **Freundlich isotherm** is common for heterogeneous adsorbents:

\[
q = K_F \cdot C^{1/n}
\]

where \(q\) is the adsorbed mass per unit adsorbent mass, \(C\) is the equilibrium gas-phase concentration, and \(K_F\) and \(n\) are empirical constants. Fixed-bed adsorbers operate until **breakthrough** is detected in the exit stream.

## 10.3 Combustion and Thermal Oxidation

Hydrocarbons and VOCs can be destroyed by thermal oxidation at temperatures of 700–1000°C or by catalytic oxidation at lower temperatures (300–500°C). The **three Ts** of combustion — Temperature, Turbulence (mixing), and Time (residence time) — must be simultaneously satisfied. For complete oxidation of a generic hydrocarbon \(C_x H_y\):

\[
C_x H_y + \left(x + \frac{y}{4}\right)\text{O}_2 \;\longrightarrow\; x\,\text{CO}_2 + \frac{y}{2}\,\text{H}_2\text{O}
\]

## 10.4 Catalytic Converters and SCR

In automotive applications, **three-way catalytic converters** simultaneously oxidise CO and unburned hydrocarbons and reduce NO to N\(_2\) over precious-metal catalysts. For stationary NO\(_x\) control, **selective catalytic reduction** (SCR) uses ammonia or urea over a vanadium-titanium catalyst at 300–400°C:

\[
4\,\text{NO} + 4\,\text{NH}_3 + \text{O}_2 \;\longrightarrow\; 4\,\text{N}_2 + 6\,\text{H}_2\text{O}
\]

Removal efficiencies of 80–95% are routinely achieved.

---

# Chapter 11: Particle Pollution Control

## 11.1 Particle Properties and Aerodynamic Diameter

Particles are characterised by their **aerodynamic equivalent diameter** \(d_p\) — the diameter of a unit-density sphere with the same gravitational settling velocity. PM\(_{2.5}\) (fine fraction, \(d_p \leq 2.5\;\mu\text{m}\)) has the greatest health concern because of deep lung penetration, while PM\(_{10}\) (coarse fraction, \(d_p \leq 10\;\mu\text{m}\)) is relevant for upper respiratory and nuisance impacts.

The **terminal settling velocity** of a particle in the Stokes regime (\(\text{Re}_p \ll 1\)):

\[
v_t = \frac{d_p^2 (\rho_p - \rho) g}{18 \mu} C_c
\]

where \(\rho_p\) is particle density, \(\rho\) is air density, \(\mu\) is dynamic viscosity, and \(C_c\) is the Cunningham slip correction (important for sub-micron particles).

## 11.2 Gravitational Settling Chambers

A settling chamber uses residence time to allow particles to settle by gravity. The **minimum particle diameter** that is 100% collected in a chamber of length \(L\), height \(H\), width \(W\), and volumetric flow \(Q\) is that for which \(v_t \geq QH/(LW)\). Settling chambers are practical only for particles above about 50 µm and are used primarily as pre-cleaners.

## 11.3 Cyclones

Cyclones use centrifugal force to separate particles. Incoming gas enters tangentially, creating a spiral flow that forces particles to the outer wall, where they slide into a hopper. The **cut diameter** \(d_{50}\) — the size collected with 50% efficiency — typically falls between 5 and 20 µm for conventional cyclones. High-efficiency (smaller-diameter) cyclones extend this range but at higher pressure drop. The collection efficiency for a cyclone is expressed as a Lapple model or empirically:

\[
\eta(d_p) = \frac{1}{1 + (d_{50}/d_p)^2}
\]

## 11.4 Electrostatic Precipitators

**Electrostatic precipitators** (ESPs) charge particles in a corona discharge and collect them on oppositely charged plates. The **Deutsch-Anderson equation** gives theoretical collection efficiency:

\[
\eta = 1 - \exp\!\left(-\frac{w \cdot A}{Q}\right)
\]

where \(w\) is the migration velocity of the particle (m s\(^{-1}\)) toward the collection electrode, \(A\) is the collecting plate area (m\(^2\)), and \(Q\) is the gas volumetric flow (m\(^3\) s\(^{-1}\)). ESPs achieve efficiencies > 99% and handle large gas volumes but are less effective for highly resistive dusts.

## 11.5 Fabric Filters (Baghouses)

Fabric filters collect particles on fibrous filter media as a growing **filter cake**. Filtration mechanisms include inertial impaction, interception, diffusion, and electrostatic attraction. Overall filter efficiency for fine particles is typically > 99.9%. Pressure drop increases as the cake builds; periodic cleaning (shaker, pulse-jet, or reverse-air) regenerates the filter. The **air-to-cloth ratio** (m\(^3\) gas per m\(^2\) fabric per minute) is the primary design parameter.

## 11.6 Wet Scrubbers for Particles

Venturi scrubbers contact dirty gas with a high-velocity water jet, using inertial impaction to collect particles. Collection efficiency depends on the particle inertial parameter, the **Stokes number** \(\text{Stk} = \rho_p d_p^2 v_0 / (9\mu d_{throat})\). Venturi scrubbers simultaneously absorb soluble gases, making them suitable for combined gas–particle control.

---

# Chapter 12: Indoor Air Quality

## 12.1 Indoor Pollutants and Sources

Indoor concentrations of several pollutants routinely exceed outdoor levels. Key indoor sources include:

- **Combustion appliances** (gas stoves, fireplaces, unvented heaters): produce CO, NO\(_2\), and PM.
- **Building materials and furnishings**: emit formaldehyde (HCHO) from urea-formaldehyde resins; VOCs from paints, adhesives, and carpets.
- **Radon** (Rn-222): a naturally occurring radioactive gas produced by decay of uranium in soils and rock, entering buildings through foundation cracks. It is the leading cause of lung cancer in non-smokers.
- **Biological sources**: moulds, bacteria, dust mites, and pet dander produce allergens and biological toxins under conditions of elevated humidity.
- **Environmental tobacco smoke** (ETS) / second-hand smoke: complex mixture of gases and fine particles.

## 12.2 Mass Balance Model for Indoor Concentration

The indoor concentration of a non-reactive pollutant can be estimated with a single-zone mass balance:

\[
V \frac{dC_{in}}{dt} = S + Q_{vent}\, C_{out} - Q_{vent}\, C_{in} - k\, V\, C_{in}
\]

where \(V\) is the room volume (m\(^3\)), \(S\) is the indoor source strength (g s\(^{-1}\)), \(Q_{vent}\) is the ventilation flow rate (m\(^3\) s\(^{-1}\)), \(C_{out}\) is the outdoor concentration, and \(k\) is a first-order decay/removal rate constant (s\(^{-1}\)). At steady state:

\[
C_{in} = \frac{S + Q_{vent}\, C_{out}}{Q_{vent} + k\, V}
\]

The **air change rate** \(\text{ACH} = Q_{vent}/V\) (h\(^{-1}\)) is a standard metric for building ventilation. Residential buildings typically exhibit 0.35–1 ACH naturally; mechanically ventilated commercial buildings are designed for 5–10 ACH.

## 12.3 HVAC Systems and Their Role in Air Quality

**Heating, ventilation, and air conditioning** (HVAC) systems control temperature, humidity, and air quality in buildings. Key components relevant to air quality include:

- **Filters**: HEPA (high-efficiency particulate air) filters achieve > 99.97% efficiency for particles ≥ 0.3 µm. MERV ratings (1–16) classify filter performance across a range of particle sizes.
- **Air handlers and ductwork**: distribute conditioned air; improperly maintained ducts can be sources of biological contaminants.
- **Energy-recovery ventilators (ERV)**: transfer heat and moisture between exhaust and supply air streams, enabling adequate ventilation without excessive energy penalty.
- **UV germicidal irradiation**: inactivates airborne pathogens in supply air or within HVAC coils.

## 12.4 Indoor Exposure Estimation

Human exposure integrates concentration and time:

\[
E = \sum_i C_i \cdot t_i
\]

where \(C_i\) is the concentration in microenvironment \(i\) and \(t_i\) is the time spent there. Because people spend roughly 87% of their time indoors, indoor air quality is often the dominant contributor to total personal pollutant exposure, even when outdoor concentrations are the regulatory focus. Activity-based exposure models (e.g., SHEDS, pNEM) combine time-activity survey data with measured microenvironment concentrations to estimate population exposure distributions.

---

# Chapter 13: Air Quality Standards and Regulatory Framework

## 13.1 Canadian Standards and the CAAQS

Canada's **Canadian Ambient Air Quality Standards** (CAAQS) were introduced in 2013 under the Canadian Environmental Protection Act (CEPA) and specify 24-hour and annual averaging period standards for PM\(_{2.5}\) and ozone. Achievement of CAAQS is tracked by province and territory using 3-year averages based on the 98th percentile of 24-hour means (for PM\(_{2.5}\)) or the 3-year average of the annual 4th-highest daily maximum 8-hour mean (for ozone).

## 13.2 Control Technology Standards

Emission standards for industrial sources are expressed as technology-based limits. **Best Available Control Technology** (BACT) applies to new major sources in attainment areas. **Lowest Achievable Emission Rate** (LAER) is the most stringent standard, applied in non-attainment areas. In Canada, provincial regulations set concentration-based emission limits for individual source categories.

## 13.3 Air Quality Monitoring

Ambient monitoring networks measure pollutant concentrations using reference methods: Federal Reference Methods (FRM) for criteria pollutants include chemiluminescence for NO\(_x\), UV photometry for ozone, gravimetric filter methods for PM, and flame ionisation or pulsed fluorescence for VOCs and SO\(_2\). Continuous monitors provide hourly data for regulatory compliance, episode forecasting, and model evaluation.
