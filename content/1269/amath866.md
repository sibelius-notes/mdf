---
title: "AMATH 866: Magnetohydrodynamics and Plasma Physics"
subjects: "AMATH"
---

*These notes synthesize material from P.A. Davidson's An Introduction to Magnetohydrodynamics, H. Goedbloed, R. Keppens, and S. Poedts's Magnetohydrodynamics of Laboratory and Astrophysical Plasmas, D. Biskamp's Nonlinear Magnetohydrodynamics, J.P. Freidberg's Ideal MHD, and supplementary material from Cambridge DAMTP MHD notes (Proctor, Tobias), Princeton Plasma Physics Laboratory lecture notes, and Oxford Mathematical Geoscience materials.*

---

## Chapter 1: Electromagnetic Foundations

Magnetohydrodynamics describes the behaviour of electrically conducting fluids — liquid metals, stellar interiors, accretion discs, the solar wind — in the presence of magnetic fields. Before we can couple electromagnetism to fluid mechanics, we must understand which parts of Maxwell's equations survive in the MHD limit and why. This chapter develops the electromagnetic foundations: the pre-Maxwell equations appropriate for slowly varying fields, the induction equation that governs the evolution of the magnetic field, and the celebrated frozen-in flux theorem of Alfvén.

### 1.1 Maxwell's Equations in Matter

We begin with the full Maxwell equations in a medium characterised by free charge density \(\rho_f\), free current density \(\mathbf{J}\), electric permittivity \(\varepsilon_0\), and magnetic permeability \(\mu_0\):

\[
\nabla \cdot \mathbf{E} = \frac{\rho_f}{\varepsilon_0}, \quad \nabla \cdot \mathbf{B} = 0,
\]

\[
\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}, \quad \nabla \times \mathbf{B} = \mu_0 \mathbf{J} + \mu_0 \varepsilon_0 \frac{\partial \mathbf{E}}{\partial t}.
\]

<div class="definition">
<strong>Definition 1.1 (Pre-Maxwell Equations).</strong> In the <em>MHD approximation</em>, the displacement current \(\mu_0 \varepsilon_0 \partial \mathbf{E}/\partial t\) is neglected. The resulting system is called the <em>pre-Maxwell</em> or <em>magnetostatic</em> set:

\[
\nabla \times \mathbf{B} = \mu_0 \mathbf{J}, \quad \nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}, \quad \nabla \cdot \mathbf{B} = 0.
\]
</div>

The justification for dropping the displacement current is a scale analysis. If the fluid moves with characteristic velocity \(U\) and the fields vary on a length scale \(L\), the ratio of the displacement current to the conduction current is of order \((U/c)^2\), where \(c = 1/\sqrt{\mu_0 \varepsilon_0}\) is the speed of light. For any non-relativistic flow, \(U \ll c\), and this ratio is negligible. The pre-Maxwell equations are thus the natural electromagnetic framework for MHD. Note that \(\nabla \times \mathbf{B} = \mu_0 \mathbf{J}\) immediately implies \(\nabla \cdot \mathbf{J} = 0\): currents are solenoidal, and there is no accumulation of free charge on MHD time scales.

<div class="remark">
<strong>Remark 1.1.</strong> The neglect of the displacement current eliminates electromagnetic waves (light) from the theory. MHD does support its own wave modes — Alfvén waves and magnetosonic waves — but these propagate at speeds characteristic of the fluid and magnetic field, far below \(c\). The MHD approximation is sometimes called the "non-relativistic" or "low-frequency" limit of electrodynamics.
</div>

### 1.2 Ohm's Law for Conducting Fluids

In a stationary conductor, Ohm's law is simply \(\mathbf{J} = \sigma \mathbf{E}\), where \(\sigma\) is the electrical conductivity. In a moving conductor, however, the relevant electric field is that seen in the frame co-moving with the fluid. For non-relativistic flows, the Lorentz transformation gives the electric field in the fluid frame as \(\mathbf{E}' = \mathbf{E} + \mathbf{u} \times \mathbf{B}\), where \(\mathbf{u}\) is the fluid velocity.

