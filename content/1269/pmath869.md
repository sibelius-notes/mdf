---
title: "PMATH 869: Knot Theory and Low-Dimensional Topology"
subjects: "PMATH"
---

*These notes synthesize material from W.B.R. Lickorish's An Introduction to Knot Theory, D. Rolfsen's Knots and Links, V.V. Prasolov and A.B. Sossinsky's Knots, Links, Braids and 3-Manifolds, and W.P. Thurston's Three-Dimensional Geometry and Topology, enriched with material from P. Ozsvath and Z. Szabo's lecture notes on knot Floer homology and D. Bar-Natan's exposition of Khovanov homology.*

---

## Chapter 1: Knots, Links, and Diagrams

The mathematical study of knots begins with a deceptively simple question: when are two closed loops of rope in three-dimensional space "the same"? This chapter establishes the foundational language of knot theory, making precise the notions of knots, links, equivalence, and diagrammatic representation. The theory traces its origins to Lord Kelvin's vortex atom hypothesis in the 1860s, which motivated Peter Guthrie Tait to begin the first systematic tabulation of knots — a project whose mathematical descendants continue to drive research today.

### 1.1 Knots and Links

<div class="definition">
A <strong>knot</strong> is a smooth (or piecewise-linear) embedding \(K : S^1 \hookrightarrow S^3\). Two knots \(K_0\) and \(K_1\) are <strong>equivalent</strong> (or <strong>ambient isotopic</strong>) if there exists a smooth family of diffeomorphisms \(h_t : S^3 \to S^3\), \(t \in [0,1]\), with \(h_0 = \mathrm{id}\) and \(h_1 \circ K_0 = K_1\). A <strong>link</strong> of \(n\) components is a smooth embedding \(L : S^1 \sqcup \cdots \sqcup S^1 \hookrightarrow S^3\) of \(n\) disjoint copies of \(S^1\), with equivalence defined analogously.
</div>

We work in \(S^3\) rather than \(\mathbb{R}^3\) for technical convenience — the compactness of \(S^3\) simplifies many arguments — but since removing a single point from \(S^3\) yields \(\mathbb{R}^3\), and any knot misses at least one point of \(S^3\), the two settings are essentially interchangeable for knot theory.

The simplest knot is the <em>unknot</em> (or <em>trivial knot</em>), represented by any standardly embedded circle. The first nontrivial knot one encounters is the trefoil, and a fundamental early theorem asserts that the trefoil is indeed not ambient isotopic to the unknot — a fact that requires genuine invariant theory to prove.

<div class="definition">
A knot or link is called <strong>tame</strong> if it is ambient isotopic to a polygonal knot (a knot whose image is a finite union of straight line segments). A knot that is not tame is called <strong>wild</strong>. Throughout these notes, all knots and links are assumed tame unless stated otherwise.
</div>

Wild knots can exhibit pathological behavior — for instance, the complement of a wild knot need not be a manifold with well-behaved fundamental group. The classical example is the <em>Fox-Artin wild knot</em>, which has a non-finitely-generated fundamental group of its complement. Tameness ensures that the tools of algebraic topology apply cleanly.

<div class="remark">
In the piecewise-linear (PL) and smooth categories, the notions of ambient isotopy, isotopy, and equivalence by orientation-preserving homeomorphisms all coincide for knots in \(S^3\). This is a nontrivial fact relying on the Schoenflies theorem in dimension 3 and the uniqueness of smooth structures on \(S^3\). In higher dimensions, the situation is far more subtle.
</div>

### 1.2 Knot Diagrams and Reidemeister Moves

To study knots concretely, we project them onto a plane.

<div class="definition">
A <strong>knot diagram</strong> is the image of a knot under a regular projection \(\pi : S^3 \setminus \{p\} \cong \mathbb{R}^3 \to \mathbb{R}^2\), together with crossing information at each double point (indicating which strand passes over and which passes under). A projection is <strong>regular</strong> if (1) there are only finitely many multiple points, all of which are transverse double points, and (2) no vertex of a PL knot maps to a double point.
</div>

Every tame knot admits a regular projection, and a generic perturbation of any projection is regular. The crossing information at each double point is recorded by drawing the understrand with a break, a convention introduced by Listing and standardized by the knot table compilers.

The central theorem connecting diagrams to knots is due to Kurt Reidemeister (1927), with an independent proof by J.W. Alexander and G.B. Briggs.

<div class="theorem">
<strong>Theorem 1.1 (Reidemeister, 1927).</strong> Two knot diagrams represent ambient isotopic knots if and only if they are related by a finite sequence of <strong>Reidemeister moves</strong>:
<br><br>
<strong>R1</strong> (twist/untwist): Adding or removing a curl (a loop with one crossing).<br>
<strong>R2</strong> (poke/unpoke): Adding or removing two crossings between two strands that pass over each other.<br>
<strong>R3</strong> (slide): Sliding a strand over or under a crossing.
<br><br>
together with planar isotopies (continuous deformations of the diagram in the plane that do not change crossings).
</div>

<div class="proof">
<em>Proof sketch.</em> We outline the key ideas. The direction that ambient isotopic knots have diagrams related by Reidemeister moves proceeds as follows. An ambient isotopy \(h_t\) is approximated by a piecewise-linear isotopy (using the triangulation of \(S^3\)). Such a PL isotopy can be decomposed into a sequence of elementary moves, each of which changes the knot within a single tetrahedron. One shows that any such elementary move, when projected to a regular diagram, results in a finite sequence of Reidemeister moves and planar isotopies. The key observation is that when a strand crosses over or under a crossing during the isotopy, this corresponds precisely to an R3 move; when two strands approach or separate, this corresponds to R2; and when a strand curls or uncurls, this is R1. The converse — that diagrams related by Reidemeister moves represent isotopic knots — is clear, since each Reidemeister move can be realized by an ambient isotopy of \(S^3\). \(\square\)
</div>

The Reidemeister theorem reduces the global topological problem of knot equivalence to a combinatorial one. However, this reduction is not immediately effective: there is no a priori bound on the number of Reidemeister moves needed to relate two equivalent diagrams. In 2014, Lackenby proved that for a diagram with \(n\) crossings, at most \(2^{2^{c \cdot n}}\) moves suffice — a tower of exponentials, but a computable bound.

<div class="remark">
Each Reidemeister move is local — it changes the diagram only within a small disk. This locality is crucial for checking whether candidate invariants are well-defined: one need only verify invariance under R1, R2, and R3.
</div>

### 1.3 Linking Number, Writhe, and Orientation

Given an oriented link of two components \(K_1\) and \(K_2\), we can define a fundamental numerical invariant.

<div class="definition">
Let \(D\) be a diagram of an oriented 2-component link \(K_1 \cup K_2\). At each crossing where one strand belongs to \(K_1\) and the other to \(K_2\), assign a sign: \(+1\) if the crossing is positive (right-handed) and \(-1\) if negative (left-handed). The <strong>linking number</strong> is
\[
\mathrm{lk}(K_1, K_2) = \frac{1}{2} \sum_{\text{mixed crossings}} \varepsilon(c),
\]
where the sum ranges over all crossings involving both components and \(\varepsilon(c) \in \{+1, -1\}\) is the sign of crossing \(c\).
</div>

<div class="proposition">
<strong>Proposition 1.2.</strong> The linking number is an ambient isotopy invariant of oriented links. That is, it is unchanged by Reidemeister moves.
</div>

<div class="proof">
We verify invariance under each Reidemeister move. Move R1 involves only one component and introduces or removes a self-crossing, not a mixed crossing, so the linking number is unchanged. Move R2, applied to strands from different components, introduces or removes two mixed crossings of opposite sign, so the total is unchanged. Move R3 can be checked by examining all possible strand assignments; in each case, the mixed crossing contributions before and after the move are equal. \(\square\)
</div>

<div class="example">
For the <strong>Hopf link</strong>, consisting of two circles linked once, the linking number is \(\pm 1\) depending on orientation. The positive Hopf link (both components oriented compatibly with a standard right-hand rule) has \(\mathrm{lk} = +1\). The two-component unlink has linking number 0.
</div>

The linking number has a beautiful topological interpretation: \(\mathrm{lk}(K_1, K_2)\) equals the algebraic intersection number of \(K_1\) with any Seifert surface for \(K_2\). It can also be computed via the Gauss integral formula:
\[
\mathrm{lk}(K_1, K_2) = \frac{1}{4\pi} \oint_{K_1} \oint_{K_2} \frac{\mathbf{r}_1 - \mathbf{r}_2}{|\mathbf{r}_1 - \mathbf{r}_2|^3} \cdot (d\mathbf{r}_1 \times d\mathbf{r}_2),
\]
one of the earliest connections between topology and analysis, discovered by Gauss around 1833 in the context of electromagnetic theory.

<div class="definition">
The <strong>writhe</strong> of an oriented knot diagram \(D\) is
\[
w(D) = \sum_{\text{all crossings}} \varepsilon(c).
\]
Unlike the linking number, the writhe is <em>not</em> an invariant of the knot — it changes under R1 moves (by \(\pm 1\)) but is invariant under R2 and R3.
</div>

The writhe captures the "twist" in a particular diagram. Its failure to be an invariant under R1 is actually useful: it is precisely the correction needed to pass from the Kauffman bracket to the Jones polynomial, as we shall see in Chapter 3.

### 1.4 Connected Sum and Prime Decomposition

