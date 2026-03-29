---
title: "PHYS 434: Quantum Physics 3"
prof: "Eduardo Martín-Martínez"
subjects: "PHYS"
---

These notes follow the course structure laid out by Dr. Eduardo Martín-Martínez for PHYS 434 at the University of Waterloo (Fall 2014). Much of the mathematical content in Parts I, II, IV, and V draws from a superb set of student notes prepared by **TC Fraser** (tcfraser@tcfraser.com) for a parallel offering of this course taught by Prof. Anton Burkov, distributed as version 1.1. Fraser's derivations of the time evolution operator, the time-reversal anti-unitarity argument, and the Dirac equation are models of clarity and are reproduced here with gratitude.

---

# Part I: Foundations

## Chapter 1: Hilbert Spaces and the Dirac Formalism

### 1.1 The Mathematical Stage

Quantum mechanics lives in a **Hilbert space** \(\mathcal{H}\) — a complex vector space equipped with an inner product and complete in the metric that inner product induces. Every physical state of a quantum system is represented (up to an overall phase) by a unit vector in \(\mathcal{H}\). Dirac's notation captures the algebraic structure of this space elegantly. A **ket** \(|\alpha\rangle\) is a vector in \(\mathcal{H}\); its dual, a **bra** \(\langle\alpha|\), lives in the dual space \(\mathcal{H}^*\). The inner product of \(|\beta\rangle\) with \(|\alpha\rangle\) is the complex number \(\langle\beta|\alpha\rangle\), satisfying

\[\langle\alpha|\beta\rangle = \langle\beta|\alpha\rangle^*,\]

so that \(\langle\alpha|\alpha\rangle \geq 0\), with equality only when \(|\alpha\rangle = 0\).

A **linear operator** \(A: \mathcal{H}\to\mathcal{H}\) maps kets to kets. Its **adjoint** \(A^\dagger\) is defined by the requirement that \(\langle\beta|A|\alpha\rangle = \langle\alpha|A^\dagger|\beta\rangle^*\) for all \(|\alpha\rangle,|\beta\rangle\). An operator is **Hermitian** (or self-adjoint in the finite-dimensional case) when \(A = A^\dagger\); it is **unitary** when \(U^\dagger U = UU^\dagger = \mathbf{1}\).

### 1.2 Hermitian Operators and the Spectral Theorem

Observables in quantum mechanics are represented by Hermitian operators. Two elementary facts underpin everything that follows.

<div class="theorem">
<strong>Theorem (Reality and orthogonality of eigenstates).</strong> Every eigenvalue of a Hermitian operator is real, and eigenstates belonging to distinct eigenvalues are orthogonal.
</div>

