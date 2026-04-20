---
title: "SYDE 385: Material Properties"
subjects: "SYDE"
---

## Sources and References

- Callister and Rethwisch, <em>Materials Science and Engineering: An Introduction</em> (Wiley)
- Beer, Johnston, DeWolf, Mazurek, <em>Mechanics of Materials</em> (McGraw-Hill)
- Hibbeler, <em>Mechanics of Materials</em> (Pearson)
- Ashby, <em>Materials Selection in Mechanical Design</em> (Butterworth-Heinemann)
- Dowling, <em>Mechanical Behavior of Materials</em> (Pearson)

---

# Chapter 1: Structure-Property Relationships

## 1.1 Classes of Engineering Materials

Engineering materials fall into metals, ceramics, polymers, and composites. Each class has distinctive bonding, microstructure, and property patterns. Metals dominate structural use due to strength, stiffness, ductility, and formability. Ceramics offer hardness, heat resistance, and chemical stability. Polymers are lightweight, formable, and versatile. Composites combine two or more materials to achieve properties unattainable in either constituent alone.

## 1.2 Crystallinity and Amorphous Structure

Metals and many ceramics are crystalline: atoms sit on a periodic lattice with defects (vacancies, dislocations, grain boundaries). Polymers span crystalline-to-amorphous depending on chain regularity and processing. Amorphous solids such as glasses lack long-range order and instead soften gradually through a glass-transition range.

## 1.3 Semiconductors

Between conductors and insulators in conductivity, semiconductors such as silicon, germanium, and gallium arsenide have the tetrahedral diamond-cubic or zincblende structure. Their bonding is covalent with modest ionic contribution for III-V compounds. Intrinsic carrier density is

\[
n_i = \sqrt{N_c N_v}\,\exp\!\left(-\frac{E_g}{2 k_B T}\right).
\]

Doping introduces donor or acceptor levels close to the band edges, producing n-type or p-type materials. Electrical, optical, and thermal properties depend on band structure, doping, and crystal quality.

# Chapter 2: Stress, Strain, and Elasticity

## 2.1 Stress and Strain

Normal stress is force per unit area on a surface:

\[
\sigma = \frac{F}{A},
\]

and normal strain is fractional elongation:

\[
\varepsilon = \frac{\Delta L}{L_0}.
\]

Shear stress \( \tau \) and shear strain \( \gamma \) follow analogously. For small deformations and isotropic linear-elastic materials, Hooke's law gives

\[
\sigma = E \varepsilon, \qquad \tau = G \gamma,
\]

with Young's modulus \( E \), shear modulus \( G \), and Poisson's ratio \( \nu \) related by \( G = E/[2(1+\nu)] \).

## 2.2 Three-Dimensional Stress States

The stress tensor \( \sigma_{ij} \) has six independent components. Principal stresses are its eigenvalues; principal directions are the corresponding eigenvectors. Mohr's circle visualises two-dimensional stress state rotations. Failure criteria — maximum principal stress for brittle materials, von Mises for ductile — predict yielding under combined loading.

<div class="example">
A pressure vessel of radius 0.5 m, wall thickness 10 mm, under internal pressure 5 MPa experiences hoop stress \( \sigma_h = p r/t = 250 \) MPa and axial stress \( \sigma_a = p r/(2t) = 125 \) MPa; von Mises stress is \( \sqrt{250^{2}-250\cdot125+125^{2}} \approx 217 \) MPa.
</div>

# Chapter 3: Bars in Tension, Compression, and Torsion

## 3.1 Axial Loading

A prismatic bar of length \( L \), cross-sectional area \( A \), loaded axially by \( P \), elongates by

\[
\delta = \frac{P L}{A E}.
\]

Strain energy stored is \( U = P^{2}L/(2 A E) \). Thermal expansion adds \( \varepsilon_T = \alpha \Delta T \); constrained thermal expansion generates large stresses that rupture rails and pipelines if not relieved by expansion joints.

## 3.2 Torsion

A circular shaft of polar moment \( J = \pi r^{4}/2 \) twisted by torque \( T \) over length \( L \) rotates by

\[
\phi = \frac{T L}{G J},
\]

with shear stress at radius \( r \):

\[
\tau(r) = \frac{T r}{J}.
\]

Maximum shear stress occurs at the outer fibre. Hollow shafts use material more efficiently than solid ones for a given polar stiffness.

## 3.3 Compression and Buckling

Slender columns under compression fail by buckling before reaching yield. Euler's critical load for a pinned-pinned column of length \( L \) and second moment of area \( I \) is

\[
P_{cr} = \frac{\pi^{2} E I}{L^{2}}.
\]

Effective length accounts for end constraints: fixed-fixed halves \( L \), pinned-free doubles it. Slenderness ratio \( L/r \) distinguishes Euler from Johnson buckling regimes.

# Chapter 4: Bending

## 4.1 Shear-Force and Bending-Moment Diagrams

For a beam under transverse loading, shear \( V(x) \) and bending moment \( M(x) \) satisfy

\[
\frac{dV}{dx} = -w(x), \qquad \frac{dM}{dx} = V(x),
\]

