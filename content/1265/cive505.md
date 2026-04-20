---
title: "CIVE 505: Structural Dynamics"
subjects: "CIVE"
---

## Sources and References

- Chopra, A. K. *Dynamics of Structures: Theory and Applications to Earthquake Engineering*. Pearson.
- Clough, R. W., and Penzien, J. *Dynamics of Structures*. Computers and Structures, Inc.
- Humar, J. L. *Dynamics of Structures*. CRC Press.
- Paz, M., and Kim, Y. H. *Structural Dynamics: Theory and Computation*. Springer.
- Craig, R. R., and Kurdila, A. J. *Fundamentals of Structural Dynamics*. Wiley.
- Tedesco, J. W., McDougal, W. G., and Ross, C. A. *Structural Dynamics: Theory and Applications*. Prentice Hall.
- Biggs, J. M. *Introduction to Structural Dynamics*. McGraw-Hill.
- Newmark, N. M., and Rosenblueth, E. *Fundamentals of Earthquake Engineering*. Prentice Hall.
- MIT OpenCourseWare 1.571 Structural Analysis and Control, and 1.581 Structural Dynamics.
- Stanford University CEE 246 Structural Dynamics course materials (publicly published lecture materials).
- Den Hartog, J. P. *Mechanical Vibrations*. Dover.
- Bathe, K.-J. *Finite Element Procedures*. Prentice Hall.

---

# Chapter 1: Foundations of Structural Dynamics

Structural dynamics is the branch of mechanics that treats structures as systems whose response evolves in time under loads that themselves vary in time. Unlike static analysis, where equilibrium is written once and solved, a dynamic problem demands that inertia and energy dissipation be carried through every instant. Civil and environmental engineers meet these problems when they design buildings and bridges for earthquake ground motion, towers for wind and vortex shedding, offshore platforms for wave action, foundations for machine vibration, and structures subject to blast, impact, and construction-induced shock.

## 1.1 Why Time Matters

A load applied slowly enough that inertia forces remain negligible is effectively static. The cutoff is not absolute; it depends on how the duration of the load compares with the natural periods of vibration of the structure. A pulse whose duration greatly exceeds the fundamental period of the structure is quasi-static, while a pulse of comparable or shorter duration produces significant dynamic amplification. The dimensionless ratio that controls this behavior appears everywhere in the subject and is the ratio of excitation frequency to natural frequency.

Three features set dynamics apart from statics. First, inertia forces proportional to acceleration act on every mass element, giving rise to the appearance of the second time derivative in the governing equation. Second, energy is dissipated by internal friction, micro-cracking, hysteresis in ductile materials, radiation into supporting soil, and aerodynamic drag; this dissipation is usually idealized as viscous damping for tractability. Third, the response contains not only a forced component driven by the excitation but also a transient free-vibration component that depends on initial conditions and decays under damping.

## 1.2 Degrees of Freedom

The number of independent displacement coordinates required to locate every mass of the structure at any instant is its number of degrees of freedom. A lumped-mass idealization concentrates distributed mass at discrete points, producing a finite number of degrees of freedom; a continuous model retains a distributed mass density and yields an infinite number. A water tank on a slender stem is often modeled as a single degree of freedom, its translation at the tank level being the one coordinate that matters for seismic response. A shear-building idealization of an N-story frame with rigid floor diaphragms yields N lateral degrees of freedom, one per floor. Bernoulli–Euler beams, axial rods, and plates are continuous systems, whose deformation is described by functions rather than by a finite set of coordinates.

<div class="definition">
<strong>Degree of freedom.</strong> A degree of freedom of a structural system is an independent kinematic coordinate that, together with the other degrees of freedom, completely specifies the configuration of every mass element of the system at a given instant.
</div>

## 1.3 Mass, Stiffness, and Damping

Every dynamic model is built from three ingredients. Mass captures inertia and is measured by the kinetic energy stored in motion. Stiffness captures the restoring action of elastic deformation and is measured by the strain energy stored in the deformed configuration. Damping captures energy dissipation and is measured, in the simplest idealization, by the rate at which kinetic plus strain energy is lost to heat and other irrecoverable forms. In a single-degree-of-freedom (SDOF) oscillator these are the scalars \( m \), \( k \), and \( c \). In a multi-degree-of-freedom (MDOF) system they become the matrices \( \mathbf{M} \), \( \mathbf{K} \), and \( \mathbf{C} \).

| Ingredient | Physical meaning | Mathematical form | Energy form |
|---|---|---|---|
| Mass | Resistance to acceleration | \( m \) or \( \mathbf{M} \) | Kinetic energy |
| Stiffness | Elastic restoring action | \( k \) or \( \mathbf{K} \) | Strain energy |
| Damping | Rate of energy dissipation | \( c \) or \( \mathbf{C} \) | Heat and other losses |

# Chapter 2: Equations of Motion

The first technical task is to write the equation of motion of the system. Four equivalent methods cover nearly every problem the civil engineer will meet. Each has advantages; a fluent analyst commands all of them.

## 2.1 Newton's Second Law

For a particle of mass \( m \) in rectilinear motion under resultant force \( F(t) \), Newton's second law reads

\[
m \ddot{u}(t) = F(t),
\]

