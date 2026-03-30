---
title: "PHYS 490: String Theory, Renormalization, Path Integrals, and Supersymmetric Quantum Mechanics"
prof: Gang Xu, Daniel Wohns
subjects: "PHYS"
---

## Sources and References

**Primary textbook** — Course lecture notes by Gang Xu and Dan Wohns (posted on LEARN).
**Supplementary texts** — MacKenzie, R. (2000). *Path Integral Methods and Applications*. arXiv:quant-ph/0004090; Tong, D. *Lectures on Supersymmetric Quantum Mechanics* (damtp.cam.ac.uk/user/tong/susy.html); Polchinski, J. (1998). *String Theory*, Vols. 1–2. Cambridge University Press; Peskin, M. E., & Schroeder, D. V. (1995). *An Introduction to Quantum Field Theory*. Westview Press (renormalization).
**Online resources** — Tong, D. *String Theory Lecture Notes* (damtp.cam.ac.uk/user/tong/string.html); PIRSA lectures from Perimeter Institute (pirsa.org); arXiv hep-th.

---

# Chapter 1: String Theory — Classical Relativistic Mechanics

## 1.1 The Relativistic Point Particle

Before treating strings, we review the relativistic point particle to establish methods that generalize.

**Worldline**: a point particle traces a **worldline** in \( D \)-dimensional spacetime — a curve \( X^\mu(\tau) \), \( \mu = 0, 1, \ldots, D-1 \), parameterized by the proper time \( \tau \).

**Minkowski metric**: \( \eta_{\mu\nu} = \text{diag}(-1, +1, +1, \ldots, +1) \) (mostly plus convention). Spacetime interval:
\[ ds^2 = \eta_{\mu\nu}dX^\mu dX^\nu = -c^2 dt^2 + d\mathbf{x}^2 \]

**Lorentz-invariant action**: the simplest action for a point particle is proportional to the proper length (total proper time) of its worldline:
\[ S_{pp} = -mc\int d\tau\, \sqrt{-\eta_{\mu\nu}\dot{X}^\mu\dot{X}^\nu} = -mc\int ds \]

where \( \dot{X}^\mu = dX^\mu/d\tau \). The factor \( -mc^2 \) ensures the correct non-relativistic limit.

**Equations of motion** (extremize \( S_{pp} \)):
\[ \frac{d}{d\tau}\left(\frac{m\dot{X}^\mu}{\sqrt{-\dot{X}^2}}\right) = 0 \quad \Rightarrow \quad \ddot{X}^\mu = 0 \]
Free particle moves in a straight line — geodesic of flat spacetime.

**Canonical momentum**: \( p_\mu = mc \dot{X}_\mu/\sqrt{-\dot{X}^2} \), giving the mass-shell constraint \( p^2 + m^2c^2 = 0 \).

## 1.2 String Action — the Nambu-Goto Action

A string sweeps a **worldsheet** — a 2-dimensional surface \( X^\mu(\tau, \sigma) \) in spacetime, parameterized by \( (\tau, \sigma) \) where \( \sigma \in [0, \ell] \) is the string coordinate.

