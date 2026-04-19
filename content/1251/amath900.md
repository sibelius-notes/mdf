---
title: "AMATH 900 / QIC 890: Mathematical Theory of Entanglement"
subjects: "AMATH"
---

## Sources and References

These notes draw primarily from the following publicly accessible sources:

- Horodecki, R., Horodecki, P., Horodecki, M., and Horodecki, K., "Quantum entanglement," *Reviews of Modern Physics* **81**, 865 (2009). arXiv:quant-ph/0702225. This is the primary reference for the course and is explicitly open access.
- Nielsen, M. A. and Chuang, I. L., *Quantum Computation and Quantum Information*, Cambridge University Press, 2000.
- Watrous, J., *The Theory of Quantum Information*, Cambridge University Press, 2018. Free PDF available at cs.uwaterloo.ca/~watrous/TQI/.
- Bengtsson, I. and Życzkowski, K., *Geometry of Quantum States*, 2nd ed., Cambridge University Press, 2017.
- Wilde, M. M., *Quantum Information Theory*, 2nd ed., Cambridge University Press. arXiv:1106.1445.
- Hayashi, M., *Quantum Information Theory*, Springer, 2017.

---

# Chapter 1: Quantum States and Entanglement Basics

## Density Matrices and the Quantum State Space

In quantum information theory, a physical system is associated with a complex Hilbert space \(\mathcal{H}\). When the system may be in a statistical mixture of pure states, the complete description is provided by a **density matrix** (also called a density operator), which is a positive semidefinite, trace-one operator \(\rho \in \mathcal{L}(\mathcal{H})\). Formally, \(\rho\) satisfies

\[
\rho \geq 0, \quad \operatorname{Tr}(\rho) = 1.
\]

The set of all density matrices on \(\mathcal{H}\) is denoted \(\mathcal{D}(\mathcal{H})\) and forms a compact convex set. The extreme points of this convex set are the **pure states**, which are rank-one projectors \(\rho = |\psi\rangle\langle\psi|\) for unit vectors \(|\psi\rangle \in \mathcal{H}\). Mixed states — those that are not pure — can be written as convex combinations of pure states:

\[
\rho = \sum_i p_i |\psi_i\rangle\langle\psi_i|, \quad p_i \geq 0, \quad \sum_i p_i = 1.
\]

Such a decomposition is not unique in general; this non-uniqueness is central to many of the subtleties in entanglement theory. The purity of a state is measured by \(\operatorname{Tr}(\rho^2)\), which equals one if and only if \(\rho\) is pure, and is strictly less than one for mixed states.

## Composite Systems and the Tensor Product

When two quantum systems \(A\) and \(B\) are considered jointly, their combined Hilbert space is the tensor product \(\mathcal{H}_{AB} = \mathcal{H}_A \otimes \mathcal{H}_B\). If \(\{|i\rangle_A\}\) and \(\{|j\rangle_B\}\) are orthonormal bases for \(\mathcal{H}_A\) and \(\mathcal{H}_B\) respectively, then \(\{|i\rangle_A \otimes |j\rangle_B\}\) forms an orthonormal basis for \(\mathcal{H}_{AB}\). An arbitrary state \(|\Psi\rangle \in \mathcal{H}_{AB}\) can therefore be written as

\[
|\Psi\rangle = \sum_{i,j} c_{ij} |i\rangle_A \otimes |j\rangle_B
\]

for some complex coefficient matrix \((c_{ij})\). The **partial trace** over subsystem \(B\) is the operation that maps a joint density matrix \(\rho_{AB}\) to the reduced density matrix of \(A\):

\[
\rho_A = \operatorname{Tr}_B(\rho_{AB}) = \sum_j (\mathbf{I}_A \otimes \langle j|_B) \rho_{AB} (\mathbf{I}_A \otimes |j\rangle_B).
\]

This is the unique linear operation that recovers the correct expectation values: \(\operatorname{Tr}(O_A \rho_A) = \operatorname{Tr}((O_A \otimes \mathbf{I}_B)\rho_{AB})\) for every observable \(O_A\) on \(A\). The partial trace is entirely agnostic to the basis \(\{|j\rangle_B\}\) used; the result is independent of this choice.

## Schmidt Decomposition

The most powerful structural result for pure bipartite states is the Schmidt decomposition, which shows that any such state can be written in a canonical diagonal form.

<div class="theorem">
<strong>Theorem (Schmidt Decomposition).</strong> Let \(|\Psi\rangle \in \mathcal{H}_A \otimes \mathcal{H}_B\) be a unit vector, where \(\dim \mathcal{H}_A = m\) and \(\dim \mathcal{H}_B = n\). Then there exist orthonormal sets \(\{|e_k\rangle_A\}_{k=1}^r \subset \mathcal{H}_A\) and \(\{|f_k\rangle_B\}_{k=1}^r \subset \mathcal{H}_B\), and strictly positive real numbers \(\{\lambda_k\}_{k=1}^r\) with \(\sum_k \lambda_k^2 = 1\), such that

\[
|\Psi\rangle = \sum_{k=1}^r \sqrt{\lambda_k} |e_k\rangle_A \otimes |f_k\rangle_B.
\]

The integer \(r \leq \min(m,n)\) is called the <em>Schmidt rank</em> of \(|\Psi\rangle\), and the \(\lambda_k\) are called the <em>Schmidt coefficients</em>.
</div>

<div class="proof">
<strong>Proof.</strong> Write \(|\Psi\rangle = \sum_{i,j} c_{ij} |i\rangle_A \otimes |j\rangle_B\) for some coefficient matrix \(C = (c_{ij})\). Apply the singular value decomposition to \(C\): there exist unitary matrices \(U\) (of size \(m \times m\)) and \(V\) (of size \(n \times n\)) and a nonnegative diagonal matrix \(D\) such that \(C = U D V^\dagger\). Writing \(D = \operatorname{diag}(\sigma_1, \ldots, \sigma_r, 0, \ldots, 0)\) with \(\sigma_k > 0\), define \(|e_k\rangle_A = \sum_i U_{ik} |i\rangle_A\) and \(|f_k\rangle_B = \sum_j \overline{V_{jk}} |j\rangle_B\). Since \(U\) and \(V\) are unitary, these form orthonormal families. Then

\[
|\Psi\rangle = \sum_{i,j} c_{ij} |i\rangle_A \otimes |j\rangle_B = \sum_{i,j,k} U_{ik} \sigma_k V_{jk}^* |i\rangle_A \otimes |j\rangle_B = \sum_k \sigma_k |e_k\rangle_A \otimes |f_k\rangle_B.
\]

Setting \(\sqrt{\lambda_k} = \sigma_k\) and noting that \(\langle\Psi|\Psi\rangle = \sum_k \sigma_k^2 = 1\) completes the proof.
</div>

The Schmidt decomposition immediately reveals the reduced density matrices: \(\rho_A = \operatorname{Tr}_B(|\Psi\rangle\langle\Psi|) = \sum_k \lambda_k |e_k\rangle\langle e_k|\) and similarly \(\rho_B = \sum_k \lambda_k |f_k\rangle\langle f_k|\). The two reduced states share the same nonzero eigenvalues \(\{\lambda_k\}\), a fact with deep consequences for entropy.

The **Schmidt rank** \(r\) equals the rank of \(\rho_A\) (and of \(\rho_B\)). A state is a product state — that is, of the form \(|\psi\rangle_A \otimes |\phi\rangle_B\) — if and only if its Schmidt rank equals one. Any state with Schmidt rank greater than one is entangled.

## Separable and Entangled States

For mixed bipartite states, the notion of entanglement requires more care. A state \(\rho_{AB} \in \mathcal{D}(\mathcal{H}_A \otimes \mathcal{H}_B)\) is **separable** if it can be written as a convex combination of product states:

\[
\rho_{AB} = \sum_i p_i \, \rho_A^{(i)} \otimes \rho_B^{(i)}, \quad p_i \geq 0, \quad \sum_i p_i = 1.
\]

A state that is not separable is **entangled**. This definition, due to Werner (1989), captures the idea that separable states can be prepared by local operations and classical communication (LOCC) starting from a product state. Determining whether a given mixed state is separable or entangled is in general computationally hard (the separability problem is NP-hard in the dimension), which motivates the search for efficiently computable necessary conditions.

## The PPT Criterion

One of the most important and computationally accessible necessary conditions for separability is the positive partial transpose (PPT) criterion, due independently to Peres and to the Horodecki family.

The **partial transpose** of \(\rho_{AB}\) with respect to system \(B\) is defined, in a product basis \(|ij\rangle = |i\rangle_A \otimes |j\rangle_B\), by

\[
(\rho_{AB}^{T_B})_{im,jn} = (\rho_{AB})_{in,jm}.
\]

Equivalently, if \(\rho_{AB} = \sum_{i,j,m,n} \rho_{ij,mn} |i\rangle\langle j|_A \otimes |m\rangle\langle n|_B\), then \(\rho_{AB}^{T_B} = \sum_{i,j,m,n} \rho_{ij,mn} |i\rangle\langle j|_A \otimes |n\rangle\langle m|_B\).

<div class="theorem">
<strong>Theorem (Peres-Horodecki / PPT Criterion).</strong> If \(\rho_{AB}\) is separable, then \(\rho_{AB}^{T_B} \geq 0\); that is, the partial transpose is positive semidefinite. Conversely, for systems where \(\dim \mathcal{H}_A \otimes \dim \mathcal{H}_B \leq 6\) (i.e., \(2 \times 2\) or \(2 \times 3\) systems), positivity of the partial transpose is also sufficient for separability.
</div>

