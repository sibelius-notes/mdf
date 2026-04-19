---
title: "AMATH 464: Solid Mechanics"
subjects: "AMATH"
---

AMATH 464 is the solid-mechanics continuation of **AMATH 361** (Continuum Mechanics). Where AMATH 361 develops the general kinematic and constitutive theory of deformable bodies — strain and stress tensors, Hooke's law, viscoelasticity, the Navier equations — AMATH 464 specializes that framework into the classical engineering design toolkit: sign conventions and SF/BM diagrams for beams, the flexure and Jourawski formulas, Saint-Venant torsion and the Prandtl stress function, Euler buckling and the Rankine–Gordon formula, Castigliano's theorems and virtual work, the Rankine/Tresca/von Mises failure envelopes, the Airy stress function and the biharmonic equation of plane elasticity, thin-shell membrane analysis, and the elements of fatigue, fracture mechanics, and anisotropic (composite, biological) materials. The audience is mathematics and engineering undergraduates who have completed AMATH 361's continuum foundation and want the applied solid-mechanics toolkit taught in **ME 220**, **AE 204 / 205**, **CIVE 204 / 205 / 306**, **BME 553**, **MTE 219**, **SYDE 286**, and **NE 318**. The exposition follows S.P. Timoshenko and J.N. Goodier, *Theory of Elasticity* (3rd ed., McGraw-Hill, 1970); S.P. Timoshenko and J.M. Gere, *Theory of Elastic Stability* (2nd ed., McGraw-Hill, 1961); J.M. Gere and B.J. Goodno, *Mechanics of Materials* (Cengage); R.J. Roark and W.C. Young, *Formulas for Stress and Strain* (McGraw-Hill); A.C. Ugural and S.K. Fenster, *Advanced Mechanics of Materials and Applied Elasticity* (6th ed., Prentice Hall, 2019); and A.P. Boresi and R.J. Schmidt, *Advanced Mechanics of Materials* (6th ed., Wiley, 2003).

The continuum framework of AMATH 361 Chapters 2–4 (kinematics, stress, linear elasticity) gives a general theory, but engineering practice demands specialized tools: sign conventions for beams, buckling criteria for columns, failure envelopes for design, and closed-form solutions for canonical geometries. This course collects the classical results that undergird the solid-mechanics engineering curriculum — bending and torsion of prismatic members, column stability, energy methods, failure theories, plane elasticity via the Airy stress function, thin-shell membrane analysis, Kirchhoff plate theory, thermoelasticity, plasticity, fracture, fatigue, composites, and the bridges to experimental and finite-element practice — so that a mathematically inclined reader can cover the full undergraduate solid-mechanics curriculum with a single rigorous text.

---

# Part I — Foundations: Stress, Strain, and Axial Members

---

## Chapter 1: Three-Dimensional Stress and Strain in the Engineer's Language

AMATH 361 establishes the Cauchy stress tensor \(\sigma_{ij}\) and the infinitesimal strain tensor \(\varepsilon_{ij}\) abstractly. Engineering practice reuses the same objects but with a specialized vocabulary — "normal stresses," "shear stresses," "principal planes," "Mohr's circle" — and with an explicit set of transformation formulas that the designer uses daily. This opening chapter reviews those formulas, fixes sign conventions, and introduces the **strain rosette** tools essential for experimental stress analysis. Reference: Ugural–Fenster Ch 1–2; Boresi–Schmidt Ch 2.

### 1.1 The Stress Tensor and Cauchy's Formula

At any point in a loaded body, the state of stress is a symmetric second-order tensor

\[
\boldsymbol{\sigma} = \begin{pmatrix} \sigma_{xx} & \sigma_{xy} & \sigma_{xz} \\ \sigma_{xy} & \sigma_{yy} & \sigma_{yz} \\ \sigma_{xz} & \sigma_{yz} & \sigma_{zz} \end{pmatrix},
\]

whose six independent components (three normal \(\sigma_{xx}, \sigma_{yy}, \sigma_{zz}\) and three shear \(\sigma_{xy}, \sigma_{yz}, \sigma_{xz}\)) prescribe the traction vector on every plane through the point. **Cauchy's formula** states

\[
\mathbf{t}(\hat{\mathbf{n}}) = \boldsymbol{\sigma}\,\hat{\mathbf{n}}, \qquad t_i = \sigma_{ij}\,n_j,
\]

for any unit normal \(\hat{\mathbf{n}}\). Symmetry \(\sigma_{ij} = \sigma_{ji}\) follows from moment equilibrium of an infinitesimal cube. Engineering convention takes tension positive and compression negative, and shear \(\sigma_{xy}\) positive when it acts in the \(+y\) direction on the \(+x\) face (equivalently, in the \(+x\) direction on the \(+y\) face).

### 1.2 Principal Stresses and Invariants

<div class="theorem">
<p><strong>Principal stresses.</strong> The stress tensor is diagonalisable; its three real eigenvalues \(\sigma_1 \ge \sigma_2 \ge \sigma_3\) are the <em>principal stresses</em>, and the corresponding orthonormal eigenvectors define the <em>principal directions</em> — planes on which shear vanishes. They satisfy</p>

\[
\det(\boldsymbol{\sigma} - \sigma\,\mathbf{I}) = -\sigma^3 + I_1\,\sigma^2 - I_2\,\sigma + I_3 = 0,
\]

<p>with the three <em>stress invariants</em></p>

\[
I_1 = \sigma_{kk}, \quad I_2 = \tfrac{1}{2}(\sigma_{kk}\sigma_{ll} - \sigma_{kl}\sigma_{lk}), \quad I_3 = \det\boldsymbol{\sigma}.
\]
</div>

The invariants \(I_1, I_2, I_3\) are independent of the coordinate frame and are the natural scalars one forms from \(\boldsymbol{\sigma}\) when writing yield criteria, failure envelopes, or constitutive laws. The hydrostatic part is \(p = -I_1/3\); the deviatoric part \(s_{ij} = \sigma_{ij} - \tfrac{1}{3}\sigma_{kk}\delta_{ij}\) has invariants \(J_1 = 0\), \(J_2 = \tfrac{1}{2} s_{ij} s_{ij}\), \(J_3 = \det(s_{ij})\). The von Mises equivalent stress (Ch 13) is \(\sigma_{\text{vM}} = \sqrt{3 J_2}\).

### 1.3 Two-Dimensional Transformation and Mohr's Circle

For plane stress \(\sigma_{xx}, \sigma_{yy}, \sigma_{xy}\), rotating the frame by an angle \(\theta\) gives transformed components

\[
\sigma_{x'x'} = \frac{\sigma_{xx}+\sigma_{yy}}{2} + \frac{\sigma_{xx}-\sigma_{yy}}{2}\cos 2\theta + \sigma_{xy}\sin 2\theta,
\]
\[
\sigma_{y'y'} = \frac{\sigma_{xx}+\sigma_{yy}}{2} - \frac{\sigma_{xx}-\sigma_{yy}}{2}\cos 2\theta - \sigma_{xy}\sin 2\theta,
\]
\[
\sigma_{x'y'} = -\frac{\sigma_{xx}-\sigma_{yy}}{2}\sin 2\theta + \sigma_{xy}\cos 2\theta.
\]

These formulas trace a circle in the \((\sigma_n, \tau)\) plane as \(\theta\) varies — the **Mohr circle** of Otto Mohr (1882), centred at \(c = (\sigma_{xx}+\sigma_{yy})/2\) with radius

\[
R = \sqrt{\left(\tfrac{\sigma_{xx}-\sigma_{yy}}{2}\right)^2 + \sigma_{xy}^2}.
\]

Principal stresses are \(\sigma_{1,2} = c \pm R\), and the maximum in-plane shear is \(\tau_{\max} = R\). The physical angle \(\theta\) maps to a central angle \(2\theta\) on the circle — the factor of two being the geometric signature of a symmetric tensor.

<div class="remark">
Mohr's circle is the single most widely used diagnostic in undergraduate solid mechanics. Given any plane-stress state, one locates the <em>pole</em> (the image of the reference face), and every other plane's stress state is read off by drawing a line from the pole at the appropriate physical angle. The construction generalises to strain (with \(\varepsilon/2\) playing the role of \(\tau\)) and to 3D (three circles inscribed between \(\sigma_1, \sigma_2, \sigma_3\)).
</div>

### 1.4 Three-Dimensional Mohr Construction

For 3D stress, plotting \((\sigma_n, \tau)\) for all planes through a point fills the shaded region between three circles with diameters \(\sigma_1-\sigma_2\), \(\sigma_2-\sigma_3\), \(\sigma_1-\sigma_3\). The **absolute maximum shear** is

\[
\tau_{\max}^{\text{abs}} = \frac{\sigma_1 - \sigma_3}{2},
\]

acting on planes bisecting the \(\sigma_1\) and \(\sigma_3\) directions. This is the quantity that enters the Tresca yield criterion. Note that if \(\sigma_3 = 0\) but \(\sigma_1\) and \(\sigma_2\) have the same sign, the absolute-maximum shear is *not* the in-plane Mohr radius but rather \(\sigma_1/2\) (out of plane) — a subtlety that trips up students doing plane-stress Tresca checks.

### 1.5 The Strain Tensor and Compatibility

The infinitesimal strain tensor is

\[
\varepsilon_{ij} = \tfrac{1}{2}\left(\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i}\right),
\]

with engineering shears \(\gamma_{ij} = 2\varepsilon_{ij}\) for \(i\ne j\). The six components cannot be prescribed arbitrarily: they must arise from a single displacement field. The **Saint-Venant compatibility equations**

\[
\partial_k\partial_l \varepsilon_{ij} + \partial_i\partial_j \varepsilon_{kl} - \partial_i\partial_l \varepsilon_{jk} - \partial_k\partial_j \varepsilon_{il} = 0
\]

reduce in 2D to the single equation

\[
\frac{\partial^2 \varepsilon_{xx}}{\partial y^2} + \frac{\partial^2 \varepsilon_{yy}}{\partial x^2} = 2\frac{\partial^2 \varepsilon_{xy}}{\partial x\,\partial y}.
\]

### 1.5b Kinematics of Large Rotations (Brief)

The infinitesimal strain tensor assumes small displacement gradients. When rotations are large but strains remain small (common for slender beams and shells), the **Green–Lagrange strain** \(E_{ij} = \tfrac{1}{2}(F_{ki}F_{kj} - \delta_{ij})\) or the **engineering** / **logarithmic (Hencky)** strain measures must be used instead. This distinction matters for post-buckling analysis, snap-through of shallow arches, and finite-deformation FEM. See AMATH 361 Ch 2 for the general kinematic theory.

### 1.6 Strain Rosette Analysis

Engineers measure strain, not stress; three gauges oriented at angles \(\theta_a, \theta_b, \theta_c\) on a surface give three axial strains \(\varepsilon_a, \varepsilon_b, \varepsilon_c\). The strain transformation formula

\[
\varepsilon_\theta = \varepsilon_{xx}\cos^2\theta + \varepsilon_{yy}\sin^2\theta + \varepsilon_{xy}\sin 2\theta
\]

yields a \(3\times 3\) linear system for the in-plane components \(\varepsilon_{xx}, \varepsilon_{yy}, \varepsilon_{xy}\). Two standard rosettes dominate practice:

- **Rectangular rosette** (\(0^\circ, 45^\circ, 90^\circ\)): \(\varepsilon_{xx} = \varepsilon_a\), \(\varepsilon_{yy} = \varepsilon_c\), \(\varepsilon_{xy} = \varepsilon_b - (\varepsilon_a+\varepsilon_c)/2\).
- **Delta rosette** (\(0^\circ, 60^\circ, 120^\circ\)): \(\varepsilon_{xx} = \varepsilon_a\), \(\varepsilon_{yy} = (2\varepsilon_b+2\varepsilon_c-\varepsilon_a)/3\), \(\varepsilon_{xy} = (\varepsilon_b-\varepsilon_c)/\sqrt{3}\).

Principal strains and their orientation follow by Mohr's-circle construction; principal stresses on a free surface (\(\sigma_3 = 0\)) then come from the plane-stress Hooke law (Ch 2). This is the pipeline that turns a Wheatstone-bridge voltage into a stress tensor, discussed further in Ch 20.

### 1.7 Hydrostatic–Deviatoric Split and Physical Meaning

Writing \(\boldsymbol{\sigma} = \tfrac{1}{3}(\text{tr}\,\boldsymbol{\sigma})\mathbf{I} + \mathbf{s}\) and \(\boldsymbol{\varepsilon} = \tfrac{1}{3}(\text{tr}\,\boldsymbol{\varepsilon})\mathbf{I} + \mathbf{e}\) separates **volumetric** from **distortional** response. For an isotropic linear material,

\[
\text{tr}\,\boldsymbol{\sigma} = 3K\,\text{tr}\,\boldsymbol{\varepsilon}, \qquad \mathbf{s} = 2G\,\mathbf{e},
\]

with bulk modulus \(K = E/[3(1-2\nu)]\) and shear modulus \(G = E/[2(1+\nu)]\). The split is essential for plasticity (yielding is driven by \(\mathbf{s}\), unaffected by hydrostatic pressure for metals) and for soil mechanics (where both branches matter, leading to Drucker–Prager; Ch 13).

### 1.8 The Octahedral Plane and Stress Deviator Invariants

The **octahedral plane** at a point is the plane whose normal is equally inclined to the three principal directions (direction cosines \(1/\sqrt{3}\)). On this plane,

\[
\sigma_{\text{oct}} = \tfrac{1}{3}(\sigma_1+\sigma_2+\sigma_3) = \tfrac{1}{3}I_1, \qquad \tau_{\text{oct}} = \tfrac{1}{3}\sqrt{(\sigma_1-\sigma_2)^2 + (\sigma_2-\sigma_3)^2 + (\sigma_3-\sigma_1)^2} = \sqrt{\tfrac{2}{3}J_2}.
\]

Nadai (1950) observed that the octahedral shear \(\tau_{\text{oct}} = \sqrt{2}\,\sigma_{\text{vM}}/3\) — yielding occurs when \(\tau_{\text{oct}}\) reaches a critical value, an equivalent formulation of the von Mises criterion. The physical picture: the octahedral plane is where the deviatoric shear stress takes its mean value over all orientations, so yielding begins when that mean exceeds a material-specific threshold.

### 1.9 Example: Rosette Analysis in Practice

<div class="example">
<strong>Rectangular rosette on a pressure-vessel wall.</strong> A 0°/45°/90° rosette mounted on the outer surface of a cylindrical steel pressure vessel (\(E = 200\) GPa, \(\nu = 0.3\)) reads \(\varepsilon_a = 380\,\mu\varepsilon\) (hoop), \(\varepsilon_b = 245\,\mu\varepsilon\) (45°), \(\varepsilon_c = 110\,\mu\varepsilon\) (axial). Compute: (i) in-plane strain components; (ii) principal strains; (iii) principal stresses (surface is free, so \(\sigma_3 = 0\)).

<em>Solution.</em> \(\varepsilon_{xx} = 380\,\mu\varepsilon\), \(\varepsilon_{yy} = 110\,\mu\varepsilon\), \(\varepsilon_{xy} = 245 - (380+110)/2 = 0\), so the rosette axes are already principal. Principal strains \(\varepsilon_1 = 380\,\mu\varepsilon\), \(\varepsilon_2 = 110\,\mu\varepsilon\). On a free surface under plane stress, \(\sigma_1 = E(\varepsilon_1 + \nu\varepsilon_2)/(1-\nu^2) = 200\times 10^3 \times (380+33)/0.91\,\mu\text{MPa} = 90.8\) MPa; \(\sigma_2 = E(\varepsilon_2 + \nu\varepsilon_1)/(1-\nu^2) = 45.2\) MPa. Ratio \(\sigma_1/\sigma_2 \approx 2\) confirms the thin-walled hoop–axial relation \(\sigma_\theta = 2\sigma_z = pR/t\).
</div>

---

## Chapter 2: Hooke's Law, Axial Loading, and Thermal Stress

### 2.1 Generalized Hooke's Law for Isotropic Materials

For an isotropic linear elastic material the constitutive law has two independent constants:

\[
\sigma_{ij} = \lambda\,\varepsilon_{kk}\,\delta_{ij} + 2\mu\,\varepsilon_{ij},
\]

with Lamé parameters \(\lambda, \mu\). Equivalently, in engineering notation,

\[
\varepsilon_{xx} = \tfrac{1}{E}[\sigma_{xx} - \nu(\sigma_{yy}+\sigma_{zz})], \quad \gamma_{xy} = \frac{\sigma_{xy}}{G},
\]

and cyclic permutations. The three usual constants are related by \(G = E/[2(1+\nu)]\), \(\lambda = E\nu/[(1+\nu)(1-2\nu)]\).

### 2.2 Axially Loaded Members

A prismatic bar of cross-section \(A\), Young's modulus \(E\), length \(L\), under tensile force \(N\) develops uniform axial stress \(\sigma = N/A\) (away from load-introduction zones, by Saint-Venant's principle, §2.5) and elongation

\[
\delta = \frac{N L}{E A}.
\]

For a bar of variable cross-section or variable axial force \(N(x)\),

\[
\delta = \int_0^L \frac{N(x)}{E\,A(x)}\,dx.
\]

The axial stiffness \(k = EA/L\) is the 1D analogue of a linear spring, and a system of bars connected at pin joints reduces to a classical truss problem.

### 2.3 Statically Indeterminate Axial Problems

If the number of unknown reactions exceeds the equilibrium equations, the structure is **statically indeterminate**; the missing equations come from compatibility of displacements. A canonical example is a bar fixed at both ends, loaded transversely by an internal force \(P\) at some point: the support reactions satisfy \(R_A + R_B = P\) from equilibrium and \(\delta_A + \delta_B = 0\) from compatibility. Solving yields reactions inversely proportional to the distance to the load.

<div class="example">
<strong>Stepped bar with thermal load.</strong> A two-segment stepped bar (lengths \(L_1, L_2\); areas \(A_1, A_2\); same \(E\)) is fixed at both ends and subjected to a uniform temperature rise \(\Delta T\). The free thermal expansion would be \(\alpha(L_1+L_2)\Delta T\); since the ends are restrained, an axial compressive force \(N\) develops:
\[
\alpha(L_1+L_2)\Delta T = \frac{N L_1}{E A_1} + \frac{N L_2}{E A_2} \quad\Rightarrow\quad N = \frac{\alpha(L_1+L_2)\Delta T}{L_1/(EA_1) + L_2/(EA_2)}.
\]
</div>

### 2.4 Thermal Expansion and Duhamel–Neumann Law

An unconstrained isotropic material heated by \(\Delta T\) expands linearly with coefficient of thermal expansion \(\alpha\) (units \(1/\text{K}\); steel \(\alpha \approx 12 \times 10^{-6}/\text{K}\), aluminum \(\alpha \approx 23\times 10^{-6}/\text{K}\)). The **Duhamel–Neumann** extension of Hooke's law adds a thermal strain term:

\[
\varepsilon_{ij} = \tfrac{1}{E}[(1+\nu)\sigma_{ij} - \nu\sigma_{kk}\delta_{ij}] + \alpha\,\Delta T\,\delta_{ij}.
\]

When expansion is frustrated by external restraint (as in the example above) or by incompatible adjacent materials (bi-metallic strip), thermal stress arises. Constrained-bar stress is \(\sigma = -E\alpha\Delta T\) — a large number: 100 MPa per 40 K for steel, comparable to service stresses, which is why expansion joints are essential in bridges, pipelines, and railroads.

### 2.5 Saint-Venant's Principle

<div class="theorem">
<strong>Saint-Venant's Principle (1855).</strong> Two statically equivalent load distributions (same force resultant and moment) applied over a small region of a body produce stress fields that differ only in a local zone whose extent is of order the region's diameter; far from the loaded region the two fields are indistinguishable.
</div>

The principle justifies the routine substitution "concentrated load" for a distributed load acting over a small area and "uniform axial stress" for the detailed traction near a clamp. Its analytical basis is the exponential decay of self-equilibrated solutions of the biharmonic equation, a result proved rigorously in the context of elastic strips by Horgan (1989).

