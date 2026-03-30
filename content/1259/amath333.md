---
title: "AMATH 333: Calculus on Manifolds for Applied Mathematics and Physics"
prof: "Christopher Pollack"
---

## Sources and References

**Primary textbook**
- T. Frankel, *The Geometry of Physics: An Introduction*, 3rd ed. (Cambridge University Press, 2012)

**Supplementary texts**
- B. Schutz, *Geometrical Methods of Mathematical Physics* (Cambridge University Press, 1980)
- J. M. Lee, *Introduction to Smooth Manifolds*, 2nd ed. (Springer, 2013)
- R. M. Wald, *General Relativity* (University of Chicago Press, 1984)

**Online resources**
- D. Tong, *Lectures on Differential Geometry* (University of Cambridge) — damtp.cam.ac.uk/user/tong/gr.html
- S. M. Carroll, *Lecture Notes on General Relativity* — available on arXiv gr-qc/9712019

---

# Chapter 1: Manifolds and Vector Fields

## Section 1.1: Point-Set Topology — The Language of Continuity

Before defining a manifold we need the minimal topological vocabulary to say what it means for a space to "look locally like \(\mathbb{R}^n\)."

A **topological space** is a set \(X\) together with a collection \(\tau\) of subsets (the **open sets**) satisfying:
1. \(\emptyset, X \in \tau\).
2. Arbitrary unions of open sets are open.
3. Finite intersections of open sets are open.

A function \(f: X \to Y\) between topological spaces is **continuous** if the preimage of every open set in \(Y\) is open in \(X\).

A space is **Hausdorff** if any two distinct points have disjoint open neighbourhoods. This rules out pathological spaces where limits are not unique.

A space is **second countable** if it has a countable basis for its topology — a countable collection \(\{U_i\}\) of open sets such that every open set is a union of sets from this collection.

## Section 1.2: Manifolds

### The Idea of a Manifold

A **smooth \(n\)-manifold** is a space that looks locally like \(\mathbb{R}^n\). The canonical examples are:
- \(\mathbb{R}^n\) itself (the trivial example)
- The circle \(S^1\), the 2-sphere \(S^2\), and \(n\)-spheres \(S^n\)
- The torus \(T^2 = S^1 \times S^1\)
- Lie groups such as \(\mathrm{SO}(3)\) and \(\mathrm{GL}(n,\mathbb{R})\)
- Configuration and phase spaces of physical systems

The key concept is the **coordinate chart**: an open set \(U \subset M\) together with a homeomorphism \(\varphi: U \to \tilde{U} \subset \mathbb{R}^n\). The map \(\varphi\) assigns coordinates to points in \(U\).

### Rigorous Definition

<div class="definition">
<strong>Smooth manifold.</strong> A smooth \(n\)-manifold is a Hausdorff, second-countable topological space \(M\) equipped with a smooth atlas: a collection of charts \(\{(U_\alpha, \varphi_\alpha)\}\) such that
<ol>
<li>The sets \(U_\alpha\) cover \(M\): \(\bigcup_\alpha U_\alpha = M\).</li>
<li>Each \(\varphi_\alpha: U_\alpha \to \mathbb{R}^n\) is a homeomorphism onto an open subset.</li>
<li>Whenever \(U_\alpha \cap U_\beta \neq \emptyset\), the transition map \(\varphi_\beta \circ \varphi_\alpha^{-1}: \varphi_\alpha(U_\alpha \cap U_\beta) \to \varphi_\beta(U_\alpha \cap U_\beta)\) is a smooth (\(C^\infty\)) diffeomorphism.</li>
</ol>
</div>

The smoothness condition on transition maps is what makes calculus possible on the manifold. Different choices of atlas that are mutually compatible define the same smooth structure.

## Section 1.3: Submanifolds of \(\mathbb{R}^N\)

Many manifolds arise as subsets of Euclidean space. The **main theorem on submanifolds** (a consequence of the implicit function theorem) states:

<div class="theorem">
<strong>Submanifold theorem.</strong> Let \(F: \mathbb{R}^N \to \mathbb{R}^k\) be smooth and let \(c \in \mathbb{R}^k\) be a regular value (meaning \(DF(x)\) has rank \(k\) for all \(x \in F^{-1}(c)\)). Then \(M = F^{-1}(c)\) is a smooth \((N-k)\)-dimensional submanifold of \(\mathbb{R}^N\).
</div>

