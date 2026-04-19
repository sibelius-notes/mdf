---
title: "PMATH 950: C*-Algebras and Operator Algebras"
subjects: PMATH
prof: Matthew Kennedy, L. W. Marcoux
---

## Sources and References

- Murphy, G. J. *C*-Algebras and Operator Theory*. Academic Press, 1990.
- Brown, N. P. and Ozawa, N. *C*-Algebras and Finite-Dimensional Approximations*. AMS Graduate Studies in Mathematics, Vol. 88, 2008.
- Paulsen, V. *Completely Bounded Maps and Operator Algebras*. Cambridge University Press, 2002.
- Davidson, K. R. *C*-Algebras by Example*. AMS Fields Institute Monographs, 1996.
- Pisier, G. *Similarity Problems and Completely Bounded Maps*. Springer Lecture Notes in Mathematics, Vol. 1618, 2001.
- Bekka, M. B. and de la Harpe, P. *Unitary Representations of Groups, Duals, and Characters*. AMS Mathematical Surveys and Monographs, 2020.
- Connes, A. *Noncommutative Geometry*. Academic Press, 1994.
- Effros, E. G. and Ruan, Z.-J. *Operator Spaces*. Clarendon Press, 2000.
- Pisier, G. *Introduction to Operator Space Theory*. Cambridge University Press, 2003.

---

# Chapter 1: C*-Algebra Foundations

## 1.1 Banach *-Algebras and the C*-Identity

The modern theory of operator algebras begins with the abstraction of the algebra of bounded operators on a Hilbert space. To isolate the algebraically essential features, we pass through the intermediate notion of a Banach *-algebra.

<div class="definition"><strong>Definition 1.1 (Banach *-Algebra).</strong> A <em>Banach *-algebra</em> is a Banach algebra \( A \) equipped with an isometric involution \( * : A \to A \) satisfying:
<ol>
  <li>\( (a + b)^* = a^* + b^* \)</li>
  <li>\( (\lambda a)^* = \bar{\lambda} a^* \) for \( \lambda \in \mathbb{C} \)</li>
  <li>\( (ab)^* = b^* a^* \)</li>
  <li>\( (a^*)^* = a \)</li>
  <li>\( \|a^*\| = \|a\| \)</li>
</ol>
A <em>C*-algebra</em> is a Banach *-algebra satisfying the additional <em>C*-identity</em>:

\[
\|a^* a\| = \|a\|^2 \quad \text{for all } a \in A.
\]
</div>

The C*-identity is extraordinarily powerful. From it alone one can deduce that the norm on a C*-algebra is uniquely determined by the algebraic structure: if \( A \) and \( B \) are C*-algebras and \( \phi : A \to B \) is a *-homomorphism, then \( \|\phi(a)\| \leq \|a\| \) for all \( a \), and if \( \phi \) is injective, it is isometric. Consequently, a C*-algebra can admit at most one norm rendering it a C*-algebra.

<div class="example"><strong>Example 1.2 (Canonical examples).</strong>
<ul>
  <li>The algebra \( B(H) \) of all bounded linear operators on a Hilbert space \( H \), with the operator norm and the adjoint as involution, is a C*-algebra. This is the motivating example: every abstract C*-algebra embeds isometrically as a closed *-subalgebra of some \( B(H) \).</li>
  <li>The commutative C*-algebra \( C_0(X) \) of continuous functions vanishing at infinity on a locally compact Hausdorff space \( X \), with pointwise operations and the supremum norm. The Gelfand theorem identifies this as the general commutative C*-algebra.</li>
  <li>The algebra \( K(H) \) of compact operators on an infinite-dimensional Hilbert space \( H \). This is the unique closed ideal of \( B(H) \) when \( H \) is separable.</li>
  <li>Matrix algebras \( M_n(\mathbb{C}) \) and direct sums \( \bigoplus_n M_{n_k}(\mathbb{C}) \). These form the building blocks of finite-dimensional C*-algebras.</li>
</ul>
</div>

An element \( a \) is <em>self-adjoint</em> if \( a = a^* \), <em>normal</em> if \( a^* a = a a^* \), a <em>projection</em> if \( a = a^* = a^2 \), and <em>unitary</em> if \( a^* a = a a^* = 1 \) (in a unital C*-algebra). Every element decomposes as \( a = h + ik \) where \( h = \frac{a + a^*}{2} \) and \( k = \frac{a - a^*}{2i} \) are self-adjoint. A self-adjoint element \( h \) is <em>positive</em>, written \( h \geq 0 \), if its spectrum lies in \( [0, \infty) \); equivalently, \( h = b^* b \) for some \( b \in A \).

## 1.2 The Gelfand Transform: Commutative C*-Algebras

The Gelfand theory provides a complete classification of commutative C*-algebras.

<div class="definition"><strong>Definition 1.3 (Character, Spectrum).</strong> A <em>character</em> of a commutative unital Banach algebra \( A \) is a non-zero algebra homomorphism \( \chi : A \to \mathbb{C} \). The collection of all characters, equipped with the weak-* topology from \( A^* \), is the <em>Gelfand spectrum</em> (or <em>maximal ideal space</em>) \( \hat{A} \).</div>

<div class="theorem"><strong>Theorem 1.4 (Gelfand–Naimark, commutative case).</strong> Let \( A \) be a commutative C*-algebra. If \( A \) is unital, its Gelfand spectrum \( \hat{A} \) is a compact Hausdorff space, and the <em>Gelfand transform</em>

\[
\Gamma : A \to C(\hat{A}), \quad \Gamma(a)(\chi) = \chi(a),
\]
is an isometric *-isomorphism. If \( A \) is non-unital, \( \hat{A} \) is locally compact Hausdorff, and \( \Gamma : A \xrightarrow{\cong} C_0(\hat{A}) \).</div>

<div class="proof"><strong>Proof sketch.</strong> One shows that every maximal ideal of \( A \) has codimension one (using the fact that the spectrum of every element of a commutative Banach algebra is non-empty), so characters are in bijection with maximal ideals. The C*-identity implies \( \|\Gamma(a)\|_\infty = r(a) = \|a\| \) for self-adjoint \( a \) (since the spectral radius equals the norm for self-adjoint elements in a C*-algebra), and this extends to all of \( A \) by the C*-identity. Surjectivity follows from the Stone–Weierstrass theorem.</div>

The Gelfand theorem has profound consequences. It supplies a continuous functional calculus: for a normal element \( a \) in a C*-algebra, the C*-subalgebra generated by \( a \) and \( a^* \) is isomorphic to \( C(\sigma(a)) \), so one may define \( f(a) \) for any \( f \in C(\sigma(a)) \).

## 1.3 The General Gelfand–Naimark Theorem and GNS Construction

The non-commutative analogue of the Gelfand theorem requires embedding an abstract C*-algebra into \( B(H) \). The vehicle is the GNS construction.

<div class="definition"><strong>Definition 1.5 (State).</strong> A <em>state</em> on a C*-algebra \( A \) is a positive linear functional \( \phi : A \to \mathbb{C} \) of norm one: \( \phi(a^* a) \geq 0 \) for all \( a \), and \( \|\phi\| = 1 \). A state is <em>pure</em> if it is an extreme point of the convex set \( S(A) \) of all states.</div>

States exist in abundance: by the Hahn–Banach theorem, for any \( a \in A \) there is a state \( \phi \) with \( |\phi(a)| = \|a\| \). The set \( S(A) \) is weak-* compact, and by the Krein–Milman theorem it has enough extreme points to separate elements.

<div class="theorem"><strong>Theorem 1.6 (GNS Construction).</strong> Let \( \phi \) be a state on a unital C*-algebra \( A \). Define a sesquilinear form on \( A \) by \( \langle a, b \rangle_\phi = \phi(b^* a) \). The left ideal \( N_\phi = \{a \in A : \phi(a^* a) = 0\} \) is a closed left ideal, and \( A / N_\phi \) carries a well-defined inner product. Let \( H_\phi \) be its Hilbert space completion and \( \xi_\phi = [1] \) the image of the identity. Then:
<ol>
  <li>The formula \( \pi_\phi(a)[b] = [ab] \) defines a *-representation \( \pi_\phi : A \to B(H_\phi) \).</li>
  <li>\( \xi_\phi \) is a cyclic unit vector: \( \pi_\phi(A)\xi_\phi \) is dense in \( H_\phi \).</li>
  <li>\( \phi(a) = \langle \pi_\phi(a) \xi_\phi, \xi_\phi \rangle \) for all \( a \in A \).</li>
