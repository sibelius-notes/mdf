---
title: "ENVE 577: Engineering for Solid Waste Management"
subjects: "ENVE"
---

## Sources and References

**Primary texts:** <em>Integrated Solid Waste Management: Engineering Principles and Management Issues</em> by Tchobanoglous, Theisen, and Vigil (McGraw-Hill); <em>Solid Waste Landfills in Middle and Lower-Income Countries</em> technical guidance series; <em>Handbook of Solid Waste Management</em> edited by Kreith and Tchobanoglous.

**Supplementary texts:** <em>Municipal Solid Waste Management</em> by Pichtel; <em>Geotechnical Engineering of Landfills</em> by Manassero and Pasqualini; <em>Environmental Engineering</em> by Davis and Cornwell.

**Online resources:** US EPA Office of Resource Conservation and Recovery; European Environment Agency waste indicators; ISWA knowledge library; MIT OpenCourseWare 1.84J Sustainable Energy.

---

# Chapter 1: Solid Waste Streams and Generation

## 1.1 Classification

Solid wastes are classified by source (municipal, commercial, industrial, construction and demolition, biomedical, agricultural) and by characteristics (combustible, putrescible, inert, hazardous). Engineering decisions about collection, processing, and disposal depend critically on composition.

## 1.2 Generation and Projection

Per-capita generation \( g \) scales with income and consumption patterns. The total generation rate in a service area is \( G(t) = \sum_i P_i(t)\, g_i(t) \), with population \( P_i \) and per-capita rate \( g_i \) by sector \( i \). Long-range planning uses logistic projections that recognise saturation at high affluence.

## 1.3 Physical and Chemical Properties

Key properties include density (loose, as-discarded, compacted, in place), moisture content, particle size distribution, calorific value, and elemental composition. The as-fired heating value follows the modified Dulong equation

\[ HHV = 145.4\,C + 620\,(H - O/8) + 40.5\,S \]

in Btu per pound of dry fuel, with \( C, H, O, S \) in mass fractions.

<div class="definition">
<strong>Integrated solid waste management.</strong> A strategic combination of reduction, reuse, recycling, composting, energy recovery, and environmentally sound disposal tailored to local economic, social, and environmental conditions.
</div>

# Chapter 2: Storage, Collection, Transfer, and Transport

## 2.1 On-Site Storage

Storage containers are sized by generation rate, collection frequency, and accepted density. For a residence generating \( g = 12 \) kg week\(^{-1}\) at compacted density 200 kg m\(^{-3}\), a 120-L cart provides approximately two weeks of capacity with a 50% factor of safety.

## 2.2 Collection Routing

Collection represents the single largest operating cost of a municipal system. Route design uses the node-arc travelling salesman or Chinese postman formulations. The heuristic sequence of right-hand turns, avoidance of backtracking, and balanced route durations yields practical solutions within a few percent of optimum.

## 2.3 Transfer Stations

When the haul distance to disposal exceeds roughly 25 km, transfer stations become economic. The breakeven distance satisfies

\[ C_{direct}(d) = C_{transfer} + C_{long-haul}(d), \]

where transfer fees are offset by cheaper high-volume trucking. Types include direct-discharge, storage-discharge, and compaction stations.

# Chapter 3: Processing, Recovery, and Treatment

## 3.1 Mechanical Processing

Processing unit operations include shredding, screening, air classification, magnetic and eddy-current separation, ballistic separation, and optical sorting. Trommel screens are characterised by cut size \( d_{50} \) and sharpness index. Eddy-current separators exploit the conductivity-to-density ratio \( \sigma/\rho \) to eject non-ferrous metals.

## 3.2 Biological Treatment

Composting aerobically degrades organics in windrows, in-vessel reactors, or aerated static piles. The C/N ratio of feedstock, ideally 25–35, governs stability and odour. Temperature follows a thermophilic phase (55–65°C), key to pathogen reduction. Anaerobic digestion in wet or dry reactors produces biogas with methane content 50–65%; kinetics are commonly represented by the Monod or first-order approximations.

## 3.3 Thermal Treatment

Mass-burn waste-to-energy plants combust refuse in moving-grate furnaces, extracting heat through waterwalls and achieving net electrical efficiencies of 20–27%. Flue gas treatment combines selective non-catalytic reduction for NO\(_x\), semi-dry scrubbing for acid gases, activated carbon for mercury and dioxins, and bag-house filtration for particulates. Gasification and pyrolysis offer alternative thermochemical pathways with distinct syngas and char yields.

