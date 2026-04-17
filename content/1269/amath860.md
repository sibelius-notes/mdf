---
title: "AMATH 860: Kinetic Theory and Transport Equations"
subjects: "AMATH"
---

*These notes synthesize material from C. Cercignani, R. Illner, and M. Pulvirenti's The Mathematical Theory of Dilute Gases, C. Villani's A Review of Mathematical Topics in Collisional Kinetic Theory, L. Saint-Raymond's Hydrodynamic Limits of the Boltzmann Equation, P.-L. Lions's work on compactness in Boltzmann's equation (DiPerna-Lions theory), and Cambridge Part III Kinetic Theory notes (D. Tong) and Princeton Plasma Physics materials.*

---

## Chapter 1: From Particles to Distribution Functions

### 1.1 The N-Body Problem and Phase Space

Kinetic theory begins with a fundamental tension: the microscopic world consists of vast numbers of particles obeying deterministic laws, yet we observe macroscopic behavior that appears smooth and governed by partial differential equations. The passage from the discrete to the continuous, from Newton's laws for \(N \sim 10^{23}\) particles to a single equation for a distribution function, is the central intellectual achievement of the subject. This chapter traces that passage rigorously, culminating in the derivation of the Boltzmann equation.

Consider a system of \(N\) identical point particles in \(\mathbb{R}^3\), each with mass \(m\). The state of the system at time \(t\) is specified by the positions \(q_1, \ldots, q_N \in \mathbb{R}^3\) and momenta \(p_1, \ldots, p_N \in \mathbb{R}^3\) of all particles. The full state thus lives in a \(6N\)-dimensional space.

<div class="definition">
<strong>Definition 1.1 (Phase Space).</strong> The <em>phase space</em> of an \(N\)-particle system is the space \(\Gamma_N = (\mathbb{R}^3 \times \mathbb{R}^3)^N\), whose points \(Z_N = (q_1, p_1, \ldots, q_N, p_N)\) specify the complete microscopic state. The single-particle <em>phase space</em> is \(\mu = \mathbb{R}^3_x \times \mathbb{R}^3_v\), where \(x\) denotes position and \(v\) velocity.
</div>

The particles interact through a pair potential \(\Phi: \mathbb{R}^3 \to \mathbb{R}\). The Hamiltonian of the system is

\[
H_N(Z_N) = \sum_{i=1}^N \frac{|p_i|^2}{2m} + \sum_{1 \le i < j \le N} \Phi(q_i - q_j).
\]
Hamilton's equations of motion then read

\[
\dot{q}_i = \frac{\partial H_N}{\partial p_i} = \frac{p_i}{m}, \qquad \dot{p}_i = -\frac{\partial H_N}{\partial q_i} = -\sum_{j \ne i} \nabla \Phi(q_i - q_j).
\]
These \(6N\) ordinary differential equations define the flow \(\Phi^t: \Gamma_N \to \Gamma_N\), which maps the initial state \(Z_N(0)\) to the state \(Z_N(t)\). For smooth potentials with at most polynomial growth, standard ODE theory guarantees the existence and uniqueness of the flow for all time.

Since we can never know the exact initial conditions for \(10^{23}\) particles, we adopt a statistical description. Rather than tracking a single trajectory in \(\Gamma_N\), we introduce a probability density on phase space.

<div class="definition">
<strong>Definition 1.2 (N-Particle Distribution Function).</strong> The <em>\(N\)-particle distribution function</em> is a non-negative function \(F_N: \Gamma_N \times \mathbb{R} \to \mathbb{R}_{\ge 0}\) such that \(F_N(Z_N, t) \, dZ_N\) gives the probability of finding the system in the phase-space volume element \(dZ_N\) at time \(t\). It is normalized so that \(\int_{\Gamma_N} F_N \, dZ_N = 1\).
</div>

### 1.2 The Liouville Equation

The evolution of \(F_N\) is governed by the requirement that probability is conserved along the Hamiltonian flow. Since the flow is volume-preserving (a consequence of the symplectic structure), the density along a trajectory is constant.