where \( u(t) \) is displacement from a chosen reference. For a spring–mass–dashpot oscillator the resultant force comprises the externally applied force \( p(t) \), the spring force \( -k u \), and the dashpot force \( -c \dot{u} \). Substituting gives the canonical SDOF equation

\[
m \ddot{u} + c \dot{u} + k u = p(t).
\]

Newtonian assembly of vector equations is direct for systems with a few rigid bodies but becomes tedious when many constraint forces are present.

## 2.2 D'Alembert's Principle

D'Alembert converts a problem of dynamic equilibrium into an equivalent problem of static equilibrium by introducing an inertia force equal and opposite to \( m \ddot{u} \). The statement is that at every instant the sum of applied forces, elastic forces, damping forces, and inertia forces is zero. This device is particularly convenient when drawing free-body diagrams of multi-mass systems because each mass is treated as if in equilibrium under an augmented set of forces, and the standard tools of statics apply.

## 2.3 Virtual Work and Generalized Coordinates

When constraints couple the motion of several masses, generalized coordinates provide a compact description. If \( q_1, q_2, \ldots, q_n \) are generalized coordinates and \( \delta q_i \) are their virtual variations consistent with the constraints, the principle of virtual work for dynamic systems states that the virtual work of applied forces, inertia forces, and damping forces vanishes for every admissible set of virtual displacements. This principle avoids the need to compute constraint reactions explicitly and leads efficiently to the equations of motion.

## 2.4 Hamilton's Principle and the Lagrangian

Hamilton's principle recasts the equations of motion as a stationarity condition on an action integral. Define the Lagrangian \( L = T - V \), where \( T \) is kinetic energy and \( V \) is potential energy. Hamilton's principle requires

\[
\delta \int_{t_1}^{t_2} L \, dt + \int_{t_1}^{t_2} \delta W_{nc} \, dt = 0
\]

for all admissible variations of the generalized coordinates vanishing at the endpoints, where \( \delta W_{nc} \) is the virtual work of non-conservative forces, including damping. The Euler–Lagrange equations that follow are

\[
\frac{d}{dt}\!\left(\frac{\partial L}{\partial \dot{q}_i}\right) - \frac{\partial L}{\partial q_i} = Q_i,
\]

where \( Q_i \) are generalized non-conservative forces. Hamiltonian and Lagrangian methods are indispensable for continuous systems and for finite-element derivations, where they provide a systematic route from assumed shape functions to consistent mass and stiffness matrices.

<div class="remark">
<strong>Choosing a method.</strong> For a single particle or a pair of rigid bodies connected by a spring, Newton's law is quickest. For a shear building with floor-diaphragm constraints, D'Alembert combined with a stiffness-matrix assembly is natural. For a rotating cantilever with distributed mass, Hamilton's principle yields the governing partial differential equation and boundary conditions simultaneously.
</div>

# Chapter 3: SDOF Free Vibration

Free vibration occurs when the external force vanishes and the system oscillates under its own inertia, stiffness, and damping, set in motion by initial displacement, initial velocity, or both. The free-vibration solution establishes the concepts of natural frequency, period, and damping ratio that organize nearly all later results.

## 3.1 Undamped Free Vibration

With \( c = 0 \) and \( p(t) = 0 \) the SDOF equation is

\[
m \ddot{u} + k u = 0.
\]

Setting \( u = A \cos(\omega_n t) + B \sin(\omega_n t) \) and substituting gives

\[
\omega_n = \sqrt{\frac{k}{m}}, \qquad T_n = \frac{2\pi}{\omega_n}, \qquad f_n = \frac{1}{T_n},
\]

where \( \omega_n \) is the natural circular frequency in radians per second, \( T_n \) is the natural period in seconds, and \( f_n \) is the natural cyclic frequency in hertz. For initial displacement \( u_0 \) and initial velocity \( \dot{u}_0 \),

\[
u(t) = u_0 \cos(\omega_n t) + \frac{\dot{u}_0}{\omega_n} \sin(\omega_n t).
\]

The motion is a pure sinusoid, which persists forever in the absence of damping.

## 3.2 Viscous Damping

When a dashpot produces a force proportional to velocity, the equation is

\[
m \ddot{u} + c \dot{u} + k u = 0.
\]

Introducing the damping ratio \( \zeta = c / (2 m \omega_n) \) and the damped circular frequency \( \omega_d = \omega_n \sqrt{1 - \zeta^2} \), the underdamped solution \( (0 < \zeta < 1) \) is

\[
u(t) = e^{-\zeta \omega_n t} \left[ u_0 \cos(\omega_d t) + \frac{\dot{u}_0 + \zeta \omega_n u_0}{\omega_d} \sin(\omega_d t) \right].
\]

The displacement is a sinusoid of frequency \( \omega_d \) bounded by a decaying exponential envelope. For typical civil structures \( \zeta \) lies between 0.005 and 0.10, so \( \omega_d \) is essentially equal to \( \omega_n \). When \( \zeta = 1 \) the motion is critically damped and returns to rest without oscillation in the shortest time; for \( \zeta > 1 \) the system is overdamped and decays non-oscillatorily.

<div class="definition">
<strong>Damping ratio.</strong> The damping ratio \( \zeta \) of a viscously damped SDOF system is the ratio of its damping coefficient \( c \) to the critical damping coefficient \( c_{cr} = 2 m \omega_n = 2 \sqrt{k m} \).
</div>

