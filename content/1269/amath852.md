---
why: |
  Seismic wave propagation is one of the most mathematically rich areas of geophysics — combining PDE theory, asymptotic methods, spectral theory, and inverse problems — yet UW has no course on it. The subject is taught at Caltech, Cambridge, Princeton, Stanford, MIT, and Oxford, and is central to understanding Earth's interior structure.
made_up: true
title: "AMATH 852: Mathematical Geophysics and Seismic Wave Propagation"
subjects: "AMATH"
---

*These notes synthesize material from K. Aki and P.G. Richards's Quantitative Seismology, F.A. Dahlen and J. Tromp's Theoretical Global Seismology, A. Ben-Menahem and S.J. Singh's Seismic Waves and Sources, J. Shearer's Introduction to Seismology, and supplementary material from Caltech Ge/ACM seismology notes (Tromp, Helmberger), Cambridge DAMTP geophysics lecture notes, and Princeton geosciences course materials.*

---

## Chapter 1: Elastic Waves in Homogeneous Media

### 1.1 Linearized Elastodynamics and the Stress Tensor

The mathematical study of seismic waves begins with continuum mechanics. The Earth, to a first approximation, behaves as an elastic solid: when deformed by a passing seismic wave, each material element experiences restoring forces proportional to the strain. This section develops the linearized equations of motion that govern small-amplitude elastic disturbances, the foundation upon which all of seismology rests.

Consider a continuous medium occupying a region \(\Omega \subset \mathbb{R}^3\). Let \(\mathbf{u}(\mathbf{x}, t)\) denote the displacement of the material particle originally at position \(\mathbf{x}\) at time \(t\). The deformation is characterized by the strain tensor.

<div class="definition">
<strong>Definition 1.1 (Linearized Strain Tensor).</strong> The <em>linearized (infinitesimal) strain tensor</em> is

\[
\epsilon_{ij} = \frac{1}{2}\left(\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i}\right),
\]
where \(u_i\) denotes the \(i\)-th component of the displacement field \(\mathbf{u}\). This is the symmetric part of the displacement gradient \(\nabla \mathbf{u}\).
</div>

The strain tensor captures how distances between nearby material points change under the deformation. It is a linearization valid for small deformations, which is an excellent approximation for seismic waves far from the rupture zone: typical seismic strains are of order \(10^{-6}\) or smaller. The antisymmetric part \(\frac{1}{2}(\partial_j u_i - \partial_i u_j)\) corresponds to rigid rotation and produces no restoring force.

The internal forces in the medium are described by the Cauchy stress tensor \(\sigma_{ij}\), where \(\sigma_{ij}\) represents the force per unit area in the \(i\)-direction acting on a surface element with outward normal in the \(j\)-direction. For a linearly elastic material, stress is related to strain by the generalized Hooke's law.

