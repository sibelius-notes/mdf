---
title: "EARTH 437: Rock Mechanics"
subjects: "EARTH"
prof: "Ali Yaghoubi"
---

## Sources and References

**Primary textbook** — Jaeger, J.C., Cook, N.G.W., and Zimmerman, R.W. (2007). *Fundamentals of Rock Mechanics* (4th ed.). Blackwell Publishing. This is the standard graduate-level reference for the mathematical treatment of stress, strain, elasticity, and failure in rocks.

**Supplementary textbooks** — Hudson, J.A. and Harrison, J.P. (1997). *Engineering Rock Mechanics: An Introduction to the Principles*. Pergamon Press. Goodman, R.E. (1989). *Introduction to Rock Mechanics* (2nd ed.). Wiley. Hoek, E. and Brown, E.T. (1980). *Underground Excavations in Rock*. Institution of Mining and Metallurgy, London.

**Online resources** — Zoback, M.D. (2010). *Reservoir Geomechanics*. Cambridge University Press (accessible online via institutional access); Brady, B.H.G. and Brown, E.T. (2006). *Rock Mechanics for Underground Mining* (3rd ed.). Springer; International Society for Rock Mechanics and Rock Engineering (ISRM) standard testing methods available at isrm.net; RocScience software documentation for practical implementation.

---

# Chapter 1: Introduction to Rock Mechanics — Scope, Uncertainty, and the Design Framework

## 1.1 What is Rock Mechanics?

Rock mechanics is not merely a catalogue of strength data and empirical charts — it is the discipline that asks, with mathematical rigour, what happens when the earth is cut, drilled, loaded, or flooded. Its domain spans twelve orders of magnitude in length: from the nanometre-scale propagation of water films along silicate grain boundaries, to the kilometre-scale stability of open pit mines and the hundred-kilometre-scale mechanics of tectonic plates. The same continuum mechanics framework — stress tensors, strain tensors, constitutive relations — applies across all these scales, though the dominant mechanisms shift profoundly.

The discipline emerged in recognizable form during the mid-twentieth century, driven by three industries whose need for quantitative rock behaviour predictions was literally a matter of life and death: underground mining (where rock bursts and roof collapses killed miners), civil tunnelling (where the New Austrian Tunnelling Method introduced systematic ground-support interaction design), and the petroleum industry (where borehole instability, hydraulic fracturing, and reservoir compaction demanded geomechanical understanding). Today, rock mechanics also underpins geothermal energy extraction, CO₂ sequestration, nuclear waste disposal, and the growing field of induced seismicity management.

A geomechanics problem typically has three components. The first is the **initial state**: what are the stresses, pore pressures, temperatures, and geometric configuration of the rock mass before any engineering intervention? The second is the **perturbation**: what does the engineering operation do — does it remove rock (mining, tunnelling, open pit), inject fluid (hydraulic fracturing, wastewater disposal), change temperature (geothermal, steam injection), or apply load (foundations)? The third is the **response**: how does the rock mass deform, yield, fracture, or flow in response to the perturbation, and does this response satisfy engineering performance criteria (stability, deformation limits, fluid containment)?

## 1.2 Uncertainty and Probabilistic Design

The central philosophical challenge of rock engineering is irreducible uncertainty. Unlike structural steel produced to a mill certificate, rock properties vary spatially in ways that can never be fully characterized. A drilling campaign samples perhaps 0.001% of the rock volume that governs a mine's stability; geostatistical interpolation between boreholes introduces uncertainty that no amount of additional drilling eliminates entirely.

This uncertainty propagates through every step of the design calculation. If cohesion \(c\) is uncertain, then the computed factor of safety \(F\) is also uncertain — it is a random variable with a probability distribution, not a single number. The engineering question is not simply "is \(F > 1\)?" but "what is \(P(F < 1)\)?", the **probability of failure**. Different industries accept different failure probabilities: a nuclear waste repository might require \(P(\text{failure}) < 10^{-6}\), while a temporary mine access road might accept \(P(\text{failure}) < 10^{-2}\).

The Monte Carlo method, introduced in Chapter 13, is the workhorse technique for propagating uncertainty through nonlinear geomechanical calculations. The conceptual design approach that follows from this probabilistic perspective has six steps: (1) define the initial state of the rock mass; (2) delineate the geometry of the rock mass and the engineered structure; (3) estimate the past and future load history and geometry evolution; (4) develop a sufficient behavioural law (constitutive model) for the problem at hand; (5) choose an analysis method (analytical, numerical, empirical); and (6) confirm design validity and optimize continuously through monitoring and re-analysis — the observational method.

---

# Chapter 2: Stress in Three Dimensions

## 2.1 The Concept of Stress at a Point

Stress is not a property of a surface — it is a property of a material at a point. This distinction, which took engineers and mathematicians nearly two centuries to formalize, is the starting point for all of continuum mechanics.

Consider a body in equilibrium under applied forces. Imagine cutting the body along an arbitrary plane through an interior point \(P\), with outward unit normal \(\hat{n}\). Remove the material on one side; to maintain equilibrium, we must replace its mechanical action with a distributed force over the cut surface. Over an area element \(\Delta A\) near \(P\), let \(\Delta \mathbf{F}\) be the resultant of these surface forces. The **traction vector** at \(P\) on the plane with normal \(\hat{n}\) is:

\[
\mathbf{T}^{(\hat{n})} = \lim_{\Delta A \to 0} \frac{\Delta \mathbf{F}}{\Delta A}
\]

The traction has dimensions of force per unit area (Pa = N/m²). Crucially, \(\mathbf{T}^{(\hat{n})}\) depends on both the point \(P\) *and* the orientation \(\hat{n}\) of the cutting plane. At the same point \(P\), cutting along a different plane gives a different traction. This is why stress is a second-order tensor, not a vector.

## 2.2 The Cauchy Stress Tensor

The key result — Cauchy's fundamental theorem — is that once we know the traction on three mutually orthogonal planes at a point, we can find the traction on *any* plane through that point. The proof proceeds by equilibrium of an infinitesimal tetrahedron.

<div class="theorem">
<strong>Cauchy's Stress Theorem (Traction Formula).</strong> Let \(\boldsymbol{\sigma}\) be the Cauchy stress tensor at a point, with components \(\sigma_{ij}\) representing the \(j\)-th component of traction on the plane whose outward normal points in the \(i\)-th coordinate direction. Then the traction on an arbitrary plane with outward unit normal \(\hat{n} = n_j \mathbf{e}_j\) is:

\[
\mathbf{T}^{(\hat{n})} = \boldsymbol{\sigma} \cdot \hat{n}, \qquad T_i = \sigma_{ij} n_j
\]

<em>Proof.</em> Consider a tetrahedron with three faces aligned with the coordinate planes (areas \(A_1, A_2, A_3\)) and one oblique face of area \(A\) with outward normal \(\hat{n}\). The areas are related by \(A_k = A n_k\) (projection). The equilibrium of the tetrahedron in the \(i\)-th direction requires:

\[
T_i A - \sigma_{1i} A_1 - \sigma_{2i} A_2 - \sigma_{3i} A_3 + f_i \cdot (\text{volume term}) = 0
\]

As the tetrahedron shrinks to zero size, the volume term (body forces) vanishes as volume/area \(\to 0\). Substituting \(A_k = A n_k\):

\[
T_i A = \sigma_{ji} n_j A \implies T_i = \sigma_{ji} n_j
\]

In matrix notation with standard rock mechanics sign convention (compressive stress positive), this is \(\mathbf{T} = \boldsymbol{\sigma}^T \hat{n}\), and since \(\boldsymbol{\sigma}\) is symmetric (proved by moment equilibrium of the element: \(\sigma_{ij} = \sigma_{ji}\)), we have \(\mathbf{T} = \boldsymbol{\sigma} \hat{n}\). \(\square\)
</div>

The stress tensor in three dimensions has nine components, but symmetry (\(\sigma_{ij} = \sigma_{ji}\)) reduces these to six independent values. In matrix form, using \(x, y, z\) coordinates (or often \(1, 2, 3\)):

\[
\boldsymbol{\sigma} = \begin{pmatrix} \sigma_{xx} & \sigma_{xy} & \sigma_{xz} \\ \sigma_{yx} & \sigma_{yy} & \sigma_{yz} \\ \sigma_{zx} & \sigma_{zy} & \sigma_{zz} \end{pmatrix}
\]

The **diagonal components** \(\sigma_{xx}, \sigma_{yy}, \sigma_{zz}\) are **normal stresses** — they act perpendicular to the face. The **off-diagonal components** \(\sigma_{xy} = \sigma_{yx}\), etc., are **shear stresses** — they act parallel to the face.

**Sign convention in rock mechanics:** Following geomechanics convention, *compressive normal stress is positive*. This is the opposite of structural engineering convention but is natural in rock mechanics where the Earth's overburden creates compressive stresses.

## 2.3 Normal and Shear Stress on an Arbitrary Plane

Given the traction vector \(\mathbf{T}^{(\hat{n})}\), the **normal stress** \(\sigma_n\) and **shear stress** \(\tau\) on the plane are obtained by projecting:

\[
\sigma_n = \mathbf{T}^{(\hat{n})} \cdot \hat{n} = \sigma_{ij} n_i n_j
\]

\[
\tau = \sqrt{|\mathbf{T}^{(\hat{n})}|^2 - \sigma_n^2} = \sqrt{T_i T_i - \sigma_n^2}
\]

These are the key quantities entering failure criteria.

## 2.4 Principal Stresses — The Eigenvalue Problem

There exist special orientations \(\hat{n}\) for which the traction is purely normal — the shear stress vanishes. These directions are the **principal stress directions**, and the corresponding normal stresses are the **principal stresses** \(\sigma_1 \geq \sigma_2 \geq \sigma_3\) (in rock mechanics, \(\sigma_1\) is the largest compressive stress).

<div class="theorem">
<strong>Principal Stress Eigenvalue Problem.</strong> The principal stresses are the eigenvalues of \(\boldsymbol{\sigma}\), found by solving:

\[
\boldsymbol{\sigma} \hat{n} = \sigma \hat{n} \implies \left(\boldsymbol{\sigma} - \sigma \mathbf{I}\right) \hat{n} = \mathbf{0}
\]

For a non-trivial solution, the determinant must vanish:

\[
\det\left(\boldsymbol{\sigma} - \sigma \mathbf{I}\right) = 0
\]

Expanding this \(3 \times 3\) determinant gives the <strong>characteristic equation</strong>:

\[
\sigma^3 - I_1 \sigma^2 + I_2 \sigma - I_3 = 0
\]

where the three <strong>stress invariants</strong> are:

\[
I_1 = \sigma_{xx} + \sigma_{yy} + \sigma_{zz} = \text{tr}(\boldsymbol{\sigma}) = \sigma_1 + \sigma_2 + \sigma_3
\]

\[
I_2 = \sigma_{xx}\sigma_{yy} + \sigma_{yy}\sigma_{zz} + \sigma_{zz}\sigma_{xx} - \sigma_{xy}^2 - \sigma_{yz}^2 - \sigma_{zx}^2 = \sigma_1\sigma_2 + \sigma_2\sigma_3 + \sigma_3\sigma_1
\]

\[
I_3 = \det(\boldsymbol{\sigma}) = \sigma_1 \sigma_2 \sigma_3
\]

These invariants are so named because they take the same numerical values regardless of how the coordinate axes are oriented — they are intrinsic properties of the stress state.
</div>

Since \(\boldsymbol{\sigma}\) is real and symmetric, its eigenvalues are guaranteed to be real, and its eigenvectors are mutually orthogonal. This means a coordinate system always exists in which \(\boldsymbol{\sigma}\) is diagonal — the **principal stress coordinate system**.

<div class="example">
<strong>Example 2.1: Computing Principal Stresses.</strong> A stress tensor (in MPa, compression positive) is measured at a point in a rock mass:

\[
\boldsymbol{\sigma} = \begin{pmatrix} 25 & 10 & 0 \\ 10 & 15 & 0 \\ 0 & 0 & 20 \end{pmatrix}
\]

Because \(\sigma_{xz} = \sigma_{yz} = 0\), the \(z\)-direction is already a principal direction, with \(\sigma_3 = 20\) MPa... wait, we order after finding all. For the \(x\)-\(y\) plane, the characteristic equation for the \(2 \times 2\) submatrix is:

\[
(\sigma - 25)(\sigma - 15) - (10)^2 = 0
\]

\[
\sigma^2 - 40\sigma + 375 - 100 = 0 \implies \sigma^2 - 40\sigma + 275 = 0
\]

\[
\sigma = \frac{40 \pm \sqrt{1600 - 1100}}{2} = \frac{40 \pm \sqrt{500}}{2} = 20 \pm 11.18
\]

So the three principal stresses are: \(\sigma_1 = 31.18\) MPa, \(\sigma_2 = 20\) MPa, \(\sigma_3 = 8.82\) MPa.

The principal direction for \(\sigma_1 = 31.18\) MPa satisfies \((25 - 31.18)n_x + 10 n_y = 0\), giving \(n_y/n_x = 0.618\), so the eigenvector is proportional to \((1, 0.618, 0)\), normalized to \((0.851, 0.527, 0)\) — it plunges into the first quadrant of the \(x\)-\(y\) plane.
</div>

## 2.5 Mean Stress and Deviatoric Stress

Any stress tensor can be decomposed into a **hydrostatic** (mean) part and a **deviatoric** part:

\[
\boldsymbol{\sigma} = p \mathbf{I} + \mathbf{s}, \qquad p = \frac{I_1}{3} = \frac{\sigma_1 + \sigma_2 + \sigma_3}{3}
\]

The mean stress \(p\) causes volumetric change only. The **deviatoric stress tensor** \(\mathbf{s} = \boldsymbol{\sigma} - p\mathbf{I}\) drives distortional (shear) deformation and controls yielding. Its invariants are:

\[
J_1 = \text{tr}(\mathbf{s}) = 0, \qquad J_2 = \frac{1}{2}\text{tr}(\mathbf{s}^2), \qquad J_3 = \frac{1}{3}\text{tr}(\mathbf{s}^3)
\]

The quantity \(\sqrt{J_2}\) is proportional to the **octahedral shear stress** and appears in the Drucker-Prager yield criterion.

## 2.6 The Mohr Circle Construction

The Mohr circle is a powerful geometric device for visualizing how normal and shear stresses vary as the cutting plane is rotated in two dimensions. For a 2D stress state with principal stresses \(\sigma_1\) and \(\sigma_3\), the normal and shear stresses on a plane inclined at angle \(\theta\) to the \(\sigma_3\) direction are derived directly from equilibrium.

<div class="theorem">
<strong>Mohr Circle Equations — Derivation.</strong> In 2D, consider principal stresses \(\sigma_1 > \sigma_3\) (both compressive). A plane has its normal at angle \(\theta\) to the \(\sigma_1\) direction. The traction components are:

\[
T_1 = \sigma_1 \cos\theta, \qquad T_3 = \sigma_3 \sin\theta
\]

Resolving into normal and shear components on the plane:

\[
\sigma_n = T_1 \cos\theta + T_3 \sin\theta = \sigma_1 \cos^2\theta + \sigma_3 \sin^2\theta
\]

\[
\tau = T_1 \sin\theta - T_3 \cos\theta = (\sigma_1 - \sigma_3)\sin\theta\cos\theta
\]

Using double-angle identities (\(\cos^2\theta = (1 + \cos 2\theta)/2\), \(\sin\theta\cos\theta = \sin 2\theta / 2\)):

\[
\sigma_n = \frac{\sigma_1 + \sigma_3}{2} + \frac{\sigma_1 - \sigma_3}{2}\cos 2\theta
\]

\[
\tau = \frac{\sigma_1 - \sigma_3}{2}\sin 2\theta
\]

Eliminating \(\theta\) by squaring and adding:

\[
\left(\sigma_n - \frac{\sigma_1 + \sigma_3}{2}\right)^2 + \tau^2 = \left(\frac{\sigma_1 - \sigma_3}{2}\right)^2
\]

This is the equation of a <strong>circle</strong> in the \((\sigma_n, \tau)\) plane, centred at \(\left(\frac{\sigma_1 + \sigma_3}{2}, 0\right)\) with radius \(R = \frac{\sigma_1 - \sigma_3}{2}\). This is the <strong>Mohr circle</strong>. As \(\theta\) varies from 0 to \(\pi/2\), the representative point traces the full circle. \(\square\)
</div>

The Mohr circle construction applies for 3D stress states too, yielding three circles (for each pair of principal stresses). The admissible stress states on planes within the 3D body correspond to points in the region bounded by the outer circle and exterior to the two inner circles.

---

# Chapter 3: Strain and Deformation

## 3.1 The Infinitesimal Strain Tensor

Strain describes the local deformation of material — the change in shape and volume of an infinitesimal element. Let \(\mathbf{u}(\mathbf{x})\) be the displacement field (vector of displacements at each point). For small deformations, the **infinitesimal strain tensor** is defined as the symmetric part of the displacement gradient:

\[
\varepsilon_{ij} = \frac{1}{2}\left(\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i}\right)
\]

The antisymmetric part \(\omega_{ij} = \frac{1}{2}(\partial u_i/\partial x_j - \partial u_j/\partial x_i)\) represents rigid-body rotation, which produces no stress.

The **normal strains** \(\varepsilon_{xx}, \varepsilon_{yy}, \varepsilon_{zz}\) are dimensionless ratios representing fractional elongation:

\[
\varepsilon_{xx} = \frac{\partial u_x}{\partial x}
\]

*Positive normal strain denotes extension* (opposite to the stress sign convention — beware!).

The **engineering shear strain** \(\gamma_{ij} = 2\varepsilon_{ij}\) (for \(i \neq j\)) represents the total angular distortion of an element — the sum of the angles through which the two face normals rotate.

## 3.2 Volumetric Strain and Dilatancy

The **volumetric strain** is:

\[
\varepsilon_v = \varepsilon_{xx} + \varepsilon_{yy} + \varepsilon_{zz} = \text{tr}(\boldsymbol{\varepsilon}) = I_1(\boldsymbol{\varepsilon})
\]

For a small element of original volume \(V\), the change in volume is \(\Delta V = \varepsilon_v V\). This invariant is also equal to \(\nabla \cdot \mathbf{u}\).

In rocks, shear deformation is often accompanied by volume change — a phenomenon called **dilatancy**. When a rock is sheared, rough joint surfaces ride up over asperities, causing the joint to dilate (open perpendicular to the shear direction). This dilatancy increases the apparent shear strength of joints and is described by the **dilation angle** \(\psi\): the ratio of normal to shear displacement during plastic flow, \(d\varepsilon_v^p / d\gamma^p = \sin\psi\).

## 3.3 Compatibility Equations

