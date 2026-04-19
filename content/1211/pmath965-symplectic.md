---
title: "PMATH 965: Symplectic Geometry and Geometric Invariant Theory"
subjects: PMATH
prof: "Ben Webster, Ruxandra Moraru"
---

## Sources

- McDuff, D. & Salamon, D. *Introduction to Symplectic Topology*. Oxford University Press.
- Abraham, R. & Marsden, J. E. *Foundations of Mechanics*. Benjamin/Cummings (2nd ed.).
- Newstead, P. E. *Introduction to Moduli Problems and Orbit Spaces*. Tata Institute of Fundamental Research / Springer.
- Mukai, S. *An Introduction to Invariants and Moduli*. Cambridge University Press.
- Kirwan, F. *Cohomology of Quotients in Symplectic and Algebraic Geometry*. Princeton University Press.

---

# Chapter 1: Symplectic Structures and Forms

## 1.1 Definition and Basic Properties

A **symplectic structure** on a smooth manifold \(M\) is a closed, non-degenerate 2-form \(\omega \in \Omega^2(M)\). Formally:

\[\omega \in \Omega^2(M), \quad d\omega = 0, \quad \omega^n \neq 0 \text{ (nowhere)}\]

where \(n = \dim M / 2\). The manifold \((M, \omega)\) is called a **symplectic manifold**, and the form \(\omega\) is the symplectic form.

The non-degeneracy condition means that for every \(p \in M\), the bilinear form \(\omega_p : T_p M \times T_p M \to \mathbb{R}\) is non-degenerate: if \(\omega_p(v, w) = 0\) for all \(w \in T_p M\), then \(v = 0\). This is equivalent to saying that \(\omega^n\) is a volume form on \(M\).

<div style="border-left: 4px solid #0066cc; padding-left: 16px; margin: 16px 0;">
<strong>Key observation:</strong> Non-degeneracy of \(\omega\) implies that every symplectic manifold is even-dimensional, and there exists a canonical isomorphism \(T_p M \cong T_p^* M\) via \(v \mapsto \omega_p(v, \cdot)\). This is fundamentally different from Riemannian geometry, where the metric provides an isomorphism with a preferred inner product structure.
</div>

The closed condition \(d\omega = 0\) is called the **closure axiom** and makes \((M, \omega)\) into a symplectic manifold. This condition is essential for symplectic geometry and distinguishes it from the broader category of almost-symplectic manifolds, which have only the non-degeneracy condition.

## 1.2 Examples

1. **Standard symplectic space:** Let \(M = \mathbb{R}^{2n}\) with coordinates \((q_1, \ldots, q_n, p_1, \ldots, p_n)\). Define

\[\omega_0 = \sum_{i=1}^n dq_i \wedge dp_i.\]

This is the **canonical symplectic form** on \(\mathbb{R}^{2n}\). The manifold \((\mathbb{R}^{2n}, \omega_0)\) is the universal model for symplectic geometry locally.

2. **Kahler manifolds:** Every Kähler manifold carries a natural symplectic structure. If \((M, J, g)\) is a Kähler manifold with complex structure \(J\) and Riemannian metric \(g\), then the 2-form

\[\omega(v, w) = g(Jv, w)\]

is a symplectic form. This integrates symplectic and complex geometry.

3. **Cotangent bundles:** For any smooth manifold \(Q\), the cotangent bundle \(T^* Q\) admits a canonical symplectic structure. If \((q_i)\) are local coordinates on \(Q\) and \((q_i, p_i)\) are the induced coordinates on \(T^* Q\), then

\[\omega = \sum_i dq_i \wedge dp_i\]

is the **Liouville form** pulled back from the canonical 1-form \(\theta = \sum p_i dq_i\).

4. **Coadjoint orbits:** Let \(\mathfrak{g}^*\) be the dual of a Lie algebra \(\mathfrak{g}\). The coadjoint orbits under the action of a Lie group \(G\) carry natural symplectic structures inherited from the Kirillov-Kostant form.

## 1.3 Darboux's Theorem

One of the foundational results in symplectic geometry is **Darboux's theorem**, which states that every symplectic manifold is locally indistinguishable from the standard symplectic space \((\mathbb{R}^{2n}, \omega_0)\).

**Theorem (Darboux):** Let \((M, \omega)\) be a symplectic manifold of dimension \(2n\). Around any point \(p \in M\), there exist local coordinates \((q_1, \ldots, q_n, p_1, \ldots, p_n)\) such that

\[\omega = \sum_{i=1}^n dq_i \wedge dp_i\]

in a neighborhood of \(p\). These are called **Darboux coordinates** or **canonical coordinates**.

<div style="border-left: 4px solid #0066cc; padding-left: 16px; margin: 16px 0;">
<strong>Contrast with Riemannian geometry:</strong> In Riemannian geometry, the metric cannot be flattened to the Euclidean metric by local coordinates—curvature is an obstruction. In symplectic geometry, Darboux's theorem shows that there is no local obstruction; all symplectic structures are locally isomorphic. This means that the global topology and global structure of the manifold are the primary invariants in symplectic geometry.
</div>

The proof of Darboux's theorem proceeds by iteratively straightening the form \(\omega\) using diffeomorphisms. The strategy is to show that if \(\omega\) agrees with \(\omega_0\) on a \(k\)-dimensional submanifold, one can extend agreement to a \((k+2)\)-dimensional submanifold by carefully constructing diffeomorphisms via Cartan's magic formula and integration of vector fields.

**Consequence:** Unlike in Riemannian geometry where local geometry is determined by curvature, symplectic geometry is governed by **global topological invariants** such as the cohomology class \([\omega] \in H^2(M; \mathbb{R})\) and higher symplectic invariants like contact homology and Floer homology. The local form is always the same.

