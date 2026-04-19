---
title: "CO 739: Topics in Combinatorics"
subjects: "CO"
---

*These notes synthesize material from seven incarnations of CO 739 (Topics in Combinatorics) at the University of Waterloo. CO 739 is a special-topics graduate course whose subject changes every offering, so each chapter below presents an independent self-contained tour of one offering's theme. Sources used: Borcea and Brändén, <em>The Lee--Yang and Pólya--Schur programs</em> (arXiv:0809.0401, 0809.3087); Marcus, Spielman, and Srivastava, <em>Interlacing families I, II</em> (arXiv:1304.4132, 1306.3969); Sweedler, <em>Hopf Algebras</em> (Benjamin, 1969); Connes and Kreimer, <em>Hopf algebras, renormalization and noncommutative geometry</em> (arXiv:hep-th/9808042) and sequels; Matoušek, <em>Using the Borsuk--Ulam Theorem</em> (Springer Universitext, 2003); Björner, <em>Topological methods</em> (Handbook of Combinatorics, ch. 34); Cover and Thomas, <em>Elements of Information Theory</em> (Wiley, 2nd ed.); Fulton, <em>Introduction to Toric Varieties</em> (Princeton, 1993); and a variety of public lecture notes by the instructors and others. Each chapter opens with a banner identifying the term and instructor.*

---

# Chapter 1: Stable Polynomials

Taught at UW as CO 739 in Winter 2016 by David Wagner.

## 1.1 The Stability Condition and Its Geometry

Wagner's Winter 2016 course centred on the theory of <em>stable polynomials</em>, an analytic-combinatorial framework whose roots lie in the Lee--Yang theory of statistical mechanics and whose modern flowering — through the work of Borcea, Brändén, Marcus, Spielman, Srivastava, and others — has provided spectacular applications ranging from the Kadison--Singer problem to the existence of bipartite Ramanujan graphs of every degree. The unifying idea is that one studies polynomials by tracking the location of their zeros in the complex plane.

<div class="definition">
<strong>Definition 1.1 (Stable polynomial).</strong> A polynomial \(p \in \mathbb{C}[z_1, \ldots, z_n]\) is called <em>stable</em> if \(p(z_1, \ldots, z_n) \neq 0\) whenever \(\operatorname{Im}(z_i) > 0\) for every \(i = 1, \ldots, n\). A polynomial with real coefficients that is stable is called <em>real stable</em>. In one variable, real stability is equivalent to having all real zeros.
</div>

The stability condition can be phrased as: \(p\) is stable if and only if it has no zeros in the open multivariate upper half-plane \(\mathcal{H}^n\), where \(\mathcal{H} = \{z \in \mathbb{C} : \operatorname{Im}(z) > 0\}\). The constant zero polynomial is excluded by convention. The class of (real) stable polynomials is closed under a surprisingly rich list of operations: scaling, multiplication, specialization \(z_i \mapsto a \in \mathbb{R}\), differentiation \(\partial/\partial z_i\), and inversion \(z_i \mapsto -1/z_i\) followed by clearing denominators.

