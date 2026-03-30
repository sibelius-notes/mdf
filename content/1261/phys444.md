---
title: "PHYS 444: Introduction to Particle Physics"
prof: "Fil Simovic"
---

## Sources and References

These notes synthesize material from the following textbooks and standard references. They are not transcribed from any specific term's lectures.

**Primary textbook**
- R. Mann, *An Introduction to Particle Physics and the Standard Model* (CRC Press, 2010)

**Supplementary texts**
- D. Griffiths, *Introduction to Elementary Particles*, 2nd ed. (Wiley-VCH, 2008)
- M. Thomson, *Modern Particle Physics* (Cambridge University Press, 2013)
- M. E. Peskin and D. V. Schroeder, *An Introduction to Quantum Field Theory* (Addison-Wesley, 1995)
- F. Halzen and A. D. Martin, *Quarks and Leptons: An Introductory Course in Modern Particle Physics* (Wiley, 1984)

**Online lecture series**
- M. Peskin, *Standard Model Review*, PSI Lecture Series (Perimeter Institute for Theoretical Physics, 2010/2011) — pirsa.org

---

# Chapter 1: The Standard Model and Special Relativity

## What is Particle Physics?

Particle physics asks the most fundamental question that science can pose: what are the basic constituents of matter, and what forces govern their interactions? The enterprise is not merely taxonomic — it is not enough to list particles as a stamp collector lists stamps. The deeper goal is to find a mathematical framework, ideally a single unified one, that explains why the observed particles exist, why they carry the quantum numbers they do, and why the forces take the forms they do. That framework, assembled over roughly fifty years of theoretical insight and experimental discovery, is the **Standard Model of particle physics**.

The Standard Model describes three of the four known fundamental forces — electromagnetism, the weak nuclear force, and the strong nuclear force — and all known matter particles. It is a **quantum field theory**: each type of particle is a quantum of an underlying field that permeates all of space. Photons are quanta of the electromagnetic field, electrons are quanta of the electron field, and so on. The forces themselves are mediated by special particles called **gauge bosons**, whose existence is dictated by deep symmetry principles. The fourth force, gravity, is negligibly weak at particle-physics energies and is not incorporated into the Standard Model; its consistent quantum description remains one of the central unsolved problems in physics.

The matter content of the Standard Model divides into two families: **quarks** and **leptons**, each appearing in three generations of increasing mass. The first generation — up and down quarks, the electron, and the electron neutrino — makes up essentially all stable matter in the universe. The second and third generations are heavier, unstable copies that appear in high-energy collisions and cosmic rays. Why there are exactly three generations is one of many questions the Standard Model accommodates but does not explain.

The force carriers are: the **photon** \(\gamma\) (electromagnetism), the **\(W^\pm\) and \(Z^0\) bosons** (weak force), and eight **gluons** (strong force). In addition, the **Higgs boson**, discovered at CERN in 2012, is responsible for the mechanism that gives the \(W\) and \(Z\) bosons — and the matter fermions — their masses.

Understanding the Standard Model requires two foundational pillars: special relativity and quantum mechanics, fused into the framework of quantum field theory. We begin by reviewing the relativistic kinematics that underpins all of particle physics.

## Special Relativity: The Foundations

Einstein's special relativity (1905) rests on two postulates: the laws of physics are the same in all inertial frames, and the speed of light \(c\) in vacuum is the same in all inertial frames regardless of the motion of source or observer. From these two postulates, all of special relativity follows by logic.

The invariant quantity in special relativity is the **spacetime interval**. Given two events separated by coordinate differences \((\Delta t, \Delta x, \Delta y, \Delta z)\), the interval is

\[
s^2 = c^2 \Delta t^2 - \Delta x^2 - \Delta y^2 - \Delta z^2.
\]

This combination has the same value in every inertial frame. When \(s^2 > 0\) the interval is **timelike** — the two events can be causally connected, and there exists a frame where they occur at the same place. When \(s^2 < 0\) the interval is **spacelike** — no signal can travel between them, and there exists a frame where they are simultaneous. When \(s^2 = 0\) the interval is **lightlike** or **null** — the events are connected by a light ray.

### Lorentz Transformations

A **Lorentz transformation** is any transformation of spacetime coordinates that preserves the interval. For a boost along the \(x\)-axis with velocity \(v\),

\[
t' = \gamma\!\left(t - \frac{v x}{c^2}\right), \quad x' = \gamma(x - vt), \quad y' = y, \quad z' = z,
\]

where the **Lorentz factor** is

\[
\gamma = \frac{1}{\sqrt{1 - v^2/c^2}} = \frac{1}{\sqrt{1-\beta^2}}, \qquad \beta = \frac{v}{c}.
\]

Note that \(\gamma \geq 1\), with \(\gamma = 1\) only when \(v = 0\). As \(v \to c\), \(\gamma \to \infty\). The factor \(\gamma\) governs both **time dilation** (moving clocks run slow by \(\gamma\)) and **length contraction** (moving rods shrink by \(\gamma\)).

Two Lorentz transformations composed together give another Lorentz transformation. Together with spacetime translations, they form the **Poincaré group**, which is the full symmetry group of flat (Minkowski) spacetime.

### Four-Vectors and the Metric

It is enormously convenient to package spacetime coordinates into a single object. A **contravariant four-vector** is written with an upper index:

\[
x^\mu = (x^0, x^1, x^2, x^3) = (ct, x, y, z),
\]

where \(\mu = 0, 1, 2, 3\). The **Minkowski metric** \(\eta_{\mu\nu}\) with the mostly-minus signature convention is

\[
\eta_{\mu\nu} = \begin{pmatrix} 1 & 0 & 0 & 0 \\ 0 & -1 & 0 & 0 \\ 0 & 0 & -1 & 0 \\ 0 & 0 & 0 & -1 \end{pmatrix}.
\]

The metric lowers indices, producing a **covariant four-vector**:

\[
x_\mu = \eta_{\mu\nu} x^\nu = (ct, -x, -y, -z).
\]

The **Einstein summation convention** means repeated upper-lower index pairs are summed over \(\mu = 0,1,2,3\). The invariant interval is then written elegantly as

\[
s^2 = x^\mu x_\mu = \eta_{\mu\nu} x^\mu x^\nu = c^2 t^2 - \mathbf{x}^2.
\]

A general Lorentz transformation acts as \(x'^\mu = \Lambda^\mu{}_\nu x^\nu\), where the matrix \(\Lambda\) satisfies \(\Lambda^\mu{}_\rho \eta_{\mu\nu} \Lambda^\nu{}_\sigma = \eta_{\rho\sigma}\). This is the defining property of the Lorentz group.

### Energy-Momentum Four-Vector

The most important four-vector in particle physics is the **energy-momentum four-vector** (or four-momentum):

\[
p^\mu = \left(\frac{E}{c}, p_x, p_y, p_z\right) = \left(\frac{E}{c}, \mathbf{p}\right).
\]

For a particle of rest mass \(m\) moving with three-velocity \(\mathbf{v}\), the relativistic energy and momentum are

\[
E = \gamma mc^2, \qquad \mathbf{p} = \gamma m \mathbf{v}.
\]

The invariant magnitude of the four-momentum is

\[
p^\mu p_\mu = \frac{E^2}{c^2} - |\mathbf{p}|^2 = m^2 c^2.
\]

This is the fundamental **mass-shell relation**, often written as \(E^2 = (pc)^2 + (mc^2)^2\). It is Lorentz invariant: every inertial observer agrees on the rest mass \(m\) of a particle, even though they disagree on its energy and momentum individually.

Particle physicists almost universally employ **natural units** where \(\hbar = c = 1\). In natural units, energy, mass, and momentum all have the same dimension (usually GeV), lengths and times have dimensions of \(\text{GeV}^{-1}\), and the mass-shell relation simplifies to

\[
p^2 = p^\mu p_\mu = E^2 - |\mathbf{p}|^2 = m^2.
\]

Throughout these notes we use natural units unless stated otherwise.

### Mandelstam Variables

In a \(2 \to 2\) scattering process \(A + B \to C + D\), there are three Lorentz-invariant combinations of the four-momenta known as **Mandelstam variables**:

\[
s = (p_A + p_B)^2, \quad t = (p_A - p_C)^2, \quad u = (p_A - p_D)^2.
\]

These satisfy \(s + t + u = m_A^2 + m_B^2 + m_C^2 + m_D^2\). The variable \(s\) is the square of the total center-of-mass energy; \(\sqrt{s}\) is the **center-of-mass energy**. The variable \(t\) is the square of the four-momentum transfer, related to the scattering angle. Mandelstam variables are the natural language for writing scattering amplitudes in a manifestly Lorentz-covariant form.

## Relativistic Kinematics

### The Center-of-Mass Frame

In the **center-of-mass (CM) frame**, the total three-momentum is zero: \(\mathbf{p}_A + \mathbf{p}_B = 0\). This frame is the natural setting for analyzing collisions, since all the kinetic energy in the CM frame is available for particle production. The CM energy squared is

\[
s = (p_A + p_B)^2 = (E_A + E_B)^2 - |\mathbf{p}_A + \mathbf{p}_B|^2.
\]

In a fixed-target experiment where particle \(A\) hits a stationary target \(B\) (with \(\mathbf{p}_B = 0\) and \(E_B = m_B\)),

\[
s = m_A^2 + m_B^2 + 2 m_B E_A.
\]

This grows only as \(\sqrt{E_A}\) in the high-energy limit — a severe disadvantage compared to collider experiments, where both beams are boosted and \(s \approx 4 E_{\text{beam}}^2\) grows as the full beam energy. This is why modern high-energy experiments use colliders.

### Threshold Energies

The minimum energy required to produce a set of final-state particles equals the sum of their rest masses (all produced at rest in the CM frame). Setting \(\sqrt{s} = \sum_f m_f\) and solving for the beam energy gives the **threshold energy** for the reaction. For example, the threshold for producing a proton-antiproton pair in \(p + p \to p + p + p + \bar{p}\) is \(E_{\text{threshold}} = 7 m_p\) in the lab frame (with a proton target at rest).

### Decay Kinematics

For a particle of mass \(M\) decaying at rest into particles of masses \(m_1\) and \(m_2\), conservation of four-momentum gives the energies

\[
E_1 = \frac{M^2 + m_1^2 - m_2^2}{2M}, \qquad E_2 = \frac{M^2 + m_2^2 - m_1^2}{2M}.
\]

The decay products are emitted back-to-back with equal and opposite momenta. The magnitude of this momentum is

\[
|\mathbf{p}| = \frac{1}{2M}\lambda^{1/2}(M^2, m_1^2, m_2^2),
\]

where \(\lambda(a,b,c) = a^2 + b^2 + c^2 - 2ab - 2bc - 2ca\) is the Källén triangle function. Note that the decay is only kinematically possible if \(M > m_1 + m_2\).

# Chapter 2: Symmetries and Conservation Laws

## The Role of Symmetry in Physics

Perhaps no idea has been more productive in twentieth-century physics than the connection between symmetry and conservation laws. Emmy Noether proved in 1915 that every continuous symmetry of the action of a physical system corresponds to a conserved quantity. This theorem — **Noether's theorem** — elevated symmetry from a convenient organizational principle to a deep explanatory tool: we do not merely observe that momentum is conserved; we understand that it is conserved *because* the laws of physics are invariant under spatial translations.

In particle physics, this logic runs in both directions. We can start with observed conservation laws and deduce the symmetries of the underlying theory. Or, more powerfully, we can postulate symmetries and deduce what interactions must exist. The latter approach — often called the **gauge principle** — is the engine that drives the Standard Model.

## Groups and Representations

A **group** is a set \(G\) with a binary operation \(\cdot\) satisfying: closure (\(a,b \in G \Rightarrow a\cdot b \in G\)), associativity, existence of an identity element \(e\), and existence of inverses. A **Lie group** is a group that is also a smooth manifold, meaning the group operation depends smoothly on continuous parameters. Lie groups are precisely the mathematical objects underlying continuous symmetries.

The **representations** of a group are the ways the group can act on vector spaces. Given a group \(G\), a representation is a map \(\rho: G \to GL(V)\) (invertible linear maps on a vector space \(V\)) that respects the group structure: \(\rho(ab) = \rho(a)\rho(b)\). Different representations correspond to particles with different quantum numbers. The **fundamental representation** of \(SU(2)\) is two-dimensional (doublets, like the up-down quark pair), while the **adjoint representation** is three-dimensional (triplets, like the pion).

### The Lie Algebra

For a Lie group, the local structure near the identity is captured by its **Lie algebra** — the tangent space at the identity, equipped with a bracket operation. Elements of the Lie algebra are called **generators**. For a matrix Lie group, an element near the identity can be written as

\[
g = e^{i \theta^a T_a},
\]

where \(\theta^a\) are real parameters and \(T_a\) are the generators. The generators satisfy the commutation relations

\[
\left[T_a, T_b\right] = i f_{ab}{}^c T_c,
\]

where \(f_{ab}{}^c\) are the **structure constants** of the Lie algebra. These constants fully characterize the algebraic structure.

## The Rotation Group SO(3) and SU(2)

The rotation group in three dimensions, \(SO(3)\), consists of all \(3 \times 3\) real orthogonal matrices with determinant \(+1\). Its generators satisfy the familiar angular momentum algebra:

\[
\left[J_i, J_j\right] = i \epsilon_{ijk} J_k.
\]

The group \(SU(2)\) of \(2 \times 2\) unitary matrices with unit determinant has the same Lie algebra. The generators in the fundamental (spin-1/2) representation are \(T_i = \sigma_i/2\), where \(\sigma_i\) are the Pauli matrices:

\[
\sigma_1 = \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}, \quad \sigma_2 = \begin{pmatrix} 0 & -i \\ i & 0 \end{pmatrix}, \quad \sigma_3 = \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}.
\]