<div class="example">
<strong>Example: Recovery cascade.</strong> A city of 500 000 residents generating 1.2 kg cap\(^{-1}\) d\(^{-1}\) produces about 219 000 t yr\(^{-1}\). If source separation captures 35% of paper, metal, glass, and plastic (40% of the stream), composts 25% of organics (30% of the stream), and sends the remainder to a waste-to-energy plant, fewer than 40% of the original mass requires landfilling as bottom ash plus bypass, vastly extending landfill life.
</div>

# Chapter 4: Landfill Design

## 4.1 Siting

Siting weighs hydrogeology, proximity to sensitive receptors, transport logistics, and community acceptance. Preferred sites have low-permeability native soils, a deep unsaturated zone, limited groundwater-resource value, and buffer distance from dwellings, airports (bird hazard), and surface water.

## 4.2 Containment

A composite liner combines a geomembrane (typically 1.5–2 mm HDPE) over a compacted clay liner with hydraulic conductivity \( k \leq 10^{-9} \) m s\(^{-1}\). Leachate collection uses a gravel drainage blanket with perforated pipes and side-slope riser. Leakage through a composite liner with small defects is estimated by the Giroud–Bonaparte equation.

## 4.3 Settlement and Stability

Landfill settlement combines immediate mechanical compression, primary consolidation, and long-term biodegradation-induced secondary compression modelled by

\[ \varepsilon(t) = \varepsilon_0 + C_\alpha \log\!\left(\frac{t}{t_0}\right) + \varepsilon_{bio}\!\left(1 - e^{-k_{bio} t}\right). \]

Side-slope stability uses limit-equilibrium analyses with interface friction angles at the geomembrane–clay, geomembrane–geotextile, and waste–cover interfaces.

# Chapter 5: Landfill Gas and Leachate

## 5.1 Gas Generation

Decomposition of organic matter proceeds through aerobic, acidogenic, methanogenic, and senescent phases. The methane yield from a unit mass of waste follows a first-order decay

\[ Q_{CH_4}(t) = k L_0 M_0 \, e^{-k t}, \]

where \( L_0 \) is methane generation potential and \( k \) is the decay rate. The IPCC and LandGEM formulations extend this to waste deposited over multiple years.

## 5.2 Gas Collection and Control

Vertical and horizontal gas wells extract landfill gas under vacuum for flaring, thermal oxidation, or energy recovery in reciprocating engines or microturbines. Pipe spacing is set so that the radius of influence exceeds neighbour-well distance, typically 30–60 m.

## 5.3 Leachate Quality and Treatment

Leachate composition evolves from high BOD and volatile fatty acids in the acidogenic phase to high ammonia and recalcitrant organics in the methanogenic phase. Treatment combines biological nitrogen removal (nitrification–denitrification or anammox), membrane bioreactors, reverse osmosis, and evaporation. Effluent must satisfy regulatory limits on heavy metals, priority organics, and salinity.

<div class="theorem">
<strong>Darcy head for leachate mound.</strong> Above a drained base, steady recharge \( q \) produces a mound satisfying

\[ \frac{d}{dx}\!\left(K h \frac{dh}{dx}\right) + q = 0, \]

whose solution sets the maximum head on the liner, a key regulatory constraint.
</div>

# Chapter 6: Reliability, Attenuation, and Closure

## 6.1 Natural-Attenuation Sites

In settings with favourable hydrogeology, attenuation landfills rely on the assimilative capacity of the subsurface to dilute and degrade leachate. Design demonstrates that solute concentrations at compliance points remain below standards for the design lifetime, using solute-transport models with sorption, decay, and dispersion.

## 6.2 System Reliability

Reliability analysis combines fault-tree and event-tree models for liner, cap, leachate collection, and gas management. Redundancy (double composite liners with leak detection), inspectability, and maintenance planning are essential to long-term performance. First-order reliability and Monte Carlo simulations propagate uncertainty through limit-state functions.

## 6.3 Closure and Post-Closure Care

Closure involves placement of a final cover (infiltration-limiting barrier, gas-collection layer, vegetative support), stormwater management, and ongoing monitoring of groundwater, surface water, gas, and settlement. Post-closure care extends for 30 years in most jurisdictions but may stretch longer where degradation proceeds slowly. Financial assurance is required to fund closure and post-closure activities irrespective of operator solvency.

## 6.4 Toward Circular Systems

Modern engineering reframes solid waste as misplaced resource. Extended producer responsibility, design-for-disassembly, urban mining, and material-flow accounting move the system from end-of-pipe disposal toward a circular economy, with landfills reserved for residuals that cannot be economically recovered.
