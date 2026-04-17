---
title: "EARTH 437: Rock Mechanics"
subjects: "EARTH"
prof: "Ali Yaghoubi"
---

## Sources and References
**Online resources** — ISRM (International Society for Rock Mechanics) Suggested Methods (isrm.net); ARMA (American Rock Mechanics Association) resources; USGS Geologic Hazards Science Center; Rocscience software documentation (rocscience.com); USACE Engineering Manuals for Rock Mechanics

# Chapter 1: Introduction to Rock Mechanics and Design Principles

## Scope and Applications of Rock Mechanics

Rock mechanics is the theoretical and applied science of the mechanical behaviour of rock and rock masses — the response of these materials to their physical and chemical environment. It is an inherently multidisciplinary field, drawing from solid mechanics, geology, geophysics, civil engineering, mining engineering, and petroleum engineering. The geological environment imposes conditions that are without parallel in most branches of engineering: rock masses are discontinuous (cut by joints, faults, bedding planes, and other fractures at all scales), heterogeneous (varying in composition, texture, and fabric across tens of centimetres to kilometres), anisotropic (having direction-dependent properties), and pre-stressed (subject to in-situ stresses that may exceed engineering-induced stresses near structures).

<div class="definition">
<strong>Rock mechanics</strong> is concerned with the response of rock and rock masses to the fields of force, pore pressure, temperature, and chemistry to which they are subjected in nature and in engineering. <strong>Rock engineering</strong> is the application of rock mechanics principles to the design, construction, and operation of structures in, on, or made from rock — including mines, tunnels, slopes, foundations, reservoirs, and borehole systems. The two disciplines are complementary: rock mechanics provides the scientific understanding; rock engineering applies it within the context of economic, safety, and environmental constraints.
</div>

Applications span three major engineering sectors. In **civil engineering**, rock mechanics governs the design of tunnels (highway, railway, hydroelectric, water supply), underground caverns, bridge abutments and dam foundations, and highway and railway cuts. In **mining engineering**, it addresses the stability of open-pit and underground mine openings, pillar design, support system selection, and the management of rockbursts and seismic activity induced by mining. In **petroleum engineering**, rock mechanics underpins borehole stability analysis (preventing wellbore collapse or fracturing during drilling), hydraulic fracturing design for oil and gas production and geothermal energy extraction, and reservoir compaction and subsidence prediction.

## Risk and Uncertainty in Rock Engineering

A defining characteristic of rock mechanics problems is pervasive uncertainty. The subsurface is never fully known — no amount of drilling, geophysical surveying, and laboratory testing completely characterizes the rock mass through which a tunnel will be driven or from which an open pit will extract ore. Sources of uncertainty include: spatial variability of rock mass properties (even a single formation may vary significantly in strength, stiffness, and fracture density over short distances); limited sampling (core from a few boreholes represents a minuscule fraction of the rock volume); measurement error in laboratory and field tests; model uncertainty (no model perfectly captures the complex mechanical behaviour of a jointed rock mass); and the incomplete characterization of the initial stress state, which is perhaps the most consequential unknown in most rock engineering problems.

Engineering design in the face of such uncertainty requires a **probabilistic framework** — one that explicitly represents uncertainty in input parameters and propagates that uncertainty through the design model to quantify the probability of unacceptable outcomes (failure). The **factor of safety (FS)** — the ratio of capacity (resistance) to demand (load) — is the traditional deterministic design criterion: FS > 1 means the structure should be stable, and design codes specify minimum values (typically 1.2 to 2.0, depending on the application and consequences of failure). The **probability of failure (Pf)** and **reliability index (\( \beta_R \))** are probabilistic alternatives:

\[ \beta_R = \frac{\mu_{\text{FS}} - 1}{\sigma_{\text{FS}}} \]

where \( \mu_{\text{FS}} \) and \( \sigma_{\text{FS}} \) are the mean and standard deviation of the factor of safety computed from the distributions of uncertain input parameters. The **Monte Carlo method** — drawing random samples from input distributions, computing FS for each sample, and building up a distribution of FS from thousands to millions of iterations — is the most general and flexible approach to probabilistic rock mechanics design.

# Chapter 2: Stresses in the Earth

## Force, Stress, and the Stress Tensor

The mechanical state of a point in a rock mass is described by the **stress tensor** — a second-order symmetric tensor that specifies the magnitude and orientation of all forces per unit area acting on planes through that point. In three-dimensional Cartesian coordinates \( (x_1, x_2, x_3) \) or equivalently \( (x, y, z) \), the stress tensor \( \boldsymbol{\sigma} \) is:

\[ \boldsymbol{\sigma} = \begin{pmatrix} \sigma_{11} & \sigma_{12} & \sigma_{13} \\ \sigma_{21} & \sigma_{22} & \sigma_{23} \\ \sigma_{31} & \sigma_{32} & \sigma_{33} \end{pmatrix} \]

where \( \sigma_{ij} \) is the stress component acting in the \( x_j \) direction on a plane whose outward normal points in the \( x_i \) direction. Diagonal components \( \sigma_{11}, \sigma_{22}, \sigma_{33} \) are **normal stresses** (acting perpendicular to the plane); off-diagonal components are **shear stresses**. By Newton's third law and the condition of rotational equilibrium, \( \sigma_{ij} = \sigma_{ji} \), so the stress tensor is symmetric and has at most six independent components (three normal + three shear stresses).

<div class="definition">
<strong>Principal stresses</strong> are the normal stresses acting on three mutually perpendicular planes (principal planes) on which shear stresses are zero. They are the eigenvalues \( \sigma_1 \geq \sigma_2 \geq \sigma_3 \) of the stress tensor, and the corresponding eigenvectors give the <strong>principal stress directions</strong>. The stress tensor in the principal coordinate system is diagonal: \( \boldsymbol{\sigma}_{\text{principal}} = \text{diag}(\sigma_1, \sigma_2, \sigma_3) \). In rock mechanics, compression is conventionally taken as positive (opposite to the usual mechanics convention), so \( \sigma_1 \) is the maximum compressive stress and \( \sigma_3 \) is the minimum.
</div>

For a plane with unit normal vector \( \mathbf{n} = (n_1, n_2, n_3) \), the traction vector (stress vector) acting on that plane is \( \mathbf{t} = \boldsymbol{\sigma} \cdot \mathbf{n} \). The normal stress \( \sigma_n \) and shear stress \( \tau \) on this plane are:

\[ \sigma_n = \mathbf{t} \cdot \mathbf{n} = \sigma_{ij} n_i n_j \]

\[ \tau = \sqrt{|\mathbf{t}|^2 - \sigma_n^2} \]

In two dimensions (relevant for many plane-strain or plane-stress rock mechanics problems), the transformation of stress components under rotation of the coordinate system by angle \( \theta \) gives:

\[ \sigma_{x'} = \frac{\sigma_x + \sigma_y}{2} + \frac{\sigma_x - \sigma_y}{2}\cos 2\theta + \tau_{xy}\sin 2\theta \]

\[ \sigma_{y'} = \frac{\sigma_x + \sigma_y}{2} - \frac{\sigma_x - \sigma_y}{2}\cos 2\theta - \tau_{xy}\sin 2\theta \]

\[ \tau_{x'y'} = -\frac{\sigma_x - \sigma_y}{2}\sin 2\theta + \tau_{xy}\cos 2\theta \]

These are the basis for the **Mohr circle** construction.

## Gravitational and Tectonic Stresses

The vertical (overburden) stress at depth \( z \) is:

\[ \sigma_v = \rho g z \]

where \( \rho \) is the mean density of the overlying rock column and \( g = 9.81 \, \text{m/s}^2 \). For a typical rock density of 2650 kg/m³, \( \sigma_v \approx 26 \, \text{MPa/km} \). The horizontal stress is more difficult to predict; in the simplest elastic model, one-dimensional compaction of a laterally confined rock column gives an **at-rest** (K₀) horizontal stress:

\[ \sigma_h = K_0 \sigma_v = \frac{\nu}{1 - \nu} \sigma_v \]

where \( \nu \) is Poisson's ratio (typically 0.2–0.35 for rocks). However, global compilations of in-situ stress measurements (the World Stress Map project) show that horizontal stresses frequently exceed vertical stresses, particularly in the upper few kilometres of the crust in cratonic settings — evidence that **tectonic stresses** (arising from plate boundary forces, gravitational potential energy of topography, and residual stresses from ancient geological processes) commonly dominate over gravitational stresses. The ratio of horizontal to vertical stress \( K = \sigma_h/\sigma_v $ frequently ranges from 0.5 to 3.0 in the upper crust, and in highly stressed shield environments (Canadian Shield, Scandinavian Shield) can exceed 3 at shallow depths.

## Effective Stress and Pore Pressure

In fluid-saturated rock masses — including nearly all sedimentary and many crystalline rocks in the shallow crust — the mechanical behaviour is governed not by the total stress but by the **effective stress**, which accounts for the role of pore fluid pressure in reducing the normal forces transmitted through the rock skeleton. The **Terzaghi effective stress principle** states:

\[ \sigma'_{ij} = \sigma_{ij} - u \delta_{ij} \]

where \( u \) is the pore fluid pressure and \( \delta_{ij} \) is the Kronecker delta. Effective stress determines whether a rock or soil will yield: high pore pressure reduces effective normal stresses, reduces frictional resistance to sliding on fractures, and promotes tensile failure. The generation of high pore pressures by fluid injection (hydraulic fracturing, wastewater injection) or by undrained loading (rapid loading of saturated soil or rock) is responsible for both engineered (hydraulic fracturing) and unintended (induced seismicity, landslides triggered by reservoir filling) failure events.

## Stress Measurement Methods

Because in-situ stress is a critical and uncertain design parameter, rock mechanics has developed an extensive toolkit of stress measurement methods:

**Hydraulic fracturing (HF or minifrac)** is the most widely applied method for measuring horizontal stresses in boreholes. A section of borehole is isolated with straddle packers, and fluid is injected until the rock fractures. At the moment of fracture initiation in an impermeable rock, the wellbore pressure equals:

\[ P_b = 3\sigma_h - \sigma_H + T \]

where \( \sigma_h \) is the minimum horizontal stress, \( \sigma_H \) is the maximum horizontal stress, and \( T \) is the tensile strength of the rock. The **shut-in pressure (SIP)** — the pressure at which the hydraulic fracture closes after pumping stops — equals \( \sigma_h \) (the minimum horizontal stress), as the fracture cannot remain open against a stress lower than the confining stress perpendicular to it. A second injection cycle (reopening test, where T = 0) gives:

\[ P_r = 3\sigma_h - \sigma_H \]

from which \( \sigma_H = 3\sigma_h - P_r \).

**Overcoring** methods (CSIR cell, CSIRO HI cell, USBM gauge) measure the strains induced when a larger annular drill bit is used to core around a strain-gauged borehole, releasing the in-situ stresses and allowing the rock to deform. The measured strains are converted to stresses using the elastic constitutive equations, requiring knowledge of the elastic moduli of the rock. Overcoring is particularly useful for measuring the full three-dimensional stress tensor, as strain gauges on the overcored cylinder measure strains in multiple orientations.

**Wellbore breakouts** and **drilling-induced tensile fractures (DITFs)** observed on borehole images (from acoustic televiewers or resistivity imagers) provide information about the horizontal stress orientation: breakouts occur in the direction of minimum horizontal stress \( \sigma_h \) (where compressive stress concentration exceeds rock strength), while DITFs occur in the direction of \( \sigma_H \).

# Chapter 3: Strength and Yield Criteria

## Failure Modes and the Concept of Strength

Rocks can fail in a variety of modes depending on the stress state, rock type, and rate of loading. **Tensile failure** occurs when the minimum principal stress becomes tensile (negative in the rock mechanics sign convention) and exceeds the tensile strength \( T_0 \) of the rock. **Shear failure** occurs when the shear stress on some plane exceeds the frictional resistance to sliding on that plane. **Crushing or compactive failure** occurs under high hydrostatic stresses. The **strength** of a rock is not a single number but a function of the stress state: the same rock may have a uniaxial compressive strength (UCS) of 100 MPa, a tensile strength of 10 MPa, and a triaxial compressive strength of 400 MPa at a confining pressure of 50 MPa.

<div class="definition">
The <strong>Mohr-Coulomb failure criterion</strong> is the most widely used strength criterion in rock and soil mechanics. It states that shear failure on a plane occurs when the shear stress on that plane reaches a critical value that increases linearly with the normal stress on that plane:

\[ \tau_f = c + \sigma_n \tan\phi \]

where \( \tau_f \) is the shear stress at failure (the shear strength), \( c \) is the cohesion intercept (shear strength when normal stress is zero), \( \sigma_n \) is the effective normal stress on the failure plane, and \( \phi \) is the friction angle. In principal stress space, the Mohr-Coulomb criterion takes the form:

\[ \sigma_1 = \sigma_3 \tan^2\!\left(\frac{\pi}{4} + \frac{\phi}{2}\right) + 2c \tan\!\left(\frac{\pi}{4} + \frac{\phi}{2}\right) \]

or equivalently \( \sigma_1 = q_u + k_p \sigma_3 \), where \( q_u = \text{UCS} = 2c\tan(45° + \phi/2) \) is the uniaxial compressive strength and \( k_p = \tan^2(45° + \phi/2) \) is the slope of the failure envelope in \( \sigma_1 - \sigma_3 \) space.
</div>

The **Mohr circle** is the graphical representation of the state of stress at a point in two dimensions. A circle with centre at \( ((\sigma_1 + \sigma_3)/2, 0) \) and radius \( (\sigma_1 - \sigma_3)/2 \) plots all possible (\( \sigma_n, \tau \)) combinations on planes through the point. The Mohr-Coulomb failure envelope is a straight line in \( \tau - \sigma_n \) space; failure occurs when the Mohr circle is tangent to this envelope. The **angle of the failure plane** relative to the \( \sigma_3 \) direction is \( 45° + \phi/2 \).

## The Hoek-Brown Failure Criterion

The **Hoek-Brown empirical failure criterion** was developed specifically for rock masses (as opposed to the Mohr-Coulomb criterion, which applies better to intact rock and soils), incorporating the influence of rock mass quality — quantified through the **Geological Strength Index (GSI)** — on strength:

\[ \sigma_1' = \sigma_3' + \sigma_{ci} \left(m_b \frac{\sigma_3'}{\sigma_{ci}} + s\right)^a \]

where \( \sigma_{ci} \) is the uniaxial compressive strength of the intact rock, and \( m_b \), \( s \), and \( a \) are dimensionless parameters that depend on the rock mass quality (GSI) and degree of disturbance from blasting or excavation:

\[ m_b = m_i \exp\!\left(\frac{\text{GSI} - 100}{28 - 14D}\right) \]

\[ s = \exp\!\left(\frac{\text{GSI} - 100}{9 - 3D}\right) \]

\[ a = \frac{1}{2} + \frac{1}{6}\left(e^{-\text{GSI}/15} - e^{-20/3}\right) \]

where \( m_i \) is a material constant for intact rock (ranging from 4 for agyllites to 33 for quartzite), and \( D \) is a disturbance factor (0 for undisturbed in-situ rock, 1 for highly disturbed blasted slopes). The Hoek-Brown criterion accounts for the observation that rock mass strength envelopes are curved (not linear) in \( \sigma_1 - \sigma_3 \) space, with the slope decreasing at high confining pressures — a natural consequence of the closure of pre-existing fractures and the transition from brittle to ductile behaviour.

## Joint and Interface Shear Strength

The shear strength of a rock joint (a planar discontinuity such as a bedding plane, joint, or fault) governs the stability of slopes and underground excavations that contain such features. Unlike intact rock, joints have essentially zero tensile strength and their shear strength is dominated by friction, modified by surface roughness.

For a clean (unfilled) joint at effective normal stress \( \sigma_n' \), the **basic friction angle** \( \phi_b \) (measured on flat, saw-cut or polished rock surfaces) is augmented by a **roughness component** \( i \) (the average angle of asperities on the joint surface):

\[ \tau = \sigma_n' \tan(\phi_b + i) \]

This simple model captures the key effect — that rougher surfaces have higher shear strength — but assumes that the asperities shear off progressively at high normal stresses (where riding over asperities requires more dilation work than shearing through them). The **Barton-Bandis criterion** is a curvilinear model that explicitly incorporates roughness through the joint roughness coefficient (JRC, quantified on a standard roughness profile scale from 0 to 20), the joint wall compressive strength (JCS), and the residual friction angle \( \phi_r \):

\[ \tau = \sigma_n' \tan\!\left[\text{JRC}\log\!\left(\frac{\text{JCS}}{\sigma_n'}\right) + \phi_r\right] \]

This criterion predicts the observed non-linear (curved) failure envelope for joints, with apparent friction angles that decrease as normal stress increases from low values (where dilation and surface roughness dominate) to high values (where asperities fail and surface damage reduces roughness).

# Chapter 4: Deformability of Rock

## Elastic Parameters and Constitutive Laws

The deformation of rock in response to applied stress is described by its **constitutive law** — the mathematical relationship between stress and strain. For many rocks under moderate stresses (well below the failure stress), deformation is approximately **linear elastic**, described by **Hooke's law**. For a homogeneous, isotropic elastic material, the full constitutive relationship is:

\[ \varepsilon_{ij} = \frac{1+\nu}{E}\sigma_{ij} - \frac{\nu}{E}\sigma_{kk}\delta_{ij} \]

where \( E \) is Young's modulus, \( \nu \) is Poisson's ratio, \( \varepsilon_{ij} \) is the strain tensor, and \( \sigma_{kk} = \sigma_{11} + \sigma_{22} + \sigma_{33} \) is the first stress invariant (trace). Only two independent elastic constants characterize an isotropic elastic solid: \( E \) and \( \nu \). Equivalent pairs that are sometimes more convenient include the bulk modulus \( K = E/[3(1-2\nu)] \) (relating volumetric strain to mean stress) and shear modulus \( G = E/[2(1+\nu)] \) (relating shear strain to shear stress).

<div class="example">
<strong>Stress-Strain in Uniaxial Compression.</strong> In a uniaxial compression test, a cylindrical rock specimen is loaded axially (\( \sigma_1 = P/A \), \( \sigma_2 = \sigma_3 = 0 \)). The axial strain is \( \varepsilon_a = \sigma_1/E \) and the lateral strain is \( \varepsilon_l = -\nu \varepsilon_a = -\nu \sigma_1/E \). Young's modulus is thus the slope of the axial stress–axial strain curve; Poisson's ratio is the magnitude of the ratio of lateral to axial strain. The volumetric strain is \( \varepsilon_v = \varepsilon_a + 2\varepsilon_l = \varepsilon_a(1 - 2\nu) \). For an incompressible material, \( \nu = 0.5 \) and \( \varepsilon_v = 0 \).
</div>

Typical values of Young's modulus for rocks span roughly two orders of magnitude: from 0.1–1 GPa for weak, porous rocks (chalk, soft limestone, coal) through 10–30 GPa for sandstones and medium-quality igneous rocks to 50–100 GPa for competent granites, quartzites, and basalts. Poisson's ratios for rocks typically range from 0.15 to 0.35. The ratio of **dynamic elastic moduli** (measured from the velocities of elastic waves propagating through intact rock) to **static elastic moduli** (from laboratory stress-strain tests) is commonly 1.1 to 10, with the discrepancy increasing for weaker, more porous, and more fractured rocks — reflecting the dependency of static moduli on the opening and closing of pre-existing cracks under stress.

## Creep and Time-Dependent Deformation

Many rocks, particularly soft rocks (rock salt/halite, potash, shales, claystones, and coal) and rocks at high temperatures, exhibit **time-dependent deformation (creep)** — continued deformation under constant stress. Creep poses critical engineering challenges for the long-term stability of underground repositories, salt caverns, potash mines, and hydrocarbon reservoirs, where structures must remain stable over years to decades or longer.

Conventional creep deformation is conceptually divided into three stages: **primary creep** (decelerating strain rate as internal stress concentrations relax); **secondary (steady-state) creep** (approximately constant strain rate under sustained deviatoric stress); and **tertiary creep** (accelerating strain rate leading to rupture). The secondary creep rate \( \dot{\varepsilon} \) is commonly modelled by the power law:

\[ \dot{\varepsilon} = A \sigma^n \exp\!\left(-\frac{Q}{RT}\right) \]

where \( A \) is a material constant, \( n \) is the stress exponent (typically 3–5 for mantle rocks), \( Q \) is the activation energy for the rate-controlling deformation mechanism (dislocation glide, diffusion, grain boundary sliding), \( R \) is the gas constant, and \( T \) is absolute temperature. This equation is the **Norton power law** or **Glen flow law** (for ice), fundamental to glaciology and mantle dynamics.

**Rheological models** — combinations of ideal mechanical elements (elastic springs, viscous dashpots, plastic sliders) — provide conceptual and computational frameworks for describing time-dependent constitutive behaviour. The **Maxwell model** (spring and dashpot in series) predicts immediate elastic deformation followed by unlimited viscous flow under sustained stress — appropriate for materials that flow without limit (ductile salt). The **Kelvin-Voigt model** (spring and dashpot in parallel) predicts exponentially decelerating creep that terminates at a finite strain — more appropriate for primary creep in elastic-viscous materials. The **Burgers model** (Maxwell and Kelvin-Voigt in series) combines both primary and secondary creep behaviours and is widely used for rock salt in geomechanical analyses.

# Chapter 5: Rock Slope Stability

## Mechanics of Rock Slope Failure

Rock slopes fail by a variety of mechanisms, each associated with a distinct geometry of the failure surface and a different controlling strength. **Planar failure** occurs when a rock block or wedge slides along a single planar discontinuity (bedding plane, joint, fault) that dips toward the slope face at an angle steeper than the friction angle but less than the slope angle. **Wedge failure** involves sliding along the intersection line of two planar discontinuities. **Toppling failure** occurs when tall, slender rock columns rotate forward about a pivot at their base. **Circular failure** in highly fractured rock masses (where the rock mass behaves more like a soil) involves sliding along a curved failure surface.

For **planar failure** of a block of weight \( W \) on a plane inclined at angle \( \psi_p \) with cohesion \( c \), friction angle \( \phi \), and pore water pressure \( U \) acting on the failure plane of area \( A \):

\[ \text{FS} = \frac{cA + (W\cos\psi_p - U)\tan\phi}{W\sin\psi_p} \]

This equation reveals the roles of each stabilizing and destabilizing factor: cohesion and friction provide resistance; self-weight resolved along the slope provides driving force; pore pressure reduces the effective normal force and hence frictional resistance. The effect of a tension crack filled with water to depth \( z_w \) adds a horizontal driving force \( V = \frac{1}{2}\gamma_w z_w^2 \) to the numerator and modifies \( U \):

\[ U = \frac{1}{2}\gamma_w z_w \cdot (H - z)\frac{1}{\sin\psi_p} \]

where \( \gamma_w \) is the unit weight of water and \( H \) is the slope height. The design charts of Hoek and Bray — dimensionless plots of FS as a function of the ratio \( c/(\gamma H) \) and the angle difference \( \psi_p - \phi \) — allow rapid assessment of planar slope stability across a wide range of geometries and material properties.

## Influence of Groundwater and Earthquake Forces

Groundwater dramatically reduces slope stability by increasing pore pressure on potential failure surfaces. The effect of rainfall infiltration, snow melt, or reservoir drawdown on pore pressures within a slope is described by **transient groundwater flow models**, but for design purposes, the pore pressure ratio \( r_u = u/(\gamma z) \) — the ratio of pore pressure to overburden stress — provides a convenient measure of drainage conditions: \( r_u = 0 \) is fully drained (no excess pore pressure), \( r_u = 0.5 \) corresponds to artesian pressure (piezometric head at the ground surface), and \( r_u = 1.0 \) represents fully submerged conditions.

Earthquake loading introduces a pseudo-static horizontal force \( F_h = k_h W \) and a vertical force \( F_v = \pm k_v W \), where \( k_h \) and \( k_v \) are horizontal and vertical seismic coefficients (fractions of g). The modified factor of safety under seismic loading is:

\[ \text{FS}_{\text{seismic}} = \frac{cA + \left[(W(1 - k_v)\cos\psi_p - k_h W\sin\psi_p - U\right]\tan\phi}{W(1 - k_v)\sin\psi_p + k_h W\cos\psi_p} \]

Seismic loading typically reduces FS by 15–40% for slopes with parameters representative of civil and mining engineering. The **Newmark displacement method** extends this analysis to estimate permanent slope displacement during earthquake shaking, providing a more realistic assessment of post-earthquake stability than a pseudo-static FS alone.

## Probabilistic Slope Stability and the Monte Carlo Method

The Monte Carlo simulation method provides a rigorous framework for propagating parameter uncertainties through slope stability calculations. Input parameters (cohesion, friction angle, pore pressure ratio, slope geometry) are represented by probability distributions (typically normal or log-normal, calibrated to site-specific test data). In each Monte Carlo iteration, values are randomly sampled from these distributions, and the factor of safety is computed. After thousands of iterations, the distribution of FS values is assembled, from which the probability of failure \( P_f = P(\text{FS} < 1) \) is estimated directly:

\[ P_f = \frac{\text{Number of iterations with FS} < 1}{\text{Total iterations}} \]

# Chapter 6: Reservoir Geomechanics

## Stress Changes in Producing Reservoirs

The extraction of fluids (oil, gas, water) from a subsurface reservoir reduces the pore pressure, which in turn modifies the in-situ effective stress state. For a tabular reservoir of finite lateral extent and thickness, the change in horizontal stress due to a pore pressure change \( \Delta P \) can be derived analytically using linear elastic theory with appropriate boundary conditions. For a reservoir that is laterally extensive relative to its thickness (uniaxial strain boundary condition in the vertical direction, with lateral confinement):

\[ \Delta \sigma_h = \alpha \frac{1 - 2\nu}{1 - \nu} \Delta P \]

where \( \alpha \) is the **Biot coefficient** (0 for zero porosity/rigid frame, approaching 1 for highly compressible porous materials) and \( \nu \) is Poisson's ratio. This equation shows that a pore pressure reduction (reservoir depletion) causes a reduction in total horizontal stress, but by less than the pore pressure reduction — the effective horizontal stress \( \Delta \sigma'_h = \Delta \sigma_h - \alpha \Delta P \) actually increases, tending to stabilize the reservoir against shear failure. A temperature reduction \( \Delta T < 0 \) (from cold fluid injection) adds an additional thermal stress:

\[ \Delta \sigma_h^T = -\frac{\alpha_T E \Delta T}{1 - \nu} \]

where \( \alpha_T \) is the thermal expansion coefficient of the rock. Cold injection causes compressive stress reduction (or even tensile stress development), which can promote hydraulic fracture propagation — a fundamental mechanism in geothermal energy development.

## Reservoir Compaction and Surface Subsidence

When effective vertical stress increases (due to reservoir pressure depletion or thermal contraction), the reservoir rock compacts vertically. The compaction \( \Delta h \) of a layer of thickness \( h \) is:

\[ \Delta h = C_m h \Delta \sigma'_v \]

where \( C_m \) is the uniaxial compressibility (inverse of uniaxial stiffness \( M = E(1-\nu)/[(1+\nu)(1-2\nu)] \)). Surface subsidence is related to reservoir compaction through the geometry of the subsidence bowl: the **depth-width ratio** (ratio of reservoir depth to its lateral extent) controls the shape and magnitude of the subsidence bowl. For deep, laterally extensive reservoirs, surface subsidence approaches the reservoir compaction; for narrow, deep reservoirs, the surface subsidence is much less than the reservoir compaction.

The Ekofisk oil field in the Norwegian North Sea provides a dramatic case study: chalk reservoir compaction of 6–7 metres due to pressure depletion over decades of production caused subsidence of the seafloor and the surface of the production platform by approximately 4–5 metres, requiring expensive platform jacking operations. The Ravenna gas fields in northern Italy caused subsidence of up to 2 metres on land, exacerbating flooding risk in the historically flood-prone Po Delta region.

# Chapter 7: Tunnels and Underground Openings

## Elastic Solutions for Circular Openings: The Kirsch Equations

The most important analytical solution in underground rock mechanics is the **Kirsch solution** for the stress distribution around a circular opening in a homogeneous, isotropic, linearly elastic plate subject to biaxial far-field stresses \( P \) (vertical) and \( kP \) (horizontal, where \( k = \sigma_H/\sigma_v \)). In polar coordinates \( (r, \theta) \) with origin at the tunnel centre and \( \theta \) measured from the horizontal:

\[ \sigma_r = \frac{P(1+k)}{2}\left(1 - \frac{a^2}{r^2}\right) - \frac{P(1-k)}{2}\left(1 - \frac{4a^2}{r^2} + \frac{3a^4}{r^4}\right)\cos 2\theta \]

\[ \sigma_\theta = \frac{P(1+k)}{2}\left(1 + \frac{a^2}{r^2}\right) + \frac{P(1-k)}{2}\left(1 + \frac{3a^4}{r^4}\right)\cos 2\theta \]

\[ \tau_{r\theta} = \frac{P(1-k)}{2}\left(1 + \frac{2a^2}{r^2} - \frac{3a^4}{r^4}\right)\sin 2\theta \]

where \( a \) is the tunnel radius and \( r \) is the radial distance from the tunnel centre. At the tunnel wall (\( r = a \)), the radial stress \( \sigma_r = 0 \) (free surface), and the tangential (hoop) stress is:

\[ \sigma_\theta\big|_{r=a} = P(1+k) - 2P(1-k)\cos 2\theta \]

At the springline (\( \theta = 0 \), horizontal): \( \sigma_\theta = P(3k - 1) \). At the crown (\( \theta = 90° \), vertical): \( \sigma_\theta = P(3 - k) \). For hydrostatic stress (\( k = 1 \)): \( \sigma_\theta = 2P \) everywhere around the wall — a uniform stress concentration of twice the far-field stress. For \( k = 0 \) (vertical stress only): the crown stress is 3P (extreme concentration) while the springline stress is −P (tensile), explaining why tunnels in low-horizontal-stress environments often develop tensile fractures at the springline.

<div class="theorem">
<strong>Hydraulic Fracture Initiation from a Borehole.</strong> For an impermeable elastic rock, the internal fluid pressure required to initiate a tensile hydraulic fracture at the borehole wall (in the direction of minimum horizontal stress) is:

\[ P_{HF} = 3\sigma_h - \sigma_H + T_0 \]

where \( \sigma_h \) is the minimum horizontal stress, \( \sigma_H \) is the maximum horizontal stress, and \( T_0 \) is the tensile strength of the rock. This expression follows directly from the Kirsch solution: at the borehole wall in the direction of \( \sigma_h \), the tangential stress is \( \sigma_\theta = 3\sigma_h - \sigma_H \). When the internal fluid pressure reduces this effective tangential stress to the tensile strength, the fracture initiates.
</div>

## Underground Excavation Support

The **convergence-confinement method** (or ground reaction curve approach) is a conceptual and computational framework for designing tunnel support systems. As excavation advances, the rock ahead of the face supports the full in-situ stress; behind the face, the stress is redistributed and the tunnel walls converge (deform inward). The **ground reaction curve (GRC)** relates the convergence of the tunnel wall to the internal pressure (support pressure) applied by the lining: convergence increases as support pressure decreases, reaching a maximum at zero support pressure. The **support characteristic curve (SCC)** describes how the support system (shotcrete, rock bolts, steel sets, concrete liner) develops load as the tunnel deforms: stiffer supports develop load more rapidly with displacement.

The equilibrium point — where GRC and SCC intersect — determines the final deformation and the load in the support. The art of tunnel design lies in timing the support installation (installing too early intercepts high loads; too late allows excessive convergence and potential instability) and selecting an appropriate support stiffness. The **New Austrian Tunnelling Method (NATM)** formalizes this approach, using systematic monitoring of tunnel deformation during and after excavation to adapt the support intensity iteratively to actual rock mass behaviour.

# Chapter 8: Monitoring in Rock Mechanics

## Purposes and Methods of Monitoring

Monitoring of deformation, stress, pore pressure, and seismicity is integral to rock engineering at every stage: during site investigation (establishing baseline conditions), during construction (detecting anomalous behaviour and triggering safety responses), during operation (confirming design assumptions and detecting deterioration), and during decommissioning or closure (verifying long-term stability). The philosophy of **observational design** — or adaptive management in geomechanics — embraces monitoring as a tool for continuously updating the design model in the light of observed behaviour.

**Geodetic monitoring** of surface deformation uses precision optical levelling, total stations, Global Navigation Satellite Systems (GNSS/GPS), and increasingly **InSAR** (Interferometric Synthetic Aperture Radar), which can measure millimetre-scale surface displacements over wide areas from repeat satellite radar images. InSAR has revolutionized monitoring of subsidence above producing reservoirs, volcanic deformation, landslide kinematics, and tunnel-induced settlement.

**Extensometers** measure relative displacement between points at different depths in a borehole, using rod, wire, or electrical transducer systems. Multi-point borehole extensometers (MPBXs) provide continuous displacement profiles from the tunnel or slope surface into the rock mass, revealing the depth and magnitude of the zone of deformation. **Load cells** on rock bolts and cable anchors measure the load transferred to the support element, allowing assessment of whether the support is being loaded within its design capacity.

## Microseismic Monitoring

**Microseismic monitoring** detects the small-magnitude seismic events (typically \( M < 0 \)) generated by the brittle fracturing or frictional slip that accompanies rock mass deformation around excavations, fracturing stimulations, and fluid injection operations. An array of seismometers installed in boreholes or on the surface records the P- and S-wave arrivals from each event; the difference in arrival times among sensors allows the event **hypocenter** to be located by solving an inverse problem for the source coordinates and origin time.

The spatial distribution, temporal evolution, and focal mechanism (source geometry — whether extensional, shear, or compressive fracturing) of microseismic events provide a direct image of the deforming rock volume and the progression of failure. In mining, microseismic monitoring is used to detect the precursory acceleration of small events (\( b \)-value analysis, cumulative apparent volume analysis) that precede rockbursts — sudden, violent releases of strain energy that pose lethal hazards to underground workers. In hydraulic fracturing, microseismic imaging reveals the geometry of the induced fracture network, informing decisions about fracturing effectiveness and the risk of fault reactivation.

The **Gutenberg-Richter relationship** describes the frequency-magnitude distribution of seismic events:

\[ \log_{10}(N) = a - bM \]

where \( N \) is the number of events with magnitude \( \geq M \), \( a \) is a measure of overall seismicity rate, and \( b \) is the **b-value** (typically near 1.0 for tectonic seismicity). A decreasing \( b \)-value (fewer small events relative to large ones) is a recognized precursor to large seismic events and is monitored in both natural and induced seismicity contexts. In hydraulic fracturing and injection operations, real-time monitoring of induced seismicity and comparison against **traffic light protocols** (thresholds that trigger operational changes or injection shut-in) is increasingly required by regulatory agencies to manage the risk of felt or damaging induced earthquakes.
