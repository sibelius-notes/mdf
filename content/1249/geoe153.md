---
title: "GEOE 153: Earth Engineering"
prof: "Keith Delaney"
subjects: "GEOE"
---

## Sources and References

- Tarbuck, E. J., Lutgens, F. K., Tsujita, C., & Hicock, S. *Earth: An Introduction to Physical Geology*, 4th Canadian ed. Pearson/Prentice-Hall, 2019.
- Das, B. M. *Principles of Geotechnical Engineering*, 9th ed. Cengage Learning, 2018.
- Goodman, R. E. *Introduction to Rock Mechanics*, 2nd ed. Wiley, 1989.
- Twiss, R. J. & Moores, E. M. *Structural Geology*, 2nd ed. W. H. Freeman, 2007.
- MIT OpenCourseWare. *1.011 Project Evaluation*. Massachusetts Institute of Technology.

---

# Chapter 1: Earth Materials — Minerals

## 1.1 What Is a Mineral?

A mineral is a naturally occurring, inorganic, crystalline solid with a definite chemical composition and a characteristic atomic structure. Each of these criteria must be satisfied simultaneously: glass, for instance, is inorganic and naturally occurring but lacks a crystalline lattice, so it does not qualify. Over four thousand mineral species have been formally identified, though fewer than a dozen rock-forming minerals account for the overwhelming bulk of Earth's crust.

## 1.2 Mineral Properties Used in Identification

Engineers and geologists distinguish minerals using a set of measurable physical properties:

**Hardness.** Mohs' scale assigns a relative hardness from 1 (talc) to 10 (diamond). A mineral will scratch any other mineral softer than itself. Common field tests — a fingernail (≈ 2.5), a copper coin (≈ 3.5), a steel file (≈ 6.5) — bracket unknown specimens efficiently.

**Cleavage and fracture.** Cleavage is the tendency to break along smooth, planar surfaces controlled by weak bonds in the crystal structure. The number of cleavage directions and the angles between them are diagnostic: feldspars exhibit two cleavage planes at nearly 90°, calcite three at 74°. Minerals that lack cleavage produce irregular fracture surfaces; quartz characteristically shows conchoidal (shell-like) fracture.

**Lustre.** Describes the quality of light reflection: metallic (like polished iron), vitreous (glassy), resinous, pearly, or silky.

**Colour and streak.** Surface colour can be misleading because trace impurities shift it dramatically. Streak — the colour of the powdered mineral rubbed on unglazed porcelain — is far more consistent and therefore more diagnostic.

**Specific gravity.** The ratio of a mineral's density to that of water at 4 °C. Most silicate minerals cluster near 2.6–2.8 g cm\(^{-3}\); iron-bearing minerals and ore minerals are considerably denser.

## 1.3 Silicate Minerals

Silicon and oxygen, the two most abundant elements in Earth's crust, combine in tetrahedral units (\(\text{SiO}_4^{4-}\)) that polymerize in different ways to produce the major silicate groups:

- **Isolated tetrahedra (nesosilicates):** olivine, garnet — dense, high-temperature minerals common in mafic and ultramafic rocks.
- **Single chains (inosilicates):** pyroxenes (e.g., augite) — dark minerals with two cleavage planes at ~90°.
- **Double chains:** amphiboles (e.g., hornblende) — two cleavage planes at ~60°/120°, distinguishing them from pyroxenes.
- **Sheet silicates (phyllosilicates):** micas (muscovite, biotite), clay minerals — perfect basal cleavage, platy habit. Clay minerals are central to geotechnical engineering because of their small grain size, large surface area, and capacity to adsorb water.
- **Framework silicates (tectosilicates):** quartz and feldspars — the most abundant crustal minerals. Quartz (\(\text{SiO}_2\)) is hard (7), chemically resistant, and colourless to milky white. Feldspars (orthoclase, plagioclase series) make up ~60% of the crust by volume.

## 1.4 Non-Silicate Minerals