The proof of necessity is straightforward: if \(\rho_{AB} = \sum_i p_i \rho_A^{(i)} \otimes \rho_B^{(i)}\), then \(\rho_{AB}^{T_B} = \sum_i p_i \rho_A^{(i)} \otimes (\rho_B^{(i)})^T\). Since the transpose of a density matrix is again a density matrix (it is a positive semidefinite operator with unit trace), each summand is a valid (positive semidefinite) operator, and so is their convex combination. The converse for low dimensions follows from the classification of positive maps on low-dimensional matrix algebras, and is due to the Horodeckis.

States that satisfy \(\rho^{T_B} \geq 0\) are called **PPT states**. In dimensions larger than \(2 \times 3\), there exist PPT entangled states — states that pass the PPT test but are nonetheless entangled. These are examples of **bound entangled** states, to be discussed in Chapter 5.

## Entanglement Witnesses

A more general approach to detecting entanglement uses the notion of an **entanglement witness**. Since the set of separable states is a convex and compact set, the Hahn-Banach separation theorem guarantees that for any entangled state \(\rho\), there exists a hyperplane separating \(\rho\) from the separable set. In operator terms:

<div class="definition">
<strong>Definition (Entanglement Witness).</strong> A Hermitian operator \(W\) on \(\mathcal{H}_{AB}\) is an <em>entanglement witness</em> if:
<ol>
  <li>\(\operatorname{Tr}(W \sigma) \geq 0\) for all separable states \(\sigma\).</li>
  <li>There exists an entangled state \(\rho\) with \(\operatorname{Tr}(W \rho) < 0\).</li>
</ol>
</div>

The Horodecki criterion states that \(\rho\) is entangled if and only if there exists an entanglement witness \(W\) such that \(\operatorname{Tr}(W\rho) < 0\). This is equivalent to the statement that \(\rho\) is not in the separable set.

The connection between witnesses and positive maps is fundamental. A linear map \(\Lambda: \mathcal{L}(\mathcal{H}_B) \to \mathcal{L}(\mathcal{H}_A)\) is **positive** if it maps positive semidefinite operators to positive semidefinite operators, but is not necessarily **completely positive** (i.e., \(\mathbf{I} \otimes \Lambda\) may fail to be positive). The Choi-Jamiołkowski isomorphism identifies positive (but not completely positive) maps with entanglement witnesses. In particular, \(\rho_{AB}\) is entangled if and only if there exists a positive map \(\Lambda\) such that \((\mathbf{I}_A \otimes \Lambda)(\rho_{AB}) \not\geq 0\).

---

# Chapter 2: LOCC and Entanglement Transformations

## Local Operations and Classical Communication

The operational framework for entanglement theory is provided by the class of **local operations and classical communication (LOCC)**. In a bipartite scenario, Alice (holding system \(A\)) and Bob (holding system \(B\)) are spatially separated and can each perform any quantum operation on their local system. They are also permitted to communicate classically — sending bits back and forth over an unlimited classical channel. However, they cannot directly exchange quantum systems.

More precisely, a LOCC protocol is implemented as follows. In a round of communication, one party (say Alice) performs a local measurement on her system, obtaining outcome \(m\) with some probability, and communicates \(m\) to Bob. Bob then performs a local operation (which may depend on \(m\)), possibly measures, communicates his outcome back to Alice, and so on. After a finite (or countably infinite) number of rounds, the protocol concludes. The class of operations implementable this way is denoted \(\mathcal{LOCC}\).

Mathematically, a LOCC channel can be written as \(\mathcal{E}(\rho_{AB}) = \sum_{k} (A_k \otimes B_k) \rho_{AB} (A_k^\dagger \otimes B_k^\dagger)\) where the operators \(A_k, B_k\) arise from a sequential adaptive procedure. The class \(\mathcal{LOCC}\) is strictly smaller than the class \(\mathcal{SEP}\) of separable operations (those of the above sum form with arbitrary \(A_k, B_k\)), which is in turn smaller than the class of all operations.

## LOCC Convertibility and Pure State Transformations

For pure states, the question of LOCC convertibility has a definitive answer: Nielsen's theorem, proven in 1999, gives a necessary and sufficient condition for one pure bipartite state to be convertible to another by LOCC.

<div class="definition">
<strong>Definition (Majorization).</strong> Let \(\mathbf{x} = (x_1, \ldots, x_d)\) and \(\mathbf{y} = (y_1, \ldots, y_d)\) be probability vectors. We say \(\mathbf{x}\) is <em>majorized</em> by \(\mathbf{y}\), written \(\mathbf{x} \prec \mathbf{y}\), if:

\[
\sum_{k=1}^m x_k^\downarrow \leq \sum_{k=1}^m y_k^\downarrow \quad \text{for all } m = 1, \ldots, d,
\]

where \(x_1^\downarrow \geq x_2^\downarrow \geq \cdots \geq x_d^\downarrow\) denotes the components of \(\mathbf{x}\) arranged in decreasing order.
</div>

Intuitively, \(\mathbf{x} \prec \mathbf{y}\) means that \(\mathbf{x}\) is "more uniform" than \(\mathbf{y}\). Majorization captures a partial order on probability vectors that governs many information-theoretic inequalities.

<div class="theorem">
<strong>Theorem (Nielsen, 1999).</strong> Let \(|\psi\rangle\) and \(|\phi\rangle\) be pure bipartite states with Schmidt vectors \(\boldsymbol{\lambda} = (\lambda_1, \ldots, \lambda_d)\) and \(\boldsymbol{\mu} = (\mu_1, \ldots, \mu_d)\) respectively (padded with zeros to the same length). Then \(|\psi\rangle\) can be converted to \(|\phi\rangle\) by LOCC if and only if \(\boldsymbol{\lambda} \prec \boldsymbol{\mu}\).
</div>

<div class="proof">
<strong>Proof sketch (necessity).</strong> Under any LOCC operation, the reduced state \(\rho_A\) transforms via a doubly stochastic channel (a mixture of unitaries on \(A\)). By Birkhoff's theorem, doubly stochastic maps are convex combinations of permutation matrices. The Schur-Horn theorem then implies that the eigenvalue vector of \(\rho_A\) after the transformation is majorized by the eigenvalue vector before transformation. More precisely, if Alice applies a local instrument with Kraus operators \(\{A_k\}\), the post-measurement state of \(A\) (conditioned on outcome \(k\)) has eigenvalues that, upon averaging, satisfy a majorization relation. Iterating over all rounds of LOCC shows that the Schmidt vector of the final state must be majorized by that of the initial state.

<strong>Proof sketch (sufficiency).</strong> Given \(\boldsymbol{\lambda} \prec \boldsymbol{\mu}\), one constructs an explicit LOCC protocol. By the theory of doubly stochastic matrices, \(\boldsymbol{\lambda} = D \boldsymbol{\mu}\) for some doubly stochastic matrix \(D\). By Birkhoff's theorem, \(D\) is a convex combination of permutation matrices: \(D = \sum_k p_k P_k\). Alice performs a local measurement described by operators \(\{M_k\}\) such that the post-measurement states have Schmidt vectors \(P_k \boldsymbol{\mu}\). After Alice communicates the outcome to Bob, Bob applies a local unitary to relabel the Schmidt basis. The overall effect is to produce a state with Schmidt vector \(\boldsymbol{\mu}\). Details require careful construction of the measurement operators, but the existence is guaranteed by the majorization condition.
</div>

This theorem reveals the deep connection between entanglement manipulation and the mathematics of majorization. In particular, the maximally entangled state \(|\Phi^+\rangle = \frac{1}{\sqrt{d}} \sum_{k=1}^d |kk\rangle\) (with uniform Schmidt vector \((1/d, \ldots, 1/d)\)) majorizes every pure state on \(\mathcal{H}_A \otimes \mathcal{H}_B\) with \(\dim \mathcal{H}_A = \dim \mathcal{H}_B = d\), confirming that \(|\Phi^+\rangle\) is the most entangled state.

## Entanglement Catalysis

Nielsen's theorem shows that many pairs of states are incomparable under LOCC — neither can be converted to the other. A remarkable phenomenon, discovered by Jonathan and Plenio (1999), is that entanglement **catalysis** can enable otherwise forbidden conversions.

<div class="example">
<strong>Example (Catalytic conversion).</strong> Consider the states

\[
|\psi\rangle = \sqrt{0.4}|00\rangle + \sqrt{0.4}|11\rangle + \sqrt{0.1}|22\rangle + \sqrt{0.1}|33\rangle
\]

and \(|\phi\rangle = \sqrt{0.5}|00\rangle + \sqrt{0.25}|11\rangle + \sqrt{0.25}|22\rangle\). Direct computation shows \(\boldsymbol{\lambda}^\psi = (0.4, 0.4, 0.1, 0.1)\) and \(\boldsymbol{\lambda}^\phi = (0.5, 0.25, 0.25, 0)\). Since the partial sums of \(\boldsymbol{\lambda}^\psi\) and \(\boldsymbol{\lambda}^\phi\) cross, neither majorizes the other, so \(|\psi\rangle \to |\phi\rangle\) is impossible by LOCC alone. However, with a catalyst state \(|\xi\rangle\) with Schmidt vector \((0.6, 0.4)\), the combined state \(|\psi\rangle \otimes |\xi\rangle\) <em>can</em> be converted to \(|\phi\rangle \otimes |\xi\rangle\) by LOCC, after which the catalyst is returned unchanged.
</div>