Given a displacement field \(\mathbf{u}\), one can always compute strains. The reverse is not always true — not every arbitrary strain field \(\varepsilon_{ij}(\mathbf{x})\) corresponds to a physically realizable continuous displacement field. The **compatibility equations** (Saint-Venant's conditions) ensure that strains are consistent with a single-valued displacement field:

\[
\frac{\partial^2 \varepsilon_{ij}}{\partial x_k \partial x_l} + \frac{\partial^2 \varepsilon_{kl}}{\partial x_i \partial x_j} = \frac{\partial^2 \varepsilon_{ik}}{\partial x_j \partial x_l} + \frac{\partial^2 \varepsilon_{jl}}{\partial x_i \partial x_k}
\]

In 2D (plane strain), this reduces to the single condition:

\[
\frac{\partial^2 \varepsilon_{xx}}{\partial y^2} + \frac{\partial^2 \varepsilon_{yy}}{\partial x^2} = 2\frac{\partial^2 \varepsilon_{xy}}{\partial x \partial y}
\]

Compatibility is automatically satisfied if stresses are derived from an Airy stress function (Chapter 7), which is why the Kirsch solution — derived from such a function — is self-consistent.

---

# Chapter 4: Elastic Constitutive Relations

## 4.1 Generalized Hooke's Law

A **constitutive relation** connects stress to strain. For a linear elastic isotropic material, this is the generalized Hooke's Law. We derive it from two physical observations: (1) normal stress causes both axial and lateral strains (Poisson effect); (2) shear stress causes shear strain only.

<div class="theorem">
<strong>Generalized Hooke's Law — Derivation.</strong> Apply \(\sigma_{xx}\) alone to a cube. By definition of Young's modulus \(E\), the axial strain is \(\varepsilon_{xx} = \sigma_{xx}/E\). By Poisson's ratio \(\nu\), lateral strains are \(\varepsilon_{yy} = \varepsilon_{zz} = -\nu \sigma_{xx}/E\). By superposition (linearity), the total strain under the full stress tensor is:

\[
\varepsilon_{xx} = \frac{1}{E}\left[\sigma_{xx} - \nu(\sigma_{yy} + \sigma_{zz})\right]
\]

\[
\varepsilon_{yy} = \frac{1}{E}\left[\sigma_{yy} - \nu(\sigma_{xx} + \sigma_{zz})\right]
\]

\[
\varepsilon_{zz} = \frac{1}{E}\left[\sigma_{zz} - \nu(\sigma_{xx} + \sigma_{yy})\right]
\]

\[
\varepsilon_{xy} = \frac{\sigma_{xy}}{2G}, \quad \varepsilon_{yz} = \frac{\sigma_{yz}}{2G}, \quad \varepsilon_{xz} = \frac{\sigma_{xz}}{2G}
\]

where \(G\) is the shear modulus. In compact tensor notation:

\[
\varepsilon_{ij} = \frac{1+\nu}{E}\sigma_{ij} - \frac{\nu}{E}\sigma_{kk}\delta_{ij}
\]

Inverting to give stress in terms of strain:

\[
\sigma_{ij} = \frac{E\nu}{(1+\nu)(1-2\nu)}\varepsilon_{kk}\delta_{ij} + \frac{E}{1+\nu}\varepsilon_{ij}
\]

or equivalently \(\sigma_{ij} = \lambda \varepsilon_{kk} \delta_{ij} + 2\mu \varepsilon_{ij}\), where the <strong>Lamé parameters</strong> are:

\[
\lambda = \frac{E\nu}{(1+\nu)(1-2\nu)}, \qquad \mu = G = \frac{E}{2(1+\nu)}
\]
</div>

## 4.2 Relationships Between Elastic Constants

For an isotropic material, only two of the elastic constants \(E, \nu, G, K, \lambda, \mu\) are independent. The key relationships are:

\[
G = \frac{E}{2(1+\nu)}, \qquad K = \frac{E}{3(1-2\nu)}, \qquad \lambda = \frac{E\nu}{(1+\nu)(1-2\nu)}
\]

where \(K\) is the **bulk modulus** (ratio of mean stress to volumetric strain: \(p = K \varepsilon_v\)).

**Physical constraints:** For a physically realizable material, elastic strain energy must be positive definite. This requires \(E > 0\), \(G > 0\), \(K > 0\), which constrain Poisson's ratio to \(-1 < \nu < 1/2\). At \(\nu = 1/2\), \(K \to \infty\) (incompressible material). For most rocks, \(\nu \approx 0.15\)–\(0.35\).

<div class="example">
<strong>Example 4.1: Computing Elastic Constants for Granite.</strong> A uniaxial compression test on a granite core gives an axial modulus \(E = 70\) GPa and Poisson's ratio \(\nu = 0.25\). Compute the shear modulus and bulk modulus:

\[
G = \frac{70}{2(1 + 0.25)} = \frac{70}{2.5} = 28 \text{ GPa}
\]

\[
K = \frac{70}{3(1 - 2 \times 0.25)} = \frac{70}{1.5} = 46.7 \text{ GPa}
\]

Under a hydrostatic stress of 100 MPa, the volumetric strain is:

\[
\varepsilon_v = \frac{p}{K} = \frac{100}{46\,700} = 2.14 \times 10^{-3}
\]
</div>

## 4.3 Anisotropic Elasticity

Real rocks are often anisotropic — their elastic properties differ with direction. A shale, with flat clay platelets aligned parallel to bedding, is stiffer perpendicular to bedding than along it. **Transverse isotropy** (five independent elastic constants \(E_h, E_v, \nu_h, \nu_{hv}, G_v\)) is the most common model for sedimentary rocks. The general anisotropic elastic tensor has 21 independent components.

---

# Chapter 5: In-Situ Stress

## 5.1 Why In-Situ Stress Matters

The in-situ stress field is the *initial condition* for every rock engineering problem. Before any tunnel is driven or borehole drilled, the rock mass is in a state of stress set by geological processes over millions of years. Perturbing this stress field — by excavation, injection, or thermal change — produces the engineering response. Ignorance of the pre-existing stress state is the single greatest source of error and failure in rock engineering practice.

In-situ stress has three principal components: **vertical stress** \(S_v\) (dominantly due to overburden weight), and two **horizontal stresses** \(S_H\) (maximum horizontal) and \(S_h\) (minimum horizontal), which are generally unequal due to tectonic processes.

## 5.2 Gravitational Stress

The vertical stress at depth \(z\) is simply the weight of overburden:

\[
S_v = \int_0^z \rho(z') g \, dz' \approx \rho g z
\]

For an average rock density \(\rho \approx 2650\) kg/m³ and \(g = 9.81\) m/s², the gradient is approximately 26.5 MPa/km. A useful rule of thumb is \(S_v \approx 0.027z\) MPa, where \(z\) is in metres.

The horizontal stress due to gravitational loading in a laterally confined (zero horizontal strain) elastic medium can be derived from Hooke's law. Setting \(\varepsilon_{xx} = \varepsilon_{yy} = 0\):

\[
0 = \frac{1}{E}\left[\sigma_H - \nu(\sigma_v + \sigma_H)\right] \implies \sigma_H = \frac{\nu}{1-\nu}\sigma_v
\]

The ratio \(K_0 = \sigma_H / \sigma_v = \nu/(1-\nu)\) is the **coefficient of earth pressure at rest**. For \(\nu = 0.25\), \(K_0 = 0.33\); for \(\nu = 0.33\), \(K_0 = 0.5\). Note that these values of \(K_0\) are less than 1, meaning horizontal stress is less than vertical stress in a purely gravitationally loaded elastic medium. However, measured horizontal stresses frequently *exceed* vertical stress at shallow depths, demonstrating that tectonic processes are significant contributors.

## 5.3 Anderson's Theory of Faulting and Stress Regimes

E.M. Anderson (1951) recognized that the Earth's surface is a principal stress plane (no shear stress on the free surface), so one principal stress is always vertical. The three possible orderings of \(S_v\), \(S_H\), and \(S_h\) define three **stress regimes**:

- **Normal faulting regime:** \(S_v > S_H > S_h\). Vertical stress is largest; rock fails by normal faults dipping ~60° from horizontal.
- **Strike-slip regime:** \(S_H > S_v > S_h\). Intermediate vertical stress; rock fails by vertical strike-slip faults.
- **Reverse/thrust faulting regime:** \(S_H > S_h > S_v\). Vertical stress is smallest; rock fails by low-angle thrust faults.

Anderson's theory explains the global distribution of fault types in terms of the contemporary stress field and is the conceptual foundation for using earthquake focal mechanisms to infer stress orientation.

## 5.4 Stress Measurement Methods

### 5.4.1 Hydraulic Fracturing

The most direct method for measuring the magnitude of the minimum horizontal stress \(S_h\) in a borehole is **hydraulic fracturing** (minifrac or XLOT — extended leak-off test). A section of borehole is isolated with packers, and fluid is pumped in until a tensile fracture propagates from the borehole wall perpendicular to \(S_h\) (since fractures open perpendicular to the minimum stress).

The key pressures are:
- **Fracture initiation pressure** \(P_i\): the wellbore pressure at which the borehole wall first fractures. Derived in Chapter 8.
- **Fracture propagation pressure** \(P_p\): the pressure required to propagate the fracture.
- **Shut-in pressure** \(P_{si}\): after pumping stops, this is the pressure at which the fracture closes. This directly equals \(S_h\) (because the fracture closes when the fluid pressure supporting the fracture walls equals the compressive stress trying to close them):

\[
S_h = P_{si}
\]

The maximum horizontal stress \(S_H\) is estimated from \(P_i\) using the Kirsch solution (Chapter 7).

### 5.4.2 Overcoring

**Overcoring** (stress relief) involves drilling a small pilot hole, installing a strain gauge rosette or a triaxial cell, and then drilling a large-diameter overcoring bit concentrically around the pilot hole. As the annular core is cut, the rock is mechanically relieved of in-situ stress and the strain gauges record the elastic springback. Knowing the elastic constants of the core, the in-situ stresses can be back-calculated from the measured strains. This gives the full 3D stress tensor.

### 5.4.3 Borehole Breakouts

When \(S_H \neq S_h\), the stress concentration around a borehole (Kirsch solution) creates a non-uniform hoop stress. If this compressive stress exceeds the rock's compressive strength, spalling occurs preferentially in the direction of \(S_H\) (where compressive stress concentration is greatest). These **breakout zones**, detected by caliper logs and borehole image logs, give the *orientation* of \(S_H\) (perpendicular to the breakout direction) and provide bounds on stress magnitude.

---

# Chapter 6: Rock Failure Criteria

## 6.1 The Nature of Rock Failure

Rock failure — in the engineering sense — means the rock can no longer maintain equilibrium under the applied loading without undergoing irreversible deformation that compromises the design function. Two end-member mechanisms govern failure:

**Brittle failure** occurs when the rock fractures abruptly with little prior plastic deformation. Intact rock at low confining stress fails this way. The failed material has lower strength than the intact rock — the **residual strength** after peak may be as little as 30% of the peak.

**Ductile (plastic) failure** occurs when the rock deforms continuously without a sudden stress drop. This is favoured by high confining stress (which suppresses crack opening), elevated temperature, and in weak rocks such as halite or chalk. The **brittle-ductile transition** occurs at confining stresses of approximately 100–300 MPa for most crustal rocks.

## 6.2 The Mohr-Coulomb Failure Criterion

The Mohr-Coulomb criterion is the foundational failure criterion for geomaterials. It states that shear failure occurs on a plane when the shear stress on that plane reaches a critical value that depends linearly on the normal stress:

<div class="theorem">
<strong>Mohr-Coulomb Criterion — Derivation.</strong> Postulate that shear failure on a plane occurs when:

\[
|\tau| = c + \sigma_n \tan\phi
\]

where \(c\) is <strong>cohesion</strong> (shear strength at zero normal stress) and \(\phi\) is the <strong>friction angle</strong> (angle of internal friction). Using the Mohr circle results from Chapter 2, the stress on a plane at angle \(\theta\) to \(\sigma_3\) in the principal stress plane is:

\[
\sigma_n = \frac{\sigma_1 + \sigma_3}{2} + \frac{\sigma_1 - \sigma_3}{2}\cos 2\theta, \qquad \tau = \frac{\sigma_1 - \sigma_3}{2}\sin 2\theta
\]

Failure occurs when the Mohr circle first touches the failure envelope \(\tau = c + \sigma_n \tan\phi\). The circle is tangent to the line at angle \(\phi\) to the \(\sigma_n\) axis when the perpendicular from the circle centre \(((\sigma_1+\sigma_3)/2, 0)\) to the line equals the radius \(R = (\sigma_1 - \sigma_3)/2\).

The perpendicular distance from centre \((C, 0)\) to line \(\tau = \sigma_n \tan\phi + c\) (or \(\sigma_n \sin\phi - \tau\cos\phi + c\cos\phi = 0\) in standard form) is:

\[
d = \frac{C\sin\phi + c\cos\phi}{\sqrt{\sin^2\phi + \cos^2\phi}} = C\sin\phi + c\cos\phi
\]

Setting \(d = R\):

\[
\frac{\sigma_1 + \sigma_3}{2}\sin\phi + c\cos\phi = \frac{\sigma_1 - \sigma_3}{2}
\]

Rearranging to express \(\sigma_1\) in terms of \(\sigma_3\):

\[
\sigma_1 = \sigma_3 \frac{1 + \sin\phi}{1 - \sin\phi} + \frac{2c\cos\phi}{1 - \sin\phi}
\]

Defining \(N_\phi = (1+\sin\phi)/(1-\sin\phi) = \tan^2(45° + \phi/2)\) and the <strong>uniaxial compressive strength</strong> \(\sigma_{ci} = 2c\cos\phi/(1-\sin\phi) = 2c\sqrt{N_\phi}\):

\[
\boxed{\sigma_1 = N_\phi \sigma_3 + \sigma_{ci}}
\]

The failure plane angle is \(\theta_f = 45° + \phi/2\) (from the \(\sigma_3\) direction). \(\square\)
</div>

The uniaxial tensile strength predicted by Mohr-Coulomb is \(\sigma_t = -\sigma_{ci}/N_\phi = -2c\cos\phi/(1+\sin\phi)\). In practice, Mohr-Coulomb is usually truncated at a tension cut-off because rocks are much weaker in tension than this formula predicts.

<div class="example">
<strong>Example 6.1: Mohr-Coulomb Failure Assessment.</strong> A rock has cohesion \(c = 8\) MPa and friction angle \(\phi = 35°\). At a point underground, the principal stresses are \(\sigma_1 = 50\) MPa and \(\sigma_3 = 15\) MPa. Is the rock at failure?

Compute: \(N_\phi = (1 + \sin 35°)/(1 - \sin 35°) = (1 + 0.574)/(1 - 0.574) = 1.574/0.426 = 3.70\).

\(\sigma_{ci} = 2(8)\cos 35° / (1 - \sin 35°) = 16 \times 0.819 / 0.426 = 30.8\) MPa.

The Mohr-Coulomb strength at \(\sigma_3 = 15\) MPa is:

\[
\sigma_1^{\text{fail}} = 3.70 \times 15 + 30.8 = 55.5 + 30.8 = 86.3 \text{ MPa}
\]

Since the actual \(\sigma_1 = 50\) MPa \(< 86.3\) MPa, the rock is <strong>not at failure</strong>. The factor of safety against shear failure is approximately \(86.3/50 = 1.73\).
</div>

## 6.3 The Griffith Fracture Criterion

A.A. Griffith (1921) proposed that the tensile strength of brittle materials is controlled by pre-existing microscopic cracks (flaws). An elliptical crack of half-length \(a\) in a tensile stress field \(\sigma\) will propagate catastrophically when the elastic strain energy released per unit crack extension equals the surface energy required to create new crack surfaces.

<div class="theorem">
<strong>Griffith Energy Balance.</strong> For a crack of half-length \(a\) in a plate of unit thickness under remote tension \(\sigma\), the elastic strain energy released by the presence of the crack (treating the crack as an ellipse with zero minor axis) is approximately:

\[
U_E = -\frac{\pi a^2 \sigma^2}{E'}, \qquad E' = \begin{cases} E & \text{(plane stress)} \\ E/(1-\nu^2) & \text{(plane strain)} \end{cases}
\]

The surface energy to create two crack surfaces of length \(2a\) is \(U_s = 4a\gamma_s\) where \(\gamma_s\) is surface energy per unit area. The total energy is \(U = U_E + U_s\). At the critical crack length \(a_c\), \(dU/da = 0\):

\[
\frac{d}{da}\left(-\frac{\pi a^2 \sigma^2}{E'} + 4a\gamma_s\right) = 0 \implies -\frac{2\pi a \sigma^2}{E'} + 4\gamma_s = 0
\]

\[
\sigma_c = \sqrt{\frac{2E'\gamma_s}{\pi a}}
\]

This is the <strong>Griffith tensile strength</strong>: smaller flaws give higher strength. In compression, the crack tip stress analysis modified for biaxial loading gives the parabolic Griffith criterion:

\[
(\sigma_1 - \sigma_3)^2 = 8T_0(\sigma_1 + \sigma_3), \quad \text{when} \quad \sigma_1 + 3\sigma_3 > 0
\]

\[
\sigma_3 = -T_0, \quad \text{when} \quad \sigma_1 + 3\sigma_3 \leq 0
\]

where \(T_0 = \sigma_{ci}/8\) is the uniaxial tensile strength. \(\square\)
</div>

The Griffith criterion transitions smoothly between tensile and compressive failure, unlike Mohr-Coulomb's sharp corners.

## 6.4 The Hoek-Brown Failure Criterion

The Hoek-Brown criterion (Hoek and Brown, 1980) was developed empirically to describe the nonlinear failure envelope of rock masses, which exhibit curvature in \(\sigma_1\)-\(\sigma_3\) space that the linear Mohr-Coulomb criterion cannot capture. The **generalized Hoek-Brown criterion** is:

<div class="theorem">
<strong>Hoek-Brown Criterion.</strong> For intact rock (or a rock mass), the relationship between major and minor principal stresses at failure is:

\[
\sigma_1 = \sigma_3 + \sigma_{ci}\left(m_b \frac{\sigma_3}{\sigma_{ci}} + s\right)^a
\]

where:
- \(\sigma_{ci}\) is the uniaxial compressive strength of the intact rock
- \(m_b\) is the reduced value of the Hoek-Brown constant \(m_i\) for the rock mass: \(m_b = m_i \exp\left(\frac{\text{GSI} - 100}{28 - 14D}\right)\)
- \(s\) is a constant reflecting the degree of fracturing: \(s = \exp\left(\frac{\text{GSI} - 100}{9 - 3D}\right)\)
- \(a\) is an exponent: \(a = \frac{1}{2} + \frac{1}{6}\left(e^{-\text{GSI}/15} - e^{-20/3}\right)\)
- GSI is the <strong>Geological Strength Index</strong> (0–100) representing rock mass quality
- \(D\) is a disturbance factor (0–1) accounting for blast damage

For intact rock, GSI = 100, \(D = 0\), giving \(m_b = m_i\), \(s = 1\), \(a = 0.5\), and the criterion reduces to:

\[
\sigma_1 = \sigma_3 + \sigma_{ci}\sqrt{m_i \frac{\sigma_3}{\sigma_{ci}} + 1}
\]

The uniaxial compressive strength of intact rock from the criterion is \(\sigma_{ci}\) (at \(\sigma_3 = 0\), \(\sigma_1 = \sigma_{ci}\sqrt{s} = \sigma_{ci}\)), and the uniaxial tensile strength is \(\sigma_t = -s\sigma_{ci}/m_b\). \(\square\)
</div>

The material constant \(m_i\) (ranging from about 4 for weak rocks like siltstone to 33 for strong granites) is determined by fitting the criterion to triaxial test data using a least-squares regression in \(\sigma_1\)-\(\sigma_3\) space.

## 6.5 The Drucker-Prager Criterion

For numerical modelling, a smooth yield surface without corners is computationally convenient. The **Drucker-Prager criterion** is a conical yield surface in principal stress space:

\[
\sqrt{J_2} = A + B I_1
\]

where \(A\) and \(B\) are constants related to \(c\) and \(\phi\). It is the 3D extension of Mohr-Coulomb that removes the corner at the stress axis, and the extended von Mises yield surface in the deviatoric plane.

---

# Chapter 7: Kirsch Solution — Stress Concentration Around a Circular Opening

## 7.1 Problem Statement

The Kirsch (1898) solution is one of the most important analytical results in rock mechanics. It gives the complete stress field around a circular opening of radius \(a\) in an infinite elastic plate subjected to far-field biaxial stresses \(P\) (horizontal) and \(Q\) (vertical), with the opening either unstressed (excavated tunnel) or pressurized by internal pressure \(p_w\).

The problem is solved using **Airy stress functions** in polar coordinates.

## 7.2 Airy Stress Functions

<div class="theorem">
<strong>Airy Stress Function Method.</strong> For a 2D linear elastic body in plane stress or plane strain, the equilibrium equations and compatibility condition are automatically satisfied if the stresses are derived from a single scalar function \(\Phi(r, \theta)\) — the Airy stress function — via:

\[
\sigma_{rr} = \frac{1}{r}\frac{\partial \Phi}{\partial r} + \frac{1}{r^2}\frac{\partial^2 \Phi}{\partial \theta^2}
\]

\[
\sigma_{\theta\theta} = \frac{\partial^2 \Phi}{\partial r^2}
\]

\[
\sigma_{r\theta} = -\frac{\partial}{\partial r}\left(\frac{1}{r}\frac{\partial \Phi}{\partial \theta}\right)
\]

The compatibility condition (in terms of \(\Phi\)) becomes the <strong>biharmonic equation</strong>:

\[
\nabla^4 \Phi = \nabla^2(\nabla^2 \Phi) = 0
\]

where in polar coordinates:

\[
\nabla^2 = \frac{\partial^2}{\partial r^2} + \frac{1}{r}\frac{\partial}{\partial r} + \frac{1}{r^2}\frac{\partial^2}{\partial \theta^2}
\]

The general solution for problems with the periodicity of the Kirsch problem is sought as:

\[
\Phi = f(r) + g(r)\cos 2\theta
\]

where the \(\cos 2\theta\) term captures the angular variation due to the biaxial (deviatoric) far-field stress.
</div>

## 7.3 Derivation of the Kirsch Solution

The far-field stress state — \(P\) horizontal, \(Q\) vertical — can be decomposed into:
- A **hydrostatic** part: \((P+Q)/2\) in all directions
- A **deviatoric** part: \((P-Q)/2\) at angle \(2\theta\)

**Hydrostatic part** (Lamé solution for a pressurized cylinder): For a hole of radius \(a\) in a hydrostatic far-field stress \(p_0 = (P+Q)/2\), with internal pressure \(p_w\), the solution is:

\[
\sigma_{rr}^{(1)} = p_0\left(1 - \frac{a^2}{r^2}\right) + p_w \frac{a^2}{r^2}
\]

\[
\sigma_{\theta\theta}^{(1)} = p_0\left(1 + \frac{a^2}{r^2}\right) - p_w \frac{a^2}{r^2}
\]

**Deviatoric part**: For a deviatoric far-field stress \(q = (P-Q)/2\), the appropriate Airy function is:

\[
\Phi^{(2)} = \left(Ar^2 + Br^4 + C r^{-2} + D\right)\cos 2\theta
\]

Applying boundary conditions: (i) stress-free borehole wall (\(\sigma_{rr} = \sigma_{r\theta} = 0\) at \(r = a\), for the deviatoric part), and (ii) far-field conditions (\(\sigma_{rr} \to q\cos 2\theta\), \(\sigma_{r\theta} \to -q\sin 2\theta\) as \(r \to \infty\)), uniquely determines the constants. The result:

\[
\sigma_{rr}^{(2)} = q\left(1 - \frac{4a^2}{r^2} + \frac{3a^4}{r^4}\right)\cos 2\theta
\]

\[
\sigma_{\theta\theta}^{(2)} = -q\left(1 + \frac{3a^4}{r^4}\right)\cos 2\theta
\]

\[
\sigma_{r\theta}^{(2)} = -q\left(1 + \frac{2a^2}{r^2} - \frac{3a^4}{r^4}\right)\sin 2\theta
\]

<div class="theorem">
<strong>Kirsch Solution (Complete).</strong> Superposing the hydrostatic and deviatoric parts, with \(p_0 = (P+Q)/2\) and \(q = (P-Q)/2\):

\[
\sigma_{rr} = \frac{P+Q}{2}\left(1 - \frac{a^2}{r^2}\right) + \frac{P-Q}{2}\left(1 - \frac{4a^2}{r^2} + \frac{3a^4}{r^4}\right)\cos 2\theta + p_w\frac{a^2}{r^2}
\]

\[
\sigma_{\theta\theta} = \frac{P+Q}{2}\left(1 + \frac{a^2}{r^2}\right) - \frac{P-Q}{2}\left(1 + \frac{3a^4}{r^4}\right)\cos 2\theta - p_w\frac{a^2}{r^2}
\]

\[
\sigma_{r\theta} = -\frac{P-Q}{2}\left(1 + \frac{2a^2}{r^2} - \frac{3a^4}{r^4}\right)\sin 2\theta
\]

At the borehole wall (\(r = a\), and for \(p_w = 0\)):

\[
\sigma_{rr}(a) = 0
\]

\[
\sigma_{\theta\theta}(a) = (P+Q) - 2(P-Q)\cos 2\theta
\]

The hoop stress ranges from a maximum of \(\sigma_{\theta\theta}^{\max} = 3P - Q\) (at \(\theta = 90°\), i.e., in the direction of minimum far-field stress) to a minimum of \(\sigma_{\theta\theta}^{\min} = 3Q - P\) (at \(\theta = 0°\)). \(\square\)
</div>

## 7.4 Application to Borehole Stability

### 7.4.1 Compressive Failure (Breakouts)

Breakouts form where \(\sigma_{\theta\theta}\) is maximum — in the azimuth of the minimum horizontal stress \(S_h\). Setting \(\sigma_{\theta\theta}^{\max} = 3S_H - S_h\) equal to the unconfined compressive strength \(\sigma_{ci}\) gives the breakout initiation condition:

\[
3S_H - S_h = \sigma_{ci} + \Delta P \text{ (poro-elastic terms)}
\]

The **breakout angle** \(\theta_b\) is the half-width of the failed zone around the borehole, determined by the condition \(\sigma_{\theta\theta}(\theta_b) = \sigma_{ci}\):

\[
\cos 2\theta_b = \frac{(P+Q) - \sigma_{ci}}{2(P-Q)}
\]

<div class="example">
<strong>Example 7.1: Breakout Analysis.</strong> In a vertical borehole, \(S_H = 60\) MPa (E-W), \(S_h = 40\) MPa (N-S), and the rock has \(\sigma_{ci} = 120\) MPa. Is the borehole stable?

At the borehole wall in the \(S_H\) direction (\(\theta = 90°\), using \(P = S_H = 60\), \(Q = S_h = 40\)):

\[
\sigma_{\theta\theta}^{\max} = 3(60) - 40 = 180 - 40 = 140 \text{ MPa}
\]

Since \(140 > 120 = \sigma_{ci}\), breakouts will form. The breakout angle:

\[
\cos 2\theta_b = \frac{(60 + 40) - 120}{2(60 - 40)} = \frac{100 - 120}{40} = \frac{-20}{40} = -0.5
\]

\[
2\theta_b = 120°, \quad \theta_b = 60°
\]

Breakouts span from \(\theta = 60°\) to \(120°\) on each side — a total breakout width of \(60°\) on each side of the minimum stress azimuth.
</div>

### 7.4.2 Tensile Failure (Hydraulic Fractures)

Tensile failure occurs when \(\sigma_{\theta\theta}\) drops below the tensile strength \(T_0\) (negative). This happens at \(\theta = 0°\) (in the direction of maximum horizontal stress) when wellbore pressure is raised. For an impermeable wellbore with internal pressure \(p_w\):

\[
\sigma_{\theta\theta}(\theta = 0) = 3Q - P - p_w
\]

Tensile fracture initiates when this equals \(-T_0\):

\[
p_w^{\text{frac}} = 3S_h - S_H + T_0
\]

This is the **fracture initiation pressure** used in hydraulic fracture design (Chapter 8).

---

# Chapter 8: Effective Stress and Pore Pressure

## 8.1 Terzaghi's Effective Stress Principle

Karl Terzaghi (1923) introduced the concept of **effective stress** to explain why saturated soils and rocks behave differently in drained versus undrained conditions. The key insight is that the fluid pressure (pore pressure \(p_f\)) acts to push grain contacts apart, reducing the mechanical effective stress that governs deformation and failure.

<div class="theorem">
<strong>Terzaghi Effective Stress Principle — Derivation.</strong> Consider a saturated porous medium. The total stress \(\sigma_{ij}\) is shared between the solid skeleton and the pore fluid. On any cutting plane through the medium, the total traction is carried partly by grain-to-grain contacts and partly by fluid pressure. For an isotropic medium with porosity \(\phi\), the area fraction carried by fluid is approximately \(\phi\) and by solid contacts is \((1-\phi)\).

However, Terzaghi argued (and subsequent experiments confirmed) that the deformation and shear strength of the porous medium depend not on \(\sigma_{ij}\) and \(p_f\) separately, but on the combination:

\[
\sigma'_{ij} = \sigma_{ij} - p_f \delta_{ij}
\]

where \(\sigma'_{ij}\) is the <strong>effective stress tensor</strong>. In scalar form for normal stresses:

\[
\sigma'_n = \sigma_n - p_f
\]

The physical argument: the pore fluid sustains hydrostatic pressure but contributes nothing to shear resistance (fluids have zero shear modulus). Therefore, all shear strength and volume change of the skeleton depend on \(\sigma'\), not \(\sigma\). \(\square\)
</div>

In a sedimentary basin at depth, the total vertical stress is \(S_v = \rho_r g z\). With hydrostatic pore pressure \(p_f = \rho_w g z\), the vertical effective stress is:

\[
\sigma'_v = S_v - p_f = (\rho_r - \rho_w) g z \approx (2650 - 1000) \times 9.81 \times z = 16.2 \text{ MPa/km}
\]

## 8.2 The Biot Coefficient

Terzaghi's principle assumes the solid grains are incompressible. For rocks with stiff, low-porosity grain contacts, this underestimates the pore pressure effect. **Biot (1941)** generalized the effective stress law:

\[
\sigma'_{ij} = \sigma_{ij} - \alpha p_f \delta_{ij}
\]

where \(\alpha = 1 - K_{\text{dry}} / K_{\text{grain}}\) is the **Biot-Willis coefficient** (\(0 \leq \alpha \leq 1\)). Here \(K_{\text{dry}}\) is the dry-frame bulk modulus and \(K_{\text{grain}}\) is the grain (mineral) bulk modulus. For a soft sandstone (low \(K_{\text{dry}}\)), \(\alpha \approx 0.8\)–\(0.9\). For stiff crystalline rock, \(\alpha \approx 0.1\)–\(0.3\). Terzaghi's formula is recovered in the limit \(K_{\text{dry}} \ll K_{\text{grain}}\).

## 8.3 Pore Pressure and the Failure Envelope

Substituting effective stress into the Mohr-Coulomb criterion:

\[
\tau = c + \sigma'_n \tan\phi = c + (\sigma_n - p_f)\tan\phi
\]

An increase in pore pressure shifts the Mohr circle to the left (toward lower effective normal stress) without changing its radius. If the original stress state is on the Mohr circle with diameter \((\sigma_1 - \sigma_3)\), increasing \(p_f\) moves the circle until it touches the failure envelope — causing shear failure at lower total stress. This is the mechanism of **induced seismicity**: injection of fluid into a fault zone raises pore pressure, reducing effective normal stress, and enabling fault slip at total stresses that previously kept the fault locked.

---

# Chapter 9: Hydraulic Fracturing

## 9.1 Fracture Mechanics Background

A hydraulic fracture is a tensile fracture propagated by fluid pressure. Its mechanics are governed by **linear elastic fracture mechanics (LEFM)**. The stress field near the tip of a mode I (opening) fracture in polar coordinates centered on the tip is:

\[
\sigma_{ij} = \frac{K_I}{\sqrt{2\pi r}} f_{ij}(\theta) + \text{higher order terms}
\]

where \(K_I\) is the **mode I stress intensity factor** (Pa·m^{1/2}). Propagation occurs when \(K_I \geq K_{Ic}\), the **fracture toughness** of the rock. For a penny-shaped fracture of radius \(R\) under internal fluid pressure \(p\) and far-field compressive stress \(\sigma_h = S_h\):

\[
K_I = 2(p - S_h)\sqrt{\frac{R}{\pi}}
\]

Fracture propagates when \(K_I = K_{Ic}\), giving the critical radius.

## 9.2 Fracture Initiation Pressure

From the Kirsch solution for a pressurized impermeable borehole in a biaxial far-field stress (\(S_H, S_h\)):

\[
\sigma_{\theta\theta}(r = a, \theta = 0) = 3S_h - S_H - p_w
\]

This is the minimum hoop stress, occurring in the direction of \(S_H\). A tensile fracture initiates when:

\[
\sigma_{\theta\theta} = -T_0 \implies p_w^{\text{initiation}} = 3S_h - S_H + T_0
\]

For a **permeable** borehole (fluid penetrates the formation), the pore pressure modifies the hoop stress, and the initiation pressure becomes:

\[
p_w^{\text{initiation}} = \frac{3S_h - S_H + T_0 - \eta p_0}{2 - \eta}, \qquad \eta = \frac{\alpha(1 - 2\nu)}{1 - \nu}
\]

where \(p_0\) is the pre-existing formation pore pressure and \(\eta\) is the poroelastic stress coefficient.

## 9.3 Hydraulic Fracture Applications

In unconventional resource development (shale gas, tight oil), hydraulic fracturing ("fracking") is used to create permeable fracture networks that allow hydrocarbons to flow from the ultra-low-permeability reservoir to the wellbore. The design must account for:

- **Proppant transport**: Sand or ceramic proppant is injected with the fracturing fluid to hold fractures open after pumping stops. Proppant settles by gravity in the fracture; optimal proppant size and fluid viscosity must balance settling against flowback.
- **Fracture height control**: Horizontal mechanical contrasts (e.g., soft shale interbedded with stiff limestone) control the vertical extent of the hydraulic fracture.
- **Wellbore integrity**: Casing and cement must withstand repeated pressure cycles without leaking to the surface or to shallower aquifers.
- **Induced seismicity**: Fluid injection (especially wastewater disposal after fracking) can reactivate pre-existing faults, causing felt earthquakes.

---

# Chapter 10: Underground Excavations and the Convergence-Confinement Method

## 10.1 Elasto-Plastic Response of a Circular Tunnel

When rock around a tunnel yields (fails), the failed zone forms a **plastic annulus** around the opening. Outside this zone, the rock remains elastic. The **convergence-confinement method (CCM)** tracks how the tunnel wall displacement (convergence) evolves as the tunnel is excavated and support is installed.

The three components of the CCM are:
1. **Ground Reaction Curve (GRC)**: the relationship between internal support pressure \(p_i\) and inward wall displacement \(u_a\).
2. **Support Characteristic Curve (SCC)**: the relationship between support pressure and support deformation.
3. **Longitudinal Displacement Profile (LDP)**: the relationship between distance from the tunnel face and fractional convergence.

## 10.2 Deriving the Ground Reaction Curve

<div class="theorem">
<strong>Elastic-Perfectly Plastic Solution for a Circular Tunnel.</strong> Consider a circular tunnel of radius \(a\) in a hydrostatic far-field stress \(p_0\) and internal support pressure \(p_i\), with a Mohr-Coulomb rock (cohesion \(c\), friction angle \(\phi\)).

<em>Elastic phase</em> (\(p_i > p_{i,\text{cr}}\)): the Lamé solution gives wall convergence:

\[
u_a^e = \frac{a}{2G}(p_0 - p_i)
\]

<em>Critical internal pressure for yield initiation</em>:

\[
p_{i,\text{cr}} = \frac{2p_0 - \sigma_{ci}}{1 + N_\phi}, \qquad N_\phi = \frac{1 + \sin\phi}{1 - \sin\phi}
\]

<em>Plastic phase</em> (\(p_i < p_{i,\text{cr}}\)): a plastic zone of radius \(r_p\) forms. Inside the plastic zone, the rock satisfies the Mohr-Coulomb yield condition; outside, it is elastic. Radial equilibrium:

\[
\frac{d\sigma_r}{dr} + \frac{\sigma_r - \sigma_\theta}{r} = 0
\]

In the plastic zone, \(\sigma_\theta = N_\phi \sigma_r + \sigma_{ci}\). Substituting:

\[
\frac{d\sigma_r}{dr} = \frac{(N_\phi - 1)\sigma_r + \sigma_{ci}}{r}
\]

This ODE has solution (with \(\sigma_r = p_i\) at \(r = a\)):

\[
\sigma_r = \left(p_i + \frac{\sigma_{ci}}{N_\phi - 1}\right)\left(\frac{r}{a}\right)^{N_\phi - 1} - \frac{\sigma_{ci}}{N_\phi - 1}
\]

Matching to the elastic solution at \(r = r_p\) gives the plastic radius:

\[
r_p = a\left[\frac{2p_0 - \sigma_{ci}(1 - 1/N_\phi)}{(1 + N_\phi)\left(p_i + \sigma_{ci}/(N_\phi-1)\right)}\right]^{1/(N_\phi - 1)}
\]

The wall convergence in the plastic state is:

\[
u_a = \frac{a}{2G}\left(p_0 - p_{i,\text{cr}}\right)\left(\frac{r_p}{a}\right)^2 \cdot \frac{(1-\nu)N_\phi + \nu}{1}
\]

(simplified version; the exact expression involves the dilatancy angle as well.)
</div>

## 10.3 Support Installation and the Support Characteristic Curve

A rock bolt, shotcrete shell, or steel set provides a resistance to convergence. The support characteristic curve is linear for most support types:

\[
p_s = K_s (u_a - u_{a,0})
\]

where \(K_s\) is the support stiffness and \(u_{a,0}\) is the displacement at the time of support installation. The equilibrium point where the GRC and SCC intersect gives the final convergence and support load. Installing support earlier (smaller \(u_{a,0}\)) engages more stiff (elastic) response from the ground, requiring less support capacity but larger support loads; installing later allows more convergence, reduces support loads but risks entering the unstable post-peak region.

## 10.4 Rock Mass Classification

Empirical tunnel design relies heavily on rock mass classification systems to estimate rock quality and required support.

**Rock Mass Rating (RMR)** — Bieniawski (1973): assigns scores (0–100) for six parameters: uniaxial compressive strength (0–15), RQD (3–20), joint spacing (5–20), joint condition (0–30), groundwater (0–15), and orientation adjustment (–60 to 0). Total RMR correlates with stand-up time and recommended support.

**Q-System** — Barton, Lien, Lunde (1974): \(Q = (RQD/J_n)(J_r/J_a)(J_w/SRF)\) where \(J_n\) is the number of joint sets, \(J_r\) the joint roughness number, \(J_a\) the joint alteration number, \(J_w\) the joint water reduction factor, and SRF the stress reduction factor. \(Q\) ranges from 0.001 (extremely poor) to 1000 (exceptionally good).

---

# Chapter 11: Rock Mass Characterization and Discontinuities

## 11.1 The Role of Discontinuities

Intact rock in the laboratory can be strong — UCS of granite may reach 200–300 MPa. But rock masses in the field contain pervasive systems of joints, faults, bedding planes, and foliation surfaces that drastically reduce their effective strength and introduce anisotropy. At the scale of engineering interest (metres to hundreds of metres), the rock mass behaviour is dominated by these discontinuities.

A **joint** (or fracture) is a planar geological discontinuity along which there has been no significant shear displacement. A **fault** is a discontinuity along which shear displacement has occurred. **Bedding planes** are the sedimentary interfaces between depositional layers. These features form **discontinuity sets** — groups of nearly parallel fractures with similar orientation.

## 11.2 Rock Quality Designation (RQD)

**RQD** (Deere, 1963) quantifies the degree of fracturing from drill core:

\[
\text{RQD} = \frac{\sum \text{lengths of core pieces} \geq 10\text{ cm}}{\text{total core run length}} \times 100\%
\]

A rock with RQD of 100% has no fractures within 10 cm; RQD of 0% is completely disintegrated. The relationship to fracture frequency \(\lambda\) (fractures/m) is approximately:

\[
\text{RQD} = 100 e^{-0.1\lambda}(0.1\lambda + 1)
\]

This arises because the probability of a core piece being longer than threshold \(t = 10\) cm in a Poisson fracture process is \(P(l > t) = e^{-\lambda t}\), giving \(E[\text{RQD}] = 100\int_{t}^{\infty} \lambda x e^{-\lambda x} dx / 1\).

## 11.3 Statistical Description of Fractures

Fracture systems are described statistically:

**Orientation** is plotted on a stereonet (equal-area or equal-angle projection of the lower hemisphere of a unit sphere). A fracture plane of dip \(\delta\) and dip direction \(\alpha\) plots as a great circle; its pole (normal vector) plots as a point. Clustering of poles on the stereonet reveals distinct joint sets. The **Fisher distribution** describes the spherical dispersion of poles around a mean:

\[
p(\theta) = \frac{\kappa}{4\pi \sinh\kappa} e^{\kappa\cos\theta}
\]

where \(\kappa\) is the concentration parameter and \(\theta\) is the angle from the mean pole.

**Spacing** — the perpendicular distance between adjacent fractures of the same set — is typically modelled as a **negative exponential distribution** (Poisson process in 1D):

\[
f(s) = \lambda e^{-\lambda s}, \qquad \bar{s} = 1/\lambda
\]

**Persistence** (fracture length) is often described by exponential, lognormal, or power-law distributions. Power-law length distributions (\(f(l) \propto l^{-\alpha}\)) arise naturally from fractal fracture systems and have important implications for connectivity and permeability.

---

# Chapter 12: Rock Slope Stability

## 12.1 The Safety Factor

The **factor of safety** (FoS) is defined as the ratio of resisting forces (or moments) to driving forces (or moments) at the critical failure surface:

\[
F = \frac{\text{Resisting force}}{\text{Driving force}}
\]

A FoS of 1.0 means the slope is exactly at the point of failure; \(F > 1\) means stable, \(F < 1\) means unstable. Typical design targets are \(F = 1.3\)–\(1.5\) for civil slopes and \(F = 1.1\)–\(1.2\) for temporary mine slopes.

## 12.2 Planar Failure Analysis

Planar failure occurs when a block of rock slides on a single planar discontinuity. Consider a block of weight \(W\) on a plane inclined at angle \(\psi_p\) to the horizontal, with cohesion \(c_j\) and friction angle \(\phi_j\) on the joint, and pore pressure \(U\) on the joint surface.

<div class="theorem">
<strong>Planar Failure Factor of Safety — Derivation.</strong> The forces on the block are: weight \(W\) acting vertically (resolved into normal component \(N = W\cos\psi_p\) and downslope component \(T = W\sin\psi_p\)), water pressure \(U\) (reducing effective normal force), and joint shear strength \(S_r = c_j A + (N - U)\tan\phi_j\) (resisting).

Equilibrium along the slope:

\[
F = \frac{S_r}{T} = \frac{c_j A + (W\cos\psi_p - U)\tan\phi_j}{W\sin\psi_p}
\]

With a <strong>tension crack</strong> at the crest, filled with water to depth \(z_w\), additional water forces modify the driving and resisting forces:
- \(V = \frac{1}{2}\rho_w g z_w^2\) (horizontal water force in tension crack, acting on the back of the block)
- \(U = \frac{1}{2}\rho_w g z_w \ell_w\) (uplift on the base, where \(\ell_w\) is the wetted length of the base)

\[
F = \frac{c_j A + (W\cos\psi_p - U - V\sin\psi_p)\tan\phi_j}{W\sin\psi_p + V\cos\psi_p}
\]

This FoS decreases with increasing water level — explaining why slope failures are triggered by rainstorms. \(\square\)
</div>

For a kinematically feasible planar failure, the dip of the failure plane must satisfy \(\phi_j < \psi_p < \psi_f\) (where \(\psi_f\) is the slope face angle), and the strike of the failure plane must be within approximately ±20° of the slope face strike.

## 12.3 Wedge Failure

A wedge is formed by two discontinuity planes that intersect in a line, with the line plunging out of the slope face. Wedge failure involves simultaneous sliding on both planes. The factor of safety depends on the friction angles on each plane (\(\phi_A, \phi_B\)), the cohesions (\(c_A, c_B\)), and the geometry of the wedge (angles between planes and slope). The three-dimensional analysis uses vector methods to resolve forces along each sliding plane.

For a dry wedge with no cohesion, the FoS depends only on the friction angles and the geometry parameter \(\xi\):

\[
F = \frac{\tan\phi_A}{\tan\psi_i}\cdot X + \frac{\tan\phi_B}{\tan\psi_i}\cdot Y
\]

where \(\psi_i\) is the plunge of the line of intersection and \(X, Y\) are geometric factors computed from the wedge geometry using the formula in Hoek et al. (2000).

## 12.4 Circular Failure Analysis

In weak rock masses (highly fractured, or weak materials like coal or clay-bearing rocks), failure surfaces are approximately circular, cutting through the intact rock and multiple discontinuities rather than following a single plane. The **Bishop simplified method** finds the FoS for a circular failure surface by dividing the sliding mass into vertical slices and summing moments about the centre of the circle:

\[
F = \frac{\sum \left[\frac{c_j b + (W - ub)\tan\phi_j}{m_\alpha}\right]}{\sum W\sin\alpha}
\]

where \(\alpha\) is the base angle of each slice, \(b\) is the slice width, \(u\) is the pore pressure at the base, and \(m_\alpha = \cos\alpha(1 + \tan\alpha\tan\phi_j/F)\).

---

# Chapter 13: Probabilistic Analysis and Monte Carlo Methods

## 13.1 Uncertainty in Rock Engineering

The input parameters to a stability calculation are never known precisely. The UCS of a rock varies from test to test; the friction angle depends on surface roughness which varies spatially; pore pressure depends on rainfall, seasonal variation, and drainage. These uncertainties propagate through the deterministic equations to produce uncertainty in the computed factor of safety.

The key distinction is between:
- **Variability**: inherent randomness in the property (e.g., joint spacing follows an exponential distribution)
- **Uncertainty**: epistemic uncertainty due to limited sampling (we have only 10 strength tests, but the true mean is unknown)

Both can be captured in probability distributions assigned to input parameters.

## 13.2 Probability Distributions for Rock Properties

Common distributions used in rock mechanics:
- **Normal distribution**: appropriate for UCS (symmetric scatter around a mean), parameterized by mean \(\mu\) and standard deviation \(\sigma\).
- **Lognormal distribution**: appropriate for parameters that are inherently positive and right-skewed (joint spacing, hydraulic conductivity). If \(X \sim \text{Lognormal}(\mu_{\ln X}, \sigma_{\ln X})\), then \(\ln X \sim N(\mu_{\ln X}, \sigma_{\ln X}^2)\).
- **Triangular distribution**: used when only the minimum, most likely, and maximum values are known (common in early-stage design).
- **Beta distribution**: bounded distribution for fractions (e.g., degree of saturation, RQD).

## 13.3 The Monte Carlo Method

<div class="theorem">
<strong>Monte Carlo Simulation — Principle.</strong> Let \(F = f(X_1, X_2, \ldots, X_n)\) be a function (e.g., the FoS equation) of random input parameters \(X_i\), each with a known probability distribution \(f_{X_i}(x)\).

The Monte Carlo method estimates the distribution of \(F\) by:
1. Generate \(N\) random samples \(\{x_1^{(k)}, x_2^{(k)}, \ldots, x_n^{(k)}\}_{k=1}^{N}\), where each \(x_i^{(k)}\) is drawn from the distribution of \(X_i\).
2. Evaluate \(F^{(k)} = f(x_1^{(k)}, \ldots, x_n^{(k)})\) for each sample.
3. The empirical distribution of \(\{F^{(k)}\}\) approximates the true distribution of \(F\).

The <strong>probability of failure</strong> is:

\[
P_f = P(F < 1) \approx \frac{\text{number of samples with } F^{(k)} < 1}{N}
\]

The standard error on this estimate is \(\sqrt{P_f(1-P_f)/N}\), so for \(P_f = 0.01\) and \(N = 10000\), the standard error is about 0.001.
</div>

For independent normally distributed input parameters, the mean and variance of \(F\) can also be approximated analytically using the **First-Order Second-Moment (FOSM)** method:

\[
\mu_F \approx f(\mu_{X_1}, \ldots, \mu_{X_n})
\]

\[
\sigma_F^2 \approx \sum_{i=1}^{n} \left(\frac{\partial f}{\partial X_i}\right)^2 \sigma_{X_i}^2
\]

The **reliability index** \(\beta = (\mu_F - 1)/\sigma_F\) measures the number of standard deviations the mean FoS is above the failure threshold; for a normal distribution, \(P_f = \Phi(-\beta)\) where \(\Phi\) is the standard normal CDF.

<div class="example">
<strong>Example 13.1: Monte Carlo for Planar Slope Stability.</strong> A rock slope has the following uncertain parameters (all normally distributed):

| Parameter | Mean | Std. Dev. |
|---|---|---|
| Cohesion \(c_j\) | 10 kPa | 3 kPa |
| Friction angle \(\phi_j\) | 35° | 4° |
| Failure plane dip \(\psi_p\) | 40° | 2° |
| Slope height \(H\) | 30 m | — (deterministic) |
| Rock density \(\rho\) | 2650 kg/m³ | — (deterministic) |

The deterministic FoS (using mean values, dry slope):

\[
F = \frac{c_j A + W\cos\psi_p \tan\phi_j}{W\sin\psi_p}
\]

With a slope angle of 60°, the block geometry gives \(W = \frac{1}{2}\rho g H^2 (\cot\psi_p - \cot 60°) = 5.2\) MN/m run.

\[
F_{\text{mean}} = \frac{10 000 \times A + 5.2 \times 10^6 \cos 40° \times \tan 35°}{5.2 \times 10^6 \sin 40°} \approx 1.36
\]

Monte Carlo with 50,000 samples gives \(P_f \approx 4.2\%\) — a substantial probability of failure despite a mean FoS of 1.36, because the standard deviation of \(F\) is about 0.22.
</div>

---

# Chapter 14: Seismicity and Microseismic Monitoring

## 14.1 Earthquake Magnitude and the Gutenberg-Richter Relation

Earthquakes — including the small earthquakes induced by mining and fluid injection — follow a remarkably consistent statistical relationship between frequency and magnitude. The **Gutenberg-Richter (GR) law** states:

\[
\log_{10} N(\geq m) = a - bm
\]

where \(N(\geq m)\) is the number of earthquakes with magnitude \(\geq m\) in a given region and time period, and \(a\) and \(b\) are constants. The **b-value** (typically close to 1 in natural seismicity) describes the relative abundance of small versus large events.

<div class="theorem">
<strong>Physical Basis and b-value Estimation.</strong> The GR law is equivalent to saying that earthquake moment \(M_0\) follows a power-law distribution. Since moment magnitude \(m_w = (2/3)\log_{10} M_0 - 6.07\), the GR law implies \(P(M_0 > m_0) \propto m_0^{-2b/3}\) — a Pareto distribution.

The b-value is estimated from a catalogue by the <strong>maximum likelihood estimator</strong>:

\[
\hat{b} = \frac{\log_{10} e}{\overline{m} - m_c}
\]

where \(\overline{m}\) is the mean magnitude of all events above the completeness magnitude \(m_c\), and \(\log_{10} e = 1/\ln(10) \approx 0.4343\).

<em>Derivation</em>: The GR law implies that magnitudes above \(m_c\) follow a shifted exponential distribution with PDF:

\[
f(m) = \beta e^{-\beta(m - m_c)}, \quad m \geq m_c, \quad \beta = b\ln 10
\]

The MLE of \(\beta\) from \(N\) observations \(\{m_i\}\) maximizes the log-likelihood \(\sum \ln f(m_i) = N\ln\beta - \beta\sum(m_i - m_c)\). Setting the derivative to zero: \(\hat{\beta} = N/\sum(m_i - m_c) = 1/(\overline{m} - m_c)\), so \(\hat{b} = \hat{\beta}/\ln 10 = \log_{10} e / (\overline{m} - m_c)\). \(\square\)
</div>

Changes in b-value are diagnostically important. In mining, the b-value decreases (ratio of large to small events increases) in regions approaching rock burst conditions. In fluid injection, changes in b-value and the spatial-temporal migration of seismicity help identify the stimulated fracture network.

## 14.2 Focal Mechanisms

An earthquake's **focal mechanism** (beach ball diagram) describes the geometry of the fault and the slip direction from the pattern of compressional and dilatational first arrivals at seismic stations. For induced seismicity, focal mechanisms confirm whether events are consistent with reactivation of faults oriented favorably in the regional stress field, and they help infer stress orientation.

**Coulomb failure stress change (CFSC):** The change in Coulomb stress on a target fault due to an earthquake (or injection) is:

\[
\Delta\text{CFS} = \Delta\tau_s + \mu'(\Delta\sigma_n - \Delta p_f)
\]

where \(\Delta\tau_s\) is the change in shear stress on the fault (positive in the slip direction), \(\Delta\sigma_n\) is the change in normal stress (positive = clamping, negative = unclamping), \(\mu'\) is the effective friction coefficient, and \(\Delta p_f\) is the pore pressure change. Positive CFSC brings the fault closer to failure.

## 14.3 Induced Seismicity

**Mining-induced seismicity** arises from stress redistribution as ore bodies are extracted. The abutment stress ahead of a longwall panel or around mine pillars can exceed the rock mass strength and trigger sudden failure events (rock bursts) that release seismic energy. Design countermeasures include: de-stressing blast holes, yielding pillars, hydraulic backfill, and real-time microseismic monitoring with automated alarm systems.

**Injection-induced seismicity** arises from fluid injection (hydraulic fracturing, wastewater disposal, geothermal stimulation, CO₂ storage). The primary mechanism is pore pressure diffusion along pre-existing faults, reducing effective normal stress and triggering shear failure. The critical factor is whether critically stressed faults (close to failure in the ambient stress field) exist within the pressure diffusion radius. The **Traffic Light Protocol (TLP)** — widely used in geothermal operations — ties operational decisions (continue, reduce, stop injection) to real-time seismic monitoring.

---

# Chapter 15: Reservoir Geomechanics

## 15.1 Pore Pressure and Temperature Changes in Reservoirs

During petroleum production, reservoir pore pressure decreases as fluids are withdrawn. During geothermal operations or steam injection for heavy oil recovery, temperature changes occur. Both perturbations modify in-situ stresses, which can drive compaction, surface subsidence, fault reactivation, and changes in injection/fracture pressure.

## 15.2 Stress Changes Due to Pore Pressure Change

For a laterally extensive (tabular) reservoir with zero lateral strain (\(\varepsilon_x = \varepsilon_y = 0\)) — the uniaxial strain condition — the change in horizontal stress due to a change in pore pressure \(\Delta p_f\) is:

<div class="theorem">
<strong>Reservoir Horizontal Stress Change — Derivation.</strong> Apply Hooke's law in the horizontal direction with \(\varepsilon_x = 0\):

\[
0 = \frac{1}{E}\left[\Delta\sigma_x - \nu(\Delta\sigma_y + \Delta\sigma_z)\right] - \alpha_p \Delta p_f
\]

where \(\alpha_p = \alpha(1 - 2\nu)/(1 - \nu)\) is the poroelastic expansion coefficient. By symmetry \(\Delta\sigma_x = \Delta\sigma_y = \Delta\sigma_h\). For a reservoir of finite vertical extent (no constraint from the free surface), the vertical stress change is approximately zero (\(\Delta\sigma_z = 0\)):

\[
0 = \frac{1}{E}\left[\Delta\sigma_h - \nu \Delta\sigma_h\right] - \alpha_p \Delta p_f
\]

\[
\Delta\sigma_h = \frac{\alpha_p E}{1 - \nu} \Delta p_f = \alpha\frac{1 - 2\nu}{1 - \nu}\Delta p_f
\]

The ratio \(C_{\text{res}} = \Delta\sigma_h / \Delta p_f = \alpha(1 - 2\nu)/(1 - \nu)\) is the <strong>reservoir stress path coefficient</strong>. For typical reservoir rocks, \(C_{\text{res}} \approx 0.5\)–\(0.7\). \(\square\)
</div>

As reservoir pressure depletes, horizontal stress decreases (by about 0.5–0.7 times the pressure decrease), while vertical stress remains approximately constant. This narrows the horizontal-to-vertical stress difference, potentially changing the fracture orientation regime and making hydraulic fractures easier to initiate.

## 15.3 Reservoir Compaction and Surface Subsidence

The vertical compaction of a reservoir due to pressure depletion is:

\[
\Delta H = C_m \Delta p_f H
\]

where \(C_m = \alpha(1 - 2\nu)/[E(1-\nu)]\) is the uniaxial compressibility and \(H\) is the reservoir thickness. The surface subsidence above the reservoir is related to the compaction by the **influence function** approach (Geertsma, 1973) — the subsidence bowl spreads laterally beyond the reservoir boundary, with maximum subsidence at surface \(\approx 0.5\)-\(1.0\) times the reservoir compaction depending on depth and width-to-depth ratio.

---

# Chapter 16: In-Situ Stress Measurement — Advanced Methods

## 16.1 Hydraulic Tests on Pre-Existing Fractures (HTPF)

The standard hydraulic fracturing test creates a new fracture; its orientation is controlled by the stress field and may not sample all stress components. **HTPF** tests instead re-open pre-existing fractures of known orientation (from a borehole image log). The reopening pressure equals:

\[
p_r = \sigma_n^{\text{effective}} + p_0
\]

where \(\sigma_n^{\text{effective}}\) is the total normal stress on the fracture plane minus the formation pore pressure. By testing multiple fractures of different orientations, the full stress tensor can be determined.

## 16.2 The Kaiser Effect and Acoustic Emission

When a rock specimen is loaded in compression, acoustic emission (AE) — bursts of elastic energy from microcrack growth — occurs. When a specimen is unloaded and then reloaded, AE is suppressed until the load exceeds the previous maximum stress — the **Kaiser effect**. By loading core samples in multiple directions and identifying the Kaiser stress threshold in each direction, the in-situ principal stresses that the rock experienced can be inferred. This **DSCA (Differential Strain Curve Analysis)** technique provides stress information from archive drill core without returning to the borehole.

## 16.3 Borehole Breakout Geometry and Stress Magnitude

The width of the breakout zone (angular extent of the failed region around the borehole) depends on the stress ratio \(S_H/S_h\) and the rock strength. Combining the Kirsch solution for hoop stress with the Mohr-Coulomb failure criterion and the measured breakout width \(2\theta_b\):

\[
S_H = \frac{\sigma_{ci}(1 + \sin\phi) + S_h(1 - \sin\phi)(1 + 2\cos 2\theta_b / \sin 2\theta_b \cdot \text{term})}{...}
\]

In practice, an iterative numerical solution is used. The breakout width provides a constraint on the stress *magnitude* (not just orientation), which is valuable when hydraulic fracturing tests are not available.

---

# Chapter 17: Creep and Time-Dependent Behaviour

## 17.1 Creep Stages

Many rocks — particularly soft rocks such as salt, potash, chalk, and clay-bearing shales — exhibit **creep**: continued deformation under constant stress. The classical creep curve has three stages:

**Primary creep** (transient): immediately following stress application, strain rate is rapid but decelerating. Governed by recoverable microstructural rearrangements (crack closure, grain boundary sliding, dislocation glide).

**Secondary creep** (steady-state): a period of approximately constant strain rate \(\dot{\varepsilon}_s\). The steady state is reached when damage creation and recovery are in balance. The **power law creep** relationship:

\[
\dot{\varepsilon}_s = A \sigma^n \exp\left(-\frac{Q}{RT}\right)
\]

where \(A\) and \(n\) are material constants, \(Q\) is activation energy, \(R\) is the gas constant, and \(T\) is absolute temperature. \(n \approx 3\)–\(5\) for most rock-forming minerals.

**Tertiary creep**: accelerating strain rate leading to failure. Associated with progressive damage accumulation, microcrack coalescence, and ultimately macroscopic fracture.

## 17.2 Rheological Models

Simple rheological models built from elastic (spring) and viscous (dashpot) elements reproduce aspects of observed rock creep behaviour:

- **Maxwell model** (spring + dashpot in series): instantaneous elastic strain followed by linear viscous flow. No recovery on unloading.
- **Kelvin-Voigt model** (spring + dashpot in parallel): delayed elastic response, full recovery on unloading, no instantaneous strain.
- **Burger's model** (Maxwell + Kelvin in series): combines instantaneous elasticity, delayed elasticity, and permanent viscous flow. A reasonable first model for soft rock creep.

The Kelvin-Voigt creep function (strain at constant stress \(\sigma_0\)):

\[
\varepsilon(t) = \frac{\sigma_0}{E_K}\left(1 - e^{-t/\tau}\right), \qquad \tau = \eta / E_K
\]

where \(E_K\) is the spring stiffness and \(\eta\) is the dashpot viscosity.

---

# Chapter 18: Dynamic Rock Behaviour and Wave Propagation

## 18.1 Elastic Wave Velocities

Seismic waves propagate through rock as elastic deformations. The two body wave types are:

**P-waves (compressional):** particle motion parallel to propagation direction. Velocity:

\[
V_P = \sqrt{\frac{K + \frac{4}{3}G}{\rho}} = \sqrt{\frac{\lambda + 2\mu}{\rho}}
\]

**S-waves (shear):** particle motion perpendicular to propagation direction. Velocity:

\[
V_S = \sqrt{\frac{G}{\rho}} = \sqrt{\frac{\mu}{\rho}}
\]

Since \(K > 0\), \(V_P > V_S\) always. The **Poisson's ratio** can be derived from wave velocities:

\[
\nu = \frac{(V_P/V_S)^2 - 2}{2\left[(V_P/V_S)^2 - 1\right]}
\]

This provides an in-situ method for estimating Poisson's ratio from seismic surveys.

**Dynamic versus static moduli:** Wave velocities give **dynamic** elastic moduli. Static moduli (from deformation tests) are typically 20–50% lower because static tests operate at lower strain rates and allow time-dependent effects (crack closure, creep) to contribute to measured deformation. The ratio \(E_{\text{static}}/E_{\text{dynamic}}\) decreases with increasing porosity and fracturing.

## 18.2 Microseismic Monitoring

Microseismic events (magnitude \(-3\) to \(+0\)) generated by hydraulic fracturing, mining, and fault reactivation are detected by arrays of geophones. **Event location** is determined by picking P-wave and S-wave arrival times at multiple stations and using travel-time inversion:

\[
t_i^{\text{obs}} - t_i^{\text{calc}}(\mathbf{x}_s) = 0, \quad i = 1, \ldots, N
\]

where \(\mathbf{x}_s\) is the source location. The system is solved by least-squares (over-determined) or grid search.

The **spatio-temporal migration** of microseismicity maps the growth of the stimulated fracture network during hydraulic fracturing and reveals how pressure diffuses along permeable pathways. The diffusivity \(D\) of the pore pressure front can be estimated from the envelope of seismicity spread:

\[
r = \sqrt{4\pi D t}
\]

where \(r\) is the distance of the seismicity front from the injection well and \(t\) is the time since injection began.

---

# Chapter 19: Numerical Methods in Rock Mechanics

## 19.1 Overview of Numerical Approaches

Analytical solutions such as the Kirsch solution are exact but require simplified geometry and material behaviour. Real rock engineering problems require numerical methods. The main approaches are:

**Finite Element Method (FEM):** The rock domain is discretized into elements; displacements are the primary unknowns. FEM handles heterogeneous, anisotropic, nonlinearly elastic and plastic materials and complex geometries. It requires the domain to be fully meshed (including the far field, unless infinite elements or boundary conditions are used).

**Boundary Element Method (BEM):** Only the boundary is discretized. Efficient for problems with simple material behaviour but complex geometry (multiple openings, fractures). The displacement discontinuity method (a form of BEM) is standard for fracture mechanics problems including hydraulic fracture simulation.

**Distinct Element Method (DEM/DEM):** Represents the rock mass as an assembly of discrete blocks (rock blocks between fractures). Blocks can translate, rotate, and contact each other; fractures open and close. Essential for problems where block motion dominates (kinematic analyses, mining cave propagation). UDEC (2D) and 3DEC (3D) are commercial implementations.

**Finite Difference Method (FDM):** Time-domain explicit FDM is used in codes like FLAC and FLAC3D for quasi-static geomechanical analyses and in UDEC for dynamic problems.

## 19.2 THMC Coupling

Modern reservoir geomechanics problems require **THMC coupling** — simultaneous treatment of Thermal, Hydraulic, Mechanical, and Chemical processes. An example: CO₂ injection into a saline aquifer involves (T) temperature changes due to cold CO₂ injection, (H) multi-phase flow of CO₂ and brine through the porous medium, (M) geomechanical deformation and potential fault reactivation, and (C) geochemical reactions between CO₂, brine, and rock minerals that can alter permeability and porosity. Fully coupled THMC simulations require iterative or simultaneous solution of heat transport, flow, deformation, and reaction equations.

---

# Chapter 20: Special Topics in Rock Mechanics

## 20.1 Shale Gas Geomechanics

The extraction of gas from organic-rich shales (e.g., Montney, Horn River, Marcellus, Barnett) requires massive hydraulic fracturing programs that differ from conventional reservoirs in several important ways:

**Natural fracture networks**: Shales are often naturally fractured; hydraulic fractures interact with and open these natural fractures, creating a complex fracture network rather than a single bi-wing fracture. The complexity is described by the **Fracture Complexity Index (FCI)**.

**Anisotropic strength**: Shale mechanical properties are strongly anisotropic, with UCS and elastic moduli differing by factors of 2–3 between the bedding-parallel and bedding-perpendicular directions. This anisotropy controls fracture height containment and borehole stability during drilling.

**Stress shadow**: When multiple hydraulic fractures are propagated from closely spaced perforation clusters along a horizontal well, each fracture alters the local stress field, creating a "stress shadow" that affects the propagation of adjacent fractures. Fractures initiated from clusters in the stress shadow of previous fractures may be suppressed or diverted.

**Brittleness index:** For hydraulic fracture effectiveness, brittle rocks that fracture crisply and hold fractures open are preferred over ductile rocks that close fractures. Brittleness is measured by the **brittleness index** \(B = (E\% + \nu\%)/2\), where \(E\%\) and \(\nu\%\) are normalized Young's modulus and inverse Poisson's ratio relative to the formation range.

## 20.2 CO₂ Sequestration Geomechanics

Geological sequestration of CO₂ in deep saline aquifers or depleted reservoirs requires geomechanical analysis to ensure:

1. **Caprock integrity**: the overlying seal must not fracture or allow CO₂ to migrate upward. The maximum sustainable injection pressure is limited by the fracture initiation pressure of the caprock.
2. **Fault stability**: CO₂ injection raises pore pressure, which may reactivate faults within the pressure footprint. A **fault stability analysis** computes the Coulomb stress change on all mapped faults.
3. **Well integrity**: pressure and temperature cycling from CO₂ injection must not compromise casing-cement bonds.
4. **Ground surface deformation**: injection-induced uplift must stay within regulatory limits and not damage surface infrastructure.

## 20.3 Geothermal Reservoir Engineering

Enhanced Geothermal Systems (EGS) involve hydraulic stimulation of hot crystalline rock (granites at 3–5 km depth, temperatures 150–300°C) to create permeable heat exchange surfaces. The geomechanical challenges are:

- **Stimulation in hard rock**: granite has high tensile strength and fracture toughness; large injection volumes at high pressure are required.
- **Induced seismicity management**: EGS projects at Basel, Switzerland (2006) and Pohang, Korea (2017) were shut down due to induced earthquakes (M 3.4 and M 5.5 respectively). The Pohang event caused significant damage, leading to a global reassessment of induced seismicity risk management in EGS.
- **Thermal contraction**: as cold water circulates through hot rock, thermal contraction stresses develop that can enhance permeability (by opening existing fractures) but may also cause fatigue failure of the rock.

---

# Chapter 21: Rock Testing — Laboratory Methods

## 21.1 Uniaxial Compression Test

The **uniaxial compression test (UCS test)** loads a cylindrical rock core along its axis until failure. The ISRM recommended specimen length-to-diameter ratio is 2.0–2.5, with diameter \(\geq 54\) mm (NQ core size). The end surfaces must be flat and parallel to within 0.02 mm.

The test measures:
- **Peak compressive strength** (\(\sigma_{ci}\)): stress at failure = load / area
- **Young's modulus** (\(E\)): slope of the stress-strain curve (typically measured between 40% and 60% of peak stress)
- **Poisson's ratio** (\(\nu\)): ratio of lateral to axial strain (requires measurement of lateral deformation)

Post-peak behaviour (measured only on **stiff test machines** where machine stiffness exceeds the post-peak slope of the stress-strain curve) reveals whether the rock is Class I (stable post-peak) or Class II (unstable — requires controlled strain input to prevent explosive failure).

## 21.2 Triaxial Compression Test

In the **axisymmetric triaxial test**, a rock core sealed in a rubber membrane is placed in a pressure vessel filled with oil at confining pressure \(\sigma_3\). An axial load is then applied. At each \(\sigma_3\), the peak strength \(\sigma_1\) defines one point on the failure envelope; testing at multiple \(\sigma_3\) values defines the complete Mohr-Coulomb or Hoek-Brown failure envelope.

## 21.3 Brazilian Test (Indirect Tensile Strength)

Direct measurement of tensile strength is difficult (it is hard to grip rock specimens without inducing premature failure at the grips). The **Brazilian test** compresses a disc of rock across its diameter; the maximum tensile stress induced at the disc centre is:

\[
\sigma_t = \frac{2P}{\pi D t}
\]

where \(P\) is the applied load, \(D\) is the disc diameter, and \(t\) is the disc thickness. The Brazilian tensile strength is typically 0.05–0.1 times the UCS, and somewhat lower than the true direct tensile strength.

## 21.4 Direct Shear Test

The **direct shear test** measures the shear strength of a discontinuity. The specimen is placed in a shear box; a normal load is applied to the discontinuity surface, and a horizontal load shears the discontinuity. The peak shear strength (at each normal stress) and residual shear strength (at large displacement) define the peak and residual failure envelopes. The **Barton-Bandis criterion** for joint shear strength:

\[
\tau = \sigma_n \tan\left[\phi_r + JRC \cdot \log_{10}\left(\frac{JCS}{\sigma_n}\right)\right]
\]

where \(\phi_r\) is the residual friction angle, JRC is the joint roughness coefficient (0 for smooth; 20 for very rough), and JCS is the joint wall compressive strength, captures the roughness-dependent nonlinearity of joint shear strength.

---

# Chapter 22: Worked Integration — A Borehole Stability Case Study

## 22.1 Problem Statement

A 0.216 m (8.5 inch) diameter vertical borehole is drilled to 3 km depth in a sandstone formation. The in-situ stresses are:

\[
S_v = 75 \text{ MPa}, \quad S_H = 60 \text{ MPa} \text{ (E-W)}, \quad S_h = 45 \text{ MPa} \text{ (N-S)}
\]

Pore pressure is hydrostatic: \(p_0 = 30\) MPa. The wellbore is drilled with mud weight providing wellbore pressure \(p_w = 35\) MPa. The sandstone has: \(\sigma_{ci} = 80\) MPa, \(c = 8\) MPa, \(\phi = 30°\), \(T_0 = 5\) MPa.

## 22.2 Analysis Using Kirsch and Mohr-Coulomb

**Effective far-field stresses** (Terzaghi, \(\alpha = 1\)):

\[
S'_H = 60 - 30 = 30 \text{ MPa}, \quad S'_h = 45 - 30 = 15 \text{ MPa}, \quad \Delta p_w = p_w - p_0 = 5 \text{ MPa}
\]

**Hoop stress at the borehole wall** (\(r = a\), \(\theta\) measured from \(S_H\) direction):

Using \(P = S'_h = 15\) MPa (minimum horizontal, acts in the N-S plane, which is \(\theta = 90°\) from the E-W \(S_H\) direction — I follow the convention that \(P\) is the far-field stress perpendicular to the 0° azimuth, and here \(P = S_H\), \(Q = S_h\)):

\[
\sigma_{\theta\theta}(a) = (S'_H + S'_h) - 2(S'_H - S'_h)\cos 2\theta - p_w
\]

At \(\theta = 90°\) (N-S, direction of \(S_H\) — maximum concentration):

\[
\sigma_{\theta\theta}^{\max} = (30 + 15) - 2(30 - 15)\cos(180°) - 5 = 45 + 30 - 5 = 70 \text{ MPa}
\]

At \(\theta = 0°\) (E-W, direction of \(S_h\) — minimum concentration):

\[
\sigma_{\theta\theta}^{\min} = (30 + 15) - 2(30 - 15)\cos(0°) - 5 = 45 - 30 - 5 = 10 \text{ MPa}
\]

**Compressive failure check** (Mohr-Coulomb at the wall, \(\sigma_r = p_w - p_0 = 5\) MPa effective):

\[
N_\phi = \frac{1 + \sin 30°}{1 - \sin 30°} = \frac{1.5}{0.5} = 3
\]

\[
\sigma_{ci} = 2(8)\cos 30° / (1 - 0.5) = 16 \times 0.866 / 0.5 = 27.7 \text{ MPa}
\]

\[
\sigma_1^{\text{fail}} = 3 \times 5 + 27.7 = 42.7 \text{ MPa (at the location of minimum } \sigma_r)
\]

Wait — at the borehole wall, \(\sigma_r = p_w - p_0 = 5\) MPa acts as the confining stress (\(\sigma_3\)), and \(\sigma_\theta\) as the major stress (\(\sigma_1\)). Checking the critical point at \(\theta = 90°\):

\[
\sigma_1 = \sigma_{\theta\theta}^{\max} = 70 \text{ MPa} > \sigma_1^{\text{fail}} = 42.7 \text{ MPa}
\]

**Breakouts will form** at this wellbore. The breakout half-angle:

\[
\cos 2\theta_b = \frac{(S'_H + S'_h) - p_w - \sigma_1^{\text{fail}}}{2(S'_H - S'_h)} = \frac{45 - 5 - 42.7}{2 \times 15} = \frac{-2.7}{30} = -0.090
\]

\[
2\theta_b = 95.2°, \quad \theta_b = 47.6°
\]

Breakouts occupy the region \(47.6° < \theta < 132.4°\) — moderate breakouts indicating the wellbore is drillable but needs careful mud weight management.

**Tensile fracture check** at \(\theta = 0°\):

\[
\sigma_{\theta\theta}^{\min} = 10 \text{ MPa} > -T_0 = -5 \text{ MPa}
\]

No tensile fractures form — the wellbore is safe against hydraulic fracture initiation at the current mud weight.

---

# Chapter 23: Synthesis — The Rock Engineering Design Framework

## 23.1 From Problem Identification to Design Verification

The practice of rock engineering is iterative and never truly complete. The flow of a competent engineering assessment follows the logic laid out in Chapter 1:

**Define the initial state**: compile all available geomechanical data — borehole logs, core descriptions, in-situ stress measurements, pore pressure data, geophysical surveys — into a **geomechanical model** that captures the spatial variability of rock properties and the in-situ stress field.

**Delineate the geometry**: map the geometry of the engineered structure (borehole trajectory, tunnel alignment, mine stopes, slope geometry) and the geological units and structural features (faults, discontinuity sets) that intersect it.

**Apply the relevant analysis method**: choose the simplest method that captures the dominant mechanisms. Analytical solutions (Kirsch, Lamé, planar failure) are appropriate for simple geometry and material behaviour. Numerical models (FEM, DEM) are required when geometry or behaviour is complex. Empirical methods (RMR, Q-system) supplement analytical approaches.

**Assess uncertainty**: assign probability distributions to key uncertain parameters, propagate uncertainty through the analysis (FOSM or Monte Carlo), and compute the probability of failure. Compare with the acceptable risk threshold for the specific application.

**Design monitoring programme**: the **observational method** — Peck (1969) — recognizes that the rock mass reveals its behaviour as construction proceeds. Monitoring of displacement, pore pressure, microseismicity, and structural integrity allows the design to be updated and optimized in real time. Design should include trigger action response plans (TARPs) that pre-define actions (increase support, reduce excavation rate, shut in well) when monitoring thresholds are exceeded.

## 23.2 Key Dimensionless Groups and Order-of-Magnitude Thinking

Experienced rock mechanics engineers develop intuition for order-of-magnitude magnitudes:

- Vertical stress gradient: ~27 MPa/km (rock), ~10 MPa/km (water)
- Hydrostatic pore pressure gradient: ~10 MPa/km
- Typical UCS values: 1–5 MPa (chalk, gypsum), 10–50 MPa (sandstone, limestone), 100–300 MPa (granite, quartzite)
- Typical \(m_i\) values: 4–8 (mudstone, siltstone), 10–20 (limestone, sandstone), 25–35 (granite, quartzite)
- Biot coefficient: 0.3–0.9 (decreasing with cementation)
- b-value of induced seismicity: 0.8–1.5
- Typical borehole breakout width in stiff formations under \(S_H/S_h \approx 1.5\): 30°–60°

## 23.3 Professional Responsibility and Risk Communication

The engineering geomechanist operates at the boundary of what can be known with certainty. The fundamental professional obligation is to communicate uncertainty honestly — not to present a false precision that gives clients or the public unrealistic confidence. A computed factor of safety of 1.47 is not the same as "safe by 47%"; it is "probably stable, but there is some probability of failure that depends on how uncertain the input parameters are." Computing and communicating that probability of failure is the rigorous way to convey this.

Codes of professional practice (Engineers Canada, APEGA, Professional Engineers Ontario) require engineers to place public safety above client interests. In rock mechanics, this means: reporting geomechanical findings honestly even when they conflict with project economics; refusing to certify analyses based on insufficient data; and flagging induced seismicity risks even when clients prefer not to hear them.

---

# Summary of Key Equations

The following equations are the core results of this course. Each is derived in the text above; this summary provides quick reference.

**Traction vector:** \(\mathbf{T}^{(\hat{n})} = \boldsymbol{\sigma}\hat{n}\)

**Principal stress eigenvalue problem:** \(\det(\boldsymbol{\sigma} - \sigma\mathbf{I}) = 0\)

**Stress invariants:** \(I_1 = \text{tr}(\boldsymbol{\sigma})\), \(I_2 = \frac{1}{2}[(I_1)^2 - \text{tr}(\boldsymbol{\sigma}^2)]\), \(I_3 = \det(\boldsymbol{\sigma})\)

**Mohr circle:** \(\left(\sigma_n - \frac{\sigma_1+\sigma_3}{2}\right)^2 + \tau^2 = \left(\frac{\sigma_1-\sigma_3}{2}\right)^2\)

**Generalized Hooke's Law:** \(\varepsilon_{ij} = \frac{1+\nu}{E}\sigma_{ij} - \frac{\nu}{E}\sigma_{kk}\delta_{ij}\)

**Gravitational stress:** \(S_v = \rho g z\), \(K_0 = \nu/(1-\nu)\)

**Terzaghi effective stress:** \(\sigma'_{ij} = \sigma_{ij} - p_f\delta_{ij}\)

**Biot effective stress:** \(\sigma'_{ij} = \sigma_{ij} - \alpha p_f\delta_{ij}\)

**Mohr-Coulomb criterion:** \(\sigma_1 = N_\phi\sigma_3 + \sigma_{ci}\), \(N_\phi = (1+\sin\phi)/(1-\sin\phi)\)

**Hoek-Brown criterion:** \(\sigma_1 = \sigma_3 + \sigma_{ci}(m_b\sigma_3/\sigma_{ci} + s)^a\)

**Kirsch hoop stress (wall):** \(\sigma_{\theta\theta}(a) = (S_H + S_h) - 2(S_H - S_h)\cos 2\theta - p_w\)

**Fracture initiation pressure:** \(p_w^{\text{frac}} = 3S_h - S_H + T_0\)

**GRC elastic convergence:** \(u_a^e = a(p_0 - p_i)/(2G)\)

**GR seismicity law:** \(\log_{10}N(\geq m) = a - bm\)

**MLE of b-value:** \(\hat{b} = \log_{10}e / (\overline{m} - m_c)\)

**Monte Carlo:** \(P_f \approx (\text{count of } F < 1)/N\)

**P-wave velocity:** \(V_P = \sqrt{(\lambda + 2\mu)/\rho}\)

**Joint shear strength (Barton-Bandis):** \(\tau = \sigma_n\tan[\phi_r + JRC\log_{10}(JCS/\sigma_n)]\)

**Reservoir stress path:** \(\Delta\sigma_h = \alpha\frac{1-2\nu}{1-\nu}\Delta p_f\)

**RQD:** \(\text{RQD} = 100e^{-0.1\lambda}(0.1\lambda + 1)\)

**Planar failure FoS:** \(F = [c_jA + (W\cos\psi_p - U)\tan\phi_j] / (W\sin\psi_p)\)

---

# Chapter 24: Stress Transformation and the Generalized Kirsch Solution

## 24.1 Coordinate Transformation of the Stress Tensor

In practice, the borehole axis is rarely vertical, and the principal stresses are rarely aligned with the borehole coordinate system. To apply the Kirsch solution to an inclined borehole, we must transform the far-field stress tensor from geographic coordinates (\(x\) = East, \(y\) = North, \(z\) = Up) to borehole coordinates (\(x'\) = across-hole in dip direction, \(y'\) = across-hole along strike, \(z'\) = along borehole axis).

The transformation is accomplished by the standard second-rank tensor rotation:

\[
\sigma'_{ij} = R_{ik} R_{jl} \sigma_{kl}
\]

where \(\mathbf{R}\) is the rotation matrix from geographic to borehole coordinates. For a borehole with azimuth \(\alpha_b\) (from North, clockwise) and inclination \(\delta_b\) (from vertical), the rotation matrix is:

\[
\mathbf{R} = \begin{pmatrix} \cos\alpha_b\cos\delta_b & \sin\alpha_b\cos\delta_b & -\sin\delta_b \\ -\sin\alpha_b & \cos\alpha_b & 0 \\ \cos\alpha_b\sin\delta_b & \sin\alpha_b\sin\delta_b & \cos\delta_b \end{pmatrix}
\]

The far-field stresses perpendicular to the borehole axis (\(\sigma_{x'x'}, \sigma_{y'y'}, \sigma_{x'y'}\)) then enter the Kirsch solution as the boundary conditions at infinity, yielding stress distributions that depend on both the stress magnitudes and the borehole orientation. This is the basis for **borehole stability optimization** — choosing the borehole azimuth and inclination that minimizes stress concentrations and thereby minimizes the risk of breakouts or tensile fractures.

## 24.2 Breakout Stability Windows

For a given rock strength and set of in-situ stresses, one can define a "stability window" in the space of (borehole inclination, borehole azimuth): the set of borehole orientations for which neither compressive breakouts nor tensile fractures occur at a given mud weight. This window is often displayed as a stereographic projection — orientations inside the window are stable, outside are unstable. The design tool is to choose the borehole trajectory to lie within this stability window while also meeting directional targets.

<div class="example">
<strong>Example 24.1: Optimal Borehole Azimuth.</strong> In a normal faulting stress regime with \(S_v > S_H > S_h\), a vertical borehole experiences maximum stress concentration in the direction of \(S_H\). A horizontal borehole drilled parallel to \(S_h\) (the minimum stress) will, however, experience large stress concentrations due to the vertical stress \(S_v\) acting perpendicular to the borehole. Depending on the stress ratios, there is often an intermediate inclination (commonly 30°–60° from vertical, drilled in the azimuth of \(S_H\)) that minimizes the maximum stress concentration around the borehole. This is the mechanically optimal borehole orientation.

For a strike-slip regime (\(S_H > S_v > S_h\)), horizontal wells drilled in the \(S_H\) direction are mechanically favourable because \(S_v\) and \(S_h\) (both smaller than \(S_H\)) act as the far-field stresses, giving a lower deviatoric stress at the borehole wall.
</div>

---

# Chapter 25: Limit Equilibrium Methods — Advanced

## 25.1 Wedge Failure with Water Pressure and Bolt Forces

The three-dimensional wedge analysis can be extended to include external forces from rock bolts, cables, and water pressure. Let a wedge be bounded by planes A and B, with the line of intersection plunging at angle \(\psi_i\) in direction \(\alpha_i\). The block has weight \(W\). A tension crack at the crest, filled with water to height \(h_w\), produces:

- A horizontal water force on the tension crack face: \(V = \frac{1}{2}\rho_w g h_w^2 H_{tc}/\sin\psi_f\) (where \(H_{tc}\) is the tension crack depth and \(\psi_f\) is the face dip)
- Water uplift forces on planes A and B: \(U_A = \frac{1}{2}\rho_w g h_w A_A / \sin\delta_A\) and similarly for B

A pattern of rock bolts installed at angle \(\beta\) to the wedge face with total bolt force \(T_{\text{bolt}}\) contributes:

- A normal force increasing clamping on plane A: \(T_{\text{bolt}}\cos(\alpha_{T} - \alpha_{A})\cos\beta\)
- A shear force reducing driving: \(T_{\text{bolt}}\sin\beta\)

The factor of safety is:

\[
F = \frac{c_A A_A + c_B A_B + (N_A - U_A)\tan\phi_A + (N_B - U_B)\tan\phi_B + T_{\text{bolt}}\sin\beta}{W\sin\psi_i + V\cos\psi_i - T_{\text{bolt}}\cos(\text{angle to slip direction})}
\]

where \(N_A\) and \(N_B\) are the normal reactions on planes A and B computed by vector resolution of all forces onto the plane normals.

## 25.2 Toppling Failure

**Toppling** occurs when columns or blocks of rock rotate about their base rather than sliding. It is common in steeply dipping columnar joints (e.g., columnar basalts, steeply dipping slates) where the block aspect ratio (height-to-width) is large. The kinematic condition for toppling is that the resultant of all forces (weight, water pressure, seismic) acts outside the base of the block. For a rectangular block of height \(h\) and width \(b\) on a slope of angle \(\psi_s\):

**Sliding condition** (prevails for low blocks): \(\tan\psi_s > \tan\phi_j\)

**Toppling condition** (prevails for tall, narrow blocks): \(\tan\psi_s > b/h\)

Both conditions depend on slope angle. For very tall blocks (\(b/h \ll \tan\phi_j\)), toppling occurs at lower slope angles than sliding. The **combined stability chart** (Goodman and Bray, 1976) displays the boundaries between stable, sliding, toppling, and combined sliding-toppling regimes in (\(\psi_s, b/h\)) space.

---

# Chapter 26: Flow in Rock Masses — Hydraulic Aspects

## 26.1 Darcy's Law and Permeability Tensors

Fluid flow through porous and fractured rock obeys **Darcy's Law**:

\[
\mathbf{q} = -\frac{k}{\mu}\nabla p
\]

where \(\mathbf{q}\) is the specific discharge (Darcy velocity, m/s), \(k\) is the intrinsic permeability (m²), \(\mu\) is the dynamic viscosity of the fluid (Pa·s), and \(\nabla p\) is the pressure gradient. For anisotropic rock masses (e.g., with preferred fracture orientation), permeability is a second-rank tensor \(\mathbf{k}\), and the flow is not necessarily parallel to the pressure gradient.

For flow through a single parallel-plate fracture of aperture \(e\) (the **cubic law**):

\[
q = \frac{e^3}{12\mu}\frac{\Delta p}{L}
\]

The equivalent permeability of the fracture is \(k_f = e^2/12\). A fracture with aperture 0.1 mm has \(k_f \approx 8 \times 10^{-10}\) m² — far more permeable than intact rock (typically \(10^{-18}\)–\(10^{-14}\) m²). This is why even a few open fractures can completely dominate the bulk permeability of a rock mass.

**Stress-permeability coupling**: normal stress closes fracture apertures exponentially (Bandis et al., 1983):

\[
e = e_0 \exp\left(-\frac{\sigma'_n}{K_{n0} e_0}\right)
\]

Shear displacement dilates fractures (by the dilation angle \(\psi_d\)), increasing aperture and permeability. This coupling between stress and flow is the physical basis for enhanced geothermal system stimulation and for the permeability increase observed following hydraulic fracturing.

## 26.2 Pore Pressure Diffusion

Following a step change in boundary pressure (e.g., from borehole pressurization), pore pressure diffuses into the surrounding rock according to the diffusion equation:

\[
\frac{\partial p}{\partial t} = D \nabla^2 p, \qquad D = \frac{k}{\mu(\phi c_t + \alpha^2/K_{\text{dry}})}
\]

where \(c_t\) is the total compressibility and \(D\) is the hydraulic diffusivity. In one dimension, the pressure front (defined as the locus where pressure has risen by a fixed fraction of the step change) migrates as \(r \propto \sqrt{Dt}\), the classic diffusion scaling. For a typical granite with \(k = 10^{-17}\) m² and \(D \approx 10^{-3}\) m²/s, the pressure front reaches 100 m in about 10⁷ s (115 days).

---

# Chapter 27: Rock Mechanics in Mining Engineering

## 27.1 Rock Bursts and Energy Release Rate

A **rock burst** is a sudden, violent failure of rock that ejects material into an underground opening. It occurs when the energy stored elastically in the rock and surrounding abutments exceeds the energy that can be absorbed by the failing rock mass, with the excess released as seismic energy and kinetic energy of ejected rock.

The **energy release rate (ERR)** concept (Cook, 1965) quantifies the amount of elastic strain energy released per unit area of mining advance. For a mine stope in a tabular orebody:

\[
\text{ERR} = \frac{d W_e}{d A}
\]

where \(W_e\) is the elastic strain energy and \(A\) is the mined area. ERR increases as stopes grow larger and as mining depth increases. Regions of high ERR are prone to rock bursts.

**Mitigation strategies:**
- **De-stress blasting**: drilling and blasting small holes ahead of the mining face to fracture the rock and convert the elastic energy into plastic deformation, dissipating the energy before it can accumulate.
- **Yielding supports**: hydraulic props and cone bolts that absorb energy by controlled deformation, rather than stiff supports that fail catastrophically when overloaded.
- **Sequential mining**: designing the mining sequence (e.g., mining from centre of a panel outward, rather than from the abutment) to minimize stress concentrations.
- **Backfill**: placing cemented or hydraulic fill in mined-out stopes to provide confinement to remaining pillars and reduce the span of the open void.

## 27.2 Pillar Design

Mine pillars support the overburden and separate adjacent stopes. Pillar strength depends on pillar geometry (width \(W\) and height \(H\)) and intact rock strength. The **pillar strength formula** (Hedley and Grant, 1972, for hard rock):

\[
\sigma_p = \sigma_{ci} \frac{W^{0.5}}{H^{0.75}}
\]

This empirical relation reflects that wide, squat pillars are stronger (greater confinement) and taller pillars are weaker (greater slenderness).

The **pillar safety factor**:

\[
F_p = \frac{\sigma_p}{\sigma_{\text{average}}}
\]

where \(\sigma_{\text{average}}\) is the average stress on the pillar, estimated from the tributary area method:

\[
\sigma_{\text{average}} = S_v \frac{A_{\text{total}}}{A_{\text{pillar}}}
\]

where \(A_{\text{total}}\) is the total area (pillar + stope) and \(A_{\text{pillar}}\) is the pillar area. This is the total vertical load on the panel divided by the pillar area.

<div class="example">
<strong>Example 27.1: Pillar Safety Factor.</strong> A room-and-pillar mine at depth 500 m has square pillars 8 m × 8 m on a 16 m × 16 m grid (8 m rooms). Rock density \(\rho = 2700\) kg/m³, \(\sigma_{ci} = 150\) MPa, pillar height \(H = 5\) m.

Vertical stress: \(S_v = 2700 \times 9.81 \times 500 / 10^6 = 13.2\) MPa.

Extraction ratio: \(e = 1 - (8/16)^2 = 0.75\).

Average pillar stress: \(\sigma_{\text{avg}} = 13.2 / (1 - 0.75) = 52.8\) MPa.

Pillar strength: \(\sigma_p = 150 \times 8^{0.5} / 5^{0.75} = 150 \times 2.828 / 3.344 = 126.9\) MPa.

Factor of safety: \(F_p = 126.9 / 52.8 = 2.40\).

This is a well-designed pillar. Reducing pillar width to 6 m (increasing extraction to 82%): \(\sigma_p = 150 \times 6^{0.5}/5^{0.75} = 109.8\) MPa, \(\sigma_{\text{avg}} = 13.2/0.18 = 73.3\) MPa, \(F_p = 1.50\) — still acceptable for a permanent pillar.
</div>

## 27.3 Open Pit Mining Slopes

Open pit mines are the largest engineered slopes on Earth — pits can reach 500–1000 m in depth with overall wall angles of 45°–50°. Slope stability analysis at this scale must account for:

**Overall slope stability**: the entire wall sliding on a large fault or weak zone extending to the pit bottom (planar or circular analysis on a kilometre scale).

**Inter-ramp stability**: stability of the rock mass between berms, typically 50–150 m high, controlled by major joint sets and faults.

**Bench stability**: stability of individual 15–20 m high benches, controlled by individual joints and their intersections.

**Depressurization**: pore pressures in the rock mass reduce effective normal stresses on potential failure surfaces, reducing stability. Drainage adits, horizontal drain holes, and pumping wells are used to lower pore pressures and improve stability.

**Seismic loading**: earthquake loading can trigger slope failures. Pseudo-static analysis adds a horizontal seismic coefficient \(k_h\) (typically 0.05–0.15 g) as a horizontal body force, reducing the FoS.

---

# Chapter 28: The New Austrian Tunnelling Method (NATM) and Observational Design

## 28.1 Principles of NATM

The **New Austrian Tunnelling Method** (Rabcewicz, 1964) is a philosophy of tunnel design and construction rather than a fixed support system. Its key principles are:

1. **The rock mass is the primary structural element**: rather than fighting the rock by installing massive supports immediately, allow controlled deformation to redistribute stresses and mobilize the rock's own strength.
2. **Light, flexible initial support**: shotcrete (sprayed concrete), rock bolts, and wire mesh are installed promptly but are designed to deform, not to carry the full ground load.
3. **Monitoring**: systematic measurement of tunnel convergence, surface settlement, anchor loads, and shotcrete strains throughout construction.
4. **Adaptive design**: the support pattern is adjusted based on observed behaviour. If convergence is greater than expected, additional support is installed. If convergence is less, support can be reduced.

## 28.2 Sequential Excavation and Face Advance

In mechanically complex ground (squeezing ground, swelling rock, running soil), excavating the full tunnel face simultaneously may be impossible. **Sequential excavation** splits the face into a top heading, bench, and invert, excavating each separately. The top heading is driven in short advance lengths (1–2 m), and shotcrete is applied within hours of exposure.

The **longitudinal displacement profile (LDP)** describes how the tunnel wall converges as the face passes. Approximately, 30% of the final convergence occurs ahead of the face, 30% as the face passes through, and 40% as the face moves away. Support installed just behind the face engages the ground when roughly 30% of total convergence has occurred — this is the key parameter governing the point on the GRC at which support is activated.

## 28.3 Rock Mass Quality and Support Selection

**Empirical support selection** using the Q-system (Barton et al., 1974): the equivalent dimension \(D_e = D_{\text{span or height}} / \text{ESR}\) (ESR = excavation support ratio, a factor representing the importance and usage of the excavation) is plotted against \(Q\) on the Q-chart. The chart delineates regions requiring different support categories, from no support (high \(Q\), small \(D_e\)) to heavy reinforced concrete lining (low \(Q\), large \(D_e\)).

**Reinforced shotcrete and fibre reinforcement**: modern shotcrete is reinforced with steel or polypropylene fibres, providing post-crack toughness (energy absorption capacity, measured by the load-deflection area in a beam bending test). Fibre-reinforced shotcrete is far superior to conventional wire mesh for resisting rock burst ejection and dynamic loads.

---

# Chapter 29: Thermal Stresses in Rock — Geothermal and Nuclear Waste Applications

## 29.1 Thermoelastic Stress Changes

A change in temperature \(\Delta T\) causes thermal strains:

\[
\varepsilon_{ij}^{T} = \alpha_T \Delta T \delta_{ij}
\]

where \(\alpha_T\) is the coefficient of linear thermal expansion (typically \(5\)–\(15 \times 10^{-6}\) °C⁻¹ for most rocks). The total strain is the sum of elastic and thermal parts:

\[
\varepsilon_{ij} = \frac{1+\nu}{E}\sigma_{ij} - \frac{\nu}{E}\sigma_{kk}\delta_{ij} + \alpha_T \Delta T \delta_{ij}
\]

For a rock mass constrained from expanding (e.g., a thin horizontal reservoir layer constrained by rigid surroundings), a temperature increase \(\Delta T\) generates compressive thermal stresses:

\[
\Delta\sigma_h = -\frac{E\alpha_T \Delta T}{1-\nu}
\]

The negative sign indicates compression (in the sign convention where tension is negative). Heating a constrained rock by 50°C with \(E = 50\) GPa, \(\alpha_T = 10^{-5}\) °C⁻¹, and \(\nu = 0.25\) gives:

\[
|\Delta\sigma_h| = \frac{50 \times 10^3 \times 10^{-5} \times 50}{0.75} = 33 \text{ MPa}
\]

This is a very large stress change — comparable to tectonic stresses at depth. Temperature management is therefore a critical consideration in geothermal and steam-injection projects.

## 29.2 Nuclear Waste Repository Geomechanics

Deep geological repositories for high-level nuclear waste (e.g., the proposed Canadian DGR in Ordovician limestone at depths of 500–700 m) must ensure rock mass integrity over timescales of 10⁶ years. The geomechanical design challenges are:

**Thermal pulse**: high-level waste generates heat for thousands of years. The initial heat generation rate can reach tens of watts per canister. Temperature increases of 50–100°C around waste canisters generate thermoelastic stresses that must not cause fracturing of the host rock or of engineered barriers.

**Excavation damage zone (EDZ)**: drilling and blasting create a zone of increased fracturing and permeability immediately around excavations. The EDZ must be characterized and its effect on repository performance quantified. Mechanical excavation (TBM) creates a thinner, less damaged EDZ than drill-and-blast.

**Coupled THMC effects over geological time**: the long-term safety case must account for groundwater chemistry evolution (C), temperature change (T), glacial loading and unloading cycles (M), and changes in fracture permeability (H) over the repository lifetime. This is perhaps the most demanding THMC analysis in any engineering application.

---

# Chapter 30: Supplementary Derivations and Advanced Topics

## 30.1 Derivation of the Elastic Lamé Solution

The **Lamé equations** give the stress and displacement field in a thick-walled cylinder under internal pressure \(p_i\) and external pressure \(p_o\), with inner radius \(a\) and outer radius \(b\). As a special case (\(b \to \infty\), \(p_o = p_0\)), this gives the hydrostatic part of the Kirsch solution.

<div class="theorem">
<strong>Lamé Solution Derivation.</strong> For a thick cylinder with axisymmetric loading, the Airy stress function depends only on \(r\): \(\Phi = \Phi(r)\). The biharmonic equation reduces to:

\[
\nabla^4\Phi = \left(\frac{d^2}{dr^2} + \frac{1}{r}\frac{d}{dr}\right)^2 \Phi = 0
\]

This is the Euler-Cauchy ODE. The general solution is:

\[
\Phi = A\ln r + Br^2\ln r + Cr^2 + D
\]

For an infinite medium without logarithmic singularity at infinity and without body forces, \(B = 0\). The stresses are:

\[
\sigma_{rr} = \frac{1}{r}\frac{d\Phi}{dr} = \frac{A}{r^2} + 2C
\]

\[
\sigma_{\theta\theta} = \frac{d^2\Phi}{dr^2} = -\frac{A}{r^2} + 2C
\]

Applying boundary conditions \(\sigma_{rr}(a) = -p_i\) (internal pressure, compression positive means \(\sigma_{rr} = p_i\) here — taking compression positive), \(\sigma_{rr}(b) = p_o\):

\[
A = \frac{(p_i - p_o)a^2 b^2}{b^2 - a^2}, \qquad 2C = \frac{p_i a^2 - p_o b^2}{b^2 - a^2}
\]

For \(b \to \infty\), \(p_o = p_0\), \(p_i = p_w\):

\[
\sigma_{rr} = p_0 - (p_0 - p_w)\frac{a^2}{r^2}
\]

\[
\sigma_{\theta\theta} = p_0 + (p_0 - p_w)\frac{a^2}{r^2}
\]

At the wall (\(r = a\)): \(\sigma_{rr} = p_w\), \(\sigma_{\theta\theta} = 2p_0 - p_w\). This is the hydrostatic Kirsch result. \(\square\)
</div>

## 30.2 Stability Numbers for Underground Excavations

For open stopes in underground mines, the **stability graph method** (Mathews et al., 1981; Potvin, 1988) uses a **stability number** \(N'\) and a **hydraulic radius** \(HR = A_{\text{surface}} / P_{\text{perimeter}}\):

\[
N' = Q' \cdot A \cdot B \cdot C
\]

where \(Q'\) is the modified rock mass quality (Q without the stress reduction factor), \(A\) is the rock stress factor, \(B\) is the joint orientation factor relative to the stope surface, and \(C\) is the gravity factor depending on whether the surface is a hanging wall, footwall, or sidewall. Points plotted in the \((HR, N')\) plane fall into "stable," "potentially unstable," or "caved" regions defined by empirical boundaries from a database of case histories.

## 30.3 The Hoek-Brown GSI System

The **Geological Strength Index** (GSI) is assessed from rock mass observations at the outcrop or in underground excavations. Two key descriptors are used:

**Structure**: ranging from "intact or massive" (very few joints, GSI contribution \(\sim 90\)) to "disintegrated" (heavily jointed with no preferred orientation, GSI contribution \(\sim 10\)).

**Surface conditions**: ranging from "very good" (fresh, unweathered, rough surfaces) to "very poor" (slickensided, weathered, clay-coated surfaces).

The GSI chart combines these two qualitative assessments into a single number. The resulting rock mass parameters for Hoek-Brown are:

\[
m_b = m_i\exp\!\left(\frac{\text{GSI}-100}{28-14D}\right), \quad s = \exp\!\left(\frac{\text{GSI}-100}{9-3D}\right), \quad a = \tfrac{1}{2}+\tfrac{1}{6}\!\left(e^{-\text{GSI}/15}-e^{-20/3}\right)
\]

The **disturbance factor** \(D\) (0 = undisturbed, 1 = heavily blasted) accounts for blast damage in open pit slopes and tunnels. For TBM tunnelling, \(D = 0\); for controlled perimeter blasting, \(D = 0.1\)–\(0.5\); for production blasting in an open pit wall, \(D = 0.7\)–\(1.0\).

## 30.4 Equivalent Mohr-Coulomb Parameters from Hoek-Brown

For design calculations using Mohr-Coulomb (e.g., limit equilibrium slope stability), it is often necessary to find the equivalent \(c\) and \(\phi\) from the Hoek-Brown criterion over a specified stress range \([\sigma_{3,\min}, \sigma_{3,\max}]\). This is done by fitting a tangent line to the curved Hoek-Brown envelope.

The equivalent friction angle and cohesion are (Hoek, Carranza-Torres, and Corkum, 2002):

\[
\phi' = \sin^{-1}\!\left[\frac{6am_b(s + m_b\sigma'_{3n})^{a-1}}{2(1+a)(2+a) + 6am_b(s + m_b\sigma'_{3n})^{a-1}}\right]
\]

\[
c' = \frac{\sigma_{ci}\left[(1+2a)s + (1-a)m_b\sigma'_{3n}\right](s + m_b\sigma'_{3n})^{a-1}}{(1+a)(2+a)\sqrt{1 + 6am_b(s+m_b\sigma'_{3n})^{a-1}/[(1+a)(2+a)]}}
\]

where \(\sigma'_{3n} = \sigma'_{3,\max}/\sigma_{ci}\) and \(\sigma'_{3,\max}\) is the upper limit of the stress range. For slopes, this upper limit is approximately \(0.25\sigma_{ci}(S_v/\sigma_{ci})^{0.91}H/100\) (dependent on slope height \(H\)). For tunnels, it is typically \(0.47\sigma_{ci}(\sigma_{ci}/\gamma H)^{-0.94}\).

## 30.5 Numerical Example: Hoek-Brown to Mohr-Coulomb Conversion for a Mine Slope

<div class="example">
<strong>Example 30.1: Rock Mass Parameter Estimation.</strong> A granite rock mass with the following properties is assessed for an open pit slope 200 m high:

- Intact UCS: \(\sigma_{ci} = 180\) MPa
- Intact rock constant: \(m_i = 32\) (granite)
- GSI = 55 (blocky/good surface condition)
- Disturbance factor: \(D = 0.7\) (production blasting)
- Rock density: \(\rho = 2700\) kg/m³

<strong>Step 1:</strong> Compute Hoek-Brown parameters:

\[
m_b = 32\exp\!\left(\frac{55-100}{28-14 \times 0.7}\right) = 32\exp(-45/18.2) = 32 \times e^{-2.47} = 32 \times 0.0846 = 2.71
\]

\[
s = \exp\!\left(\frac{55-100}{9-3\times 0.7}\right) = \exp(-45/6.9) = e^{-6.52} = 0.00148
\]

\[
a = 0.5 + \frac{1}{6}(e^{-55/15} - e^{-20/3}) = 0.5 + \frac{1}{6}(e^{-3.67} - e^{-6.67}) = 0.5 + \frac{1}{6}(0.0255 - 0.00127) = 0.504
\]

<strong>Step 2:</strong> Maximum confining stress for slope (Hoek et al., 2002):

\[
\sigma'_{3,\max} = 0.25\sigma_{ci}\left(\frac{\sigma_{ci}}{\gamma H}\right)^{-0.91} \times \frac{H}{100}
\]

\[
\gamma H = 2700 \times 9.81 \times 200 \times 10^{-6} = 5.30 \text{ MPa}
\]

\[
\sigma'_{3,\max} = 0.25 \times 180 \times (180/5.30)^{-0.91} = 45 \times 33.96^{-0.91} = 45 \times 0.0394 = 1.77 \text{ MPa}
\]

\[
\sigma'_{3n} = 1.77/180 = 0.00983
\]

<strong>Step 3:</strong> Equivalent friction angle and cohesion using the linearization formulas. At \(\sigma'_{3n} = 0.00983\) with \(a = 0.504\), \(m_b = 2.71\), \(s = 0.00148\):

\[
(s + m_b\sigma'_{3n})^{a-1} = (0.00148 + 2.71 \times 0.00983)^{0.504-1} = (0.00148 + 0.02664)^{-0.496}
\]

\[
= 0.02812^{-0.496} \approx 0.02812^{-0.5} \approx 5.96
\]

\[
\text{Numerator of } \phi\text{ expression} = 6 \times 0.504 \times 2.71 \times 5.96 = 6 \times 0.504 \times 16.15 = 48.8
\]

\[
\text{Denominator} = 2(1.504)(2.504) + 48.8 = 7.53 + 48.8 = 56.3
\]

\[
\phi' = \sin^{-1}(48.8/56.3) = \sin^{-1}(0.867) = 60.0°
\]

\[
c' = \frac{180[(1 + 2 \times 0.504)(0.00148) + (1 - 0.504) \times 2.71 \times 0.00983] \times 5.96}{(1.504)(2.504)\sqrt{1 + 48.8/7.53}}
\]

Numerator factor: \((2.008 \times 0.00148) + (0.496 \times 0.02664) = 0.00297 + 0.01321 = 0.01618\)

\[
c' = \frac{180 \times 0.01618 \times 5.96}{3.764 \times \sqrt{7.48}} = \frac{17.36}{3.764 \times 2.735} = \frac{17.36}{10.29} = 1.69 \text{ MPa}
\]

So the equivalent Mohr-Coulomb parameters for this heavily blasted granite rock mass are: \(c' \approx 1.7\) MPa, \(\phi' \approx 60°\). These values can then be used in limit equilibrium slope stability analyses.
</div>

---

# Chapter 31: Stress Paths and Constitutive Modelling

## 31.1 The Concept of a Stress Path

A **stress path** is the trajectory in stress space followed by a material element as loading progresses. Two elements in the same structure may follow very different stress paths — one may undergo predominantly compressive loading, another may experience an increase in deviatoric stress with constant mean stress. The final stress state reached tells us whether the material has yielded, but the stress path tells us how it got there, which matters for stress-path-dependent materials (most geomaterials are path-dependent).

For a uniaxial compression test (no confining pressure), the stress path in \((p', q)\) space (where \(p' = (\sigma'_1 + 2\sigma'_3)/3\) is the mean effective stress and \(q = \sigma'_1 - \sigma'_3\) is the deviatoric stress) is:

\[
p' = \frac{\sigma'_1}{3}, \quad q = \sigma'_1 \implies p' = q/3
\]

The stress path is a straight line with slope \(\Delta q / \Delta p' = 3\) through the origin.

For a triaxial test at confining pressure \(\sigma'_3\):

\[
p' = \frac{\sigma'_1 + 2\sigma'_3}{3} = \sigma'_3 + \frac{q}{3}
\]

The stress path starts at the hydrostatic point \((p', q) = (\sigma'_3, 0)\) and moves with slope \(\Delta q / \Delta p' = 3\) (the same slope as the UCS test, because \(\sigma'_3\) is constant).

## 31.2 Critical State Concept

The **critical state** (Roscoe, Schofield, and Wroth, 1958) is the condition at which a geomaterial deforms continuously at constant stress and constant volume (zero dilatancy). In \((p', q)\) space, all critical states plot on the **Critical State Line (CSL)**:

\[
q = Mp'
\]

where \(M = 6\sin\phi'/(3-\sin\phi')\) for triaxial compression. The CSL in \((p', e)\) space (where \(e\) is the void ratio) is:

\[
e = e_\Gamma - \lambda \ln p'
\]

A normally consolidated sample (located on the CSL or to the right of it in \(p'\)-\(e\) space) will compress and strain-soften during shearing (ductile behaviour). An overconsolidated sample (to the left of CSL, dense) will dilate and potentially strain-harden or reach a peak strength above the critical state (brittle-like behaviour at low confining stress). This framework, while developed for soils, extends to weak rocks and forms the basis for the Modified Cam-Clay model widely used in reservoir geomechanics.

---

# Chapter 32: Measurement of Rock Mass Deformability

## 32.1 Field Tests

Laboratory specimens sample the intact rock, but the rock mass includes discontinuities that dramatically reduce stiffness. Field deformability tests measure the in-situ mass modulus \(E_m\), which is typically 0.1–0.5 times the laboratory intact modulus.

**Plate loading test**: a flat hydraulic jack loads a circular area on a tunnel wall or adits floor. The surface displacement \(w\) under a rigid circular load of radius \(R\) and pressure \(q\) on a half-space is:

\[
w = \frac{qR(1-\nu^2)}{E_m}\pi/2
\]

Measuring \(q\) and \(w\) and knowing \(\nu\) allows back-calculation of \(E_m\).

**Goodman Jack (borehole dilatometer)**: a rigid cylindrical jack is expanded in a borehole, measuring the pressure-displacement response. The deformation modulus from a dilatometer test:

\[
E_m = \frac{(1+\nu)D_0}{2} \cdot \frac{\Delta p}{\Delta r}
\]

where \(D_0\) is the borehole diameter and \(\Delta p/\Delta r\) is the slope of the pressure-displacement curve.

**Geophysical correlation**: in-situ compressional wave velocity \(V_P\) is measured by seismic refraction or cross-hole seismic tomography. The dynamic modulus is:

\[
E_{\text{dyn}} = \rho V_P^2 \frac{(1+\nu)(1-2\nu)}{1-\nu}
\]

Empirical correlations relate \(E_m\) to \(E_{\text{dyn}}\) and to rock mass quality (RMR, Q):

\[
\log E_m = \frac{\text{RMR} - 10}{40}
\]

---

# Chapter 33: Practical Aspects of Stress Measurement

## 33.1 Hydraulic Fracture Test Interpretation

A complete hydraulic fracture stress test comprises multiple pressure cycles. The standard interpretation of the **fracture closure pressure** — the minimum horizontal stress \(S_h\) — uses several approaches:

**Pressure inflection point**: after pumping stops, the pressure-time curve shows an inflection (change in decline rate) when the fracture transitions from hydraulically propped-open to closed. This is the closure pressure.

**G-function analysis**: the G-function is a dimensionless time variable \(G(\Delta t_D)\) based on the elapsed time after shut-in \(\Delta t\) and the pump time \(t_p\):

\[
G(\Delta t_D) = \frac{4}{\pi}\left[(1+\Delta t_D)^{1/2} - \Delta t_D^{1/2}\right]
\]

(for high-leakoff) or a similar expression for low-leakoff fractures. Plotting wellbore pressure against \(G(\Delta t_D)\) yields a straight line during fracture closure; departure from linearity identifies the closure pressure.

**Instantaneous shut-in pressure (ISIP)**: the pressure recorded immediately after pump shut-in. Due to friction pressure losses, ISIP is slightly above the true \(S_h\) and gives an upper bound.

## 33.2 Overcoring Data Analysis

From a CSIRO HI-cell overcoring test, 12 independent strain measurements are made during overcoring. The in-situ stress tensor (6 independent components) is computed from:

\[
\boldsymbol{\varepsilon}_{\text{relief}} = \mathbf{C} \boldsymbol{\sigma}
\]

where \(\mathbf{C}\) is the \(12 \times 6\) compliance matrix computed from elastic theory for the specific gauge rosette geometry and the elastic constants of the core. This is an over-determined system (12 equations, 6 unknowns) solved by least squares. The residuals give an estimate of measurement quality.

A key requirement is that the rock behaves **linearly elastically** during overcoring — the stress state during the test (which includes in-situ stress plus any drilling-induced stress perturbation) must be below the yield stress. In highly stressed rocks near failure, this condition may be violated, and the overcoring result will be incorrect.

---

# Chapter 34: Integration of Rock Mechanics with Structural Geology

## 34.1 Faults, Folds, and Residual Stress

The in-situ stress field is not merely a function of present-day overburden and plate tectonic loading — it also carries the imprint of geological history. Sedimentary rocks buried, lithified, and then uplifted carry a "memory" of their maximum burial depth in the form of **locked-in stresses** (also called paleostresses or residual stresses). A formation that was buried to 5 km and then exhumed to 2 km retains higher horizontal stresses than a naive elastic calculation would predict.

**Locked-in stresses** arise from: (1) plastic deformation during burial that created permanent horizontal compressive strain; (2) chemical cementation that locked in the compacted grain framework; (3) stress relief from cooling or drying that crack-closes against the locked-in compressive matrix. They are detected by the fact that horizontal stresses exceed the elastic prediction from current overburden: measured \(K_0 > \nu/(1-\nu)\).

**Fault reactivation**: pre-existing faults are planes of weakness in the rock mass. A fault with cohesion \(c_j \approx 0\) and friction angle \(\phi_j\) reactivates in shear when:

\[
\tau = \sigma'_n \tan\phi_j
\]

For a fault dipping at angle \(\delta_f\) in a normal faulting stress regime, the effective stresses on the fault plane are:

\[
\sigma'_n = \frac{S'_v + S'_h}{2} + \frac{S'_v - S'_h}{2}\cos 2\delta_f
\]

\[
\tau = \frac{S'_v - S'_h}{2}\sin 2\delta_f
\]

The fault most likely to slip is the one most favourably oriented to the stress field — for normal faults, this is \(\delta_f = 45° + \phi_j/2 \approx 60°\) — consistent with Anderson's theory.

## 34.2 Stereonet Analysis for Kinematic Feasibility

Before undertaking a quantitative stability analysis, a **kinematic feasibility analysis** using stereonets identifies which fracture sets can participate in which failure modes. The procedure:

**Planar failure feasibility**: 
1. Plot the great circle of the slope face.
2. Plot all measured joint planes on the stereonet.
3. A joint set can cause planar failure if its great circle intersects the **daylight envelope** (the region of the stereonet corresponding to planes that "daylight" in the slope face) and if its dip exceeds the friction angle (so the joint great circle plots within the **friction circle** — the small circle at angle \(\phi_j\) from the centre).

**Wedge failure feasibility**: plot the poles of all joint sets. Any pair of joint sets whose intersection (great circle of both planes) plunges into the slope face at an angle greater than \(\phi_j\) is a potential wedge failure.

**Toppling feasibility**: joint sets dipping steeply (nearly vertical) in the opposite direction to the slope face can form toppling blocks. The relevant check is that the normal to the joint plane plots within the zone of toppling on the stereonet.

---

# Appendix: Mathematical Tools and Reference Formulae

## A.1 Tensor Index Notation Summary

In this course, the Einstein summation convention is used: a repeated index in a single term implies summation over all values of that index. Key operations:

**Dot product of vectors:** \(\mathbf{a} \cdot \mathbf{b} = a_i b_i = a_1b_1 + a_2b_2 + a_3b_3\)

**Matrix-vector product:** \((\mathbf{A}\mathbf{b})_i = A_{ij}b_j\)

**Trace:** \(\text{tr}(\mathbf{A}) = A_{ii} = A_{11} + A_{22} + A_{33}\)

**Kronecker delta:** \(\delta_{ij} = 1\) if \(i = j\), \(0\) otherwise. Useful identity: \(\delta_{ii} = 3\).

**Levi-Civita symbol:** \(\varepsilon_{ijk}\) = +1 for even permutations of (1,2,3), -1 for odd, 0 if any two indices are equal. Cross product: \((\mathbf{a} \times \mathbf{b})_i = \varepsilon_{ijk}a_j b_k\).

## A.2 Polar Coordinate Relations

Strain-displacement in polar coordinates:

\[
\varepsilon_{rr} = \frac{\partial u_r}{\partial r}, \quad \varepsilon_{\theta\theta} = \frac{u_r}{r} + \frac{1}{r}\frac{\partial u_\theta}{\partial \theta}, \quad \varepsilon_{r\theta} = \frac{1}{2}\left(\frac{1}{r}\frac{\partial u_r}{\partial\theta} + \frac{\partial u_\theta}{\partial r} - \frac{u_\theta}{r}\right)
\]

Equilibrium equations in polar coordinates (with body forces \(f_r, f_\theta\)):

\[
\frac{\partial\sigma_{rr}}{\partial r} + \frac{1}{r}\frac{\partial\sigma_{r\theta}}{\partial\theta} + \frac{\sigma_{rr} - \sigma_{\theta\theta}}{r} + f_r = 0
\]

\[
\frac{1}{r}\frac{\partial\sigma_{\theta\theta}}{\partial\theta} + \frac{\partial\sigma_{r\theta}}{\partial r} + \frac{2\sigma_{r\theta}}{r} + f_\theta = 0
\]

## A.3 Conversion Between Stress and Strength Quantities

| From | To | Formula |
|---|---|---|
| \(c, \phi\) | \(\sigma_{ci}\) | \(2c\cos\phi/(1-\sin\phi)\) |
| \(c, \phi\) | \(N_\phi\) | \((1+\sin\phi)/(1-\sin\phi)\) |
| \(\sigma_{ci}, \phi\) | \(c\) | \(\sigma_{ci}(1-\sin\phi)/(2\cos\phi)\) |
| \(V_P, V_S, \rho\) | \(E_{\text{dyn}}\) | \(\rho V_S^2(3V_P^2 - 4V_S^2)/(V_P^2 - V_S^2)\) |
| \(V_P, V_S\) | \(\nu_{\text{dyn}}\) | \((V_P^2 - 2V_S^2) / [2(V_P^2 - V_S^2)]\) |
| \(K, G\) | \(E\) | \(9KG/(3K+G)\) |
| \(K, G\) | \(\nu\) | \((3K - 2G)/(6K + 2G)\) |
| \(\lambda, \mu\) | \(E\) | \(\mu(3\lambda + 2\mu)/(\lambda+\mu)\) |
| \(\lambda, \mu\) | \(\nu\) | \(\lambda / [2(\lambda+\mu)]\) |

## A.4 Key Rock Mechanics Inequalities

For any physically possible stress state in the Earth's crust:
- Compressive stresses dominate at depth: \(\sigma_1, \sigma_2, \sigma_3 > 0\) (compression positive convention) at depths \(\gtrsim 100\) m.
- The stress ratio \(K_0 = S_h/S_v\) is bounded by the frictional strength of faults: for \(\phi = 30°\), \(K_0^{\min} = 1/3\) and \(K_0^{\max} = 3\) for the normal/reverse faulting limits respectively.
- Pore pressure cannot exceed the minimum principal stress indefinitely; if it does, a hydraulic fracture opens.
- The Biot coefficient satisfies \(0 \leq \alpha \leq 1\); for soils \(\alpha \approx 1\), for crystalline rocks \(\alpha \approx 0.3\)–\(0.6\).

## A.5 Glossary of Key Terms

**Airy stress function** — a scalar potential \(\Phi\) whose second derivatives give the stress components; automatically satisfies equilibrium; satisfies compatibility if \(\nabla^4\Phi = 0\).

**Anisotropy** — directional dependence of mechanical properties; most common in layered or foliated rocks.

**Biot coefficient** — the poroelastic parameter \(\alpha\) relating pore pressure to total stress in the effective stress law; \(\alpha = 1 - K_{\text{dry}}/K_{\text{grain}}\).

**Brittle-ductile transition** — the confining stress (or temperature, or strain rate) above which rock transitions from brittle fracture to ductile flow; approximately 100–300 MPa for common crustal rocks at room temperature.

**Characteristic equation** — the polynomial \(\det(\boldsymbol{\sigma} - \sigma\mathbf{I}) = 0\) whose roots are the principal stresses.

**Cohesion** — the shear strength of a rock or joint at zero normal stress; the \(y\)-intercept of the Mohr-Coulomb failure envelope.

**Compatibility equations** — conditions on the strain field ensuring a continuous, single-valued displacement field exists.

**Convergence-confinement method (CCM)** — a design approach for circular tunnels that tracks wall convergence as a function of internal support pressure, combining the ground reaction curve, support characteristic curve, and longitudinal displacement profile.

**Critical state** — the condition of shearing at constant stress and constant volume; the asymptotic state of all shear tests in the critical state framework.

**Deviatoric stress** — the stress tensor minus the mean stress tensor; drives distortion without volume change; \(\mathbf{s} = \boldsymbol{\sigma} - p\mathbf{I}\).

**Dilatancy** — volume increase during shear deformation; controlled by surface roughness of joints (JRC) and confining stress.

**Drucker-Prager** — a smooth, conical yield surface in principal stress space that is a 3D generalization of von Mises (circular cross-section) accounting for pressure dependence.

**Effective stress** — the stress controlling mechanical behaviour of a porous medium: \(\sigma' = \sigma - \alpha p_f\).

**Factor of safety (FoS)** — ratio of resisting to driving forces at a failure surface; \(F > 1\) stable, \(F < 1\) unstable.

**Fisher distribution** — a probability distribution on a sphere, analogous to the normal distribution; used to describe dispersion of fracture orientations.

**Fracture toughness (\(K_{Ic}\))** — the critical mode I stress intensity factor for fracture propagation; a material property with units Pa·m^{1/2}.

**Geological Strength Index (GSI)** — a qualitative index (0–100) of rock mass quality based on structure and surface condition, used in the Hoek-Brown failure criterion.

**Gutenberg-Richter law** — the linear relationship \(\log N = a - bm\) between earthquake frequency \(N\) and magnitude \(m\); the b-value describes the ratio of small to large events.

**Hoek-Brown criterion** — an empirical nonlinear failure criterion for rock masses: \(\sigma_1 = \sigma_3 + \sigma_{ci}(m_b\sigma_3/\sigma_{ci} + s)^a\).

**Hydraulic diffusivity** — the ratio \(D = k/(\mu S_t)\) governing pore pressure diffusion; units m²/s; typical values from \(10^{-6}\) m²/s (clay) to \(10^{-1}\) m²/s (fractured rock).

**In-situ stress** — the stress state in the Earth prior to any engineering disturbance; determined by overburden, tectonic, and geological history.

**Invariants** — quantities that are independent of coordinate system orientation; for the stress tensor: \(I_1 = \text{tr}(\boldsymbol{\sigma})\), \(I_2\), \(I_3 = \det(\boldsymbol{\sigma})\).

**Kirsch solution** — the analytical solution for stresses around a circular borehole or tunnel in a biaxial far-field stress field; derived from the Airy stress function approach.

**Lamé parameters (\(\lambda, \mu\))** — the two elastic constants appearing naturally in the inverse Hooke's law: \(\sigma_{ij} = \lambda\varepsilon_{kk}\delta_{ij} + 2\mu\varepsilon_{ij}\).

**Mohr-Coulomb** — the linear shear failure criterion: \(\tau_f = c + \sigma_n\tan\phi\); equivalent to \(\sigma_1 = N_\phi\sigma_3 + \sigma_{ci}\).

**Mohr circle** — geometric representation of the stress state; a circle in \((\sigma_n, \tau)\) space with centre \((\sigma_1+\sigma_3)/2\) and radius \((\sigma_1-\sigma_3)/2\).

**Monte Carlo method** — probabilistic simulation technique: sample input distributions, evaluate the model, count failures; gives probability of failure.

**Overcoring** — an in-situ stress measurement method in which a pilot hole with strain gauges is stress-relieved by overcoring; elastic springback gives in-situ stresses.

**Plastic radius** — the radius \(r_p\) of the yielded zone around a circular opening; increases as internal support pressure decreases.

**Poisson's ratio (\(\nu\))** — ratio of lateral to axial strain under uniaxial stress; \(0 < \nu < 0.5\) for most rocks; dimensionless.

**Principal stresses** — the three eigenvalues of the stress tensor; the normal stresses on planes with no shear stress.

**Q-system** — empirical rock mass classification by Barton et al. (1974): \(Q = (RQD/J_n)(J_r/J_a)(J_w/SRF)\); used for tunnel support design.

**RMR (Rock Mass Rating)** — empirical classification system by Bieniawski (1973); sum of scores for UCS, RQD, joint spacing, joint condition, groundwater, and orientation; total 0–100.

**RQD (Rock Quality Designation)** — percentage of drill core in pieces \(\geq 10\) cm; 0 (completely broken) to 100% (intact).

**Stress invariants** — \(I_1, I_2, I_3\); values independent of coordinate orientation; roots of the characteristic equation.

**Terzaghi effective stress** — \(\sigma' = \sigma - p_f\); the stress controlling soil and rock behaviour; pore pressure reduces effective normal stress and thus shear strength.

**Traction vector** — the force per unit area on a plane: \(\mathbf{T} = \boldsymbol{\sigma}\hat{n}\); has both normal and shear components.

**Uniaxial compressive strength (UCS, \(\sigma_{ci}\))** — the axial stress at failure with zero confining pressure; the most commonly measured rock strength parameter.

**Young's modulus (\(E\))** — ratio of axial stress to axial strain under uniaxial loading; units Pa; typically 1–100 GPa for rocks.

---

# Chapter 35: Comprehensive Review Problems and Extended Derivations

## 35.1 The Stress Transformation Matrix — Full Derivation

Understanding stress transformation is fundamental to converting measured stresses from one coordinate frame to another. We derive the transformation law from first principles using the traction vector approach.

Consider two Cartesian coordinate systems: the original \((x_1, x_2, x_3)\) and a rotated system \((x_1', x_2', x_3')\). The direction cosine \(\ell_{ij}\) is the cosine of the angle between the \(x_i'\) axis and the \(x_j\) axis:

\[
\ell_{ij} = \cos\angle(x_i', x_j) = \hat{e}_i' \cdot \hat{e}_j
\]

The rotation matrix \(\mathbf{L}\) with components \(\ell_{ij}\) is orthogonal: \(\mathbf{L}\mathbf{L}^T = \mathbf{I}\).

A vector \(\mathbf{v}\) transforms as \(v_i' = \ell_{ij}v_j\). A second-rank tensor transforms as:

\[
\sigma_{ij}' = \ell_{ik}\ell_{jl}\sigma_{kl}
\]

or in matrix notation \(\boldsymbol{\sigma}' = \mathbf{L}\boldsymbol{\sigma}\mathbf{L}^T\). This is the **tensor transformation law**.

<div class="theorem">
<strong>Proof of Tensor Transformation Law.</strong> The traction vector on a face with normal \(\hat{n}'\) (a primed coordinate face) must be the same physical vector regardless of which coordinate system we use to express it. In the primed system:

\[
T_i' = \sigma_{ij}' n_j'
\]

In the original system, the same traction is \(T_k = \sigma_{kl}n_l\). The primed and original components of \(\mathbf{T}\) are related by \(T_i' = \ell_{ij}T_j\), and similarly \(n_j' = \ell_{jk}n_k\). Substituting:

\[
\ell_{ij}\sigma_{jk}n_k = \sigma_{im}'n_m' = \sigma_{im}'\ell_{mn}n_n = \sigma_{im}'\ell_{mn}n_n
\]

Since this must hold for all \(\mathbf{n}\), we can equate coefficients of \(n_n\):

\[
\ell_{ij}\sigma_{jn} = \sigma_{im}'\ell_{mn}
\]

Multiplying both sides by \(\ell_{pn}\) and using orthogonality (\(\ell_{mn}\ell_{pn} = \delta_{mp}\)):

\[
\ell_{ij}\sigma_{jp}\ell_{pn}\ell_{pn}...
\]

More directly: from \(\ell_{ij}\sigma_{jk} = \sigma_{im}'\ell_{mk}\), right-multiply by \(\ell_{pk}\) (using \(\ell_{mk}\ell_{pk} = \delta_{mp}\)):

\[
\ell_{ij}\sigma_{jk}\ell_{pk} = \sigma_{ip}'
\]

Renaming \(p \to j\): \(\sigma_{ij}' = \ell_{ik}\ell_{jl}\sigma_{kl}\). \(\square\)
</div>

## 35.2 Poroelastic Wave Propagation — The Biot Equations

In a fully saturated porous medium, there are actually *two* compressional wave modes (not one). **Biot (1956)** showed that coupling between solid skeleton and pore fluid creates:

**Fast P-wave**: solid and fluid move in phase; velocity close to undrained elastic prediction. This is the wave detected in standard seismic surveys.

**Slow P-wave (Biot wave)**: solid and fluid move out of phase; the wave is heavily attenuated and exists only at low frequencies or short distances. Its velocity is much lower:

\[
V_{P,\text{slow}} \approx \sqrt{\frac{k_0/\mu_f}{(\phi/K_f + (\alpha-\phi)/K_{\text{grain}})\phi}}
\]

where \(k_0\) is the permeability, \(\mu_f\) the fluid viscosity, \(K_f\) the fluid bulk modulus.

The existence of the Biot slow wave has important implications for interpreting seismic wave attenuation in saturated reservoirs, and for understanding the frequency dependence of measured elastic moduli (the difference between low-frequency quasi-static and high-frequency dynamic moduli).

## 35.3 Strength Anisotropy of Transversely Isotropic Rock

Rocks with a single preferred fabric direction (bedding in sedimentary rocks, foliation in metamorphic rocks) exhibit **strength anisotropy**: the orientation of the loading direction relative to the fabric controls the failure mode and the strength.

For a specimen loaded at angle \(\beta\) to the poles of the weakness planes (e.g., bedding), three failure modes are possible:

1. **Failure through the matrix** (high \(\sigma_{ci}\), independent of \(\beta\)): occurs when \(\beta\) is near 0° or 90° (loading nearly parallel or perpendicular to bedding).

2. **Sliding along weakness planes** (low strength): occurs when \(\beta\) is near the critical angle \(\beta_c = 45° + \phi_j/2\). The strength for sliding along the weakness plane at angle \(\beta\) to the loading direction is:

\[
\sigma_1 = \sigma_3 + \frac{2(c_j + \sigma_3\tan\phi_j)}{(1 - \tan\phi_j\cot\beta)\sin 2\beta}
\]

This is minimized at \(\beta = \beta_c = 45° + \phi_j/2\), where the denominator is maximized.

3. **Transition zone**: at intermediate \(\beta\), failure mode depends on whether the Mohr circle first touches the intact rock envelope or the weak plane envelope.

The resulting **anisotropy curve** (strength versus \(\beta\)) has a characteristic U-shape: high strength near \(\beta = 0°\) and \(90°\), with a strong minimum near \(\beta \approx 30°\)–\(40°\). This behaviour is observed experimentally in slate, phyllite, shale, and other foliated rocks, and is critical for designing boreholes through these formations.

## 35.4 Time-Dependent Creep — A Worked Example

<div class="example">
<strong>Example 35.1: Creep of Salt around a Cavern.</strong> Underground salt caverns are used for hydrocarbon storage. Salt deforms by steady-state creep at room temperature, governed by:

\[
\dot{\varepsilon}_s = A (\sigma_e)^n
\]

where \(\sigma_e = (\sigma_1 - \sigma_3)\) is the differential stress (von Mises equivalent), \(A = 0.64 \times 10^{-6}\) MPa\(^{-n}\)/day, and \(n = 5\) for Asse mine salt.

A spherical cavern of radius \(a = 30\) m at depth 700 m in salt (\(\rho = 2200\) kg/m³) is maintained at internal gas pressure \(p_c = 10\) MPa. The far-field stress is approximately hydrostatic at \(p_0 = \rho g z = 2200 \times 9.81 \times 700 \times 10^{-6} = 15.1\) MPa.

The creep closure rate at the cavern wall is given by (Langer, 1984):

\[
\dot{u}_a / a = A\left(\frac{3}{2}\frac{p_0 - p_c}{n}\right)^n
\]

Substituting: differential driving stress at wall \(= p_0 - p_c = 15.1 - 10 = 5.1\) MPa.

\[
\dot{u}_a/a = 0.64 \times 10^{-6} \times \left(\frac{3 \times 5.1}{2 \times 5}\right)^5 = 0.64 \times 10^{-6} \times (1.53)^5
\]

\[
(1.53)^5 = 1.53^2 \times 1.53^2 \times 1.53 = 2.341 \times 2.341 \times 1.53 = 5.48 \times 1.53 = 8.38
\]

\[
\dot{u}_a/a = 0.64 \times 10^{-6} \times 8.38 = 5.36 \times 10^{-6} \text{ per day}
\]

\[
\dot{u}_a = 5.36 \times 10^{-6} \times 30 = 1.61 \times 10^{-4} \text{ m/day} = 5.9 \text{ cm/year}
\]

This closure rate must be compensated by periodic gas injection (to maintain pressure) or the cavern will converge. Salt cavern operators manage this by scheduling pressure maintenance cycles.
</div>

## 35.5 Deep Learning and Machine Learning in Rock Mechanics

The explosion in computational tools has brought **data-driven methods** into geomechanics. Applications include:

**Lithology prediction from borehole logs**: neural networks or support vector machines trained on core descriptions and geophysical log responses (gamma ray, density, neutron porosity, P-wave sonic, resistivity) can predict lithology in uncored intervals.

**Strength prediction from index tests**: regression or Gaussian process emulators trained on databases of UCS, point load index, Schmidt hammer rebound, and mineralogy measurements allow rapid strength estimation without expensive triaxial testing.

**Microseismic event location**: deep learning models trained on synthetic seismograms can locate events without explicit picking of P- and S-wave arrivals, improving speed and automation in real-time monitoring.

**Hydraulic fracture geometry inference**: inversion of microseismic clouds to fracture geometry using machine learning reduces the non-uniqueness inherent in sparse seismic datasets.

The **critical limitation** of data-driven methods in rock mechanics is the scarcity and heterogeneity of training data — rock mass properties vary tremendously between sites, and labelled datasets are small compared to other engineering domains. Physics-informed neural networks (PINNs) that embed the governing partial differential equations (equilibrium, compatibility, constitutive relations) as constraints are one promising approach to reduce data requirements.

## 35.6 Summary Table: In-Situ Stress Measurement Methods

| Method | Measures | Depth Range | Advantages | Limitations |
|---|---|---|---|---|
| Hydraulic fracturing | \(S_h\) (magnitude), \(S_H\) (orientation) | 0–5 km | Direct, widely used | Only minimum stress directly; \(S_H\) inferred |
| Overcoring (CSIRO HI) | Full 3D stress tensor | 0–1 km | Complete tensor | Expensive, depth limited, validity requires elastic rock |
| Borehole breakouts | \(S_H\) orientation, bounds on magnitude | Any depth with logs | Uses existing boreholes | Qualitative unless combined with other data |
| HTPF | Multiple stress components | 0–5 km | Works with natural fractures | Requires good image logs; complex interpretation |
| DSCA / Kaiser effect | Principal stress magnitudes | Any depth (core) | Uses archive core; no return to site | Indirect; requires careful sample preparation |
| Focal mechanisms | Principal stress orientations | Any depth with seismicity | Integrates over large volume | Not point measurement; does not give magnitudes |
| Seismic velocity anisotropy | Horizontal stress orientation | Reservoir scale | Non-invasive; 4D possible | Empirical calibration required |

## 35.7 Convergence of Analytical, Numerical, and Empirical Methods

One of the most important skills the practising rock mechanics engineer develops is knowing when each type of analysis method is appropriate and how to cross-check results between methods. A systematic approach is:

**Step 1 — Analytical estimates**: apply the simplest applicable closed-form solution (Kirsch for borehole, planar failure for slope) to get order-of-magnitude answers quickly. These answers anchor subsequent more complex analyses.

**Step 2 — Empirical checks**: use classification systems (Q, RMR, GSI) to estimate rock mass quality and compare implied support requirements to the analytical prediction. If the two are consistent, confidence increases.

**Step 3 — Numerical modelling**: for complex geometry, material behaviour, or multiple interacting features, build a numerical model calibrated against the analytical and empirical results. Use sensitivity analyses to identify which parameters most influence the result — these are the parameters that deserve the most attention in site characterization.

**Step 4 — Observational confirmation**: instrument the structure during and after construction. Compare measured displacements, pressures, and seismicity against predictions. Update the model based on observations (Bayesian updating). Adjust the design if observations exceed trigger values.

This convergence of methods — not reliance on any single approach — is the hallmark of competent geomechanical engineering practice and reflects the inherent uncertainty in characterizing the subsurface.

## 35.8 Final Example: Integrated Design of a Mine Access Tunnel

<div class="example">
<strong>Example 35.2: Integrated Tunnel Design.</strong> A horizontal access tunnel of 5 m diameter is to be driven at 400 m depth in a limestone rock mass. The following data are available from site investigation:

<strong>Rock mass characterization:</strong>
- Intact UCS: \(\sigma_{ci} = 100\) MPa, \(m_i = 10\) (limestone)
- RQD = 70%, joint sets: 3, joint condition: slightly rough, slightly weathered, aperture \(<0.1\) mm, no fill
- Groundwater: damp walls
- RMR (before orientation adjustment): \(7 + 13 + 10 + 22 + 10 = 62\) → Class II (Good rock)
- \(J_n = 9\), \(J_r = 1.5\), \(J_a = 1.0\), \(J_w = 1.0\), SRF = 2.5 (medium stress)
- \(Q = (70/9)(1.5/1.0)(1.0/2.5) = 7.78 \times 1.5 \times 0.4 = 4.67\)

<strong>In-situ stresses:</strong>
- \(S_v = 2700 \times 9.81 \times 400 \times 10^{-6} = 10.6\) MPa
- \(S_H = 15\) MPa (NE-SW), \(S_h = 8\) MPa (NW-SE)
- Tunnel axis oriented E-W → \(P = S_h = 8\) MPa (perpendicular to axis in horizontal plane), \(Q_s = S_v = 10.6\) MPa (vertical)

Wait — for the 2D Kirsch solution applied to a horizontal tunnel, the far-field stresses in the plane perpendicular to the tunnel axis are the horizontal stress perpendicular to the tunnel (\(S_H\) or \(S_h\) depending on orientation) and the vertical stress. With an E-W tunnel: perpendicular horizontal stress = N-S component = \(S_h = 8\) MPa; vertical = \(S_v = 10.6\) MPa. So \(P = 8\) MPa (horizontal), \(Q_s = 10.6\) MPa (vertical).

<strong>Kirsch stress check:</strong>
- Hoop stress at crown and invert (\(\theta = 90°\) from \(S_h\) direction — vertical): \(\sigma_{\theta\theta} = 3(8) - 10.6 = 13.4\) MPa
- Hoop stress at springline (\(\theta = 0°\) — horizontal): \(\sigma_{\theta\theta} = 3(10.6) - 8 = 23.8\) MPa

Maximum hoop stress is 23.8 MPa at the springlines (side walls). Is this within the elastic limit?

<strong>Hoek-Brown rock mass strength</strong> (GSI estimated from RMR: \(\text{GSI} \approx \text{RMR} - 5 = 57\)):

\[
m_b = 10 \times \exp\!\left(\frac{57-100}{28}\right) = 10 \times e^{-1.536} = 10 \times 0.215 = 2.15
\]

\[
s = \exp\!\left(\frac{57-100}{9}\right) = e^{-4.78} = 0.0084
\]

Rock mass UCS (at \(\sigma_3 = 0\)): \(\sigma_{ci}\sqrt{s} = 100\sqrt{0.0084} = 100 \times 0.0917 = 9.17\) MPa.

Since maximum hoop stress (23.8 MPa) \(> 9.17\) MPa (rock mass UCS), <strong>yielding will occur</strong> at the tunnel springlines.

<strong>Estimate of plastic zone radius</strong> using \(c' = 0.92\) MPa, \(\phi' = 52°\) (from Hoek-Brown linearization at typical stress range):

\[
N_\phi = (1 + \sin 52°)/(1 - \sin 52°) = 1.788/0.212 = 8.43
\]

\[
\sigma_{ci}' = 2(0.92)\cos 52° / (1 - \sin 52°) = 1.84 \times 0.616 / 0.212 = 5.35 \text{ MPa}
\]

\[
p_{i,cr} = \frac{2p_0 - \sigma_{ci}'}{1 + N_\phi} = \frac{2 \times 11.3 - 5.35}{9.43} = \frac{17.25}{9.43} = 1.83 \text{ MPa}
\]

(Using average far-field stress \(p_0 = (8 + 10.6)/2 = 9.3\) MPa for the hydrostatic approximation.)

For no internal support (\(p_i = 0\)):

\[
r_p = a\left[\frac{2p_0 - \sigma_{ci}'/(N_\phi - 1)}{(1+N_\phi)\cdot(0 + \sigma_{ci}'/(N_\phi-1))}\right]^{1/(N_\phi-1)}
\]

\[
= 2.5\left[\frac{2 \times 9.3 - 5.35/7.43}{9.43 \times 5.35/7.43}\right]^{1/7.43} = 2.5\left[\frac{18.6 - 0.72}{6.79}\right]^{0.135}
\]

\[
= 2.5 \times (2.63)^{0.135} = 2.5 \times 1.148 = 2.87 \text{ m}
\]

The plastic zone extends 2.87 m from the tunnel centre (beyond the 2.5 m radius), so approximately 0.37 m of plastic zone — manageable with rock bolts.

<strong>Q-system support recommendation:</strong> \(Q = 4.67\), ESR = 1.6 (permanent underground excavations), \(D_e = 5.0/1.6 = 3.13\) m. From the Q-chart, this falls in the "reinforced shotcrete + systematic bolting" zone: 50–90 mm shotcrete, 2.5–3.0 m long bolts at 1.5–2.0 m spacing. This is consistent with the computed plastic zone depth.
</div>

This integrated example illustrates the essential rock mechanics workflow: classify the rock mass → measure/estimate stresses → apply analytical solutions to check stability → refine with empirical methods → design support. Every step requires judgment about which simplifications are acceptable, and the design is validated by monitoring during construction.

---

# Chapter 36: Emerging Topics in Rock Mechanics Research

## 36.1 Digital Rock Physics

**Digital rock physics (DRP)** uses three-dimensional imaging of rock microstructure (via X-ray CT scanning or focused ion beam scanning electron microscopy) combined with pore-scale simulation to compute effective rock properties. Instead of measuring permeability on a core plug, one images the pore network at micron resolution and runs Lattice-Boltzmann or Stokes flow simulations through the virtual pore space. Similarly, elastic moduli are computed by FEM on the grain-scale microstructure.

DRP is particularly powerful for characterizing rocks that are difficult to test conventionally — fractured cores that cannot be cored intact, heterogeneous rocks where sample size effects are large, or rocks at high pressure conditions simulated numerically. Its limitation is that representative elementary volumes (REV) at the pore scale may still miss larger fractures that dominate bulk permeability.

## 36.2 Rock Mechanics in the Energy Transition

The global shift toward low-carbon energy is creating new geomechanical challenges at unprecedented scale:

**Compressed Air Energy Storage (CAES)**: compressed air is stored in underground caverns during periods of excess renewable generation and released to drive turbines during peak demand. Salt caverns, hard rock caverns, and depleted reservoirs are candidate storage sites. The geomechanical challenge is managing repeated pressure cycling that can cause fatigue failure of the rock walls or salt creep that reduces cavern volume.

**Hydrogen storage**: hydrogen can be stored in salt caverns or depleted reservoirs. Hydrogen embrittlement of steel casing and potential reaction with reservoir minerals add geomechanical complexity beyond simple pressure cycling.

**Offshore wind foundation design**: monopiles and suction caissons for offshore wind turbines are founded in seabed sediments and shallow rock. Lateral loading from wind and wave forces creates complex stress states, and fatigue from cyclic loading over 25+ year design lives requires careful geomechanical analysis.

**Mine closure and tailings management**: as many mines approach end-of-life, the geomechanics of underground mine closure (flooding, consolidation of tailings, long-term pillar creep) and tailings storage facility stability become critical. The failure of tailings dams (Brumadinho, Brazil, 2019; Mount Polley, Canada, 2014) has highlighted the catastrophic consequences of inadequate geotechnical and geomechanical design.

## 36.3 Rock Mechanics at Extreme Conditions

Deep mining (Mponeng gold mine, South Africa: 4 km depth; Kidd Creek, Canada: 3 km) subjects rock to stresses of 100–150 MPa, approaching and sometimes exceeding the UCS of the intact rock. At these depths:

- Rock bursts become increasingly common and violent, releasing megajoules of seismic energy in single events.
- Water temperature in the rock is 40–60°C, requiring chilling of ventilation air — a major energy cost.
- Time-dependent creep of fractured, stress-fractured rock contributes to ongoing convergence of excavations.
- The **spalling** strength (initiation of damage at the tunnel wall) may be as low as 0.4\(\sigma_{ci}\) in undamaged crystalline rock, far below the conventional UCS — because the biaxial stress state at the tunnel wall has zero confining stress on one face, enabling crack splitting parallel to the wall.

The **mine-by experiment** at AECL's Underground Research Laboratory (URL) in Lac du Bonnet granite demonstrated these effects clearly: a 3.5 m diameter test tunnel driven at 420 m depth in strong granite (UCS ~200 MPa, \(\sigma_1 \approx 55\) MPa, \(\sigma_3 \approx 14\) MPa) developed progressive v-shaped notches (breakouts) in the crown and invert, controlled by the deviatoric stress rather than mean stress, with spalling initiating at about 0.5\(\sigma_{ci}\). This case history became a benchmark for testing numerical models of brittle rock fracture.

---

The breadth of topics covered in these notes — from the tensor algebra of stress transformation to the operational realities of mine burst management, from the thermodynamics of creep to the statistical inference of b-values — reflects the genuinely interdisciplinary nature of rock mechanics as it is practised today. The unifying thread is the continuum mechanics framework: once the stress tensor and its transformation properties are understood, all the analytical solutions follow by applying equilibrium, compatibility, and the appropriate constitutive relation. The engineering art lies in knowing which constitutive relation to use, under what circumstances the assumptions break down, and how to design monitoring programs that catch failures of those assumptions before they become failures in the field.
