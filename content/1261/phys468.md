---
title: "PHYS 468: Introduction to the Implementation of Quantum Information Processing"
prof: Kevin Resch
subjects: "PHYS"
---

## Sources and References

**Primary textbook** — Majidy, S., Wilson, E., & Laflamme, R. (2024). *Building Quantum Computers: A Practical Introduction*. Cambridge University Press. (QA76.889 M35, Davis Library.)
**Supplementary texts** — Nielsen, M. A., & Chuang, I. L. (2010). *Quantum Computation and Quantum Information*, 10th anniversary ed. Cambridge University Press; Griffiths, D. J., & Schroeter, D. F. (2018). *Introduction to Quantum Mechanics*, 3rd ed. Cambridge University Press.
**Online resources** — Qiskit textbook (qiskit.org/learn); IBM Quantum Experience; arXiv quant-ph.

---

# Chapter 1: Introduction to Quantum Computing

## 1.1 Classical vs. Quantum Information

A **classical bit** stores one of two values: 0 or 1. It is deterministic; operations are classical logic gates.

A **qubit** (quantum bit) is a two-level quantum system that can exist in a **superposition** of \( |0\rangle \) and \( |1\rangle \):
\[ |\psi\rangle = \alpha |0\rangle + \beta |1\rangle, \quad |\alpha|^2 + |\beta|^2 = 1 \]

where \( \alpha, \beta \in \mathbb{C} \) are **amplitudes**. The probabilities of measuring 0 or 1 are \( |\alpha|^2 \) and \( |\beta|^2 \) respectively.

<div class="remark">
A qubit does not store "both 0 and 1 at once" — it is in a superposition state that <em>collapses</em> to a definite value upon measurement. The quantum advantage comes from manipulating superpositions and entanglement in ways that make certain computations exponentially more efficient, not from "parallel classical computation."
</div>

## 1.2 The Bloch Sphere

A single qubit state (up to global phase) can be parameterized as:
\[ |\psi\rangle = \cos(\theta/2)|0\rangle + e^{i\varphi}\sin(\theta/2)|1\rangle \]
with \( \theta \in [0, \pi] \), \( \varphi \in [0, 2\pi) \). This maps each qubit state to a point on the **Bloch sphere** (unit 2-sphere in 3D). The north pole is \( |0\rangle \), south pole is \( |1\rangle \); equatorial points are equal superpositions with various phases.

Single-qubit gates are **rotations** of the Bloch sphere.

## 1.3 Multiple Qubits and Entanglement

An \( n \)-qubit system lives in a \( 2^n \)-dimensional Hilbert space \( \mathcal{H} = (\mathbb{C}^2)^{\otimes n} \). A general state:
\[ |\psi\rangle = \sum_{x \in \{0,1\}^n} c_x |x\rangle, \quad \sum_x |c_x|^2 = 1 \]

**Entanglement**: A bipartite state is **entangled** if it cannot be written as a product state \( |\psi\rangle = |\psi_A\rangle \otimes |\psi_B\rangle \).

<div class="definition">
The <strong>Bell states</strong> (maximally entangled two-qubit states):
\[|\Phi^+\rangle = \frac{1}{\sqrt{2}}(|00\rangle + |11\rangle)\]
\[|\Phi^-\rangle = \frac{1}{\sqrt{2}}(|00\rangle - |11\rangle)\]
\[|\Psi^+\rangle = \frac{1}{\sqrt{2}}(|01\rangle + |10\rangle)\]
\[|\Psi^-\rangle = \frac{1}{\sqrt{2}}(|01\rangle - |10\rangle)\]
Entanglement enables quantum teleportation, superdense coding, and quantum key distribution.
</div>

## 1.4 DiVincenzo Criteria

For a physical system to serve as a quantum computer, it must satisfy the **DiVincenzo criteria** (2000):
1. A scalable physical system with well-characterized qubits.
2. Ability to initialize qubits to a simple fiducial state (e.g., \( |000\ldots0\rangle \)).
3. Long coherence times — much longer than gate operation times.
4. A "universal" set of quantum gates.
5. Qubit-specific measurement capability.

Plus (for quantum communication):
6. Ability to interconvert stationary and flying qubits.
7. Ability to faithfully transmit flying qubits between specified locations.

