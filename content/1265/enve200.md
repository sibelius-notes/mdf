---
title: "ENVE 200: Sustainability Analysis and Solutions"
subjects: "ENVE"
---

## Sources and References

**Primary texts** — Mihelcic, J. R. and Zimmerman, J. B., *Environmental Engineering: Fundamentals, Sustainability, Design*; Allen, D. T. and Shonnard, D. R., *Sustainable Engineering: Concepts, Design, and Case Studies*.

**Supplementary texts** — Davis, M. L. and Masten, S. J., *Introduction to Environmental Engineering*; Hendrickson, C. T., Lave, L. B., and Matthews, H. S., *Environmental Life Cycle Assessment of Goods and Services*; Longley, P. A., Goodchild, M. F., Maguire, D. J., and Rhind, D. W., *Geographic Information Systems and Science*.

**Online resources** — United Nations 2030 Agenda and Sustainable Development Goals materials; IPCC *Assessment Reports* (Working Groups I–III); US EPA WARM model and GREET tool documentation; openLCA and ecoinvent open documentation; QGIS and PostGIS open documentation.

---

# Chapter 1: Sustainability as an Engineering Discipline

Sustainability is not a style or a label but a set of principles that reshape engineering design. An engineer designs within planetary boundaries, for human welfare across generations, and through systems that integrate energy, materials, water, waste, and social context. This course develops the analytical tools and the design judgment to do so.

## 1.1 The Three-Pillar Model and Its Successors

The classical **triple bottom line** (environment, economy, society) is simple but sometimes misleading. Nested models place the economy within society within the biosphere, emphasizing that ecological limits bound social and economic systems. The **planetary boundaries** framework (Rockström and colleagues) identifies control variables — climate, biosphere integrity, biogeochemical flows, land use, freshwater, novel entities, ocean acidification, stratospheric ozone, aerosol loading — whose transgression destabilizes the Earth system.

## 1.2 Sustainable Development Goals

The SDGs translate sustainability into seventeen measurable goals and 169 targets. Engineers particularly address SDGs 6 (water), 7 (energy), 9 (infrastructure), 11 (cities), 12 (consumption), 13 (climate), 14 and 15 (life below water and on land).

<div class="definition">
<strong>Critical evaluation.</strong> Structured comparison of alternatives against explicit criteria, weighting, and evidence, with conclusions traceable to data and assumptions rather than advocacy.
</div>

# Chapter 2: Energy Systems

## 2.1 Energy Balance and Demand

An engineered system's energy accounting starts with a balance

\[
\dot E_{\text{in}} = \dot E_{\text{out}} + \frac{dE_{\text{stored}}}{dt}
\]

Building energy demand decomposes into transmission, infiltration, ventilation, internal gains, and solar gains. Transportation energy is \(E = \eta^{-1}\,m\,g\,f\,d + \eta^{-1}\int \tfrac{1}{2}\rho C_d A v^2\,dv\ldots\) capturing rolling resistance and aerodynamic drag.

## 2.2 Low-Carbon Electricity

Renewable generation — solar PV, wind, hydro, geothermal — and low-carbon dispatchable sources — nuclear, biomass, CCS-equipped fossil — replace conventional thermal plants. Capacity factor and capacity credit differ: solar PV's capacity factor may be 20% yet its capacity credit in resource-adequacy studies is lower. System-level analysis weighs capital, levelized cost of electricity, and externalities.

## 2.3 Energy Efficiency

Efficiency interventions — insulation, heat pumps, LED lighting, variable frequency drives, process integration (pinch analysis) — often yield the most cost-effective emissions reductions. Technical, economic, and achievable potentials differ; behavioural rebound effects can erode projected savings.

# Chapter 3: Air, Water, and Waste Systems

## 3.1 Air Quality

Ambient air quality depends on emissions, atmospheric transport and transformation, and meteorology. Dispersion models range from simple Gaussian plumes,

\[
C(x,y,z) = \frac{Q}{2\pi u \sigma_y \sigma_z}\exp\!\left(-\frac{y^2}{2\sigma_y^2}\right)\left[\exp\!\left(-\frac{(z-H)^2}{2\sigma_z^2}\right) + \exp\!\left(-\frac{(z+H)^2}{2\sigma_z^2}\right)\right]
\]

to three-dimensional photochemical grid models (CMAQ, CAMx). Engineered controls include scrubbers, baghouses, electrostatic precipitators, selective catalytic reduction, and source substitution.

## 3.2 Water Systems

Water design integrates demand management, source protection, treatment, distribution, reuse, and stormwater. Ecological flow requirements constrain withdrawals; climate change shifts rainfall and snowmelt regimes, requiring adaptive planning. Engineered wetlands, decentralized systems, and water reuse expand the design palette beyond conventional grey infrastructure.

## 3.3 Waste and Circular Economy

