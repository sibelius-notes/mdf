---
title: "PMATH 945: Modern Algebraic Geometry"
subjects: PMATH
prof: Ben Webster
---

## Sources and References

- Hartshorne, Robin. *Algebraic Geometry*. Graduate Texts in Mathematics 52, Springer, 1977. (Primary reference; Chapters II–IV.)
- Vakil, Ravi. *The Rising Sea: Foundations of Algebraic Geometry*. Publicly available draft, math.stanford.edu/~vakil/216blog/. (Comprehensive modern treatment with excellent motivation.)
- Mumford, David. *The Red Book of Varieties and Schemes*. Lecture Notes in Mathematics 1358, Springer, 1999.
- Eisenbud, David and Joe Harris. *The Geometry of Schemes*. Graduate Texts in Mathematics 197, Springer, 2000.
- Sernesi, Edoardo. *Deformations of Algebraic Schemes*. Grundlehren der Mathematischen Wissenschaften 334, Springer, 2006.
- Atiyah, M.F. and I.G. Macdonald. *Introduction to Commutative Algebra*. Addison-Wesley, 1969.

---

# Chapter 1: Sheaves and Ringed Spaces

## 1.1 Presheaves and Sheaves

The language of sheaves is the foundational toolkit of modern algebraic geometry. A sheaf encodes the idea that local data can be consistently patched together to yield global data, and that global data is completely determined by its local restrictions. This principle — locality of data and locality of agreement — underpins everything from the structure sheaf of a scheme to cohomological machinery.

<div class="definition"><strong>Definition (Presheaf).</strong> Let \( X \) be a topological space. A <em>presheaf of abelian groups</em> \( \mathcal{F} \) on \( X \) consists of:
<ol>
<li>For each open set \( U \subseteq X \), an abelian group \( \mathcal{F}(U) \), whose elements are called <em>sections</em> of \( \mathcal{F} \) over \( U \).</li>
<li>For each inclusion \( V \subseteq U \) of open sets, a <em>restriction homomorphism</em> \( \rho_{UV} : \mathcal{F}(U) \to \mathcal{F}(V) \), satisfying \( \rho_{UU} = \mathrm{id} \) and \( \rho_{UW} = \rho_{VW} \circ \rho_{UV} \) whenever \( W \subseteq V \subseteq U \).</li>
</ol>
We write \( s|_V \) for \( \rho_{UV}(s) \) when \( s \in \mathcal{F}(U) \). The group \( \mathcal{F}(\emptyset) \) is conventionally taken to be the trivial group.</div>

One can analogously define presheaves of rings, sets, modules over a fixed ring, and so on. The presheaf axioms amount to saying that \( \mathcal{F} \) is a contravariant functor from the category \( \mathbf{Open}(X) \) (objects: open sets of \( X \); morphisms: inclusions) to the target category.

A presheaf is not, by itself, a satisfactory geometric object: it may fail to detect when local sections agree, and it may fail to guarantee that compatible local sections glue. These two conditions define a sheaf.

<div class="definition"><strong>Definition (Sheaf).</strong> A presheaf \( \mathcal{F} \) on \( X \) is a <em>sheaf</em> if for every open cover \( \{U_i\} \) of an open set \( U \), the following two conditions hold:
<ol>
<li><em>(Identity axiom)</em> If \( s, t \in \mathcal{F}(U) \) satisfy \( s|_{U_i} = t|_{U_i} \) for all \( i \), then \( s = t \).</li>
<li><em>(Gluing axiom)</em> If sections \( s_i \in \mathcal{F}(U_i) \) satisfy \( s_i|_{U_i \cap U_j} = s_j|_{U_i \cap U_j} \) for all \( i, j \), then there exists \( s \in \mathcal{F}(U) \) with \( s|_{U_i} = s_i \) for all \( i \).</li>
</ol></div>

Together, these say that \( \mathcal{F}(U) \) is the <em>equalizer</em> of the two maps

\[
\prod_i \mathcal{F}(U_i) \rightrightarrows \prod_{i,j} \mathcal{F}(U_i \cap U_j).
\]

<div class="example"><strong>Example.</strong> The sheaf \( \mathcal{O}_X \) of continuous real-valued functions on a topological space \( X \) is a sheaf of rings: \( \mathcal{O}_X(U) = \{ f : U \to \mathbb{R} \mid f \text{ is continuous} \} \), with the usual pointwise ring structure. The identity and gluing axioms are immediate from the definition of continuity. Similarly, on a smooth manifold, the sheaf of smooth functions \( C^\infty_X \) is a sheaf of rings, and the sheaf of smooth \( k \)-forms is a sheaf of abelian groups.</div>

<div class="example"><strong>Example (Skyscraper sheaf).</strong> Let \( x \in X \) and \( A \) an abelian group. The <em>skyscraper sheaf</em> at \( x \) with value \( A \) is defined by

\[
\mathcal{F}(U) = \begin{cases} A & \text{if } x \in U, \\ 0 & \text{if } x \notin U. \end{cases}
\]
This is a sheaf. It will later appear as the structure sheaf of a closed point.</div>

## 1.2 Stalks

The stalk of a sheaf at a point captures all local information near that point.

<div class="definition"><strong>Definition (Stalk).</strong> Let \( \mathcal{F} \) be a presheaf on \( X \) and \( x \in X \). The <em>stalk</em> of \( \mathcal{F} \) at \( x \) is the direct limit (colimit)

\[
\mathcal{F}_x = \varinjlim_{U \ni x} \mathcal{F}(U),
\]
where the colimit is taken over all open sets \( U \) containing \( x \), ordered by reverse inclusion.</div>

Concretely, an element of \( \mathcal{F}_x \) is an equivalence class \( (U, s) \) where \( U \ni x \) is open and \( s \in \mathcal{F}(U) \), with \( (U, s) \sim (V, t) \) if there exists an open \( W \subseteq U \cap V \) with \( x \in W \) and \( s|_W = t|_W \). Such an equivalence class is called a <em>germ</em> of \( \mathcal{F} \) at \( x \).

Stalks are essential for checking whether a morphism of sheaves is an isomorphism: a morphism \( \phi : \mathcal{F} \to \mathcal{G} \) is an isomorphism of sheaves if and only if the induced map on stalks \( \phi_x : \mathcal{F}_x \to \mathcal{G}_x \) is an isomorphism for every \( x \in X \).

## 1.3 Sheafification

Not every presheaf is a sheaf, but every presheaf has a universal sheafification.

<div class="theorem"><strong>Theorem (Sheafification).</strong> For any presheaf \( \mathcal{F} \) on \( X \), there exists a sheaf \( \mathcal{F}^+ \) and a morphism \( \theta : \mathcal{F} \to \mathcal{F}^+ \) of presheaves such that for any sheaf \( \mathcal{G} \) and any morphism \( \phi : \mathcal{F} \to \mathcal{G} \) of presheaves, there is a unique morphism \( \psi : \mathcal{F}^+ \to \mathcal{G} \) with \( \phi = \psi \circ \theta \). The sheaf \( \mathcal{F}^+ \) is called the <em>sheafification</em> of \( \mathcal{F} \).</div>

The sheafification can be constructed explicitly: sections of \( \mathcal{F}^+(U) \) are functions assigning to each \( x \in U \) a germ \( s_x \in \mathcal{F}_x \), subject to the condition that these germs are locally represented by actual sections of \( \mathcal{F} \). The sheafification has the same stalks as the original presheaf: \( (\mathcal{F}^+)_x \cong \mathcal{F}_x \) for all \( x \).

## 1.4 Morphisms of Sheaves and Exact Sequences

<div class="definition"><strong>Definition.</strong> A <em>morphism of presheaves</em> (or sheaves) \( \phi : \mathcal{F} \to \mathcal{G} \) on \( X \) consists of a group homomorphism \( \phi_U : \mathcal{F}(U) \to \mathcal{G}(U) \) for each open \( U \), compatible with restrictions: \( \phi_V \circ \rho_{UV}^\mathcal{F} = \rho_{UV}^\mathcal{G} \circ \phi_U \) for all \( V \subseteq U \).</div>

The category \( \mathbf{Sh}(X) \) of sheaves of abelian groups on \( X \) is an abelian category. The kernel of \( \phi \) is the sheaf \( U \mapsto \ker(\phi_U) \); the image and cokernel require sheafification of the corresponding presheaves. A sequence \( \mathcal{F} \to \mathcal{G} \to \mathcal{H} \) is exact in \( \mathbf{Sh}(X) \) if and only if the induced sequence of stalks is exact at every point.

## 1.5 Locally Ringed Spaces

<div class="definition"><strong>Definition (Ringed Space).</strong> A <em>ringed space</em> is a pair \( (X, \mathcal{O}_X) \) where \( X \) is a topological space and \( \mathcal{O}_X \) is a sheaf of commutative rings on \( X \), called the <em>structure sheaf</em>.</div>