## 1.5 Quantum Advantage

**Shor's algorithm** (1994): factors \( N \)-bit integers in \( \mathcal{O}(N^2 \log N) \) quantum time, vs. sub-exponential classical algorithms. A sufficiently large quantum computer breaks RSA encryption.

**Grover's algorithm** (1996): searches an unsorted database of \( N \) items in \( \mathcal{O}(\sqrt{N}) \) time, vs. \( \mathcal{O}(N) \) classically. Quadratic speedup.

**Quantum simulation**: simulating quantum systems (chemistry, materials science, condensed matter) is exponentially hard classically but natural on a quantum computer. Most near-term applications.

**Quantum supremacy/advantage**: Google's 53-qubit Sycamore processor (2019) performed a specific random circuit sampling task in 200 seconds that would take classical computers ~10,000 years.

---

# Chapter 2: Quantum Mechanics for Quantum Computing

## 2.1 Hilbert Space and Dirac Notation

The state of a quantum system is a normalized vector in a complex Hilbert space \( \mathcal{H} \). **Dirac notation**: kets \( |\psi\rangle \) for state vectors, bras \( \langle\psi| \) for their duals (complex conjugate transpose), inner product \( \langle\phi|\psi\rangle \in \mathbb{C} \).

**Orthonormal basis**: \( \{|e_i\rangle\} \) with \( \langle e_i | e_j \rangle = \delta_{ij} \). For qubits, the computational basis is \( \{|0\rangle, |1\rangle\} \):
\[ |0\rangle = \begin{pmatrix} 1 \\ 0 \end{pmatrix}, \quad |1\rangle = \begin{pmatrix} 0 \\ 1 \end{pmatrix} \]

**Operators**: linear maps on \( \mathcal{H} \). Observables are Hermitian: \( A = A^\dagger \). Unitary operators (\( U^\dagger U = I \)) describe reversible quantum evolution.

## 2.2 Quantum Gates as Unitary Operators

Single-qubit gates are \( 2\times 2 \) unitary matrices. Key gates:

| Gate | Matrix | Bloch sphere action |
|------|--------|---------------------|
| **Pauli X** (NOT) | \( \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix} \) | π rotation about x-axis |
| **Pauli Y** | \( \begin{pmatrix} 0 & -i \\ i & 0 \end{pmatrix} \) | π rotation about y-axis |
| **Pauli Z** (phase flip) | \( \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix} \) | π rotation about z-axis |
| **Hadamard H** | \( \frac{1}{\sqrt{2}}\begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix} \) | Maps \( \|0\rangle \leftrightarrow \|+\rangle \); creates superposition |
| **Phase gate S** | \( \begin{pmatrix} 1 & 0 \\ 0 & i \end{pmatrix} \) | π/2 rotation about z-axis |
| **T gate** | \( \begin{pmatrix} 1 & 0 \\ 0 & e^{i\pi/4} \end{pmatrix} \) | π/4 rotation about z-axis |

General rotation about axis \( \hat{n} \) by angle \( \theta \):
\[ R_{\hat{n}}(\theta) = e^{-i\theta\hat{n}\cdot\vec{\sigma}/2} = \cos(\theta/2)I - i\sin(\theta/2)(\hat{n}\cdot\vec{\sigma}) \]

where \( \vec{\sigma} = (X, Y, Z) \) are the Pauli matrices.

**Two-qubit gates**:
- **CNOT** (controlled-NOT): flips the target qubit if the control is \( |1\rangle \). Together with single-qubit gates, CNOT is **universal** for quantum computation.
- **CZ** (controlled-Z): applies Z to target if control is \( |1\rangle \). Symmetric in photonic implementations.
- **SWAP**: exchanges states of two qubits.
- **Toffoli** (CCNOT): doubly-controlled NOT; universal for reversible classical computation.

## 2.3 Quantum Circuits

A **quantum circuit** is a sequence of quantum gates applied to a set of qubits. Read left to right; time flows left to right. Measurement is represented by a meter symbol.

**Circuit depth**: the number of time steps (parallel layers of gates). Minimizing depth reduces decoherence effects.

**Universality**: any unitary operation can be decomposed into a sequence of CNOT + single-qubit gates (Solovay-Kitaev theorem: efficient decomposition is always possible). The set \( \{H, T, \text{CNOT}\} \) is universal.