Carbonates (calcite \(\text{CaCO}_3\), dolomite), sulphates (gypsum, anhydrite), halides (halite), oxides (hematite, magnetite), and sulphides (pyrite) complete the common mineral inventory. Carbonates react with dilute HCl (effervescence), a quick field test. The presence of gypsum in foundation soils signals potential for swelling or volume change.

---

# Chapter 2: Rocks — Classification and the Rock Cycle

## 2.1 The Rock Cycle

Earth's rock record is perpetually recycled through three broad genetic categories. Magma generated in the mantle or lower crust solidifies to form **igneous** rock. Exposure at the surface subjects any rock to **weathering** and **erosion**, producing sediment that is transported, deposited, and lithified into **sedimentary** rock. Burial and the heat and pressure that accompany it convert any rock type into **metamorphic** rock. Sufficient heat melts metamorphic or sedimentary rock back to magma, completing the cycle. The concept, formalized largely through the work of James Hutton in the late eighteenth century, underlies the principle that geological processes operating today also operated in the past (uniformitarianism).

## 2.2 Igneous Rocks

Igneous rocks are classified by **texture** (grain size, which reflects cooling rate) and **composition** (silica content and mineralogy).

| Cooling environment | Texture | Example |
|---|---|---|
| Slow (plutonic / intrusive) | Coarse-grained (phaneritic) | Granite, gabbro |
| Fast (volcanic / extrusive) | Fine-grained (aphanitic) | Rhyolite, basalt |
| Very fast | Glassy | Obsidian |
| Gas-rich | Vesicular or pyroclastic | Pumice, tuff |

Composition ranges from **felsic** (high \(\text{SiO}_2\), ~70%; granite, rhyolite) through **intermediate** (andesite, diorite) and **mafic** (low \(\text{SiO}_2\), ~50%; basalt, gabbro) to **ultramafic** (peridotite). Mafic and ultramafic rocks are denser and tend to form oceanic crust and the upper mantle.

From a rock mechanics standpoint (Goodman 1989), intact igneous rock generally exhibits high uniaxial compressive strength (\(\sigma_c\) of 100–300 MPa for granite), but weathering, jointing, and hydrothermal alteration can reduce effective strength by one to two orders of magnitude. Joint spacing, orientation, and roughness are therefore critical parameters in any rock engineering assessment.

## 2.3 Sedimentary Rocks

Sedimentary rocks form at or near Earth's surface and cover ~75% of the continental land area despite constituting only ~5% of crustal volume. They preserve a record of past environments and often host economically important mineral and fluid resources.

**Clastic (detrital) sedimentary rocks** are classified by grain size:

\[
\text{Clay} < 0.004\ \text{mm} < \text{Silt} < 0.0625\ \text{mm} < \text{Sand} < 2\ \text{mm} < \text{Gravel}
\]

Corresponding rock names run from shale and mudstone (clay/silt) through sandstone to conglomerate and breccia (gravel). Porosity and permeability — critical engineering parameters — depend strongly on grain size distribution and cementation. Sandstones can make excellent aquifers or hydrocarbon reservoirs; shales are common aquitards and are often the weakest element in a stratigraphic sequence.

**Chemical and biogenic sedimentary rocks** precipitate from solution or are biologically secreted. Limestone (\(\text{CaCO}_3\)) is prone to dissolution by slightly acidic groundwater, creating karst landscapes with sinkholes, caves, and highly irregular rock surfaces that present significant foundation challenges. Evaporites (halite, gypsum) dissolve and may cause subsidence.

Sedimentary structures — bedding, cross-bedding, graded bedding, ripple marks — record depositional environment and, critically for engineering, define planes of weakness and potential failure surfaces.

## 2.4 Metamorphic Rocks

Metamorphism transforms pre-existing rock through heat, pressure, and chemically active fluids without wholesale melting. **Regional metamorphism** accompanies mountain-building at convergent boundaries and produces the most extensive metamorphic terranes. **Contact metamorphism** occurs adjacent to igneous intrusions.

