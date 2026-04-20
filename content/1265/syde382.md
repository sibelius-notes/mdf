---
title: "SYDE 382: Multi-Physics Modelling and Simulation"
subjects: "SYDE"
---

## Sources and References

- Zienkiewicz and Taylor, <em>The Finite Element Method</em> (Vols. 1-3), for the FEM core.
- Bathe, <em>Finite Element Procedures</em>, for numerical detail.
- Hughes, <em>The Finite Element Method: Linear Static and Dynamic Analysis</em>, for structural emphasis.
- Reddy, <em>An Introduction to the Finite Element Method</em>, for a gentle entry.
- LeVeque, <em>Finite Difference Methods for Ordinary and Partial Differential Equations</em>, for classification and stability.
- Ferziger and Peric, <em>Computational Methods for Fluid Dynamics</em>, for CFD practice.
- Jin, <em>The Finite Element Method in Electromagnetics</em>, for edge-element Maxwell formulations.
- Saad, <em>Iterative Methods for Sparse Linear Systems</em>, for Krylov methods and preconditioning.
- MIT OpenCourseWare 16.810 and 2.093, and Stanford CME 306, for open lecture material reinforcing the same canon.

---

## Preface: Why Multi-Physics?

Modern engineering artefacts rarely live inside a single physical domain. A piezoelectric accelerometer simultaneously experiences mechanical strain, an internal electric field, and a thermal bath that modulates its piezo coefficients. A MEMS cantilever switch couples elastostatics, electrostatics, and squeeze-film gas damping. Blood flowing in a compliant artery deforms the vessel wall, which in turn reshapes the flow channel. To predict the behaviour of such devices one must write down, discretise, and solve *several* coupled partial differential equations (PDEs) at once.

The unifying observation of this course is that almost every classical field theory in engineering begins from the same grammar — a **conservation law** stated over an arbitrary control volume, paired with a **constitutive law** that closes the system. Once this grammar is internalised, the leap from heat conduction to Navier–Stokes or from elasticity to Maxwell's equations is short. The second half of the course concerns how to turn those continuous equations into algebraic systems that a computer can solve reliably, and how to trust the answers.

<div style="border:1px solid #888;padding:0.75em;margin:0.75em 0;"><strong>Learning objectives.</strong> After working through these notes you should be able to (i) derive the governing PDE of a physical system from first principles, (ii) classify the PDE and identify admissible boundary and initial conditions, (iii) construct a finite difference or finite element discretisation, (iv) choose an appropriate linear solver and time integrator, and (v) design a verification-and-validation plan for a multi-physics simulation.</div>

## 1. The Grammar of Conservation Laws

### 1.1 Reynolds transport and the integral balance

Let \(\Omega(t)\) be a material volume — a parcel of matter that moves with the flow — and let \(\phi(\mathbf{x},t)\) be a per-unit-volume density of some extensive quantity (mass, momentum, energy, charge). The Reynolds transport theorem states

\[ \frac{d}{dt}\int_{\Omega(t)} \phi \, dV = \int_{\Omega} \frac{\partial \phi}{\partial t}\, dV + \int_{\partial \Omega} \phi\, \mathbf{u}\cdot\mathbf{n}\, dA, \]

where \(\mathbf{u}\) is the velocity of the material surface and \(\mathbf{n}\) is the outward unit normal. A generic conservation law asserts that the rate of change of \(\phi\) inside a fixed Eulerian control volume equals the net inward flux plus the volumetric production:

\[ \frac{\partial \phi}{\partial t} + \nabla\cdot \mathbf{J} = s. \]

Here \(\mathbf{J}\) is the flux vector and \(s\) the source density. Every PDE in this course is, at heart, a specialisation of this template; the physics enters by naming \(\phi\), \(\mathbf{J}\), and \(s\).

### 1.2 Mass conservation

Setting \(\phi=\rho\) (mass density), \(\mathbf{J}=\rho\mathbf{u}\), and \(s=0\) yields the continuity equation

\[ \frac{\partial \rho}{\partial t} + \nabla\cdot(\rho\mathbf{u}) = 0. \]

For an incompressible flow (\(D\rho/Dt=0\)) this reduces to \(\nabla\cdot\mathbf{u}=0\), a kinematic constraint that will later become the origin of the pressure-Poisson coupling.

### 1.3 Momentum conservation

