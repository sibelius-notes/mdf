---
title: "CIVE 353: Geotechnical Engineering"
prof: ""
subjects: "CIVE"
---

# Soil Composition and Phase Relationships

## Soil Genesis and Engineering Significance

Soil in geotechnical engineering is not merely a material—it is a product of geologic history. The genesis of a soil dictates its structure, mineralogy, and engineering behaviour. Transported soils (alluvial, glacial, aeolian) tend to have different characteristics than residual soils formed in place by weathering of parent rock. Ice-age glaciation shaped much of southern Ontario's soil landscape, producing glacial tills, lacustrine clays, and outwash sands that geotechnical engineers encounter on nearly every project.

Unlike steel or concrete, soil exhibits three fundamental engineering characteristics that set it apart from structural materials:

1. **Heterogeneity**: A soil profile is almost never uniform. Layers of different composition, density, and stress history may exist within centimetres of each other.
2. **Non-linearity**: The stress–strain relationship is not proportional. Stiffness depends on stress level, stress history, and drainage conditions.
3. **Non-elasticity (inelasticity)**: Deformation under load is not fully recoverable. Permanent particle rearrangements occur, especially at particle contacts.

Soil is a **multi-phase system** composed of solid particles, water, and air. Engineering analysis requires accounting for all three phases simultaneously.

## The Phase Diagram

The fundamental bookkeeping tool is the phase diagram, which separates the soil volume into its three components:

- **Total volume**: \(V = V_s + V_v\), where \(V_s\) is the volume of solids and \(V_v\) is the volume of voids.
- **Void volume**: \(V_v = V_w + V_a\), where \(V_w\) is water volume and \(V_a\) is air volume.
- **Total weight**: \(W = W_s + W_w\) (air weight is negligible).

### Key Phase-Relationship Definitions

**Void ratio** (used extensively in consolidation and classification):
\[e = \frac{V_v}{V_s}\]
Void ratio ranges from about 0.35 (dense sand) to over 2.0 (soft clays).

**Porosity** (fraction of total volume that is void):
\[n = \frac{V_v}{V} = \frac{e}{1+e}\]

**Water content** (gravimetric, the standard measurement):
\[w = \frac{W_w}{W_s} \times 100\%\]

**Degree of saturation**:
\[S = \frac{V_w}{V_v} \times 100\%\]
\(S = 0\) for dry soil; \(S = 100\%\) for fully saturated soil.

**Specific gravity of solids**:
\[G_s = \frac{\rho_s}{\rho_w} \approx 2.65 \text{ for most minerals}\]

### Unit Weights

