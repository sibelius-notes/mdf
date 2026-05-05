---
why: |
  PMATH 965 spans the widest topic range of any `-rest` file — nine chapters covering everything from Berger's classification to Donaldson–Seiberg–Witten four-manifold theory to Kontsevich's motivic integration. Each chapter is written as a standalone introduction.
made_up: true
title: "PMATH 965: Topics in Geometry and Topology"
subjects: "PMATH"
---

*These notes synthesize material from multiple PMATH 965 instances at the University of Waterloo, drawing only on publicly available textbooks, monographs, and lecture notes. The course is a rotating topics course in geometry and topology, and over the past decade it has covered an unusually wide spectrum: special holonomy, deformation theory, algebraic stacks, rational homotopy theory, harmonic maps, spin geometry, higher stacks, gauge theory, and motivic integration. Sources used below include Joyce's* Compact Manifolds with Special Holonomy *(Oxford UP), Besse's* Einstein Manifolds *(Springer Classics), Sernesi's* Deformations of Algebraic Schemes *(Springer), Hartshorne's* Deformation Theory *(Springer GTM), Olsson's* Algebraic Spaces and Stacks *(AMS Colloquium), the Stacks Project (stacks.math.columbia.edu), Felix-Halperin-Thomas's* Rational Homotopy Theory *(Springer), Eells-Lemaire's* Selected Topics in Harmonic Maps *(CBMS), Lawson-Michelsohn's* Spin Geometry *(Princeton), Donaldson-Kronheimer's* The Geometry of Four-Manifolds *(Oxford), and various publicly available lecture notes (MIT, Stanford, Cambridge).*

---

# Chapter 1: Holonomy Groups and Special Riemannian Structures

Taught at UW as PMATH 965 in Winter 2019 by Spiro Karigiannis.

The holonomy group of a Riemannian manifold is one of the most refined geometric invariants attached to its Levi-Civita connection. To define it, fix a point \(p\) in a Riemannian manifold \((M, g)\) and consider all piecewise-smooth loops based at \(p\). Each such loop \(\gamma\) gives rise to a parallel-transport map \(P_\gamma : T_p M \to T_p M\), which is an isometry of the inner product \(g_p\). The set of all such isometries, as \(\gamma\) ranges over loops, forms a subgroup of \(\mathrm{O}(T_p M, g_p) \cong \mathrm{O}(n)\) called the **holonomy group** \(\mathrm{Hol}_p(g)\). Its identity component, the **restricted holonomy group** \(\mathrm{Hol}_p^0(g)\), corresponds to null-homotopic loops, and on a simply connected manifold the two coincide. A change of basepoint conjugates the holonomy group, so as an abstract subgroup of \(\mathrm{O}(n)\) it is well-defined up to conjugacy.

<div class="definition">
<strong>Definition 1.1 (Holonomy group).</strong> Let \((M,g)\) be a connected Riemannian manifold and \(p \in M\). The <em>holonomy group</em> at \(p\) is

\[
\mathrm{Hol}_p(g) = \left\{ P_\gamma \;\middle|\; \gamma \text{ a piecewise smooth loop at } p \right\} \subseteq \mathrm{O}(T_p M).
\]

The <em>restricted holonomy group</em> \(\mathrm{Hol}_p^0(g)\) is the subgroup obtained by restricting to null-homotopic loops; it is the identity component of \(\mathrm{Hol}_p(g)\) and is a connected Lie subgroup of \(\mathrm{SO}(n)\) when \(M\) is oriented.
</div>

The Ambrose-Singer theorem identifies the Lie algebra of \(\mathrm{Hol}_p^0(g)\) with the span of the curvature operators \(R(X,Y)\) parallel-transported to \(p\), so curvature controls holonomy infinitesimally. A parallel tensor field on \(M\) is invariant under holonomy, and conversely every \(\mathrm{Hol}_p\)-invariant tensor at \(p\) extends by parallel transport to a parallel tensor on \(M\). This duality is the principle of holonomy reduction: the existence of special geometric structures (almost complex, Kähler, hyperkähler, \(G_2\), \(\mathrm{Spin}(7)\)) is equivalent to a reduction of the holonomy group to the corresponding stabilizer in \(\mathrm{O}(n)\).

<div class="theorem">
<strong>Theorem 1.2 (Berger 1955).</strong> Let \((M,g)\) be a simply connected, irreducible, non-locally-symmetric Riemannian manifold of dimension \(n\). Then \(\mathrm{Hol}(g)\) is one of the following: \(\mathrm{SO}(n)\); \(\mathrm{U}(m) \subset \mathrm{SO}(2m)\); \(\mathrm{SU}(m) \subset \mathrm{SO}(2m)\); \(\mathrm{Sp}(m) \subset \mathrm{SO}(4m)\); \(\mathrm{Sp}(m)\mathrm{Sp}(1) \subset \mathrm{SO}(4m)\); \(G_2 \subset \mathrm{SO}(7)\); \(\mathrm{Spin}(7) \subset \mathrm{SO}(8)\).
</div>

Berger's classification is striking because it rules out the vast majority of Lie subgroups of \(\mathrm{SO}(n)\) on purely algebraic grounds: the curvature tensor must lie in a Hol-invariant subspace and must satisfy the Bianchi identities, and these constraints, combined with the requirement of acting irreducibly on the tangent space, leave only the listed groups. The de Rham decomposition theorem reduces the locally reducible case to a product, and the Cartan-Ambrose-Hicks theorem covers the locally symmetric case. The remaining cases form the *special holonomy* groups.

<div class="proposition">
<strong>Proposition 1.3 (Holonomy and parallel structure).</strong> A Riemannian manifold \((M,g)\) admits a parallel almost complex structure \(J\) compatible with \(g\) if and only if \(\mathrm{Hol}(g) \subseteq \mathrm{U}(m)\), in which case \((M,g,J)\) is <strong>Kähler</strong>. It admits in addition a parallel holomorphic volume form if and only if \(\mathrm{Hol}(g) \subseteq \mathrm{SU}(m)\), in which case \((M,g)\) is <strong>Calabi-Yau</strong> and Ricci-flat.
</div>

