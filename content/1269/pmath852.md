---
made_up: true
title: "PMATH 852: Several Complex Variables and Hodge Theory"
subjects: "PMATH"
---

*These notes synthesize material from P. Griffiths and J. Harris's Principles of Algebraic Geometry, D. Huybrechts's Complex Geometry, C. Voisin's Hodge Theory and Complex Algebraic Geometry, L. Hörmander's Introduction to Complex Analysis in Several Variables, and R.O. Wells's Differential Analysis on Complex Manifolds, enriched with material from MIT OCW 18.117 and M. Kazarian's lecture notes.*

---

# Chapter 1: Holomorphic Functions of Several Variables

The passage from one to several complex variables is one of the most striking transitions in all of mathematics. While many phenomena from complex analysis of one variable persist — the maximum principle, the identity theorem, the Cauchy integral formula — the theory of several complex variables exhibits profoundly new behaviour that has no one-variable analogue. The most dramatic example is Hartogs' extension theorem: in dimensions \(n \geq 2\), isolated singularities of holomorphic functions are automatically removable, a phenomenon that simply cannot occur when \(n = 1\). This chapter develops the foundational theory, beginning with holomorphic functions on \(\mathbb{C}^n\) and culminating in the characterization of domains of holomorphy.

## 1.1 Holomorphic Functions on \(\mathbb{C}^n\)

We begin by establishing the basic objects of study. Throughout, we write points of \(\mathbb{C}^n\) as \(z = (z_1, \dots, z_n)\) with \(z_j = x_j + iy_j\), and we identify \(\mathbb{C}^n\) with \(\mathbb{R}^{2n}\) via the mapping \((z_1, \dots, z_n) \mapsto (x_1, y_1, \dots, x_n, y_n)\).

<div class="definition">
<strong>Definition 1.1 (Holomorphic Function).</strong> Let \(U \subseteq \mathbb{C}^n\) be an open set. A function \(f: U \to \mathbb{C}\) is <em>holomorphic</em> if it is holomorphic in each variable separately, i.e., for each \(j = 1, \dots, n\) and each fixed \((z_1, \dots, z_{j-1}, z_{j+1}, \dots, z_n) \in \mathbb{C}^{n-1}\), the function

\[
w \mapsto f(z_1, \dots, z_{j-1}, w, z_{j+1}, \dots, z_n)
\]
is holomorphic (in the one-variable sense) on the open subset of \(\mathbb{C}\) where it is defined. We write \(\mathcal{O}(U)\) for the ring of holomorphic functions on \(U\).
</div>

This definition, due to the requirement of separate holomorphicity in each variable, might appear weaker than one would expect. A remarkable theorem of Hartogs (1906) shows that it is in fact equivalent to far stronger regularity conditions.

<div class="definition">
<strong>Definition 1.2 (Polydisc).</strong> For \(a = (a_1, \dots, a_n) \in \mathbb{C}^n\) and \(r = (r_1, \dots, r_n)\) with each \(r_j > 0\), the <em>polydisc</em> centred at \(a\) with polyradius \(r\) is

\[
\Delta(a, r) = \{ z \in \mathbb{C}^n : |z_j - a_j| < r_j \text{ for all } j = 1, \dots, n \}.
\]
Its <em>distinguished boundary</em> (or <em>Shilov boundary</em>) is

\[
T(a, r) = \{ z \in \mathbb{C}^n : |z_j - a_j| = r_j \text{ for all } j = 1, \dots, n \},
\]
which is a real \(n\)-dimensional torus, rather than the full topological boundary of the polydisc.
</div>

<div class="remark">
<strong>Remark 1.3.</strong> Observe that the polydisc \(\Delta(a,r)\) is the product of one-variable discs \(D(a_1, r_1) \times \cdots \times D(a_n, r_n)\). This product structure is what makes the polydisc a natural domain for induction on \(n\). However, the polydisc is <em>not</em> a ball; the unit polydisc \(\Delta(0, (1, \dots, 1))\) and the unit ball \(B(0, 1) = \{z : |z_1|^2 + \cdots + |z_n|^2 < 1\}\) are biholomorphically inequivalent for \(n \geq 2\) (a fact proved by Poincaré in 1907, in stark contrast with the Riemann mapping theorem in one variable).
</div>

## 1.2 The Cauchy Integral Formula in Polydiscs

The Cauchy integral formula generalises to several variables by iterating the one-variable formula over the distinguished boundary of a polydisc.

<div class="theorem">
<strong>Theorem 1.4 (Cauchy Integral Formula for Polydiscs).</strong> Let \(f\) be holomorphic on a neighbourhood of the closed polydisc \(\overline{\Delta(a, r)}\). Then for all \(z \in \Delta(a, r)\),

\[
f(z) = \frac{1}{(2\pi i)^n} \int_{T(a,r)} \frac{f(\zeta_1, \dots, \zeta_n)}{(\zeta_1 - z_1) \cdots (\zeta_n - z_n)} \, d\zeta_1 \cdots d\zeta_n.
\]
</div>

<div class="proof">
<strong>Proof.</strong> We proceed by induction on \(n\). The case \(n = 1\) is the classical Cauchy integral formula. For the inductive step, fix \(z = (z_1, \dots, z_n) \in \Delta(a, r)\). Since \(f\) is holomorphic in \(z_n\) with the other variables fixed, the one-variable Cauchy formula gives

\[
f(z_1, \dots, z_n) = \frac{1}{2\pi i} \int_{|\zeta_n - a_n| = r_n} \frac{f(z_1, \dots, z_{n-1}, \zeta_n)}{\zeta_n - z_n} \, d\zeta_n.
\]
Now for fixed \(\zeta_n\) with \(|\zeta_n - a_n| = r_n\), the function \((z_1, \dots, z_{n-1}) \mapsto f(z_1, \dots, z_{n-1}, \zeta_n)\) is holomorphic in \(n-1\) variables on a neighbourhood of \(\overline{\Delta(a', r')}\) where \(a' = (a_1, \dots, a_{n-1})\) and \(r' = (r_1, \dots, r_{n-1})\). By the inductive hypothesis,

\[
f(z_1, \dots, z_{n-1}, \zeta_n) = \frac{1}{(2\pi i)^{n-1}} \int_{T(a', r')} \frac{f(\zeta_1, \dots, \zeta_{n-1}, \zeta_n)}{(\zeta_1 - z_1) \cdots (\zeta_{n-1} - z_{n-1})} \, d\zeta_1 \cdots d\zeta_{n-1}.
\]
Substituting back and applying Fubini's theorem (justified since the integrand is continuous on the compact set \(T(a, r)\)) yields the desired formula. \(\square\)
</div>

<div class="corollary">
<strong>Corollary 1.5 (Cauchy Inequalities).</strong> Under the hypotheses of Theorem 1.4, for any multi-index \(\alpha = (\alpha_1, \dots, \alpha_n) \in \mathbb{N}_0^n\),

\[
\left| \frac{\partial^{|\alpha|} f}{\partial z_1^{\alpha_1} \cdots \partial z_n^{\alpha_n}}(a) \right| \leq \frac{\alpha!}{r^\alpha} \sup_{T(a,r)} |f|,
\]
where \(|\alpha| = \alpha_1 + \cdots + \alpha_n\), \(\alpha! = \alpha_1! \cdots \alpha_n!\), and \(r^\alpha = r_1^{\alpha_1} \cdots r_n^{\alpha_n}\).
</div>

## 1.3 Power Series Expansions

As in one variable, holomorphic functions admit convergent power series expansions.

<div class="theorem">
<strong>Theorem 1.6 (Power Series Expansion).</strong> Let \(f \in \mathcal{O}(\Delta(a, r))\). Then \(f\) has a unique power series expansion

\[
f(z) = \sum_{\alpha \in \mathbb{N}_0^n} c_\alpha (z - a)^\alpha,
\]
converging absolutely and uniformly on compact subsets of \(\Delta(a, r)\), where

\[
c_\alpha = \frac{1}{\alpha!} \frac{\partial^{|\alpha|} f}{\partial z^\alpha}(a) = \frac{1}{(2\pi i)^n} \int_{T(a, r)} \frac{f(\zeta)}{(\zeta - a)^{\alpha + \mathbf{1}}} \, d\zeta,
\]
with \(\mathbf{1} = (1, \dots, 1)\) and \((\zeta - a)^{\alpha + \mathbf{1}} = \prod_j (\zeta_j - a_j)^{\alpha_j + 1}\).
</div>

<div class="proof">
<strong>Proof.</strong> For \(z \in \Delta(a, r)\), the Cauchy kernel admits the expansion

\[
\frac{1}{(\zeta_j - z_j)} = \frac{1}{(\zeta_j - a_j)} \cdot \frac{1}{1 - \frac{z_j - a_j}{\zeta_j - a_j}} = \sum_{\alpha_j = 0}^\infty \frac{(z_j - a_j)^{\alpha_j}}{(\zeta_j - a_j)^{\alpha_j + 1}},
\]
converging absolutely since \(|z_j - a_j| < r_j = |\zeta_j - a_j|\) for \(\zeta \in T(a, r)\). Taking the product over \(j = 1, \dots, n\) and substituting into the Cauchy integral formula (Theorem 1.4), the absolute convergence justifies interchanging summation and integration, yielding the result. \(\square\)
</div>

The following deep result, due to Hartogs, shows that the definition of holomorphicity via separate analyticity implies joint analyticity — a fact whose proof requires substantially more work in the several-variable setting.