With \(\phi=\rho\mathbf{u}\), flux \(\mathbf{J}=\rho\mathbf{u}\otimes\mathbf{u}-\boldsymbol{\sigma}\), and body force \(s=\rho\mathbf{b}\), one obtains Cauchy's equation of motion

\[ \rho\frac{D\mathbf{u}}{Dt} = \nabla\cdot\boldsymbol{\sigma} + \rho\mathbf{b}, \]

where \(\boldsymbol{\sigma}\) is the Cauchy stress tensor. This identical equation governs both a flowing fluid and a deforming solid — only the constitutive law for \(\boldsymbol{\sigma}\) differs.

### 1.4 Energy conservation and the thermodynamic trio

Taking \(\phi=\rho e\) (total energy density), flux \(\mathbf{q}-\boldsymbol{\sigma}\cdot\mathbf{u}\), and source \(\rho\mathbf{b}\cdot\mathbf{u}+\dot{q}_{\mathrm{vol}}\) leads to

\[ \rho\frac{De}{Dt} = -\nabla\cdot\mathbf{q} + \boldsymbol{\sigma}:\nabla\mathbf{u} + \rho\mathbf{b}\cdot\mathbf{u}. \]

From \(e\) one derives **enthalpy** \(h=e+p/\rho\) and, via the Clausius inequality, **entropy** \(s\). The second law appears in simulation not as a direct discretisation target but as a monotonicity constraint that good schemes must respect — entropy should never decrease numerically in an adiabatic closed system.

### 1.5 Charge conservation

Put \(\phi=\rho_e\) (charge density) and \(\mathbf{J}\) the electric current density; then \(\partial_t\rho_e+\nabla\cdot\mathbf{J}=0\). This tiny equation is the compatibility condition that glues Maxwell's equations together, as we shall see.

## 2. Navier–Stokes Equations

### 2.1 Constitutive closure for a Newtonian fluid

The Cauchy stress of an isotropic Newtonian fluid splits into an isotropic pressure and a viscous part proportional to the symmetric velocity gradient:

\[ \boldsymbol{\sigma} = -p\mathbf{I} + 2\mu\,\mathbf{D} + \lambda(\nabla\cdot\mathbf{u})\mathbf{I}, \qquad \mathbf{D}=\tfrac{1}{2}\left(\nabla\mathbf{u}+\nabla\mathbf{u}^{\mathsf{T}}\right). \]

Substituting into Cauchy's equation and imposing Stokes' hypothesis \(3\lambda+2\mu=0\) gives the compressible Navier–Stokes momentum equation. For incompressible flow,

\[ \rho\left(\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u}\cdot\nabla)\mathbf{u}\right) = -\nabla p + \mu\nabla^{2}\mathbf{u} + \rho\mathbf{b}, \qquad \nabla\cdot\mathbf{u} = 0. \]

### 2.2 Nondimensionalisation

With reference length \(L\), speed \(U\), time \(L/U\), and pressure \(\rho U^{2}\), one obtains \(Re=\rho U L/\mu\), the Reynolds number. The inviscid (high-\(Re\)) and Stokes (low-\(Re\)) limits of the equation are structurally very different PDEs — the former hyperbolic-dominated, the latter elliptic. A single discretisation rarely handles both extremes gracefully, which is why solver choice in CFD is so sensitive to regime.

### 2.3 The incompressibility trap

The continuity equation contains no time derivative of pressure, so \(p\) is a Lagrange multiplier enforcing \(\nabla\cdot\mathbf{u}=0\). Taking the divergence of the momentum equation yields the **pressure-Poisson equation**

\[ \nabla^{2}p = -\rho\,\nabla\cdot\left[(\mathbf{u}\cdot\nabla)\mathbf{u}\right], \]

which must be satisfied at every time step. Projection methods (Chorin, Van Kan) and SIMPLE/PISO iterations exist precisely to tame this constraint.

## 3. Maxwell's Equations

Maxwell's equations in differential form read

\[ \nabla\cdot\mathbf{D} = \rho_e, \qquad \nabla\cdot\mathbf{B} = 0, \]

\[ \nabla\times\mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}, \qquad \nabla\times\mathbf{H} = \mathbf{J} + \frac{\partial \mathbf{D}}{\partial t}, \]

closed by constitutive laws \(\mathbf{D}=\varepsilon\mathbf{E}\), \(\mathbf{B}=\mu\mathbf{H}\), \(\mathbf{J}=\sigma\mathbf{E}\) (Ohm) for linear isotropic media. Taking the divergence of Ampère's law and substituting Gauss's law recovers charge conservation — the equations are over-determined by exactly one compatibility relation.