<div class="example">
<strong>The 2-sphere.</strong> Let \(F: \mathbb{R}^3 \to \mathbb{R}\), \(F(x,y,z) = x^2 + y^2 + z^2\). Then \(DF = (2x, 2y, 2z)\), which has rank 1 everywhere except at the origin. So \(S^2 = F^{-1}(1)\) is a smooth 2-manifold.
</div>

## Section 1.4: Tangent Vectors and Mappings

### Tangent Vectors as Geometric Objects

At a point \(p\) on a manifold \(M\), a **tangent vector** should represent an infinitesimal displacement at \(p\). In \(\mathbb{R}^N\) this is simply a vector \(\mathbf{v} \in \mathbb{R}^N\) based at \(p\). On an abstract manifold, the notion of "vector in \(\mathbb{R}^N\)" is not available — we need a coordinate-independent definition.

### Vectors as Differential Operators

The elegant coordinate-free definition identifies tangent vectors with **derivations**: linear operators on smooth functions \(C^\infty(M)\) that satisfy the Leibniz rule.

<div class="definition">
<strong>Tangent vector as derivation.</strong> A tangent vector at \(p \in M\) is an \(\mathbb{R}\)-linear map \(v: C^\infty(M) \to \mathbb{R}\) satisfying the Leibniz rule:
\[
v(fg) = f(p)\,v(g) + g(p)\,v(f).
\]
</div>

In a coordinate chart \((x^1, \ldots, x^n)\) near \(p\), the partial derivatives \(\partial/\partial x^i\big|_p\) form a basis for the tangent space. A general tangent vector is

\[
v = v^i \frac{\partial}{\partial x^i}\bigg|_p
\]

using the Einstein summation convention (implicit sum over repeated up/down index pairs).

The superscripts on \(v^i\) are intentional: components of a tangent vector carry **upper indices** and are called **contravariant**.

### The Tangent Space

<div class="definition">
<strong>Tangent space.</strong> The tangent space \(T_p M\) at \(p \in M\) is the vector space of all tangent vectors (derivations) at \(p\). It is an \(n\)-dimensional real vector space.
</div>

### Coordinate Transformations

If \((x^i)\) and \((\tilde{x}^j)\) are two coordinate charts near \(p\), the chain rule gives the transformation of vector components:

\[
\tilde{v}^j = v^i \frac{\partial \tilde{x}^j}{\partial x^i}.
\]

This transformation law — components transform by multiplication by the Jacobian of the coordinate change — defines what it means to be a **contravariant vector**.

## Section 1.5: Vector Fields and Flows

A **vector field** on \(M\) is a smooth assignment of a tangent vector to each point: \(X: p \mapsto X_p \in T_p M\). In coordinates:

\[
X = X^i(x) \frac{\partial}{\partial x^i}.
\]

A vector field \(X\) generates a **flow** \(\Phi_t: M \to M\) by the ODE:

\[
\frac{d}{dt}\Phi_t(p) = X_{\Phi_t(p)}, \quad \Phi_0(p) = p.
\]

The flow moves points along the integral curves of \(X\). In physics, vector fields represent velocities and their flows represent the time evolution of physical systems.

---

# Chapter 2: Tensors and Exterior Forms

## Section 2.1: Covectors and Riemannian Metrics

### The Dual Space and Covectors

<div class="definition">
<strong>Cotangent vector (covector).</strong> A cotangent vector (or 1-form) at \(p \in M\) is a linear functional \(\alpha: T_p M \to \mathbb{R}\). The cotangent space \(T_p^* M\) is the dual of \(T_p M\).
</div>

In coordinates, covectors have **lower indices**: \(\alpha = \alpha_i\, dx^i\). The basis \(\{dx^i\}\) of \(T_p^*M\) is dual to the basis \(\{\partial/\partial x^i\}\) of \(T_p M\):

\[
dx^i\!\left(\frac{\partial}{\partial x^j}\right) = \delta^i_{\ j}.
\]

