---
title: "CO 781: Quantum Algorithms"
prof: "David Gosset"
subjects: "CO"
---

*These notes synthesize material from publicly available sources on quantum computation: Nielsen and Chuang, *Quantum Computation and Quantum Information* (Cambridge University Press, 2010); Watrous, *The Theory of Quantum Information* (Cambridge University Press, 2018), public draft available on the author's site; Kitaev, Shen, and Vyalyi, *Classical and Quantum Computation* (American Mathematical Society, 2002); Childs, *Lecture Notes on Quantum Algorithms*, publicly hosted on the author's University of Maryland page; de Wolf, *Quantum Computing: Lecture Notes* (arXiv:1907.09415); the Quantum Algorithm Zoo at quantumalgorithmzoo.org; and assorted public lecture notes and research papers found online (Ambainis on quantum walks, Berry--Childs--Kothari on Hamiltonian simulation, Harrow--Hassidim--Lloyd on linear systems, Reichardt on span programs, among others). All exposition is paraphrased.*

---

# Chapter 1: Foundations of Quantum Information

The aim of quantum algorithms is to exploit the structure of quantum mechanical state space — Hilbert space, with its complex superposition, entanglement, and unitarity — to solve computational problems faster than the best known classical algorithm. Before describing any algorithm, we must fix the mathematical model: states, evolution, measurement, and how these compose into quantum circuits. This chapter develops that model carefully.

## 1.1 Qubits and State Space

A classical bit takes one of two values, \(0\) or \(1\). The quantum analogue, the qubit, is a unit vector in a two-dimensional complex Hilbert space \(\mathcal{H} \cong \mathbb{C}^2\). We fix an orthonormal basis \(\{|0\rangle, |1\rangle\}\), called the **computational basis**.

<div class="definition">
<strong>Definition 1.1 (Qubit).</strong> A pure state of a qubit is a unit vector \(|\psi\rangle = \alpha|0\rangle + \beta|1\rangle \in \mathbb{C}^2\) with \(|\alpha|^2 + |\beta|^2 = 1\). Two states differing by a global phase \(e^{i\theta}\) represent the same physical state.
</div>

For \(n\) qubits the state space is the tensor product \((\mathbb{C}^2)^{\otimes n} \cong \mathbb{C}^{2^n}\), with computational basis \(\{|x\rangle : x \in \{0,1\}^n\}\). A pure \(n\)-qubit state is a unit vector

\[
|\psi\rangle = \sum_{x \in \{0,1\}^n} \alpha_x |x\rangle, \qquad \sum_x |\alpha_x|^2 = 1.
\]

This exponential growth in dimension is the source of quantum computational power: \(n\) qubits store \(2^n\) complex amplitudes, but — crucially — measurement extracts only \(n\) classical bits per shot.

<div class="example">
<strong>Example 1.2 (Bell state).</strong> The two-qubit state \(|\Phi^+\rangle = \tfrac{1}{\sqrt{2}}(|00\rangle + |11\rangle)\) is not a tensor product of single-qubit states. Such states are called <em>entangled</em>; their correlations exceed any classical joint distribution and underlie phenomena such as Bell-inequality violation and quantum teleportation.
</div>

## 1.2 Unitary Evolution and Quantum Gates

Closed-system quantum evolution is described by unitary operators \(U \in \mathrm{U}(2^n)\), i.e. \(UU^\dagger = U^\dagger U = I\). Reversibility is automatic: \(U^{-1} = U^\dagger\).

<div class="definition">
<strong>Definition 1.3 (Quantum gate).</strong> A <em>quantum gate</em> on \(n\) qubits is a unitary operator on \((\mathbb{C}^2)^{\otimes n}\). Single-qubit gates of particular importance are the Pauli matrices

\[
X = \left[\begin{matrix} 0 & 1 \\ 1 & 0 \end{matrix}\right], \quad Y = \left[\begin{matrix} 0 & -i \\ i & 0 \end{matrix}\right], \quad Z = \left[\begin{matrix} 1 & 0 \\ 0 & -1 \end{matrix}\right],
\]

the Hadamard gate \(H = \tfrac{1}{\sqrt{2}}\left[\begin{matrix} 1 & 1 \\ 1 & -1 \end{matrix}\right]\), and the phase gates \(S = \mathrm{diag}(1, i)\) and \(T = \mathrm{diag}(1, e^{i\pi/4})\).
</div>

The two-qubit **controlled-NOT** gate \(\mathrm{CNOT}\) acts as \(|a\rangle|b\rangle \mapsto |a\rangle|a \oplus b\rangle\) on the computational basis. A central fact, established by Solovay--Kitaev and refined by many others, is that finite gate sets suffice.

<div class="theorem">
<strong>Theorem 1.4 (Universality).</strong> The set \(\{H, T, \mathrm{CNOT}\}\) is universal for quantum computation: any unitary on \(n\) qubits can be approximated to error \(\varepsilon\) in operator norm by a circuit of \(\operatorname{poly}(2^n, \log(1/\varepsilon))\) gates from this set. Moreover (Solovay--Kitaev), any single-qubit unitary can be approximated to error \(\varepsilon\) using \(O(\log^c(1/\varepsilon))\) gates from any universal single-qubit gate set, for some constant \(c\).
</div>

Universality lets us speak of "the" model of quantum computation independent of the gate set; concrete cost depends on which set one fixes. The Clifford+T set is the standard target for fault-tolerance, since the Clifford group can be implemented transversally in many error-correcting codes while the \(T\) gate requires the more expensive technique of magic-state distillation.

## 1.3 Measurement, Density Operators, and Mixed States

A projective measurement in the computational basis applied to \(|\psi\rangle = \sum_x \alpha_x |x\rangle\) returns outcome \(x\) with probability \(|\alpha_x|^2\) and leaves the post-measurement state \(|x\rangle\). More generally, a measurement is described by a collection \(\{M_k\}\) of operators with \(\sum_k M_k^\dagger M_k = I\); outcome \(k\) occurs with probability \(\langle \psi | M_k^\dagger M_k | \psi\rangle\) and the post-measurement state is \(M_k|\psi\rangle / \sqrt{\Pr(k)}\).

