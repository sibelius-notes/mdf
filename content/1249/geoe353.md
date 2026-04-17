---
title: "Geotechnical Engineering 1"
prof: "Shunde Yin"
subjects: "GEOE"
---

## Sources and References

- Craig, R.F. and Knappett, J.A. *Craig's Soil Mechanics*, 9th ed. CRC Press. (Course recommended text)
- Das, B.M. *Principles of Geotechnical Engineering*, 9th ed. Cengage Learning.
- Coduto, D.P., Yeung, M.R., and Kitch, W.A. *Geotechnical Engineering: Principles and Practices*, 2nd ed. Pearson.
- Holtz, R.D., Kovacs, W.D., and Sheahan, T.C. *An Introduction to Geotechnical Engineering*, 3rd ed. Pearson.
- MIT OpenCourseWare 1.322 — Soil Behavior.

---

# Chapter 1: Introduction — Stress, Strain, and Strength in Soils

## 1.1 The Role of Geotechnical Engineering

Geotechnical engineering is concerned with the behavior of earth materials — principally soils and soft rocks — as they are encountered in civil and geological engineering practice. Every structure rests on or in the ground, and the soil beneath it must be understood in terms of its strength, deformability, and permeability before rational design of foundations, embankments, retaining walls, or excavations can proceed.

Soil differs from most structural materials in two fundamental respects. First, soil is a particulate, multiphase material composed of mineral grains, water, and gas; its mechanical response is therefore intimately connected to the arrangement and interaction of discrete particles rather than to the properties of a homogeneous continuum. Second, the engineering properties of a soil deposit depend heavily on its geologic history — the processes by which the material was originally formed, transported, deposited, and subsequently loaded or unloaded.

## 1.2 Stress and Strain Concepts Applied to Soils

The classical stress tensor applies to soil as a continuum approximation at engineering scales. Normal and shear stresses act on any plane through a soil mass, and the principal stress directions are those on which shear stresses vanish. For a two-dimensional problem, the principal stresses \(\sigma_1\) and \(\sigma_3\) are obtained from

\[
\sigma_{1,3} = \frac{\sigma_x + \sigma_z}{2} \pm \sqrt{\left(\frac{\sigma_x - \sigma_z}{2}\right)^2 + \tau_{xz}^2}
\]

The Mohr circle provides a graphical construction for rotating stress axes and identifying failure planes.

Strain in soil is decomposed into volumetric and deviatoric components. Volumetric strain reflects the compression or dilation of the pore space, while deviatoric strain is associated with distortion at constant volume. Because the compressibility of soil skeletons is often orders of magnitude larger than that of water or mineral grains under confined conditions, volume change in saturated soils is controlled by the expulsion or absorption of pore water — the consolidation process.

## 1.3 Strength Criteria

The most widely used strength criterion for soils is the Mohr–Coulomb failure envelope:

\[
\tau_f = c' + \sigma'_n \tan\phi'
\]

