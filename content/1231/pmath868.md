---
title: "PMATH 868: Connections and Riemannian Geometry"
subjects: PMATH
prof: Spiro Karigiannis
---

## Sources and References

**Primary texts:**
- John M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed., Springer GTM 176 (2018)
- Shoshichi Kobayashi and Katsumi Nomizu, *Foundations of Differential Geometry*, Vols. I–II, Wiley Interscience (1963, 1969)
- Manfredo do Carmo, *Riemannian Geometry*, Birkhäuser (1992)

**Supplementary texts:**
- John W. Milnor and James D. Stasheff, *Characteristic Classes*, Princeton University Press / Annals of Mathematics Studies 76 (1974)
- Shigeyuki Morita, *Geometry of Differential Forms*, AMS Translations of Mathematical Monographs (2001)
- John M. Lee, *Introduction to Smooth Manifolds*, 2nd ed., Springer GTM 218 (2013)
- Victor Guillemin and Alan Pollack, *Differential Topology*, Prentice Hall (1974)
- Loring W. Tu, *Differential Geometry: Connections, Curvature, and Characteristic Classes*, Springer GTM 275 (2017)

**Online resources:**
- MIT OpenCourseWare 18.965: Geometry of Manifolds (open access, ocw.mit.edu)
- Nigel Hitchin, *Differentiable Manifolds* (open course notes hosted on the author's Oxford page)

---

# Chapter 1: Smooth Manifolds and Tensor Calculus

## 1.1 Smooth Manifolds: A Rapid Recollection

The foundation of modern differential geometry is the notion of a **smooth manifold**: a topological space locally modeled on Euclidean space, with transition functions that are infinitely differentiable. More precisely, an \(n\)-dimensional smooth manifold is a second-countable Hausdorff topological space \(M\) equipped with a maximal smooth atlas — a collection of charts \(\{(U_\alpha, \varphi_\alpha)\}\) where each \(U_\alpha \subset M\) is open, each \(\varphi_\alpha : U_\alpha \to \mathbb{R}^n\) is a homeomorphism onto an open set, and whenever \(U_\alpha \cap U_\beta \neq \varnothing\) the transition map

\[
\varphi_\beta \circ \varphi_\alpha^{-1} : \varphi_\alpha(U_\alpha \cap U_\beta) \longrightarrow \varphi_\beta(U_\alpha \cap U_\beta)
\]

is a diffeomorphism (i.e., a smooth map with smooth inverse).

A **smooth map** between manifolds \(f : M \to N\) is one that is smooth in every coordinate chart. The **diffeomorphism group** \(\mathrm{Diff}(M)\) of \(M\) is the group of all bijective smooth maps with smooth inverse. The correct category in differential geometry has smooth manifolds as objects and smooth maps as morphisms.

## 1.2 The Tangent Bundle

At each point \(p \in M\), the **tangent space** \(T_p M\) is the vector space of derivations on germs of smooth functions at \(p\). In local coordinates \((x^1, \ldots, x^n)\) around \(p\), the coordinate tangent vectors \(\partial/\partial x^i\big|_p\) form a basis for \(T_p M\). The **tangent bundle** is the disjoint union

\[
TM = \bigsqcup_{p \in M} T_p M,
\]

which carries a canonical smooth structure making it a \(2n\)-dimensional manifold. The projection \(\pi : TM \to M\), \(\pi(p, v) = p\), is smooth, and \(TM\) is the prototypical example of a **vector bundle** over \(M\).

The **cotangent space** at \(p\) is the dual vector space \(T_p^* M = (T_p M)^*\). Its elements are called **covectors** or **1-forms at \(p\)**. The coordinate basis dual to \(\{\partial/\partial x^i\}\) is \(\{dx^i\}\), defined by \(dx^i(\partial/\partial x^j) = \delta^i_j\). The **cotangent bundle** \(T^*M = \bigsqcup_p T_p^*M\) is likewise a \(2n\)-dimensional smooth manifold.

A **smooth vector field** on \(M\) is a smooth section of \(TM\): a smooth map \(X : M \to TM\) satisfying \(\pi \circ X = \mathrm{id}_M\). Locally, \(X = X^i \partial/\partial x^i\) where the coefficient functions \(X^i : U \to \mathbb{R}\) are smooth. The space \(\mathfrak{X}(M)\) of smooth vector fields on \(M\) is a module over \(C^\infty(M)\) and a Lie algebra under the **Lie bracket** \([X, Y]\), characterized by

\[
[X,Y](f) = X(Y(f)) - Y(X(f)), \quad f \in C^\infty(M).
\]

## 1.3 Tensor Bundles and the Algebra of Tensors

The language of tensors unifies the various geometric objects encountered throughout this course. A **\((r,s)\)-tensor field** on \(M\) is a smooth section of the bundle

\[
T^{(r,s)}M = TM^{\otimes r} \otimes T^*M^{\otimes s}.
\]

In local coordinates, such a tensor field takes the form

\[
T = T^{i_1 \cdots i_r}{}_{j_1 \cdots j_s} \frac{\partial}{\partial x^{i_1}} \otimes \cdots \otimes \frac{\partial}{\partial x^{i_r}} \otimes dx^{j_1} \otimes \cdots \otimes dx^{j_s},
\]

with Einstein summation convention in force throughout. The transformation law under a change of coordinates \(x \mapsto \tilde{x}\) involves factors of \(\partial \tilde{x}^i / \partial x^j\) and \(\partial x^j / \partial \tilde{x}^i\) for each upstairs and downstairs index respectively; this is precisely what makes the global tensor field well-defined.

Important special cases: a **Riemannian metric** is a smooth symmetric positive-definite \((0,2)\)-tensor field; an **almost complex structure** is a smooth \((1,1)\)-tensor field \(J\) satisfying \(J^2 = -\mathrm{id}\); the **curvature tensor** of a connection will be a \((1,3)\)-tensor.

## 1.4 Differential Forms

A **differential \(k\)-form** on \(M\) is a smooth section of the **exterior bundle** \(\Lambda^k T^*M\), i.e., a totally antisymmetric \((0,k)\)-tensor field. The space of \(k\)-forms is denoted \(\Omega^k(M)\). In local coordinates, a \(k\)-form \(\omega\) is written

\[
\omega = \sum_{i_1 < \cdots < i_k} \omega_{i_1 \cdots i_k} \, dx^{i_1} \wedge \cdots \wedge dx^{i_k}.
\]

The **exterior derivative** \(d : \Omega^k(M) \to \Omega^{k+1}(M)\) is the unique \(\mathbb{R}\)-linear operator satisfying: (i) \(d(f) = df\) for \(f \in C^\infty(M) = \Omega^0(M)\); (ii) \(d \circ d = 0\); (iii) \(d(\alpha \wedge \beta) = d\alpha \wedge \beta + (-1)^k \alpha \wedge d\beta\) for \(\alpha \in \Omega^k(M)\). The de Rham complex \((\Omega^\bullet(M), d)\) is fundamental to the global topology of manifolds via the **de Rham cohomology groups**

\[
H^k_{\mathrm{dR}}(M) = \frac{\ker(d : \Omega^k \to \Omega^{k+1})}{\mathrm{im}(d : \Omega^{k-1} \to \Omega^k)}.
\]

The **interior product** \(\iota_X : \Omega^k \to \Omega^{k-1}\) with a vector field \(X\) is defined by

\[
(\iota_X \omega)(X_1, \ldots, X_{k-1}) = \omega(X, X_1, \ldots, X_{k-1}).
\]

The **Lie derivative** \(\mathcal{L}_X = d \circ \iota_X + \iota_X \circ d\) (Cartan's magic formula) encodes the infinitesimal change of a form along the flow of \(X\).

---

# Chapter 2: Vector Bundles

## 2.1 Definition and First Examples

A **vector bundle of rank \(r\)** over a smooth manifold \(M\) is a smooth manifold \(E\) together with a smooth surjection \(\pi : E \to M\) such that:

<div class="definition">
<strong>Definition (Vector bundle).</strong> A smooth map \(\pi : E \to M\) is a <em>smooth vector bundle of rank \(r\)</em> if:
<ol>
  <li>For each \(p \in M\), the <em>fiber</em> \(E_p = \pi^{-1}(p)\) carries the structure of an \(r\)-dimensional real vector space.</li>
  <li>There exists an open cover \(\{U_\alpha\}\) of \(M\) and diffeomorphisms \(\Phi_\alpha : \pi^{-1}(U_\alpha) \to U_\alpha \times \mathbb{R}^r\) (called <em>local trivializations</em>) such that \(\mathrm{pr}_1 \circ \Phi_\alpha = \pi\) and each restriction \(\Phi_\alpha|_{E_p} : E_p \to \{p\} \times \mathbb{R}^r\) is a linear isomorphism.</li>
</ol>
</div>

The **transition functions** \(g_{\alpha\beta} : U_\alpha \cap U_\beta \to GL(r, \mathbb{R})\) are defined by \(\Phi_\alpha \circ \Phi_\beta^{-1}(p, v) = (p, g_{\alpha\beta}(p) v)\) and must satisfy the **cocycle condition** \(g_{\alpha\beta} g_{\beta\gamma} = g_{\alpha\gamma}\) on triple overlaps. Conversely, any collection of smooth functions satisfying the cocycle condition determines a vector bundle.

Standard examples include: the tangent bundle \(TM\) (rank \(n\)); the cotangent bundle \(T^*M\) (rank \(n\)); the tensor bundles \(T^{(r,s)}M\); the exterior bundles \(\Lambda^k T^*M\); a trivial bundle \(M \times \mathbb{R}^r\). Less obvious examples: the **tautological line bundle** over \(\mathbb{RP}^n\), whose fiber over a line \(\ell \in \mathbb{RP}^n\) is the line \(\ell\) itself; the **normal bundle** \(\nu(M)= TN|_M / TM\) when \(M\) is a submanifold of \(N\).

## 2.2 Constructions of Vector Bundles

Given vector bundles \(E \to M\) and \(F \to M\), one constructs new bundles fiberwise using standard linear algebra:

- **Direct sum (Whitney sum):** \((E \oplus F)_p = E_p \oplus F_p\), rank \(r+s\)
- **Tensor product:** \((E \otimes F)_p = E_p \otimes F_p\), rank \(rs\)
- **Dual bundle:** \(E^*_p = (E_p)^*\), rank \(r\)
- **Exterior power:** \((\Lambda^k E)_p = \Lambda^k(E_p)\), rank \(\binom{r}{k}\)
- **Hom bundle:** \(\mathrm{Hom}(E, F)_p = \mathrm{Hom}(E_p, F_p) \cong E^*_p \otimes F_p\)

The **pullback bundle**: given a smooth map \(f : N \to M\) and a bundle \(E \to M\), define \(f^*E \to N\) with fiber \((f^*E)_q = E_{f(q)}\). The transition functions of \(f^*E\) are \(g_{\alpha\beta} \circ f\).

A **section** of \(E \to M\) is a smooth map \(s : M \to E\) with \(\pi \circ s = \mathrm{id}_M\). Sections form a module \(\Gamma(E)\) over \(C^\infty(M)\). A local frame over \(U \subset M\) is an ordered tuple \((e_1, \ldots, e_r)\) of sections over \(U\) that form a basis of each fiber \(E_p\), \(p \in U\); frames exist precisely over trivializing neighborhoods. Globally, a bundle is trivial if and only if it admits a global frame.

## 2.3 Vector-Valued Differential Forms

Given a vector bundle \(E \to M\), an **\(E\)-valued \(k\)-form** is a smooth section of \(\Lambda^k T^*M \otimes E\). The space of such forms is written \(\Omega^k(M; E)\). In a local frame \((e_a)\) for \(E\), such a form is expressed as

\[
\phi = \phi^a \otimes e_a, \quad \phi^a \in \Omega^k(M).
\]

When \(E = M \times \mathbb{R}^r\) is trivial, we recover ordinary \(\mathbb{R}^r\)-valued forms. The **End\((E)\)-valued forms** \(\Omega^k(M; \mathrm{End}\,E)\) play a central role in curvature theory. If \(\alpha \in \Omega^k(M; \mathrm{End}\,E)\) and \(\beta \in \Omega^\ell(M; \mathrm{End}\,E)\), their **graded commutator** is

\[
\left[\alpha, \beta\right] = \alpha \wedge \beta - (-1)^{k\ell} \beta \wedge \alpha \in \Omega^{k+\ell}(M; \mathrm{End}\,E),
\]

where wedge product is taken on the form part and composition on the endomorphism part.

---

# Chapter 3: Connections on Vector Bundles

## 3.1 The Problem of Differentiation

On a smooth manifold, there is no canonical way to differentiate a vector field (or section of a vector bundle) with respect to a tangent direction: the difference quotient \((s(p + tv) - s(p))/t\) is meaningless because \(s(p+tv)\) and \(s(p)\) live in different fibers. A **connection** resolves this by providing a way to identify nearby fibers — that is, a notion of "horizontal" directions in the total space of the bundle.

<div class="definition">
<strong>Definition (Connection on a vector bundle).</strong> Let \(\pi : E \to M\) be a smooth vector bundle. A <em>connection</em> on \(E\) is an \(\mathbb{R}\)-linear map

\[
\nabla : \Gamma(E) \longrightarrow \Omega^1(M; E) = \Gamma(T^*M \otimes E)
\]

satisfying the <em>Leibniz rule</em>: for all \(f \in C^\infty(M)\) and \(s \in \Gamma(E)\),

\[
\nabla(fs) = df \otimes s + f \nabla s.
\]

Given a tangent vector \(X \in T_p M\), the <em>covariant derivative</em> in the direction \(X\) is \(\nabla_X s = (\nabla s)(X) \in E_p\).
</div>

In a local frame \((e_a)_{a=1}^r\) over \(U\), a connection is determined by its **connection 1-forms** \(\omega^a{}_b \in \Omega^1(U)\) defined by

\[
\nabla e_b = \omega^a{}_b \otimes e_a.
\]

For a general section \(s = s^b e_b\), the Leibniz rule gives

\[
\nabla s = (ds^a + \omega^a{}_b s^b) \otimes e_a.
\]

Writing \(\omega = (\omega^a{}_b)\) as an \(r \times r\) matrix of 1-forms, the connection acts as \(\nabla s = ds + \omega s\) on the column vector of components.

Under a change of local frame \(\tilde{e}_a = (g^{-1})^b{}_a e_b\) (where \(g : U \to GL(r,\mathbb{R})\) is the transition matrix), the connection form transforms as

\[
\tilde{\omega} = g \omega g^{-1} + g \, dg^{-1} = g \omega g^{-1} - dg \cdot g^{-1}.
\]

This non-tensorial transformation law is the signature feature that distinguishes a connection from a tensor field.

<div class="remark">
<strong>Remark (Affine structure of connections).</strong> The space of connections on \(E\) is an infinite-dimensional affine space modeled on \(\Omega^1(M; \mathrm{End}\,E)\): if \(\nabla\) and \(\nabla'\) are two connections on \(E\), then \(\nabla' - \nabla\) is a globally defined \(\mathrm{End}(E)\)-valued 1-form \(A \in \Omega^1(M; \mathrm{End}\,E)\), and conversely, \(\nabla + A\) is a connection for any such \(A\). Connections always exist on any vector bundle over a paracompact manifold (by a partition of unity argument).
</div>

## 3.2 The Exterior Covariant Derivative

A connection \(\nabla\) on \(E\) extends uniquely to an operator on \(E\)-valued forms, the **exterior covariant derivative**

\[
d^\nabla : \Omega^k(M; E) \longrightarrow \Omega^{k+1}(M; E),
\]

defined by requiring the Leibniz rule with respect to the wedge product: for \(\alpha \in \Omega^k(M)\) and \(s \in \Gamma(E)\),

\[
d^\nabla(\alpha \otimes s) = d\alpha \otimes s + (-1)^k \alpha \wedge \nabla s.
\]

Locally, if \(\phi = \phi^a \otimes e_a\) with \(\phi^a \in \Omega^k(U)\), then

\[
d^\nabla \phi = (d\phi^a + \omega^a{}_b \wedge \phi^b) \otimes e_a,
\]

or in matrix notation, \(d^\nabla \phi = d\phi + \omega \wedge \phi\). Note that \(d^\nabla\) is not a differential: we compute

\[
(d^\nabla)^2 \phi = d^\nabla(d^\nabla \phi) = d(d\phi + \omega \wedge \phi) + \omega \wedge (d\phi + \omega \wedge \phi) = (d\omega + \omega \wedge \omega) \wedge \phi.
\]

The \(\mathrm{End}(E)\)-valued 2-form \(\Omega = d\omega + \omega \wedge \omega\) is the local expression of the curvature.

## 3.3 Curvature

<div class="definition">
<strong>Definition (Curvature of a connection).</strong> The <em>curvature</em> of a connection \(\nabla\) on \(E\) is the \(\mathrm{End}(E)\)-valued 2-form \(F^\nabla \in \Omega^2(M; \mathrm{End}\,E)\) defined by

\[
F^\nabla(X, Y) s = \nabla_X \nabla_Y s - \nabla_Y \nabla_X s - \nabla_{[X,Y]} s
\]

for \(X, Y \in \mathfrak{X}(M)\) and \(s \in \Gamma(E)\).
</div>

One verifies that this expression is \(C^\infty(M)\)-linear in \(X\), \(Y\), and \(s\), hence defines a genuine tensor. In a local frame, the curvature 2-form is

\[
\Omega = d\omega + \omega \wedge \omega \in \Omega^2(U; \mathfrak{gl}(r, \mathbb{R})),
\]

which is the **Cartan structure equation**. Under a change of frame \(g\), the curvature transforms as

\[
\widetilde{\Omega} = g \Omega g^{-1},
\]

confirming that \(F^\nabla\) is a globally defined tensor (in the adjoint representation of \(GL(r, \mathbb{R})\) on \(\mathfrak{gl}(r, \mathbb{R})\)).

## 3.4 The Bianchi Identity

<div class="theorem">
<strong>Theorem (Bianchi Identity).</strong> For any connection \(\nabla\) on a vector bundle \(E\),

\[
d^\nabla F^\nabla = 0 \in \Omega^3(M; \mathrm{End}\,E).
\]
</div>

<div class="proof">
<strong>Proof.</strong> Locally, we compute:

\[
d^\nabla \Omega = d\Omega + \omega \wedge \Omega - \Omega \wedge \omega.
\]

Substituting \(\Omega = d\omega + \omega \wedge \omega\):

\[
d\Omega = d(d\omega + \omega \wedge \omega) = d\omega \wedge \omega - \omega \wedge d\omega.
\]

Then

\[
d^\nabla \Omega = d\omega \wedge \omega - \omega \wedge d\omega + \omega \wedge (d\omega + \omega \wedge \omega) - (d\omega + \omega \wedge \omega) \wedge \omega = 0,
\]

where all terms cancel using associativity of wedge product and \(\omega \wedge \omega \wedge \omega = 0\) in degrees where it would survive (degree 3, one 1-form wedged with itself). The global statement follows since the computation is frame-independent. \(\square\)
</div>

The Bianchi identity is the analogue of \(d^2 = 0\) for the twisted exterior derivative; it is a fundamental constraint on curvature and is the starting point for many topological results.

---

# Chapter 4: Parallel Transport and Holonomy

## 4.1 Parallel Transport Along Curves

Let \(\gamma : [0,1] \to M\) be a smooth curve and \(E \to M\) a vector bundle with connection \(\nabla\). A section \(s\) along \(\gamma\) — that is, a smooth map \(s : [0,1] \to E\) with \(\pi(s(t)) = \gamma(t)\) — is called **parallel** along \(\gamma\) if

\[
\nabla_{\dot\gamma(t)} s = 0 \quad \text{for all } t \in [0,1].
\]

In local coordinates, with \(\gamma(t)\) in a coordinate patch and frame, this becomes the linear ODE system

\[
\frac{ds^a}{dt} + \omega^a{}_{b\,\mu} \frac{d\gamma^\mu}{dt} s^b = 0,
\]

where \(\omega^a{}_{b\,\mu}\) are the components of the connection form. By the Picard–Lindelöf theorem, this system has a unique solution for any initial value \(s(0) \in E_{\gamma(0)}\).

<div class="definition">
<strong>Definition (Parallel transport).</strong> The <em>parallel transport map</em> along \(\gamma\) from \(t=0\) to \(t=1\) is the linear isomorphism

\[
P_\gamma : E_{\gamma(0)} \xrightarrow{\;\sim\;} E_{\gamma(1)}
\]

sending each initial vector \(v \in E_{\gamma(0)}\) to \(s(1)\), where \(s\) is the unique parallel section along \(\gamma\) with \(s(0) = v\).
</div>

Parallel transport preserves the vector space structure (by linearity of the ODE) and is an isomorphism of fibers. It depends on the path \(\gamma\), not just its endpoints — this path-dependence is precisely encoded by the curvature.

## 4.2 Holonomy Groups

<div class="definition">
<strong>Definition (Holonomy group).</strong> Fix a connection \(\nabla\) on \(E \to M\) and a basepoint \(p \in M\). The <em>holonomy group</em> at \(p\) is

\[
\mathrm{Hol}_p(\nabla) = \left\{ P_\gamma \in GL(E_p) \;\middle|\; \gamma \text{ is a loop based at } p \right\} \leq GL(E_p),
\]

and the <em>restricted holonomy group</em> \(\mathrm{Hol}^0_p(\nabla)\) is the subgroup obtained by restricting to null-homotopic loops.
</div>

The holonomy group is indeed a subgroup: the identity corresponds to the constant loop, composition of loops gives composition of parallel transport maps, and the reverse loop gives the inverse. For a connected manifold, the holonomy groups at different basepoints are conjugate in \(GL(r, \mathbb{R})\), so one speaks of the holonomy group up to conjugation.

<div class="theorem">
<strong>Theorem.</strong> The restricted holonomy group \(\mathrm{Hol}^0_p(\nabla)\) is a connected Lie subgroup of \(GL(E_p)\). The quotient \(\mathrm{Hol}_p(\nabla) / \mathrm{Hol}^0_p(\nabla)\) injects into \(\pi_1(M, p)\).
</div>

This is proven via the theory of differential equations depending on parameters, showing that the group of holonomies varies smoothly.

## 4.3 The Ambrose–Singer Theorem

The Ambrose–Singer theorem is one of the central results connecting curvature to holonomy. Intuitively, it says that the Lie algebra of the holonomy group is generated by the values of the curvature tensor.

<div class="theorem">
<strong>Theorem (Ambrose–Singer, 1953).</strong> Let \(\nabla\) be a connection on a vector bundle \(E \to M\) with \(M\) connected. For a basepoint \(p \in M\), identify \(E_p \cong \mathbb{R}^r\) and let \(\mathfrak{hol}_p(\nabla) \subset \mathfrak{gl}(r, \mathbb{R})\) be the Lie algebra of \(\mathrm{Hol}_p(\nabla)\). Then \(\mathfrak{hol}_p(\nabla)\) is spanned by all endomorphisms of the form

\[
P_\gamma^{-1} \circ F^\nabla(X, Y)\big|_{\gamma(1)} \circ P_\gamma,
\]

where \(\gamma\) ranges over all smooth paths starting at \(p\), and \(X, Y \in T_{\gamma(1)} M\).
</div>

Equivalently, the Lie algebra of \(\mathrm{Hol}_p\) equals the span of all parallel translates of all curvature endomorphisms back to \(p\). The proof uses the fact that horizontal lifts of loops generate the holonomy group, and the curvature measures the infinitesimal failure of such lifts to close.

<div class="example">
<strong>Example.</strong> Consider the round sphere \(S^2 \subset \mathbb{R}^3\) with its round metric and Levi-Civita connection on \(TS^2\). Given a geodesic triangle with interior angles \(\alpha, \beta, \gamma\), parallel transport around the boundary rotates a tangent vector by the angle \(\alpha + \beta + \gamma - \pi\) — the spherical excess, which by the Gauss–Bonnet theorem equals the enclosed area. This geometric angle is precisely the holonomy of the Levi-Civita connection around the loop.
</div>

## 4.4 Flat Connections and the Fundamental Group

<div class="definition">
<strong>Definition (Flat connection).</strong> A connection \(\nabla\) on \(E \to M\) is <em>flat</em> if its curvature vanishes identically: \(F^\nabla = 0\).
</div>

Flat connections are locally trivial: by the Frobenius integrability theorem, the vanishing of \(F^\nabla\) is precisely the integrability condition for the horizontal distribution on the total space of \(E\) to be a foliation. This means flat connections correspond to locally constant (locally parallel) trivializations.

<div class="theorem">
<strong>Theorem (Correspondence between flat connections and representations of \(\pi_1\)).</strong> There is a bijective correspondence

\[
\left\{ \text{flat connections on } E \to M \right\} \Big/ \text{gauge equivalence} \;\longleftrightarrow\; \mathrm{Hom}(\pi_1(M,p), GL(r,\mathbb{R})) \Big/ \text{conjugation}.
\]
</div>

The correspondence sends a flat connection to its **monodromy representation**: for each homotopy class \([\gamma] \in \pi_1(M,p)\), the parallel transport \(P_\gamma \in GL(E_p)\) depends only on the homotopy class (since \(F^\nabla = 0\) implies \(\mathrm{Hol}^0_p = \{e\}\)), yielding a group homomorphism \(\pi_1(M,p) \to GL(r, \mathbb{R})\). Conversely, any such representation determines a flat bundle as a quotient of the universal cover.

This correspondence is a cornerstone of geometry — it underlies the Riemann–Hilbert correspondence, local systems in algebraic geometry, and the theory of opers. The study of flat connections on Riemann surfaces leads into the rich terrain of non-abelian Hodge theory.

---

# Chapter 5: Chern–Weil Theory and Characteristic Classes

## 5.1 Motivation: Characteristic Classes as Topological Invariants

A fundamental question in geometry and topology is: how does one distinguish vector bundles over a manifold? A **characteristic class** assigns to each vector bundle \(E \to M\) a cohomology class \(c(E) \in H^*(M; R)\) (for some ring \(R\)) in a way that is natural: for any smooth map \(f : N \to M\),

\[
c(f^*E) = f^*(c(E)).
\]

The Chern–Weil approach constructs characteristic classes analytically, from the curvature of any connection — and then proves the result is independent of the connection chosen.

## 5.2 Invariant Polynomials

Let \(\mathfrak{g} = \mathfrak{gl}(r, \mathbb{R})\). A **symmetric invariant polynomial** of degree \(k\) is a symmetric multilinear map

\[
P : \underbrace{\mathfrak{g} \times \cdots \times \mathfrak{g}}_k \longrightarrow \mathbb{R}
\]

satisfying \(P(gA_1 g^{-1}, \ldots, gA_k g^{-1}) = P(A_1, \ldots, A_k)\) for all \(g \in GL(r, \mathbb{R})\). Each such \(P\) induces a polynomial function \(\hat{P} : \mathfrak{g} \to \mathbb{R}\), \(\hat{P}(A) = P(A, \ldots, A)\), and the space of invariant polynomial functions on \(\mathfrak{g}\) is the ring \(\mathbb{R}\left[\mathfrak{g}\right]^{GL(r,\mathbb{R})}\).

For \(\mathfrak{g} = \mathfrak{gl}(r, \mathbb{R})\), this ring is generated by the coefficients \(\sigma_k\) of the characteristic polynomial:

\[
\det\!\left(I + tA\right) = 1 + \sigma_1(A)\, t + \sigma_2(A)\, t^2 + \cdots + \sigma_r(A)\, t^r.
\]

Here \(\sigma_k(A)\) is the \(k\)-th elementary symmetric polynomial of the eigenvalues of \(A\).

## 5.3 The Chern–Weil Homomorphism

Given a connection \(\nabla\) on \(E \to M\) with curvature \(F^\nabla \in \Omega^2(M; \mathrm{End}\,E)\), and a symmetric invariant polynomial \(P\) of degree \(k\), one forms the differential form

\[
P(F^\nabla) = P\!\left(\underbrace{F^\nabla, \ldots, F^\nabla}_{k}\right) \in \Omega^{2k}(M),
\]

where the wedge product is used on the form components and the multilinear map \(P\) on the endomorphism components. The key properties of this construction are:

<div class="theorem">
<strong>Theorem (Chern–Weil).</strong> Let \(P\) be a symmetric invariant polynomial of degree \(k\) and \(\nabla\) a connection on \(E \to M\).
<ol>
  <li><strong>Closure:</strong> \(d\left(P(F^\nabla)\right) = 0\), i.e., \(P(F^\nabla)\) is a closed \(2k\)-form.</li>
  <li><strong>Independence of connection:</strong> If \(\nabla'\) is any other connection on \(E\), then \(P(F^{\nabla'}) - P(F^\nabla)\) is exact. Thus the de Rham cohomology class \(\left[P(F^\nabla)\right] \in H^{2k}_{\mathrm{dR}}(M)\) is independent of \(\nabla\).</li>
  <li><strong>Naturality:</strong> For a smooth map \(f : N \to M\), \(P(F^{f^*\nabla}) = f^*(P(F^\nabla))\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof sketch of closure.</strong> Using the Bianchi identity \(d^\nabla F^\nabla = 0\) and the invariance of \(P\), one computes:

\[
dP(F^\nabla) = k \cdot P(d^\nabla F^\nabla, F^\nabla, \ldots, F^\nabla) = 0.
\]

For independence: given two connections \(\nabla_0\) and \(\nabla_1 = \nabla_0 + A\), set \(\nabla_t = \nabla_0 + tA\). One computes

\[
\frac{d}{dt} P(F^{\nabla_t}) = k \cdot d\!\left( P(A, F^{\nabla_t}, \ldots, F^{\nabla_t}) \right),
\]

so \(P(F^{\nabla_1}) - P(F^{\nabla_0}) = d(\text{transgression form})\). \(\square\)
</div>

The assignment \(P \mapsto [P(F^\nabla)]\) is the **Chern–Weil homomorphism**, a ring homomorphism from the algebra of invariant polynomials to \(H^*_{\mathrm{dR}}(M)\).

## 5.4 Chern Classes, Pontryagin Classes, and the Euler Class

For a **complex vector bundle** \(E \to M\) of complex rank \(r\), the **Chern classes** \(c_k(E) \in H^{2k}(M; \mathbb{Z})\) are defined by the Chern–Weil formula using a Hermitian connection \(\nabla\) with curvature \(F^\nabla \in \Omega^2(M; \mathfrak{u}(r))\):

\[
c_k(E) = \left[\sigma_k\!\left(\frac{i}{2\pi} F^\nabla\right)\right] \in H^{2k}_{\mathrm{dR}}(M).
\]

The total Chern class is \(c(E) = 1 + c_1(E) + \cdots + c_r(E)\), and it satisfies the Whitney product formula: \(c(E \oplus F) = c(E) \cup c(F)\).

For a real vector bundle of rank \(r\), the **Pontryagin classes** \(p_k(E) \in H^{4k}(M; \mathbb{Z})\) are defined as:

\[
p_k(E) = (-1)^k c_{2k}(E \otimes_\mathbb{R} \mathbb{C}).
\]

In terms of a real connection with curvature \(\Omega \in \Omega^2(M; \mathfrak{so}(r))\) (using an orthogonal structure),

\[
p_k(E) = \left[\sigma_{2k}\!\left(\frac{1}{2\pi} \Omega\right)\right].
\]

For an oriented real vector bundle of even rank \(2m\), the **Euler class** \(e(E) \in H^{2m}(M; \mathbb{Z})\) is represented by the Pfaffian:

\[
e(E) = \left[\mathrm{Pf}\!\left(\frac{1}{2\pi} \Omega\right)\right],
\]

where the Pfaffian of a skew-symmetric matrix \(A\) satisfies \(\mathrm{Pf}(A)^2 = \det(A)\). When \(E = TM\) is the tangent bundle of an oriented closed \(2m\)-manifold, integrating the Euler class gives the Euler characteristic:

\[
\chi(M) = \int_M e(TM).
\]

This is the **Gauss–Bonnet–Chern theorem** in full generality, one of the landmark results of 20th century mathematics.

<div class="example">
<strong>Example (Chern number of \(\mathbb{CP}^1\)).</strong> Consider the tautological line bundle \(\mathcal{O}(-1) \to \mathbb{CP}^1\). The Fubini–Study metric induces a Hermitian connection whose curvature is (up to the factor \(i/2\pi\)) the Fubini–Study form. One computes \(\int_{\mathbb{CP}^1} c_1(\mathcal{O}(-1)) = -1\), while \(\int_{\mathbb{CP}^1} c_1(\mathcal{O}(1)) = +1\). These integers, the first Chern numbers, are the fundamental topological invariants distinguishing complex line bundles over \(\mathbb{CP}^1\).
</div>

---

# Chapter 6: Connections on the Tangent Bundle

## 6.1 Linear Connections and Torsion

A connection on the tangent bundle \(TM\) is called a **linear connection** or an **affine connection**. Such a connection \(\nabla\) allows one to differentiate vector fields: for \(X, Y \in \mathfrak{X}(M)\), \(\nabla_X Y\) is another vector field. In local coordinates,

\[
\nabla_{\partial_i} \partial_j = \Gamma^k_{ij} \partial_k,
\]

where the \(\Gamma^k_{ij}\) are the **Christoffel symbols** of \(\nabla\), which are smooth functions (not tensor components — they transform non-tensorialy under coordinate changes).

The **torsion** of \(\nabla\) is a \((1,2)\)-tensor:

<div class="definition">
<strong>Definition (Torsion).</strong> The <em>torsion tensor</em> of a linear connection \(\nabla\) is

\[
T^\nabla(X, Y) = \nabla_X Y - \nabla_Y X - [X, Y] \in \mathfrak{X}(M),
\]

for \(X, Y \in \mathfrak{X}(M)\). In local coordinates, \(T^k_{ij} = \Gamma^k_{ij} - \Gamma^k_{ji}\).
</div>

One verifies \(C^\infty\)-linearity in \(X\) and \(Y\), making \(T^\nabla\) a well-defined tensor. Torsion measures the failure of the parallelogram formed by parallel transporting \(X\) and \(Y\) to close. A connection with \(T^\nabla = 0\) is called **torsion-free** (or **symmetric**, since \(\Gamma^k_{ij} = \Gamma^k_{ji}\)).

The Bianchi identity for the curvature of a linear connection has a companion involving torsion. Writing \(R^\nabla\) for the curvature tensor \(R(X,Y)Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X,Y]} Z\), the **first Bianchi identity** for a torsion-free connection states:

\[
R(X,Y)Z + R(Y,Z)X + R(Z,X)Y = 0.
\]

The **second Bianchi identity** is \((\nabla_X R)(Y,Z) + (\nabla_Y R)(Z,X) + (\nabla_Z R)(X,Y) = 0\).

## 6.2 Geodesics and the Exponential Map

<div class="definition">
<strong>Definition (Geodesic).</strong> A smooth curve \(\gamma : I \to M\) is a <em>geodesic</em> of the linear connection \(\nabla\) if its velocity vector field is parallel along itself:

\[
\nabla_{\dot\gamma} \dot\gamma = 0.
\]
</div>

In local coordinates \((x^i)\), with \(\gamma^i(t) = x^i(\gamma(t))\), the geodesic equation is the system of ODEs:

\[
\ddot\gamma^k + \Gamma^k_{ij}(\gamma(t))\, \dot\gamma^i \dot\gamma^j = 0.
\]

By the ODE existence and uniqueness theorem, for each \(p \in M\) and tangent vector \(v \in T_p M\), there exists a unique maximal geodesic \(\gamma_{p,v}\) with \(\gamma_{p,v}(0) = p\) and \(\dot\gamma_{p,v}(0) = v\). The geodesic is defined on some open interval around \(0\). Homogeneity holds: \(\gamma_{p, cv}(t) = \gamma_{p,v}(ct)\) for \(c \in \mathbb{R}\).