Metamorphic grade increases with temperature and pressure. Common index minerals (chlorite → biotite → garnet → staurolite → kyanite → sillimanite) track grade in pelitic (clay-rich) protoliths.

**Foliation** — the planar fabric produced by alignment of platy or elongated minerals — defines planes of weakness in metamorphic rock masses. Slate, phyllite, schist, and gneiss represent a progression of increasing grade and coarsening grain. Quartzite (from sandstone) and marble (from limestone) are non-foliated metamorphic rocks with generally good engineering properties, though marble is susceptible to dissolution like its precursor.

---

# Chapter 3: Structural Geology and Tectonics

## 3.1 Plate Tectonics — The Unifying Framework

The theory of plate tectonics, solidified through the 1960s, holds that Earth's lithosphere is divided into a mosaic of rigid plates that move over the weaker asthenosphere. Relative plate motions are driven primarily by mantle convection and slab pull. The three fundamental plate boundary types produce distinct geological signatures:

- **Divergent boundaries** (mid-ocean ridges, continental rifts): lithospheric extension, normal faulting, basaltic volcanism, creation of new oceanic crust.
- **Convergent boundaries** (subduction zones, collision zones): compression, reverse and thrust faulting, mountain building (orogenesis), arc volcanism, and metamorphism.
- **Transform boundaries** (strike-slip faults): horizontal shear, seismically active, no significant volcanism.

Canada's geology bears the imprint of multiple ancient orogenic episodes (Grenville, Appalachian, Cordilleran) superimposed on the Precambrian Canadian Shield — the largest exposure of Archean crust on Earth.

## 3.2 Stress, Strain, and Rock Deformation

Rock deforms in response to applied stress. Stress \(\sigma\) is force per unit area (Pa or MPa); strain \(\varepsilon\) is the fractional change in dimension. The behaviour depends on lithology, temperature, confining pressure, strain rate, and the presence of fluids.

At shallow crustal levels and high strain rates, rock responds **brittlely** — fracturing to produce joints and faults. At greater depth, elevated temperature promotes **ductile** flow — the rock bends without fracturing, producing folds and mylonites.

**Principal stress orientations** govern the style of deformation:
- Extension (\(\sigma_1\) vertical): normal faults, graben.
- Compression (\(\sigma_1\) horizontal): reverse/thrust faults, fold-and-thrust belts.
- Wrenching (\(\sigma_1\) horizontal, \(\sigma_3\) horizontal, \(\sigma_2\) vertical): strike-slip faults.

## 3.3 Folds

Folds result from ductile shortening of layered rock. An **anticline** arches upward with older strata in the core; a **syncline** sags downward with younger strata in the core. **Plunging** folds have a hinge line that dips in one direction. Overturned and recumbent folds indicate intense shortening. In engineering practice, fold geometry controls the orientation of bedding planes, which may act as slide surfaces in cut slopes and excavations.

## 3.4 Faults

A **fault** is a fracture along which displacement has occurred. Key parameters are the **fault plane orientation** (strike and dip), the **slip vector**, and the **sense of movement**:

- **Normal fault:** hanging wall moves down; dip 45–70°; extensional regime.
- **Reverse fault:** hanging wall moves up; dip >45°; compressional regime.
- **Thrust fault:** reverse fault with dip <45°; major feature of fold-and-thrust belts.
- **Strike-slip fault:** horizontal movement parallel to strike; right-lateral or left-lateral.

Fault zones are mechanically complex: they may contain **gouge** (granulated rock), **breccia**, **mylonite**, and hydrothermal alteration products. Permeability along faults can be orders of magnitude higher or lower than the surrounding rock, which has profound implications for groundwater flow and dam foundation stability.

## 3.5 Joints and Fracture Networks