The decay of successive peaks of an underdamped free vibration provides a classical experimental measure of damping. Taking the natural logarithm of the ratio of two peaks separated by \( n \) full cycles gives the logarithmic decrement

\[
\delta = \frac{1}{n} \ln \frac{u_i}{u_{i+n}} = \frac{2\pi n \zeta}{\sqrt{1 - \zeta^2}} \approx 2\pi \zeta \quad \text{for small } \zeta.
\]

## 3.3 Coulomb (Dry-Friction) Damping

When energy dissipation is governed by sliding friction of magnitude \( F \) rather than viscous action, the equation of motion switches sign with velocity. The amplitude decays linearly by \( 4 F / k \) per cycle rather than exponentially, and the period remains equal to the undamped period. Coulomb friction is relevant to sliding bearings, friction dampers, and certain joints in steel structures.

# Chapter 4: SDOF Forced Vibration

Forced vibration is the response to a prescribed external excitation. The superposition of the steady-state forced response and the decaying transient (homogeneous) response is the total response; after a few damping periods the transient is negligible and the steady state dominates.

## 4.1 Harmonic Excitation

Let the excitation be \( p(t) = p_0 \sin(\omega t) \). The steady-state particular solution is

\[
u_p(t) = u_{st,0} \, R_d \sin(\omega t - \phi),
\]

where \( u_{st,0} = p_0 / k \) is the static displacement under the peak force, \( r = \omega / \omega_n \) is the frequency ratio, and

\[
R_d(r, \zeta) = \frac{1}{\sqrt{(1 - r^2)^2 + (2 \zeta r)^2}}, \qquad \tan \phi = \frac{2 \zeta r}{1 - r^2}.
\]

The dynamic amplification factor \( R_d \) depends only on \( r \) and \( \zeta \), and its plot against \( r \) for several damping ratios is the single most informative graph in structural dynamics.

## 4.2 Resonance

When \( r = 1 \) and \( \zeta = 0 \), \( R_d \) is unbounded and the response grows linearly in time. For a lightly damped system \( R_d \) reaches its maximum near \( r \approx \sqrt{1 - 2 \zeta^2} \approx 1 \) and attains the value

\[
R_{d,\max} \approx \frac{1}{2 \zeta \sqrt{1 - \zeta^2}} \approx \frac{1}{2\zeta} \quad \text{for small } \zeta.
\]

A structure with 2 percent damping loaded at resonance therefore amplifies the static displacement roughly 25 times. This explains why pedestrian and wind footbridges, turbine foundations, and rotating-machine supports must be detuned away from their operating frequencies.

## 4.3 Transmissibility

Vibrating machinery transmits force to its foundation; a sensitive instrument on a vibrating floor experiences ground-induced motion. The transmissibility \( T_R \), defined as the ratio of transmitted force (or motion) amplitude to applied force (or base-motion) amplitude, is

\[
T_R = \sqrt{\frac{1 + (2 \zeta r)^2}{(1 - r^2)^2 + (2 \zeta r)^2}}.
\]

Vibration isolation requires \( T_R < 1 \), which occurs only for \( r > \sqrt{2} \). The isolator must therefore have a natural frequency well below the excitation frequency, the opposite of the stiff mount that intuition sometimes suggests.

<div class="example">
<strong>Machine on a flexible mount.</strong> A reciprocating pump of operating speed 25 Hz is to be mounted on isolators so that at most 10 percent of its shaking force reaches the floor. With 5 percent damping, one requires \( T_R \leq 0.10 \). Solving the transmissibility relation gives \( r \gtrsim 3.5 \), so the mount natural frequency must satisfy \( f_n \leq 25 / 3.5 \approx 7 \) Hz, and the isolator stiffness per unit mass is then \( k/m = (2 \pi f_n)^2 \approx 2000 \, (\text{rad/s})^2 \).
</div>

# Chapter 5: Response to Periodic, Impulsive, and Arbitrary Loads

Most real excitations are neither purely harmonic nor of infinite duration. Three overlapping frameworks handle the general case.

## 5.1 Fourier Series for Periodic Loads

A load \( p(t) \) of period \( T_p \) can be expanded as

\[
p(t) = a_0 + \sum_{n=1}^{\infty} \left[ a_n \cos\!\left(\frac{2 \pi n t}{T_p}\right) + b_n \sin\!\left(\frac{2 \pi n t}{T_p}\right) \right].
\]

The steady-state SDOF response to this sum is the sum of steady-state responses to each harmonic, each computed with its own frequency ratio and phase. Convergence is rapid for smooth excitations and slower for waveforms with discontinuities.

## 5.2 Impulse Response and the Unit Impulse

The unit-impulse response \( h(t) \) of an SDOF system is the response to a Dirac impulse delivered at \( t = 0 \) while the system is at rest. Integrating \( m \ddot{u} + c \dot{u} + k u = \delta(t) \) across \( t = 0 \) gives an initial velocity of \( 1/m \), so for an underdamped system

\[
h(t) = \frac{1}{m \omega_d} e^{-\zeta \omega_n t} \sin(\omega_d t), \qquad t \geq 0.
\]