<div class="theorem">
<strong>Theorem 1.7 (Hartogs' Theorem on Separate Analyticity).</strong> Let \(U \subseteq \mathbb{C}^n\) be open and \(f: U \to \mathbb{C}\) be separately holomorphic in each variable. Then \(f\) is jointly holomorphic (and in particular, jointly continuous and \(C^\infty\)).
</div>

<div class="remark">
<strong>Remark 1.8.</strong> Hartogs' theorem is remarkable because the analogous statement over \(\mathbb{R}\) is false: there exist functions \(f: \mathbb{R}^2 \to \mathbb{R}\) that are separately continuous in each variable but not jointly continuous. The holomorphicity condition is what forces the stronger conclusion.
</div>

## 1.4 Hartogs' Extension Theorem

We now come to one of the most striking phenomena in several complex variables. In one variable, the function \(1/z\) is holomorphic on \(\mathbb{C} \setminus \{0\}\) and cannot be extended to all of \(\mathbb{C}\). In contrast, for \(n \geq 2\), isolated singularities are always removable.

<div class="theorem">
<strong>Theorem 1.9 (Hartogs' Extension Theorem).</strong> Let \(n \geq 2\), let \(U \subseteq \mathbb{C}^n\) be a connected open set, and let \(K \subset U\) be a compact subset such that \(U \setminus K\) is connected. Then every holomorphic function \(f \in \mathcal{O}(U \setminus K)\) extends uniquely to a holomorphic function \(\tilde{f} \in \mathcal{O}(U)\).
</div>

<div class="proof">
<strong>Proof.</strong> We give the proof for the important special case where \(K\) is a single point, say \(K = \{0\}\) and \(U\) contains the origin. After a translation and scaling, we may assume \(\overline{\Delta(0, r)} \subset U\) for some polyradius \(r\).

Consider the function defined by the Cauchy integral:

\[
\tilde{f}(z) = \frac{1}{2\pi i} \int_{|\zeta_n| = r_n} \frac{f(z_1, \dots, z_{n-1}, \zeta_n)}{\zeta_n - z_n} \, d\zeta_n,
\]
for \((z_1, \dots, z_{n-1})\) near the origin and \(|z_n| < r_n\). Since the integrand involves \(f\) evaluated only at points with \(|\zeta_n| = r_n\), and we may choose \(r_n\) so that these points are away from the origin, \(\tilde{f}\) is well-defined and holomorphic on a polydisc about the origin. For \(z \neq 0\) in this polydisc, the one-variable Cauchy formula shows \(\tilde{f}(z) = f(z)\), since \(z_n \mapsto f(z_1, \dots, z_n)\) is holomorphic on the disc \(|z_n| < r_n\) when \((z_1, \dots, z_{n-1}) \neq 0\). By the identity theorem for holomorphic functions, \(\tilde{f} = f\) on the connected set \(U \setminus K\). \(\square\)
</div>

<div class="example">
<strong>Example 1.10.</strong> The function \(f(z_1, z_2) = 1/(z_1^2 + z_2^2)\) is holomorphic on \(\mathbb{C}^2 \setminus V\), where \(V = \{z_1^2 + z_2^2 = 0\}\) is a complex curve (not an isolated point). Hartogs' theorem does not apply since the singular set is not compact. Indeed, \(f\) genuinely has singularities along \(V\) and cannot be extended. This illustrates that the compactness of \(K\) (or at least the connectivity of the complement) is essential.
</div>

<div class="remark">
<strong>Remark 1.11.</strong> Hartogs' extension theorem has profound consequences. It implies that in \(\mathbb{C}^n\) for \(n \geq 2\), there is no analogue of the Laurent series with a nontrivial principal part at an isolated point. More precisely, isolated singularities of holomorphic functions are always removable. This is a phenomenon entirely without parallel in one complex variable and is one of the primary motivations for studying domains of holomorphy.
</div>

## 1.5 Domains of Holomorphy

Hartogs' extension theorem raises a fundamental question: given a domain \(\Omega \subseteq \mathbb{C}^n\), is it possible that every holomorphic function on \(\Omega\) extends to a strictly larger domain? This leads to the notion of a domain of holomorphy — a domain that is, in some sense, the natural domain of definition for at least one holomorphic function.

<div class="definition">
<strong>Definition 1.12 (Domain of Holomorphy).</strong> An open set \(\Omega \subseteq \mathbb{C}^n\) is a <em>domain of holomorphy</em> if there is no pair of open sets \(U_1, U_2\) with:
<br>(i) \(\emptyset \neq U_1 \subset U_2 \cap \Omega\),
<br>(ii) \(U_2\) is connected and not contained in \(\Omega\),
<br>(iii) for every \(f \in \mathcal{O}(\Omega)\), there exists \(\tilde{f} \in \mathcal{O}(U_2)\) with \(\tilde{f}|_{U_1} = f|_{U_1}\).
</div>

<div class="example">
<strong>Example 1.13.</strong> In one complex variable (\(n = 1\)), every open set is a domain of holomorphy. Indeed, given any open set \(\Omega \subseteq \mathbb{C}\) and any point \(p \in \partial\Omega\), the function \(z \mapsto 1/(z - p)\) is holomorphic on \(\Omega\) but cannot extend past \(p\). In several variables, the situation is far more subtle.
</div>

<div class="example">
<strong>Example 1.14.</strong> The polydisc \(\Delta(0, r)\) is a domain of holomorphy. To see this, consider the function

\[
f(z) = \sum_{\alpha \in \mathbb{N}_0^n} \frac{z^\alpha}{r^\alpha}.
\]
This series converges on \(\Delta(0, r)\) but diverges at every point of the distinguished boundary \(T(0, r)\). More precisely, the domain of convergence of this power series is exactly \(\Delta(0, r)\), so \(f\) cannot be extended holomorphically past any boundary point.
</div>

<div class="definition">
<strong>Definition 1.15 (Holomorphic Convexity).</strong> Let \(\Omega \subseteq \mathbb{C}^n\) be open. For a compact subset \(K \subseteq \Omega\), the <em>holomorphically convex hull</em> of \(K\) in \(\Omega\) is

\[
\hat{K}_\Omega = \left\{ z \in \Omega : |f(z)| \leq \sup_K |f| \text{ for all } f \in \mathcal{O}(\Omega) \right\}.
\]
The domain \(\Omega\) is <em>holomorphically convex</em> if \(\hat{K}_\Omega\) is compact in \(\Omega\) for every compact \(K \subseteq \Omega\).
</div>

<div class="remark">
<strong>Remark 1.16.</strong> Holomorphic convexity is the several-variable analogue of the classical notion of polynomial convexity in the theory of uniform algebras. Note that \(\hat{K}_\Omega\) always contains \(K\) (take \(f\) to be a constant). The condition demands that the hull does not "escape to the boundary" of \(\Omega\).
</div>

## 1.6 The Cartan-Thullen Theorem

The following theorem, proved by Henri Cartan and Peter Thullen in 1932, gives a fundamental characterisation of domains of holomorphy.

<div class="theorem">
<strong>Theorem 1.17 (Cartan-Thullen).</strong> For an open set \(\Omega \subseteq \mathbb{C}^n\), the following are equivalent:
<br>(i) \(\Omega\) is a domain of holomorphy.
<br>(ii) \(\Omega\) is holomorphically convex.
<br>(iii) For every boundary point \(p \in \partial\Omega\), there exists \(f \in \mathcal{O}(\Omega)\) that is unbounded near \(p\).
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> The implication (i) \(\Rightarrow\) (iii) is almost immediate from the definition: if every function extended past some boundary point, \(\Omega\) would fail to be a domain of holomorphy. The implication (iii) \(\Rightarrow\) (ii) uses a diagonal argument: if the holomorphically convex hull \(\hat{K}_\Omega\) were not compact, there would exist a sequence in \(\hat{K}_\Omega\) accumulating at the boundary, and no holomorphic function could be unbounded near that boundary point while being bounded on \(K\).

The deep direction is (ii) \(\Rightarrow\) (i). The proof constructs, given holomorphic convexity, a holomorphic function that cannot extend past any boundary point, by an elaborate exhaustion argument. One takes an increasing sequence of compact sets \(K_\nu\) exhausting \(\Omega\), and at each stage finds a holomorphic function that separates \(\hat{K}_\nu\) from points near the boundary. A suitable infinite product or series of such functions yields a function with singularities at every boundary point. The full details are given in Hörmander, Chapter 2. \(\square\)
</div>

A landmark later development, due to Oka (1942) and independently Bremermann and Norguet, characterises domains of holomorphy in terms of a differential-geometric condition.

<div class="definition">
<strong>Definition 1.18 (Pseudoconvexity).</strong> A \(C^2\) function \(\rho: U \to \mathbb{R}\) on an open set \(U \subseteq \mathbb{C}^n\) is <em>plurisubharmonic</em> if its complex Hessian (Levi form)

\[
\sum_{j,k=1}^n \frac{\partial^2 \rho}{\partial z_j \partial \bar{z}_k}(p) \, w_j \bar{w}_k \geq 0
\]
for all \(p \in U\) and all \(w \in \mathbb{C}^n\). A domain \(\Omega \subseteq \mathbb{C}^n\) with \(C^2\) boundary is <em>pseudoconvex</em> (or <em>Levi pseudoconvex</em>) if the Levi form of a defining function for \(\partial\Omega\) is positive semidefinite on the complex tangent space to \(\partial\Omega\).
</div>

<div class="theorem">
<strong>Theorem 1.19 (Oka, 1942).</strong> A domain \(\Omega \subseteq \mathbb{C}^n\) is a domain of holomorphy if and only if it is pseudoconvex.
</div>

This theorem, often called the solution to the Levi problem, was one of the central achievements of several complex variables in the twentieth century. It connects the function-theoretic notion of domain of holomorphy with the geometric notion of pseudoconvexity.

---

# Chapter 2: Complex Manifolds and Holomorphic Vector Bundles

Having established the local theory of holomorphic functions in several variables, we now globalise. Complex manifolds are the natural geometric objects on which holomorphic functions and their higher-dimensional generalisations (sections of vector bundles) live. The interplay between the topology and the complex structure of these manifolds is the central theme of this entire course: Hodge theory, which we develop in Chapters 5 and 6, provides deep constraints on the topology of a manifold that admits a complex (and especially a Kähler) structure.

## 2.1 Complex Manifolds

<div class="definition">
<strong>Definition 2.1 (Complex Manifold).</strong> A <em>complex manifold</em> of dimension \(n\) is a Hausdorff, second-countable topological space \(X\) equipped with a maximal atlas \(\{(U_\alpha, \varphi_\alpha)\}\) where each \(\varphi_\alpha: U_\alpha \to V_\alpha \subseteq \mathbb{C}^n\) is a homeomorphism onto an open subset of \(\mathbb{C}^n\), and all transition functions

\[
\varphi_\beta \circ \varphi_\alpha^{-1}: \varphi_\alpha(U_\alpha \cap U_\beta) \to \varphi_\beta(U_\alpha \cap U_\beta)
\]
are holomorphic (i.e., biholomorphic maps between open subsets of \(\mathbb{C}^n\)).
</div>

<div class="remark">
<strong>Remark 2.2.</strong> Every complex manifold of dimension \(n\) is, in particular, a smooth (real) manifold of dimension \(2n\). However, not every smooth even-dimensional manifold admits a complex structure. Determining which smooth manifolds admit complex structures is a deep and largely open problem. For instance, \(S^6\) is famously conjectured not to admit a complex structure, though it does admit an almost complex structure.
</div>

<div class="example">
<strong>Example 2.3 (Complex Projective Space).</strong> The <em>complex projective space</em> \(\mathbb{CP}^n\) is the set of one-dimensional complex subspaces of \(\mathbb{C}^{n+1}\), i.e.,

\[
\mathbb{CP}^n = (\mathbb{C}^{n+1} \setminus \{0\}) / \sim,
\]
where \(z \sim w\) if and only if \(z = \lambda w\) for some \(\lambda \in \mathbb{C}^*\). The equivalence class of \((z_0, \dots, z_n)\) is denoted \([z_0 : \cdots : z_n]\) (homogeneous coordinates). The standard atlas consists of the open sets \(U_j = \{[z_0 : \cdots : z_n] : z_j \neq 0\}\) with charts

\[
\varphi_j: U_j \to \mathbb{C}^n, \quad [z_0 : \cdots : z_n] \mapsto \left(\frac{z_0}{z_j}, \dots, \widehat{\frac{z_j}{z_j}}, \dots, \frac{z_n}{z_j}\right),
\]
where the hat denotes omission. The transition functions are rational and hence holomorphic where defined.
</div>

<div class="example">
<strong>Example 2.4 (Complex Tori).</strong> Let \(\Lambda \subset \mathbb{C}^n\) be a lattice of rank \(2n\) (i.e., a discrete subgroup isomorphic to \(\mathbb{Z}^{2n}\) that spans \(\mathbb{C}^n\) over \(\mathbb{R}\)). The quotient \(X = \mathbb{C}^n / \Lambda\) inherits a complex manifold structure from \(\mathbb{C}^n\), since the translations \(z \mapsto z + \lambda\) are biholomorphisms. For \(n = 1\), these are elliptic curves. For \(n \geq 2\), not all complex tori are algebraic (i.e., not all admit embeddings into projective space); those that do are called <em>abelian varieties</em>.
</div>

<div class="definition">
<strong>Definition 2.5 (Holomorphic Map).</strong> A continuous map \(f: X \to Y\) between complex manifolds is <em>holomorphic</em> if for every pair of charts \((U_\alpha, \varphi_\alpha)\) on \(X\) and \((V_\beta, \psi_\beta)\) on \(Y\), the composition \(\psi_\beta \circ f \circ \varphi_\alpha^{-1}\) is holomorphic wherever defined. A holomorphic bijection whose inverse is also holomorphic is a <em>biholomorphism</em>.
</div>

## 2.2 Holomorphic Vector Bundles

Vector bundles are the natural habitat for "multi-valued" or "twisted" holomorphic objects on a complex manifold. They generalise the tangent bundle and play a central role in the Hodge-theoretic machinery we develop later.

<div class="definition">
<strong>Definition 2.6 (Holomorphic Vector Bundle).</strong> A <em>holomorphic vector bundle of rank \(r\)</em> on a complex manifold \(X\) is a complex manifold \(E\) together with a holomorphic surjection \(\pi: E \to X\) such that:
<br>(i) For each \(x \in X\), the fibre \(E_x = \pi^{-1}(x)\) is a complex vector space of dimension \(r\).
<br>(ii) There exists an open cover \(\{U_\alpha\}\) of \(X\) and biholomorphisms (local trivialisations) \(\Phi_\alpha: \pi^{-1}(U_\alpha) \to U_\alpha \times \mathbb{C}^r\) compatible with projection to \(U_\alpha\) and linear on fibres.
<br>(iii) The <em>transition functions</em> \(g_{\alpha\beta}: U_\alpha \cap U_\beta \to \mathrm{GL}(r, \mathbb{C})\), defined by \(\Phi_\alpha \circ \Phi_\beta^{-1}(x, v) = (x, g_{\alpha\beta}(x) v)\), are holomorphic.
</div>

<div class="remark">
<strong>Remark 2.7.</strong> The transition functions satisfy the cocycle conditions: \(g_{\alpha\alpha} = \mathrm{Id}\), \(g_{\alpha\beta} g_{\beta\alpha} = \mathrm{Id}\), and \(g_{\alpha\beta} g_{\beta\gamma} g_{\gamma\alpha} = \mathrm{Id}\) on triple overlaps. Conversely, any collection of holomorphic functions satisfying these cocycle conditions determines a holomorphic vector bundle up to isomorphism.
</div>

<div class="definition">
<strong>Definition 2.8 (Line Bundle).</strong> A <em>holomorphic line bundle</em> is a holomorphic vector bundle of rank 1. In this case, the transition functions are holomorphic maps \(g_{\alpha\beta}: U_\alpha \cap U_\beta \to \mathbb{C}^* = \mathrm{GL}(1, \mathbb{C})\).
</div>

<div class="example">
<strong>Example 2.9 (Tautological Line Bundle).</strong> Over \(\mathbb{CP}^n\), the <em>tautological line bundle</em> \(\mathcal{O}(-1)\) has total space

\[
\mathcal{O}(-1) = \{(\ell, v) \in \mathbb{CP}^n \times \mathbb{C}^{n+1} : v \in \ell\},
\]
where we view a point \(\ell \in \mathbb{CP}^n\) as a line through the origin in \(\mathbb{C}^{n+1}\). The fibre over \(\ell\) is the line \(\ell\) itself. The transition functions on \(U_i \cap U_j\) are \(g_{ij}([z]) = z_j/z_i\). Its dual \(\mathcal{O}(1) = \mathcal{O}(-1)^*\) is the <em>hyperplane bundle</em>, and we write \(\mathcal{O}(k) = \mathcal{O}(1)^{\otimes k}\) for \(k > 0\) and \(\mathcal{O}(k) = \mathcal{O}(-1)^{\otimes |k|}\) for \(k < 0\).
</div>

<div class="definition">
<strong>Definition 2.10 (Sections).</strong> A <em>holomorphic section</em> of a holomorphic vector bundle \(\pi: E \to X\) over an open set \(U \subseteq X\) is a holomorphic map \(s: U \to E\) with \(\pi \circ s = \mathrm{id}_U\). In local trivialisations, a section is given by holomorphic functions \(s_\alpha: U_\alpha \to \mathbb{C}^r\) satisfying \(s_\alpha = g_{\alpha\beta} s_\beta\) on overlaps. We write \(\Gamma(U, E)\) or \(H^0(U, E)\) for the space of holomorphic sections over \(U\).
</div>

## 2.3 The Canonical Bundle

<div class="definition">
<strong>Definition 2.11 (Canonical Bundle).</strong> Let \(X\) be a complex manifold of dimension \(n\). The <em>holomorphic tangent bundle</em> \(T_X^{1,0}\) is the rank-\(n\) holomorphic vector bundle whose sections are holomorphic vector fields of type \((1,0)\). The <em>canonical bundle</em> is the top exterior power of the holomorphic cotangent bundle:

\[
K_X = \bigwedge^n (T_X^{1,0})^* = \bigwedge^n \Omega_X^1,
\]
where \(\Omega_X^1\) denotes the holomorphic cotangent bundle. This is a holomorphic line bundle whose local sections are holomorphic \(n\)-forms \(f(z) \, dz_1 \wedge \cdots \wedge dz_n\).
</div>

<div class="example">
<strong>Example 2.12.</strong> For \(\mathbb{CP}^n\), the canonical bundle is \(K_{\mathbb{CP}^n} \cong \mathcal{O}(-(n+1))\). This can be computed from the Euler sequence

\[
0 \to \mathcal{O} \to \mathcal{O}(1)^{\oplus(n+1)} \to T_{\mathbb{CP}^n} \to 0,
\]
by taking determinants: \(\det(T_{\mathbb{CP}^n}) \cong \mathcal{O}(n+1)\), so \(K_{\mathbb{CP}^n} = \det(\Omega^1_{\mathbb{CP}^n}) \cong \mathcal{O}(-(n+1))\).
</div>

## 2.4 Divisors and Line Bundles

The correspondence between divisors and line bundles is one of the most important bridges between the algebraic and analytic theories of complex manifolds.

<div class="definition">
<strong>Definition 2.13 (Divisor).</strong> Let \(X\) be a complex manifold. A <em>divisor</em> on \(X\) is a formal, locally finite integer linear combination of irreducible analytic hypersurfaces:

\[
D = \sum_{i} n_i Y_i, \quad n_i \in \mathbb{Z},
\]
where each \(Y_i\) is an irreducible analytic hypersurface in \(X\). The group of divisors is denoted \(\mathrm{Div}(X)\). A divisor is <em>effective</em> (written \(D \geq 0\)) if all \(n_i \geq 0\).
</div>

<div class="definition">
<strong>Definition 2.14 (Associated Line Bundle).</strong> To a divisor \(D\) on \(X\), one associates a holomorphic line bundle \(\mathcal{O}(D)\) as follows. Choose an open cover \(\{U_\alpha\}\) of \(X\) and meromorphic functions \(f_\alpha\) on \(U_\alpha\) such that \(D|_{U_\alpha} = \mathrm{div}(f_\alpha)\) (the divisor of \(f_\alpha\)). Then \(g_{\alpha\beta} = f_\alpha / f_\beta\) is holomorphic and nowhere-vanishing on \(U_\alpha \cap U_\beta\), and these define transition functions for \(\mathcal{O}(D)\).
</div>

<div class="theorem">
<strong>Theorem 2.15.</strong> The map \(D \mapsto \mathcal{O}(D)\) induces a group homomorphism \(\mathrm{Div}(X) \to \mathrm{Pic}(X)\), where \(\mathrm{Pic}(X)\) is the Picard group of isomorphism classes of holomorphic line bundles. Two divisors \(D\) and \(D'\) give isomorphic line bundles if and only if \(D - D'\) is a principal divisor (the divisor of a global meromorphic function). On a compact complex manifold, this induces an isomorphism \(\mathrm{Div}(X) / \mathrm{div}(\mathcal{M}(X)^*) \cong \mathrm{Pic}(X)\) when \(X\) has enough meromorphic functions (e.g., when \(X\) is projective).
</div>

## 2.5 Blowups

<div class="definition">
<strong>Definition 2.16 (Blowup at a Point).</strong> Let \(X\) be a complex manifold of dimension \(n\) and \(p \in X\). The <em>blowup</em> of \(X\) at \(p\), denoted \(\mathrm{Bl}_p(X)\), is the complex manifold obtained by replacing \(p\) with the projective space \(\mathbb{CP}^{n-1}\) of complex directions through \(p\). Formally, in local coordinates centred at \(p\), the blowup is

\[
\mathrm{Bl}_0(\mathbb{C}^n) = \{(z, [\ell]) \in \mathbb{C}^n \times \mathbb{CP}^{n-1} : z \in \ell\},
\]
with the natural projection \(\sigma: \mathrm{Bl}_0(\mathbb{C}^n) \to \mathbb{C}^n\). The preimage \(E = \sigma^{-1}(0) \cong \mathbb{CP}^{n-1}\) is the <em>exceptional divisor</em>. Away from \(E\), the map \(\sigma\) is a biholomorphism.
</div>

<div class="remark">
<strong>Remark 2.17.</strong> Blowups are fundamental in birational geometry. They resolve singularities and serve as building blocks for the minimal model programme. The canonical bundle transforms under blowup by \(K_{\mathrm{Bl}_p(X)} \cong \sigma^* K_X \otimes \mathcal{O}((n-1)E)\).
</div>

---

# Chapter 3: Sheaves and Cohomology

Sheaf theory provides the natural language for passing between local and global data on complex manifolds. The cohomology of sheaves, especially coherent sheaves, is the algebraic engine that drives most of the results in later chapters — from the Dolbeault theorem to the Hodge decomposition to the Kodaira vanishing theorem. Historically, the systematic use of sheaves in complex geometry was pioneered by Henri Cartan, Jean-Pierre Serre, and the Cartan seminar in the early 1950s, building on ideas of Jean Leray.

## 3.1 Sheaves of Abelian Groups

<div class="definition">
<strong>Definition 3.1 (Presheaf).</strong> A <em>presheaf</em> \(\mathcal{F}\) of abelian groups on a topological space \(X\) consists of:
<br>(i) For each open set \(U \subseteq X\), an abelian group \(\mathcal{F}(U)\) (the <em>sections</em> of \(\mathcal{F}\) over \(U\)).
<br>(ii) For each inclusion \(V \subseteq U\) of open sets, a restriction homomorphism \(\mathrm{res}_{U,V}: \mathcal{F}(U) \to \mathcal{F}(V)\), often written \(s \mapsto s|_V\).
<br>These satisfy \(\mathrm{res}_{U,U} = \mathrm{id}\) and \(\mathrm{res}_{V,W} \circ \mathrm{res}_{U,V} = \mathrm{res}_{U,W}\) for \(W \subseteq V \subseteq U\). We set \(\mathcal{F}(\emptyset) = 0\).
</div>

<div class="definition">
<strong>Definition 3.2 (Sheaf).</strong> A presheaf \(\mathcal{F}\) is a <em>sheaf</em> if it satisfies the following gluing axioms: for every open cover \(\{U_i\}_{i \in I}\) of an open set \(U\),
<br>(Locality) If \(s, t \in \mathcal{F}(U)\) satisfy \(s|_{U_i} = t|_{U_i}\) for all \(i\), then \(s = t\).
<br>(Gluing) If \(s_i \in \mathcal{F}(U_i)\) satisfy \(s_i|_{U_i \cap U_j} = s_j|_{U_i \cap U_j}\) for all \(i, j\), then there exists \(s \in \mathcal{F}(U)\) with \(s|_{U_i} = s_i\) for all \(i\).
</div>

<div class="example">
<strong>Example 3.3.</strong> The most important sheaves on a complex manifold \(X\) of dimension \(n\) include:
<br>(a) \(\mathcal{O}_X\): the sheaf of holomorphic functions (\(\mathcal{O}_X(U) = \mathcal{O}(U)\)).
<br>(b) \(\mathcal{O}_X^*\): the sheaf of nowhere-vanishing holomorphic functions (under multiplication).
<br>(c) \(\mathcal{M}_X\): the sheaf of meromorphic functions.
<br>(d) \(\Omega_X^p\): the sheaf of holomorphic \(p\)-forms.
<br>(e) \(\underline{\mathbb{Z}}_X\), \(\underline{\mathbb{R}}_X\), \(\underline{\mathbb{C}}_X\): constant sheaves.
<br>(f) \(\mathcal{A}^k_X\): the sheaf of smooth \(k\)-forms; \(\mathcal{A}^{p,q}_X\): the sheaf of smooth \((p,q)\)-forms.
</div>

<div class="definition">
<strong>Definition 3.4 (Stalks).</strong> The <em>stalk</em> of a sheaf \(\mathcal{F}\) at a point \(x \in X\) is the direct limit

\[
\mathcal{F}_x = \varinjlim_{U \ni x} \mathcal{F}(U),
\]
taken over all open neighbourhoods \(U\) of \(x\). Elements of \(\mathcal{F}_x\) are called <em>germs</em> of sections at \(x\). For the sheaf \(\mathcal{O}_X\) on a complex manifold, the stalk \(\mathcal{O}_{X,x}\) is isomorphic to the ring of convergent power series \(\mathbb{C}\{z_1, \dots, z_n\}\), which is a local ring with maximal ideal \(\mathfrak{m}_x\) consisting of germs vanishing at \(x\).
</div>

## 3.2 Exact Sequences of Sheaves

<div class="definition">
<strong>Definition 3.5 (Exact Sequence).</strong> A sequence of sheaf morphisms

\[
\cdots \to \mathcal{F}^{i-1} \xrightarrow{\varphi^{i-1}} \mathcal{F}^i \xrightarrow{\varphi^i} \mathcal{F}^{i+1} \to \cdots
\]
is <em>exact</em> if it is exact at the level of stalks: for every point \(x \in X\), the sequence

\[
\cdots \to \mathcal{F}^{i-1}_x \to \mathcal{F}^i_x \to \mathcal{F}^{i+1}_x \to \cdots
\]
is exact as a sequence of abelian groups, i.e., \(\ker(\varphi^i_x) = \mathrm{im}(\varphi^{i-1}_x)\).
</div>

<div class="remark">
<strong>Remark 3.6.</strong> Exactness of a sheaf sequence is a <em>local</em> condition (it is checked on stalks). A short exact sequence of sheaves \(0 \to \mathcal{F}' \to \mathcal{F} \to \mathcal{F}'' \to 0\) need <em>not</em> induce a short exact sequence on global sections. The failure of exactness on global sections is precisely what sheaf cohomology measures.
</div>

## 3.3 The Exponential Sequence

The exponential sequence is the most fundamental exact sequence in complex geometry, connecting topology, complex analysis, and line bundles.

<div class="theorem">
<strong>Theorem 3.7 (Exponential Sequence).</strong> On any complex manifold \(X\), the sequence of sheaves

\[
0 \to \underline{\mathbb{Z}}_X \xrightarrow{\iota} \mathcal{O}_X \xrightarrow{\exp} \mathcal{O}_X^* \to 0
\]
is exact, where \(\iota\) is inclusion (multiplied by \(2\pi i\)) and \(\exp\) is the map \(f \mapsto e^{2\pi i f}\).
</div>

<div class="proof">
<strong>Proof.</strong> Exactness is checked on stalks. At each point \(x \in X\): the map \(\iota\) is clearly injective. The kernel of \(\exp\) at \(x\) consists of germs \(f\) with \(e^{2\pi i f} = 1\), i.e., \(f \in \mathbb{Z}\), so \(\ker(\exp_x) = \mathrm{im}(\iota_x)\). For surjectivity of \(\exp\) on stalks, given a germ of a nowhere-vanishing holomorphic function \(g\) at \(x\), we can take a local branch of \(\frac{1}{2\pi i}\log g\) (which exists on a simply connected neighbourhood of \(x\)), yielding a germ \(f\) with \(e^{2\pi i f} = g\). \(\square\)
</div>

## 3.4 Sheaf Cohomology

There are two standard approaches to defining sheaf cohomology: derived functors and Cech cohomology. We present both.

<div class="definition">
<strong>Definition 3.8 (Derived Functor Cohomology).</strong> For a sheaf \(\mathcal{F}\) on \(X\), the <em>sheaf cohomology groups</em> \(H^i(X, \mathcal{F})\) are the right derived functors of the global sections functor \(\Gamma(X, -)\). Concretely, one takes an injective resolution

\[
0 \to \mathcal{F} \to \mathcal{I}^0 \to \mathcal{I}^1 \to \mathcal{I}^2 \to \cdots
\]
(which exists since the category of sheaves of abelian groups on \(X\) has enough injectives), applies \(\Gamma(X, -)\) to obtain a complex of abelian groups, and takes cohomology:

\[
H^i(X, \mathcal{F}) = H^i(\Gamma(X, \mathcal{I}^\bullet)).
\]
</div>

<div class="definition">
<strong>Definition 3.9 (Cech Cohomology).</strong> Let \(\mathfrak{U} = \{U_\alpha\}_{\alpha \in I}\) be an open cover of \(X\). The <em>Cech cochain groups</em> are

\[
\check{C}^p(\mathfrak{U}, \mathcal{F}) = \prod_{\alpha_0 < \cdots < \alpha_p} \mathcal{F}(U_{\alpha_0} \cap \cdots \cap U_{\alpha_p}),
\]
with differential \(\delta: \check{C}^p \to \check{C}^{p+1}\) defined by

\[
(\delta \sigma)_{\alpha_0, \dots, \alpha_{p+1}} = \sum_{j=0}^{p+1} (-1)^j \sigma_{\alpha_0, \dots, \hat{\alpha}_j, \dots, \alpha_{p+1}}|_{U_{\alpha_0} \cap \cdots \cap U_{\alpha_{p+1}}}.
\]
The <em>Cech cohomology</em> with respect to \(\mathfrak{U}\) is \(\check{H}^p(\mathfrak{U}, \mathcal{F}) = H^p(\check{C}^\bullet(\mathfrak{U}, \mathcal{F}), \delta)\). The <em>Cech cohomology</em> of \(\mathcal{F}\) is the direct limit over all open covers:

\[
\check{H}^p(X, \mathcal{F}) = \varinjlim_{\mathfrak{U}} \check{H}^p(\mathfrak{U}, \mathcal{F}).
\]
</div>

<div class="theorem">
<strong>Theorem 3.10 (Leray).</strong> If \(\mathfrak{U}\) is an acyclic cover for \(\mathcal{F}\) (i.e., \(H^q(U_{\alpha_0} \cap \cdots \cap U_{\alpha_p}, \mathcal{F}) = 0\) for all \(q > 0\) and all intersections), then \(\check{H}^p(\mathfrak{U}, \mathcal{F}) \cong H^p(X, \mathcal{F})\).
</div>

<div class="remark">
<strong>Remark 3.11.</strong> On paracompact Hausdorff spaces (which include all manifolds), Cech cohomology agrees with derived functor cohomology for all sheaves of abelian groups. This is a theorem of Cartan (for sheaves on paracompact spaces) and allows us to compute derived functor cohomology using Cech methods.
</div>

## 3.5 The Long Exact Sequence and the Picard Group

The fundamental property of sheaf cohomology is that a short exact sequence of sheaves induces a long exact sequence in cohomology.

<div class="theorem">
<strong>Theorem 3.12.</strong> A short exact sequence of sheaves \(0 \to \mathcal{F}' \to \mathcal{F} \to \mathcal{F}'' \to 0\) induces a long exact sequence

\[
0 \to H^0(X, \mathcal{F}') \to H^0(X, \mathcal{F}) \to H^0(X, \mathcal{F}'') \xrightarrow{\delta} H^1(X, \mathcal{F}') \to H^1(X, \mathcal{F}) \to \cdots
\]
</div>

Applying this to the exponential sequence yields one of the most important computations in complex geometry.

<div class="theorem">
<strong>Theorem 3.13 (Picard Group via the Exponential Sequence).</strong> The long exact sequence associated to the exponential sequence \(0 \to \underline{\mathbb{Z}} \to \mathcal{O} \to \mathcal{O}^* \to 0\) includes

\[
\cdots \to H^1(X, \mathcal{O}) \to H^1(X, \mathcal{O}^*) \xrightarrow{c_1} H^2(X, \mathbb{Z}) \to H^2(X, \mathcal{O}) \to \cdots
\]
The group \(H^1(X, \mathcal{O}^*)\) is the Picard group \(\mathrm{Pic}(X)\), classifying isomorphism classes of holomorphic line bundles on \(X\). The connecting homomorphism \(c_1\) sends a line bundle to its first Chern class.
</div>

<div class="proof">
<strong>Proof.</strong> That \(H^1(X, \mathcal{O}^*) \cong \mathrm{Pic}(X)\) follows from the interpretation of Cech 1-cocycles: a Cech 1-cocycle for \(\mathcal{O}^*\) with respect to an open cover \(\{U_\alpha\}\) is a collection of nowhere-vanishing holomorphic functions \(g_{\alpha\beta} \in \mathcal{O}^*(U_\alpha \cap U_\beta)\) satisfying the cocycle condition \(g_{\alpha\beta} g_{\beta\gamma} = g_{\alpha\gamma}\) on triple overlaps. This is precisely a system of transition functions for a holomorphic line bundle. Two cocycles are cohomologous if and only if the corresponding line bundles are isomorphic (the coboundary relation corresponds to changing the local trivialisations). \(\square\)
</div>

<div class="remark">
<strong>Remark 3.14.</strong> When \(H^1(X, \mathcal{O}) = 0\) (which happens, for instance, for \(\mathbb{CP}^n\)), the map \(c_1: \mathrm{Pic}(X) \to H^2(X, \mathbb{Z})\) is injective: a line bundle is determined up to isomorphism by its first Chern class. For \(\mathbb{CP}^n\), since \(H^2(\mathbb{CP}^n, \mathbb{Z}) \cong \mathbb{Z}\), we obtain \(\mathrm{Pic}(\mathbb{CP}^n) \cong \mathbb{Z}\), generated by \(\mathcal{O}(1)\).
</div>

## 3.6 Coherent Sheaves and Serre's GAGA Principle

<div class="definition">
<strong>Definition 3.15 (Coherent Sheaf).</strong> A sheaf \(\mathcal{F}\) of \(\mathcal{O}_X\)-modules on a complex manifold \(X\) is <em>coherent</em> if:
<br>(i) \(\mathcal{F}\) is <em>of finite type</em>: every point has a neighbourhood \(U\) with a surjection \(\mathcal{O}_U^p \to \mathcal{F}|_U\).
<br>(ii) For every open \(U \subseteq X\) and every morphism \(\varphi: \mathcal{O}_U^p \to \mathcal{F}|_U\), the kernel \(\ker(\varphi)\) is of finite type.
</div>

<div class="remark">
<strong>Remark 3.16.</strong> By the Oka coherence theorem, the structure sheaf \(\mathcal{O}_X\) itself is coherent. It follows that locally free sheaves of finite rank (i.e., sheaves of sections of holomorphic vector bundles) are coherent. Ideal sheaves of analytic subvarieties are also coherent, by the deep theorem of Cartan (1950).
</div>

<div class="theorem">
<strong>Theorem 3.17 (Serre's GAGA, 1956).</strong> Let \(X\) be a smooth projective variety over \(\mathbb{C}\). Let \(X^{\mathrm{an}}\) denote the associated complex manifold. Then the analytification functor

\[
\mathcal{F} \mapsto \mathcal{F}^{\mathrm{an}}
\]
from the category of coherent algebraic sheaves on \(X\) to the category of coherent analytic sheaves on \(X^{\mathrm{an}}\) is an equivalence of categories. Moreover, it preserves cohomology:

\[
H^i(X, \mathcal{F}) \cong H^i(X^{\mathrm{an}}, \mathcal{F}^{\mathrm{an}})
\]
for all \(i \geq 0\).
</div>

<div class="remark">
<strong>Remark 3.18.</strong> GAGA (Géométrie Algébrique et Géométrie Analytique) is a foundational result that justifies the passage between algebraic geometry and complex analytic geometry for projective varieties. It implies, for instance, that every holomorphic line bundle on a projective variety is algebraic, and every meromorphic function on a projective variety is rational. The hypothesis of projectivity (or at least properness) is essential: a complex torus of dimension \(\geq 2\) may have holomorphic line bundles that are not algebraic.
</div>

---

# Chapter 4: Differential Forms on Complex Manifolds

Having established the algebraic framework of sheaves and cohomology, we now bring in analysis. The interplay between the complex structure and the calculus of differential forms on a complex manifold is the foundation upon which Hodge theory rests. The key idea is the decomposition of forms into types \((p, q)\), reflecting the distinction between the holomorphic and antiholomorphic directions, and the introduction of the Dolbeault operator \(\bar\partial\), which is the complex-analytic replacement for the exterior derivative.

## 4.1 Real and Complex Differential Forms

Let \(X\) be a complex manifold of dimension \(n\). At each point \(x \in X\), the real tangent space \(T_x X\) is a real vector space of dimension \(2n\). The complex structure \(J: T_x X \to T_x X\) (with \(J^2 = -\mathrm{id}\)) allows us to complexify and decompose.

<div class="definition">
<strong>Definition 4.1 (Complexified Tangent and Cotangent Spaces).</strong> The <em>complexified tangent space</em> at \(x\) is

\[
T_x X \otimes_{\mathbb{R}} \mathbb{C} = T_x^{1,0} X \oplus T_x^{0,1} X,
\]
where \(T_x^{1,0} X\) is the \(+i\)-eigenspace of \(J\) (spanned by \(\partial/\partial z_j\)) and \(T_x^{0,1} X\) is the \(-i\)-eigenspace (spanned by \(\partial/\partial \bar{z}_j\)). Dually, the complexified cotangent space decomposes as

\[
T_x^* X \otimes_{\mathbb{R}} \mathbb{C} = (T_x^{1,0} X)^* \oplus (T_x^{0,1} X)^*,
\]
where \((T_x^{1,0} X)^*\) is spanned by \(dz_j = dx_j + i \, dy_j\) and \((T_x^{0,1} X)^*\) is spanned by \(d\bar{z}_j = dx_j - i \, dy_j\).
</div>

## 4.2 The (p,q)-Decomposition

<div class="definition">
<strong>Definition 4.2 (Forms of Type (p,q)).</strong> A smooth complex-valued differential form \(\omega\) on \(X\) is of <em>type \((p, q)\)</em> if at each point \(x\), it lies in

\[
\bigwedge^p (T_x^{1,0} X)^* \otimes \bigwedge^q (T_x^{0,1} X)^*.
\]
In local holomorphic coordinates \((z_1, \dots, z_n)\), a \((p, q)\)-form is a sum of terms

\[
f_{I, J}(z, \bar{z}) \, dz_{i_1} \wedge \cdots \wedge dz_{i_p} \wedge d\bar{z}_{j_1} \wedge \cdots \wedge d\bar{z}_{j_q},
\]
with smooth coefficient functions \(f_{I,J}\). We write \(\mathcal{A}^{p,q}(X)\) for the space of smooth \((p, q)\)-forms on \(X\).
</div>

<div class="theorem">
<strong>Theorem 4.3 (Type Decomposition).</strong> The space of smooth \(k\)-forms on \(X\) decomposes as

\[
\mathcal{A}^k(X) \otimes \mathbb{C} = \bigoplus_{p+q=k} \mathcal{A}^{p,q}(X).
\]
This decomposition depends on the complex structure but not on any choice of metric.
</div>

<div class="remark">
<strong>Remark 4.4.</strong> Crucially, the de Rham differential does <em>not</em> respect the type decomposition. If \(\omega\) is of type \((p, q)\), then \(d\omega\) generally has components of types \((p+1, q)\) and \((p, q+1)\) (and no others, as can be verified from the local formula). This leads us to decompose \(d\) itself.
</div>

## 4.3 The Dolbeault Operator

<div class="definition">
<strong>Definition 4.5 (Dolbeault Operators).</strong> The exterior derivative \(d: \mathcal{A}^k(X) \to \mathcal{A}^{k+1}(X)\) decomposes as \(d = \partial + \bar\partial\), where

\[
\partial: \mathcal{A}^{p,q}(X) \to \mathcal{A}^{p+1,q}(X), \quad \bar\partial: \mathcal{A}^{p,q}(X) \to \mathcal{A}^{p,q+1}(X).
\]
In local coordinates, if \(\omega = \sum_{I,J} f_{I,J} \, dz_I \wedge d\bar{z}_J\), then

\[
\partial \omega = \sum_{I,J} \sum_{k=1}^n \frac{\partial f_{I,J}}{\partial z_k} dz_k \wedge dz_I \wedge d\bar{z}_J, \quad \bar\partial \omega = \sum_{I,J} \sum_{k=1}^n \frac{\partial f_{I,J}}{\partial \bar{z}_k} d\bar{z}_k \wedge dz_I \wedge d\bar{z}_J.
\]
</div>

<div class="proposition">
<strong>Proposition 4.6.</strong> The operators \(\partial\) and \(\bar\partial\) satisfy:
<br>(i) \(\partial^2 = 0\),
<br>(ii) \(\bar\partial^2 = 0\),
<br>(iii) \(\partial\bar\partial + \bar\partial\partial = 0\).
<br>These follow from \(d^2 = 0\) and comparison of types: since \(d^2 = (\partial + \bar\partial)^2 = \partial^2 + (\partial\bar\partial + \bar\partial\partial) + \bar\partial^2 = 0\), and each term has a different type, each must vanish separately.
</div>

## 4.4 The Dolbeault Complex and Dolbeault Cohomology

The identity \(\bar\partial^2 = 0\) means that, for each fixed \(p\), the Dolbeault operator \(\bar\partial\) defines a cochain complex.

<div class="definition">
<strong>Definition 4.7 (Dolbeault Complex).</strong> For each \(p = 0, 1, \dots, n\), the <em>Dolbeault complex</em> is the cochain complex

\[
0 \to \mathcal{A}^{p,0}(X) \xrightarrow{\bar\partial} \mathcal{A}^{p,1}(X) \xrightarrow{\bar\partial} \cdots \xrightarrow{\bar\partial} \mathcal{A}^{p,n}(X) \to 0.
\]
</div>

<div class="definition">
<strong>Definition 4.8 (Dolbeault Cohomology).</strong> The <em>Dolbeault cohomology</em> of \(X\) is

\[
H^{p,q}_{\bar\partial}(X) = \frac{\ker(\bar\partial: \mathcal{A}^{p,q}(X) \to \mathcal{A}^{p,q+1}(X))}{\mathrm{im}(\bar\partial: \mathcal{A}^{p,q-1}(X) \to \mathcal{A}^{p,q}(X))}.
\]
A form in \(\ker(\bar\partial)\) is called <em>\(\bar\partial\)-closed</em>; a form in \(\mathrm{im}(\bar\partial)\) is called <em>\(\bar\partial\)-exact</em>.
</div>

<div class="example">
<strong>Example 4.9.</strong> For \(p = 0\), a \((0, 0)\)-form is a smooth function \(f\), and \(\bar\partial f = 0\) means \(f\) is holomorphic. Thus \(H^{0,0}_{\bar\partial}(X) = \mathcal{O}(X)\), the space of global holomorphic functions. For a compact connected complex manifold, \(\mathcal{O}(X) = \mathbb{C}\) by the maximum principle.
</div>

## 4.5 The \(\bar\partial\)-Poincare Lemma

The key local result is that the Dolbeault complex is exact, i.e., every \(\bar\partial\)-closed form is locally \(\bar\partial\)-exact. This is the analogue of the Poincare lemma for the de Rham complex.

<div class="theorem">
<strong>Theorem 4.10 (\(\bar\partial\)-Poincare Lemma).</strong> Let \(\Delta \subseteq \mathbb{C}^n\) be a polydisc. Then for every \(q \geq 1\), if \(\omega \in \mathcal{A}^{p,q}(\Delta)\) satisfies \(\bar\partial\omega = 0\), there exists \(\eta \in \mathcal{A}^{p,q-1}(\Delta)\) with \(\bar\partial\eta = \omega\).
</div>

<div class="proof">
<strong>Proof (Sketch for \(n = 1\), \(p = 0\), \(q = 1\)).</strong> Let \(\omega = g(z, \bar{z}) \, d\bar{z}\) be a smooth \((0,1)\)-form on a disc \(D \subseteq \mathbb{C}\). We seek \(f\) with \(\bar\partial f = \omega\), i.e., \(\partial f / \partial \bar{z} = g\). The solution is given by the Cauchy-Green formula:

\[
f(z) = \frac{1}{2\pi i} \int_D \frac{g(\zeta, \bar\zeta)}{\zeta - z} \, d\zeta \wedge d\bar\zeta.
\]
That this integral converges and defines a smooth function with \(\partial f / \partial \bar{z} = g\) is a standard result in PDE theory (it is the fundamental solution for the \(\bar\partial\)-equation on a disc). The general case proceeds by induction on the number of variables, using successive applications of the one-variable result. \(\square\)
</div>

## 4.6 Dolbeault's Theorem

The \(\bar\partial\)-Poincare lemma says that the Dolbeault complex is a fine resolution of the sheaf of holomorphic \(p\)-forms. This immediately yields the following fundamental comparison theorem.

<div class="theorem">
<strong>Theorem 4.11 (Dolbeault's Theorem).</strong> For a complex manifold \(X\), there is a canonical isomorphism

\[
H^{p,q}_{\bar\partial}(X) \cong H^q(X, \Omega_X^p)
\]
between Dolbeault cohomology and sheaf cohomology of the sheaf of holomorphic \(p\)-forms.
</div>

<div class="proof">
<strong>Proof.</strong> Consider the sequence of sheaves

\[
0 \to \Omega_X^p \to \mathcal{A}^{p,0} \xrightarrow{\bar\partial} \mathcal{A}^{p,1} \xrightarrow{\bar\partial} \cdots \xrightarrow{\bar\partial} \mathcal{A}^{p,n} \to 0.
\]
The \(\bar\partial\)-Poincare lemma (Theorem 4.10) shows this sequence is exact at the level of stalks: the kernel of \(\bar\partial: \mathcal{A}^{p,0} \to \mathcal{A}^{p,1}\) is exactly \(\Omega_X^p\), and every \(\bar\partial\)-closed \((p, q)\)-form is locally \(\bar\partial\)-exact for \(q \geq 1\). The sheaves \(\mathcal{A}^{p,q}\) are fine (they admit partitions of unity), hence acyclic for the global sections functor. By the abstract de Rham theorem (a general result on acyclic resolutions), the cohomology of the complex of global sections computes the sheaf cohomology of the kernel sheaf:

\[
H^q(\Gamma(X, \mathcal{A}^{p,\bullet}), \bar\partial) \cong H^q(X, \Omega_X^p). \quad \square
\]
</div>

<div class="remark">
<strong>Remark 4.12.</strong> When \(p = 0\), Dolbeault's theorem gives \(H^{0,q}_{\bar\partial}(X) \cong H^q(X, \mathcal{O}_X)\), expressing sheaf cohomology of the structure sheaf in terms of the explicit \(\bar\partial\)-complex. When \(p = n = \dim X\), we get \(H^{n,q}_{\bar\partial}(X) \cong H^q(X, K_X)\), which is the cohomology of the canonical bundle — a crucial player in Serre duality.
</div>

---

# Chapter 5: Hermitian and Kahler Geometry

The introduction of a Hermitian metric on a complex manifold brings the full power of analysis to bear on complex geometry. Among Hermitian metrics, Kahler metrics are distinguished by a compatibility condition between the complex structure, the Riemannian structure, and the symplectic structure. Kahler manifolds are the natural arena for Hodge theory, and the Kahler identities — algebraic relations between the metric operators and the complex structure operators — are the technical engine that makes the Hodge decomposition work.

## 5.1 Hermitian Metrics on Complex Manifolds

<div class="definition">
<strong>Definition 5.1 (Hermitian Metric).</strong> A <em>Hermitian metric</em> on a complex manifold \(X\) of dimension \(n\) is a smooth choice of a Hermitian inner product \(h_x\) on each tangent space \(T_x^{1,0} X\). In local holomorphic coordinates \((z_1, \dots, z_n)\), a Hermitian metric is given by

\[
h = \sum_{j,k=1}^n h_{j\bar{k}}(z) \, dz_j \otimes d\bar{z}_k,
\]
where \((h_{j\bar{k}})\) is a positive definite Hermitian matrix at each point, i.e., \(h_{j\bar{k}} = \overline{h_{k\bar{j}}}\) and \(\sum h_{j\bar{k}} v_j \bar{v}_k > 0\) for all nonzero \(v \in \mathbb{C}^n\).
</div>

<div class="remark">
<strong>Remark 5.2.</strong> Every complex manifold admits a Hermitian metric (since one exists locally and can be patched using a partition of unity). From a Hermitian metric \(h\) on \(X\), one extracts:
<br>(a) A Riemannian metric \(g = \mathrm{Re}(h)\) on the underlying smooth manifold.
<br>(b) A real 2-form \(\omega\), the <em>fundamental form</em> or <em>Kahler form</em>, defined below.
</div>

<div class="definition">
<strong>Definition 5.3 (Fundamental 2-Form).</strong> The <em>fundamental 2-form</em> (or <em>associated \((1,1)\)-form</em>) of a Hermitian metric \(h\) is

\[
\omega = -\mathrm{Im}(h) = \frac{i}{2} \sum_{j,k} h_{j\bar{k}} \, dz_j \wedge d\bar{z}_k.
\]
This is a real \((1,1)\)-form (real means \(\bar\omega = \omega\)) and is positive in the sense that \(\omega^n / n! = \det(h_{j\bar{k}}) \cdot \left(\frac{i}{2}\right)^n dz_1 \wedge d\bar{z}_1 \wedge \cdots \wedge dz_n \wedge d\bar{z}_n\) is a positive volume form.
</div>

## 5.2 The Kahler Condition

<div class="definition">
<strong>Definition 5.4 (Kahler Manifold).</strong> A Hermitian metric \(h\) on a complex manifold \(X\) is <em>Kahler</em> if its fundamental form \(\omega\) is closed: \(d\omega = 0\). A complex manifold admitting a Kahler metric is called a <em>Kahler manifold</em>. The form \(\omega\) is then called a <em>Kahler form</em>.
</div>

<div class="remark">
<strong>Remark 5.5.</strong> The Kahler condition has several equivalent formulations:
<br>(i) \(d\omega = 0\).
<br>(ii) The Levi-Civita connection \(\nabla\) of the Riemannian metric \(g = \mathrm{Re}(h)\) satisfies \(\nabla J = 0\) (the complex structure is parallel).
<br>(iii) At each point, there exist holomorphic coordinates in which \(h_{j\bar{k}} = \delta_{jk} + O(|z|^2)\) (one can "osculate to second order").
<br>(iv) The holonomy group of \(g\) is contained in \(\mathrm{U}(n)\) (rather than the full \(\mathrm{O}(2n)\)).
<br>
Condition (iii) is particularly useful: it means that, to first order, a Kahler manifold looks like flat \(\mathbb{C}^n\), which makes many computations in Riemannian geometry much simpler.
</div>

## 5.3 Examples of Kahler Manifolds

<div class="example">
<strong>Example 5.6 (\(\mathbb{C}^n\)).</strong> The standard Hermitian metric \(h = \sum_j dz_j \otimes d\bar{z}_j\) on \(\mathbb{C}^n\) has \(\omega = \frac{i}{2} \sum_j dz_j \wedge d\bar{z}_j\), which is constant and hence closed. This is the flat Kahler metric.
</div>

<div class="example">
<strong>Example 5.7 (Fubini-Study Metric on \(\mathbb{CP}^n\)).</strong> The <em>Fubini-Study metric</em> is the unique (up to scale) \(\mathrm{U}(n+1)\)-invariant Kahler metric on \(\mathbb{CP}^n\). On the chart \(U_0 = \{z_0 \neq 0\}\) with coordinates \(w_j = z_j/z_0\), the Kahler form is

\[
\omega_{\mathrm{FS}} = \frac{i}{2} \partial\bar\partial \log(1 + |w_1|^2 + \cdots + |w_n|^2).
\]
One verifies directly that \(d\omega_{\mathrm{FS}} = 0\) (indeed, \(\omega_{\mathrm{FS}} = \frac{i}{2}\partial\bar\partial \varphi\) is automatically \(d\)-closed since \(d = \partial + \bar\partial\) and \(\partial\bar\partial\varphi = -\bar\partial\partial\varphi\), so \(d(\partial\bar\partial\varphi) = \partial^2\bar\partial\varphi - \bar\partial^2\partial\varphi = 0\)). Globally, the Kahler form can be written as \(\omega_{\mathrm{FS}} = \frac{i}{2}\partial\bar\partial\log|z|^2\), which transforms correctly between charts because the ambiguity \(\log|z|^2 \mapsto \log|z|^2 + \log|\lambda|^2\) is killed by \(\partial\bar\partial\).
</div>

<div class="example">
<strong>Example 5.8 (Complex Tori).</strong> A complex torus \(X = \mathbb{C}^n / \Lambda\) inherits the flat Kahler metric from \(\mathbb{C}^n\), since the standard metric is invariant under translations.
</div>

<div class="theorem">
<strong>Theorem 5.9.</strong> Every smooth complex submanifold of a Kahler manifold is Kahler (with the induced metric). In particular, every smooth projective variety is Kahler.
</div>

<div class="proof">
<strong>Proof.</strong> If \(Y \hookrightarrow X\) is a complex submanifold and \(\omega\) is a Kahler form on \(X\), then the restriction \(\omega|_Y\) is closed (pullback commutes with \(d\)) and positive (positive definiteness is preserved by restriction to a complex subspace). Hence \(\omega|_Y\) is a Kahler form on \(Y\). The second statement follows since every smooth projective variety is a complex submanifold of \(\mathbb{CP}^n\), which is Kahler by the Fubini-Study metric. \(\square\)
</div>

<div class="remark">
<strong>Remark 5.10.</strong> The converse is far from true: there exist compact Kahler manifolds that are not projective. The Kodaira embedding theorem (Chapter 7) gives a precise characterisation of which Kahler manifolds embed into projective space.
</div>

## 5.4 The Hodge Star and Adjoints

To do analysis (and in particular to apply elliptic PDE theory), we need inner products on the spaces of forms. A Hermitian metric \(h\) on \(X\) induces a Hermitian metric on \(\bigwedge^k T_X^* \otimes \mathbb{C}\) and hence an \(L^2\) inner product on compactly supported forms.

<div class="definition">
<strong>Definition 5.11 (Hodge Star).</strong> Let \((X, g)\) be an oriented Riemannian manifold of dimension \(m\) with volume form \(\mathrm{vol}_g\). The <em>Hodge star operator</em> \(*: \mathcal{A}^k(X) \to \mathcal{A}^{m-k}(X)\) is defined by

\[
\alpha \wedge *\beta = \langle \alpha, \beta \rangle \, \mathrm{vol}_g
\]
for all \(k\)-forms \(\alpha, \beta\), where \(\langle \cdot, \cdot \rangle\) is the pointwise inner product induced by \(g\). On a compact manifold, the \(L^2\) inner product is

\[
(\alpha, \beta)_{L^2} = \int_X \alpha \wedge *\bar\beta.
\]
</div>

<div class="definition">
<strong>Definition 5.12 (Formal Adjoints).</strong> With respect to the \(L^2\) inner product on a compact Hermitian manifold \(X\), the formal adjoints of \(d\), \(\partial\), and \(\bar\partial\) are denoted \(d^*\), \(\partial^*\), and \(\bar\partial^*\) respectively, characterised by

\[
(d\alpha, \beta)_{L^2} = (\alpha, d^*\beta)_{L^2}, \quad (\partial\alpha, \beta)_{L^2} = (\alpha, \partial^*\beta)_{L^2}, \quad (\bar\partial\alpha, \beta)_{L^2} = (\alpha, \bar\partial^*\beta)_{L^2}.
\]
On a compact manifold of real dimension \(m = 2n\), one has \(d^* = (-1)^{m(k+1)+1} * d *\) on \(k\)-forms. Similarly, \(\bar\partial^* = - * \partial *\) (up to signs that depend on conventions).
</div>

## 5.5 The Kahler Identities

The Kahler identities are remarkable algebraic relations between the operators \(\partial\), \(\bar\partial\), and the Lefschetz operators. They are the technical heart of Hodge theory on Kahler manifolds.

<div class="definition">
<strong>Definition 5.13 (Lefschetz Operators).</strong> Let \((X, \omega)\) be a Kahler manifold. Define:
<br>(i) The <em>Lefschetz operator</em> \(L: \mathcal{A}^k(X) \to \mathcal{A}^{k+2}(X)\) by \(L\alpha = \omega \wedge \alpha\).
<br>(ii) The <em>dual Lefschetz operator</em> \(\Lambda: \mathcal{A}^k(X) \to \mathcal{A}^{k-2}(X)\), the adjoint of \(L\) with respect to the \(L^2\) inner product.
</div>

<div class="theorem">
<strong>Theorem 5.14 (Kahler Identities).</strong> On a Kahler manifold \((X, \omega)\), the following identities hold:

\[
[\Lambda, \bar\partial] = -i \partial^*, \quad [\Lambda, \partial] = i \bar\partial^*,
\]

\[
[L, \partial^*] = i \bar\partial, \quad [L, \bar\partial^*] = -i \partial.
\]
Here \([A, B] = AB - BA\) denotes the commutator.
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> The proof proceeds in two stages. First, one verifies the identities pointwise at a given point \(p \in X\) by choosing normal holomorphic coordinates centred at \(p\) — coordinates in which \(h_{j\bar{k}}(p) = \delta_{jk}\) and all first-order derivatives of \(h_{j\bar{k}}\) vanish at \(p\). This is possible because the metric is Kahler (Remark 5.5(iii)). In these coordinates at \(p\), the operators reduce to their flat counterparts, and the identities become an algebraic computation in the exterior algebra of \(\mathbb{C}^n\), which can be checked by direct computation using the formulas

\[
L = \frac{i}{2} \sum_j e(dz_j) e(d\bar{z}_j), \quad \Lambda = -\frac{i}{2} \sum_j \iota(\partial/\partial z_j) \iota(\partial/\partial \bar{z}_j),
\]
where \(e(\alpha)\) denotes exterior multiplication by \(\alpha\) and \(\iota(v)\) denotes interior multiplication (contraction) by \(v\). The computation involves repeated use of the anticommutation relations \(\{e(\alpha), \iota(v)\} = \alpha(v)\). Since both sides of the identities are zeroth-order (algebraic) operators on forms, and they agree at each point, the identities hold globally. See Griffiths-Harris, pp. 111-114, or Huybrechts, Proposition 3.1.12, for the full computation. \(\square\)
</div>

## 5.6 The Three Laplacians

<div class="definition">
<strong>Definition 5.15 (Laplacians).</strong> On a compact Hermitian manifold, one defines three Laplacian operators:

\[
\Delta_d = dd^* + d^*d, \quad \Delta_\partial = \partial\partial^* + \partial^*\partial, \quad \Delta_{\bar\partial} = \bar\partial\bar\partial^* + \bar\partial^*\bar\partial.
\]
Each is a second-order elliptic differential operator. In general, these three Laplacians are unrelated.
</div>

<div class="theorem">
<strong>Theorem 5.16 (Equality of Laplacians on Kahler Manifolds).</strong> On a Kahler manifold,

\[
\Delta_d = 2\Delta_\partial = 2\Delta_{\bar\partial}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> We derive this from the Kahler identities. Since \(d = \partial + \bar\partial\) and \(d^* = \partial^* + \bar\partial^*\),

\[
\Delta_d = (\partial + \bar\partial)(\partial^* + \bar\partial^*) + (\partial^* + \bar\partial^*)(\partial + \bar\partial).
\]
Expanding, using \(\partial^2 = 0\), \(\bar\partial^2 = 0\), and \((\partial^*)^2 = 0\), \((\bar\partial^*)^2 = 0\):

\[
\Delta_d = \underbrace{(\partial\partial^* + \partial^*\partial)}_{=\,\Delta_\partial} + \underbrace{(\bar\partial\bar\partial^* + \bar\partial^*\bar\partial)}_{=\,\Delta_{\bar\partial}} + (\partial\bar\partial^* + \bar\partial^*\partial) + (\bar\partial\partial^* + \partial^*\bar\partial).
\]
From the Kahler identity \([\Lambda, \bar\partial] = -i\partial^*\), i.e., \(\partial^* = i[\bar\partial, \Lambda]\), one computes

\[
\partial\bar\partial^* + \bar\partial^*\partial = \text{(terms involving } \Lambda\text{)},
\]
and after careful computation using both Kahler identities, one shows that the cross terms satisfy

\[
\partial\bar\partial^* + \bar\partial^*\partial = 0 \quad \text{and} \quad \bar\partial\partial^* + \partial^*\bar\partial = 0.
\]
Therefore \(\Delta_d = \Delta_\partial + \Delta_{\bar\partial}\). Moreover, the Kahler identity \(\partial^* = i[\bar\partial, \Lambda] = i\bar\partial\Lambda - i\Lambda\bar\partial\) allows one to show by direct expansion that \(\Delta_\partial = \Delta_{\bar\partial}\) (using the fact that \([\partial, \Lambda]\) gives \(\bar\partial^*\) up to sign). Hence \(\Delta_d = 2\Delta_{\bar\partial} = 2\Delta_\partial\). \(\square\)
</div>

<div class="remark">
<strong>Remark 5.17.</strong> The equality \(\Delta_d = 2\Delta_{\bar\partial}\) is the crucial fact that makes Hodge theory work on Kahler manifolds. It implies that the \(d\)-harmonic forms (kernel of \(\Delta_d\)) are exactly the \(\bar\partial\)-harmonic forms (kernel of \(\Delta_{\bar\partial}\)), and since \(\Delta_{\bar\partial}\) preserves the \((p,q)\)-type of a form, the space of harmonic forms inherits the type decomposition. This is the mechanism behind the Hodge decomposition.
</div>

---

# Chapter 6: Hodge Theory

We arrive at the centrepiece of this course. Hodge theory, developed by W.V.D. Hodge in the 1930s and refined by Kodaira, de Rham, Weil, and others, uses elliptic PDE theory to establish deep connections between the topology, the complex structure, and the geometry of Kahler manifolds. The main results — the Hodge theorem, the Hodge decomposition, Hodge symmetry, and the Hard Lefschetz theorem — impose powerful constraints on the topology of any manifold that admits a Kahler structure.

## 6.1 Harmonic Forms and the Hodge Theorem

Let \((X, h)\) be a compact Hermitian manifold of complex dimension \(n\). The Laplacian \(\Delta_d = dd^* + d^* d\) is an elliptic, self-adjoint, nonnegative second-order differential operator on the space of smooth \(k\)-forms.

<div class="definition">
<strong>Definition 6.1 (Harmonic Forms).</strong> A smooth \(k\)-form \(\alpha\) on a compact Hermitian manifold \((X, h)\) is <em>harmonic</em> if \(\Delta_d \alpha = 0\). We write \(\mathcal{H}^k(X)\) for the space of harmonic \(k\)-forms. Since \(\Delta_d\) is self-adjoint and nonnegative,

\[
(\Delta_d \alpha, \alpha)_{L^2} = (d\alpha, d\alpha)_{L^2} + (d^*\alpha, d^*\alpha)_{L^2} = \|d\alpha\|^2 + \|d^*\alpha\|^2,
\]
so \(\alpha\) is harmonic if and only if \(d\alpha = 0\) and \(d^*\alpha = 0\).
</div>

<div class="theorem">
<strong>Theorem 6.2 (Hodge Theorem).</strong> Let \(X\) be a compact oriented Riemannian manifold. Then:
<br>(i) Each de Rham cohomology class in \(H^k_{\mathrm{dR}}(X, \mathbb{R})\) contains a unique harmonic representative: \(\mathcal{H}^k(X) \cong H^k_{\mathrm{dR}}(X, \mathbb{R})\).
<br>(ii) There is an orthogonal decomposition (the <em>Hodge decomposition of forms</em>):

\[
\mathcal{A}^k(X) = \mathcal{H}^k(X) \oplus d\mathcal{A}^{k-1}(X) \oplus d^*\mathcal{A}^{k+1}(X).
\]
(iii) The space \(\mathcal{H}^k(X)\) is finite-dimensional.
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> The proof rests on the theory of elliptic operators on compact manifolds. One works with Sobolev spaces \(W^{s,2}\) of \(k\)-forms and uses the following key results from elliptic PDE theory:

<strong>Elliptic regularity:</strong> If \(\alpha\) is a distributional solution to \(\Delta_d \alpha = \beta\) with \(\beta\) smooth, then \(\alpha\) is smooth. This follows from the ellipticity of \(\Delta_d\) and standard Schauder estimates.

<strong>Fredholm theory:</strong> On a compact manifold, the Laplacian \(\Delta_d: W^{s+2,2}(\bigwedge^k T^*X) \to W^{s,2}(\bigwedge^k T^*X)\) is a Fredholm operator of index 0. Its kernel is finite-dimensional and equals the smooth harmonic forms (by elliptic regularity).

<strong>Orthogonal decomposition:</strong> Since \(\Delta_d\) is self-adjoint and Fredholm, the \(L^2\) space of \(k\)-forms decomposes as \(\ker(\Delta_d) \oplus \overline{\mathrm{im}(\Delta_d)}\). By elliptic regularity, the closure is unnecessary in the smooth category, and one obtains the decomposition \(\mathcal{A}^k = \mathcal{H}^k \oplus \mathrm{im}(\Delta_d)\). Since \(\mathrm{im}(\Delta_d) = d(d^*\mathcal{A}^k) + d^*(d\mathcal{A}^k) \subseteq d\mathcal{A}^{k-1} + d^*\mathcal{A}^{k+1}\) (using \(\Delta_d = dd^* + d^*d\)), and the three summands are mutually orthogonal (e.g., \((d\alpha, d^*\beta) = (d^2\alpha, \beta) = 0\)), we get the decomposition in (ii).

For (i), note that every harmonic form is closed (\(d\alpha = 0\) since \(\alpha\) is harmonic), so we have a map \(\mathcal{H}^k \to H^k_{\mathrm{dR}}\). This map is injective: if \(\alpha\) is harmonic and exact, say \(\alpha = d\beta\), then \(\alpha \in \mathcal{H}^k \cap d\mathcal{A}^{k-1}\), which forces \(\alpha = 0\) by the orthogonality of the decomposition. Surjectivity: given a closed form \(\omega\), write \(\omega = \alpha + d\beta + d^*\gamma\) with \(\alpha\) harmonic. Then \(0 = d\omega = dd^*\gamma\), so \(\|d^*\gamma\|^2 = (d^*\gamma, d^*\gamma) = (\gamma, dd^*\gamma) = 0\), giving \(\omega = \alpha + d\beta\), so \([\omega] = [\alpha]\) in \(H^k_{\mathrm{dR}}\). \(\square\)
</div>

<div class="remark">
<strong>Remark 6.3.</strong> The Hodge theorem is a statement about compact Riemannian manifolds — it does not require a complex structure. What the complex structure (and specifically the Kahler condition) provides is the refinement of this theorem into a decomposition by \((p,q)\)-type, which we now develop.
</div>

## 6.2 The Hodge Decomposition

<div class="theorem">
<strong>Theorem 6.4 (Hodge Decomposition for Kahler Manifolds).</strong> Let \(X\) be a compact Kahler manifold of complex dimension \(n\). Then:
<br>(i) There is a direct sum decomposition

\[
H^k(X, \mathbb{C}) = \bigoplus_{p+q=k} H^{p,q}(X),
\]
where \(H^{p,q}(X)\) denotes the space of cohomology classes represented by closed forms of type \((p,q)\).
<br>(ii) Each summand \(H^{p,q}(X)\) is canonically isomorphic to the Dolbeault cohomology group \(H^{p,q}_{\bar\partial}(X)\) and to the space of \(\Delta_{\bar\partial}\)-harmonic \((p,q)\)-forms:

\[
H^{p,q}(X) \cong H^{p,q}_{\bar\partial}(X) \cong \mathcal{H}^{p,q}(X) = \{\alpha \in \mathcal{A}^{p,q}(X) : \Delta_{\bar\partial}\alpha = 0\}.
\]
(iii) This decomposition is independent of the choice of Kahler metric.
</div>

<div class="proof">
<strong>Proof.</strong> The key input is the equality of Laplacians on Kahler manifolds (Theorem 5.16): \(\Delta_d = 2\Delta_{\bar\partial}\). Since \(\Delta_{\bar\partial}\) preserves the type of a form (\(\Delta_{\bar\partial}\) maps \(\mathcal{A}^{p,q}\) to itself, because both \(\bar\partial\) and \(\bar\partial^*\) do), it follows that \(\Delta_d\) also preserves type. Therefore, a \(k\)-form \(\alpha\) is \(\Delta_d\)-harmonic if and only if its \((p,q)\)-components \(\alpha^{p,q}\) are each \(\Delta_d\)-harmonic (equivalently, \(\Delta_{\bar\partial}\)-harmonic). This gives the decomposition

\[
\mathcal{H}^k(X) = \bigoplus_{p+q=k} \mathcal{H}^{p,q}(X).
\]
By the Hodge theorem (Theorem 6.2), \(\mathcal{H}^k(X) \cong H^k(X, \mathbb{R}) \otimes \mathbb{C} = H^k(X, \mathbb{C})\). By Dolbeault's theorem (Theorem 4.11) and the analogous Hodge theorem for \(\Delta_{\bar\partial}\), we have \(\mathcal{H}^{p,q}(X) \cong H^{p,q}_{\bar\partial}(X)\). Setting \(H^{p,q}(X) = \mathcal{H}^{p,q}(X)\) gives the decomposition in (i).

For the independence from the Kahler metric (iii), one shows that the subspace \(H^{p,q}(X) \subseteq H^k(X, \mathbb{C})\) can be characterised intrinsically: it is the image of the natural map \(H^{p,q}_{\bar\partial}(X) \to H^k(X, \mathbb{C})\) induced by the inclusion of closed \((p,q)\)-forms into closed \(k\)-forms. The Kahler condition is needed to show this map is injective and that its images for different \((p,q)\) are complementary, but the resulting subspaces depend only on the complex structure. \(\square\)
</div>

## 6.3 Hodge Numbers and Hodge Symmetry

<div class="definition">
<strong>Definition 6.5 (Hodge Numbers).</strong> The <em>Hodge numbers</em> of a compact Kahler manifold \(X\) are

\[
h^{p,q}(X) = \dim_\mathbb{C} H^{p,q}(X) = \dim_\mathbb{C} H^q(X, \Omega^p_X).
\]
The \(k\)-th Betti number satisfies \(b_k(X) = \sum_{p+q=k} h^{p,q}(X)\).
</div>

<div class="theorem">
<strong>Theorem 6.6 (Hodge Symmetry).</strong> For a compact Kahler manifold \(X\),

\[
h^{p,q}(X) = h^{q,p}(X) \quad \text{for all } p, q.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Complex conjugation \(\alpha \mapsto \bar\alpha\) sends \(\mathcal{A}^{p,q}(X)\) to \(\mathcal{A}^{q,p}(X)\) and commutes with \(\Delta_d\) (since \(\Delta_d\) is a real operator: it is defined using the real Riemannian metric and the real exterior derivative). Therefore, conjugation induces a conjugate-linear isomorphism \(\mathcal{H}^{p,q}(X) \cong \mathcal{H}^{q,p}(X)\), giving \(h^{p,q} = h^{q,p}\). \(\square\)
</div>

<div class="corollary">
<strong>Corollary 6.7.</strong> On a compact Kahler manifold, the odd Betti numbers \(b_{2k+1}\) are even. In particular, \(b_1\) is even.
</div>

<div class="proof">
<strong>Proof.</strong> By the Hodge decomposition, \(b_{2k+1} = \sum_{p+q=2k+1} h^{p,q}\). The terms pair up via Hodge symmetry: \(h^{p, 2k+1-p} = h^{2k+1-p, p}\). Since \(p \neq 2k+1-p\) when \(2k+1\) is odd, each Hodge number appears in a pair with its partner, so the sum is even. \(\square\)
</div>

<div class="remark">
<strong>Remark 6.8.</strong> The condition \(b_1\) even is a nontrivial topological obstruction to the existence of a Kahler structure. The Hopf surface \(S^1 \times S^3\) has \(b_1 = 1\), so it does not admit a Kahler metric despite being a compact complex manifold of dimension 2.
</div>

## 6.4 The Hodge Diamond

<div class="definition">
<strong>Definition 6.9 (Hodge Diamond).</strong> The Hodge numbers of a compact Kahler manifold of dimension \(n\) are traditionally arranged in a diamond pattern:

\[
\begin{array}{ccccccc}
& & & h^{0,0} & & & \\
& & h^{1,0} & & h^{0,1} & & \\
& h^{2,0} & & h^{1,1} & & h^{0,2} & \\
h^{n,0} & & \cdots & & \cdots & & h^{0,n} \\
& h^{n,1} & & \cdots & & h^{1,n} & \\
& & & \vdots & & & \\
& & & h^{n,n} & & &
\end{array}
\]
The diamond enjoys the following symmetries:
<br>(i) <em>Hodge symmetry</em>: \(h^{p,q} = h^{q,p}\) (reflection across the vertical axis).
<br>(ii) <em>Serre duality</em>: \(h^{p,q} = h^{n-p, n-q}\) (rotation by 180 degrees).
</div>

<div class="example">
<strong>Example 6.10 (Hodge Diamond of \(\mathbb{CP}^n\)).</strong> For \(\mathbb{CP}^n\), the Hodge numbers are \(h^{p,p} = 1\) for \(0 \leq p \leq n\) and \(h^{p,q} = 0\) for \(p \neq q\). The Hodge diamond of \(\mathbb{CP}^2\) is:

\[
\begin{array}{ccccc}
& & 1 & & \\
& 0 & & 0 & \\
1 & & 1 & & 1 \\
& 0 & & 0 & \\
& & 1 & &
\end{array}
\]
This reflects the facts that \(b_0 = b_2 = b_4 = 1\) and \(b_1 = b_3 = 0\) for \(\mathbb{CP}^2\).
</div>

<div class="example">
<strong>Example 6.11 (Hodge Diamond of an Elliptic Curve).</strong> An elliptic curve \(E = \mathbb{C}/\Lambda\) has dimension 1 and Hodge numbers \(h^{0,0} = h^{1,0} = h^{0,1} = h^{1,1} = 1\):

\[
\begin{array}{ccc}
& 1 & \\
1 & & 1 \\
& 1 &
\end{array}
\]
This gives \(b_0 = 1\), \(b_1 = 2\), \(b_2 = 1\), consistent with the topology of the torus \(T^2\).
</div>

<div class="example">
<strong>Example 6.12 (Hodge Diamond of a K3 Surface).</strong> A K3 surface is a simply connected compact complex surface with trivial canonical bundle. Its Hodge diamond is:

\[
\begin{array}{ccccc}
& & 1 & & \\
& 0 & & 0 & \\
1 & & 20 & & 1 \\
& 0 & & 0 & \\
& & 1 & &
\end{array}
\]
giving Betti numbers \(b_0 = 1\), \(b_1 = 0\), \(b_2 = 22\), \(b_3 = 0\), \(b_4 = 1\), and Euler characteristic \(\chi = 24\). The large value \(h^{1,1} = 20\) reflects the richness of the geometry of K3 surfaces.
</div>

## 6.5 Serre Duality

<div class="theorem">
<strong>Theorem 6.13 (Serre Duality).</strong> Let \(X\) be a compact complex manifold of dimension \(n\) and \(\mathcal{E}\) a holomorphic vector bundle on \(X\). Then there is a natural isomorphism

\[
H^q(X, \mathcal{E}) \cong H^{n-q}(X, K_X \otimes \mathcal{E}^*)^*,
\]
where \(K_X = \Omega_X^n\) is the canonical bundle and \(\mathcal{E}^*\) is the dual bundle. In particular, for the trivial bundle,

\[
H^q(X, \mathcal{O}_X) \cong H^{n-q}(X, K_X)^*.
\]
For Hodge numbers, this gives \(h^{p,q} = h^{n-p, n-q}\).
</div>

<div class="proof">
<strong>Proof (via Hodge theory on Kahler manifolds).</strong> On a compact Kahler manifold, the Hodge star operator gives a conjugate-linear isomorphism

\[
*: \mathcal{H}^{p,q}(X) \xrightarrow{\sim} \mathcal{H}^{n-q, n-p}(X).
\]
Composing with the isomorphism \(\mathcal{H}^{p,q}(X) \cong H^q(X, \Omega^p_X)\) from the Hodge theorem and Dolbeault's theorem, and using that the pairing \(H^q(X, \Omega^p) \times H^{n-q}(X, \Omega^{n-p}) \to H^n(X, \Omega^n) \cong \mathbb{C}\) is nondegenerate (by integration), one obtains the duality. More generally, Serre proved this by purely algebraic methods using the trace map and a duality theorem for coherent sheaves on compact complex manifolds. \(\square\)
</div>

## 6.6 The Hard Lefschetz Theorem

The Hard Lefschetz theorem is one of the deepest results in Hodge theory. It asserts that repeated wedging with the Kahler class is an isomorphism, providing a powerful structural constraint on the cohomology of compact Kahler manifolds.

<div class="theorem">
<strong>Theorem 6.14 (Hard Lefschetz Theorem).</strong> Let \((X, \omega)\) be a compact Kahler manifold of complex dimension \(n\), and let \([\omega] \in H^2(X, \mathbb{R})\) be the Kahler class. Then for each \(0 \leq k \leq n\), the map

\[
L^{n-k}: H^k(X, \mathbb{R}) \to H^{2n-k}(X, \mathbb{R}), \quad [\alpha] \mapsto [\omega^{n-k} \wedge \alpha],
\]
is an isomorphism.
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> By the Hodge theorem, it suffices to show that \(L^{n-k}: \mathcal{H}^k(X) \to \mathcal{H}^{2n-k}(X)\) is an isomorphism. Using the Kahler identities, one shows that the operators \(L\), \(\Lambda\), and \(H = \sum_k (k - n) \cdot \mathrm{id}|_{\mathcal{A}^k}\) satisfy the commutation relations of the Lie algebra \(\mathfrak{sl}(2, \mathbb{C})\):

\[
[H, L] = 2L, \quad [H, \Lambda] = -2\Lambda, \quad [L, \Lambda] = H.
\]
The Hodge theorem gives a decomposition of the harmonic forms into a finite-dimensional representation of \(\mathfrak{sl}(2, \mathbb{C})\). By the representation theory of \(\mathfrak{sl}(2, \mathbb{C})\), in any finite-dimensional representation, the operator \(L^{n-k}\) maps the weight-\((k-n)\) space isomorphically onto the weight-\((n-k)\) space. The weight spaces here are precisely the spaces of harmonic \(k\)-forms and harmonic \((2n-k)\)-forms. \(\square\)
</div>

## 6.7 Lefschetz Decomposition

<div class="definition">
<strong>Definition 6.15 (Primitive Cohomology).</strong> The <em>primitive cohomology</em> in degree \(k \leq n\) is

\[
P^k(X) = \ker(L^{n-k+1}: H^k(X, \mathbb{R}) \to H^{2n-k+2}(X, \mathbb{R})).
\]
A cohomology class \(\alpha \in H^k(X, \mathbb{R})\) with \(k \leq n\) is <em>primitive</em> if \(L^{n-k+1}\alpha = 0\), equivalently \(\Lambda\alpha = 0\).
</div>

<div class="theorem">
<strong>Theorem 6.16 (Lefschetz Decomposition).</strong> For a compact Kahler manifold \((X, \omega)\) of dimension \(n\), there is a direct sum decomposition

\[
H^k(X, \mathbb{R}) = \bigoplus_{r \geq \max(0, k-n)} L^r P^{k-2r}(X)
\]
for each \(k\). In other words, every cohomology class is uniquely a sum of classes of the form \([\omega^r] \cup \alpha\) with \(\alpha\) primitive.
</div>

<div class="remark">
<strong>Remark 6.17.</strong> The Lefschetz decomposition is the decomposition of the cohomology \(H^*(X, \mathbb{R})\) into irreducible representations of the \(\mathfrak{sl}(2)\) action generated by \(L\), \(\Lambda\), and \(H\). Each irreducible representation is generated by a primitive class \(\alpha \in P^k(X)\) and consists of the classes \(\alpha, L\alpha, L^2\alpha, \dots, L^{n-k}\alpha\).
</div>

## 6.8 Hodge-Riemann Bilinear Relations

The Hodge-Riemann bilinear relations refine the Hard Lefschetz theorem by endowing the primitive cohomology with a definite bilinear form. They are essential for the theory of period domains and variations of Hodge structure.

<div class="definition">
<strong>Definition 6.18 (Hodge-Riemann Form).</strong> On a compact Kahler manifold \((X, \omega)\) of dimension \(n\), define the bilinear form on \(H^k(X, \mathbb{R})\) by

\[
Q(\alpha, \beta) = (-1)^{k(k-1)/2} \int_X \alpha \wedge \beta \wedge \omega^{n-k}.
\]
</div>

<div class="theorem">
<strong>Theorem 6.19 (Hodge-Riemann Bilinear Relations).</strong> Let \(X\) be a compact Kahler manifold of dimension \(n\) with Kahler form \(\omega\). Let \(\alpha \in H^{p,q}(X) \cap P^{p+q}(X)\) be a nonzero primitive class of type \((p,q)\). Then:
<br>(i) \(Q(\alpha, \beta) = 0\) if \(\beta \in H^{p',q'}(X)\) with \((p',q') \neq (q, p)\).
<br>(ii) \(i^{p-q} (-1)^{k(k-1)/2} Q(\alpha, \bar\alpha) > 0\), where \(k = p + q\).
</div>

<div class="remark">
<strong>Remark 6.20.</strong> The positivity condition (ii) is a signature constraint. It implies that the intersection form on primitive cohomology is definite (of a sign determined by the type). This has applications ranging from the theory of algebraic cycles to the Torelli theorem for K3 surfaces.
</div>

## 6.9 The Hodge Conjecture

We conclude this chapter with the statement of one of the most famous open problems in mathematics.

<div class="definition">
<strong>Definition 6.21 (Algebraic Cycle Class).</strong> Let \(X\) be a smooth projective variety of dimension \(n\) over \(\mathbb{C}\). A <em>codimension-\(p\) algebraic cycle</em> on \(X\) is a formal integer linear combination of codimension-\(p\) algebraic subvarieties. The cycle class map sends a codimension-\(p\) subvariety \(Z \subset X\) to a class \([Z] \in H^{2p}(X, \mathbb{Z})\), which under the Hodge decomposition lies in \(H^{p,p}(X) \cap H^{2p}(X, \mathbb{Q})\) (after tensoring with \(\mathbb{Q}\)).
</div>

<div class="theorem">
<strong>Theorem/Conjecture 6.22 (The Hodge Conjecture).</strong> Let \(X\) be a smooth projective variety over \(\mathbb{C}\). Then every Hodge class, i.e., every class in

\[
H^{2p}(X, \mathbb{Q}) \cap H^{p,p}(X),
\]
is a rational linear combination of classes of algebraic subvarieties.
</div>

<div class="remark">
<strong>Remark 6.23.</strong> The Hodge conjecture is one of the seven Clay Millennium Prize Problems. It is known to be true for \(p = 1\) (by the Lefschetz (1,1)-theorem, a consequence of the exponential sequence) and for \(p = n - 1\) (by Hard Lefschetz and the \(p = 1\) case). Beyond these cases, it remains wide open. Counterexamples are known for the integral version (Atiyah-Hirzebruch, 1962) and for the generalisation to Kahler manifolds (Voisin, 2002). The conjecture is false over non-algebraically-closed fields.

The Hodge conjecture is deeply connected to the theory of motives and to the Tate conjecture over finite fields. Its resolution would have profound implications for algebraic geometry, number theory, and mathematical physics.
</div>

---

# Chapter 7: Vanishing Theorems and Applications

The final chapter brings together the analytic, geometric, and cohomological threads of the course. Vanishing theorems — results asserting that certain cohomology groups are zero — are among the most powerful tools in complex algebraic geometry. They convert geometric positivity conditions (on line bundles) into algebraic vanishing conditions (on cohomology), with striking geometric consequences, the most famous being the Kodaira embedding theorem, which characterises projective manifolds among all compact complex manifolds.

## 7.1 Positive Line Bundles and Curvature

To state the Kodaira vanishing theorem, we need the notion of a positive line bundle, which is defined via the curvature of a Hermitian metric on the bundle.

<div class="definition">
<strong>Definition 7.1 (Hermitian Metric on a Line Bundle).</strong> A <em>Hermitian metric</em> on a holomorphic line bundle \(L \to X\) is a smooth choice of a Hermitian inner product on each fibre \(L_x\). In a local trivialisation, a Hermitian metric is given by a positive smooth function \(e^{-\varphi}\), where \(\varphi\) is called the <em>local weight</em> (or <em>potential</em>). If \(s\) is a local section, then \(\|s\|^2 = |s|^2 e^{-\varphi}\), where \(|s|\) is the absolute value in the trivialisation.
</div>

<div class="definition">
<strong>Definition 7.2 (Curvature Form).</strong> The <em>curvature form</em> (or <em>first Chern form</em>) of a Hermitian holomorphic line bundle \((L, h)\) is the real \((1,1)\)-form

\[
\Theta_h(L) = -\frac{i}{2\pi} \partial\bar\partial \log h = \frac{i}{2\pi} \partial\bar\partial \varphi,
\]
where \(\varphi\) is the local weight. This is a globally well-defined closed real \((1,1)\)-form, and its cohomology class is the first Chern class: \([\Theta_h(L)] = c_1(L) \in H^{1,1}(X) \cap H^2(X, \mathbb{R})\).
</div>

<div class="definition">
<strong>Definition 7.3 (Positive Line Bundle).</strong> A holomorphic line bundle \(L\) on a compact complex manifold \(X\) is <em>positive</em> (in the sense of Kodaira) if it admits a Hermitian metric \(h\) whose curvature form \(\Theta_h(L)\) is a positive \((1,1)\)-form, i.e., in local coordinates,

\[
\frac{i}{2\pi} \sum_{j,k} \frac{\partial^2 \varphi}{\partial z_j \partial \bar{z}_k} dz_j \wedge d\bar{z}_k
\]
is positive definite at every point. Equivalently, \(\Theta_h(L)\) is a Kahler form on \(X\).
</div>

<div class="remark">
<strong>Remark 7.4.</strong> Note that a positive line bundle is in particular ample (by the Kodaira embedding theorem below). The positivity of \(L\) implies that \(X\) is Kahler, since \(\Theta_h(L)\) is a Kahler form. For \(\mathbb{CP}^n\), the hyperplane bundle \(\mathcal{O}(1)\) is positive: the Fubini-Study metric on \(\mathbb{CP}^n\) is precisely the curvature form of the standard Hermitian metric on \(\mathcal{O}(1)\).
</div>

<div class="example">
<strong>Example 7.5.</strong> On \(\mathbb{CP}^n\), consider the line bundle \(\mathcal{O}(k)\) for \(k \in \mathbb{Z}\). The curvature form of \(\mathcal{O}(k)\) with the Fubini-Study metric is \(k \cdot \omega_{\mathrm{FS}}\). Thus \(\mathcal{O}(k)\) is positive if and only if \(k > 0\), negative if and only if \(k < 0\), and flat if and only if \(k = 0\) (the trivial bundle).
</div>

## 7.2 The Kodaira Vanishing Theorem

<div class="theorem">
<strong>Theorem 7.6 (Kodaira Vanishing Theorem).</strong> Let \(X\) be a compact Kahler manifold of dimension \(n\) and \(L\) a positive line bundle on \(X\). Then

\[
H^q(X, \Omega_X^p \otimes L) = 0 \quad \text{for } p + q > n.
\]
In particular, taking \(p = n\), we obtain the important special case

\[
H^q(X, K_X \otimes L) = 0 \quad \text{for } q > 0,
\]
which is sometimes called the <em>Kodaira-Nakano vanishing theorem</em> (the full statement above, for all \(p\), is due to Nakano).
</div>

<div class="proof">
<strong>Proof (Sketch, following Kodaira).</strong> The proof uses the Bochner technique — a method that derives vanishing from curvature positivity via integration by parts.

<strong>Step 1: Twisted Laplacian.</strong> Equip \(L\) with a Hermitian metric \(h\) such that \(\Theta_h(L) > 0\). The metric \(h\) induces a twisted Laplacian \(\Delta''_L = \bar\partial_L \bar\partial_L^* + \bar\partial_L^* \bar\partial_L\) on \(L\)-valued \((p,q)\)-forms, where \(\bar\partial_L\) is the \(\bar\partial\)-operator on \(\mathcal{A}^{p,q}(X, L)\).

<strong>Step 2: Bochner-Kodaira-Nakano identity.</strong> The generalised Kahler identity for twisted operators gives

\[
\Delta''_L = \Delta'_L + [\sqrt{-1}\Theta_h(L), \Lambda],
\]
where \(\Delta'_L = \partial_L \partial_L^* + \partial_L^* \partial_L\) and \([\sqrt{-1}\Theta_h(L), \Lambda]\) is an algebraic (zeroth-order) operator on forms.

<strong>Step 3: Positivity estimate.</strong> For a harmonic \(L\)-valued \((p,q)\)-form \(\alpha\) (i.e., \(\Delta''_L \alpha = 0\)), taking the \(L^2\) inner product with \(\alpha\):

\[
0 = \|\partial_L^* \alpha\|^2 + \|\partial_L \alpha\|^2 + ([\sqrt{-1}\Theta_h(L), \Lambda]\alpha, \alpha).
\]
One then computes the algebraic operator \([\sqrt{-1}\Theta_h(L), \Lambda]\) on \((p,q)\)-forms. When \(\Theta_h(L)\) is positive, this operator is positive for \(p + q > n\) (this is a pointwise algebraic computation, the Nakano inequality). Therefore \(\alpha = 0\), showing that the space of harmonic \(L\)-valued \((p,q)\)-forms vanishes, hence \(H^q(X, \Omega^p \otimes L) = 0\) for \(p + q > n\). \(\square\)
</div>

<div class="remark">
<strong>Remark 7.7.</strong> By Serre duality, Kodaira vanishing also gives vanishing "at the other end": \(H^q(X, \Omega^p \otimes L^{-1}) = 0\) for \(p + q < n\), when \(L\) is positive.
</div>

<div class="corollary">
<strong>Corollary 7.8 (Kodaira Vanishing, Classical Form).</strong> Let \(X\) be a smooth projective variety of dimension \(n\) and \(L\) an ample line bundle on \(X\). Then

\[
H^q(X, K_X \otimes L) = 0 \quad \text{for all } q \geq 1.
\]
Equivalently, by Serre duality, \(H^q(X, L^{-1}) = 0\) for \(q \leq n - 1\).
</div>

## 7.3 The Kodaira Embedding Theorem

The Kodaira embedding theorem is one of the crown jewels of complex geometry. It provides a clean, intrinsic characterisation of which compact complex manifolds can be embedded in projective space.

<div class="theorem">
<strong>Theorem 7.9 (Kodaira Embedding Theorem, 1954).</strong> A compact complex manifold \(X\) admits a holomorphic embedding into some projective space \(\mathbb{CP}^N\) if and only if \(X\) admits a positive line bundle.
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> The "only if" direction is straightforward: if \(X \hookrightarrow \mathbb{CP}^N\) is a projective embedding, then \(L = \mathcal{O}(1)|_X\) is a positive line bundle on \(X\) (the restriction of the positive Fubini-Study metric gives a positive curvature form).

The "if" direction is the deep content. Given a positive line bundle \(L\) on \(X\), one shows that for \(k\) sufficiently large, the line bundle \(L^k\) has "enough sections" to embed \(X\) into projective space. This requires three properties of the linear system \(|L^k|\):

(a) <strong>Base-point freeness:</strong> For any \(x \in X\), there exists \(s \in H^0(X, L^k)\) with \(s(x) \neq 0\).
(b) <strong>Separation of points:</strong> For distinct \(x, y \in X\), there exists \(s \in H^0(X, L^k)\) with \(s(x) = 0\) but \(s(y) \neq 0\).
(c) <strong>Separation of tangent directions:</strong> For any \(x \in X\) and any tangent direction \(v \in T_x X\), there exists \(s \in H^0(X, L^k)\) vanishing at \(x\) but with \(ds(x)(v) \neq 0\).

Each of these is proved by applying the Kodaira vanishing theorem to an appropriate exact sequence. For instance, to show (a), consider the ideal sheaf \(\mathcal{I}_x\) of a point \(x\) and the exact sequence

\[
0 \to \mathcal{I}_x \otimes L^k \to L^k \to L^k|_x \to 0.
\]
Taking cohomology, surjectivity of \(H^0(X, L^k) \to H^0(\{x\}, L^k|_x) = \mathbb{C}\) follows from \(H^1(X, \mathcal{I}_x \otimes L^k) = 0\), which is a consequence of Kodaira vanishing for \(k\) large. Similarly for (b) and (c), using the ideal sheaf of two points or of a first-order neighbourhood. Given these three properties, the map

\[
\Phi_{L^k}: X \to \mathbb{CP}^N, \quad x \mapsto [s_0(x) : \cdots : s_N(x)],
\]
where \(s_0, \dots, s_N\) is a basis for \(H^0(X, L^k)\), is a well-defined holomorphic embedding. \(\square\)
</div>

<div class="remark">
<strong>Remark 7.10.</strong> The Kodaira embedding theorem can be reformulated: a compact complex manifold \(X\) is projective if and only if it admits a Kahler form whose cohomology class lies in \(H^2(X, \mathbb{Z})\) (i.e., an "integral" Kahler class). The condition that the Kahler class be integral (rational would suffice, by taking a multiple) is the key algebraic condition that distinguishes projective manifolds from general Kahler manifolds.
</div>

## 7.4 The Lefschetz Hyperplane Theorem

The Lefschetz hyperplane theorem relates the topology of a smooth projective variety to that of a hyperplane section. It is both a consequence of Hodge theory and a tool that complements it.

<div class="theorem">
<strong>Theorem 7.11 (Lefschetz Hyperplane Theorem).</strong> Let \(X\) be a smooth projective variety of dimension \(n\) and let \(Y = X \cap H\) be a smooth hyperplane section (i.e., the intersection of \(X\) with a hyperplane in the ambient projective space). Then the restriction map

\[
H^k(X, \mathbb{Z}) \to H^k(Y, \mathbb{Z})
\]
is an isomorphism for \(k < n - 1\) and injective for \(k = n - 1\).
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> There are several approaches. The original topological proof, due to Lefschetz and made rigorous by Andreotti-Frankel, uses Morse theory: if \(f\) is a Morse function on \(X\) with \(Y = f^{-1}(0)\), one shows that \(X\) is obtained from a tubular neighbourhood of \(Y\) by attaching cells of dimension \(\geq n\). This gives the result by cellular homology.

The Hodge-theoretic proof uses the Kodaira vanishing theorem applied to the line bundle \(\mathcal{O}_X(Y)\) and the exact sequence

\[
0 \to \mathcal{O}_X(-Y) \to \mathcal{O}_X \to \mathcal{O}_Y \to 0.
\]
Twisting by \(\Omega^p_X\) and taking cohomology, the vanishing of \(H^q(X, \Omega^p_X(-Y))\) for appropriate ranges of \(p, q\) (from Kodaira-Nakano vanishing) gives the comparison isomorphisms between the cohomology of \(X\) and \(Y\). \(\square\)
</div>

<div class="remark">
<strong>Remark 7.12.</strong> The Lefschetz hyperplane theorem has a dual form (the "weak Lefschetz theorem") relating \(H_k(Y) \to H_k(X)\), and a stronger form due to Bott, valid for homotopy groups: \(\pi_k(Y) \to \pi_k(X)\) is an isomorphism for \(k < n - 1\) and surjective for \(k = n - 1\). The Barth theorem generalises this to arbitrary codimension subvarieties.
</div>

## 7.5 Kodaira-Spencer Deformation Theory (Preview)

Deformation theory studies how the complex structure of a manifold varies in families. It provides the infinitesimal counterpart to the study of moduli spaces.

<div class="definition">
<strong>Definition 7.13 (Deformation of Complex Structure).</strong> A <em>deformation</em> of a compact complex manifold \(X\) is a proper holomorphic submersion \(\pi: \mathcal{X} \to S\) from a complex manifold \(\mathcal{X}\) to a connected complex manifold \(S\) (the <em>parameter space</em>), together with a base point \(0 \in S\), such that the fibre \(\pi^{-1}(0) \cong X\). The family \(\{\mathcal{X}_t = \pi^{-1}(t)\}_{t \in S}\) gives a continuously (indeed, holomorphically) varying family of complex structures on the underlying smooth manifold.
</div>

<div class="theorem">
<strong>Theorem 7.14 (Kodaira-Spencer, 1958).</strong> The infinitesimal deformations of a compact complex manifold \(X\) are parametrised by \(H^1(X, T_X)\), where \(T_X\) is the holomorphic tangent sheaf. The obstruction to extending a first-order deformation to second order lies in \(H^2(X, T_X)\). If \(H^2(X, T_X) = 0\), then \(X\) is <em>unobstructed</em>: every first-order deformation extends to an actual deformation.
</div>

<div class="remark">
<strong>Remark 7.15.</strong> For K3 surfaces, \(H^1(X, T_X) \cong H^1(X, \Omega^1_X)\) (by \(K_X \cong \mathcal{O}_X\) and contracting with the trivialising holomorphic 2-form), which has dimension \(h^{1,1} - 1 = 19\) (using the Hodge diamond from Example 6.12 and the fact that one direction corresponds to scaling the Kahler form). The moduli space of K3 surfaces is thus 20-dimensional (including the direction of the holomorphic 2-form). This moduli space has a beautiful structure as a locally symmetric space, studied via period maps and variations of Hodge structure.
</div>

## 7.6 Hodge Theory in Algebraic Geometry

We briefly indicate how Hodge theory interacts with central questions in algebraic geometry.

<div class="definition">
<strong>Definition 7.16 (Hodge Filtration).</strong> The Hodge decomposition \(H^k(X, \mathbb{C}) = \bigoplus_{p+q=k} H^{p,q}(X)\) defines a decreasing filtration

\[
F^p H^k(X, \mathbb{C}) = \bigoplus_{j \geq p} H^{j, k-j}(X).
\]
This is the <em>Hodge filtration</em>. It satisfies \(F^p \oplus \overline{F^{k-p+1}} = H^k(X, \mathbb{C})\). The pair \((H^k(X, \mathbb{Z}), F^\bullet)\) is called the <em>Hodge structure</em> of weight \(k\) on \(X\).
</div>

<div class="remark">
<strong>Remark 7.17.</strong> The Hodge filtration is more natural than the Hodge decomposition in many ways: it varies holomorphically in families (while the decomposition does not, since complex conjugation varies). This observation is the starting point for the theory of variations of Hodge structure.
</div>

<div class="theorem">
<strong>Theorem 7.18 (Lefschetz (1,1)-Theorem).</strong> Let \(X\) be a compact Kahler manifold. A class \(\alpha \in H^2(X, \mathbb{Z})\) is the first Chern class of a holomorphic line bundle on \(X\) if and only if its image in \(H^2(X, \mathbb{C})\) under the natural map lies in \(H^{1,1}(X)\). That is,

\[
c_1: \mathrm{Pic}(X) \to H^2(X, \mathbb{Z}) \cap H^{1,1}(X)
\]
is surjective.
</div>

<div class="proof">
<strong>Proof.</strong> This follows from the long exact sequence in cohomology associated to the exponential sequence \(0 \to \mathbb{Z} \to \mathcal{O} \xrightarrow{\exp} \mathcal{O}^* \to 0\) (Theorem 3.13). The connecting homomorphism \(c_1: H^1(X, \mathcal{O}^*) \to H^2(X, \mathbb{Z})\) has image equal to the kernel of \(H^2(X, \mathbb{Z}) \to H^2(X, \mathcal{O})\). By the Hodge decomposition and Dolbeault's theorem, \(H^2(X, \mathcal{O}) \cong H^{0,2}(X)\), and the map \(H^2(X, \mathbb{Z}) \to H^{0,2}(X)\) is the projection to the \((0,2)\)-component. A class \(\alpha \in H^2(X, \mathbb{Z})\) maps to zero in \(H^{0,2}(X)\) if and only if its \((0,2)\)-component vanishes, which (combined with the fact that \(\alpha\) is integral, hence real, and Hodge symmetry gives vanishing of the \((2,0)\)-component too) is equivalent to \(\alpha \in H^{1,1}(X)\). \(\square\)
</div>

<div class="remark">
<strong>Remark 7.19.</strong> The Lefschetz (1,1)-theorem is the \(p = 1\) case of the Hodge conjecture (Conjecture 6.22). It is the only case where the Hodge conjecture is fully proved by "soft" methods. For \(p \geq 2\), the problem requires understanding algebraic cycles, which is far deeper.
</div>

## 7.7 Period Domains and Variations of Hodge Structure

We conclude with an introduction to the theory that extends Hodge theory from individual manifolds to families — the theory of variations of Hodge structure, developed by Griffiths in the late 1960s.

<div class="definition">
<strong>Definition 7.20 (Period Domain).</strong> Fix integers \(k, n\) and a lattice \(H_\mathbb{Z} \cong \mathbb{Z}^m\) with a bilinear form \(Q\) (symmetric if \(k\) is even, skew-symmetric if \(k\) is odd). A <em>Hodge structure of weight \(k\)</em> on \(H_\mathbb{Z}\) is a decomposition

\[
H = H_\mathbb{Z} \otimes \mathbb{C} = \bigoplus_{p+q=k} H^{p,q}
\]
with \(H^{q,p} = \overline{H^{p,q}}\) and satisfying the Hodge-Riemann bilinear relations with respect to \(Q\). The <em>period domain</em> \(\mathcal{D}\) is the space of all such Hodge structures with fixed Hodge numbers \(h^{p,q} = \dim H^{p,q}\). It is a complex manifold, typically a homogeneous space for a real Lie group.
</div>

<div class="example">
<strong>Example 7.21 (Elliptic Curves).</strong> For elliptic curves (\(k = 1\), \(n = 1\)), the period domain parametrises Hodge structures on \(H^1 \cong \mathbb{Z}^2 \otimes \mathbb{C} = \mathbb{C}^2\) with \(h^{1,0} = h^{0,1} = 1\). This is the upper half-plane \(\mathfrak{H} = \{\tau \in \mathbb{C} : \mathrm{Im}(\tau) > 0\}\), and the classical theory of elliptic functions is recovered: the period \(\tau\) of an elliptic curve \(\mathbb{C}/(\mathbb{Z} + \mathbb{Z}\tau)\) is a point in \(\mathfrak{H}\).
</div>

<div class="definition">
<strong>Definition 7.22 (Variation of Hodge Structure).</strong> Let \(\pi: \mathcal{X} \to S\) be a smooth proper family of compact Kahler manifolds over a complex manifold \(S\). The <em>variation of Hodge structure</em> (VHS) associated to this family is the data:
<br>(i) The local system \(\mathcal{H}_\mathbb{Z} = R^k\pi_*\mathbb{Z}\) on \(S\), whose fibre over \(t \in S\) is \(H^k(\mathcal{X}_t, \mathbb{Z})\).
<br>(ii) The holomorphic vector bundle \(\mathcal{H} = \mathcal{H}_\mathbb{Z} \otimes \mathcal{O}_S\) with the flat (Gauss-Manin) connection \(\nabla\).
<br>(iii) The Hodge filtration subbundles \(\mathcal{F}^p \subset \mathcal{H}\), which are holomorphic subbundles varying holomorphically in \(t\).
</div>

<div class="theorem">
<strong>Theorem 7.23 (Griffiths Transversality).</strong> The Hodge filtration subbundles satisfy the <em>transversality condition</em>:

\[
\nabla(\mathcal{F}^p) \subseteq \mathcal{F}^{p-1} \otimes \Omega^1_S.
\]
That is, the Gauss-Manin connection shifts the Hodge filtration by at most one step.
</div>

<div class="remark">
<strong>Remark 7.24.</strong> Griffiths transversality is a profound constraint on how Hodge structures can vary in families. It means the period map \(\Phi: S \to \Gamma \backslash \mathcal{D}\) (sending \(t\) to the Hodge structure on \(H^k(\mathcal{X}_t, \mathbb{Z})\)) is not merely holomorphic but satisfies a differential equation. This transversality is the key to Griffiths' theory of period domains and has applications to:
<br>- Torelli-type theorems (recovering a variety from its Hodge structure).
<br>- Constraints on moduli spaces of varieties.
<br>- The study of algebraic cycles via the Abel-Jacobi map.
<br>- Mixed Hodge theory (Deligne's extension to non-smooth and non-compact varieties).
</div>

<div class="remark">
<strong>Remark 7.25.</strong> The theory of mixed Hodge structures, developed by Deligne (1971-1974), extends the Hodge decomposition to singular and non-compact algebraic varieties. Every complex algebraic variety \(X\) (possibly singular, possibly non-compact) carries a functorial mixed Hodge structure on its cohomology, consisting of a weight filtration \(W_\bullet\) (defined over \(\mathbb{Q}\)) and a Hodge filtration \(F^\bullet\) (defined over \(\mathbb{C}\)), satisfying compatibility conditions. This is a far-reaching generalisation that unifies Hodge theory with the theory of mixed motives and has applications throughout algebraic geometry and number theory.
</div>

## 7.8 Concluding Perspective

The journey from holomorphic functions in several variables to Hodge theory and beyond has traced one of the great arcs of twentieth-century mathematics. Beginning with the foundational results of Hartogs, Cartan, and Oka on domains of holomorphy, passing through the sheaf-theoretic revolution of the Cartan seminar, and culminating in Hodge's harmonic analysis and Kodaira's embedding theorem, the theory reveals a profound unity between analysis, algebra, and geometry.

The Hodge decomposition shows that the topology of a Kahler manifold (captured by de Rham cohomology) is intimately constrained by its complex structure (captured by Dolbeault cohomology). The Kodaira vanishing theorem converts geometric positivity into algebraic vanishing, which in turn yields the Kodaira embedding theorem — a complete characterisation of projective manifolds. The Hodge conjecture, still open, asks for the converse direction: whether topological data constrained by the complex structure must always come from algebraic geometry.

These ideas continue to evolve. The theory of variations of Hodge structure leads to period domains and Shimura varieties, connecting complex geometry to number theory. Mixed Hodge theory extends the framework to singular varieties. Non-abelian Hodge theory (the work of Hitchin, Donaldson, Corlette, and Simpson) replaces cohomology with representations of the fundamental group, connecting gauge theory, complex geometry, and representation theory. And the recent work on p-adic Hodge theory by Bhatt, Morrow, and Scholze extends Hodge-theoretic ideas to arithmetic geometry over p-adic fields. The subject remains as vital and generative as ever.