where \(\tau_f\) is the shear stress at failure on the failure plane, \(c'\) is the effective cohesion intercept, \(\sigma'_n\) is the effective normal stress on the failure plane, and \(\phi'\) is the effective friction angle. The primes denote quantities expressed in terms of effective stress (total stress minus pore-water pressure), which is the governing stress variable for strength and volume change in both drained and undrained soil behavior.

Cohesion in the Mohr–Coulomb sense arises from cementation, interparticle attraction in clay minerals, or apparent cohesion due to capillary suction in partially saturated soils. True frictional resistance reflects grain interlocking and particle-scale contact forces; it is present in all soil types but dominates in granular materials.

---

# Chapter 2: Characteristics of Soil

## 2.1 Geologic Origins

Soils are formed by the physical and chemical weathering of parent rock. Residual soils remain at the site of weathering; transported soils are moved from their origin by gravity, water, wind, or ice and deposited elsewhere. The mode of transport and deposition strongly influences particle size distribution, structure, and engineering properties.

Glacial deposits (tills, varved clays, outwash sands and gravels) are particularly relevant in southern Ontario and across Canada. Lacustrine and marine clays deposited in post-glacial seas or lakes are frequently soft, compressible, and sensitive — properties that have significant implications for foundation engineering.

## 2.2 Soil Composition and Mineralogy

Coarse-grained soils (gravel and sand) consist predominantly of quartz, feldspar, and rock fragments. Their behavior is controlled by particle size, shape, and gradation rather than mineralogy. Fine-grained soils (silt and clay) include phyllosilicate clay minerals — kaolinite, illite, smectite (montmorillonite) — whose platy morphology and electrical surface charges govern plasticity, permeability, and compressibility.

Smectite clays exhibit very high specific surface areas (up to ~800 m²/g) and large cation exchange capacities, making them highly plastic, expansive, and compressible. Kaolinite has the lowest activity among common clay minerals and displays relatively modest plasticity and swelling potential.

## 2.3 Phase Relationships and Weight–Volume Parameters

A soil mass consists of three phases: solid mineral grains, liquid water (assumed incompressible), and gas (air or vapor). Fundamental volumetric ratios are defined as follows.

The **void ratio** \(e\) is the ratio of the volume of voids to the volume of solids:

\[
e = \frac{V_v}{V_s}
\]

The **porosity** \(n\) is the ratio of void volume to total volume:

\[
n = \frac{V_v}{V} = \frac{e}{1+e}
\]

The **degree of saturation** \(S_r\) expresses the fraction of voids occupied by water:

\[
S_r = \frac{V_w}{V_v}
\]

Gravimetric relationships include the **water content** (moisture content) \(w\):

\[
w = \frac{M_w}{M_s}
\]

and the **specific gravity of solids** \(G_s\), which for most mineral soils lies between 2.60 and 2.80 (commonly taken as 2.65 for quartz-dominated materials). These quantities are linked by the phase relation:

\[
S_r \cdot e = G_s \cdot w
\]

which holds at all degrees of saturation. Unit weights of practical importance include the bulk unit weight \(\gamma\), the saturated unit weight \(\gamma_{sat}\), the dry unit weight \(\gamma_d\), and the buoyant (submerged) unit weight \(\gamma' = \gamma_{sat} - \gamma_w\), where \(\gamma_w \approx 9.81\) kN/m³.

## 2.4 Atterberg Limits and Plasticity

The consistency of fine-grained soils varies with water content. Atterberg limits define the water contents at which soil transitions between behavioral states:

- **Liquid limit** (\(w_L\)): the water content below which the soil behaves plastically rather than as a viscous liquid.
- **Plastic limit** (\(w_P\)): the water content below which the soil becomes too stiff to be remolded without cracking.
- **Plasticity index**: \(I_P = w_L - w_P\).
- **Liquidity index**: \(I_L = (w - w_P)/I_P\), which locates the in-situ water content within the plastic range.

The **activity** \(A = I_P / (\text{clay fraction})_{\%}\) reflects the contribution of clay mineralogy to plasticity and is used to identify clay mineral type and swelling potential.

## 2.5 Grain Size Distribution and Soil Classification

Sieve analysis separates coarse-grained soils into size fractions; hydrometer (sedimentation) analysis extends the gradation curve into the silt and clay range. Key descriptors include the coefficient of uniformity \(C_u = D_{60}/D_{10}\) and the coefficient of curvature \(C_c = D_{30}^2/(D_{10} \cdot D_{60})\). A well-graded sand has \(C_u \geq 6\) and \(1 \leq C_c \leq 3\); a well-graded gravel requires \(C_u \geq 4\).

The Unified Soil Classification System (USCS) classifies soils using a two-letter symbol. Major group symbols are G (gravel), S (sand), M (silt), C (clay), O (organic), and Pt (peat). Modifier symbols W (well-graded), P (poorly graded), L (low plasticity), and H (high plasticity) complete the classification. The Casagrande plasticity chart is used to classify fine-grained and dual-symbol soils.

## 2.6 Compaction

Compaction is the densification of soil by expulsion of air at constant water content. The standard Proctor test (ASTM D698) and modified Proctor test (ASTM D1557, 4.5 times the compactive energy) define the compaction curve relating dry unit weight to water content. The peak of this curve defines the **optimum water content** \(w_{opt}\) and the **maximum dry unit weight** \(\gamma_{d,max}\).

At water contents below optimum, clay particles are flocculated and the fabric is open; above optimum, the fabric becomes dispersed and the soil is more compressible and less permeable. Field compaction control specifies a minimum relative compaction, typically 95–98% of laboratory maximum dry unit weight.

---

# Chapter 3: Seepage in Soil

## 3.1 Darcy's Law

Groundwater flow through saturated porous media is governed by Darcy's law:

\[
v = k \, i
\]

where \(v\) is the superficial (Darcy) velocity, \(k\) is the hydraulic conductivity (coefficient of permeability), and \(i = \Delta h / L\) is the hydraulic gradient. The hydraulic conductivity depends on both fluid properties (viscosity, density) and pore geometry. For a clean sand, \(k\) ranges from \(10^{-5}\) to \(10^{-2}\) m/s; for a clay, \(k\) may be as low as \(10^{-11}\) m/s.

Hydraulic conductivity is measured in the laboratory by the constant-head test (suitable for granular soils) and the falling-head test (suitable for fine-grained soils):

\[
k = \frac{aL}{At_1} \ln\left(\frac{h_1}{h_2}\right) \quad \text{(falling-head)}
\]

where \(a\) is the standpipe area, \(A\) is the sample cross-section, \(L\) is the specimen length, and \(h_1\), \(h_2\) are initial and final heads.

## 3.2 Flow Nets

Two-dimensional steady seepage under or around structures is analyzed using flow nets — orthogonal families of flow lines and equipotential lines. For an isotropic soil:

\[
q = k H \frac{N_f}{N_d}
\]

where \(q\) is seepage per unit width, \(H\) is the total head difference, \(N_f\) is the number of flow channels, and \(N_d\) is the number of equipotential drops. For anisotropic soils with \(k_x \neq k_z\), the transformed section method replaces the horizontal scale by \(x' = x\sqrt{k_z/k_x}\), and the effective conductivity is \(k_{eff} = \sqrt{k_x k_z}\).

## 3.3 Piping and Heave

Upward seepage reduces the effective stress in soil. When the upward seepage force equals the submerged weight of the soil, the effective stress reaches zero — a condition termed **hydraulic failure** or quicksand. The critical hydraulic gradient is:

\[
i_{cr} = \frac{G_s - 1}{1 + e} = \frac{\gamma'}{\gamma_w}
\]

For most soils, \(i_{cr} \approx 1.0\). The factor of safety against piping is \(F = i_{cr}/i_{exit}\), where \(i_{exit}\) is the exit gradient on the downstream face of the structure.

---

# Chapter 4: Effective Stress in Soil

## 4.1 Terzaghi's Effective Stress Principle

The most fundamental principle in soil mechanics was formulated by Karl Terzaghi in 1925. For a saturated soil, the total stress \(\sigma\) at any point is shared between the pore-water pressure \(u\) and the effective stress \(\sigma'\):

\[
\sigma' = \sigma - u
\]

The effective stress governs all mechanical behavior — strength, compressibility, and volume change — because it acts through the intergranular contact network. The pore-water pressure, being hydrostatic within a connected pore system, transmits force equally in all directions and does not contribute to shear resistance.

## 4.2 Hydrostatic and Steady-Seepage Conditions

Under hydrostatic conditions with the water table at depth \(d_w\) below the surface, pore-water pressure at depth \(z > d_w\) is:

\[
u = \gamma_w (z - d_w)
\]

and the vertical effective stress is:

\[
\sigma'_v = \gamma z - u
\]

For a soil profile with the water table at the surface, \(\sigma'_v = \gamma' z\). Under steady upward or downward seepage, the pore pressure is modified by the seepage-induced head:

\[
u = \gamma_w h_w \pm \gamma_w i z
\]

where the sign depends on whether seepage is upward (increasing \(u\)) or downward (decreasing \(u\)).

## 4.3 Capillary Effects

Above the water table, water is held in tension by surface tension forces. Capillary suction generates negative pore-water pressures, which increase the effective stress and temporarily stiffen fine-grained soils. The approximate height of capillary rise is:

\[
h_c \approx \frac{C}{e \cdot D_{10}}
\]

where \(C\) is an empirical constant (~10–50 mm²), \(e\) is the void ratio, and \(D_{10}\) is the effective grain diameter. Capillary pressures can be significant in silts and fine sands but are negligible in gravels and lost upon wetting in clays.

---

# Chapter 5: Consolidation of Soil

## 5.1 Compressibility of Fine-Grained Soils

When a saturated fine-grained soil is loaded, the initial load increment is carried entirely by excess pore-water pressure because drainage cannot occur instantaneously. Over time, water drains from the pores, excess pressures dissipate, effective stress increases, and the soil skeleton compresses. This time-dependent volume change is **primary consolidation**.

The one-dimensional compressibility of a soil is characterized by the **compression index** \(C_c\) on a \(e\) versus \(\log\sigma'_v\) plot:

\[
C_c = \frac{\Delta e}{\log(\sigma'_{v2}/\sigma'_{v1})}
\]

The **recompression index** (swelling index) \(C_s\) (or \(C_r\)) governs recompression of overconsolidated soil; typically \(C_s \approx C_c/5\) to \(C_c/10\).

The **coefficient of volume compressibility** \(m_v\) relates volumetric strain to effective stress change:

\[
m_v = \frac{\Delta\varepsilon_v}{\Delta\sigma'_v} = \frac{a_v}{1+e_0}
\]

where \(a_v = -\Delta e / \Delta\sigma'_v\) is the coefficient of compressibility.

## 5.2 Settlement Calculation

The primary consolidation settlement of a layer of thickness \(H\) under a stress increment \(\Delta\sigma'_v\) is:

For a normally consolidated clay (\(\sigma'_{v0} = \sigma'_p\)):

\[
s_c = \frac{C_c H}{1+e_0} \log\left(\frac{\sigma'_{v0} + \Delta\sigma'_v}{\sigma'_{v0}}\right)
\]

For an overconsolidated clay where the final stress does not exceed the preconsolidation pressure \(\sigma'_p\):

\[
s_c = \frac{C_s H}{1+e_0} \log\left(\frac{\sigma'_{v0} + \Delta\sigma'_v}{\sigma'_{v0}}\right)
\]

The **preconsolidation pressure** \(\sigma'_p\) is the maximum past effective stress experienced by the soil. The **overconsolidation ratio** (OCR) is \(\sigma'_p / \sigma'_{v0}\). Normally consolidated soils have OCR = 1; lightly to heavily overconsolidated soils have OCR > 1 and are significantly stiffer on reloading.

## 5.3 Terzaghi's Theory of One-Dimensional Consolidation

Terzaghi's 1-D consolidation theory models excess pore pressure \(u_e\) dissipation as a parabolic partial differential equation:

\[
c_v \frac{\partial^2 u_e}{\partial z^2} = \frac{\partial u_e}{\partial t}
\]

The **coefficient of consolidation** is:

\[
c_v = \frac{k}{\gamma_w m_v}
\]

The dimensionless time factor \(T_v = c_v t / H_{dr}^2\), where \(H_{dr}\) is the maximum drainage path (half the layer thickness for double drainage), governs the degree of consolidation. The average degree of consolidation \(U\) is plotted against \(T_v\); approximate relationships include:

For \(U \leq 60\%\):

\[
T_v \approx \frac{\pi}{4} U^2
\]

For \(U > 60\%\):

\[
T_v \approx 1.781 - 0.933\log(100 - U\%)
\]

## 5.4 Secondary Compression

After excess pore pressures have dissipated, soil continues to deform at constant effective stress due to time-dependent rearrangement of the soil skeleton — **secondary compression** or creep. It is characterized by the **secondary compression index** \(C_\alpha\):

\[
\Delta e = -C_\alpha \log\left(\frac{t_2}{t_1}\right)
\]

Secondary compression is most significant in organic soils, soft clays, and peats, where \(C_\alpha/C_c\) is high (0.05–0.10 for peats versus 0.004–0.007 for inorganic clays).

---

# Chapter 6: Shear Strength of Soil

## 6.1 Fundamental Concepts

Shear strength is the maximum shear stress a soil can sustain on any plane before failure occurs. It governs the stability of slopes, bearing capacity of foundations, and lateral resistance of retaining structures. The Mohr–Coulomb criterion remains the standard model:

\[
\tau_f = c' + \sigma'_n \tan\phi'
\]

For granular soils, \(c' \approx 0\) and \(\phi'\) ranges from about 28° for loose, rounded sand to over 45° for dense, angular gravel. For normally consolidated clays, \(c' \approx 0\) and \(\phi'\) is typically 20°–32°. Overconsolidated clays may exhibit a positive \(c'\) intercept on the peak envelope but approach residual strength \(\phi'_r < \phi'\) at large displacements due to alignment of clay platelets.

## 6.2 Drained vs. Undrained Behavior

Two limiting drainage conditions bracket real field behavior:

**Drained loading** occurs when loading is slow enough, or the soil permeable enough, that excess pore pressures dissipate as they form. Volume changes occur freely and effective stresses govern the response. Drained strength parameters \(c'\) and \(\phi'\) apply.

**Undrained loading** occurs when drainage is prevented during shear — typical of rapid loading of saturated clays. The total volume (and void ratio) is constant during shearing. Excess pore pressures develop; if positive, they reduce effective stress and hence strength. The undrained shear strength \(s_u\) (or \(c_u\)) is a total-stress parameter applicable only when undrained conditions prevail:

\[
\tau_f = s_u \quad (\phi_u = 0 \text{ analysis})
\]

For a normally consolidated clay, \(s_u\) increases with effective overburden stress; empirical correlations include \(s_u/\sigma'_{v0} \approx 0.22\) to 0.26 (Skempton).

## 6.3 Laboratory Strength Tests

The **direct shear test** shears a specimen horizontally along a predefined plane under a controlled normal load. It is simple and useful for determining \(\phi'\) of granular soils and remolded clays, though the failure plane is fixed and drainage control is imperfect.

The **triaxial test** is the most versatile strength test. A cylindrical specimen is encased in a membrane, subjected to an all-round confining pressure \(\sigma_3\) in a cell, and then loaded axially by an additional deviator stress \(\sigma_1 - \sigma_3\). Principal stress ratios and drainage conditions are controlled independently. Test types include:

- **UU (unconsolidated-undrained)**: both consolidation and shear undrained; used to measure \(s_u\) for short-term stability.
- **CU (consolidated-undrained)**: consolidated to \(\sigma'_3\), then sheared undrained with pore-pressure measurement; yields both \(\phi'\), \(c'\) from effective stress path and \(\phi_{cu}\) from total stress path.
- **CD (consolidated-drained)**: consolidated then sheared slowly with drainage; yields \(\phi'\) and \(c'\) directly from effective stresses.

Mohr circles at failure from multiple tests define the failure envelope. The critical state framework (Cam Clay model) unifies the drained and undrained responses by recognizing that all stress paths ultimately converge to a unique critical state line in \(q\)\(-\)\(p'\)\(-\)\(v\) space, where \(p' = (\sigma'_1 + 2\sigma'_3)/3\) and \(q = \sigma_1 - \sigma_3\).

## 6.4 Pore-Pressure Parameters

Skempton's pore-pressure parameters \(A\) and \(B\) quantify pore-pressure response to applied total stress increments in undrained loading:

\[
\Delta u = B\left[\Delta\sigma_3 + A\left(\Delta\sigma_1 - \Delta\sigma_3\right)\right]
\]

For a fully saturated soil, \(B \approx 1\). The parameter \(A\) at failure (\(A_f\)) ranges from about +1/3 for normally consolidated clays to negative values for heavily overconsolidated or dilative sands, reflecting positive and negative excess pore pressures generated during undrained shear.

---

# Chapter 7: Geotechnical Applications

## 7.1 Subsurface Exploration

Rational foundation design requires knowledge of subsurface stratigraphy, groundwater conditions, and soil properties. Exploration methods include:

**Boring**: rotary or auger borings are advanced to recover disturbed or undisturbed samples. Thin-walled Shelby tubes (ASTM D1587) retrieve nearly undisturbed samples of soft to medium clays for laboratory testing.

**Standard Penetration Test (SPT)**: a split-spoon sampler is driven 450 mm by a 63.5 kg hammer falling 760 mm; the blow count over the middle 300 mm is the SPT-N value. Corrections for energy efficiency (CE), overburden (CN), rod length (CR), sampler type (CS), and borehole diameter (CB) yield the normalized value \((N_1)_{60}\), widely correlated with relative density, friction angle, and liquefaction susceptibility.

**Cone Penetration Test (CPT)**: a cone is pushed at a constant rate of 20 mm/s; the tip resistance \(q_c\), sleeve friction \(f_s\), and (for the piezocone, CPTU) pore pressure \(u_2\) are recorded continuously. The friction ratio \(R_f = f_s/q_c\) enables soil behavior type classification. The CPTU is the preferred tool for detailed profiling in soft-ground environments.

**Vane shear test**: an in-situ test used to measure undrained shear strength in soft to medium sensitive clays without the disturbance of sample extraction. A four-bladed vane is pushed into the soil and rotated; the peak and remolded torques are measured. Sensitivity \(S_t = s_{u,peak}/s_{u,remolded}\).

## 7.2 Bearing Capacity of Shallow Foundations

The ultimate bearing capacity of a strip footing on a general shear failure mechanism is given by the Terzaghi equation:

\[
q_u = c' N_c + q N_q + \frac{1}{2}\gamma B N_\gamma
\]

where \(q = \gamma D_f\) is the surcharge pressure at foundation depth \(D_f\), \(B\) is the footing width, and \(N_c\), \(N_q\), \(N_\gamma\) are dimensionless bearing capacity factors dependent on \(\phi'\). The Meyerhof and Hansen formulations extend this to rectangular footings, inclined loads, and sloping ground by introducing shape, depth, and inclination factors.

The allowable bearing capacity is \(q_{all} = q_u/F\), where a factor of safety \(F = 2.5\) to 3.0 is typically applied to the net ultimate capacity.

## 7.3 Slope Stability

The **infinite slope** model applies to long shallow landslides. For a slope of inclination \(\beta\) with a failure plane parallel to the surface at depth \(z\), the factor of safety (drained, with seepage parallel to slope) is:

\[
F = \frac{c'}{\gamma z \sin\beta\cos\beta} + \frac{\tan\phi'}{\tan\beta} - \frac{\gamma_w h_w}{\gamma z} \frac{\tan\phi'}{\tan\beta}
\]

For deeper slip surfaces, **limit equilibrium methods** divide the soil mass above the failure surface into vertical slices. Fellenius's ordinary method of slices, Bishop's simplified method, and Spencer's method solve the equations of equilibrium with varying assumptions about interslice forces.

## 7.4 Lateral Earth Pressure and Retaining Structures

Rankine's lateral earth pressure theory assumes a frictionless vertical wall and a horizontal backfill. The coefficient of active earth pressure is:

\[
K_a = \frac{1 - \sin\phi'}{1 + \sin\phi'} = \tan^2\left(45° - \frac{\phi'}{2}\right)
\]

The active earth pressure distribution is triangular for a uniform backfill:

\[
\sigma'_h = K_a \sigma'_v - 2c'\sqrt{K_a}
\]

For a retained height \(H\), the total active force per unit length is \(P_a = \frac{1}{2}K_a \gamma H^2\) (cohesionless soil, no water). The passive pressure coefficient \(K_p = 1/K_a\) and the at-rest coefficient \(K_0 = 1 - \sin\phi'\) (for normally consolidated soils; Jaky's formula) complete the lateral pressure vocabulary.

Coulomb's theory accounts for wall friction \(\delta\) and provides more accurate active thrust estimates for rough walls; the resultant force acts at angle \(\delta\) to the wall normal.

---

# Chapter 8: Laboratory Methods in Geotechnical Engineering

## 8.1 Index Property Tests

Standard laboratory index tests identify and classify soils in support of a site investigation. Atterberg limit determinations (ASTM D4318), grain-size analysis (ASTM D422 for hydrometer, D6913 for mechanical sieve), and specific gravity (ASTM D854) are routine. Natural water content is measured by oven-drying at 105°C for 24 hours.

## 8.2 Oedometer Test

The one-dimensional consolidation test (oedometer or consolidometer, ASTM D2435) applies incremental loads to a laterally confined specimen and measures vertical deformation over time. Each load increment is maintained until primary consolidation is complete (typically 24 hours). From the \(e\) versus \(\log\sigma'_v\) plot, \(C_c\), \(C_s\), and \(\sigma'_p\) (Casagrande graphical construction) are determined. The coefficient of consolidation \(c_v\) is obtained from the rate of settlement under each load increment using either the square-root-of-time method (Taylor) or the logarithm-of-time method (Casagrande).

## 8.3 Permeability Tests

The falling-head permeameter is appropriate for silts and clays with \(k < 10^{-5}\) m/s. The constant-head permeameter is used for clean sands and gravels. In situ hydraulic conductivity measurements (pump tests, slug tests, packer tests in rock) are necessary when undisturbed fabric and macro-structure significantly influence field permeability.

## 8.4 Compaction Test

The standard Proctor compaction test (ASTM D698) compacts soil into a mold in three layers using a 24.4 N hammer falling 305 mm, with 25 blows per layer. The modified Proctor test (ASTM D1557) uses a 44.5 N hammer falling 457 mm in five layers. The resulting compaction curve guides field specifications and quality control of engineered fill.

---

# Summary of Key Relationships

The following table summarizes the most frequently referenced geotechnical parameters and their definitions.

| Parameter | Symbol | Definition / Formula |
|---|---|---|
| Void ratio | \(e\) | \(V_v / V_s\) |
| Porosity | \(n\) | \(e/(1+e)\) |
| Water content | \(w\) | \(M_w / M_s\) |
| Degree of saturation | \(S_r\) | \(V_w / V_v\) |
| Effective stress | \(\sigma'\) | \(\sigma - u\) |
| Compression index | \(C_c\) | slope of \(e\)-\(\log\sigma'_v\) (NC range) |
| Consolidation coeff. | \(c_v\) | \(k / (\gamma_w m_v)\) |
| Time factor | \(T_v\) | \(c_v t / H_{dr}^2\) |
| Active earth pressure coeff. | \(K_a\) | \(\tan^2(45° - \phi'/2)\) |
| At-rest earth pressure coeff. | \(K_0\) | \(1 - \sin\phi'\) (NC) |
| Hydraulic conductivity | \(k\) | Darcy: \(v = ki\) |
| Critical hydraulic gradient | \(i_{cr}\) | \((G_s - 1)/(1+e)\) |
