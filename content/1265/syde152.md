---
title: "SYDE 152: Introduction to Ecological Systems"
subjects: "SYDE"
---

## Sources and References

- Ricklefs and Relyea, <em>Ecology: The Economy of Nature</em> (Freeman)
- Begon, Townsend, and Harper, <em>Ecology: From Individuals to Ecosystems</em> (Wiley-Blackwell)
- Madigan et al., <em>Brock Biology of Microorganisms</em> (Pearson)
- Lehninger Principles of Biochemistry (W.H. Freeman)
- Online: Khan Academy Biology, Open Source Ecology resources

---

# Chapter 1: Chemical and Biological Foundations

## 1.1 Water, pH, and Buffers

Life operates in aqueous solution. Water's polarity, hydrogen bonding, and high dielectric constant make it the universal solvent. Dissociation follows

\[
\mathrm{H_2O} \rightleftharpoons \mathrm{H^+ + OH^-}, \qquad K_w = 10^{-14}\ \mathrm{M^2}\ \text{at 25}\ ^\circ\text{C}.
\]

Biological pH stays near 7.4 thanks to buffers such as bicarbonate and phosphate. The Henderson-Hasselbalch equation

\[
\mathrm{pH} = \mathrm{p}K_a + \log_{10}\!\left(\frac{[A^-]}{[HA]}\right)
\]

predicts buffer behaviour.

## 1.2 Macromolecules

Proteins, nucleic acids, lipids, and carbohydrates build biological structure and function. Primary metabolism harvests energy by oxidising reduced carbon; photosynthesis reverses this by capturing solar energy to fix CO<sub>2</sub>. Standard free energy changes quantify spontaneity; ATP hydrolysis at standard conditions releases \( \Delta G^{0\prime} = -30.5 \) kJ/mol, the common energy currency of cells.

# Chapter 2: Organisms and Environments

## 2.1 Tolerance and Niche

Each organism has a tolerance range for temperature, pH, salinity, and moisture. A species' <em>fundamental niche</em> is the set of conditions under which it could persist; its <em>realised niche</em> is the smaller subset it actually occupies in the presence of competitors and predators. Liebig's law of the minimum states that growth is limited by the scarcest essential resource — nitrogen in many terrestrial systems, phosphorus in many freshwater systems, iron in vast ocean regions.

## 2.2 Adaptations

Species evolve morphological, physiological, and behavioural adaptations to their environment. Endotherms stabilise body temperature; ectotherms exploit environmental heat. Arctic fish carry antifreeze glycoproteins; desert plants develop CAM photosynthesis to fix CO<sub>2</sub> at night. Trade-offs (growth vs reproduction, defence vs competitive ability) mean no organism is best at everything.

<div class="example">
Kangaroo rats minimise water loss by concentrating urine, producing metabolic water from seeds, and spending days in humid burrows — a suite of coupled adaptations to desert life.
</div>

# Chapter 3: Populations

## 3.1 Growth Models

Exponential growth arises when per capita rate is constant:

\[
\frac{dN}{dt} = r N.
\]

Logistic growth incorporates resource limitation:

\[
\frac{dN}{dt} = r N\!\left(1 - \frac{N}{K}\right),
\]

where \( K \) is carrying capacity. These models, although idealised, capture key features of real populations: slow initial rise, exponential middle phase, and saturation.

## 3.2 Life History Strategies

Species differ in life history. r-selected species produce many offspring with little parental investment, thriving in variable environments (weeds, insects). K-selected species produce few, well-tended offspring in stable environments (elephants, oaks). Age-structured populations are modelled by Leslie matrices that project age-class abundances over time and yield long-term growth rate and stable age distribution.

## 3.3 Density Dependence and Regulation

Density-dependent factors (competition, disease, predation) increase in impact as population rises and stabilise numbers near \( K \). Density-independent factors (weather, disturbance) shift populations regardless of density. Real populations respond to both, with dynamics ranging from stable equilibria through damped oscillations to chaos.

# Chapter 4: Species Interactions

## 4.1 Competition

Interspecific competition between species using the same limiting resource follows the Lotka-Volterra equations

\[
\frac{dN_1}{dt} = r_1 N_1 \frac{K_1 - N_1 - \alpha_{12} N_2}{K_1},
\]

and analogously for species 2. Stable coexistence requires each species to limit itself more than it limits the other — the competitive-exclusion principle in formal garb.

