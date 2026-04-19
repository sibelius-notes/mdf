---
title: "PMATH 950: Riemann Surfaces"
subjects: PMATH
prof: "Ruxandra Moraru"
---

## Sources and References

- Forster, Otto. *Lectures on Riemann Surfaces*. GTM 81 (Springer-Verlag, 1991).
- Miranda, Rick. *Algebraic Curves and Riemann Surfaces*. GSM 5 (AMS, 1995).
- Jost, Jürgen. *Compact Riemann Surfaces*. Universitext (Springer-Verlag, 2006).
- Farkas, Hershel M. & Kra, Irwin. *Riemann Surfaces*, 2nd ed. GTM 71 (Springer-Verlag, 1992).
- Griffiths, Phillip & Harris, Joseph. *Principles of Algebraic Geometry* (Wiley, 1994).
- Gunning, Robert C. *Lectures on Riemann Surfaces: Jacobi Varieties*. Math. Notes 12 (Princeton University Press, 1972).

---

# Chapter 1: Riemann Surfaces and Holomorphic Functions

A Riemann surface is a one-dimensional complex manifold—that is, a connected Hausdorff topological space covered by open sets homeomorphic to the complex plane, with transition functions that are biholomorphic. This definition brings together topology, complex analysis, and geometry, revealing deep connections between the local behaviour of holomorphic functions and global topological properties.

<div class="definition">
<strong>Riemann Surface:</strong> A Riemann surface is a connected Hausdorff space \(X\) equipped with a collection of open sets \(\{U_i\}_{i \in I}\) and homeomorphisms \(\phi_i : U_i \to V_i \subset \mathbb{C}\) such that whenever \(U_i \cap U_j \neq \emptyset\), the transition function \(\phi_j \circ \phi_i^{-1} : \phi_i(U_i \cap U_j) \to \phi_j(U_i \cap U_j)\) is biholomorphic.
</div>

The fundamental insight is that holomorphic functions on \(\mathbb{C}\) become multi-valued when we try to extend them globally. For instance, the logarithm \(\log z\) or the square root \(\sqrt{z}\) are only single-valued locally. A Riemann surface provides the natural domain on which such multi-valued functions become single-valued.

<div class="example">
<strong>The Riemann Sphere:</strong> The extended complex plane \(\mathbb{C} \cup \{\infty\}\), denoted \(\mathbb{P}^1(\mathbb{C})\) or \(\hat{\mathbb{C}}\), is a compact Riemann surface. We cover it with two charts: \(U_0 = \mathbb{C}\) with identity map \(\phi_0(z) = z\), and \(U_\infty = \mathbb{C}^* \cup \{\infty\}\) with \(\phi_\infty(z) = 1/z\) for \(z \neq 0\) and \(\phi_\infty(\infty) = 0\). On the overlap, the transition function is \(w \mapsto 1/w\), which is biholomorphic on \(\mathbb{C}^*\).
</div>

<div class="example">
<strong>The Upper Half-Plane:</strong> The upper half-plane \(\mathbb{H} = \{z \in \mathbb{C} : \mathrm{Im}(z) > 0\}\) is a non-compact Riemann surface with a single chart given by the identity map. It is biholomorphic to the unit disk via the Möbius transformation \(z \mapsto (z - i)/(z + i)\).
</div>

A holomorphic function \(f : X \to Y\) between Riemann surfaces is a continuous map such that in local coordinates it is holomorphic. More precisely, for every \(p \in X\), if \((U, \phi)\) and \((V, \psi)\) are charts around \(p\) and \(f(p)\) respectively, then \(\psi \circ f \circ \phi^{-1}\) is holomorphic in a neighbourhood of \(\phi(p)\).

<div class="remark">
<strong>Conformal Structure:</strong> A Riemann surface carries a conformal structure—a notion of angle-preserving map. Holomorphic maps are precisely those that preserve this conformal structure. This makes the category of Riemann surfaces very rigid: a non-constant holomorphic map between compact Riemann surfaces is automatically an open map, and holomorphic endomorphisms of \(\mathbb{P}^1(\mathbb{C})\) are Möbius transformations.
</div>