The waste hierarchy — reduce, reuse, recycle, recover, dispose — prioritizes upstream action. A **circular economy** redesigns products and material flows so that wastes become inputs. Engineers design for disassembly, substitute benign materials, extend product lifetimes, and close nutrient and material loops.

<div class="example">
<strong>Simple payback.</strong> A heat-recovery retrofit costing CAD 60,000 saves 250 GJ/year of natural gas at CAD 10/GJ, giving simple payback <em>60,000/(250 × 10) = 24</em> years. Discounting at 4% and accounting for avoided carbon pricing (say CAD 80/t × 12.5 t CO<sub>2</sub>/yr) shortens payback. Whether the project proceeds depends on more than payback — maintenance, reliability, co-benefits, and climate commitments all enter.
</div>

# Chapter 4: Sustainability Analysis Methods

## 4.1 Life Cycle Assessment

**LCA** quantifies environmental impacts of a product or service across its life cycle — raw material extraction, manufacturing, use, end-of-life. ISO 14040/14044 structures LCA in four phases: goal and scope, inventory, impact assessment, interpretation. Impact categories include climate change (GWP), acidification, eutrophication, ozone depletion, particulate matter, human toxicity, and resource depletion.

Consequential and attributional LCAs differ. Allocation of impacts among co-products uses mass, energy, economic, or substitution approaches — each with implications.

## 4.2 Cost–Benefit and Multi-Criteria Analysis

Cost–benefit analysis monetizes impacts; multi-criteria decision analysis keeps them in natural units and applies weights. The weighted sum

\[
V_j = \sum_i w_i \, s_{ij}
\]

ranks alternatives \(j\) on criteria \(i\) with scores \(s_{ij}\) and weights \(w_i\). Sensitivity analysis varies weights and scores to test robustness.

## 4.3 Material Flow and Substance Flow Analysis

MFA and SFA track mass through a system at national, regional, or sectoral scales. Stocks (buildings, vehicles) can dominate flows; understanding stock dynamics matters for long-term circularity.

# Chapter 5: GIS and Spatial Decision Support

## 5.1 Geographic Data

Spatial data come as vectors (points, lines, polygons) and rasters (gridded cells). Coordinate systems, projections, and datums must be consistent. Sources include government open data, remote sensing, crowdsourced (OpenStreetMap), and project-specific surveys.

## 5.2 Spatial Analysis

Common operations include overlay (intersection, union), buffer, distance, interpolation (IDW, kriging), terrain analysis (slope, aspect, watershed delineation from DEMs), and network analysis (shortest path). Environmental engineering applications span site selection (landfills, solar farms), floodplain mapping, contaminant plume delineation, and public-service accessibility.

## 5.3 Communicating Spatial Information

Effective maps are designed for their audience. Data classification (natural breaks, equal interval, quantiles), colour ramps (sequential, diverging, qualitative), and legends choices shape interpretation. Maps accompany public consultations and support stakeholder engagement.

# Chapter 6: Climate Change Mitigation and Adaptation

## 6.1 Climate Science Essentials

Atmospheric CO\(_2\) rose from \(\approx 280\ \text{ppm}\) pre-industrial to over \(420\ \text{ppm}\) in the 2020s. Radiative forcing from GHGs drives surface warming; equilibrium climate sensitivity is estimated at \(2.5\text{–}4\ \text{°C}\) per CO\(_2\) doubling. Regional impacts — shifting precipitation, intensified extremes, sea-level rise, ecosystem shifts — are heterogeneous.

## 6.2 Mitigation

Mitigation options include decarbonizing electricity, electrifying end uses, improving efficiency, switching fuels, reducing non-CO\(_2\) gases, and sequestering carbon (afforestation, soils, CCS, direct air capture). Engineers contribute by designing zero-carbon buildings and transport, decarbonized industry, and negative-emissions technologies.

## 6.3 Adaptation

Adaptation addresses unavoidable climate impacts. Infrastructure adaptation includes uprating stormwater systems to new IDF curves, raising critical facilities above projected flood elevations, hardening power infrastructure against wildfire and windstorms, and enhancing heat resilience through cool surfaces and green spaces. Nature-based solutions — wetlands, living shorelines, urban forests — provide co-benefits for biodiversity and wellbeing.

## 6.4 Project Synthesis

A design project in this course integrates these themes: characterize the problem, analyse alternatives using LCA, GIS, and multi-criteria methods, engage stakeholders, and present a recommendation with its uncertainties and trade-offs. The deliverables — a report, drawings, a presentation — exercise the full communication skill set.

<div class="remark">
<strong>Problem framing.</strong> In sustainability work the hardest step is often framing the problem well: what system boundary, what functional unit, whose welfare, over what horizon. Engineers who frame problems honestly are far more useful than those who optimize the wrong thing with high precision.
</div>

The sustainability-oriented engineer translates large, contested, interdisciplinary questions into tractable design problems, without losing sight of the stakes. That translation — from planet to project — is the core competency this course develops.