<div class="definition">
<strong>Definition (Exponential map).</strong> The <em>exponential map</em> at \(p \in M\) is

\[
\exp_p : \mathcal{U}_p \longrightarrow M, \quad v \mapsto \gamma_{p,v}(1),
\]

where \(\mathcal{U}_p \subset T_p M\) is the open set of vectors \(v\) for which \(\gamma_{p,v}\) is defined at least up to \(t = 1\).
</div>

A fundamental theorem asserts that \(\exp_p\) is a local diffeomorphism near \(0 \in T_p M\): its derivative at \(0\) is the identity map \(T_0(T_p M) \cong T_p M \to T_p M\). **Normal coordinates** at \(p\) are the coordinates \((x^i)\) obtained by choosing an orthonormal basis \(e_1, \ldots, e_n\) of \(T_p M\) and setting \(x^i(q) = \) the \(i\)-th component of \(\exp_p^{-1}(q)\). In normal coordinates, \(\Gamma^k_{ij}(p) = 0\) (but not necessarily their derivatives) and geodesics through \(p\) are straight lines.

---

# Chapter 7: Riemannian Geometry

## 7.1 Riemannian Metrics

<div class="definition">
<strong>Definition (Riemannian metric).</strong> A <em>Riemannian metric</em> on a smooth manifold \(M\) is a smooth symmetric positive-definite \((0,2)\)-tensor field \(g \in \Gamma(S^2 T^*M)\). That is, for each \(p \in M\), \(g_p : T_pM \times T_pM \to \mathbb{R}\) is a positive-definite inner product, varying smoothly with \(p\).
</div>