The most important example of a covector is the **differential of a function**: if \(f \in C^\infty(M)\), then \(df|_p \in T_p^* M\) is defined by \(df|_p(v) = v(f)\). In coordinates, \(df = (\partial f/\partial x^i)\, dx^i\).

### Riemannian Metrics

<div class="definition">
<strong>Riemannian metric.</strong> A Riemannian metric on \(M\) is a smooth, symmetric, positive-definite \((0,2)\) tensor field \(g\): at each \(p\), \(g_p: T_p M \times T_p M \to \mathbb{R}\) is a positive-definite inner product.
</div>

In coordinates: \(g = g_{ij}\, dx^i \otimes dx^j\), with \(g_{ij} = g(\partial_i, \partial_j)\). The metric allows:
- Measuring lengths: \(\|v\|^2 = g(v,v)\).
- Defining angles between vectors.
- **Raising and lowering indices**: \(v_i = g_{ij} v^j\) (lowering), \(\alpha^i = g^{ij} \alpha_j\) (raising), where \(g^{ij}\) is the matrix inverse of \(g_{ij}\).
- Defining the **gradient**: given \(f\), the gradient \(\nabla f\) is the vector field with components \((\nabla f)^i = g^{ij} \partial_j f\).

## Section 2.2: The Tangent and Cotangent Bundles

The **tangent bundle** \(TM = \bigsqcup_{p \in M} T_p M\) is itself a smooth \(2n\)-manifold. A smooth section of \(TM\) is a vector field.

The **cotangent bundle** \(T^*M = \bigsqcup_{p \in M} T_p^* M\) is likewise a \(2n\)-manifold. In mechanics, \(T^*M\) is the **phase space**: if \(M\) is the configuration space (with generalized coordinates \(q^i\)), then the cotangent bundle has coordinates \((q^i, p_i)\) where \(p_i\) are the generalized momenta.

### The Poincaré Form

On \(T^*M\) there is a canonical 1-form \(\theta\) defined intrinsically:

\[
\theta_{(q,p)} = p_i\, dq^i.
\]

The **symplectic form** is \(\omega = -d\theta = dq^i \wedge dp_i\), making \(T^*M\) a symplectic manifold. This is the geometric foundation of Hamiltonian mechanics.

## Section 2.3: Tensors

### Covariant and Contravariant Tensors

A **\((r,s)\)-tensor** at \(p\) is a multilinear map

\[
T: \underbrace{T_p^*M \times \cdots \times T_p^*M}_{r} \times \underbrace{T_p M \times \cdots \times T_p M}_{s} \to \mathbb{R}.
\]

- A \((0,s)\) tensor is **covariant** of rank \(s\) (indices downstairs).
- A \((r,0)\) tensor is **contravariant** of rank \(r\) (indices upstairs).
- A \((r,s)\) tensor is **mixed**.

Under a coordinate change with Jacobian \(J^i_{\ j} = \partial \tilde{x}^i / \partial x^j\):

- Contravariant components transform as \(\tilde{T}^{i} = J^i_{\ j} T^j\) (multiply by \(J\)).
- Covariant components transform as \(\tilde{T}_i = (J^{-1})^j_{\ i} T_j\) (multiply by \(J^{-1}\)).

This is the origin of the terminology: "contra-variant" means against the direction of coordinate transformation; "co-variant" means with it.

## Section 2.4: The Exterior Algebra

### Differential \(p\)-Forms

A **differential \(p\)-form** is a totally antisymmetric covariant \((0,p)\) tensor field. In coordinates:

\[
\omega = \omega_{i_1 i_2 \cdots i_p}\, dx^{i_1} \wedge dx^{i_2} \wedge \cdots \wedge dx^{i_p},
\]

where the components are antisymmetric: \(\omega_{i_1 \cdots i_p} = 0\) whenever any two indices coincide, and flips sign on transposition.

The space of \(p\)-forms on an \(n\)-manifold is \(\binom{n}{p}\)-dimensional.

### The Exterior (Wedge) Product

The **wedge product** \(\alpha \wedge \beta\) of a \(p\)-form \(\alpha\) and a \(q\)-form \(\beta\) is a \((p+q)\)-form defined by antisymmetrized tensor product:

\[
(\alpha \wedge \beta)(v_1, \ldots, v_{p+q}) = \frac{1}{p!\, q!} \sum_{\sigma \in S_{p+q}} \mathrm{sgn}(\sigma)\, \alpha(v_{\sigma(1)}, \ldots, v_{\sigma(p)})\, \beta(v_{\sigma(p+1)}, \ldots, v_{\sigma(p+q)}).
\]

Key properties:
- \(\alpha \wedge \beta = (-1)^{pq} \beta \wedge \alpha\) (graded commutativity).
- \(dx^i \wedge dx^j = -dx^j \wedge dx^i\), so \(dx^i \wedge dx^i = 0\).

### Geometric Meaning in \(\mathbb{R}^3\)

In \(\mathbb{R}^3\) with coordinates \((x,y,z)\):
- **0-forms**: smooth functions \(f\).
- **1-forms**: \(f\,dx + g\,dy + h\,dz\) (like vector fields, via the metric correspondence).
- **2-forms**: \(f\,dy\wedge dz + g\,dz\wedge dx + h\,dx\wedge dy\) (encode flux through surfaces).
- **3-forms**: \(f\,dx\wedge dy\wedge dz\) (encode volume densities).

The classical vector operations (gradient, curl, divergence) are all instances of the exterior derivative.

### Relation to Vector Analysis

The dictionary between exterior calculus and vector calculus in \(\mathbb{R}^3\):

| Vector calculus | Exterior calculus |
|---|---|
| \(\nabla f\) | \(df\) (0-form → 1-form) |
| \(\nabla \times \mathbf{F}\) | \(d(\mathbf{F}^\flat)\) (1-form → 2-form) |
| \(\nabla \cdot \mathbf{F}\) | \(\star d(\star \mathbf{F}^\flat)\) or \(d(\mathbf{F}^\flat \wedge \cdot)\) |
| \(\nabla^2 f = 0\) (Laplace) | \(d \star df = 0\) |

Here \(\star\) is the Hodge star, which converts \(p\)-forms to \((n-p)\)-forms using the metric and orientation.

## Section 2.5: Exterior Differentiation

<div class="definition">
<strong>Exterior derivative.</strong> The exterior derivative \(d\) is the unique map from \(p\)-forms to \((p+1)\)-forms satisfying:
<ol>
<li>On 0-forms (functions), \(df\) is the ordinary differential.</li>
<li>\(d(\alpha \wedge \beta) = d\alpha \wedge \beta + (-1)^p \alpha \wedge d\beta\) (graded Leibniz rule).</li>
<li>\(d^2 = 0\) (nilpotency).</li>
</ol>
</div>

In coordinates:

\[
d\left(\omega_{i_1 \cdots i_p}\, dx^{i_1} \wedge \cdots \wedge dx^{i_p}\right) = \frac{\partial \omega_{i_1 \cdots i_p}}{\partial x^j}\, dx^j \wedge dx^{i_1} \wedge \cdots \wedge dx^{i_p}.
\]

The condition \(d^2 = 0\) encodes the symmetry of mixed partials: \(\partial_j \partial_k = \partial_k \partial_j\), combined with the antisymmetry \(dx^j \wedge dx^k = -dx^k \wedge dx^j\).

<div class="definition">
<strong>Closed and exact forms.</strong> A form \(\omega\) is <strong>closed</strong> if \(d\omega = 0\). It is <strong>exact</strong> if \(\omega = d\alpha\) for some form \(\alpha\). Since \(d^2 = 0\), every exact form is closed. The Poincaré lemma says the converse holds locally.
</div>

## Section 2.6: Interior Products and Pull-Backs

The **interior product** (or contraction) \(\iota_X \omega\) of a vector field \(X\) with a \(p\)-form \(\omega\) is the \((p-1)\)-form:

\[
(\iota_X \omega)(v_1, \ldots, v_{p-1}) = \omega(X, v_1, \ldots, v_{p-1}).
\]

The **pull-back** of a form: if \(f: M \to N\) is a smooth map, the pull-back \(f^*\omega\) of a \(p\)-form \(\omega\) on \(N\) is the \(p\)-form on \(M\) defined by

\[
(f^*\omega)_p(v_1, \ldots, v_p) = \omega_{f(p)}(Df_p\, v_1, \ldots, Df_p\, v_p).
\]

