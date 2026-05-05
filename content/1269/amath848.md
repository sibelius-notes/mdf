---
why: |
  UW has general fluid mechanics (AMATH 463/863) and mathematical biology (383/881/882) but nothing at their intersection — the fluid mechanics of living systems. Biological fluid dynamics is a thriving DAMTP subject (Cambridge Part III, taught by Goldstein and Lauga) that combines Stokes flow theory with biological function, and is also taught at Oxford, Stanford, and MIT.
made_up: true
title: "AMATH 848: Biological Fluid Dynamics"
subjects: "AMATH"
---

*These notes synthesize material from E. Lauga's The Fluid Dynamics of Cell Motility, C. Pozrikidis's Modeling and Simulation of Capsules and Biological Cells, S.S. Sadhal, P.S. Ayyaswamy, and J.N. Chung's Transport Phenomena with Drops and Bubbles, T.J. Pedley's The Fluid Mechanics of Large Blood Vessels, Y.C. Fung's Biomechanics: Circulation, and supplementary material from Cambridge DAMTP Biological Fluid Dynamics notes (Goldstein, Lauga), Stanford Biofluid Mechanics courses, and MIT 2.25 (Advanced Fluid Mechanics) supplementary notes.*

---

## Chapter 1: Low-Reynolds-Number Hydrodynamics

The fluid environment of microorganisms is profoundly different from the one we experience as macroscopic creatures. A bacterium swimming through water encounters a world dominated entirely by viscosity: inertia is negligible, and the governing equations reduce from the full Navier-Stokes system to the linear Stokes equations. This chapter develops the mathematical framework of low-Reynolds-number hydrodynamics, establishes the fundamental singular solutions that serve as Green's functions for biological flow problems, and derives several remarkable theorems — the scallop theorem, the Lorentz reciprocal theorem, and the minimum dissipation principle — that profoundly constrain the physics of life at small scales.

### 1.1 The Reynolds Number and the Stokes Limit

The incompressible Navier-Stokes equations for a fluid of density \(\rho\), viscosity \(\mu\), velocity \(\mathbf{u}\), and pressure \(p\) are

\[
\rho\left(\frac{\partial \mathbf{u}}{\partial t} + \mathbf{u}\cdot\nabla\mathbf{u}\right) = -\nabla p + \mu\nabla^2\mathbf{u} + \mathbf{f}, \quad \nabla\cdot\mathbf{u} = 0,
\]

where \(\mathbf{f}\) represents body forces. The relative importance of inertial and viscous forces is measured by the Reynolds number.

<div class="definition">
<strong>Definition 1.1 (Reynolds Number).</strong> For a body of characteristic length \(L\) moving with velocity \(U\) through a fluid of kinematic viscosity \(\nu = \mu/\rho\), the <em>Reynolds number</em> is

\[
\mathrm{Re} = \frac{UL}{\nu}.
\]
When \(\mathrm{Re} \ll 1\), viscous forces dominate inertial forces and the flow is said to be in the <em>Stokes regime</em>.
</div>

To appreciate the magnitude of \(\mathrm{Re}\) in biological contexts, consider an *E. coli* bacterium: \(L \approx 2\;\mu\text{m}\), \(U \approx 30\;\mu\text{m/s}\), and \(\nu \approx 10^{-6}\;\text{m}^2/\text{s}\) for water at room temperature. This gives \(\mathrm{Re} \approx 6 \times 10^{-5}\). A human spermatozoon (\(L \approx 50\;\mu\text{m}\), \(U \approx 200\;\mu\text{m/s}\)) has \(\mathrm{Re} \approx 10^{-2}\). Even the largest ciliates operate at \(\mathrm{Re} < 1\). As Purcell (1977) memorably observed, a bacterium coasting after its flagellar motor stops would travel only about 0.1 angstroms — less than the diameter of a hydrogen atom — before coming to rest.

### 1.2 The Stokes Equations

In the limit \(\mathrm{Re} \to 0\), the nonlinear inertial terms vanish and we obtain the Stokes equations for steady, incompressible, viscous flow.

<div class="definition">
<strong>Definition 1.2 (Stokes Equations).</strong> The <em>Stokes equations</em> for an incompressible Newtonian fluid are

\[
-\nabla p + \mu\nabla^2\mathbf{u} + \mathbf{f} = \mathbf{0}, \quad \nabla\cdot\mathbf{u} = 0.
\]
Equivalently, in terms of the stress tensor \(\boldsymbol{\sigma} = -p\mathbf{I} + \mu(\nabla\mathbf{u} + \nabla\mathbf{u}^T)\), we have \(\nabla\cdot\boldsymbol{\sigma} + \mathbf{f} = \mathbf{0}\).
</div>

Several remarkable properties follow immediately from the linearity and time-independence of the Stokes equations. First, the pressure is harmonic: taking the divergence of the momentum equation and using incompressibility yields \(\nabla^2 p = \nabla\cdot\mathbf{f}\), which in the absence of body forces gives \(\nabla^2 p = 0\). Second, the vorticity \(\boldsymbol{\omega} = \nabla\times\mathbf{u}\) is also harmonic (biharmonic for the velocity itself): \(\nabla^2\boldsymbol{\omega} = \mathbf{0}\). Third, solutions are instantaneous — the flow at any instant depends only on the current boundary conditions, with no memory of the past. This instantaneity is the mathematical basis for the scallop theorem.

<div class="remark">
<strong>Remark 1.1.</strong> The Stokes equations admit the well-known Stokes paradox in two dimensions: there is no solution for steady Stokes flow past an infinite cylinder that satisfies both the no-slip condition on the cylinder and the uniform flow condition at infinity. The paradox is resolved by retaining the Oseen correction, which reintroduces a weak inertial effect at large distances. In three dimensions, no such paradox arises.
</div>

### 1.3 Fundamental Singular Solutions

The Green's function of the Stokes equations — the flow due to a point force — is the most fundamental building block for constructing solutions in biological fluid dynamics.

<div class="definition">
<strong>Definition 1.3 (Stokeslet).</strong> The <em>Stokeslet</em> (or Oseen-Burgers tensor) is the velocity field generated by a point force \(\mathbf{F}\delta(\mathbf{x} - \mathbf{x}_0)\) in an unbounded Stokes flow. Setting \(\mathbf{r} = \mathbf{x} - \mathbf{x}_0\) and \(r = |\mathbf{r}|\), the velocity is

\[
u_i(\mathbf{x}) = \frac{1}{8\pi\mu}\left(\frac{\delta_{ij}}{r} + \frac{r_i r_j}{r^3}\right)F_j \equiv \frac{1}{8\pi\mu}J_{ij}(\mathbf{r})F_j,
\]
where \(J_{ij}\) is the <em>Oseen tensor</em>. The associated pressure is \(p(\mathbf{x}) = \frac{1}{4\pi}\frac{r_j F_j}{r^3}\).
</div>

The Stokeslet decays as \(1/r\), which is the slowest possible decay for a Stokes flow — a consequence of the fact that a point force exerts a net force on the fluid. Higher-order singularities, obtained by taking derivatives of the Stokeslet, decay faster and are of great importance in modelling force-free swimmers.

<div class="definition">
<strong>Definition 1.4 (Stresslet and Rotlet).</strong> The <em>stresslet</em> is the symmetric force dipole, obtained by taking the symmetric gradient of the Stokeslet:

\[
S_{ijk}(\mathbf{r}) = -\frac{3}{4\pi}\frac{r_i r_j r_k}{r^5}.
\]
The <em>rotlet</em> is the antisymmetric force dipole, representing the flow due to a point torque:

\[
R_{ij}(\mathbf{r}) = \frac{1}{8\pi}\epsilon_{ijk}\frac{r_k}{r^3}.
\]
The stresslet decays as \(1/r^2\) and is the leading-order far-field singularity for a force-free, torque-free swimmer.
</div>

The classification of swimmers by their far-field stresslet signature — pushers (like *E. coli*), pullers (like *Chlamydomonas*), and neutral swimmers — is one of the central organising principles of biological fluid dynamics, and will be explored in detail in Chapter 8.

### 1.4 Faxen's Laws

When a sphere is immersed in an ambient Stokes flow \(\mathbf{u}^\infty(\mathbf{x})\) (the undisturbed flow that would exist in the absence of the sphere), the force and torque on the sphere can be expressed in terms of the ambient flow evaluated at the sphere's centre. These remarkable results are known as Faxen's laws.

