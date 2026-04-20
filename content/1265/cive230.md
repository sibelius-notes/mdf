---
title: "CIVE 230: Engineering and Sustainable Development"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Mihelcic, J.R. and Zimmerman, J.B., *Environmental Engineering: Fundamentals, Sustainability, Design*, 2nd ed., Wiley, 2014; Davis, M.L., *Introduction to Environmental Engineering*, 6th ed., McGraw-Hill, 2021.

**Supplementary texts** — Chapra, S.C., *Surface Water-Quality Modeling*, Waveland, 2008; Tchobanoglous, G., Theisen, H., and Vigil, S., *Integrated Solid Waste Management*, McGraw-Hill, 1993.

**Online resources** — MIT OCW 1.010 "Uncertainty in Engineering" and 1.018 "Fundamentals of Ecology"; UN Sustainable Development Goals documentation; IPCC AR6 public reports; Environment and Climate Change Canada data; World Bank transport and water sector guides.

---

# Chapter 1: Concepts of Sustainability

## 1.1 Defining Sustainability

The Brundtland definition—meeting present needs without compromising future generations—is the most cited. In engineering terms, sustainability spans environmental (emissions, resources, ecosystems), economic (cost, value, feasibility), and social (equity, safety, community) domains. A sustainable system endures because its inputs are renewable or effectively infinite at the scale of use, and its outputs are assimilable or recyclable.

## 1.2 UN Sustainable Development Goals

The 17 SDGs (2015-2030) include SDG 6 (clean water), SDG 7 (affordable and clean energy), SDG 9 (industry, innovation, infrastructure), SDG 11 (sustainable cities), SDG 12 (responsible consumption), SDG 13 (climate action). Civil engineering activities touch most SDGs; quantitative indicators ground discussion in measurement, not aspiration.

## 1.3 Engineering Systems Thinking

A **system** is a set of interacting elements. Closed systems exchange energy but not matter; open systems exchange both. Feedback loops (positive or negative) produce growth, stability, or oscillation. Stocks (cumulative quantities) change through flows; the ratio stock/flow defines residence time. Applying these concepts disciplines analysis of infrastructure, pollution, and resource systems.

## 1.4 Quantifying Sustainability

Common metrics: ecological footprint (gha), carbon footprint (kg CO\(_2\)e), water footprint, material flow intensity. Life-cycle assessment (ISO 14040/14044) structures the quantification; impact assessment methods (TRACI, ReCiPe) translate inventories into category indicators. Uncertainty and subjectivity in weighting call for transparent methods.

# Chapter 2: Air Quality

## 2.1 Atmospheric Structure and Pollutants

Troposphere (0-15 km) hosts weather and most air pollution. Major pollutants: CO, NO\(_x\), SO\(_2\), VOCs, PM (primary); O\(_3\), secondary PM (secondary, photochemical). Health effects: respiratory and cardiovascular disease, cancer, premature mortality. WHO and national guidelines set concentration thresholds.

## 2.2 Sources and Control

Combustion (power, transport, heating) produces most criteria pollutants. Controls: combustion modification (low-NOx burners), post-combustion (ESP, baghouse, scrubber, SCR), fuel switching (natural gas, renewables). Transportation electrification is a rapidly moving lever.

## 2.3 Climate Change

Anthropogenic greenhouse gas emissions (CO\(_2\), CH\(_4\), N\(_2\)O) have raised global mean surface temperature ~1.1 °C over pre-industrial. Continued emissions drive continued warming; IPCC scenarios (SSPs) span outcomes from 1.5 °C (deep decarbonization) to >4 °C (unconstrained). Civil infrastructure adaptations: storm, heat, flood, wildfire resilience.

## 2.4 Metrics and Mass Balances

Global warming potential (GWP\(_{100}\): CH\(_4\) ~28, N\(_2\)O ~265). Carbon intensity (kg CO\(_2\)e per unit output). Emission mass balance at national scale connects fuel combustion, process emissions, and sinks (forests, oceans).

# Chapter 3: Water Quality and Resources

## 3.1 Water Resources

Only ~2.5% of Earth's water is freshwater; most frozen in ice caps. Accessible freshwater is a small fraction of total, unevenly distributed. Water scarcity: physical (arid regions), economic (undeveloped infrastructure). Canada is water-rich but faces regional stress (Prairie provinces, parts of Ontario).

## 3.2 Water Quality Parameters

Physical (turbidity, color, temperature), chemical (pH, DO, alkalinity, hardness, nutrients), biological (pathogens, algae). Drinking-water standards (Canadian Guidelines, WHO) set maximum acceptable concentrations. Surface water and groundwater quality differ in contaminant profiles; groundwater typically cleaner but slower to recover from contamination.

## 3.3 Contaminant Fate and Transport

Advection, dispersion, sorption, biodegradation, volatilization. Governing equation in 1D:

\[ \frac{\partial C}{\partial t} + v\frac{\partial C}{\partial x} - D\frac{\partial^2 C}{\partial x^2} + k C = 0. \]

