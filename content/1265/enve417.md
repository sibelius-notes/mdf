---
title: "ENVE 417: Climate Change, Water Security, and Adaptation"
subjects: "ENVE"
---

## Sources and References

**Primary texts:** IPCC Sixth Assessment Report, Working Group I–III (2021–2023); UN World Water Development Reports; <em>Water Security: Principles, Perspectives and Practices</em> edited by Lankford, Bakker, Zeitoun, and Conway (Routledge, 2013).

**Supplementary texts:** <em>Principles of Hydrology</em> by Ward and Robinson; <em>Climate Change and Water</em> IPCC Technical Paper VI; <em>Engineering Hydrology</em> by Subramanya; <em>Adaptation to Climate Change: From Resilience to Transformation</em> by Pelling.

**Online resources:** MIT OpenCourseWare 1.017 Computing and Data Analysis for Environmental Applications; Stanford Woods Institute for the Environment lectures; Copernicus Climate Change Service (C3S) data portal; UN Sustainable Development Goals knowledge platform; World Meteorological Organization State of the Global Climate reports.

---

# Chapter 1: The Climate System and the Global Water Cycle

## 1.1 Energy Balance of the Earth

The climate system is driven by the imbalance between incoming short-wave solar radiation and outgoing long-wave terrestrial radiation. At the top of the atmosphere the mean incoming solar flux is \( S_0/4 \approx 342 \) W m\(^{-2}\), where \( S_0 = 1366 \) W m\(^{-2}\) is the solar constant. A fraction \( \alpha \approx 0.30 \), the planetary albedo, is reflected. The remainder is absorbed and re-emitted as long-wave radiation. The zero-dimensional energy balance

\[ (1-\alpha)\frac{S_0}{4} = \varepsilon \sigma T_e^4 \]

yields an effective emission temperature \( T_e \approx 255 \) K, some 33 K below the observed surface temperature. The difference is the natural greenhouse effect, produced chiefly by water vapour, carbon dioxide, methane, nitrous oxide, and ozone.

## 1.2 Anthropogenic Forcing

Radiative forcing is the perturbation to the net radiative flux at the tropopause after stratospheric adjustment but before surface and tropospheric responses. For a doubling of CO\(_2\) the forcing is approximately \( \Delta F_{2\times} \approx 3.7 \) W m\(^{-2}\). The equilibrium climate sensitivity \( \lambda \) links forcing to eventual warming via \( \Delta T_{eq} = \lambda \Delta F \). Current best estimates place \( \lambda \) between 0.5 and 1.0 K per W m\(^{-2}\), implying a likely warming of 2.5–4 K for a CO\(_2\) doubling.

<div class="definition">
<strong>Hydroclimate.</strong> The subset of climate variables and processes that govern the storage, flux, and phase of water in the Earth system, including precipitation, evapotranspiration, soil moisture, snow, ice, runoff, and atmospheric moisture transport.
</div>

## 1.3 The Global Water Cycle Intensifies

A warmer atmosphere can hold more water vapour. The Clausius–Clapeyron relation

\[ \frac{de_s}{dT} = \frac{L_v e_s}{R_v T^2} \]

implies that saturation vapour pressure \( e_s \) rises roughly 7% per kelvin near surface temperatures. If relative humidity is conserved, absolute humidity and the intensity of extreme precipitation scale accordingly. Observations confirm a wet-get-wetter, dry-get-drier tendency over oceans and a more nuanced pattern over land, together with an amplification of short-duration rainfall extremes.

# Chapter 2: Water Security as an Engineering Objective

## 2.1 Defining Water Security

Water security denotes the capacity of a population to safeguard sustainable access to adequate quantities of acceptable-quality water for livelihoods, human well-being, and socio-economic development; to ensure protection against water-borne pollution and water-related disasters; and to preserve ecosystems in a climate of peace and political stability. Engineering practice operationalises this definition through quantifiable indicators such as supply reliability, exposure, vulnerability, and resilience metrics.

## 2.2 Four Pillars

A common decomposition identifies four pillars: household water, economic water, urban water, and environmental water. Each pillar has associated performance indicators. Household security considers per-capita availability and safely managed service coverage. Economic security links to water productivity \( P_w = Y/W \), where \( Y \) is economic output and \( W \) is withdrawal. Urban security captures infrastructure, wastewater treatment, and drainage. Environmental security tracks the deviation of flow regimes from natural reference states.

<div class="example">
<strong>Example: Water productivity.</strong> A wheat crop in a semi-arid basin yields 4 t ha\(^{-1}\) with 5000 m\(^3\) ha\(^{-1}\) of applied irrigation. The water productivity is 0.8 kg m\(^{-3}\). A switch to drip with deficit irrigation produces 3.6 t ha\(^{-1}\) from 3000 m\(^3\) ha\(^{-1}\), raising \( P_w \) to 1.2 kg m\(^{-3}\). Total water saved can be reallocated to environmental flows while sustaining 90% of prior yield.
</div>

## 2.3 Trade-offs and Values

Water management decisions involve competing legitimate values. Utilitarian efficiency, ecological integrity, cultural and indigenous rights, intergenerational equity, and economic development can point in different directions. Multi-criteria decision analysis formalises the trade-off. For alternatives \( a_k \) and criteria \( c_j \) with weights \( w_j \), the weighted aggregate score is

\[ S(a_k) = \sum_{j=1}^{n} w_j \, u_j\!\left(x_{jk}\right), \]

where \( u_j \) are normalised utility functions. Sensitivity of the ranking to weights reveals which value assumptions are decisive.

# Chapter 3: Hydroclimatic Hazards