**Nambu-Goto action**: the area of the worldsheet, weighted by the string tension \( T = 1/(2\pi\alpha') \) (where \( \alpha' \) is the Regge slope, related to the string length \( \ell_s = \sqrt{\alpha'} \)):
\[ S_{NG} = -T\int d\tau\,d\sigma\, \sqrt{-\det(\gamma_{ab})} \]

where \( \gamma_{ab} = \eta_{\mu\nu}\partial_a X^\mu \partial_b X^\nu \) is the **induced metric** on the worldsheet, with \( \partial_0 = \partial/\partial\tau \), \( \partial_1 = \partial/\partial\sigma \).

**Polyakov action** (classically equivalent): introduces an auxiliary worldsheet metric \( h_{ab} \):
\[ S_P = -\frac{T}{2}\int d\tau\,d\sigma\, \sqrt{-h}\, h^{ab}\partial_a X^\mu \partial_b X_\mu \]

The Polyakov action is quadratic in \( X^\mu \) and therefore easier to quantize.

**Worldsheet symmetries** of \( S_P \):
- Poincaré invariance in spacetime: \( X^\mu \to \Lambda^\mu_\nu X^\nu + a^\mu \).
- **Diffeomorphism invariance** of the worldsheet (reparameterization invariance).
- **Weyl invariance**: \( h_{ab} \to e^{2\omega(\tau,\sigma)} h_{ab} \) (local rescaling of worldsheet metric).

These symmetries can be used to **fix a gauge** (choose coordinates), simplifying the equations of motion.

---

# Chapter 2: Classical String Solutions

## 2.1 String Equations of Motion

In **conformal gauge** (\( h_{ab} = \eta_{ab} \)), the Polyakov action becomes:
\[ S_P = \frac{T}{2}\int d\tau\,d\sigma\, \left[(\dot{X})^2 - (X')^2\right] \]
where \( \dot{X} = \partial_\tau X \), \( X' = \partial_\sigma X \).

Varying with respect to \( X^\mu \):
\[ \ddot{X}^\mu - X''^\mu = 0 \quad \Leftrightarrow \quad \partial_+ \partial_- X^\mu = 0 \]
where \( \sigma^\pm = \tau \pm \sigma \) are lightcone worldsheet coordinates. This is the **2D wave equation** — strings vibrate.

**Virasoro constraints** (residual gauge constraints from the Weyl symmetry):
\[ T_{++} = \dot{X}\cdot X' + X'^2 = 0, \quad T_{--} = \dot{X}\cdot X' - X'^2 = 0 \]
These are the analogs of the mass-shell constraint for the particle.

## 2.2 Boundary Conditions

**Closed string**: \( X^\mu(\tau, \sigma + 2\pi) = X^\mu(\tau, \sigma) \). The general solution is left-movers + right-movers:
\[ X^\mu = x^\mu + \frac{\alpha'}{2}p^\mu\tau + i\sqrt{\frac{\alpha'}{2}}\sum_{n\neq 0}\frac{1}{n}\left(\alpha_n^\mu e^{-in(\tau-\sigma)} + \tilde\alpha_n^\mu e^{-in(\tau+\sigma)}\right) \]

**Open string** with Neumann boundary conditions (free endpoint): \( X'^\mu|_{\sigma=0,\pi} = 0 \). General solution:
\[ X^\mu = x^\mu + \alpha' p^\mu\tau + i\sqrt{2\alpha'}\sum_{n\neq 0}\frac{\alpha_n^\mu}{n}e^{-in\tau}\cos(n\sigma) \]

**Dirichlet boundary conditions**: \( X^i|_{\sigma=0} = $ const \) (D-branes). The endpoint is fixed in space — it lies on a **D-brane** (a \( p \)-dimensional hypersurface in target space). D-branes are non-perturbative dynamical objects in string theory.

## 2.3 Classical Spectrum and Masses

The spacetime mass of a string state is determined by the Virasoro constraints. For the open string:
\[ m^2 = \frac{1}{\alpha'}\left(N - a\right) \]
where \( N = \sum_{n>0}\alpha_{-n}\cdot\alpha_n \) is the level number (total mode excitation) and \( a \) is a normal-ordering constant.

Higher modes \( N \geq 1 \) correspond to excited (massive) string states. The ground state \( N = 0 \) mass depends on \( a \).

---

# Chapter 3: Quantization of the Bosonic String

## 3.1 Canonical Quantization and Negative Norm States

**Promote modes to operators**: the oscillator coefficients become operators satisfying:
\[ [\alpha_m^\mu, \alpha_n^\nu] = m\, \delta_{m+n,0}\, \eta^{\mu\nu} \]

The timelike modes (\( \mu = 0 \)) satisfy commutation relations with the wrong sign due to \( \eta^{00} = -1 \):
\[ [\alpha_m^0, \alpha_{-m}^0] = -m \]

This means \( \alpha_{-m}^0|0\rangle \) has **negative norm** — the theory contains ghost states that would violate unitarity.

**Normal ordering**: \( :(\alpha_n^\mu)^2: \) requires a choice of ordering; the **normal-ordering constant** \( a \) captures the zero-point energy:
\[ a = \frac{D-2}{24} \times (-1) \quad \text{from the bosonic oscillators} \]
Using zeta-function regularization: \( \sum_{n=1}^\infty n \to \zeta(-1) = -1/12 \), so \( a = (D-2)/24 \).

## 3.2 Light-Cone Quantization

<div class="definition">
<strong>Light-cone quantization</strong> fixes the residual gauge symmetry by choosing \( X^+ = x^+ + \alpha' p^+ \tau \) (light-cone gauge), where \( X^\pm = (X^0 \pm X^{D-1})/\sqrt{2} \). This eliminates the \( X^+ \) and \( X^- \) oscillators as physical degrees of freedom.
</div>

In light-cone gauge, only the **transverse oscillators** \( \alpha_n^i \), \( i = 1, \ldots, D-2 \) are independent. These are all spacelike → no negative norm states.

**Physical state condition**: \( m^2 = \frac{1}{\alpha'}(N_\perp - 1) \) for the open bosonic string, where \( N_\perp = \sum_{n>0}\alpha_{-n}^i\alpha_n^i \) sums over transverse modes.

**Ground state** \( N_\perp = 0 \): \( m^2 = -1/\alpha' < 0 \) → **tachyon**. A symptom that the bosonic string vacuum is unstable.

**First excited state** \( N_\perp = 1 \): a set of states \( \alpha_{-1}^i|0;p\rangle \) that must form a representation of the **little group** of the Lorentz group for massless particles (SO\( (D-2) \)) for Lorentz invariance. This requires \( m^2 = 0 \).

## 3.3 Critical Dimension: 26 Spacetime Dimensions

<div class="theorem">
<strong>Critical dimension of the bosonic string:</strong> Lorentz invariance (specifically, the Lorentz algebra \( [J^{i-}, J^{j-}] = 0 \) in light-cone gauge) is only satisfied when the spacetime dimension is:
\[ D = 26 \]
</div>

**Derivation**: the Lorentz generators \( J^{i-} \) involve a sum over transverse oscillators. Computing the commutator, one finds terms proportional to \( (D-2) \sum n \) (the sum over zero-point energies) and \( a \) (the normal-ordering constant). For these to cancel:
\[ \frac{D-2}{24} = 1 \quad \Rightarrow \quad D = 26 \]
simultaneously requiring \( a = 1 \).

Physical interpretation: bosonic strings require 26 dimensions for the quantum theory to be Lorentz-invariant. Superstrings (which include fermions on the worldsheet) require \( D = 10 \).

**Compactification**: the extra dimensions (\( 25 - 3 = 22 \) spatial dimensions beyond the observed 3) are assumed to be compact (curled up at the string scale \( \sim 10^{-35} \) m). Different compactification geometries lead to different effective low-energy physics.

## 3.4 T-Duality (Overview)

**T-duality**: when one spatial direction is compactified on a circle of radius \( R \), the string theory is equivalent to another string theory with radius \( \alpha'/R \). This is because strings can wind around the compact dimension — winding modes exchange roles with momentum modes under \( R \leftrightarrow \alpha'/R \).

T-duality exchanges Neumann and Dirichlet boundary conditions, transforming D-branes into one another. This is one of the non-perturbative dualities that suggest all five consistent superstring theories are related and arise from a single 11-dimensional theory (M-theory).

---

# Chapter 4: Renormalization and Regularization

## 4.1 Divergences and the Need for Renormalization

Physical calculations in quantum mechanics and quantum field theory frequently produce **formally divergent integrals** — integrals that diverge in the ultraviolet (UV, high momenta) or infrared (IR, low momenta). Renormalization is the systematic procedure for extracting finite physical predictions from such divergences.

**Key insight**: the bare parameters in a Lagrangian (masses, charges) are not the physical parameters. Physical observables are expressed in terms of renormalized parameters, after absorbing the infinities.

## 4.2 Classical Examples

**Debye-Hückel theory**: consider a test charge in a plasma. The total electrostatic energy includes a divergent self-energy from the surrounding ion cloud. Debye-Hückel screening provides a natural physical UV cutoff (Debye length), showing that renormalization is a physical process of coarse-graining.

**Infinite charge distribution**: a conducting sphere with total charge \( Q \) on its surface has self-energy:
\[ U = \frac{Q^2}{8\pi\epsilon_0 R} \to \infty \quad \text{as } R \to 0 \]
Point particles have divergent self-energies. This is the classical electron self-energy problem — not really resolved classically; regularization is needed.

**Delta-prime potential** (\( V(x) = g\delta'(x) \)): exhibits renormalization-group running of the coupling \( g \) even in quantum mechanics. A perturbative calculation of scattering amplitudes gives divergent integrals; imposing a renormalization condition at a reference energy defines a renormalized coupling that runs with energy.

## 4.3 Regularization Methods

**Regularization**: temporarily modify the theory to make integrals finite, extract the physical answer, then remove the regulator.

**Cutoff regularization**: introduce a UV momentum cutoff \( \Lambda \). Simple and physical, but breaks Lorentz and gauge invariance.

**Dimensional regularization**: perform integrals in \( d = 4 - \epsilon \) dimensions. Divergences appear as poles in \( 1/\epsilon \). Preserves all symmetries.

**Zeta-function regularization**: used for string normal-ordering constant. Formally:
\[ \sum_{n=1}^\infty n = \zeta(-1) = -\frac{1}{12} \]
This is the analytic continuation of the Riemann zeta function to \( s = -1 \).

## 4.4 Renormalization Group (RG)

<div class="definition">
The <strong>renormalization group</strong> describes how the effective couplings of a theory change with the energy scale at which it is probed. The <strong>beta function</strong> \( \beta(g) = \mu\,dg/d\mu \) governs the running of coupling \( g \) with energy scale \( \mu \).
</div>

**Running coupling**: in QED, the electric charge runs as:
\[ \alpha(Q^2) = \frac{\alpha_0}{1 - \frac{\alpha_0}{3\pi}\ln(Q^2/m_e^2)} \]
The coupling increases at high energies (**Landau pole** in QED).

In QCD (the strong force), the coupling *decreases* at high energies (**asymptotic freedom**) — a non-Abelian gauge theory effect.

**Two-level system renormalization**: a quantum mechanical two-level system coupled to a high-energy "reservoir" exhibits renormalization of its energy splitting and coupling by integrating out the reservoir modes.

---

# Chapter 5: Path Integrals and Applications

## 5.1 The Feynman Path Integral

<div class="definition">
The <strong>Feynman path integral</strong> expresses the quantum mechanical propagator (transition amplitude) as a sum over all possible paths between two endpoints, weighted by \( e^{iS/\hbar} \) where \( S \) is the classical action:
\[ K(x_f, t_f; x_i, t_i) = \int \mathcal{D}x(t)\, e^{iS[x]/\hbar} = \langle x_f, t_f | x_i, t_i \rangle \]
</div>

**Derivation**: partition the time interval into \( N \) steps; insert \( N-1 \) completeness relations \( \int dx_k |x_k\rangle\langle x_k| = \mathbb{1} \); take \( N \to \infty \) with the short-time propagator given by the WKB expression.

**Euclidean path integral**: Wick-rotate to imaginary time \( t \to -i\tau \) (\( \tau \) real). The weight becomes \( e^{-S_E/\hbar} \) where \( S_E \) is the Euclidean action. Exponential suppression (not oscillation) makes the integral better-defined and relates quantum mechanics to statistical mechanics:
\[ Z = \text{Tr}(e^{-\beta H}) = \int \mathcal{D}x\, e^{-S_E[x]/\hbar} \]
at inverse temperature \( \beta = 1/(k_BT) \).

## 5.2 Path Integral for the Harmonic Oscillator

For \( S = \int dt\, \frac{1}{2}m(\dot{x}^2 - \omega^2 x^2) \), the path integral is Gaussian:
\[ K(x_f, t_f; x_i, 0) = \sqrt{\frac{m\omega}{2\pi i\hbar\sin(\omega t_f)}} \exp\!\left(\frac{im\omega}{2\hbar\sin(\omega t_f)}\left[(x_i^2 + x_f^2)\cos(\omega t_f) - 2x_i x_f\right]\right) \]

This is **exact** for a quadratic action — all quantum effects are included.

## 5.3 Perturbation Theory via Path Integrals

For an anharmonic oscillator \( V = \frac{1}{2}m\omega^2 x^2 + \lambda x^4 \):
\[ K = \int \mathcal{D}x\, e^{iS_0/\hbar} e^{-i\lambda\int x^4 dt/\hbar} = \int \mathcal{D}x\, e^{iS_0/\hbar} \sum_n \frac{1}{n!}\left(-\frac{i\lambda}{\hbar}\right)^n \left(\int x^4 dt\right)^n \]

Each term generates Feynman diagrams via **Wick's theorem**: products of fields are expressed as sums of products of propagators (contractions). The \( x^4 \) vertex creates 4-point interactions; the expansion generates the standard perturbative QFT Feynman rules.

**Feynman rules** (position space):
- Propagator: \( G(x, x') = \langle x | (-\partial^2 + m^2)^{-1} | x'\rangle \).
- Vertex: \( -i\lambda \int d^4y \) for each \( x^4 \) vertex.
- Integrate over internal positions (loops).

## 5.4 Instantons

<div class="definition">
An <strong>instanton</strong> is a solution to the Euclidean equations of motion that is localized in Euclidean time. It describes quantum mechanical <strong>tunnelling</strong> through a classically forbidden potential barrier, contributing non-perturbatively as \( e^{-S_E^{inst}/\hbar} \).
</div>

**Double-well potential**: \( V(x) = \frac{\lambda}{4}(x^2 - a^2)^2 \). The classical minima are at \( x = \pm a \), separated by a barrier. Classically, a particle in one well cannot reach the other. Quantum mechanically, tunnelling occurs.

**Instanton solution**: in Euclidean time, the equation of motion is \( \ddot{x}_E = V'(x_E) \). This has a particle rolling from \( -a \) to \( +a \) (instead of an upside-down potential). The solution:
\[ x_{inst}(\tau) = a\tanh\!\left(\frac{m\omega}{2}(\tau - \tau_0)\right), \quad \omega = \sqrt{2\lambda} a \]

The Euclidean action of this solution is finite: \( S_E^{inst} = \frac{4}{3}\sqrt{2\lambda}a^3/m \). The tunnelling amplitude is:
\[ \langle -a | e^{-HT/\hbar} | a \rangle \propto e^{-S_E^{inst}/\hbar} \]

**Multi-instanton sum**: the vacuum energy splitting between the symmetric and antisymmetric states of the double well is:
\[ \Delta E = \hbar\omega\, K e^{-S_E^{inst}/\hbar} \]
where \( K \) is a determinant factor from quantum fluctuations around the instanton.

---

# Chapter 6: Supersymmetric Quantum Mechanics

## 6.1 Symmetries in Quantum Mechanics

A symmetry of a Hamiltonian is an operator \( Q \) that commutes with it: \( [H, Q] = 0 \). This implies:
- If \( |E\rangle \) is an eigenstate with energy \( E \), so is \( Q|E\rangle \) (energy degeneracy).
- Conserved quantity: \( d\langle Q\rangle/dt = 0 \).

**Graded algebra**: if instead of \( [H, Q] = 0 \) we have \( \{H, Q\} = 0 \) (anticommutator), the algebra is **graded** (supersymmetric). This is realized in supersymmetric quantum mechanics.

## 6.2 The SUSY Algebra

<div class="definition">
<strong>Supersymmetric quantum mechanics (SQM)</strong> has Hamiltonians that can be written as the anticommutator of two nilpotent operators (supercharges) \( Q \) and \( Q^\dagger \):
\[ H = \{Q, Q^\dagger\} \equiv QQ^\dagger + Q^\dagger Q \]
\[ Q^2 = 0, \quad (Q^\dagger)^2 = 0 \]
\[ [H, Q] = 0, \quad [H, Q^\dagger] = 0 \]
</div>

**Consequences**:
1. \( E \geq 0 \) for all states: \( \langle\psi|H|\psi\rangle = \|Q^\dagger|\psi\rangle\|^2 + \|Q|\psi\rangle\|^2 \geq 0 \).
2. SUSY is unbroken iff \( \exists \) zero-energy state \( |\Omega\rangle \) with \( Q|\Omega\rangle = Q^\dagger|\Omega\rangle = 0 \).
3. Non-zero energy states come in **boson-fermion pairs**: if \( Q^\dagger|E\rangle \neq 0 \), then \( Q^\dagger|E\rangle \) is a degenerate partner with the same energy but opposite fermion number.

## 6.3 Construction of SUSY Hamiltonians

Let \( \psi_1, \psi_2 \) be fermionic oscillators (\( \{c, c^\dagger\} = 1 \)). Define:
\[ Q = c W'(x), \quad Q^\dagger = c^\dagger W'(x) \]
where \( W(x) \) is the **superpotential** and \( W'(x) = dW/dx \).

The Hamiltonian becomes:
\[ H = \left(-\frac{d^2}{dx^2} + V_-(x)\right)\otimes |B\rangle\langle B| + \left(-\frac{d^2}{dx^2} + V_+(x)\right)\otimes |F\rangle\langle F| \]

**Partner potentials**:
\[ V_\pm(x) = \left(W'(x)\right)^2 \mp W''(x) \]

The bosonic (\( V_- \)) and fermionic (\( V_+ \)) sectors are **isospectral** (same spectrum) except possibly for the ground state.

**Example — harmonic oscillator**: \( W(x) = \frac{\omega}{2}x^2 \), \( W'(x) = \omega x \):
\[ V_-(x) = \omega^2 x^2 - \omega, \quad V_+(x) = \omega^2 x^2 + \omega \]
Same as the harmonic oscillator with shifted ground state energy: \( V_\pm \) are partner potentials with identical spectra shifted by \( 2\omega \).

## 6.4 The Witten Index

<div class="definition">
The <strong>Witten index</strong> \( \mathcal{W} = \text{Tr}\left[(-1)^F e^{-\beta H}\right] \) is a topological invariant that counts the difference between the number of bosonic and fermionic zero-energy states:
\[ \mathcal{W} = n_B^{(0)} - n_F^{(0)} \]
</div>

**Key property**: \( \mathcal{W} \) is independent of \( \beta \) and of continuous deformations of the Hamiltonian. Non-zero \( \mathcal{W} \) implies SUSY is unbroken (zero-energy ground state exists).

**Calculation for the harmonic oscillator**: the unique zero-energy state is bosonic (no zero-energy fermionic state), so \( \mathcal{W} = 1 \).

**SUSY breaking**: if \( \mathcal{W} = 0 \), SUSY may or may not be broken. If \( \mathcal{W} \neq 0 \), SUSY is definitely unbroken.

## 6.5 Morse Theory Connection

The Witten index in SQM is intimately connected to **Morse theory** in mathematics — a relationship between the topology of a manifold and the critical points of a smooth function on it.

**Morse function** = superpotential \( W(x) \). The zero-energy states of the SUSY Hamiltonian are in one-to-one correspondence with the **cohomology classes** of the manifold. Specifically:
\[ n_B^{(0)} - n_F^{(0)} = \chi(M) = \sum_k (-1)^k b_k \]
where \( b_k \) are the **Betti numbers** (dimensions of the \( k \)-th cohomology group) and \( \chi \) is the **Euler characteristic** of the manifold.

This is a beautiful example of physics illuminating pure mathematics: Witten (1982) used SQM to give a novel proof of the **Morse inequalities** (relating the number of critical points of a Morse function to the Betti numbers).

**Instantons in SQM → tunnelling between critical points**: the non-perturbative effects (instanton corrections to the index) correspond geometrically to tunnelling between minima of \( W \), counting gradient flow lines between critical points — the foundation of **Floer homology** in mathematics.
