---
title: "SYDE 586: Material Selection for Design"
subjects: "SYDE"
---

## Sources and References

- Ashby, <em>Materials Selection in Mechanical Design</em> (Butterworth-Heinemann)
- Ashby, Shercliff, Cebon, <em>Materials: Engineering, Science, Processing and Design</em> (Butterworth-Heinemann)
- Callister and Rethwisch, <em>Materials Science and Engineering: An Introduction</em> (Wiley)
- Farag, <em>Materials and Process Selection for Engineering Design</em> (CRC)
- Online: Granta Design EduPack resources, Cambridge Engineering Selector

---

# Chapter 1: The Material Selection Problem

## 1.1 Why Selection Matters

Every engineering design demands material choices that determine performance, cost, manufacturability, reliability, and environmental impact. The engineer has tens of thousands of candidate materials — metals, ceramics, polymers, composites, nanomaterials — with properties spanning many orders of magnitude. Systematic selection methods navigate this space efficiently and transparently.

## 1.2 The Design-Materials Interface

Material selection happens throughout design: concept (broad class), embodiment (specific family), detail (grade, supplier). Early decisions constrain later ones; late-stage material changes are expensive. A good process iterates between function, constraint, and material, expanding or narrowing the candidate set as requirements crystallise.

<div class="definition">
A <strong>material index</strong> is a combination of material properties that maximises (or minimises) for optimal performance under given function and constraint; classic examples include \( E^{1/2}/\rho \) for light stiff beams and \( \sigma_y^{2/3}/\rho \) for light strong beams.
</div>

# Chapter 2: Material Properties

## 2.1 Mechanical Properties

Mechanical properties include density \( \rho \), Young's modulus \( E \), shear modulus \( G \), Poisson's ratio \( \nu \), yield strength \( \sigma_y \), ultimate tensile strength \( \sigma_u \), ductility (elongation to failure), hardness, fracture toughness \( K_{IC} \), fatigue endurance, and creep resistance. Each property is relevant for particular failure modes and design regimes.

## 2.2 Thermal, Electrical, and Optical

Thermal properties — conductivity \( k \), specific heat \( c \), expansion coefficient \( \alpha \), melting point \( T_m \) — govern heat transfer and thermal stress. Electrical and magnetic properties — resistivity, dielectric constant, permeability, breakdown voltage — matter for electronic and electrical components. Optical properties — refractive index, absorption, transparency — are essential for photonics and displays.

## 2.3 Chemical and Environmental

Chemical resistance to acids, bases, solvents, and oxidation; biocompatibility; recyclability; embodied energy; and embodied carbon increasingly drive selection. Life-cycle perspectives consider impacts across extraction, processing, use, and end-of-life.

# Chapter 3: Ashby Material Selection Charts

## 3.1 Property Maps

Ashby charts plot one property against another on logarithmic axes. Materials cluster into envelopes — metals high on \( E \) and \( \rho \), polymers low on both, ceramics high on \( E \) with mid \( \rho \), foams and woods with intrinsic porosity. Trends (\( E \propto \rho \) within families) become visible. Charts reveal opportunity spaces — the empty upper-left or lower-right corners — that motivate new materials development (foams, metamaterials, composites).

## 3.2 Performance Indices

For a light, stiff beam of length \( L \) and square cross-section \( a \times a \) constrained to specified stiffness \( S \), mass is minimised when \( E^{1/2}/\rho \) is maximised. Derivation: bending stiffness \( S = C E I/L^{3} \) with \( I = a^{4}/12 \); mass \( m = a^{2} L \rho \); eliminating \( a \) gives \( m = (12 S/(CE))^{1/2} L^{5/2}\rho/E^{1/2} \), so \( M_1 = E^{1/2}/\rho \) is the material index to maximise.

Plotting an iso-index line on an \( E \)-\( \rho \) Ashby chart (a line of slope 2 on log-log) selects candidate materials that exceed a given performance threshold.

<div class="example">
A bicycle frame design must be light and stiff. Aluminium alloys (\( E \approx 70 \) GPa, \( \rho \approx 2700 \) kg/m<sup>3</sup>) give \( M_1 = 3.1 \) kPa<sup>1/2</sup>/kg·m<sup>-3</sup>; carbon-fibre composites (\( E \approx 150 \) GPa, \( \rho \approx 1600 \) kg/m<sup>3</sup>) give \( M_1 = 7.6 \), more than twice as good — explaining the shift of competitive cycling to CFRP.
</div>

## 3.3 Multiple Indices and Constraints

Real designs involve multiple functions, constraints, and objectives. Ashby's method sequences screening (hard constraints), ranking (primary objective's index), and trade-off (combining objectives, often via utility functions). Structured ranking prevents intuitive but suboptimal defaults.

# Chapter 4: Failure Analysis in Selection

## 4.1 Failure Modes