## 5.3 Duhamel's Integral

By treating an arbitrary load as a sequence of infinitesimal impulses and superposing their responses, the displacement is

\[
u(t) = \int_0^t p(\tau) h(t - \tau) \, d\tau.
\]

Duhamel's integral is exact within the assumptions of linearity and time invariance. It is most useful for loads with simple closed-form expressions; for recorded signals and nonlinear systems the numerical methods of the next section are preferred.

## 5.4 Step-by-Step Numerical Integration

Time-stepping methods march the solution forward in discrete increments \( \Delta t \). The central-difference method

\[
u_{i+1} = \frac{2 m - k (\Delta t)^2}{m + c \Delta t / 2} u_i - \frac{m - c \Delta t / 2}{m + c \Delta t / 2} u_{i-1} + \frac{(\Delta t)^2}{m + c \Delta t / 2} p_i,
\]

is explicit and conditionally stable: \( \Delta t \) must not exceed \( T_n / \pi \). The Newmark-β family

\[
\dot{u}_{i+1} = \dot{u}_i + (1 - \gamma) \Delta t \, \ddot{u}_i + \gamma \Delta t \, \ddot{u}_{i+1},
\]

\[
u_{i+1} = u_i + \Delta t \, \dot{u}_i + \left(\tfrac{1}{2} - \beta\right)(\Delta t)^2 \ddot{u}_i + \beta (\Delta t)^2 \ddot{u}_{i+1},
\]

is implicit for \( \beta \neq 0 \) and unconditionally stable when \( \gamma = 1/2 \) and \( \beta = 1/4 \) (average-acceleration). The Wilson-θ method extrapolates the load to \( t + \theta \Delta t \) and solves there; with \( \theta \geq 1.37 \) it is unconditionally stable but introduces artificial amplitude decay at high frequencies. Civil engineering practice overwhelmingly favors Newmark average-acceleration for linear problems and Newmark with Newton–Raphson equilibrium iterations for nonlinear ones.

# Chapter 6: Shock and Earthquake Response Spectra

The response spectrum is the single most useful concept that structural dynamics has contributed to civil engineering design. It converts a time-history problem into an algebraic one by asking, for a given excitation, what peak response a damped SDOF oscillator of natural period \( T_n \) and damping ratio \( \zeta \) achieves.

## 6.1 Shock Spectra

A shock is a transient pulse of short duration relative to the natural period. The shock response spectrum plots peak displacement, peak velocity, or peak acceleration of SDOF oscillators as a function of \( T_n / t_d \), where \( t_d \) is the pulse duration. Key regimes are impulsive loading, where \( t_d \ll T_n \) and the peak response is governed by the impulse \( \int p \, dt \); static loading, where \( t_d \gg T_n \) and the peak response equals the static displacement under the peak force; and the intermediate region, where dynamic amplification can reach 2 for rectangular pulses and different bounds for triangular, half-sine, and other shapes.

## 6.2 Earthquake Ground Motion

For base excitation \( \ddot{u}_g(t) \), the relative displacement \( u(t) = u_{total}(t) - u_g(t) \) of an SDOF oscillator satisfies

\[
m \ddot{u} + c \dot{u} + k u = -m \ddot{u}_g(t).
\]

The effective force is proportional to the ground acceleration multiplied by the oscillator mass. Define three response quantities of an oscillator with period \( T_n \) and damping \( \zeta \):

\[
S_d(T_n, \zeta) = \max_t |u(t)|, \qquad S_v = \omega_n S_d, \qquad S_a = \omega_n^2 S_d.
\]

\( S_d \) is the peak relative displacement; \( S_v \) is the pseudo-velocity; \( S_a \) is the pseudo-acceleration. The product \( m S_a \) is the peak elastic force in the oscillator, which is the demand used in seismic design.

## 6.3 The Tripartite Logarithmic Plot

Because \( S_d \), \( S_v \), and \( S_a \) are related by factors of \( \omega_n \), all three are displayed simultaneously on a single tripartite logarithmic plot: \( S_v \) versus \( T_n \) with sloped grids of constant \( S_d \) and constant \( S_a \). At short periods \( S_a \) approaches peak ground acceleration; at long periods \( S_d \) approaches peak ground displacement; at intermediate periods \( S_v \) is roughly constant for broadband earthquakes. Smoothed design spectra in codes retain this three-branch shape and anchor the branches to the peak ground motions of the design earthquake.

<div class="remark">
<strong>Pseudo versus true.</strong> Pseudo-velocity and pseudo-acceleration differ from the true peak relative velocity and peak total acceleration by small amounts in the presence of damping. For typical structural damping the differences are negligible in the period range of interest and the pseudo quantities are used without apology.
</div>

# Chapter 7: Multi-Degree-of-Freedom Systems

Real structures have many masses and many modes. The matrix formulation is a natural extension of the scalar SDOF equation.

## 7.1 Equations of Motion in Matrix Form

For an N-degree-of-freedom system the equation of motion is

\[
\mathbf{M} \ddot{\mathbf{u}}(t) + \mathbf{C} \dot{\mathbf{u}}(t) + \mathbf{K} \mathbf{u}(t) = \mathbf{p}(t),
\]