</ol>
The triple \( (H_\phi, \pi_\phi, \xi_\phi) \) is the <em>GNS representation</em> associated to \( \phi \), and is unique up to unitary equivalence.</div>

<div class="theorem"><strong>Theorem 1.7 (Gelfand–Naimark, general).</strong> Every C*-algebra admits an isometric *-representation on a Hilbert space. Concretely, the direct sum of all GNS representations \( \pi = \bigoplus_{\phi \in S(A)} \pi_\phi \) is isometric.</div>

## 1.4 Representations, Irreducibility, and Pure States

<div class="definition"><strong>Definition 1.8.</strong> A *-representation \( \pi : A \to B(H) \) is <em>irreducible</em> (or <em>topologically irreducible</em>) if the only closed subspaces of \( H \) invariant under all \( \pi(a) \) are \( \{0\} \) and \( H \). Equivalently, the commutant \( \pi(A)' = \{\lambda I : \lambda \in \mathbb{C}\} \) by Schur's lemma.</div>

The connection between pure states and irreducible representations is fundamental:

<div class="theorem"><strong>Theorem 1.9.</strong> A state \( \phi \) is pure if and only if the GNS representation \( \pi_\phi \) is irreducible.</div>

The spectrum \( \hat{A} \) of a C*-algebra (not to be confused with the Gelfand spectrum of its commutative subalgebras) is defined as the set of unitary equivalence classes of irreducible representations. For commutative C*-algebras this recovers the Gelfand spectrum. For \( B(H) \) with \( H \) infinite-dimensional separable, the spectrum is a single point (the identity representation).

## 1.5 Spectral Theory in C*-Algebras

The spectrum of an element \( a \) in a unital C*-algebra \( A \) is

\[
\sigma_A(a) = \{\lambda \in \mathbb{C} : a - \lambda 1 \text{ is not invertible in } A\}.
\]

<div class="theorem"><strong>Theorem 1.10 (Spectral properties).</strong>
<ol>
  <li>\( \sigma_A(a) \) is a non-empty compact subset of \( \mathbb{C} \).</li>
  <li>If \( a \) is self-adjoint, \( \sigma_A(a) \subseteq \mathbb{R} \).</li>
  <li>If \( a \) is unitary, \( \sigma_A(a) \subseteq \mathbb{T} = \{z : |z| = 1\} \).</li>
  <li>The spectral radius satisfies \( r(a) = \lim_n \|a^n\|^{1/n} = \|a\| \) if \( a \) is normal.</li>
  <li>If \( B \subseteq A \) is a C*-subalgebra, then \( \sigma_B(a) = \sigma_A(a) \) for all \( a \in B \).</li>
</ol>
</div>

Property (5) — spectral permanence — is special to C*-algebras and fails for general Banach algebras. It is a consequence of the fact that invertibility of a self-adjoint element in the ambient algebra implies invertibility in any C*-subalgebra.

---

# Chapter 2: Completely Positive and Completely Bounded Maps

## 2.1 Positivity and Complete Positivity

Let \( A \) and \( B \) be C*-algebras. A linear map \( \phi : A \to B \) is <em>positive</em> if \( \phi(a) \geq 0 \) whenever \( a \geq 0 \). For commutative algebras, positive maps behave well; in the non-commutative setting, positivity alone is too weak, as the transpose map on \( M_2(\mathbb{C}) \) illustrates.

<div class="definition"><strong>Definition 2.1 (Complete Positivity).</strong> For each \( n \geq 1 \), define the <em>\( n \)-th amplification</em> of \( \phi \) as \( \phi_n = \phi \otimes \mathrm{id}_{M_n} : A \otimes M_n \to B \otimes M_n \), where \( (A \otimes M_n \cong M_n(A)) \). The map \( \phi \) is <em>\( n \)-positive</em> if \( \phi_n \) is positive, and <em>completely positive</em> (CP) if \( \phi_n \) is positive for all \( n \geq 1 \).</div>

<div class="example"><strong>Example 2.2.</strong> The transpose map \( T : M_2(\mathbb{C}) \to M_2(\mathbb{C}) \), \( T(A) = A^t \), is positive but not 2-positive (and hence not completely positive). Indeed,

\[
\left[\begin{pmatrix} 1 & 0 \\ 0 & 0 \end{pmatrix}, \begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix}; \begin{pmatrix} 0 & 0 \\ 1 & 0 \end{pmatrix}, \begin{pmatrix} 0 & 0 \\ 0 & 1 \end{pmatrix}\right] \geq 0 \text{ in } M_2(M_2),
\]
but its image under \( T \otimes \mathrm{id} \) is not positive.</div>

Completely positive maps are the morphisms of operator systems and C*-algebras in the category appropriate for quantum information theory and operator space theory.

## 2.2 Stinespring's Dilation Theorem

The foundational result in the theory of CP maps is Stinespring's theorem, which characterizes CP maps as compressions of *-homomorphisms — exactly the non-commutative analogue of the GNS construction for states.

<div class="theorem"><strong>Theorem 2.3 (Stinespring, 1955).</strong> Let \( A \) be a unital C*-algebra and \( \phi : A \to B(H) \) a completely positive map. Then there exist a Hilbert space \( K \), a *-representation \( \pi : A \to B(K) \), and a bounded operator \( V : H \to K \) such that

\[
\phi(a) = V^* \pi(a) V \quad \text{for all } a \in A,
\]
and \( \|\phi\| = \|V\|^2 \). If \( \phi \) is unital, \( V \) is an isometry. The triple \( (K, \pi, V) \) is called a <em>Stinespring dilation</em> and is unique up to unitary equivalence when \( K = \overline{\pi(A) V H} \) (the <em>minimal dilation</em>).</div>

<div class="proof"><strong>Proof sketch.</strong> Define a sesquilinear form on the algebraic tensor product \( A \odot H \) by

\[
\left\langle \sum_i a_i \otimes h_i, \sum_j b_j \otimes k_j \right\rangle = \sum_{i,j} \langle \phi(b_j^* a_i) h_i, k_j \rangle_H.
\]
Complete positivity of \( \phi \) ensures this is a positive semi-definite form. Quotienting by the null space and completing gives \( K \); set \( V h = 1 \otimes h \) and \( \pi(a)(b \otimes h) = ab \otimes h \). One verifies these extend to the desired operators.</div>

<div class="remark"><strong>Remark 2.4.</strong> The Stinespring theorem encapsulates several classical results. When \( A = C(X) \) and \( \phi \) is a positive map, it recovers the spectral theorem for normal operators. When \( \phi \) is a state, it specializes to the GNS construction. The unital CP maps from \( A \) to \( B(H) \) are precisely the compressions of *-representations to (not necessarily invariant) subspaces.</div>

## 2.3 Choi's Theorem

For maps into finite matrix algebras, Stinespring's theorem takes an especially concrete form.

<div class="theorem"><strong>Theorem 2.5 (Choi, 1975).</strong> A linear map \( \phi : M_n(\mathbb{C}) \to M_m(\mathbb{C}) \) is completely positive if and only if the <em>Choi matrix</em>

\[
C_\phi = (\phi(e_{ij}))_{i,j=1}^n \in M_n(M_m) \cong M_{nm}(\mathbb{C})
\]
is positive semidefinite, where \( \{e_{ij}\} \) are the standard matrix units.</div>

The Choi matrix provides a duality between CP maps and positive matrices. Specifically, \( \phi \) is CP if and only if \( C_\phi \geq 0 \), and if \( C_\phi = \sum_k V_k^* V_k \) (a Kraus decomposition), then \( \phi(A) = \sum_k V_k A V_k^* \). This <em>Kraus form</em> is the standard representation of a quantum channel in quantum information theory.

