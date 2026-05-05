---
why: |
  PMATH 990 is the most open-ended rotating-topics course in the PMATH curriculum. The three chapters cover the operator-algebraic, complexity-theoretic, and free-probabilistic corners of what "pure mathematics" currently means at UW.
made_up: true
title: "PMATH 990: Topics in Pure Mathematics"
subjects: "PMATH"
---

**Sources.** J. Watrous, *The Theory of Quantum Information* (Cambridge University Press; public draft on the author's website); V. Paulsen, *Completely Bounded Maps and Operator Algebras* (Cambridge University Press); M. A. Nielsen and I. L. Chuang, *Quantum Computation and Quantum Information* (Cambridge University Press); D. V. Voiculescu, K. J. Dykema and A. Nica, *Free Random Variables* (CRM Monograph Series, AMS); J. A. Mingo and R. Speicher, *Free Probability and Random Matrices* (Springer); G. W. Anderson, A. Guionnet and O. Zeitouni, *An Introduction to Random Matrices* (Cambridge University Press); Z. Ji, A. Natarajan, T. Vidick, J. Wright and H. Yuen, *MIP\* = RE* (arXiv:2001.04383); supplementary public lecture notes from MIT, Stanford and similar institutions, located via web search.

# Chapter 1: Functional Analysis Methods for Quantum Information

Taught at UW as PMATH 990 in Winter 2021 by Vern Paulsen. The course was a rapid survey of the analytic infrastructure that quantum information theory has come to depend on: the geometry of Hilbert space, the algebras of bounded operators that act on it, the trace ideals through which quantum states are represented, and the operator-algebraic completions in which the more delicate questions about quantum channels and entanglement are most cleanly phrased. The pedagogical bargain is explicit. Concepts are introduced in their natural generality, but proofs are sketched only when they illuminate something a quantum information theorist would actually use. Students who want the full theory are sent to the standalone graduate sequences in functional analysis and operator algebras; here the goal is competence, not completeness.

The natural starting point is a finite-dimensional Hilbert space \(\mathcal{H} = \mathbb{C}^d\), but the course quickly moves to the infinite-dimensional separable case, because even the analysis of qubit channels frequently requires limits in operator norm that escape any finite ambient space. A **state** on a finite system is a positive operator \(\rho \in \mathcal{B}(\mathcal{H})\) with \(\mathrm{Tr}(\rho) = 1\); a **pure state** is a rank-one projection \(\rho = |\psi\rangle\langle\psi|\). The convex set of states is denoted \(\mathcal{D}(\mathcal{H})\), and its extreme points are exactly the pure states. To phrase measurements one introduces a **POVM**, a finite family \(\{E_i\}\) of positive operators with \(\sum_i E_i = I\), and the Born rule asserts that the probability of outcome \(i\) on state \(\rho\) is \(\mathrm{Tr}(E_i \rho)\).

<div class="remark">
<strong>Why operator algebras at all?</strong> A pure-state model would suggest that quantum systems live in projective Hilbert space and that dynamics are unitary. But measurement, decoherence, and partial knowledge force one to enlarge the picture: states become density operators, measurements become POVMs, dynamics become quantum channels. Each enlargement is forced by closing under a natural operation — convex combination, marginalisation, composition with an environment — and each landing point is an object that lives most naturally inside a <em>C*-algebra</em>.
</div>

The Banach-space backdrop is the **Schatten \(p\)-classes** \(\mathcal{S}_p(\mathcal{H})\), the operators \(T\) for which \(\|T\|_p = \mathrm{Tr}(|T|^p)^{1/p} < \infty\). The trace class \(\mathcal{S}_1\) is the predual of \(\mathcal{B}(\mathcal{H})\); the Hilbert–Schmidt class \(\mathcal{S}_2\) is itself a Hilbert space under \(\langle A, B\rangle = \mathrm{Tr}(A^\ast B)\); and the operator-norm closure of the finite-rank operators is the compact operators \(\mathcal{K}(\mathcal{H})\), whose dual is precisely \(\mathcal{S}_1\). These dualities are not merely formal: the trace-class norm is the right metric for distinguishing quantum states (one half of it is the optimal-bias error in a single-shot discrimination experiment), the Hilbert–Schmidt norm controls the most computationally tractable estimates, and the operator norm controls worst-case behaviour over inputs.

<div class="remark">
<strong>Trace duality, in one breath.</strong> If \(K \in \mathcal{K}(\mathcal{H})\) and \(T \in \mathcal{S}_1(\mathcal{H})\), then \(\mathrm{Tr}(KT)\) is well-defined and the pairing identifies \(\mathcal{K}(\mathcal{H})^\ast\) with \(\mathcal{S}_1(\mathcal{H})\) and \(\mathcal{S}_1(\mathcal{H})^\ast\) with \(\mathcal{B}(\mathcal{H})\). The second identification is what gives \(\mathcal{B}(\mathcal{H})\) its weak-<em>star</em> topology, and it is in this topology that the natural compactness theorems for sets of states are stated.
</div>

Spectral theory is the next pillar. For a self-adjoint \(A \in \mathcal{B}(\mathcal{H})\) the spectral theorem provides a projection-valued measure \(E\) on \(\sigma(A) \subseteq \mathbb{R}\) such that

\[ A = \int_{\sigma(A)} \lambda \, dE(\lambda), \]

and for any bounded Borel \(f\) one defines \(f(A) = \int f(\lambda) \, dE(\lambda)\). For unbounded self-adjoint operators — the Hamiltonians of physical systems — the same statement holds with the proviso that the integral is now an unbounded operator and one must keep track of the domain. **Stone's theorem** then identifies strongly continuous one-parameter unitary groups \(U(t) = e^{itA}\) with self-adjoint generators \(A\), giving the rigorous statement that the Schrödinger equation has unique solutions for any genuine self-adjoint Hamiltonian. The course warns the student about essentially self-adjoint operators that are not self-adjoint: a symmetric operator may admit several self-adjoint extensions, all of them physically distinct.

Quantum dynamics with environment is described by a **quantum channel**, a completely positive trace-preserving (CPTP) linear map \(\Phi : \mathcal{S}_1(\mathcal{H}_A) \to \mathcal{S}_1(\mathcal{H}_B)\). Complete positivity means that \(\Phi \otimes \mathrm{id}_n\) is positive on \(\mathcal{B}(\mathcal{H}_A \otimes \mathbb{C}^n)\) for every \(n\); positivity alone is not enough, as the transpose map demonstrates by failing to be CP while preserving positivity. The **Stinespring dilation** asserts that every CP map \(\Phi : \mathcal{B}(\mathcal{H}_A) \to \mathcal{B}(\mathcal{H}_B)\) (in the Heisenberg picture) is of the form \(\Phi(X) = V^\ast (X \otimes I_E) V\) for some isometry \(V : \mathcal{H}_B \to \mathcal{H}_A \otimes \mathcal{H}_E\), and this dilation is unique up to a partial isometry on the environment. The **Kraus representation** \(\Phi(\rho) = \sum_k A_k \rho A_k^\ast\) with \(\sum_k A_k^\ast A_k = I\) is the more concrete cousin.

<div class="remark">
<strong>Positive but not completely positive.</strong> The transpose map \(T(\rho) = \rho^T\) sends states to states for any single system, but \(T \otimes \mathrm{id}\) on a maximally entangled state produces an operator with negative eigenvalues. This is the Peres–Horodecki criterion in one sentence: <em>entanglement is detected exactly by the failure of positivity to be complete</em>. The lesson is that quantum operations and quantum states are distinguished by what happens when an inert ancilla is present.
</div>

The course's fourth pillar is **operator-space theory**, Paulsen's home territory. An operator space is a closed subspace \(V \subseteq \mathcal{B}(\mathcal{H})\) together with the matrix norms \(\|\cdot\|_n\) on \(M_n(V) \subseteq \mathcal{B}(\mathcal{H}^n)\); the morphisms are completely bounded maps with norm \(\|\Phi\|_{cb} = \sup_n \|\Phi \otimes \mathrm{id}_n\|\). The **Stinespring–Arveson** theorem extends to a Hahn–Banach-type result, **Wittstock's extension theorem**, that any completely bounded map from a subspace of \(\mathcal{B}(\mathcal{H})\) to \(\mathcal{B}(\mathcal{K})\) extends to a completely bounded map on the ambient algebra with the same cb-norm. This is the technical heart of why one can move freely between channels, dilations and POVMs.

<div class="remark">
<strong>Diamond norm, in passing.</strong> The right metric on quantum channels — the one that quantifies how distinguishable two channels are when an arbitrary entangled probe is allowed — is the <strong>diamond norm</strong> \(\|\Phi\|_\diamond = \|\Phi \otimes \mathrm{id}\|_{1 \to 1}\). It is precisely the cb-norm specialised to trace-class predual maps, and its appearance in quantum information was the surprise that drove the field into operator-space theory in the first place.
</div>

The infinite-dimensional theory closes with a glance at **\(C^\ast\)-algebras** and **von Neumann algebras**. A \(C^\ast\)-algebra is a Banach \(\ast\)-algebra satisfying \(\|x^\ast x\| = \|x\|^2\); by the Gelfand–Naimark theorem every commutative one is \(C(X)\) for a compact Hausdorff space, and every \(C^\ast\)-algebra is a closed \(\ast\)-subalgebra of \(\mathcal{B}(\mathcal{H})\) for some \(\mathcal{H}\). A **von Neumann algebra** is a \(\ast\)-subalgebra of \(\mathcal{B}(\mathcal{H})\) closed in the weak operator topology, equivalently the double commutant \(M = M''\). For QIT the most important examples are the **type \(\mathrm{II}_1\) factors**: infinite-dimensional von Neumann algebras with a faithful normal tracial state, of which the **hyperfinite \(\mathrm{II}_1\) factor** \(\mathcal{R}\) is the canonical exemplar.

<div class="remark">
<strong>Why type II<sub>1</sub>?</strong> Quantum systems with infinitely many degrees of freedom and a meaningful notion of expectation — the very setting of large quantum codes, of approximate representations of group relations, and of the <em>Connes embedding problem</em> — live most naturally inside type II<sub>1</sub> factors. The capstone of the course gestures toward this connection: deciding which finite-dimensional correlation behaviours can be approximated by tensor-product strategies is, in the end, a question about embeddings into the ultrapower of the hyperfinite factor.
</div>

The course closes by drawing a thread through everything: **quantum capacity**. Given a channel \(\Phi\), how many qubits per use can be transmitted reliably with vanishing error? The answer involves the **coherent information** \(I_c(\rho, \Phi) = S(\Phi(\rho)) - S((\Phi \otimes \mathrm{id})(|\psi\rangle\langle\psi|))\), where \(|\psi\rangle\) is a purification, and the regularised quantity

\[ Q(\Phi) = \lim_{n \to \infty} \frac{1}{n} \max_\rho I_c(\rho, \Phi^{\otimes n}). \]

The **Lloyd–Shor–Devetak theorem** identifies this with the quantum capacity, but the regularisation is essential: there are channels of zero one-shot coherent information whose tensor powers carry positive quantum information. This **superadditivity** is one of the strangest phenomena in the subject, and it is the one phenomenon whose mathematical content most directly demands the operator-space and \(C^\ast\)-algebraic toolkit the course assembled.

# Chapter 2: MIP* and Quantum Complexity

Taught at UW as PMATH 990 in Winter 2022 by William Slofstra. The course developed, from first principles, the theory of multiprover interactive proofs with shared entanglement, climaxing in the proof and consequences of the result \(\mathrm{MIP}^\ast = \mathrm{RE}\) of Ji, Natarajan, Vidick, Wright and Yuen. The lectures assumed essentially no quantum information background; they built nonlocal games, Tsirelson's problem and the Connes embedding problem in parallel, then converged onto the compression theorem that drives the main theorem.

A **nonlocal game** \(G\) is specified by finite question sets \(X, Y\), finite answer sets \(A, B\), a probability distribution \(\pi\) on \(X \times Y\), and a verification predicate \(V : X \times Y \times A \times B \to \{0, 1\}\). Two cooperating players, Alice and Bob, are sent questions \(x, y\) drawn from \(\pi\), respond with answers \(a, b\) chosen according to a strategy, and win iff \(V(x, y, a, b) = 1\). They cannot communicate during the game but agree on a strategy in advance. A **classical strategy** is a pair of conditional distributions; the **classical value** \(\omega(G)\) is the supremum of winning probabilities over such strategies.

A **quantum (tensor-product) strategy** consists of a state \(|\psi\rangle \in \mathcal{H}_A \otimes \mathcal{H}_B\) and POVMs \(\{A_x^a\}_a\) on \(\mathcal{H}_A\), \(\{B_y^b\}_b\) on \(\mathcal{H}_B\). The probability of answers \((a, b)\) given questions \((x, y)\) is

\[ p(a, b | x, y) = \langle \psi | A_x^a \otimes B_y^b | \psi \rangle, \]

and the **tensor-product value** \(\omega^\ast(G)\) is the supremum of winning probabilities over all such strategies in arbitrary dimension. A **commuting-operator strategy** replaces the tensor decomposition with a single Hilbert space carrying two commuting families of POVMs \(\left[A_x^a, B_y^b\right] = 0\), and the corresponding value is \(\omega^{co}(G)\). For finite-dimensional systems the two formalisms coincide, but in infinite dimension they may diverge — and **Tsirelson's problem** asked whether the closures of the two correlation sets are equal.

<div class="remark">
<strong>The CHSH game in one paragraph.</strong> Take \(X = Y = \{0, 1\}\), \(A = B = \{0, 1\}\), uniform \(\pi\), and the predicate \(a \oplus b = xy\). The classical value is \(3/4\); the quantum value is \(\cos^2(\pi/8) \approx 0.854\), achieved by a maximally entangled qubit pair and well-chosen Pauli measurements. CHSH is the single most important example in the subject because it shows that <em>entanglement strictly enlarges</em> the set of correlations achievable in a nonlocal game — and because every modern self-testing argument is, at heart, a robust version of CHSH.
</div>

Why is this complexity theory? An **interactive proof system** for a language \(L\) consists of a polynomial-time verifier and an unbounded prover such that strings in \(L\) are accepted with high probability and strings outside \(L\) are rejected with high probability against every prover strategy. The class \(\mathrm{IP}\) was famously shown by Shamir to coincide with \(\mathrm{PSPACE}\). With multiple provers who cannot communicate but share no entanglement, one obtains \(\mathrm{MIP} = \mathrm{NEXP}\) (Babai–Fortnow–Lund). The class \(\mathrm{MIP}^\ast\) replaces "no shared resources" with "shared entanglement"; the questions are which languages such systems decide, and what the maximum acceptance probability is as a function of the entangled state's structure.

<div class="remark">
<strong>The shocking part.</strong> One might guess that allowing the provers entanglement could only help them cheat — and the original results in the field tried hard to handle that. But entanglement also gives the verifier new tools: rigidity theorems pin down the provers' strategies up to local isometry, and a verifier who can force the provers to play essentially uniquely can extract enormous amounts of information from short interactions. The end consequence, \(\mathrm{MIP}^\ast = \mathrm{RE}\), says that with entangled provers a polynomial-time verifier can recognise <em>every</em> recursively enumerable language — including the halting problem.
</div>

The technical engine is **self-testing**. A nonlocal game \(G\) self-tests a strategy \((|\psi\rangle, \{A_x^a\}, \{B_y^b\})\) if every strategy achieving value within \(\varepsilon\) of \(\omega^\ast(G)\) is, up to local isometries on each side and a junk register, \(O(\sqrt{\varepsilon})\)-close to the canonical strategy. The **Mayers–Yao** theorem provides the prototype for two qubits and a maximally entangled pair; far-reaching generalisations construct self-tests for arbitrarily large entangled states using only constant-sized question and answer sets. **Magic-square** and **Pauli-braiding** games are key examples: one self-tests a tensor product of EPR pairs and the local Pauli observables on each.

<div class="remark">
<strong>Parallel repetition is not a free lunch.</strong> For classical games, Raz's parallel repetition theorem shows the value of \(G^{\otimes n}\) decays exponentially. For quantum games no such clean theorem is known; entanglement-assisted parallel repetition is one of the central open problems of the area, and many constructions in the MIP*=RE proof carefully avoid relying on it.
</div>

The proof of \(\mathrm{MIP}^\ast = \mathrm{RE}\) proceeds by **compression**. One designs a transformation that, given a nonlocal game \(G\) describing a verifier with time bound \(T\), produces a slightly larger game \(G'\) describing a verifier with time bound \(\log T\). Iterating compression starting from a game encoding a halting problem reduces verifier complexity to constant size while preserving the gap between yes-instances and no-instances. The compression step uses **introspection games**, in which provers are asked to perform measurements not just on their share of an entangled state but on the questions they were sent, and the verifier checks consistency through low-degree testing. The construction is intricate and the soundness analysis depends on quantitative self-testing.

<div class="remark">
<strong>Connes embedding, and how it falls.</strong> The Connes embedding problem, posed in 1976, asked whether every separable type II<sub>1</sub> factor embeds into an ultrapower of the hyperfinite factor. <em>Tsirelson's problem</em> is equivalent (Junge–Navascués–Palazuelos–Pérez-García–Scholz–Werner; Fritz; Ozawa) to a positive answer to Connes embedding. The MIP*=RE result implies that \(\omega^\ast\) is uncomputable in general while \(\omega^{co}\) is co-recursively enumerable; if the two coincided, both would be computable. Hence they differ, hence Tsirelson fails, hence Connes fails.
</div>

The course's later lectures unpacked the **operator-algebraic implications**. Failure of the Connes embedding conjecture means that there exist tracial von Neumann algebras whose moments cannot be approximated by matrix algebras, settling negatively a question whose roots reach back to Murray–von Neumann's classification of factors. Failure of Kirchberg's QWEP conjecture and various predicted equivalences in the structure of nuclear \(C^\ast\)-algebras follow as corollaries, each of which had stood as a candidate organising principle for the subject.

<div class="remark">
<strong>What survives as a research programme.</strong> The proof is constructive but not transparent, and a major project in operator algebras since 2020 has been to extract a "humanly understandable" non-embeddable factor — one specified by group-algebra or random-matrix data rather than by simulation of a universal Turing machine. Slofstra's own earlier work on <em>embeddability of correlations</em> through groups and synchronous strategies is a key entry point into this programme.
</div>

# Chapter 3: Non-Commutative Random Variables and Free Probability

Taught at UW as PMATH 990 in Winter 2023 by Andu Nica. The course developed limit theorems for non-commutative random variables, building from classical weak convergence on \(\mathrm{Prob}(\mathbb{R})\) through the axiomatic non-commutative probability spaces of Voiculescu, to the free central limit theorem and its companions. The throughline was the comparison between classical and free worlds: each tool of classical probability — independence, convolution, characteristic function, cumulant — has a free analogue, and the analogues form a coherent calculus of their own.

Part I of the course laid the classical groundwork. The space \(\mathrm{Prob}(\mathbb{R})\) of Borel probability measures on the real line carries the topology of weak convergence: \(\mu_n \to \mu\) iff \(\int f \, d\mu_n \to \int f \, d\mu\) for every bounded continuous \(f\). This topology is metrisable by the Lévy–Prokhorov metric, making \(\mathrm{Prob}(\mathbb{R})\) a Polish space. **Helly's selection theorem** describes its (relative) compact subsets: a family is tight iff every sequence has a weakly convergent subsequence. **Prokhorov's theorem** ties tightness to relative compactness in the strong topology and is the analyst's basic tool for extracting limits.

For measures \(\mu\) with finite moments of all orders one writes \(m_k(\mu) = \int x^k \, d\mu(x)\) and asks when \(\mu\) is **moment-determinate**. **Carleman's condition** \(\sum_k m_{2k}^{-1/(2k)} = \infty\) suffices, and is satisfied in particular when the moments grow no faster than \((Ck)^k\); this also forces \(\mu\) to have compact support. The course used these conditions throughout: in the non-commutative setting one only ever has access to moments, so any limit theorem one proves at the level of moments only delivers a measure when moment-determinacy holds.

<div class="remark">
<strong>Why moments and not densities?</strong> Non-commutative random variables live in algebras with no obvious notion of density; what one can extract is the sequence of mixed moments under a tracial expectation. Moment methods are therefore the only game in town. The price is that one must spend real care on the analytic question of when a sequence of moments determines a measure — a question that is invisible in elementary classical probability, where densities solve it for free.
</div>

Part II introduced the axiomatic framework. A **non-commutative probability space** is a pair \((\mathcal{A}, \varphi)\) where \(\mathcal{A}\) is a unital algebra over \(\mathbb{C}\) and \(\varphi : \mathcal{A} \to \mathbb{C}\) is a unital linear functional. Elements of \(\mathcal{A}\) are called **non-commutative random variables**, and \(\varphi(a)\) plays the role of expectation. When \(\mathcal{A}\) is a \(\ast\)-algebra and \(\varphi(a^\ast a) \geq 0\), the GNS construction produces a Hilbert space \(L^2(\mathcal{A}, \varphi)\) on which \(\mathcal{A}\) acts; this is the bridge to operator algebras and von Neumann algebras. A **tracial** state, \(\varphi(ab) = \varphi(ba)\), is the case of central interest, and the key examples include matrix algebras with normalised trace, group von Neumann algebras with the canonical trace, and the algebra of bounded operators on Fock space with the vacuum state.

<div class="remark">
<strong>The group algebra example.</strong> Let \(G\) be a discrete group, \(\mathbb{C}\left[G\right]\) its complex group algebra, and \(\tau\) the trace functional sending a formal sum to its identity coefficient. For \(G\) the direct product of countably many copies of \(\mathbb{Z}/2\) one obtains classical independence between the coordinate generators; for \(G\) the free product of the same factors, one obtains a free family. The same elementary algebraic input — <em>direct product or free product?</em> — produces either the Gaussian or the semicircular distribution as the limit of normalised sums. This is the foundational miracle of free probability.
</div>

The **distribution** of a single self-adjoint \(a \in \mathcal{A}\) (with \(\varphi\) tracial and positive) is the unique compactly supported measure \(\mu_a\) on \(\mathbb{R}\) satisfying \(\varphi(a^k) = \int x^k \, d\mu_a(x)\). For a family \((a_i)_{i \in I}\) the **joint distribution** is the collection of mixed moments \(\varphi(a_{i_1} a_{i_2} \cdots a_{i_k})\); these can be arbitrarily complicated because the \(a_i\) need not commute. A central computational tool is the **non-crossing partition lattice** \(NC(n)\), and the \(n\)-th **Catalan number** \(C_n\) appears as the number of non-crossing pair partitions on \(2n\) points.

The notion of **free independence** is then defined. A family of unital subalgebras \((\mathcal{A}_i)_{i \in I}\) is **free** if for every alternating product \(a_1 a_2 \cdots a_k\) with \(a_j \in \mathcal{A}_{i_j}\), \(i_1 \neq i_2 \neq \cdots \neq i_k\), and \(\varphi(a_j) = 0\) for all \(j\), one has \(\varphi(a_1 \cdots a_k) = 0\). This recursive condition determines all mixed moments of free variables from the marginals, just as classical independence does — but the rule is genuinely different. For free \(a, b\), for example,

\[ \varphi(abab) = \varphi(a^2)\varphi(b)^2 + \varphi(a)^2 \varphi(b^2) - \varphi(a)^2\varphi(b)^2, \]

which differs from the classical formula \(\varphi(a^2)\varphi(b^2)\) precisely when \(a\) and \(b\) are not centred.

<div class="remark">
<strong>Free independence is not classical independence.</strong> Classical independence is symmetric in the senses that two independent random variables remain independent under permutation, and the joint distribution factorises. Free independence factorises only after centring, and the resulting algebra of mixed moments is genuinely non-commutative. The two notions coincide only in trivial cases — essentially when at least one of the variables is constant.
</div>

Part III is limit theorems. The **free central limit theorem** states that if \((x_n)_{n \geq 1}\) is a sequence of free, identically distributed, centred self-adjoint variables with variance \(\sigma^2\), then the distribution of

\[ s_n = \frac{1}{\sqrt n}(x_1 + x_2 + \cdots + x_n) \]

converges weakly to the **semicircular distribution** with density proportional to \(\sqrt{4\sigma^2 - x^2}\) on the interval \(\left[-2\sigma, 2\sigma\right]\). Compare this with the classical CLT, which delivers the Gaussian density on the whole real line. Both proofs reduce to a moment computation; the difference is that classical pair partitions count all matchings while free pair partitions count only non-crossing ones, and the resulting Catalan-number generating function gives the semicircle.

<div class="remark">
<strong>Wigner's semicircle, twice over.</strong> Eugene Wigner first encountered the semicircle as the limiting eigenvalue distribution of large symmetric random matrices with i.i.d. entries. Voiculescu later showed that this is no coincidence: independent Gaussian random matrices are <em>asymptotically free</em>, and the free CLT applied to entries of large matrices recovers Wigner's law. Free probability is, in this sense, the right probability theory of large random matrices.
</div>

The course developed the analytic side of free probability through the **Cauchy transform** \(G_\mu(z) = \int (z - x)^{-1} \, d\mu(x)\), its compositional inverse \(K_\mu\), and the **R-transform** \(R_\mu(z) = K_\mu(z) - 1/z\). The cardinal property of \(R_\mu\) is that for free \(a, b\),

\[ R_{\mu_{a+b}}(z) = R_{\mu_a}(z) + R_{\mu_b}(z), \]

so that \(R\) linearises **free additive convolution** \(\boxplus\) just as the logarithm of the characteristic function linearises classical convolution. Equivalently, in terms of **free cumulants** \(\kappa_n\) defined via the Möbius function of the non-crossing partition lattice, the \(R\)-transform is the generating series of cumulants and free independence is encoded by the vanishing of mixed cumulants.

<div class="remark">
<strong>Free Poisson, also called Marchenko–Pastur.</strong> The free analogue of the Poisson limit theorem, where one takes \(n\) free Bernoulli variables with parameter \(\lambda/n\) and adds them, produces the <strong>Marchenko–Pastur distribution</strong> with parameter \(\lambda\). This is exactly the limiting eigenvalue distribution of normalised Wishart matrices \(\frac{1}{n} X^\ast X\) with rectangular Gaussian \(X\); the law was discovered in the late 1960s by Marchenko and Pastur in random matrix theory long before the free probabilistic interpretation was available.
</div>

The course's closing motif was **exchangeability**. A sequence \((x_n)_{n \geq 1}\) is exchangeable if its joint distribution is invariant under finite permutations of the indices. **De Finetti's theorem** characterises classical exchangeable sequences as conditional mixtures of i.i.d. sequences. **Köstler–Speicher** proved a free analogue: a sequence in a tracial \(W^\ast\)-probability space is invariant under all *quantum* permutations iff it is conditionally free and identically distributed over its tail algebra. From this single principle the lectures derived both the classical and the free CLT in parallel — a reminder that the structural content of "independence" is, in the right framework, a symmetry principle, and that classical and free independence are the only two natural realisations of that symmetry compatible with a positive tracial expectation.