| Symbol | Name | Formula |
|--------|------|---------|
| \(\gamma\) | Bulk (total) unit weight | \(\dfrac{W}{V} = \dfrac{G_s + Se}{1+e}\,\gamma_w\) |
| \(\gamma_d\) | Dry unit weight | \(\dfrac{W_s}{V} = \dfrac{G_s}{1+e}\,\gamma_w\) |
| \(\gamma_{sat}\) | Saturated unit weight | \(\dfrac{G_s + e}{1+e}\,\gamma_w\) |
| \(\gamma'\) | Effective (submerged) unit weight | \(\gamma_{sat} - \gamma_w\) |

### The Critical Identity

A fundamental relationship linking the three phase parameters \(S\), \(e\), and \(G_s\):
\[S \cdot e = G_s \cdot w\]
For saturated soil (\(S = 1\)): \(e = G_s \cdot w\).

This identity is the most-used single equation in phase-relationship problems. From it and Darcy's unit weights, all other parameters can be derived.

### Practical Example: Compaction Cost

A classic application is comparing the cost of compacting soil to different void ratios. If a contractor must fill an excavation volume \(V_{fill}\) to a specified dry unit weight, the borrow volume required scales as \((1 + e_{borrow})/(1 + e_{final})\). Reducing void ratio from 1.2 to 0.6 nearly halves the borrow volume, illustrating that void ratio is an economic parameter as much as an engineering one.

---

# Soil Fabric and Particle Geometry

## Sphere Packing Models

The simplest model of soil structure is an assembly of equal-sized spheres. Three ideal packings bracket real behaviour:

**Simple Cubic Packing (SC)**: Spheres stacked directly above each other. This is the loosest regular packing.
\[e_{SC} = \frac{\pi/6}{1 - \pi/6} \approx 0.91\]
Each sphere touches 6 neighbours (coordination number = 6).

**Body-Centred Cubic Packing (BCC)**: One sphere in the centre of a cube, touching all 8 corner spheres. Coordination number = 8.
\[e_{BCC} \approx 0.471\]

**Face-Centred Cubic / Close Packing (FCC)**: The densest possible regular packing of equal spheres. Coordination number = 12.
\[e_{FCC} \approx 0.35\]

Real sands have void ratios between approximately 0.35 (very dense) and 0.91 (very loose), with natural deposits typically in the range 0.5–0.8.

## Specific Surface

The **specific surface** \(A_s\) is the total particle surface area per unit mass (m²/g). It governs the importance of surface chemistry:
\[A_s \propto \frac{1}{r}\]
for spheres of radius \(r\). As particle size decreases, specific surface increases dramatically. Clays have specific surfaces thousands of times larger than sands, which is why clay behaviour is dominated by physicochemical interactions rather than mechanical contact.

## Hertz and Mindlin Contact Theories

**Hertz contact** (elastic): When two spheres press together with normal force \(N\), the contact area and displacement are non-linear functions of \(N\). Specifically, displacement \(\delta \propto N^{2/3}\). This non-linearity means soil stiffness increases with confining stress even within the elastic range—soils get stiffer as they are loaded, a key departure from linear elastic materials.

**Mindlin contact** (with friction and slip): When a tangential force is applied alongside the normal force, partial slip occurs at the periphery of the contact zone. This slip is permanent and irreversible, even when the tangential force is removed. This is the micromechanical origin of soil inelasticity—the inability of soils to fully recover deformation is traceable to contact-level slip. The friction coefficient \(\mu\) at contacts relates to the macroscopic friction angle \(\phi'\) by \(\mu = \tan\phi'\).

---

# Grain Size Distribution and Classification

## Sieve Analysis

Grain size distribution is measured by passing dried soil through a series of sieves with progressively smaller openings. The percentage passing each sieve is plotted on a semi-log scale (grain diameter on the log axis) to produce the **gradation curve**.

Key diameters:
- \(D_{10}\): diameter at which 10% of the soil (by mass) is finer — the "effective size" controlling permeability
- \(D_{30}\): diameter at 30% finer
- \(D_{60}\): diameter at 60% finer

**Coefficient of Uniformity** (measure of grading range):
\[C_u = \frac{D_{60}}{D_{10}}\]
Well-graded soils: \(C_u \geq 6\) (gravels) or \(\geq 4\) (sands); poorly-graded (uniform): \(C_u < 4\).

**Coefficient of Curvature** (measure of gradation shape):
\[C_c = \frac{D_{30}^2}{D_{60} \cdot D_{10}}\]
Well-graded criteria require \(1 \leq C_c \leq 3\).

For fine-grained particles (silt and clay, \(<0.075\) mm), the **hydrometer test** uses settling velocity (Stokes' law) to infer particle size.

## USCS Classification

The Unified Soil Classification System (USCS) classifies soil by combining grain size information and plasticity:

- **Coarse-grained** (more than half retained on #200 sieve, \(0.075\) mm):
  - Gravel (G) vs Sand (S): split at #4 sieve (4.75 mm)
  - Sub-class: Well-graded (W) vs Poorly-graded (P)
- **Fine-grained** (more than half passing #200 sieve):
  - Silt (M) vs Clay (C): based on Plasticity Index and Liquid Limit (Casagrande A-line)
  - Low plasticity (L, \(LL < 50\)) vs High plasticity (H, \(LL \geq 50\))
- **Organic** (O) and Peat (Pt): identified by odour, colour, and high water contents

Classification requires: gradation data (grain size curve) + plasticity data (Atterberg limits for fine-grained soils).

---

# Clay Mineralogy and Fine-Soil Behaviour

## Clay Minerals

Clay minerals are phyllosilicates with sheet structures. The most important in geotechnical engineering are:

| Mineral | Specific Surface | Plasticity | Notes |
|---------|-----------------|-----------|-------|
| Kaolinite | ~15 m²/g | Low | Stable structure; China clay |
| Illite | ~80 m²/g | Moderate | Common in sedimentary deposits |
| Montmorillonite (smectite) | ~800 m²/g | Very high | Swells enormously; problematic |

## Diffuse Double Layer

Clay particles carry a net negative surface charge. Cations in the pore water are attracted to this surface, forming the **diffuse double layer (DDL)**: a high-concentration layer of cations decreasing exponentially with distance from the particle surface. The thickness of the DDL \(\kappa^{-1}\) depends on:
- Valence of the cation (higher valence compresses the DDL)
- Ion concentration (higher concentration compresses DDL)
- Dielectric constant of the fluid
- Temperature

The DDL governs flocculation vs dispersion of clay particles, the plastic behaviour of clays, and swelling potential of expansive clays like montmorillonite.

## Atterberg Limits

The Atterberg limits define transition water contents between different consistency states:

**Liquid Limit (LL)**: water content at which soil transitions from plastic to liquid behaviour (standardised by the Casagrande cup test or fall cone).

**Plastic Limit (PL)**: water content at which soil transitions from brittle/semi-solid to plastic behaviour (soil can no longer be rolled into a 3 mm thread without crumbling).

**Shrinkage Limit (SL)**: water content below which further drying does not cause further volume reduction.

**Plasticity Index**:
\[PI = LL - PL\]
A measure of the range of water contents over which the soil behaves plastically.

**Liquidity Index**: position of natural water content within the plastic range:
\[LI = \frac{w - PL}{PI}\]
\(LI > 1\): soil is above liquid limit (liquid state); \(LI = 0\): at plastic limit; \(LI < 0\): below plastic limit (brittle).

High-plasticity clays (e.g., montmorillonite-rich) have large PI and are prone to large volume changes with water content variation. Low-plasticity soils (kaolinite) are more stable.

---

# Compaction

## Principles of Compaction

Compaction is the mechanical process of increasing soil density by expelling air from the voids (at constant water content). It is distinct from consolidation, which expels water and is a time-dependent process.

The goal is to increase \(\gamma_d\) (dry unit weight) to improve strength, reduce compressibility, and reduce permeability.

## Proctor Compaction Test

The standard laboratory procedure applies a specified compaction energy to soil in a mould, at different water contents:

**Standard Proctor**: Energy = 600 kN·m/m³ (using 2.5 kg hammer, 305 mm drop, 3 layers in 944 cm³ mould).
**Modified Proctor**: Energy = 2700 kN·m/m³ (using 4.5 kg hammer, 457 mm drop, 5 layers).

For each water content, the dry unit weight is computed:
\[\gamma_d = \frac{\gamma}{1 + w}\]

When plotted, \(\gamma_d\) vs \(w\) produces a compaction curve with a distinct peak:
- **Optimum Water Content (OWC)**: water content at maximum dry unit weight
- **Maximum Dry Unit Weight** (\(\gamma_{d,max}\))

### Zero Air Voids (ZAV) Line

The theoretical maximum dry unit weight at any water content occurs when \(S = 100\%\) (no air voids):
\[\gamma_{d,ZAV} = \frac{G_s \gamma_w}{1 + G_s w}\]
The ZAV line plots to the right of the compaction curve. The compaction curve can never cross the ZAV line. Typical compaction curves reach 95–100% saturation at the peak.

### Effect of Compaction Energy

Higher compaction energy:
- Shifts the compaction curve **upward and to the left** (higher \(\gamma_{d,max}\) at lower OWC)
- Does not cross the ZAV line

### Dry vs. Wet of Optimum

**Dry of optimum**: soil has a more random (flocculated) fabric, higher strength, lower compressibility when wetted, but more susceptible to collapse on wetting.
**Wet of optimum**: soil has a more oriented (dispersed) fabric, lower permeability, higher flexibility, less susceptible to collapse.

## Field Compaction Control

In the field, compaction is specified as a percentage of the laboratory maximum dry unit weight (typically 95–100% of standard or modified Proctor maximum).

**Sand cone test**: A hole is excavated, the material weighed, then filled with calibrated sand. Volume from sand mass gives in-situ density.

**Nuclear density gauge**: Measures density by gamma-ray attenuation and water content by neutron scattering — fast but requires calibration and licensing.

---

# Seepage and Permeability

## Capillary Effects

Water in soil pores exists under negative pressure (suction) due to surface tension. The **capillary rise** in a tube of radius \(r\) is:
\[h_c = \frac{2T_s \cos\alpha}{\gamma_w r}\]
where \(T_s\) is surface tension (~0.073 N/m for water), \(\alpha\) is the contact angle. For soil, \(r\) is effectively the pore throat radius, which scales with \(D_{10}\). Fine-grained soils (small \(r\)) can support large negative pore pressures.

Negative pore pressure \(u = -\gamma_w h_c\) increases the effective stress \(\sigma' = \sigma - u\), meaning capillary action provides apparent cohesion (temporary cementation) in unsaturated fine sands.

## Darcy's Law

For laminar flow through a porous medium, the **discharge velocity** is proportional to the hydraulic gradient:
\[v = ki\]
where:
- \(v\) = discharge velocity (m/s), defined as flow per unit total area
- \(k\) = coefficient of permeability (m/s)
- \(i = \Delta h / L\) = hydraulic gradient (dimensionless)

The **seepage velocity** (actual pore fluid velocity) is larger:
\[v_s = \frac{v}{n}\]
since flow passes only through the void fraction \(n\).

**Hazen's empirical equation** (for clean sands, \(D_{10}\) in mm):
\[k \approx C_H (D_{10})^2\]
with \(C_H \approx 10^{-2}\) m/s when \(D_{10}\) is in mm.

Typical permeability ranges:
- Clean gravel: \(10^{-1}\)–\(10^{-2}\) m/s
- Clean sand: \(10^{-3}\)–\(10^{-5}\) m/s
- Silt: \(10^{-5}\)–\(10^{-8}\) m/s
- Clay: \(<10^{-8}\) m/s

## Laboratory Permeability Tests

**Constant-head permeameter**: Maintains a constant head difference across the sample. Flow \(Q\) is measured directly.
\[k = \frac{QL}{Aht}\]

**Falling-head permeameter**: Water level falls in a standpipe of area \(a\) as seepage occurs through the sample (area \(A\), length \(L\)).
\[k = \frac{aL}{At} \ln\frac{h_1}{h_2}\]
Preferred for low-permeability soils.

## One-Dimensional Flow: Equivalent Permeability

When flow is parallel to stratification (horizontal flow), each layer maintains the same gradient but carries different flow. The equivalent horizontal permeability is the weighted average:
\[k_{H,eq} = \frac{\sum k_i H_i}{\sum H_i}\]

When flow is perpendicular to stratification (vertical flow), continuity requires the same flow rate through each layer. The equivalent vertical permeability follows the harmonic mean (analogous to resistors in series):
\[k_{V,eq} = \frac{\sum H_i}{\sum (H_i/k_i)}\]

Note: \(k_{H,eq} \geq k_{V,eq}\) always. Real deposits are anisotropic, with horizontal permeability often 2–10× the vertical permeability.

## The Laplace Equation and Flow Nets

For steady, two-dimensional, isotropic seepage, the total head \(h\) satisfies:
\[\frac{\partial^2 h}{\partial x^2} + \frac{\partial^2 h}{\partial z^2} = 0\]

This is the Laplace equation. Its solution gives a family of **equipotential lines** (lines of constant \(h\)) and orthogonal **flow lines** that together form a **flow net**.

### Flow Net Construction Rules

1. Flow lines and equipotential lines must intersect at 90°.
2. The elements formed by the intersections should be as close to **curvilinear squares** as possible (length ≈ width).
3. The first and last flow lines are defined by the no-flow boundaries (e.g., impermeable walls, the base of the flow domain).
4. The first and last equipotential lines are where water enters and exits the flow domain.

### Flow Calculation from Flow Net

\[Q = k \cdot H_T \cdot \frac{N_f}{N_d}\]

where:
- \(H_T\) = total head difference (m)
- \(N_f\) = number of flow channels (count between adjacent flow lines)
- \(N_d\) = number of equipotential drops (count between adjacent equipotential lines)

The ratio \(N_f / N_d\) is a geometric property of the flow domain, independent of \(k\) and \(H_T\).

### Head Drop Per Equipotential

\[\Delta H = \frac{H_T}{N_d}\]

The total head at any point that has traversed \(n_d\) equipotential drops from the entry is:
\[h = h_{entry} - n_d \cdot \Delta H\]

## Uplift Pressure Under a Dam

A practical flow net application is computing the uplift pressure acting on the base of a dam from seeping water.

**Procedure**:
1. Construct the flow net for the seepage beneath the dam.
2. For each point of interest on the dam base, count the number of equipotential drops \(n_d\) from the upstream head.
3. Compute total head at the point: \(h_{total} = h_{upstream} - n_d \cdot \Delta H\)
4. Compute **pressure head**: \(h_p = h_{total} - z\), where \(z\) is the elevation of the point above the datum.
5. Convert to pore pressure: \(u = \gamma_w \cdot h_p\)
6. Integrate the pressure diagram along the base to get the total **uplift force** per unit width.

For example, with \(H_T = 6.5\) m and \(N_d = 15\) drops, each drop = 0.43 m of head. A point at 7.5 drops from upstream, with elevation 16 m above datum, has pressure head \(h_p = (25 - 7.5 \times 0.43) - 16 = 5.75\) m, giving \(u = 5.75 \times 9.81 = 56.4\) kPa. Integrating across the base of the dam yields the total uplift force, which for a typical dam problem is on the order of 969 kN/m.

---

# Effective Stress and Seepage Forces

## Terzaghi's Effective Stress Principle

The mechanical behaviour of soil (deformation, strength, failure) is controlled by **effective stresses**, not total stresses. The effective stress is:
\[\sigma' = \sigma - u\]
where \(u\) is the pore water pressure (positive for compression, i.e., positive gauge pressure).

Total stress \(\sigma\) is the average total force per unit area, including the contribution of water. It can be computed from the weight of soil and water above any plane. Effective stress is the portion carried through the soil skeleton via particle contacts — the stress that actually deforms and shears the soil.

### Example: Saturated Soil Profile

For a layer of saturated soil of height \(z\) with unit weight \(\gamma_{sat}\) and water table at the surface:
\[\sigma = \gamma_{sat} \cdot z\]
\[u = \gamma_w \cdot z\]
\[\sigma' = (\gamma_{sat} - \gamma_w) \cdot z = \gamma' \cdot z\]

Effective stress increases linearly with depth at rate \(\gamma' \approx 9\)–\(11\) kN/m³.

### Artesian Conditions

When a confined aquifer has a piezometric head above the point being considered (e.g., artesian conditions), the pore pressure is:
\[u = \gamma_w \cdot h_{piezo}\]
where \(h_{piezo}\) is the height of water in a piezometer above the point of interest. Artesian conditions reduce effective stress, potentially to zero or negative values.

## Seepage-Induced Pore Pressure

When water seeps through soil, the hydraulic gradient generates a **seepage body force** per unit volume:
\[j = i \gamma_w\] (seepage force per unit volume, in direction of flow)

For **downward seepage** (flow in the same direction as gravity), effective stresses increase.
For **upward seepage**, effective stresses decrease. If upward gradient \(i\) equals the **critical gradient**:
\[i_{cr} = \frac{\gamma'}{\gamma_w} = \frac{G_s - 1}{1 + e} \approx 1.0\]
the effective stress becomes zero — **quick condition** (hydraulic failure, also called "quicksand"). The soil loses all strength and behaves like a liquid.

### Factor of Safety Against Heave (Sheet Pile)

For a sheet pile with penetration depth \(d\) below the excavation level, the factor of safety against piping/heave on the passive side is:
\[FS = \frac{\gamma' d}{\gamma_w \cdot h_{exit} / N_d \cdot N_{d,exit}}\]
Practically, the exit gradient is read from the flow net at the point where flow re-enters the open excavation side. Exit gradient > \(i_{cr}\) means heave/piping failure. Codes require \(FS \geq 1.5\) to 2.0.

---

# Consolidation

## Concept of One-Dimensional Consolidation

When a saturated clay is loaded, the load is initially carried entirely by the pore water (undrained condition). Over time, water drains from the pores under the induced excess pore pressure gradient, and load transfers from the water to the soil skeleton (effective stress increases). This time-dependent process is **consolidation**.

Terzaghi's analogy: a piston with a spring and a small hole. The spring represents the soil skeleton; the cylinder is filled with water; the hole represents permeability. When a load is applied, the water pressure spikes, then gradually bleeds off as water escapes.

## Oedometer (Consolidation) Test

A thin disk of saturated soil (typically 25 mm thick, 76 mm diameter) is loaded in increments under one-dimensional conditions (no lateral strain), with drainage permitted from top and bottom faces. After each load increment, the settlement is recorded vs. log time until primary consolidation is complete. The specimen is then loaded again.

From the oedometer test, the **void ratio vs. log effective stress** relationship is established:
- The **compression (virgin) line**: straight on e–log \(\sigma'\) space, slope = \(C_c\)
- The **swelling/recompression line**: straight with smaller slope = \(C_s\) (or \(C_r\))

### Compression Index and Swelling Index

\[C_c = -\frac{\Delta e}{\Delta \log \sigma'_v} \quad \text{(slope of virgin consolidation line)}\]
\[C_s = C_r = -\frac{\Delta e}{\Delta \log \sigma'_v} \quad \text{(slope of swelling/recompression line)}\]
Typically \(C_s \approx C_c / 5\) to \(C_c / 10\).

### Preconsolidation Pressure

The preconsolidation pressure \(\sigma'_p\) (also written \(\sigma'_c\) or \(\sigma'_0\)) is the maximum past effective stress the soil has ever experienced. It marks the boundary between the recompression branch and the virgin compression branch.

**Casagrande graphical method** for determining \(\sigma'_p\) from the oedometer curve:
1. Identify the point of maximum curvature on the e–log \(\sigma'\) curve.
2. Draw a horizontal line and a tangent line at that point.
3. Bisect the angle between them.
4. Extend the straight portion of the virgin compression line until it intersects the bisector — that intersection is \(\sigma'_p\).

**Overconsolidation Ratio (OCR)**:
\[OCR = \frac{\sigma'_p}{\sigma'_{v0}}\]
where \(\sigma'_{v0}\) is the current effective vertical stress. OCR > 1 means overconsolidated (OC); OCR = 1 means normally consolidated (NC).

## Settlement Calculation

The total primary consolidation settlement of a clay layer of thickness \(H\) with initial void ratio \(e_0\) is:
\[S_c = \int_0^H \frac{\Delta e}{1 + e_0}\,dz\]

For an increment of effective stress \(\Delta\sigma'\):

**Overconsolidated (if \(\sigma'_{v0} + \Delta\sigma' \leq \sigma'_p\))**:
\[S_c = \frac{C_s H}{1+e_0} \log\frac{\sigma'_{v0} + \Delta\sigma'}{\sigma'_{v0}}\]

**Normally consolidated (if \(\sigma'_{v0} = \sigma'_p\))**:
\[S_c = \frac{C_c H}{1+e_0} \log\frac{\sigma'_{v0} + \Delta\sigma'}{\sigma'_{v0}}\]

**Crossing the preconsolidation pressure (OC→NC)**:
\[S_c = \frac{C_s H}{1+e_0} \log\frac{\sigma'_p}{\sigma'_{v0}} + \frac{C_c H}{1+e_0} \log\frac{\sigma'_{v0} + \Delta\sigma'}{\sigma'_p}\]

For multi-layer profiles, subdivide the clay layer into sublayers, assign appropriate \(e_0\) and \(\sigma'_p\) to each, and sum the incremental settlements.

### Heave from Load Removal

If effective stress is reduced (e.g., excavation), the soil swells along the recompression line, producing **heave**:
\[S_{heave} = \frac{C_s H}{1+e_0} \log\frac{\sigma'_{v0}}{\sigma'_{v0} - \Delta\sigma'_{removed}}\]

## Terzaghi's One-Dimensional Consolidation Theory

### Governing Differential Equation

Combining Darcy's law for flow out of an element with the volumetric compressibility relationship:
\[\frac{\partial u_e}{\partial t} = c_v \frac{\partial^2 u_e}{\partial z^2}\]
where:
- \(u_e\) = excess pore pressure (above hydrostatic)
- \(t\) = time
- \(z\) = depth measured from drainage boundary
- \(c_v\) = **coefficient of consolidation** = \(\dfrac{k}{m_v \gamma_w}\)
- \(m_v\) = coefficient of volume compressibility = \(-\dfrac{\Delta e / (1+e_0)}{\Delta \sigma'_v}\)

This is the 1D heat/diffusion equation. The rate of consolidation depends on:
- Permeability \(k\) (higher \(k\) → faster drainage → faster consolidation)
- Compressibility \(m_v\) (higher compressibility → more strain per pressure increment)
- Drainage path length \(d\) (most critical: \(c_v t / d^2\) governs)

### Degree of Consolidation

**Local degree of consolidation** at depth \(z\) and time \(t\):
\[U_z = 1 - \frac{u_e(z,t)}{u_{e,0}(z)}\]
where \(u_{e,0}(z)\) is the initial excess pore pressure at depth \(z\).

**Average degree of consolidation** (for computing settlement at time \(t\)):
\[U_{avg} = 1 - \frac{\int_0^{2d} u_e \,dz}{\int_0^{2d} u_{e,0} \,dz} = \frac{S(t)}{S_{final}}\]

### Time Factor

\[T_v = \frac{c_v t}{d^2}\]
where \(d\) is the length of the longest drainage path:
- Single drainage (one permeable boundary): \(d = H\)
- Double drainage (permeable boundaries top and bottom): \(d = H/2\)

**Approximate formulas**:

For \(U_{avg} \leq 60\%\) (\(T_v \leq 0.3\)):
\[T_v = \frac{\pi}{4} U_{avg}^2\]

For \(U_{avg} > 60\%\):
\[T_v = -0.933 \log(1 - U_{avg}) - 0.085\]

Using \(U = 0.6\) (60%) as the crossover point introduces less than 1.5% error and is acceptable for engineering practice.

## Determining \(c_v\) from Oedometer Data

### Log-Time Method (Casagrande)

1. Plot settlement (compression) vs. log time for one load increment.
2. The curve has an S-shape: initial compression, primary consolidation, then secondary compression.
3. Identify the **100% primary consolidation point** (\(d_{100}\)) at the intersection of the tangents to the inflection region and the secondary compression line.
4. Identify the **0% primary consolidation** (\(d_0\)) using the parabolic early-time relationship: find \(t_1\) and \(t_{4t_1} = 4t_1\), then \(d_0 = d(4t_1) - [d(4t_1) - d(t_1)]\).
5. The 50% consolidation point \(d_{50} = (d_0 + d_{100})/2\) occurs at time \(t_{50}\).
6. Then: \(c_v = 0.197 d^2 / t_{50}\)

### Root-Time Method (Taylor)

1. Plot settlement vs. \(\sqrt{t}\).
2. Fit a straight line to the initial linear portion.
3. Draw a second line with slope = 1.15 times the initial slope (15% steeper).
4. Intersection of this second line with the data gives \(t_{90}\) (90% consolidation).
5. Then: \(c_v = 0.848 d^2 / t_{90}\)

The root-time method is less ambiguous and is preferred in practice.

### Numerical (Finite Difference) Solution

For non-uniform initial excess pore pressure distributions (e.g., triangular, or complex boundary conditions), the consolidation equation is solved numerically using a finite difference scheme:
\[u_{i,j+1} = \beta u_{i-1,j} + (1-2\beta) u_{i,j} + \beta u_{i+1,j}\]
where \(\beta = c_v \Delta t / (\Delta z)^2\). For stability, \(\beta \leq 0.5\). This allows tracking the excess pore pressure profile at each time step, providing the full consolidation history.

Isochrones (profiles of excess pore pressure vs. depth at specific times) show how the pressure dissipation front progresses from drainage boundaries inward.

---

# Shear Strength

## Friction and the Mohr-Coulomb Criterion

Soils are **frictional materials**: their shear resistance increases linearly with normal stress. The fundamental relationship is:
\[\tau_f = c' + \sigma'_n \tan\phi'\]

where:
- \(\tau_f\) = shear stress at failure on a given plane
- \(c'\) = effective cohesion intercept (cementation, suction effects, or apparent cohesion from overconsolidation)
- \(\sigma'_n\) = effective normal stress on the failure plane
- \(\phi'\) = effective friction angle

The friction angle arises from the contact-level physics: at particle contacts, the ratio of tangential to normal force is limited by friction coefficient \(\mu = \tan\phi'\). For sands:
- Round particles: \(\phi' \approx 27\)–\(32°\)
- Angular particles: \(\phi' \approx 38\)–\(45°\)
- Clays: typically \(\phi' = 20\)–\(30°\), but undrained behaviour is often characterised by \(c_u\) alone

## Mohr Circle of Stress

At any point in a soil body, the state of stress on a plane at angle \(\theta\) from the principal plane is represented by a point on the **Mohr circle**:

- The circle's center is at \(\sigma_c = (\sigma_1 + \sigma_3)/2\) on the \(\sigma\) axis
- The radius is \(R = (\sigma_1 - \sigma_3)/2\)
- Normal and shear stresses on a plane inclined at angle \(\theta\) to the major principal plane are:
\[\sigma_n = \sigma_c + R \cos 2\theta\]
\[\tau = R \sin 2\theta\]

**Sign convention**: angles in the physical plane appear as doubled angles in the Mohr circle representation (a 90° physical angle becomes 180° in the circle).

### Pole (Origin of Planes) Method

The pole is a special point on the Mohr circle that enables graphical determination of stresses on any plane without algebra:

1. Plot two known stress states as points on the Mohr circle (typically stresses on two perpendicular planes).
2. Through either stress-state point, draw a line parallel to the plane on which those stresses act.
3. Where that line intersects the circle again is the **pole**.
4. To find stresses on any other plane: draw a line from the pole parallel to that plane; where it intersects the circle gives the \((\sigma_n, \tau)\) pair.

The pole is unique — both initial stress states should yield the same pole point.

### Principal Stresses and Failure Angle

The principal stresses \(\sigma_1\) and \(\sigma_3\) are where the Mohr circle crosses the \(\sigma\) axis (\(\tau = 0\)). The failure plane in a triaxial specimen is inclined at:
\[\alpha_f = 45° + \frac{\phi'}{2}\]
to the minor principal plane. For a frictionless material (\(\phi' = 0\)), failure occurs at 45°; for real soils, the failure plane tilts towards the major principal stress.

## The Failure Envelope

### Mohr-Coulomb Failure Envelope

As confining stress increases, the Mohr circle at failure grows larger. The line tangent to all such failure circles defines the **Mohr-Coulomb failure envelope**:
\[\tau_f = c' + \sigma'_n \tan\phi'\]
Any Mohr circle that touches this envelope represents a stress state at failure.

### Modified Failure Envelope (Cambridge \(p'\)–\(q\) Space)

An alternative representation uses the apex of each Mohr circle as the plotted point:
- \(\sigma_p' = (\sigma'_1 + \sigma'_3)/2\) (mean stress, or center of circle)
- \(R = (\sigma'_1 - \sigma'_3)/2\) (deviatoric stress / radius)

The line through all apex points (modified failure envelope) has intercept \(a'\) and inclination \(\alpha'\):
\[\sin\phi' = \tan\alpha', \quad c' \cos\phi' = a'\]
This representation is convenient when \(\sigma_1\) and \(\sigma_3\) are directly measured, as in triaxial tests.

## Factor of Safety

The ratio of strength to applied stress:
\[FS = \frac{R_{max}}{R_{applied}}\]
where \(R_{max}\) is the radius of the largest Mohr circle that just touches the failure envelope (at the current mean stress), and \(R_{applied}\) is the radius of the actual stress state. \(FS < 1\) means failure.

## Lateral Earth Pressure Coefficients

The ratio of horizontal to vertical effective stress depends on the strain condition of the soil:

**At-rest coefficient** (no lateral strain, \(\epsilon_x = 0\)):
\[K_0 = 1 - \sin\phi' \quad \text{(Jaky's empirical formula for NC soils)}\]
For OC soils: \(K_0 \approx (1-\sin\phi') \cdot OCR^{0.5}\)

**Active earth pressure** (wall moves away from soil, \(\epsilon_x < 0\), soil expands laterally):
\[K_A = \tan^2\!\left(45° - \frac{\phi'}{2}\right) = \frac{1-\sin\phi'}{1+\sin\phi'}\]
Also: \(\sigma'_{v} / \sigma'_{h,min} = K_A\) at active failure, or equivalently \(\sigma'_1/\sigma'_3 = 1/K_A\).

**Passive earth pressure** (wall pushes into soil, \(\epsilon_x > 0\)):
\[K_P = \tan^2\!\left(45° + \frac{\phi'}{2}\right) = \frac{1+\sin\phi'}{1-\sin\phi'} = \frac{1}{K_A}\]

Note: \(K_P \gg K_0 \gg K_A\) for a typical sand. For \(\phi' = 30°\): \(K_A = 1/3\), \(K_0 \approx 0.5\), \(K_P = 3\).

Deformation required to develop active condition (\(\approx H/1000\) for dense sand) is far less than that required for passive (\(\approx 2H/100\)), reflecting that mobilising passive resistance requires overcoming gravity.

## Laboratory Shear Tests

### Triaxial Test

The most versatile shear strength test. A cylindrical specimen is enclosed in a rubber membrane and subjected to all-around cell pressure \(\sigma_3\). A vertical deviatoric stress \(\sigma_d = \sigma_1 - \sigma_3\) is then applied until failure.

**Drainage conditions** define the type of test:

| Test | Phase 1 (consolidation) | Phase 2 (shearing) | Measures |
|------|------------------------|-------------------|----------|
| UU (Unconsolidated Undrained) | Valve closed | Valve closed | Total stress \(c_u\) |
| CU (Consolidated Undrained) | Valve open until \(\Delta u = 0\) | Valve closed | Total and effective \(c'\), \(\phi'\) |
| CD (Consolidated Drained) | Valve open | Valve open | Effective \(c'\), \(\phi'\) |

UU tests are used for rapid loading (earthquakes, quick fill on soft clay). CD tests give long-term strength for drained design. CU tests measure pore pressure during shearing and thus give both total and effective parameters.

**Back pressure** is applied inside the specimen to dissolve air bubbles and ensure full saturation. Skempton's B parameter verifies saturation:
\[B = \frac{\Delta u}{\Delta \sigma_3} \approx 1 \quad \text{for } S = 1\]

### Direct Simple Shear (DSS) Test

A soil sample is sheared horizontally at constant height. The imposed horizontal plane forces failure (removes the possibility of rotating principal stresses to the natural failure orientation). Compared to triaxial, the DSS test gives slightly lower strength due to the rotation of principal stresses during shear. Correction factors are applied to compare results.

### Direct Shear Test

A split box shears the specimen on a fixed horizontal plane. Despite its simplicity, the test imposes non-uniform stresses, and the failure plane is predetermined. Useful for quick index measurements.

## Stress–Strain Behaviour and Critical State

### Contractive and Dilative Soils

At a given effective stress level, there is a **critical void ratio** \(e_{cs}\) at which failure occurs without volume change. This defines the **Critical State Line (CSL)** in \(e\)–log\(\sigma'\) space.

**Loose soils** (\(e > e_{cs}\)): Particles rearrange to a denser structure during shearing — **contractive** behaviour. Under drained conditions, the soil compresses. Under undrained conditions, positive excess pore pressure develops, reducing effective stresses and hence strength. The stress–strain curve shows no peak (strain hardening).

**Dense soils** (\(e < e_{cs}\)): Particles must ride up over each other to deform — **dilative** behaviour. Under drained conditions, the soil expands. Under undrained conditions, negative excess pore pressure develops, increasing effective stresses and hence strength. The stress–strain curve shows a **peak** followed by post-peak softening back to the critical state (**strain softening**).

The peak (dilative) friction angle \(\phi'_{peak} > \phi'_{cs}\) (constant-volume friction angle).

### Sensitivity and Thixotropy of Clays

**Sensitivity** \(S_t\) characterises structure loss on remoulding:
\[S_t = \frac{c_{u,undisturbed}}{c_{u,remoulded}}\]

| Sensitivity range | Description |
|------------------|-------------|
| 1–4 | Normal sensitivity |
| 4–8 | Sensitive |
| 8–16 | Extra sensitive |
| \(>16\) | Quick clay |

Quick clays (e.g., Leda clay in the St. Lawrence valley) undergo catastrophic flow failure when disturbed. Their sensitivity arises from the salt-leaching of marine clays: the original flocculated (card-house) structure is maintained in a metastable state; disturbance collapses it irreversibly.

## Undrained Shear Strength of Clays

For short-term loading of saturated clays (time scale less than consolidation), the undrained shear strength \(c_u\) (also written \(S_u\)) controls behaviour. In a UU test:
\[c_u = \frac{\sigma_{1,failure} - \sigma_3}{2} = \frac{q_u}{2}\]
where \(q_u\) is the unconfined compressive strength (triaxial test with \(\sigma_3 = 0\)).

Clay consistency classifications (Canadian Foundation Manual):

| \(c_u\) (kPa) | Consistency |
|----------------|------------|
| 0–12 | Very soft |
| 12–25 | Soft |
| 25–50 | Firm (medium) |
| 50–100 | Stiff |
| 100–200 | Very stiff |
| \(>200\) | Hard (moraine) |

---

# In-Situ and Induced Stresses

## In-Situ Vertical Effective Stress

The vertical effective stress at any depth is computed by integrating the effective unit weight:
\[\sigma'_{v} = \sum \gamma'_i H_i\]
accounting for layers above and below the water table (using \(\gamma_{moist}\) above and \(\gamma'\) below). Artesian heads are accounted for by computing the pore pressure at each level from the piezometric head.

## In-Situ Horizontal Stress

\[\sigma'_{h} = K_0 \sigma'_{v}\]
For normally consolidated sands: \(K_0 = 1 - \sin\phi'\).
For overconsolidated clays, \(K_0\) can exceed 1.0.

## Induced Vertical Stress: Boussinesq Solutions

A surface load induces additional stresses in the underlying soil. These decay with depth and lateral distance. All solutions are for an elastic, isotropic, homogeneous, semi-infinite medium (Boussinesq assumptions).

### Point Load

\[\Delta\sigma_z = \frac{3Q z^3}{2\pi (r^2 + z^2)^{5/2}}\]
where \(Q\) = point load (kN), \(r\) = horizontal distance from load, \(z\) = depth. Stress decreases as \(1/z^2\) directly below the load.

### Line Load (per unit length \(q_L\))

The stress decays as \(1/z^2\) in the plane of interest. Used for long structures like railway embankments.

### Strip Foundation (uniform pressure \(q\), width \(B\))

\[\Delta\sigma_z = \frac{q}{\pi}(\alpha + \sin\alpha\cos(\alpha + 2\beta))\]
\[\Delta\sigma_x = \frac{q}{\pi}(\alpha - \sin\alpha\cos(\alpha + 2\beta))\]
\[\Delta\tau_{xz} = \frac{q}{\pi}\sin\alpha\sin(\alpha + 2\beta)\]
where \(\alpha\) is the angle subtended by the loaded width at the point of interest (in radians), and \(\beta\) is a signed angle following the right-hand rule from the vertical at the near edge.

### Circular Foundation

\[\Delta\sigma_z = q \left[1 - \left(\frac{1}{1+(B/2z)^2}\right)^{3/2}\right]\]
For the same applied pressure, a circular foundation of diameter \(B\) induces about 63% of the stress that an equivalent strip foundation induces at the same depth.

### Rectangular Foundation (influence factor method)

\[\Delta\sigma_z = q \cdot I_R(m, n)\]
where \(m = B/z\), \(n = L/z\). The influence factor \(I_R\) applies to the corner of the rectangle. For stress at the centre, superpose four quarter-rectangles. For points outside the foundation, use the superposition with imaginary negative areas.

### Depth of Influence

Stresses decay to 10% of the surface stress at approximately:
- Strip foundation: \(z \approx 6.3 B\)
- Square/circular: \(z \approx 2 B\)

This is the basis for the **depth of site investigation** rule: site investigations for settlement analysis must reach at least \(2B\) depth for a square foundation, and significantly deeper for strip foundations.

The Leaning Tower of Pisa was founded on a circular base of roughly 20 m diameter. The site investigation should have extended to \(\sim 40\) m, but at construction (medieval times), only the first sand layer at shallower depth was investigated — leading to the famous differential settlement.

## Total Applied Stresses and Factor of Safety

Once in-situ and induced stresses are computed, total stresses are:
\[\sigma_{v,total} = \sigma_{v,insitu} + \Delta\sigma_v\]
\[\sigma_{h,total} = \sigma_{h,insitu} + \Delta\sigma_h\]

The Mohr circle is drawn for the total stress state. For a principal stress state (zero shear, which occurs at the centre of a symmetric foundation), the factor of safety against failure is:
\[FS = \frac{R_{max}}{R_{applied}}\]
where \(R_{max}\) is computed from the Mohr-Coulomb parameters and the mean effective stress.

For a soil with \(c' = 0\) and \(\phi' = 36°\): if the applied stresses create a circle whose radius exceeds \(c \sin\phi'\), failure occurs. For a soil with significant cohesion (\(c' = 40\) kPa), the factor of safety improves dramatically. However, in practice, cohesive strength should be relied on only for short-term design (undrained conditions), since long-term drainage may reduce \(c'\) toward zero.

## Settlement: Immediate and Consolidation

Total settlement of a foundation:
\[S_{total} = S_i + S_c + S_{creep}\]

**Immediate settlement** \(S_i\): occurs rapidly as load is applied, predominantly elastic. For flexible and rigid foundations, settlement distributions differ:
- Flexible on clay: maximum at centre, minimum at edges
- Flexible on sand: minimum at centre, maximum at edges (due to greater confinement at centre increasing stiffness)
- Rigid foundation: uniform settlement, but stress distribution is non-uniform to enforce this

For clays (elastic approximation):
\[S_i = \frac{q B}{E_u}(1-\mu^2) I_s\]
where \(E_u\) is the undrained elastic modulus and \(I_s\) is an influence factor.

**Consolidation settlement** \(S_c\): time-dependent, dominates in clays.
**Creep**: secondary compression beyond primary consolidation, significant in highly organic soils and soft clays under high stress.

---

# Course Summary and Design Philosophy

## Two Pillars of Geotechnical Design

All geotechnical design addresses two questions:
1. **Strength**: Is the factor of safety against failure adequate? (\(FS \geq FS_{min}\), typically 1.5–3.0 depending on consequence and uncertainty)
2. **Deformation**: Does settlement or heave remain within tolerable limits? (\(S \leq S_{allowable}\))

Both limits are set by **codes** (in Canada, the National Building Code and Canadian Foundation Manual).

## Summary of Topics and Key Parameters

| Topic | Key Parameters | Key Tests |
|-------|---------------|-----------|
| Phase relationships | \(e\), \(n\), \(w\), \(S\), \(\gamma_d\), \(G_s\) | Moisture content, specific gravity |
| Classification | \(C_u\), \(C_c\), \(D_{10}\), LL, PL, PI | Sieve analysis, hydrometer, Atterberg limits |
| Compaction | \(\gamma_{d,max}\), OWC, \(C_c\) vs Modified/Standard | Proctor test, sand cone, nuclear gauge |
| Seepage | \(k\), \(i\), \(N_f\), \(N_d\) | Constant head, falling head permeameter |
| Effective stress | \(\sigma'\), \(u\), \(i_{cr}\) | Piezometers, field observation |
| Consolidation | \(C_c\), \(C_s\), \(\sigma'_p\), \(c_v\), \(m_v\), \(T_v\) | Oedometer test |
| Shear strength | \(c'\), \(\phi'\), \(c_u\), \(\phi'_{cs}\) | Triaxial, direct shear, DSS |
| In-situ stresses | \(K_0\), \(\sigma'_v\), \(\sigma'_h\) | Pressuremeter, vane shear |
| Induced stresses | \(\Delta\sigma_z\), \(I_R\), \(I_P\) | Computed from Boussinesq solutions |

## Examination Topics (CIVE 353 Final)

The final exam covers five major areas:
1. **Soil classification, phase relationships, and compaction** (12%)
2. **Seepage**: flow nets, flow calculation, uplift force, quick condition (18%)
3. **Consolidation**: how much settlement and how long (18%)
4. **Shear strength**: Mohr-Coulomb, lab data interpretation, failure envelope (18%)
5. **Effective and total stresses**: in-situ and induced stress calculation (18%)
Plus 10% theory questions (derivations and conceptual explanations).

Students are expected to be able to:
- Draw and interpret Mohr circles graphically using the pole method
- Apply Terzaghi consolidation theory to compute settlements and pore pressure dissipation
- Use the Boussinesq influence factor equations and tables for foundation stress calculations
- Interpret oedometer test data using the Casagrande and Taylor methods for \(c_v\)
- Classify soils using USCS and interpret grain size curves
- Compute effective stresses under various drainage and loading conditions

---

# Appendix: Important Equations Reference

## Phase Relationships
\[e = \frac{V_v}{V_s}, \quad n = \frac{e}{1+e}, \quad Se = G_s w, \quad \gamma_d = \frac{G_s \gamma_w}{1+e}\]

## Permeability and Seepage
\[v = ki, \quad Q = k H_T \frac{N_f}{N_d}, \quad i_{cr} = \frac{G_s - 1}{1+e} \approx 1.0\]

## Effective Stress
\[\sigma' = \sigma - u, \quad u = \gamma_w z_w \quad \text{(static)}\]

## Settlement
\[S_c = \frac{C_c H}{1+e_0}\log\frac{\sigma'_{v0} + \Delta\sigma'}{\sigma'_{v0}} \quad \text{(NC)}\]
\[T_v = \frac{c_v t}{d^2}, \quad c_v = \frac{k}{m_v \gamma_w}\]

## Shear Strength
\[\tau_f = c' + \sigma'_n \tan\phi', \quad \alpha_f = 45° + \frac{\phi'}{2}\]
\[K_A = \tan^2\!\left(45° - \frac{\phi'}{2}\right), \quad K_P = \tan^2\!\left(45° + \frac{\phi'}{2}\right), \quad K_0 = 1 - \sin\phi'\]

## Induced Stress (Strip Foundation)
\[\Delta\sigma_z = \frac{q}{\pi}(\alpha + \sin\alpha\cos(\alpha + 2\beta)) \quad \text{(\(\alpha\) in radians)}\]