## 4.2 Predation and Mutualism

Predator-prey dynamics obey the classical Lotka-Volterra system

\[
\frac{dN}{dt} = a N - b N P, \qquad \frac{dP}{dt} = -c P + d N P,
\]

producing neutrally stable oscillations. More realistic models with handling time (Holling functional responses) and density-dependent predator growth produce limit cycles, multiple equilibria, and collapse thresholds.

Mutualisms — pollination, seed dispersal, mycorrhizae, gut microbiota — are ubiquitous and provide ecological services essential for ecosystem function and human food systems.

# Chapter 5: Communities and Biogeochemical Cycles

## 5.1 Community Structure

Species diversity is characterised by richness (number of species), evenness (relative abundances), and functional diversity (variety of ecological roles). The Shannon index

\[
H = -\sum_{i} p_i \ln p_i
\]

captures both richness and evenness. Ecological succession — primary on bare rock, secondary after disturbance — reshuffles communities over decades to centuries, guided by facilitation, inhibition, and tolerance mechanisms.

## 5.2 Ecosystems and Energy Flow

Primary producers fix solar energy via photosynthesis; ecological efficiency between trophic levels is typically 10%. Biogeochemical cycles move carbon, nitrogen, phosphorus, and water through atmosphere, biosphere, hydrosphere, and lithosphere at characteristic residence times. The nitrogen cycle encompasses fixation, nitrification, denitrification, assimilation, and ammonification; human activity has roughly doubled the rate of reactive nitrogen fixation with consequences for water quality and climate.

<div class="definition">
An <strong>ecosystem</strong> is a community of organisms together with its abiotic environment, functioning as a unit through energy flow and biogeochemical cycling. Inputs of energy and some matter cross ecosystem boundaries; most matter recycles internally.
</div>

## 5.3 Terrestrial and Aquatic Ecosystems

Terrestrial biomes — tundra, boreal forest, temperate forest, grassland, tropical rainforest, desert — are organised primarily by temperature and precipitation. Aquatic systems (lakes, streams, estuaries, oceans) organise around light, nutrients, stratification, and flow. Microbial communities drive much of the underlying biogeochemistry in every system.

# Chapter 6: Human Impacts and Sustainable Futures

## 6.1 The Anthropocene Drivers

Humans have transformed roughly half of Earth's land surface, altered the nitrogen and phosphorus cycles, shifted atmospheric CO<sub>2</sub> from 280 ppm to 425+ ppm, and driven sixth-mass-extinction species loss. The five IPBES drivers — land-use change, direct exploitation, climate change, pollution, invasive species — act synergistically. Feedback loops amplify some impacts (permafrost CO<sub>2</sub> release, deforestation reducing rainfall).

## 6.2 Climate Change

Radiative forcing from increased CO<sub>2</sub> follows \( \Delta F \approx 5.35 \ln(C/C_0) \) W/m<sup>2</sup>. At equilibrium, a doubling of CO<sub>2</sub> warms Earth by 2.5–4 °C depending on feedbacks (water vapour, ice-albedo, clouds). Engineering responses include mitigation (renewable energy, electrification, carbon capture), adaptation (infrastructure, ecosystem restoration), and negative emissions (BECCS, direct air capture, nature-based solutions).

## 6.3 Conservation and Restoration

Biodiversity conservation protects species and the ecological services they provide. Habitat protection, restoration, assisted migration, and invasive-species management are engineering-scale undertakings when applied at landscape level. Agroecology, precision farming, and ecosystem-based management align food and fiber production with ecological function.

<div class="example">
Wetland restoration can deliver carbon storage (sequestering 200–400 Mg C/ha in peatlands), water filtration, flood attenuation, and biodiversity habitat — a multi-service infrastructure.
</div>

## 6.4 Engineering and Ecology

Engineers designing in ecological context must connect the microscale (biochemistry, microbiology, soil chemistry) with the macroscale (habitat, community, ecosystem services). Civil, chemical, environmental, and systems engineers collaborate with ecologists on green infrastructure, ecological restoration, circular economies, and net-zero transitions. Ecological literacy — understanding adaptation, dynamics, and interconnection — is essential to build the sustainable future that engineering alone cannot deliver.

<div class="theorem">
Ecological systems display regulation by feedback, delays, and non-linear responses; their boundaries overlap human systems so thoroughly that engineering decisions at one scale reliably cascade through nested scales of organisms, communities, and ecosystems.
</div>