<div class="theorem">
<strong>Theorem 1.3 (Liouville's Theorem).</strong> Let \(F_N(Z_N, t)\) be the \(N\)-particle distribution function evolving under the Hamiltonian flow. Then \(F_N\) satisfies

\[
\frac{\partial F_N}{\partial t} + \{F_N, H_N\} = 0,
\]
where \(\{F_N, H_N\} = \sum_{i=1}^N \left(\frac{\partial F_N}{\partial q_i} \cdot \frac{\partial H_N}{\partial p_i} - \frac{\partial F_N}{\partial p_i} \cdot \frac{\partial H_N}{\partial q_i}\right)\) is the Poisson bracket. Equivalently,

\[
\frac{\partial F_N}{\partial t} + \sum_{i=1}^N \frac{p_i}{m} \cdot \nabla_{q_i} F_N - \sum_{i=1}^N \sum_{j \ne i} \nabla \Phi(q_i - q_j) \cdot \nabla_{p_i} F_N = 0.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Let \(Z_N(t)\) be a trajectory of the Hamiltonian system. Define \(g(t) = F_N(Z_N(t), t)\). Then

\[
\frac{dg}{dt} = \frac{\partial F_N}{\partial t} + \sum_{i=1}^N \left(\dot{q}_i \cdot \nabla_{q_i} F_N + \dot{p}_i \cdot \nabla_{p_i} F_N\right) = \frac{\partial F_N}{\partial t} + \{F_N, H_N\}.
\]
Conservation of probability means that the measure \(F_N \, dZ_N\) is invariant under the flow. By Liouville's theorem from Hamiltonian mechanics, the phase-space volume element \(dZ_N\) is itself preserved (since \(\mathrm{div}_{Z_N}(\dot{Z}_N) = 0\) by the antisymmetry of Hamilton's equations). Therefore \(\frac{dg}{dt} = 0\), which gives the Liouville equation. \(\square\)
</div>

The Liouville equation is exact but utterly impractical: it is a linear PDE in \(6N + 1\) variables. The challenge of kinetic theory is to extract useful information from it by a systematic reduction of dimensionality.

### 1.3 The BBGKY Hierarchy

The key idea for reducing the Liouville equation is to integrate out most of the particle variables, producing equations for reduced distribution functions. This was developed independently by Bogoliubov, Born, Green, Kirkwood, and Yvon.

<div class="definition">
<strong>Definition 1.4 (Marginal Distributions).</strong> The <em>\(s\)-particle marginal distribution</em> (\(1 \le s \le N\)) is defined by

\[
f_N^{(s)}(z_1, \ldots, z_s, t) = \frac{N!}{(N-s)!} \int_{\Gamma_{N-s}} F_N(z_1, \ldots, z_s, z_{s+1}, \ldots, z_N, t) \, dz_{s+1} \cdots dz_N,
\]
where \(z_i = (q_i, p_i)\) and the combinatorial prefactor accounts for the indistinguishability of particles.
</div>

The factor \(N!/(N-s)!\) ensures that \(f_N^{(s)}\) counts ordered \(s\)-tuples of distinct particles. In the physically most important case \(s=1\), the one-particle marginal \(f_N^{(1)}(x, v, t)\) gives the expected number density of particles at phase-space point \((x,v)\) at time \(t\), normalized so that \(\int f_N^{(1)} \, dx \, dv = N\).

Integrating the Liouville equation over the variables \(z_{s+1}, \ldots, z_N\), one obtains the BBGKY hierarchy: a chain of coupled equations where the equation for \(f_N^{(s)}\) involves \(f_N^{(s+1)}\).

<div class="theorem">
<strong>Theorem 1.5 (BBGKY Hierarchy).</strong> The marginal distributions satisfy, for \(1 \le s \le N-1\),

\[
\frac{\partial f_N^{(s)}}{\partial t} + \sum_{i=1}^s \frac{p_i}{m} \cdot \nabla_{q_i} f_N^{(s)} - \sum_{1 \le i < j \le s} \left(\nabla \Phi(q_i - q_j) \cdot (\nabla_{p_i} - \nabla_{p_j})\right) f_N^{(s)} = (N - s) \sum_{i=1}^s \int \nabla \Phi(q_i - q_{s+1}) \cdot \nabla_{p_i} f_N^{(s+1)} \, dz_{s+1}.
\]
</div>

The left side describes the free streaming and mutual interactions of the \(s\) particles we track; the right side is the collision term coupling \(f_N^{(s)}\) to \(f_N^{(s+1)}\). The hierarchy is not closed: each equation involves the next marginal. To close it, we need an approximation, and this is where the Boltzmann-Grad limit enters.

### 1.4 The Boltzmann-Grad Limit

The passage from the BBGKY hierarchy to the Boltzmann equation requires a specific scaling limit in which the number of particles \(N \to \infty\) while the interaction range shrinks, in such a way that the mean free path remains of order one.

<div class="definition">
<strong>Definition 1.6 (Boltzmann-Grad Scaling).</strong> For particles interacting via a hard-sphere potential of diameter \(\varepsilon > 0\), the <em>Boltzmann-Grad limit</em> is the regime

\[
N \to \infty, \quad \varepsilon \to 0, \quad N \varepsilon^{d-1} = \ell^{-1} = \text{const},
\]
where \(d\) is the spatial dimension and \(\ell\) is the mean free path. In three dimensions, this is \(N\varepsilon^2 \to \text{const}\).
</div>

The physical content of this scaling is clear: the total scattering cross-section presented by all the other particles to a given tagged particle remains finite. Each particle undergoes \(O(1)\) collisions per unit time, and the collisions are binary (simultaneous three-body collisions have vanishing probability).

<div class="remark">
<strong>Remark 1.7.</strong> The Boltzmann-Grad limit is not a low-density limit in the usual physical sense (the density \(N/V\) can remain fixed or even grow). Rather, it is a limit in which the ratio of the particle diameter to the mean interparticle spacing tends to zero, so that the gas becomes dilute in the sense relevant for kinetic theory.
</div>

### 1.5 Molecular Chaos and the Stosszahlansatz

The crucial hypothesis that allows the closure of the hierarchy is Boltzmann's assumption of molecular chaos.

<div class="definition">
<strong>Definition 1.8 (Molecular Chaos / Stosszahlansatz).</strong> The \(N\)-particle system is said to be in a state of <em>molecular chaos</em> (German: Stosszahlansatz) if the two-particle marginal factorizes as a product of one-particle marginals:

\[
f_N^{(2)}(x_1, v_1, x_2, v_2, t) \approx f_N^{(1)}(x_1, v_1, t) \, f_N^{(1)}(x_2, v_2, t)
\]
for \(|x_1 - x_2| > \varepsilon\), and more generally \(f_N^{(s)} \approx \prod_{i=1}^s f_N^{(1)}(x_i, v_i, t)\) for well-separated configurations.
</div>

The factorization asserts that two particles about to collide have statistically independent velocities. This is plausible before a first collision but is destroyed by the collision itself: after two particles interact, their velocities become correlated. Boltzmann's deep insight was that in the Boltzmann-Grad limit, the probability of re-encountering the same particle is negligible, so that the pre-collisional independence is effectively maintained for all time. Making this rigorous is extremely difficult.

<div class="theorem">
<strong>Theorem 1.9 (Lanford, 1975).</strong> Consider \(N\) hard spheres of diameter \(\varepsilon\) in \(\mathbb{R}^3\) (or the torus \(\mathbb{T}^3\)) with initial data satisfying molecular chaos. In the Boltzmann-Grad limit \(N \to \infty\), \(N\varepsilon^2 \to \ell^{-1}\), the one-particle marginal \(f_N^{(1)}\) converges to the solution \(f\) of the Boltzmann equation, for a short time \(t < t^* \approx \frac{1}{5}\ell/\bar{v}\), where \(\bar{v}\) is a typical velocity.
</div>

Lanford's theorem is a landmark result, but the time restriction to roughly one-fifth of a mean free time is a serious limitation. Extending this to global-in-time convergence remains one of the great open problems in mathematical kinetic theory. The short-time restriction arises because the proof uses a convergent series expansion (the Duhamel series, or iterated collision series), whose radius of convergence is bounded by the inverse of the collision frequency. For longer times, recollisions and memory effects make the analysis enormously more difficult.

<div class="example">
<strong>Example 1.10.</strong> To see the Boltzmann-Grad scaling concretely, consider \(N = 10^{20}\) hard spheres of diameter \(\varepsilon = 10^{-8}\) cm in a box of volume \(V = 1\) cm\(^3\). The number density is \(n = N/V = 10^{20}\) cm\(^{-3}\), and the mean free path is \(\ell = 1/(n\pi\varepsilon^2) \approx 1/(10^{20} \cdot 3 \cdot 10^{-16}) \approx 3 \times 10^{-5}\) cm. The product \(N\varepsilon^2 = 10^{20} \cdot 10^{-16} = 10^4\), which is proportional to \(\ell^{-1}\). These are roughly the parameters for air at standard conditions, confirming that the Boltzmann-Grad scaling captures the physically relevant regime.
</div>

### 1.6 Derivation of the Boltzmann Equation

Applying the molecular chaos assumption to the first equation of the BBGKY hierarchy, and taking the Boltzmann-Grad limit, one arrives at a closed equation for the one-particle distribution function \(f(x, v, t)\). The interaction between pairs of particles is encoded in the collision geometry: two particles with velocities \(v\) and \(v_*\) collide, producing post-collisional velocities \(v'\) and \(v_*'\) determined by conservation of momentum and energy together with the scattering angle.

For elastic hard-sphere collisions, the post-collisional velocities are

\[
v' = v - ((v - v_*) \cdot \omega)\,\omega, \qquad v_*' = v_* + ((v - v_*) \cdot \omega)\,\omega,
\]
where \(\omega \in S^2\) is the unit vector along the line of centers at the moment of impact. One can verify directly that \(v' + v_*' = v + v_*\) (conservation of momentum) and \(|v'|^2 + |v_*'|^2 = |v|^2 + |v_*|^2\) (conservation of energy).

<div class="theorem">
<strong>Theorem 1.10 (Boltzmann Equation).</strong> Under the Boltzmann-Grad limit with molecular chaos, the one-particle distribution function \(f(x, v, t) \ge 0\) satisfies the <em>Boltzmann equation</em>

\[
\frac{\partial f}{\partial t} + v \cdot \nabla_x f = Q(f, f),
\]
where the collision operator \(Q(f,f)\) is defined in Chapter 2.
</div>

The left-hand side describes free streaming: in the absence of collisions, particles travel in straight lines at constant velocity. The right-hand side, the collision operator, encodes the effect of binary collisions and is a nonlinear, nonlocal integral operator in velocity space. Its detailed structure is the subject of the next chapter.

<div class="remark">
<strong>Remark 1.11.</strong> The derivation sketched above is formal: it requires the molecular chaos assumption as input, and Lanford's theorem provides a rigorous justification only for short times. The program of deriving the Boltzmann equation rigorously from particle systems remains active. Notable advances include the work of Gallagher, Saint-Raymond, and Texier (2013) on the Boltzmann-Grad limit for short-range potentials, and the very recent breakthrough of Deng and Hani (2024) on the derivation of kinetic wave equations. Each advance illuminates the delicate interplay between deterministic dynamics, statistical assumptions, and the emergence of irreversibility.
</div>

## Chapter 2: The Boltzmann Equation

### 2.1 The Collision Operator

The heart of the Boltzmann equation is the collision operator \(Q(f,f)\), a bilinear operator acting on functions of velocity. It accounts for the change in the distribution function due to binary collisions.

<div class="definition">
<strong>Definition 2.1 (Boltzmann Collision Operator).</strong> The <em>Boltzmann collision operator</em> is defined by

\[
Q(f,f)(v) = \int_{\mathbb{R}^3} \int_{S^2} B(|v - v_*|, \cos\theta) \left[f(v')f(v_*') - f(v)f(v_*)\right] d\omega \, dv_*,
\]
where \(\cos\theta = \frac{(v - v_*) \cdot \omega}{|v - v_*|}\), the post-collisional velocities \(v'\) and \(v_*'\) are given by

\[
v' = \frac{v + v_*}{2} + \frac{|v - v_*|}{2}\omega, \qquad v_*' = \frac{v + v_*}{2} - \frac{|v - v_*|}{2}\omega,
\]
and \(B(|v - v_*|, \cos\theta) \ge 0\) is the <em>collision kernel</em> (or collision cross-section), determined by the interaction potential.
</div>

The collision operator has a natural decomposition \(Q(f,f) = Q^+(f,f) - Q^-(f,f)\), where the gain term \(Q^+\) accounts for particles scattered into velocity \(v\) and the loss term \(Q^-\) accounts for particles scattered out of velocity \(v\). Explicitly,

\[
Q^+(f,f)(v) = \int_{\mathbb{R}^3} \int_{S^2} B \, f(v') f(v_*') \, d\omega \, dv_*, \qquad Q^-(f,f)(v) = f(v) \int_{\mathbb{R}^3} \int_{S^2} B \, f(v_*) \, d\omega \, dv_*.
\]
The loss term is often written as \(Q^-(f,f)(v) = f(v) \, L(f)(v)\), where \(L(f)\) is the collision frequency.

<div class="definition">
<strong>Definition 2.2 (Collision Kernel).</strong> The <em>collision kernel</em> \(B(|v - v_*|, \cos\theta)\) depends on the intermolecular potential. For <em>hard spheres</em> of diameter \(\sigma\), \(B = \sigma^2 |v - v_*|\). For <em>inverse-power-law potentials</em> \(\Phi(r) = r^{-(p-1)}\), the kernel takes the form \(B(|v - v_*|, \cos\theta) = |v - v_*|^\gamma b(\cos\theta)\), where \(\gamma = (p - 5)/(p - 1)\). The case \(p = 5\) gives <em>Maxwell molecules</em> with \(\gamma = 0\), so the kernel depends only on the angle.
</div>

The classification of collision kernels by the exponent \(\gamma\) is physically important. Hard potentials have \(\gamma > 0\): faster relative velocities produce more collisions, as is the case for hard spheres (\(\gamma = 1\)). Soft potentials have \(\gamma < 0\): slower particles interact more strongly. Maxwell molecules (\(\gamma = 0\)) occupy a special intermediate position and often permit explicit calculations.

<div class="example">
<strong>Example 2.3a.</strong> For the Coulomb interaction \(\Phi(r) = e^2/(4\pi\varepsilon_0 r)\), the formal inverse-power exponent is \(p = 2\), giving \(\gamma = -3\) in three dimensions. However, the Coulomb cross-section diverges logarithmically due to grazing collisions, and the Boltzmann collision operator must be replaced by the Landau (or Fokker-Planck-Landau) collision operator, which arises as the grazing collision limit of the Boltzmann operator. The Landau operator reads

\[
Q_L(f,f)(v) = \nabla_v \cdot \int_{\mathbb{R}^3} \Psi(v - v_*)\left[f(v_*)\nabla_v f(v) - f(v)\nabla_{v_*}f(v_*)\right] dv_*,
\]
where \(\Psi(z) = |z|^{\gamma+2}\left(\mathbf{I} - \frac{z \otimes z}{|z|^2}\right)\) is the matrix-valued kernel. For Coulomb interactions, \(\gamma + 2 = -1\) and the logarithmic divergence is cut off by the Debye length, producing the Coulomb logarithm \(\log \Lambda\).
</div>

<div class="remark">
<strong>Remark 2.3.</strong> The angular part \(b(\cos\theta)\) of the kernel for inverse-power-law potentials typically has a non-integrable singularity as \(\theta \to 0\) (grazing collisions). This singularity is physically significant and gives rise to the regularizing effects of the Boltzmann operator (analogous to diffusion). The artificial practice of removing it by imposing Grad's angular cutoff \(\int_0^\pi b(\cos\theta) \sin\theta \, d\theta < \infty\) simplifies the theory but sacrifices important physics.
</div>

### 2.2 Conservation Laws and Collision Invariants

The collision operator satisfies fundamental conservation properties that reflect the physics of elastic binary collisions.

<div class="definition">
<strong>Definition 2.4 (Collision Invariant).</strong> A measurable function \(\psi: \mathbb{R}^3 \to \mathbb{R}\) is a <em>collision invariant</em> if

\[
\psi(v') + \psi(v_*') = \psi(v) + \psi(v_*)
\]
for all \(v, v_* \in \mathbb{R}^3\) and all \(\omega \in S^2\).
</div>

The functional equation in Definition 2.4 states that the total value of \(\psi\) is conserved in each binary collision. By a classical result, the space of collision invariants is five-dimensional.

<div class="theorem">
<strong>Theorem 2.5 (Classification of Collision Invariants).</strong> Under mild regularity assumptions, the collision invariants are precisely the functions of the form

\[
\psi(v) = a + b \cdot v + c|v|^2,
\]
where \(a, c \in \mathbb{R}\) and \(b \in \mathbb{R}^3\). These correspond to conservation of mass (\(\psi = 1\)), momentum (\(\psi = v_i\), \(i = 1,2,3\)), and kinetic energy (\(\psi = |v|^2/2\)).
</div>

<div class="proof">
<strong>Proof.</strong> The condition \(\psi(v') + \psi(v_*') = \psi(v) + \psi(v_*)\) for all \(\omega \in S^2\) implies, by choosing particular collision geometries, that \(\psi\) satisfies the Cauchy functional equation on certain affine subspaces. Under measurability (or local integrability), the only solutions are affine functions of \(v\) and \(|v|^2\). The detailed argument can be found in Cercignani, Chapter 3. \(\square\)
</div>

The conservation laws follow immediately: multiplying the Boltzmann equation by a collision invariant \(\psi(v)\) and integrating over velocity, the collision term vanishes.

<div class="theorem">
<strong>Theorem 2.6 (Conservation Laws).</strong> Let \(f\) be a sufficiently regular solution of the Boltzmann equation. Define the macroscopic fields

\[
\rho = \int f \, dv, \quad \rho u = \int v f \, dv, \quad \frac{3}{2}\rho T + \frac{1}{2}\rho|u|^2 = \frac{1}{2}\int |v|^2 f \, dv,
\]
where \(\rho\) is the mass density, \(u\) the bulk velocity, and \(T\) the temperature (in units where Boltzmann's constant \(k_B = 1\)). Then these fields satisfy the local conservation laws:

\[
\frac{\partial \rho}{\partial t} + \nabla_x \cdot (\rho u) = 0, \qquad \frac{\partial (\rho u)}{\partial t} + \nabla_x \cdot \left(\int v \otimes v \, f \, dv\right) = 0,
\]

\[
\frac{\partial}{\partial t}\left(\frac{1}{2}\int |v|^2 f \, dv\right) + \nabla_x \cdot \left(\frac{1}{2}\int |v|^2 v \, f \, dv\right) = 0.
\]
</div>

These are the equations of compressible fluid dynamics, but they are not closed: the momentum flux involves the full distribution function, not just \(\rho\), \(u\), and \(T\). The closure problem, addressed in Chapters 4 and 6, is one of the central themes of kinetic theory.

<div class="example">
<strong>Example 2.6a.</strong> To see the closure problem concretely, write the momentum flux as \(\int v_i v_j f \, dv = \rho u_i u_j + P_{ij}\), where \(P_{ij} = \int (v_i - u_i)(v_j - u_j) f \, dv\) is the pressure tensor. For a Maxwellian, \(P_{ij} = \rho T \delta_{ij}\) (isotropic pressure), and the momentum equation becomes the Euler equation. For a general \(f\), \(P_{ij}\) has off-diagonal (shear stress) and anisotropic normal components that depend on the details of \(f\). Similarly, the energy equation involves the third moment (heat flux vector \(q_i = \frac{1}{2}\int |v - u|^2(v_i - u_i)f \, dv\)), which is zero for a Maxwellian but nonzero in general.
</div>

### 2.3 The H-Theorem and Irreversibility

Boltzmann's H-theorem is the kinetic-theory avatar of the second law of thermodynamics. It shows that the Boltzmann equation has a built-in arrow of time, despite being derived from time-reversible microscopic dynamics.

<div class="definition">
<strong>Definition 2.7 (Boltzmann H-Functional).</strong> The <em>Boltzmann H-functional</em> (or negative of the kinetic entropy) for a spatially homogeneous distribution is

\[
H(f) = \int_{\mathbb{R}^3} f(v) \log f(v) \, dv.
\]
For the spatially inhomogeneous case on a domain \(\Omega \subseteq \mathbb{R}^3\),

\[
H(f) = \int_\Omega \int_{\mathbb{R}^3} f(x, v, t) \log f(x, v, t) \, dv \, dx.
\]
</div>

The functional \(H(f)\) is the negative of the physical entropy. Boltzmann showed that it is monotonically non-increasing along solutions, which means the entropy is non-decreasing.

<div class="theorem">
<strong>Theorem 2.8 (Boltzmann's H-Theorem, 1872).</strong> Let \(f(v,t)\) be a sufficiently regular solution of the spatially homogeneous Boltzmann equation \(\partial_t f = Q(f,f)\). Then

\[
\frac{dH}{dt} = \int_{\mathbb{R}^3} Q(f,f) \log f \, dv = -D(f) \le 0,
\]
where the entropy production (or dissipation) functional is

\[
D(f) = \frac{1}{4} \int_{\mathbb{R}^3} \int_{\mathbb{R}^3} \int_{S^2} B(|v - v_*|, \cos\theta)\left(f'f_*' - ff_*\right)\log\frac{f'f_*'}{ff_*} \, d\omega \, dv_* \, dv \ge 0,
\]
using the shorthand \(f = f(v)\), \(f_* = f(v_*)\), \(f' = f(v')\), \(f_*' = f(v_*')\). Moreover, \(D(f) = 0\) if and only if \(f\) is a Maxwellian.
</div>

<div class="proof">
<strong>Proof.</strong> Multiply the Boltzmann equation by \((\log f + 1)\) and integrate over \(v\). For the collision term, use the symmetry properties of the collision operator. The key identity is that for any test function \(\psi(v)\),

\[
\int Q(f,f)\psi \, dv = \frac{1}{4}\int\!\!\int\!\!\int B(f'f_*' - ff_*)\left(\psi + \psi_* - \psi' - \psi_*'\right) d\omega \, dv_* \, dv.
\]
With \(\psi = \log f\), this gives

\[
\frac{dH}{dt} = \frac{1}{4}\int\!\!\int\!\!\int B(f'f_*' - ff_*)\log\frac{ff_*}{f'f_*'} \, d\omega \, dv_* \, dv.
\]
Since \((a - b)\log(b/a) \le 0\) for all \(a, b > 0\) (with equality if and only if \(a = b\)), each integrand is non-positive, hence \(dH/dt \le 0\). Equality holds everywhere if and only if \(f'f_*' = ff_*\) for a.e. collisions, which implies \(\log f\) is a collision invariant, hence \(f\) is Maxwellian by Theorem 2.5. \(\square\)
</div>

The H-theorem raises a deep conceptual issue known as Loschmidt's reversibility paradox: the microscopic dynamics is time-reversible, yet the Boltzmann equation exhibits irreversibility. The resolution lies in the molecular chaos assumption, which introduces a time-asymmetry by requiring pre-collisional independence. Post-collisional velocities are correlated, so molecular chaos is not time-symmetric. The entropy increase is not a consequence of the dynamics alone but of the dynamics combined with the statistical assumption.

A related objection, due to Zermelo, invokes Poincare's recurrence theorem: any bounded Hamiltonian system returns arbitrarily close to its initial state. The resolution is that the recurrence time for a macroscopic system scales as \(e^{cN}\) for some \(c > 0\), which for \(N \sim 10^{23}\) is vastly larger than the age of the universe. The Boltzmann equation, which is valid in the Boltzmann-Grad limit (\(N \to \infty\)), simply does not see these recurrences. Both the Loschmidt and Zermelo objections thus dissolve in the proper understanding of the limit in which the Boltzmann equation holds.

### 2.4 Maxwellian Equilibria

The H-theorem identifies the equilibrium distributions: they are precisely the states at which entropy production vanishes.

<div class="definition">
<strong>Definition 2.9 (Maxwellian Distribution).</strong> A <em>Maxwellian</em> (or Maxwell-Boltzmann distribution) is a distribution of the form

\[
\mathcal{M}_{\rho, u, T}(v) = \frac{\rho}{(2\pi T)^{3/2}} \exp\left(-\frac{|v - u|^2}{2T}\right),
\]
where \(\rho > 0\) is the density, \(u \in \mathbb{R}^3\) is the mean velocity, and \(T > 0\) is the temperature.
</div>

The Maxwellian is the unique distribution that maximizes the entropy \(-H(f)\) subject to the constraints of fixed mass, momentum, and energy. It is the kinetic analogue of the microcanonical or canonical ensemble in statistical mechanics.

<div class="theorem">
<strong>Theorem 2.10 (Entropy Maximization).</strong> Among all non-negative functions \(f \in L^1(\mathbb{R}^3)\) with \(f \log f \in L^1(\mathbb{R}^3)\) and prescribed mass \(\int f \, dv = \rho\), momentum \(\int v f \, dv = \rho u\), and energy \(\frac{1}{2}\int |v|^2 f \, dv = E\), the functional \(-H(f) = -\int f \log f \, dv\) is uniquely maximized by the Maxwellian \(\mathcal{M}_{\rho, u, T}\) with \(T = \frac{2}{3\rho}(E - \frac{1}{2}\rho|u|^2)\).
</div>

<div class="proof">
<strong>Proof.</strong> This is a constrained optimization problem. The Lagrangian is

\[
\mathcal{L}[f] = -\int f \log f \, dv - \lambda_0 \int f \, dv - \lambda \cdot \int v f \, dv - \lambda_4 \int \tfrac{1}{2}|v|^2 f \, dv.
\]
Setting the functional derivative to zero: \(-\log f - 1 - \lambda_0 - \lambda \cdot v - \lambda_4 \frac{|v|^2}{2} = 0\), which gives \(f = \exp(-1 - \lambda_0 - \lambda \cdot v - \lambda_4 |v|^2/2)\). Completing the square and matching the constraints yields the Maxwellian. Uniqueness follows from the strict concavity of \(f \mapsto -f \log f\). \(\square\)
</div>

### 2.5 Entropy Production and Convergence to Equilibrium

A natural and deep question is: how fast do solutions of the Boltzmann equation converge to the Maxwellian equilibrium? This is quantified by entropy production estimates, which bound the rate of entropy dissipation from below in terms of the distance from equilibrium.

<div class="theorem">
<strong>Theorem 2.11 (Cercignani's Conjecture, Villani, 2003).</strong> For Maxwell molecules with Grad's angular cutoff, there exists a constant \(\lambda > 0\) (depending on the mass, energy, and entropy of \(f\)) such that

\[
D(f) \ge \lambda \left(H(f) - H(\mathcal{M})\right),
\]
where \(\mathcal{M}\) is the Maxwellian with the same mass, momentum, and energy as \(f\). This entropy-entropy production inequality implies exponential convergence to equilibrium.
</div>

<div class="remark">
<strong>Remark 2.12.</strong> Cercignani originally conjectured a linear inequality \(D(f) \ge C(H(f) - H(\mathcal{M}))\) for a universal constant. This was shown to be false in general by Bobylev and Cercignani (1999). However, Villani and coauthors established that a slightly weaker version (with a constant depending on the solution) holds, and this suffices for the physical conclusion of exponential convergence. For non-cutoff kernels, the regularization effect of grazing collisions provides additional smoothing that aids convergence.
</div>

<div class="example">
<strong>Example 2.13.</strong> Consider the spatially homogeneous Boltzmann equation with hard-sphere kernel, starting from the initial data \(f_0(v) = \frac{1}{2}\left(\mathcal{M}_{1, e_1, 1}(v) + \mathcal{M}_{1, -e_1, 1}(v)\right)\), a mixture of two counterstreaming Maxwellians with equal temperatures. The mass is \(\rho = 1\), the mean velocity is \(u = 0\), and the temperature is \(T = 2\). By the H-theorem, \(f(v,t)\) converges as \(t \to \infty\) to the single Maxwellian \(\mathcal{M}_{1, 0, 2}(v)\). The two-stream instability is resolved not by Boltzmann's equation alone (which damps it monotonically) but through the collisional relaxation that mixes the two populations.
</div>

## Chapter 3: The BGK Model and Relaxation

### 3.1 Motivation and the BGK Collision Operator

The full Boltzmann collision operator is a five-dimensional integral (over \(v_* \in \mathbb{R}^3\) and \(\omega \in S^2\)), making both analytical and numerical work extremely challenging. In 1954, Bhatnagar, Gross, and Krook proposed a dramatic simplification: replace the collision operator by a relaxation term that drives the distribution toward local equilibrium at a rate proportional to its deviation from that equilibrium.

<div class="definition">
<strong>Definition 3.1 (BGK Model).</strong> The <em>BGK equation</em> is

\[
\frac{\partial f}{\partial t} + v \cdot \nabla_x f = \frac{1}{\tau}\left(\mathcal{M}[f] - f\right),
\]
where \(\tau > 0\) is the relaxation time (related to the mean free time) and \(\mathcal{M}[f] = \mathcal{M}_{\rho, u, T}\) is the local Maxwellian computed from the moments of \(f\):

\[
\rho = \int f \, dv, \qquad \rho u = \int v f \, dv, \qquad \frac{3}{2}\rho T = \frac{1}{2}\int |v - u|^2 f \, dv.
\]
</div>

Despite its simplicity, the BGK model is nonlinear because \(\mathcal{M}[f]\) depends on the moments of \(f\). It captures the essential qualitative features of the Boltzmann collision operator while being vastly more tractable.

<div class="theorem">
<strong>Theorem 3.2 (Properties of the BGK Operator).</strong> The BGK collision operator \(Q_{\mathrm{BGK}}(f) = \frac{1}{\tau}(\mathcal{M}[f] - f)\) satisfies:
<ol>
<li>Conservation: \(\int Q_{\mathrm{BGK}}(f)\psi(v) \, dv = 0\) for every collision invariant \(\psi(v) = a + b \cdot v + c|v|^2\).</li>
<li>Equilibria: \(Q_{\mathrm{BGK}}(f) = 0\) if and only if \(f = \mathcal{M}[f]\), i.e., \(f\) is a Maxwellian.</li>
<li>H-theorem: \(\int Q_{\mathrm{BGK}}(f) \log f \, dv \le 0\), with equality if and only if \(f\) is Maxwellian.</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> Conservation follows immediately from the fact that \(\mathcal{M}[f]\) has the same mass, momentum, and energy as \(f\). The characterization of equilibria is clear: \(f = \mathcal{M}[f]\) means \(f\) is Maxwellian with its own moments, hence Maxwellian. For the H-theorem, compute

\[
\int Q_{\mathrm{BGK}}(f)\log f \, dv = \frac{1}{\tau}\int (\mathcal{M}[f] - f)\log f \, dv.
\]
Since \(\mathcal{M}[f]\) maximizes entropy with the same moments, we have \(\int \mathcal{M}[f]\log\mathcal{M}[f] \, dv \le \int f \log f \, dv\) (wait — the sign requires care). More precisely, by the Gibbs inequality (or equivalently the non-negativity of the Kullback-Leibler divergence), \(\int g \log(g/h) \, dv \ge 0\) for any probability densities \(g, h\). Applying this with \(g = f/\rho\) and \(h = \mathcal{M}[f]/\rho\) after appropriate normalization yields

\[
\int (\mathcal{M}[f] - f)\log f \, dv \le \int (\mathcal{M}[f] - f)\log \mathcal{M}[f] \, dv = 0,
\]
where the last equality uses conservation of moments. \(\square\)
</div>

### 3.2 Ellipsoidal BGK and ES-BGK

A significant deficiency of the standard BGK model is that it produces an incorrect Prandtl number. The Chapman-Enskog expansion of the BGK model (see Chapter 4) yields the Navier-Stokes equations but with Prandtl number \(\mathrm{Pr} = 1\), whereas for a monatomic gas the correct value is \(\mathrm{Pr} = 2/3\). The ellipsoidal statistical BGK model (ES-BGK) was introduced by Holway (1966) to correct this.

<div class="definition">
<strong>Definition 3.3 (ES-BGK Model).</strong> The <em>ES-BGK equation</em> is

\[
\frac{\partial f}{\partial t} + v \cdot \nabla_x f = \frac{1}{\tau}\left(\mathcal{G}[f] - f\right),
\]
where \(\mathcal{G}[f]\) is the <em>anisotropic Gaussian</em>

\[
\mathcal{G}[f](v) = \frac{\rho}{\sqrt{(2\pi)^3 \det \mathcal{T}}} \exp\left(-\frac{1}{2}(v - u)^\top \mathcal{T}^{-1}(v - u)\right),
\]
with the temperature tensor

\[
\mathcal{T} = (1 - \nu)T\mathbf{I} + \nu \Theta, \qquad \Theta_{ij} = \frac{1}{\rho}\int (v_i - u_i)(v_j - u_j) f \, dv,
\]
and \(\nu \in [-1/2, 1)\) is a free parameter. The choice \(\nu = -1/2\) gives \(\mathrm{Pr} = 2/3\).
</div>

When \(\nu = 0\), the ES-BGK model reduces to the standard BGK model. The parameter \(\nu\) controls the degree of anisotropy in the target distribution: instead of relaxing toward an isotropic Maxwellian, the distribution relaxes toward a Gaussian whose covariance interpolates between the isotropic temperature tensor \(T\mathbf{I}\) and the actual stress tensor \(\Theta\).

<div class="theorem">
<strong>Theorem 3.4 (Andries, Le Tallec, Perlat, Perthame, 2000).</strong> The ES-BGK model satisfies conservation of mass, momentum, and energy, and an H-theorem holds for \(\nu \in [-1/2, 1)\).
</div>

<div class="remark">
<strong>Remark 3.5.</strong> The proof of the H-theorem for ES-BGK is more delicate than for standard BGK, because the target distribution \(\mathcal{G}[f]\) is not in general the entropy maximizer with the same first five moments. The key insight is that \(\mathcal{G}[f]\) maximizes entropy among all Gaussians with prescribed second moments, and the entropy of \(\mathcal{G}[f]\) is at least that of \(f\) when \(\nu \in [-1/2, 1)\).
</div>

### 3.3 Comparison with Full Boltzmann and Computational Advantages

The BGK model and its variants provide a computationally tractable alternative to the full Boltzmann equation. At the level of the Euler and Navier-Stokes equations (the zeroth- and first-order Chapman-Enskog expansions), the BGK model reproduces the correct macroscopic equations with appropriately chosen relaxation times. The key discrepancies appear in:

1. Transport coefficients: The BGK model gives a Prandtl number of 1; the ES-BGK model corrects this.
2. Higher-order moments: The details of the velocity distribution differ from those predicted by the full Boltzmann equation, particularly in the tails.
3. Non-equilibrium phenomena: In strongly non-equilibrium flows (such as shock structures), the BGK model can give qualitatively different results from the full Boltzmann equation.

<div class="example">
<strong>Example 3.6.</strong> Consider the spatially homogeneous relaxation problem with initial data \(f_0(v) = \frac{1}{2}\rho_0\left[\delta(v - V) + \delta(v + V)\right]\) (two beams). The BGK model predicts exponential relaxation to the Maxwellian: \(f(v,t) = e^{-t/\tau}f_0(v) + (1 - e^{-t/\tau})\mathcal{M}(v)\). This simple exponential behavior contrasts with the more complex relaxation under the full Boltzmann equation, where the distribution first develops a "plateau" between the two beams before settling into a Maxwellian. The timescales and intermediate states differ significantly.
</div>

The main computational advantages of BGK-type models are: (i) the collision operator is evaluated in \(O(N_v^3)\) operations for \(N_v^3\) velocity grid points, compared to \(O(N_v^6)\) for the full Boltzmann operator (or \(O(N_v^3 \log N_v)\) with spectral methods); (ii) the model is easier to extend to polyatomic gases and gas mixtures; and (iii) implicit time-stepping is more straightforward.

<div class="example">
<strong>Example 3.7.</strong> For polyatomic gases, the internal degrees of freedom (rotation, vibration) must be accounted for. The BGK framework extends naturally: define an extended distribution \(f(x, v, I, t)\) where \(I \ge 0\) represents the internal energy. The local equilibrium becomes a product of a Maxwellian in velocity and a power-law distribution in \(I\) (reflecting the equipartition of energy among \(\delta\) internal degrees of freedom). The ES-BGK model can be further generalized to allow different relaxation rates for translational and internal temperatures, capturing the Eucken correction to thermal conductivity. This flexibility is one of the main reasons BGK models are preferred in engineering applications involving air (a mixture of \(N_2\) and \(O_2\), both diatomic) and combustion gases.
</div>

## Chapter 4: Chapman-Enskog Expansion

### 4.1 The Hilbert Expansion

The connection between kinetic theory and fluid dynamics is established through asymptotic analysis in the small parameter \(\varepsilon = \mathrm{Kn}\), the Knudsen number (ratio of mean free path to macroscopic length scale). Hilbert (1912) proposed a formal expansion of the solution of the Boltzmann equation in powers of \(\varepsilon\).

Rescaling the Boltzmann equation by introducing \(x' = \varepsilon x\) (or equivalently, measuring lengths in units of the mean free path), the Boltzmann equation becomes

\[
\varepsilon\left(\frac{\partial f}{\partial t} + v \cdot \nabla_x f\right) = Q(f, f).
\]
This is the Boltzmann equation in the diffusive (or hydrodynamic) scaling. The factor of \(\varepsilon\) on the left indicates that when \(\varepsilon \ll 1\), the collision operator dominates and drives \(f\) toward local equilibrium.

<div class="definition">
<strong>Definition 4.1 (Hilbert Expansion).</strong> The <em>Hilbert expansion</em> is the formal ansatz

\[
f = f_0 + \varepsilon f_1 + \varepsilon^2 f_2 + \cdots,
\]
where each \(f_n\) depends on \(x, v, t\). Substituting into the scaled Boltzmann equation and matching powers of \(\varepsilon\), one obtains a hierarchy of equations.
</div>

At order \(\varepsilon^{-1}\) (the leading order), one finds \(Q(f_0, f_0) = 0\), which by the characterization of equilibria implies \(f_0 = \mathcal{M}_{\rho, u, T}\) is a local Maxwellian. The macroscopic fields \(\rho(x,t)\), \(u(x,t)\), \(T(x,t)\) are as yet undetermined. At order \(\varepsilon^0\), one finds the linearized equation

\[
\partial_t f_0 + v \cdot \nabla_x f_0 = L_{f_0}(f_1) + Q(f_0, f_0) = L_{f_0}(f_1),
\]
where \(L_{f_0}\) is the linearized collision operator about \(f_0\).

### 4.2 The Linearized Collision Operator

To proceed with the asymptotic expansion, we need properties of the linearized collision operator.

<div class="definition">
<strong>Definition 4.2 (Linearized Collision Operator).</strong> Writing \(f = \mathcal{M}(1 + \varepsilon g)\) and expanding the collision operator to first order in \(\varepsilon\), one obtains

\[
Q(\mathcal{M}(1 + \varepsilon g), \mathcal{M}(1 + \varepsilon g)) = \varepsilon \mathcal{M} Lg + O(\varepsilon^2),
\]
where the <em>linearized collision operator</em> is

\[
Lg(v) = \int_{\mathbb{R}^3}\int_{S^2} B \, \mathcal{M}(v_*)\left[g(v') + g(v_*') - g(v) - g(v_*)\right] d\omega \, dv_*.
\]
</div>

<div class="theorem">
<strong>Theorem 4.3 (Properties of L).</strong> The linearized collision operator \(L\), viewed as an operator on \(L^2(\mathcal{M}^{-1} dv)\), satisfies:
<ol>
<li>\(L\) is self-adjoint: \(\langle Lg, h \rangle = \langle g, Lh \rangle\).</li>
<li>\(L\) is non-positive: \(\langle Lg, g \rangle \le 0\).</li>
<li>\(\ker L = \mathrm{span}\{1, v_1, v_2, v_3, |v|^2\}\) — the collision invariants.</li>
<li>On \((\ker L)^\perp\), \(L\) is strictly negative and has a spectral gap: \(\langle Lg, g \rangle \le -\nu_0 \|g\|^2\) for some \(\nu_0 > 0\).</li>
</ol>
</div>

The spectral gap is essential for the solvability of the Chapman-Enskog equations: it ensures that the linearized equation \(Lg = h\) has a unique solution in \((\ker L)^\perp\) whenever \(h \perp \ker L\).

<div class="example">
<strong>Example 4.3a.</strong> For Maxwell molecules, the linearized operator \(L\) can be diagonalized explicitly. The eigenfunctions are products of Sonine (generalized Laguerre) polynomials and spherical harmonics:

\[
\phi_{n,l,m}(c) = S_n^{(l+1/2)}\!\left(\frac{|c|^2}{2}\right)|c|^l Y_{lm}(\hat{c}),
\]
where \(c = (v - u)/\sqrt{T}\) is the normalized peculiar velocity. The eigenvalues \(\lambda_{n,l}\) satisfy \(\lambda_{0,0} = \lambda_{0,1} = \lambda_{1,0} = 0\) (these are the collision invariants) and \(\lambda_{n,l} < 0\) for all other indices. The spectral gap is \(\nu_0 = \min\{|\lambda_{0,2}|, |\lambda_{1,1}|\}\), corresponding to the slowest-decaying non-equilibrium modes. For hard spheres, the eigenfunctions are not known analytically, but the spectral gap has been established rigorously.
</div>

### 4.3 The Chapman-Enskog Procedure

The Chapman-Enskog method differs from the Hilbert expansion in a subtle but crucial way: instead of expanding the macroscopic fields \(\rho, u, T\) in powers of \(\varepsilon\), the Chapman-Enskog ansatz keeps the macroscopic fields exact (defined by the moments of the full \(f\)) and expands only the non-equilibrium part of the distribution.

<div class="definition">
<strong>Definition 4.4 (Chapman-Enskog Ansatz).</strong> Write \(f = \mathcal{M}[f](1 + \Phi)\), where \(\mathcal{M}[f]\) is the local Maxwellian with the same mass, momentum, and energy as \(f\), and \(\Phi\) is the non-equilibrium perturbation satisfying the constraints

\[
\int \mathcal{M}[f]\Phi \, \psi(v) \, dv = 0 \quad \text{for all collision invariants } \psi.
\]
Then expand \(\Phi = \varepsilon \Phi_1 + \varepsilon^2 \Phi_2 + \cdots\).
</div>

The constraint ensures that the macroscopic fields are determined entirely by \(\mathcal{M}[f]\); the corrections \(\Phi_n\) carry no mass, momentum, or energy. This avoids the secular growth problems that can plague the Hilbert expansion.

### 4.4 Euler Equations at Zeroth Order

At zeroth order in \(\varepsilon\), the distribution function is the local Maxwellian \(f_0 = \mathcal{M}_{\rho, u, T}\), and the conservation laws close to give the compressible Euler equations.

<div class="theorem">
<strong>Theorem 4.5 (Euler Equations from Kinetic Theory).</strong> At zeroth order in the Chapman-Enskog expansion, the macroscopic fields \(\rho, u, T\) satisfy the compressible Euler equations:

\[
\frac{\partial \rho}{\partial t} + \nabla \cdot (\rho u) = 0,
\]

\[
\frac{\partial (\rho u)}{\partial t} + \nabla \cdot (\rho u \otimes u) + \nabla p = 0,
\]

\[
\frac{\partial}{\partial t}\left(\frac{1}{2}\rho|u|^2 + \frac{3}{2}\rho T\right) + \nabla \cdot \left[\left(\frac{1}{2}\rho|u|^2 + \frac{5}{2}\rho T\right)u\right] = 0,
\]
with the equation of state \(p = \rho T\) (ideal gas law with \(k_B/m = 1\)).
</div>

<div class="proof">
<strong>Proof.</strong> For a Maxwellian \(\mathcal{M}_{\rho, u, T}\), the stress tensor is isotropic:

\[
\int (v_i - u_i)(v_j - u_j)\mathcal{M} \, dv = \rho T \delta_{ij},
\]
so the momentum flux is \(\int v_i v_j \mathcal{M} \, dv = \rho u_i u_j + \rho T \delta_{ij}\). Similarly, the energy flux is

\[
\frac{1}{2}\int |v|^2 v \mathcal{M} \, dv = \left(\frac{1}{2}\rho|u|^2 + \frac{5}{2}\rho T\right)u.
\]
Substituting into the conservation laws (Theorem 2.6) gives the Euler system. \(\square\)
</div>

The Euler equations are the inviscid limit of fluid dynamics. They capture wave propagation (sound waves) but not dissipative effects (viscosity, heat conduction). To recover dissipation, we must go to first order.

The rigorous justification of this formal limit is a deep mathematical problem. The key difficulty is that the Euler equations develop singularities (shocks) in finite time, while the Boltzmann equation is expected to have smooth solutions for all time (at least in suitable function spaces). The passage from kinetic to fluid in the presence of shocks requires the notion of entropy solutions and has been fully resolved only in special cases.

<div class="theorem">
<strong>Theorem 4.5a (Caflisch, 1980).</strong> For smooth solutions of the compressible Euler equations on a time interval \([0, T^*)\) (before shock formation), there exist solutions of the scaled Boltzmann equation \(\varepsilon(\partial_t f^\varepsilon + v \cdot \nabla_x f^\varepsilon) = Q(f^\varepsilon, f^\varepsilon)\) such that

\[
\sup_{0 \le t < T^*} \left\|f^\varepsilon(\cdot, \cdot, t) - \mathcal{M}_{\rho(t), u(t), T(t)}\right\|_{L^\infty_{x,v}} = O(\varepsilon),
\]
where \((\rho, u, T)\) solve the Euler system. The error is uniform in \(\varepsilon\) and the truncation error of the Hilbert expansion can be controlled order by order.
</div>

### 4.5 Navier-Stokes Equations at First Order

At first order, the perturbation \(\Phi_1\) satisfies a linear equation involving the linearized collision operator \(L\), forced by the gradients of the macroscopic fields.

<div class="theorem">
<strong>Theorem 4.6 (Navier-Stokes Equations from Kinetic Theory).</strong> At first order in the Chapman-Enskog expansion, the macroscopic fields satisfy the compressible Navier-Stokes-Fourier equations:

\[
\frac{\partial \rho}{\partial t} + \nabla \cdot (\rho u) = 0,
\]

\[
\rho\left(\frac{\partial u}{\partial t} + u \cdot \nabla u\right) + \nabla p = \nabla \cdot \boldsymbol{\sigma},
\]

\[
\frac{3}{2}\rho\left(\frac{\partial T}{\partial t} + u \cdot \nabla T\right) + p \nabla \cdot u = \boldsymbol{\sigma} : \nabla u - \nabla \cdot \mathbf{q},
\]
where the viscous stress tensor and heat flux are

\[
\boldsymbol{\sigma} = \mu\left(\nabla u + (\nabla u)^\top - \frac{2}{3}(\nabla \cdot u)\mathbf{I}\right), \qquad \mathbf{q} = -\kappa \nabla T.
\]
</div>

The transport coefficients \(\mu\) (dynamic viscosity) and \(\kappa\) (thermal conductivity) are determined by solving the linearized Boltzmann equation and depend on the collision kernel.

<div class="example">
<strong>Example 4.7.</strong> For hard-sphere molecules of diameter \(\sigma\) and mass \(m\), the first-order Chapman-Enskog expansion gives

\[
\mu = \frac{5}{16\sigma^2}\sqrt{\frac{mk_B T}{\pi}}, \qquad \kappa = \frac{75 k_B}{64\sigma^2}\sqrt{\frac{k_B T}{\pi m}},
\]
yielding a Prandtl number \(\mathrm{Pr} = \frac{c_p \mu}{\kappa} = \frac{5}{2} \cdot \frac{\mu}{\kappa/k_B} = \frac{2}{3}\). Here \(c_p = \frac{5}{2}\frac{k_B}{m}\) is the specific heat at constant pressure. This prediction of \(\mathrm{Pr} = 2/3\) for monatomic gases is in excellent agreement with experimental data for noble gases.
</div>

<div class="remark">
<strong>Remark 4.8.</strong> For Maxwell molecules (\(\gamma = 0\)), the linearized collision operator can be diagonalized explicitly using Burnett functions (products of Sonine polynomials and spherical harmonics), leading to exact computation of transport coefficients. This special structure was one of Maxwell's key insights and makes Maxwell molecules a preferred model for analytical calculations.
</div>

### 4.6 Burnett Equations and Their Issues

Continuing the Chapman-Enskog expansion to second order yields the Burnett equations.

<div class="definition">
<strong>Definition 4.9 (Burnett Equations).</strong> The <em>Burnett equations</em> are the fluid-dynamic equations obtained at second order in the Chapman-Enskog expansion (\(O(\varepsilon^2)\) or equivalently \(O(\mathrm{Kn}^2)\)). They include terms involving second derivatives of the macroscopic fields in the stress tensor and heat flux:

\[
\boldsymbol{\sigma} = \boldsymbol{\sigma}_{\mathrm{NS}} + \varepsilon \boldsymbol{\sigma}_{\mathrm{Burnett}}, \qquad \mathbf{q} = \mathbf{q}_{\mathrm{NS}} + \varepsilon \mathbf{q}_{\mathrm{Burnett}},
\]
where the Burnett corrections contain terms like \(\nabla^2 u\), \(\nabla T \nabla u\), \(\nabla^2 T\), and products of first derivatives.
</div>

<div class="theorem">
<strong>Theorem 4.10 (Bobylev, 1982).</strong> The Burnett equations are linearly ill-posed: the linearization around a uniform equilibrium state has eigenvalues with positive real part for sufficiently large wave numbers. Specifically, for plane-wave perturbations \(\sim e^{i k \cdot x + \sigma t}\), there exist modes with \(\mathrm{Re}(\sigma) \to +\infty\) as \(|k| \to \infty\).
</div>

This instability is a manifestation of a general principle: the Chapman-Enskog expansion is an asymptotic, not a convergent, series. Truncation at higher orders does not necessarily improve the approximation and can introduce unphysical artifacts. Various regularizations have been proposed (augmented Burnett, BGK-Burnett, R13 equations of Struchtrup and Torrilhon) to produce well-posed higher-order approximations while retaining the correct second-order transport.

<div class="remark">
<strong>Remark 4.10a.</strong> The ill-posedness of the Burnett equations can be understood from the perspective of the Chapman-Enskog expansion as a divergent asymptotic series. The Burnett terms are formally of order \(\varepsilon^2\), but they introduce derivatives of order four (through products of second derivatives), which dominate at high frequencies. The regularization procedures work by resumming the asymptotic series or by modifying the higher-order terms to restore parabolicity while preserving the correct low-frequency behavior. From a kinetic perspective, the lesson is that moment closures and extended thermodynamics (Chapter 6) provide a more robust framework for capturing non-equilibrium effects than higher-order truncations of the Chapman-Enskog expansion.
</div>

<div class="example">
<strong>Example 4.11.</strong> Consider a one-dimensional stationary shock wave. The Navier-Stokes equations predict a smooth shock profile whose thickness is proportional to the mean free path. The Burnett equations modify this profile, but the ill-posedness means that numerical computation requires regularization. Direct numerical solutions of the Boltzmann equation (via DSMC or deterministic methods) show that for strong shocks (Mach number \(\gg 1\)), the Navier-Stokes prediction for the shock thickness deviates significantly from the Boltzmann result, while regularized Burnett-type models can offer some improvement for moderate Mach numbers.
</div>

## Chapter 5: The Vlasov Equation and Plasma Physics

### 5.1 Collisionless Kinetic Theory

The Boltzmann equation of Chapter 2 assumes that interactions are short-range, so that they can be modeled as localized binary collisions. But in many physical systems — plasmas, gravitating systems, charged particle beams — the dominant interaction is long-range: the Coulomb force in a plasma decays only as \(1/r^2\). In such systems, each particle interacts simultaneously with a vast number of distant partners, and the concept of a binary collision loses its meaning. Instead, the collective, smooth mean-field force dominates the dynamics, and collisional effects (which do exist, through the cumulative effect of many weak deflections) operate on a much longer time scale.

When the dominant interactions are long-range, the appropriate kinetic equation is the Vlasov equation, a collisionless transport equation coupled to a self-consistent field. The Vlasov equation can be derived from the BBGKY hierarchy in a mean-field limit: \(N \to \infty\) with the interaction potential scaled as \(\Phi \to \Phi/N\), so that the total potential energy per particle remains finite. In this limit, the factorization of marginals holds exactly (propagation of chaos), and the first equation of the hierarchy closes to give the Vlasov equation. This is mathematically distinct from the Boltzmann-Grad limit and leads to a fundamentally different type of kinetic equation — one without a collision term.

<div class="definition">
<strong>Definition 5.1 (Vlasov Equation).</strong> The <em>Vlasov equation</em> for a distribution function \(f(x, v, t)\) with self-consistent force field \(F[f]\) is

\[
\frac{\partial f}{\partial t} + v \cdot \nabla_x f + F[f](x, t) \cdot \nabla_v f = 0.
\]
This is a nonlinear transport equation: \(f\) is transported along the characteristics defined by \(\dot{x} = v\), \(\dot{v} = F[f]\), but the force itself depends on \(f\).
</div>

The Vlasov equation preserves the distribution function along characteristics (as does the Liouville equation), but unlike the Liouville equation, it is an equation for the one-particle distribution function, with the effect of all other particles encoded in the mean field \(F[f]\).

### 5.2 The Vlasov-Poisson System

The most important coupled system in plasma physics is the Vlasov-Poisson system, describing electrostatic interactions.

<div class="definition">
<strong>Definition 5.2 (Vlasov-Poisson System).</strong> The <em>Vlasov-Poisson system</em> for a single species of particles with charge \(q\) and mass \(m\) in the presence of a uniform neutralizing background is

\[
\frac{\partial f}{\partial t} + v \cdot \nabla_x f + \frac{q}{m}E(x,t) \cdot \nabla_v f = 0,
\]

\[
E = -\nabla_x \phi, \qquad -\Delta_x \phi = \frac{q}{\varepsilon_0}\left(\int f \, dv - n_0\right),
\]
where \(\phi\) is the electrostatic potential, \(E\) is the electric field, \(\varepsilon_0\) is the permittivity, and \(n_0\) is the background density.
</div>

<div class="theorem">
<strong>Theorem 5.3 (Global Existence, Pfaffelmoser 1992, Lions-Perthame 1991).</strong> In three dimensions, the Vlasov-Poisson system with sufficiently smooth, compactly supported initial data \(f_0 \ge 0\) has a unique global classical solution. For the gravitational case (attractive potential), the result requires additional conditions on the initial data to prevent collapse.
</div>

The contrast with the Boltzmann equation is striking: global existence for the Vlasov-Poisson system is known for classical solutions, while for the Boltzmann equation, the best available results (DiPerna-Lions, 1989) give global existence only for renormalized solutions, whose uniqueness is unknown.

<div class="remark">
<strong>Remark 5.3a.</strong> The proof strategies for Vlasov-Poisson are based on controlling the support of \(f\) in velocity space. Pfaffelmoser's approach bounds the maximum velocity along characteristics using a clever bootstrap argument. Lions and Perthame instead use a velocity averaging lemma (a key tool in kinetic theory) to obtain compactness. Both approaches rely on the fact that the Poisson equation in 3D gives a force field that decays sufficiently fast; in lower dimensions, the situation is different. In two dimensions, global existence was established earlier by Ukai-Okabe (1978). The gravitational Vlasov-Poisson system is significantly harder because the attractive force can concentrate mass, and singularities cannot be ruled out in general.
</div>

### 5.3 The Vlasov-Maxwell System

For a fully electromagnetic treatment of plasmas, the Poisson equation is replaced by the full Maxwell equations.

<div class="definition">
<strong>Definition 5.4 (Vlasov-Maxwell System).</strong> The <em>Vlasov-Maxwell system</em> for a plasma of species \(\alpha\) (with charges \(q_\alpha\) and masses \(m_\alpha\)) is

\[
\frac{\partial f_\alpha}{\partial t} + v \cdot \nabla_x f_\alpha + \frac{q_\alpha}{m_\alpha}(E + v \times B) \cdot \nabla_v f_\alpha = 0,
\]
coupled to Maxwell's equations:

\[
\nabla \times E = -\frac{\partial B}{\partial t}, \qquad \nabla \times B = \mu_0 J + \mu_0 \varepsilon_0 \frac{\partial E}{\partial t},
\]

\[
\nabla \cdot E = \frac{\rho_c}{\varepsilon_0}, \qquad \nabla \cdot B = 0,
\]
where \(\rho_c = \sum_\alpha q_\alpha \int f_\alpha \, dv\) is the charge density and \(J = \sum_\alpha q_\alpha \int v f_\alpha \, dv\) is the current density.
</div>

<div class="remark">
<strong>Remark 5.5.</strong> Global existence of classical solutions for the Vlasov-Maxwell system in three dimensions remains a major open problem. The DiPerna-Lions theory provides global weak solutions, but their regularity and uniqueness are unknown. The difficulty, compared to Vlasov-Poisson, stems from the finite speed of propagation of the electromagnetic field, which prevents the direct energy estimates that work in the electrostatic case.
</div>

### 5.4 Jeans' Theorem

Equilibria of the Vlasov equation have a particularly elegant characterization.

<div class="theorem">
<strong>Theorem 5.6 (Jeans' Theorem).</strong> Any steady-state solution of the Vlasov equation that depends on phase space only through integrals of the motion of the characteristic equations \(\dot{x} = v\), \(\dot{v} = F\) is a solution of the stationary Vlasov equation. Conversely, under suitable regularity assumptions, any non-negative stationary solution of the Vlasov equation depends on the phase-space variables only through isolating integrals of motion.
</div>

<div class="example">
<strong>Example 5.7.</strong> For the Vlasov-Poisson system, the single-particle energy \(\mathcal{E} = \frac{1}{2}|v|^2 + q\phi(x)/m\) is conserved along characteristics of the stationary system. By Jeans' theorem, any function \(f = \Phi(\mathcal{E})\) with \(\Phi: \mathbb{R} \to \mathbb{R}_{\ge 0}\) is a stationary solution, provided the self-consistency condition \(-\Delta\phi = (q/\varepsilon_0)\left(\int \Phi(\tfrac{1}{2}|v|^2 + q\phi/m) \, dv - n_0\right)\) is satisfied. The choice \(\Phi(\mathcal{E}) = C e^{-\mathcal{E}/T}\) gives the Boltzmann (thermal equilibrium) distribution \(f = n_0 \exp(-\frac{m|v|^2}{2T} - \frac{q\phi}{T})\), and the self-consistency reduces to the Poisson-Boltzmann equation \(-\Delta\phi = \frac{q n_0}{\varepsilon_0}(e^{-q\phi/T} - 1)\).
</div>

### 5.5 Landau Damping: Linear Theory

One of the most striking phenomena in plasma physics is Landau damping: the decay of electric field oscillations in a collisionless plasma, without any dissipative mechanism. This purely kinetic effect has no analogue in fluid dynamics.

<div class="definition">
<strong>Definition 5.8 (Linearized Vlasov-Poisson System).</strong> Linearizing around a spatially homogeneous equilibrium \(f_0(v)\) (with \(E_0 = 0\)), writing \(f = f_0(v) + \varepsilon f_1(x, v, t)\) and \(E = \varepsilon E_1(x, t)\), the linearized system is

\[
\frac{\partial f_1}{\partial t} + v \cdot \nabla_x f_1 + \frac{q}{m}E_1 \cdot \nabla_v f_0 = 0, \qquad -\Delta\phi_1 = \frac{q}{\varepsilon_0}\int f_1 \, dv.
\]
</div>

For a single Fourier mode \(f_1, \phi_1 \propto e^{ikx}\) in one dimension, defining the dielectric function via the Fourier-Laplace transform leads to the dispersion relation.

<div class="theorem">
<strong>Theorem 5.9 (Landau, 1946).</strong> Consider the linearized one-dimensional Vlasov-Poisson system with equilibrium \(f_0(v)\). The electric field associated with a Fourier mode of wave number \(k\) evolves as \(E_k(t) \sim e^{-i\omega t}\), where \(\omega\) is determined by the dispersion relation

\[
\varepsilon(k, \omega) = 1 - \frac{\omega_p^2}{k^2}\int_{-\infty}^\infty \frac{f_0'(v)}{v - \omega/k} \, dv = 0,
\]
with \(\omega_p = \sqrt{n_0 q^2/(m\varepsilon_0)}\) the plasma frequency. The integral is evaluated as a principal value plus a residue (Landau's prescription), yielding complex \(\omega\). For a Maxwellian equilibrium \(f_0(v) = (2\pi v_{th}^2)^{-1/2}e^{-v^2/(2v_{th}^2)}\), the damping rate for \(k \lambda_D \ll 1\) is

\[
\gamma = -\mathrm{Im}(\omega) \approx -\sqrt{\frac{\pi}{8}}\frac{\omega_p}{(k\lambda_D)^3}\exp\left(-\frac{1}{2k^2\lambda_D^2} - \frac{3}{2}\right),
\]
where \(\lambda_D = v_{th}/\omega_p\) is the Debye length. The negative imaginary part means exponential decay.
</div>

The physical mechanism is wave-particle resonance: particles with velocities near the phase velocity \(\omega/k\) exchange energy with the wave. If the distribution function has a negative slope at the resonant velocity (\(f_0'(v_{ph}) < 0\)), more particles gain energy from the wave than lose energy to it, and the wave is damped. This is the generic situation for Maxwellian and similar equilibria.

<div class="example">
<strong>Example 5.9a.</strong> For a Maxwellian equilibrium \(f_0(v) = n_0(2\pi v_{th}^2)^{-1/2}\exp(-v^2/(2v_{th}^2))\), the dispersion relation can be expressed in terms of the plasma dispersion function \(Z(\zeta) = \pi^{-1/2}\int_{-\infty}^\infty \frac{e^{-s^2}}{s - \zeta} \, ds\) (with Landau's contour convention) as

\[
1 - \frac{\omega_p^2}{k^2 v_{th}^2}\left[1 + \zeta Z(\zeta)\right] = 0, \qquad \zeta = \frac{\omega}{k\sqrt{2}v_{th}}.
\]
For \(k\lambda_D \ll 1\), the real part gives the Bohm-Gross dispersion relation \(\omega_r^2 \approx \omega_p^2(1 + 3k^2\lambda_D^2)\), showing that electron plasma waves propagate with a frequency slightly above the plasma frequency. The imaginary part gives the Landau damping rate quoted in Theorem 5.9. For long wavelengths (\(k\lambda_D \to 0\)), the damping rate is exponentially small; for \(k\lambda_D \sim 1\), the damping becomes so strong that the wave ceases to propagate as a well-defined mode.
</div>

### 5.6 The Penrose Criterion

The question of when the linearized Vlasov-Poisson system is stable is answered by the Penrose criterion.

<div class="theorem">
<strong>Theorem 5.10 (Penrose, 1960).</strong> The homogeneous equilibrium \(f_0(v)\) of the one-dimensional Vlasov-Poisson system is linearly stable (no growing modes) if and only if, for every \(v_0\) such that \(f_0'(v_0) = 0\) and \(f_0''(v_0) > 0\) (i.e., every local minimum of \(f_0\)),

\[
\text{P.V.}\int_{-\infty}^\infty \frac{f_0(v) - f_0(v_0)}{(v - v_0)^2} \, dv > 0.
\]
</div>

<div class="example">
<strong>Example 5.11.</strong> A single Maxwellian \(f_0(v) = (2\pi T)^{-1/2}e^{-v^2/(2T)}\) has no local minima, so the Penrose condition is vacuously satisfied: it is always stable. A two-stream distribution \(f_0(v) = \frac{1}{2}(2\pi T)^{-1/2}\left[e^{-(v-V)^2/(2T)} + e^{-(v+V)^2/(2T)}\right]\) has a local minimum at \(v = 0\) when \(V^2 > T\). The Penrose integral at \(v_0 = 0\) can be evaluated to determine the stability boundary: for \(V/\sqrt{T}\) large enough, the integral becomes negative and the system is unstable, leading to the two-stream instability.
</div>

### 5.7 Nonlinear Landau Damping: The Mouhot-Villani Theorem

Extending Landau damping from the linearized to the full nonlinear Vlasov-Poisson system remained an open problem for over 60 years. The resolution came in a celebrated work of Mouhot and Villani.

<div class="theorem">
<strong>Theorem 5.12 (Mouhot-Villani, 2011).</strong> Consider the nonlinear Vlasov-Poisson system on the torus \(\mathbb{T}^d \times \mathbb{R}^d\). Let the initial datum be a small perturbation of a homogeneous equilibrium \(f_0(v)\) satisfying:
<ol>
<li>\(f_0\) is analytic and decays sufficiently fast as \(|v| \to \infty\);</li>
<li>the linearized system around \(f_0\) is stable (Penrose condition);</li>
<li>the perturbation is small in a suitable analytic norm.</li>
</ol>
Then the solution \(f(x, v, t)\) exists globally, and the electric field decays exponentially:

\[
\|E(t)\|_{L^\infty} \lesssim e^{-\lambda t}
\]
for some \(\lambda > 0\). Furthermore, \(f(x, v, t)\) converges weakly (but not strongly) to a homogeneous state \(f_\infty(v)\) as \(t \to \infty\).
</div>

<div class="remark">
<strong>Remark 5.13.</strong> The Mouhot-Villani theorem is remarkable for several reasons. First, the damping mechanism is entirely reversible — it is not dissipation but a transfer of information from the macroscopic electric field to ever-finer velocity-space oscillations (filamentation). Second, the proof requires analyticity (or at least Gevrey regularity) to control the "plasma echoes" — a cascade of nonlinear interactions that could in principle halt the damping. The proof introduced novel techniques combining Nash-Moser iteration with kinetic transport estimates. Villani received the Fields Medal in 2010, in part for this work.
</div>

## Chapter 6: Moment Methods and Closure

### 6.1 The Moment Hierarchy

An alternative to solving the full kinetic equation is to derive equations for velocity moments of the distribution function. This approach bridges kinetic theory and fluid dynamics and provides a hierarchy of increasingly accurate macroscopic models. The fundamental trade-off is clear: each moment reduces one dimension of the problem (integrating out velocity space) but introduces an unknown higher moment, requiring a closure assumption. The quality of the closure determines the accuracy and mathematical properties of the resulting macroscopic system.

The moment approach has a long history, going back to the work of Grad (1949) and continuing through the maximum entropy closures of Levermore (1996) and the regularized moment equations of Struchtrup and Torrilhon (2003). It remains an active area of research, driven by the need for computationally efficient models that capture non-equilibrium effects in complex flows.

<div class="definition">
<strong>Definition 6.1 (Velocity Moments).</strong> The <em>moments</em> of the distribution function \(f(x, v, t)\) are the integrals

\[
m_\alpha(x, t) = \int_{\mathbb{R}^3} v^\alpha f(x, v, t) \, dv,
\]
where \(\alpha = (\alpha_1, \alpha_2, \alpha_3)\) is a multi-index and \(v^\alpha = v_1^{\alpha_1}v_2^{\alpha_2}v_3^{\alpha_3}\). The zeroth moment is the density \(\rho\), the first moments give the momentum \(\rho u\), and the second moments give the stress tensor plus kinetic energy.
</div>

Multiplying the Boltzmann equation by monomials in \(v\) and integrating over velocity, one obtains an infinite hierarchy of moment equations. The key problem is that the equation for the \(n\)-th moment involves the \((n+1)\)-th moment through the streaming term \(v \cdot \nabla_x f\), giving an unclosed system.

<div class="theorem">
<strong>Theorem 6.2 (Moment Hierarchy).</strong> Let \(f\) satisfy the Boltzmann equation. Then for any smooth function \(\psi(v)\),

\[
\frac{\partial}{\partial t}\int \psi f \, dv + \nabla_x \cdot \int v \psi f \, dv = \int \psi \, Q(f,f) \, dv.
\]
Taking \(\psi = 1, v_i, v_iv_j, v_iv_jv_k, \ldots\) generates the moment hierarchy. The system is not closed because \(\int v \psi f \, dv\) involves one moment higher than \(\int \psi f \, dv\).
</div>

### 6.2 Grad's 13-Moment System

The first systematic closure beyond the Navier-Stokes level was proposed by Harold Grad in 1949. The idea is to expand the distribution function in Hermite polynomials about a local Maxwellian and truncate at a finite order.

<div class="definition">
<strong>Definition 6.3 (Grad's 13-Moment Approximation).</strong> The <em>Grad 13-moment distribution</em> is

\[
f_{\mathrm{G13}} = \mathcal{M}_{\rho, u, T}\left(1 + \frac{\sigma_{ij}}{2\rho T^2}(c_i c_j - \tfrac{1}{3}|c|^2\delta_{ij}) + \frac{q_i c_i}{\rho T^2}\left(\frac{|c|^2}{5T} - 1\right)\right),
\]
where \(c = v - u\) is the peculiar velocity, \(\sigma_{ij} = \int c_i c_j f \, dv - \rho T \delta_{ij}\) is the deviatoric stress tensor (5 independent components), and \(q_i = \frac{1}{2}\int |c|^2 c_i f \, dv\) is the heat flux vector (3 components). The 13 independent fields are: \(\rho\) (1), \(u\) (3), \(T\) (1), \(\sigma_{ij}\) (5), and \(q_i\) (3).
</div>

The Grad 13-moment system provides evolution equations for the stress tensor and heat flux, rather than constitutive relations (as in Navier-Stokes). It captures non-equilibrium effects that are absent in the Navier-Stokes description, such as stress relaxation and heat flux coupling. The key philosophical difference from Navier-Stokes is that Grad's system treats the stress and heat flux as independent dynamical variables with their own time scales, rather than as instantaneous functions of the macroscopic gradients. This is essential for flows with rapid variations (high-frequency sound waves, shock structures) where the Navier-Stokes constitutive relations break down.

The truncation at 13 moments is not unique. One can equally well use 20 moments (adding the third-order moments) or 26 moments, obtaining progressively more accurate approximations to the Boltzmann equation. The regularized 13-moment equations (R13) of Struchtrup and Torrilhon (2003) combine the Grad approach with a Chapman-Enskog-like regularization to produce a system that is stable, contains the Navier-Stokes and Burnett equations as special cases, and predicts shock structures in excellent agreement with DSMC for moderate Mach numbers.

<div class="theorem">
<strong>Theorem 6.4 (Grad's 13-Moment Equations).</strong> Under the Grad closure, the deviatoric stress and heat flux satisfy evolution equations of the form

\[
\frac{\partial \sigma_{ij}}{\partial t} + \nabla_k(\sigma_{ij}u_k) + \frac{4}{5}\nabla_{\langle i}q_{j\rangle} + 2\rho T \nabla_{\langle i}u_{j\rangle} + \cdots = -\frac{1}{\tau}\sigma_{ij},
\]

\[
\frac{\partial q_i}{\partial t} + \nabla_j(q_i u_j) + \frac{5}{2}\rho T \nabla_i T + T\nabla_j \sigma_{ij} + \cdots = -\frac{2}{3\tau}q_i,
\]
where \(\langle \cdot \rangle\) denotes the symmetric traceless part, the dots indicate nonlinear terms, and the right-hand sides come from the BGK or linearized Boltzmann collision operator.
</div>

<div class="remark">
<strong>Remark 6.5.</strong> A significant issue with Grad's 13-moment system is that it is not globally hyperbolic: the domain of hyperbolicity (where the system has real characteristics) does not cover all physically realizable states. This can lead to loss of hyperbolicity (and hence ill-posedness) in regions of strong non-equilibrium. This deficiency motivated the development of entropy-based closures.
</div>

### 6.3 Maximum Entropy Closures

The idea of maximum entropy closure is to determine the distribution function by maximizing the entropy functional subject to the constraint that a finite set of moments takes prescribed values. This approach ensures thermodynamic consistency and has deep connections to information theory and convex optimization.

<div class="definition">
<strong>Definition 6.6 (Maximum Entropy Closure).</strong> Given a set of moment constraints \(\int \psi_\alpha(v) f \, dv = m_\alpha\) for \(\alpha = 1, \ldots, M\), the <em>maximum entropy distribution</em> is the minimizer of \(H(f) = \int f \log f \, dv\) subject to these constraints. By the method of Lagrange multipliers, the solution has the form

\[
f_{\mathrm{ME}} = \exp\left(\sum_{\alpha=1}^M \lambda_\alpha \psi_\alpha(v)\right),
\]
where the Lagrange multipliers \(\lambda_\alpha\) are determined by the moment constraints.
</div>

The maximum entropy distribution is an exponential family, and the resulting moment system inherits excellent structural properties from the convexity of the entropy.

<div class="theorem">
<strong>Theorem 6.7 (Levermore, 1996).</strong> The moment system obtained from the maximum entropy closure is:
<ol>
<li>Symmetric hyperbolic (hence well-posed).</li>
<li>Equipped with a convex entropy that is dissipated.</li>
<li>The equilibrium states are Maxwellians.</li>
<li>The system is consistent with the H-theorem of the underlying kinetic equation.</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> The key is the change of variables from the moments \(m_\alpha\) to the entropy variables (Lagrange multipliers) \(\lambda_\alpha\). In the entropy variables, the moment system takes the form \(\frac{\partial^2 h^*}{\partial \lambda_\alpha \partial \lambda_\beta}\frac{\partial \lambda_\beta}{\partial t} + \cdots = \text{source}\), where \(h^*(\lambda) = \int e^{\sum \lambda_\alpha \psi_\alpha} \, dv\) is the Legendre dual of the entropy. The Hessian matrix \(\frac{\partial^2 h^*}{\partial \lambda_\alpha \partial \lambda_\beta} = \int \psi_\alpha \psi_\beta f_{\mathrm{ME}} \, dv\) is positive definite (it is a covariance matrix), which yields symmetric hyperbolicity. The entropy dissipation follows from the convexity of the map from moments to entropy. \(\square\)
</div>

<div class="example">
<strong>Example 6.8.</strong> The simplest maximum entropy closure uses the moments \((\rho, \rho u, \rho|u|^2 + 3\rho T)\), giving the 5-moment system. The maximum entropy distribution is the Maxwellian, and the resulting equations are the compressible Euler equations. The 10-moment system adds the full (symmetric) stress tensor, giving a Gaussian closure \(f = C \exp(-\frac{1}{2}(v-u)^\top \Theta^{-1}(v-u))\), with the temperature tensor \(\Theta_{ij}\) as an independent variable. This is the Gaussian (or "10-moment Gaussian") closure and is equivalent to the ES-BGK target distribution.
</div>

### 6.4 The Levermore Hierarchy and Hyperbolicity

Levermore's framework provides a systematic way to construct a hierarchy of moment closures with increasing resolution.

<div class="definition">
<strong>Definition 6.9 (Levermore Hierarchy).</strong> The <em>Levermore hierarchy</em> consists of the sequence of maximum entropy closures obtained by taking \(\{\psi_\alpha\}\) to be all monomials in \(v\) up to a given degree:
<ul>
<li>Degree 1: Isothermal Euler equations (3 moments).</li>
<li>Degree 2: Euler equations with temperature (5 moments).</li>
<li>Degree 3: 10-moment Gaussian closure plus heat flux (14 moments in 3D).</li>
</ul>
Each level is a globally hyperbolic system with a convex entropy.
</div>

<div class="remark">
<strong>Remark 6.10.</strong> A significant practical challenge with maximum entropy closures is that the optimization problem to determine the Lagrange multipliers may not have a solution for all moment vectors. The set of realizable moments (those that can actually be produced by a non-negative distribution) is not all of \(\mathbb{R}^M\) but a convex cone, and near the boundary of this cone, the optimization problem can fail or become extremely stiff. This "realizability" issue is an active area of research, with contributions from Junk, Schneider, Hauck, and others.
</div>

## Chapter 7: Numerical Methods for Kinetic Equations

### 7.1 Direct Simulation Monte Carlo (DSMC)

The most widely used method for simulating rarefied gas flows is Bird's Direct Simulation Monte Carlo (DSMC) method. It is a stochastic particle method that simulates the Boltzmann equation by tracking a collection of computational particles and performing random binary collisions.

<div class="definition">
<strong>Definition 7.1 (DSMC Algorithm — Bird, 1963).</strong> The <em>DSMC method</em> proceeds as follows:
<ol>
<li><strong>Initialization:</strong> Place \(N_p\) computational particles, each representing \(W = N_{\text{real}}/N_p\) real molecules, with positions and velocities sampled from the initial distribution \(f_0(x, v)\).</li>
<li><strong>Free streaming:</strong> Advance all particle positions: \(x_i \leftarrow x_i + v_i \Delta t\). Apply boundary conditions.</li>
<li><strong>Collision step:</strong> Divide the domain into cells. Within each cell, randomly select pairs of particles and perform collisions with probability proportional to \(|v_i - v_j|\sigma/V_{\text{cell}}\), where \(\sigma\) is the collision cross-section. For accepted pairs, replace \((v_i, v_j)\) by post-collisional velocities \((v_i', v_j')\) sampled from the appropriate scattering law.</li>
<li><strong>Sampling:</strong> Accumulate statistics (density, velocity, temperature) from particle data.</li>
</ol>
Iterate steps 2-4 for each time step.
</div>

The DSMC method converges to the Boltzmann equation in the limit \(N_p \to \infty\) and \(\Delta t \to 0\), provided the cell size is smaller than the mean free path. Its statistical noise decreases as \(N_p^{-1/2}\), which is the principal limitation: smooth solutions require very large numbers of particles. Despite this, DSMC has been enormously successful in practice, largely due to its simplicity, its natural handling of complex geometries and boundary conditions, and its embarrassingly parallel structure. Modern DSMC codes (such as SPARTA and DS2V) routinely simulate billions of particles on parallel architectures.

<div class="theorem">
<strong>Theorem 7.2 (Wagner, 1992).</strong> The DSMC method, in the limit \(N_p \to \infty\) with appropriate time and cell refinement, converges (in the sense of empirical measures) to the solution of the Boltzmann equation. Specifically, for any test function \(\varphi\),

\[
\frac{1}{N_p}\sum_{i=1}^{N_p} \varphi(x_i(t), v_i(t)) \to \int \varphi(x, v) f(x, v, t) \, dx \, dv
\]
in probability as \(N_p \to \infty\).
</div>

<div class="example">
<strong>Example 7.3.</strong> Consider the canonical Sod shock tube problem: two half-spaces at different densities and pressures separated by a membrane that is removed at \(t = 0\). For Knudsen numbers \(\mathrm{Kn} \sim 1\), the DSMC solution reveals a diffuse shock structure and thermal non-equilibrium (different temperatures parallel and perpendicular to the flow) that cannot be captured by the Euler or Navier-Stokes equations. A typical DSMC simulation uses \(10^5\) to \(10^7\) particles and requires careful tuning of the cell size (smaller than \(\ell\)) and time step (smaller than the mean collision time).
</div>

### 7.2 Deterministic Velocity Discretization

An alternative to stochastic methods is to discretize the velocity space directly, solving the Boltzmann equation on a grid in \((x, v)\) space. The discrete velocity method (DVM) replaces the continuous velocity space \(\mathbb{R}^3\) by a finite set of velocities.

<div class="definition">
<strong>Definition 7.4 (Discrete Velocity Method).</strong> A <em>discrete velocity model</em> replaces \(f(x, v, t)\) by a finite collection \(\{f_k(x, t)\}_{k=1}^{N_v}\), where \(v_k \in \mathbb{R}^3\) is a prescribed set of discrete velocities. The Boltzmann equation becomes the system

\[
\frac{\partial f_k}{\partial t} + v_k \cdot \nabla_x f_k = Q_k(\{f_j\}),
\]
where \(Q_k\) is a discretization of the collision operator that preserves the conservation laws.
</div>

<div class="remark">
<strong>Remark 7.5.</strong> The simplest discrete velocity models (such as the Broadwell model with just a few velocities) sacrifice quantitative accuracy for qualitative understanding. Modern deterministic methods use large velocity grids (e.g., \(32^3\) or \(64^3\) points) with Gauss-Hermite or uniform grids, combined with spectral or finite-volume discretization of the collision operator. The main advantage over DSMC is the absence of statistical noise; the main disadvantage is the high dimensionality (the velocity grid adds three dimensions to the spatial grid).
</div>

### 7.3 Spectral Methods for the Collision Operator

The most efficient deterministic approaches to evaluating the Boltzmann collision operator exploit its convolution-like structure in Fourier space.

<div class="theorem">
<strong>Theorem 7.6 (Fourier Structure, Bobylev 1975, Pareschi-Russo 2000).</strong> For Maxwell molecules (\(\gamma = 0\)), the Boltzmann collision operator has a convolution structure in Fourier space: if \(\hat{f}(\xi) = \int e^{-iv \cdot \xi} f(v) \, dv\), then

\[
\widehat{Q(f,f)}(\xi) = \int_{S^2} b(\cos\theta)\left[\hat{f}(\xi^+)\hat{f}(\xi^-) - \hat{f}(\xi)\hat{f}(0)\right] d\omega,
\]
where \(\xi^\pm = \frac{\xi \pm |\xi|\omega}{2}\). For general kernels, a similar (but more complex) structure holds, enabling efficient evaluation via the fast Fourier transform in \(O(N_v^3 \log N_v)\) operations on a velocity grid of \(N_v^3\) points, compared to \(O(N_v^6)\) for direct computation.
</div>

This Fourier representation, due to Bobylev for the Boltzmann equation and extended by Pareschi, Russo, and others to practical algorithms, has revolutionized deterministic computation of the collision operator. The spectral method preserves the conservation laws and the positivity of the distribution function (with appropriate modifications), and achieves spectral accuracy for smooth solutions.

<div class="example">
<strong>Example 7.6a.</strong> A spectral method for the 2D spatially homogeneous Boltzmann equation with hard-sphere kernel uses a velocity grid of \(N_v \times N_v\) points (typically \(N_v = 32\) or \(64\)). The collision operator is evaluated using FFT-based convolutions in \(O(N_v^2 \log N_v)\) operations per time step, compared to \(O(N_v^4)\) for direct evaluation. For a Gaussian initial datum relaxing to a Maxwellian, the spectral method achieves machine-precision accuracy in the equilibrium state and exponential convergence in the transient, provided the solution is smooth. The treatment of the angular singularity (for non-cutoff kernels) requires careful quadrature and truncation of the singular part, but the efficiency gains remain substantial.
</div>

### 7.4 Asymptotic-Preserving Schemes

A major challenge in kinetic simulations is the multi-scale nature of the problem: the Knudsen number can range from \(O(1)\) (kinetic regime) to \(O(10^{-6})\) (fluid regime) within a single domain. Standard explicit schemes require time steps and mesh sizes resolving the mean free path and mean free time, which is computationally prohibitive in the fluid regime.

<div class="definition">
<strong>Definition 7.7 (Asymptotic-Preserving Scheme).</strong> A numerical scheme for the Boltzmann equation (or other kinetic equation) is <em>asymptotic-preserving</em> (AP) if, as the Knudsen number \(\varepsilon \to 0\), the scheme automatically becomes a consistent and stable discretization of the limiting fluid equations (Euler or Navier-Stokes), without requiring the mesh to resolve the kinetic scales \(O(\varepsilon)\).
</div>

The AP property ensures that the scheme works uniformly across all Knudsen number regimes, transitioning seamlessly from the kinetic to the fluid regime. This is essential for practical simulations of multi-scale flows.

<div class="theorem">
<strong>Theorem 7.8 (Jin, 1999).</strong> Consider the BGK equation in the scaling \(\varepsilon(\partial_t f + v \cdot \nabla_x f) = \frac{1}{\varepsilon}(\mathcal{M}[f] - f)\). An implicit-explicit (IMEX) scheme that treats the collision term implicitly and the transport term explicitly is AP: for fixed \(\Delta t\) and \(\Delta x\), the scheme reduces in the limit \(\varepsilon \to 0\) to a consistent discretization of the compressible Euler equations.
</div>

<div class="example">
<strong>Example 7.9.</strong> Consider the one-dimensional BGK equation with IMEX time discretization:

\[
f^{n+1} = f^n - \frac{\Delta t}{\varepsilon}v \partial_x f^n + \frac{\Delta t}{\varepsilon^2}(\mathcal{M}[f^{n+1}] - f^{n+1}).
\]
In the limit \(\varepsilon \to 0\), the dominant balance forces \(f^{n+1} = \mathcal{M}[f^{n+1}]\), i.e., the solution is Maxwellian, and the conservation laws yield the Euler equations discretized in time with step \(\Delta t\). The scheme is stable for any \(\Delta t\), regardless of \(\varepsilon\). For moderate \(\varepsilon\), the scheme captures both kinetic and fluid effects.
</div>

### 7.5 Micro-Macro Decomposition

A closely related approach to the multi-scale problem is the micro-macro decomposition, which splits the distribution function into its equilibrium (macroscopic) and non-equilibrium (microscopic) parts.

<div class="definition">
<strong>Definition 7.10 (Micro-Macro Decomposition).</strong> Write

\[
f = \mathcal{M}[f] + g,
\]
where \(\mathcal{M}[f]\) is the local Maxwellian (the "macro" part) and \(g\) is the non-equilibrium perturbation (the "micro" part), satisfying \(\int g \, \psi(v) \, dv = 0\) for all collision invariants \(\psi\). The Boltzmann equation is then rewritten as a coupled system: conservation laws for the macroscopic fields \((\rho, u, T)\) and a kinetic equation for \(g\).
</div>

<div class="theorem">
<strong>Theorem 7.11 (Bennoune-Lemou-Mieussens, 2008).</strong> The micro-macro system is equivalent to the original Boltzmann equation. In the fluid limit \(\varepsilon \to 0\), \(g \to 0\) and the macroscopic equations reduce to the Euler system. At the Navier-Stokes level, \(g = O(\varepsilon)\) and is determined by the linearized Boltzmann equation. Numerical discretizations of the micro-macro system are naturally AP.
</div>

The micro-macro decomposition has the practical advantage that the macroscopic fields are evolved by a standard fluid solver (which handles the stiff, low-Knudsen-number regime), while the microscopic correction \(g\) is only significant in kinetic regions. Adaptive methods can concentrate velocity-space resolution where \(g\) is large and use the fluid description elsewhere.

<div class="example">
<strong>Example 7.12.</strong> Consider a one-dimensional Riemann problem (shock tube) with \(\mathrm{Kn} = 10^{-3}\). A standard explicit kinetic solver would require \(\Delta t \sim \mathrm{Kn}\) and \(\Delta x \sim \mathrm{Kn}\), leading to \(O(\mathrm{Kn}^{-2}) \approx 10^6\) space-time cells. The micro-macro AP scheme instead uses \(\Delta x\) and \(\Delta t\) appropriate for the macroscopic solution (e.g., 100 cells and CFL-based time steps), while the microscopic perturbation \(g\) is exponentially small and requires little resolution. The computational cost drops by orders of magnitude. In regions of the flow where \(\mathrm{Kn}\) is locally large (e.g., inside the shock layer), the scheme automatically retains the full kinetic resolution because \(g\) is no longer negligible there.
</div>

<div class="remark">
<strong>Remark 7.13.</strong> The design of AP schemes is closely related to the mathematical theory of hydrodynamic limits (Chapter 4). An AP scheme can be viewed as a numerical realization of the Chapman-Enskog expansion: in the fluid limit, the scheme should reproduce the Navier-Stokes (or Euler) discretization, not merely remain stable. This "consistency in the limit" requirement places non-trivial constraints on the discretization and has generated a rich literature since the pioneering work of Jin and collaborators in the late 1990s.
</div>

## Chapter 8: Applications

### 8.1 Rarefied Gas Dynamics and Knudsen Number Regimes

The Knudsen number \(\mathrm{Kn} = \ell / L\), where \(\ell\) is the mean free path and \(L\) is the characteristic length scale, is the key parameter governing which level of description is appropriate.

<div class="definition">
<strong>Definition 8.1 (Knudsen Number Regimes).</strong> The flow regimes classified by Knudsen number are:
<ul>
<li>\(\mathrm{Kn} \lesssim 0.01\): <em>Continuum regime</em>. The Navier-Stokes equations (with no-slip boundary conditions) are valid.</li>
<li>\(0.01 \lesssim \mathrm{Kn} \lesssim 0.1\): <em>Slip-flow regime</em>. The Navier-Stokes equations apply with modified (slip/jump) boundary conditions.</li>
<li>\(0.1 \lesssim \mathrm{Kn} \lesssim 10\): <em>Transition regime</em>. Neither fluid nor free-molecular descriptions are adequate; the full Boltzmann equation (or moment methods) is needed.</li>
<li>\(\mathrm{Kn} \gtrsim 10\): <em>Free-molecular regime</em>. Collisions are rare; the Vlasov (collisionless) equation applies.</li>
</ul>
</div>

The transition regime is the most challenging both theoretically and computationally. Applications include flows in microelectromechanical systems (MEMS), atmospheric re-entry vehicles, and spacecraft plume interactions, where local Knudsen numbers can span several orders of magnitude. It is precisely in the transition regime that kinetic theory is indispensable: neither the simplicity of fluid dynamics nor the simplicity of free-molecular flow is available, and the full apparatus of the Boltzmann equation (or its moment and BGK approximations) is required.

In the slip-flow regime, the Navier-Stokes equations remain valid in the bulk of the flow, but the boundary conditions must be modified. The standard no-slip condition is replaced by the Maxwell slip condition

\[
u_{\text{wall}} - u_{\text{gas}} = \frac{2 - \sigma_T}{\sigma_T}\ell\frac{\partial u}{\partial n}\bigg|_{\text{wall}} + \frac{3}{4}\frac{\mu}{\rho T}\frac{\partial T}{\partial s}\bigg|_{\text{wall}},
\]
where \(\sigma_T \in (0, 1]\) is the tangential momentum accommodation coefficient, \(n\) is the wall-normal direction, and \(s\) is the tangential direction. The second term, involving the tangential temperature gradient, is the thermal creep (or thermal transpiration) effect — a purely kinetic phenomenon with no analogue in classical fluid dynamics.

<div class="example">
<strong>Example 8.2.</strong> Consider the re-entry of a spacecraft capsule at Mach 25 at an altitude of 90 km. The mean free path at this altitude is approximately \(\ell \approx 0.1\) m. The capsule diameter is \(L \approx 3\) m, giving \(\mathrm{Kn} \approx 0.03\) in the free stream — near the boundary of the continuum and slip-flow regimes. However, in the wake behind the capsule and in the shock layer, the local mean free path can be much longer, pushing the local Knudsen number into the transition regime. DSMC simulations using \(10^8\) particles are standard for such flows.
</div>

### 8.2 Semiconductor Transport

The Boltzmann transport equation (BTE) is the fundamental model for charge carrier transport in semiconductors. Electrons and holes in the conduction and valence bands of a semiconductor are treated as quasi-particles that scatter off the crystal lattice (phonons), impurities, and each other.

<div class="definition">
<strong>Definition 8.3 (Semiconductor Boltzmann Transport Equation).</strong> The BTE for the electron distribution function \(f(x, k, t)\) in a semiconductor is

\[
\frac{\partial f}{\partial t} + v(k) \cdot \nabla_x f + \frac{qE}{\hbar} \cdot \nabla_k f = Q(f),
\]
where \(k\) is the crystal momentum (replacing velocity as the kinetic variable), \(v(k) = \frac{1}{\hbar}\nabla_k \mathcal{E}(k)\) is the group velocity determined by the band structure \(\mathcal{E}(k)\), \(E\) is the electric field (possibly self-consistent via Poisson's equation), and \(Q(f)\) is the collision operator accounting for scattering by phonons, impurities, and carrier-carrier interactions.
</div>

The semiconductor BTE differs from the classical Boltzmann equation in several important ways. First, the kinetic variable is crystal momentum \(k\) (living in the Brillouin zone, a compact set) rather than velocity (living in \(\mathbb{R}^3\)). Second, the dispersion relation \(\mathcal{E}(k)\) is not the simple parabola \(\frac{1}{2}m|v|^2\) but a complicated function reflecting the band structure (for silicon, the conduction band minima lie along the \(\langle 100 \rangle\) directions, giving an anisotropic effective mass tensor). Third, quantum statistics (Fermi-Dirac) replaces classical statistics (Maxwell-Boltzmann), introducing the Pauli blocking factors.

The collision operator for semiconductor transport is typically linear (for phonon and impurity scattering, where the scatterers are in thermal equilibrium) and has the form

\[
Q(f)(k) = \int_{BZ} \left[S(k', k)f(k')(1 - f(k)) - S(k, k')f(k)(1 - f(k'))\right] dk',
\]
where \(S(k, k')\) is the scattering rate from state \(k\) to state \(k'\) (computed from Fermi's golden rule), and the factors \((1 - f)\) enforce the Pauli exclusion principle. The equilibrium distribution is no longer a Maxwellian but the Fermi-Dirac distribution \(f_{\text{eq}}(k) = [1 + \exp((\mathcal{E}(k) - \mu)/(k_B T))]^{-1}\), where \(\mu\) is the chemical potential. In the non-degenerate limit (\(f \ll 1\)), the Pauli blocking factors can be neglected and the collision operator becomes linear, recovering the classical Boltzmann form. This is the regime of most semiconductor devices at room temperature, though quantum effects become important in heavily doped regions and at low temperatures.

<div class="example">
<strong>Example 8.4.</strong> In a silicon MOSFET with channel length \(L = 20\) nm and electric fields of order \(10^5\) V/cm, the electron mean free path for phonon scattering is \(\ell \approx 5\text{-}10\) nm. The Knudsen number is \(\mathrm{Kn} \sim 0.5\), placing the device firmly in the transition regime. The drift-diffusion model (the fluid limit of the BTE) is inadequate; the full BTE or at least higher-order moment models (energy-transport, hydrodynamic) are needed to capture hot-electron effects, velocity overshoot, and ballistic transport.
</div>

### 8.3 Radiative Transfer

The kinetic theory of photon transport leads to the radiative transfer equation (RTE), which describes the propagation and scattering of radiation through a participating medium.

<div class="definition">
<strong>Definition 8.5 (Radiative Transfer Equation).</strong> The <em>radiative transfer equation</em> for the specific intensity \(I(x, \omega, \nu, t)\) at position \(x\), direction \(\omega \in S^2\), and frequency \(\nu\) is

\[
\frac{1}{c}\frac{\partial I}{\partial t} + \omega \cdot \nabla_x I = -\kappa_a I - \kappa_s I + \kappa_a B(\nu, T) + \kappa_s \int_{S^2} p(\omega, \omega') I(x, \omega', \nu, t) \, d\omega',
\]
where \(\kappa_a\) is the absorption coefficient, \(\kappa_s\) is the scattering coefficient, \(B(\nu, T)\) is the Planck function, and \(p(\omega, \omega')\) is the scattering phase function normalized so that \(\int_{S^2} p \, d\omega' = 1\).
</div>

The RTE has the same mathematical structure as a linear Boltzmann equation: the streaming term on the left is identical, and the right-hand side is a linear collision operator with absorption (loss), emission (gain from thermal source), and scattering. The angular variable \(\omega \in S^2\) plays the role of velocity, but unlike the Boltzmann equation, the speed \(c\) is fixed (photons are massless).

<div class="example">
<strong>Example 8.5a.</strong> In a stellar atmosphere, the opacity \(\kappa_a\) depends strongly on frequency \(\nu\) (atomic line absorption, photoionization edges), creating a multi-scale problem: the atmosphere is optically thick at some frequencies (continuum) and optically thin at others (between spectral lines). The kinetic/transport description is essential for modeling the emergent spectrum. The discrete ordinates method (\(S_N\) method) discretizes the angular variable into \(N(N+2)/2\) directions (in 3D) and solves a system of coupled PDEs. This is the standard numerical approach for the RTE, and its structure closely parallels the discrete velocity methods of Chapter 7.
</div>

<div class="remark">
<strong>Remark 8.6.</strong> In the optically thick limit (\(\kappa_a L \gg 1\), the analogue of small Knudsen number), the RTE reduces to the diffusion equation for the radiation energy density, known as the Rosseland approximation. This is precisely the analogue of the Chapman-Enskog expansion: the leading order gives an isotropic intensity (the Planck function), and the first-order correction gives Fick's law of diffusion with a radiative diffusion coefficient inversely proportional to the opacity. Asymptotic-preserving schemes for the RTE are an active area of research, mirroring the developments in kinetic gas theory.
</div>

### 8.4 Neutron Transport

The transport of neutrons in a nuclear reactor or shielding material is governed by the linear Boltzmann equation (also called the neutron transport equation). This was one of the earliest applications of kinetic theory in the 20th century and motivated much of the mathematical and computational development of transport theory.

<div class="definition">
<strong>Definition 8.7 (Neutron Transport Equation).</strong> The <em>neutron transport equation</em> for the angular flux \(\psi(x, \omega, E, t)\) of neutrons at position \(x\), direction \(\omega \in S^2\), and energy \(E\) is

\[
\frac{1}{v}\frac{\partial \psi}{\partial t} + \omega \cdot \nabla_x \psi + \Sigma_t(x, E)\psi = \int_0^\infty \int_{S^2} \Sigma_s(x, E' \to E, \omega' \to \omega)\psi(x, \omega', E', t) \, d\omega' \, dE' + S,
\]
where \(v = \sqrt{2E/m_n}\) is the neutron speed, \(\Sigma_t\) is the total macroscopic cross-section, \(\Sigma_s\) is the differential scattering cross-section, and \(S\) includes fission and external sources.
</div>

<div class="example">
<strong>Example 8.8.</strong> The criticality problem for a nuclear reactor asks: for what geometric and material configurations is the neutron population self-sustaining? Mathematically, this is an eigenvalue problem. In the time-independent, monoenergetic, isotropic-scattering case, the transport equation reduces to

\[
\omega \cdot \nabla \psi + \Sigma_t \psi = \frac{c\Sigma_t}{4\pi}\int_{S^2}\psi \, d\omega' + \frac{1}{k_{\mathrm{eff}}}\frac{\nu\Sigma_f}{4\pi}\int_{S^2}\psi \, d\omega',
\]
where \(c = \Sigma_s/\Sigma_t\) is the scattering ratio, \(\nu\) is the average number of neutrons per fission, \(\Sigma_f\) is the fission cross-section, and \(k_{\mathrm{eff}}\) is the effective multiplication factor. The reactor is critical when \(k_{\mathrm{eff}} = 1\). Computing \(k_{\mathrm{eff}}\) and the associated eigenfunction \(\psi\) is one of the core problems in nuclear engineering.
</div>

### 8.5 Traffic Flow Models

Kinetic theory has found a perhaps surprising application in the modeling of vehicular traffic flow. The analogy is natural: vehicles play the role of particles, their speeds play the role of velocities, and interactions (slowing down behind a slower vehicle, overtaking) play the role of collisions.

<div class="definition">
<strong>Definition 8.9 (Kinetic Traffic Model — Prigogine-Herman, 1971).</strong> The <em>Prigogine-Herman model</em> for the distribution function \(f(x, v, t)\) of vehicles at position \(x\) with speed \(v \ge 0\) is

\[
\frac{\partial f}{\partial t} + v \frac{\partial f}{\partial x} = -f \int_0^v (v - w)f(x, w, t) \, dw + \frac{1}{\tau}\left(f_d(v; \rho) - f\right),
\]
where the first term on the right is the "slowing down" interaction (a vehicle with speed \(v\) encounters a slower vehicle with speed \(w < v\) and must reduce speed), the second term is a relaxation toward a desired speed distribution \(f_d(v; \rho)\) that depends on the local traffic density \(\rho = \int f \, dv\), and \(\tau\) is a relaxation time.
</div>

The structure of this model mirrors the Boltzmann and BGK equations. The interaction term is analogous to the loss part of the collision operator (vehicles slow down but, unlike gas molecules, do not speed up through "collisions"). The relaxation term is a BGK-like operator driving the distribution toward a density-dependent equilibrium.

<div class="example">
<strong>Example 8.10.</strong> Taking velocity moments of the Prigogine-Herman model yields macroscopic traffic equations. The zeroth moment gives the conservation of vehicles:

\[
\frac{\partial \rho}{\partial t} + \frac{\partial (\rho u)}{\partial x} = 0,
\]
where \(u = \frac{1}{\rho}\int v f \, dv\) is the mean traffic speed. The first moment gives a momentum equation with a "traffic pressure" and a relaxation source. In the fluid limit (\(\tau \to 0\)), one recovers the Lighthill-Whitham-Richards (LWR) model \(\partial_t \rho + \partial_x(\rho V(\rho)) = 0\), where \(V(\rho)\) is the equilibrium speed-density relation. The kinetic model provides a principled derivation of the LWR model and its higher-order extensions (Aw-Rascle, Zhang).
</div>

<div class="remark">
<strong>Remark 8.11.</strong> The kinetic approach to traffic flow illustrates the broad applicability of the ideas developed in this course. The passage from a microscopic description (individual vehicles following rules) to a mesoscopic kinetic equation to a macroscopic PDE (conservation law) exactly mirrors the passage from Newton's laws to the Boltzmann equation to the Euler/Navier-Stokes equations. The mathematical tools — moment closures, asymptotic expansions, entropy methods — transfer directly, though the physical content of the "collision operator" is very different.
</div>

The structure of the kinetic traffic model also admits an H-theorem: an entropy functional can be defined whose dissipation characterizes the approach to the local desired speed distribution. This provides a thermodynamic consistency for the model and constrains the choice of the desired distribution \(f_d(v; \rho)\).

<div class="theorem">
<strong>Theorem 8.12 (Fluid Limit of Kinetic Traffic Models).</strong> In the relaxation limit \(\tau \to 0\) of the Prigogine-Herman model, the distribution function converges to the desired distribution \(f_d(v; \rho)\), and the conservation of vehicles reduces to the scalar conservation law

\[
\frac{\partial \rho}{\partial t} + \frac{\partial}{\partial x}\left(\rho V_e(\rho)\right) = 0,
\]
where \(V_e(\rho) = \int v f_d(v; \rho) \, dv / \rho\) is the equilibrium speed. This is the Lighthill-Whitham-Richards model (1955-1956), the foundational equation of macroscopic traffic flow theory. For typical speed-density relations (e.g., \(V_e(\rho) = v_{\max}(1 - \rho/\rho_{\max})\)), this is a concave-flux conservation law whose shocks correspond to traffic jams (the kinematic wave theory of traffic).
</div>

The interplay between kinetic theory and its diverse applications — from rarefied gases and plasmas to semiconductors, radiation, nuclear engineering, and even traffic — testifies to the power and generality of the Boltzmann framework. The mathematical structures identified in Chapters 1 through 7 — conservation laws, entropy, the H-theorem, Chapman-Enskog asymptotics, moment closures, asymptotic-preserving schemes — reappear in each application, providing a unified language for transport phenomena across the sciences.