---

# Chapter 2: Kähler Geometry and Complex Structures

## 2.1 Complex Manifolds and Almost-Complex Structures

An **almost-complex structure** on a real manifold \(M\) of dimension \(2n\) is an endomorphism \(J : TM \to TM\) such that \(J^2 = -\mathrm{id}\). This allows us to view \(M\) as a complex manifold locally.

A **complex manifold** is a real manifold that is locally biholomorphic to \(\mathbb{C}^n\). Equivalently, it admits a complex atlas with holomorphic transition functions. Every complex manifold \(M\) of complex dimension \(n\) has a canonical almost-complex structure \(J\) obtained by viewing multiplication by \(i\) on each tangent space.

An almost-complex structure \(J\) is **integrable** if the **Nijenhuis tensor**

\[N_J(X,Y) = [JX, JY] - J[JX, Y] - J[X, JY] + [X,Y]\]

vanishes identically. The **Newlander-Nirenberg theorem** states that an almost-complex structure is integrable if and only if it arises from a complex structure.

## 2.2 Kähler Structures

Let \(M\) be a complex manifold of complex dimension \(n\) with Hermitian metric \(h\). The metric \(h\) is a Riemannian metric \(g\) that satisfies \(g(JX, JY) = g(X, Y)\) for all vector fields \(X, Y\), where \(J\) is the complex structure.

Associated to \(h\) is the **fundamental 2-form**

\[\omega(X, Y) = g(JX, Y).\]

A **Kähler metric** is a Hermitian metric such that the fundamental 2-form \(\omega\) is closed: \(d\omega = 0\).

A **Kähler manifold** is a complex manifold equipped with a Kähler metric. The pair \((M, \omega)\) where \(\omega = g(J \cdot, \cdot)\) is a symplectic manifold with the additional structure of a compatible complex structure.

<div style="border-left: 4px solid #0066cc; padding-left: 16px; margin: 16px 0;">
<strong>Why Kähler geometry?</strong> Kähler manifolds form a special class where complex, symplectic, and Riemannian structures interact harmoniously. The closure of \(\omega\) imposes differential constraints on the metric (the Kähler condition), which severely restricts the topology and geometry compared to general symplectic or complex manifolds. This makes Kähler geometry a powerful tool for studying projective varieties and algebraic geometry.
</div>

**Examples of Kähler manifolds:**

1. **Euclidean space** \(\mathbb{C}^n\) with the standard flat metric \(g = \sum_j d\bar{z}_j dz_j\).

2. **Projective space** \(\mathbb{CP}^n\) with the Fubini–Study metric, whose Kähler form is

\[\omega = \frac{i}{2\pi} \partial \bar{\partial} \log \|z\|^2\]

where \(z\) is a homogeneous coordinate.

3. **Smooth projective varieties** in \(\mathbb{CP}^n\) inherit Kähler structures from the ambient space.

4. **Toric varieties** and their moment polytopes.

5. **Flag varieties** \(G/P\) where \(G\) is a compact Lie group and \(P\) is a parabolic subgroup.

## 2.3 Kähler-Einstein Metrics and Scalar Curvature

A **Kähler-Einstein metric** is a Kähler metric whose Ricci tensor is proportional to the metric:

\[\mathrm{Ric}(g) = \lambda g\]

for some constant \(\lambda \in \mathbb{R}\). The scalar curvature of a Kähler metric is related to the Ricci form \(\rho\) (which is also a 2-form) by

\[\rho = -\mathrm{Ric}(g) = c_1(M)\]

in appropriate normalization, where \(c_1(M)\) is the first Chern class of the tangent bundle.

The problem of existence and uniqueness of Kähler-Einstein metrics is central to modern differential geometry and involves sophisticated techniques from geometric PDEs and algebraic geometry. The case \(\lambda > 0\) (Fano varieties) involves the Kähler–Ricci flow and extremal metrics.

---

# Chapter 3: Hamiltonian Systems and Vector Fields

## 3.1 Hamiltonian Vector Fields

On a symplectic manifold \((M, \omega)\), every smooth function \(H : M \to \mathbb{R}\) (the **Hamiltonian**) defines a vector field \(X_H\), the **Hamiltonian vector field**, by

\[\iota_{X_H} \omega = -dH.\]

Here \(\iota_{X_H} \omega\) denotes the interior product (contraction) of \(\omega\) by \(X_H\). The non-degeneracy of \(\omega\) ensures that \(X_H\) is uniquely determined by \(H\).

In Darboux coordinates \((q_i, p_i)\) where \(\omega = \sum dq_i \wedge dp_i\), the Hamiltonian vector field has the **canonical form**

\[X_H = \sum_{i=1}^n \left( \frac{\partial H}{\partial p_i} \frac{\partial}{\partial q_i} - \frac{\partial H}{\partial q_i} \frac{\partial}{\partial p_i} \right).\]

This is Hamilton's equations: \(\dot{q}_i = \frac{\partial H}{\partial p_i}\) and \(\dot{p}_i = -\frac{\partial H}{\partial q_i}\). The variables \(q_i\) are **positions** and \(p_i\) are **momenta** in classical mechanics.

**Liouville's theorem:** The flow of a Hamiltonian vector field preserves the symplectic form:

\[\mathcal{L}_{X_H} \omega = 0.\]

This follows from Cartan's formula and closure of \(\omega\):

\[\mathcal{L}_{X_H} \omega = d(\iota_{X_H} \omega) + \iota_{X_H} (d\omega) = d(-dH) + 0 = 0.\]

Consequently, the Hamiltonian flow preserves the volume form \(\omega^n\) (which is the Liouville measure), a fundamental fact in statistical mechanics.