## 2.4 Arveson's Extension Theorem

A fundamental theorem paralleling the Hahn–Banach theorem for CP maps:

<div class="theorem"><strong>Theorem 2.6 (Arveson's Extension Theorem, 1969).</strong> Let \( A \) be a C*-algebra, \( S \subseteq A \) an operator system (a unital self-adjoint subspace), and \( \phi : S \to B(H) \) a completely positive map. Then \( \phi \) extends to a completely positive map \( \tilde{\phi} : A \to B(H) \).</div>

The proof uses a matrix-valued Hahn–Banach argument. The theorem fails for merely positive maps, further illustrating why complete positivity is the correct notion.

<div class="definition"><strong>Definition 2.7 (Operator System, Operator Space).</strong> An <em>operator system</em> is a unital self-adjoint subspace \( S \subseteq B(H) \); the appropriate morphisms are unital CP maps. An <em>operator space</em> is a closed subspace \( V \subseteq B(H) \); the morphisms are completely bounded maps (defined below). The category of operator spaces is more flexible, allowing non-unital and non-self-adjoint subspaces.</div>

## 2.5 Completely Bounded Maps

<div class="definition"><strong>Definition 2.8 (Completely Bounded Maps).</strong> A linear map \( \phi : A \to B(H) \) is <em>completely bounded</em> (CB) if the amplifications \( \phi_n : M_n(A) \to M_n(B(H)) \) satisfy

\[
\|\phi\|_{cb} = \sup_n \|\phi_n\| < \infty.
\]
The quantity \( \|\phi\|_{cb} \) is the <em>completely bounded norm</em>.</div>

Every *-homomorphism is CB with \( \|\phi\|_{cb} = \|\phi\| \leq 1 \). Every CP map is CB with \( \|\phi\|_{cb} = \|\phi\| \). The transpose map on \( M_n \) has \( \|T\| = 1 \) but \( \|T\|_{cb} = n \), showing that CB and bounded norms can diverge.

<div class="theorem"><strong>Theorem 2.9 (Paulsen's Theorem / Haagerup–Paulsen–Wittstock).</strong> A linear map \( \phi : A \to B(H) \) is completely bounded if and only if there exist a Hilbert space \( K \), a *-representation \( \pi : A \to B(K) \), and bounded operators \( V, W : H \to K \) such that

\[
\phi(a) = V^* \pi(a) W \quad \text{for all } a \in A,
\]
with \( \|\phi\|_{cb} = \|V\| \cdot \|W\| \). This is the <em>Haagerup–Wittstock dilation} for CB maps.</div>

The CB norm gives the operator space structure of \( B(A, B(H)) \), and operator space theory (developed by Effros–Ruan and Pisier) provides the correct categorical framework for studying these maps.

## 2.6 The Haagerup Tensor Product

The correct tensor product in the category of operator spaces is the <em>Haagerup tensor product</em>. For operator spaces \( V \subseteq B(H) \) and \( W \subseteq B(K) \), the Haagerup norm on \( V \otimes W \) is defined by

\[
\|u\|_h = \inf \left\{ \left\| \sum_i v_i v_i^* \right\|^{1/2} \left\| \sum_i w_i^* w_i \right\|^{1/2} : u = \sum_i v_i \otimes w_i \right\}.
\]

<div class="theorem"><strong>Theorem 2.10 (Haagerup).</strong> A linear map \( \phi : A \to B(H) \) is CB if and only if there is a bounded linear functional on \( A \otimes_h B(H)^* \). Moreover, the CB maps from \( A \) to \( B(H) \) are in isometric bijection with \( (A \otimes_h B(H)^*)^* \).</div>

The Haagerup tensor product is non-symmetric (in general \( V \otimes_h W \not\cong W \otimes_h V \)) but satisfies a universal property for jointly CB bilinear maps, making it the appropriate tool for module tensor products in the theory of operator modules.

---

# Chapter 3: Group C*-Algebras

## 3.1 Group Algebras and the Universal C*-Algebra

Let \( G \) be a discrete group. The <em>group algebra</em> \( \mathbb{C}[G] \) is the vector space of finitely supported functions \( f : G \to \mathbb{C} \), with convolution product \( (f * g)(s) = \sum_{t \in G} f(t) g(t^{-1} s) \) and involution \( f^*(s) = \overline{f(s^{-1})} \). Elements of \( \mathbb{C}[G] \) are written \( \sum_{s \in G} f(s) u_s \) where \( \{u_s\}_{s \in G} \) are the standard basis elements.

The group algebra can be completed to a C*-algebra in several ways, reflecting different aspects of the representation theory of \( G \).

<div class="definition"><strong>Definition 3.1 (Universal C*-Algebra).</strong> A unitary representation of \( G \) on a Hilbert space \( H \) is a group homomorphism \( \pi : G \to \mathcal{U}(H) \) (the unitary group). Define the <em>universal C*-norm</em> on \( \mathbb{C}[G] \) by

\[
\left\| \sum_{s} f(s) u_s \right\|_{\max} = \sup \left\{ \left\| \sum_s f(s) \pi(s) \right\| : \pi \text{ a unitary rep of } G \right\}.
\]
The completion of \( \mathbb{C}[G] \) under this norm is the <em>universal (or full) group C*-algebra</em> \( C^*(G) \).</div>

The universal property of \( C^*(G) \) is: unitary representations of \( G \) are in bijective correspondence with *-representations of \( C^*(G) \). This makes \( C^*(G) \) the natural C*-algebra encoding the full unitary dual of \( G \).

## 3.2 The Left Regular Representation and the Reduced C*-Algebra

The prototypical representation of \( G \) is the left regular representation on \( \ell^2(G) \).

<div class="definition"><strong>Definition 3.2.</strong> The <em>left regular representation</em> \( \lambda : G \to \mathcal{U}(\ell^2(G)) \) is defined by

\[
(\lambda_s \xi)(t) = \xi(s^{-1} t), \quad s, t \in G, \; \xi \in \ell^2(G).
\]
The <em>reduced group C*-algebra</em> \( C^*_r(G) \) is the operator-norm closure of \( \{\lambda(a) : a \in \mathbb{C}[G]\} \subseteq B(\ell^2(G)) \).</div>

The left regular representation extends to a *-homomorphism \( \lambda : C^*(G) \to C^*_r(G) \), which is always surjective. It is an isomorphism if and only if \( G \) is amenable (see Chapter 4).

<div class="example"><strong>Example 3.3 (Abelian groups).</strong> Let \( G = \mathbb{Z} \). Then \( \ell^2(\mathbb{Z}) \cong L^2(\mathbb{T}) \) via the Fourier transform, and the left regular representation becomes multiplication by the coordinate function \( z \mapsto z \). Thus \( C^*_r(\mathbb{Z}) \cong C(\mathbb{T}) \). More generally, for an abelian group \( G \), Pontryagin duality gives \( C^*_r(G) \cong C^*(G) \cong C(\hat{G}) \) where \( \hat{G} \) is the Pontryagin dual (a compact abelian group when \( G \) is discrete).</div>

<div class="example"><strong>Example 3.4 (Free groups).</strong> Let \( \mathbb{F}_n \) denote the free group on \( n \geq 2 \) generators. The free groups are non-amenable, so the canonical map \( C^*(\mathbb{F}_n) \to C^*_r(\mathbb{F}_n) \) is not an isomorphism. The reduced C*-algebra \( C^*_r(\mathbb{F}_n) \) is a simple, exact, non-nuclear C*-algebra — a central object in the theory. The structure of \( C^*_r(\mathbb{F}_n) \) was studied by Pimsner–Popa and Haagerup; it is exact but not nuclear, and has the CBAP (completely bounded approximation property) with constant 1.</div>

## 3.3 The Left and Right Regular Representations and von Neumann Algebras

In addition to \( \lambda \), define the <em>right regular representation</em> \( \rho : G \to \mathcal{U}(\ell^2(G)) \) by

\[
(\rho_s \xi)(t) = \xi(ts), \quad s, t \in G.
\]
The operators \( \rho_s \) commute with all \( \lambda_t \) (since \( \lambda \) and \( \rho \) commute). The weak operator topology closure of \( \lambda(\mathbb{C}[G]) \) is the <em>group von Neumann algebra</em> \( L(G) \), discussed further in Chapter 5.

## 3.4 Examples and Structural Results

<div class="theorem"><strong>Theorem 3.5 (Lance, 1973).</strong> For a discrete group \( G \), the following are equivalent:
<ol>
  <li>\( G \) is amenable.</li>
  <li>The canonical map \( C^*(G) \to C^*_r(G) \) is an isomorphism.</li>
  <li>\( C^*_r(G) \) is nuclear.</li>
</ol>
</div>

This theorem, combined with the theory developed in Chapter 4, is one of the landmark results relating group theory, operator algebras, and functional analysis.

For finite groups, \( C^*(G) = C^*_r(G) = \mathbb{C}[G] \cong \bigoplus_{\pi \in \hat{G}} M_{d_\pi}(\mathbb{C}) \) by the Peter–Weyl theorem, where \( \hat{G} \) is the set of irreducible representations and \( d_\pi \) their dimensions. For compact groups (including finite groups), the group C*-algebra is a type I C*-algebra.

<div class="remark"><strong>Remark 3.6 (Type I vs. non-type I).</strong> A C*-algebra is <em>type I</em> (or GCR, or postliminal) if every irreducible representation contains the compact operators. Group C*-algebras of abelian or compact groups are type I. The group C*-algebra of \( \mathbb{F}_2 \) is not type I. Type I C*-algebras have a well-behaved representation theory with a Borel structure on the dual; non-type I algebras exhibit much more complicated unitary dual spaces.</div>

---

# Chapter 4: Amenability and Nuclearity

## 4.1 Amenability for Groups

<div class="definition"><strong>Definition 4.1 (Amenable Group).</strong> A discrete group \( G \) is <em>amenable</em> if there exists a left-invariant mean on \( \ell^\infty(G) \): a state \( m : \ell^\infty(G) \to \mathbb{C} \) such that \( m(L_s f) = m(f) \) for all \( s \in G \) and \( f \in \ell^\infty(G) \), where \( (L_s f)(t) = f(s^{-1}t) \).</div>

Equivalently (Følner's criterion), \( G \) is amenable if and only if for every finite \( F \subseteq G \) and \( \varepsilon > 0 \), there exists a finite non-empty set \( S \subseteq G \) with \( |sS \triangle S| < \varepsilon |S| \) for all \( s \in F \). The class of amenable groups includes all abelian groups, all finite groups, all solvable groups, and is closed under subgroups, quotients, extensions, and directed unions. Non-amenable groups include the free groups \( \mathbb{F}_n \) (\( n \geq 2 \)) and, more generally, any group containing a free subgroup on two generators (though the converse — the von Neumann conjecture — is false by a theorem of Olshanskii).

## 4.2 Nuclear C*-Algebras

The notion of nuclearity for C*-algebras captures, in purely algebraic/analytic terms, the amenability of the underlying structure.

<div class="definition"><strong>Definition 4.2 (Tensor Products).</strong> Given C*-algebras \( A \) and \( B \), the algebraic tensor product \( A \odot B \) admits a family of C*-norms. The <em>minimal} (or <em>spatial</em>) norm \( \|\cdot\|_{\min} \) comes from representing \( A \) and \( B \) faithfully on Hilbert spaces \( H, K \) and taking the operator norm on \( B(H \otimes K) \). The <em>maximal} norm \( \|\cdot\|_{\max} \) is the largest C*-norm. We write \( A \otimes_{\min} B \) and \( A \otimes_{\max} B \) for the completions.</div>