Pull-backs commute with exterior differentiation: \(f^* \circ d = d \circ f^*\).

---

# Chapter 3: Integration of Differential Forms

## Section 3.1: Orientation

For integration of \(n\)-forms over an \(n\)-manifold to be well-defined, we need an **orientation**: a consistent choice of which coordinate charts have positive Jacobian relative to each other.

A manifold is **orientable** if it admits an atlas where all transition maps have positive Jacobian. The sphere \(S^n\) is orientable; the Möbius band is not.

A **volume form** on an oriented \(n\)-manifold is a nowhere-vanishing \(n\)-form \(\Omega\). On a Riemannian manifold with metric \(g\), the canonical volume form in coordinates is

\[
\Omega = \sqrt{\det(g_{ij})}\, dx^1 \wedge \cdots \wedge dx^n.
\]

## Section 3.2: Integration over Parameterized Subsets

If \(\varphi: D \subset \mathbb{R}^p \to M\) is a smooth embedding and \(\omega\) is a \(p\)-form on \(M\), the integral of \(\omega\) over \(\varphi(D)\) is:

\[
\int_{\varphi(D)} \omega = \int_D \varphi^* \omega.
\]

This is independent of the parameterization (up to sign), confirming that the integral is a geometric quantity attached to the submanifold.

**Line integrals**: \(\int_\gamma \omega = \int_a^b \omega_{\gamma(t)}(\dot\gamma(t))\, dt\) for a 1-form along a curve.

**Surface integrals**: \(\int_\Sigma \omega\) for a 2-form over an oriented surface.

## Section 3.3: Stokes' Theorem

<div class="theorem">
<strong>Generalized Stokes' Theorem.</strong> Let \(M\) be a compact oriented \(n\)-manifold with boundary \(\partial M\), and let \(\omega\) be a smooth \((n-1)\)-form on \(M\). Then
\[
\int_M d\omega = \int_{\partial M} \omega.
\]
</div>

This single statement unifies the fundamental theorems of vector calculus:

| Classical theorem | Stokes' form |
|---|---|
| Fundamental Theorem of Calculus | \(\int_{[a,b]} df = f(b) - f(a)\) |
| Green's Theorem in the plane | \(\iint_D d\omega = \oint_{\partial D} \omega\) |
| Stokes' Theorem (classic) | \(\iint_S (d\mathbf{A}) = \oint_{\partial S} \mathbf{A}\) |
| Divergence Theorem (Gauss) | \(\iiint_V d\omega = \oiint_{\partial V} \omega\) |

## Section 3.4: Maxwell's Equations in the Language of Forms

On Minkowski spacetime \(\mathbb{R}^{1,3}\) with coordinates \((t, x, y, z)\), define the **electromagnetic 2-form**:

\[
F = E_x\, dx \wedge dt + E_y\, dy \wedge dt + E_z\, dz \wedge dt + B_x\, dy \wedge dz + B_y\, dz \wedge dx + B_z\, dx \wedge dy.
\]

Maxwell's equations in vacuum become simply:

\[
dF = 0, \qquad d{\star}F = \star J,
\]

where \(J\) is the current 1-form and \(\star\) is the Hodge dual. The first equation \(dF = 0\) encodes Faraday's law and the absence of magnetic monopoles; the second encodes Ampère's and Gauss's laws. The form language reveals that Maxwell's equations are fundamentally topological in character.

---

# Chapter 4: The Lie Derivative

## Section 4.1: The Lie Bracket

Given two vector fields \(X\) and \(Y\) on \(M\), their **Lie bracket** \([X, Y]\) is defined as the commutator of derivations:

\[
[X, Y](f) = X(Y(f)) - Y(X(f)).
\]

In coordinates \([X,Y]^k = X^i \partial_i Y^k - Y^i \partial_i X^k\).

<div class="remark">
<strong>Geometric meaning.</strong> Flow along \(X\) then along \(Y\) and flow along \(Y\) then along \(X\) differ, to second order, by a flow along \([X,Y]\). If \([X,Y] = 0\), the flows commute and the coordinate grids generated by \(X\) and \(Y\) mesh smoothly.
</div>

## Section 4.2: The Lie Derivative