Joints are fractures with no appreciable shear displacement. They occur in systematic sets whose orientation reflects the paleostress field. For rock engineering, the **Rock Quality Designation (RQD)** — the percentage of core recovered in intact pieces ≥ 10 cm — provides a simple index of fracture intensity. More complete characterizations employ the **Q-system** or **Rock Mass Rating (RMR)** to account for joint spacing, roughness, alteration, and groundwater conditions.

---

# Chapter 4: Geologic Time and Earth History

## 4.1 Relative and Absolute Age

**Relative dating** establishes a sequence of events using stratigraphic principles:
- **Superposition:** In undisturbed sequences, older strata underlie younger strata.
- **Original horizontality:** Sediments are deposited approximately horizontally; tilted beds record post-depositional deformation.
- **Cross-cutting relationships:** An intrusion or fault is younger than the rocks it cuts.
- **Inclusions:** Fragments within a rock are older than the enclosing rock.
- **Faunal succession:** Fossil assemblages succeed one another in a predictable, irreversible order.

**Absolute (radiometric) dating** exploits the constant decay rate of radioactive parent isotopes to stable daughter products. For a radioactive system, the number of parent atoms \(N\) at time \(t\) is:

\[
N(t) = N_0 \, e^{-\lambda t}
\]

where \(N_0\) is the initial number of parent atoms and \(\lambda\) is the decay constant. The **half-life** \(t_{1/2} = \ln 2 / \lambda\) is the time for half the parent atoms to decay. Different isotope pairs are suited to different age ranges: \(^{14}\text{C}/^{12}\text{C}\) for material up to ~50,000 yr; \(^{40}\text{K}/^{40}\text{Ar}\) and \(^{87}\text{Rb}/^{87}\text{Sr}\) for millions to billions of years; U-Pb for the oldest terrestrial and meteoritic material.

## 4.2 The Geologic Time Scale

The geologic time scale divides Earth's ~4.54 Ga history into hierarchical units: eons, eras, periods, and epochs. The Precambrian (Hadean, Archean, Proterozoic eons) spans the first ~4 Ga and encompasses the origin of the planet, formation of the crust, emergence of life, and major glaciations. The Phanerozoic eon (last ~541 Ma) is defined by the appearance of abundant macrofossils and is subdivided into the Paleozoic, Mesozoic, and Cenozoic eras.

For engineering in Canada, Quaternary geology (the last ~2.6 Ma) is especially pertinent: glacial and post-glacial processes have sculpted the landscape, deposited diverse unconsolidated sediments, and altered stress states within near-surface rock.

---

# Chapter 5: Topographic and Geologic Maps

## 5.1 Topographic Maps

A topographic map represents three-dimensional terrain on a two-dimensional surface using **contour lines** — lines of equal elevation. Key concepts:

- **Contour interval:** the vertical distance between successive contours. Closely spaced contours indicate steep slopes; widely spaced contours indicate gentle terrain.
- **Index contours:** every fifth contour is printed heavier and labelled.
- **V-shaped contours:** valleys where contours point upstream (uphill); ridges where contours point downhill.

Map scale relates horizontal distance on the map to true ground distance:

\[
\text{Scale} = \frac{\text{map distance}}{\text{ground distance}}
\]

A 1:50,000 map means 1 cm on the map equals 50,000 cm (500 m) on the ground. Accurate topographic maps are prerequisite for any site investigation, route selection, or terrain analysis.

## 5.2 Geologic Maps

A geologic map depicts the distribution of rock units (formations) and structural features at the earth's surface. Formations — the fundamental mappable units of stratigraphy — are defined by distinctive lithology and are bounded by contacts. Faults, fold axial traces, and the strike and dip of bedding are symbolized by standard notation.

**Strike** is the compass bearing of the line formed by the intersection of a dipping plane with a horizontal plane. **Dip** is the angle of inclination below horizontal, measured perpendicular to strike. In the field, a Brunton compass measures both simultaneously. On a geologic map, the strike-and-dip symbol shows strike direction as a line and dip magnitude as a tick mark on the downslope side.