with \( w(x) \) the distributed load. Concentrated loads cause jumps in \( V \); moments cause jumps in \( M \). Diagrams of \( V \) and \( M \) against position identify maximum stresses and deflection.

## 4.2 Bending Stress

Beam theory (Euler-Bernoulli) assumes plane sections remain plane. Normal stress distributed linearly from the neutral axis:

\[
\sigma = -\frac{M y}{I},
\]

with \( I \) the second moment of area about the bending axis. Maximum stress occurs at the extreme fibre \( y = c \): \( \sigma_{max} = M c/I \). Section modulus \( S = I/c \) quantifies bending efficiency per unit weight.

## 4.3 Deflection

Deflection \( v(x) \) satisfies the Euler-Bernoulli equation

\[
E I \frac{d^{2}v}{dx^{2}} = M(x).
\]

Integrating twice with boundary conditions yields deflection curves. Superposition combines effects of multiple loads. Stiffness and strength design criteria often pull in different directions; good beam design satisfies both.

<div class="remark">
Increasing beam depth \( h \) is by far the most efficient way to increase bending stiffness: \( I \sim h^{3} \) for rectangular sections. This is why floor joists are tall, narrow, and oriented edge-up.
</div>

# Chapter 5: Yielding, Fracture, and Fatigue

## 5.1 Yielding

The yield stress \( \sigma_y \) marks the transition from elastic to plastic behaviour. Plastic deformation involves dislocation motion in crystals and chain rearrangement in polymers. Strain-hardening raises effective yield as plastic strain accumulates, approximated by the Ramberg-Osgood relation

\[
\varepsilon = \frac{\sigma}{E} + K\!\left(\frac{\sigma}{E}\right)^{n}.
\]

Heat treatment, cold work, and alloying tune yield strength across orders of magnitude.

## 5.2 Fracture

Brittle materials fail at much lower stresses than predicted by atomic bond strength due to pre-existing flaws. Griffith's criterion gives the fracture stress for a crack of length \( 2a \) in a brittle solid as

\[
\sigma_f = \sqrt{\frac{2 E \gamma_s}{\pi a}},
\]

with \( \gamma_s \) the surface energy. Linear-elastic fracture mechanics generalises this using stress intensity factor \( K_I = Y \sigma \sqrt{\pi a} \) and fracture toughness \( K_{IC} \).

## 5.3 Fatigue

Cyclic loading below static yield can still cause failure through fatigue-crack nucleation and growth. The S-N curve relates stress amplitude \( S \) to cycles-to-failure \( N \); Basquin's law is

\[
S = \sigma_f^{\prime}(2N)^{b},
\]

with \( \sigma_f^{\prime} \) and \( b \) material parameters. Crack growth follows Paris's law

\[
\frac{da}{dN} = C(\Delta K)^{m}.
\]

Fatigue is the leading cause of unexpected mechanical failure; careful detailing of stress concentrations is central to design.

# Chapter 6: Materials Across the Classes

## 6.1 Metals

Steels (carbon, low-alloy, stainless, tool) dominate structural use due to strength, ductility, weldability, and cost. Aluminium alloys offer high strength-to-weight. Titanium excels in strength, corrosion, and biocompatibility at high cost. Copper and its alloys lead in electrical and thermal conductivity.

## 6.2 Polymers

Thermoplastics (HDPE, PP, PET, PC, nylon) melt and re-form; thermosets (epoxy, phenolic) cure irreversibly. Elastomers resist large, reversible deformation. Glass transition and crystallinity drive stiffness, strength, and thermal behaviour. Viscoelasticity — stress relaxation and creep — is more prominent in polymers than in metals and ceramics.

## 6.3 Ceramics and Glasses

Ceramics excel in hardness, compressive strength, and thermal/chemical stability. Brittle tensile behaviour limits use to compression, thermal barriers, and wear surfaces. Toughened ceramics (transformation-toughened zirconia, Si<sub>3</sub>N<sub>4</sub>) and ceramic-matrix composites extend application to turbines and ballistic armour.

## 6.4 Nanomaterials and Biomaterials

Nanomaterials — nanoparticles, nanowires, graphene, carbon nanotubes — exhibit high surface-to-volume ratios and quantum-size effects, enabling high-activity catalysts, high-modulus fibres, and tunable optoelectronic behaviour. Biomaterials (titanium implants, hydroxyapatite scaffolds, PLGA drug carriers) bridge engineering materials with biology, demanding biocompatibility, appropriate degradation, and mechanical matching.

## 6.5 Instability Under Combined Stresses

Structural elements face combined axial, torsional, and bending loads. Interaction equations (Euler-Johnson for beam-columns, AISC combined-load formulas) prevent designs that satisfy each load individually but fail under their combination. Stability analysis, fatigue checks, and fracture mechanics together form the checklist that separates safe designs from catastrophes.

<div class="theorem">
A sound structural design respects the full hierarchy of material behaviour: linear-elastic stiffness, yield onset, strain hardening, fracture toughness, fatigue endurance, and buckling stability. Each boundary is violated at the engineer's peril, and each corresponds to a distinct property that must be known and tested.
</div>