<div class="definition"><strong>Definition (Locally Ringed Space).</strong> A ringed space \( (X, \mathcal{O}_X) \) is <em>locally ringed</em> if for every point \( x \in X \), the stalk \( \mathcal{O}_{X,x} \) is a local ring. A morphism of locally ringed spaces \( (f, f^\#) : (X, \mathcal{O}_X) \to (Y, \mathcal{O}_Y) \) is a continuous map \( f : X \to Y \) together with a morphism \( f^\# : \mathcal{O}_Y \to f_* \mathcal{O}_X \) of sheaves of rings such that for each \( x \in X \), the induced ring map \( \mathcal{O}_{Y, f(x)} \to \mathcal{O}_{X,x} \) is a <em>local ring homomorphism</em> (i.e., it maps the maximal ideal into the maximal ideal).</div>

Here \( f_* \mathcal{O}_X \) is the <em>pushforward sheaf</em>: \( (f_* \mathcal{O}_X)(V) = \mathcal{O}_X(f^{-1}(V)) \) for open \( V \subseteq Y \). The locality condition on stalk maps is what distinguishes morphisms of locally ringed spaces from mere morphisms of ringed spaces. It encodes the idea that a regular function that vanishes at a point pulls back to a function that vanishes at the preimage.

---

# Chapter 2: Affine Schemes

## 2.1 The Spectrum of a Ring

Let \( A \) be a commutative ring with unity. The <em>prime spectrum</em> of \( A \) is the fundamental geometric object associated to \( A \).

<div class="definition"><strong>Definition (Spec).</strong> The <em>spectrum</em> \( \mathrm{Spec}(A) \) is the set of all prime ideals of \( A \), equipped with the <em>Zariski topology</em>, in which the closed sets are of the form

\[
V(\mathfrak{a}) = \{ \mathfrak{p} \in \mathrm{Spec}(A) \mid \mathfrak{a} \subseteq \mathfrak{p} \}
\]
for ideals \( \mathfrak{a} \subseteq A \). The complement of \( V(\mathfrak{a}) \) is the union of open sets \( D(f) = \mathrm{Spec}(A) \setminus V(f) \) for \( f \in A \), which form a basis for the topology.</div>

Note that \( V(A) = \emptyset \), \( V(0) = \mathrm{Spec}(A) \), \( V(\mathfrak{a}) \cup V(\mathfrak{b}) = V(\mathfrak{a} \cap \mathfrak{b}) \), and \( \bigcap_i V(\mathfrak{a}_i) = V(\sum_i \mathfrak{a}_i) \). The points of \( \mathrm{Spec}(A) \) correspond to prime ideals, not necessarily maximal: this is a crucial difference from classical algebraic geometry over algebraically closed fields, where one usually considers only maximal ideals.

<div class="example"><strong>Example.</strong> \( \mathrm{Spec}(\mathbb{Z}) \) has points \( (0), (2), (3), (5), (7), \ldots \) — the zero ideal (the generic point) and the prime ideals \( (p) \) for each prime \( p \). The closed points are \( (p) \) for primes \( p \), and the generic point \( (0) \) is dense. This illustrates how the spectrum interpolates between the geometric and arithmetic.

For a field \( k \), \( \mathrm{Spec}(k) \) is a single point, corresponding to the zero ideal. For \( k[x] \), the points are the irreducible polynomials and the generic point \( (0) \).</div>

## 2.2 The Structure Sheaf of an Affine Scheme

<div class="definition"><strong>Definition (Structure Sheaf).</strong> For \( A \) a commutative ring, define the <em>structure sheaf</em> \( \mathcal{O}_{\mathrm{Spec}(A)} \) on the basis of distinguished open sets \( \{ D(f) \}_{f \in A} \) by

\[
\mathcal{O}_{\mathrm{Spec}(A)}(D(f)) = A_f = A\left[\frac{1}{f}\right],
\]
the localization of \( A \) at the multiplicative set \( \{1, f, f^2, \ldots\} \). This extends uniquely to a sheaf of rings on all of \( \mathrm{Spec}(A) \).</div>

For general open sets, \( \mathcal{O}_{\mathrm{Spec}(A)}(U) = \varinjlim_{D(f) \subseteq U} A_f \). A key property is:

<div class="theorem"><strong>Theorem.</strong> Let \( A \) be a commutative ring and \( X = \mathrm{Spec}(A) \). Then:
<ol>
<li>For any \( f \in A \), \( \mathcal{O}_X(D(f)) \cong A_f \).</li>
<li>The stalk at a prime \( \mathfrak{p} \in X \) is \( \mathcal{O}_{X, \mathfrak{p}} \cong A_\mathfrak{p} \), the localization at \( \mathfrak{p} \).</li>
<li>The global sections \( \mathcal{O}_X(X) \cong A \).</li>
</ol>
In particular, each stalk is a local ring (the local ring \( A_\mathfrak{p} \) has unique maximal ideal \( \mathfrak{p} A_\mathfrak{p} \)), so \( (X, \mathcal{O}_X) \) is a locally ringed space.</div>

<div class="definition"><strong>Definition (Affine Scheme).</strong> An <em>affine scheme</em> is a locally ringed space \( (X, \mathcal{O}_X) \) that is isomorphic (as a locally ringed space) to \( (\mathrm{Spec}(A), \mathcal{O}_{\mathrm{Spec}(A)}) \) for some commutative ring \( A \).</div>

## 2.3 Morphisms of Affine Schemes and Ring Homomorphisms

The category of affine schemes is contravariantly equivalent to the category of commutative rings. This is the algebraic backbone of scheme theory.

<div class="theorem"><strong>Theorem.</strong> For commutative rings \( A \) and \( B \), there is a natural bijection

\[
\mathrm{Hom}_{\mathbf{Rings}}(A, B) \xrightarrow{\sim} \mathrm{Hom}_{\mathbf{LRS}}(\mathrm{Spec}(B), \mathrm{Spec}(A)).
\]
In other words, the functor \( A \mapsto \mathrm{Spec}(A) \) is a contravariant equivalence from the category of commutative rings to the category of affine schemes.</div>

<div class="proof"><strong>Proof sketch.</strong> Given a ring homomorphism \( \phi : A \to B \), define \( f = \mathrm{Spec}(\phi) : \mathrm{Spec}(B) \to \mathrm{Spec}(A) \) by \( f(\mathfrak{q}) = \phi^{-1}(\mathfrak{q}) \). (The preimage of a prime under a ring map is prime.) The sheaf map \( f^\# : \mathcal{O}_{\mathrm{Spec}(A)} \to f_* \mathcal{O}_{\mathrm{Spec}(B)} \) comes from \( \phi \) itself, extended by universal properties of localization. The locality condition on stalks is satisfied because \( \phi^{-1}(\mathfrak{q}) \cdot A_{\phi^{-1}(\mathfrak{q})} \) maps into \( \mathfrak{q} B_\mathfrak{q} \). Conversely, any morphism of locally ringed spaces \( \mathrm{Spec}(B) \to \mathrm{Spec}(A) \) induces a ring map \( A = \mathcal{O}(X) \to \mathcal{O}(Y) = B \) on global sections, and this is inverse to the above construction.</div>

## 2.4 The Functor of Points

A powerful perspective on schemes — especially useful for functorial constructions — is the functor of points.

<div class="definition"><strong>Definition (Functor of Points).</strong> For a scheme \( X \), its <em>functor of points</em> is the functor \( h_X : \mathbf{Sch}^{\mathrm{op}} \to \mathbf{Set} \) defined by \( h_X(T) = \mathrm{Hom}_{\mathbf{Sch}}(T, X) \). An element \( T \to X \) is called a <em>\( T \)-valued point</em> of \( X \). By Yoneda's lemma, \( X \) is determined up to isomorphism by \( h_X \).</div>

For an affine scheme \( X = \mathrm{Spec}(A) \), we have \( h_X(\mathrm{Spec}(R)) = \mathrm{Hom}(A, R) \) for any ring \( R \). For instance, \( \mathbb{A}^n = \mathrm{Spec}(\mathbb{Z}[x_1, \ldots, x_n]) \), and an \( R \)-valued point of \( \mathbb{A}^n \) is an \( n \)-tuple \( (r_1, \ldots, r_n) \in R^n \), by the universal property of polynomial rings. This makes the functor of points extremely concrete and computation-friendly.

<div class="remark"><strong>Remark.</strong> The functor-of-points perspective allows one to define and work with group schemes purely in terms of functors: a <em>group scheme</em> over \( S \) is a scheme \( G \to S \) such that \( h_G(T) \) is a group for every \( S \)-scheme \( T \), functorially in \( T \). This is the right setting for algebraic groups.</div>

---

# Chapter 3: Schemes

## 3.1 The Definition of a Scheme

<div class="definition"><strong>Definition (Scheme).</strong> A <em>scheme</em> is a locally ringed space \( (X, \mathcal{O}_X) \) that is locally isomorphic to an affine scheme: there exists an open cover \( X = \bigcup_i U_i \) such that each \( (U_i, \mathcal{O}_X|_{U_i}) \) is an affine scheme.</div>

Schemes form a category: a morphism of schemes is simply a morphism of locally ringed spaces between them. Every affine scheme is a scheme. The category of schemes contains the category of affine schemes as a full subcategory.

## 3.2 Open and Closed Subschemes

<div class="definition"><strong>Definition (Open Subscheme).</strong> An <em>open subscheme</em> of \( X \) is an open subset \( U \subseteq X \) with the restricted structure sheaf \( \mathcal{O}_X|_U \). Any open subscheme of a scheme is a scheme.</div>

<div class="definition"><strong>Definition (Closed Subscheme).</strong> A <em>closed subscheme</em> of \( X \) is a locally ringed space \( (Z, \mathcal{O}_Z) \) together with a morphism \( i : Z \to X \) such that: (a) the underlying map of topological spaces is a homeomorphism onto a closed subset of \( X \), and (b) the map \( \mathcal{O}_X \to i_* \mathcal{O}_Z \) is surjective. On an affine piece \( \mathrm{Spec}(A) \subseteq X \), a closed subscheme corresponds to a quotient ring \( A/\mathfrak{a} \) for an ideal \( \mathfrak{a} \subseteq A \).</div>

Closed subschemes encode not just the zero set of functions but also their multiplicities and intersections. For instance, the closed subschemes of \( \mathbb{A}^1_k = \mathrm{Spec}(k[x]) \) are in bijection with ideals of \( k[x] \), i.e., with polynomials up to unit — including non-reduced ones like \( (x^2) \), which corresponds geometrically to the "double origin."

## 3.3 Gluing Constructions

Schemes can be constructed by gluing affine schemes along open subsets, much as manifolds are built by gluing open sets of \( \mathbb{R}^n \).

<div class="example"><strong>Example (The Projective Line \( \mathbb{P}^1_k \)).</strong> Let \( k \) be a field. Cover \( \mathbb{P}^1_k \) by two affine lines \( U_0 = \mathrm{Spec}(k[t]) \) and \( U_1 = \mathrm{Spec}(k[t^{-1}]) \). Their overlap is \( U_{01} = \mathrm{Spec}(k[t, t^{-1}]) \). The gluing isomorphism \( \phi : U_{01} \cap U_0 \xrightarrow{\sim} U_{01} \cap U_1 \) corresponds to the ring isomorphism \( k[s, s^{-1}] \to k[t, t^{-1}] \) given by \( s \mapsto t^{-1} \). The resulting scheme \( \mathbb{P}^1_k \) has underlying topological space consisting of the closed points (isomorphism classes of irreducible polynomials over \( k \), together with \( \infty \)) and a generic point.</div>

## 3.4 Reduced, Integral, and Irreducible Schemes

<div class="definition"><strong>Definition.</strong>
<ul>
<li>A scheme \( X \) is <em>reduced</em> if for every open \( U \subseteq X \), the ring \( \mathcal{O}_X(U) \) has no nilpotent elements.</li>
<li>\( X \) is <em>irreducible</em> if its underlying topological space is irreducible (i.e., cannot be written as a union of two proper closed subsets).</li>
<li>\( X \) is <em>integral</em> if it is both reduced and irreducible. Equivalently, \( X \) is integral if every \( \mathcal{O}_X(U) \) is an integral domain for nonempty open \( U \).</li>
</ul></div>

Integral schemes are the scheme-theoretic analogue of irreducible algebraic varieties. For an affine integral scheme \( \mathrm{Spec}(A) \), the ring \( A \) is a domain, and there is a unique generic point \( \eta \in X \) whose closure is all of \( X \). The residue field \( k(\eta) = \mathrm{Frac}(A) \) is the function field of \( X \).

## 3.5 Schemes of Finite Type and Varieties

<div class="definition"><strong>Definition.</strong> A scheme \( X \) is of <em>finite type over a field \( k \)</em> (or a <em>variety over \( k \)</em>, when also integral) if \( X \) is covered by finitely many affine open sets \( U_i = \mathrm{Spec}(A_i) \), each with \( A_i \) a finitely generated \( k \)-algebra.</div>

The classical varieties of algebraic geometry (affine algebraic sets, projective varieties) correspond to integral schemes of finite type over an algebraically closed field \( k \), possibly with additional conditions (separated, proper). The passage to schemes allows for a much richer theory: non-algebraically closed fields, arithmetic rings like \( \mathbb{Z} \), and non-reduced schemes (with their "thickened" geometry).

---

# Chapter 4: Projective Schemes

## 4.1 Graded Rings and the Proj Construction

<div class="definition"><strong>Definition (Graded Ring).</strong> A commutative ring \( S = \bigoplus_{d \geq 0} S_d \) is called a <em>graded ring</em> if \( S_d \cdot S_e \subseteq S_{d+e} \) for all \( d, e \geq 0 \). Elements of \( S_d \) are called <em>homogeneous of degree \( d \)</em>. We call \( S_+ = \bigoplus_{d > 0} S_d \) the <em>irrelevant ideal</em>.</div>

<div class="definition"><strong>Definition (\( \mathrm{Proj} \)).</strong> For a graded ring \( S \), define \( \mathrm{Proj}(S) \) as follows:
<ul>
<li>The underlying set consists of all homogeneous prime ideals \( \mathfrak{p} \subseteq S \) that do not contain \( S_+ \).</li>
<li>The topology: closed sets are \( V_+(\mathfrak{a}) = \{ \mathfrak{p} \in \mathrm{Proj}(S) \mid \mathfrak{a} \subseteq \mathfrak{p} \} \) for homogeneous ideals \( \mathfrak{a} \).</li>
<li>The structure sheaf: on the basic open set \( D_+(f) = \{ \mathfrak{p} \mid f \notin \mathfrak{p} \} \) for homogeneous \( f \in S_+ \), one sets \( \mathcal{O}(D_+(f)) = (S_f)_0 \), the degree-zero part of the localization \( S_f = S[f^{-1}] \).</li>
</ul></div>

The key point is that \( D_+(f) \cong \mathrm{Spec}((S_f)_0) \) as ringed spaces, making \( \mathrm{Proj}(S) \) a scheme. If \( S = A[x_0, \ldots, x_n] \) with \( A \) a ring and all \( x_i \) of degree 1, then \( \mathrm{Proj}(S) = \mathbb{P}^n_A \), projective \( n \)-space over \( A \).

## 4.2 Projective \( n \)-Space

<div class="definition"><strong>Definition.</strong> Let \( k \) be a field. <em>Projective \( n \)-space over \( k \)</em> is

\[
\mathbb{P}^n_k = \mathrm{Proj}(k[x_0, x_1, \ldots, x_n]),
\]
where all generators have degree 1. It is covered by \( n+1 \) affine open sets \( U_i = D_+(x_i) \cong \mathrm{Spec}(k[x_0/x_i, \ldots, \hat{x_i}/x_i, \ldots, x_n/x_i]) \cong \mathbb{A}^n_k \).</div>

<div class="example"><strong>Example.</strong> \( \mathbb{P}^2_k \) has three affine charts \( U_0, U_1, U_2 \). On \( U_0 \), the coordinates are \( u = x_1/x_0, v = x_2/x_0 \). On \( U_1 \), the coordinates are \( x_0/x_1, x_2/x_1 \). On the overlap \( U_0 \cap U_1 \), we have \( x_0/x_1 = 1/u \), and the transition functions are as expected from classical projective geometry.</div>

## 4.3 Closed Subschemes and Homogeneous Ideals

For a projective scheme \( \mathbb{P}^n_k \), closed subschemes correspond to homogeneous ideals.

<div class="definition"><strong>Definition.</strong> A <em>projective variety</em> over \( k \) is a closed integral subscheme of \( \mathbb{P}^n_k \) for some \( n \). It corresponds to a homogeneous prime ideal \( \mathfrak{p} \subseteq k[x_0, \ldots, x_n] \) with \( \mathfrak{p} \neq S_+ \).</div>

<div class="theorem"><strong>Theorem (Projective Nullstellensatz).</strong> Let \( k \) be algebraically closed, and let \( I \subseteq k[x_0, \ldots, x_n] \) be a homogeneous ideal. The closed subscheme \( V_+(I) \subseteq \mathbb{P}^n_k \) is empty if and only if \( \sqrt{I} \supseteq (x_0, \ldots, x_n) = S_+ \). Moreover, there is an order-reversing bijection between radical homogeneous ideals \( I \not\supseteq S_+ \) and closed subvarieties of \( \mathbb{P}^n_k \).</div>

<div class="example"><strong>Example (Plane Curve).</strong> The zero set of a homogeneous polynomial \( F(x_0, x_1, x_2) \in k[x_0, x_1, x_2] \) of degree \( d \) defines a <em>hypersurface</em> \( V_+(F) \subseteq \mathbb{P}^2_k \), a projective plane curve of degree \( d \). The curve \( y^2 z = x^3 - xz^2 \) (homogenized Weierstrass form) defines an elliptic curve.</div>

---

# Chapter 5: Morphisms Between Schemes

## 5.1 Types of Morphisms

Many geometric properties of maps between spaces are encoded in the structure of corresponding morphisms of schemes. We survey the most important classes.

<div class="definition"><strong>Definition.</strong> A morphism \( f : X \to Y \) of schemes is:
<ul>
<li><em>Locally of finite type</em> if there exists an affine open cover \( Y = \bigcup V_i \) with \( V_i = \mathrm{Spec}(B_i) \) and for each \( i \), a cover of \( f^{-1}(V_i) \) by affines \( \mathrm{Spec}(A_{ij}) \) where each \( A_{ij} \) is a finitely generated \( B_i \)-algebra.</li>
<li><em>Of finite type</em> if additionally each \( f^{-1}(V_i) \) can be covered by <em>finitely many</em> such affines.</li>
<li><em>Finite</em> if there is an affine cover \( Y = \bigcup V_i \), \( V_i = \mathrm{Spec}(B_i) \), with \( f^{-1}(V_i) = \mathrm{Spec}(A_i) \) and \( A_i \) a finite \( B_i \)-module.</li>
<li><em>Affine</em> if the preimage of every affine open in \( Y \) is affine in \( X \).</li>
</ul></div>

Finite morphisms are affine, and affine morphisms are separated (defined below).

## 5.2 Separated and Proper Morphisms

Separatedness is the scheme-theoretic analogue of the Hausdorff condition; properness corresponds to compactness.

<div class="definition"><strong>Definition (Separated Morphism).</strong> A morphism \( f : X \to Y \) is <em>separated</em> if the diagonal morphism \( \Delta : X \to X \times_Y X \) is a closed immersion. A scheme \( X \) is <em>separated</em> if \( X \to \mathrm{Spec}(\mathbb{Z}) \) is separated.</div>

<div class="theorem"><strong>Theorem (Affine Communication Lemma).</strong> \( f : X \to Y \) is separated if and only if for every pair of affine opens \( U = \mathrm{Spec}(A) \subseteq X \) and \( V = \mathrm{Spec}(B) \subseteq X \) with the same image in \( Y \), the intersection \( U \cap V \) is affine and the natural map \( A \otimes_\mathcal{O} B \to \mathcal{O}(U \cap V) \) is surjective.</div>

<div class="definition"><strong>Definition (Proper Morphism).</strong> A morphism \( f : X \to Y \) is <em>proper</em> if it is separated, of finite type, and <em>universally closed</em>: for every \( Y' \to Y \), the base change \( f' : X \times_Y Y' \to Y' \) is a closed map.</div>

Projective morphisms are proper. The converse is not true in general (there exist proper non-projective varieties), but for many purposes one works with projective schemes.

## 5.3 The Valuative Criteria

Separatedness and properness admit elegant reformulations using discrete valuation rings (DVRs).

<div class="theorem"><strong>Theorem (Valuative Criterion for Separatedness).</strong> Assume \( f : X \to Y \) is of finite type. Then \( f \) is separated if and only if for every DVR \( R \) with fraction field \( K \), every commutative square

\[
\mathrm{Spec}(K) \to X, \quad \mathrm{Spec}(R) \to Y
\]
has <em>at most one</em> lift \( \mathrm{Spec}(R) \to X \) making the diagram commute.</div>

<div class="theorem"><strong>Theorem (Valuative Criterion for Properness).</strong> Under the same hypotheses, \( f \) is proper if and only if such a lift exists and is <em>unique</em>.</div>

These criteria capture the geometric intuition: separatedness says limits of arcs are unique when they exist; properness says limits always exist and are unique (the "valuative criterion for compactness").

## 5.4 Immersions and Base Change

<div class="definition"><strong>Definition.</strong> An <em>open immersion</em> is a morphism \( j : U \to X \) that is an isomorphism onto an open subscheme. A <em>closed immersion</em> is a morphism \( i : Z \to X \) such that \( i \) is a homeomorphism onto a closed set and \( i^\# : \mathcal{O}_X \to i_* \mathcal{O}_Z \) is surjective (equivalently, locally of the form \( \mathrm{Spec}(A/\mathfrak{a}) \hookrightarrow \mathrm{Spec}(A) \)).</div>

<div class="definition"><strong>Definition (Base Change).</strong> Given morphisms \( f : X \to S \) and \( g : T \to S \), the <em>base change</em> of \( f \) along \( g \) is the morphism \( f_T : X_T = X \times_S T \to T \). Many properties of morphisms are preserved under base change: open and closed immersions, separated, proper, finite, of finite type.</div>

---

# Chapter 6: Fibered Products

## 6.1 Existence of Fibered Products

<div class="theorem"><strong>Theorem.</strong> The category of schemes has all fibered products (pullbacks). That is, given morphisms \( f : X \to S \) and \( g : Y \to S \), the fibered product \( X \times_S Y \) exists as a scheme.</div>

<div class="proof"><strong>Proof sketch.</strong> For affine schemes \( X = \mathrm{Spec}(A) \), \( Y = \mathrm{Spec}(B) \), \( S = \mathrm{Spec}(R) \), the fibered product is \( \mathrm{Spec}(A \otimes_R B) \). For general schemes, cover by affines and glue. The tensor product is the coproduct in the category of \( R \)-algebras, which corresponds to the product in affine schemes over \( S \).</div>

## 6.2 Fiber Products of Affine Schemes

The affine case is central. Suppose \( A \) and \( B \) are \( R \)-algebras. Then:

\[
\mathrm{Spec}(A) \times_{\mathrm{Spec}(R)} \mathrm{Spec}(B) = \mathrm{Spec}(A \otimes_R B).
\]

<div class="example"><strong>Example.</strong> Let \( k \) be a field, \( X = \mathrm{Spec}(k[x]/(f(x))) \) and \( Y = \mathrm{Spec}(k[y]/(g(y))) \), both over \( S = \mathrm{Spec}(k) \). Then

\[
X \times_S Y = \mathrm{Spec}\!\left(\frac{k[x,y]}{(f(x), g(y))}\right).
\]
This is the product variety (scheme) cut out by \( f(x) = 0 \) and \( g(y) = 0 \) in \( \mathbb{A}^2_k \).</div>

<div class="example"><strong>Example (Intersection via fibered product).</strong> If \( Z_1, Z_2 \hookrightarrow X \) are closed subschemes, their scheme-theoretic intersection \( Z_1 \cap Z_2 \) is the fibered product \( Z_1 \times_X Z_2 \), which is the closed subscheme of \( X \) corresponding to the sum of the two ideals. Unlike the topological intersection, this remembers multiplicities.</div>

## 6.3 Geometric Fibers

Given \( f : X \to S \) and a point \( s \in S \), the <em>fiber</em> over \( s \) is

\[
X_s = X \times_S \mathrm{Spec}(k(s)),
\]

where \( k(s) = \mathcal{O}_{S,s} / \mathfrak{m}_s \) is the residue field at \( s \). For \( S = \mathrm{Spec}(\mathbb{Z}) \) and \( X = \mathrm{Spec}(\mathbb{Z}[x, y]/(y^2 - x^3 + x)) \), the fiber over \( (p) \in \mathrm{Spec}(\mathbb{Z}) \) is the reduction \( X_{(p)} = \mathrm{Spec}(\mathbb{F}_p[x,y]/(y^2 - x^3 + x)) \), a curve over \( \mathbb{F}_p \).

The <em>geometric fiber</em> over a geometric point \( \bar{s} : \mathrm{Spec}(\bar{k}) \to S \) (where \( \bar{k} \) is an algebraic closure of \( k(s) \)) is \( X_{\bar{s}} = X \times_S \mathrm{Spec}(\bar{k}) \). Many properties of morphisms (e.g., smoothness, irreducibility of fibers) are best checked on geometric fibers.

## 6.4 Flatness (Brief Introduction)

<div class="definition"><strong>Definition (Flat Morphism).</strong> A morphism \( f : X \to S \) is <em>flat</em> if for every \( x \in X \), the local ring map \( \mathcal{O}_{S, f(x)} \to \mathcal{O}_{X, x} \) makes \( \mathcal{O}_{X, x} \) a flat \( \mathcal{O}_{S, f(x)} \)-module.</div>

Flat morphisms are the "continuous families" of algebraic geometry: the fibers vary in families without jumping. A key example is that a morphism \( \mathrm{Spec}(B) \to \mathrm{Spec}(A) \) is flat iff \( B \) is a flat \( A \)-module. Projections, open immersions, and étale morphisms are flat. The generic fiber of a flat morphism over an integral scheme determines the fibers at closed points in many respects.

---

# Chapter 7: Dimension and Regularity

## 7.1 Krull Dimension

<div class="definition"><strong>Definition (Krull Dimension).</strong> The <em>Krull dimension</em> of a ring \( A \), denoted \( \dim A \), is the supremum of the lengths of chains of prime ideals

\[
\mathfrak{p}_0 \subsetneq \mathfrak{p}_1 \subsetneq \cdots \subsetneq \mathfrak{p}_n.
\]
The <em>Krull dimension</em> of a scheme \( X \) is the supremum of the lengths of chains of irreducible closed subsets \( Z_0 \subsetneq Z_1 \subsetneq \cdots \subsetneq Z_n \subseteq X \).</div>

For a topological space, the dimension defined by chains of irreducible closed subsets agrees with Krull dimension when the space is the spectrum of a ring. Basic examples: \( \dim \mathbb{A}^n_k = n \), \( \dim \mathbb{P}^n_k = n \), \( \dim \mathrm{Spec}(\mathbb{Z}) = 1 \). For varieties over a field, Krull dimension coincides with the transcendence degree of the function field over \( k \).

<div class="theorem"><strong>Theorem.</strong> If \( A \) is a finitely generated \( k \)-algebra that is an integral domain, then \( \dim A = \mathrm{tr.deg}_k \, \mathrm{Frac}(A) \).</div>

## 7.2 Codimension

<div class="definition"><strong>Definition.</strong> The <em>codimension</em> of an irreducible closed subvariety \( Z \subseteq X \) is

\[
\mathrm{codim}(Z, X) = \dim \mathcal{O}_{X, \eta_Z},
\]
where \( \eta_Z \) is the generic point of \( Z \) and \( \mathcal{O}_{X, \eta_Z} \) is its local ring in \( X \). For well-behaved (e.g., equidimensional) schemes, \( \dim Z + \mathrm{codim}(Z, X) = \dim X \).</div>

## 7.3 Regular Local Rings and Smooth Varieties

<div class="definition"><strong>Definition (Regular Local Ring).</strong> A Noetherian local ring \( (R, \mathfrak{m}, k) \) is <em>regular</em> if \( \dim R = \dim_k (\mathfrak{m}/\mathfrak{m}^2) \). The integer \( \dim_k(\mathfrak{m}/\mathfrak{m}^2) \) is the <em>embedding dimension</em>, and the inequality \( \dim R \leq \dim_k(\mathfrak{m}/\mathfrak{m}^2) \) always holds (Nakayama's lemma); regularity demands equality.</div>

<div class="definition"><strong>Definition (Smooth Variety).</strong> A variety \( X \) of dimension \( n \) over a field \( k \) is <em>smooth at a point \( x \)</em> if the local ring \( \mathcal{O}_{X,x} \) is a regular local ring of dimension \( n \). It is <em>smooth</em> (or <em>non-singular</em>) if it is smooth at every point.</div>

<div class="theorem"><strong>Theorem (Jacobian Criterion).</strong> Let \( X = V(f_1, \ldots, f_r) \subseteq \mathbb{A}^n_k \) (or \( \mathbb{P}^n_k \)) with \( k = \bar{k} \). Then \( X \) is smooth at a closed point \( x \in X \) if and only if the Jacobian matrix

\[
J = \left(\frac{\partial f_i}{\partial x_j}(x)\right)_{1 \le i \le r, 1 \le j \le n}
\]
has rank \( n - \dim X \) at \( x \).</div>

<div class="example"><strong>Example.</strong> The curve \( C : y^2 = x^3 \) in \( \mathbb{A}^2_k \) (char \( k \neq 2, 3 \)) has Jacobian \( (-3x^2, 2y) \). At the origin \( (0, 0) \), this vanishes, so \( C \) is singular there (it has a cusp). The curve \( y^2 = x^3 - x \) has Jacobian \( (-3x^2 + 1, 2y) \), which is non-zero at every point of the curve (over \( \bar{k} \) with char \( k \neq 2, 3 \)), so this elliptic curve is smooth.</div>

## 7.4 Normal Varieties

<div class="definition"><strong>Definition (Normal Scheme).</strong> A scheme \( X \) is <em>normal</em> if every local ring \( \mathcal{O}_{X,x} \) is an integrally closed domain. A variety is normal if and only if it satisfies Serre's conditions \( R_1 \) (regular in codimension 1) and \( S_2 \) (depth \( \geq 2 \) at points of codimension \( \geq 2 \)).</div>

Regular implies normal (regular local rings are integrally closed). Normal varieties have good divisor theory: in particular, the Weil divisor class group is well-defined, and on a smooth variety it coincides with the Cartier divisor class group (the Picard group).

---

# Chapter 8: Line Bundles and Divisors

## 8.1 Invertible Sheaves and the Picard Group

<div class="definition"><strong>Definition (Invertible Sheaf / Line Bundle).</strong> An <em>invertible sheaf</em> (or <em>line bundle</em>) on a scheme \( X \) is a sheaf \( \mathcal{L} \) of \( \mathcal{O}_X \)-modules that is locally free of rank 1: there exists an open cover \( X = \bigcup U_i \) with \( \mathcal{L}|_{U_i} \cong \mathcal{O}_{U_i} \) for each \( i \).</div>

The tensor product \( \mathcal{L} \otimes_{\mathcal{O}_X} \mathcal{M} \) of two invertible sheaves is again invertible. The inverse of \( \mathcal{L} \) is \( \mathcal{L}^{-1} = \mathcal{H}om_{\mathcal{O}_X}(\mathcal{L}, \mathcal{O}_X) \). Under tensor product, the isomorphism classes of invertible sheaves form a group:

<div class="definition"><strong>Definition (Picard Group).</strong> The <em>Picard group</em> \( \mathrm{Pic}(X) \) is the group of isomorphism classes of invertible sheaves on \( X \), with group operation given by tensor product.</div>

<div class="example"><strong>Example.</strong> For \( X = \mathbb{P}^n_k \), the Picard group is \( \mathrm{Pic}(\mathbb{P}^n_k) \cong \mathbb{Z} \), generated by \( \mathcal{O}(1) \), the tautological line bundle. Its sections over \( \mathbb{P}^n_k \) are the homogeneous polynomials of degree 1, and \( \mathcal{O}(d) = \mathcal{O}(1)^{\otimes d} \) has sections that are homogeneous of degree \( d \).</div>

## 8.2 Weil Divisors and Cartier Divisors

On a normal variety, one can describe line bundles geometrically via divisors.

<div class="definition"><strong>Definition (Weil Divisor).</strong> A <em>Weil divisor</em> on an integral scheme \( X \) of dimension \( n \) is a formal \( \mathbb{Z} \)-linear combination \( D = \sum n_i Z_i \) of irreducible codimension-1 subvarieties \( Z_i \). The <em>Weil divisor class group</em> \( \mathrm{Cl}(X) \) is the quotient of the group of Weil divisors by the subgroup of principal divisors \( \mathrm{div}(f) = \sum_Z v_Z(f) Z \), where \( v_Z(f) \) is the order of vanishing of a rational function \( f \) along \( Z \).</div>

<div class="definition"><strong>Definition (Cartier Divisor).</strong> A <em>Cartier divisor</em> on \( X \) is a global section of the sheaf \( \mathcal{K}_X^*/\mathcal{O}_X^* \), where \( \mathcal{K}_X \) is the sheaf of total quotient rings. Equivalently, it is given by an open cover \( \{U_i\} \) of \( X \) and rational functions \( f_i \in \mathcal{K}^*(U_i) \) with \( f_i/f_j \in \mathcal{O}^*(U_i \cap U_j) \). The <em>Cartier divisor class group</em> (or Picard group) is the group \( \mathrm{CaCl}(X) = \mathrm{Pic}(X) \).</div>

On a smooth variety over a field, every Weil divisor is Cartier and \( \mathrm{Cl}(X) = \mathrm{Pic}(X) \). The correspondence between Cartier divisors and line bundles: a Cartier divisor \( \{(U_i, f_i)\} \) determines a line bundle \( \mathcal{O}_X(D) \) by taking \( \mathcal{O}(D)|_{U_i} = f_i^{-1} \mathcal{O}_{U_i} \subseteq \mathcal{K}_{U_i} \).

## 8.3 Linear Systems and Maps to Projective Space

<div class="definition"><strong>Definition (Linear System).</strong> Given a line bundle \( \mathcal{L} \) on \( X \), a <em>linear system</em> is a projective subspace of the complete linear system \( |L| = \mathbb{P}(H^0(X, \mathcal{L})) \), the projective space of global sections of \( \mathcal{L} \) modulo scalars. Each effective divisor \( D \) in the linear system corresponds to a section \( s \in H^0(X, \mathcal{L}) \).</div>

<div class="theorem"><strong>Theorem.</strong> A line bundle \( \mathcal{L} \) on a variety \( X \) over \( k \) determines a morphism \( \phi_\mathcal{L} : X \to \mathbb{P}^n_k \) (for \( n + 1 = \dim H^0(X, \mathcal{L}) \)) if and only if \( \mathcal{L} \) is globally generated (i.e., the map \( H^0(X, \mathcal{L}) \otimes \mathcal{O}_X \to \mathcal{L} \) is surjective). The pullback \( \phi_\mathcal{L}^* \mathcal{O}(1) \cong \mathcal{L} \).</div>

<div class="definition"><strong>Definition (Ample / Very Ample).</strong> A line bundle \( \mathcal{L} \) is <em>very ample</em> if \( \phi_\mathcal{L} \) is a closed immersion into projective space. It is <em>ample</em> if some power \( \mathcal{L}^{\otimes m} \) is very ample. By Serre's theorem, \( \mathcal{L} \) is ample iff for every coherent sheaf \( \mathcal{F} \), the sheaves \( \mathcal{F} \otimes \mathcal{L}^{\otimes m} \) are globally generated for \( m \gg 0 \).</div>

## 8.4 Cohomology of Sheaves

Sheaf cohomology measures the obstruction to extending local sections globally.

<div class="definition"><strong>Definition.</strong> For a sheaf \( \mathcal{F} \) on a scheme \( X \), the <em>cohomology groups</em> \( H^i(X, \mathcal{F}) \) are the right derived functors of the global sections functor \( \Gamma(X, -) \). Concretely, one takes an injective resolution \( 0 \to \mathcal{F} \to \mathcal{I}^0 \to \mathcal{I}^1 \to \cdots \) in the category of sheaves, applies \( \Gamma \), and takes cohomology.</div>

For practical computation on projective schemes, <em>Čech cohomology</em> is very useful. Given an open affine cover \( \mathfrak{U} = \{U_i\}_{i=0}^n \) of \( X \), the Čech complex is

\[
0 \to \prod_i \mathcal{F}(U_i) \to \prod_{i < j} \mathcal{F}(U_i \cap U_j) \to \cdots \to \mathcal{F}(U_0 \cap \cdots \cap U_n) \to 0,
\]
and the cohomology of this complex computes \( H^*(X, \mathcal{F}) \) when the cover consists of open affines and \( \mathcal{F} \) is quasicoherent (by a theorem of Cartan).

<div class="theorem"><strong>Theorem (Cohomology of \( \mathbb{P}^n \)).</strong> For \( \mathcal{O}(d) \) on \( \mathbb{P}^n_k \):
<ul>
<li>\( H^0(\mathbb{P}^n, \mathcal{O}(d)) \) is the space of homogeneous polynomials of degree \( d \) (zero for \( d < 0 \)).</li>
<li>\( H^n(\mathbb{P}^n, \mathcal{O}(d)) \cong H^0(\mathbb{P}^n, \mathcal{O}(-d - n - 1))^\vee \) (Serre duality).</li>
<li>\( H^i(\mathbb{P}^n, \mathcal{O}(d)) = 0 \) for \( 0 < i < n \) and all \( d \).</li>
</ul></div>

---

# Chapter 9: Curves and the Riemann-Roch Theorem

## 9.1 Smooth Projective Curves

<div class="definition"><strong>Definition.</strong> A <em>smooth projective curve</em> over a field \( k \) is a scheme \( C \) that is integral, smooth, projective, and of dimension 1 over \( k \).</div>

The theory of smooth projective curves over \( k \) is one of the most beautiful chapters of algebraic geometry. Every smooth projective curve \( C \) over an algebraically closed field \( k \) is determined up to isomorphism by its function field \( K = k(C) \): the closed points of \( C \) correspond bijectively to discrete valuations of \( K/k \) (the places of \( K \)).

## 9.2 Divisors on Curves

Since \( \dim C = 1 \), the only irreducible closed subsets of dimension 0 are points. Thus:
- Weil divisors on \( C \) are formal \( \mathbb{Z} \)-linear combinations of closed points: \( D = \sum_{P \in C} n_P \cdot P \), with \( n_P = 0 \) for all but finitely many \( P \).
- The degree of \( D \) is \( \deg D = \sum n_P [k(P) : k] \).
- A rational function \( f \in K^* \) has divisor \( \mathrm{div}(f) = \sum_P v_P(f) \cdot P \), where \( v_P \) is the valuation at \( P \).
- Principal divisors have degree 0 (by the product formula).

<div class="definition"><strong>Definition.</strong> For a divisor \( D \) on \( C \), the associated line bundle is \( \mathcal{O}_C(D) \). Its global sections are

\[
H^0(C, \mathcal{O}(D)) = \{ f \in K^* \mid \mathrm{div}(f) + D \geq 0 \} \cup \{0\} =: L(D),
\]
the <em>Riemann-Roch space</em> of \( D \). Set \( \ell(D) = \dim_k L(D) \).</div>

## 9.3 Genus

<div class="definition"><strong>Definition (Geometric Genus).</strong> The <em>genus</em> of a smooth projective curve \( C \) over \( k \) is

\[
g = g(C) = \dim_k H^1(C, \mathcal{O}_C).
\]
Equivalently, for \( k = \mathbb{C} \), the genus is the number of handles of the topological surface \( C(\mathbb{C}) \).</div>

Alternative definitions: if \( C \) is a smooth plane curve of degree \( d \), then \( g = (d-1)(d-2)/2 \). For an elliptic curve (smooth genus-1 curve with a marked point), \( g = 1 \). The projective line \( \mathbb{P}^1_k \) has \( g = 0 \).

## 9.4 The Riemann-Roch Theorem

The Riemann-Roch theorem is the central result in the theory of curves. It computes \( \ell(D) \) and relates it to the geometry of the canonical divisor.

<div class="definition"><strong>Definition (Canonical Divisor).</strong> The <em>canonical divisor class</em> \( K_C \) of a smooth curve \( C \) is the divisor class corresponding to the cotangent sheaf \( \Omega_{C/k} \cong \omega_C \) (the dualizing sheaf). It has degree \( \deg K_C = 2g - 2 \).</div>

<div class="theorem"><strong>Theorem (Riemann-Roch for Curves).</strong> Let \( C \) be a smooth projective curve of genus \( g \) over an algebraically closed field \( k \), and let \( D \) be a divisor on \( C \). Then

\[
\ell(D) - \ell(K_C - D) = \deg D - g + 1.
\]
</div>

<div class="proof"><strong>Proof sketch.</strong> We use coherent sheaf cohomology. From the short exact sequence defining \( \mathcal{O}(D) \) and the Euler characteristic \( \chi(C, \mathcal{O}(D)) = h^0 - h^1 \), we get:

\[
\ell(D) - h^1(C, \mathcal{O}(D)) = \deg D - g + 1,
\]
by comparing with the case \( D = 0 \) (where \( \ell(0) = 1 \) and \( h^1 = g \)) and using additivity of Euler characteristic when adding or removing points. Serre duality then gives \( h^1(C, \mathcal{O}(D)) = h^0(C, \Omega_C(-D)) = \ell(K_C - D) \).</div>

<div class="remark"><strong>Remark.</strong> When \( \deg D > 2g - 2 \), we have \( \ell(K_C - D) = 0 \) (since \( \deg(K_C - D) < 0 \) means \( K_C - D \) has no effective representative), so the theorem reduces to \( \ell(D) = \deg D - g + 1 \). This is the "non-special" range.</div>

## 9.5 Applications of Riemann-Roch

**Curves of low genus.** 
- \( g = 0 \): Every smooth curve with a rational point is isomorphic to \( \mathbb{P}^1_k \). (Take any point \( P \); then \( \ell(P) = 2 \) gives a morphism to \( \mathbb{P}^1 \) of degree 1.)
- \( g = 1 \): Elliptic curves. For a point \( P \) on an elliptic curve, Riemann-Roch gives \( \ell(3P) = 3 \), so \( 3P \) embeds \( C \) in \( \mathbb{P}^2 \) as a cubic, and \( C \) has a Weierstrass equation \( y^2 = x^3 + ax + b \).
- \( g = 2 \): The canonical map \( \phi_{K_C} : C \to \mathbb{P}^1 \) is a degree-2 map; \( C \) is a hyperelliptic curve. The map is given by \( \ell(K_C) = g = 2 \).

**Embeddings of curves.**

<div class="theorem"><strong>Theorem.</strong> If \( \deg D \geq 2g + 1 \), the line bundle \( \mathcal{O}(D) \) is very ample, and \( D \) embeds \( C \) into \( \mathbb{P}^{d-g} \) where \( d = \deg D \). For \( \deg D \geq 2g \), \( \mathcal{O}(D) \) is globally generated and non-special.</div>

**Clifford's Theorem.**

<div class="theorem"><strong>Theorem (Clifford).</strong> Let \( D \) be a special divisor on \( C \) (meaning \( \ell(K_C - D) > 0 \), so \( 0 \leq \deg D \leq 2g - 2 \)). Then

\[
\ell(D) \leq \frac{\deg D}{2} + 1.
\]
Equality holds only for \( D = 0 \), \( D = K_C \), or when \( C \) is hyperelliptic and \( D \) is a multiple of the hyperelliptic class.</div>

Clifford's theorem controls how many independent sections a special divisor can have, and is a key tool in Brill-Noether theory.

---

# Chapter 10: Serre Duality

## 10.1 The Dualizing Sheaf

Serre duality is the algebraic geometry analogue of Poincaré duality on compact oriented manifolds. To state it, we need the dualizing sheaf.

<div class="definition"><strong>Definition (Dualizing Sheaf).</strong> Let \( X \) be a projective variety of dimension \( n \) over a field \( k \). A <em>dualizing sheaf</em> \( \omega_X \) is a coherent sheaf on \( X \) together with a <em>trace map</em>

\[
t : H^n(X, \omega_X) \to k,
\]
such that for every coherent sheaf \( \mathcal{F} \) on \( X \), the natural pairing

\[
H^i(X, \mathcal{F}) \times H^{n-i}(X, \mathcal{H}om(\mathcal{F}, \omega_X)) \to H^n(X, \omega_X) \xrightarrow{t} k
\]
is a perfect pairing of \( k \)-vector spaces.</div>

<div class="theorem"><strong>Theorem (Existence and Uniqueness of Dualizing Sheaf).</strong> For a smooth projective variety \( X \) of dimension \( n \) over \( k \), the dualizing sheaf exists and is given by

\[
\omega_X = \bigwedge^n \Omega_{X/k},
\]
the top exterior power of the sheaf of Kähler differentials. It is an invertible sheaf (a line bundle) and is uniquely characterized by Serre duality.</div>

For a smooth projective curve \( C \), \( \omega_C = \Omega_{C/k} \) is just the sheaf of 1-forms, and its degree is \( 2g - 2 \) (as mentioned above).

For projective space \( \mathbb{P}^n_k \), we have \( \omega_{\mathbb{P}^n} = \mathcal{O}(-n-1) \). This can be computed from the Euler sequence and the formula for the canonical class of a hypersurface.

## 10.2 Statement of Serre Duality

<div class="theorem"><strong>Theorem (Serre Duality).</strong> Let \( X \) be a smooth projective variety of dimension \( n \) over a field \( k \), and let \( \mathcal{F} \) be a locally free sheaf on \( X \). Then there are natural isomorphisms of \( k \)-vector spaces

\[
H^i(X, \mathcal{F}) \cong H^{n-i}(X, \mathcal{F}^\vee \otimes \omega_X)^\vee
\]
for all \( 0 \leq i \leq n \), where \( \mathcal{F}^\vee = \mathcal{H}om(\mathcal{F}, \mathcal{O}_X) \) is the dual sheaf. In particular, \( h^i(X, \mathcal{F}) = h^{n-i}(X, \mathcal{F}^\vee \otimes \omega_X) \).</div>

<div class="proof"><strong>Proof sketch (for projective space).</strong> On \( \mathbb{P}^n_k \), any locally free sheaf is a direct sum of twists \( \mathcal{O}(d) \). By the explicit Čech cohomology computation, \( H^i(\mathbb{P}^n, \mathcal{O}(d)) \) is nonzero only for \( i = 0 \) (\( d \geq 0 \)) and \( i = n \) (\( d \leq -n-1 \)), and the duality \( H^n(\mathbb{P}^n, \mathcal{O}(d)) \cong H^0(\mathbb{P}^n, \mathcal{O}(-d-n-1))^\vee \) can be verified directly. For general smooth projective varieties, the result follows by embedding into projective space and using adjunction or abstract machinery (injective resolutions).</div>

## 10.3 Serre Duality for Curves

For a smooth projective curve \( C \) of genus \( g \), \( n = 1 \) and \( \omega_C = \Omega_{C/k} \). Serre duality reads: for any line bundle \( \mathcal{L} \) on \( C \),

\[
H^1(C, \mathcal{L}) \cong H^0(C, \mathcal{L}^{-1} \otimes \omega_C)^\vee = H^0(C, K_C - D)^\vee,
\]
where \( D \) is the divisor corresponding to \( \mathcal{L} \). This is precisely the identification \( h^1(C, \mathcal{O}(D)) = \ell(K_C - D) \) used in the proof of Riemann-Roch.

<div class="example"><strong>Example.</strong> For \( C = \mathbb{P}^1_k \), \( g = 0 \) and \( \omega_{\mathbb{P}^1} = \mathcal{O}(-2) \). Serre duality gives \( H^1(\mathbb{P}^1, \mathcal{O}(d)) \cong H^0(\mathbb{P}^1, \mathcal{O}(-d-2))^\vee \). For \( d \geq 0 \), both sides vanish (since \( -d-2 < 0 \)); for \( d \leq -2 \), \( H^1(\mathbb{P}^1, \mathcal{O}(d)) \cong H^0(\mathbb{P}^1, \mathcal{O}(-d-2)) \), which has dimension \( -d-1 \).</div>

## 10.4 Applications: Vanishing and Bounds

Serre duality, combined with Riemann-Roch and other tools, yields powerful vanishing results for cohomology.

<div class="theorem"><strong>Theorem (Kodaira Vanishing, in characteristic 0).</strong> Let \( X \) be a smooth projective variety over a field of characteristic 0, and let \( \mathcal{L} \) be an ample line bundle on \( X \). Then

\[
H^i(X, \omega_X \otimes \mathcal{L}) = 0 \quad \text{for all } i > 0.
\]
</div>

By Serre duality, this is equivalent to \( H^{n-i}(X, \mathcal{L}^{-1}) = 0 \) for \( i > 0 \), i.e., \( H^j(X, \mathcal{L}^{-1}) = 0 \) for \( j < n \).

<div class="theorem"><strong>Theorem (Riemann-Hurwitz Formula).</strong> Let \( f : C \to D \) be a non-constant morphism of smooth projective curves of degrees \( n \) and genera \( g(C) \), \( g(D) \) respectively. Then

\[
2g(C) - 2 = n(2g(D) - 2) + \deg R,
\]
where \( R = \sum_{P \in C} (e_P - 1) P \) is the ramification divisor, and \( e_P \) is the ramification index at \( P \). (Assumes separable \( f \) and that the characteristic does not divide any \( e_P \).) This follows from the fact that \( f^* \omega_D \) is a subsheaf of \( \omega_C \), with quotient supported on the ramification locus.</div>

<div class="example"><strong>Example.</strong> A degree-2 map \( f : C \to \mathbb{P}^1 \) (a hyperelliptic curve) has \( g(D) = 0 \), so \( 2g(C) - 2 = -4 + \deg R \), giving \( \deg R = 2g(C) + 2 \). Since each ramification point has \( e_P = 2 \) (in characteristic \( \neq 2 \)), there are \( 2g + 2 \) branch points in \( \mathbb{P}^1 \). For \( g = 1 \) (elliptic curves), this gives 4 branch points, consistent with the Weierstrass form \( y^2 = (x - a_1)(x-a_2)(x-a_3)(x-a_4) \).</div>

---

# Chapter 11: Supplementary Topics

## 11.1 Coherent Sheaves and Quasi-Coherent Sheaves

<div class="definition"><strong>Definition.</strong> A sheaf \( \mathcal{F} \) of \( \mathcal{O}_X \)-modules on a scheme \( X \) is <em>quasi-coherent</em> if locally (on an affine cover \( \{U_i = \mathrm{Spec}(A_i)\} \)), \( \mathcal{F}|_{U_i} \cong \widetilde{M_i} \) for some \( A_i \)-module \( M_i \). Here \( \widetilde{M} \) denotes the quasi-coherent sheaf associated to an \( A \)-module \( M \), with \( \widetilde{M}(D(f)) = M_f \). It is <em>coherent</em> if additionally each \( M_i \) can be taken to be finitely presented.</div>

On a Noetherian scheme, coherent sheaves are the central objects. The global sections functor, pushforward, pullback, tensor product, and sheaf Hom all preserve (quasi-)coherence under mild hypotheses. Coherent sheaves on \( \mathrm{Spec}(A) \) correspond exactly to finitely generated \( A \)-modules.

<div class="theorem"><strong>Theorem (Serre's Theorem — Finiteness).</strong> Let \( X \) be a projective scheme over a Noetherian ring \( A \), and let \( \mathcal{F} \) be a coherent sheaf on \( X \). Then:
<ol>
<li>\( H^i(X, \mathcal{F}) \) is a finitely generated \( A \)-module for all \( i \geq 0 \).</li>
<li>\( H^i(X, \mathcal{F} \otimes \mathcal{O}(m)) = 0 \) for all \( i > 0 \) and all \( m \gg 0 \).</li>
</ol></div>

## 11.2 The Euler Characteristic

<div class="definition"><strong>Definition.</strong> For a coherent sheaf \( \mathcal{F} \) on a projective scheme \( X \) over a field \( k \), the <em>Euler characteristic</em> is

\[
\chi(X, \mathcal{F}) = \sum_{i \geq 0} (-1)^i h^i(X, \mathcal{F}),
\]
where \( h^i = \dim_k H^i(X, \mathcal{F}) \). This is an integer, finite by Serre's theorem.</div>

The Euler characteristic is additive in short exact sequences: if \( 0 \to \mathcal{F}' \to \mathcal{F} \to \mathcal{F}'' \to 0 \) is exact, then \( \chi(\mathcal{F}) = \chi(\mathcal{F}') + \chi(\mathcal{F}'') \). It is also more accessible to computation than individual cohomology groups, and often determines them.

<div class="theorem"><strong>Theorem (Hirzebruch-Riemann-Roch).</strong> For a smooth projective variety \( X \) of dimension \( n \) over \( \mathbb{C} \) and a vector bundle \( \mathcal{E} \) on \( X \),

\[
\chi(X, \mathcal{E}) = \int_X \mathrm{ch}(\mathcal{E}) \cdot \mathrm{td}(T_X),
\]
where \( \mathrm{ch}(\mathcal{E}) \) is the Chern character of \( \mathcal{E} \) and \( \mathrm{td}(T_X) \) is the Todd class of the tangent bundle. For a curve (\( n = 1 \)) and a line bundle \( \mathcal{L} = \mathcal{O}(D) \), this reduces to \( \chi = \deg D - g + 1 \), recovering Riemann-Roch.</div>

## 11.3 The Relative Canonical Sheaf and Adjunction

When studying a smooth hypersurface \( X = V(F) \subseteq \mathbb{P}^n \) of degree \( d \), the adjunction formula computes the dualizing sheaf:

<div class="theorem"><strong>Theorem (Adjunction Formula).</strong> Let \( X \subseteq Y \) be a smooth hypersurface in a smooth variety \( Y \). Then

\[
\omega_X = (\omega_Y \otimes \mathcal{O}_Y(X))|_X.
\]
For \( X \subseteq \mathbb{P}^n \) a smooth hypersurface of degree \( d \), since \( \omega_{\mathbb{P}^n} = \mathcal{O}(-n-1) \) and \( \mathcal{O}(X) = \mathcal{O}(d) \), we get

\[
\omega_X = \mathcal{O}(d - n - 1)|_X.
\]
</div>

<div class="example"><strong>Example.</strong> A smooth plane curve \( C \subseteq \mathbb{P}^2 \) of degree \( d \) has \( \omega_C = \mathcal{O}(d-3)|_C \), so \( \deg \omega_C = d(d-3) \). The formula \( \deg \omega_C = 2g - 2 \) then gives \( g = (d-1)(d-2)/2 \), consistent with what we stated earlier. For \( d = 3 \) (cubic plane curve), \( g = 1 \), confirming that smooth cubics are elliptic curves.</div>

## 11.4 Moduli Spaces and Functorial Perspective

One of the goals of modern algebraic geometry is to construct <em>moduli spaces</em> parametrizing geometric objects.

<div class="definition"><strong>Definition (Moduli Problem).</strong> A <em>moduli problem</em> consists of a functor \( \mathcal{M} : \mathbf{Sch}^{\mathrm{op}} \to \mathbf{Set} \) where \( \mathcal{M}(T) \) is the set of isomorphism classes of "families of objects over \( T \)." A scheme \( M \) <em>represents</em> the moduli problem if \( \mathcal{M} \cong h_M \) (the functor of points of \( M \)). A <em>coarse moduli space</em> is a scheme \( M \) with a natural transformation \( \mathcal{M} \to h_M \) that is a bijection on algebraically closed field-valued points and is initial among all such natural transformations.</div>

The moduli space \( \mathcal{M}_g \) of smooth projective curves of genus \( g \) is a fundamental object. For \( g \geq 2 \), \( \mathcal{M}_g \) exists as a coarse moduli space of dimension \( 3g - 3 \). Its construction uses geometric invariant theory (GIT) or the theory of Hilbert schemes, both natural extensions of the material in this course.

---

# Chapter 12: Connections and Outlook

## 12.1 Étale Morphisms and the Étale Site

A morphism \( f : X \to Y \) is <em>étale</em> if it is flat, unramified, and locally of finite type. Étale morphisms are the algebraic geometry analogue of local homeomorphisms in topology. They form the basis of the <em>étale topology</em>, a Grothendieck topology on the category of schemes, and the <em>étale cohomology</em> \( H^i_{\text{ét}}(X, \mathbb{Z}/\ell\mathbb{Z}) \) — constructed by Grothendieck to prove the Weil conjectures. The comparison theorem of Artin identifies étale cohomology with singular cohomology over \( \mathbb{C} \).

## 12.2 Intersection Theory

On a smooth projective surface \( X \) (a variety of dimension 2), the <em>intersection product</em> of two divisors \( D_1, D_2 \) is defined as

\[
D_1 \cdot D_2 = \chi(\mathcal{O}_X) - \chi(\mathcal{O}(-D_1)) - \chi(\mathcal{O}(-D_2)) + \chi(\mathcal{O}(-D_1 - D_2)).
\]
For curves on a surface, this gives a symmetric bilinear form on \( \mathrm{Pic}(X) \), and the Hodge Index Theorem asserts that this form has signature \( (1, \rho - 1) \) where \( \rho = \mathrm{rank}\,\mathrm{Pic}(X) \). Intersection theory is extended to higher-dimensional varieties by Chow groups and Chern classes.

## 12.3 Deformation Theory

Infinitesimal deformations of a scheme \( X \) — i.e., liftings of \( X \) from \( \mathrm{Spec}(k) \) to \( \mathrm{Spec}(k[\epsilon]/(\epsilon^2)) \) — are classified by \( H^1(X, T_X) \), the first cohomology of the tangent sheaf. Obstructions to deformation live in \( H^2(X, T_X) \). For curves of genus \( g \geq 2 \), the deformation space has dimension \( h^1(C, T_C) = h^1(C, \Omega_C^{-1}) = 3g - 3 \) (by Serre duality and Riemann-Roch), explaining the dimension of \( \mathcal{M}_g \).

## 12.4 Grothendieck's Relative Point of View

Much of modern algebraic geometry takes place not over a fixed base field but "relatively": given a morphism \( f : X \to S \), one studies \( X \) as a family over \( S \). The relative perspective — introduced and systematized by Grothendieck in EGA and SGA — has been enormously productive:
- Relative differentials \( \Omega_{X/S} \) and relative dualizing sheaf \( \omega_{X/S} \).
- Relative cohomology and the Leray spectral sequence \( H^p(S, R^q f_* \mathcal{F}) \Rightarrow H^{p+q}(X, \mathcal{F}) \).
- Base change theorems: when the formation of \( R^i f_* \mathcal{F} \) commutes with base change \( S' \to S \).

The schemes encountered in number theory — integral models of varieties over \( \mathbb{Q} \), Shimura varieties, the arithmetic surface attached to a number field — are naturally objects over \( \mathrm{Spec}(\mathbb{Z}) \) or a ring of integers, and the relative perspective is indispensable.

<div class="remark"><strong>Remark (Further Directions).</strong> This course provides the foundation for many advanced topics in modern research:
<ul>
<li><strong>Abelian varieties and the Weil conjectures</strong>: the cohomological formalism of \( \ell \)-adic cohomology and Frobenius.</li>
<li><strong>Algebraic \( K \)-theory</strong>: the relationship between sheaves, vector bundles, and \( K \)-groups of rings and schemes.</li>
<li><strong>Derived algebraic geometry</strong>: replacing rings by differential graded algebras and ∞-categories; deformation theory in its natural habitat.</li>
<li><strong>The Langlands program</strong>: geometric Langlands replaces automorphic forms with \( \mathcal{D} \)-modules or perverse sheaves on moduli stacks of bundles.</li>
<li><strong>Mirror symmetry and derived categories</strong>: Fourier-Mukai transforms, derived categories of coherent sheaves, and their role in symplectic geometry.</li>
</ul></div>