<div class="definition">
<strong>Definition 1.2 (Hooke's Law and the Elastic Tensor).</strong> In a general linearly elastic medium, the stress-strain relation is

\[
\sigma_{ij} = C_{ijkl}\, \epsilon_{kl},
\]
where \(C_{ijkl}\) is the <em>fourth-order elastic stiffness tensor</em> (81 components). The symmetries \(C_{ijkl} = C_{jikl} = C_{ijlk} = C_{klij}\) reduce the number of independent components to at most 21. For an <em>isotropic</em> medium, the elastic tensor takes the form

\[
C_{ijkl} = \lambda\, \delta_{ij}\delta_{kl} + \mu\,(\delta_{ik}\delta_{jl} + \delta_{il}\delta_{jk}),
\]
where \(\lambda\) and \(\mu\) are the <em>Lame parameters</em>.
</div>

The parameter \(\mu\) is the shear modulus (rigidity), measuring resistance to shear deformation, and \(\lambda\) is related to resistance to volumetric change. In the Earth's mantle, typical values are \(\mu \sim 70\) GPa and \(\lambda \sim 100\) GPa. The bulk modulus is \(\kappa = \lambda + \frac{2}{3}\mu\). Cauchy's equation of motion, obtained by applying Newton's second law to an infinitesimal material element, gives the fundamental dynamical equation.

<div class="theorem">
<strong>Theorem 1.3 (Navier's Equation).</strong> In a homogeneous, isotropic, linearly elastic medium with density \(\rho\), the displacement field \(\mathbf{u}(\mathbf{x}, t)\) satisfies the <em>Navier equation</em>:

\[
\rho\, \ddot{\mathbf{u}} = (\lambda + 2\mu)\,\nabla(\nabla \cdot \mathbf{u}) - \mu\,\nabla \times (\nabla \times \mathbf{u}) + \mathbf{f},
\]
equivalently written as

\[
\rho\, \ddot{\mathbf{u}} = (\lambda + \mu)\,\nabla(\nabla \cdot \mathbf{u}) + \mu\,\nabla^2 \mathbf{u} + \mathbf{f},
\]
where \(\mathbf{f}(\mathbf{x}, t)\) is the body-force density and \(\ddot{\mathbf{u}} = \partial^2 \mathbf{u}/\partial t^2\).
</div>

<div class="proof">
<strong>Proof.</strong> Cauchy's equation of motion states \(\rho\,\ddot{u}_i = \partial_j \sigma_{ij} + f_i\). Substituting the isotropic Hooke's law \(\sigma_{ij} = \lambda\, \delta_{ij}\, \epsilon_{kk} + 2\mu\, \epsilon_{ij}\) and using \(\epsilon_{kk} = \nabla \cdot \mathbf{u}\), we obtain

\[
\partial_j \sigma_{ij} = \lambda\, \partial_i(\nabla \cdot \mathbf{u}) + 2\mu\, \partial_j \epsilon_{ij} = \lambda\, \partial_i(\nabla \cdot \mathbf{u}) + \mu\,(\partial_j \partial_j u_i + \partial_i \partial_j u_j).
\]
Since \(\partial_j \partial_j u_i = \nabla^2 u_i\) and \(\partial_i \partial_j u_j = \partial_i(\nabla \cdot \mathbf{u})\), this becomes \((\lambda + \mu)\,\partial_i(\nabla \cdot \mathbf{u}) + \mu\,\nabla^2 u_i + f_i\), which in vector form is the stated result. The first form follows from the vector identity \(\nabla^2 \mathbf{u} = \nabla(\nabla \cdot \mathbf{u}) - \nabla \times (\nabla \times \mathbf{u})\). \(\square\)
</div>

<div class="remark">
<strong>Remark 1.4.</strong> The Navier equation is the vector analogue of the scalar wave equation, but with the crucial difference that two distinct wave speeds appear. This duality between compressional and shear motion is a fundamental feature of elastic media that has no analogue in acoustics or electromagnetism (where there is a single wave speed in each case). The two Lame parameters \(\lambda\) and \(\mu\) can be expressed in terms of more physically intuitive quantities: Young's modulus \(E = \mu(3\lambda + 2\mu)/(\lambda + \mu)\), Poisson's ratio \(\nu = \lambda/[2(\lambda + \mu)]\), and bulk modulus \(\kappa = \lambda + 2\mu/3\). The requirement that elastic strain energy be positive definite imposes \(\mu > 0\) and \(\kappa > 0\) (equivalently \(-1 < \nu < 1/2\)). Most rocks satisfy \(0.20 \le \nu \le 0.30\); the special case \(\nu = 1/4\) (\(\lambda = \mu\)), known as a Poisson solid, is a useful approximation for many crustal rocks.
</div>

This equation, derived by Navier in 1821 and placed on rigorous footing by Cauchy and Poisson, governs all elastic wave phenomena in a homogeneous isotropic medium. Its structure immediately reveals that elastic waves come in two fundamental types.

### 1.2 P-Wave and S-Wave Decomposition

The Navier equation, while compact, couples all three components of displacement. The Helmholtz decomposition provides the key to decoupling them into independently propagating wave types, a decomposition of profound physical significance first recognized by Poisson (1831) and Stokes (1849).

<div class="theorem">
<strong>Theorem 1.4 (Helmholtz Decomposition).</strong> Any sufficiently smooth vector field \(\mathbf{u}\) on \(\mathbb{R}^3\) that decays at infinity can be uniquely decomposed as

\[
\mathbf{u} = \nabla \phi + \nabla \times \boldsymbol{\psi}, \qquad \nabla \cdot \boldsymbol{\psi} = 0,
\]
where \(\phi\) is the scalar potential and \(\boldsymbol{\psi}\) is the vector potential (with the gauge condition \(\nabla \cdot \boldsymbol{\psi} = 0\)).
</div>

Substituting this decomposition into the source-free Navier equation (\(\mathbf{f} = 0\)) and using the identities \(\nabla \times (\nabla \phi) = 0\) and \(\nabla \cdot (\nabla \times \boldsymbol{\psi}) = 0\), one obtains two decoupled wave equations.

<div class="theorem">
<strong>Theorem 1.5 (P and S Wave Equations).</strong> The scalar potential \(\phi\) and vector potential \(\boldsymbol{\psi}\) satisfy

\[
\ddot{\phi} = \alpha^2\, \nabla^2 \phi, \qquad \ddot{\boldsymbol{\psi}} = \beta^2\, \nabla^2 \boldsymbol{\psi},
\]
where the <em>P-wave velocity</em> (compressional) and <em>S-wave velocity</em> (shear) are

\[
\alpha = \sqrt{\frac{\lambda + 2\mu}{\rho}}, \qquad \beta = \sqrt{\frac{\mu}{\rho}}.
\]
</div>

The P-wave (primary wave, or pressure wave) is irrotational: \(\nabla \times \mathbf{u}_P = 0\). The particle motion is parallel to the direction of propagation (longitudinal). The S-wave (secondary wave, or shear wave) is solenoidal: \(\nabla \cdot \mathbf{u}_S = 0\). The particle motion is perpendicular to the propagation direction (transverse). Since \(\lambda + 2\mu > \mu\) for all positive elastic moduli, we always have \(\alpha > \beta\): P-waves travel faster than S-waves. In the Earth's crust, \(\alpha \approx 6\) km/s and \(\beta \approx 3.5\) km/s. The ratio \(\alpha/\beta = \sqrt{2(1-\nu)/(1-2\nu)}\), where \(\nu\) is Poisson's ratio, equals \(\sqrt{3} \approx 1.73\) for a Poisson solid (\(\nu = 0.25\), \(\lambda = \mu\)).

<div class="remark">
<strong>Remark 1.6.</strong> In the Earth's fluid outer core, the shear modulus vanishes (\(\mu = 0\)), so \(\beta = 0\) and only P-waves propagate. S-waves cannot penetrate the outer core. This fundamental observation, made by Oldham in 1906 and refined by Gutenberg in 1914, provided the first evidence that the Earth's core has a fluid layer. It also creates a prominent <em>shadow zone</em> between about 104 and 140 degrees epicentral distance for direct P-waves.
</div>

The P- and S-wave velocities in the Earth vary by roughly a factor of two from the crust to the inner core: \(\alpha\) ranges from about 5.8 km/s in the upper crust to 13.7 km/s at the base of the mantle and 11.0 km/s in the inner core, while \(\beta\) ranges from 3.2 km/s to 7.3 km/s in the mantle. The velocity ratio \(\alpha/\beta\) is sensitive to rock composition and state: it is approximately 1.73 for most crustal rocks, but increases significantly in the presence of fluids or partial melt (since fluids reduce \(\mu\) without strongly affecting \(\lambda + 2\mu\)). Monitoring temporal changes in \(\alpha/\beta\) is therefore a tool for detecting fluid migration in volcanic and geothermal systems.

### 1.3 Plane Waves, Phase Velocity, and Energy Flux

We now examine the simplest solutions of the elastic wave equations: plane waves. These are the building blocks from which more complex wavefield solutions are constructed via superposition.

<div class="definition">
<strong>Definition 1.7 (Plane Wave).</strong> A <em>plane wave</em> is a solution of the form

\[
\mathbf{u}(\mathbf{x}, t) = \mathbf{A}\, f(\mathbf{k} \cdot \mathbf{x} - \omega t),
\]
where \(\mathbf{A}\) is the polarization vector (constant amplitude and direction), \(\mathbf{k}\) is the wave vector, \(\omega\) is the angular frequency, and \(f\) is an arbitrary twice-differentiable function. The <em>phase velocity</em> is \(c = \omega / |\mathbf{k}|\), and the surfaces of constant phase are planes perpendicular to \(\mathbf{k}\).
</div>

Substituting a monochromatic plane wave \(\mathbf{u} = \mathbf{A}\, e^{i(\mathbf{k}\cdot\mathbf{x} - \omega t)}\) into the Navier equation leads to the Christoffel equation for the polarization.

<div class="theorem">
<strong>Theorem 1.8 (Christoffel Equation).</strong> In a homogeneous isotropic medium, the Christoffel equation is

\[
\left[(\lambda + \mu)\, k_i k_j + \mu\, |\mathbf{k}|^2\, \delta_{ij} - \rho\omega^2\, \delta_{ij}\right] A_j = 0.
\]
This has two families of solutions: (i) \(\mathbf{A} \parallel \mathbf{k}\) with \(\omega^2 = \alpha^2 |\mathbf{k}|^2\) (P-wave), and (ii) \(\mathbf{A} \perp \mathbf{k}\) with \(\omega^2 = \beta^2 |\mathbf{k}|^2\) (S-wave, with two independent polarizations).
</div>

The energy carried by elastic waves is characterized by the elastic energy density and the energy flux vector.

<div class="definition">
<strong>Definition 1.9 (Energy Density and Flux).</strong> The <em>total energy density</em> (kinetic plus potential) of the elastic wavefield is

\[
E = \frac{1}{2}\rho\, |\dot{\mathbf{u}}|^2 + \frac{1}{2}\sigma_{ij}\, \epsilon_{ij}.
\]
The <em>energy flux vector</em> (seismic intensity) is

\[
\mathcal{F}_i = -\sigma_{ij}\, \dot{u}_j.
\]
These satisfy the energy conservation equation \(\partial_t E + \nabla \cdot \boldsymbol{\mathcal{F}} = \mathbf{f} \cdot \dot{\mathbf{u}}\).
</div>

For a plane P-wave \(\mathbf{u} = A\, \hat{\mathbf{k}}\, \cos(\mathbf{k}\cdot\mathbf{x} - \omega t)\), the time-averaged energy flux is \(\langle \boldsymbol{\mathcal{F}} \rangle = \frac{1}{2}\rho \alpha \omega^2 A^2\, \hat{\mathbf{k}}\). The quantity \(Z_P = \rho\alpha\) is the <em>acoustic impedance</em> for P-waves, and similarly \(Z_S = \rho\beta\) for S-waves. Impedance contrasts at interfaces control the amplitude of reflected and transmitted waves, a point of central importance in exploration seismology.

<div class="example">
<strong>Example 1.10 (Equipartition of Energy).</strong> For a monochromatic P-wave \(\mathbf{u} = A\,\hat{\mathbf{k}}\,\cos(\mathbf{k}\cdot\mathbf{x} - \omega t)\), the time-averaged kinetic energy density is \(\langle E_K \rangle = \frac{1}{4}\rho\omega^2 A^2\) and the time-averaged potential energy density is \(\langle E_P \rangle = \frac{1}{4}\rho\omega^2 A^2\), so they are equal. This equipartition of energy between kinetic and potential forms holds for all monochromatic elastic waves in lossless media and is a consequence of the virial theorem. The total time-averaged energy density is \(\langle E \rangle = \frac{1}{2}\rho\omega^2 A^2\), and the energy velocity \(c_E = |\langle \boldsymbol{\mathcal{F}} \rangle| / \langle E \rangle = \alpha\) equals the phase velocity. In dispersive media (such as layered structures), the energy velocity equals the group velocity rather than the phase velocity.
</div>

### 1.4 Reflection and Transmission at a Planar Interface

When an elastic wave encounters an interface between two media with different elastic properties, part of the energy is reflected and part is transmitted. Unlike acoustic waves in fluids, elastic waves can undergo mode conversion: an incident P-wave can generate both reflected and transmitted P- and S-waves. This phenomenon, first studied systematically by Knott (1899) and Zoeppritz (1919), is fundamental to seismic exploration.

<div class="definition">
<strong>Definition 1.10 (Welded Interface Conditions).</strong> At an interface between two elastic solids, the <em>welded contact conditions</em> require continuity of (i) the displacement \(\mathbf{u}\) and (ii) the traction \(\sigma_{ij} n_j\) across the interface, where \(\mathbf{n}\) is the interface normal.
</div>

Consider a planar interface at \(z = 0\) separating medium 1 (above, with parameters \(\rho_1, \alpha_1, \beta_1\)) from medium 2 (below, with \(\rho_2, \alpha_2, \beta_2\)). An incident P-wave in medium 1 with incidence angle \(\theta_1\) generates reflected P and SV waves and transmitted P and SV waves, with angles determined by Snell's law.

<div class="theorem">
<strong>Theorem 1.11 (Snell's Law for Elastic Media).</strong> At a planar interface, all wave types share the same horizontal slowness (ray parameter):

\[
p = \frac{\sin\theta_1}{\alpha_1} = \frac{\sin\theta_1'}{\alpha_1} = \frac{\sin\phi_1}{\beta_1} = \frac{\sin\theta_2}{\alpha_2} = \frac{\sin\phi_2}{\beta_2},
\]
where \(\theta_1, \theta_1'\) are the incident and reflected P-wave angles, \(\phi_1, \phi_2\) are the reflected and transmitted S-wave angles, and \(\theta_2\) is the transmitted P-wave angle.
</div>

<div class="proof">
<strong>Proof.</strong> The incident P-wave is \(\mathbf{u}_{\mathrm{inc}} = A_0\, \hat{\mathbf{k}}\, \exp[i(k_x x + k_z z - \omega t)]\) with \(k_x = \omega \sin\theta_1 / \alpha_1\) and \(k_z = \omega \cos\theta_1 / \alpha_1\). The boundary conditions at \(z=0\) must hold for all \(x\) and all \(t\), which requires all wave types to have the same \(k_x\) and the same \(\omega\). Since \(k_x = \omega/c \cdot \sin\theta\) for each wave type traveling with velocity \(c\), we obtain the stated equality of \(\sin\theta / c\) for all waves. Defining the ray parameter \(p = k_x / \omega\) gives the result. \(\square\)
</div>

The amplitudes of the reflected and transmitted waves are determined by a system of four linear equations (the Zoeppritz equations) arising from the four boundary conditions (continuity of \(u_x, u_z, \sigma_{xz}, \sigma_{zz}\)).

<div class="example">
<strong>Example 1.12 (Normal Incidence Reflection Coefficient).</strong> For a P-wave at normal incidence (\(\theta_1 = 0\)), there is no mode conversion and the reflection coefficient simplifies to

\[
R = \frac{Z_2 - Z_1}{Z_2 + Z_1}, \qquad T = \frac{2Z_1}{Z_2 + Z_1},
\]
where \(Z_k = \rho_k \alpha_k\) is the P-wave impedance of medium \(k\). Note that \(|R|^2 + (Z_2/Z_1)|T|^2 = 1\) (energy conservation). At the Mohorovicic discontinuity (crust-mantle boundary), the impedance contrast produces \(|R| \approx 0.1\), so about 1% of the energy is reflected.
</div>

When \(p > 1/\alpha_2\) (equivalently \(\sin\theta_1 > \alpha_1/\alpha_2\)), the transmitted P-wave angle becomes imaginary and the transmitted wave becomes evanescent: this is total internal reflection for P-waves, and the corresponding angle is the critical angle \(\theta_c = \sin^{-1}(\alpha_1/\alpha_2)\). Head waves (refracted waves) travel along the interface at the velocity of the faster medium and are observed as first arrivals at intermediate distances in refraction seismology.

---

## Chapter 2: Layered Media and Surface Waves

### 2.1 SH Waves in Layered Half-Spaces

The Earth's crust and upper mantle are well approximated as a stack of homogeneous layers, each with distinct elastic properties. Seismic waves propagating in such layered structures exhibit phenomena not present in homogeneous media: dispersion, waveguide effects, and surface waves. We begin with the simplest case, SH (horizontally polarized shear) waves, which decouple completely from the P-SV system in a horizontally layered medium.

<div class="definition">
<strong>Definition 2.1 (SH Wave).</strong> An <em>SH wave</em> is a shear wave in which the displacement is purely horizontal and perpendicular to the plane of propagation. If the wave propagates in the \(x\)-\(z\) plane, then \(\mathbf{u} = (0, u_y(x, z, t), 0)\). The governing equation in a homogeneous layer is

\[
\rho\, \ddot{u}_y = \mu\left(\frac{\partial^2 u_y}{\partial x^2} + \frac{\partial^2 u_y}{\partial z^2}\right).
\]
</div>

In each homogeneous layer, the SH displacement for a monochromatic wave with horizontal wavenumber \(k_x = \omega p\) (where \(p\) is the ray parameter) takes the form \(u_y = [A\, e^{i\nu z} + B\, e^{-i\nu z}]\, e^{i(k_x x - \omega t)}\), where the vertical wavenumber is \(\nu = \sqrt{\omega^2/\beta^2 - k_x^2}\). The wave is propagating if \(\nu^2 > 0\) (i.e., \(p < 1/\beta\)) and evanescent if \(\nu^2 < 0\).

### 2.2 The Thomson-Haskell Transfer Matrix Method

To handle a stack of \(N\) layers, we need an efficient method for propagating the wavefield through the structure. The transfer matrix method, developed independently by Thomson (1950) and Haskell (1953), provides exactly this.

<div class="definition">
<strong>Definition 2.2 (Layer Transfer Matrix for SH Waves).</strong> In a single homogeneous layer of thickness \(h\), shear modulus \(\mu\), and vertical wavenumber \(\nu\), the displacement \(u_y\) and traction \(\tau = \mu\, \partial u_y / \partial z\) at the top (\(z = 0\)) and bottom (\(z = h\)) of the layer are related by

\[
\begin{bmatrix} u_y \\ \tau \end{bmatrix}_{z=h} = \mathbf{T}\, \begin{bmatrix} u_y \\ \tau \end{bmatrix}_{z=0}, \qquad \mathbf{T} = \begin{bmatrix} \cos(\nu h) & (\mu\nu)^{-1}\sin(\nu h) \\ -\mu\nu\sin(\nu h) & \cos(\nu h) \end{bmatrix}.
\]
Note that \(\det(\mathbf{T}) = 1\).
</div>

For a stack of \(N\) layers overlying a half-space, the total transfer matrix is the product \(\mathbf{T}_{\mathrm{total}} = \mathbf{T}_N \cdots \mathbf{T}_2\, \mathbf{T}_1\). The boundary conditions are: free surface at the top (\(\tau = 0\) at \(z=0\)) and a radiation condition in the half-space (only downgoing waves, or evanescent decay). This approach reduces the problem of matching boundary conditions at every interface to a single matrix equation, an enormous computational simplification.

<div class="remark">
<strong>Remark 2.3.</strong> The Thomson-Haskell method can become numerically unstable at high frequencies when evanescent waves are present, because the transfer matrices involve exponentially growing and decaying terms. This difficulty was resolved by Dunkin (1965) and Knopoff (1964) using the <em>delta matrix</em> method, and more elegantly by Kennett (1983) using a recursive scheme based on reflection and transmission coefficients (the <em>reflectivity method</em>).
</div>

<div class="example">
<strong>Example 2.4 (SH Resonance in a Single Layer).</strong> For a single layer of thickness \(H\), shear velocity \(\beta_1\), and rigidity \(\mu_1\), overlying a rigid half-space (\(\mu_2 \to \infty\)), the displacement at the free surface for a vertically incident SH wave resonates when the layer thickness equals an odd multiple of quarter-wavelengths: \(H = (2n+1)\beta_1 / (4f)\), \(n = 0, 1, 2, \ldots\). The fundamental resonance frequency is \(f_0 = \beta_1/(4H)\). For a typical sedimentary basin with \(\beta_1 = 0.5\) km/s and \(H = 0.5\) km, the fundamental resonance is at \(f_0 = 0.25\) Hz (period 4 s), which falls within the band of strong ground motion relevant to tall buildings. This resonance effect is responsible for much of the site amplification observed during destructive earthquakes and is the physical basis of the \(H/V\) spectral ratio method (Nakamura, 1989) widely used in microzonation studies.
</div>

### 2.3 Love Waves and Their Dispersion Relation

Love waves, discovered theoretically by A.E.H. Love in 1911, are surface waves consisting of horizontally polarized shear motion that are trapped in a low-velocity layer overlying a higher-velocity half-space. They are among the most prominent arrivals on seismograms of shallow earthquakes.

<div class="theorem">
<strong>Theorem 2.4 (Love Wave Dispersion Relation).</strong> Consider a single layer of thickness \(H\), shear velocity \(\beta_1\), and density \(\rho_1\), overlying a half-space with shear velocity \(\beta_2 > \beta_1\) and density \(\rho_2\). Love waves exist for phase velocities \(c\) satisfying \(\beta_1 < c < \beta_2\), and the dispersion relation is

\[
\tan\left(\omega H \sqrt{\frac{1}{\beta_1^2} - \frac{1}{c^2}}\right) = \frac{\mu_2 \sqrt{\frac{1}{c^2} - \frac{1}{\beta_2^2}}}{\mu_1 \sqrt{\frac{1}{\beta_1^2} - \frac{1}{c^2}}},
\]
where \(\mu_k = \rho_k \beta_k^2\). This transcendental equation has infinitely many solutions (modes), indexed by the overtone number \(n = 0, 1, 2, \ldots\).
</div>

<div class="proof">
<strong>Proof.</strong> In the layer (\(0 \le z \le H\)), the SH displacement has the form \(u_y = [A\cos(\nu_1 z) + B\sin(\nu_1 z)]\, e^{i(kx - \omega t)}\), where \(\nu_1 = \omega\sqrt{1/\beta_1^2 - 1/c^2}\) is real. In the half-space (\(z > H\)), the radiation condition requires exponential decay: \(u_y = C\, e^{-\hat{\nu}_2(z - H)}\, e^{i(kx - \omega t)}\), where \(\hat{\nu}_2 = \omega\sqrt{1/c^2 - 1/\beta_2^2}\) is real and positive. The free-surface condition \(\tau = 0\) at \(z = 0\) gives \(B = 0\). Continuity of \(u_y\) and \(\tau\) at \(z = H\) yields

\[
A\cos(\nu_1 H) = C, \qquad -\mu_1 \nu_1 A\sin(\nu_1 H) = -\mu_2 \hat{\nu}_2 C.
\]
Dividing the second equation by the first eliminates \(A\) and \(C\), yielding \(\mu_1 \nu_1 \tan(\nu_1 H) = \mu_2 \hat{\nu}_2\), which is the stated dispersion relation. \(\square\)
</div>

The dispersion of Love waves is a consequence of the waveguide geometry: longer-period waves penetrate deeper into the half-space and sample the faster material, so they travel faster. This normal dispersion is characteristic of continental crustal structures and is routinely observed on broadband seismograms.

<div class="example">
<strong>Example 2.5 (Fundamental Mode Love Wave).</strong> For the fundamental mode (\(n = 0\)) at low frequencies (\(\omega \to 0\)), the phase velocity approaches \(\beta_2\) (the wave extends deeply into the half-space). At high frequencies (\(\omega \to \infty\)), the phase velocity approaches \(\beta_1\) (the wave is confined to the layer). The cutoff frequency for the \(n\)-th higher mode is \(\omega_n = n\pi\beta_1\beta_2 / [H\sqrt{\beta_2^2 - \beta_1^2}]\).
</div>

<div class="remark">
<strong>Remark 2.6.</strong> Love's 1911 discovery was motivated by the observation that seismograms of distant earthquakes contain large-amplitude transverse waves that arrive after the S-wave but before the Rayleigh wave. These waves could not be explained by Rayleigh's earlier theory for a homogeneous half-space. Love showed that the layered structure of the crust acts as a waveguide for SH energy, trapping it near the surface. The requirement \(\beta_1 < \beta_2\) (layer slower than substrate) is essential: if the surface layer is faster, no guided modes exist and all SH energy leaks into the half-space. This structural condition is nearly universally satisfied in the Earth, where unconsolidated sediments and weathered rock overlie faster crystalline basement.
</div>

<div class="example">
<strong>Example 2.7 (Numerical Dispersion Curve Computation).</strong> Consider a crustal model with a layer of thickness \(H = 35\) km, \(\beta_1 = 3.5\) km/s, \(\rho_1 = 2700\) kg/m\(^3\), overlying a half-space with \(\beta_2 = 4.5\) km/s, \(\rho_2 = 3300\) kg/m\(^3\). The fundamental-mode Love wave dispersion relation becomes

\[
\tan\left(\omega \cdot 35 \sqrt{\frac{1}{3.5^2} - \frac{1}{c^2}}\right) = \frac{3300 \cdot 4.5^2 \sqrt{\frac{1}{c^2} - \frac{1}{4.5^2}}}{2700 \cdot 3.5^2 \sqrt{\frac{1}{3.5^2} - \frac{1}{c^2}}}.
\]
At a period of 20 s (\(\omega = 2\pi/20\) rad/s), solving numerically gives \(c \approx 3.87\) km/s. At 100 s, \(c \approx 4.35\) km/s. The group velocity, computed from \(U = c^2 / (c - \omega\, dc/d\omega)\), reaches a minimum (the Airy phase) near 15--20 s for this model, producing a characteristic amplitude build-up on seismograms that is easily identified.
</div>

### 2.4 Rayleigh Waves and the Secular Equation

Rayleigh waves, predicted theoretically by Lord Rayleigh in 1885, are the most prominent surface waves on seismograms. Unlike Love waves, they involve coupled P-SV motion and exist even in a homogeneous half-space.

<div class="theorem">
<strong>Theorem 2.6 (Rayleigh's Secular Equation).</strong> In a homogeneous, isotropic elastic half-space with P-wave velocity \(\alpha\) and S-wave velocity \(\beta\), a Rayleigh surface wave exists with phase velocity \(c_R\) determined by the secular equation

\[
\left(2 - \frac{c_R^2}{\beta^2}\right)^2 = 4\sqrt{1 - \frac{c_R^2}{\alpha^2}}\,\sqrt{1 - \frac{c_R^2}{\beta^2}}.
\]
This equation always has exactly one real root satisfying \(0 < c_R < \beta\).
</div>

<div class="proof">
<strong>Proof.</strong> We seek solutions of the form \(\mathbf{u} = \mathbf{U}(z)\, e^{i(kx - \omega t)}\) that decay as \(z \to \infty\). The P-wave potential \(\phi = A\, e^{-k r_\alpha z}\, e^{i(kx-\omega t)}\) with \(r_\alpha = \sqrt{1 - c^2/\alpha^2}\) and the SV-wave potential \(\psi = B\, e^{-k r_\beta z}\, e^{i(kx-\omega t)}\) with \(r_\beta = \sqrt{1 - c^2/\beta^2}\) are both evanescent provided \(c < \beta < \alpha\). The free-surface conditions \(\sigma_{zz} = \sigma_{xz} = 0\) at \(z = 0\) yield the system

\[
\begin{bmatrix} \lambda k^2 + (\lambda + 2\mu)k^2 r_\alpha^2 & 2i\mu k^2 r_\beta \\ -2ik^2 r_\alpha & k^2(1 + r_\beta^2) \end{bmatrix} \begin{bmatrix} A \\ B \end{bmatrix} = 0.
\]
Setting the determinant to zero and simplifying using \(\lambda + 2\mu = \rho\alpha^2\) and \(\mu = \rho\beta^2\) gives the Rayleigh secular equation. The existence and uniqueness of a root was proven rigorously by Rayleigh; an elegant proof using the argument principle was given by Barnett and Lothe (1985). For a Poisson solid, \(c_R \approx 0.9194\beta\). \(\square\)
</div>

<div class="example">
<strong>Example 2.9 (Rayleigh Velocity for Typical Earth Materials).</strong> The Rayleigh secular equation can be reduced by substituting \(\eta = c_R^2/\beta^2\) and \(\gamma = \beta^2/\alpha^2\). Squaring both sides and rearranging yields a cubic in \(\eta\):

\[
\eta^3 - 8\eta^2 + (24 - 16\gamma)\eta - 16(1-\gamma) = 0.
\]
For a Poisson solid (\(\gamma = 1/3\)), this becomes \(\eta^3 - 8\eta^2 + \frac{56}{3}\eta - \frac{32}{3} = 0\), with the physically admissible root \(\eta \approx 0.8453\), giving \(c_R \approx 0.9194\beta\). In the Earth's upper crust with \(\beta \approx 3.5\) km/s, the Rayleigh wave velocity is approximately 3.2 km/s. For granite with \(\nu = 0.25\), \(c_R/\beta \approx 0.9194\); for sandstone with \(\nu = 0.20\), \(c_R/\beta \approx 0.9112\). The ratio is remarkably insensitive to Poisson's ratio, varying by less than 5% over the entire physically admissible range \(0 \le \nu \le 0.5\).
</div>

Rayleigh waves have retrograde elliptical particle motion at the surface, transitioning to prograde at a depth of about \(0.2\) wavelengths. Their amplitude decays exponentially with depth, with most energy confined within one wavelength of the surface. Because they spread geometrically only in two dimensions (along the surface) rather than three, they decay as \(r^{-1/2}\) rather than \(r^{-1}\) for body waves, making them the dominant arrivals at large epicentral distances for shallow earthquakes.

<div class="remark">
<strong>Remark 2.11.</strong> Rayleigh's 1885 paper is one of the great classics of mathematical physics. Lord Rayleigh was motivated by the problem of explaining why the ground motion from distant earthquakes was dominated by waves with periods of 15--25 seconds, much longer than the body-wave arrivals. His analysis showed that a homogeneous elastic half-space supports a surface wave whose velocity is slightly less than the shear velocity, providing an elegant explanation for both the observed dominant period (related to crustal thickness) and the slow decay of amplitude with distance. Lamb (1904) subsequently worked out the complete response of a half-space to a surface point force (Lamb's problem), finding that the Rayleigh wave carries approximately 67% of the total radiated energy for a vertical force on a Poisson solid. The remaining energy is split between P-waves (7%) and S-waves (26%). This energy partition explains the overwhelming dominance of Rayleigh waves on seismograms of shallow earthquakes and surface explosions.
</div>

### 2.5 Surface Wave Dispersion and Group Velocity

In a layered medium, both Love and Rayleigh waves become dispersive: the phase velocity depends on frequency. This dispersion is one of the most powerful tools for determining Earth structure, as different frequencies sample different depth ranges.

<div class="definition">
<strong>Definition 2.7 (Group Velocity).</strong> For a dispersive wave with phase velocity \(c(\omega)\), the <em>group velocity</em> is

\[
U = \frac{d\omega}{dk} = c + k\frac{dc}{dk} = c\left(1 - \frac{\omega}{c}\frac{dc}{d\omega}\right)^{-1}.
\]
A wave packet (superposition of nearby frequencies) travels at the group velocity, which determines the arrival time of energy at a given frequency.
</div>

<div class="remark">
<strong>Remark 2.10.</strong> The distinction between phase and group velocity is essential for interpreting surface wave seismograms. A dispersive surface wave train does not arrive as a sharp pulse but as a gradually evolving oscillation: long-period components arrive first (higher group velocity in a normal-dispersion regime), followed by progressively shorter periods. The time at which a given period arrives determines the group velocity, while the rate of phase advance at a given instant determines the phase velocity. Measuring group velocity requires only a single station (through the envelope of a filtered seismogram), while phase velocity measurement generally requires either a two-station method or array analysis. The multiple-filter technique, introduced by Dziewonski, Bloch, and Landisman (1969), applies a series of narrow-band Gaussian filters centered at different frequencies and measures the arrival time of each filtered envelope maximum, yielding the group velocity dispersion curve.
</div>

Measuring the group velocity dispersion curve \(U(\omega)\) from seismograms (using, for example, the multiple-filter technique of Dziewonski, Bloch, and Landisman, 1969) provides constraints on the shear-velocity structure of the Earth. The inversion of surface wave dispersion data to obtain velocity-depth profiles is one of the oldest and most robust techniques in observational seismology.

<div class="example">
<strong>Example 2.8 (Continental vs. Oceanic Dispersion).</strong> Continental Rayleigh waves at periods of 20-100 s show group velocities of 3.0-3.9 km/s, reflecting the thick continental crust (\(\sim 35\) km). Oceanic paths show distinctly different dispersion: group velocities are lower at short periods (thin oceanic crust, \(\sim 7\) km) and the Airy phase (minimum group velocity) occurs at shorter periods. This contrast was used by Ewing and Press (1950) to demonstrate fundamental differences in crustal structure between continents and oceans.
</div>

---

## Chapter 3: Ray Theory and the Eikonal Equation

### 3.1 The High-Frequency Approximation

Seismic waves in the Earth propagate through a medium whose properties vary continuously with position. When the wavelength is short compared to the scale of heterogeneity, the wavefield can be described by ray theory: waves propagate along ray paths that are governed by local velocities. This is the seismological analogue of geometrical optics and was the primary tool for determining Earth structure throughout the 20th century.

We seek an asymptotic solution of the elastic wave equation valid in the high-frequency limit. Consider a scalar wave equation \(\nabla^2 u = c(\mathbf{x})^{-2}\, \ddot{u}\) in a medium with spatially varying velocity \(c(\mathbf{x})\). We make the ray ansatz.

<div class="definition">
<strong>Definition 3.1 (Ray Ansatz).</strong> The <em>ray-theory ansatz</em> is the asymptotic expansion

\[
u(\mathbf{x}, t) = A(\mathbf{x})\, e^{i\omega[T(\mathbf{x}) - t]}\left[1 + \frac{a_1(\mathbf{x})}{i\omega} + \frac{a_2(\mathbf{x})}{(i\omega)^2} + \cdots\right],
\]
where \(T(\mathbf{x})\) is the <em>travel time</em> (phase function), \(A(\mathbf{x})\) is the <em>amplitude</em>, and the higher-order terms are corrections that become negligible at high frequency.
</div>

Substituting this ansatz into the wave equation and collecting powers of \(\omega\) yields a hierarchy of equations. The leading order gives the eikonal equation; the next order gives the transport equation.

### 3.2 The Eikonal and Transport Equations

<div class="theorem">
<strong>Theorem 3.2 (Eikonal Equation).</strong> At leading order in \(\omega\), the travel-time function \(T(\mathbf{x})\) satisfies the <em>eikonal equation</em>:

\[
|\nabla T|^2 = \frac{1}{c(\mathbf{x})^2}.
\]
This is a first-order nonlinear PDE of Hamilton-Jacobi type. The surfaces \(T(\mathbf{x}) = \text{const}\) are wavefronts, and the rays are curves perpendicular to the wavefronts.
</div>

<div class="theorem">
<strong>Theorem 3.3 (Transport Equation).</strong> At the next order, the amplitude \(A(\mathbf{x})\) satisfies the <em>transport equation</em>:

\[
2\nabla T \cdot \nabla A + A\, \nabla^2 T = 0,
\]
equivalently written as \(\nabla \cdot (A^2 \nabla T) = 0\). This expresses conservation of energy flux along ray tubes.
</div>

The eikonal equation can be solved by the method of characteristics, which yields the ray equations. Let \(\mathbf{x}(s)\) be a ray parameterized by arc length \(s\). Defining the slowness vector \(\mathbf{p} = \nabla T\) (with \(|\mathbf{p}| = 1/c\)), the characteristics of the eikonal equation are the Hamiltonian system.

<div class="theorem">
<strong>Theorem 3.4 (Ray Equations).</strong> The ray paths are solutions of

\[
\frac{d\mathbf{x}}{ds} = c\, \mathbf{p}, \qquad \frac{d\mathbf{p}}{ds} = -\frac{1}{c^2}\nabla c = \nabla\left(\frac{1}{c}\right),
\]
where \(s\) is arc length. Equivalently, parameterized by travel time \(T\),

\[
\frac{d\mathbf{x}}{dT} = c^2\, \mathbf{p}, \qquad \frac{d\mathbf{p}}{dT} = \frac{1}{c}\nabla c.
\]
</div>

These are the fundamental equations of seismic ray tracing. They show that rays bend toward regions of lower velocity (Fermat's principle), which has profound consequences for wave propagation in the Earth, where velocity generally increases with depth.

<div class="remark">
<strong>Remark 3.5.</strong> The ray equations are a Hamiltonian system. Defining the Hamiltonian \(H(\mathbf{x}, \mathbf{p}) = \frac{1}{2}[c(\mathbf{x})^2 |\mathbf{p}|^2 - 1]\), the ray equations take the canonical form \(\dot{\mathbf{x}} = \partial H / \partial \mathbf{p}\), \(\dot{\mathbf{p}} = -\partial H / \partial \mathbf{x}\). The constraint \(H = 0\) recovers the eikonal equation \(|\mathbf{p}| = 1/c\). This Hamiltonian structure implies that the ray equations preserve phase-space volume (Liouville's theorem) and that Fermat's principle is the analogue of Hamilton's principle in classical mechanics. The correspondence between ray theory and wave mechanics is precise: Fermat's principle for rays is to the eikonal equation as Hamilton's principle for particles is to the Hamilton-Jacobi equation. This analogy, noted by Hamilton himself in the 1830s, was one of the inspirations for Schrodinger's development of wave mechanics in 1926.
</div>

The transport equation (Theorem 3.3) determines how amplitudes vary along rays. Its solution can be expressed in terms of the geometric spreading factor, which measures how a narrow tube of rays expands or contracts as it propagates.

<div class="definition">
<strong>Definition 3.6 (Geometric Spreading).</strong> The <em>geometric spreading factor</em> \(J\) is defined as the cross-sectional area of an infinitesimal ray tube divided by a reference area. The amplitude along a ray is

\[
A(\mathbf{x}) = A_0 \sqrt{\frac{\rho_0\, c_0}{\rho(\mathbf{x})\, c(\mathbf{x})}}\, \frac{1}{\sqrt{J(\mathbf{x})}},
\]
where subscript 0 denotes values at the reference point. For a point source in a homogeneous medium, \(J \propto r^2\) in 3D (amplitude decays as \(1/r\)) and \(J \propto r\) in 2D (amplitude decays as \(1/\sqrt{r}\)). At a caustic, \(J = 0\) and the ray-theoretical amplitude diverges, signaling the breakdown of the approximation.
</div>

### 3.3 Snell's Law and the Ray Parameter in Spherical Geometry

In a spherically symmetric Earth model where velocity depends only on radius, \(c = c(r)\), the ray equations possess a conserved quantity that enormously simplifies the problem.

<div class="theorem">
<strong>Theorem 3.5 (Benndorf's Ray Parameter).</strong> In a spherically symmetric medium with velocity \(c(r)\), the quantity

\[
p = \frac{r \sin i}{c(r)}
\]
is constant along any ray, where \(i\) is the angle between the ray and the radial direction. This is the <em>ray parameter</em> (horizontal slowness in flat geometry). It is the spherical analogue of Snell's law.
</div>

<div class="proof">
<strong>Proof.</strong> In spherical coordinates, the eikonal equation for a radially symmetric medium is \((\partial T/\partial r)^2 + r^{-2}(\partial T/\partial \Delta)^2 = 1/c(r)^2\), where \(\Delta\) is the angular distance. Since \(T\) does not depend explicitly on \(\Delta\), the conjugate momentum \(p = r^{-1} \partial T/\partial\Delta = r\sin i / c(r)\) is conserved along rays by Hamilton's equations. This is a consequence of the rotational symmetry of the problem, analogous to conservation of angular momentum. \(\square\)
</div>

<div class="example">
<strong>Example 3.8 (Ray Parameter Values for Major Seismic Phases).</strong> The ray parameter takes characteristic values for the major seismic phases observed on global seismograms. For a direct P-wave at an epicentral distance of 30 degrees in the IASP91 model, \(p \approx 8.6\) s/deg. At 90 degrees, \(p \approx 4.4\) s/deg. The P-wave bottoming at the core-mantle boundary (distance \(\approx 98^\circ\)) has \(p \approx 4.44\) s/deg, while the PKP phase refracted through the outer core has much smaller \(p\) values (\(\approx 1.1\)--\(2.0\) s/deg) because the low velocity in the fluid core (\(\alpha \approx 8\)--10 km/s) requires the ray to become nearly radial. The PP phase (surface-reflected P) and the Pdiff phase (P diffracted along the core-mantle boundary) have \(p \approx 4.44\) s/deg, the critical slowness at the CMB. Converting to flat-Earth units: \(p = 8.6\) s/deg \(\approx 0.078\) s/km, consistent with \(p = \sin i / \alpha\) for a P-wave with take-off angle \(i \approx 29^\circ\) at the surface where \(\alpha \approx 5.8\) km/s.
</div>

The ray parameter \(p\) has dimensions of time per unit distance (s/rad for the spherical case, s/km for the flat case). It completely specifies the geometry of a ray in a spherically symmetric Earth. A ray with a given \(p\) descends to a turning point at radius \(r_t\) where \(\sin i = 1\) (the ray becomes horizontal), so \(r_t / c(r_t) = p\).

### 3.4 Travel Time Curves and the Wiechert-Herglotz Inversion

The travel time \(T(\Delta)\) as a function of epicentral distance \(\Delta\) for a given phase (P, S, etc.) is one of the most fundamental observables in seismology. The relationship between travel-time curves and Earth structure was first elucidated by Wiechert and his student Herglotz in 1910, providing one of the earliest successful inversions of geophysical data.

<div class="theorem">
<strong>Theorem 3.6 (Travel Time in a Spherically Symmetric Earth).</strong> For a ray with ray parameter \(p\) in a spherically symmetric Earth, the epicentral distance and travel time are

\[
\Delta(p) = 2\int_{r_t}^{r_s} \frac{p}{r\sqrt{\eta^2(r) - p^2}}\, dr, \qquad T(p) = 2\int_{r_t}^{r_s} \frac{\eta^2(r)}{r\sqrt{\eta^2(r) - p^2}}\, dr,
\]
where \(\eta(r) = r/c(r)\) is the radial slowness, \(r_s\) is the source (surface) radius, and \(r_t\) is the turning point radius defined by \(\eta(r_t) = p\). Furthermore, \(dT/d\Delta = p\): the slope of the travel-time curve equals the ray parameter.
</div>

The relation \(dT/d\Delta = p\) is extremely important: it means that the ray parameter can be measured directly from the slope of the travel-time curve, without any knowledge of the velocity structure. This is the basis for the Wiechert-Herglotz inversion.

<div class="theorem">
<strong>Theorem 3.7 (Wiechert-Herglotz Inversion).</strong> If the velocity \(c(r)\) increases monotonically with depth (so that \(\eta(r) = r/c(r)\) is strictly monotonically decreasing), then the velocity profile can be uniquely recovered from the travel-time curve by

\[
\ln\frac{r_s}{r_t(p)} = \frac{1}{\pi}\int_0^{\Delta(p)} \cosh^{-1}\left(\frac{p_0}{p}\right)\, d\Delta',
\]
where \(p_0 = dT/d\Delta'|_{\Delta'}\) is the ray parameter for distance \(\Delta'\). This is an Abel-type integral inversion.
</div>

This remarkable formula was used by Gutenberg and others to construct the first detailed models of the Earth's velocity structure, revealing the crust, mantle, outer core, and inner core. The condition that \(\eta(r)\) be monotonically decreasing fails when there is a low-velocity zone, leading to complications (triplications, shadow zones) that we discuss next.

### 3.5 Shadow Zones and Caustics

<div class="definition">
<strong>Definition 3.8 (Shadow Zone and Caustic).</strong> A <em>shadow zone</em> is a region of space that receives no rays from a given source, typically caused by a rapid decrease in velocity (such as the core-mantle boundary). A <em>caustic</em> is an envelope of rays where the ray density becomes infinite and the amplitude predicted by ray theory diverges. At a caustic, the transport equation breaks down and more sophisticated asymptotic methods (Airy functions, uniform asymptotics) are required.
</div>

The most famous shadow zone in seismology is the P-wave shadow between approximately 104 and 140 degrees epicentral distance, caused by refraction into the low-velocity fluid outer core. Waves that enter the core are refracted downward (toward lower velocities), creating a gap in the direct P-wave field. Diffractions around the core-mantle boundary partially illuminate this shadow zone with greatly reduced amplitude.

<div class="example">
<strong>Example 3.9 (Caustics and Triplications).</strong> When the velocity increases abruptly at a discontinuity (such as the 410-km or 660-km discontinuity in the mantle), the travel-time curve develops a backward branch (triplication). Three rays arrive at the same distance, and the envelope of these rays forms a caustic. The amplitude at the caustic is proportional to \(\omega^{1/6}\) (rather than the \(\omega^0\) of geometric ray theory), as described by the Airy function solution of the wave equation near a simple caustic. This was analyzed in the seismological context by Chapman (1978) and Richards (1973).
</div>

<div class="remark">
<strong>Remark 3.10.</strong> The Wiechert-Herglotz inversion (Theorem 3.7) was a landmark achievement in the history of geophysics. Emil Wiechert, working in Gottingen with his student Gustav Herglotz, recognized that the Abel integral equation relating travel time to velocity structure could be inverted in closed form. Herglotz provided the mathematical solution in 1907, drawing on techniques from potential theory. Their method was subsequently applied by Beno Gutenberg to determine the radius of the Earth's core (1914) and by Inge Lehmann to discover the inner core (1936). The Wiechert-Herglotz formula remains the conceptual foundation of all velocity-depth inversions, even though modern methods use more sophisticated parameterizations and inversion algorithms. Its requirement of a monotonically increasing velocity is violated in the low-velocity zone of the upper mantle, where partial melting reduces shear velocity, necessitating modifications due to Slichter (1932).
</div>

<div class="example">
<strong>Example 3.11 (Ray Tracing in a Linear Velocity Gradient).</strong> Consider a medium with velocity \(c(z) = c_0 + gz\), where \(g\) is the constant velocity gradient (a good approximation for the upper crust). The ray equations can be solved analytically. A ray launched at angle \(i_0\) from the surface follows a circular arc with radius \(R = c_0 / (g\sin i_0)\) and center at depth \(z_c = -c_0/g\). The turning depth is \(z_t = (c_0/g)(\sec i_0 - 1)\), and the travel time for a ray reaching horizontal distance \(x\) is

\[
T(x) = \frac{1}{g}\ln\left(\frac{gx/c_0 + \sqrt{1 + (gx/c_0)^2}}{1}\right) = \frac{1}{g}\,\text{arcsinh}\left(\frac{gx}{c_0}\right).
\]
For a typical crustal gradient \(g = 0.006\) s\(^{-1}\) and \(c_0 = 5.0\) km/s, a ray bottoming at 10 km depth is launched at \(i_0 = \cos^{-1}(c_0/(c_0+g\cdot 10)) \approx 83.2^\circ\) from vertical and travels a horizontal distance of approximately 116 km.
</div>

---

## Chapter 4: Normal Modes of the Earth

### 4.1 Free Oscillations of a Spherical Body

At sufficiently low frequencies, the concept of propagating rays becomes inappropriate, and the natural description of the seismic wavefield is in terms of the normal modes (free oscillations) of the entire Earth. The existence of such oscillations was predicted theoretically in the 19th century, but they were not observed until the great Chilean earthquake of 1960, when Benioff, Press, and Smith detected spectral peaks corresponding to the gravest modes. Normal mode seismology provides the most precise constraints on the large-scale structure of the deep Earth.

<div class="definition">
<strong>Definition 4.1 (Normal Mode Problem).</strong> The free oscillations of a self-gravitating, spherically symmetric, non-rotating, elastic, isotropic (SNREI) Earth model are solutions of the form \(\mathbf{u}(\mathbf{x}, t) = \mathbf{s}(\mathbf{x})\, e^{-i\omega t}\), where the eigenfunction \(\mathbf{s}\) and eigenfrequency \(\omega\) satisfy

\[
-\omega^2 \rho\, \mathbf{s} = \nabla \cdot \boldsymbol{\sigma}(\mathbf{s}) + \nabla(\rho\, \mathbf{s} \cdot \mathbf{g}_0) - \rho\, \nabla\Phi_1 + \rho_1\, \mathbf{g}_0,
\]
where \(\boldsymbol{\sigma}\) is the stress associated with \(\mathbf{s}\), \(\mathbf{g}_0\) is the equilibrium gravitational field, \(\Phi_1\) is the perturbation in the gravitational potential, and \(\rho_1 = -\nabla \cdot (\rho\, \mathbf{s})\) is the Eulerian density perturbation. The boundary conditions are zero traction on the surface and regularity at the center.
</div>

The self-gravitation terms (involving \(\Phi_1\) and \(\rho_1\)) are essential for the gravest modes (periods longer than about 200 s) but are negligible for higher-frequency oscillations. The gravitational term modifies the restoring force and introduces buoyancy effects that are responsible for the very-long-period behavior.

### 4.2 Spheroidal and Toroidal Modes

The spherical symmetry of the Earth allows the normal modes to be classified into two independent families, analogous to the decomposition of the wavefield into P-SV and SH components in flat geometry.

<div class="theorem">
<strong>Theorem 4.2 (Mode Classification).</strong> In a spherically symmetric Earth, the normal modes decompose into two families:

(i) <em>Spheroidal modes</em> \({}_n S_l\), with displacement

\[
\mathbf{s} = U(r)\, Y_l^m(\theta, \phi)\, \hat{\mathbf{r}} + V(r)\, \nabla_1 Y_l^m(\theta, \phi),
\]
where \(U(r)\) and \(V(r)\) are radial eigenfunctions, \(Y_l^m\) are spherical harmonics, and \(\nabla_1\) is the surface gradient. These involve radial and horizontal motion (P-SV analogue) and are sensitive to compressional and shear velocity structure.

(ii) <em>Toroidal modes</em> \({}_n T_l\), with displacement

\[
\mathbf{s} = W(r)\, \hat{\mathbf{r}} \times \nabla_1 Y_l^m(\theta, \phi),
\]
where \(W(r)\) is a radial eigenfunction. These involve purely horizontal, divergence-free motion (SH analogue) and are sensitive only to shear velocity structure.

In both cases, \(n\) is the radial overtone number and \(l\) is the angular degree. The eigenfrequencies \({}_n\omega_l\) are \((2l+1)\)-fold degenerate (independent of order \(m\)).
</div>

The radial eigenfunctions satisfy coupled ordinary differential equations obtained by substituting the mode ansatz into the equation of motion. For spheroidal modes, this yields a fourth-order system in \((U, V)\) (or sixth-order including self-gravitation); for toroidal modes, a second-order equation in \(W\). These are solved numerically subject to boundary conditions at the center and surface.

<div class="example">
<strong>Example 4.3 (The Gravest Modes).</strong> The fundamental radial mode \({}_0 S_0\) is a purely radial oscillation (breathing mode) with a period of about 20.5 minutes in the Preliminary Reference Earth Model (PREM). The gravest toroidal mode \({}_0 T_2\) (torsional oscillation) has a period of about 44 minutes. The "football mode" \({}_0 S_2\), which deforms the Earth into a prolate-oblate alternation, has a period of about 54 minutes. These were among the first modes observed after the 1960 Chilean earthquake.
</div>

The toroidal modes deserve special attention because they decouple entirely from the P-SV system and are confined to the solid parts of the Earth. Since the outer core is fluid (\(\mu = 0\)), toroidal modes have identically zero displacement in the outer core. This means that toroidal modes are sensitive only to the shear structure of the mantle and inner core, making them complementary to spheroidal modes, which sample both compressional and shear structure throughout the entire Earth.

<div class="remark">
<strong>Remark 4.4.</strong> The notation \({}_n X_l\) for normal modes follows the convention introduced by Backus and Gilbert (1961): \(X\) denotes the mode type (\(S\) for spheroidal, \(T\) for toroidal), \(l\) is the angular degree (number of nodal great circles on the surface), and \(n\) is the radial overtone number (number of nodal surfaces in depth). The fundamental modes (\(n = 0\)) have the simplest depth structure and are the most strongly excited by shallow earthquakes. Higher overtones (\(n \ge 1\)) have increasingly complex radial structure and penetrate deeper into the Earth. The counting convention places \(n = 0\) as the mode with the fewest radial nodes for each \(l\), and modes are ordered by increasing frequency: \({}_0\omega_l < {}_1\omega_l < {}_2\omega_l < \cdots\) for fixed \(l\).
</div>

### 4.3 Variational Principle and the Rayleigh Quotient

The eigenfrequencies of the Earth's normal modes satisfy a variational principle that is both theoretically illuminating and computationally useful.

<div class="theorem">
<strong>Theorem 4.4 (Rayleigh's Principle for Elastic Eigenfrequencies).</strong> The squared eigenfrequency \(\omega^2\) is stationary with respect to variations \(\delta\mathbf{s}\) of the eigenfunction, and is given by the Rayleigh quotient:

\[
\omega^2 = \frac{\int_V \sigma_{ij}(\mathbf{s})\, \epsilon_{ij}(\mathbf{s})\, dV + \text{(gravitational terms)}}{\int_V \rho\, |\mathbf{s}|^2\, dV},
\]
where the numerator is the potential energy functional (elastic strain energy plus gravitational potential energy) and the denominator is the kinetic energy functional. The eigenfrequencies are the successive minima of this quotient (min-max principle).
</div>

This variational characterization provides a powerful framework for perturbation theory. If the Earth's structure is perturbed by small amounts \(\delta\rho, \delta\mu, \delta\kappa\), the resulting perturbation in eigenfrequency can be computed to first order using the unperturbed eigenfunctions, without solving the perturbed eigenvalue problem.

<div class="theorem">
<strong>Theorem 4.5 (First-Order Perturbation of Eigenfrequencies).</strong> For a small perturbation of the Earth model, the fractional change in eigenfrequency is

\[
\frac{\delta\omega}{\omega} = \frac{1}{2\omega^2}\frac{\int_0^a \left[K_\rho(r)\,\frac{\delta\rho}{\rho} + K_\mu(r)\,\frac{\delta\mu}{\mu} + K_\kappa(r)\,\frac{\delta\kappa}{\kappa}\right] r^2\, dr}{\int_0^a \rho\, [U^2 + l(l+1)V^2]\, r^2\, dr},
\]
where \(K_\rho, K_\mu, K_\kappa\) are sensitivity kernels computed from the unperturbed eigenfunctions. This formula is the basis of normal mode tomography.
</div>

<div class="example">
<strong>Example 4.6 (Sensitivity Kernels for \({}_0 S_{20}\)).</strong> The spheroidal mode \({}_0 S_{20}\) has a period of approximately 250 s and angular degree \(l = 20\), corresponding to a horizontal half-wavelength of about 1000 km on the Earth's surface. Its shear-velocity sensitivity kernel \(K_\mu(r)\) is concentrated in the upper mantle (above 670 km depth), with a peak near 200 km depth, making it an excellent probe of the asthenospheric low-velocity zone. The compressional-velocity kernel \(K_\kappa(r)\) is comparatively small. Higher overtones of the same angular degree, such as \({}_1 S_{20}\) and \({}_2 S_{20}\), have sensitivity kernels that penetrate progressively deeper into the mantle and sample the transition zone and lower mantle. By combining observations of fundamental modes and overtones over a range of angular degrees, one can construct sensitivity to structure at all depths --- the basis of the normal-mode tomography approach developed by Woodhouse and Dziewonski (1984) that produced the first three-dimensional models of mantle shear velocity.
</div>

### 4.4 Mode Coupling, Splitting, and Lateral Heterogeneity

In a perfectly spherically symmetric, non-rotating Earth, each multiplet \({}_n S_l\) or \({}_n T_l\) is \((2l+1)\)-fold degenerate. Departures from this idealization lift the degeneracy and cause the spectral lines to split.

<div class="theorem">
<strong>Theorem 4.6 (Rotational Splitting).</strong> The Earth's rotation, to first order, splits each multiplet into \(2l+1\) singlets with frequencies

\[
{}_n\omega_l^m = {}_n\omega_l + m\,\beta_{nl},
\]
where \(\beta_{nl}\) is the <em>splitting parameter</em> and \(m\) ranges from \(-l\) to \(l\). The splitting is proportional to the rotation rate \(\Omega\) of the Earth. This is the seismological analogue of the Zeeman effect in atomic physics.
</div>

Lateral heterogeneity produces more complex splitting patterns that depend on the spherical harmonic expansion of the three-dimensional structure. The measurement of mode splitting has provided some of the strongest constraints on the aspherical structure of the deep mantle and core.

<div class="remark">
<strong>Remark 4.7.</strong> The normal mode and ray-theory descriptions of the seismic wavefield are complementary rather than competing. They are related by a Poisson summation: the normal mode sum over discrete eigenfrequencies can be transformed into a sum over ray arrivals (stationary phase contributions). At low frequencies, the mode sum converges rapidly; at high frequencies, the ray sum is more efficient. The connection was made precise by Dahlen and Tromp (1998), building on earlier work by Brune (1966) and Gilbert (1971).
</div>

<div class="example">
<strong>Example 4.8 (Splitting of \({}_0 S_2\) and Mantle Structure).</strong> The fundamental spheroidal mode \({}_0 S_2\) has angular degree \(l = 2\), so it splits into \(2l+1 = 5\) singlets under the combined effects of rotation and three-dimensional structure. The observed splitting pattern encodes the degree-2 lateral variations in shear velocity and density throughout the mantle. The splitting matrix for this multiplet has the form

\[
H_{mm'} = \omega_0^2\,\delta_{mm'} + \sum_{s=0}^{2l} \sum_{t=-s}^{s} c_{st}\, \gamma_{mm'}^{st},
\]
where \(\gamma_{mm'}^{st}\) are geometric coupling coefficients (related to Wigner 3-\(j\) symbols) and \(c_{st}\) are structure coefficients that depend on the aspherical perturbations \(\delta\rho, \delta\mu, \delta\kappa\). Analysis of \({}_0 S_2\) splitting by Woodhouse and Dahlen (1978) and Masters, Jordan, Silver, and Gilbert (1982) provided the first evidence for large-scale pattern of velocity heterogeneity in the deep mantle, revealing the dominance of spherical harmonic degree 2 --- consistent with the large-scale pattern of subducted slabs and mantle upwellings.
</div>

The computation of normal mode eigenfrequencies and eigenfunctions for realistic Earth models requires numerical integration of the radial equations of motion. For spheroidal modes, these form a system of four first-order ODEs (six when self-gravitation is included), which are integrated from the center of the Earth outward using, for example, a Runge-Kutta scheme. The eigenfrequencies are found as zeros of a secular function constructed from the boundary conditions. The Mineos code (Masters, Woodhouse, and Gilbert) and OBANI codes are standard tools for this purpose.

<div class="remark">
<strong>Remark 4.9.</strong> The observation of the Earth's free oscillations after the 1960 Chilean earthquake (\(M_W\) 9.5) marked a watershed in geophysics. Hugo Benioff's strain seismometer at Isabella, California, and similar instruments worldwide detected spectral peaks that matched the theoretical predictions of Pekeris and Jarosch (1958) and Alterman, Jarosch, and Pekeris (1959) for a radially symmetric Earth model. Subsequently, the observation of mode splitting after the 1964 Alaska earthquake confirmed the effects of rotation, and later studies of the 2004 Sumatra and 2011 Tohoku earthquakes have refined our knowledge of Earth's internal structure to remarkable precision. The inverse problem of determining the radially symmetric reference Earth model from normal mode frequencies was solved by Backus and Gilbert (1967), whose theory laid the mathematical foundations for all modern geophysical inversions.
</div>

---

## Chapter 5: Earthquake Source Mechanics

### 5.1 Point Source Representation and the Moment Tensor

An earthquake is a sudden release of accumulated tectonic stress, producing seismic waves that radiate outward from the source. The mathematical representation of the source is central to seismology: it determines the amplitude, polarity, and radiation pattern of the emitted waves. The modern theory, developed by Burridge and Knopoff (1964), Maruyama (1963), and Aki (1966), represents the earthquake source as a set of equivalent body forces.

<div class="definition">
<strong>Definition 5.1 (Equivalent Body Force and Moment Tensor).</strong> An earthquake source at point \(\mathbf{x}_s\) is represented by a system of equivalent body forces with density

\[
f_i(\mathbf{x}, t) = -M_{ij}(t)\, \frac{\partial}{\partial x_j}\delta(\mathbf{x} - \mathbf{x}_s),
\]
where \(M_{ij}(t)\) is the <em>seismic moment tensor</em>, a symmetric second-order tensor whose time dependence describes the history of the source. The displacement field radiated by this source is

\[
u_i(\mathbf{x}, t) = M_{jk}(t) * G_{ij,k}(\mathbf{x}, t; \mathbf{x}_s),
\]
where \(G_{ij}\) is the elastodynamic Green's function, the comma denotes differentiation with respect to the source coordinate, and \(*\) denotes temporal convolution.
</div>

The moment tensor provides a complete description of the source mechanism for a point source. It has six independent components (being symmetric), but for a pure shear dislocation on a planar fault, it has a special structure.

### 5.2 Double-Couple Source and Radiation Patterns

The vast majority of earthquakes are caused by shear faulting, in which rock slides along a pre-existing fault plane. The equivalent body force for such a source has a characteristic form known as the double couple.

<div class="theorem">
<strong>Theorem 5.2 (Double-Couple Representation).</strong> For a shear dislocation with slip vector \(\hat{\mathbf{d}}\) on a fault plane with normal \(\hat{\mathbf{n}}\), the moment tensor is

\[
M_{ij} = M_0(t)\,(\hat{d}_i \hat{n}_j + \hat{d}_j \hat{n}_i),
\]
where \(M_0(t) = \mu A \bar{D}(t)\) is the <em>scalar seismic moment</em>, \(\mu\) is the shear modulus at the source, \(A\) is the fault area, and \(\bar{D}(t)\) is the average slip. This tensor has eigenvalues \(+M_0, 0, -M_0\), corresponding to a <em>double-couple</em> (two orthogonal force couples with zero net torque). The moment tensor is invariant under the interchange \(\hat{\mathbf{n}} \leftrightarrow \hat{\mathbf{d}}\), expressing the fundamental ambiguity between the fault plane and the auxiliary plane.
</div>

The far-field P-wave displacement from a double-couple source has a characteristic four-lobed radiation pattern.

<div class="theorem">
<strong>Theorem 5.3 (Far-Field Radiation Patterns).</strong> For a double-couple point source at the origin, the far-field displacement is:

P-wave:

\[
\mathbf{u}^P(\mathbf{x}, t) = \frac{1}{4\pi\rho\alpha^3}\frac{\dot{M}_0(t - r/\alpha)}{r}\,(\hat{\mathbf{r}} \cdot \hat{\mathbf{d}})(\hat{\mathbf{r}} \cdot \hat{\mathbf{n}})\,\hat{\mathbf{r}},
\]

S-wave:

\[
\mathbf{u}^S(\mathbf{x}, t) = \frac{1}{4\pi\rho\beta^3}\frac{\dot{M}_0(t - r/\beta)}{r}\left[(\hat{\mathbf{r}} \cdot \hat{\mathbf{d}})\hat{\mathbf{n}} + (\hat{\mathbf{r}} \cdot \hat{\mathbf{n}})\hat{\mathbf{d}} - 2(\hat{\mathbf{r}} \cdot \hat{\mathbf{d}})(\hat{\mathbf{r}} \cdot \hat{\mathbf{n}})\hat{\mathbf{r}}\right],
\]
where \(r = |\mathbf{x}|\) and \(\hat{\mathbf{r}} = \mathbf{x}/r\).
</div>

<div class="example">
<strong>Example 5.4 (Focal Mechanism).</strong> The P-wave radiation pattern for a vertical strike-slip fault (strike along \(x_1\), slip along \(x_1\), normal along \(x_2\)) has the angular dependence \(\sin 2\phi \cos^2 i_h\) where \(\phi\) is the azimuth and \(i_h\) is the take-off angle from the vertical. The pattern has four quadrants: two compressional (first motion up) and two dilatational (first motion down), separated by the fault plane and the auxiliary plane. Plotting the first-motion polarities on a lower-hemisphere stereographic projection gives the <em>focal mechanism</em> (beach ball diagram), from which the fault orientation and slip direction can be inferred. This technique, pioneered by Byerly (1926) and systematized by Sykes (1967), was instrumental in establishing the theory of plate tectonics.
</div>

<div class="remark">
<strong>Remark 5.5.</strong> The moment tensor formalism admits sources more general than pure shear faulting. Decomposing an arbitrary symmetric moment tensor into its isotropic, compensated linear vector dipole (CLVD), and double-couple components reveals the character of the source. Volcanic and geothermal earthquakes frequently have significant non-double-couple components, reflecting processes such as tensile crack opening, fluid injection, or simultaneous slip on multiple faults. The isotropic part, \(M_{ij}^{\text{iso}} = \frac{1}{3}(\text{tr}\,\mathbf{M})\,\delta_{ij}\), corresponds to a volume change (explosion or implosion) and vanishes for pure shear faulting. Detection of the isotropic component is challenging because it radiates only P-waves and its signal is often contaminated by near-source structure effects, but it has been reliably identified in nuclear explosions and some volcanic events.
</div>

The relationship between the moment tensor and the Green's function (Definition 5.1) shows that the seismogram at any station is a linear combination of the six independent moment tensor elements, weighted by the spatial derivatives of the Green's function. This linearity enables the routine determination of moment tensors from observed seismograms through linear least-squares inversion, a procedure first implemented at the global scale by Dziewonski, Chou, and Woodhouse (1981) as the Harvard Centroid Moment Tensor (CMT) project. The CMT catalog, now maintained at Columbia University's Lamont-Doherty Earth Observatory, contains solutions for every earthquake of magnitude 5 and above since 1976 and is one of the most heavily used datasets in seismology.

### 5.3 Kinematic Rupture Models and Directivity

Real earthquakes are not point sources: they rupture finite fault areas over finite time intervals. The Haskell model (1964) provides the simplest kinematic description of a finite rupture.

<div class="definition">
<strong>Definition 5.5 (Haskell's Rupture Model).</strong> In Haskell's kinematic model, the fault is a rectangular area of length \(L\) and width \(W\). Rupture propagates unilaterally along the fault at a constant rupture velocity \(v_r\), with uniform final slip \(D\) and a boxcar slip-rate function of duration \(\tau_r\) (rise time) at each point. The slip function is

\[
D(\xi, t) = D\, H(t - \xi/v_r)\, [H(t - \xi/v_r) - H(t - \xi/v_r - \tau_r)] / \tau_r,
\]
where \(\xi\) is the position along the fault measured from the hypocenter and \(H\) is the Heaviside function.
</div>

The finite rupture produces a directivity effect: the pulse is compressed (Doppler-shortened) in the direction of rupture propagation and elongated in the opposite direction.

<div class="theorem">
<strong>Theorem 5.6 (Directivity Effect).</strong> For a unilateral rupture of length \(L\) at rupture velocity \(v_r\), the apparent source duration observed at azimuth \(\theta\) from the rupture direction is

\[
T(\theta) = \frac{L}{v_r} - \frac{L\cos\theta}{c},
\]
where \(c = \alpha\) for P-waves and \(c = \beta\) for S-waves. The source spectrum at frequency \(f\) is modulated by the directivity factor

\[
D(f, \theta) = \frac{\sin(\pi f T(\theta))}{\pi f T(\theta)}.
\]
</div>

<div class="example">
<strong>Example 5.6 (Directivity of the 1992 Landers Earthquake).</strong> The \(M_W\) 7.3 Landers earthquake in California ruptured approximately 85 km of fault unilaterally from south to north at a rupture velocity \(v_r \approx 2.7\) km/s (about 80% of the local shear velocity). For a station directly north of the rupture (in the forward direction, \(\theta = 0\)), the apparent P-wave source duration was \(T(0) = L/v_r - L/\alpha = 85/2.7 - 85/6.0 \approx 17.3\) s. For a station to the south (\(\theta = 180^\circ\)), the duration stretched to \(T(\pi) = 85/2.7 + 85/6.0 \approx 45.6\) s. The ground-motion amplitudes at stations to the north were 2--3 times larger than at comparable distances to the south, a direct manifestation of the Doppler focusing effect. This asymmetry was one of the clearest demonstrations of rupture directivity and motivated the inclusion of directivity corrections in modern ground-motion prediction equations.
</div>

Directivity concentrates energy in the forward direction of rupture, with important implications for seismic hazard: ground motion can be amplified by a factor of 2-3 in the forward-directivity direction. This was dramatically observed in the 1994 Northridge and 1995 Kobe earthquakes.

### 5.4 Seismic Moment, Magnitude, and Stress Drop

The characterization of earthquake size has evolved from purely empirical magnitude scales (Richter, 1935) to physically based measures rooted in the moment tensor theory.

<div class="definition">
<strong>Definition 5.7 (Moment Magnitude).</strong> The <em>moment magnitude</em> \(M_W\) is defined by Kanamori (1977) as

\[
M_W = \frac{2}{3}\log_{10} M_0 - 6.07,
\]
where \(M_0\) is the scalar seismic moment in N\(\cdot\)m. Unlike the Richter magnitude \(M_L\) and body-wave magnitude \(m_b\), which saturate for large earthquakes (due to spectral limitations), \(M_W\) does not saturate because it is based on the zero-frequency limit of the source spectrum.
</div>

<div class="definition">
<strong>Definition 5.8 (Stress Drop).</strong> The <em>static stress drop</em> is the average change in shear stress on the fault during rupture:

\[
\Delta\sigma = C\, \mu\, \frac{\bar{D}}{L_c},
\]
where \(\bar{D}\) is the average slip, \(L_c\) is the characteristic fault dimension, \(\mu\) is the shear modulus, and \(C\) is a dimensionless geometric factor of order unity. For a circular crack of radius \(a\), \(\Delta\sigma = (7/16)\, M_0 / a^3\) (Eshelby, 1957). Observed stress drops range from about 1 to 100 MPa, with a median near 3-5 MPa, and show remarkably little dependence on earthquake magnitude (self-similarity).
</div>

The self-similarity of stress drops across many orders of magnitude in earthquake size (from \(M_W\) 1 to \(M_W\) 9) is one of the most remarkable empirical observations in seismology. It implies that the relationship \(M_0 \propto L_c^3\) holds on average, meaning that the ratio of slip to fault dimension is roughly constant regardless of earthquake size. This scaling was first noted by Aki (1967) and remains the subject of active research, as deviations from self-similarity could have important implications for seismic hazard assessment. The Brune (1970) source model, which assumes a circular crack with instantaneous stress release, predicts a far-field displacement spectrum that is flat below a corner frequency \(f_c \propto \beta / L_c\) and decays as \(\omega^{-2}\) above it:

\[
\hat{u}(\omega) = \frac{M_0}{1 + (\omega/\omega_c)^2},
\]
where \(\omega_c = 2\pi f_c\). This spectral shape, known as the Brune spectrum, is the standard model used in seismic hazard analysis for predicting ground-motion amplitudes.

<div class="example">
<strong>Example 5.9 (The 2011 Tohoku Earthquake).</strong> The \(M_W\) 9.0 Tohoku earthquake had \(M_0 \approx 3.9 \times 10^{22}\) N\(\cdot\)m, a rupture area of approximately \(450 \times 200\) km\(^2\), average slip of about 15 m (with peak slip exceeding 50 m near the trench), and a stress drop of about 5 MPa. The rupture propagated for approximately 150 seconds. The extraordinary near-trench slip produced the devastating tsunami and was a surprise to seismologists, who had assumed that the shallow plate interface was too weak to accumulate large stress.
</div>

---

## Chapter 6: Seismic Wave Propagation in 3D Heterogeneous Media

### 6.1 The Born Approximation and Single Scattering

Real Earth structure is far more complex than the layered or smoothly varying models assumed in ray theory and normal mode analysis. Three-dimensional heterogeneities at all scales --- from crystalline grains to mantle plumes --- scatter seismic waves, redistributing energy in ways that carry information about the heterogeneity. The mathematical framework for understanding scattering begins with perturbation theory.

Consider a reference medium with velocity \(c_0(\mathbf{x})\) and a perturbation \(\delta c(\mathbf{x})\). The total wavefield \(u = u_0 + u_s\) satisfies the wave equation in the perturbed medium, while the reference field \(u_0\) satisfies the wave equation in the reference medium.

<div class="theorem">
<strong>Theorem 6.1 (Born Approximation).</strong> To first order in \(\delta c / c_0\), the scattered wavefield \(u_s\) satisfies

\[
\left(\nabla^2 - \frac{1}{c_0^2}\frac{\partial^2}{\partial t^2}\right)u_s = \frac{2\delta c}{c_0^3}\frac{\partial^2 u_0}{\partial t^2},
\]
with solution

\[
u_s(\mathbf{x}, \omega) = \int_V G(\mathbf{x}, \mathbf{x}'; \omega)\, \frac{2\omega^2\, \delta c(\mathbf{x}')}{c_0(\mathbf{x}')^3}\, u_0(\mathbf{x}', \omega)\, dV',
\]
where \(G\) is the Green's function of the reference medium. This is the <em>Born (single-scattering) approximation</em>, valid when the scattered field is small compared to the incident field.
</div>

The Born approximation replaces the unknown total field in the scattering integral by the known incident field, linearizing the scattering problem. This linearization is the foundation of many tomographic methods and is valid for weak heterogeneities with \(\delta c / c_0 \ll 1\).

<div class="example">
<strong>Example 6.2 (Born Scattering from a Spherical Inclusion).</strong> Consider a spherical inclusion of radius \(a\) with velocity perturbation \(\delta c\) embedded in a homogeneous background of velocity \(c_0\). For a plane P-wave of wavenumber \(k = \omega/c_0\) incident on the inclusion, the Born scattered field in the far field (\(r \gg a\)) is

\[
u_s(r, \theta) \approx -\frac{2\omega^2 \delta c}{c_0^3}\, \frac{e^{ikr}}{r}\, \frac{4\pi a^3}{3}\, \frac{3[\sin(qa) - qa\cos(qa)]}{(qa)^3},
\]
where \(q = 2k\sin(\theta/2)\) is the magnitude of the scattering vector and \(\theta\) is the scattering angle. In the long-wavelength limit (\(ka \ll 1\)), the scattering is nearly isotropic (Rayleigh scattering) and the scattered power scales as \(\omega^4 a^6\), a strong frequency dependence that explains why high-frequency seismic waves are much more strongly scattered by crustal heterogeneities than low-frequency waves. In the short-wavelength limit (\(ka \gg 1\)), the scattering is concentrated in the forward direction within a cone of half-angle \(\sim 1/(ka)\), and the total scattering cross-section approaches twice the geometric cross-section.
</div>

### 6.2 The Rytov Approximation

An alternative to the Born approximation that better handles the cumulative effects of propagation through weakly heterogeneous media is the Rytov approximation.

<div class="definition">
<strong>Definition 6.2 (Rytov Approximation).</strong> The <em>Rytov approximation</em> writes the wavefield as \(u = u_0\, e^{\psi}\), where \(\psi\) is a complex phase perturbation. To first order, \(\psi\) satisfies

\[
\psi(\mathbf{x}, \omega) = \frac{1}{u_0(\mathbf{x}, \omega)}\int_V G(\mathbf{x}, \mathbf{x}'; \omega)\, \frac{2\omega^2\, \delta c(\mathbf{x}')}{c_0(\mathbf{x}')^3}\, u_0(\mathbf{x}', \omega)\, dV'.
\]
</div>

The Rytov approximation is better suited for forward-scattering problems (long-range propagation through weak heterogeneity) because it correctly handles the phase wrapping that occurs when the accumulated phase perturbation exceeds \(2\pi\). The Born approximation, by contrast, is better for backscattering problems. Both approximations are widely used in seismic imaging.

### 6.3 Attenuation and the Quality Factor Q

Real seismic waves lose amplitude not only through geometric spreading but also through anelastic processes: the conversion of elastic energy into heat. This intrinsic attenuation is quantified by the quality factor.

<div class="definition">
<strong>Definition 6.3 (Quality Factor).</strong> The <em>quality factor</em> \(Q\) is defined as

\[
Q^{-1} = -\frac{\Delta E}{2\pi E},
\]
where \(\Delta E\) is the energy lost per cycle and \(E\) is the peak stored energy. In a medium with constant \(Q\), a plane wave at frequency \(\omega\) propagating a distance \(x\) has amplitude

\[
A(x) = A_0\, \exp\left(-\frac{\omega x}{2cQ}\right).
\]
In the Earth's mantle, \(Q\) for shear waves ranges from about 80 in the asthenosphere to over 500 in the lower mantle.
</div>

Attenuation and dispersion are intimately linked through causality, expressed by the Kramers-Kronig relations.

<div class="theorem">
<strong>Theorem 6.4 (Kramers-Kronig Relations for Seismic Attenuation).</strong> The real and imaginary parts of the complex velocity \(c(\omega) = c_R(\omega) + ic_I(\omega)\) of an attenuating medium are related by

\[
c_R(\omega) = c_R(\omega_r) + \frac{2}{\pi}\int_0^\infty \frac{\omega' c_I(\omega') - \omega c_I(\omega)}{\omega'^2 - \omega^2}\, d\omega',
\]
where \(\omega_r\) is a reference frequency. For a nearly constant-\(Q\) medium, this yields the approximate dispersion relation (Liu, Anderson, and Kanamori, 1976):

\[
c(\omega) = c(\omega_r)\left[1 + \frac{1}{\pi Q}\ln\frac{\omega}{\omega_r}\right].
\]
Higher frequencies travel faster: the velocity dispersion is positive (anomalous dispersion).
</div>

This dispersion is essential for comparing seismic velocities measured at different frequencies. Body-wave studies (at \(\sim 1\) Hz) and normal mode studies (at \(\sim 1\) mHz) measure velocities that differ by several percent due to physical dispersion, and this must be accounted for when constructing reference Earth models.

<div class="example">
<strong>Example 6.5 (Attenuation in PREM).</strong> The Preliminary Reference Earth Model (PREM) of Dziewonski and Anderson (1981) specifies attenuation as well as elastic velocities. In the asthenosphere (80--220 km depth), the shear quality factor is \(Q_\mu = 80\), reflecting the presence of partial melt and high temperatures near the solidus. In the lower mantle, \(Q_\mu \approx 312\), and in the inner core, \(Q_\mu \approx 85\). The compressional quality factor \(Q_\kappa\) is much larger (typically \(> 1000\) in the mantle), indicating that bulk dissipation is far weaker than shear dissipation. The velocity correction between 1 Hz (body wave) and 1 mHz (normal mode) reference frequencies is

\[
\frac{\delta c}{c} = \frac{1}{\pi Q}\ln\frac{1\,\text{Hz}}{1\,\text{mHz}} = \frac{\ln 1000}{\pi Q} \approx \frac{2.2}{Q}.
\]
For the asthenosphere with \(Q_\mu = 80\), this gives \(\delta\beta/\beta \approx 2.7\%\), a correction comparable to the lateral velocity variations due to temperature and composition that tomography seeks to image. Ignoring this dispersion correction would introduce systematic biases into Earth models derived from multi-frequency data.
</div>

### 6.4 Scattering and Coda Waves

The tail of a local earthquake seismogram, after the direct P and S arrivals, is filled with a slowly decaying, irregular signal known as the coda. Aki (1969) made the seminal observation that the coda is generated by single scattering from random heterogeneities in the Earth's crust and upper mantle.

<div class="theorem">
<strong>Theorem 6.5 (Aki's Single-Scattering Coda Model).</strong> For a point source in a medium with uniform background velocity \(c\) and random heterogeneities characterized by a scattering coefficient \(g_0\) (total scattering cross-section per unit volume), the mean coda power spectral density at frequency \(\omega\) and lapse time \(t\) (time after the origin) is

\[
P(\omega, t) = \frac{2g_0}{4\pi c t^2}\, |S(\omega)|^2\, \exp\left(-\frac{\omega t}{Q_c}\right),
\]
where \(|S(\omega)|^2\) is the source spectral density and \(Q_c\) is the coda quality factor. The \(t^{-2}\) decay comes from the geometry of the single-scattering ellipsoid, and the exponential decay from intrinsic attenuation.
</div>

<div class="remark">
<strong>Remark 6.6.</strong> The remarkable property of coda waves is that the coda decay rate (\(Q_c^{-1}\)) is independent of source-receiver distance, path, and site effects, depending only on the regional attenuation and scattering properties. This makes coda \(Q\) one of the most robust observables in seismology. The separation of scattering attenuation (\(Q_s^{-1}\)) from intrinsic attenuation (\(Q_i^{-1}\)) is a fundamental problem: the total attenuation is \(Q_t^{-1} = Q_s^{-1} + Q_i^{-1}\). Multiple scattering models (energy diffusion) are required when \(Q_s^{-1}\) is large.
</div>

### 6.5 Multiple Scattering and Anderson Localization

When scattering is strong (mean free path comparable to the wavelength), the single-scattering approximation breaks down and we enter the regime of multiple scattering. The seismic energy then diffuses through the medium.

<div class="theorem">
<strong>Theorem 6.7 (Energy Diffusion Equation).</strong> In the multiple-scattering regime, the ensemble-averaged energy density \(E(\mathbf{x}, t)\) satisfies a diffusion equation:

\[
\frac{\partial E}{\partial t} = D\, \nabla^2 E - \frac{\omega}{Q_i}\, E + S(\mathbf{x}, t),
\]
where \(D = cl^*/3\) is the energy diffusion coefficient, \(l^* = c/g_0\) is the transport mean free path, and \(Q_i^{-1}\) accounts for intrinsic absorption. The source term \(S\) represents the initial energy injection.
</div>

<div class="definition">
<strong>Definition 6.8 (Anderson Localization).</strong> In the extreme limit of very strong scattering, destructive interference of multiply scattered waves can cause the energy to become spatially confined rather than diffusing. This phenomenon, known as <em>Anderson localization</em> (originally studied for electron waves in disordered media), occurs when the mean free path \(l^*\) becomes comparable to the wavelength \(\lambda\). The Ioffe-Regel criterion \(kl^* \lesssim 1\) (\(k = 2\pi/\lambda\)) indicates the onset of localization. While Anderson localization has been observed for ultrasound, its relevance to seismology remains debated, though evidence has been reported in volcanic environments with extreme heterogeneity.
</div>

<div class="remark">
<strong>Remark 6.9.</strong> The transition from single scattering to multiple scattering to localization represents a continuum governed by the ratio of the transport mean free path to the wavelength. For the Earth's lithosphere at frequencies of 1--10 Hz, estimates of the scattering mean free path range from 20--100 km, placing most observations firmly in the single-to-weak-multiple-scattering regime. However, in volcanic regions with intense heterogeneity (e.g., beneath active volcanoes where magma bodies, fractured rock, and hydrothermal fluids create extreme impedance contrasts), the mean free path can decrease to a few kilometers, approaching the strong-scattering regime. The radiative transfer equation, which describes the evolution of specific intensity (energy flux per unit solid angle) through a scattering medium, provides a unified framework that encompasses both single and multiple scattering as limiting cases and is increasingly applied to model the envelope of high-frequency seismograms in heterogeneous regions.
</div>

---

## Chapter 7: Seismic Tomography

### 7.1 Travel-Time Tomography as a Linear Inverse Problem

Seismic tomography is the art and science of inferring the three-dimensional structure of the Earth's interior from seismic observations. The basic idea, analogous to medical CT scanning, is that waves traveling along different paths sample different regions of the Earth, and their observed properties (travel times, amplitudes, waveforms) carry information about the material properties along those paths. The mathematical foundations draw on the theory of linear inverse problems, a subject of considerable richness.

<div class="definition">
<strong>Definition 7.1 (Travel-Time Tomography).</strong> In <em>travel-time tomography</em>, the data are travel-time residuals \(\delta t_i\) (observed minus predicted travel times for a reference model). The slowness perturbation \(\delta s(\mathbf{x}) = 1/c(\mathbf{x}) - 1/c_0(\mathbf{x})\) is related to the data by

\[
\delta t_i = \int_{\text{ray}_i} \delta s(\mathbf{x})\, ds,
\]
where the integral is along the unperturbed ray path (Fermat's principle guarantees that the travel-time perturbation is first-order even though the ray perturbation is first-order). This is a linear integral equation of the first kind.
</div>

After discretization (parameterizing \(\delta s\) on a grid of \(M\) blocks or as an expansion in basis functions), this becomes a linear system \(\mathbf{d} = \mathbf{G}\mathbf{m}\), where \(\mathbf{d} \in \mathbb{R}^N\) is the data vector of \(N\) travel-time residuals, \(\mathbf{m} \in \mathbb{R}^M\) is the model vector of slowness perturbations, and \(\mathbf{G}\) is the \(N \times M\) sensitivity matrix whose entries \(G_{ij}\) give the ray-path length of the \(i\)-th ray in the \(j\)-th cell.

### 7.2 Backus-Gilbert Theory

Before the advent of large-scale computational tomography, Backus and Gilbert (1968, 1970) developed an elegant framework for analyzing the resolving power of geophysical data. Their approach focuses not on finding a particular model, but on characterizing what linear functionals of the model can be reliably estimated from the data.

<div class="theorem">
<strong>Theorem 7.2 (Backus-Gilbert Resolution).</strong> Given data \(\mathbf{d} = \mathbf{G}\mathbf{m} + \boldsymbol{\epsilon}\), any linear estimate of the model at a target point \(\mathbf{x}_0\) has the form

\[
\hat{m}(\mathbf{x}_0) = \sum_{i=1}^N a_i\, \delta t_i = \int_V R(\mathbf{x}_0, \mathbf{x})\, \delta s(\mathbf{x})\, dV,
\]
where \(R(\mathbf{x}_0, \mathbf{x}) = \sum_i a_i\, G_i(\mathbf{x})\) is the <em>averaging kernel</em> (resolution kernel). The coefficients \(a_i\) are chosen to make \(R\) as close to a delta function at \(\mathbf{x}_0\) as possible, subject to a constraint on the noise amplification. The trade-off between resolution (width of \(R\)) and variance (noise amplification \(\sigma^2 = \mathbf{a}^T \mathbf{C}_\epsilon \mathbf{a}\)) is the fundamental limitation of the inverse problem.
</div>

The Backus-Gilbert approach provides a coordinate-free characterization of resolution that does not depend on any particular parameterization. However, for large-scale problems with millions of unknowns, it is computationally prohibitive, and regularized inversion methods are preferred.

### 7.3 Regularization Methods

The travel-time tomography problem is typically underdetermined (more unknowns than data), mixed-determined (some parameters well-constrained, others not), and ill-conditioned (small data perturbations can cause large model changes). Regularization is essential.

<div class="definition">
<strong>Definition 7.3 (Tikhonov Regularization).</strong> The <em>Tikhonov-regularized solution</em> minimizes

\[
\Phi(\mathbf{m}) = \|\mathbf{G}\mathbf{m} - \mathbf{d}\|^2 + \lambda^2 \|\mathbf{L}\mathbf{m}\|^2,
\]
where \(\lambda > 0\) is the regularization parameter and \(\mathbf{L}\) is a regularization operator (e.g., \(\mathbf{L} = \mathbf{I}\) for norm damping, or \(\mathbf{L} = \nabla\) for smoothness). The solution is

\[
\hat{\mathbf{m}} = (\mathbf{G}^T\mathbf{G} + \lambda^2 \mathbf{L}^T\mathbf{L})^{-1}\mathbf{G}^T\mathbf{d}.
\]
</div>

<div class="definition">
<strong>Definition 7.4 (Truncated SVD).</strong> The <em>truncated singular value decomposition (TSVD)</em> regularization uses the SVD \(\mathbf{G} = \mathbf{U}\boldsymbol{\Sigma}\mathbf{V}^T\) and retains only the \(k\) largest singular values:

\[
\hat{\mathbf{m}} = \sum_{j=1}^k \frac{\mathbf{u}_j^T \mathbf{d}}{\sigma_j}\, \mathbf{v}_j,
\]
where \(\sigma_1 \ge \sigma_2 \ge \cdots\) are the singular values and \(\mathbf{u}_j, \mathbf{v}_j\) are the left and right singular vectors. The truncation level \(k\) plays the role of the regularization parameter.
</div>

<div class="theorem">
<strong>Theorem 7.5 (Resolution and Trade-off).</strong> For Tikhonov regularization, the model resolution matrix is

\[
\mathbf{R} = (\mathbf{G}^T\mathbf{G} + \lambda^2 \mathbf{L}^T\mathbf{L})^{-1}\mathbf{G}^T\mathbf{G},
\]
and the model covariance matrix is

\[
\mathbf{C}_m = (\mathbf{G}^T\mathbf{G} + \lambda^2 \mathbf{L}^T\mathbf{L})^{-1}\mathbf{G}^T\mathbf{C}_\epsilon\,\mathbf{G}\,(\mathbf{G}^T\mathbf{G} + \lambda^2 \mathbf{L}^T\mathbf{L})^{-1}.
\]
As \(\lambda \to 0\), \(\mathbf{R} \to \mathbf{I}\) (perfect resolution) but \(\mathrm{tr}(\mathbf{C}_m) \to \infty\) (infinite variance). As \(\lambda \to \infty\), \(\mathbf{C}_m \to 0\) (zero variance) but \(\mathbf{R} \to 0\) (no resolution). The optimal \(\lambda\) is chosen by methods such as the L-curve criterion or generalized cross-validation.
</div>

<div class="example">
<strong>Example 7.6 (Checkerboard Resolution Test).</strong> A standard method for assessing the spatial resolution of a tomographic model is the checkerboard test. One creates a synthetic model consisting of alternating positive and negative velocity anomalies on a regular grid (a "checkerboard"), computes synthetic travel-time residuals for the actual source-receiver geometry, and inverts these synthetic data using the same algorithm and regularization applied to the real data. Regions where the checkerboard pattern is faithfully recovered have good resolution; regions where the pattern is smeared or absent lack resolution. For global P-wave tomography with ISC bulletin data, the checkerboard is well recovered in the upper and lower mantle beneath seismically active regions and well-instrumented continents, but resolution degrades beneath oceanic regions (few stations) and in the mid-mantle where ray crossing density is low. A typical global model resolves structures of \(\sim 500\) km horizontally and \(\sim 200\) km vertically in well-sampled regions.
</div>

### 7.4 Finite-Frequency Kernels

Classical ray-theoretical tomography assumes that travel times are sensitive only to structure along the infinitesimally thin geometric ray path. In reality, seismic waves have finite wavelength and the region of sensitivity has finite width. This was formalized by Dahlen, Hung, and Nolet (2000), who showed that the true sensitivity kernels have a surprising structure.

<div class="theorem">
<strong>Theorem 7.6 (Banana-Doughnut Kernels).</strong> The finite-frequency travel-time sensitivity kernel \(K(\mathbf{x})\) for a body wave, defined by

\[
\delta t = \int_V K(\mathbf{x})\, \frac{\delta c(\mathbf{x})}{c_0(\mathbf{x})}\, dV,
\]
has the following properties: (i) it is zero on the geometric ray path (the "doughnut hole"), (ii) it has a hollow, banana-shaped region of maximum sensitivity surrounding the ray path (the first Fresnel zone), and (iii) it oscillates with decreasing amplitude at larger distances from the ray. The kernel width scales as \(\sqrt{\lambda L}\), where \(\lambda\) is the wavelength and \(L\) is the propagation distance.
</div>

<div class="remark">
<strong>Remark 7.7.</strong> The counter-intuitive vanishing of the kernel on the ray itself is a consequence of wave-front healing: a small slow anomaly on the ray delays the wave, but the energy diffracted around the anomaly partially fills in the time delay. Only off-ray structure, which produces asymmetric diffraction, has a net effect on the cross-correlation travel time. Finite-frequency tomography (also called wave-equation tomography) systematically accounts for these effects and produces sharper images than ray-based tomography, particularly for structures comparable in size to the Fresnel zone.
</div>

<div class="example">
<strong>Example 7.8 (Fresnel Zone Width).</strong> The first Fresnel zone for a body wave of period \(T\) that has traveled a distance \(L\) from source to receiver has a maximum half-width of approximately

\[
w = \sqrt{\frac{\lambda L}{2}} = \sqrt{\frac{cTL}{2}},
\]
where \(\lambda = cT\) is the wavelength. For a teleseismic P-wave at 1 Hz (\(T = 1\) s, \(c \approx 10\) km/s in the lower mantle) recorded at an epicentral distance of 60 degrees (\(L \approx 6700\) km), the Fresnel zone width is \(w \approx \sqrt{10 \cdot 6700 / 2} \approx 183\) km. This is the scale below which ray-based tomography cannot resolve structures, regardless of how many rays are used. At 0.05 Hz (20 s period), the Fresnel zone width increases to approximately 820 km. Finite-frequency kernels account for this frequency-dependent sensitivity and can resolve structures down to approximately half the Fresnel zone width, provided sufficient data coverage exists.
</div>

### 7.5 Full Waveform Inversion and Adjoint Methods

The ultimate goal of seismic tomography is to use the entire seismogram --- not just travel times --- to constrain Earth structure. Full waveform inversion (FWI) achieves this by minimizing the misfit between observed and synthetic seismograms with respect to the model parameters.

<div class="definition">
<strong>Definition 7.8 (Full Waveform Inversion).</strong> Given observed seismograms \(\mathbf{d}^{\text{obs}}\) and synthetic seismograms \(\mathbf{d}(\mathbf{m})\) computed for model \(\mathbf{m}\), FWI minimizes the misfit functional

\[
\chi(\mathbf{m}) = \frac{1}{2}\sum_{\text{sources}}\sum_{\text{receivers}}\int_0^T \|\mathbf{d}^{\text{obs}}(t) - \mathbf{d}(\mathbf{m}; t)\|^2\, dt.
\]
This is a nonlinear optimization problem, typically solved by iterative gradient descent:

\[
\mathbf{m}_{k+1} = \mathbf{m}_k - \alpha_k\, \mathbf{H}_k^{-1}\, \nabla_m \chi(\mathbf{m}_k),
\]
where \(\alpha_k\) is the step length and \(\mathbf{H}_k\) is an approximation to the Hessian.
</div>

The key computational challenge is computing the gradient \(\nabla_m \chi\), which, for \(M\) model parameters, would naively require \(M\) forward simulations. The adjoint method reduces this to just two simulations per source (one forward, one adjoint), regardless of the number of parameters.

<div class="theorem">
<strong>Theorem 7.9 (Adjoint Method for Seismology).</strong> The gradient of the misfit functional with respect to any model parameter \(m_j\) (e.g., shear velocity at a grid point) can be computed as a space-time correlation of the forward wavefield \(\mathbf{u}\) and the adjoint wavefield \(\mathbf{u}^\dagger\):

\[
\frac{\partial \chi}{\partial m_j} = -\int_0^T \int_V \mathbf{u}^\dagger(\mathbf{x}, T-t) \cdot \frac{\partial \mathcal{L}}{\partial m_j}\, \mathbf{u}(\mathbf{x}, t)\, dV\, dt,
\]
where \(\mathcal{L}\) is the wave-equation operator and \(\mathbf{u}^\dagger\) is the solution of the adjoint wave equation with sources at the receivers, driven by the time-reversed data residuals:

\[
f_i^\dagger(\mathbf{x}, t) = \sum_r [d_i^{\text{obs}}(T-t) - d_i(\mathbf{m}; T-t)]\, \delta(\mathbf{x} - \mathbf{x}_r).
\]
For the self-adjoint elastic wave equation, this reduces to back-propagating the data residuals from the receiver locations.
</div>

The elegance of the adjoint method lies in its computational efficiency: computing the gradient with respect to millions of model parameters requires exactly two wave-propagation simulations per earthquake source, regardless of the number of parameters. The forward simulation propagates the wavefield from source to receivers, computing and storing the wavefield at each time step. The adjoint simulation injects the time-reversed data residuals at the receiver locations and propagates them backward in time. The interaction of the forward and adjoint fields at each grid point gives the local gradient, which indicates the direction in model space that most reduces the data misfit. This process, repeated for many earthquakes and summed, yields the total gradient --- a three-dimensional map showing where and how the Earth model should be modified to better fit the observations.

The adjoint method, introduced to seismology by Tarantola (1984) and brought to computational maturity by Tromp, Tape, and Liu (2005), has revolutionized global and regional tomography. Modern adjoint tomography models (e.g., GLAD-M25, SPECFEM-based) achieve unprecedented resolution of mantle structure.

<div class="example">
<strong>Example 7.10 (Global Adjoint Tomography).</strong> The GLAD-M25 model (Lei et al., 2020) was constructed using 1,480 earthquakes recorded by 11,800 seismographic stations, with 253,000 measurements of frequency-dependent travel times and waveform misfits. The inversion required 25 iterations of the conjugate gradient method, each involving forward and adjoint simulations for all earthquakes using the spectral element method on GPU clusters. The resulting model reveals plume conduits in the lower mantle, slab remnants in the transition zone, and ultra-low velocity zones at the core-mantle boundary with detail not achievable by ray-based methods.
</div>

---

## Chapter 8: Computational Seismology

### 8.1 Finite Difference Methods for the Elastic Wave Equation

The development of numerical methods for solving the elastic wave equation has transformed seismology from a discipline limited to analytical approximations to one capable of simulating wave propagation through arbitrarily complex three-dimensional structures. The finite difference (FD) method, owing to its conceptual simplicity and computational efficiency, remains one of the most widely used approaches.

<div class="definition">
<strong>Definition 8.1 (Staggered-Grid Finite Difference Scheme).</strong> The velocity-stress formulation of the elastic wave equation in 2D is

\[
\rho\,\frac{\partial v_x}{\partial t} = \frac{\partial \sigma_{xx}}{\partial x} + \frac{\partial \sigma_{xz}}{\partial z}, \qquad \rho\,\frac{\partial v_z}{\partial t} = \frac{\partial \sigma_{xz}}{\partial x} + \frac{\partial \sigma_{zz}}{\partial z},
\]

\[
\frac{\partial \sigma_{xx}}{\partial t} = (\lambda + 2\mu)\frac{\partial v_x}{\partial x} + \lambda\frac{\partial v_z}{\partial z}, \qquad \frac{\partial \sigma_{zz}}{\partial t} = \lambda\frac{\partial v_x}{\partial x} + (\lambda + 2\mu)\frac{\partial v_z}{\partial z}, \qquad \frac{\partial \sigma_{xz}}{\partial t} = \mu\left(\frac{\partial v_x}{\partial z} + \frac{\partial v_z}{\partial x}\right).
\]
In the <em>staggered-grid</em> scheme (Virieux, 1986), the velocity and stress components are defined at staggered grid positions, and spatial derivatives are approximated by centered finite differences. For a fourth-order scheme, the spatial derivative is

\[
\frac{\partial f}{\partial x}\bigg|_{i+1/2} \approx \frac{c_1(f_{i+1} - f_i) + c_2(f_{i+2} - f_{i-1})}{\Delta x},
\]
with \(c_1 = 9/8\) and \(c_2 = -1/24\).
</div>

The staggered-grid approach avoids the need to explicitly impose continuity conditions at interfaces between different materials: the natural discretization automatically satisfies the correct interface conditions (to the order of the scheme). This was a key insight of Virieux (1984, 1986) that made FD methods practical for heterogeneous media.

<div class="theorem">
<strong>Theorem 8.2 (Stability Condition).</strong> The explicit time-stepping of the staggered-grid FD scheme is conditionally stable. For a second-order leap-frog time integrator with a fourth-order spatial operator in \(d\) dimensions, the Courant-Friedrichs-Lewy (CFL) stability condition requires

\[
\Delta t \le \frac{\Delta x}{c_{\max}\sqrt{d}\,\sum_k |c_k|},
\]
where \(c_{\max}\) is the maximum P-wave velocity in the model and the sum is over the FD coefficients. For the standard fourth-order scheme in 2D, this gives \(\Delta t \lesssim 0.606\, \Delta x / c_{\max}\).
</div>

<div class="remark">
<strong>Remark 8.3.</strong> The FD method requires a minimum number of grid points per minimum wavelength to avoid numerical dispersion (grid dispersion). For a fourth-order scheme, approximately 5-8 points per wavelength are needed; for second-order, 15-20 points. This places severe computational demands on high-frequency simulations: doubling the maximum frequency requires an eightfold increase in computation in 3D (factor 2 in each spatial dimension, and factor 2 in time due to the CFL condition). At seismic frequencies of 1 Hz with crustal velocities, the grid spacing must be around 50-100 m, which for a regional simulation domain of \(100 \times 100 \times 50\) km requires \(10^9\) or more grid points.
</div>

<div class="example">
<strong>Example 8.4 (Grid Dispersion Analysis).</strong> To quantify numerical dispersion, substitute a plane-wave trial solution \(v = V_0 \exp[i(k_x x + k_z z - \omega t)]\) into the discrete FD equations. For a second-order centered scheme with grid spacing \(\Delta x\), the discrete dispersion relation is

\[
\frac{\omega^2}{\omega_{\text{exact}}^2} = \left(\frac{\sin(k\Delta x/2)}{k\Delta x/2}\right)^2,
\]
which shows that the numerical phase velocity is always less than the true velocity: the FD scheme is dispersive, with short wavelengths traveling too slowly. At 10 points per wavelength, the second-order scheme has a phase velocity error of about 0.4%, while the fourth-order scheme reduces this to approximately 0.01%. For a wave propagating 100 wavelengths (a typical regional simulation), even the 0.4% error of the second-order scheme accumulates to a significant time shift, motivating the use of high-order stencils.
</div>

### 8.2 Spectral Element Methods

The spectral element method (SEM) combines the flexibility of finite elements (unstructured meshes that conform to complex geometries) with the accuracy of spectral methods (high-order polynomial basis functions that converge exponentially for smooth solutions). Its application to seismology, pioneered by Komatitsch and Vilotte (1998) and implemented in the widely used SPECFEM codes (Komatitsch and Tromp, 2002), has become the gold standard for global and regional wave propagation simulations.

<div class="definition">
<strong>Definition 8.4 (Spectral Element Discretization).</strong> The computational domain is partitioned into non-overlapping hexahedral elements \(\Omega_e\). Within each element, the displacement field is represented as

\[
\mathbf{u}(\boldsymbol{\xi}) = \sum_{i=0}^N \sum_{j=0}^N \sum_{k=0}^N \mathbf{u}_{ijk}\, \ell_i(\xi_1)\, \ell_j(\xi_2)\, \ell_k(\xi_3),
\]
where \(\boldsymbol{\xi} = (\xi_1, \xi_2, \xi_3)\) are the local coordinates on the reference cube \([-1, 1]^3\), \(\ell_i\) are Lagrange interpolants based on the Gauss-Lobatto-Legendre (GLL) points, and \(N\) is the polynomial degree (typically 4 or 5).
</div>

<div class="theorem">
<strong>Theorem 8.5 (Diagonal Mass Matrix Property).</strong> When the integration points for the weak form of the equation of motion are chosen to coincide with the GLL interpolation nodes, the mass matrix \(\mathbf{M}\) is exactly diagonal:

\[
M_{(e,i,j,k),(e',i',j',k')} = \delta_{ee'}\delta_{ii'}\delta_{jj'}\delta_{kk'}\, \rho_e(\boldsymbol{\xi}_{ijk})\, J_e(\boldsymbol{\xi}_{ijk})\, w_i\, w_j\, w_k,
\]
where \(w_i\) are the GLL quadrature weights and \(J_e\) is the Jacobian of the element mapping. This diagonality enables explicit time stepping without the need to solve a linear system at each time step, making the SEM highly efficient for time-domain simulations.
</div>

<div class="remark">
<strong>Remark 8.6.</strong> The diagonal mass matrix property is a consequence of the specific choice to collocate the integration and interpolation points at the GLL nodes. This introduces a quadrature error (the GLL quadrature with \(N+1\) points is exact only for polynomials of degree \(\le 2N-1\), while the mass matrix integrands have degree \(\le 2N\)), but the resulting error is spectrally small and does not degrade the overall convergence rate. The trade-off is overwhelmingly favorable: an implicit time integrator with a consistent (non-diagonal) mass matrix would require the solution of a global linear system at every time step, increasing the computational cost per step by orders of magnitude. The SEM with GLL integration thus achieves spectral accuracy in space with the efficiency of an explicit time-marching scheme. For polynomial degree \(N = 4\), approximately 5 elements per shortest wavelength suffice, corresponding to roughly 25 GLL points per wavelength --- far fewer degrees of freedom than the 100+ grid points per wavelength required by a comparable second-order FD scheme.
</div>

The SEM naturally handles the free surface (it is a natural boundary condition in the weak formulation), fluid-solid interfaces (through appropriate coupling conditions), and complex geometries (through mesh deformation). The SPECFEM3D_GLOBE code, for example, uses a cubed-sphere mesh to avoid the polar singularity and deforms element boundaries to honor the major internal discontinuities (Moho, 410-km, 660-km, core-mantle boundary, inner-core boundary).

### 8.3 Perfectly Matched Layers

Numerical simulations of wave propagation are performed in finite computational domains, but the physical problem often involves unbounded domains (e.g., a half-space). Artificial reflections from the boundaries of the computational domain must be suppressed.

<div class="definition">
<strong>Definition 8.6 (Perfectly Matched Layer).</strong> The <em>perfectly matched layer</em> (PML), introduced by Berenger (1994) for electromagnetic waves and adapted to elastodynamics by Chew and Liu (1996) and Komatitsch and Tromp (2003), is an absorbing boundary layer that is, in principle, perfectly non-reflecting for waves at any frequency and any angle of incidence. The PML is implemented by an analytic continuation of the spatial coordinates into the complex plane:

\[
x \to \tilde{x} = x + \frac{1}{i\omega}\int_0^x d_x(x')\, dx',
\]
where \(d_x(x') \ge 0\) is a damping profile that is zero inside the physical domain and increases into the absorbing layer. In the frequency domain, this is equivalent to replacing \(\partial/\partial x\) by \((1 + d_x/(i\omega))^{-1}\, \partial/\partial x\).
</div>

In practice, the continuous PML achieves perfect absorption, but the discretized PML has small reflections that depend on the damping profile, the layer thickness, and the discretization. A polynomial damping profile \(d_x(x) = d_0 (x/L)^n\) with \(n = 2\) or \(3\) and a layer thickness of 5-10 elements typically reduces reflections to \(10^{-3}\) or less. The convolutional PML (C-PML) formulation, due to Roden and Gedney (2000), avoids the frequency-domain implementation and works directly in the time domain using recursive convolution.

<div class="remark">
<strong>Remark 8.7.</strong> An alternative to PML is the use of absorbing boundary conditions (ABCs), such as the Clayton-Engquist conditions, which are local approximations to the radiation condition. While simpler to implement, ABCs are less effective, particularly for grazing-incidence waves. For high-accuracy simulations, PML is strongly preferred.
</div>

### 8.4 Reciprocity and Green's Functions

A fundamental principle that pervades computational seismology is reciprocity: the wavefield observed at point B due to a source at point A is related to the wavefield at A due to a source at B. This principle has profound computational implications.

<div class="theorem">
<strong>Theorem 8.8 (Elastodynamic Reciprocity).</strong> Let \(\mathbf{u}\) be the displacement field due to a body-force distribution \(\mathbf{f}\), and let \(\mathbf{u}'\) be the displacement field due to a different body-force distribution \(\mathbf{f}'\), both in the same elastic medium. Then

\[
\int_V f_i\, u_i'\, dV = \int_V f_i'\, u_i\, dV.
\]
In terms of the Green's function, this is \(G_{ij}(\mathbf{x}_A, \mathbf{x}_B; t) = G_{ji}(\mathbf{x}_B, \mathbf{x}_A; t)\): the displacement at \(\mathbf{x}_A\) in direction \(i\) due to a force at \(\mathbf{x}_B\) in direction \(j\) equals the displacement at \(\mathbf{x}_B\) in direction \(j\) due to a force at \(\mathbf{x}_A\) in direction \(i\).
</div>

<div class="proof">
<strong>Proof.</strong> Let both fields satisfy the elastic wave equation with zero initial conditions and traction-free surface boundary conditions. Consider

\[
I = \int_0^T \int_V \left[\mathbf{u}' \cdot (\rho\ddot{\mathbf{u}} - \nabla \cdot \boldsymbol{\sigma} - \mathbf{f}) - \mathbf{u} \cdot (\rho\ddot{\mathbf{u}}' - \nabla \cdot \boldsymbol{\sigma}' - \mathbf{f}')\right] dV\, dt = 0.
\]
Integrating by parts in time (using zero initial conditions) and in space (using the divergence theorem and zero surface traction), and exploiting the symmetry \(C_{ijkl} = C_{klij}\), all terms cancel except \(\int_V (f_i u_i' - f_i' u_i)\, dV = 0\), giving the stated result. \(\square\)
</div>

Reciprocity allows the computation of synthetic seismograms for many sources and few receivers by interchanging the roles of source and receiver: one simulation with a source at the receiver location yields the Green's function for all possible source locations. This is the computational basis of the adjoint method described in Chapter 7.

<div class="remark">
<strong>Remark 8.9.</strong> The Green's function representation theorem, which follows directly from elastodynamic reciprocity, states that the displacement at any point in the medium can be expressed as a surface integral of the Green's function and the boundary values of displacement and traction. For a moment-tensor point source, this gives the representation theorem of Aki and Richards (1980):

\[
u_n(\mathbf{x}, t) = \int_\Sigma M_{pq}(\boldsymbol{\xi}, \tau)\, G_{np,q}(\mathbf{x}, t; \boldsymbol{\xi}, \tau)\, d\Sigma(\boldsymbol{\xi})\, d\tau,
\]
where the integration is over the fault surface \(\Sigma\). This formula is the theoretical foundation for computing synthetic seismograms from kinematic rupture models: one precomputes the Green's function between each point on the fault and each receiver (using reciprocity, this requires one simulation per receiver rather than one per fault point), then integrates over the fault with the specified slip history. The approach was implemented by Graves (1996) and is the basis of most kinematic ground-motion simulation methods used in seismic hazard assessment.
</div>

### 8.5 Synthetic Seismograms

The computation of synthetic seismograms --- theoretical predictions of what a seismometer would record for a given Earth model and earthquake source --- is the fundamental forward problem of seismology. The choice of method depends on the frequency range, the complexity of the Earth model, and the available computational resources.

<div class="definition">
<strong>Definition 8.9 (Synthetic Seismogram Methods).</strong> The principal methods for computing synthetic seismograms are:

(i) <em>Normal mode summation</em>: Sum the contributions of individual normal modes. Efficient at long periods but requires precomputation of all modes up to the maximum frequency.

(ii) <em>Reflectivity method</em>: Compute the frequency-wavenumber response of a layered medium using the Thomson-Haskell matrices, then evaluate the inverse Hankel transform to obtain the time-domain response. Exact for 1D models; the standard tool for computing body-wave and surface-wave synthetics.

(iii) <em>Generalized ray theory (Cagniard-de Hoop method)</em>: Deform the integration contour in the complex ray-parameter plane to obtain exact closed-form expressions for each ray arrival. Gives physically transparent results and exact waveforms for canonical problems.

(iv) <em>Numerical methods (FD, SEM)</em>: Directly solve the wave equation in 3D heterogeneous media. No approximations beyond discretization; handles all wave types and effects simultaneously. Computationally the most expensive.
</div>

<div class="example">
<strong>Example 8.10 (Benchmarking with Lamb's Problem).</strong> Lamb's problem --- the response of a homogeneous elastic half-space to a vertical point force on the surface --- has an exact analytical solution (Lamb, 1904) that serves as a fundamental benchmark for numerical codes. The solution contains a P-wave arrival, an S-wave arrival, and a prominent Rayleigh-wave pulse. The Rayleigh wave arrives last but carries the most energy (about 67% of the total for a Poisson solid). Numerical codes must accurately reproduce the amplitude ratio between body-wave and surface-wave arrivals, the exact Rayleigh-wave velocity, and the waveform shape (including the characteristic \(t^{-1/2}\) singularity near the Rayleigh-wave arrival in the exact 2D solution). This benchmark has been used to validate all major FD and SEM codes.
</div>

### 8.6 Ambient Noise Seismology

A remarkable development of the 21st century is the extraction of structural information from the ambient seismic noise field, without relying on earthquakes. The theoretical foundation rests on a connection between noise cross-correlations and Green's functions.

<div class="theorem">
<strong>Theorem 8.11 (Noise Cross-Correlation Theorem).</strong> If the ambient noise wavefield is generated by a spatially uniform distribution of uncorrelated random sources, then the cross-correlation of noise recordings at two stations \(A\) and \(B\) converges, in the long-time average, to the Green's function between the two stations:

\[
\frac{d}{dt}\langle u(x_A, t) * u(x_B, -t) \rangle \approx G(\mathbf{x}_A, \mathbf{x}_B; t) + G(\mathbf{x}_A, \mathbf{x}_B; -t),
\]
where \(\langle \cdot \rangle\) denotes the long-time average and \(*\) denotes cross-correlation. The right-hand side is the causal Green's function plus its time-reversed (acausal) counterpart.
</div>

<div class="remark">
<strong>Remark 8.12.</strong> This result, rooted in the fluctuation-dissipation theorem of statistical mechanics, was demonstrated empirically for seismic surface waves by Shapiro and Campillo (2004) and placed on rigorous mathematical footing by Wapenaar (2004) and Snieder (2004). The dominant source of ambient noise at periods of 5-20 s is ocean microseisms (generated by the nonlinear interaction of ocean waves), which provides a remarkably uniform and persistent source distribution. Ambient noise tomography using surface wave dispersion extracted from noise cross-correlations has revolutionized regional seismology, providing high-resolution images of crustal and upper mantle structure even in regions with no local seismicity. It has also enabled the monitoring of temporal velocity changes associated with volcanic unrest, fault healing, and seasonal environmental effects.
</div>

<div class="example">
<strong>Example 8.13 (USArray Ambient Noise Tomography).</strong> The EarthScope USArray, a transportable array of 400 broadband seismometers that swept across the contiguous United States from 2004 to 2015, generated an enormous dataset of noise cross-correlations. Bensen et al. (2007) and Lin et al. (2008) produced surface-wave group and phase velocity maps at periods of 8-40 s with lateral resolution of approximately 70 km, revealing detailed crustal structure including sedimentary basins (low velocities), cratonic roots (high velocities), and tectonic features not visible in earthquake-based tomography due to limited ray coverage. The shear-velocity models derived from these data now serve as the reference for seismic hazard assessment across the United States.
</div>

---

*These notes provide a mathematical foundation for the study of seismic wave propagation. The subject sits at the intersection of applied mathematics, physics, and Earth science, drawing on PDE theory, asymptotic analysis, spectral theory, inverse problems, and computational methods. For the student of applied mathematics, seismology offers a uniquely rich collection of problems where rigorous mathematical analysis has direct consequences for our understanding of the planet's interior.*