When the experimenter is uncertain about which pure state the system is in, or when one studies a subsystem of an entangled pair, the appropriate object is a density operator.

<div class="definition">
<strong>Definition 1.5 (Density operator).</strong> A <em>density operator</em> on \(\mathcal{H}\) is a positive semidefinite operator \(\rho\) with \(\mathrm{tr}(\rho) = 1\). Pure states correspond to rank-one density operators \(\rho = |\psi\rangle\langle\psi|\). Convex combinations \(\rho = \sum_i p_i |\psi_i\rangle\langle\psi_i|\) describe statistical ensembles; the same \(\rho\) admits many such decompositions.
</div>

<div class="theorem">
<strong>Theorem 1.6 (Spectral form).</strong> Every density operator \(\rho\) admits a spectral decomposition \(\rho = \sum_i \lambda_i |\phi_i\rangle\langle\phi_i|\) with \(\lambda_i \geq 0\), \(\sum_i \lambda_i = 1\), and \(\{|\phi_i\rangle\}\) orthonormal. The von Neumann entropy is \(S(\rho) = -\sum_i \lambda_i \log \lambda_i\).
</div>

For a bipartite pure state \(|\Psi\rangle_{AB}\), the reduced state on \(A\) is \(\rho_A = \mathrm{tr}_B(|\Psi\rangle\langle\Psi|)\), where \(\mathrm{tr}_B\) is the partial trace. The Schmidt decomposition gives \(|\Psi\rangle = \sum_i \sqrt{\lambda_i} |a_i\rangle |b_i\rangle\) with orthonormal \(\{|a_i\rangle\}, \{|b_i\rangle\}\); the rank of this decomposition equals the rank of \(\rho_A\) and is the **Schmidt rank**, a basic measure of entanglement.

<div class="remark">
<strong>Remark 1.7.</strong> The most general physically realizable transformation of a quantum system is a <em>completely positive trace-preserving</em> (CPTP) map, also called a <em>quantum channel</em>. The Stinespring dilation theorem says every CPTP map \(\Phi: B(\mathcal{H}_A) \to B(\mathcal{H}_B)\) arises by appending an ancilla, applying a unitary, and tracing out a subsystem: \(\Phi(\rho) = \mathrm{tr}_E\bigl(U(\rho \otimes |0\rangle\langle 0|)U^\dagger\bigr)\). All non-unitarity in quantum theory is unitarity on a larger space.
</div>

## 1.4 The Quantum Circuit Model

A **quantum circuit** on \(n\) qubits is a sequence of gates from a fixed universal set, each acting on a constant number of qubits, possibly followed by computational-basis measurements. The cost is the total number of gates; the depth is the length of the longest directed path through the gate dependency DAG. Quantum complexity classes such as \(\mathrm{BQP}\) (bounded-error quantum polynomial time) are defined in terms of uniform families of polynomial-size quantum circuits.

We freely use ancilla qubits initialized to \(|0\rangle\) and discard or measure them at the end. The **principle of deferred measurement** says any intermediate measurement can be pushed to the end of the circuit without changing the output distribution, by replacing classically controlled operations with quantum-controlled ones.

<div class="example">
<strong>Example 1.8 (Quantum teleportation).</strong> Alice and Bob share \(|\Phi^+\rangle\). Alice has an unknown qubit \(|\psi\rangle\). She measures her two qubits in the Bell basis, obtaining one of four outcomes, and sends the two classical bits to Bob, who applies one of \(I, X, Z, XZ\) to recover \(|\psi\rangle\). The state \(|\psi\rangle\) was never copied — the no-cloning theorem forbids this — yet it has been transmitted using only one ebit of entanglement and two classical bits.
</div>

<div class="theorem">
<strong>Theorem 1.9 (No-cloning).</strong> There is no unitary \(U\) and fixed state \(|s\rangle\) such that \(U(|\psi\rangle |s\rangle) = |\psi\rangle |\psi\rangle\) for all \(|\psi\rangle\).
</div>

<div class="proof">
<strong>Proof.</strong> Suppose such a \(U\) exists. For any two states \(|\psi\rangle, |\phi\rangle\), unitarity preserves inner products: \(\langle \psi|\phi\rangle \langle s|s\rangle = \langle \psi|\phi\rangle\) on the left, and \(\langle\psi|\phi\rangle^2\) on the right. Hence \(\langle \psi|\phi\rangle = \langle\psi|\phi\rangle^2\), forcing \(\langle\psi|\phi\rangle \in \{0,1\}\). This contradicts the existence of any non-orthogonal, non-identical pair.
</div>

# Chapter 2: The Quantum Fourier Transform and Phase Estimation

The Quantum Fourier Transform (QFT) is the algebraic engine behind nearly every exponential quantum speedup: Shor's factoring, the abelian hidden subgroup problem, and quantum phase estimation all depend on it. Classically the Fast Fourier Transform on \(N = 2^n\) points runs in time \(O(N \log N)\); the QFT realizes the same linear map on \(n\) qubits using only \(O(n^2)\) elementary gates (or \(O(n \log n)\) with approximate variants).

## 2.1 Definition and Circuit

<div class="definition">
<strong>Definition 2.1 (Quantum Fourier Transform).</strong> The QFT modulo \(N\) is the unitary

\[
\mathrm{QFT}_N |x\rangle = \frac{1}{\sqrt{N}} \sum_{y=0}^{N-1} e^{2\pi i x y / N} |y\rangle, \qquad x \in \{0, 1, \ldots, N-1\}.
\]
</div>

When \(N = 2^n\) the transform factorizes neatly. Writing \(y = y_1 y_2 \cdots y_n\) in binary and using \(x/N = 0.x_1 x_2 \cdots x_n\) as a binary fraction, one verifies the product form