In quasi-static limits one drops displacement current (magneto-quasistatics) or magnetic induction (electro-quasistatics), yielding elliptic problems for scalar or vector potentials. Introducing \(\mathbf{B}=\nabla\times\mathbf{A}\) and a gauge (typically Coulomb, \(\nabla\cdot\mathbf{A}=0\)) converts the full wave problem into a vector Poisson equation that is amenable to the same finite element machinery used for elasticity.

## 4. Structural Mechanics

### 4.1 Equilibrium

Setting \(D\mathbf{u}/Dt=\partial^{2}\mathbf{u}/\partial t^{2}\) in Cauchy's equation (small displacement assumption) and linearising gives

\[ \rho\frac{\partial^{2}\mathbf{u}}{\partial t^{2}} = \nabla\cdot\boldsymbol{\sigma} + \mathbf{f}. \]

### 4.2 Linear elasticity

Strain is the symmetric gradient \(\boldsymbol{\varepsilon}=\tfrac{1}{2}(\nabla\mathbf{u}+\nabla\mathbf{u}^{\mathsf{T}})\). Hooke's law in isotropic form reads

\[ \boldsymbol{\sigma} = \lambda\,\mathrm{tr}(\boldsymbol{\varepsilon})\mathbf{I} + 2\mu\boldsymbol{\varepsilon}, \]

with \(\lambda,\mu\) the Lamé parameters. Substituting yields the Navier–Cauchy equation

\[ (\lambda+\mu)\nabla(\nabla\cdot\mathbf{u}) + \mu\nabla^{2}\mathbf{u} + \mathbf{f} = \rho\ddot{\mathbf{u}}. \]

Notice the identical Laplacian structure as in viscous flow — a hint that the *same* Galerkin finite element code can solve both problems by swapping material matrices.

### 4.3 Beams, plates, and reduced models

For slender structures, asymptotic integration through the cross-section produces Euler–Bernoulli and Timoshenko beams, Kirchhoff and Mindlin plates. These reduced models are essential for MEMS cantilevers in Section 14, where full 3D meshing would be wasteful.

## 5. Coupled Multi-Physics: A Gallery

<div style="border:1px solid #888;padding:0.75em;margin:0.75em 0;"><em>Why coupling is hard.</em> Two physics domains couple through <strong>shared fields</strong> on a shared <strong>interface</strong>. The mathematical consequence is that the resulting operator is often <strong>non-symmetric</strong>, possibly <strong>indefinite</strong>, and can inherit disparate time scales from each subsystem. Numerical stability becomes a coupled question — a scheme that is unconditionally stable for each physics in isolation may go unstable when the two are glued together.</div>

**Thermoelectric coupling (Joule heating).** A resistive conductor dissipates electric power \(\mathbf{J}\cdot\mathbf{E}\) as heat, and its conductivity \(\sigma(T)\) depends on temperature. The electrostatic potential \(\varphi\) satisfies \(\nabla\cdot(\sigma(T)\nabla\varphi)=0\); the temperature field satisfies \(\rho c_p \partial_t T=\nabla\cdot(k\nabla T)+\sigma|\nabla\varphi|^{2}\). The nonlinearity enters through \(\sigma(T)\).

**Piezoelectric coupling.** In a piezoelectric solid the constitutive law enlarges to

\[ \boldsymbol{\sigma} = \mathbf{c}^{E}:\boldsymbol{\varepsilon} - \mathbf{e}^{\mathsf{T}}\cdot\mathbf{E}, \qquad \mathbf{D} = \mathbf{e}:\boldsymbol{\varepsilon} + \boldsymbol{\varepsilon}^{S}\cdot\mathbf{E}, \]

where \(\mathbf{e}\) is the piezoelectric tensor. Mechanical strain generates an electric displacement, and an applied voltage induces mechanical stress. The coupled system is symmetric when the mechanical and electrical unknowns are scaled consistently — a happy case.

**Fluid–structure interaction (FSI).** A compliant wall moves under fluid tractions; the fluid domain is itself deformed by the wall motion. Either the flow is solved on an arbitrary-Lagrangian–Eulerian (ALE) mesh that tracks the wall, or the structure is embedded via immersed-boundary methods.

**Electromagnetic–thermal coupling.** Induction heating and dielectric heating both combine Maxwell's equations in frequency domain with a transient heat equation whose source is the time-averaged Poynting flux divergence.

