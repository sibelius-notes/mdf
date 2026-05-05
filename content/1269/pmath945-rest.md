---
made_up: true
title: "PMATH 945: Topics in Algebra"
subjects: PMATH
---

*These notes consolidate the rotating PMATH 945 topics course at the University of Waterloo across its post-2018 offerings for which no single promoted file exists: Jason Bell's Winter 2019 course on algebraic constructions; William Slofstra's Fall 2019 course on non-local games and operator algebras; Vern Paulsen's Winter 2020 course on operator-algebraic quantum information; Spiro Karigiannis's Fall 2020 course on Clifford algebras and spin geometry; Jason Bell's Winter 2021 course on rings and categorical ring theory; the Winter 2026 Bell offering on categorical logic and quantum logic; and the Fall 2026 offering on arithmetic dynamics. Each chapter is written so that a student scanning the first paragraph can decide whether the topic fits their interests.*

## Sources and References

- Mac Lane, S. *Categories for the Working Mathematician* (Springer GTM 5)
- Mac Lane, S. & Moerdijk, I. *Sheaves in Geometry and Logic* (Springer Universitext)
- Bell, J. L. & Slomson, A. B. *Models and Ultraproducts* (Dover)
- Bergman, G. M. *An Invitation to General Algebra and Universal Constructions* (open access, author's Berkeley page)
- Paulsen, V. I. *Completely Bounded Maps and Operator Algebras* (Cambridge Studies 78)
- Watrous, J. *The Theory of Quantum Information* (Cambridge; open draft on author's UW page)
- Lawson, H. B. & Michelsohn, M.-L. *Spin Geometry* (Princeton Mathematical Series 38)
- Harvey, F. R. *Spinors and Calibrations* (Academic Press)
- Hartshorne, R. *Algebraic Geometry* (Springer GTM 52)
- Vakil, R. *The Rising Sea: Foundations of Algebraic Geometry* (open draft, math.stanford.edu/~vakil)
- Silverman, J. H. *The Arithmetic of Dynamical Systems* (Springer GTM 241)
- Döring, A. & Isham, C. J. "A topos foundation for theories of physics" series (arXiv).

---

# Chapter 1: Algebraic Constructions and Rings

Taught at UW as PMATH 945 in Winter 2019 by Jason Bell.

Why does *every* mathematician — algebraist, topologist, number theorist, analyst — need tensor products, direct limits, localization? Bell's course answered: because these are the *universal* constructions, the moves one is forced to make any time an algebraic structure has to be glued, enlarged, or re-based. A student who leaves this course thinking of the tensor product as "a symbol \(\otimes\) and some relations" has missed the point. The real content is that each construction is determined, up to unique isomorphism, by a universal property — and that property is the construction.

<div class="definition">
<strong>Definition 1.1 (Tensor product by universal property).</strong> Let \(R\) be a commutative ring and let \(M, N\) be \(R\)-modules. The <em>tensor product</em> \(M \otimes_R N\) is the unique \(R\)-module (up to canonical isomorphism) equipped with an \(R\)-bilinear map \(M \times N \to M \otimes_R N\) such that every \(R\)-bilinear map \(M \times N \to P\) factors uniquely through \(M \otimes_R N\).
</div>

Existence (as \(R\langle M \times N\rangle\) modulo bilinearity) is secondary; uniqueness from the universal property is the content. The course spent its first month driving this home through increasingly sophisticated constructions: the free module on a set, the quotient of a module by a submodule, extension of scalars \(M \otimes_R S\), pushouts of commutative rings, completions at an ideal.

<div class="theorem">
<strong>Theorem 1.2 (Right-exactness of tensor).</strong> For any \(R\)-module \(N\), the functor \(- \otimes_R N\) is right-exact: a short exact sequence \(0 \to M' \to M \to M'' \to 0\) induces an exact sequence
\[ M' \otimes_R N \to M \otimes_R N \to M'' \otimes_R N \to 0. \]
Left-exactness fails in general, and the measure of its failure is the first Tor group \(\mathrm{Tor}^R_1(M'', N)\).
</div>

<div class="example">
<strong>Example 1.3 (Why tensor can kill things).</strong> For \(R = \mathbb{Z}\), the short exact sequence \(0 \to \mathbb{Z} \xrightarrow{\cdot 2} \mathbb{Z} \to \mathbb{Z}/2 \to 0\) tensored with \(\mathbb{Z}/2\) gives \(\mathbb{Z}/2 \xrightarrow{0} \mathbb{Z}/2 \to \mathbb{Z}/2 \to 0\) — the first map is now zero, not injective. The "loss" is \(\mathrm{Tor}^\mathbb{Z}_1(\mathbb{Z}/2, \mathbb{Z}/2) = \mathbb{Z}/2\). This single failure motivates homological algebra: tensor is a derived functor, and the higher Tor groups measure its defects.
</div>

**Direct and inverse limits.** Filtered colimits (\(\varinjlim\)) commute with tensor and with finite limits, which is the reason that localization and completion — both filtered colimits — behave so well. Cofiltered limits (\(\varprojlim\)) are subtler: they can fail exactness, and the measure of failure is \(\varprojlim^1\), the first right-derived functor. The Mittag-Leffler condition — that transition maps in the system eventually have stable images — is the standard criterion for \(\varprojlim^1 = 0\).

<div class="definition">
<strong>Definition 1.4 (Localization).</strong> For a commutative ring \(R\) and multiplicatively closed \(S \subseteq R\), the localization \(S^{-1}R\) is the universal \(R\)-algebra in which every \(s \in S\) becomes invertible. Its prime spectrum \(\operatorname{Spec}(S^{-1}R)\) is the subspace of \(\operatorname{Spec}(R)\) of primes disjoint from \(S\), and \(S^{-1}R \otimes_R -\) is an exact (flat) functor.
</div>

Flatness of localization is the foundation of **local-to-global principles** in algebraic geometry: an \(R\)-module \(M\) is zero iff its localization \(M_{\mathfrak{p}}\) is zero at every prime \(\mathfrak{p}\). This reduces global questions about modules and schemes to statements about local rings, where geometric intuition is sharper and computations are tractable.

**What the course promised — and delivered.** By the end of the term, students could compute with a tensor product without writing a single element; could recognize a functor as "the left adjoint of forgetting structure"; and could read a paper on commutative algebra or schemes without translating the categorical vocabulary back into elements. That translation fluency is the foundation for every subsequent graduate course in algebra, number theory, or algebraic geometry, and it is the reason PMATH 945 begins here roughly every third year.

---

# Chapter 2: Non-local Games and Operator Algebras

Taught at UW as PMATH 945 in Fall 2019 by William Slofstra.

Can two cooperating players, physically separated and unable to communicate, win a coordination game more often if they share entangled quantum particles than if they share classical randomness? The question is a century old; the answer — unambiguously yes — has turned out to be the gateway to some of the deepest results in operator-algebra theory of the last decade. Slofstra's course took students from the statement of the CHSH game through the 2020 theorem \(\mathrm{MIP}^* = \mathrm{RE}\), which resolves in the negative Alain Connes's 1976 embedding conjecture — arguably the central open problem of the field of von Neumann algebras.

<div class="definition">
<strong>Definition 2.1 (Nonlocal game).</strong> A <em>nonlocal game</em> \(G = (X, Y, A, B, \pi, V)\) has finite question sets \(X, Y\), finite answer sets \(A, B\), a probability distribution \(\pi\) on \(X \times Y\), and a verification predicate \(V \colon X \times Y \times A \times B \to \{0, 1\}\). Two cooperating players receive questions \(x, y\) from \(\pi\), respond with answers \(a, b\) drawn from a pre-agreed strategy (but cannot communicate), and win iff \(V(x, y, a, b) = 1\).
</div>

<div class="example">
<strong>Example 2.2 (CHSH game).</strong> Take \(X = Y = A = B = \{0, 1\}\), \(\pi\) uniform, and \(V(x, y, a, b) = 1\) iff \(a \oplus b = x \cdot y\). The best classical strategy wins with probability \(3/4\); a shared Bell pair together with suitably rotated Pauli measurements achieves \(\cos^2(\pi/8) \approx 0.854\), matching Tsirelson's bound. This single example shows that entanglement <em>strictly enlarges</em> the set of correlations achievable in a coordination game — the launch point of the entire field.
</div>

The course's conceptual engine is the distinction between **tensor-product** and **commuting-operator** strategies. A tensor-product strategy on a nonlocal game uses a state \(|\psi\rangle \in \mathcal{H}_A \otimes \mathcal{H}_B\) and local POVMs \(\{A^a_x\}, \{B^b_y\}\) on the two factors; the winning probability is \(\omega^*(G)\), the tensor-product value. A commuting-operator strategy uses a single Hilbert space with two commuting families of POVMs \([A^a_x, B^b_y] = 0\); its supremum is \(\omega^{co}(G)\). For finite-dimensional systems the two agree, but in infinite dimension \(\omega^*(G)\) is only a dense subset of \(\omega^{co}(G)\).

<div class="theorem">
<strong>Theorem 2.3 (Slofstra 2019).</strong> There exists a synchronous nonlocal game \(G\) with \(\omega^*(G) < \omega^{co}(G)\). Consequently the set of tensor-product quantum correlations is not closed, and <em>Tsirelson's problem</em> has a negative answer.
</div>

Slofstra's proof produces an explicit game from a finitely presented group whose profinite completion fails to be residually finite — a combinatorial construction that bypasses the analytical difficulties of previous approaches. The 2020 theorem of **Ji, Natarajan, Vidick, Wright, and Yuen** then upgrades this existence result to an uncomputability statement.

<div class="theorem">
<strong>Theorem 2.4 (JNVWY, 2020).</strong> The complexity class \(\mathrm{MIP}^*\) of languages decidable by multi-prover interactive proofs with shared entanglement equals \(\mathrm{RE}\), the class of recursively enumerable languages.
</div>

As a corollary, \(\omega^*(G)\) is uncomputable in general while \(\omega^{co}(G)\) is co-recursively enumerable; if the two coincided both would be computable, contradiction. Hence they differ, hence **Tsirelson's problem fails**, hence — by the Junge–Navascués–Palazuelos–Pérez-García–Scholz–Werner / Fritz / Ozawa equivalence — **Connes's embedding conjecture fails**: there exist separable type \(\mathrm{II}_1\) factors not embeddable into the ultrapower of the hyperfinite factor.

<div class="remark">
<strong>Why PMATH students should care.</strong> One rarely sees a complexity-theoretic theorem settle a 45-year-old question in operator algebras. The translation between nonlocal games, tracial von Neumann algebras, and computability goes through three non-trivial equivalences, each requiring a distinct technique. The course is a tour of those three bridges — and an argument that the boundary between "pure" and "applied" mathematics in the 21st century is considerably thinner than graduate students often suppose.
</div>

The closing lectures surveyed the **research program that survives**: the proofs are constructive but not transparent, and one of the major projects in operator algebras since 2020 has been to extract a *humanly understandable* non-embeddable factor — one specified by group-algebra or random-matrix data rather than by simulation of a universal Turing machine. Slofstra's own earlier work on embeddability of correlations through groups is the natural entry point.

---

# Chapter 3: Operator Algebras and Quantum Information

Taught at UW as PMATH 945 in Winter 2020 by Vern Paulsen.

If quantum states are unit vectors in a Hilbert space and quantum dynamics is unitary, why does the mathematics of actual quantum experiments live in \(C^*\)-algebras, density operators, and completely positive maps? Because the moment you admit measurement, classical communication, and coupling to an environment, the pure-state picture is no longer closed under the operations you need. Paulsen's course developed the enlarged framework — operator systems, completely bounded maps, dilation theorems — that quantum information has come to rely on, with a distinctive operator-space flavour that is Paulsen's research specialty.

<div class="definition">
<strong>Definition 3.1 (Completely positive map).</strong> A linear map \(\Phi \colon \mathcal{A} \to \mathcal{B}\) between unital \(C^*\)-algebras is <em>completely positive (CP)</em> if for every \(n \ge 1\) the amplified map \(\Phi^{(n)} \colon M_n(\mathcal{A}) \to M_n(\mathcal{B})\), \(\Phi^{(n)}(X_{ij}) = (\Phi(X_{ij}))\), sends positive matrices to positive matrices. It is <em>unital</em> if \(\Phi(1) = 1\) and <em>completely bounded (cb)</em> if \(\|\Phi\|_{cb} = \sup_n \|\Phi^{(n)}\| < \infty\).
</div>

Complete positivity is *strictly stronger* than positivity. The prototypical counterexample — the transpose map on \(M_n(\mathbb{C})\) — is positive but not 2-positive, which is a pithy way to say that a physically sensible operation on one system fails to be a physically sensible operation when an inert ancilla is attached. This failure detects entanglement (the Peres–Horodecki criterion for low dimensions).

<div class="theorem">
<strong>Theorem 3.2 (Stinespring's Dilation Theorem).</strong> Let \(\Phi \colon \mathcal{A} \to \mathcal{B}(\mathcal{K})\) be a CP map on a unital \(C^*\)-algebra. There exist a Hilbert space \(\mathcal{H}\), a \(*\)-representation \(\pi \colon \mathcal{A} \to \mathcal{B}(\mathcal{H})\), and a bounded linear \(V \colon \mathcal{K} \to \mathcal{H}\) with
\[ \Phi(a) = V^* \pi(a) V. \]
The triple is minimal and essentially unique, and \(V\) is an isometry iff \(\Phi\) is unital.
</div>

Specialized to quantum channels \(\Phi \colon \mathcal{B}(\mathcal{H}_A) \to \mathcal{B}(\mathcal{H}_B)\), the theorem becomes the physicist's "every open-system evolution is unitary on a larger closed system": \(\Phi(X) = V^*(X \otimes I_E)V\) for some isometry \(V\) into an environment tensor factor. The dual **Kraus form** \(\Phi(\rho) = \sum_k A_k \rho A_k^*\) with \(\sum A_k^* A_k = I\) is the computational presentation used in actual numerics.

<div class="example">
<strong>Example 3.3 (Choi matrix).</strong> For \(\Phi \colon M_n \to M_m\), the <em>Choi matrix</em> is \(C_\Phi = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij}) \in M_n(M_m)\). Then \(\Phi\) is CP iff \(C_\Phi\) is positive semidefinite. This finite-dimensional criterion is what every practical CP-verification in quantum information reduces to.
</div>

**Operator systems and the cb-norm.** A unital self-adjoint subspace \(V \subseteq \mathcal{B}(\mathcal{H})\) inherits matrix norms \(\|\cdot\|_n\) from its amplifications. Morphisms between operator systems are UCP maps; the right metric on channels is the **diamond norm** \(\|\Phi\|_\diamond = \|\Phi \otimes \mathrm{id}\|_{1 \to 1}\), which by operator-space duality is exactly the cb-norm on the trace-class predual. The diamond norm is the operational metric: it measures how well two channels can be distinguished by any single-shot experiment with an entangled probe.

<div class="theorem">
<strong>Theorem 3.4 (Arveson's extension theorem).</strong> A CP map from an operator system \(V \subseteq \mathcal{A}\) to \(\mathcal{B}(\mathcal{K})\) extends to a CP map on all of \(\mathcal{A}\), with the same cb-norm. Equivalently, \(\mathcal{B}(\mathcal{K})\) is <em>injective</em> in the category of operator systems with UCP morphisms.
</div>

Arveson's theorem is the operator-algebraic Hahn–Banach: it is the reason one can move freely between channels, dilations, and POVMs without the gymnastics that would otherwise be required. The course closed with modern applications — **semidefinite programs for quantum information** (Watrous), **quantum codes from operator systems** (Beny–Oreshkov), and a view of **operator-space tensor products** as the correct framework for multi-party entanglement.

---

# Chapter 4: Clifford Algebras and Spin Geometry

Taught at UW as PMATH 945 in Fall 2020 by Spiro Karigiannis.

The \(\widehat A\)-genus. The index of the Dirac operator. The \(G_2\)-holonomy manifolds relevant to M-theory. The mod-\(8\) periodicity of real Clifford algebras that is Bott periodicity in disguise. Karigiannis's course built the algebraic machinery — Clifford algebras, Pin and Spin groups, spinor representations — precisely to the point where these geometric invariants come into view, then spent the last third of the term using them to classify the exceptional Riemannian holonomies that physicists now take for granted.

<div class="definition">
<strong>Definition 4.1 (Clifford algebra).</strong> For \((V, q)\) a finite-dimensional real or complex vector space with non-degenerate quadratic form, the Clifford algebra \(\mathrm{Cl}(V, q)\) is the quotient of the tensor algebra \(T(V)\) by the two-sided ideal generated by \(v \otimes v - q(v) \cdot 1\). It is \(\mathbb{Z}/2\)-graded, has dimension \(2^{\dim V}\), and is canonically isomorphic to \(\Lambda^* V\) as a vector space.
</div>

**Mod-8 periodicity.** For \(V = \mathbb{R}^n\) with standard positive-definite \(q\), the Clifford algebras \(\mathrm{Cl}_{n,0}(\mathbb{R})\) realize every finite-dimensional real associative division algebra in a mod-\(8\) cycle: \(\mathbb{R}, \mathbb{C}, \mathbb{H}, \mathbb{H} \oplus \mathbb{H}, \mathrm{M}_2(\mathbb{H}), \mathrm{M}_4(\mathbb{C}), \mathrm{M}_8(\mathbb{R}), \mathrm{M}_8(\mathbb{R}) \oplus \mathrm{M}_8(\mathbb{R})\), then repeat with a factor of \(16\). This periodicity is Bott's eight-fold periodicity of real K-theory restated, and it is the reason spin geometry looks qualitatively different in dimensions 4, 8, and 12 from dimensions 1, 3, and 9.

<div class="example">
<strong>Example 4.2 (Pauli matrices are Clifford).</strong> In \(\mathrm{Cl}(\mathbb{R}^3)\), identifying basis vectors \(e_i\) with the Pauli matrices \(\sigma_i\) shows \(\sigma_i^2 = I\) and \(\sigma_i \sigma_j = -\sigma_j \sigma_i\) for \(i \ne j\) — the Clifford relations. This is why spin-\(\tfrac{1}{2}\) particles in quantum mechanics are <em>literally</em> Clifford module elements.
</div>

<div class="definition">
<strong>Definition 4.3 (Spin structure).</strong> An oriented Riemannian \(n\)-manifold \((M, g)\) admits a <em>spin structure</em> if the structure group of its oriented orthonormal frame bundle lifts from \(\mathrm{SO}(n)\) to \(\mathrm{Spin}(n)\) along the double cover \(\mathrm{Spin}(n) \to \mathrm{SO}(n)\). Such a lift exists iff \(w_2(M) = 0\), and the set of spin structures is a torsor over \(H^1(M; \mathbb{Z}/2)\).
</div>

<div class="theorem">
<strong>Theorem 4.4 (Atiyah–Singer, spin case).</strong> Let \(M\) be a compact even-dimensional spin manifold with Dirac operator \(\slashed D \colon \Gamma(S^+) \to \Gamma(S^-)\). Then
\[ \operatorname{ind}(\slashed D) = \int_M \widehat A(M), \]
where \(\widehat A(M)\) is the \(\widehat A\)-genus, a polynomial in the Pontryagin classes.
</div>

This is one of the towering theorems of twentieth-century mathematics. It unifies topology, geometry, and analysis in a single formula: the analytic index of a differential operator (a homotopy invariant) equals a topological integral (a characteristic-class invariant). As a first corollary, a positive-scalar-curvature compact spin manifold has vanishing \(\widehat A\)-genus (Lichnerowicz).

<div class="remark">
<strong>Special-holonomy geometry.</strong> Berger's classification of possible irreducible non-symmetric Riemannian holonomy groups yields the list \(\mathrm{SO}(n), \mathrm{U}(k), \mathrm{SU}(k), \mathrm{Sp}(k), \mathrm{Sp}(k)\mathrm{Sp}(1), G_2\) (dim 7), \(\mathrm{Spin}(7)\) (dim 8). Each entry produces a distinctive calibrated geometry (Harvey–Lawson): associative 3-folds in \(G_2\)-manifolds, Cayley 4-folds in \(\mathrm{Spin}(7)\)-manifolds, complex and special Lagrangian submanifolds in Calabi–Yau. These geometries are the stage on which M-theory compactifications are built, and the algebraic machinery of spin geometry is what lets one write down the relevant differential forms at all.
</div>

The course's closing lecture sketched Karigiannis's own research on \(G_2\) manifolds and their moduli — an area where concrete examples are still actively being constructed and where Waterloo hosts a leading group.

---

# Chapter 5: Rings and Categorical Ring Theory

Taught at UW as PMATH 945 in Winter 2021 and Fall 2024 by Jason Bell.

Modern ring theory and scheme theory are not separate subjects that happen to overlap. They are two descriptions of the same category — affine schemes \(\operatorname{Spec}\) being the Yoneda embedding of commutative rings into sheaves. Bell's course took this principle at face value and rebuilt ring theory from the functor-of-points perspective that Grothendieck introduced in the 1960s and that every contemporary algebraic geometer speaks fluently.

<div class="definition">
<strong>Definition 5.1 (Spectrum and structure sheaf).</strong> For a commutative ring \(R\), the <em>prime spectrum</em> \(\operatorname{Spec}(R)\) is the set of prime ideals equipped with the Zariski topology, whose closed sets are vanishing loci \(V(I) = \{\mathfrak{p} : I \subseteq \mathfrak{p}\}\). The <em>structure sheaf</em> \(\mathcal{O}_{\operatorname{Spec}(R)}\) has stalks \(\mathcal{O}_{\mathfrak{p}} = R_{\mathfrak{p}}\) and is defined on basic opens \(D(f) = \{\mathfrak{p} : f \notin \mathfrak{p}\}\) by \(\Gamma(D(f), \mathcal{O}) = R[f^{-1}]\).
</div>

<div class="theorem">
<strong>Theorem 5.2 (Yoneda for rings).</strong> The functor \(R \mapsto h_R = \operatorname{Hom}_{\mathbf{Ring}}(R, -) \colon \mathbf{Ring} \to \mathbf{Set}^{\mathbf{Ring}}\) is fully faithful. Equivalently, a commutative ring is determined by its <em>functor of points</em> — the functor it represents on all other commutative rings.
</div>

This single theorem has pedagogical payoff throughout. The tensor product of rings over \(\mathbb{Z}\) represents the product \(h_R \times h_S\); the localization \(R[f^{-1}]\) represents the open subfunctor where \(f\) is invertible; the quotient \(R/I\) represents the closed subfunctor cutting out \(I\). Every ring-theoretic operation acquires a geometric counterpart, and a geometric intuition that was previously available only through "drawing pictures" of schemes becomes literally computational.

<div class="example">
<strong>Example 5.3 (Nilradical via categorical logic).</strong> The nilradical \(\sqrt 0\) of \(R\) is the intersection of all primes, \(\sqrt 0 = \bigcap_{\mathfrak{p} \in \operatorname{Spec}(R)} \mathfrak{p}\), which in functor-of-points language says: "\(f\) is nilpotent iff \(f\) vanishes at every point." Passing to \(R_\mathrm{red} = R/\sqrt 0\) is the left adjoint of the inclusion \(\mathbf{Ring}_\mathrm{red} \hookrightarrow \mathbf{Ring}\), and its unit \(R \to R_\mathrm{red}\) is the universal map to a reduced ring. Adjoint functors and categorical quotients are therefore not decoration — they are the literal content of classical ring-theoretic constructions.
</div>

**Grothendieck topologies.** The Zariski topology on \(\mathbf{Ring}^{\mathrm{op}}\) is one of many. Bell's course introduced three others: the **étale topology**, where covers are families of étale morphisms jointly surjective, whose sheaf cohomology recovers singular cohomology for smooth varieties over \(\mathbb{C}\); the **fppf topology** (faithfully flat, finitely presented), which classifies torsors for algebraic groups; and the **fpqc topology** (faithfully flat, quasi-compact), the finest useful topology and the natural home of descent theory.

<div class="remark">
<strong>Why multiple topologies.</strong> The apparent plurality of "algebraic geometries" — Zariski vs. étale vs. fppf — reflects the fact that different invariants require different notions of "local". Counting \(\mathbb{F}_q\)-points, computing torsors, or detecting Galois-equivariant structure each demands a topology fine enough to see the relevant gluings. Bell's course argued that the right way to approach any problem in modern commutative algebra is to ask first which site it lives on.
</div>

The course closed with a lecture on **derived algebraic geometry** — where commutative rings are replaced by simplicial commutative rings or \(E_\infty\)-ring spectra — as preview material for students heading into Lurie's *Higher Algebra* or the forthcoming PMATH 945 offering on schemes.

---

# Chapter 6: Category Theory and Quantum Logic

Taught at UW as PMATH 945 in Winter 2026 by Jason Bell.

Does a quantum system *have* properties in the absence of measurement? Bohr said no; Einstein was unhappy; Kochen and Specker proved in 1967 that the answer in any noncommutative algebra of observables is, necessarily, *no* — there is no internally consistent assignment of definite values. Bell's later offerings of PMATH 945 translated this physical impossibility into mathematical structure: the category-theoretic framework in which "quantum phase space" is a well-defined mathematical object, but a point-free one. The course is aimed at students drawn to the foundations of physics, topos theory, or sheaves of algebras — three audiences the material serves simultaneously.

<div class="definition">
<strong>Definition 6.1 (Spectral presheaf).</strong> Let \(\mathcal{A}\) be a unital \(C^*\)-algebra and let \(\mathcal{V}(\mathcal{A})\) be the poset of commutative unital \(C^*\)-subalgebras of \(\mathcal{A}\), ordered by inclusion. The <em>spectral presheaf</em> \(\underline{\Sigma}_{\mathcal{A}}\) is the presheaf on \(\mathcal{V}(\mathcal{A})\) assigning to each \(V \in \mathcal{V}(\mathcal{A})\) its Gelfand spectrum \(\Sigma(V)\), with restriction maps dual to inclusions of subalgebras.
</div>

Because each \(\Sigma(V)\) is a classical (commutative) space — the set of characters of a commutative \(C^*\)-algebra — the spectral presheaf glues together the "classical windows" onto \(\mathcal{A}\) along the inclusion poset. Isham–Butterfield, Döring, and Heunen–Landsman–Spitters develop this gluing into a topos-theoretic framework in which the internal logic of the topos encodes quantum mechanics.

<div class="theorem">
<strong>Theorem 6.2 (Kochen–Specker, topos form).</strong> For \(\mathcal{A} = \mathcal{B}(\mathcal{H})\) with \(\dim \mathcal{H} \ge 3\), the spectral presheaf \(\underline{\Sigma}_{\mathcal{A}}\) has no global sections — there is no natural transformation \(1 \to \underline{\Sigma}_{\mathcal{A}}\). Equivalently, there is no assignment \(v \colon \mathcal{B}(\mathcal{H})_{\mathrm{sa}} \to \mathbb{R}\) satisfying \(v(A) \in \sigma(A)\) and \(v(f(A)) = f(v(A))\) for all continuous \(f\).
</div>

The absence of global sections is Kochen–Specker's classical statement (1967) but recast as a theorem about sheaves: the quantum phase space fails to have points. The inner logic of the presheaf topos is therefore non-Boolean — specifically, it is an intuitionistic Heyting algebra of open subobjects. Propositions compose as in ordinary logic, but the law of excluded middle fails.

<div class="example">
<strong>Example 6.3 (Truth values in Bohr's topos).</strong> In \(\mathbf{Sh}(\mathcal{V}(\mathcal{A}))\), the "truth value" of a proposition about an observable \(A\) at a state \(\rho\) is a <em>sieve</em> in \(\mathcal{V}(\mathcal{A})\) — the set of commutative subalgebras in which the proposition is classically verified. Classical two-valued logic is recovered only when \(\mathcal{A}\) itself is commutative; the generic noncommutative case yields a multi-valued logic whose internal structure encodes the quantum mechanical uncertainty relations.
</div>

<div class="remark">
<strong>Bohrification.</strong> The operational core of the approach is to regard a noncommutative \(\mathcal{A}\) as a commutative ring <em>internal to its own topos of commutative subalgebras</em>. This is Bohr's "every quantum statement must ultimately be expressed classically" elevated to a mathematical principle. Connes's noncommutative-geometry program and Döring–Isham–Heunen's topos-theoretic program are two distinct but compatible answers to the question of what a "quantum space" is.
</div>

The course closed with a comparison: Birkhoff–von Neumann orthomodular quantum logic (1936, non-distributive), partial Boolean algebras (Kochen–Specker, 1967), Heyting algebras from topos theory (Isham–Butterfield, 1998 onward) — three distinct mathematical objects answering the same physical question, and Bell's lectures made the case that the topos-theoretic answer is the one that integrates most cleanly with categorical algebra and sheaf theory.

---

# Chapter 7: Arithmetic Dynamics

Planned at UW as PMATH 945 in Fall 2026.

Iteration of a polynomial map \(\phi \colon \mathbb{C} \to \mathbb{C}\) produces the Mandelbrot set, Julia sets, and the entire 20th-century industry of complex dynamics. Replace \(\mathbb{C}\) by a number field \(K\), or by \(\mathbb{C}_p\), and you enter arithmetic dynamics: the same questions about orbits and periodic points, but with Diophantine geometry and \(p\)-adic analysis as your tools. The subject has grown from Silverman's 2007 textbook into a rich research area with connections to elliptic curves, moduli spaces, and the Langlands program.

<div class="definition">
<strong>Definition 7.1 (Preperiodic points).</strong> Let \(\phi \colon \mathbb{P}^1_K \to \mathbb{P}^1_K\) be a morphism of degree \(d \ge 2\) over a number field \(K\). A point \(P \in \mathbb{P}^1(\overline K)\) is <em>preperiodic</em> if its forward orbit \(\{P, \phi(P), \phi^2(P), \ldots\}\) is finite; equivalently, some iterate \(\phi^n(P)\) is <em>periodic</em> (\(\phi^m(\phi^n(P)) = \phi^n(P)\) for some \(m \ge 1\)).
</div>

<div class="theorem">
<strong>Theorem 7.2 (Northcott 1950, dynamical form).</strong> The set of \(\phi\)-preperiodic points in \(\mathbb{P}^1(K)\) is finite for every number field \(K\). More strongly, there exists \(B = B([K:\mathbb{Q}], d)\) bounding the number of preperiodic points in \(\mathbb{P}^1(K)\) uniformly.
</div>

This is the dynamical analogue of the Mordell–Weil theorem for elliptic curves, and its proof mirrors the classical proof of Northcott's theorem for heights on projective space — but using a *canonical* height tailored to \(\phi\).

<div class="definition">
<strong>Definition 7.3 (Canonical height).</strong> The <em>canonical height</em> associated with \(\phi\) is
\[ \hat h_\phi(P) = \lim_{n \to \infty} \frac{h(\phi^n(P))}{d^n}, \]
where \(h\) is the Weil height. It satisfies the functional equation \(\hat h_\phi(\phi(P)) = d \cdot \hat h_\phi(P)\), vanishes exactly on preperiodic points, and is positive otherwise.
</div>

<div class="example">
<strong>Example 7.4 (Elliptic curves as dynamics).</strong> An elliptic curve \(E\) over \(K\) with a chosen non-torsion point \(Q\) induces a self-map \(\phi \colon E \to E\), \(\phi(P) = P + Q\), whose orbits are the cosets of \(\mathbb{Z} Q\). The Néron–Tate canonical height on \(E\) is precisely \(\hat h_\phi\), and Mordell–Weil becomes a theorem about \(\phi\)-orbits. Silverman's program — of which the 2026 course is the pedagogical outgrowth — views arithmetic dynamics as a far-reaching generalization of this dictionary.
</div>

<div class="theorem">
<strong>Theorem 7.5 (Equidistribution; Baker–Rumely, Chambert-Loir, Yuan).</strong> Let \(\phi\) be a rational map of degree \(d \ge 2\) over a number field, and let \(P_n\) be a sequence of \(\overline K\)-points of \(\phi\) with \(\hat h_\phi(P_n) \to 0\). Then the Galois conjugates of \(P_n\) equidistribute with respect to the <em>canonical adelic measure</em> \(\mu_\phi\) — simultaneously at every place of \(K\), including the non-archimedean (Berkovich) places.
</div>

The equidistribution theorem is the dynamical analogue of the Bilu–Szpiro–Zhang equidistribution for abelian varieties, and it powers most modern proofs of dynamical rigidity results — including partial progress on the **dynamical Manin–Mumford conjecture** of Zhang, which asserts that a subvariety of \((\mathbb{P}^1)^N\) containing a Zariski-dense set of preperiodic points under a coordinate-wise action is itself preperiodic.

<div class="remark">
<strong>Moduli of dynamical systems.</strong> The set of degree-\(d\) rational maps up to conjugacy forms a moduli space \(\mathcal M_d\) — a variety in its own right — and questions like "how often does a random degree-\(d\) map have a rational preperiodic point?" become questions about arithmetic on \(\mathcal M_d\). This is one of the fastest-growing research frontiers in the field, and the 2026 course will introduce it alongside the classical one-variable theory.
</div>

The course suits both number theorists wanting a new perspective on heights and \(L\)-functions, and complex-dynamics students who want to see their subject merged with Diophantine geometry. Either audience leaves with a working command of the canonical height, the Berkovich projective line, and the equidistribution theorem — three tools whose utility has spread far beyond dynamics in the last twenty years.
