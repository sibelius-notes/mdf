---
title: "PMATH 863: Introduction to Lie Groups and Lie Algebras"
prof: "Stephen New"
subjects: "PMATH"
---

*These notes synthesize material from multiple sources. **Primary texts** — Brian C. Hall, *Lie Groups, Lie Algebras, and Representations* (2nd ed., Springer GTM 222); Mark R. Sepanski, *Compact Lie Groups* (Springer GTM 235); James E. Humphreys, *Introduction to Lie Algebras and Representation Theory* (Springer GTM 9); Theodore Bröcker and Tammo tom Dieck, *Representations of Compact Lie Groups* (Springer GTM 98). **Supplementary texts** — N. Bourbaki, *Éléments de Mathématique: Groupes et Algèbres de Lie*; Joachim Hilgert and Karl-Hermann Neeb, *Structure and Geometry of Lie Groups*; Jacques Faraut, *Analysis on Lie Groups*. **Online resources** — Eckhard Meinrenken's lecture notes (University of Toronto); Peter Woit's notes on Lie Groups and Representations (Columbia University); lecture notes from MIT OCW 18.755. Background topology and manifold theory from James R. Munkres, *Topology*; Frank W. Warner, *Foundations of Differentiable Manifolds and Lie Groups*; William M. Boothby, *An Introduction to Differentiable Manifolds and Riemannian Geometry*.*

---

# Chapter 1: Smooth Manifolds

Lie groups are simultaneously groups and smooth manifolds, with the group operations smooth maps. To state this precisely and work with it effectively, we need the language of differential geometry. This chapter develops the theory of smooth manifolds — charts, tangent spaces, vector fields, and the Lie bracket — at the level needed throughout the course. Readers with a solid background in differential geometry may skim this material, but the notation and conventions established here will be used without comment later.

## 1.1 Topological and Smooth Manifolds

A topological space \(M\) is an **\(n\)-dimensional topological manifold** if it is Hausdorff, second-countable, and locally homeomorphic to \(\mathbb{R}^n\): every point \(p \in M\) has an open neighbourhood \(U\) homeomorphic to an open subset of \(\mathbb{R}^n\). The Hausdorff condition prevents two distinct points from being topologically indistinguishable; second-countability guarantees the existence of partitions of unity, without which global constructions on manifolds become impossible.

<div class="definition">
<strong>Definition 1.1 (Charts and atlases).</strong> A <em>chart</em> on \(M\) is a pair \((U, \varphi)\) where \(U \subseteq M\) is open and \(\varphi : U \to V \subseteq \mathbb{R}^n\) is a homeomorphism onto an open set \(V\). Given two overlapping charts \((U, \varphi)\) and \((W, \psi)\), the <em>transition map</em> is \(\psi \circ \varphi^{-1} : \varphi(U \cap W) \to \psi(U \cap W)\), a homeomorphism between open subsets of \(\mathbb{R}^n\). An <em>atlas</em> is a collection of charts whose domains cover \(M\). An atlas is <em>smooth</em> if every transition map is \(C^\infty\). A <em>smooth manifold</em> is a topological manifold equipped with a maximal smooth atlas.
</div>

Maximality is a bookkeeping convenience: any smooth atlas extends uniquely to a maximal one by including all charts compatible with those already present. So to specify a smooth structure, it suffices to exhibit any smooth atlas.

The fundamental examples: \(\mathbb{R}^n\) itself (one chart, the identity); the \(n\)-sphere \(S^n \subset \mathbb{R}^{n+1}\) (two stereographic projection charts, whose transition map is \(x \mapsto x/|x|^2\), smooth on \(\mathbb{R}^n \setminus \{0\}\)); the \(n\)-torus \(\mathbb{T}^n = \mathbb{R}^n / \mathbb{Z}^n\) (charts from local inverses of the quotient map); any open subset of \(\mathbb{R}^n\) (restriction of the identity chart); and, crucially for us, \(GL(n, \mathbb{R})\) as an open subset of \(M_n(\mathbb{R}) \cong \mathbb{R}^{n^2}\) (the determinant is a continuous function, so \(GL(n, \mathbb{R}) = \det^{-1}(\mathbb{R} \setminus \{0\})\) is open).

<div class="definition">
<strong>Definition 1.2 (Smooth maps).</strong> A continuous map \(f : M \to N\) between smooth manifolds is <em>smooth</em> if for every chart \((U, \varphi)\) on \(M\) and \((V, \psi)\) on \(N\) with \(f(U) \subseteq V\), the composite \(\psi \circ f \circ \varphi^{-1} : \varphi(U) \to \psi(V)\) is \(C^\infty\). A smooth bijection with smooth inverse is a <em>diffeomorphism</em>.
</div>

Smoothness is a local condition, well-defined because transition maps are smooth. Composition preserves smoothness, so smooth manifolds and smooth maps form a category.

## 1.2 Tangent Vectors and the Differential

The tangent space \(T_p M\) at a point \(p \in M\) formalises the idea of a "direction of motion" through \(p\). There are two useful equivalent definitions.

The **geometric definition**: a tangent vector at \(p\) is an equivalence class of smooth curves \(\gamma : (-\varepsilon, \varepsilon) \to M\) with \(\gamma(0) = p\), where \(\gamma_1 \sim \gamma_2\) if \((\varphi \circ \gamma_1)'(0) = (\varphi \circ \gamma_2)'(0)\) in some (equivalently any) chart \(\varphi\) near \(p\).

The **algebraic definition** is more intrinsic. A smooth function near \(p\) is a germ: a smooth \(f : U \to \mathbb{R}\) on some open \(U \ni p\). Let \(C^\infty_p\) denote the algebra of germs.

<div class="definition">
<strong>Definition 1.3 (Tangent vector as derivation).</strong> A <em>tangent vector</em> at \(p\) is an \(\mathbb{R}\)-linear map \(v : C^\infty_p \to \mathbb{R}\) satisfying the Leibniz rule
\[
v(fg) = f(p)\, v(g) + g(p)\, v(f).
\]
The <em>tangent space</em> \(T_p M\) is the vector space of all tangent vectors at \(p\).
</div>

In a local chart \((U, \varphi)\) with coordinates \(x^1, \ldots, x^n\), the operators \(\partial/\partial x^i\big|_p\) defined by

\[
\frac{\partial}{\partial x^i}\bigg|_p f = \frac{\partial(f \circ \varphi^{-1})}{\partial x^i}\bigg|_{\varphi(p)}
\]
form a basis for \(T_p M\), which therefore has dimension \(n = \dim M\). Every \(v \in T_p M\) writes uniquely as \(v = \sum_i v^i \partial/\partial x^i|_p\). The two definitions are equivalent: the curve \(\gamma\) with \((\varphi \circ \gamma)'(0) = (v^1, \ldots, v^n)\) represents \(v\) as a derivation via \(v(f) = (f \circ \gamma)'(0)\).

<div class="definition">
<strong>Definition 1.4 (Differential).</strong> Let \(f : M \to N\) be smooth and \(p \in M\). The <em>differential</em> of \(f\) at \(p\) is the linear map \(df_p : T_p M \to T_{f(p)} N\) defined by \((df_p(v))(g) = v(g \circ f)\). In terms of curves: \(df_p([\gamma]) = [f \circ \gamma]\). The chain rule takes the clean form \(d(g \circ f)_p = dg_{f(p)} \circ df_p\).
</div>

The **rank** of \(f\) at \(p\) is \(\operatorname{rank}(df_p)\). A map \(f : M \to N\) is an **immersion** if \(df_p\) is injective for all \(p\) (so \(\dim M \leq \dim N\)), and a **submersion** if \(df_p\) is surjective for all \(p\).

<div class="theorem">
<strong>Theorem 1.5 (Rank Theorem).</strong> If \(f : M \to N\) has constant rank \(r\) in a neighbourhood of \(p\), then there exist charts around \(p\) and \(f(p)\) in which \(f\) takes the standard form \((x^1, \ldots, x^m) \mapsto (x^1, \ldots, x^r, 0, \ldots, 0)\). In particular, the level set \(f^{-1}(q)\) near \(p\) is a smooth submanifold of \(M\) of dimension \(m - r\).
</div>

This theorem will be used repeatedly: to show that \(SL(n, \mathbb{R})\), \(O(n)\), and the other classical groups are smooth submanifolds of \(GL(n, \mathbb{R})\).

## 1.3 Vector Fields and the Lie Bracket

A **smooth vector field** on \(M\) is a smooth assignment \(X : M \to TM\) with \(X(p) \in T_p M\). Equivalently, \(X\) is a derivation on \(C^\infty(M)\): an \(\mathbb{R}\)-linear map \(X : C^\infty(M) \to C^\infty(M)\) satisfying \(X(fg) = fX(g) + gX(f)\). In local coordinates, \(X = \sum_i a^i(x) \partial/\partial x^i\) with \(a^i \in C^\infty(U)\).

<div class="definition">
<strong>Definition 1.6 (Lie bracket).</strong> The <em>Lie bracket</em> of vector fields \(X, Y\) is the vector field \([X, Y]\) defined by
\[
[X, Y](f) = X(Y(f)) - Y(X(f)).
\]
</div>

One must check this is well-defined (that \([X,Y]\) is again a derivation, not a second-order operator) and smooth. In local coordinates with \(X = \sum_i a^i \partial_i\) and \(Y = \sum_j b^j \partial_j\):

\[
X(Y(f)) = \sum_{i,j} a^i \frac{\partial b^j}{\partial x^i} \frac{\partial f}{\partial x^j} + \sum_{i,j} a^i b^j \frac{\partial^2 f}{\partial x^i \partial x^j}.
\]
The second-order terms are symmetric in \(i, j\) and cancel in \(X(Y(f)) - Y(X(f))\), leaving

\[
[X, Y](f) = \sum_j \left(\sum_i a^i \frac{\partial b^j}{\partial x^i} - b^i \frac{\partial a^j}{\partial x^i}\right) \frac{\partial f}{\partial x^j}.
\]
So \([X, Y] = \sum_j w^j \partial_j\) where \(w^j = \sum_i (a^i \partial_i b^j - b^i \partial_i a^j)\), confirming it is a first-order operator and hence a vector field.

<div class="proposition">
<strong>Proposition 1.7.</strong> The Lie bracket satisfies: (a) bilinearity over \(\mathbb{R}\); (b) skew-symmetry: \([X, Y] = -[Y, X]\); (c) the Jacobi identity: \([[X,Y],Z] + [[Y,Z],X] + [[Z,X],Y] = 0\).
</div>

These three properties make the space of smooth vector fields \(\mathfrak{X}(M)\) into a **Lie algebra** over \(\mathbb{R}\). The Jacobi identity can be verified directly from the definition (expand all three double brackets and observe cancellation), or more elegantly by noting that \(X \mapsto [X, -]\) is a derivation of the bracket: \([X, [Y, Z]] = [[X,Y], Z] + [Y, [X, Z]]\).

**Naturality:** if \(f : M \to N\) is a diffeomorphism, then \(f_*[X, Y] = [f_* X, f_* Y]\) (proved by unwinding the definition: \((f_*[X,Y])(g) = [X,Y](g \circ f) = X(Y(g \circ f)) - Y(X(g \circ f)) = [f_*X, f_*Y](g)\)). This naturality property is essential for proving that the Lie bracket of left-invariant vector fields on a Lie group is again left-invariant.

## 1.4 Submanifolds

<div class="definition">
<strong>Definition 1.8 (Submanifold types).</strong> Let \(M\) be a smooth manifold. A <em>regular submanifold</em> of \(M\) is a subset \(N \subseteq M\) that is a manifold and for which the inclusion \(N \hookrightarrow M\) is an embedding: an injective immersion that is also a homeomorphism onto \(f(N)\) with the subspace topology. An <em>immersed submanifold</em> is the image \(f(N)\) of an injective immersion \(f : N \to M\), equipped with the topology making \(f\) a homeomorphism (which may differ from the subspace topology).
</div>

The distinction matters: the figure-eight \(f : (-\pi, \pi) \to \mathbb{R}^2\) given by \(f(t) = (\sin t, \sin 2t)\) is an immersion whose image is not a regular submanifold (the image has a self-intersection). The line of irrational slope \(f : \mathbb{R} \to \mathbb{T}^2\), \(f(t) = (e^{it}, e^{i\alpha t})\) for irrational \(\alpha\), is an injective immersion whose image is dense in \(\mathbb{T}^2\), hence not an embedding.

<div class="theorem">
<strong>Theorem 1.9.</strong> If \(f : N \to M\) is an injective immersion and \(N\) is compact, then \(f\) is an embedding.
</div>

<div class="proof">
<strong>Proof.</strong> We need to show \(f : N \to f(N)\) is a homeomorphism. It is a continuous bijection from a compact space to a Hausdorff space (since \(M\) and hence \(f(N)\) with the subspace topology is Hausdorff). Any such map is automatically a homeomorphism: if \(K \subseteq N\) is closed, then \(K\) is compact, so \(f(K)\) is compact in the Hausdorff space \(M\), hence closed. So \(f\) sends closed sets to closed sets, i.e., \(f^{-1}\) is continuous.
</div>

---

# Chapter 2: Lie Groups and Lie Algebras

## 2.1 Lie Groups: Definition and Classical Examples

<div class="definition">
<strong>Definition 2.1 (Lie group).</strong> A <em>Lie group</em> is a smooth manifold \(G\) that is also a group, such that the multiplication \(m : G \times G \to G\), \((a, b) \mapsto ab\), and the inversion \(\iota : G \to G\), \(a \mapsto a^{-1}\), are smooth maps.
</div>

The requirement that \(G\) carry both structures simultaneously is far from vacuous: it forces an intricate interplay between the algebraic and geometric structures that is the central subject of this course.

**The basic examples:**

\(\mathbb{R}^n\) and \(\mathbb{C}^n\) under addition are Lie groups of dimensions \(n\) and \(2n\). The torus \(\mathbb{T}^n = (S^1)^n\) under componentwise multiplication is a compact Lie group of dimension \(n\). These are the simplest examples; the rich theory begins with the matrix groups.

The **general linear group** \(GL(n, \mathbb{R}) = \{A \in M_n(\mathbb{R}) : \det A \neq 0\}\) is a Lie group of dimension \(n^2\). It is an open submanifold of \(M_n(\mathbb{R}) \cong \mathbb{R}^{n^2}\) (since \(\det : M_n(\mathbb{R}) \to \mathbb{R}\) is continuous). Multiplication is a polynomial map in the matrix entries, hence smooth; inversion is \(A \mapsto (\det A)^{-1} \operatorname{Adj}(A)\), a rational function with nonzero denominator on \(GL(n, \mathbb{R})\), hence smooth.

Similarly \(GL(n, \mathbb{C})\) is a Lie group of real dimension \(2n^2\).

The **special linear group** \(SL(n, \mathbb{R}) = \ker(\det : GL(n, \mathbb{R}) \to \mathbb{R}^*)\) is the level set of the determinant map. The differential of \(\det\) at \(I\) in direction \(A\) is \(\operatorname{tr}(A)\) (compute \(d/dt|_{t=0} \det(I + tA) = \operatorname{tr}(A)\)), so \(\det : GL \to \mathbb{R}^*\) is a submersion and \(SL(n, \mathbb{R})\) is a regular submanifold of dimension \(n^2 - 1\).

The **orthogonal group** \(O(n) = \{A \in GL(n, \mathbb{R}) : A^T A = I\}\) is the level set of \(\varphi : GL(n, \mathbb{R}) \to \operatorname{Sym}(n)\), \(\varphi(X) = X^T X\). This map has constant rank: for any \(A \in GL\),

\[
\varphi(XA) = A^T X^T X A = L_{A^T}(R_A(\varphi(X))),
\]
so \(D\varphi(XA) \cdot DR_A(X) = DL_{A^T}(\varphi(X)) \cdot DR_A(\varphi(X)) \cdot D\varphi(X)\). Since \(R_A\) and \(L_{A^T}\) are diffeomorphisms, \(\operatorname{rank}(D\varphi(XA)) = \operatorname{rank}(D\varphi(X))\) for all \(X\). By the rank theorem, \(O(n) = \varphi^{-1}(I)\) is a regular submanifold of dimension \(n^2 - n(n+1)/2 = n(n-1)/2\).

The **special orthogonal group** \(SO(n) = O(n) \cap SL(n, \mathbb{R})\) consists of the orientation-preserving orthogonal matrices; it is an open submanifold of \(O(n)\) (since \(\det : O(n) \to \{\pm 1\}\) is locally constant).

The **unitary group** \(U(n) = \{A \in GL(n, \mathbb{C}) : A^* A = I\}\) and **special unitary group** \(SU(n) = U(n) \cap SL(n, \mathbb{C})\) are defined analogously; they are compact Lie groups of real dimensions \(n^2\) and \(n^2 - 1\).

The **symplectic group** (compact form) \(Sp(n) = \{A \in GL(n, \mathbb{H}) : A^* A = I\}\), where \(\mathbb{H}\) is the quaternions and \(A^*\) is the conjugate transpose, is a compact Lie group of real dimension \(n(2n+1)\).

## 2.2 Lie Group Homomorphisms and Constant Rank

<div class="definition">
<strong>Definition 2.2.</strong> A <em>Lie group homomorphism</em> is a smooth group homomorphism \(\varphi : H \to G\). A <em>Lie group isomorphism</em> is a bijective Lie group homomorphism whose inverse is also a Lie group homomorphism (equivalently, a diffeomorphism that is also a group isomorphism).
</div>

<div class="theorem">
<strong>Theorem 2.3 (Constant rank).</strong> Every Lie group homomorphism \(\varphi : H \to G\) has constant rank.
</div>

<div class="proof">
<strong>Proof.</strong> For \(a \in H\), let \(\ell_a : H \to H\) denote left-multiplication. Since \(\varphi(\ell_a(x)) = \varphi(ax) = \varphi(a)\varphi(x) = \ell_{\varphi(a)}(\varphi(x))\), differentiating gives \(D\varphi(ax) \cdot D\ell_a(x) = D\ell_{\varphi(a)}(\varphi(x)) \cdot D\varphi(x)\). Since \(\ell_a\) and \(\ell_{\varphi(a)}\) are diffeomorphisms, their differentials are invertible, so \(\operatorname{rank}(D\varphi(ax)) = \operatorname{rank}(D\varphi(x))\) for all \(a, x \in H\). Setting \(a = x^{-1}\) gives \(\operatorname{rank}(D\varphi(x)) = \operatorname{rank}(D\varphi(e))\) for all \(x\).
</div>

This immediately implies the rank theorem applies globally: kernels and images of Lie group homomorphisms are regular submanifolds (hence Lie subgroups).

## 2.3 Left-Invariant Vector Fields and the Lie Bracket

The key to extracting an algebraic structure from a Lie group is to use the group structure to propagate tangent vectors globally.

<div class="definition">
<strong>Definition 2.4.</strong> A vector field \(X \in \mathfrak{X}(G)\) is <em>left-invariant</em> if \(d(\ell_a)_b(X_b) = X_{ab}\) for all \(a, b \in G\), i.e., \((\ell_a)_* X = X\) for all \(a\).
</div>

Left-invariant vector fields are completely determined by their value at the identity: if \(X_e = A \in T_e G\), then \(X_a = d(\ell_a)_e(A)\) for all \(a \in G\). Conversely, given any \(A \in T_e G\), the prescription \(X_a = d(\ell_a)_e(A)\) defines a smooth left-invariant vector field (smoothness follows because \((a, v) \mapsto d(\ell_a)_e(v)\) is smooth in both arguments). This gives a vector space isomorphism

\[
\{\text{left-invariant vector fields on } G\} \xrightarrow{\;\;\sim\;\;} T_e G, \quad X \mapsto X_e.
\]

The Lie bracket of two left-invariant vector fields is left-invariant (by naturality of the Lie bracket under \(\ell_a\)). So the Lie bracket restricts to a bracket on the finite-dimensional vector space \(T_e G\).

<div class="definition">
<strong>Definition 2.5 (Lie algebra of a Lie group).</strong> The <em>Lie algebra</em> of \(G\), denoted \(\mathfrak{g}\), is the tangent space \(T_e G\) equipped with the bracket \([A, B] = [X_A, X_B]_e\), where \(X_A\) and \(X_B\) are the unique left-invariant vector fields with \((X_A)_e = A\) and \((X_B)_e = B\).
</div>