The Calabi conjecture, proved by Yau in 1978, asserts that on a compact Kähler manifold with \(c_1 = 0\) one can find a Ricci-flat Kähler metric in every Kähler class; this produces the first non-trivial examples of compact manifolds with holonomy exactly \(\mathrm{SU}(m)\). Compact \(G_2\) and \(\mathrm{Spin}(7)\) examples were constructed by Joyce in the 1990s by gluing techniques on resolutions of orbifolds, and these remain among the most subtle objects in differential geometry. The relation \(\mathrm{Hol} \subseteq \mathrm{SU}(m)\) implies \(\mathrm{Ric} = 0\) — special holonomy is in this sense a refinement of the Einstein condition, and it provides essentially the only known systematic source of compact Ricci-flat manifolds.

<div class="remark">
<strong>Remark 1.4.</strong> The Bochner-Weitzenböck formula \(\Delta = \nabla^*\nabla + \mathrm{Ric}\) on \(1\)-forms shows that on a compact Riemannian manifold with non-negative Ricci curvature, every harmonic \(1\)-form is parallel, and is zero if \(\mathrm{Ric}\) is positive somewhere. By Hodge theory this gives \(b_1(M) \leq n\), with equality only for flat tori. Analogous Weitzenböck formulas on spinor bundles, twisted Dirac operators, and forms of higher degree provide topological obstructions to many special-holonomy structures and recur as a central theme in Chapter 6.
</div>

The course in W19 culminated in the proof of the Calabi-Yau theorem via continuity method, the Hard Lefschetz theorem, and the formality of compact Kähler manifolds (a result of Deligne-Griffiths-Morgan-Sullivan), foreshadowing the rational-homotopy techniques developed in Chapter 4.

# Chapter 2: Deformation Theory and Moduli Spaces

Taught at UW as PMATH 965 in Fall 2020 by Satriano.

Deformation theory studies how a geometric object — a complex structure, a scheme, a coherent sheaf, a representation — varies in families, and it provides the local model for moduli spaces. The basic question is: given an object \(X_0\) over a field \(k\), what are the *infinitesimal* deformations of \(X_0\), i.e., flat families \(\mathcal{X} \to \mathrm{Spec}\,A\) with central fibre \(X_0\), where \(A\) is an Artin local \(k\)-algebra with residue field \(k\)? The answer is encoded by a *deformation functor* \(\mathrm{Def}_{X_0} : \mathrm{Art}_k \to \mathrm{Set}\), and the goal is to understand its tangent space, obstructions, and the existence of a hull or a universal formal deformation.

<div class="definition">
<strong>Definition 2.1 (Deformation functor).</strong> Let \(X_0\) be a scheme of finite type over \(k\). Define

\[
\mathrm{Def}_{X_0}(A) = \left\{ \text{flat } \mathcal{X} \to \mathrm{Spec}\,A \text{ with } \mathcal{X} \otimes_A k \cong X_0 \right\}/\sim,
\]

where \(\sim\) is isomorphism inducing the identity on the central fibre. The <em>tangent space</em> is \(T^1 := \mathrm{Def}_{X_0}(k\left[\varepsilon\right]/\varepsilon^2)\), the set of first-order deformations. For \(X_0\) smooth, \(T^1 = H^1(X_0, T_{X_0})\).
</div>

The central technical tool is **Schlessinger's criterion** (1968), which gives necessary and sufficient conditions for a functor \(F : \mathrm{Art}_k \to \mathrm{Set}\) to admit a *hull* — a smooth pro-representing object up to non-canonical isomorphism. The conditions concern the behaviour of \(F\) on fibre products \(A \times_C B\): one needs the natural map \(F(A \times_C B) \to F(A) \times_{F(C)} F(B)\) to be surjective in general and bijective when \(C = k\). When \(F\) is moreover a sheaf for the étale topology on Artinian rings, Schlessinger's hull is genuinely pro-representable.

<div class="theorem">
<strong>Theorem 2.2 (Schlessinger).</strong> A functor \(F : \mathrm{Art}_k \to \mathrm{Set}\) with \(F(k) = *\) and \(\dim_k T^1 F < \infty\) admits a hull if and only if conditions <em>(H1)–(H3)</em> hold; it is pro-representable iff additionally <em>(H4)</em> holds.
</div>

Obstructions to extending a deformation from \(A\) to \(A'\) (where \(A' \twoheadrightarrow A\) is a small extension with kernel \(I\)) live in a second cohomology group \(T^2\). For a smooth scheme \(X_0\), \(T^2 = H^2(X_0, T_{X_0})\); for a singular scheme, one must use the cotangent complex \(\mathbb{L}_{X_0/k}\) of Illusie, and \(T^i = \mathrm{Ext}^i(\mathbb{L}_{X_0/k}, \mathcal{O}_{X_0})\). When \(T^2 = 0\), the deformation functor is *unobstructed* and the formal moduli space is smooth.

<div class="proposition">
<strong>Proposition 2.3 (Bogomolov-Tian-Todorov).</strong> Let \(X_0\) be a compact Calabi-Yau manifold. Then \(\mathrm{Def}_{X_0}\) is unobstructed: every infinitesimal deformation extends to all orders, and the moduli space is smooth of dimension \(h^{1}(X_0, T_{X_0})\).
</div>

A modern viewpoint, due to Deligne, Drinfeld, Hinich, Manetti, Lurie, and Pridham, organizes deformation theory through **differential graded Lie algebras** (dglas). To each suitable geometric problem one associates a dgla \(L^\bullet\), and the deformation functor is recovered as the **Maurer-Cartan functor**

\[
\mathrm{MC}_L(A) = \left\{ x \in L^1 \otimes \mathfrak{m}_A \;\middle|\; dx + \tfrac{1}{2}\left[x,x\right] = 0 \right\} / \mathrm{gauge},
\]

where the gauge action is by exponentiated \(L^0\). This is the content of the *derived deformation principle*: in characteristic zero, every reasonable formal moduli problem is controlled by a dgla (or, more generally, an \(L_\infty\)-algebra), and quasi-isomorphic dglas give equivalent problems. For \(X_0\) a complex manifold, the relevant dgla is the Kodaira-Spencer dgla \((\Omega^{0,\bullet}(X_0, T_{X_0}^{1,0}), \bar\partial, \left[\cdot,\cdot\right])\); for a coherent sheaf \(\mathcal{F}\), it is \(R\mathrm{Hom}(\mathcal{F}, \mathcal{F})\); and so on.