# Chapter 2: Examples and Algebraic Curves

Riemann surfaces arise naturally as algebraic curves over \(\mathbb{C}\). A non-singular projective algebraic curve—that is, a smooth irreducible curve in projective space \(\mathbb{P}^n(\mathbb{C})\)—is a compact Riemann surface. Conversely, by the GAGA principle (Grothendieck), every compact Riemann surface can be realized as an algebraic curve.

<div class="example">
<strong>Projective Line:</strong> The curve \(\mathbb{P}^1(\mathbb{C})\) is the Riemann sphere, as discussed above.
</div>

<div class="example">
<strong>Smooth Plane Curves:</strong> Consider the affine curve \(y^2 = x^3 - x\) in \(\mathbb{C}^2\). To compactify, we homogenize: \(Y^2 Z = X^3 - XZ^2\) in projective coordinates \([X : Y : Z]\). The point at infinity is \([1 : 1 : 0]\), which is a smooth point (verify by checking that the gradient does not vanish). The projective curve is a smooth compact Riemann surface of genus \(1\)—an elliptic curve.
</div>

<div class="example">
<strong>Hyperelliptic Curves:</strong> A curve of the form \(y^2 = P(x)\) where \(P(x)\) is a polynomial of degree \(2g+1\) or \(2g+2\) with distinct roots gives a hyperelliptic curve of genus \(g\). These provide explicit examples of Riemann surfaces of higher genus.
</div>

<div class="example">
<strong>Fermat Curves:</strong> The curve \(x^n + y^n = z^n\) in \(\mathbb{P}^2(\mathbb{C})\) for \(n \geq 3\) is smooth and compact, with genus \((n-1)(n-2)/2\).
</div>

The genus of a smooth projective curve—equivalently, of a compact connected Riemann surface without boundary—is a topological invariant. A curve of genus \(g\) has Euler characteristic \(\chi = 2 - 2g\). The genus measures the "holes" or handles in the surface: genus \(0\) surfaces are topologically spheres, genus \(1\) surfaces are topologically tori, and higher genus surfaces have more complex topology.

<div class="remark">
<strong>Classification by Genus:</strong> Riemann surfaces are classified up to biholomorphism by their topological type (compact vs. non-compact, with or without boundary) and genus. Compact orientable surfaces of genus \(g\) are in bijection with isomorphism classes of hyperelliptic curves for \(g \geq 1\), and more generally with isomorphism classes of smooth projective curves.
</div>

# Chapter 3: Holomorphic Maps and Proper Maps

A non-constant holomorphic map between Riemann surfaces is an open map by the open mapping theorem. For compact source, a holomorphic map is proper, meaning the preimage of compact sets is compact.

<div class="theorem">
<strong>Degree of a Holomorphic Map:</strong> Let \(f : X \to Y\) be a non-constant holomorphic map between compact connected Riemann surfaces. There exists a positive integer \(d\), the degree of \(f\), such that for all but finitely many \(y \in Y\), the fibre \(f^{-1}(y)\) consists of exactly \(d\) points (counted with multiplicity). Moreover, \(\chi(X) = d \cdot \chi(Y)\), so \(2 - 2g_X = d(2 - 2g_Y)\).
</div>

This formula severely restricts possible maps between surfaces of different genera. For instance, there are no non-constant holomorphic maps from a genus \(2\) surface to a genus \(0\) surface.

<div class="example">
<strong>Covering Maps:</strong> A holomorphic map \(f : X \to Y\) is an unramified covering if it is locally a homeomorphism everywhere. If \(X\) is compact and \(Y\) is connected, then \(f\) is a covering map in the topological sense: for every \(y \in Y\), the points in \(f^{-1}(y)\) are isolated and have a common neighbourhood that maps homeomorphically to a neighbourhood of \(y\).
</div>

