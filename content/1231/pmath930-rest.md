---
why: |
  PMATH 930 rotates across model theory, universal algebra, and combinatorics. The composite presents each as a motivational first-lecture tour so that a student scanning the chapters can decide which offering fits their research interests.
made_up: true
title: "PMATH 930: Topics in Logic"
subjects: PMATH
---

*These notes consolidate the rotating PMATH 930 topics course at the University of Waterloo across its recent offerings: Rahim Moosa's Fall 2019 course on model theory of fields with operators, Winter 2021 course on difference fields, and Winter 2023 course on differential fields II; Ross Willard's Fall 2021 introduction to universal algebra; Zucker's Fall 2022 course on countably infinite Ramsey theory; and the Fall 2025 course on geometric stability theory. Each chapter is designed as a motivational first-lecture tour — a self-contained orientation for a student deciding whether the topic fits their research interests.*

---

## Sources and References

- Marker, D. *Model Theory: An Introduction*. Graduate Texts in Mathematics 217 (Springer, 2002).
- Marker, D., Messmer, M. & Pillay, A. *Model Theory of Fields*. Lecture Notes in Logic 5 (Springer / AMS, 1996).
- Chatzidakis, Z. & Hrushovski, E. "Model theory of difference fields." *Trans. Amer. Math. Soc.* 351 (1999), 2997–3071. Open preprint available on Chatzidakis's Paris-Diderot page.
- Burris, S. & Sankappanavar, H. P. *A Course in Universal Algebra* (Springer, 1981; free update hosted at math.uwaterloo.ca/~snburris/htdocs/ualg.html).
- Bergman, C. *Universal Algebra: Fundamentals and Selected Topics* (CRC Press, 2012).
- Todorčević, S. *Introduction to Ramsey Spaces*. Annals of Mathematics Studies 174 (Princeton, 2010).
- Kechris, A. S. *Classical Descriptive Set Theory*. Graduate Texts in Mathematics 156 (Springer, 1995).
- Pillay, A. *Geometric Stability Theory*. Oxford Logic Guides 32 (Oxford University Press, 1996).
- Kolchin, E. R. *Differential Algebra and Algebraic Groups* (Academic Press, 1973).
- Shelah, S. *Classification Theory and the Number of Non-Isomorphic Models*, 2nd ed. (North-Holland, 1990).

---

## Chapter 1: Model Theory of Fields with Operators

Taught at UW as PMATH 930 in Fall 2019 by Rahim Moosa.