<div class="remark">
<strong>Remark 2.4.</strong> Applications discussed in F20 included the Hilbert scheme of points on a surface (smooth of dimension \(2n\) by Fogarty), deformations of curves of genus \(g\) (giving the moduli stack \(\mathcal{M}_g\) of dimension \(3g - 3\) for \(g \geq 2\)), deformations of K3 surfaces (unobstructed, dimension \(20\), with global Torelli theorem), and abelian varieties. The variation of Hodge structure attached to a family encodes the period map, whose image lives in a flag variety and whose differential satisfies Griffiths transversality.
</div>

The interplay between obstruction theory and Hodge structures is the subject of Griffiths' theory of variations of Hodge structures, and it is one of the most powerful tools in algebraic geometry.

# Chapter 3: Algebraic Stacks and Equivariant Geometry

Taught at UW as PMATH 965 in Winter 2022 by Satriano.

Many natural moduli problems in algebraic geometry — moduli of curves, of vector bundles, of stable maps — fail to be representable by schemes because the objects they parameterize have non-trivial automorphisms. Stacks are the technology designed to remember those automorphisms. A *stack* over a site \(\mathcal{C}\) is, informally, a *sheaf of groupoids*: it assigns to each object \(U \in \mathcal{C}\) a groupoid \(\mathcal{X}(U)\) of "families over \(U\)", and the assignment satisfies descent both for objects and for morphisms.

<div class="definition">
<strong>Definition 3.1 (Fibered category, stack).</strong> A category \(\pi : \mathcal{X} \to \mathcal{C}\) is <em>fibered in groupoids</em> if every morphism \(f : U \to V\) in \(\mathcal{C}\) and object \(\xi \in \mathcal{X}(V)\) admit a Cartesian arrow \(f^*\xi \to \xi\) lifting \(f\), and any two such lifts are uniquely isomorphic. \(\mathcal{X}\) is a <em>stack</em> for a Grothendieck topology on \(\mathcal{C}\) if isomorphisms are a sheaf and every descent datum is effective.
</div>

The most studied stacks are *algebraic*: they admit smooth atlases by schemes. Two flavours appear:

<div class="definition">
<strong>Definition 3.2 (DM and Artin stacks).</strong> A stack \(\mathcal{X}\) over the étale site of \(\mathrm{Sch}/k\) is a <em>Deligne-Mumford stack</em> if it has finite, unramified diagonal and admits an étale surjection \(U \to \mathcal{X}\) from a scheme. It is an <em>Artin stack</em> if the diagonal is representable and quasi-compact and there is a smooth surjection \(U \to \mathcal{X}\).
</div>

The prototypical example is the moduli stack of smooth genus \(g\) curves \(\mathcal{M}_g\), proved by Deligne and Mumford (1969) to be a smooth Deligne-Mumford stack of dimension \(3g - 3\) for \(g \geq 2\). Its compactification \(\overline{\mathcal{M}}_g\) by stable curves is proper. The quotient stack \(\left[X/G\right]\) — for \(G\) acting on a scheme \(X\) — is another fundamental construction: morphisms \(T \to \left[X/G\right]\) are pairs \((P, \varphi)\) where \(P \to T\) is a principal \(G\)-bundle and \(\varphi : P \to X\) is \(G\)-equivariant. When \(G\) acts freely with quotient a scheme, \(\left[X/G\right]\) is just the quotient scheme; in general, it remembers the stabilizers as automorphism groups of points.

<div class="theorem">
<strong>Theorem 3.3 (Keel-Mori).</strong> Every separated Deligne-Mumford stack of finite type over a noetherian scheme admits a coarse moduli space, an algebraic space \(M\) together with a morphism \(\mathcal{X} \to M\) initial among morphisms to algebraic spaces and a bijection on geometric points.
</div>

Cohomology on stacks generalizes both étale cohomology of schemes and group cohomology of finite groups: for the classifying stack \(BG = \left[\mathrm{pt}/G\right]\) of a finite group \(G\), one has \(H^*_{\acute{e}t}(BG, \mathbb{F}_\ell) = H^*(G, \mathbb{F}_\ell)\). For \(G\) reductive acting on \(X\), \(H^*(\left[X/G\right]) = H^*_G(X)\) is equivariant cohomology, recovering the Borel construction \(H^*(EG \times_G X)\).

<div class="proposition">
<strong>Proposition 3.4 (Inertia and residue gerbes).</strong> For an algebraic stack \(\mathcal{X}\), the <em>inertia stack</em> \(I_\mathcal{X} = \mathcal{X} \times_{\mathcal{X} \times \mathcal{X}} \mathcal{X}\) parameterizes pairs \((x, \alpha)\) with \(x \in \mathcal{X}\) and \(\alpha \in \mathrm{Aut}(x)\). At each point of \(\mathcal{X}\), the residue gerbe \(\mathcal{G}_x \subseteq \mathcal{X}\) is a banded gerbe over \(k(x)\) with band \(\mathrm{Aut}(x)\).
</div>

The descent theory underlying stacks is the étale or fppf version of Grothendieck's faithfully flat descent, and the technical bedrock is provided by the Stacks Project (stacks.math.columbia.edu), which is fully public and the canonical modern reference. Olsson's *Algebraic Spaces and Stacks* gives a more compact textbook account.

<div class="remark">
<strong>Remark 3.5.</strong> One subtle theorem covered in W22 was Artin's representability theorem, giving criteria (deformation-theoretic, plus Schlessinger's conditions, plus an effectivity condition) for a functor to be representable by an Artin stack. This is the bridge between abstract deformation theory (Chapter 2) and the construction of moduli stacks: Artin's theorem says that a moduli problem with the right deformation theory <em>is</em> an algebraic stack.
</div>

# Chapter 4: Rational Homotopy Theory in Geometry

Taught at UW as PMATH 965 in Fall 2024 by Milivojević.