\[
\mathrm{QFT}_{2^n} |x\rangle = \frac{1}{2^{n/2}} \bigotimes_{k=1}^{n} \left( |0\rangle + e^{2\pi i \, 0.x_k x_{k+1} \cdots x_n} |1\rangle \right).
\]

This factorization underlies the textbook QFT circuit: apply Hadamard to qubit \(1\), then controlled-\(R_2, R_3, \ldots, R_n\) phase gates (where \(R_k = \mathrm{diag}(1, e^{2\pi i / 2^k})\)) controlled on qubits \(2, \ldots, n\); recurse on the remaining qubits; finally swap qubits \(j \leftrightarrow n+1-j\) to fix the bit ordering. Total gate count: \(O(n^2)\).

<div class="remark">
<strong>Remark 2.2.</strong> Truncating the controlled rotations whose angles are smaller than \(\varepsilon/n\) yields an <em>approximate</em> QFT requiring only \(O(n \log(n/\varepsilon))\) gates, which is sufficient for all standard applications.
</div>

## 2.2 Phase Estimation

Given a unitary \(U\) and an eigenvector \(|\psi\rangle\) with \(U|\psi\rangle = e^{2\pi i \varphi}|\psi\rangle\), **phase estimation** outputs an \(n\)-bit approximation to \(\varphi\).