In local coordinates, \(g = g_{ij} dx^i \otimes dx^j\) where \(g_{ij} = g_{ji}\) and the matrix \((g_{ij})\) is positive definite at every point. The metric defines a canonical isomorphism \(TM \cong T^*M\) (**musical isomorphisms** \(\flat : TM \to T^*M\) and \(\sharp : T^*M \to TM\)): the **flat** of a vector field \(X\) is the 1-form \(X^\flat = g(X, \cdot)\), and \(\sharp\) is its inverse.

A **Riemannian manifold** is a pair \((M, g)\). Riemannian metrics exist on any smooth manifold (by a partition of unity argument). The metric defines:
- A norm on tangent vectors: \(|v|_g = \sqrt{g(v,v)}\)
- A length functional on curves: \(L(\gamma) = \int_a^b |\dot\gamma(t)|_g \, dt\)
- A distance function: \(d_g(p,q) = \inf\{ L(\gamma) : \gamma \text{ connects } p \text{ to } q\}\)

The metric topology induced by \(d_g\) coincides with the manifold topology when \(M\) is connected.

## 7.2 The Levi-Civita Connection

The fundamental theorem of Riemannian geometry asserts the existence of a canonical connection associated to any Riemannian metric.

<div class="theorem">
<strong>Theorem (Fundamental Theorem of Riemannian Geometry).</strong> On any Riemannian manifold \((M,g)\), there exists a unique linear connection \(\nabla\) satisfying:
<ol>
  <li><strong>Torsion-free:</strong> \(\nabla_X Y - \nabla_Y X = [X,Y]\) for all \(X, Y \in \mathfrak{X}(M)\).</li>
  <li><strong>Metric compatibility:</strong> \(Xg(Y,Z) = g(\nabla_X Y, Z) + g(Y, \nabla_X Z)\) for all \(X, Y, Z \in \mathfrak{X}(M)\).</li>