Materials can fail by yielding, fracture, fatigue, creep, buckling, wear, corrosion, or environmental cracking. Selection must address the dominant failure modes for the application. A pressure vessel requires fracture toughness plus yield strength plus corrosion resistance; a turbine blade requires creep strength, thermal fatigue resistance, and oxidation resistance.

## 4.2 Safety Factors and Statistical Design

Material property data are statistical. Design values use safety factors or statistical percentiles (e.g., A-basis allowable, 99% of population at 95% confidence). Probabilistic design formalises this by propagating distributions of load and strength through failure models.

## 4.3 Fracture Control

For brittle or fracture-critical applications, selection uses fracture toughness indices like \( K_{IC}/\sigma_y \) (tolerable crack size) or \( K_{IC}/E \) (energy absorption). Flaw-tolerant design, leak-before-break vessels, and damage-tolerant aircraft structures are materials-selection outcomes as much as structural design ones.

# Chapter 5: Manufacturing and Processing

## 5.1 Process Selection

Manufacturing processes — casting, forging, machining, sheet metalworking, powder metallurgy, injection moulding, composite layup, additive manufacturing — impose their own constraints. Each process has its own material compatibility, geometric capability, surface finish, minimum feature size, tolerance, and economic batch size.

## 5.2 Process-Material-Shape

Ashby's process selection charts map processes by what materials they can handle, what shapes they can produce, and at what cost-per-part vs batch size. Cost components — material, labour, equipment, tooling — scale differently; injection moulding's high tooling cost spreads across large runs, while additive manufacturing's near-zero tooling favours small batches.

## 5.3 Structure-Property Consequences

Processing alters microstructure and thus properties. Heat treatment tunes phase distribution; cold working raises strength at the cost of ductility; welding introduces heat-affected zones; additive manufacturing leaves characteristic porosity and anisotropy. Good selection accounts for as-processed properties, not idealised handbook values.

<div class="remark">
A material that looks perfect in the catalogue may be unselectable if no manufacturer can shape it economically at your scale, or if its performance after your process differs from the datasheet values.
</div>

# Chapter 6: Economics, Environment, and Case Studies

## 6.1 Cost Modelling

Part cost includes material, processing, tooling, and overhead contributions. For a simple injection-moulded part:

\[
C_{part} = \frac{C_{tool}}{N} + C_{material} + \frac{C_{press}\,t_{cycle}}{N_{parts/hour}\,1},
\]

with the tooling cost amortised over production volume \( N \). Material cost dominates for commodity parts; tooling dominates for small runs; energy dominates for refractories and extremes.

## 6.2 Environmental Impact

Selection increasingly weighs environmental impact. Embodied energy per kg ranges from ~10 MJ for concrete to ~200 MJ for aluminium to ~1000 MJ for titanium; CO<sub>2</sub> footprints scale similarly. Selecting lower-impact materials, reducing material mass, designing for disassembly and recycling, and using recycled feedstock close the material loop. Life-cycle assessment quantifies impacts across stages.

## 6.3 Case Studies: General Engineering

A bicycle frame — light, stiff, strong, affordable — selects across aluminium, steel, titanium, CFRP depending on performance target and price point. A turbine blade — creep-resistant at 1000 °C, oxidation-resistant, fatigue-resistant — narrows to nickel superalloys with single-crystal processing and ceramic coatings. A spacecraft cryogenic tank — strong at 20 K, light, weldable, insulating — selects among aluminium-lithium alloys, stainless steels, or composites.

## 6.4 Biomedical Applications

Implant materials must combine biocompatibility, appropriate mechanical matching, corrosion resistance, and, sometimes, controlled degradation. Hip implants use Ti-6Al-4V or CoCrMo alloy stems with UHMWPE or ceramic bearings. Orthopedic fixation uses stainless steel or degradable magnesium alloys. Scaffolds for tissue engineering use porous PLGA, hydroxyapatite, or hydrogels tuned to cellular interaction and dissolution rate.

## 6.5 Life Cycle and Selection Decision

Closing the loop, material selection assesses each candidate across the full life cycle: cradle-to-gate extraction and processing impacts, service-life performance and maintenance, end-of-life recovery and disposal. Circular-economy thinking — design for disassembly, repairable joints, mono-material construction — changes early selection decisions in ways traditional performance-and-cost optimisation misses.

<div class="example">
A consumer electronics casing optimised only for stiffness and cost might select a glass-filled composite. Reassessing with end-of-life considerations might favour a single-material aluminium casing that is recyclable, even at slightly higher initial cost and weight — because the lifetime-integrated impact and customer perception favour the alternative.
</div>

<div class="theorem">
Engineering material selection integrates performance indices, failure analysis, manufacturing constraints, cost economics, and environmental impact through the full life cycle; systematic methods (Ashby charts, multi-criteria ranking, life-cycle assessment) make selection decisions transparent, defensible, and revisable as requirements evolve.
</div>

The course equips students to select materials and processes for design problems across general and biomedical engineering with rigor and attention to sustainability — core competencies for modern product design and systems engineering practice.