where \( \mathbf{u} \) is the N-vector of generalized displacements, \( \mathbf{M} \), \( \mathbf{C} \), \( \mathbf{K} \) are the \( N \times N \) mass, damping, and stiffness matrices, and \( \mathbf{p}(t) \) is the N-vector of applied forces. Mass and stiffness matrices are symmetric and positive definite for unrestrained stable structures; the damping matrix is typically assembled by the prescriptions of section 7.4.

## 7.2 Shear-Building Idealization

For a planar frame with rigid floors and extensible-only columns, the stiffness matrix is tridiagonal. With story stiffnesses \( k_1, k_2, \ldots, k_N \) and lumped floor masses \( m_1, m_2, \ldots, m_N \),

\[
\mathbf{M} = \operatorname{diag}(m_1, m_2, \ldots, m_N),
\]

and the stiffness matrix has the pattern \( K_{ii} = k_i + k_{i+1} \), \( K_{i,i+1} = K_{i+1,i} = -k_{i+1} \), with \( k_{N+1} = 0 \). For non-shear buildings a lateral stiffness matrix is obtained by static condensation of rotational degrees of freedom at each floor, or directly by finite-element assembly.

## 7.3 Natural Frequencies and Mode Shapes

Seeking solutions of \( \mathbf{M} \ddot{\mathbf{u}} + \mathbf{K} \mathbf{u} = \mathbf{0} \) of the form \( \mathbf{u}(t) = \boldsymbol{\phi} \, q(t) \) with \( q(t) \) sinusoidal at frequency \( \omega \) yields the generalized eigenproblem

\[
\left( \mathbf{K} - \omega^2 \mathbf{M} \right) \boldsymbol{\phi} = \mathbf{0}.
\]

This has N eigenvalues \( \omega_n^2 \) with corresponding eigenvectors \( \boldsymbol{\phi}_n \), the natural frequencies and mode shapes. Numerical solution uses QR, Jacobi, or Lanczos algorithms for small systems and subspace iteration or block Lanczos for large finite-element models.

## 7.4 Orthogonality and Modal Analysis

The modes are orthogonal with respect to mass and stiffness:

\[
\boldsymbol{\phi}_m^{\mathsf{T}} \mathbf{M} \boldsymbol{\phi}_n = 0, \qquad \boldsymbol{\phi}_m^{\mathsf{T}} \mathbf{K} \boldsymbol{\phi}_n = 0, \qquad m \neq n.
\]

Normalizing so that \( \boldsymbol{\phi}_n^{\mathsf{T}} \mathbf{M} \boldsymbol{\phi}_n = 1 \) gives \( \boldsymbol{\phi}_n^{\mathsf{T}} \mathbf{K} \boldsymbol{\phi}_n = \omega_n^2 \). Expanding the displacement as \( \mathbf{u}(t) = \sum_n \boldsymbol{\phi}_n q_n(t) \) and using orthogonality decouples the equations of motion into N scalar SDOF equations in the modal coordinates \( q_n(t) \):

\[
\ddot{q}_n + 2 \zeta_n \omega_n \dot{q}_n + \omega_n^2 q_n = \boldsymbol{\phi}_n^{\mathsf{T}} \mathbf{p}(t).
\]

Each modal equation is solved by the SDOF techniques of chapters 4 and 5. Total response is the sum of modal contributions. Because earthquake ground motion excites the low-frequency modes preferentially, a small number of modes typically suffice.

<div class="theorem">
<strong>Modal decomposition.</strong> If the damping matrix \( \mathbf{C} \) is orthogonal with respect to the modes of the undamped system, the coupled MDOF equations of motion decouple, in modal coordinates, into a set of uncoupled SDOF equations, one per mode.
</div>

## 7.5 Classical Damping

Decoupling requires that \( \boldsymbol{\phi}_m^{\mathsf{T}} \mathbf{C} \boldsymbol{\phi}_n = 0 \) for \( m \neq n \). Rayleigh damping, the most common prescription, takes

\[
\mathbf{C} = \alpha \mathbf{M} + \beta \mathbf{K},
\]

which is automatically orthogonal. The coefficients \( \alpha \) and \( \beta \) are chosen to yield target damping ratios \( \zeta_i \) and \( \zeta_j \) at two specified frequencies \( \omega_i \) and \( \omega_j \):

\[
\zeta_n = \frac{1}{2}\!\left( \frac{\alpha}{\omega_n} + \beta \omega_n \right),
\]

so that \( \alpha \) primarily damps low-frequency modes and \( \beta \) primarily damps high-frequency modes. Caughey's extension includes higher powers of \( \mathbf{M}^{-1} \mathbf{K} \) to fit damping at more than two frequencies. When the physical damping is known to be non-classical, as in soil-structure interaction and base-isolated structures, a direct complex-eigenvalue analysis or direct integration is required.

# Chapter 8: Earthquake Response by Modal Superposition

For base excitation the equation of motion is

\[
\mathbf{M} \ddot{\mathbf{u}} + \mathbf{C} \dot{\mathbf{u}} + \mathbf{K} \mathbf{u} = -\mathbf{M} \boldsymbol{\iota} \ddot{u}_g(t),
\]