</ol>
This connection is called the <em>Levi-Civita connection</em> of \((M,g)\).
</div>

<div class="proof">
<strong>Proof (uniqueness and existence via Koszul formula).</strong> Suppose \(\nabla\) satisfies both conditions. Write the metric-compatibility condition cyclically for \((X,Y,Z)\), \((Y,Z,X)\), and \((Z,X,Y)\), then combine with the torsion-free condition. One arrives at the <em>Koszul formula</em>:

\[
2g(\nabla_X Y, Z) = Xg(Y,Z) + Yg(Z,X) - Zg(X,Y) - g(X,[Y,Z]) + g(Y,[Z,X]) + g(Z,[X,Y]).
\]

Since \(g\) is non-degenerate, this uniquely determines \(\nabla_X Y\). Conversely, define \(\nabla\) by this formula; one verifies it is a well-defined connection satisfying both conditions. \(\square\)
</div>

The Christoffel symbols of the Levi-Civita connection are given by

\[
\Gamma^k_{ij} = \frac{1}{2} g^{k\ell}\!\left( \partial_i g_{j\ell} + \partial_j g_{i\ell} - \partial_\ell g_{ij} \right),
\]

where \((g^{k\ell})\) is the inverse matrix of \((g_{k\ell})\). These formulas are fundamental in computations; for example, they show immediately that in normal coordinates at a point, all Christoffel symbols vanish at that point.