## 2.4 Density Matrices and Mixed States

For systems in **mixed states** (statistical ensembles of pure states) or when describing part of an entangled system, we use the **density matrix** formalism:
\[ \rho = \sum_i p_i |\psi_i\rangle\langle\psi_i|, \quad \text{Tr}(\rho) = 1, \quad \rho \geq 0 \]

For a pure state: \( \rho = |\psi\rangle\langle\psi| \), \( \rho^2 = \rho \), \( \text{Tr}(\rho^2) = 1 \).
For a mixed state: \( \text{Tr}(\rho^2) < 1 \).

**Decoherence**: unwanted entanglement with the environment causes the density matrix to decay off-diagonal (loss of coherence between basis states), degrading qubit quality.

---

# Chapter 3: Quantum Methods — Rotating Frames and Approximations

## 3.1 Time-Dependent Hamiltonians and Interaction Picture

In quantum computing, qubits are controlled by time-dependent fields (microwave pulses, laser pulses). The total Hamiltonian:
\[ H(t) = H_0 + H_{drive}(t) \]

where \( H_0 \) is the free qubit Hamiltonian (energy splitting) and \( H_{drive}(t) \) is the control.

**Interaction picture** (Dirac picture): transform to a frame rotating at the qubit's natural frequency \( \omega_0 \). Define:
\[ |\tilde{\psi}(t)\rangle = e^{iH_0 t/\hbar}|\psi(t)\rangle \]

The state evolves under the **interaction Hamiltonian** alone:
\[ i\hbar\frac{d}{dt}|\tilde{\psi}\rangle = \tilde{H}_{drive}(t)|\tilde{\psi}\rangle \]
where \( \tilde{H}_{drive} = e^{iH_0 t/\hbar} H_{drive} e^{-iH_0 t/\hbar} \).

## 3.2 Rotating Wave Approximation (RWA)

When the drive is resonant or near-resonant with the qubit (\( \omega_{drive} \approx \omega_0 \)), and the drive amplitude is much smaller than the qubit frequency, we apply the **rotating wave approximation (RWA)**:

For a qubit driven at frequency \( \omega_{drive} \), the drive contains terms oscillating at \( \omega_0 - \omega_{drive} \) (slowly rotating, resonant) and \( \omega_0 + \omega_{drive} \) (rapidly oscillating, "counter-rotating"). The RWA drops the rapidly oscillating terms, which time-average to zero.

Result: in the rotating frame, the effective Hamiltonian is time-independent:
\[ \tilde{H} = \frac{\hbar}{2}\begin{pmatrix} -\Delta & \Omega \\ \Omega & \Delta \end{pmatrix} \]
where \( \Delta = \omega_{drive} - \omega_0 \) is the **detuning** and \( \Omega \) is the **Rabi frequency** (proportional to drive amplitude).

**On resonance** (\( \Delta = 0 \)): the state undergoes **Rabi oscillations** between \( |0\rangle \) and \( |1\rangle \) at frequency \( \Omega \). A π-pulse (\( \Omega t = \pi \)) performs a NOT operation.

## 3.3 Quantum Error Correction Basics

No physical qubit is perfect; errors accumulate from decoherence, gate imperfections, and measurement errors.

**Quantum error correction (QEC)**: encode one **logical qubit** into multiple **physical qubits** so that errors on individual physical qubits can be detected and corrected without measuring the logical state.

Key insight: the **no-cloning theorem** prevents copying quantum states, but QEC encodes information redundantly in entangled states, not copies.

**Three-qubit bit-flip code**: encodes \( \alpha|0\rangle + \beta|1\rangle \) as \( \alpha|000\rangle + \beta|111\rangle \). A bit-flip on any one qubit produces a correctable syndrome (detected by majority vote without revealing the logical state).

**Surface code**: the leading candidate for fault-tolerant quantum computing. Encodes one logical qubit in a 2D array of \( d^2 \) physical qubits. Threshold error rate ~1%: if physical error rates are below threshold, adding more physical qubits reduces logical error exponentially.

---

# Chapter 4: NMR Quantum Computing

## 4.1 Nuclear Magnetic Resonance (NMR) Fundamentals