## 6. Classification of PDEs

Consider a second-order linear PDE in two variables

\[ A u_{xx} + 2B u_{xy} + C u_{yy} + \text{lower order} = 0. \]

The discriminant \(B^{2}-AC\) determines the character:

| Discriminant | Type | Prototype | Typical behaviour |
| --- | --- | --- | --- |
| \\(B^{2}-AC<0\\) | Elliptic | Laplace \\(\nabla^{2}u=0\\) | Smooth, boundary-value |
| \\(B^{2}-AC=0\\) | Parabolic | Heat \\(u_t=\alpha\nabla^{2}u\\) | Diffusive, initial \\(\lvert\\)-boundary value |
| \\(B^{2}-AC>0\\) | Hyperbolic | Wave \\(u_{tt}=c^{2}u_{xx}\\) | Wave propagation at finite speed |

Elliptic problems require boundary data everywhere on \(\partial\Omega\); parabolic problems need an initial condition plus boundary data for all later times; hyperbolic problems propagate information along characteristics at finite speed and obey a **domain of dependence** that any consistent numerical stencil must contain.

Multi-physics problems mix types — for instance, incompressible Navier–Stokes is parabolic in velocity but elliptic in pressure. Understanding this mixture is the first step in choosing a solver.

## 7. Boundary Conditions

A well-posed boundary value problem needs conditions of the right number and type. The common ones are:

1. **Dirichlet** — the field value is prescribed: \(u=g\) on \(\partial\Omega\). Called *essential* in variational formulations because it is enforced in the trial space.
2. **Neumann** — the normal derivative (flux) is prescribed: \(\partial u/\partial n = h\). Called *natural* because it arises from the boundary term in integration by parts.
3. **Robin / mixed** — a linear combination: \(\alpha u + \beta\,\partial u/\partial n = \gamma\). Models convective heat transfer (\(h(T_s-T_\infty)\)), radiating impedance, or surface reaction.
4. **Periodic** — \(u(\mathbf{x}+\mathbf{L})=u(\mathbf{x})\). Essential for crystalline solids, flow in infinite channels, and spectral methods.
5. **Symmetry** — zero-flux Neumann on a plane of geometric and loading symmetry. A free savings of computational effort.

<div style="border:1px solid #888;padding:0.75em;margin:0.75em 0;"><strong>Pitfall.</strong> Pure Neumann data on an elliptic problem leaves the solution defined only up to an additive constant, and requires a compatibility condition \\(\int_{\partial\Omega} h\,dA + \int_\Omega s\,dV = 0\\). Forgetting to anchor the solution (by pinning one node or adding a zero-mean constraint) produces a singular stiffness matrix — a classic first-project trap.</div>

## 8. Finite Difference Method

### 8.1 Derivative approximations

Taylor-expanding about \(x_i\) yields