## 7.3 The Riemannian Curvature Tensor

The curvature of the Levi-Civita connection is the **Riemann curvature tensor**:

\[
R(X,Y)Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X,Y]} Z,
\]

a \((1,3)\)-tensor. Using the metric, one also forms the fully covariant \((0,4)\)-tensor

\[
\mathrm{Rm}(X,Y,Z,W) = g(R(X,Y)Z, W).
\]

This tensor satisfies the following symmetries:

<div class="theorem">
<strong>Theorem (Symmetries of the Riemannian curvature tensor).</strong>
<ol>
  <li><strong>Skew-symmetry in first pair:</strong> \(\mathrm{Rm}(X,Y,Z,W) = -\mathrm{Rm}(Y,X,Z,W)\)</li>
  <li><strong>Skew-symmetry in second pair:</strong> \(\mathrm{Rm}(X,Y,Z,W) = -\mathrm{Rm}(X,Y,W,Z)\)</li>
  <li><strong>Pair symmetry:</strong> \(\mathrm{Rm}(X,Y,Z,W) = \mathrm{Rm}(Z,W,X,Y)\)</li>
  <li><strong>First Bianchi identity:</strong> \(\mathrm{Rm}(X,Y,Z,W) + \mathrm{Rm}(Y,Z,X,W) + \mathrm{Rm}(Z,X,Y,W) = 0\)</li>
</ol>
</div>

These symmetries constrain the number of independent components of \(R\): on an \(n\)-manifold, \(R\) has \(\frac{n^2(n^2-1)}{12}\) independent components (in dimension 2: 1; dimension 3: 6; dimension 4: 20).

**Sectional curvature.** For a 2-plane \(\Pi \subset T_pM\) spanned by orthonormal vectors \(u, v\), the **sectional curvature** of \(\Pi\) is

\[
K(\Pi) = \mathrm{Rm}(u,v,v,u) = g(R(u,v)v, u).
\]

This is independent of the choice of orthonormal basis for \(\Pi\). The Riemann tensor is completely determined by all sectional curvatures (Riemann).

**Ricci curvature** is the trace of the Riemann tensor:

\[
\mathrm{Ric}(X,Y) = \mathrm{tr}\!\left(Z \mapsto R(Z,X)Y\right) = R^i{}_{jik} X^j Y^k \text{ (in coordinates)}.
\]

It is a symmetric \((0,2)\)-tensor. The **scalar curvature** is the further trace: \(\mathrm{scal} = g^{ij} \mathrm{Ric}_{ij}\).

## 7.4 Riemannian Geodesics

In Riemannian geometry, the geodesics of the Levi-Civita connection are the locally length-minimizing curves — this is not automatic and requires proof.

<div class="theorem">
<strong>Theorem (Geodesics locally minimize length).</strong> Let \((M,g)\) be a Riemannian manifold and \(p \in M\). For sufficiently small \(\epsilon > 0\), the geodesic ball \(B_\epsilon(p) = \exp_p(B_\epsilon(0) \subset T_pM)\) has the property that for any \(q \in B_\epsilon(p)\), the unique minimizer of length among all smooth curves from \(p\) to \(q\) is the radial geodesic \(\exp_p(tv)\), \(t \in [0,1]\), where \(v = \exp_p^{-1}(q)\).
</div>

The proof uses the **Gauss lemma**: radial geodesics in normal coordinates are orthogonal to the geodesic spheres. Specifically, if \(\gamma(t) = \exp_p(tv)\) is a radial geodesic and \(\sigma(t) = \exp_p(w(t))\) a curve with \(|w(t)| = \)const, then \(g(\dot\gamma, \dot\sigma) = 0\). This geometric fact, combined with the triangle inequality for integrals, yields local minimization.

## 7.5 The Hopf–Rinow Theorem

The Hopf–Rinow theorem is the fundamental completeness result in Riemannian geometry, showing the equivalence of several notions of completeness and establishing the global existence of geodesic minimizers.

<div class="theorem">
<strong>Theorem (Hopf–Rinow, 1931).</strong> Let \((M,g)\) be a connected Riemannian manifold. The following are equivalent:
<ol>
  <li>\((M, d_g)\) is complete as a metric space.</li>
  <li>The geodesic flow is complete: every geodesic is defined for all \(t \in \mathbb{R}\) (i.e., \(\exp_p\) is defined on all of \(T_pM\) for some, equivalently every, \(p \in M\)).</li>
  <li>Every closed bounded subset of \(M\) is compact.</li>
