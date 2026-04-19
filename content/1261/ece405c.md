---
title: "ECE 405C: Programming of Quantum Computing Algorithms"
prof: "Na Young Kim"
subjects: "ECE"
---

## Sources and References

**Primary resource** — IBM Quantum Learning, *Qiskit Textbook* (open access, learn.qiskit.org and quantum.cloud.ibm.com/docs).
**Foundational textbook** — M.A. Nielsen & I.L. Chuang, *Quantum Computation and Quantum Information*, Cambridge University Press, 2000 (the standard graduate reference, often cited as "Nielsen & Chuang").
**Supplementary** — PennyLane Quantum Machine Learning demos (pennylane.ai/qml, open access); Qiskit API documentation (docs.quantum.ibm.com); A. Kitaev, A. Shen & M. Vyalyi, *Classical and Quantum Computation*, AMS, 2002.

---

# Chapter 1: Qubits, Quantum Gates, and the Circuit Model

## 1.1 From Bits to Qubits

Classical computers manipulate information as *bits* — binary variables that are either 0 or 1 at any instant. A quantum computer instead uses *qubits*, physical two-level systems in which the state before measurement can be an arbitrary superposition of the two basis states. The mathematical object representing a single-qubit state is a unit vector in a two-dimensional complex Hilbert space \( \mathbb{C}^2 \).

The two orthonormal computational basis states are written in Dirac bra-ket notation as \( |0\rangle \) and \( |1\rangle \), corresponding to the column vectors

\[
|0\rangle = \begin{pmatrix} 1 \\ 0 \end{pmatrix}, \qquad |1\rangle = \begin{pmatrix} 0 \\ 1 \end{pmatrix}.
\]

An arbitrary single-qubit state is

\[
|\psi\rangle = \alpha |0\rangle + \beta |1\rangle, \qquad \alpha, \beta \in \mathbb{C}, \quad |\alpha|^2 + |\beta|^2 = 1.
\]

The coefficients \( \alpha \) and \( \beta \) are called *probability amplitudes*. When the qubit is measured in the computational basis, the outcome 0 is obtained with probability \( |\alpha|^2 \) and the outcome 1 with probability \( |\beta|^2 \), collapsing the state irreversibly to the corresponding basis vector.

<div class="remark">
<strong>Why superposition matters.</strong> The constraint is normalization, not a restriction to real numbers. A state like \( |+\rangle = (|0\rangle + |1\rangle)/\sqrt{2} \) assigns equal probability to both measurement outcomes, but the relative <em>phase</em> between \( \alpha \) and \( \beta \) is physically meaningful and is the engine of quantum interference — the mechanism that makes many quantum algorithms faster than their classical counterparts.
</div>

### 1.1.1 The Bloch Sphere

Any single-qubit pure state can be written, up to an unobservable global phase, as

\[
|\psi\rangle = \cos\!\frac{\theta}{2}\,|0\rangle + e^{i\varphi}\sin\!\frac{\theta}{2}\,|1\rangle,
\]

where \( \theta \in [0, \pi] \) and \( \varphi \in [0, 2\pi) \) are the polar and azimuthal angles on the *Bloch sphere* — a unit sphere whose north pole represents \( |0\rangle \), south pole \( |1\rangle \), and equator the equal-superposition states. Every single-qubit gate corresponds to a rotation of the Bloch sphere, a geometric picture that builds intuition before manipulating matrices.

### 1.1.2 Multi-Qubit States

For \( n \) qubits the state space is \( (\mathbb{C}^2)^{\otimes n} \cong \mathbb{C}^{2^n} \). A two-qubit system has four computational basis states \( |00\rangle, |01\rangle, |10\rangle, |11\rangle \), and a general state is

\[
|\psi\rangle = \alpha_{00}|00\rangle + \alpha_{01}|01\rangle + \alpha_{10}|10\rangle + \alpha_{11}|11\rangle,
\]

with \( \sum_{x \in \{0,1\}^2} |\alpha_x|^2 = 1 \). This exponential growth of the state-space dimension with \( n \) is precisely what makes classical simulation of large quantum systems hard and what quantum hardware potentially exploits.

<div class="definition">
<strong>Entanglement.</strong> A multi-qubit state is <em>entangled</em> if it cannot be written as a tensor product of individual qubit states. The Bell state \( |\Phi^+\rangle = (|00\rangle + |11\rangle)/\sqrt{2} \) is the canonical example: measuring one qubit instantaneously determines the other's outcome, regardless of spatial separation. Entanglement is a resource — many quantum speed-ups rely on creating and manipulating entangled states.
</div>

## 1.2 Single-Qubit Gates

Quantum gates on \( n \) qubits are represented by \( 2^n \times 2^n \) *unitary* matrices — matrices satisfying \( U U^\dagger = I \) — because the time evolution of a closed quantum system is unitary (it preserves the norm of the state vector and is therefore reversible). Single-qubit gates are \( 2 \times 2 \) unitaries.

The three *Pauli gates* are the most primitive:

\[
X = \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}, \quad Y = \begin{pmatrix} 0 & -i \\ i & 0 \end{pmatrix}, \quad Z = \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}.
\]

\( X \) is the quantum NOT gate, flipping \( |0\rangle \leftrightarrow |1\rangle \). \( Z \) applies a phase flip: \( |0\rangle \mapsto |0\rangle \), \( |1\rangle \mapsto -|1\rangle \). \( Y = iXZ \) combines both.

The *Hadamard gate* creates superposition from a computational basis state:

\[
H = \frac{1}{\sqrt{2}} \begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix}, \qquad H|0\rangle = |+\rangle, \quad H|1\rangle = |-\rangle,
\]

where \( |+\rangle = (|0\rangle + |1\rangle)/\sqrt{2} \) and \( |-\rangle = (|0\rangle - |1\rangle)/\sqrt{2} \). Applying \( H \) to every qubit of an \( n \)-qubit \( |0\rangle^{\otimes n} \) state produces the uniform superposition over all \( 2^n \) basis states — the starting point for most quantum algorithms.

Phase gates introduce a relative phase:

\[
S = \begin{pmatrix} 1 & 0 \\ 0 & i \end{pmatrix}, \quad T = \begin{pmatrix} 1 & 0 \\ 0 & e^{i\pi/4} \end{pmatrix}, \quad R_z(\theta) = \begin{pmatrix} e^{-i\theta/2} & 0 \\ 0 & e^{i\theta/2} \end{pmatrix}.
\]

Note that \( S = T^2 \) and \( Z = S^2 \). The parameterized rotation \( R_z(\theta) \) (together with \( R_x \) and \( R_y \)) provides continuous single-qubit control and is the workhorse of variational quantum circuits.

## 1.3 Two-Qubit Gates

### 1.3.1 The CNOT Gate

The *Controlled-NOT* (CNOT) gate applies an \( X \) gate to the *target* qubit conditioned on the *control* qubit being \( |1\rangle \):

\[
\text{CNOT} = \begin{pmatrix} 1 & 0 & 0 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 0 & 1 \\ 0 & 0 & 1 & 0 \end{pmatrix},
\]

in the basis ordering \( |00\rangle, |01\rangle, |10\rangle, |11\rangle \). CNOT together with the set of all single-qubit gates constitutes a *universal* gate set — any unitary operation on any number of qubits can be approximated to arbitrary precision using only these primitives.

### 1.3.2 The CZ and Toffoli Gates

The *Controlled-Z* (CZ) gate applies a \( Z \) to the target when the control is \( |1\rangle \); it is symmetric in its two qubits (unlike CNOT). The *Toffoli* gate (CCNOT) has two control qubits and one target: it flips the target only when both controls are \( |1\rangle \), making it the quantum analogue of the classical NAND and hence a universal classical gate embedded in unitary dynamics.

## 1.4 Quantum Circuits and Queries

A *quantum circuit* is a sequence of gates applied to an initialized register of qubits, followed by measurement. Circuits are drawn left-to-right with time flowing to the right; each horizontal wire represents one qubit, and each gate symbol is placed at the time step where it acts.

<div class="definition">
<strong>Oracle / Query gate.</strong> In the query complexity model — the framework underlying Deutsch-Jozsa, Simon, and Grover — an algorithm is given black-box access to a function \( f \) via a unitary oracle \( O_f \). The standard phase oracle acts as

\[
O_f |x\rangle = (-1)^{f(x)} |x\rangle,
\]

while the standard bit oracle acts as \( U_f |x\rangle|y\rangle = |x\rangle|y \oplus f(x)\rangle \). The goal is to determine a property of \( f \) while minimizing the number of oracle calls.
</div>

## 1.5 Quantum Measurements and Complexity

Measurement in quantum mechanics is probabilistic and destructive. After measuring qubit \( i \) in the \( \{|0\rangle, |1\rangle\} \) basis, the system collapses and the value of the measured qubit is fixed. In the circuit model, all measurements are typically deferred to the end of the circuit (the *deferred measurement principle*), which simplifies analysis.