**Cross-sections** project surface geology to depth, allowing three-dimensional interpretation of subsurface structure. They are constructed by projecting surface strikes and dips downward and are essential for any subsurface engineering assessment — tunnel routing, foundation design, or slope stability analysis.

---

# Chapter 6: Weathering, Soils, and Mass Wasting

## 6.1 Weathering Processes

Weathering is the in-place disintegration and decomposition of rock and minerals at or near Earth's surface.

**Mechanical (physical) weathering** breaks rock into smaller fragments without changing composition. Processes include:
- **Frost wedging (freeze-thaw):** Water expands ~9% upon freezing; repeated cycles pry apart joints and fractures.
- **Salt crystallization:** Evaporation in pores precipitates salts whose growth exerts pressure.
- **Unloading (pressure release):** Removal of overburden reduces confining stress, allowing rock to expand and develop sheet joints (sheeting, exfoliation) parallel to the surface.
- **Thermal expansion:** Daily temperature cycles stress mineral grain boundaries.

**Chemical weathering** alters mineral composition. The primary agents are water, oxygen, and carbonic acid (formed when \(\text{CO}_2\) dissolves in water):

\[
\text{CO}_2 + \text{H}_2\text{O} \rightarrow \text{H}_2\text{CO}_3 \rightarrow \text{H}^+ + \text{HCO}_3^-
\]

**Hydrolysis** — reaction with water, often acidified — converts feldspars and other silicates to clay minerals and dissolved ions. **Oxidation** converts iron-bearing minerals (e.g., olivine, pyrite) to iron oxides and hydroxides (rust). **Dissolution** removes soluble minerals in solution; limestone landscapes owe their karst morphology entirely to carbonate dissolution.

The **weathering profile** grades from fresh rock at depth upward through increasingly altered zones to the fully weathered residual soil at surface. This profile is classified in six grades (Grades I–VI) widely used in tropical and sub-tropical engineering geology, but the principle applies globally wherever in situ weathering dominates over erosion.

## 6.2 Soils in Engineering

Engineering soil encompasses all unconsolidated material above bedrock. Das (2018) defines several key index properties:

**Grain size distribution** is measured by sieve analysis for particles ≥ 0.075 mm (No. 200 sieve) and by hydrometer analysis for finer material. The **coefficient of uniformity** \(C_u = D_{60}/D_{10}\) and the **coefficient of gradation** \(C_c = D_{30}^2 / (D_{60} \cdot D_{10})\) characterize the distribution shape.

**Atterberg limits** define the water content boundaries between consistency states of fine-grained soils:
- **Liquid limit (LL):** water content at which soil transitions from plastic to liquid behaviour.
- **Plastic limit (PL):** water content below which soil ceases to be plastic.
- **Plasticity index (PI) = LL − PL:** range of water content over which the soil is plastic.

High PI indicates high clay content and greater compressibility and strength variability.

**Unified Soil Classification System (USCS)** categorizes soils using grain size and plasticity, producing two-letter designations (e.g., SW = well-graded sand, CH = high-plasticity clay) that correlate loosely with engineering behaviour.

## 6.3 Mass Wasting

Mass wasting is the downslope movement of rock, regolith, or soil under gravity. It differs from erosion in that no transporting medium (water, ice, wind) is required.

Movement type depends on material, water content, and slope gradient. A simplified classification includes:

| Type | Material | Water content | Movement rate |
|---|---|---|---|
| Rockfall | Rock | Dry | Extremely rapid |
| Rockslide (planar/wedge) | Rock | Variable | Rapid to slow |
| Debris flow | Mixed | High | Very rapid |
| Mudflow | Fine-grained | Very high | Rapid |
| Rotational slump | Soil | Moderate | Slow to rapid |
| Creep | Soil / rock | Variable | Extremely slow |

**Slope stability analysis** uses limit-equilibrium methods. For an infinite slope in cohesionless soil, the factor of safety against sliding is:

\[
F = \frac{\tan \phi}{\tan \beta}
\]

where \(\phi\) is the internal friction angle and \(\beta\) is the slope angle. For a cohesive soil or a more general failure surface, the **Bishop simplified method** or more rigorous approaches (Spencer, Morgenstern-Price) are employed.

---

# Chapter 7: Groundwater and Effects of Water

## 7.1 The Hydrologic Cycle

Water moves continuously among the ocean, atmosphere, and land in the hydrologic cycle. Of the precipitation that reaches the land surface, a fraction infiltrates through the **vadose zone** to recharge the **saturated zone** (phreatic zone), where all pore space is filled with water. The upper surface of the saturated zone is the **water table**.

## 7.2 Aquifer Types and Darcy's Law

An **aquifer** is a saturated, permeable geological unit that can yield usable quantities of water. An **unconfined aquifer** has its water table as its upper boundary. A **confined aquifer** is bounded above and below by **aquitards** (low-permeability units); water in a confined aquifer is under pressure greater than atmospheric, and a well penetrating it becomes artesian.

Groundwater flow velocity is described by **Darcy's Law**:

\[
q = k \, i
\]

where \(q\) is the specific discharge (m s\(^{-1}\)), \(k\) is hydraulic conductivity (m s\(^{-1}\)), and \(i = \Delta h / \Delta l\) is the hydraulic gradient. Hydraulic conductivity spans many orders of magnitude, from \(\sim 10^{-12}\) m s\(^{-1}\) for intact clay to \(\sim 10^{-2}\) m s\(^{-1}\) for clean gravel.

## 7.3 Engineering Implications of Groundwater

Groundwater governs **effective stress** — the stress carried by the soil skeleton:

\[
\sigma' = \sigma - u
\]