where \( \boldsymbol{\iota} \) is the influence vector whose entries are the displacements of the degrees of freedom under a unit rigid-body ground translation. Expanding \( \mathbf{u} = \sum_n \boldsymbol{\phi}_n q_n \) and using orthogonality,

\[
\ddot{q}_n + 2 \zeta_n \omega_n \dot{q}_n + \omega_n^2 q_n = -\Gamma_n \ddot{u}_g(t),
\]

where \( \Gamma_n = \boldsymbol{\phi}_n^{\mathsf{T}} \mathbf{M} \boldsymbol{\iota} / (\boldsymbol{\phi}_n^{\mathsf{T}} \mathbf{M} \boldsymbol{\phi}_n) \) is the modal participation factor. Each modal equation has the SDOF form of chapter 6 driven by \( \Gamma_n \ddot{u}_g(t) \).

## 8.1 Modal Peaks via the Response Spectrum

The peak modal displacement, peak modal pseudo-velocity, and peak modal pseudo-acceleration are read from the design response spectrum at \( (T_n, \zeta_n) \):

\[
q_{n,\max} = \Gamma_n S_d(T_n, \zeta_n).
\]

The peak modal displacement vector is \( \mathbf{u}_{n,\max} = \boldsymbol{\phi}_n q_{n,\max} \), and the peak modal equivalent static force at each degree of freedom is \( \mathbf{f}_{n,\max} = \mathbf{M} \boldsymbol{\phi}_n \Gamma_n S_a(T_n, \zeta_n) \). Story shears, base shear, overturning moment, and floor accelerations follow from static analysis under \( \mathbf{f}_{n,\max} \).

## 8.2 Modal Mass and Effective Mass

The effective modal mass

\[
M_n^* = \frac{\left( \boldsymbol{\phi}_n^{\mathsf{T}} \mathbf{M} \boldsymbol{\iota} \right)^2}{\boldsymbol{\phi}_n^{\mathsf{T}} \mathbf{M} \boldsymbol{\phi}_n}
\]

sums over all modes to the total translational mass, \( \sum_n M_n^* = \boldsymbol{\iota}^{\mathsf{T}} \mathbf{M} \boldsymbol{\iota} \). Building codes require that enough modes be included for the cumulative effective mass to reach 90 percent of the total, which for regular frames typically means 2 to 5 modes and for long-period, slender, or irregular structures may mean 10 or more.

## 8.3 Modal Combination: SRSS and CQC

Modal peaks occur at different instants and cannot simply be added. The square-root-of-sum-of-squares (SRSS) rule

\[
r_{\max} \approx \sqrt{\sum_n r_{n,\max}^2}
\]

is appropriate for systems with well-separated natural frequencies, where modal peaks are statistically independent. When two or more modes have close frequencies, their peaks are correlated and SRSS underestimates the response. The complete quadratic combination (CQC) rule

\[
r_{\max} \approx \sqrt{\sum_m \sum_n \rho_{mn} \, r_{m,\max} r_{n,\max}}
\]

uses cross-modal coefficients

\[
\rho_{mn} = \frac{8 \sqrt{\zeta_m \zeta_n} \, (\zeta_m + r \zeta_n) \, r^{3/2}}{(1 - r^2)^2 + 4 \zeta_m \zeta_n r (1 + r^2) + 4 (\zeta_m^2 + \zeta_n^2) r^2},
\]

with \( r = \omega_n / \omega_m \). CQC reduces to SRSS when frequencies are well separated and is mandatory for three-dimensional analyses where translational and torsional modes may be close in period.

<div class="example">
<strong>Three-story shear building.</strong> Consider a three-story frame with equal floor masses \( m \) and equal story stiffnesses \( k \). Nondimensionalizing by \( \omega_0^2 = k/m \), the natural frequencies are approximately \( \omega_1 \approx 0.445 \omega_0 \), \( \omega_2 \approx 1.247 \omega_0 \), \( \omega_3 \approx 1.802 \omega_0 \). The fundamental mode shape has positive components at every floor increasing with height; the second mode has a node near the middle floor; the third mode has two nodes. Participation factors decrease with mode number, and effective modal masses sum to \( 3m \) as required.
</div>

# Chapter 9: Direct Time Integration of MDOF Systems

When nonlinearity, non-classical damping, or pulse-type excitation prevents modal decomposition, the MDOF equations are integrated directly.

## 9.1 Central Difference (Explicit)

The central-difference scheme replaces \( \dot{\mathbf{u}} \) and \( \ddot{\mathbf{u}} \) by central-difference expressions in \( \mathbf{u} \) and solves a linear system at each step whose coefficient matrix is \( \mathbf{M} / (\Delta t)^2 + \mathbf{C} / (2 \Delta t) \). For a lumped (diagonal) mass and diagonal damping the solve is trivial, which makes explicit integration attractive for wave-propagation problems. Stability requires \( \Delta t \leq 2 / \omega_{\max} \), where \( \omega_{\max} \) is the highest frequency of the system. For finite-element models \( \omega_{\max} \) is controlled by element size, producing the familiar Courant–Friedrichs–Lewy condition.

## 9.2 Newmark-β (Implicit)

Newmark's method assembles the effective stiffness

\[
\tilde{\mathbf{K}} = \mathbf{K} + \frac{\gamma}{\beta \Delta t} \mathbf{C} + \frac{1}{\beta (\Delta t)^2} \mathbf{M}
\]