Rational homotopy theory is the study of topological spaces up to maps that induce isomorphisms on rational homotopy and rational cohomology. Its central insight, due to Sullivan and Quillen in the late 1960s, is that the rational homotopy type of a simply connected space \(X\) is captured by an entirely algebraic object: a commutative differential graded algebra (cdga) over \(\mathbb{Q}\), which can be chosen to be free as a graded commutative algebra and minimal in a precise sense. The cohomology of \(X\) is then the cohomology of this minimal model, and the rational homotopy groups \(\pi_*(X) \otimes \mathbb{Q}\) are read off from its generators.

<div class="definition">
<strong>Definition 4.1 (Sullivan algebra, minimal model).</strong> A <em>Sullivan algebra</em> is a commutative dga \((\Lambda V, d)\) over \(\mathbb{Q}\), where \(\Lambda V\) is the free graded-commutative algebra on a graded \(\mathbb{Q}\)-vector space \(V = V^{\geq 1}\), equipped with a differential \(d\) for which \(V\) admits an exhaustive filtration \(V_0 \subset V_1 \subset \cdots\) with \(d V_0 = 0\) and \(d V_k \subset \Lambda V_{k-1}\). It is <em>minimal</em> if \(d V \subseteq \Lambda^{\geq 2} V\).
</div>

To a simply connected space \(X\) of finite type one associates Sullivan's cdga \(A_{PL}(X)\) of polynomial differential forms, and Sullivan's theorem produces a minimal Sullivan algebra \((\Lambda V, d)\) with a quasi-isomorphism \((\Lambda V, d) \xrightarrow{\sim} A_{PL}(X)\); this minimal model is unique up to isomorphism. For a smooth manifold one may replace \(A_{PL}(X)\) with the de Rham algebra \(\Omega^*(X)\) tensored with \(\mathbb{R}\), which gives the real homotopy type.

<div class="theorem">
<strong>Theorem 4.2 (Sullivan).</strong> The functor \(X \mapsto (\Lambda V_X, d)\) induces an equivalence between the homotopy category of simply connected rational spaces of finite type and the homotopy category of minimal Sullivan algebras of finite type. Moreover \(V^n_X \cong \mathrm{Hom}(\pi_n(X), \mathbb{Q})\).
</div>

A space is **formal** if its minimal model is quasi-isomorphic to \((H^*(X; \mathbb{Q}), 0)\) — i.e., the rational homotopy type is determined by the cohomology ring alone. The formality theorem of Deligne-Griffiths-Morgan-Sullivan asserts that compact Kähler manifolds are formal; the proof uses the \(\partial\bar\partial\)-lemma to construct a chain of quasi-isomorphisms. Symmetric spaces are formal; \(H\)-spaces are formal; but generic compact symplectic manifolds need not be (counterexamples by McDuff and others).

<div class="proposition">
<strong>Proposition 4.3 (Massey products as obstructions to formality).</strong> If \(\alpha, \beta, \gamma\) are cohomology classes with \(\alpha\beta = 0 = \beta\gamma\), the triple Massey product \(\langle \alpha, \beta, \gamma \rangle \in H^*/\) (indeterminacy) is defined. Non-vanishing of any Massey product (modulo indeterminacy) obstructs formality.
</div>

Quillen's parallel approach uses differential graded Lie algebras instead of cdgas: to a simply connected space he associates a dgla \(\lambda(X)\) whose homology is \(\pi_*(\Omega X) \otimes \mathbb{Q}\) with the Whitehead product as bracket. The Quillen and Sullivan models are Koszul-dual, and the equivalence between them is one of the original instances of Koszul duality.

<div class="remark">
<strong>Remark 4.4 (Geometric applications).</strong> Sullivan models compute, in many cases, the rational cohomology of free loop spaces \(LX\) (relevant to closed geodesics via Vigué-Sullivan-Gromoll-Meyer): if \(X\) is rationally elliptic the Betti numbers of \(LX\) are bounded; if \(X\) is rationally hyperbolic they grow exponentially, forcing infinitely many geometrically distinct closed geodesics on any Riemannian metric. Sullivan models also detect topological obstructions to admitting a complex structure, a symplectic structure, or a metric satisfying the \(dd^c\)-lemma; restrict the realizable rational homotopy types of almost complex manifolds; and compute characteristic classes via the minimal model of \(BO\), \(BU\), \(B\mathrm{Spin}\), etc.
</div>

The standard public reference is Felix-Halperin-Thomas, *Rational Homotopy Theory* (Springer GTM 205); a leaner introduction is Felix-Oprea-Tanré, *Algebraic Models in Geometry* (Oxford GTM).

# Chapter 5: Harmonic Maps

Taught at UW as PMATH 965 in Winter 2025 by Spiro Karigiannis.

A harmonic map between Riemannian manifolds simultaneously generalizes harmonic functions (the case where the target is \(\mathbb{R}\)) and geodesics (the case where the source is an interval). Given Riemannian manifolds \((M,g)\) and \((N,h)\) and a smooth map \(\varphi : M \to N\), the **energy density** is \(e(\varphi) = \tfrac{1}{2} |d\varphi|^2_{g \otimes \varphi^*h}\), and the **energy** is \(E(\varphi) = \int_M e(\varphi) \, \mathrm{vol}_g\). The map \(\varphi\) is **harmonic** if it is a critical point of \(E\) with respect to compactly supported variations.

<div class="definition">
<strong>Definition 5.1 (Tension field).</strong> The Euler-Lagrange equation for the energy is the vanishing of the <em>tension field</em>

\[
\tau(\varphi) = \mathrm{tr}_g \nabla d\varphi \in \Gamma(\varphi^* TN),
\]

where \(\nabla\) is the connection on \(T^*M \otimes \varphi^*TN\) induced by Levi-Civita on \(M\) and the pullback of Levi-Civita on \(N\). In local coordinates,

\[
\tau(\varphi)^\alpha = g^{ij}\!\left(\partial_i \partial_j \varphi^\alpha - {\Gamma^M}^k_{ij} \partial_k \varphi^\alpha + {\Gamma^N}^\alpha_{\beta\gamma}\!\circ\!\varphi \cdot \partial_i \varphi^\beta \partial_j \varphi^\gamma\right).
\]

\(\varphi\) is <em>harmonic</em> iff \(\tau(\varphi) = 0\).
</div>

