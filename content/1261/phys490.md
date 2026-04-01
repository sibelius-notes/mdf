---
title: "PHYS 490: String Theory, Renormalization, Path Integrals, and Supersymmetric Quantum Mechanics"
prof: Gang Xu, Daniel Wohns
subjects: "PHYS"
---

## Sources and References

These notes synthesize material from standard graduate references and a small number of widely used lecture-note sources. They are written as lecture-style notes rather than a transcription of any one term's blackboard presentation.

**Primary textbook** -- None assigned.

**Supplementary texts**
- MacKenzie, R. (2000). *Path Integral Methods and Applications*. arXiv:quant-ph/0004090.
- Tong, D. *Lectures on Supersymmetric Quantum Mechanics*. University of Cambridge.
- Polchinski, J. (1998). *String Theory*, Vols. 1-2. Cambridge University Press.
- Peskin, M. E., & Schroeder, D. V. (1995). *An Introduction to Quantum Field Theory*. Westview Press.

**Online lecture notes and course resources**
- Tong, D. *String Theory Lecture Notes*. University of Cambridge.
- Tong, D. *Statistical Field Theory* lecture notes, especially the renormalization-group discussion.
- PIRSA course lectures from Perimeter Institute.
- Selected arXiv papers in `hep-th` and `quant-ph`.

This course sits at an unusual intersection. String theory begins with classical mechanics on a two-dimensional worldsheet, but quantizing that system immediately forces us to confront path integrals, gauge fixing, anomalies, regularization, and renormalization. Supersymmetric quantum mechanics then serves as a simpler laboratory in which many of the same structural ideas reappear: factorization of Hamiltonians, zero modes, topological indices, and instantons. A good way to read these notes is not as four unrelated modules, but as one story about how quantum theories are constrained by symmetry and by consistency.

---

# Chapter 1: String Theory -- From Relativistic Particles to Worldsheets

## 1.1 Why Strings?

A point particle traces out a one-dimensional curve in spacetime. A string traces out a two-dimensional surface. That small geometric change has large physical consequences: a string has infinitely many vibrational modes, and after quantization those modes appear as an infinite tower of particles with different masses and spins. In particular, the closed-string spectrum contains a massless spin-2 excitation, which is the first sign that gravity is built into string theory rather than added by hand.

The logic of the subject is therefore:

1. Write a reparameterization-invariant classical action for an extended relativistic object.
2. Understand the constraints implied by gauge symmetry.
3. Quantize the resulting system.
4. Ask whether the quantum theory is mathematically consistent.

The surprising answer is that consistency is extremely restrictive: the dimension of spacetime, the allowed spectra, and even the existence of D-branes emerge from those constraints.

## 1.2 What Background Helps Before Reading This Part

The string-theory portion of the course is easier to read if you already feel comfortable with a few pieces of earlier undergraduate physics and mathematics. Not all of them are strict prerequisites, but they lower the cognitive load considerably.

The most useful background is:

1. **Classical mechanics in Lagrangian form.**
You should be comfortable with the action principle, Euler-Lagrange equations, generalized coordinates, and constrained systems. The move from a relativistic particle to a string is conceptually much easier if the phrase "derive the equations of motion by varying the action" already feels routine.

2. **Special relativity.**
You should recognize Minkowski space, Lorentz invariance, spacetime intervals, and the difference between timelike, spacelike, and lightlike directions. String theory uses relativistic notation from the start, so uncertainty here tends to slow everything else down.

3. **Waves and Fourier series.**
The classical string satisfies a two-dimensional wave equation, and its solutions are expanded in modes. If you already know how ordinary vibrating strings are decomposed into normal modes, the worldsheet mode expansion looks much less mysterious.

4. **Quantum mechanics of the harmonic oscillator.**
Canonical quantization of the string turns each mode into an oscillator. Creation and annihilation operators, commutators, zero-point energy, and operator ordering are therefore central background ideas.

5. **Linear algebra and index notation.**
You do not need advanced differential geometry to begin, but you should be comfortable reading expressions with summed indices, metrics, and basic tensor notation.

Some additional background is helpful but not essential at the start:

- **Introductory quantum field theory** helps with operator methods, path integrals, and the idea that particles are excitations of modes.
- **Group theory / representation language** helps when discussing Lorentz invariance and little groups.
- **Complex analysis and conformal ideas** become more useful later than they are in the opening lectures.

What is *not* necessary before reading the first pass through these notes:

- prior exposure to string theory,
- advanced general relativity,
- deep conformal field theory,
- or detailed supersymmetry.

The right minimal mindset is simpler than that list suggests: think of the early string-theory lectures as "relativistic classical mechanics plus infinitely many coupled oscillators, constrained by gauge symmetry." If that picture is in place, the formalism has somewhere to attach itself.

