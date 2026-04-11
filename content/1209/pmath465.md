---
title: "PMATH 465/665: Smooth Manifolds"
prof: "Spiro Karigiannis"
subjects: "PMATH"
---

These notes develop the foundational theory of smooth manifolds — the natural setting for modern differential geometry, geometric analysis, and mathematical physics. The primary reference is John M. Lee's *Introduction to Smooth Manifolds* (2nd edition, Springer GTM 218), with supplementary material drawn from Boothby's *An Introduction to Differentiable Manifolds and Riemannian Geometry*. Topics begin with topological manifolds and smooth structures, proceeding through the calculus of smooth maps, and culminating in the theory of tangent vectors, the tangent bundle, and vector fields with their Lie-algebraic structure.

## Chapter 1: Topological Manifolds and Smooth Structures

### 1.1 Topological Manifolds

The starting point for the theory of smooth manifolds is the purely topological notion of a space that "locally looks like Euclidean space." The idea is simple and powerful: while a manifold may have complicated global topology (the sphere, the torus, projective space), every sufficiently small piece of it is indistinguishable from an open subset of \(\mathbb{R}^n\). This local Euclidean character is what allows us to do calculus on manifolds, by transferring problems to \(\mathbb{R}^n\) via coordinate charts. Before we can discuss smoothness, however, we must pin down the correct topological hypotheses.

<div class="definition">
<strong>Definition 1.1 (Topological Manifold).</strong> A <strong>topological \(n\)-manifold</strong> is a topological space \(M\) satisfying the following three properties:
<ol>
<li>\(M\) is <strong>Hausdorff</strong>: for every pair of distinct points \(p, q \in M\), there exist disjoint open sets \(U \ni p\) and \(V \ni q\).</li>
<li>\(M\) is <strong>second countable</strong>: there exists a countable basis for the topology of \(M\).</li>
<li>\(M\) is <strong>locally Euclidean of dimension \(n\)</strong>: every point \(p \in M\) has a neighbourhood \(U\) that is homeomorphic to an open subset of \(\mathbb{R}^n\).</li>
</ol>
</div>

![A topological manifold shown as a curved surface with an open neighbourhood U around a point p, mapped homeomorphically to an open subset of R^n](/pics/pmath465/topological-manifold-local-euclidean.svg)

Each of these three conditions plays an essential role and deserves comment.

The Hausdorff condition excludes pathological examples such as the "line with two origins," obtained by taking two copies of \(\mathbb{R}\) and identifying all points except the origin. The resulting space is locally Euclidean and second countable, but the two origins cannot be separated by disjoint open sets. Without the Hausdorff condition, many basic results of analysis and geometry would fail.

![The line with two origins: two copies of R glued everywhere except at 0, producing a non-Hausdorff space](/pics/pmath465/line-with-two-origins.svg)

Second countability ensures that the topology of \(M\) is not too large. It guarantees the existence of partitions of unity (which we discuss in Chapter 2), the embeddability of \(M\) into Euclidean space (by the Whitney embedding theorem), and the existence of Riemannian metrics. It also implies that \(M\) is paracompact and has at most countably many connected components.

The locally Euclidean condition is the heart of the definition. The integer \(n\) is called the **dimension** of \(M\). By the theorem on invariance of domain (a deep result in algebraic topology), if a nonempty topological space is locally homeomorphic to both \(\mathbb{R}^m\) and \(\mathbb{R}^n\), then \(m = n\), so the dimension is well-defined on each connected component.

### 1.2 Coordinate Charts and Atlases

The homeomorphisms witnessing the locally Euclidean property are the fundamental tools that allow us to transfer calculus from \(\mathbb{R}^n\) to a manifold. We formalize them as follows.

<div class="definition">
<strong>Definition 1.2 (Coordinate Chart).</strong> Let \(M\) be a topological \(n\)-manifold. A <strong>coordinate chart</strong> (or simply a <strong>chart</strong>) on \(M\) is a pair \((U, \varphi)\) where \(U \subseteq M\) is open and \(\varphi \colon U \to \hat{U} \subseteq \mathbb{R}^n\) is a homeomorphism onto an open subset \(\hat{U}\) of \(\mathbb{R}^n\). The set \(U\) is called a <strong>coordinate domain</strong> (or <strong>coordinate neighbourhood</strong>), and the component functions \(x^1, \ldots, x^n\) of \(\varphi = (x^1, \ldots, x^n)\) are called <strong>local coordinates</strong> on \(U\).
</div>

Given a point \(p \in U\), the coordinates of \(p\) are the \(n\) real numbers \((x^1(p), \ldots, x^n(p)) \in \mathbb{R}^n\). A chart \((U, \varphi)\) is said to be **centred at \(p\)** if \(\varphi(p) = 0\).

When two charts overlap, we need to understand how their coordinate systems are related. This leads to the notion of transition maps.

<div class="definition">
<strong>Definition 1.3 (Transition Map).</strong> If \((U, \varphi)\) and \((V, \psi)\) are two charts on \(M\) with \(U \cap V \neq \emptyset\), the <strong>transition map</strong> from \(\varphi\) to \(\psi\) is the map
\[
\psi \circ \varphi^{-1} \colon \varphi(U \cap V) \to \psi(U \cap V).
\]
This is a homeomorphism between open subsets of \(\mathbb{R}^n\).
</div>

Transition maps are the key to defining smoothness on manifolds. Since \(\psi \circ \varphi^{-1}\) is a map between open subsets of \(\mathbb{R}^n\), it makes sense to ask whether it is smooth (\(C^\infty\)) in the ordinary multivariable calculus sense.

![Chart transition maps on a manifold: two overlapping coordinate charts map to copies of R^n, connected by the transition map](/pics/pmath465/chart-transition.svg)

<div class="definition">
<strong>Definition 1.4 (Smoothly Compatible Charts).</strong> Two charts \((U, \varphi)\) and \((V, \psi)\) on a topological manifold \(M\) are <strong>smoothly compatible</strong> if either \(U \cap V = \emptyset\) or the transition map \(\psi \circ \varphi^{-1}\) and its inverse \(\varphi \circ \psi^{-1}\) are both smooth (i.e., \(C^\infty\)) maps between open subsets of \(\mathbb{R}^n\).
</div>

<div class="definition">
<strong>Definition 1.5 (Smooth Atlas).</strong> A <strong>smooth atlas</strong> on a topological \(n\)-manifold \(M\) is a collection \(\mathcal{A} = \{(U_\alpha, \varphi_\alpha)\}_{\alpha \in A}\) of charts such that:
<ol>
<li>The coordinate domains cover \(M\): \(\bigcup_{\alpha \in A} U_\alpha = M\).</li>
<li>Any two charts in \(\mathcal{A}\) are smoothly compatible.</li>
</ol>
</div>

### 1.3 Smooth Structures and Smooth Manifolds

A smooth atlas provides enough structure to do calculus, but there is an aesthetic and technical issue: many different atlases can give rise to the "same" smooth structure. Two atlases \(\mathcal{A}\) and \(\mathcal{B}\) on \(M\) are said to be **compatible** if their union \(\mathcal{A} \cup \mathcal{B}\) is again a smooth atlas. Compatibility is an equivalence relation on the set of all smooth atlases on \(M\). Rather than working with equivalence classes, it is more convenient to single out a canonical representative.

<div class="definition">
<strong>Definition 1.6 (Smooth Structure).</strong> A <strong>smooth structure</strong> on a topological manifold \(M\) is a smooth atlas \(\mathcal{A}\) that is <strong>maximal</strong>: if \((U, \varphi)\) is any chart that is smoothly compatible with every chart in \(\mathcal{A}\), then \((U, \varphi) \in \mathcal{A}\).
</div>

Every smooth atlas \(\mathcal{A}\) is contained in a unique maximal atlas — simply take the collection of all charts on \(M\) that are smoothly compatible with every chart in \(\mathcal{A}\). Thus, specifying a smooth structure is equivalent to specifying any smooth atlas; the maximal atlas it generates is the smooth structure.

<div class="definition">
<strong>Definition 1.7 (Smooth Manifold).</strong> A <strong>smooth \(n\)-manifold</strong> is a pair \((M, \mathcal{A})\) where \(M\) is a topological \(n\)-manifold and \(\mathcal{A}\) is a smooth structure on \(M\). When the smooth structure is understood from context, we simply say that \(M\) is a smooth manifold.
</div>

In practice, one almost never works with the full maximal atlas. Instead, one specifies a small atlas (often just two or three charts) and declares that the smooth structure is the one generated by that atlas. The key point is that the maximal atlas exists and is unique, so there is no ambiguity.

<div class="remark">
<strong>Remark.</strong> One can also define \(C^k\)-manifolds for any \(k \geq 1\) by requiring the transition maps to be \(C^k\). However, a deep theorem of Whitney shows that every \(C^1\)-manifold admits a compatible \(C^\infty\)-structure, and any two compatible \(C^\infty\)-structures are diffeomorphic. For this reason, we work exclusively in the \(C^\infty\) category throughout these notes. The term "smooth" always means \(C^\infty\).
</div>

### 1.4 Examples of Smooth Manifolds

We now present the most important examples of smooth manifolds. These examples will serve as a testing ground for all the theory that follows.

<div class="example">
<strong>Example 1.8 (Euclidean space \(\mathbb{R}^n\)).</strong> The space \(\mathbb{R}^n\) with its standard topology is a topological \(n\)-manifold. The single chart \((\mathbb{R}^n, \mathrm{id}_{\mathbb{R}^n})\) constitutes a smooth atlas (there are no nontrivial transition maps to check). The smooth structure generated by this atlas is the <strong>standard smooth structure</strong> on \(\mathbb{R}^n\). More generally, any open subset \(U \subseteq \mathbb{R}^n\) inherits a smooth structure from a single chart \((U, \mathrm{id}_U)\).
</div>

<div class="example">
<strong>Example 1.9 (The \(n\)-sphere \(S^n\)).</strong> The unit sphere
\[
S^n = \{x \in \mathbb{R}^{n+1} : |x|^2 = (x^1)^2 + \cdots + (x^{n+1})^2 = 1\}
\]
is a topological \(n\)-manifold in the subspace topology inherited from \(\mathbb{R}^{n+1}\). It is Hausdorff and second countable because \(\mathbb{R}^{n+1}\) is. To show it is locally Euclidean and to exhibit a smooth atlas, we use <strong>stereographic projection</strong>.

Let \(N = (0, \ldots, 0, 1)\) and \(S = (0, \ldots, 0, -1)\) denote the north and south poles of \(S^n\). Define

\[
U_N = S^n \setminus \{N\}, \qquad U_S = S^n \setminus \{S\}.
\]
![Chart domains for stereographic projection on S^n: U_N = S^n minus the north pole and U_S = S^n minus the south pole](/pics/pmath465/sphere-chart-domains.svg)

The <strong>stereographic projection from the north pole</strong> is the map \(\sigma_N \colon U_N \to \mathbb{R}^n\) defined by

\[
\sigma_N(x^1, \ldots, x^{n+1}) = \frac{1}{1 - x^{n+1}}(x^1, \ldots, x^n).
\]
Geometrically, \(\sigma_N(x)\) is the point where the line from \(N\) through \(x\) meets the equatorial hyperplane \(\{x^{n+1} = 0\}\).

![Stereographic projection: a line from the north pole N through a point P on the sphere meets the equatorial plane at σ(P)](/pics/pmath465/stereographic-projection.svg) Similarly, the <strong>stereographic projection from the south pole</strong> is \(\sigma_S \colon U_S \to \mathbb{R}^n\) defined by

\[
\sigma_S(x^1, \ldots, x^{n+1}) = \frac{1}{1 + x^{n+1}}(x^1, \ldots, x^n).
\]
Both maps are homeomorphisms onto \(\mathbb{R}^n\), so \(\{(U_N, \sigma_N), (U_S, \sigma_S)\}\) is an atlas for \(S^n\).
</div>

The transition map for the stereographic atlas is a central computation that we carry out in full detail, since it illustrates the general technique and will be useful later.

<div class="proposition">
<strong>Proposition 1.10 (Transition Map for Stereographic Projection).</strong> On the overlap \(U_N \cap U_S = S^n \setminus \{N, S\}\), the transition map \(\sigma_S \circ \sigma_N^{-1} \colon \mathbb{R}^n \setminus \{0\} \to \mathbb{R}^n \setminus \{0\}\) is given by
\[
\sigma_S \circ \sigma_N^{-1}(u) = \frac{u}{|u|^2},
\]
which is the <strong>inversion in the unit sphere</strong> in \(\mathbb{R}^n\).
</div>

<div class="proof">
<strong>Proof.</strong> We first compute \(\sigma_N^{-1}\). Given \(u = (u^1, \ldots, u^n) \in \mathbb{R}^n\), we need to find \(x = (x^1, \ldots, x^{n+1}) \in S^n \setminus \{N\}\) such that
\[
u^i = \frac{x^i}{1 - x^{n+1}}, \qquad i = 1, \ldots, n.
\]
So \(x^i = u^i(1 - x^{n+1})\). From the constraint \(|x|^2 = 1\), we get

\[
\sum_{i=1}^n (u^i)^2 (1 - x^{n+1})^2 + (x^{n+1})^2 = 1.
\]
Setting \(|u|^2 = \sum (u^i)^2\) and \(t = x^{n+1}\), this gives \(|u|^2(1-t)^2 + t^2 = 1\). Expanding:

\[
|u|^2 - 2|u|^2 t + |u|^2 t^2 + t^2 = 1,
\]
\[
(|u|^2 + 1)t^2 - 2|u|^2 t + (|u|^2 - 1) = 0.
\]
Using the quadratic formula (or factoring):

\[
t = \frac{2|u|^2 \pm \sqrt{4|u|^4 - 4(|u|^2+1)(|u|^2-1)}}{2(|u|^2+1)} = \frac{2|u|^2 \pm 2}{2(|u|^2+1)}.
\]
The solution \(t = 1\) corresponds to the north pole, which we exclude. So

\[
x^{n+1} = t = \frac{|u|^2 - 1}{|u|^2 + 1}, \qquad 1 - t = \frac{2}{|u|^2 + 1},
\]
and therefore

\[
x^i = u^i \cdot \frac{2}{|u|^2 + 1}.
\]
The inverse is thus

\[
\sigma_N^{-1}(u) = \frac{1}{|u|^2 + 1}\left(2u^1, \ldots, 2u^n, |u|^2 - 1\right).
\]
Now we apply \(\sigma_S\):

\[
\sigma_S(\sigma_N^{-1}(u)) = \frac{1}{1 + x^{n+1}}(x^1, \ldots, x^n) = \frac{1}{1 + \frac{|u|^2 - 1}{|u|^2 + 1}} \cdot \frac{2u}{|u|^2 + 1}.
\]
We have

\[
1 + \frac{|u|^2 - 1}{|u|^2 + 1} = \frac{|u|^2 + 1 + |u|^2 - 1}{|u|^2 + 1} = \frac{2|u|^2}{|u|^2 + 1}.
\]
Therefore

\[
\sigma_S \circ \sigma_N^{-1}(u) = \frac{|u|^2 + 1}{2|u|^2} \cdot \frac{2u}{|u|^2 + 1} = \frac{u}{|u|^2}.
\]
This is a smooth map on \(\mathbb{R}^n \setminus \{0\}\), and it is its own inverse (applying the formula twice gives back \(u\)). Hence both transition maps are smooth, and the stereographic atlas defines a smooth structure on \(S^n\). \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark.</strong> The map \(u \mapsto u/|u|^2\) is known as the <strong>Kelvin transform</strong> or <strong>inversion in the unit sphere</strong>. It is a conformal diffeomorphism of \(\mathbb{R}^n \setminus \{0\}\) and plays an important role in conformal geometry and potential theory. The fact that the stereographic transition map is an inversion is no accident — it reflects the conformal nature of stereographic projection.
</div>

<div class="example">
<strong>Example 1.11 (Real Projective Space \(\mathbb{R}P^n\)).</strong> The <strong>real projective space</strong> \(\mathbb{R}P^n\) is the set of all one-dimensional linear subspaces (lines through the origin) of \(\mathbb{R}^{n+1}\). Equivalently, it is the quotient space
\[
\mathbb{R}P^n = ({\mathbb{R}^{n+1} \setminus \{0\}})/{\sim},
\]
where \(x \sim y\) if and only if \(x = \lambda y\) for some \(\lambda \in \mathbb{R} \setminus \{0\}\). The equivalence class of a point \((x^0, x^1, \ldots, x^n)\) is denoted \([x^0 : x^1 : \cdots : x^n]\) and called <strong>homogeneous coordinates</strong>.

For each \(i = 0, 1, \ldots, n\), let \(U_i = \{[x^0 : \cdots : x^n] \in \mathbb{R}P^n : x^i \neq 0\}\). Define \(\varphi_i \colon U_i \to \mathbb{R}^n\) by

\[
\varphi_i([x^0 : \cdots : x^n]) = \left(\frac{x^0}{x^i}, \ldots, \widehat{\frac{x^i}{x^i}}, \ldots, \frac{x^n}{x^i}\right),
\]
where the hat means that the \(i\)-th entry is omitted. The sets \(U_0, \ldots, U_n\) cover \(\mathbb{R}P^n\), each \(\varphi_i\) is a homeomorphism, and the transition maps are smooth rational functions. Thus \(\mathbb{R}P^n\) is a smooth \(n\)-manifold. Note that \(\mathbb{R}P^n\) is compact (it is the continuous image of \(S^n\) under the quotient map).
</div>

<div class="example">
<strong>Example 1.12 (Product Manifolds).</strong> If \(M\) is a smooth \(m\)-manifold and \(N\) is a smooth \(n\)-manifold, their product \(M \times N\) is naturally a smooth \((m+n)\)-manifold. The product topology makes \(M \times N\) Hausdorff and second countable. If \(\{(U_\alpha, \varphi_\alpha)\}\) is an atlas for \(M\) and \(\{(V_\beta, \psi_\beta)\}\) is an atlas for \(N\), then
\[
\{(U_\alpha \times V_\beta,\; \varphi_\alpha \times \psi_\beta)\}
\]
is a smooth atlas for \(M \times N\), where \((\varphi_\alpha \times \psi_\beta)(p, q) = (\varphi_\alpha(p), \psi_\beta(q))\). The transition maps are products of the individual transition maps and hence smooth.
</div>

<div class="example">
<strong>Example 1.13 (Tori).</strong> The <strong>\(n\)-torus</strong> is the product manifold
\[
T^n = \underbrace{S^1 \times S^1 \times \cdots \times S^1}_{n \text{ copies}}.
\]
It is a compact smooth \(n\)-manifold. The \(2\)-torus \(T^2 = S^1 \times S^1\) is the familiar "doughnut" surface that can be embedded in \(\mathbb{R}^3\).
</div>

The next class of examples is among the most important in all of mathematics and physics.

<div class="example">
<strong>Example 1.14 (Lie Groups as Manifolds).</strong> A <strong>Lie group</strong> is a smooth manifold \(G\) that is simultaneously a group, with the property that the multiplication map \(\mu \colon G \times G \to G\), \((g,h) \mapsto gh\), and the inversion map \(\iota \colon G \to G\), \(g \mapsto g^{-1}\), are both smooth. Every Lie group is, in particular, a smooth manifold.

Important examples include:
<ul>
<li>\(\mathrm{GL}(n, \mathbb{R})\): the general linear group of invertible \(n \times n\) real matrices. This is an open subset of \(\mathbb{R}^{n^2}\) (where the determinant is nonzero), hence a smooth manifold of dimension \(n^2\).</li>
<li>\(\mathrm{GL}(n, \mathbb{C})\): the general linear group of invertible \(n \times n\) complex matrices, a smooth manifold of dimension \(2n^2\).</li>
<li>\(\mathrm{O}(n)\): the orthogonal group \(\{A \in \mathrm{GL}(n, \mathbb{R}) : A^T A = I\}\), a smooth manifold of dimension \(n(n-1)/2\).</li>
<li>\(\mathrm{SO}(n) = \{A \in \mathrm{O}(n) : \det A = 1\}\): the special orthogonal group, the connected component of the identity in \(\mathrm{O}(n)\).</li>
<li>\(\mathrm{U}(n)\): the unitary group \(\{A \in \mathrm{GL}(n, \mathbb{C}) : A^* A = I\}\), dimension \(n^2\).</li>
<li>\(\mathrm{SU}(n) = \{A \in \mathrm{U}(n) : \det A = 1\}\): the special unitary group, dimension \(n^2 - 1\).</li>
</ul>
We will return to Lie groups in Chapter 4, where their interplay with Lie algebras becomes central.
</div>

### 1.5 Exotic Smooth Structures

A natural question arises: can a given topological manifold admit more than one smooth structure? The answer, surprisingly, is yes, and this phenomenon has deep implications.

<div class="remark">
<strong>Remark (Exotic Spheres).</strong> In a groundbreaking 1956 paper, John Milnor showed that the topological manifold \(S^7\) admits smooth structures that are <strong>not</strong> diffeomorphic to the standard one. He exhibited 28 distinct smooth structures on \(S^7\). These are called <strong>exotic spheres</strong>. More generally, Kervaire and Milnor classified exotic structures on spheres of various dimensions. In dimension 4, the situation is even more dramatic: by work of Donaldson and Freedman in the 1980s, \(\mathbb{R}^4\) admits uncountably many pairwise non-diffeomorphic smooth structures (so-called "exotic \(\mathbb{R}^4\)'s"), while \(\mathbb{R}^n\) for \(n \neq 4\) admits a unique smooth structure up to diffeomorphism. Whether \(S^4\) admits an exotic smooth structure is the still-open <strong>smooth Poincaré conjecture in dimension 4</strong>.
</div>

### 1.6 Manifolds with Boundary

For many applications — particularly in integration theory and Stokes' theorem — it is necessary to consider manifolds that have edges. The model for such spaces is the **upper half-space**.

<div class="definition">
<strong>Definition 1.15 (Upper Half-Space).</strong> The <strong>upper half-space</strong> of \(\mathbb{R}^n\) is
\[
\mathbb{H}^n = \{(x^1, \ldots, x^n) \in \mathbb{R}^n : x^n \geq 0\}.
\]
Its <strong>boundary</strong> is \(\partial \mathbb{H}^n = \{x \in \mathbb{R}^n : x^n = 0\} \cong \mathbb{R}^{n-1}\), and its <strong>interior</strong> is \(\mathrm{Int}(\mathbb{H}^n) = \{x \in \mathbb{R}^n : x^n > 0\}\).
</div>

<div class="definition">
<strong>Definition 1.16 (Smooth Manifold with Boundary).</strong> A <strong>topological \(n\)-manifold with boundary</strong> is a Hausdorff, second countable topological space \(M\) in which every point has a neighbourhood homeomorphic to an open subset of either \(\mathbb{R}^n\) or \(\mathbb{H}^n\). A point \(p \in M\) is a <strong>boundary point</strong> if it is mapped to \(\partial \mathbb{H}^n\) under some (hence every) chart, and an <strong>interior point</strong> otherwise. The set of all boundary points is denoted \(\partial M\).

A smooth structure on \(M\) is defined exactly as before, using charts taking values in open subsets of \(\mathbb{H}^n\) and requiring smooth compatibility. A manifold with boundary together with a smooth structure is a <strong>smooth manifold with boundary</strong>.
</div>

<div class="proposition">
<strong>Proposition 1.17.</strong> If \(M\) is a smooth \(n\)-manifold with boundary, then \(\partial M\) is a smooth \((n-1)\)-manifold (without boundary), and \(\mathrm{Int}(M) = M \setminus \partial M\) is a smooth \(n\)-manifold without boundary.
</div>

<div class="example">
<strong>Example 1.18.</strong> The closed unit ball \(\overline{B}^n = \{x \in \mathbb{R}^n : |x| \leq 1\}\) is a smooth \(n\)-manifold with boundary \(\partial \overline{B}^n = S^{n-1}\). The half-space \(\mathbb{H}^n\) itself is a smooth manifold with boundary \(\partial \mathbb{H}^n \cong \mathbb{R}^{n-1}\).
</div>

![A manifold with boundary: interior points have neighbourhoods homeomorphic to R^n, while boundary points have neighbourhoods homeomorphic to the upper half-space H^n](/pics/pmath465/manifold-with-boundary.svg)

## Chapter 2: Smooth Maps and Partitions of Unity

### 2.1 Smooth Functions on Manifolds

Having established the notion of a smooth manifold, we now develop the theory of smooth maps between manifolds. The key idea is simple: a map between manifolds is smooth if and only if its local coordinate representations (obtained via charts) are smooth maps between open subsets of Euclidean space. This is precisely why we needed the transition maps to be smooth — it ensures that the notion of smoothness does not depend on the choice of charts.

<div class="definition">
<strong>Definition 2.1 (Smooth Function).</strong> Let \(M\) be a smooth \(n\)-manifold. A function \(f \colon M \to \mathbb{R}\) is <strong>smooth</strong> (or \(C^\infty\)) if for every point \(p \in M\) and every smooth chart \((U, \varphi)\) with \(p \in U\), the composite
\[
f \circ \varphi^{-1} \colon \varphi(U) \to \mathbb{R}
\]
is a smooth function on the open set \(\varphi(U) \subseteq \mathbb{R}^n\).
</div>

The function \(f \circ \varphi^{-1}\) is called the <strong>coordinate representation</strong> of \(f\) in the chart \((U, \varphi)\). We write \(\hat{f} = f \circ \varphi^{-1}\) when the chart is understood. Note that if the condition holds for one chart at \(p\), it holds for every chart at \(p\), because for any other chart \((V, \psi)\) with \(p \in V\), we have

\[
f \circ \psi^{-1} = (f \circ \varphi^{-1}) \circ (\varphi \circ \psi^{-1}),
\]
and this is a composition of smooth maps (since \(\varphi \circ \psi^{-1}\) is a smooth transition map).

<div class="definition">
<strong>Definition 2.2.</strong> The set of all smooth functions \(f \colon M \to \mathbb{R}\) is denoted \(C^\infty(M)\). It is a commutative \(\mathbb{R}\)-algebra under pointwise addition, scalar multiplication, and pointwise multiplication.
</div>