When \(N = \mathbb{R}\) the tension field reduces to \(\Delta_g \varphi\), so harmonic functions are recovered. When \(M\) is an interval, the equation reduces to \(\nabla_t \dot\varphi = 0\), i.e., geodesic. When \(M = N\) and \(\varphi = \mathrm{id}\), the map is harmonic iff \(g\) is a critical point of an action that turns out to be related to scalar curvature. The harmonic-map equation is a quasilinear elliptic system on \(\varphi\), but it is generally non-linear in a serious way because of the curvature terms involving \(\Gamma^N\).

<div class="proposition">
<strong>Proposition 5.2 (First and second variation).</strong> Let \(\varphi_t\) be a smooth variation of \(\varphi\) with variation field \(V \in \Gamma(\varphi^*TN)\). Then

\[
\left.\frac{d}{dt}\right|_{t=0} E(\varphi_t) = -\int_M \langle V, \tau(\varphi)\rangle \, \mathrm{vol}_g.
\]

At a harmonic map \(\varphi\), the second variation of energy is the quadratic form on \(\Gamma(\varphi^*TN)\)

\[
J_\varphi(V) = \int_M \!\left(|\nabla V|^2 - \langle R^N(V, d\varphi)d\varphi, V\rangle\right) \mathrm{vol}_g.
\]

</div>

Negativity of the curvature of \(N\) makes \(J_\varphi\) positive-definite, which underlies many existence and rigidity results. The single most influential theorem in the subject is:

<div class="theorem">
<strong>Theorem 5.3 (Eells-Sampson 1964).</strong> Let \(M\) be compact and \(N\) be compact with non-positive sectional curvature. Then every smooth map \(\varphi_0 : M \to N\) is freely homotopic to a smooth harmonic map. In fact the heat flow \(\partial_t \varphi = \tau(\varphi)\) starting from \(\varphi_0\) exists for all time and converges (along a subsequence) to a harmonic map.
</div>

The proof uses a Bochner-type identity expressing \(\Delta e(\varphi) = |\nabla d\varphi|^2 + \mathrm{Ric}^M(d\varphi, d\varphi) - \langle R^N(d\varphi)d\varphi, d\varphi\rangle\), combined with parabolic theory for the heat flow. Non-positive curvature of \(N\) makes the curvature term favourable, giving uniform energy bounds and convergence.

<div class="remark">
<strong>Remark 5.4 (Siu-Sampson rigidity, complex geometry).</strong> When \(M\) and \(N\) are Kähler manifolds and \(N\) has strongly negative curvature in the sense of Siu, every harmonic map \(M \to N\) of generic rank \(\geq 2\) is either holomorphic or anti-holomorphic; this gives strong rigidity for compact Kähler manifolds homotopy equivalent to negatively curved Kähler manifolds. The Sacks-Uhlenbeck theory deals with the case of bubbling for harmonic maps from surfaces, when energy concentrates and one must blow up to recover harmonic spheres in the limit.
</div>

The standard references used in W25 are Eells-Lemaire's CBMS *Selected Topics in Harmonic Maps*, Urakawa's *Calculus of Variations and Harmonic Maps*, and the original Eells-Sampson paper *Harmonic mappings of Riemannian manifolds* (Amer. J. Math. 86, 1964).

# Chapter 6: Spin Geometry

Taught at UW as PMATH 965 in Fall 2026.

Spin geometry concerns geometric structures on Riemannian manifolds beyond the orthogonal frame bundle: it asks for a lift of the structure group \(\mathrm{SO}(n)\) to its double cover \(\mathrm{Spin}(n)\), and on such a lift it constructs the natural first-order elliptic operator now called the **Dirac operator**. The algebraic foundation is the **Clifford algebra** \(\mathrm{Cl}(V, q)\) of a quadratic vector space, which has many equivalent definitions: as the universal associative algebra generated by \(V\) subject to \(v^2 = -q(v)\cdot 1\); as the quotient of the tensor algebra by this relation; or, in low dimensions, as a matrix algebra over \(\mathbb{R}\), \(\mathbb{C}\), or \(\mathbb{H}\) according to Bott periodicity (mod 8 in the real case, mod 2 in the complex case).

<div class="definition">
<strong>Definition 6.1 (Spin and Spin\(^c\)).</strong> The <em>spin group</em> \(\mathrm{Spin}(n)\) is the connected double cover of \(\mathrm{SO}(n)\); concretely, it is the group of even, unit-length elements of \(\mathrm{Cl}(\mathbb{R}^n)\) under Clifford multiplication. The <em>spin\(^c\) group</em> is \(\mathrm{Spin}^c(n) = \mathrm{Spin}(n) \times_{\mathbb{Z}/2} \mathrm{U}(1)\). A <em>spin structure</em> on an oriented Riemannian \(n\)-manifold \(M\) is a principal \(\mathrm{Spin}(n)\)-bundle \(P_{\mathrm{Spin}}\) with a double cover \(P_{\mathrm{Spin}} \to P_{\mathrm{SO}}\) compatible with the group covering.
</div>

A spin structure exists iff the second Stiefel-Whitney class \(w_2(M) \in H^2(M, \mathbb{Z}/2)\) vanishes; when it exists, the set of spin structures is a torsor over \(H^1(M, \mathbb{Z}/2)\). A spin\(^c\) structure exists iff \(w_2(M)\) lifts to an integral class, which is automatic on every almost complex manifold (the canonical \(\mathrm{Spin}^c\) structure has determinant line \(K_M^{-1}\)).

<div class="definition">
<strong>Definition 6.2 (Spinor bundle, Dirac operator).</strong> Let \(\Delta_n\) be the unique irreducible complex representation of \(\mathrm{Cl}_n \otimes \mathbb{C}\) of minimal dimension. The <em>spinor bundle</em> is \(\mathcal{S} = P_{\mathrm{Spin}} \times_{\mathrm{Spin}(n)} \Delta_n\). The Levi-Civita connection lifts canonically to a connection \(\nabla\) on \(\mathcal{S}\), and Clifford multiplication \(c : T^*M \otimes \mathcal{S} \to \mathcal{S}\) is parallel. The <em>Dirac operator</em> is

