---
title: "ENVE 418: Ecohydrological Modelling of Nature-Based Solutions to Address Climate and Water Challenges"
subjects: "ENVE"
---

## Sources and References

**Primary texts:** <em>Ecohydrology: Darwinian Expression of Vegetation Form and Function</em> by Eagleson (Cambridge, 2002); <em>Ecohydrology and Hydrobiology</em> selected review articles; <em>Plants in Water-Controlled Ecosystems</em> by Rodriguez-Iturbe and Porporato (Cambridge, 2005).

**Supplementary texts:** <em>Nature-Based Solutions to Address Global Societal Challenges</em> edited by Cohen-Shacham et al. (IUCN, 2016); <em>Biogeochemistry: An Analysis of Global Change</em> by Schlesinger and Bernhardt; <em>Watershed Hydrology</em> by Gupta.

**Online resources:** MIT OpenCourseWare 1.73 Hydrology; Stanford CEE 263G Biogeochemistry; SWAT, VIC, ParFlow, and RHESSys model documentation; IUCN Global Standard for Nature-Based Solutions; Copernicus Land Monitoring Service.

---

# Chapter 1: Foundations of Ecohydrology

## 1.1 Scope and Motivation

Ecohydrology studies the coupling between water and biota from the leaf to the catchment. Engineering design of nature-based solutions relies on this coupling because plant communities, soil microbiota, and hydrological flows co-evolve. In human-dominated landscapes, the coupling has often been severed; ecohydrological modelling quantifies the cost of severance and guides restoration.

## 1.2 Soil Water Balance

At a point, the soil water balance over rooting depth \( Z_r \) is

\[ n Z_r \frac{ds}{dt} = R(t) - I(s) - E(s) - T(s) - L(s), \]

with porosity \( n \), relative saturation \( s \), rainfall \( R \), interception \( I \), evaporation \( E \), transpiration \( T \), and deep leakage \( L \). Rainfall is often modelled as a marked Poisson process with rate \( \lambda \) and exponentially distributed depths of mean \( \alpha \).

<div class="definition">
<strong>Nature-based solution.</strong> An action to protect, sustainably manage, and restore natural or modified ecosystems that addresses societal challenges effectively and adaptively, simultaneously providing human well-being and biodiversity benefits.
</div>

## 1.3 Stochastic Soil Moisture

Following Rodriguez-Iturbe and Porporato, the probability density of \( s \) satisfies a Chapman–Kolmogorov equation whose steady-state solution exhibits regimes of water-limited, energy-limited, and transition behaviour. The mean transpiration over a growing season depends on the ratio \( \lambda \alpha / (E_{max} n Z_r) \), offering a closed-form link between climate, soil, and vegetation.

# Chapter 2: Watershed Hydrology

## 2.1 Governing Flow Equations

Saturated groundwater flow satisfies Darcy's law \( \mathbf{q} = -K \nabla h \) combined with continuity, yielding the Richards equation for unsaturated conditions:

\[ \frac{\partial \theta}{\partial t} = \nabla\!\cdot\!\left[K(\theta)\nabla\psi\right] - \frac{\partial K(\theta)}{\partial z}. \]

Coupled with surface routing through kinematic or diffusive wave formulations, a distributed model resolves runoff generation, soil moisture dynamics, and baseflow.

## 2.2 Conceptual vs. Distributed Models

Conceptual models such as HBV or GR4J lump a catchment into storage reservoirs with empirical relations. Distributed models such as MIKE SHE, ParFlow-CLM, or RHESSys resolve spatial heterogeneity on a grid. Semi-distributed SWAT balances complexity and tractability through hydrologic response units.

## 2.3 Calibration and Uncertainty

Parameters \( \boldsymbol{\theta} \) are estimated by minimising an objective function such as Nash–Sutcliffe efficiency

\[ \mathrm{NSE} = 1 - \frac{\sum (Q_{obs,t} - Q_{sim,t})^2}{\sum (Q_{obs,t} - \overline{Q}_{obs})^2}. \]

Bayesian inference and GLUE provide posterior distributions over \( \boldsymbol{\theta} \), recognising equifinality. Modellers must match model complexity to data content to avoid overfitting.

# Chapter 3: Vegetation–Water Coupling

## 3.1 Canopy Energy and Water

Transpiration is governed by energy supply, atmospheric demand, and plant hydraulics. The Penman–Monteith equation

\[ \lambda E = \frac{\Delta(R_n - G) + \rho c_p D / r_a}{\Delta + \gamma\!\left(1 + r_s/r_a\right)} \]

expresses evapotranspiration as a combination of radiative and aerodynamic terms, with canopy stomatal resistance \( r_s \) and aerodynamic resistance \( r_a \).

## 3.2 Stomatal Regulation