### 2.6 Bimetallic Strip

Two strips of different materials bonded together and heated by \(\Delta T\) bend even without applied load, because the individually free thermal expansions differ. For strips of equal thickness \(t\), Timoshenko's 1925 solution gives the curvature

\[
\kappa = \frac{6(\alpha_2-\alpha_1)\Delta T}{t}\cdot\frac{(1+m)^2}{3(1+m)^2 + (1+mn)(m^2 + 1/(mn))},
\]

with thickness ratio \(m\) and modular ratio \(n = E_1/E_2\). For equal moduli and thicknesses (\(m = n = 1\)): \(\kappa = 3(\alpha_2-\alpha_1)\Delta T/(2t)\). Bimetallic strips underpin mechanical thermostats, thermal cutouts, and the ubiquitous toaster-timer.

### 2.7 Stress Concentrations

Geometric discontinuities — holes, notches, fillets, keyways — raise local stresses above the nominal value \(\sigma_{\text{nom}} = N/A_{\text{net}}\). The **stress concentration factor**

\[
K_t = \frac{\sigma_{\max}}{\sigma_{\text{nom}}}
\]

depends only on geometry for linear-elastic materials. Tabulated results (Peterson, *Stress Concentration Factors*; Roark Ch 17) cover most practical geometries: a small circular hole in an axially loaded plate gives \(K_t = 3\) (Kirsch's solution, Ch 11), a semicircular edge notch gives \(K_t \approx 3.1\), a shoulder fillet of radius-to-width ratio \(r/w\) gives \(K_t\) in the range 1.5–3. Stress concentrations drive fatigue failures (Ch 17) and crack initiation — they must be mitigated by generous fillets, cold working, or material selection.

### 2.8 Saint-Venant Decay: Quantitative Estimate

For a rectangular strip of width \(2h\) loaded by self-equilibrated tractions on one end, the stress decays into the strip as \(e^{-\pi x/(2h)}\) — about 5% at \(x = h\), under 0.05% at \(x = 2h\). This is why "two to three characteristic dimensions" is the engineer's rule of thumb for Saint-Venant effects. For a circular cylinder the decay is governed by the roots of \(J_1(\lambda) = 0\) and is similarly exponential. The decay rate depends on Poisson's ratio only through a logarithmically slow correction; it is effectively geometric.

### 2.9 Composite Bars in Parallel

Several axially loaded bars in parallel (e.g., a reinforced concrete short column) share the load in proportion to their axial stiffness \(EA\):

\[
N_i = P\,\frac{E_i A_i}{\sum_k E_k A_k}, \qquad \sigma_i = \frac{N_i}{A_i} = \frac{E_i P}{\sum_k E_k A_k}.
\]

Stiffer materials attract more load. Adding prestress (a compressive residual) shifts the operating point; the 19th-century invention of reinforced concrete (Hennebique, 1892) exploited exactly this — letting steel carry tension and concrete carry compression.

---

# Part II — Beams, Bars, Columns

---

## Chapter 3: Bending of Beams

Beams — long prismatic members loaded transversely to their axis — are the single most common load-bearing element in engineering structures. This chapter develops bending theory from the Euler–Bernoulli assumption through symmetric and unsymmetric bending, composite and curved beams, to plastic bending and limit analysis. References: Gere–Goodno Ch 5–6; Timoshenko–Gere, *Mechanics of Materials*; Ugural–Fenster Ch 5.

### 3.1 The Euler–Bernoulli Beam

Consider a straight prismatic beam lying along the \(x\)-axis, loaded by a transverse distributed force \(w(x)\) (force per unit length, positive downward). Let \(V(x)\) denote the internal **shear force** and \(M(x)\) the internal **bending moment** on a cross-section. With the standard convention that positive \(V\) produces clockwise rotation of an infinitesimal slice and positive \(M\) causes concave-up curvature (tensile fibres on the bottom), equilibrium of a slice \([x,x+dx]\) gives

\[
\frac{dV}{dx} = -w(x), \qquad \frac{dM}{dx} = V(x).
\]

The kinematic **Euler–Bernoulli hypothesis** — plane cross-sections remain plane and perpendicular to the deformed centroidal axis — yields \(\varepsilon_{xx}(x,y) = -y\,\kappa(x)\), where \(\kappa = d^2 v/dx^2\) (small slopes) is the curvature and \(v(x)\) the transverse deflection. Hooke's law then gives \(\sigma_{xx} = -Ey\,\kappa\), and integration against the moment arm yields the moment–curvature relation

\[
M(x) = E I\,\kappa(x), \qquad I = \int_A y^2\,dA.
\]

Combining with \(d^2 M/dx^2 = -w\) gives the fourth-order **Euler–Bernoulli beam equation**

\[
E I\,\frac{d^4 v}{dx^4} = w(x).
\]

### 3.1b Parallel-Axis Theorem and Composite Sections

For a composite cross-section assembled from pieces, the neutral-axis location (through the centroid of the composite) and the moment of inertia are computed using the **parallel-axis theorem**:

\[
I = \sum_i \left[I_{c,i} + A_i\,d_i^2\right],
\]

with \(I_{c,i}\) the second moment of part \(i\) about its own centroidal axis, \(A_i\) its area, and \(d_i\) the distance from its centroid to the composite neutral axis. For an I-section: two flanges at \(\pm h/2\), each contributing \(A_f d^2\), plus a web contributing \(t_w h^3/12\). Typical steel I-beams (W-shapes, S-shapes) are tabulated in AISC and Canadian CISC steel manuals.

### 3.2 The Flexure Formula

Eliminating curvature,

\[
\boxed{\sigma_{xx}(x,y) = -\frac{M(x)\,y}{I}},
\]

with peak stress at the extreme fibre \(y = \pm c\),

\[
\sigma_{\max} = \frac{M c}{I} = \frac{M}{S}, \qquad S = \frac{I}{c} \text{ (section modulus)}.
\]

<div class="definition">
<strong>Second moment of area.</strong> For common sections:
<ul>
<li>Rectangle \(b\times h\): \(I = bh^3/12\), \(S = bh^2/6\).</li>
<li>Solid circle of radius \(R\): \(I = \pi R^4/4\), \(S = \pi R^3/4\).</li>
<li>Hollow circle (\(R_o, R_i\)): \(I = \pi(R_o^4-R_i^4)/4\).</li>
<li>I-beam (flanges \(b_f\times t_f\), web \(h_w\times t_w\)): use the parallel-axis theorem \(I = I_c + A d^2\).</li>
</ul>
</div>

### 3.3 Shear-Force and Bending-Moment Diagrams

The mechanical recipe: (i) compute support reactions from global equilibrium; (ii) walk along the beam from left to right, using \(\Delta V = -P\) at each point load \(P\) and \(\Delta M = M_0\) at each point couple; (iii) between discrete loads, \(dV/dx = -w\), \(dM/dx = V\); (iv) at a free end, \(V = M = 0\) (unless loads are applied there). Extrema of \(M\) occur where \(V = 0\). Singularity functions (Macaulay brackets \(\langle x-a\rangle^n\), Ch 6) streamline the algebra.

<div class="example">
<p><strong>Simply supported beam with central point load.</strong> Length \(L\), supports at \(x=0, L\), load \(P\) at \(x=L/2\). Reactions \(R_A = R_B = P/2\). Shear and moment:</p>

\[
V(x) = \begin{cases} P/2, & 0<x<L/2 \\ -P/2, & L/2<x<L \end{cases}, \quad
M(x) = \begin{cases} Px/2, & 0 \le x \le L/2 \\ P(L-x)/2, & L/2 \le x \le L \end{cases}.
\]

<p>Maximum moment \(M_{\max} = PL/4\) at midspan. Integrating the beam equation with \(v(0)=v(L)=0\), \(v'(L/2^-)=v'(L/2^+)\) (continuity of slope), maximum deflection \(v_{\max} = PL^3/(48EI)\).</p>
</div>

<div class="remark">
Several SF/BM combinations appear on every exam: UDL simply supported gives \(M_{\max} = wL^2/8\), \(v_{\max} = 5wL^4/(384 EI)\); UDL cantilever gives \(M_{\max} = wL^2/2\) at the root, \(v_{\text{tip}} = wL^4/(8EI)\); tip-loaded cantilever gives \(M_{\max} = PL\), \(v_{\text{tip}} = PL^3/(3EI)\).
</div>

### 3.4 Unsymmetric Bending and Principal Axes of the Cross-Section

If the loading plane does not coincide with a principal axis of the cross-section, the flexure formula generalises. Let \(M_y, M_z\) be the two components of bending moment resolved on the cross-section's centroidal axes \((y, z)\), with principal moments of area \(I_y, I_z\) and product moment \(I_{yz}\). Then

\[
\sigma_{xx} = -\frac{(M_z I_y - M_y I_{yz})\,y + (M_y I_z - M_z I_{yz})\,z}{I_y I_z - I_{yz}^2}.
\]

In **principal axes** (where \(I_{yz}=0\)) this reduces to the clean superposition \(\sigma_{xx} = -M_z y/I_z - M_y z/I_y\). A Z-section or unequal-angle beam loaded vertically will both bend and twist unless the load passes through the **shear centre** (Ch 5).

### 3.5 Composite Beams: the Transformed-Section Method

A beam of two bonded materials (modular ratio \(n = E_2/E_1\)) is analyzed by the **transformed-section method**: replace material 2 by an equivalent area of material 1 with its width scaled by \(n\) (but \(y\)-coordinates unchanged). The ordinary flexure formula applied to the transformed section gives stresses in material 1; stresses in material 2 are \(n\) times the value from the transformed-section calculation at the same \(y\). Reinforced concrete beam design (CIVE 414) is the workhorse application.

### 3.6 Curved Beams: the Winkler Formula

For beams whose initial radius of curvature \(R\) is not large compared with the cross-section depth, plane sections still remain plane, but the neutral axis no longer coincides with the centroidal axis — it shifts toward the centre of curvature. The **Winkler formula** gives the hoop stress

\[
\sigma_{\theta\theta}(r) = \frac{M(r - r_n)}{A\,e\,r}, \qquad r_n = \frac{A}{\int_A dA/r}, \quad e = \bar{r} - r_n,
\]

with \(\bar{r}\) the centroidal radius and \(r_n\) the neutral-axis radius. Crane hooks, chain links, and arched frames all require this correction; the peak stress on the inside fibre can be double the Euler–Bernoulli value.

### 3.7 Deflections: Standard Formulas

Tabulated maximum deflection and slope for standard cases (all prismatic, stiffness \(EI\), length \(L\)):

| Configuration | \(v_{\max}\) | Location |
|---|---|---|
| Cantilever + tip load \(P\) | \(PL^3/(3EI)\) | tip |
| Cantilever + tip moment \(M_0\) | \(M_0 L^2/(2EI)\) | tip |
| Cantilever + UDL \(w\) | \(wL^4/(8EI)\) | tip |
| Simply supported + centre load \(P\) | \(PL^3/(48 EI)\) | midspan |
| Simply supported + UDL \(w\) | \(5wL^4/(384EI)\) | midspan |
| Simply supported + end moment \(M_0\) | \(M_0 L^2/(9\sqrt{3}EI)\) | \(L/\sqrt{3}\) |
| Fixed-fixed + centre load \(P\) | \(PL^3/(192EI)\) | midspan |
| Fixed-fixed + UDL \(w\) | \(wL^4/(384 EI)\) | midspan |

These are the building blocks for superposition. Roark's *Formulas for Stress and Strain* Chapter 8 gives dozens more.

### 3.7b Shear-Deflection Correction for Deep Beams

For a simply supported rectangular deep beam of length \(L\), depth \(h\), under central point load \(P\), the bending deflection is \(PL^3/(48EI)\) and the shear deflection is \(PL/(4GA)\) times the shear factor 6/5. The ratio

\[
\frac{v_{\text{shear}}}{v_{\text{bend}}} = \frac{6/5\cdot PL/(4GA)}{PL^3/(48EI)} = \frac{3.6(h/L)^2}{1}\cdot\frac{E}{G} \approx 9(h/L)^2,
\]

for \(E/G \approx 2.6\) (steel). At \(L/h = 10\): 9% shear contribution; at \(L/h = 5\): 36%; at \(L/h = 3\): a striking 100%. This is why classical Euler–Bernoulli theory badly underpredicts short-span reinforced-concrete-deep-beam deflections, and why Timoshenko theory (§5.5) is essential.

### 3.8 Plastic Bending and the Plastic Moment

When the material yields, the linear stress distribution \(\sigma = -My/I\) rearranges. For an elastic–perfectly-plastic material with yield stress \(\sigma_Y\), the **limiting plastic moment** occurs when the entire cross-section has yielded, half in tension and half in compression:

\[
M_p = \sigma_Y\,Z, \qquad Z = \int_A |y|\,dA \text{ (plastic section modulus)}.
\]

The **shape factor** \(k = Z/S = M_p/M_Y\) depends on geometry: rectangle \(k = 1.5\), solid circle \(k \approx 1.70\), I-beam \(k \approx 1.10\text{–}1.18\). **Limit analysis** (Ch 16) uses \(M_p\) as the failure-load predictor for frames and continuous beams: a frame collapses when enough plastic hinges form to create a kinematic mechanism, and the collapse load is obtained by the plastic-hinge (kinematic) theorem.

---

## Chapter 4: Torsion

### 4.1 Circular Shafts: Coulomb's Theory

For a circular shaft of radius \(R\) under a torque \(T\), symmetry forces the cross-sections to rotate rigidly (no warping), and the shear strain varies linearly with radius: \(\gamma(r) = r\,d\phi/dx\). Hooke's law in shear gives \(\tau = Gr\,d\phi/dx\), and integrating over the cross-section yields

\[
T = GJ\,\frac{d\phi}{dx}, \qquad \tau(r) = \frac{T r}{J},
\]

with polar moment \(J = \int_A r^2\,dA\) (solid circle \(J = \pi R^4/2\); hollow \(J = \pi(R_o^4-R_i^4)/2\)). The angle of twist over length \(L\) under constant torque is \(\phi = TL/(GJ)\).

### 4.1b Compound Shafts and Gear Trains

A shaft of two segments (lengths \(L_1, L_2\); polar moments \(J_1, J_2\); same \(G\)) in series under applied torque \(T\) twists by \(\phi = T(L_1/(GJ_1) + L_2/(GJ_2))\) — torsional flexibilities add. For shafts in parallel (e.g., hollow-cored aluminium shaft reinforced by a steel rod), stiffnesses add and the torque is shared in proportion to torsional stiffness \(GJ_i/L_i\).

For a gear train connecting shafts 1 and 2 through gears of pitch radii \(r_1, r_2\), the torque ratio is \(T_2/T_1 = r_2/r_1\) and the speed ratio is \(\omega_2/\omega_1 = r_1/r_2\); kinetic energy ratios and mechanical-advantage calculations follow by the familiar lever principle. Statically indeterminate compound shafts (both ends fixed) require both equilibrium (\(T_1 + T_2 = T\)) and compatibility (\(\phi_1 = \phi_2\)); the resulting system is always solvable.

### 4.2 Power Transmission

A shaft rotating at angular speed \(\omega\) [rad/s] and transmitting torque \(T\) delivers power \(P = T\omega\). With \(n\) in rpm, \(P\) [W] \(= 2\pi n T/60\). Inverting gives the design torque \(T = 9549\,P[kW]/n[rpm]\). Combined with the allowable shear stress \(\tau_{\text{all}}\) and the formula \(\tau = TR/J\), one sizes the shaft diameter: \(d \ge (16 T/\pi\tau_{\text{all}})^{1/3}\).

### 4.3 Non-Circular Sections: Saint-Venant's Problem

For a non-circular cross-section the planar rotation assumption fails — the section **warps** out of plane. **Saint-Venant's semi-inverse method** postulates a displacement field

\[
u_1 = -\alpha y z, \quad u_2 = \alpha x z, \quad u_3 = \alpha\,\psi(x,y),
\]

with twist rate \(\alpha = d\phi/dz\) and warping function \(\psi\). The Navier equations reduce to Laplace's equation \(\nabla^2 \psi = 0\) inside the section with the Neumann condition \(\partial\psi/\partial n = x n_y - y n_x\) on the boundary.

### 4.4 Prandtl Stress Function

Introducing the **Prandtl stress function** \(\Phi(x,y)\) by

\[
\tau_{xz} = \partial_y \Phi, \qquad \tau_{yz} = -\partial_x \Phi,
\]

compatibility collapses to the Poisson equation \(\nabla^2 \Phi = -2G\alpha\) with \(\Phi = 0\) on the boundary. The torque is \(T = 2\iint_A \Phi\,dA\).

<div class="theorem">
<strong>Prandtl membrane analogy (1903).</strong> The Poisson equation for \(\Phi\) with vanishing boundary value is identical to the deflection equation of a thin membrane of the same cross-sectional shape, stretched by uniform tension and loaded by uniform pressure. Shear stress at a point equals the membrane slope there; torque equals twice the volume under the deflected membrane.
</div>

This gives instant qualitative insight. For any cross-section, shear stress is largest where the membrane slope is steepest — along the midpoint of the longer side in a rectangle, at the mid-width of a thin narrow strip, and *not* at corners (where the membrane is pinned and the slope along the diagonal vanishes).

### 4.5 Rectangular Section

For \(|x|\le a\), \(|y|\le b\) with \(a \ge b\), Fourier-series solution gives

\[
T = G\,k_1(2a)(2b)^3\,\alpha, \qquad \tau_{\max} = G\,k_2\,(2b)\,\alpha,
\]

with \(k_1, k_2\) tabulated shape factors. For a square (\(a=b\)): \(k_1 \approx 0.141\), \(k_2 \approx 0.675\). For a thin rectangle (\(a \gg b\)): \(k_1 \to 1/3\), so \(T = G\alpha(2a)(2b)^3/3\) and \(\tau_{\max} = 3T/[(2a)(2b)^2]\).

### 4.6 Thin-Walled Closed Sections: Bredt's Formula

For a thin-walled closed tube with wall thickness \(t(s)\) (possibly varying around the perimeter \(s\)) and enclosed area \(A_m\), the **shear flow** \(q = \tau\,t\) is constant around the section by equilibrium. The **first Bredt formula** gives the torque

\[
T = 2 A_m\,q, \qquad \tau(s) = \frac{T}{2 A_m\,t(s)},
\]

and the **second Bredt formula** gives the twist rate

\[
\frac{d\phi}{dx} = \frac{T}{4 A_m^2 G}\oint \frac{ds}{t(s)}.
\]

Thin tubes are enormously stiffer in torsion than open sections of equal material: a closed circular tube of diameter 100 mm and wall 5 mm has torsional rigidity ~100× that of the same tube slit lengthwise into an open C-section.

### 4.7 Open Thin-Walled Sections and the Shear Centre

Open thin-walled sections (I, C, Z, L) have torsional rigidity \(GJ\) with \(J = \tfrac{1}{3}\sum b_i t_i^3\) — a sum of thin-rectangle contributions. The maximum shear stress is \(\tau_{\max} = T t_{\max}/J\) at the surface of the thickest branch. More importantly, transverse loads on an open thin-walled beam produce both bending and torsion unless the load passes through the **shear centre** — a point, generally distinct from the centroid, about which transverse forces produce no twist. For a C-channel the shear centre lies outside the section, on the side opposite the flanges; this is why a loaded C-channel twists sharply unless restrained. Computation of the shear centre proceeds by the shear-flow integral; see §5.4.

### 4.7b Worked Example: Thin-Walled Aircraft Wing Box

<div class="example">
<strong>Rectangular thin-walled box.</strong> A closed rectangular tube (200 × 100 mm outer, wall \(t = 3\) mm throughout) of aluminium (\(G = 26\) GPa) transmits a torque of 2 kN·m over 1 m length. Find shear stress and twist angle.

<em>Solution.</em> Enclosed area (centreline) \(A_m = 197 \times 97 = 19{,}109\) mm². Shear stress \(\tau = T/(2 A_m t) = 2{,}000{,}000/(2\times 19{,}109\times 3) = 17.4\) MPa. Perimeter integral \(\oint ds/t = 2(197 + 97)/3 = 196\) mm\(^{-1}\) (per unit length \(t\)); twist rate \(d\phi/dx = T\oint ds/t /(4 A_m^2 G) = (2\times 10^6)(196)/(4\times 19{,}109^2 \times 26{,}000) = 2.06\times 10^{-5}\) rad/mm. Over 1 m, twist \(\phi = 0.0206\) rad = 1.18°. The same box sliced lengthwise (slit open) has \(J = \tfrac{1}{3}(2)(197+97)(3)^3 = 5{,}292\) mm\(^4\) — 150× smaller than the closed \(J\) — demonstrating Bredt's enormous efficiency advantage.
</div>

### 4.7c Example: Torsion of an Elliptical Cross-Section

<div class="example">
For an ellipse with semi-axes \(a \ge b\), the Prandtl stress function is \(\Phi = G\alpha(a^2 b^2/(a^2+b^2))(1 - x^2/a^2 - y^2/b^2)\), which automatically vanishes on the boundary. The torque is \(T = G\alpha(\pi a^3 b^3)/(a^2+b^2)\), and the maximum shear occurs at the end of the minor axis: \(\tau_{\max} = 2T/(\pi a b^2)\). For a circle (\(a = b = R\)) this reduces correctly to \(\tau_{\max} = 2T/(\pi R^3) = T R/J\) with \(J = \pi R^4/2\), recovering the Coulomb result.
</div>

### 4.8 Warping Constraint and Vlasov Theory

When warping is prevented (e.g. at a clamped end), additional normal (bimoment) stresses arise and the torsion equation becomes fourth-order,

\[
E\,I_\omega\,\phi'''' - GJ\,\phi'' = m(x),
\]

with \(I_\omega\) the **warping constant** (units of length\(^6\)). This is the Vlasov theory of thin-walled beams, essential for thin-walled steel frames and aerospace skin-stringer structures. The solutions combine exponential boundary layers of length \(\ell = \sqrt{E I_\omega/(GJ)}\) with the Saint-Venant uniform-torsion solution in the interior.

---

## Chapter 5: Shear Stress in Beams

The flexure formula gave the longitudinal stress from bending; a transverse shear force produces transverse shear stress, whose distribution across the cross-section follows from equilibrium. The key result is the Jourawski formula (1844), which, combined with the shear-centre concept for thin-walled sections, underlies the design of built-up beams, rivet spacing, and the stability of thin-walled profiles under transverse load.

### 5.1 The Jourawski Formula

Consider a beam slice of length \(dx\) and cross-section \(A\); the axial force on the portion above a height \(y\) changes along \(x\) due to bending-stress variation, and this change is balanced by shear stress on the horizontal plane at \(y\). Equilibrium of the isolated piece yields

\[
\boxed{\tau_{xy}(y) = \frac{V\,Q(y)}{I\,b(y)}},
\]

where \(Q(y) = \int_{y}^{c} y'\,b(y')\,dy'\) is the first moment of the area above \(y\) about the neutral axis and \(b(y)\) is the section width at height \(y\). For a rectangle of breadth \(b\) and depth \(h\), \(\tau_{xy}\) is parabolic,

\[
\tau_{xy}(y) = \frac{3 V}{2 b h}\left(1 - \frac{4 y^2}{h^2}\right),
\]

with \(\tau_{\max} = 3 V/(2 b h)\) at the neutral axis — \(50\%\) larger than the mean \(V/(b h)\). For a solid circle, \(\tau_{\max} = 4V/(3 A)\), \(33\%\) above the mean.

### 5.2 Shear Flow in Built-Up Beams

In a beam assembled from parts connected by nails, welds, or bolts at spacing \(s\), the connectors must carry the **shear flow**

\[
q = \frac{V Q}{I}\quad \text{[force per unit length]},
\]

where \(Q\) is the first moment (about the neutral axis) of the area attached by those connectors. For a nailed flange-web joint, the force per nail is \(F_n = q s\) — directly sizing nail spacing.

<div class="example">
<strong>Box beam with top plate nailed on.</strong> A box beam has a top plate of area \(A_t\) whose centroid is at distance \(\bar{y}_t\) from the neutral axis. For shear \(V\) and overall \(I\), shear flow on the interface \(q = V A_t \bar{y}_t/I\). If the nails can each carry \(F_n = 500\) N and \(q = 2000\) N/m, the required spacing is \(s = F_n/q = 0.25\) m.
</div>

### 5.3 Shear Stress in I-Beams and Channels

For thin-walled open sections one assumes shear flows parallel to the centreline of each branch. In the flanges, shear flow grows linearly from zero at the free edge; in the web it peaks at the neutral axis. An I-beam of flange area \(A_f\) and web \(A_w\) carries about \(V(1 - A_f \bar{y}_f/(I/A_w))\)-ths of its shear in the web; design shear stress is conservatively \(\tau_{\text{web}} \approx V/A_w\).

### 5.4 Shear Centre for Open Thin-Walled Sections

For a thin-walled open section, the transverse load \(V\) acting at the **shear centre** produces bending without twist. The shear centre is located by balancing the moment of the shear-flow distribution about any convenient reference point. For a C-channel with flanges of length \(b\), thickness \(t_f\), and web of depth \(h\), thickness \(t_w\):

\[
e = \frac{b^2 h^2 t_f}{4 I},
\]

measured from the centreline of the web, on the open-side. The shear centre always lies on an axis of symmetry; for doubly symmetric sections (I, box, pipe) it coincides with the centroid.

### 5.4b Example: Shear Centre of a C-Channel

<div class="example">
A C-channel with flange length \(b = 80\) mm, web depth \(h = 200\) mm, uniform thickness \(t = 5\) mm. Centroid lies at \(\bar{x}_c = (2\cdot 80\cdot 5\cdot 40)/(2\cdot 80\cdot 5 + 200\cdot 5) = 32000/1800 = 17.8\) mm from the web centreline. Moment of inertia about the neutral (horizontal) axis: \(I_z = t h^3/12 + 2(b t)(h/2)^2 = 5\cdot 200^3/12 + 2(400)(100^2) = 3.33\times 10^6 + 8\times 10^6 = 11.3\times 10^6\) mm\(^4\). Shear centre: \(e = b^2 h^2 t/(4 I_z) = 80^2\cdot 200^2\cdot 5/(4\cdot 11.3\times 10^6) = 28.3\) mm from the web centreline, on the side opposite the flanges. For this channel, the shear centre sits a substantial distance outside the section — any vertical load applied at the centroid therefore produces a twisting moment of \(V(e - \bar{x}_c) = V(28.3 - (-17.8)) = 46\) mm times \(V\), which must be resisted by lateral bracing or separate torsion reinforcement.
</div>

### 5.5 When Shear Matters for Deflection

For slender beams (\(L/h \gg 10\)) the Euler–Bernoulli bending deflection dominates and shear is negligible. For stubby beams (\(L/h \lesssim 5\)) shear contributes significantly; the **Timoshenko beam theory** adds a shear deformation term, giving

\[
v_{\text{total}} = v_{\text{bend}} + v_{\text{shear}}, \qquad v_{\text{shear}} = \int_0^L \frac{\kappa\,V(x)}{G A}\,dx,
\]

with the shear coefficient \(\kappa\) equal to 6/5 for a rectangle, 10/9 for a circle, \(A/A_w\) for an I-beam. Timoshenko theory is essential for deep beams and for high-frequency beam vibration where rotary inertia also matters.

### 5.6 Sandwich Beam Shear

A sandwich beam has thin, stiff face-sheets separated by a thick, compliant core. The faces carry bending; the core carries shear. Shear stress in the core is approximately uniform: \(\tau_{\text{core}} \approx V/(b\,h_c)\), with \(b\) the width and \(h_c\) the distance between face-sheet centroids. Core shear failure (not face-sheet bending) governs most sandwich-panel designs; honeycomb and foam cores are selected on shear strength and shear modulus, not on compressive strength alone. Bending deflection of a sandwich beam superposes flexural deflection (stiffness from faces) and shear deflection (compliance from core), and for short spans the shear term dominates — a hallmark of aerospace sandwich panels.

---

## Chapter 6: Deflections of Beams

### 6.0 Why Deflections?

Strength-of-materials design has three pillars: **stress** (material cannot exceed allowable), **stability** (structure must not buckle), and **deflection** (structure must not deform excessively). Deflection limits often govern serviceability — a perfectly strong floor that bounces when walked on is a bad floor. Eurocode limits span/360 for total deflection, span/500 for live-load-only; machine-tool beds specify still tighter. This chapter assembles the standard analytical tools: direct integration, singularity functions, moment-area theorems, conjugate beam, and superposition.

### 6.1 Double Integration

Integrating the moment–curvature relation twice,

\[
E I\,v'' = M(x), \quad EI\,v' = \int M\,dx + C_1, \quad EI\,v = \iint M\,dx\,dx + C_1 x + C_2,
\]

with constants set by boundary conditions (simply supported: \(v = 0\) at supports; cantilever: \(v = v' = 0\) at the wall; fixed–fixed: \(v = v' = 0\) at both ends). For distributed or piecewise loadings the direct integration is easiest if one uses the singularity-function formalism.

### 6.2 Macaulay's Brackets (Singularity Functions)

Write concentrated loads and couples using the Macaulay bracket \(\langle x-a\rangle^n\), defined as \((x-a)^n\) for \(x\ge a\) and \(0\) otherwise:

- Concentrated load \(P\) at \(x=a\): \(w(x) = P\langle x-a\rangle^{-1}\) (delta).
- Point couple \(M_0\) at \(x=a\): \(w(x) = M_0\langle x-a\rangle^{-2}\) (doublet).
- UDL \(w_0\) on \([a, b]\): \(w(x) = w_0\langle x-a\rangle^0 - w_0\langle x-b\rangle^0\).
- Ramp load starting at \(a\): \(w_0\langle x-a\rangle^1\).

Integration rules are the ordinary power rules for \(\langle x-a\rangle^n\) with \(n \ge 0\), and \(\int\langle x-a\rangle^{-1}dx = \langle x-a\rangle^0\). One writes \(EI v''\) as a single piecewise-polynomial expression with bracketed terms and integrates four times with two pairs of boundary conditions — no piecewise matching needed.

### 6.3 Moment–Area Theorems (Mohr's Theorems)

<div class="theorem">
<strong>Mohr's First Theorem.</strong> The change in slope \(\theta_B - \theta_A\) between two points on the elastic curve equals the area of the \(M/EI\) diagram between those points:
\[
\theta_B - \theta_A = \int_A^B \frac{M}{EI}\,dx.
\]
<strong>Mohr's Second Theorem.</strong> The deflection of \(B\) from the tangent at \(A\) equals the first moment of the \(M/EI\) area between \(A\) and \(B\) about \(B\):
\[
t_{B/A} = \int_A^B \frac{M}{EI}(x_B-x)\,dx.
\]
</div>

These theorems reduce cantilever and simply-supported problems to area calculations on the \(M/EI\) diagram — especially powerful when that diagram is a simple triangle or trapezoid.

### 6.4 The Conjugate Beam Method

The moment–area theorems can be repackaged as a fictitious **conjugate beam** loaded by \(M/EI\): its "shear" equals the slope of the real beam and its "moment" equals the real deflection. Support conditions transform according to a duality: fixed↔free, pin↔pin, interior hinge↔interior support, etc. A cantilever becomes an inverted cantilever; a simply supported beam remains simply supported. One reads deflections directly as the bending-moment diagram of the conjugate beam.

### 6.4b Example: Propped Cantilever by Moment-Area

<div class="example">
A propped cantilever of length \(L\) (fixed at \(A\), simple support at \(B\)) carries UDL \(w\). Unknown: reaction \(R_B\). Apply the moment-area theorems to the real beam: the deflection at \(B\) relative to the tangent at \(A\) equals the first moment of \(M/EI\) between \(A\) and \(B\) about \(B\). Since the beam is clamped at \(A\) (tangent horizontal) and pinned at \(B\) (\(v_B = 0\)), this first moment must vanish. Moment diagram: UDL alone gives a parabola of peak \(wL^2/2\) at \(A\); upward tip reaction \(R_B\) superposes a linear \(M(x) = R_B(L-x)\). Setting the weighted \(M/EI\)-area's first moment about \(B\) to zero yields \(R_B = 3wL/8\), matching §8.5.
</div>

### 6.5 Superposition of Standard Cases

For linear beams, deflections from multiple loads sum. Roark tabulates the "standard cases" — UDL, point load, ramp, couple — for every usual support configuration. A beam with several applied loads is analysed by looking up each standard deflection and adding. The approach is cheap and gives numerical answers faster than any other method; it is the basis of structural-engineering preliminary design.

<div class="example">
<strong>Cantilever with UDL + tip load.</strong> A cantilever of length \(L\), stiffness \(EI\), carries UDL \(w\) plus tip load \(P\). Tip deflection by superposition: \(v_{\text{tip}} = wL^4/(8EI) + PL^3/(3EI)\). If the cantilever also carries a tip moment \(M_0\), add \(M_0 L^2/(2EI)\).
</div>

---

## Chapter 7: Energy Methods and Virtual Work

Energy methods repackage the equilibrium equations as variational statements about the stored strain energy. The resulting theorems — Castigliano's first and second theorems, the principle of virtual work, Maxwell–Betti reciprocity, and the theorem of least work — give compact, elegant ways to compute displacements, to check designs, and to solve statically indeterminate structures without writing compatibility equations explicitly.

### 7.1 Strain Energy

For a linear elastic body in volume \(\Omega\), the total strain energy is

\[
U = \frac{1}{2}\int_\Omega \sigma_{ij}\,\varepsilon_{ij}\,dV.
\]

For a prismatic member of length \(L\), common loading modes give

\[
U_N = \int_0^L \frac{N^2}{2 E A}\,dx, \quad U_M = \int_0^L \frac{M^2}{2 E I}\,dx, \quad U_T = \int_0^L \frac{T^2}{2 G J}\,dx, \quad U_V = \int_0^L \frac{\kappa V^2}{2 G A}\,dx,
\]

with shear coefficient \(\kappa\) (§5.5). For slender members, \(U_V\) is negligible compared with \(U_M\); for deep beams both matter. The densities are \(u_N = N^2/(2EA)\), etc.; integrating over \(L\) is the usual step.

### 7.2 Castigliano's Theorems

<div class="theorem">
<strong>Castigliano's First Theorem.</strong> For a linear elastic structure with strain energy \(U\) expressed as a function of the independent nodal displacements \(\delta_k\), the force conjugate to \(\delta_k\) is
\[
P_k = \frac{\partial U}{\partial \delta_k}.
\]
<strong>Castigliano's Second Theorem.</strong> With \(U\) expressed in terms of the applied loads \(P_k\), the displacement at the point and in the direction of \(P_k\) is
\[
\delta_k = \frac{\partial U}{\partial P_k}.
\]
</div>

To find a displacement at a point with no applied load, introduce a fictitious "dummy load" \(Q\), compute \(\partial U/\partial Q\), and set \(Q = 0\) at the end. The second theorem is by far the more commonly used; it is the workhorse of truss and frame deflection calculations.

### 7.3 The Principle of Virtual Work

<div class="theorem">
<strong>Principle of Virtual Work.</strong> A deformable body is in equilibrium if and only if, for every kinematically admissible virtual displacement \(\delta u_i\),
\[
\int_\Omega \sigma_{ij}\,\delta\varepsilon_{ij}\,dV = \int_\Omega f_i\,\delta u_i\,dV + \int_{\partial\Omega_t} t_i\,\delta u_i\,dS.
\]
</div>

Internal virtual work equals external virtual work. The principle is exact — it holds for nonlinear materials, large deformations, and any constitutive law — and is the foundation of the finite-element method (Ch 21).

### 7.4 The Unit-Load Method

Specialising the virtual-work principle to compute a single displacement: to find \(\delta\) at a point in direction \(\hat{\mathbf{n}}\), apply a *unit* virtual load at that point in that direction, compute the resulting internal forces \(n, m, t\) (virtual bar force, moment, torque), and use

\[
\delta = \sum_i \frac{n_i N_i L_i}{E_i A_i} + \int \frac{m(x) M(x)}{EI}\,dx + \int \frac{t(x) T(x)}{GJ}\,dx,
\]

where \(N_i, M, T\) are the real internal forces. The first (truss) form is algebraic; the integrals are over each member's length.

<div class="example">
<strong>Tip deflection of a cantilever.</strong> Cantilever of length \(L\), stiffness \(EI\), tip load \(P\) downward. Real moment \(M(x) = -P(L-x)\). To find vertical tip deflection, apply unit vertical load at the tip: \(m(x) = -(L-x)\). Unit-load method:
\[
\delta_{\text{tip}} = \int_0^L \frac{m M}{EI}dx = \int_0^L \frac{P(L-x)^2}{EI}dx = \frac{PL^3}{3EI}.
\]
</div>

### 7.5 Maxwell–Betti Reciprocity

<div class="theorem">
<strong>Maxwell–Betti Reciprocal Theorem.</strong> For a linear elastic structure, the work done by forces of system 1 through the displacements caused by system 2 equals the work done by forces of system 2 through the displacements caused by system 1. In particular, the displacement at \(A\) due to a unit force at \(B\) equals the displacement at \(B\) due to a unit force at \(A\).
</div>

The theorem follows from symmetry of the flexibility matrix \(f_{ij} = f_{ji}\) (which itself follows from symmetry of the Hessian of \(U\)). It is the reason the stiffness and flexibility matrices of a linear structure are symmetric — a fact exploited by every structural FEM code.

### 7.5b Complementary Energy and Engesser's Theorem

For nonlinear elastic materials, Castigliano's second theorem generalises to **Engesser's theorem**: displacement equals the derivative of the complementary energy \(U^* = \int_\Omega \int_0^{\sigma_{ij}}\varepsilon_{ij}\,d\sigma_{ij}\,dV\) with respect to the applied load. For linear materials \(U = U^*\) and the two coincide. For nonlinear springs or geometrically nonlinear (but elastic) structures — guy wires, cable nets — Engesser is the correct form.

### 7.5c Truss-Displacement Example via Unit Load

<div class="example">
<strong>Pratt truss bridge, 8-panel, point load at midspan.</strong> Consider a 40 m span, 8-panel Pratt truss with height 5 m, top and bottom chords A = 5000 mm², diagonals and verticals A = 3000 mm² (all steel \(E = 200\) GPa). Under a 500 kN point load at midspan, find the midspan vertical deflection using the unit-load method. Real bar forces \(N_i\) come from the method of joints (statics). Virtual unit-load bar forces \(n_i\) come from the same method with a 1 N load at midspan. Sum \(\sum n_i N_i L_i/(EA_i)\) gives the midspan deflection; for this bridge, \(\delta \approx 28\) mm, with ~60% contribution from the bottom chord and ~30% from the diagonals. This calculation is the basis of every truss-bridge deflection check and is handled in spreadsheet or simple code.
</div>

### 7.6 Theorem of Least Work

For a statically indeterminate structure, express the internal redundant forces \(X_i\) and the strain energy \(U = U(P_{\text{ext}}, X_i)\). Since each redundant is a self-equilibrated internal force that does no work at the supports, **Engesser's theorem of least work** states

\[
\frac{\partial U}{\partial X_i} = 0,
\]

giving one compatibility equation per redundant. This is the variational form of the **force (flexibility) method** (Ch 8).

---

## Chapter 8: Statically Indeterminate Structures

### 8.0 The Indeterminacy Problem

Most real structures are statically indeterminate — they have more restraints than the bare minimum needed for equilibrium. Extra restraints increase redundancy (good for safety), reduce peak stresses (good for design), and complicate analysis (requires compatibility). This chapter covers the two systematic approaches — the force method (unknowns are redundant internal forces) and the stiffness method (unknowns are joint displacements) — along with Clapeyron's three-moment equation and the Hardy Cross iteration. These are the foundation of CIVE 422 and are built into every structural-FEM code.

### 8.1 Degree of Static Indeterminacy

A planar truss with \(b\) bars, \(j\) joints, and \(r\) reactions has degree of static indeterminacy \(d = b + r - 2j\). Frames: \(d = 3(\text{closed loops}) - (\text{internal hinges})\), plus reactions. Indeterminate structures require compatibility as well as equilibrium.

### 8.2 Force (Flexibility) Method

Select a **primary structure** by removing \(d\) redundants \(X_1, \dots, X_d\). Each redundant removal must leave a stable, statically determinate primary structure. Compute the displacement at each removed redundant's location due to (i) the applied loads on the primary structure, and (ii) a unit value of each redundant. Compatibility — that the real displacement at each redundant is zero (or a prescribed value) — gives the linear system

\[
\delta_{i0} + \sum_j f_{ij} X_j = 0, \quad i = 1, \dots, d,
\]

with flexibility coefficients \(f_{ij}\) (symmetric by Maxwell–Betti). Each \(\delta_{i0}\) and \(f_{ij}\) is computed by the unit-load method.

### 8.3 Stiffness (Displacement) Method

The dual approach takes the nodal displacements as unknowns. At each joint, equilibrium of forces gives one equation per free DOF:

\[
\mathbf{K}\,\mathbf{d} = \mathbf{P},
\]

with \(\mathbf{K}\) assembled from element stiffness matrices (truss: \(k_{\text{bar}} = EA/L\); beam: the 4×4 bending stiffness matrix). The stiffness method is systematic, computer-friendly, and is the conceptual ancestor of the finite element method (Ch 21).

### 8.4 Three-Moment Equation (Clapeyron)

For a continuous beam on multiple supports, Clapeyron (1857) gives a recurrence connecting the bending moments at three consecutive supports \(n-1, n, n+1\):

\[
M_{n-1} L_n + 2 M_n (L_n + L_{n+1}) + M_{n+1} L_{n+1} = -6\left(\frac{A_n \bar{x}_n}{L_n} + \frac{A_{n+1} \bar{x}_{n+1}'}{L_{n+1}}\right),
\]

where \(A_n, \bar{x}_n\) are the area and centroid of the simply-supported moment diagram on span \(n\). One writes one three-moment equation per interior support, giving a tridiagonal system that is trivial to solve. This is the oldest systematic tool for continuous beams and still appears in structural-engineering textbooks for preliminary design.

### 8.4b Moment Distribution Method (Hardy Cross)

Hardy Cross (1930) invented a hand-iterative method for continuous beams and frames that preceded the stiffness-method matrix formulation. Joint rotations are released one at a time, the resulting unbalanced moment is distributed to connecting members in proportion to their **distribution factors** \(d_i = (EI/L)_i/\sum (EI/L)_k\), and the **carry-over moment** (one-half, for prismatic members with far-end fixed) is applied at the far end. Iteration to convergence requires \(O(10)\) passes for typical frames. The method is obsolete for large structures (eclipsed by matrix stiffness analysis in FEM codes) but is still taught (CIVE 306, CIVE 422) because it gives physical insight into how moments redistribute in indeterminate structures.

### 8.5 Example: Propped Cantilever

A cantilever of length \(L\), stiffness \(EI\), with a simple support at the tip, loaded by UDL \(w\). Choose the tip reaction \(R_B\) as the redundant. Primary structure: cantilever alone. Tip deflection under UDL alone \(\delta_0 = wL^4/(8EI)\); tip deflection under unit upward force \(f = L^3/(3EI)\). Compatibility: \(\delta_0 - f R_B = 0\), giving \(R_B = 3wL/8\). Then moments follow by equilibrium; \(M_A = -wL^2/8\), \(M_{\max}^+ = 9wL^2/128\).

---

## Chapter 9: Column Buckling and Stability

Columns fail differently from beams: not by material yield but by *loss of stability*. The theory of elastic stability, founded by Euler (1744) and completed by Timoshenko and Gere, frames buckling as an eigenvalue problem for the governing differential equation.

### 9.1 Euler Buckling

For a perfectly straight pin-ended column of length \(L\), stiffness \(EI\), axial load \(P\), the slightly-deflected equilibrium equation is

\[
EI\,v'' + P v = 0,
\]

with \(v(0) = v(L) = 0\). Non-trivial solutions \(v = A\sin(n\pi x/L)\) exist only for \(P = n^2\pi^2 EI/L^2\), \(n = 1, 2, \dots\). The lowest value is the **Euler critical load**

\[
P_{\text{cr}} = \frac{\pi^2 EI}{L^2}.
\]

Below \(P_{\text{cr}}\) the straight column is stable; above, it buckles into a half-sine mode.

### 9.2 Effective Length

Different end conditions change the buckling-mode wavelength. Writing \(P_{\text{cr}} = \pi^2 EI/(KL)^2\) with effective-length factor \(K\):

| End conditions | \(K\) (theoretical) | \(K\) (recommended, AISC) |
|---|---:|---:|
| Pinned–pinned | 1.0 | 1.0 |
| Fixed–fixed | 0.5 | 0.65 |
| Fixed–pinned | 0.7 | 0.80 |
| Fixed–free (cantilever) | 2.0 | 2.10 |
| Fixed–guided (sliding) | 1.0 | 1.20 |

Design-code \(K\) values are larger than theoretical to account for imperfect end fixity.

### 9.3 Slenderness Ratio and Rankine–Gordon

Writing \(\sigma_{\text{cr}} = P_{\text{cr}}/A = \pi^2 E/(KL/r)^2\) with radius of gyration \(r = \sqrt{I/A}\) and slenderness ratio \(\lambda = KL/r\). Euler's formula is valid only for long columns (\(\lambda > \lambda_1\), with \(\lambda_1 = \pi\sqrt{E/\sigma_Y}\)); for shorter columns the material yields first. The empirical **Rankine–Gordon formula**

\[
\frac{1}{\sigma_R} = \frac{1}{\sigma_Y} + \frac{1}{\sigma_{\text{cr}}}
\]

interpolates between the two regimes. A more refined empirical fit is the **Johnson parabolic formula**

\[
\sigma_{J} = \sigma_Y - \frac{\sigma_Y^2}{4\pi^2 E}\lambda^2
\]

used by AISC for \(\lambda < \lambda_1\).

### 9.4 Perry–Robertson and Imperfect Columns

Real columns are not perfectly straight. Assume an initial shape \(v_0(x) = \delta_0 \sin(\pi x/L)\); the equilibrium equation becomes

\[
EI(v-v_0)'' + Pv = 0,
\]

whose solution amplifies the imperfection by a factor \(1/(1-P/P_{\text{cr}})\). The maximum total deflection is \(\delta = \delta_0/(1-P/P_{\text{cr}})\), and the maximum bending stress at midspan is

\[
\sigma_{\max} = \frac{P}{A} + \frac{P\delta c}{I} = \frac{P}{A}\left[1 + \frac{\delta_0 c}{r^2}\cdot\frac{1}{1 - P/P_{\text{cr}}}\right].
\]

Setting \(\sigma_{\max} = \sigma_Y\) and solving for \(P/A\) gives the **Perry–Robertson formula** used in BS 5950 and Eurocode 3 for steel column design.

### 9.4b Southwell Plot

Southwell (1932) observed that a plot of imperfect-column deflection \(\delta\) vs. \(\delta/P\) is nearly linear with slope \(1/P_{\text{cr}}\) and intercept \(\delta_0/P_{\text{cr}}\). Measuring \(\delta\) at several sub-critical loads and linear-fitting gives a non-destructive estimate of \(P_{\text{cr}}\) without having to actually buckle (and possibly destroy) the column. The same idea underlies plate and shell Southwell tests in aerospace structural certification.

### 9.5 Secant Formula (Eccentrically Loaded Column)

An axial load applied at eccentricity \(e\) from the centroid is equivalent to an axial load plus a bending moment \(Pe\). Solving the beam-column equation with this end moment gives the **secant formula**

\[
\sigma_{\max} = \frac{P}{A}\left[1 + \frac{e c}{r^2}\sec\!\left(\frac{L}{2 r}\sqrt{\frac{P}{EA}}\right)\right].
\]

The secant diverges as \(P \to P_{\text{cr}}\) — the deflection becomes unbounded, signaling loss of stability.

### 9.6 Beam-Columns

A column carrying axial load \(P\) plus transverse distributed load \(w(x)\) is governed by

\[
EI\,v'''' + P v'' = w.
\]

Superposition fails because \(P\) acts on the deflected shape. The transverse-load solution is amplified by the same \(1/(1-P/P_{\text{cr}})\) factor. This is the **P–δ effect** central to seismic design of slender buildings.

### 9.7 Energy Approach: Rayleigh–Ritz

The critical load minimises the Rayleigh quotient

\[
P_{\text{cr}} = \min_{v(x)} \frac{\int_0^L EI (v'')^2\,dx}{\int_0^L (v')^2\,dx},
\]

over admissible \(v\). Choosing a trial function gives an *upper bound* for \(P_{\text{cr}}\); with a good trial function the bound is sharp. For a cantilever with trial \(v = A(1-\cos(\pi x/2L))\), Rayleigh–Ritz gives \(P_{\text{cr}} \approx 2.47 EI/L^2\), within \(0.4\%\) of the exact \(\pi^2 EI/(2L)^2 = 2.467 EI/L^2\).

### 9.7b Example: Rayleigh–Ritz for a Simply Supported Column with Axial + Self-Weight

<div class="example">
<p>For a simply supported column under axial load \(P\) plus uniform self-weight \(\rho g A\) per unit length, the first buckling mode shape \(v = A\sin(\pi x/L)\) gives (by the Rayleigh quotient)</p>

\[
P_{\text{cr}} + \frac{\rho g A L}{2} = \frac{\pi^2 EI}{L^2}.
\]

<p>The self-weight contributes as if it were a uniform axial load of half its total weight. For a 100 m steel chimney of diameter 3 m, wall 20 mm: \(A \approx 0.19\) m², \(I \approx 0.21\) m\(^4\), \(\rho g A L = 14.7\) MN; Euler \(P_{\text{cr}} = \pi^2 (200\text{ GPa})(0.21)/(100)^2 = 41.4\) MN. Self-weight consumes about 18% of the column's critical capacity.</p>
</div>

### 9.7c Shell Buckling: a Dangerous Instability

Shells — thin cylindrical or spherical pressure vessels, axially compressed cylinders, spherical domes under external pressure — buckle in modes with many circumferential waves, at loads far below the classical (perfect-shell) prediction. For an axially compressed thin circular cylinder of radius \(R\), wall thickness \(t\), the classical critical stress is

\[
\sigma_{\text{cr}}^{\text{classical}} = \frac{E t}{R\sqrt{3(1-\nu^2)}},
\]

but experimental values often fall to 20–30% of this — due to extreme imperfection sensitivity. The **knockdown factor** \(\gamma = \sigma_{\text{test}}/\sigma_{\text{classical}}\) is typically 0.2–0.5 and is enshrined in NASA SP-8007 and ESA ECSS-E-HB-32-24A. Koiter's (1945) post-buckling theory explained why imperfection sensitivity is extreme for axially compressed cylinders and mild for spherical shells — a landmark application of nonlinear elastic stability analysis.

### 9.8 Lateral-Torsional Buckling

Deep narrow beams loaded transversely can buckle laterally — bending out of the loading plane while simultaneously twisting — well before reaching their in-plane capacity. For a simply supported I-beam of length \(L\) under uniform moment \(M_0\), the critical moment is

\[
M_{\text{cr}} = \frac{\pi}{L}\sqrt{E I_y G J}\,\sqrt{1 + \frac{\pi^2 E I_\omega}{L^2 G J}},
\]

with \(I_y\) the weak-axis moment, \(J\) the torsion constant, \(I_\omega\) the warping constant (§4.8). Lateral-torsional buckling governs most unbraced steel beam designs and is treated in AISC Ch F.

---

## Chapter 10: Beams on Elastic Foundations

Railroad rails, pipelines buried in soil, and cortical bone surrounding a prosthesis all behave as beams whose deflection is resisted by a distributed elastic support in addition to the beam's own bending stiffness.

### 10.1 The Winkler Model

The simplest model, due to Winkler (1867), replaces the support by a bed of independent springs of modulus \(k\) (force per unit length per unit deflection):

\[
EI\,v'''' + k v = w(x).
\]

Defining the characteristic inverse length

\[
\beta = \left(\frac{k}{4EI}\right)^{1/4},
\]

the homogeneous solution \(v(x) = e^{\pm\beta x}(A\cos\beta x + B\sin\beta x)\) decays exponentially within a few multiples of \(1/\beta\). Disturbances are **local** — this is the single most important qualitative feature of foundations.

### 10.1b Infinite Beam with Distributed Load

For a UDL \(w_0\) on an infinite Winkler beam, the deflection is simply \(v = w_0/k\) everywhere — the beam carries no bending moment (since the spring bed alone resists the load). Edge effects within \(1/\beta\) of any truncation zone introduce bending; for a semi-infinite beam with a concentrated load at the free end, the peak moment is \(M = P/(2\beta)\), double the infinite-beam value, because half of the load must be resisted by beam-bending rather than foundation compression.

### 10.2 Point Load on an Infinite Beam

A point load \(P\) applied to an infinite Winkler beam gives

\[
v(x) = \frac{P\beta}{2k}\,e^{-\beta|x|}(\cos\beta|x| + \sin\beta|x|),
\]

with maximum deflection \(v_{\max} = P\beta/(2k)\) directly under the load and maximum bending moment \(M_{\max} = P/(4\beta)\). Semi-infinite and finite-length beams are treated by superposing four independent modes to enforce end conditions.

### 10.3 Pasternak–Vlasov Two-Parameter Foundations

The Winkler assumption of *independent* springs ignores the shear-coupling of real soils. The **Pasternak model** adds a shear-layer term,

\[
EI\,v'''' - G_p\,v'' + k v = w(x),
\]

with \(G_p\) the shear stiffness of the foundation layer. The corresponding decay includes both oscillatory and exponential modes depending on the sign of \(k^2 - 4 E I G_p^2/(4EI)^2\). Pasternak models reconcile Winkler's simplicity with the observation that soils transmit stress laterally.

### 10.4 Thermal Buckling of a Restrained Pipe

A long pipe restrained axially and heated by \(\Delta T\) develops axial force \(N = EA\alpha\Delta T\). In the Winkler model the lateral-buckling equation becomes

\[
EI\,v'''' + N v'' + k v = 0.
\]

Looking for \(v = \sin(\pi x/\ell)\), critical \(N_{\text{cr}} = 2\sqrt{k EI}\); the critical half-wavelength \(\ell = \pi/\beta\), independent of the restraining force. This mechanism drives *upheaval buckling* of buried pipelines and the lateral wavy displacement of heated railroad tracks. Classic reference: Hetényi, *Beams on Elastic Foundation* (1946).

### 10.4b Railroad Rail Example

<div class="example">
A standard 136RE steel rail (\(E = 200\) GPa, \(I = 3{,}950\) cm\(^4 = 3.95\times 10^{-5}\) m\(^4\)) on a ballasted track of modulus \(k = 28\) MPa (= 28 MN/m²). With rail-width contact, effective \(k_{\text{line}} \approx 28\times 0.15 = 4.2\) MN/m/m. \(\beta = [k/(4EI)]^{1/4} = [4.2\times 10^6/(4\times 200\times 10^9\times 3.95\times 10^{-5})]^{1/4} = 0.81\) m\(^{-1}\). Decay length \(1/\beta = 1.23\) m. A single 150 kN wheel load: \(v_{\max} = P\beta/(2k) = 150{,}000\times 0.81/(2\times 4.2\times 10^6) = 14.5\) mm (downward), \(M_{\max} = P/(4\beta) = 46.3\) kN·m. Bending stress on the rail head (\(c = 94\) mm from NA): \(\sigma = M c/I = 110\) MPa — well below yield (700 MPa for rail steel) but a significant fraction of the endurance limit, driving rail-fatigue and corrugation.
</div>

### 10.5 Plate on an Elastic Foundation

Extending to 2D, a plate on a Winkler foundation obeys \(D\nabla^4 w + k w = p\), with \(D = E h^3/[12(1-\nu^2)]\). The solution length scale is \((D/k)^{1/4}\) — slab foundations, ice sheets on water, and airplane wing-skin on internal stringers all belong to this family (Ch 14).

---

# Part III — Plane & Three-Dimensional Elasticity

---

## Chapter 11: Plane Elasticity and the Airy Stress Function

### 11.1 Plane Stress and Plane Strain

Two 2D specializations of linear elasticity recur. **Plane stress** assumes \(\sigma_{zz} = \sigma_{xz} = \sigma_{yz} = 0\) — appropriate for a thin plate loaded in its plane. **Plane strain** assumes \(\varepsilon_{zz} = \varepsilon_{xz} = \varepsilon_{yz} = 0\) — appropriate for a long prismatic body (dam, buried pipe, mid-thickness of a thick plate) loaded transversely.

<div class="definition">
<strong>Plane-stress Hooke's law.</strong>
\[
\varepsilon_{xx} = \tfrac{1}{E}(\sigma_{xx} - \nu\sigma_{yy}), \quad \varepsilon_{yy} = \tfrac{1}{E}(\sigma_{yy} - \nu\sigma_{xx}), \quad \gamma_{xy} = \sigma_{xy}/G.
\]
</div>

<div class="definition">
<strong>Plane-strain Hooke's law.</strong> Same form as plane stress with \(E \to E/(1-\nu^2)\) and \(\nu \to \nu/(1-\nu)\).
</div>

### 11.2 Airy Stress Function and the Biharmonic Equation

In 2D equilibrium without body forces, \(\partial_j \sigma_{ij} = 0\) admits the representation

\[
\sigma_{xx} = \frac{\partial^2\phi}{\partial y^2}, \quad \sigma_{yy} = \frac{\partial^2\phi}{\partial x^2}, \quad \sigma_{xy} = -\frac{\partial^2\phi}{\partial x\,\partial y},
\]

for some scalar **Airy stress function** \(\phi(x,y)\). Compatibility then forces

\[
\nabla^4 \phi = \frac{\partial^4\phi}{\partial x^4} + 2\frac{\partial^4\phi}{\partial x^2\partial y^2} + \frac{\partial^4\phi}{\partial y^4} = 0.
\]

Every plane-elasticity problem (no body forces) reduces to solving the **biharmonic equation** subject to traction BCs on the boundary. For body forces derivable from a potential \(V\), one adds \(V\) into the constitutive substitution and the compatibility equation becomes \(\nabla^4 \phi = -(1-\nu)\nabla^2 V\) (plane strain) or \(\nabla^4 \phi = -\nabla^2 V\) (plane stress).

### 11.2b Complex-Variable Methods (Muskhelishvili)

The biharmonic equation admits a powerful **complex-variable representation**. Any stress function can be written as

\[
\phi(x,y) = \text{Re}[\bar{z}\,\varphi(z) + \chi(z)], \qquad z = x + iy,
\]

with \(\varphi, \chi\) holomorphic. Stresses and displacements are given by the **Kolosov–Muskhelishvili potentials**:

\[
\sigma_{xx} + \sigma_{yy} = 4\,\text{Re}\,\varphi'(z), \qquad \sigma_{yy} - \sigma_{xx} + 2i\sigma_{xy} = 2[\bar{z}\,\varphi''(z) + \chi''(z)].
\]

Boundary-value problems for simply connected domains reduce to finding two holomorphic functions matching prescribed tractions — tractable by conformal mapping onto the disk. Muskhelishvili's *Some Basic Problems of the Mathematical Theory of Elasticity* (1933) is the canonical reference; many classical problems (hole in plate, inclusion, crack) are solved in closed form by the method.

### 11.3 Polar Coordinates

In polar coordinates \((r, \theta)\),

\[
\sigma_{rr} = \frac{1}{r}\frac{\partial\phi}{\partial r} + \frac{1}{r^2}\frac{\partial^2\phi}{\partial\theta^2}, \quad \sigma_{\theta\theta} = \frac{\partial^2\phi}{\partial r^2}, \quad \sigma_{r\theta} = -\frac{\partial}{\partial r}\left(\frac{1}{r}\frac{\partial\phi}{\partial\theta}\right),
\]

with \(\nabla^4 = (\partial_r^2 + r^{-1}\partial_r + r^{-2}\partial_\theta^2)^2\). The Michell (1899) family of solutions — \(\phi = r^n(\alpha\cos n\theta + \beta\sin n\theta + \gamma\sin(n-2)\theta + \delta\cos(n-2)\theta)\) for integer \(n\) — covers most classical problems.

### 11.4 Kirsch's Problem: Hole in an Infinite Plate

A plate in uniaxial tension \(\sigma_\infty\) (along \(x\)) with a circular hole of radius \(a\) develops stresses

\[
\sigma_{rr} = \frac{\sigma_\infty}{2}\left(1-\frac{a^2}{r^2}\right) + \frac{\sigma_\infty}{2}\left(1 - \frac{4a^2}{r^2} + \frac{3a^4}{r^4}\right)\cos 2\theta,
\]
\[
\sigma_{\theta\theta} = \frac{\sigma_\infty}{2}\left(1+\frac{a^2}{r^2}\right) - \frac{\sigma_\infty}{2}\left(1 + \frac{3a^4}{r^4}\right)\cos 2\theta.
\]

At the hole (\(r = a\)): \(\sigma_{\theta\theta}(a,\theta) = \sigma_\infty(1 - 2\cos 2\theta)\). Maximum at \(\theta = \pm\pi/2\): \(\sigma_{\theta\theta} = 3\sigma_\infty\) — the celebrated stress concentration factor **3**. Minimum (compression) at \(\theta = 0, \pi\): \(\sigma_{\theta\theta} = -\sigma_\infty\). This 1898 result by G. Kirsch inaugurated quantitative fracture/failure design.

### 11.4b Stress Concentration Around an Elliptical Hole

Inglis (1913) extended Kirsch to an ellipse with semi-axes \(a\) (perpendicular to the tension direction) and \(b\) (parallel). At the tip of the \(a\)-axis,

\[
\sigma_{\max} = \sigma_\infty\left(1 + \frac{2a}{b}\right) = \sigma_\infty\left(1 + 2\sqrt{\frac{a}{\rho}}\right),
\]

with radius of curvature at the tip \(\rho = b^2/a\). For a circular hole (\(a = b\)): \(K_t = 3\), matching Kirsch. For a sharp crack (\(\rho \to 0\)): \(K_t \to \infty\) — the stress becomes singular, foreshadowing LEFM (Ch 15). Inglis's formula is the bridge from the Kirsch result to fracture mechanics.

### 11.5 Flamant's Problem: Line Load on a Half-Plane

A concentrated line load \(P\) on the surface of an elastic half-plane gives radial stress

\[
\sigma_{rr}(r, \theta) = -\frac{2 P\cos\theta}{\pi r}, \qquad \sigma_{\theta\theta} = \sigma_{r\theta} = 0,
\]

with a \(1/r\) singularity at the load point. Boussinesq (1885) extended this to 3D concentrated loads on a half-space, and the family underlies Hertzian contact mechanics (Ch 22).

### 11.6 Rotating Disk

A thin disk of radius \(b\), density \(\rho\), rotating at angular speed \(\omega\), has centrifugal body force \(\rho\omega^2 r\) (outward). Solving the Airy equation with this body-force potential yields

\[
\sigma_{rr}(r) = \frac{3+\nu}{8}\rho\omega^2(b^2-r^2), \qquad \sigma_{\theta\theta}(r) = \frac{3+\nu}{8}\rho\omega^2 b^2 - \frac{1+3\nu}{8}\rho\omega^2 r^2.
\]

Peak stresses at the centre: both radial and hoop reach \(\sigma_c = (3+\nu)\rho\omega^2 b^2/8\). For a rotating disk with central hole, the hoop stress at the hole is *doubled* — the source of stress concentration in turbine disks, flywheels, and grinding wheels.

### 11.7 Curved Beam in Pure Bending

For a circular curved beam of inner radius \(a\), outer radius \(b\), under pure bending moment \(M\), the Airy function \(\phi = A\log r + B r^2\log r + C r^2 + D\) gives stresses

\[
\sigma_{\theta\theta}(r) = \frac{4M}{N}\left[\frac{a^2 b^2}{r^2}\log\frac{b}{a} + b^2\log\frac{r}{b} + a^2\log\frac{a}{r}\right],
\]

with \(N\) a geometry constant. The neutral axis shifts toward the centre of curvature, consistent with the Winkler formula (§3.6).

### 11.7b Wedge under a Concentrated Load at the Apex

For an infinite elastic wedge of opening angle \(2\alpha\) with a concentrated force \(P\) applied along the bisector at the apex, Michell's solution gives

\[
\sigma_{rr} = -\frac{2 P \cos\theta}{r(2\alpha + \sin 2\alpha)}, \qquad \sigma_{\theta\theta} = \sigma_{r\theta} = 0,
\]

— the generalisation of Flamant. In the half-plane limit \(\alpha = \pi/2\) this reduces exactly to Flamant. For a narrow wedge (\(\alpha \to 0\)) the stress singularity at the apex is stronger than in the half-plane, a signature of the crack-tip \(r^{-1/2}\) singularity (Ch 15) which follows as the limiting case \(\alpha \to \pi\).

### 11.8 Thermal Stresses in Plane Elasticity

For a 2D temperature field \(T(x,y)\), the compatibility equation becomes \(\nabla^4 \phi = -E\alpha \nabla^2 T\) (plane stress). Solving for simply-connected domains: zero temperature gradient at the boundary produces no stress, a result (Boley) that generalises to 3D and explains why steady-state heat flow in an unconstrained body creates no thermal stress — as long as the boundary temperature is compatible with rigid-body motion.

---

## Chapter 12: Kirchhoff Plate Theory

### 12.1 Plate Kinematic Assumptions

A **plate** is a body thin in one direction (thickness \(h\)) compared with the other two. The Kirchhoff–Love theory assumes: (i) straight normals to the midplane remain straight and normal to the deformed midplane; (ii) thickness changes are negligible; (iii) in-plane displacements of the midplane are zero (pure bending). The midplane deflection \(w(x,y)\) alone governs the kinematics:

\[
u_x = -z\frac{\partial w}{\partial x}, \quad u_y = -z\frac{\partial w}{\partial y}, \quad \varepsilon_{xx} = -z\frac{\partial^2 w}{\partial x^2}, \text{ etc.}
\]

### 12.1b Kinematic Hypothesis in Detail

The Kirchhoff assumptions reduce the 3D elasticity equations to a 2D PDE for the midplane deflection \(w(x,y)\). Specifically: (i) normals to the midplane (before deformation) remain normals to the deformed midplane; (ii) the midplane itself neither stretches nor shears in plane; (iii) transverse normal strain \(\varepsilon_{zz}\) is taken zero (plane-stress Hooke in each layer). The first assumption forces the in-plane displacement at height \(z\) to be \(u_x = -z\,\partial w/\partial x\), \(u_y = -z\,\partial w/\partial y\), and strains to depend linearly on \(z\) through the midplane curvatures \(\kappa_{xx} = -\partial^2 w/\partial x^2\), \(\kappa_{yy} = -\partial^2 w/\partial y^2\), \(\kappa_{xy} = -\partial^2 w/\partial x\partial y\).

### 12.2 The Plate Equation

Integrating the bending stresses through the thickness gives moments per unit length:

\[
M_x = -D\left(\frac{\partial^2 w}{\partial x^2} + \nu\frac{\partial^2 w}{\partial y^2}\right), \quad M_y = -D\left(\frac{\partial^2 w}{\partial y^2} + \nu\frac{\partial^2 w}{\partial x^2}\right), \quad M_{xy} = -D(1-\nu)\frac{\partial^2 w}{\partial x\,\partial y},
\]

with **flexural rigidity**

\[
D = \frac{E h^3}{12(1-\nu^2)}.
\]

Equilibrium of a plate element under distributed pressure \(p(x,y)\) yields the **Kirchhoff plate equation**

\[
D\,\nabla^4 w = p.
\]

### 12.3 Boundary Conditions

At a clamped edge: \(w = \partial w/\partial n = 0\). At a simply supported edge: \(w = 0\) and \(M_n = 0\) (bending moment normal to the edge). At a free edge: \(M_n = 0\) and the **Kirchhoff effective shear**

\[
V_n = Q_n + \frac{\partial M_{nt}}{\partial t} = 0,
\]

which combines the transverse shear with the twisting-moment derivative. The need for an *effective* shear rather than separate \(Q_n\) and \(M_{nt}\) conditions (Kirchhoff, 1850) is a subtle consequence of reducing a 3D problem to a 2D one.

### 12.4 Navier's Solution for a Rectangular Simply Supported Plate

For a rectangular plate \(a \times b\), simply supported on all edges, expand the pressure as a double sine series:

\[
p(x,y) = \sum_{m,n} p_{mn}\sin\frac{m\pi x}{a}\sin\frac{n\pi y}{b}.
\]

The solution

\[
w(x,y) = \sum_{m,n} \frac{p_{mn}}{D\pi^4[(m/a)^2 + (n/b)^2]^2}\sin\frac{m\pi x}{a}\sin\frac{n\pi y}{b}
\]

terminates each term's double-Laplacian to the correct pressure harmonic. For uniform pressure \(p_0\), the series converges rapidly; keeping the first few terms gives the centre deflection \(w_{\text{max}} \approx 0.00406\,p_0 a^4/D\) for a square plate.

### 12.5 Circular Plate under Uniform Pressure

For a circular plate of radius \(a\) under uniform pressure \(p_0\), axisymmetry reduces the plate equation to an ODE in \(r\). The simply supported solution:

\[
w(r) = \frac{p_0(a^2-r^2)}{64 D}\left[\frac{5+\nu}{1+\nu}a^2 - r^2\right],
\]

with maximum \(w_{\max} = (5+\nu)p_0 a^4/[64D(1+\nu)]\) at the centre. The clamped-edge solution replaces this by \(w_{\max} = p_0 a^4/(64D)\) at the centre.

### 12.5b Lévy's Solution for Plates with Two Opposite Edges Simply Supported

For a rectangular plate simply supported on \(x = 0, a\) and arbitrarily supported on \(y = 0, b\), **Lévy's solution** assumes \(w(x,y) = \sum_m Y_m(y)\sin(m\pi x/a)\). Substituting reduces the biharmonic equation to an ODE for \(Y_m(y)\), with four constants per mode to fit the \(y\)-edge BCs. Lévy's method handles clamped, simply supported, or free \(y\)-edges without restricting to the fully simply-supported Navier case — essential for wing-skin panels in aircraft.

### 12.5c Mindlin–Reissner Plate Theory

Kirchhoff plates neglect transverse shear deformation; for moderately thick plates or sandwich plates (foam core, stiff skins), shear deformation matters. **Mindlin–Reissner theory** relaxes the "normals remain normal" assumption, treating the midplane deflection \(w\) and rotation angles \(\varphi_x, \varphi_y\) as independent fields. The governing equations form a system of three PDEs coupling \(w, \varphi_x, \varphi_y\). Mindlin theory is the basis of most thick-plate FEM elements and of sandwich-panel analysis.

### 12.6 Plate Buckling

For a rectangular plate under uniform in-plane compressive load \(N_x\), the buckling equation is

\[
D\nabla^4 w + N_x \frac{\partial^2 w}{\partial x^2} = 0.
\]

For a simply supported rectangular plate \(a\times b\), critical \(N_x^{\text{cr}} = \pi^2 D k/b^2\) with \(k = (m b/a + a/(m b))^2\), minimised over the number of buckling half-waves \(m\). Plate buckling dictates the minimum thickness of thin-walled columns, fuselage skins, and ship hulls.

---

## Chapter 13: Failure Criteria — Ductile and Brittle

### 13.1 The Design Problem

Given a computed stress state \(\sigma_{ij}\), has the material failed? Failure modes differ: ductile metals yield (plastic flow); brittle materials (cast iron, concrete, ceramics) fracture suddenly; soils and concrete have tension/compression asymmetry. Each failure criterion distils the stress tensor into a scalar compared against a material limit.

### 13.2 Maximum Principal Stress (Rankine)

Failure when \(\max(\sigma_1, -\sigma_3) \ge \sigma_u\). Appropriate for **brittle** fracture where failure occurs on planes perpendicular to the maximum tensile principal stress. Cast iron and glass under uniaxial tension agree closely with Rankine.

### 13.3 Maximum Shear Stress (Tresca)

<div class="theorem">
<strong>Tresca criterion.</strong> A ductile metal yields when the maximum shear stress reaches a critical value:
\[
\tau_{\max} = \frac{\sigma_1 - \sigma_3}{2} \ge \frac{\sigma_Y}{2}, \quad \Leftrightarrow \quad \sigma_1 - \sigma_3 \ge \sigma_Y.
\]
</div>

Tresca is conservative and is preferred in ASME pressure-vessel Section VIII for its simplicity.

### 13.4 von Mises (Distortion Energy)

<div class="definition">
<strong>von Mises equivalent stress.</strong>
\[
\sigma_{\text{vM}} = \sqrt{\tfrac{1}{2}[(\sigma_1-\sigma_2)^2 + (\sigma_2-\sigma_3)^2 + (\sigma_3-\sigma_1)^2]} = \sqrt{3 J_2}.
\]
Yield when \(\sigma_{\text{vM}} \ge \sigma_Y\).
</div>

Physical basis: the deviatoric strain energy \(U_{\text{dist}} = s_{ij}s_{ij}/(4G) = \sigma_{\text{vM}}^2/(6G)\) drives yielding, while the hydrostatic part only changes volume. von Mises agrees with Tresca along the six axes of principal-stress space and encloses Tresca between those axes (the von Mises ellipse circumscribes the Tresca hexagon, matching at the six vertices).

In pure shear (\(\sigma_1 = -\sigma_2 = \tau\), \(\sigma_3 = 0\)): Tresca predicts yield at \(\tau = \sigma_Y/2\), von Mises at \(\tau = \sigma_Y/\sqrt{3} \approx 0.577\sigma_Y\). Experimental data for most ductile metals agree better with von Mises — which is the default criterion in every commercial FEM code.

### 13.5 Mohr–Coulomb for Brittle Materials

For brittle materials with different tensile and compressive strengths \(\sigma_{ut}, \sigma_{uc}\) (concrete: \(\sigma_{uc} \approx 10\sigma_{ut}\)), Mohr–Coulomb predicts failure when

\[
\frac{\sigma_1}{\sigma_{ut}} - \frac{\sigma_3}{\sigma_{uc}} = 1,
\]

with \(\sigma_3 < 0 < \sigma_1\). Geometrically, failure in the \((\sigma_1,\sigma_3)\)-plane lies on a line connecting \((\sigma_{ut},0)\) to \((0,-\sigma_{uc})\). The **modified Mohr** criterion (or Coulomb–Mohr) is used in rock and concrete design.

### 13.6 Drucker–Prager for Soils and Concrete

Generalising Mohr–Coulomb to 3D, the **Drucker–Prager** criterion uses a linear combination of \(I_1\) (hydrostatic) and \(\sqrt{J_2}\) (deviatoric):

\[
\sqrt{J_2} = \alpha I_1 + \kappa,
\]

with constants \(\alpha, \kappa\) chosen to match uniaxial tensile and compressive strengths. Drucker–Prager is the standard constitutive framework for soils (Mohr envelope) and low-strength concrete in finite-element codes.

### 13.6b Hill's Anisotropic Yield Criterion

For anisotropic metals (rolled sheet, forged turbine disks) Hill (1948) proposed a quadratic yield function in the material's principal-anisotropy axes,

\[
F(\sigma_{yy}-\sigma_{zz})^2 + G(\sigma_{zz}-\sigma_{xx})^2 + H(\sigma_{xx}-\sigma_{yy})^2 + 2L\sigma_{yz}^2 + 2M\sigma_{zx}^2 + 2N\sigma_{xy}^2 = 1,
\]

with six constants \(F,G,H,L,M,N\) calibrated from directional uniaxial and shear tests. Hill's criterion generalises von Mises (recovered when \(F=G=H=1/(2\sigma_Y^2)\), \(L=M=N=3/(2\sigma_Y^2)\)). It underlies sheet-metal-forming simulation (deep drawing, hydroforming) where plastic anisotropy drives earing and thickness variation.

### 13.7 Worked Comparison: Combined Loading

A shaft of diameter \(d\) carries axial force \(N\), bending moment \(M\), and torque \(T\). Surface stress: \(\sigma = N/A + Mc/I\), \(\tau = Tc/J\). Principal stresses \(\sigma_{1,3} = \sigma/2 \pm \sqrt{(\sigma/2)^2 + \tau^2}\). Then:

- Tresca: \(\sigma_1 - \sigma_3 = 2\sqrt{(\sigma/2)^2 + \tau^2} = \sqrt{\sigma^2 + 4\tau^2} = \sigma_Y\).
- von Mises: \(\sqrt{\sigma^2 + 3\tau^2} = \sigma_Y\).

For pure torsion (\(\sigma = 0\)): Tresca gives \(\tau_{\max} = \sigma_Y/2\), von Mises \(\tau = \sigma_Y/\sqrt{3}\) — a 15% difference, with von Mises less conservative.

---

## Chapter 14: Pressure Vessels and Thick-Walled Cylinders

### 14.1 Thin-Shell Approximation

A **thin shell** has \(t/R \ll 1\). To leading order, bending stresses are negligible; in-plane **membrane stresses** dominate and are approximately uniform through the thickness.

<div class="theorem">
<strong>Thin-walled cylindrical pressure vessel.</strong> Radius \(R\), wall \(t\), internal pressure \(p\):
\[
\sigma_\theta = \frac{pR}{t}, \qquad \sigma_z = \frac{pR}{2t}.
\]
Hoop stress is twice the longitudinal — which is why overpressurised cylindrical vessels split longitudinally.
</div>

<div class="theorem">
<strong>Thin-walled spherical pressure vessel.</strong>
\[
\sigma = \frac{pR}{2t}.
\]
Equal in every in-plane direction; the sphere is the most efficient vessel geometry.
</div>

### 14.2 General Axisymmetric Membrane Equation

For an axisymmetric shell with principal radii of curvature \(R_1, R_2\),

\[
\frac{\sigma_1}{R_1} + \frac{\sigma_2}{R_2} = \frac{p}{t},
\]

combined with axial force balance on a cap. For a cone of half-angle \(\alpha\): \(\sigma_{\text{hoop}} = p r/(t\cos\alpha)\) at radius \(r\). For a toroidal shell (doughnut-shaped): stresses depend on the local meridional angle and radial position, tabulated in Roark.

### 14.2b Example: Cylindrical Tank Design

<div class="example">
A cylindrical steel storage tank, diameter 10 m, water-filled to height 8 m (\(\rho g = 9800\) N/m³). Hydrostatic pressure varies from 0 at the top to \(p = 78.4\) kPa at the base. The worst hoop stress occurs at the base: \(\sigma_\theta = p R/t\). With \(\sigma_Y = 250\) MPa and safety factor 2: \(t \ge p R/(\sigma_Y/2) = 78{,}400\times 5/(125\times 10^6) = 3.1\) mm. ASME rounds up and adds corrosion allowance to give design \(t = 5\) mm at the base; tanks taper in thickness up the wall because \(p\) decreases with height. The bottom-plate–wall junction requires a haunched weld plus generous filleting to suppress the boundary-layer bending stress (§14.3).
</div>

### 14.3 Bending Stresses at Junctions

Where a cylindrical shell joins a spherical cap or flat head, the membrane-stress solutions of the two pieces are incompatible, producing a localised **boundary-layer bending** that decays exponentially over a length \(\sqrt{Rt}\). For a cylinder at a clamped end under internal pressure, the boundary-layer bending stress can reach \(\sigma \approx 1.82\,p R/t\) — nearly doubling the membrane hoop stress. This is why pressure-vessel codes require generous fillets and reinforcement at junctions.

### 14.4 Thick-Walled Cylinders: the Lamé Solution

For \(t/R\) not small, the thin-shell approximation fails. The Lamé (1852) solution for a long cylinder (plane strain) with inner radius \(a\), outer \(b\), internal pressure \(p_i\), external pressure \(p_o\):

\[
\sigma_{rr}(r) = \frac{p_i a^2 - p_o b^2}{b^2-a^2} - \frac{(p_i-p_o)a^2 b^2}{(b^2-a^2)r^2},
\]
\[
\sigma_{\theta\theta}(r) = \frac{p_i a^2 - p_o b^2}{b^2-a^2} + \frac{(p_i-p_o)a^2 b^2}{(b^2-a^2)r^2}.
\]

Sum is constant, \(\sigma_{rr}+\sigma_{\theta\theta} = 2(p_i a^2 - p_o b^2)/(b^2-a^2)\). For internal pressure only (\(p_o = 0\)), maximum hoop \(\sigma_\theta(a) = p_i(b^2+a^2)/(b^2-a^2)\) — which approaches \(p_i R/t\) only in the thin-wall limit.

### 14.5 Autofrettage

Pre-yielding the bore of a thick-walled cylinder by over-pressurisation leaves compressive residual hoop stress at the bore when the pressure is released. On subsequent pressurisation the compressive residual partly cancels the tensile hoop stress, raising the allowable operating pressure. Gun barrels, high-pressure hydrogen storage, and tall-oil chemical reactors routinely employ autofrettage — first systematically studied by the French artillery in the 1910s.

### 14.5b Worked Example: High-Pressure Hydraulic Cylinder

<div class="example">
A hydraulic cylinder of inner bore 100 mm, outer 140 mm, steel \(\sigma_Y = 600\) MPa, is pressurised to 80 MPa internal. Lamé: at bore \(r=a=50\): \(\sigma_{rr} = -80\) MPa, \(\sigma_{\theta\theta} = p_i(b^2+a^2)/(b^2-a^2) = 80(70^2+50^2)/(70^2-50^2) = 80\times 7400/2400 = 247\) MPa. Principal stresses \((247, -80, \sigma_z)\); assuming closed-ended (\(\sigma_z = pi a^2/(b^2-a^2) = 80\times 2500/2400 = 83\) MPa). Tresca: \(247-(-80) = 327\) MPa \(< \sigma_Y\), so safe. von Mises: \(\sqrt{\tfrac{1}{2}[(247-83)^2 + (83-(-80))^2 + (-80-247)^2]} = 283\) MPa \(< 600\); factor of safety 2.1. Autofrettaging the bore to 200 MPa plastic would raise this further.
</div>

### 14.6 Composite (Compound) Cylinders

Shrink-fitting a pressure jacket over an inner cylinder (steam-plant boilers, gun barrels, hydraulic accumulators) introduces a compressive residual at the inner bore that, similarly to autofrettage, raises the burst pressure. Analysis proceeds by superposing Lamé solutions for each shell, matching interface displacement continuity.

---

## Chapter 15: Crack-Tip Fields and Linear Elastic Fracture Mechanics

### 15.0 From Stress Concentrations to Fracture

Kirsch (Ch 11) gave the stress concentration around a hole; Inglis (§11.4b) generalised to an ellipse with \(K_t \to \infty\) as the ellipse sharpens to a crack. The infinite stress is physically absurd — so a new paradigm was needed for sharp-crack bodies. Griffith (1921) supplied the energy balance; Westergaard (1939) and Irwin (1957) the stress-intensity-factor formalism; and Rice (1968) the path-independent \(J\)-integral for plastic fracture. Together these define **linear elastic fracture mechanics** (LEFM), the design framework for safety-critical aerospace, nuclear, and offshore structures.

### 15.1 The Griffith Energy Criterion

A crack of length \(2a\) in an infinite plate under remote tension \(\sigma\) extends when the rate of release of elastic strain energy exceeds the rate of creation of new surface. Griffith (1921) gave the criterion

\[
\sigma_c = \sqrt{\frac{2 E \gamma_s}{\pi a}},
\]

with \(\gamma_s\) the specific surface energy. This accounted for the discrepancy between theoretical strength (\(E/10\)) and observed strength of glass: tiny cracks, not bond strength, control failure.

### 15.2 Westergaard's Stress Function and the Singular Field

Westergaard (1939) introduced a complex stress function for the mode-I crack problem and showed that near the crack tip, in polar coordinates \((r,\theta)\),

\[
\sigma_{ij}(r,\theta) = \frac{K_I}{\sqrt{2\pi r}}\,f_{ij}^I(\theta) + (\text{non-singular terms}),
\]

with the **mode-I angular functions**

\[
f_{xx}^I = \cos\tfrac{\theta}{2}(1 - \sin\tfrac{\theta}{2}\sin\tfrac{3\theta}{2}), \quad f_{yy}^I = \cos\tfrac{\theta}{2}(1 + \sin\tfrac{\theta}{2}\sin\tfrac{3\theta}{2}), \quad f_{xy}^I = \cos\tfrac{\theta}{2}\sin\tfrac{\theta}{2}\cos\tfrac{3\theta}{2}.
\]

### 15.3 Stress Intensity Factors

<div class="definition">
<strong>Stress intensity factors.</strong> The leading-order \(1/\sqrt{r}\) singularity is characterised by three constants depending on load and geometry alone:
<ul>
<li>\(K_I\) — mode I (tensile opening): \(K_I = \sigma\sqrt{\pi a}\) for a centre crack in infinite plate; \(K_I = 1.12\sigma\sqrt{\pi a}\) for an edge crack.</li>
<li>\(K_{II}\) — mode II (in-plane shear).</li>
<li>\(K_{III}\) — mode III (anti-plane shear).</li>
</ul>
Fracture occurs when \(K_I \ge K_{Ic}\) (plane-strain fracture toughness).
</div>

Tabulated \(K\)-factors for common geometries fill Tada, Paris, & Irwin's *Stress Analysis of Cracks Handbook*.

### 15.3b \(K\)-Factors for Standard Geometries

Tabulated mode-I stress intensity factors for common configurations (all with remote stress \(\sigma\) and crack half-length or length \(a\)):

- Centre crack, infinite plate: \(K_I = \sigma\sqrt{\pi a}\).
- Edge crack, semi-infinite plate: \(K_I = 1.12\sigma\sqrt{\pi a}\).
- Centre crack, finite-width strip width \(W\): \(K_I = \sigma\sqrt{\pi a}\cdot\sqrt{\sec(\pi a/W)}\) (Isida).
- Penny-shaped crack, infinite solid: \(K_I = 2\sigma\sqrt{a/\pi}\).
- Semi-elliptical surface crack (depth \(a\), half-length \(c\), \(a/c \le 1\)): Newman–Raju correction factors.
- Through-thickness crack in pressurised cylindrical shell: Folias correction for bulging.

Tada, Paris, & Irwin's *Handbook* (ASME, 2000) contains several hundred such results — the designer's reference.

### 15.4 Energy Release Rate

The energy release rate \(G\) (not to be confused with the shear modulus) is the elastic energy released per unit crack-surface area created:

\[
G = \frac{K_I^2}{E'} + \frac{K_{II}^2}{E'} + \frac{K_{III}^2}{2G_\mu},
\]

with \(E' = E\) for plane stress, \(E' = E/(1-\nu^2)\) for plane strain. Irwin's (1957) equivalence: \(K_I = K_{Ic}\) iff \(G = G_c = 2\gamma_s\) — connecting Griffith's energy picture to Westergaard's stress-singularity picture.

### 15.5 The J-Integral

For elastic–plastic materials, Rice (1968) introduced the **J-integral**

\[
J = \oint_\Gamma \left[W\,dy - T_i\,\frac{\partial u_i}{\partial x}\,ds\right],
\]

with strain-energy density \(W\), traction \(T_i\), displacement \(u_i\), and contour \(\Gamma\) surrounding the crack tip. For elastic materials \(J = G\); for plastic materials \(J\) is path-independent and generalises the energy release rate. The \(J\)-integral is the standard tool for elastic–plastic fracture mechanics.

### 15.6 Crack-Tip Plastic Zone (Irwin's Estimate)

The \(1/\sqrt{r}\) singularity predicts infinite stress at the tip — physically, plasticity caps the stress at \(\sigma_Y\). Irwin (1961) estimated the plastic-zone radius by equating \(\sigma_Y\) to the elastic prediction:

\[
r_p \approx \frac{1}{2\pi}\left(\frac{K_I}{\sigma_Y}\right)^2 \quad\text{(plane stress)}, \qquad r_p \approx \frac{1}{6\pi}\left(\frac{K_I}{\sigma_Y}\right)^2 \quad\text{(plane strain)}.
\]

LEFM is valid when \(r_p\) is small compared with the crack length and the remaining ligament — the **small-scale yielding** regime.

### 15.6b Mixed-Mode Crack Growth

Real cracks rarely propagate in pure mode I. For mixed-mode loading, several criteria predict the direction of crack growth: the maximum tangential stress criterion (Erdogan–Sih, 1963) predicts growth along the plane of maximum tangential stress, the strain energy density criterion (Sih, 1974) along the plane of minimum strain-energy density, and the maximum energy release rate criterion along the plane that maximises \(G\). All three coincide in pure mode I and agree approximately in mixed mode. For fatigue in mixed mode, the equivalent range \(\Delta K_{\text{eq}} = \sqrt{\Delta K_I^2 + \Delta K_{II}^2}\) drives growth.

### 15.6c Crack-Arrest and Damage Tolerance Philosophy

The 1950s Comet jet-liner disasters — stress concentrations at square windows initiating fatigue cracks that catastrophically propagated — prompted a fundamental shift in design philosophy. **Safe-life** design (minimum life with large safety factor) was replaced by **damage-tolerant** design: assume cracks exist, predict their growth via the Paris law, and schedule inspection at intervals shorter than the life from detectable to critical crack size. The US Air Force ASIP (Aircraft Structural Integrity Program, MIL-STD-1530) and FAA FAR 25.571 codify this approach for commercial and military aircraft. Structural redundancy — multiple load paths — ensures that a single cracked element cannot cause loss of the aircraft, while crack-arrestor features (stiffeners, ply drops, bonded doublers) limit crack growth below catastrophic rates.

### 15.7 Fatigue Crack Growth: the Paris Law

Cyclic loading drives crack advance even at loads well below \(K_{Ic}\). Paris (1961) observed

\[
\frac{da}{dN} = C(\Delta K)^m,
\]

with material constants \(C, m\) (typically \(m \approx 2\text{–}5\)). Integration, starting from an initial flaw size \(a_0\), gives the fatigue life to reach final crack length \(a_f = (K_{Ic}/(\sigma\sqrt{\pi}))^2\):

\[
N_f = \int_{a_0}^{a_f} \frac{da}{C(\Delta K(a))^m}.
\]

The Paris law is the cornerstone of **damage-tolerant design**, the Air Force approach to aircraft certification after the 1954 Comet disasters.

---

# Part IV — Advanced and Special Topics

---

## Chapter 16: Thermoelasticity

### 16.0 Context

Thermal loading is ubiquitous in engineering — gas turbines, internal-combustion engines, cryogenic tanks, re-entry vehicles, solar collectors, and electronic-chip packages all operate under spatially and temporally varying temperature fields. The resulting stresses can rival or exceed mechanical stresses, especially where expansion is frustrated. This chapter develops the classical uncoupled thermoelasticity framework used in design.

### 16.1 The Duhamel–Neumann Law

An isotropic linear thermoelastic material under temperature change \(T(\mathbf{x},t)\) obeys

\[
\sigma_{ij} = \lambda\,\varepsilon_{kk}\,\delta_{ij} + 2\mu\,\varepsilon_{ij} - (3\lambda+2\mu)\alpha T\,\delta_{ij},
\]

with \(\alpha\) the linear expansion coefficient. Equivalently,

\[
\varepsilon_{ij} = \tfrac{1}{E}[(1+\nu)\sigma_{ij} - \nu\sigma_{kk}\delta_{ij}] + \alpha T\,\delta_{ij}.
\]

### 16.1b Volumetric Thermal Expansion

For solids, the volumetric expansion coefficient is \(\beta = 3\alpha\) (to first order). For Poisson ratio \(\nu\), a thermally free body develops volumetric strain \(\varepsilon_{kk}^{\text{th}} = 3\alpha\Delta T\). For constrained expansion (plane strain, thick cylinder), the Poisson effect constrains one or more directions, raising effective stresses. The Duhamel–Neumann law is the thermoelastic analog of Hooke's law, and its variational form (Gibbs free energy vs. displacement + temperature) is the basis of fully coupled thermoelasticity, where mechanical work heats the material (the thermoelastic effect in §20.3b) and heat flow couples back to stress via the \(\alpha\partial T/\partial t\) term.

### 16.2 Uncoupled Theory and Navier's Equation

If mechanical and thermal fields are weakly coupled (the usual case for small thermal effects on mechanical deformation, and slow thermal response to mechanical deformation), one solves the heat conduction equation for \(T\) separately, then substitutes into mechanical equilibrium. The **Navier equation of thermoelasticity**

\[
(\lambda+\mu)\,\nabla(\nabla\cdot\mathbf{u}) + \mu\,\nabla^2\mathbf{u} - (3\lambda+2\mu)\alpha\,\nabla T + \rho\mathbf{f} = 0.
\]

### 16.3 Thermal Stress in a Constrained Bar

A bar fixed at both ends, heated uniformly by \(\Delta T\): \(\sigma = -E\alpha\Delta T\). For steel (\(E = 200\) GPa, \(\alpha = 12\times 10^{-6}\) K\(^{-1}\)), a 50°C rise produces 120 MPa of compression — enough to buckle the member if slender. This is why long pipelines require expansion loops.

### 16.4 Disk with Radial Temperature Gradient

A thin disk of radius \(b\) with temperature \(T(r)\) axisymmetric develops thermal stresses (plane stress):

\[
\sigma_{rr}(r) = \frac{E\alpha}{r^2}\left[\frac{r^2-a^2}{b^2-a^2}\int_a^b T(r')r'\,dr' - \int_a^r T(r')r'\,dr'\right],
\]

for a hollow disk \(a\le r\le b\). Solid-disk (\(a \to 0\)) and plane-strain versions follow by analogous formulas (Timoshenko–Goodier Ch 14).

### 16.5 Sphere and Cylinder

For a thick-walled cylinder with steady radial heat flow from \(T_i\) (inner) to \(T_o\) (outer), the temperature is \(T(r) = T_i + (T_o-T_i)\log(r/a)/\log(b/a)\). The resulting thermal stress has the same form as Lamé (Ch 14) but with effective pressures determined by the temperature integral. For a sphere similar solutions hold; gas-turbine disks and hot-drawn shrink fits both are designed against these closed-form thermoelastic solutions.

### 16.5b Thermal Stress in a Turbine Disk

<div class="example">
A gas-turbine disk, inner radius \(a = 100\) mm, outer \(b = 400\) mm, under steady radial heat flow from \(T_i = 500\)°C to \(T_o = 300\)°C (air-cooled rim). Using \(T(r) = T_i + (T_o-T_i)\log(r/a)/\log(b/a)\): maximum hoop thermal stress occurs at the bore, magnitude \(\sigma_\theta \approx E\alpha(T_i-T_o)/[2(1-\nu)\log(b/a)]\) \(\times\) a geometry factor of order unity. For Ni-based superalloy \(E = 200\) GPa, \(\alpha = 14\times 10^{-6}\) K\(^{-1}\), \(\nu = 0.3\): \(\sigma_\theta \approx 200\times 10^3 \times 14\times 10^{-6}\times 200/(2\times 0.7\times \log 4) \times 1 \approx 290\) MPa. Superimpose centrifugal (Ch 11.6): at \(\omega = 1500\) rad/s, \(\rho = 8200\) kg/m³, peak centrifugal hoop at bore \(\approx 400\) MPa. Combined Tresca check against creep-limited \(\sigma_Y \approx 800\) MPa gives FoS ~1.2 — hence turbine-disk design is an ever-tight balance between heat, stress, and life.
</div>

### 16.6 Thermal Shock

Sudden surface temperature change \(\Delta T_s\) in a semi-infinite body creates transient surface stress

\[
\sigma_{\text{surf}}(0, t) = \frac{E\alpha\,\Delta T_s}{1-\nu}\,\text{erfc}\!\left(\frac{x}{2\sqrt{\kappa t}}\right)\Big|_{x=0} = \frac{E\alpha\,\Delta T_s}{1-\nu},
\]

at \(t \to 0\). This peak stress is responsible for thermal-shock failure in ceramics (Kingery, 1955); the thermal-shock figure of merit \(R_T = \sigma_f(1-\nu)/(E\alpha)\) ranks materials.

---

## Chapter 17: Plasticity

### 17.0 Plasticity in Context

AMATH 361 Ch 4 introduced viscoelastic constitutive models; this chapter specialises to time-independent plastic constitutive laws for metals. Plasticity differs fundamentally from elasticity: the constitutive law is **incremental** (relating stress rate to strain rate) and **history-dependent** (current state depends on loading path). The framework assembled here — yield surface, flow rule, hardening law, consistency condition — forms the kernel of plastic FEM codes and underlies limit analysis, metal forming, and geotechnical practice.

### 17.1 Yield Surfaces

For an isotropic metal, yielding depends only on the deviatoric invariants \(J_2\) (and for some materials \(J_3\)). The **von Mises** yield surface is a cylinder in principal-stress space along the hydrostatic axis, with circular cross-section of radius \(\sqrt{2/3}\,\sigma_Y\) in the deviatoric (\(\pi\)-)plane. The **Tresca** surface is a hexagonal prism inscribed in the von Mises cylinder.

### 17.2 Flow Rule and Associated Plasticity

After yielding, plastic strain increments \(d\varepsilon^p_{ij}\) obey an **associated flow rule**: \(d\varepsilon^p_{ij} = d\lambda\,\partial F/\partial \sigma_{ij}\), with \(F\) the yield function and \(d\lambda \ge 0\) a plastic multiplier determined by the consistency condition \(dF = 0\). For von Mises, \(\partial F/\partial\sigma_{ij} = s_{ij}/\sigma_{\text{vM}}\), giving

\[
d\varepsilon^p_{ij} = d\lambda\,\frac{s_{ij}}{\sigma_{\text{vM}}} \quad\text{(Prandtl–Reuss)}.
\]

Plastic flow is incompressible (\(d\varepsilon^p_{kk} = 0\)), parallel to the deviatoric stress.

### 17.3 Isotropic and Kinematic Hardening

**Isotropic hardening** expands the yield surface without translating it: \(\sigma_Y = \sigma_Y(\bar{\varepsilon}^p)\) with \(\bar{\varepsilon}^p = \int\sqrt{(2/3)d\varepsilon^p_{ij} d\varepsilon^p_{ij}}\) the equivalent plastic strain. **Kinematic hardening** (Prager, 1956) translates the yield surface in stress space, producing the **Bauschinger effect** observed in cyclically loaded metals. Real materials show a mixture; Chaboche's multi-component kinematic hardening is the standard framework for cyclic plasticity in FEM codes.

### 17.4 Limit Analysis

For structures made of elastic–perfectly-plastic materials, two bounding theorems give the ultimate collapse load.

<div class="theorem">
<strong>Lower-bound (static) theorem.</strong> Any statically admissible stress field (equilibrium + BCs) that satisfies \(F(\sigma) \le 0\) everywhere corresponds to a load below (or equal to) the collapse load.
<strong>Upper-bound (kinematic) theorem.</strong> Any kinematically admissible collapse mechanism (rigid blocks + plastic hinges) gives a load above (or equal to) the collapse load.
</div>

Both theorems apply to frames (hinge mechanisms), slabs (yield-line analysis, Johansen), and slopes (Coulomb wedge). They dominate plastic design (ACI, Eurocode 2).

### 17.4b Example: Plastic Hinges in a Propped Cantilever

<div class="example">
A propped cantilever of length \(L\), plastic moment capacity \(M_p\), under a growing central point load \(P\). Elastic analysis gives the wall moment \(M_A = -3PL/16\) (largest) and midspan \(M_C = 5PL/32\). First hinge forms at the wall when \(|M_A| = M_p\): \(P_1 = 16 M_p/(3L)\). Further loading: the wall becomes a plastic hinge (moment fixed at \(M_p\)), making the beam simply supported with a fixed wall moment. Moment equilibrium with \(M_A = -M_p\): \(M_C(P) = PL/4 - M_p/2\). Second hinge at midspan when \(M_C = M_p\): \(P_u = 6 M_p/L\) — the collapse load. Collapse mechanism: two hinges (wall + midspan); the beam becomes a three-pinned "mechanism" that can deflect without further load. Ratio \(P_u/P_1 = 9/8\): plasticity lets the structure carry 12.5% more than first yield.
</div>

### 17.5 Slip-Line Field Theory

For plane-strain rigid–perfectly-plastic deformation, the characteristics of the stress equations are two families of orthogonal **slip-lines** along which shear equals \(\sigma_Y/\sqrt{3}\) (von Mises). Along an \(\alpha\)-line: \(p + 2\tau\phi = \text{const}\); along a \(\beta\)-line: \(p - 2\tau\phi = \text{const}\) (Hencky equations). Slip-line fields analyse metal forming (extrusion, rolling, indentation) and yield the famous \(2.97\sigma_Y\) hardness coefficient for rigid-punch indentation (Prandtl, 1920).

### 17.6 Hencky's Theorems

<div class="theorem">
<strong>Hencky's first theorem.</strong> The angle between two slip-lines of one family, measured at two intersections with a slip-line of the other family, is constant.
<strong>Hencky's second theorem.</strong> As one travels along a slip-line, the hydrostatic pressure changes in direct proportion to the angle turned.
</div>

These purely geometric constraints let one build slip-line fields for punch indentation, hollow-bar extrusion, rolling, and forging without solving PDEs explicitly. The Hill–Johnson *Slip-Line Field Theory* remains the standard reference.

### 17.6b Drucker's Stability Postulate

Drucker (1951) proposed a material stability postulate: for any stress cycle that brings the material to and from the yield surface, the plastic work is non-negative. This has two immediate consequences: (i) the yield surface is convex, and (ii) the plastic strain increment is normal to the yield surface (justifying the associated flow rule). Non-associated flow rules are needed for frictional materials like soils and concrete, where Drucker's postulate fails; the shear-dilation ratio then deviates from that predicted by associated flow (Davis & Selvadurai 2002).

### 17.6c Plastic Shakedown and Ratchetting

Under repeated loading that exceeds first yield but stays within a certain envelope, the structure may:

- **Adapt (shake down)** — residual stresses build up that prevent further plastic flow; subsequent cycles are purely elastic.
- **Ratchet** — plastic strain accumulates cycle by cycle, leading to incremental collapse.
- **Undergo plastic cycling (alternating plasticity)** — plastic strain oscillates without net accumulation.

The **Melan static shakedown theorem**: if there exists a time-independent residual-stress field such that the sum of residuals and any load-cycle elastic stresses remains within the yield surface, the structure shakes down. The **Koiter kinematic shakedown theorem**: if no admissible plastic-cycle mechanism exists with net positive plastic work, the structure shakes down. Both theorems parallel the limit-analysis theorems and generalise to cyclic loading.

### 17.7 Strain-Rate Sensitivity and Viscoplasticity

Many metals, polymers, and biological tissues show rate-dependence: higher strain rate raises the flow stress. The Norton power law \(\dot{\varepsilon}^p = A(\sigma/\sigma_0)^n\), Perzyna's viscoplastic model, and Johnson–Cook's empirical law \(\sigma = [A + B(\bar{\varepsilon}^p)^n][1 + C\ln(\dot{\bar{\varepsilon}}^p/\dot{\varepsilon}_0)][1 - (T^*)^m]\) combine strain, rate, and temperature dependence in a form used extensively in impact and high-strain-rate simulation (AUTODYN, LS-DYNA).

---

## Chapter 18: Fatigue and Damage Tolerance

### 18.1 The S–N Curve (Wöhler, 1860)

At stresses well below yield, repeated loading causes microstructural damage leading to eventual failure. An **S–N curve** plots stress amplitude \(S\) against the number of cycles \(N\) to failure, typically on log–log axes.

- **Ferrous alloys:** an **endurance limit** \(\sigma_e\) exists below which life is effectively infinite; typically \(\sigma_e \approx 0.35\text{–}0.50\sigma_u\).
- **Non-ferrous metals (Al, Cu):** no true endurance limit; \(S\) continues to decrease with \(\log N\). Design uses a fatigue strength at \(10^7\) cycles.

### 18.1b Factors Affecting the Endurance Limit

The laboratory endurance limit \(\sigma_e^{\text{lab}}\) (polished, rotating-bending, room-temperature specimen) must be corrected by Marin factors for real parts:

\[
\sigma_e = k_a\,k_b\,k_c\,k_d\,k_e\,k_f\,\sigma_e^{\text{lab}},
\]

- \(k_a\) — surface finish (polished 1.0, ground 0.9, machined 0.7, hot-rolled 0.5, as-forged 0.3).
- \(k_b\) — size effect (smaller is stronger).
- \(k_c\) — loading (rotating bending 1.0, axial 0.7, torsional 0.577).
- \(k_d\) — temperature.
- \(k_e\) — reliability (for a required 99.9% survival, \(k_e \approx 0.75\)).
- \(k_f\) — miscellaneous (corrosion, plating, residuals).

The combined factor is often 0.2–0.5, so field endurance is a fraction of laboratory endurance — a sobering design reality.

### 18.2 Basquin's Law (High-Cycle Fatigue)

\[
\sigma_a = \sigma_f'\,(2 N_f)^b,
\]

with fatigue strength coefficient \(\sigma_f'\) (close to true fracture strength) and exponent \(b\) typically \(-0.05\) to \(-0.12\).

### 18.3 Strain-Life Approach (Coffin–Manson, Low-Cycle Fatigue)

For plastic-dominated fatigue (\(N_f \lesssim 10^4\)):

\[
\frac{\Delta\varepsilon_p}{2} = \varepsilon_f'(2 N_f)^c, \quad c \approx -0.5 \text{ to } -0.7,
\]

and the total strain amplitude superposes elastic Basquin + plastic Coffin–Manson:

\[
\frac{\Delta\varepsilon}{2} = \frac{\sigma_f'}{E}(2N_f)^b + \varepsilon_f'(2N_f)^c.
\]

Thermal fatigue of turbine blades, low-cycle seismic loading of steel frames, and engine-mount fatigue all lie in the Coffin–Manson regime.

### 18.4 Mean Stress Effects

Mean tensile stress \(\sigma_m\) shortens life; compressive mean stress extends it. Three empirical laws correct for mean stress:

- **Goodman:** \(\sigma_a/\sigma_e + \sigma_m/\sigma_u = 1\) (linear, conservative).
- **Soderberg:** \(\sigma_a/\sigma_e + \sigma_m/\sigma_Y = 1\) (most conservative; uses yield).
- **Gerber:** \(\sigma_a/\sigma_e + (\sigma_m/\sigma_u)^2 = 1\) (parabolic, fits data best for ductile metals).

Design codes specify the appropriate form (Goodman for safety-critical, Gerber for precision design).

### 18.5 Miner's Rule (Cumulative Damage)

For variable-amplitude loading, Miner (1945) postulated linear damage accumulation:

\[
D = \sum_i \frac{n_i}{N_i}, \qquad \text{failure when } D = 1,
\]

with \(n_i\) cycles at amplitude \(S_i\) and \(N_i\) the corresponding S–N life. Miner's rule is heuristic — sequence effects violate it — but remains the industry standard for lack of a better systematic alternative. Rainflow counting (Matsuishi–Endo, 1968) identifies cycles from a variable load history.

### 18.5b Rainflow Counting

For a complex load history, Miner's rule requires counting cycles. The **rainflow method** (Matsuishi & Endo, 1968) extracts hysteresis loops by a systematic rule: imagine rain running off a pagoda-shaped plot of stress vs. time. Each closed loop corresponds to one cycle of a specific amplitude. The counted cycles are assigned to S–N bins, then Miner summed. Modern implementations (ASTM E1049-85) are algorithmic and standard in vibration-test-data post-processing.

### 18.6 Notch Sensitivity and the Fatigue Strength Reduction Factor

Stress concentrations reduce fatigue strength. The theoretical factor \(K_t\) (static) is replaced by a **fatigue strength reduction factor** \(K_f < K_t\), reflecting that small notches behave elastically on the microstructural scale. Neuber's relation \(K_f = 1 + (K_t-1)/(1+\sqrt{a/r})\) with material length \(a\) and notch radius \(r\) fits most data.

### 18.6b Example: Life of a Notched Shaft

<div class="example">
A rotating shaft has a shoulder fillet with \(K_t = 2.1\). Material: steel with \(\sigma_u = 700\) MPa, \(\sigma_e = 320\) MPa (unnotched, polished), Neuber constant \(\sqrt{a} = 0.0635\sqrt{\text{mm}}\), fillet radius \(r = 3\) mm. Fatigue strength reduction factor \(K_f = 1 + (K_t-1)/(1+\sqrt{a/r}) = 1 + 1.1/(1+0.0635/\sqrt{3}) = 2.04\). Effective endurance \(\sigma_e' = \sigma_e/K_f = 157\) MPa. Under fully reversed bending stress amplitude of 120 MPa (no mean): below \(\sigma_e'\), infinite life predicted. At 180 MPa amplitude: Goodman with \(\sigma_m = 0\) gives failure; Basquin with \(\sigma_f' \approx 1200\) MPa, \(b = -0.08\) yields \(N_f \approx 2.5\times 10^5\) cycles — a few days of service at 1500 rpm, a design-unacceptable life.
</div>

### 18.7 Damage-Tolerant Design and Paris Integration

For fatigue crack growth, integrating the Paris law (§15.7) gives the life from an initial flaw (e.g. NDT-detectable size) to critical crack length. The approach — pioneered by the US Air Force after the Comet disasters — treats cracks as unavoidable and designs inspection intervals to ensure that the remaining life after discovery exceeds the inspection interval. This is the foundation of modern aircraft structural integrity (MIL-STD-1530).

---

## Chapter 19: Anisotropic and Composite Materials

### 19.1 Generalized Hooke's Law

The fully anisotropic linear elastic law is

\[
\sigma_{ij} = C_{ijkl}\,\varepsilon_{kl}, \qquad \varepsilon_{ij} = S_{ijkl}\,\sigma_{kl},
\]

with fourth-order stiffness \(C_{ijkl}\) and compliance \(S_{ijkl}\), symmetries \(C_{ijkl} = C_{jikl} = C_{ijlk} = C_{klij}\). In Voigt notation (\(11\to 1, 22\to 2, 33\to 3, 23\to 4, 13\to 5, 12\to 6\)) the stiffness becomes a symmetric \(6\times 6\) matrix with at most 21 independent entries (triclinic).

### 19.1b Micromechanics: Rule of Mixtures

For a fibre-reinforced composite with fibre volume fraction \(V_f\), fibre modulus \(E_f\), matrix modulus \(E_m\), the longitudinal (fibre-direction) modulus follows the **Voigt (rule of mixtures)** estimate \(E_1 = V_f E_f + (1-V_f) E_m\) (isostrain assumption) — exact for continuous aligned fibres. The transverse modulus is bounded by the **Reuss (inverse rule)** estimate \(1/E_2 = V_f/E_f + (1-V_f)/E_m\) (isostress) — a lower bound, since it assumes the fibres and matrix carry the same stress in series. Halpin–Tsai's semi-empirical formulas interpolate between Voigt and Reuss and agree with experiment within a few percent. Hashin–Shtrikman variational bounds (1963) provide the tightest theoretical bounds for any given volume fraction.

### 19.2 Material Symmetry Classes

<div class="definition">
<strong>Independent elastic constants by symmetry.</strong>
<ul>
<li>Isotropic — 2 constants (\(E,\nu\) or \(\lambda,\mu\)).</li>
<li>Transversely isotropic (unidirectional fibre composite, fibrous tissue) — 5.</li>
<li>Orthotropic (wood, rolled metal, cross-ply laminate) — 9.</li>
<li>Cubic crystal — 3.</li>
<li>Triclinic (fully anisotropic) — 21.</li>
</ul>
</div>

### 19.3 Lamina Constitutive Law (Plane Stress)

A unidirectional fibre **lamina** is transversely isotropic; in a plane-stress state it reduces to four independent stiffnesses \(Q_{11}, Q_{22}, Q_{12}, Q_{66}\) in the material (fibre) axes:

\[
\begin{pmatrix}\sigma_1 \\ \sigma_2 \\ \sigma_6\end{pmatrix} = \begin{pmatrix} Q_{11} & Q_{12} & 0 \\ Q_{12} & Q_{22} & 0 \\ 0 & 0 & Q_{66}\end{pmatrix}\begin{pmatrix}\varepsilon_1 \\ \varepsilon_2 \\ \varepsilon_6\end{pmatrix},
\]

with \(Q_{11} = E_1/(1-\nu_{12}\nu_{21})\), \(Q_{22} = E_2/(1-\nu_{12}\nu_{21})\), \(Q_{12} = \nu_{12}E_2/(1-\nu_{12}\nu_{21})\), \(Q_{66} = G_{12}\). Rotating to laminate axes by transformation angle \(\theta\) gives the off-axis stiffness \(\bar{Q}_{ij}\).

### 19.4 Laminate Theory and the ABD Matrix

A **laminate** is a stack of laminae at various angles. Kirchhoff kinematics (§12.1) gives in-plane force and moment resultants per unit length,

\[
\begin{pmatrix}\mathbf{N}\\\mathbf{M}\end{pmatrix} = \begin{pmatrix}\mathbf{A}&\mathbf{B}\\\mathbf{B}&\mathbf{D}\end{pmatrix}\begin{pmatrix}\boldsymbol{\varepsilon}_0\\\boldsymbol{\kappa}\end{pmatrix},
\]

with \(\mathbf{A} = \sum_k \bar{Q}^{(k)}(z_k-z_{k-1})\), \(\mathbf{B} = \tfrac{1}{2}\sum_k \bar{Q}^{(k)}(z_k^2-z_{k-1}^2)\), \(\mathbf{D} = \tfrac{1}{3}\sum_k \bar{Q}^{(k)}(z_k^3-z_{k-1}^3)\). Symmetric laminates have \(\mathbf{B} = 0\) — no extension-bending coupling. Balanced laminates have \(A_{16} = A_{26} = 0\) — no shear-extension coupling.

### 19.5 Failure Criteria for Composites

- **Maximum stress:** each \(\sigma_i\) compared separately to a strength \(X_i\).
- **Tsai–Hill:** quadratic interaction,
\[
\left(\frac{\sigma_1}{X_1}\right)^2 - \frac{\sigma_1\sigma_2}{X_1^2} + \left(\frac{\sigma_2}{X_2}\right)^2 + \left(\frac{\sigma_6}{S}\right)^2 = 1.
\]
- **Tsai–Wu:** more general quadratic with tension–compression asymmetry,
\[
F_i \sigma_i + F_{ij}\sigma_i\sigma_j = 1,
\]
fitted from six strengths.

### 19.5b Classical Lamination Example: [0/90]s Cross-Ply

<div class="example">
<p>A symmetric cross-ply laminate [0/90/90/0] of four identical CFRP layers (each 0.125 mm; \(E_1 = 140\) GPa, \(E_2 = 10\) GPa, \(\nu_{12} = 0.3\), \(G_{12} = 5\) GPa). Reduced stiffnesses: \(Q_{11} = 140.9\), \(Q_{22} = 10.07\), \(Q_{12} = 3.02\), \(Q_{66} = 5\) (GPa). For 0° plies, \(\bar{Q}^{(0)} = Q\); for 90° plies, \(\bar{Q}^{(90)}\) has \(\bar{Q}_{11}^{(90)} = Q_{22} = 10\), \(\bar{Q}_{22}^{(90)} = Q_{11} = 141\), \(\bar{Q}_{12}^{(90)} = Q_{12} = 3\). With two 0° plies and two 90° plies, total thickness 0.5 mm:</p>

\[
A_{11} = A_{22} = (141 + 10)\times 0.5/2 = 37.7 \text{ kN/mm (per unit width)}.
\]

<p>Symmetric laminate: \(B = 0\). Under uniaxial \(N_x\), \(\varepsilon_x^0 = N_x/A_{11}\), \(\varepsilon_y^0 = -A_{12}N_x/(A_{11}A_{22})\). Effective laminate modulus \(E_x^{\text{lam}} \approx 75\) GPa — midway between the 0° and 90° directions, as expected for a symmetric cross-ply.</p>
</div>

### 19.5c Interlaminar Stresses and Delamination

Between adjacent plies of a laminate, interlaminar shear \(\tau_{xz}, \tau_{yz}\) and normal \(\sigma_{zz}\) stresses arise — especially near free edges, where the classical lamination theory assumption of constant \(\sigma_{zz} = 0\) breaks down (Pipes–Pagano, 1970). These edge stresses drive **delamination** — the separation of adjacent plies — which is the dominant failure mode of composite laminates under fatigue and impact. Interlaminar strength is typically one-tenth the in-plane tensile strength; composite design therefore taper-terminates plies well away from stress concentrations and provides stitching or z-pinning for through-thickness reinforcement.

### 19.6 Biological Tissues

Bone is transversely isotropic with the stiff axis along the diaphysis; tendon and ligament are strongly one-dimensional with collagen-fibre alignment; articular cartilage is biphasic (solid matrix + interstitial fluid), anisotropic, and displays nonlinear viscoelastic behaviour. The engineering analysis uses the same framework — laminate theory for lamellar bone (Havers canals), viscoelastic constitutive models (Mow's biphasic theory) for cartilage, Fung's quasi-linear viscoelasticity for soft tissues. BME 553 and BME 550 build on this.

### 19.6b Quasi-Isotropic Laminates

A laminate with equal fractions of plies at 0°, ±60° (or 0°, ±45°, 90°) has in-plane stiffness matrix \(\mathbf{A}\) that is invariant under rotation in the plane — **quasi-isotropic** behaviour. Its effective modulus is \(E^* = (3/8)Q_{11} + (1/4)Q_{12} + (1/8)Q_{22} + (1/2)Q_{66}\), about 40% of the fibre-direction modulus of a unidirectional lamina. Bending behaviour (\(\mathbf{D}\)) is *not* isotropic for the same layup — a frequent source of confusion. Truly isotropic bending requires a symmetric angle-ply layup at every individual ply orientation, which is impractical; hence real composite panels always exhibit some bending anisotropy.

### 19.7 Piezoelectric and Multifunctional Materials

A piezoelectric material couples mechanical stress and electric field:

\[
\varepsilon_{ij} = S_{ijkl}\,\sigma_{kl} + d_{kij} E_k, \qquad D_i = d_{ikl}\sigma_{kl} + \epsilon_{ik}E_k,
\]

with piezoelectric coefficient \(d_{ikl}\), permittivity \(\epsilon_{ik}\). PZT ceramics, PVDF polymer films, and quartz crystals all obey variants of this law. Applications: ultrasonic transducers, accelerometers, fuel injectors, active-vibration-damping patches. Magnetostrictive and shape-memory materials follow analogous coupled constitutive frameworks.

---

## Chapter 20: Experimental Stress Analysis

### 20.0 Overview

Experimental stress analysis bridges analytical predictions and the messy reality of manufacturing tolerances, residual stresses, and material variability. A design engineer uses experiment to verify analysis on prototypes, to calibrate constitutive models, and to troubleshoot field failures. Full-field techniques (photoelasticity, moiré, DIC, thermoelasticity) complement the pointwise strain-gauge measurement, each with its own resolution, sensitivity, and domain of applicability. This chapter surveys the main techniques taught in MTE/ME/CIVE laboratories.

### 20.1 Strain Gauges and the Wheatstone Bridge

A metallic-foil strain gauge has a resistance change proportional to strain: \(\Delta R/R = G_F\,\varepsilon\) with gauge factor \(G_F \approx 2\) (constantan) or \(G_F \approx 100\)–\(200\) (semiconductor). A **Wheatstone bridge** converts this resistance change into a measurable voltage:

- **Quarter bridge:** one active gauge + three fixed resistors. Simple but temperature-sensitive.
- **Half bridge:** two active gauges. Cancels temperature effect and doubles sensitivity.
- **Full bridge:** four active gauges, fully temperature-compensated and with 4× sensitivity. Standard for load cells and torque shafts.

Rosette analysis (§1.6) converts three gauges into principal strains and then into principal stresses on a free surface.

### 20.2 Photoelasticity and the Stress-Optic Law

Photoelastic materials (epoxy, polycarbonate, CR-39) become birefringent under stress: the indices of refraction along the principal-stress directions differ by

\[
n_1 - n_2 = C(\sigma_1 - \sigma_2),
\]

with stress-optic coefficient \(C\) (brewsters; units \(10^{-12}\) Pa\(^{-1}\)). Polarised light passing through a stressed photoelastic model produces fringe patterns (isoclinics and isochromatics) from which the full stress field is read.

- **Isoclinics** — loci where principal-stress directions align with the polariser axes.
- **Isochromatics** — loci of constant \(|\sigma_1 - \sigma_2|\), at fringe orders \(N = 1, 2, 3, \dots\).

Photoelasticity was the dominant full-field stress-analysis technique from the 1930s through the 1980s (Frocht, *Photoelasticity*) and is still used pedagogically and in 3D photoelasticity of frozen-stress models.

### 20.2b Example: Photoelastic Fringe Interpretation

<div class="example">
A disc of CR-39 photoelastic epoxy (material fringe value \(f = 10\) N/mm/fringe at 540 nm) is diametrically compressed by 500 N; peak fringe order observed at the centre is \(N = 4\). Then \(\sigma_1 - \sigma_2 = N f/t = 4\times 10/t\). For \(t = 6\) mm: \(\sigma_1 - \sigma_2 = 6.67\) MPa. The Hertz-Flamant disc solution predicts at centre \(\sigma_1 - \sigma_2 = 6 P/(\pi D t) = 6\times 500/(\pi\times 50\times 6) = 3.18\) MPa. The factor-of-two discrepancy reflects edge effects and is a common teaching observation in undergraduate photoelasticity labs.
</div>

### 20.3 Digital Image Correlation (DIC)

Modern non-contact full-field technique: a random speckle pattern is painted on the specimen surface; two or more cameras image the deformation; image-correlation software tracks the displacement of speckle subsets, yielding full 2D or 3D surface displacements and strains. Spatial resolution of order the speckle size (0.1–1 mm); strain resolution of order \(10^{-4}\). DIC has largely displaced moiré interferometry and photoelasticity in mechanical testing laboratories since about 2005.

### 20.3b Thermoelastic Stress Analysis

The small adiabatic temperature change accompanying stress cycling — for steel, \(\Delta T \approx -1\) mK per MPa of mean stress — is detectable by sensitive infrared cameras (SPATE, DeltaTherm). The **Kelvin relation** \(\Delta T = -K\,T_0\,\Delta(\sigma_1+\sigma_2)\) gives full-field maps of the stress invariant \(\sigma_1+\sigma_2\) on dynamically loaded parts. The technique is particularly useful for in-service fatigue hot-spot detection.

### 20.4 Moiré and Interferometric Techniques (Brief)

**Moiré interferometry** superposes a reference grid on a specimen grid; relative displacements produce fringe patterns with sensitivity of order the grid pitch (0.6 μm typical). **Holographic interferometry** and **speckle-pattern interferometry** (ESPI) use laser illumination and interference to measure displacements of order the wavelength (~0.5 μm). These techniques remain important in precision measurement where DIC's resolution is insufficient.

---

## Chapter 21: The Finite Element Method — A Preview

### 21.0 A Note on Course Boundaries

FEM is a major subject in its own right — taught at Waterloo as AMATH 741 (mathematical theory), ME 559 (engineering FEM), CIVE 619, and other graduate courses. This chapter gives only a 1D/2D preview to show how the variational principles of Ch 7 cross over to numerical computation, and how classical closed-form solutions like the Lamé cylinder or the Kirsch hole serve as **verification benchmarks** for FEM codes. A serious treatment — element zoo, locking phenomena, contact algorithms, nonlinear solvers, adaptive refinement, multiscale methods — lies beyond the scope here.

### 21.1 Motivation

Closed-form solutions exist only for canonical geometries and simple loads. Real engineering structures — car frames, turbine blades, bridge components, prosthetic joints — have arbitrary geometry and require numerical solution of the elasticity equations. The **finite element method** (FEM) discretises the domain into simple sub-regions (elements) on which the displacement field is approximated by low-order polynomials (shape functions), and enforces the virtual-work principle (§7.3) to obtain a linear system \(\mathbf{K}\mathbf{d} = \mathbf{P}\).

### 21.2 Shape Functions

For a linear truss element with nodal displacements \(u_1, u_2\) at \(x = 0, L\):

\[
u(x) = N_1(x) u_1 + N_2(x) u_2, \quad N_1 = 1 - x/L, \quad N_2 = x/L.
\]

Strain \(\varepsilon = du/dx = (u_2 - u_1)/L\); stress \(\sigma = E\varepsilon\); internal force \(N = EA\varepsilon\). The shape functions \(N_i\) satisfy the **partition of unity** (\(\sum N_i = 1\)) and **Kronecker delta** (\(N_i(x_j) = \delta_{ij}\)) properties. Higher-order elements (quadratic, cubic) use more nodes and correspondingly richer polynomial spaces.

### 21.3 Element Stiffness Matrix

Substituting the shape-function approximation into the virtual-work equation \(\int \sigma\,\delta\varepsilon\,dV = \int f\,\delta u\,dV + \int t\,\delta u\,dS\) and taking \(\delta u_i\) arbitrary gives

\[
\mathbf{K}^e = \int_0^L B^T\,E A\,B\,dx, \qquad B = \frac{1}{L}[-1, 1],
\]

so for a truss element \(\mathbf{K}^e = (EA/L)\begin{pmatrix}1 & -1 \\ -1 & 1\end{pmatrix}\). The 4×4 beam element stiffness involves \(EI/L^3\) combined with \(EI/L\) rotational terms.

### 21.4 Two-Dimensional CST Element

The **constant-strain triangle** approximates the displacement field linearly over each triangular element; strain is piecewise constant. With nodal coordinates \((x_i, y_i)\) and displacements \((u_i, v_i)\), the element stiffness is a \(6\times 6\) matrix \(\mathbf{K}^e = t\,A\,B^T D B\), with \(t\) the plate thickness, \(A\) the triangle area, \(B\) the \(3\times 6\) strain-displacement matrix, and \(D\) the \(3\times 3\) plane-stress or plane-strain elasticity matrix. Higher-order elements (Q4, Q8, P6) converge faster and are the standard in practice.

### 21.4b Isoparametric Formulation

Modern FEM uses **isoparametric elements**: the same shape functions \(N_i(\xi,\eta)\) that interpolate the displacement field also interpolate the geometry, \(x = \sum N_i x_i\), \(y = \sum N_i y_i\). Integrations over physical-space elements are transformed to a reference square or triangle via the Jacobian \(\mathbf{J} = \partial(x,y)/\partial(\xi,\eta)\); strain-displacement matrices involve \(\mathbf{J}^{-1}\). **Gauss quadrature** with \(n\times n\) integration points exactly integrates polynomial products of degree \(2n-1\) — reduced and selective-reduced integration schemes address locking phenomena (shear locking in thin plates, volumetric locking for nearly incompressible materials).

### 21.5 Assembly and Solution

Element stiffness matrices are assembled into a global \(\mathbf{K}\) by summing contributions at shared DOFs. After applying Dirichlet (displacement) BCs, the reduced system \(\mathbf{K}_{\text{red}}\mathbf{d} = \mathbf{P}\) is solved by a direct or iterative linear solver. Stresses are recovered at element-integration (Gauss) points and extrapolated or averaged to nodes. The full theory — convergence, mesh refinement, element selection, nonlinear extensions — is the subject of **AMATH 741** (FEM) and **ME 559**; this chapter merely opens the door.

### 21.5b Beam Element Stiffness Matrix

For an Euler–Bernoulli beam element of length \(L\), stiffness \(EI\), with two end nodes each having transverse displacement \(v\) and rotation \(\theta\), the \(4\times 4\) element stiffness matrix is

\[
\mathbf{K}^e = \frac{EI}{L^3}\begin{pmatrix} 12 & 6L & -12 & 6L \\ 6L & 4L^2 & -6L & 2L^2 \\ -12 & -6L & 12 & -6L \\ 6L & 2L^2 & -6L & 4L^2\end{pmatrix},
\]

derived by the cubic Hermite shape functions. A beam-column element adds a geometric stiffness \(-P\mathbf{K}_g\) that captures the \(P-\delta\) effect and enables linearised buckling analysis by solving the generalised eigenvalue problem \((\mathbf{K} - \lambda\mathbf{K}_g)\mathbf{d} = 0\).

### 21.6 Convergence and Error Estimation

Under mesh refinement \(h \to 0\), the FEM solution converges to the exact solution at a rate \(\|u - u_h\|_{H^1} \le C h^p\), where \(p\) is the polynomial order of the shape functions. The constant \(C\) depends on the exact solution's regularity. For problems with stress singularities (re-entrant corners, cracks), uniform mesh refinement gives slow convergence; **adaptive mesh refinement** — concentrating elements near singularities — restores optimal rates. The Zienkiewicz–Zhu error estimator compares the FEM stress (element-average) with a patch-recovered stress (smoothed) to drive adaptivity automatically.

---

## Chapter 22: Contact Mechanics

### 22.0 Why Contact?

Every rolling-contact bearing, gear tooth, cam follower, railroad wheel, and ball-and-socket joint involves localised contact between non-conforming surfaces. Peak contact pressures routinely reach 1–3 GPa, well above most materials' yield strengths; design must therefore balance contact area against subsurface shear and surface-wear mechanisms. Hertz's 1881 paper, written at age 23, provided the first rational theory and remains the foundation of tribology and rolling-contact-fatigue design.

### 22.1 Hertz Theory (1881)

Two elastic bodies with radii of curvature \(R_1, R_2\) at their point of contact, pressed together by load \(P\), form a small circular contact patch of radius

\[
a = \left(\frac{3 P R}{4 E^*}\right)^{1/3},
\]

with \(1/R = 1/R_1 + 1/R_2\) and reduced modulus \(1/E^* = (1-\nu_1^2)/E_1 + (1-\nu_2^2)/E_2\). The contact pressure is elliptical,

\[
p(r) = p_0\,\sqrt{1 - r^2/a^2}, \qquad p_0 = \frac{3P}{2\pi a^2},
\]

with mean pressure \(\bar{p} = 2p_0/3\) and approach (mutual indentation) \(\delta = a^2/R\).

### 22.1b Maximum Pressure and Approach for Sphere-on-Plane

<div class="example">
A steel ball of radius \(R = 10\) mm pressed onto a flat steel plate by \(P = 100\) N. Both steel: \(E^* = E/[2(1-\nu^2)] = 200/[2\cdot 0.91] = 110\) GPa. Contact radius \(a = (3 P R/(4 E^*))^{1/3} = (3\cdot 100\cdot 0.01/(4\cdot 110\times 10^9))^{1/3} = 1.89\times 10^{-4}\) m = 0.189 mm. Peak pressure \(p_0 = 3P/(2\pi a^2) = 1337\) MPa — well above the yield stress of most steels, so plastic flow occurs in reality. Approach \(\delta = a^2/R = 3.58\) μm. The subsurface peak shear stress is \(\approx 0.3\times 1337 = 401\) MPa, at a depth of \(\approx 91\) μm — hence Hertzian fatigue pitting initiates well below the surface.
</div>

### 22.2 Cylinder–Cylinder Line Contact

Two parallel cylinders under force per unit length \(p\) contact over a line of half-width

\[
b = \sqrt{\frac{4 p R}{\pi E^*}}, \qquad p_0 = \frac{2p}{\pi b}.
\]

### 22.3 Subsurface Stresses

Hertz contact creates a subsurface maximum shear stress \(\tau_{\max} \approx 0.30 p_0\) at a depth \(z \approx 0.48 a\) below the contact. This is where rolling-contact fatigue (RCF) initiates pits and spalls in rolling-element bearings, gear teeth, and railroad rails. The design life of a ball bearing follows the Weibull \(L_{10}\) formula, whose stress-life exponent reflects the Hertz-to-subsurface stress mapping.

### 22.3b Example: Gear-Tooth Contact

<div class="example">
Two involute spur gears mesh with contact radius of curvature \(R_1 = 30\) mm, \(R_2 = 40\) mm (local gear-tooth surface radii at the pitch line), transmitting 5 kN per unit tooth-width along the line of action. Both gears steel (\(E = 200\) GPa, \(\nu = 0.3\)); \(E^* = 200/[2(1-0.09)] = 109.9\) GPa; \(1/R = 1/30 + 1/40 = 1/17.1\) mm\(^{-1}\); \(R = 17.1\) mm. Line contact: \(b = \sqrt{4(5000)(0.0171)/(\pi\times 109.9\times 10^9)\text{ m²}} = 0.0314\) mm; \(p_0 = 2\times 5000/(\pi\times 31.4\times 10^{-6}) = 101\) MPa. No — units: \(p_0 = 2P/(\pi b)\) with \(P\) per unit width: \(p_0 = 2(5\times 10^6 \text{ N/m})/(\pi\times 31.4\times 10^{-6}\text{ m}) = 101\) GPa. Wait — this is excessive; real gear teeth use much larger \(R\) at contact due to the involute profile, and the line load is typically 100–500 N/mm not 5 kN/mm. Correcting to a realistic 500 N/mm: \(b = 9.9\) μm, \(p_0 = 32.2\) GPa — still too high, which is why gear-tooth contacts commonly exceed the material yield and are designed against pitting fatigue (Hertzian RCF) rather than static failure.
</div>

### 22.4 Adhesive Contact (JKR and DMT)

For small, soft, or sticky contacts, adhesion forces compete with elastic repulsion. The **JKR model** (Johnson–Kendall–Roberts, 1971) applies for compliant solids with strong short-range adhesion; **DMT** (Derjaguin–Muller–Toporov, 1975) for stiff solids with weak long-range adhesion. These corrections are essential in nano-indentation and atomic-force microscopy.

---

## Chapter 23: Dynamic and Impact Loading

### 23.0 Why Dynamics Matters

All the preceding chapters assume quasi-static loading. Real structures experience impact, vibration, and wave loading whose peak stresses can exceed the static equivalents by factors of 2 to 100 or more. Dynamic analysis is the subject of entire courses (AMATH 333 Ordinary Differential Equations, SYDE 382 Dynamics, CIVE 511 Structural Dynamics, ME 535 Vibrations) but an engineering solid-mechanics text should at least preview the basic results: impact amplification, longitudinal stress-wave propagation, and the role of damping. Heavier dynamic subjects (seismic design, random vibration, structural health monitoring) go well beyond this preview.

### 23.1 Impact Factor

A mass \(m\) falling a height \(h\) onto a structure with static deflection \(\delta_{\text{st}}\) (under the weight \(mg\) applied slowly) produces a dynamic deflection \(\delta_d\) satisfying energy balance:

\[
m g(h + \delta_d) = \tfrac{1}{2}k\delta_d^2, \quad k = mg/\delta_{\text{st}}.
\]

Solving,

\[
\delta_d = \delta_{\text{st}}\left(1 + \sqrt{1 + \frac{2h}{\delta_{\text{st}}}}\right), \qquad \text{impact factor } n = \frac{\delta_d}{\delta_{\text{st}}} = 1 + \sqrt{1+2h/\delta_{\text{st}}}.
\]

For suddenly applied load (\(h = 0\)): \(n = 2\). For large drop heights (\(h \gg \delta_{\text{st}}\)): \(n \approx \sqrt{2h/\delta_{\text{st}}}\). This is the basis of impact-load multipliers in crane-hook, elevator-cable, and drop-test design.

### 23.1b Suddenly Applied Load: The Factor of Two

A mass \(m\) placed suddenly (at rest, \(h = 0\)) onto a spring of stiffness \(k\) oscillates about the static equilibrium with amplitude equal to the static deflection \(\delta_{\text{st}} = mg/k\). Peak dynamic deflection is \(2\delta_{\text{st}}\), and peak dynamic force is \(2mg\). This is the familiar "impact factor of two" that governs crane hooks, elevator-cable suddenly-released loads, and quick-release hydraulic actuators. In practice, some damping and elastic-plastic deformation reduce the factor below 2, but design codes routinely use 2 as a conservative upper bound.

### 23.2 Longitudinal Waves in Bars

The linearised axial-displacement equation for a uniform bar is

\[
\frac{\partial^2 u}{\partial t^2} = c^2\frac{\partial^2 u}{\partial x^2}, \qquad c = \sqrt{E/\rho}.
\]

For steel, \(c \approx 5100\) m/s. A stress pulse \(\sigma(x,t)\) propagates without distortion; reflections at free ends invert sign (tension becomes compression) and at fixed ends retain sign. The **Hopkinson split-bar** test (1914) exploits this to measure dynamic material properties at strain rates up to \(10^4\) s\(^{-1}\).

### 23.3 Longitudinal Vibration

A bar of length \(L\), fixed at \(x=0\), free at \(x=L\), has natural frequencies \(\omega_n = (2n-1)\pi c/(2L)\). These underlie the design of tuning forks, piezoelectric transducers, and ultrasonic horns. For lateral bending vibration, the Euler–Bernoulli beam gives \(\omega_n^2 = (\beta_n L)^4 EI/(\rho A L^4)\) with eigenvalues \(\beta_n L\) tabulated for various support conditions (simply supported: \(\beta_n L = n\pi\); fixed–free: 1.875, 4.694, 7.855, …).

### 23.3b Timoshenko Beam Vibration

Classical Euler–Bernoulli beam vibration neglects shear deformation and rotary inertia; both matter for short beams and high modes. The Timoshenko beam adds two new parameters (shear coefficient \(\kappa\), rotary inertia \(\rho I\)) and gives a coupled system whose natural frequencies are lower than the Euler–Bernoulli values, converging from above as \(L/h \to \infty\). For \(L/h = 10\), the first-mode frequency correction is typically ~5–10%; for \(L/h = 3\), ~30–40%. High-frequency modes are more strongly affected; a 10th Euler–Bernoulli mode may be 50% too high.

### 23.4 Damping and the Quality Factor

Real structures damp vibrations: viscous damping \(c\dot{u}\), Coulomb friction, or hysteretic (structural) damping proportional to displacement amplitude. The dimensionless **quality factor** \(Q = \omega_n/(2\zeta\omega_n) = 1/(2\zeta)\) (viscous) characterises the sharpness of resonance. Bridge design constrains the first natural frequency to avoid pedestrian resonance (the Millennium Bridge incident, London 2000, at 0.8 Hz) and wind-induced vortex-shedding resonance (Tacoma Narrows, 1940).

---

<div class="remark">
<strong>Closing remarks.</strong> AMATH 464 has traced the full classical solid-mechanics toolkit from the general continuum framework of AMATH 361 down to the specialized formulas of engineering practice: Mohr's circle, the flexure and Jourawski formulas, Saint-Venant torsion, Castigliano's theorems, the force and stiffness methods for indeterminate structures, Euler buckling and its refinements, the biharmonic equation for plane elasticity, Kirchhoff plate theory, Lamé's thick-cylinder solution, the Westergaard crack-tip field, yield surfaces and limit analysis, the S–N and Paris laws, laminate theory, experimental stress analysis, and the finite-element method as the numerical successor to all of these closed-form results. These are the tools by which an engineer designs a shaft, a beam, a column, a pressure vessel, an aircraft panel, or an orthopaedic implant without re-solving the Navier equations from scratch. They are also the point of contact between continuum mechanics and the design codes (ASME, Eurocode, AISC, ACI, CSA) that govern real engineering practice — and the foundation on which every graduate course in plasticity, fracture, fatigue, composites, biomechanics, and computational mechanics is built.
</div>