Catalysis shows that entanglement cannot simply be quantified by a single total-order measure in the single-copy regime; the asymptotic theory (discussed in Chapters 3 and 5) is much cleaner.

## The Schur-Horn Theorem

The Schur-Horn theorem provides the mathematical backbone linking majorization to unitary orbits of Hermitian operators, making Nielsen's theorem precise.

<div class="theorem">
<strong>Theorem (Schur-Horn).</strong> Let \(H\) be a Hermitian matrix with eigenvalues \(\boldsymbol{\lambda} = (\lambda_1, \ldots, \lambda_d)\) and let \(\mathbf{x} = (H_{11}, \ldots, H_{dd})\) be its diagonal entries. Then \(\mathbf{x} \prec \boldsymbol{\lambda}\). Conversely, for any vector \(\mathbf{x}\) with \(\mathbf{x} \prec \boldsymbol{\lambda}\), there exists a unitary \(U\) such that the diagonal of \(UHU^\dagger\) equals \(\mathbf{x}\).
</div>

The Schur direction (that diagonal entries are majorized by eigenvalues) follows from the fact that diagonal entries are averages of eigenvalues weighted by squared moduli of eigenvector components, and these weights form a doubly stochastic matrix. The Horn direction (that any majorized vector arises as a diagonal) requires explicit construction via Gram-Schmidt and rotation arguments.

---

# Chapter 3: Entanglement Measures

## Axioms for Entanglement Measures

An **entanglement measure** is a function \(E: \mathcal{D}(\mathcal{H}_{AB}) \to [0, \infty)\) that quantifies the amount of entanglement in a bipartite state. The field has converged on a set of reasonable axioms that any physically motivated measure should satisfy:

<div class="definition">
<strong>Definition (Axioms for entanglement measures).</strong>
<ol>
  <li><strong>Faithfulness:</strong> \(E(\rho) = 0\) if and only if \(\rho\) is separable.</li>
  <li><strong>LOCC monotonicity:</strong> \(E\) does not increase under LOCC: if \(\rho \mapsto \sigma\) under some LOCC channel, then \(E(\sigma) \leq E(\rho)\).</li>
  <li><strong>Convexity:</strong> \(E\left(\sum_i p_i \rho_i\right) \leq \sum_i p_i E(\rho_i)\) for any ensemble \(\{p_i, \rho_i\}\). (This models the fact that mixing states should not increase entanglement.)</li>
  <li><strong>Asymptotic continuity:</strong> If \(\|\rho_n - \sigma_n\|_1 \to 0\) as \(n \to \infty\), then \(|E(\rho_n) - E(\sigma_n)| / \log \dim \to 0\).</li>
  <li><strong>Normalization:</strong> For a maximally entangled state \(|\Phi_d^+\rangle\) of Schmidt rank \(d\), \(E(|\Phi_d^+\rangle\langle\Phi_d^+|) = \log_2 d\).</li>
</ol>
</div>

Not all measures satisfy all axioms, and the choice of which axioms to impose depends on the operational interpretation. We now survey the most important measures.

## Entanglement of Formation

The **entanglement of formation** \(E_F(\rho)\) is defined via the convex roof construction, extending the entropy of entanglement from pure states to mixed states.

For a pure state \(|\psi\rangle\) with Schmidt coefficients \(\{\lambda_k\}\), the **entropy of entanglement** is

\[
E(|\psi\rangle) = S(\rho_A) = -\sum_k \lambda_k \log_2 \lambda_k,
\]

where \(\rho_A = \operatorname{Tr}_B(|\psi\rangle\langle\psi|)\) is the reduced density matrix. This equals the von Neumann entropy of either reduced state, and ranges from 0 (product states) to \(\log_2 \min(d_A, d_B)\) (maximally entangled states).

For a mixed state \(\rho_{AB}\), the entanglement of formation is the minimum expected entropy of entanglement over all pure-state decompositions:

\[
E_F(\rho_{AB}) = \inf_{\{p_i, |\psi_i\rangle\}} \sum_i p_i E(|\psi_i\rangle),
\]

where the infimum is over all ensembles \(\{p_i, |\psi_i\rangle\}\) such that \(\rho_{AB} = \sum_i p_i |\psi_i\rangle\langle\psi_i|\). The entanglement of formation satisfies LOCC monotonicity and convexity by construction, but proving faithfulness requires non-trivial work.

For two-qubit states, Wootters (1998) derived a beautiful closed-form expression in terms of the **concurrence** \(C(\rho)\):

\[
E_F(\rho) = h\!\left(\frac{1 + \sqrt{1 - C(\rho)^2}}{2}\right),
\]

where \(h(x) = -x\log_2 x - (1-x)\log_2(1-x)\) is the binary entropy and \(C(\rho) = \max(0, \nu_1 - \nu_2 - \nu_3 - \nu_4)\) with \(\nu_1 \geq \nu_2 \geq \nu_3 \geq \nu_4\) being the square roots of the eigenvalues of \(\rho(\sigma_y \otimes \sigma_y)\rho^*(\sigma_y \otimes \sigma_y)\).

## Entanglement of Distillation and Dilution

The **distillable entanglement** \(E_D(\rho)\) is the asymptotic rate at which maximally entangled ebits \(|\Phi^+\rangle\) can be extracted from many copies of \(\rho\) by LOCC:

\[
E_D(\rho) = \sup \left\{ R : \lim_{n\to\infty} \min_{\Lambda \in \mathcal{LOCC}} \left\| \Lambda(\rho^{\otimes n}) - |\Phi^+\rangle\langle\Phi^+|^{\otimes \lfloor Rn\rfloor} \right\|_1 = 0 \right\}.
\]

The **entanglement cost** (or dilution rate) \(E_C(\rho)\) is the asymptotic rate of ebits consumed to create \(\rho\) by LOCC:

\[
E_C(\rho) = \inf \left\{ R : \lim_{n\to\infty} \min_{\Lambda \in \mathcal{LOCC}} \left\| \Lambda\!\left(|\Phi^+\rangle\langle\Phi^+|^{\otimes \lceil Rn\rceil}\right) - \rho^{\otimes n} \right\|_1 = 0 \right\}.
\]

For pure states, both quantities equal the entropy of entanglement: \(E_D(|\psi\rangle) = E_C(|\psi\rangle) = S(\rho_A)\). For mixed states, one generally has \(E_D(\rho) \leq E_C(\rho)\), with equality possible only under special conditions. A state with \(E_D(\rho) = 0\) but \(E_C(\rho) > 0\) is called **bound entangled**.

## Relative Entropy of Entanglement

The **relative entropy of entanglement** is defined as the minimum quantum relative entropy from \(\rho\) to the separable set:

\[
E_R(\rho) = \min_{\sigma \in \mathcal{SEP}} S(\rho \| \sigma) = \min_{\sigma \in \mathcal{SEP}} \operatorname{Tr}\!\left[\rho(\log\rho - \log\sigma)\right].
\]

This measure has a natural operational interpretation as a bound on distillable entanglement, and satisfies most of the desired axioms. It is known that \(E_D(\rho) \leq E_R(\rho) \leq E_F(\rho)\) for all mixed states \(\rho\).

## Squashed Entanglement

The **squashed entanglement** is defined via the quantum conditional mutual information:

\[
E_{sq}(\rho_{AB}) = \frac{1}{2} \inf_{\rho_{ABE}} I(A;B|E)_\rho,
\]

where the infimum is over all extensions \(\rho_{ABE}\) of \(\rho_{AB}\) (meaning \(\operatorname{Tr}_E \rho_{ABE} = \rho_{AB}\)), and \(I(A;B|E) = S(AE) + S(BE) - S(ABE) - S(E)\) is the quantum conditional mutual information. The squashed entanglement is the unique measure known to satisfy all five axioms simultaneously; in particular, it satisfies a superadditivity property that most other measures lack. It is also conjectured (but not proven) to equal the regularized entanglement of formation in general.

## Logarithmic Negativity

The **logarithmic negativity** is defined in terms of the partial transpose:

\[
E_\mathcal{N}(\rho) = \log_2 \|\rho^{T_B}\|_1,
\]

where \(\|\cdot\|_1\) is the trace norm (sum of singular values). Since \(\|\rho^{T_B}\|_1 = 1 + 2 |\sum_i \nu_i|\) where \(\{\nu_i\}\) are the negative eigenvalues of \(\rho^{T_B}\), the logarithmic negativity vanishes for PPT states and is strictly positive for states with a negative partial transpose (NPT states). The logarithmic negativity is not convex, but it is an upper bound on distillable entanglement and is computable in polynomial time, making it practically useful.

---

# Chapter 4: Quantum Entropy and Information Theory

## Von Neumann Entropy

The central entropic quantity in quantum information theory is the **von Neumann entropy**, defined for a density matrix \(\rho\) by

\[
S(\rho) = -\operatorname{Tr}(\rho \log_2 \rho) = -\sum_k \lambda_k \log_2 \lambda_k,
\]

where \(\{\lambda_k\}\) are the eigenvalues of \(\rho\). This is the quantum analog of the Shannon entropy and reduces to it when \(\rho\) is diagonal. The von Neumann entropy satisfies several fundamental properties:

**Non-negativity:** \(S(\rho) \geq 0\), with equality if and only if \(\rho\) is pure.

**Maximum entropy:** For a \(d\)-dimensional system, \(S(\rho) \leq \log_2 d\), with equality when \(\rho = \mathbf{I}/d\) is the maximally mixed state.