and the effective load vector at step \( i+1 \) from known quantities at step \( i \). Solving \( \tilde{\mathbf{K}} \mathbf{u}_{i+1} = \tilde{\mathbf{p}}_{i+1} \) gives the new displacements, from which the new velocities and accelerations follow algebraically. With \( \gamma = 1/2 \) and \( \beta = 1/4 \) (the average-acceleration method) the scheme is unconditionally stable and second-order accurate; with \( \gamma > 1/2 \) it introduces algorithmic damping useful for filtering spurious high-frequency content. Newton–Raphson iterations at each step accommodate nonlinear force–deformation relations.

## 9.3 Wilson-θ

The Wilson-θ method assumes linear acceleration over the extended interval \( \theta \Delta t \) and projects back. With \( \theta \geq 1.37 \) it is unconditionally stable; with \( \theta = 1 \) it reduces to linear acceleration and is conditionally stable. Its chief disadvantage is substantial period elongation and amplitude decay at high frequencies. Newmark average-acceleration is usually preferred today.

# Chapter 10: Continuous Systems

Distributed-mass, distributed-stiffness systems are governed by partial differential equations. Two canonical cases appear constantly in civil engineering.

## 10.1 Axial Vibration of a Uniform Rod

For a prismatic rod of length \( L \), mass per unit length \( \bar{m} \), and axial stiffness \( EA \), the axial displacement \( u(x,t) \) satisfies the one-dimensional wave equation

\[
\bar{m} \frac{\partial^2 u}{\partial t^2} = EA \frac{\partial^2 u}{\partial x^2}.
\]

Separation of variables \( u(x,t) = \phi(x) q(t) \) yields the wave speed \( c = \sqrt{EA/\bar{m}} \) and mode shapes that depend on boundary conditions. A rod fixed at \( x = 0 \) and free at \( x = L \) has natural frequencies

\[
\omega_n = \frac{(2 n - 1) \pi c}{2 L}, \qquad \phi_n(x) = \sin\!\left( \frac{(2 n - 1) \pi x}{2 L} \right), \quad n = 1, 2, \ldots
\]

## 10.2 Transverse Vibration of a Bernoulli–Euler Beam

For a prismatic beam with mass per unit length \( \bar{m} \) and flexural rigidity \( EI \), the transverse displacement \( v(x,t) \) satisfies

\[
\bar{m} \frac{\partial^2 v}{\partial t^2} + EI \frac{\partial^4 v}{\partial x^4} = 0.
\]

Mode shapes are sums of \( \sin \), \( \cos \), \( \sinh \), and \( \cosh \) functions whose coefficients are fixed by the four boundary conditions. For a simply supported beam the mode shapes are \( \phi_n(x) = \sin(n \pi x / L) \) and

\[
\omega_n = (n \pi)^2 \sqrt{\frac{EI}{\bar{m} L^4}}, \qquad n = 1, 2, \ldots
\]

A cantilever beam has the smallest nontrivial root \( (\beta_1 L) \approx 1.875 \), giving \( \omega_1 \approx (1.875)^2 \sqrt{EI / (\bar{m} L^4)} \). The beam equation neglects shear deformation and rotary inertia; Timoshenko theory retains both and is needed for deep beams and high modes.

<div class="remark">
<strong>From continuous to discrete.</strong> Finite-element discretization of a continuous system produces an MDOF algebraic system whose low modes approximate the low modes of the continuous system. Convergence is monotonic from above: a coarser mesh overpredicts natural frequencies, and refinement is necessary to capture higher modes accurately.
</div>

# Chapter 11: Seismic Analysis and Design of Frames

The methods of chapters 7 through 9 translate into design practice through code-prescribed procedures.

## 11.1 Equivalent Lateral Force Method

For regular buildings whose response is dominated by the fundamental mode, codes permit an equivalent lateral force procedure. The base shear is

\[
V = C_s W,
\]

where \( W \) is the seismic weight and \( C_s \) is a seismic response coefficient derived from the design response spectrum at the fundamental period, reduced by a force-modification factor \( R \) that accounts for ductility and overstrength. The base shear is distributed up the height in proportion to \( m_i h_i^k \), with \( k \) increasing from 1 at short periods to 2 at long periods to approximate the higher-mode contribution to story shears.

## 11.2 Modal Response Spectrum Analysis

For taller, slender, or irregular buildings, codes require modal response spectrum analysis. Enough modes are included to capture 90 percent of effective modal mass in each principal direction, modal peaks are read from the design spectrum, responses are combined by SRSS or CQC, and directional combinations follow the 30 percent or 40 percent rules. Accidental torsion is added by offsetting the center of mass by 5 percent of the plan dimension.

## 11.3 Time-History Analysis

Nonlinear response-history analysis uses at least seven pairs of ground motion records matched or scaled to the design spectrum. Demands are averaged across records when seven or more are used. Material and geometric nonlinearities are modeled through fiber-section elements, plastic-hinge elements, or distributed plasticity. This method is mandatory for base-isolated buildings, for buildings with supplemental energy dissipation devices, and for performance-based assessment of existing structures.

## 11.4 Capacity Design and Ductile Detailing