Retardation factor \( R = 1 + (\rho_b/\theta) K_d \) for sorption. Biodegradation rates span from rapid (labile organics) to essentially zero (PFAS, heavy metals, chlorinated solvents without cometabolism).

## 3.4 Water and Wastewater Treatment

Conventional water treatment: screening, coagulation, flocculation, sedimentation, filtration, disinfection. Advanced: GAC, membrane, UV. Wastewater: primary (physical), secondary (biological), tertiary (nutrient removal, disinfection). Distribution and collection systems require equal design attention.

<div class="example">
<strong>Contaminant plume.</strong> A trichloroethylene spill in a sandy aquifer: <em>v</em> = 0.3 m/day, <em>D</em> = 0.1 m<sup>2</sup>/day, <em>R</em> = 3 (modest sorption). After 10 years, plume center 1100 m downstream; dispersion-spread &sim;60 m. Sorption delays arrival; biodegradation and diffusion into low-permeability zones shape remediation strategy.
</div>

# Chapter 4: Energy Systems

## 4.1 Global Energy Context

Primary energy ~600 EJ/yr, dominated by fossil (~80%). Electricity ~20% of final energy and rising with electrification of heat and transport. Energy intensity (energy per unit GDP) falls with efficiency; per-capita energy varies 30x across countries.

## 4.2 Renewable Technologies

Hydro (mature), wind (mature, growing), solar PV (rapidly growing, cheapest new electricity in many markets), bioenergy (regional, sustainability-contested), geothermal (limited geography). Variable renewables drive grid-integration challenges: storage, transmission, demand response.

## 4.3 Energy Efficiency

Building envelope (insulation, air sealing), HVAC (heat pumps, recovery), lighting (LED), appliances. Industrial: cogeneration, process integration, motor systems. Transportation: electrification, efficiency standards (fuel economy). Economic potential often underused due to split incentives, information gaps, and upfront costs.

## 4.4 Decarbonization Pathways

Electrify end uses on decarbonized electricity; provide hydrogen or biomass for hard-to-electrify sectors (steel, cement, aviation, shipping); capture and store residual CO\(_2\). Timeframes: net-zero 2050 commitments in Canada and many countries require annual emission reductions of ~5% sustained for decades.

# Chapter 5: Transportation Systems

## 5.1 Urban Transportation Modes

Auto (flexible, high energy/km, space-intensive), transit (efficient at high demand, capital-intensive), active (walk/cycle, low impact, distance-limited), freight (road, rail, water). Modal share correlates with urban density, land use, and policy. Car-dependent suburban form locks in high energy demand.

## 5.2 Externalities

Congestion, air pollution, noise, GHG emissions, traffic injury, land consumption. Road pricing (congestion charging, road tolls) internalizes some externalities. Equity implications: pollution and crash risk fall disproportionately on low-income and marginalized communities.

## 5.3 Transit and Active Transportation

Rail (heavy, light, commuter) offers high capacity at fixed route; bus rapid transit is more flexible at lower capital. Bike infrastructure (protected lanes, secure parking) grows ridership. Pedestrian design (sidewalks, crossings, traffic calming) is the most inclusive and lowest-impact transportation.

## 5.4 Intercity Modes

High-speed rail competes effectively with short-haul air (< 600 km) at lower carbon intensity. Freight rail is ~3-4× more efficient per ton-km than trucking. Aviation has been hard to decarbonize; sustainable aviation fuels and efficiency are near-term levers, hydrogen aircraft longer-term.

# Chapter 6: Solid Waste and Developing Country Context

## 6.1 Waste Hierarchy

Prevent > reuse > recycle > recover energy > dispose. Per-capita waste generation varies from ~0.5 kg/day (low-income) to 2+ kg/day (wealthy). Composition shifts with income: organics in low-income, packaging and e-waste in high-income. Extended producer responsibility shifts end-of-life management to producers.

## 6.2 Landfill Engineering

Modern sanitary landfills: engineered liners (geomembrane + clay), leachate collection, gas collection (CH\(_4\) + CO\(_2\), often combusted or flared), cap. Leachate composition evolves over decades; long-term stewardship a regulatory and financial challenge.

## 6.3 Recycling and Recovery

Material recovery facilities (MRFs) separate mixed recyclables by size, density, magnetism, optical sensing. Recycling rates and end markets fluctuate with commodity prices. Composting of organics (windrow, in-vessel, anaerobic digestion) reduces landfill load and GHG emissions. Waste-to-energy (incineration with energy recovery) is established in Europe, limited in North America.

## 6.4 Developing Country Considerations

Many sustainability interventions are context-specific. Affordable, simple, maintainable systems often outperform sophisticated imports: biosand filters, solar cookers, pit latrines, rainwater harvesting. Infrastructure design must respect local institutional capacity, cultural norms, and economic constraints. Engineering education increasingly emphasizes these considerations through global engineering and humanitarian engineering programs.

<div class="remark">
Sustainable civil engineering integrates technical analysis with value-laden choices about what to build, for whom, and at what cost to the environment and future generations. Quantitative methods (LCA, energy modeling, contaminant transport) structure decisions; humility about uncertainty and respect for affected communities make those decisions legitimate.
</div>