## 3.1 Floods

Design flood estimation has historically relied on stationary flood frequency analysis, where annual maxima \( Q \) are fitted to a distribution such as the Generalised Extreme Value

\[ F(Q) = \exp\!\left\{-\left[1 + \xi\left(\frac{Q-\mu}{\sigma}\right)\right]^{-1/\xi}\right\}. \]

Under climate change the location \( \mu \) and scale \( \sigma \) parameters drift with time or with a covariate such as global mean temperature. Nonstationary analysis replaces \( \mu \) with \( \mu(t) = \mu_0 + \beta_1 T(t) \), producing design floods that increase through the service life of the infrastructure.

## 3.2 Droughts

Drought manifests as meteorological, agricultural, hydrological, and socio-economic deficits with lagged propagation. Standardised indices such as the SPI for precipitation and SPEI for precipitation-minus-evapotranspiration compare accumulated anomalies over a window \( k \) months to the climatological distribution. Under warming, rising potential evapotranspiration tends to intensify SPEI droughts even where precipitation is unchanged.

## 3.3 Storm Surge and Sea-Level Rise

Low-lying coastal cities face the compound hazard of mean sea-level rise, storm surge, and tidal amplification. The total water level at the coast is \( \eta = \eta_{MSL} + \eta_{tide} + \eta_{surge} + \eta_{wave} \). Infrastructure planners integrate sea-level rise projections from shared socio-economic pathways (SSP1-1.9 through SSP5-8.5) with Monte Carlo surge simulations to produce exceedance curves for design freeboard.

# Chapter 4: Grey, Green, and Hybrid Infrastructure

## 4.1 Grey Infrastructure

Grey infrastructure refers to engineered concrete-and-steel systems: dams, levees, reservoirs, treatment plants, pumping stations, and pipe networks. These provide reliable service under design conditions but are often expensive, carbon intensive, and brittle when exposed to conditions outside their design envelope.

## 4.2 Green Infrastructure

Green infrastructure employs natural or semi-natural features to deliver hydrological services. Examples include constructed wetlands for nitrogen removal, bioretention cells and rain gardens for urban stormwater, riparian buffers for pollutant interception, and managed aquifer recharge basins. Green systems scale with the intensity of events, often providing co-benefits such as habitat, cooling, and carbon sequestration.

<div class="theorem">
<strong>Mass balance for a bioretention cell.</strong> Treating the cell as a control volume with surface area \( A \), ponding depth \( h \), inflow \( Q_{in} \), overflow \( Q_{ov} \), infiltration rate \( f \), and evaporation \( E \),

\[ A\,\frac{dh}{dt} = Q_{in} - Q_{ov} - A f - A E. \]

Overflow engages only when \( h \) exceeds the berm height \( h_b \). The cell attenuates peaks and removes pollutants through sedimentation, sorption, microbial transformation, and plant uptake.
</div>

## 4.3 Hybrid Systems

Modern practice combines grey reliability with green adaptability. A hybrid stormwater system routes routine events through distributed green practices and reserves conventional drainage for rare design events. Hybrid coastal defences pair seawalls with restored marshes or mangroves that dissipate wave energy through vegetative drag \( \tau = \tfrac{1}{2} \rho C_D b N u^2 \), with stem diameter \( b \), density \( N \), and drag coefficient \( C_D \).

# Chapter 5: Adaptation Planning and the Sustainable Development Goals

## 5.1 A Framework for Adaptation

Adaptation proceeds through iterative risk management: scoping and risk identification, assessment of current and projected risk, appraisal of adaptation options, decision and implementation, and monitoring and review. Decision-making under deep uncertainty employs robust decision-making, dynamic adaptive policy pathways, and real options analysis to avoid lock-in and preserve flexibility.

## 5.2 Economics of Adaptation

The net present value of an adaptation investment is

\[ NPV = \sum_{t=0}^{T} \frac{B_t - C_t}{(1+r)^t}, \]

with benefits \( B_t \) capturing avoided damages, co-benefits, and residual risk. Under uncertainty the expected NPV is complemented by conditional value-at-risk or regret measures. Option values favour flexible staged investments over single large commitments.

## 5.3 Linking Water to the 17 SDGs

SDG 6 targets water and sanitation directly, but water sits at the crossroads of every goal. Universal service (SDG 6.1, 6.2) depends on affordability (SDG 1), productive use (SDG 2, 8), education (SDG 4), and gender equity (SDG 5). Environmental flows support SDG 14 and 15. Climate action (SDG 13) pervades the entire water agenda. Engineering design must quantify co-benefits explicitly rather than treating them as rhetorical garnish.

# Chapter 6: A Capstone on Water Security and Climate Resilience

## 6.1 Problem Framing

A capstone project integrates climate projections, hydrological modelling, infrastructure design, and stakeholder analysis. The problem is framed in terms of decision objectives, performance metrics, and constraints. Participatory scoping identifies affected communities, ecosystems, and institutions.

## 6.2 Analytical Workflow

A downscaled ensemble of climate projections feeds hydrological and hydraulic models. Outputs are passed through vulnerability assessments of exposed populations and assets. Adaptation portfolios combining grey, green, and nonstructural measures are generated. Performance is evaluated across climate futures, and the portfolio that maximises robustness subject to budget and equity constraints is recommended.

## 6.3 Communication and Delivery

The deliverable includes quantitative reports, visualisations, and stakeholder-facing summaries. Engineering judgement is conveyed alongside uncertainty, so that decision-makers can weigh robustness, equity, and cost. The final product is a design that advances water security while supporting the wider sustainability agenda in a changing climate.