**Unitary invariance:** \(S(U\rho U^\dagger) = S(\rho)\) for any unitary \(U\).

**Concavity:** \(S\!\left(\sum_i p_i \rho_i\right) \geq \sum_i p_i S(\rho_i)\).

## Subadditivity and the Araki-Lieb Inequality

<div class="theorem">
<strong>Theorem (Subadditivity).</strong> For a bipartite state \(\rho_{AB}\),

\[
S(AB) \leq S(A) + S(B),
\]

with equality if and only if \(\rho_{AB} = \rho_A \otimes \rho_B\).
</div>

Subadditivity follows from the non-negativity of the quantum relative entropy \(S(\rho_{AB} \| \rho_A \otimes \rho_B) \geq 0\). The **Araki-Lieb inequality** provides the complementary lower bound:

\[
|S(A) - S(B)| \leq S(AB) \leq S(A) + S(B).
\]

The lower bound \(S(AB) \geq |S(A) - S(B)|\) follows by considering a purification \(|\psi\rangle_{ABC}\) of \(\rho_{AB}\) and applying the fact that purifications have equal reduced entropy: \(S(AB) = S(C)\), \(S(A) = S(BC)\), and then applying subadditivity to the \(BC\) system.

## Strong Subadditivity

The cornerstone inequality of quantum information theory is the strong subadditivity of von Neumann entropy, proven by Lieb and Ruskai in 1973.

<div class="theorem">
<strong>Theorem (Strong Subadditivity, Lieb-Ruskai 1973).</strong> For a tripartite quantum system \(ABC\),

\[
S(ABC) + S(B) \leq S(AB) + S(BC).
\]

Equivalently, the quantum conditional mutual information \(I(A;C|B) = S(AB) + S(BC) - S(ABC) - S(B) \geq 0\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> The original proof by Lieb and Ruskai proceeds via the Lieb concavity theorem: for any matrix function of the form \(f(A,B) = \operatorname{Tr}(K^\dagger A^s K B^{1-s})\) with \(0 \leq s \leq 1\), this function is jointly concave in \((A, B)\). From this, one derives the Lieb-Ruskai inequality by a variational argument. A more modern proof uses the data processing inequality: the quantum relative entropy is non-increasing under quantum channels, i.e., \(S(\mathcal{E}(\rho) \| \mathcal{E}(\sigma)) \leq S(\rho \| \sigma)\). Choosing \(\rho = \rho_{ABC}\), \(\sigma = \rho_{AB} \otimes \mathbb{I}_C / \dim\mathcal{H}_C\), and \(\mathcal{E} = \operatorname{Tr}_A\), one obtains the strong subadditivity inequality after algebraic manipulation.
</div>

Strong subadditivity has profound consequences: it is equivalent to the concavity of conditional entropy, implies the data processing inequality for quantum mutual information, and underpins most of quantum Shannon theory.

## Quantum Relative Entropy and Klein's Inequality

The **quantum relative entropy** between two density matrices \(\rho\) and \(\sigma\) is defined as

\[
S(\rho \| \sigma) = \operatorname{Tr}\!\left[\rho(\log\rho - \log\sigma)\right]
\]

when the support of \(\rho\) is contained in the support of \(\sigma\), and \(+\infty\) otherwise.

<div class="theorem">
<strong>Klein's Inequality.</strong> For any two density matrices \(\rho\) and \(\sigma\),

\[
S(\rho \| \sigma) \geq 0,
\]

with equality if and only if \(\rho = \sigma\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(\{|\phi_i\rangle\}\) be an eigenbasis of \(\sigma\) with eigenvalues \(\{s_i\}\), and write \(\rho_i = \langle\phi_i|\rho|\phi_i\rangle\). Klein's inequality for the convex function \(f(x) = x\log x\) gives \(\operatorname{Tr}(f(\rho)) \geq \operatorname{Tr}(f(\sigma)) + \operatorname{Tr}[f'(\sigma)(\rho - \sigma)]\), from which \(S(\rho\|\sigma) \geq 0\) follows. More directly, using the operator Jensen inequality for the convex function \(x \mapsto x\log x\) applied to the matrix \(\rho - \sigma\), one finds that \(\sum_i \rho_i \log \rho_i - \sum_i \rho_i \log s_i \geq 0\). Since \(\sum_i s_i = 1\) and \(\sum_i \rho_i = 1\), the left side equals \(S(\rho\|\sigma)\), completing the proof.
</div>

## Quantum Mutual Information and Conditional Entropy

For a bipartite state \(\rho_{AB}\), the **quantum mutual information** is

\[
I(A;B)_\rho = S(A) + S(B) - S(AB) = S(\rho_{AB} \| \rho_A \otimes \rho_B),
\]

and the **quantum conditional entropy** is

\[
S(A|B) = S(AB) - S(B).
\]

Unlike its classical counterpart, the quantum conditional entropy can be negative. This occurs precisely when \(\rho_{AB}\) is entangled in a sufficiently strong sense. For example, for a maximally entangled state \(|\Phi_d^+\rangle\), the joint entropy \(S(AB) = 0\) (pure state) while \(S(B) = \log_2 d\), giving \(S(A|B) = -\log_2 d\). Negative conditional entropy is a signature of quantum correlations beyond anything classically achievable.

## Rényi Entropies

The family of **Rényi entropies** generalizes the von Neumann entropy via a parameter \(\alpha \geq 0\):

\[
S_\alpha(\rho) = \frac{1}{1-\alpha} \log_2 \operatorname{Tr}(\rho^\alpha).
\]

In the limit \(\alpha \to 1\), L'Hôpital's rule recovers the von Neumann entropy: \(\lim_{\alpha \to 1} S_\alpha(\rho) = S(\rho)\). Other special cases include the min-entropy \(S_\infty(\rho) = \lim_{\alpha \to \infty} S_\alpha(\rho) = -\log_2 \|\rho\|\) (where \(\|\rho\|\) is the operator norm) and the collision entropy \(S_2(\rho) = -\log_2 \operatorname{Tr}(\rho^2)\). Rényi entropies play a central role in one-shot information theory, where one considers single instances rather than asymptotic rates.

## Quantum Asymptotic Equipartition Property

The quantum analog of Shannon's AEP states that the probability that a quantum system is in a typical subspace approaches one in the asymptotic limit.

<div class="theorem">
<strong>Theorem (Quantum AEP).</strong> Let \(\rho\) be a density matrix with spectral decomposition \(\rho = \sum_k \lambda_k |k\rangle\langle k|\). For any \(\epsilon > 0\), define the <em>typical projector</em> \(\Pi_\epsilon^n\) onto the subspace spanned by the eigenvectors \(|k_1 \cdots k_n\rangle\) of \(\rho^{\otimes n}\) such that the empirical frequency vector of the types \((k_1, \ldots, k_n)\) satisfies \(\left|-\frac{1}{n}\log p_{k_1\cdots k_n} - S(\rho)\right| \leq \epsilon\). Then:
<ol>
  <li>\(\operatorname{Tr}(\Pi_\epsilon^n \rho^{\otimes n}) \to 1\) as \(n \to \infty\).</li>
  <li>\(\operatorname{Tr}(\Pi_\epsilon^n) \leq 2^{n(S(\rho)+\epsilon)}\).</li>
  <li>For sufficiently large \(n\), \(\operatorname{Tr}(\Pi_\epsilon^n) \geq (1-\epsilon) 2^{n(S(\rho)-\epsilon)}\).</li>
</ol>
</div>

This theorem underpins the achievability proofs in quantum Shannon theory, including the hashing inequality for entanglement distillation (Chapter 5) and the quantum channel coding theorem.

---

# Chapter 5: Entanglement Distillation and Dilution

## The Asymptotic Framework

The central question of entanglement distillation is: given many copies \(\rho^{\otimes n}\) of a bipartite state \(\rho_{AB}\), how many maximally entangled pairs (ebits) can Alice and Bob extract using LOCC? The answer, in the asymptotic limit \(n \to \infty\), defines the **distillable entanglement** \(E_D(\rho)\).

The complementary question is entanglement dilution: starting from \(m\) ebits, how many copies of \(\rho\) can Alice and Bob prepare using LOCC? The optimal rate defines the **entanglement cost** \(E_C(\rho)\). These two quantities bound the reversibility of entanglement manipulation.

## Pure State Distillation: The Shannon Limit

For pure states, both rates coincide and equal the entropy of entanglement.

<div class="theorem">
<strong>Theorem.</strong> For a pure bipartite state \(|\psi\rangle_{AB}\) with reduced state \(\rho_A = \operatorname{Tr}_B(|\psi\rangle\langle\psi|)\),

\[
E_D(|\psi\rangle) = E_C(|\psi\rangle) = S(\rho_A).
\]
</div>

The achievability of distillation at rate \(S(\rho_A)\) follows from the quantum AEP. Given \(n\) copies of \(|\psi\rangle\), the joint state \(|\psi\rangle^{\otimes n}\) lives in \(\mathcal{H}_A^{\otimes n} \otimes \mathcal{H}_B^{\otimes n}\). The Schmidt decomposition of \(|\psi\rangle^{\otimes n}\) has exponentially many terms, but the quantum AEP ensures that with high probability, the state is well-approximated by its projection onto the typical subspace, which has dimension approximately \(2^{n S(\rho_A)}\). Within this subspace, the state is approximately proportional to the maximally entangled state, and standard teleportation and superdense coding allow conversion to \(\approx n S(\rho_A)\) ebits.