For matrix Lie groups, this bracket is the matrix commutator. We now derive this explicitly.

<div class="theorem">
<strong>Theorem 2.6.</strong> If \(G \subseteq GL(n, \mathbb{F})\) is a matrix Lie group, then the left-invariant vector field \(X_A\) with \((X_A)_I = A\) satisfies \((X_A)_P = PA\) (left multiplication by \(P\)), and the Lie bracket is \([A, B] = AB - BA\).
</div>

<div class="proof">
<strong>Proof.</strong> For \(G = GL(n, \mathbb{R})\): left-multiplication \(\ell_P : X \mapsto PX\) is linear, so \(D\ell_P(X) = \ell_P\) as a linear map. Thus \((X_A)_P = D\ell_P(I) \cdot A = PA\). For the bracket: the left-invariant field \(X_A\) corresponds to the map \(P \mapsto PA = R_A(P)\) (right-multiplication), so \(D(X_A)_P = R_A\) as a constant map. Then
\[
[X_A, X_B](P) = D(X_B)(P) \cdot (X_A)_P - D(X_A)(P) \cdot (X_B)_P = R_B(PA) - R_A(PB) = PAB - PBA,
\]
so \([A, B] = [X_A, X_B]_I = AB - BA\). For a subgroup \(G \subseteq GL(n, \mathbb{R})\), apply the chain rule with the inclusion map (the inclusion intertwines left-multiplications, so the result inherits).
</div>

## 2.4 Lie Algebras of the Classical Groups

The Lie algebra of a matrix Lie group \(G \subseteq GL(n, \mathbb{F})\) is characterised by

\[
\mathfrak{g} = T_I G = \{A \in M_n(\mathbb{F}) : e^{tA} \in G \text{ for all } t \in \mathbb{R}\}.
\]
(The second equality will be proved once we have the exponential map; for now we compute directly from the first.)

Differentiating the defining equations of each classical group at the identity:

- \(\mathfrak{gl}(n, \mathbb{R}) = M_n(\mathbb{R})\) (no constraint).
- \(\mathfrak{sl}(n, \mathbb{R}) = \{A \in M_n(\mathbb{R}) : \operatorname{tr}(A) = 0\}\). Since \(\det(e^{tA}) = e^{t \operatorname{tr}(A)}\), this equals 1 for all \(t\) iff \(\operatorname{tr}(A) = 0\).
- \(\mathfrak{o}(n) = \mathfrak{so}(n) = \{A \in M_n(\mathbb{R}) : A^T + A = 0\}\). Differentiate \((e^{tA})^T e^{tA} = I\) to get \(A^T + A = 0\). Conversely, if \(A^T = -A\) then \((e^{tA})^T = e^{tA^T} = e^{-tA} = (e^{tA})^{-1}\), so \(e^{tA} \in O(n)\). Dimension: \(n(n-1)/2\).
- \(\mathfrak{u}(n) = \{A \in M_n(\mathbb{C}) : A^* + A = 0\}\). Differentiate \((e^{tA})^* e^{tA} = I\). Dimension: \(n^2\) (over \(\mathbb{R}\)).
- \(\mathfrak{su}(n) = \{A \in M_n(\mathbb{C}) : A^* + A = 0,\ \operatorname{tr}(A) = 0\}\). Dimension: \(n^2 - 1\).
- \(\mathfrak{sp}(n)\) (compact form) consists of quaternion-skew matrices; has real dimension \(n(2n+1)\).

---

# Chapter 3: The Exponential Map

## 3.1 One-Parameter Subgroups