<div class="theorem">
<strong>Theorem 2.3 (Quantum phase estimation).</strong> Let \(U\) be a unitary with eigenvalue \(e^{2\pi i \varphi}\) on \(|\psi\rangle\). Using one copy of \(|\psi\rangle\), \(t\) ancilla qubits, and \(O(2^t)\) controlled-\(U\) calls, the following circuit produces, with probability at least \(1 - \varepsilon\), an estimate \(\widetilde{\varphi}\) within \(2^{-n}\) of \(\varphi\), provided \(t = n + \lceil \log(2 + 1/(2\varepsilon)) \rceil\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Prepare \(t\) ancillas in \(H^{\otimes t}|0\rangle = 2^{-t/2}\sum_k |k\rangle\) and apply \(\sum_k |k\rangle\langle k| \otimes U^k\) to the joint system. Since \(U^k |\psi\rangle = e^{2\pi i k \varphi}|\psi\rangle\), the ancillas become

\[
\frac{1}{2^{t/2}} \sum_{k=0}^{2^t - 1} e^{2\pi i k \varphi} |k\rangle.
\]

This is exactly \(\mathrm{QFT}_{2^t}|2^t \varphi\rangle\) when \(2^t \varphi\) is an integer; otherwise it is its closest analogue. Applying \(\mathrm{QFT}^{-1}\) and measuring yields a value sharply concentrated around \(\lfloor 2^t \varphi\rceil\). A standard amplitude analysis bounds the failure probability.
</div>

Phase estimation is a workhorse subroutine: in Shor's algorithm it extracts the order of an element, in HHL it inverts eigenvalues of a Hermitian matrix, in quantum chemistry it reads off energies of molecular Hamiltonians.

# Chapter 3: Shor's Algorithm

The exponential quantum speedup for factoring discovered by Shor in 1994 catalyzed quantum computing as a discipline. The reduction from factoring to **order finding** is classical and dates back to Miller; the quantum content is solving order finding in polynomial time using the QFT.

## 3.1 Reduction of Factoring to Order Finding

<div class="theorem">
<strong>Theorem 3.1 (Miller).</strong> Let \(N\) be a composite odd integer with at least two distinct prime factors. Choose \(a \in \{2, \ldots, N-1\}\) uniformly at random. If \(\gcd(a, N) > 1\) we are done. Otherwise let \(r\) be the multiplicative order of \(a\) modulo \(N\). With probability at least \(1/2\), \(r\) is even and \(a^{r/2} \not\equiv -1 \pmod N\); in that case \(\gcd(a^{r/2} \pm 1, N)\) is a nontrivial factor of \(N\).
</div>

Hence factoring reduces to order finding, with polynomial overhead and success probability boosted by repetition.

## 3.2 Quantum Order Finding

Fix \(a\) coprime to \(N\) and let \(r\) be its order. Consider the unitary \(U_a\) on \(\lceil \log_2 N \rceil\) qubits defined by \(U_a |y\rangle = |ay \bmod N\rangle\) (extended trivially on \(y \geq N\)). Its eigenvectors are

\[
|u_s\rangle = \frac{1}{\sqrt{r}} \sum_{k=0}^{r-1} e^{-2\pi i s k / r} |a^k \bmod N\rangle, \qquad s = 0, 1, \ldots, r-1,
\]

with eigenvalues \(e^{2\pi i s / r}\). Crucially, \(\frac{1}{\sqrt{r}}\sum_s |u_s\rangle = |1\rangle\), so preparing \(|1\rangle\) is the same as preparing a uniform superposition over the eigenvectors.

Running phase estimation on \(U_a\) with input \(|1\rangle\) yields an estimate of \(s/r\) for a uniformly random \(s\). The continued-fraction algorithm extracts \(r\) from a sufficiently accurate rational approximation. The cost is dominated by computing controlled \(U_a^{2^k}\) by repeated squaring of modular multiplication, with total cost \(\widetilde{O}(\log^3 N)\).

<div class="theorem">
<strong>Theorem 3.2 (Shor).</strong> There is a bounded-error quantum algorithm that factors an \(n\)-bit integer in time \(\widetilde{O}(n^3)\).
</div>

## 3.3 Discrete Logarithms

A nearly identical strategy solves the discrete logarithm problem in any finite cyclic group \(G = \langle g \rangle\) of known order \(N\): given \(h = g^x\), find \(x\). Define the unitary \(U_{g,h}|a, b\rangle = |a, b + a x \bmod N\rangle\) implicitly by computing \(g^a h^{-b}\), and apply a two-register QFT. Measurement yields a pair \((c_1, c_2)\) with \(c_2 \equiv -x c_1 \pmod{N}\), from which \(x\) is recovered. This breaks Diffie--Hellman and elliptic-curve cryptography in polynomial time.

<div class="remark">
<strong>Remark 3.3.</strong> Both order finding and discrete log are instances of the abelian Hidden Subgroup Problem (HSP) — see Chapter 5. The fact that Shor's algorithm and the abelian HSP solution are unified explains why so many number-theoretic problems collapse in BQP.
</div>

# Chapter 4: Grover's Algorithm and Amplitude Amplification

Where Shor exploits algebraic structure, Grover's algorithm gives a generic quadratic speedup for unstructured search. Given a Boolean function \(f: \{0,1\}^n \to \{0,1\}\) with a unique marked element \(x^* \in f^{-1}(1)\), classical search needs \(\Omega(N)\) queries (\(N = 2^n\)); Grover finds \(x^*\) using \(O(\sqrt{N})\) quantum queries.

## 4.1 The Grover Iterate

We assume access to a phase oracle \(O_f |x\rangle = (-1)^{f(x)} |x\rangle\). Let \(|s\rangle = \frac{1}{\sqrt{N}}\sum_x |x\rangle = H^{\otimes n}|0^n\rangle\) be the uniform superposition.

<div class="definition">
<strong>Definition 4.1 (Grover iterate).</strong> The Grover operator is \(G = (2|s\rangle\langle s| - I) O_f\). The first factor reflects about \(|s\rangle\); the second reflects about the orthogonal complement of the marked subspace.
</div>

<div class="theorem">
<strong>Theorem 4.2 (Grover).</strong> Let \(M = |f^{-1}(1)|\) and \(\theta = \arcsin(\sqrt{M/N})\). After \(k\) iterations, the probability of measuring a marked element from \(G^k |s\rangle\) equals \(\sin^2((2k+1)\theta)\). Choosing \(k = \lfloor \pi/(4\theta)\rfloor = O(\sqrt{N/M})\) gives success probability \(\Theta(1)\).
</div>

<div class="proof">
<strong>Proof.</strong> Write \(|s\rangle = \cos\theta\, |B\rangle + \sin\theta\, |G\rangle\) where \(|B\rangle, |G\rangle\) are uniform superpositions over the unmarked and marked sets. The two reflections preserve the two-dimensional subspace \(\mathrm{span}\{|B\rangle, |G\rangle\}\) and act there as a rotation by \(2\theta\). After \(k\) iterations the angle is \((2k+1)\theta\); maximizing \(\sin^2\) gives the stated count.
</div>

## 4.2 Amplitude Amplification and Estimation

Brassard, Hoyer, Mosca, and Tapp generalized Grover's algorithm to **amplitude amplification**: any quantum algorithm with success probability \(p\) can be boosted to constant success probability using \(O(1/\sqrt{p})\) repetitions of the algorithm and its inverse, against \(O(1/p)\) for classical repetition.

<div class="theorem">
<strong>Theorem 4.3 (Amplitude amplification).</strong> Let \(\mathcal{A}\) be a quantum algorithm such that \(\mathcal{A}|0\rangle = \sqrt{p}|\psi_{\mathrm{good}}\rangle + \sqrt{1-p}|\psi_{\mathrm{bad}}\rangle\), and let \(P\) project onto good states. Then \(Q = -\mathcal{A} S_0 \mathcal{A}^{-1} S_P\), where \(S_0\) reflects about \(|0\rangle\) and \(S_P = I - 2P\), satisfies the analogue of Theorem 4.2: applying \(Q\) about \(\pi/(4\sqrt{p})\) times to \(\mathcal{A}|0\rangle\) yields a good state with constant probability.
</div>

A companion procedure, **amplitude estimation**, combines amplitude amplification with phase estimation to estimate \(p\) with additive error \(\varepsilon\) using \(O(1/\varepsilon)\) calls to \(\mathcal{A}\) — quadratically better than Monte Carlo.

<div class="example">
<strong>Example 4.4 (Counting).</strong> To count the number of marked items in an unstructured set of size \(N\) to relative error \(\varepsilon\), one runs amplitude estimation on the Grover oracle with \(O(\sqrt{N}/\varepsilon)\) queries, beating the classical sampling bound \(O(N/\varepsilon^2)\) for fixed \(\varepsilon\).
</div>

<div class="remark">
<strong>Remark 4.5.</strong> Grover's quadratic speedup is <em>provably optimal</em> in the query model: the BBBV (Bennett--Bernstein--Brassard--Vazirani) theorem shows \(\Omega(\sqrt{N})\) queries are necessary for unstructured search. We sketch this lower bound in Chapter 9.
</div>

# Chapter 5: The Hidden Subgroup Problem

Many problems with quantum exponential speedups can be cast as instances of the **Hidden Subgroup Problem** (HSP): given a function \(f: G \to S\) on a group \(G\) with the promise that \(f(x) = f(y) \iff xH = yH\) for some unknown subgroup \(H \leq G\), find generators of \(H\) using oracle queries to \(f\).

## 5.1 The Abelian HSP

<div class="theorem">
<strong>Theorem 5.1 (Abelian HSP, Kitaev).</strong> If \(G\) is finite abelian, there is a quantum algorithm solving HSP using \(O(\log |G|)\) queries to \(f\) and \(\operatorname{poly}(\log |G|)\) gates.
</div>

The algorithm is the Fourier-sampling generalization of Shor:

<div class="proof">
<strong>Standard coset state algorithm.</strong> Prepare \(\sum_{g \in G} |g\rangle |0\rangle\), query \(f\) into the second register to obtain \(\sum_g |g\rangle |f(g)\rangle\), and measure the second register. The first register collapses to a uniform superposition over a coset \(xH\):

\[
|xH\rangle = \frac{1}{\sqrt{|H|}} \sum_{h \in H} |xh\rangle.
\]

Apply the QFT over \(G\). For \(G = \mathbb{Z}_N\), \(\mathrm{QFT}_G |xH\rangle\) is supported on characters \(\chi_y\) with \(\chi_y|_H \equiv 1\), i.e. on the <em>annihilator</em> \(H^\perp\). Sampling \(O(\log |G|)\) such characters and solving a system of linear equations over \(\mathbb{Z}\) recovers generators of \(H\).
</div>

Order finding is the case \(G = \mathbb{Z}\) with \(f(x) = a^x \bmod N\); Simon's problem is the case \(G = \mathbb{Z}_2^n\) with hidden subgroup \(\{0, s\}\).

<div class="example">
<strong>Example 5.2 (Simon's problem).</strong> Given \(f: \mathbb{Z}_2^n \to \mathbb{Z}_2^n\) with the promise that \(f(x) = f(y) \iff y = x \oplus s\) for some unknown \(s \neq 0\), the abelian HSP machinery (using only Hadamards as the QFT over \(\mathbb{Z}_2^n\)) recovers \(s\) in \(O(n)\) quantum queries, against \(\Omega(2^{n/2})\) classical queries — the first exponential quantum speedup ever exhibited.
</div>

## 5.2 Non-Abelian HSP

For non-abelian \(G\), the situation is dramatically more difficult, and remains one of the central open problems in quantum algorithms. The character-theoretic analysis still applies — coset states have density operator block-diagonal in the basis given by irreducible representations — but extracting \(H\) from measurement outcomes is generally not understood.

<div class="theorem">
<strong>Theorem 5.3 (Ettinger--Hoyer--Knill).</strong> For any finite group \(G\), the HSP has quantum query complexity \(O(\log |G|)\). However, the corresponding time complexity is unknown for most non-abelian \(G\).
</div>

Two important special cases admit efficient quantum algorithms: the dihedral group \(D_N\) reduces (via Regev's work) to a lattice problem; the symmetric group \(S_n\), if it admitted an efficient HSP algorithm, would yield a polynomial-time quantum algorithm for graph isomorphism. The latter remains open.

<div class="remark">
<strong>Remark 5.4.</strong> Kuperberg gave a sub-exponential time algorithm for the dihedral HSP, running in time \(2^{O(\sqrt{\log N})}\). This bears on the security of certain post-quantum lattice cryptosystems.
</div>

# Chapter 6: Quantum Walks

Just as classical random walks are central to randomized algorithms, **quantum walks** form a versatile algorithmic framework. There are two principal flavors: discrete-time (coin) walks and continuous-time walks.

## 6.1 Continuous-Time Quantum Walks

<div class="definition">
<strong>Definition 6.1 (Continuous-time walk).</strong> Given a graph \(G = (V, E)\) with adjacency matrix \(A\), the continuous-time quantum walk is the unitary \(U(t) = e^{-i A t}\) acting on \(\mathbb{C}^V\). One can equivalently use the Laplacian \(L = D - A\).
</div>

The continuous-time walk was introduced by Farhi and Gutmann to study quantum decision trees. A landmark application is the **glued-trees** problem: there is an oracle problem (traversing a graph formed by gluing two binary trees by a random matching) for which the continuous-time walk provides an exponential speedup over any classical algorithm.

<div class="theorem">
<strong>Theorem 6.2 (Childs--Cleve--Deotto--Farhi--Gutmann--Spielman).</strong> There is a black-box graph for which continuous-time quantum walk reaches the exit vertex in polynomial time, while any classical algorithm requires exponentially many queries.
</div>

## 6.2 Discrete-Time Walks and Szegedy's Framework

A discrete-time walk on a graph augments each vertex with a coin space; the walk alternates a coin flip with a shift conditioned on the coin. Szegedy unified discrete-time walks with classical Markov chains: for a reversible Markov chain with transition matrix \(P\), define on \(\mathbb{C}^V \otimes \mathbb{C}^V\) the unitary \(W = S \cdot (2 \Pi - I)\) where \(\Pi\) projects onto \(\mathrm{span}\{|x\rangle \sum_y \sqrt{P_{xy}}|y\rangle\}\) and \(S\) swaps registers.

<div class="theorem">
<strong>Theorem 6.3 (Szegedy).</strong> The eigenphases of \(W\) are \(\pm 2 \arcsin(\sqrt{\lambda_i(P)})\), where \(\lambda_i(P)\) are singular values of the discriminant matrix. Quantum hitting times are quadratically smaller than classical hitting times.
</div>

This framework yields the Magniez--Nayak--Roland--Santha algorithm for spatial search and Ambainis's optimal \(O(N^{2/3})\) quantum algorithm for **element distinctness**: determine whether \(N\) input values contain a collision.

<div class="example">
<strong>Example 6.4 (Element distinctness).</strong> Set up a Johnson-graph walk on \(r\)-subsets of \([N]\), with marked subsets being those containing a colliding pair. Optimizing the setup, walk, and check costs yields total query cost \(O(N^{2/3})\). The matching lower bound (also \(\Omega(N^{2/3})\)) follows from the polynomial method.
</div>

# Chapter 7: Hamiltonian Simulation

Feynman's original motivation for quantum computing was to simulate quantum systems. Given a Hamiltonian \(H\) acting on \(n\) qubits, the goal of **Hamiltonian simulation** is to implement the time evolution \(e^{-iHt}\) to error \(\varepsilon\) using as few elementary gates as possible.

## 7.1 Trotter--Suzuki Product Formulas

If \(H = \sum_{j=1}^L H_j\) where each \(e^{-iH_j t}\) is easy to implement, Lie--Trotter gives a first-order approximation:

\[
e^{-iHt} \approx \left( \prod_j e^{-i H_j t/r} \right)^r,
\]

with error \(O(\|H\|^2 t^2 / r)\) per step. To achieve global error \(\varepsilon\) one takes \(r = O(\|H\|^2 t^2 / \varepsilon)\). Higher-order Suzuki formulas reduce the dependence on \(t/\varepsilon\).

<div class="theorem">
<strong>Theorem 7.1 (Suzuki).</strong> For each integer \(k \geq 1\) there is a \(2k\)-th order product formula \(S_{2k}(t)\) with \(\|e^{-iHt} - S_{2k}(t)\| = O(t^{2k+1})\) and gate count \(L \cdot 5^{k-1}\) per step.
</div>

## 7.2 Linear Combination of Unitaries (LCU)

A more powerful technique decomposes \(H = \sum_\ell \alpha_\ell U_\ell\) as a linear combination of unitaries, with \(\alpha_\ell > 0\). Define oracles

\[
\mathrm{PREP}|0\rangle = \frac{1}{\sqrt{\alpha}} \sum_\ell \sqrt{\alpha_\ell}|\ell\rangle, \qquad \mathrm{SEL}|\ell\rangle|\psi\rangle = |\ell\rangle U_\ell |\psi\rangle,
\]

where \(\alpha = \sum_\ell \alpha_\ell\). Then \((\mathrm{PREP}^\dagger \otimes I) \mathrm{SEL} (\mathrm{PREP} \otimes I)\) implements \((1/\alpha) \sum_\ell \alpha_\ell U_\ell\) on a flagged subspace. Combined with amplitude amplification, this yields the Berry--Childs--Kothari simulation algorithm.

<div class="theorem">
<strong>Theorem 7.2 (Berry--Childs--Kothari).</strong> A \(d\)-sparse Hamiltonian \(H\) with \(\|H\|_{\max} \leq 1\) can be simulated for time \(t\) to error \(\varepsilon\) using \(O\left( t d \cdot \log(t d / \varepsilon) / \log\log(t d / \varepsilon) \right)\) queries to the sparse-access oracle.
</div>

## 7.3 Qubitization and Block Encoding

The current state of the art is **qubitization**, due to Low and Chuang. A **block encoding** of \(H/\alpha\) is a unitary \(U\) with \((\langle 0| \otimes I) U (|0\rangle \otimes I) = H/\alpha\). Qubitization shows that a single application of a reflection through a particular subspace, combined with \(U\), gives a walk operator \(W\) whose action on the \(|0\rangle\)-subspace is exactly \(\arccos(H/\alpha)\). Polynomial transformations of \(H\) (in particular \(e^{-iHt}\)) are then implemented by **quantum signal processing**.

<div class="theorem">
<strong>Theorem 7.3 (Low--Chuang).</strong> Given a block encoding of \(H/\alpha\), Hamiltonian simulation for time \(t\) to error \(\varepsilon\) can be performed with \(O(\alpha t + \log(1/\varepsilon))\) uses of the block encoding. This achieves the optimal additive scaling in \(\alpha t\) and \(\log(1/\varepsilon)\).
</div>

<div class="remark">
<strong>Remark 7.4.</strong> Qubitization sits within the broader <em>quantum singular value transformation</em> (QSVT) framework of Gilyen, Su, Low, and Wiebe, which provides a unified algorithmic primitive: given a block encoding of \(A\), implement a polynomial \(p(A)\) in nearly optimal complexity. Almost every known quantum algorithm — including Grover, phase estimation, HHL, amplitude amplification — fits into the QSVT framework as a special case.
</div>

# Chapter 8: The HHL Algorithm and Quantum Linear Algebra

The Harrow--Hassidim--Lloyd algorithm (HHL, 2009) solves a quantum analogue of the linear system problem \(Ax = b\), achieving exponential speedup under suitable assumptions about input/output access.

## 8.1 The HHL Problem

<div class="definition">
<strong>Definition 8.1 (HHL problem).</strong> Given an \(N \times N\) Hermitian matrix \(A\) (sparse and well-conditioned) and a quantum state \(|b\rangle = \sum_i b_i |i\rangle\), output a quantum state \(|x\rangle \propto A^{-1}|b\rangle\), to within \(\varepsilon\) in trace distance.
</div>

The output is a quantum state, not a classical vector — extracting all \(N\) entries by tomography would erase the speedup. The intended use is to compute expectation values \(\langle x | M | x \rangle\) for some efficiently measurable observable \(M\).

## 8.2 The Algorithm

Spectrally decompose \(A = \sum_j \lambda_j |u_j\rangle\langle u_j|\). Expand \(|b\rangle = \sum_j \beta_j |u_j\rangle\). Then \(A^{-1}|b\rangle = \sum_j (\beta_j/\lambda_j)|u_j\rangle\). The algorithm proceeds in four steps:

1. Phase-estimate \(e^{iA t_0}\) on \(|b\rangle\), producing \(\sum_j \beta_j |u_j\rangle |\widetilde{\lambda}_j\rangle\).
2. Append an ancilla and apply a controlled rotation that maps \(|\widetilde{\lambda}_j\rangle |0\rangle \mapsto |\widetilde{\lambda}_j\rangle (\sqrt{1 - C^2/\widetilde{\lambda}_j^2}\,|0\rangle + (C/\widetilde{\lambda}_j)|1\rangle)\).
3. Uncompute the phase-estimation register.
4. Postselect on the ancilla being \(|1\rangle\); the remaining state is proportional to \(\sum_j (\beta_j/\widetilde{\lambda}_j)|u_j\rangle \approx A^{-1}|b\rangle\).

<div class="theorem">
<strong>Theorem 8.2 (HHL).</strong> Let \(A\) be \(s\)-sparse, with condition number \(\kappa\), and let \(|b\rangle\) be efficiently preparable. There is a quantum algorithm producing \(|x\rangle\) approximating \(A^{-1}|b\rangle/\|A^{-1}|b\rangle\|\) in trace distance \(\varepsilon\) using \(\widetilde{O}(\log(N) \cdot s^2 \kappa^2 / \varepsilon)\) gates.
</div>

Subsequent improvements (Childs--Kothari--Somma; via QSVT) reduce the dependence on \(\kappa\) to nearly linear and on \(\varepsilon\) to \(\mathrm{polylog}(1/\varepsilon)\).

<div class="remark">
<strong>Remark 8.3 (Caveats and dequantization).</strong> The HHL "exponential speedup" requires (i) efficient quantum access to \(A\) and \(|b\rangle\), (ii) low condition number, and (iii) that one only needs to extract a summary statistic from \(|x\rangle\). When the matrix admits efficient \(\ell_2\)-sampling access classically, Tang and others have shown that many proposed quantum machine-learning speedups can be "dequantized" — i.e., matched up to polynomial factors classically. The status of HHL-style speedups in practice is therefore quite subtle.
</div>

# Chapter 9: Query Complexity Lower Bounds

A central question in quantum algorithms is whether further speedups are possible. Lower bounds in the **query model** — counting only oracle calls — provide unconditional limits.

## 9.1 The Polynomial Method

Beals, Buhrman, Cleve, Mosca, and de Wolf observed that after \(T\) queries to an oracle for \(x \in \{0,1\}^N\), the acceptance probability of any quantum algorithm is a real polynomial in \(x_1, \ldots, x_N\) of degree at most \(2T\).

<div class="theorem">
<strong>Theorem 9.1 (BBCMW).</strong> If a quantum algorithm computes a Boolean function \(f: \{0,1\}^N \to \{0,1\}\) with bounded error using \(T\) queries, then \(\widetilde{\deg}(f) \leq 2T\), where \(\widetilde{\deg}(f)\) is the minimum degree of a real polynomial \(p\) with \(|p(x) - f(x)| \leq 1/3\) for all \(x \in \{0,1\}^N\).
</div>

<div class="proof">
<strong>Sketch.</strong> Each oracle query is implemented as a unitary whose entries are linear in \(x_i\). After \(T\) queries the amplitudes of basis states are degree-\(T\) polynomials in \(x\), and probabilities (amplitude moduli squared) are degree-\(2T\).
</div>

This converts quantum lower bounds into polynomial-degree lower bounds, a classical and well-studied area. For example, Nisan and Szegedy's bound \(\widetilde{\deg}(\mathrm{OR}) = \Omega(\sqrt{N})\) gives the BBBV theorem: Grover is optimal.

<div class="theorem">
<strong>Theorem 9.2 (BBBV).</strong> Any bounded-error quantum algorithm for unstructured search requires \(\Omega(\sqrt{N})\) queries.
</div>

## 9.2 The Adversary Method

The adversary method, due to Ambainis, is often tighter than the polynomial method. One assigns nonnegative weights \(\Gamma_{x,y}\) to pairs of inputs with \(f(x) \neq f(y)\) and bounds the rate at which a quantum algorithm can distinguish them.

<div class="theorem">
<strong>Theorem 9.3 (General adversary bound).</strong> The bounded-error quantum query complexity of \(f\) satisfies \(Q(f) = \Theta(\mathrm{ADV}^\pm(f))\), where the negative-weight adversary value is

\[
\mathrm{ADV}^\pm(f) = \max_{\Gamma} \frac{\|\Gamma\|}{\max_i \|\Gamma \circ \Delta_i\|},
\]

with \(\Gamma\) ranging over Hermitian matrices on inputs vanishing on equal-output pairs, and \(\Delta_i\) the indicator of disagreement on coordinate \(i\).
</div>

This was proved tight by Reichardt via the span program connection (Chapter 10). It gives optimal lower bounds for many problems including \(k\)-sum, triangle finding (asymptotically), and a host of formula-evaluation problems.

# Chapter 10: Span Programs and Learning

A **span program** is a linear-algebraic computational model introduced by Karchmer and Wigderson. Reichardt's discovery that span programs are tight for quantum query complexity provided both an algorithmic toolkit and a structural theory.

## 10.1 Span Programs

<div class="definition">
<strong>Definition 10.1 (Span program).</strong> A span program \(P\) for \(f: \{0,1\}^N \to \{0,1\}\) consists of a target vector \(\tau\) in a vector space \(V\) and input vectors \(\{v_j\}\) each labeled by a literal \(x_i\) or \(\bar{x}_i\). The program <em>accepts</em> input \(x\) if \(\tau\) lies in the span of the vectors whose label evaluates to \(1\) on \(x\). The witness size is a complexity measure that quantitatively captures how hard acceptance/rejection is.
</div>

<div class="theorem">
<strong>Theorem 10.2 (Reichardt).</strong> The optimal witness size of a span program for \(f\) equals (up to constants) the general adversary bound \(\mathrm{ADV}^\pm(f)\), and hence equals the bounded-error quantum query complexity of \(f\).
</div>

This is a remarkable equivalence: a combinatorial-algebraic object (the span program) exactly captures the quantum query complexity. Algorithmically, span programs translate to quantum walks on associated bipartite graphs, evaluated by phase estimation of a Szegedy-type walk operator.

<div class="example">
<strong>Example 10.3 (Formula evaluation).</strong> Reichardt and collaborators used span-program ideas to show that any read-once Boolean formula on \(N\) variables can be evaluated by a quantum algorithm using \(O(\sqrt{N})\) queries — matching the lower bound and significantly improving classical bounds for unbalanced formulas.
</div>

## 10.2 Learning Algorithms

The intersection of quantum algorithms with machine learning is a rapidly developing area. Beyond HHL-based proposals (Chapter 8), there are several quantum advantages with cleaner provable foundations.

<div class="theorem">
<strong>Theorem 10.4 (Bernstein--Vazirani).</strong> Given oracle access to \(f(x) = s \cdot x \bmod 2\) for an unknown \(s \in \{0,1\}^n\), one quantum query determines \(s\). Classically \(n\) queries are required.
</div>

<div class="proof">
<strong>Proof.</strong> Apply \(H^{\otimes n}\) to \(|0^n\rangle\), query the phase oracle \((-1)^{f(x)} = (-1)^{s\cdot x}\), and apply \(H^{\otimes n}\) again. The result is \(|s\rangle\). Measurement in the computational basis returns \(s\).
</div>

The Bernstein--Vazirani algorithm is the simplest example of a quantum learning algorithm with provable speedup. More sophisticated examples include quantum agnostic learning of parity, quantum boosting, and recent results on quantum statistical query learning.

<div class="theorem">
<strong>Theorem 10.5 (Heisenberg-limited learning).</strong> Given access to a Hamiltonian's evolution \(e^{-iHt}\), the parameters of \(H\) can be learned to error \(\varepsilon\) using total evolution time \(O(1/\varepsilon)\), beating the classical statistical bound \(O(1/\varepsilon^2)\). This is the Heisenberg limit, achievable via phase estimation.
</div>

<div class="remark">
<strong>Remark 10.6 (Classical shadows).</strong> A complementary line of work, due to Huang--Kueng--Preskill, gives <em>classical shadow</em> protocols: a quantum state can be measured in randomized bases to produce a classical sketch from which exponentially many observables can be predicted. The result is a learning algorithm with sample complexity logarithmic in the number of target observables.
</div>

# Chapter 11: Selected Further Topics

We close with brief sketches of several additional topics that connect to the main themes of the course.

## 11.1 Adiabatic Quantum Computation

The **adiabatic theorem** says that if a quantum system is prepared in the ground state of \(H(0)\) and the Hamiltonian is varied slowly to \(H(1)\), the system remains close to the instantaneous ground state, provided the spectral gap stays bounded below.

<div class="theorem">
<strong>Theorem 11.1 (Adiabatic theorem).</strong> Let \(H(s)\) be a smooth path of Hamiltonians for \(s \in [0,1]\), with spectral gap \(\Delta(s) \geq \Delta_{\min} > 0\) above the ground state. Evolving for total time \(T = \Omega(1/\Delta_{\min}^3)\) keeps the state within constant fidelity of the ground state of \(H(s)\) at all times.
</div>

Adiabatic quantum computation is **polynomially equivalent** to the circuit model (Aharonov--van Dam--Kempe--Landau--Lloyd--Regev): any BQP computation can be simulated adiabatically with polynomial overhead. This gives an alternative perspective on quantum algorithms — particularly useful for optimization heuristics.

## 11.2 Variational and Near-Term Algorithms

In the noisy intermediate-scale quantum (NISQ) era, **variational quantum algorithms** such as VQE (Variational Quantum Eigensolver) and QAOA (Quantum Approximate Optimization Algorithm) have attracted substantial attention. They prepare a parameterized state \(|\psi(\theta)\rangle\) with a short circuit and classically optimize \(\theta\) to minimize \(\langle \psi(\theta) | H | \psi(\theta)\rangle\). Provable speedups in this framework are scarce; the appeal is hardware-friendliness.

<div class="remark">
<strong>Remark 11.2.</strong> Whether QAOA achieves provable advantage over classical algorithms for any natural combinatorial problem remains open. The most carefully analyzed case (MaxCut on bounded-degree graphs at constant depth) is now known to be matched or beaten by classical algorithms, illustrating the difficulty of designing genuinely faster quantum algorithms in the variational paradigm.
</div>

## 11.3 Quantum Complexity Classes

The class \(\mathrm{BQP}\) of problems decidable by polynomial-size quantum circuits with bounded error sits between \(\mathrm{P}\) and \(\mathrm{PSPACE}\). It is contained in \(\mathrm{PP}\) (Adleman--DeMarrais--Huang) and even in \(\mathrm{AWPP}\). The relationship between \(\mathrm{BQP}\) and the polynomial hierarchy is largely open: we know oracle separations exist (Raz--Tal showed \(\mathrm{BQP} \not\subseteq \mathrm{PH}\) relative to a random oracle), but no unconditional separation.

The class \(\mathrm{QMA}\) (Quantum Merlin--Arthur) is the quantum analogue of \(\mathrm{NP}\): a verifier holds a quantum proof state and accepts/rejects with bounded error. The local Hamiltonian problem — deciding the ground-state energy of a sum of constant-locality terms — is QMA-complete (Kitaev), even for one-dimensional spin systems with constant local dimension (Aharonov--Gottesman--Irani--Kempe).

<div class="theorem">
<strong>Theorem 11.3 (Kitaev).</strong> The 5-local Hamiltonian problem is QMA-complete. Subsequent work has reduced this to 2-local, then to many physically natural restricted Hamiltonians.
</div>

## 11.4 Quantum Error Correction (Brief Note)

While not the central focus of an algorithms course, every practical quantum algorithm presupposes **fault-tolerant** implementation, made possible by quantum error correction. The Shor 9-qubit code, the Steane 7-qubit code, and the broader framework of stabilizer codes (Gottesman) protect logical qubits against local noise. The threshold theorem (Aharonov--Ben-Or, Kitaev, Knill--Laflamme--Zurek) guarantees that arbitrarily long quantum computations can be executed reliably as long as the per-gate error rate falls below a fixed threshold.

<div class="remark">
<strong>Remark 11.4.</strong> A current frontier is <em>magic state distillation</em> and resource-efficient implementations of non-Clifford gates such as \(T\). The asymptotic gate counts for fault-tolerant Shor or HHL are dominated by these overheads, often by orders of magnitude. Theoretical and engineering progress here directly determines when quantum algorithmic speedups become practically realizable.
</div>

## 11.5 Outlook

The subject of quantum algorithms is shaped by a small number of structural insights — the QFT, amplitude amplification, the polynomial and adversary methods, qubitization — that recur across applications. The unifying framework of quantum singular value transformation has organized many of these into a single algorithmic primitive. Yet the central question of when, and over which problems, quantum computers will deliver practical and provable advantage is far from settled. Progress requires both algorithmic creativity (finding new structures to exploit) and deeper complexity-theoretic insight (understanding what is provably hard for classical algorithms). It is a young, beautiful subject, and the road ahead is wide open.