Capacity design chooses a ductile mechanism (beam hinging in moment frames, flexural hinging at wall bases in structural walls) and protects non-ductile elements (columns in strong-column/weak-beam frames, shear in walls) by designing them for forces consistent with the overstrength of the yielding elements. Detailing for ductility in reinforced concrete requires closely spaced transverse reinforcement over plastic-hinge lengths, restrictions on reinforcement ratios, and specific splicing provisions; in steel frames it requires prequalified connection geometries and protected zones near plastic hinges.

# Chapter 12: Base Isolation and Supplemental Damping

Two families of supplemental protection devices extend conventional dynamics principles to dramatic effect.

## 12.1 Base Isolation

A base-isolated building is separated from its foundation by flexible bearings (laminated rubber or sliding friction pendulum) that lengthen the fundamental period well past the peak of the response spectrum. The superstructure moves almost rigidly above the isolator, so inter-story drifts and floor accelerations are sharply reduced. A two-degree-of-freedom model captures the essentials: a rigid superstructure of mass \( m_s \) above an isolator of mass \( m_b \), stiffness \( k_b \), and damping \( c_b \). The isolated fundamental period \( T_b = 2 \pi \sqrt{(m_s + m_b)/k_b} \) is typically 2.5 to 4 seconds, placing the system in the long-period, small-\( S_a \) region of the spectrum. Nonlinear time-history analysis is required because bearings exhibit hysteresis and the displacement demands are large.

## 12.2 Tuned Mass Dampers

A tuned mass damper (TMD) is a secondary mass–spring–dashpot system attached to the primary structure and tuned so that its natural frequency approximately equals the frequency of the mode being suppressed. When the primary structure vibrates, the TMD oscillates out of phase and dissipates energy through its dashpot. Den Hartog's optimal tuning for an undamped primary structure of mass \( M \) and a TMD of mass \( m \), with mass ratio \( \mu = m/M \), is

\[
\frac{\omega_{TMD}}{\omega_n} = \frac{1}{1 + \mu}, \qquad \zeta_{TMD,\text{opt}} = \sqrt{\frac{3 \mu}{8 (1 + \mu)^3}}.
\]

Typical mass ratios of 1 to 5 percent suffice to cut resonant response by 30 to 60 percent. TMDs are widely used on tall buildings to control wind-induced sway and on footbridges to control pedestrian-induced vibration; their effectiveness for broadband earthquake excitation is more modest because only a single mode is tuned.

<div class="definition">
<strong>Tuned mass damper.</strong> A tuned mass damper is an auxiliary mass–spring–dashpot subsystem attached to a primary structure, whose natural frequency is tuned to a target mode and whose dashpot dissipates energy extracted from that mode through out-of-phase oscillation.
</div>

## 12.3 Supplemental Dampers

Fluid viscous, viscoelastic, friction, and metallic-yielding dampers add energy dissipation directly to the primary structure, without detuning. Fluid viscous dampers are nearly velocity-proportional and act essentially as added \( c \) at the discrete locations where they are installed. Metallic-yielding dampers (buckling-restrained braces, added-damping-and-stiffness devices) dissipate energy through stable hysteretic yielding. Friction dampers dissipate through sliding. All raise the effective damping ratio of the modes they engage, reducing \( S_a \) in the damping-controlled region of the response spectrum.

# Chapter 13: Worked Synthesis

The preceding chapters contain a small number of central ideas applied at increasing levels of structural complexity. Every analysis, no matter how elaborate, can be traced back to four steps.

The first step is modeling: choosing masses, stiffnesses, and damping from the physical structure. Lumped-mass models suffice for most buildings; consistent mass matrices are preferred for plates, shells, and slender members whose rotational inertia matters. Stiffness is derived from member cross-sections and connectivity, with rigid diaphragm constraints condensing rotational degrees of freedom at floors. Damping is prescribed, not computed: 2 percent for welded steel, 5 percent for reinforced concrete, 10 percent for structures near yield.

The second step is eigen-analysis: computing natural frequencies and mode shapes. A modal truncation large enough to capture 90 percent of effective mass is standard.

The third step is response: either a response-spectrum analysis that produces peak modal quantities combined by SRSS or CQC, or a time-history analysis that tracks displacement, velocity, acceleration, and internal forces through the excitation. The response-spectrum analysis is faster and sufficient for linear-elastic design; the time-history analysis is essential when nonlinearity or non-classical damping is significant.

The fourth step is design verification: comparing demands against capacities with capacity-design principles, checking drifts, accelerations, and stability, and confirming that detailing supports the assumed ductility. Each step feeds back into the others when demands or deformations are unacceptable, which is why dynamic design is inherently iterative.

<div class="theorem">
<strong>Principle of dynamic analysis.</strong> Under the idealizations of linearity, time-invariance, and classical damping, the response of an arbitrary multi-degree-of-freedom structure to an arbitrary time-varying excitation can be obtained by superposing the responses of a finite set of single-degree-of-freedom oscillators, one per mode, each driven by the projection of the excitation onto that mode.
</div>

The contents of these thirteen chapters, mastered together, allow the engineer to answer the three questions that structural dynamics poses: how does the structure move, how large are the internal forces, and how much energy is being dissipated. The answers inform the safe and economical design of structures for every time-varying load that civil engineering practice encounters.
