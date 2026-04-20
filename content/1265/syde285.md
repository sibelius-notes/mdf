---
title: "SYDE 285: Materials Chemistry"
subjects: "SYDE"
---

## Sources and References

- Callister and Rethwisch, <em>Materials Science and Engineering: An Introduction</em> (Wiley)
- Shackelford, <em>Introduction to Materials Science for Engineers</em> (Pearson)
- Smith and Hashemi, <em>Foundations of Materials Science and Engineering</em> (McGraw-Hill)
- Askeland and Wright, <em>The Science and Engineering of Materials</em> (Cengage)
- Online: MIT OCW 3.091 Introduction to Solid-State Chemistry

---

# Chapter 1: Atomic Bonding

## 1.1 Primary Bonds

Materials properties originate in how atoms bond. <em>Ionic</em> bonds form between atoms of very different electronegativity by electron transfer (NaCl). <em>Covalent</em> bonds share electron pairs (Si, diamond). <em>Metallic</em> bonds pool valence electrons among many cores (Cu, Fe). Secondary interactions — van der Waals, hydrogen bonds — are weaker but account for many polymer and biomaterial properties.

Bond energies dictate melting points, elastic moduli, and thermal expansion. A modified Condon-Morse potential

\[
U(r) = -\frac{A}{r} + \frac{B}{r^{n}}
\]

gives equilibrium spacing \( r_0 \), bond energy, and spring constant \( k = d^{2}U/dr^{2}|_{r_0} \) that scales Young's modulus.

## 1.2 Electronegativity and Mixed Bonding

Few bonds are purely ionic or covalent. Pauling's electronegativity difference \( \Delta\chi \) sets the fraction of ionic character by \( 1 - \exp[-(\Delta\chi/2)^{2}] \). Semiconductors like GaAs are largely covalent with modest ionic contribution; oxides span the range from Al<sub>2</sub>O<sub>3</sub> (more ionic) to SiO<sub>2</sub> (more covalent).

# Chapter 2: Crystal Structures

## 2.1 Common Lattices

Metals most often adopt face-centred cubic (FCC), body-centred cubic (BCC), or hexagonal close-packed (HCP) structures. FCC has atomic packing factor 0.74, 12 nearest neighbours, and 4 atoms per unit cell. Miller indices (hkl) identify planes; directions are given in square brackets \left[uvw\right].

Interplanar spacing for a cubic lattice is

\[
d_{hkl} = \frac{a}{\sqrt{h^{2}+k^{2}+l^{2}}}.
\]

## 2.2 Ceramics and Semiconductors

Ionic crystals adopt structures (rock salt, fluorite, perovskite) that balance electrostatics with ionic radius ratio. Semiconductors often crystallise in diamond cubic (Si, Ge) or zincblende (GaAs), with tetrahedral coordination.

<div class="example">
For silicon, the lattice constant is 0.543 nm; the (111) planes have spacing 0.313 nm, which X-ray diffraction at 1.54 Å Cu K\(\alpha\) resolves as a peak at \( 2\theta = 28.4° \).
</div>

## 2.3 Polymorphism and Phase Diagrams

Many materials adopt different structures depending on temperature and pressure (iron: BCC → FCC at 912 °C; carbon: graphite, diamond, fullerenes). Phase diagrams map equilibrium phases against composition and temperature. The lever rule gives phase fractions in two-phase regions; eutectic, peritectic, and spinodal behaviours emerge from free-energy curves. Phase diagrams underlie alloy design — steels, aluminium alloys, solders.

# Chapter 3: Redox Chemistry and Electrochemistry

## 3.1 Oxidation States and Redox

Oxidation state tracks electron transfer in reactions. Balancing redox reactions uses half-reactions and conservation of charge and mass. The Gibbs free energy

\[
\Delta G = -n F E
\]

relates to cell voltage, predicting corrosion tendencies and battery chemistries.

## 3.2 Corrosion

Uniform corrosion, galvanic corrosion, crevice corrosion, pitting, stress-corrosion cracking, and high-temperature oxidation drive many material failures. Pourbaix diagrams map stability regions in pH-potential space. Protection strategies include cathodic protection (sacrificial anodes), anodic passivation (stainless steels), coatings, inhibitors, and design (avoiding crevices and galvanic couples).

# Chapter 4: Metals, Semiconductors, and Ceramics

## 4.1 Metals

Metals exhibit high electrical and thermal conductivity, metallic luster, and ductility because of delocalised valence electrons. Mechanical properties (yield strength, ultimate strength, ductility) tune via alloying, cold work, heat treatment, and grain refinement. The Hall-Petch relation