<div class="definition"><strong>Definition 4.3 (Nuclear C*-Algebra).</strong> A C*-algebra \( A \) is <em>nuclear</em> if for every C*-algebra \( B \), the minimal and maximal norms agree on \( A \odot B \):

\[
A \otimes_{\min} B = A \otimes_{\max} B.
\]
</div>

Nuclearity admits multiple equivalent formulations, the most useful of which involves the completely positive approximation property.

<div class="theorem"><strong>Theorem 4.4 (Choi–Effros, Kirchberg).</strong> For a C*-algebra \( A \), the following are equivalent:
<ol>
  <li>\( A \) is nuclear.</li>
  <li>\( A \) has the <em>completely positive approximation property</em> (CPAP): the identity map \( \mathrm{id}_A \) is the pointwise limit of a net of CP maps \( A \to M_{n_\alpha} \to A \) that factor through finite matrix algebras.</li>
  <li>The natural map \( A^{**} \otimes_{\min} B \to A^{**} \otimes_{\max} B \) is an isomorphism for every \( B \).</li>
  <li>\( A \) is injective as an operator system (Arveson's definition of injectivity).</li>
</ol>
</div>

The CPAP condition in (2) is often written as: there exist nets of CP maps \( \phi_\alpha : A \to M_{n_\alpha}(\mathbb{C}) \) and \( \psi_\alpha : M_{n_\alpha}(\mathbb{C}) \to A \) with \( \psi_\alpha \circ \phi_\alpha \to \mathrm{id}_A \) pointwise. This <em>factorization through matrix algebras} is Kirchberg's characterization.

<div class="example"><strong>Example 4.5.</strong>
<ul>
  <li>All commutative C*-algebras are nuclear.</li>
  <li>All finite-dimensional C*-algebras are nuclear.</li>
  <li>\( K(H) \) is nuclear.</li>
  <li>The Cuntz algebras \( \mathcal{O}_n \) are nuclear.</li>
  <li>The irrational rotation algebras \( A_\theta \) are nuclear.</li>
  <li>\( B(H) \) is not nuclear when \( H \) is infinite-dimensional.</li>
  <li>\( C^*_r(\mathbb{F}_2) \) is not nuclear, but is exact (see Chapter 9).</li>
</ul>
</div>

## 4.3 Amenability and Nuclearity

<div class="theorem"><strong>Theorem 4.6 (Lance–Bunce–Paschke).</strong> For a discrete group \( G \):
<ol>
  <li>\( G \) is amenable \( \Leftrightarrow \) \( C^*(G) \) is nuclear \( \Leftrightarrow \) \( C^*_r(G) \) is nuclear.</li>
  <li>If \( G \) is amenable, \( C^*(G) \cong C^*_r(G) \) (the full and reduced C*-algebras coincide).</li>
</ol>
</div>

This theorem is one of the deepest connections between group theory and C*-algebra theory. The proof uses the implication: amenability \( \Rightarrow \) existence of an invariant mean \( \Rightarrow \) the Reiter condition \( \Rightarrow \) approximation of the regular representation by finite-dimensional representations \( \Rightarrow \) nuclearity of \( C^*_r(G) \).

## 4.4 Connes' Theorem and Injectivity for Von Neumann Algebras

The analogue of nuclearity for von Neumann algebras is injectivity.

<div class="definition"><strong>Definition 4.7 (Injective Von Neumann Algebra).</strong> A von Neumann algebra \( M \subseteq B(H) \) is <em>injective</em> if there exists a contractive projection \( E : B(H) \to M \), i.e., a conditional expectation from \( B(H) \) onto \( M \).</div>

<div class="theorem"><strong>Theorem 4.8 (Connes, 1976).</strong> For a separably-acting finite von Neumann algebra \( M \), the following are equivalent:
<ol>
  <li>\( M \) is injective.</li>
  <li>\( M \) is hyperfinite (an increasing union of finite-dimensional subalgebras in the strong operator topology).</li>
  <li>\( M \) is semi-discrete.</li>
  <li>\( M \) has property \( P \) (Schwartz).</li>
</ol>
Moreover, the unique injective \( II_1 \) factor is the hyperfinite \( II_1 \) factor \( \mathcal{R} \).</div>