<div class="definition">
<strong>NMR quantum computing</strong> uses nuclear spins of atoms in molecules as qubits, controlled by radiofrequency (RF) pulses and read out via bulk magnetization measurements.
</div>

**Qubit**: nuclear spin-1/2 (\( ^1\text{H} \), \( ^{13}\text{C} \), \( ^{19}\text{F} \)). In a static magnetic field \( B_0 \hat{z} \), the spin-1/2 Hamiltonian is:
\[ H_0 = -\gamma \hbar B_0 I_z = -\hbar\omega_L I_z \]
where \( \gamma \) is the **gyromagnetic ratio** and \( \omega_L = \gamma B_0 \) is the **Larmor frequency** (typically 100–1000 MHz for \( B_0 \sim 2–20 \) T).

The two energy eigenstates \( |\uparrow\rangle \equiv |0\rangle \) and \( |\downarrow\rangle \equiv |1\rangle \) are split by \( \hbar\omega_L \).

## 4.2 Control: RF Pulses

A transverse RF field oscillating at \( \omega_{RF} \approx \omega_L \) drives rotations of the spin on the Bloch sphere (Rabi oscillations). In the rotating frame, the effect is a rotation:
- **π/2 pulse**: rotates spin from \( |0\rangle \) to equatorial superposition \( (|0\rangle + |1\rangle)/\sqrt{2} \).
- **π pulse** (NOT gate): rotates spin from \( |0\rangle \) to \( |1\rangle \).

The rotation axis is controlled by the RF pulse **phase**: x-rotations from x-phase pulses, y-rotations from y-phase pulses.

## 4.3 Two-Qubit Gates via J-Coupling

**J-coupling** (scalar coupling): indirect coupling of nuclear spins through bonding electrons. Coupling Hamiltonian:
\[ H_J = 2\pi J_{12} I_z^{(1)} I_z^{(2)} \]

where \( J_{12} \) (Hz) is the coupling constant. This coupling shifts the resonance frequency of one spin depending on the state of its coupled partner, enabling conditional operations.

The CNOT gate in NMR is implemented as:
1. A Hadamard on the target qubit.
2. A period of free evolution under J-coupling for time \( 1/(2J) \) (implementing a controlled-Z up to phases).
3. A Hadamard on the target.

## 4.4 Initialization and Readout

**Challenge**: At room temperature, thermal fluctuations dominate — the spin polarization is tiny (\( \sim \hbar\omega_L/k_BT \sim 10^{-5} \) at 10 T, 300 K). The system is in a highly mixed state.

**Pseudo-pure states**: Initialize the entire ensemble into an effective pure state using a combination of pulses and gradients, trading signal intensity for coherence. This works because NMR is an ensemble measurement.

**Readout**: Measure bulk transverse magnetization of the sample (inductive detection) — the Free Induction Decay (FID), Fourier transformed to give the NMR spectrum. Each spin resonates at a unique chemical shift frequency. Output is probabilistic but averaged over \( \sim 10^{18} \) molecules.

## 4.5 NMR Advantages and Limitations

| Aspect | Assessment |
|--------|-----------|
| Coherence times | Long (\( T_2 \sim 0.1\text{–}10 \) s at room temperature) |
| Gate fidelity | Very high (>99.9% demonstrated) |
| Scalability | **Very poor**: \( J \)-couplings decrease with molecular distance; reading out individual molecules impossible; pseudo-pure state initialization overhead exponential in \( n \) |
| Initialization | Pseudo-pure states (exponential overhead) |
| Qubit count | Demonstrated up to ~12 qubits |