\[
\sigma_y = \sigma_0 + k_y d^{-1/2}
\]

predicts that finer grains \( d \) raise yield strength.

## 4.2 Semiconductors

Semiconductors have gaps small enough that thermal and optical excitation produce significant carrier populations. Intrinsic carrier concentration obeys

\[
n_i = \sqrt{N_c N_v}\,\exp\!\left(-\frac{E_g}{2 k_B T}\right).
\]

Doping shifts the Fermi level, enabling n-type and p-type materials whose junctions form diodes, transistors, and solar cells.

## 4.3 Ceramics

Ceramics are typically oxides, nitrides, or carbides with strong ionic-covalent bonding, giving high melting points, hardness, chemical inertness, and electrical insulation. Brittleness limits tensile use; ceramics excel in compression (bridges, bearings, cutting tools) and in thermal environments (turbine blades, heat-shields).

<div class="definition">
A <strong>glass</strong> is an amorphous solid lacking long-range periodic order; it exhibits a glass transition temperature \( T_g \) at which viscosity reaches about \( 10^{12} \) Pa·s.
</div>

# Chapter 5: Polymers and Biomaterials

## 5.1 Polymer Chemistry

Polymers are long-chain molecules formed by step-growth or chain-growth polymerisation. Molecular weight (number-average \( \bar{M}_n \), weight-average \( \bar{M}_w \)) and polydispersity \( \bar{M}_w/\bar{M}_n \) shape properties. Crystallinity, cross-linking, and side-group bulkiness tune mechanical and thermal behaviour.

Thermoplastics (PE, PP, PS, PET) soften on heating and are recyclable. Thermosets (epoxy, phenolic) cure irreversibly via cross-links. Elastomers (rubber, silicone) combine flexibility and resilience.

## 5.2 Nanomaterials

Materials with at least one nanoscale dimension exhibit properties distinct from bulk: quantum-confined semiconductors (quantum dots), high-surface-area catalysts, tunable plasmonic nanoparticles, and one-dimensional conductors (carbon nanotubes, graphene). Surface-to-volume ratio \( 3/r \) and quantum effects at de Broglie wavelengths drive these differences.

## 5.3 Biomaterials

Biomaterials interface with living tissue. Metals (titanium, stainless steel, Nitinol), ceramics (alumina, zirconia, hydroxyapatite), and polymers (PMMA, silicone, PLGA) serve as implants, scaffolds, and drug carriers. Biocompatibility demands attention to corrosion byproducts, mechanical matching (avoiding stress shielding), surface chemistry (cell adhesion), and degradation behaviour. Additive manufacturing enables patient-specific implants with tailored porosity and topology.

# Chapter 6: Processing and Property Design

## 6.1 Processing-Structure-Property-Performance

Materials design links processing (casting, rolling, heat treatment, sintering, polymerisation) to microstructure (grain size, phase distribution, defects) to properties (strength, stiffness, conductivity) to performance (service life, reliability). Engineering materials is therefore engineering processes as much as compositions.

<div class="example">
Quenching a eutectoid steel from the austenite field produces martensite — a supersaturated, body-centred-tetragonal phase hard and brittle — whereas slow cooling yields pearlite, softer but tougher. Tempering trades some hardness for ductility by diffusion of carbon and carbide precipitation.
</div>

## 6.2 Characterisation Techniques

Material characterisation spans X-ray diffraction (structure), electron microscopy (morphology), spectroscopies (composition, bonding), thermal analysis (DSC, TGA), and mechanical testing (tensile, hardness, fatigue). Each technique has a length scale, elemental sensitivity, and limitations. Triangulating among techniques is standard practice.

## 6.3 Sustainability Dimension

Materials decisions drive environmental impact: embodied energy, embodied carbon, recyclability, toxicity, supply chain security. Substitution of abundant elements for scarce ones (iron for cobalt, silicon for gallium), design for disassembly, and circular material flows are increasingly central. Life-cycle assessment quantifies trade-offs that intuitive choices would miss.

<div class="theorem">
Material properties derive from atomic-scale bonding and microstructure; processing controls microstructure; application requirements determine which properties matter. Engineering a material is engineering an integrated chain from atoms to service.
</div>

Materials chemistry underpins virtually every engineering discipline: semiconductors for nanoelectronics, polymers for biomedical devices, ceramics for energy systems, metals for infrastructure. A working engineer's fluency in the vocabulary of bonds, crystals, phase diagrams, and processing is a passport to informed design decisions across the product life cycle.