To prove the first claim, suppose \(A|a'\rangle = a'|a'\rangle\). Acting on the left with \(\langle a'|\) gives \(\langle a'|A|a'\rangle = a'\langle a'|a'\rangle\). Taking the complex conjugate of the entire equation and using \(A^\dagger = A\) yields the same expression with \(a'^*\) in place of \(a'\), so \(a' = a'^*\) and \(a'\) is real. For the orthogonality claim, let \(A|a'\rangle = a'|a'\rangle\) and \(A|a''\rangle = a''|a''\rangle\) with \(a' \neq a''\). Computing \(\langle a''|A|a'\rangle\) in two ways — by acting rightward to get \(a'\langle a''|a'\rangle\), and by acting leftward on \(\langle a''|\) to get \(a''\langle a''|a'\rangle\) — gives \((a' - a'')\langle a''|a'\rangle = 0\). Since \(a'\neq a''\), we conclude \(\langle a''|a'\rangle = 0\).

For operators with a **discrete spectrum**, the eigenstates \(|a'\rangle\) (normalised so that \(\langle a'|a'\rangle = 1\)) form a complete orthonormal set, and the **spectral decomposition** reads

\[A = \sum_{a'} a' |a'\rangle\langle a'|, \qquad \mathbf{1} = \sum_{a'} |a'\rangle\langle a'|.\]

The second equation is the **completeness relation** or **resolution of identity**. Any ket can be expanded as \(|\alpha\rangle = \sum_{a'} |a'\rangle\langle a'|\alpha\rangle\), where the complex number \(\langle a'|\alpha\rangle\) is the **probability amplitude** for finding the eigenvalue \(a'\) in a measurement of \(A\). The probability itself is \(|\langle a'|\alpha\rangle|^2\), and the normalisation \(\langle\alpha|\alpha\rangle = 1\) ensures these probabilities sum to one.

### 1.3 Matrix Elements and Change of Basis

Given an orthonormal basis \(\{|a'\rangle\}\), every operator is represented by a matrix with entries \(A_{a''a'} = \langle a''|A|a'\rangle\). The adjoint \(A^\dagger\) has entries \((A^\dagger)_{a''a'} = A_{a'a''}^*\), confirming that Hermitian operators correspond to Hermitian matrices. A unitary change of basis \(|a'\rangle \mapsto U|a'\rangle\) transforms operators as \(A \mapsto UAU^\dagger\) and preserves all eigenvalues and inner products.

---

## Chapter 2: Quantum States and Measurements

### 2.1 The Postulates

Four postulates give quantum mechanics its predictive content.

1. **States.** The state of a quantum system at time \(t\) is completely described by a normalised ket \(|\psi,t\rangle \in \mathcal{H}\).

2. **Observables.** Every measurable physical quantity is represented by a Hermitian operator on \(\mathcal{H}\).

3. **Measurement.** A measurement of observable \(A\) on state \(|\psi\rangle\) yields one of the eigenvalues \(a'\) of \(A\). The probability of obtaining \(a'\) is \(|\langle a'|\psi\rangle|^2\). Immediately after the measurement, the state collapses to \(|a'\rangle\).

4. **Dynamics.** Between measurements, the state evolves unitarily according to the Schrödinger equation \(i\hbar\partial_t|\psi,t\rangle = H|\psi,t\rangle\), where \(H\) is the Hamiltonian operator.

These postulates apply directly when the spectrum of \(A\) is discrete. The continuous case requires care.

### 2.2 Continuous Spectrum and the Dirac Delta

For position \(X\) (or momentum \(P\)), the "eigenvalues" form a continuum. One introduces generalised eigenstates \(|x'\rangle\) satisfying \(X|x'\rangle = x'|x'\rangle\), but these cannot be normalised in the ordinary sense. Instead they satisfy the **Dirac delta normalisation**

\[\langle x''|x'\rangle = \delta(x'' - x'),\]

and the **continuous completeness relation**

\[\int_{-\infty}^{\infty} dx'\, |x'\rangle\langle x'| = \mathbf{1}.\]

The **wavefunction** of a state \(|\alpha\rangle\) in the position basis is \(\psi_\alpha(x') = \langle x'|\alpha\rangle\), and the probability of finding the particle in \([x', x'+dx']\) is \(|\psi_\alpha(x')|^2\,dx'\). These formulae parallel the discrete case exactly — the sum becomes an integral and the Kronecker delta becomes a Dirac delta.

### 2.3 Canonical Commutation Relation from Infinitesimal Translations

The canonical commutation relation \([X, P] = i\hbar\) is not an independent postulate but a consequence of the structure of translations. Define the **infinitesimal translation operator**

\[\mathcal{T}(\delta x') = \mathbf{1} - \frac{i}{\hbar} P \,\delta x',\]

where \(P\) is the Hermitian generator of translations. The action on position eigenstates is \(\mathcal{T}(\delta x')|x'\rangle = |x' + \delta x'\rangle\). Act with the commutator \([X, \mathcal{T}(\delta x')]\) on \(|x'\rangle\):

\[[X, \mathcal{T}(\delta x')]|x'\rangle = X|x'+\delta x'\rangle - \mathcal{T}(\delta x') x'|x'\rangle = (x'+\delta x')|x'+\delta x'\rangle - x'|x'+\delta x'\rangle = \delta x'\,|x'+\delta x'\rangle.\]

On the other hand, inserting \(\mathcal{T}(\delta x') = \mathbf{1} - (i/\hbar) P \,\delta x'\),

\[[X, \mathcal{T}(\delta x')] = -\frac{i\,\delta x'}{\hbar}[X, P].\]

Equating both expressions at leading order in \(\delta x'\) gives

\[[X, P] = i\hbar.\]

### 2.4 Position and Momentum Representations

The momentum operator in the position basis acts as a differential operator. The translation of a wavefunction by \(\delta x'\) gives \(\langle x'|\mathcal{T}(\delta x')|\alpha\rangle = \psi_\alpha(x' - \delta x') \approx \psi_\alpha(x') - \delta x'\,\partial_{x'}\psi_\alpha\). But also \(\langle x'|\mathcal{T}(\delta x')|\alpha\rangle = \langle x'|(1 - iP\delta x'/\hbar)|\alpha\rangle\), so in the position basis,

\[\langle x'|P|\alpha\rangle = -i\hbar \frac{\partial}{\partial x'}\langle x'|\alpha\rangle = -i\hbar\,\partial_{x'}\psi_\alpha(x').\]

The momentum eigenstates in the position representation are plane waves: \(\langle x'|p'\rangle = \frac{1}{\sqrt{2\pi\hbar}}\,e^{ip'x'/\hbar}\). The relationship between position and momentum wavefunctions is a **Fourier transform**:

\[\langle p'|\alpha\rangle = \frac{1}{\sqrt{2\pi\hbar}}\int_{-\infty}^{\infty} dx'\, e^{-ip'x'/\hbar}\,\langle x'|\alpha\rangle.\]

This Fourier duality implies the Heisenberg uncertainty principle \(\Delta X\,\Delta P \geq \hbar/2\) as a theorem — a rigorous consequence of the Fourier analysis of square-integrable functions, not a philosophical statement.

---

## Chapter 3: Time Evolution

### 3.1 The Time Evolution Operator

Rather than working with the Schrödinger equation directly, it is more powerful to define the **time evolution operator** \(U(t, t_0)\) by

\[|\psi, t\rangle = U(t, t_0)\,|\psi, t_0\rangle.\]

Three properties follow from physical requirements alone.

First, **unitarity**: probabilities must be preserved, so \(\langle\psi,t|\psi,t\rangle = \langle\psi,t_0|\psi,t_0\rangle = 1\) for all states, which forces \(U^\dagger U = \mathbf{1}\).

Second, **composition**: evolving from \(t_0\) to \(t_1\) and then from \(t_1\) to \(t_2\) must equal evolving directly from \(t_0\) to \(t_2\), so \(U(t_2, t_0) = U(t_2, t_1)\,U(t_1, t_0)\).

Third, **initial condition**: \(U(t_0, t_0) = \mathbf{1}\).

To find the form of \(U\), consider an infinitesimal time step \(dt\). The most general infinitesimal unitary operator satisfying the initial condition is \(U(t_0 + dt, t_0) = \mathbf{1} - i\Omega(t_0)\,dt\) for some Hermitian operator \(\Omega(t_0)\). From the composition law,

\[U(t+dt, t_0) = U(t+dt, t)\,U(t, t_0) = (\mathbf{1} - i\Omega(t)\,dt)\,U(t, t_0),\]

which gives

\[i\frac{\partial U}{\partial t} = \Omega(t)\,U(t, t_0).\]

Identifying \(\Omega = H/\hbar\) on dimensional grounds yields the **operator Schrödinger equation**

\[i\hbar\frac{\partial U}{\partial t} = H\,U(t, t_0).\]

For a **time-independent Hamiltonian**, the unique unitary solution is

\[U(t, t_0) = e^{-iH(t-t_0)/\hbar}.\]

### 3.2 The Heisenberg Picture

The Schrödinger picture places all time dependence in the state ket. The **Heisenberg picture** makes an equivalent choice: states are frozen at their \(t_0\) values, while operators carry the time dependence:

\[A^{(H)}(t) = U^\dagger(t, t_0)\,A^{(S)}\,U(t, t_0).\]

Differentiating with respect to \(t\) gives the **Heisenberg equation of motion**:

\[\frac{d A^{(H)}}{dt} = \frac{i}{\hbar}\left[H, A^{(H)}\right] + \left(\frac{\partial A^{(S)}}{\partial t}\right)^{(H)}.\]

For operators with no explicit time dependence in the Schrödinger picture, the second term vanishes.

### 3.3 Conserved Quantities and Ehrenfest's Theorem

An observable \(A\) is conserved if and only if \([H, A] = 0\). This follows immediately from the Heisenberg equation of motion.

**Ehrenfest's theorem** takes expectation values of the Heisenberg equations for \(X\) and \(P\):

\[\frac{d\langle X\rangle}{dt} = \frac{\langle P\rangle}{m}, \qquad \frac{d\langle P\rangle}{dt} = -\left\langle \frac{\partial V}{\partial X}\right\rangle.\]

These are the classical equations of motion with quantum expectation values in place of classical variables. Quantum mechanics reduces to classical mechanics in the limit of slowly varying potentials, where \(\langle \partial V/\partial X\rangle \approx \partial V/\partial\langle X\rangle\).

---

## Chapter 4: Rotations and Angular Momentum

### 4.1 Rotation Matrices and Non-Commutativity

A rotation by angle \(\phi\) about the \(z\)-axis is represented by the \(3\times 3\) matrix

\[R_z(\phi) = \begin{pmatrix} \cos\phi & -\sin\phi & 0 \\ \sin\phi & \cos\phi & 0 \\ 0 & 0 & 1 \end{pmatrix},\]

with analogous expressions for \(R_x\) and \(R_y\). These matrices satisfy \(R^T R = \mathbf{1}\) and \(\det R = +1\), forming the group \(\text{SO}(3)\). Crucially, rotations do not commute: rotating first about \(x\) and then about \(y\) yields a different result than the reverse order. For small angles \(\epsilon\),

\[R_x(\epsilon)R_y(\epsilon) - R_y(\epsilon)R_x(\epsilon) \approx R_z(\epsilon^2) - \mathbf{1},\]

showing that the commutator of two small rotations is itself a rotation about the third axis. This non-commutativity is the seed of the angular momentum algebra.

### 4.2 Infinitesimal Rotations and the Angular Momentum Algebra

In quantum mechanics, a rotation \(R\) acts on state kets via a unitary operator \(\mathcal{D}(R)\). For an infinitesimal rotation by \(d\phi\) about the unit vector \(\hat{n}\),

\[\mathcal{D}(\hat{n}, d\phi) = \mathbf{1} - \frac{i}{\hbar}(\mathbf{J}\cdot\hat{n})\,d\phi,\]

where \(\mathbf{J} = (J_x, J_y, J_z)\) are the **angular momentum operators**, Hermitian for \(\mathcal{D}\) to be unitary. Consistency with the composition of rotations forces the **commutation relations**

\[[J_i, J_j] = i\hbar\,\varepsilon_{ijk}\,J_k.\]

These define the Lie algebra \(\mathfrak{su}(2)\) and are the central algebraic fact of angular momentum theory.

### 4.3 Spin-1/2 and Pauli Matrices

The simplest non-trivial representation has dimension 2. Setting \(\mathbf{J} = \frac{\hbar}{2}\boldsymbol{\sigma}\), the **Pauli matrices** are

\[\sigma_x = \begin{pmatrix}0 & 1\\1 & 0\end{pmatrix}, \quad \sigma_y = \begin{pmatrix}0 & -i\\i & 0\end{pmatrix}, \quad \sigma_z = \begin{pmatrix}1 & 0\\0 & -1\end{pmatrix}.\]

They satisfy \(\sigma_i^2 = \mathbf{1}\), \(\{\sigma_i, \sigma_j\} = 2\delta_{ij}\mathbf{1}\), and \([\sigma_i, \sigma_j] = 2i\varepsilon_{ijk}\sigma_k\). The two eigenstates of \(S_z = \hbar\sigma_z/2\) are \(|+\rangle = \binom{1}{0}\) (spin-up, \(+\hbar/2\)) and \(|-\rangle = \binom{0}{1}\) (spin-down, \(-\hbar/2\)).

A rotation of a spin-1/2 state by angle \(\phi\) about \(\hat{n}\) is

\[\mathcal{D}^{(1/2)}(\hat{n}, \phi) = \cos\frac{\phi}{2}\,\mathbf{1} - i\sin\frac{\phi}{2}\,(\hat{n}\cdot\boldsymbol{\sigma}).\]

A rotation by \(2\pi\) gives \(\mathcal{D}^{(1/2)} = -\mathbf{1}\): a spinor picks up a sign under a full rotation. The set of all spin states traces out the **Bloch sphere**, with north/south poles as \(|\pm\rangle\) and equatorial points as eigenstates of \(S_x\) and \(S_y\).

<svg viewBox="0 0 300 320" xmlns="http://www.w3.org/2000/svg" style="max-width:300px;display:block;margin:1.5em auto">
  <defs>
    <marker id="bs-arr" markerWidth="7" markerHeight="5" refX="7" refY="2.5" orient="auto">
      <polygon points="0 0, 7 2.5, 0 5" fill="currentColor"/>
    </marker>
    <marker id="bs-arr-blue" markerWidth="7" markerHeight="5" refX="7" refY="2.5" orient="auto">
      <polygon points="0 0, 7 2.5, 0 5" fill="#3b82f6"/>
    </marker>
  </defs>
  <!-- Sphere outline -->
  <ellipse cx="150" cy="155" rx="100" ry="100" fill="none" stroke="currentColor" stroke-width="1.8" opacity="0.6"/>
  <!-- Equatorial ellipse (dashed) -->
  <ellipse cx="150" cy="155" rx="100" ry="30" fill="none" stroke="currentColor" stroke-width="1.2" stroke-dasharray="6,4" opacity="0.5"/>
  <!-- z axis (vertical) -->
  <line x1="150" y1="45" x2="150" y2="270" stroke="currentColor" stroke-width="1.5" marker-end="url(#bs-arr)"/>
  <text x="155" y="42" font-size="12" fill="currentColor">z</text>
  <!-- x axis -->
  <line x1="42" y1="175" x2="258" y2="175" stroke="currentColor" stroke-width="1.5" marker-end="url(#bs-arr)" opacity="0.5"/>
  <text x="262" y="179" font-size="12" fill="currentColor">x</text>
  <!-- y axis (into page) -->
  <line x1="150" y1="155" x2="100" y2="195" stroke="currentColor" stroke-width="1.5" marker-end="url(#bs-arr)" opacity="0.5"/>
  <text x="88" y="208" font-size="12" fill="currentColor">y</text>
  <!-- |+⟩ north pole -->
  <circle cx="150" cy="55" r="5" fill="#3b82f6"/>
  <text x="158" y="52" font-size="13" fill="#3b82f6">|+⟩</text>
  <!-- |−⟩ south pole -->
  <circle cx="150" cy="255" r="5" fill="#ef4444"/>
  <text x="158" y="260" font-size="13" fill="#ef4444">|−⟩</text>
  <!-- Bloch vector |ψ⟩ -->
  <line x1="150" y1="155" x2="218" y2="92" stroke="#3b82f6" stroke-width="2.5" marker-end="url(#bs-arr-blue)"/>
  <text x="225" y="88" font-size="13" fill="#3b82f6">|ψ⟩</text>
  <!-- θ angle arc -->
  <path d="M 150 105 A 50 50 0 0 1 185 127" fill="none" stroke="currentColor" stroke-width="1.2"/>
  <text x="165" y="112" font-size="11" fill="currentColor">θ</text>
  <!-- φ angle arc on equator -->
  <path d="M 200 155 A 50 14 0 0 0 172 169" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.7"/>
  <text x="202" y="165" font-size="11" fill="currentColor">φ</text>
  <!-- Formula -->
  <text x="20" y="298" font-size="11" fill="currentColor">|ψ⟩ = cos(θ/2)|+⟩ + e^{iφ} sin(θ/2)|−⟩</text>
  <text x="150" y="315" text-anchor="middle" font-size="11" fill="currentColor">Bloch Sphere (spin-½)</text>
</svg>

### 4.4 Euler Angles and Wigner D-Matrices

A general rotation is parametrised by **Euler angles** \((\alpha, \beta, \gamma)\):

\[R(\alpha,\beta,\gamma) = R_z(\alpha)\,R_y(\beta)\,R_z(\gamma), \qquad \mathcal{D}^{(j)}(\alpha,\beta,\gamma) = e^{-iJ_z\alpha/\hbar}\,e^{-iJ_y\beta/\hbar}\,e^{-iJ_z\gamma/\hbar}.\]

The matrix elements in the \(|j,m\rangle\) basis are the **Wigner D-matrices**:

\[D^{(j)}_{m'm}(\alpha,\beta,\gamma) = e^{-im'\alpha}\,d^{(j)}_{m'm}(\beta)\,e^{-im\gamma},\]

where \(d^{(j)}_{m'm}(\beta) = \langle j,m'|e^{-iJ_y\beta/\hbar}|j,m\rangle\) is the reduced rotation matrix. These appear in the description of scattering amplitudes and multipole transitions.

<svg viewBox="0 0 460 200" xmlns="http://www.w3.org/2000/svg" style="max-width:460px;display:block;margin:1.5em auto">
  <defs>
    <marker id="ba-arr-blue" markerWidth="7" markerHeight="5" refX="7" refY="2.5" orient="auto">
      <polygon points="0 0, 7 2.5, 0 5" fill="#3b82f6"/>
    </marker>
    <marker id="ba-arr-red" markerWidth="7" markerHeight="5" refX="7" refY="2.5" orient="auto">
      <polygon points="0 0, 7 2.5, 0 5" fill="#ef4444"/>
    </marker>
  </defs>
  <!-- Incident plane wave (horizontal lines) -->
  <line x1="10" y1="95" x2="170" y2="95" stroke="#3b82f6" stroke-width="2.5" stroke-dasharray="10,5" marker-end="url(#ba-arr-blue)"/>
  <line x1="10" y1="75" x2="120" y2="75" stroke="#3b82f6" stroke-width="1.2" stroke-dasharray="10,5" opacity="0.5"/>
  <line x1="10" y1="115" x2="120" y2="115" stroke="#3b82f6" stroke-width="1.2" stroke-dasharray="10,5" opacity="0.5"/>
  <text x="60" y="65" font-size="12" fill="#3b82f6">e^{ik·r} (incident)</text>
  <!-- Scattering centre -->
  <circle cx="185" cy="95" r="15" fill="none" stroke="currentColor" stroke-width="2"/>
  <text x="185" y="100" text-anchor="middle" font-size="11" fill="currentColor">V(r)</text>
  <!-- Scattered spherical wave (arcs) -->
  <path d="M 210 75 Q 270 50 310 75" fill="none" stroke="#ef4444" stroke-width="1.5" marker-end="url(#ba-arr-red)"/>
  <path d="M 210 95 Q 300 95 370 80" fill="none" stroke="#ef4444" stroke-width="2" marker-end="url(#ba-arr-red)"/>
  <path d="M 210 115 Q 270 140 310 115" fill="none" stroke="#ef4444" stroke-width="1.5" marker-end="url(#ba-arr-red)"/>
  <path d="M 198 80 Q 250 30 310 55" fill="none" stroke="#ef4444" stroke-width="1.2" opacity="0.6" marker-end="url(#ba-arr-red)"/>
  <path d="M 198 110 Q 250 160 310 135" fill="none" stroke="#ef4444" stroke-width="1.2" opacity="0.6" marker-end="url(#ba-arr-red)"/>
  <!-- Scattered label -->
  <text x="375" y="80" font-size="11" fill="#ef4444">e^{ikr}/r·f(θ,φ)</text>
  <text x="375" y="94" font-size="11" fill="#ef4444">(scattered)</text>
  <!-- scattering angle θ -->
  <path d="M 220 95 A 40 40 0 0 0 230 73" fill="none" stroke="currentColor" stroke-width="1.2"/>
  <text x="238" y="82" font-size="11" fill="currentColor">θ</text>
  <!-- Born approximation label -->
  <text x="20" y="175" font-size="11" fill="currentColor">Born approximation: f(θ) ∝ ∫ V(r) e^{iq·r} d³r   (Fourier transform of V)</text>
  <text x="230" y="195" text-anchor="middle" font-size="11" fill="currentColor">momentum transfer q = k′ − k</text>
</svg>

### 4.5 General Angular Momentum: Eigenvalue Spectrum

The eigenvalue spectrum of \(\mathbf{J}^2\) and \(J_z\) follows from the commutation relations alone. From \([J_i,J_j]=i\hbar\varepsilon_{ijk}J_k\) one derives \([\mathbf{J}^2, J_i] = 0\) for all \(i\), so both operators can be simultaneously diagonalised. Let \(\mathbf{J}^2|j,m\rangle = \lambda\hbar^2|j,m\rangle\) and \(J_z|j,m\rangle = m\hbar|j,m\rangle\). Define **ladder operators** \(J_\pm = J_x \pm iJ_y\) satisfying

\[[J_z, J_\pm] = \pm\hbar J_\pm, \qquad [J_+, J_-] = 2\hbar J_z, \qquad [\mathbf{J}^2, J_\pm] = 0.\]

The operator \(J_+\) raises \(m\) by one unit; \(J_-\) lowers it. Since \(\langle j,m|J_x^2 + J_y^2|j,m\rangle \geq 0\), we have \(\lambda \geq m^2\). Calling the maximum value \(j\), requiring \(J_+|j,j\rangle = 0\) gives \(\lambda = j(j+1)\). The minimum value is \(-j\), and \(2j\) must be a non-negative integer, so

\[j \in \left\{0, \tfrac{1}{2}, 1, \tfrac{3}{2}, 2, \ldots\right\}, \qquad m \in \{-j, -j+1, \ldots, j\}.\]

The normalised matrix elements of the ladder operators are

\[J_\pm|j,m\rangle = \hbar\sqrt{j(j+1) - m(m\pm 1)}\,|j,m\pm 1\rangle.\]

<svg viewBox="0 0 360 300" xmlns="http://www.w3.org/2000/svg" style="max-width:360px;display:block;margin:1.5em auto">
  <defs>
    <marker id="lad-arr-up" markerWidth="7" markerHeight="5" refX="7" refY="2.5" orient="auto">
      <polygon points="0 0, 7 2.5, 0 5" fill="#3b82f6"/>
    </marker>
    <marker id="lad-arr-dn" markerWidth="7" markerHeight="5" refX="7" refY="2.5" orient="auto">
      <polygon points="0 0, 7 2.5, 0 5" fill="#ef4444"/>
    </marker>
  </defs>
  <!-- Title -->
  <text x="180" y="18" text-anchor="middle" font-size="12" fill="currentColor">Angular Momentum: |j,m⟩ Ladder</text>
  <!-- j=0 -->
  <circle cx="180" cy="270" r="14" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="180" y="275" text-anchor="middle" font-size="11" fill="currentColor">0,0</text>
  <!-- j=1/2 -->
  <circle cx="140" cy="210" r="14" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="140" y="215" text-anchor="middle" font-size="10" fill="currentColor">½,−½</text>
  <circle cx="220" cy="210" r="14" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="220" y="215" text-anchor="middle" font-size="10" fill="currentColor">½,+½</text>
  <!-- j=1 -->
  <circle cx="80" cy="150" r="14" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="80" y="155" text-anchor="middle" font-size="10" fill="currentColor">1,−1</text>
  <circle cx="180" cy="150" r="14" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="180" y="155" text-anchor="middle" font-size="10" fill="currentColor">1,0</text>
  <circle cx="280" cy="150" r="14" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="280" y="155" text-anchor="middle" font-size="10" fill="currentColor">1,+1</text>
  <!-- j=3/2 -->
  <circle cx="30" cy="90" r="14" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="30" y="95" text-anchor="middle" font-size="9" fill="currentColor">3/2,−3/2</text>
  <circle cx="110" cy="90" r="14" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="110" y="95" text-anchor="middle" font-size="9" fill="currentColor">3/2,−½</text>
  <circle cx="250" cy="90" r="14" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="250" y="95" text-anchor="middle" font-size="9" fill="currentColor">3/2,+½</text>
  <circle cx="330" cy="90" r="14" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="330" y="95" text-anchor="middle" font-size="9" fill="currentColor">3/2,+3/2</text>
  <!-- J+ arrows (blue, raising) within j=1 -->
  <line x1="95" y1="147" x2="163" y2="147" stroke="#3b82f6" stroke-width="1.8" marker-end="url(#lad-arr-up)"/>
  <line x1="195" y1="147" x2="263" y2="147" stroke="#3b82f6" stroke-width="1.8" marker-end="url(#lad-arr-up)"/>
  <text x="125" y="140" font-size="10" fill="#3b82f6">J₊</text>
  <!-- J- arrows (red, lowering) within j=1 -->
  <line x1="265" y1="154" x2="197" y2="154" stroke="#ef4444" stroke-width="1.8" marker-end="url(#lad-arr-dn)"/>
  <line x1="165" y1="154" x2="97" y2="154" stroke="#ef4444" stroke-width="1.8" marker-end="url(#lad-arr-dn)"/>
  <text x="225" y="165" font-size="10" fill="#ef4444">J₋</text>
  <!-- axis labels -->
  <text x="8" y="35" font-size="11" fill="currentColor">j=3/2</text>
  <text x="8" y="95" font-size="11" fill="currentColor" opacity="0.5">m:</text>
  <text x="8" y="155" font-size="11" fill="currentColor">j=1</text>
  <text x="8" y="215" font-size="11" fill="currentColor">j=½</text>
  <text x="8" y="275" font-size="11" fill="currentColor">j=0</text>
</svg>

### 4.6 Orbital Angular Momentum and Spherical Harmonics

For a particle moving in three dimensions, \(\mathbf{L} = \mathbf{r}\times\mathbf{p}\) with

\[L_z = -i\hbar\frac{\partial}{\partial\phi}, \qquad \mathbf{L}^2 = -\hbar^2\left[\frac{1}{\sin\theta}\frac{\partial}{\partial\theta}\left(\sin\theta\frac{\partial}{\partial\theta}\right) + \frac{1}{\sin^2\theta}\frac{\partial^2}{\partial\phi^2}\right].\]

The simultaneous eigenfunctions are the **spherical harmonics** \(Y_\ell^m(\theta,\phi)\). Since \(Y_\ell^m \propto e^{im\phi}\) must be single-valued under \(\phi\mapsto\phi+2\pi\), we need \(m\in\mathbb{Z}\), forcing \(\ell\in\mathbb{Z}_{\geq 0}\). Half-integer values of angular momentum cannot arise from orbital angular momentum \(\mathbf{r}\times\mathbf{p}\); they require intrinsic spin.

### 4.7 Addition of Angular Momenta

For a system with two angular momenta \(\mathbf{J}_1\) and \(\mathbf{J}_2\), the total \(\mathbf{J} = \mathbf{J}_1 + \mathbf{J}_2\) also satisfies the angular momentum commutation relations. The change of basis between the uncoupled basis \(|j_1,m_1\rangle\otimes|j_2,m_2\rangle\) and the coupled basis \(|j,m\rangle\) involves the **Clebsch-Gordan coefficients** \(\langle j_1,m_1;j_2,m_2|j,m\rangle\):

\[|j,m\rangle = \sum_{m_1+m_2=m} \langle j_1,m_1;j_2,m_2|j,m\rangle\,|j_1,m_1\rangle\otimes|j_2,m_2\rangle.\]

The total angular momentum quantum number ranges as \(j \in \{|j_1 - j_2|, |j_1-j_2|+1, \ldots, j_1+j_2\}\).

---

# Part II: Symmetries

## Chapter 5: Parity and Discrete Symmetries

### 5.1 Symmetries and Conservation Laws

A symmetry of a quantum system is a transformation \(S\) that leaves the Hamiltonian invariant. If \(S\) is represented by a unitary operator \(U_S\), then \([G_S, H] = 0\) where \(G_S\) is the generator of \(S\). By the Heisenberg equation of motion, this implies \(dG_S^{(H)}/dt = 0\): the generator is conserved. This is the quantum version of Noether's theorem.

### 5.2 The Parity Operator

**Parity** is the discrete symmetry of spatial inversion. The operator \(\pi\) acts as \(\pi|x'\rangle = |-x'\rangle\), from which one derives

\[\pi^\dagger X\,\pi = -X, \qquad \pi^\dagger P\,\pi = -P, \qquad \pi^\dagger \mathbf{L}\,\pi = +\mathbf{L}.\]

Since \(\pi^2 = \mathbf{1}\), the eigenvalues of \(\pi\) are \(\pm 1\). States with eigenvalue \(+1\) have **even parity** (\(\psi(-x) = \psi(x)\)); those with \(-1\) have **odd parity** (\(\psi(-x) = -\psi(x)\)).

When \([\pi, H] = 0\), energy eigenstates can be chosen to have definite parity. This leads to **selection rules**: the matrix element \(\langle\beta|X|\alpha\rangle\) vanishes unless \(\alpha\) and \(\beta\) have opposite parities, since

\[\langle\beta|X|\alpha\rangle = \langle\beta|\pi^\dagger(-X)\pi|\alpha\rangle = -\varepsilon_\beta\,\varepsilon_\alpha\,\langle\beta|X|\alpha\rangle.\]

This is non-zero only if \(\varepsilon_\alpha\varepsilon_\beta = -1\).

### 5.3 Discrete Translational Symmetry and Bloch Waves

A crystal lattice with lattice constant \(a\) has \([T_a, H] = 0\), where \(T_a|x\rangle = |x+a\rangle\). Since \(T_a\) is unitary, its eigenvalues lie on the unit circle: \(T_a|\theta\rangle = e^{i\theta}|\theta\rangle\) with \(\theta = ka\), \(k\in[-\pi/a, \pi/a]\) (the **first Brillouin zone**). By Bloch's theorem (proved in Appendix B), energy eigenstates have the form \(\psi_k(x) = e^{ikx}\,u_k(x)\) where \(u_k(x+a) = u_k(x)\).

The **tight-binding model** with on-site energy \(E_0\) and hopping amplitude \(\Delta\) gives band energies

\[E(\theta) = E_0 - 2\Delta\cos\theta, \qquad \theta = ka \in [-\pi, \pi],\]

the characteristic cosine band structure of condensed matter physics, with bandwidth \(4\Delta\).

---

## Chapter 6: Time Reversal

### 6.1 Why Time Reversal Must Be Anti-Unitary

**Time reversal** \(\Theta\) reverses the motion: \(\mathbf{p}\to-\mathbf{p}\), \(\mathbf{x}\to\mathbf{x}\), \(\mathbf{J}\to-\mathbf{J}\). One might assume \(\Theta\) is unitary, but this leads to a contradiction. If \(\Theta\) is unitary and the energy spectrum is bounded below, applying \(\Theta\) to a positive-energy eigenstate should give another positive-energy eigenstate. But from \([J_z, H] = 0\) and \(\Theta J_z\Theta^{-1} = -J_z\), a unitary \(\Theta\) would map \(|E,m\rangle\) to an eigenstate of \(J_z\) with eigenvalue \(-m\hbar\) and energy \(E\). Raising operators could then generate states with arbitrarily large \(|m|\) — contradicting the finite-dimensionality of each spin multiplet. More fundamentally, one can show that a unitary \(\Theta\) satisfying \(\Theta H\Theta^{-1}=H\) together with \(\Theta J_i\Theta^{-1}=-J_i\) leads to energy eigenvalues of both signs for any bounded system.

The resolution is that **\(\Theta\) is anti-unitary**: \(\Theta(c_1|\alpha\rangle + c_2|\beta\rangle) = c_1^*\Theta|\alpha\rangle + c_2^*\Theta|\beta\rangle\). By Wigner's theorem, symmetries of quantum mechanics are represented by either unitary or anti-unitary operators; time reversal falls in the latter category. Every anti-unitary operator can be written \(\Theta = UK\) where \(U\) is unitary and \(K\) is complex conjugation in some fixed basis.

### 6.2 Time Reversal of Fundamental Observables

In the position basis (where \(K\) acts as complex conjugation), \(P = -i\hbar\partial_x\) changes sign under \(K\) (since \(i\to-i\)), while \(X\) does not. Setting \(\Theta = K\) for a spinless particle gives the physically correct behaviour:

\[\Theta^\dagger X\Theta = X, \qquad \Theta^\dagger P\Theta = -P, \qquad \Theta^\dagger J_i\Theta = -J_i.\]

### 6.3 Time Reversal for Spin-1/2

For spin-1/2, complex conjugation in the \(S_z\) basis maps \(\sigma_y\to-\sigma_y\) (since \(\sigma_y\) is purely imaginary) but leaves \(\sigma_x, \sigma_z\) unchanged. To achieve \(\Theta S_i\Theta^{-1} = -S_i\) for all three components, we need an additional factor to flip \(S_x\) and \(S_z\). The correct choice is

\[\Theta = -i\sigma_y\,K\]

(up to a phase convention). One verifies \(\Theta S_i\Theta^{-1} = -S_i\) for all \(i\). Applying \(\Theta\) twice:

\[\Theta^2 = (-i\sigma_y K)(-i\sigma_y K) = (-i\sigma_y)(+i\sigma_y^*) = (-i\sigma_y)(+i\sigma_y) = -(i)^2\sigma_y^2\cdot(-1) = -\mathbf{1}.\]

So for spin-1/2, \(\Theta^2 = -\mathbf{1}\).

### 6.4 Kramers' Theorem

<div class="theorem">
<strong>Kramers' Theorem.</strong> For a system with half-integer total spin in a time-reversal-invariant Hamiltonian, every energy eigenvalue is at least doubly degenerate. The degenerate pair \(|E\rangle\) and \(\Theta|E\rangle\) are orthogonal and cannot be split by any time-reversal-invariant perturbation.
</div>

**Proof.** Since \([\Theta, H] = 0\), \(\Theta|E\rangle\) is also an eigenstate with energy \(E\). Suppose \(\Theta|E\rangle = c|E\rangle\) for some \(c\in\mathbb{C}\). Then \(\Theta^2|E\rangle = \Theta(c|E\rangle) = c^*c|E\rangle = |c|^2|E\rangle\). But \(\Theta^2 = -\mathbf{1}\) for half-integer spin, giving \(|c|^2 = -1\) — a contradiction. Therefore \(\Theta|E\rangle\) is linearly independent of \(|E\rangle\), and the energy level is at least doubly degenerate. \(\square\)

Kramers degeneracy is observable: atoms and molecules with an odd number of electrons retain doubly degenerate energy levels under any time-reversal-invariant perturbation (e.g., crystal fields without a magnetic component). It is a cornerstone of spintronics and topological insulator physics.

---

# Part III: Density Operators and Quantum Information

## Chapter 7: Density Operators and Mixed States

### 7.1 Pure and Mixed States

The single-ket description assumes complete knowledge of the quantum state. When a system is prepared with probability \(p_i\) in state \(|\psi_i\rangle\), the correct description is the **density operator**

\[\rho = \sum_i p_i\,|\psi_i\rangle\langle\psi_i|, \qquad \sum_i p_i = 1, \quad p_i \geq 0.\]

A **pure state** \(\rho = |\psi\rangle\langle\psi|\) satisfies \(\rho^2 = \rho\). A **mixed state** has \(\rho^2 \neq \rho\). In all cases \(\rho\) is Hermitian, positive semi-definite, and has unit trace. The expectation value of any observable is \(\langle A\rangle = \text{tr}(\rho A)\).

The **von Neumann entropy**

\[S(\rho) = -\text{tr}(\rho\ln\rho) = -\sum_i \lambda_i \ln\lambda_i\]

measures mixedness: \(S=0\) for a pure state, \(S = \ln d\) for the maximally mixed state in dimension \(d\).

### 7.2 Von Neumann Equation

Under Schrödinger dynamics, \(\rho(t) = U(t)\,\rho(0)\,U^\dagger(t)\). Differentiating gives the **von Neumann equation**:

\[i\hbar\frac{\partial\rho}{\partial t} = [H, \rho].\]

Note the sign is opposite to the Heisenberg equation for operators.

### 7.3 Reduced Density Operators

For a composite system \(\mathcal{H}_{AB} = \mathcal{H}_A\otimes\mathcal{H}_B\) in state \(\rho_{AB}\), the **reduced density operator** of subsystem \(A\) is

\[\rho_A = \text{tr}_B(\rho_{AB}) = \sum_j \langle j_B|\rho_{AB}|j_B\rangle.\]

All local predictions for measurements on \(A\) alone are correctly reproduced by \(\rho_A\). Crucially, even if the global state \(\rho_{AB}\) is pure, \(\rho_A\) may be mixed — this is the signature of entanglement.

---

## Chapter 8: Entanglement

### 8.1 Tensor Products and Entangled States

The combined system of subsystems \(A\) and \(B\) lives in the **tensor product** \(\mathcal{H}_A\otimes\mathcal{H}_B\). A general state \(|\Psi\rangle = \sum_{ij} c_{ij}\,|i_A\rangle\otimes|j_B\rangle\) is a **product state** if \(c_{ij} = a_i b_j\), giving \(|\Psi\rangle = |\phi_A\rangle\otimes|\chi_B\rangle\). Otherwise it is **entangled**: the state of \(A\) cannot be specified independently of \(B\).

### 8.2 Schmidt Decomposition

For any pure bipartite state \(|\Psi\rangle \in \mathcal{H}_A\otimes\mathcal{H}_B\), there exist orthonormal bases \(\{|u_k\rangle\}_A\) and \(\{|v_k\rangle\}_B\) such that

\[|\Psi\rangle = \sum_k \sqrt{p_k}\,|u_k\rangle\otimes|v_k\rangle, \qquad \sum_k p_k = 1, \quad p_k > 0.\]

The \(\sqrt{p_k}\) are the **Schmidt coefficients** (singular values of the coefficient matrix \(c_{ij}\)). A state is a product if and only if there is exactly one Schmidt coefficient. The reduced density operator is \(\rho_A = \sum_k p_k|u_k\rangle\langle u_k|\), so the Schmidt coefficients are the square roots of the eigenvalues of \(\rho_A\).

### 8.3 Bell States

The maximally entangled two-qubit states are the **Bell states**:

\[|\Phi^\pm\rangle = \frac{1}{\sqrt{2}}\left(|{++}\rangle \pm |{--}\rangle\right), \qquad |\Psi^\pm\rangle = \frac{1}{\sqrt{2}}\left(|{+-}\rangle \pm |{-+}\rangle\right).\]

Each has Schmidt coefficients \(\sqrt{1/2}, \sqrt{1/2}\), giving \(\rho_A = \mathbf{1}/2\) — the maximally mixed state. These four states form an orthonormal basis for \(\mathbb{C}^2\otimes\mathbb{C}^2\). Entanglement cannot be created by local operations on each qubit separately even with classical communication (LOCC); it is a genuinely nonlocal resource.

---

## Chapter 9: EPR, Bell's Theorem, and Quantum Teleportation

### 9.1 The Einstein-Podolsky-Rosen Paradox

In 1935, Einstein, Podolsky, and Rosen argued that quantum mechanics is incomplete. Consider two particles in the singlet state \(|\Psi^-\rangle = \frac{1}{\sqrt{2}}(|{+-}\rangle - |{-+}\rangle)\) separated by a large distance. A measurement of \(S_z\) on particle \(A\) yielding \(+\hbar/2\) instantly fixes particle \(B\) to be in state \(|-\rangle\). But one could equally measure \(S_x\), instantly fixing \(B\)'s \(S_x\) value. Since no physical influence can travel faster than light, EPR concluded that particle \(B\) must have had definite values for both observables all along — a **hidden variable** description. Since quantum mechanics does not assign simultaneous definite values to non-commuting observables, EPR concluded it was incomplete.

### 9.2 Bell's Theorem

In 1964, John Bell proved that no **local hidden variable theory** (LHVT) can reproduce all quantum predictions. For any LHVT, correlations between measurements by Alice (choosing direction \(\hat{a}\) or \(\hat{a}'\)) and Bob (choosing \(\hat{b}\) or \(\hat{b}'\)) with outcomes \(\pm 1\) must satisfy the **CHSH inequality**:

\[|E(\hat{a},\hat{b}) - E(\hat{a},\hat{b}')| + |E(\hat{a}',\hat{b}) + E(\hat{a}',\hat{b}')| \leq 2.\]

For the singlet state, quantum mechanics predicts \(E(\hat{a},\hat{b}) = -\hat{a}\cdot\hat{b}\). At the optimal angles \(0°, 45°, 90°, 135°\), the left-hand side equals \(2\sqrt{2} \approx 2.83\), violating the inequality. Loophole-free experiments (Aspect 1982, Hensen et al. 2015) confirm the quantum prediction, ruling out local realism.

### 9.3 Quantum Teleportation

Quantum teleportation transmits an unknown qubit state from Alice to Bob using a shared Bell pair and two classical bits, without sending any quantum system through the channel.

**Protocol.** Alice has an unknown qubit \(|\phi\rangle = \alpha|+\rangle + \beta|-\rangle\) (qubit 1) and one half of \(|\Phi^+\rangle_{23}\) (qubit 2); Bob holds qubit 3. Expanding the total three-qubit state in the Bell basis for qubits 1–2:

\[|\phi\rangle_1|\Phi^+\rangle_{23} = \frac{1}{2}\Big[|\Phi^+\rangle_{12}(\alpha|+\rangle+\beta|-\rangle)_3 + |\Phi^-\rangle_{12}(\alpha|+\rangle-\beta|-\rangle)_3\]
\[+\, |\Psi^+\rangle_{12}(\alpha|-\rangle+\beta|+\rangle)_3 + |\Psi^-\rangle_{12}(\alpha|-\rangle-\beta|+\rangle)_3\Big].\]

Alice measures qubits 1–2 in the Bell basis (obtaining one of four outcomes, each with probability 1/4) and sends the 2-bit result to Bob. Bob applies the appropriate Pauli correction (\(\mathbf{1},\, \sigma_z,\, \sigma_x,\) or \(\sigma_z\sigma_x\)) to qubit 3, which then carries the original state \(|\phi\rangle\). No faster-than-light signalling occurs; the classical message limits information transfer.

---

# Part IV: Perturbation Theory

## Chapter 10: Time-Independent Perturbation Theory — Non-Degenerate Case

### 10.1 The Setup

Write the Hamiltonian as \(H = H_0 + \lambda V\), where \(H_0|n^{(0)}\rangle = E_n^{(0)}|n^{(0)}\rangle\) is exactly solved and \(\lambda V\) is a small perturbation. Expanding:

\[E_n = E_n^{(0)} + \lambda E_n^{(1)} + \lambda^2 E_n^{(2)} + \cdots, \qquad |n\rangle = |n^{(0)}\rangle + \lambda|n^{(1)}\rangle + \lambda^2|n^{(2)}\rangle + \cdots.\]

### 10.2 First-Order Corrections

At order \(\lambda\), projecting \((H_0 - E_n^{(0)})|n^{(1)}\rangle = (E_n^{(1)} - V)|n^{(0)}\rangle\) onto \(\langle n^{(0)}|\) gives

\[E_n^{(1)} = \langle n^{(0)}|V|n^{(0)}\rangle.\]

The first-order energy shift is the expectation value of the perturbation. Projecting onto \(\langle m^{(0)}|\) with \(m\neq n\):

\[|n^{(1)}\rangle = \sum_{m\neq n} \frac{\langle m^{(0)}|V|n^{(0)}\rangle}{E_n^{(0)} - E_m^{(0)}}\,|m^{(0)}\rangle.\]

### 10.3 Second-Order Energy Correction

\[E_n^{(2)} = \sum_{m\neq n} \frac{|\langle m^{(0)}|V|n^{(0)}\rangle|^2}{E_n^{(0)} - E_m^{(0)}}.\]

For the **ground state**, all denominators are negative: \(E_0^{(2)} \leq 0\). Perturbations always lower the ground state energy to second order — a manifestation of "level repulsion" from higher states. The variational principle gives the same conclusion: any trial state lowers the ground-state energy relative to the true ground state only if there are higher states to mix in, which push the ground state downward.

---

## Chapter 11: Degenerate Perturbation Theory

### 11.1 Failure of the Non-Degenerate Formula

When \(E_n^{(0)} = E_m^{(0)}\) for some \(m\neq n\), the formula for \(|n^{(1)}\rangle\) has a vanishing denominator. Physically, within a degenerate subspace there is no preferred basis, and the perturbation selects the "good" basis by breaking the degeneracy.

### 11.2 The Good Basis

Within the degenerate subspace \(\mathcal{D}\), diagonalise the perturbation matrix

\[V_{ij} = \langle n_i^{(0)}|V|n_j^{(0)}\rangle.\]

The eigenstates of \(V_{\mathcal{D}}\) are the **good states** — the correct zeroth-order basis for convergent perturbation theory. Their eigenvalues are the first-order energy corrections. When a symmetry operator \(G\) commutes with both \(H_0\) and \(V\), its eigenvalue provides a **good quantum number** labelling states unambiguously within the degenerate subspace.

For example, in the fine structure of hydrogen, the degeneracy within each \(n\)-shell is broken by spin-orbit coupling \(V\propto\mathbf{L}\cdot\mathbf{S}\). The good quantum number is \(j\), since \([\mathbf{J}^2, \mathbf{L}\cdot\mathbf{S}] = 0\).

---

# Part V: Time-Dependent Perturbation Theory

## Chapter 12: The Interaction Picture

### 12.1 Motivation and Definition

When \(H = H_0 + V(t)\) with \(V(t)\) small, the Schrödinger and Heisenberg pictures are both awkward. The **interaction picture** removes the free evolution:

\[|\psi,t\rangle_I = e^{iH_0 t/\hbar}\,|\psi,t\rangle_S.\]

Its equation of motion is

\[i\hbar\frac{\partial}{\partial t}|\psi,t\rangle_I = V^{(I)}(t)\,|\psi,t\rangle_I, \qquad V^{(I)}(t) = e^{iH_0t/\hbar}\,V(t)\,e^{-iH_0t/\hbar}.\]

This derivation follows from differentiating and using \(i\hbar\partial_t|\psi\rangle_S = (H_0 + V)|\psi\rangle_S\). When \(V=0\), the interaction-picture states are constant — all the trivial dynamics has been absorbed into the operators.

### 12.2 The Dyson Series

Iterating the integral form of the interaction-picture equation gives the **Dyson series**:

\[|\psi,t\rangle_I = \sum_{n=0}^\infty \left(-\frac{i}{\hbar}\right)^n \int_{t_0}^t dt_1\int_{t_0}^{t_1}dt_2\cdots\int_{t_0}^{t_{n-1}}dt_n\, V^{(I)}(t_1)\cdots V^{(I)}(t_n)\,|\psi,t_0\rangle_I.\]

Truncating at first order in \(V\) gives first-order TDPT.

---

## Chapter 13: Two-State Systems and Rabi Oscillations

### 13.1 The Harmonic Two-Level System

Take

\[H_0 = E_1|1\rangle\langle 1| + E_2|2\rangle\langle 2|, \qquad V(t) = \hbar\gamma\left(e^{i\omega t}|1\rangle\langle 2| + e^{-i\omega t}|2\rangle\langle 1|\right).\]

In the interaction picture with \(|\psi\rangle_I = c_1(t)|1\rangle + c_2(t)|2\rangle\) and detuning \(\delta = \omega - \omega_{21}\) (\(\omega_{21} = (E_2-E_1)/\hbar\)):

\[\dot{c}_1 = -i\gamma\,e^{i\delta t}\,c_2, \qquad \dot{c}_2 = -i\gamma\,e^{-i\delta t}\,c_1.\]

### 13.2 Rabi's Formula

Starting in state \(|1\rangle\), the exact solution gives the **Rabi oscillation** formula:

\[P_{1\to 2}(t) = \frac{\gamma^2}{\gamma^2 + \delta^2/4}\,\sin^2\!\left(\sqrt{\gamma^2 + \delta^2/4}\;t\right).\]

At **resonance** \(\delta = 0\): complete oscillation between the two states with period \(\pi/\gamma\). Off resonance: faster oscillations (larger effective frequency) but incomplete transfer (maximum \(\gamma^2/(\gamma^2 + \delta^2/4) < 1\)).

### 13.3 Application: MRI

In **nuclear magnetic resonance**, a spin-1/2 nucleus in static field \(\mathbf{B}_0 = B_0\hat{z}\) has Hamiltonian \(H_0 = -\boldsymbol{\mu}\cdot\mathbf{B}_0\), splitting the two spin states by the **Larmor frequency** \(\omega_0 = eB_0/mc\). A rotating transverse field \(\mathbf{B}_1(t)\) at frequency \(\omega \approx \omega_0\) drives Rabi oscillations. By choosing the pulse duration, one effects a spin flip — the basis of RF pulses in MRI. Gradient coils create spatial variation in \(B_0\), giving different resonance frequencies at different positions and enabling spatial localisation.

---

## Chapter 14: Adiabatic Evolution and Berry Phase

### 14.1 The Adiabatic Theorem

If \(H(t)\) changes slowly compared to energy gaps, a system starting in the \(m\)-th instantaneous eigenstate \(|m;0\rangle\) remains in \(|m;t\rangle\) throughout. The adiabaticity condition is

\[\left|\frac{\langle n;t|\dot{H}|m;t\rangle}{(E_n - E_m)^2/\hbar}\right| \ll 1 \qquad \text{for all } n\neq m.\]

### 14.2 Berry Phase

Writing the phase factor as \(\theta_m = \theta_m^{\text{dyn}} + \gamma_m\) where the **dynamical phase** is \(\theta_m^{\text{dyn}} = -\frac{1}{\hbar}\int_0^t E_m(t')\,dt'\), substituting into the Schrödinger equation gives

\[\dot{\gamma}_m(t) = i\langle m;t|\dot{m};t\rangle.\]

After a closed loop in parameter space \(\mathbf{R}\), the accumulated **Berry phase** is

\[\gamma_m = i\oint \langle m;\mathbf{R}|\nabla_\mathbf{R}|m;\mathbf{R}\rangle\cdot d\mathbf{R} = \iint_S \boldsymbol{\Omega}_m\cdot d\mathbf{S},\]

where \(\boldsymbol{\Omega}_m = \nabla_\mathbf{R}\times\mathbf{A}_m\) is the **Berry curvature** and \(\mathbf{A}_m = i\langle m|\nabla_\mathbf{R}|m\rangle\) is the **Berry connection**. The Berry phase is gauge-invariant: it depends only on the path in parameter space, not on how fast it is traversed. Discovered by Berry in 1984, it underlies the quantum Hall effect, topological insulators, and Berry phases in molecular physics.

---

## Chapter 15: Fermi's Golden Rule

### 15.1 First-Order Transition Amplitudes

Starting in state \(|i\rangle\), the first-order amplitude to be in state \(|n\rangle\neq|i\rangle\) at time \(t\) is

\[c_n^{(1)}(t) = -\frac{i}{\hbar}\int_0^t dt'\,e^{i\omega_{ni}t'}\,V_{ni}(t'), \qquad \omega_{ni} = \frac{E_n - E_i}{\hbar}.\]

For a monochromatic perturbation \(V(t) = V_0 e^{-i\omega t} + V_0^\dagger e^{i\omega t}\), the transition probability is

\[|c_n^{(1)}(t)|^2 = \frac{|V_{ni}|^2}{\hbar^2}\,\frac{\sin^2[(\omega_{ni}-\omega)t/2]}{[(\omega_{ni}-\omega)/2]^2}.\]

### 15.2 Derivation

For large \(t\), the function \(\sin^2(\Delta\omega\, t/2)/(\Delta\omega/2)^2\) is sharply peaked at \(\Delta\omega=0\) with value \(t^2\) and width \(\sim 1/t\), approximating \(2\pi t\,\delta(\Delta\omega)\). The **transition rate** is

\[W_{i\to n} = \frac{d|c_n|^2}{dt} = \frac{2\pi}{\hbar}\,|V_{ni}|^2\,\delta(E_n - E_i - \hbar\omega).\]

This is **Fermi's Golden Rule**. For final states in a continuum with density of states \(\rho(E)\):

\[\Gamma = \frac{2\pi}{\hbar}\,|V_{ni}|^2\,\rho(E_i + \hbar\omega).\]

The delta function enforces energy conservation. The rule is the workhorse of transition-rate calculations across atomic, nuclear, and particle physics.

### 15.3 Finite Lifetime and Second-Order Effects

The transition probability \(\sum_{n\neq i}|c_n^{(1)}(t)|^2\) increases linearly in time at rate \(\Gamma_i\), implying exponential depletion of the initial state: \(|c_i|^2\approx e^{-\Gamma_i t}\) with **lifetime** \(\tau_i = 1/\Gamma_i\). A finite lifetime implies, by the energy-time uncertainty principle, a Lorentzian spectral lineshape with width \(\hbar/\tau_i\). At second order in perturbation theory, the energy of the initial state acquires an imaginary part \(-i\hbar\Gamma_i/2\), encoding this decay.

---

## Chapter 16: Light-Matter Interaction

### 16.1 Minimal Coupling

The interaction of a charged particle with an electromagnetic field (in Coulomb gauge \(\nabla\cdot\mathbf{A}=0\)) is described by the Hamiltonian

\[H = \frac{1}{2m}\!\left(\mathbf{p} - \frac{e}{c}\mathbf{A}\right)^2 + V(\mathbf{r}) \approx \frac{p^2}{2m} + V(\mathbf{r}) - \frac{e}{mc}\mathbf{A}\cdot\mathbf{p},\]

dropping the \(\mathbf{A}^2\) term in the weak-field limit. The perturbation \(V = -(e/mc)\mathbf{A}\cdot\mathbf{p}\) drives transitions between atomic states.

### 16.2 Dipole Approximation and Selection Rules

For optical wavelengths (\(\lambda \sim 500\,\text{nm}\)) and atomic sizes (\(a_0\sim 0.05\,\text{nm}\)), \(e^{i\mathbf{k}\cdot\mathbf{r}}\approx 1\) in the atomic volume (**electric dipole approximation**). The matrix element reduces to \(V_{ni}\propto\hat{\boldsymbol{\epsilon}}\cdot\mathbf{p}_{ni}\), which via \(\mathbf{p}_{ni} = im\omega_{ni}\mathbf{r}_{ni}\) becomes an electric dipole coupling.

By the parity argument: \(\mathbf{r}\) is parity-odd, so \(\langle n|\mathbf{r}|i\rangle\) is non-zero only between states of opposite parity, giving \(\Delta\ell = \pm 1\). Rotational invariance gives \(\Delta m = 0, \pm 1\). These are the **electric dipole selection rules**.

<svg viewBox="0 0 400 280" xmlns="http://www.w3.org/2000/svg" style="max-width:400px;display:block;margin:1.5em auto">
  <defs>
    <marker id="sel-arr" markerWidth="7" markerHeight="5" refX="7" refY="2.5" orient="auto">
      <polygon points="0 0, 7 2.5, 0 5" fill="#3b82f6"/>
    </marker>
    <marker id="sel-arr-r" markerWidth="7" markerHeight="5" refX="7" refY="2.5" orient="auto">
      <polygon points="0 0, 7 2.5, 0 5" fill="#ef4444"/>
    </marker>
  </defs>
  <!-- Title -->
  <text x="200" y="18" text-anchor="middle" font-size="12" fill="currentColor">Electric Dipole Selection Rules: Δℓ = ±1, Δm = 0,±1</text>
  <!-- ℓ=0 level (s) -->
  <line x1="170" y1="250" x2="230" y2="250" stroke="currentColor" stroke-width="2"/>
  <text x="155" y="255" font-size="11" fill="currentColor">ℓ=0</text>
  <text x="200" y="265" text-anchor="middle" font-size="10" fill="currentColor">m=0</text>
  <!-- ℓ=1 levels (p) -->
  <line x1="60" y1="170" x2="120" y2="170" stroke="currentColor" stroke-width="2"/>
  <line x1="170" y1="170" x2="230" y2="170" stroke="currentColor" stroke-width="2"/>
  <line x1="280" y1="170" x2="340" y2="170" stroke="currentColor" stroke-width="2"/>
  <text x="45" y="175" font-size="11" fill="currentColor">ℓ=1</text>
  <text x="90" y="185" text-anchor="middle" font-size="10" fill="currentColor">m=−1</text>
  <text x="200" y="185" text-anchor="middle" font-size="10" fill="currentColor">m=0</text>
  <text x="310" y="185" text-anchor="middle" font-size="10" fill="currentColor">m=+1</text>
  <!-- ℓ=2 levels (d) -->
  <line x1="20" y1="90" x2="80" y2="90" stroke="currentColor" stroke-width="2"/>
  <line x1="100" y1="90" x2="160" y2="90" stroke="currentColor" stroke-width="2"/>
  <line x1="170" y1="90" x2="230" y2="90" stroke="currentColor" stroke-width="2"/>
  <line x1="240" y1="90" x2="300" y2="90" stroke="currentColor" stroke-width="2"/>
  <line x1="320" y1="90" x2="380" y2="90" stroke="currentColor" stroke-width="2"/>
  <text x="5" y="95" font-size="11" fill="currentColor">ℓ=2</text>
  <text x="50" y="104" text-anchor="middle" font-size="10" fill="currentColor">m=−2</text>
  <text x="130" y="104" text-anchor="middle" font-size="10" fill="currentColor">m=−1</text>
  <text x="200" y="104" text-anchor="middle" font-size="10" fill="currentColor">m=0</text>
  <text x="270" y="104" text-anchor="middle" font-size="10" fill="currentColor">m=+1</text>
  <text x="350" y="104" text-anchor="middle" font-size="10" fill="currentColor">m=+2</text>
  <!-- Allowed transitions ℓ=0 → ℓ=1, Δm=0 and ±1 -->
  <line x1="200" y1="248" x2="200" y2="174" stroke="#3b82f6" stroke-width="2" marker-end="url(#sel-arr)"/>
  <line x1="200" y1="248" x2="92" y2="174" stroke="#3b82f6" stroke-width="2" marker-end="url(#sel-arr)"/>
  <line x1="200" y1="248" x2="308" y2="174" stroke="#3b82f6" stroke-width="2" marker-end="url(#sel-arr)"/>
  <!-- Allowed transitions ℓ=1(m=0) → ℓ=2 -->
  <line x1="200" y1="168" x2="132" y2="94" stroke="#3b82f6" stroke-width="1.6" stroke-dasharray="5,3" marker-end="url(#sel-arr)"/>
  <line x1="200" y1="168" x2="200" y2="94" stroke="#3b82f6" stroke-width="1.6" stroke-dasharray="5,3" marker-end="url(#sel-arr)"/>
  <line x1="200" y1="168" x2="268" y2="94" stroke="#3b82f6" stroke-width="1.6" stroke-dasharray="5,3" marker-end="url(#sel-arr)"/>
  <!-- Forbidden label -->
  <text x="340" y="220" font-size="10" fill="#ef4444">✗ Δℓ=0</text>
  <line x1="310" y1="170" x2="280" y2="170" stroke="#ef4444" stroke-width="1.5" stroke-dasharray="4,3"/>
  <!-- Legend -->
  <text x="200" y="275" text-anchor="middle" font-size="11" fill="currentColor">Solid: ℓ=0↔1   Dashed: ℓ=1↔2   (Δℓ = ±1, Δm = 0,±1)</text>
</svg>

### 16.3 Photoelectric Effect

At high photon energies, atoms are ionised. The transition is from a bound state \(|n\ell m\rangle\) to a continuum free-electron state. By Fermi's Golden Rule, the photoelectric cross-section is

\[\sigma \propto \frac{e^2\omega}{mc}\,|\langle\mathbf{p}|\hat{\boldsymbol{\epsilon}}\cdot\mathbf{r}|n\ell m\rangle|^2\,\rho(E_f).\]

Einstein's 1905 result — that the ejected electron energy \(E_f = \hbar\omega - E_{\text{bind}}\) depends on frequency, not intensity — follows directly: energy conservation at each photon absorption gives a fixed kinetic energy. The quantum mechanical cross-section further explains the differential distribution in emission angle.

---

# Part VI: Relativistic Quantum Mechanics

## Chapter 17: Special Relativity Review

### 17.1 Four-Vectors and the Minkowski Metric

Special relativity rests on two postulates: the laws of physics are the same in all inertial frames, and the speed of light \(c\) is universal. The invariant is the spacetime interval

\[ds^2 = c^2\,dt^2 - d\ell^2 = \eta_{\mu\nu}\,dx^\mu\,dx^\nu,\]

with Minkowski metric \(\eta_{\mu\nu} = \text{diag}(+1,-1,-1,-1)\). Four-vectors: \(x^\mu = (ct,\mathbf{x})\) (contravariant), \(x_\mu = \eta_{\mu\nu}x^\nu = (ct,-\mathbf{x})\) (covariant). Proper time: \(d\tau = dt\sqrt{1-v^2/c^2}\). Four-momentum: \(p^\mu = (E/c, \mathbf{p})\). The Lorentz-invariant dispersion relation is

\[p^\mu p_\mu = m^2c^2 \implies E^2 = (mc^2)^2 + (|\mathbf{p}|c)^2.\]

In natural units (\(\hbar = c = 1\)): \(E^2 = m^2 + |\mathbf{p}|^2\).

---

## Chapter 18: The Klein-Gordon Equation and Its Failure

### 18.1 From Dispersion Relation to Wave Equation

Promoting \(E\to i\hbar\partial_t\) and \(\mathbf{p}\to -i\hbar\nabla\) in \(E^2 = m^2 + p^2\) (natural units) gives the **Klein-Gordon equation**

\[(\partial_\mu\partial^\mu + m^2)\psi = (\Box + m^2)\psi = 0.\]

It is Lorentz invariant and admits plane-wave solutions \(\psi = e^{-ip\cdot x}\) with \(E = \pm\sqrt{|\mathbf{p}|^2 + m^2}\).

### 18.2 The Negative Probability Problem

The conserved current is \(j^\mu = i(\psi^*\partial^\mu\psi - \psi\partial^\mu\psi^*)\). For the plane wave, \(\rho = j^0 = 2E\), which is negative for negative-energy solutions. A negative probability density is unphysical; the Klein-Gordon equation cannot serve as a single-particle wave equation. (It is correct for spin-0 bosons as a **field** equation, but that requires a different interpretation.)

---

## Chapter 19: The Dirac Equation

### 19.1 Dirac's Insight: A First-Order Equation

Dirac sought a wave equation **first order in all derivatives**, so that the probability density \(\rho = \psi^\dagger\psi \geq 0\) would be automatically positive definite. He wrote

\[(i\gamma^\mu\partial_\mu - m)\psi = 0.\]

Squaring the operator to recover Klein-Gordon requires

\[\{\gamma^\mu, \gamma^\nu\} = 2\eta^{\mu\nu}\mathbf{1},\]

the **Clifford algebra**. These relations cannot be satisfied by ordinary numbers; \(\gamma^\mu\) must be matrices and \(\psi\) must be a multi-component **spinor**.

### 19.2 Gamma Matrices: Dirac Representation

The minimal matrices satisfying the Clifford algebra are \(4\times4\). In the **Dirac representation**:

\[\gamma^0 = \begin{pmatrix}\mathbf{1} & 0 \\ 0 & -\mathbf{1}\end{pmatrix}, \qquad \gamma^i = \begin{pmatrix}0 & \sigma^i \\ -\sigma^i & 0\end{pmatrix}.\]

One verifies \((\gamma^0)^2 = \mathbf{1}\), \((\gamma^i)^2 = -\mathbf{1}\), and \(\{\gamma^\mu,\gamma^\nu\} = 2\eta^{\mu\nu}\). The Dirac equation can be written as \(i\partial_t\psi = H_D\psi\) with the **Dirac Hamiltonian**

\[H_D = \boldsymbol{\alpha}\cdot\mathbf{p} + \beta m, \qquad \alpha^i = \begin{pmatrix}0 & \sigma^i \\ \sigma^i & 0\end{pmatrix}, \qquad \beta = \gamma^0.\]

### 19.3 Probability Current

From the Dirac equation and its adjoint, one derives the continuity equation \(\partial_\mu j^\mu = 0\) with

\[j^\mu = \bar{\psi}\gamma^\mu\psi, \qquad \bar{\psi} = \psi^\dagger\gamma^0.\]

The probability density is \(\rho = j^0 = \psi^\dagger\gamma^0\gamma^0\psi = \psi^\dagger\psi \geq 0\) — always non-negative. Dirac has resolved the Klein-Gordon problem.

### 19.4 Plane Wave Solutions

Free-particle positive-energy solutions take the form \(\psi = u(p)\,e^{-ip\cdot x}\) where the bispinor \(u = \binom{\phi}{\chi}\) satisfies

\[\chi = \frac{\boldsymbol{\sigma}\cdot\mathbf{p}}{E+m}\,\phi.\]

For each choice of the two-component spinor \(\phi\), this gives one of two independent solutions — the two spin states of the particle. The **helicity** operator \(\hat{h} = \boldsymbol{\sigma}\cdot\hat{\mathbf{p}}/2\) measures spin projection along the momentum.

---

## Chapter 20: Physics of the Dirac Equation

### 20.1 Non-Relativistic Limit: Spin and \(g=2\)

In the non-relativistic limit \(|\mathbf{p}|\ll m\), the lower two components \(\chi\) are suppressed by \(v/c\) relative to \(\phi\). Coupling to an electromagnetic field via \(\mathbf{p}\to\mathbf{p}-e\mathbf{A}/c\) and eliminating \(\chi\) gives the **Pauli equation** for the large component:

\[i\partial_t\phi = \left[\frac{(\mathbf{p}-e\mathbf{A}/c)^2}{2m} + eA^0 - \frac{e}{mc}\,\mathbf{S}\cdot\mathbf{B}\right]\phi,\]

with \(\mathbf{S} = \frac{\hbar}{2}\boldsymbol{\sigma}\). The gyromagnetic ratio \(g=2\) emerges automatically — a prediction that stunned physicists in 1928. The Bohr magneton is \(\mu_B = e\hbar/2mc\), and the intrinsic magnetic moment is \(\mu_e = g\mu_B/2 = \mu_B\) (before QED corrections).

### 20.2 Negative Energy and the Dirac Sea

Negative-energy solutions (\(E = -\sqrt{|\mathbf{p}|^2+m^2} < 0\)) remain problematic: a positive-energy electron could radiate and cascade to arbitrarily negative energies. Dirac's resolution: the vacuum has **all negative-energy states filled** (the Dirac sea). The Pauli exclusion principle prevents any positive-energy electron from falling into a filled state. A **hole** — a missing negative-energy electron — behaves as a positive-energy particle with opposite charge: the **positron**, predicted 1930, discovered by Anderson 1932. This prediction of antimatter was Dirac's greatest triumph.

---

## Chapter 21: Ultra-Relativistic Limit and Weyl Equations

### 21.1 Chirality and \(\gamma^5\)

Define the **chirality matrix**

\[\gamma^5 = i\gamma^0\gamma^1\gamma^2\gamma^3.\]

It satisfies \((\gamma^5)^2 = \mathbf{1}\), \(\{\gamma^5,\gamma^\mu\} = 0\), and \((\gamma^5)^\dagger = \gamma^5\). The projectors \(P_\pm = (1\pm\gamma^5)/2\) split any Dirac spinor into **right-handed** (\(+1\)) and **left-handed** (\(-1\)) **Weyl spinors**: \(\psi = \psi_R + \psi_L\).

For a **massless** particle, the Dirac equation in the **Weyl representation** (where \(\gamma^5\) is diagonal) decouples into two independent **Weyl equations**:

\[i\partial_t\psi_R = +\boldsymbol{\sigma}\cdot\mathbf{p}\,\psi_R, \qquad i\partial_t\psi_L = -\boldsymbol{\sigma}\cdot\mathbf{p}\,\psi_L.\]

Right-handed: spin parallel to momentum (\(\boldsymbol{\sigma}\cdot\hat{\mathbf{p}} = +1\)). Left-handed: spin antiparallel (\(\boldsymbol{\sigma}\cdot\hat{\mathbf{p}} = -1\)). For a massive particle, the mass term \(m\bar\psi\psi = m(\psi_R^\dagger\psi_L + \psi_L^\dagger\psi_R)\) mixes the two chiralities; chirality is conserved only in the massless limit.

Weyl fermions describe massless neutrinos (approximately, for energies above their tiny mass) and the quasiparticles in Weyl semimetals — a prediction of this 1929 equation confirmed experimentally in 2015.

---

## Chapter 22: Symmetries of the Dirac Equation

### 22.1 Parity

Under \(\mathbf{x}\to-\mathbf{x}\), \(\mathbf{p}\to-\mathbf{p}\) and \(H_D(\mathbf{p})\to -\boldsymbol{\alpha}\cdot\mathbf{p}+\beta m\). For parity to be a symmetry, we need a matrix \(P\) with \(P\boldsymbol{\alpha}P^{-1} = -\boldsymbol{\alpha}\) and \(P\beta P^{-1} = \beta\). The solution is \(P = \gamma^0\) (since \(\{\gamma^0,\gamma^i\}=0\) for \(i\neq0\)). The parity-transformed wavefunction is

\[\psi'(t, \mathbf{x}) = \gamma^0\,\psi(t, -\mathbf{x}).\]

The bilinear \(\bar\psi\psi\) is a scalar (even under parity); \(\bar\psi\gamma^5\psi\) is a pseudoscalar (odd); \(\bar\psi\gamma^\mu\psi\) is a four-vector; \(\bar\psi\gamma^\mu\gamma^5\psi\) is an axial four-vector (odd).

### 22.2 Time Reversal

Time reversal in the Dirac representation is the anti-unitary operator \(T = i\gamma^1\gamma^3\,K\), mapping \(\psi(t,\mathbf{x})\to T\psi(-t,\mathbf{x})\). Note that \(\gamma^5\) is odd under parity but even under time reversal — chirality is a parity-odd, time-reversal-even property.

### 22.3 Charge Conjugation and CPT

**Charge conjugation** \(\mathcal{C}\) exchanges particles and antiparticles: \(\psi\to\psi^c = C\bar\psi^T\) where \(C = i\gamma^2\gamma^0\). The combined \(\mathcal{CPT}\) symmetry is exact in any Lorentz-invariant local quantum field theory. Individual violations of \(\mathcal{C}\), \(\mathcal{P}\), and \(\mathcal{T}\) all occur in the weak interaction. CPT violation would signal a breakdown of Lorentz invariance itself.

---

# Appendix A: Dirac Spinors

The four independent plane-wave solutions to the free Dirac equation, labelled by energy sign and helicity:

| Solution | Physical meaning | Energy | Helicity |
|----------|-----------------|--------|----------|
| \(u_+(\mathbf{p})\) | electron, spin-up | \(+E_p\) | \(+1/2\) |
| \(u_-(\mathbf{p})\) | electron, spin-down | \(+E_p\) | \(-1/2\) |
| \(v_+(\mathbf{p})\) | positron, spin-up | \(-E_p\) | \(+1/2\) |
| \(v_-(\mathbf{p})\) | positron, spin-down | \(-E_p\) | \(-1/2\) |

Here \(E_p = \sqrt{|\mathbf{p}|^2 + m^2}\). The positron spinors \(v_\pm\) are related to \(u_\mp\) by charge conjugation \(\mathcal{C}\).

In the **non-relativistic limit** \(|\mathbf{p}|\ll m\), the lower two components of \(u_\pm\) are suppressed by \(|\mathbf{p}|/2m\): the upper components are "large" (describing particles) and the lower are "small."

In the **ultra-relativistic limit** \(|\mathbf{p}|\gg m\), the Dirac spinors approach the Weyl spinors: \(u_\pm \to \binom{\phi_\pm}{\pm\phi_\pm}\), and helicity eigenstates coincide with chirality eigenstates.

---

# Appendix B: Bloch's Theorem

<div class="theorem">
<strong>Bloch's Theorem.</strong> For a Hamiltonian \(H = \mathbf{p}^2/2m + V(\mathbf{x})\) with periodic potential \(V(\mathbf{x}+\mathbf{a}) = V(\mathbf{x})\), every energy eigenstate has the form \(\psi_k(\mathbf{x}) = e^{i\mathbf{k}\cdot\mathbf{x}}\,u_k(\mathbf{x})\) where \(u_k(\mathbf{x}+\mathbf{a}) = u_k(\mathbf{x})\) is periodic with the same period as the lattice.
</div>

**Proof.** The discrete translation operator \(T_a\) commutes with \(H\) (since \(V\) and the kinetic energy are both periodic). Since \(T_a\) is unitary, its eigenvalues lie on the unit circle: \(T_a\psi = e^{ika}\psi\) for some real \(k\). Define \(u_k(x) = e^{-ikx}\psi_k(x)\). Then

\[u_k(x+a) = e^{-ik(x+a)}\psi_k(x+a) = e^{-ikx-ika}\cdot e^{ika}\psi_k(x) = e^{-ikx}\psi_k(x) = u_k(x),\]

so \(u_k\) is periodic and \(\psi_k(x) = e^{ikx}u_k(x)\). \(\square\)

The **crystal momentum** \(\hbar k\) is defined modulo \(2\pi\hbar/a\); \(k\) is conventionally in the first Brillouin zone \(k\in(-\pi/a,\pi/a]\). Different bands correspond to different periodic functions \(u_k\) for the same \(k\).