Connes' theorem is a landmark of twentieth-century mathematics, resolving the classification of injective factors and connecting several a priori distinct notions of approximation. The connection to C*-algebras is through: \( A \) is nuclear \( \Leftrightarrow \) \( A^{**} \) is an injective von Neumann algebra.

---

# Chapter 5: Group Von Neumann Algebras

## 5.1 Definition and Basic Structure

<div class="definition"><strong>Definition 5.1.</strong> Let \( G \) be a discrete group with left regular representation \( \lambda : G \to \mathcal{U}(\ell^2(G)) \). The <em>group von Neumann algebra</em> is

\[
L(G) = \lambda(G)'' = \overline{\lambda(\mathbb{C}[G])}^{\mathrm{WOT}} \subseteq B(\ell^2(G)),
\]
the weak operator topology closure of the group algebra.</div>

Let \( \delta_e \in \ell^2(G) \) denote the characteristic function of the identity element. The map \( T \mapsto T\delta_e \) identifies \( L(G) \) with a subspace of \( \ell^2(G) \). An operator \( T \in B(\ell^2(G)) \) belongs to \( L(G) \) if and only if \( T\xi = \xi * a \) for some \( a \in \ell^2(G) \), where convolution is defined appropriately.

## 5.2 The Canonical Trace

The most important feature of \( L(G) \) is its canonical trace.

<div class="definition"><strong>Definition 5.2 (Canonical Trace).</strong> The <em>canonical trace} on \( L(G) \) is

\[
\tau(T) = \langle T \delta_e, \delta_e \rangle, \quad T \in L(G).
\]
</div>

<div class="theorem"><strong>Theorem 5.3.</strong> The functional \( \tau : L(G) \to \mathbb{C} \) is a faithful normal tracial state: it satisfies \( \tau(ST) = \tau(TS) \), \( \tau(T^*T) \geq 0 \) with equality only when \( T = 0 \), and is continuous in the weak operator topology on bounded sets. The pair \( (L(G), \tau) \) is a finite von Neumann algebra (a von Neumann algebra admitting a faithful normal finite trace).</div>

The trace allows the definition of the \( L^2 \)-completion \( L^2(L(G), \tau) \), with \( L(G) \) acting on it by left multiplication — this is called the standard form of \( L(G) \).

## 5.3 Murray–von Neumann Equivalence and Factors

<div class="definition"><strong>Definition 5.4.</strong> Two projections \( p, q \) in a von Neumann algebra \( M \) are <em>Murray–von Neumann equivalent</em> (\( p \sim q \)) if there exists a partial isometry \( v \in M \) with \( v^*v = p \) and \( vv^* = q \). A projection \( p \) is <em>finite</em> if it is not equivalent to any proper subprojection; \( M \) is <em>finite</em> if \( 1 \) is finite.</div>

When \( G \) is an ICC group (all non-identity conjugacy classes are infinite, e.g., \( G = \mathbb{F}_n \), \( G = S_\infty \)), the von Neumann algebra \( L(G) \) is a factor (its center is \( \mathbb{C} \cdot 1 \)), and it is a \( II_1 \) factor: it is infinite-dimensional, has the trace, and every non-zero projection is Murray–von Neumann equivalent to \( 1 \). The trace takes all values in \( [0, 1] \) on projections.

<div class="example"><strong>Example 5.5.</strong>
<ul>
  <li>\( G = \mathbb{Z} \): \( L(\mathbb{Z}) \cong L^\infty(\mathbb{T}) \), a commutative von Neumann algebra (hence not a factor).</li>
  <li>\( G = \mathbb{F}_n \) (\( n \geq 2 \)): \( L(\mathbb{F}_n) \) is a \( II_1 \) factor, the <em>free group factor</em>. Whether \( L(\mathbb{F}_2) \cong L(\mathbb{F}_3) \) is a famous open problem.</li>
  <li>\( G = S_\infty \) (finite permutations of \( \mathbb{N} \)): ICC group; \( L(S_\infty) \) is the hyperfinite \( II_1 \) factor \( \mathcal{R} \).</li>
</ul>
</div>

## 5.4 Property (T) and Its Consequences

<div class="definition"><strong>Definition 5.6 (Property (T), Kazhdan 1967).</strong> A group \( G \) has Kazhdan's <em>property (T)</em> if there exist a finite set \( Q \subseteq G \) and \( \varepsilon > 0 \) (a <em>Kazhdan pair</em>) such that for every unitary representation \( (\pi, H) \) of \( G \): if there exists \( v \in H \) with \( \|\pi(s)v - v\| < \varepsilon \|v\| \) for all \( s \in Q \), then \( \pi \) has a non-zero invariant vector.</div>

Property (T) groups include lattices in higher-rank semisimple Lie groups (e.g., \( SL(n, \mathbb{Z}) \) for \( n \geq 3 \)), and Zuk's random groups with density \( > 1/3 \). The free groups do not have property (T). Property (T) is incompatible with amenability (unless \( G \) is finite).

<div class="theorem"><strong>Theorem 5.7.</strong> If \( G \) is an ICC group with property (T), then \( L(G) \) is a \( II_1 \) factor whose group of automorphisms \( \mathrm{Aut}(L(G)) \) is Polish, and the fundamental group \( \mathcal{F}(L(G)) = \{1\} \). In particular, \( L(G) \) cannot be isomorphic to any amplification \( L(G)^t \) for \( t \neq 1 \).</div>

This was used by Connes to provide the first examples of \( II_1 \) factors with trivial fundamental group, a major structure theorem.

## 5.5 Free Probability and Free Group Factors

Voiculescu's free probability theory provides the most powerful modern tools for studying \( L(\mathbb{F}_n) \). In free probability, the role of independence is played by freeness: two subalgebras \( A_1, A_2 \subseteq (M, \tau) \) are <em>free</em> if \( \tau(a_1 b_1 a_2 b_2 \cdots) = 0 \) whenever \( \tau(a_i) = \tau(b_j) = 0 \) and the terms alternate between \( A_1 \) and \( A_2 \).

Free independence models the behavior of large random matrices: the free central limit theorem yields the semicircle law, and free convolution replaces classical convolution for spectral distributions. Voiculescu showed that the generators of \( \mathbb{F}_n \) are freely independent in \( L(\mathbb{F}_n) \) with respect to \( \tau \), providing a powerful algebraic calculus for these factors.

---

# Chapter 6: Dynamical Systems and Crossed Products

## 6.1 Group Actions on C*-Algebras

<div class="definition"><strong>Definition 6.1.</strong> A (discrete) <em>group action} or <em>C*-dynamical system</em> is a triple \( (A, G, \alpha) \) where \( A \) is a C*-algebra, \( G \) is a discrete group, and \( \alpha : G \to \mathrm{Aut}(A) \) is a group homomorphism.</div>

Standard examples include:
- \( A = C(X) \) with \( G \curvearrowright X \) by homeomorphisms (topological dynamics).
- \( A = L^\infty(X, \mu) \) with \( G \curvearrowright (X, \mu) \) by measure-preserving transformations (ergodic theory).
- \( A = B(H) \) with \( G \) acting by conjugation by unitaries (inner automorphisms).

## 6.2 The Crossed Product Construction

<div class="definition"><strong>Definition 6.2 (Full Crossed Product).</strong> Given \( (A, G, \alpha) \), the <em>full crossed product} \( A \rtimes_\alpha G \) is the universal C*-algebra generated by a copy of \( A \) and unitaries \( \{u_g\}_{g \in G} \) subject to the covariance relation

\[
u_g a u_g^* = \alpha_g(a) \quad \text{for all } g \in G,\; a \in A.
\]
More precisely, \( A \rtimes_\alpha G \) is the completion of the algebraic crossed product (all finite sums \( \sum_{g \in G} a_g u_g \)) under the largest C*-norm for which all covariant representations are contractive.</div>

A <em>covariant representation</em> of \( (A, G, \alpha) \) on a Hilbert space \( H \) is a pair \( (\pi, u) \) where \( \pi : A \to B(H) \) is a *-representation and \( u : G \to \mathcal{U}(H) \) is a unitary representation satisfying \( \pi(\alpha_g(a)) = u_g \pi(a) u_g^* \).