<div class="definition">
<strong>Definition 1.2 (Ohm's Law for a Moving Conductor).</strong> For an electrically conducting fluid with conductivity \(\sigma\) moving with velocity \(\mathbf{u}\), the generalised Ohm's law is

\[
\mathbf{J} = \sigma(\mathbf{E} + \mathbf{u} \times \mathbf{B}).
\]
In the limit \(\sigma \to \infty\) (ideal MHD), this reduces to \(\mathbf{E} + \mathbf{u} \times \mathbf{B} = \mathbf{0}\).
</div>

This is the simplest form of Ohm's law appropriate for MHD. More complete versions include the Hall term \(\mathbf{J} \times \mathbf{B}/(ne)\), electron pressure gradients, and electron inertia, but these corrections are important only at scales comparable to the ion skin depth or ion Larmor radius. For the bulk of classical MHD, the scalar conductivity form suffices.

<div class="remark">
<strong>Remark 1.3.</strong> The conductivity \(\sigma\) of a fully ionised plasma was computed by Spitzer (1962) using the Fokker-Planck collision operator:

\[
\sigma_\text{Spitzer} = \frac{n e^2}{m_e \nu_{ei}} \approx 1.5 \times 10^{-2}\,\frac{T^{3/2}}{\ln\Lambda}\;\text{S}\,\text{m}^{-1},
\]
where \(T\) is the electron temperature in eV and \(\ln\Lambda \approx 10\text{--}20\) is the Coulomb logarithm. Note the strong temperature dependence: hot plasmas are excellent conductors. The solar corona at \(T \sim 10^6\;\text{K}\) has \(\sigma \sim 10^6\;\text{S}\,\text{m}^{-1}\), comparable to copper, while the Earth's liquid iron core at \(T \sim 5000\;\text{K}\) has \(\sigma \sim 10^6\;\text{S}\,\text{m}^{-1}\) (from metallic conduction rather than the Spitzer formula). The corresponding magnetic diffusivities are \(\eta \sim 1\;\text{m}^2\,\text{s}^{-1}\) in both cases.
</div>

### 1.3 The Magnetic Induction Equation

The central equation of MHD electrodynamics is obtained by eliminating \(\mathbf{E}\) and \(\mathbf{J}\) from the pre-Maxwell equations using Ohm's law.

<div class="theorem">
<strong>Theorem 1.1 (Magnetic Induction Equation).</strong> Let \(\mathbf{B}\) be the magnetic field in a conducting fluid with velocity \(\mathbf{u}\) and magnetic diffusivity \(\eta = 1/(\mu_0 \sigma)\). Then

\[
\frac{\partial \mathbf{B}}{\partial t} = \nabla \times (\mathbf{u} \times \mathbf{B}) + \eta \nabla^2 \mathbf{B}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> From Ohm's law, \(\mathbf{E} = -\mathbf{u} \times \mathbf{B} + \mathbf{J}/\sigma\). Substituting into Faraday's law:

\[
\frac{\partial \mathbf{B}}{\partial t} = -\nabla \times \mathbf{E} = \nabla \times (\mathbf{u} \times \mathbf{B}) - \nabla \times \left(\frac{\mathbf{J}}{\sigma}\right).
\]
Using \(\mathbf{J} = \nabla \times \mathbf{B}/\mu_0\) and writing \(\eta = 1/(\mu_0 \sigma)\):

\[
\frac{\partial \mathbf{B}}{\partial t} = \nabla \times (\mathbf{u} \times \mathbf{B}) - \eta \nabla \times (\nabla \times \mathbf{B}).
\]
Since \(\nabla \cdot \mathbf{B} = 0\), we have \(\nabla \times (\nabla \times \mathbf{B}) = -\nabla^2 \mathbf{B}\), giving

\[
\frac{\partial \mathbf{B}}{\partial t} = \nabla \times (\mathbf{u} \times \mathbf{B}) + \eta \nabla^2 \mathbf{B}. \quad \square
\]
</div>

The induction equation is the magnetic analogue of the vorticity equation in fluid dynamics. The first term on the right represents advection and stretching of field lines by the flow; the second term represents ohmic diffusion. The relative importance of these two effects is measured by a single dimensionless number.

### 1.4 The Magnetic Reynolds Number

<div class="definition">
<strong>Definition 1.3 (Magnetic Reynolds Number).</strong> The <em>magnetic Reynolds number</em> is defined as

\[
\mathrm{Rm} = \frac{UL}{\eta},
\]
where \(U\) and \(L\) are characteristic velocity and length scales, and \(\eta = 1/(\mu_0 \sigma)\) is the magnetic diffusivity.
</div>

When \(\mathrm{Rm} \gg 1\), advection dominates over diffusion and the magnetic field is effectively "frozen" into the fluid — this is the ideal MHD regime. Astrophysical plasmas almost always have \(\mathrm{Rm} \gg 1\): for the solar corona, \(\mathrm{Rm} \sim 10^{12}\); for the Earth's liquid iron core, \(\mathrm{Rm} \sim 10^2\text{--}10^3\). By contrast, laboratory liquid metals typically have \(\mathrm{Rm} \sim 1\text{--}10\), making them useful testbeds for resistive MHD phenomena.

<div class="example">
<strong>Example 1.1 (Magnetic Diffusion Time).</strong> In the absence of flow (\(\mathbf{u} = \mathbf{0}\)), the induction equation reduces to a diffusion equation \(\partial \mathbf{B}/\partial t = \eta \nabla^2 \mathbf{B}\). The diffusion time for a structure of scale \(L\) is \(\tau_\eta = L^2/\eta\). For the Earth's core with \(L \sim 3500\;\text{km}\), \(\eta \sim 1\;\text{m}^2\,\text{s}^{-1}\): \(\tau_\eta \sim 10^{13}\;\text{s} \sim 300{,}000\;\text{years}\). The geomagnetic field decays on this time scale unless sustained by a dynamo. For a sunspot with \(L \sim 10^7\;\text{m}\), \(\eta \sim 1\;\text{m}^2\,\text{s}^{-1}\): \(\tau_\eta \sim 10^{14}\;\text{s} \sim 3\;\text{Myr}\), far longer than the observed sunspot lifetime of weeks.
</div>

### 1.5 The Frozen-In Flux Theorem

The most profound consequence of the ideal MHD limit is Alfvén's theorem, proved by Hannes Alfvén in 1942. It states that in a perfectly conducting fluid, magnetic flux through any material surface is conserved. This means that field lines move with the fluid as if they were "frozen in."

<div class="theorem">
<strong>Theorem 1.2 (Alfvén's Frozen-In Flux Theorem).</strong> In ideal MHD (\(\eta = 0\)), the magnetic flux \(\Phi = \int_S \mathbf{B} \cdot d\mathbf{S}\) through any material surface \(S(t)\) moving with the fluid is constant:

\[
\frac{d\Phi}{dt} = \frac{d}{dt}\int_{S(t)} \mathbf{B} \cdot d\mathbf{S} = 0.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Using the transport theorem for a material surface:

\[
\frac{d}{dt}\int_{S(t)} \mathbf{B} \cdot d\mathbf{S} = \int_S \left(\frac{\partial \mathbf{B}}{\partial t} + \nabla \times (\mathbf{B} \times \mathbf{u}) + \mathbf{u}(\nabla \cdot \mathbf{B})\right) \cdot d\mathbf{S}.
\]
Since \(\nabla \cdot \mathbf{B} = 0\) and the ideal induction equation gives \(\partial \mathbf{B}/\partial t = \nabla \times (\mathbf{u} \times \mathbf{B})\), we have

\[
\frac{d}{dt}\int_{S(t)} \mathbf{B} \cdot d\mathbf{S} = \int_S \left[\nabla \times (\mathbf{u} \times \mathbf{B}) + \nabla \times (\mathbf{B} \times \mathbf{u})\right] \cdot d\mathbf{S} = 0,
\]
since \(\mathbf{u} \times \mathbf{B} = -\mathbf{B} \times \mathbf{u}\). \(\square\)
</div>

Alfvén's theorem is the magnetic analogue of Kelvin's circulation theorem in inviscid fluid dynamics. It has far-reaching consequences: magnetic field lines can be stretched, compressed, and distorted by fluid motions, but they cannot be broken or reconnected. This topological constraint is what makes ideal MHD so powerful — and what makes its breakdown (magnetic reconnection, Chapter 6) so physically important.

An important corollary of the frozen-in theorem is that the magnetic field can be amplified by stretching motions. If a fluid element is elongated by a factor \(\ell\) along a field line while its cross-sectional area decreases to conserve volume, the field strength increases by the same factor \(\ell\). This stretching mechanism is the basis of the dynamo process (Chapter 7) and explains why turbulent conducting fluids tend to amplify magnetic fields.

<div class="example">
<strong>Example 1.2 (Flux Tube Stretching).</strong> Consider a thin flux tube of cross-section \(A\) and field strength \(B\), carrying flux \(\Phi = BA\). If the fluid stretches the tube to length \(\ell\) while conserving mass (\(\rho A \ell = \text{const}\)) and flux (\(BA = \text{const}\)), then \(B \propto \rho \ell^2/\ell = \rho\ell\). For an incompressible fluid (\(\rho = \text{const}\)), \(A\ell = \text{const}\), so \(B \propto 1/A \propto \ell\): the field is amplified linearly with the stretching. This is the fundamental mechanism by which turbulence generates small-scale magnetic fields at high \(\mathrm{Rm}\).
</div>

<div class="remark">
<strong>Remark 1.2.</strong> The frozen-in flux theorem immediately explains why astrophysical magnetic fields are so persistent. In the solar wind, where \(\mathrm{Rm} \sim 10^{10}\), the magnetic field is carried outward with the plasma, forming the Parker spiral. In accretion discs, frozen-in fields are wound up by differential rotation, a process central to the magnetorotational instability.
</div>

### 1.6 The MHD Approximation: Summary

To summarise, the MHD approximation rests on three pillars: (i) the flow is non-relativistic (\(U \ll c\)), so the displacement current can be dropped; (ii) the plasma is quasi-neutral, so charge separation effects are negligible on the length and time scales of interest; and (iii) the conductivity is high enough (or the scales large enough) that magnetic diffusion can often be neglected in a first approximation. Under these conditions, the electromagnetic sector reduces to the induction equation, and the only coupling back to the fluid is through the Lorentz force \(\mathbf{J} \times \mathbf{B}\), which we develop in the next chapter.

<div class="example">
<strong>Example 1.3 (Validity of MHD in Various Plasmas).</strong> The MHD approximation is valid for: (a) the solar interior (\(\mathrm{Rm} \sim 10^{10}\), \(\lambda_{\text{mfp}} \ll L\), collisional); (b) the Earth's liquid iron core (\(\mathrm{Rm} \sim 10^3\), \(\lambda_{\text{mfp}} \ll L\)); (c) the interstellar medium on large scales (\(\mathrm{Rm} \sim 10^{18}\)). It is marginal for: (d) the solar corona (\(\mathrm{Rm} \sim 10^{12}\) but \(\lambda_{\text{mfp}} \sim L\), so kinetic effects matter at small scales); (e) accretion disc coronae. It breaks down for: (f) the magnetosphere (\(\lambda_{\text{mfp}} \gg L\), collisionless); (g) laboratory plasma confinement at the gyroscale.
</div>

---

## Chapter 2: The MHD Equations

With the electromagnetic foundations in place, we now derive the full system of magnetohydrodynamic equations by coupling the induction equation to the Navier-Stokes equations via the Lorentz force. The resulting system describes the self-consistent co-evolution of velocity and magnetic fields in a conducting fluid. We discuss the physical meaning of magnetic pressure and tension, the distinction between ideal and resistive MHD, and the elegant Elsasser variable formulation.

### 2.1 The Lorentz Force

The Lorentz force per unit volume on a conducting fluid is \(\mathbf{F}_L = \mathbf{J} \times \mathbf{B}\). Using the pre-Maxwell relation \(\mathbf{J} = \nabla \times \mathbf{B}/\mu_0\), we can rewrite this in a form that reveals the underlying physics.

<div class="theorem">
<strong>Theorem 2.1 (Magnetic Stress Decomposition).</strong> The Lorentz force per unit volume can be decomposed as

\[
\mathbf{J} \times \mathbf{B} = \frac{1}{\mu_0}(\mathbf{B} \cdot \nabla)\mathbf{B} - \nabla\left(\frac{B^2}{2\mu_0}\right).
\]
The first term represents <em>magnetic tension</em> (a restoring force along curved field lines) and the second represents the gradient of <em>magnetic pressure</em> \(p_m = B^2/(2\mu_0)\).
</div>

<div class="proof">
<strong>Proof.</strong> Using the vector identity \((\nabla \times \mathbf{B}) \times \mathbf{B} = (\mathbf{B} \cdot \nabla)\mathbf{B} - \nabla(B^2/2)\), we divide by \(\mu_0\):

\[
\frac{1}{\mu_0}(\nabla \times \mathbf{B}) \times \mathbf{B} = \frac{1}{\mu_0}(\mathbf{B} \cdot \nabla)\mathbf{B} - \nabla\left(\frac{B^2}{2\mu_0}\right). \quad \square
\]
</div>

The magnetic tension term \((\mathbf{B} \cdot \nabla)\mathbf{B}/\mu_0\) acts like the tension in an elastic string: if field lines are curved, the tension acts to straighten them, producing a restoring force. This is the mechanism behind Alfvén waves. The magnetic pressure term \(\nabla(B^2/(2\mu_0))\) acts isotropically and supplements the gas pressure. The total pressure in MHD is therefore \(p + B^2/(2\mu_0)\).

<div class="definition">
<strong>Definition 2.1 (Plasma Beta).</strong> The <em>plasma beta</em> is the ratio of gas pressure to magnetic pressure:

\[
\beta = \frac{p}{B^2/(2\mu_0)} = \frac{2\mu_0 p}{B^2}.
\]
When \(\beta \ll 1\), magnetic forces dominate (as in the solar corona); when \(\beta \gg 1\), the magnetic field is dynamically weak (as in stellar interiors).
</div>

It is often useful to express the Lorentz force in terms of the Maxwell stress tensor, which makes explicit the analogy between magnetic forces and elastic stresses.

<div class="definition">
<strong>Definition 2.6 (Maxwell Stress Tensor).</strong> The <em>Maxwell stress tensor</em> in MHD is the symmetric tensor

\[
M_{ij} = \frac{1}{\mu_0}\left(B_i B_j - \frac{1}{2}B^2 \delta_{ij}\right).
\]
The Lorentz force per unit volume is \((\mathbf{J} \times \mathbf{B})_i = \partial M_{ij}/\partial x_j\). The diagonal elements show an isotropic magnetic pressure \(-B^2/(2\mu_0)\) supplemented by a tension \(B_i^2/\mu_0\) along the field direction.
</div>

The stress tensor picture reveals that magnetic field lines behave like elastic strings under tension \(B^2/\mu_0\) embedded in a medium with isotropic magnetic pressure \(B^2/(2\mu_0)\). The net effect is an anisotropic stress: tension along the field and pressure perpendicular to it. This anisotropy is the root cause of the rich wave spectrum of MHD and the anisotropic nature of MHD turbulence.

### 2.2 The Full MHD System

Combining the Navier-Stokes equations with the Lorentz force and the induction equation, we obtain the full resistive MHD system. For a compressible fluid of density \(\rho\), velocity \(\mathbf{u}\), pressure \(p\), and magnetic field \(\mathbf{B}\):

<div class="definition">
<strong>Definition 2.2 (Resistive MHD Equations).</strong> The <em>resistive MHD equations</em> are:

\[
\frac{\partial \rho}{\partial t} + \nabla \cdot (\rho \mathbf{u}) = 0 \quad \text{(continuity)},
\]

\[
\rho\left(\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u}\right) = -\nabla p + \frac{1}{\mu_0}(\nabla \times \mathbf{B}) \times \mathbf{B} + \rho\nu\nabla^2\mathbf{u} \quad \text{(momentum)},
\]

\[
\frac{\partial \mathbf{B}}{\partial t} = \nabla \times (\mathbf{u} \times \mathbf{B}) + \eta\nabla^2\mathbf{B} \quad \text{(induction)},
\]

\[
\nabla \cdot \mathbf{B} = 0 \quad \text{(solenoidal constraint)},
\]
together with an equation of state (e.g., \(p = \rho R T / \bar{m}\) for an ideal gas, or an adiabatic closure \(d(p\rho^{-\gamma})/dt = 0\)).
</div>

This system of equations is the starting point for nearly all of classical MHD. Note that the magnetic field equation involves no time derivative of \(\mathbf{E}\) — the electric field has been eliminated entirely. The system is closed once we specify an energy equation or equation of state.

<div class="remark">
<strong>Remark 2.3.</strong> The MHD equations form a system of 8 equations (1 continuity + 3 momentum + 3 induction + 1 energy/equation of state) for 8 unknowns (\(\rho, \mathbf{u}, \mathbf{B}, p\)). The solenoidal constraint \(\nabla \cdot \mathbf{B} = 0\) is not an evolution equation but a constraint that, once satisfied by the initial data, is preserved by the induction equation (take the divergence of both sides). In numerical MHD, maintaining \(\nabla \cdot \mathbf{B} = 0\) to machine precision is a significant challenge, addressed by methods such as constrained transport, projection schemes, and hyperbolic divergence cleaning.
</div>

### 2.3 Ideal MHD

<div class="definition">
<strong>Definition 2.3 (Ideal MHD).</strong> The <em>ideal MHD</em> equations are obtained from the resistive system by setting \(\eta = 0\) and \(\nu = 0\):

\[
\rho\left(\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u}\right) = -\nabla p + \frac{1}{\mu_0}(\mathbf{B} \cdot \nabla)\mathbf{B} - \nabla\left(\frac{B^2}{2\mu_0}\right),
\]

\[
\frac{\partial \mathbf{B}}{\partial t} = \nabla \times (\mathbf{u} \times \mathbf{B}).
\]
Ideal MHD conserves total energy, magnetic helicity, and cross-helicity.
</div>

Ideal MHD is the workhorse of astrophysical fluid dynamics. It is appropriate whenever \(\mathrm{Rm} \gg 1\) and viscous effects are negligible on the scales of interest. The ideal system is hyperbolic, admitting wave-like solutions (Chapter 3), and its conservation laws provide powerful constraints on the dynamics. The hyperbolic character means that information propagates at finite speeds (the Alfvén and magnetosonic speeds), and discontinuous solutions (shocks, contact discontinuities, tangential discontinuities) can form from smooth initial data. The Rankine-Hugoniot jump conditions for MHD shocks generalise those of ordinary gas dynamics and admit a richer taxonomy: fast shocks, slow shocks, intermediate (rotational) discontinuities, and switch-on/switch-off shocks.

### 2.4 Elsasser Variables

A beautiful symmetry of incompressible MHD emerges when we introduce the Elsasser variables, named after Walter Elsasser, who used them in his pioneering work on the geodynamo in the 1950s.

<div class="definition">
<strong>Definition 2.4 (Elsasser Variables).</strong> Define the <em>Elsasser variables</em>

\[
\mathbf{z}^\pm = \mathbf{u} \pm \frac{\mathbf{B}}{\sqrt{\mu_0 \rho}}.
\]
For incompressible ideal MHD with a uniform background field \(\mathbf{B}_0\), the equations become

\[
\frac{\partial \mathbf{z}^\pm}{\partial t} \mp (\mathbf{v}_A \cdot \nabla)\mathbf{z}^\pm + (\mathbf{z}^\mp \cdot \nabla)\mathbf{z}^\pm = -\nabla P,
\]
where \(\mathbf{v}_A = \mathbf{B}_0/\sqrt{\mu_0 \rho}\) is the Alfvén velocity and \(P\) is the total pressure divided by \(\rho\).
</div>

The Elsasser formulation shows that MHD can be viewed as two counter-propagating wave packets, \(\mathbf{z}^+\) and \(\mathbf{z}^-\), which interact nonlinearly only when they collide. In the absence of nonlinear coupling, each wave packet propagates undistorted along the background field — a remarkable simplification that underlies the theory of MHD turbulence (Iroshnikov 1964, Kraichnan 1965).

### 2.5 Energy Equation and Conservation Laws

The total energy of the MHD system has three contributions: kinetic, thermal, and magnetic.

<div class="theorem">
<strong>Theorem 2.2 (MHD Energy Conservation).</strong> In ideal, compressible MHD the total energy density

\[
e = \frac{1}{2}\rho u^2 + \frac{p}{\gamma - 1} + \frac{B^2}{2\mu_0}
\]
satisfies a conservation law

\[
\frac{\partial e}{\partial t} + \nabla \cdot \left[\left(\frac{1}{2}\rho u^2 + \frac{\gamma p}{\gamma - 1}\right)\mathbf{u} + \frac{1}{\mu_0}\mathbf{B} \times (\mathbf{u} \times \mathbf{B})\right] = 0.
\]
</div>

The magnetic contribution to the energy flux, \(\mathbf{B} \times (\mathbf{u} \times \mathbf{B})/\mu_0\), is the Poynting flux in the MHD approximation. It represents the transport of magnetic energy by the flow.

In addition to energy, ideal MHD conserves two further quadratic invariants that play a central role in MHD turbulence theory.

<div class="definition">
<strong>Definition 2.5 (Cross-Helicity).</strong> The <em>cross-helicity</em> is defined as

\[
H_C = \int_V \mathbf{u} \cdot \mathbf{B}\,dV.
\]
It measures the correlation between velocity and magnetic field fluctuations and is conserved in ideal, incompressible MHD. A state with maximal cross-helicity (\(\mathbf{u} = \pm \mathbf{B}/\sqrt{\mu_0\rho}\)) corresponds to a pure Alfvén wave and is an exact nonlinear solution.
</div>

<div class="remark">
<strong>Remark 2.2.</strong> The conservation of energy, magnetic helicity (Chapter 4), and cross-helicity provides three independent constraints on the evolution of ideal MHD flows. In turbulence theory, the simultaneous cascade of these invariants leads to qualitatively different spectra depending on the degree of cross-helicity (imbalanced turbulence) and the strength of the magnetic field relative to the turbulent fluctuations.
</div>

### 2.6 Boundary Conditions and Dimensional Analysis

At a perfectly conducting wall, the normal component of velocity vanishes (\(\mathbf{u} \cdot \hat{\mathbf{n}} = 0\)) and the magnetic field must satisfy \(\mathbf{B} \cdot \hat{\mathbf{n}} = 0\) (no normal flux through the conductor) plus continuity of the tangential electric field. At a free boundary between plasma and vacuum, we require continuity of total pressure and continuity of the normal component of \(\mathbf{B}\).

<div class="remark">
<strong>Remark 2.1.</strong> The MHD system involves four key dimensionless numbers: the magnetic Reynolds number \(\mathrm{Rm} = UL/\eta\), the fluid Reynolds number \(\mathrm{Re} = UL/\nu\), the magnetic Prandtl number \(\mathrm{Pm} = \nu/\eta = \mathrm{Rm}/\mathrm{Re}\), and the Lundquist number \(S = v_A L/\eta\). In astrophysics, \(\mathrm{Pm}\) can be very small (stellar interiors, \(\mathrm{Pm} \sim 10^{-6}\)) or very large (warm interstellar medium, \(\mathrm{Pm} \gg 1\)), and the dynamics can differ dramatically between these regimes.
</div>

---

## Chapter 3: MHD Waves

One of the most striking features of MHD is its support for wave-like disturbances that have no counterpart in ordinary hydrodynamics. The magnetic tension in curved field lines acts as a restoring force, giving rise to Alfvén waves — transverse waves propagating along field lines at the Alfvén speed. The coupling of magnetic and gas pressure produces two additional families: fast and slow magnetosonic waves. This chapter derives these wave modes from the linearised MHD equations and explores their propagation characteristics.

### 3.1 Linearization About a Uniform Equilibrium

Consider a uniform equilibrium with constant density \(\rho_0\), pressure \(p_0\), zero velocity, and a uniform magnetic field \(\mathbf{B}_0 = B_0 \hat{\mathbf{z}}\). We perturb all quantities:

\[
\rho = \rho_0 + \rho_1, \quad \mathbf{u} = \mathbf{u}_1, \quad \mathbf{B} = \mathbf{B}_0 + \mathbf{B}_1, \quad p = p_0 + p_1,
\]
with \(|\rho_1| \ll \rho_0\), etc. Substituting into the ideal, compressible MHD equations and retaining only first-order terms yields the linearised system:

\[
\rho_0 \frac{\partial \mathbf{u}_1}{\partial t} = -\nabla p_1 + \frac{1}{\mu_0}(\nabla \times \mathbf{B}_1) \times \mathbf{B}_0,
\]

\[
\frac{\partial \mathbf{B}_1}{\partial t} = \nabla \times (\mathbf{u}_1 \times \mathbf{B}_0),
\]

\[
\frac{\partial \rho_1}{\partial t} + \rho_0 \nabla \cdot \mathbf{u}_1 = 0, \quad p_1 = c_s^2 \rho_1,
\]

where \(c_s = \sqrt{\gamma p_0/\rho_0}\) is the adiabatic sound speed.

### 3.2 Alfvén Waves

Hannes Alfvén predicted in 1942 that a conducting fluid threaded by a magnetic field should support transverse waves propagating along the field lines. This prediction, initially met with scepticism (Alfvén recounted that both Fermi and Teller initially disbelieved him), was later confirmed experimentally and earned Alfvén the 1970 Nobel Prize in Physics.

<div class="theorem">
<strong>Theorem 3.1 (Alfvén Waves).</strong> The linearised ideal MHD equations support incompressible, transverse wave solutions of the form \(\mathbf{u}_1 = \hat{\mathbf{x}}\, u_0 e^{i(kz - \omega t)}\), \(\mathbf{B}_1 = -\hat{\mathbf{x}}\, B_0 (u_0/v_A) e^{i(kz - \omega t)}\), with the dispersion relation

\[
\omega = \pm k v_A, \quad v_A = \frac{B_0}{\sqrt{\mu_0 \rho_0}}.
\]
The quantity \(v_A\) is the <em>Alfvén speed</em>.
</div>

<div class="proof">
<strong>Proof.</strong> Seek solutions where \(\nabla \cdot \mathbf{u}_1 = 0\) (incompressible) and the perturbation is transverse to \(\mathbf{B}_0\). Taking \(\mathbf{u}_1 = u_1(z,t)\hat{\mathbf{x}}\), the linearised induction equation gives \(\partial B_{1x}/\partial t = B_0 \partial u_1/\partial z\). The linearised momentum equation (with \(\nabla p_1 = 0\) for an incompressible mode) gives \(\rho_0 \partial u_1/\partial t = (B_0/\mu_0)\partial B_{1x}/\partial z\). Combining these two equations by cross-differentiation yields

\[
\frac{\partial^2 u_1}{\partial t^2} = v_A^2 \frac{\partial^2 u_1}{\partial z^2},
\]
which is the wave equation with phase speed \(v_A = B_0/\sqrt{\mu_0 \rho_0}\). \(\square\)
</div>

Alfvén waves are the magnetic analogue of waves on a plucked string: the magnetic field lines play the role of the string, with tension \(B_0^2/\mu_0\) and mass per unit length \(\rho_0\). The perturbation is purely transverse and incompressible — there is no density or pressure fluctuation. The velocity and magnetic field perturbations are related by the Walén relation: \(\mathbf{u}_1 = \mp \mathbf{B}_1/\sqrt{\mu_0 \rho_0}\).

<div class="example">
<strong>Example 3.1 (Alfvén Speed in Astrophysical Plasmas).</strong> In the solar corona, \(B \sim 10^{-3}\;\text{T}\), \(\rho \sim 10^{-12}\;\text{kg}\,\text{m}^{-3}\): \(v_A \sim 10^6\;\text{m}\,\text{s}^{-1} \sim 1000\;\text{km}\,\text{s}^{-1}\). In the solar wind at 1 AU, \(B \sim 5\;\text{nT}\), \(n \sim 5\;\text{cm}^{-3}\): \(v_A \sim 50\;\text{km}\,\text{s}^{-1}\). In Earth's liquid iron core, \(B \sim 5 \times 10^{-3}\;\text{T}\), \(\rho \sim 10^4\;\text{kg}\,\text{m}^{-3}\): \(v_A \sim 0.04\;\text{m}\,\text{s}^{-1}\), so Alfvén waves traverse the core in about \(3\) years.
</div>

### 3.3 Fast and Slow Magnetosonic Waves

When compressibility is included, the linearised MHD equations support two additional wave modes that couple magnetic and gas pressure. For a plane wave with wavevector \(\mathbf{k}\) making angle \(\theta\) with \(\mathbf{B}_0\), the general dispersion relation is obtained by seeking solutions proportional to \(e^{i(\mathbf{k} \cdot \mathbf{x} - \omega t)}\).

<div class="theorem">
<strong>Theorem 3.2 (Magnetosonic Dispersion Relation).</strong> The phase speeds of the compressible MHD wave modes are given by

\[
v_\text{ph}^2 = \frac{1}{2}\left(v_A^2 + c_s^2\right) \pm \frac{1}{2}\sqrt{(v_A^2 + c_s^2)^2 - 4 v_A^2 c_s^2 \cos^2\theta},
\]
where \(\theta\) is the angle between \(\mathbf{k}\) and \(\mathbf{B}_0\). The \(+\) sign gives the <em>fast magnetosonic wave</em>, the \(-\) sign gives the <em>slow magnetosonic wave</em>, and the intermediate Alfvén wave has \(v_\text{ph}^2 = v_A^2 \cos^2\theta\).
</div>

The three MHD wave modes satisfy the ordering \(v_{\text{slow}} \leq v_A |\cos\theta| \leq v_{\text{fast}}\) for all angles \(\theta\). At \(\theta = 0\) (propagation along the field), the fast wave degenerates to whichever of \(v_A\) or \(c_s\) is larger, the slow wave to whichever is smaller, and the Alfvén wave to \(v_A\). At \(\theta = \pi/2\) (propagation perpendicular to the field), the slow wave speed vanishes, the Alfvén wave speed vanishes, and the fast wave propagates at \(\sqrt{v_A^2 + c_s^2}\).

<div class="definition">
<strong>Definition 3.1 (Friedrichs Diagram).</strong> The <em>Friedrichs diagram</em> (or wave normal surface) is a polar plot of phase speed \(v_\text{ph}(\theta)\) for each of the three MHD wave modes. It provides a compact visualisation of the anisotropic wave propagation in a magnetised plasma.
</div>

The Friedrichs diagram reveals the profoundly anisotropic nature of MHD wave propagation. The Alfvén wave propagates only along the field and has zero phase speed perpendicular to it. The fast wave is nearly isotropic (its speed varies relatively little with \(\theta\)), while the slow wave is confined to a narrow cone around the field direction.

<div class="example">
<strong>Example 3.4 (Wave Modes in the Solar Atmosphere).</strong> In the photosphere, \(c_s \sim 8\;\text{km}\,\text{s}^{-1}\) and \(v_A \sim 1\;\text{km}\,\text{s}^{-1}\) (high-\(\beta\) regime), so the fast wave is essentially a sound wave and the slow wave is a magnetically guided acoustic mode. In the corona, \(c_s \sim 200\;\text{km}\,\text{s}^{-1}\) and \(v_A \sim 1000\;\text{km}\,\text{s}^{-1}\) (low-\(\beta\)), and the ordering reverses: the fast wave is predominantly magnetic and the slow wave is a field-guided sound wave. The transition between these regimes occurs at the \(\beta = 1\) layer in the chromosphere, where mode conversion between acoustic and magnetic waves can occur.
</div>

<div class="remark">
<strong>Remark 3.1.</strong> The group velocity \(\mathbf{v}_g = \partial \omega / \partial \mathbf{k}\) can differ dramatically from the phase velocity. For Alfvén waves, the group velocity always points along \(\mathbf{B}_0\) regardless of the direction of \(\mathbf{k}\), reflecting the fact that energy is transported along field lines. This is why the solar corona can channel wave energy from the photosphere along magnetic loops.
</div>

### 3.4 Wave Propagation in Stratified and Rotating MHD

When the background is not uniform — for instance, in a gravitationally stratified atmosphere with a magnetic field — the wave analysis becomes considerably richer. Gravity introduces buoyancy oscillations (internal gravity waves, frequency \(N\)), rotation introduces inertial oscillations (frequency \(f\)), and the magnetic field introduces Alfvén and magnetosonic modes.

<div class="example">
<strong>Example 3.2 (Magneto-Gravity Waves).</strong> In a stratified atmosphere with horizontal magnetic field, the linearised equations yield modes whose frequencies satisfy a combined relation coupling the Brunt-Väisälä frequency \(N\), the Alfvén frequency \(\omega_A = k_\parallel v_A\), and the sound frequency. In the incompressible limit, the coupling between buoyancy and magnetic tension gives a modified dispersion relation

\[
\omega^2 = \frac{k_\parallel^2 v_A^2 k^2 + N^2 k_h^2}{k^2},
\]
where \(k_h\) is the horizontal wavenumber perpendicular to the field. These magneto-gravity waves are important in the solar tachocline and in the stably stratified layers of planetary interiors.
</div>

### 3.5 Phase Mixing and Resonant Absorption

In an inhomogeneous medium, the Alfvén speed varies across the magnetic field. Neighbouring field lines therefore oscillate at different frequencies, causing an initially coherent disturbance to develop increasingly fine transverse structure — a process called phase mixing.

<div class="definition">
<strong>Definition 3.2 (Phase Mixing).</strong> Consider Alfvén waves on field lines with a spatially varying Alfvén speed \(v_A(x)\). An initially smooth perturbation develops a transverse gradient that grows linearly in time: \(\partial \mathbf{u}/\partial x \sim t\, (dv_A/dx)\, k_z\, u_0\). Eventually the gradients become steep enough for resistive or viscous dissipation to become effective, even when \(\mathrm{Rm} \gg 1\).
</div>

Phase mixing is closely related to resonant absorption, where an incoming fast magnetosonic wave encounters a surface where its frequency matches the local Alfvén frequency. Energy accumulates at this resonant layer and is converted to Alfvén waves, which then phase-mix and dissipate. This mechanism is a leading candidate for heating the solar corona.

<div class="example">
<strong>Example 3.3 (Coronal Loop Heating).</strong> In a coronal loop with transverse Alfvén speed profile, photospheric driving at the loop footpoints excites kink oscillations. Through resonant absorption, the energy of the global kink mode is transferred to localised Alfvén oscillations at the resonant surface, where phase mixing generates small scales and enables dissipation. The damping time of coronal loop oscillations observed by TRACE and SDO is consistent with this resonant absorption model.
</div>

---

## Chapter 4: MHD Equilibria

Before we can study the stability or dynamics of a magnetised plasma, we must first understand the equilibrium configurations that the plasma can adopt. The equilibrium condition in MHD is a balance between the pressure gradient, the magnetic (Lorentz) force, and possibly gravity. This chapter develops the theory of MHD equilibria, from the general force-balance condition to the Grad-Shafranov equation for axisymmetric fusion devices, to force-free fields and the topological constraints imposed by magnetic helicity.

### 4.1 Force Balance

In a static MHD equilibrium with no flow (\(\mathbf{u} = \mathbf{0}\)), the momentum equation reduces to a balance of forces.

<div class="definition">
<strong>Definition 4.1 (MHD Force Balance).</strong> A <em>magnetostatic equilibrium</em> satisfies

\[
\nabla p = \mathbf{J} \times \mathbf{B} = \frac{1}{\mu_0}(\nabla \times \mathbf{B}) \times \mathbf{B},
\]
together with \(\nabla \cdot \mathbf{B} = 0\). Equivalently,

\[
\nabla\left(p + \frac{B^2}{2\mu_0}\right) = \frac{1}{\mu_0}(\mathbf{B} \cdot \nabla)\mathbf{B}.
\]
</div>

The force balance has an immediate geometric consequence: taking the dot product with \(\mathbf{B}\) gives \(\mathbf{B} \cdot \nabla p = 0\), meaning that the pressure is constant along field lines. Similarly, dotting with \(\mathbf{J}\) gives \(\mathbf{J} \cdot \nabla p = 0\): pressure is also constant along current lines. Therefore, surfaces of constant pressure are simultaneously magnetic surfaces (surfaces to which field lines are tangent) and current surfaces. This is a remarkable geometric constraint: the field lines and current lines must both be tangent to the same family of nested surfaces, and the pressure serves as a label for these surfaces.

In three dimensions, the requirement that both \(\mathbf{B}\) and \(\mathbf{J}\) lie in surfaces of constant \(p\) is extremely restrictive. In two-dimensional or axisymmetric geometries, it can always be satisfied, but in fully three-dimensional configurations, the existence of such nested surfaces is generically violated — a fact closely related to the KAM theorem of Hamiltonian mechanics, since the field-line equations have Hamiltonian structure.

<div class="remark">
<strong>Remark 4.1.</strong> The existence of nested magnetic surfaces — a family of closed, toroidal surfaces to which field lines are tangent — is crucial for magnetic confinement in fusion devices. If field lines are ergodic (filling a volume rather than lying on surfaces), there can be no pressure gradient, and confinement is lost.
</div>

### 4.2 Flux Functions and the Grad-Shafranov Equation

For axisymmetric equilibria, which are the basis of tokamak design, the magnetic field can be expressed in terms of a single scalar flux function. This reduction was independently derived by Harold Grad and Vitalii Shafranov in 1958.

<div class="definition">
<strong>Definition 4.2 (Poloidal Flux Function).</strong> In cylindrical coordinates \((R, \phi, Z)\), an axisymmetric magnetic field can be written as

\[
\mathbf{B} = \frac{1}{R}\nabla\psi \times \hat{\boldsymbol{\phi}} + B_\phi(R,Z)\hat{\boldsymbol{\phi}},
\]
where \(\psi(R,Z)\) is the <em>poloidal flux function</em>. The surfaces \(\psi = \text{const}\) are the magnetic surfaces.
</div>

Substituting this representation into the force balance equation and using the axisymmetry to show that both \(p\) and \(RB_\phi\) must be functions of \(\psi\) alone, one obtains a single, nonlinear, elliptic PDE for \(\psi\).

<div class="theorem">
<strong>Theorem 4.1 (Grad-Shafranov Equation).</strong> In an axisymmetric equilibrium, the poloidal flux function \(\psi(R,Z)\) satisfies

\[
R \frac{\partial}{\partial R}\left(\frac{1}{R}\frac{\partial \psi}{\partial R}\right) + \frac{\partial^2 \psi}{\partial Z^2} = -\mu_0 R^2 \frac{dp}{d\psi} - F\frac{dF}{d\psi},
\]
where \(p(\psi)\) is the pressure and \(F(\psi) = RB_\phi\) is the poloidal current function. The functions \(p(\psi)\) and \(F(\psi)\) are free and must be specified as input.
</div>

<div class="proof">
<strong>Proof.</strong> From the force balance \(\nabla p = \mathbf{J} \times \mathbf{B}\), the component along \(\nabla\psi\) is automatically satisfied when \(p = p(\psi)\). The toroidal component of the force balance gives \(F = F(\psi)\), where \(F = RB_\phi\). The remaining equation is obtained from the poloidal components. The current density is computed from \(\mathbf{J} = \nabla \times \mathbf{B}/\mu_0\), and substituting into the \(R\)- and \(Z\)-components of the force balance yields the Grad-Shafranov equation after algebraic manipulation. \(\square\)
</div>

The Grad-Shafranov equation is the fundamental equation of tokamak equilibrium theory. Given appropriate choices for \(p(\psi)\) and \(F(\psi)\) and boundary conditions (e.g., \(\psi\) prescribed on a conducting wall or at a magnetic separatrix), it determines the shape of the magnetic surfaces and hence the equilibrium configuration. The equation is nonlinear in general (since \(p(\psi)\) and \(F(\psi)\) are arbitrary functions), and analytic solutions exist only for special choices of these profiles. Numerical solution of the Grad-Shafranov equation is a routine step in tokamak design, performed by codes such as EFIT, CHEASE, and HELENA.

<div class="remark">
<strong>Remark 4.4.</strong> The Grad-Shafranov equation has a remarkable mathematical structure: it is a semilinear elliptic PDE with free boundaries (when the plasma-vacuum interface is unknown). The existence and uniqueness theory for such equations draws on tools from nonlinear functional analysis and bifurcation theory. Grad conjectured that smooth solutions with nested toroidal magnetic surfaces are non-generic and that most equilibria possess chaotic field lines near rational surfaces — a conjecture that remains incompletely resolved.
</div>

<div class="example">
<strong>Example 4.1 (Solov'ev Equilibrium).</strong> The simplest analytic solutions arise when \(p'(\psi)\) and \(FF'(\psi)\) are constants. Setting \(\mu_0 R^2 p'(\psi) + FF'(\psi) = c_1 R^2 + c_2\) for constants \(c_1, c_2\), the Grad-Shafranov equation becomes linear and admits polynomial solutions. The Solov'ev equilibrium \(\psi = c_1 R^4/8 + c_2 R^2 Z^2/2\) describes elongated, D-shaped magnetic surfaces and is widely used as a first approximation in tokamak design.
</div>

### 4.3 Force-Free Fields

In astrophysical contexts, particularly in the solar corona and magnetosphere, the gas pressure is often much smaller than the magnetic pressure (\(\beta \ll 1\)). In this limit, the equilibrium condition becomes \(\mathbf{J} \times \mathbf{B} = \mathbf{0}\), meaning the current density is everywhere parallel to the magnetic field.

<div class="definition">
<strong>Definition 4.3 (Force-Free Field).</strong> A magnetic field is <em>force-free</em> if

\[
\nabla \times \mathbf{B} = \alpha(\mathbf{x})\mathbf{B},
\]
where \(\alpha\) is a scalar function. If \(\alpha\) is constant, the field is <em>linear force-free</em>; if \(\alpha = 0\), the field is <em>potential</em> (current-free).
</div>

Taking the divergence of the force-free equation and using \(\nabla \cdot \mathbf{B} = 0\), we obtain \(\mathbf{B} \cdot \nabla\alpha = 0\): the function \(\alpha\) is constant along field lines. For a linear force-free field with constant \(\alpha\), the equation \(\nabla \times \mathbf{B} = \alpha \mathbf{B}\) can be solved by Fourier methods and yields the Chandrasekhar-Kendall representation used in solar physics.

<div class="example">
<strong>Example 4.2 (Lundquist's Force-Free Cylinder).</strong> The simplest force-free equilibrium in cylindrical geometry is the Lundquist solution (1950), in which \(\alpha\) is constant and the field has the form

\[
B_z(r) = B_0 J_0(\alpha r), \quad B_\phi(r) = B_0 J_1(\alpha r),
\]
where \(J_0\) and \(J_1\) are Bessel functions of the first kind. This solution describes a magnetic flux rope with helical field lines and is widely used to model coronal mass ejections and interplanetary flux ropes. The field reverses direction at the first zero of \(J_0\), a feature exploited in the reversed-field pinch.
</div>

<div class="remark">
<strong>Remark 4.3.</strong> Nonlinear force-free fields (\(\alpha\) varying in space) are far more challenging to compute. Since \(\mathbf{B} \cdot \nabla\alpha = 0\), the function \(\alpha\) is constant along each field line but can vary from line to line. Numerical extrapolation of the coronal magnetic field from photospheric magnetogram data, subject to the force-free constraint, is an active area of research in solar physics with important applications to space weather prediction.
</div>

### 4.4 Magnetic Helicity and Woltjer's Theorem

Magnetic helicity is a topological invariant of ideal MHD that measures the linkage and twist of magnetic field lines. Its conservation places powerful constraints on the relaxation of magnetic configurations.

<div class="definition">
<strong>Definition 4.4 (Magnetic Helicity).</strong> The <em>magnetic helicity</em> of a field \(\mathbf{B} = \nabla \times \mathbf{A}\) contained in a volume \(V\) with \(\mathbf{B} \cdot \hat{\mathbf{n}} = 0\) on \(\partial V\) is

\[
H = \int_V \mathbf{A} \cdot \mathbf{B}\;dV.
\]
It is gauge-invariant (under the boundary condition) and is an ideal invariant: \(dH/dt = 0\) when \(\eta = 0\).
</div>

The conservation of helicity in ideal MHD was proved by Woltjer (1958), who also showed that the minimum-energy state at fixed helicity is a linear force-free field. This result was later extended by J.B. Taylor to resistive plasmas in a profound insight that underpins relaxation theory.

<div class="theorem">
<strong>Theorem 4.2 (Woltjer's Theorem).</strong> Among all divergence-free magnetic fields in a simply connected volume \(V\) with \(\mathbf{B} \cdot \hat{\mathbf{n}} = 0\) on \(\partial V\), the field of minimum magnetic energy \(\int B^2/(2\mu_0)\,dV\) at fixed magnetic helicity \(H\) satisfies

\[
\nabla \times \mathbf{B} = \alpha \mathbf{B},
\]
where \(\alpha\) is a constant (the Lagrange multiplier associated with the helicity constraint).
</div>

<div class="proof">
<strong>Proof.</strong> We minimise the magnetic energy \(W = \int B^2/(2\mu_0)\,dV\) subject to the constraint that the helicity \(H = \int \mathbf{A} \cdot \mathbf{B}\,dV\) is fixed. Using the calculus of variations with Lagrange multiplier \(\alpha/(2\mu_0)\), the first variation gives

\[
\delta W - \frac{\alpha}{2\mu_0}\delta H = \frac{1}{\mu_0}\int (\mathbf{B} - \alpha\mathbf{A}) \cdot \delta\mathbf{B}\,dV + \text{boundary terms} = 0.
\]
Since \(\delta\mathbf{B} = \nabla \times \delta\mathbf{A}\) is arbitrary, we require \(\nabla \times \mathbf{B} = \alpha\mathbf{B}\), a linear force-free field. \(\square\)
</div>

### 4.5 Taylor Relaxation

J.B. Taylor (1974) made the bold conjecture that in a turbulent, weakly resistive plasma, magnetic energy is rapidly dissipated by reconnection while helicity is approximately conserved (being an ideal invariant with slow resistive decay). The end state of this relaxation is therefore the Woltjer minimum-energy state — a linear force-free field — regardless of the initial configuration.

<div class="remark">
<strong>Remark 4.2.</strong> Taylor relaxation has been dramatically confirmed in reversed-field pinch experiments, where the plasma spontaneously organises into a state close to \(\nabla \times \mathbf{B} = \alpha\mathbf{B}\) with \(\alpha\) approximately uniform across the plasma. The theory also provides insight into the structure of the solar corona and astrophysical jets.
</div>

---

## Chapter 5: MHD Stability

An equilibrium exists, but is it physically realisable? The answer depends on stability: a small perturbation from equilibrium may either oscillate (stability) or grow exponentially (instability). MHD stability theory is one of the most developed branches of plasma physics, driven in large part by the need to understand and control instabilities in magnetic confinement fusion devices. This chapter covers normal mode analysis, the powerful energy principle, and the major MHD instabilities.

### 5.1 Normal Mode Analysis

The most direct approach to linear stability is to linearise the ideal MHD equations about an equilibrium and seek normal-mode solutions proportional to \(e^{-i\omega t}\). If all eigenfrequencies \(\omega\) are real, the equilibrium is stable; if any \(\omega\) has a positive imaginary part, the equilibrium is unstable. The self-adjoint structure of the ideal MHD force operator, first elucidated by Bernstein, Frieman, Kruskal, and Kulsrud (1958) in one of the foundational papers of plasma physics, guarantees that the eigenvalues \(\omega^2\) are real — so instabilities grow purely exponentially, without oscillation.

For an equilibrium with \(\mathbf{u}_0 = \mathbf{0}\), a displacement field \(\boldsymbol{\xi}(\mathbf{x},t)\) describes the perturbation: the fluid element initially at \(\mathbf{x}\) moves to \(\mathbf{x} + \boldsymbol{\xi}\). The linearised momentum equation can be written as

\[
\rho_0 \frac{\partial^2 \boldsymbol{\xi}}{\partial t^2} = \mathbf{F}(\boldsymbol{\xi}),
\]

where \(\mathbf{F}\) is the force operator, a linear operator acting on \(\boldsymbol{\xi}\).

<div class="definition">
<strong>Definition 5.1 (MHD Force Operator).</strong> The <em>force operator</em> for ideal MHD perturbations about a static equilibrium is

\[
\mathbf{F}(\boldsymbol{\xi}) = \nabla(\boldsymbol{\xi} \cdot \nabla p_0 + \gamma p_0 \nabla \cdot \boldsymbol{\xi}) + \frac{1}{\mu_0}(\nabla \times \mathbf{B}_0) \times \mathbf{Q} + \frac{1}{\mu_0}(\nabla \times \mathbf{Q}) \times \mathbf{B}_0,
\]
where \(\mathbf{Q} = \nabla \times (\boldsymbol{\xi} \times \mathbf{B}_0)\) is the perturbed magnetic field.
</div>

A fundamental property of this operator, proved by Bernstein, Frieman, Kruskal, and Kulsrud in their landmark 1958 paper, is that it is self-adjoint.

### 5.2 The Energy Principle

<div class="theorem">
<strong>Theorem 5.1 (Energy Principle, Bernstein et al. 1958).</strong> The force operator \(\mathbf{F}\) is self-adjoint with respect to the inner product \(\langle \boldsymbol{\eta}, \boldsymbol{\xi} \rangle = \int \boldsymbol{\eta}^* \cdot \boldsymbol{\xi} \,\rho_0\, dV\). Consequently, all eigenvalues \(\omega^2\) are real. The equilibrium is stable if and only if the potential energy functional

\[
\delta W(\boldsymbol{\xi}) = -\frac{1}{2}\int_V \boldsymbol{\xi}^* \cdot \mathbf{F}(\boldsymbol{\xi})\,dV \geq 0
\]
for all admissible displacements \(\boldsymbol{\xi}\).
</div>

The energy principle reduces stability analysis to a variational problem: the equilibrium is stable if and only if no trial function \(\boldsymbol{\xi}\) can make \(\delta W\) negative. This is immensely powerful because one does not need to solve the full eigenvalue problem — one only needs to check the sign of a quadratic form.

<div class="proof">
<strong>Proof.</strong> (Sketch) Self-adjointness follows from the symmetric structure of the force operator: for any two displacements \(\boldsymbol{\xi}\) and \(\boldsymbol{\eta}\), integration by parts shows \(\int \boldsymbol{\eta}^* \cdot \mathbf{F}(\boldsymbol{\xi})\,dV = \int \boldsymbol{\xi} \cdot \mathbf{F}(\boldsymbol{\eta})^*\,dV\). For normal modes \(\boldsymbol{\xi} \sim e^{-i\omega t}\), the eigenvalue equation is \(-\omega^2 \rho_0 \boldsymbol{\xi} = \mathbf{F}(\boldsymbol{\xi})\). Self-adjointness implies all \(\omega^2\) are real. Stability corresponds to \(\omega^2 > 0\), which by the variational characterisation is equivalent to \(\delta W > 0\) for all \(\boldsymbol{\xi} \neq 0\). \(\square\)
</div>

The potential energy \(\delta W\) can be decomposed into several physically interpretable terms. For a plasma with vacuum region:

\[
\delta W = \delta W_p + \delta W_s + \delta W_v,
\]

where \(\delta W_p\) is the plasma contribution, \(\delta W_s\) the surface contribution, and \(\delta W_v\) the vacuum contribution.

<div class="theorem">
<strong>Theorem 5.2 (Plasma Potential Energy).</strong> The plasma contribution to \(\delta W\) is

\[
\delta W_p = \frac{1}{2}\int_V \left[\frac{|\mathbf{Q}|^2}{\mu_0} + \gamma p_0 |\nabla \cdot \boldsymbol{\xi}|^2 + (\boldsymbol{\xi} \cdot \nabla p_0)(\nabla \cdot \boldsymbol{\xi}^*) - \boldsymbol{\xi}^* \cdot (\mathbf{J}_0 \times \mathbf{Q})\right] dV.
\]
The first two terms are always stabilising (field line bending and compression), while the third and fourth can be destabilising (pressure-driven and current-driven instabilities).
</div>

This decomposition is the basis for understanding all MHD instabilities in terms of the free energy sources that drive them.

<div class="lemma">
<strong>Lemma 5.1 (Suydam's Criterion).</strong> In a cylindrical plasma with circular magnetic surfaces labelled by \(r\), the necessary condition for stability against localised interchange modes (perturbations concentrated near a resonant surface) is

\[
\frac{r}{4}\left(\frac{q'}{q}\right)^2 + \frac{2\mu_0 p'}{r B_z^2} \geq 0,
\]
where \(q(r) = rB_z/(RB_\theta)\) is the safety factor and primes denote radial derivatives. The first term represents the stabilising effect of magnetic shear and the second the destabilising effect of the pressure gradient.
</div>

Suydam's criterion is the cylindrical analogue of the Rayleigh criterion for convective stability: it provides a necessary (but not sufficient) condition. Violation of Suydam's criterion at any radius guarantees instability, while satisfaction everywhere is necessary but not sufficient for stability. A sufficient condition requires additionally that the global energy principle be satisfied.

<div class="remark">
<strong>Remark 5.3.</strong> In toroidal geometry, Suydam's criterion is replaced by the Mercier criterion, which includes additional curvature and geodesic terms arising from the toroidal geometry. The Mercier criterion is the local necessary condition for stability in a tokamak and reduces to Suydam in the cylindrical limit.
</div>

### 5.3 Interchange Instabilities

The interchange instability is the MHD analogue of the Rayleigh-Taylor instability in hydrodynamics. It occurs when the pressure gradient opposes the curvature of the magnetic field lines — physically, when dense plasma is supported by a magnetic field whose curvature is concave toward the plasma.

<div class="definition">
<strong>Definition 5.2 (Interchange Modes).</strong> An <em>interchange</em> perturbation swaps neighbouring flux tubes without bending the field lines (i.e., \(\mathbf{Q}_\perp \approx 0\)). The stability criterion for interchange modes in a magnetic configuration with curvature vector \(\boldsymbol{\kappa} = (\hat{\mathbf{b}} \cdot \nabla)\hat{\mathbf{b}}\) is

\[
\nabla p \cdot \boldsymbol{\kappa} < 0 \quad \text{(stable)}, \quad \nabla p \cdot \boldsymbol{\kappa} > 0 \quad \text{(unstable)}.
\]
Unfavourable curvature (pressure gradient and curvature pointing in the same direction) is destabilising.
</div>

<div class="example">
<strong>Example 5.1 (Interchange in a Tokamak).</strong> In a tokamak, the magnetic curvature is favourable (pointing away from the plasma) on the inboard side and unfavourable on the outboard side. This is why MHD instabilities in tokamaks tend to be localised on the outboard (low-field) side, a phenomenon related to ballooning modes discussed below.
</div>

### 5.4 Kink Instabilities

The kink instability is a current-driven instability that occurs in cylindrical or toroidal plasma columns when the current (or equivalently the magnetic shear) exceeds a critical threshold. It is the most dangerous macroscopic instability in tokamaks.

<div class="theorem">
<strong>Theorem 5.3 (Kruskal-Shafranov Criterion).</strong> A cylindrical plasma column of radius \(a\) carrying axial current \(I\) in an axial field \(B_z\), with safety factor

\[
q(a) = \frac{2\pi a B_z}{\mu_0 I},
\]
is unstable to the external kink mode with \(m = 1\), \(n = 1\) if \(q(a) < 1\). The condition \(q > 1\) everywhere is necessary (but not sufficient) for stability in a tokamak.
</div>

The safety factor \(q\) measures how many times a field line winds around the torus the long way (toroidally) for each circuit the short way (poloidally). The Kruskal-Shafranov limit \(q > 1\) sets a fundamental upper bound on the toroidal current in a tokamak, which in turn limits the poloidal field and hence the achievable plasma pressure (through the Troyon limit \(\beta \lesssim \beta_N I/(aB)\)).

<div class="remark">
<strong>Remark 5.1.</strong> The kink instability has a vivid physical interpretation: it is a helical deformation of the plasma column in which the current channel buckles like a kinked garden hose. The instability is driven by the free energy in the poloidal magnetic field (i.e., the current). Sufficiently strong axial field stabilises the kink by providing magnetic tension.
</div>

### 5.5 Ballooning Modes

Ballooning modes are pressure-driven instabilities that are localised on the outboard (unfavourable curvature) side of a toroidal device. They were first analysed by Connor, Hastie, and Taylor (1978) and represent the toroidal analogue of interchange modes modified by magnetic shear.

<div class="definition">
<strong>Definition 5.3 (Ballooning Representation).</strong> In the <em>ballooning representation</em>, perturbations of the form \(\boldsymbol{\xi} \propto e^{in(\phi - q\theta)}\) with large toroidal mode number \(n \gg 1\) are expanded using the eikonal ansatz. The resulting local stability criterion involves a one-dimensional ODE along the field line, parametrised by the poloidal angle \(\theta\).
</div>

The ballooning stability limit provides the most stringent constraint on the achievable plasma pressure in tokamaks. It depends sensitively on the magnetic shear profile, the pressure gradient, and the shape of the magnetic surfaces (triangularity, elongation). Optimising these parameters to maximize the stable pressure limit is one of the central goals of tokamak design.

<div class="example">
<strong>Example 5.5 (Troyon Limit).</strong> The maximum achievable normalised beta in a tokamak, as determined by a combination of kink and ballooning stability limits, satisfies the empirical Troyon scaling:

\[
\beta_{\max}(\%) \approx \beta_N \frac{I_p(\text{MA})}{a(\text{m})\,B_T(\text{T})},
\]
where \(\beta_N \approx 2.8\text{--}3.5\) is the normalised beta limit, \(I_p\) is the plasma current, \(a\) is the minor radius, and \(B_T\) is the toroidal field. For ITER parameters (\(I_p = 15\;\text{MA}\), \(a = 2\;\text{m}\), \(B_T = 5.3\;\text{T}\)), this gives \(\beta_{\max} \approx 2.5\%\). Pushing beyond this limit through optimised shaping and current profiles is an active area of advanced tokamak research.
</div>

### 5.6 Rayleigh-Taylor and Kelvin-Helmholtz in MHD

The classical hydrodynamic instabilities of Rayleigh-Taylor (heavy fluid over light) and Kelvin-Helmholtz (velocity shear at an interface) are both modified by the presence of a magnetic field.

<div class="theorem">
<strong>Theorem 5.4 (Rayleigh-Taylor in MHD).</strong> Consider a horizontal interface separating a fluid of density \(\rho_1\) (above) from \(\rho_2\) (below) with gravity \(\mathbf{g} = -g\hat{\mathbf{z}}\) and a horizontal magnetic field \(\mathbf{B}_0 = B_0 \hat{\mathbf{x}}\). The dispersion relation for perturbations with wavevector \(\mathbf{k} = k_x \hat{\mathbf{x}} + k_y \hat{\mathbf{y}}\) is

\[
\omega^2 = -\frac{(\rho_1 - \rho_2) g k}{(\rho_1 + \rho_2)} + \frac{2 k_x^2 B_0^2}{\mu_0(\rho_1 + \rho_2)},
\]
where \(k = |\mathbf{k}|\). The magnetic field stabilises modes with \(k_x \neq 0\) through tension, but modes with \(k_x = 0\) (interchange modes perpendicular to the field) remain unstable.
</div>

The magnetic field thus provides a partial stabilisation: it suppresses modes that must bend the field lines but is powerless against modes that can interchange flux tubes without bending. This anisotropic stabilisation is a recurring theme in MHD. The physical picture is clear: perturbations that bend the field lines must do work against the magnetic tension \(B^2/\mu_0\), and when this energy cost exceeds the gravitational energy released by the interchange, the mode is stabilised. But perturbations aligned with the field lines slip through without bending them, extracting gravitational energy unopposed.

<div class="example">
<strong>Example 5.3 (Magnetic Rayleigh-Taylor in Supernovae).</strong> The Rayleigh-Taylor instability with magnetic field plays a crucial role in supernova remnant evolution. As the blast wave decelerates, the dense shell of swept-up interstellar medium sits atop the lighter, hot interior — a gravitationally unstable configuration. The interstellar magnetic field partially stabilises the interface, suppressing small-scale fingers while permitting large-scale plumes. This selective stabilisation produces the characteristic filamentary structure observed in remnants like the Crab Nebula.
</div>

### 5.7 Kelvin-Helmholtz Instability with Magnetic Field

The Kelvin-Helmholtz instability arises at a shear layer between two fluid streams moving at different velocities. In MHD, a magnetic field component along the flow direction can suppress this instability through the tension force.

<div class="example">
<strong>Example 5.4 (Kelvin-Helmholtz with Magnetic Field).</strong> For the Kelvin-Helmholtz instability at an interface with velocity jump \(\Delta U\) and aligned magnetic field \(B_0\), the growth rate is

\[
\omega^2 = -\frac{\rho_1 \rho_2}{(\rho_1 + \rho_2)^2}(k \cdot \Delta\mathbf{U})^2 + \frac{(\mathbf{k} \cdot \mathbf{B}_0)^2}{\mu_0(\rho_1 + \rho_2)}.
\]
The magnetic tension term \((\mathbf{k} \cdot \mathbf{B}_0)^2\) stabilises the instability when the field is strong enough. Complete stabilisation occurs when the Alfvén speed exceeds half the velocity jump, which explains why strong magnetic fields can suppress turbulent mixing at shear layers in astrophysical jets and magnetospheric boundaries.
</div>

<div class="remark">
<strong>Remark 5.2.</strong> The stabilisation of the Kelvin-Helmholtz instability by magnetic fields has direct observational consequences. At the Earth's magnetopause — the boundary between the solar wind and the magnetosphere — the Kelvin-Helmholtz instability is frequently observed on the flanks (where the magnetic field is nearly perpendicular to the flow) but suppressed on the dayside (where the field is more aligned with the velocity shear). Spacecraft missions such as THEMIS and MMS have directly imaged the resulting rolled-up vortices.
</div>

---

## Chapter 6: Magnetic Reconnection

In ideal MHD, the frozen-in flux theorem prohibits changes in the topology of magnetic field lines: field lines that are initially connected remain connected for all time. Yet observations of solar flares, magnetospheric substorms, and sawtooth crashes in tokamaks demonstrate that topological restructuring of the magnetic field does occur, often explosively, releasing vast amounts of stored magnetic energy. The process by which this happens is called magnetic reconnection. It requires some departure from ideal MHD — resistivity, electron inertia, or kinetic effects — but its consequences are felt on macroscopic scales far exceeding the small dissipation region.

### 6.1 The Reconnection Problem

The fundamental problem of reconnection theory is one of scale separation. Consider two regions of oppositely directed magnetic field brought together by a flow. At the boundary, a thin current sheet forms. Inside this sheet, the magnetic field reverses direction and the frozen-in constraint must break down, allowing field lines to "reconnect" with new partners. The rate at which this happens determines the energy release rate.

<div class="definition">
<strong>Definition 6.1 (Lundquist Number).</strong> The <em>Lundquist number</em> is the magnetic Reynolds number based on the Alfvén speed:

\[
S = \frac{v_A L}{\eta},
\]
where \(L\) is the macroscopic length scale. In astrophysical plasmas, \(S\) is enormous: \(S \sim 10^{10}\text{--}10^{14}\) in the solar corona.
</div>

The challenge of reconnection theory is to explain how a process that occurs in a tiny resistive layer (of width \(\delta \ll L\)) can produce reconnection rates that are fast enough to account for the observed energy release times. Simple resistive models predict rates that scale as negative powers of \(S\) and are far too slow for astrophysical applications.

### 6.2 The Sweet-Parker Model

The first quantitative model of reconnection was developed independently by Peter Sweet (1958) and Eugene Parker (1957). It considers a steady-state, two-dimensional reconnection layer of length \(L\) and width \(\delta\).

<div class="theorem">
<strong>Theorem 6.1 (Sweet-Parker Reconnection Rate).</strong> In the Sweet-Parker model, the inflow velocity \(v_i\), outflow velocity \(v_o\), and layer width \(\delta\) satisfy:

\[
v_o \sim v_A, \quad \delta \sim \frac{L}{\sqrt{S}}, \quad v_i \sim \frac{v_A}{\sqrt{S}},
\]
and the dimensionless reconnection rate is

\[
M_A = \frac{v_i}{v_A} \sim S^{-1/2}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> The Sweet-Parker model rests on three ingredients. (i) Mass conservation: fluid enters the layer from the sides with velocity \(v_i\) over length \(L\) and exits at the ends with velocity \(v_o\) over width \(\delta\), so \(v_i L \sim v_o \delta\). (ii) The outflow is accelerated by the magnetic tension; balancing \(\rho v_o^2/L \sim B^2/(\mu_0 L)\) gives \(v_o \sim v_A\). (iii) Inside the layer, resistive diffusion balances inflow advection: \(v_i \sim \eta/\delta\). Combining: from (iii), \(\delta \sim \eta/v_i\). From (i), \(v_i L \sim v_A \delta\), so \(v_i L \sim v_A \eta/v_i\), giving \(v_i^2 \sim v_A \eta/L\), hence \(v_i \sim v_A/\sqrt{S}\) with \(S = v_A L/\eta\). \(\square\)
</div>

For the solar corona with \(S \sim 10^{12}\), the Sweet-Parker rate gives \(M_A \sim 10^{-6}\), corresponding to a reconnection time of order \(10^6\) Alfvén times — far too slow to explain the observed flare time scales of minutes to hours. This discrepancy has been called the "reconnection problem" and has motivated the search for faster reconnection mechanisms. The Sweet-Parker model, despite its shortcomings in predicting fast reconnection, remains important as the baseline against which all other reconnection models are compared. Its prediction that the current sheet width scales as \(\delta \sim L/\sqrt{S}\) has been confirmed numerically and provides the starting point for the plasmoid instability analysis (Section 6.4).

<div class="remark">
<strong>Remark 6.4.</strong> An important feature of the Sweet-Parker model is that it predicts a very thin current sheet: for the solar corona with \(S \sim 10^{12}\), \(\delta/L \sim 10^{-6}\), giving a sheet thickness of only \(\sim 100\;\text{m}\) for a macroscopic scale of \(10^8\;\text{m}\). Such extreme aspect ratios make the sheet susceptible to secondary instabilities (tearing, plasmoid), which is why the Sweet-Parker configuration is dynamically unstable at high Lundquist number.
</div>

<div class="example">
<strong>Example 6.1 (Solar Flare Energetics).</strong> A typical solar flare releases \(\sim 10^{25}\;\text{J}\) of energy in \(\sim 10^3\;\text{s}\). The Alfvén time for a coronal loop of length \(L \sim 10^8\;\text{m}\) with \(v_A \sim 10^6\;\text{m}\,\text{s}^{-1}\) is \(\tau_A \sim 100\;\text{s}\). The observed reconnection rate is thus \(M_A \sim \tau_A/\tau_{\text{flare}} \sim 0.1\), orders of magnitude faster than the Sweet-Parker prediction of \(M_A \sim 10^{-6}\).
</div>

### 6.3 Petschek Reconnection

Harry Petschek (1964) proposed that the reconnection layer need not extend over the full macroscopic length \(L\). Instead, he argued that standing slow-mode shocks emanating from a compact diffusion region could mediate the conversion of magnetic energy to kinetic energy.

<div class="theorem">
<strong>Theorem 6.2 (Petschek Reconnection Rate).</strong> In Petschek's model, the reconnection rate is

\[
M_A \sim \frac{\pi}{8\ln S},
\]
which is only weakly dependent on \(S\). For \(S \sim 10^{12}\), this gives \(M_A \sim 0.01\text{--}0.02\), orders of magnitude faster than Sweet-Parker.
</div>

The key insight is that the dissipation region can be much smaller than \(L\): most of the energy conversion happens at the slow shocks, not in the resistive layer. However, numerical simulations with uniform resistivity tend to produce Sweet-Parker rather than Petschek configurations. Petschek reconnection requires either localised resistivity (enhanced only near the X-point) or kinetic effects beyond fluid MHD.

<div class="remark">
<strong>Remark 6.1.</strong> Modern understanding recognises that collisionless effects — particularly the decoupling of electron and ion motion at the ion skin depth scale \(d_i = c/\omega_{pi}\) — are essential for producing fast reconnection in weakly collisional plasmas. The Hall MHD model, which retains the Hall term \(\mathbf{J} \times \mathbf{B}/(ne)\) in Ohm's law, produces fast reconnection rates \(M_A \sim 0.1\) independent of the dissipation mechanism, consistent with observations.
</div>

### 6.4 The Tearing Mode Instability

Even when reconnection is not being driven externally, a current sheet can be spontaneously unstable to the tearing mode, which breaks the sheet into a chain of magnetic islands.

<div class="theorem">
<strong>Theorem 6.3 (Tearing Mode Growth Rate).</strong> A Harris current sheet \(\mathbf{B} = B_0 \tanh(y/a)\hat{\mathbf{x}}\) of half-width \(a\) is unstable to perturbations with wavenumber \(k < 1/a\). The growth rate scales as

\[
\gamma \sim \frac{v_A}{a}\left(\frac{a}{L_\eta}\right)^{3/5}(ka)^{2/5} \sim \tau_A^{-3/5}\tau_\eta^{-2/5},
\]
where \(\tau_A = a/v_A\) is the Alfvén time and \(\tau_\eta = a^2/\eta\) is the resistive diffusion time for the sheet. The growth rate is intermediate between these two time scales.
</div>

The tearing mode is important because it provides a spontaneous pathway to reconnection. In the nonlinear stage, magnetic islands grow, coalesce, and can trigger explosive reconnection when the Lundquist number exceeds a critical value \(S_c \sim 10^4\), leading to the plasmoid instability — a violent fragmentation of the current sheet into a chain of secondary islands. This plasmoid-mediated reconnection may be the mechanism responsible for fast reconnection in high-\(S\) astrophysical plasmas.

<div class="remark">
<strong>Remark 6.3.</strong> The plasmoid instability, analysed by Loureiro, Schekochihin, and Cowley (2007), shows that Sweet-Parker current sheets with \(S > S_c \sim 10^4\) are violently unstable and fragment into a chain of \(\sim S^{3/8}\) plasmoids. The resulting reconnection rate becomes nearly independent of \(S\), scaling as \(M_A \sim S^0 \sim 0.01\). This result bridges the gap between the slow Sweet-Parker rate and the fast Petschek rate, providing a self-consistent mechanism for fast reconnection in resistive MHD without requiring anomalous resistivity.
</div>

### 6.5 Collisionless Reconnection

In weakly collisional plasmas (the solar wind, magnetosphere, solar corona), the dissipation region is governed by kinetic physics rather than resistivity. The key insight is that at scales below the ion skin depth \(d_i = c/\omega_{pi}\), ions decouple from the magnetic field while electrons remain frozen in. This creates a two-scale structure: an outer ion diffusion region of width \(\sim d_i\) and an inner electron diffusion region of width \(\sim d_e = c/\omega_{pe}\).

<div class="definition">
<strong>Definition 6.2 (Hall MHD Reconnection).</strong> In <em>Hall MHD</em>, the generalised Ohm's law includes the Hall term:

\[
\mathbf{E} + \mathbf{u} \times \mathbf{B} = \frac{1}{ne}\mathbf{J} \times \mathbf{B} - \frac{1}{ne}\nabla \cdot \mathsf{P}_e + \eta\mathbf{J}.
\]
The Hall term \(\mathbf{J} \times \mathbf{B}/(ne)\) breaks the symmetry of the resistive MHD reconnection layer and produces a characteristic quadrupolar out-of-plane magnetic field pattern that has been observed in spacecraft measurements at the magnetopause and magnetotail.
</div>

The Hall term introduces a characteristic quadrupolar structure in the out-of-plane magnetic field component, which is a distinctive signature of Hall-mediated reconnection. The reconnection rate in Hall MHD is \(M_A \sim 0.1\), fast and essentially independent of the dissipation mechanism. This universality was demonstrated numerically in the GEM (Geospace Environment Modeling) challenge, where fluid, hybrid, and fully kinetic simulations all converged on the same reconnection rate once the Hall term was included. The NASA Magnetospheric Multiscale (MMS) mission, launched in 2015, has provided direct observations of the electron diffusion region, confirming the predicted structure.

### 6.6 Astrophysical Applications

Magnetic reconnection is central to many astrophysical phenomena:

<div class="example">
<strong>Example 6.2 (Magnetospheric Substorms).</strong> In Earth's magnetotail, the solar wind stretches magnetic field lines into a thin current sheet on the nightside. When reconnection occurs (triggered by southward-turning of the interplanetary magnetic field), the stored magnetic energy is rapidly converted to kinetic energy of plasma flows and energetic particles, producing auroral displays. The typical reconnection rate inferred from observations is \(M_A \sim 0.1\), consistent with collisionless reconnection models.
</div>

<div class="remark">
<strong>Remark 6.2.</strong> In tokamak plasmas, the sawtooth instability involves periodic reconnection events at the \(q = 1\) surface. The crash phase, in which the hot core is expelled on a time scale much shorter than the resistive time, has been a major puzzle and likely involves mechanisms beyond simple resistive MHD, including two-fluid and kinetic effects.
</div>

---

## Chapter 7: Dynamo Theory

How do planets, stars, and galaxies maintain their magnetic fields against ohmic decay? The answer lies in dynamo theory: the generation and sustenance of magnetic fields by the motion of conducting fluids. The dynamo problem is one of the great challenges of mathematical physics, combining elements of MHD, turbulence theory, bifurcation theory, and differential geometry. This chapter develops the theory from the kinematic dynamo problem through the fundamental anti-dynamo theorems to the mean-field theory that provides our best understanding of the solar and geodynamo.

### 7.1 The Kinematic Dynamo Problem

In the kinematic dynamo problem, we study the evolution of the magnetic field under a prescribed velocity field, ignoring the back-reaction of the field on the flow (the Lorentz force). This is appropriate in the early stages of field growth, when the magnetic field is weak.

<div class="definition">
<strong>Definition 7.1 (Kinematic Dynamo).</strong> A velocity field \(\mathbf{u}(\mathbf{x}, t)\) is a <em>kinematic dynamo</em> if the solution of the induction equation

\[
\frac{\partial \mathbf{B}}{\partial t} = \nabla \times (\mathbf{u} \times \mathbf{B}) + \eta \nabla^2 \mathbf{B}
\]
with divergence-free initial data \(\mathbf{B}(\mathbf{x}, 0)\) grows without bound as \(t \to \infty\) (for at least some initial condition), despite the diffusive term.
</div>

The kinematic dynamo is an eigenvalue problem: the induction equation is linear in \(\mathbf{B}\), so we seek solutions \(\mathbf{B} \propto e^{pt}\) with \(\text{Re}(p) > 0\). The question is: for which velocity fields \(\mathbf{u}\) does such a growing mode exist?

### 7.2 Anti-Dynamo Theorems

Before seeking successful dynamos, it is instructive to understand what does not work. Several fundamental results, known as anti-dynamo theorems, place restrictions on the class of velocity and magnetic fields that can sustain a dynamo.

<div class="theorem">
<strong>Theorem 7.1 (Cowling's Theorem, 1933).</strong> A steady, axisymmetric magnetic field cannot be maintained by dynamo action. That is, no axisymmetric flow can sustain an axisymmetric magnetic field against ohmic decay.
</div>

<div class="proof">
<strong>Proof.</strong> (Sketch, following Cowling) Decompose the axisymmetric magnetic field as \(\mathbf{B} = B_\phi \hat{\boldsymbol{\phi}} + \mathbf{B}_p\), where \(\mathbf{B}_p\) is the poloidal field. The poloidal field has the form \(\mathbf{B}_p = \nabla \times (A\hat{\boldsymbol{\phi}})\) for some function \(A(R,Z)\). By axisymmetry, \(A\) must vanish at some circle (the "neutral line") in a meridional plane where \(B_\phi = 0\) and \(\mathbf{B}_p\) has only a radial component. The induction equation for \(A\) gives, at steady state, \(\eta \nabla^2 A = \mathbf{u}_p \cdot \nabla A\). Evaluating on the neutral line where \(A = 0\) and using the maximum principle for elliptic equations leads to a contradiction unless \(A \equiv 0\), meaning the poloidal field is zero and no dynamo exists. \(\square\)
</div>

Cowling's theorem is deeply significant: it tells us that all real dynamos must be inherently three-dimensional. The Earth's roughly axisymmetric dipole field cannot be maintained by an axisymmetric flow; the convection in the core must have essential three-dimensional structure.

<div class="theorem">
<strong>Theorem 7.2 (Zeldovich's Anti-Dynamo Theorem).</strong> No two-dimensional flow (i.e., \(\mathbf{u} = \mathbf{u}(x, y, t)\) with \(u_z = 0\)) can act as a dynamo for a magnetic field \(\mathbf{B}(x, y, t)\).
</div>

More precisely, Zeldovich showed that the two-dimensional component of the magnetic field always decays, even though the \(z\)-component of the field can be amplified by stretching. This result, together with Cowling's theorem, demonstrates that dynamo action requires fully three-dimensional flows. The proof relies on showing that the magnetic flux function (the two-dimensional analogue of the vector potential) satisfies a maximum principle that forces it to decay.

Additional anti-dynamo results include the theorem of Bullard and Gellman (1954) that purely toroidal flows cannot sustain a dynamo, and the result that flows confined to a plane (planar flows) cannot act as dynamos. These negative results collectively establish that successful dynamos require flows with three-dimensional structure, nonzero helicity, and sufficient complexity — conditions that are naturally met in turbulent convection in rotating bodies.

<div class="remark">
<strong>Remark 7.1.</strong> The anti-dynamo theorems are existence results: they tell us what is impossible, not what is possible. The search for working dynamos has been one of the great enterprises of twentieth-century mathematical physics, and the first rigorous examples (Herzenberg 1958, Backus 1958) were constructed precisely to circumvent these theorems.
</div>

### 7.3 Mean-Field Electrodynamics and the Alpha Effect

Real astrophysical flows are turbulent, and we cannot hope to track the magnetic field in full spatial detail. Mean-field electrodynamics, developed by Steenbeck, Krause, and Rädler (1966), provides a systematic framework for averaging the induction equation over the turbulent fluctuations.

<div class="definition">
<strong>Definition 7.2 (Mean-Field Decomposition).</strong> Decompose the velocity and magnetic fields into mean and fluctuating parts:

\[
\mathbf{u} = \overline{\mathbf{u}} + \mathbf{u}', \quad \mathbf{B} = \overline{\mathbf{B}} + \mathbf{B}',
\]
where the overbar denotes an ensemble (or spatial) average and \(\overline{\mathbf{u}'} = \overline{\mathbf{B}'} = \mathbf{0}\).
</div>

Averaging the induction equation gives the mean-field induction equation:

\[
\frac{\partial \overline{\mathbf{B}}}{\partial t} = \nabla \times (\overline{\mathbf{u}} \times \overline{\mathbf{B}}) + \nabla \times \boldsymbol{\mathcal{E}} + \eta \nabla^2 \overline{\mathbf{B}},
\]

where \(\boldsymbol{\mathcal{E}} = \overline{\mathbf{u}' \times \mathbf{B}'}\) is the mean electromotive force (emf) arising from the correlations between the fluctuating velocity and magnetic fields.

<div class="theorem">
<strong>Theorem 7.3 (Alpha Effect).</strong> For turbulence that is statistically homogeneous and isotropic but lacks mirror symmetry (i.e., has nonzero helicity), the mean emf can be expanded as

\[
\boldsymbol{\mathcal{E}} = \alpha \overline{\mathbf{B}} - \beta \nabla \times \overline{\mathbf{B}} + \cdots,
\]
where \(\alpha = -\frac{1}{3}\tau_c \overline{\mathbf{u}' \cdot (\nabla \times \mathbf{u}')}\) is proportional to the <em>kinetic helicity</em> of the turbulence and \(\beta = \frac{1}{3}\tau_c \overline{|\mathbf{u}'|^2}\) is the <em>turbulent diffusivity</em>. Here \(\tau_c\) is the correlation time of the turbulence.
</div>

The alpha effect is remarkable: it shows that helical turbulence can generate a mean emf parallel to the mean magnetic field. This is precisely what is needed to close the dynamo loop. In the absence of the alpha effect, the mean-field induction equation is purely diffusive and no dynamo is possible (consistent with the anti-dynamo theorems applied to the mean field).

<div class="remark">
<strong>Remark 7.2.</strong> The lack of mirror symmetry (nonzero helicity) is essential. In a rotating, stratified system like the Earth's core or the solar convection zone, the Coriolis force naturally imparts helicity to rising and sinking convective plumes, with opposite signs in the two hemispheres. This is the physical origin of the alpha effect in geophysical and astrophysical dynamos.
</div>

### 7.4 The Alpha-Omega Dynamo

The most successful model of the solar magnetic cycle combines the alpha effect with differential rotation (the omega effect).

<div class="definition">
<strong>Definition 7.3 (Alpha-Omega Dynamo).</strong> An <em>\(\alpha\Omega\)-dynamo</em> operates when:
(i) The \(\Omega\)-effect — differential rotation shearing a poloidal field to generate a toroidal field: \(\partial B_\phi / \partial t \sim B_p R\,\partial\Omega/\partial r\).
(ii) The \(\alpha\)-effect — helical turbulence twisting the toroidal field to regenerate the poloidal field: \(\partial \overline{\mathbf{B}}_p / \partial t \sim \nabla \times (\alpha \overline{B}_\phi \hat{\boldsymbol{\phi}})\).
These two processes close the dynamo loop.
</div>

The \(\alpha\Omega\)-dynamo model, when applied to the Sun, naturally produces oscillatory solutions (dynamo waves) that propagate equatorward, reproducing the observed butterfly diagram of sunspot emergence over the 22-year magnetic cycle. The dimensionless dynamo number \(D = \alpha \Delta\Omega L^3/\eta_T^2\), where \(\Delta\Omega\) is the differential rotation and \(\eta_T = \eta + \beta\) the total diffusivity, must exceed a critical value for dynamo action.

<div class="example">
<strong>Example 7.1 (Parker's Dynamo Waves).</strong> Parker (1955) showed that the \(\alpha\Omega\)-dynamo equations in a Cartesian slab admit travelling wave solutions of the form \(\overline{B} \propto e^{i(kx - \omega t) + pt}\), with the dynamo wave propagating in the direction of \(-\alpha(\partial\Omega/\partial r)\hat{\boldsymbol{\phi}} \times \hat{\mathbf{r}}\). For the Sun, with \(\alpha > 0\) in the northern hemisphere and \(\partial\Omega/\partial r > 0\) (as observed in the tachocline), the waves propagate equatorward, in agreement with the butterfly diagram.
</div>

<div class="theorem">
<strong>Theorem 7.4 (Dynamo Wave Dispersion Relation).</strong> For the \(\alpha\Omega\)-dynamo in a Cartesian slab with \(\alpha = \alpha_0 = \text{const}\) and uniform shear \(G = R\,d\Omega/dr\), the mean-field equations for the toroidal field \(B\) and poloidal potential \(A\) yield travelling-wave solutions with complex frequency

\[
\omega = (1 + i)\left(\frac{\alpha_0 G k}{2\eta_T}\right)^{1/2} - i\eta_T k^2.
\]
Dynamo action (\(\text{Im}(\omega) > 0\)) occurs when the dynamo number \(D = \alpha_0 G L^3/\eta_T^2\) exceeds a critical value \(D_c\) of order unity.
</div>

The direction of propagation of the dynamo wave depends on the sign of \(\alpha_0 G\): the wave travels in the \(-\hat{\mathbf{x}}\) direction if \(\alpha_0 G > 0\) and in the \(+\hat{\mathbf{x}}\) direction if \(\alpha_0 G < 0\). For the Sun, equatorward propagation (matching the butterfly diagram) requires \(\alpha_0 G < 0\) in the northern hemisphere, which is consistent with the observed sign of differential rotation at the tachocline and the expected sign of the \(\alpha\)-effect from rotating convection.

### 7.5 Fast Dynamos

A dynamo is called "fast" if its growth rate remains bounded away from zero as \(\mathrm{Rm} \to \infty\), and "slow" if the growth rate vanishes in this limit.

<div class="definition">
<strong>Definition 7.4 (Fast Dynamo).</strong> A kinematic dynamo is <em>fast</em> if the maximal growth rate \(p_{\max}\) of the magnetic field satisfies

\[
\liminf_{\mathrm{Rm} \to \infty} \text{Re}(p_{\max}) > 0.
\]
</div>

Fast dynamos are of fundamental importance in astrophysics, where \(\mathrm{Rm}\) is so large that a slow dynamo (whose growth rate scales as a negative power of \(\mathrm{Rm}\)) would be ineffective. The stretch-twist-fold (STF) mechanism, introduced by Vainshtein and Zeldovich, provides the canonical example: a flow that stretches a flux tube, twists it into a figure-eight, and folds it back on itself doubles the magnetic flux in each cycle, producing exponential growth independent of \(\mathrm{Rm}\).

<div class="remark">
<strong>Remark 7.3.</strong> Rigorous results on fast dynamos are difficult. The Vishik anti-fast-dynamo theorem states that the flow must have chaotic trajectories (positive Lyapunov exponents) for a fast dynamo to operate. Numerical evidence strongly supports fast dynamo action in the ABC flow (\(A = B = C = 1\)) and in various chaotic maps, but complete rigorous proofs remain elusive for smooth flows.
</div>

### 7.6 The Geodynamo and Solar Dynamo

The two most studied natural dynamos are the geodynamo (in Earth's liquid iron core) and the solar dynamo (in the Sun's convection zone).

<div class="example">
<strong>Example 7.2 (The Geodynamo).</strong> Earth's magnetic field is generated by convective motions in the liquid outer core, which extends from about 1220 km (inner core boundary) to 3480 km (core-mantle boundary). The relevant parameters are: \(\eta \sim 1\;\text{m}^2\,\text{s}^{-1}\), \(L \sim 3500\;\text{km}\), \(U \sim 5 \times 10^{-4}\;\text{m}\,\text{s}^{-1}\), giving \(\mathrm{Rm} \sim 10^3\). The magnetic field reverses polarity at irregular intervals averaging about 300,000 years, a phenomenon that any successful dynamo model must reproduce. Modern numerical geodynamo simulations (Glatzmaier and Roberts 1995) have achieved realistic field morphology and spontaneous reversals, though at parameter values far from the actual Earth. The key dimensionless parameters of the geodynamo — the Ekman number \(E = \nu/(\Omega L^2) \sim 10^{-15}\), the magnetic Prandtl number \(\mathrm{Pm} = \nu/\eta \sim 10^{-6}\), and the Rayleigh number \(\mathrm{Ra} \sim 10^{15}\text{--}10^{20}\) — are so extreme that direct numerical simulation at Earth-like parameters remains beyond reach. Present simulations operate at \(E \sim 10^{-6}\), \(\mathrm{Pm} \sim 1\), and the extrapolation to realistic parameters is an active and challenging research frontier.
</div>

<div class="example">
<strong>Example 7.3 (The Solar Dynamo).</strong> The Sun's magnetic cycle has a period of approximately 22 years (11 years between successive sunspot maxima, with a polarity reversal each half-cycle). The dynamo is believed to operate at the tachocline — the thin shear layer between the rigidly rotating radiative interior and the differentially rotating convection zone. The \(\Omega\)-effect from the strong radial shear at the tachocline generates toroidal field, which rises through the convection zone by magnetic buoyancy and is twisted by the Coriolis force (\(\alpha\)-effect) to regenerate the poloidal component.
</div>

---

## Chapter 8: Kinetic MHD and Beyond

The MHD description, powerful as it is, has intrinsic limitations. It treats the plasma as a single, electrically conducting fluid and assumes that the distribution function of each particle species is close to a Maxwellian (local thermodynamic equilibrium). When the mean free path becomes comparable to the macroscopic scale — as in the solar wind, the Earth's magnetosphere, and the outer regions of accretion discs — this fluid description breaks down and kinetic effects become important. This chapter surveys the extensions of MHD into the kinetic regime.

### 8.1 Limitations of Fluid MHD

The MHD equations are derived from moments of the Boltzmann equation under the assumption that the particle distribution functions are nearly isotropic (Maxwellian). This requires that the collision mean free path \(\lambda_{\text{mfp}}\) be much smaller than the macroscopic length scale \(L\): \(\lambda_{\text{mfp}} \ll L\). When this ordering breaks down, several new phenomena arise that are absent from fluid MHD:

(i) Pressure anisotropy (\(p_\parallel \neq p_\perp\)), giving rise to firehose and mirror instabilities.
(ii) Heat flux along field lines, which cannot be captured by an isotropic thermal conductivity.
(iii) Landau damping and cyclotron resonances — collisionless wave-particle interactions that damp waves and heat particles.
(iv) Finite Larmor radius (FLR) effects that introduce dispersion and modify the wave spectrum at scales \(k_\perp \rho_i \sim 1\).

<div class="remark">
<strong>Remark 8.1.</strong> In the solar wind at 1 AU, the proton mean free path is \(\lambda_{\text{mfp}} \sim 1\;\text{AU}\) — comparable to the heliocentric distance itself. The solar wind is therefore essentially collisionless, and its dynamics cannot be faithfully described by MHD alone. Nevertheless, MHD often remains a useful first approximation because the Larmor radius is much smaller than the macroscopic scale, and the magnetic field provides an effective "collisionality" for cross-field transport.
</div>

### 8.2 The Vlasov-Maxwell System

The fundamental kinetic description of a collisionless plasma is the Vlasov-Maxwell system.

<div class="definition">
<strong>Definition 8.1 (Vlasov Equation).</strong> The <em>Vlasov equation</em> for species \(s\) (electrons or ions) with mass \(m_s\) and charge \(q_s\) is

\[
\frac{\partial f_s}{\partial t} + \mathbf{v} \cdot \nabla f_s + \frac{q_s}{m_s}(\mathbf{E} + \mathbf{v} \times \mathbf{B}) \cdot \frac{\partial f_s}{\partial \mathbf{v}} = 0,
\]
where \(f_s(\mathbf{x}, \mathbf{v}, t)\) is the distribution function in phase space. The electromagnetic fields \(\mathbf{E}\) and \(\mathbf{B}\) are determined self-consistently from Maxwell's equations with charge and current densities computed as moments of \(f_s\).
</div>

The Vlasov-Maxwell system is a nonlinear integro-differential system in six-dimensional phase space and is far more complex than the MHD equations. However, its structure admits powerful conservation laws (energy, momentum, Casimir invariants) and supports a rich spectrum of wave modes that includes all the MHD waves as low-frequency limits.

### 8.3 The CGL Double-Adiabatic Theory

When collisions are rare but the Larmor radius is small compared to the macroscopic scale, an intermediate description between MHD and full kinetics is possible. Chew, Goldberger, and Low (1956) derived a set of fluid equations for a collisionless, magnetised plasma by taking moments of the Vlasov equation while preserving the anisotropy of the pressure tensor.

<div class="theorem">
<strong>Theorem 8.1 (CGL Equations).</strong> In the CGL double-adiabatic theory, the pressure tensor is

\[
\mathsf{P} = p_\perp \mathsf{I} + (p_\parallel - p_\perp)\hat{\mathbf{b}}\hat{\mathbf{b}},
\]
where \(\hat{\mathbf{b}} = \mathbf{B}/B\) is the unit vector along the magnetic field, and \(p_\parallel\), \(p_\perp\) are the pressures parallel and perpendicular to \(\mathbf{B}\). In the absence of heat fluxes, the two adiabatic invariants are:

\[
\frac{d}{dt}\left(\frac{p_\perp}{\rho B}\right) = 0 \quad \text{(conservation of magnetic moment)},
\]

\[
\frac{d}{dt}\left(\frac{p_\parallel B^2}{\rho^3}\right) = 0 \quad \text{(conservation of the parallel adiabatic invariant)}.
\]
</div>

The CGL equations reduce to isotropic MHD when \(p_\parallel = p_\perp = p\), which holds when collisions are frequent enough to isotropise the distribution. The first CGL invariant is simply the conservation of the magnetic moment \(\mu = m v_\perp^2/(2B)\) of individual particles, elevated to a fluid statement. The second reflects the conservation of the longitudinal action \(J = \oint v_\parallel dl\) for particles bouncing between magnetic mirrors.

The pressure anisotropy in CGL theory introduces new instabilities that have no counterpart in isotropic MHD.

<div class="theorem">
<strong>Theorem 8.3 (Firehose and Mirror Instabilities).</strong> A plasma with anisotropic pressure is subject to:
(i) The <em>firehose instability</em> when \(p_\parallel - p_\perp > B^2/\mu_0\), which bends and destabilises field lines (an excess of parallel pressure acts like a fluid in a fire hose, buckling the tube).
(ii) The <em>mirror instability</em> when \(p_\perp/p_\parallel > 1 + 1/\beta_\perp\), which creates compressive fluctuations in field strength — magnetic bottles that trap particles and grow at the expense of perpendicular pressure.
</div>

These instabilities act as regulators of pressure anisotropy in collisionless plasmas. When the anisotropy exceeds the instability threshold, rapid growth of fluctuations scatters particles and drives the distribution back toward the marginally stable state. This self-regulation is observed in the solar wind, where the measured distribution of \(p_\perp/p_\parallel\) clusters near the firehose and mirror instability boundaries.

<div class="example">
<strong>Example 8.1 (Pressure Anisotropy in the Solar Wind).</strong> In the solar wind, the magnetic field strength decreases with heliocentric distance as the field lines spread out. Conservation of the magnetic moment predicts \(p_\perp/B = \text{const}\), so \(p_\perp\) decreases as \(B\) decreases. Simultaneously, the parallel pressure evolves according to the second invariant. The net result is that \(p_\perp < p_\parallel\) is expected in the expanding solar wind — and this is indeed observed, though instabilities (mirror and firehose) limit the degree of anisotropy.
</div>

### 8.4 Gyrokinetics

For many plasma physics applications, including turbulence in fusion devices and the solar wind, the relevant fluctuations have frequencies much lower than the ion cyclotron frequency and perpendicular wavelengths much longer than the ion Larmor radius. Gyrokinetics exploits this scale separation by averaging the Vlasov equation over the fast gyromotion, reducing the dimensionality of phase space from six to five.

<div class="definition">
<strong>Definition 8.2 (Gyrokinetic Ordering).</strong> The <em>gyrokinetic ordering</em> assumes

\[
\frac{\omega}{\Omega_i} \sim \frac{k_\parallel}{k_\perp} \sim \frac{\delta B}{B} \sim \frac{\delta n}{n} \sim \epsilon \ll 1,
\]
where \(\Omega_i = q_i B/(m_i)\) is the ion cyclotron frequency, and \(k_\parallel\), \(k_\perp\) are the parallel and perpendicular wavenumbers. Under this ordering, the distribution function is expanded as \(f_s = F_{0s} + \delta f_s\) with \(\delta f_s / F_{0s} \sim \epsilon\).
</div>

<div class="remark">
<strong>Remark 8.2.</strong> Gyrokinetics is the theoretical foundation of modern tokamak turbulence simulations. Codes such as GS2, GENE, and GYRO solve the gyrokinetic equations to predict turbulent transport in tokamaks. The success of gyrokinetic theory in explaining experimentally observed transport levels is one of the triumphs of modern plasma physics.
</div>

The gyrokinetic equation for the non-adiabatic part of the distribution function \(h_s = \delta f_s + (q_s \varphi / T_s) F_{0s}\), where \(\varphi\) is the electrostatic potential, takes the form of an advection equation in the reduced (five-dimensional) phase space, coupled to the field equations through quasineutrality and Ampère's law. The gyroaveraging operation \(\langle \cdot \rangle_\alpha\), which averages over the gyrophase angle \(\alpha\), smooths out the short-scale cyclotron physics and retains only the low-frequency dynamics relevant for turbulence and transport.

<div class="example">
<strong>Example 8.5 (Ion Temperature Gradient Mode).</strong> The ion temperature gradient (ITG) mode is the dominant instability driving turbulent transport in tokamak core plasmas. In the gyrokinetic framework, this mode is driven by the free energy in the ion temperature gradient \(\nabla T_i\) and is characterised by perpendicular wavelengths \(k_\perp \rho_i \sim 0.3\text{--}0.7\) and real frequencies \(\omega \sim \omega_{*Ti} = k_\theta \rho_i (v_{Ti}/L_{Ti})\), where \(L_{Ti} = -T_i/(dT_i/dr)\) is the temperature gradient scale length. The ITG mode is destabilised when \(L_{Ti}\) falls below a critical value that depends on the magnetic geometry — a prediction that has been extensively verified by gyrokinetic simulations and experimental measurements of turbulent transport in tokamaks worldwide.
</div>

### 8.5 Landau Damping

One of the most important kinetic effects absent from fluid MHD is Landau damping: the collisionless damping of waves due to resonant interaction between the wave and particles whose velocity matches the wave phase speed.

<div class="theorem">
<strong>Theorem 8.2 (Landau Damping).</strong> Consider an electrostatic wave with frequency \(\omega\) and wavenumber \(k\) in a Vlasov plasma with equilibrium distribution \(f_0(v)\). The dispersion relation has a complex frequency

\[
\omega = \omega_r + i\gamma,
\]
where the damping rate for weak damping (\(|\gamma| \ll \omega_r\)) is

\[
\gamma = -\frac{\pi \omega_r^3}{2 k^2} \frac{q^2}{m \varepsilon_0} \left.\frac{\partial f_0}{\partial v}\right|_{v = \omega_r/k}.
\]
For a Maxwellian distribution (which has \(\partial f_0/\partial v < 0\) for \(v > 0\)), \(\gamma < 0\) and the wave is damped.
</div>

Landau damping is a purely kinetic effect with no counterpart in fluid theory. It arises because particles travelling slightly slower than the wave gain energy from the wave's electric field, while those slightly faster lose energy; for a Maxwellian, there are more slow particles than fast ones near the phase velocity, so the net effect is energy transfer from wave to particles. In MHD, the analogous process — the damping of Alfvén waves by resonant ions — is called cyclotron damping and requires a kinetic treatment.

<div class="example">
<strong>Example 8.2 (Landau Damping of Kinetic Alfvén Waves).</strong> At scales approaching the ion Larmor radius \(\rho_i\), Alfvén waves develop a parallel electric field component and become kinetic Alfvén waves (KAWs). These can undergo Landau damping on electrons, with damping rate \(\gamma/\omega \sim \sqrt{\beta_e}(k_\perp \rho_i)^2\) for \(k_\perp \rho_i \lesssim 1\). This dissipation channel is believed to be responsible for heating the solar corona and accelerating the solar wind in open-field regions.
</div>

### 8.6 Collisionless Shocks

In ordinary gas dynamics, a shock wave is a thin transition layer in which kinetic energy is irreversibly converted to thermal energy by viscous dissipation. In a collisionless plasma, particle-particle collisions are too rare to provide the necessary dissipation, yet shock waves are ubiquitous (bow shocks, supernova remnants, interplanetary shocks). The dissipation mechanism must therefore be fundamentally different.

<div class="definition">
<strong>Definition 8.3 (Collisionless Shock).</strong> A <em>collisionless shock</em> is a discontinuous transition in a plasma where the dissipation is provided not by binary collisions but by collective electromagnetic interactions: wave-particle scattering, anomalous resistivity from microinstabilities, and/or reflection of ions by the shock potential.
</div>

The structure of a collisionless shock depends critically on the Mach number \(M_A = v_{\text{shock}}/v_A\) and the angle \(\theta_{Bn}\) between the upstream magnetic field and the shock normal. For quasi-perpendicular shocks (\(\theta_{Bn} \gtrsim 45°\)), the shock structure is relatively laminar and mediated by the magnetic foot — a region where reflected ions gyrate back upstream. For quasi-parallel shocks (\(\theta_{Bn} \lesssim 45°\)), the structure is turbulent and extended, with a foreshock region of backstreaming ions and ULF waves.

<div class="example">
<strong>Example 8.3 (Earth's Bow Shock).</strong> The solar wind, with \(v \sim 400\;\text{km}\,\text{s}^{-1}\) and \(v_A \sim 50\;\text{km}\,\text{s}^{-1}\), impinges on Earth's magnetosphere at \(M_A \sim 8\). The resulting bow shock, standing at about 15 Earth radii upstream, is a collisionless shock that heats and decelerates the solar wind to form the subsonic magnetosheath flow. Spacecraft observations (THEMIS, MMS) have revealed the fine-scale kinetic structure of this shock, including ion reflection, electron heating, and the excitation of a zoo of plasma waves.
</div>

<div class="remark">
<strong>Remark 8.3.</strong> The transition from MHD to kinetic physics is not a sharp boundary but a continuum. For many problems, hybrid approaches — MHD on large scales, kinetic physics in localised regions (current sheets, shocks, reconnection sites) — offer the best compromise between fidelity and computational tractability. The development of multi-scale simulation techniques remains an active frontier in computational plasma physics.
</div>

---

<div class="remark">
<strong>Remark 8.4.</strong> The hierarchy of plasma descriptions can be summarised as follows. At the most fundamental level, the Vlasov-Maxwell system describes the full six-dimensional phase-space dynamics. Gyrokinetics reduces this to five dimensions by averaging over the fast gyromotion, and is appropriate for low-frequency, small-amplitude fluctuations. The CGL/double-adiabatic theory is a moment closure of the Vlasov equation that retains pressure anisotropy but discards kinetic resonances (Landau damping). Standard MHD is a further simplification that assumes isotropic pressure and a scalar Ohm's law. Each level sacrifices some physics for computational tractability, and the art of plasma modelling lies in choosing the appropriate level for the problem at hand.
</div>

### 8.7 The Magnetorotational Instability

As a final example of MHD physics beyond the classical topics, we briefly discuss the magnetorotational instability (MRI), which has revolutionised our understanding of accretion disc physics.

<div class="theorem">
<strong>Theorem 8.4 (Magnetorotational Instability, Balbus and Hawley 1991).</strong> A differentially rotating, conducting fluid with angular velocity \(\Omega(R)\) decreasing outward (\(d\Omega^2/dR < 0\)) is unstable in the presence of a weak vertical magnetic field \(\mathbf{B} = B_z \hat{\mathbf{z}}\), provided

\[
\frac{d\Omega^2}{d\ln R} < 0.
\]
The maximum growth rate is \(\gamma_{\max} = \frac{3}{4}\Omega\) (for a Keplerian disc with \(\Omega \propto R^{-3/2}\)), achieved at a wavelength of order the Alfvén wavelength \(\lambda \sim v_A/\Omega\). Crucially, the instability requires only an arbitrarily weak magnetic field.
</div>

The MRI is remarkable because the Rayleigh criterion for centrifugal stability of an unmagnetised disc requires \(d(R^2 \Omega)/dR > 0\), which is satisfied for Keplerian rotation. Thus, a Keplerian disc is stable by the Rayleigh criterion but unstable by the MRI — the weak magnetic field fundamentally changes the stability properties. The physical mechanism is elegantly simple: the magnetic field acts as a spring connecting two fluid elements at slightly different radii. The inner element orbits faster and pulls the outer one forward, giving it angular momentum and causing it to move outward; the outer element drags the inner one back, removing angular momentum and causing it to fall inward. This positive feedback loop drives the instability and provides the angular momentum transport needed to explain accretion rates in astrophysical discs.

<div class="example">
<strong>Example 8.4 (Accretion Disc Turbulence).</strong> In a protoplanetary disc around a young star, the MRI drives MHD turbulence that transports angular momentum outward, allowing mass to accrete onto the star. The effective viscosity produced by MRI turbulence, parametrised by the Shakura-Sunyaev \(\alpha\)-parameter, is typically \(\alpha \sim 10^{-2}\), consistent with observational constraints from disc lifetimes and accretion rates. Regions of the disc that are too cool and weakly ionised to couple to the magnetic field (the "dead zone") are MRI-stable and may be sites of enhanced planet formation.
</div>

---

*These notes have developed the mathematical theory of magnetohydrodynamics from its electromagnetic foundations through the ideal and resistive MHD equations, wave theory, equilibria, stability, reconnection, dynamo theory, and kinetic extensions. The subject is vast and still actively evolving: recent advances in kinetic reconnection, turbulence theory, gyrokinetics, and computational MHD continue to deepen our understanding of conducting fluids across an enormous range of physical settings, from laboratory plasmas to the large-scale structure of the universe.*