The algebra \(C^\infty(M)\) is a fundamental invariant of the smooth manifold \(M\). In fact, two smooth manifolds \(M\) and \(N\) are diffeomorphic if and only if \(C^\infty(M)\) and \(C^\infty(N)\) are isomorphic as \(\mathbb{R}\)-algebras (this is a consequence of Milnor's exercise; see Lee, Problem 2-2).

### 2.2 Smooth Maps Between Manifolds

We now extend the notion of smoothness from functions to maps between manifolds.

<div class="definition">
<strong>Definition 2.3 (Smooth Map).</strong> Let \(M\) and \(N\) be smooth manifolds of dimensions \(m\) and \(n\), respectively. A continuous map \(F \colon M \to N\) is <strong>smooth</strong> if for every \(p \in M\), there exist charts \((U, \varphi)\) for \(M\) with \(p \in U\) and \((V, \psi)\) for \(N\) with \(F(p) \in V\) such that \(F(U) \subseteq V\) and the <strong>coordinate representation</strong>
\[
\hat{F} = \psi \circ F \circ \varphi^{-1} \colon \varphi(U) \to \psi(V)
\]
is a smooth map between open subsets of Euclidean spaces.
</div>

Again, the smoothness of transition maps ensures that if this condition holds for one pair of charts, it holds for every pair. The set of smooth maps from \(M\) to \(N\) is denoted \(C^\infty(M, N)\).

<div class="proposition">
<strong>Proposition 2.4 (Composition of Smooth Maps).</strong> If \(F \colon M \to N\) and \(G \colon N \to P\) are smooth maps between smooth manifolds, then the composition \(G \circ F \colon M \to P\) is smooth. The identity map \(\mathrm{id}_M \colon M \to M\) is smooth.
</div>

<div class="proof">
<strong>Proof.</strong> Let \(p \in M\) and choose charts \((U, \varphi)\) around \(p\), \((V, \psi)\) around \(F(p)\), and \((W, \theta)\) around \(G(F(p))\) with \(F(U) \subseteq V\) and \(G(V) \subseteq W\). Then
\[
\theta \circ (G \circ F) \circ \varphi^{-1} = (\theta \circ G \circ \psi^{-1}) \circ (\psi \circ F \circ \varphi^{-1})
\]
is a composition of smooth maps between open subsets of Euclidean spaces, hence smooth. The identity map is smooth because its coordinate representation in any chart is the identity. \(\blacksquare\)
</div>

Thus smooth manifolds and smooth maps form a category, the **smooth category**, often denoted \(\mathbf{Man}^\infty\) or \(\mathbf{Diff}\). The isomorphisms in this category are diffeomorphisms.

<div class="definition">
<strong>Definition 2.5 (Diffeomorphism).</strong> A smooth map \(F \colon M \to N\) is a <strong>diffeomorphism</strong> if it is a bijection and its inverse \(F^{-1} \colon N \to M\) is also smooth. Two smooth manifolds are <strong>diffeomorphic</strong> if there exists a diffeomorphism between them.
</div>

Diffeomorphism is the natural notion of equivalence in the smooth category. The central question of differential topology is to classify smooth manifolds up to diffeomorphism.

<div class="remark">
<strong>Remark.</strong> A smooth bijection need not be a diffeomorphism: the map \(t \mapsto t^3\) from \(\mathbb{R}\) to \(\mathbb{R}\) is a smooth bijection, but its inverse \(t \mapsto t^{1/3}\) is not smooth at \(t = 0\). This contrasts with the situation in topology, where a continuous bijection from a compact space to a Hausdorff space is automatically a homeomorphism.
</div>

### 2.3 Bump Functions and Cutoff Functions

Before discussing partitions of unity, we need to establish the existence of smooth functions with special localization properties. These are possible because, unlike analytic functions, smooth functions can have compact support.

<div class="definition">
<strong>Definition 2.6 (Support).</strong> The <strong>support</strong> of a function \(f \colon M \to \mathbb{R}\) is
\[
\mathrm{supp}(f) = \overline{\{p \in M : f(p) \neq 0\}},
\]
the closure of the set where \(f\) is nonzero.
</div>

The fundamental building block is the following function on \(\mathbb{R}\).

<div class="lemma">
<strong>Lemma 2.7.</strong> The function \(h \colon \mathbb{R} \to \mathbb{R}\) defined by
\[
h(t) = \begin{cases} e^{-1/t} & \text{if } t > 0, \\ 0 & \text{if } t \leq 0, \end{cases}
\]
is smooth on all of \(\mathbb{R}\).
</div>

<div class="proof">
<strong>Proof.</strong> The function is clearly smooth on \((-\infty, 0)\) and on \((0, \infty)\). At \(t = 0\), smoothness requires that all right-hand derivatives equal zero. One shows by induction that for \(t > 0\), the \(k\)-th derivative of \(h\) has the form \(p_k(1/t) \cdot e^{-1/t}\) where \(p_k\) is a polynomial. Since \(e^{-1/t}\) decays faster than any polynomial in \(1/t\) as \(t \to 0^+\), we have \(h^{(k)}(t) \to 0\) as \(t \to 0^+\) for all \(k\), which matches the value of the \(k\)-th derivative of the constant function \(0\) from the left. \(\blacksquare\)
</div>

From this, we can construct smooth functions with prescribed support.

<div class="proposition">
<strong>Proposition 2.8 (Smooth Bump Function).</strong> For any \(p \in M\) and any open neighbourhood \(U\) of \(p\), there exists a smooth function \(\psi \colon M \to [0,1]\) such that \(\psi(p) = 1\) and \(\mathrm{supp}(\psi) \subseteq U\). Such a function is called a <strong>bump function</strong> supported in \(U\).
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> Using the function \(h\) from Lemma 2.7, one constructs a smooth function \(H \colon \mathbb{R}^n \to [0,1]\) that equals \(1\) on the ball \(\overline{B}_r(0)\) and equals \(0\) outside \(\overline{B}_R(0)\) for any \(0 < r < R\). Transporting this to \(M\) via a coordinate chart centred at \(p\) and extending by zero outside the coordinate domain gives the desired bump function. \(\blacksquare\)
</div>

<div class="proposition">
<strong>Proposition 2.9 (Smooth Cutoff Function).</strong> For any closed set \(A \subseteq M\) and any open set \(U \supseteq A\), there exists a smooth function \(f \colon M \to [0,1]\) such that \(f \equiv 1\) on \(A\) and \(\mathrm{supp}(f) \subseteq U\).
</div>

![Graph of a bump function: a smooth function equal to 1 near the origin and smoothly decaying to 0 outside a compact set](/pics/pmath465/bump-function-graph.svg)

![A bump function on a manifold: supported in a coordinate neighbourhood U around a point p](/pics/pmath465/bump-function-manifold.svg)

Bump functions and cutoff functions are essential tools for transferring local constructions to global ones. They will be used repeatedly throughout the course, most immediately in the construction of partitions of unity.

### 2.4 Partitions of Unity

Partitions of unity are the primary technical tool for passing from local to global constructions on manifolds. Many objects — Riemannian metrics, differential forms, connections — are easy to define locally in coordinates, but assembling them into a globally defined, smooth object requires a way to "glue" using smooth weights. This is precisely what partitions of unity provide.

<div class="definition">
<strong>Definition 2.10 (Partition of Unity).</strong> Let \(M\) be a smooth manifold and \(\{U_\alpha\}_{\alpha \in A}\) an open cover of \(M\). A <strong>partition of unity subordinate to \(\{U_\alpha\}\)</strong> is a collection of smooth functions \(\{\psi_\alpha \colon M \to [0,1]\}_{\alpha \in A}\) such that:
<ol>
<li>\(\mathrm{supp}(\psi_\alpha) \subseteq U_\alpha\) for each \(\alpha\).</li>
<li>The collection \(\{\mathrm{supp}(\psi_\alpha)\}\) is <strong>locally finite</strong>: every point of \(M\) has a neighbourhood that intersects only finitely many of the supports.</li>
<li>\(\sum_{\alpha \in A} \psi_\alpha(p) = 1\) for every \(p \in M\). (This sum is well-defined because of local finiteness.)</li>
</ol>
</div>

![Partition of unity: smooth functions ψ_α subordinate to an open cover, summing to 1 at every point](/pics/pmath465/partition-of-unity.svg)

The existence of partitions of unity on smooth manifolds is one of the most important facts in the subject, and it is here that the Hausdorff and second countable conditions in the definition of a manifold earn their keep.

<div class="theorem">
<strong>Theorem 2.11 (Existence of Partitions of Unity).</strong> Let \(M\) be a smooth manifold and \(\{U_\alpha\}_{\alpha \in A}\) any open cover of \(M\). Then there exists a partition of unity subordinate to \(\{U_\alpha\}\).
</div>

<div class="proof">
<strong>Proof (Sketch of Key Ideas).</strong> The proof proceeds in several steps.

<strong>Step 1: Paracompactness.</strong> Since \(M\) is second countable and locally compact Hausdorff, it is paracompact: every open cover has a locally finite refinement. In fact, \(M\) admits a countable, locally finite refinement by precompact open sets (sets whose closures are compact).

<strong>Step 2: Subordinate bump functions.</strong> For each set in the locally finite refinement, we use bump functions (Proposition 2.8) to construct a smooth function supported in that set. More precisely, for each element \(V_i\) of the refinement (with \(V_i \subseteq U_{\alpha(i)}\) for some \(\alpha(i)\)), we can find a smooth function \(\rho_i \geq 0\) with \(\mathrm{supp}(\rho_i) \subseteq V_i\) and \(\rho_i > 0\) on some neighbourhood of a carefully chosen compact subset.

<strong>Step 3: Normalization.</strong> The function \(\rho = \sum_i \rho_i\) is well-defined and smooth (by local finiteness) and everywhere positive (since every point of \(M\) is in the support of some \(\rho_i\)). Setting \(\psi_\alpha = \sum_{i : \alpha(i) = \alpha} \rho_i / \rho\) gives the desired partition of unity. \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark.</strong> The Hausdorff condition is used to ensure that compact subsets are closed, which is needed for the bump function constructions. Second countability provides the countable locally finite refinement. Without both conditions, partitions of unity may not exist, and many fundamental results in differential geometry would fail.
</div>

### 2.5 Applications of Partitions of Unity

Partitions of unity have numerous applications. We mention several of the most important.

<div class="proposition">
<strong>Proposition 2.12 (Extension of Smooth Functions).</strong> Let \(A \subseteq M\) be a closed subset and \(U \supseteq A\) an open neighbourhood. If \(f \colon U \to \mathbb{R}\) is a smooth function, there exists a smooth function \(\tilde{f} \colon M \to \mathbb{R}\) that agrees with \(f\) on a neighbourhood of \(A\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(\psi\) be a smooth cutoff function with \(\psi \equiv 1\) on a neighbourhood of \(A\) and \(\mathrm{supp}(\psi) \subseteq U\) (Proposition 2.9). Define \(\tilde{f} = \psi \cdot f\) on \(U\) and \(\tilde{f} = 0\) on \(M \setminus \mathrm{supp}(\psi)\). On the overlap \(U \setminus \mathrm{supp}(\psi)\), both definitions give zero, so \(\tilde{f}\) is well-defined and smooth on all of \(M\). \(\blacksquare\)
</div>

<div class="proposition">
<strong>Proposition 2.13 (Existence of Riemannian Metrics).</strong> Every smooth manifold admits a Riemannian metric.
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> In each coordinate chart \((U_\alpha, \varphi_\alpha)\), the Euclidean inner product on \(\mathbb{R}^n\) pulls back to a local Riemannian metric \(g_\alpha\) on \(U_\alpha\). Let \(\{\psi_\alpha\}\) be a partition of unity subordinate to \(\{U_\alpha\}\). Then \(g = \sum_\alpha \psi_\alpha \, g_\alpha\) is a globally defined Riemannian metric on \(M\). (The sum is locally finite and each term is a smooth, nonnegative-definite symmetric \(2\)-tensor; the result is positive-definite because at each point at least one \(\psi_\alpha > 0\).) \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark.</strong> The argument for Riemannian metrics is prototypical of "partition-of-unity" arguments: define something locally in each chart, then glue using a partition of unity. This technique works whenever the local objects form a convex set (as positive-definite inner products do). It does <em>not</em> work for objects that are not convex — for example, one cannot always glue local complex structures or symplectic forms in this way, which is why not every manifold admits a complex or symplectic structure.
</div>

Another important application is the embedding of manifolds into Euclidean space.

<div class="theorem">
<strong>Theorem 2.14 (Whitney Embedding Theorem, weak version).</strong> Every smooth \(n\)-manifold can be smoothly embedded in \(\mathbb{R}^{2n+1}\) as a closed submanifold.
</div>

The proof of the full Whitney embedding theorem is beyond our scope, but partitions of unity are an essential ingredient.

## Chapter 3: Tangent Vectors and the Tangent Bundle

### 3.1 Motivation: What Is a Tangent Vector?

If \(M\) is a smooth submanifold of \(\mathbb{R}^N\), we have an intuitive picture of tangent vectors: they are velocity vectors of curves lying in \(M\), or equivalently, arrows in the ambient space that are "tangent" to \(M\) at a point. However, for abstract smooth manifolds not given as subsets of any Euclidean space, we need an intrinsic definition that does not rely on an ambient space. There are several equivalent approaches:

1. **Geometric**: tangent vectors as equivalence classes of curves.
2. **Algebraic**: tangent vectors as derivations on germs of smooth functions.
3. **Physicist's**: tangent vectors as gadgets that transform by the Jacobian matrix under coordinate changes.

We follow Lee's approach and adopt the algebraic definition, then show it is equivalent to the others. The key insight is that a tangent vector should be determined by how it acts on smooth functions — that is, by the directional derivatives it computes.

Why adopt the algebraic definition? On a submanifold of \(\mathbb{R}^N\) we can identify a tangent vector at \(p\) with an element of \(\mathbb{R}^N\) — but an abstract manifold comes with no ambient space to house such arrows. The geometric definition (equivalence classes of curves) is appealingly concrete, but working with equivalence classes is cumbersome. The derivation definition sidesteps both difficulties: it is purely intrinsic, works on any smooth manifold, and immediately gives the tangent space the structure of a vector space in a clean way. The price is a moment of abstraction; the reward is a definition that generalises effortlessly to the tangent bundle, to pushforwards, and eventually to the entire tensor calculus.

To see why derivations capture the right concept, think about what a tangent vector \(v\) at \(p \in \mathbb{R}^n\) actually does to a smooth function \(f\): it computes the directional derivative \(D_v f(p) = \sum_i v^i \frac{\partial f}{\partial x^i}(p)\). This operation is \(\mathbb{R}\)-linear in \(f\) and satisfies the Leibniz rule \(D_v(fg)(p) = f(p)D_v g + g(p) D_v f\). Crucially, this Leibniz rule — and nothing else — distinguishes first-order differential operators (directional derivatives) from higher-order ones (Laplacian, etc.). On an abstract manifold, the Leibniz rule is exactly the right axiom to impose on a "tangent vector acting on functions," because it forces the operator to be local (its value at \(p\) depends only on the germ of \(f\) at \(p\)) and to compute a genuine first-order directional derivative in any coordinate system.

### 3.2 Derivations and the Tangent Space

<div class="definition">
<strong>Definition 3.1 (Derivation at a Point).</strong> Let \(M\) be a smooth manifold and \(p \in M\). A <strong>derivation at \(p\)</strong> is a linear map \(v \colon C^\infty(M) \to \mathbb{R}\) satisfying the <strong>Leibniz rule</strong> (product rule):
\[
v(fg) = f(p) \, v(g) + g(p) \, v(f)
\]
for all \(f, g \in C^\infty(M)\).
</div>

<div class="definition">
<strong>Definition 3.2 (Tangent Space).</strong> The <strong>tangent space to \(M\) at \(p\)</strong>, denoted \(T_pM\), is the set of all derivations at \(p\). It is a real vector space under the operations
\[
(v + w)(f) = v(f) + w(f), \qquad (\lambda v)(f) = \lambda \, v(f).
\]
Elements of \(T_pM\) are called <strong>tangent vectors</strong> at \(p\).
</div>

![The tangent space T_pM as a plane tangent to the manifold M at the point p, with tangent vectors v₁ and v₂](/pics/pmath465/tangent-space.svg)

Before computing the dimension of the tangent space, we establish some useful consequences of the Leibniz rule.

<div class="lemma">
<strong>Lemma 3.3 (Properties of Derivations).</strong> Let \(v \in T_pM\).
<ol>
<li>If \(c \in \mathbb{R}\) is a constant function, then \(v(c) = 0\).</li>
<li>If \(f(p) = g(p) = 0\), then \(v(fg) = 0\).</li>
<li>If \(f \equiv g\) on some neighbourhood of \(p\), then \(v(f) = v(g)\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> (1) We have \(v(1) = v(1 \cdot 1) = 1 \cdot v(1) + 1 \cdot v(1) = 2v(1)\), so \(v(1) = 0\). By linearity, \(v(c) = c \cdot v(1) = 0\).

(2) This follows directly from the Leibniz rule: \(v(fg) = f(p) v(g) + g(p) v(f) = 0\).

(3) We need bump functions for this. Let \(\psi\) be a bump function with \(\psi \equiv 1\) near \(p\) and \(\mathrm{supp}(\psi)\) contained in the neighbourhood where \(f = g\). Then \(\psi f = \psi g\) everywhere on \(M\), so \(v(\psi f) = v(\psi g)\). But \(v(\psi f) = \psi(p) v(f) + f(p) v(\psi) = v(f) + f(p) v(\psi)\), and similarly \(v(\psi g) = v(g) + g(p) v(\psi)\). Since \(f(p) = g(p)\), we conclude \(v(f) = v(g)\). \(\blacksquare\)
</div>

Property (3) shows that derivations are <em>local</em>: the value of \(v(f)\) depends only on the germ of \(f\) at \(p\). This is what one expects of a "directional derivative."

### 3.3 Coordinate Bases and the Dimension of \(T_pM\)

Let \((U, \varphi)\) be a smooth chart around \(p\) with local coordinates \(x^1, \ldots, x^n\). For each \(i = 1, \ldots, n\), we define a derivation at \(p\) by

\[
\left.\frac{\partial}{\partial x^i}\right|_p (f) = \frac{\partial (f \circ \varphi^{-1})}{\partial r^i}\bigg|_{\varphi(p)},
\]

where \(r^1, \ldots, r^n\) are the standard coordinates on \(\mathbb{R}^n\). In other words, \(\frac{\partial}{\partial x^i}\big|_p\) computes the \(i\)-th partial derivative of the coordinate representation of \(f\). One checks directly that this satisfies the Leibniz rule and is thus an element of \(T_pM\).

<div class="theorem">
<strong>Theorem 3.4 (Dimension of the Tangent Space).</strong> Let \(M\) be a smooth \(n\)-manifold, \(p \in M\), and \((U, \varphi) = (U, x^1, \ldots, x^n)\) a smooth chart containing \(p\). Then the tangent vectors
\[
\left.\frac{\partial}{\partial x^1}\right|_p, \ldots, \left.\frac{\partial}{\partial x^n}\right|_p
\]
form a basis for \(T_pM\). In particular, \(\dim T_pM = n = \dim M\).
</div>

<div class="proof">
<strong>Proof.</strong> Without loss of generality (by composing with a translation), we may assume the chart is centred at \(p\), so \(\varphi(p) = 0\). Let \(\hat{f} = f \circ \varphi^{-1}\).

<strong>Linear independence.</strong> We have \(\frac{\partial}{\partial x^i}\big|_p(x^j) = \frac{\partial r^j}{\partial r^i}\big|_0 = \delta^j_i\). If \(\sum_i a^i \frac{\partial}{\partial x^i}\big|_p = 0\), then applying this to \(x^j\) gives \(a^j = 0\) for each \(j\).

<strong>Spanning.</strong> Let \(v \in T_pM\) be any derivation. Set \(v^i = v(x^i)\). We claim that \(v = \sum_i v^i \frac{\partial}{\partial x^i}\big|_p\).

By Taylor's theorem with remainder in \(\mathbb{R}^n\), for any \(\hat{f} \in C^\infty\) near \(0\) we can write

\[
\hat{f}(x) = \hat{f}(0) + \sum_{i=1}^n x^i \, g_i(x),
\]
where \(g_i\) are smooth functions satisfying \(g_i(0) = \frac{\partial \hat{f}}{\partial r^i}(0)\). (One obtains this from \(\hat{f}(x) - \hat{f}(0) = \int_0^1 \frac{d}{dt}\hat{f}(tx)\,dt = \sum_i x^i \int_0^1 \frac{\partial \hat{f}}{\partial r^i}(tx)\,dt\).)

Pulling back to \(M\): \(f = f(p) + \sum_i x^i \cdot (g_i \circ \varphi)\) near \(p\). Applying \(v\):

\[
v(f) = v(f(p)) + \sum_i v(x^i \cdot (g_i \circ \varphi)) = 0 + \sum_i \left[x^i(p)\, v(g_i \circ \varphi) + (g_i \circ \varphi)(p)\, v(x^i)\right].
\]
Since \(\varphi(p) = 0\), we have \(x^i(p) = 0\), and \((g_i \circ \varphi)(p) = g_i(0) = \frac{\partial \hat{f}}{\partial r^i}(0) = \frac{\partial}{\partial x^i}\big|_p(f)\). Therefore

\[
v(f) = \sum_i v^i \frac{\partial}{\partial x^i}\bigg|_p(f).
\]
Since this holds for every \(f\), we have \(v = \sum_i v^i \frac{\partial}{\partial x^i}\big|_p\). \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark.</strong> Any tangent vector \(v \in T_pM\) can thus be written uniquely as \(v = v^i \frac{\partial}{\partial x^i}\big|_p\), where we use the Einstein summation convention (implicit summation over repeated indices). The numbers \(v^1, \ldots, v^n\) are called the <strong>components</strong> of \(v\) with respect to the coordinate basis.
</div>

### 3.4 The Pushforward (Differential)

One of the most important operations in differential geometry is the pushforward (or differential) of a smooth map. Given a smooth map \(F \colon M \to N\), we want to associate to it a linear map on tangent spaces that captures the "linear approximation" of \(F\) at each point. In \(\mathbb{R}^n\), this role is played by the Jacobian matrix; the pushforward generalizes this to manifolds.

<div class="definition">
<strong>Definition 3.5 (Pushforward / Differential).</strong> Let \(F \colon M \to N\) be a smooth map and \(p \in M\). The <strong>pushforward</strong> (or <strong>differential</strong>) of \(F\) at \(p\) is the linear map
\[
F_{*,p} \colon T_pM \to T_{F(p)}N
\]
(also written \(dF_p\), \(DF_p\), or \((F_*)_p\)) defined by

\[
(F_{*,p}(v))(g) = v(g \circ F)
\]
for all \(v \in T_pM\) and \(g \in C^\infty(N)\).
</div>

![The pushforward F_* maps tangent vectors at p ∈ M to tangent vectors at F(p) ∈ N](/pics/pmath465/pushforward.svg)

We must verify that \(F_{*,p}(v)\) is indeed a derivation at \(F(p)\). Linearity is clear: \(F_{*,p}(v)(g_1 + g_2) = v((g_1+g_2) \circ F) = v(g_1 \circ F) + v(g_2 \circ F)\). For the Leibniz rule:

\[
F_{*,p}(v)(g_1 g_2) = v((g_1 g_2) \circ F) = v((g_1 \circ F)(g_2 \circ F)),
\]
and since \(v\) is a derivation at \(p\),

\[
= (g_1 \circ F)(p) \, v(g_2 \circ F) + (g_2 \circ F)(p) \, v(g_1 \circ F) = g_1(F(p)) \, F_{*,p}(v)(g_2) + g_2(F(p)) \, F_{*,p}(v)(g_1).
\]
So \(F_{*,p}(v) \in T_{F(p)}N\).

### 3.5 Pushforward in Local Coordinates

The power of the pushforward becomes concrete when we compute it in coordinates. The result is exactly the Jacobian matrix, confirming that the pushforward is the correct generalization of the total derivative.

Before stating the proposition, let us make the connection vivid with a simple example. Consider \(F \colon \mathbb{R}^2 \to \mathbb{R}^2\) defined by \(F(x,y) = (x^2 - y^2, 2xy)\) (which is complex squaring under the identification \(\mathbb{R}^2 \cong \mathbb{C}\)). In the standard coordinates, the pushforward at a point \((x,y)\) is represented by the Jacobian:

\[
[F_{*,(x,y)}] = \begin{pmatrix} 2x & -2y \\ 2y & 2x \end{pmatrix}.
\]
The basis vector \(\frac{\partial}{\partial x}\big|_{(x,y)}\) maps to \(2x\frac{\partial}{\partial u}\big|_{F(x,y)} + 2y\frac{\partial}{\partial v}\big|_{F(x,y)}\), and \(\frac{\partial}{\partial y}\big|_{(x,y)}\) maps to \(-2y\frac{\partial}{\partial u}\big|_{F(x,y)} + 2x\frac{\partial}{\partial v}\big|_{F(x,y)}\). This is the linear approximation to \(F\) at \((x,y)\) — the best linear map from \(T_{(x,y)}\mathbb{R}^2\) to \(T_{F(x,y)}\mathbb{R}^2\) approximating \(F\) near that point.

<div class="proposition">
<strong>Proposition 3.6 (Pushforward in Coordinates).</strong> Let \(F \colon M \to N\) be smooth, \(p \in M\), \((U, \varphi) = (U, x^1, \ldots, x^m)\) a chart around \(p\), and \((V, \psi) = (V, y^1, \ldots, y^n)\) a chart around \(F(p)\). Write the coordinate representation of \(F\) as
\[
\hat{F} = \psi \circ F \circ \varphi^{-1} \colon \varphi(U) \to \psi(V), \qquad \hat{F}(x) = (\hat{F}^1(x), \ldots, \hat{F}^n(x)).
\]
Then

\[
F_{*,p}\left(\frac{\partial}{\partial x^i}\bigg|_p\right) = \sum_{j=1}^n \frac{\partial \hat{F}^j}{\partial x^i}(\varphi(p)) \, \frac{\partial}{\partial y^j}\bigg|_{F(p)}.
\]
In other words, the matrix of \(F_{*,p}\) with respect to the coordinate bases is the <strong>Jacobian matrix</strong> of \(\hat{F}\) at \(\varphi(p)\).
</div>

<div class="proof">
<strong>Proof.</strong> For any \(g \in C^\infty(N)\), we compute
\[
F_{*,p}\left(\frac{\partial}{\partial x^i}\bigg|_p\right)(g) = \frac{\partial}{\partial x^i}\bigg|_p(g \circ F) = \frac{\partial (g \circ F \circ \varphi^{-1})}{\partial r^i}\bigg|_{\varphi(p)}.
\]
Now \(g \circ F \circ \varphi^{-1} = (g \circ \psi^{-1}) \circ (\psi \circ F \circ \varphi^{-1}) = \hat{g} \circ \hat{F}\). By the chain rule in \(\mathbb{R}^n\):

\[
\frac{\partial (\hat{g} \circ \hat{F})}{\partial r^i}\bigg|_{\varphi(p)} = \sum_{j=1}^n \frac{\partial \hat{g}}{\partial r^j}\bigg|_{\hat{F}(\varphi(p))} \cdot \frac{\partial \hat{F}^j}{\partial r^i}\bigg|_{\varphi(p)} = \sum_j \frac{\partial \hat{F}^j}{\partial x^i}(\varphi(p)) \cdot \frac{\partial}{\partial y^j}\bigg|_{F(p)}(g).
\]
Since this holds for all \(g\), the result follows. \(\blacksquare\)
</div>

### 3.6 The Chain Rule and Functoriality

The chain rule from multivariable calculus generalizes beautifully to manifolds.

<div class="theorem">
<strong>Theorem 3.7 (Chain Rule for Pushforwards).</strong> If \(F \colon M \to N\) and \(G \colon N \to P\) are smooth maps, then for every \(p \in M\),
\[
(G \circ F)_{<em>,p} = G_{</em>,F(p)} \circ F_{*,p}.
\]
Moreover, \((\mathrm{id}_M)_{*,p} = \mathrm{id}_{T_pM}\).
</div>

<div class="proof">
<strong>Proof.</strong> For any \(v \in T_pM\) and \(h \in C^\infty(P)\):
\[
(G \circ F)_{<em>,p}(v)(h) = v(h \circ G \circ F) = F_{</em>,p}(v)(h \circ G) = G_{<em>,F(p)}(F_{</em>,p}(v))(h).
\]
The identity statement is immediate: \((\mathrm{id}_M)_{*,p}(v)(f) = v(f \circ \mathrm{id}_M) = v(f)\). \(\blacksquare\)
</div>

<div class="corollary">
<strong>Corollary 3.8.</strong> If \(F \colon M \to N\) is a diffeomorphism, then \(F_{<em>,p} \colon T_pM \to T_{F(p)}N\) is a linear isomorphism for every \(p \in M\), with \((F_{</em>,p})^{-1} = (F^{-1})_{*,F(p)}\).
</div>

<div class="proof">
<strong>Proof.</strong> From the chain rule: \(F_{<em>,p} \circ (F^{-1})_{</em>,F(p)} = (F \circ F^{-1})_{<em>,F(p)} = (\mathrm{id}_N)_{</em>,F(p)} = \mathrm{id}_{T_{F(p)}N}\), and similarly \((F^{-1})_{<em>,F(p)} \circ F_{</em>,p} = \mathrm{id}_{T_pM}\). \(\blacksquare\)
</div>

<div class="example">
<strong>Example 3.7a (Differential of the inclusion \(\iota \colon S^n \hookrightarrow \mathbb{R}^{n+1}\)).</strong> Let \(\iota \colon S^n \hookrightarrow \mathbb{R}^{n+1}\) be the inclusion. We compute the pushforward \(\iota_{*,p} \colon T_p S^n \to T_p \mathbb{R}^{n+1}\) at a point \(p \in S^n\).

Working in the stereographic chart \((U_N, \sigma_N)\) around a point \(p \neq N\), with coordinates \(u = (u^1, \ldots, u^n)\), the inclusion in these coordinates is the map \(\hat{\iota} = \iota \circ \sigma_N^{-1} \colon \mathbb{R}^n \to \mathbb{R}^{n+1}\),

\[
\hat{\iota}(u) = \sigma_N^{-1}(u) = \frac{1}{|u|^2+1}(2u^1, \ldots, 2u^n, |u|^2 - 1).
\]
The Jacobian of \(\hat{\iota}\) at \(u\) is an \((n+1) \times n\) matrix with full rank \(n\) (since \(\hat{\iota}\) is an immersion). Each column \(\frac{\partial \hat{\iota}}{\partial u^k}\) is a tangent vector to \(S^n\) in the ambient \(\mathbb{R}^{n+1}\).

More conceptually: by the regular level set theorem (Example 6.20), \(T_p S^n = p^\perp\), the orthogonal complement of \(p\) in \(\mathbb{R}^{n+1}\). The pushforward \(\iota_{*,p}\) is simply the inclusion of this subspace into \(\mathbb{R}^{n+1}\). Concretely, if \(v \in T_pS^n\) is the velocity of a curve \(\gamma\) on \(S^n\) at \(p\), then \(\iota_{*,p}(v) = \gamma'(0)\) regarded as a vector in \(\mathbb{R}^{n+1}\). The condition \(\gamma(t) \in S^n\) forces \(\gamma(t) \cdot \gamma(t) = 1\), differentiating: \(2\gamma(0) \cdot \gamma'(0) = 0\), so \(\gamma'(0) \perp p\). Thus \(\iota_{*,p}(T_pS^n) = p^\perp \subset \mathbb{R}^{n+1}\), confirming that the differential of the inclusion is injective and identifies \(T_pS^n\) with the hyperplane perpendicular to the position vector.
</div>

In categorical language, the tangent space construction is a *functor* from the category of smooth manifolds (with smooth maps) to the category of vector spaces (with linear maps): it sends each manifold to a family of vector spaces and each smooth map to a family of linear maps, respecting composition and identities.

<div class="remark">
<strong>Remark (Tangent space is local).</strong> If \(U \subseteq M\) is an open submanifold and \(\iota \colon U \hookrightarrow M\) is the inclusion, then \(\iota_{*,p} \colon T_pU \to T_pM\) is an isomorphism for every \(p \in U\). This is because every smooth function on \(M\) can be restricted to \(U\) (giving a surjection), and by bump functions, every smooth function on \(U\) agrees near \(p\) with the restriction of some smooth function on \(M\) (giving injectivity of the pushforward). Thus the tangent space \(T_pM\) depends only on the local structure of \(M\) near \(p\).
</div>

### 3.7 Change of Coordinates for Tangent Vectors

The coordinate basis vectors \(\frac{\partial}{\partial x^i}\big|_p\) depend on the choice of chart. When we change from one chart to another, the basis vectors transform by the Jacobian of the transition map. This gives the classical "transformation law" for tangent vectors.

<div class="proposition">
<strong>Proposition 3.9 (Change of Coordinates).</strong> Let \((U, x^1, \ldots, x^n)\) and \((V, y^1, \ldots, y^n)\) be two charts around \(p \in M\). Then
\[
\frac{\partial}{\partial x^i}\bigg|_p = \sum_{j=1}^n \frac{\partial y^j}{\partial x^i}(p) \, \frac{\partial}{\partial y^j}\bigg|_p,
\]
where \(\frac{\partial y^j}{\partial x^i}(p)\) denotes the \((j,i)\)-entry of the Jacobian matrix of the transition map \(\psi \circ \varphi^{-1}\) evaluated at \(\varphi(p)\).

Consequently, if \(v = \sum_i v^i \frac{\partial}{\partial x^i}\big|_p = \sum_j w^j \frac{\partial}{\partial y^j}\big|_p\), then

\[
w^j = \sum_i \frac{\partial y^j}{\partial x^i}(p) \, v^i.
\]
</div>

<div class="proof">
<strong>Proof.</strong> This is a special case of Proposition 3.6 applied to the identity map \(\mathrm{id}_M\), with \(F = \mathrm{id}_M\), using charts \((U, \varphi)\) in the domain and \((V, \psi)\) in the codomain. The coordinate representation is the transition map \(\hat{F} = \psi \circ \varphi^{-1}\). \(\blacksquare\)
</div>

### 3.8 Tangent Vectors as Velocity Vectors of Curves

We now connect the algebraic definition of tangent vectors to the geometric picture of velocity vectors.

<div class="definition">
<strong>Definition 3.10 (Smooth Curve and Velocity Vector).</strong> A <strong>smooth curve</strong> in \(M\) is a smooth map \(\gamma \colon I \to M\), where \(I \subseteq \mathbb{R}\) is an open interval. If \(t_0 \in I\), the <strong>velocity vector</strong> of \(\gamma\) at \(t_0\) is the tangent vector
\[
\gamma'(t_0) = \gamma_{*,t_0}\left(\frac{d}{dt}\bigg|_{t_0}\right) \in T_{\gamma(t_0)}M.
\]
Explicitly, \(\gamma'(t_0)\) acts on a smooth function \(f\) by

\[
\gamma'(t_0)(f) = \frac{d}{dt}\bigg|_{t_0}(f \circ \gamma) = (f \circ \gamma)'(t_0).
\]
</div>

In local coordinates \((U, x^1, \ldots, x^n)\) around \(\gamma(t_0)\), if we write \(\gamma(t) = (\gamma^1(t), \ldots, \gamma^n(t))\) (meaning \(x^i(\gamma(t)) = \gamma^i(t)\)), then

\[
\gamma'(t_0) = \sum_{i=1}^n \dot{\gamma}^i(t_0) \, \frac{\partial}{\partial x^i}\bigg|_{\gamma(t_0)},
\]
where \(\dot{\gamma}^i(t_0) = \frac{d\gamma^i}{dt}(t_0)\). This is exactly what one would expect from the chain rule.

![A tangent vector v at p as the velocity vector of a curve γ passing through p on the manifold](/pics/pmath465/tangent-vector-velocity-curve.svg)

The next result shows that the geometric and algebraic definitions of tangent vectors are equivalent.

<div class="proposition">
<strong>Proposition 3.11 (Every Tangent Vector is a Velocity Vector).</strong> For every \(v \in T_pM\), there exists a smooth curve \(\gamma \colon (-\varepsilon, \varepsilon) \to M\) with \(\gamma(0) = p\) and \(\gamma'(0) = v\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \((U, \varphi) = (U, x^1, \ldots, x^n)\) be a chart centred at \(p\) and write \(v = \sum_i v^i \frac{\partial}{\partial x^i}\big|_p\). Define \(\gamma\) in coordinates by \(\varphi(\gamma(t)) = (v^1 t, \ldots, v^n t)\) for \(t\) sufficiently small. Then \(\gamma(0) = p\) (since \(\varphi(p) = 0\)) and \(\gamma'(0) = \sum_i v^i \frac{\partial}{\partial x^i}\big|_p = v\). \(\blacksquare\)
</div>

### 3.9 The Tangent Bundle

Having constructed the tangent space \(T_pM\) at each point, we now assemble all these vector spaces into a single smooth manifold: the tangent bundle.

<div class="definition">
<strong>Definition 3.12 (Tangent Bundle).</strong> The <strong>tangent bundle</strong> of a smooth \(n\)-manifold \(M\) is the disjoint union
\[
TM = \bigsqcup_{p \in M} T_pM = \{(p, v) : p \in M, \, v \in T_pM\}.
\]
The <strong>natural projection</strong> is the map \(\pi \colon TM \to M\) defined by \(\pi(p, v) = p\).
</div>

![The tangent bundle TM as a fibre bundle over M, with each fibre T_pM a copy of R^n](/pics/pmath465/tangent-bundle.svg)

The tangent bundle \(TM\) carries a natural topology and smooth structure making it a smooth \(2n\)-dimensional manifold. The construction proceeds as follows.

<div class="theorem">
<strong>Theorem 3.13 (Smooth Structure on the Tangent Bundle).</strong> Let \(M\) be a smooth \(n\)-manifold. Then \(TM\) admits a unique topology and smooth structure making it a smooth \(2n\)-manifold with the following properties:
<ol>
<li>The projection \(\pi \colon TM \to M\) is a smooth surjection.</li>
<li>For each smooth chart \((U, \varphi) = (U, x^1, \ldots, x^n)\) on \(M\), the map \(\tilde{\varphi} \colon \pi^{-1}(U) \to \varphi(U) \times \mathbb{R}^n\) defined by
\[
\tilde{\varphi}\left(p,\, v^i \frac{\partial}{\partial x^i}\bigg|_p\right) = (x^1(p), \ldots, x^n(p), v^1, \ldots, v^n)
\]
is a diffeomorphism onto an open subset of \(\mathbb{R}^{2n}\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof (Construction).</strong> For each chart \((U_\alpha, \varphi_\alpha)\) on \(M\), define \(\tilde{\varphi}_\alpha \colon \pi^{-1}(U_\alpha) \to \varphi_\alpha(U_\alpha) \times \mathbb{R}^n\) as in the statement. The sets \(\pi^{-1}(U_\alpha)\) cover \(TM\), and each \(\tilde{\varphi}_\alpha\) is a bijection onto an open subset of \(\mathbb{R}^{2n}\).

We need to check that the transition maps are smooth. On \(\pi^{-1}(U_\alpha \cap U_\beta)\), the transition map \(\tilde{\varphi}_\beta \circ \tilde{\varphi}_\alpha^{-1}\) acts on \((x, v) \in \varphi_\alpha(U_\alpha \cap U_\beta) \times \mathbb{R}^n\) by

\[
\tilde{\varphi}_\beta \circ \tilde{\varphi}_\alpha^{-1}(x, v) = \left(\tau(x),\; J_\tau(x) \cdot v\right),
\]
where \(\tau = \varphi_\beta \circ \varphi_\alpha^{-1}\) is the transition map on \(M\) and \(J_\tau(x)\) is its Jacobian matrix. This is smooth (since \(\tau\) is a diffeomorphism and the Jacobian depends smoothly on \(x\)), so the charts \(\{(\pi^{-1}(U_\alpha), \tilde{\varphi}_\alpha)\}\) form a smooth atlas on \(TM\).

We topologize \(TM\) by declaring \(W \subseteq TM\) to be open if \(\tilde{\varphi}_\alpha(W \cap \pi^{-1}(U_\alpha))\) is open in \(\mathbb{R}^{2n}\) for every \(\alpha\). This makes \(TM\) Hausdorff and second countable (because \(M\) is), and the maps \(\tilde{\varphi}_\alpha\) become homeomorphisms. \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark.</strong> The tangent bundle \(TM\) is the prototypical example of a <strong>vector bundle</strong> over \(M\). Each fibre \(\pi^{-1}(p) = T_pM\) is a vector space, and the local trivializations \(\tilde{\varphi}_\alpha\) identify \(\pi^{-1}(U_\alpha)\) with a product \(U_\alpha \times \mathbb{R}^n\) in a way that is linear on each fibre. The transition functions \(p \mapsto J_\tau(\varphi_\alpha(p))\) take values in \(\mathrm{GL}(n, \mathbb{R})\). The general theory of vector bundles will be developed later in the course.
</div>

<div class="example">
<strong>Example 3.14.</strong> The tangent bundle of \(\mathbb{R}^n\) is \(T\mathbb{R}^n \cong \mathbb{R}^n \times \mathbb{R}^n \cong \mathbb{R}^{2n}\). The tangent bundle of \(S^1\) is \(TS^1 \cong S^1 \times \mathbb{R}\) (the circle is "parallelizable"). In contrast, \(TS^2\) is not trivial — this is the content of the <strong>hairy ball theorem</strong>, which states that there is no nowhere-vanishing continuous tangent vector field on \(S^2\).
</div>

<div class="remark">
<strong>Remark (The tangent bundle as phase space in classical mechanics).</strong> The tangent bundle \(TM\) has a natural physical interpretation: if \(M\) is the configuration space of a classical mechanical system — the manifold of all possible positions — then \(TM\) is the **velocity phase space**, whose points are pairs \((q, \dot{q})\) of a position and a velocity. A classical Lagrangian \(L \colon TM \to \mathbb{R}\) is a smooth function on the tangent bundle; Lagrangian mechanics takes place on \(TM\). In contrast, Hamiltonian mechanics takes place on the cotangent bundle \(T^*M\) (momentum phase space), as we will discuss in Chapter 5. For example, if \(M = \mathbb{R}^3\) (the configuration space of a particle in 3-space), then \(TM \cong \mathbb{R}^6\) with coordinates \((x, y, z, \dot{x}, \dot{y}, \dot{z})\). If \(M = SO(3)\) (the configuration space of a rigid body in 3-space, parametrised by rotations), then \(TM\) is a 6-dimensional manifold encoding both the orientation and the angular velocity of the body.

The non-triviality of \(TS^2\) has a direct physical consequence via the hairy ball theorem: you cannot comb a sphere flat. More precisely, there is no continuous, nowhere-vanishing tangent vector field on \(S^2\). Applied to fluid dynamics on the Earth (modeled as \(S^2\)), this means every steady-state wind pattern on the globe must have at least one point where the wind speed is zero (an eye of a storm, or a still point).
</div>

![Examples of tangent bundles: TS^1 is a cylinder (trivial), while TS^2 is non-trivial by the hairy ball theorem](/pics/pmath465/tangent-bundle-examples.svg)

## Chapter 4: Vector Fields on Manifolds

### 4.1 Sections of the Tangent Bundle

Chapter 3 established the tangent bundle \(\pi \colon TM \to M\) as a smooth \(2n\)-manifold fibred over \(M\). We now study the global objects that live on this bundle: vector fields. Informally, a vector field is a rule that assigns to each point of \(M\) a tangent vector at that point, varying smoothly from point to point. Such objects are fundamental to differential geometry and physics — they describe flows, infinitesimal symmetries, and dynamical systems.

<div class="definition">
<strong>Definition 4.1 (Vector Field).</strong> A <strong>vector field</strong> on a smooth manifold \(M\) is a section of the tangent bundle: a smooth map \(X \colon M \to TM\) such that \(\pi \circ X = \mathrm{id}_M\). Equivalently, \(X\) assigns to each \(p \in M\) a tangent vector \(X_p \in T_pM\), and the assignment \(p \mapsto X_p\) is smooth.
</div>

![A vector field as a section of the tangent bundle: at each point p, the vector field assigns a tangent vector X_p in the fibre T_pM](/pics/pmath465/vector-field-section.svg)

In local coordinates \((U, x^1, \ldots, x^n)\), a vector field \(X\) has the form

\[
X = \sum_{i=1}^n X^i \frac{\partial}{\partial x^i},
\]
where the <strong>component functions</strong> \(X^i \colon U \to \mathbb{R}\) are given by \(X^i(p) = (X_p)(x^i)\). The vector field \(X\) is smooth if and only if all component functions \(X^i\) are smooth in every coordinate chart.

<div class="definition">
<strong>Definition 4.2 (Space of Smooth Vector Fields).</strong> The set of all smooth vector fields on \(M\) is denoted \(\Gamma(TM)\) or \(\mathfrak{X}(M)\). It is a real vector space under pointwise addition:
\[
(X + Y)_p = X_p + Y_p, \qquad (\lambda X)_p = \lambda X_p.
\]
Moreover, \(\Gamma(TM)\) is a <strong>module over \(C^\infty(M)\)</strong>: for any \(f \in C^\infty(M)\) and \(X \in \Gamma(TM)\), the product \(fX\) defined by \((fX)_p = f(p) X_p\) is again a smooth vector field. The module axioms are easily verified.
</div>

<div class="remark">
<strong>Remark.</strong> The fact that \(\Gamma(TM)\) is a \(C^\infty(M)\)-module (rather than merely a vector space) is extremely important. It means we can multiply vector fields by functions, not just constants. This reflects the local nature of the theory: a vector field can be "scaled" differently at different points.
</div>

### 4.2 Vector Fields as Derivations of \(C^\infty(M)\)

Each tangent vector \(v \in T_pM\) acts as a derivation on \(C^\infty(M)\) at the point \(p\). When we let \(p\) vary, a vector field \(X\) defines a derivation of the entire algebra \(C^\infty(M)\).

<div class="definition">
<strong>Definition 4.3 (Vector Field as Derivation).</strong> A smooth vector field \(X \in \Gamma(TM)\) acts on smooth functions by
\[
(Xf)(p) = X_p(f) \quad \text{for all } f \in C^\infty(M), \, p \in M.
\]
The resulting function \(Xf \colon M \to \mathbb{R}\) is smooth (one checks this in coordinates), so \(X\) defines a map \(X \colon C^\infty(M) \to C^\infty(M)\) satisfying:
<ol>
<li><strong>\(\mathbb{R}\)-linearity</strong>: \(X(af + bg) = a\,Xf + b\,Xg\) for all \(a, b \in \mathbb{R}\).</li>
<li><strong>Leibniz rule</strong>: \(X(fg) = f \cdot Xg + g \cdot Xf\).</li>
</ol>
A map \(C^\infty(M) \to C^\infty(M)\) satisfying these two properties is called a <strong>derivation of \(C^\infty(M)\)</strong>.
</div>

In coordinates, if \(X = \sum_i X^i \frac{\partial}{\partial x^i}\), then

\[
Xf = \sum_{i=1}^n X^i \frac{\partial f}{\partial x^i},
\]
which is a first-order linear partial differential operator.

<div class="proposition">
<strong>Proposition 4.4.</strong> The map \(\Gamma(TM) \to \mathrm{Der}(C^\infty(M))\) sending \(X\) to the derivation \(f \mapsto Xf\) is an isomorphism of \(C^\infty(M)\)-modules. That is, every derivation of \(C^\infty(M)\) arises from a unique smooth vector field.
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> Injectivity is clear: if \(Xf = 0\) for all \(f\), then \(X_p(f) = 0\) for all \(p\) and all \(f\), so \(X_p = 0\) for all \(p\). For surjectivity, given a derivation \(D \colon C^\infty(M) \to C^\infty(M)\), one shows using bump functions that \(D\) is local (i.e., \((Df)(p)\) depends only on \(f\) near \(p\)) and hence defines a derivation \(D_p\) at each point \(p\), yielding a vector field. Smoothness follows from the fact that the component functions \(D(x^i)\) are smooth. \(\blacksquare\)
</div>

### 4.3 \(F\)-Related Vector Fields

When we have a smooth map \(F \colon M \to N\), we generally cannot "push forward" a vector field on \(M\) to a vector field on \(N\), because \(F\) may not be surjective (there may be points of \(N\) not in the image) or not injective (distinct points may map to the same point, giving ambiguous values). Instead, we have the weaker notion of \(F\)-relatedness.

<div class="definition">
<strong>Definition 4.5 (\(F\)-Related Vector Fields).</strong> Let \(F \colon M \to N\) be a smooth map. A vector field \(X \in \Gamma(TM)\) and a vector field \(Y \in \Gamma(TN)\) are <strong>\(F\)-related</strong> if
\[
F_{*,p}(X_p) = Y_{F(p)} \qquad \text{for all } p \in M.
\]
Equivalently, \(F_* \circ X = Y \circ F\) as maps \(M \to TN\).
</div>

<div class="proposition">
<strong>Proposition 4.6 (Characterization of \(F\)-Relatedness).</strong> Let \(F \colon M \to N\) be smooth, \(X \in \Gamma(TM)\), and \(Y \in \Gamma(TN)\). Then \(X\) and \(Y\) are \(F\)-related if and only if
\[
X(g \circ F) = (Yg) \circ F \qquad \text{for all } g \in C^\infty(N).
\]
</div>

<div class="proof">
<strong>Proof.</strong> For any \(p \in M\) and \(g \in C^\infty(N)\):
\[
X(g \circ F)(p) = X_p(g \circ F) = (F_{*,p} X_p)(g),
\]
\[
((Yg) \circ F)(p) = (Yg)(F(p)) = Y_{F(p)}(g).
\]
These are equal for all \(g\) and \(p\) if and only if \(F_{*,p} X_p = Y_{F(p)}\) for all \(p\). \(\blacksquare\)
</div>

If \(F\) is a diffeomorphism, then for any \(X \in \Gamma(TM)\), there is a unique vector field \(F_*X \in \Gamma(TN)\) that is \(F\)-related to \(X\), called the <strong>pushforward</strong> of \(X\): it is defined by \((F_*X)_q = F_{*,F^{-1}(q)}(X_{F^{-1}(q)})\).

### 4.4 The Lie Bracket

We now come to one of the most important algebraic structures in differential geometry: the Lie bracket of vector fields. The Lie bracket measures the failure of two flows to commute and provides the tangent bundle with a rich algebraic structure that goes far beyond its mere vector space or module structure.

To motivate the definition geometrically: suppose we flow along \(X\) for time \(\sqrt{t}\), then along \(Y\) for time \(\sqrt{t}\), then backward along \(X\) for time \(\sqrt{t}\), and finally backward along \(Y\) for time \(\sqrt{t}\). If the two flows commuted, we would return exactly to the starting point for every \(t\). In fact, the displacement from the starting point is approximately \(t \cdot [X, Y]_p\) as \(t \to 0\). The Lie bracket thus measures, to first order, the failure of the two flows to trace out a closed parallelogram. This geometric interpretation will be made precise when we discuss flows and the Lie derivative in Chapter 12.

Given two vector fields \(X, Y \in \Gamma(TM)\), each acts as a derivation of \(C^\infty(M)\). The composition \(X \circ Y\) (meaning \(f \mapsto X(Yf)\)) is, in general, *not* a derivation because it involves second-order derivatives. However, the commutator \(XY - YX\) miraculously cancels the second-order terms and produces a derivation.

<div class="definition">
<strong>Definition 4.7 (Lie Bracket).</strong> The <strong>Lie bracket</strong> of two smooth vector fields \(X, Y \in \Gamma(TM)\) is the smooth vector field \([X, Y] \in \Gamma(TM)\) defined by
\[
[X, Y](f) = X(Yf) - Y(Xf) \qquad \text{for all } f \in C^\infty(M).
\]
</div>

![The Lie bracket as the failure of a parallelogram to close: flowing along X then Y versus Y then X yields a gap measured by [X,Y]](/pics/pmath465/lie-bracket-parallelogram.svg)

We must verify that \([X, Y]\) is indeed a derivation (and hence corresponds to a vector field by Proposition 4.4).

<div class="proof">
<strong>Proof that \([X, Y]\) is a derivation.</strong> Linearity is clear. For the Leibniz rule, let \(f, g \in C^\infty(M)\):
\[
X(Y(fg)) = X(f \cdot Yg + g \cdot Yf) = Xf \cdot Yg + f \cdot X(Yg) + Xg \cdot Yf + g \cdot X(Yf).
\]
Similarly,

\[
Y(X(fg)) = Yf \cdot Xg + f \cdot Y(Xg) + Yg \cdot Xf + g \cdot Y(Xf).
\]
Subtracting:

\[
[X,Y](fg) = f \cdot (X(Yg) - Y(Xg)) + g \cdot (X(Yf) - Y(Xf)) = f \cdot [X,Y]g + g \cdot [X,Y]f. \quad \blacksquare
\]
</div>

Now we compute the Lie bracket in local coordinates.

<div class="proposition">
<strong>Proposition 4.8 (Coordinate Formula for the Lie Bracket).</strong> In local coordinates \((U, x^1, \ldots, x^n)\), if \(X = \sum_i X^i \frac{\partial}{\partial x^i}\) and \(Y = \sum_j Y^j \frac{\partial}{\partial x^j}\), then
\[
[X, Y] = \sum_{k=1}^n \left(\sum_{i=1}^n X^i \frac{\partial Y^k}{\partial x^i} - Y^i \frac{\partial X^k}{\partial x^i}\right) \frac{\partial}{\partial x^k}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> We compute \([X, Y](f)\) for an arbitrary smooth function \(f\):
\[
X(Yf) = \sum_i X^i \frac{\partial}{\partial x^i}\left(\sum_j Y^j \frac{\partial f}{\partial x^j}\right) = \sum_{i,j} X^i \frac{\partial Y^j}{\partial x^i}\frac{\partial f}{\partial x^j} + \sum_{i,j} X^i Y^j \frac{\partial^2 f}{\partial x^i \partial x^j}.
\]
Similarly,

\[
Y(Xf) = \sum_{i,j} Y^i \frac{\partial X^j}{\partial x^i}\frac{\partial f}{\partial x^j} + \sum_{i,j} Y^i X^j \frac{\partial^2 f}{\partial x^i \partial x^j}.
\]
The second-order terms cancel (by equality of mixed partials), and we are left with

\[
[X,Y](f) = \sum_{i,j} \left(X^i \frac{\partial Y^j}{\partial x^i} - Y^i \frac{\partial X^j}{\partial x^i}\right) \frac{\partial f}{\partial x^j}.
\]
Relabelling the summation index \(j\) as \(k\) gives the stated formula. \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark.</strong> In particular, coordinate vector fields always commute: \(\left[\frac{\partial}{\partial x^i}, \frac{\partial}{\partial x^j}\right] = 0\) for all \(i, j\). This is because the component functions of \(\frac{\partial}{\partial x^i}\) in the \(x\)-coordinates are constants (\(\delta^k_i\)), so all partial derivatives of the components vanish. Conversely, a classical theorem states that commuting vector fields can always be "straightened" simultaneously into coordinate vector fields (this is the Frobenius theorem).
</div>

<div class="example">
<strong>Example 4.8a (Concrete Lie bracket computations on \(\mathbb{R}^2\)).</strong> Let \(x, y\) be standard coordinates on \(\mathbb{R}^2\). Consider the vector fields
\[
X = \frac{\partial}{\partial x}, \qquad Y = x\frac{\partial}{\partial y}.
\]
To compute \([X, Y]\) we apply the coordinate formula. Here \(X^1 = 1, X^2 = 0\) and \(Y^1 = 0, Y^2 = x\). The only nonzero partial derivative of the components of \(Y\) is \(\frac{\partial Y^2}{\partial x} = 1\). The only nonzero partial derivative of the components of \(X\) is zero everywhere. Thus

\[
[X, Y]^1 = X^1 \frac{\partial Y^1}{\partial x} + X^2 \frac{\partial Y^1}{\partial y} - Y^1 \frac{\partial X^1}{\partial x} - Y^2 \frac{\partial X^1}{\partial y} = 1 \cdot 0 + 0 - 0 - 0 = 0,
\]
\[
[X, Y]^2 = X^1 \frac{\partial Y^2}{\partial x} + X^2 \frac{\partial Y^2}{\partial y} - Y^1 \frac{\partial X^2}{\partial x} - Y^2 \frac{\partial X^2}{\partial y} = 1 \cdot 1 + 0 - 0 - 0 = 1.
\]
Hence \([X, Y] = \frac{\partial}{\partial y}\). We can verify this directly: for any \(f \in C^\infty(\mathbb{R}^2)\),

\[
[X, Y](f) = X(Y(f)) - Y(X(f)) = \frac{\partial}{\partial x}\!\left(x \frac{\partial f}{\partial y}\right) - x\frac{\partial}{\partial y}\!\left(\frac{\partial f}{\partial x}\right) = \frac{\partial f}{\partial y} + x\frac{\partial^2 f}{\partial x \partial y} - x\frac{\partial^2 f}{\partial y \partial x} = \frac{\partial f}{\partial y}.
\]
The second-order terms cancel, leaving \(\frac{\partial}{\partial y}\), as expected.

Now consider the rotation vector field on \(\mathbb{R}^2\): \(R = -y\frac{\partial}{\partial x} + x\frac{\partial}{\partial y}\), and the radial dilation \(D = x\frac{\partial}{\partial x} + y\frac{\partial}{\partial y}\). Applying the formula:

\[
[R, D]^1 = R^1 \frac{\partial D^1}{\partial x} + R^2 \frac{\partial D^1}{\partial y} - D^1 \frac{\partial R^1}{\partial x} - D^2 \frac{\partial R^1}{\partial y} = (-y)(1) + (x)(0) - (x)(0) - (y)(-1) = -y + y = 0.
\]
Similarly \([R, D]^2 = 0\), so \([R, D] = 0\). This makes geometric sense: the flow of \(D\) is radial dilation \((x,y) \mapsto (e^t x, e^t y)\), the flow of \(R\) is rotation, and radial dilations and rotations commute.
</div>

### 4.5 Properties of the Lie Bracket

The Lie bracket satisfies three fundamental algebraic properties that make \(\Gamma(TM)\) into a Lie algebra.

<div class="theorem">
<strong>Theorem 4.9 (Properties of the Lie Bracket).</strong> For all \(X, Y, Z \in \Gamma(TM)\) and \(a, b \in \mathbb{R}\):
<ol>
<li><strong>Bilinearity</strong>: \([aX + bY, Z] = a[X,Z] + b[Y,Z]\) and \([Z, aX+bY] = a[Z,X] + b[Z,Y]\).</li>
<li><strong>Skew-symmetry (antisymmetry)</strong>: \([X, Y] = -[Y, X]\).</li>
<li><strong>Jacobi identity</strong>:
\[
[X, [Y, Z]] + [Y, [Z, X]] + [Z, [X, Y]] = 0.
\]</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> (1) and (2) are immediate from the definition \([X,Y]f = X(Yf) - Y(Xf)\).

(3) We verify the Jacobi identity by direct computation. For any \(f \in C^\infty(M)\):

\[
[X,[Y,Z]](f) = X([Y,Z]f) - [Y,Z](Xf) = X(Y(Zf)) - X(Z(Yf)) - Y(Z(Xf)) + Z(Y(Xf)).
\]
Similarly,

\[
[Y,[Z,X]](f) = Y(Z(Xf)) - Y(X(Zf)) - Z(X(Yf)) + X(Z(Yf)),
\]
\[
[Z,[X,Y]](f) = Z(X(Yf)) - Z(Y(Xf)) - X(Y(Zf)) + Y(X(Zf)).
\]
Adding all three expressions, every term cancels in pairs, giving \(0\). \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark.</strong> The Lie bracket also satisfies the following compatibility with the \(C^\infty(M)\)-module structure: for \(f, g \in C^\infty(M)\),
\[
[fX, gY] = fg[X,Y] + f(Xg)Y - g(Yf)X.
\]
This shows that the Lie bracket is <em>not</em> \(C^\infty(M)\)-bilinear — it is only \(\mathbb{R}\)-bilinear. The "error terms" involve derivatives of \(f\) and \(g\), reflecting the fact that the Lie bracket is a first-order differential operator in each argument.
</div>

### 4.6 The Lie Bracket and \(F\)-Relatedness

A crucial property of the Lie bracket is its naturality with respect to smooth maps: the bracket is preserved by \(F\)-relatedness.

<div class="theorem">
<strong>Theorem 4.10 (Lie Bracket Respects \(F\)-Relatedness).</strong> Let \(F \colon M \to N\) be a smooth map. If \(X_1, X_2 \in \Gamma(TM)\) are \(F\)-related to \(Y_1, Y_2 \in \Gamma(TN)\), respectively, then \([X_1, X_2]\) is \(F\)-related to \([Y_1, Y_2]\).
</div>

<div class="proof">
<strong>Proof.</strong> By Proposition 4.6, \(X_i\) is \(F\)-related to \(Y_i\) means \(X_i(g \circ F) = (Y_i g) \circ F\) for all \(g \in C^\infty(N)\). Then
\[
[X_1, X_2](g \circ F) = X_1(X_2(g \circ F)) - X_2(X_1(g \circ F))
\]
\[
= X_1((Y_2 g) \circ F) - X_2((Y_1 g) \circ F) = (Y_1(Y_2 g)) \circ F - (Y_2(Y_1 g)) \circ F = ([Y_1, Y_2]g) \circ F.
\]
By Proposition 4.6 again, \([X_1,X_2]\) is \(F\)-related to \([Y_1,Y_2]\). \(\blacksquare\)
</div>

<div class="corollary">
<strong>Corollary 4.11.</strong> If \(F \colon M \to N\) is a diffeomorphism, then \(F_<em>[X,Y] = [F_</em>X, F_*Y]\) for all \(X, Y \in \Gamma(TM)\). That is, the pushforward by a diffeomorphism is a <strong>Lie algebra homomorphism</strong>.
</div>

### 4.7 Lie Groups and Lie Algebras

We now develop one of the most beautiful applications of vector fields: the Lie algebra of a Lie group. The interplay between the group structure and the manifold structure gives rise to a finite-dimensional Lie algebra that encodes much of the group's structure.

<div class="definition">
<strong>Definition 4.12 (Lie Group).</strong> A <strong>Lie group</strong> is a smooth manifold \(G\) that is also a group, such that the multiplication map \(\mu \colon G \times G \to G\), \((g,h) \mapsto gh\), and the inversion map \(\iota \colon G \to G\), \(g \mapsto g^{-1}\), are smooth.
</div>

<div class="definition">
<strong>Definition 4.13 (Left Multiplication).</strong> For each \(g \in G\), the <strong>left multiplication</strong> (or <strong>left translation</strong>) by \(g\) is the map
\[
L_g \colon G \to G, \qquad L_g(h) = gh.
\]
Each \(L_g\) is a diffeomorphism with inverse \(L_{g^{-1}}\).
</div>

Since each \(L_g\) is a diffeomorphism, it induces an isomorphism \((L_g)_{*,h} \colon T_hG \to T_{gh}G\) at every point. This allows us to "translate" tangent vectors from one point to another, giving rise to a special class of vector fields.

<div class="definition">
<strong>Definition 4.14 (Left-Invariant Vector Field).</strong> A vector field \(X \in \Gamma(TG)\) is <strong>left-invariant</strong> if it is invariant under all left translations:
\[
(L_g)_* X = X \qquad \text{for all } g \in G.
\]
Equivalently, \((L_g)_{*,h}(X_h) = X_{gh}\) for all \(g, h \in G\).
</div>

The condition of left-invariance means that \(X\) is \(L_g\)-related to itself for every \(g\). This is an extremely rigid condition — it means the vector field is completely determined by its value at any single point.

<div class="proposition">
<strong>Proposition 4.15.</strong> The map \(\mathrm{ev}_e \colon \{\text{left-invariant vector fields on } G\} \to T_eG\) defined by \(\mathrm{ev}_e(X) = X_e\) is a linear isomorphism. Its inverse sends \(v \in T_eG\) to the left-invariant vector field \(\tilde{v}\) defined by
\[
\tilde{v}_g = (L_g)_{*,e}(v) \qquad \text{for all } g \in G.
\]
</div>

<div class="proof">
<strong>Proof.</strong> The map \(\mathrm{ev}_e\) is clearly linear. It is injective because a left-invariant vector field is determined by its value at \(e\) (since \(X_g = (L_g)_{<em>,e}(X_e)\) for all \(g\)). It is surjective because, given \(v \in T_eG\), the formula \(\tilde{v}_g = (L_g)_{</em>,e}(v)\) defines a left-invariant vector field (one must check smoothness, which follows from smoothness of the multiplication map). \(\blacksquare\)
</div>

<div class="definition">
<strong>Definition 4.16 (Lie Algebra of a Lie Group).</strong> The <strong>Lie algebra</strong> of a Lie group \(G\), denoted \(\mathfrak{g}\), is the vector space of all left-invariant vector fields on \(G\), equipped with the Lie bracket.
</div>

By Proposition 4.15, \(\mathfrak{g} \cong T_eG\) as a vector space, so \(\dim \mathfrak{g} = \dim G\). The key point is that the Lie bracket of two left-invariant vector fields is again left-invariant, so the bracket operation restricts to \(\mathfrak{g}\).

<div class="proposition">
<strong>Proposition 4.17.</strong> If \(X\) and \(Y\) are left-invariant vector fields on \(G\), then \([X, Y]\) is also left-invariant.
</div>

<div class="proof">
<strong>Proof.</strong> Since \(X\) is left-invariant, it is \(L_g\)-related to itself; similarly for \(Y\). By Theorem 4.10, \([X,Y]\) is \(L_g\)-related to \([X,Y]\), which means \((L_g)_*[X,Y] = [X,Y]\). Thus \([X,Y]\) is left-invariant. \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark.</strong> The Lie algebra \(\mathfrak{g}\) is therefore a finite-dimensional Lie algebra (a vector space with a bracket satisfying bilinearity, skew-symmetry, and the Jacobi identity). Via the identification \(\mathfrak{g} \cong T_eG\), the Lie bracket on \(\mathfrak{g}\) induces a bracket on \(T_eG\). For matrix groups, this bracket coincides with the matrix commutator \([A, B] = AB - BA\).
</div>

<div class="example">
<strong>Example 4.18 (Lie Algebras of Classical Groups).</strong>
<ul>
<li>For \(G = \mathrm{GL}(n, \mathbb{R})\), we have \(\mathfrak{gl}(n, \mathbb{R}) = M_{n \times n}(\mathbb{R})\) (all \(n \times n\) matrices), with bracket \([A, B] = AB - BA\).</li>
<li>For \(G = \mathrm{O}(n)\), the Lie algebra is \(\mathfrak{o}(n) = \{A \in M_{n \times n}(\mathbb{R}) : A^T + A = 0\}\), the space of skew-symmetric matrices, with dimension \(n(n-1)/2\).</li>
<li>For \(G = \mathrm{SO}(n)\), since \(\mathrm{SO}(n)\) is the identity component of \(\mathrm{O}(n)\), we have \(\mathfrak{so}(n) = \mathfrak{o}(n)\).</li>
<li>For \(G = \mathrm{U}(n)\), we have \(\mathfrak{u}(n) = \{A \in M_{n \times n}(\mathbb{C}) : A^* + A = 0\}\), the space of skew-Hermitian matrices, with real dimension \(n^2\).</li>
<li>For \(G = \mathrm{SU}(n)\), we have \(\mathfrak{su}(n) = \{A \in \mathfrak{u}(n) : \mathrm{tr}(A) = 0\}\), with dimension \(n^2 - 1\).</li>
</ul>
</div>

### 4.8 Lie Group Homomorphisms and Lie Algebra Homomorphisms

The correspondence between Lie groups and Lie algebras is functorial: smooth group homomorphisms induce Lie algebra homomorphisms.

<div class="definition">
<strong>Definition 4.19 (Lie Group Homomorphism).</strong> A <strong>Lie group homomorphism</strong> is a smooth map \(\Phi \colon G \to H\) between Lie groups that is also a group homomorphism: \(\Phi(g_1 g_2) = \Phi(g_1)\Phi(g_2)\) for all \(g_1, g_2 \in G\).
</div>

<div class="definition">
<strong>Definition 4.20 (Lie Algebra Homomorphism).</strong> A <strong>Lie algebra homomorphism</strong> is a linear map \(\phi \colon \mathfrak{g} \to \mathfrak{h}\) between Lie algebras satisfying \(\phi([X, Y]) = [\phi(X), \phi(Y)]\) for all \(X, Y \in \mathfrak{g}\).
</div>

<div class="theorem">
<strong>Theorem 4.21 (Induced Lie Algebra Homomorphism).</strong> Let \(\Phi \colon G \to H\) be a Lie group homomorphism. Then the pushforward at the identity,
\[
\Phi_{*,e} \colon T_eG \to T_eH,
\]
is a Lie algebra homomorphism from \(\mathfrak{g}\) to \(\mathfrak{h}\) (under the identifications \(\mathfrak{g} \cong T_eG\) and \(\mathfrak{h} \cong T_eH\)). This homomorphism is often denoted \(\mathrm{Lie}(\Phi)\) or \(d\Phi_e\).
</div>

<div class="proof">
<strong>Proof.</strong> We must show that if \(X, Y\) are left-invariant vector fields on \(G\), then the left-invariant vector fields on \(H\) corresponding to \(\Phi_{<em>,e}(X_e)\) and \(\Phi_{</em>,e}(Y_e)\) have bracket equal to the left-invariant vector field corresponding to \(\Phi_{*,e}([X,Y]_e)\).

The key observation is that because \(\Phi\) is a group homomorphism, we have \(\Phi \circ L_g = L_{\Phi(g)} \circ \Phi\) for all \(g \in G\). Taking the pushforward at \(h \in G\):

\[
\Phi_{<em>,gh} \circ (L_g)_{</em>,h} = (L_{\Phi(g)})_{<em>,\Phi(h)} \circ \Phi_{</em>,h}.
\]
In particular, if \(X\) is left-invariant on \(G\) and we define \(\tilde{X}\) on \(H\) by \(\tilde{X}_{\Phi(g)} = \Phi_{*,g}(X_g)\), then for any \(k = \Phi(g) \in \Phi(G)\):

\[
(L_k)_{<em>,e}(\Phi_{</em>,e}(X_e)) = (L_{\Phi(g)})_{<em>,e}(\Phi_{</em>,e}(X_e)) = \Phi_{<em>,g}((L_g)_{</em>,e}(X_e)) = \Phi_{*,g}(X_g).
\]
This shows \(X\) is \(\Phi\)-related to the left-invariant vector field \(\tilde{X}\) on \(H\) determined by \(\tilde{X}_e = \Phi_{*,e}(X_e)\). Similarly, \(Y\) is \(\Phi\)-related to \(\tilde{Y}\). By Theorem 4.10, \([X,Y]\) is \(\Phi\)-related to \([\tilde{X}, \tilde{Y}]\). Evaluating at \(e\):

\[
\Phi_{*,e}([X,Y]_e) = [\tilde{X}, \tilde{Y}]_e.
\]
This is exactly the statement that \(\Phi_{*,e}\) preserves Lie brackets. \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark.</strong> The assignment \(G \mapsto \mathfrak{g}\), \(\Phi \mapsto \Phi_{*,e}\) defines a functor from the category of Lie groups to the category of Lie algebras. This is the <strong>Lie functor</strong>. A deep theorem (the third fundamental theorem of Lie, refined by Cartan) states that every finite-dimensional Lie algebra over \(\mathbb{R}\) is the Lie algebra of some Lie group, and that connected, simply connected Lie groups are determined up to isomorphism by their Lie algebras. This correspondence is one of the cornerstones of modern mathematics.
</div>

<div class="example">
<strong>Example 4.22.</strong> The determinant map \(\det \colon \mathrm{GL}(n, \mathbb{R}) \to \mathbb{R}^* = \mathrm{GL}(1, \mathbb{R})\) is a Lie group homomorphism. Its induced Lie algebra homomorphism is the trace map \(\mathrm{tr} \colon \mathfrak{gl}(n, \mathbb{R}) \to \mathbb{R}\). Indeed, for any \(A \in \mathfrak{gl}(n, \mathbb{R})\), the curve \(\gamma(t) = I + tA\) has \(\gamma(0) = I\) and \(\gamma'(0) = A\), and \(\det(\gamma(t)) = 1 + t\,\mathrm{tr}(A) + O(t^2)\), so \(\frac{d}{dt}\big|_0 \det(\gamma(t)) = \mathrm{tr}(A)\). The kernel of \(\det\) is \(\mathrm{SL}(n, \mathbb{R})\), whose Lie algebra is \(\mathfrak{sl}(n, \mathbb{R}) = \ker(\mathrm{tr}) = \{A : \mathrm{tr}(A) = 0\}\).
</div>

<div class="example">
<strong>Example 4.23.</strong> The inclusion \(\iota \colon \mathrm{SO}(n) \hookrightarrow \mathrm{GL}(n, \mathbb{R})\) is a Lie group homomorphism. Its induced Lie algebra homomorphism is the inclusion \(\mathfrak{so}(n) \hookrightarrow \mathfrak{gl}(n, \mathbb{R})\), identifying \(\mathfrak{so}(n)\) with the Lie subalgebra of skew-symmetric matrices.
</div>

This concludes our development of the foundational machinery of smooth manifolds through Chapter 4. We have built up from the topological definition of a manifold, through smooth structures and maps, to the tangent bundle and vector fields, arriving at the Lie bracket and the Lie algebra of a Lie group. These structures form the backbone upon which all further topics in the course — submanifolds, immersions and submersions, flows, differential forms, integration, and de Rham cohomology — will be built.

---

## Chapter 5: Covectors and the Cotangent Bundle

### 5.1 Covectors and the Dual Space

Having developed the theory of tangent vectors and the tangent bundle in previous chapters, we now turn to the dual picture. In linear algebra, every vector space \( V \) has an associated **dual space** \( V^* \) consisting of all linear functionals on \( V \). When we apply this construction fibrewise to the tangent bundle of a smooth manifold, we obtain the **cotangent bundle**, whose sections are the **covector fields** or **1-forms**. This dual perspective is not merely an abstract curiosity: covector fields arise naturally whenever we take the differential of a smooth function, and they are the objects that can be integrated along curves. The interplay between vectors and covectors is one of the central themes of differential geometry.

Let \( V \) be a finite-dimensional real vector space. Recall from linear algebra:

<div class="definition">
<strong>Definition 5.1 (Dual Space).</strong> The <strong>dual space</strong> of \( V \), denoted \( V^<em> \), is the vector space of all linear maps \( \omega \colon V \to \mathbb{R} \). Elements of \( V^</em> \) are called <strong>covectors</strong>, <strong>linear functionals</strong>, or <strong>linear forms</strong> on \( V \).
</div>

![Covectors as hyperplanes: a covector ω in V* defines level sets (hyperplanes) in V, with ω(v) measuring how many hyperplanes the vector v crosses](/pics/pmath465/covector-hyperplanes.svg)

If \( V \) has dimension \( n \), then \( V^* \) also has dimension \( n \), though the two spaces are not canonically isomorphic (absent additional structure such as an inner product). Given a basis \( (e_1, \ldots, e_n) \) for \( V \), there is a uniquely determined **dual basis** \( (\varepsilon^1, \ldots, \varepsilon^n) \) for \( V^* \), characterised by the property

\[
\varepsilon^i(e_j) = \delta^i_j,
\]

where \( \delta^i_j \) is the Kronecker delta. Any covector \( \omega \in V^* \) can be expanded in the dual basis as \( \omega = \omega_i \, \varepsilon^i \) (using the Einstein summation convention), where \( \omega_i = \omega(e_i) \).

Now we bring this construction to manifolds. At each point \( p \) of a smooth manifold \( M \), the tangent space \( T_pM \) is a finite-dimensional real vector space, so we may form its dual.

<div class="definition">
<strong>Definition 5.2 (Cotangent Space).</strong> Let \( M \) be a smooth manifold and \( p \in M \). The <strong>cotangent space</strong> of \( M \) at \( p \) is the dual space
\[
T_p^<em>M = (T_pM)^</em>.
\]
Elements of \( T_p^*M \) are called <strong>tangent covectors</strong> at \( p \).
</div>

If \( (U, \varphi) \) is a smooth chart around \( p \) with coordinate functions \( (x^1, \ldots, x^n) \), then the coordinate vectors \( \left( \frac{\partial}{\partial x^1}\big|_p, \ldots, \frac{\partial}{\partial x^n}\big|_p \right) \) form a basis for \( T_pM \). The corresponding dual basis for \( T_p^*M \) is denoted \( (dx^1|_p, \ldots, dx^n|_p) \) and is characterised by

\[
dx^i|_p \left( \frac{\partial}{\partial x^j}\bigg|_p \right) = \delta^i_j.
\]

We shall see shortly that each \( dx^i|_p \) is in fact the differential of the coordinate function \( x^i \) at the point \( p \), which justifies the notation. Any covector \( \omega \in T_p^*M \) can be written as

\[
\omega = \omega_i \, dx^i|_p, \qquad \text{where } \omega_i = \omega\!\left( \frac{\partial}{\partial x^i}\bigg|_p \right).
\]

The components \( \omega_i \) carry a **lower index**, in contrast to the upper-indexed components \( v^i \) of a tangent vector \( v = v^i \frac{\partial}{\partial x^i}\big|_p \). This notational convention is deliberate and reflects the transformation laws: under a change of coordinates \( \tilde{x}^j = \tilde{x}^j(x^1, \ldots, x^n) \), the covector components transform **covariantly**:

\[
\tilde{\omega}_j = \frac{\partial x^i}{\partial \tilde{x}^j} \, \omega_i,
\]

whereas the tangent vector components transform **contravariantly**. The natural pairing \( \omega(v) = \omega_i v^i \) is coordinate-independent precisely because these two transformation laws compensate one another.

### 5.2 The Cotangent Bundle

Just as we assembled all tangent spaces into the tangent bundle \( TM \), we now assemble all cotangent spaces into a single object.

<div class="definition">
<strong>Definition 5.3 (Cotangent Bundle).</strong> The <strong>cotangent bundle</strong> of a smooth \( n \)-manifold \( M \) is the disjoint union
\[
T^<em>M = \bigsqcup_{p \in M} T_p^</em>M = \{ (p, \omega) : p \in M, \, \omega \in T_p^*M \}.
\]
It carries a natural projection \( \pi \colon T^*M \to M \) defined by \( \pi(p, \omega) = p \).
</div>

<div class="proposition">
<strong>Proposition 5.4.</strong> If \( M \) is a smooth \( n \)-manifold, then \( T^<em>M \) has a natural structure as a smooth \( 2n \)-manifold, and the projection \( \pi \colon T^</em>M \to M \) is a smooth surjective map. Moreover, \( T^*M \) is a smooth vector bundle of rank \( n \) over \( M \).
</div>

The smooth structure is constructed exactly as for the tangent bundle. Given a smooth chart \( (U, \varphi) \) for \( M \) with coordinates \( (x^1, \ldots, x^n) \), we define a chart \( (\pi^{-1}(U), \tilde{\varphi}) \) for \( T^*M \) by

\[
\tilde{\varphi}(p, \omega_i \, dx^i|_p) = (x^1(p), \ldots, x^n(p), \omega_1, \ldots, \omega_n) \in \mathbb{R}^{2n}.
\]

The first \( n \) coordinates locate the base point \( p \) in \( M \), while the last \( n \) coordinates record the components of the covector in the dual basis. The transition functions between overlapping charts are smooth, yielding the desired smooth structure on \( T^*M \).

![The cotangent bundle T*M: a fibre bundle over M with each fibre T_p*M the dual of the tangent space](/pics/pmath465/cotangent-bundle.svg)

The cotangent bundle plays a fundamental role in Hamiltonian mechanics, where the phase space of a classical mechanical system is naturally \( T^*M \) rather than \( TM \). It also carries a canonical symplectic structure (the canonical 2-form), though we will not develop this in the present course.

To see why \(T^*M\) is the natural home for Hamiltonian mechanics rather than \(TM\): the momentum of a particle is not a velocity vector (contravariant object) but rather a linear functional on velocity space — it tells you how much kinetic energy a unit velocity in a given direction generates. More precisely, for a Lagrangian \(L \colon TM \to \mathbb{R}\), the **Legendre transform** sends a tangent vector \((q, \dot{q}) \in TM\) to the covector \(p = \frac{\partial L}{\partial \dot{q}} \in T^*_q M\), and the Hamiltonian \(H \colon T^*M \to \mathbb{R}\) is defined by \(H(q, p) = p(\dot{q}) - L(q, \dot{q})\). Hamilton's equations then become the flow of the Hamiltonian vector field on \(T^*M\), which is symplectic. The canonical 1-form \(\lambda = p_i\,dq^i\) (the tautological 1-form, or Liouville form) on \(T^*M\) and the canonical symplectic form \(\omega = -d\lambda = dq^i \wedge dp_i\) are intrinsic structures that exist on any cotangent bundle and require no additional geometric input.

### 5.3 Covector Fields and 1-Forms

<div class="definition">
<strong>Definition 5.5 (Covector Field / 1-Form).</strong> A <strong>covector field</strong> (or <strong>1-form</strong>) on \( M \) is a smooth section of the cotangent bundle, i.e., a smooth map \( \omega \colon M \to T^*M \) such that \( \pi \circ \omega = \mathrm{id}_M \). The space of all smooth 1-forms on \( M \) is denoted
\[
\Omega^1(M) = \Gamma(T^*M).
\]
</div>

In local coordinates \( (x^1, \ldots, x^n) \) on an open set \( U \subseteq M \), a 1-form \( \omega \) can be written as

\[
\omega = \omega_i \, dx^i,
\]

where the component functions \( \omega_i \colon U \to \mathbb{R} \) are smooth. The space \( \Omega^1(M) \) is a module over the ring \( C^\infty(M) \): we can add 1-forms and multiply them by smooth functions pointwise.

Covector fields act on vector fields to produce smooth functions. If \( \omega \in \Omega^1(M) \) and \( X \in \mathfrak{X}(M) \), then the function \( \omega(X) \colon M \to \mathbb{R} \) defined by

\[
\omega(X)(p) = \omega_p(X_p)
\]

is smooth. In local coordinates, if \( X = X^j \frac{\partial}{\partial x^j} \), then

\[
\omega(X) = \omega_i \, X^i.
\]

This pairing \( \Omega^1(M) \times \mathfrak{X}(M) \to C^\infty(M) \) is \( C^\infty(M) \)-bilinear and is sometimes called the **natural pairing** or **contraction**.

### 5.4 The Differential of a Smooth Function

The most natural and important source of covector fields is the differential of a smooth function. This is a coordinate-free operation that generalises the classical gradient.

<div class="definition">
<strong>Definition 5.6 (Differential of a Function).</strong> Let \( f \in C^\infty(M) \). The <strong>differential</strong> of \( f \) is the 1-form \( df \in \Omega^1(M) \) defined by
\[
(df)_p(X_p) = X_p f
\]
for all \( p \in M \) and \( X_p \in T_pM \). Equivalently, for any smooth vector field \( X \in \mathfrak{X}(M) \),

\[
df(X) = Xf.
\]
</div>

![The differential df as level sets of f: df_p maps tangent vectors to the rate of change of f, with level sets of f shown as curves on the manifold](/pics/pmath465/differential-level-sets.svg)

In words, \( df \) at a point \( p \) eats a tangent vector and returns the directional derivative of \( f \) in that direction. This is entirely coordinate-free. Let us now compute \( df \) in local coordinates.

<div class="proposition">
<strong>Proposition 5.7 (Local Expression for \( df \)).</strong> Let \( (U, (x^1, \ldots, x^n)) \) be a smooth chart on \( M \). For any \( f \in C^\infty(M) \),
\[
df = \frac{\partial f}{\partial x^i} \, dx^i
\]
on \( U \).
</div>

<div class="proof">
<strong>Proof.</strong> We must show that both sides agree when applied to any basis vector field \( \frac{\partial}{\partial x^j} \). On one hand,
\[
df\!\left( \frac{\partial}{\partial x^j} \right) = \frac{\partial f}{\partial x^j}.
\]
On the other hand,

\[
\frac{\partial f}{\partial x^i} \, dx^i\!\left( \frac{\partial}{\partial x^j} \right) = \frac{\partial f}{\partial x^i} \, \delta^i_j = \frac{\partial f}{\partial x^j}. \qquad \square
\]
</div>

This proposition shows that the notation \( dx^i \) for the dual basis elements is consistent: \( dx^i \) is literally the differential of the coordinate function \( x^i \).

<div class="example">
<strong>Example 5.8.</strong> Consider \( f \colon \mathbb{R}^3 \to \mathbb{R} \) given by \( f(x, y, z) = x^2 y + e^z \). Then
\[
df = 2xy \, dx + x^2 \, dy + e^z \, dz.
\]
</div>

<div class="example">
<strong>Example 5.9.</strong> Let \( M = S^2 \) with the spherical coordinate chart \( (\theta, \phi) \) (where \( \theta \) is the polar angle and \( \phi \) is the azimuthal angle). If \( h \colon S^2 \to \mathbb{R} \) is the height function \( h = \cos \theta \), then
\[
dh = -\sin\theta \, d\theta.
\]
The vanishing of the \( d\phi \) component reflects the rotational symmetry of the height function about the vertical axis.
</div>

The differential satisfies the following algebraic properties, all immediate from the definition.

<div class="proposition">
<strong>Proposition 5.10.</strong> The map \( d \colon C^\infty(M) \to \Omega^1(M) \) is \( \mathbb{R} \)-linear and satisfies the <strong>Leibniz rule</strong> (product rule):
\[
d(fg) = f \, dg + g \, df
\]
for all \( f, g \in C^\infty(M) \). Moreover, if \( c \in \mathbb{R} \) is a constant function, then \( dc = 0 \).
</div>

The differential \( d \colon C^\infty(M) \to \Omega^1(M) \) is a fundamental example of a **derivation** from the algebra \( C^\infty(M) \) to the module \( \Omega^1(M) \). Later, when we develop differential forms in full generality, we will extend \( d \) to the **exterior derivative** \( d \colon \Omega^k(M) \to \Omega^{k+1}(M) \).

### 5.5 Pullback of Covectors and 1-Forms

One of the most important features distinguishing covectors from vectors is that covectors can be **pulled back** by smooth maps. Recall that a smooth map \( F \colon M \to N \) induces a **pushforward** \( F_{*,p} \colon T_pM \to T_{F(p)}N \) on tangent vectors. In general, there is no way to push forward a vector field from \( M \) to \( N \) unless \( F \) is a diffeomorphism. However, the dual operation — the **pullback** — goes in the opposite direction and is always well-defined for covectors.

<div class="definition">
<strong>Definition 5.11 (Pullback of a Covector).</strong> Let \( F \colon M \to N \) be a smooth map, and let \( p \in M \). The <strong>pullback</strong> (or <strong>codifferential</strong>) at \( p \) is the linear map
\[
F^<em> \colon T_{F(p)}^</em>N \to T_p^*M
\]
defined by

\[
(F^<em>\omega)(X_p) = \omega(F_{</em>,p} X_p)
\]
for all \( \omega \in T_{F(p)}^*N \) and \( X_p \in T_pM \).
</div>

![Pullback of a covector: F* sends covectors at F(p) in N back to covectors at p in M, reversing the direction of the pushforward](/pics/pmath465/pullback-covector.svg)

Note the directions carefully: the pushforward goes "forward" from \( T_pM \) to \( T_{F(p)}N \), while the pullback goes "backward" from \( T_{F(p)}^*N \) to \( T_p^*M \). This is the standard contravariance of the dual space construction in linear algebra.

<div class="remark">
<strong>Remark 5.12.</strong> In terms of the transpose (adjoint) of a linear map, \( F^<em> = (F_{</em>,p})^T \). That is, the pullback is the transpose of the pushforward, which is the standard construction of the dual map in linear algebra.
</div>

The pointwise pullback extends to 1-forms: if \( \omega \) is a 1-form on \( N \), we define the **pullback 1-form** \( F^*\omega \) on \( M \) by

\[
(F^*\omega)_p = F^*(\omega_{F(p)}) \qquad \text{for all } p \in M.
\]

More explicitly, for any vector field \( X \in \mathfrak{X}(M) \),

\[
(F^*\omega)(X)(p) = \omega_{F(p)}(F_{*,p} X_p).
\]

The following proposition lists the key properties of pullback.

<div class="proposition">
<strong>Proposition 5.13 (Properties of Pullback).</strong> Let \( F \colon M \to N \) be a smooth map. Then:
<ol>
<li>\( F^* \colon \Omega^1(N) \to \Omega^1(M) \) is \( \mathbb{R} \)-linear.</li>
<li>\( F^<em>(h\omega) = (h \circ F)(F^</em>\omega) \) for all \( h \in C^\infty(N) \), \( \omega \in \Omega^1(N) \).</li>
<li><strong>Naturality with respect to \( d \):</strong> \( F^*(dh) = d(h \circ F) \) for all \( h \in C^\infty(N) \).</li>
<li>If \( G \colon N \to P \) is another smooth map, then \( (G \circ F)^<em> = F^</em> \circ G^* \).</li>
<li>\( (\mathrm{id}_M)^* = \mathrm{id}_{\Omega^1(M)} \).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> We prove property (3), the naturality with respect to \( d \), as it is the most important. For any \( p \in M \) and \( X_p \in T_pM \),
\[
(F^<em>(dh))_p(X_p) = (dh)_{F(p)}(F_{</em>,p}X_p) = (F_{*,p}X_p)(h) = X_p(h \circ F) = d(h \circ F)_p(X_p).
\]
Since this holds for all \( X_p \), we conclude \( F^*(dh) = d(h \circ F) \). The other properties are straightforward. \( \square \)
</div>

Property (3) is extremely useful in computations. It tells us that pulling back a differential is the same as first composing with \( F \) and then taking the differential. In particular, for coordinate functions \( y^j \) on \( N \) and a smooth map \( F \colon M \to N \) written in coordinates as \( y^j = F^j(x^1, \ldots, x^m) \):

\[
F^*(dy^j) = d(y^j \circ F) = dF^j = \frac{\partial F^j}{\partial x^i} \, dx^i.
\]

This gives a practical recipe for computing pullbacks of arbitrary 1-forms. If \( \omega = \omega_j \, dy^j \) on \( N \), then

\[
F^*\omega = (\omega_j \circ F) \frac{\partial F^j}{\partial x^i} \, dx^i.
\]

<div class="example">
<strong>Example 5.14.</strong> Let \( F \colon \mathbb{R}^2 \to \mathbb{R}^3 \) be given by \( F(s,t) = (s^2, st, t^2) \), and let \( \omega = z \, dx + x \, dy - y \, dz \) be a 1-form on \( \mathbb{R}^3 \). We compute the pullback \( F^*\omega \). We have \( x = s^2, y = st, z = t^2 \), so:
\[
F^<em>(dx) = d(s^2) = 2s \, ds, \qquad F^</em>(dy) = d(st) = t \, ds + s \, dt, \qquad F^*(dz) = d(t^2) = 2t \, dt.
\]
Therefore,

\[
F^*\omega = t^2(2s \, ds) + s^2(t \, ds + s \, dt) - st(2t \, dt) = (2st^2 + s^2 t) \, ds + (s^3 - 2st^2) \, dt.
\]
</div>

### 5.6 Line Integrals of Covector Fields

One of the key motivations for studying covector fields is that they are the natural objects to integrate along curves. This should be contrasted with vector fields, which cannot be integrated along curves in a coordinate-independent way without additional structure (such as a Riemannian metric).

<div class="definition">
<strong>Definition 5.15 (Line Integral of a Covector Field).</strong> Let \( \omega \) be a smooth covector field on \( M \), and let \( \gamma \colon [a, b] \to M \) be a smooth curve. The <strong>line integral</strong> of \( \omega \) along \( \gamma \) is
\[
\int_\gamma \omega = \int_a^b \omega_{\gamma(t)}(\gamma'(t)) \, dt.
\]
</div>

![Line integral of a covector field along a curve: the covector ω is evaluated on the velocity vector γ'(t) at each point and integrated](/pics/pmath465/line-integral-covector.svg)

In local coordinates, if \( \omega = \omega_i \, dx^i \) and \( \gamma(t) = (x^1(t), \ldots, x^n(t)) \), then

\[
\int_\gamma \omega = \int_a^b \omega_i(\gamma(t)) \frac{dx^i}{dt} \, dt.
\]

This is a coordinate-independent quantity: one can verify directly that the integral does not depend on the choice of coordinates, because the transformation laws for covector components and tangent vector components cancel. This is precisely why 1-forms (not vector fields) are the correct objects to integrate along curves.

The line integral is also invariant under orientation-preserving reparametrisation of the curve, and reverses sign under orientation-reversing reparametrisation.

<div class="example">
<strong>Example 5.15a (Explicit line integral computation).</strong> Let \(M = \mathbb{R}^2 \setminus \{0\}\) and consider the 1-form
\[
\omega = \frac{-y\,dx + x\,dy}{x^2+y^2}.
\]
We compute the line integral of \(\omega\) along the unit circle \(\gamma \colon [0, 2\pi] \to \mathbb{R}^2\), \(\gamma(t) = (\cos t, \sin t)\). We have \(\gamma'(t) = (-\sin t, \cos t)\), so

\[
\omega_{\gamma(t)}(\gamma'(t)) = \frac{-\sin t \cdot (-\sin t) + \cos t \cdot \cos t}{\cos^2 t + \sin^2 t} = \frac{\sin^2 t + \cos^2 t}{1} = 1.
\]
Therefore

\[
\int_\gamma \omega = \int_0^{2\pi} 1\,dt = 2\pi.
\]
Now suppose instead we take the straight-line path \(\sigma \colon [0,1] \to \mathbb{R}^2 \setminus \{0\}\), \(\sigma(t) = (1, t)\) from \((1,0)\) to \((1,1)\). Then \(\sigma'(t) = (0,1)\), and

\[
\omega_{\sigma(t)}(\sigma'(t)) = \frac{-t \cdot 0 + 1 \cdot 1}{1 + t^2} = \frac{1}{1+t^2},
\]
so \(\int_\sigma \omega = \int_0^1 \frac{dt}{1+t^2} = \arctan(1) - \arctan(0) = \pi/4\).

These two computations illustrate an important point: the value of \(\int_\gamma \omega\) depends on the path, not just the endpoints, because \(\omega\) is closed but not exact on \(\mathbb{R}^2 \setminus \{0\}\). On the contractible domain \(\mathbb{R}^2 \setminus \{(-\infty, 0]\}\) (for instance), \(\omega\) equals \(d(\text{arg})\) where \(\text{arg}\) is the argument function, so the integral is path-independent there. But on the full punctured plane, the winding number of the path around the origin contributes multiples of \(2\pi\) to the integral.
</div>

<div class="theorem">
<strong>Theorem 5.16 (Fundamental Theorem for Line Integrals).</strong> If \( f \in C^\infty(M) \) and \( \gamma \colon [a,b] \to M \) is a smooth curve, then
\[
\int_\gamma df = f(\gamma(b)) - f(\gamma(a)).
\]
</div>

<div class="proof">
<strong>Proof.</strong> By the chain rule,
\[
\int_\gamma df = \int_a^b (df)_{\gamma(t)}(\gamma'(t)) \, dt = \int_a^b \frac{d}{dt}(f \circ \gamma)(t) \, dt = f(\gamma(b)) - f(\gamma(a)). \qquad \square
\]
</div>

This is the manifold generalisation of the fundamental theorem of calculus, and it tells us that the line integral of an exact 1-form depends only on the endpoints.

### 5.7 Conservative Covector Fields, Exact and Closed 1-Forms

The fundamental theorem for line integrals motivates the following important notions.

<div class="definition">
<strong>Definition 5.17 (Exact and Closed 1-Forms).</strong> A 1-form \( \omega \in \Omega^1(M) \) is called:
<ul>
<li><strong>exact</strong> if \( \omega = df \) for some \( f \in C^\infty(M) \); the function \( f \) is called a <strong>potential</strong> for \( \omega \);</li>
<li><strong>closed</strong> if, in every smooth chart \( (U, (x^1, \ldots, x^n)) \), we have
\[
\frac{\partial \omega_i}{\partial x^j} = \frac{\partial \omega_j}{\partial x^i} \qquad \text{for all } i, j.
\]</li>
</ul>
</div>

<div class="definition">
<strong>Definition 5.18 (Conservative Covector Field).</strong> A covector field \( \omega \in \Omega^1(M) \) is <strong>conservative</strong> if for every pair of points \( p, q \in M \), the line integral \( \int_\gamma \omega \) has the same value for all piecewise smooth curves \( \gamma \) from \( p \) to \( q \). Equivalently, \( \omega \) is conservative if \( \oint_\gamma \omega = 0 \) for every piecewise smooth closed curve \( \gamma \).
</div>

These three properties are related as follows.

<div class="theorem">
<strong>Theorem 5.19.</strong> Let \( \omega \) be a smooth covector field on a smooth manifold \( M \). Then:
<ol>
<li>If \( \omega \) is exact, then \( \omega \) is conservative.</li>
<li>If \( \omega \) is conservative, then \( \omega \) is exact.</li>
<li>If \( \omega \) is exact, then \( \omega \) is closed.</li>
</ol>
Thus, exactness and conservativeness are equivalent, and both imply closedness.
</div>

<div class="proof">
<strong>Proof.</strong> Statement (1) follows directly from the fundamental theorem for line integrals. For (2), if \( \omega \) is conservative, we fix a point \( p_0 \in M \) and define \( f(p) = \int_\gamma \omega \) where \( \gamma \) is any piecewise smooth curve from \( p_0 \) to \( p \). (On each connected component, we choose a basepoint; if \( M \) is connected, one basepoint suffices.) The independence of path guarantees that \( f \) is well-defined. One then verifies that \( f \) is smooth and \( df = \omega \) by computing in local coordinates. Statement (3) follows from the equality of mixed partials: if \( \omega = df \), then
\[
\frac{\partial \omega_i}{\partial x^j} = \frac{\partial^2 f}{\partial x^j \partial x^i} = \frac{\partial^2 f}{\partial x^i \partial x^j} = \frac{\partial \omega_j}{\partial x^i}. \qquad \square
\]
</div>

The converse of (3) — "every closed 1-form is exact" — is **not** true in general. Whether it holds depends on the topology of \( M \).

<div class="example">
<strong>Example 5.20.</strong> On \( \mathbb{R}^2 \setminus \{0\} \), the 1-form
\[
\omega = \frac{-y \, dx + x \, dy}{x^2 + y^2}
\]
is closed (as one can verify by direct computation) but <strong>not</strong> exact. Indeed, integrating \( \omega \) around the unit circle gives \( 2\pi \neq 0 \). On the other hand, locally (say on the upper half-plane), \( \omega = d(\arctan(y/x)) \), so \( \omega \) is locally exact. The obstruction to global exactness is the nontrivial first de Rham cohomology group \( H^1_{\mathrm{dR}}(\mathbb{R}^2 \setminus \{0\}) \cong \mathbb{R} \).
</div>

![A closed but not exact 1-form on the punctured plane: the angle form dθ is closed but its integral around the origin is 2π](/pics/pmath465/closed-not-exact-form.svg)

The quotient space \( H^1_{\mathrm{dR}}(M) = \ker d / \operatorname{im} d \) (closed 1-forms modulo exact 1-forms) is the **first de Rham cohomology group** of \( M \). It is a topological invariant that measures the extent to which closed forms can fail to be exact. The Poincare lemma asserts that on contractible domains (such as \( \mathbb{R}^n \) or any open ball), every closed form is exact. We will return to this in a later chapter.

---

## Chapter 6: Submersions, Immersions, and Embeddings

### 6.1 Maps of Constant Rank

In multivariable calculus, the behaviour of a smooth map \( F \colon \mathbb{R}^m \to \mathbb{R}^n \) near a point is governed by the rank of its Jacobian matrix. The same principle carries over to smooth manifolds via the differential \( F_{*,p} \colon T_pM \to T_{F(p)}N \). In this chapter, we study the key classes of smooth maps — submersions, immersions, and embeddings — and develop the fundamental rank theorems that reveal their local structure. These results are indispensable tools for constructing new manifolds from old ones, particularly through the regular level set theorem.

<div class="definition">
<strong>Definition 6.1 (Rank of a Smooth Map).</strong> Let \( F \colon M \to N \) be a smooth map between smooth manifolds. The <strong>rank</strong> of \( F \) at \( p \in M \) is the rank of the linear map \( F_{*,p} \colon T_pM \to T_{F(p)}N \), that is,
\[
\operatorname{rank}_p F = \dim F_{<em>,p}(T_pM) = \operatorname{rank}(F_{</em>,p}).
\]
If \( \dim M = m \) and \( \dim N = n \), then \( 0 \le \operatorname{rank}_p F \le \min(m, n) \).
</div>

In local coordinates, the rank of \( F \) at \( p \) is just the rank of the Jacobian matrix \( \left( \frac{\partial F^j}{\partial x^i}(p) \right) \). The rank is a lower semicontinuous function of \( p \): if \( F \) has rank \( r \) at \( p \), then \( F \) has rank at least \( r \) at all nearby points.

<div class="definition">
<strong>Definition 6.2.</strong> A smooth map \( F \colon M \to N \) is said to have <strong>constant rank</strong> \( r \) if \( \operatorname{rank}_p F = r \) for every \( p \in M \). It is said to have <strong>constant rank on a subset</strong> \( S \subseteq M \) if the rank is the same at all points of \( S \).
</div>

We now define the three principal classes of smooth maps based on their rank.

### 6.2 Submersions

<div class="definition">
<strong>Definition 6.3 (Submersion).</strong> A smooth map \( F \colon M^m \to N^n \) is a <strong>submersion</strong> if \( F_{*,p} \) is surjective for every \( p \in M \). Equivalently, \( F \) has constant rank \( n = \dim N \) everywhere. (This requires \( m \ge n \).)
</div>

Submersions are the smooth analogues of "onto" linear maps. The defining condition — surjectivity of the differential everywhere — guarantees that the map locally looks like a projection. This is made precise by the following theorem.

<div class="theorem">
<strong>Theorem 6.4 (Local Submersion Theorem / Canonical Form for Submersions).</strong> Let \( F \colon M^m \to N^n \) be a smooth submersion. For every \( p \in M \), there exist smooth charts \( (U, \varphi) \) centred at \( p \) and \( (V, \psi) \) centred at \( F(p) \) such that the coordinate representation of \( F \) is
\[
\hat{F}(x^1, \ldots, x^m) = (x^1, \ldots, x^n).
\]
That is, in suitable coordinates, a submersion is just a projection onto the first \( n \) coordinates.
</div>

<div class="proof">
<strong>Proof.</strong> This is a consequence of the inverse function theorem. After choosing initial charts and performing a linear change of coordinates on the domain, we may assume that the Jacobian matrix of \( \hat{F} \) at the origin has its first \( n \) rows forming a nonsingular \( n \times n \) block. Define \( \Phi \colon \mathbb{R}^m \to \mathbb{R}^m \) by
\[
\Phi(x^1, \ldots, x^m) = (\hat{F}^1(x), \ldots, \hat{F}^n(x), x^{n+1}, \ldots, x^m).
\]
The Jacobian of \( \Phi \) at the origin is nonsingular (it has the Jacobian of \( \hat{F} \) in its first \( n \) rows and the identity in the last \( m - n \) rows, with suitable structure), so by the inverse function theorem, \( \Phi \) is a local diffeomorphism. Replacing the chart on \( M \) by the composition with \( \Phi^{-1} \) gives the desired canonical form. \( \square \)
</div>

![Local submersion theorem: in suitable coordinates, a submersion looks like a projection (x^1,...,x^m) ↦ (x^1,...,x^n)](/pics/pmath465/submersion-projection.svg)

An important consequence of the local submersion theorem is:

<div class="corollary">
<strong>Corollary 6.5.</strong> Every submersion is an open map. In particular, every surjective submersion is a quotient map.
</div>

<div class="example">
<strong>Example 6.6.</strong> The projection \( \pi \colon \mathbb{R}^{m+n} \to \mathbb{R}^n \) given by \( \pi(x^1, \ldots, x^{m+n}) = (x^1, \ldots, x^n) \) is a submersion. More generally, the projection from any smooth vector bundle to its base is a smooth submersion.
</div>

<div class="example">
<strong>Example 6.7.</strong> The determinant map \( \det \colon \mathrm{GL}(n, \mathbb{R}) \to \mathbb{R} \setminus \{0\} \) is a smooth submersion. To see this, consider the curve \( t \mapsto tA \) in \( \mathrm{GL}(n, \mathbb{R}) \) for a fixed \( A \), and compute \( \frac{d}{dt}\det(tA)\big|_{t=1} = n \det A \neq 0 \). (A more careful argument uses directional derivatives along rank-1 perturbations.)
</div>

### 6.3 Immersions

<div class="definition">
<strong>Definition 6.8 (Immersion).</strong> A smooth map \( F \colon M^m \to N^n \) is an <strong>immersion</strong> if \( F_{*,p} \) is injective for every \( p \in M \). Equivalently, \( F \) has constant rank \( m = \dim M \) everywhere. (This requires \( m \le n \).)
</div>

![Local immersion theorem: in suitable coordinates, an immersion looks like the inclusion (x^1,...,x^m) ↦ (x^1,...,x^m,0,...,0)](/pics/pmath465/immersion-inclusion.svg)

An immersion need not be injective as a map of sets — only the differential is required to be injective at every point. Immersions locally look like inclusions, as the following theorem makes precise.

<div class="theorem">
<strong>Theorem 6.9 (Local Immersion Theorem / Canonical Form for Immersions).</strong> Let \( F \colon M^m \to N^n \) be a smooth immersion. For every \( p \in M \), there exist smooth charts \( (U, \varphi) \) centred at \( p \) and \( (V, \psi) \) centred at \( F(p) \) such that the coordinate representation of \( F \) is
\[
\hat{F}(x^1, \ldots, x^m) = (x^1, \ldots, x^m, 0, \ldots, 0).
\]
That is, in suitable coordinates, an immersion is just the inclusion \( \mathbb{R}^m \hookrightarrow \mathbb{R}^n \) as the first \( m \) coordinate axes.
</div>

<div class="proof">
<strong>Proof.</strong> By choosing coordinates appropriately, we may assume \( p = 0 \in \mathbb{R}^m \) and \( F(0) = 0 \in \mathbb{R}^n \), and that the first \( m \) rows of the Jacobian are linearly independent. Define \( \Psi \colon \mathbb{R}^m \times \mathbb{R}^{n-m} \to \mathbb{R}^n \) by
\[
\Psi(x^1, \ldots, x^m, x^{m+1}, \ldots, x^n) = \hat{F}(x^1, \ldots, x^m) + (0, \ldots, 0, x^{m+1}, \ldots, x^n).
\]
The Jacobian of \( \Psi \) at \( 0 \) is nonsingular, so \( \Psi \) is a local diffeomorphism by the inverse function theorem. Replacing the chart on \( N \) by the composition with \( \Psi^{-1} \) gives the desired canonical form. \( \square \)
</div>

<div class="example">
<strong>Example 6.10.</strong> The figure-eight curve \( \gamma \colon (-\pi, \pi) \to \mathbb{R}^2 \) defined by \( \gamma(t) = (\sin 2t, \sin t) \) is an immersion (since \( \gamma'(t) \neq 0 \) for all \( t \)), but it is <strong>not</strong> injective as a map: the image crosses itself at the origin. Hence an immersion need not be an embedding.
</div>

![The figure-eight curve in R^2: an immersion with a self-intersection at the origin](/pics/pmath465/figure-eight-immersion.svg)

### 6.4 Smooth Embeddings

The notion of immersion is too weak for many purposes. For example, we want to define submanifolds as images of maps that are both immersions and well-behaved topologically. This leads to the notion of embedding.

<div class="definition">
<strong>Definition 6.11 (Smooth Embedding).</strong> A smooth map \( F \colon M \to N \) is a <strong>smooth embedding</strong> if it is an injective immersion that is also a homeomorphism onto its image \( F(M) \subseteq N \) (with the subspace topology inherited from \( N \)).
</div>

In other words, a smooth embedding is an immersion that is also a topological embedding. The condition of being a homeomorphism onto the image excludes self-intersections and also excludes curves that "accumulate on themselves" (such as an injective immersion of \( \mathbb{R} \) whose image is dense in the torus).

<div class="remark">
<strong>Remark 6.12.</strong> An injective immersion from a compact manifold is automatically an embedding. This is because a continuous bijection from a compact space to a Hausdorff space is a homeomorphism. Thus, if \( M \) is compact, the topological embedding condition is automatic.
</div>

<div class="example">
<strong>Example 6.13.</strong> The inclusion \( \iota \colon S^n \hookrightarrow \mathbb{R}^{n+1} \) is a smooth embedding. The sphere inherits its standard smooth structure from this embedding.
</div>

<div class="example">
<strong>Example 6.14.</strong> Consider the map \( \gamma \colon \mathbb{R} \to \mathbb{T}^2 \) (where \( \mathbb{T}^2 = S^1 \times S^1 \) is the 2-torus) given by \( \gamma(t) = (e^{2\pi i t}, e^{2\pi i \alpha t}) \) for some irrational \( \alpha \). This is an injective immersion (since \( \gamma'(t) \neq 0 \) everywhere and injectivity follows from the irrationality of \( \alpha \)). However, the image is <strong>dense</strong> in \( \mathbb{T}^2 \), so \( \gamma \) is not a homeomorphism onto its image (its image in the subspace topology is not homeomorphic to \( \mathbb{R} \)). Thus \( \gamma \) is an injective immersion that is <strong>not</strong> an embedding.
</div>

![A curve of irrational slope on the torus: the image winds densely around T^2 without closing up](/pics/pmath465/irrational-slope-torus.svg)

### 6.5 The Constant Rank Theorem

The local submersion and immersion theorems are special cases of a more general result.

<div class="theorem">
<strong>Theorem 6.15 (Constant Rank Theorem).</strong> Let \( F \colon M^m \to N^n \) be a smooth map of constant rank \( r \) (i.e., \( \operatorname{rank}_p F = r \) for all \( p \in M \)). Then for each \( p \in M \), there exist smooth charts \( (U, \varphi) \) centred at \( p \) and \( (V, \psi) \) centred at \( F(p) \) in which \( F \) has the coordinate representation
\[
\hat{F}(x^1, \ldots, x^m) = (x^1, \ldots, x^r, 0, \ldots, 0).
\]
</div>

When \( r = n \), this reduces to the local submersion theorem; when \( r = m \), it reduces to the local immersion theorem. The constant rank theorem is a powerful tool, but its hypothesis — that the rank is constant on all of \( M \) — is quite restrictive. In practice, one often only needs the rank to be constant on a neighbourhood of a point, or one uses the following local version.

<div class="corollary">
<strong>Corollary 6.16 (Local Constant Rank Theorem).</strong> If \( F \colon M \to N \) is a smooth map and \( \operatorname{rank}_p F = r \) at some point \( p \in M \), then there is a neighbourhood \( U \) of \( p \) on which \( F|_U \) has rank at least \( r \). If moreover \( \operatorname{rank}_q F = r \) for all \( q \) in some neighbourhood of \( p \), then the conclusion of the constant rank theorem holds at \( p \).
</div>

### 6.6 Level Sets and the Regular Level Set Theorem

One of the most important applications of the submersion theorem is to the study of level sets. Many naturally occurring manifolds — spheres, orthogonal groups, and more — arise as level sets of smooth maps.

<div class="definition">
<strong>Definition 6.17 (Regular Value, Critical Point).</strong> Let \( F \colon M \to N \) be a smooth map.
<ul>
<li>A point \( p \in M \) is a <strong>regular point</strong> of \( F \) if \( F_{*,p} \) is surjective, and a <strong>critical point</strong> otherwise.</li>
<li>A point \( c \in N \) is a <strong>regular value</strong> of \( F \) if every point in the preimage \( F^{-1}(c) \) is a regular point. (In particular, if \( F^{-1}(c) = \emptyset \), then \( c \) is a regular value vacuously.)</li>
<li>A point \( c \in N \) is a <strong>critical value</strong> if it is not a regular value.</li>
</ul>
</div>

<div class="theorem">
<strong>Theorem 6.18 (Regular Level Set Theorem / Preimage Theorem).</strong> Let \( F \colon M^m \to N^n \) be a smooth map, and let \( c \in N \) be a regular value of \( F \). Then the level set \( F^{-1}(c) \), if nonempty, is a properly embedded smooth submanifold of \( M \) of dimension \( m - n \).
</div>

<div class="proof">
<strong>Proof (sketch).</strong> Since \( c \) is a regular value, \( F_{*,p} \) is surjective at every \( p \in F^{-1}(c) \). Thus \( F \) is a submersion at every such \( p \). By the local submersion theorem, there are coordinates \( (x^1, \ldots, x^m) \) near \( p \) and \( (y^1, \ldots, y^n) \) near \( c \) in which \( F \) is the projection \( (x^1, \ldots, x^m) \mapsto (x^1, \ldots, x^n) \). The level set \( F^{-1}(c) \) in these coordinates is the set \( \{ x^1 = c^1, \ldots, x^n = c^n \} \), which is a coordinate slice of dimension \( m - n \). These coordinate slices provide charts making \( F^{-1}(c) \) into a smooth manifold. \( \square \)
</div>

![Regular level set theorem: the preimage F^{-1}(c) of a regular value c is a smooth submanifold of codimension equal to dim N](/pics/pmath465/regular-level-set.svg)

Moreover, the tangent space to the level set at any point \( p \in F^{-1}(c) \) is precisely the kernel of the differential:

<div class="proposition">
<strong>Proposition 6.19.</strong> If \( c \) is a regular value of \( F \colon M \to N \) and \( S = F^{-1}(c) \), then for each \( p \in S \),
\[
T_p S = \ker F_{<em>,p} = \{ v \in T_pM : F_{</em>,p}(v) = 0 \}.
\]
</div>

This provides a practical way to compute tangent spaces to manifolds defined as level sets: one simply computes the kernel of the Jacobian.

<div class="example">
<strong>Example 6.20 (\( S^n \) as a Regular Level Set).</strong> Define \( f \colon \mathbb{R}^{n+1} \to \mathbb{R} \) by \( f(x) = |x|^2 = (x^1)^2 + \cdots + (x^{n+1})^2 \). Then
\[
df_x = 2x^1 \, dx^1 + \cdots + 2x^{n+1} \, dx^{n+1} = 2x^i \, dx^i.
\]
At any point \( x \neq 0 \), the differential \( df_x \) is surjective (it is a nonzero linear map to \( \mathbb{R} \)), so every nonzero real number is a regular value. In particular, \( 1 \) is a regular value, and

\[
S^n = f^{-1}(1)
\]
is a smooth \( n \)-dimensional submanifold of \( \mathbb{R}^{n+1} \). The tangent space at \( p \in S^n \) is

\[
T_p S^n = \ker df_p = \{ v \in \mathbb{R}^{n+1} : \sum_{i=1}^{n+1} p^i v^i = 0 \} = p^\perp,
\]
the orthogonal complement of \( p \) in \( \mathbb{R}^{n+1} \).
</div>

![The sphere S^n as a regular level set of f(x) = |x|^2, with the tangent space T_pS^n equal to the orthogonal complement p^⊥](/pics/pmath465/sphere-level-set.svg)

<div class="example">
<strong>Example 6.21 (\( O(n) \) as a Regular Level Set).</strong> Define \( \Phi \colon M(n, \mathbb{R}) \to \operatorname{Sym}(n, \mathbb{R}) \) by \( \Phi(A) = A^T A \), where \( \operatorname{Sym}(n, \mathbb{R}) \) is the space of symmetric \( n \times n \) matrices (a vector space of dimension \( n(n+1)/2 \)). The orthogonal group is
\[
O(n) = \Phi^{-1}(I_n).
\]
One computes \( \Phi_{<em>,A}(B) = B^T A + A^T B \). When \( A \in O(n) \), this becomes \( \Phi_{</em>,A}(B) = B^T A + A^T B \). For any symmetric matrix \( S \), the matrix \( B = \frac{1}{2}AS \) satisfies \( \Phi_{<em>,A}(B) = S \), so \( \Phi_{</em>,A} \) is surjective. Hence \( I_n \) is a regular value, and \( O(n) \) is a smooth submanifold of \( M(n, \mathbb{R}) \cong \mathbb{R}^{n^2} \) of dimension

\[
\dim O(n) = n^2 - \frac{n(n+1)}{2} = \frac{n(n-1)}{2}.
\]
The tangent space at the identity is

\[
T_I O(n) = \ker \Phi_{*,I} = \{ B \in M(n, \mathbb{R}) : B^T + B = 0 \} = \mathfrak{o}(n),
\]
the space of skew-symmetric matrices.
</div>

<div class="example">
<strong>Example 6.22 (\( SL(n, \mathbb{R}) \) as a Regular Level Set).</strong> The special linear group \( SL(n, \mathbb{R}) = \det^{-1}(1) \) is a regular level set of the determinant map \( \det \colon GL(n, \mathbb{R}) \to \mathbb{R} \setminus \{0\} \), which is a submersion (Example 6.7). Hence \( SL(n, \mathbb{R}) \) is a smooth submanifold of \( GL(n, \mathbb{R}) \) of dimension \( n^2 - 1 \), with tangent space at the identity equal to the space of traceless matrices.
</div>

The regular level set theorem, combined with Sard's theorem (which states that the set of critical values has measure zero), tells us that "most" level sets of a smooth map are smooth submanifolds.

---

## Chapter 7: Submanifolds

### 7.1 Embedded Submanifolds

The notion of submanifold gives a rigorous framework for studying lower-dimensional smooth objects sitting inside ambient manifolds. There are two important flavours of submanifold — embedded and immersed — reflecting the distinction between embeddings and immersions from the previous chapter. Embedded submanifolds are the more well-behaved class and suffice for most applications.

<div class="definition">
<strong>Definition 7.1 (Embedded Submanifold).</strong> Let \( M \) be a smooth manifold of dimension \( n \). A subset \( S \subseteq M \) is an <strong>embedded submanifold</strong> (or <strong>regular submanifold</strong>) of dimension \( k \) if for every point \( p \in S \), there exists a smooth chart \( (U, \varphi) \) for \( M \) centred at \( p \) such that
\[
\varphi(U \cap S) = \{ (x^1, \ldots, x^n) \in \varphi(U) : x^{k+1} = \cdots = x^n = 0 \}.
\]
Such a chart is called a <strong>slice chart</strong> (or <strong>adapted chart</strong>, or <strong>submanifold chart</strong>) for \( S \) in \( M \), and the set \( U \cap S \) is called a <strong>slice</strong> of \( U \). The number \( n - k \) is the <strong>codimension</strong> of \( S \) in \( M \).
</div>

![A slice chart: coordinates for M in which the submanifold S appears as a flat slice where the last n-k coordinates vanish](/pics/pmath465/slice-chart.svg)

The idea behind the slice chart condition is simple: near any point of \( S \), we can find coordinates for \( M \) in which \( S \) is "flat" — it is carved out by setting the last \( n - k \) coordinates to zero. This is the strongest and most natural notion of submanifold.

<div class="proposition">
<strong>Proposition 7.2.</strong> Every embedded submanifold \( S \subseteq M \) of dimension \( k \) is itself a smooth \( k \)-manifold in a natural way: the smooth structure on \( S \) is given by the atlas of slice charts \( \{ (U \cap S, \varphi|_{U \cap S}) \} \), where each chart maps into \( \mathbb{R}^k \) by projection onto the first \( k \) coordinates. Moreover, with this smooth structure, the inclusion map \( \iota \colon S \hookrightarrow M \) is a smooth embedding.
</div>

The topology on an embedded submanifold \( S \) is the subspace topology inherited from \( M \). This is an important point: an embedded submanifold is required to have the subspace topology, not some other topology that might make the inclusion continuous.

<div class="proposition">
<strong>Proposition 7.3.</strong> Let \( S \subseteq M \) be an embedded submanifold. Then \( S \) is a closed subset of \( M \) if and only if the inclusion \( \iota \colon S \hookrightarrow M \) is a proper map.
</div>

<div class="example">
<strong>Example 7.4.</strong> An open subset \( U \subseteq M \) is an embedded submanifold of dimension \( n = \dim M \) (a codimension-0 submanifold). The slice charts are simply the charts of \( M \) whose domains are contained in \( U \).
</div>

<div class="example">
<strong>Example 7.5.</strong> By the regular level set theorem (Theorem 6.18), if \( F \colon M \to N \) is a smooth map and \( c \in N \) is a regular value, then \( F^{-1}(c) \) is an embedded submanifold. The sphere \( S^n \subset \mathbb{R}^{n+1} \) and the orthogonal group \( O(n) \subset M(n, \mathbb{R}) \) are examples obtained this way.
</div>

### 7.2 Slice Charts and Local Structure

The slice chart condition can be reformulated in several equivalent ways, each useful in different contexts.

<div class="theorem">
<strong>Theorem 7.6 (Local Slice Criterion).</strong> Let \( S \subseteq M^n \) be a subset. The following are equivalent:
<ol>
<li>\( S \) is a \( k \)-dimensional embedded submanifold of \( M \).</li>
<li>For every \( p \in S \), there is a neighbourhood \( U \) of \( p \) in \( M \) and a smooth submersion \( \Phi \colon U \to \mathbb{R}^{n-k} \) such that \( U \cap S = \Phi^{-1}(0) \).</li>
<li>For every \( p \in S \), there is a neighbourhood \( U \) of \( p \) in \( M \) and smooth functions \( \Phi^1, \ldots, \Phi^{n-k} \colon U \to \mathbb{R} \) such that \( U \cap S = \{ q \in U : \Phi^1(q) = \cdots = \Phi^{n-k}(q) = 0 \} \) and \( d\Phi^1|_p, \ldots, d\Phi^{n-k}|_p \) are linearly independent in \( T_p^*M \).</li>
</ol>
</div>

Condition (3) gives a very practical way to verify that a subset is an embedded submanifold: one exhibits defining functions whose differentials are independent. This is exactly the setup of the implicit function theorem.

### 7.3 Immersed Submanifolds

There is a more general notion of submanifold that arises from immersions rather than embeddings.

<div class="definition">
<strong>Definition 7.7 (Immersed Submanifold).</strong> An <strong>immersed submanifold</strong> of \( M \) is a subset \( S \subseteq M \) together with a topology on \( S \) (possibly different from the subspace topology) and a smooth structure making \( S \) into a smooth manifold, such that the inclusion \( \iota \colon S \hookrightarrow M \) is a smooth immersion.
</div>

Every embedded submanifold is an immersed submanifold (with the subspace topology), but the converse is false. The distinction is subtle but important: an immersed submanifold may have a topology that is finer than the subspace topology.

![Embedded vs immersed submanifolds: an embedded submanifold has the subspace topology, while an immersed one may not](/pics/pmath465/embedded-vs-immersed.svg)

<div class="example">
<strong>Example 7.8.</strong> The figure-eight curve in \( \mathbb{R}^2 \) (the image of the immersion from Example 6.10) is an immersed submanifold that is <strong>not</strong> an embedded submanifold: near the crossing point, no single chart for \( \mathbb{R}^2 \) can present the figure-eight as a flat slice.
</div>

<div class="example">
<strong>Example 7.9.</strong> The dense curve on the torus from Example 6.14 is an immersed submanifold (diffeomorphic to \( \mathbb{R} \)), but it is not an embedded submanifold because its image is dense in \( \mathbb{T}^2 \), so it does not have the subspace topology.
</div>

![Dense curve on the torus: an immersed submanifold whose image fills the torus densely, failing to be embedded](/pics/pmath465/dense-curve-torus.svg)

Despite these pathologies, immersed submanifolds arise naturally in several important contexts, particularly in the theory of Lie groups.

### 7.4 Tangent Space to a Submanifold

If \( S \subseteq M \) is an embedded (or immersed) submanifold and \( \iota \colon S \hookrightarrow M \) is the inclusion, then the differential \( \iota_{*,p} \colon T_pS \to T_pM \) is injective (since \( \iota \) is an immersion). We routinely identify \( T_pS \) with its image \( \iota_{*,p}(T_pS) \subseteq T_pM \), treating \( T_pS \) as a linear subspace of \( T_pM \).

<div class="proposition">
<strong>Proposition 7.10.</strong> Let \( S \subseteq M \) be an embedded submanifold, and let \( (U, \varphi) \) be a slice chart for \( S \) centred at \( p \in S \), with coordinates \( (x^1, \ldots, x^n) \). Under the identification \( T_pS \subseteq T_pM \),
\[
T_pS = \operatorname{span}\left\{ \frac{\partial}{\partial x^1}\bigg|_p, \ldots, \frac{\partial}{\partial x^k}\bigg|_p \right\},
\]
where \( k = \dim S \). That is, \( T_pS \) is the subspace of \( T_pM \) spanned by the coordinate directions tangent to the slice.
</div>

When \( S = F^{-1}(c) \) is a regular level set, we have already seen (Proposition 6.19) that \( T_pS = \ker F_{*,p} \). These two descriptions are consistent: in a slice chart adapted to the level set, the tangent directions to \( S \) are precisely those annihilated by the differential of \( F \).

### 7.5 Restricting Maps to Submanifolds

A key practical question is: if \( F \colon M \to N \) is a smooth map and \( S \subseteq M \), \( T \subseteq N \) are submanifolds with \( F(S) \subseteq T \), is the restricted map \( F|_S \colon S \to T \) smooth?

<div class="proposition">
<strong>Proposition 7.11.</strong> Let \( F \colon M \to N \) be a smooth map, and let \( S \subseteq M \) be an embedded or immersed submanifold with inclusion \( \iota_S \colon S \hookrightarrow M \). Then the restricted map \( F \circ \iota_S \colon S \to N \) is smooth.
</div>

This is immediate since the composition of smooth maps is smooth. The more subtle question is about restricting the codomain:

<div class="theorem">
<strong>Theorem 7.12.</strong> Let \( F \colon M \to N \) be a smooth map, and let \( S \subseteq N \) be an <strong>embedded</strong> submanifold. If \( F(M) \subseteq S \), then \( F \colon M \to S \) is smooth (where \( S \) has its submanifold smooth structure).
</div>

<div class="proof">
<strong>Proof.</strong> Let \( p \in M \), and let \( (V, \psi) \) be a slice chart for \( S \) in \( N \) around \( F(p) \), with \( \psi = (y^1, \ldots, y^n) \) and \( S \cap V = \{ y^{k+1} = \cdots = y^n = 0 \} \). Since \( F(M) \subseteq S \), the last \( n - k \) components of \( \psi \circ F \) vanish identically, and the first \( k \) components give the coordinate representation of \( F \colon M \to S \). Since each component is smooth (being a component of the smooth map \( \psi \circ F \)), the map \( F \colon M \to S \) is smooth. \( \square \)
</div>

<div class="remark">
<strong>Remark 7.13.</strong> The analogous statement for immersed submanifolds is <strong>false</strong> in general. If \( S \subseteq N \) is merely immersed, the map \( F \colon M \to S \) may fail to be continuous (let alone smooth) with respect to the topology of \( S \). This is one of the reasons embedded submanifolds are preferred in many situations.
</div>

### 7.6 Lie Subgroups

The theory of submanifolds is particularly important in the context of Lie groups, where it provides a clean framework for studying subgroups.

<div class="definition">
<strong>Definition 7.14 (Lie Subgroup).</strong> A <strong>Lie subgroup</strong> of a Lie group \( G \) is a subgroup \( H \subseteq G \) that is also an immersed submanifold of \( G \), such that the group operations (multiplication and inversion) are smooth with respect to the smooth structure on \( H \).
</div>

If \( H \) is an embedded submanifold, it is called a **closed Lie subgroup** or **regular Lie subgroup**.

<div class="theorem">
<strong>Theorem 7.15 (Closed Subgroup Theorem / Cartan's Theorem).</strong> Every closed subgroup of a Lie group is an embedded Lie subgroup. In particular, it is automatically a smooth submanifold, and the group operations are automatically smooth.
</div>

This theorem is remarkable because it requires no smoothness hypothesis: one starts with a purely algebraic and topological condition (closed subgroup) and obtains a smooth structure for free. We used this implicitly in Examples 6.21 and 6.22: both \( O(n) \) and \( SL(n, \mathbb{R}) \) are closed subgroups of \( GL(n, \mathbb{R}) \), so Cartan's theorem guarantees they are Lie subgroups. (We verified this independently using the regular level set theorem.)

<div class="example">
<strong>Example 7.16.</strong> The special orthogonal group \( SO(n) = O(n) \cap SL(n, \mathbb{R}) \) is a closed subgroup of \( GL(n, \mathbb{R}) \), hence a Lie subgroup. It is the connected component of the identity in \( O(n) \), and has dimension \( n(n-1)/2 \).
</div>

<div class="example">
<strong>Example 7.17.</strong> The unitary group \( U(n) = \{ A \in GL(n, \mathbb{C}) : A^*A = I \} \) is a closed subgroup of \( GL(n, \mathbb{C}) \), hence a compact Lie group of real dimension \( n^2 \). Similarly, \( SU(n) = U(n) \cap SL(n, \mathbb{C}) \) has real dimension \( n^2 - 1 \).
</div>

<div class="example">
<strong>Example 7.18.</strong> The irrational-slope line on the torus \( \mathbb{T}^2 \) from Example 6.14 is an immersed Lie subgroup (isomorphic to \( (\mathbb{R}, +) \)) that is dense, hence <strong>not</strong> closed and <strong>not</strong> an embedded submanifold. This shows that the hypothesis of closedness in Cartan's theorem is necessary.
</div>

### 7.7 The Whitney Embedding Theorem

One of the most fundamental — and reassuring — results in the theory of smooth manifolds is that every abstract smooth manifold can be faithfully realised as a submanifold of some Euclidean space. This is the content of Whitney's embedding theorems. From a foundational perspective the result tells us that the category of smooth manifolds is no larger than the category of smooth submanifolds of \(\mathbb{R}^N\); the abstract definition we have been using all along does not secretly produce "exotic" objects that cannot be concretely visualised.

We distinguish two versions, which differ markedly in difficulty.

<div class="theorem">
<strong>Theorem 7.19 (Whitney Weak Embedding Theorem, 1944).</strong> Every smooth \( n \)-manifold admits a smooth embedding into \( \mathbb{R}^{2n+1} \).
</div>

<div class="theorem">
<strong>Theorem 7.20 (Whitney Strong Embedding Theorem, 1944).</strong> Every smooth \( n \)-manifold admits a smooth embedding into \( \mathbb{R}^{2n} \).
</div>

The strong theorem is essentially sharp: \( \mathbb{RP}^2 \) does not embed in \( \mathbb{R}^3 \), confirming that \( 2n \) cannot in general be reduced to \( 2n - 1 \).

**Proof strategy for the weak theorem.** The argument for Theorem 7.19 proceeds in two main steps.

*Step 1: Constructing an injective immersion into some \( \mathbb{R}^N \).* Since \( M \) is second countable, it admits a countable atlas \(\{(U_\alpha, \varphi_\alpha)\}\). Using a **partition of unity** \(\{\rho_\alpha\}\) subordinate to this cover, one defines a map \( F \colon M \to \mathbb{R}^N \) (for sufficiently large \( N \)) by assembling the locally-defined data \( \rho_\alpha \varphi_\alpha \) into a single globally-defined map. One verifies that \( F \) is an injective immersion: injectivity follows from the identity of the partition of unity, and the immersion property (injectivity of \( dF_p \) for all \( p \)) follows because at least one bump function \( \rho_\alpha \) is nonzero near each point, making the derivative of the local coordinate factor injective.

*Step 2: Reducing the target dimension to \( 2n+1 \) via Sard's theorem.* At this stage \( N \) may be very large. The reduction is achieved by repeatedly projecting onto hyperplanes. For a unit vector \( v \in \mathbb{R}^N \), consider the orthogonal projection \( \pi_v \colon \mathbb{R}^N \to v^\perp \cong \mathbb{R}^{N-1} \). The composition \( \pi_v \circ F \) is still an injective immersion provided \( v \) is not in the **secant variety** \(\{ \frac{F(p) - F(q)}{|F(p)-F(q)|} : p \neq q \}\) (which has dimension \( 2n < N-1 \) for \( N > 2n+1 \)) and not in the **tangential variety** \(\{ dF_p(w)/|dF_p(w)| : w \in T_pM \setminus \{0\} \}\) (dimension \( 2n-1 \)). By **Sard's theorem**, the set of "bad" directions has measure zero in \( S^{N-1} \), so almost every projection is still an injective immersion. Iterating this argument reduces \( N \) to \( 2n+1 \). If \( M \) is compact, injectivity of \( F \) together with compactness automatically makes \( F \) a proper embedding.

<div class="remark">
<strong>Remark.</strong> For non-compact \( M \), one additionally arranges properness by multiplying by a proper smooth function (an exhaustion function), ensuring that the image is a closed submanifold and not merely an injectively immersed one.
</div>

**The strong theorem and Whitney's trick.** Reducing the target dimension from \( 2n+1 \) to \( 2n \) requires a fundamentally different argument. The projection trick can still eliminate one more dimension at the immersion level — by Sard's theorem, a generic projection of an injective immersion into \( \mathbb{R}^{2n+1} \) yields an immersion into \( \mathbb{R}^{2n} \) — but the resulting map may no longer be injective: it can have a finite number of transverse double points (self-intersections). Whitney's celebrated **Whitney trick** (or **Whitney's cancellation lemma**) is a delicate geometric manoeuvre that eliminates pairs of self-intersection points by constructing an embedded "Whitney disc" and performing a controlled isotopy along it. The argument works in full generality only when \( n \geq 2 \) (for \( n = 1 \), smooth curves in \( \mathbb{R}^2 \) need not embed, but they do embed in \( \mathbb{R}^2 = \mathbb{R}^{2 \cdot 1} \) by a separate argument). The Whitney trick is also one of the key tools in Smale's proof of the \( h \)-cobordism theorem and in surgery theory.

<div class="corollary">
<strong>Corollary 7.21.</strong> Every compact smooth \( n \)-manifold is diffeomorphic to a compact embedded submanifold of \( \mathbb{R}^{2n} \). In particular, every compact smooth manifold admits a Riemannian metric (induced from the standard inner product on the ambient Euclidean space).
</div>

<div class="proof">
<strong>Proof.</strong> By Theorem 7.20, there exists a smooth embedding \( F \colon M \hookrightarrow \mathbb{R}^{2n} \). Since \( M \) is compact, \( F \) is automatically proper, so \( F(M) \) is a compact embedded submanifold of \( \mathbb{R}^{2n} \), and \( F \) is a diffeomorphism onto its image. The pullback \( F^* g_{\text{Eucl}} \) of the standard metric is a Riemannian metric on \( M \).
</div>

<div class="remark">
<strong>Remark (Existence of Riemannian metrics via partitions of unity).</strong> In fact, one does not need the Whitney theorem to construct Riemannian metrics: a direct partition-of-unity argument on any second-countable smooth manifold produces a Riemannian metric without first embedding into Euclidean space. The corollary above instead highlights the geometric content — every compact manifold sits inside a standard Euclidean space in a globally well-behaved way.
</div>

---

## Chapter 8: Tensors and Riemannian Metrics

### 8.1 Multilinear Algebra: Tensor Products

We now develop the algebraic machinery of tensors, which provides the natural framework for defining Riemannian metrics and many other geometric structures on manifolds. A tensor is, at its core, a multilinear map. The passage from linear algebra (vectors and covectors) to multilinear algebra (tensors) vastly expands the kinds of geometric objects we can work with.

Let \( V \) be a finite-dimensional real vector space with dual space \( V^* \).

<div class="definition">
<strong>Definition 8.1 (Tensor Product of Vector Spaces).</strong> If \( V_1, \ldots, V_r \) are finite-dimensional real vector spaces, their <strong>tensor product</strong> \( V_1 \otimes \cdots \otimes V_r \) is the vector space characterised (up to canonical isomorphism) by the universal property: there is a multilinear map
\[
\iota \colon V_1 \times \cdots \times V_r \to V_1 \otimes \cdots \otimes V_r
\]
such that for every multilinear map \( \alpha \colon V_1 \times \cdots \times V_r \to W \) into any vector space \( W \), there is a unique linear map \( \tilde{\alpha} \colon V_1 \otimes \cdots \otimes V_r \to W \) with \( \alpha = \tilde{\alpha} \circ \iota \).
</div>

![The tensor product: a bilinear map from V × W factors uniquely through V ⊗ W via the universal property](/pics/pmath465/tensor-product.svg)

The image \( \iota(v_1, \ldots, v_r) \) is denoted \( v_1 \otimes \cdots \otimes v_r \) and is called a **decomposable** (or **simple**) tensor. Not every element of the tensor product is decomposable; a general element is a sum of decomposable tensors.

If \( (e_1, \ldots, e_n) \) is a basis for \( V \) and \( (f_1, \ldots, f_m) \) is a basis for \( W \), then \( \{ e_i \otimes f_j : 1 \le i \le n, \, 1 \le j \le m \} \) is a basis for \( V \otimes W \), so \( \dim(V \otimes W) = nm \). More generally, \( \dim(V_1 \otimes \cdots \otimes V_r) = \prod_i \dim V_i \).

### 8.2 Tensors on a Vector Space

In the context of tangent spaces, we form tensor products of copies of \( V = T_pM \) and its dual \( V^* = T_p^*M \).

<div class="definition">
<strong>Definition 8.2 (Mixed Tensors).</strong> A tensor of <strong>type \( (k, \ell) \)</strong> (or a <strong>\( (k, \ell) \)-tensor</strong>) on a vector space \( V \) is an element of
\[
T^{(k,\ell)}(V) = \underbrace{V^<em> \otimes \cdots \otimes V^</em>}_{k} \otimes \underbrace{V \otimes \cdots \otimes V}_{\ell}.
\]
Equivalently, a \( (k, \ell) \)-tensor is a multilinear map

\[
\sigma \colon \underbrace{V \times \cdots \times V}_{k} \times \underbrace{V^<em> \times \cdots \times V^</em>}_{\ell} \to \mathbb{R}.
\]
The number \( k \) is the <strong>covariant order</strong> (number of "covector slots") and \( \ell \) is the <strong>contravariant order</strong> (number of "vector slots"). The sum \( k + \ell \) is the <strong>total order</strong> of the tensor.
</div>

<div class="remark">
<strong>Remark 8.3 (Convention).</strong> There is an unfortunate disagreement in the literature about whether a \( (k, \ell) \)-tensor eats \( k \) vectors and \( \ell \) covectors, or vice versa. We follow the convention of Lee and Karigiannis: a \( (k, \ell) \)-tensor \( \sigma \in T^{(k,\ell)}(V) = (V^*)^{\otimes k} \otimes V^{\otimes \ell} \) eats \( k \) vectors and \( \ell \) covectors. In particular:
<ul>
<li>\( T^{(0,0)}(V) = \mathbb{R} \) (scalars)</li>
<li>\( T^{(1,0)}(V) = V^* \) (covectors / linear forms)</li>
<li>\( T^{(0,1)}(V) = V \) (vectors)</li>
<li>\( T^{(1,1)}(V) = V^* \otimes V \cong \operatorname{End}(V) \) (linear endomorphisms)</li>
<li>\( T^{(2,0)}(V) = V^<em> \otimes V^</em> \) (bilinear forms)</li>
</ul>
</div>

The space \( T^{(k,\ell)}(V) \) has dimension \( n^{k+\ell} \) where \( n = \dim V \). Given a basis \( (e_1, \ldots, e_n) \) for \( V \) with dual basis \( (\varepsilon^1, \ldots, \varepsilon^n) \) for \( V^* \), a general \( (k, \ell) \)-tensor can be written as

\[
\sigma = \sigma^{j_1 \cdots j_\ell}_{i_1 \cdots i_k} \, \varepsilon^{i_1} \otimes \cdots \otimes \varepsilon^{i_k} \otimes e_{j_1} \otimes \cdots \otimes e_{j_\ell},
\]

where the components are given by

\[
\sigma^{j_1 \cdots j_\ell}_{i_1 \cdots i_k} = \sigma(e_{i_1}, \ldots, e_{i_k}, \varepsilon^{j_1}, \ldots, \varepsilon^{j_\ell}).
\]

The Einstein summation convention (sum over repeated upper-lower index pairs) makes these expressions manageable. Upper indices correspond to contravariant (vector) slots, and lower indices correspond to covariant (covector) slots.

### 8.3 Tensor Bundles and Tensor Fields

We now globalise the construction by assembling tensors over all points of a manifold into a bundle.

<div class="definition">
<strong>Definition 8.4 (Tensor Bundle).</strong> Let \( M \) be a smooth \( n \)-manifold. The <strong>tensor bundle of type \( (k, \ell) \)</strong> is
\[
T^{(k,\ell)}M = \bigsqcup_{p \in M} T^{(k,\ell)}(T_pM) = \bigsqcup_{p \in M} \big( (T_p^*M)^{\otimes k} \otimes (T_pM)^{\otimes \ell} \big).
\]
It is a smooth vector bundle over \( M \) of rank \( n^{k+\ell} \), so \( T^{(k,\ell)}M \) is a smooth manifold of dimension \( n + n^{k+\ell} \).
</div>

<div class="definition">
<strong>Definition 8.5 (Tensor Field).</strong> A <strong>tensor field of type \( (k, \ell) \)</strong> on \( M \) is a smooth section of the tensor bundle \( T^{(k,\ell)}M \). The space of all smooth \( (k, \ell) \)-tensor fields on \( M \) is denoted
\[
\Gamma(T^{(k,\ell)}M) = \mathcal{T}^{k}_{\ell}(M).
\]
</div>

In local coordinates \( (x^1, \ldots, x^n) \) on an open set \( U \subseteq M \), a \( (k, \ell) \)-tensor field \( \sigma \) can be written as

\[
\sigma = \sigma^{j_1 \cdots j_\ell}_{i_1 \cdots i_k} \, dx^{i_1} \otimes \cdots \otimes dx^{i_k} \otimes \frac{\partial}{\partial x^{j_1}} \otimes \cdots \otimes \frac{\partial}{\partial x^{j_\ell}},
\]

where the component functions \( \sigma^{j_1 \cdots j_\ell}_{i_1 \cdots i_k} \colon U \to \mathbb{R} \) are smooth. The tensor product of two tensor fields is defined pointwise:

\[
(\sigma \otimes \tau)_p = \sigma_p \otimes \tau_p.
\]

This makes the collection of all tensor fields into a graded algebra over \( C^\infty(M) \).

<div class="example">
<strong>Example 8.6.</strong> Some important special cases:
<ul>
<li>\( \mathcal{T}^0_0(M) = C^\infty(M) \): smooth functions.</li>
<li>\( \mathcal{T}^1_0(M) = \Omega^1(M) \): covector fields (1-forms).</li>
<li>\( \mathcal{T}^0_1(M) = \mathfrak{X}(M) \): vector fields.</li>
<li>\( \mathcal{T}^2_0(M) \): covariant 2-tensor fields (bilinear forms on vector fields). Riemannian metrics and Ricci curvature tensors live here.</li>
<li>\( \mathcal{T}^1_1(M) \): mixed \( (1,1) \)-tensor fields, corresponding to smooth endomorphism fields \( \operatorname{End}(TM) \). Complex structures and almost complex structures are examples.</li>
</ul>
</div>

### 8.4 Symmetry and Alternation

Many of the most important tensors in geometry possess symmetry properties.

<div class="definition">
<strong>Definition 8.7 (Symmetric and Alternating Tensors).</strong> A covariant \( k \)-tensor \( \sigma \in T^{(k,0)}(V) \) is:
<ul>
<li><strong>symmetric</strong> if \( \sigma(v_1, \ldots, v_k) \) is unchanged under any permutation of its arguments;</li>
<li><strong>alternating</strong> (or <strong>skew-symmetric</strong>, or <strong>antisymmetric</strong>) if \( \sigma(v_1, \ldots, v_k) \) changes sign under any transposition of two arguments.</li>
</ul>
The space of symmetric covariant \( k \)-tensors is denoted \( \Sigma^k(V^<em>) \), and the space of alternating covariant \( k \)-tensors is denoted \( \Lambda^k(V^</em>) \).
</div>

There are natural projection operators:

<div class="definition">
<strong>Definition 8.8 (Symmetrisation and Alternation).</strong> For \( \sigma \in T^{(k,0)}(V) \), define:
<ul>
<li>The <strong>symmetrisation</strong>: \( (\operatorname{Sym} \sigma)(v_1, \ldots, v_k) = \frac{1}{k!} \sum_{\pi \in S_k} \sigma(v_{\pi(1)}, \ldots, v_{\pi(k)}) \).</li>
<li>The <strong>alternation</strong>: \( (\operatorname{Alt} \sigma)(v_1, \ldots, v_k) = \frac{1}{k!} \sum_{\pi \in S_k} (\operatorname{sgn} \pi) \, \sigma(v_{\pi(1)}, \ldots, v_{\pi(k)}) \).</li>
</ul>
These are projections: \( \operatorname{Sym}^2 = \operatorname{Sym} \) and \( \operatorname{Alt}^2 = \operatorname{Alt} \).
</div>

The alternating tensors \( \Lambda^k(V^*) \) are the building blocks of **differential forms** (the subject of a later chapter). For now, the symmetric tensors \( \Sigma^k(V^*) \) are more immediately relevant, as Riemannian metrics are symmetric \( (2,0) \)-tensor fields.

For a 2-tensor \( \sigma \in T^{(2,0)}(V) \), symmetry means \( \sigma(v, w) = \sigma(w, v) \) for all \( v, w \), and skew-symmetry means \( \sigma(v, w) = -\sigma(w, v) \). Every 2-tensor decomposes uniquely as a sum of a symmetric part and a skew-symmetric part:

\[
\sigma = \operatorname{Sym}(\sigma) + \operatorname{Alt}(\sigma), \qquad \text{where} \quad \operatorname{Sym}(\sigma)(v,w) = \tfrac{1}{2}(\sigma(v,w) + \sigma(w,v))
\]

and \( \operatorname{Alt}(\sigma)(v,w) = \tfrac{1}{2}(\sigma(v,w) - \sigma(w,v)) \).

### 8.5 Riemannian Metrics

We now arrive at one of the most important structures in differential geometry: the Riemannian metric. It is the structure that allows us to measure lengths, angles, areas, and volumes on a smooth manifold — concepts that the smooth structure alone does not provide.

<div class="definition">
<strong>Definition 8.9 (Riemannian Metric).</strong> A <strong>Riemannian metric</strong> \( g \) on a smooth manifold \( M \) is a smooth symmetric covariant 2-tensor field that is <strong>positive definite</strong> at each point. That is, \( g \in \mathcal{T}^2_0(M) \) such that:
<ol>
<li><strong>Symmetry:</strong> \( g_p(v, w) = g_p(w, v) \) for all \( p \in M \) and \( v, w \in T_pM \).</li>
<li><strong>Positive definiteness:</strong> \( g_p(v, v) > 0 \) for all \( p \in M \) and \( 0 \neq v \in T_pM \).</li>
<li><strong>Smoothness:</strong> for any smooth vector fields \( X, Y \in \mathfrak{X}(M) \), the function \( g(X, Y) \colon M \to \mathbb{R} \) is smooth.</li>
</ol>
A smooth manifold equipped with a Riemannian metric is called a <strong>Riemannian manifold</strong> and is denoted \( (M, g) \).
</div>

![A Riemannian metric on a manifold: at each point p, the metric g_p defines an inner product on T_pM, shown as an indicatrix (unit ellipse)](/pics/pmath465/riemannian-metric-indicatrix.svg)

In other words, a Riemannian metric is a smoothly varying choice of inner product on each tangent space. At each point \( p \), the metric \( g_p \colon T_pM \times T_pM \to \mathbb{R} \) is an inner product, and this inner product varies smoothly from point to point.

In local coordinates \( (x^1, \ldots, x^n) \), the metric is expressed as

\[
g = g_{ij} \, dx^i \otimes dx^j,
\]

where the component functions are

\[
g_{ij} = g\!\left( \frac{\partial}{\partial x^i}, \frac{\partial}{\partial x^j} \right).
\]

The matrix \( (g_{ij}(p)) \) is a symmetric positive definite \( n \times n \) matrix at each point \( p \). The symmetry of \( g \) means \( g_{ij} = g_{ji} \), and the positive definiteness means the matrix \( (g_{ij}) \) has all positive eigenvalues.

<div class="remark">
<strong>Remark 8.10.</strong> One sometimes writes \( g = g_{ij} \, dx^i \, dx^j \), omitting the tensor product symbol and using the "symmetric product" convention where \( dx^i \, dx^j = \frac{1}{2}(dx^i \otimes dx^j + dx^j \otimes dx^i) \). Since \( g \) is symmetric, this gives the same result. The notation \( ds^2 = g_{ij} \, dx^i \, dx^j \) (the "line element") is also common, especially in physics and classical differential geometry.
</div>

### 8.6 Examples of Riemannian Metrics

<div class="example">
<strong>Example 8.11 (Euclidean Metric).</strong> The standard inner product on \( \mathbb{R}^n \) defines a Riemannian metric
\[
\bar{g} = \delta_{ij} \, dx^i \otimes dx^j = (dx^1)^2 + \cdots + (dx^n)^2,
\]
where \( \delta_{ij} \) is the Kronecker delta. This is the <strong>Euclidean metric</strong> (or <strong>flat metric</strong>). In matrix form, \( (g_{ij}) = I_n \). The Euclidean metric is "flat" in the sense that its Riemann curvature tensor vanishes identically.
</div>

<div class="example">
<strong>Example 8.12 (Round Metric on \( S^n \)).</strong> The <strong>round metric</strong> on the unit sphere \( S^n \subset \mathbb{R}^{n+1} \) is the metric induced by the Euclidean metric on \( \mathbb{R}^{n+1} \). If \( \iota \colon S^n \hookrightarrow \mathbb{R}^{n+1} \) is the inclusion, then
\[
g_{S^n} = \iota^* \bar{g}.
\]
In spherical coordinates \( (\theta^1, \ldots, \theta^n) \) on \( S^n \), the round metric for \( S^2 \) takes the familiar form

\[
g_{S^2} = d\theta^2 + \sin^2\theta \, d\phi^2.
\]
The round metric has constant sectional curvature \( +1 \).
</div>

![The round metric on S^n induced by the Euclidean metric on R^{n+1} via the inclusion](/pics/pmath465/round-metric-sphere.svg)

<div class="example">
<strong>Example 8.13 (Hyperbolic Metric).</strong> On the upper half-space \( \mathbb{H}^n = \{ (x^1, \ldots, x^n) \in \mathbb{R}^n : x^n > 0 \} \), the <strong>hyperbolic metric</strong> is
\[
g = \frac{(dx^1)^2 + \cdots + (dx^n)^2}{(x^n)^2}.
\]
In matrix form, \( g_{ij} = \frac{\delta_{ij}}{(x^n)^2} \). This metric has constant sectional curvature \( -1 \) and is a model for hyperbolic geometry.
</div>

![The hyperbolic upper half-plane: geodesics are vertical lines and semicircles orthogonal to the x-axis, with distances growing near x^n = 0](/pics/pmath465/hyperbolic-half-plane.svg)

<div class="example">
<strong>Example 8.14 (Pullback Metrics).</strong> More generally, if \( F \colon M \to (N, h) \) is a smooth immersion and \( (N, h) \) is a Riemannian manifold, then the <strong>pullback metric</strong> \( g = F^*h \) defined by
\[
g_p(v, w) = h_{F(p)}(F_{<em>,p}v, F_{</em>,p}w)
\]
is a Riemannian metric on \( M \). (Positive definiteness uses the injectivity of \( F_{*,p} \).) This is how the round metric on \( S^n \) is defined, and more generally how any submanifold of a Riemannian manifold inherits a Riemannian metric.
</div>

<div class="example">
<strong>Example 8.15 (Product Metrics).</strong> If \( (M_1, g_1) \) and \( (M_2, g_2) \) are Riemannian manifolds, the <strong>product metric</strong> on \( M_1 \times M_2 \) is defined by
\[
g = \pi_1^<em> g_1 + \pi_2^</em> g_2,
\]
where \( \pi_i \colon M_1 \times M_2 \to M_i \) are the projections. In terms of the natural splitting \( T_{(p,q)}(M_1 \times M_2) \cong T_pM_1 \oplus T_qM_2 \), vectors from different factors are orthogonal. The flat torus \( \mathbb{T}^n = \mathbb{R}^n / \mathbb{Z}^n \) with its standard flat metric is a product of circles with the standard metric.
</div>

### 8.7 Existence of Riemannian Metrics

One might worry that Riemannian metrics are difficult to construct. The following theorem, which relies on partitions of unity, shows that every smooth manifold admits at least one Riemannian metric.

<div class="theorem">
<strong>Theorem 8.16 (Existence of Riemannian Metrics).</strong> Every smooth manifold admits a Riemannian metric.
</div>

<div class="proof">
<strong>Proof.</strong> Let \( \{(U_\alpha, \varphi_\alpha)\}_{\alpha \in A} \) be a smooth atlas for \( M \), and let \( \{\rho_\alpha\}_{\alpha \in A} \) be a smooth partition of unity subordinate to the open cover \( \{U_\alpha\} \). On each chart domain \( U_\alpha \), define the local Riemannian metric
\[
g_\alpha = \delta_{ij} \, d(x_\alpha^i) \otimes d(x_\alpha^j),
\]
which is just the pullback of the Euclidean metric by the coordinate map \( \varphi_\alpha \). Now define

\[
g = \sum_{\alpha \in A} \rho_\alpha \, g_\alpha.
\]
This is a well-defined smooth symmetric covariant 2-tensor field on \( M \) (the sum is locally finite). It remains to check positive definiteness. For any \( p \in M \) and \( 0 \neq v \in T_pM \),

\[
g_p(v, v) = \sum_{\alpha} \rho_\alpha(p) \, (g_\alpha)_p(v, v).
\]
Each term is nonneg (since \( \rho_\alpha \ge 0 \) and each \( g_\alpha \) is positive definite), and at least one term is strictly positive (since \( \sum \rho_\alpha = 1 \) and \( (g_\alpha)_p(v,v) > 0 \) whenever \( p \in U_\alpha \) and \( v \neq 0 \)). Thus \( g_p(v,v) > 0 \). \( \square \)
</div>

<div class="remark">
<strong>Remark 8.17.</strong> The existence proof is non-constructive in the sense that it depends on a choice of atlas and partition of unity. There are typically many (in fact, infinitely many) Riemannian metrics on a given manifold, and the study of which metrics have special geometric properties (e.g., constant curvature, Einstein metrics, Ricci-flat metrics) is a central problem in Riemannian geometry. Note also that this argument does <strong>not</strong> work for pseudo-Riemannian metrics (metrics of indefinite signature, such as Lorentzian metrics), because a convex combination of indefinite forms need not be indefinite of the same signature.
</div>

### 8.8 The Musical Isomorphisms

A Riemannian metric establishes a canonical isomorphism between the tangent and cotangent spaces at each point, resolving the non-canonical nature of the identification between a vector space and its dual. These isomorphisms are called the **musical isomorphisms** because of the notational conventions used in index notation.

<div class="definition">
<strong>Definition 8.18 (Flat and Sharp).</strong> Let \( (M, g) \) be a Riemannian manifold. The <strong>flat map</strong> (or <strong>index-lowering map</strong>) is the bundle map
\[
\flat \colon TM \to T^*M
\]
defined at each point \( p \) by

\[
v^\flat(w) = g_p(v, w) \qquad \text{for all } v, w \in T_pM.
\]
The <strong>sharp map</strong> (or <strong>index-raising map</strong>) is the inverse

\[
\sharp \colon T^*M \to TM, \qquad \sharp = \flat^{-1}.
\]
That is, \( \omega^\sharp \) is the unique vector satisfying \( g(\omega^\sharp, w) = \omega(w) \) for all \( w \in T_pM \).
</div>

The flat map \( \flat \) is well-defined and invertible because \( g_p \) is a nondegenerate bilinear form (being positive definite). The name "flat" comes from the fact that in musical notation, the flat symbol \( \flat \) lowers the pitch — and here it "lowers an index" from upper (vector) to lower (covector) position. Similarly, the sharp \( \sharp \) "raises an index."

In local coordinates, if \( v = v^i \frac{\partial}{\partial x^i} \), then

\[
v^\flat = g_{ij} v^i \, dx^j.
\]

That is, the components of \( v^\flat \) are \( (v^\flat)_j = g_{ij} v^i \): the metric "lowers the index." Conversely, if \( \omega = \omega_j \, dx^j \), then

\[
\omega^\sharp = g^{ij} \omega_j \, \frac{\partial}{\partial x^i},
\]

where \( (g^{ij}) \) is the **inverse matrix** of \( (g_{ij}) \), i.e., \( g^{ik}g_{kj} = \delta^i_j \). The components of \( \omega^\sharp \) are \( (\omega^\sharp)^i = g^{ij}\omega_j \): the inverse metric "raises the index."

![The musical isomorphisms: flat ♭ lowers a vector to a covector, sharp ♯ raises a covector to a vector, using the metric g](/pics/pmath465/musical-isomorphisms.svg)

The musical isomorphisms extend to tensor fields by acting on individual indices, and they allow us to freely move indices up and down. This is a powerful computational tool in Riemannian geometry.

<div class="proposition">
<strong>Proposition 8.19.</strong> The musical isomorphisms \( \flat \colon \mathfrak{X}(M) \to \Omega^1(M) \) and \( \sharp \colon \Omega^1(M) \to \mathfrak{X}(M) \) are \( C^\infty(M) \)-module isomorphisms.
</div>

### 8.9 The Gradient

The musical isomorphisms give us the correct definition of the gradient vector field on a Riemannian manifold.

<div class="definition">
<strong>Definition 8.20 (Gradient).</strong> Let \( (M, g) \) be a Riemannian manifold and \( f \in C^\infty(M) \). The <strong>gradient</strong> of \( f \) is the vector field
\[
\operatorname{grad} f = (df)^\sharp.
\]
Equivalently, \( \operatorname{grad} f \) is the unique smooth vector field satisfying

\[
g(\operatorname{grad} f, X) = df(X) = Xf \qquad \text{for all } X \in \mathfrak{X}(M).
\]
</div>

![The gradient on a Riemannian manifold: grad f = (df)^♯ points in the direction of steepest ascent, perpendicular to level sets of f](/pics/pmath465/gradient-riemannian.svg)

This definition makes it clear that the gradient depends on the choice of Riemannian metric, unlike the differential \( df \), which is purely a smooth-manifold concept. In Euclidean space \( (\mathbb{R}^n, \bar{g}) \), the gradient reduces to the classical gradient:

\[
\operatorname{grad} f = \frac{\partial f}{\partial x^i} \frac{\partial}{\partial x^i} = \nabla f,
\]

because \( g^{ij} = \delta^{ij} \). On a general Riemannian manifold, however, the components of the gradient involve the inverse metric:

\[
(\operatorname{grad} f)^i = g^{ij} \frac{\partial f}{\partial x^j}.
\]

<div class="example">
<strong>Example 8.21.</strong> On \( S^2 \) with the round metric \( g = d\theta^2 + \sin^2\theta \, d\phi^2 \), the inverse metric matrix is
\[
(g^{ij}) = \begin{pmatrix} 1 & 0 \\ 0 & \csc^2\theta \end{pmatrix}.
\]
For the height function \( h = \cos\theta \), we have \( dh = -\sin\theta \, d\theta \), so

\[
\operatorname{grad} h = g^{11}(-\sin\theta) \frac{\partial}{\partial \theta} + g^{22}(0) \frac{\partial}{\partial \phi} = -\sin\theta \frac{\partial}{\partial \theta}.
\]
The gradient points "downhill" along lines of longitude, as expected.
</div>

<div class="proposition">
<strong>Proposition 8.22 (Properties of the Gradient).</strong> Let \( (M, g) \) be a Riemannian manifold. Then:
<ol>
<li>\( \operatorname{grad}(f + h) = \operatorname{grad} f + \operatorname{grad} h \).</li>
<li>\( \operatorname{grad}(fh) = f \operatorname{grad} h + h \operatorname{grad} f \) (product rule).</li>
<li>\( \operatorname{grad} f = 0 \) if and only if \( f \) is locally constant.</li>
<li>At a point \( p \) where \( df_p \neq 0 \), the gradient \( \operatorname{grad} f|_p \) points in the direction of steepest ascent of \( f \), and \( |\operatorname{grad} f|_p| = \|df_p\|_{g^{-1}} \).</li>
</ol>
</div>

### 8.10 Inner Product on Covectors and Forms

The Riemannian metric \( g \) on \( TM \) induces a corresponding inner product on \( T^*M \) (and more generally on all tensor bundles) via the musical isomorphisms.

<div class="definition">
<strong>Definition 8.23 (Induced Inner Product on Covectors).</strong> Let \( (M, g) \) be a Riemannian manifold. The <strong>induced inner product</strong> on covectors is the symmetric \( (0,2) \)-tensor field \( g^{-1} \) on \( T^*M \) defined by
\[
g^{-1}(\omega, \eta) = g(\omega^\sharp, \eta^\sharp)
\]
for all \( \omega, \eta \in T_p^*M \). In local coordinates,

\[
g^{-1}(\omega, \eta) = g^{ij} \omega_i \eta_j.
\]
</div>

This gives a pointwise inner product on \( T_p^*M \) that is positive definite (since \( g \) is). The norm of a covector is \( |\omega|_{g^{-1}} = \sqrt{g^{ij}\omega_i\omega_j} \). In particular,

\[
|\operatorname{grad} f|^2 = g(\operatorname{grad} f, \operatorname{grad} f) = g^{-1}(df, df) = g^{ij} \frac{\partial f}{\partial x^i} \frac{\partial f}{\partial x^j}.
\]

More generally, the metric induces inner products on all tensor bundles \( T^{(k,\ell)}M \) by contracting indices with \( g_{ij} \) and \( g^{ij} \). For example, on \( (2,0) \)-tensors:

\[
\langle \sigma, \tau \rangle = g^{i_1 j_1} g^{i_2 j_2} \sigma_{i_1 i_2} \tau_{j_1 j_2}.
\]

These inner products are essential for the \( L^2 \) theory of differential forms (Hodge theory), which we will encounter in later chapters.

### 8.11 Lengths of Curves and the Riemannian Distance

A Riemannian metric allows us to measure the lengths of tangent vectors, and thereby the lengths of curves.

<div class="definition">
<strong>Definition 8.24 (Length of a Curve).</strong> Let \( (M, g) \) be a Riemannian manifold and \( \gamma \colon [a, b] \to M \) a smooth (or piecewise smooth) curve. The <strong>length</strong> of \( \gamma \) is
\[
L(\gamma) = \int_a^b |\gamma'(t)|_g \, dt = \int_a^b \sqrt{g_{\gamma(t)}(\gamma'(t), \gamma'(t))} \, dt.
\]
</div>

In local coordinates, if \( \gamma(t) = (x^1(t), \ldots, x^n(t)) \), then

\[
L(\gamma) = \int_a^b \sqrt{g_{ij}(\gamma(t)) \frac{dx^i}{dt} \frac{dx^j}{dt}} \, dt.
\]

![Curve length on a Riemannian manifold: the length of γ is computed by integrating the norm of the velocity vector |γ'(t)|_g](/pics/pmath465/curve-length-riemannian.svg)

The length is independent of the parametrisation of the curve (as one can verify by the change-of-variables formula), which is geometrically natural.

<div class="definition">
<strong>Definition 8.25 (Riemannian Distance).</strong> On a connected Riemannian manifold \( (M, g) \), the <strong>Riemannian distance</strong> between two points \( p, q \in M \) is
\[
d_g(p, q) = \inf \{ L(\gamma) : \gamma \text{ is a piecewise smooth curve from } p \text{ to } q \}.
\]
</div>

<div class="theorem">
<strong>Theorem 8.26.</strong> The Riemannian distance \( d_g \) is a metric (in the metric space sense) on \( M \), and the metric topology coincides with the manifold topology.
</div>

This is a deep and important result: it says that the Riemannian metric (a smooth tensor field) determines a metric space structure on \( M \), and that this metric space structure is compatible with the original topology. The curves that minimise length (locally) are called **geodesics**, and their study is a central topic in Riemannian geometry.

### 8.12 Transformation of Metric Components

Under a change of coordinates \( x^i \mapsto \tilde{x}^j \), the metric components transform according to the standard covariant tensor transformation law:

\[
\tilde{g}_{k\ell} = \frac{\partial x^i}{\partial \tilde{x}^k} \frac{\partial x^j}{\partial \tilde{x}^\ell} \, g_{ij}.
\]

This can be written in matrix form as \( \tilde{G} = J^T G J \), where \( J = \left( \frac{\partial x^i}{\partial \tilde{x}^j} \right) \) is the Jacobian of the coordinate change and \( G = (g_{ij}) \). The positive definiteness of \( G \) is preserved since \( J \) is invertible.

<div class="example">
<strong>Example 8.27 (Polar Coordinates).</strong> Consider \( \mathbb{R}^2 \) with the Euclidean metric \( g = dx^2 + dy^2 \). In polar coordinates \( (r, \theta) \), we have \( x = r\cos\theta \), \( y = r\sin\theta \), so
\[
dx = \cos\theta \, dr - r\sin\theta \, d\theta, \qquad dy = \sin\theta \, dr + r\cos\theta \, d\theta.
\]
Substituting:

\[
g = (\cos^2\theta + \sin^2\theta) \, dr^2 + (-r\sin\theta\cos\theta + r\sin\theta\cos\theta)(dr \, d\theta + d\theta \, dr) + r^2(\sin^2\theta + \cos^2\theta) \, d\theta^2,
\]
which simplifies to

\[
g = dr^2 + r^2 \, d\theta^2.
\]
The metric matrix is \( (g_{ij}) = \operatorname{diag}(1, r^2) \), and the inverse is \( (g^{ij}) = \operatorname{diag}(1, r^{-2}) \).
</div>

### 8.13 Isometries and Local Isometries

<div class="definition">
<strong>Definition 8.28 (Isometry).</strong> Let \( (M, g) \) and \( (N, h) \) be Riemannian manifolds. A diffeomorphism \( F \colon M \to N \) is an <strong>isometry</strong> if \( F^*h = g \), i.e.,
\[
h_{F(p)}(F_{<em>,p}v, F_{</em>,p}w) = g_p(v, w)
\]
for all \( p \in M \) and \( v, w \in T_pM \). More generally, a smooth map \( F \colon M \to N \) is a <strong>local isometry</strong> if every point \( p \in M \) has a neighbourhood \( U \) such that \( F|_U \colon U \to F(U) \) is an isometry onto its image.
</div>

![An isometry F between Riemannian manifolds (M,g) and (N,h): F preserves the metric, so F*h = g](/pics/pmath465/isometry.svg)

Isometries are the structure-preserving maps of Riemannian geometry. They preserve lengths, angles, areas, curvature, and all other Riemannian invariants. The set of all isometries from \( (M, g) \) to itself forms a group under composition, called the **isometry group** \( \operatorname{Isom}(M, g) \).

<div class="example">
<strong>Example 8.29.</strong> The isometry group of Euclidean space \( (\mathbb{R}^n, \bar{g}) \) is the Euclidean group \( E(n) = O(n) \ltimes \mathbb{R}^n \), consisting of orthogonal transformations and translations. The isometry group of the round sphere \( (S^n, g_{S^n}) \) is the orthogonal group \( O(n+1) \).
</div>

This concludes our introduction to Riemannian metrics. The metric tensor \( g \) is the foundation upon which the entire edifice of Riemannian geometry is built. In subsequent chapters, we will use the metric to define connections, curvature, geodesics, and the Laplacian, revealing the deep interplay between geometry and analysis on manifolds.

---

## Chapter 9: Differential Forms

### 9.1 The Algebra of Alternating Tensors

In our study of smooth manifolds, we have encountered tangent vectors, cotangent vectors, and general tensors. We now turn to a particularly important class of tensors — the **alternating** (or **antisymmetric**) tensors — which will form the algebraic backbone of the theory of differential forms. Differential forms are the natural objects to integrate on manifolds, and they encode geometric and topological information in a remarkably elegant way.

Let \( V \) be a finite-dimensional real vector space of dimension \( n \). Recall that a covariant \( k \)-tensor on \( V \) is a multilinear map \( \alpha \colon V^k \to \mathbb{R} \). We say that \( \alpha \) is **alternating** (or **skew-symmetric**) if it changes sign whenever two of its arguments are transposed.

<div class="definition">
<strong>Definition 9.1 (Alternating tensor).</strong> A covariant \( k \)-tensor \( \alpha \in T^k(V^*) \) is called <strong>alternating</strong> if for every permutation \( \sigma \in S_k \) and all vectors \( v_1, \ldots, v_k \in V \),
\[
\alpha(v_{\sigma(1)}, \ldots, v_{\sigma(k)}) = (\operatorname{sgn} \sigma) \, \alpha(v_1, \ldots, v_k).
\]
The vector space of alternating \( k \)-tensors on \( V \) is denoted \( \Lambda^k(V^*) \).
</div>

By convention, \( \Lambda^0(V^*) = \mathbb{R} \) and \( \Lambda^1(V^*) = V^* \). Since an alternating \( k \)-tensor must vanish whenever two of its arguments are equal (set \( v_i = v_j \) and use the sign change), it follows that \( \Lambda^k(V^*) = 0 \) for \( k > n = \dim V \). The space \( \Lambda^k(V^*) \) has dimension \( \binom{n}{k} \).

Given a basis \( (e_1, \ldots, e_n) \) for \( V \) with dual basis \( (\varepsilon^1, \ldots, \varepsilon^n) \), a basis for \( \Lambda^k(V^*) \) is given by the collection

\[
\{ \varepsilon^{i_1} \wedge \cdots \wedge \varepsilon^{i_k} : 1 \le i_1 < i_2 < \cdots < i_k \le n \}.
\]
We will define the wedge product momentarily.

**The alternation operator.** There is a natural projection from the space of all covariant \( k \)-tensors onto the subspace of alternating ones. Define \( \operatorname{Alt} \colon T^k(V^*) \to \Lambda^k(V^*) \) by

\[
(\operatorname{Alt}\, \alpha)(v_1, \ldots, v_k) = \frac{1}{k!} \sum_{\sigma \in S_k} (\operatorname{sgn}\, \sigma)\, \alpha(v_{\sigma(1)}, \ldots, v_{\sigma(k)}).
\]
One readily checks that \( \operatorname{Alt}\, \alpha \) is indeed alternating, and that \( \operatorname{Alt}\, \alpha = \alpha \) if and only if \( \alpha \) is already alternating.

### 9.2 The Wedge Product

The tensor product of two alternating tensors is generally not alternating. To obtain an alternating tensor from the product, we apply the alternation operator with appropriate normalization.

<div class="definition">
<strong>Definition 9.2 (Wedge product).</strong> Given \( \alpha \in \Lambda^k(V^<em>) \) and \( \beta \in \Lambda^\ell(V^</em>) \), their <strong>wedge product</strong> (or <strong>exterior product</strong>) is the alternating \( (k+\ell) \)-tensor
\[
\alpha \wedge \beta = \frac{(k+\ell)!}{k!\, \ell!} \operatorname{Alt}(\alpha \otimes \beta).
\]
</div>

The combinatorial prefactor ensures that the wedge product of basis covectors agrees with the determinant. Explicitly, if \( \varepsilon^1, \ldots, \varepsilon^n \) is a dual basis, then

\[
(\varepsilon^{i_1} \wedge \cdots \wedge \varepsilon^{i_k})(v_1, \ldots, v_k) = \det \begin{pmatrix} \varepsilon^{i_1}(v_1) & \cdots & \varepsilon^{i_1}(v_k) \\ \vdots & \ddots & \vdots \\ \varepsilon^{i_k}(v_1) & \cdots & \varepsilon^{i_k}(v_k) \end{pmatrix}.
\]

The wedge product satisfies several fundamental algebraic properties.

<div class="proposition">
<strong>Proposition 9.3 (Properties of the wedge product).</strong> Let \( \alpha \in \Lambda^k(V^<em>) \), \( \beta \in \Lambda^\ell(V^</em>) \), and \( \gamma \in \Lambda^m(V^*) \). Then:
<ol>
<li><strong>Bilinearity:</strong> \( \wedge \) is bilinear in each factor.</li>
<li><strong>Associativity:</strong> \( (\alpha \wedge \beta) \wedge \gamma = \alpha \wedge (\beta \wedge \gamma) \).</li>
<li><strong>Graded commutativity:</strong> \( \alpha \wedge \beta = (-1)^{k\ell}\, \beta \wedge \alpha \).</li>
</ol>
</div>

![The wedge product: α ∧ β is the antisymmetrized tensor product, geometrically representing an oriented area element](/pics/pmath465/wedge-product.svg)

The graded commutativity is the key feature distinguishing the exterior algebra from the tensor algebra. In particular, if \( \alpha \) is a 1-form, then \( \alpha \wedge \alpha = 0 \), since \( (-1)^{1 \cdot 1} = -1 \) forces \( \alpha \wedge \alpha = -\alpha \wedge \alpha \).

The **exterior algebra** of \( V^* \) is the direct sum

\[
\Lambda^*(V^*) = \bigoplus_{k=0}^{n} \Lambda^k(V^*),
\]
which is a graded, associative, graded-commutative algebra of total dimension \( 2^n \).

### 9.3 Differential Forms on Manifolds

With the pointwise algebra of alternating tensors in hand, we now globalize to manifolds. At each point \( p \) of a smooth manifold \( M \), we have the cotangent space \( T_p^*M \), and we can form \( \Lambda^k(T_p^*M) \). Assembling these vector spaces as \( p \) varies over \( M \) produces a vector bundle \( \Lambda^k(T^*M) \to M \).

<div class="definition">
<strong>Definition 9.4 (Differential \( k \)-form).</strong> A <strong>differential \( k \)-form</strong> (or simply a <strong>\( k \)-form</strong>) on a smooth manifold \( M \) is a smooth section of the bundle \( \Lambda^k(T^*M) \). The space of all smooth \( k \)-forms on \( M \) is denoted
\[
\Omega^k(M) = \Gamma(\Lambda^k(T^*M)).
\]
</div>

A 0-form is simply a smooth function \( f \in C^\infty(M) = \Omega^0(M) \). A 1-form is a smooth section of the cotangent bundle, which we have already studied extensively. In local coordinates \( (x^1, \ldots, x^n) \) on a chart \( (U, \varphi) \), every \( k \)-form \( \omega \in \Omega^k(M) \) can be written as

\[
\omega = \sum_{i_1 < \cdots < i_k} \omega_{i_1 \cdots i_k}\, dx^{i_1} \wedge \cdots \wedge dx^{i_k},
\]
where the coefficient functions \( \omega_{i_1 \cdots i_k} \in C^\infty(U) \) are smooth. The wedge product of differential forms is defined pointwise, making \( \Omega^*(M) = \bigoplus_{k=0}^{n} \Omega^k(M) \) into a graded algebra over \( C^\infty(M) \).

![Differential forms on R^3: 0-forms are functions, 1-forms are covector fields, 2-forms are flux elements, 3-forms are volume elements](/pics/pmath465/differential-forms-r3.svg)

<div class="example">
<strong>Example 9.5.</strong> On \( \mathbb{R}^3 \) with coordinates \( (x, y, z) \):
<ul>
<li>The 1-form \( \omega = x\, dy - y\, dx \) encodes a rotational quantity.</li>
<li>The 2-form \( \eta = x\, dy \wedge dz + y\, dz \wedge dx + z\, dx \wedge dy \) is related to the flux of the radial vector field through a surface.</li>
<li>The 3-form \( \mu = f(x,y,z)\, dx \wedge dy \wedge dz \) is a "volume element" weighted by \( f \).</li>
</ul>
</div>

### 9.4 The Exterior Derivative

The exterior derivative is a first-order differential operator that generalizes the total derivative of a function to forms of arbitrary degree. It is the single most important operator in the calculus of differential forms.

<div class="theorem">
<strong>Theorem 9.6 (Existence and uniqueness of the exterior derivative).</strong> There exists a unique collection of \( \mathbb{R} \)-linear maps \( d \colon \Omega^k(M) \to \Omega^{k+1}(M) \) for each \( k \ge 0 \), satisfying:
<ol>
<li><strong>\( d \) on functions:</strong> For \( f \in \Omega^0(M) = C^\infty(M) \), \( df \) is the differential of \( f \), i.e., \( df(X) = Xf \) for all vector fields \( X \).</li>
<li><strong>Nilpotency:</strong> \( d \circ d = 0 \), i.e., \( d(d\omega) = 0 \) for all \( \omega \).</li>
<li><strong>Graded Leibniz rule:</strong> For \( \alpha \in \Omega^k(M) \) and \( \beta \in \Omega^\ell(M) \),
\[
d(\alpha \wedge \beta) = d\alpha \wedge \beta + (-1)^k \alpha \wedge d\beta.
\]
</li>
</ol>
</div>

The proof of existence proceeds by constructing \( d \) in local coordinates and showing the result is independent of the choice of coordinates. In a coordinate chart \( (x^1, \ldots, x^n) \), if

\[
\omega = \sum_{I} \omega_I\, dx^I,
\]
where \( I = (i_1, \ldots, i_k) \) is an increasing multi-index and \( dx^I = dx^{i_1} \wedge \cdots \wedge dx^{i_k} \), then

\[
d\omega = \sum_{I} d\omega_I \wedge dx^I = \sum_{I} \sum_{j=1}^{n} \frac{\partial \omega_I}{\partial x^j}\, dx^j \wedge dx^I.
\]

<div class="proof">
<strong>Proof sketch (that \( d^2 = 0 \)).</strong> It suffices to verify this on a coordinate domain. For a function \( f \),
\[
d(df) = d\Bigl(\sum_j \frac{\partial f}{\partial x^j} dx^j\Bigr) = \sum_{i,j} \frac{\partial^2 f}{\partial x^i \partial x^j} dx^i \wedge dx^j = 0,
\]
because mixed partial derivatives are symmetric while \( dx^i \wedge dx^j \) is antisymmetric. For a general \( k \)-form \( \omega = \omega_I\, dx^I \), we use the Leibniz rule:

\[
d^2(\omega_I\, dx^I) = d(d\omega_I \wedge dx^I) = d^2\omega_I \wedge dx^I - d\omega_I \wedge d(dx^I).
\]
Since \( d^2\omega_I = 0 \) by the function case, and \( d(dx^I) = 0 \) because each \( dx^j \) is closed (\( d(dx^j) = 0 \) by the coordinate computation), both terms vanish.
</div>

<div class="example">
<strong>Example 9.7.</strong> On \( \mathbb{R}^3 \):
<ul>
<li>If \( f \in C^\infty(\mathbb{R}^3) \), then \( df = \frac{\partial f}{\partial x} dx + \frac{\partial f}{\partial y} dy + \frac{\partial f}{\partial z} dz \). This corresponds to the gradient \( \nabla f \).</li>
<li>If \( \omega = P\,dx + Q\,dy + R\,dz \) is a 1-form, then
\[
d\omega = \Bigl(\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y}\Bigr) dx \wedge dy + \Bigl(\frac{\partial R}{\partial y} - \frac{\partial Q}{\partial z}\Bigr) dy \wedge dz + \Bigl(\frac{\partial P}{\partial z} - \frac{\partial R}{\partial x}\Bigr) dz \wedge dx.
\]
This corresponds to the curl \( \nabla \times \mathbf{F} \).</li>
<li>If \( \eta = A\, dy \wedge dz + B\, dz \wedge dx + C\, dx \wedge dy \) is a 2-form, then
\[
d\eta = \Bigl(\frac{\partial A}{\partial x} + \frac{\partial B}{\partial y} + \frac{\partial C}{\partial z}\Bigr) dx \wedge dy \wedge dz.
\]
This corresponds to the divergence \( \nabla \cdot \mathbf{F} \).</li>
</ul>
The identity \( d^2 = 0 \) unifies the classical vector calculus identities \( \nabla \times (\nabla f) = 0 \) and \( \nabla \cdot (\nabla \times \mathbf{F}) = 0 \).
</div>

<div class="remark">
<strong>Remark (The de Rham complex and the topology of \(\mathbb{R}^3\)).</strong> The chain of maps
\[
\Omega^0(\mathbb{R}^3) \xrightarrow{d} \Omega^1(\mathbb{R}^3) \xrightarrow{d} \Omega^2(\mathbb{R}^3) \xrightarrow{d} \Omega^3(\mathbb{R}^3)
\]
corresponds (via the musical isomorphisms of a Riemannian metric on \(\mathbb{R}^3\)) to

\[
C^\infty(\mathbb{R}^3) \xrightarrow{\nabla} \mathfrak{X}(\mathbb{R}^3) \xrightarrow{\nabla \times} \mathfrak{X}(\mathbb{R}^3) \xrightarrow{\nabla \cdot} C^\infty(\mathbb{R}^3).
\]
The identity \(d^2 = 0\) says "\(\text{curl} \circ \text{grad} = 0\)" and "\(\text{div} \circ \text{curl} = 0\)." The cohomology groups \(H^k_{\text{dR}}(\mathbb{R}^3)\) all vanish for \(k \geq 1\) (by the Poincaré lemma), which expresses the familiar facts: every irrotational vector field on \(\mathbb{R}^3\) has a potential, and every divergence-free vector field on \(\mathbb{R}^3\) is a curl. On a non-contractible domain these facts can fail, and the failures are measured by \(H^1\) and \(H^2\) respectively.
</div>

![The de Rham complex: Ω^0 → Ω^1 → Ω^2 → Ω^3, with d^2 = 0 unifying grad, curl, div](/pics/pmath465/exterior-derivative-chain.svg)

### 9.5 The Invariant Formula for the Exterior Derivative

While the coordinate formula for \( d \) is useful for computation, it is often valuable to have a coordinate-free expression. For a \( k \)-form \( \omega \) and vector fields \( X_0, \ldots, X_k \), the exterior derivative is given by:

<div class="proposition">
<strong>Proposition 9.8 (Invariant formula).</strong> For \( \omega \in \Omega^k(M) \) and smooth vector fields \( X_0, \ldots, X_k \),
\[
d\omega(X_0, \ldots, X_k) = \sum_{i=0}^{k} (-1)^i X_i\bigl(\omega(X_0, \ldots, \widehat{X}_i, \ldots, X_k)\bigr) + \sum_{i < j} (-1)^{i+j} \omega\bigl([X_i, X_j], X_0, \ldots, \widehat{X}_i, \ldots, \widehat{X}_j, \ldots, X_k\bigr),
\]
where a hat denotes omission of that argument.
</div>

For example, when \( \omega \) is a 1-form and \( X, Y \) are vector fields,

\[
d\omega(X, Y) = X(\omega(Y)) - Y(\omega(X)) - \omega([X, Y]).
\]
This formula is extremely important in differential geometry, particularly in the theory of connections and curvature.

### 9.6 Pullback of Differential Forms

If \( F \colon M \to N \) is a smooth map and \( \omega \) is a differential form on \( N \), we can pull \( \omega \) back to a form on \( M \). This operation is contravariantly functorial and interacts beautifully with all the algebraic and differential operations on forms.

<div class="definition">
<strong>Definition 9.9 (Pullback of a \( k \)-form).</strong> Let \( F \colon M \to N \) be a smooth map and \( \omega \in \Omega^k(N) \). The <strong>pullback</strong> \( F^*\omega \in \Omega^k(M) \) is defined by
\[
(F^*\omega)_p(v_1, \ldots, v_k) = \omega_{F(p)}(dF_p(v_1), \ldots, dF_p(v_k))
\]
for all \( p \in M \) and \( v_1, \ldots, v_k \in T_pM \).
</div>

<div class="proposition">
<strong>Proposition 9.10 (Properties of pullback).</strong> Let \( F \colon M \to N \) be smooth. Then:
<ol>
<li>\( F^<em>(\alpha \wedge \beta) = (F^</em>\alpha) \wedge (F^*\beta) \) for all forms \( \alpha, \beta \) on \( N \).</li>
<li>\( d(F^<em>\omega) = F^</em>(d\omega) \) for all \( \omega \in \Omega^k(N) \), i.e., pullback commutes with the exterior derivative.</li>
<li>\( (G \circ F)^<em> = F^</em> \circ G^* \) for smooth maps \( F \colon M \to N \) and \( G \colon N \to P \).</li>
<li>\( (\mathrm{Id}_M)^<em> = \mathrm{Id}_{\Omega^</em>(M)} \).</li>
</ol>
</div>

Property (2) is particularly significant: the exterior derivative is a **natural** operator. The proof uses the coordinate formula for \( d \) together with the chain rule for the differential \( dF \). Properties (3) and (4) express the fact that \( \Omega^*(-) \) is a contravariant functor from the category of smooth manifolds to the category of graded algebras.

In local coordinates, if \( F \colon M \to N \) is given in coordinates by \( y^j = F^j(x^1, \ldots, x^m) \), then the pullback of a basic 1-form is \( F^*(dy^j) = \sum_i \frac{\partial F^j}{\partial x^i} dx^i \), and pullback of a general form follows from linearity and the wedge product property.

### 9.7 Interior Product and Cartan's Magic Formula

The interior product (also called contraction) is an algebraic operation that "inserts" a vector field into a differential form, reducing its degree by one.

<div class="definition">
<strong>Definition 9.11 (Interior product).</strong> Let \( X \) be a smooth vector field on \( M \). The <strong>interior product</strong> (or <strong>contraction</strong>) \( \iota_X \colon \Omega^k(M) \to \Omega^{k-1}(M) \) is defined by
\[
(\iota_X \omega)(Y_1, \ldots, Y_{k-1}) = \omega(X, Y_1, \ldots, Y_{k-1}).
\]
By convention, \( \iota_X f = 0 \) for \( f \in \Omega^0(M) \).
</div>

![The interior product ι_X: inserting a vector field X into a k-form to produce a (k-1)-form](/pics/pmath465/interior-product.svg)

The interior product is a graded derivation of degree \( -1 \): it satisfies

\[
\iota_X(\alpha \wedge \beta) = (\iota_X \alpha) \wedge \beta + (-1)^k \alpha \wedge (\iota_X \beta)
\]
for \( \alpha \in \Omega^k(M) \), and \( \iota_X \circ \iota_X = 0 \). It is \( C^\infty(M) \)-linear in \( X \) but not in \( \omega \).

The most remarkable formula involving the interior product connects it to the Lie derivative of differential forms.

<div class="theorem">
<strong>Theorem 9.12 (Cartan's magic formula).</strong> Let \( X \) be a smooth vector field on \( M \) and \( \omega \in \Omega^k(M) \). Then the Lie derivative of \( \omega \) along \( X \) is given by
\[
\mathcal{L}_X \omega = \iota_X(d\omega) + d(\iota_X \omega).
\]
Equivalently, \( \mathcal{L}_X = \iota_X \circ d + d \circ \iota_X \).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Both sides are operators \( \Omega^k(M) \to \Omega^k(M) \). One verifies: (a) both sides agree on 0-forms \( f \), since \( \mathcal{L}_X f = Xf \) and \( \iota_X(df) + d(\iota_X f) = df(X) + 0 = Xf \); (b) both sides satisfy the Leibniz rule with respect to wedge products; (c) both sides commute with \( d \). Since every form can be locally written as sums of products of functions and their differentials, these three properties determine the operator uniquely, and the two sides must agree.
</div>

![Cartan's magic formula: L_X = ι_X ∘ d + d ∘ ι_X, relating the Lie derivative to the exterior derivative and interior product](/pics/pmath465/cartan-magic-formula.svg)

Cartan's formula is indispensable in computations involving the Lie derivative. It also provides the key tool for proving homotopy invariance of de Rham cohomology.

<div class="remark">
<strong>Remark 9.13.</strong> The three operators \( d \), \( \iota_X \), and \( \mathcal{L}_X \) satisfy a beautiful algebraic structure. Defining the graded commutator \( [A, B] = AB - (-1)^{|A||B|} BA \) for graded derivations, we have:
<ul>
<li>\( [d, d] = 2d^2 = 0 \),</li>
<li>\( [\iota_X, \iota_Y] = 0 \),</li>
<li>\( [d, \iota_X] = \mathcal{L}_X \) (Cartan's formula),</li>
<li>\( [\mathcal{L}_X, \iota_Y] = \iota_{[X,Y]} \),</li>
<li>\( [\mathcal{L}_X, d] = 0 \),</li>
<li>\( [\mathcal{L}_X, \mathcal{L}_Y] = \mathcal{L}_{[X,Y]} \).</li>
</ul>
These relations form a representation of the Lie algebra of vector fields on the graded algebra of differential forms.
</div>

---

## Chapter 10: Orientations and Integration on Manifolds

### 10.1 Orientation of Vector Spaces

Before we can integrate differential forms on manifolds, we need the concept of orientation. The idea is simple: an orientation is a consistent choice of "which ordered bases are positively oriented." We begin with the linear algebra.

<div class="definition">
<strong>Definition 10.1 (Orientation of a vector space).</strong> Let \( V \) be a real vector space of dimension \( n \). Two ordered bases \( (v_1, \ldots, v_n) \) and \( (w_1, \ldots, w_n) \) are said to be <strong>consistently oriented</strong> (or <strong>equivalently oriented</strong>) if the change-of-basis matrix \( A \) defined by \( w_j = \sum_i A^i_j v_i \) has positive determinant: \( \det A > 0 \).
</div>

![Orientation of a vector space: two ordered bases are consistently oriented if the change-of-basis matrix has positive determinant](/pics/pmath465/orientation-vector-space.svg)

This relation is an equivalence relation on the set of ordered bases of \( V \), and it partitions the bases into exactly two equivalence classes. An **orientation** of \( V \) is a choice of one of these two equivalence classes. The chosen class is called the class of **positively oriented** bases; the other class consists of **negatively oriented** bases. A vector space together with a choice of orientation is called an **oriented vector space**.

There is an equivalent description using the top exterior power. Since \( \dim \Lambda^n(V^*) = 1 \), a nonzero element \( \mu \in \Lambda^n(V^*) \) determines an orientation: a basis \( (v_1, \ldots, v_n) \) is positively oriented if and only if \( \mu(v_1, \ldots, v_n) > 0 \). Two nonzero \( n \)-forms \( \mu \) and \( \mu' \) determine the same orientation if and only if \( \mu' = c\mu \) for some \( c > 0 \).

### 10.2 Orientations of Manifolds

We now extend the notion of orientation from vector spaces to manifolds by requiring a consistent, continuously varying choice of orientation on each tangent space.

<div class="definition">
<strong>Definition 10.2 (Orientation of a manifold).</strong> A smooth manifold \( M \) of dimension \( n \) is <strong>orientable</strong> if there exists a smooth atlas \( \{(U_\alpha, \varphi_\alpha)\} \) such that all transition maps \( \varphi_\beta \circ \varphi_\alpha^{-1} \) have positive Jacobian determinant everywhere. Such an atlas is called an <strong>oriented atlas</strong>, and a choice of oriented atlas determines an <strong>orientation</strong> of \( M \). A manifold equipped with an orientation is called an <strong>oriented manifold</strong>.
</div>

Equivalently, \( M \) is orientable if and only if there exists a nowhere-vanishing smooth \( n \)-form on \( M \). This is the most useful characterization in practice.

![Orientable vs non-orientable manifolds: the torus is orientable while the Mobius band is not](/pics/pmath465/orientable-vs-nonorientable.svg)

<div class="proposition">
<strong>Proposition 10.3.</strong> A smooth \( n \)-manifold \( M \) is orientable if and only if there exists \( \mu \in \Omega^n(M) \) such that \( \mu_p \neq 0 \) for all \( p \in M \). Two such forms \( \mu \) and \( \mu' \) determine the same orientation if and only if \( \mu' = f\mu \) for some strictly positive smooth function \( f > 0 \).
</div>

<div class="example">
<strong>Example 10.4.</strong>
<ul>
<li>Every \( \mathbb{R}^n \) is orientable, with the standard orientation given by \( dx^1 \wedge \cdots \wedge dx^n \).</li>
<li>Every sphere \( S^n \) is orientable.</li>
<li>Every Lie group is orientable (any nonzero left-invariant \( n \)-form is nowhere vanishing).</li>
<li>The Möbius band is not orientable.</li>
<li>The real projective space \( \mathbb{R}P^n \) is orientable if and only if \( n \) is odd.</li>
</ul>
</div>

A smooth map \( F \colon M \to N \) between oriented \( n \)-manifolds is **orientation-preserving** if the differential \( dF_p \colon T_pM \to T_{F(p)}N \) maps positively oriented bases to positively oriented bases for all \( p \), and **orientation-reversing** if it reverses the orientation at every point. For a diffeomorphism, this is equivalent to \( F^*\mu_N = f \mu_M \) with \( f > 0 \) everywhere (orientation-preserving) or \( f < 0 \) everywhere (orientation-reversing).

### 10.3 Volume Forms and the Riemannian Volume Form

A nowhere-vanishing \( n \)-form on an oriented \( n \)-manifold serves as a "volume element." On a Riemannian manifold, there is a canonical choice.

<div class="definition">
<strong>Definition 10.5 (Volume form).</strong> A <strong>volume form</strong> on an oriented \( n \)-manifold \( M \) is a nowhere-vanishing smooth \( n \)-form \( \mu \in \Omega^n(M) \) that is positively oriented (i.e., \( \mu(E_1, \ldots, E_n) > 0 \) for every positively oriented frame \( (E_1, \ldots, E_n) \)).
</div>

<div class="theorem">
<strong>Theorem 10.6 (Riemannian volume form).</strong> Let \( (M, g) \) be an oriented Riemannian \( n \)-manifold. There exists a unique volume form \( dV_g \in \Omega^n(M) \), called the <strong>Riemannian volume form</strong>, characterized by \( dV_g(E_1, \ldots, E_n) = 1 \) for every positively oriented orthonormal frame \( (E_1, \ldots, E_n) \).

In local coordinates \( (x^1, \ldots, x^n) \) compatible with the orientation,

\[
dV_g = \sqrt{\det(g_{ij})}\, dx^1 \wedge \cdots \wedge dx^n,
\]
where \( g_{ij} = g\bigl(\frac{\partial}{\partial x^i}, \frac{\partial}{\partial x^j}\bigr) \).
</div>

<div class="example">
<strong>Example 10.7.</strong> On \( \mathbb{R}^n \) with the Euclidean metric, \( dV_g = dx^1 \wedge \cdots \wedge dx^n \). On \( S^2 \) with the round metric in spherical coordinates \( (\theta, \phi) \), we have \( dV_g = \sin\theta\, d\theta \wedge d\phi \).
</div>

<div class="example">
<strong>Example 10.7a (Integrating a 2-form over \(S^2\)).</strong> We compute the integral of the 2-form
\[
\omega = x\,dy \wedge dz + y\,dz \wedge dx + z\,dx \wedge dy
\]
(where \(x, y, z\) are the standard coordinates on \(\mathbb{R}^3\) restricted to \(S^2 \subset \mathbb{R}^3\)) over the unit sphere \(S^2\) with the outward orientation.

We use spherical coordinates \(x = \sin\theta\cos\phi\), \(y = \sin\theta\sin\phi\), \(z = \cos\theta\), where \(\theta \in (0,\pi)\) and \(\phi \in (0, 2\pi)\). First, we compute the pullbacks of the coordinate differentials:

\[
dx = \cos\theta\cos\phi\,d\theta - \sin\theta\sin\phi\,d\phi,
\]
\[
dy = \cos\theta\sin\phi\,d\theta + \sin\theta\cos\phi\,d\phi,
\]
\[
dz = -\sin\theta\,d\theta.
\]
We compute \(dy \wedge dz\):

\[
dy \wedge dz = (\cos\theta\sin\phi\,d\theta + \sin\theta\cos\phi\,d\phi) \wedge (-\sin\theta\,d\theta)
= -\sin^2\theta\cos\phi\,d\phi \wedge d\theta = \sin^2\theta\cos\phi\,d\theta \wedge d\phi.
\]
Similarly, \(dz \wedge dx = \sin^2\theta\sin\phi\,d\theta \wedge d\phi\) and \(dx \wedge dy = \sin\theta\cos\theta\,d\theta \wedge d\phi\) — but we can compute the sum more efficiently. Note that

\[
x\,dy \wedge dz + y\,dz \wedge dx + z\,dx \wedge dy
\]
restricted to \(S^2\) equals the Riemannian volume form \(\sin\theta\,d\theta \wedge d\phi\). Indeed, the form \(\omega\) is the standard area form on the sphere; one can verify:

\[
x \cdot \sin^2\theta\cos\phi + y \cdot \sin^2\theta\sin\phi + z \cdot \sin\theta\cos\theta
\]
\[
= \sin^2\theta\cos^2\phi + \sin^2\theta\sin^2\phi + \cos^2\theta\sin\theta
= \sin^2\theta + \cos^2\theta\sin\theta.
\]
A cleaner approach: the outward unit normal to \(S^2\) at a point \((x,y,z)\) is \(\nu = (x,y,z)\) itself, and the area form equals the contraction \(\iota_\nu(dx \wedge dy \wedge dz)\), which gives precisely \(\omega\). Therefore

\[
\int_{S^2} \omega = \int_{S^2} dV_{g_{S^2}} = \text{area of } S^2 = 4\pi.
\]
This is consistent with the divergence theorem: \(d\omega = (1+1+1)\,dx \wedge dy \wedge dz = 3\,dV_{\mathbb{R}^3}\), so

\[
\int_{S^2} \omega = \int_{B^3} d\omega = 3 \cdot \text{vol}(B^3) = 3 \cdot \frac{4\pi}{3} = 4\pi. \qquad \checkmark
\]
</div>

### 10.4 Integration of Differential Forms

We are now in a position to define integration of differential forms on oriented manifolds. The key observation is that an \( n \)-form on an oriented \( n \)-manifold can be integrated using partitions of unity, because a top-degree form transforms under coordinate changes by the absolute value of the Jacobian determinant (with the correct sign, thanks to orientation).

<div class="definition">
<strong>Definition 10.8 (Integration of a compactly supported \( n \)-form).</strong> Let \( M \) be an oriented smooth \( n \)-manifold and \( \omega \in \Omega^n_c(M) \) a compactly supported \( n \)-form.
<ol>
<li><strong>Single chart:</strong> If \( \operatorname{supp}(\omega) \) is contained in a single positively oriented coordinate chart \( (U, \varphi) \) with coordinates \( (x^1, \ldots, x^n) \), write \( \omega = f\, dx^1 \wedge \cdots \wedge dx^n \) on \( U \), and define
\[
\int_M \omega = \int_{\varphi(U)} f \circ \varphi^{-1}\, dx^1 \cdots dx^n,
\]
where the right-hand side is the ordinary Lebesgue integral on \( \mathbb{R}^n \).</li>
<li><strong>General case:</strong> Choose a partition of unity \( \{\psi_\alpha\} \) subordinate to a positively oriented atlas, and define
\[
\int_M \omega = \sum_\alpha \int_M \psi_\alpha \omega.
\]</li>
</ol>
</div>

The crucial point is that this definition is independent of the choice of oriented atlas and partition of unity. This follows from the change-of-variables formula for multiple integrals: if \( \varphi_\beta \circ \varphi_\alpha^{-1} \) is the transition map, the Jacobian determinant is positive (by the orientation assumption), so the absolute value signs in the change-of-variables formula can be dropped.

<div class="proposition">
<strong>Proposition 10.9 (Properties of integration).</strong>
<ol>
<li><strong>Linearity:</strong> \( \int_M (a\omega + b\eta) = a \int_M \omega + b \int_M \eta \).</li>
<li><strong>Orientation reversal:</strong> If \( \overline{M} \) denotes \( M \) with the opposite orientation, then \( \int_{\overline{M}} \omega = -\int_M \omega \).</li>
<li><strong>Diffeomorphism invariance:</strong> If \( F \colon M \to N \) is an orientation-preserving diffeomorphism, then \( \int_N \omega = \int_M F^*\omega \).</li>
</ol>
</div>

### 10.5 Manifolds with Boundary and Induced Orientation

To state Stokes's theorem, we need manifolds with boundary and an orientation convention for the boundary.

Recall that a smooth manifold with boundary \( M \) is locally modeled on the upper half-space \( \mathbb{H}^n = \{x \in \mathbb{R}^n : x^n \ge 0\} \). The boundary \( \partial M \) is a smooth \( (n-1) \)-manifold (without boundary).

<div class="definition">
<strong>Definition 10.10 (Induced orientation on the boundary).</strong> Let \( M \) be an oriented smooth \( n \)-manifold with boundary. At each point \( p \in \partial M \), the outward-pointing normal vector \( \nu \) is the unique vector in \( T_pM \setminus T_p(\partial M) \) pointing "out of" \( M \). The <strong>induced orientation</strong> (or <strong>Stokes orientation</strong>) on \( \partial M \) is defined by declaring an ordered basis \( (v_1, \ldots, v_{n-1}) \) of \( T_p(\partial M) \) to be positively oriented if and only if \( (\nu, v_1, \ldots, v_{n-1}) \) is a positively oriented basis of \( T_pM \).
</div>

![Induced orientation on the boundary: the outward normal ν followed by a positively oriented basis of T_p(∂M) gives a positively oriented basis of T_pM](/pics/pmath465/boundary-induced-orientation.svg)

<div class="remark">
<strong>Remark 10.11.</strong> This is sometimes paraphrased as the "outward normal first" convention. For \( M = [a,b] \subset \mathbb{R} \), the boundary \( \partial M = \{a\} \cup \{b\} \) has the orientation where \( \{b\} \) is positively oriented and \( \{a\} \) is negatively oriented. The fundamental theorem of calculus \( \int_a^b f'(x)\, dx = f(b) - f(a) \) is the 1-dimensional case of Stokes's theorem.
</div>

### 10.6 Stokes's Theorem

We now arrive at the crowning result of the theory of differential forms and integration.

<div class="theorem">
<strong>Theorem 10.12 (Stokes's Theorem).</strong> Let \( M \) be an oriented smooth \( n \)-manifold with boundary (possibly empty), and let \( \omega \in \Omega^{n-1}_c(M) \) be a compactly supported \( (n-1) \)-form. Then
\[
\int_M d\omega = \int_{\partial M} \omega,
\]
where \( \partial M \) carries the induced (Stokes) orientation. If \( \partial M = \emptyset \), the right-hand side is zero.
</div>

![Stokes's theorem: the integral of dω over M equals the integral of ω over ∂M](/pics/pmath465/stokes-theorem.svg)

<div class="proof">
<strong>Proof sketch.</strong> Using a partition of unity, it suffices to prove the theorem when \( \operatorname{supp}(\omega) \) lies in a single coordinate chart. There are two cases.

<strong>Case 1: Interior chart.</strong> Suppose \( \operatorname{supp}(\omega) \subset U \) where \( U \) is diffeomorphic to an open subset of \( \mathbb{R}^n \). In coordinates, write
\[
\omega = \sum_{j=1}^{n} (-1)^{j-1} f_j\, dx^1 \wedge \cdots \wedge \widehat{dx^j} \wedge \cdots \wedge dx^n.
\]
Then

\[
d\omega = \Bigl(\sum_{j=1}^{n} \frac{\partial f_j}{\partial x^j}\Bigr) dx^1 \wedge \cdots \wedge dx^n.
\]
The integral \( \int_M d\omega = \sum_j \int_{\mathbb{R}^n} \frac{\partial f_j}{\partial x^j}\, dx^1 \cdots dx^n \). Each term vanishes by iterated integration: integrating \( \frac{\partial f_j}{\partial x^j} \) with respect to \( x^j \) over all of \( \mathbb{R} \), the compact support ensures the integral of the derivative is zero. Since \( U \cap \partial M = \emptyset \), the right-hand side is also zero.

<strong>Case 2: Boundary chart.</strong> Suppose \( \operatorname{supp}(\omega) \subset U \) where \( U \) is diffeomorphic to an open subset of \( \mathbb{H}^n = \{x^n \ge 0\} \). The computation is similar, but now integrating \( \frac{\partial f_n}{\partial x^n} \) over \( x^n \in [0, \infty) \) yields a boundary contribution. Specifically,
\[
\int_0^\infty \frac{\partial f_n}{\partial x^n}\, dx^n = -f_n(x^1, \ldots, x^{n-1}, 0),
\]
and tracking signs using the induced orientation shows this equals \( \int_{\partial M} \omega \).
</div>

### 10.7 Classical Special Cases of Stokes's Theorem

The classical integral theorems of vector calculus are all special cases of Stokes's theorem. This unification is one of the great achievements of the language of differential forms.

<div class="corollary">
<strong>Corollary 10.13 (Fundamental Theorem of Calculus).</strong> If \( f \colon [a,b] \to \mathbb{R} \) is smooth, then
\[
\int_a^b f'(t)\, dt = f(b) - f(a).
\]
This is Stokes's theorem with \( M = [a,b] \), \( \omega = f \), and \( d\omega = f'\, dt \).
</div>

<div class="corollary">
<strong>Corollary 10.14 (Green's theorem).</strong> Let \( D \subset \mathbb{R}^2 \) be a compact region with smooth boundary \( \partial D \), and let \( P, Q \in C^\infty(\mathbb{R}^2) \). Then
\[
\int_D \Bigl(\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y}\Bigr)\, dx\, dy = \oint_{\partial D} (P\, dx + Q\, dy).
\]
This is Stokes's theorem with \( \omega = P\, dx + Q\, dy \).
</div>

![Green's theorem: the double integral of the curl over a planar region D equals the line integral around its boundary ∂D](/pics/pmath465/greens-theorem.svg)

<div class="corollary">
<strong>Corollary 10.15 (Classical Stokes's theorem).</strong> Let \( \Sigma \subset \mathbb{R}^3 \) be an oriented compact surface with boundary \( \partial \Sigma \), and let \( \mathbf{F} \) be a smooth vector field on \( \mathbb{R}^3 \). Then
\[
\iint_\Sigma (\nabla \times \mathbf{F}) \cdot d\mathbf{S} = \oint_{\partial \Sigma} \mathbf{F} \cdot d\mathbf{r}.
\]
</div>

![Classical Stokes's theorem: the flux of the curl through a surface Σ equals the circulation of F around the boundary ∂Σ](/pics/pmath465/classical-stokes.svg)

<div class="corollary">
<strong>Corollary 10.16 (Divergence theorem).</strong> Let \( \Omega \subset \mathbb{R}^3 \) be a compact region with smooth boundary \( \partial \Omega \), and let \( \mathbf{F} \) be a smooth vector field. Then
\[
\iiint_\Omega (\nabla \cdot \mathbf{F})\, dV = \iint_{\partial \Omega} \mathbf{F} \cdot d\mathbf{S}.
\]
This is Stokes's theorem with \( \omega = F^1\, dy \wedge dz + F^2\, dz \wedge dx + F^3\, dx \wedge dy \).
</div>

![The divergence theorem: the triple integral of div F over a region Ω equals the flux of F through the boundary ∂Ω](/pics/pmath465/divergence-theorem.svg)

<div class="example">
<strong>Example 10.12a (Stokes' theorem on the upper hemisphere).</strong> Let \(M = \{(x,y,z) \in S^2 : z \geq 0\}\) be the closed upper hemisphere, oriented by the outward normal. Its boundary is \(\partial M = \{(x,y,z) \in S^2 : z = 0\} = S^1\) (the equatorial circle), oriented counterclockwise when viewed from above.

Consider the 1-form \(\omega = -y\,dx + x\,dy\) on \(\mathbb{R}^3\). We compute both sides of Stokes' theorem \(\int_M d\omega = \int_{\partial M} \omega\).

**Right-hand side:** Parametrise \(\partial M\) by \(\gamma(t) = (\cos t, \sin t, 0)\), \(t \in [0, 2\pi]\). Then

\[
\int_{\partial M} \omega = \int_0^{2\pi} (-\sin t)(-\sin t) + (\cos t)(\cos t)\,dt = \int_0^{2\pi} 1\,dt = 2\pi.
\]

**Left-hand side:** We compute \(d\omega = d(-y\,dx + x\,dy) = -dy \wedge dx + dx \wedge dy = 2\,dx \wedge dy\). We integrate over the upper hemisphere using the parametrisation \(F(\theta, \phi) = (\sin\theta\cos\phi, \sin\theta\sin\phi, \cos\theta)\) for \(\theta \in [0, \pi/2]\), \(\phi \in [0, 2\pi]\). The pullback of \(dx \wedge dy\) under \(F\) is \(\cos\theta\sin\theta\,d\theta \wedge d\phi\) (the \(z\)-component of the area form). Hence

\[
\int_M d\omega = \int_0^{2\pi}\int_0^{\pi/2} 2\cos\theta\sin\theta\,d\theta\,d\phi = 2\pi \int_0^{\pi/2} \sin(2\theta)\,d\theta = 2\pi \cdot \left[-\frac{\cos(2\theta)}{2}\right]_0^{\pi/2} = 2\pi \cdot 1 = 2\pi. \checkmark
\]
Both sides equal \(2\pi\), confirming Stokes' theorem.
</div>

### 10.8 Divergence and the Divergence Theorem on Riemannian Manifolds

On a Riemannian manifold \( (M, g) \), one can define the divergence of a vector field and state the divergence theorem in a coordinate-free manner.

<div class="definition">
<strong>Definition 10.17 (Divergence).</strong> Let \( (M, g) \) be an oriented Riemannian manifold with volume form \( dV_g \). The <strong>divergence</strong> of a smooth vector field \( X \) on \( M \) is the smooth function \( \operatorname{div} X \) defined by
\[
\mathcal{L}_X(dV_g) = (\operatorname{div} X)\, dV_g,
\]
or equivalently, \( d(\iota_X\, dV_g) = (\operatorname{div} X)\, dV_g \) (by Cartan's formula, since \( d(dV_g) = 0 \)).
</div>

In local coordinates with \( dV_g = \sqrt{\det g}\, dx^1 \wedge \cdots \wedge dx^n \) and \( X = X^i \partial_i \), one computes

\[
\operatorname{div} X = \frac{1}{\sqrt{\det g}} \frac{\partial}{\partial x^i}\bigl(\sqrt{\det g}\, X^i\bigr).
\]

<div class="theorem">
<strong>Theorem 10.18 (Divergence theorem on Riemannian manifolds).</strong> Let \( (M, g) \) be a compact oriented Riemannian manifold with boundary, and let \( X \) be a smooth vector field on \( M \). Let \( \nu \) be the outward-pointing unit normal along \( \partial M \). Then
\[
\int_M (\operatorname{div} X)\, dV_g = \int_{\partial M} g(X, \nu)\, dV_{\bar{g}},
\]
where \( \bar{g} \) is the induced metric on \( \partial M \).
</div>

<div class="proof">
<strong>Proof.</strong> By Stokes's theorem, \( \int_M d(\iota_X\, dV_g) = \int_{\partial M} \iota_X\, dV_g \). The left-hand side equals \( \int_M (\operatorname{div} X)\, dV_g \). For the right-hand side, one shows that the restriction of \( \iota_X\, dV_g \) to \( \partial M \) equals \( g(X, \nu)\, dV_{\bar{g}} \), which follows from the characterization of the Riemannian volume form.
</div>

---

## Chapter 11: De Rham Cohomology

### 11.1 Closed and Exact Forms

The identity \( d^2 = 0 \) — which states that the exterior derivative of an exterior derivative is always zero — is deceptively simple. Its consequences, however, are profound: it gives rise to a cohomology theory that captures deep topological information about the manifold.

<div class="definition">
<strong>Definition 11.1 (Closed and exact forms).</strong> A differential form \( \omega \in \Omega^k(M) \) is:
<ul>
<li><strong>Closed</strong> if \( d\omega = 0 \).</li>
<li><strong>Exact</strong> if \( \omega = d\eta \) for some \( \eta \in \Omega^{k-1}(M) \).</li>
</ul>
We denote the space of closed \( k \)-forms by \( Z^k(M) = \ker(d \colon \Omega^k(M) \to \Omega^{k+1}(M)) \) and the space of exact \( k \)-forms by \( B^k(M) = \operatorname{im}(d \colon \Omega^{k-1}(M) \to \Omega^k(M)) \).
</div>

Since \( d^2 = 0 \), every exact form is closed: \( B^k(M) \subseteq Z^k(M) \). The central question of de Rham cohomology is: **is every closed form exact?** The answer depends on the topology of \( M \). The discrepancy between closed and exact forms measures the "nontrivial topology" (holes, cycles) of the manifold.

To ground the discussion in physics: in electrostatics, the electric field \(\mathbf{E}\) satisfies \(\nabla \times \mathbf{E} = 0\) (i.e., the 1-form \(E_x\,dx + E_y\,dy + E_z\,dz\) is closed). The question "can \(\mathbf{E}\) be written as \(-\nabla \phi\) for a global potential \(\phi\)?" (i.e., "is the closed 1-form exact?") depends on the topology of the domain. In simply connected space (\(\mathbb{R}^3\) or any contractible region), the Poincaré lemma says yes. But if the domain has a "hole" — such as the region \(\mathbb{R}^3 \setminus \{\text{line}\}\) around an infinite wire — then closed forms need not be exact, and a global potential may not exist. De Rham cohomology is precisely the algebraic gadget that measures this obstruction: \(H^1_{\text{dR}}(M) = 0\) if and only if every closed 1-form on \(M\) is exact, i.e., every irrotational vector field has a global potential.

<div class="example">
<strong>Example 11.2.</strong> Consider the 1-form \( \omega = \frac{-y\, dx + x\, dy}{x^2 + y^2} \) on \( \mathbb{R}^2 \setminus \{0\} \). A direct computation shows \( d\omega = 0 \), so \( \omega \) is closed. However, \( \omega \) is not exact: if we integrate \( \omega \) around the unit circle, we get
\[
\oint_{S^1} \omega = \int_0^{2\pi} d\theta = 2\pi \neq 0.
\]
By Stokes's theorem, if \( \omega = df \) for some function \( f \), then this integral would be zero. Thus \( \omega \) is closed but not exact on \( \mathbb{R}^2 \setminus \{0\} \), reflecting the fact that \( \mathbb{R}^2 \setminus \{0\} \) has a "hole."
</div>

![The punctured plane R^2 \ {0}: the angle form dθ generates H^1, detecting the hole at the origin](/pics/pmath465/derham-punctured-plane.svg)

### 11.2 The De Rham Cohomology Groups

<div class="definition">
<strong>Definition 11.3 (De Rham cohomology).</strong> The <strong>\( k \)-th de Rham cohomology group</strong> of a smooth manifold \( M \) is the quotient vector space
\[
H^k_{\text{dR}}(M) = \frac{Z^k(M)}{B^k(M)} = \frac{\ker(d \colon \Omega^k \to \Omega^{k+1})}{\operatorname{im}(d \colon \Omega^{k-1} \to \Omega^k)}.
\]
Elements of \( H^k_{\text{dR}}(M) \) are equivalence classes \( [\omega] \), where \( \omega \) is a closed \( k \)-form and \( [\omega] = [\omega'] \) if and only if \( \omega - \omega' \) is exact.
</div>

![The de Rham cochain complex: Ω^0 → Ω^1 → ... → Ω^n with d^2 = 0, yielding cohomology H^k = ker d / im d](/pics/pmath465/derham-cohomology-chain.svg)

The de Rham cohomology groups are real vector spaces. They are diffeomorphism invariants of \( M \), and in fact, much more is true — they are homotopy invariants. We begin by computing the simplest case.

<div class="proposition">
<strong>Proposition 11.4.</strong> For any smooth manifold \( M \),
\[
H^0_{\text{dR}}(M) \cong \mathbb{R}^c,
\]
where \( c \) is the number of connected components of \( M \).
</div>

<div class="proof">
<strong>Proof.</strong> A closed 0-form is a smooth function \( f \) with \( df = 0 \), i.e., a locally constant function. Since \( B^0(M) = 0 \) (there are no \( (-1) \)-forms), we have \( H^0_{\text{dR}}(M) = Z^0(M) = \) the space of locally constant functions. On a connected manifold, locally constant functions are constant, so \( H^0_{\text{dR}}(M) \cong \mathbb{R} \). For a manifold with \( c \) connected components, \( H^0_{\text{dR}}(M) \cong \mathbb{R}^c \).
</div>

### 11.3 Functoriality and Diffeomorphism Invariance

Smooth maps between manifolds induce maps on cohomology that go in the "reverse" direction, making de Rham cohomology a contravariant functor.

<div class="proposition">
<strong>Proposition 11.5 (Functoriality).</strong> Let \( F \colon M \to N \) be a smooth map. The pullback \( F^* \colon \Omega^k(N) \to \Omega^k(M) \) satisfies:
<ol>
<li>\( F^<em> \) maps closed forms to closed forms (since \( d \circ F^</em> = F^* \circ d \)).</li>
<li>\( F^<em> \) maps exact forms to exact forms (since \( F^</em>(d\eta) = d(F^*\eta) \)).</li>
</ol>
Therefore \( F^* \) descends to a well-defined linear map on cohomology,

\[
F^<em> \colon H^k_{\text{dR}}(N) \to H^k_{\text{dR}}(M), \quad [\omega] \mapsto [F^</em>\omega].
\]
Moreover:
<ul>
<li>\( (G \circ F)^<em> = F^</em> \circ G^* \) on cohomology.</li>
<li>\( (\mathrm{Id}_M)^<em> = \mathrm{Id}_{H^</em>_{\text{dR}}(M)} \).</li>
</ul>
</div>

<div class="corollary">
<strong>Corollary 11.6 (Diffeomorphism invariance).</strong> If \( F \colon M \to N \) is a diffeomorphism, then \( F^* \colon H^k_{\text{dR}}(N) \to H^k_{\text{dR}}(M) \) is an isomorphism for all \( k \). In particular, \( H^k_{\text{dR}}(M) \cong H^k_{\text{dR}}(N) \).
</div>

### 11.4 Homotopy Invariance

De Rham cohomology is invariant under a much weaker equivalence than diffeomorphism: it is a **homotopy** invariant. This is one of its most powerful features.

<div class="definition">
<strong>Definition 11.7.</strong> Two smooth maps \( F, G \colon M \to N \) are <strong>smoothly homotopic</strong> if there exists a smooth map \( H \colon M \times [0,1] \to N \) such that \( H(p, 0) = F(p) \) and \( H(p, 1) = G(p) \) for all \( p \in M \). Two manifolds \( M \) and \( N \) are <strong>homotopy equivalent</strong> if there exist smooth maps \( F \colon M \to N \) and \( G \colon N \to M \) such that \( G \circ F \) is homotopic to \( \mathrm{Id}_M \) and \( F \circ G \) is homotopic to \( \mathrm{Id}_N \).
</div>

<div class="theorem">
<strong>Theorem 11.8 (Homotopy invariance of de Rham cohomology).</strong> If \( F, G \colon M \to N \) are smoothly homotopic, then
\[
F^<em> = G^</em> \colon H^k_{\text{dR}}(N) \to H^k_{\text{dR}}(M)
\]
for all \( k \). Consequently, homotopy equivalent manifolds have isomorphic de Rham cohomology.
</div>

The proof uses a **chain homotopy** (or **homotopy operator**) \( h \colon \Omega^k(N) \to \Omega^{k-1}(M) \) satisfying the fundamental identity

\[
G^*\omega - F^*\omega = d(h\omega) + h(d\omega)
\]
for all \( \omega \in \Omega^k(N) \). If \( \omega \) is closed, this gives \( G^*\omega - F^*\omega = d(h\omega) \), which means \( [G^*\omega] = [F^*\omega] \) in \( H^k_{\text{dR}}(M) \). The operator \( h \) is constructed explicitly using integration along the fiber of the homotopy \( H \colon M \times [0,1] \to N \).

### 11.5 The Poincaré Lemma

The most fundamental computation in de Rham cohomology is the cohomology of \( \mathbb{R}^n \) (or, more generally, any contractible space).

<div class="theorem">
<strong>Theorem 11.9 (Poincaré Lemma).</strong> For all \( k \ge 1 \),
\[
H^k_{\text{dR}}(\mathbb{R}^n) = 0.
\]
That is, every closed \( k \)-form on \( \mathbb{R}^n \) (with \( k \ge 1 \)) is exact. More generally, the same holds for any star-shaped open subset of \( \mathbb{R}^n \), or any contractible manifold.
</div>

<div class="proof">
<strong>Proof sketch.</strong> The space \( \mathbb{R}^n \) is contractible: the identity map \( \mathrm{Id}_{\mathbb{R}^n} \) is homotopic to the constant map \( c_0 \colon \mathbb{R}^n \to \{0\} \hookrightarrow \mathbb{R}^n \) via the homotopy \( H(x, t) = tx \). By homotopy invariance,
\[
H^k_{\text{dR}}(\mathbb{R}^n) \cong H^k_{\text{dR}}(\{\text{point}\}).
\]
Since the cohomology of a point is \( \mathbb{R} \) in degree 0 and 0 in all positive degrees, the result follows.

More concretely, we construct the homotopy operator \( h \) explicitly. Let \( \omega = \sum_I f_I(x)\, dx^I \) be a closed \( k \)-form on a star-shaped domain (star-shaped about the origin). Define

\[
(h\omega)(x) = \sum_I \sum_{j \in I} \pm \Bigl(\int_0^1 t^{k-1} f_I(tx)\, dt\Bigr) x^j\, dx^{I \setminus \{j\}},
\]
where the precise signs come from contracting with the radial vector field \( R = \sum_i x^i \frac{\partial}{\partial x^i} \) and integrating in \( t \). One then verifies that \( dh\omega + hd\omega = \omega \) for \( k \ge 1 \), so that closed implies exact.
</div>

![The Poincaré lemma: on a contractible domain every closed form is exact, proved via a homotopy operator h](/pics/pmath465/poincare-lemma.svg)

<div class="remark">
<strong>Remark 11.10.</strong> The Poincaré lemma is a local statement: on any sufficiently small open set in a manifold (which is diffeomorphic to a ball, hence star-shaped), every closed form is exact. Thus the failure of a closed form to be exact is a <strong>global</strong> phenomenon, detected by cohomology.
</div>

### 11.6 The Mayer–Vietoris Sequence

The Mayer–Vietoris sequence is the primary computational tool for de Rham cohomology. It allows us to compute the cohomology of a manifold by breaking it into simpler pieces.

<div class="theorem">
<strong>Theorem 11.11 (Mayer–Vietoris sequence).</strong> Let \( M = U \cup V \) where \( U, V \subset M \) are open. There is a long exact sequence of vector spaces:
\[
\cdots \to H^{k-1}_{\text{dR}}(U \cap V) \xrightarrow{\delta^<em>} H^k_{\text{dR}}(M) \xrightarrow{(i^</em>, j^<em>)} H^k_{\text{dR}}(U) \oplus H^k_{\text{dR}}(V) \xrightarrow{k^</em> - \ell^<em>} H^k_{\text{dR}}(U \cap V) \xrightarrow{\delta^</em>} H^{k+1}_{\text{dR}}(M) \to \cdots
\]
where \( i, j \) are the inclusions of \( U, V \) into \( M \), and \( k, \ell \) are the inclusions of \( U \cap V \) into \( U, V \) respectively. The map \( \delta^* \) is the <strong>connecting homomorphism</strong>.
</div>

The sequence arises from the short exact sequence of cochain complexes

\[
0 \to \Omega^*(M) \xrightarrow{(i^*, j^*)} \Omega^*(U) \oplus \Omega^*(V) \xrightarrow{k^* - \ell^*} \Omega^*(U \cap V) \to 0.
\]
Surjectivity of the last map uses a partition of unity argument. The connecting homomorphism \( \delta^* \) is constructed by the usual diagram chase.

![The Mayer-Vietoris long exact sequence connecting the cohomology of M = U ∪ V to that of U, V, and U ∩ V](/pics/pmath465/mayer-vietoris.svg)

The Mayer–Vietoris sequence is extremely powerful because it reduces the computation of cohomology to knowledge of simpler pieces. Combined with the Poincaré lemma (which gives us the cohomology of contractible sets), it allows us to compute the cohomology of many manifolds by induction.

### 11.7 Computations

<div class="example">
<strong>Example 11.12 (Cohomology of \( S^1 \)).</strong> Write \( S^1 = U \cup V \) where \( U \) and \( V \) are open arcs covering \( S^1 \), each contractible, with \( U \cap V \) consisting of two disjoint open arcs (each contractible). The Mayer–Vietoris sequence in degree 0 gives:
\[
0 \to H^0_{\text{dR}}(S^1) \to H^0_{\text{dR}}(U) \oplus H^0_{\text{dR}}(V) \to H^0_{\text{dR}}(U \cap V) \xrightarrow{\delta^*} H^1_{\text{dR}}(S^1) \to 0.
\]
This is \( 0 \to \mathbb{R} \to \mathbb{R}^2 \to \mathbb{R}^2 \xrightarrow{\delta^<em>} H^1_{\text{dR}}(S^1) \to 0 \). The map \( \mathbb{R}^2 \to \mathbb{R}^2 \) has rank 1 (one can verify), so \( \ker \delta^</em> \) is 1-dimensional and \( H^1_{\text{dR}}(S^1) \cong \mathbb{R} \). This confirms our earlier observation that the angle form \( d\theta \) represents a nontrivial cohomology class.
</div>

![Cohomology of S^1: H^0 ≅ R, H^1 ≅ R, computed via Mayer-Vietoris with two contractible arcs](/pics/pmath465/cohomology-circle.svg)

<div class="example">
<strong>Example 11.13 (Cohomology of \( S^n \) for \( n \ge 1 \)).</strong> Using the Mayer–Vietoris sequence with \( U \) and \( V \) being the complements of the north and south poles (each contractible, \( U \cap V \simeq S^{n-1} \)), one shows by induction:
\[
H^k_{\text{dR}}(S^n) \cong \begin{cases} \mathbb{R} & \text{if } k = 0 \text{ or } k = n, \\ 0 & \text{otherwise.} \end{cases}
\]
The generator of \( H^n_{\text{dR}}(S^n) \) is the class of any volume form on \( S^n \), normalized so that \( \int_{S^n} \omega = 1 \).
</div>

![Cohomology of S^n: H^k is R for k = 0 and k = n, and 0 otherwise](/pics/pmath465/cohomology-sphere.svg)

<div class="example">
<strong>Example 11.14 (Cohomology of \( T^n \)).</strong> The \( n \)-torus \( T^n = S^1 \times \cdots \times S^1 \) has cohomology
\[
H^k_{\text{dR}}(T^n) \cong \mathbb{R}^{\binom{n}{k}}.
\]
This can be proved using the Künneth formula for de Rham cohomology: if \( M \) and \( N \) are manifolds of finite type, then

\[
H^k_{\text{dR}}(M \times N) \cong \bigoplus_{p+q=k} H^p_{\text{dR}}(M) \otimes H^q_{\text{dR}}(N).
\]
For \( T^n \), this gives \( H^<em>_{\text{dR}}(T^n) \cong \Lambda^</em>(\mathbb{R}^n) \), the exterior algebra on \( n \) generators of degree 1. The generators of \( H^1_{\text{dR}}(T^n) \) are represented by the \( n \) angle forms \( d\theta^1, \ldots, d\theta^n \), and the generators in higher degree are their wedge products.
</div>

### 11.8 Top Cohomology and Degree Theory

The top-degree cohomology of a manifold is closely related to orientability.

<div class="theorem">
<strong>Theorem 11.15 (Top cohomology).</strong> Let \( M \) be a connected smooth \( n \)-manifold without boundary. Then:
<ol>
<li>If \( M \) is compact and orientable, then \( H^n_{\text{dR}}(M) \cong \mathbb{R} \). Integration gives an isomorphism \( \int_M \colon H^n_{\text{dR}}(M) \xrightarrow{\sim} \mathbb{R} \).</li>
<li>If \( M \) is compact and not orientable, then \( H^n_{\text{dR}}(M) = 0 \).</li>
<li>If \( M \) is not compact, then \( H^n_{\text{dR}}(M) = 0 \).</li>
</ol>
</div>

This theorem has a beautiful application to degree theory. If \( F \colon M \to N \) is a smooth map between compact, connected, oriented \( n \)-manifolds, the induced map \( F^* \colon H^n_{\text{dR}}(N) \to H^n_{\text{dR}}(M) \) is a linear map \( \mathbb{R} \to \mathbb{R} \), hence multiplication by a scalar. This scalar is the **degree** of \( F \).

<div class="definition">
<strong>Definition 11.16 (Degree of a smooth map).</strong> Let \( F \colon M \to N \) be a smooth map between compact, connected, oriented \( n \)-manifolds. The <strong>degree</strong> of \( F \), denoted \( \deg F \), is the unique real number such that
\[
\int_M F^*\omega = (\deg F) \int_N \omega
\]
for all \( \omega \in \Omega^n(N) \).
</div>

The degree is always an integer, and it counts (with signs according to orientation) the number of preimages of a regular value. It is a homotopy invariant: homotopic maps have the same degree.

### 11.9 Poincaré Duality

Poincaré duality is the crowning theorem of the de Rham theory of compact orientable manifolds. It reveals a striking symmetry among the cohomology groups: the \( k \)-th and \( (n-k) \)-th de Rham cohomology groups of a compact oriented \( n \)-manifold are canonically dual to each other. This symmetry has deep consequences for the topology of such manifolds and is one of the primary reasons that compact orientable manifolds are so well-behaved compared to their non-compact or non-orientable counterparts.

**The Poincaré pairing.** Let \( M \) be a compact, connected, oriented, smooth manifold of dimension \( n \), without boundary. For \( 0 \leq k \leq n \), define the **Poincaré pairing**

\[
\langle \cdot, \cdot \rangle \colon H^k_{\text{dR}}(M) \times H^{n-k}_{\text{dR}}(M) \to \mathbb{R}, \qquad \langle [\alpha], [\beta] \rangle = \int_M \alpha \wedge \beta.
\]

We must first verify that this is well-defined, i.e., that the integral depends only on the cohomology classes \( [\alpha] \) and \( [\beta] \), not on the choice of representatives. Suppose \( \alpha' = \alpha + d\mu \) is another representative of \( [\alpha] \), where \( d\beta = 0 \). Then

\[
\int_M \alpha' \wedge \beta = \int_M \alpha \wedge \beta + \int_M d\mu \wedge \beta = \int_M \alpha \wedge \beta + \int_M d(\mu \wedge \beta),
\]

where we used \( d\mu \wedge \beta = d(\mu \wedge \beta) \pm \mu \wedge d\beta = d(\mu \wedge \beta) \) since \( d\beta = 0 \). By Stokes' theorem and the fact that \( \partial M = \emptyset \), the last integral vanishes. An analogous argument handles a change of representative for \( [\beta] \). Hence the Poincaré pairing is well-defined.

<div class="theorem">
<strong>Theorem 11.17 (Poincaré Duality).</strong> Let \( M \) be a compact, connected, oriented smooth \( n \)-manifold without boundary. Then for each \( 0 \leq k \leq n \), the Poincaré pairing
\[
\langle \cdot, \cdot \rangle \colon H^k_{\text{dR}}(M) \times H^{n-k}_{\text{dR}}(M) \to \mathbb{R}
\]
is <strong>nondegenerate</strong>. Consequently, there is a canonical isomorphism

\[
H^k_{\text{dR}}(M) \cong \bigl(H^{n-k}_{\text{dR}}(M)\bigr)^*.
\]
Since the de Rham cohomology groups are finite-dimensional (which follows from the fact that compact manifolds admit finite good covers), this implies

\[
H^k_{\text{dR}}(M) \cong H^{n-k}_{\text{dR}}(M).
\]
</div>

<div class="remark">
<strong>Remark (On nondegeneracy).</strong> Showing that the Poincaré pairing is nondegenerate — i.e., that for each nonzero \( [\alpha] \in H^k_{\text{dR}}(M) \) there exists \( [\beta] \in H^{n-k}_{\text{dR}}(M) \) with \( \langle [\alpha], [\beta] \rangle \neq 0 \) — is the hard part of the theorem. There are two principal approaches. The first uses <strong>Hodge theory</strong>: on a Riemannian manifold, every de Rham cohomology class has a unique harmonic representative, and the Hodge star operator \( \star \colon \Omega^k \to \Omega^{n-k} \) maps harmonic \( k \)-forms to harmonic \( (n-k) \)-forms, giving an explicit isomorphism. The second approach uses a <strong>Mayer–Vietoris induction</strong>: one verifies nondegeneracy for contractible open sets (where both sides vanish except in degree 0), and then bootstraps using the five lemma applied to the Mayer–Vietoris sequence to handle general compact manifolds built from such pieces.
</div>

**Consequences for Betti numbers.** The **Betti numbers** of \( M \) are \( b_k = \dim H^k_{\text{dR}}(M) \). Poincaré duality immediately yields

\[
b_k = b_{n-k} \quad \text{for all } 0 \leq k \leq n.
\]
This symmetry of Betti numbers is a powerful constraint on the topology of compact oriented manifolds.

<div class="corollary">
<strong>Corollary 11.18.</strong> Let \( M \) be a compact, connected, oriented smooth \( n \)-manifold without boundary with \( n \) odd. Then the Euler characteristic \( \chi(M) = \sum_{k=0}^n (-1)^k b_k = 0 \).
</div>

<div class="proof">
<strong>Proof.</strong> By Poincaré duality, \( b_k = b_{n-k} \). Pairing the terms in the alternating sum:
\[
\chi(M) = \sum_{k=0}^n (-1)^k b_k = \sum_{k=0}^{(n-1)/2} \bigl[ (-1)^k b_k + (-1)^{n-k} b_{n-k} \bigr] = \sum_{k=0}^{(n-1)/2} b_k \bigl[ (-1)^k + (-1)^{n-k} \bigr].
\]
Since \( n \) is odd, \( (-1)^{n-k} = (-1)^n (-1)^{-k} = -(-1)^{-k} = -(-1)^k \cdot (-1)^{2k} / (-1)^{2k} \); more directly, \( (-1)^k + (-1)^{n-k} = (-1)^k(1 + (-1)^n) = (-1)^k(1-1) = 0 \). Hence every term vanishes and \( \chi(M) = 0 \).
</div>

**Examples.**

<div class="example">
<strong>Example 11.19 (Spheres).</strong> For \( S^n \) (\( n \geq 1 \)), the de Rham cohomology is \( H^0_{\text{dR}}(S^n) \cong \mathbb{R} \), \( H^n_{\text{dR}}(S^n) \cong \mathbb{R} \), and \( H^k_{\text{dR}}(S^n) = 0 \) for \( 0 < k < n \). The Betti numbers are \( b_0 = b_n = 1 \) and \( b_k = 0 \) otherwise. This is perfectly symmetric about \( n/2 \): \( b_k = b_{n-k} \) for all \( k \), as Poincaré duality predicts. For \( n \) odd, the Euler characteristic \( \chi(S^n) = 1 + (-1)^n = 1 - 1 = 0 \), consistent with Corollary 11.18.
</div>

<div class="example">
<strong>Example 11.20 (The torus \( T^2 \)).</strong> For \( T^2 = S^1 \times S^1 \), by the Künneth formula (or direct computation using the de Rham complex), \( \dim H^0_{\text{dR}}(T^2) = 1 \), \( \dim H^1_{\text{dR}}(T^2) = 2 \), \( \dim H^2_{\text{dR}}(T^2) = 1 \). The Betti numbers \( (b_0, b_1, b_2) = (1, 2, 1) \) are symmetric: \( b_0 = b_2 = 1 \) and \( b_1 = b_1 = 2 \), consistent with Poincaré duality. The Euler characteristic is \( \chi(T^2) = 1 - 2 + 1 = 0 \), which can also be confirmed geometrically.
</div>

<div class="remark">
<strong>Remark (Non-orientable manifolds).</strong> Poincaré duality fails for non-orientable manifolds. The simplest example is \( \mathbb{RP}^2 \): one computes \( H^0_{\text{dR}}(\mathbb{RP}^2) \cong \mathbb{R} \) and \( H^1_{\text{dR}}(\mathbb{RP}^2) = 0 \) and \( H^2_{\text{dR}}(\mathbb{RP}^2) = 0 \) (the top cohomology vanishes because \( \mathbb{RP}^2 \) is non-orientable and compact). Since \( b_0 = 1 \) but \( b_2 = 0 \), we have \( b_0 \neq b_2 \), violating the symmetry that Poincaré duality would predict. In the non-orientable setting, a version of Poincaré duality can be recovered using cohomology with coefficients in the orientation sheaf, but this requires the machinery of sheaf theory and falls outside the scope of these notes.
</div>

---

## Chapter 12: Integral Curves, Flows, and the Frobenius Theorem

### 12.1 Integral Curves of Vector Fields

A vector field on a smooth manifold assigns a "direction of motion" to each point. The integral curves of a vector field are the curves that are everywhere tangent to the field — they represent the trajectories of particles moving according to the vector field.

![A rotation vector field on R² with its circular integral curves and singular point at the origin](/pics/pmath465/vector-field-integral-curves.svg)

<div class="definition">
<strong>Definition 12.1 (Integral curve).</strong> Let \( V \) be a smooth vector field on a smooth manifold \( M \). An <strong>integral curve</strong> of \( V \) is a smooth curve \( \gamma \colon I \to M \) (where \( I \subseteq \mathbb{R} \) is an interval) satisfying
\[
\gamma'(t) = V_{\gamma(t)} \quad \text{for all } t \in I.
\]
In local coordinates \( (x^1, \ldots, x^n) \), if \( V = V^i \frac{\partial}{\partial x^i} \) and \( \gamma(t) = (\gamma^1(t), \ldots, \gamma^n(t)) \), this becomes the system of ordinary differential equations

\[
\frac{d\gamma^i}{dt}(t) = V^i(\gamma^1(t), \ldots, \gamma^n(t)), \quad i = 1, \ldots, n.
\]
</div>

The existence and uniqueness of integral curves is guaranteed by the fundamental theorem of ODEs.

<div class="theorem">
<strong>Theorem 12.2 (Picard–Lindelöf / Existence and uniqueness).</strong> Let \( V \) be a smooth vector field on \( M \), and let \( p \in M \). Then there exists an open interval \( I \) containing \( 0 \) and a smooth curve \( \gamma \colon I \to M \) such that \( \gamma(0) = p \) and \( \gamma'(t) = V_{\gamma(t)} \) for all \( t \in I \). Moreover, any two integral curves starting at \( p \) agree on the intersection of their domains.
</div>

By the uniqueness assertion, for each \( p \in M \) there is a unique **maximal integral curve** \( \gamma_p \colon I_p \to M \) starting at \( p \), defined on the largest possible interval \( I_p \).

<div class="example">
<strong>Example 12.3.</strong>
<ul>
<li>On \( \mathbb{R}^2 \), the vector field \( V = -y\, \frac{\partial}{\partial x} + x\, \frac{\partial}{\partial y} \) has integral curves \( \gamma(t) = (r\cos(t+\theta_0), r\sin(t+\theta_0)) \), which are circles centered at the origin.</li>
<li>On \( \mathbb{R} \), the vector field \( V = x^2 \frac{\partial}{\partial x} \) has integral curves \( \gamma(t) = \frac{x_0}{1 - x_0 t} \) for \( \gamma(0) = x_0 \neq 0 \). For \( x_0 > 0 \), this blows up in finite time at \( t = 1/x_0 \), showing that integral curves need not exist for all time.</li>
</ul>
</div>

### 12.2 Flows

The collection of all integral curves of a vector field assembles into a single object called the **flow** of the vector field.

<div class="definition">
<strong>Definition 12.4 (Global flow).</strong> A <strong>global flow</strong> on \( M \) is a smooth map \( \Theta \colon \mathbb{R} \times M \to M \), written \( \Theta(t, p) = \Theta_t(p) \), satisfying:
<ol>
<li>\( \Theta_0 = \mathrm{Id}_M \), i.e., \( \Theta_0(p) = p \) for all \( p \).</li>
<li>\( \Theta_{t+s} = \Theta_t \circ \Theta_s \) for all \( t, s \in \mathbb{R} \) (the <strong>group law</strong>).</li>
</ol>
A vector field that generates a global flow (i.e., all maximal integral curves are defined for all \( t \in \mathbb{R} \)) is called <strong>complete</strong>.
</div>

The group law says that flowing for time \( s \) and then for time \( t \) is the same as flowing for time \( t + s \). In particular, each \( \Theta_t \) is a diffeomorphism of \( M \) with inverse \( \Theta_{-t} \). Thus a global flow is a smooth action of \( (\mathbb{R}, +) \) on \( M \) — a one-parameter group of diffeomorphisms.

Not every vector field is complete. When integral curves may fail to exist for all time, we need the notion of a local flow.

<div class="definition">
<strong>Definition 12.5 (Local flow).</strong> A <strong>local flow</strong> (or <strong>flow</strong>) of a vector field \( V \) is a smooth map \( \Theta \colon \mathcal{D} \to M \), where \( \mathcal{D} \subseteq \mathbb{R} \times M \) is an open subset containing \( \{0\} \times M \), such that for each \( p \in M \), the curve \( t \mapsto \Theta_t(p) \) is the maximal integral curve of \( V \) starting at \( p \).
</div>

The key theorems about flows establish existence, uniqueness, and the group property in the local setting.

<div class="theorem">
<strong>Theorem 12.6 (Fundamental Theorem of Flows I).</strong> Let \( V \) be a smooth vector field on \( M \). There exists a unique maximal flow \( \Theta \colon \mathcal{D} \to M \) of \( V \). The <strong>flow domain</strong> \( \mathcal{D} \) is an open subset of \( \mathbb{R} \times M \) containing \( \{0\} \times M \), and \( \Theta \) is smooth. For each \( p \in M \), the curve \( t \mapsto \Theta_t(p) \) is the maximal integral curve of \( V \) starting at \( p \), defined on the maximal interval \( I_p = \{t \in \mathbb{R} : (t, p) \in \mathcal{D}\} \).
</div>

<div class="theorem">
<strong>Theorem 12.7 (Fundamental Theorem of Flows II — the group law).</strong> Let \( \Theta \colon \mathcal{D} \to M \) be the maximal flow of a smooth vector field \( V \). Then:
<ol>
<li>For each \( (t, p) \in \mathcal{D} \) and \( s \in \mathbb{R} \) such that \( (s, \Theta_t(p)) \in \mathcal{D} \), we have \( (t+s, p) \in \mathcal{D} \) and
\[
\Theta_s(\Theta_t(p)) = \Theta_{t+s}(p).
\]</li>
<li>For each \( t \) such that \( \Theta_t \) is defined, it is a diffeomorphism from its domain onto its image, with \( \Theta_t^{-1} = \Theta_{-t} \).</li>
</ol>
</div>

Completeness is guaranteed under natural geometric conditions.

<div class="proposition">
<strong>Proposition 12.8 (Sufficient conditions for completeness).</strong>
<ol>
<li>If \( V \) has compact support, then \( V \) is complete.</li>
<li>If \( M \) is compact, then every smooth vector field on \( M \) is complete.</li>
</ol>
</div>

<div class="proof">
<strong>Proof sketch.</strong> For (2), suppose \( M \) is compact and \( V \) is a smooth vector field. The maximal integral curve \( \gamma \colon (a, b) \to M \) through any point must have \( a = -\infty \) and \( b = +\infty \). If, say, \( b < \infty \), then by compactness of \( M \), \( \gamma(t) \) has a convergent subsequence as \( t \to b^- \), and one can extend \( \gamma \) beyond \( b \) using the local existence theorem, contradicting maximality. Assertion (1) follows similarly, since the integral curve eventually leaves the support of \( V \) and then remains constant.
</div>

### 12.3 Regular and Singular Points; the Canonical Form Theorem

The behavior of integral curves is qualitatively different at points where the vector field vanishes compared to points where it does not.

<div class="definition">
<strong>Definition 12.9 (Regular and singular points).</strong> Let \( V \) be a smooth vector field on \( M \). A point \( p \in M \) is:
<ul>
<li>A <strong>singular point</strong> (or <strong>zero</strong>) of \( V \) if \( V_p = 0 \).</li>
<li>A <strong>regular point</strong> of \( V \) if \( V_p \neq 0 \).</li>
</ul>
</div>

![Regular and singular points: at a regular point V_p ≠ 0 and integral curves flow through; at a singular point V_p = 0 and the curve is constant](/pics/pmath465/regular-vs-singular-points.svg)

<div class="lemma">
<strong>Lemma 12.10.</strong> If \( p \) is a singular point of \( V \), then the integral curve through \( p \) is the constant curve \( \gamma(t) = p \) for all \( t \). If \( p \) is a regular point, then the maximal integral curve through \( p \) is an immersion (i.e., \( \gamma'(t) \neq 0 \) for all \( t \)).
</div>

Near a regular point, the flow of a vector field can be completely "straightened out" by a suitable choice of coordinates. This is the content of the following important theorem.

<div class="theorem">
<strong>Theorem 12.11 (Canonical Form Theorem / Flow-Box Theorem).</strong> Let \( V \) be a smooth vector field on \( M \) and let \( p \) be a regular point of \( V \). Then there exists a smooth coordinate chart \( (U, \varphi) \) centered at \( p \) with coordinates \( (y^1, \ldots, y^n) \) such that
\[
V = \frac{\partial}{\partial y^1} \quad \text{on } U.
\]
In these coordinates, the integral curves of \( V \) are simply the lines \( t \mapsto (y^1 + t, y^2, \ldots, y^n) \) — they are straight and parallel.
</div>

<div class="proof">
<strong>Proof sketch.</strong> Since \( V_p \neq 0 \), we may choose coordinates \( (x^1, \ldots, x^n) \) centered at \( p \) such that \( V_p = \frac{\partial}{\partial x^1}\big|_p \). Consider the map \( \Phi \colon \mathbb{R}^n \supset W \to M \) defined by
\[
\Phi(t, a^2, \ldots, a^n) = \Theta_t(0, a^2, \ldots, a^n),
\]
where \( \Theta \) is the flow of \( V \) and \( (0, a^2, \ldots, a^n) \) lies in the hyperplane \( \{x^1 = 0\} \). By construction, \( \Phi \) maps the line \( t \mapsto (t, a^2, \ldots, a^n) \) to the integral curve of \( V \) through \( (0, a^2, \ldots, a^n) \). The differential \( d\Phi_0 \) is the identity (one can check), so by the inverse function theorem, \( \Phi \) is a local diffeomorphism near the origin. Setting \( \varphi = \Phi^{-1} \) gives the desired coordinates.
</div>

<div class="remark">
<strong>Remark 12.12.</strong> The canonical form theorem says that near a regular point, the dynamics of any vector field are trivial — all vector fields look the same. The interesting behavior happens at singular points, where the flow-box theorem does not apply. The study of vector fields near their singular points is the subject of dynamical systems theory.

![The flow-box theorem: a diffeomorphism ψ straightens the curved integral curves into parallel lines](/pics/pmath465/flow-box.svg)
</div>

### 12.4 Lie Derivatives of Vector Fields

We introduced the Lie derivative of differential forms in Chapter 9 via Cartan's formula. Now we consider the Lie derivative of one vector field with respect to another, which has a more subtle definition involving the flow.

<div class="definition">
<strong>Definition 12.13 (Lie derivative of a vector field).</strong> Let \( V \) and \( W \) be smooth vector fields on \( M \), and let \( \Theta \) be the flow of \( V \). The <strong>Lie derivative</strong> of \( W \) with respect to \( V \) is the vector field defined by
\[
(\mathcal{L}_V W)_p = \lim_{t \to 0} \frac{(d\Theta_{-t})_{\Theta_t(p)}(W_{\Theta_t(p)}) - W_p}{t} = \frac{d}{dt}\bigg|_{t=0} (\Theta_{-t})_* W_{\Theta_t(p)}.
\]
</div>

![Lie derivative of a vector field: W is pushed back from Θ_t(p) to p using the flow, then differentiated at t = 0](/pics/pmath465/lie-derivative-vector-field.svg)

The key idea is that we cannot directly subtract \( W_{\Theta_t(p)} \) and \( W_p \), because they live in different tangent spaces. We use the flow \( \Theta_t \) to push \( W_{\Theta_t(p)} \) back to \( T_pM \) via the differential of \( \Theta_{-t} \), and then take the derivative.

<div class="lemma">
<strong>Lemma 12.14.</strong> The Lie derivative \( \mathcal{L}_V W \) is a smooth vector field on \( M \).
</div>

The remarkable fact is that this dynamical construction yields the same result as the purely algebraic Lie bracket.

<div class="theorem">
<strong>Theorem 12.15.</strong> For any smooth vector fields \( V \) and \( W \) on \( M \),
\[
\mathcal{L}_V W = [V, W].
\]
</div>

<div class="proof">
<strong>Proof sketch.</strong> It suffices to show that \( (\mathcal{L}_V W)(f) = [V, W](f) \) for all \( f \in C^\infty(M) \). One writes
\[
(\mathcal{L}_V W)_p(f) = \frac{d}{dt}\bigg|_{t=0} W_{\Theta_t(p)}(f \circ \Theta_{-t}).
\]
Expanding using the product rule for the derivative at \( t = 0 \), one obtains two terms: \( V_p(Wf) - W_p(Vf) = [V,W]_p(f) \).
</div>

The Lie derivative satisfies several important properties that make it a powerful tool for studying the geometry of vector fields.

<div class="proposition">
<strong>Proposition 12.16 (Properties of the Lie derivative).</strong>
<ol>
<li>\( \mathcal{L}_X Y = -\mathcal{L}_Y X \) (antisymmetry, following from \( [X,Y] = -[Y,X] \)).</li>
<li>\( \mathcal{L}_X(fY) = (Xf)Y + f\mathcal{L}_X Y \) for \( f \in C^\infty(M) \).</li>
<li>The Jacobi identity: \( \mathcal{L}_X[Y,Z] = [\mathcal{L}_X Y, Z] + [Y, \mathcal{L}_X Z] \), i.e., \( \mathcal{L}_X \) is a derivation of the Lie bracket.</li>
</ol>
</div>

### 12.5 Commuting Vector Fields and Flows

The Lie bracket measures the failure of two flows to commute. When the bracket vanishes, the flows commute, and this has profound geometric consequences.

![Commuting flows: when [V,W] = 0, flowing along V then W gives the same result as flowing along W then V](/pics/pmath465/commuting-flows.svg)

<div class="proposition">
<strong>Proposition 12.17 (Equivalent conditions for commuting vector fields).</strong> Let \( V \) and \( W \) be smooth vector fields on \( M \) with flows \( \Theta \) and \( \Psi \) respectively. The following are equivalent:
<ol>
<li>\( [V, W] = 0 \).</li>
<li>\( \mathcal{L}_V W = 0 \).</li>
<li>\( \mathcal{L}_W V = 0 \).</li>
<li>The flows commute wherever both sides are defined: \( \Theta_t \circ \Psi_s = \Psi_s \circ \Theta_t \).</li>
<li>\( W \) is invariant under the flow of \( V \): \( (\Theta_t)_* W = W \) wherever defined.</li>
<li>\( V \) is invariant under the flow of \( W \): \( (\Psi_s)_* V = V \) wherever defined.</li>
</ol>
</div>

<div class="proof">
<strong>Proof sketch of (1) \( \Leftrightarrow \) (4).</strong> If the flows commute, then \( (\Theta_t)_<em> W = W \), so \( \mathcal{L}_V W = \frac{d}{dt}\big|_0 (\Theta_{-t})_</em> W = 0 = [V,W] \). Conversely, if \( [V,W] = 0 \), consider \( \alpha(t) = (\Theta_{-t})_<em> W_{\Theta_t(p)} \). Then \( \alpha'(t) = (\Theta_{-t})_</em> (\mathcal{L}_V W)_{\Theta_t(p)} = 0 \), so \( \alpha(t) \) is constant, meaning \( (\Theta_t)_* W = W \). This implies \( \Theta_t \) preserves the integral curves of \( W \), which gives commutativity of the flows.
</div>

<div class="example">
<strong>Example 12.18.</strong> On \( \mathbb{R}^n \), the coordinate vector fields \( \frac{\partial}{\partial x^i} \) and \( \frac{\partial}{\partial x^j} \) commute (their bracket is zero), and indeed their flows (translations in the \( x^i \) and \( x^j \) directions) commute. This is the simplest example; the canonical form theorem says that near a regular point, any single vector field can be put into this form.
</div>

### 12.6 Lie Derivatives of Differential Forms

We have already encountered Cartan's magic formula in Chapter 9. Now that we have the flow interpretation of the Lie derivative, we can give a more conceptual treatment.

![Lie derivative of a differential form: the rate of change of ω along the flow of X](/pics/pmath465/lie-derivative-form.svg)

The Lie derivative of a differential form \( \omega \) along a vector field \( X \) with flow \( \Theta \) is

\[
(\mathcal{L}_X \omega)_p = \frac{d}{dt}\bigg|_{t=0} (\Theta_t^* \omega)_p.
\]
This pulls the form back from \( \Theta_t(p) \) to \( p \) using the flow and then differentiates.

<div class="theorem">
<strong>Theorem 12.19 (Cartan's formula, revisited).</strong> For any smooth vector field \( X \) and \( \omega \in \Omega^k(M) \),
\[
\mathcal{L}_X \omega = \iota_X(d\omega) + d(\iota_X \omega).
\]
</div>

A useful consequence is the following formula for the time derivative of the pullback along a flow:

\[
\frac{d}{dt} \Theta_t^* \omega = \Theta_t^* (\mathcal{L}_X \omega).
\]
This identity is used constantly in applications to fluid dynamics, where it describes how a differential form is transported by a flow.

### 12.7 Tangent Distributions and the Frobenius Theorem

The Frobenius theorem is one of the fundamental results in differential geometry. It provides a necessary and sufficient condition for a family of subspaces of the tangent bundle to be "integrable" — that is, to arise as the tangent spaces to a foliation of the manifold by submanifolds.

To motivate the theorem, consider the following question: given a system of first-order PDEs of the form

\[
\frac{\partial F}{\partial x^i} = f_i(x^1, \ldots, x^n), \quad i = 1, \ldots, n,
\]
when does a solution \(F\) exist? The necessary condition is obvious: the mixed partial derivatives must be equal, so \(\frac{\partial f_i}{\partial x^j} = \frac{\partial f_j}{\partial x^i}\) — i.e., the 1-form \(\omega = f_i\,dx^i\) must be closed. In the Frobenius context, this integrability condition is the requirement that the distribution defined by the 1-form be involutive.

In geometric control theory, a distribution \(D\) describes the "allowed directions of motion" at each point of the configuration space. A car, for instance, can move forward or backward and can turn, but it cannot slide sideways — this non-holonomic constraint is captured by a non-integrable distribution. The Frobenius theorem says: if \(D\) is involutive, then you are confined to a single "integral manifold" (a leaf of the foliation) and cannot reach the whole manifold. If \(D\) is non-involutive (like the car), you may be able to access all of the configuration space by combining the allowed motions cleverly. The contact structure on \(\mathbb{R}^3\) (Example 12.27 below) is the archetypal non-integrable distribution, arising in the geometry of rolling without slipping and in thermodynamics.

<div class="definition">
<strong>Definition 12.20 (Tangent distribution).</strong> A <strong>tangent distribution</strong> (or simply a <strong>distribution</strong>) of rank \( k \) on a smooth manifold \( M \) is a smooth assignment \( p \mapsto D_p \), where \( D_p \subseteq T_pM \) is a \( k \)-dimensional linear subspace for each \( p \), and "smooth" means that near each point, \( D \) can be locally spanned by \( k \) smooth vector fields.
</div>

![A tangent distribution of rank k: at each point p, a k-dimensional subspace D_p of the tangent space is smoothly assigned](/pics/pmath465/tangent-distribution.svg)

<div class="definition">
<strong>Definition 12.21 (Integral submanifold).</strong> An <strong>integral submanifold</strong> of a distribution \( D \) is a connected immersed submanifold \( N \subseteq M \) such that \( T_pN = D_p \) for all \( p \in N \).
</div>

<div class="definition">
<strong>Definition 12.22 (Integrable distribution).</strong> A distribution \( D \) is <strong>integrable</strong> if through every point of \( M \) there passes an integral submanifold of \( D \). Equivalently, \( M \) admits a foliation whose leaves are tangent to \( D \).
</div>

<div class="definition">
<strong>Definition 12.23 (Involutive distribution).</strong> A distribution \( D \) is <strong>involutive</strong> if for any two smooth vector fields \( X \) and \( Y \) that are everywhere tangent to \( D \) (i.e., \( X_p, Y_p \in D_p \) for all \( p \)), the Lie bracket \( [X, Y] \) is also everywhere tangent to \( D \).
</div>

If \( D \) is integrable, it must be involutive: if \( N \) is an integral submanifold through \( p \), and \( X, Y \) are tangent to \( D \), then \( X \) and \( Y \) restrict to vector fields on \( N \), so \( [X,Y] \) is also tangent to \( N \), hence tangent to \( D \). The Frobenius theorem is the remarkable converse.

<div class="theorem">
<strong>Theorem 12.24 (Frobenius Theorem).</strong> A smooth distribution \( D \) on a smooth manifold \( M \) is integrable if and only if it is involutive.
</div>

<div class="proof">
<strong>Proof sketch.</strong> The "only if" direction (integrability implies involutivity) was explained above. For the "if" direction, we proceed by induction on the rank \( k \) of the distribution.

<strong>Base case \( k = 1 \):</strong> A rank-1 distribution is spanned by a single nonvanishing vector field \( V \). Any rank-1 distribution is automatically involutive (the bracket of multiples of \( V \) is again a multiple of \( V \)). The integral submanifolds are the integral curves of \( V \), which exist by the existence theorem for ODEs.

<strong>Inductive step:</strong> Assume the result for rank \( k-1 \). Let \( D \) be an involutive rank-\( k \) distribution, locally spanned by vector fields \( V_1, \ldots, V_k \). Using the flow-box theorem, we may choose coordinates so that \( V_1 = \frac{\partial}{\partial y^1} \). Since \( [V_1, V_j] \in D \) for all \( j \) (involutivity), we can modify \( V_2, \ldots, V_k \) so that \( [V_1, V_j] = 0 \) for \( j = 2, \ldots, k \) (by subtracting appropriate multiples of \( V_1 \)). Since these modified vector fields commute with \( V_1 = \frac{\partial}{\partial y^1} \), their coefficients are independent of \( y^1 \). The distribution spanned by the projections of \( V_2, \ldots, V_k \) onto the "transverse" slice \( \{y^1 = \text{const}\} \) is a rank-\( (k-1) \) involutive distribution, to which we apply the inductive hypothesis.
</div>

The Frobenius theorem has a clean statement for commuting vector fields, which can be viewed as a "simultaneous straightening" result.

<div class="theorem">
<strong>Theorem 12.25 (Simple version of Frobenius).</strong> Let \( V_1, \ldots, V_k \) be smooth vector fields on \( M \) that are linearly independent at a point \( p \) and satisfy \( [V_i, V_j] = 0 \) for all \( i, j \). Then there exist local coordinates \( (y^1, \ldots, y^n) \) centered at \( p \) such that
\[
V_i = \frac{\partial}{\partial y^i}, \quad i = 1, \ldots, k.
\]
</div>

This is a generalization of the canonical form theorem (which handles the case \( k = 1 \)) and is proved similarly, using the commutativity of the flows to construct the coordinate chart.

![The Frobenius theorem: an involutive distribution is integrable, foliation of M by integral submanifolds (leaves)](/pics/pmath465/frobenius-foliation.svg)

**The differential-forms (Pfaffian system) formulation of Frobenius.** There is a completely equivalent reformulation of the Frobenius theorem in the language of differential forms, which is often more convenient in practice — especially in the study of PDEs and geometric structures.

A rank-\(k\) distribution \( D \) on an \(n\)-manifold \( M \) can be locally described not by giving \(k\) spanning vector fields, but by giving \(n - k\) linearly independent 1-forms that annihilate \( D \). Concretely, near any point \( p \in M \), there exist smooth 1-forms \( \theta^1, \ldots, \theta^{n-k} \) such that

\[
D_q = \ker \theta^1_q \cap \ker \theta^2_q \cap \cdots \cap \ker \theta^{n-k}_q \quad \text{for all } q \text{ near } p.
\]

The collection \( \{\theta^1, \ldots, \theta^{n-k}\} \) is called a **Pfaffian system** (or a **codistribution**) defining \( D \). The ideal in the exterior algebra generated by \( \theta^1, \ldots, \theta^{n-k} \) is denoted \( \mathcal{I}(D^\perp) \).

<div class="theorem">
<strong>Theorem 12.25\( {}' \) (Frobenius Theorem — differential forms version).</strong> Let \( D \) be a smooth rank-\( k \) distribution on a smooth \( n \)-manifold \( M \), locally defined by the Pfaffian system \( \{\theta^1, \ldots, \theta^{n-k}\} \). Then \( D \) is involutive (equivalently, integrable) if and only if
\[
d\theta^i \equiv 0 \pmod{\theta^1, \ldots, \theta^{n-k}} \quad \text{for each } i = 1, \ldots, n-k.
\]
That is, each \( d\theta^i \) lies in the ideal \( \mathcal{I}(D^\perp) \) — meaning there exist smooth 1-forms \( \alpha^i{}_j \) such that \( d\theta^i = \sum_j \alpha^i{}_j \wedge \theta^j \).
</div>

This formulation is equivalent to the vector-field version: the condition \( d\theta^i(X, Y) = 0 \) for all \( X, Y \in D \) is exactly the statement that \( [X, Y] \in D \) whenever \( X, Y \in D \) (by Cartan's formula and the definition of the annihilator).

<div class="example">
<strong>Example 12.27 (The standard contact structure on \( \mathbb{R}^3 \)).</strong> Consider \( \mathbb{R}^3 \) with coordinates \( (x, y, z) \) and the 1-form
\[
\theta = dz - y\, dx.
\]
The distribution \( D = \ker \theta \) is a rank-2 distribution on \( \mathbb{R}^3 \) (at each point, \( D_p \) is the 2-dimensional subspace of \( T_p \mathbb{R}^3 \) on which \( \theta \) vanishes). We test integrability using the forms criterion. Compute:

\[
d\theta = d(dz - y\, dx) = -dy \wedge dx = dx \wedge dy.
\]
We ask: does \( d\theta \) lie in the ideal generated by \( \theta \)? An element of this ideal has the form \( \alpha \wedge \theta \) for some 1-form \( \alpha \). But \( \alpha \wedge \theta \) always contains a \( dz \) or \( dx \) factor (from \( \theta = dz - y\,dx \)), while \( d\theta = dx \wedge dy \) involves only \( dx \) and \( dy \). One can check directly that \( d\theta \wedge \theta = (dx \wedge dy) \wedge (dz - y\,dx) = dx \wedge dy \wedge dz \neq 0 \), so \( d\theta \notin \mathcal{I}(\theta) \). By the Frobenius theorem (forms version), \( D \) is <em>not integrable</em>. This distribution is precisely the <strong>standard contact structure</strong> on \( \mathbb{R}^3 \), a fundamental example in contact geometry and geometric control theory.
</div>

**Foliations.** When a distribution \( D \) is integrable (equivalently, involutive), the Frobenius theorem guarantees the existence of integral submanifolds through every point. The collection of all maximal connected integral submanifolds is called a **foliation** of \( M \), and each maximal integral submanifold is called a **leaf** of the foliation. Thus, an integrable rank-\(k\) distribution partitions \( M \) into a disjoint union of immersed \(k\)-dimensional submanifolds — the leaves — that fit together smoothly in the sense that local coordinates can be chosen making the leaves locally look like parallel \(k\)-dimensional planes in \(\mathbb{R}^n\). The Reeb foliation of \( S^3 \) and the fibres of a submersion \( f \colon M \to N \) (which form a foliation of \( M \) of rank \( \dim M - \dim N \)) are canonical examples.

### 12.8 Affine Connections and Covariant Derivatives

We now introduce a fundamentally new structure on manifolds: the **connection**, which provides a way to differentiate vector fields (and more general tensor fields) along curves and in the direction of other vector fields. Unlike the Lie derivative, a connection allows us to differentiate a vector field at a point using only the direction of differentiation at that point, not a full vector field.

![Intuition for a connection: a connection provides a rule to "connect" tangent spaces at nearby points, enabling comparison of vectors](/pics/pmath465/connection-intuition.svg)

The need for connections arises because there is no canonical way to compare tangent vectors at different points of a manifold — the tangent spaces \( T_pM \) and \( T_qM \) are abstractly isomorphic but not canonically so. A connection provides the additional structure needed to "connect" nearby tangent spaces.

<div class="definition">
<strong>Definition 12.26 (Affine connection / covariant derivative).</strong> An <strong>affine connection</strong> (or <strong>covariant derivative</strong>) on a smooth manifold \( M \) is a map
\[
\nabla \colon \mathfrak{X}(M) \times \mathfrak{X}(M) \to \mathfrak{X}(M), \quad (X, Y) \mapsto \nabla_X Y,
\]
satisfying the following three properties:
<ol>
<li><strong>\( C^\infty(M) \)-linearity in \( X \):</strong> \( \nabla_{fX_1 + gX_2} Y = f \nabla_{X_1} Y + g \nabla_{X_2} Y \) for \( f, g \in C^\infty(M) \).</li>
<li><strong>\( \mathbb{R} \)-linearity in \( Y \):</strong> \( \nabla_X(aY_1 + bY_2) = a \nabla_X Y_1 + b \nabla_X Y_2 \) for \( a, b \in \mathbb{R} \).</li>
<li><strong>Leibniz rule in \( Y \):</strong> \( \nabla_X(fY) = (Xf)Y + f \nabla_X Y \) for \( f \in C^\infty(M) \).</li>
</ol>
</div>

The \( C^\infty(M) \)-linearity in \( X \) is crucial: it means that \( (\nabla_X Y)_p \) depends only on the value \( X_p \in T_pM \), not on the global behavior of \( X \). This is in stark contrast to the Lie bracket \( [X, Y] \), which depends on the derivatives of \( X \). On the other hand, the Leibniz rule in \( Y \) means that \( \nabla_X Y \) at \( p \) depends on the values of \( Y \) along a curve tangent to \( X_p \), not just at \( p \) itself. However, one can show the following locality results.

<div class="lemma">
<strong>Lemma 12.27.</strong> The covariant derivative \( \nabla \) is local in both arguments: if \( X = \tilde{X} \) on an open set \( U \), then \( \nabla_X Y = \nabla_{\tilde{X}} Y \) on \( U \); and similarly for \( Y \). Moreover, \( (\nabla_X Y)_p \) depends only on \( X_p \) and on the values of \( Y \) along any curve tangent to \( X_p \) at \( p \).
</div>

### 12.9 Christoffel Symbols

In local coordinates \( (x^1, \ldots, x^n) \), a connection is completely determined by specifying the covariant derivatives of the coordinate vector fields with respect to each other.

<div class="definition">
<strong>Definition 12.28 (Christoffel symbols).</strong> The <strong>Christoffel symbols</strong> of a connection \( \nabla \) with respect to local coordinates \( (x^1, \ldots, x^n) \) are the \( n^3 \) smooth functions \( \Gamma^k_{ij} \) defined by
\[
\nabla_{\partial/\partial x^i} \frac{\partial}{\partial x^j} = \Gamma^k_{ij} \frac{\partial}{\partial x^k}.
\]
</div>

![Christoffel symbols Γ^k_{ij}: the n^3 functions encoding a connection in local coordinates](/pics/pmath465/christoffel-symbols.svg)

Given the Christoffel symbols, the covariant derivative of an arbitrary vector field \( Y = Y^j \frac{\partial}{\partial x^j} \) in the direction \( X = X^i \frac{\partial}{\partial x^i} \) is

\[
\nabla_X Y = X^i \Bigl(\frac{\partial Y^k}{\partial x^i} + \Gamma^k_{ij} Y^j\Bigr) \frac{\partial}{\partial x^k}.
\]
The expression \( \frac{\partial Y^k}{\partial x^i} + \Gamma^k_{ij} Y^j \) represents the "covariant components" of \( \nabla_X Y \); the Christoffel symbols provide the "correction term" that accounts for the twisting of the coordinate frame.

<div class="remark">
<strong>Remark 12.29.</strong> The Christoffel symbols are <strong>not</strong> the components of a tensor: they do not transform tensorially under coordinate changes. This reflects the fact that a connection is additional geometric structure, not intrinsic to the smooth structure of the manifold.
</div>

### 12.10 Geodesics and Parallel Transport

Two of the most important constructions associated with a connection are geodesics and parallel transport.

![Geodesics on a sphere are great circles emanating from a point p](/pics/pmath465/geodesics-sphere.svg)

<div class="definition">
<strong>Definition 12.30 (Geodesic).</strong> A smooth curve \( \gamma \colon I \to M \) is a <strong>geodesic</strong> (with respect to the connection \( \nabla \)) if its velocity vector field is parallel along itself:
\[
\nabla_{\gamma'(t)} \gamma'(t) = 0 \quad \text{for all } t \in I.
\]
In local coordinates, this becomes the <strong>geodesic equation</strong>:

\[
\frac{d^2 \gamma^k}{dt^2} + \Gamma^k_{ij}(\gamma(t)) \frac{d\gamma^i}{dt} \frac{d\gamma^j}{dt} = 0, \quad k = 1, \ldots, n.
\]
</div>

This is a second-order system of ODEs, so by the existence and uniqueness theorem, given any point \( p \in M \) and any tangent vector \( v \in T_pM \), there exists a unique maximal geodesic \( \gamma \) with \( \gamma(0) = p \) and \( \gamma'(0) = v \).

<div class="definition">
<strong>Definition 12.31 (Parallel transport).</strong> Let \( \gamma \colon [a,b] \to M \) be a smooth curve. A vector field \( V \) along \( \gamma \) (i.e., a smooth map \( V \colon [a,b] \to TM \) with \( V(t) \in T_{\gamma(t)}M \)) is <strong>parallel</strong> along \( \gamma \) if
\[
\nabla_{\gamma'(t)} V(t) = 0 \quad \text{for all } t.
\]
Given \( v_0 \in T_{\gamma(a)}M \), there exists a unique parallel vector field \( V \) along \( \gamma \) with \( V(a) = v_0 \). The map \( P_\gamma \colon T_{\gamma(a)}M \to T_{\gamma(b)}M \) defined by \( P_\gamma(v_0) = V(b) \) is called <strong>parallel transport</strong> along \( \gamma \). It is a linear isomorphism.
</div>

![Parallel transport along a curve: a vector is moved along γ without changing, satisfying ∇_{γ'} V = 0](/pics/pmath465/parallel-transport-curve.svg)

A geodesic is precisely a curve whose velocity vector is parallel along itself — the curve "goes straight" in the sense determined by the connection. Parallel transport moves vectors along curves "without rotating" them, according to the connection.

### 12.11 Torsion and the Levi-Civita Connection

Not all connections are created equal. On a Riemannian manifold, there is a canonical connection that is uniquely determined by two natural requirements.

<div class="definition">
<strong>Definition 12.32 (Torsion).</strong> The <strong>torsion</strong> of a connection \( \nabla \) is the tensor field \( T \colon \mathfrak{X}(M) \times \mathfrak{X}(M) \to \mathfrak{X}(M) \) defined by
\[
T(X, Y) = \nabla_X Y - \nabla_Y X - [X, Y].
\]
A connection is <strong>torsion-free</strong> (or <strong>symmetric</strong>) if \( T = 0 \). In coordinates, this means \( \Gamma^k_{ij} = \Gamma^k_{ji} \).
</div>

![Torsion of a connection: T(X,Y) = ∇_X Y - ∇_Y X - [X,Y] measures the antisymmetric failure of the connection](/pics/pmath465/torsion-connection.svg)

The torsion measures the extent to which the connection fails to be "symmetric." While the torsion is a geometric object of interest in its own right (it appears in Einstein–Cartan theory and other generalizations of general relativity), the most important connection in Riemannian geometry is torsion-free.

<div class="definition">
<strong>Definition 12.33 (Metric compatibility).</strong> A connection \( \nabla \) on a Riemannian manifold \( (M, g) \) is <strong>compatible with the metric</strong> (or <strong>metric-compatible</strong>) if
\[
\nabla g = 0,
\]
or equivalently, for all vector fields \( X, Y, Z \):

\[
X(g(Y, Z)) = g(\nabla_X Y, Z) + g(Y, \nabla_X Z).
\]
This means that parallel transport preserves inner products.
</div>

<div class="theorem">
<strong>Theorem 12.34 (Fundamental Theorem of Riemannian Geometry).</strong> On any Riemannian manifold \( (M, g) \), there exists a unique connection \( \nabla \), called the <strong>Levi-Civita connection</strong>, that is:
<ol>
<li><strong>Torsion-free:</strong> \( \nabla_X Y - \nabla_Y X = [X, Y] \).</li>
<li><strong>Metric-compatible:</strong> \( \nabla g = 0 \).</li>
</ol>
It is determined explicitly by the <strong>Koszul formula</strong>:

\[
2g(\nabla_X Y, Z) = X(g(Y,Z)) + Y(g(X,Z)) - Z(g(X,Y)) + g([X,Y], Z) - g([X,Z], Y) - g([Y,Z], X).
\]
</div>

<div class="proof">
<strong>Proof sketch.</strong> <strong>Uniqueness:</strong> If such a \( \nabla \) exists, write out the three equations obtained by cyclically permuting \( (X, Y, Z) \) in the metric compatibility condition \( X(g(Y,Z)) = g(\nabla_X Y, Z) + g(Y, \nabla_X Z) \), then use the torsion-free condition to eliminate cross terms. Adding and subtracting appropriately yields the Koszul formula, which determines \( \nabla_X Y \) uniquely (since \( g \) is nondegenerate).

<strong>Existence:</strong> Define \( \nabla_X Y \) by the Koszul formula (the right-hand side is \( C^\infty \)-linear in \( Z \), so it defines a vector field via the metric). One then verifies the three axioms of a connection and the two additional properties (torsion-free, metric-compatible).
</div>

In coordinates, the Christoffel symbols of the Levi-Civita connection are given by

\[
\Gamma^k_{ij} = \frac{1}{2} g^{k\ell}\Bigl(\frac{\partial g_{j\ell}}{\partial x^i} + \frac{\partial g_{i\ell}}{\partial x^j} - \frac{\partial g_{ij}}{\partial x^\ell}\Bigr).
\]

### 12.12 The Riemann Curvature Tensor

![Parallel transport around a triangular path on a sphere: the vector rotates by the holonomy angle, revealing curvature](/pics/pmath465/parallel-transport.svg)

The curvature of a connection measures the extent to which parallel transport around an infinitesimal loop fails to return a vector to itself. It is the fundamental local invariant of Riemannian geometry.

<div class="definition">
<strong>Definition 12.35 (Riemann curvature tensor).</strong> The <strong>Riemann curvature tensor</strong> (or <strong>Riemann curvature endomorphism</strong>) of a connection \( \nabla \) is the map \( R \colon \mathfrak{X}(M)^3 \to \mathfrak{X}(M) \) defined by
\[
R(X, Y)Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X,Y]} Z.
\]
</div>

The curvature tensor measures the failure of second covariant derivatives to commute. If the connection is flat (\( R = 0 \)), then covariant differentiation in different directions commutes, and parallel transport is path-independent.

<div class="proposition">
<strong>Proposition 12.36.</strong> The Riemann curvature tensor \( R(X, Y)Z \) is \( C^\infty(M) \)-linear in all three arguments, so it is indeed a tensor field — a section of \( T^1_3(TM) \).
</div>

In local coordinates, the curvature tensor has components

\[
R^l{}_{ijk} = \frac{\partial \Gamma^l_{jk}}{\partial x^i} - \frac{\partial \Gamma^l_{ik}}{\partial x^j} + \Gamma^l_{im} \Gamma^m_{jk} - \Gamma^l_{jm} \Gamma^m_{ik}.
\]

### 12.13 Symmetries of the Riemann Tensor

For the Levi-Civita connection on a Riemannian manifold, the curvature tensor possesses remarkable symmetry properties. We define the fully covariant version \( \operatorname{Rm}(X, Y, Z, W) = g(R(X, Y)Z, W) \).

<div class="theorem">
<strong>Theorem 12.37 (Symmetries of the Riemann tensor).</strong> Let \( (M, g) \) be a Riemannian manifold with Levi-Civita connection. For all vector fields \( X, Y, Z, W \):
<ol>
<li><strong>Skew-symmetry in the first pair:</strong> \( \operatorname{Rm}(X, Y, Z, W) = -\operatorname{Rm}(Y, X, Z, W) \).</li>
<li><strong>Skew-symmetry in the second pair:</strong> \( \operatorname{Rm}(X, Y, Z, W) = -\operatorname{Rm}(X, Y, W, Z) \).</li>
<li><strong>Pair symmetry:</strong> \( \operatorname{Rm}(X, Y, Z, W) = \operatorname{Rm}(Z, W, X, Y) \).</li>
<li><strong>First Bianchi identity:</strong> \( R(X, Y)Z + R(Y, Z)X + R(Z, X)Y = 0 \) (equivalently, \( \operatorname{Rm}(X, Y, Z, W) + \operatorname{Rm}(Y, Z, X, W) + \operatorname{Rm}(Z, X, Y, W) = 0 \)).</li>
</ol>
</div>

These symmetries drastically reduce the number of independent components. On an \( n \)-dimensional manifold, the Riemann tensor has \( \frac{n^2(n^2 - 1)}{12} \) independent components (for instance, 1 in dimension 2, 6 in dimension 3, and 20 in dimension 4).

### 12.14 Sectional, Ricci, and Scalar Curvature

The full Riemann tensor contains a wealth of information. Various traces and contractions extract geometrically meaningful quantities.

<div class="definition">
<strong>Definition 12.38 (Sectional curvature).</strong> Let \( \sigma \subset T_pM \) be a 2-dimensional subspace spanned by linearly independent vectors \( X, Y \). The <strong>sectional curvature</strong> of \( \sigma \) is
\[
K(\sigma) = K(X, Y) = \frac{\operatorname{Rm}(X, Y, Y, X)}{|X|^2 |Y|^2 - g(X, Y)^2}.
\]
This is independent of the choice of basis \( (X, Y) \) for \( \sigma \).
</div>

![Sectional curvature: K(σ) measures how geodesics in the 2-plane σ spread apart or converge compared to flat space](/pics/pmath465/sectional-curvature.svg)

The sectional curvature \( K(\sigma) \) is the Gauss curvature of the "slice" of \( M \) through \( p \) tangent to \( \sigma \) — it measures how geodesics starting at \( p \) in the plane \( \sigma \) spread apart or converge. The sectional curvature completely determines the Riemann tensor.

<div class="definition">
<strong>Definition 12.39 (Ricci curvature).</strong> The <strong>Ricci curvature</strong> is the trace of the curvature endomorphism:
\[
\operatorname{Ric}(Y, Z) = \operatorname{tr}(X \mapsto R(X, Y)Z) = \sum_{i=1}^{n} \operatorname{Rm}(E_i, Y, Z, E_i),
\]
where \( (E_1, \ldots, E_n) \) is any orthonormal frame. The Ricci tensor is a symmetric \( (0,2) \)-tensor.
</div>

<div class="definition">
<strong>Definition 12.40 (Scalar curvature).</strong> The <strong>scalar curvature</strong> is the trace of the Ricci tensor:
\[
S = \operatorname{tr}_g(\operatorname{Ric}) = \sum_{i=1}^{n} \operatorname{Ric}(E_i, E_i) = \sum_{i,j} K(E_i, E_j).
\]
It is a smooth function on \( M \).
</div>

<div class="remark">
<strong>Remark 12.41.</strong> In dimension 2, the Riemann tensor is determined by the scalar curvature, which equals twice the Gauss curvature: \( S = 2K \). In dimension 3, the Riemann tensor is determined by the Ricci tensor. In dimension \( \ge 4 \), the Riemann tensor contains additional information beyond the Ricci tensor, captured by the Weyl tensor.
</div>

### 12.15 Einstein Manifolds

<div class="definition">
<strong>Definition 12.42 (Einstein manifold).</strong> A Riemannian manifold \( (M, g) \) is called an <strong>Einstein manifold</strong> if the Ricci tensor is proportional to the metric:
\[
\operatorname{Ric} = \lambda g
\]
for some constant \( \lambda \in \mathbb{R} \). Equivalently, \( S = n\lambda \), so the scalar curvature is constant.
</div>

Einstein manifolds arise naturally in general relativity (the vacuum Einstein field equations with cosmological constant are \( \operatorname{Ric} = \lambda g \)) and in many areas of differential geometry. Important examples include spaces of constant sectional curvature (spheres, Euclidean spaces, hyperbolic spaces), complex projective spaces with the Fubini–Study metric, and products of Einstein manifolds with equal Einstein constants.

### 12.16 The Exponential Map and the Hopf–Rinow Theorem

We conclude with two important results about geodesics on Riemannian manifolds.

The **exponential map** at a point \( p \in M \) is defined by

\[
\exp_p \colon T_pM \supset U \to M, \quad \exp_p(v) = \gamma_v(1),
\]
where \( \gamma_v \) is the geodesic with \( \gamma_v(0) = p \) and \( \gamma_v'(0) = v \), and \( U \) is a neighborhood of \( 0 \in T_pM \) where this is defined.

![The exponential map exp_p: sending a tangent vector v to the point reached by the geodesic γ_v at time 1](/pics/pmath465/exponential-map.svg) The exponential map is a local diffeomorphism near \( 0 \), and the coordinates it induces (called **normal coordinates** or **geodesic coordinates**) have the special property that \( \Gamma^k_{ij}(p) = 0 \) at the center point.

The Riemannian distance function is defined by

\[
d(p, q) = \inf \Bigl\{ \int_0^1 |\gamma'(t)|_g\, dt : \gamma \text{ is a piecewise smooth curve from } p \text{ to } q \Bigr\}.
\]
This makes \( (M, d) \) into a metric space whose topology agrees with the manifold topology.

<div class="theorem">
<strong>Theorem 12.43 (Hopf–Rinow).</strong> Let \( (M, g) \) be a connected Riemannian manifold. The following are equivalent:
<ol>
<li>\( (M, d) \) is a complete metric space (every Cauchy sequence converges).</li>
<li>The exponential map \( \exp_p \) is defined on all of \( T_pM \) for some (equivalently, every) \( p \in M \).</li>
<li>Every closed and bounded subset of \( M \) is compact.</li>
</ol>
Moreover, if any of these equivalent conditions holds, then any two points of \( M \) can be joined by a minimizing geodesic.
</div>

The Hopf–Rinow theorem is a cornerstone of Riemannian geometry. It guarantees that on a "geodesically complete" manifold (one where geodesics can be extended indefinitely), the geometric and topological notions of completeness coincide, and optimal paths between any two points always exist. All compact Riemannian manifolds are complete.

<div class="remark">
<strong>Remark 12.44.</strong> The Hopf–Rinow theorem does <strong>not</strong> assert that minimizing geodesics are unique — indeed, on the sphere, antipodal points are joined by infinitely many minimizing geodesics (the great semicircles). It also does not hold in the Lorentzian setting (semi-Riemannian geometry with indefinite metric), which is one of the many complications that arise in general relativity.
</div>