<div class="remark">
<strong>Branching and Ramification:</strong> Points where \(f'(p) = 0\) are called ramification points. At such a point, \(f\) fails to be a local homeomorphism; instead, it wraps a neighbourhood of \(p\) around a neighbourhood of \(f(p)\) with multiplicity greater than \(1\). The ramification index \(e_p\) at \(p\) is the order of vanishing of \(f - f(p)\) in local coordinates.
</div>

# Chapter 4: Elliptic Functions and Elliptic Curves

Elliptic functions are doubly periodic meromorphic functions on \(\mathbb{C}\)—that is, functions satisfying \(f(z + \omega_1) = f(z + \omega_2) = f(z)\) for two \(\mathbb{R}\)-linearly independent complex numbers \(\omega_1\) and \(\omega_2\).

<div class="definition">
<strong>Lattice and Fundamental Domain:</strong> A lattice in \(\mathbb{C}\) is a discrete subgroup of rank \(2\), generated by two \(\mathbb{R}\)-linearly independent elements. The fundamental domain is a parallelogram with vertices at \(0\), \(\omega_1\), \(\omega_2\), and \(\omega_1 + \omega_2\). A doubly periodic function is constant on translates by the lattice, so it descends to a function on the torus \(\mathbb{C} / \Lambda\).
</div>

<div class="theorem">
<strong>Weierstrass \(\wp\)-function:</strong> For a lattice \(\Lambda = \mathbb{Z} \omega_1 + \mathbb{Z} \omega_2\), the Weierstrass \(\wp\)-function is defined by
\[\wp(z) = \frac{1}{z^2} + \sum_{\omega \in \Lambda \setminus \{0\}} \left( \frac{1}{(z - \omega)^2} - \frac{1}{\omega^2} \right).\]
This is a meromorphic doubly periodic function with a double pole at lattice points and is holomorphic elsewhere. Its derivative \(\wp'(z)\) is also doubly periodic, and they satisfy the differential equation
\[(\wp'(z))^2 = 4(\wp(z))^3 - g_2(\Lambda) \wp(z) - g_3(\Lambda),\]
where \(g_2\) and \(g_3\) are invariants depending only on the lattice.
</div>

An elliptic curve is an isomorphism class of smooth projective curves of genus \(1\) with a specified basepoint. Equivalently, it is a torus \(\mathbb{C} / \Lambda\) viewed as a Riemann surface. The map \(\mathbb{C} / \Lambda \to \mathbb{P}^2(\mathbb{C})\) given by \(z \mapsto [\wp(z) : \wp'(z) : 1]\) (away from the basepoint) realizes the elliptic curve as a smooth cubic curve.

<div class="remark">
<strong>Modular Parameter:</strong> Up to biholomorphism, a lattice is determined by the ratio \(\tau = \omega_2 / \omega_1\), which we may assume lies in the upper half-plane \(\mathbb{H}\). Two lattices with parameters \(\tau\) and \(\tau'\) are isomorphic if and only if \(\tau' = \frac{a\tau + b}{c\tau + d}\) for some \(\begin{pmatrix} a & b \\ c & d \end{pmatrix} \in \mathrm{SL}_2(\mathbb{Z})\). The quotient \(\mathbb{H} / \mathrm{SL}_2(\mathbb{Z})\) parametrizes isomorphism classes of elliptic curves.
</div>

# Chapter 5: Sheaves and Analytic Continuation

A sheaf on a topological space \(X\) is a functor from the category of open sets to abelian groups (or modules) that respects restrictions and gluing. For Riemann surfaces, the most important sheaves are the structure sheaf \(\mathcal{O}\) of holomorphic functions and sheaves of holomorphic sections.

<div class="definition">
<strong>Structure Sheaf:</strong> The structure sheaf \(\mathcal{O}_X\) assigns to each open set \(U \subseteq X\) the ring \(\mathcal{O}(U)\) of holomorphic functions on \(U\). Restriction maps are restrictions of functions.
</div>

<div class="definition">
<strong>Analytic Continuation:</strong> Two holomorphic functions \(f_1\) and \(f_2\) on connected open sets \(U_1\) and \(U_2\) are called analytic continuations of each other if \(U_1 \cap U_2 \neq \emptyset\) and they agree on \(U_1 \cap U_2\). An analytic continuation of a function \(f\) along a path is a collection of functions on disks covering the path that are pairwise consistent on overlaps.
</div>

<div class="theorem">
<strong>Identity Theorem:</strong> If two holomorphic functions on a connected open set agree on an open subset, they are equal everywhere. This follows from the fact that the zero set of a non-zero holomorphic function has empty interior.
</div>

The notion of analytic continuation motivates the construction of Riemann surfaces. A complete analytic function is an equivalence class of germs of holomorphic functions related by analytic continuation. The Riemann surface of a multi-valued function such as \(\sqrt{z}\) or \(\log z\) is the surface formed by gluing together all possible analytic continuations.

<div class="remark">
<strong>Monodromy and Single-Valuedness:</strong> When we analytically continue a holomorphic function around a closed loop, we may return to a different branch—a phenomenon called monodromy. On the corresponding Riemann surface, the function becomes single-valued because different branches are identified with different points on the surface.
</div>

# Chapter 6: Covering Spaces, Monodromy, and Riemann Existence

The theory of coverings is central to understanding Riemann surfaces. A covering map \(p : \tilde{X} \to X\) between Riemann surfaces is a holomorphic map such that every point \(x \in X\) has a neighbourhood \(U\) with \(p^{-1}(U)\) a disjoint union of open sets, each mapping homeomorphically to \(U\).

<div class="theorem">
<strong>Universal Cover:</strong> Every Riemann surface admits a simply connected covering space, called its universal cover. The universal cover is unique up to isomorphism.
</div>

<div class="example">
<strong>Examples of Universal Covers:</strong>
\begin{enumerate}
\item The universal cover of \(\mathbb{P}^1(\mathbb{C})\) is itself (it is simply connected).
\item The universal cover of \(\mathbb{C}^*\) is \(\mathbb{C}\), via the exponential map \(\exp : \mathbb{C} \to \mathbb{C}^*\).
\item The universal cover of a torus \(\mathbb{C}/\Lambda\) is \(\mathbb{C}\), via the projection map.
\item The universal cover of a compact Riemann surface of genus \(g \geq 2\) is the upper half-plane \(\mathbb{H}\), by the Uniformization Theorem.
\end{enumerate}
</div>

<div class="theorem">
<strong>Riemann Existence Theorem:</strong> Let \(X\) be a connected Riemann surface and \(\pi_1(X)\) its fundamental group. Covering spaces of \(X\) correspond bijectively to conjugacy classes of subgroups of \(\pi_1(X)\). Under this correspondence, connected coverings correspond to subgroups, and Galois coverings (where the group of covering transformations acts transitively on fibres) correspond to normal subgroups.
</div>

The monodromy representation is a homomorphism \(\rho : \pi_1(X, x_0) \to \mathrm{Aut}(\mathbb{C}^n)\) or more generally to the automorphism group of a vector space or sheaf. It encodes how parallel transport (or analytic continuation) of sections behaves around loops.

<div class="remark">
<strong>Galois Correspondence:</strong> There is a Galois-type correspondence between covering spaces of a Riemann surface and subgroups of its fundamental group, analogous to the Galois correspondence in field theory. This provides a bridge between topology and algebraic geometry.
</div>

# Chapter 7: Holomorphic and Meromorphic Differentials

Differential forms on a Riemann surface are sections of the cotangent bundle or exterior power thereof. A holomorphic \(1\)-form is a \(1\)-form that is holomorphic in local coordinates.

<div class="definition">
<strong>Holomorphic \(1\)-form:</strong> A holomorphic \(1\)-form (or differential) on a Riemann surface \(X\) is a section of the cotangent bundle such that in local coordinates \(z\), it has the form \(\omega = f(z) \, dz\) where \(f\) is holomorphic.
</div>

<div class="definition">
<strong>Meromorphic \(1\)-form:</strong> A meromorphic \(1\)-form is a section that is meromorphic in local coordinates, i.e., in local coordinates \(\omega = f(z) \, dz\) where \(f\) is meromorphic.
</div>

On a compact Riemann surface of genus \(g\), the space of holomorphic \(1\)-forms is a \(g\)-dimensional vector space over \(\mathbb{C}\).

<div class="theorem">
<strong>Residue Theorem:</strong> If \(\omega\) is a meromorphic \(1\)-form on a compact Riemann surface and \(C\) is a closed curve, then
\[\int_C \omega = 2\pi i \sum_p \mathrm{Res}_p(\omega),\]
where the sum is over all poles of \(\omega\) with multiplicities. For a global meromorphic form on a compact surface, the sum of residues is zero.
</div>

<div class="remark">
<strong>Canonical Bundle:</strong> The canonical bundle \(K_X\) is the determinant of the cotangent bundle. For a compact Riemann surface of genus \(g\), \(K_X\) is a line bundle of degree \(2g - 2\).
</div>

# Chapter 8: de Rham and Dolbeault Cohomology

Cohomology theories on Riemann surfaces measure "holes" and obstructions to solving equations like \(d\omega = 0\).

<div class="definition">
<strong>de Rham Cohomology:</strong> The de Rham complex is the sequence of exterior derivative operators
\[0 \to \mathcal{O}(X) \xrightarrow{d} \Omega^1(X) \xrightarrow{d} \Omega^2(X) \to 0,\]
where \(\Omega^k(X)\) denotes the space of smooth \(k\)-forms. The de Rham cohomology groups are
\[H^k_{\mathrm{dR}}(X) = \frac{\ker(d : \Omega^k \to \Omega^{k+1})}{\mathrm{im}(d : \Omega^{k-1} \to \Omega^k)}.\]
</div>

<div class="theorem">
<strong>de Rham Theorem:</strong> The de Rham cohomology groups are isomorphic to the singular cohomology groups with real coefficients. For a compact Riemann surface of genus \(g\), we have \(\dim_\mathbb{R} H^1_{\mathrm{dR}}(X) = 2g\).
</div>

<div class="definition">
<strong>Dolbeault Cohomology:</strong> The Dolbeault complex uses the \(\bar{\partial}\)-operator acting on forms. It is written as
\[0 \to \Omega^{(0,0)}(X) \xrightarrow{\bar{\partial}} \Omega^{(0,1)}(X) \xrightarrow{\bar{\partial}} \Omega^{(0,2)}(X) \to 0.\]
The Dolbeault cohomology groups are
\[H^{0,q}(X) = \frac{\ker(\bar{\partial} : \Omega^{(0,q)} \to \Omega^{(0,q+1)})}{\mathrm{im}(\bar{\partial} : \Omega^{(0,q-1)} \to \Omega^{(0,q)})}.\]
</div>

<div class="remark">
<strong>Holomorphic Forms and Cohomology:</strong> The space of holomorphic \(1\)-forms on a Riemann surface is isomorphic to the Dolbeault cohomology group \(H^{0,1}(X)\) (more precisely, to \(H^0(X, K_X)\), the global sections of the canonical bundle).
</div>

# Chapter 9: Hodge Decomposition and Sheaf Cohomology

The Hodge decomposition theorem states that on a compact complex manifold, the de Rham cohomology decomposes according to Dolbeault cohomology groups.

<div class="theorem">
<strong>Hodge Decomposition:</strong> For a compact Riemann surface, we have
\[H^1_{\mathrm{dR}}(X; \mathbb{C}) \cong H^{0,1}(X) \oplus H^{1,0}(X) \cong H^0(X, K_X) \oplus \overline{H^0(X, K_X)},\]
where the last isomorphism uses complex conjugation.
</div>

Sheaf cohomology generalizes the notion of global sections and measures obstructions to solving sheaf equations.

<div class="definition">
<strong>Sheaf Cohomology:</strong> For a sheaf \(\mathcal{F}\) on a Riemann surface, the sheaf cohomology groups \(H^q(X, \mathcal{F})\) are derived functors of the global section functor. For \(q = 0\), we have \(H^0(X, \mathcal{F}) = \mathcal{F}(X)\), the global sections.
</div>

<div class="theorem">
<strong>Dolbeault Isomorphism:</strong> There is a canonical isomorphism
\[H^q_{\mathrm{Dolbeault}}(X) \cong H^{0,q}(X) \cong H^q(X, \mathcal{O}),\]
relating Dolbeault cohomology to sheaf cohomology of the structure sheaf.
</div>

For a compact Riemann surface of genus \(g\), we have:
- \(H^0(X, \mathcal{O}) = \mathbb{C}\) (constant functions only).
- \(H^1(X, \mathcal{O}) \cong \mathbb{C}^g\) (dimension equals genus).
- \(H^q(X, \mathcal{O}) = 0\) for \(q \geq 2\) (since complex dimension is \(1\)).

<div class="remark">
<strong>Exact Sequences and Long Exact Sequences in Cohomology:</strong> A short exact sequence of sheaves \(0 \to \mathcal{F}' \to \mathcal{F} \to \mathcal{F}'' \to 0\) induces a long exact sequence in cohomology, providing a powerful tool for computing cohomology groups by induction.
</div>

# Chapter 10: Divisors, Line Bundles, and Riemann-Roch

A divisor on a Riemann surface is a formal sum of points \(D = \sum_p n_p \cdot p\) where \(n_p \in \mathbb{Z}\) and only finitely many \(n_p\) are nonzero. Divisors form a group under addition.

<div class="definition">
<strong>Divisor of a Meromorphic Function:</strong> If \(f\) is a meromorphic function on \(X\), its divisor is
\[\mathrm{div}(f) = \sum_{p : f(p) = 0} v_p(f) \cdot p - \sum_{p : f(p) = \infty} v_p(f) \cdot p,\]
where \(v_p(f)\) is the valuation of \(f\) at \(p\) (order of zero or pole). Two divisors that differ by the divisor of a meromorphic function are called linearly equivalent.
</div>

<div class="definition">
<strong>Line Bundle:</strong> A line bundle over a Riemann surface is a complex vector bundle of rank \(1\). The set of isomorphism classes of line bundles over \(X\) forms the Picard group \(\mathrm{Pic}(X)\), a group under tensor product.
</div>

<div class="remark">
<strong>Divisors and Line Bundles:</strong> There is a natural map from divisors to the Picard group, sending each divisor \(D\) to a line bundle \(\mathcal{L}(D)\). For a compact Riemann surface of genus \(g\), the Picard group is a complex torus of dimension \(g\) (the Jacobian variety, see below).
</div>

<div class="theorem">
<strong>Riemann-Roch Theorem:</strong> For a divisor \(D\) on a compact connected Riemann surface \(X\) of genus \(g\),
\[\dim H^0(X, \mathcal{L}(D)) - \dim H^1(X, \mathcal{L}(D)) = \deg(D) + 1 - g,\]
where \(\deg(D) = \sum_p n_p\) is the degree of \(D\) and \(\mathcal{L}(D)\) is the associated line bundle.
</div>

The Riemann-Roch theorem is a cornerstone of algebraic geometry, relating the dimension of a space of meromorphic functions and differentials to topological invariants.

<div class="remark">
<strong>Serre Duality:</strong> For a line bundle \(\mathcal{L}\) on a Riemann surface of genus \(g\),
\[\dim H^1(X, \mathcal{L}) = \dim H^0(X, K_X \otimes \mathcal{L}^{-1}).\]
This duality, a special case of Serre duality, combines with Riemann-Roch to provide powerful formulas for dimensions.
</div>

# Chapter 11: Jacobian Varieties and Uniformization

The Jacobian variety of a Riemann surface encodes important arithmetic and geometric information and is the universal object for studying line bundles and divisors.

<div class="definition">
<strong>Jacobian Variety:</strong> For a compact Riemann surface \(X\) of genus \(g\), the Jacobian variety is
\[J(X) = \frac{H^0(X, K_X)^*}{\Lambda},\]
where \(\Lambda\) is the lattice of periods of holomorphic \(1\)-forms integrated over \(1\)-cycles in \(H_1(X, \mathbb{Z})\). Equivalently, \(J(X)\) is a \(g\)-dimensional complex torus. There is also a natural map \(\mathrm{Pic}^0(X) \to J(X)\) realizing \(J(X)\) as the identity component of the Picard group.
</div>

<div class="theorem">
<strong>Abel's Theorem:</strong> For a compact Riemann surface \(X\) and two effective divisors \(D_1 = p_1 + \cdots + p_g\) and \(D_2 = q_1 + \cdots + q_g\) of degree \(g\), there exists a meromorphic function with divisor \(D_1 - D_2\) if and only if the classes of \(D_1\) and \(D_2\) in \(J(X)\) coincide.
</div>

The Uniformization Theorem describes the universal covers of Riemann surfaces completely.

<div class="theorem">
<strong>Uniformization Theorem:</strong> Every simply connected Riemann surface is biholomorphic to one of the following:
\begin{enumerate}
\item The Riemann sphere \(\mathbb{P}^1(\mathbb{C})\).
\item The complex plane \(\mathbb{C}\).
\item The upper half-plane \(\mathbb{H}\) (or equivalently, the unit disk \(\mathbb{D}\)).
\end{enumerate}
Consequently, every Riemann surface is a quotient of one of these three by a discrete group of automorphisms.
</div>

<div class="example">
<strong>Uniformization Examples:</strong>
<ol>
<li>Genus \(0\) surfaces (only \(\mathbb{P}^1(\mathbb{C})\)) have universal cover \(\mathbb{P}^1(\mathbb{C})\) and are quotients by trivial actions.</li>
<li>Genus \(1\) surfaces (elliptic curves) have universal cover \(\mathbb{C}\) and are quotients \(\mathbb{C}/\Lambda\) by translation by a lattice.</li>
<li>Genus \(g \geq 2\) surfaces have universal cover \(\mathbb{H}\) and are quotients \(\mathbb{H}/\Gamma\) by a Fuchsian group \(\Gamma\) (discrete subgroup of \(\mathrm{PSL}_2(\mathbb{R})\) acting properly discontinuously on \(\mathbb{H}\)).</li>
</ol>
</div>

<div class="remark">
<strong>Moduli Space:</strong> The space of isomorphism classes of Riemann surfaces of genus \(g \geq 2\) can be identified with the quotient of a domain in \(\mathbb{C}^{3g-3}\) by the action of the mapping class group, called the moduli space \(\mathcal{M}_g\). For \(g = 1\), the moduli space is the quotient \(\mathbb{H}/\mathrm{SL}_2(\mathbb{Z})\).
</div>

# Chapter 12: Conclusion and Applications

The theory of Riemann surfaces synthesizes complex analysis, topology, and algebraic geometry into a unified framework. The key achievements are:

1. **Classification:** Riemann surfaces are completely classified by their topological type and genus, with genus being determined by the Euler characteristic.

2. **Holomorphic Maps:** Maps between Riemann surfaces are highly rigid; they are determined by their behaviour at any point and satisfy strong constraints like the genus formula.

3. **Cohomological Tools:** Sheaf cohomology, de Rham cohomology, and Dolbeault cohomology provide powerful algebraic means to extract geometric and topological information.

4. **Divisors and Line Bundles:** The divisor class group and Picard group encode intrinsic geometry. The Riemann-Roch theorem and Serre duality are fundamental computational tools.

5. **Jacobian Varieties:** These tori parametrize line bundles and divisors, providing a bridge between the surface and algebraic varieties.

6. **Uniformization:** The Uniformization Theorem reveals that all Riemann surfaces arise as quotients of the sphere, the plane, or the upper half-plane by discrete groups, making the classification complete and explicit.

Applications of Riemann surface theory extend to:
- **Algebraic geometry:** Every smooth projective curve is a Riemann surface, and conversely, every compact Riemann surface is projective.
- **Complex dynamics:** The iteration of rational functions on \(\mathbb{P}^1(\mathbb{C})\) is understood via the dynamics on the Riemann sphere.
- **String theory and physics:** Riemann surfaces parametrize worldsheets of strings and are central to conformal field theory.
- **Number theory:** Arithmetic aspects of curves over number fields are illuminated by their complex analytic structure as Riemann surfaces.