<div class="definition"><strong>Definition 6.3 (Reduced Crossed Product).</strong> The <em>reduced crossed product} \( A \rtimes_{\alpha, r} G \) is the closure of the algebraic crossed product in the representation on \( \ell^2(G) \otimes H_\pi \) (where \( \pi : A \to B(H_\pi) \) is faithful) defined by

\[
\left(\pi_r\left(\sum_g a_g u_g\right) \xi\right)(s) = \sum_g \pi(\alpha_{s^{-1}}(a_g)) \xi(g^{-1} s).
\]
</div>

As with group C*-algebras, the full and reduced crossed products coincide when \( G \) is amenable or when the action is amenable in a suitable sense.

## 6.3 Examples

<div class="example"><strong>Example 6.4 (Group C*-algebras as crossed products).</strong> When \( A = \mathbb{C} \) (and the action is necessarily trivial), the crossed product \( \mathbb{C} \rtimes G \cong C^*(G) \). This makes the crossed product construction a generalization of the group C*-algebra construction.</div>

<div class="example"><strong>Example 6.5 (Irrational rotations).</strong> Let \( \theta \in \mathbb{R} \setminus \mathbb{Q} \), \( A = C(\mathbb{T}) \), and \( \alpha : \mathbb{Z} \to \mathrm{Aut}(C(\mathbb{T})) \) by \( \alpha_n(f)(z) = f(e^{-2\pi i n \theta} z) \). The crossed product \( C(\mathbb{T}) \rtimes_\alpha \mathbb{Z} \) is the <em>irrational rotation algebra} \( A_\theta \), also known as the noncommutative torus. It is a simple nuclear C*-algebra, with a unique tracial state. Its K-theory distinguishes the algebras: \( K_0(A_\theta) \cong \mathbb{Z} + \theta \mathbb{Z} \subseteq \mathbb{R} \).</div>

<div class="example"><strong>Example 6.6 (Crossed products from free groups).</strong> The Cuntz algebra \( \mathcal{O}_n \) arises as the crossed product \( \mathcal{O}_n \cong C(\partial \mathbb{F}_n) \rtimes \mathbb{F}_n \) where \( \partial \mathbb{F}_n \) is the boundary of the Cayley graph of \( \mathbb{F}_n \). This realizes the Cuntz algebra — a purely infinite simple nuclear C*-algebra — from the boundary action of the free group.</div>

## 6.4 Morita Equivalence

<div class="definition"><strong>Definition 6.7 (Morita Equivalence).</strong> Two C*-algebras \( A \) and \( B \) are <em>Morita equivalent</em> if there exists an \( A \)-\( B \) imprimitivity bimodule: a Hilbert \( A \)-\( B \)-bimodule \( X \) with full left and right inner products. Equivalently, \( A \) and \( B \) have isomorphic categories of Hilbert modules.</div>

Morita equivalence is coarser than isomorphism but preserves K-theory, representation theory (in a suitable sense), nuclearity, and many other C*-algebraic properties. Crossed products by different but Morita equivalent group actions are often Morita equivalent, and Green's theorem gives precise conditions.