## 3.2 Poisson Bracket and Symplectic Linear Algebra

The **Poisson bracket** of two functions \(f, g \in C^\infty(M)\) is defined by

\[\{f, g\} = \omega(X_f, X_g) = dg(X_f) = -df(X_g).\]

In Darboux coordinates,

\[\{f, g\} = \sum_{i=1}^n \left( \frac{\partial f}{\partial q_i} \frac{\partial g}{\partial p_i} - \frac{\partial f}{\partial p_i} \frac{\partial g}{\partial q_i} \right).\]

The Poisson bracket is antisymmetric, bilinear, and satisfies the **Jacobi identity**:

\[\{f, \{g, h\}\} + \{g, \{h, f\}\} + \{h, \{f, g\}\} = 0.\]

Functions \(f\) and \(g\) are **in involution** if \(\{f, g\} = 0\), meaning their flows commute. A **completely integrable system** is one with \(n\) independent functions in involution on a \(2n\)-dimensional symplectic manifold—this is the condition for integrability in the sense of Liouville-Arnold.

## 3.3 Symplectic Linear Algebra

The restriction of the theory to linear algebra: a **linear symplectic structure** on a vector space \(V\) of even dimension \(2n\) is a non-degenerate, closed 2-form \(\omega\). Every linear symplectic space is isomorphic to \((\mathbb{R}^{2n}, \omega_0)\).

A linear map \(A : V \to V\) is **symplectic** if \(\omega(Av, Aw) = \omega(v, w)\) for all \(v, w \in V\). The group of symplectic linear maps is the **symplectic group** \(\mathrm{Sp}(2n, \mathbb{R})\), defined as

\[\mathrm{Sp}(2n, \mathbb{R}) = \{A \in GL(2n, \mathbb{R}) : A^T J A = J\}\]

where \(J = \begin{pmatrix} 0 & -I_n \\ I_n & 0 \end{pmatrix}\).

The symplectic group is a Lie group of dimension \(n(2n+1)\). Its structure and representations are fundamental in quantum mechanics and representation theory.

---

# Chapter 4: Moment Maps and Symplectic Actions

## 4.1 Moment Maps: Definition and Properties

Let \((M, \omega)\) be a symplectic manifold and \(G\) a Lie group acting on \(M\) by symplectomorphisms (i.e., the action preserves \(\omega\)). A **moment map** (or **momentum map**) is a map \(\mu : M \to \mathfrak{g}^*\) such that:

1. For each \(\xi \in \mathfrak{g}\), we have \(\iota_{X_\xi} \omega = -d\mu^\xi\), where \(\mu^\xi(m) = \langle \mu(m), \xi \rangle\) and \(X_\xi\) is the infinitesimal generator of the action of \(\exp(t\xi)\).

2. \(\mu\) is \(G\)-equivariant with respect to the coadjoint action on \(\mathfrak{g}^*\):

\[\mu(g \cdot m) = \mathrm{Ad}_g^* \mu(m) \quad \text{for all } g \in G, m \in M.\]

**Example:** On \(\mathbb{R}^{2n}\) with \(\omega_0 = \sum dq_i \wedge dp_i\), the action of \(\mathrm{SO}(n)\) rotating the \(p\)-coordinates has moment map \(\mu(q, p) = q \times p\) (angular momentum).

<div style="border-left: 4px solid #0066cc; padding-left: 16px; margin: 16px 0;">
<strong>Geometric meaning:</strong> A moment map encodes the infinitesimal action of the group via the symplectic form. When the action is Hamiltonian (has a moment map), the group action is integrable into the symplectic geometry in a way that connects global symmetries to conserved quantities. In mechanics, moment maps correspond to conservation laws (energy, angular momentum, etc.).
</div>

## 4.2 Hamiltonian Group Actions

An action of \(G\) on \((M, \omega)\) is **Hamiltonian** if a moment map exists. This is stronger than merely preserving the symplectic form; it requires the action to be "generated" by Hamiltonians.

**Theorem (Kostant-Sternberg):** If \(G\) is compact and acts on a compact symplectic manifold \((M, \omega)\), then there exists a moment map \(\mu : M \to \mathfrak{g}^*\).

The moment map is unique up to adding a constant in \(\mathfrak{g}^*\).

## 4.3 Properties of Moment Maps

1. **Fibers are invariant:** The preimage \(\mu^{-1}(\xi)\) is \(G\)-invariant for each \(\xi \in \mathfrak{g}^*\).

2. **Fixed points:** If \(m \in M^G\) is a fixed point of the action, then \(\mu(m)\) is the same for all fixed points.

3. **Convexity (Atiyah-Guillemin-Sternberg):** For a toric action (i.e., \(G = T\) is a torus) on a compact connected symplectic manifold, the image \(\mu(M) \subset \mathfrak{t}^*\) is a convex polytope. This provides a bridge between symplectic geometry and combinatorial geometry.

4. **Fiber connectivity:** The fibers of a moment map are connected when \(G\) is connected and acts on a connected manifold.

## 4.4 Toric Varieties and Moment Polytopes

A **toric variety** is a normal algebraic variety \(X\) containing a torus \(T = (\mathbb{C}^*)^n\) as a dense open subset, with the torus action extending to \(X\).

When \(X\) is symplectic (for instance, a smooth projective toric variety), the moment map \(\mu : X \to \mathfrak{t}^*\) has image equal to the **moment polytope**, a convex polytope in \(\mathbb{R}^n\). The structure of \(X\) can be recovered from this combinatorial data:

- Vertices of the polytope correspond to fixed points of the torus action.
- Edges correspond to 1-dimensional \(T\)-orbits.
- Facets correspond to torus-invariant divisors.