The converse — that one cannot distill at a rate higher than \(S(\rho_A)\) — follows from the LOCC monotonicity of the entropy of entanglement and the data processing inequality.

## The Hashing Inequality

For mixed states, the **hashing inequality** (Devetak and Winter, 2005) gives a lower bound on distillable entanglement in terms of the coherent information:

\[
E_D(\rho_{AB}) \geq I_c(A\rangle B) = S(B) - S(AB),
\]

where \(I_c(A\rangle B)\) is the coherent information of the state. The proof uses a random coding argument: Alice and Bob share \(n\) copies of \(\rho_{AB}\), and Alice applies a random unitary drawn from an approximate unitary 2-design to her system. The resulting state, when traced over Alice's system, is close to the maximally mixed state on Bob's system (the decoupling principle). By choosing the random unitary appropriately and performing quantum error correction, one can extract \(n I_c(A\rangle B)\) ebits.

The hashing inequality is tight for states satisfying certain symmetry conditions, but in general \(E_D(\rho)\) may be strictly greater than \(\max(I_c(A\rangle B), 0)\). Two-way distillation protocols (using back-and-forth classical communication) can sometimes exceed the one-way rate.

## Recurrence Protocols

For Werner states (states invariant under \(U \otimes U\) for all unitaries \(U\)), the hashing inequality gives a positive rate when the fidelity with a maximally entangled state exceeds a threshold. The **recurrence protocol** (Bennett et al., 1996) provides a practical distillation algorithm: take two copies of a noisy Bell state, apply a controlled-NOT operation, measure one qubit, and keep the remaining qubit if the measurement outcome is favorable. This purification step is iterated until the desired fidelity is achieved. The recurrence protocol is efficient but suboptimal; it was the first distillation protocol to be discovered and demonstrated that mixed entanglement can be purified to pure entanglement.

## Bound Entanglement

The most surprising phenomenon in entanglement theory is the existence of **bound entangled** states: entangled states from which no pure entanglement can be distilled, even asymptotically, yet which require entanglement to create.

<div class="definition">
<strong>Definition (Bound Entanglement).</strong> A state \(\rho_{AB}\) is <em>bound entangled</em> if it is entangled (\(E_C(\rho) > 0\)) but has zero distillable entanglement (\(E_D(\rho) = 0\)).
</div>

The first examples of bound entangled states were constructed by the Horodecki family using unextendible product bases (UPBs). A UPB is a set of orthogonal product states \(\{|\phi_i\rangle_A \otimes |\chi_i\rangle_B\}\) that cannot be extended by any additional product state orthogonal to all of them. The state \(\rho = (\mathbf{I} - P_{UPB}) / (d^2 - |UPB|)\), where \(P_{UPB}\) is the projector onto the UPB subspace, is entangled (by a counting argument) but PPT, hence not distillable.

A celebrated example of a PPT bound entangled state is the **Horodecki \(8 \times 8\) state** (sometimes called the chessboard state). Consider the two-qutrit system (\(\dim \mathcal{H}_A = \dim \mathcal{H}_B = 3\)). Horodecki (1997) constructed the one-parameter family of states

\[
\rho_a = \frac{1}{7a+1}\begin{pmatrix} a & 0 & 0 & 0 & a & 0 & 0 & 0 & a \\ 0 & a & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\ 0 & 0 & a & 0 & 0 & 0 & 0 & 0 & 0 \\ 0 & 0 & 0 & a & 0 & 0 & 0 & 0 & 0 \\ a & 0 & 0 & 0 & \frac{1+a}{2} & 0 & 0 & 0 & \frac{\sqrt{1-a^2}}{2} \\ 0 & 0 & 0 & 0 & 0 & a & 0 & 0 & 0 \\ 0 & 0 & 0 & 0 & 0 & 0 & \frac{1+a}{2} & 0 & \frac{\sqrt{1-a^2}}{2} \\ 0 & 0 & 0 & 0 & 0 & 0 & 0 & a & 0 \\ a & 0 & 0 & 0 & \frac{\sqrt{1-a^2}}{2} & 0 & \frac{\sqrt{1-a^2}}{2} & 0 & 1 \end{pmatrix}
\]

for \(a \in (0,1)\), which is entangled for \(a \in (0,1)\) and PPT (hence bound entangled) for \(a \in (0,1)\). One verifies positivity of \(\rho_a\) and its partial transpose directly; entanglement is detected by computing the map \((\mathbf{I} \otimes \Lambda_R)(\rho_a)\) for the reduction map \(\Lambda_R(\sigma) = \mathbf{I} \operatorname{Tr}(\sigma) - \sigma\), which gives a non-positive operator for \(a \in (0,1)\).

More generally, all PPT states (in any dimension) are non-distillable. The **NPT bound entanglement conjecture** posits that all NPT states are distillable, meaning that only PPT states can be bound entangled. This conjecture remains open as of today and is considered one of the major unsolved problems in quantum information theory.

---

# Chapter 6: PPT and Separability Criteria

## Systematic Separability Criteria

Determining whether a given mixed state is separable is a hard computational problem in general. A rich toolbox of necessary conditions for separability has been developed, each exploiting different aspects of the separable set's structure.

## The Reduction Criterion

The **reduction criterion** states that if \(\rho_{AB}\) is separable, then

\[
\rho_A \otimes \mathbf{I}_B - \rho_{AB} \geq 0 \quad \text{and} \quad \mathbf{I}_A \otimes \rho_B - \rho_{AB} \geq 0.
\]

This follows because separable states satisfy \((\mathbf{I} \otimes \Lambda_R)(\rho_{AB}) \geq 0\) for the reduction map \(\Lambda_R(\sigma) = \mathbf{I}\operatorname{Tr}(\sigma) - \sigma\). The reduction criterion is implied by the PPT criterion for \(2\times 2\) and \(2\times 3\) systems, but is strictly stronger than PPT in some higher-dimensional cases.

## The Realignment / Cross-Norm Criterion

The **realignment criterion** (also called the computable cross-norm (CCNR) criterion) provides an efficiently computable necessary condition not implied by the PPT criterion. Given a bipartite state \(\rho_{AB} = \sum_{i,j,k,l} \rho_{ij,kl} |i\rangle\langle k|_A \otimes |j\rangle\langle l|_B\), define the realigned matrix \(R(\rho)\) by

\[
R(\rho)_{(ij),(kl)} = \rho_{ik,jl}.
\]

<div class="theorem">
<strong>Theorem (Realignment Criterion).</strong> If \(\rho_{AB}\) is separable, then \(\|R(\rho)\|_1 \leq 1\).
</div>

There exist entangled states that are PPT (hence not detected by the PPT criterion) but are detected by the realignment criterion, and vice versa. Thus the two criteria are incomparable, and their union detects a strictly larger class of entangled states than either alone.

## Unextendible Product Bases and Bound Entanglement

A powerful method for constructing PPT bound entangled states uses **unextendible product bases (UPBs)**. A UPB in \(\mathcal{H}_A \otimes \mathcal{H}_B\) is an orthonormal set of product states \(S = \{|\phi_i\rangle_A \otimes |\chi_i\rangle_B\}_{i=1}^r\) such that there is no product state orthogonal to all elements of \(S\). Such bases exist in systems of dimension \(\geq 2 \times 4\) or \(\geq 3 \times 3\).

<div class="example">
<strong>Example (Shifts UPB in \(3\times 3\)).</strong> In the three-qutrit system with computational basis \(\{|0\rangle, |1\rangle, |2\rangle\}\), the five states

\[
|S_0\rangle = |0\rangle \otimes |0-1\rangle, \quad |S_1\rangle = |0-1\rangle \otimes |2\rangle, \quad |S_2\rangle = |2\rangle \otimes |1-2\rangle,
\]
\[
|S_3\rangle = |1-2\rangle \otimes |0\rangle, \quad |S_4\rangle = |0+1+2\rangle \otimes |0+1+2\rangle / 3
\]

(using shorthand notation for unnormalized vectors) form a UPB.
</div>

Given a UPB \(S\), the state

\[
\rho_S = \frac{1}{d_A d_B - |S|} \left(\mathbf{I} - \sum_{|\phi\rangle \in S} |\phi\rangle\langle\phi|\right)
\]

is the normalized projector onto the orthogonal complement of the UPB subspace. This state is:
- **PPT:** Because the subspace spanned by the UPB is also spanned by its partial transpose, the complement is invariant under partial transpose.
- **Entangled:** Any separable state has support containing a product vector, but \(\rho_S\) has no product vectors in its support by definition of UPB.

## Entanglement Witnesses from Positive Maps

The detection of PPT bound entanglement requires maps beyond the transpose. A positive (but not completely positive) map \(\Lambda\) can detect entanglement not visible to the PPT test. Key examples include:

- The **reduction map**: \(\Lambda_R(\sigma) = \operatorname{Tr}(\sigma)\mathbf{I} - \sigma\), which detects entanglement violating the reduction criterion.
- The **Breuer-Hall map**: \(\Lambda_{BH}(\sigma) = \operatorname{Tr}(\sigma)\mathbf{I} - \sigma - U\sigma^T U^\dagger\) for a specific antiunitary \(U\), which detects entanglement in higher-dimensional systems.
- The **range criterion**: If \(\rho_{AB}\) is separable, then there exists a product basis for its range; entanglement is detected when no such product basis exists.

These criteria, combined with numerical optimization methods such as semidefinite programming (SDP), provide a practical toolkit for entanglement detection in concrete examples.