\(SU(2)\) is the **double cover** of \(SO(3)\): there is a 2-to-1 homomorphism from \(SU(2)\) onto \(SO(3)\). Physically, this means half-integer spin representations (spinors) are representations of \(SU(2)\) but not of \(SO(3)\) — they pick up a sign under a \(2\pi\) rotation. Electrons are described by spinors, and this double-valuedness is not a mathematical curiosity but a physical fact verified by neutron interferometry experiments.

## Noether's Theorem

<div class="theorem"><strong>Noether's Theorem.</strong> If the action \(S = \int d^4x\, \mathcal{L}(\phi, \partial_\mu \phi)\) is invariant under a continuous one-parameter family of transformations \(\phi \to \phi + \epsilon \,\delta\phi\), then there exists a conserved current \(j^\mu\) satisfying \(\partial_\mu j^\mu = 0\), and the associated charge \(Q = \int d^3x\, j^0\) is conserved: \(dQ/dt = 0\).</div>

The proof follows by applying the Euler-Lagrange equations. The conserved current is

\[
j^\mu = \frac{\partial \mathcal{L}}{\partial(\partial_\mu \phi)} \delta\phi.
\]

Let us verify the familiar examples. Under a spacetime translation \(x^\mu \to x^\mu + \epsilon^\mu\), the field shifts as \(\phi(x) \to \phi(x) - \epsilon^\mu \partial_\mu \phi\). The corresponding conserved current is the **energy-momentum tensor**

\[
T^{\mu\nu} = \frac{\partial \mathcal{L}}{\partial(\partial_\mu \phi)} \partial^\nu \phi - \eta^{\mu\nu} \mathcal{L}.
\]

Conservation of \(T^{\mu\nu}\) yields four conserved charges: the total energy \(E = \int d^3x\, T^{00}\) and the three components of total momentum \(P^i = \int d^3x\, T^{0i}\).

For a global internal symmetry \(\phi \to e^{i\alpha}\phi\) (with \(\alpha\) constant), the Noether current is the **electromagnetic current** \(j^\mu = i(\phi^* \partial^\mu \phi - \phi \partial^\mu \phi^*)\), and the conserved charge is the electric charge \(Q = \int d^3x\, j^0\).

## Conservation Laws in Particle Physics

Particle physics experiments have revealed a hierarchy of conservation laws. Some hold absolutely (to the precision of all experiments ever performed); others are only approximate, violated by specific interactions.

**Absolutely conserved quantities** include: energy-momentum (from spacetime translation invariance), electric charge (from \(U(1)_{\text{em}}\) gauge symmetry), angular momentum (from rotation invariance), baryon number \(B\) (empirically), and the three lepton numbers \(L_e, L_\mu, L_\tau\) (empirically, though neutrino oscillations show \(L_e - L_\mu\) is violated).

**Approximately conserved quantities** that hold in strong and electromagnetic interactions but are violated by the weak force include isospin, strangeness, charm, and the individual quark flavor numbers.

It is worth pausing on baryon number conservation. There is no known gauge symmetry that enforces it — it is an **accidental symmetry** of the Standard Model Lagrangian. Many extensions of the Standard Model (grand unified theories, for example) predict its violation at some level, leading to proton decay. The experimental lower bound on the proton lifetime, currently \(\tau_p > 10^{34}\) years from Super-Kamiokande, is one of the most stringent constraints on physics beyond the Standard Model.

## The Unitary Groups U(1), SU(2), SU(3)

The Standard Model's gauge group is \(SU(3)_c \times SU(2)_L \times U(1)_Y\). Understanding these groups is essential.

**\(U(1)\)** is the group of complex phases \(e^{i\alpha}\). It is abelian (all elements commute) and has a single generator. The corresponding gauge theory is electrodynamics.

**\(SU(2)\)** is the group of \(2\times 2\) unitary matrices with determinant 1. It has three generators and is non-abelian (generators do not commute). It describes the weak isospin symmetry.

**\(SU(3)\)** is the group of \(3\times 3\) unitary matrices with determinant 1. It has eight generators, the **Gell-Mann matrices** \(\lambda_a\) (\(a = 1,\ldots,8\)), satisfying

\[
\left[\frac{\lambda_a}{2}, \frac{\lambda_b}{2}\right] = i f_{abc} \frac{\lambda_c}{2}.
\]

The structure constants \(f_{abc}\) are totally antisymmetric. \(SU(3)\) is the gauge group of quantum chromodynamics (QCD), the theory of the strong force.

Non-abelian gauge groups are the key to understanding why the weak and strong forces behave so differently from electromagnetism. In an abelian theory like QED, photons do not carry electric charge and therefore do not interact with each other at tree level. In a non-abelian theory like QCD, gluons carry color charge and interact among themselves — producing phenomena like confinement and asymptotic freedom that have no electromagnetic analog.

# Chapter 3: Particle Classification

## A Zoology of Particles

The history of particle physics from the 1930s through the 1960s was largely a process of discovery and classification. Each new accelerator revealed new particles: pions, kaons, hyperons, resonances. By the early 1960s, the "particle zoo" had grown to dozens of hadrons, prompting Fermi's famous quip that if he could remember the names of all these particles, he would have become a botanist. The classification of this zoo — understanding which particles were fundamental and which were composite — was the central achievement of the quark model.

At the fundamental level, all particles in the Standard Model are either **fermions** (half-integer spin, obeying Fermi-Dirac statistics and the Pauli exclusion principle) or **bosons** (integer spin, obeying Bose-Einstein statistics). This distinction has profound physical consequences: fermions make up matter, while bosons mediate forces.

## Leptons

The **leptons** are spin-1/2 fermions that do not participate in the strong interaction. There are six leptons in three generations:

| Generation | Charged lepton | Neutrino |
|---|---|---|
| First | electron \(e^-\) | \(\nu_e\) |
| Second | muon \(\mu^-\) | \(\nu_\mu\) |
| Third | tau \(\tau^-\) | \(\nu_\tau\) |

Each charged lepton has a corresponding antiparticle with opposite charge. The neutrinos are electrically neutral and interact only via the weak force (and gravity). The electron has mass \(m_e = 0.511\) MeV, the muon \(m_\mu = 105.7\) MeV, and the tau \(m_\tau = 1777\) MeV.

Neutrino masses were long believed to be exactly zero — a prediction of the original Standard Model. The discovery of **neutrino oscillations** (SNO, Super-Kamiokande, circa 1998–2002) proved that neutrinos have nonzero masses and that the flavor eigenstates (\(\nu_e, \nu_\mu, \nu_\tau\)) are mixtures of the mass eigenstates. The mixing is described by the **Pontecorvo-Maki-Nakagawa-Sakata (PMNS) matrix**, the leptonic analog of the quark CKM matrix. Neutrino masses are known to be very small — below the eV scale — but their exact values and the question of whether neutrinos are Majorana particles (their own antiparticles) remain open.

## Quarks

The **quarks** are spin-1/2 fermions that participate in all three non-gravitational interactions. There are six quarks in three generations:

| Generation | Up-type quark | Down-type quark |
|---|---|---|
| First | up \(u\) | down \(d\) |
| Second | charm \(c\) | strange \(s\) |
| Third | top \(t\) | bottom \(b\) |

Quarks carry **fractional electric charge**: up-type quarks have charge \(+2/3\) and down-type quarks have charge \(-1/3\) (in units of the proton charge). They also carry **color charge** — a label taking three values (conventionally red, green, blue) — which is the source of the strong force. Free quarks are never observed; they are permanently confined inside **hadrons**.