\[ u'(x_i) = \frac{u_{i+1}-u_{i-1}}{2h} + \mathcal{O}(h^{2}), \qquad u''(x_i) = \frac{u_{i+1}-2u_i+u_{i-1}}{h^{2}} + \mathcal{O}(h^{2}). \]

Higher-order stencils (fourth-order central, upwind-biased) are constructed analogously by matching more Taylor terms.

### 8.2 Consistency, stability, convergence

A scheme is **consistent** if its truncation error vanishes as the grid is refined; it is **stable** if round-off and initial errors do not grow unboundedly; it is **convergent** if the numerical solution approaches the exact solution under refinement. The Lax equivalence theorem states, for linear well-posed problems: *consistency + stability \(\Leftrightarrow\) convergence.*

Stability is most often analysed by von Neumann Fourier analysis: substitute \(u_j^n=g^n e^{ikjh}\) and demand that the amplification factor \(\lvert g(k)\rvert\le 1\) for all wavenumbers.

### 8.3 Explicit vs implicit, and the CFL condition

For the advection equation \(u_t + a u_x = 0\) discretised with an upwind explicit scheme,

\[ u_j^{n+1} = u_j^n - \frac{a\Delta t}{\Delta x}\left(u_j^n - u_{j-1}^n\right), \]

von Neumann analysis gives \(\lvert g\rvert\le 1\) iff \(\nu\equiv a\Delta t/\Delta x \in[0,1]\). The condition \(\nu\le 1\) is the **Courant–Friedrichs–Lewy (CFL)** condition: information cannot cross more than one cell per time step, mirroring the physical domain of dependence.

Implicit schemes (backward Euler, Crank–Nicolson) trade a larger algebraic solve at each step for much relaxed stability limits — often *unconditional* stability for linear parabolic problems — which is indispensable for stiff multi-physics.

## 9. Finite Volume Method (Short Detour)

Finite volume methods integrate the conservation law over each control volume and apply the divergence theorem, so fluxes between neighbouring cells appear as numerical flux functions \(\hat{F}(u_L,u_R)\). This guarantees **discrete conservation** — the sum of fluxes across interior faces cancels pairwise, leaving only boundary flux. The method is the workhorse of industrial CFD for its ability to handle shocks and conservation-critical quantities (mass, species, energy) cleanly.

## 10. Finite Element Method

### 10.1 Weak form and Galerkin projection

Consider \(-\nabla^{2} u = f\) in \(\Omega\) with \(u=0\) on \(\partial\Omega\). Multiplying by a test function \(v\in H^{1}_{0}\) and integrating by parts,

\[ \int_\Omega \nabla u\cdot\nabla v\, dV = \int_\Omega f v\, dV. \]

The **weak form** requires only one derivative of \(u\) to exist in \(L^{2}\), so discontinuous material data and reduced regularity are handled naturally. Choose a finite-dimensional trial space \(V_h=\mathrm{span}\{N_1,\dots,N_N\}\), expand \(u_h=\sum_j u_j N_j\), and take \(v=N_i\) to obtain the linear system

\[ \mathbf{K}\mathbf{u} = \mathbf{f}, \qquad K_{ij}=\int_\Omega \nabla N_i\cdot\nabla N_j\, dV, \quad f_i=\int_\Omega f N_i\, dV. \]

### 10.2 Shape functions

Nodal shape functions satisfy \(N_j(\mathbf{x}_i)=\delta_{ij}\). Linear triangles in 2D have three nodes and linear shape functions; quadratic triangles add mid-side nodes; bilinear quadrilaterals, trilinear hexahedra, and their higher-order serendipity variants populate 3D meshes. For vector problems (elasticity, electromagnetics) one uses either componentwise scalar bases or specialised vector elements — \(H(\mathrm{curl})\)-conforming edge elements (Nédélec) for Maxwell, \(H(\mathrm{div})\)-conforming face elements (Raviart–Thomas) for flux-oriented problems.

### 10.3 Isoparametric mapping and Gauss quadrature

Physical elements are defined by mapping a reference element \(\hat\Omega\) through the same shape functions that carry the solution:

\[ \mathbf{x}(\boldsymbol{\xi}) = \sum_j N_j(\boldsymbol{\xi})\,\mathbf{x}_j. \]

Derivatives transform via the Jacobian \(\mathbf{J}=\partial\mathbf{x}/\partial\boldsymbol{\xi}\). Element integrals are evaluated numerically:

\[ \int_\Omega f\, dV = \sum_{g=1}^{n_g} w_g\, f(\boldsymbol{\xi}_g)\,\lvert\det\mathbf{J}(\boldsymbol{\xi}_g)\rvert. \]

Gauss–Legendre points of order \(n_g\) integrate polynomials exactly up to degree \(2n_g-1\). Full integration is safe; **reduced integration** is sometimes used to cure locking phenomena in nearly incompressible elasticity, at the cost of spurious zero-energy modes.

### 10.4 Assembly

Each element contributes a small dense matrix \(\mathbf{k}^{e}\) and vector \(\mathbf{f}^{e}\); these are scattered into the global system using a connectivity map. The resulting \(\mathbf{K}\) is **sparse** (each row has only as many non-zeros as the node's neighbours), **symmetric** (for self-adjoint operators), and **positive definite** (after Dirichlet BCs are applied). Efficient sparse storage (CSR, CSC, skyline) is mandatory for any realistic problem size.

## 11. Mesh Generation and Quality

A numerical answer is only as good as the mesh on which it sits. Poor elements destroy both accuracy and conditioning.

Key quality metrics include:

- **Aspect ratio** (longest edge over shortest, or element inradius/circumradius). Values near 1 are ideal; values above \(\sim 10\) pollute gradient accuracy.
- **Skewness** — deviation from the ideal angular shape (60° for triangles, 90° for quads).
- **Jacobian ratio** — negative Jacobian means an element has been turned inside out; values close to 1 across the element are preferred.
- **Orthogonality** — the angle between the line connecting cell centroids and the face normal, critical for finite volume accuracy.

Mesh generation strategies divide into **structured** (logically rectangular grids, easy to index, impossible for complex geometry), **unstructured** (triangles/tets via Delaunay or advancing front, general-purpose), and **hybrid** (structured boundary layers with unstructured interior, common in CFD). Local refinement near singularities, shocks, and boundary layers concentrates computational effort where it pays off.

A **mesh convergence study** — repeating the simulation on successively refined meshes and plotting a quantity of interest against a characteristic element size — is the primary numerical evidence that the discretisation error is small.

## 12. Linear Solvers

The discretised PDE yields \(\mathbf{K}\mathbf{u}=\mathbf{f}\) with \(\mathbf{K}\in\mathbb{R}^{N\times N}\). How one solves this system depends on \(N\), sparsity, symmetry, and definiteness.

### 12.1 Direct methods

**LU decomposition** with partial pivoting computes \(\mathbf{K}=\mathbf{P}\mathbf{L}\mathbf{U}\) at \(\mathcal{O}(N^{3})\) flops for dense systems, much less for sparse banded ones. When \(\mathbf{K}\) is symmetric positive definite, **Cholesky** \(\mathbf{K}=\mathbf{L}\mathbf{L}^{\mathsf{T}}\) halves the work and guarantees stability without pivoting. Sparse direct solvers (MUMPS, PARDISO, SuperLU) exploit fill-reducing orderings (nested dissection, approximate minimum degree) and are the method of choice for moderate-sized 2D and small 3D problems.

### 12.2 Basic iterative methods

Write \(\mathbf{K}=\mathbf{D}+\mathbf{L}+\mathbf{U}\) (diagonal + strictly lower + strictly upper). Three classical splittings:

- **Jacobi:** \(\mathbf{u}^{(k+1)}=\mathbf{D}^{-1}(\mathbf{f}-(\mathbf{L}+\mathbf{U})\mathbf{u}^{(k)})\). Embarrassingly parallel but slow convergence, governed by the spectral radius of \(\mathbf{D}^{-1}(\mathbf{L}+\mathbf{U})\).
- **Gauss–Seidel:** update sweeps through components, always using the newest values. Faster than Jacobi for most problems but intrinsically serial in its classical form.
- **Successive Over-Relaxation (SOR):** \(\mathbf{u}^{(k+1)}=\mathbf{u}^{(k)}+\omega\,\delta^{GS}\) with \(\omega\in(1,2)\). The optimal \(\omega\) can reduce iterations dramatically on model problems.

### 12.3 Krylov subspace methods

For SPD systems, the **Conjugate Gradient (CG)** method minimises \(\tfrac{1}{2}\mathbf{u}^{\mathsf{T}}\mathbf{K}\mathbf{u}-\mathbf{f}^{\mathsf{T}}\mathbf{u}\) over a Krylov subspace and converges in exact arithmetic in \(N\) steps, but in practice much faster if the spectrum is clustered. Convergence in \(k\) iterations is bounded by

\[ \frac{\lVert\mathbf{e}^{(k)}\rVert_\mathbf{K}}{\lVert\mathbf{e}^{(0)}\rVert_\mathbf{K}} \le 2\left(\frac{\sqrt{\kappa}-1}{\sqrt{\kappa}+1}\right)^{k}, \]

where \(\kappa=\lambda_{\max}/\lambda_{\min}\) is the condition number. **GMRES** generalises to nonsymmetric systems by minimising the residual in a Krylov subspace; it is the workhorse for convection-dominated and Maxwell problems but has growing memory costs unless restarted.

### 12.4 Preconditioning

Because Krylov convergence is driven by \(\kappa\), one solves the equivalent system \(\mathbf{M}^{-1}\mathbf{K}\mathbf{u}=\mathbf{M}^{-1}\mathbf{f}\), where \(\mathbf{M}\) is cheap to invert and close to \(\mathbf{K}\). Common preconditioners:

1. Jacobi (diagonal scaling) — trivial, weakly effective.
2. Incomplete LU (ILU(\(k\)), ILU(\(\tau\))) — LU factors with extra entries dropped; general-purpose workhorse.
3. Incomplete Cholesky (IC) — SPD counterpart of ILU.
4. Multigrid (geometric or algebraic) — \(\mathcal{O}(N)\) optimal for elliptic problems, resolves all wavelengths by recursive coarsening.
5. Domain decomposition (additive Schwarz, BDDC) — parallel-friendly, natural for multi-physics partitioning.

<div style="border:1px solid #888;padding:0.75em;margin:0.75em 0;"><em>Rule of thumb.</em> For 3D elliptic problems with \\(N>10^{6}\\), iterative Krylov + multigrid preconditioning almost always beats direct factorisation in both memory and time. For moderate problems where a factorisation fits in RAM, direct solvers win on robustness.</div>

## 13. Time Integration

### 13.1 First-order ODEs

Discretising a parabolic PDE in space gives an ODE system \(\mathbf{M}\dot{\mathbf{u}}+\mathbf{K}\mathbf{u}=\mathbf{f}(t)\). The \(\theta\)-family

\[ \mathbf{M}\frac{\mathbf{u}^{n+1}-\mathbf{u}^n}{\Delta t} + \mathbf{K}\left[\theta\mathbf{u}^{n+1} + (1-\theta)\mathbf{u}^n\right] = \mathbf{f}^{n+\theta} \]

recovers forward Euler (\(\theta=0\), explicit, conditionally stable), backward Euler (\(\theta=1\), implicit, \(L\)-stable, first-order), and **Crank–Nicolson** (\(\theta=1/2\), implicit, \(A\)-stable, second-order but non-\(L\)-stable so it can ring on stiff modes).

### 13.2 Second-order ODEs: the Newmark family

For structural dynamics \(\mathbf{M}\ddot{\mathbf{u}}+\mathbf{C}\dot{\mathbf{u}}+\mathbf{K}\mathbf{u}=\mathbf{f}\), the Newmark scheme parameterised by \((\beta,\gamma)\) writes

\[ \mathbf{u}^{n+1} = \mathbf{u}^{n} + \Delta t\,\dot{\mathbf{u}}^{n} + \Delta t^{2}\!\left[(\tfrac{1}{2}-\beta)\ddot{\mathbf{u}}^{n} + \beta\ddot{\mathbf{u}}^{n+1}\right], \]

\[ \dot{\mathbf{u}}^{n+1} = \dot{\mathbf{u}}^{n} + \Delta t\!\left[(1-\gamma)\ddot{\mathbf{u}}^{n} + \gamma\ddot{\mathbf{u}}^{n+1}\right]. \]

Choice \((\beta,\gamma)=(1/4,1/2)\) gives the unconditionally stable, second-order, energy-conserving **average-acceleration** scheme — the default for linear structural dynamics. \((\beta,\gamma)=(0,1/2)\) recovers the central-difference explicit method, stable under \(\Delta t \le 2/\omega_{\max}\) and preferred for wave-propagation and impact.

### 13.3 Operator splitting and coupled time integration

Multi-physics solvers often use **operator splitting** — advance each physics by a sub-step using its preferred integrator, then exchange boundary data. Splitting errors are typically first-order per step; Strang splitting recovers second order at the cost of an extra half-step.

## 14. Verification and Validation (V&V)

<div style="border:1px solid #888;padding:0.75em;margin:0.75em 0;"><strong>Verification</strong> asks "are we solving the equations correctly?" — a mathematical question about the code and discretisation. <strong>Validation</strong> asks "are we solving the correct equations?" — a physical question comparing the model against experiment. The two cannot be meaningfully interchanged.</div>

**Verification** is performed by:

1. *Code verification* — method of manufactured solutions: substitute a chosen \(u^*(\mathbf{x},t)\) into the PDE, compute the implied source \(f=\mathcal{L}u^*\), solve numerically, and check that the observed convergence rate matches the theoretical order.
2. *Solution verification* — mesh and time-step convergence studies, Richardson extrapolation to estimate discretisation error. The **Grid Convergence Index** provides a standardised uncertainty bound.

**Validation** is performed by:

1. Benchmark problems with analytical or high-fidelity reference solutions (lid-driven cavity for Navier–Stokes, Sod shock tube for Euler, cantilever tip deflection for beams).
2. Comparison against experiments, with quantified uncertainty in both measurement and simulation inputs.

A defensible multi-physics study reports all three: discretisation error, model-form uncertainty, and parametric uncertainty.

## 15. Multi-Physics Coupling Strategies

### 15.1 Monolithic coupling

All unknowns are assembled into a single system and solved simultaneously,

\[ \begin{bmatrix} \mathbf{K}_{11} & \mathbf{K}_{12} \\ \mathbf{K}_{21} & \mathbf{K}_{22} \end{bmatrix}\begin{bmatrix}\mathbf{u}_1 \\ \mathbf{u}_2\end{bmatrix} = \begin{bmatrix}\mathbf{f}_1 \\ \mathbf{f}_2\end{bmatrix}. \]

Monolithic solvers preserve strong coupling exactly and avoid lag between subdomains, but require a single solver that can handle the composite operator — often non-symmetric, indefinite, and heterogeneously scaled.

### 15.2 Partitioned (staggered) coupling

Each physics is solved by its own legacy code, and coupling quantities (traction, heat flux, displacement) are exchanged at the interface. Variants:

- **Gauss–Seidel (explicit) staggered** — solve \(\mathbf{u}_1\), pass to solver 2, solve \(\mathbf{u}_2\), advance step. Simple but only first-order accurate in time and may be unstable for strong added-mass effects (e.g. incompressible FSI with light structures).
- **Fixed-point iteration** at each step — iterate the two solvers until the interface residual converges. Robust but expensive.
- **Aitken relaxation and quasi-Newton coupling (IQN-ILS)** — accelerate fixed-point iteration to convergence in handfuls of subiterations rather than dozens.

The choice between monolithic and partitioned is a trade-off between software engineering (legacy code reuse favours partitioned) and numerical robustness (strongly coupled problems favour monolithic).

## 16. Case Studies

### 16.1 Heat conduction in a coupled circuit

A power electronics module dissipates Joule heat in its conductors and must not exceed a junction temperature. The governing system is

\[ \nabla\cdot(\sigma(T)\nabla\varphi) = 0, \qquad \rho c_p \frac{\partial T}{\partial t} - \nabla\cdot(k\nabla T) = \sigma(T)\lvert\nabla\varphi\rvert^{2}, \]

with Dirichlet voltage on terminals, Neumann zero-flux on insulating faces, and Robin \(h(T-T_\infty)\) on the heatsink surface. A partitioned solve alternates a linear electrostatic step with a linear thermal step, iterating until \(\sigma(T)\) is self-consistent. Mesh refinement concentrates near narrow conductors where current density and Joule heating peak.

### 16.2 Piezoelectric sensor

A ceramic disc under oscillating pressure generates a voltage. The coupled constitutive law is inherently symmetric, so a monolithic block system in \((\mathbf{u},\varphi)\) with Cholesky-like factorisation works beautifully. The sensitivity of open-circuit voltage to material coefficients is computed by automatic differentiation of the assembled system — the same Jacobians that drive Newton iteration also power design optimisation.

### 16.3 MEMS cantilever switch

An electrostatically actuated cantilever bends under the Coulomb attraction between its top face and a fixed electrode. As the gap shrinks, the force grows as \(1/g^{2}\); at a critical voltage the device **pulls in**, snapping closed. Numerically this is a bifurcation of the nonlinear algebraic system, best traced by **arc-length continuation** rather than simple voltage ramping, which diverges near the turning point. Squeeze-film damping adds a Reynolds-equation gas-flow physics in the gap, giving a true three-field coupling (elastic + electrostatic + gas).

### 16.4 Blood flow in an artery

An incompressible Navier–Stokes flow in a moving domain couples to a hyperelastic vessel wall. Added-mass ratio (fluid density/solid density) near unity makes explicit partitioned coupling unstable; Aitken-relaxed partitioned or monolithic schemes are required. An ALE mesh tracks the vessel interior; mesh quality near the moving wall must be monitored every time step, with mesh smoothing or local re-meshing when elements degrade. Clinical boundary conditions are a challenge in themselves — proximal flow waveforms from imaging, distal Windkessel lumped models for downstream vasculature — and dominate the validation plan for patient-specific studies.

## 17. Synthesis

Multi-physics modelling succeeds when three habits are in place. First, **derive before discretising**: the conservation-and-constitutive grammar tells you what type of PDE you have, what boundary data it needs, and how it couples to neighbours. Second, **match solver to physics**: elliptic pieces demand fast Poisson/multigrid engines; hyperbolic pieces need CFL-respecting explicit stencils or characteristic-based schemes; parabolic pieces reward implicit time integration. Third, **verify, then validate**: no multi-physics result deserves a designer's confidence without a convergence study, a benchmark comparison, and an honest uncertainty budget.

With these habits the wide zoo of PDEs in mechanics, thermodynamics, fluids, and electromagnetics reduces to a small number of recurring patterns — and the finite element, finite difference, and finite volume machineries become different dialects of the same language rather than unrelated tools.