\[
D = c \circ \nabla : \Gamma(\mathcal{S}) \to \Gamma(\mathcal{S}), \qquad D = \sum_i e_i \cdot \nabla_{e_i}.
\]

</div>

\(D\) is a first-order elliptic differential operator, formally self-adjoint on a closed manifold, and its square satisfies the **Lichnerowicz formula**

\[
D^2 = \nabla^*\nabla + \tfrac{1}{4} R,
\]

where \(R\) is the scalar curvature. This identity is the source of the most celebrated obstructions in the field: if \(R > 0\) everywhere on a closed spin manifold, then \(D^2 \geq \nabla^*\nabla > 0\) on harmonic spinors, so \(\ker D = 0\), hence \(\mathrm{ind}\,D = 0\). Combined with the Atiyah-Singer index theorem one obtains:

<div class="theorem">
<strong>Theorem 6.3 (Lichnerowicz).</strong> If \(M^{4k}\) is a closed spin manifold admitting a metric of positive scalar curvature, then \(\hat{A}(M) = 0\).
</div>

This was the first obstruction to positive scalar curvature beyond elementary topology, and it ruled out positive scalar curvature on, for example, the K3 surface. The Atiyah-Singer index theorem, applied to twisted Dirac operators \(D_E = D \otimes \nabla^E\) on \(\mathcal{S} \otimes E\), computes

\[
\mathrm{ind}\,D_E = \int_M \hat{A}(M) \cdot \mathrm{ch}(E),
\]

recovering Hirzebruch-Riemann-Roch (twist by a holomorphic line bundle on a Kähler manifold), the Hirzebruch signature theorem (twist by \(\Lambda^*T^*M\) and pair appropriately), and the Gauss-Bonnet-Chern theorem (Euler-characteristic Dirac operator).

<div class="remark">
<strong>Remark 6.4.</strong> The course covered heat kernel proofs of the index theorem (after McKean-Singer, Patodi, Getzler), giving \(\mathrm{ind}\,D = \lim_{t \to 0^+} \mathrm{Tr}(e^{-tD^*D} - e^{-tDD^*})\) and using Getzler's rescaling to extract the index density. On Kähler manifolds the Dirac operator coincides up to identifications with \(\sqrt{2}(\bar\partial + \bar\partial^*)\) acting on \(\Omega^{0,*} \otimes K^{1/2}\), connecting spin geometry to Hodge theory and complex geometry. Recent applications include Seiberg-Witten theory (a perturbed Dirac equation coupled to a connection on the determinant line of a \(\mathrm{Spin}^c\) structure) and Witten's heuristic proof of the index theorem via supersymmetric quantum mechanics.
</div>

The standard reference is Lawson-Michelsohn, *Spin Geometry* (Princeton Mathematical Series 38), supplemented by Berline-Getzler-Vergne's *Heat Kernels and Dirac Operators* (Springer Grundlehren) and the public lecture notes of Dan Freed (UT Austin) and Mike Hopkins (Harvard).

# Chapter 7: Higher and Derived Stacks

Taught at UW as PMATH 965 in Fall 2026 (offered as a second instance under the title *Algebraic Stacks*; the framing here follows the modern higher-categorical tradition).

The stacks of Chapter 3 take values in groupoids — that is, in 1-truncated spaces. Many natural geometric problems demand higher truncation: deformations of objects in a derived category, mapping stacks between schemes, intersections of subschemes that are not transverse. **Higher stacks** take values in \(\infty\)-groupoids (Kan complexes); **derived stacks** take values in simplicial commutative rings or connective \(E_\infty\)-rings. Together they form the foundation of *derived algebraic geometry*, developed by Toën-Vezzosi and Lurie in the 2000s.

<div class="definition">
<strong>Definition 7.1 (Higher stack).</strong> Let \(\mathcal{C}\) be a Grothendieck site. A <em>prestack</em> on \(\mathcal{C}\) is a functor \(\mathcal{X} : \mathcal{C}^{op} \to \mathcal{S}\) to the \(\infty\)-category of spaces (Kan complexes). It is a <em>higher stack</em> if it satisfies <em>hyperdescent</em>: for every covering hypercover \(U_\bullet \to U\), the natural map

\[
\mathcal{X}(U) \to \lim_{\left[n\right] \in \Delta} \mathcal{X}(U_n)
\]

is an equivalence of spaces.
</div>

When \(\mathcal{X}\) is \(n\)-truncated (i.e., takes values in \(n\)-types), this recovers the classical notion of an \(n\)-stack: \(0\)-stacks are sheaves of sets, \(1\)-stacks are stacks of groupoids (Chapter 3), \(2\)-stacks involve 2-categories of objects, morphisms, and 2-morphisms, and so on. The classifying stack \(K(G, n)\) of an abelian group \(G\) is an \(n\)-stack; \(K(\mathbb{G}_m, 2)\) classifies \(\mathbb{G}_m\)-gerbes; \(K(\mathbb{G}_m, n)\) classifies higher \(\mathbb{G}_m\)-gerbes used in twisted K-theory and elliptic cohomology.

<div class="definition">
<strong>Definition 7.2 (Derived stack).</strong> Let \(\mathrm{sCRing}\) denote the \(\infty\)-category of simplicial commutative rings. A <em>derived prestack</em> is a functor \(\mathcal{X} : \mathrm{sCRing} \to \mathcal{S}\); a <em>derived stack</em> satisfies étale (or fppf) hyperdescent. It is <em>geometric</em> if it admits an iterated smooth atlas.
</div>

Derived stacks make sense of intersections "with multiplicity" by computing \(\mathrm{Tor}\): if \(Y\) and \(Z\) are subschemes of \(X\), the derived intersection is the derived tensor product \(\mathcal{O}_Y \otimes^L_{\mathcal{O}_X} \mathcal{O}_Z\), and the resulting derived scheme has cotangent complex with cohomology in negative degrees recording the failure of transversality.

<div class="proposition">
<strong>Proposition 7.3 (Cotangent complex).</strong> Every derived geometric stack \(\mathcal{X}\) admits a cotangent complex \(\mathbb{L}_\mathcal{X}\), an object of the derived category of quasi-coherent sheaves on \(\mathcal{X}\), governing infinitesimal deformations. The Atiyah class, the Chern character, and the Riemann-Roch formalism all extend.
</div>