where \(\sigma\) is total stress and \(u\) is pore water pressure. Shear strength of soil is a function of effective stress (Terzaghi's effective stress principle); a rise in the water table increases pore pressure and reduces effective stress, which can trigger slope failure. Dewatering during excavation lowers pore pressure and induces settlement in adjacent structures.

**Seepage** beneath embankment dams can cause piping — internal erosion along seepage paths — leading to catastrophic failure. Filter design using the Terzaghi filter criteria prevents particle migration.

---

# Chapter 8: Glaciation and Quaternary Geology

## 8.1 Glaciers and Ice Sheets

A glacier forms where annual snowfall persistently exceeds annual ablation. Compaction converts snow to firn and then to glacial ice. Ice flows by internal deformation (creep of ice crystals) and basal sliding. Ice sheets, when they existed over much of Canada, North America, and northern Europe, were up to 3–4 km thick and exerted enormous overburden pressures.

## 8.2 Glacial Processes and Landforms

**Erosional processes:** Glaciers abrade bedrock (producing **striations** that record former ice flow direction), pluck blocks from fractures (**quarrying**), and excavate basins. **U-shaped valleys**, **fjords**, **cirques**, **arêtes**, and **horns** are characteristic glacial erosional landforms.

**Depositional processes:** Glacial **till** is unstratified, poorly sorted sediment deposited directly from ice, ranging from clay to boulders. **Outwash** is stratified, sorted sand and gravel deposited by meltwater beyond the ice margin. **Varves** — paired silt/clay couplets deposited annually in glacial lakes — record time and post-glacial warming. **Drumlins**, **eskers**, **kames**, and **kettles** are depositional landforms with characteristic geometry that aids interpretation of former ice dynamics.

## 8.3 Quaternary Legacy in Canadian Engineering Geology

Canada's bedrock is largely mantled by Quaternary glacial and post-glacial sediments whose properties vary enormously across short distances. **Quick clays** — glaciomarine deposits that lose most of their strength upon disturbance — underlie parts of the St. Lawrence Lowlands and Ottawa Valley and have been responsible for catastrophic landslides (e.g., the 1971 Saint-Jean-Vianney slide). **Glacio-isostatic rebound** — the continuing rise of the crust following removal of ice load — alters relative sea level and drainage patterns. Residual horizontal stresses locked in by glacial loading can exceed overburden stress by a factor of three or more, complicating tunnel design and underground excavation.

---

# Chapter 9: Wind, Arid Processes, and Coastal Geomorphology

## 9.1 Aeolian Processes

Wind becomes an effective geomorphic agent wherever fine, dry sediment is exposed at the surface and vegetation is sparse — deserts, coastal dunes, periglacial outwash plains. **Saltation** — repeated short hops of sand-sized particles — accounts for most aeolian transport. Finer particles travel in **suspension**; coarser material moves by **creep** along the surface.

**Loess** — wind-deposited silt — blankets large areas of central North America, northern China, and Europe, often to depths of tens of metres. Loess is notable for its ability to stand in near-vertical faces when dry (due to capillary tension and slight cementation) but collapses rapidly upon wetting — a phenomenon called **collapse or hydroconsolidation** that poses hazards to foundations.

## 9.2 Coastal Processes

Wave energy drives sediment transport along coasts through **longshore drift**. Engineering structures — jetties, groins, breakwaters — interrupt this transport and must be designed with an understanding of the regional sediment budget. Coastal erosion and cliff retreat are accelerated where wave attack exploits weak bedding or joint sets in sea cliffs.

---

# Chapter 10: Applied Geology — Site Investigation and Geohazard Assessment

## 10.1 Site Investigation

A thorough site investigation integrates desk study (topographic and geologic maps, air photographs, remote sensing), surface mapping, and subsurface exploration. Subsurface methods include:

- **Borehole drilling** with core recovery (HQ, NQ core sizes) for detailed lithological and structural logging; RQD quantification.
- **Standard Penetration Test (SPT):** A split-spoon sampler is driven 450 mm by a standard hammer blow count (N-value). N-values correlate empirically with relative density, friction angle, and liquefaction susceptibility.
- **Cone Penetration Test (CPT):** Continuous measurement of tip resistance \(q_c\) and sleeve friction \(f_s\) provides quasi-continuous soil profiling. The normalized friction ratio \(F_r = f_s / q_c\) distinguishes soil type.
- **Field permeability tests:** Packer tests in rock, falling-head or constant-head tests in soil boreholes.

## 10.2 Geohazards

**Liquefaction** occurs in saturated, loose, granular soils subjected to earthquake shaking. Rapid increase in pore water pressure reduces effective stress to zero, causing the soil to behave temporarily as a viscous fluid. Empirical triggering charts based on cyclic stress ratio (CSR) and normalized SPT \(N\)-value define the boundary between liquefiable and non-liquefiable conditions.

**Seismic hazard** is quantified by probabilistic seismic hazard analysis (PSHA), which integrates the distribution of earthquake sources, recurrence rates, and ground-motion attenuation to estimate a hazard curve — the annual probability of exceeding a given peak ground acceleration. Canada's National Building Code prescribes design spectra based on the 2% probability of exceedance in 50 years hazard level.

**Permafrost** — ground remaining at or below 0 °C for at least two consecutive years — underlies approximately half of Canada's land area. Thaw of ice-rich permafrost causes **thermokarst** subsidence. Climate warming is accelerating permafrost degradation, increasing the risk to infrastructure in northern Canada.

## 10.3 Engineering Design in the Context of a Dynamic Earth

The fundamental tension in earth engineering is between the engineering requirement for predictable, stable ground and the geological reality of a continuously evolving system. Geological hazards are rarely random; they are structured by lithology, structure, climate, and process history. Effective practice requires engineers to read that history — from the orientation of foliation in a tunnel face to the geometry of ancient slide scarps on a proposed dam reservoir rim — and to design accordingly. Case histories, from foundation failures caused by undetected karst voids to dam failures triggered by fault reactivation, reinforce that geological characterization is not preliminary to engineering design but integral to it.