<div class="theorem">
<strong>Theorem 1.2 (Hurwitz's theorem on zero sets).</strong> Suppose \((p_k)_{k\ge 1}\) is a sequence of polynomials in \(\mathbb{C}[z_1, \ldots, z_n]\), all stable, converging uniformly on compact subsets of \(\mathcal{H}^n\) to a polynomial \(p\). Then either \(p \equiv 0\) on \(\mathcal{H}^n\) or \(p\) is itself stable.
</div>

Hurwitz's theorem is the analytic backbone of stability theory: it ensures that the class of stable polynomials is closed under various limiting procedures, and it underpins virtually every existence proof in the subject. A typical application is the verification that operations such as polarization or symmetrization preserve stability.

## 1.2 The Borcea--Brändén Classification

The high point of the modern theory is the classification, by Julius Borcea and Petter Brändén, of the linear operators on \(\mathbb{C}[z]\) (and its multivariate analogues) that preserve stability. This solves a problem traceable through Pólya, Schur, and de Bruijn back to the nineteenth century.

<div class="theorem">
<strong>Theorem 1.3 (Borcea--Brändén, 2009).</strong> A linear operator \(T : \mathbb{C}[z] \to \mathbb{C}[z]\) preserves the class of stable polynomials (and is not of the trivial form mapping all polynomials to a constant multiple of a fixed stable polynomial) if and only if its symbol

\[
G_T(z, w) \;=\; \sum_{k=0}^{\infty} T(z^k) \, \frac{(-w)^k}{k!}
\]

is itself a stable polynomial in two variables (modulo a normalization).
</div>

The Borcea--Brändén theorem subsumes the classical Pólya--Schur theorem, which characterizes <em>multiplier sequences</em>: real sequences \((\lambda_k)\) such that \(\sum a_k z^k\) having all real zeros implies \(\sum \lambda_k a_k z^k\) has all real zeros. It also subsumes a vast number of older identities by Laguerre, Hermite, and others.

## 1.3 Combinatorial Applications and Negative Dependence

For combinatorialists, the dramatic payoff of stability theory is its connection to <em>negative dependence</em> of random variables and to combinatorial generating polynomials. Brändén proved that the support of a real stable polynomial — the set of multidegrees with nonzero coefficient — is a <em>jump system</em>; a special case is the famous theorem that the matroid polytope is the support of a stable polynomial whenever the matroid generating polynomial \(\sum_{B} \prod_{i \in B} z_i\) (sum over bases \(B\)) is stable. The matroids for which this holds are precisely the regular matroids and a richer class identified by Brändén.

<div class="example">
<strong>Example 1.4 (Spanning trees).</strong> Let \(G\) be a finite undirected graph with edge set \(E\). The <em>spanning tree polynomial</em>

\[
T_G(z) \;=\; \sum_{T \text{ spanning tree of } G} \;\prod_{e \in T} z_e
\]

is real stable in the variables \((z_e)_{e \in E}\). Equivalently the indicators of edges in a uniform random spanning tree are <em>negatively associated</em>. This was the classical motivating example of Choe, Oxley, Sokal, and Wagner.
</div>

<div class="theorem">
<strong>Theorem 1.5 (Marcus--Spielman--Srivastava).</strong> For every integer \(d \ge 3\) there exists an infinite family of \(d\)-regular bipartite Ramanujan graphs, i.e., graphs whose nontrivial adjacency eigenvalues all lie in \(\left[-2\sqrt{d-1}, 2\sqrt{d-1}\right]\).
</div>

The proof, sketched in lectures, is a virtuoso application of the <em>method of interlacing families</em>. One considers the expected characteristic polynomial of a random 2-lift of a base graph, proves that this expected polynomial is a convex combination of polynomials with a common interlacer, and concludes that some 2-lift achieves the desired bound. Real-rootedness of the expected polynomial is established via stability preservers.

<div class="remark">
<strong>Remark 1.6 (Hyperbolic polynomials).</strong> A homogeneous polynomial \(p \in \mathbb{R}[x_1, \ldots, x_n]\) is called <em>hyperbolic</em> with respect to a direction \(e \in \mathbb{R}^n\) if \(p(e) \neq 0\) and the univariate polynomial \(t \mapsto p(x + t e)\) has only real roots for every \(x \in \mathbb{R}^n\). Hyperbolic polynomials generalize stable polynomials and form the analytic backbone of <em>hyperbolic programming</em>, an extension of semidefinite programming. The Gårding cone of a hyperbolic polynomial supplies a self-concordant barrier function, and it was through this lens that Marcus, Spielman, and Srivastava were able to resolve the Kadison--Singer problem.
</div>

The Lee--Yang circle theorem of statistical mechanics — that the partition function of the ferromagnetic Ising model has all its zeros on the unit circle in the complex fugacity variable — was the historical impetus for the entire subject. Wagner's lectures traced the arc from Lee--Yang through the Heilmann--Lieb theorem on matching polynomials to the contemporary applications.

# Chapter 2: Combinatorics of Feynman Diagrams

Taught at UW as CO 739 in Winter 2018 by Karen Yeats.

## 2.1 Perturbative Quantum Field Theory as Combinatorics

Yeats's Winter 2018 course made the case that perturbative quantum field theory, stripped of its analytic baggage, is fundamentally a combinatorial enterprise. A scalar quantum field theory's path integral expansion produces, term by term, a formal power series whose coefficients are sums over <em>Feynman diagrams</em> — finite graphs whose edges represent propagating particles and whose vertices represent interactions. Each diagram contributes a number — its <em>Feynman integral</em> — and the assembly of these contributions encodes the physical predictions of the theory.

<div class="definition">
<strong>Definition 2.1 (Feynman diagram).</strong> Fix a quantum field theory specified by a Lagrangian. A <em>Feynman diagram</em> for that theory is a finite multigraph (allowing loops and multiple edges) whose vertices are labelled by interaction types of the theory and whose edges are labelled by particle species, subject to the constraint that the half-edges meeting at each vertex match an interaction term of the Lagrangian. A diagram with no external (half-edge) legs is called a <em>vacuum diagram</em>; those with prescribed external legs are called <em>amplitudes</em>.
</div>

For a scalar \(\phi^4\) theory the only interaction vertex is 4-valent and the only edge type is the scalar propagator. A 1-loop vacuum diagram is then a single vertex with two loops attached; a 2-loop vacuum diagram is the so-called <em>sunset</em>. Counting these diagrams and weighting them by the appropriate symmetry factor reduces vast tracts of perturbative QFT to enumerative combinatorics.

<div class="theorem">
<strong>Theorem 2.2 (Connected = log of all).</strong> Let \(Z(\hbar)\) be the formal power series whose coefficient of \(\hbar^n\) is the weighted sum of all (not necessarily connected) vacuum diagrams with \(n\) loops, and let \(W(\hbar)\) be the analogous sum over <em>connected</em> vacuum diagrams. Then

\[
Z(\hbar) \;=\; \exp \bigl( W(\hbar) \bigr).
\]

The same formula holds in the multivariate setting that tracks vertex types separately.
</div>

This identity is the combinatorial heart of the cluster expansion: the all-graph generating function is the exponential of the connected-graph generating function, a manifestation of the exponential formula for labelled species.

## 2.2 Periods and Parametric Integration

For a connected graph \(G\), the parametric Feynman integral can be written as an integral over the projective simplex,

\[
I_G \;=\; \int_{\sigma_G} \frac{\Omega}{\psi_G^2},
\]

where \(\psi_G(\alpha) = \sum_{T} \prod_{e \notin T} \alpha_e\) is the <em>first Symanzik polynomial</em> (the Kirchhoff polynomial of \(G\), summed over spanning trees \(T\)). When \(I_G\) converges it is a <em>period</em> in the sense of Kontsevich and Zagier, often expressible in terms of multiple zeta values.

<div class="example">
<strong>Example 2.3 (The wheel with three spokes).</strong> The four-loop primitive divergent graph \(W_3\), the wheel with three spokes, has Feynman period equal to \(6\,\zeta(3)\). Higher wheels \(W_n\) give the values \(\binom{2n-2}{n-1}\zeta(2n-3)\), a beautiful pattern first observed by Broadhurst and Kreimer. The pattern of zeta values appearing in primitive periods at low loop order is part of the <em>cosmic Galois</em> conjectures connecting QFT to motivic Galois theory.
</div>

## 2.3 Schwinger--Dyson Equations and Tree-Like Recursion

A complementary combinatorial structure is provided by <em>Schwinger--Dyson equations</em>, which express the full Green's function of a theory as a fixed-point equation in the algebra of formal series indexed by graphs. For QFT models with a single primitive divergent graph, Yeats and collaborators have shown that the resulting fixed-point equation is exactly soluble as a continued fraction, and that the chord-diagram expansion of its solution captures precise information about the asymptotic behaviour of the perturbative series.

<div class="definition">
<strong>Definition 2.4 (Chord diagram).</strong> A <em>chord diagram</em> on \(2n\) points is a perfect matching of \(2n\) points arranged on a circle; equivalently, a fixed-point-free involution on \(\{1, \ldots, 2n\}\). A chord diagram is <em>connected</em> if no proper arc of the circle is matched entirely to itself.
</div>

<div class="theorem">
<strong>Theorem 2.5 (Marie--Yeats).</strong> The Green's function of a Schwinger--Dyson equation built from a single primitive insertion admits a closed-form expansion in connected chord diagrams: each diagram contributes a monomial in the loop-counting parameter weighted by the product of intersection numbers of its chords with a base chord. This recasts a transcendental fixed-point equation as a purely enumerative identity.
</div>

<div class="remark">
<strong>Remark 2.6 (No physics required).</strong> Yeats's course was advertised as physics-free: the combinatorial structures (graphs, polynomials, Hopf algebras) are interesting in their own right, and the physical motivation merely <em>suggests</em> which constructions are worth pursuing. A discrete mathematician who learns the language of Feynman diagrams gains a vast new repertoire of combinatorial questions — many open, many tractable — without ever having to renormalize an actual physical quantity.
</div>

# Chapter 3: Hopf Algebras and Renormalization

Taught at UW as CO 739 in Winter 2020 by Karen Yeats.

## 3.1 Hopf Algebras: Definition and Examples

The 2020 sequel to Yeats's Feynman diagram course concentrated on the algebraic structure underlying the BPHZ renormalization scheme: the <em>renormalization Hopf algebra</em> of Connes and Kreimer. The course began with the abstract theory of Hopf algebras, following Sweedler's classic 1969 monograph.

<div class="definition">
<strong>Definition 3.1 (Hopf algebra).</strong> A <em>Hopf algebra</em> over a field \(k\) is a \(k\)-vector space \(H\) equipped with five structure maps — a unit \(\eta : k \to H\), a multiplication \(m : H \otimes H \to H\), a counit \(\varepsilon : H \to k\), a comultiplication \(\Delta : H \to H \otimes H\), and an antipode \(S : H \to H\) — such that \((H, \eta, m)\) is a unital associative algebra, \((H, \varepsilon, \Delta)\) is a counital coassociative coalgebra, the algebra and coalgebra structures are compatible (\(\Delta\) and \(\varepsilon\) are algebra homomorphisms), and the antipode satisfies \(m \circ (S \otimes \mathrm{id}) \circ \Delta = m \circ (\mathrm{id} \otimes S) \circ \Delta = \eta \circ \varepsilon\).
</div>

The compatibility of multiplication and comultiplication is best stated diagrammatically: \(\Delta \circ m = (m \otimes m) \circ (\mathrm{id} \otimes \tau \otimes \mathrm{id}) \circ (\Delta \otimes \Delta)\), where \(\tau\) is the swap of tensor factors.

<div class="example">
<strong>Example 3.2 (Group algebra).</strong> For a finite group \(G\) the group algebra \(k[G]\) is a Hopf algebra with \(\Delta(g) = g \otimes g\), \(\varepsilon(g) = 1\), and \(S(g) = g^{-1}\) on group elements, extended linearly. Dually, the algebra \(k^G\) of \(k\)-valued functions on \(G\) is a Hopf algebra. The Hopf algebra axioms abstract the algebraic content of a group, in a form that makes sense even when no underlying set of group elements exists.
</div>

<div class="example">
<strong>Example 3.3 (Universal enveloping algebra).</strong> For a Lie algebra \(\mathfrak{g}\) the universal enveloping algebra \(U(\mathfrak{g})\) is a cocommutative Hopf algebra with \(\Delta(X) = X \otimes 1 + 1 \otimes X\) for primitive elements \(X \in \mathfrak{g}\), extended as an algebra map. Conversely, by the Milnor--Moore theorem, every cocommutative connected Hopf algebra over a field of characteristic zero is the universal enveloping algebra of its Lie algebra of primitive elements.
</div>

## 3.2 The Connes--Kreimer Hopf Algebra of Rooted Trees

The combinatorial Hopf algebra most relevant to renormalization is the <em>Connes--Kreimer Hopf algebra</em> \(\mathcal{H}_{\mathrm{CK}}\) of rooted trees. Its underlying algebra is the polynomial algebra on the set of (isomorphism classes of) rooted trees, and its coproduct is given by summing over <em>admissible cuts</em>.

<div class="definition">
<strong>Definition 3.4 (Admissible cut).</strong> Let \(t\) be a rooted tree. A subset \(C\) of edges of \(t\) is an <em>admissible cut</em> if every path from the root to a leaf passes through at most one edge of \(C\). Removing the edges of \(C\) disconnects \(t\) into a connected component containing the root, denoted \(R_C(t)\), and a forest of remaining components, denoted \(P_C(t)\). The Connes--Kreimer coproduct is

\[
\Delta(t) \;=\; t \otimes 1 + 1 \otimes t + \sum_{C} P_C(t) \otimes R_C(t),
\]

where the sum runs over nonempty proper admissible cuts.
</div>

This coproduct is coassociative, and the resulting Hopf algebra is graded (by number of vertices), connected, and commutative but not cocommutative. Its dual is, by the Milnor--Moore theorem, isomorphic to the universal enveloping algebra of a Lie algebra of rooted trees discovered earlier by Grossman and Larson.

<div class="theorem">
<strong>Theorem 3.5 (Connes--Kreimer, BPHZ as antipode).</strong> Let \(\mathcal{H}_{\mathrm{Feyn}}\) denote the Hopf algebra whose generators are 1PI Feynman graphs of a renormalizable QFT and whose coproduct sums over divergent subgraphs. Let \(\phi : \mathcal{H}_{\mathrm{Feyn}} \to \mathcal{A}\) be the unrenormalized Feynman rules, valued in some commutative algebra \(\mathcal{A}\) of meromorphic functions. The BPHZ-renormalized Feynman rules are obtained by applying Birkhoff factorization in the group of \(\mathcal{A}\)-valued characters of \(\mathcal{H}_{\mathrm{Feyn}}\); the counterterm character is computed recursively by the twisted antipode applied to \(\phi\).
</div>

## 3.3 Combinatorial Hopf Algebras Beyond Renormalization

The Connes--Kreimer construction is one of many combinatorial Hopf algebras of recent interest. The Malvenuto--Reutenauer Hopf algebra of permutations, the Loday--Ronco Hopf algebra of binary trees, the Hopf algebra of quasi-symmetric functions, and the Hopf algebra of noncommutative symmetric functions all sit in a network of canonical morphisms studied in detail in lectures.

<div class="remark">
<strong>Remark 3.6 (Why combinatorialists care).</strong> A Hopf-algebraic structure on a class of combinatorial objects is a powerful organizational tool: the antipode formula often encodes a deep enumerative identity (e.g., the Möbius function of a poset is essentially the antipode of its incidence Hopf algebra), and the existence of a <em>character group</em> turns formal manipulations of generating functions into honest group-theoretic calculations. The renormalization Hopf algebra furnishes both a beautiful example and a guidebook for what to expect.
</div>

# Chapter 4: Topological Combinatorics

Taught at UW as CO 739 in Fall 2022 by Penny Haxell.

## 4.1 The Borsuk--Ulam Theorem and Its Combinatorial Consequences

Haxell's Fall 2022 course was an introduction to <em>topological combinatorics</em>, the body of techniques that uses tools from algebraic topology — most centrally the Borsuk--Ulam theorem and its many descendants — to prove statements in discrete mathematics. The course followed Matoušek's textbook closely, with frequent excursions into Björner's handbook chapter and into the original literature.

<div class="theorem">
<strong>Theorem 4.1 (Borsuk--Ulam).</strong> Every continuous map \(f : S^n \to \mathbb{R}^n\) sends some pair of antipodal points to the same image: there exists \(x \in S^n\) with \(f(x) = f(-x)\).
</div>

Equivalent formulations include: there is no continuous antipodal map \(S^n \to S^{n-1}\); the \(\mathbb{Z}_2\)-index of \(S^n\) is exactly \(n\); and the Lyusternik--Schnirelmann theorem on covers of the sphere by \(n+1\) closed sets. Each of these formulations leads to a different style of combinatorial application.

<div class="example">
<strong>Example 4.2 (Ham sandwich).</strong> Given any \(n\) measurable sets \(A_1, \ldots, A_n \subset \mathbb{R}^n\) of finite measure, there is a single hyperplane that simultaneously bisects each \(A_i\) into two pieces of equal measure. The proof maps the \(n\)-sphere of oriented hyperplanes to \(\mathbb{R}^n\) by taking \((A_1\)-measure on positive side, \(\ldots\), \(A_n\)-measure on positive side\()\), and applies Borsuk--Ulam to the antipodally normalized version.
</div>

## 4.2 The Lovász--Kneser Theorem

The defining triumph of topological combinatorics is Lovász's 1978 proof of Kneser's conjecture, the first instance in which a combinatorial problem with no apparent topology was resolved by topological means.

<div class="definition">
<strong>Definition 4.3 (Kneser graph).</strong> For positive integers \(n \ge 2k\), the <em>Kneser graph</em> \(\mathrm{KG}(n, k)\) has as vertices the \(k\)-element subsets of \(\{1, 2, \ldots, n\}\), with two vertices adjacent if and only if the corresponding subsets are disjoint.
</div>

<div class="theorem">
<strong>Theorem 4.4 (Lovász, 1978).</strong> The chromatic number of the Kneser graph satisfies \(\chi(\mathrm{KG}(n,k)) = n - 2k + 2\).
</div>

The upper bound is a straightforward colouring; the lower bound is the topological content. Lovász's original proof associated to \(\mathrm{KG}(n,k)\) a simplicial complex whose connectivity, by a Borsuk--Ulam argument, lower-bounds the chromatic number. A streamlined proof due to Bárány uses Gale's lemma directly: a configuration of points on the sphere with a useful symmetry produces an embedding from which Borsuk--Ulam extracts the chromatic bound.

## 4.3 The Topological Tverberg Theorem and Necklace Splitting

A second major theme is <em>Tverberg-type theorems</em>, which assert that any sufficiently large point set in \(\mathbb{R}^d\) can be partitioned into pieces with intersecting convex hulls.

<div class="theorem">
<strong>Theorem 4.5 (Tverberg).</strong> Any \((r-1)(d+1) + 1\) points in \(\mathbb{R}^d\) admit a partition into \(r\) groups whose convex hulls have a common point.
</div>

The <em>topological Tverberg theorem</em> generalizes this from affine maps to arbitrary continuous maps from the simplex. It was for many years known only when \(r\) is a prime power; Frick's 2015 counterexample, building on work of Mabillard and Wagner, showed that the topological Tverberg fails in general. The bridge between Tverberg and Borsuk--Ulam runs through the configuration-space / test-map paradigm formalized by Sarkaria and Volovikov.

<div class="theorem">
<strong>Theorem 4.6 (Necklace splitting; Hobby--Rice, Alon).</strong> An open necklace strung with beads of \(t\) types, with each type appearing an integer number of times divisible by \(k\), can be partitioned among \(k\) thieves so that each receives an equal number of beads of every type, using at most \(t(k-1)\) cuts. This bound is tight, and the proof for \(k=2\) is a direct application of Borsuk--Ulam to a sphere whose points encode \(\pm 1\)-signed cuts.
</div>

<div class="remark">
<strong>Remark 4.7 (Configuration-space / test-map paradigm).</strong> The general recipe of topological combinatorics is: (i) reformulate the combinatorial problem as the nonexistence of a certain equivariant map between configuration spaces; (ii) compute an equivariant invariant (typically the index, or the cohomological characteristic class associated with the action) of the source and target; (iii) conclude that no such map exists when the invariants are incompatible. This paradigm is responsible for an entire literature of unification — colored Tverberg, generalized ham sandwich, mass-partition theorems — and is the perspective Haxell emphasized throughout the course.
</div>

# Chapter 5: Information Theory

Taught at UW as CO 739 in Winter 2024 by Ashwin Nayak.

## 5.1 Entropy, Conditional Entropy, and Mutual Information

Nayak's Winter 2024 course was a graduate-level introduction to classical information theory, with Cover and Thomas as the principal text and a quantum-information coda informed by the instructor's own research. The fundamental object is <em>Shannon entropy</em>.

<div class="definition">
<strong>Definition 5.1 (Shannon entropy).</strong> Let \(X\) be a discrete random variable taking values in a finite alphabet \(\mathcal{X}\) with distribution \(p\). The <em>entropy</em> of \(X\) is

\[
H(X) \;=\; -\sum_{x \in \mathcal{X}} p(x) \log_2 p(x),
\]

with the convention \(0 \log 0 = 0\). Entropy is measured in <em>bits</em> when the logarithm has base \(2\) and in <em>nats</em> when it has base \(e\). For two random variables \((X, Y)\) the <em>joint</em>, <em>conditional</em>, and <em>mutual information</em> are defined by \(H(X, Y)\), \(H(X | Y) = H(X, Y) - H(Y)\), and \(I(X; Y) = H(X) - H(X | Y) = H(X) + H(Y) - H(X, Y)\), respectively.
</div>

The basic properties — non-negativity, symmetry of mutual information, the chain rule \(H(X, Y) = H(X) + H(Y | X)\), and the data processing inequality \(I(X; Y) \ge I(X; f(Y))\) — are derived from Jensen's inequality and the strict concavity of the logarithm.

<div class="theorem">
<strong>Theorem 5.2 (Asymptotic equipartition property).</strong> Let \(X_1, X_2, \ldots\) be i.i.d. with entropy \(H(X)\). Then for every \(\varepsilon > 0\) the set of <em>typical sequences</em>

\[
A_\varepsilon^{(n)} \;=\; \Bigl\{ x^n \in \mathcal{X}^n : \bigl| -\tfrac{1}{n}\log p(x^n) - H(X) \bigr| < \varepsilon \Bigr\}
\]

has total probability tending to \(1\) as \(n \to \infty\), and its cardinality satisfies \(2^{n(H - \varepsilon)} \le |A_\varepsilon^{(n)}| \le 2^{n(H + \varepsilon)}\) for all \(n\) large enough.
</div>

The AEP is the workhorse of information theory: nearly every coding theorem, source-coding or channel-coding alike, reduces in essence to bounding the size of a typical set.

## 5.2 Source Coding and Channel Coding

<div class="theorem">
<strong>Theorem 5.3 (Shannon's source coding theorem).</strong> The minimum expected length of a uniquely decodable binary code for a memoryless source \(X\) lies in the interval \(\left[H(X), H(X) + 1\right)\). More precisely, the per-symbol expected length of a Huffman code for \(n\) i.i.d. copies of \(X\) tends to \(H(X)\) as \(n \to \infty\).
</div>

<div class="theorem">
<strong>Theorem 5.4 (Shannon's noisy channel coding theorem).</strong> The <em>capacity</em> of a discrete memoryless channel \(p(y | x)\), defined as \(C = \max_{p(x)} I(X; Y)\), is the supremum of rates at which information can be transmitted with arbitrarily small probability of error. Conversely, no rate exceeding \(C\) is achievable.
</div>

The proof packages the AEP into a random coding argument: for a randomly generated codebook of size \(2^{nR}\) with \(R < C\), the joint typicality decoder achieves vanishing error probability averaged over codebooks, hence some specific codebook works.

## 5.3 Continuous, Network, and Quantum Extensions

The continuous analogue replaces sums by integrals and entropy by <em>differential entropy</em> \(h(X) = -\int f(x) \log f(x)\, dx\), which lacks the unconditional non-negativity of its discrete cousin but obeys analogous relative versions. The central capacity formula is the celebrated Gaussian channel capacity \(C = \tfrac{1}{2} \log(1 + \mathrm{SNR})\).

<div class="example">
<strong>Example 5.5 (Slepian--Wolf).</strong> Two correlated sources \(X\) and \(Y\) with joint distribution \(p(x, y)\) can be separately encoded — the encoders never communicate — and jointly decoded with vanishing error provided the rates \((R_X, R_Y)\) lie in the region \(R_X \ge H(X | Y)\), \(R_Y \ge H(Y | X)\), \(R_X + R_Y \ge H(X, Y)\). Remarkably, the achievable rate region for separate encoding equals the rate region for joint encoding — a striking instance of distributed compression.
</div>

<div class="remark">
<strong>Remark 5.6 (Quantum information).</strong> The course closed with a glance at quantum information theory, where the role of Shannon entropy is played by <em>von Neumann entropy</em> \(S(\rho) = -\mathrm{tr}(\rho \log \rho)\) of a density operator \(\rho\). Quantum channels admit several distinct notions of capacity (classical capacity, quantum capacity, entanglement-assisted capacity), reflecting the richer structure of quantum communication. The Holevo bound, the strong subadditivity of quantum entropy, and the LSD theorem (Lloyd--Shor--Devetak) for quantum capacity were all sketched.
</div>

# Chapter 6: Combinatorial Algebraic Geometry

Taught at UW as CO 739 in Fall 2025 by Oliver Pechenik.

## 6.1 Toric Varieties and Polytopes

Pechenik's Fall 2025 course was an introduction to <em>combinatorial algebraic geometry</em>, the body of techniques that uses combinatorial structures — polytopes, posets, fans — to study and compute on algebraic varieties. The unifying example, occupying a substantial portion of the course, is the theory of <em>toric varieties</em>, following Fulton's text.

<div class="definition">
<strong>Definition 6.1 (Toric variety).</strong> A <em>toric variety</em> over an algebraically closed field \(k\) is a normal algebraic variety \(X\) containing the algebraic torus \(T = (k^*)^n\) as a Zariski-dense open subvariety, equipped with an action of \(T\) on \(X\) extending the multiplication of \(T\) on itself.
</div>

The fundamental theorem of toric geometry states that toric varieties are classified by combinatorial data: <em>strongly convex rational polyhedral fans</em> \(\Sigma\) in the lattice \(N \cong \mathbb{Z}^n\). Each cone \(\sigma \in \Sigma\) corresponds to an affine open chart \(U_\sigma = \mathrm{Spec}\, k[\sigma^\vee \cap M]\), and the gluing data of the fan dictates how these charts assemble.

<div class="example">
<strong>Example 6.2 (Projective space).</strong> The projective space \(\mathbb{P}^n\) is the toric variety of the fan whose maximal cones are the \(n+1\) simplicial cones generated by all proper subsets of size \(n\) of the vectors \(e_1, \ldots, e_n, -(e_1 + \cdots + e_n)\) in \(\mathbb{R}^n\). The Hirzebruch surface \(\mathbb{F}_a\) is the toric surface whose fan has rays \(e_1, e_2, -e_1, -e_2 + a e_1\). Each combinatorial change in the fan corresponds to a geometric operation on the variety.
</div>

The combinatorics of the fan controls the geometry of the variety: the variety is smooth iff every cone is generated by part of a basis of \(N\); it is complete iff the fan covers all of \(\mathbb{R}^n\); it is projective iff the fan is the normal fan of a polytope. Cohomology rings of smooth projective toric varieties admit elegant presentations as Stanley--Reisner-type rings.

## 6.2 Schubert Calculus

A second major theme of the course is <em>Schubert calculus</em>, the cohomology theory of flag and Grassmannian varieties, recast combinatorially via Young tableaux.

<div class="definition">
<strong>Definition 6.3 (Grassmannian and Schubert cells).</strong> The Grassmannian \(\mathrm{Gr}(k, n)\) parametrizes \(k\)-dimensional linear subspaces of \(k^n\). Fixing a complete flag \(F_\bullet : 0 \subset F_1 \subset \cdots \subset F_n = k^n\), each partition \(\lambda \subseteq (n-k)^k\) determines a <em>Schubert cell</em> \(\Omega_\lambda^\circ\) and its closure, the <em>Schubert variety</em> \(\Omega_\lambda\). The classes \([\Omega_\lambda] \in H^*(\mathrm{Gr}(k,n))\) form an additive basis of the cohomology ring.
</div>

<div class="theorem">
<strong>Theorem 6.4 (Littlewood--Richardson rule).</strong> The structure constants of the cohomology ring \(H^*(\mathrm{Gr}(k,n))\) in the Schubert basis are

\[
[\Omega_\lambda] \cdot [\Omega_\mu] \;=\; \sum_{\nu} c_{\lambda\mu}^{\nu}\, [\Omega_\nu],
\]

where \(c_{\lambda\mu}^\nu\) is the number of <em>Littlewood--Richardson tableaux</em> of skew shape \(\nu/\lambda\) and content \(\mu\). Consequently the integers \(c_{\lambda\mu}^\nu\) are non-negative — a fact known to be combinatorially deep.
</div>

The course emphasized modern developments: <em>K-theoretic Schubert calculus</em>, where Buch's rule replaces tableaux by set-valued tableaux; <em>back stable Schubert calculus</em> of Lam--Lee--Shimozono; and the <em>cluster algebra</em> structures on Grassmannian coordinate rings due to Scott, Fomin--Zelevinsky and many others.

## 6.3 Newton--Okounkov Bodies and Tropical Geometry

<div class="definition">
<strong>Definition 6.5 (Newton--Okounkov body).</strong> Let \(X\) be a normal projective variety, \(L\) a big line bundle, and \(\nu : k(X)^* \to \mathbb{Z}^n\) a rank-\(n\) valuation. The <em>Newton--Okounkov body</em> \(\Delta(L, \nu)\) is the closed convex hull of the rescaled valuation images \(\bigcup_m \tfrac{1}{m} \nu(H^0(X, mL) \setminus 0)\) inside \(\mathbb{R}^n\). Its real volume computes the volume of the line bundle, and in many situations of interest the Newton--Okounkov body is a rational polytope encoding rich combinatorial information about \(X\).
</div>

<div class="remark">
<strong>Remark 6.6 (Tropicalization).</strong> A complementary modern perspective is <em>tropical geometry</em>, in which algebraic varieties over a non-Archimedean field are replaced by polyhedral complexes — their <em>tropicalizations</em> — that retain enough geometric information to recover key invariants combinatorially. The interplay between classical Schubert calculus, tropical geometry, and Newton--Okounkov body theory is one of the most active research areas in combinatorial algebraic geometry, and the course concluded by surveying recent results of Anderson, Postnikov, Lam, and Pechenik himself on positroid varieties and their generalizations.
</div>

# Chapter 7: Combinatorics of Orthogonal Polynomials

Taught at UW as CO 739 in Winter 2026 by Karen Yeats (planned).

The Winter 2026 offering of CO 739 will be devoted to the <em>combinatorics of orthogonal polynomials</em>, a subject pioneered by Flajolet, Viennot, Foata, and Zeilberger in the 1980s and currently undergoing renewed interest through its connections to integrable probability and matrix models. No outline is yet available at the time of writing; the following pointer summarizes the expected scope.

A sequence of polynomials \(\{p_n(x)\}_{n \ge 0}\) with \(\deg p_n = n\) is <em>orthogonal</em> with respect to a positive measure \(\mu\) on \(\mathbb{R}\) if \(\int p_m(x) p_n(x)\, d\mu(x) = h_n \delta_{mn}\) for some positive constants \(h_n\). The classical families — Hermite, Laguerre, Jacobi, Chebyshev, Meixner, Charlier, Krawtchouk — each have a beautiful combinatorial life: Hermite polynomials enumerate matchings of a set, Laguerre polynomials enumerate set partitions weighted by block size, Charlier polynomials enumerate set partitions, and so on through the Askey scheme.

<div class="theorem">
<strong>Theorem 7.1 (Favard).</strong> Any sequence of polynomials \((p_n)_{n \ge 0}\) satisfying a three-term recurrence

\[
p_{n+1}(x) \;=\; (x - b_n)\, p_n(x) - \lambda_n \, p_{n-1}(x), \qquad \lambda_n > 0,
\]

with real \(b_n\) and positive \(\lambda_n\), is a sequence of orthogonal polynomials with respect to some positive measure on \(\mathbb{R}\).
</div>

<div class="example">
<strong>Example 7.2 (Viennot's theory).</strong> The moments \(\mu_n = \int x^n\, d\mu\) of an orthogonality measure satisfying a three-term recurrence with parameters \((b_n, \lambda_n)\) are enumerated by <em>Motzkin paths</em>: lattice paths from \((0, 0)\) to \((n, 0)\) with steps \((1, 1)\), \((1, -1)\), \((1, 0)\), where each level step at height \(k\) is weighted by \(b_k\) and each down step from height \(k\) is weighted by \(\lambda_k\). Continued-fraction expansions of generating functions arise naturally from this perspective.
</div>

<div class="remark">
<strong>Remark 7.3 (Modern threads).</strong> Beyond Viennot's classical combinatorial theory, the modern subject draws on several rapidly developing themes: <em>matrix model</em> interpretations of moments via random matrix theory, <em>q-analogues</em> and connections to the theory of partitions, <em>multivariate orthogonal polynomials</em> on root systems (Macdonald polynomials, Koornwinder polynomials), and the <em>positivity</em> phenomena pervading all of these. Yeats's anticipated treatment will likely emphasize the graph-theoretic and algebraic-combinatorial threads, in keeping with her earlier CO 739 offerings on Feynman diagrams and Hopf algebras — orthogonal polynomial moments arise naturally as Feynman amplitudes for zero-dimensional QFTs, and their continued-fraction generating functions are governed by combinatorial Hopf algebras of paths.
</div>

The chapter is intentionally brief; once the official outline appears, a fuller treatment can be substituted in its place.