A **one-parameter subgroup** of a Lie group \(G\) is a smooth group homomorphism \(\varphi : (\mathbb{R}, +) \to G\). The defining equations are smoothness and \(\varphi(s + t) = \varphi(s)\varphi(t)\) for all \(s, t \in \mathbb{R}\), with \(\varphi(0) = e\). Setting \(A = \varphi'(0) \in \mathfrak{g}\), we claim that the tangent vector at the identity determines the entire homomorphism.

<div class="theorem">
<strong>Theorem 3.1.</strong> For each \(A \in \mathfrak{g}\), there is a unique one-parameter subgroup \(\varphi_A : \mathbb{R} \to G\) with \(\varphi_A'(0) = A\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(X_A\) be the left-invariant vector field with \((X_A)_e = A\). Let \(\alpha : I \to G\) be the maximal integral curve of \(X_A\) starting at \(e\) (so \(\alpha(0) = e\) and \(\alpha'(t) = (X_A)_{\alpha(t)}\)). For any fixed \(s \in I\), the curves \(t \mapsto \alpha(s + t)\) and \(t \mapsto \alpha(s) \alpha(t)\) both start at \(\alpha(s)\) and satisfy the ODE for \(X_A\) (the second by left-invariance: \(d/dt[\alpha(s)\alpha(t)] = d\ell_{\alpha(s)} \cdot \alpha'(t) = d\ell_{\alpha(s)} \cdot (X_A)_{\alpha(t)} = (X_A)_{\alpha(s)\alpha(t)}\)). By uniqueness, \(\alpha(s + t) = \alpha(s)\alpha(t)\) for \(s, t\) in \(I\). This allows extending \(\alpha\) to all of \(\mathbb{R}\) (if \(I = (-a, b)\), extend to \((-2a, 2b)\) by \(\alpha(s + t) = \alpha(s)\alpha(t)\)), proving \(I = \mathbb{R}\). So \(\alpha = \varphi_A\) is the required homomorphism. Uniqueness: any two one-parameter subgroups with derivative \(A\) at \(e\) satisfy the same ODE, so they coincide.
</div>

## 3.2 The Exponential Map

<div class="definition">
<strong>Definition 3.2 (Exponential map).</strong> The <em>exponential map</em> \(\exp : \mathfrak{g} \to G\) is defined by \(\exp(A) = \varphi_A(1)\), where \(\varphi_A\) is the unique one-parameter subgroup with \(\varphi_A'(0) = A\).
</div>

By rescaling: \(\varphi_A(t) = \varphi_{tA}(1) = \exp(tA)\). So the one-parameter subgroup generated by \(A\) is \(t \mapsto \exp(tA)\), and \(\frac{d}{dt}\exp(tA)\big|_{t=0} = A\).

For matrix Lie groups \(G \subseteq GL(n, \mathbb{F})\), the matrix exponential

\[
e^A = \sum_{k=0}^\infty \frac{A^k}{k!} = I + A + \frac{A^2}{2!} + \frac{A^3}{3!} + \cdots
\]
converges absolutely for every \(A \in M_n(\mathbb{F})\): if \(m = \max_{ij} |A_{ij}|\), then \(\max_{ij}|(A^\ell)_{ij}| \leq (nm)^\ell\) by induction, so \(\sum \|A^k/k!\| \leq \sum (nm)^k/k! = e^{nm} < \infty\). The map \(t \mapsto e^{tA}\) satisfies \(e^{(s+t)A} = e^{sA}e^{tA}\) (from \(e^Ae^B = e^{A+B}\) when \(AB = BA\)) and \((d/dt)e^{tA}\big|_{t=0} = A\), so \(e^{tA}\) is the one-parameter subgroup generated by \(A\), and \(\exp(A) = e^A\).

<div class="theorem">
<strong>Theorem 3.3 (det = exp tr).</strong> For \(A \in M_n(\mathbb{F})\),
\[
\det(e^A) = e^{\operatorname{tr}(A)}.
\]
</div>

<div class="proof">
<strong>Proof (ODE method).</strong> Let \(g(t) = \det(e^{tA})\). Differentiating using \(d(\det)_X(H) = \det(X)\operatorname{tr}(X^{-1}H)\):
\[
g'(t) = \det(e^{tA}) \cdot \operatorname{tr}(e^{-tA} \cdot e^{tA} A) = \det(e^{tA}) \cdot \operatorname{tr}(A) = \operatorname{tr}(A) \cdot g(t).
\]
This ODE with \(g(0) = 1\) has unique solution \(g(t) = e^{t \operatorname{tr}(A)}\). At \(t = 1\): \(\det(e^A) = e^{\operatorname{tr}(A)}\).

<em>Alternate proof (Jordan form).</em> Choose \(P \in GL(n, \mathbb{C})\) so \(PAP^{-1} = J\) is Jordan (upper triangular, eigenvalues \(\lambda_1, \ldots, \lambda_n\) on diagonal). Then \(e^J\) is upper triangular with diagonal entries \(e^{\lambda_i}\), so \(\det(e^A) = \det(Pe^AP^{-1}) = \det(e^J) = \prod e^{\lambda_i} = e^{\sum \lambda_i} = e^{\operatorname{tr}(A)}\).
</div>

This shows \(e^A \in SL(n)\) iff \(\operatorname{tr}(A) = 0\), confirming \(\mathfrak{sl}(n) = \ker(\operatorname{tr})\).

<div class="theorem">
<strong>Theorem 3.4 (Local diffeomorphism).</strong> The exponential map \(\exp : \mathfrak{g} \to G\) is a local diffeomorphism near \(0 \in \mathfrak{g}\): there exist open sets \(0 \in U \subseteq \mathfrak{g}\) and \(e \in V \subseteq G\) such that \(\exp : U \to V\) is a diffeomorphism.
</div>

<div class="proof">
<strong>Proof.</strong> By the inverse function theorem, it suffices to show \(d(\exp)_0 = \mathrm{id}\). For \(A \in \mathfrak{g}\), the curve \(\alpha(t) = tA\) in \(\mathfrak{g}\) has \(\alpha(0) = 0\) and \(\alpha'(0) = A\). Then \(d(\exp)_0(A) = (d/dt)|_{t=0} \exp(tA) = (d/dt)|_{t=0} \varphi_A(t) = \varphi_A'(0) = A\). So \(d(\exp)_0 = \mathrm{id}\), and the inverse function theorem applies.
</div>

## 3.3 The Baker-Campbell-Hausdorff Formula

When \(A\) and \(B\) commute, \(e^A e^B = e^{A+B}\). In general, the product \(e^A e^B = e^{C(A,B)}\) for some \(C(A,B)\) that depends on the Lie bracket. The Baker-Campbell-Hausdorff (BCH) formula expresses \(C\) as a formal power series in iterated brackets:

<div class="theorem">
<strong>Theorem 3.5 (Baker-Campbell-Hausdorff).</strong> For \(A, B\) sufficiently small,
\[
\log(e^A e^B) = A + B + \tfrac{1}{2}[A, B] + \tfrac{1}{12}\bigl([A, [A, B]] - [B, [A, B]]\bigr) - \tfrac{1}{24}[B, [A, [A, B]]] + \cdots
\]
where all higher terms involve nested brackets of \(A\) and \(B\).
</div>

The key point is that \(C(A, B)\) lies in the Lie algebra generated by \(A\) and \(B\) under the bracket, not in the larger associative algebra. A clean proof uses the Dynkin formula \(C(A,B) = \sum_{n=1}^\infty \frac{(-1)^{n-1}}{n} \sum_{\substack{p_i + q_i > 0 \\ 1 \leq i \leq n}} \frac{(\operatorname{ad} A)^{p_1}(\operatorname{ad} B)^{q_1} \cdots (\operatorname{ad} A)^{p_n}}{p_1! q_1! \cdots p_n! q_n! (p_n + q_n)} B\) (where terms with \(q_n = 0\) use \(A\) in place of \(B\)).

The BCH formula has a profound consequence: **the local group structure of \(G\) near \(e\) is completely determined by its Lie algebra \(\mathfrak{g}\)**. Two Lie groups have the same local structure (are locally isomorphic) if and only if their Lie algebras are isomorphic. This is why the algebraic theory of Lie algebras captures so much about the geometry of Lie groups.

## 3.4 Naturality and the Exponential Diagram

<div class="theorem">
<strong>Theorem 3.6 (Naturality of exp).</strong> If \(\varphi : H \to G\) is a Lie group homomorphism, then the following diagram commutes:
\[
\begin{array}{ccc}
\mathfrak{h} & \xrightarrow{\ d\varphi_e\ } & \mathfrak{g} \\
\downarrow{\scriptstyle \exp} & & \downarrow{\scriptstyle \exp} \\
H & \xrightarrow{\ \varphi\ } & G
\end{array}
\]
</div>

<div class="proof">
<strong>Proof.</strong> For \(A \in \mathfrak{h}\), the map \(t \mapsto \varphi(\exp_H(tA))\) is a smooth homomorphism \(\mathbb{R} \to G\) whose derivative at \(0\) is \(d\varphi_e(A)\). By uniqueness of one-parameter subgroups (Theorem 3.1), \(\varphi(\exp_H(tA)) = \exp_G(t \cdot d\varphi_e(A))\) for all \(t\). Setting \(t = 1\) gives the result.
</div>

This theorem is indispensable: it means homomorphisms of Lie groups correspond exactly to linear maps between their Lie algebras that preserve the bracket, at least for simply connected groups (the precise statement is Theorem 4.4).

---

# Chapter 4: Connectedness and Covering Theory

## 4.1 Connected Components

<div class="theorem">
<strong>Theorem 4.1.</strong> Let \(G\) be a Lie group and \(G^0\) its identity component (the connected component containing \(e\)). Then \(G^0\) is an open normal subgroup of \(G\), and the connected components of \(G\) are exactly the cosets of \(G^0\). The Lie algebra of \(G^0\) equals the Lie algebra of \(G\).
</div>

<div class="proof">
<strong>Proof.</strong> Since \(\exp : \mathfrak{g} \to G\) is a local diffeomorphism at \(0\), the image \(\exp(U)\) of a small ball \(U \ni 0\) is an open connected neighbourhood of \(e\). So \(G^0\) is open (it contains an open neighbourhood of each of its points, since it contains a neighbourhood of \(e\) and is closed under left-translation). Since \(G^0\) is open, its complement is a union of cosets, each open, so \(G^0\) is also closed. For normality: if \(a \in G^0\) and \(g \in G\), then \(t \mapsto g\exp(tA)g^{-1} = \exp(t \cdot \operatorname{Ad}(g) A)\) shows \(gG^0g^{-1} \subseteq G^0\). Since \(G^0\) is generated by \(\exp(\mathfrak{g})\) (which generates an open subgroup of \(G^0\) and \(G^0\) is connected), the Lie algebra of \(G^0\) is \(\mathfrak{g}\).
</div>

**The Frobenius correspondence.** A Lie subalgebra \(\mathfrak{h} \subseteq \mathfrak{g}\) is a vector subspace closed under the bracket. Frobenius' theorem (the involutive distribution theorem) implies that \(\mathfrak{h}\) determines a unique connected Lie subgroup: form the left-invariant distribution \(\mathcal{D}_a = d(\ell_a)_e(\mathfrak{h}) \subseteq T_a G\); since \(\mathfrak{h}\) is closed under brackets, \(\mathcal{D}\) is involutive; Frobenius gives a unique maximal connected integral submanifold \(H\) through \(e\), and one verifies \(H\) is a subgroup. The result is:

<div class="theorem">
<strong>Theorem 4.2 (Frobenius correspondence).</strong> There is a bijection between connected Lie subgroups of \(G\) and Lie subalgebras of \(\mathfrak{g}\), given by \(H \mapsto \mathfrak{h} = T_e H\). The inverse sends \(\mathfrak{h}\) to the unique connected integral submanifold of the left-invariant distribution defined by \(\mathfrak{h}\).
</div>

## 4.2 Covering Spaces and the Universal Cover

A smooth map \(p : \tilde{M} \to M\) is a **covering map** if every \(x \in M\) has an open neighbourhood \(U\) such that \(p^{-1}(U)\) is a disjoint union of open sets each mapped diffeomorphically onto \(U\). The **universal cover** \(\tilde{M}\) of \(M\) is the unique simply connected covering space (unique up to isomorphism).

<div class="theorem">
<strong>Theorem 4.3 (Lie group structure on the universal cover).</strong> Let \(G\) be a connected Lie group with universal cover \(p : \tilde{G} \to G\). Then \(\tilde{G}\) is a Lie group with the unique group structure making \(p\) a Lie group homomorphism. The kernel \(\ker(p)\) is a discrete central subgroup of \(\tilde{G}\) isomorphic to \(\pi_1(G)\).
</div>

<div class="proof">
<strong>Proof (sketch).</strong> Fix a lift \(\tilde{e} \in p^{-1}(e)\). To define multiplication on \(\tilde{G}\): given \(\tilde{a}, \tilde{b} \in \tilde{G}\), choose paths \(\tilde{\alpha}\) from \(\tilde{e}\) to \(\tilde{a}\) and \(\tilde{\beta}\) from \(\tilde{e}\) to \(\tilde{b}\); let \(\gamma(t) = (p\circ\tilde\alpha)(t) \cdot (p \circ \tilde\beta)(t)\) (product in \(G\)); lift \(\gamma\) uniquely to a path \(\tilde\gamma\) starting at \(\tilde{e}\); define \(\tilde{a}\tilde{b} = \tilde\gamma(1)\). Independence of choices uses simple-connectedness of \(\tilde{G}\). One verifies the group axioms and smoothness. Centrality of \(\ker(p)\): for \(k \in \ker(p)\), the map \(\tilde g \mapsto \tilde g k \tilde g^{-1}\) is continuous from the connected \(\tilde{G}\) into the discrete \(\ker(p)\), so it is constant; evaluating at \(\tilde{e}\) gives constant value \(k\). Thus \(k \in Z(\tilde{G})\).
</div>

<div class="theorem">
<strong>Theorem 4.4 (Lie's correspondence for simply connected groups).</strong> If \(H\) is simply connected, then for any Lie group \(G\) there is a bijection
\[
\{\text{Lie group homomorphisms } \varphi : H \to G\} \xrightarrow{\;\sim\;} \{\text{Lie algebra homomorphisms } \psi : \mathfrak{h} \to \mathfrak{g}\},
\]
given by \(\varphi \mapsto d\varphi_e\).
</div>

<div class="proof">
<strong>Proof.</strong> <em>Injectivity:</em> If \(d\varphi_e = d\psi_e\), then \(\varphi(\exp A) = \exp(d\varphi_e A) = \exp(d\psi_e A) = \psi(\exp A)\) for all \(A\) by naturality. Since \(H\) is connected, any open neighbourhood of \(e\) generates \(H\), and \(\exp(\mathfrak{h})\) contains such a neighbourhood, so \(\varphi = \psi\) on all of \(H\).

<em>Surjectivity:</em> Given \(\psi : \mathfrak{h} \to \mathfrak{g}\), consider the diagonal subalgebra \(\mathfrak{k} = \{(A, \psi A) : A \in \mathfrak{h}\} \subseteq \mathfrak{h} \oplus \mathfrak{g}\). Since \(\psi\) is a Lie algebra homomorphism, \(\mathfrak{k}\) is a Lie subalgebra of \(\mathfrak{h} \oplus \mathfrak{g}\). By Frobenius, there is a connected Lie subgroup \(K \subseteq H \times G\) with \(T_e K = \mathfrak{k}\). The projection \(\pi_H : K \to H\) has \(d(\pi_H)_e : \mathfrak{k} \to \mathfrak{h}\) given by \((A, \psi A) \mapsto A\), which is an isomorphism. By the constant rank theorem, \(\pi_H\) is a covering map. Since \(H\) is simply connected, \(\pi_H\) is an isomorphism. Define \(\varphi = \pi_G \circ \pi_H^{-1} : H \to G\); then \(d\varphi_e = d(\pi_G)_e \circ d(\pi_H)_e^{-1}\), which sends \(A \mapsto \psi A\), so \(d\varphi_e = \psi\).
</div>

---

# Chapter 5: Fundamental Groups of the Classical Lie Groups

## 5.1 Deformation Retracts

Computing \(\pi_1\) of the classical groups requires identifying them up to homotopy equivalence with more familiar spaces. The key tool is the Gram-Schmidt orthogonalisation process.

<div class="theorem">
<strong>Theorem 5.1 (Gram-Schmidt deformation retract).</strong> \(SL(n, \mathbb{R})\) deformation retracts onto \(SO(n)\). Consequently \(\pi_1(SL(n, \mathbb{R})) \cong \pi_1(SO(n))\). Similarly, \(GL^+(n, \mathbb{R}) \cong SL(n, \mathbb{R}) \times \mathbb{R}^+\) so \(\pi_1(GL^+(n,\mathbb{R})) \cong \pi_1(SO(n))\). And \(SL(n, \mathbb{C})\) deformation retracts onto \(SU(n)\).
</div>

The deformation retract for real matrices is constructed in three steps. Given \(A \in SL(n, \mathbb{R})\) with columns \(u_1, \ldots, u_n\):
1. **Upper-triangularise**: for each pair \(i < j\), subtract \(\frac{\langle u_j, u_i \rangle}{\|u_i\|^2} u_i\) from \(u_j\), making columns orthogonal; this is a path in \(SL(n, \mathbb{R})\) (the transformation is upper-triangular with 1s on the diagonal).
2. **Normalise**: scale each column \(u_k \mapsto u_k/\|u_k\|\); this is a path in \(SL(n, \mathbb{R})\) (adjust the last column to maintain determinant 1).
3. **Reach \(SO(n)\)**: the result has orthonormal columns, so lies in \(O(n)\cap SL(n,\mathbb{R}) = SO(n)\).

Each step is continuous in \(A\), giving a continuous retraction \(r : SL(n, \mathbb{R}) \to SO(n)\) with \(r|_{SO(n)} = \mathrm{id}\).

## 5.2 Fundamental Groups of \(SO(n)\)

\(SO(1) = \{1\}\), so \(\pi_1 = 0\). \(SO(2) \cong S^1\) via \(R_\theta \leftrightarrow e^{i\theta}\), so \(\pi_1(SO(2)) = \mathbb{Z}\). For \(n = 3\): \(SO(3)\) is homeomorphic to \(\mathbb{R}P^3\) (identify a rotation with the pair (axis, angle \(\theta \in [0,\pi]\)), modulo the relation that a rotation by \(\pi\) around \(u\) equals a rotation by \(\pi\) around \(-u\)). Since \(\pi_1(\mathbb{R}P^3) = \mathbb{Z}/2\mathbb{Z}\), we get \(\pi_1(SO(3)) = \mathbb{Z}/2\mathbb{Z}\).

For general \(n \geq 3\), we use the fibre bundle

\[
SO(n) \hookrightarrow SO(n+1) \twoheadrightarrow S^n,
\]
where \(SO(n+1)\) acts transitively on \(S^n\) (via \(A \cdot e_{n+1} = \) last column of \(A\)) with stabiliser of \(e_{n+1}\) being \(\{A : Ae_{n+1}=e_{n+1}\} \cong SO(n)\). The long exact homotopy sequence gives:

\[
\cdots \to \pi_2(S^n) \to \pi_1(SO(n)) \to \pi_1(SO(n+1)) \to \pi_1(S^n) \to \cdots
\]
For \(n \geq 3\): \(\pi_2(S^n) = 0\) and \(\pi_1(S^n) = 0\), so \(\pi_1(SO(n)) \cong \pi_1(SO(n+1))\). By induction from \(\pi_1(SO(3)) = \mathbb{Z}/2\mathbb{Z}\): **\(\pi_1(SO(n)) = \mathbb{Z}/2\mathbb{Z}\) for all \(n \geq 3\)**.

## 5.3 Fundamental Groups of \(SU(n)\) and \(Sp(n)\)

**\(SU(2) \cong S^3\):** Write \(SU(2) = \left\{\begin{pmatrix}a & -\bar{b}\\ b & \bar{a}\end{pmatrix} : |a|^2 + |b|^2 = 1\right\}\). The map \(\begin{pmatrix}a & -\bar{b}\\ b & \bar{a}\end{pmatrix} \mapsto (a, b) \in \mathbb{C}^2\) identifies \(SU(2)\) with \(S^3 = \{(a,b) \in \mathbb{C}^2 : |a|^2+|b|^2=1\}\). So \(\pi_1(SU(2)) = \pi_1(S^3) = 0\).

For \(n \geq 2\): the fibre bundle \(SU(n) \hookrightarrow SU(n+1) \twoheadrightarrow S^{2n+1}\) gives a long exact sequence with \(\pi_2(S^{2n+1}) = \pi_1(S^{2n+1}) = 0\) (for \(n \geq 1\)), so \(\pi_1(SU(n)) \cong \pi_1(SU(n+1))\). By induction from \(\pi_1(SU(1)) = 0\): **\(\pi_1(SU(n)) = 0\) for all \(n \geq 1\)**. Similarly \(\pi_1(Sp(n)) = 0\) via the bundle \(Sp(n) \hookrightarrow Sp(n+1) \twoheadrightarrow S^{4n+3}\).

## 5.4 Spin Groups and the Map \(SU(2) \to SO(3)\)

Since \(\pi_1(SO(n)) = \mathbb{Z}/2\mathbb{Z}\) for \(n \geq 3\), the universal cover \(\mathrm{Spin}(n) \to SO(n)\) is a 2-sheeted covering. For \(n = 3\): since \(SU(2)\) is simply connected and there is a 2-to-1 Lie group homomorphism \(\Phi : SU(2) \to SO(3)\), we have \(\mathrm{Spin}(3) \cong SU(2)\).

The map \(\Phi\) is constructed as follows. Identify \(\mathbb{R}^3\) with the traceless skew-Hermitian matrices \(\mathfrak{su}(2) = \left\{\begin{pmatrix}it & -\bar{z}\\ z & -it\end{pmatrix} : t \in \mathbb{R},\, z \in \mathbb{C}\right\} \cong \mathbb{R}^3\) (with the Euclidean inner product \(\langle X, Y\rangle = -\frac{1}{2}\mathrm{tr}(XY)\)). For \(A \in SU(2)\), define \(\Phi(A)(X) = AXA^{-1} = AXA^*\). This is an isometry of \(\mathfrak{su}(2)\) with determinant 1 (since \(A \mapsto AXA^*\) is connected to the identity through \(e^{tB}\)), so \(\Phi(A) \in SO(3)\). The kernel is \(\{A : AXA^* = X \ \forall X\} = Z(SU(2)) = \{\pm I\}\). Since \(\dim SU(2) = \dim SO(3) = 3\) and \(\Phi\) has trivial differential kernel (as one checks), \(\Phi\) is a 2-to-1 surjective covering homomorphism.

---

# Chapter 6: Abelian Lie Groups and Maximal Tori

## 6.1 Abelian Lie Groups

<div class="theorem">
<strong>Theorem 6.1.</strong> A connected Lie group \(G\) is abelian if and only if its Lie algebra \(\mathfrak{g}\) is abelian (i.e., \([A, B] = 0\) for all \(A, B \in \mathfrak{g}\)).
</div>

<div class="proof">
<strong>Proof.</strong> \((\Rightarrow)\) If \(G\) is abelian, then for all \(A, B \in \mathfrak{g}\) and all \(s, t \in \mathbb{R}\):
\[
\exp(sA)\exp(tB) = \exp(tB)\exp(sA).
\]
Differentiate with respect to \(s\): \(\exp(sA) \cdot A \cdot \exp(tB) = \exp(tB)\exp(sA) \cdot A\). At \(s = 0\): \(A\exp(tB) = \exp(tB)A\). Differentiate with respect to \(t\) and set \(t=0\): \(AB - BA = 0\), so \([A,B]=0\).

\((\Leftarrow)\) If \([A,B]=0\), then BCH gives \(\exp(A)\exp(B) = \exp(A+B)\), so exponentials commute. Since \(G\) is connected, every element is a product of exponentials, and products of pairwise commuting elements commute, so \(G\) is abelian.
</div>

<div class="theorem">
<strong>Theorem 6.2 (Structure theorem for compact abelian groups).</strong> Every compact connected abelian Lie group is isomorphic to \(\mathbb{T}^n\) for \(n = \dim G\).
</div>

<div class="proof">
<strong>Proof.</strong> Since \(\mathfrak{g}\) is abelian, \(\exp : \mathfrak{g} \cong \mathbb{R}^n \to G\) is a Lie group homomorphism (from \((\mathbb{R}^n, +)\)). It is a local diffeomorphism (since \(d(\exp)_0 = \mathrm{id}\)), hence a covering map from \(\mathbb{R}^n\) to \(G\) (since \(\mathbb{R}^n\) is simply connected). The kernel \(\Lambda = \ker(\exp)\) is a discrete subgroup of \(\mathbb{R}^n\), hence a lattice. Compactness of \(G = \mathbb{R}^n/\Lambda\) forces \(\Lambda\) to have full rank \(n\). Choosing a basis \(\{u_1,\ldots,u_n\}\) of \(\Lambda\) and changing coordinates so \(u_i = e_i\), we get \(G \cong \mathbb{R}^n/\mathbb{Z}^n = \mathbb{T}^n\).
</div>

<div class="theorem">
<strong>Theorem 6.3 (Discrete subgroups are lattices).</strong> Every discrete subgroup \(\Gamma\) of \(\mathbb{R}^n\) is a lattice \(\Gamma = \mathrm{span}_\mathbb{Z}\{u_1, \ldots, u_\ell\}\) for some linearly independent \(u_i\).
</div>

<div class="proof">
<strong>Proof.</strong> First, \(\Gamma\) is closed: if \(x_k \in \Gamma\) converges to \(x \notin \Gamma\), choose a neighbourhood \(U\) of \(0\) containing no nonzero element of \(\Gamma\) and an open \(U_0 \subseteq U\) with \(a - b \in U\) for \(a, b \in U_0\). Pick distinct \(y = x + a, z = x + b \in (x+U_0)\cap\Gamma\); then \(y-z = a-b \in U \cap \Gamma = \{0\}\), contradiction. Let \(W = \mathrm{span}_\mathbb{R}(\Gamma)\) and pick a \(\mathbb{Z}\)-independent set \(\{w_1,\ldots,w_\ell\} \subseteq \Gamma\) spanning \(W\) over \(\mathbb{R}\). Set \(\Lambda = \mathrm{span}_\mathbb{Z}\{w_i\} \subseteq \Gamma\). The fundamental domain \(P = \{\sum t_i w_i : 0 \leq t_i < 1\}\) is compact, and \(\Gamma \cap P\) is discrete and compact, hence finite. Since every coset of \(\Lambda\) has a unique representative in \(P\), the index \([\Gamma:\Lambda]\) is finite; call it \(m\). Then \(m\Gamma \subseteq \Lambda\), so \(\Gamma \subseteq \frac{1}{m}\Lambda\), which is a free abelian group. Any subgroup of a free abelian group is free abelian, so \(\Gamma\) is a lattice.
</div>

## 6.2 The Closed Subgroup Theorem

One of the most useful structural theorems in Lie theory converts an algebraic condition into smoothness.

<div class="theorem">
<strong>Theorem 6.4 (Closed Subgroup Theorem).</strong> Every closed subgroup \(H\) of a matrix Lie group \(G \subseteq GL(n, \mathbb{F})\) is a regular Lie subgroup (an embedded submanifold and a Lie group under the induced structure).
</div>

<div class="proof">
<strong>Proof.</strong> Define \(\mathfrak{h} = \{A \in \mathfrak{g} : e^{tA} \in H \text{ for all } t \in \mathbb{R}\}\).

<em>Step 1: \(\mathfrak{h}\) is a subspace.</em> Scalar multiples: obvious. Sums: if \(A, B \in \mathfrak{h}\), then by the Lie product (Trotter) formula
\[
e^{t(A+B)} = \lim_{n\to\infty}\bigl(e^{tA/n}e^{tB/n}\bigr)^n.
\]
Each factor \(e^{tA/n}e^{tB/n} \in H\) (since \(H\) is a group), so \((e^{tA/n}e^{tB/n})^n \in H\). Since \(H\) is closed, the limit \(e^{t(A+B)} \in H\), so \(A+B \in \mathfrak{h}\).

<em>Step 2: \(\mathfrak{h}\) is a Lie subalgebra.</em> For \(A, B \in \mathfrak{h}\), the commutator formula gives
\[
[A, B] = \lim_{n\to\infty} n^2\bigl(e^{A/n}e^{B/n}e^{-A/n}e^{-B/n} - I\bigr).
\]
The product \(e^{A/n}e^{B/n}e^{-A/n}e^{-B/n} \in H\), so \(\bigl(e^{A/n}e^{B/n}e^{-A/n}e^{-B/n}\bigr)^{n^2 \cdot t} \in H\) for \(t \in \mathbb{R}\). As \(n \to \infty\) this converges to \(e^{t[A,B]}\), and by closedness \(e^{t[A,B]} \in H\), so \([A,B] \in \mathfrak{h}\).

<em>Step 3: Regular chart.</em> Choose a complementary subspace \(\mathfrak{k}\) with \(\mathfrak{g} = \mathfrak{h} \oplus \mathfrak{k}\). The map \(F : \mathfrak{h} \oplus \mathfrak{k} \to G\), \(F(A, B) = e^A e^B\), satisfies \(dF_{(0,0)} = \mathrm{id}\) (since \(e^A e^B = I + (A+B) + \cdots\)), so \(F\) is a local diffeomorphism near \((0,0)\).

<em>Claim:</em> For small enough \((A, B)\), \(F(A, B) \in H \Leftrightarrow B = 0\). The direction \(B=0 \Rightarrow F(A,0)=e^A \in H\) is clear. For the other direction: suppose for contradiction there exist \((A_j, B_j) \to (0,0)\) with \(B_j \neq 0\) and \(e^{A_j}e^{B_j} \in H\). Since \(e^{A_j} \in H\), we get \(e^{B_j} \in H\). Let \(C_j = B_j/\|B_j\| \in \mathfrak{k}\); pass to a subsequence \(C_j \to C \in \mathfrak{k}\) with \(\|C\|=1\). For any \(t \in \mathbb{R}\): let \(n_j = \lfloor t/\|B_j\|\rfloor\), so \(n_j B_j \to tC\). Then \(e^{n_j B_j} = (e^{B_j})^{n_j} \in H\), and \(e^{n_j B_j} \to e^{tC}\) by continuity of \(\exp\). Since \(H\) is closed, \(e^{tC} \in H\) for all \(t\), so \(C \in \mathfrak{h}\). But \(C \in \mathfrak{k}\) and \(\mathfrak{h} \cap \mathfrak{k} = \{0\}\), contradicting \(\|C\|=1\).

So \(F\) restricts to a chart near \((0,0)\) in which \(H\) corresponds to \(\mathfrak{h} \times \{0\}\). Translating by left-multiplication gives a regular chart at every point of \(H\).
</div>

## 6.3 Maximal Tori and Cartan Subalgebras

<div class="definition">
<strong>Definition 6.5.</strong> A <em>maximal torus</em> in a compact Lie group \(G\) is a maximal compact connected abelian Lie subgroup. By the structure theorem (Theorem 6.2), every maximal torus is isomorphic to \(\mathbb{T}^k\) for some \(k\). The corresponding Lie subalgebra \(\mathfrak{t} = T_e T\) is a <em>Cartan subalgebra</em> of \(\mathfrak{g}\): a maximal abelian subalgebra. The dimension \(k = \dim T = \dim \mathfrak{t}\) is the <em>rank</em> of \(G\).
</div>

The maximal tori in the classical compact Lie groups are:
- \(SO(2n)\): diagonal blocks \(T = \{\mathrm{diag}(R_{\theta_1},\ldots,R_{\theta_n})\}\), rank \(n\), where \(R_\theta = \bigl(\begin{smallmatrix}\cos\theta&-\sin\theta\\\sin\theta&\cos\theta\end{smallmatrix}\bigr)\).
- \(SO(2n+1)\): \(T = \{\mathrm{diag}(R_{\theta_1},\ldots,R_{\theta_n},1)\}\), rank \(n\).
- \(U(n)\): \(T = \{\mathrm{diag}(e^{i\theta_1},\ldots,e^{i\theta_n})\}\), rank \(n\).
- \(SU(n)\): same with \(\sum\theta_k = 0\), rank \(n-1\).
- \(Sp(n)\): \(T = \{\mathrm{diag}(e^{i\theta_1},\ldots,e^{i\theta_n},e^{-i\theta_1},\ldots,e^{-i\theta_n})\}\) (under \(Sp(n) \subset U(2n)\)), rank \(n\).

<div class="theorem">
<strong>Theorem 6.6 (Conjugacy of maximal tori and surjectivity of exp).</strong> Let \(G\) be a compact connected Lie group with maximal torus \(T\). Then:
<ol>
<li>All maximal tori of \(G\) are conjugate: if \(S, T\) are maximal tori then \(\exists P \in G\) with \(PSP^{-1} = T\).</li>
<li>Every element of \(G\) is conjugate into \(T\): \(G = \bigcup_{P \in G} PTP^{-1}\).</li>
<li>The exponential map \(\exp : \mathfrak{g} \to G\) is surjective.</li>
</ol>
</div>

<div class="proof">
<strong>Proof sketch.</strong> Fix an \(\mathrm{Ad}\)-invariant inner product on \(\mathfrak{g}\) (obtained by averaging any inner product over \(G\)). Choose \(B \in \mathfrak{t}\) with \(\mathfrak{t} = \mathfrak{z}_\mathfrak{g}(B) = \{X \in \mathfrak{g} : [B,X]=0\}\) (such a <em>regular element</em> \(B\) exists by a dimension-counting argument). For any \(A \in \mathfrak{g}\), consider \(f(P) = (B, \mathrm{Ad}(P)A) = (B, PAP^{-1})\) as a function on the compact group \(G\). At a maximum \(P_0\): for all \(X \in \mathfrak{g}\),
\[
0 = \frac{d}{dt}\bigg|_{t=0} f(e^{tX}P_0) = \bigl(B, [X, P_0 A P_0^{-1}]\bigr) = -\bigl([B, X], P_0AP_0^{-1}\bigr).
\]
Since \((\cdot,\cdot)\) is non-degenerate, \([B, P_0AP_0^{-1}] = 0\), so \(P_0 A P_0^{-1} \in \mathfrak{z}_\mathfrak{g}(B) = \mathfrak{t}\). Thus every \(A \in \mathfrak{g}\) is conjugate into \(\mathfrak{t}\), proving (1) for Cartan subalgebras and hence (1) for maximal tori. Claim (2) follows: every \(g \in G\) is \(\exp(A)\) for some \(A\) in some conjugate of \(\mathfrak{t}\) (since \(T \cong \mathbb{T}^n\) and \(\exp: \mathfrak{t} \to T\) is surjective for tori), so \(g \in PTP^{-1}\). Claim (3) follows immediately from (2).
</div>

---

# Chapter 7: Structure Theory of Lie Algebras

The structure theory of Lie algebras — the classification of solvable, nilpotent, and semisimple algebras — is one of the great achievements of nineteenth and early twentieth century mathematics, largely due to Wilhelm Killing and Élie Cartan. For our purposes in representation theory, the most important results are Weyl's theorem on complete reducibility and the classification of semisimple algebras by root systems. This chapter develops the algebraic foundations.

## 7.1 Solvable and Nilpotent Lie Algebras

<div class="definition">
<strong>Definition 7.1.</strong> The <em>derived algebra</em> is \([\mathfrak{g}, \mathfrak{g}] = \mathrm{span}\{[X,Y] : X, Y \in \mathfrak{g}\}\), which is an ideal of \(\mathfrak{g}\). The <em>derived series</em> is \(\mathfrak{g}^{(0)} = \mathfrak{g}\), \(\mathfrak{g}^{(k+1)} = [\mathfrak{g}^{(k)}, \mathfrak{g}^{(k)}]\). The <em>lower central series</em> is \(\mathfrak{g}^0 = \mathfrak{g}\), \(\mathfrak{g}^{k+1} = [\mathfrak{g}, \mathfrak{g}^k]\). We say \(\mathfrak{g}\) is <em>solvable</em> if \(\mathfrak{g}^{(k)} = 0\) for some \(k\), and <em>nilpotent</em> if \(\mathfrak{g}^k = 0\) for some \(k\).
</div>

Every nilpotent Lie algebra is solvable (since \(\mathfrak{g}^{(k)} \subseteq \mathfrak{g}^k\)). The paradigm examples: the algebra \(\mathfrak{b}_n\) of upper triangular \(n \times n\) matrices is solvable (its derived algebra is strictly upper triangular, which is nilpotent). The algebra \(\mathfrak{n}_n\) of strictly upper triangular matrices is nilpotent. The algebra \(\mathfrak{gl}(n)\) for \(n \geq 2\) is neither: \([\mathfrak{gl}(n), \mathfrak{gl}(n)] = \mathfrak{sl}(n)\) and \([\mathfrak{sl}(n), \mathfrak{sl}(n)] = \mathfrak{sl}(n)\).

Solvability and nilpotency are preserved under quotients and subalgebras. Extensions of solvable by solvable are solvable: if \(\mathfrak{h}\) is an ideal with \(\mathfrak{h}\) and \(\mathfrak{g}/\mathfrak{h}\) both solvable, then \(\mathfrak{g}\) is solvable.

## 7.2 Engel's Theorem

<div class="definition">
<strong>Definition 7.2.</strong> An element \(X \in \mathfrak{gl}(V)\) is <em>ad-nilpotent</em> if \(\mathrm{ad}(X)^k = 0\) for some \(k\) (where \(\mathrm{ad}(X)(Y) = [X,Y]\)).
</div>

<div class="theorem">
<strong>Theorem 7.3 (Engel's Theorem).</strong> Let \(\mathfrak{g}\) be a Lie algebra and \(\rho : \mathfrak{g} \to \mathfrak{gl}(V)\) a representation such that \(\rho(X)\) is nilpotent for every \(X \in \mathfrak{g}\). Then there exists \(0 \neq v \in V\) with \(\rho(X)v = 0\) for all \(X \in \mathfrak{g}\).
</div>

<div class="proof">
<strong>Proof.</strong> We induct on \(\dim \mathfrak{g}\). If \(\dim \mathfrak{g} = 1\), say \(\mathfrak{g} = \mathbb{F} \cdot X\), then \(\rho(X)\) is nilpotent, so \(\ker(\rho(X)) \neq 0\), done.

For the inductive step: if \(\mathfrak{g}\) is abelian, any one-dimensional subspace \(\mathfrak{h} = \mathbb{F} \cdot X\) works; otherwise, let \(\mathfrak{h}\) be any proper subalgebra of \(\mathfrak{g}\) that is maximal (exists by dimension). We claim \(\mathfrak{h}\) has codimension 1. Indeed, \(\mathfrak{h}\) acts on \(\mathfrak{g}/\mathfrak{h}\) via the adjoint: \(h \cdot (X + \mathfrak{h}) = [h, X] + \mathfrak{h}\). Since \(\mathrm{ad}(h)\) is nilpotent for each \(h \in \mathfrak{h}\), by the inductive hypothesis (applied to \(\mathfrak{h} \to \mathfrak{gl}(\mathfrak{g}/\mathfrak{h})\)) there exists a nonzero \(Y + \mathfrak{h} \in \mathfrak{g}/\mathfrak{h}\) annihilated by all of \(\mathfrak{h}\), meaning \([h, Y] \in \mathfrak{h}\) for all \(h\). But then \(\mathfrak{h} + \mathbb{F}Y\) is a strictly larger subalgebra (it is closed under the bracket since \([\mathfrak{h}, Y] \subseteq \mathfrak{h}\) and \([Y,Y]=0\)). By maximality, \(\mathfrak{h} + \mathbb{F}Y = \mathfrak{g}\), so \(\mathfrak{h}\) has codimension 1.

Now let \(W = \{v \in V : \rho(h)v = 0 \text{ for all } h \in \mathfrak{h}\}\). By the inductive hypothesis, \(W \neq 0\). For any \(Y \in \mathfrak{g} \setminus \mathfrak{h}\) and \(w \in W\) and \(h \in \mathfrak{h}\):

\[
\rho(h)(\rho(Y)w) = \rho(Y)(\rho(h)w) + \rho([h,Y])w = \rho(Y)(0) + \rho([h,Y])w = 0
\]
since \([h,Y] \in \mathfrak{h}\) and \(w \in W\). So \(\rho(Y)\) maps \(W\) to \(W\). Since \(\rho(Y)\) is nilpotent, \(\ker(\rho(Y)|_W) \neq 0\), giving a vector killed by both \(\mathfrak{h}\) and \(Y\), hence by all of \(\mathfrak{g}\).
</div>

<div class="corollary">
<strong>Corollary 7.4 (Engel).</strong> \(\mathfrak{g}\) is nilpotent if and only if \(\mathrm{ad}(X)\) is nilpotent for every \(X \in \mathfrak{g}\).
</div>

## 7.3 Lie's Theorem

<div class="theorem">
<strong>Theorem 7.5 (Lie's Theorem).</strong> Let \(\mathfrak{g}\) be a solvable Lie algebra over \(\mathbb{C}\) and \(\rho : \mathfrak{g} \to \mathfrak{gl}(V)\) a finite-dimensional representation. Then there exists a common eigenvector for all of \(\rho(\mathfrak{g})\): a nonzero \(v \in V\) and a linear functional \(\lambda : \mathfrak{g} \to \mathbb{C}\) with \(\rho(X)v = \lambda(X)v\) for all \(X \in \mathfrak{g}\).
</div>

<div class="proof">
<strong>Proof.</strong> Induct on \(\dim \mathfrak{g}\). Since \(\mathfrak{g}\) is solvable and nontrivial, \([\mathfrak{g},\mathfrak{g}] \subsetneq \mathfrak{g}\). Choose a codimension-1 ideal \(\mathfrak{h} \supseteq [\mathfrak{g},\mathfrak{g}]\) (any hyperplane in the abelian quotient \(\mathfrak{g}/[\mathfrak{g},\mathfrak{g}]\) pulls back to such an \(\mathfrak{h}\)). By induction, there exists \(0 \neq v_0 \in V\) and \(\mu : \mathfrak{h} \to \mathbb{C}\) with \(\rho(h)v_0 = \mu(h)v_0\) for all \(h \in \mathfrak{h}\). Let \(W = \{w \in V : \rho(h)w = \mu(h)w \ \forall h \in \mathfrak{h}\}\); then \(v_0 \in W\).

For any \(Y \in \mathfrak{g}\) with \(\mathfrak{g} = \mathfrak{h} \oplus \mathbb{C}Y\): we show \(\rho(Y)\) maps \(W\) to \(W\). For \(w \in W\) and \(h \in \mathfrak{h}\):

\[
\rho(h)(\rho(Y)w) = \rho(Y)(\rho(h)w) + \rho([h,Y])w = \mu(h)\rho(Y)w + \mu([h,Y])w.
\]
For this to equal \(\mu(h)(\rho(Y)w)\), we need \(\mu([h,Y]) = 0\). This is the key step: consider the sequence \(w_0 = w, w_k = \rho(Y)^k w\). The span \(W_k = \mathrm{span}\{w_0,\ldots,w_k\}\) is \(\mathfrak{h}\)-invariant (by induction) and \(\rho(h)\) acts on \(W_k\) with trace \((k+1)\mu(h)\) (since on the basis \(w_j\), \(\rho(h)w_j = \mu(h)w_j + (\text{lower terms})\) by the same induction). But \(\mathrm{tr}_{\rho|_{W_k}}([h,Y]) = \mathrm{tr}([\rho(h),\rho(Y)]|_{W_k}) = 0\) (trace of a commutator vanishes). So \((k+1)\mu([h,Y]) = 0\) for all \(k\), and over \(\mathbb{C}\), \(\mu([h,Y]) = 0\).

So \(W\) is \(\rho(Y)\)-invariant. Since \(\mathbb{C}\) is algebraically closed, \(\rho(Y)|_W\) has an eigenvector in \(W\), which is then a common eigenvector for all of \(\mathfrak{g}\).
</div>

## 7.4 The Killing Form and Cartan's Criterion

<div class="definition">
<strong>Definition 7.6 (Killing form).</strong> The <em>Killing form</em> of \(\mathfrak{g}\) is the symmetric bilinear form
\[
B(X, Y) = \operatorname{tr}(\mathrm{ad}(X) \circ \mathrm{ad}(Y)),
\]
where \(\mathrm{ad}(X)(Z) = [X,Z]\) and the trace is taken in \(\mathfrak{gl}(\mathfrak{g})\).
</div>

The Killing form is **\(\mathrm{ad}\)-invariant**: \(B([X,Z], Y) + B(Z, [X,Y]) = 0\), i.e., \(B([X,Z],Y) = -B(Z,[X,Y])\). This follows from the trace identity \(\mathrm{tr}([A,B]C) = \mathrm{tr}(A[B,C])\) applied to \(\mathrm{ad}(X), \mathrm{ad}(Z), \mathrm{ad}(Y)\).

<div class="theorem">
<strong>Theorem 7.7 (Cartan's Criterion for Solvability).</strong> \(\mathfrak{g}\) is solvable over \(\mathbb{C}\) if and only if \(B(X, Y) = 0\) for all \(X \in [\mathfrak{g},\mathfrak{g}]\) and \(Y \in \mathfrak{g}\).
</div>

<div class="theorem">
<strong>Theorem 7.8 (Cartan's Criterion for Semisimplicity).</strong> \(\mathfrak{g}\) is semisimple if and only if its Killing form is non-degenerate.
</div>

A Lie algebra is **semisimple** if its radical (the largest solvable ideal) is zero, equivalently if it has no nonzero abelian ideals.

<div class="theorem">
<strong>Theorem 7.9 (Semisimple decomposition).</strong> Every semisimple Lie algebra is a direct sum of simple ideals (Lie algebras with no proper nonzero ideals): \(\mathfrak{g} = \mathfrak{g}_1 \oplus \cdots \oplus \mathfrak{g}_k\). This decomposition is unique.
</div>

## 7.5 Weyl's Theorem and the Casimir Element

<div class="definition">
<strong>Definition 7.10 (Casimir element).</strong> Let \(\rho : \mathfrak{g} \to \mathfrak{gl}(V)\) be a faithful representation of a semisimple algebra \(\mathfrak{g}\) such that the induced bilinear form \(B_\rho(X,Y) = \mathrm{tr}(\rho(X)\rho(Y))\) is non-degenerate. Let \(\{X_i\}\) be a basis of \(\mathfrak{g}\) with dual basis \(\{X^i\}\) (so \(B_\rho(X_i, X^j) = \delta_{ij}\)). The <em>Casimir element</em> is
\[
C_\rho = \sum_i \rho(X_i)\rho(X^i) \in \mathfrak{gl}(V).
\]
</div>

<div class="proposition">
<strong>Proposition 7.11.</strong> \(C_\rho\) commutes with all \(\rho(X)\), \(X \in \mathfrak{g}\), and satisfies \(\mathrm{tr}(C_\rho) = \dim \mathfrak{g}\).
</div>

The commutation follows from the \(\mathrm{ad}\)-invariance of \(B_\rho\): \([\rho(X), C_\rho] = \sum_i [\rho(X), \rho(X_i)]\rho(X^i) + \rho(X_i)[\rho(X),\rho(X^i)] = \sum_i \rho([X,X_i])\rho(X^i) + \rho(X_i)\rho([X,X^i])\), which telescopes to zero when the basis transformation induced by \(\mathrm{ad}(X)\) is taken into account.

<div class="theorem">
<strong>Theorem 7.12 (Weyl's Theorem on Complete Reducibility).</strong> Every finite-dimensional representation of a semisimple Lie algebra over a field of characteristic zero is completely reducible.
</div>

<div class="proof">
<strong>Proof sketch.</strong> It suffices to show every short exact sequence \(0 \to W \to V \to V/W \to 0\) of \(\mathfrak{g}\)-modules splits. Consider first the case \(V/W\) is trivial (dim 1). The Casimir \(C\) acts as \(0\) on the trivial module and as a nonzero scalar \(c\) on any nontrivial irreducible (since \(\mathrm{tr}(C) = \dim\mathfrak{g} > 0\) on the whole space). If \(W\) is irreducible and nontrivial, \(C\) acts as \(cI\) on \(W\) and as \(0\) on \(V/W\), so \(\ker(C) \cap V\) is a complement to \(W\). The general case reduces to this by Hom-tensor adjunctions.
</div>

# Chapter 8: Haar Measure and Integration on Lie Groups

The representation theory of compact Lie groups, which occupies the remainder of these notes, rests on a foundation of analysis: the existence of a canonical, translation-invariant measure on every compact Lie group. This chapter constructs that measure — the **Haar measure** — using the language of differential forms, establishes its key invariance properties, and records the integration identities that will drive all subsequent averaging arguments.

## 8.1 Differential Forms Review

We briefly recall the theory of differential forms, both to fix notation and to set up the construction of Haar measure.

A **\(k\)-form** on a smooth manifold \(M\) is a smooth section of the exterior power bundle \(\bigwedge^k T^*M\). In local coordinates \((x^1, \ldots, x^n)\), every \(k\)-form writes as

\[
\alpha = \sum_{I} a_I(x)\, dx^{i_1} \wedge \cdots \wedge dx^{i_k},
\]
where the sum runs over increasing multi-indices \(I = (i_1 < \cdots < i_k)\). We denote the space of smooth \(k\)-forms on \(M\) by \(\Omega^k(M)\).

<div class="definition">
<strong>Definition 8.1 (Exterior derivative).</strong> The <em>exterior derivative</em> \(d: \Omega^k(M) \to \Omega^{k+1}(M)\) is the unique \(\mathbb{R}\)-linear map satisfying:
<ol>
<li>On \(0\)-forms (smooth functions): \(df = \sum_j \frac{\partial f}{\partial x^j} dx^j\).</li>
<li>\(d(\alpha \wedge \beta) = (d\alpha) \wedge \beta + (-1)^k \alpha \wedge d\beta\) for \(\alpha \in \Omega^k\).</li>
<li>\(d^2 = 0\), i.e., \(d(d\alpha) = 0\) for all \(\alpha\).</li>
</ol>
In coordinates: \(d\!\left(\sum_I a_I\, dx^I\right) = \sum_I \sum_j \frac{\partial a_I}{\partial x^j} dx^j \wedge dx^I\).
</div>

The nilpotency \(d^2=0\) is the algebraic heart of de Rham cohomology.

<div class="definition">
<strong>Definition 8.2 (Pullback).</strong> For a smooth map \(f: M \to N\) and \(\alpha \in \Omega^k(N)\), the <em>pullback</em> \(f^*\alpha \in \Omega^k(M)\) is defined by
\[
(f^*\alpha)_p(v_1, \ldots, v_k) = \alpha_{f(p)}(df_p(v_1), \ldots, df_p(v_k)).
\]
The pullback is natural: \(f^*(d\alpha) = d(f^*\alpha)\) and \(f^*(\alpha \wedge \beta) = f^*\alpha \wedge f^*\beta\).
</div>

An \(n\)-form on an oriented \(n\)-manifold can be integrated. In a positively oriented chart \((U, \varphi)\) with \(\varphi = (x^1,\ldots,x^n)\), if \(\operatorname{supp}(\omega) \subset U\), then

\[
\int_M \omega = \int_{\varphi(U)} a(x)\, dx^1 \cdots dx^n,
\]
where \(\omega = a(x)\, dx^1 \wedge \cdots \wedge dx^n\). A **volume form** on an \(n\)-manifold is a nowhere-vanishing \(n\)-form; its existence is equivalent to orientability.

### 8.1.1 Left-Invariant and Right-Invariant Forms

Let \(G\) be a Lie group of dimension \(n\). For each \(a \in G\), we have the left-translation diffeomorphism \(\ell_a: G \to G\), \(\ell_a(x) = ax\), and the right-translation \(r_a: G \to G\), \(r_a(x) = xa\).

<div class="definition">
<strong>Definition 8.3 (Invariant forms).</strong> A differential form \(\omega \in \Omega^k(G)\) is:
<ul>
<li><em>Left-invariant</em> if \(\ell_a^* \omega = \omega\) for all \(a \in G\), i.e., \((\ell_a^* \omega)_b = \omega_{ab}\) for all \(a, b \in G\).</li>
<li><em>Right-invariant</em> if \(r_a^* \omega = \omega\) for all \(a \in G\).</li>
<li><em>Bi-invariant</em> if it is both left- and right-invariant.</li>
</ul>
</div>

The space of left-invariant \(k\)-forms on \(G\) is in natural bijection with \(\bigwedge^k T_e^* G\): a left-invariant form is uniquely determined by its value at the identity, because

\[
\omega_a = (\ell_{a^{-1}})^* \omega_e \quad \text{for all } a \in G.
\]
In particular, the space of left-invariant \(n\)-forms is one-dimensional (since \(\dim \bigwedge^n T_e^* G = 1\)).

## 8.2 Existence and Uniqueness of Haar Measure

<div class="theorem">
<strong>Theorem 8.4 (Existence and uniqueness of Haar measure).</strong> Let \(G\) be a Lie group of dimension \(n\).
<ol>
<li>There exists a left-invariant volume form \(\omega\) on \(G\), unique up to multiplication by a nonzero real scalar.</li>
<li>If \(G\) is compact, we may normalise \(\int_G \omega = 1\); this determines \(\omega\) up to an overall sign (choice of orientation).</li>
<li>If \(G\) is compact and connected, the normalised left-invariant volume form is also right-invariant, and the inversion map \(\nu: G \to G\), \(\nu(x) = x^{-1}\), satisfies \(\nu^* \omega = \pm \omega\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> <em>Part (1).</em> Fix any nonzero \(\omega_e \in \bigwedge^n T_e^* G\). For each \(a \in G\), define \(\omega_a = (\ell_{a^{-1}})^* \omega_e\). This assignment is smooth in \(a\) and nonzero everywhere (since \(\ell_{a^{-1}}\) is a diffeomorphism), so \(\omega\) is a volume form. Left-invariance: for any \(a, b \in G\),
\[
(\ell_a^* \omega)_b = \ell_a^*(\omega_{ab}) = \ell_a^*\!\left((\ell_{(ab)^{-1}})^* \omega_e\right) = (\ell_{(ab)^{-1}} \circ \ell_a)^* \omega_e = (\ell_{b^{-1}})^* \omega_e = \omega_b.
\]
Uniqueness: if \(\omega'\) is another left-invariant \(n\)-form, then \(\omega'_e = c \cdot \omega_e\) for some \(c \in \mathbb{R} \setminus \{0\}\) (since \(\bigwedge^n T_e^*G\) is one-dimensional), and left-invariance forces \(\omega' = c \cdot \omega\) everywhere.

<em>Part (3).</em> For any \(b \in G\), the form \(r_b^* \omega\) is left-invariant: since \(\ell_a \circ r_b = r_b \circ \ell_a\), we have \(\ell_a^*(r_b^*\omega) = (r_b \circ \ell_a)^* \omega = (l_a \circ r_b)^* \omega = r_b^*(\ell_a^* \omega) = r_b^*\omega\). By uniqueness, \(r_b^* \omega = c(b) \cdot \omega\) for some smooth function \(c: G \to \mathbb{R} \setminus \{0\}\).

The map \(c\) is a group homomorphism: \((r_{ab})^*\omega = r_b^*(r_a^*\omega) = c(a) r_b^* \omega = c(a)c(b)\omega\), so \(c(ab) = c(a)c(b)\). Since \(G\) is compact, \(c(G)\) is compact in \(\mathbb{R} \setminus \{0\}\), so \(c(G) \subseteq \{1, -1\}\). Connectedness of \(G\) and continuity of \(c\) imply \(c\) is constant; since \(c(e) = 1\) (as \(r_e = \operatorname{id}\)), we get \(c \equiv 1\). Thus \(\omega\) is right-invariant.

For inversion: \(\nu = \iota\) satisfies \(\ell_a \circ \nu = \nu \circ r_{a^{-1}}\), so \(\nu^*\omega\) is again left-invariant, giving \(\nu^*\omega = c\omega\) for some constant \(c\). Since \(\nu \circ \nu = \operatorname{id}\), we get \(\nu^*(\nu^*\omega) = c^2 \omega = \omega\), so \(c = \pm 1\). \(\square\)
</div>

<div class="definition">
<strong>Definition 8.5 (Haar measure).</strong> For a compact Lie group \(G\), the <em>Haar measure</em> is the unique Borel probability measure \(\mu\) on \(G\) that is left-invariant (equivalently bi-invariant, by Theorem 8.4(3)). We write
\[
\int_G f(x)\, dx \quad \text{or} \quad \int_G f(g)\, dg
\]
for the integral of a continuous function \(f: G \to \mathbb{C}\) against \(\mu\). The measure is normalised so that \(\int_G 1\, dx = 1\).
</div>

<div class="corollary">
<strong>Corollary 8.6 (Invariance properties of Haar measure).</strong> Let \(G\) be a compact Lie group and \(f: G \to \mathbb{R}\) integrable. For all \(a \in G\):
\[
\int_G f(ax)\, dx = \int_G f(xa)\, dx = \int_G f(x^{-1})\, dx = \int_G f(x)\, dx.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Left-invariance gives the first equality; right-invariance (Theorem 8.4(3)) gives the second. For the third, use the substitution \(y = x^{-1}\), \(dy = \nu^*(dx)\): since \(\nu^*\omega = \pm\omega\) and we choose orientations consistently, the signed change of variables yields \(\int_G f(x^{-1})\, dx = \pm \int_G f(y)\, dy\). Applying this with \(f \equiv 1\) gives \(\pm 1 = 1\), so the sign is \(+1\). \(\square\)
</div>

<div class="remark">
<strong>Remark 8.7.</strong> For non-compact Lie groups, a left-invariant Haar measure still exists (and is unique up to positive scalar) but need not be right-invariant. The ratio \(c(a)\) between left and right translates defines the <em>modular function</em> \(\Delta: G \to \mathbb{R}_{>0}\). Groups with \(\Delta \equiv 1\) are called <em>unimodular</em>; all compact groups and all semisimple groups are unimodular.
</div>

## 8.3 Classical Group Examples

For \(G = \mathrm{U}(n)\), the maximal torus is \(T = \{\operatorname{diag}(e^{i\theta_1}, \ldots, e^{i\theta_n}) : \theta_k \in \mathbb{R}\}\), a copy of \((S^1)^n\). The Haar measure on \(T\) is

\[
d\mu_T = \frac{1}{(2\pi)^n}\, d\theta_1 \wedge \cdots \wedge d\theta_n.
\]
Writing down the Haar measure on all of \(\mathrm{U}(n)\) explicitly requires the Weyl integration formula (Theorem 14.1), which expresses it in terms of the torus measure twisted by the Weyl denominator. For \(\mathrm{SU}(2)\), the Haar measure can be written in Euler angle coordinates, but this is most cleanly expressed via the integration formula of Chapter 14.

The most important consequence of Haar measure for representation theory is the **averaging trick**: given any positive-definite Hermitian form on a representation space, we average it over the group to obtain a \(G\)-invariant one. This is the engine behind Weyl's unitary trick (Theorem 9.2).

---

# Chapter 9: Representation Theory — Foundations

With Haar measure in hand, we can develop the foundations of representation theory for compact Lie groups. The central results of this chapter — Schur's Lemma and Weyl's complete reducibility theorem — are the algebraic pillars supporting everything that follows.

## 9.1 Basic Definitions

<div class="definition">
<strong>Definition 9.1 (Representation).</strong> A (finite-dimensional, complex) <em>representation</em> of a Lie group \(G\) is a smooth group homomorphism \(\rho: G \to \mathrm{GL}(V)\), where \(V\) is a finite-dimensional complex vector space. We often call \(V\) itself a <em>\(G\)-module</em>, with the action written \(a \cdot v = \rho(a)v\). A <em>\(G\)-module homomorphism</em> (or <em>intertwining operator</em>) between \(G\)-modules \(V\) and \(W\) is a linear map \(L: V \to W\) satisfying \(L(a \cdot v) = a \cdot L(v)\) for all \(a \in G\), \(v \in V\). The space of all such operators is denoted \(\mathrm{Hom}_G(V, W)\).
</div>

A \(G\)-module isomorphism is a bijective intertwining operator; we write \(V \cong W\) when such an isomorphism exists. A \(G\)-module \(V\) is:

- <strong>irreducible</strong> (or a <em>simple \(G\)-module</em>) if it has no proper nonzero \(G\)-invariant subspaces;
- <strong>completely reducible</strong> if \(V = V_1 \oplus \cdots \oplus V_k\) as a direct sum of irreducible submodules.

The standard constructions of linear algebra carry \(G\)-module structures:

<div class="definition">
<strong>Definition 9.2 (Standard constructions).</strong> Given \(G\)-modules \(V\) and \(W\):
<ul>
<li><em>Dual:</em> \(V^* = \mathrm{Hom}(V, \mathbb{C})\) with action \((a \cdot f)(v) = f(a^{-1} \cdot v)\).</li>
<li><em>Direct sum:</em> \(V \oplus W\) with \(a \cdot (v, w) = (a \cdot v, a \cdot w)\).</li>
<li><em>Tensor product:</em> \(V \otimes W\) with \(a \cdot (v \otimes w) = (a \cdot v) \otimes (a \cdot w)\).</li>
<li><em>Hom space:</em> \(\mathrm{Hom}(V, W)\) with \((a \cdot L)(v) = a \cdot L(a^{-1} \cdot v)\).</li>
<li><em>Conjugate:</em> \(\bar{V}\), the same underlying abelian group with \(\bar{z} \cdot v\) for scalar \(z\) (i.e., the complex conjugate scalar action) and the same \(G\)-action \(a \cdot v\).</li>
</ul>
</div>

Note that \(\mathrm{Hom}(V, W) \cong V^* \otimes W\) as \(G\)-modules. In particular, \(\mathrm{End}(V) = V^* \otimes V\) and the algebra of \(G\)-endomorphisms is \(\mathrm{End}_G(V) = \mathrm{Hom}_G(V,V)\).

### 9.1.1 Lie Algebra Representations

<div class="definition">
<strong>Definition 9.3 (Lie algebra representation).</strong> A <em>representation</em> of a Lie algebra \(\mathfrak{g}\) on \(V\) is a Lie algebra homomorphism \(\psi: \mathfrak{g} \to \mathrm{End}(V)\), i.e., a linear map satisfying \(\psi([X, Y]) = [\psi(X), \psi(Y)] = \psi(X)\psi(Y) - \psi(Y)\psi(X)\).
</div>

Every Lie group representation \(\rho: G \to \mathrm{GL}(V)\) differentiates to a Lie algebra representation \(\rho_*: \mathfrak{g} \to \mathrm{End}(V)\), where \(\rho_*(X) = \frac{d}{dt}\big|_{t=0} \rho(e^{tX})\). When \(G\) is connected, \(\rho\) is determined by \(\rho_*\); when \(G\) is simply connected, every Lie algebra representation integrates to a unique Lie group representation.

## 9.2 Schur's Lemma

Schur's Lemma is the single most important structural result in representation theory, underlying every orthogonality and classification theorem that follows.

<div class="theorem">
<strong>Theorem 9.4 (Schur's Lemma).</strong> Let \(G\) be a Lie group and \(V, W\) finite-dimensional irreducible \(G\)-modules.
<ol>
<li>If \(V \not\cong W\) as \(G\)-modules, then \(\mathrm{Hom}_G(V, W) = 0\).</li>
<li>If \(V \cong W\), then \(\mathrm{End}_G(V) = \mathrm{Hom}_G(V, V) = \mathbb{C} \cdot \mathrm{Id}_V\) (scalar multiples of the identity).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> Let \(L \in \mathrm{Hom}_G(V, W)\) be nonzero. The kernel \(\ker L\) is a \(G\)-invariant subspace of \(V\): if \(v \in \ker L\) and \(a \in G\), then \(L(a \cdot v) = a \cdot L(v) = a \cdot 0 = 0\), so \(a \cdot v \in \ker L\). Since \(V\) is irreducible and \(\ker L \neq V\) (as \(L \neq 0\)), we get \(\ker L = 0\). Similarly, \(\mathrm{Im}(L)\) is \(G\)-invariant and nonzero, so \(\mathrm{Im}(L) = W\) by irreducibility of \(W\). Thus \(L\) is an isomorphism; (1) follows since \(V \not\cong W\) implies no nonzero such \(L\) can exist.

For (2): take any \(L \in \mathrm{End}_G(V)\). Over \(\mathbb{C}\), \(L\) has an eigenvalue \(\lambda \in \mathbb{C}\). The eigenspace \(E_\lambda = \ker(L - \lambda \mathrm{Id})\) is nonzero; it is \(G\)-invariant because \(L\) commutes with the \(G\)-action:

\[
v \in E_\lambda,\ a \in G \Rightarrow L(a \cdot v) = a \cdot (Lv) = a \cdot (\lambda v) = \lambda (a \cdot v),
\]
so \(a \cdot v \in E_\lambda\). Since \(V\) is irreducible and \(E_\lambda \neq 0\), we have \(E_\lambda = V\), meaning \(L = \lambda \mathrm{Id}\). \(\square\)
</div>

<div class="remark">
<strong>Remark 9.5.</strong> The step "eigenvalues exist over \(\mathbb{C}\)" is essential; this is why Part (2) takes this clean form for complex representations. For real representations, \(\mathrm{End}_G(V)\) can be isomorphic to \(\mathbb{R}\), \(\mathbb{C}\), or \(\mathbb{H}\) (by the real Schur lemma). For instance, \(V_1 \cong \mathbb{C}\) viewed as a real \(\mathrm{SU}(2)\)-module satisfies \(\mathrm{End}_{\mathrm{SU}(2)}^{\mathbb{R}}(V_1) \cong \mathbb{C}\).
</div>

## 9.3 Complete Reducibility for Compact Groups

The compactness of \(G\) — via the Haar averaging trick — is precisely what ensures every representation is completely reducible.

<div class="theorem">
<strong>Theorem 9.6 (Weyl's unitary trick).</strong> Let \(G\) be a compact Lie group and \(V\) a finite-dimensional complex \(G\)-module. Then:
<ol>
<li>\(V\) admits a \(G\)-invariant Hermitian inner product.</li>
<li>Every representation of \(G\) is equivalent to a unitary representation.</li>
<li>Every finite-dimensional representation of \(G\) is completely reducible.</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> <em>Part (1) — Averaging trick.</em> Choose any Hermitian inner product \(\langle \cdot, \cdot \rangle\) on \(V\). Define
\[
(u, v) = \int_G \langle x \cdot u,\, x \cdot v \rangle\, dx.
\]
This integral converges (the integrand is continuous on the compact group \(G\)). Positive definiteness: \((v, v) = \int_G \langle x \cdot v, x \cdot v \rangle\, dx > 0\) for \(v \neq 0\). \(G\)-invariance: for any \(a \in G\),

\[
(a \cdot u, a \cdot v) = \int_G \langle x \cdot (a \cdot u),\, x \cdot (a \cdot v) \rangle\, dx = \int_G \langle (xa) \cdot u,\, (xa) \cdot v \rangle\, dx = \int_G \langle y \cdot u,\, y \cdot v \rangle\, dy = (u, v),
\]
using the substitution \(y = xa\) and right-invariance of Haar measure.

<em>Part (3).</em> Let \(W \subseteq V\) be a \(G\)-invariant subspace. Equip \(V\) with the \(G\)-invariant inner product from (1). We claim \(W^\perp\) is also \(G\)-invariant: for any \(w^\perp \in W^\perp\) and \(u \in W\),
\[
(a \cdot w^\perp, u) = (a \cdot w^\perp, a \cdot (a^{-1} \cdot u)) = (w^\perp, a^{-1} \cdot u).
\]
Since \(a^{-1} \cdot u \in W\) and \(w^\perp \in W^\perp\), this equals zero. Thus \(a \cdot w^\perp \in W^\perp\). So \(V = W \oplus W^\perp\) as \(G\)-modules; complete reducibility follows by induction on \(\dim V\). \(\square\)
</div>

## 9.4 Isotypical Decomposition

Given complete reducibility, we can decompose any representation into isotypical components — the "homogeneous pieces" corresponding to each isomorphism class of irreducibles.

Let \(\hat{G}\) denote a set of representatives for the isomorphism classes of irreducible finite-dimensional \(G\)-modules. For each \(\sigma \in \hat{G}\), let \(E_\sigma\) denote the corresponding irreducible module.

<div class="definition">
<strong>Definition 9.7 (Isotypical component).</strong> For a finite-dimensional \(G\)-module \(V\) and \(\sigma \in \hat{G}\), the <em>\(\sigma\)-isotypical component</em> of \(V\) is
\[
V_\sigma = \sum \{U \subseteq V : U \text{ is a } G\text{-submodule of } V,\ U \cong E_\sigma\}.
\]
The <em>multiplicity</em> of \(\sigma\) in \(V\) is \(m_\sigma(V) = \dim \mathrm{Hom}_G(E_\sigma, V)\).
</div>

<div class="theorem">
<strong>Theorem 9.8 (Isotypical decomposition).</strong> Let \(G\) be a compact Lie group and \(V\) a finite-dimensional \(G\)-module.
<ol>
<li>\(V = \bigoplus_{\sigma \in \hat{G}} V_\sigma\) (orthogonal direct sum with respect to any \(G\)-invariant inner product).</li>
<li>As \(G\)-modules, \(V_\sigma \cong \mathrm{Hom}_G(E_\sigma, V) \otimes E_\sigma\), where \(G\) acts trivially on \(\mathrm{Hom}_G(E_\sigma, V)\).</li>
<li>\(m_\sigma(V) = \dim(V_\sigma)/\dim(E_\sigma)\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof of (2).</strong> Define \(F: \mathrm{Hom}_G(E_\sigma, V) \otimes E_\sigma \to V_\sigma\) by \(F(L \otimes u) = L(u)\) (extended linearly). \(G\)-equivariance: \(F(a \cdot (L \otimes u)) = F(L \otimes (a \cdot u)) = L(a \cdot u) = a \cdot L(u) = a \cdot F(L \otimes u)\), using the fact that \(G\) acts trivially on \(\mathrm{Hom}_G(E_\sigma, V)\) (since each \(L\) is a \(G\)-map, \(a \cdot L = L\)). Surjectivity: any element of \(V_\sigma\) lies in some copy \(L: E_\sigma \hookrightarrow V\) of \(E_\sigma\), and is in the image of \(F\). Injectivity follows by dimension: by Schur's Lemma,
\[
\dim \mathrm{Hom}_G(E_\sigma, V) = \dim \mathrm{Hom}_G\!\left(E_\sigma, \bigoplus_\tau E_\tau^{\oplus m_\tau}\right) = m_\sigma,
\]
so both sides have dimension \(m_\sigma \cdot \dim E_\sigma = \dim V_\sigma\). \(\square\)
</div>

The orthogonality of distinct isotypical components — \(V_\sigma \perp V_\tau\) for \(\sigma \neq \tau\) — follows directly from Schur's Lemma: any \(G\)-invariant map between non-isomorphic irreducibles is zero, so the projection onto \(V_\sigma\) kills all of \(V_\tau\).

---

# Chapter 10: The Peter-Weyl Theorem

The Peter-Weyl theorem is the central analytic theorem of the representation theory of compact Lie groups. It describes how the regular representation on \(L^2(G)\) decomposes, and shows that the matrix coefficients of irreducible representations form an orthonormal basis for \(L^2(G)\). This is the non-commutative generalisation of the classical Fourier theory on the circle.

## 10.1 Matrix Coefficients

<div class="definition">
<strong>Definition 10.1 (Matrix coefficients).</strong> Let \(\rho: G \to \mathrm{GL}(V)\) be a finite-dimensional unitary representation, with Hermitian inner product \((\cdot, \cdot)\). For fixed \(u, v \in V\), the function
\[
\varphi_{u,v}: G \to \mathbb{C}, \quad \varphi_{u,v}(a) = (\rho(a)u, v)
\]
is a <em>matrix coefficient</em> of \(\rho\). In an orthonormal basis \(\{e_i\}\), \(\varphi_{e_j, e_i}(a) = \rho(a)_{ij}\), the \((i,j)\) matrix entry of \(\rho(a)\).
</div>

Matrix coefficients are continuous functions on \(G\). As \(u, v\) vary over \(V\) and \(\rho\) varies over all irreducible representations, these functions span a dense subspace of \(C(G)\) (continuous functions on \(G\)). The Peter-Weyl theorem makes this precise in \(L^2\).

## 10.2 Schur Orthogonality Relations

The orthogonality of matrix coefficients from different irreducible representations is the key computational tool.

<div class="theorem">
<strong>Theorem 10.2 (Schur orthogonality relations).</strong> Let \(G\) be a compact Lie group with normalised Haar measure. Let \(V\) and \(W\) be irreducible unitary \(G\)-modules.
<ol>
<li>If \(V \not\cong W\): for all \(u, u' \in V\) and \(w, w' \in W\),
\[
\int_G (\rho_V(a)u,\, u')\, \overline{(\rho_W(a)w,\, w')}\, da = 0.
\]
</li>
<li>If \(V = W\): for all \(u, u', v, v' \in V\),
\[
\int_G (\rho(a)u,\, u')\, \overline{(\rho(a)v,\, v')}\, da = \frac{1}{\dim V}(u, v)\, \overline{(u', v')}.
\]
In matrix form: \(\int_G \rho_{ij}(a)\, \overline{\rho_{kl}(a)}\, da = \frac{1}{d} \delta_{ik}\delta_{jl}\) where \(d = \dim V\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof sketch.</strong> Define, for any linear map \(A: W \to V\), the average
\[
\tilde{A} = \int_G \rho_V(a)\, A\, \rho_W(a)^{-1}\, da.
\]
This integral converges; the integrand is continuous and takes values in \(\mathrm{Hom}(W, V)\). By direct computation, \(\tilde{A} \in \mathrm{Hom}_G(W, V)\): for \(b \in G\),

\[
\rho_V(b)\tilde{A} = \int_G \rho_V(ba)\, A\, \rho_W(a)^{-1}\, da = \int_G \rho_V(a')\, A\, \rho_W(b^{-1}a')^{-1}\, da' = \tilde{A}\, \rho_W(b),
\]
using the substitution \(a' = ba\).

<em>Part (1).</em> By Schur's Lemma (since \(V \not\cong W\)), \(\tilde{A} = 0\) for all \(A\). Taking \(A = (\cdot, w')_W \otimes u\) (the rank-one map \(z \mapsto (z, w')_W u\)) and computing gives the desired integral.

<em>Part (2).</em> Now \(V = W\), so by Schur's Lemma, \(\tilde{A} = c(A) \mathrm{Id}_V\) for some scalar \(c(A)\). Computing the trace: \(\operatorname{tr}(\tilde{A}) = \int_G \operatorname{tr}(\rho(a)A\rho(a)^{-1})\, da = \operatorname{tr}(A)\), so \(c(A) \cdot d = \operatorname{tr}(A)\), giving \(c(A) = \operatorname{tr}(A)/d\). Taking \(A = (\cdot, v') \otimes v\) (so \(\operatorname{tr}(A) = (v, v')\)) and evaluating \((\tilde{A} u, u') = c(A)(u, u')\) yields the formula. \(\square\)
</div>

## 10.3 Characters

<div class="definition">
<strong>Definition 10.3 (Character).</strong> For a finite-dimensional representation \(\rho: G \to \mathrm{GL}(V)\), the <em>character</em> is the class function
\[
\chi_V: G \to \mathbb{C}, \quad \chi_V(a) = \operatorname{tr}(\rho(a)).
\]
</div>

Characters enjoy several fundamental properties:

- <strong>Class function</strong>: \(\chi_V(bab^{-1}) = \chi_V(a)\) for all \(a, b \in G\) (trace is similarity-invariant).
- <strong>Additivity</strong>: \(\chi_{V \oplus W} = \chi_V + \chi_W\).
- <strong>Multiplicativity</strong>: \(\chi_{V \otimes W} = \chi_V \cdot \chi_W\).
- <strong>Duality</strong>: \(\chi_{V^*} = \overline{\chi_V}\).
- <strong>Isomorphism invariant</strong>: \(V \cong W \Rightarrow \chi_V = \chi_W\). (The converse also holds, as a corollary of the Peter-Weyl theorem.)

<div class="corollary">
<strong>Corollary 10.4 (Orthonormality of characters).</strong> For irreducible \(G\)-modules \(V, W\),
\[
\int_G \chi_V(a)\, \overline{\chi_W(a)}\, da = \delta_{VW} := \begin{cases} 1 & V \cong W \\ 0 & V \not\cong W. \end{cases}
\]
</div>

<div class="proof">
<strong>Proof.</strong> This follows by summing the Schur orthogonality relation (Theorem 10.2) over a diagonal:
\[
\int_G \chi_V \overline{\chi_W}\, da = \sum_{i,j} \int_G \rho_{ii}^V(a) \overline{\rho_{jj}^W(a)}\, da.
\]
In the case \(V \not\cong W\), each term vanishes. In the case \(V = W\), the sum is \(\sum_i (1/d)\delta_{ii}\delta_{ii} = d \cdot (1/d) = 1\). \(\square\)
</div>

<div class="corollary">
<strong>Corollary 10.5 (Character inner product formula).</strong> For finite-dimensional \(G\)-modules \(V, W\):
\[
\langle \chi_V, \chi_W \rangle := \int_G \chi_V(a)\, \overline{\chi_W(a)}\, da = \dim \mathrm{Hom}_G(V, W).
\]
</div>

<div class="proof">
<strong>Proof.</strong> Write \(V = \bigoplus_\sigma E_\sigma^{\oplus m_\sigma}\) and \(W = \bigoplus_\tau E_\tau^{\oplus n_\tau}\). Then \(\chi_V = \sum_\sigma m_\sigma \chi_\sigma\), and
\[
\langle \chi_V, \chi_W \rangle = \sum_{\sigma, \tau} m_\sigma n_\tau \langle \chi_\sigma, \chi_\tau \rangle = \sum_\sigma m_\sigma n_\sigma.
\]
On the other hand, \(\dim \mathrm{Hom}_G(V,W) = \sum_\sigma m_\sigma n_\sigma\) by Schur's Lemma. \(\square\)
</div>

## 10.4 The Peter-Weyl Theorem

The regular representation of \(G\) on \(L^2(G)\) is the representation by left (or right) translations: \((\lambda(a)f)(x) = f(a^{-1}x)\). The Peter-Weyl theorem gives the complete decomposition of this representation.

<div class="theorem">
<strong>Theorem 10.6 (Peter-Weyl).</strong> Let \(G\) be a compact Lie group. Then:
<ol>
<li><em>(Matrix coefficient basis).</em> The matrix coefficients of all irreducible representations, after appropriate normalisation, form an orthonormal basis for \(L^2(G)\). More precisely,
\[
L^2(G) \cong \widehat{\bigoplus}_{\sigma \in \hat{G}}\, E_\sigma \otimes E_\sigma^*
\]
as unitary \(G \times G\)-modules (left \(G\) acts on the \(E_\sigma\) factor by \(\rho_\sigma\), right \(G\) acts on \(E_\sigma^*\) by \(\rho_\sigma^*\)).</li>
<li><em>(Character basis).</em> The characters \(\{\chi_\sigma : \sigma \in \hat{G}\}\) form an orthonormal basis for the Hilbert space \(L^2(G)^G\) of square-integrable class functions on \(G\).</li>
<li><em>(Fourier expansion).</em> Every \(f \in L^2(G)^G\) has a Fourier expansion
\[
f = \sum_{\sigma \in \hat{G}} \langle f, \chi_\sigma \rangle\, \chi_\sigma,
\]
convergent in \(L^2\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof sketch.</strong> The key tool is the spectral theory of compact operators. For \(f \in L^2(G)\), the convolution operator \(T_f: L^2(G) \to L^2(G)\) defined by
\[
(T_f \varphi)(a) = \int_G f(b)\, \varphi(b^{-1}a)\, db
\]
is a compact operator (by a Hilbert-Schmidt argument using the \(L^2\) kernel). When \(f\) is continuous and self-adjoint (i.e., \(f(x^{-1}) = \overline{f(x)}\)), \(T_f\) is compact and self-adjoint. The spectral theorem gives a decomposition of \(L^2(G)\) into finite-dimensional eigenspaces of \(T_f\). Each eigenspace is a closed \(G\)-invariant subspace (since \(T_f\) commutes with left translations), hence decomposes into irreducible \(G\)-modules.

Running over all such \(f\) (e.g., a sequence of approximate identities) and using the orthogonality relations shows that every irreducible \(G\)-module \(E_\sigma\) appears in \(L^2(G)\) with multiplicity \(\dim E_\sigma\): the \((\dim E_\sigma)^2\) matrix coefficients of \(\rho_\sigma\) are orthonormal (by Theorem 10.2) and span the \((E_\sigma \otimes E_\sigma^*)\)-isotypical component. The completeness (density of matrix coefficients) follows from the Stone-Weierstrass theorem applied to the separating algebra they generate. \(\square\)
</div>

<div class="remark">
<strong>Remark 10.7 (Finiteness of irreducibles).</strong> A key consequence of Peter-Weyl is that every irreducible representation of a compact Lie group is finite-dimensional. This stands in sharp contrast to non-compact groups: the principal series representations of \(\mathrm{SL}(2, \mathbb{R})\) are infinite-dimensional irreducible unitary representations.
</div>

<div class="remark">
<strong>Remark 10.8 (Analogy with Fourier series).</strong> For \(G = S^1 = \mathbb{R}/2\pi\mathbb{Z}\), the irreducible representations are the characters \(\chi_n(\theta) = e^{in\theta}\) for \(n \in \mathbb{Z}\), each one-dimensional. The Peter-Weyl decomposition \(L^2(S^1) = \widehat{\bigoplus}_{n \in \mathbb{Z}} \mathbb{C} \cdot e^{in\theta}\) is exactly the classical Fourier series decomposition. For nonabelian \(G\), the matrix coefficients replace the complex exponentials and the summands \(E_\sigma \otimes E_\sigma^*\) have dimension \((\dim E_\sigma)^2 > 1\).
</div>

---

# Chapter 11: Representations of \(\mathrm{SU}(2)\) and \(\mathfrak{sl}(2, \mathbb{C})\)

The representation theory of \(\mathrm{SU}(2)\) is both an important example in its own right and the prototype for the general theory of compact semisimple groups. By working through the \(\mathrm{SU}(2)\) case explicitly — using concrete polynomial models — we build the intuition needed for the general weight theory of Chapter 12 and the Cartan-Weyl classification of Chapter 13.

## 11.1 The Lie Algebra \(\mathfrak{sl}(2, \mathbb{C})\)

Recall from Chapter 5 that \(\mathfrak{su}(2) = \{A \in M_2(\mathbb{C}) : A^* = -A,\ \operatorname{tr}(A) = 0\}\) with basis \(\{i\sigma_j/2\}\) (Pauli matrices). The complexification is

\[
\mathfrak{su}(2)_\mathbb{C} \cong \mathfrak{sl}(2, \mathbb{C}) = \{A \in M_2(\mathbb{C}) : \operatorname{tr}(A) = 0\},
\]
with the standard \(\mathfrak{sl}(2)\) basis:

\[
H = \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}, \quad E = \begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix}, \quad F = \begin{pmatrix} 0 & 0 \\ 1 & 0 \end{pmatrix}.
\]
These satisfy the fundamental commutation relations:

\[
[H, E] = 2E, \quad [H, F] = -2F, \quad [E, F] = H.
\]
Here \(H\) is the <em>Cartan element</em> (weight generator), \(E\) is the <em>raising operator</em>, and \(F\) is the <em>lowering operator</em>. The maximal torus of \(\mathrm{SU}(2)\) is \(T = \{\operatorname{diag}(e^{i\theta}, e^{-i\theta}) : \theta \in \mathbb{R}\}\) with Lie algebra \(\mathfrak{t} = \operatorname{span}_\mathbb{R}\{iH\} \subseteq \mathfrak{su}(2)\), and \(\mathfrak{t}_\mathbb{C} = \operatorname{span}_\mathbb{C}\{H\}\).

## 11.2 The Representations \(V_n\)

For each \(n \geq 0\), define

\[
V_n = \operatorname{span}_\mathbb{C}\{x^n, x^{n-1}y, x^{n-2}y^2, \ldots, y^n\} \subseteq \mathbb{C}[x, y],
\]
the space of complex homogeneous polynomials of degree \(n\) in two variables. This is a vector space of dimension \(n+1\). The group \(\mathrm{SU}(2)\) acts on \(V_n\) by substitution: for

\[
A = \begin{pmatrix} a & b \\ -\bar{b} & \bar{a} \end{pmatrix} \in \mathrm{SU}(2),
\]
\[
(A \cdot f)(x, y) = f(\bar{a}x + \bar{b}y,\ -bx + ay).
\]
(Here we substitute the columns of \(A^{-1} = \begin{pmatrix} \bar{a} & -b \\ \bar{b} & a \end{pmatrix}\) for \((x,y)\).)

Setting \(v_k = x^{n-k}y^k\) for \(k = 0, 1, \ldots, n\), the differentiated action \(\rho_*: \mathfrak{sl}(2,\mathbb{C}) \to \mathrm{End}(V_n)\) is:

<div class="definition">
<strong>Definition 11.1 (Action of \(\mathfrak{sl}(2,\mathbb{C})\) on \(V_n\)).</strong> With the basis \(\{v_k = x^{n-k}y^k : 0 \leq k \leq n\}\):
\[
H \cdot v_k = (n - 2k)\, v_k, \qquad E \cdot v_k = -k\, v_{k-1}, \qquad F \cdot v_k = -(n-k)\, v_{k+1},
\]
with the conventions \(v_{-1} = 0 = v_{n+1}\).
</div>

Several key features are immediate. The element \(H\) acts diagonally on this basis, with eigenvalues \(n, n-2, \ldots, 2-n, -n\); these are the <em>weights</em> of \(V_n\). Each weight space is one-dimensional. The operator \(E\) raises the \(H\)-eigenvalue by \(2\) (it shifts \(v_k \mapsto v_{k-1}\)), and \(F\) lowers it by \(2\) (it shifts \(v_k \mapsto v_{k+1}\)).

## 11.3 Irreducibility of \(V_n\)

<div class="theorem">
<strong>Theorem 11.2.</strong> The representation \(V_n\) of \(\mathrm{SU}(2)\) is irreducible for every \(n \geq 0\).
</div>

<div class="proof">
<strong>Proof.</strong> We work at the Lie algebra level. Let \(L \in \mathrm{End}_{\mathfrak{sl}(2,\mathbb{C})}(V_n)\), i.e., \(L\) commutes with \(H\), \(E\), and \(F\).

Since \(H\) acts on \(V_n\) with distinct eigenvalues \(n, n-2, \ldots, -n\) (each appearing once), and \(LH = HL\), the operator \(L\) must preserve each eigenspace. Thus \(L v_k = c_k v_k\) for some constants \(c_0, \ldots, c_n\).

Now use \(LE = EL\). Applying both sides to \(v_k\) (for \(k \geq 1\)):

\[
L(E \cdot v_k) = L(-k\, v_{k-1}) = -k\, c_{k-1}\, v_{k-1},
\]
\[
E(L \cdot v_k) = E(c_k\, v_k) = c_k\, E(v_k) = -k\, c_k\, v_{k-1}.
\]
These must agree: \(-k\, c_{k-1} = -k\, c_k\), so \(c_{k-1} = c_k\) for all \(k = 1, \ldots, n\). Thus \(c_0 = c_1 = \cdots = c_n =: c\), and \(L = c \cdot \mathrm{Id}_{V_n}\). By Schur's Lemma, this means \(V_n\) is irreducible. \(\square\)
</div>

## 11.4 Complete Classification

<div class="theorem">
<strong>Theorem 11.3 (Classification of irreducible \(\mathrm{SU}(2)\)-modules).</strong> The representations \(\{V_n : n \geq 0\}\) form a complete list of irreducible finite-dimensional representations of \(\mathrm{SU}(2)\), up to isomorphism.
</div>

<div class="proof">
<strong>Proof sketch via \(\mathfrak{sl}(2,\mathbb{C})\) theory.</strong> Let \(V\) be any irreducible finite-dimensional representation of \(\mathfrak{sl}(2,\mathbb{C})\). Since \(\rho(H)\) is a complex linear operator on a finite-dimensional space, \(V\) decomposes into \(H\)-eigenspaces: \(V = \bigoplus_\lambda V_\lambda\), where \(V_\lambda = \{v \in V : H \cdot v = \lambda v\}\).

The commutation relations \([H,E] = 2E\) and \([H,F] = -2F\) give \(E: V_\lambda \to V_{\lambda+2}\) and \(F: V_\lambda \to V_{\lambda-2}\). Since \(V\) is finite-dimensional, there is a <em>highest weight</em>: some \(\lambda_0\) with \(V_{\lambda_0} \neq 0\) but \(V_{\lambda_0+2} = 0\). Pick a nonzero <em>highest weight vector</em> \(v_0 \in V_{\lambda_0}\), satisfying \(E \cdot v_0 = 0\).

Define \(v_k = F^k \cdot v_0\) for \(k \geq 0\). By induction using the relations, one computes:

\[
H \cdot v_k = (\lambda_0 - 2k) v_k, \quad E \cdot v_k = k(\lambda_0 - k + 1) v_{k-1}.
\]
Since \(\dim V < \infty\), there exists a minimal \(N \geq 1\) with \(v_N = 0\). Applying \(E\) to \(F^N \cdot v_0 = 0\) and using the formula above:

\[
0 = E \cdot v_N = N(\lambda_0 - N + 1) v_{N-1}.
\]
Since \(v_{N-1} \neq 0\) and \(N \geq 1\), we get \(\lambda_0 = N - 1 =: n \in \{0, 1, 2, \ldots\}\). The vectors \(\{v_0, \ldots, v_n\}\) span an \((n+1)\)-dimensional submodule isomorphic to \(V_n\). By irreducibility, \(V = \operatorname{span}\{v_0, \ldots, v_n\} \cong V_n\).

Since \(\mathrm{SU}(2)\) is simply connected, every \(\mathfrak{sl}(2,\mathbb{C})\)-module integrates to an \(\mathrm{SU}(2)\)-module. \(\square\)
</div>

<div class="remark">
<strong>Remark 11.4.</strong> The representation \(V_1 \cong \mathbb{C}^2\) is the standard (defining) representation. The representation \(V_2\) is the adjoint representation of \(\mathrm{SU}(2)\) (which is three-dimensional, matching \(\dim \mathfrak{su}(2) = 3\)). The representation \(V_0 = \mathbb{C}\) is the trivial representation.
</div>

## 11.5 The Clebsch-Gordan Formula

Having classified the irreducibles, the next natural question is: how does the tensor product of two irreducibles decompose?

<div class="theorem">
<strong>Theorem 11.5 (Clebsch-Gordan decomposition).</strong> As \(\mathrm{SU}(2)\)-modules,
\[
V_m \otimes V_n \cong V_{m+n} \oplus V_{m+n-2} \oplus \cdots \oplus V_{|m-n|}.
\]
(The sum runs over \(V_{m+n}, V_{m+n-2}, V_{m+n-4}, \ldots, V_{|m-n|}\), with one summand for each value from \(|m-n|\) to \(m+n\) in steps of 2.)
</div>

<div class="proof">
<strong>Proof.</strong> The tensor product \(V_m \otimes V_n\) has dimension \((m+1)(n+1)\). Its \(H\)-eigenvalues (weights) are all values \((m-2j) + (n-2k)\) for \(0 \leq j \leq m\), \(0 \leq k \leq n\), which range from \(m+n\) down to \(-(m+n)\) in steps of 2. The multiplicity of weight \(\mu\) is the number of pairs \((j,k)\) with \(m - 2j + n - 2k = \mu\), \(0 \leq j \leq m\), \(0 \leq k \leq n\).

Since \(V_m \otimes V_n\) is completely reducible (Theorem 9.6) and has highest weight \(m+n\) (from \(v_0^{(m)} \otimes v_0^{(n)}\)), it contains a unique copy of \(V_{m+n}\). Removing this summand, the remaining module has highest weight \(m+n-2\), so it contains \(V_{m+n-2}\); continuing gives the stated decomposition. Dimension check: \(\sum_{k=0}^{\min(m,n)} (m+n-2k+1) = (m+1)(n+1)\). \(\square\)
</div>

## 11.6 Abstract \(\mathfrak{sl}(2,\mathbb{C})\) Theory and Applications

The theory developed here generalises in a fundamental way. Any semisimple Lie algebra \(\mathfrak{g}\) contains distinguished subalgebras isomorphic to \(\mathfrak{sl}(2,\mathbb{C})\), one for each root \(\alpha\): the <em>\(\mathfrak{sl}(2)\)-triple</em> \(\{H_\alpha, E_\alpha, F_{-\alpha}\}\) satisfying \([H_\alpha, E_\alpha] = 2E_\alpha\), \([H_\alpha, F_{-\alpha}] = -2F_{-\alpha}\), \([E_\alpha, F_{-\alpha}] = H_\alpha\). The representation theory of this subalgebra acting on any \(\mathfrak{g}\)-module gives a decomposition into \(V_n\)-summands. The integrality of weights (weights are integers for \(\mathfrak{sl}(2)\)-modules) propagates to the general setting. This \(\mathfrak{sl}(2)\)-trick is the heart of the proof that Cartan integers are integers (see Chapter 12) and of the Weyl character formula (Chapter 13).

---

# Chapter 12: Weights, Roots, and the Weyl Group

The representation theory of Chapter 11 relied on the structure of a single element \(H\) — the Cartan element — which simultaneously diagonalises all representations. For a general compact semisimple group \(G\), the role of \(H\) is played by the maximal torus \(T\). This chapter develops the theory of roots and weights, the combinatorial data encoded in the root system, and the Weyl group symmetry.

## 12.1 Complexification and Weight Decomposition

<div class="definition">
<strong>Definition 12.1 (Complexification).</strong> For a real Lie algebra \(\mathfrak{g}\), the <em>complexification</em> is
\[
\mathfrak{g}_\mathbb{C} = \mathfrak{g} \otimes_\mathbb{R} \mathbb{C} = \mathfrak{g} \oplus i\mathfrak{g},
\]
with Lie bracket extended by \(\mathbb{C}\)-linearity: \([X + iY, X' + iY'] = ([X,X'] - [Y,Y']) + i([X,Y'] + [Y,X'])\).
</div>

Fundamental examples: \(\mathfrak{su}(2)_\mathbb{C} \cong \mathfrak{sl}(2,\mathbb{C})\); \(\mathfrak{so}(n)_\mathbb{C} \cong \mathfrak{so}(n,\mathbb{C})\); \(\mathfrak{u}(n)_\mathbb{C} \cong \mathfrak{gl}(n,\mathbb{C})\); \(\mathfrak{su}(n)_\mathbb{C} \cong \mathfrak{sl}(n,\mathbb{C})\).

Fix a **maximal torus** \(T \subseteq G\) with Lie algebra \(\mathfrak{t} \subseteq \mathfrak{g}\). Every element of \(\mathfrak{t}\) generates a one-parameter subgroup of \(T\), and since \(T \cong (S^1)^\ell\) (where \(\ell = \dim T\) is the **rank** of \(G\)), these subgroups commute. In any representation \(\rho: G \to \mathrm{GL}(V)\), restricting \(\rho_*\) to \(\mathfrak{t}_\mathbb{C}\) gives a family of commuting diagonalisable operators, hence simultaneously diagonalisable.

<div class="definition">
<strong>Definition 12.2 (Weights).</strong> A <em>weight</em> of the representation \(\rho: G \to \mathrm{GL}(V)\) is a linear functional \(\alpha \in \mathfrak{t}_\mathbb{C}^*\) such that the <em>weight space</em>
\[
V_\alpha = \{v \in V : \rho_*(B)v = \alpha(B)v \text{ for all } B \in \mathfrak{t}_\mathbb{C}\}
\]
is nonzero. The set of weights is \(\mathrm{Wt}(\rho) \subseteq i\mathfrak{t}^*\) (they are purely imaginary on \(\mathfrak{t}\) and real on \(i\mathfrak{t}\)). The weight space decomposition is \(V = \bigoplus_{\alpha \in \mathrm{Wt}(\rho)} V_\alpha\).
</div>

<div class="example">
<strong>Example 12.3 (Weights of \(\mathrm{SU}(2)\)).</strong> With \(T = \{\operatorname{diag}(e^{i\theta}, e^{-i\theta})\}\) and \(\mathfrak{t}_\mathbb{C} = \operatorname{span}_\mathbb{C}\{H\}\), the weights of \(V_n\) are the linear functionals \(\lambda_k: H \mapsto n-2k\) for \(k=0,\ldots,n\). Identifying each \(\lambda_k\) with the integer \(n-2k\), the weights are \(\{n, n-2, \ldots, -n\}\), each with multiplicity 1.
</div>

<div class="example">
<strong>Example 12.4 (Weights of the standard representation of \(\mathrm{U}(n)\)).</strong> The maximal torus is \(T = \{\operatorname{diag}(e^{i\theta_1}, \ldots, e^{i\theta_n})\}\) and \(\mathfrak{t}_\mathbb{C} = \{\operatorname{diag}(c_1, \ldots, c_n)\}\). Define \(\varepsilon_k \in \mathfrak{t}_\mathbb{C}^*\) by \(\varepsilon_k(\operatorname{diag}(c_1,\ldots,c_n)) = c_k\). The standard representation \(V = \mathbb{C}^n\) has weights \(\{\varepsilon_1, \ldots, \varepsilon_n\}\), with weight spaces \(V_{\varepsilon_k} = \operatorname{span}\{e_k\}\).
</div>

The fundamental mechanism connecting roots and weights is:

<div class="proposition">
<strong>Proposition 12.5 (Root vectors shift weights).</strong> Let \(\alpha\) be a root with root space \(\mathfrak{g}_\alpha\) (defined below), and let \(\beta\) be a weight of a representation \(\rho\) with \(v \in V_\beta\). For any \(A \in \mathfrak{g}_\alpha\),
\[
\rho_*(A)v \in V_{\alpha + \beta}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> For \(B \in \mathfrak{t}_\mathbb{C}\):
\[
\rho_*(B)(\rho_*(A)v) = \rho_*([B,A])v + \rho_*(A)(\rho_*(B)v) = \alpha(B)\rho_*(A)v + \beta(B)\rho_*(A)v = (\alpha+\beta)(B)\rho_*(A)v. \quad \square
\]
</div>

## 12.2 Roots and Root Spaces

<div class="definition">
<strong>Definition 12.6 (Root decomposition).</strong> The <em>roots</em> of \(G\) are the nonzero weights of the adjoint representation \(\mathrm{Ad}: G \to \mathrm{GL}(\mathfrak{g}_\mathbb{C})\). Explicitly, \(\alpha \in \mathfrak{t}_\mathbb{C}^* \setminus \{0\}\) is a root if
\[
\mathfrak{g}_\alpha = \{A \in \mathfrak{g}_\mathbb{C} : [B, A] = \alpha(B) A \text{ for all } B \in \mathfrak{t}_\mathbb{C}\} \neq 0.
\]
The set of all roots is \(R \subseteq i\mathfrak{t}^*\). The zero weight space of the adjoint representation is the centraliser of \(\mathfrak{t}_\mathbb{C}\) in \(\mathfrak{g}_\mathbb{C}\), which equals \(\mathfrak{t}_\mathbb{C}\) for compact semisimple \(G\). The <em>root space decomposition</em> is

\[
\mathfrak{g}_\mathbb{C} = \mathfrak{t}_\mathbb{C} \oplus \bigoplus_{\alpha \in R} \mathfrak{g}_\alpha.
\]
</div>

<div class="lemma">
<strong>Lemma 12.7.</strong> For a compact semisimple Lie group \(G\):
<ol>
<li>Each root space \(\mathfrak{g}_\alpha\) is one-dimensional.</li>
<li>If \(\alpha \in R\), then \(-\alpha \in R\).</li>
<li>For each \(\alpha \in R\), there exist elements \(E_\alpha \in \mathfrak{g}_\alpha\), \(F_\alpha = E_{-\alpha} \in \mathfrak{g}_{-\alpha}\), and \(H_\alpha \in \mathfrak{t}_\mathbb{C}\) forming an \(\mathfrak{sl}(2,\mathbb{C})\)-triple: \([H_\alpha, E_\alpha] = 2E_\alpha\), \([H_\alpha, F_\alpha] = -2F_\alpha\), \([E_\alpha, F_\alpha] = H_\alpha\).</li>
</ol>
</div>

<div class="example">
<strong>Example 12.8 (Roots of \(\mathrm{U}(n)\)).</strong> The Lie algebra is \(\mathfrak{g}_\mathbb{C} = \mathfrak{gl}(n,\mathbb{C}) = M_n(\mathbb{C})\), and \(\mathfrak{t}_\mathbb{C} = \{\operatorname{diag}(c_1,\ldots,c_n)\}\). For \(k \neq l\), let \(E_{kl}\) denote the matrix with 1 in position \((k,l)\) and 0 elsewhere. Then
\[
[B, E_{kl}] = (c_k - c_l) E_{kl} = (\varepsilon_k - \varepsilon_l)(B) E_{kl}
\]
for \(B = \operatorname{diag}(c_1,\ldots,c_n)\). So \(\mathfrak{g}_{\varepsilon_k - \varepsilon_l} = \operatorname{span}\{E_{kl}\}\), and the roots are \(R = \{\varepsilon_k - \varepsilon_l : k \neq l\}\).
</div>

<div class="example">
<strong>Example 12.9 (Roots of \(\mathrm{SU}(3)\)).</strong> Using \(\mathfrak{t}_\mathbb{C} = \{\operatorname{diag}(c_1,c_2,c_3) : c_1+c_2+c_3=0\}\) with the functionals \(\varepsilon_k\) restricted to this hyperplane, the roots are \(R = \{\pm(\varepsilon_1-\varepsilon_2),\ \pm(\varepsilon_2-\varepsilon_3),\ \pm(\varepsilon_1-\varepsilon_3)\}\), which form six vectors in a two-dimensional space arranged at the vertices of a regular hexagon — the \(A_2\) root system.
</div>

## 12.3 Root Systems

The pattern of roots carries enough information to classify all compact semisimple Lie groups. We abstract it into the notion of a root system.

<div class="definition">
<strong>Definition 12.10 (Root system).</strong> A <em>root system</em> in a Euclidean space \((E, \langle \cdot, \cdot \rangle)\) is a finite set \(R \subseteq E \setminus \{0\}\) satisfying:
<ol>
<li>\(R\) spans \(E\).</li>
<li>For \(\alpha \in R\): \(c\alpha \in R\) if and only if \(c = \pm 1\).</li>
<li>For \(\alpha, \beta \in R\): the reflection \(s_\alpha(\beta) := \beta - 2\frac{\langle \beta, \alpha \rangle}{\langle \alpha, \alpha \rangle} \alpha \in R\).</li>
<li>For \(\alpha, \beta \in R\): the <em>Cartan integer</em> \(\langle \beta, \alpha^\vee \rangle := 2\frac{\langle \beta, \alpha \rangle}{\langle \alpha, \alpha \rangle} \in \mathbb{Z}\).</li>
</ol>
The <em>Weyl group</em> \(W\) of \(R\) is the finite group generated by the reflections \(\{s_\alpha : \alpha \in R\}\). A root system is <em>reducible</em> if \(E = E_1 \perp E_2\) with \(R = R_1 \cup R_2\); otherwise <em>irreducible</em>.
</div>

<div class="theorem">
<strong>Theorem 12.11 (Classification of root systems).</strong> The irreducible root systems are completely classified by Dynkin diagrams. The classical types are:
<ul>
<li>\(A_n\) (\(n \geq 1\)): the roots \(\{\varepsilon_k - \varepsilon_l : 1 \leq k \neq l \leq n+1\}\) in the hyperplane \(\sum x_k = 0\) of \(\mathbb{R}^{n+1}\). Corresponds to \(\mathrm{SU}(n+1)\).</li>
<li>\(B_n\) (\(n \geq 2\)): roots \(\{\pm \varepsilon_k, \pm \varepsilon_k \pm \varepsilon_l : k \neq l\}\) in \(\mathbb{R}^n\). Corresponds to \(\mathrm{SO}(2n+1)\).</li>
<li>\(C_n\) (\(n \geq 3\)): roots \(\{\pm 2\varepsilon_k, \pm \varepsilon_k \pm \varepsilon_l : k \neq l\}\) in \(\mathbb{R}^n\). Corresponds to \(\mathrm{Sp}(n)\).</li>
<li>\(D_n\) (\(n \geq 4\)): roots \(\{\pm \varepsilon_k \pm \varepsilon_l : k \neq l\}\) in \(\mathbb{R}^n\). Corresponds to \(\mathrm{SO}(2n)\).</li>
</ul>
The exceptional types are \(E_6\), \(E_7\), \(E_8\), \(F_4\), and \(G_2\).
</div>

The connection between root systems and Lie groups is: every compact simply connected semisimple Lie group is determined up to isomorphism by its root system, and every irreducible root system arises from a unique such group.

## 12.4 Positive Roots and Simple Roots

To work with root systems computationally, we choose an orientation.

<div class="definition">
<strong>Definition 12.12 (Positive and simple roots).</strong> A <em>positive system</em> \(R^+ \subseteq R\) is a choice satisfying \(R = R^+ \sqcup (-R^+)\) and: if \(\alpha, \beta \in R^+\) and \(\alpha+\beta \in R\), then \(\alpha+\beta \in R^+\). A positive system is determined by choosing a vector \(\xi \in E\) with \(\langle \alpha, \xi \rangle \neq 0\) for all \(\alpha\) and setting \(R^+ = \{\alpha \in R : \langle \alpha, \xi \rangle > 0\}\). The <em>simple roots</em> \(\Delta \subseteq R^+\) are those positive roots not expressible as a sum of two positive roots.
</div>

<div class="theorem">
<strong>Theorem 12.13.</strong>
<ol>
<li>Every positive root is a non-negative integer linear combination of the simple roots.</li>
<li>The simple roots form a basis for \(E\).</li>
<li>The Weyl group acts simply transitively on the set of positive systems (equivalently, on the set of Weyl chambers — the connected components of \(E \setminus \bigcup_{\alpha \in R} \alpha^\perp\)).</li>
</ol>
</div>

The <em>Cartan matrix</em> of a root system is the \(\ell \times \ell\) integer matrix \(A_{ij} = \langle \alpha_i, \alpha_j^\vee \rangle = 2\langle \alpha_i, \alpha_j \rangle / \langle \alpha_j, \alpha_j \rangle\), where \(\alpha_1, \ldots, \alpha_\ell\) are the simple roots. It satisfies \(A_{ii} = 2\), \(A_{ij} \leq 0\) for \(i \neq j\), and \(A_{ij}A_{ji} \in \{0,1,2,3\}\). The Dynkin diagram encodes the Cartan matrix: nodes correspond to simple roots, and the number of edges between nodes \(i\) and \(j\) is \(A_{ij}A_{ji}\), with an arrow toward the shorter root when the lengths differ.

## 12.5 The Weyl Group

<div class="theorem">
<strong>Theorem 12.14 (Weyl group as a group quotient).</strong> For a connected compact Lie group \(G\) with maximal torus \(T\), the Weyl group is
\[
W = N_G(T)/T,
\]
where \(N_G(T) = \{g \in G : gTg^{-1} = T\}\) is the normaliser of \(T\) in \(G\). This group acts on \(T\) by conjugation \((nT) \cdot t = ntn^{-1}\), and the induced action on \(\mathfrak{t}^*\) (via the differential of conjugation) coincides with the action of the abstract Weyl group generated by the root reflections \(s_\alpha\).
</div>

Key properties of \(W\):

- \(W\) is a finite group; \(|W|\) equals the number of Weyl chambers.
- \(W\) acts simply transitively on the set of Weyl chambers.
- For \(\mathrm{SU}(n+1)\): \(W \cong S_{n+1}\) (symmetric group), acting on \(\mathfrak{t}^*\) by permuting the coordinates \(\varepsilon_1, \ldots, \varepsilon_{n+1}\). Explicitly, the Weyl group of \(\mathrm{SU}(3)\) is \(S_3\), the dihedral group of order 6.
- For \(\mathrm{SO}(2n)\): \(W \cong S_n \ltimes (\mathbb{Z}/2)^{n-1}\), generated by permutations and even-cardinality sign changes of the coordinates.
- For \(\mathrm{SU}(2)\): \(W \cong S_2 = \{1, -1\}\), acting on \(\mathfrak{t}^* \cong \mathbb{R}\) by \(\pm 1\); concretely, the nontrivial element sends \(e^{i\theta} \mapsto e^{-i\theta}\) in \(T\).

The Weyl group plays a crucial role in the character theory of the next chapter: the Weyl character formula and the Weyl dimension formula both exhibit explicit \(W\)-symmetry.

---

# Chapter 13: Representations of Compact Semisimple Groups

With the machinery of roots, weights, and the Weyl group in place, we can now state and prove the crowning classification theorem of the course: every irreducible representation of a compact semisimple group is uniquely determined by its highest weight, and every dominant integral weight occurs.

## 13.1 Dominant Integral Weights

The weight lattice is the natural indexing set for representations.

<div class="definition">
<strong>Definition 13.1 (Weight lattice and dominant integral weights).</strong> The <em>weight lattice</em> is
\[
\Lambda = \{\lambda \in \mathfrak{t}^*_\mathbb{C} : \langle \lambda, \alpha^\vee \rangle \in \mathbb{Z} \text{ for all } \alpha \in R\}.
\]
A weight \(\lambda \in \Lambda\) is <em>dominant integral</em> if \(\langle \lambda, \alpha^\vee \rangle \geq 0\) for all \(\alpha \in R^+\) (equivalently, for all simple roots \(\alpha \in \Delta\)). We denote the set of dominant integral weights by \(\Lambda^+\).
</div>

The integrality condition \(\langle \lambda, \alpha^\vee \rangle \in \mathbb{Z}\) arises because any weight of a representation of the \(\mathfrak{sl}(2)\)-triple \(\{H_\alpha, E_\alpha, F_\alpha\}\) must be an integer (Theorem 11.3). The dominance condition \(\langle \lambda, \alpha^\vee \rangle \geq 0\) selects the "upper right" quadrant of the weight lattice — the intersection of the weight lattice with the closed dominant Weyl chamber.

<div class="example">
<strong>Example 13.2 (Dominant weights for \(\mathrm{SU}(2)\)).</strong> Here \(\Lambda = \mathbb{Z} \cdot \frac{\alpha}{2}\) (where \(\alpha\) is the single positive root) and \(\Lambda^+ = \{0, \frac{\alpha}{2}, \alpha, \frac{3\alpha}{2}, \ldots\} = \{n \cdot \frac{\alpha}{2} : n \geq 0\}\). Under the identification \(n \cdot \frac{\alpha}{2} \leftrightarrow n\), this is exactly \(\{0, 1, 2, \ldots\}\), corresponding to the representations \(V_0, V_1, V_2, \ldots\).
</div>

<div class="example">
<strong>Example 13.3 (Dominant weights for \(\mathrm{SU}(3)\)).</strong> The weight lattice is a copy of \(\mathbb{Z}^2\), with basis given by the fundamental weights \(\omega_1, \omega_2\) (dual to the simple coroots \(\alpha_1^\vee, \alpha_2^\vee\) in the sense \(\langle \omega_i, \alpha_j^\vee \rangle = \delta_{ij}\)). Then \(\Lambda^+ = \{a\omega_1 + b\omega_2 : a, b \in \mathbb{Z}_{\geq 0}\}\), the first quadrant of the integer lattice in the \(A_2\) root system.
</div>

<div class="definition">
<strong>Definition 13.4 (Highest weight vector).</strong> In an irreducible representation \(V\) of \(G\), a <em>highest weight vector</em> is a nonzero \(v \in V_\lambda\) (for some weight \(\lambda\)) satisfying \(E_\alpha \cdot v = 0\) for all positive root vectors \(E_\alpha \in \mathfrak{g}_\alpha\), \(\alpha \in R^+\). The weight \(\lambda\) of such a vector is the <em>highest weight</em> of \(V\).
</div>

The terminology is justified by Proposition 12.5: since \(E_\alpha\) shifts weights by \(\alpha > 0\), and \(E_\alpha \cdot v = 0\), there is no weight above \(\lambda\) in the representation.

## 13.2 The Theorem of the Highest Weight

<div class="theorem">
<strong>Theorem 13.5 (Cartan-Weyl classification).</strong> Let \(G\) be a connected compact semisimple Lie group. Then:
<ol>
<li>Every irreducible finite-dimensional \(G\)-module has a unique highest weight, which lies in \(\Lambda^+\).</li>
<li>Two irreducible \(G\)-modules are isomorphic if and only if they have the same highest weight.</li>
<li>For every \(\lambda \in \Lambda^+\), there exists an irreducible \(G\)-module \(V(\lambda)\) with highest weight \(\lambda\).</li>
</ol>
Thus, \(\hat{G} \cong \Lambda^+\) as sets.
</div>

<div class="proof">
<strong>Proof sketch.</strong> <em>Part (1).</em> Let \(V\) be irreducible. The weight spaces \(V_\mu\) for \(\mu \in \mathrm{Wt}(V)\) are finite-dimensional and there are finitely many weights. Among all weights, choose one that is maximal with respect to the partial order defined by the positive roots (\(\mu \geq \nu\) if \(\mu - \nu\) is a non-negative integer combination of positive roots). The maximal weight \(\lambda_0\) is a highest weight: \(E_\alpha \cdot V_{\lambda_0} = 0\) for all \(\alpha \in R^+\). That \(\lambda_0\) is dominant integral follows from the \(\mathfrak{sl}(2)\)-triple argument: for each simple root \(\alpha\), restricting to the corresponding \(\mathfrak{sl}(2)\)-subalgebra shows that \(\langle \lambda_0, \alpha^\vee \rangle\) must be a non-negative integer.

<em>Part (2).</em> The highest weight vector generates \(V\) by applying lowering operators \(F_\alpha\). Since \(V\) is irreducible, the submodule generated by the highest weight vector is all of \(V\). Two irreducibles with the same highest weight \(\lambda_0\) have isomorphic generating submodules, hence are isomorphic.

<em>Part (3) — Existence.</em> For each \(\lambda \in \Lambda^+\), one constructs the <em>Verma module</em>
\[
M(\lambda) = U(\mathfrak{g}_\mathbb{C})\big/I_\lambda,
\]
where \(U(\mathfrak{g}_\mathbb{C})\) is the universal enveloping algebra and \(I_\lambda\) is the left ideal generated by \(\{E_\alpha : \alpha \in R^+\}\) and \(\{H - \lambda(H) \cdot 1 : H \in \mathfrak{t}_\mathbb{C}\}\). The Verma module is a (typically infinite-dimensional) \(\mathfrak{g}_\mathbb{C}\)-module with highest weight \(\lambda\). It has a unique maximal proper submodule \(N(\lambda)\), and \(V(\lambda) = M(\lambda)/N(\lambda)\) is irreducible with highest weight \(\lambda\). For \(\lambda \in \Lambda^+\) and \(G\) compact, \(V(\lambda)\) is finite-dimensional. \(\square\)
</div>

## 13.3 The Weyl Character Formula

The Weyl character formula gives an explicit closed form for the character of any irreducible representation in terms of the root system and the highest weight.

<div class="definition">
<strong>Definition 13.6 (Weyl vector).</strong> The <em>Weyl vector</em> (or <em>rho vector</em>) is
\[
\rho = \frac{1}{2} \sum_{\alpha \in R^+} \alpha,
\]
the half-sum of all positive roots. Equivalently, \(\rho = \sum_{i=1}^\ell \omega_i\), the sum of all fundamental weights.
</div>

The Weyl vector satisfies \(\langle \rho, \alpha_i^\vee \rangle = 1\) for all simple roots \(\alpha_i\), which is its most useful property in computations.

<div class="theorem">
<strong>Theorem 13.7 (Weyl Character Formula).</strong> For a dominant integral weight \(\lambda \in \Lambda^+\), the character of the irreducible representation \(V(\lambda)\) is given by
\[
\chi_\lambda = \frac{\sum_{w \in W} \varepsilon(w)\, e^{w(\lambda + \rho)}}{\sum_{w \in W} \varepsilon(w)\, e^{w(\rho)}},
\]
where:
<ul>
<li>\(\varepsilon(w) = \det(w) = (-1)^{\ell(w)}\) is the sign character of the Weyl group (\(\ell(w)\) is the length of \(w\) in terms of simple reflections);</li>
<li>the numerator and denominator are elements of the group algebra \(\mathbb{Z}[\Lambda]\) of formal exponentials;</li>
<li>the denominator is the <em>Weyl denominator</em>: \(\sum_{w \in W} \varepsilon(w)\, e^{w(\rho)} = \prod_{\alpha \in R^+} (e^{\alpha/2} - e^{-\alpha/2})\).</li>
</ul>
</div>

<div class="proof">
<strong>Proof sketch.</strong> The formula is proved by showing both sides satisfy the same functional equation under the \(W\)-action and that they match on a dense set. The denominator identity (the last equality in the theorem statement) is the <em>Weyl denominator identity</em>, proved by induction on \(|R^+|\) using the reflection \(s_\alpha\). The numerator \(A_\lambda := \sum_{w \in W} \varepsilon(w) e^{w(\lambda+\rho)}\) is anti-symmetric under \(W\): \(w \cdot A_\lambda = \varepsilon(w) A_\lambda\). Writing the character as \(\chi_\lambda = \sum_\mu m_\mu e^\mu\), the Weyl integration formula and the orthogonality of characters force the multiplicities \(m_\mu = m_{w\mu}\) (Weyl invariance) and the recursion \(\chi_\lambda \cdot \prod_{\alpha>0}(e^{\alpha/2}-e^{-\alpha/2}) = A_{\lambda+\rho}\). Verifying this characterises \(\chi_\lambda\) uniquely. \(\square\)
</div>

<div class="theorem">
<strong>Theorem 13.8 (Weyl Dimension Formula).</strong> For \(\lambda \in \Lambda^+\),
\[
\dim V(\lambda) = \prod_{\alpha \in R^+} \frac{\langle \lambda + \rho, \alpha \rangle}{\langle \rho, \alpha \rangle}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> The dimension is obtained by evaluating \(\chi_\lambda\) at the identity element \(e = 0\) in \(\Lambda \otimes \mathbb{R}\) (i.e., setting all \(e^\mu = 1\)). Both numerator and denominator of the Weyl formula vanish at this point (since \(\sum_w \varepsilon(w) = 0\) for \(|W| > 1\)), so we apply L'Hôpital's rule: move the evaluation point to \(t\rho\) and let \(t \to 0\). The limit is computed using \(e^{t\langle w(\lambda+\rho), \xi \rangle}\) for a generic \(\xi\), and the formula above results. \(\square\)
</div>

## 13.4 Worked Examples of the Weyl Formulas

<div class="example">
<strong>Example 13.9 (\(\mathrm{SU}(2)\)).</strong> With \(R^+ = \{\alpha\}\), \(\rho = \alpha/2\), \(W = \{1, s_\alpha\}\), \(\varepsilon(1)=1\), \(\varepsilon(s_\alpha)=-1\). For highest weight \(\lambda = n\alpha/2\):
\[
\chi_n = \frac{e^{(n+1)\alpha/2} - e^{-(n+1)\alpha/2}}{e^{\alpha/2} - e^{-\alpha/2}} = e^{n\alpha/2} + e^{(n-2)\alpha/2} + \cdots + e^{-n\alpha/2},
\]
the sum of all weights of \(V_n\) (each with multiplicity 1). Dimension: \(\dim V_n = (n+1)\), recovered by the formula \(\frac{\langle n\alpha/2 + \alpha/2, \alpha \rangle}{\langle \alpha/2, \alpha \rangle} = \frac{(n+1)/2 \cdot \|\alpha\|^2}{(1/2)\|\alpha\|^2} = n+1\).
</div>

<div class="example">
<strong>Example 13.10 (\(\mathrm{SU}(3)\)).</strong> With \(R^+ = \{\alpha_1, \alpha_2, \alpha_1+\alpha_2\}\) and fundamental weights \(\omega_1, \omega_2\) (so \(\rho = \omega_1 + \omega_2\)), the Weyl dimension formula for \(\lambda = a\omega_1 + b\omega_2\) gives
\[
\dim V(a\omega_1 + b\omega_2) = \frac{(a+1)(b+1)(a+b+2)}{2}.
\]
Verification: \(V(\omega_1) = \mathbb{C}^3\) (standard representation, \(\dim = 3\)); \(V(\omega_2) = (\mathbb{C}^3)^*\) (dual, \(\dim = 3\)); \(V(\omega_1 + \omega_2)\) is the adjoint representation of \(\mathrm{SU}(3)\), with \(\dim = \frac{2 \cdot 2 \cdot 4}{2} = 8 = \dim \mathfrak{su}(3)\).
</div>

## 13.5 The Topological Meaning of Integrality

The integrality condition for weights has a clean topological interpretation: a linear functional \(\lambda: \mathfrak{t} \to \mathbb{R}\) exponentiates to a well-defined character \(\chi_\lambda: T \to U(1)\), \(\chi_\lambda(\exp H) = e^{i\lambda(H)}\), if and only if \(\lambda\) lies in the weight lattice \(\Lambda\). The fundamental group \(\pi_1(G)\) is isomorphic (as an abelian group) to the quotient of the weight lattice by the root lattice \(Q = \mathbb{Z}\text{-span}(R)\):

\[
\pi_1(G) \cong \Lambda / Q.
\]
Simply connected groups (like \(\mathrm{SU}(n)\)) have \(\Lambda = Q\) locally, while groups like \(\mathrm{U}(n)\) and \(\mathrm{SO}(n)\) have proper quotients. This connection between the representation theory and the topology of \(G\) is a deep and beautiful feature of the theory.

---

# Chapter 14: Further Topics

The preceding chapters have developed the full classification of irreducible representations of compact semisimple Lie groups. This final chapter brings together several threads: the Weyl integration formula (which connects character theory to torus integration), a synthesis of the main theorems, and an outlook toward the broader landscape of Lie theory.

## 14.1 The Weyl Integration Formula

The Weyl integration formula is an analogue of the change-of-variables formula for the conjugation map \(G/T \times T \to G\). It shows that, for the purpose of computing integrals of class functions, one only needs to integrate over the maximal torus — a dramatic reduction.

<div class="theorem">
<strong>Theorem 14.1 (Weyl Integration Formula).</strong> Let \(G\) be a connected compact semisimple Lie group with maximal torus \(T\), root system \(R\), positive roots \(R^+\), and Weyl group \(W\). For any continuous class function \(f: G \to \mathbb{C}\),
\[
\int_G f(g)\, dg = \frac{1}{|W|} \int_T f(t)\, |D(t)|^2\, dt,
\]
where

\[
|D(t)|^2 = \prod_{\alpha \in R} (1 - e^\alpha(t)) = \left|\prod_{\alpha \in R^+} (e^{\alpha/2}(t) - e^{-\alpha/2}(t))\right|^2
\]
is the <em>Weyl denominator squared</em>. Here the torus integral uses the normalised Haar measure on \(T\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> The key step is the analysis of the smooth map \(\Phi: G/T \times T \to G\) given by \(\Phi(gT, t) = gtg^{-1}\) (conjugation). One computes the Jacobian of \(\Phi\) using the root space decomposition: the tangent map \(d\Phi\) at \((eT, t)\) decomposes into the torus component (trivial, contributing the Haar measure of \(T\)) and the off-torus components, one for each root \(\alpha \in R\), contributing a factor of \((1 - e^\alpha(t))\). The full Jacobian is therefore \(\prod_{\alpha \in R}(1-e^\alpha(t)) = |D(t)|^2\) (the two factors of \(\prod_{R^+}\) combine with the quotient by the Weyl group action). Integrating \(f \circ \Phi\) over \(G/T \times T\) using Fubini and the Haar measure on \(G/T\) gives the formula. \(\square\)
</div>

<div class="example">
<strong>Example 14.2 (\(\mathrm{SU}(2)\)).</strong> With \(T = \{\operatorname{diag}(e^{i\theta}, e^{-i\theta})\}\), \(R^+ = \{\alpha\}\), \(e^\alpha(t) = e^{2i\theta}\), and \(|W| = 2\):
\[
|D(t)|^2 = |e^{i\theta} - e^{-i\theta}|^2 = 4\sin^2\theta.
\]
The Weyl integration formula becomes

\[
\int_{\mathrm{SU}(2)} f\, dg = \frac{1}{2} \cdot \frac{1}{2\pi} \int_0^{2\pi} f(\operatorname{diag}(e^{i\theta}, e^{-i\theta}))\cdot 4\sin^2\theta\, d\theta = \frac{1}{\pi}\int_0^{2\pi} f(\theta)\sin^2\theta\, d\theta.
\]
This can be checked directly: applying it to \(f = \chi_m \overline{\chi_n}\) and using the explicit formulas for characters of \(\mathrm{SU}(2)\) recovers the orthonormality \(\langle \chi_m, \chi_n \rangle = \delta_{mn}\).
</div>

The Weyl integration formula has a fundamental application to the character inner product:

<div class="corollary">
<strong>Corollary 14.3.</strong> The characters of irreducible representations of \(G\) are orthonormal: \(\langle \chi_\lambda, \chi_\mu \rangle = \delta_{\lambda\mu}\). Moreover, the Weyl character formula is consistent with the Schur orthogonality relations in the sense that the characters computed by the formula are exactly the characters appearing in the Peter-Weyl decomposition of \(L^2(G)\).
</div>

<div class="proof">
<strong>Proof.</strong> Using the Weyl integration formula and the explicit form of the Weyl character formula, the inner product \(\langle \chi_\lambda, \chi_\mu \rangle\) reduces to an integral of the form
\[
\frac{1}{|W|} \int_T A_{\lambda+\rho}(t)\, \overline{A_{\mu+\rho}(t)}\, dt,
\]
where \(A_\nu = \sum_{w \in W} \varepsilon(w) e^{w\nu}\) is an alternating sum. Since distinct Weyl-translates of \(\lambda+\rho\) are distinct elements of \(\Lambda\), these exponentials are orthonormal on \(T\) (by the character theory of the torus), and expanding gives \(\langle \chi_\lambda, \chi_\mu \rangle = \delta_{\lambda\mu}\). \(\square\)
</div>

## 14.2 Tensor Product Decomposition

Given the classification theorem, a natural problem is to decompose tensor products of irreducible representations. This generalises the Clebsch-Gordan formula of Chapter 11.

<div class="theorem">
<strong>Theorem 14.4 (Tensor product decomposition).</strong> For dominant integral weights \(\lambda, \mu \in \Lambda^+\),
\[
V(\lambda) \otimes V(\mu) \cong \bigoplus_{\nu \in \Lambda^+} m(\lambda, \mu; \nu)\, V(\nu),
\]
where the multiplicities \(m(\lambda, \mu; \nu) \geq 0\) are non-negative integers, and only finitely many are nonzero. The multiplicity can be computed as

\[
m(\lambda, \mu; \nu) = \langle \chi_\lambda \cdot \chi_\mu,\, \chi_\nu \rangle = \int_G \chi_\lambda \chi_\mu\, \overline{\chi_\nu}\, dg.
\]
</div>

For the classical groups in type \(A\), the multiplicities are computed by the <em>Littlewood-Richardson rule</em> (a combinatorial rule on Young tableaux). In general, the <em>Klimyk formula</em> expresses \(m(\lambda,\mu;\nu)\) in terms of weight multiplicities:

\[
m(\lambda,\mu;\nu) = \sum_{\mu' \in \mathrm{Wt}(V(\mu))} \dim V(\mu)_{\mu'} \cdot m(\lambda; \nu-\mu'),
\]
where \(m(\lambda; \eta)\) is the multiplicity of the weight \(\eta\) in \(V(\lambda)\).

## 14.3 The Grand Synthesis

The following theorem collects the main results of the course into a single statement, capturing both the algebraic and analytic aspects of the theory.

<div class="theorem">
<strong>Theorem 14.5 (Classification of representations of compact semisimple groups).</strong> Let \(G\) be a connected compact semisimple Lie group with maximal torus \(T\), root system \(R\), positive roots \(R^+\), Weyl group \(W\), and weight lattice \(\Lambda\). Then:
<ol>
<li><em>(Existence and uniqueness of Haar measure.)</em> There is a unique bi-invariant probability measure \(dg\) on \(G\).</li>
<li><em>(Complete reducibility.)</em> Every finite-dimensional representation of \(G\) decomposes as a direct sum of irreducibles.</li>
<li><em>(Classification.)</em> There is a bijection
\[
\hat{G} \longleftrightarrow \Lambda^+, \quad V(\lambda) \longleftrightarrow \lambda,
\]
where \(\hat{G}\) denotes the set of isomorphism classes of irreducible finite-dimensional \(G\)-modules.</li>
<li><em>(Character formula.)</em> The character of \(V(\lambda)\) is given by the Weyl character formula (Theorem 13.7).</li>
<li><em>(Dimension formula.)</em> The dimension of \(V(\lambda)\) is given by the Weyl dimension formula (Theorem 13.8).</li>
<li><em>(Peter-Weyl.)</em> There is an isometric \(G \times G\)-equivariant decomposition
\[
L^2(G) \cong \widehat{\bigoplus}_{\lambda \in \Lambda^+}\, V(\lambda) \otimes V(\lambda)^*,
\]
with each irreducible \(V(\lambda)\) appearing with multiplicity \(\dim V(\lambda)\).</li>
<li><em>(Integration formula.)</em> For class functions, integration over \(G\) reduces to torus integration via the Weyl integration formula (Theorem 14.1).</li>
</ol>
</div>

This theorem is the culmination of a remarkable interplay between Lie theory, differential geometry, and functional analysis. The compact group \(G\) simultaneously encodes:

- **Algebraic structure**: the root system, Weyl group, and weight lattice are purely combinatorial objects classifying the representations.
- **Geometric structure**: the Haar measure, the maximal torus, and the conjugation map provide the geometric underpinning.
- **Analytic structure**: the \(L^2\) theory of the Peter-Weyl theorem connects representation theory to harmonic analysis.

## 14.4 Connections and Further Directions

We close with a brief orientation toward the broader landscape that opens beyond this course.

### 14.4.1 Structure of Simply Connected Simple Groups

The compact simply connected simple Lie groups are completely classified:

- **Type \(A_n\) (\(n \geq 1\))**: \(\mathrm{SU}(n+1)\), with Weyl group \(S_{n+1}\) and \(n\) simple roots.
- **Type \(B_n\) (\(n \geq 2\))**: \(\mathrm{Spin}(2n+1)\), the spin double-cover of \(\mathrm{SO}(2n+1)\).
- **Type \(C_n\) (\(n \geq 3\))**: \(\mathrm{Sp}(n)\), the compact symplectic group of \(n\times n\) quaternionic unitary matrices.
- **Type \(D_n\) (\(n \geq 4\))**: \(\mathrm{Spin}(2n)\), the spin double-cover of \(\mathrm{SO}(2n)\).
- **Exceptional types**: \(G_2\) (rank 2, dimension 14), \(F_4\) (rank 4, dimension 52), \(E_6\) (rank 6, dimension 78), \(E_7\) (rank 7, dimension 133), \(E_8\) (rank 8, dimension 248).

For a compact simple group \(G\), any other compact group with the same Lie algebra is a quotient \(G/Z\) for some subgroup \(Z \subseteq Z(G)\) of the centre; the centre satisfies \(Z(G) \cong \Lambda/Q\) (weight lattice modulo root lattice).

### 14.4.2 Real Forms and Non-Compact Groups

The complexification \(\mathfrak{g}_\mathbb{C}\) of a compact real Lie algebra \(\mathfrak{g}\) is a complex semisimple Lie algebra. The Dynkin diagram classification of complex semisimple Lie algebras exactly matches the classification of compact simple Lie groups: each Dynkin diagram corresponds to a unique complex simple Lie algebra and a unique compact real form.

However, a complex semisimple Lie algebra typically admits multiple non-isomorphic <em>real forms</em> — real Lie algebras whose complexification is the given complex algebra. For example:

- \(\mathfrak{su}(2)_\mathbb{C} \cong \mathfrak{sl}(2,\mathbb{C})\), which also has real form \(\mathfrak{sl}(2,\mathbb{R})\) (the Lie algebra of \(\mathrm{SL}(2,\mathbb{R})\)).
- \(\mathfrak{su}(n)_\mathbb{C} \cong \mathfrak{sl}(n,\mathbb{C})\), which also has real forms \(\mathfrak{sl}(n,\mathbb{R})\) and \(\mathfrak{su}(p,q)\) (the indefinite unitary algebras) for \(p+q=n\).

The non-compact real forms have a fundamentally different representation theory. The group \(\mathrm{SL}(2,\mathbb{R})\), for instance, has both finite-dimensional (non-unitary) and infinite-dimensional (unitary) irreducible representations. The classification of irreducible unitary representations of non-compact semisimple groups was achieved by Harish-Chandra and is an active area of research connected to the Langlands programme.

### 14.4.3 Infinite-Dimensional Representations

For a non-compact group like \(\mathrm{SL}(2,\mathbb{R})\), Bargmann's classification (1947) identifies four families of unitary irreducibles:

- The **discrete series**: infinite-dimensional representations \(D_n^+\) and \(D_n^-\) (\(n \geq 1\)) whose matrix coefficients are square-integrable.
- The **principal series**: representations \(P_s\) (\(s \in i\mathbb{R}\)) induced from characters of the Borel subgroup.
- The **complementary series**: representations \(C_s\) (\(0 < s < 1\)) not unitarily induced.
- The **trivial representation**.

The general theory for semisimple groups, due to Harish-Chandra, Knapp-Zuckerman, Langlands, and Vogan, constructs irreducibles via cohomological induction and the geometry of flag varieties. The Langlands correspondence connects this representation theory to number theory via automorphic forms.

### 14.4.4 Algebraic Groups and Modular Representation Theory

Over fields of characteristic \(p > 0\), the Lie algebra no longer determines the representation theory of an algebraic group. New phenomena arise: the Frobenius endomorphism, restricted representations, and Steinberg's tensor product theorem. The analogue of the Weyl character formula in characteristic \(p\) — the Lusztig conjecture (proved for large \(p\) by Andersen, Jantzen, and Soergel) — expresses the simple module characters in terms of Kazhdan-Lusztig polynomials, bringing geometric methods (perverse sheaves, intersection cohomology) into the heart of representation theory.

### 14.4.5 Geometric Representation Theory

The modern approach to representation theory — geometric representation theory — realises representations as cohomology groups of equivariant sheaves on algebraic varieties associated to \(G\) (flag varieties, nilpotent cones, Springer fibres). The Borel-Weil theorem gives a particularly clean realisation of the irreducibles \(V(\lambda)\) for compact groups:

<div class="theorem">
<strong>Theorem 14.6 (Borel-Weil).</strong> Let \(G\) be a compact semisimple group and \(\lambda \in \Lambda^+\) a dominant integral weight. The irreducible representation \(V(\lambda)^*\) (the dual) is isomorphic to the space of holomorphic sections of the line bundle \(\mathcal{L}_\lambda\) on the flag variety \(G_\mathbb{C}/B\):
\[
V(\lambda)^* \cong H^0(G_\mathbb{C}/B,\, \mathcal{L}_\lambda),
\]
where \(G_\mathbb{C}\) is the complexification of \(G\) and \(B\) is a Borel subgroup.
</div>

This theorem — and its extension by Bott to higher cohomology groups — is the bridge between the algebraic representation theory developed in these notes and the modern geometric methods that dominate current research. The flag variety \(G_\mathbb{C}/B\), a projective algebraic variety, encodes the entire representation theory of \(G\) in its geometry, and the Weyl character formula arises from the Hirzebruch-Riemann-Roch theorem applied to \(\mathcal{L}_\lambda\). This perspective opens onto a vast and active research programme, connecting representation theory to algebraic geometry, \(D\)-modules, and mathematical physics.