*Quantum complexity* classes categorize problems by the resources required. The class **BQP** (Bounded-error Quantum Polynomial time) contains decision problems solvable by a quantum computer in polynomial time with error probability at most 1/3. It is known that \( \text{P} \subseteq \text{BQP} \subseteq \text{PSPACE} \), and that certain problems (like integer factoring) lie in BQP but are believed not to be in P under classical assumptions.

---

# Chapter 2: Foundational Quantum Algorithms

## 2.1 The Deutsch Problem and Quantum Parallelism

The *Deutsch problem* — arguably the first demonstration that a quantum algorithm can outperform the best classical strategy — asks: given a function \( f : \{0,1\} \to \{0,1\} \), is \( f \) *constant* (\( f(0) = f(1) \)) or *balanced* (\( f(0) \neq f(1) \))?

Classically, you must query \( f \) twice. The Deutsch algorithm determines the answer with a single query by exploiting superposition and interference.

The circuit uses two qubits. The ancilla qubit is initialized to \( |1\rangle \) and the query qubit to \( |0\rangle \). After applying \( H \) to both:

\[
|0\rangle|1\rangle \xrightarrow{H \otimes H} |+\rangle|-\rangle = \frac{1}{2}\bigl(|0\rangle + |1\rangle\bigr)\bigl(|0\rangle - |1\rangle\bigr).
\]

Applying the bit oracle \( U_f \) and using the *phase kickback* trick — because the ancilla is in \( |-\rangle \), querying \( f \) imprints \( (-1)^{f(x)} \) onto the query register's amplitude — gives

\[
\frac{1}{\sqrt{2}}\bigl((-1)^{f(0)}|0\rangle + (-1)^{f(1)}|1\rangle\bigr)\otimes |-\rangle = (-1)^{f(0)}\frac{1}{\sqrt{2}}\bigl(|0\rangle + (-1)^{f(0)\oplus f(1)}|1\rangle\bigr)\otimes|-\rangle.
\]

A final Hadamard on the first qubit maps this to \( (-1)^{f(0)}|f(0) \oplus f(1)\rangle \). Measuring the first qubit yields 0 if \( f \) is constant and 1 if balanced — a single query determines the answer.

## 2.2 The Deutsch-Jozsa Algorithm

### 2.2.1 Problem Statement

The *Deutsch-Jozsa* (DJ) algorithm generalizes the Deutsch problem to \( n \) bits: given a function \( f : \{0,1\}^n \to \{0,1\} \) promised to be either constant or balanced (exactly half the inputs map to 0 and half to 1), determine which case holds.

Deterministic classical algorithms require up to \( 2^{n-1} + 1 \) queries in the worst case. The Deutsch-Jozsa algorithm resolves the question with one query — an exponential separation (though only against deterministic, not randomized, classical algorithms).

### 2.2.2 Algorithm Description

1. Initialize \( n \) query qubits to \( |0\rangle \) and one ancilla to \( |1\rangle \).
2. Apply \( H^{\otimes n} \) to the query register and \( H \) to the ancilla.
3. Apply the oracle \( U_f : |x\rangle|y\rangle \mapsto |x\rangle|y \oplus f(x)\rangle \).
4. Apply \( H^{\otimes n} \) to the query register again.
5. Measure the query register.

After step 2 the query register is in the uniform superposition \( \frac{1}{\sqrt{2^n}}\sum_{x=0}^{2^n-1} |x\rangle \). Phase kickback converts the oracle action into \( \frac{1}{\sqrt{2^n}}\sum_x (-1)^{f(x)}|x\rangle \). The second \( H^{\otimes n} \) is the Walsh-Hadamard transform, and one can show that the amplitude on \( |0\rangle^{\otimes n} \) after this transform equals \( \frac{1}{2^n}\sum_x (-1)^{f(x)} \). This sum is 1 (in magnitude) if \( f \) is constant and 0 if \( f \) is balanced. Measuring all zeros indicates constant; any non-zero outcome indicates balanced.

### 2.2.3 Qiskit Implementation

```python
from qiskit import QuantumCircuit, QuantumRegister, ClassicalRegister
from qiskit_aer import AerSimulator
from qiskit.visualization import plot_histogram

def deutsch_jozsa_constant(n):
    """Build a Deutsch-Jozsa circuit for the all-zeros constant oracle."""
    qr = QuantumRegister(n + 1, name="q")
    cr = ClassicalRegister(n, name="c")
    qc = QuantumCircuit(qr, cr)

    # Initialize ancilla to |1>
    qc.x(qr[n])

    # Apply Hadamard to all qubits
    qc.h(qr)

    # Constant oracle f(x)=0: do nothing (identity)

    # Apply Hadamard to query register only
    qc.h(qr[:n])

    # Measure query register
    qc.measure(qr[:n], cr)
    return qc

def deutsch_jozsa_balanced(n):
    """Build a Deutsch-Jozsa circuit for a balanced oracle (parity function)."""
    qr = QuantumRegister(n + 1, name="q")
    cr = ClassicalRegister(n, name="c")
    qc = QuantumCircuit(qr, cr)

    # Initialize ancilla to |1>
    qc.x(qr[n])

    # Apply Hadamard to all qubits
    qc.h(qr)

    # Balanced oracle: CNOT from each query qubit to ancilla
    for i in range(n):
        qc.cx(qr[i], qr[n])

    # Apply Hadamard to query register
    qc.h(qr[:n])

    # Measure
    qc.measure(qr[:n], cr)
    return qc

# Run on the Aer simulator
sim = AerSimulator()
n_qubits = 4

for label, circuit in [("constant", deutsch_jozsa_constant(n_qubits)),
                        ("balanced", deutsch_jozsa_balanced(n_qubits))]:
    result = sim.run(circuit, shots=1024).result()
    counts = result.get_counts()
    print(f"Oracle type: {label}, measurement outcomes: {counts}")
    # Constant oracle always yields all-zeros; balanced oracle always yields non-zero
```