Quark masses span an enormous range: the up and down quarks have masses of a few MeV (much smaller than the proton mass \(\sim 938\) MeV, illustrating that most of the proton's mass comes from the binding energy of gluons), while the top quark has mass \(m_t \approx 173\) GeV — comparable to a gold nucleus. The top quark is so heavy that it decays before it can hadronize, making it the only quark whose properties can be studied directly.

## Hadrons: Mesons and Baryons

**Hadrons** are color-neutral bound states of quarks held together by the strong force. They divide into two families:

**Baryons** are bound states of three quarks (\(qqq\)), each with a different color so the combination is color-neutral (colorless = "white"). The proton (\(uud\)) and neutron (\(udd\)) are the lightest baryons and the only stable ones. Baryons are fermions (spin 1/2 or 3/2), since three spin-1/2 quarks combine to give half-integer total spin.

**Mesons** are bound states of a quark-antiquark pair (\(q\bar{q}\)). The color charge of the quark is canceled by the anticolor of the antiquark. Mesons are bosons (integer spin). The pions \(\pi^+, \pi^0, \pi^-\) are the lightest mesons, with masses around 135–140 MeV. They play a special role as the Nambu-Goldstone bosons of spontaneous chiral symmetry breaking in QCD.

More exotic hadron configurations — **tetraquarks** (\(qq\bar{q}\bar{q}\)) and **pentaquarks** (\(qqqq\bar{q}\)) — are allowed by QCD and have been discovered experimentally by LHCb in recent years, confirming that the spectrum of hadrons is richer than the simple quark model suggests.

## Gauge Bosons

The **gauge bosons** are the force carriers, with spin 1:

- **Photon** \(\gamma\): mediates electromagnetism. Massless, electrically neutral. Range is infinite.
- **\(W^\pm\) bosons**: mediate charged weak interactions. Mass \(\approx 80.4\) GeV. The \(W^+\) carries charge \(+1\), the \(W^-\) carries charge \(-1\).
- **\(Z^0\) boson**: mediates neutral weak interactions. Mass \(\approx 91.2\) GeV. The finite mass of the \(W\) and \(Z\) gives the weak force its short range (\(\sim 10^{-18}\) m).
- **Gluons** \(g\): eight in total (one for each generator of \(SU(3)\)), mediate the strong force. Massless but confined, so the strong force has finite range despite massless mediators — confinement is the mechanism.
- **Graviton**: hypothetical spin-2 mediator of gravity, not in the Standard Model.

## The Higgs Boson

The **Higgs boson** \(H\) is a spin-0 (scalar) particle, the only fundamental scalar in the Standard Model. It is the quantum of the Higgs field, a doublet under \(SU(2)_L\) that acquires a nonzero **vacuum expectation value** \(v \approx 246\) GeV. This spontaneous symmetry breaking is the **Higgs mechanism**, which simultaneously gives the \(W\) and \(Z\) bosons their masses and generates the masses of quarks and leptons through **Yukawa couplings**. The Higgs was the last particle of the Standard Model to be discovered, found at the LHC by ATLAS and CMS in July 2012 with a mass of \(\approx 125\) GeV.

# Chapter 4: Discrete Symmetries — C, P, and T

## Parity

**Parity** \(P\) is the operation that reflects all spatial coordinates: \(\mathbf{x} \to -\mathbf{x}\). Under parity, vectors that depend on position change sign (**polar vectors**: \(\mathbf{x}, \mathbf{p}, \mathbf{E}\)), while axial vectors (pseudovectors) formed from cross products do not (\(\mathbf{L} = \mathbf{x} \times \mathbf{p}\), \(\mathbf{B}\)). Scalars are invariant, while **pseudoscalars** change sign.

For many years it was assumed that all physical laws are invariant under parity — that there is no fundamental distinction between left and right. This belief was shattered in 1956. Theoretical arguments by Lee and Yang pointed out that parity invariance had never been tested in weak interactions, and suggested specific experiments to check. The experiment of Wu et al. in 1957 studied the beta decay of polarized \(^{60}\)Co nuclei and found a striking angular asymmetry in the emitted electrons — the electrons were preferentially emitted opposite to the nuclear spin direction. This proved definitively that **the weak interaction violates parity**. Lee and Yang were awarded the Nobel Prize in 1957.

The degree of violation is maximal: the weak interaction couples only to **left-handed** fermions (negative helicity) and **right-handed** antifermions. The concept of **chirality** formalizes this: the left-handed and right-handed projections of a Dirac spinor are \(\psi_L = \frac{1-\gamma^5}{2}\psi\) and \(\psi_R = \frac{1+\gamma^5}{2}\psi\), where \(\gamma^5 = i\gamma^0\gamma^1\gamma^2\gamma^3\). The \(W\) bosons couple exclusively to \(\psi_L\), making the weak interaction **maximally parity-violating**.

## Charge Conjugation

**Charge conjugation** \(C\) replaces every particle with its antiparticle. Electric charge, baryon number, and lepton number all change sign under \(C\), while mass, spin, and momentum are unchanged. For a particle to be a \(C\) eigenstate, it must be its own antiparticle — which requires it to be electrically neutral. The photon, for instance, has \(C = -1\) (since the electromagnetic field reverses when all charges are negated), and a state of \(n\) photons has \(C = (-1)^n\).

Like parity, charge conjugation is violated by the weak interaction. Again, this can be understood from chirality: the weak force couples to left-handed fermions, and charge conjugation turns left-handed particles into left-handed antiparticles, which do not couple to the \(W\) boson. So charge conjugation alone is violated maximally by the weak interaction.

## CP Symmetry and Its Violation

Although \(C\) and \(P\) are each separately violated by the weak interaction, it was initially expected that the combined transformation **CP** might still be a good symmetry. CP turns a left-handed particle into a right-handed antiparticle, and since both particles and antiparticles should exist and interact symmetrically, CP invariance seemed plausible.

In 1964, Cronin and Fitch discovered **CP violation** in the neutral kaon system. The kaon system provides a beautiful quantum mechanical example of mixing: the neutral kaons \(K^0 = d\bar{s}\) and \(\bar{K}^0 = \bar{d}s\) mix through weak interactions, forming mass eigenstates \(K_L\) and \(K_S\). If CP were conserved, \(K_L\) would be a pure CP = -1 eigenstate and could only decay to three pions. Cronin and Fitch observed \(K_L \to \pi^+\pi^-\) (a CP = +1 final state) at the level of 0.2%, a small but definitive CP violation. They received the Nobel Prize in 1980.

CP violation has since been observed more dramatically in B meson systems and confirmed in D meson systems. In the Standard Model, CP violation in the quark sector arises from a single complex phase in the **CKM mixing matrix** — a beautifully economical mechanism.

CP violation is of profound cosmological importance: the observed matter-antimatter asymmetry of the universe — the fact that we live in a world of matter, not a mixture of matter and antimatter — requires CP violation (along with C violation and departure from thermal equilibrium, per the **Sakharov conditions**). The amount of CP violation in the Standard Model is, however, far too small to explain the observed asymmetry, pointing to new sources of CP violation beyond the Standard Model.

## CPT Symmetry

The combined operation of charge conjugation, parity, and time reversal — **CPT** — is believed to be an exact symmetry of any local, Lorentz-invariant quantum field theory. This is the content of the **CPT theorem**, proven by Pauli, Lüders, and others. CPT symmetry implies that particles and antiparticles have exactly equal masses and lifetimes and equal but opposite charges and magnetic moments.

Since CP is violated, CPT invariance requires that T (time reversal) is also violated by the weak interaction. T violation has been directly observed in the kaon system (CPLEAR experiment at CERN) and in the B system (BaBar experiment at SLAC). Time reversal in quantum mechanics is an antiunitary operation (it involves complex conjugation of the state), making its analysis more subtle than that of the other discrete symmetries.

# Chapter 5: Accelerators and Detectors

## Particle Accelerators

To study particles at short distances, we must collide them at high energies — this follows from the uncertainty principle, \(\Delta x \sim \hbar / \Delta p\). The history of particle accelerators is a history of ever-increasing energy and luminosity, driven by the desire to probe smaller distances and produce heavier particles.

The two broad categories of accelerator are **fixed-target** machines and **colliders**. In a fixed-target experiment, a single accelerated beam strikes a stationary target. As we computed in Chapter 1, the available center-of-mass energy grows only as \(\sqrt{E_{\text{beam}}}\) in this case. In a collider, two beams are accelerated in opposite directions and brought to collision; the CM energy grows as \(2E_{\text{beam}}\). Colliders are therefore far more efficient at achieving high CM energies.

### Linear vs. Circular Accelerators

**Linear accelerators (linacs)** accelerate particles in a straight line using a series of resonant RF (radio-frequency) cavities. Each cavity provides a kick of energy to the particle as it passes through. Linacs avoid the energy loss from synchrotron radiation that plagues circular machines, making them optimal for electron acceleration. The Stanford Linear Accelerator (SLAC), at 3 km long, accelerated electrons to 50 GeV.

**Circular accelerators** bend the beam with magnetic dipole fields, allowing the beam to pass through the accelerating cavities many times. Proton synchrotrons — the Tevatron at Fermilab (1 TeV protons), and the Large Hadron Collider at CERN (6.8 TeV protons in current operation) — use this principle. The key challenge for circular electron machines is **synchrotron radiation**: relativistic electrons emit radiation when accelerated, losing energy proportional to \(\gamma^4/R\) per revolution (where \(R\) is the radius). This is why LEP (the Large Electron-Positron Collider) needed to be 27 km in circumference to reach 100 GeV.

The **LHC** at CERN is currently the world's most powerful particle accelerator, with a circumference of 27 km and proton-proton collisions at \(\sqrt{s} = 13.6\) TeV. It has two general-purpose experiments (ATLAS and CMS), one B-physics experiment (LHCb), and one heavy-ion experiment (ALICE).

### Luminosity

The **luminosity** \(\mathcal{L}\) of a collider measures the rate of collisions per unit cross section:

\[
\frac{dN}{dt} = \mathcal{L} \sigma,
\]

where \(\sigma\) is the cross section for a given process. High luminosity is crucial for studying rare processes. The LHC design luminosity is \(\mathcal{L} = 10^{34}\ \text{cm}^{-2}\text{s}^{-1}\). The **integrated luminosity** \(\int \mathcal{L}\, dt\) is measured in inverse femtobarns (fb\(^{-1}\)); 1 fb\(^{-1} = 10^{39}\ \text{cm}^{-2}\).

## Particle Detectors

A particle physics detector is an instrument designed to measure the properties — energy, momentum, charge, identity — of particles produced in a collision. Modern detectors are onion-like structures, with different layers dedicated to measuring different properties.

### Tracking Systems

The innermost layer is typically a **tracking detector**, which records the positions of charged particles as they pass through, allowing the trajectory to be reconstructed. In a magnetic field \(\mathbf{B}\), charged particles follow helical paths; the radius of curvature \(r = p/(qB)\) determines the momentum. Silicon strip detectors and pixel detectors offer excellent spatial resolution (\(\sim\)10–100 \(\mu\)m). Time projection chambers (TPCs) fill a volume with gas and measure the ionization trails left by charged particles.

### Calorimeters

**Calorimeters** measure the total energy of a particle by stopping it and measuring the resulting shower. **Electromagnetic calorimeters** (ECAL) measure electrons and photons through electromagnetic showers (pairs of \(e^+e^-\) from photon conversion, bremsstrahlung radiation). **Hadronic calorimeters** (HCAL) measure hadrons through nuclear interactions. The energy resolution of calorimeters typically scales as \(\sigma_E/E \sim a/\sqrt{E} \oplus b\) where \(\oplus\) denotes addition in quadrature and \(b\) is a constant term from systematic effects.

### Muon Systems

Muons are **minimum-ionizing particles** at typical collider energies — they pass through the calorimeters depositing little energy. The outermost layer of a detector is dedicated to muon identification, using drift tubes or resistive plate chambers positioned outside the iron return yoke of the magnet.

### Particle Identification

Different particles leave characteristic signatures: electrons leave tracks and ECAL showers; photons leave ECAL showers but no tracks; muons leave tracks with little calorimeter energy deposition; pions and protons leave hadronic showers; neutrinos are invisible (inferred from missing transverse energy). Combining information from all subsystems allows particle identification. **\(b\)-tagging** — identifying jets from bottom quark decays by the presence of a displaced vertex (since \(B\) mesons travel \(\sim\)1 mm before decaying) — is crucial for Higgs physics and top quark measurements.

# Chapter 6: Scattering Theory and Cross Sections

## The Scattering Matrix

The central object in particle physics calculations is the **S-matrix** (scattering matrix). Given an initial state \(|i\rangle\) of incoming particles prepared long before the collision, the S-matrix gives the amplitude for the system to be found in a final state \(|f\rangle\) long after the collision:

\[
\langle f | S | i \rangle = S_{fi}.
\]

The diagonal part (\(f = i\)) corresponds to no scattering; we separate it by writing \(S = 1 + iT\), where \(T\) is the **transition matrix**. We then define the **invariant matrix element** \(\mathcal{M}\) by

\[
\langle f | iT | i \rangle = i\mathcal{M}(i \to f) \cdot (2\pi)^4 \delta^{(4)}\!\left(\sum p_i - \sum p_f\right),
\]

where the delta function enforces overall four-momentum conservation. Computing \(\mathcal{M}\) using Feynman rules is the main technical task of quantum field theory calculations.

## Fermi's Golden Rule and Decay Rates

For a particle at rest decaying to final state \(f\), the **partial decay rate** is given by

\[
d\Gamma = \frac{1}{2M} |\mathcal{M}|^2 d\Phi_f,
\]

where \(d\Phi_f\) is the Lorentz-invariant phase space measure for the final state:

\[
d\Phi_f = \left(\prod_j \frac{d^3 p_j}{(2\pi)^3 2E_j}\right) (2\pi)^4 \delta^{(4)}\!\left(P - \sum_j p_j\right).
\]

The **total decay rate** \(\Gamma = \sum_f \Gamma_f\) is related to the particle's **lifetime** by \(\tau = 1/\Gamma\). The **branching ratio** for a particular decay mode is \(\text{BR}(f) = \Gamma_f / \Gamma$.

For a two-body decay in the rest frame of the parent, the phase space simplifies considerably. With \(M \to 1 + 2\), integrating over the delta function leaves

\[
\Gamma = \frac{|\mathbf{p}|}{8\pi M^2} |\mathcal{M}|^2,
\]

where \(|\mathbf{p}|\) is the CM momentum computed earlier.

## Cross Sections

The **cross section** \(\sigma\) for a \(2 \to f\) scattering process is defined as the transition rate per unit flux of incoming particles, per target particle:

\[
d\sigma = \frac{1}{F} |\mathcal{M}|^2 d\Phi_f,
\]

where \(F = 4\sqrt{(p_A \cdot p_B)^2 - m_A^2 m_B^2}\) is the Lorentz-invariant flux factor. In the CM frame with \(\mathbf{p}_A = -\mathbf{p}_B \equiv \mathbf{p}\), this simplifies to \(F = 4|\mathbf{p}|\sqrt{s}\).

The **differential cross section** \(d\sigma/d\Omega\) gives the distribution of final-state particles as a function of the scattering angle. Integrating over all angles gives the **total cross section** \(\sigma\). In the CM frame for \(2\to 2\) scattering with equal masses,

\[
\frac{d\sigma}{d\Omega} = \frac{|\mathcal{M}|^2}{64\pi^2 s}.
\]

Cross sections are measured in units of area. The natural unit in particle physics is the **barn**: \(1\text{ b} = 10^{-24}\ \text{cm}^2\). Typical hadronic cross sections at collider energies are on the order of millibarns; electroweak processes are in the nanobarn to picobarn range; rare processes like Higgs production can be in the femtobarn range.

## Optical Theorem

The **optical theorem** relates the total cross section to the forward scattering amplitude:

\[
\sigma_{\text{tot}} = \frac{1}{F} \text{Im}\, \mathcal{M}(i \to i),
\]

where \(\mathcal{M}(i \to i)\) is the amplitude for forward elastic scattering. This is a consequence of unitarity of the S-matrix: \(S^\dagger S = 1\).

# Chapter 7: A Scalar Toy Theory

## Motivation

Before tackling the full machinery of quantum field theory for spin-1/2 and spin-1 particles, it is instructive to work through a simple **scalar field theory** — a theory of spin-0 particles. This stripped-down context lets us understand the structure of perturbation theory, Feynman diagrams, and cross-section calculations without the algebraic complexity of spinors and gauge fields.

## The Klein-Gordon Field

The equation of motion for a free relativistic scalar field \(\phi(x)\) of mass \(m\) is the **Klein-Gordon equation**:

\[
\left(\partial^\mu \partial_\mu + m^2\right)\phi = (\Box + m^2)\phi = 0,
\]

where \(\Box = \partial_t^2 - \nabla^2\) is the d'Alembertian. This follows from the Euler-Lagrange equation for the Lagrangian density

\[
\mathcal{L} = \frac{1}{2}\partial_\mu \phi \partial^\mu \phi - \frac{1}{2}m^2 \phi^2.
\]

The plane-wave solutions are \(\phi \sim e^{\pm ip\cdot x}\) with \(p^2 = m^2\), confirming the mass-shell relation.

## Interactions: \(\phi^3\) and \(\phi^4\) Theory

The free scalar theory is exactly solvable but boring — particles pass through each other without interaction. To introduce interactions, we add potential terms to the Lagrangian. The most common choices are:

\[
\mathcal{L}_{\text{int}} = -\frac{\lambda}{3!}\phi^3 \quad \text{or} \quad \mathcal{L}_{\text{int}} = -\frac{\lambda}{4!}\phi^4.
\]

The coupling constant \(\lambda\) controls the strength of the interaction. These interaction terms lead to vertices in the Feynman diagram expansion. In a \(\phi^3\) theory, there is a three-particle vertex; in \(\phi^4\) theory, there is a four-particle vertex. The factor of \(1/3!\) or \(1/4!\) in the Lagrangian is canceled by the \(3!\) or \(4!\) ways of permuting identical fields at the vertex, yielding a simple vertex factor of \(-i\lambda\) in Feynman rules.

## The Feynman Propagator

The **propagator** for a scalar particle is the Green's function of the Klein-Gordon equation:

\[
\Delta_F(p) = \frac{i}{p^2 - m^2 + i\epsilon},
\]

where the \(i\epsilon\) prescription (with \(\epsilon \to 0^+\) understood) specifies the correct contour for time-ordered products. In position space, the propagator \(\Delta_F(x-y) = \langle 0 | T\{\phi(x)\phi(y)\} | 0\rangle\) is the amplitude for a particle to propagate from \(y\) to \(x\). In momentum space, each internal line in a Feynman diagram contributes a factor of \(i/(p^2 - m^2 + i\epsilon)\).

## Feynman Rules for the Toy Theory

The **Feynman rules** are a set of prescriptions for translating Feynman diagrams into mathematical expressions for \(\mathcal{M}\). For a \(\phi^3\) scalar theory with coupling \(\lambda\):

1. Draw all connected Feynman diagrams with the given external lines, to the desired order in \(\lambda\).
2. For each external line (incoming or outgoing particle), write a factor of 1 (for scalars).
3. For each internal (virtual) line with momentum \(k\), write the propagator \(i/(k^2 - m^2 + i\epsilon)\).
4. For each three-point vertex, write \(-i\lambda\).
5. For each internal loop, integrate \(\int d^4k/(2\pi)^4\) over the undetermined loop momentum.
6. Divide by the **symmetry factor** of the diagram.

The resulting expression, summed over all diagrams at the given order in \(\lambda\), is \(i\mathcal{M}\). The matrix element \(|\mathcal{M}|^2\) then feeds into the cross-section formula.

At lowest order (tree level), there are no loops. At next order (one loop), the integrals over loop momenta often diverge — these **ultraviolet divergences** are handled by the procedure of **renormalization**, which we discuss in the context of QED.

### Example: \(\phi + \phi \to \phi + \phi\) Scattering

In \(\phi^3\) theory, the lowest-order contribution to \(2 \to 2\) scattering comes at order \(\lambda^2\). There are three Feynman diagrams (called \(s\)-, \(t\)-, and \(u\)-channel diagrams), corresponding to the three Mandelstam channels. In each, two external vertices are connected by a single internal propagator. The \(s\)-channel amplitude is

\[
i\mathcal{M}_s = (-i\lambda)^2 \frac{i}{s - m^2},
\]

and similarly for \(t\) and \(u\) channels (with \(s \to t\) or \(u\)). The total amplitude is the sum of all three.

# Chapter 8: Wave Equations and the Dirac Equation

## Motivating the Dirac Equation

The Klein-Gordon equation \((\Box + m^2)\phi = 0\) is second-order in time derivatives. Schrödinger's equation is first-order. Dirac sought an equation that was first-order in both space and time derivatives (to treat them on equal footing as relativity demands) and whose solutions would describe spin-1/2 particles.

He wrote the ansatz

\[
(i\gamma^\mu \partial_\mu - m)\psi = 0,
\]

and asked: what must the objects \(\gamma^\mu\) be for this to imply \((\Box + m^2)\psi = 0\)? Applying \((i\gamma^\mu \partial_\mu + m)\) to the left yields

\[
-\gamma^\mu \gamma^\nu \partial_\mu \partial_\nu \psi - m^2 \psi = 0.
\]

For this to equal \(-(\Box + m^2)\psi = -(\partial^\mu\partial_\mu + m^2)\psi\), we need

\[
\gamma^\mu \gamma^\nu \partial_\mu \partial_\nu = \frac{1}{2}\{\gamma^\mu, \gamma^\nu\} \partial_\mu \partial_\nu = \partial^\mu \partial_\mu,
\]

which requires the **Clifford algebra** condition:

\[
\{\gamma^\mu, \gamma^\nu\} \equiv \gamma^\mu \gamma^\nu + \gamma^\nu \gamma^\mu = 2\eta^{\mu\nu}.
\]

This cannot be satisfied by ordinary numbers — the \(\gamma^\mu\) must be matrices. The smallest dimension in which the Clifford algebra can be realized is \(4 \times 4\). Thus \(\psi\) must be a four-component object called a **Dirac spinor**.

## The Gamma Matrices

In the **Dirac representation**, the gamma matrices are

\[
\gamma^0 = \begin{pmatrix} \mathbf{1} & 0 \\ 0 & -\mathbf{1} \end{pmatrix}, \qquad \gamma^i = \begin{pmatrix} 0 & \sigma^i \\ -\sigma^i & 0 \end{pmatrix},
\]

where \(\mathbf{1}\) is the \(2\times 2\) identity and \(\sigma^i\) are the Pauli matrices. Another common choice is the **Weyl (chiral) representation**:

\[
\gamma^0 = \begin{pmatrix} 0 & \mathbf{1} \\ \mathbf{1} & 0 \end{pmatrix}, \qquad \gamma^i = \begin{pmatrix} 0 & \sigma^i \\ -\sigma^i & 0 \end{pmatrix}.
\]

In either representation, \((\gamma^0)^\dagger = \gamma^0\) and \((\gamma^i)^\dagger = -\gamma^i\). The fifth gamma matrix is

\[
\gamma^5 = i\gamma^0\gamma^1\gamma^2\gamma^3,
\]

which satisfies \(\{\gamma^5, \gamma^\mu\} = 0\) and \((\gamma^5)^2 = 1\). The projection operators \(P_L = (1-\gamma^5)/2\) and \(P_R = (1+\gamma^5)/2\) project onto left-handed and right-handed Weyl spinors.

## Solutions to the Dirac Equation

For a free particle with four-momentum \(p^\mu\), the plane-wave solutions take the form \(\psi = u(p)e^{-ip\cdot x}\) (positive frequency, particle) or \(\psi = v(p)e^{+ip\cdot x}\) (negative frequency, antiparticle). The spinors \(u\) and \(v\) satisfy the momentum-space Dirac equations:

\[
(\slashed{p} - m)u(p) = 0, \qquad (\slashed{p} + m)v(p) = 0,
\]

where we use the Feynman slash notation \(\slashed{p} = \gamma^\mu p_\mu\). For each four-momentum \(p^\mu\) on the mass shell, there are two linearly independent solutions for \(u\) (spin up and spin down) and two for \(v\).

The **Dirac conjugate** spinor is \(\bar{\psi} = \psi^\dagger \gamma^0\). The completeness relations

\[
\sum_s u^s(p)\bar{u}^s(p) = \slashed{p} + m, \qquad \sum_s v^s(p)\bar{v}^s(p) = \slashed{p} - m,
\]

where the sums are over spin states \(s\), are essential in computing spin-summed/averaged matrix elements.

## Spinor Bilinears and the Dirac Lagrangian

The Dirac Lagrangian is

\[
\mathcal{L}_{\text{Dirac}} = \bar{\psi}(i\slashed{\partial} - m)\psi.
\]

From this, the Euler-Lagrange equation for \(\bar{\psi}\) immediately gives the Dirac equation. The Noether current from the global \(U(1)\) symmetry \(\psi \to e^{i\alpha}\psi\) is

\[
j^\mu = \bar{\psi}\gamma^\mu\psi,
\]

which gives a positive-definite charge density \(j^0 = \bar{\psi}\gamma^0\psi = \psi^\dagger\psi \geq 0\). This resolves the negative-probability problem of the Klein-Gordon equation interpreted as a single-particle wave equation.

The various **Dirac bilinears** \(\bar{\psi}\Gamma\psi\), where \(\Gamma\) is a combination of gamma matrices, transform as definite representations of the Lorentz group:

| Bilinear | Structure | Transformation |
|---|---|---|
| \(\bar{\psi}\psi\) | scalar | scalar |
| \(\bar{\psi}\gamma^\mu\psi\) | vector | four-vector |
| \(\bar{\psi}\gamma^\mu\gamma^\nu\psi\) | tensor | antisymmetric tensor |
| \(\bar{\psi}\gamma^\mu\gamma^5\psi\) | axial vector | pseudovector |
| \(\bar{\psi}\gamma^5\psi\) | pseudoscalar | pseudoscalar |

These bilinears appear throughout particle physics: the electromagnetic current is a vector current, the weak charged current is a combination of vector and axial-vector currents (\(V - A\) structure), and Yukawa couplings to the Higgs involve scalar bilinears.

# Chapter 9: Gauge Invariance and QED

## The Gauge Principle

The transition from a global symmetry to a local (gauge) symmetry is one of the most powerful ideas in physics. Starting from the free Dirac Lagrangian

\[
\mathcal{L} = \bar{\psi}(i\slashed{\partial} - m)\psi,
\]

which is invariant under the global \(U(1)\) transformation \(\psi \to e^{i\alpha}\psi\) (with constant \(\alpha\)), we ask: can we make \(\alpha\) depend on position, \(\alpha = \alpha(x)\)?

Under \(\psi \to e^{i\alpha(x)}\psi\), the kinetic term transforms as

\[
\bar{\psi}i\slashed{\partial}\psi \to \bar{\psi}i\slashed{\partial}\psi - \bar{\psi}\gamma^\mu\psi\, \partial_\mu\alpha,
\]

which is not invariant because of the derivative acting on the position-dependent phase. To restore invariance, we introduce a **gauge field** \(A_\mu(x)\) and replace the ordinary derivative with the **covariant derivative**:

\[
\partial_\mu \to D_\mu = \partial_\mu - ieA_\mu,
\]

where \(e\) is the electric charge. Simultaneously, we require \(A_\mu\) to transform as

\[
A_\mu \to A_\mu + \frac{1}{e}\partial_\mu\alpha.
\]

Under both transformations together, the covariant derivative transforms as \(D_\mu\psi \to e^{i\alpha(x)}D_\mu\psi\), and the Lagrangian \(\bar{\psi}(i\slashed{D} - m)\psi\) is indeed invariant.

The **field strength tensor** of the gauge field is

\[
F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu,
\]

which is gauge invariant (the gauge transformation cancels). Adding the kinetic term for the gauge field \(-\frac{1}{4}F_{\mu\nu}F^{\mu\nu}\), we obtain the full **QED Lagrangian**:

\[
\mathcal{L}_{\text{QED}} = \bar{\psi}(i\slashed{D} - m)\psi - \frac{1}{4}F_{\mu\nu}F^{\mu\nu}.
\]

This is the complete, exact Lagrangian of quantum electrodynamics — derived purely from the requirement of local \(U(1)\) gauge invariance. The interaction term is \(e\bar{\psi}\gamma^\mu\psi A_\mu\), coupling the electromagnetic current to the photon field. The gauge principle has generated the interaction.

## The Photon Propagator and Gauge Fixing

The equation of motion for \(A_\mu\) derived from \(\mathcal{L}_{\text{QED}}\) is

\[
\partial^\nu F_{\mu\nu} = e\bar{\psi}\gamma_\mu\psi,
\]

which is the inhomogeneous Maxwell equation (in covariant form). In vacuum, the source-free equation \(\partial^\nu F_{\mu\nu} = 0\) gives \((\Box g_{\mu\nu} - \partial_\mu\partial_\nu)A^\nu = 0\).

However, this operator is not invertible — it has zero modes corresponding to gauge transformations. To define the photon propagator, we must **fix the gauge**. In **Lorenz gauge** \(\partial^\mu A_\mu = 0\), the propagator in momentum space is

\[
D_{\mu\nu}(k) = \frac{-ig_{\mu\nu}}{k^2 + i\epsilon}.
\]

More generally, in **\(R_\xi\) gauges** (the Feynman gauge is \(\xi = 1\)):

\[
D_{\mu\nu}(k) = \frac{-i}{k^2 + i\epsilon}\left(g_{\mu\nu} - (1-\xi)\frac{k_\mu k_\nu}{k^2}\right).
\]

Physical amplitudes are independent of \(\xi\) — the gauge-dependent terms cancel when summed over all Feynman diagrams.

## Feynman Rules for QED

The Feynman rules for QED are:

**Propagators:**
- Fermion: \(i(\slashed{p} + m)/(p^2 - m^2 + i\epsilon)\)
- Photon (Feynman gauge): \(-ig_{\mu\nu}/(k^2 + i\epsilon)\)

**Vertex:**
- \(e\bar{\psi}\gamma^\mu\psi A_\mu\): gives vertex factor \(-ie\gamma^\mu\)

**External lines:**
- Incoming fermion \(u(p)\); outgoing fermion \(\bar{u}(p)\)
- Incoming antifermion \(\bar{v}(p)\); outgoing antifermion \(v(p)\)
- Incoming photon \(\epsilon_\mu(k)\); outgoing photon \(\epsilon^*_\mu(k)\)

At each vertex, four-momentum is conserved. The sign convention for fermion lines must be consistent with Wick's theorem; overall minus signs for fermion loops (one factor of \(-1\) per closed fermion loop).

The **fine structure constant** \(\alpha = e^2/(4\pi) \approx 1/137\) is the QED expansion parameter. Since \(\alpha \ll 1\), perturbation theory in powers of \(\alpha\) (i.e., loop order) converges well. Each vertex contributes \(\sqrt{\alpha}\) to the amplitude, so an \(n\)-vertex diagram contributes at order \(\alpha^{n/2}\) to the amplitude and order \(\alpha^n\) to the cross section.

## QED Processes at Tree Level

### Electron-Positron Annihilation: \(e^+e^- \to \mu^+\mu^-\)

This process proceeds at lowest order through a single diagram: the \(e^+\) and \(e^-\) annihilate into a virtual photon, which then produces a \(\mu^+\mu^-\) pair. The amplitude is

\[
i\mathcal{M} = \bar{v}(p_2)(-ie\gamma^\mu)u(p_1) \cdot \frac{-ig_{\mu\nu}}{q^2} \cdot \bar{u}(k_1)(-ie\gamma^\nu)v(k_2),
\]

where \(q = p_1 + p_2\) is the photon four-momentum with \(q^2 = s\). Squaring, summing over final spins, and averaging over initial spins (a factor of 1/4 for two spin-1/2 particles), using the trace technology for gamma matrices, one obtains

\[
\overline{|\mathcal{M}|^2} = \frac{8e^4}{s^2}\left[(p_1 \cdot k_1)(p_2 \cdot k_2) + (p_1 \cdot k_2)(p_2 \cdot k_1) + m_\mu^2 s/2\right].
\]

In the high-energy limit \(\sqrt{s} \gg m_\mu\), the total cross section is

\[
\sigma(e^+e^- \to \mu^+\mu^-) = \frac{4\pi\alpha^2}{3s},
\]

which is the benchmark **"point cross section"** for QED. It falls as \(1/s\), which is the expected behavior for a dimensionful cross section with a dimensionless coupling.

### Compton Scattering: \(e\gamma \to e\gamma\)

Compton scattering \(\gamma + e^- \to \gamma + e^-\) has two Feynman diagrams at lowest order (called the \(s\)-channel and \(u\)-channel diagrams), with the electron propagator in different orderings. The result, summed and averaged over polarizations and spins, is the **Klein-Nishina formula**. In the low-energy limit, this reduces to the classical Thomson cross section \(\sigma = 8\pi\alpha^2/(3m_e^2)\).

## Trace Technology

Computing spin-summed QED amplitudes systematically requires evaluating traces of products of gamma matrices. The key identities are:

\[
\text{Tr}[\gamma^\mu \gamma^\nu] = 4\eta^{\mu\nu},
\]

\[
\text{Tr}[\gamma^\mu \gamma^\nu \gamma^\rho \gamma^\sigma] = 4(\eta^{\mu\nu}\eta^{\rho\sigma} - \eta^{\mu\rho}\eta^{\nu\sigma} + \eta^{\mu\sigma}\eta^{\nu\rho}),
\]

\[
\text{Tr}[\text{odd number of } \gamma\text{'s}] = 0,
\]

\[
\text{Tr}[\gamma^5] = 0, \quad \text{Tr}[\gamma^\mu\gamma^\nu\gamma^5] = 0, \quad \text{Tr}[\gamma^\mu\gamma^\nu\gamma^\rho\gamma^\sigma\gamma^5] = 4i\epsilon^{\mu\nu\rho\sigma}.
\]

These identities, combined with the contraction identities such as \(\gamma^\mu\gamma_\mu = 4\), \(\gamma^\mu\slashed{a}\gamma_\mu = -2\slashed{a}\), and \(\gamma^\mu\slashed{a}\slashed{b}\gamma_\mu = 4a\cdot b\), allow the systematic computation of any QED amplitude.

# Chapter 10: Renormalization and Testing QED

## Ultraviolet Divergences

Loop diagrams in QED produce integrals over all values of the loop momentum, extending to arbitrarily large (ultraviolet) values. These integrals are generally divergent. For example, the one-loop correction to the photon propagator (the **vacuum polarization**) involves

\[
\Pi^{\mu\nu}(q) \sim \int \frac{d^4k}{(2\pi)^4} \frac{\text{Tr}\left[\gamma^\mu(\slashed{k}+m)\gamma^\nu(\slashed{k}+\slashed{q}+m)\right]}{(k^2 - m^2)((k+q)^2-m^2)},
\]

which diverges logarithmically. The one-loop correction to the electron propagator (the **self-energy**) diverges linearly.

The procedure for handling these divergences is **renormalization**. The key insight is that the parameters appearing in the Lagrangian — the "bare" mass \(m_0\), charge \(e_0\), and field normalization — are not directly observable. What we measure are the physical (**renormalized**) mass and charge. The UV-divergent loop corrections shift the relationship between bare and renormalized parameters, and by choosing the counterterms appropriately, one can absorb all divergences into a redefinition of the physical parameters.

## Dimensional Regularization

To make the divergent integrals mathematically well-defined during intermediate steps, we use **dimensional regularization**: we evaluate loop integrals in \(d = 4 - 2\epsilon\) dimensions (with \(\epsilon \to 0\) at the end). In \(d\) dimensions, \(\int d^dk/(k^2 - \Delta)^n\) is finite for suitable \(n\) and can be expressed in terms of \(\Gamma\) functions. Divergences appear as poles in \(\epsilon\): \(1/\epsilon\) for logarithmic divergences, \(1/\epsilon^2\) for quadratic divergences. These poles are then canceled by counterterms.

Dimensional regularization preserves gauge invariance and Lorentz invariance, making it the preferred method in modern calculations.

## Running Coupling and the Renormalization Group

Renormalization introduces a **renormalization scale** \(\mu\) — the scale at which counterterms are defined. Physical observables must be independent of \(\mu\), which leads to the **renormalization group equation** (RGE):

\[
\mu \frac{d\alpha}{d\mu} = \beta(\alpha),
\]

where the **beta function** \(\beta\) describes how the coupling constant changes with scale. In QED at one loop,

\[
\beta(\alpha) = \frac{2\alpha^2}{3\pi} + O(\alpha^3) > 0.
\]

The positive beta function means the QED coupling **increases** with energy scale — the "running" of the fine structure constant. At low energies, \(\alpha \approx 1/137\); at the \(Z\) boson mass scale, \(\alpha(m_Z) \approx 1/128\). This running has been measured precisely at LEP.

Physically, running of the coupling is understood as **vacuum polarization**: virtual electron-positron pairs screen the bare charge, so the effective charge seen by a probe decreases at long distances (low energies) and increases at short distances (high energies).

## Precision Tests of QED

QED is the most precisely tested theory in physics. The most stringent test is the **anomalous magnetic moment of the electron**. A Dirac electron in a magnetic field has a magnetic moment \(\mu = g \cdot e/(2m_e) \cdot \mathbf{S}\) with \(g = 2\). Loop corrections give a small deviation:

\[
a_e = \frac{g - 2}{2} = \frac{\alpha}{2\pi} - 0.328\frac{\alpha^2}{\pi^2} + \cdots
\]

The current theoretical prediction (computed to five loops) and experimental measurement agree to better than one part in \(10^{12}\), making this the most precise test of any physical theory.

The **anomalous magnetic moment of the muon**, \(a_\mu = (g_\mu - 2)/2\), has attracted intense attention because of a persistent discrepancy between the Standard Model prediction and experiment. The **Muon \(g-2\)** experiment at Fermilab (2021) confirmed a \(\sim 4\sigma\) discrepancy, which may be the first experimental hint of physics beyond the Standard Model (though theoretical uncertainties from hadronic contributions complicate the interpretation).

## The Lamb Shift

Another precision test of QED is the **Lamb shift**: a splitting between the \(2s_{1/2}\) and \(2p_{1/2}\) energy levels of hydrogen, which are degenerate in the Dirac theory. The splitting arises from vacuum polarization, the electron self-energy, and the anomalous magnetic moment at one loop. The measured Lamb shift of 1057 MHz was first explained by Bethe (1947) using a prototype renormalization calculation, marking the birth of modern QFT.

# Chapter 11: The Strong Interaction and QCD

## From Nuclei to Quarks

The strong force was originally understood as the force that holds nucleons together in the nucleus. Yukawa (1935) proposed that this force is mediated by pions — particles with mass \(\sim 140\) MeV — predicting a range of \(\sim \hbar/(m_\pi c) \approx 1.4\) fm. The discovery of the pion by Powell in 1947 confirmed this picture.

However, the discovery of many strongly interacting particles in the 1950s and 60s demanded a deeper understanding. The key insight came from Gell-Mann and Zweig (1964), who proposed that all hadrons are composed of more fundamental particles: **quarks**. The original quark model contained three quarks (\(u\), \(d\), \(s\)) — the charm quark was proposed theoretically in 1970 (GIM mechanism) and discovered in 1974 (the "November Revolution").

## Color and QCD

A critical problem with the quark model was the \(\Delta^{++}\) baryon. Its quark content is \(uuu\) (three up quarks) with all spins aligned (spin 3/2) and in the ground state (orbital angular momentum 0). The wavefunction is completely symmetric under exchange of any two quarks — in apparent violation of the Pauli exclusion principle for fermions.

The resolution is a new quantum number: **color charge**. Each quark carries one of three color charges (red, green, blue). Antiquarks carry anticolor. The \(\Delta^{++}\) wavefunction is antisymmetric in color (the three quarks have different colors, and the color wavefunction is the totally antisymmetric \(\epsilon_{abc}\)), resolving the statistics problem.

**Quantum chromodynamics (QCD)** is the gauge theory of the color interaction, based on the group \(SU(3)_c\). The QCD Lagrangian is

\[
\mathcal{L}_{\text{QCD}} = \sum_f \bar{q}_f(i\slashed{D} - m_f)q_f - \frac{1}{4}G^a_{\mu\nu}G^{a\mu\nu},
\]

where \(f\) runs over quark flavors, the covariant derivative is \(D_\mu = \partial_\mu - ig_s T^a A^a_\mu\) (with \(T^a = \lambda^a/2\) the \(SU(3)\) generators and \(A^a_\mu\) the eight gluon fields), and the non-abelian field strength is

\[
G^a_{\mu\nu} = \partial_\mu A^a_\nu - \partial_\nu A^a_\mu + g_s f^{abc} A^b_\mu A^c_\nu.
\]

The last term — absent in QED — arises because gluons carry color charge and therefore interact with each other. Three-gluon and four-gluon vertices are fundamental features of QCD with no electromagnetic analogs.

## Asymptotic Freedom

The QCD beta function, computed by Gross, Politzer, and Wilczek in 1973 (Nobel Prize 2004), is

\[
\beta(g_s) = -\frac{g_s^3}{16\pi^2}\left(\frac{11}{3}N_c - \frac{2}{3}N_f\right) + O(g_s^5),
\]

where \(N_c = 3\) is the number of colors and \(N_f\) is the number of active quark flavors. For \(N_f < 33/2 = 16.5\), the beta function is negative, meaning the strong coupling \(\alpha_s = g_s^2/(4\pi)\) **decreases** with increasing energy. This remarkable property is called **asymptotic freedom**: at very high energies (short distances), quarks and gluons interact weakly and can be treated as nearly free particles.

The running of \(\alpha_s\) is given by (at one loop)

\[
\alpha_s(\mu^2) = \frac{\alpha_s(\mu_0^2)}{1 + \frac{\alpha_s(\mu_0^2)}{2\pi}\left(\frac{11}{3}N_c - \frac{2}{3}N_f\right)\ln(\mu^2/\mu_0^2)}.
\]

At \(\mu = m_Z = 91.2\) GeV, \(\alpha_s \approx 0.118\); at \(\mu = 1\) GeV, \(\alpha_s \approx 0.5\). The scale at which \(\alpha_s\) becomes of order 1 defines \(\Lambda_{\text{QCD}} \approx 200\) MeV — the fundamental scale of QCD below which perturbation theory breaks down.

## Confinement and Hadronization

At low energies, the strong coupling is large and quarks are **confined**: they cannot be isolated as free particles. The mechanism of confinement is not fully understood analytically, but is well-established empirically and supported by lattice QCD calculations.

The confining potential between a quark-antiquark pair is approximately

\[
V(r) \approx -\frac{4}{3}\frac{\alpha_s}{r} + \kappa r,
\]

where the first term is the Coulomb-like one-gluon exchange and the second term, with string tension \(\kappa \approx 0.18\) GeV\(^2\), represents the linear confinement. When the pair is separated beyond \(\sim 1\) fm, the energy stored in the color flux tube is sufficient to produce a new \(q\bar{q}\) pair from the vacuum — the string "breaks" and two hadrons emerge. This **hadronization** process ensures that only color-neutral hadrons are observed in detectors.

When a high-energy quark is produced in a collision, it undergoes a cascade of gluon emission and \(q\bar{q}\) pair production, eventually forming a collimated spray of hadrons called a **jet**. Jet physics is a crucial tool for probing QCD and searching for new particles.

## The Quark Model and SU(3) Flavor Symmetry

If the up, down, and strange quarks were exactly degenerate in mass, QCD would have an exact \(SU(3)_f\) flavor symmetry (not to be confused with the gauge \(SU(3)_c\)). In reality, the \(u\) and \(d\) quarks are nearly degenerate (\(m_u \approx 2.2\) MeV, \(m_d \approx 4.7\) MeV) and the strange quark is heavier (\(m_s \approx 95\) MeV), so \(SU(3)_f\) is approximate.

Under \(SU(3)_f\), the three quarks \((u,d,s)\) transform as the fundamental representation **3**. The antiquarks transform as **\(\bar{3}\)**. Mesons (\(q\bar{q}\)) live in

\[
\mathbf{3} \otimes \bar{\mathbf{3}} = \mathbf{8} \oplus \mathbf{1},
\]

an octet and a singlet. The **pseudoscalar meson octet** contains the three pions, four kaons, and the eta. The **vector meson octet** contains the rho, K*, and omega/phi. The singlet is the \(\eta'\).

Baryons (\(qqq\)) live in

\[
\mathbf{3} \otimes \mathbf{3} \otimes \mathbf{3} = \mathbf{10} \oplus \mathbf{8} \oplus \mathbf{8} \oplus \mathbf{1}.
\]

The spin-3/2 baryon **decuplet** contains the \(\Delta(1232)\) resonances, \(\Sigma^*(1385)\), \(\Xi^*(1530)\), and the \(\Omega^-\) (all three quarks strange, spin 3/2). Gell-Mann's prediction of the \(\Omega^-\) from the missing corner of the decuplet (1961), confirmed experimentally in 1964, was a decisive triumph of the \(SU(3)\) classification.

## Gell-Mann-Okubo Mass Formula

The \(SU(3)_f\) flavor symmetry is broken by the strange quark mass. Treating the symmetry breaking as a first-order perturbation, one can derive the **Gell-Mann-Okubo mass formula** for the baryon octet:

\[
2(m_N + m_\Xi) = 3m_\Lambda + m_\Sigma,
\]

which is satisfied to within a few percent by the measured baryon masses. For the meson octet (using \(m^2\)):

\[
3m_\eta^2 = 4m_K^2 - m_\pi^2,
\]

also in good agreement with experiment.

# Chapter 12: Weak Interactions

## Beta Decay and Fermi Theory

The first hint of a new kind of force came from radioactive beta decay, the process in which a neutron in a nucleus converts to a proton with emission of an electron: \(n \to p + e^- + \bar{\nu}_e\). The continuous spectrum of electron energies (observed by Ellis and Wooster in 1927) puzzled physicists for years. Pauli proposed in 1930 that a light neutral particle — the neutrino — was also emitted, carrying some of the energy.

Fermi (1934) formulated the first quantitative theory of beta decay, inspired by the structure of QED. He proposed a four-fermion contact interaction:

\[
\mathcal{L}_{\text{Fermi}} = -\frac{G_F}{\sqrt{2}} \left(\bar{p}\gamma^\mu n\right)\left(\bar{e}\gamma_\mu \nu_e\right) + \text{h.c.},
\]

where \(G_F = 1.166 \times 10^{-5}\ \text{GeV}^{-2}\) is the **Fermi constant**. This theory successfully described the beta-decay spectrum. However, the dimension of \(G_F\) (it has mass dimension \(-2\)) signals that Fermi theory is not renormalizable — it is an effective low-energy description of a more fundamental theory.

## V-A Structure of the Weak Interaction

After the discovery of parity violation, Marshak and Sudarshan (1957) and Feynman and Gell-Mann (1958) proposed that the weak interaction has **V-A structure**: the coupling is to the vector current minus the axial-vector current:

\[
J^\mu_{\text{weak}} = \bar{\psi}\gamma^\mu\frac{1-\gamma^5}{2}\psi = \bar{\psi}\gamma^\mu P_L \psi.
\]

This is a purely left-handed current, coupling only to left-handed fermions (and right-handed antifermions). The V-A structure automatically produces maximal parity violation and explains the Wu experiment.

The Fermi theory updated with V-A structure becomes

\[
\mathcal{L} = -\frac{G_F}{\sqrt{2}} \left(\bar{\nu}_e \gamma^\mu P_L e\right)\left(\bar{u} \gamma_\mu P_L d\right) + \text{h.c.}
\]

This correctly describes muon decay \(\mu^- \to e^- \bar{\nu}_e \nu_\mu\), pion decay \(\pi^- \to \mu^- \bar{\nu}_\mu\), and nuclear beta decays. But it still fails as a fundamental theory: the cross section for \(\nu e \to \nu e\) scattering grows as \(G_F^2 s\), violating unitarity above \(\sqrt{s} \sim G_F^{-1/2} \approx 300\) GeV. The Fermi theory must be replaced by a renormalizable gauge theory at high energies.

## The \(W\) Boson

The resolution of Fermi theory's unitarity problems is that the four-fermion contact interaction is not fundamental — it arises from the exchange of a massive charged vector boson, the \(W\). At low energies \((q^2 \ll m_W^2)\), the \(W\) propagator \(1/(q^2 - m_W^2) \approx -1/m_W^2\) reduces the exchange to a point interaction, reproducing Fermi theory with \(G_F/\sqrt{2} = g^2/(8m_W^2)\).

The \(W^\pm\) bosons mediate **charged current** weak interactions (changing electric charge by \(\pm 1\)). The \(Z^0\) boson mediates **neutral current** interactions (no charge change). Neutral current weak interactions were predicted by the electroweak theory and discovered at CERN's Gargamelle bubble chamber in 1973 — a major confirmation of the theory before the \(W\) and \(Z\) themselves were discovered.

## Quark Flavor Mixing: The CKM Matrix

In the quark sector, the weak charged current couples the up-type quarks to the down-type quarks, but not to the mass eigenstates directly. The **Cabibbo-Kobayashi-Maskawa (CKM) matrix** \(V_{\text{CKM}}\) relates the weak eigenstates \((d', s', b')\) to the mass eigenstates \((d, s, b)\):

\[
\begin{pmatrix} d' \\ s' \\ b' \end{pmatrix} = \begin{pmatrix} V_{ud} & V_{us} & V_{ub} \\ V_{cd} & V_{cs} & V_{cb} \\ V_{td} & V_{ts} & V_{tb} \end{pmatrix} \begin{pmatrix} d \\ s \\ b \end{pmatrix}.
\]

The CKM matrix is unitary (\(V^\dagger V = 1\)) and can be parameterized by three mixing angles and one CP-violating phase. Experimentally, the matrix is nearly diagonal (quarks prefer to mix within generations), with the off-diagonal elements suppressed by powers of the **Cabibbo angle** \(\theta_C \approx 13°\) (or \(\lambda \approx 0.225\) in the Wolfenstein parameterization).

The CP-violating phase is responsible for all CP violation observed in meson systems within the Standard Model. The **unitarity triangle** — a geometric representation of one of the unitarity conditions \(V_{ud}V_{ub}^* + V_{cd}V_{cb}^* + V_{td}V_{tb}^* = 0\) — has been measured with precision at the B factories (BaBar, Belle) and is consistent with a single CKM phase, placing stringent constraints on new physics.

# Chapter 13: Electroweak Unification

## The Glashow-Salam-Weinberg Model

The unification of electromagnetic and weak interactions into a single gauge theory was achieved by Glashow (1961), Salam (1968), and Weinberg (1967), earning them the Nobel Prize in 1979. The **electroweak theory** is a gauge theory based on the group \(SU(2)_L \times U(1)_Y\), where \(L\) denotes left-handed and \(Y\) is **weak hypercharge**.

The gauge fields are: three \(SU(2)_L\) gauge bosons \(W^1_\mu, W^2_\mu, W^3_\mu\) with coupling \(g\), and one \(U(1)_Y\) gauge boson \(B_\mu\) with coupling \(g'\).

The matter fields organize into left-handed doublets and right-handed singlets under \(SU(2)_L\):

\[
L_L = \begin{pmatrix}\nu_e \\ e^-\end{pmatrix}_L, \quad e_R, \quad Q_L = \begin{pmatrix}u \\ d\end{pmatrix}_L, \quad u_R, \quad d_R.
\]

Right-handed neutrinos are absent in the minimal Standard Model (since neutrino masses were not known). The hypercharge assignments are fixed by requiring the correct electric charges via the Gell-Mann-Nishijima formula:

\[
Q = T_3 + \frac{Y}{2},
\]

where \(T_3\) is the third component of weak isospin.

## Spontaneous Symmetry Breaking

A critical problem: the \(W\) and \(Z\) bosons are massive, but explicit mass terms for gauge bosons violate gauge invariance. The resolution is the **Higgs mechanism** — a form of spontaneous symmetry breaking (SSB) that generates masses while preserving the gauge symmetry of the Lagrangian.

We introduce a **Higgs doublet** \(\Phi\):

\[
\Phi = \begin{pmatrix}\phi^+ \\ \phi^0\end{pmatrix},
\]

a complex doublet under \(SU(2)_L\) with hypercharge \(Y = 1\). Its contribution to the Lagrangian is

\[
\mathcal{L}_{\text{Higgs}} = (D_\mu\Phi)^\dagger(D^\mu\Phi) - V(\Phi),
\]

where the covariant derivative is \(D_\mu = \partial_\mu - ig\frac{\sigma^a}{2}W^a_\mu - i\frac{g'}{2}B_\mu\), and the **Mexican hat potential** is

\[
V(\Phi) = -\mu^2 \Phi^\dagger\Phi + \lambda(\Phi^\dagger\Phi)^2.
\]

For \(\mu^2 > 0\) and \(\lambda > 0\), the potential has a minimum not at \(\Phi = 0\) but on the circle

\[
|\Phi|^2 = \frac{\mu^2}{2\lambda} \equiv \frac{v^2}{2},
\]

where \(v = \mu/\sqrt{\lambda}\) is the **vacuum expectation value (vev)**. We choose the ground state (vacuum) along the neutral component:

\[
\langle \Phi \rangle = \frac{1}{\sqrt{2}}\begin{pmatrix} 0 \\ v \end{pmatrix}.
\]

This choice preserves \(U(1)_{\text{em}}\) (which acts on the neutral component as multiplication by a phase) but breaks \(SU(2)_L \times U(1)_Y \to U(1)_{\text{em}}\).

## The Higgs Mechanism and Gauge Boson Masses

Expanding the Higgs field around the vacuum: \(\Phi = (1/\sqrt{2})(0, v + h)^T\), where \(h\) is the physical Higgs field. Substituting into the kinetic term of the Higgs Lagrangian generates mass terms for the gauge bosons. The mass eigenstates and their masses are:

**Charged \(W\) bosons**:
\[
W^\pm_\mu = \frac{1}{\sqrt{2}}(W^1_\mu \mp i W^2_\mu), \qquad m_W = \frac{gv}{2}.
\]

**Neutral \(Z\) boson** (orthogonal combination of \(W^3\) and \(B\)):
\[
Z_\mu = \cos\theta_W W^3_\mu - \sin\theta_W B_\mu, \qquad m_Z = \frac{v}{2}\sqrt{g^2 + g'^2} = \frac{m_W}{\cos\theta_W}.
\]

**Photon** (orthogonal combination, remains massless):
\[
A_\mu = \sin\theta_W W^3_\mu + \cos\theta_W B_\mu, \qquad m_A = 0.
\]

The **weak mixing angle** (Weinberg angle) is defined by

\[
\cos\theta_W = \frac{g}{\sqrt{g^2+g'^2}}, \qquad \sin\theta_W = \frac{g'}{\sqrt{g^2+g'^2}}.
\]

The electric charge is \(e = g\sin\theta_W = g'\cos\theta_W\). The measured value is \(\sin^2\theta_W \approx 0.231\).

The **\(\rho\) parameter**:

\[
\rho = \frac{m_W^2}{m_Z^2 \cos^2\theta_W} = 1
\]

at tree level in the Standard Model — a consequence of the Higgs being in a doublet representation. This prediction (\(\rho = 1\)) is strongly confirmed experimentally.

## The Goldstone Theorem and the Higgs Field

Before symmetry breaking, the Higgs doublet has four degrees of freedom (two complex components). The vacuum breaks \(SU(2)_L \times U(1)_Y\) (four generators) to \(U(1)_{\text{em}}\) (one generator), so three generators are broken. By **Goldstone's theorem**, each broken continuous symmetry produces a massless scalar **Nambu-Goldstone boson**.

In the Higgs mechanism, these three Goldstone bosons are "eaten" by the \(W^\pm\) and \(Z^0\) — they become the longitudinal polarization modes of the massive gauge bosons. (Massive spin-1 particles have three polarizations; massless photons have only two.) The remaining single degree of freedom is the physical **Higgs boson** \(h\), with mass

\[
m_h = \sqrt{2\lambda}\,v = \sqrt{2}\,\mu.
\]

The Higgs vev is determined by the Fermi constant: \(v = (\sqrt{2}G_F)^{-1/2} \approx 246\) GeV. With \(m_h \approx 125\) GeV, one finds \(\lambda \approx 0.13\).

## Fermion Masses from Yukawa Couplings

In the Standard Model, fermion masses cannot come from explicit mass terms — a mass term \(m\bar{\psi}\psi = m(\bar{\psi}_R\psi_L + \bar{\psi}_L\psi_R)\) mixes left-handed and right-handed fields, but they transform differently under \(SU(2)_L\) (doublet vs. singlet), making such a term non-gauge-invariant.

Masses arise from **Yukawa couplings** to the Higgs:

\[
\mathcal{L}_{\text{Yukawa}} = -y_e \bar{L}_L \Phi e_R - y_u \bar{Q}_L \tilde\Phi u_R - y_d \bar{Q}_L \Phi d_R + \text{h.c.},
\]

where \(\tilde\Phi = i\sigma^2 \Phi^*\) is the conjugate doublet. After SSB, \(\Phi \to (0, (v+h)/\sqrt{2})^T\), and the Yukawa terms give

\[
m_f = \frac{y_f v}{\sqrt{2}}.
\]

The fermion mass is proportional to the Yukawa coupling \(y_f\). Since masses range from \(m_e \approx 0.5\) MeV to \(m_t \approx 173\) GeV, the Yukawa couplings span five orders of magnitude — from \(y_e \approx 3 \times 10^{-6}\) to \(y_t \approx 1\). Why this hierarchy exists is the **flavor puzzle**, one of the major open problems in particle physics.

The top Yukawa coupling \(y_t \approx 1\) is not a small number — it suggests that the top quark may play a special role in electroweak symmetry breaking, a possibility explored in many BSM scenarios.

# Chapter 14: Testing Electroweak Theory and the Higgs

## Electroweak Precision Measurements

The electroweak theory has been tested with extraordinary precision, particularly at the Large Electron-Positron Collider (LEP) at CERN, which ran from 1989 to 2000. LEP collided electrons and positrons at center-of-mass energies near the \(Z\) pole (\(\sqrt{s} \approx m_Z = 91.2\) GeV), producing \(Z\) bosons in huge quantities (\(\sim 17\) million \(Z\) decays at LEP-1).

The **\(Z\) lineshape** — the cross section for \(e^+e^- \to Z \to f\bar{f}\) as a function of \(\sqrt{s}\) — is a Breit-Wigner resonance:

\[
\sigma_f(s) = \frac{12\pi}{m_Z^2} \frac{\Gamma_{ee}\Gamma_{ff}}{(s - m_Z^2)^2 + m_Z^2 \Gamma_Z^2},
\]

where \(\Gamma_{ff}\) is the partial width for \(Z \to f\bar{f}\). The total width \(\Gamma_Z = \sum_f \Gamma_{ff} \approx 2.49\) GeV. By measuring \(\Gamma_Z\) and the invisible width (from \(Z \to \nu\bar\nu\)), LEP determined that there are **exactly three light neutrino generations** with mass below \(m_Z/2\):

\[
N_\nu = \frac{\Gamma_{\text{inv}}}{\Gamma_{\nu\bar\nu}^{\text{SM}}} = 2.9840 \pm 0.0082.
\]

This beautifully constrains the number of generations — a result of profound importance.

### The \(\rho\) Parameter and Oblique Corrections

Quantum loop corrections modify the tree-level relations between \(m_W\), \(m_Z\), \(G_F\), and \(\alpha\). The leading corrections are **oblique** (self-energy) corrections, parameterized by the Peskin-Takeuchi \(S\), \(T\), \(U\) parameters. The \(T\) parameter is particularly sensitive to isospin-breaking mass splittings: the top-bottom doublet with \(m_t \gg m_b\) gives a large contribution proportional to \(m_t^2\). By 1994, precision electroweak fits predicted \(m_t \approx 170\) GeV before the top was directly discovered at the Tevatron in 1995 at \(m_t = 176 \pm 8\) GeV — a stunning triumph of the quantum theory.

## Discovery of the Higgs Boson

The Higgs boson was the last undiscovered particle of the Standard Model until July 4, 2012, when both the ATLAS and CMS collaborations at the LHC announced its discovery with combined significance exceeding \(5\sigma\). The Higgs mass is \(m_h = 125.09 \pm 0.24\) GeV.

At the LHC, the dominant Higgs production mechanism is **gluon-gluon fusion** (\(gg \to H\) via a top quark loop), followed by vector boson fusion (\(qq \to qqH\) via \(WW\) or \(ZZ\) fusion), and associated production (\(q\bar{q} \to WH, ZH\)). The discovery channels were:
- \(H \to ZZ^* \to 4\ell\) ("four-lepton golden channel"): clean signal, fully reconstructed
- \(H \to \gamma\gamma\): narrow mass peak over continuum background (loop-induced decay via \(W\) and top loops)
- \(H \to WW^* \to \ell\nu\ell\nu\): large rate but missing neutrinos

Since discovery, Higgs couplings to \(W\), \(Z\), \(\tau\), \(b\), \(\mu\), and \(t\) have all been measured and found consistent with Standard Model predictions at the 10–20% level.

## Higgs Self-Coupling and the Shape of the Potential

The shape of the Higgs potential determines the nature of electroweak symmetry breaking. The trilinear Higgs self-coupling \(\lambda_{hhh} = 6\lambda v = 3m_h^2/v\) (in the SM) is currently being probed through **di-Higgs production** (\(gg \to HH\)), which is extremely rare (cross section \(\sim 30\) fb at 13 TeV). Measuring the self-coupling tests whether the Higgs mechanism is indeed responsible for the electroweak phase transition and whether the early universe underwent a first-order transition (relevant for electroweak baryogenesis).

# Chapter 15: Beyond the Standard Model

## Problems with the Standard Model

The Standard Model is extraordinarily successful — it correctly predicts results across an enormous range of energies and processes, with no confirmed experimental deviation. Yet it cannot be the final theory. Several observations and theoretical considerations demand physics beyond the Standard Model (BSM):

**Neutrino masses.** The observation of neutrino oscillations proves that neutrinos have nonzero masses and mix. The minimal Standard Model has massless neutrinos (no right-handed neutrino, no Majorana mass term). Extending the model requires new fields and possibly new energy scales.

**Dark matter.** Cosmological and astrophysical observations — galaxy rotation curves, gravitational lensing, the cosmic microwave background — all require that about 27% of the universe's energy density consists of "dark matter" that interacts gravitationally but not electromagnetically and has no counterpart in the Standard Model. The most-studied candidate is a **weakly interacting massive particle (WIMP)** with mass in the range 10 GeV – 10 TeV.

**Baryon asymmetry.** As discussed in Chapter 4, the Sakharov conditions for baryogenesis require CP violation in excess of what the CKM mechanism provides.

**Gravity.** The Standard Model does not incorporate gravity. At the Planck scale \(M_{\text{Pl}} = \sqrt{\hbar c / G_N} \approx 1.2 \times 10^{19}\) GeV, quantum gravitational effects become important.

**The hierarchy problem.** The Higgs boson mass receives quantum corrections from loops. The top quark loop contributes

\[
\delta m_h^2 \sim -\frac{3y_t^2}{8\pi^2}\Lambda^2,
\]

where \(\Lambda\) is the UV cutoff. If the Standard Model is valid up to the Planck scale (\(\Lambda \sim M_{\text{Pl}}\)), then \(\delta m_h^2 \sim (10^{18}\ \text{GeV})^2\), which must be canceled to one part in \(10^{32}\) to give the observed \(m_h \approx 125\) GeV. This extraordinary fine-tuning is called the **hierarchy problem** and strongly suggests new physics near the TeV scale.

## Supersymmetry

**Supersymmetry (SUSY)** is an extension of the Poincaré algebra that relates bosons and fermions. Each Standard Model particle has a **superpartner** differing by half a unit of spin: quarks have scalar squarks, gluons have fermionic gluinos, the Higgs has fermionic higgsinos. In a supersymmetric theory, the quadratic divergences in \(\delta m_h^2\) are exactly canceled between fermion and boson loops (they enter with opposite signs), solving the hierarchy problem.

The **Minimal Supersymmetric Standard Model (MSSM)** is the simplest supersymmetric extension. It predicts a rich spectrum of new particles, the lightest of which (the **lightest supersymmetric particle**, LSP) is stable (if R-parity is conserved) and provides a natural dark matter candidate.

SUSY has not been discovered at the LHC. Searches for squarks and gluinos set lower limits on their masses above 1–2 TeV, requiring some fine-tuning and weakening the motivation for SUSY as a solution to the hierarchy problem.

## Grand Unification

The three Standard Model coupling constants — \(\alpha_1 = (5/3)\alpha/\cos^2\theta_W\) for \(U(1)_Y\), \(\alpha_2 = \alpha/\sin^2\theta_W\) for \(SU(2)_L\), and \(\alpha_s\) for \(SU(3)_c\) — all run with energy. Extrapolating the running using renormalization group equations, they appear to nearly converge near \(10^{15}\) GeV — the **GUT scale**. This hints at a **Grand Unified Theory (GUT)** in which the three forces merge into a single force at high energies.

The simplest GUT is \(SU(5)\) (Georgi-Glashow, 1974), which embeds \(SU(3) \times SU(2) \times U(1)\) into a single simple group. \(SU(5)\) predicts **proton decay**: \(p \to e^+ \pi^0\) with a lifetime \(\tau_p \sim m_{\text{GUT}}^4 / m_p^5 \sim 10^{30}\) years. This is ruled out by Super-Kamiokande, which requires \(\tau(p \to e^+\pi^0) > 1.6 \times 10^{34}\) years. More sophisticated GUTs based on \(SO(10)\) or \(E_6\), with supersymmetry, predict longer proton lifetimes consistent with current bounds.

In \(SO(10)\) GUTs, each generation of quarks and leptons (including the right-handed neutrino) fits neatly into a single 16-dimensional representation — a beautiful unification of matter.

## The Seesaw Mechanism

The **seesaw mechanism** provides an elegant explanation for the smallness of neutrino masses. We introduce heavy right-handed neutrinos \(N_R\) with a large Majorana mass \(M \gg v\). The mass matrix for the neutrinos (in the (\(\nu_L, N_R\)) basis) is

\[
\mathcal{M}_\nu = \begin{pmatrix} 0 & m_D \\ m_D & M \end{pmatrix},
\]

where \(m_D = y_\nu v/\sqrt{2}\) is the Dirac mass. Diagonalizing for \(M \gg m_D\) gives a light eigenvalue \(m_\nu \approx m_D^2/M\) and a heavy eigenvalue \(\approx M\). As \(M\) increases, \(m_\nu\) decreases — hence "seesaw". With \(m_D \sim m_t \sim 100\) GeV and \(M \sim 10^{14}\) GeV, one gets \(m_\nu \sim 10^{-2}\) eV, naturally in the range implied by oscillation data.

## Extra Dimensions and Other BSM Scenarios

The **Randall-Sundrum model** (1999) proposes that the hierarchy between the Planck scale and the electroweak scale arises because gravity propagates in an extra warped dimension while Standard Model fields are confined to a 4D brane. The warping generates an exponential hierarchy, explaining the huge ratio \(M_{\text{Pl}}/m_W \sim 10^{16}\) without fine-tuning.

**Composite Higgs models** propose that the Higgs is not fundamental but a bound state of new strongly-coupled dynamics at the TeV scale — analogous to the pion as a Goldstone boson of chiral symmetry breaking. The lightness of the Higgs relative to the strong dynamics scale is natural if it is a pseudo-Goldstone boson.

As of 2026, no definitive BSM signal has been observed at the LHC, pushing many models to higher masses or smaller couplings. The field awaits the high-luminosity LHC program (HL-LHC), future colliders (FCC, ILC, CEPC), and precision experiments to guide the next step.

# Chapter 16: Summary — The Standard Model as a Whole

## The Full Standard Model Lagrangian

The complete Standard Model Lagrangian is often written schematically as

\[
\mathcal{L}_{\text{SM}} = \mathcal{L}_{\text{gauge}} + \mathcal{L}_{\text{matter}} + \mathcal{L}_{\text{Higgs}} + \mathcal{L}_{\text{Yukawa}}.
\]

Each term has a precise form dictated by the gauge symmetry \(SU(3)_c \times SU(2)_L \times U(1)_Y\) and the particle content. The gauge kinetic terms are

\[
\mathcal{L}_{\text{gauge}} = -\frac{1}{4}G^a_{\mu\nu}G^{a\mu\nu} - \frac{1}{4}W^i_{\mu\nu}W^{i\mu\nu} - \frac{1}{4}B_{\mu\nu}B^{\mu\nu}.
\]

The matter kinetic terms (with covariant derivatives encoding all gauge interactions) are

\[
\mathcal{L}_{\text{matter}} = i\bar{Q}_L\slashed{D}Q_L + i\bar{u}_R\slashed{D}u_R + i\bar{d}_R\slashed{D}d_R + i\bar{L}_L\slashed{D}L_L + i\bar{e}_R\slashed{D}e_R,
\]

summed over all three generations. The Higgs sector provides masses for the gauge bosons, and the Yukawa sector provides masses for fermions.

## What the Standard Model Explains

With a modest number of free parameters (about 19 in the minimal model — three gauge couplings, six quark masses, three lepton masses, three CKM angles and a phase, the Higgs mass and vev, and the QCD theta parameter), the Standard Model accounts for:

- The existence and properties of all observed elementary particles
- All electromagnetic phenomena (QED)
- The radioactive beta decay spectrum, muon decay, pion decay (weak interactions)
- Parity violation and CP violation in weak decays
- The masses of the \(W\) and \(Z\) bosons (predicted before discovery)
- The \(Z\) lineshape and the number of neutrino generations
- Deep inelastic scattering structure functions (QCD)
- Jet production and fragmentation
- The Higgs boson mass and couplings
- The anomalous magnetic moments of \(e\) and \(\mu\) (to extraordinary precision)
- The running of the coupling constants

This is an astonishing achievement — a compact mathematical framework describing all known non-gravitational phenomena from the scale of nuclei (\(\sim 10^{-15}\) m) down to the shortest distances probed by the LHC (\(\sim 10^{-20}\) m).

## Open Questions

The Standard Model does not explain:
- The origin of the three generations
- The hierarchy of fermion masses (flavor puzzle)
- The origin of CP violation beyond the CKM mechanism (baryogenesis)
- The nature of dark matter
- Neutrino masses and the PMNS mixing pattern
- The strong CP problem (why \(\theta_{\text{QCD}} < 10^{-10}\))
- The incorporation of gravity
- The hierarchy problem / naturalness of the Higgs mass

These questions define the frontier of particle physics research. Their resolution will require new ideas, new experiments, and perhaps a new conceptual framework as profound as gauge theory itself.

<div class="definition"><strong>The Standard Model Particle Content (Summary).</strong>

<strong>Matter fermions</strong> (spin-1/2):
<ul>
<li>Quarks: \(u, d\) (gen. 1); \(c, s\) (gen. 2); \(t, b\) (gen. 3) — each in 3 colors</li>
<li>Leptons: \(e, \nu_e\) (gen. 1); \(\mu, \nu_\mu\) (gen. 2); \(\tau, \nu_\tau\) (gen. 3)</li>
</ul>

<strong>Gauge bosons</strong> (spin-1):
<ul>
<li>Photon \(\gamma\), \(W^\pm\), \(Z^0\) (electroweak) — 4 total</li>
<li>Gluons \(g\) (8 colors, strong force)</li>
</ul>

<strong>Higgs boson</strong> (spin-0): \(H\), mass \(\approx 125\) GeV.

<strong>Gauge group</strong>: \(SU(3)_c \times SU(2)_L \times U(1)_Y\), spontaneously broken to \(SU(3)_c \times U(1)_{\text{em}}\) by the Higgs mechanism.
</div>