This is a fundamental example of how symplectic geometry connects to combinatorics and algebraic geometry.

---

# Chapter 5: Symplectic Quotients and Reduction

## 5.1 Symplectic Reduction: The Main Construction

**Symplectic reduction** (or **Marsden-Weinstein reduction**) is a procedure for constructing new symplectic manifolds from a given symplectic manifold with a group action and moment map.

**Construction:** Let \((M, \omega)\) be a symplectic manifold with a Hamiltonian action of \(G\) and moment map \(\mu : M \to \mathfrak{g}^*\). Fix a regular value \(\xi \in \mathfrak{g}^*\) of \(\mu\) (meaning \(d\mu\) is surjective at all points of \(\mu^{-1}(\xi)\)).

Define the **level set** \(M_\xi = \mu^{-1}(\xi)\). The group \(G_\xi = \{g \in G : \mathrm{Ad}_g^* \xi = \xi\}\) (the **stabilizer** of \(\xi\)) acts on \(M_\xi\). If the action is free and proper, the quotient

\[M//G = M_\xi / G_\xi\]

is a smooth manifold. 

**Theorem (Marsden-Weinstein):** There exists a unique symplectic form \(\omega_{\text{red}}\) on \(M//G\) such that \(\pi^* \omega_{\text{red}} = \iota^* \omega\), where \(\iota : M_\xi \to M\) is inclusion and \(\pi : M_\xi \to M//G\) is the quotient map. Thus \((M//G, \omega_{\text{red}})\) is a symplectic manifold.

<div style="border-left: 4px solid #0066cc; padding-left: 16px; margin: 16px 0;">
<strong>Dimension formula:</strong> If \(G\) has dimension \(d\) and the action is free and proper, then

\[
\dim(M//G) = \dim M - 2 \dim G.
\]

Note that we lose twice the dimension of the group, not just the dimension. This reflects the fact that the symplectic form provides a canonical isomorphism between the normal directions to the group orbits and cotangent directions.
</div>

## 5.2 Examples of Symplectic Reduction

**Example 1: Rotating rigid body**
Start with \(T^* SO(3) \cong SO(3) \times \mathbb{R}^3\) with the standard symplectic form. The action of \(SO(3)\) by left multiplication has moment map \(\mu = \text{angular momentum}\). At a regular value (say, fixed total angular momentum), the reduction gives a 2-dimensional symplectic manifold, the **phase space of a spinning top** with fixed angular momentum magnitude.

**Example 2: Gaussian constraint in gauge theory**
In Yang-Mills theory, the Gauss constraint \(G = d_A^* F\) (where \(A\) is a connection and \(F\) is its curvature) defines a moment map for the gauge group acting on the space of connections. Symplectic reduction by this constraint gives the **reduced phase space** of gauge-invariant degrees of freedom.

**Example 3: Moduli spaces via reduction**
Many moduli spaces can be realized as symplectic quotients. For instance, the moduli space of flat connections on a surface \(\Sigma\) is the symplectic reduction of the space of all connections by the curvature constraint.

## 5.3 Quotient by Finite Groups

When \(G\) is finite, the quotient \(M/G\) is automatically a smooth manifold (if the action is free), and the symplectic form on \(M\) descends directly to \(M/G\). This is a special case of symplectic reduction where the moment map is trivial (the action generates no Hamiltonians beyond constants).

When the action is not free, the quotient \(M/G\) may be singular. The resolution of these singularities and the symplectic structure on the resolution are important in understanding orbifold geometry and crepant resolutions.

---

# Chapter 6: Geometric Invariant Theory — Foundations

## 6.1 Group Actions on Varieties

Geometric invariant theory (GIT) studies quotients of varieties by group actions, particularly actions by reductive groups (like \(GL_n\), \(\mathrm{SL}_n\), \(O_n\), etc.) and products thereof.

Let \(X\) be an algebraic variety (over \(\mathbb{C}\)) and \(G\) a reductive group acting on \(X\). The **ring of invariants** is

\[R = \mathbb{C}[X]^G = \{f \in \mathbb{C}[X] : f(gx) = f(x) \text{ for all } g \in G, x \in X\}.\]

By the **Hilbert-Mumford theorem**, if \(G\) is reductive, the ring \(R\) is finitely generated as a \(\mathbb{C}\)-algebra. This allows us to define the **quotient variety**

\[X //_{0} G = \mathrm{Spec}(R),\]

called the **affine GIT quotient**. The quotient map \(\pi : X \to X //_{0} G\) is a categorical quotient: every \(G\)-invariant morphism \(X \to Y\) factors uniquely through \(\pi\).

<div style="border-left: 4px solid #0066cc; padding-left: 16px; margin: 16px 0;">
<strong>Quotient vs. Orbit space:</strong> In contrast to the topological quotient, the categorical quotient \(X //_{0} G\) may not be surjective, and fibers may not be orbits. Points that cannot be separated by invariants belong to the same fiber, a phenomenon central to understanding instability in GIT.
</div>

## 6.2 Dimension Reduction in GIT

Unlike symplectic reduction where dimension drops by \(2 \dim G\), in GIT the dimension typically drops by \(\dim G\):

\[\dim(X //_{0} G) = \dim X - \dim G_{\text{generic}}\]

where \(G_{\text{generic}}\) is the generic stabilizer. When the action is free, \(\dim(X //_{0} G) = \dim X - \dim G\).

This difference reflects the algebraic, rather than symplectic, nature of the quotient.

## 6.3 Line Bundles and GIT

A more refined approach to GIT uses linearizations. Suppose \(G\) acts on \(X\) and \(L\) is a \(G\)-equivariant ample line bundle on \(X\). The **GIT quotient with respect to** \(L\) is defined using the space of global sections and their \(G\)-invariant combinations.

The **quotient** is then

\[X //^L G = \mathrm{Proj}(\bigoplus_{k=0}^\infty H^0(X, L^{\otimes k})^G),\]

a projective variety whose geometry depends on the choice of linearization \(L\).

---

# Chapter 7: Stability and Semistability in GIT

## 7.1 Mumford's Stability Criterion

Let \(G\) act on an affine variety \(X\) with invariant ring \(R = \mathbb{C}[X]^G\), and suppose \(G\) acts on a line bundle \(L\) by a character \(\chi : G \to \mathbb{G}_m\).

A point \(x \in X\) is:

- **Semistable** with respect to \((G, \chi)\) if there exists an invariant section \(s \in H^0(X, L^{\otimes n})^G\) for some \(n > 0\) such that \(s(x) \neq 0\). Equivalently, \(x \notin V(I)\) where \(I = \{f \in R : \chi(f) > 0\}\).

- **Stable** if \(x\) is semistable, and additionally the stabilizer \(G_x\) is trivial, and the orbit \(G \cdot x\) is closed in the set of semistable points.

**Hilbert-Mumford criterion:** Over \(\mathbb{C}\), a point \(x\) is semistable for \((G, \chi)\) if and only if for every 1-parameter subgroup \(\lambda : \mathbb{G}_m \to G\), we have

\[\liminf_{t \to 0} \chi(\lambda(t)) \cdot \lambda(t) \cdot x\]

is in the semistable locus. In practice, one checks the weight of the action on each character.

<div style="border-left: 4px solid #0066cc; padding-left: 16px; margin: 16px 0;">
<strong>Geometric intuition:</strong> A point is semistable if one can find an invariant polynomial that doesn't vanish at that point. This is a measure of how "generic" or "not too special" the point is. Stable points have trivial stabilizers and form open dense sets in the semistable locus.
</div>

## 7.2 Relationship to Symplectic Reduction

There is a deep connection between symplectic reduction and GIT stability:

**Kempf-Ness theorem:** When \(G\) is a complex reductive group and \(X \subset \mathbb{C}^N\) is an affine variety with the standard action of \(G\), a point \(x \in X\) is GIT-semistable if and only if the null-cone in its orbit intersects the level set of a certain moment map. The stable points correspond to orbits with minimal distance to a chosen point.

This theorem reveals that GIT semistability (an algebraic notion) can be characterized by symplectic geometry and moment maps.

## 7.3 Examples of Stability

1. **Points in projective space:** A point \([x_0 : \cdots : x_n] \in \mathbb{CP}^n\) is semistable under the action of \(GL_{n+1}\) if not all homogeneous coordinates vanish. Every point in \(\mathbb{CP}^n\) is stable (generic stabilizer is trivial).

2. **Hypersurfaces:** For hypersurfaces of degree \(d\) in \(\mathbb{CP}^n\), stability is related to the absence of certain singular points (e.g., ordinary double points for low-degree curves). The GIT quotient is the moduli space of stable hypersurfaces.

3. **Vector bundles:** Stability of vector bundles on a curve is defined by Mumford via the slope \(\mu = \deg / \mathrm{rank}\). The moduli space of stable bundles is a geometric invariant theory quotient.

---

# Chapter 8: Group Actions and Quotient Varieties

## 8.1 Orbits and Stabilizers

For an action of \(G\) on a variety \(X\), the **orbit** of \(x \in X\) is

\[\mathcal{O}_x = G \cdot x = \{g \cdot x : g \in G\}.\]

The **stabilizer** (or **isotropy group**) is

\[G_x = \{g \in G : g \cdot x = x\}.\]

By the orbit-stabilizer theorem, \(\dim \mathcal{O}_x = \dim G - \dim G_x\) when \(G\) is an algebraic group and \(\mathcal{O}_x\) is a quasi-projective variety.

Orbits form a partition of \(X\). The quotient space \(X / G\) (as a set) is the space of orbits, but it may not have a good algebraic or topological structure. This motivates the study of invariants and categorical quotients.

## 8.2 Categorical Quotients and Scheme-Theoretic Quotients

The **categorical quotient** \(\pi : X \to X //_{0} G\) satisfies:

1. \(\pi\) is \(G\)-invariant.
2. Every morphism \(f : X \to Y\) that is \(G\)-invariant factors uniquely through \(\pi\).

In algebraic geometry, the categorical quotient is \(\mathrm{Spec}(\mathbb{C}[X]^G)\) when \(X\) is affine.

The **geometric quotient** or **orbit quotient** is the set-theoretic quotient with the quotient topology, which rarely has a good algebraic structure.

For a smooth variety with a free and proper action of a reductive group, the quotient \(X / G\) carries a natural scheme structure making it a smooth variety. This is the case for most moduli spaces in practice.

## 8.3 Stratification of the Moduli Space

The GIT quotient typically admits a stratification by locally closed subsets, each of which is an orbit under the action:

\[X //_{0} G = \bigsqcup_{\text{orbits}} \mathrm{closure}(\mathcal{O}) / G.\]

The structure of this stratification encodes how instability "breaks" the symmetry. Points with non-trivial stabilizers correspond to fixed points under subgroups, leading to lower-dimensional strata.

---

# Chapter 9: Moduli Spaces and Their Geometry

## 9.1 The Notion of a Moduli Space

A **moduli space** is a parameter space that classifies geometric objects of a given type. Formally, a moduli space \(\mathcal{M}\) is a variety (or scheme) whose points correspond to isomorphism classes of objects under study, and whose geometry reflects the geometry of the objects.

**Fine moduli spaces** have the property that they represent a moduli functor: there exists a universal family over \(\mathcal{M}\) such that every other family is a pull-back of the universal one. Most moduli spaces are only coarse moduli spaces, representing the functor only set-theoretically without a universal family.

## 9.2 Moduli of Projective Curves

The **moduli space \(\mathcal{M}_g\)** of smooth projective curves of genus \(g\) is one of the most studied objects in algebraic geometry. It has the following properties:

- **Dimension:** \(\dim \mathcal{M}_g = 3g - 3\) for \(g \geq 2\). For \(g = 0\), every smooth genus-0 curve is isomorphic to \(\mathbb{CP}^1\), so the moduli space is a point. For \(g = 1\), the moduli space is the modular curve \(\mathcal{M}_1 \cong \mathbb{A}^1\) (parametrized by the j-invariant).

- **Construction via GIT:** The moduli space can be constructed via geometric invariant theory as a quotient of the space of pairs \((C, H)\) where \(C \subset \mathbb{CP}^N\) is a smooth degree-\(d\) curve (for a sufficiently large \(d\)) and \(H\) is a hyperplane section, modulo the action of \(\mathrm{PGL}_{N+1}\). Stability is determined by the absence of certain singularities.

- **Compactification:** The Deligne-Mumford compactification \(\overline{\mathcal{M}_g}\) is obtained by allowing nodal curves (curves with ordinary double points). This is a projective variety, essential for many applications.

- **Picard group:** The Picard group of \(\mathcal{M}_g\) (the group of divisors modulo linear equivalence) is generated by a few natural divisors: the Hodge bundle, boundary divisors, etc. Understanding this Picard group is important for enumerative geometry.

## 9.3 Moduli of Vector Bundles on Curves

Let \(C\) be a smooth projective curve of genus \(g\). The **moduli space** \(\mathcal{M}_C(r, d)\) of rank-\(r\) vector bundles of degree \(d\) on \(C\) (up to isomorphism) can be constructed as a quasi-projective variety.

**Properties:**

- **Dimension:** For stable bundles, \(\dim \mathcal{M}_C(r, d) = r^2(g-1) + 1\).

- **Stability:** A bundle \(E\) is **stable** if for every proper subbundle \(F \subset E\),

\[\frac{\deg F}{\mathrm{rank} F} < \frac{\deg E}{\mathrm{rank} E}.\]

Stability is an open condition in families, ensuring that the moduli space of stable bundles is separated.

- **Construction:** The moduli space is constructed via GIT as a quotient of the space of representations of a certain quiver or as a quotient of the space of linear data satisfying stability conditions.

- **Symplectic structure:** The moduli space \(\mathcal{M}_C(r, d)\) carries a natural symplectic structure (when stable). This symplectic form is induced from the symplectic structure on the space of connections, which is a fundamental fact in gauge theory.

## 9.4 Moduli of Sheaves and Bridgeland Stability

More generally, one can consider **moduli of coherent sheaves** on a variety \(X\). The notion of stability can be generalized using **Bridgeland stability conditions**, which define when a sheaf is stable with respect to a given slicing of the derived category.

The **derived category** \(D^b(\text{Coh}(X))\) of coherent sheaves is a fundamental invariant in modern algebraic geometry. Stability conditions on derived categories allow one to define moduli spaces of semistable objects, leading to powerful techniques in enumerative geometry (Donaldson-Thomas invariants, etc.).

---

# Chapter 10: Examples and Constructions

## 10.1 Moduli of Hypersurfaces

Let \(F_d \subset \mathbb{CP}^n\) be the space of degree-\(d\) homogeneous polynomials in \(n+1\) variables, viewed as a projective space \(\mathbb{P}(H^0(\mathcal{O}_{\mathbb{CP}^n}(d)))\). The group \(\mathrm{PGL}_{n+1}\) acts on \(F_d\) by change of coordinates.

The **moduli space of smooth hypersurfaces** is the GIT quotient:

\[\mathcal{M}_{n,d} = F_d^{\mathrm{smooth}} //^{\mathcal{O}(1)} \mathrm{PGL}_{n+1},\]

where the superscript indicates we take the GIT quotient with respect to a natural line bundle linearization, and the subscript denotes the open subset of smooth hypersurfaces.

**Example:** For plane curves (n=2), the moduli space \(\mathcal{M}_{2,d}\) has dimension \(\binom{d+2}{2} - 3 - 1 = \frac{d(d+3)}{2} - 4\) (the projective space dimension minus the dimension of \(\mathrm{PGL}_3\)).

## 10.2 Toric Varieties and Polytopes

A **toric variety** is determined (up to isomorphism) by a combinatorial object called a **fan** in a lattice \(\mathbb{Z}^n\), or equivalently, by a **polytope** in the dual lattice.

For a smooth projective toric variety \(X_\Delta\) associated to a polytope \(\Delta\), the following hold:

- **Orbits:** The torus \(T = (\mathbb{C}^*)^n\) acts on \(X_\Delta\) with orbits corresponding to faces of \(\Delta\). Fixed points correspond to vertices.

- **Divisors:** \(T\)-invariant divisors correspond to facets of \(\Delta\).

- **Symplectic geometry:** If \(\Delta\) is rational, then \(X_\Delta\) can be equipped with a \(T\)-invariant Kähler structure, and the moment map has image equal to \(\Delta\).

**Classical example:** The moduli space of unordered pairs of points on \(\mathbb{CP}^1\) can be realized as a toric variety. The moment polytope is a triangle in \(\mathbb{R}^2\), and its vertices correspond to the three special pairs (two fixed points of a rotation, or the pair at infinity).

## 10.3 Flag Varieties and Orbits

The **flag variety** (or **complete flag variety**) is

\[Fl(n) = \{0 = V_0 \subset V_1 \subset \cdots \subset V_n = \mathbb{C}^n : \dim V_i = i\}.\]

The group \(GL_n\) acts transitively on \(Fl(n)\), and the quotient \(GL_n / B\) is the flag variety, where \(B\) is the Borel subgroup of upper-triangular matrices.

**Properties:**

- **Dimension:** \(\dim Fl(n) = \binom{n}{2} = \frac{n(n-1)}{2}\).

- **Cells:** The flag variety admits a cell decomposition (the Schubert cell decomposition) indexed by permutations in \(S_n\). Each Schubert cell is isomorphic to an affine space.

- **Symplectic geometry:** Flag varieties are Kähler homogeneous spaces and admit natural symplectic structures. The moment map for the action of a maximal torus is given by evaluating weights.

- **Schubert varieties:** The closures of Schubert cells (the **Schubert varieties**) are irreducible subvarieties stratified by Schubert cells of smaller dimension. Their intersection theory (the Schubert calculus) is central to enumerative geometry.

---

# Chapter 11: Quantization and the Fukaya Category

## 11.1 Geometric Quantization

Geometric quantization is a procedure for associating a Hilbert space (quantum mechanical states) to a classical phase space (a symplectic manifold).

The classical setup: let \((M, \omega)\) be a symplectic manifold (the classical phase space) and \(H : M \to \mathbb{R}\) be a Hamiltonian. The quantum setup should give:

- A Hilbert space \(\mathcal{H}\) (quantum states).
- A self-adjoint operator \(\hat{H}\) on \(\mathcal{H}\) (Hamiltonian operator).
- A representation of observables (functions on \(M\)) as operators on \(\mathcal{H}\).

**Prequantum bundle:** The first step is to construct a Hermitian line bundle \(L \to M\) with a unitary connection \(\nabla\) such that the curvature form is \(F_\nabla = -i\hbar \omega\). Such a bundle is called a **prequantum bundle**, and its existence requires that \([\omega] \in H^2(M; \mathbb{Z})\) (the symplectic form is an integral cohomology class, scaled appropriately by \(\hbar\)).

**Polarization:** A **polarization** of \((M, \omega)\) is a foliation of \(M\) by Lagrangian submanifolds (half-dimensional isotropic submanifolds). An example is a complex structure, which gives a polarization by complex lines.

The quantum space is defined as the space of covariantly constant sections of \(L\) with respect to the connection, restricted to a choice of half-form (to resolve sign ambiguities) and satisfying certain integrability conditions with respect to the polarization.

**Example:** For \(T^* \mathbb{R}^n\) with the standard symplectic form, using the position polarization (foliating by constant-momentum leaves), the geometric quantization gives \(L^2(\mathbb{R}^n)\), the space of square-integrable functions, which is the correct quantum phase space.

## 11.2 The Fukaya Category

The **Fukaya category** is a symplectic analogue of the derived category of coherent sheaves. It is built from Lagrangian submanifolds and their intersections, encoded via Floer cohomology.

**Floer cohomology:** For a symplectic manifold \((M, \omega)\) and two Lagrangian submanifolds \(L_0, L_1\), the **Floer cohomology** \(HF^*(L_0, L_1)\) is defined as follows:

- Consider the space of paths \(\gamma : [0,1] \to M\) with \(\gamma(0) \in L_0\) and \(\gamma(1) \in L_1\).

- The **action functional** is \(\mathcal{A}(\gamma) = \int_0^1 \gamma^* \alpha + \int_D H \, \mathrm{vol}_{D}\), where \(\alpha\) is a primitive of \(\omega\) (the symplectic form) and \(H : M \to \mathbb{R}\) is an auxiliary Hamiltonian.

- Critical points of \(\mathcal{A}\) correspond to intersections of \(L_0\) and \(L_1\).

- Floer cohomology is defined via a boundary operator on the space of intersection points, analogous to singular cohomology. The boundary operator counts pseudo-holomorphic disks in \(M\).

**Fukaya category:** Objects are Lagrangian submanifolds (or more precisely, graded, spin Lagrangians with gradings and orientations). Morphisms between objects \(L_0\) and \(L_1\) are the Floer cohomology \(HF^*(L_0, L_1)\). Composition of morphisms is defined using holomorphic triangles.

The Fukaya category is a triangulated category, and its derived category \(\mathcal{D}^\pi(M)\) is sometimes called the symplectic category of \(M\).

## 11.3 Homological Mirror Symmetry

One of the deepest conjectures in modern geometry is **Homological Mirror Symmetry** (HMS), proposed by Kontsevich:

**Conjecture (HMS):** For a smooth projective variety \(X\) and its mirror \(X^\vee\), the Fukaya category of \(X^\vee\) is derived equivalent to the bounded derived category of coherent sheaves on \(X\):

\[\mathcal{D}^\pi(X^\vee) \simeq D^b(\text{Coh}(X)).\]

This conjectural equivalence connects symplectic geometry (the Fukaya category) with algebraic geometry (coherent sheaves), unifying two fundamental areas of mathematics.

**Examples where HMS is known:**

- For complex tori: the Fukaya category of a torus is equivalent to the derived category of coherent sheaves on the dual torus (both are equivalent to the derived category of representations of a fundamental group).

- For Fano surfaces with small Picard rank, various cases have been verified using techniques from homological algebra and mirror symmetry.

---

# Chapter 12: Connections and Further Topics

## 12.1 Symplectic Connections and Covariant Derivatives

A **symplectic connection** on \((M, \omega)\) is a torsion-free affine connection \(\nabla\) that is compatible with the symplectic form in the sense that

\[\nabla \omega = 0.\]

This is different from the Levi-Civita connection of Riemannian geometry. In general, a symplectic connection need not be unique.

**Holonomy:** The holonomy group of \(\nabla\) is a subgroup of the symplectic group \(\mathrm{Sp}(2n, \mathbb{R})\). Restricted holonomy groups (e.g., \(\mathrm{Sp}(2n, \mathbb{R}) \cap SO(2n) = U(n)\) for Kähler manifolds) encode geometric information.

## 12.2 Lagrangian Fibrations and Integrable Systems

A **Lagrangian fibration** is a fibration \(\pi : M \to B\) where \(M\) is symplectic, \(B\) is a manifold, and the fibers are Lagrangian submanifolds.

For a completely integrable system with \(n\) independent first integrals \(f_1, \ldots, f_n\) in involution, the level sets form Lagrangian submanifolds. Under mild topological conditions (Liouville-Arnold theorem), the fibers are tori, and the base is an open subset of \(\mathbb{R}^n\).

**Example:** The phase space of a pendulum with energy \(E\) fibers over the space of momenta, with each fiber being either a circle (for \(E < E_{\text{critical}}\)) or more complicated for \(E \geq E_{\text{critical}}\).

## 12.3 Contact Geometry and Legendrian Submanifolds

**Contact geometry** is the odd-dimensional analog of symplectic geometry. A **contact structure** on a \((2n+1)\)-dimensional manifold \(Y\) is a 1-form \(\alpha\) such that \(\alpha \wedge (d\alpha)^n \neq 0\) everywhere.

A **Legendrian submanifold** of a contact manifold is an \(n\)-dimensional submanifold on which the contact form vanishes.

The **symplectization** of a contact manifold \((Y, \alpha)\) is the manifold \(Y \times \mathbb{R}\) with the symplectic form \(d(e^t \alpha)\), where \(t\) is the coordinate on \(\mathbb{R}\). This reduces questions about contact manifolds to symplectic manifolds by adding a dimension.

## 12.4 Orbifolds and Quotient Singularities

When a group \(G\) acts on a manifold \(M\) with fixed points (not freely), the quotient \(M / G\) is singular. The appropriate framework for handling such quotients is **orbifold geometry**.

An **orbifold** is locally modeled on \(\mathbb{R}^n / \Gamma\) for finite groups \(\Gamma\). Symplectic structures and moment maps extend naturally to orbifolds.

In the context of moduli spaces, orbifolds arise naturally: for instance, the moduli space of elliptic curves is an orbifold (with orbifold singularities at points with extra automorphisms, like the point \(\tau = i\) with automorphism group of order 4).

## 12.5 Higher Symplectic Structures and Multisymplectic Geometry

While symplectic geometry focuses on 2-forms, **multisymplectic geometry** studies manifolds equipped with closed \(k\)-forms for \(k > 2\). A **\(k\)-symplectic manifold** is a manifold equipped with a closed \(k\)-form that is non-degenerate in an appropriate sense.

These structures arise naturally in field theory (where the analogue of a Hamiltonian is a field-dependent functional) and in higher categorification.

## 12.6 Derived Categories and Stability Conditions

The modern approach to moduli problems uses **derived categories** and **Bridgeland stability conditions**. For a variety \(X\), the derived category \(D^b(\text{Coh}(X))\) of bounded complexes of coherent sheaves is a triangulated category whose structure encodes deep information about \(X\).

A **stability condition** on \(D^b(X)\) assigns to each object \(E\) a **slope** (or **phase**) in \((0, 1]\), such that:

- Stability is preserved under extensions.
- Strictly semistable objects decompose canonically.
- Walls in the stability manifold correspond to exceptional collections and birational geometry.

The **space of stability conditions** on \(D^b(X)\) is often a complex manifold whose geometry relates to the structure of \(X\). Periods of differential forms and variations of Hodge structures provide analytic control.

## 12.7 Applications to Physics: Gauge Theory and String Theory

Symplectic and Kähler geometry are fundamental to modern theoretical physics:

1. **Yang-Mills theory:** The space of connections on a principal bundle is symplectic, and the moduli space of flat connections (or anti-self-dual connections) arises as a symplectic reduction. The Yangian symmetry and quantum groups emerge from deformations of this structure.

2. **Quantum field theory:** The quantization of classical field theories proceeds via geometric quantization applied to infinite-dimensional symplectic manifolds (the spaces of fields and their conjugate momenta).

3. **String theory:** The target space of a string is typically a Kähler or Calabi-Yau manifold. Mirror symmetry relates symplectic geometry of one Calabi-Yau to complex geometry of another. The Fukaya category and homological mirror symmetry are central conjectures in this context.

4. **Floer homology and gauge theory:** Seiberg-Witten equations (a system of PDEs on 4-manifolds) can be reinterpreted via symplectic geometry and Floer homology, connecting topology, geometry, and analysis.

---

## Final Remarks

Symplectic geometry and geometric invariant theory are deeply interconnected, despite originating from different mathematical traditions. Symplectic geometry provides a framework for understanding phase spaces, symmetries, and reduction by group actions from a topological and differential-geometric perspective. Geometric invariant theory provides an algebraic approach to constructing quotient varieties and moduli spaces, with stability conditions playing the role of "good" geometric objects.

The synthesis of these approaches—exemplified by concepts like moment maps, symplectic reduction versus GIT quotients, and the use of stability conditions in derived categories—has enabled modern algebraic geometry and mathematical physics to address fundamental problems about classification, deformations, and enumerations of geometric objects.

Both fields continue to evolve, with new structures like Bridgeland stability conditions, infin-categorical refinements, and applications to quantum field theory and string theory pushing the boundaries of what we understand about the geometry of parameter spaces and symmetries.