<div class="example">
<strong>Reading the output.</strong> When the oracle is constant, every shot produces the bitstring "0000" — the Hadamard interference constructively reinforces the all-zeros amplitude. When the oracle is balanced (here the parity function), the all-zeros amplitude is exactly zero and the measurement yields a non-zero string (the specific string encodes the balanced function's structure). In either case, one shot is sufficient for a deterministic answer.
</div>

## 2.3 Bernstein-Vazirani Algorithm

The *Bernstein-Vazirani* (BV) problem asks: given a function \( f(x) = s \cdot x \pmod{2} \) (the inner product of the hidden string \( s \in \{0,1\}^n \) with input \( x \)), find \( s \) using as few queries as possible.

Classically, \( n \) queries are needed (one per bit of \( s \)). The BV algorithm recovers all \( n \) bits of \( s \) with exactly one query. The circuit is identical in structure to Deutsch-Jozsa: uniform superposition → oracle → Hadamard → measure. The key insight is that the oracle \( |x\rangle \mapsto (-1)^{s \cdot x}|x\rangle \) is itself the Walsh-Hadamard transform of \( |s\rangle \), so the second \( H^{\otimes n} \) recovers \( |s\rangle \) exactly.

```python
def bernstein_vazirani(secret_string):
    """Recover a hidden bit string using the Bernstein-Vazirani algorithm."""
    n = len(secret_string)
    qr = QuantumRegister(n + 1, name="q")
    cr = ClassicalRegister(n, name="c")
    qc = QuantumCircuit(qr, cr)

    # Standard initialization: ancilla to |1>
    qc.x(qr[n])
    qc.h(qr)

    # Oracle for f(x) = s dot x mod 2
    # For each bit position where secret_string[i] == '1', apply CNOT
    for i, bit in enumerate(reversed(secret_string)):
        if bit == "1":
            qc.cx(qr[i], qr[n])

    # Inverse Hadamard on query register
    qc.h(qr[:n])
    qc.measure(qr[:n], cr)
    return qc

secret = "10110"
circuit = bernstein_vazirani(secret)
result = AerSimulator().run(circuit, shots=1024).result()
counts = result.get_counts()
# The single measured bitstring is exactly the secret string (reversed to match qubit ordering)
print(f"Secret: {secret}, Recovered: {list(counts.keys())[0][::-1]}")
```

## 2.4 Simon's Algorithm

### 2.4.1 The Hidden Period Problem

Simon's algorithm solves a problem that is exponentially hard classically but polynomial in the quantum setting. Given \( f : \{0,1\}^n \to \{0,1\}^n \) promised to satisfy \( f(x) = f(y) \) if and only if \( y = x \) or \( y = x \oplus s \) for a hidden string \( s \), find \( s \).

Classically, finding \( s \) by collision requires \( \Omega(2^{n/2}) \) queries (birthday paradox). Simon's algorithm uses \( O(n) \) queries followed by \( O(n^3) \) classical post-processing.

### 2.4.2 Quantum Phase of Simon's Algorithm

Each iteration of the quantum subroutine proceeds as follows:

1. Start with \( |0\rangle^{\otimes n}|0\rangle^{\otimes n} \).
2. Apply \( H^{\otimes n} \) to the first register: \( \frac{1}{\sqrt{2^n}}\sum_x |x\rangle|0\rangle \).
3. Apply the oracle: \( \frac{1}{\sqrt{2^n}}\sum_x |x\rangle|f(x)\rangle \).
4. Measure the second register. The first register collapses to the superposition \( \frac{1}{\sqrt{2}}(|x_0\rangle + |x_0 \oplus s\rangle) \) for some random \( x_0 \).
5. Apply \( H^{\otimes n} \) to the first register. The amplitude on basis state \( |z\rangle \) is nonzero only if \( z \cdot s = 0 \pmod{2} \).
6. Measure the first register, obtaining a random \( z \) satisfying \( z \cdot s = 0 \pmod{2} \).

After \( O(n) \) iterations, we collect \( n - 1 \) linearly independent equations \( z_i \cdot s = 0 \), which determine \( s \) uniquely (with high probability) by Gaussian elimination over \( GF(2) \).

---

# Chapter 3: Quantum Fourier Transform and Phase Estimation

## 3.1 The Quantum Fourier Transform

### 3.1.1 Definition

The *Quantum Fourier Transform* (QFT) is the quantum analogue of the discrete Fourier transform (DFT). Applied to the computational basis state \( |j\rangle \) (where \( j \in \{0, 1, \ldots, 2^n - 1\} \)), it produces

\[
\text{QFT}|j\rangle = \frac{1}{\sqrt{2^n}} \sum_{k=0}^{2^n - 1} e^{2\pi i jk / 2^n} |k\rangle.
\]

The QFT can be implemented with \( O(n^2) \) gates (Hadamard gates and controlled phase rotations), compared with the classical \( O(n 2^n) \) operations needed by the FFT. This exponential speedup in implementing the transform is the engine behind order-finding and Shor's algorithm.

### 3.1.2 Circuit Construction

The standard \( n \)-qubit QFT circuit applies:
1. A Hadamard to the most significant qubit.
2. Controlled phase rotations \( R_k = \text{diag}(1, e^{2\pi i / 2^k}) \) applied from subsequent qubits.
3. A Hadamard to the next qubit, and so on.
4. A reversal of qubit order (SWAP gates) to match the standard output ordering.

```python
from qiskit.circuit.library import QFT

def build_qft(n_qubits, do_swaps=True):
    """Construct the n-qubit QFT circuit using Qiskit's built-in library."""
    # Qiskit provides QFT as a circuit gate that can be decomposed
    qc = QuantumCircuit(n_qubits)
    qft_gate = QFT(n_qubits, do_swaps=do_swaps, inverse=False, insert_barriers=True)
    qc.append(qft_gate, range(n_qubits))
    qc = qc.decompose()
    return qc

# Inspect the decomposed circuit for 3 qubits
qc_qft = build_qft(3)
print(qc_qft.draw(output="text"))
```

<div class="remark">
<strong>Gate count.</strong> For \( n \) qubits the QFT uses \( n \) Hadamard gates and \( n(n-1)/2 \) controlled-phase gates, totaling \( O(n^2) \) two-qubit operations. On current noisy hardware, the quadratic depth can accumulate significant errors for large \( n \), motivating approximate QFT variants that truncate small-angle rotations.
</div>

## 3.2 Quantum Phase Estimation

### 3.2.1 Problem Statement and Importance

The *Quantum Phase Estimation* (QPE) algorithm is one of the most important subroutines in quantum computing. Given a unitary \( U \) and one of its eigenstates \( |u\rangle \) satisfying \( U|u\rangle = e^{2\pi i \varphi}|u\rangle \) with unknown phase \( \varphi \in [0, 1) \), QPE estimates \( \varphi \) to \( t \) bits of precision using \( t \) ancilla qubits and \( O(t) \) applications of controlled-\( U \).

### 3.2.2 Circuit Description

1. Initialize \( t \) counting qubits to \( |0\rangle^{\otimes t} \) and the target register to eigenstate \( |u\rangle \).
2. Apply \( H^{\otimes t} \) to the counting register.
3. Apply controlled-\( U^{2^j} \) (controlled on counting qubit \( j \)) for \( j = 0, 1, \ldots, t-1 \).
4. Apply the inverse QFT to the counting register.
5. Measure the counting register.

After step 3, the counting register holds

\[
\frac{1}{\sqrt{2^t}} \sum_{j=0}^{2^t - 1} e^{2\pi i \varphi j} |j\rangle,
\]

which is exactly the QFT of the state \( |2^t \varphi\rangle \) (to the extent \( 2^t \varphi \) is an integer). Applying the inverse QFT recovers \( |2^t \varphi\rangle \), and measurement yields the \( t \)-bit binary approximation of \( \varphi \).

```python
from qiskit.circuit.library import PhaseEstimation
from qiskit.quantum_info import Operator
import numpy as np

def phase_estimation_demo(phase, num_counting_qubits=4):
    """Estimate the phase of a single-qubit Z-rotation using QPE."""
    # Build the unitary U = R_z(2*pi*phase) -- eigenphase is 'phase' for |1>
    theta = 2 * np.pi * phase
    # Construct the unitary as a single-qubit circuit
    u_circuit = QuantumCircuit(1, name="U")
    u_circuit.p(theta, 0)   # p(theta) gate applies e^(i*theta) to |1>

    # Build QPE circuit using Qiskit's library
    pe = PhaseEstimation(num_counting_qubits, u_circuit)
    # Append initialization: put the eigenstate register in |1>
    full_qc = QuantumCircuit(num_counting_qubits + 1, num_counting_qubits)
    full_qc.x(num_counting_qubits)  # eigenstate |1> for the P gate
    full_qc.compose(pe, inplace=True)
    full_qc.measure(range(num_counting_qubits), range(num_counting_qubits))
    return full_qc

phase_target = 0.125  # 1/8, representable exactly in 4 bits
qc_qpe = phase_estimation_demo(phase_target, num_counting_qubits=4)
result = AerSimulator().run(qc_qpe, shots=1024).result()
counts = result.get_counts()
# Expected output: "0010" (binary for 2, representing 2/16 = 0.125)
print(counts)
```

---

# Chapter 4: Order-Finding, Shor's Algorithm, and Grover's Search

## 4.1 Order-Finding

The *order-finding problem* asks: given integers \( N \) and \( a \) with \( \gcd(a, N) = 1 \), find the smallest positive integer \( r \) (the *order*) such that \( a^r \equiv 1 \pmod{N} \).

Order-finding is the computational core of Shor's factoring algorithm. The quantum strategy is to apply QPE to the unitary \( U_a |y\rangle = |ay \bmod N\rangle \). This unitary has eigenstates

\[
|u_s\rangle = \frac{1}{\sqrt{r}} \sum_{k=0}^{r-1} e^{-2\pi i sk/r} |a^k \bmod N\rangle, \quad s = 0, 1, \ldots, r-1,
\]

with corresponding eigenphases \( \varphi_s = s/r \). QPE estimates \( s/r \) from which the *continued fractions* algorithm extracts \( r \) exactly (with high probability) using \( O(\log^2 N) \) bits of precision.

<div class="remark">
<strong>Circuit depth scaling.</strong> Implementing \( U_a^{2^j} \) efficiently (modular exponentiation) requires the most expensive subroutine in Shor's algorithm — roughly \( O(n^3) \) gates where \( n = \lceil \log_2 N \rceil \). This is why near-term demonstrations of Shor's algorithm are restricted to very small \( N \) (such as \( N = 15 \) or \( N = 21 \)) even on modern quantum hardware.
</div>

## 4.2 Shor's Factoring Algorithm

### 4.2.1 Reduction from Factoring to Order-Finding

Shor's algorithm (1994) factors an \( n \)-bit integer \( N \) in \( O(n^3) \) quantum gate operations, providing an exponential speedup over the best known classical algorithms (which run in sub-exponential but super-polynomial time). The algorithm rests on a classical number-theoretic reduction:

1. If \( N \) is even, return 2.
2. If \( N = a^b \) for integers \( a \geq 1, b \geq 2 \), return \( a \).
3. Choose a random \( a \in \{2, \ldots, N-1\} \). If \( \gcd(a, N) > 1 \), return \( \gcd(a, N) \) (a non-trivial factor found classically).
4. **Use the quantum subroutine** to find the order \( r \) of \( a \) modulo \( N \).
5. If \( r \) is odd or \( a^{r/2} \equiv -1 \pmod{N} \), go to step 3 with a new \( a \).
6. Otherwise, \( \gcd(a^{r/2} - 1, N) \) and \( \gcd(a^{r/2} + 1, N) \) are non-trivial factors of \( N \).

The quantum step (step 4) is the only part that runs on a quantum computer; everything else is classical arithmetic.

### 4.2.2 Worked Example: Factoring 15

For \( N = 15 \), choose \( a = 7 \). The order of 7 mod 15 is \( r = 4 \) (since \( 7^1 = 7, 7^2 = 49 \equiv 4, 7^3 \equiv 28 \equiv 13, 7^4 \equiv 91 \equiv 1 \pmod{15} \)). Since \( r = 4 \) is even and \( 7^2 = 4 \not\equiv -1 \pmod{15} \):

\[
\gcd(7^2 - 1, 15) = \gcd(48, 15) = 3, \quad \gcd(7^2 + 1, 15) = \gcd(50, 15) = 5.
\]

Both 3 and 5 are non-trivial factors of 15 — recovered correctly.

```python
from math import gcd
from fractions import Fraction

def classical_postprocess(N, a, measured_phase_int, num_bits):
    """
    Given the integer output of QPE (numerator of s/r in num_bits precision),
    recover r using the continued fractions algorithm.
    """
    # Convert measured integer to a fraction
    phase_fraction = Fraction(measured_phase_int, 2**num_bits).limit_denominator(N)
    r_candidate = phase_fraction.denominator

    # Verify candidate order
    if pow(a, r_candidate, N) == 1:
        # Attempt to find factors
        if r_candidate % 2 == 0:
            factor1 = gcd(pow(a, r_candidate // 2) - 1, N)
            factor2 = gcd(pow(a, r_candidate // 2) + 1, N)
            if 1 < factor1 < N:
                return factor1, N // factor1
            if 1 < factor2 < N:
                return factor2, N // factor2
    return None

# Illustrative usage (in practice QPE produces the measured_phase_int)
# For N=15, a=7, the true r=4, QPE should output 0 or 1024/4=512 etc. (t=12 bits)
# Here we bypass the quantum circuit and directly test the classical layer
result = classical_postprocess(N=15, a=7, measured_phase_int=1024, num_bits=12)
print(f"Factors of 15: {result}")  # Expect (3, 5) or (5, 3)
```

## 4.3 Grover's Search Algorithm

### 4.3.1 Unstructured Search

The *Grover search* algorithm (1996) accelerates unstructured database search. Given a Boolean oracle \( f : \{0,1\}^n \to \{0,1\} \) that marks \( M \) solutions among \( N = 2^n \) items, Grover's algorithm finds a solution in \( O(\sqrt{N/M}) \) oracle queries — a quadratic speedup over the classical \( O(N/M) \) lower bound.

### 4.3.2 Geometric Interpretation

The algorithm operates in the two-dimensional subspace spanned by the uniform superposition \( |s\rangle = H^{\otimes n}|0\rangle^{\otimes n} \) and the uniform superposition over solutions \( |w\rangle \). Each *Grover iteration* consists of two reflections:

1. **Phase oracle** \( O_f \): reflects about the hyperplane perpendicular to \( |w\rangle \), flipping the sign of solution amplitudes.
2. **Diffusion operator** \( D = 2|s\rangle\langle s| - I \): reflects about \( |s\rangle \), amplifying the solution component.

The combined effect is a rotation by angle \( 2\theta \) in the two-dimensional subspace, where \( \sin\theta = \sqrt{M/N} \). Starting near \( |s\rangle \) (angle \( \theta \) from the non-solution subspace), the optimal number of iterations before measurement is

\[
k^* = \left\lfloor \frac{\pi}{4}\sqrt{\frac{N}{M}} \right\rfloor.
\]

After \( k^* \) iterations the state is close to \( |w\rangle \), and measurement yields a solution with high probability.

```python
def grover_circuit(n_qubits, oracle_qc):
    """
    Build a complete Grover search circuit.
    oracle_qc: a QuantumCircuit on n_qubits that flips the phase of marked states.
    """
    import numpy as np

    n = n_qubits
    num_solutions = 1  # Assumes single marked state for simplicity
    num_iterations = int(np.round((np.pi / 4) * np.sqrt(2**n / num_solutions)))

    qc = QuantumCircuit(n)
    # Initialize uniform superposition
    qc.h(range(n))

    for _ in range(num_iterations):
        # Phase oracle
        qc.compose(oracle_qc, inplace=True)

        # Diffusion operator: H, X, multi-controlled Z, X, H
        qc.h(range(n))
        qc.x(range(n))
        # Multi-controlled Z (phase flip on all-zeros state)
        qc.h(n - 1)
        qc.mcx(list(range(n - 1)), n - 1)  # multi-controlled NOT on last qubit
        qc.h(n - 1)
        qc.x(range(n))
        qc.h(range(n))

    qc.measure_all()
    return qc

def make_phase_oracle(n_qubits, target_state_int):
    """
    Phase oracle that flips the sign of the amplitude of a single target state.
    target_state_int: integer representation of the marked computational basis state.
    """
    oracle = QuantumCircuit(n_qubits)
    target_bits = format(target_state_int, f"0{n_qubits}b")
    # Flip qubits where target bit is 0 (to map target to all-ones state)
    for i, bit in enumerate(reversed(target_bits)):
        if bit == "0":
            oracle.x(i)
    # Multi-controlled Z
    oracle.h(n_qubits - 1)
    oracle.mcx(list(range(n_qubits - 1)), n_qubits - 1)
    oracle.h(n_qubits - 1)
    # Undo the flips
    for i, bit in enumerate(reversed(target_bits)):
        if bit == "0":
            oracle.x(i)
    return oracle

# Search for the state |6> = |110> in a 3-qubit space
n = 3
target = 6
oracle = make_phase_oracle(n, target)
search_circuit = grover_circuit(n, oracle)
result = AerSimulator().run(search_circuit, shots=1024).result()
counts = result.get_counts()
print(f"Target: {target} (binary: {target:03b}), Top outcome: {max(counts, key=counts.get)}")
```

<div class="example">
<strong>Grover on 3 qubits.</strong> With \( n = 3 \) and \( M = 1 \) solution, the optimal iteration count is \( k^* = \lfloor \pi\sqrt{8}/4 \rfloor = 2 \). After two Grover iterations the marked state has probability approximately \( \sin^2(3\theta) \approx 0.945 \) for \( \theta = \arcsin(1/\sqrt{8}) \approx 20.7^\circ \). In simulation, the correct target bitstring dominates the measurement histogram by a large margin.
</div>

---

# Chapter 5: Quantum Simulation and Variational Algorithms

## 5.1 Quantum Simulation

One of the original motivations for quantum computing, articulated by Feynman in 1982, is simulating quantum physical systems. A Hamiltonian \( H \) describing an \( n \)-particle system lives in a Hilbert space of dimension \( 2^n \); classically storing its eigenstates requires exponential memory. A quantum computer with \( n \) qubits can represent the state exactly and evolve it under \( H \).

### 5.1.1 Trotterization

Time evolution under a Hamiltonian \( H = \sum_k H_k \) for time \( t \) produces the unitary \( e^{-iHt} \). When the terms \( H_k \) do not commute, the product formula (Trotter-Suzuki decomposition) approximates

\[
e^{-iHt} \approx \left( \prod_k e^{-iH_k t/r} \right)^r + O\!\left(\frac{t^2}{r}\right),
\]

where increasing the number of Trotter steps \( r \) reduces the error at the cost of more gates. Each exponential \( e^{-iH_k t/r} \) is typically a one- or two-qubit rotation, directly implementable as a quantum gate.

```python
from qiskit.circuit import Parameter
from qiskit.quantum_info import SparsePauliOp

# Example: simulate the transverse-field Ising model on 3 qubits
# H = -J * sum(ZZ) - h * sum(X)

def ising_trotter_step(n_qubits, J_coeff, h_coeff, dt):
    """
    Single Trotter step for the 1D transverse-field Ising model.
    Returns a QuantumCircuit implementing exp(-i H dt) approximately.
    """
    qc = QuantumCircuit(n_qubits)

    # ZZ interaction terms: exp(-i * (-J) * Zi Zj * dt) = exp(i J dt Zi Zj)
    for i in range(n_qubits - 1):
        qc.cx(i, i + 1)
        qc.rz(2 * J_coeff * dt, i + 1)   # rz angle is 2*J*dt
        qc.cx(i, i + 1)

    # Transverse field terms: exp(-i * (-h) * Xi * dt) = exp(i h dt Xi)
    for i in range(n_qubits):
        qc.rx(2 * h_coeff * dt, i)   # rx angle is 2*h*dt

    return qc

# Build a simulation circuit with 5 Trotter steps
n = 3
J, h_field, dt_val, n_steps = 1.0, 0.5, 0.1, 5
sim_circuit = QuantumCircuit(n)
sim_circuit.h(range(n))  # Start in uniform superposition
for _ in range(n_steps):
    sim_circuit.compose(ising_trotter_step(n, J, h_field, dt_val), inplace=True)
sim_circuit.measure_all()
print(sim_circuit.draw(output="text"))
```

## 5.2 The Variational Quantum Eigensolver (VQE)

### 5.2.1 Motivation: Near-Term Hardware

*Variational Quantum Eigensolver* (VQE) is a hybrid classical-quantum algorithm designed for near-term (NISQ) devices. It addresses the problem of finding the ground-state energy of a molecular Hamiltonian \( H \), a task central to quantum chemistry. The key insight is the *variational principle*: for any normalized state \( |\psi(\theta)\rangle \),

\[
\langle \psi(\theta) | H | \psi(\theta) \rangle \geq E_0,
\]

where \( E_0 \) is the true ground-state energy. VQE therefore minimizes the expectation value of \( H \) over a parameterized family of quantum states.

### 5.2.2 Algorithm Structure

1. Choose a parameterized *ansatz* circuit \( U(\theta) \) that prepares the trial state \( |\psi(\theta)\rangle = U(\theta)|0\rangle \). Common ansätze include the Hardware-Efficient Ansatz (HEA) and the Unitary Coupled Cluster (UCC) ansatz motivated by quantum chemistry.
2. Decompose \( H = \sum_k c_k P_k \) into a linear combination of Pauli strings \( P_k \).
3. Measure the expectation value \( \langle P_k \rangle \) of each Pauli string on the quantum hardware.
4. Compute the total energy \( E(\theta) = \sum_k c_k \langle P_k \rangle \) classically.
5. Update \( \theta \) using a classical optimizer (COBYLA, gradient descent, etc.) to minimize \( E(\theta) \).
6. Repeat until convergence.

```python
from qiskit.circuit.library import TwoLocal
from qiskit.quantum_info import SparsePauliOp
from qiskit_aer.primitives import Estimator as AerEstimator
import numpy as np
from scipy.optimize import minimize

# Define a simple 2-qubit Hamiltonian: H = 0.5*ZZ - 0.5*XX
hamiltonian = SparsePauliOp.from_list([("ZZ", 0.5), ("XX", -0.5)])

# Define a hardware-efficient ansatz: alternating Ry/Rz rotations and CNOT entanglers
ansatz = TwoLocal(
    num_qubits=2,
    rotation_blocks=["ry", "rz"],
    entanglement_blocks="cx",
    entanglement="linear",
    reps=2,
    insert_barriers=True
)

# Use the Aer Estimator primitive to evaluate expectation values
estimator = AerEstimator()

def cost_function(params):
    """Evaluate <H> for a given parameter vector."""
    job = estimator.run([ansatz], [hamiltonian], [params])
    energy = job.result().values[0]
    return energy

# Classical optimization loop
initial_params = np.random.uniform(-np.pi, np.pi, ansatz.num_parameters)
result = minimize(cost_function, initial_params, method="COBYLA",
                  options={"maxiter": 500, "rhobeg": 0.5})

print(f"Optimized ground-state energy estimate: {result.fun:.6f}")
# For this Hamiltonian, the exact ground-state energy is -1.0
```

### 5.2.3 The Parameter-Shift Rule

Computing gradients of expectation values with respect to gate parameters is essential for gradient-based VQE. For a gate of the form \( G(\theta) = e^{-i\theta P/2} \) (where \( P \) is a Pauli operator with eigenvalues \(\pm 1\)), the *parameter-shift rule* gives an exact gradient:

\[
\frac{\partial}{\partial \theta}\langle H \rangle(\theta) = \frac{1}{2}\bigl[\langle H \rangle(\theta + \pi/2) - \langle H \rangle(\theta - \pi/2)\bigr].
\]

This formula requires only two additional circuit evaluations per parameter, making gradient computation feasible on real hardware without finite-difference approximations.

```python
def parameter_shift_gradient(ansatz, hamiltonian, params, estimator, param_index):
    """
    Compute the gradient of <H> with respect to params[param_index]
    using the parameter-shift rule.
    """
    shift = np.pi / 2
    params_plus = params.copy()
    params_plus[param_index] += shift
    params_minus = params.copy()
    params_minus[param_index] -= shift

    energy_plus = estimator.run([ansatz], [hamiltonian], [params_plus]).result().values[0]
    energy_minus = estimator.run([ansatz], [hamiltonian], [params_minus]).result().values[0]

    return (energy_plus - energy_minus) / 2

# Compute gradient for the first parameter
grad = parameter_shift_gradient(ansatz, hamiltonian, result.x, estimator, param_index=0)
print(f"Gradient with respect to parameter 0: {grad:.6f}")
```

## 5.3 Quantum Approximate Optimization Algorithm (QAOA)

### 5.3.1 Combinatorial Optimization on Quantum Hardware

QAOA targets combinatorial optimization problems encoded as finding the minimum of a cost Hamiltonian \( C \). For graph problems such as Maximum Cut (Max-Cut), the cost Hamiltonian on \( n \) qubits is

\[
C = \sum_{(i,j) \in E} \frac{1 - Z_i Z_j}{2},
\]

where the sum is over edges \( (i,j) \) in the graph and \( Z_i \) is the Pauli-Z on qubit \( i \). Minimizing \( C \) over classical bit strings is the NP-hard Max-Cut problem.

### 5.3.2 The QAOA Ansatz

QAOA uses a specific \( p \)-layer ansatz:

\[
|\gamma, \beta\rangle = e^{-i\beta_p B} e^{-i\gamma_p C} \cdots e^{-i\beta_1 B} e^{-i\gamma_1 C} |+\rangle^{\otimes n},
\]

where \( B = \sum_i X_i \) is the mixing Hamiltonian and \( \gamma, \beta \) are variational parameters. As \( p \to \infty \), the QAOA state can approximate the true optimal solution. For \( p = 1 \), the algorithm is known to achieve at least a 0.6924 approximation ratio for Max-Cut on 3-regular graphs.

```python
from qiskit.circuit import ParameterVector

def qaoa_maxcut_circuit(edges, n_nodes, p_layers):
    """
    Build a QAOA circuit for Max-Cut on a graph.
    edges: list of (i, j) tuples
    n_nodes: number of nodes in the graph
    p_layers: number of QAOA layers
    """
    gamma = ParameterVector("gamma", p_layers)
    beta = ParameterVector("beta", p_layers)

    qc = QuantumCircuit(n_nodes)
    # Initialize to uniform superposition
    qc.h(range(n_nodes))

    for layer in range(p_layers):
        # Cost operator: exp(-i gamma_layer * C)
        for (i, j) in edges:
            qc.cx(i, j)
            qc.rz(2 * gamma[layer], j)  # factor of 2 from ZZ coupling
            qc.cx(i, j)

        # Mixing operator: exp(-i beta_layer * B)
        for i in range(n_nodes):
            qc.rx(2 * beta[layer], i)

    qc.measure_all()
    return qc

# Triangle graph: 3 nodes, 3 edges
triangle_edges = [(0, 1), (1, 2), (0, 2)]
qaoa_qc = qaoa_maxcut_circuit(triangle_edges, n_nodes=3, p_layers=1)
print(qaoa_qc.draw(output="text"))
```

---

# Chapter 6: Quantum Error Correction and Error Mitigation

## 6.1 Why Errors Matter: The NISQ Era

Current quantum processors — classified as *Noisy Intermediate-Scale Quantum* (NISQ) devices — have tens to hundreds of qubits but suffer from significant gate errors (typical two-qubit gate error rates of 0.1%–1%), qubit decoherence (T1, T2 times of microseconds to milliseconds), and measurement errors (1%–5% per qubit). These noise sources mean that algorithms requiring thousands of error-free gates cannot run on today's hardware without mitigation or correction strategies.

<div class="definition">
<strong>Decoherence.</strong> A qubit interacts unavoidably with its environment. <em>Amplitude damping</em> (characterized by relaxation time \( T_1 \)) causes \( |1\rangle \to |0\rangle \) spontaneous decay. <em>Phase damping</em> (characterized by dephasing time \( T_2 \leq 2T_1 \)) destroys the relative phase between \( |0\rangle \) and \( |1\rangle \). Any quantum algorithm must complete its coherent evolution within a time short compared to \( T_2 \).
</div>

## 6.2 Quantum Error Correction (QEC)

### 6.2.1 The Three-Qubit Bit-Flip Code

The simplest quantum error-correcting code protects one logical qubit against a single bit-flip error using three physical qubits. The encoding is

\[
|0\rangle_L = |000\rangle, \qquad |1\rangle_L = |111\rangle.
\]

Any single-qubit \( X \) error flips one of the three qubits. Two *syndrome measurements* — measuring \( Z_1 Z_2 \) and \( Z_2 Z_3 \) without revealing the logical state — identify which qubit (if any) was flipped. The corrective \( X \) gate is then applied to that qubit.

### 6.2.2 The Nine-Qubit Shor Code

The *Shor code* is the first complete QEC code, protecting one logical qubit against an arbitrary single-qubit error (any combination of \( X \), \( Y \), and \( Z \) errors). It concatenates the three-qubit phase-flip code within the three-qubit bit-flip code, using 9 physical qubits per logical qubit. While not practically efficient, it demonstrates the feasibility of quantum error correction in principle.

### 6.2.3 The Surface Code

The *surface code* is the leading candidate for fault-tolerant quantum computing on near-term hardware. It encodes one logical qubit in a \( d \times d \) array of \( 2d^2 - 1 \) physical qubits, where \( d \) is the *code distance*. The logical error rate decreases exponentially with \( d \) once the physical error rate is below the threshold (approximately 1% for depolarizing noise). Surface codes require only nearest-neighbor two-qubit gates, matching the planar topology of superconducting qubit chips.

```python
# The Qiskit Ignis / Qiskit Experiments packages provide tools for QEC circuits.
# Below is a minimal illustration of encoding and syndrome extraction for the
# three-qubit bit-flip code.

def three_qubit_bitflip_code():
    """
    Encode logical |0> or |1> into 3 physical qubits and extract error syndromes.
    Returns the full circuit with syndrome ancilla qubits.
    """
    # 3 data qubits, 2 ancilla qubits for syndrome measurement
    data = QuantumRegister(3, "data")
    ancilla = QuantumRegister(2, "anc")
    syndrome = ClassicalRegister(2, "syn")
    data_out = ClassicalRegister(3, "data_out")
    qc = QuantumCircuit(data, ancilla, syndrome, data_out)

    # Encode: CNOT from qubit 0 to qubits 1 and 2 (assumes data[0] holds initial logical qubit)
    qc.cx(data[0], data[1])
    qc.cx(data[0], data[2])
    qc.barrier()

    # Introduce a test error: bit-flip on qubit 1
    qc.x(data[1])
    qc.barrier()

    # Syndrome measurement: ancilla[0] measures Z1 Z2 parity, ancilla[1] measures Z2 Z3
    qc.cx(data[0], ancilla[0])
    qc.cx(data[1], ancilla[0])
    qc.cx(data[1], ancilla[1])
    qc.cx(data[2], ancilla[1])
    qc.measure(ancilla, syndrome)

    # Correction based on syndrome (classically controlled in real hardware)
    # Syndrome "10" -> flip qubit 0, "11" -> flip qubit 1, "01" -> flip qubit 2
    with qc.if_test((syndrome, 0b11)):
        qc.x(data[1])

    qc.measure(data, data_out)
    return qc

print(three_qubit_bitflip_code().draw(output="text"))
```

## 6.3 Error Mitigation Techniques

Full quantum error correction is beyond reach for near-term devices because it requires an overhead of hundreds to thousands of physical qubits per logical qubit. *Error mitigation* techniques instead post-process noisy measurement results to extract estimates of the ideal (noise-free) expectation value, at the cost of additional circuit repetitions.

### 6.3.1 Zero-Noise Extrapolation (ZNE)

*Zero-noise extrapolation* deliberately amplifies the noise in a circuit by a set of scale factors \( \lambda_1 < \lambda_2 < \cdots < \lambda_k \) (by stretching gate durations or by inserting pairs of inverse gates), measures the expectation value \( E(\lambda_i) \) at each noise level, then fits a polynomial or exponential to the data and extrapolates to the zero-noise limit \( \lambda \to 0 \).

```python
from qiskit_aer.noise import NoiseModel, depolarizing_error

def build_noise_model(error_rate):
    """Build a simple depolarizing noise model at the given two-qubit gate error rate."""
    noise_model = NoiseModel()
    depol_error_2q = depolarizing_error(error_rate, 2)
    noise_model.add_all_qubit_quantum_error(depol_error_2q, ["cx"])
    return noise_model

def run_with_noise_scale(circuit, hamiltonian_op, scale_factor, base_error_rate, shots=8192):
    """
    Evaluate <H> at a noise level scaled by scale_factor relative to base.
    For scale_factor > 1, we amplify noise by using the scaled error rate.
    Note: in practice, noise amplification is done by gate folding, not by
    directly tuning hardware error rates.
    """
    scaled_error = base_error_rate * scale_factor
    noise = build_noise_model(min(scaled_error, 0.5))  # cap at 50% to avoid invalid probabilities
    noisy_sim = AerSimulator(noise_model=noise)
    estimator = AerEstimator()
    result = estimator.run([circuit], [hamiltonian_op]).result()
    return result.values[0]

# ZNE with three noise scale factors
scale_factors = [1, 2, 3]
# In practice, the circuit and hamiltonian are defined for the problem of interest
# Here we illustrate the fitting step assuming we have already measured E(lambda)
import numpy as np
example_energies = [-0.82, -0.70, -0.58]  # hypothetical values at scales 1, 2, 3
coeffs = np.polyfit(scale_factors, example_energies, deg=1)
zero_noise_estimate = np.polyval(coeffs, 0)
print(f"ZNE extrapolated energy (linear fit): {zero_noise_estimate:.4f}")
```

### 6.3.2 Probabilistic Error Cancellation (PEC)

Probabilistic error cancellation expresses the ideal expectation value as a linear combination of noisy expectation values, using a *quasi-probability decomposition* of the ideal gate in terms of noisy implementable operations. PEC is unbiased — it exactly cancels error in expectation — but the sampling overhead grows exponentially in the number of noisy gates, limiting its applicability to modest circuit depths.

### 6.3.3 Measurement Error Mitigation

Readout errors arise because the measurement process itself is noisy: a qubit prepared in \( |0\rangle \) may be read as 1 with probability \( p_{0 \to 1} \), and vice versa. *Measurement error mitigation* calibrates a *response matrix* \( A \) (where \( A_{ij} \) is the probability of measuring \( j \) when the state is \( i \)) by preparing each computational basis state and measuring many times. Inverting \( A \) then corrects the raw counts.

```python
from qiskit_ibm_runtime import QiskitRuntimeService
# Measurement error mitigation using Qiskit Experiments (conceptual sketch)
# from qiskit_experiments.library import LocalReadoutError  # production usage

def calibrate_readout_matrix(n_qubits, shots=4096):
    """
    Estimate the 2^n x 2^n readout response matrix by preparing each
    computational basis state and measuring.
    In practice, only 2*n calibration circuits are needed for local errors.
    """
    sim = AerSimulator()  # Replace with real backend for hardware calibration
    response_matrix = np.zeros((2**n_qubits, 2**n_qubits))

    for state_index in range(2**n_qubits):
        qc = QuantumCircuit(n_qubits, n_qubits)
        bits = format(state_index, f"0{n_qubits}b")
        for i, bit in enumerate(reversed(bits)):
            if bit == "1":
                qc.x(i)
        qc.measure(range(n_qubits), range(n_qubits))
        result = sim.run(qc, shots=shots).result().get_counts()
        for measured_str, count in result.items():
            measured_index = int(measured_str, 2)
            response_matrix[measured_index, state_index] = count / shots

    return response_matrix

# The response matrix for a noiseless simulator is the identity matrix
A = calibrate_readout_matrix(2)
print("Readout response matrix (noiseless simulator):")
print(np.round(A, 3))
```

---

# Chapter 7: Running on Real Quantum Hardware

## 7.1 The IBM Quantum Cloud Platform

IBM Quantum (quantum.ibm.com) provides cloud access to real superconducting qubit processors. The platform is accessed programmatically through the `qiskit-ibm-runtime` package. A *backend* represents a specific quantum processor with its own qubit connectivity map, calibrated gate set, and noise characteristics.

```python
from qiskit_ibm_runtime import QiskitRuntimeService, SamplerV2, EstimatorV2

# Save your IBM Quantum API token once
# QiskitRuntimeService.save_account(channel="ibm_quantum", token="YOUR_TOKEN_HERE")

# Load saved credentials and select a backend
service = QiskitRuntimeService()
# List available backends: service.backends()
backend = service.least_busy(operational=True, simulator=False, min_num_qubits=5)
print(f"Selected backend: {backend.name}, Qubits: {backend.num_qubits}")
```

### 7.1.1 Transpilation

Real quantum hardware has a *native gate set* (e.g., the CX and single-qubit rotations for IBM devices, or the CZ and single-qubit gates for other architectures) and a *coupling map* specifying which pairs of qubits can directly interact. *Transpilation* converts a logical circuit to an equivalent one using only native gates and routing two-qubit gates through adjacent qubits (via SWAP insertions).

```python
from qiskit.compiler import transpile

# Transpile a circuit for a specific backend
def run_on_hardware(logical_circuit, backend, optimization_level=3):
    """
    Transpile and submit a circuit to real quantum hardware.
    optimization_level: 0 (fastest, least optimized) to 3 (slowest, most optimized).
    """
    transpiled = transpile(
        logical_circuit,
        backend=backend,
        optimization_level=optimization_level,
        layout_method="sabre",        # SABRE qubit mapping algorithm
        routing_method="sabre"        # SABRE SWAP routing
    )
    print(f"Original depth: {logical_circuit.depth()}")
    print(f"Transpiled depth: {transpiled.depth()}")
    print(f"Two-qubit gate count after transpilation: "
          f"{transpiled.count_ops().get('cx', 0) + transpiled.count_ops().get('cz', 0)}")

    # Submit using the Sampler primitive
    sampler = SamplerV2(backend)
    job = sampler.run([transpiled], shots=4096)
    print(f"Job ID: {job.job_id()}")
    return job

# Usage (requires real backend):
# job = run_on_hardware(deutsch_jozsa_balanced(4), backend)
# result = job.result()
```

### 7.1.2 Noise Models and Simulation

Before submitting to real hardware, it is standard practice to test with a *noise model* that mimics the target backend's error characteristics. Qiskit Aer can construct such models automatically from backend calibration data.

```python
from qiskit_aer.noise import NoiseModel as AerNoiseModel

def simulate_with_backend_noise(circuit, backend, shots=8192):
    """
    Run a circuit in the Aer simulator using noise parameters from a real backend.
    The noise model captures T1, T2, gate errors, and readout errors.
    """
    # Requires qiskit-ibm-runtime with backend calibration data
    try:
        noise_model = AerNoiseModel.from_backend(backend)
        coupling_map = backend.coupling_map
        basis_gates = noise_model.basis_gates

        noisy_sim = AerSimulator(
            noise_model=noise_model,
            coupling_map=coupling_map,
            basis_gates=basis_gates
        )
        transpiled = transpile(circuit, noisy_sim, optimization_level=1)
        result = noisy_sim.run(transpiled, shots=shots).result()
        return result.get_counts()
    except Exception as e:
        print(f"Could not load backend noise model: {e}")
        return {}
```

## 7.2 Primitives: Sampler and Estimator

Qiskit Runtime introduces two fundamental *primitives* that abstract away the details of job submission and result aggregation:

- **Sampler**: Returns a probability distribution over bitstrings (quasi-probability distribution in the presence of error mitigation). Used when you need raw measurement counts or bitstring samples.
- **Estimator**: Returns expectation values \( \langle O \rangle \) for a given observable \( O \) and ansatz circuit. Used for VQE, QAOA, and any algorithm based on expectation value estimation.

Both primitives accept *resilience options* that enable built-in error mitigation (ZNE, PEC, twirling) at the cost of additional shots.

```python
from qiskit_ibm_runtime import EstimatorV2, SamplerV2
from qiskit_ibm_runtime.options import EstimatorOptions

def vqe_with_runtime(ansatz, hamiltonian, params, backend):
    """
    Evaluate <H> on real hardware using the EstimatorV2 primitive
    with measurement twirling and ZNE error mitigation.
    """
    options = EstimatorOptions()
    options.resilience_level = 1          # ZNE with global folding
    options.optimization_level = 3       # Full transpilation optimization
    options.twirling.enable_gates = True  # Pauli twirling on two-qubit gates
    options.twirling.num_randomizations = 32

    estimator = EstimatorV2(backend, options=options)
    pub = (ansatz, hamiltonian, params)   # Primitive Unified Bloc (PUB)
    job = estimator.run([pub])
    result = job.result()
    return result[0].data.evs  # Expectation value(s)
```

---

# Chapter 8: Advanced Topics — Tensor Networks and Quantum Advantage

## 8.1 Tensor Network Simulation Methods

### 8.1.1 Why Classical Simulation Matters

Not all quantum circuits are equally hard to simulate classically. *Tensor network* methods exploit the structure of quantum states with limited entanglement to simulate circuits much larger than the \( \sim 50 \) qubit limit of brute-force state-vector simulation.

A quantum state on \( n \) qubits is a rank-\( n \) tensor with \( 2^n \) entries. A *Matrix Product State* (MPS) represents this tensor as a chain of matrices with bond dimension \( \chi \):

\[
|\psi\rangle = \sum_{i_1, \ldots, i_n} A^{[1]}_{i_1} A^{[2]}_{i_2} \cdots A^{[n]}_{i_n} |i_1 i_2 \cdots i_n\rangle,
\]

where each \( A^{[k]}_{i_k} \) is a \( \chi \times \chi \) matrix (with smaller boundary matrices). The entanglement entropy across any bipartition of the chain is bounded by \( \log_2 \chi \). For states with area-law entanglement (such as ground states of local 1D Hamiltonians), \( \chi \) remains small and simulation is efficient.

```python
# Qiskit Aer's MPS simulator uses tensor network methods for circuits with
# limited entanglement. It can handle circuits with many qubits when entanglement is low.

from qiskit_aer import AerSimulator

mps_simulator = AerSimulator(method="matrix_product_state")

# Simulate a 40-qubit GHZ state efficiently (GHZ has low entanglement per bond)
n_large = 40
ghz_circuit = QuantumCircuit(n_large)
ghz_circuit.h(0)
for i in range(n_large - 1):
    ghz_circuit.cx(i, i + 1)
ghz_circuit.measure_all()

# MPS can handle this efficiently because the GHZ state has bond dimension 2
result_mps = mps_simulator.run(ghz_circuit, shots=1024).result()
counts_mps = result_mps.get_counts()
# Should yield mostly "0...0" and "1...1" in roughly equal proportion
top_states = sorted(counts_mps.items(), key=lambda x: -x[1])[:3]
print("Top measurement outcomes from MPS simulation:")
for state, count in top_states:
    print(f"  {state}: {count}")
```

### 8.1.2 TEBD and DMRG

*Time-Evolving Block Decimation* (TEBD) applies Trotter steps as two-site gates and truncates the MPS bond dimension after each gate, controlling simulation accuracy. *Density Matrix Renormalization Group* (DMRG) finds the ground state of local Hamiltonians by variationally optimizing the MPS — it is one of the most powerful classical methods for 1D quantum systems and sets the benchmark against which quantum simulation algorithms must compete.

## 8.2 Quantum Advantage Benchmarks

### 8.2.1 Defining Quantum Advantage

A quantum device demonstrates *quantum advantage* (or quantum supremacy in an earlier, now deprecated terminology) when it performs a computational task faster than any known classical algorithm running on any available classical hardware. This is a moving target — as classical algorithms and hardware improve, the bar rises.

### 8.2.2 Random Circuit Sampling

The Google Sycamore experiment (2019) claimed quantum advantage on *random circuit sampling* (RCS): sampling bitstrings from the output distribution of a random 53-qubit circuit. The device completed in 200 seconds a task Google estimated would take 10,000 years on Summit (then the world's fastest supercomputer). Subsequent classical algorithm improvements reduced the classical estimate significantly, illustrating how the boundary of quantum advantage shifts.

### 8.2.3 Linear Cross-Entropy Benchmark (XEB)

The *XEB score* is the standard metric for certifying random circuit sampling performance:

\[
\text{XEB} = 2^n \langle p(x) \rangle_x - 1,
\]

where \( p(x) \) is the ideal (noiseless) probability of the sampled bitstring \( x \) and the average is over measured bitstrings. A value close to 0 indicates a maximally mixed (fully noisy) device; a value of 1 indicates ideal, noiseless sampling. In practice, XEB scores of 0.2–0.5 are considered demonstrative of useful-quality quantum computation.

---

# Chapter 9: Putting It Together — Complete Programming Workflow

## 9.1 End-to-End Qiskit Workflow

A complete quantum programming project follows a standard lifecycle:

1. **Problem formulation**: Map the problem to a quantum circuit (oracle, ansatz, or Hamiltonian simulation).
2. **Circuit construction**: Build the logical circuit in Qiskit using high-level gates.
3. **Noiseless simulation**: Verify correctness on the Aer state-vector simulator.
4. **Noise model simulation**: Estimate realistic performance using a backend noise model.
5. **Transpilation and optimization**: Compile the circuit for the target backend.
6. **Hardware execution**: Submit to IBM Quantum and retrieve results.
7. **Error mitigation and post-processing**: Apply ZNE, measurement correction, or PEC.
8. **Result analysis**: Compute observables, visualize histograms, compare against classical benchmarks.

## 9.2 A Complete VQE Example for H₂

The hydrogen molecule (\( \text{H}_2 \)) at a fixed bond length is the simplest non-trivial quantum chemistry problem and the canonical VQE benchmark.

```python
"""
Complete VQE workflow for the H2 molecule using Qiskit Nature and Aer.
Requires: qiskit-nature, pyscf (optional), qiskit-aer
"""

# Step 1: Define the molecular Hamiltonian in the STO-3G basis
# For illustration, use the pre-computed Hamiltonian at equilibrium (0.735 Angstrom)
# The exact 2-qubit Hamiltonian after Jordan-Wigner transformation:
h2_hamiltonian = SparsePauliOp.from_list([
    ("II",  -1.0523732),
    ("IZ",   0.3979374),
    ("ZI",  -0.3979374),
    ("ZZ",  -0.0112801),
    ("XX",   0.1809312),
])
# Exact FCI ground-state energy: approximately -1.8572750 Hartree

# Step 2: Build a hardware-efficient 2-qubit ansatz
from qiskit.circuit.library import EfficientSU2
ansatz_h2 = EfficientSU2(2, su2_gates=["ry", "rz"], entanglement="linear", reps=1)
print(f"Ansatz has {ansatz_h2.num_parameters} parameters")

# Step 3: Run VQE on the noiseless Aer simulator
estimator_noiseless = AerEstimator()

best_energy = float("inf")
callback_energies = []

def callback(nfev, params, energy, std):
    """Record energy at each optimization step."""
    callback_energies.append(energy)
    global best_energy
    if energy < best_energy:
        best_energy = energy

initial_point = np.zeros(ansatz_h2.num_parameters)
vqe_result = minimize(
    lambda p: estimator_noiseless.run([ansatz_h2], [h2_hamiltonian], [p]).result().values[0],
    initial_point,
    method="BFGS",
    jac=lambda p: np.array([
        parameter_shift_gradient(ansatz_h2, h2_hamiltonian, p, estimator_noiseless, idx)
        for idx in range(ansatz_h2.num_parameters)
    ]),
    options={"maxiter": 200}
)

print(f"VQE converged energy: {vqe_result.fun:.6f} Hartree")
print(f"Chemical accuracy target (1 kcal/mol = 0.001594 Hartree): "
      f"{'achieved' if abs(vqe_result.fun - (-1.8572750)) < 0.001594 else 'not achieved'}")
```

## 9.3 Analyzing Results and Circuit Quality

Understanding whether an algorithm is working correctly on hardware requires several diagnostic tools:

**Expectation value convergence**: Plot energy vs. optimization iteration to diagnose slow convergence (learning rate too small) or oscillation (learning rate too large, or barren plateau).

**Barren plateaus**: For deep parameterized circuits with random initialization, gradients of the cost function exponentially vanish with system size — a phenomenon called the *barren plateau*. Mitigation strategies include: layer-by-layer training, pre-training with problem-inspired initialization, and using shallow hardware-efficient circuits.

**State tomography**: *Quantum state tomography* reconstructs the density matrix of an \( n \)-qubit state from measurements in multiple bases. It requires \( O(4^n) \) measurements and is practical only for small \( n \). *Shadow tomography* (classical shadows) reduces this to \( O(\text{poly}(\log d, \epsilon^{-1})) \) measurements for estimating many observables simultaneously.

```python
from qiskit_experiments.library import StateTomography

def run_state_tomography(circuit_to_tomograph, backend_or_sim, shots=4096):
    """
    Run quantum state tomography on the output of a circuit.
    Returns the reconstructed density matrix.
    """
    tomo_exp = StateTomography(circuit_to_tomograph)
    tomo_data = tomo_exp.run(backend_or_sim, shots=shots).block_for_results()
    state = tomo_data.analysis_results("state").value
    print(f"Reconstructed state fidelity with ideal: "
          f"{tomo_data.analysis_results('state_fidelity').value:.4f}")
    return state

# Example: tomograph a Bell state
bell_circuit = QuantumCircuit(2)
bell_circuit.h(0)
bell_circuit.cx(0, 1)

# Uncomment to run (requires qiskit-experiments installed):
# dm = run_state_tomography(bell_circuit, AerSimulator())
```

---

# Chapter 10: Programming Quantum Computers — Practical Considerations

## 10.1 Choosing a Framework

The three frameworks mentioned in the course description each have different strengths:

**Qiskit (IBM)**: The most widely used open-source quantum SDK. Tight integration with IBM Quantum hardware, the most complete transpiler for gate-model circuits, and comprehensive error mitigation tools in Qiskit Runtime. Native support for the Sampler and Estimator primitives. Best choice for superconducting qubit hardware and algorithm development.

**PennyLane (Xanadu)**: Differentiable quantum programming framework with a focus on variational algorithms and quantum machine learning. Plugin-based backend system allows the same circuit to run on Qiskit, Cirq, or photonic hardware backends. The `qml.grad` and `qml.jacobian` functions implement automatic differentiation of quantum circuits, making it the natural choice for hybrid quantum-classical machine learning.

**Q# (Microsoft)**: A domain-specific language designed for fault-tolerant quantum computing. Provides high-level abstractions for Toffoli simulation, resource estimation, and integration with the Azure Quantum cloud. Best suited for studying fault-tolerant algorithms and resource-count analysis without concern for near-term noise.

## 10.2 Practical Assignment Workflow

A typical assignment in ECE 405C / ECE 676C follows this pattern:

1. **Understand the algorithm**: Work through the mathematical derivation by hand before writing any code.
2. **Write the oracle**: The oracle is usually the algorithm-specific part; test it in isolation on small inputs.
3. **Assemble the full circuit**: Combine initialization, oracle, and post-processing gates.
4. **Verify on the simulator**: Run 1,000–8,192 shots and confirm the output distribution matches the theoretical prediction.
5. **Analyze the output**: Use `plot_histogram` or `plot_bloch_multivector` for visualization; compute success probabilities and compare with theory.
6. **Characterize noise sensitivity**: Re-run with a noise model and report how fidelity degrades with circuit depth.

```python
# Utility: comprehensive circuit diagnostics
from qiskit.visualization import plot_histogram, plot_bloch_multivector
from qiskit.quantum_info import Statevector, state_fidelity, DensityMatrix

def circuit_diagnostics(circuit, ideal_state_vector=None, shots=8192):
    """
    Run a battery of diagnostics on a quantum circuit:
    - Statevector on noiseless simulator
    - Measurement histogram
    - Fidelity with an ideal target state (if provided)
    """
    # Noiseless statevector
    sv_sim = AerSimulator(method="statevector")
    sv_circuit = circuit.remove_final_measurements(inplace=False)
    sv = Statevector(sv_circuit)
    print("Statevector (top 8 amplitudes by magnitude):")
    sv_dict = sv.to_dict()
    top = sorted(sv_dict.items(), key=lambda x: -abs(x[1]))[:8]
    for basis, amp in top:
        print(f"  |{basis}>: amplitude = {amp:.4f}, prob = {abs(amp)**2:.4f}")

    # Measurement histogram
    result = sv_sim.run(circuit, shots=shots).result()
    counts = result.get_counts()
    print(f"\nTop-5 measurement outcomes (out of {shots} shots):")
    for k, v in sorted(counts.items(), key=lambda x: -x[1])[:5]:
        print(f"  {k}: {v} shots ({100*v/shots:.1f}%)")

    # Fidelity comparison
    if ideal_state_vector is not None:
        fidelity = state_fidelity(sv, Statevector(ideal_state_vector))
        print(f"\nFidelity with ideal state: {fidelity:.6f}")

    return sv, counts

# Example: diagnose the 3-qubit GHZ state circuit
ghz3 = QuantumCircuit(3)
ghz3.h(0)
ghz3.cx(0, 1)
ghz3.cx(1, 2)
ghz3.measure_all()
sv_ghz, counts_ghz = circuit_diagnostics(ghz3)
```

## 10.3 Research Frontiers Relevant to the Course

**Quantum error correction milestones**: Google's 2023 demonstration that increasing the surface code distance from \( d = 3 \) to \( d = 5 \) reduced logical error rate — the first experimental evidence of below-threshold QEC — marked a turning point in the path toward fault-tolerant quantum computing.

**Fault-tolerant algorithm compilation**: Translating high-level quantum algorithms (Shor, QPE for chemistry) into fault-tolerant gate sequences using the Clifford+T gate set (the standard fault-tolerant universal gate set) requires millions of physical gates per logical gate for current error rates. Resource estimation tools like Qiskit's `resource_estimator` and Microsoft's Azure Quantum Resource Estimator help researchers understand the true hardware requirements.

**Quantum machine learning (QML)**: The intersection of variational quantum circuits and machine learning has generated significant interest. Quantum kernel methods embed classical data into Hilbert space via a quantum feature map and use the inner product structure as a kernel for support vector machines. Parameterized quantum circuits serve as quantum neural networks. However, theoretical results on barren plateaus and data encoding strategies suggest that demonstrating genuine quantum advantage in machine learning remains an open research question.

**Quantum-classical co-design**: Modern quantum programming practice increasingly treats the quantum processor as an accelerator within a classical HPC pipeline. Tight integration between classical optimizers, error mitigation layers, and quantum hardware — facilitated by Qiskit Runtime's serverless execution model — is the architectural direction of near-term quantum computing.

---

## Sources

- IBM Quantum Learning (learn.qiskit.org and quantum.cloud.ibm.com/docs) — primary reference for Qiskit API, tutorials, and IBM hardware documentation.
- M.A. Nielsen & I.L. Chuang, *Quantum Computation and Quantum Information*, Cambridge University Press, 2000 — the authoritative graduate textbook for theoretical foundations of quantum algorithms and error correction.
- PennyLane Quantum Machine Learning demos (pennylane.ai/qml) — open-access tutorials on variational algorithms, the parameter-shift rule, and quantum machine learning.
- A. Peruzzo et al., "A variational eigenvalue solver on a photonic chip," *Nature Communications* 5, 4213 (2014) — original VQE paper.
- E. Farhi, J. Goldstone & S. Gutmann, "A Quantum Approximate Optimization Algorithm," arXiv:1411.4028 (2014) — original QAOA paper.
- F. Arute et al. (Google AI Quantum), "Quantum supremacy using a programmable superconducting processor," *Nature* 574, 505–510 (2019) — random circuit sampling and XEB benchmarking.
- P.W. Shor, "Polynomial-time algorithms for prime factorization and discrete logarithms on a quantum computer," *SIAM J. Comput.* 26(5), 1484–1509 (1997).
- L.K. Grover, "A fast quantum mechanical algorithm for database search," *Proc. 28th ACM STOC*, 212–219 (1996).