The **Lie derivative** \(\mathcal{L}_X T\) of a tensor field \(T\) along a vector field \(X\) measures the rate of change of \(T\) as it is dragged along the flow of \(X\):

\[
(\mathcal{L}_X T)_p = \lim_{t \to 0} \frac{(\Phi_{-t})_* T_{\Phi_t(p)} - T_p}{t}.
\]

Key formulas:
- On functions: \(\mathcal{L}_X f = X(f)\).
- On vector fields: \(\mathcal{L}_X Y = [X, Y]\).
- On 1-forms: \(\mathcal{L}_X \alpha = \iota_X d\alpha + d(\iota_X \alpha)\) (**Cartan's magic formula**).
- Cartan's formula holds for all forms: \(\mathcal{L}_X = \iota_X \circ d + d \circ \iota_X\).

A tensor field \(T\) is **invariant** under the flow of \(X\) if and only if \(\mathcal{L}_X T = 0\).

## Section 4.3: Differentiation of Integrals

If \(\Sigma_t = \Phi_t(\Sigma_0)\) is a family of submanifolds evolving under the flow of \(X\), and \(\omega\) is a \(p\)-form, then

\[
\frac{d}{dt}\bigg|_{t=0} \int_{\Sigma_t} \omega = \int_{\Sigma_0} \mathcal{L}_X \omega.
\]

This formula underlies Reynolds transport theorem and the computation of material derivatives in fluid mechanics.

## Section 4.4: Hamiltonian Mechanics

### Phase Space and the Symplectic Form

Let \(M\) be a configuration manifold with generalized coordinates \(q^i\). The phase space is the cotangent bundle \(T^*M\) with coordinates \((q^i, p_i)\). The canonical symplectic form is

\[
\omega = dq^i \wedge dp_i.
\]

Given a Hamiltonian \(H(q,p)\), Hamilton's equations are determined by

\[
\iota_{X_H} \omega = -dH,
\]

which yields the familiar equations \(\dot{q}^i = \partial H/\partial p_i\) and \(\dot{p}_i = -\partial H/\partial q^i$.

### Poisson Brackets

The **Poisson bracket** of two functions \(f, g\) on phase space is

\[
\{f, g\} = \frac{\partial f}{\partial q^i}\frac{\partial g}{\partial p_i} - \frac{\partial f}{\partial p_i}\frac{\partial g}{\partial q^i} = \omega(X_f, X_g).
\]

Hamilton's equations can be written \(\dot f = \{f, H\}\). A function \(f\) is a **conserved quantity** (constant of motion) iff \(\{f, H\} = 0\).

### Noether's Theorem

<div class="theorem">
<strong>Noether's Theorem (Hamiltonian form).</strong> If a Hamiltonian system has a one-parameter symmetry group generated by a vector field \(X\) on phase space, then the momentum map \(\mu = \iota_X \theta\) (where \(\theta = p_i\, dq^i\) is the Poincaré form) is a conserved quantity: \(\{\mu, H\} = 0\).
</div>

| Symmetry | Conserved quantity |
|---|---|
| Time translation | Energy \(H\) |
| Spatial translation | Linear momentum |
| Rotation | Angular momentum |
| Phase rotation (quantum) | Particle number / charge |

---

# Chapter 5: Lie Groups and Lie Algebras

## Section 5.1: Lie Groups

<div class="definition">
<strong>Lie group.</strong> A Lie group is a smooth manifold \(G\) that is also a group, such that the group operations (multiplication \(G \times G \to G\) and inversion \(G \to G\)) are smooth maps.
</div>

Important examples:
- \(\mathbb{R}^n\) (under addition)
- \(\mathrm{GL}(n,\mathbb{R})\) — invertible \(n \times n\) matrices
- \(\mathrm{SL}(n,\mathbb{R})\) — matrices with determinant 1
- \(\mathrm{O}(n)\), \(\mathrm{SO}(n)\) — orthogonal matrices, proper rotations
- \(\mathrm{U}(n)\), \(\mathrm{SU}(n)\) — unitary matrices

## Section 5.2: Lie Algebras

The **Lie algebra** \(\mathfrak{g}\) of a Lie group \(G\) is the tangent space at the identity \(T_e G\), equipped with the **Lie bracket** inherited from the commutator of left-invariant vector fields.

For matrix groups, the Lie bracket is the matrix commutator: \([A, B] = AB - BA\).

The exponential map \(\exp: \mathfrak{g} \to G\) connects the Lie algebra to the group; for matrix groups this is the matrix exponential.

## Section 5.3: \(\mathrm{SO}(3)\) — Rotations in Three Dimensions

\(\mathrm{SO}(3)\) is the group of proper rotations in \(\mathbb{R}^3\): \(3\times3\) orthogonal matrices with determinant \(+1\). It is a 3-dimensional Lie group.

The Lie algebra \(\mathfrak{so}(3)\) consists of antisymmetric \(3\times3\) matrices and has basis:

\[
J_1 = \begin{pmatrix} 0&0&0\\ 0&0&-1\\ 0&1&0 \end{pmatrix},\quad
J_2 = \begin{pmatrix} 0&0&1\\ 0&0&0\\ -1&0&0 \end{pmatrix},\quad
J_3 = \begin{pmatrix} 0&-1&0\\ 1&0&0\\ 0&0&0 \end{pmatrix}.
\]

The brackets are \([J_i, J_j] = \varepsilon_{ijk} J_k\). This is the same algebra as \(\mathbb{R}^3\) with the cross product, reflecting that the cross product is the infinitesimal rotation. In quantum mechanics, \(\mathrm{SO}(3)\) is the symmetry group of a particle with orbital angular momentum.

---

# Chapter 6: Special and General Relativity

## Section 6.1: Minkowski Spacetime

Special relativity requires replacing the Euclidean geometry of space with the **Lorentzian geometry** of spacetime. Minkowski spacetime \(\mathbb{R}^{1,3}\) has coordinates \((t, x, y, z)\) and the **Minkowski metric**:

\[
g = -c^2 dt^2 + dx^2 + dy^2 + dz^2, \qquad \text{or in units } c=1: \quad \eta_{\mu\nu} = \mathrm{diag}(-1,+1,+1,+1).
\]

The metric is **indefinite** (signature \((-,+,+,+)\)), not positive definite. For a 4-vector \(v^\mu\):
- \(\eta_{\mu\nu} v^\mu v^\nu < 0\): **timelike** (inside the lightcone — massive particles travel along timelike paths)
- \(\eta_{\mu\nu} v^\mu v^\nu = 0\): **null/lightlike** (on the lightcone — photons)
- \(\eta_{\mu\nu} v^\mu v^\nu > 0\): **spacelike** (outside the lightcone — no causal influence)

## Section 6.2: Lorentz Transformations

A **Lorentz transformation** is a linear map \(\Lambda: \mathbb{R}^{1,3} \to \mathbb{R}^{1,3}\) preserving the Minkowski metric: \(\Lambda^T \eta \Lambda = \eta\).

The Lorentz group \(\mathrm{O}(1,3)\) is the group of all such transformations. Proper, orthochronous Lorentz transformations (which preserve orientation and the direction of time) form \(\mathrm{SO}^+(1,3) \cong \mathrm{SL}(2,\mathbb{C})/\mathbb{Z}_2\).

A **boost** in the \(x\)-direction with velocity \(v\):

\[
\begin{pmatrix} ct' \\ x' \end{pmatrix} = \gamma \begin{pmatrix} 1 & -\beta \\ -\beta & 1 \end{pmatrix} \begin{pmatrix} ct \\ x \end{pmatrix}, \qquad \gamma = \frac{1}{\sqrt{1 - v^2/c^2}},\quad \beta = v/c.
\]

Consequences: **time dilation** (\(\Delta t' = \gamma \Delta t\)) and **length contraction** (\(\Delta x' = \Delta x / \gamma\)).

### 4-Vectors and Einstein's Relation

The 4-momentum of a particle with rest mass \(m\) and 3-velocity \(\mathbf{v}\) is

\[
p^\mu = (E/c,\, \mathbf{p}) = m\gamma(c,\, \mathbf{v}).
\]

The invariant mass-energy relation:

\[
\eta_{\mu\nu} p^\mu p^\nu = -m^2 c^2 \implies E^2 = (pc)^2 + (mc^2)^2 \implies E = mc^2 \text{ (for } p=0).
\]

## Section 6.3: General Relativity

General relativity replaces the flat Minkowski metric with a dynamical pseudo-Riemannian metric \(g_{\mu\nu}\) that encodes the gravitational field.

### Covariant Derivative and Connection

On a manifold with a metric \(g\), we can define a unique torsion-free connection (the **Levi-Civita connection**) by requiring that the covariant derivative is compatible with the metric (\(\nabla g = 0\)).

The **Christoffel symbols** (connection coefficients):

\[
\Gamma^\lambda_{\ \mu\nu} = \frac{1}{2} g^{\lambda\sigma}\left(\partial_\mu g_{\nu\sigma} + \partial_\nu g_{\mu\sigma} - \partial_\sigma g_{\mu\nu}\right).
\]

The covariant derivative of a vector field: \(\nabla_\mu V^\nu = \partial_\mu V^\nu + \Gamma^\nu_{\ \mu\lambda} V^\lambda\).

### Geodesics

In the absence of forces other than gravity, particles follow **geodesics** — curves that are "as straight as possible":

\[
\frac{d^2 x^\mu}{d\tau^2} + \Gamma^\mu_{\ \nu\lambda} \frac{dx^\nu}{d\tau} \frac{dx^\lambda}{d\tau} = 0,
\]

where \(\tau\) is proper time. This is the geometric statement that the particle's 4-velocity is parallel transported along its path.

### Curvature and the Riemann Tensor

The **Riemann curvature tensor** measures the failure of covariant derivatives to commute:

\[
[\nabla_\mu, \nabla_\nu] V^\lambda = R^\lambda_{\ \sigma\mu\nu} V^\sigma.
\]

In components:

\[
R^\lambda_{\ \sigma\mu\nu} = \partial_\mu \Gamma^\lambda_{\ \nu\sigma} - \partial_\nu \Gamma^\lambda_{\ \mu\sigma} + \Gamma^\lambda_{\ \mu\rho}\Gamma^\rho_{\ \nu\sigma} - \Gamma^\lambda_{\ \nu\rho}\Gamma^\rho_{\ \mu\sigma}.
\]

The **Ricci tensor** \(R_{\mu\nu} = R^\lambda_{\ \mu\lambda\nu}\) and **Ricci scalar** \(R = g^{\mu\nu} R_{\mu\nu}\) are contractions used in Einstein's field equations.

### Einstein's Field Equations

<div class="theorem">
<strong>Einstein's Field Equations.</strong>
\[
G_{\mu\nu} \equiv R_{\mu\nu} - \frac{1}{2} R\, g_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu},
\]
where \(G_{\mu\nu}\) is the Einstein tensor, \(T_{\mu\nu}\) is the stress-energy tensor encoding the distribution of matter and energy, and \(G\) is Newton's gravitational constant.
</div>

The left side is purely geometric (curvature); the right side is physical (matter content). **Spacetime curvature equals energy-momentum content.**

### Parallel Transport and Holonomy

**Parallel transport** moves a vector along a curve while keeping it "as constant as possible" relative to the connection. The covariant derivative along a curve measures deviation from parallel transport.

On a curved manifold, parallel transporting a vector around a closed loop returns it to a rotated state. The rotation angle is determined by the integrated curvature enclosed — this is the geometric content of the Aharonov-Bohm effect and Berry phase in quantum mechanics.

### Black Holes and Singularities

The simplest exact solution to Einstein's equations in vacuum (\(T_{\mu\nu} = 0\)) with spherical symmetry is the **Schwarzschild metric**:

\[
ds^2 = -\left(1 - \frac{2GM}{c^2 r}\right)c^2 dt^2 + \left(1 - \frac{2GM}{c^2 r}\right)^{-1} dr^2 + r^2 d\Omega^2.
\]

The surface \(r = r_s = 2GM/c^2\) (the **Schwarzschild radius**) is the **event horizon** of a black hole: no signal from within can escape to infinity. This is not a singularity of the metric itself but a coordinate singularity; the true curvature singularity is at \(r = 0\), where \(R_{\mu\nu\lambda\sigma}R^{\mu\nu\lambda\sigma} \to \infty\).