Stomatal conductance responds to light, vapour pressure deficit, leaf water potential, and soil moisture. The Ball–Berry model

\[ g_s = g_0 + m \frac{A h_s}{C_s} \]

links conductance to photosynthesis. Hydraulic safety–efficiency trade-offs set by xylem vulnerability curves shape species distribution along moisture gradients.

## 3.3 Root Uptake

Root water uptake is often prescribed through a root density distribution \( \beta(z) \) and a stress function \( \alpha(\psi) \), yielding a sink term \( S(z) = \alpha(\psi)\,\beta(z)\,T_p \) in the Richards equation. Adaptive rooting depth is a strategy that buffers vegetation against drought stress.

<div class="example">
<strong>Example: Wetland evapotranspiration.</strong> A restored marsh with cattail dominance has leaf area index 4 and a seasonal \( r_s \) of 60 s m\(^{-1}\). On a day with \( R_n = 180 \) W m\(^{-2}\), \( D = 1.2 \) kPa, \( T_a = 22 \)°C, Penman–Monteith returns an evapotranspiration rate of roughly 5.5 mm d\(^{-1}\), exceeding nearby cropland by about 25% and providing local cooling.
</div>

# Chapter 4: Biogeochemistry in Coupled Systems

## 4.1 Carbon and Nitrogen Cycles

Biogeochemical models track pools of organic and inorganic carbon, nitrogen, and phosphorus across vegetation, litter, and soil. Mineralisation, nitrification, denitrification, and leaching are parameterised as first-order kinetics modulated by temperature and moisture:

\[ k = k_{ref} \, Q_{10}^{(T-T_{ref})/10}\, f(\theta). \]

In wetlands, anaerobic conditions favour denitrification, providing a powerful nitrogen-removal service; simultaneously, they generate methane, a greenhouse gas whose flux must be balanced against nitrogen benefits.

## 4.2 Nutrient Transport

A reach is modelled by the advection–dispersion–reaction equation

\[ \frac{\partial C}{\partial t} + u \frac{\partial C}{\partial x} = D \frac{\partial^2 C}{\partial x^2} - k C + S. \]

Coupling to upland models yields estimates of watershed-scale nutrient loading, critical for eutrophication management under climate-driven intensification of storms.

## 4.3 Pathogens and Contaminants of Emerging Concern

Fate-and-transport modelling extends to pathogens, pharmaceuticals, and microplastics. Constructed wetlands and riparian buffers attenuate loads by combining sedimentation, sorption, photolysis, and microbial degradation. Ecohydrological models quantify the attenuation and its sensitivity to residence time.

# Chapter 5: Designing Nature-Based Solutions

## 5.1 Typology

Nature-based solutions include constructed and restored wetlands, riparian and vegetative buffers, green roofs, bioswales, urban forests, managed aquifer recharge with vegetated infiltration basins, regenerative agriculture with cover cropping, and beaver-mimicry structures in incised streams. Each system is a hybrid of ecological function and engineered boundary conditions.

## 5.2 Design Workflow

Design begins with setting objectives (flood attenuation, water-quality improvement, biodiversity, carbon storage) and identifying constraints (land availability, budget, community acceptance). An ecohydrological model is then used to evaluate alternatives under current and projected climate. Sensitivity analysis reveals the parameters and drivers that matter most; Monte Carlo sampling produces performance distributions.

<div class="remark">
<strong>Remark.</strong> The appropriate model complexity depends on the question, the available data, and the intended lifetime of the solution. Excessive complexity wastes effort and obscures the decision-relevant uncertainty; excessive parsimony hides critical feedbacks.
</div>

## 5.3 Multi-Objective Optimisation

Pareto-optimal designs balance competing objectives \( f_j(\mathbf{x}) \) subject to constraints. Evolutionary algorithms such as NSGA-II generate the trade-off front, informing decision-makers of the true cost of one benefit expressed in units of another.

# Chapter 6: Model Philosophy and Societal Use

## 6.1 Optimal Complexity

A model is useful when it is simple enough to expose structure yet rich enough to match observed behaviour. Information theory and cross-validation guide selection: the model with minimum expected Kullback–Leibler divergence, estimated through the Akaike or Bayesian information criterion, wins.

## 6.2 Communicating Uncertainty

Uncertainty decomposes into input, parameter, structural, and scenario components. Ensemble modelling and explicit representation through probability boxes or fuzzy sets present uncertainty to decision-makers without collapsing it prematurely.

## 6.3 From Model to Policy

Ecohydrological models enter policy through scenario comparison, cost-effectiveness ranking, and monitoring feedback. Adaptive management treats each implementation as an experiment, updating models and designs as evidence accumulates. Through this cycle, nature-based solutions evolve from local demonstrations into resilient infrastructures that address climate and water challenges at scale.