---

# Chapter 7: Quantum Channel Capacities and Privacy

## Quantum Channel Capacity

A **quantum channel** is a completely positive, trace-preserving (CPTP) map \(\mathcal{N}: \mathcal{L}(\mathcal{H}_A) \to \mathcal{L}(\mathcal{H}_B)\). The **quantum capacity** \(Q(\mathcal{N})\) of a channel is the maximum rate at which quantum information can be reliably transmitted using many independent uses of \(\mathcal{N}\). Formally,

\[
Q(\mathcal{N}) = \lim_{n\to\infty} \frac{1}{n} Q^{(1)}(\mathcal{N}^{\otimes n}),
\]

where \(Q^{(1)}(\mathcal{N}) = \max_{\rho} I_c(A\rangle B)_{\mathcal{N}(\rho)}\) is the single-letter coherent information, and the limit is needed because coherent information is not additive in general.

The **coherent information** of a state \(\rho_A\) through a channel \(\mathcal{N}\) is

\[
I_c(A\rangle B) = S(\mathcal{N}(\rho_A)) - S(E),
\]

where \(S(E)\) is the entropy of the environment in any Stinespring dilation \(U_\mathcal{N}: \mathcal{H}_A \otimes |0\rangle_E \to \mathcal{H}_B \otimes \mathcal{H}_{E'}\) of the channel. The **quantum channel coding theorem** (Lloyd, Shor, Devetak) states that \(Q(\mathcal{N}) = \lim_{n\to\infty} \frac{1}{n}\max_\rho I_c(A\rangle B)_{\mathcal{N}^{\otimes n}}\). The achievability proof uses random coding over the Hilbert space and the decoupling principle; the converse uses the quantum data processing inequality.

## The Hashing Inequality for Channels

The quantum capacity satisfies the **hashing bound**:

\[
Q(\mathcal{N}) \geq \max_\rho I_c(A\rangle B)_\rho.
\]

For degradable channels (where the complementary channel can be obtained as a further degradation of the original), coherent information is additive and the single-letter formula gives the exact quantum capacity. For anti-degradable channels (where the original channel is a degradation of the complementary), coherent information is non-positive and \(Q = 0\).

## Private Classical Capacity

The **private classical capacity** \(P(\mathcal{N})\) is the maximum rate at which classical information can be transmitted securely (i.e., with negligible information leakage to any eavesdropper) through a quantum channel \(\mathcal{N}\). The private capacity satisfies

\[
P(\mathcal{N}) \geq Q(\mathcal{N}),
\]

since any quantum communication protocol is also private. The **private capacity theorem** (Devetak, 2005) gives the single-letter lower bound \(P(\mathcal{N}) \geq \max_{\{p_i,\rho_i\}} [I(X;B) - I(X;E)]\), where \(X\) is a classical random variable, \(B\) is Bob's system, and \(E\) is the eavesdropper's system.

## Secret Key Distillation and Distillable Key

In the entanglement-based framework of cryptography, the goal is to distill a **secret key** from a shared bipartite state \(\rho_{AB}\), possibly with an eavesdropper holding a purification \(\rho_{ABE}\). The **distillable key rate** \(K_D(\rho_{AB})_E\) is the maximum rate of secret key bits extractable from \(\rho_{AB}^{\otimes n}\) by LOCC in the presence of the adversary \(E\).

A fundamental result is that

\[
E_D(\rho_{AB}) \leq K_D(\rho_{AB}) \leq E_F(\rho_{AB}),
\]

where the first inequality holds because ebits are a special case of secret key (a maximally entangled state is also a perfectly private state), and the second holds by the entanglement cost bound. The gap between \(E_D\) and \(K_D\) is related to the existence of **private states**: states that are not necessarily maximally entangled but encode a perfect secret key. The **twisted states** (Horodecki et al., 2005) are examples of states that have \(K_D > E_D\), demonstrating that private entanglement is more general than distillable entanglement.

## Data Hiding

**Quantum data hiding** refers to the phenomenon that information can be encoded in a bipartite quantum state in a way that is inaccessible to LOCC operations but accessible to global measurements. Terhal, DiVincenzo, and Leung (2001) demonstrated that there exist states \(\rho_0, \rho_1\) such that any LOCC measurement has negligible probability of distinguishing \(\rho_0\) from \(\rho_1\), yet they are nearly orthogonal and easily distinguished by a global measurement. Data hiding states can be constructed from the antisymmetric Werner state in high dimensions.

The data hiding capacity scales as \(\Theta(\log d)\) for bipartite systems of local dimension \(d\), meaning that an exponentially large amount of classical information can be hidden from LOCC observers in a system of dimension \(d\). Data hiding has implications for the relationship between separable operations and LOCC, and demonstrates that the latter is strictly weaker than the former.

## Additivity and Non-Additivity

The question of whether certain information-theoretic quantities are additive under tensor products is central to quantum Shannon theory. The **minimum output entropy** of a channel \(\mathcal{N}\) is

\[
S_{\min}(\mathcal{N}) = \min_\rho S(\mathcal{N}(\rho)).
\]

The **additivity conjecture** stated that \(S_{\min}(\mathcal{N}_1 \otimes \mathcal{N}_2) = S_{\min}(\mathcal{N}_1) + S_{\min}(\mathcal{N}_2)\), i.e., that entangled inputs do not help in minimizing the output entropy. This conjecture was proven for many specific channels but was ultimately disproven in general by Hastings (2009), who showed that there exist channels for which entangled inputs outperform product inputs. The Hastings counterexample is non-constructive and relies on a probabilistic argument involving random unitary channels; explicit counterexamples in small dimensions remain an active area of research.

---

# Chapter 8: Multipartite Entanglement

## Beyond Bipartite: Structure of Multipartite Entanglement

When more than two parties share a quantum state, the structure of entanglement becomes dramatically richer. A pure state \(|\psi\rangle \in \mathcal{H}_1 \otimes \cdots \otimes \mathcal{H}_n\) is **fully separable** if it is a product state \(|\psi_1\rangle \otimes \cdots \otimes |\psi_n\rangle\); it is **fully entangled** (or genuinely multipartite entangled, GME) if it cannot be written as a product across any bipartition. Between these extremes lie states that are entangled across some but not all bipartitions, giving rise to a rich hierarchy of **entanglement classes**.

## GHZ and W States

The two paradigmatic three-qubit genuinely entangled states are the **GHZ state** and the **W state**:

\[
|GHZ\rangle = \frac{1}{\sqrt{2}}(|000\rangle + |111\rangle), \quad |W\rangle = \frac{1}{\sqrt{3}}(|100\rangle + |010\rangle + |001\rangle).
\]

These states are inequivalent under LOCC — neither can be converted to the other, even probabilistically — and they represent qualitatively different types of three-qubit entanglement. The GHZ state is maximally entangled across every bipartition, while the W state has a more robust, distributed entanglement: tracing out any one qubit from \(|W\rangle\) yields a mixed state with some residual entanglement in the remaining two-qubit pair, whereas tracing out any qubit from \(|GHZ\rangle\) yields a completely separable (mixed) state.

## SLOCC Equivalence Classes

Two multipartite pure states are **SLOCC equivalent** (stochastic LOCC equivalent) if they can be inter-converted with nonzero probability using LOCC. For three qubits, Dür, Vidal, and Cirac (2000) proved that there are exactly six SLOCC equivalence classes:
1. Fully separable: \(|abc\rangle\)
2. Biseparable across \(A|BC\): \(|a\rangle|bc\rangle\) (and permutations)
3. Three biseparable states (one per bipartition)
4. W class: containing \(|W\rangle\)
5. GHZ class: containing \(|GHZ\rangle\)

This classification is achieved via the **three-tangle** \(\tau_{ABC}\), which is a genuine tripartite entanglement monotone:

\[
\tau_{ABC} = C_{A|BC}^2 - C_{AB}^2 - C_{AC}^2,
\]

where \(C_{A|BC}\) is the concurrence of the bipartition \(A|BC\) and \(C_{AB}, C_{AC}\) are the pairwise concurrences. States in the GHZ class have \(\tau_{ABC} > 0\), while W-class states (and biseparable/product states) have \(\tau_{ABC} = 0\).

## Monogamy of Entanglement

One of the most fundamental properties distinguishing quantum from classical correlations is **monogamy of entanglement**: a quantum system can be strongly entangled with at most a limited number of other systems. This stands in sharp contrast to classical correlations, which can be freely shared.

<div class="theorem">
<strong>Theorem (Coffman-Kundu-Wootters inequality, 2000).</strong> For any three-qubit pure state \(|\psi\rangle_{ABC}\),

\[
C_{A|BC}^2 \geq C_{AB}^2 + C_{AC}^2,
\]

where \(C_{A|BC}\) is the concurrence of the \(A|BC\) bipartition and \(C_{AB}\), \(C_{AC}\) are the concurrences of the reduced two-qubit states \(\rho_{AB}\) and \(\rho_{AC}\).
</div>

The proof uses the relation between concurrence and the three-tangle: since \(\tau_{ABC} = C_{A|BC}^2 - C_{AB}^2 - C_{AC}^2 \geq 0\), the inequality follows once we establish non-negativity of the three-tangle, which requires a careful analysis of the algebraic structure of the three-qubit Hilbert space.

More generally, the squashed entanglement satisfies a strong monogamy inequality. For any state \(\rho_{A_1 A_2 \cdots A_n B}\),

\[
E_{sq}(A_1 A_2 \cdots A_n : B) \geq \sum_{k=1}^n E_{sq}(A_k : B),
\]

which is analogous to the classical result that mutual information is superadditive in the number of senders. This monogamy property of squashed entanglement has direct operational significance: it bounds the amount of entanglement that any single party can share with multiple others.

## Tangle and Its Generalizations

The **tangle** \(\tau(\rho_{AB}) = C(\rho_{AB})^2\) is the square of the concurrence and serves as the basic bipartite entanglement measure in the CKW inequality. For multiqubit systems, one defines the **residual tangle** (three-tangle) \(\tau_{ABC}\) as above, and more generally \(n\)-tangles for \(n\)-qubit systems using the theory of invariants under local SL(2) operations.

For larger systems, the framework of **entanglement polytopes** (Walter et al., 2013) provides a comprehensive classification of multipartite entanglement using the moment polytope of the local unitary group action. The moment map sends a state \(|\psi\rangle\) to the tuple of eigenvalue vectors of its single-party reduced density matrices, and the image defines the entanglement polytope. Different SLOCC classes correspond to faces of this polytope, and membership in a given class can be decided by testing which faces of the polytope contain the moment map image of the state.

## Area Laws for Entanglement Entropy

In many-body quantum physics, the scaling of entanglement entropy with system size reveals the structure of quantum correlations in ground states of local Hamiltonians.

<div class="definition">
<strong>Definition (Area Law).</strong> A pure state \(|\psi\rangle\) of an \(n\)-qubit system satisfies an <em>area law</em> for entanglement entropy if for every region \(A\) of the lattice,

\[
S(A) \leq c \cdot |\partial A|,
\]

where \(|\partial A|\) is the size of the boundary between \(A\) and its complement, and \(c\) is a constant independent of the system size.
</div>

The area law contrasts with **volume law** scaling \(S(A) \sim |A|\), which is typical for random states (as we discuss below). Ground states of gapped local Hamiltonians in one dimension are known to satisfy an area law (Hastings, 2007), a result that justifies the efficiency of matrix product state (MPS) representations. In higher dimensions, the area law is conjectured to hold for gapped systems but has only been rigorously proven in special cases.

The area law is intimately connected to the entanglement structure of tensor network states. An MPS with bond dimension \(\chi\) satisfies an area law with \(S(A) \leq \log_2 \chi\), and conversely, any one-dimensional state satisfying an area law with constant \(c\) can be approximated efficiently by an MPS with polynomial bond dimension.

## Generic Entanglement in Random States

Random pure states — drawn from the Haar measure on the unit sphere of \(\mathcal{H}_A \otimes \mathcal{H}_B\) — are, in a precise sense, maximally entangled with high probability. This is the phenomenon of **generic entanglement**, studied by Page (1993) and quantified precisely by Hayden, Leung, and Winter (2006).

<div class="theorem">
<strong>Theorem (Page's formula).</strong> Let \(|\psi\rangle\) be a Haar-random pure state on \(\mathcal{H}_A \otimes \mathcal{H}_B\) with \(\dim \mathcal{H}_A = m \leq n = \dim \mathcal{H}_B\). Then the expected entropy of entanglement satisfies

\[
\mathbb{E}[S(\rho_A)] \approx \log m - \frac{m}{2n \ln 2}
\]

for large \(m, n\). In particular, random states are nearly maximally entangled: their entropy of entanglement is close to \(\log m\) with corrections of order \(m/n\).
</div>

The mechanism behind generic entanglement is the measure concentration phenomenon on high-dimensional spheres: a Lipschitz function of a random vector on the unit sphere in \(\mathbb{R}^d\) concentrates around its mean with Gaussian tails of scale \(O(1/\sqrt{d})\). The entropy of entanglement is a Lipschitz function of the state vector, so it concentrates sharply around its mean, which is close to the maximum \(\log m\).

The generic entanglement of random states has operational implications for the decoupling principle: a Haar-random unitary applied by Alice to her part of an entangled state will decouple her system from the environment with high probability, enabling the sender to "scramble" quantum information and achieve quantum channel capacity.

---

# Chapter 9: Advanced Topics and Interconnections

## Nonlocality Without Entanglement

A surprising result due to Bennett et al. (1999) is that **nonlocality without entanglement** is possible: there exist sets of orthogonal product states in \(\mathcal{H}_A \otimes \mathcal{H}_B\) that cannot be perfectly distinguished by LOCC, even though each individual state is separable (product). This demonstrates that nonlocal behavior — in the operational sense of requiring global measurements — is not equivalent to entanglement.

The canonical example consists of nine orthogonal product states of two qutrits that span the full space and yet cannot be perfectly discriminated by any LOCC protocol. The obstruction arises because LOCC measurements inevitably "disturb" some states in the set, preventing perfect discrimination even with arbitrary rounds of communication.

This result implies that **separable operations are strictly more powerful than LOCC** for state discrimination tasks: all nine states can be perfectly distinguished by separable measurements (which may require quantum correlations in the measurement apparatus) but not by LOCC. The gap between LOCC and separable operations is thus operationally meaningful.

## Two-Way Distillation and Superactivation

The distillable entanglement under one-way LOCC (classical communication in only one direction) may be smaller than under two-way LOCC. This is because back-communication allows parties to adaptively correct errors based on measurement results, enabling more efficient purification protocols. However, the exact value of \(E_D\) under two-way LOCC is unknown for most mixed states, as it requires optimizing over an exponentially complex class of adaptive protocols.

A striking superactivation phenomenon discovered by Smith and Yard (2008) shows that two channels, each with zero quantum capacity, can have strictly positive quantum capacity when used together: \(Q(\mathcal{N}_1) = Q(\mathcal{N}_2) = 0\) but \(Q(\mathcal{N}_1 \otimes \mathcal{N}_2) > 0\). This is analogous to bound entanglement: each channel alone is "useless" for quantum communication, but their combination is not. The example involves a PPT channel (which maps all states to PPT states and hence has zero quantum capacity by the PPT binding criterion) and a 50% erasure channel (which has zero capacity alone). The PPT channel provides a hidden resource that the erasure channel activates.

## Distillable Key and PPT Entanglement

A fundamental question in quantum cryptography is whether PPT entangled states can be useful for cryptographic key generation. Recall that PPT states have zero distillable entanglement, but they may still contain some form of useful quantum correlations.

Horodecki, Horodecki, Horodecki, and Oppenheim (2005) showed that certain PPT states — specifically, states of the form \(\gamma_{AB} = \frac{1}{d^2} \sum_{m,n} |m\rangle\langle n|_A \otimes U_m \rho U_n^\dagger\) for appropriate unitaries \(U_k\) and density matrix \(\rho\) — are **private states**: they encode a perfect secret key against any adversary holding a purification. These states have \(K_D > 0\) despite \(E_D = 0\), demonstrating that the distillable key is strictly larger than the distillable entanglement in general.

The **private state** (also called a **γ-state** or **twisted state**) has the structure

\[
\gamma_{ABa'b'} = \frac{1}{d^2} \sum_{k,l=0}^{d-1} |kk\rangle\langle ll|_{AB} \otimes U_k \sigma U_l^\dagger_{a'b'},
\]

where \(AB\) is the "key part" encoding the secret key, \(a'b'\) is the "shield part," and \(U_k\) are unitaries. The shield part is designed so that the eavesdropper holding the purification of the state cannot gain any information about the key, even though the state is PPT (in certain examples) and hence non-distillable.

## The Mathematics of Entropy: Stinespring and Beyond

The algebraic structure of quantum information theory is grounded in the representation theory of completely positive maps. Every quantum channel \(\mathcal{N}: \mathcal{L}(\mathcal{H}_A) \to \mathcal{L}(\mathcal{H}_B)\) has a **Stinespring dilation**: there exists a Hilbert space \(\mathcal{H}_E\) and an isometry \(V: \mathcal{H}_A \to \mathcal{H}_B \otimes \mathcal{H}_E\) such that

\[
\mathcal{N}(\rho) = \operatorname{Tr}_E\!\left[V\rho V^\dagger\right].
\]

The environment \(E\) absorbs the "noise" of the channel; the complementary channel \(\hat{\mathcal{N}}(\rho) = \operatorname{Tr}_B[V\rho V^\dagger]\) describes the information leaking to the environment. The quantum capacity of \(\mathcal{N}\) is determined by the competition between information sent to Bob and information leaked to the environment, quantified by the coherent information.

The **Choi matrix** of a channel \(\mathcal{N}\) is \(J_\mathcal{N} = (\mathbf{I} \otimes \mathcal{N})(|\Phi^+\rangle\langle\Phi^+|)\), where \(|\Phi^+\rangle\) is a maximally entangled state. By the Choi-Jamiołkowski isomorphism, the channel is completely positive if and only if \(J_\mathcal{N} \geq 0\), and trace-preserving if and only if \(\operatorname{Tr}_B(J_\mathcal{N}) = \mathbf{I}_A / d\). The entanglement properties of the Choi matrix directly correspond to properties of the channel: the quantum capacity is related to the coherent information of the Choi matrix, and the PPT condition on the Choi matrix is equivalent to the channel being anti-degradable (sending all information to the environment).

## Decoupling Theorem and Random Unitaries

The **decoupling principle** is a cornerstone of quantum Shannon theory, providing the technical mechanism behind achievability proofs for quantum channel capacity, state merging, and entanglement distillation.

<div class="theorem">
<strong>Decoupling Theorem.</strong> Let \(\rho_{AR}\) be a bipartite state and \(\mathcal{N}: \mathcal{L}(\mathcal{H}_A) \to \mathcal{L}(\mathcal{H}_B)\) a quantum channel. If a Haar-random unitary \(U\) is applied to system \(A\) before the channel, then the expected deviation from decoupling satisfies

\[
\mathbb{E}_U \!\left\| (\mathcal{N} \circ \mathcal{U})(\rho_{AR}) - \tau_B \otimes \rho_R \right\|_1^2 \leq 2^{-[S_{\min}(\rho_{AR}) - S_{\max}(\mathcal{N})]},
\]

where \(S_{\min}\) is the min-entropy and \(S_{\max}\) refers to the entropy of the maximally mixed state on the channel output.
</div>

Intuitively, if the channel leaks much less information (small \(S_{\max}(\mathcal{N})\)) than the total system entropy (\(S_{\min}(\rho_{AR})\)), then the output is approximately decoupled from the reference system \(R\). This means Bob cannot infer anything about the reference from the channel output, which is the condition for perfect quantum error correction.

The one-shot decoupling theorem leads to the asymptotic quantum capacity formula via the typicality argument: applying independent random unitaries on \(n\) copies of \(A\) in the i.i.d. setting, the min- and max-entropies converge to the von Neumann entropy by the AEP, recovering the coherent information formula for quantum capacity.

## State Merging and Quantum Communication

**State merging** (Horodecki, Oppenheim, Winter 2005) is an elegant information-theoretic task that unifies several quantum communication protocols. In state merging, Alice and Bob share \(n\) copies of \(\rho_{AB}\), and Alice wants to "transfer" her part of the state to Bob using LOCC plus quantum communication. The optimal rate of quantum communication is the conditional entropy \(S(A|B)\):

- If \(S(A|B) > 0\), Alice must send \(S(A|B)\) qubits to Bob per copy.
- If \(S(A|B) < 0\) (possible when \(\rho_{AB}\) is entangled), Alice can merge her state to Bob while also generating \(|S(A|B)|\) ebits of entanglement as a byproduct.

This remarkable result — that negative conditional entropy corresponds to generating entanglement "for free" during state transfer — provides the operational interpretation of negative quantum conditional entropy. State merging is the quantum analog of Slepian-Wolf source coding and plays a central role in quantum network information theory.

**State redistribution** (Devetak, Yard 2008) generalizes state merging to the scenario where Bob already has partial information about Alice's state, providing a unified framework for quantum communication with side information.

---

# Chapter 10: Mathematical Structures and Inequalities

## Operator Monotone Functions and the Data Processing Inequality

A function \(f: (0,\infty) \to \mathbb{R}\) is **operator monotone** if \(A \leq B\) implies \(f(A) \leq f(B)\) for all Hermitian matrices. The function \(f(x) = \log x\) is operator monotone (this is a non-trivial fact, proved using the Löwner representation theorem), while \(f(x) = x^2\) is not.

The data processing inequality for quantum relative entropy states that for any quantum channel \(\mathcal{E}\):

\[
S(\mathcal{E}(\rho) \| \mathcal{E}(\sigma)) \leq S(\rho \| \sigma).
\]

This inequality has a single, elegant proof using the operator monotonicity of \(\log\). It implies all the fundamental quantum information inequalities: strong subadditivity (by choosing \(\mathcal{E} = \operatorname{Tr}_A\)), the quantum channel capacity converse (by choosing \(\mathcal{E}\) to be the channel), and the monotonicity of distillable entanglement under LOCC.

The **Petz recovery map** provides a refined version of the data processing inequality. For a channel \(\mathcal{E}\) and reference states \(\rho, \sigma\), the equality \(S(\mathcal{E}(\rho)\|\mathcal{E}(\sigma)) = S(\rho\|\sigma)\) holds if and only if the Petz recovery map \(\mathcal{R}_{\sigma,\mathcal{E}}(\cdot) = \sigma^{1/2} \mathcal{E}^\dagger\!\left(\mathcal{E}(\sigma)^{-1/2}(\cdot)\mathcal{E}(\sigma)^{-1/2}\right)\sigma^{1/2}\) is a perfect recovery channel: \(\mathcal{R}_{\sigma,\mathcal{E}} \circ \mathcal{E}(\rho) = \rho\). The Fawzi-Renner theorem (2015) strengthens this to a quantitative statement: the gap \(S(\rho\|\sigma) - S(\mathcal{E}(\rho)\|\mathcal{E}(\sigma))\) is bounded below by \(-2\log F(\rho, \mathcal{R}_{\sigma,\mathcal{E}} \circ \mathcal{E}(\rho))\), connecting the data processing gap to the fidelity of approximate recovery.

## Entropy Inequalities and the Quantum Marginal Problem

Strong subadditivity is one of a family of entropy inequalities. A fundamental open problem is to characterize all linear entropy inequalities, i.e., all relations of the form \(\sum_S c_S S(S) \geq 0\) that hold for all quantum states, where the sum is over subsets of a multipartite system.

For classical random variables, the complete set of linear inequalities is generated by non-negativity of conditional mutual information (which is equivalent to strong subadditivity in the quantum case). For quantum systems, the situation is more complex: the **quantum entropy cone** (the set of all possible entropy vectors \((S(A), S(B), S(AB), \ldots)\)) is known to differ from the classical entropy cone already for four parties, due to the possibility of negative conditional entropy.

The **quantum marginal problem** asks: given a set of reduced density matrices \(\{\rho_S\}_{S \subset [n]}\) for all subsets \(S\) of a multipartite system, does there exist a global state \(\rho_{[n]}\) consistent with all these marginals? This problem is QMA-hard in general but can be solved in specific instances using the Kirwan-Ness stratification and moment polytope techniques.

## Quantum Typicality and the Method of Types

The **method of types** is a combinatorial technique from classical information theory that extends naturally to the quantum setting. For a sequence of quantum systems prepared in states from a finite alphabet, one classifies sequences by their **empirical distribution** (type) and bounds probabilities and entropies in terms of the number of types.

In the quantum method of types, one works with the **typical subspace**: for a state \(\rho^{\otimes n}\), the typical subspace \(\mathcal{T}_\epsilon^n\) is spanned by eigenvectors of \(\rho^{\otimes n}\) with eigenvalue close to \(2^{-nS(\rho)}\). The dimension of \(\mathcal{T}_\epsilon^n\) is \(2^{n(S(\rho) \pm \epsilon)}\), and the projection onto \(\mathcal{T}_\epsilon^n\) has trace close to 1 in \(\rho^{\otimes n}\).

This structure allows one to approximate \(\rho^{\otimes n}\) by a mixture of approximately \(2^{nS(\rho)}\) nearly orthogonal pure states, each weighted approximately \(2^{-nS(\rho)}\). This is the quantum analog of the Shannon source coding theorem and provides the foundation for quantum data compression (Schumacher compression) and the achievability proofs in quantum channel theory.

## Approximate Quantum Error Correction and Entanglement Fidelity

The operational criterion for reliable quantum communication is the **entanglement fidelity**: for a channel \(\mathcal{N}\) and a state \(\rho\), the entanglement fidelity is

\[
F_e(\rho, \mathcal{N}) = F\!\left(|\psi_\rho\rangle, (\mathbf{I}_R \otimes \mathcal{N})(|\psi_\rho\rangle\langle\psi_\rho|)\right),
\]

where \(|\psi_\rho\rangle_{RA}\) is any purification of \(\rho_A\). Reliable quantum communication requires that there exist an encoding channel \(\mathcal{E}\) and decoding channel \(\mathcal{D}\) such that \(F_e(\rho, \mathcal{D} \circ \mathcal{N}^{\otimes n} \circ \mathcal{E}) \to 1\) as \(n \to \infty\) for rates below capacity.

The **quantum Hamming bound** and its analog for entanglement distillation provide fundamental limits: one cannot correct more than \((1-h(p))/2\) fraction of independent depolarizing errors (where \(h\) is binary entropy and \(p\) is the error rate) using a code of rate \(R\). The quantum capacity of the depolarizing channel is \(\max(0, 1 - 3h(p/4) - h(1-3p/4))\) for error rate \(p\), but computing this exactly requires regularization over many channel uses due to non-additivity of coherent information.

---

# Summary of Key Relationships

The entanglement measures studied in this course satisfy the following hierarchy for all bipartite states \(\rho_{AB}\):

\[
E_D(\rho) \leq E_R(\rho) \leq E_F(\rho) \leq E_C(\rho),
\]

with equality throughout for pure states (all equal \(S(\rho_A)\)) and strict inequalities possible for mixed states. The squashed entanglement \(E_{sq}\) satisfies \(E_D \leq E_{sq} \leq E_F\), and is the unique measure satisfying all five axioms simultaneously. The logarithmic negativity \(E_\mathcal{N}\) is an upper bound on \(E_D\) but is not additive and not a convex function.

The central open problems in the field as of writing include:
- The NPT bound entanglement conjecture (are all NPT states distillable?)
- Additivity of quantum channel capacities (is there a single-letter formula for \(Q(\mathcal{N})\)?)
- The quantum entropy cone characterization (what are all valid quantum entropy inequalities for four or more parties?)
- The reversibility of entanglement manipulation (when does \(E_D = E_C\) for mixed states?)
- Explicit counterexamples to channel additivity in small dimensions

These problems sit at the intersection of quantum information theory, functional analysis, and representation theory, illustrating the deep mathematical richness of entanglement as a physical resource.