NMR quantum computing was historically important as an early platform for demonstrating quantum algorithms (first factoring of 15 using Shor's algorithm, 2001), but is not scalable.

---

# Chapter 5: Photonic Quantum Computing

## 5.1 Photons as Qubits

<div class="definition">
<strong>Photonic quantum computing</strong> encodes qubits in the quantum states of photons — typically the <strong>polarization</strong> (H/V, or D/A, or L/R), <strong>path</strong> (which spatial mode), <strong>time bin</strong>, or <strong>dual-rail</strong> (presence/absence of a photon in two modes).
</div>

**Polarization qubit**: \( |0\rangle \equiv |H\rangle \) (horizontal polarization), \( |1\rangle \equiv |V\rangle \) (vertical). Single-qubit gates are linear optical elements:
- **Half-wave plate (HWP)** at specific angle → Hadamard or Pauli gates.
- **Quarter-wave plate (QWP)** → phase gates.
- **Beam splitter (BS)**: for path-encoded qubits, implements superpositions of spatial modes.

**Single photon sources**: On-demand single photon sources are crucial. Currently: semiconductor quantum dots, spontaneous parametric downconversion (SPDC), nitrogen-vacancy (NV) centres in diamond, trapped atoms/ions.

## 5.2 Linear Optical Quantum Computing (LOQC)

**Challenge**: photons don't interact with each other in vacuum. Two-qubit gates require photon-photon interactions, which are extremely weak.

**Knill-Laflamme-Milburn (KLM) scheme** (2001): Demonstrated that scalable quantum computation is possible using only:
- Single photon sources.
- Linear optics (beamsplitters, phase shifters).
- Photon number resolving detectors.
- Feed-forward (classical operations conditioned on measurement outcomes).

**Post-selection and teleportation gates**: The key insight is that measurement itself can implement non-linear operations when combined with entangled ancilla photons and feed-forward. The KLM CNOT gate succeeds with probability 1 as \( n \to \infty \) ancilla photons are used.

## 5.3 Boson Sampling

A restricted model: \( n \) photons injected into an \( m \)-mode linear optical network; measure the output photon distribution. Not universal for quantum computing but computationally hard classically (related to computing permanents of matrices).

**Gaussian boson sampling** (GBS): replace single photons with squeezed coherent states. Implemented by PsiQuantum, Xanadu (Borealis); Xanadu's 216-mode GBS system demonstrated computational advantage.

## 5.4 Photonic Advantages and Limitations

| Aspect | Assessment |
|--------|-----------|
| Coherence | Excellent: photons don't decohere (no magnetic or thermal noise); loss is the problem |
| Room temperature operation | Yes: no cryogenics required |
| Scalability | Promising: on-chip photonic integration (silicon photonics); but loss in waveguides accumulates |
| Two-qubit gates | Probabilistic in LOQC (but boosted toward determinism with ancilla) |
| Deterministic photon sources | Hard: quantum dot sources approaching required efficiency |
| Long-range communication | Ideal: photons are natural flying qubits for quantum networks |

---

# Chapter 6: Ion Trap Quantum Computing

## 6.1 Trapping Ions

<div class="definition">
<strong>Ion trap quantum computing</strong> uses individual atomic ions suspended in vacuum by electromagnetic fields as qubits. Laser or microwave pulses manipulate the ions.
</div>

**Paul trap** (linear radiofrequency trap): oscillating RF fields create a pseudopotential that confines ions radially. Static DC fields confine axially. Ions form a linear Coulomb crystal (string of ions) due to mutual repulsion.

**Common ion species**: \( ^{40}\text{Ca}^+ \), \( ^{171}\text{Yb}^+ \), \( ^{133}\text{Ba}^+ \), \( ^{9}\text{Be}^+ \).

## 6.2 Qubit Encoding

**Optical qubit**: encode in ground state (\( |0\rangle \)) and long-lived excited electronic state (\( |1\rangle \)) connected by an optical transition (~nm wavelength). Long coherence times (seconds) due to forbidden transition. High-fidelity readout via electron shelving (fluorescence detection).

**Hyperfine qubit**: encode in two hyperfine levels of the ground electronic state (\( S_{1/2} \) manifold), split by ~GHz. Addressed by microwave or Raman transitions. Extremely long coherence (\( > 10 \) min demonstrated for Hahn-echo) because hyperfine transitions are magnetically insensitive at "clock transitions."

## 6.3 Single-Qubit Gates

For optical qubits: focused laser beam resonant with the qubit transition drives Rabi oscillations. Pulse area \( \Omega t \) determines gate angle; pulse phase determines rotation axis.

For hyperfine qubits: microwave pulses (direct) or two-photon stimulated Raman transitions (using two lasers detuned far from an excited state, difference frequency = hyperfine splitting).

Gate times: ~1–100 μs. Fidelities > 99.99% demonstrated.

## 6.4 Two-Qubit Gates via Coulomb Interaction (Mølmer-Sørensen Gate)

Ions in the trap interact via their collective motional modes (phonons of the Coulomb crystal). The **Mølmer-Sørensen (MS) gate** is the standard two-qubit gate:

1. Apply bichromatic laser/microwave field simultaneously coupling to the **red sideband** (\( \omega_0 - \omega_m \)) and **blue sideband** (\( \omega_0 + \omega_m \)) of a motional mode (\( \omega_m \) = phonon frequency).
2. The two ions exchange motional quanta, mediating an effective spin-spin interaction.
3. The gate disentangles from the motional mode at the end → the motional mode is used but not permanently entangled.

The MS gate generates the maximally entangling operation:
\[ \text{MS}(\chi) = \exp\!\left(-i\chi X\otimes X\right) \]
At \( \chi = \pi/4 \), it produces Bell states.

Gate time: ~50–200 μs. Fidelities > 99.9% on 2 qubits; ~99% on 30+ qubits.

## 6.5 Readout

**Electron shelving / state-selective fluorescence**: A laser resonant with a cycling transition illuminates the ions. An ion in \( |0\rangle \) scatters many photons (bright); an ion in \( |1\rangle \) does not (dark). Readout fidelities > 99.9% for individual ions.

## 6.6 Ion Trap Advantages and Limitations

| Aspect | Assessment |
|--------|-----------|
| Gate fidelity | Best demonstrated of all platforms (>99.9%) |
| Coherence times | Seconds to minutes (exceptional) |
| Connectivity | All-to-all within a trap (every ion can couple to every other ion via shared motional modes) |
| Scalability | Challenging: increasing ions → crowded motional spectrum; slow 2-qubit gates; trap chips for modular architectures |
| Speed | Slow compared to superconductors (~μs vs ~ns gates) |
| Room temperature | Nearly: ion traps operate at room temperature or cryogenic (better vacuum), but no dilution refrigerator needed |

Commercial leaders: IonQ, Quantinuum (formerly Honeywell Quantum), Oxford Ionics.

---

# Chapter 7: Superconducting Quantum Computing

## 7.1 Superconductivity and the Josephson Junction

<div class="definition">
<strong>Superconducting quantum computing</strong> encodes qubits in quantized energy levels of superconducting circuits containing <strong>Josephson junctions</strong> — devices that provide nonlinearity needed to create a two-level system (anharmonic oscillator).
</div>

**Josephson junction**: two superconductors separated by a thin insulating barrier. Cooper pairs tunnel through the barrier. Key relations:
\[ I = I_c \sin\varphi \quad \text{(Josephson current-phase relation)} \]
\[ \frac{d\varphi}{dt} = \frac{2eV}{\hbar} \quad \text{(Josephson voltage-phase relation)} \]

where \( \varphi \) is the phase difference across the junction, \( I_c \) is the critical current.

**Josephson inductance**: The Josephson junction acts as a nonlinear inductor \( L_J = \Phi_0/(2\pi I_c \cos\varphi) \) where \( \Phi_0 = h/(2e) \) is the superconducting flux quantum. The nonlinearity makes the oscillator anharmonic → qubit.

**LC circuit quantization**: treat an LC circuit quantum mechanically. The charge \( Q \) and flux \( \Phi \) are conjugate variables: \( [Q, \Phi] = i\hbar \). The circuit Hamiltonian is:
\[ H = \frac{Q^2}{2C} + \frac{\Phi^2}{2L} \quad \text{(harmonic oscillator)} \]

With a Josephson junction replacing the linear inductor:
\[ H = \frac{Q^2}{2C} - E_J\cos\varphi = 4E_C n^2 - E_J\cos\varphi \]
where \( E_C = e^2/(2C) \) is the charging energy, \( E_J = \Phi_0 I_c/(2\pi) \) is the Josephson energy, and \( n \) is the Cooper pair number operator.

## 7.2 The Transmon Qubit

The **transmon** (transmission-line shunted plasma oscillation qubit) is the dominant qubit type in current processors (IBM, Google, Rigetti).

**Design**: large shunt capacitor in parallel with Josephson junction → \( E_J \gg E_C \). In this regime:
- Charging energy (and charge noise sensitivity) is suppressed exponentially in \( E_J/E_C \).
- Energy levels are nearly harmonic: \( E_{n+1} - E_n \approx \hbar\omega_{01} - \delta \cdot n \) where \( \delta \sim 200 \) MHz is the **anharmonicity**.
- Typical frequency: \( \omega_{01}/2\pi \sim 4\text{–}8 \, \text{GHz} \).

**Trade-off**: reducing charge noise by increasing \( E_J/E_C \) also reduces anharmonicity → harder to address \( |0\rangle \leftrightarrow |1\rangle \) without exciting \( |1\rangle \leftrightarrow |2\rangle \).

## 7.3 Control: Microwave Pulses

Transmon qubits are controlled by microwave pulses (\( \sim 5 \) GHz) applied via transmission lines coupled to the qubit. The pulse generates an oscillating electric field that, in the rotating frame, rotates the qubit state.

**Derivative Removal by Adiabatic Gate (DRAG)**: A correction to the pulse envelope that suppresses transitions to the non-computational \( |2\rangle \) level, exploiting the qubit's small but non-zero anharmonicity. Enables gate times \( \sim 20\text{–}50 \) ns.

## 7.4 Two-Qubit Gates

**Capacitive coupling**: Two transmons coupled via a coupling capacitor or a tunable coupling element (coupler). The coupling Hamiltonian:
\[ H_{int} = g (a_1^\dagger a_2 + a_1 a_2^\dagger) \]

**Cross-resonance (CR) gate** (IBM): Drive transmon 1 at the frequency of transmon 2 → mediated by ZX coupling → CNOT with echo pulses. All-microwave (fixed-frequency qubits).

**Controlled-Z via flux tuning** (Google Sycamore): Tune one qubit into resonance with another via a fast magnetic flux pulse → energy exchange → CZ gate. Faster (~40 ns) but requires flux control lines.

## 7.5 Decoherence and Error Rates

**Relaxation** (\( T_1 \)): qubit decays from \( |1\rangle \) to \( |0\rangle \) spontaneously by emitting a microwave photon into the environment. State-of-the-art \( T_1 \sim 100\text{–}1000 \, \mu\text{s} \).

**Dephasing** (\( T_2 \)): random phase accumulation due to low-frequency noise (flux noise, charge noise, material defects — two-level systems, TLS). \( T_2 \leq 2T_1 \). Currently \( T_2 \sim 50\text{–}500 \, \mu\text{s} \).

**Gate error sources**: coherent errors (over/under-rotation), incoherent errors (decoherence during gate), leakage to \( |2\rangle \).

Single-qubit gate fidelity: > 99.9% (best results). Two-qubit gate fidelity: 99.5% (best), ~99% (typical).

## 7.6 Cryogenics and Scale

Superconductors require temperatures below their critical temperature. Transmons are cooled to **\( \sim 10\text{–}20 \) mK** in dilution refrigerators. At this temperature:
- Thermal fluctuations \( k_BT \approx 2 \) μeV \( \ll \hbar\omega_{01} \approx 20 \) μeV: qubits initialized to \( |0\rangle \) with >99.9% probability.
- Josephson junctions are superconducting (Al critical temperature 1.2 K).

**Wiring overhead**: Each qubit requires multiple microwave lines (readout, drive, flux tuning) plus filtering. A 1000-qubit processor requires thousands of coaxial cables — a major engineering challenge.

## 7.7 Comparison of Platforms

| Platform | Gate fidelity | Coherence | Speed | Scalability | Temperature |
|----------|--------------|-----------|-------|------------|------------|
| NMR | >99.9% | Seconds | ~ms | Very poor | Room temp |
| Photonic | ~99%+ | Excellent (loss is issue) | ~ps | Good (chip-scale) | Room temp |
| Ion trap | >99.9% | Seconds | ~μs (slow) | Moderate | Room temp/cryo |
| Superconducting | ~99.5% | ~μs–ms | ~ns (fast) | Moderate-good | 10–20 mK |
| Neutral atoms | ~99.5% | Seconds | ~μs | Good (array reconfigurable) | μK |

<div class="remark">
There is no universally "best" platform. Each has complementary strengths: superconducting qubits win on speed and integration; ion traps win on fidelity and connectivity; photons are ideal for networking. Hybrid architectures (e.g., ion-photon interfaces, superconductor-transducer-mechanical) aim to combine advantages.
</div>
