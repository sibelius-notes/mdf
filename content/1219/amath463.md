---
title: "AMATH 463: Fluid Mechanics"
prof: ""
---

These notes synthesise AMATH 463 as offered at the University of Waterloo (Fall 2021). The primary text is P.K. Kundu and I.M. Cohen, *Fluid Mechanics*, 3<sup>rd</sup> edition (Academic Press, 2004), which covers all topics in the undergraduate portion. G.K. Batchelor, *An Introduction to Fluid Dynamics* (Cambridge University Press, 1967), remains the authoritative mathematical reference and is cited throughout for depth and rigour. For boundary layer theory and the physical intuition behind high-Reynolds-number flows, D.J. Acheson, *Elementary Fluid Dynamics* (Oxford, 1990), provides an accessible companion. The chapters on geophysical fluid dynamics draw on J. Pedlosky, *Geophysical Fluid Dynamics*, 2<sup>nd</sup> ed. (Springer, 1987). The two graduate extension chapters at the end — on nonlinear waves (AMATH 867) and hydrodynamic stability (AMATH 863) — draw on G.B. Whitham, *Linear and Nonlinear Waves* (Wiley, 1974), and P.G. Drazin and W.H. Reid, *Hydrodynamic Stability*, 2<sup>nd</sup> ed. (Cambridge, 2004), respectively. Open educational resources consulted include MIT OpenCourseWare 2.20 (Marine Hydrodynamics) and 12.800 (Fluid Dynamics of the Atmosphere and Ocean).

---

# Chapter 1: Equations of Motion

## 1.1 The Continuum Hypothesis and the Fluid Element

Before writing down any equations, we must justify the very concept of a fluid described by smooth fields. Matter is discrete at the molecular scale — a cubic centimetre of water contains roughly \(10^{22}\) molecules. Yet we speak of a smooth velocity field \(\mathbf{u}(\mathbf{x},t)\) and a smooth pressure \(p(\mathbf{x},t)\) as if fluid properties varied continuously in space. The justification is the **continuum hypothesis**: we consider length scales much larger than the mean free path \(\ell_{mfp}\) but much smaller than the macroscopic scale \(L\) of the flow. For water at sea level, \(\ell_{mfp} \sim 3 \times 10^{-10}\) m — so the continuum approximation is valid down to nanometre scales for liquids and to roughly a micrometre for gases at sea level.

The Knudsen number \(Kn = \ell_{mfp}/L\) quantifies the validity of the continuum approximation: fluid mechanics holds when \(Kn \ll 1\). Satellite re-entry vehicles, microelectromechanical systems (MEMS), and high-altitude flight all push against this limit — but for the overwhelming majority of fluid flows encountered in engineering and geophysics, \(Kn\) is negligibly small and the continuum description is exact to any practical precision.

## 1.2 The Reynolds Transport Theorem

The fundamental conservation laws are most naturally stated for a **material volume** \(\mathcal{V}(t)\) — a volume that moves with the fluid, always enclosing the same fluid particles. To derive Eulerian (fixed-frame) equations from these integral laws, we need to differentiate an integral over a moving domain.

<div class="theorem">
<strong>Reynolds Transport Theorem.</strong> Let \(\mathcal{V}(t)\) be a material volume moving with velocity \(\mathbf{u}\), and let \(f(\mathbf{x},t)\) be any smooth scalar field. Then:
\[
\frac{d}{dt}\int_{\mathcal{V}(t)} f\, dV = \int_{\mathcal{V}(t)} \frac{\partial f}{\partial t}\, dV + \oint_{\partial\mathcal{V}(t)} f\, \mathbf{u} \cdot d\mathbf{S}
\]
</div>

The first term is the rate of change of the integral at fixed volume; the second accounts for the volume sweeping up additional fluid as its boundary moves with velocity \(\mathbf{u}\). Applying the divergence theorem to the surface integral converts this to the volume integral of \(\nabla \cdot (f\mathbf{u})\). Since the result must hold for every material volume, the integrand itself must vanish pointwise (in smooth flows), yielding the **Eulerian form** of the conservation law.

## 1.3 Conservation of Mass

Mass is conserved: the total mass in a material volume does not change. The Reynolds transport theorem with \(f = \rho\) gives:
\[
\frac{\partial\rho}{\partial t} + \nabla \cdot (\rho\mathbf{u}) = 0
\]

Expanding the divergence using the product rule:
\[
\frac{D\rho}{Dt} + \rho(\nabla \cdot \mathbf{u}) = 0
\]

For an **incompressible flow**, the density of each fluid parcel is constant along its trajectory: \(D\rho/Dt = 0\). The continuity equation then reduces to the **incompressibility constraint**:
\[
\nabla \cdot \mathbf{u} = 0
\]

## 1.4 Conservation of Momentum — The Navier–Stokes Equations

Newton's second law for a material volume, combined with Cauchy's theorem for the stress tensor \(\tau_{ij} = -p\delta_{ij} + 2\mu\dot{e}_{ij}\) (for an incompressible Newtonian fluid), yields after the Reynolds transport theorem:

<div class="theorem">
<strong>Navier–Stokes Equations.</strong>
\[
\nabla \cdot \mathbf{u} = 0, \qquad \rho\,\frac{D\mathbf{u}}{Dt} = -\nabla p + \mu\,\nabla^2\mathbf{u} + \rho\mathbf{g}
\]
where \(\mathbf{g}\) is the gravitational acceleration and \(\mu\) is the dynamic viscosity.
</div>

In component form with kinematic viscosity \(\nu = \mu/\rho\):
\[
\frac{\partial u_i}{\partial t} + u_j\frac{\partial u_i}{\partial x_j} = -\frac{1}{\rho}\frac{\partial p}{\partial x_i} + \nu\frac{\partial^2 u_i}{\partial x_j \partial x_j} + g_i
\]

The Navier–Stokes equations are the complete description of an incompressible Newtonian fluid. Every topic in this course — potential flow, water waves, boundary layers, turbulence, geophysical dynamics — is a different limit or specialisation of these equations. The richness of fluid mechanics arises entirely from the nonlinear advection term \((u_j \partial u_i / \partial x_j)\) interacting with the linear viscous term and the pressure gradient.

## 1.5 Boundary Conditions

Boundary conditions are as important as the equations themselves. At a rigid solid wall:
- **No-slip**: the fluid velocity equals the wall velocity, \(\mathbf{u}_{fluid} = \mathbf{u}_{wall}\) (from molecular sticking)
- For inviscid flow (Euler equations), only the normal component is specified: \(\mathbf{u} \cdot \hat{n} = \mathbf{u}_{wall} \cdot \hat{n}\)

At a free surface (air–water interface):
- The normal velocity is continuous: no fluid passes through the surface
- The tangential stress is continuous (the air exerts a very small shear on the water surface)
- The pressure jump across the surface equals the surface tension times the curvature: \(\Delta p = \sigma \kappa\)

At infinity for an exterior flow problem:
- The velocity approaches the undisturbed far-field: \(\mathbf{u} \to \mathbf{U}_\infty\) as \(|\mathbf{x}| \to \infty\)

---

# Chapter 2: Potential Flow and Aerofoil Theory

## 2.1 Irrotational Flow and the Velocity Potential

Recall from AMATH 361: a flow is **irrotational** if \(\boldsymbol{\omega} = \nabla \times \mathbf{u} = \mathbf{0}\). By Kelvin's circulation theorem, inviscid flows that start irrotational remain irrotational. For a simply connected domain, irrotationality implies the existence of a velocity potential \(\phi\) with \(\mathbf{u} = \nabla\phi\). Combined with incompressibility:

\[
\nabla^2\phi = 0 \qquad \text{(Laplace's equation)}
\]

The theory of potential flow is therefore the theory of harmonic functions applied to fluid mechanics. Solutions are smooth, satisfy the superposition principle, and can be constructed by adding elementary solutions.

## 2.2 Elementary Potential Flows

A powerful feature of Laplace's equation is linearity: superpositions of solutions are solutions. The elementary 2D complex potential solutions are:

**Uniform stream**: \(w(z) = Uz\), giving \(\phi = Ux\), \(\psi = Uy\), velocity \((U, 0)\).

**Line source/sink** of strength \(m\) at the origin: \(w(z) = (m/2\pi)\ln z\). Fluid radiates outward from (or converges toward) the origin like a point source in 2D.

**Irrotational vortex** of circulation \(\Gamma\): \(w(z) = -i(\Gamma/2\pi)\ln z\). Streamlines are circles; the speed \(|\mathbf{u}| = \Gamma/(2\pi r)\) is singular at the origin. This is the 2D analogue of a tornado vortex column.

**Doublet** (dipole) of strength \(\mu_d\): \(w(z) = \mu_d/(2\pi z)\). Obtained as the limit of a source-sink pair approaching each other with fixed product of strength and separation.

**Flow past a circular cylinder**: superposing a uniform stream of speed \(U\) and a doublet of strength \(\mu_d = Ua^2\) gives:
\[
w(z) = U\!\left(z + \frac{a^2}{z}\right)
\]

The streamline \(\psi = 0\) passes through the circle \(|z| = a\), so this is the potential flow past a cylinder of radius \(a\). The velocity on the cylinder surface is:
\[
u_\theta = -2U\sin\theta
\]

## 2.3 The Blasius Theorem and Lift

For a body in a potential flow, the net force per unit length can be computed from the complex potential without knowing the full flow field:

<div class="theorem">
<strong>Blasius Theorem.</strong> The force \((X, Y)\) per unit span on a body in a 2D potential flow is:
\[
X - iY = \frac{i\rho}{2}\oint_C \left(\frac{dw}{dz}\right)^2 dz
\]
where the contour \(C\) encloses the body and \(\rho\) is the fluid density.
</div>

Applied to a cylinder with a superimposed irrotational vortex of circulation \(\Gamma\):
\[
X = 0, \qquad Y = \rho U \Gamma
\]

This is the **Kutta–Joukowski theorem**: the lift per unit span is \(L' = \rho U \Gamma\). Zero drag (**d'Alembert's paradox** — a consequence of neglecting viscosity and the resulting flow symmetry). The generation of lift requires circulation, and the Kutta condition (see below) determines the appropriate amount of circulation for a real aerofoil.

## 2.4 Conformal Mapping and Joukowski Aerofoils

A conformal map \(\zeta = f(z)\) is a complex analytic function that maps one flow domain to another while preserving angles. This is extraordinary: if we can solve Laplace's equation in a simple geometry (a circle), a conformal map immediately gives us the solution in a complicated geometry (an aerofoil cross-section).

The **Joukowski transformation**:
\[
\zeta = z + \frac{c^2}{z}
\]
maps a circle \(|z - z_0| = a\) (with \(z_0\) chosen appropriately) to a smooth curve in the \(\zeta\)-plane that resembles a wing cross-section. The trailing edge of the Joukowski aerofoil corresponds to the critical point of the map, where the derivative \(d\zeta/dz\) vanishes and the map is no longer conformal — the angle doubles, creating the characteristic cusped trailing edge.

The **Kutta condition** selects the physically correct solution from the family of potential flows past an aerofoil. Mathematically, it requires the velocity to remain finite at the trailing edge; this uniquely determines the circulation \(\Gamma\), and hence the lift:
\[
L' = \rho U \Gamma = \rho U \cdot 4\pi U a \sin(\alpha + \beta)
\]
where \(\alpha\) is the angle of attack and \(\beta\) accounts for the aerofoil geometry. The physical mechanism: viscosity causes the rear stagnation point (which would otherwise sit on the upper surface) to move to the trailing edge, generating the correct circulation. Once the circulation is established, potential theory gives an excellent prediction of the lift even though viscosity has been neglected everywhere else.

---

# Chapter 3: Surface Gravity Waves

## 3.1 The Linear Theory of Water Waves

Surface gravity waves are generated by any disturbance of a free water surface — a wind gust, a boat, an earthquake-driven seafloor motion. The restoring force is gravity, which acts to flatten disturbances of the free surface. We derive the linear (small-amplitude) wave theory for an inviscid, incompressible fluid with a free surface.

Consider a fluid of depth \(H\) (or infinite depth) occupying \(-H \leq z \leq 0\) in the rest state, with the free surface at \(z = \eta(x,t)\) in the disturbed state. The linearised free-surface boundary conditions (applied at \(z = 0\) rather than \(z = \eta\), since \(\eta\) is small) are:

- **Kinematic**: \(\partial\eta/\partial t = \partial\phi/\partial z\) — the surface moves with the normal velocity of the fluid beneath
- **Dynamic**: \(\partial\phi/\partial t + g\eta = 0\) — the pressure equals atmospheric pressure at the free surface (from Bernoulli's equation)

Seeking wave solutions \(\phi \propto e^{ikx - i\omega t} Z(z)\), the Laplace equation \(\nabla^2\phi = 0\) gives \(Z'' - k^2 Z = 0\). The bottom boundary condition \(\partial\phi/\partial z = 0\) at \(z = -H\) gives \(Z(z) = \cosh k(z+H)\).

Combining the two free-surface conditions:

<div class="theorem">
<strong>Dispersion Relation for Finite-Depth Water Waves.</strong>
\[
\omega^2 = gk\tanh(kH)
\]
</div>

Two important limits follow immediately:

**Deep water** (\(kH \gg 1\), i.e., wavelength \(\ll\) depth): \(\tanh(kH) \to 1\), giving \(\omega^2 = gk\). Long waves travel faster than short waves; the group velocity \(c_g = \frac{1}{2}c_p\).

**Shallow water** (\(kH \ll 1\), i.e., wavelength \(\gg\) depth): \(\tanh(kH) \approx kH\), giving \(\omega^2 = gH k^2\), or \(\omega = \sqrt{gH}\,k\). All wavelengths travel at the same speed \(c = \sqrt{gH}\) — shallow-water waves are **non-dispersive**. Tsunamis are shallow-water waves (ocean depth \(\sim\) 4 km, wavelength \(\sim\) 200 km): they travel at \(\sqrt{gH} \approx 200\) m/s \(\approx\) 700 km/h.

## 3.2 Group Velocity and Energy Transport

The concept of **group velocity** is one of the most profound in wave physics. For a dispersive medium with dispersion relation \(\omega = \omega(k)\), a localised wave packet — a superposition of plane waves with wavenumbers centred near \(k_0\) — propagates as a whole at the group velocity:

\[
c_g = \frac{d\omega}{dk}\bigg|_{k_0}
\]

while individual crests move at the phase velocity \(c_p = \omega/k\). The group velocity is the velocity of energy transport. The split \(c_g = \frac{1}{2}c_p\) for deep-water gravity waves means that the energy packet travels at half the speed of the crests — a crest is born at the trailing edge of the packet, travels through to the leading edge, and disappears.

For shallow-water waves (\(c_g = c_p\)), there is no dispersive spreading: the wave packet propagates unchanged in shape. This is why a tsunami is devastating — it does not disperse during the thousands of kilometres of open-ocean travel.

## 3.3 Stokes Waves — A Glimpse of Nonlinearity

The linear theory of water waves assumes small amplitude \(a\) compared to wavelength \(\lambda\). The relevant parameter is the **wave steepness** \(\epsilon = ak\). For finite steepness, the free-surface boundary conditions must be applied at the actual free surface \(z = \eta\) rather than at \(z = 0\), introducing nonlinear corrections.

G.G. Stokes (1847) showed that the dispersion relation for finite-amplitude waves is modified:
\[
\omega^2 = gk\!\left(1 + \epsilon^2 + \cdots\right)
\]

Higher-amplitude waves travel slightly faster. Moreover, the wave profile is no longer a pure sinusoid but has sharper crests and flatter troughs — the Stokes wave. As \(\epsilon \to \epsilon_{max} \approx 0.443\), the crest angle reaches 120° (the Stokes limiting wave) and the wave breaks. This nonlinear wave theory connects directly to the subject of AMATH 867.

---

# Chapter 4: Laminar Flow — Exact Solutions

## 4.1 The Meaning of Exact Solutions

The Navier–Stokes equations are nonlinear PDEs and admit very few exact analytical solutions. When they do exist, the nonlinear advection term vanishes — usually because the geometry forces the flow to be unidirectional or because the streamlines are circles or spirals. These exact solutions are not mere mathematical exercises: they describe real flows that arise in engineering and nature, they provide benchmarks for numerical solvers, and they build physical intuition about how viscosity acts.

## 4.2 Plane Couette Flow

The simplest exact solution: fluid between two infinite parallel plates at \(y = 0\) and \(y = h\), with the lower plate at rest and the upper plate moving at speed \(U\). No imposed pressure gradient. The flow is \(\mathbf{u} = u(y)\hat{x}\), incompressibility is satisfied, and the Navier–Stokes equations reduce to:

\[
\nu\frac{d^2 u}{dy^2} = 0 \implies u(y) = U\frac{y}{h}
\]

A perfect linear profile. The shear stress on each plate is \(\tau = \mu U/h\). **Couette flow** is the defining experiment for measuring viscosity: by measuring the torque on a rotating cylinder (the Couette viscometer), one infers \(\mu\) from the known geometry.

## 4.3 Hagen–Poiseuille Flow

Steady, pressure-driven flow in a straight circular pipe of radius \(R\) along the \(z\)-axis. Symmetry forces \(\mathbf{u} = u(r)\hat{z}\). In cylindrical coordinates, the Navier–Stokes equations reduce to:

\[
\frac{1}{r}\frac{d}{dr}\!\left(r\frac{du}{dr}\right) = \frac{1}{\mu}\frac{dp}{dz}
\]

with no-slip \(u(R) = 0\) and regularity at the axis \(u'(0) = 0\). Integrating:

\[
u(r) = \frac{1}{4\mu}\!\left(-\frac{dp}{dz}\right)(R^2 - r^2)
\]

The flow rate is:
\[
Q = \int_0^R u(r)\, 2\pi r\, dr = \frac{\pi R^4}{8\mu}\!\left(-\frac{dp}{dz}\right)
\]

This \(R^4\) scaling — Hagen–Poiseuille's law — has enormous practical consequences. A 10% reduction in pipe radius reduces flow rate by \((0.9)^4 \approx 66\%\) at the same pressure gradient. It governs blood flow in the circulatory system, water supply in municipal networks, and flow through porous media.

## 4.4 The Stokes Equations and Creeping Flow

At very low Reynolds number (\(Re \ll 1\)), the nonlinear advection term \((\mathbf{u}\cdot\nabla)\mathbf{u}\) is negligible compared to the viscous term. The Navier–Stokes equations linearise to:

\[
\nabla p = \mu\nabla^2\mathbf{u}, \qquad \nabla \cdot \mathbf{u} = 0
\]

These are the **Stokes equations**. They are linear, elliptic, and time-reversible (reversing the boundary velocities reverses the flow exactly). The famous consequence is that a swimming microorganism (bacterium, spermatozoon) cannot propel itself by a reciprocal stroke — it must break time-reversal symmetry, which is why microorganisms use rotating helical flagella rather than the back-and-forth paddling motion that works at high Reynolds number.

G.G. Stokes derived the drag on a sphere of radius \(a\) moving at speed \(U\) in Stokes flow:
\[
F_{drag} = 6\pi\mu a U
\]

This formula underlies Millikan's oil-drop experiment (1909), Stokes settling of particles in centrifugation, and the motion of aerosol particles in the atmosphere.

## 4.5 Oscillatory Stokes Layer

Consider the Stokes problem of a flat plate oscillating in its own plane at frequency \(\omega\): \(u(0,t) = U\cos\omega t\). The governing equation is:

\[
\frac{\partial u}{\partial t} = \nu\frac{\partial^2 u}{\partial y^2}
\]

Seeking solutions of the form \(u = \text{Re}[\hat{u}(y) e^{-i\omega t}]\):

\[
u(y,t) = U e^{-\delta y}\cos(\omega t - \delta y), \qquad \delta = \sqrt{\frac{\omega}{2\nu}}
\]

The velocity oscillation decays exponentially with a characteristic **Stokes layer thickness** \(\delta^{-1} = \sqrt{2\nu/\omega}\). For water at 1 Hz, \(\delta^{-1} \approx 0.6\) mm — the oscillatory boundary layer is very thin. This result is crucial for acoustic damping, oscillating bodies in water, and the dynamics of blood flow in the aorta.

---

# Chapter 5: Boundary Layer Theory

## 5.1 The Boundary Layer Concept

One of the great discoveries of twentieth-century fluid mechanics is due to Ludwig Prandtl (1904): at high Reynolds number, viscosity is important only in a thin layer adjacent to solid boundaries. Away from this **boundary layer**, the flow is approximately inviscid and can be described by the Euler equations. Within the boundary layer, viscosity dominates and enforces the no-slip condition.

The thickness of the boundary layer \(\delta\) can be estimated by balancing the inertial and viscous terms in the Navier–Stokes equations:
\[
U\frac{\partial u}{\partial x} \sim U\frac{U}{L}, \qquad \nu\frac{\partial^2 u}{\partial y^2} \sim \nu\frac{U}{\delta^2}
\]

Setting these equal: \(\delta \sim \sqrt{\nu L / U} = L/\sqrt{Re}\). The boundary layer becomes thinner as \(Re\) increases — which is why viscous effects *appear* to diminish at high Reynolds number even though \(\nu\) is fixed.

## 5.2 Prandtl's Boundary Layer Equations

Prandtl derived simplified equations valid inside the boundary layer by scaling arguments. Let \(x\) be along the wall, \(y\) normal to it, \(U(x)\) the outer (inviscid) flow speed at the wall, \(u\) the streamwise velocity, and \(v\) the normal velocity. The full Navier–Stokes equations, after rescaling \(y \to y/\delta\) with \(\delta \sim Re^{-1/2}\), reduce in the limit \(Re \to \infty\) to:

<div class="theorem">
<strong>Prandtl Boundary Layer Equations.</strong>
\[
\frac{\partial u}{\partial x} + \frac{\partial v}{\partial y} = 0
\]
\[
u\frac{\partial u}{\partial x} + v\frac{\partial u}{\partial y} = U\frac{dU}{dx} + \nu\frac{\partial^2 u}{\partial y^2}
\]
with boundary conditions \(u = v = 0\) at \(y = 0\) and \(u \to U(x)\) as \(y \to \infty\).
</div>

The key simplification: the pressure gradient across the boundary layer is negligible (\(\partial p / \partial y \approx 0\)), so the pressure at the wall equals the inviscid outer pressure, given by Bernoulli's equation along the outer streamline: \(dP/dx = -\rho U\, dU/dx\).

## 5.3 The Blasius Flat-Plate Solution

For a flat plate (\(dU/dx = 0\), so the outer flow speed \(U\) is constant), the boundary layer equations admit a **similarity solution**. The key observation is that the equations have no built-in length scale when \(U = \text{const}\). This suggests that the velocity profile at different \(x\)-locations is self-similar: rescaling \(y\) by \(\delta(x) \sim \sqrt{\nu x/U}\) collapses all profiles onto a single curve.

Introducing the similarity variable \(\eta = y\sqrt{U/(\nu x)}\) and stream function \(\psi = \sqrt{\nu U x}\, f(\eta)\), the boundary layer equations reduce to the **Blasius ordinary differential equation**:

\[
f''' + \frac{1}{2}ff'' = 0, \qquad f(0) = f'(0) = 0, \quad f'(\infty) = 1
\]

This third-order nonlinear ODE must be solved numerically (a shooting method works well). The boundary layer thickness (defined as the 99% thickness where \(u = 0.99U\)) is:

\[
\delta_{99}(x) \approx \frac{5.0\, x}{\sqrt{Re_x}}, \qquad Re_x = \frac{Ux}{\nu}
\]

The skin friction coefficient (drag per unit area normalised by dynamic pressure):
\[
c_f = \frac{\tau_w}{\frac{1}{2}\rho U^2} = \frac{0.664}{\sqrt{Re_x}}
\]

These are exact asymptotic results, valid for large \(Re_x\). They agree very well with experiments up to the transition to turbulent boundary layers (typically around \(Re_x \approx 5\times 10^5\)).

## 5.4 Boundary Layer Separation

When the outer flow decelerates (\(dU/dx < 0\)), the adverse pressure gradient (\(dP/dx > 0\)) decelerates the boundary layer fluid. Near the wall, where the fluid has been slowed by friction, the momentum may be insufficient to overcome the adverse pressure gradient, and the flow **reverses direction**. At the point where the wall shear stress vanishes, the boundary layer is said to **separate**.

After separation, the thin boundary layer approximation breaks down, the flow leaves the surface, and a large recirculating wake forms. This catastrophic phenomenon — boundary layer separation — is responsible for:
- The dramatic drag increase on a bluff body (a sphere, a car at high speed)
- The stall of an aircraft wing at high angle of attack
- Flow separation at pipe bends and over hills

The position of separation depends delicately on the surface geometry and the upstream pressure distribution. For a circular cylinder in potential flow, the outer flow decelerates after the midpoint, and separation occurs around 80° from the leading stagnation point. The dramatic drag reduction of a dimpled golf ball (compared to a smooth one) works by triggering an early turbulent transition in the boundary layer, which can sustain higher adverse pressure gradients before separating — the separation point moves backward and the wake narrows.

---

# Chapter 6: Turbulence

## 6.1 The Nature of Turbulent Flow

At sufficiently high Reynolds number, laminar flows become unstable and transition to **turbulence**: an apparently chaotic, three-dimensional, time-dependent motion characterised by a broad range of active length and time scales. Turbulence is not random — it is deterministic at every instant (the Navier–Stokes equations have a unique solution for smooth initial data) — but it is extremely sensitive to initial conditions, making long-time prediction effectively impossible.

The Reynolds number at which transition occurs depends on geometry and the level of background disturbances:
- Pipe flow: \(Re \approx 2300\) (but can be delayed to \(10^5\) in very quiet conditions)
- Flat-plate boundary layer: \(Re_x \approx 5 \times 10^5\)
- Channel flow: \(Re \approx 2000\)

Turbulence is characterised by **vortex stretching** (absent in 2D) transferring energy to progressively smaller scales until viscous dissipation converts kinetic energy to heat. This **energy cascade** (Kolmogorov 1941) determines the statistics of turbulent flows.

## 6.2 The Reynolds Decomposition

Osborne Reynolds (1895) introduced the decomposition that still bears his name: split each quantity into a **mean** (time-averaged) and a **fluctuation**:

\[
u_i = \overline{u}_i + u'_i, \qquad p = \bar{p} + p'
\]

where \(\overline{u'_i} = 0\) by definition of the mean. Substituting into the Navier–Stokes equations and averaging:

<div class="theorem">
<strong>Reynolds-Averaged Navier–Stokes (RANS) Equations.</strong>
\[
\frac{\partial\overline{u}_i}{\partial x_i} = 0, \qquad \overline{u}_j\frac{\partial\overline{u}_i}{\partial x_j} = -\frac{1}{\rho}\frac{\partial\overline{p}}{\partial x_i} + \nu\frac{\partial^2\overline{u}_i}{\partial x_j^2} - \frac{\partial}{\partial x_j}\overline{u'_i u'_j}
\]
</div>

The term \(-\rho\overline{u'_i u'_j}\) is the **Reynolds stress tensor**: the mean momentum flux due to turbulent fluctuations. It plays the same formal role as the viscous stress, but it is orders of magnitude larger in fully turbulent flows. The fundamental difficulty of turbulence theory — the **closure problem** — is that the RANS equations for the means involve unknowns (the Reynolds stresses), and equations for the Reynolds stresses involve higher-order correlations, and so on without end.

## 6.3 Turbulent Kinetic Energy and the Closure Problem

The **turbulent kinetic energy** (TKE) is:
\[
k = \frac{1}{2}\overline{u'_i u'_i}
\]

Its transport equation (derived by multiplying the fluctuation equation by \(u'_i\) and averaging) takes the form:
\[
\frac{Dk}{Dt} = \mathcal{P} - \varepsilon + \nabla \cdot (\text{diffusive flux})
\]

where \(\mathcal{P} = -\overline{u'_i u'_j}\,\partial\overline{u}_i/\partial x_j\) is the **production** of TKE by interaction of Reynolds stresses with the mean flow shear, and \(\varepsilon = \nu\overline{(\partial u'_i/\partial x_j)^2}\) is the **viscous dissipation rate** — the rate at which turbulent kinetic energy is converted to heat.

The closure problem is acute for the dissipation rate. Kolmogorov's 1941 theory provides a statistical framework: in the **inertial subrange** (scales between the energy-containing large eddies and the dissipation-scale Kolmogorov eddies), the energy spectrum follows:
\[
E(k) = C\varepsilon^{2/3} k^{-5/3}
\]
where \(C \approx 1.5\) is the Kolmogorov constant. This \(k^{-5/3}\) power law is one of the most universally observed results in fluid turbulence, confirmed over many decades of wavenumber in atmospheric, oceanic, and laboratory experiments.

## 6.4 Wall Turbulence and the Logarithmic Layer

Near a solid wall, turbulence has a characteristic multi-layer structure. Define the friction velocity \(u_* = \sqrt{\tau_w/\rho}\) (where \(\tau_w\) is the wall shear stress) and the viscous length \(\ell_\nu = \nu/u_*\). The dimensionless wall distance is \(y^+ = y/\ell_\nu = u_* y/\nu\).

Three distinct regions exist:

**Viscous sublayer** (\(y^+ \lesssim 5\)): turbulent fluctuations are suppressed by the wall, viscous stress dominates, and the velocity profile is linear: \(u^+ = y^+\) where \(u^+ = \overline{u}/u_*\).

**Buffer layer** (\(5 \lesssim y^+ \lesssim 30\)): transition region where both viscous and turbulent stresses are comparable.

**Logarithmic (inertial) layer** (\(y^+ \gtrsim 30\), \(y \ll \delta\)): both viscosity and outer boundary conditions are irrelevant. By dimensional analysis alone, the only possible form of the velocity gradient is:

\[
\frac{d\overline{u}}{dy} = \frac{u_*}{\kappa y}
\]

Integrating:
\[
u^+ = \frac{1}{\kappa}\ln y^+ + B
\]

with **von Kármán constant** \(\kappa \approx 0.41\) and intercept \(B \approx 5.2\). This **logarithmic law of the wall** is remarkably universal: it holds for smooth and rough walls, pipes and boundary layers, gases and liquids, from laboratory experiments to atmospheric surface layers.

---

# Chapter 7: Geophysical Fluid Dynamics

## 7.1 The Rotating Reference Frame

The dynamics of Earth's atmosphere and oceans cannot be understood without accounting for the rotation of the Earth. In a reference frame rotating at angular velocity \(\boldsymbol{\Omega}\), additional apparent forces arise:

<div class="theorem">
<strong>Momentum Equation in a Rotating Frame.</strong>
\[
\frac{D\mathbf{u}}{Dt} + 2\boldsymbol{\Omega}\times\mathbf{u} = -\frac{1}{\rho}\nabla p - \nabla\Phi + \nu\nabla^2\mathbf{u}
\]
where \(\Phi = gz - \frac{1}{2}|\boldsymbol{\Omega}\times\mathbf{r}|^2\) is the combined gravitational-centrifugal potential (absorbed into a modified pressure in geophysical applications), and the **Coriolis acceleration** \(2\boldsymbol{\Omega}\times\mathbf{u}\) is the key new term.
</div>

The Coriolis force acts perpendicular to the velocity: in the Northern Hemisphere it deflects moving air to the right; in the Southern Hemisphere, to the left. This deflection is responsible for the counter-clockwise rotation of Northern Hemisphere cyclones (low-pressure systems) and the clockwise rotation of anticyclones. It is also responsible for trade winds, ocean gyres, and the jet streams.

On a local \(f\)-plane approximation at latitude \(\phi\), the local vertical component of the Coriolis parameter is:
\[
f = 2\Omega\sin\phi
\]

At the North Pole \(f = 2\Omega \approx 1.45 \times 10^{-4}\) s\(^{-1}\); at the equator \(f = 0\).

## 7.2 Geostrophic Balance

At large scales in the atmosphere and ocean (\(L \sim 10^3\) km, \(U \sim 10\) m/s), the Rossby number:
\[
Ro = \frac{U}{fL} \sim \frac{10}{10^{-4} \times 10^6} = 0.1
\]

is small. To leading order in \(Ro\), the Coriolis force balances the pressure gradient: this is **geostrophic balance**.

<div class="theorem">
<strong>Geostrophic Balance (horizontal components).</strong>
\[
f\mathbf{u}_g = \hat{z}\times\frac{1}{\rho}\nabla_h p \qquad \implies \qquad u_g = -\frac{1}{\rho f}\frac{\partial p}{\partial y}, \quad v_g = \frac{1}{\rho f}\frac{\partial p}{\partial x}
\]
The geostrophic flow is parallel to lines of constant pressure.
</div>

In the atmosphere, low-pressure systems (cyclones) have counter-clockwise geostrophic circulation in the Northern Hemisphere: wind flows around the low, not into it. This is completely opposite to what you might naively expect (wind blowing from high to low pressure) — and is entirely due to the Coriolis force.

## 7.3 The Taylor–Proudman Theorem

A remarkable consequence of rotation concerns three-dimensional flow at small Rossby number.

<div class="theorem">
<strong>Taylor–Proudman Theorem.</strong> In steady, inviscid, rapidly rotating flow (\(Ro \ll 1\)):
\[
(\boldsymbol{\Omega}\cdot\nabla)\mathbf{u} = 0
\]
The velocity field is independent of position along the rotation axis. Fluid columns aligned with the rotation axis move as rigid "Taylor columns."
</div>

The experimental demonstration by G.I. Taylor (1921) is beautiful: obstacles placed in a rotating tank of water generate columns of fluid that extend vertically far above the obstacle, deflecting the flow horizontally as if the column were a solid cylinder. The fluid "sees" the obstacle even where it cannot see it directly. This column rigidity has profound consequences for the dynamics of the Earth's liquid outer core and for the structure of large-scale atmospheric and oceanic eddies.

## 7.4 Rossby Waves

The most important wave in large-scale geophysical fluid dynamics is the **Rossby wave** (or planetary wave), driven by the variation of the Coriolis parameter with latitude. On a **\(\beta\)-plane** approximation, \(f \approx f_0 + \beta y\) where \(\beta = df/dy = 2\Omega\cos\phi/R_E\) (with \(R_E\) the Earth's radius).

Considering linearised perturbations about a state of rest with barotropic (depth-independent) flow, the vorticity equation gives the Rossby wave dispersion relation:

<div class="theorem">
<strong>Rossby Wave Dispersion Relation.</strong>
\[
\omega = -\frac{\beta k}{k^2 + l^2 + f_0^2/c^2}
\]
where \(k\) and \(l\) are the eastward and northward wavenumbers, and \(c = \sqrt{gH}\) is the shallow-water gravity wave speed.
</div>

Two features are immediately striking. First, \(\omega < 0\) always (since \(\beta > 0\) in both hemispheres and the phase speed in the \(k\)-direction is \(c_p = \omega/k < 0\)): Rossby waves always propagate westward relative to the mean flow. Second, the group velocity in the \(x\)-direction is:
\[
c_{gx} = \frac{\partial\omega}{\partial k} = \frac{\beta(k^2 - l^2)}{(k^2 + l^2 + f_0^2/c^2)^2}
\]
which can be positive or negative depending on the wavenumber. Long Rossby waves carry energy westward; short Rossby waves carry energy eastward.

## 7.5 Stratification and Internal Waves

In addition to rotation, geophysical fluids are typically **stratified**: their density varies with depth due to temperature and salinity gradients. The buoyancy force on a vertically displaced fluid parcel provides a restoring mechanism that supports **internal gravity waves**.

Define the **buoyancy frequency** (Brunt–Väisälä frequency):
\[
N^2 = -\frac{g}{\rho_0}\frac{d\bar{\rho}}{dz}
\]

where \(\bar{\rho}(z)\) is the background density profile. When \(N^2 > 0\) (density decreasing upward — stably stratified), a vertically displaced parcel oscillates at frequency \(N\); when \(N^2 < 0\) (density increasing upward), the stratification is unstable and convection occurs.

The dispersion relation for internal gravity waves in a uniformly stratified fluid is:

\[
\omega^2 = N^2 \frac{k^2 + l^2}{k^2 + l^2 + m^2} = N^2\sin^2\theta
\]

where \(m\) is the vertical wavenumber and \(\theta\) is the angle of the wave vector from the vertical. This has a remarkable geometric interpretation: the frequency depends only on the angle of propagation, not the magnitude of the wavenumber. Equally remarkable: the group velocity is perpendicular to the phase velocity — energy travels horizontally while wave crests tilt. Internal waves are responsible for the stirring of the deep ocean interior, the generation of microstructure at density interfaces, and the mixing that drives the global thermohaline circulation.

---

# Chapter 8: Nonlinear Waves — AMATH 867

*This chapter extends the course into graduate territory, covering the topics of AMATH 867 (Nonlinear Waves). The central question: what happens when the small-amplitude assumption of linear wave theory breaks down?*

## 8.1 Beyond Linearity — The Need for Nonlinear Theory

Linear wave theory, which dominated Chapters 3 and 7, rests on the assumption that wave amplitudes are small enough that nonlinear terms in the governing equations can be neglected. This approximation captures the dispersion relation, the group velocity, and the spatial structure of waves — but it fundamentally misses phenomena that arise from wave-wave interactions:

- A wave steepens into a shock (as in a sonic boom or a breaking ocean wave)
- Two pulses pass through each other and emerge unchanged (solitons)
- A broad spectrum of waves redistributes energy across wavenumbers (wave turbulence)
- Modulational instability breaks a uniform wavetrain into localised packets (the Benjamin–Feir instability of ocean waves)

The mathematics of nonlinear waves draws on the method of characteristics, weakly nonlinear asymptotics, and the theory of integrable systems. The goal is not merely to find solutions but to understand the qualitative character of wave dynamics when amplitude matters.

## 8.2 Method of Characteristics and First-Order Conservation Laws

The simplest nonlinear wave equation is the **inviscid Burgers equation** (or the scalar conservation law):

\[
\frac{\partial u}{\partial t} + u\frac{\partial u}{\partial x} = 0
\]

This is the nonlinear advection equation: each value of \(u\) advects at its own speed \(u\). Unlike the linear advection equation \(\partial_t u + c\, \partial_x u = 0\) (where all parts of the signal move at the same speed \(c\)), faster-moving parts of the wave profile overtake slower-moving parts, causing the wave to **steepen**.

The **method of characteristics** converts this PDE into a family of ODEs. Define characteristic curves \(x = x(t)\) along which:
\[
\frac{dx}{dt} = u, \qquad \frac{du}{dt} = 0
\]

Along each characteristic, \(u\) is constant. So characteristic \(C\) starting at \(x_0\) carries the initial value \(u_0 = u(x_0, 0)\) and has equation \(x = x_0 + u_0 t\). The solution is implicitly:
\[
u(x,t) = u_0(x - ut)
\]

Characteristics are straight lines in the \((x,t)\) plane. When characteristics from different initial points converge — when \(\partial u_0/\partial x_0 < 0\) somewhere — they eventually cross at a finite time:

\[
t_{break} = \frac{-1}{\min_x\bigl(\partial u_0/\partial x\bigr)}
\]

At \(t = t_{break}\), the solution becomes multi-valued: the wave has **broken**. Physically, the steep wave front has steepened to a vertical slope and then to an overhang — which is unphysical. The solution beyond breaking must be interpreted as a **shock**: a discontinuity satisfying a **jump condition** (the Rankine–Hugoniot relation) derived from the integral conservation law.

## 8.3 Shock Formation and the Rankine–Hugoniot Condition

A shock at position \(x = s(t)\) satisfies the integral conservation law for the original PDE. For the scalar conservation law \(\partial_t u + \partial_x F(u) = 0\):

\[
\frac{ds}{dt} = \frac{F(u_R) - F(u_L)}{u_R - u_L}
\]

where \(u_L\) and \(u_R\) are the values of \(u\) immediately to the left and right of the shock. For Burgers' equation \(F(u) = u^2/2\), this gives shock speed \(s'(t) = (u_L + u_R)/2\) — the average of the speeds on either side.

An additional condition — the **entropy condition** — selects the physically correct (stable) shock from among all weak solutions. For Burgers' equation: \(u_L > u_R\) (faster fluid behind, slower ahead — this is the steepening condition). Shocks satisfying the entropy condition are **stable** and those violating it are **unstable** (they split into rarefactions).

## 8.4 Weakly Nonlinear Waves — The Stokes Expansion

For wave problems, the characteristic approach gives shocks, but many physical waves do not shock: they are dispersive, meaning different wavenumbers travel at different speeds, and dispersion can balance nonlinear steepening. The regime of **weakly nonlinear waves** is where both effects are comparable.

The strategy is to expand the wave amplitude in a small parameter \(\epsilon\):
\[
u = \epsilon u_1 + \epsilon^2 u_2 + \epsilon^3 u_3 + \cdots
\]

At order \(\epsilon\), we recover the linear solution. At order \(\epsilon^2\), the nonlinear terms in the original equation drive a correction. Secular terms (terms that grow without bound in time) arise at successive orders unless the linear solution's amplitude and phase are allowed to evolve slowly.

This is the **method of multiple scales** or **modulation theory**. We introduce a slow time \(T = \epsilon t\) and slow space \(X = \epsilon x\) alongside the fast oscillatory variables. The linear solution has the form:
\[
u_1 = A(X,T)\, e^{i(kx - \omega t)} + \text{c.c.}
\]

where the complex amplitude \(A(X,T)\) varies slowly. Requiring the \(\epsilon^2\) and \(\epsilon^3\) equations to be non-secular imposes equations on \(A\). At leading order: \(A\) propagates at the group velocity, \(\partial A/\partial T + c_g\, \partial A/\partial X = 0\). At next order, the interplay of dispersion and nonlinearity yields the **nonlinear Schrödinger equation** (NLS):

\[
i\frac{\partial A}{\partial T} + \frac{1}{2}\omega''\frac{\partial^2 A}{\partial X^2} + \gamma|A|^2 A = 0
\]

where \(\omega'' = d^2\omega/dk^2\) is the dispersion coefficient and \(\gamma\) is a nonlinear coefficient depending on the specific physical problem. The NLS governs the slow evolution of the wave envelope for a broad class of dispersive nonlinear wave problems, from water waves to optical pulses in fibres.

## 8.5 Modulational Instability (Benjamin–Feir)

The NLS has a remarkable consequence: a uniform wavetrain \(A = A_0 e^{i\gamma A_0^2 T}\) (a wave of constant amplitude) is **unstable** to long-wavelength perturbations when \(\omega'' \gamma > 0\). This is the **Benjamin–Feir instability** (1967), discovered simultaneously by Lighthill.

The instability works as follows: a slight amplitude modulation grows exponentially because the nonlinearity shifts the local frequency, creating phase focusing that concentrates energy. The initially uniform wavetrain disintegrates into a series of wave groups — localized packets of high amplitude separated by nearly calm water. In oceanography, this is the mechanism behind **rogue waves**: apparently spontaneous extreme waves that emerge from a nearly uniform ocean swell.

The growth rate of the Benjamin–Feir instability for perturbation wavenumber \(K\) is:
\[
\sigma = \frac{\omega''}{2}\sqrt{K^2\!\left(\frac{4\gamma A_0^2}{\omega''} - K^2\right)}
\]

Maximum growth occurs at \(K = K_{max} = \sqrt{2\gamma A_0^2/\omega''}\). Perturbations with \(K > K_{max}\) are stable; the instability band is \(0 < K < 2K_{max}\).

## 8.6 The Korteweg–de Vries Equation and Solitons

A different balance — between nonlinear steepening and weak dispersion — produces the **Korteweg–de Vries (KdV) equation**. Consider long, weakly nonlinear shallow-water waves. The full nonlinear shallow-water equations, expanded in the wave amplitude \(\epsilon\) and the longwave parameter \(\mu = (kH)^2\), give at leading order (the Boussinesq regime \(\epsilon \sim \mu \ll 1\)):

\[
\frac{\partial\eta}{\partial t} + c_0\frac{\partial\eta}{\partial x} + \frac{3c_0}{2H}\eta\frac{\partial\eta}{\partial x} + \frac{c_0 H^2}{6}\frac{\partial^3\eta}{\partial x^3} = 0
\]

In a frame moving at \(c_0 = \sqrt{gH}\), this simplifies to the **KdV equation**:

\[
\frac{\partial\eta}{\partial t} + \frac{3c_0}{2H}\eta\frac{\partial\eta}{\partial x} + \frac{c_0 H^2}{6}\frac{\partial^3\eta}{\partial x^3} = 0
\]

The second term is nonlinear steepening; the third is dispersive spreading from the third-derivative term.

The KdV equation admits an exact **solitary wave** (soliton) solution:
\[
\eta(x,t) = a\, \text{sech}^2\!\left(\sqrt{\frac{3a}{4H^3}}\,(x - ct)\right), \qquad c = c_0\!\left(1 + \frac{a}{2H}\right)
\]

This is a localised wave of elevation, propagating without change of shape at speed \(c > c_0\). Crucially:
- Taller solitons are narrower and faster
- Solitons interact **elastically**: two solitons collide, interpenetrate, and emerge with their original shapes — only a phase shift remains

This elastic interaction was the first observation (by John Scott Russell in 1834, theorised by Boussinesq and finally by Korteweg and de Vries in 1895) that suggested waves could behave like particles. The discovery in the 1960s that the KdV equation is **completely integrable** — solvable by the inverse scattering transform — sparked the modern theory of integrable systems and revealed an infinite hierarchy of conserved quantities.

## 8.7 Inverse Scattering and Complete Integrability

The **inverse scattering transform** (IST, developed by Gardner, Greene, Kruskal, and Miura in 1967) is to nonlinear wave equations what the Fourier transform is to linear PDEs. The idea: map the initial condition \(\eta(x,0)\) to the scattering data of an associated linear Schrödinger equation (the **direct problem**), evolve the scattering data forward in time using simple linear equations, then reconstruct \(\eta(x,t)\) from the evolved scattering data (the **inverse problem**).

The scattering data consists of:
- **Bound states** (discrete eigenvalues): each corresponds to a soliton. There are exactly \(N\) solitons in the solution if the initial condition admits \(N\) bound states.
- **Radiation** (continuous spectrum): dispersive waves that spread and decay.

For any initial condition, the KdV equation evolves toward a superposition of solitons plus a decaying dispersive tail — the solitons emerge, separate by speed, and propagate to infinity. This gives a complete, nonlinear analogue of normal-mode decomposition.

## 8.8 WKB Theory: Dispersive Waves in Inhomogeneous Media

When the medium through which a wave propagates varies slowly in space — stratification changing with depth, water shoaling toward a beach, a slowly varying background current — the wave cannot be a pure plane wave with fixed wavenumber and frequency. Yet if the scale of variation \(L\) of the medium is much larger than the wavelength \(\lambda\), something close to a locally plane wave holds at each point.

The **WKB method** (after Wentzel, Kramers, and Brillouin, though the technique was known to Liouville and Green a century earlier) provides a systematic expansion in the small parameter \(\epsilon = \lambda/L \ll 1\). We seek solutions of the form:
\[
u(\mathbf{x}, t) = A(\mathbf{x}, t)\, e^{i\theta(\mathbf{x}, t)/\epsilon} + \text{c.c.}
\]
where \(A\) is a slowly varying complex amplitude and \(\theta\) a rapidly varying phase. The **local wavenumber and frequency** are \(\mathbf{k} = \nabla\theta\) and \(\omega = -\partial\theta/\partial t\). These satisfy the compatibility condition \(\partial\mathbf{k}/\partial t + \nabla\omega = 0\), and together with the local dispersion relation \(\omega = \Omega(\mathbf{k}, \mathbf{x}, t)\) (now dependent on the slowly varying medium), they yield the **ray equations**:
\[
\frac{d\mathbf{x}}{dt} = \frac{\partial\Omega}{\partial\mathbf{k}} = \mathbf{c}_g, \qquad \frac{d\mathbf{k}}{dt} = -\frac{\partial\Omega}{\partial\mathbf{x}}
\]

These are Hamilton's equations in disguise: wavenumber plays the role of momentum, position the role of coordinates. Wave packets travel along **rays** — the characteristics of the kinematic equations — at the local group velocity.

For **shoaling ocean waves** approaching a beach, the depth \(H(x)\) decreases shoreward, so \(c_g = \sqrt{gH}\) decreases, the wavenumber \(k\) increases (wavelengths shorten), and amplitude grows. Whitham's (1965) **wave action conservation** gives \(\mathcal{A} = E/\omega = A^2/(2\omega) = \text{const}\) along a ray:
\[
\frac{\partial\mathcal{A}}{\partial t} + \nabla\cdot(\mathbf{c}_g \mathcal{A}) = 0
\]
Wave action (not wave energy) is the adiabatic invariant conserved in a slowly varying medium — the direct analogue of the classical mechanical adiabatic invariant \(J = \oint p\, dq\). Energy is not conserved when the medium varies in time; action is.

For **internal waves in a stratified ocean**, rays refract as \(N(z)\) varies with depth, channelling wave energy into narrow beams and driving diapycnal mixing. At a **caustic** — a surface where rays converge and the WKB amplitude formally diverges — an Airy-function analysis replaces the leading-order WKB, capturing the wave tunnelling and the structure of the focal region. Caustics are the generic focusing surfaces of ray theory, ubiquitous in acoustics, optics, and geophysical wave propagation.

## 8.9 Nonlinear Resonant Interactions

When two or more waves coexist in a dispersive medium, they interact through the nonlinear terms in the governing equations. Most interactions are **non-resonant**: they produce oscillations at combination frequencies that quickly average to zero. For special combinations satisfying **resonance conditions**, however, the interaction is sustained and leads to significant energy exchange.

**Three-wave resonance** requires simultaneously:
\[
\mathbf{k}_1 + \mathbf{k}_2 = \mathbf{k}_3, \qquad \omega(\mathbf{k}_1) + \omega(\mathbf{k}_2) = \omega(\mathbf{k}_3)
\]
When both conditions hold, a third wave grows secularly from the quadratic interaction of the first two, or a primary wave decays into two daughter waves (parametric decay instability). The **triad amplitude equations** take the universal form:
\[
\dot{A}_1 = \gamma A_2^* A_3, \qquad \dot{A}_2 = \gamma A_1^* A_3, \qquad \dot{A}_3 = -\gamma A_1 A_2
\]
with conserved **Manley–Rowe relations** \(|A_1|^2 + |A_3|^2 = \text{const}\) and \(|A_2|^2 + |A_3|^2 = \text{const}\). Whether three-wave resonance is possible depends on the geometry of the dispersion surface. For deep-water gravity waves (\(\omega = \sqrt{gk}\)), the dispersion curve is convex and three-wave resonance among waves of the same type is impossible — four-wave resonance dominates instead.

**Four-wave resonance** requires:
\[
\mathbf{k}_1 + \mathbf{k}_2 = \mathbf{k}_3 + \mathbf{k}_4, \qquad \omega_1 + \omega_2 = \omega_3 + \omega_4
\]
For deep-water gravity waves, these resonant quartets drive the slow evolution of the ocean wave spectrum (Hasselmann 1962): energy is transferred from the spectral peak toward both lower and higher frequencies. This is the dominant nonlinear process in operational wave forecasting models.

**Wave turbulence** (weak turbulence theory) treats the statistics of many resonantly interacting waves with random phases. Zakharov (1965–1968) found that the kinetic equations for the wave action spectrum \(n(\mathbf{k},t)\) admit exact stationary power-law solutions — the **Kolmogorov–Zakharov spectra** — analogous to Kolmogorov's \(k^{-5/3}\) spectrum in strong turbulence but derived from first principles. These spectra describe the steady state in which wave action cascades through wavenumber space via resonant interactions, from the forcing scale to the dissipation scale.

## 8.10 Weakly Nonlocal Solitary Waves and Beyond-All-Orders Asymptotics

Classical solitons — the \(\text{sech}^2\) solutions of the KdV equation — are spatially **localised** and propagate without radiation. This perfection is special to completely integrable equations. For nearby but non-integrable equations — the fifth-order KdV, capillary-gravity water waves near the Bond-number resonance \(Bo = 1/3\) — true solitons do not exist. Instead, the system supports **weakly nonlocal solitary waves**: structures with a soliton-like core but small-amplitude oscillatory tails extending to infinity.

The canonical example is the **fifth-order KdV equation**:
\[
u_t + uu_x + u_{xxx} + \epsilon^2 u_{xxxxx} = 0
\]
The classical KdV soliton has phase velocity within the linear wave spectrum — linear waves of the same speed exist — so the soliton continuously radiates into these waves. The radiating tail has amplitude:
\[
A_{\text{tail}} \sim C\, e^{-\pi/(2\epsilon)}
\]
This contains \(e^{-1/\epsilon}\), which vanishes faster than any power of \(\epsilon\). Such terms are **beyond all orders** of the power series in \(\epsilon\): they are invisible at every finite order of perturbation theory. This is why decades of perturbation calculations missed them entirely.

**Beyond-all-orders asymptotics** (exponential asymptotics) is the framework for computing these effects. The formal power series in \(\epsilon\) is **divergent**: the \(n\)-th coefficient grows like \(n!\). Optimal truncation — stopping at the smallest term — gives an exponentially accurate approximation. The **remainder** at optimal truncation is precisely the exponentially small tail, and can be computed by tracking the **Stokes lines** in the complex \(x\)-plane — curves across which the exponentially small contribution switches on (the classical Stokes phenomenon). Evaluating this switching gives the prefactor \(C\) explicitly (Yang and Akylas 1996; Boyd 1990).

Beyond solitary waves, exponential asymptotics appears in: quantum tunnelling rates (imaginary-time paths in Feynman integrals); Stokes phenomenon in the Airy equation and its generalisations; **resurgence** in quantum field theory, where non-perturbative effects (instantons) are related to the large-order growth of perturbation series; and the theory of water waves near parametric forcing resonances.

---

# Chapter 9: Hydrodynamic Stability — AMATH 863

*This chapter extends the course into graduate territory, covering the topics of AMATH 863 (Hydrodynamic Stability and Turbulence). The central question: given a known laminar flow, is it stable to small perturbations?*

## 9.1 The Stability Problem

Every exact solution of the Navier–Stokes equations represents a possible flow — but not every possible flow is **stable** and therefore observable in practice. A flow is stable if small perturbations applied to it decay in time; it is unstable if some perturbation grows. The transition from laminar to turbulent flow is the most practically important manifestation of hydrodynamic instability.

The general approach is **linear stability analysis**:
1. Take a known base flow \(\overline{\mathbf{u}}(\mathbf{x})\)
2. Perturb it: \(\mathbf{u} = \overline{\mathbf{u}} + \varepsilon\mathbf{u}'(\mathbf{x},t)\) with \(|\varepsilon| \ll 1\)
3. Linearise the Navier–Stokes equations in \(\varepsilon\)
4. Seek modal solutions \(\mathbf{u}' \propto e^{ikx - i\omega t}\) (normal modes)
5. Determine whether \(\text{Im}(\omega) > 0\) (growing) or \(\text{Im}(\omega) < 0\) (decaying)

A flow is **linearly stable** if all normal modes decay (\(\text{Im}(\omega) < 0\) for all \(k\)). It is **linearly unstable** if any mode grows. Linear theory describes the onset and initial growth of instability; nonlinear theory is needed to describe the saturated state.

## 9.2 Normal Mode Analysis — The Orr–Sommerfeld Equation

Consider a 2D parallel shear flow \(\overline{\mathbf{u}} = (U(y), 0)\) — plane Poiseuille flow, plane Couette flow, a boundary layer profile. Introducing the stream function perturbation \(\psi' = \phi(y)e^{i(kx - \omega t)}\), the linearised Navier–Stokes equations reduce to a single ODE for the complex amplitude \(\phi(y)\):

<div class="theorem">
<strong>Orr–Sommerfeld Equation.</strong>
\[
(U - c)(\phi'' - k^2\phi) - U''\phi = \frac{1}{ikRe}(\phi'''' - 2k^2\phi'' + k^4\phi)
\]
where \(c = \omega/k\) is the complex wave speed, \(Re = UL/\nu\), and primes denote differentiation with respect to \(y\).
</div>

This fourth-order ODE with complex coefficients requires four boundary conditions: \(\phi = \phi' = 0\) at each wall (no-slip and no-penetration). For a given \(k\) and \(Re\), the eigenvalue \(c\) is found. The flow is unstable if \(\text{Im}(c) > 0\) for any \(k\).

The Orr–Sommerfeld equation is the central object of viscous stability theory. In the inviscid limit \(Re \to \infty\), it reduces to the **Rayleigh equation**:
\[
(U-c)(\phi'' - k^2\phi) - U''\phi = 0
\]

## 9.3 Rayleigh's Inflection Point Criterion

<div class="theorem">
<strong>Rayleigh's Inflection Point Criterion (1879).</strong> A necessary condition for inviscid instability of a parallel shear flow \(U(y)\) is that the velocity profile has an <strong>inflection point</strong> where \(U'' = 0\).
</div>

The proof proceeds by multiplying the Rayleigh equation by \(\phi^* / (U-c)^*\), integrating, and taking the imaginary part. The existence of an inflection point is not sufficient — a sharper condition is due to Fjørtoft (1950) — but its absence is sufficient for stability.

Physical interpretation: inflection points are locations of maximum shear, where vorticity gradients can drive an exponential Kelvin–Helmholtz-like instability. Profiles without inflection points — parabolic Poiseuille flow, Couette flow — are inviscidly stable. Yet they transition to turbulence in practice! Viscosity, counterintuitively, can be **destabilising** for these flows, as it modifies the phase relationship between the perturbation velocity and the vorticity, allowing the Orr–Sommerfeld modes to extract energy from the mean flow.

## 9.4 Kelvin–Helmholtz Instability

The **Kelvin–Helmholtz (KH) instability** arises at the interface between two fluids moving at different velocities — a shear layer. The idealised problem: fluid of density \(\rho_1\) moving at velocity \(U_1\) above fluid of density \(\rho_2\) moving at velocity \(U_2\), separated by a flat interface. Linearising the inviscid equations and matching boundary conditions at the interface:

<div class="theorem">
<strong>Kelvin–Helmholtz Dispersion Relation.</strong>
\[
\omega = k\frac{\rho_1 U_1 + \rho_2 U_2}{\rho_1 + \rho_2} \pm \sqrt{gk\frac{\rho_1-\rho_2}{\rho_1+\rho_2} - k^2\frac{\rho_1\rho_2(U_1-U_2)^2}{(\rho_1+\rho_2)^2}}
</div>

The flow is unstable (\(\text{Im}(\omega) \neq 0\)) when the expression under the square root is negative:
\[
k > k_c = \frac{g(\rho_1^2 - \rho_2^2)}{\rho_1\rho_2(U_1-U_2)^2}
\]

For \(\rho_1 = \rho_2\) (no density difference): **always unstable** for any non-zero velocity difference, at all wavenumbers. Surface tension modifies this by stabilising short waves.

The KH instability is ubiquitous: it is responsible for the formation of ocean surface waves by wind, for billows at the tropopause (clear-air turbulence), for the generation of vortices in mixing layers, and for instabilities in astrophysical jets. The beautiful billowing cat's-eye patterns visible in clouds and in laboratory stratified shear layers are the nonlinear manifestation of this linear instability.

## 9.5 Rayleigh–Taylor Instability

The **Rayleigh–Taylor (RT) instability** arises when a denser fluid overlies a lighter fluid under gravity — the classic "heavy fluid over light fluid" problem. Even in the absence of mean flow, the configuration is unstable.

For two semi-infinite, inviscid, irrotational layers with densities \(\rho_2 > \rho_1\) (heavy over light), with gravity \(g\) acting downward:
\[
\omega^2 = gk\frac{\rho_1 - \rho_2}{\rho_1 + \rho_2} < 0 \quad \text{(since } \rho_2 > \rho_1\text{)}
\]

So \(\omega\) is purely imaginary, with growth rate:
\[
\sigma = \text{Im}(\omega) = \sqrt{gk\frac{\rho_2 - \rho_1}{\rho_1 + \rho_2}}
\]

Short waves grow faster: the RT instability is **ultraviolet** (high-\(k\)) unstable. Surface tension \(\sigma_T\) stabilises short waves with \(k > k_c = \sqrt{g(\rho_2-\rho_1)/\sigma_T}\), but long waves (\(k < k_c\)) remain unstable. The nonlinear evolution produces the spectacular mushroom clouds and fingers characteristic of this instability, seen in inertial confinement fusion implosions, supernova remnants, and ink dropping into water.

## 9.6 Rayleigh–Bénard Convection

**Rayleigh–Bénard convection** is the instability of a fluid layer heated uniformly from below. A horizontal layer of fluid of depth \(d\) is maintained at temperature \(T_0 + \Delta T\) at the bottom and \(T_0\) at the top. The density is lower at the bottom (since hot fluid expands), so this is a potentially unstable density stratification — but viscosity and thermal diffusion work against it.

The competition is characterised by the **Rayleigh number**:
\[
Ra = \frac{g\alpha\Delta T d^3}{\nu\kappa}
\]

where \(\alpha\) is the thermal expansion coefficient, \(\kappa\) the thermal diffusivity, \(\nu\) the kinematic viscosity. The Rayleigh number is the ratio of buoyancy driving to diffusive damping.

<div class="theorem">
<strong>Onset of Convection (Linear Theory).</strong> Rayleigh–Bénard convection first becomes unstable at a critical Rayleigh number \(Ra_c\). For stress-free (slip) boundaries:
\[
Ra_c = \frac{27\pi^4}{4} \approx 657.5
\]
For no-slip boundaries (the physical case), \(Ra_c \approx 1708\). Below \(Ra_c\), the fluid is stationary; above, convection rolls develop.
</div>

The onset occurs at a **critical wavenumber** \(k_c\), corresponding to convection cells with a specific aspect ratio. This is a beautiful example of a **bifurcation**: a qualitative change in the nature of the steady state as a parameter (\(Ra\)) crosses a threshold.

Beyond \(Ra_c\), convection rolls are steady; at higher \(Ra\), they undergo further bifurcations — oscillatory convection, then chaotic convection, and ultimately turbulent convection. Rayleigh–Bénard turbulence at very high \(Ra\) is the model for convection in the Earth's mantle, the Sun's convection zone, and the atmospheres of giant planets.

## 9.7 Energy Methods and Nonlinear Stability

Linear stability theory determines whether infinitesimal perturbations grow. But it says nothing about the stability of flows to **finite-amplitude** perturbations. A flow can be linearly stable yet jump to turbulence when perturbed sufficiently strongly — this is precisely what happens in pipe flow (Hagen–Poiseuille), which is linearly stable for all \(Re\) yet turbulent in practice above \(Re \approx 2300\).

The **energy method** (Serrin 1959, Joseph 1976) provides rigorous nonlinear stability results. Define the perturbation energy:
\[
E(t) = \frac{1}{2}\int_\mathcal{V} |\mathbf{u}'|^2\, dV
\]

Taking the time derivative and using the Navier–Stokes equations for the perturbation:
\[
\frac{dE}{dt} = -\int_\mathcal{V} u'_i u'_j\frac{\partial\overline{u}_i}{\partial x_j}\, dV - \nu\int_\mathcal{V} |\nabla\mathbf{u}'|^2\, dV
\]

The first integral is energy **production** from the mean flow shear; the second is viscous **dissipation**. If the ratio of production to dissipation is bounded above by 1, then \(dE/dt \leq 0\) and the perturbation must decay — regardless of its amplitude.

This yields a **global stability threshold** \(Re_E\) (the energy Reynolds number): for \(Re < Re_E\), all perturbations, however large, decay monotonically. For pipe flow, \(Re_E \approx 81.5\). The gap between \(Re_E = 81.5\) and the experimental transition threshold \(Re \approx 2300\) is a region where small perturbations decay but large ones can sustain themselves — the realm of subcritical transition and turbulent puffs, which remains an active research area.

## 9.8 Centrifugal Instability — Taylor–Couette Flow

**Centrifugal instability** arises in rotating flows when the centrifugal force on a radially displaced fluid ring exceeds the restoring pressure gradient, so the ring continues outward rather than returning. It is the rotational analogue of Rayleigh–Taylor instability, and it produces the most visually stunning sequence of bifurcations in fluid mechanics.

The canonical example is **Taylor–Couette flow**: viscous fluid between two coaxial cylinders of radii \(R_1 < R_2\), rotating at angular velocities \(\Omega_1\) and \(\Omega_2\). The base flow is an azimuthal profile:
\[
V(r) = Ar + \frac{B}{r}, \qquad A = \frac{\Omega_2 R_2^2 - \Omega_1 R_1^2}{R_2^2 - R_1^2}, \quad B = \frac{(\Omega_1 - \Omega_2)R_1^2 R_2^2}{R_2^2 - R_1^2}
\]

The inviscid stability criterion was derived by Lord Rayleigh (1916) using an elegant physical argument. Consider a fluid ring at radius \(r_0\) with angular momentum \(L_0 = r_0 V(r_0)\). Displaced to \(r_0 + \delta r\) with angular momentum conserved (inviscid), the ring's velocity becomes \(V' = L_0/(r_0 + \delta r)\). The centrifugal acceleration of the displaced ring exceeds that of the ambient fluid if and only if \(L(r)^2 = (rV)^2\) decreases outward — in which case the ring feels a net outward force and the flow is unstable.

<div class="theorem">
<strong>Rayleigh's Circulation Criterion.</strong> An inviscid rotating flow \(V(r)\) is stable to axisymmetric perturbations if and only if the <strong>Rayleigh discriminant</strong>
\[
\Phi(r) = \frac{1}{r^3}\frac{d}{dr}(rV)^2
\]
is non-negative everywhere. Instability occurs wherever \(\Phi < 0\), i.e., wherever the angular momentum \(L = rV\) decreases outward.
</div>

With viscosity, the critical threshold is quantified by the **Taylor number**:
\[
Ta = \frac{\Omega_1^2 R_1^2 (R_2 - R_1)^3}{\nu^2 R_2}
\]

G.I. Taylor (1923) solved the viscous stability problem exactly and found instability at \(Ta_c \approx 1708\), predicting that the flow should develop **Taylor vortices** — a stack of toroidal counter-rotating cells stacked axially. Taylor famously photographed these vortices, providing one of the first quantitative agreements between linear stability theory and experiment. The match was precise to within a few percent: a landmark moment in the history of fluid mechanics.

Beyond the first bifurcation, Taylor–Couette flow undergoes a remarkably rich sequence as \(Ta\) increases: steady Taylor vortices → wavy vortices (the azimuthal symmetry breaks) → modulated wavy vortices → turbulent Taylor vortices → featureless turbulence. This cascade has been exhaustively studied as a paradigm for routes to turbulence, and each transition has been identified with a specific bifurcation type (pitchfork, Hopf, torus bifurcation). The system remains an important experimental and theoretical benchmark.

## 9.9 Barotropic Instability

**Barotropic instability** is the two-dimensional analogue of Kelvin–Helmholtz instability in a rotating geophysical fluid. It occurs in flows with no vertical structure (barotropic flows — pressure surfaces are horizontal and coincide with density surfaces) when perturbations can extract energy from the **horizontal shear** of the mean flow. It is responsible for the break-up of atmospheric jets and oceanic currents into synoptic-scale eddies.

On the \(\beta\)-plane, the linearised quasi-geostrophic potential vorticity equation for stream function perturbations \(\psi'\) to a zonal mean flow \(\overline{U}(y)\) is the **Rayleigh–Kuo equation**:
\[
(\overline{U} - c)\!\left(\frac{\partial^2\psi'}{\partial y^2} - k^2\psi'\right) + \left(\beta - \frac{\partial^2\overline{U}}{\partial y^2}\right)\psi' = 0
\]

This generalises the Rayleigh equation of §9.3 by replacing the vorticity gradient \(-U''\) with the **absolute vorticity gradient** \(\beta - U''\). The necessary condition for instability generalises accordingly:

<div class="theorem">
<strong>Rayleigh–Kuo Necessary Condition.</strong> A necessary condition for barotropic instability of a zonal flow \(\overline{U}(y)\) on a \(\beta\)-plane is that the meridional gradient of absolute vorticity
\[
q_y = \beta - \frac{\partial^2\overline{U}}{\partial y^2}
\]
changes sign somewhere in the domain.
</div>

When \(q_y = 0\) somewhere, Rossby waves propagating on the vorticity gradient can be over-reflected, extracting energy from the mean flow. The condition \(q_y = 0\) requires \(U_{yy} = \beta > 0\) — a region of strong positive curvature in the jet. Atmospheric jets (particularly the polar jet stream) can satisfy this condition at their flanks, generating barotropically unstable modes that grow into synoptic-scale eddies. In the ocean, the Gulf Stream and Kuroshio extension are subject to barotropic instability, producing the energetic meanders and rings observed by satellite.

## 9.10 Baroclinic Instability — The Eady Model

**Baroclinic instability** is the dominant instability mechanism in mid-latitude weather systems and one of the most important dynamical processes in geophysical fluid dynamics. Unlike barotropic instability, which involves purely horizontal shear of a vertically uniform flow, baroclinic instability operates in **stratified, rotating fluids** where the density surfaces (isopycnals) are tilted — as they are in the atmosphere, where temperature decreases poleward, and in the ocean, where salinity and temperature both create lateral density gradients.

The tilted isopycnal structure stores **available potential energy** — the potential energy that would be released if the density surfaces were flattened to horizontal. Baroclinic instability converts this potential energy into kinetic energy of growing eddies. The physical process is best visualised through the concept of slantwise convection: a fluid parcel can move along a slope that cuts across isopycnals, converting potential energy to kinetic energy, if the slope of the parcel path is shallower than the slope of the isopycnals. This is a weaker condition than simple vertical convection and is satisfied over vast regions of the mid-latitude atmosphere and ocean.

### The Eady Model

The simplest and most influential model of baroclinic instability is due to E.T. Eady (1949). The setup: a Boussinesq fluid between rigid horizontal lids at \(z = 0\) and \(z = H\), with uniform Coriolis parameter \(f\) (no \(\beta\)) and uniform buoyancy frequency \(N\). The mean flow is a vertical shear \(\overline{U}(z) = \Lambda z\) — a "thermal wind" balanced by a horizontal temperature gradient via the thermal wind relation \(f\partial U/\partial z = -(g/\rho_0)\partial\rho/\partial y\). The perturbation quasi-geostrophic potential vorticity equation in the interior is satisfied trivially (the interior QGPV gradient vanishes), so the dynamics are entirely controlled by temperature anomalies at the two boundaries.

Seeking normal mode solutions \(\psi' \propto e^{ik(x-ct)}\), the dispersion relation is:

<div class="theorem">
<strong>Eady Growth Rate.</strong> The complex phase speed for the Eady model satisfies:
\[
c = \frac{\Lambda H}{2} \pm \frac{\Lambda H}{2\mu}\sqrt{\left(\mu\coth\frac{\mu}{2} - 2\right)\!\left(2 - \mu\tanh\frac{\mu}{2}\right)}
\]
where \(\mu = kNH/f\) is the non-dimensional wavenumber. Instability (\(\text{Im}(c) \neq 0\)) occurs for \(\mu < \mu_c \approx 2.399\).
</div>

The maximum growth rate — achieved at \(\mu \approx 1.61\) — is:
\[
\sigma_{max} = \text{Im}(kc)_{max} \approx 0.31\frac{f\Lambda}{N}
\]

The corresponding most unstable wavelength is \(L^* \sim NH/f = L_R\) — the **Rossby deformation radius**. For the atmosphere, \(L_R \approx 1000\) km, consistent with the observed scale of mid-latitude cyclones. The e-folding growth time \(\sigma_{max}^{-1} \sim 1\) day matches the observed rapid intensification of extratropical storms.

### Mechanism: Coupled Edge Waves

The physical mechanism of Eady instability is beautifully transparent in terms of boundary Rossby waves. Each horizontal boundary supports a **temperature (Rossby) edge wave**: a wave whose amplitude decays away from the boundary, propagating along the boundary at a speed set by the mean temperature gradient there. In isolation, the lower-boundary wave propagates eastward and the upper-boundary wave propagates westward relative to the mean flow at each level.

For a specific vertical tilt between the two edge waves, they **phase-lock**: their relative propagation speeds cancel and they remain stationary relative to each other. When phase-locked with the correct tilt (upper wave lagging the lower by a quarter wavelength), the temperature anomaly of the upper wave is maximally correlated with the vertical velocity induced by the lower wave — the upper wave amplifies the lower, and vice versa. The result is **mutual amplification**: an exponentially growing mode. The Eady instability is thus a constructive interference between two vertically separated Rossby waves, held together against their natural tendency to drift apart by the shear of the mean flow.

### The Phillips Model and the Charney–Stern Condition

The **Phillips (1954) two-layer model** retains the \(\beta\)-effect, representing the atmosphere as two fluid layers each of uniform density. The stability analysis yields a generalised Rayleigh–Kuo condition, and the most important theoretical result is the:

<div class="theorem">
<strong>Charney–Stern Necessary Condition.</strong> A necessary condition for combined barotropic/baroclinic instability is that the meridional gradient of quasi-geostrophic potential vorticity \(q_y\) changes sign somewhere in the fluid domain — including the possibility of sign changes at the boundaries (where surface temperature gradients act as \(\delta\)-function contributions to \(q_y\)).
</div>

This result unifies barotropic instability (sign change of \(q_y = \beta - U_{yy}\) in the interior) and baroclinic instability (sign change at the boundaries — Eady model) into a single framework. It is the deepest and most general necessary condition for instability in quasi-geostrophic flows.

## 9.11 Homogeneous Isotropic Turbulence

The AMATH 863 curriculum treats the full spectrum of turbulence, from onset to the statistical theory of fully developed turbulence. The idealised case of **homogeneous isotropic turbulence** (HIT) — statistically uniform in all positions and directions — provides the theoretical foundation, even though it is never exactly realised in geophysical flows.

### Kolmogorov's 1941 Theory

Kolmogorov argued that at sufficiently high Reynolds number, there exists an **inertial subrange** of scales — larger than the dissipation scale but smaller than the energy-injection scale — in which neither forcing nor viscosity plays a direct role. In this range, the only relevant dimensional quantity is the energy dissipation rate \(\varepsilon\) [m²/s³]. Dimensional analysis then uniquely determines the energy spectrum:

\[
E(k) = C_K\, \varepsilon^{2/3} k^{-5/3}
\]

where \(C_K \approx 1.5\) is the **Kolmogorov constant**. This \(-5/3\) power law is one of the most celebrated results in theoretical physics: confirmed over more than five decades in wavenumber in atmospheric boundary layer data, oceanic measurements, wind tunnel experiments, and DNS. The Kolmogorov **microscale** — the scale at which viscous dissipation dominates — is:
\[
\eta = \!\left(\frac{\nu^3}{\varepsilon}\right)^{1/4}
\]

The ratio of energy-containing scale \(L\) to dissipation scale \(\eta\) grows as \(L/\eta \sim Re^{3/4}\), so the number of degrees of freedom in 3D turbulence scales as \(Re^{9/4}\). For ocean currents (\(Re \sim 10^{10}\)), resolving all scales requires \(\sim 10^{22.5}\) grid points — far beyond any foreseeable computer.

### Turbulence Closure

The **closure problem** (§6.2 of AMATH 463) is the central unsolved problem of turbulence theory: the RANS equations for the mean flow involve the Reynolds stress tensor \(\overline{u'_i u'_j}\), for which no exact equation in terms of mean quantities exists. Modern approaches:

- **\(k\)-\(\varepsilon\) models**: solve transport equations for TKE \(k\) and dissipation rate \(\varepsilon\), relating Reynolds stresses to \(k\), \(\varepsilon\), and mean strain via the Boussinesq hypothesis \(\overline{u'_i u'_j} = -2\nu_T S_{ij} + \frac{2}{3}k\delta_{ij}\), where \(\nu_T \propto k^2/\varepsilon\) is the turbulent viscosity
- **Large Eddy Simulation (LES)**: resolve scales larger than a filter width \(\Delta\), parameterise only subgrid scales; feasible for engineering Reynolds numbers
- **Direct Numerical Simulation (DNS)**: resolve all scales from \(L\) to \(\eta\); computationally exact but limited to \(Re \lesssim 10^4\)

### Stratified Turbulence and the Miles–Howard Criterion

**Stratification** fundamentally alters turbulence. The key parameter is the **Richardson number**:
\[
Ri = \frac{N^2}{(\partial U/\partial z)^2}
\]

<div class="theorem">
<strong>Miles–Howard Theorem (1961).</strong> A necessary condition for instability of a stratified parallel shear flow is \(Ri < 1/4\) somewhere in the flow. Equivalently, the flow is stable to all small perturbations if \(Ri \geq 1/4\) everywhere.
</div>

The proof — due to Miles (1961) with the Howard semicircle theorem providing the geometric picture — follows by multiplying the Taylor–Goldstein equation (the stratified analogue of the Rayleigh equation) by an appropriate function and integrating. When \(Ri < 1/4\), the kinetic energy of the shear can overcome the work done against buoyancy in vertically displacing fluid, allowing instability. The resulting turbulent mixing (Kelvin–Helmholtz billows in stratified flow) is the primary mechanism driving irreversible diapycnal mixing in the interior of the ocean — essential for the global thermohaline circulation.

At \(Ri \gg 1\), stratification strongly suppresses vertical motions. Turbulence becomes quasi-two-dimensional, with energy cascading to **larger** horizontal scales (an **inverse energy cascade**, as in 2D turbulence) rather than to smaller scales as in 3D. This two-dimensionalisation by stratification underlies the large horizontal coherence of oceanic mesoscale eddies and atmospheric jets, providing the dynamical bridge between the instabilities studied throughout this chapter and the organised large-scale structures observed in the geophysical world.