## 1.3 The Relativistic Point Particle

Before discussing strings, it is useful to recall the relativistic point particle, because every important feature of string theory already appears in miniature here.

A point particle moving in \(D\)-dimensional Minkowski spacetime traces out a **worldline**
\[
X^\mu(\tau), \qquad \mu = 0,1,\dots,D-1,
\]
where \(\tau\) is an arbitrary parameter along the curve. The spacetime metric will be taken to be
\[
\eta_{\mu\nu} = \mathrm{diag}(-1,+1,+1,\dots,+1).
\]

The proper-time action is
\[
S_{\text{pp}} = -mc \int d\tau \, \sqrt{-\dot X^\mu \dot X_\mu},
\]
with \(\dot X^\mu = dX^\mu/d\tau\). This action is invariant under reparameterizations \(\tau \to \tau'(\tau)\), because only the geometric length of the worldline matters. Physically, the free particle chooses an extremal proper time between two events.

The square root makes the action geometrically transparent but awkward for quantization. A standard trick is therefore to introduce an auxiliary one-dimensional metric, or **einbein**, \(e(\tau)\), and write the equivalent action
\[
S_{\text{einbein}} = \frac{1}{2}\int d\tau \left(e^{-1}\dot X^2 - e\,m^2c^2\right).
\]
Varying with respect to \(e\) gives its algebraic equation of motion,
\[
e^2 = -\frac{\dot X^2}{m^2c^2},
\]
and substituting back reproduces the square-root action. This is the one-dimensional ancestor of the Polyakov action for strings.

Varying \(X^\mu\) yields
\[
\frac{d}{d\tau}\left(\frac{\dot X^\mu}{e}\right)=0.
\]
After using reparameterization invariance to choose \(e=\text{const}\), this reduces to
\[
\ddot X^\mu = 0,
\]
so the free relativistic particle moves on a straight line.

The canonical momentum is
\[
p_\mu = \frac{\partial L}{\partial \dot X^\mu}
= m c \, \frac{\dot X_\mu}{\sqrt{-\dot X^2}},
\]
which satisfies the mass-shell constraint
\[
p^2 + m^2 c^2 = 0.
\]
This constraint is not an extra dynamical equation; it is the price of reparameterization invariance. The same pattern reappears for strings, where the mass-shell condition is replaced by the Virasoro constraints.

## 1.4 The String Action

A string is described by embedding fields
\[
X^\mu(\tau,\sigma),
\]
where \(\tau\) labels "time" on the worldsheet and \(\sigma\) labels position along the string. The string sweeps out a two-dimensional **worldsheet** in spacetime.

The most direct action is the **Nambu-Goto action**, proportional to the worldsheet area:
\[
S_{\text{NG}} = -T \int d\tau\, d\sigma \, \sqrt{-\det \gamma_{ab}},
\]
where
\[
\gamma_{ab} = \partial_a X^\mu \partial_b X_\mu
\]
is the induced metric on the worldsheet and
\[
T = \frac{1}{2\pi \alpha'}
\]
is the string tension. The parameter \(\alpha'\) has dimensions of length squared and sets the fundamental string scale.

As with the particle, there is a more convenient classically equivalent form. Introduce an independent worldsheet metric \(h_{ab}\) and write the **Polyakov action**
\[
S_P = -\frac{T}{2}\int d\tau\, d\sigma \, \sqrt{-h}\, h^{ab}\partial_a X^\mu \partial_b X_\mu.
\]
This version is quadratic in the embedding fields \(X^\mu\), which is why essentially all quantization schemes start from it.

Three symmetries are crucial:

1. **Spacetime Poincare invariance**: \(X^\mu \to \Lambda^\mu{}_\nu X^\nu + a^\mu\).
2. **Worldsheet diffeomorphism invariance**: arbitrary coordinate changes \((\tau,\sigma)\to(\tau',\sigma')\).
3. **Weyl invariance**: local rescaling \(h_{ab}\to e^{2\omega(\tau,\sigma)} h_{ab}\).

The first is a physical spacetime symmetry. The second and third are gauge redundancies: different choices of worldsheet coordinates and local scale describe the same physics. In two dimensions, diffeomorphisms plus Weyl transformations are powerful enough to reduce the worldsheet metric locally to the flat form
\[
h_{ab} \sim \eta_{ab}.
\]
That gauge choice is called **conformal gauge**.

## 1.5 Equations of Motion and Constraints

In conformal gauge, the Polyakov action becomes
\[
S_P = \frac{T}{2}\int d\tau\, d\sigma \left(\dot X^2 - X'^2\right),
\]
where
\[
\dot X = \partial_\tau X, \qquad X' = \partial_\sigma X.
\]
The field equations are then simply
\[
\ddot X^\mu - X''^\mu = 0,
\]
the two-dimensional wave equation. So a classical string is literally a relativistic vibrating string.

However, gauge fixing does not remove all the information contained in the metric variation. Varying the action with respect to \(h_{ab}\) gives the worldsheet stress tensor, and its vanishing yields the **Virasoro constraints**
\[
T_{ab}=0.
\]
In lightcone worldsheet coordinates \(\sigma^\pm = \tau \pm \sigma\), these become
\[
T_{++} = \partial_+X \cdot \partial_+X = 0,
\qquad
T_{--} = \partial_-X \cdot \partial_-X = 0.
\]
These are the string analog of the particle mass-shell condition. They are not optional; if they are ignored, one quantizes unphysical gauge degrees of freedom and obtains a theory with negative-norm states.

The general local solution to the wave equation is
\[
X^\mu(\tau,\sigma) = X^\mu_L(\tau+\sigma) + X^\mu_R(\tau-\sigma),
\]
meaning that the motion decomposes into left-moving and right-moving disturbances on the worldsheet. Boundary conditions determine how those modes are related.

---

# Chapter 2: Classical String Solutions and Boundary Conditions

## 2.1 Closed Strings and Open Strings

There are two basic topologies for free strings.

A **closed string** is a loop, so the spatial worldsheet coordinate is periodic:
\[
X^\mu(\tau,\sigma+2\pi)=X^\mu(\tau,\sigma).
\]
Because the string has no endpoints, left-moving and right-moving waves propagate independently around the loop. This is one reason the closed-string spectrum is richer than the open-string spectrum.

An **open string** has endpoints, usually taken at \(\sigma=0\) and \(\sigma=\pi\). The variation of the Polyakov action produces a boundary term
\[
\delta S_{\text{bdry}} \propto \int d\tau \, \delta X_\mu X'^\mu \Big|_{\sigma=0}^{\sigma=\pi}.
\]
For the action principle to be well defined, this term must vanish. There are two standard ways to arrange that.

## 2.2 Neumann and Dirichlet Boundary Conditions

If the endpoint is free to move, then we set
\[
X'^\mu\big|_{\sigma=0,\pi}=0.
\]
These are **Neumann boundary conditions**. They say that no momentum flows off the end of the string, so the endpoint is dynamical.

If instead we hold an endpoint fixed in a spatial direction \(i\), then we impose
\[
X^i\big|_{\sigma=0,\pi} = \text{const}.
\]
These are **Dirichlet boundary conditions**.

Dirichlet conditions have a profound interpretation. If some directions satisfy Neumann conditions and the transverse directions satisfy Dirichlet conditions, then the endpoints are constrained to lie on a hypersurface in spacetime. That hypersurface is a **D-brane**. A D\(p\)-brane has \(p\) spatial dimensions, so open-string endpoints move freely along the brane but are fixed in the transverse directions.

Historically, D-branes first look like a technical boundary-condition choice. Quantum mechanically, they turn out to be dynamical objects carrying energy, charge, and gauge fields. That is one of the major conceptual leaps of string theory: what first appears as a boundary condition becomes a physical extended object.

More generally, when an extended object with \(p\) spatial dimensions moves through spacetime, it sweeps out a \((p+1)\)-dimensional **worldvolume**. In that language, the point particle traces a worldline, the string traces a worldsheet, and a D-brane traces a worldvolume. This is useful to keep in mind because the course outline explicitly asks you to think geometrically about all three.

## 2.3 Mode Expansions

For a closed string, periodicity leads to the standard mode expansion
\[
X^\mu(\tau,\sigma)
= x^\mu + 2\alpha' p^\mu \tau
+ i\sqrt{\frac{\alpha'}{2}}
\sum_{n\neq 0}\frac{1}{n}
\left(
\alpha_n^\mu e^{-in(\tau-\sigma)}
+ \tilde\alpha_n^\mu e^{-in(\tau+\sigma)}
\right).
\]
The zero modes \(x^\mu\) and \(p^\mu\) describe center-of-mass motion, while the oscillators \(\alpha_n^\mu\) and \(\tilde\alpha_n^\mu\) describe vibrations. The two independent oscillator sets are the left- and right-movers.

For an open string with Neumann conditions at both ends,
\[
X^\mu(\tau,\sigma)
= x^\mu + 2\alpha' p^\mu \tau
+ i\sqrt{2\alpha'}
\sum_{n\neq 0}\frac{\alpha_n^\mu}{n} e^{-in\tau}\cos(n\sigma).
\]
The cosine appears because the derivative vanishes at the endpoints. Open strings therefore behave like standing waves rather than two independent traveling-wave systems.

If a coordinate obeys Dirichlet conditions, the mode expansion uses sines rather than cosines in the oscillating part, because the displacement itself is fixed at the endpoints.

## 2.4 Classical Spectrum and Regge Behavior

Once the string is quantized, each oscillator mode becomes a ladder operator. Even classically, however, one can already see that the spectrum is organized by total vibrational excitation. For the open bosonic string, the mass formula takes the form
\[
m^2 = \frac{1}{\alpha'}(N-a),
\]
where \(N\) counts oscillator excitations and \(a\) is a normal-ordering constant that appears after quantization.

For the closed bosonic string, there are left- and right-moving excitation numbers:
\[
m^2 = \frac{4}{\alpha'}(N+\tilde N - 2a),
\qquad
N=\tilde N
\]
with the second equation being the **level-matching condition**. Level matching is a global consistency requirement coming from periodicity around the closed string.

Long before modern string theory, these formulas were interesting because they naturally give approximately linear relations
\[
J \sim \alpha' m^2,
\]
between angular momentum and squared mass. Such linear **Regge trajectories** were originally observed in hadronic spectroscopy. In modern string theory the same structure survives, but the interpretation is much more ambitious: the tower of string states is not a model for hadrons, but the spectrum of a fundamental quantum theory.

---

# Chapter 3: Quantization of the Bosonic String

## 3.1 Why Quantization is Subtle

At first glance the string looks easy to quantize because in conformal gauge it satisfies a free wave equation. The difficulty is that not all solutions are physical. The Virasoro constraints must still be imposed, and the timelike oscillator modes threaten to produce negative-norm states. The resulting interplay between gauge symmetry, constraints, and anomalies is what makes the subject interesting.

## 3.2 Canonical Quantization

The oscillator coefficients are promoted to operators. For the open string,
\[
[\alpha_m^\mu,\alpha_n^\nu] = m\,\delta_{m+n,0}\,\eta^{\mu\nu},
\]
while the center-of-mass variables satisfy
\[
[x^\mu,p^\nu]=i\eta^{\mu\nu}.
\]
The sign of \(\eta^{00}\) means that timelike oscillators create states with negative norm if one quantizes naively in a covariant way. This is the string version of the ghost problem.

The worldsheet stress tensor generates the Virasoro operators
\[
L_n = \frac{1}{2}\sum_m :\alpha_{n-m}\cdot\alpha_m:,
\]
and physical states obey
\[
L_n|\psi\rangle = 0 \quad (n>0), \qquad (L_0-a)|\psi\rangle = 0.
\]
For closed strings one has a second independent copy \(\tilde L_n\) acting on the right-moving sector. The physical-state conditions are therefore
\[
L_n|\psi\rangle = \tilde L_n|\psi\rangle = 0 \quad (n>0),
\]
together with the \(L_0\), \(\tilde L_0\), and level-matching constraints.

The constant \(a\) is the zero-point energy of the infinite oscillator tower. It is one of the first places where regularization enters string theory in a concrete way.

## 3.3 Lightcone Quantization

One way to make the physical content manifest is to fix the remaining gauge freedom more strongly by choosing **lightcone gauge**
\[
X^+ = x^+ + 2\alpha' p^+ \tau,
\qquad
X^\pm = \frac{X^0 \pm X^{D-1}}{\sqrt{2}}.
\]
The constraints then solve for \(X^-\) in terms of the transverse coordinates \(X^i\), \(i=1,\dots,D-2\). As a result, only the transverse oscillators are independent physical degrees of freedom.

This gauge has two virtues:

1. All manifestly unphysical negative-norm oscillators disappear.
2. The physical Hilbert space becomes easy to describe.

For the open bosonic string, the mass formula becomes
\[
m^2 = \frac{1}{\alpha'}(N_\perp - 1).
\]
The ground state has
\[
N_\perp = 0 \quad \Rightarrow \quad m^2 = -\frac{1}{\alpha'},
\]
so it is tachyonic. This signals an instability of the bosonic-string vacuum. The first excited state has \(N_\perp=1\) and is massless; it transforms as a vector under the transverse rotation group \(SO(D-2)\).

For the closed bosonic string, the first non-tachyonic excitations come from
\[
\alpha_{-1}^\mu \tilde\alpha_{-1}^\nu |0;p\rangle.
\]
This tensor product decomposes into:

- a symmetric traceless tensor, identified with the **graviton**,
- an antisymmetric tensor \(B_{\mu\nu}\),
- and a scalar, the **dilaton**.

That the graviton appears automatically is the main reason string theory is taken seriously as a framework for quantum gravity.

## 3.4 Critical Dimension

The normal-ordering constant for the open bosonic string is
\[
a = \frac{D-2}{24}.
\]
Lorentz invariance of the quantum theory requires simultaneously that the first excited open-string state be massless and that the Lorentz algebra close without anomaly. These conditions force
\[
a=1,
\qquad
D=26.
\]

There are several equivalent ways to say this:

- In lightcone quantization, the Lorentz generators fail to satisfy the correct commutation relations unless \(D=26\).
- In the Polyakov path-integral approach, Weyl invariance develops a quantum anomaly unless the total worldsheet central charge vanishes, which again gives \(D=26\) for the bosonic string.

This is the prototype of an important lesson: gauge symmetries that hold classically may fail quantum mechanically, and their survival can impose drastic consistency conditions.

## 3.5 T-Duality and D-Branes

Suppose one spatial direction is compactified on a circle of radius \(R\),
\[
X \sim X + 2\pi R.
\]
Then momentum along that direction is quantized:
\[
p = \frac{n}{R}, \qquad n\in \mathbb{Z}.
\]
Closed strings can also wrap the circle \(w\) times, giving a **winding number**
\[
w\in \mathbb{Z},
\qquad
E_{\text{wind}} \sim \frac{wR}{\alpha'}.
\]
The spectrum depends on the combination
\[
\frac{n}{R}
\qquad \text{and} \qquad
\frac{wR}{\alpha'}.
\]
This is invariant under
\[
R \longleftrightarrow \frac{\alpha'}{R},
\qquad
n \longleftrightarrow w.
\]
That equivalence is **T-duality**. A theory on a large circle is physically equivalent to a theory on a small circle, provided momentum and winding are exchanged.

For open strings, T-duality is even more surprising: a Neumann boundary condition in the original coordinate becomes a Dirichlet boundary condition in the dual coordinate. In other words, the dual theory contains endpoints stuck to hypersurfaces. This is the cleanest route to D-branes. They are not optional decorations added to string theory; duality forces them on us.

Massless open-string modes ending on a stack of coincident D-branes produce gauge fields living on the brane worldvolume. That observation is one of the bridges between string theory and gauge theory.

---

# Chapter 4: Renormalization and Regularization

## 4.1 Why This Course Studies Renormalization Outside QFT First

In many textbooks, renormalization is introduced through relativistic quantum field theory. This course takes a broader and in some ways more instructive route. The same conceptual issue already appears in simpler settings: classical electrostatics, simple quantum-mechanical systems, and singular one-dimensional potentials. In all of these cases, naive parameters in the model are not directly measurable, and short-distance physics forces us to redefine them in terms of physical observables.

That is the basic meaning of renormalization in this course:

1. a calculation depends on unphysical short-distance details,
2. one introduces a regulator or cutoff,
3. bare parameters are adjusted so that physical quantities remain finite and fixed.

Seen this way, renormalization is not an exotic QFT trick. It is a general lesson about how continuum models encode unresolved short-distance structure.

## 4.2 Classical Example: Infinite Charge Distributions

The cleanest classical warning sign comes from electrostatic self-energy. For a charged conducting sphere of radius \(R\) carrying total charge \(Q\),
\[
U = \frac{Q^2}{8\pi\epsilon_0 R}.
\]
As \(R\to 0\), the energy diverges. If we insist on treating the charge as exactly pointlike in classical electrodynamics, we are driven to an infinite self-energy.

This does not mean the physics is meaningless. It means the idealization has been pushed past the scale where it can be trusted. One may interpret \(R\) as a regulator: a short-distance cutoff below which the continuum description fails. The observable mass of the object is then thought of as a sum of a bare mechanical mass and an electromagnetic self-energy contribution. That logic is the classical ancestor of mass renormalization in quantum theory.

Infinite or sharply localized charge distributions are pedagogically useful because the divergence is transparent. They force us to distinguish between formal parameters in a model and finite quantities that could actually be measured.

## 4.3 Debye-Huckel Theory and Screening

Debye-Huckel theory gives a more physical example in which a medium itself generates an effective cutoff. Put a test charge into a plasma or electrolyte. The surrounding mobile charges rearrange, partially screening the Coulomb field. Instead of a pure \(1/r\) potential, one obtains approximately
\[
\phi(r) \sim \frac{q}{4\pi\epsilon_0 r} e^{-r/\lambda_D},
\]
where \(\lambda_D\) is the **Debye length**.

The important lesson is not the detailed derivation of \(\lambda_D\), but the mechanism. Physics at one scale is modified by collective response at another scale. The long-distance theory does not simply inherit the bare microscopic interaction unchanged. This is exactly the mindset later formalized by the renormalization group: effective couplings depend on the scale at which the system is probed.

Debye-Huckel theory is therefore a very good bridge example. It is still essentially classical statistical physics, but it already teaches screening, scale dependence, and effective description.

## 4.4 Quantum-Mechanical Examples: Two-Level Systems and Singular Potentials

Another useful setting is a **two-level quantum system** weakly coupled to additional high-energy degrees of freedom. When those high-energy modes are integrated out, the effective energy splitting and transition amplitudes of the low-energy system shift. In practice, one computes corrections perturbatively and then rewrites the answer in terms of physical, low-energy parameters. The point is that even a tiny Hilbert space can inherit renormalized couplings after the rest of the system has been eliminated.

This is the simplest quantum-mechanical prototype of the Wilsonian idea: remove inaccessible high-energy degrees of freedom and encode their effect in an effective Hamiltonian for the low-energy sector.

An even sharper example is a singular contact interaction such as the **delta-prime potential**. Singular one-dimensional potentials can make scattering amplitudes or bound-state conditions depend explicitly on the short-distance regulator. One then imposes a renormalization condition, for example fixing a measurable scattering quantity at some reference scale, and lets the bare coupling depend on the cutoff so that the physical prediction remains finite.

The delta-prime example is important because it shows that running couplings are not unique to relativistic field theory. The coupling in a one-dimensional quantum-mechanical problem can also run when singular short-distance behavior is present.

## 4.5 Regulators, Running Couplings, and the RG Viewpoint

Across all of these examples, the same technical pattern recurs. One introduces some regulator:

- a short-distance cutoff \(R\),
- a screening length such as \(\lambda_D\),
- a momentum cutoff \(\Lambda\),
- or, in more formal settings, dimensional or zeta-function regularization.

The regulator itself is not physical. It is an intermediate device that lets us separate short-distance sensitivity from genuine observables.

Once that is done, the **renormalization group** packages how effective couplings change with scale. If \(g(\mu)\) is defined at scale \(\mu\), then
\[
\beta(g)=\mu \frac{dg}{d\mu}
\]
measures its running. In this language one says that couplings flow as the description is changed from one scale to another.

This course uses simple examples to build that intuition first. In full quantum field theory, the same logic explains screening, anti-screening, and universality. In string theory, it reappears again when Weyl invariance of the worldsheet theory forces background-field beta functions to vanish. So even though this module focuses on classical and quantum-mechanical examples such as Debye-Huckel theory, two-level systems, infinite charge distributions, and the delta-prime potential, the conceptual payoff is much broader.

---

# Chapter 5: Path Integrals and Applications

## 5.1 From Time Slicing to the Path Integral

The path integral reformulates quantum mechanics in a language that is especially well suited to symmetries, perturbation theory, and semiclassical expansions. The basic object is the propagator
\[
K(x_f,t_f;x_i,t_i) = \langle x_f,t_f | x_i,t_i \rangle.
\]
To derive a path-integral representation, divide the time interval into \(N\) short pieces of duration \(\Delta t\), insert \(N-1\) position-space completeness relations, and approximate the short-time evolution operator for each slice. One obtains
\[
K = \lim_{N\to\infty}
\int \prod_{k=1}^{N-1} dx_k \,
\exp\!\left[\frac{i}{\hbar}\sum_{k=0}^{N-1}\Delta t\,
L\!\left(\frac{x_{k+1}+x_k}{2},\frac{x_{k+1}-x_k}{\Delta t}\right)\right].
\]
In the continuum limit this becomes
\[
K(x_f,t_f;x_i,t_i)
= \int_{x(t_i)=x_i}^{x(t_f)=x_f}\mathcal{D}x(t)\,
e^{iS[x]/\hbar}.
\]

The phrase "sum over all paths" should be read carefully. The integral is not an ordinary finite-dimensional Riemann integral; it is defined by the time-sliced limit. Nonetheless, it is often the most efficient language for both formal reasoning and concrete computation.

## 5.2 Semiclassical Logic

The weight in Minkowski time is oscillatory:
\[
e^{iS/\hbar}.
\]
When \(\hbar\) is small compared with the typical action, nearby paths interfere destructively unless \(S\) is stationary. That is why the classical path dominates the semiclassical limit. The classical equations of motion therefore arise from stationary phase, not because non-classical paths vanish, but because their phases cancel each other.

This logic is one of the cleanest conceptual links between classical and quantum mechanics. It also generalizes directly to field theory, where one integrates over field configurations rather than particle trajectories.

## 5.3 Euclidean Time and Statistical Mechanics

A Wick rotation
\[
t = -i\tau
\]
turns the oscillatory weight into an exponentially damped one:
\[
e^{iS/\hbar} \to e^{-S_E/\hbar}.
\]
The Euclidean path integral is therefore much better behaved analytically:
\[
Z = \int \mathcal{D}x \, e^{-S_E[x]/\hbar}.
\]
It is also directly related to statistical mechanics, because
\[
Z(\beta) = \mathrm{Tr}(e^{-\beta H})
\]
is represented by a Euclidean path integral with periodic imaginary time of length \(\beta\hbar\).

This connection is conceptually important:

- quantum mechanics in real time emphasizes amplitudes and interference,
- Euclidean time emphasizes weights and partition functions.

Many non-perturbative effects, especially tunnelling, are much clearer in Euclidean signature.

## 5.4 Gaussian Examples

For quadratic actions, the path integral can be done exactly by splitting the path into a classical solution plus fluctuations:
\[
x(t)=x_{\text{cl}}(t)+\eta(t),
\qquad
\eta(t_i)=\eta(t_f)=0.
\]
Because the action is quadratic, the fluctuation integral is Gaussian.

For the harmonic oscillator,
\[
S[x]=\int dt\, \frac{m}{2}\left(\dot x^2 - \omega^2 x^2\right),
\]
the exact propagator is
\[
K(x_f,t;x_i,0)
= \sqrt{\frac{m\omega}{2\pi i\hbar \sin \omega t}}
\exp\!\left[
\frac{im\omega}{2\hbar \sin \omega t}
\left((x_f^2+x_i^2)\cos\omega t - 2x_i x_f\right)
\right].
\]
This is worth studying carefully because every perturbative field-theory computation is built from Gaussian integrals plus interactions treated as insertions.

## 5.5 Sources, Correlators, and Perturbation Theory

Introduce a source \(J(t)\) and define
\[
Z[J] = \int \mathcal{D}x \,
\exp\!\left[
\frac{i}{\hbar}S[x]
+ \frac{i}{\hbar}\int dt\, J(t)x(t)
\right].
\]
Functional derivatives of \(Z[J]\) with respect to \(J\) generate correlation functions. For an interacting theory, one expands around the Gaussian theory and uses Wick's theorem to reduce higher correlators to sums over pairings. In field theory, those pairings become propagator lines and interaction terms become vertices: this is the origin of Feynman diagrams in the path-integral language.

This is one reason the path integral is central to modern quantum theory. It packages symmetry, perturbation theory, and diagrammatics into a single formalism.

## 5.6 Instantons and Tunnelling

Consider the double-well potential
\[
V(x)=\frac{\lambda}{4}(x^2-a^2)^2.
\]
Classically, a low-energy particle placed in one well stays there forever. Quantum mechanically, the exact ground states are not localized in one well or the other; they are symmetric and antisymmetric combinations split by tunnelling.

In Euclidean time the equation of motion becomes
\[
\frac{d^2x}{d\tau^2} = V'(x),
\]
which can be interpreted as ordinary classical motion in the inverted potential \(-V\). The finite-action trajectory connecting \(-a\) to \(+a\) is the **instanton**:
\[
x_{\text{inst}}(\tau)
= a \tanh\!\left[\frac{\omega}{2}(\tau-\tau_0)\right],
\qquad
\omega=\sqrt{2\lambda}\,a.
\]
Its contribution to amplitudes is weighted by
\[
e^{-S_E^{\text{inst}}/\hbar}.
\]
This is non-perturbative: no finite power series in the coupling can reproduce an exponential of this form.

In the dilute-gas approximation, multi-instanton configurations exponentiate and generate the exponentially small splitting between low-lying levels. The same basic mechanism reappears in gauge theory and in supersymmetric quantum mechanics.

---

# Chapter 6: Supersymmetric Quantum Mechanics

## 6.1 Why SUSY Quantum Mechanics is Useful

Supersymmetric quantum mechanics (SQM) is often introduced as a toy model, but it is more than that. It is the simplest setting in which one can see:

- pairing of bosonic and fermionic states,
- exact zero-mode statements protected by symmetry,
- topological indices,
- semiclassical instanton effects,
- and the bridge from physics to differential geometry.

Many statements that are technically hard in quantum field theory are completely visible in SQM.

## 6.2 The SUSY Algebra

The defining structure is a pair of nilpotent supercharges \(Q\) and \(Q^\dagger\) satisfying
\[
Q^2 = 0,
\qquad
(Q^\dagger)^2 = 0,
\qquad
H = \{Q,Q^\dagger\}.
\]
Because \(H\) is an anticommutator, it automatically commutes with both supercharges:
\[
[H,Q]=[H,Q^\dagger]=0.
\]

The first immediate consequence is positivity:
\[
\langle\psi|H|\psi\rangle
= \|Q|\psi\rangle\|^2 + \|Q^\dagger|\psi\rangle\|^2 \ge 0.
\]
So supersymmetric Hamiltonians have spectra bounded below by zero.

The second consequence is pairing. If \(|E\rangle\) is an eigenstate with \(E>0\), then acting with \(Q\) or \(Q^\dagger\) produces a partner state with the same energy but opposite fermion number, unless the action vanishes. Nonzero-energy states therefore come in boson-fermion doublets. Only zero-energy states can remain unpaired.

This is the spectral origin of the Witten index.

## 6.3 Factorized Hamiltonians and Partner Potentials

In one dimension, choose units with \(\hbar=2m=1\) and define
\[
A = \frac{d}{dx} + W(x),
\qquad
A^\dagger = -\frac{d}{dx} + W(x),
\]
where \(W(x)\) is the **superpotential**. Then the supersymmetric Hamiltonian can be written in block form as
\[
H =
\begin{pmatrix}
A^\dagger A & 0 \\
0 & AA^\dagger
\end{pmatrix}.
\]
The two diagonal pieces are partner Hamiltonians
\[
H_- = A^\dagger A = -\frac{d^2}{dx^2} + V_-(x),
\qquad
H_+ = AA^\dagger = -\frac{d^2}{dx^2} + V_+(x),
\]
with
\[
V_\pm(x) = W(x)^2 \mp W'(x).
\]

The partner Hamiltonians are almost isospectral. Every positive-energy eigenstate of \(H_-\) is mapped to one of \(H_+\) by \(A\), and vice versa by \(A^\dagger\). The only possible mismatch is at zero energy, where one sector may have a normalizable ground state and the other may not.

For the harmonic-oscillator choice
\[
W(x)=\omega x,
\]
the partner potentials are
\[
V_-(x)=\omega^2 x^2-\omega,
\qquad
V_+(x)=\omega^2 x^2+\omega.
\]
These are the same oscillator shifted relative to one another, which makes the spectral pairing explicit.

## 6.4 The Witten Index

Define
\[
\mathcal{I}_W = \mathrm{Tr}\left[(-1)^F e^{-\beta H}\right].
\]
Because positive-energy bosonic and fermionic states are paired, their contributions cancel. Only zero modes survive:
\[
\mathcal{I}_W = n_B^{(0)} - n_F^{(0)}.
\]

This quantity is independent of \(\beta\), and more generally it is stable under continuous deformations that do not change the asymptotic structure of the theory. Therefore:

- if \(\mathcal{I}_W \neq 0\), supersymmetry cannot be spontaneously broken;
- if \(\mathcal{I}_W = 0\), supersymmetry may or may not be broken.

The index is powerful precisely because it is coarse. It does not tell you the full spectrum, but it tells you something exact about the existence of zero-energy states.

## 6.5 Path Integrals, Boundary Conditions, and Instantons

In the Euclidean path-integral formulation of SQM, the ordinary thermal partition function uses anti-periodic fermion boundary conditions, while the Witten index uses periodic fermion boundary conditions. That boundary-condition switch is not cosmetic; it changes whether the trace computes a generic thermal quantity or a supersymmetry-protected index.

Instantons in SQM describe tunnelling between classical vacua of the superpotential. Their contributions can lift would-be zero modes or generate exponentially small splittings, but fermion zero modes often force strong cancellations. This is why SUSY models are a controlled laboratory for semiclassical reasoning: one can see explicitly how topology, saddle points, and spectral pairing constrain non-perturbative physics.

## 6.6 Geometry and Morse Theory

One of the deepest insights, due to Witten, is that SQM can be formulated on a manifold \(M\) so that states are differential forms and the supercharge acts as the exterior derivative:
\[
Q \sim d,
\qquad
Q^\dagger \sim d^\dagger.
\]
Then the Hamiltonian becomes the Laplacian,
\[
H \sim dd^\dagger + d^\dagger d.
\]
Zero-energy states are harmonic forms, so they represent cohomology classes. The supersymmetric ground states therefore compute topological information.

In this language, the Witten index becomes the Euler characteristic:
\[
\mathcal{I}_W = \chi(M) = \sum_k (-1)^k b_k,
\]
where \(b_k\) are Betti numbers.

If one deforms the theory by a Morse function, semiclassical states localize near the critical points of that function, and instantons interpolate between them along gradient-flow trajectories. This gives a physical route to Morse inequalities and to the Morse-Witten complex. It is a striking example of a quantum-mechanical model revealing exact information about topology.

---

# Concluding View

The common thread through string theory, renormalization, path integrals, and supersymmetric quantum mechanics is not merely that they are advanced topics in theoretical physics. It is that all four force us to think carefully about what a quantum theory really is.

String theory teaches that consistency conditions can determine the structure of a theory more strongly than phenomenological guesswork. Renormalization teaches that a theory depends on scale and should be understood as an effective description. Path integrals teach that quantum mechanics is fundamentally about summing over histories, with classical physics emerging by stationary phase. Supersymmetric quantum mechanics teaches that symmetry can protect exact statements far beyond perturbation theory and can even encode topology.

Taken together, these topics form a coherent introduction to the modern style of theoretical physics: geometry, symmetry, and quantum consistency are not separate themes, but different aspects of the same framework.