Two of the most striking applications are the construction of **shifted symplectic structures** by Pantev-Toën-Vaquié-Vezzosi (PTVV, 2013) — for instance the moduli stack of \(G\)-bundles on a Calabi-Yau \(d\)-fold carries a canonical \((2-d)\)-shifted symplectic form — and the systematic treatment of **derived loop spaces**: \(LX = \mathrm{Map}(S^1, X)\) computed in derived algebraic geometry produces \(\mathcal{O}_{LX} \simeq \mathrm{HH}_*(X)\), the Hochschild homology, recovering the HKR isomorphism for smooth schemes in characteristic zero.

<div class="remark">
<strong>Remark 7.4 (Higher topos and geometric Langlands).</strong> Lurie's <em>Higher Topos Theory</em> and <em>Higher Algebra</em> provide the foundational language. Geometric Langlands, in its modern formulation by Arinkin-Gaitsgory and others, lives natively on derived stacks (e.g. the derived stack of local systems \(\mathrm{Loc}_G(X)\) on a curve), and many statements that are mysterious classically become tautological once one passes to the derived setting. Public lecture notes by Dennis Gaitsgory (Harvard), Sam Raskin (UT), and Bertrand Toën (CNRS) give accessible entry points.
</div>

# Chapter 8: Geometric Aspects of Gauge Theory

Taught at UW as PMATH 965 in past iterations (companion to the Winter 2020 Moraru gauge-theory course treated separately in the promoted pmath965-gauge file).

The smooth topology of a compact 4-manifold — classified topologically by Freedman — is *not* determined by its intersection form. The smooth category contains strictly more information, and the tool that first revealed this extra information was gauge theory: the study of connections on principal bundles modulo the infinite-dimensional gauge group. Chapter 8 develops the language and gives a road map to the Donaldson–Seiberg–Witten revolution that transformed 4-manifold topology between 1982 and the present.

<div class="definition">
<strong>Definition 8.1 (Connection, curvature, gauge group).</strong> Let \(P \to M\) be a principal \(G\)-bundle with compact structure group. A <em>connection</em> is a \(G\)-equivariant horizontal distribution on \(P\), equivalently a \(\mathfrak{g}\)-valued 1-form \(A \in \Omega^1(P; \mathfrak g)\) satisfying standard compatibilities. The <em>curvature</em> is the \(\mathfrak g\)-valued 2-form \(F_A = dA + \tfrac{1}{2}[A, A] \in \Omega^2(M; \mathrm{ad}\,P)\). The <em>gauge group</em> \(\mathcal G = \mathrm{Aut}_G(P)\) acts on the affine space \(\mathcal A\) of connections.
</div>

<div class="definition">
<strong>Definition 8.2 (Yang–Mills functional).</strong> The <em>Yang–Mills functional</em> on connections is
\[ \mathrm{YM}(A) = \tfrac{1}{2} \int_M |F_A|^2 \operatorname{vol}_g. \]
Its critical points satisfy the <em>Yang–Mills equation</em> \(d_A^* F_A = 0\); the second Bianchi identity \(d_A F_A = 0\) is automatic.
</div>