<div class="theorem"><strong>Theorem 6.8 (Green's Imprimitivity Theorem).</strong> Let \( G \) act on a locally compact space \( X \), and let \( H \leq G \) be a closed subgroup. Then \( C_0(X) \rtimes H \) is Morita equivalent to \( C_0(X/H) \rtimes G \) (under suitable properness conditions).</div>

---

# Chapter 7: Kadison's Similarity Problem

## 7.1 Background and Formulation

One of the deepest open problems in the theory of C*-algebras is whether every bounded (not necessarily *-) representation of a C*-algebra is similar to a *-representation.

<div class="definition"><strong>Definition 7.1.</strong> Let \( A \) be a C*-algebra and \( \pi : A \to B(H) \) a bounded algebra homomorphism (not assumed to preserve the involution). We say \( \pi \) is <em>similar to a *-representation</em> if there exists an invertible operator \( S \in B(H) \) such that \( S^{-1} \pi(a) S \) is a *-homomorphism.</div>

<div class="definition"><strong>Definition 7.2 (Kadison's Similarity Problem, 1955).</strong> Is every bounded representation of a C*-algebra on a Hilbert space similar to a *-representation?</div>

Equivalently: is every C*-algebra <em>symmetrically amenable</em>? Kadison's problem is also known as the <em>similarity problem</em> or the <em>derivation problem</em> (via its reformulation in terms of derivations and cohomology).

## 7.2 Reformulations in Terms of Completely Bounded Maps

The key insight connecting Kadison's problem to the theory of completely bounded maps is:

<div class="theorem"><strong>Theorem 7.3 (Haagerup, 1980).</strong> A bounded representation \( \pi : A \to B(H) \) is similar to a *-representation if and only if \( \pi \) is completely bounded. Moreover, \( \pi \) is similar to a *-representation via an invertible \( S \) with \( \|S\| \cdot \|S^{-1}\| \leq c \) if and only if \( \|\pi\|_{cb} \leq c \).</div>

Thus, Kadison's problem is equivalent to: is every bounded representation of a C*-algebra automatically completely bounded?

<div class="theorem"><strong>Theorem 7.4 (Pisier).</strong> The similarity problem is equivalent to the question of whether every bounded derivation \( \delta : A \to B(H) \) (satisfying \( \delta(ab) = \delta(a)\pi(b) + \pi(a)\delta(b) \)) is automatically completely bounded (equivalently, inner).</div>

This connects the similarity problem to the first cohomology group \( H^1(A, B(H)) \) of \( A \) with coefficients in \( B(H) \). The problem asks whether \( H^1(A, B(H)) = 0 \) for all C*-algebras \( A \) and all representations \( A \to B(H) \).

## 7.3 Partial Positive Results

<div class="theorem"><strong>Theorem 7.5 (Bunce, 1972; Haagerup, 1980).</strong> The similarity problem has a positive answer for:
<ol>
  <li>Amenable C*-algebras (in particular, nuclear C*-algebras and group C*-algebras of amenable groups).</li>
  <li>C*-algebras generated by amenable groups.</li>
  <li>Representations of length bounded by an absolute constant (Pisier's length theory).</li>
</ol>
</div>

<div class="theorem"><strong>Theorem 7.6 (Pisier's Length Theorem).</strong> Every bounded representation \( \pi \) of a C*-algebra has <em>length at most 3</em>: there exist CP maps \( \phi_0, \phi_1, \phi_2 : A \to B(H) \) such that \( \pi(a) = \phi_0(a) S^{-1} \phi_1(a) S^{-1} \phi_2(a) \) for an appropriate intertwining operator \( S \). In particular, every bounded representation is the product of at most three CP maps.</div>

## 7.4 Connections to Cohomology and Open Questions

Define the <em>cyclic cohomology} of a C*-algebra \( A \). The second Hochschild cohomology group \( H^2(A, A^*) \) has been shown to vanish for nuclear C*-algebras, and its vanishing is related to Kadison's problem via:

<div class="theorem"><strong>Theorem 7.7 (Johnson, 1972).</strong> A Banach algebra \( A \) is <em>amenable} (in the sense of Johnson) if \( H^1(A, X^*) = 0 \) for every Banach \( A \)-bimodule \( X \). C*-algebras of amenable groups are amenable Banach algebras.</div>

The similarity problem remains open in full generality. The prevailing conjecture, supported by extensive partial evidence, is that the answer is yes — but the general case remains one of the most prominent open problems in operator algebra theory.

---

# Chapter 8: Reductivity and Invariant Subspaces

## 8.1 The Reductive Algebra Problem

Let \( T \in B(H) \) be a bounded operator. The <em>invariant subspace problem</em> asks whether every \( T \in B(H) \) on an infinite-dimensional Hilbert space \( H \) has a non-trivial closed invariant subspace. This remains open for operators on separable infinite-dimensional Hilbert spaces over \( \mathbb{C} \).

The <em>reductive algebra problem</em> is a related but stronger question:

<div class="definition"><strong>Definition 8.1 (Reductive Algebra).</strong> A subalgebra \( \mathcal{A} \subseteq B(H) \) is <em>reductive</em> if every invariant subspace of \( \mathcal{A} \) (closed subspace invariant under every \( T \in \mathcal{A} \)) is also reducing (reducing for every \( T \in \mathcal{A} \): both \( M \) and \( M^\perp \) are invariant).</div>

<div class="definition"><strong>Definition 8.2 (Reductive Algebra Problem).</strong> Is every reductive subalgebra \( \mathcal{A} \subseteq B(H) \) (closed in some operator topology) a von Neumann algebra?</div>

An affirmative answer would imply the invariant subspace problem, since for a von Neumann algebra every invariant subspace reduces. The reductive algebra problem remains open.

## 8.2 Strongly Reductive Algebras

<div class="definition"><strong>Definition 8.3.</strong> A subalgebra \( \mathcal{A} \subseteq B(H) \) is <em>strongly reductive</em> if every subspace invariant under \( \mathcal{A} \) is reducing. It is <em>total reductive</em> if every operator in \( \mathcal{A}' \) (the commutant) is normal.</div>

<div class="theorem"><strong>Theorem 8.4 (Rosenthal–Loginov, 1970s).</strong> If \( \mathcal{A} \subseteq B(H) \) is strongly reductive and contains a maximal abelian self-adjoint algebra (masa), then \( \mathcal{A} = B(H) \). In particular, the question reduces to algebras with special structure.</div>

## 8.3 Gifford's Total Reduction Property

<div class="definition"><strong>Definition 8.5 (Total Reduction Property, Gifford).</strong> An operator \( T \in B(H) \) has the <em>total reduction property</em> (TRP) if \( W^*(T) = W^*(T)' \), equivalently if every invariant subspace of \( T \) reduces \( T \).</div>

Gifford's work (2006) classified operators with the TRP as precisely the normal operators — connecting this purely operator-theoretic notion to the classical spectral theorem:

<div class="theorem"><strong>Theorem 8.6 (Gifford, 2006).</strong> An operator \( T \in B(H) \) has the total reduction property if and only if \( T \) is normal.</div>

This theorem provides a complete characterization of TRP and settles the reductive algebra question for single operators: the reductive algebra generated by a single operator is a von Neumann algebra precisely when the operator is normal.

## 8.4 Almost Invariant Subspaces

A fundamental obstruction to the existence of invariant subspaces is the notion of almost invariance.

<div class="definition"><strong>Definition 8.7 (Almost Invariant Subspace).</strong> A closed subspace \( M \subseteq H \) is <em>almost invariant} under \( T \in B(H) \) if the compression \( P_{M^\perp} T|_M : M \to M^\perp \) is compact (a compact perturbation of invariance). It is <em>hyperinvariant} if it is invariant under every operator in the commutant \( \{T\}' \).</div>

<div class="theorem"><strong>Theorem 8.8 (Popov–Tcaciuc, 2013).</strong> Every operator \( T \in B(H) \) on an infinite-dimensional Hilbert space has a non-trivial almost invariant subspace.</div>

<div class="proof"><strong>Proof outline.</strong> The proof uses a compactness argument and the spectral theory of the essential spectrum. Key ingredient: the Calkin algebra \( B(H)/K(H) \) provides the correct setting, and the image of \( T \) in the Calkin algebra either has a non-trivial invariant subspace (lifting gives an almost invariant subspace for \( T \)) or is a scalar, in which case \( T - \lambda I \) is compact and a direct construction applies.</div>

<div class="remark"><strong>Remark 8.9.</strong> The Popov–Tcaciuc theorem does not resolve the invariant subspace problem, but shows that every operator is "close" to having an invariant subspace. The question is whether approximate invariance can be made exact without perturbation.</div>

## 8.5 The Invariant Subspace Problem — Current Status

The invariant subspace problem is:
- <strong>Resolved affirmatively</strong> for: compact operators (von Neumann, 1930s), polynomially compact operators (Bernstein–Robinson, 1966), operators on Hilbert spaces with spectrum in a curve (Apostol–Foias), normal operators (trivially, by the spectral theorem), operators satisfying \( \|p(T)\| \leq \|p\|_\infty \) for polynomials (contractions with rich spectrum).
- <strong>Resolved negatively</strong> for operators on Banach spaces: Read (1984) constructed a bounded operator on \( \ell^1(\mathbb{N}) \) with no non-trivial invariant subspace; Enflo gave a similar construction on a (different) Banach space.
- <strong>Open</strong> for operators on separable infinite-dimensional Hilbert spaces over \( \mathbb{C} \).

---

# Chapter 9: Approximation Properties and Classification

## 9.1 The Completely Bounded Approximation Property

<div class="definition"><strong>Definition 9.1 (CBAP).</strong> A C*-algebra \( A \) has the <em>completely bounded approximation property</em> (CBAP) with constant \( C \) if there is a net of finite-rank CB maps \( \phi_\alpha : A \to A \) with \( \|\phi_\alpha\|_{cb} \leq C \) and \( \phi_\alpha(a) \to a \) for all \( a \in A \). The infimum of such constants is the <em>Haagerup constant} \( \Lambda_{cb}(A) \).</div>

Nuclear C*-algebras have the CBAP with constant 1 (using the CPAP). The CBAP with constant 1 is equivalent to nuclearity for C*-algebras. The reduced C*-algebra of any amenable group has CBAP with constant 1. The reduced C*-algebra \( C^*_r(\mathbb{F}_n) \) has the CBAP with constant 1 (by a deep theorem of Haagerup, 1979, using a completely positive Herz–Schur multiplier approximation).

## 9.2 Exactness

<div class="definition"><strong>Definition 9.2 (Exact C*-Algebra).</strong> A C*-algebra \( A \) is <em>exact} if the functor \( A \otimes_{\min} - \) is exact: for every short exact sequence \( 0 \to I \to B \to B/I \to 0 \) of C*-algebras,

\[
0 \to A \otimes_{\min} I \to A \otimes_{\min} B \to A \otimes_{\min} B/I \to 0
\]
is exact.</div>

Every nuclear C*-algebra is exact. The class of exact C*-algebras is strictly larger: \( C^*_r(\mathbb{F}_n) \) is exact but not nuclear. Exactness is equivalent to the existence of a locally finite-dimensional approximation (Kirchberg–Phillips), and is equivalent to having a completely isometric embedding into the Cuntz algebra \( \mathcal{O}_2 \).

## 9.3 The Haagerup Property

<div class="definition"><strong>Definition 9.3 (Haagerup Property for Groups).</strong> A discrete group \( G \) has the <em>Haagerup property} (also called a-T-menability, Gromov) if it admits a proper affine isometric action on a Hilbert space, equivalently if it has a sequence of positive definite functions vanishing at infinity converging pointwise to 1.</div>

Groups with the Haagerup property include: all amenable groups, free groups \( \mathbb{F}_n \), \( SL(2, \mathbb{Z}) \), Coxeter groups, Thompson's group \( F \). The Haagerup property is incompatible with property (T) (unless the group is compact). For C*-algebras, the Haagerup property has an analogue via the notion of the Haagerup norm on the C*-algebra.

<div class="theorem"><strong>Theorem 9.4.</strong> If \( G \) has the Haagerup property, then \( C^*_r(G) \) has the CBAP with constant 1 (hence has the approximation property in the operator space sense).</div>

## 9.4 Ozawa's Solid Factors and Bi-Exactness

Ozawa introduced a dramatic strengthening of exactness for von Neumann algebras:

<div class="definition"><strong>Definition 9.5 (Solid Von Neumann Algebra).</strong> A finite von Neumann algebra \( M \) is <em>solid} if for every diffuse subalgebra \( A \subseteq M \) (one with no minimal projections), the relative commutant \( A' \cap M \) is injective.</div>

<div class="theorem"><strong>Theorem 9.6 (Ozawa, 2003).</strong> The free group factor \( L(\mathbb{F}_n) \) is solid. As a corollary, \( L(\mathbb{F}_n) \) has no Cartan subalgebra (since if it did, the relative commutant of a diffuse abelian subalgebra would be \( L(\mathbb{F}_n) \) itself, which is not injective).</div>

The proof uses the <em>bi-exactness</em> of \( \mathbb{F}_n \): the group ring \( \mathbb{C}[\mathbb{F}_n] \) acts amenably on itself from both the left and right simultaneously. This idea, originating from the study of the boundary of the Cayley graph of \( \mathbb{F}_n \), is now a central tool in the deformation/rigidity theory initiated by Popa.

## 9.5 The Toms–Winter Conjecture and Classification

The Elliott programme seeks to classify simple separable nuclear C*-algebras by K-theoretic invariants. The classification conjecture has been formulated and refined over the last four decades.

<div class="definition"><strong>Definition 9.6 (Toms–Winter Conjecture).</strong> Let \( A \) be a simple separable unital nuclear C*-algebra. The following regularity properties are conjectured to be equivalent:
<ol>
  <li>\( A \) is \( \mathcal{Z} \)-stable: \( A \otimes \mathcal{Z} \cong A \), where \( \mathcal{Z} \) is the Jiang–Su algebra.</li>
  <li>\( A \) has finite nuclear dimension: \( \dim_{nuc}(A) < \infty \).</li>
  <li>\( A \) has strict comparison: the Cuntz semigroup satisfies the strict comparison property.</li>
</ol>
</div>

The Toms–Winter conjecture is now almost fully resolved:

<div class="theorem"><strong>Theorem 9.7 (Castillejos–Evington–Tikuisis–White–Winter, 2021).</strong> For a simple separable unital nuclear C*-algebra \( A \), conditions (1), (2), and (3) of the Toms–Winter conjecture are equivalent.</div>

<div class="theorem"><strong>Theorem 9.8 (Gong–Lin–Niu, Castillejos et al., 2020–2021).</strong> Every simple separable unital nuclear \( \mathcal{Z} \)-stable C*-algebra satisfying the Universal Coefficient Theorem (UCT) is classified by its Elliott invariant

\[
\mathrm{Ell}(A) = (K_0(A), K_0(A)_+, [1_A], K_1(A), T(A), \rho_A),
\]
where \( T(A) \) is the Choquet simplex of tracial states and \( \rho_A : K_0(A) \to \mathrm{Aff}(T(A)) \) is the pairing map.</div>

This classification theorem subsumes the work of Kirchberg and Phillips on purely infinite simple nuclear C*-algebras (those with no tracial states), and extends it to the stably finite case. The classification machinery involves \( KK \)-theory (Kasparov), the Universal Coefficient Theorem (Rosenberg–Schochet), and the theory of \( \mathcal{Z} \)-stability developed by Toms, Winter, and collaborators.

## 9.6 Summary: The Hierarchy of Approximation Properties

The key approximation properties are ordered as follows for C*-algebras:

\[
\text{Nuclear} \Rightarrow \text{Exact} \Rightarrow \text{CBAP} \Rightarrow \text{Weak Expectation Property (WEP)}
\]

with none of the implications reversing in general. For group C*-algebras:

\[
\text{Amenable} \Rightarrow \text{Haagerup Property} \Rightarrow \text{Exact} \not\Rightarrow \text{Amenable}
\]

The Higson–Kasparov theorem connects the Haagerup property to the Baum–Connes conjecture: groups with the Haagerup property satisfy the Baum–Connes conjecture with coefficients, which has profound implications for the K-theory of group C*-algebras and for the Novikov conjecture in differential topology.

---

# Chapter 10: Integration and Further Perspectives

## 10.1 The Interplay of Themes

The subjects covered in this course form an interlocking web of ideas. The following diagram of implications and equivalences summarizes the main structural connections:

**Group theory ↔ C*-algebra theory:**
- \( G \) amenable \( \Leftrightarrow \) \( C^*_r(G) \) nuclear \( \Leftrightarrow \) \( C^*(G) \cong C^*_r(G) \)
- \( G \) has property (T) \( \Rightarrow \) \( L(G) \) has trivial fundamental group (for ICC \( G \))
- \( G \) has Haagerup property \( \Rightarrow \) \( C^*_r(G) \) has CBAP with constant 1

**Representation theory ↔ Completely positive maps:**
- Every unitary representation extends to a *-representation of \( C^*(G) \)
- Every bounded representation is similar to a *-rep if and only if it is completely bounded (Haagerup)
- Kadison's problem: bounded rep \( \Rightarrow^{?} \) similar to *-rep

**Nuclearity ↔ Classification:**
- Nuclear + UCT + \( \mathcal{Z} \)-stable \( \Rightarrow \) classified by Elliott invariant
- Nuclearity ensures the Künneth theorem in K-theory

## 10.2 Corollaries and Applications

<div class="theorem"><strong>Theorem 10.1 (Atiyah's \( L^2 \)-index theorem).</strong> For a cocompact lattice \( \Gamma \leq G \) in a Lie group, the \( L^2 \)-Betti numbers are defined using the trace on \( L(\Gamma) \) and satisfy an index theorem generalizing the Atiyah–Singer index theorem. The appropriate algebraic tool is the \( L(\Gamma) \)-dimension of \( \ell^2 \)-cohomology groups.</div>

<div class="theorem"><strong>Theorem 10.2 (Baum–Connes Conjecture, partial results).</strong> For groups with the Haagerup property, or torsion-free hyperbolic groups, or many other classes, the assembly map

\[
\mu : K^{\mathrm{top}}_*(G) \to K_*(C^*_r(G))
\]
is an isomorphism. This has implications for the Novikov conjecture (homotopy invariance of higher signatures) and the Borel conjecture (rigidity of aspherical manifolds).</div>

## 10.3 Open Problems

We close with a selection of open problems that represent the frontiers of the subject:

1. **Kadison's Similarity Problem**: Is every bounded representation of a C*-algebra similar to a *-representation?

2. **The Free Group Factor Problem**: Is \( L(\mathbb{F}_2) \cong L(\mathbb{F}_3) \)? More generally, are the free group factors \( L(\mathbb{F}_n) \) pairwise non-isomorphic for different \( n \)?

3. **The Invariant Subspace Problem**: Does every bounded operator on an infinite-dimensional separable Hilbert space over \( \mathbb{C} \) have a non-trivial closed invariant subspace?

4. **The UCT Problem**: Does every simple separable nuclear C*-algebra satisfy the Universal Coefficient Theorem?

5. **Connes' Embedding Problem** (recently resolved in the negative by Ji–Natarajan–Vidick–Wright–Yuen, 2020): The MIP* = RE theorem shows that Connes' embedding conjecture — that every finite von Neumann algebra embeds in an ultrapower of the hyperfinite \( II_1 \) factor — is false.

6. **The Reductive Algebra Problem**: Is every reductive operator algebra a von Neumann algebra?

Each of these problems sits at the intersection of multiple mathematical disciplines: geometric group theory, K-theory, quantum information, ergodic theory, and representation theory. The framework of C*-algebras and operator algebras provides the unifying language.

---

## Appendix: Notation and Conventions

Throughout these notes, the following conventions are in force:

- All Hilbert spaces are complex and separable unless otherwise stated.
- C*-algebras are assumed separable unless explicitly noted.
- \( B(H) \) denotes bounded operators; \( K(H) \) denotes compact operators.
- \( \mathcal{U}(H) \) denotes the unitary group.
- \( M_n = M_n(\mathbb{C}) \) is the algebra of \( n \times n \) complex matrices.
- \( \mathbb{F}_n \) is the free group on \( n \) generators.
- \( \mathcal{Z} \) is the Jiang–Su algebra (the unique simple unital separable nuclear infinite-dimensional \( \mathcal{Z} \)-stable C*-algebra with the same K-theory as \( \mathbb{C} \)).
- \( \mathcal{R} \) is the hyperfinite \( II_1 \) factor.
- GNS stands for Gelfand–Naimark–Segal.
- CP: completely positive; CB: completely bounded; CBAP: completely bounded approximation property; WOT: weak operator topology; SOT: strong operator topology.