</ol>
Moreover, if any of these conditions holds, then for every \(p, q \in M\) there exists a minimizing geodesic from \(p\) to \(q\), i.e., a smooth curve of length \(d_g(p,q)\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> The implications \((3) \Rightarrow (1)\) and \((2) \Rightarrow (1)\) are elementary. The key implication is \((1) \Rightarrow (2) \Rightarrow\) (existence of minimizers).

Assume geodesic completeness. For fixed \(p \in M\), define \(A = \{ q \in M : \exists \text{ min. geodesic from } p \text{ to } q \}\). One shows \(A\) is nonempty (as \(p \in A\)), open (by the local minimization theorem), and closed (by a limit argument using completeness and the Arzelà–Ascoli theorem for sequences of minimizing geodesics). Connectedness forces \(A = M\). \(\square\)
</div>

<div class="remark">
<strong>Remark.</strong> The converse of the last statement fails: the existence of a minimizing geodesic between every pair of points does not imply completeness. The punctured plane \(\mathbb{R}^2 \setminus \{0\}\) with the Euclidean metric is an example: points on opposite sides of the origin have no minimizing geodesic (any minimizer would pass through the missing point), yet certain pairs do have minimizers. Completeness is strictly stronger.
</div>

## 7.6 Curvature Comparison and Jacobi Fields

The behavior of geodesics in curved spaces deviates from Euclidean geodesics according to the curvature — this is made precise by **Jacobi fields**. A **Jacobi field** along a geodesic \(\gamma\) is a vector field \(J\) along \(\gamma\) satisfying the Jacobi equation:

\[
\nabla_{\dot\gamma} \nabla_{\dot\gamma} J + R(J, \dot\gamma)\dot\gamma = 0.
\]

Jacobi fields arise as variational vector fields of one-parameter families of geodesics: if \(\Gamma(s, t)\) is a smooth family of geodesics with \(\Gamma(0,t) = \gamma(t)\), then \(J(t) = \partial_s \Gamma(0,t)\) is a Jacobi field along \(\gamma\). They encode the geometric spreading or focusing of nearby geodesics.

<div class="theorem">
<strong>Theorem (Conjugate points and sectional curvature).</strong> A point \(q = \gamma(t_0)\) along a geodesic \(\gamma\) is called a <em>conjugate point</em> to \(\gamma(0)\) along \(\gamma\) if there exists a non-trivial Jacobi field along \(\gamma\) vanishing at both endpoints. In spaces of positive curvature, conjugate points appear earlier than in flat space (by Sturm comparison theory); geodesics cannot be minimizing past conjugate points.
</div>

This leads to the **Bonnet–Myers theorem**: if \(\mathrm{Ric}(v,v) \geq (n-1)\kappa^2 |v|^2\) for some \(\kappa > 0\), then \(M\) is compact with diameter \(\leq \pi/\kappa\). And the **Cartan–Hadamard theorem**: if \(K \leq 0\) everywhere and \(M\) is complete and simply connected, then \(M\) is diffeomorphic to \(\mathbb{R}^n\) and \(\exp_p\) is a global diffeomorphism for every \(p\).

---

# Chapter 8: Submanifolds, Submersions, and Symmetric Spaces

## 8.1 Isometric Immersions and the Second Fundamental Form

Let \((M^n, g)\) be a Riemannian manifold and \(f : \Sigma^k \hookrightarrow M\) an isometric immersion — a smooth map that is an immersion and pulls back \(g\) to a Riemannian metric on \(\Sigma\). The induced metric on \(\Sigma\) is \(\bar{g} = f^*g\). At each point \(p \in \Sigma\), one has the orthogonal decomposition

\[
T_{f(p)} M = T_{f(p)}(\Sigma) \oplus N_{f(p)}(\Sigma),
\]

where \(N(\Sigma) = (T\Sigma)^\perp\) is the **normal bundle** of the immersion, with fiber \(N_p\Sigma = (T_pf(T_p\Sigma))^\perp \subset T_{f(p)}M\).

The **second fundamental form** of the immersion is the symmetric bilinear form

\[
\mathrm{II}(X, Y) = \left(\nabla^M_{X} Y\right)^\perp \in N_p\Sigma,
\]

where \(\nabla^M\) is the Levi-Civita connection of \(M\), \(X, Y \in \mathfrak{X}(\Sigma)\) (viewed as tangent to \(M\)), and \(\perp\) denotes the normal component. The **Gauss formula** relates the intrinsic connection of \(\Sigma\) to that of \(M\):

\[
\nabla^M_X Y = \nabla^\Sigma_X Y + \mathrm{II}(X, Y),
\]

where \(\nabla^\Sigma\) is the Levi-Civita connection of \((\Sigma, \bar{g})\). The **Gauss equation** then gives

\[
R^M(X,Y,Z,W) = R^\Sigma(X,Y,Z,W) - \langle \mathrm{II}(X,W), \mathrm{II}(Y,Z) \rangle + \langle \mathrm{II}(X,Z), \mathrm{II}(Y,W) \rangle,
\]

relating the ambient curvature to the intrinsic curvature and second fundamental form. The **mean curvature** vector field is \(H = \frac{1}{k} \mathrm{tr}_{\bar g} \mathrm{II}\); when \(H = 0\), \(\Sigma\) is a **minimal submanifold**.

## 8.2 Riemannian Submersions

A **Riemannian submersion** \(\pi : (M, g) \to (B, h)\) is a smooth submersion where each differential \(d\pi_p : T_pM \to T_{\pi(p)}B\) restricts to a linear isometry on the horizontal subspace \(\mathcal{H}_p = (\ker d\pi_p)^\perp\). O'Neill's tensor fields \(\mathcal{T}\) and \(\mathcal{A}\) measure the geometric interaction between horizontal and vertical distributions. The key formula relating sectional curvatures is **O'Neill's formula**:

\[
K^B(X, Y) = K^M(\tilde X, \tilde Y) + \frac{3}{4}|[\tilde X, \tilde Y]^{\mathcal{V}}|^2,
\]

where \(\tilde X, \tilde Y\) are horizontal lifts of \(X, Y\) and \(\mathcal{V}\) denotes the vertical component. This shows that the base has larger sectional curvature than the total space along horizontal planes — a fundamental positivity phenomenon used, for instance, in studying the round sphere as a submersion over \(\mathbb{CP}^m\) via the Hopf fibration \(S^{2m+1} \to \mathbb{CP}^m\).

## 8.3 Metrics on Lie Groups and Symmetric Spaces

Let \(G\) be a Lie group with Lie algebra \(\mathfrak{g} = T_e G\). A **left-invariant Riemannian metric** on \(G\) is one satisfying \(L_g^* h = h\) for all \(g \in G\), where \(L_g : G \to G\) is left multiplication. Such a metric is determined by its value at the identity \(e\): any inner product \(\langle \cdot, \cdot \rangle\) on \(\mathfrak{g}\) extends uniquely to a left-invariant metric. If the metric is also right-invariant (i.e., bi-invariant), the Levi-Civita connection takes the especially clean form

\[
\nabla_X Y = \frac{1}{2} [X, Y]
\]

for left-invariant vector fields \(X, Y\). The curvature of a bi-invariant metric is

\[
R(X,Y)Z = \frac{1}{4} [[X,Y], Z],
\]

and the sectional curvature satisfies \(K(X,Y) = \frac{1}{4} |[X,Y]|^2 \geq 0\). Thus compact Lie groups with bi-invariant metrics have non-negative sectional curvature.

A **Riemannian symmetric space** is a Riemannian manifold \((M, g)\) such that for each \(p \in M\) there exists an isometry \(s_p : M \to M\) (the **geodesic symmetry**) that fixes \(p\) and acts as \(-\mathrm{id}\) on \(T_pM\). Symmetric spaces include:
- Euclidean spaces \(\mathbb{R}^n\)
- Round spheres \(S^n\), hyperbolic spaces \(\mathbb{H}^n\)
- Compact Lie groups (with bi-invariant metrics)
- Grassmannian manifolds \(G(k,n)\)
- Complex projective spaces \(\mathbb{CP}^n\) with Fubini–Study metric

The geodesic symmetry at \(p\) maps each geodesic through \(p\) to itself (reversing direction), which forces the curvature tensor to be parallel: \(\nabla R = 0\). Conversely, a complete simply-connected Riemannian manifold with \(\nabla R = 0\) is a symmetric space. This parallel curvature condition is a strong constraint that leads to the complete classification of symmetric spaces by Élie Cartan, expressed in terms of the classification of real simple Lie algebras.

---

# Chapter 9: Synthesis and Further Directions

## 9.1 The Unity of the Course

This course has developed two parallel but deeply intertwined threads. The first, occupying the bulk of the material, concerned **connections on general vector bundles**: the algebraic and differential-geometric framework of connection forms, curvature, parallel transport, and holonomy, culminating in the topological content of Chern–Weil theory. The second thread developed the **specific Riemannian setting**, where the structure group reduces from \(GL(n)\) to \(O(n)\), the Levi-Civita connection is canonical, and metric-geometric concepts — geodesics, completeness, comparison theorems — come into play.

The relationship between these threads is not incidental. The Levi-Civita connection is a connection on the principal frame bundle of \((M,g)\), reduced to the orthonormal frame bundle \(\mathrm{SO}(M,g)\). The Riemann curvature tensor is precisely the curvature of this connection. The characteristic classes computed via Chern–Weil theory from the Levi-Civita connection are the Pontryagin classes of \(TM\) and (for oriented even-dimensional manifolds) the Euler class — these are topological invariants of the manifold itself.

## 9.2 Holonomy and Special Geometry

One of the most beautiful applications of holonomy theory is the Berger classification of Riemannian holonomy groups. For a simply-connected, irreducible, non-locally-symmetric Riemannian manifold \((M^n, g)\), Berger proved in 1955 that the holonomy group of the Levi-Civita connection must be one of:

| Holonomy group | Manifold type | Dimension |
|---|---|---|
| \(SO(n)\) | Generic Riemannian | \(n\) |
| \(U(m)\) | Kähler | \(2m\) |
| \(SU(m)\) | Calabi–Yau | \(2m\) |
| \(Sp(m)\) | Hyperkähler | \(4m\) |
| \(Sp(m) \cdot Sp(1)\) | Quaternionic Kähler | \(4m\) |
| \(G_2\) | \(G_2\)-manifold | \(7\) |
| \(\mathrm{Spin}(7)\) | \(\mathrm{Spin}(7)\)-manifold | \(8\) |

The **Ambrose–Singer theorem** (Chapter 4) is the key tool: it translates holonomy reduction into algebraic constraints on the curvature tensor. Reduced holonomy implies the existence of parallel differential forms (or spinors), which in turn impose strong constraints on the topology and geometry of the manifold. Spiro Karigiannis's research is closely connected to the study of \(G_2\)-manifolds and \(\mathrm{Spin}(7)\)-manifolds — the exceptional holonomy cases.

## 9.3 Index Theory and the Atiyah–Singer Theorem

The Chern–Weil characteristic classes of Chapters 5 and 7 are the analytic inputs for the **Atiyah–Singer index theorem**: for a first-order elliptic differential operator \(D : \Gamma(E) \to \Gamma(F)\) on a compact manifold, the index \(\mathrm{ind}(D) = \dim\ker D - \dim\ker D^*\) equals a topological quantity expressible in terms of characteristic classes. The prototypical example is the **Hirzebruch signature theorem**: the signature of a compact oriented \(4k\)-manifold equals \(\int_M L(TM)\), where \(L\) is the Hirzebruch \(L\)-polynomial in the Pontryagin classes. The **Chern–Gauss–Bonnet theorem** \(\chi(M) = \int_M e(TM)\) is another special case.

## 9.4 Yang–Mills Theory

From the physics perspective, the central objects of this course — connections on vector bundles, curvature, and holonomy — are the mathematical language of **gauge theory** in particle physics. A connection \(\nabla\) on a principal \(G\)-bundle \(P \to M\) (the gauge-theoretic formulation) is a **gauge field**; its curvature \(F^\nabla\) is the **field strength**. The **Yang–Mills functional**

\[
\mathcal{YM}(\nabla) = \int_M |F^\nabla|^2 \, \mathrm{vol}_g
\]

is the natural energy functional on connections, and its critical points (Yang–Mills connections) satisfy the Yang–Mills equation \(d^\nabla \star F^\nabla = 0\). On a compact Kähler surface, the Donaldson–Uhlenbeck–Yau theorem gives a beautiful algebro-geometric characterization of Yang–Mills minimizers: they correspond to **Hermitian–Einstein connections** on holomorphic bundles, connecting differential geometry to complex algebraic geometry. The moduli spaces of Yang–Mills instantons on 4-manifolds led Donaldson to his revolutionary results distinguishing smooth 4-manifold structures.

## 9.5 Ricci Flow and Geometric Analysis

A natural direction from Chapter 7 is the **Ricci flow**, introduced by Richard Hamilton in 1982:

\[
\frac{\partial g_{ij}}{\partial t} = -2 \, \mathrm{Ric}_{ij}.
\]

This is a nonlinear parabolic PDE for the Riemannian metric, analogous to the heat equation. Under Ricci flow, regions of positive curvature "expand" and regions of negative curvature "contract," driving the metric toward constant curvature. Hamilton proved that a compact 3-manifold with positive Ricci curvature becomes round under Ricci flow. Perelman's celebrated work (2002–2003), using Ricci flow with surgery, established the **Geometrization Conjecture** (and thus the **Poincaré Conjecture**) — the deepest result yet proved using the differential-geometric machinery of connections and curvature.

---

# Appendix: Key Formulas and Sign Conventions

## A.1 Curvature in Local Coordinates

For the Levi-Civita connection with Christoffel symbols \(\Gamma^k_{ij}\), the curvature tensor in coordinates is

\[
R^\ell{}_{kij} = \partial_i \Gamma^\ell_{jk} - \partial_j \Gamma^\ell_{ik} + \Gamma^\ell_{i\mu} \Gamma^\mu_{jk} - \Gamma^\ell_{j\mu} \Gamma^\mu_{ik}.
\]

Note: sign conventions differ across sources. We use \(R(X,Y)Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X,Y]} Z\) (Lee's convention).

## A.2 Cartan's Structure Equations

Given a local frame \((e_a)\) for \(E \to M\) and connection forms \(\omega = (\omega^a{}_b)\):

\[
\Omega^a{}_b = d\omega^a{}_b + \omega^a{}_c \wedge \omega^c{}_b \quad (\text{curvature 2-forms})
\]

\[
d^\nabla \Omega = d\Omega + \omega \wedge \Omega - \Omega \wedge \omega = 0 \quad (\text{Bianchi identity})
\]

For the orthonormal coframe \((\theta^i)\) of a Riemannian manifold, Cartan's first structure equation is \(d\theta^i = -\omega^i{}_j \wedge \theta^j\) (torsion-free), and the second is \(\Omega^i{}_j = d\omega^i{}_j + \omega^i{}_k \wedge \omega^k{}_j\).

## A.3 Chern–Weil Formulas

For a complex vector bundle with Hermitian connection:

\[
c_1(E) = \left[\frac{i}{2\pi} \mathrm{tr}(F^\nabla)\right], \quad c_2(E) = \left[\frac{1}{8\pi^2}\left(\mathrm{tr}(F^\nabla)^2 - \mathrm{tr}(F^\nabla \wedge F^\nabla)\right)\right]
\]

For the tangent bundle of an oriented 4-manifold with Levi-Civita connection:

\[
p_1(M) = \left[-\frac{1}{8\pi^2} \mathrm{tr}(\Omega \wedge \Omega)\right], \quad e(M) = \left[\frac{1}{8\pi^2} \mathrm{Pf}(\Omega)\right]
\]

\[
\chi(M) = \int_M e(TM), \quad \sigma(M) = \frac{1}{3} \int_M p_1(M) \quad ({\rm signature, if } M \text{ closed})
\]