<div class="theorem">
<strong>Theorem 8.3 (Donaldson, 1983).</strong> Let \(M\) be a smooth compact simply connected 4-manifold with positive-definite intersection form. Then the intersection form is diagonalizable over \(\mathbb{Z}\): it is isomorphic to \(n \langle 1 \rangle\) for some \(n\). Consequently, many topological 4-manifolds (Freedman's classification produces any unimodular form) do <em>not</em> admit any smooth structure.
</div>

Donaldson's proof uses the moduli space \(\mathcal{M}\) of anti-self-dual (\(F_A^+ = 0\)) connections on an \(\mathrm{SU}(2)\)-bundle with \(c_2 = 1\). For generic metrics this moduli space is a smooth oriented 5-manifold whose boundary consists of the manifold itself (from flat connections) together with finitely many isolated reducible connections (from \(\mathrm{U}(1)\)-subbundles indexed by characteristic classes). Cobordism-theoretic invariants of \(\mathcal M\) then force the intersection form to have the claimed shape.

<div class="example">
<strong>Example 8.4 (Exotic \(\mathbb{R}^4\)).</strong> Combining Donaldson's theorem with Freedman's classification, Taubes (1987) and Gompf (1985) showed that \(\mathbb{R}^4\) admits uncountably many pairwise non-diffeomorphic smooth structures — the only dimension in which this occurs. All other \(\mathbb{R}^n\) have a unique smooth structure; \(\mathbb{R}^4\) is the lone exception, and gauge theory is the only tool that detects the difference.
</div>

<div class="theorem">
<strong>Theorem 8.5 (Seiberg–Witten, 1994).</strong> On a 4-manifold with a \(\mathrm{Spin}^c\) structure \(\mathfrak s\), the Seiberg–Witten equations
\[ F_A^+ = \sigma(\Phi), \qquad D_A \Phi = 0 \]
— a perturbed Dirac equation coupled to a \(\mathrm{U}(1)\) connection on the determinant line of \(\mathfrak s\) — have a compact, smooth, generically finite moduli space. Its oriented count is a smooth invariant \(\mathrm{SW}(\mathfrak s) \in \mathbb{Z}\).
</div>

<div class="remark">
<strong>Higher-dimensional gauge theory.</strong> Beyond dimension 4, gauge theory probes <em>special-holonomy</em> geometry (Chapter 1). On a \(G_2\)-manifold \(M^7\), a connection is a <em>\(G_2\)-instanton</em> if \(F_A \wedge \psi = -*F_A\) where \(\psi\) is the coassociative 4-form; on a \(\mathrm{Spin}(7)\)-manifold, one asks for \(F_A^{+} = 0\) where the decomposition of 2-forms is into irreducibles under \(\mathrm{Spin}(7)\). Counting \(G_2\)-instantons was proposed by Donaldson–Thomas (1998) as a way to define invariants of \(G_2\)-manifolds, and the project — to make this count well-defined — remains a central open program, with Waterloo's Karigiannis group as a principal contributor.
</div>

The **Donaldson–Uhlenbeck–Yau theorem** (1985) closes a remarkable circle: a holomorphic vector bundle on a compact Kähler manifold is *stable* (in Mumford's sense) iff it admits a **Hermitian–Einstein** connection — a gauge-theoretic condition. Algebra and differential geometry converge, and the moduli of stable bundles acquires a metric structure. This is the Kähler–Calabi–Yau branch of the gauge-theoretic tree; Seiberg–Witten is the differential-topological branch; \(G_2\)-instantons are the special-holonomy branch. All three converge on the same algebraic objects when the underlying manifold has additional structure, and Karigiannis's Waterloo research program lives at exactly this triple intersection.

---

# Chapter 9: Motivic Integration

Mentioned as a possible topic in past PMATH 965 outlines (W22); chapter framed from the standard public literature, which is extensive and well-developed.

Motivic integration, introduced by Maxim Kontsevich in a 1995 Orsay talk, is a form of integration whose values live not in a field but in the **Grothendieck ring of varieties** — a ring built from isomorphism classes of algebraic varieties under scissor and product relations. The striking consequence of Kontsevich's construction is that two birationally equivalent Calabi–Yau manifolds have the same Hodge numbers, a fact that was not previously amenable to any direct geometric argument. Since then motivic integration has become a central tool in singularity theory, \(p\)-adic analysis, and the arithmetic theory of varieties.

<div class="definition">
<strong>Definition 9.1 (Grothendieck ring of varieties).</strong> For a field \(k\), the <em>Grothendieck ring of varieties</em> \(K_0(\mathrm{Var}_k)\) is the free abelian group on isomorphism classes \([X]\) of finite-type \(k\)-varieties, modulo the <em>scissor relation</em> \([X] = [Y] + [X \setminus Y]\) for \(Y \subseteq X\) closed, with product \([X] \cdot [Y] = [X \times Y]\). Writing \(\mathbb{L} = [\mathbb{A}^1_k]\) for the <em>Lefschetz motive</em>, one localizes: \(\mathcal{M}_k = K_0(\mathrm{Var}_k)[\mathbb{L}^{-1}]\) and completes with respect to the dimension filtration.
</div>

<div class="definition">
<strong>Definition 9.2 (Arc space).</strong> For an algebraic variety \(X\) over \(k\), the <em>arc space</em> is the inverse limit
\[ \mathcal{L}(X) = \varprojlim_n \mathcal{L}_n(X), \]
where \(\mathcal{L}_n(X) = \mathrm{Hom}(\mathrm{Spec}\, k[t]/t^{n+1}, X)\) is the <em>\(n\)-jet scheme</em>. For \(X\) smooth of dimension \(d\), \(\mathcal{L}_n(X)\) is a Zariski-locally-trivial \(\mathbb{A}^{nd}\)-bundle over \(X\).
</div>

<div class="theorem">
<strong>Theorem 9.3 (Kontsevich; change of variables).</strong> Let \(f \colon Y \to X\) be a proper birational morphism of smooth varieties. For a measurable \(A \subseteq \mathcal{L}(X)\),
\[ \int_A \mathbb{L}^{-\operatorname{ord}_t F} \, d\mu_X = \int_{f^{-1}A} \mathbb{L}^{-\operatorname{ord}_t(F \circ f)} \cdot \mathbb{L}^{-\operatorname{ord}_t J_f} \, d\mu_Y, \]
where \(J_f\) is the Jacobian ideal of \(f\). Applied to two resolutions of the same Calabi–Yau variety, the identity shows that the motivic integral \(\int_{\mathcal{L}(X)} d\mu_X \in \mathcal{M}_k\) is a birational invariant.
</div>

<div class="example">
<strong>Example 9.4 (Birational Calabi–Yau have equal Hodge numbers).</strong> Let \(X_1, X_2\) be smooth projective Calabi–Yau manifolds, birational to each other. Kontsevich's motivic integral produces
\[ \int_{\mathcal{L}(X_1)} d\mu = \int_{\mathcal{L}(X_2)} d\mu \in \mathcal{M}_k. \]
Specializing both sides via the Hodge-realization homomorphism \(\mathcal{M}_k \to \mathbb{Z}[u, v]\) (which sends \([X]\) to the E-polynomial \(E(X; u, v)\) encoding Hodge–Deligne numbers) gives equality of Hodge numbers. No algebraic-geometric argument of comparable generality was known before.
</div>

<div class="theorem">
<strong>Theorem 9.5 (Denef–Loeser; motivic Igusa zeta function).</strong> For a regular function \(f \colon X \to \mathbb{A}^1\) on a smooth variety, the <em>motivic Igusa zeta function</em>
\[ Z_{\mathrm{mot}}(f; T) = \sum_{n \ge 1} [\mathcal{L}_n(X) \cap \{\operatorname{ord}_t f = n\}] \cdot \mathbb{L}^{-nd} T^n \in \mathcal{M}_k[\![T]\!] \]
is rational in \(T\): a quotient of polynomials in \(T\) with coefficients in \(\mathcal{M}_k\). Its specializations recover the classical Igusa \(p\)-adic and the topological zeta function of Denef.
</div>

<div class="remark">
<strong>Modern threads.</strong> The subject has branched into several active programs: <em>Hrushovski–Kazhdan</em> used model theory of valued fields to give a purely logical construction of motivic integration, yielding new invariants and a direct comparison with non-archimedean integration; <em>Cluckers–Loeser</em> developed a theory of motivic integration for definable functions in the Denef–Pas language, with applications to the Fundamental Lemma in the Langlands program; and <em>motivic integration on Berkovich spaces</em> (Nicaise, Chambert-Loir–Ducros) provides a non-archimedean analytic framework in which the integrals become genuinely topological. The Waterloo pure-math group — including Rahim Moosa — has contributed directly to the model-theoretic branch of this program.
</div>

The standard public references are Eduard Looijenga's Bourbaki seminar (1999/2000, no. 874) for the original Kontsevich construction; Denef–Loeser's survey articles on arxiv for the zeta-function applications; and the monograph of Chambert-Loir, Nicaise, and Sebag, *Motivic Integration* (Birkhäuser Progress in Math, 2018) for a modern textbook treatment.