Why would a model theorist — in principle just a logician studying definable sets — care about fields with a derivation? Because every ordinary differential equation in one unknown, viewed as a polynomial relation between \(y, y', y'', \ldots\), defines a set inside the differential closure \(\mathbb{C}\langle t \rangle\); because Hrushovski's 1996 proof of the Mordell–Lang conjecture for function fields goes through the model theory of differentially closed fields; and because the same model-theoretic machinery settles the dynamical Manin–Mumford conjecture in cases where no purely algebraic-geometric proof is known. Moosa's course developed the infrastructure in the generality needed for these applications.

<div class="definition">
<strong>Definition 1.1 (Differential field).</strong> A <em>differential field</em> is a pair \((K, \partial)\) where \(K\) is a field and \(\partial \colon K \to K\) is a linear operator satisfying
\[ \partial(ab) = \partial(a) b + a \partial(b) \qquad (\text{Leibniz rule}). \]
The <em>field of constants</em> is \(C_K = \{x \in K : \partial(x) = 0\}\). An archetypal example is \((\mathbb{C}(t), d/dt)\) with \(C_K = \mathbb{C}\).
</div>

<div class="definition">
<strong>Definition 1.2 (Difference field).</strong> A <em>difference field</em> is a pair \((K, \sigma)\) where \(\sigma \colon K \to K\) is a ring endomorphism. The <em>fixed field</em> is \(\operatorname{Fix}(\sigma) = \{x : \sigma(x) = x\}\). Examples include \((\overline{\mathbb{F}_p}, x \mapsto x^p)\) with fixed field \(\mathbb{F}_p\), and the field of meromorphic functions with a shift \(\sigma(f)(z) = f(z + 1)\).
</div>

Both classes admit **model companions**: a canonical expansion of the theory in which every existential statement that might hold actually does. The model companion of differential fields of characteristic zero is the theory \(\mathrm{DCF}_0\) of **differentially closed fields**; of difference fields, it is \(\mathrm{ACFA}\) (algebraically closed fields with a generic automorphism).

<div class="theorem">
<strong>Theorem 1.3 (Robinson; Blum).</strong> \(\mathrm{DCF}_0\) is complete, \(\omega\)-stable, and has quantifier elimination in the language \(\{+, -, \cdot, 0, 1, \partial\}\). Every differential field of characteristic zero embeds into a differentially closed field, unique up to isomorphism over the base.
</div>

Stability is the key word. Shelah's classification theory (1970s) identifies the "tame" first-order theories as those with controlled growth of the type space; \(\omega\)-stability, the strongest such tameness, implies a dimension theory on definable sets that behaves formally like algebraic-geometric dimension. For \(\mathrm{DCF}_0\), this dimension is the one Kolchin introduced in the 1950s under the name *differential transcendence degree*.

<div class="example">
<strong>Example 1.4 (Manin–Mumford via differential algebra).</strong> Hrushovski's 1996 proof of the function-field Manin–Mumford conjecture reduces a Diophantine statement about torsion points on abelian varieties to a model-theoretic dichotomy in \(\mathrm{DCF}_0\). A definable subgroup \(G\) of an abelian variety over a differential field is either orthogonal to the constants (and hence rigid) or internal to them (and hence a subvariety of the abelian variety over the constants). The torsion points satisfy a definable equation, and one side of the dichotomy produces the required finiteness. No purely algebraic-geometric proof of the same generality was available before.
</div>

<div class="remark">
<strong>Beyond fields.</strong> The same framework extends to difference-differential fields, fields with a Hasse–Schmidt derivation, and p-adic differentially closed fields — each with its own model companion and its own application area. Moosa's research group at Waterloo is among the world leaders in this extended theory.
</div>

---

## Chapter 2: Model Theory of Difference Fields

Taught at UW as PMATH 930 in Winter 2021 by Rahim Moosa.

The dynamics of a rational map on an algebraic variety is controlled, in a precise model-theoretic sense, by the difference-field structure of its associated function field together with the self-map \(\sigma\). Questions about orbits — are they Zariski-dense? do preperiodic points fill a subvariety? — translate to questions about definable sets in the companion theory \(\mathrm{ACFA}\). Moosa's course developed \(\mathrm{ACFA}\) from scratch and applied it to the Zilber trichotomy and algebraic dynamics.

<div class="definition">
<strong>Definition 2.1 (ACFA).</strong> The theory \(\mathrm{ACFA}\) (algebraically closed fields with a generic automorphism) consists of the axioms: \(K\) is algebraically closed; \(\sigma \colon K \to K\) is a field automorphism; for every pair of absolutely irreducible varieties \(U \subseteq V \times V^\sigma\) projecting dominantly onto each factor, there exists \(a \in K\) with \((a, \sigma(a)) \in U\).
</div>

<div class="theorem">
<strong>Theorem 2.2 (Chatzidakis–Hrushovski, 1999).</strong> \(\mathrm{ACFA}\) is the model companion of the theory of difference fields. Every difference field embeds into a model of \(\mathrm{ACFA}\), and \(\mathrm{ACFA}\) has quantifier elimination down to formulas of the form "\(\exists y\) such that \((x, y, \sigma(x), \sigma(y))\) satisfies a polynomial condition." The theory is simple but not stable; its fixed field \(\operatorname{Fix}(\sigma)\) is a pseudo-finite field.
</div>

The shift from \(\mathrm{DCF}_0\) (stable) to \(\mathrm{ACFA}\) (simple unstable) is the central model-theoretic move of the course. Simplicity still gives a workable independence relation, but the geometric complications of unstable theories — multiple dividing formulas, non-trivial equivalence relations — require the tools of Hrushovski's group-configuration theorem and the Chatzidakis–Hrushovski trichotomy.

<div class="theorem">
<strong>Theorem 2.3 (Chatzidakis–Hrushovski trichotomy).</strong> In a model of \(\mathrm{ACFA}\), every minimal type (one whose forking geometry is non-trivial on the fixed field) is of exactly one of three kinds: <em>disintegrated</em> (essentially no structure), <em>group-like</em> (internal to an algebraic group), or <em>field-like</em> (internal to the fixed field).
</div>

<div class="example">
<strong>Example 2.4 (Orbits of a rational map).</strong> Let \(\phi \colon \mathbb{P}^1 \to \mathbb{P}^1\) be a rational map of degree \(\ge 2\) over \(\mathbb{C}\). The generic orbit \(\{\phi^n(a) : n \in \mathbb{Z}\}\) is a definable set in the difference field \((\mathbb{C}(t), \phi^*)\), and the Chatzidakis–Hrushovski trichotomy determines its geometric type. Disintegrated orbits are the "generic" case — chaotic dynamics; group-like orbits arise when \(\phi\) comes from an endomorphism of an abelian variety (Lattès maps); field-like orbits correspond to monomial maps. The dynamical Manin–Mumford conjecture in many cases reduces to showing that only the group-like case admits Zariski-dense preperiodic points.
</div>

<div class="remark">
<strong>Research reach.</strong> The Chatzidakis–Hrushovski framework extends to <em>difference-differential fields</em> (relevant to \(q\)-difference equations and Painlevé theory), to <em>Mahler functions</em> in transcendence theory, and to <em>Galois theory of linear difference equations</em> in the spirit of Picard–Vessiot. Moosa's Waterloo group has been central to each of these extensions, and many Waterloo theses have exploited exactly the trichotomy above.
</div>

---

## Chapter 3: Introduction to Universal Algebra

Taught at UW as PMATH 930 in Fall 2021 by Ross Willard.

Universal algebra is the subject that asks: *what do all algebraic structures have in common?* Every first-year graduate student can tell you the difference between a group, a ring, and a lattice. Universal algebra tells you what these structures share — and the answer turns out to be a remarkably rich theory, with Birkhoff's variety theorem, congruence-permutability, Mal'cev conditions, and commutator theory as its most celebrated consequences. Willard's course followed the Burris–Sankappanavar textbook with Waterloo's characteristic emphasis on the structural questions that motivate contemporary research.

<div class="definition">
<strong>Definition 3.1 (Algebra).</strong> An <em>algebra</em> is a set \(A\) together with a collection of operations \((f_i \colon A^{n_i} \to A)_{i \in I}\) of various arities. A <em>homomorphism</em> is a function commuting with all operations. <em>Subalgebras</em>, <em>quotient algebras</em> (by congruence relations — equivalence relations preserved by all operations), and <em>direct products</em> are defined in the obvious way.
</div>

<div class="definition">
<strong>Definition 3.2 (Variety).</strong> A <em>variety</em> (or <em>equational class</em>) is a class of algebras of a fixed signature closed under subalgebras, quotients, and direct products.
</div>

<div class="theorem">
<strong>Theorem 3.3 (Birkhoff's HSP theorem, 1935).</strong> A class of algebras is a variety iff it is equationally definable: there exists a set \(\Sigma\) of identities such that an algebra is in the class iff it satisfies every identity in \(\Sigma\).
</div>

Birkhoff's theorem is the foundational equivalence: closed under the structural operations H (homomorphic images), S (subalgebras), and P (products) ⟺ axiomatized by identities. Groups are a variety (associativity + inverses + identity, all equationally expressed); fields are *not* (the axiom \(x \ne 0 \to \exists y. xy = 1\) is not equational, and indeed fields are not closed under products).

<div class="example">
<strong>Example 3.4 (Lattice theory).</strong> The variety of lattices — algebras \((L; \wedge, \vee)\) with two idempotent, commutative, associative binary operations satisfying the absorption laws — is the prototype of a variety whose internal structure is rich enough to deserve its own textbook. Distributive lattices, modular lattices, and complemented lattices are each subvarieties, each with its own equational axiomatization. The congruence lattice of a lattice algebra is again a distributive lattice (Funayama–Nakayama), a deep structural theorem with no analogue in group theory.
</div>

<div class="theorem">
<strong>Theorem 3.5 (Subdirect irreducibility; Birkhoff).</strong> Every algebra is a subdirect product of subdirectly irreducible algebras — those whose congruence lattice has a unique minimum non-trivial element. The classification of a variety is therefore reduced to understanding its subdirectly irreducible members, a typically much smaller and more tractable family.
</div>

<div class="remark">
<strong>Mal'cev conditions.</strong> A central discovery of universal algebra is that structural properties of a variety — congruence permutability, modularity, distributivity of the congruence lattice — are equivalent to the <em>existence of specific terms</em> in the variety's signature. Mal'cev's 1954 theorem states: a variety has permuting congruences iff it has a ternary term \(p(x, y, z)\) satisfying \(p(x, y, y) = x\) and \(p(x, x, y) = y\). Groups have such a term: \(p(x, y, z) = xy^{-1}z\). Semigroups in general do not. This single insight — <em>structural property ⟺ existence of term</em> — is the organizing principle of commutator theory and the modern algorithmic classification of varieties.
</div>

The course closed with a preview of **Tame Congruence Theory** (Hobby–McKenzie) and its use in resolving the **constraint-satisfaction problem dichotomy**: deciding whether a fixed finite structure \(\mathbb{A}\) gives a polynomial-time or NP-complete constraint-satisfaction problem reduces to a universal-algebraic question about \(\mathbb{A}\)'s polymorphism clone, resolved by Bulatov and Zhuk (2017). Universal algebra has turned out to be the correct language in which to express the boundary of tractability in combinatorial complexity.

---

## Chapter 4: Countably Infinite Ramsey Theory

Taught at UW as PMATH 930 in Fall 2022 by Zucker.

Ramsey's 1930 theorem says that any 2-colouring of the edges of \(K_\omega\) admits a monochromatic \(K_\omega\). Modern Ramsey theory generalizes this in two directions: to more complex finite combinatorial structures, and to infinite structures with automorphism-group-theoretic consequences. Zucker's course developed the **Kechris–Pestov–Todorčević correspondence**, which identifies structural Ramsey theory with topological dynamics of automorphism groups — one of the most striking bridges between combinatorics and logic of the last two decades.

<div class="theorem">
<strong>Theorem 4.1 (Ramsey, 1930).</strong> For every positive integers \(r, k, n\), there exists \(N = R(r, k, n)\) such that every \(r\)-colouring of the \(n\)-element subsets of \(\{1, 2, \ldots, N\}\) contains a monochromatic \(k\)-element subset — that is, a \(k\)-subset all of whose \(n\)-subsets receive the same colour.
</div>

<div class="definition">
<strong>Definition 4.2 (Fraïssé limit).</strong> A <em>Fraïssé class</em> \(\mathcal{K}\) is a class of finite structures in a fixed signature closed under substructures and with the hereditary, joint-embedding, and amalgamation properties. The <em>Fraïssé limit</em> \(\mathrm{Flim}(\mathcal{K})\) is the unique countable ultrahomogeneous structure whose age is \(\mathcal{K}\).
</div>

<div class="example">
<strong>Example 4.3 (The rationals as a Fraïssé limit).</strong> The class of finite linear orders is a Fraïssé class; its Fraïssé limit is \((\mathbb{Q}, <)\), the unique countable dense linear order without endpoints. Other classical Fraïssé limits: the random graph (class of finite graphs), the random triangle-free graph (class of \(K_3\)-free finite graphs), the universal homogeneous partial order (class of finite posets). Each such limit has a large automorphism group with a rich topological structure.
</div>

<div class="theorem">
<strong>Theorem 4.4 (Kechris–Pestov–Todorčević, 2005).</strong> Let \(\mathcal{K}\) be a Fraïssé class with Fraïssé limit \(F\) and automorphism group \(G = \operatorname{Aut}(F)\). The following are equivalent:
<ol>
<li>\(\mathcal{K}\) has the <em>Ramsey property</em>: for every \(A, B \in \mathcal{K}\) and \(r \ge 2\), there exists \(C \in \mathcal{K}\) such that for every \(r\)-colouring of copies of \(A\) in \(C\), some copy of \(B\) in \(C\) has all its \(A\)-subcopies monochromatic.</li>
<li>\(G\) is <em>extremely amenable</em>: every continuous \(G\)-action on a compact space has a fixed point.</li>
</ol>
</div>

The KPT theorem is a breathtaking bridge. It translates a combinatorial Ramsey property, verifiable by finite pigeonhole arguments, into a purely topological-dynamical property of the associated automorphism group. Ramsey theory thereby becomes a lens through which to study Polish group actions, and conversely abstract fixed-point theorems in topological dynamics yield new Ramsey theorems.

<div class="example">
<strong>Example 4.5 (Pestov's theorem).</strong> The group \(\operatorname{Aut}(\mathbb{Q}, <)\) of order-preserving permutations of the rationals is extremely amenable. Equivalently — by KPT — the class of finite linear orders has the Ramsey property, which is the classical Graham–Rothschild theorem. The KPT framework recovers this as a special case of a vast family.
</div>

<div class="remark">
<strong>Current frontier.</strong> Zucker's own research, and his recent lectures, have focused on <em>universal minimal flows</em>: for a Polish group \(G\) one asks for a canonical minimal compact \(G\)-space \(M(G)\), universal among such. Extreme amenability says \(M(G) = \{*\}\). For \(G = S_\infty\) (the infinite symmetric group), \(M(G)\) is the space of linear orderings of \(\omega\). For \(G\) the automorphism group of the random graph, \(M(G)\) has been described combinatorially by Kechris–Sokić. The full classification of universal minimal flows for automorphism groups of Fraïssé structures is an open area with new results appearing yearly.
</div>

---

## Chapter 5: Model Theory of Differential Fields II

Taught at UW as PMATH 930 in Winter 2023 by Rahim Moosa.

A sequel to Chapter 1's foundational course, this offering focused on the geometric structure of definable sets in differentially closed fields. The central tools — **strongly minimal types**, **Zariski geometries**, and the **Zilber trichotomy** — are the ones that power the applications of \(\mathrm{DCF}_0\) to Diophantine geometry.

<div class="definition">
<strong>Definition 5.1 (Strongly minimal type).</strong> In a stable theory, a definable set \(X\) is <em>strongly minimal</em> if \(X\) is infinite and every definable subset of \(X\) (with parameters) is either finite or cofinite. A type is strongly minimal if its set of realizations is strongly minimal.
</div>

Strong minimality is the one-dimensional analogue of "definable set is almost a one-point set or an entire set". The prototypical example is an algebraically closed field: the definable subsets of \(K\) over any parameter set are exactly finite sets and their complements. Every strongly minimal set carries a canonical pregeometry — a closure operator satisfying the exchange property — and so a well-defined notion of *dimension* (rank of an algebraically independent subset).

<div class="theorem">
<strong>Theorem 5.2 (Zilber trichotomy for strongly minimal sets in DCF₀).</strong> Let \(X\) be a strongly minimal set in a differentially closed field of characteristic zero. The pregeometry on \(X\) is exactly one of three kinds:
<ol>
<li><em>Disintegrated</em> (trivial pregeometry): no algebraic relations among generic tuples.</li>
<li><em>Locally modular</em> (group-like): \(X\) is, up to interalgebraicity, a strongly minimal definable subgroup of a commutative algebraic group over the constants.</li>
<li><em>Field-like</em>: \(X\) is interalgebraic with the field of constants.</li>
</ol>
</div>

<div class="theorem">
<strong>Theorem 5.3 (Hrushovski–Sokolović).</strong> The Zilber trichotomy holds in \(\mathrm{DCF}_0\). Consequently, a strongly minimal differential equation is either combinatorially rigid, a linear equation over an abelian variety, or an algebraic constant equation — there are no exotic dimensional phenomena.
</div>

<div class="example">
<strong>Example 5.4 (Painlevé I).</strong> The first Painlevé equation \(y'' = 6y^2 + t\) defines a strongly minimal set in the differential closure of \(\mathbb{C}(t)\). Nagloo–Pillay proved in 2017 that this set is <em>disintegrated</em> — no algebraic relations among generic solutions. This confirms a long-standing conjecture of Painlevé and Umemura, previously only known via special-function transcendence arguments. The model-theoretic proof uses the Zilber trichotomy: one rules out the locally modular and field-like cases by explicit computation.
</div>

<div class="remark">
<strong>Why graduate students should care.</strong> The Painlevé theorem is the prototype of a new technique — <em>transcendence via model theory</em> — that has since produced results on Schwarzian derivatives (Freitag–Scanlon), on algebraic independence of classical special functions (Casale–Freitag–Nagloo), and on dynamical independence (Jaoui–Moosa). Moosa's Waterloo group has driven many of these developments, and the techniques transfer to several active research fronts.
</div>

The course closed with a look at **finite-rank types**, the generalization of strong minimality to higher Lascar rank, and their role in the solution of the function-field Mordell–Lang conjecture. Each increment in rank produces an additional layer of the trichotomy, and the full classification of types up to interalgebraicity in \(\mathrm{DCF}_0\) remains an open program.

---

## Chapter 6: Geometric Stability Theory

Planned at UW as PMATH 930 in Fall 2025.

If Chapters 1 and 5 were applications of model theory to specific structures, geometric stability theory is the abstract framework that explains *why* those applications work. Shelah's classification theory, developed in the 1970s, identified the "tame" first-order theories — those in which definable sets behave as if they were subvarieties of an ambient geometry — and Pillay's geometric stability theory (1980s–1990s) extracted the geometric content that makes this tameness into a usable tool. The 2025 course will cover the highlights.

<div class="definition">
<strong>Definition 6.1 (Stable theory).</strong> A first-order theory \(T\) is <em>stable</em> if no formula \(\varphi(\bar x, \bar y)\) has the order property: there are no \(\{\bar a_i, \bar b_i : i < \omega\}\) such that \(\varphi(\bar a_i, \bar b_j)\) iff \(i < j\). Equivalently, for some infinite cardinal \(\kappa\), the number of types over a set of size \(\kappa\) is at most \(\kappa\).
</div>

Stability is the property that rules out the possibility of encoding a linear order in the theory's definable sets. All algebraically closed fields, all differentially closed fields, and all modules over any ring are stable; no theory including arithmetic is stable. Stable theories have a well-behaved *independence relation* (non-forking) that generalizes algebraic independence.

<div class="theorem">
<strong>Theorem 6.2 (Shelah; forking in stable theories).</strong> In a stable theory, there is a unique notion of independence (non-forking) satisfying symmetry, transitivity, monotonicity, local character, and finite character. For types over models, non-forking extension is unique — every complete type over a model has exactly one non-forking extension to any larger model.
</div>

<div class="definition">
<strong>Definition 6.3 (Lascar rank).</strong> For a type \(p\) over a stable set, the <em>Lascar rank</em> \(U(p)\) is the ordinal defined recursively: \(U(p) \ge 0\) always; \(U(p) \ge \alpha + 1\) iff \(p\) has a forking extension \(q\) with \(U(q) \ge \alpha\); and at limit ordinals take suprema. Lascar rank is to stable theories what Krull dimension is to commutative algebra.
</div>

<div class="theorem">
<strong>Theorem 6.4 (Hrushovski; group configuration theorem).</strong> Suppose a tuple \((a_1, a_2, a_3, b_{12}, b_{23}, b_{13})\) in a stable theory satisfies: \(b_{ij} \in \operatorname{acl}(a_i, a_j)\), the \(a_i\) are pairwise independent, and the \(b_{ij}\) are pairwise independent modulo appropriate sides. Then there exists a type-definable group acting on the configuration.
</div>

The group configuration theorem is the universal engine for detecting group structure in definable sets. Every known application of stability theory to algebraic geometry — Mordell–Lang, Manin–Mumford, classification of strongly minimal differential equations — passes through a group-configuration argument at some step.

<div class="example">
<strong>Example 6.5 (Pillay's definable Galois theory).</strong> Given a differential equation over a differential field, one assigns a definable Galois group — a definable group in \(\mathrm{DCF}_0\) — that measures the symmetries of the equation's solution space. This is a vast generalization of the classical Picard–Vessiot Galois theory of linear ODEs to arbitrary definable equations, and it is built on Hrushovski's group configuration theorem together with the Zilber trichotomy.
</div>

<div class="remark">
<strong>Beyond stability.</strong> The 21st century has seen an explosion of frameworks generalizing stability — simplicity, NIP (no independence property), \(\mathrm{NTP}_2\), distality, distal expansion, and their interactions. Each admits its own geometric-stability-style theorem and each has its own domain of application: \(\mathrm{ACFA}\) is simple, the theory of \(\mathbb{Q}_p\) is NIP, the theory of the real field with a predicate for \(2^\mathbb{Z}\) is distal. The Waterloo logic group is active across this entire landscape, and the 2025 course will close with a survey of the current state of the art.
</div>