<div class="theorem">
<strong>Theorem 1.1 (Faxen's Laws for a Sphere).</strong> A rigid sphere of radius \(a\) centred at \(\mathbf{x}_0\), translating with velocity \(\mathbf{U}\) and rotating with angular velocity \(\boldsymbol{\Omega}\) in an ambient Stokes flow \(\mathbf{u}^\infty\), experiences a force \(\mathbf{F}\) and torque \(\mathbf{T}\) given by

\[
\mathbf{F} = 6\pi\mu a\left[\mathbf{u}^\infty(\mathbf{x}_0) + \frac{a^2}{6}\nabla^2\mathbf{u}^\infty(\mathbf{x}_0) - \mathbf{U}\right],
\]

\[
\mathbf{T} = 8\pi\mu a^3\left[\frac{1}{2}\nabla\times\mathbf{u}^\infty(\mathbf{x}_0) - \boldsymbol{\Omega}\right].
\]
</div>

<div class="proof">
<strong>Proof.</strong> The proof exploits the linearity of the Stokes equations and the Lorentz reciprocal theorem. One decomposes the total flow into the ambient flow plus a disturbance caused by the sphere. The force on the sphere can be written as a surface integral of the stress, which, by the reciprocal theorem applied to the Stokes drag solution for a sphere, reduces to an average of the ambient flow over the sphere surface. Using the identity

\[
\frac{1}{4\pi a^2}\int_{|\mathbf{x}-\mathbf{x}_0|=a}\mathbf{u}^\infty\,dS = \mathbf{u}^\infty(\mathbf{x}_0) + \frac{a^2}{6}\nabla^2\mathbf{u}^\infty(\mathbf{x}_0),
\]
which holds for any function satisfying the biharmonic equation, one immediately obtains the first Faxen law. The torque formula follows similarly from the antisymmetric part of the ambient velocity gradient. \(\square\)
</div>

Faxen's laws are indispensable in the study of particle suspensions and the hydrodynamic interactions between microswimmers, since they allow one to compute forces and torques without solving the full boundary-value problem around each particle.

### 1.5 The Lorentz Reciprocal Theorem

The reciprocal theorem for Stokes flow is the analogue of Green's second identity for Laplace's equation, and is arguably the single most powerful tool in low-Reynolds-number hydrodynamics.

<div class="theorem">
<strong>Theorem 1.2 (Lorentz Reciprocal Theorem).</strong> Let \((\mathbf{u}, \boldsymbol{\sigma})\) and \((\hat{\mathbf{u}}, \hat{\boldsymbol{\sigma}})\) be two Stokes flow solutions in a domain \(V\) bounded by surface \(S\). Then

\[
\int_S \mathbf{u}\cdot\hat{\boldsymbol{\sigma}}\cdot\mathbf{n}\,dS = \int_S \hat{\mathbf{u}}\cdot\boldsymbol{\sigma}\cdot\mathbf{n}\,dS,
\]
where \(\mathbf{n}\) is the outward unit normal to \(S\).
</div>

<div class="proof">
<strong>Proof.</strong> Since both flows satisfy the Stokes equations without body forces, \(\nabla\cdot\boldsymbol{\sigma} = \mathbf{0}\) and \(\nabla\cdot\hat{\boldsymbol{\sigma}} = \mathbf{0}\). Consider the quantity \(\nabla\cdot(\mathbf{u}\cdot\hat{\boldsymbol{\sigma}}) = u_i\partial_j\hat{\sigma}_{ij} + \hat{\sigma}_{ij}\partial_j u_i\). The first term vanishes by the Stokes equations. The second term equals \(\hat{\sigma}_{ij}e_{ij}\) where \(e_{ij} = \frac{1}{2}(\partial_i u_j + \partial_j u_i)\) is the rate-of-strain tensor, since \(\hat{\boldsymbol{\sigma}}\) is symmetric and the antisymmetric part of \(\nabla\mathbf{u}\) does not contribute. But \(\hat{\sigma}_{ij}e_{ij} = (-\hat{p}\delta_{ij} + 2\mu\hat{e}_{ij})e_{ij} = 2\mu\hat{e}_{ij}e_{ij}\) by incompressibility. By symmetry, the same expression arises from \(\nabla\cdot(\hat{\mathbf{u}}\cdot\boldsymbol{\sigma})\). Hence \(\nabla\cdot(\mathbf{u}\cdot\hat{\boldsymbol{\sigma}}) = \nabla\cdot(\hat{\mathbf{u}}\cdot\boldsymbol{\sigma})\), and integrating over \(V\) and applying the divergence theorem yields the result. \(\square\)
</div>

Stone and Samuel (1996) showed how the reciprocal theorem can be used to compute the swimming velocity of a deforming body without solving the full Stokes boundary-value problem — one simply needs the solution for the rigid-body motion of the same geometry, which serves as the auxiliary problem \(\hat{\mathbf{u}}\).

<div class="example">
<strong>Example 1.3 (Using the Reciprocal Theorem to Find Swimming Speed).</strong> Consider a sphere of radius \(a\) that swims by executing small surface deformations \(\mathbf{u}_S(\theta, \phi, t)\) on its surface. To find the swimming velocity \(\mathbf{U}\) without solving the full flow field, choose the auxiliary problem \(\hat{\mathbf{u}}\) to be the Stokes flow past a rigid sphere translating with velocity \(\hat{\mathbf{U}}\). The reciprocal theorem gives

\[
\hat{\mathbf{U}} \cdot \mathbf{F} = \int_S \mathbf{u}_S \cdot \hat{\boldsymbol{\sigma}} \cdot \mathbf{n}\, dS,
\]
where \(\mathbf{F}\) is the force on the swimming sphere (zero, since it is force-free). For the auxiliary problem, \(\hat{\boldsymbol{\sigma}} \cdot \mathbf{n}\) on the sphere surface is known explicitly from the Stokes drag solution: it equals \(-\frac{3\mu}{2a}\hat{\mathbf{U}}\) plus terms involving the surface position. After evaluating the integral, the force-free condition \(\mathbf{F} = \mathbf{0}\) yields \(\mathbf{U}\) directly in terms of the surface velocity, recovering the squirmer swimming speed \(U = \frac{2}{3}B_1\) when \(\mathbf{u}_S\) is expanded in squirming modes. This elegant technique, due to Stone and Samuel (1996), avoids the need to solve for the full exterior flow field.
</div>

### 1.6 The Scallop Theorem

Perhaps the most celebrated result in biological fluid dynamics is the scallop theorem, which places a fundamental topological constraint on locomotion at zero Reynolds number.

<div class="theorem">
<strong>Theorem 1.3 (Scallop Theorem, Purcell 1977).</strong> A body executing a sequence of shape changes that is identical when time-reversed (a <em>reciprocal</em> motion) achieves zero net displacement in Stokes flow.
</div>

<div class="proof">
<strong>Proof.</strong> Since the Stokes equations are linear and instantaneous (no time derivatives), the velocity field at any instant depends only on the current boundary conditions and their instantaneous rates of change. Let \(\xi(t)\) parametrise the shape of the swimmer, and suppose the motion is reciprocal: the sequence of shapes traced out as \(t\) goes from \(0\) to \(T/2\) is the same as from \(T/2\) to \(T\), but traversed in reverse. By the linearity and time-reversibility of Stokes flow, the swimming velocity \(\mathbf{U}(\xi, \dot{\xi})\) satisfies \(\mathbf{U}(\xi, -\dot{\xi}) = -\mathbf{U}(\xi, \dot{\xi})\). The net displacement over one full cycle is

\[
\Delta\mathbf{x} = \int_0^T \mathbf{U}(\xi(t), \dot{\xi}(t))\,dt.
\]
Since the second half of the cycle retraces the first half with reversed velocities, the two contributions cancel exactly, giving \(\Delta\mathbf{x} = \mathbf{0}\). \(\square\)
</div>

The scallop theorem tells us that a scallop — an organism with a single degree of freedom (open/close) — cannot swim in the Stokes regime, no matter how cleverly it times its opening and closing. To achieve net locomotion, a microorganism must execute a non-reciprocal sequence of shape changes, breaking the time-reversal symmetry. This is why bacteria rotate helical flagella (a motion that is inherently non-reciprocal) and why eukaryotic cilia beat with distinct power and recovery strokes.

### 1.7 The Minimum Dissipation Theorem

The Stokes equations can also be characterised variationally: among all incompressible velocity fields satisfying the given boundary conditions, the Stokes solution is the one that minimises the viscous dissipation.

<div class="theorem">
<strong>Theorem 1.4 (Helmholtz Minimum Dissipation Theorem).</strong> Let \(\mathbf{u}\) be the Stokes flow in a domain \(V\) satisfying prescribed boundary conditions on \(\partial V\), and let \(\mathbf{v}\) be any other solenoidal velocity field satisfying the same boundary conditions. Then

\[
\int_V 2\mu\, e_{ij}e_{ij}\,dV \leq \int_V 2\mu\, \tilde{e}_{ij}\tilde{e}_{ij}\,dV,
\]
where \(e_{ij}\) and \(\tilde{e}_{ij}\) are the strain-rate tensors of \(\mathbf{u}\) and \(\mathbf{v}\), respectively. Equality holds if and only if \(\mathbf{v} = \mathbf{u}\).
</div>

This theorem provides a powerful tool for obtaining bounds on drag forces and swimming efficiencies: any trial velocity field gives an upper bound on the true dissipation, and hence an upper bound on the drag. It also has a biological interpretation — evolution, constrained by the physics of Stokes flow, drives microswimmers toward stroke patterns that minimise energy expenditure for a given swimming speed.

<div class="example">
<strong>Example 1.1 (Stokes Drag on a Sphere).</strong> The most basic application of the Stokes equations is the drag on a rigid sphere of radius \(a\) translating with velocity \(\mathbf{U}\) through a quiescent fluid. The exact solution, obtained by Stokes (1851), gives the velocity field

\[
\mathbf{u}(\mathbf{r}) = \frac{3a}{4r}\left(1 + \frac{a^2}{3r^2}\right)\mathbf{U} + \frac{3a}{4r}\left(1 - \frac{a^2}{r^2}\right)(\mathbf{U}\cdot\hat{\mathbf{r}})\hat{\mathbf{r}},
\]
and the drag force is the celebrated <em>Stokes drag law</em>:

\[
\mathbf{F} = -6\pi\mu a\,\mathbf{U}.
\]
The power dissipated in the fluid is \(P = \mathbf{F}\cdot\mathbf{U} = 6\pi\mu a U^2\). This result is the building block for Faxen's laws, sedimentation theory, and the mobility tensors used in Stokesian dynamics simulations.
</div>

<div class="lemma">
<strong>Lemma 1.1 (Uniqueness of Stokes Flow).</strong> The solution to the Stokes equations in a bounded domain \(V\) with prescribed velocity on \(\partial V\) is unique. In an unbounded domain, uniqueness holds provided the velocity decays at least as \(O(1/r)\) at infinity.
</div>

<div class="proof">
<strong>Proof.</strong> Suppose \(\mathbf{u}_1\) and \(\mathbf{u}_2\) are two solutions satisfying the same boundary conditions. Then \(\mathbf{w} = \mathbf{u}_1 - \mathbf{u}_2\) satisfies the homogeneous Stokes equations with \(\mathbf{w} = \mathbf{0}\) on \(\partial V\). By the minimum dissipation theorem, the dissipation of \(\mathbf{w}\) is less than or equal to that of any other divergence-free field vanishing on \(\partial V\) — in particular, the zero field. Hence the dissipation of \(\mathbf{w}\) is zero, which for a Newtonian fluid implies \(\nabla\mathbf{w} + \nabla\mathbf{w}^T = \mathbf{0}\), so \(\mathbf{w}\) is a rigid-body motion. The boundary condition \(\mathbf{w} = \mathbf{0}\) then forces \(\mathbf{w} = \mathbf{0}\) identically. \(\square\)
</div>

Uniqueness is biologically significant: it means that the instantaneous flow around a microorganism is completely determined by the current shape and velocity of the organism, with no dependence on history. This is the mathematical reason why the scallop theorem holds — and why low-Reynolds-number locomotion is fundamentally geometric rather than dynamic.

<div class="example">
<strong>Example 1.2 (Stokes Flow Past a Translating and Rotating Sphere).</strong> A sphere of radius \(a\) simultaneously translates with velocity \(\mathbf{U}\) and rotates with angular velocity \(\boldsymbol{\Omega}\) in a quiescent fluid. By linearity, the solution is the superposition of the Stokes translating-sphere solution and the rotlet solution. The force and torque are decoupled:

\[
\mathbf{F} = -6\pi\mu a\,\mathbf{U}, \quad \mathbf{T} = -8\pi\mu a^3\,\boldsymbol{\Omega}.
\]
The absence of cross-coupling (rotation does not produce a force, translation does not produce a torque) is a consequence of the symmetry of the sphere. For a body lacking this symmetry — such as a helix — translation-rotation coupling occurs and is precisely the mechanism by which rotating bacterial flagella generate thrust (Chapter 3).
</div>

---

## Chapter 2: Swimming at Low Reynolds Number

With the mathematical machinery of Chapter 1 in hand, we now turn to the central question of biological fluid dynamics at the microscale: how do organisms propel themselves through viscous fluids? This chapter presents the classical analytical models of microswimming — Taylor's swimming sheet, Lighthill's squirmer, and the slender body theories of Lighthill, Cox, and Johnson — alongside the resistance-based theories that remain the workhorse of flagellar modelling.

### 2.1 Taylor's Swimming Sheet

In 1951, G.I. Taylor posed the simplest possible model of a swimming microorganism: an infinite two-dimensional sheet executing transverse sinusoidal waves. Despite its apparent simplicity, this model captures the essential physics of how wave-like deformations generate propulsion in the Stokes regime.

<div class="example">
<strong>Example 2.1 (Taylor's Swimming Sheet).</strong> Consider an infinite flat sheet lying along \(y = 0\) that undergoes small-amplitude transverse displacements

\[
y = b\sin(kx - \omega t),
\]
where \(b\) is the wave amplitude, \(k = 2\pi/\lambda\) the wavenumber, and \(\omega\) the angular frequency. The wave travels to the right with phase velocity \(c = \omega/k\). Taylor showed that, to second order in \(\epsilon = bk \ll 1\), the sheet swims to the <em>left</em> (opposite to the wave) with velocity

\[
U = \frac{1}{2}\omega b^2 k + O(\epsilon^4) = \frac{1}{2}c(bk)^2 + O(\epsilon^4).
\]
</div>

The calculation proceeds by expanding the velocity field in powers of \(\epsilon\) and solving the Stokes equations order by order. At first order, the flow is a decaying sinusoidal pattern above and below the sheet. At second order, the no-slip condition on the undulating sheet generates a net streaming flow — and the requirement that the sheet be force-free determines the swimming speed. The result is remarkable: the swimming velocity scales as the square of the amplitude, a universal feature of low-Reynolds-number propulsion that reflects the quadratic nature of the coupling between boundary deformation and net transport.

Taylor's 1951 paper — written just four years after he had helped design the first atomic weapons — is a masterpiece of mathematical modelling. It demonstrated, for the first time, that a purely mechanical analysis of the Stokes equations could explain biological locomotion without invoking any mysterious "vital force." The paper opened the field that we now call biological fluid dynamics, and its perturbation technique remains the template for most analytical work on microswimming.

<div class="example">
<strong>Example 2.2 (Perturbation Expansion for the Swimming Sheet).</strong> To derive Taylor's result, write the streamfunction as \(\psi = \psi_1 + \epsilon \psi_2 + \cdots\), where \(\epsilon = bk\). At first order, the biharmonic equation \(\nabla^4\psi_1 = 0\) with boundary conditions on \(y = 0\) gives

\[
\psi_1 = -\frac{c\epsilon}{k}(1 + ky)e^{-ky}\sin(kx - \omega t).
\]
At second order, the no-slip condition must be evaluated on the displaced boundary \(y = \epsilon k^{-1}\sin(kx - \omega t)\) by Taylor-expanding in \(\epsilon\). The resulting boundary condition at \(y = 0\) for \(\psi_2\) contains a steady (time-independent) component, which drives a uniform streaming flow. Requiring zero net force on the sheet determines the swimming velocity \(U = \frac{1}{2}c\epsilon^2\). The key insight is that this streaming arises from the nonlinear interaction of the first-order solution with itself through the boundary condition — a mechanism that has no analogue in potential flow.
</div>

<div class="remark">
<strong>Remark 2.1.</strong> Taylor's result generalises to longitudinal waves as well. If the sheet undergoes tangential displacements \(x = a\sin(kx - \omega t)\), swimming occurs in the same direction as the wave. For combined longitudinal and transverse waves, the swimming speed depends on the phase difference between the two modes, providing a model for the metachronal coordination observed in ciliary carpets.
</div>

### 2.2 Resistive Force Theory

For slender flagella, the most widely used analytical approach is resistive force theory (RFT), developed by Gray and Hancock (1955) building on earlier ideas of Hancock (1953). The key approximation is that the hydrodynamic force per unit length at each point along the flagellum depends only on the local velocity of that point, with different resistance coefficients for motion tangential and normal to the filament.

<div class="definition">
<strong>Definition 2.1 (Resistive Force Theory).</strong> Let a slender filament of radius \(a\) and length \(L\) (\(a \ll L\)) be parametrised by arc length \(s\). At each point, let \(\hat{\mathbf{t}}(s)\) be the unit tangent. The hydrodynamic force per unit length is

\[
\mathbf{f}(s) = -\zeta_\parallel (\mathbf{u}\cdot\hat{\mathbf{t}})\hat{\mathbf{t}} - \zeta_\perp [\mathbf{u} - (\mathbf{u}\cdot\hat{\mathbf{t}})\hat{\mathbf{t}}],
\]
where \(\mathbf{u}(s)\) is the velocity of the filament relative to the fluid, and the <em>resistance coefficients</em> are

\[
\zeta_\parallel = \frac{2\pi\mu}{\ln(2L/a) - 1/2}, \quad \zeta_\perp = \frac{4\pi\mu}{\ln(2L/a) + 1/2}.
\]
The crucial feature is the <em>drag anisotropy</em>: \(\zeta_\perp / \zeta_\parallel \approx 2\), meaning it is approximately twice as hard to push a slender rod sideways through a viscous fluid as it is to push it lengthwise.
</div>

It is precisely this drag anisotropy that enables flagellar propulsion. A filament executing a travelling wave converts the asymmetry between normal and tangential drag into a net thrust along the filament axis. Without drag anisotropy (\(\zeta_\perp = \zeta_\parallel\)), the net force would vanish by symmetry, and no swimming would occur.

The physical origin of the drag anisotropy is intuitive: when a slender rod moves parallel to its axis, it disturbs the fluid over a length scale comparable to the rod length \(L\), and the velocity disturbance decays logarithmically. When it moves perpendicular to its axis, the disturbance is stronger because the rod presents a larger cross-section to the flow. The logarithmic dependence of the resistance coefficients on the aspect ratio \(L/a\) reflects the two-dimensional character of the local flow around a cylinder, echoing the Stokes paradox discussed in Remark 1.1.

<div class="remark">
<strong>Remark 2.2.</strong> Gray and Hancock (1955) originally obtained the resistance coefficients by matching the local flow around a slender cylinder to the outer Stokes solution, following a procedure pioneered by Burgers (1938). The result that \(\zeta_\perp/\zeta_\parallel \approx 2\) holds for a wide range of geometries. More refined calculations by Lighthill (1976) and Cox (1970) modify the logarithmic terms but preserve the fundamental ratio. For a filament near a no-slip wall, the drag coefficients increase and the ratio can deviate from 2, an effect that is important for sperm swimming near surfaces.
</div>

<div class="example">
<strong>Example 2.3 (Propulsion by a Sinusoidal Flagellum).</strong> Consider a planar sinusoidal flagellum with shape \(y(x,t) = b\sin(kx - \omega t)\) and small amplitude \(bk \ll 1\). Using RFT, the time-averaged thrust per unit length is

\[
\langle f_x \rangle = \frac{1}{2}(\zeta_\perp - \zeta_\parallel)\omega b^2 k^2 \frac{1}{1 + b^2k^2}.
\]
The net propulsive force on a flagellum of length \(L\) is balanced by the drag on the cell body, determining the steady swimming speed. Note that thrust vanishes if \(\zeta_\perp = \zeta_\parallel\), confirming that drag anisotropy is essential.
</div>

### 2.3 Slender Body Theory

While RFT is convenient and often adequate for qualitative predictions, it neglects the long-range hydrodynamic interactions between different parts of the flagellum. Slender body theory (SBT), developed by Lighthill (1976) and refined by Johnson (1980), provides a more accurate description by distributing Stokeslets and dipoles along the filament centreline and imposing the no-slip condition on the filament surface.

<div class="theorem">
<strong>Theorem 2.1 (Lighthill Slender Body Theory).</strong> For a slender filament of radius \(a\) and centreline \(\mathbf{X}(s,t)\), the velocity at a point \(s\) along the centreline is related to the force per unit length \(\mathbf{f}(s)\) by

\[
8\pi\mu\,\mathbf{u}(s) = \left[c(\hat{\mathbf{t}}\hat{\mathbf{t}} + \mathbf{I}) + 2(\mathbf{I} - \hat{\mathbf{t}}\hat{\mathbf{t}})\right]\cdot\mathbf{f}(s) + \int_0^L \left[\frac{\mathbf{I} + \hat{\mathbf{R}}\hat{\mathbf{R}}}{|\mathbf{R}|}\right]\cdot\mathbf{f}(s')\,ds',
\]
where \(c = -\ln(e\,a^2/4)\), \(\mathbf{R} = \mathbf{X}(s) - \mathbf{X}(s')\), and the integral is taken in the principal value sense. The first (local) term resembles RFT, while the integral (non-local) term accounts for hydrodynamic interactions along the body.
</div>

Slender body theory typically improves quantitative agreement with experiments by 10-30% over RFT, and is essential in situations where the flagellum curves back on itself or where multiple flagella interact. Modern computational approaches often use regularised versions of SBT (Cortez, 2001) to avoid the singularity at \(\mathbf{R} = \mathbf{0}\).

<div class="remark">
<strong>Remark 2.3.</strong> The relationship between RFT and SBT illuminates a recurring theme in biological fluid dynamics: the tension between tractability and accuracy. RFT, being a local theory, yields closed-form expressions and clear physical insight; SBT, being non-local, captures the long-range hydrodynamic correlations that become important when body parts approach each other. In practice, many researchers use RFT for initial estimates and scaling arguments, then refine with SBT or full numerical simulations (boundary element methods, regularised Stokeslets) when quantitative predictions are needed. Cortez's method of regularised Stokeslets (2001, 2005) has been particularly influential: by replacing the singular Stokeslet \(1/r\) with a regularised kernel \(1/(r^2 + \epsilon^2)^{1/2}\), it avoids the need for careful singular integrations while retaining the correct far-field behaviour.
</div>

### 2.4 Lighthill's Squirmer Model

An alternative to modelling the detailed flagellar or ciliary mechanics is to represent the swimmer as a sphere with a prescribed tangential velocity on its surface. This is Lighthill's (1952) squirmer model, refined by Blake (1971).

<div class="definition">
<strong>Definition 2.2 (Squirmer).</strong> A <em>squirmer</em> is a sphere of radius \(a\) with a prescribed axisymmetric tangential velocity on its surface:

\[
u_\theta(\theta) = \sum_{n=1}^{\infty} B_n V_n(\cos\theta),
\]
where \(V_n(\cos\theta) = \frac{2}{n(n+1)}\sin\theta\,P_n'(\cos\theta)\) and \(P_n\) are the Legendre polynomials. The angle \(\theta\) is measured from the swimming direction.
</div>

The swimming velocity of the squirmer is determined entirely by the first mode: \(U = \frac{2}{3}B_1\). The second mode \(B_2\) determines the stresslet strength and hence the far-field character of the swimmer. When \(B_2 > 0\), the squirmer is a puller (like *Chlamydomonas*); when \(B_2 < 0\), it is a pusher (like *E. coli*); and when \(B_2 = 0\), it is a neutral swimmer.

<div class="example">
<strong>Example 2.4 (Swimming Efficiency of a Squirmer).</strong> The <em>Lighthill efficiency</em> of a swimmer is defined as the ratio of the power required to drag the body at the swimming speed to the actual power dissipated by swimming:

\[
\eta = \frac{6\pi\mu a U^2}{P_{\text{swim}}}.
\]
For a squirmer with only \(B_1\) and \(B_2\) modes, the power dissipated is \(P_{\text{swim}} = \frac{4\pi\mu a}{3}(4B_1^2 + B_2^2 + \cdots)\), giving

\[
\eta = \frac{\frac{3}{2}B_1^2}{4B_1^2 + B_2^2} \leq \frac{3}{8},
\]
with the upper bound achieved when \(B_2 = 0\) (the neutral squirmer). This maximum efficiency of 37.5% is remarkably close to efficiencies estimated for *Volvox* colonies, suggesting that nature has optimised ciliary coordination.
</div>

### 2.5 Optimal Swimming Strokes

The question of which surface deformation minimises energy expenditure for a given swimming speed can be posed as a variational problem. Michelin and Lauga (2010) showed that, for the squirmer model, the optimal stroke is not steady but involves time-dependent surface velocities that break fore-aft symmetry in a non-trivial way. The optimal efficiency exceeds the steady-squirmer bound of 3/8 and approaches 1/2 in the limit of large numbers of squirming modes. This analysis connects the biophysics of microswimming to classical problems in optimal control theory.

<div class="remark">
<strong>Remark 2.4.</strong> The progression from Taylor's swimming sheet (1951) through Lighthill's squirmer (1952) and slender body theory (1976) to modern computational methods represents a deepening engagement between applied mathematics and biological reality. Taylor's sheet is a two-dimensional, infinite geometry that captures the essential physics in closed form. The squirmer is three-dimensional and finite but replaces the complex ciliary beat with a prescribed surface velocity. Slender body theory restores some of the structural detail of flagella but linearises the geometry. Each successive level of modelling sacrifices elegance for fidelity, and the art of biological fluid dynamics lies in choosing the right level for the question at hand. As Lighthill wrote in his 1975 monograph, "mathematics helps biologists not by aping the exactness of physics but by imposing a disciplined structure on biological thinking."
</div>

---

## Chapter 3: Flagellar and Ciliary Propulsion

The abstract swimming models of Chapter 2 gain biological substance when applied to real organisms. This chapter examines the two principal modes of microscale propulsion in nature — rotating helical flagella in bacteria and beating cilia/flagella in eukaryotes — and develops the fluid-mechanical theory needed to understand their function, coordination, and biological consequences.

### 3.1 Bacterial Flagellar Propulsion

The flagella of bacteria such as *E. coli* are fundamentally different from eukaryotic flagella: they are rigid helical filaments rotated by a molecular motor embedded in the cell wall. The motor spins at approximately 100 Hz, driving the helical flagellum in a corkscrew motion that generates thrust.

<div class="example">
<strong>Example 3.1 (Swimming Speed of a Helical Flagellum).</strong> Consider a rigid helix of radius \(R\), pitch angle \(\alpha\), length \(L\), and filament radius \(a\), rotating with angular velocity \(\Omega\) about its axis. Using RFT, the thrust and torque generated by the helix are

\[
F = (\zeta_\perp - \zeta_\parallel)\sin\alpha\cos\alpha\,\Omega R\, L, \quad T = (\zeta_\perp\sin^2\alpha + \zeta_\parallel\cos^2\alpha)\,\Omega R^2\, L.
\]
Balancing the flagellar thrust against the drag on a spherical cell body of radius \(a_0\), \(F = 6\pi\mu a_0 U\), gives the swimming speed

\[
U = \frac{(\zeta_\perp - \zeta_\parallel)\sin\alpha\cos\alpha\,\Omega R\, L}{6\pi\mu a_0}.
\]
For *E. coli* parameters (\(R \approx 0.2\;\mu\text{m}\), \(\alpha \approx 41°\), \(L \approx 7\;\mu\text{m}\), \(\Omega \approx 100\;\text{Hz}\)), this gives \(U \approx 25\;\mu\text{m/s}\), in good agreement with observations.
</div>

The optimum helix angle for maximising thrust per unit torque is \(\alpha^* = \arctan((\zeta_\perp/\zeta_\parallel)^{1/2} - 1)^{1/2}\), which for \(\zeta_\perp/\zeta_\parallel = 2\) gives \(\alpha^* \approx 45°\), close to the pitch angle observed in many bacterial species. This is a striking example of evolutionary optimisation under fluid-mechanical constraints.

<div class="remark">
<strong>Remark 3.2.</strong> The bacterial flagellar motor is one of the most remarkable molecular machines in nature. Powered by the transmembrane proton motive force (or, in some marine species, the sodium motive force), it can rotate at speeds up to 300 Hz in some species, switch direction within milliseconds, and operate with nearly 100% thermodynamic efficiency at low speeds. The motor was first observed directly by Silverman and Simon (1974), who tethered flagella to glass slides and watched the cell bodies rotate. Berg (2003) has provided a comprehensive account of the motor's mechanics, including the torque-speed relationship, which shows that the motor operates at approximately constant torque up to a "knee" speed and then falls off — a characteristic shared with macroscopic electric motors.
</div>

<div class="example">
<strong>Example 3.2 (Power Dissipation and Efficiency).</strong> The power dissipated by a rotating helical flagellum is \(P_{\text{flag}} = T\Omega\), where \(T\) is the torque from RFT. The useful power for propulsion is \(P_{\text{prop}} = FU\), where \(F\) is the thrust and \(U\) is the swimming speed. The propulsive efficiency is

\[
\eta_{\text{prop}} = \frac{FU}{T\Omega} = \frac{(\zeta_\perp - \zeta_\parallel)^2 \sin^2\alpha\cos^2\alpha}{(\zeta_\perp\sin^2\alpha + \zeta_\parallel\cos^2\alpha)\left(6\pi\mu a_0 + (\zeta_\perp\cos^2\alpha + \zeta_\parallel\sin^2\alpha)L\right)}.
\]
For typical *E. coli* parameters, \(\eta_{\text{prop}} \approx 1\text{-}2\%\), meaning that most of the motor's energy is dissipated into the surrounding fluid. Despite this low efficiency, the energetic cost of swimming is negligible compared to the bacterium's total metabolic expenditure — swimming consumes less than 1% of the cell's energy budget (Purcell, 1977).
</div>

### 3.2 Run-and-Tumble Motility

*E. coli* does not simply swim in straight lines. It alternates between "runs" (smooth swimming for about 1 second) and "tumbles" (brief reorientation events lasting about 0.1 seconds). During runs, the flagellar bundle rotates counterclockwise (viewed from behind) and the flagella form a coherent bundle. During tumbles, one or more flagellar motors reverse to clockwise rotation, the bundle flies apart, and the cell reorients quasi-randomly.

<div class="definition">
<strong>Definition 3.1 (Run-and-Tumble Statistics).</strong> The run-and-tumble motion of *E. coli* is characterised by exponentially distributed run durations with mean \(\tau_{\text{run}} \approx 1\;\text{s}\), and tumble durations with mean \(\tau_{\text{tumble}} \approx 0.1\;\text{s}\). The reorientation angle during a tumble is approximately 68° on average. The resulting long-time transport is diffusive with effective diffusivity

\[
D_{\text{eff}} = \frac{v^2 \tau_{\text{run}}}{3(1 - \langle\cos\theta\rangle)},
\]
where \(v\) is the swimming speed and \(\langle\cos\theta\rangle\) is the mean cosine of the tumble angle.
</div>

Chemotaxis — the ability of bacteria to navigate toward nutrients and away from toxins — is achieved not by steering but by modulating the run-and-tumble statistics: runs are extended when the bacterium detects a favourable chemical gradient, creating a biased random walk up the gradient. Berg and Brown (1972) demonstrated this mechanism experimentally, and it remains one of the most elegant examples of how evolution exploits fluid-mechanical constraints.

<div class="example">
<strong>Example 3.3 (Diffusivity of a Run-and-Tumble Swimmer).</strong> For an *E. coli* bacterium with swimming speed \(v = 25\;\mu\text{m/s}\), mean run duration \(\tau = 1\;\text{s}\), and mean tumble angle cosine \(\langle\cos\theta\rangle = 0.33\) (corresponding to an average reorientation of \(68°\)), the effective diffusivity is

\[
D_{\text{eff}} = \frac{v^2\tau}{3(1-\langle\cos\theta\rangle)} = \frac{(25)^2 \times 1}{3 \times 0.67} \approx 311\;\mu\text{m}^2/\text{s} \approx 3.1 \times 10^{-6}\;\text{cm}^2/\text{s}.
\]
This is about three times larger than the translational Brownian diffusion coefficient of a cell-sized particle (\(D_B = k_BT/(6\pi\mu a) \approx 2 \times 10^{-9}\;\text{cm}^2/\text{s}\) for \(a = 1\;\mu\text{m}\)), demonstrating that swimming dramatically enhances transport compared to passive diffusion. The factor of \(\sim 1000\) enhancement allows bacteria to efficiently explore their chemical environment on the length scale of nutrient patches (\(\sim 100\;\mu\text{m}\)).
</div>

### 3.3 Eukaryotic Flagellar Waveforms

Eukaryotic flagella (and cilia, which are structurally identical but shorter) have a fundamentally different internal structure from bacterial flagella: they contain the axoneme, a 9+2 arrangement of microtubule doublets connected by dynein molecular motors. The coordinated sliding of these microtubules produces bending waves that propagate along the flagellum.

<div class="remark">
<strong>Remark 3.1.</strong> The distinction between "cilia" and "flagella" in eukaryotes is one of morphology and function rather than structure. Cilia are typically short (\(5\)-\(10\;\mu\text{m}\)), present in large numbers, and beat in a coordinated asymmetric pattern. Flagella are longer (\(30\)-\(70\;\mu\text{m}\)), present in small numbers (one or two), and typically execute planar or helical bending waves. Both contain the same 9+2 axonemal structure.
</div>

The bending wave of a eukaryotic flagellum can be described by the curvature \(\kappa(s,t)\) as a function of arc length. For a planar wave, the flagellum shape is reconstructed from

\[
\theta(s,t) = \theta_0 + \int_0^s \kappa(s',t)\,ds',
\]

where \(\theta(s,t)\) is the tangent angle. Typical waveforms include sinusoidal travelling waves (spermatozoa), asymmetric beat patterns with distinct power and recovery strokes (cilia), and helical waves (some algal flagella).

### 3.4 Ciliary Metachronal Waves

When cilia are arranged in dense arrays — as on the surfaces of *Paramecium*, *Opalina*, or the mammalian respiratory epithelium — they do not beat in synchrony but instead exhibit metachronal waves: phase-coordinated patterns in which neighbouring cilia beat slightly out of phase, creating a wave-like pattern that propagates across the ciliated surface.

<div class="definition">
<strong>Definition 3.2 (Metachronal Wave).</strong> A <em>metachronal wave</em> is a wave of ciliary phase that propagates across a ciliated surface. If the metachronal wave propagates in the same direction as the effective stroke, it is called <em>symplectic</em>; if opposite, <em>antiplectic</em>. The phase velocity of the metachronal wave is

\[
c_m = \frac{\lambda_m}{\Delta\phi / \omega},
\]
where \(\lambda_m\) is the metachronal wavelength, \(\Delta\phi\) is the phase difference between adjacent cilia, and \(\omega\) is the beat frequency.
</div>

The question of what coordinates metachronal waves — whether it is hydrodynamic coupling between neighbouring cilia, mechanical coupling through the cell membrane, or a combination — has been the subject of intense study. Theoretical work by Gueron and Levit-Gurevich (1999) and computational studies by Elgeti and Gompper (2013) have shown that hydrodynamic interactions alone are sufficient to synchronise cilia into metachronal patterns, with antiplectic coordination emerging as the energetically preferred state.

<div class="example">
<strong>Example 3.4 (Envelope Model for Ciliary Propulsion).</strong> When cilia are densely packed, their tips trace out an undulating surface — the "envelope" — that can be modelled as a continuous deforming boundary. This is the Blake (1971) envelope model, which reduces the problem of many discrete cilia to Taylor's swimming sheet. If the cilia tips execute elliptical trajectories with semi-axes \(a\) (parallel to the surface) and \(b\) (perpendicular), the envelope velocity at angle \(\theta\) in the beat cycle is

\[
u_s(\theta) = a\omega\cos\theta, \quad u_n(\theta) = b\omega\sin\theta.
\]
Applying the squirmer framework, the first two modes are \(B_1 \propto ab\omega\) and \(B_2 \propto (a^2 - b^2)\omega\). The swimming speed is \(U = \frac{2}{3}B_1\), and the sign of \(B_2\) depends on whether the ciliary orbit is prolate (\(a > b\), puller) or oblate (\(b > a\), pusher). For *Paramecium*, the beat asymmetry makes it an effective pusher, consistent with its observed accumulation near surfaces.
</div>

### 3.5 Boundary Integral Methods for Cilia Arrays

Analytical methods reach their limits for dense cilia arrays, and numerical methods become essential. The boundary integral formulation of the Stokes equations is particularly well-suited to this class of problems.

<div class="theorem">
<strong>Theorem 3.1 (Boundary Integral Representation).</strong> The velocity at a point \(\mathbf{x}_0\) inside a domain \(V\) bounded by surface \(S\) in Stokes flow is

\[
u_j(\mathbf{x}_0) = -\frac{1}{8\pi\mu}\int_S J_{ij}(\mathbf{r})\,f_i(\mathbf{x})\,dS(\mathbf{x}) + \frac{1}{8\pi}\int_S u_i(\mathbf{x})\,T_{ijk}(\mathbf{r})\,n_k(\mathbf{x})\,dS(\mathbf{x}),
\]
where \(\mathbf{r} = \mathbf{x} - \mathbf{x}_0\), \(f_i = \sigma_{ij}n_j\) is the traction on \(S\), and \(T_{ijk} = -6\,r_i r_j r_k / r^5\) is the stress tensor associated with the Stokeslet.
</div>

The boundary integral method reduces the three-dimensional Stokes problem to a two-dimensional integral equation on the boundaries, halving the effective dimensionality. For cilia arrays, one discretises the surface of each cilium and the nearby wall, assembles the interaction matrix, and solves the resulting linear system at each time step. The method naturally handles the many-body hydrodynamic interactions that are crucial for metachronal coordination.

<div class="remark">
<strong>Remark 3.3.</strong> The computational cost of boundary integral methods scales as \(O(N^2)\) for \(N\) boundary elements, since every element interacts with every other element through the Stokeslet kernel. For large cilia arrays (hundreds of cilia, each discretised with tens of elements), this becomes prohibitive. Fast multipole methods (FMM), introduced by Greengard and Rokhlin (1987) and adapted to Stokes flow by Tornberg and Shelley (2004), reduce the cost to \(O(N)\) or \(O(N\log N)\) by exploiting the rapid decay of multipole interactions. These acceleration techniques have enabled simulations of hundreds of interacting cilia and have been instrumental in demonstrating that hydrodynamic coupling alone can produce metachronal coordination.
</div>

### 3.6 Nodal Flow and Left-Right Symmetry Breaking

One of the most striking biological consequences of ciliary flow is its role in establishing the left-right body axis of vertebrate embryos. In a structure called the embryonic node, motile cilia rotate to generate a leftward flow of extraembryonic fluid, which is detected by sensory cilia and triggers asymmetric gene expression.

<div class="example">
<strong>Example 3.5 (Nodal Flow).</strong> The motile cilia in the embryonic node are tilted posteriorly at an angle \(\psi \approx 40°\) from the vertical and rotate clockwise (viewed from above). Due to the presence of the nearby ventral wall, the hydrodynamic effect of the tilted rotation is asymmetric: the effective stroke (pointing leftward) occurs farther from the wall and generates more flow than the recovery stroke. The resulting time-averaged flow is directed from right to left with velocity \(U_{\text{nodal}} \approx 20\text{-}50\;\mu\text{m/s}\). This flow transports signalling molecules (possibly Sonic Hedgehog-containing vesicles called nodal vesicular parcels) to the left side, initiating the signalling cascade that leads to asymmetric organ placement: heart on the left, liver on the right.
</div>

The fluid mechanics of nodal flow beautifully illustrates how Stokes-flow physics at the cellular scale has macroscopic developmental consequences. Cartwright, Piro, and Tuval (2004) provided the first quantitative fluid-mechanical model of this process.

---

## Chapter 4: Blood Flow and Hemodynamics

We now shift scales dramatically — from microns to centimetres, from \(\mathrm{Re} \sim 10^{-5}\) to \(\mathrm{Re} \sim 10^3\) — and consider the flow of blood through the cardiovascular system. The Reynolds number in the human aorta is approximately 1000-4000, placing large-vessel hemodynamics firmly in the realm of unsteady, inertial flow. Nevertheless, the pulsatile nature of the cardiac cycle, the elasticity of arterial walls, and the branching geometry of the vascular tree give rise to a rich mathematical structure first elucidated by Womersley, McDonald, and Fung.

### 4.1 Steady Flow in Rigid Tubes: Poiseuille's Law

The simplest model of blood flow treats arteries as rigid cylindrical tubes with steady, fully developed flow — the classical Poiseuille flow discovered experimentally by Jean-Louis-Marie Poiseuille (a physician interested in blood flow) in the 1840s and derived theoretically by Stokes and others.

<div class="theorem">
<strong>Theorem 4.1 (Hagen-Poiseuille Law).</strong> For steady, fully developed, laminar flow of a Newtonian fluid in a rigid circular tube of radius \(R\) under a pressure gradient \(G = -dp/dz\), the velocity profile is parabolic:

\[
u(r) = \frac{G}{4\mu}(R^2 - r^2),
\]
and the volume flow rate is

\[
Q = \frac{\pi G R^4}{8\mu}.
\]
The wall shear stress is \(\tau_w = GR/2\), and the flow resistance (pressure drop per unit flow rate per unit length) is \(8\mu/(\pi R^4)\).
</div>

<div class="proof">
<strong>Proof.</strong> In cylindrical coordinates \((r, \theta, z)\) with the flow in the \(z\)-direction, the Navier-Stokes equations for steady, axisymmetric, fully developed flow reduce to

\[
0 = -\frac{dp}{dz} + \mu\frac{1}{r}\frac{d}{dr}\left(r\frac{du}{dr}\right).
\]
Since the left side is a function of \(z\) only and the right side of \(r\) only, both must equal a constant \(-G\). Integrating twice with the boundary conditions \(u(R) = 0\) (no-slip) and \(u(0)\) finite yields the parabolic profile. Integration of \(u(r)\) over the cross-section gives \(Q\). \(\square\)
</div>

The \(R^4\) dependence of flow rate on tube radius has profound physiological consequences: a 10% reduction in vessel radius (due to atherosclerotic plaque, for example) reduces flow by approximately 35%, or equivalently requires a 52% increase in pressure gradient to maintain the same flow rate. This extreme sensitivity underpins the severity of arterial stenosis.

<div class="example">
<strong>Example 4.4 (Wall Shear Stress in the Vasculature).</strong> The wall shear stress in Poiseuille flow, \(\tau_w = 4\mu Q/(\pi R^3)\), varies dramatically across the vascular tree. In the human aorta (\(R \approx 1.3\;\text{cm}\), \(Q \approx 80\;\text{mL/s}\), \(\mu \approx 3.5\;\text{mPa}\cdot\text{s}\)):

\[
\tau_w = \frac{4 \times 3.5 \times 10^{-3} \times 80 \times 10^{-6}}{\pi \times (1.3 \times 10^{-2})^3} \approx 0.16\;\text{Pa} \approx 1.6\;\text{dyn/cm}^2.
\]
In a small arteriole (\(R \approx 25\;\mu\text{m}\), \(Q \approx 10^{-4}\;\text{mL/s}\)):

\[
\tau_w \approx \frac{4 \times 3.5 \times 10^{-3} \times 10^{-10}}{\pi \times (2.5 \times 10^{-5})^3} \approx 2.9\;\text{Pa}.
\]
The endothelium responds to these shear stresses by releasing nitric oxide (a vasodilator) at physiological shear stress levels (\(1\text{-}3\;\text{Pa}\)) and by upregulating inflammatory adhesion molecules at abnormally low or oscillatory shear stress — providing a fluid-mechanical explanation for the preferential formation of atherosclerotic plaques in regions of disturbed flow.
</div>

### 4.2 Pulsatile Flow and the Womersley Number

Real blood flow is not steady but pulsatile, driven by the periodic contraction of the heart. The character of pulsatile flow in a tube depends on the Womersley number, which measures the ratio of unsteady inertial forces to viscous forces.

<div class="definition">
<strong>Definition 4.1 (Womersley Number).</strong> The <em>Womersley number</em> for flow in a tube of radius \(R\) with oscillation frequency \(\omega\) is

\[
\alpha = R\sqrt{\frac{\omega\rho}{\mu}} = R\sqrt{\frac{\omega}{\nu}}.
\]
When \(\alpha \ll 1\), viscous effects dominate and the flow is quasi-steady (Poiseuille-like at each instant). When \(\alpha \gg 1\), the flow is dominated by unsteady inertia and the velocity profile becomes flat in the core with thin oscillatory boundary layers (Stokes layers) near the wall.
</div>

In the human aorta (\(R \approx 1.3\;\text{cm}\), heart rate \(\approx 1.2\;\text{Hz}\)), \(\alpha \approx 20\), so the flow is strongly inertial. In the smallest arterioles (\(R \approx 10\;\mu\text{m}\)), \(\alpha \approx 0.01\), and the flow is quasi-steady.

<div class="theorem">
<strong>Theorem 4.2 (Womersley Flow Profile).</strong> For oscillatory flow in a rigid tube driven by a pressure gradient \(G\,e^{i\omega t}\), the axial velocity is

\[
u(r,t) = \frac{G}{i\omega\rho}\left[1 - \frac{J_0(\alpha\, r/R\, \cdot i^{3/2})}{J_0(\alpha\, i^{3/2})}\right]e^{i\omega t},
\]
where \(J_0\) is the Bessel function of the first kind of order zero and \(i^{3/2} = e^{3\pi i/4} = (-1+i)/\sqrt{2}\).
</div>

<div class="proof">
<strong>Proof.</strong> Seeking solutions of the form \(u(r,t) = \hat{u}(r)e^{i\omega t}\) in the linearised Navier-Stokes equation

\[
\rho\frac{\partial u}{\partial t} = G\,e^{i\omega t} + \mu\frac{1}{r}\frac{\partial}{\partial r}\left(r\frac{\partial u}{\partial r}\right),
\]
one obtains the Bessel equation \(\hat{u}'' + \hat{u}'/r + (i\omega\rho/\mu)\hat{u} = -G/\mu\). The general solution involves \(J_0\) and \(Y_0\); regularity at \(r = 0\) eliminates \(Y_0\), and the no-slip condition at \(r = R\) determines the remaining coefficient. \(\square\)
</div>

At large Womersley number, the velocity profile develops the characteristic "M-shape" during systole: a flat central core with rapid variation near the walls. The wall shear stress oscillates with the driving pressure but with a phase lag that depends on \(\alpha\), a fact of physiological importance since endothelial cells respond to wall shear stress by regulating vascular tone and remodelling.

<div class="example">
<strong>Example 4.3 (Womersley Profiles at Different \(\alpha\)).</strong> The limiting behaviours of the Womersley solution clarify the physics. For \(\alpha \ll 1\), expanding the Bessel function gives \(J_0(z) \approx 1 - z^2/4\), and the velocity profile reduces to the Poiseuille parabola \(u(r,t) \approx \frac{G}{4\mu}(R^2 - r^2)e^{i\omega t}\) — the flow responds quasi-steadily to the pressure gradient. For \(\alpha \gg 1\), the Bessel function argument becomes large and the flow in the core is approximately \(u \approx \frac{G}{i\omega\rho}e^{i\omega t}\) — a uniform, inviscid oscillation. Viscous effects are confined to a Stokes layer of thickness \(\delta_S = \sqrt{2\nu/\omega} = \sqrt{2}R/\alpha\) near the wall. In the human aorta with \(\alpha \approx 20\), this boundary layer has thickness \(\delta_S \approx 0.5\;\text{mm}\), much less than the vessel radius of \(13\;\text{mm}\). Womersley (1955) published these solutions while working at St Bartholomew's Hospital in London, in a series of papers that established the mathematical framework for pulsatile hemodynamics.
</div>

<div class="remark">
<strong>Remark 4.1.</strong> The physiological significance of the Womersley number extends beyond velocity profiles. In large arteries where \(\alpha \gg 1\), the oscillatory wall shear stress is approximately 90 degrees out of phase with the pressure gradient, and the flow rate is proportional to the time derivative of the pressure gradient rather than the pressure gradient itself. This inertia-dominated regime means that the arterial system cannot be modelled as a simple resistive network; the compliance of the vessel walls and the inertia of the blood column must both be included, leading to the transmission-line models of arterial hemodynamics developed by Womersley and later refined by Nichols and O'Rourke.
</div>

### 4.3 Pulse Wave Propagation

In a living artery, the walls are not rigid but elastic, and the pressure pulse generated by the heart propagates down the arterial tree as an elastic wave — the pulse wave — at a finite speed \(c_0\) that greatly exceeds the mean blood flow velocity.

<div class="definition">
<strong>Definition 4.2 (Moens-Korteweg Wave Speed).</strong> For a thin-walled elastic tube of radius \(R\), wall thickness \(h\), wall elastic modulus \(E\), and filled with fluid of density \(\rho\), the pulse wave speed is

\[
c_0 = \sqrt{\frac{Eh}{2\rho R}}.
\]
</div>

In the human aorta, \(c_0 \approx 5\text{-}6\;\text{m/s}\), while in peripheral arteries (which are stiffer and narrower), \(c_0\) can reach 10-15 m/s. The increase of pulse wave velocity with arterial stiffness is the basis of clinical measurements: elevated pulse wave velocity is an independent predictor of cardiovascular mortality.

<div class="example">
<strong>Example 4.1 (The Windkessel Model).</strong> The simplest lumped-parameter model of the arterial system, proposed by Otto Frank (1899), treats the large arteries as a compliant chamber (the Windkessel, or "air chamber") that stores blood during systole and releases it during diastole. The model is described by the ODE

\[
C\frac{dp}{dt} + \frac{p}{R_p} = Q(t),
\]
where \(C\) is the arterial compliance, \(R_p\) is the peripheral resistance, and \(Q(t)\) is the cardiac output. During diastole (\(Q = 0\)), the pressure decays exponentially: \(p(t) = p_0 e^{-t/(R_pC)}\) with time constant \(\tau = R_pC \approx 1.5\;\text{s}\), which matches the observed diastolic pressure decay in humans.
</div>

### 4.4 Flow at Arterial Bifurcations

The vascular tree is a branching network, and each bifurcation — where a parent vessel divides into two daughter vessels — creates a complex three-dimensional flow pattern that is of great clinical significance, since atherosclerotic plaques preferentially form at bifurcations.

<div class="definition">
<strong>Definition 4.3 (Murray's Law).</strong> <em>Murray's law</em> (1926) states that at an arterial bifurcation, the cube of the parent vessel radius equals the sum of the cubes of the daughter vessel radii:

\[
R_0^3 = R_1^3 + R_2^3.
\]
This is the condition that minimises the total power expenditure (sum of viscous dissipation and metabolic cost of blood volume) for steady Poiseuille flow through a branching network.
</div>

<div class="proof">
<strong>Proof.</strong> The power dissipated by Poiseuille flow in a vessel of radius \(R\) and length \(L\) carrying flow rate \(Q\) is \(W_{\text{visc}} = 8\mu L Q^2/(\pi R^4)\). The metabolic cost of maintaining the blood volume is proportional to the volume: \(W_{\text{met}} = b\pi R^2 L\) for some metabolic constant \(b\). The total cost per unit length is \(W = 8\mu Q^2/(\pi R^4) + b\pi R^2\). Minimising with respect to \(R\) gives \(R^6 \propto Q^2\), or \(Q \propto R^3\). At a bifurcation, conservation of flow gives \(Q_0 = Q_1 + Q_2\), which with the scaling \(Q \propto R^3\) yields Murray's law. \(\square\)
</div>

Measurements on the vascular systems of mammals, birds, and even plants confirm Murray's law to good approximation, providing compelling evidence that vascular networks are optimised for transport efficiency.

<div class="remark">
<strong>Remark 4.2.</strong> Murray's law is a beautiful example of optimality reasoning in biological fluid dynamics. Cecil D. Murray, a physiologist at Bryn Mawr College, derived it in 1926 by assuming that the vascular system minimises the total cost of operation — the sum of the power to pump blood against viscous resistance and the metabolic power to maintain the blood volume. The cube law \(Q \propto R^3\) is equivalent to the statement that the wall shear stress is uniform throughout the vascular tree, a prediction that has been confirmed by measurements in the mesenteric vasculature of cats (Mayrovitz and Roy, 1983). More recent work by West, Brown, and Enquist (1997) has used generalisations of Murray's law to derive allometric scaling laws for metabolic rate across species, connecting vascular fluid mechanics to the famous \(3/4\)-power law of metabolism.
</div>

### 4.5 Dean Vortices in Curved Vessels

Real arteries are not straight but curved — the aortic arch being the most dramatic example. Flow through a curved tube experiences centrifugal effects that drive secondary flows perpendicular to the main flow direction.

<div class="definition">
<strong>Definition 4.4 (Dean Number).</strong> The <em>Dean number</em> for flow in a curved tube of radius \(R\) with centreline curvature radius \(R_c\) is

\[
\mathrm{De} = \mathrm{Re}\sqrt{\frac{R}{R_c}},
\]
where \(\mathrm{Re}\) is based on the mean flow velocity and tube radius.
</div>

<div class="example">
<strong>Example 4.2 (Dean Vortices in the Aortic Arch).</strong> For flow in a curved tube at moderate Dean number, a pair of counter-rotating vortices (Dean vortices) develops in the cross-sectional plane. Fluid in the centre of the tube, travelling fastest, is pushed outward by centrifugal force, while slower fluid near the walls returns inward, creating a secondary flow of magnitude \(u_s \sim U(R/R_c)\mathrm{Re}\). In the aortic arch (\(\mathrm{Re} \approx 1000\), \(R/R_c \approx 0.1\)), the Dean number is approximately 300, and significant Dean vortices skew the velocity profile toward the outer wall. This is clinically significant: the outer wall of the aortic arch experiences elevated wall shear stress and is a common site for atherosclerotic plaque formation.
</div>

---

## Chapter 5: Non-Newtonian Blood Rheology

Blood is not water. It is a dense suspension of deformable particles — predominantly red blood cells (erythrocytes), which constitute about 45% of the blood volume — in a Newtonian plasma. The collective behaviour of these cells gives blood complex rheological properties: it is shear-thinning, mildly viscoelastic, and exhibits a yield stress at very low shear rates. This chapter develops the constitutive models needed to describe these properties and explores their consequences for flow in the vasculature.

### 5.1 Blood as a Suspension

A healthy adult has a haematocrit (volume fraction of red blood cells) of approximately \(H \approx 0.45\). Each red blood cell is a biconcave disc approximately \(8\;\mu\text{m}\) in diameter and \(2\;\mu\text{m}\) thick, with a highly deformable membrane enclosing a Newtonian haemoglobin solution. At the haematocrits encountered in vivo, cell-cell interactions dominate the rheology.

<div class="definition">
<strong>Definition 5.1 (Apparent Viscosity).</strong> The <em>apparent viscosity</em> of blood is defined as the viscosity of a Newtonian fluid that would produce the same flow rate under the same pressure gradient in a given tube:

\[
\mu_{\text{app}} = \frac{\pi R^4 G}{8Q}.
\]
The apparent viscosity of blood depends on the shear rate \(\dot{\gamma}\), the haematocrit \(H\), and the tube diameter \(D\).
</div>

At high shear rates (\(\dot{\gamma} > 200\;\text{s}^{-1}\)), red blood cells deform into elongated ellipsoids aligned with the flow, and blood behaves approximately as a Newtonian fluid with viscosity about 3-4 times that of plasma. At low shear rates, red blood cells aggregate into stacked-coin structures called rouleaux, connected by bridging fibrinogen molecules, which dramatically increase the viscosity.

The rheology of blood was first studied quantitatively by Poiseuille himself in the 1840s, though he worked with water rather than blood for most of his precision measurements. Fahræus and Lindqvist (1931) made the seminal discovery that the apparent viscosity of blood in narrow tubes is lower than in wide ones, and Chien (1970) provided the comprehensive characterisation of blood viscosity as a function of shear rate and haematocrit that remains the standard reference. Fung's monograph *Biomechanics: Circulation* (1997) offers a masterful synthesis of the field.

<div class="example">
<strong>Example 5.2 (Einstein Viscosity and the Dilute Limit).</strong> In the dilute limit (\(H \ll 1\)), the effective viscosity of a suspension of rigid spheres in a Newtonian solvent is given by Einstein's (1906) celebrated formula:

\[
\mu_{\text{eff}} = \mu_p\left(1 + \frac{5}{2}H\right),
\]
where \(\mu_p\) is the plasma viscosity. For deformable particles like red blood cells, the coefficient \(5/2\) is reduced because the internal circulation within the cell reduces the stress perturbation. Taylor (1932) showed that for a viscous drop with viscosity ratio \(\lambda_v = \mu_{\text{in}}/\mu_{\text{out}}\), the coefficient becomes \(\frac{5}{2}\frac{\lambda_v + 2/5}{\lambda_v + 1}\), which reduces to \(5/2\) for rigid particles (\(\lambda_v \to \infty\)) and to \(1\) for bubbles (\(\lambda_v = 0\)). For red blood cells (\(\lambda_v \approx 5\)), the dilute-limit coefficient is approximately \(2.2\), but at physiological haematocrit the dilute theory is completely inadequate and empirical correlations (such as those of Quemada or Krieger-Dougherty) must be used.
</div>

<div class="remark">
<strong>Remark 5.2.</strong> The Krieger-Dougherty relation provides a useful empirical formula for the viscosity at arbitrary haematocrit:

\[
\mu_{\text{eff}} = \mu_p\left(1 - \frac{H}{H_m}\right)^{-[\eta]H_m},
\]
where \(H_m \approx 0.67\) is the maximum packing fraction for red blood cells and \([\eta] \approx 2.5\) is the intrinsic viscosity. At physiological haematocrit \(H = 0.45\), this gives \(\mu_{\text{eff}} \approx 3.7\mu_p\), in good agreement with experimental measurements at high shear rates.
</div>

### 5.2 The Casson Model

The simplest constitutive model that captures both the yield stress (due to rouleaux) and the shear-thinning behaviour of blood is the Casson model.

<div class="definition">
<strong>Definition 5.2 (Casson Fluid).</strong> A <em>Casson fluid</em> obeys the constitutive relation

\[
\sqrt{|\tau|} = \sqrt{\tau_0} + \sqrt{\mu_\infty\,|\dot{\gamma}|} \quad \text{for } |\tau| \geq \tau_0,
\]

\[
\dot{\gamma} = 0 \quad \text{for } |\tau| < \tau_0,
\]
where \(\tau\) is the shear stress, \(\dot{\gamma}\) is the shear rate, \(\tau_0\) is the <em>yield stress</em>, and \(\mu_\infty\) is the high-shear-rate viscosity. For human blood, \(\tau_0 \approx 0.005\;\text{Pa}\) and \(\mu_\infty \approx 3.5\;\text{mPa}\cdot\text{s}\).
</div>

<div class="example">
<strong>Example 5.1 (Casson Flow in a Tube).</strong> For steady flow of a Casson fluid in a tube of radius \(R\) under pressure gradient \(G\), a rigid plug forms in the centre of the tube where the shear stress is below the yield stress. The plug radius is \(r_0 = 2\tau_0/(GR) \cdot R\). The velocity profile has a flat plug for \(r \leq r_0\) and a curved region for \(r_0 \leq r \leq R\). The flow rate is

\[
Q = \frac{\pi G R^4}{8\mu_\infty}\left[1 - \frac{16}{7}\sqrt{\frac{\tau_0}{\tau_w}} + \frac{4}{3}\frac{\tau_0}{\tau_w} - \frac{1}{21}\left(\frac{\tau_0}{\tau_w}\right)^4\right],
\]
where \(\tau_w = GR/2\) is the wall shear stress. This reduces to Poiseuille's law when \(\tau_0 = 0\).
</div>

### 5.3 The Carreau and Oldroyd-B Models

For computational hemodynamics, more sophisticated constitutive models are needed.

<div class="definition">
<strong>Definition 5.3 (Carreau Model).</strong> The <em>Carreau model</em> for a generalised Newtonian fluid has viscosity

\[
\mu(\dot{\gamma}) = \mu_\infty + (\mu_0 - \mu_\infty)\left[1 + (\lambda\dot{\gamma})^2\right]^{(n-1)/2},
\]
where \(\mu_0\) is the zero-shear viscosity, \(\mu_\infty\) is the infinite-shear viscosity, \(\lambda\) is a relaxation time, and \(n < 1\) is the power-law index. For blood, typical values are \(\mu_0 \approx 56\;\text{mPa}\cdot\text{s}\), \(\mu_\infty \approx 3.5\;\text{mPa}\cdot\text{s}\), \(\lambda \approx 3.3\;\text{s}\), and \(n \approx 0.36\).
</div>

The Carreau model is purely viscous and does not capture the viscoelastic behaviour of blood (finite stress relaxation time, normal stress differences). For situations where elasticity matters — such as flow through sudden constrictions or past heart valves — one needs a viscoelastic constitutive equation.

<div class="example">
<strong>Example 5.3 (Fitting Blood Viscosity Data).</strong> To illustrate the Carreau model, consider steady shear viscometry of whole blood at haematocrit \(H = 0.45\) and temperature \(37°\text{C}\). At \(\dot{\gamma} = 0.01\;\text{s}^{-1}\), the viscosity is approximately \(50\;\text{mPa}\cdot\text{s}\); at \(\dot{\gamma} = 1\;\text{s}^{-1}\), it is approximately \(10\;\text{mPa}\cdot\text{s}\); and at \(\dot{\gamma} = 1000\;\text{s}^{-1}\), it is approximately \(3.5\;\text{mPa}\cdot\text{s}\). The Carreau model with parameters \(\mu_0 = 56\;\text{mPa}\cdot\text{s}\), \(\mu_\infty = 3.5\;\text{mPa}\cdot\text{s}\), \(\lambda = 3.3\;\text{s}\), and \(n = 0.36\) fits these data to within 5% across four decades of shear rate. In computational hemodynamics, the Carreau model is the most widely used generalised Newtonian model for patient-specific simulations of arterial flows.
</div>

<div class="definition">
<strong>Definition 5.4 (Oldroyd-B Model).</strong> The <em>Oldroyd-B model</em> relates the extra stress tensor \(\boldsymbol{\tau}\) to the rate-of-strain tensor \(\mathbf{D} = \frac{1}{2}(\nabla\mathbf{u} + \nabla\mathbf{u}^T)\) by

\[
\boldsymbol{\tau} + \lambda_1\overset{\nabla}{\boldsymbol{\tau}} = 2\mu_0\left(\mathbf{D} + \lambda_2\overset{\nabla}{\mathbf{D}}\right),
\]
where \(\overset{\nabla}{\boldsymbol{\tau}} = \frac{\partial\boldsymbol{\tau}}{\partial t} + \mathbf{u}\cdot\nabla\boldsymbol{\tau} - (\nabla\mathbf{u})\boldsymbol{\tau} - \boldsymbol{\tau}(\nabla\mathbf{u})^T\) is the upper-convected derivative, \(\lambda_1\) is the relaxation time, and \(\lambda_2\) is the retardation time. The Oldroyd-B fluid is the continuum limit of a dilute suspension of Hookean dumbbells.
</div>

### 5.4 The Fahræus-Lindqvist Effect

One of the most striking phenomena in microvascular hemodynamics is the Fahræus-Lindqvist effect: the apparent viscosity of blood decreases as the tube diameter decreases below about 300 \(\mu\text{m}\), reaching a minimum near 7 \(\mu\text{m}\) (approximately the diameter of a single red blood cell).

<div class="theorem">
<strong>Theorem 5.1 (Fahræus-Lindqvist Effect).</strong> In a tube of diameter \(D \lesssim 300\;\mu\text{m}\), the apparent viscosity of blood \(\mu_{\text{app}}\) is lower than the bulk viscosity. This is due to the formation of a <em>cell-free layer</em> (or <em>plasma layer</em>) near the tube wall: red blood cells migrate away from the wall under shear-induced lateral forces, creating a lubricating layer of low-viscosity plasma of thickness \(\delta \approx 2\text{-}4\;\mu\text{m}\). A simple two-layer model (core of viscosity \(\mu_c\), marginal layer of viscosity \(\mu_p\)) gives

\[
\frac{1}{\mu_{\text{app}}} = \frac{1}{\mu_c} + \frac{1}{\mu_p}\left[\left(\frac{R}{R-\delta}\right)^4 - 1\right].
\]
</div>

The complementary Fahræus effect states that the tube haematocrit (measured from a sample within the tube) is lower than the discharge haematocrit (measured from blood collected from the tube outflow), because red blood cells travel faster than the average plasma velocity. Both effects are crucial for understanding microvascular perfusion: they reduce the resistance of the microcirculation and enhance oxygen delivery to tissues.

<div class="example">
<strong>Example 5.4 (Numerical Estimate of the Fahræus-Lindqvist Effect).</strong> Consider blood flowing through a vessel of diameter \(D = 50\;\mu\text{m}\) with a cell-free layer of thickness \(\delta = 3\;\mu\text{m}\). The core region has radius \(R_c = R - \delta = 22\;\mu\text{m}\) and viscosity \(\mu_c \approx 3.5\;\text{mPa}\cdot\text{s}\) (approximately the bulk blood viscosity at high shear). The plasma layer has viscosity \(\mu_p \approx 1.2\;\text{mPa}\cdot\text{s}\). From the two-layer model:

\[
\frac{1}{\mu_{\text{app}}} = \frac{1}{3.5} + \frac{1}{1.2}\left[\left(\frac{25}{22}\right)^4 - 1\right] = \frac{1}{3.5} + \frac{0.665}{1.2} \approx 0.840,
\]
giving \(\mu_{\text{app}} \approx 1.19\;\text{mPa}\cdot\text{s}\), which is remarkably close to the plasma viscosity and much lower than the bulk blood viscosity. This dramatic viscosity reduction in the microcirculation — sometimes called the "microviscosity paradox" by Fahræus and Lindqvist (1931) — is essential for maintaining adequate perfusion of the capillary beds.
</div>

### 5.5 Plasma Skimming

At microvascular bifurcations, blood does not divide equally between daughter vessels. The daughter vessel that receives a larger share of the flow also receives a disproportionately large share of the red blood cells — a phenomenon known as plasma skimming.

<div class="remark">
<strong>Remark 5.1.</strong> Plasma skimming arises because the cell-free layer at the wall of the parent vessel is preferentially drawn into the lower-flow daughter branch. As a consequence, the haematocrit in the two daughter vessels differs: the high-flow branch has higher haematocrit, while the low-flow branch has lower haematocrit and may receive almost pure plasma. This has important implications for tissue oxygenation, drug delivery, and the design of microfluidic devices for blood processing.
</div>

---

## Chapter 6: Pulmonary Mechanics and Respiratory Flows

The mammalian lung is an engineering marvel: a branching tree of airways that terminates in approximately 300 million alveoli, providing a total gas-exchange surface area of about 70 m\(^2\) — roughly the size of a tennis court — packed into a volume of about 6 litres. The fluid mechanics of the respiratory system involves air flow through a complex branching geometry, the stability of thin liquid films lining the airways, and the crucial role of pulmonary surfactant in preventing alveolar collapse.

### 6.1 Airway Branching: The Weibel Model

The geometry of the bronchial tree was systematically described by Weibel (1963), who modelled it as a sequence of dichotomous branchings (each parent airway dividing into two daughter airways) over approximately 23 generations.

<div class="definition">
<strong>Definition 6.1 (Weibel Model).</strong> In the <em>Weibel model</em>, the airways are indexed by generation number \(n = 0, 1, \ldots, 23\). Generation 0 is the trachea, and at each generation the number of airways doubles: \(N_n = 2^n\). The radius and length of airways decrease geometrically:

\[
R_n = R_0 \cdot h^n, \quad L_n = L_0 \cdot h^n,
\]
where \(h \approx 0.85\) for the upper airways. For the trachea, \(R_0 \approx 9\;\text{mm}\) and \(L_0 \approx 120\;\text{mm}\). Generations 0-16 are the conducting zone (trachea, bronchi, bronchioles); generations 17-23 are the respiratory zone (respiratory bronchioles, alveolar ducts, alveolar sacs).
</div>

A remarkable consequence of this geometry is the dramatic variation of flow character along the airway tree. In the trachea, \(\mathrm{Re} \approx 2000\text{-}4000\) during normal breathing and the flow is transitional or turbulent. By generation 5-6, \(\mathrm{Re} \sim 100\) and the flow is laminar. By generation 15, \(\mathrm{Re} \sim 1\) and the flow is dominated by viscosity. In the alveolar ducts, advection is negligible and gas transport occurs primarily by diffusion.

Weibel's morphometric study, carried out at the University of Zurich in the early 1960s using painstaking serial sectioning and reconstruction of human lungs, remains the definitive anatomical reference for respiratory fluid mechanics. His symmetric dichotomous branching model, while an idealisation (real airways are asymmetric and irregular), captures the essential scaling properties of the lung and provides the geometric input for all analytical and computational models of airway flow.

<div class="remark">
<strong>Remark 6.1.</strong> The total cross-sectional area of the airways increases explosively with generation number: \(A_n = N_n \pi R_n^2 = 2^n \pi R_0^2 h^{2n}\). Since \(2h^2 \approx 1.44 > 1\), the total area grows exponentially, reaching approximately 12,000 cm\(^2\) at generation 23 compared to about 2.5 cm\(^2\) for the trachea. This massive expansion ensures that air velocity decreases to nearly zero in the alveolar region, providing sufficient residence time for gas exchange.
</div>

### 6.2 Gas Exchange

The primary function of the lung is gas exchange: oxygen diffuses from the alveolar air into the pulmonary capillary blood, while carbon dioxide diffuses in the opposite direction.

<div class="definition">
<strong>Definition 6.2 (Fick's Law of Diffusion for Gas Exchange).</strong> The flux of gas across the alveolar membrane is

\[
\dot{V}_{\text{gas}} = \frac{D_L \cdot A}{h_m}(P_A - P_c),
\]
where \(D_L\) is the diffusion coefficient of the gas in the membrane-blood system, \(A\) is the total alveolar surface area, \(h_m\) is the membrane thickness, \(P_A\) is the alveolar partial pressure, and \(P_c\) is the capillary partial pressure. For oxygen in healthy lungs, \(D_L A / h_m \approx 21\;\text{mL}\,\text{min}^{-1}\,\text{mmHg}^{-1}\).
</div>

<div class="example">
<strong>Example 6.3 (Oxygen Uptake Calculation).</strong> During normal quiet breathing, the alveolar partial pressure of oxygen is \(P_A \approx 100\;\text{mmHg}\) and the mixed venous blood entering the pulmonary capillaries has \(P_c \approx 40\;\text{mmHg}\). The diffusing capacity gives an oxygen uptake rate of \(\dot{V}_{O_2} = 21 \times (100 - 40) \approx 1260\;\text{mL/min}\) as a theoretical maximum. In practice, the effective driving pressure decreases along the capillary as the blood becomes oxygenated, and the actual resting oxygen uptake is approximately \(250\;\text{mL/min}\). The transit time of blood through the pulmonary capillary is about \(0.75\;\text{s}\), and equilibration of oxygen partial pressure across the membrane is essentially complete within the first third of this transit — providing a substantial reserve capacity for exercise, when cardiac output and hence capillary flow speed increase.
</div>

<div class="remark">
<strong>Remark 6.2.</strong> The total alveolar surface area of \(70\;\text{m}^2\) combined with the membrane thickness of approximately \(0.5\;\mu\text{m}\) represents an extraordinary engineering achievement. The membrane consists of the alveolar epithelium, a thin interstitial space, and the capillary endothelium. Diseases that thicken this membrane (pulmonary fibrosis) or reduce the surface area (emphysema) directly impair gas exchange, as predicted by the Fick law formula above. The clinical measurement of diffusing capacity (\(D_L\)) using carbon monoxide (which binds avidly to haemoglobin, keeping \(P_c \approx 0\)) is one of the standard pulmonary function tests.
</div>

### 6.3 Surface Tension and Pulmonary Surfactant

The alveoli are lined with a thin film of liquid. At the air-liquid interface, surface tension \(\gamma\) creates a pressure difference across the curved interface described by the Laplace-Young equation.

<div class="theorem">
<strong>Theorem 6.1 (Laplace-Young Equation).</strong> The pressure difference across a curved interface with surface tension \(\gamma\) and principal radii of curvature \(R_1\) and \(R_2\) is

\[
\Delta p = \gamma\left(\frac{1}{R_1} + \frac{1}{R_2}\right).
\]
For a spherical alveolus of radius \(R\), this gives \(\Delta p = 2\gamma/R\).
</div>

If the alveolar lining fluid had the surface tension of water (\(\gamma \approx 70\;\text{mN/m}\)), the pressure required to keep an alveolus of radius \(R = 100\;\mu\text{m}\) open would be \(\Delta p \approx 1400\;\text{Pa} \approx 14\;\text{cmH}_2\text{O}\), which would exceed the elastic recoil pressure of the lung. Moreover, since smaller alveoli would have higher internal pressure, they would empty into larger alveoli (Laplace instability), and the lung would collapse.

<div class="definition">
<strong>Definition 6.3 (Pulmonary Surfactant).</strong> <em>Pulmonary surfactant</em> is a mixture of lipids (primarily dipalmitoylphosphatidylcholine, DPPC) and proteins secreted by type II alveolar epithelial cells. It adsorbs at the air-liquid interface and reduces surface tension to near zero upon compression. Critically, the surface tension varies with the degree of compression:

\[
\gamma = \gamma(\Gamma),
\]
where \(\Gamma\) is the surface concentration of surfactant. When the alveolus deflates and \(\Gamma\) increases, \(\gamma\) decreases dramatically (to \(\approx 1\;\text{mN/m}\)), stabilising the alveolus against collapse.
</div>

<div class="proposition">
<strong>Proposition 6.1.</strong> The area-dependent surface tension of surfactant stabilises alveoli against the Laplace instability. For a spherical alveolus of radius \(R\) and surface tension \(\gamma(R)\), the transmural pressure is \(P = 2\gamma(R)/R\). Stability requires \(dP/dR < 0\) (pressure decreases as the alveolus inflates), which holds when

\[
\frac{d\gamma}{dR} > \frac{\gamma}{R},
\]
i.e., when \(\gamma\) increases with \(R\) sufficiently rapidly. Pulmonary surfactant achieves exactly this: upon inflation, the surfactant monolayer expands, \(\Gamma\) decreases, and \(\gamma\) increases. This ensures that all alveoli inflate uniformly, maintaining efficient gas exchange.
</div>

### 6.4 Liquid Lining Flows and Airway Closure

The thin liquid lining of the airways is subject to surface-tension-driven instabilities that can cause airway closure — a clinically significant event that occurs in the small airways of patients with pulmonary oedema, acute respiratory distress syndrome, or prematurity (neonatal respiratory distress syndrome).

<div class="example">
<strong>Example 6.1 (Rayleigh-Plateau Instability in Airways).</strong> A thin annular film of thickness \(h\) lining the interior of a cylindrical airway of radius \(R\) is subject to the Rayleigh-Plateau instability: axisymmetric perturbations with wavelength \(\lambda > 2\pi R\) grow, driven by surface tension, and can eventually form a liquid bridge that occludes the airway. The growth rate of the instability for a thin film (\(h \ll R\)) is

\[
\sigma = \frac{\gamma h^3}{3\mu R^4}(k^2 R^2 - k^4 R^4),
\]
where \(k = 2\pi/\lambda\) is the wavenumber. The maximum growth rate occurs at \(kR = 1/\sqrt{2}\), giving a most dangerous wavelength \(\lambda^* = 2\sqrt{2}\pi R\). The closure time scales as \(\mu R^4 / (\gamma h^3)\), which for typical values in small airways (\(R \approx 0.5\;\text{mm}\), \(h \approx 10\;\mu\text{m}\), \(\gamma \approx 25\;\text{mN/m}\)) is of order 1 second — comparable to the breathing cycle.
</div>

### 6.5 Airway Reopening

Once an airway has closed, reopening it requires driving air (or surfactant-laden fluid) through the liquid plug or peeling open the collapsed elastic walls. This is a moving contact line and thin-film problem with important clinical implications.

<div class="theorem">
<strong>Theorem 6.2 (Reopening Pressure for an Occluded Airway).</strong> The pressure required to drive a semi-infinite air finger through a liquid-filled rigid tube of radius \(R\) at capillary number \(\mathrm{Ca} = \mu U/\gamma\) is, following Bretherton (1961),

\[
\Delta p = \frac{\gamma}{R}\left[\frac{2}{1-b/R} + 3.88\,\mathrm{Ca}^{2/3}\right],
\]
where \(b\) is the radius of the air finger and \(b/R \approx 1 - 1.34\,\mathrm{Ca}^{2/3}\) for \(\mathrm{Ca} \ll 1\). The leading term is the static capillary pressure, and the correction accounts for viscous resistance in the thin film deposited behind the advancing finger.
</div>

The reopening of collapsed airways is a key challenge in mechanical ventilation: applying too much pressure risks barotrauma (tissue damage), while too little pressure leaves airways closed. Surfactant replacement therapy for premature infants works precisely by reducing the surface tension and hence the reopening pressure.

<div class="remark">
<strong>Remark 6.3.</strong> Bretherton's (1961) analysis of a long bubble advancing through a tube is one of the gems of classical fluid mechanics, and its application to airway reopening illustrates how fundamental research can have unexpected medical consequences. Bretherton showed that the thin film deposited behind the advancing bubble has thickness \(h \approx 1.34\,R\,\mathrm{Ca}^{2/3}\), a result derived by matched asymptotic expansions connecting the static meniscus at the bubble tip to the thin flat film far behind. The \(\mathrm{Ca}^{2/3}\) scaling arises from the balance of viscous and capillary forces in the transition region and has become a touchstone result in thin-film fluid mechanics. In the context of airway reopening, Bretherton's analysis predicts that the reopening pressure decreases with decreasing capillary number (slower reopening), a counterintuitive result with practical implications for ventilator management: slow, gentle inflation is more effective than rapid inflation for reopening collapsed airways.
</div>

### 6.6 Mucociliary Clearance

The upper airways (generations 0-16) are lined with a mucus layer propelled by the beating of billions of cilia in a process known as mucociliary clearance — the lung's primary defence against inhaled particles and pathogens.

<div class="example">
<strong>Example 6.2 (Two-Layer Mucociliary Transport Model).</strong> The airway surface liquid consists of two layers: a low-viscosity periciliary layer (PCL, \(\sim 7\;\mu\text{m}\) thick) in which the cilia beat, topped by a high-viscosity mucus layer (\(\sim 10\text{-}30\;\mu\text{m}\) thick) that traps particles. During the effective (power) stroke, the cilia tips engage the mucus layer and push it toward the pharynx. During the recovery stroke, the cilia sweep back through the low-viscosity PCL. The resulting transport velocity of the mucus layer is approximately \(40\text{-}100\;\mu\text{m/s}\) in healthy lungs. In cystic fibrosis, defective ion transport leads to dehydration of the PCL, the cilia can no longer clear the mucus, and the patient is prone to chronic lung infections.
</div>

---

## Chapter 7: Biofilm Mechanics and Viscous Drops

Biological systems frequently involve thin films of viscous fluid, deformable interfaces, and the coupling between surface tension and transport. This chapter develops the thin-film (lubrication) theory that underpins the modelling of biofilm spreading, the dynamics of vesicles and capsules, and the deformation of red blood cells.

### 7.1 Lubrication Theory

When a fluid layer is thin compared to its lateral extent — as in biofilms, tear films, mucous coatings, and the liquid lining of the lungs — the full Stokes or Navier-Stokes equations simplify dramatically. The lubrication (or thin-film) approximation exploits the scale separation \(h \ll L\), where \(h\) is the film thickness and \(L\) is the characteristic lateral length.

<div class="theorem">
<strong>Theorem 7.1 (Reynolds Lubrication Equation).</strong> For a thin film of Newtonian fluid of viscosity \(\mu\) on a flat substrate, with no-slip at the substrate and a stress-free upper surface, the film thickness \(h(x,t)\) evolves according to

\[
\frac{\partial h}{\partial t} + \frac{\partial}{\partial x}\left(\frac{h^3}{3\mu}\frac{\partial p}{\partial x}\right) = 0,
\]
where the pressure \(p\) is determined by surface tension and gravity: \(p = -\gamma\frac{\partial^2 h}{\partial x^2} + \rho g h\) (linearised for small slopes). In two lateral dimensions, this generalises to

\[
\frac{\partial h}{\partial t} + \nabla\cdot\left(\frac{h^3}{3\mu}\nabla p\right) = 0.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Under the lubrication scaling, vertical velocities are much smaller than horizontal velocities, and the horizontal momentum equation reduces to \(\mu\,\partial^2 u / \partial z^2 = \partial p / \partial x\), with \(p\) independent of \(z\). Integrating twice with the boundary conditions \(u(z=0) = 0\) (no-slip) and \(\partial u/\partial z(z=h) = 0\) (stress-free surface) gives the parabolic profile \(u = \frac{1}{2\mu}\frac{\partial p}{\partial x}(z^2 - 2hz)\). The volume flux is \(q = \int_0^h u\,dz = -\frac{h^3}{3\mu}\frac{\partial p}{\partial x}\). Local mass conservation \(\partial h/\partial t + \partial q/\partial x = 0\) gives the result. \(\square\)
</div>

The thin-film equation is a fourth-order nonlinear PDE (when surface tension dominates) or a second-order nonlinear PDE (when gravity dominates). Its degenerate diffusivity (\(\propto h^3\)) leads to finite-speed propagation: a spreading drop has a well-defined contact line, in contrast to the infinite propagation speed of the standard diffusion equation.

<div class="remark">
<strong>Remark 7.3.</strong> The Reynolds lubrication equation is named after Osborne Reynolds, who derived it in 1886 in the context of journal bearings — a quintessentially engineering problem. Its application to biological systems came much later, through the work of Grotberg and colleagues on pulmonary fluid mechanics in the 1990s and of Howell and collaborators on biofilm spreading in the 2000s. The mathematical structure of the thin-film equation — a fourth-order degenerate parabolic PDE — has attracted considerable attention from analysts. The existence and uniqueness of weak solutions, the regularity of the contact line, and the waiting-time phenomenon (where the contact line remains stationary before beginning to advance) are all active areas of mathematical research that have direct bearing on biological applications.
</div>

### 7.2 Biofilm Spreading

Bacterial biofilms — communities of bacteria embedded in a self-produced extracellular matrix (EPS) — grow on surfaces in aqueous environments and are of enormous importance in medicine (implant infections, dental plaque), industry (biofouling, water treatment), and ecology. The spreading of a biofilm over a surface can be modelled as a thin viscous film driven by growth and surface tension.

<div class="example">
<strong>Example 7.1 (Biofilm Spreading Model).</strong> Following Winstanley et al. (2011), consider a biofilm of thickness \(h(x,t)\) on a flat surface. The biofilm is modelled as a viscous fluid with an effective viscosity \(\mu_b\) (much larger than water) and a volumetric growth rate \(g(h)\). The thin-film equation with growth is

\[
\frac{\partial h}{\partial t} + \frac{\partial}{\partial x}\left(\frac{h^3}{3\mu_b}\frac{\partial p}{\partial x}\right) = g(h),
\]
where the growth rate may depend on nutrient availability, which in turn depends on diffusion through the biofilm:

\[
g(h) = g_0\frac{c(x,t)}{K + c(x,t)}, \quad D_c\frac{\partial^2 c}{\partial z^2} = g_0\frac{c}{K+c},
\]
with Monod kinetics. This coupled system of thin-film mechanics and reaction-diffusion captures the basic features of biofilm expansion: an advancing front whose speed is set by the balance between growth and viscous spreading.
</div>

### 7.3 Contact Line Dynamics

The motion of the contact line — where the biofilm (or any thin film) meets the dry substrate — is a classical problem in fluid mechanics with a well-known paradox: the no-slip boundary condition at a moving contact line leads to a non-integrable stress singularity (Huh and Scriven, 1971).

<div class="remark">
<strong>Remark 7.1.</strong> Several regularisations of the contact line singularity have been proposed: (i) a slip model, where the no-slip condition is replaced by a Navier slip condition \(u = \ell_s\,\partial u/\partial z\) with slip length \(\ell_s \sim 1\text{-}10\;\text{nm}\); (ii) a precursor film model, where a thin precursor film of molecular thickness coats the "dry" substrate ahead of the contact line; (iii) diffuse interface models, where the sharp interface is replaced by a phase-field. In the context of biofilms, the precursor film model is physically motivated: a thin layer of EPS or conditioning film often precedes the main biofilm front.
</div>

<div class="example">
<strong>Example 7.4 (Tanner's Law for a Spreading Drop).</strong> A classic application of thin-film theory with a moving contact line is the spreading of a small viscous drop on a flat surface under the influence of surface tension. For a drop of volume \(V\) spreading with a dynamic contact angle \(\theta(t)\), the balance between capillary driving force and viscous resistance in the thin-film approximation yields Tanner's law:

\[
\theta(t) \propto \left(\frac{\gamma V}{\mu}\right)^{-1/10} t^{-3/10}, \quad r_f(t) \propto \left(\frac{\gamma V^3}{\mu}\right)^{1/10} t^{1/10},
\]
where \(r_f(t)\) is the contact line radius. The \(t^{1/10}\) power law for the spreading radius was first predicted by Voinov (1976) and Tanner (1979) and has been confirmed experimentally for a wide range of fluids. The exponent \(1/10\) reflects the severe viscous resistance at the contact line, which makes spreading an extraordinarily slow process: doubling the radius requires the elapsed time to increase by a factor of \(2^{10} = 1024\). In biological contexts, Tanner's law governs the early stages of biofilm spreading, tear film dynamics on the cornea, and the spreading of surfactant replacement therapy over the lung lining.
</div>

### 7.4 Marangoni Flows

When surface tension varies along an interface — due to gradients in temperature, surfactant concentration, or chemical composition — the resulting tangential stress drives flow along the interface. These are Marangoni flows, and they play important roles in surfactant spreading in the lung, biofilm dynamics, and wound healing.

<div class="definition">
<strong>Definition 7.1 (Marangoni Stress).</strong> The tangential stress on a free surface due to surface tension gradients is

\[
\tau_M = \nabla_s \gamma,
\]
where \(\nabla_s\) is the surface gradient operator. For a surfactant-laden interface with surface tension \(\gamma(\Gamma)\) depending on surfactant concentration \(\Gamma\), the Marangoni stress is \(\tau_M = \frac{d\gamma}{d\Gamma}\nabla_s\Gamma\). Since \(d\gamma/d\Gamma < 0\) (surfactant reduces surface tension), flow is driven from regions of high surfactant concentration (low \(\gamma\)) to regions of low surfactant concentration (high \(\gamma\)).
</div>

<div class="example">
<strong>Example 7.2 (Surfactant Spreading on a Thin Film).</strong> When a drop of surfactant is deposited on a thin liquid film, Marangoni stresses drive rapid radial spreading. The coupled evolution equations for the film thickness \(h\) and surfactant concentration \(\Gamma\) are

\[
\frac{\partial h}{\partial t} + \frac{1}{r}\frac{\partial}{\partial r}\left(r\left[\frac{h^3}{3\mu}\frac{\partial p}{\partial r} + \frac{h^2}{2\mu}\frac{\partial\gamma}{\partial r}\right]\right) = 0,
\]

\[
\frac{\partial\Gamma}{\partial t} + \frac{1}{r}\frac{\partial}{\partial r}\left(r\Gamma\left[\frac{h^2}{2\mu}\frac{\partial p}{\partial r} + \frac{h}{\mu}\frac{\partial\gamma}{\partial r}\right]\right) = D_s\frac{1}{r}\frac{\partial}{\partial r}\left(r\frac{\partial\Gamma}{\partial r}\right),
\]
where \(D_s\) is the surface diffusivity. The Marangoni spreading front advances as \(r_f \propto t^{1/4}\) in the surface-tension-dominated regime, a result first predicted by Jensen and Grotberg (1992) and confirmed experimentally. This model is directly relevant to the delivery of surfactant to the lungs of premature infants.
</div>

### 7.5 Elastic Capsules and Vesicles

Red blood cells, vesicles, and many microorganisms are enclosed by thin elastic membranes. The deformation of these capsules under flow involves a coupling between the external Stokes flow, the internal Stokes flow, and the membrane mechanics.

<div class="definition">
<strong>Definition 7.2 (Helfrich Free Energy).</strong> The bending energy of a lipid bilayer membrane is described by the <em>Helfrich free energy</em> (Helfrich, 1973):

\[
\mathcal{F} = \frac{\kappa_b}{2}\oint (2H - c_0)^2\,dA + \kappa_G\oint K\,dA,
\]
where \(H = \frac{1}{2}(1/R_1 + 1/R_2)\) is the mean curvature, \(K = 1/(R_1 R_2)\) is the Gaussian curvature, \(c_0\) is the spontaneous curvature, \(\kappa_b \approx 10\text{-}20\;k_BT\) is the bending modulus, and \(\kappa_G\) is the Gaussian curvature modulus. By the Gauss-Bonnet theorem, the second integral is a topological invariant for a fixed topology and does not affect the shape for closed vesicles.
</div>

The equilibrium shapes of vesicles — prolate, oblate, stomatocyte, discocyte — are obtained by minimising the Helfrich free energy subject to constraints of fixed area and enclosed volume. The famous biconcave disc shape of the healthy red blood cell emerges naturally from this minimisation when the reduced volume \(v = V/(4\pi/3)(A/4\pi)^{3/2}\) is approximately 0.64 (the human RBC value).

<div class="theorem">
<strong>Theorem 7.2 (Shape Equation for Axisymmetric Vesicles).</strong> The equilibrium shapes of an axisymmetric vesicle with fixed area \(A\) and volume \(V\) satisfy the Euler-Lagrange equation

\[
\kappa_b\left[\Delta_s(2H) + 2H(2H^2 - 2K - c_0 H)\right] + 2\sigma H - \Delta p = 0,
\]
where \(\Delta_s\) is the surface Laplacian (Laplace-Beltrami operator), \(\sigma\) is a Lagrange multiplier enforcing the area constraint (analogous to surface tension), and \(\Delta p\) is a Lagrange multiplier enforcing the volume constraint (analogous to a pressure difference).
</div>

This shape equation, first derived by Ou-Yang and Helfrich (1989), is a fourth-order nonlinear PDE on the membrane surface. Its solutions — the catalogue of vesicle shapes as a function of reduced volume and spontaneous curvature — form a rich phase diagram that has been extensively compared with experiments.

<div class="remark">
<strong>Remark 7.2.</strong> The Helfrich model has been enormously influential beyond its original context of lipid vesicles. It has been applied to red blood cell shapes (Deuling and Helfrich, 1976), to the morphology of cell organelles such as the Golgi apparatus and endoplasmic reticulum, and to the shapes of biological membranes more generally. The key insight is that the bending energy alone, combined with geometric constraints, is sufficient to explain a remarkably diverse catalogue of shapes. The spontaneous curvature \(c_0\) captures the effect of asymmetry between the two leaflets of the bilayer (different lipid compositions, protein insertions, or adsorbed molecules on one side). For red blood cells, \(c_0\) is believed to arise from the underlying spectrin cytoskeleton, which is attached to the inner leaflet of the bilayer.
</div>

<div class="example">
<strong>Example 7.5 (Capillary Number for Vesicle Deformation).</strong> The deformation of a vesicle in an external flow is governed by the capillary number, which here compares viscous stresses to bending stresses:

\[
\mathrm{Ca}_b = \frac{\mu_{\text{out}}\dot{\gamma}a^3}{\kappa_b},
\]
where \(\dot{\gamma}\) is the shear rate, \(a\) is the vesicle radius, and \(\kappa_b\) is the bending modulus. For a giant unilamellar vesicle (\(a \approx 10\;\mu\text{m}\), \(\kappa_b \approx 20\;k_BT \approx 8 \times 10^{-20}\;\text{J}\)) in water (\(\mu \approx 10^{-3}\;\text{Pa}\cdot\text{s}\)) at a shear rate of \(\dot{\gamma} = 1\;\text{s}^{-1}\):

\[
\mathrm{Ca}_b = \frac{10^{-3} \times 1 \times (10^{-5})^3}{8 \times 10^{-20}} \approx 12.5.
\]
Since \(\mathrm{Ca}_b \gg 1\), the vesicle deforms significantly under these conditions, adopting elongated, tank-treading shapes similar to red blood cells. When \(\mathrm{Ca}_b \ll 1\), bending rigidity dominates and the vesicle remains nearly spherical.
</div>

### 7.6 Red Blood Cells in Shear Flow

The dynamics of red blood cells (RBCs) in shear flow is central to understanding blood rheology at the single-cell level. Under simple shear, an RBC exhibits three distinct dynamical regimes depending on the shear rate and the viscosity contrast between the interior haemoglobin solution and the exterior plasma.

<div class="example">
<strong>Example 7.3 (Tank-Treading and Tumbling).</strong> At low shear rates, a red blood cell in shear flow tumbles rigidly like a Jeffery orbit of an oblate spheroid. At higher shear rates, the cell undergoes <em>tank-treading</em>: the cell maintains a fixed orientation while the membrane rotates around the interior fluid, like the tread of a tank around the wheels. The transition between tumbling and tank-treading occurs at a critical shear rate that depends on the viscosity ratio \(\lambda_v = \mu_{\text{in}}/\mu_{\text{out}}\):

\[
\dot{\gamma}_c \propto \frac{\kappa_b}{\mu_{\text{out}}a^3}\frac{1}{(\lambda_v - 1)},
\]
where \(a\) is the cell radius. For normal RBCs (\(\lambda_v \approx 5\)), the transition shear rate is about \(1\;\text{s}^{-1}\). An intermediate regime of swinging (oscillating inclination with tank-treading) also exists and has been observed experimentally.
</div>

---

## Chapter 8: Collective Locomotion and Active Matter

Individual microswimmers do not exist in isolation. In many biologically and physically important situations — bacterial suspensions, sperm competition, algal blooms, artificial microswimmers — large numbers of swimmers interact hydrodynamically, producing collective phenomena that are qualitatively different from the behaviour of individual cells. This chapter develops the continuum theory of active suspensions and explores the remarkable connection between microscopic swimming mechanisms and macroscopic, turbulence-like collective flows.

### 8.1 Hydrodynamic Interactions Between Swimmers

We established in Chapter 1 that the far-field flow of a force-free swimmer is dominated by the stresslet (force dipole). The character of this dipole — whether it is a pusher or a puller — determines the nature of hydrodynamic interactions between swimmers.

<div class="definition">
<strong>Definition 8.1 (Pusher and Puller Dipoles).</strong> A <em>pusher</em> (e.g., *E. coli*, *Bacillus subtilis*) generates thrust from behind the cell body; its stresslet pushes fluid outward along the swimming axis and draws fluid inward from the sides. A <em>puller</em> (e.g., *Chlamydomonas*) generates thrust from in front; its stresslet has the opposite sign. In terms of the stresslet tensor, a swimmer at the origin moving in the \(\hat{\mathbf{e}}\) direction produces a far-field velocity

\[
u_i(\mathbf{r}) \approx \frac{\kappa}{8\pi\mu}\frac{r_i(3(\hat{\mathbf{e}}\cdot\hat{\mathbf{r}})^2 - 1)}{r^2},
\]
where \(\kappa > 0\) for pushers and \(\kappa < 0\) for pullers, and \(\hat{\mathbf{r}} = \mathbf{r}/r\).
</div>

The sign of \(\kappa\) has profound consequences for the collective dynamics. Two pushers swimming side by side are attracted toward each other (the inward flow from the sides draws them together), while two pushers swimming one behind the other are repelled. For pullers, the situation is reversed. These pairwise interactions determine the stability of aligned states and the onset of collective motion.

<div class="example">
<strong>Example 8.3 (Stresslet Strength Estimation).</strong> The stresslet strength \(\kappa\) can be estimated from the propulsive force and body geometry. For a swimmer that generates a thrust force \(F\) at a distance \(\ell\) behind its centre (the flagellum) and an equal and opposite drag force at its centre (the cell body), the stresslet strength is \(\kappa = F\ell\). For *E. coli*, the thrust force is approximately \(F \approx 0.4\;\text{pN}\) and the separation between the effective force centres is \(\ell \approx 2\;\mu\text{m}\), giving

\[
\kappa \approx 0.4 \times 10^{-12} \times 2 \times 10^{-6} \approx 0.8 \times 10^{-18}\;\text{N}\cdot\text{m}.
\]
The far-field velocity at a distance \(r = 10\;\mu\text{m}\) (about two body lengths) from this swimmer is \(u \approx \kappa/(8\pi\mu r^2) \approx 0.3\;\mu\text{m/s}\), which is about 1% of the swimming speed. Thus hydrodynamic interactions between well-separated swimmers are weak, but in dense suspensions where the mean inter-swimmer spacing is comparable to the body length, they become the dominant mechanism for collective behaviour.
</div>

### 8.2 Suspension Rheology of Active Matter

A suspension of microswimmers has rheological properties that differ fundamentally from a passive suspension of the same particles, because the swimmers inject energy into the fluid through their stresslets.

<div class="theorem">
<strong>Theorem 8.1 (Effective Viscosity of a Dilute Active Suspension).</strong> For a dilute suspension of swimmers at number density \(n\), with stresslet strength \(\kappa\) and swimming direction \(\hat{\mathbf{e}}\), the effective stress tensor has an additional contribution from the swimmers:

\[
\Sigma_{ij}^{\text{swim}} = n\kappa\left\langle e_i e_j - \frac{1}{3}\delta_{ij}\right\rangle,
\]
where \(\langle\cdot\rangle\) denotes an average over the orientational distribution function \(\Psi(\hat{\mathbf{e}})\). In simple shear, if the swimmers are preferentially aligned by the flow, this gives a correction to the effective viscosity:

\[
\mu_{\text{eff}} = \mu\left(1 + \frac{5}{2}\phi + \frac{A\,n\kappa}{\dot{\gamma}}\right),
\]
where \(\phi\) is the volume fraction, the \(\frac{5}{2}\phi\) is Einstein's result for passive spheres, and \(A\) is a numerical coefficient that depends on the balance of shear alignment and rotational diffusion. For pushers (\(\kappa > 0\)), the swimming contribution <em>reduces</em> the effective viscosity, and the suspension can have an apparent viscosity lower than the solvent. For pullers (\(\kappa < 0\)), the effective viscosity is enhanced.
</div>

The prediction that pusher suspensions have reduced viscosity — and can even have zero or negative effective viscosity — was made by Hatwalne et al. (2004) and confirmed experimentally by Sokolov and Aranson (2009) and Lopez et al. (2015), who measured a sevenfold reduction in the viscosity of a *B. subtilis* suspension compared to the viscosity of the suspending fluid alone. This is a dramatic departure from passive suspension rheology and is a hallmark of active matter.

### 8.3 The Saintillan-Shelley Kinetic Model

The continuum theory of active suspensions was placed on a rigorous kinetic foundation by Saintillan and Shelley (2008), who derived a Smoluchowski equation for the probability distribution of swimmer positions and orientations, coupled to the Stokes equations for the fluid.

<div class="definition">
<strong>Definition 8.2 (Saintillan-Shelley Model).</strong> The configuration of the suspension is described by the probability distribution function \(\Psi(\mathbf{x}, \hat{\mathbf{e}}, t)\) of finding a swimmer at position \(\mathbf{x}\) with orientation \(\hat{\mathbf{e}}\) at time \(t\). The kinetic equation is

\[
\frac{\partial\Psi}{\partial t} + \nabla\cdot(\dot{\mathbf{x}}\,\Psi) + \nabla_e\cdot(\dot{\hat{\mathbf{e}}}\,\Psi) = D_T\nabla^2\Psi + D_R\nabla_e^2\Psi,
\]
where \(\dot{\mathbf{x}} = U_0\hat{\mathbf{e}} + \mathbf{u}(\mathbf{x})\) is the swimmer velocity (self-propulsion plus advection by the fluid), \(\dot{\hat{\mathbf{e}}} = (\mathbf{I} - \hat{\mathbf{e}}\hat{\mathbf{e}})\cdot(\nabla\mathbf{u})\cdot\hat{\mathbf{e}}\) is Jeffery's equation for the orientation evolution in the local velocity gradient, \(D_T\) is a translational diffusivity, and \(D_R\) is a rotational diffusivity (modelling run-and-tumble reorientation). The fluid velocity \(\mathbf{u}\) is obtained from the Stokes equations forced by the swimmer-generated stresslets:

\[
-\nabla p + \mu\nabla^2\mathbf{u} = -\nabla\cdot\boldsymbol{\Sigma}^{\text{swim}}, \quad \nabla\cdot\mathbf{u} = 0,
\]
where \(\boldsymbol{\Sigma}^{\text{swim}}\) is the active stress from Theorem 8.1.
</div>

### 8.4 Instability of Isotropic Suspensions

The uniform, isotropic state — swimmers uniformly distributed and randomly oriented — is the simplest solution of the Saintillan-Shelley model. A central question is whether this state is stable.

<div class="theorem">
<strong>Theorem 8.2 (Instability of Isotropic Pusher Suspensions).</strong> The uniform isotropic state of a suspension of pushers (\(\kappa > 0\)) is linearly unstable to long-wavelength perturbations when the swimmer concentration exceeds a critical value:

\[
n > n_c = \frac{15D_R}{U_0\ell}\frac{(1 + k^2/k_c^2)}{1},
\]
where \(\ell = \kappa/(8\pi\mu U_0)\) is an effective hydrodynamic length and \(k_c\) depends on system parameters. In the long-wavelength limit (\(k \to 0\)), the instability threshold is \(n_c \propto D_R/(U_0\ell)\). Puller suspensions (\(\kappa < 0\)) are linearly stable.
</div>

<div class="proof">
<strong>Proof.</strong> Consider a small perturbation to the isotropic state: \(\Psi = \frac{n}{4\pi}(1 + \psi(\mathbf{x}, \hat{\mathbf{e}}, t))\), where \(\psi \ll 1\). Linearising the kinetic equation and expanding \(\psi\) in spherical harmonics, the coupling to the fluid occurs through the \(\ell = 2\) (nematic) mode. A perturbation in which swimmers are locally aligned generates an active stress, which drives a fluid flow, which further aligns the swimmers — a positive feedback loop for pushers. The growth rate of a perturbation with wavevector \(\mathbf{k}\) is

\[
\sigma(k) = \frac{n\kappa k^2}{15\mu(k^2 + k_D^2)} - D_R - D_T k^2,
\]
where \(k_D\) is a cutoff related to the finite size of the swimmers. For pushers (\(\kappa > 0\)), \(\sigma > 0\) at sufficiently small \(k\) when \(n\) exceeds the threshold, establishing the instability. For pullers (\(\kappa < 0\)), \(\sigma < 0\) for all \(k\), so the isotropic state is stable. \(\square\)
</div>

This instability is the continuum-mechanical explanation for the onset of collective motion in bacterial suspensions. Above the critical concentration, the isotropic state gives way to large-scale coherent flows — a phenomenon known as bacterial turbulence.

### 8.5 Bacterial Turbulence

Dense suspensions of swimming bacteria (such as *B. subtilis* at concentrations above \(\sim 10^{10}\;\text{cells/mL}\)) exhibit spontaneous large-scale flow patterns that are visually reminiscent of turbulence in high-Reynolds-number fluids, but occur at \(\mathrm{Re} \sim 10^{-5}\).

<div class="example">
<strong>Example 8.1 (Bacterial Turbulence).</strong> Experiments by Dombrowski et al. (2004) and Dunkel et al. (2013) on dense *B. subtilis* suspensions revealed a chaotic flow field with the following characteristics:
<ul>
<li>Coherent vortices and jets with a typical length scale of \(50\text{-}100\;\mu\text{m}\) (much larger than the cell size of \(\sim 5\;\mu\text{m}\))</li>
<li>Flow velocities of \(50\text{-}100\;\mu\text{m/s}\), comparable to individual swimming speeds</li>
<li>An energy spectrum \(E(k)\) that peaks at a characteristic wavenumber \(k^* \sim 2\pi/(70\;\mu\text{m})\) and decays steeply at both larger and smaller scales</li>
<li>Gaussian velocity statistics but exponential vorticity statistics</li>
</ul>
Simulations of the Saintillan-Shelley model reproduce these features quantitatively, confirming that the collective flow arises from the hydrodynamic instability of pusher suspensions rather than from direct swimmer-swimmer contact.
</div>

The term "bacterial turbulence" is evocative but somewhat misleading: unlike inertial turbulence, which involves a cascade of energy from large to small scales, bacterial turbulence is sustained by energy injection at the scale of individual swimmers and features an inverse transfer of energy to larger scales. The characteristic length scale is set by the balance between hydrodynamic instability (which drives large-scale flows) and rotational diffusion (which disrupts orientational order).

<div class="remark">
<strong>Remark 8.2.</strong> The analogy between bacterial turbulence and classical inertial turbulence, while superficially appealing, breaks down in important respects. In inertial turbulence (Kolmogorov 1941), energy is injected at large scales and cascades to small scales, where it is dissipated by viscosity; the energy spectrum follows the \(E(k) \propto k^{-5/3}\) scaling in the inertial range. In bacterial turbulence, energy is injected at the swimmer scale (\(\sim 5\;\mu\text{m}\)) and is transferred upward to larger scales through the hydrodynamic instability mechanism, while being dissipated at all scales by viscosity. The resulting spectrum peaks at a finite wavenumber and decays at both large and small \(k\), with no inertial range. Dunkel et al. (2013) measured the energy spectrum and found \(E(k) \propto k^4\) at small \(k\) (consistent with random force dipoles) and exponential decay at large \(k\). The analogy to turbulence is therefore primarily visual — the chaotic spatiotemporal patterns look turbulent — rather than dynamical. Goldstein (2015) has provided an illuminating discussion of these distinctions.
</div>

### 8.6 Pusher-Puller Asymmetry and Confinement

The distinction between pushers and pullers extends to their behaviour near surfaces and in confinement.

<div class="proposition">
<strong>Proposition 8.1.</strong> A pusher swimming near a no-slip wall is attracted toward the wall and tends to align parallel to it, while a puller is repelled. This can be understood from the method of images: the image system for a stresslet near a wall generates a velocity field that attracts pushers and repels pullers. The accumulation of pushers near surfaces explains the well-known tendency of bacteria to swim along surfaces and accumulate at boundaries — a behaviour of great importance for biofilm formation and infection.
</div>

<div class="remark">
<strong>Remark 8.1.</strong> In confinement, the collective dynamics of active suspensions are further enriched. Dense pusher suspensions in thin films exhibit spontaneous flow organisation that is qualitatively different from the bulk: quasi-two-dimensional "active nematics" exhibit half-integer topological defects that nucleate, move, and annihilate in a chaotic dance. The theory of active nematics, building on the work of Simha and Ramaswamy (2002) and Marchetti et al. (2013), has become one of the most active areas in soft matter physics.
</div>

### 8.7 Schooling and Flocking: A Fluid-Mechanical Perspective

At larger scales — fish schools, bird flocks, insect swarms — the fluid medium is not merely a passive backdrop but an active participant in the collective dynamics. Fish in a school can exploit the vortex wake of their neighbours to reduce their energy expenditure, and birds in V-formation benefit from the upwash of the wingtip vortices of the bird ahead.

<div class="example">
<strong>Example 8.2 (Energy Savings in Fish Schools).</strong> Weihs (1973) proposed that fish in a school can save energy by positioning themselves in a diamond lattice pattern that allows each fish (except those at the leading edge) to exploit the reverse von Kármán vortex street shed by its upstream neighbours. The energy savings can be estimated from the velocity induced by the wake vortices at the position of the following fish:

\[
\frac{\Delta P}{P_{\text{solo}}} \approx \frac{\Gamma}{2\pi d\, U} \cdot \frac{d}{L_w},
\]
where \(\Gamma\) is the vortex strength, \(d\) is the lateral spacing, \(U\) is the swimming speed, and \(L_w\) is the streamwise vortex spacing. For typical school spacings (\(d/L \approx 0.3\), where \(L\) is the body length), the energy savings are estimated at 10-20%. Recent experiments using robotic fish (Li et al., 2020) and particle image velocimetry of real fish schools have broadly confirmed these estimates.
</div>

<div class="theorem">
<strong>Theorem 8.3 (Optimal Spacing in V-Formation Flight).</strong> For birds flying in V-formation, the induced drag on a following bird is minimised when the bird positions itself at the wingtip of the bird ahead, with a lateral offset equal to the wingspan \(b\). In this configuration, the Trefftz-plane analysis gives a drag reduction of

\[
\frac{D_{\text{formation}}}{D_{\text{solo}}} = 1 - \frac{1}{N}\left(1 + 2\sum_{k=1}^{N-1}\frac{N-k}{N}\frac{1}{\sqrt{1 + (k\,s/b)^2}}\right)^{-1},
\]
where \(N\) is the number of birds and \(s\) is the streamwise spacing. For large \(N\) with optimal spacing, the drag reduction per bird approaches \(1 - 1/N\), meaning the flock as a whole uses the same total power as a single bird — a dramatic saving that has been confirmed by heart-rate telemetry on pelicans (Weimerskirch et al., 2001).
</div>

The fluid-mechanical perspective on collective animal locomotion reveals a deep connection between evolutionary biology and optimal transport theory: natural selection drives collective behaviour toward configurations that minimise energy expenditure, subject to the constraints of hydrodynamics or aerodynamics. This is, in a sense, Murray's law (Chapter 4) writ large — the optimisation of biological transport networks by evolutionary pressure operating through the physics of fluid flow.

<div class="remark">
<strong>Remark 8.3.</strong> The study of collective locomotion in fluids has grown from a niche topic in applied mathematics to a central theme connecting fluid mechanics, statistical physics, biology, and engineering. The mathematical tools developed in this course — Stokes singularities, slender body theory, continuum kinetic models, thin-film equations — provide the quantitative foundation for this interdisciplinary enterprise. The key unifying idea is that living systems are not passive objects transported by flows but active agents that modify the flow and are in turn modified by it. This two-way coupling between biological activity and fluid mechanics, operating across scales from nanometres (molecular motors) to kilometres (fish schools), is what makes biological fluid dynamics one of the richest and most challenging areas of applied mathematics.
</div>

---

### References and Further Reading

The material in these notes draws on a rich tradition at the intersection of applied mathematics, fluid mechanics, and biology. For low-Reynolds-number hydrodynamics and microswimming (Chapters 1-3), the definitive modern reference is E. Lauga, *The Fluid Dynamics of Cell Motility* (Cambridge University Press, 2020); the original papers of Taylor (1951), Lighthill (1952, 1976), and Purcell (1977) remain essential reading. For hemodynamics and blood rheology (Chapters 4-5), see T.J. Pedley, *The Fluid Mechanics of Large Blood Vessels* (Cambridge University Press, 1980) and Y.C. Fung, *Biomechanics: Circulation* (Springer, 1997). For pulmonary mechanics (Chapter 6), the review by Grotberg (2001) is an excellent entry point. For thin-film theory and capsule mechanics (Chapter 7), see the monographs by Oron, Davis, and Bankoff (1997) and Pozrikidis (2003). For active matter and collective locomotion (Chapter 8), the review by Marchetti et al. (2013) and the kinetic theory of Saintillan and Shelley (2008) are foundational. The Cambridge DAMTP Part III course on Biological Fluid Dynamics (taught variously by Goldstein, Lauga, and Lister) has shaped the pedagogical approach taken here.