<div class="definition">
Given oriented knots \(K_1\) and \(K_2\), their <strong>connected sum</strong> \(K_1 \mathbin{\#} K_2\) is formed by removing a small arc from each knot and connecting the four endpoints by two arcs that do not cross each other or any other strand, respecting orientations. Formally, we remove a trivial ball pair from each \((S^3, K_i)\) and glue along the resulting boundary sphere pairs.
</div>

The connected sum is well-defined up to ambient isotopy (a fact that requires some care to prove, using the prime decomposition of the ambient 3-sphere). It is also commutative and associative, and the unknot serves as the identity element.

<div class="definition">
A nontrivial knot \(K\) is <strong>prime</strong> if whenever \(K = K_1 \mathbin{\#} K_2\), one of \(K_1\), \(K_2\) is the unknot. A nontrivial knot that is not prime is <strong>composite</strong>.
</div>

<div class="theorem">
<strong>Theorem 1.3 (Schubert, 1949).</strong> Every knot decomposes as a connected sum of finitely many prime knots, and this decomposition is unique up to order.
</div>

<div class="proof">
<em>Proof sketch.</em> The existence of a prime decomposition follows from the fact that the genus of a connected sum satisfies \(g(K_1 \mathbin{\#} K_2) = g(K_1) + g(K_2)\), so the decomposition process must terminate after at most \(g(K)\) steps. For uniqueness, Schubert's original argument uses the concept of <em>companionship trees</em> and properties of incompressible tori in knot complements. A more modern approach uses the uniqueness of prime decompositions in the category of 3-manifolds with boundary, applied to the knot exterior. The key technical ingredient is the irreducibility of the complement of a prime knot. \(\square\)
</div>

This result establishes a perfect analogy with the fundamental theorem of arithmetic: knots form a commutative monoid under connected sum, and every element factors uniquely into primes. The classification of knots is thus reduced to the classification of prime knots.

### 1.5 The Knot Table

The systematic enumeration of knots, begun by Tait in the 1870s at Kelvin's instigation, remains an active endeavor. Knots are organized by <em>crossing number</em> — the minimum number of crossings in any diagram.

<div class="definition">
The <strong>crossing number</strong> \(c(K)\) of a knot \(K\) is the minimum number of crossings over all diagrams of \(K\).
</div>

The unknot has crossing number 0. The trefoil has crossing number 3, and is the unique prime knot with this crossing number. At four crossings there is one prime knot (the figure-eight knot \(4_1\)), at five crossings there are two (\(5_1\) and \(5_2\)), and the numbers grow rapidly: there are 2977 prime knots with 13 or fewer crossings, and over 1.7 million with 16 or fewer crossings, as computed by Hoste, Thistlethwaite, and Weeks.

<div class="remark">
The traditional notation \(n_k\) denotes the \(k\)-th prime knot with \(n\) crossings, using the ordering from the classical tables. Modern tables also use the Dowker-Thistlethwaite notation. The trefoil is \(3_1\), the figure-eight is \(4_1\), the torus knots \(T(2,5)\) and the twist knot are \(5_1\) and \(5_2\) respectively.
</div>

Three famous conjectures of Tait, formulated in the 1880s, remained open for over a century until the Jones polynomial provided the tools for their resolution in the late 1980s and early 1990s:

1. <em>A reduced alternating diagram has minimal crossing number.</em> (Proved by Kauffman, Murasugi, and Thistlethwaite, 1987-88.)
2. <em>Any two reduced alternating diagrams of the same knot have the same writhe.</em> (Proved by the same authors.)
3. <em>Two reduced alternating diagrams of the same prime knot are related by a sequence of flypes.</em> (Proved by Menasco and Thistlethwaite, 1993.)

These results demonstrate the remarkable power of polynomial invariants — invariants arising from quantum and statistical mechanics settled purely classical questions about knot diagrams.

---

## Chapter 2: Classical Knot Invariants

Having established the basic framework of knots and their diagrams, we now develop the classical invariants that have formed the backbone of knot theory since the early twentieth century. These invariants — the knot group, Seifert surfaces, the Alexander polynomial, genus, and signature — predate the quantum revolution of the 1980s and remain indispensable.

### 2.1 The Knot Group

The most natural topological invariant of a knot is the fundamental group of its complement.

<div class="definition">
The <strong>knot group</strong> of a knot \(K \subset S^3\) is the fundamental group \(\pi_1(S^3 \setminus K)\) of the knot complement. For a link \(L\), the <strong>link group</strong> is \(\pi_1(S^3 \setminus L)\).
</div>

The knot group is a powerful invariant — indeed, a deep theorem of Gordon and Luecke (1989) states that knots are determined by their complements, so the knot group (together with the peripheral structure) completely classifies knots. However, the knot group alone does not suffice: there exist non-equivalent knots with isomorphic knot groups (though such examples require non-prime knots with the same prime factors in different orders — which cannot happen by Schubert's uniqueness theorem — or more subtle constructions).

<div class="theorem">
<strong>Theorem 2.1 (Wirtinger Presentation).</strong> Let \(D\) be a diagram of a knot \(K\) with arcs \(a_1, \ldots, a_n\) (the connected components of the diagram minus the undercrossings) and crossings \(c_1, \ldots, c_n\). Then \(\pi_1(S^3 \setminus K)\) has a presentation with generators \(x_1, \ldots, x_n\) (one for each arc, represented by a meridional loop) and relations \(x_i x_j x_i^{-1} = x_k\) at each crossing, where \(x_i\) is the overcrossing arc and \(x_j, x_k\) are the undercrossing arcs on either side. Any one relation is a consequence of the others, so we have a presentation with \(n\) generators and \(n-1\) relations.
</div>

<div class="proof">
The proof uses the Seifert-van Kampen theorem applied to a decomposition of \(S^3 \setminus K\) obtained by cutting along the projection plane. The upper half-space minus the overcrossing arcs is homotopy equivalent to a wedge of circles (one for each arc), giving the generators. The lower half-space provides no additional generators. Regluing introduces the crossing relations, one for each crossing. The redundancy of one relation follows from the fact that \(S^3 \setminus K\) is connected and the relation at any one crossing is a consequence of the others via the fundamental group of the bounding 2-sphere at infinity. \(\square\)
</div>

<div class="example">
<strong>The trefoil knot group.</strong> The standard diagram of the trefoil \(3_1\) has three arcs \(a, b, c\) and three crossings. The Wirtinger presentation gives:
\[
\pi_1(S^3 \setminus 3_1) = \langle a, b, c \mid aba^{-1} = c, \; bcb^{-1} = a, \; cac^{-1} = b \rangle.
\]
Eliminating \(c = aba^{-1}\) and using the second relation, we obtain:
\[
\pi_1(S^3 \setminus 3_1) = \langle a, b \mid aba = bab \rangle.
\]
This is the <em>braid group on 3 strands</em> \(B_3\), a fact intimately connected to the trefoil's nature as a torus knot \(T(2,3)\). Setting \(x = ab\) and \(y = aba\), we can rewrite this as \(\langle x, y \mid x^2 = y^3 \rangle\), exhibiting the trefoil group as a central extension of the modular group \(\mathrm{PSL}(2,\mathbb{Z}) \cong \mathbb{Z}/2 * \mathbb{Z}/3\).
</div>

<div class="example">
<strong>The figure-eight knot group.</strong> For the figure-eight knot \(4_1\), a Wirtinger presentation from the standard 4-crossing diagram yields (after simplification):
\[
\pi_1(S^3 \setminus 4_1) = \langle a, b \mid a^{-1}bab^{-1}a = ba^{-1}bab^{-1} \rangle.
\]
This group is isomorphic to a discrete subgroup of \(\mathrm{PSL}(2, \mathbb{C})\), reflecting the fact (which we will see in Chapter 6) that the figure-eight knot complement admits a complete hyperbolic structure.
</div>

### 2.2 Seifert Surfaces and Seifert's Algorithm

A key construction in knot theory is that of a <em>Seifert surface</em> — an oriented surface whose boundary is the knot.

<div class="definition">
A <strong>Seifert surface</strong> for a knot \(K \subset S^3\) is a compact, connected, oriented surface \(\Sigma \subset S^3\) with \(\partial \Sigma = K\). More generally, a Seifert surface for a link \(L\) is a compact oriented surface (not necessarily connected) with \(\partial \Sigma = L\).
</div>

<div class="theorem">
<strong>Theorem 2.2 (Seifert, 1934).</strong> Every knot (and link) in \(S^3\) bounds a Seifert surface. Moreover, a Seifert surface can be algorithmically constructed from any diagram.
</div>

<div class="proof">
<strong>Seifert's algorithm.</strong> Given an oriented knot diagram \(D\):
<br><br>
<strong>Step 1.</strong> At each crossing, resolve the crossing by connecting the strands consistently with orientation (replacing each crossing by the oriented smoothing). This produces a collection of disjoint simple closed curves in the plane, called <strong>Seifert circles</strong>.
<br><br>
<strong>Step 2.</strong> Bound each Seifert circle by a disk, nesting the disks at different heights according to their nesting in the plane (innermost circles get the highest disks).
<br><br>
<strong>Step 3.</strong> At each former crossing, attach a half-twisted band connecting the two relevant disks, with the twist direction determined by the crossing sign.
<br><br>
The result is an oriented surface \(\Sigma\) whose boundary is the original knot \(K\). Orientability follows from the fact that the oriented smoothing preserves consistency of orientation on the Seifert circles, which extends to the disks and half-twisted bands. \(\square\)
</div>

<div class="example">
Applying Seifert's algorithm to the standard diagram of the trefoil knot produces two Seifert circles and three half-twisted bands, yielding a surface of genus 1 (a punctured torus). For the figure-eight knot, the algorithm produces three Seifert circles and four bands, also yielding a genus-1 surface.
</div>

### 2.3 The Seifert Matrix

The Seifert surface carries rich algebraic information captured by the Seifert matrix.

<div class="definition">
Let \(\Sigma\) be a Seifert surface of genus \(g\) for a knot \(K\). Choose a basis \(\{a_1, \ldots, a_{2g}\}\) for \(H_1(\Sigma; \mathbb{Z}) \cong \mathbb{Z}^{2g}\). The <strong>Seifert matrix</strong> \(V = (v_{ij})\) is the \(2g \times 2g\) integer matrix defined by
\[
v_{ij} = \mathrm{lk}(a_i, a_j^+),
\]
where \(a_j^+\) denotes the curve \(a_j\) pushed slightly off \(\Sigma\) in the positive normal direction.
</div>

The Seifert matrix depends on the choice of Seifert surface and basis, but two Seifert matrices for the same knot are related by a sequence of elementary operations.

<div class="definition">
Two integer matrices \(V\) and \(V'\) are <strong>S-equivalent</strong> if they are related by a finite sequence of the following moves: (1) \(V \mapsto PVP^T\) for any unimodular matrix \(P\), and (2) <strong>stabilization</strong>: \(V \mapsto V \oplus \begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix}\) or \(V \mapsto V \oplus \begin{pmatrix} 0 & 0 \\ 1 & 0 \end{pmatrix}\).
</div>

<div class="theorem">
<strong>Theorem 2.3.</strong> Two Seifert matrices are S-equivalent if and only if they arise from Seifert surfaces of the same knot.
</div>

From the Seifert matrix, we extract several important invariants.

### 2.4 The Alexander Polynomial

The Alexander polynomial, introduced by J.W. Alexander in 1928, was the first polynomial knot invariant. We give two constructions: via the Seifert matrix and via Fox calculus.

<div class="definition">
The <strong>Alexander polynomial</strong> of a knot \(K\) with Seifert matrix \(V\) is
\[
\Delta_K(t) = \det(t^{1/2} V - t^{-1/2} V^T).
\]
This is a Laurent polynomial in \(t^{1/2}\), but one can show it is actually a polynomial in \(t^{\pm 1}\), well-defined up to multiplication by units \(\pm t^k\) of \(\mathbb{Z}[t, t^{-1}]\).
</div>

<div class="proposition">
<strong>Proposition 2.4.</strong> The Alexander polynomial is an invariant of the knot \(K\), independent of the choice of Seifert surface and basis (up to the standard indeterminacy).
</div>

<div class="proof">
We must check invariance under the two S-equivalence moves. Under \(V \mapsto PVP^T\), we have \(\det(t^{1/2} PVP^T - t^{-1/2} PV^TP^T) = (\det P)^2 \det(t^{1/2}V - t^{-1/2}V^T) = \det(t^{1/2}V - t^{-1/2}V^T)\), since \(\det P = \pm 1\). Under stabilization, a direct computation shows that the determinant is multiplied by \(\det(t^{1/2}\begin{pmatrix}0&1\\0&0\end{pmatrix} - t^{-1/2}\begin{pmatrix}0&0\\1&0\end{pmatrix}) = \det\begin{pmatrix}0&t^{1/2}\\-t^{-1/2}&0\end{pmatrix} = 1\). \(\square\)
</div>

<div class="example">
<strong>Alexander polynomial of the trefoil.</strong> From the standard Seifert surface, the trefoil has Seifert matrix
\[
V = \begin{pmatrix} -1 & 1 \\ 0 & -1 \end{pmatrix}.
\]
Then:
\[
\Delta_{3_1}(t) = \det\begin{pmatrix} -t^{1/2} - (-t^{-1/2}) & t^{1/2} - 0 \\ 0 - t^{-1/2} & -t^{1/2} - (-t^{-1/2}) \end{pmatrix} = \det\begin{pmatrix} -t^{1/2}+t^{-1/2} & t^{1/2} \\ -t^{-1/2} & -t^{1/2}+t^{-1/2} \end{pmatrix}.
\]
Computing: \((-t^{1/2}+t^{-1/2})^2 + t^{1/2} \cdot t^{-1/2} = t - 2 + t^{-1} + 1 = t - 1 + t^{-1}\). Hence \(\Delta_{3_1}(t) = t - 1 + t^{-1}\).
</div>

<div class="example">
<strong>Alexander polynomial of the figure-eight knot.</strong> The Seifert matrix is
\[
V = \begin{pmatrix} -1 & 1 \\ 0 & 1 \end{pmatrix}.
\]
A similar computation yields \(\Delta_{4_1}(t) = -t + 3 - t^{-1}\).
</div>

The Alexander polynomial satisfies several important properties:

<div class="proposition">
<strong>Proposition 2.5.</strong> For any knot \(K\):
<br>(a) \(\Delta_K(1) = 1\).
<br>(b) \(\Delta_K(t) = \Delta_K(t^{-1})\) (symmetry).
<br>(c) \(\Delta_{K_1 \mathbin{\#} K_2}(t) = \Delta_{K_1}(t) \cdot \Delta_{K_2}(t)\).
<br>(d) If \(K\) is the unknot, then \(\Delta_K(t) = 1\).
</div>

Property (d) shows that a knot with nontrivial Alexander polynomial is nontrivial. However, the converse fails: there exist nontrivial knots (such as the Conway knot \(11n_{34}\)) with Alexander polynomial 1.

### 2.5 Fox Calculus and the Alexander Polynomial

An alternative route to the Alexander polynomial uses the Fox free differential calculus, introduced by Ralph Fox in the 1950s.

<div class="definition">
Let \(F = F(x_1, \ldots, x_n)\) be a free group. The <strong>Fox derivative</strong> \(\frac{\partial}{\partial x_j} : \mathbb{Z}[F] \to \mathbb{Z}[F]\) is the unique \(\mathbb{Z}\)-linear map satisfying:
<br>(1) \(\frac{\partial x_i}{\partial x_j} = \delta_{ij}\),
<br>(2) \(\frac{\partial}{\partial x_j}(uv) = \frac{\partial u}{\partial x_j} + u \frac{\partial v}{\partial x_j}\) for all \(u, v \in F\) (extended linearly).
</div>

From a Wirtinger presentation \(\langle x_1, \ldots, x_n \mid r_1, \ldots, r_{n-1} \rangle\) of the knot group, form the <em>Alexander matrix</em> \(A = \left(\frac{\partial r_i}{\partial x_j}\right)\), an \((n-1) \times n\) matrix over \(\mathbb{Z}[F]\). Apply the abelianization map \(\phi : \pi_1(S^3 \setminus K) \to H_1(S^3 \setminus K) \cong \mathbb{Z}\), sending each meridian \(x_i \mapsto t\). Then \(\Delta_K(t)\) is the greatest common divisor of the \((n-1) \times (n-1)\) minors of \(\phi(A)\), the <em>Alexander matrix evaluated in \(\mathbb{Z}[t, t^{-1}]\)</em>.

<div class="remark">
The Fox calculus approach reveals that the Alexander polynomial is fundamentally an invariant of the knot group (more precisely, of the maximal abelian cover of the knot complement). It can be defined purely in terms of the module structure of \(H_1\) of the infinite cyclic cover, called the <strong>Alexander module</strong>. The Alexander polynomial is the order of this module as a \(\mathbb{Z}[t, t^{-1}]\)-module.
</div>

### 2.6 Signature and Determinant

<div class="definition">
The <strong>signature</strong> of a knot \(K\) with Seifert matrix \(V\) is
\[
\sigma(K) = \mathrm{signature}(V + V^T),
\]
where \(\mathrm{signature}\) denotes the signature (number of positive eigenvalues minus number of negative eigenvalues) of the symmetric bilinear form. The <strong>determinant</strong> of \(K\) is
\[
\det(K) = |\det(V + V^T)| = |\Delta_K(-1)|.
\]
</div>

<div class="proposition">
<strong>Proposition 2.6.</strong> The signature and determinant are knot invariants. Moreover, the signature is additive under connected sum: \(\sigma(K_1 \mathbin{\#} K_2) = \sigma(K_1) + \sigma(K_2)\).
</div>

<div class="example">
For the trefoil, \(V + V^T = \begin{pmatrix} -2 & 1 \\ 1 & -2 \end{pmatrix}\), which has eigenvalues \(-1\) and \(-3\), so \(\sigma(3_1) = -2\) and \(\det(3_1) = 3\). For the figure-eight knot, \(V + V^T = \begin{pmatrix} -2 & 1 \\ 1 & 2 \end{pmatrix}\) with eigenvalues \(\pm\sqrt{5}\), so \(\sigma(4_1) = 0\) and \(\det(4_1) = 5\).
</div>

The vanishing of the signature of the figure-eight knot reflects its amphicheiral nature — the figure-eight knot is equivalent to its mirror image. The signature provides an obstruction to amphicheirality: if \(\sigma(K) \neq 0\), then \(K\) is not amphicheiral.

### 2.7 Genus and Fibered Knots

<div class="definition">
The <strong>genus</strong> \(g(K)\) of a knot \(K\) is the minimum genus over all Seifert surfaces for \(K\):
\[
g(K) = \min\{g(\Sigma) : \Sigma \text{ is a Seifert surface for } K\}.
\]
</div>

<div class="proposition">
<strong>Proposition 2.7.</strong>
<br>(a) \(g(K) = 0\) if and only if \(K\) is the unknot.
<br>(b) \(g(K_1 \mathbin{\#} K_2) = g(K_1) + g(K_2)\).
<br>(c) \(g(K) \geq \frac{1}{2} \deg \Delta_K(t)\), where \(\deg\) denotes the span (difference between highest and lowest powers).
</div>

Property (a) is a consequence of the fact that a genus-0 Seifert surface is a disk, and a knot bounding a disk in \(S^3\) is unknotted (by the Schoenflies theorem). Property (b), proved by Schubert, was the key ingredient in the proof of unique prime decomposition. Property (c) provides a computable lower bound.

<div class="definition">
A knot \(K\) is <strong>fibered</strong> if its complement \(S^3 \setminus K\) fibers over \(S^1\), i.e., there is a locally trivial fibration \(S^3 \setminus K \to S^1\) whose fiber is a Seifert surface for \(K\). Equivalently, the fiber is an open surface whose closure is a Seifert surface of minimal genus.
</div>

<div class="example">
The trefoil and figure-eight knot are both fibered. In fact, all torus knots \(T(p,q)\) are fibered, with fiber genus \(\frac{(p-1)(q-1)}{2}\). For the trefoil \(T(2,3)\), the fiber is a punctured torus, and the monodromy is given by a matrix \(\begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}\) (a pseudo-Anosov map, since its eigenvalues are the golden ratio and its conjugate).
</div>

<div class="theorem">
<strong>Theorem 2.8 (Neuwirth-Stallings).</strong> A knot \(K\) is fibered if and only if the commutator subgroup \([\pi_1(S^3 \setminus K), \pi_1(S^3 \setminus K)]\) is finitely generated (and hence free).
</div>

A necessary condition for fiberedness that is often useful in practice: if \(K\) is fibered, then \(\Delta_K(t)\) is monic (its leading coefficient is \(\pm 1\)) and \(\deg \Delta_K = 2g(K)\).

---

## Chapter 3: The Jones Polynomial and Quantum Invariants

The discovery of the Jones polynomial in 1984 by Vaughan Jones revolutionized knot theory, forging unexpected connections to statistical mechanics, quantum groups, and quantum field theory. Jones's discovery arose not from topology but from his work on operator algebras and subfactors — a striking example of the unity of mathematics.

### 3.1 The Kauffman Bracket

We begin with Louis Kauffman's elegant state-sum model for the Jones polynomial, which provides a purely combinatorial construction.

<div class="definition">
Let \(D\) be an unoriented link diagram. The <strong>Kauffman bracket</strong> \(\langle D \rangle \in \mathbb{Z}[A, A^{-1}]\) is defined by the following axioms:
<br>(1) \(\langle \bigcirc \rangle = 1\) (the bracket of the unknot diagram with no crossings is 1).
<br>(2) \(\langle D \sqcup \bigcirc \rangle = (-A^2 - A^{-2}) \langle D \rangle\) (adding a disjoint unknotted circle multiplies by \(d = -A^2 - A^{-2}\)).
<br>(3) At each crossing, the bracket satisfies the <strong>skein relation</strong>:
\[
\langle \,\raisebox{-2pt}{\text{crossing}}\, \rangle = A \langle \,\raisebox{-2pt}{\text{0-smoothing}}\, \rangle + A^{-1} \langle \,\raisebox{-2pt}{\text{1-smoothing}}\, \rangle,
\]
where the <em>0-smoothing</em> (or <em>A-smoothing</em>) joins the NW-SE strands and the <em>1-smoothing</em> (or <em>B-smoothing</em>) joins the NE-SW strands at the crossing.
</div>

The bracket can be computed as a state sum. A <em>state</em> \(s\) of a diagram \(D\) with \(n\) crossings is a function assigning to each crossing a choice of 0-smoothing or 1-smoothing. Let \(a(s)\) and \(b(s)\) denote the number of 0- and 1-smoothings in state \(s\), and let \(|s|\) denote the number of closed curves obtained after all smoothings. Then:

\[
\langle D \rangle = \sum_{\text{states } s} A^{a(s) - b(s)} (-A^2 - A^{-2})^{|s|-1}.
\]

<div class="proposition">
<strong>Proposition 3.1.</strong> The Kauffman bracket is invariant under Reidemeister moves R2 and R3, but under R1 it satisfies:
\[
\langle D \text{ with positive curl} \rangle = -A^3 \langle D \text{ without curl} \rangle, \qquad \langle D \text{ with negative curl} \rangle = -A^{-3} \langle D \text{ without curl} \rangle.
\]
</div>

<div class="proof">
For R2, consider a diagram with two crossings between the same pair of strands. Expanding the bracket at both crossings gives four terms. Two of them cancel (they produce a configuration with a contractible circle, and the \(A\) and \(A^{-1}\) contributions cancel), and the remaining two combine to reproduce the original bracket. The R3 invariance follows from R2 invariance by a direct diagrammatic argument. For R1, expanding at the single crossing of a curl gives \(\langle \text{curl} \rangle = A \langle \text{no curl} \rangle \cdot 1 + A^{-1} \langle \text{no curl} \rangle \cdot (-A^2 - A^{-2})\), and simplification yields \(-A^3 \langle \text{no curl} \rangle\) for a positive curl. \(\square\)
</div>

### 3.2 The Jones Polynomial

The failure of the bracket under R1 is precisely corrected by the writhe.

<div class="definition">
Let \(D\) be an oriented link diagram with writhe \(w(D)\). The <strong>Jones polynomial</strong> of the oriented link \(L\) represented by \(D\) is
\[
V_L(t) = \left((-A)^{-3w(D)} \langle D \rangle\right)\bigg|_{A^2 = t^{-1/2}},
\]
or equivalently, with the substitution \(A = t^{-1/4}\):
\[
V_L(t) = (-1)^{w(D)} t^{3w(D)/4} \langle D \rangle\bigg|_{A = t^{-1/4}}.
\]
This is a Laurent polynomial in \(t^{1/2}\).
</div>

<div class="theorem">
<strong>Theorem 3.2 (Jones, 1984; Kauffman, 1987).</strong> The Jones polynomial \(V_L(t)\) is an isotopy invariant of oriented links.
</div>

<div class="proof">
By Proposition 3.1, the bracket \(\langle D \rangle\) is invariant under R2 and R3. The writhe \(w(D)\) changes by \(\pm 1\) under R1 and is invariant under R2 and R3. Since R1 changes \(\langle D \rangle\) by \(-A^{\pm 3}\) and \((-A)^{-3w(D)}\) compensates for this change, the normalized polynomial \((-A)^{-3w(D)} \langle D \rangle\) is invariant under all three Reidemeister moves. By Reidemeister's theorem, it is a link invariant. \(\square\)
</div>

<div class="theorem">
<strong>Theorem 3.3 (Skein Relation).</strong> The Jones polynomial satisfies the skein relation:
\[
t^{-1} V_{L_+}(t) - t \, V_{L_-}(t) = (t^{1/2} - t^{-1/2}) V_{L_0}(t),
\]
where \(L_+\), \(L_-\), and \(L_0\) denote three links that are identical except near one crossing, where they have a positive crossing, negative crossing, and oriented smoothing, respectively.
</div>

This skein relation, together with the normalization \(V_{\text{unknot}}(t) = 1\), uniquely determines the Jones polynomial. It provides a recursive method for computation.

<div class="example">
<strong>Jones polynomial of the trefoil.</strong> Using the skein relation applied to the standard diagram of the left-handed trefoil (or by direct bracket computation), one obtains:
\[
V_{3_1}(t) = -t^{-4} + t^{-3} + t^{-1}
\]
for the left-handed trefoil, and
\[
V_{\overline{3_1}}(t) = -t^4 + t^3 + t
\]
for the right-handed trefoil. Since \(V_{3_1}(t) \neq V_{\overline{3_1}}(t)\), the Jones polynomial detects the chirality of the trefoil — it distinguishes the trefoil from its mirror image. This is something the Alexander polynomial cannot do, since \(\Delta_K(t)\) is always symmetric.
</div>

<div class="example">
<strong>Jones polynomial of the figure-eight knot.</strong> The figure-eight knot is amphicheiral, and its Jones polynomial is:
\[
V_{4_1}(t) = t^2 - t + 1 - t^{-1} + t^{-2}.
\]
One can verify that \(V_{4_1}(t) = V_{4_1}(t^{-1})\), consistent with amphicheirality.
</div>

<div class="example">
<strong>Jones polynomial of the Hopf link.</strong> For the positive Hopf link with two components:
\[
V_{\text{Hopf}}(t) = -(t^{1/2} + t^{5/2}).
\]
</div>

### 3.3 Properties of the Jones Polynomial

<div class="proposition">
<strong>Proposition 3.4.</strong> The Jones polynomial satisfies:
<br>(a) \(V_{\text{unknot}}(t) = 1\).
<br>(b) \(V_{\overline{L}}(t) = V_L(t^{-1})\), where \(\overline{L}\) is the mirror image of \(L\).
<br>(c) \(V_{L_1 \mathbin{\#} L_2}(t) = V_{L_1}(t) \cdot V_{L_2}(t)\).
<br>(d) For the \(n\)-component unlink, \(V(t) = \left(-t^{1/2} - t^{-1/2}\right)^{n-1}\).
</div>

A fundamental open problem, stated by Jones himself in 1985, is:

<div class="remark">
<strong>Open Problem.</strong> Does \(V_K(t) = 1\) imply that \(K\) is the unknot? This remains unsettled, though it is known that the Jones polynomial detects the unknot among knots with fewer than 24 crossings. In contrast, the Alexander polynomial does <em>not</em> detect the unknot.
</div>

### 3.4 The HOMFLY-PT Polynomial

The Jones polynomial was quickly generalized to a two-variable invariant by several groups independently (Freyd-Yetter, Lickorish-Millett, Ocneanu, Hoste, and Przytycki-Traczyk) in 1985.

<div class="definition">
The <strong>HOMFLY-PT polynomial</strong> \(P_L(v, z)\) is the unique invariant of oriented links satisfying:
<br>(1) \(P_{\text{unknot}}(v,z) = 1\).
<br>(2) The skein relation: \(v^{-1} P_{L_+} - v P_{L_-} = z P_{L_0}\).
</div>

The HOMFLY-PT polynomial specializes to both the Alexander and Jones polynomials:
\[
P_L(1, z)\bigg|_{z = t^{1/2} - t^{-1/2}} = \Delta_L(t), \qquad P_L(t^{-1}, t^{1/2} - t^{-1/2}) = V_L(t).
\]

<div class="remark">
The HOMFLY-PT polynomial is strictly stronger than both the Alexander and Jones polynomials — there exist knots distinguished by HOMFLY-PT but not by either specialization alone. However, it is not a complete invariant: there exist non-equivalent knots (even prime knots) with the same HOMFLY-PT polynomial.
</div>

### 3.5 The Kauffman Polynomial

<div class="definition">
The <strong>Kauffman polynomial</strong> \(F_L(a, z)\) is defined via the <strong>Dubrovnik polynomial</strong> (or the equivalent regular isotopy invariant \(\Lambda_L(a,z)\)) satisfying:
<br>(1) \(F_{\text{unknot}} = 1\).
<br>(2) The skein relation involves both the crossing change and two smoothings.
<br>(3) The relation to regular isotopy: \(F_L(a,z) = a^{-w(D)} \Lambda_D(a,z)\).
</div>

The Kauffman polynomial is independent of the HOMFLY-PT polynomial — each detects knots that the other misses. Together, they are still not complete.

### 3.6 Connections to Statistical Mechanics

Jones's original construction of his polynomial came from his study of subfactors of von Neumann algebras, but a remarkable reinterpretation emerged through statistical mechanics. The state-sum formula for the Kauffman bracket is formally identical to the partition function of a two-dimensional lattice model.

<div class="theorem">
<strong>Theorem 3.5 (Yang-Baxter Equation).</strong> The Jones polynomial arises from solutions to the Yang-Baxter equation
\[
R_{12} R_{13} R_{23} = R_{23} R_{13} R_{12},
\]
where \(R \in \mathrm{End}(V \otimes V)\) is an endomorphism of the tensor square of a vector space. Invariance under the Reidemeister R3 move corresponds precisely to the Yang-Baxter equation.
</div>

This connection was elucidated by Jones and Turaev independently. The R-matrix for the Jones polynomial comes from the fundamental representation of the quantum group \(U_q(\mathfrak{sl}_2)\) at \(q = t^{1/2}\).

### 3.7 Quantum Groups and Ribbon Categories

The quantum group perspective, developed by Drinfeld, Jimbo, and Reshetikhin-Turaev, provides a unified framework for constructing knot invariants.

<div class="definition">
A <strong>quantum group</strong> \(U_q(\mathfrak{g})\) is a Hopf algebra that is a \(q\)-deformation of the universal enveloping algebra \(U(\mathfrak{g})\) of a semisimple Lie algebra \(\mathfrak{g}\). For each finite-dimensional representation \(V\) of \(U_q(\mathfrak{g})\), one obtains a knot invariant by assigning \(V\) to the strands and using the R-matrix and its inverse at crossings.
</div>

The representation theory of \(U_q(\mathfrak{sl}_2)\) with the standard 2-dimensional representation recovers the Jones polynomial. Using other representations gives the <em>colored Jones polynomials</em>, and other Lie algebras give other invariants: \(U_q(\mathfrak{sl}_N)\) with the fundamental representation gives the HOMFLY-PT polynomial specialized at \(v = q^N\).

<div class="remark">
The proper categorical framework for this construction is that of <strong>ribbon categories</strong> (also called tortile categories). A ribbon category is a braided monoidal category equipped with a compatible twist (balancing) and duality. The category of finite-dimensional representations of \(U_q(\mathfrak{g})\) is a ribbon category, and Reshetikhin-Turaev showed that any ribbon category gives rise to link invariants. This framework also extends to 3-manifold invariants via surgery presentations, yielding the Witten-Reshetikhin-Turaev invariants.
</div>

The deepest interpretation of these invariants comes from Edward Witten's 1988 observation that the Jones polynomial arises as the expectation value of a Wilson loop operator in Chern-Simons gauge theory with gauge group \(\mathrm{SU}(2)\):
\[
V_K(t) = \left\langle \mathrm{tr}\, \mathcal{P} \exp\left(\oint_K A\right) \right\rangle_{CS},
\]
where the expectation value is computed via the Chern-Simons path integral at level \(k\) with \(t = e^{2\pi i/(k+2)}\). While this integral has not been rigorously defined mathematically, it has inspired an enormous body of rigorous work and correctly predicts the properties of quantum invariants.

---

## Chapter 4: Braid Groups and the Alexander-Markov Theorem

Braid groups provide an algebraic approach to knot theory, encoding the combinatorics of intertwining strands. Every knot arises as the closure of a braid, and the braid perspective has been instrumental in both theoretical advances and computational applications.

### 4.1 The Braid Group

<div class="definition">
The <strong>braid group</strong> on \(n\) strands, denoted \(B_n\), is the group with generators \(\sigma_1, \sigma_2, \ldots, \sigma_{n-1}\) and relations:
<br>(i) \(\sigma_i \sigma_j = \sigma_j \sigma_i\) for \(|i - j| \geq 2\) (far commutativity),
<br>(ii) \(\sigma_i \sigma_{i+1} \sigma_i = \sigma_{i+1} \sigma_i \sigma_{i+1}\) for \(1 \leq i \leq n-2\) (braid relation).
<br>
This is the <strong>Artin presentation</strong>, named after Emil Artin who introduced it in 1925.
</div>

Geometrically, \(B_n\) is the fundamental group of the configuration space of \(n\) unordered points in the plane:
\[
B_n = \pi_1\left(\frac{\mathbb{C}^n \setminus \Delta}{S_n}\right),
\]
where \(\Delta = \{(z_1, \ldots, z_n) : z_i = z_j \text{ for some } i \neq j\}\) is the fat diagonal and \(S_n\) acts by permutation. The generator \(\sigma_i\) corresponds to the \(i\)-th strand passing in front of the \((i+1)\)-th strand. There is a natural surjection \(B_n \to S_n\) sending \(\sigma_i \mapsto (i \; i{+}1)\), whose kernel is the <em>pure braid group</em> \(P_n\).

<div class="example">
The braid group \(B_1\) is trivial. The group \(B_2 = \langle \sigma_1 \rangle \cong \mathbb{Z}\) is infinite cyclic. The group \(B_3 = \langle \sigma_1, \sigma_2 \mid \sigma_1\sigma_2\sigma_1 = \sigma_2\sigma_1\sigma_2 \rangle\) is isomorphic to the trefoil knot group (as noted in Chapter 2) and fits in a central extension \(1 \to \mathbb{Z} \to B_3 \to \mathrm{PSL}(2,\mathbb{Z}) \to 1\).
</div>

<div class="proposition">
<strong>Proposition 4.1.</strong> The braid group \(B_n\) is torsion-free for all \(n \geq 1\). Moreover, it is a linear group (embeds in \(\mathrm{GL}(V)\) for some finite-dimensional vector space \(V\)).
</div>

The torsion-freeness follows from the fact that \(B_n\) acts freely on a contractible space (the universal cover of the configuration space). Linearity is a deep result, following from the faithfulness of the Lawrence-Krammer representation (see Section 4.4).

### 4.2 Alexander's Theorem

The fundamental link between braids and knots is provided by the operation of <em>closure</em>.

<div class="definition">
Given a braid \(\beta \in B_n\), its <strong>closure</strong> \(\hat{\beta}\) is the link obtained by connecting the top endpoints to the corresponding bottom endpoints, forming a closed link in \(S^3\). Formally, if the braid is embedded in a cylinder \(D^2 \times [0,1]\), the closure is obtained by identifying \(D^2 \times \{0\}\) with \(D^2 \times \{1\}\) via the identity map.
</div>

<div class="theorem">
<strong>Theorem 4.2 (Alexander, 1923).</strong> Every oriented link in \(S^3\) is the closure of some braid.
</div>

<div class="proof">
<em>Proof sketch.</em> Given an oriented link diagram, we wish to arrange it so that the link winds consistently around a chosen point. More precisely, we seek to isotope the link so that it becomes a closed braid about some axis. The proof proceeds by choosing a point \(O\) not on the diagram and ensuring that, traversing each component according to its orientation, we always wind around \(O\) in the same direction. At any arc that winds in the wrong direction, we perform a local isotopy (introducing additional crossings if necessary) to reverse the winding. This process terminates because each such move reduces a suitable complexity measure. After finitely many moves, the link diagram is in braid form about \(O\). A more modern proof uses the theory of open book decompositions. \(\square\)
</div>

<div class="example">
The trefoil is the closure of the braid \(\sigma_1^3 \in B_2\) (three positive twists of two strands). It is also the closure of \((\sigma_1\sigma_2)^2 \in B_3\). More generally, the torus knot \(T(2, n)\) is the closure of \(\sigma_1^n \in B_2\).
</div>

### 4.3 Markov's Theorem

Different braids can have the same closure. Markov's theorem characterizes when this occurs.

<div class="theorem">
<strong>Theorem 4.3 (Markov, 1936).</strong> Two braids \(\beta_1 \in B_m\) and \(\beta_2 \in B_n\) have ambient isotopic closures \(\hat{\beta}_1 \cong \hat{\beta}_2\) if and only if \(\beta_1\) and \(\beta_2\) are related by a finite sequence of <strong>Markov moves</strong>:
<br><br>
<strong>Type I (conjugation):</strong> \(\beta \mapsto \gamma \beta \gamma^{-1}\) in \(B_n\) for any \(\gamma \in B_n\).
<br>
<strong>Type II (stabilization):</strong> \(\beta \in B_n \mapsto \beta \sigma_n^{\pm 1} \in B_{n+1}\) (adding or removing a strand with a single twist).
</div>

<div class="proof">
<em>Proof sketch.</em> The forward direction (Markov moves preserve the closure) is straightforward: conjugation corresponds to moving the basepoint of the braid closure, and stabilization corresponds to adding or removing a trivial loop. The reverse direction is technically demanding and was first proved rigorously by Birman (1974). The idea is to show that any ambient isotopy between the closures can be decomposed into elementary steps, each corresponding to a Markov move, using the theory of braided surfaces. \(\square\)
</div>

The Alexander-Markov theorem gives a purely algebraic characterization of knot theory: the classification of oriented links is equivalent to classifying elements of \(\bigsqcup_{n=1}^\infty B_n\) up to conjugation and stabilization. This perspective is particularly useful for constructing link invariants: any function on braids that is invariant under both Markov moves automatically defines a link invariant.

<div class="remark">
This is precisely how the Jones polynomial was originally discovered. Jones's trace on the Temperley-Lieb algebra (a quotient of the group algebra of \(B_n\)) naturally satisfies the Markov conditions, yielding a link invariant. The Ocneanu trace on the Hecke algebra of type A similarly yields the HOMFLY-PT polynomial.
</div>

### 4.4 Representations of the Braid Group

Braid groups admit many interesting linear representations.

<div class="definition">
The <strong>Burau representation</strong> \(\rho_n : B_n \to \mathrm{GL}(n-1, \mathbb{Z}[t, t^{-1}])\) is defined by sending the generator \(\sigma_i\) to the matrix that acts as \(\begin{pmatrix} 1-t & t \\ 1 & 0 \end{pmatrix}\) on the \(i\)-th and \((i+1)\)-th coordinates and as the identity elsewhere, in a suitable reduced representation.
</div>

The Burau representation is related to the Alexander polynomial: the Alexander polynomial of the closure \(\hat{\beta}\) can be recovered from the Burau matrix of \(\beta\). Specifically, \(\Delta_{\hat{\beta}}(t) = \frac{\det(\rho_n(\beta) - I)}{1 + t + \cdots + t^{n-1}}\) up to units.

<div class="remark">
The Burau representation is faithful for \(n \leq 3\) (Birman, 1974) but was shown to be unfaithful for \(n \geq 5\) by Moody (1991) and Long-Paton (1993), and for \(n = 4\) by Bigelow (1999). This resolved a long-standing open problem.
</div>

<div class="theorem">
<strong>Theorem 4.4 (Bigelow, 2001; Krammer, 2002).</strong> The <strong>Lawrence-Krammer representation</strong>
\[
\rho : B_n \to \mathrm{GL}\left(\binom{n}{2}, \mathbb{Z}[q^{\pm 1}, t^{\pm 1}]\right)
\]
is faithful for all \(n\). In particular, braid groups are linear.
</div>

This theorem was a landmark result. Bigelow's proof was topological (using the action of braids on a certain covering space of the configuration space of pairs of points in a punctured disk), while Krammer's was algebraic. The faithfulness of the Lawrence-Krammer representation has deep implications: it implies, for instance, that the word problem in braid groups is solvable (which was already known by other means) and that braid groups are residually finite.

### 4.5 Braid Index

<div class="definition">
The <strong>braid index</strong> \(b(L)\) of a link \(L\) is the minimum number of strands over all braids whose closure is \(L\):
\[
b(L) = \min\{n : L = \hat{\beta} \text{ for some } \beta \in B_n\}.
\]
</div>

<div class="theorem">
<strong>Theorem 4.5 (Morton-Williams-Franks, 1986).</strong> The braid index satisfies
\[
b(L) \geq \frac{1}{2}(\mathrm{span}_v P_L(v,z)) + 1,
\]
where \(\mathrm{span}_v\) denotes the difference between the maximum and minimum powers of \(v\) in the HOMFLY-PT polynomial \(P_L(v,z)\). This bound is sharp for many classes of links, including all torus links and alternating links.
</div>

---

## Chapter 5: 3-Manifold Topology

Knot theory is intimately connected to the topology of 3-manifolds. In this chapter, we develop the fundamental structures and decomposition theorems for 3-manifolds, with a focus on how knots and links serve as the building blocks for constructing all closed orientable 3-manifolds.

### 5.1 Heegaard Splittings

<div class="definition">
A <strong>handlebody</strong> of genus \(g\) is a compact orientable 3-manifold with boundary that is homeomorphic to a closed regular neighborhood of a graph embedded in \(\mathbb{R}^3\). Equivalently, it is obtained by attaching \(g\) 1-handles to a 3-ball. Its boundary is a closed orientable surface of genus \(g\).
</div>

<div class="definition">
A <strong>Heegaard splitting</strong> of a closed orientable 3-manifold \(M\) is a decomposition \(M = H_1 \cup_\Sigma H_2\), where \(H_1\) and \(H_2\) are handlebodies of the same genus \(g\) with common boundary \(\Sigma = \partial H_1 = \partial H_2\). The surface \(\Sigma\) is the <strong>Heegaard surface</strong> and \(g\) is the <strong>genus of the splitting</strong>. The <strong>Heegaard genus</strong> of \(M\) is the minimum genus over all Heegaard splittings.
</div>

<div class="theorem">
<strong>Theorem 5.1.</strong> Every closed orientable 3-manifold admits a Heegaard splitting.
</div>

<div class="proof">
Given a triangulation of \(M\), let \(H_1\) be a regular neighborhood of the 1-skeleton, which is a handlebody. The closure of \(M \setminus H_1\) is also a handlebody \(H_2\), since it is a regular neighborhood of the dual 1-skeleton (the 1-skeleton of the dual cell decomposition). Their common boundary \(\Sigma\) is a Heegaard surface. \(\square\)
</div>

<div class="example">
The 3-sphere \(S^3\) has a genus-0 Heegaard splitting: \(S^3 = B^3 \cup_{S^2} B^3\) (gluing two 3-balls along their boundary). It also has genus-1 splittings given by the standard torus in \(S^3\). The 3-torus \(T^3\) has a genus-3 Heegaard splitting. The lens space \(L(p,q)\) has a genus-1 Heegaard splitting, obtained by gluing two solid tori along their boundary via a homeomorphism that sends the meridian of one to a \((p,q)\)-curve on the other.
</div>

A Heegaard splitting is specified by the <em>gluing map</em> \(\phi : \partial H_2 \to \partial H_1\), which is an orientation-reversing homeomorphism of the genus-\(g\) surface. Two different gluing maps may give homeomorphic manifolds, and the study of which maps yield which manifolds is the Heegaard splitting theory.

<div class="remark">
Heegaard splittings are not unique: a manifold may admit many non-isotopic splittings of the same genus. Reidemeister and Singer proved that any two Heegaard splittings of the same manifold become isotopic after a finite number of <strong>stabilizations</strong> (increasing the genus by 1 via a standard connected sum with the genus-1 splitting of \(S^3\)).
</div>

### 5.2 Dehn Surgery

The most powerful method for constructing 3-manifolds from knots and links is Dehn surgery, introduced by Max Dehn in 1910.

<div class="definition">
Let \(K\) be a knot in a 3-manifold \(M\) and let \(N(K)\) be a tubular neighborhood of \(K\) (homeomorphic to a solid torus \(S^1 \times D^2\)). <strong>Dehn surgery</strong> on \(K\) with slope \(p/q\) (where \(p, q\) are coprime integers) consists of:
<br>(1) Removing the interior of \(N(K)\), leaving \(M \setminus \mathrm{int}(N(K))\) with torus boundary.
<br>(2) Gluing back a solid torus \(S^1 \times D^2\) via a homeomorphism of the boundary that sends the meridian \(\{*\} \times \partial D^2\) of the new solid torus to the curve \(p\mu + q\lambda\) on \(\partial N(K)\), where \(\mu\) is the meridian and \(\lambda\) is the longitude of \(K\).
<br>
The result is a new 3-manifold, denoted \(M_K(p/q)\) or \(S^3_{p/q}(K)\) when \(M = S^3\).
</div>

<div class="example">
<strong>Surgery on the unknot.</strong> Performing \(p/q\)-surgery on the unknot in \(S^3\) yields the lens space \(L(p,q)\). In particular, \(0\)-surgery on the unknot yields \(S^2 \times S^1\), and \(\pm 1\)-surgery yields \(S^3\) itself.
</div>

<div class="example">
<strong>Surgery on the trefoil.</strong> Performing \(0\)-surgery on the trefoil yields a manifold with the same homology as \(S^2 \times S^1\). Performing \(+1\)-surgery on the right-handed trefoil yields the Poincare homology sphere \(\Sigma(2,3,5)\), a closed 3-manifold with the same homology as \(S^3\) but with a nontrivial (finite, perfect) fundamental group — the binary icosahedral group of order 120.
</div>

### 5.3 The Lickorish-Wallace Theorem

The remarkable power of surgery is captured by the following foundational result.

<div class="theorem">
<strong>Theorem 5.2 (Lickorish, 1962; Wallace, 1960).</strong> Every closed, connected, orientable 3-manifold can be obtained by Dehn surgery on a framed link in \(S^3\). In fact, one may take all surgery coefficients to be \(\pm 1\) (i.e., surgery on a link of unknotted components with framing \(\pm 1\) suffices).
</div>

<div class="proof">
<em>Proof sketch (Lickorish).</em> The key idea is that every closed orientable 3-manifold \(M\) admits a Heegaard splitting \(M = H_1 \cup_\phi H_2\), and the gluing map \(\phi\) is an element of the mapping class group \(\mathrm{MCG}(\Sigma_g)\). Lickorish proved that the mapping class group is generated by Dehn twists along \(3g - 1\) specific curves on \(\Sigma_g\) (the <em>Lickorish generators</em>). Each Dehn twist along a curve on the Heegaard surface corresponds to a \(\pm 1\)-surgery on the corresponding knot pushed into \(S^3\). Since the identity gluing map gives \(S^3\) (the genus-\(g\) Heegaard splitting of \(S^3\)), any other manifold is obtained from \(S^3\) by a sequence of such surgeries. The composition of these surgeries gives surgery on a framed link with all framings \(\pm 1\). \(\square\)
</div>

This theorem is of immense theoretical importance: it reduces the study of 3-manifolds to the study of framed links in \(S^3\), a combinatorial setting where the tools of knot theory apply.

### 5.4 The Kirby Calculus

Different framed links can describe the same 3-manifold. Kirby's theorem provides the equivalence relation.

<div class="theorem">
<strong>Theorem 5.3 (Kirby, 1978).</strong> Two framed links in \(S^3\) represent the same (orientation-preserving diffeomorphism class of) closed orientable 3-manifold if and only if they are related by a finite sequence of <strong>Kirby moves</strong>:
<br><br>
<strong>K1 (blow-up/blow-down):</strong> Adding or removing an unknotted component with framing \(\pm 1\) that is unlinked from the rest.
<br>
<strong>K2 (handle slide):</strong> Replacing one component \(K_i\) by the connected sum \(K_i \mathbin{\#} K_j'\), where \(K_j'\) is a parallel copy of another component \(K_j\), with appropriate framing adjustment.
</div>

The Kirby calculus is the surgery-theoretic analogue of Reidemeister moves for knot diagrams: it gives a combinatorial characterization of 3-manifold diffeomorphism in terms of diagrammatic manipulations.

<div class="remark">
Any function on framed links that is invariant under Kirby moves defines a 3-manifold invariant. This is the principle behind the Witten-Reshetikhin-Turaev invariants: the quantum invariants associated to surgery presentations are Kirby-move invariant, yielding topological invariants of 3-manifolds.
</div>

### 5.5 Prime Decomposition and the JSJ Decomposition

Three-manifolds admit canonical decomposition theorems analogous to the prime factorization of integers.

<div class="theorem">
<strong>Theorem 5.4 (Kneser, 1929; Milnor, 1962).</strong> Every compact, orientable, irreducible 3-manifold either has finite fundamental group or is aspherical (i.e., its universal cover is contractible). More importantly for our purposes: every closed orientable 3-manifold \(M\) admits a unique (up to order) decomposition
\[
M \cong M_1 \mathbin{\#} M_2 \mathbin{\#} \cdots \mathbin{\#} M_k \mathbin{\#} (S^2 \times S^1)^{\mathbin{\#} \ell},
\]
where each \(M_i\) is a <strong>prime</strong> 3-manifold (one that cannot be decomposed as a nontrivial connected sum) that is not \(S^2 \times S^1\).
</div>

<div class="definition">
A compact orientable 3-manifold \(M\) is <strong>irreducible</strong> if every embedded 2-sphere in \(M\) bounds a 3-ball. A prime manifold is either irreducible or is homeomorphic to \(S^2 \times S^1\).
</div>

For irreducible manifolds, there is a further canonical decomposition along tori.

<div class="theorem">
<strong>Theorem 5.5 (Jaco-Shalen, 1979; Johannson, 1979).</strong> Let \(M\) be a compact, orientable, irreducible 3-manifold with (possibly empty) incompressible boundary. Then there exists a minimal collection of disjoint, non-parallel, incompressible tori \(T_1, \ldots, T_k \subset M\) such that each component of \(M \setminus (T_1 \cup \cdots \cup T_k)\) is either <strong>Seifert fibered</strong> or <strong>atoroidal</strong> (contains no essential tori). This collection is unique up to isotopy.
</div>

<div class="definition">
An embedded surface \(S\) in a 3-manifold \(M\) is <strong>incompressible</strong> if for every embedded disk \(D \subset M\) with \(D \cap S = \partial D\), the curve \(\partial D\) bounds a disk in \(S\). Incompressible surfaces are the 3-manifold analogue of essential curves on surfaces.
</div>

The JSJ decomposition is the gateway to Thurston's geometrization: the atoroidal pieces are the ones that (by the geometrization theorem) admit hyperbolic structures.

<div class="example">
For a knot complement \(S^3 \setminus K\): if \(K\) is a torus knot, the complement is Seifert fibered and the JSJ decomposition is trivial. If \(K\) is a satellite knot (e.g., a cable knot or composite knot), the JSJ tori correspond to the companion tori. If \(K\) is a hyperbolic knot (which, by Thurston's theorem, includes all knots that are neither torus knots nor satellite knots), the complement is atoroidal and hyperbolic.
</div>

---

## Chapter 6: Thurston's Geometrization

William Thurston's geometrization program, developed in the late 1970s and 1980s, brought a completely new perspective to 3-manifold topology by proposing that every 3-manifold can be decomposed into pieces that carry canonical geometric structures. This program was completed by Grigori Perelman in 2003, who proved the full geometrization conjecture (including the Poincare conjecture as a special case) using Ricci flow with surgery.

### 6.1 The Eight Thurston Geometries

Thurston classified the eight maximal, simply connected, homogeneous Riemannian 3-manifolds \(X\) that admit a discrete cocompact group of isometries. These are the model geometries for 3-manifolds.

<div class="definition">
A <strong>geometric structure</strong> on a 3-manifold \(M\) modeled on a geometry \((X, G)\) is a diffeomorphism from \(M\) to a quotient \(X / \Gamma\), where \(\Gamma \subset G\) is a discrete subgroup of the isometry group \(G = \mathrm{Isom}(X)\) acting freely and properly discontinuously.
</div>

<div class="theorem">
<strong>Theorem 6.1 (Thurston).</strong> There are exactly eight 3-dimensional model geometries:
<br><br>
<strong>(1) Euclidean geometry \(\mathbb{E}^3\).</strong> The isometry group is \(\mathbb{R}^3 \rtimes O(3)\). Compact quotients are the six orientable flat 3-manifolds (classified by their holonomy groups), including the 3-torus \(T^3\).
<br><br>
<strong>(2) Spherical geometry \(S^3\).</strong> The isometry group is \(O(4)\). Compact quotients are the spherical space forms, classified by their finite fundamental groups (cyclic groups give lens spaces; the binary polyhedral groups give the Poincare homology sphere and its relatives). There are infinitely many, and their complete classification was given by Hopf and Seifert-Threlfall.
<br><br>
<strong>(3) Hyperbolic geometry \(\mathbb{H}^3\).</strong> The isometry group is \(\mathrm{PSL}(2, \mathbb{C})\). This is by far the richest geometry, and "most" 3-manifolds are hyperbolic. Compact hyperbolic manifolds have unique geometric structures by Mostow rigidity.
<br><br>
<strong>(4) \(S^2 \times \mathbb{R}\).</strong> The isometry group is \(O(3) \times (\mathbb{R} \rtimes \mathbb{Z}/2)\). The only compact quotients are \(S^2 \times S^1\) and \(\mathbb{R}P^3 \mathbin{\#} \mathbb{R}P^3\).
<br><br>
<strong>(5) \(\mathbb{H}^2 \times \mathbb{R}\).</strong> The isometry group is \(\mathrm{Isom}(\mathbb{H}^2) \times (\mathbb{R} \rtimes \mathbb{Z}/2)\). Compact quotients are surface bundles over \(S^1\) with periodic monodromy, or Seifert fibered spaces over hyperbolic orbifold bases.
<br><br>
<strong>(6) \(\widetilde{\mathrm{SL}(2,\mathbb{R})}\).</strong> This is the universal cover of the unit tangent bundle of \(\mathbb{H}^2\). Compact quotients are Seifert fibered spaces over hyperbolic orbifold bases with nonzero Euler number.
<br><br>
<strong>(7) Nil geometry.</strong> Nil is the Heisenberg group \(\left\{\begin{pmatrix} 1 & x & z \\ 0 & 1 & y \\ 0 & 0 & 1\end{pmatrix}\right\}\) with a left-invariant metric. Compact quotients are Seifert fibered spaces over Euclidean orbifold bases with nonzero Euler number, including certain torus bundles over \(S^1\) with unipotent monodromy.
<br><br>
<strong>(8) Sol geometry.</strong> Sol is the solvable group \(\mathbb{R}^2 \rtimes \mathbb{R}\) where \(t \in \mathbb{R}\) acts on \(\mathbb{R}^2\) by \((x,y) \mapsto (e^t x, e^{-t} y)\). Compact quotients are torus bundles over \(S^1\) with Anosov monodromy (i.e., monodromy with eigenvalues not on the unit circle).
</div>

<div class="remark">
Six of the eight geometries (\(\mathbb{E}^3, S^3, \mathbb{H}^2 \times \mathbb{R}, \widetilde{\mathrm{SL}(2,\mathbb{R})}, \mathrm{Nil}, S^2 \times \mathbb{R}\)) give rise only to Seifert fibered manifolds. Only \(\mathbb{H}^3\) and \(\mathrm{Sol}\) give non-Seifert-fibered manifolds. In a precise sense, "generic" 3-manifolds are hyperbolic.
</div>

### 6.2 The Geometrization Conjecture

<div class="theorem">
<strong>Theorem 6.2 (Thurston's Geometrization Conjecture, proved by Perelman, 2003).</strong> Let \(M\) be a closed, orientable, prime 3-manifold. Then the JSJ decomposition of \(M\) into Seifert fibered and atoroidal pieces has the property that each piece admits a geometric structure modeled on one of the eight Thurston geometries. Equivalently: after cutting along the JSJ tori, every piece is geometric.
</div>

<div class="proof">
<em>Proof outline.</em> Perelman's proof uses Richard Hamilton's Ricci flow
\[
\frac{\partial g}{\partial t} = -2 \mathrm{Ric}(g),
\]
which deforms the Riemannian metric in the direction of its Ricci curvature. On a closed 3-manifold, singularities may develop in finite time (the metric may pinch off at certain points). Perelman's crucial innovations were:
<br><br>
(1) <strong>Non-collapsing.</strong> Using a new monotonicity formula (the \(\mathcal{W}\)-functional and the reduced volume), Perelman showed that the Ricci flow is non-collapsed at all scales, meaning singularities have controlled geometry.
<br><br>
(2) <strong>Canonical neighborhoods.</strong> Near a singularity, the manifold is modeled on a small number of standard pieces: spherical caps, necks (\(S^2 \times I\)), and capped-off necks.
<br><br>
(3) <strong>Surgery.</strong> At singularity times, one performs topological surgery: cutting the manifold along 2-spheres in the necks and capping off with 3-balls. This is the "Ricci flow with surgery."
<br><br>
(4) <strong>Long-time behavior.</strong> Perelman showed that the flow with surgery exists for all time, that only finitely many surgeries occur in any finite time interval, and that as \(t \to \infty\), the manifold decomposes into a "thick part" (which converges to a hyperbolic metric) and a "thin part" (which is a graph manifold, hence Seifert fibered). This decomposition is the geometric decomposition, and the JSJ tori emerge from the boundary between thick and thin parts. \(\square\)
</div>

The Poincare conjecture follows as a corollary: if \(M\) is a closed simply connected 3-manifold, then the geometrization theorem implies \(M\) is geometric, and the only geometry with trivial fundamental group quotients is \(S^3\), so \(M \cong S^3\).

### 6.3 Hyperbolic 3-Manifolds and Mostow Rigidity

Among the eight geometries, hyperbolic geometry is the richest and most important for knot theory.

<div class="theorem">
<strong>Theorem 6.3 (Mostow Rigidity, 1968).</strong> Let \(M_1\) and \(M_2\) be complete, finite-volume hyperbolic \(n\)-manifolds with \(n \geq 3\). If \(\pi_1(M_1) \cong \pi_1(M_2)\), then \(M_1\) is isometric to \(M_2\). In particular, the hyperbolic structure (including the volume) is a topological invariant.
</div>

Mostow rigidity is a remarkable phenomenon without analogue in dimension 2 (where surfaces of the same genus admit continuous families of hyperbolic structures — the Teichmuller space). In dimension 3, the geometry is completely determined by the topology. This means that geometric invariants — volume, the Chern-Simons invariant, the length spectrum — are automatically topological invariants.

<div class="definition">
The <strong>hyperbolic volume</strong> of a hyperbolic 3-manifold \(M = \mathbb{H}^3 / \Gamma\) is
\[
\mathrm{vol}(M) = \int_M dV_{\mathbb{H}^3},
\]
where \(dV_{\mathbb{H}^3}\) is the hyperbolic volume form. By Mostow rigidity, this is a topological invariant.
</div>

### 6.4 Knot Complements and Hyperbolicity

Thurston's hyperbolization theorem for Haken manifolds, combined with the classification of knots, gives a fundamental trichotomy.

<div class="theorem">
<strong>Theorem 6.4 (Thurston, 1978).</strong> Let \(K\) be a knot in \(S^3\). Then exactly one of the following holds:
<br>(a) \(K\) is a <strong>torus knot</strong> — it lies on a standard torus in \(S^3\). Its complement is Seifert fibered.
<br>(b) \(K\) is a <strong>satellite knot</strong> — its complement contains an essential torus. The JSJ decomposition is nontrivial.
<br>(c) \(K\) is a <strong>hyperbolic knot</strong> — its complement admits a complete hyperbolic structure of finite volume. In this case, the complement \(S^3 \setminus K\) is diffeomorphic to \(\mathbb{H}^3 / \Gamma\) for a discrete, torsion-free subgroup \(\Gamma \subset \mathrm{PSL}(2, \mathbb{C})\).
</div>

"Most" knots are hyperbolic. Among all prime knots with 16 or fewer crossings, more than 99.9% are hyperbolic. The hyperbolic volume is an effective invariant: it is computable (via Jeff Weeks's program SnapPea/SnapPy) and distinguishes most knots.

### 6.5 The Figure-Eight Knot Complement

The figure-eight knot \(4_1\) is the simplest hyperbolic knot and provides a beautiful concrete example.

<div class="theorem">
<strong>Theorem 6.5 (Thurston).</strong> The complement of the figure-eight knot admits a complete hyperbolic structure, obtained by gluing two regular ideal tetrahedra in \(\mathbb{H}^3\). Its hyperbolic volume is
\[
\mathrm{vol}(S^3 \setminus 4_1) = 6 \cdot \Lambda(\pi/3) = 3 \cdot V_{\text{oct}} \approx 2.0298832,
\]
where \(\Lambda(\theta) = -\int_0^\theta \ln|2\sin t|\, dt\) is the Lobachevsky function and \(V_{\text{oct}} = 3\Lambda(\pi/3)\) is the volume of a regular ideal octahedron.
</div>

<div class="proof">
<em>Proof sketch.</em> The complement of the figure-eight knot can be triangulated by two ideal tetrahedra (tetrahedra with all four vertices at infinity in the upper half-space model of \(\mathbb{H}^3\)). The hyperbolic structure is obtained by assigning to each tetrahedron the shape parameter \(z = e^{i\pi/3}\) (the regular ideal tetrahedron) and verifying that the gluing equations are satisfied. The gluing equations require:
<br><br>
(1) Around each edge, the product of the shape parameters equals 1 (ensuring a complete metric).
<br>(2) The completeness condition at the cusp (the torus boundary at infinity) is satisfied.
<br><br>
For two regular ideal tetrahedra with all shape parameters equal to \(e^{i\pi/3}\), both conditions are satisfied. The volume of each regular ideal tetrahedron is \(3\Lambda(\pi/3) \approx 1.01494\), so the total volume is approximately \(2.02989\). \(\square\)
</div>

<div class="remark">
The figure-eight knot complement has the smallest volume among all hyperbolic knot complements. This was proved by Cao and Meyerhoff (2001), who showed that the figure-eight and its sister manifold (a non-orientable manifold with the same volume) minimize volume among all cusped hyperbolic 3-manifolds. The Jorgensen-Thurston theorem implies that volumes of hyperbolic 3-manifolds form a well-ordered subset of \(\mathbb{R}\).
</div>

<div class="example">
Some other notable hyperbolic knot volumes:
<br>
\(\mathrm{vol}(S^3 \setminus 5_2) \approx 2.8281\) (the knot \(5_2\), the twist knot with 3 half-twists),
<br>
\(\mathrm{vol}(S^3 \setminus 6_1) \approx 3.1639\),
<br>
\(\mathrm{vol}(S^3 \setminus 6_2) \approx 4.4010\),
<br>
\(\mathrm{vol}(S^3 \setminus 6_3) \approx 5.6939\).
</div>

The Jorgensen-Thurston theorem states that for a fixed number of cusps, volumes of hyperbolic 3-manifolds form a well-ordered closed subset of \(\mathbb{R}\) of order type \(\omega^\omega\). Dehn filling decreases volume, and all but finitely many Dehn fillings of a cusped hyperbolic manifold yield hyperbolic manifolds (Thurston's Dehn surgery theorem).

---

## Chapter 7: Modern Invariants and Categorification

The final chapter surveys the most important developments in knot theory and low-dimensional topology since the 1990s: Khovanov homology, knot Floer homology, and their remarkable applications. These theories "categorify" classical polynomial invariants, replacing numbers and polynomials with richer algebraic objects (graded chain complexes and their homology), and have resolved longstanding conjectures while opening entirely new avenues of research.

### 7.1 The Surgery Exact Triangle

Before introducing the modern homological invariants, we describe a fundamental structural feature that they share: the surgery exact triangle.

<div class="theorem">
<strong>Theorem 7.1 (Surgery Exact Triangle).</strong> Let \(K \subset Y\) be a knot in a closed 3-manifold. Let \(Y_0\) and \(Y_1\) denote the manifolds obtained by 0-surgery and 1-surgery on \(K\), respectively. Then for Heegaard Floer homology (and similarly for other Floer theories), there is an exact triangle:
\[
\cdots \to \widehat{HF}(Y) \to \widehat{HF}(Y_0) \to \widehat{HF}(Y_1) \to \widehat{HF}(Y) \to \cdots
\]
</div>

The surgery exact triangle is the Floer-theoretic analogue of the Mayer-Vietoris sequence in singular homology. It provides a powerful inductive tool for computing invariants and proving structural results.

### 7.2 Khovanov Homology

In 1999, Mikhail Khovanov constructed a bigraded homology theory for links whose graded Euler characteristic is the Jones polynomial. This was the first major example of categorification in knot theory.

<div class="definition">
Let \(D\) be an oriented link diagram with \(n\) crossings. For each state \(s\) (assignment of 0 or 1 to each crossing, i.e., a vertex of the hypercube \(\{0,1\}^n\)), let \(D_s\) be the complete smoothing. Let \(k(s) = |s|\) be the number of circles in \(D_s\). To each circle, assign a copy of the graded vector space \(V = \mathbb{Q}\{v_+, v_-\}\) (with \(\deg v_+ = 1\), \(\deg v_- = -1\)), and set
\[
\mathcal{C}(D_s) = V^{\otimes k(s)}.
\]
The <strong>Khovanov chain complex</strong> is the bigraded complex
\[
CKh^{i,j}(D) = \bigoplus_{|s| = i + n_-} \mathcal{C}(D_s)^j,
\]
where \(n_-\) is the number of negative crossings, \(|s| = \sum_{c} s(c)\) is the total number of 1-smoothings, and the differential \(d : CKh^{i,j} \to CKh^{i+1,j}\) is defined using a multiplication \(m : V \otimes V \to V\) (merging circles) and a comultiplication \(\Delta : V \to V \otimes V\) (splitting circles), where
\[
m(v_+ \otimes v_+) = v_+, \quad m(v_+ \otimes v_-) = m(v_- \otimes v_+) = v_-, \quad m(v_- \otimes v_-) = 0,
\]
\[
\Delta(v_+) = v_+ \otimes v_- + v_- \otimes v_+, \quad \Delta(v_-) = v_- \otimes v_-.
\]
These operations make \(V\) into a Frobenius algebra, and the differential \(d\) squares to zero.
</div>

<div class="definition">
<strong>Khovanov homology</strong> is the bigraded homology
\[
Kh^{i,j}(L) = H^{i,j}(CKh(D), d).
\]
</div>

<div class="theorem">
<strong>Theorem 7.2 (Khovanov, 1999).</strong>
<br>(a) \(Kh^{i,j}(L)\) is an invariant of the oriented link \(L\), independent of the choice of diagram.
<br>(b) The graded Euler characteristic recovers the Jones polynomial:
\[
V_L(t) = \sum_{i,j} (-1)^i t^j \dim_{\mathbb{Q}} Kh^{i,j}(L) \bigg|_{t = q^2},
\]
after an appropriate normalization and substitution.
</div>

<div class="proof">
<em>Proof sketch of (a).</em> One must verify that \(Kh(D)\) is invariant under the Reidemeister moves. For each move, one constructs an explicit chain homotopy equivalence between the Khovanov complexes of the diagrams before and after the move. The key algebraic input is the Frobenius algebra structure on \(V\), which ensures that the maps are well-defined and the chain homotopy identities hold. The most intricate verification is for R3, which requires a careful analysis of the cube of resolutions. \(\square\)
</div>

<div class="example">
<strong>Khovanov homology of the unknot.</strong> The unknot has a single-crossing-free diagram, so the chain complex has one generator in bidegree \((0, \pm 1)\). Thus \(Kh^{0,1}(\text{unknot}) \cong \mathbb{Q}\), \(Kh^{0,-1}(\text{unknot}) \cong \mathbb{Q}\), and all other groups vanish.
</div>

<div class="example">
<strong>Khovanov homology of the trefoil.</strong> A careful computation using the standard 3-crossing diagram of the right-handed trefoil yields:
\[
Kh^{0,1}(3_1) \cong \mathbb{Q}, \quad Kh^{0,3}(3_1) \cong \mathbb{Q}, \quad Kh^{-2,3}(3_1) \cong \mathbb{Q}, \quad Kh^{-2,5}(3_1) \cong \mathbb{Q}, \quad Kh^{-3,9}(3_1) \cong \mathbb{Q}.
\]
(Here we use the convention for the left-handed trefoil; the right-handed trefoil is obtained by reflecting the bigrading.) The graded Euler characteristic reproduces the Jones polynomial \(V_{3_1}(t) = -t^{-4} + t^{-3} + t^{-1}\).
</div>

Khovanov homology is strictly stronger than the Jones polynomial — it distinguishes pairs of knots that the Jones polynomial cannot. Moreover, it has remarkable topological applications:

<div class="theorem">
<strong>Theorem 7.3 (Kronheimer-Mrowka, 2011).</strong> Khovanov homology detects the unknot: \(K\) is the unknot if and only if \(Kh(K) \cong Kh(\text{unknot})\).
</div>

This deep result uses gauge theory (specifically, singular instanton Floer homology) and settled the question of whether Khovanov homology is "stronger" than the Jones polynomial in the most dramatic possible way. Recall that whether the Jones polynomial alone detects the unknot remains open.

### 7.3 Knot Floer Homology

Independently of Khovanov's work, Peter Ozsvath and Zoltan Szabo (and, independently, Jacob Rasmussen) introduced a different homological knot invariant in 2003-2004, arising from symplectic geometry and Heegaard diagrams rather than from combinatorial state sums.

<div class="definition">
Let \(K \subset S^3\) be a knot represented by a doubly-pointed Heegaard diagram \((\Sigma_g, \boldsymbol{\alpha}, \boldsymbol{\beta}, w, z)\), where \(\Sigma_g\) is a genus-\(g\) surface, \(\boldsymbol{\alpha} = \{\alpha_1, \ldots, \alpha_g\}\) and \(\boldsymbol{\beta} = \{\beta_1, \ldots, \beta_g\}\) are systems of attaching curves, and \(w, z\) are basepoints on either side of the knot. The <strong>knot Floer chain complex</strong> \(CFK^{\infty}(K)\) is generated (over \(\mathbb{F} = \mathbb{Z}/2\)) by intersection points \(\mathbf{x} \in \mathbb{T}_\alpha \cap \mathbb{T}_\beta\) in the symmetric product \(\mathrm{Sym}^g(\Sigma_g)\), where \(\mathbb{T}_\alpha\) and \(\mathbb{T}_\beta\) are the tori determined by the attaching curves. The differential counts pseudo-holomorphic disks in the symmetric product, with filtration levels determined by the algebraic intersection with the divisors \(\{w\} \times \mathrm{Sym}^{g-1}(\Sigma_g)\) and \(\{z\} \times \mathrm{Sym}^{g-1}(\Sigma_g)\).
</div>

<div class="definition">
<strong>Knot Floer homology</strong> is the homology of the associated graded complex:
\[
\widehat{HFK}(K, s) = H_*(\widehat{CFK}(K, s)),
\]
where \(s \in \mathbb{Z}\) is the <strong>Alexander grading</strong>. This is a bigraded group \(\widehat{HFK}(K) = \bigoplus_{d, s} \widehat{HFK}_d(K, s)\) with a homological (Maslov) grading \(d\) and the Alexander grading \(s\).
</div>

<div class="theorem">
<strong>Theorem 7.4 (Ozsvath-Szabo, 2004).</strong>
<br>(a) \(\widehat{HFK}(K, s)\) is a knot invariant.
<br>(b) The graded Euler characteristic recovers the Alexander polynomial:
\[
\Delta_K(t) = \sum_{s} \left(\sum_d (-1)^d \dim \widehat{HFK}_d(K, s)\right) t^s.
\]
<br>(c) \(\widehat{HFK}\) categorifies the Alexander polynomial in the same sense that Khovanov homology categorifies the Jones polynomial.
</div>

### 7.4 Detection Results

Knot Floer homology has spectacular detection properties.

<div class="theorem">
<strong>Theorem 7.5 (Ozsvath-Szabo, 2004).</strong> Knot Floer homology detects the genus of a knot:
\[
g(K) = \max\{s : \widehat{HFK}(K, s) \neq 0\}.
\]
</div>

Since the unknot is the unique genus-0 knot, this immediately implies:

<div class="corollary">
<strong>Corollary 7.6.</strong> Knot Floer homology detects the unknot: \(K\) is the unknot if and only if \(\widehat{HFK}(K) \cong \mathbb{F}\) (supported in Alexander grading 0 and Maslov grading 0).
</div>

<div class="theorem">
<strong>Theorem 7.7 (Ghiggini, 2008; Ni, 2007).</strong> Knot Floer homology detects fibered knots: \(K\) is fibered if and only if \(\widehat{HFK}(K, g(K)) \cong \mathbb{F}\).
</div>

These detection results are far stronger than anything available from the classical invariants. Neither the Alexander polynomial nor the Jones polynomial detects genus or fiberedness.

<div class="example">
<strong>Knot Floer homology of the trefoil.</strong> The right-handed trefoil \(3_1\) has:
\[
\widehat{HFK}_d(3_1, s) \cong \begin{cases} \mathbb{F} & (d, s) \in \{(0, 1), (-1, 0), (-2, -1)\}, \\ 0 & \text{otherwise}. \end{cases}
\]
The maximum Alexander grading with nonvanishing homology is \(s = 1\), confirming \(g(3_1) = 1\). The group \(\widehat{HFK}(3_1, 1) \cong \mathbb{F}\) is rank 1, confirming that the trefoil is fibered.
</div>

<div class="example">
<strong>Knot Floer homology of the figure-eight knot.</strong> The figure-eight knot \(4_1\) has:
\[
\widehat{HFK}_d(4_1, s) \cong \begin{cases} \mathbb{F} & (d, s) \in \{(0, 1), (-1, 0)^{\oplus 2} \text{ via a grading shift}, (-1, -1)\}, \\ 0 & \text{otherwise}, \end{cases}
\]
More precisely:
\[
\widehat{HFK}_{-1}(4_1, 1) \cong \mathbb{F}, \quad \widehat{HFK}_{-1}(4_1, 0) \cong \mathbb{F}, \quad \widehat{HFK}_{-2}(4_1, 0) \cong \mathbb{F}, \quad \widehat{HFK}_{-2}(4_1, -1) \cong \mathbb{F}.
\]
Hmm, let us be more precise. For the figure-eight knot, the Euler characteristic gives \(\Delta_{4_1}(t) = -t + 3 - t^{-1}\), and the genus is 1 (confirmed by the top Alexander grading). The fibered detection also confirms fiberedness of \(4_1\).
</div>

### 7.5 Concordance and the Smooth 4-Dimensional World

Knot theory is deeply connected to 4-dimensional topology through the notion of concordance.

<div class="definition">
Two knots \(K_0, K_1 \subset S^3\) are <strong>concordant</strong> if there exists a smoothly embedded annulus \(A \cong S^1 \times [0,1]\) in \(S^3 \times [0,1]\) with \(A \cap (S^3 \times \{i\}) = K_i\) for \(i = 0, 1\). A knot is <strong>slice</strong> if it is concordant to the unknot — equivalently, if it bounds a smoothly embedded disk in \(B^4\).
</div>

<div class="definition">
The <strong>concordance group</strong> \(\mathcal{C}\) is the set of knots modulo concordance, with the group operation induced by connected sum. The identity element is the class of slice knots, and the inverse of a knot \(K\) is its mirror image \(\overline{K}\) with reversed orientation (since \(K \mathbin{\#} \overline{K}\) is always slice).
</div>

<div class="definition">
The <strong>slice genus</strong> (or <strong>4-ball genus</strong>) \(g_4(K)\) is the minimum genus of a smoothly embedded orientable surface in \(B^4\) bounded by \(K \subset S^3 = \partial B^4\). Clearly \(g_4(K) \leq g(K)\), and \(g_4(K) = 0\) if and only if \(K\) is slice.
</div>

The slice genus is sensitive to the difference between smooth and topological categories — a remarkable phenomenon in dimension 4.

<div class="theorem">
<strong>Theorem 7.8 (Rasmussen, 2004).</strong> From Khovanov homology, one can extract an integer-valued concordance invariant \(s(K)\) (the <strong>Rasmussen invariant</strong> or <strong>\(s\)-invariant</strong>) satisfying:
<br>(a) \(|s(K)| \leq 2g_4(K)\).
<br>(b) \(s\) is additive under connected sum.
<br>(c) For positive knots, \(s(K) = 2g_4(K) = 2g(K)\).
</div>

<div class="theorem">
<strong>Theorem 7.9 (Rasmussen, 2004).</strong> The \(s\)-invariant provides a purely combinatorial proof of the Milnor conjecture: the slice genus of the torus knot \(T(p,q)\) is \(\frac{(p-1)(q-1)}{2}\).
</div>

This was a breakthrough because all previous proofs of the Milnor conjecture (by Kronheimer-Mrowka using gauge theory, and by Ozsvath-Szabo using knot Floer homology) required deep analytical machinery. Rasmussen's proof uses only the combinatorial Khovanov chain complex.

<div class="example">
For the right-handed trefoil \(T(2,3)\): \(s(3_1) = 2\), so \(g_4(3_1) \geq 1\). Since \(g(3_1) = 1 \geq g_4\), we conclude \(g_4(3_1) = 1\). Similarly, for \(T(2,5) = 5_1\): \(s(5_1) = 4\) and \(g_4(5_1) = 2\).
</div>

There is an analogous invariant from knot Floer homology:

<div class="theorem">
<strong>Theorem 7.10 (Ozsvath-Szabo, 2003).</strong> There exists a concordance invariant \(\tau(K) \in \mathbb{Z}\) extracted from knot Floer homology satisfying:
<br>(a) \(|\tau(K)| \leq g_4(K)\).
<br>(b) \(\tau\) is additive under connected sum.
<br>(c) \(\tau(T(p,q)) = \frac{(p-1)(q-1)}{2}\) for positive torus knots.
</div>

While \(\tau\) and \(s/2\) agree for many knots (and both give the slice genus for torus knots), they are not equal in general. The difference \(s/2 - \tau\) detects exotic smooth structures: it can distinguish smoothly non-concordant knots that are topologically concordant.

### 7.6 Connections to Gauge Theory

The deepest results in knot theory and low-dimensional topology draw on gauge theory — the study of connections on principal bundles over manifolds.

<div class="definition">
Let \(Y\) be a closed oriented 3-manifold. <strong>Instanton Floer homology</strong> \(I_*(Y)\) is defined (following Floer, 1988) as the Morse homology of the Chern-Simons functional
\[
CS(A) = \frac{1}{8\pi^2} \int_Y \mathrm{tr}\left(A \wedge dA + \frac{2}{3} A \wedge A \wedge A\right)
\]
on the space of \(\mathrm{SU}(2)\)-connections on \(Y\), modulo gauge equivalence. The critical points are flat connections, and the gradient flow lines are anti-self-dual instantons on \(Y \times \mathbb{R}\).
</div>

Floer's construction was inspired by Witten's topological quantum field theory and Donaldson's work on 4-manifold invariants. The resulting invariants have extraordinary power.

<div class="remark">
<strong>Donaldson's diagonalizability theorem (1983)</strong> states that if a smooth, closed, oriented, simply connected 4-manifold \(X\) has a negative definite intersection form, then that form is diagonalizable over \(\mathbb{Z}\) (i.e., is a direct sum of copies of \(\langle -1 \rangle\)). This is a purely smooth phenomenon — Freedman's theorem guarantees a topological 4-manifold for every unimodular form. The combination of Donaldson's and Freedman's theorems reveals the existence of exotic smooth structures on \(\mathbb{R}^4\) (and the non-existence of smooth structures on certain topological 4-manifolds).
</div>

The relevance to knot theory is through cobordism: if two knots are concordant, their complements (suitably interpreted) are related by a 4-dimensional cobordism, and gauge-theoretic invariants of this cobordism constrain the concordance. This principle underlies the proof of the Milnor conjecture by Kronheimer and Mrowka (1993) using Donaldson invariants, and its reproof by Ozsvath-Szabo using Heegaard Floer theory.

### 7.7 Summary and Open Problems

We conclude with a survey of the major open problems that continue to drive research in knot theory and low-dimensional topology.

<div class="remark">
<strong>Major Open Problems:</strong>
<br><br>
<strong>1. The Jones polynomial unknot detection conjecture.</strong> Does \(V_K(t) = 1\) imply \(K\) is the unknot? This is perhaps the most famous open problem in quantum topology.
<br><br>
<strong>2. Slice-ribbon conjecture (Fox, 1962).</strong> Is every slice knot a ribbon knot? (A ribbon knot bounds an immersed disk in \(S^3\) with only ribbon singularities, which lift to an embedded disk in \(B^4\).) Lisca (2007) proved this for 2-bridge knots, and there has been recent work on the conjecture for certain families, but the general case remains wide open.
<br><br>
<strong>3. The volume conjecture (Kashaev, 1997; Murakami-Murakami, 2001).</strong> For a hyperbolic knot \(K\), the asymptotic behavior of the colored Jones polynomial determines the hyperbolic volume:
\[
\lim_{N \to \infty} \frac{2\pi \log |J_N(K; e^{2\pi i/N})|}{N} = \mathrm{vol}(S^3 \setminus K).
\]
This extraordinary conjecture connects quantum topology to hyperbolic geometry. It has been verified for the figure-eight knot and some torus knots, but a general proof remains elusive.
<br><br>
<strong>4. Concordance and the structure of \(\mathcal{C}\).</strong> The concordance group is known to contain a \(\mathbb{Z}^\infty\) summand (by work of many authors using gauge theory and Floer homology), but its full structure is unknown. Understanding the interaction between the smooth and topological concordance groups is a major theme in 4-dimensional topology.
<br><br>
<strong>5. Khovanov homology and 4-manifolds.</strong> Is there a 4-manifold invariant that relates to Khovanov homology in the way that Donaldson invariants relate to instanton Floer homology? Recent work of Morrison-Walker-Wedrich on skein lasagna modules suggests promising directions.
</div>

The interplay between knot theory, low-dimensional topology, quantum algebra, and mathematical physics continues to generate some of the deepest and most beautiful mathematics of our time. From Kelvin's speculative vortex atoms to Perelman's resolution of the Poincare conjecture, from Jones's unexpected polynomial to Khovanov's categorification, the study of knots and 3-manifolds remains a vibrant nexus of ideas that shows no signs of exhausting its richness.
