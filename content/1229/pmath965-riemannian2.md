---
title: "PMATH 965: Riemannian Geometry II"
subjects: PMATH
prof: Spiro Karigiannis
---

## Sources and References

- do Carmo, M. P. *Riemannian Geometry* (Birkhäuser, 1992). ISBN 0-8176-3490-8.
- Gallot, S., Hulin, D. & Lafontaine, J. *Riemannian Geometry*, 3rd ed. (Springer Universitext, 2004). ISBN 3-540-20493-8.
- Jost, J. *Riemannian Geometry and Geometric Analysis*, 7th ed. (Springer, 2017). ISBN 978-3-319-61860-9.
- Lee, J. M. *Introduction to Riemannian Manifolds*, 2nd ed. GTM 176 (Springer, 2018). ISBN 978-3-319-91755-9.
- Sakai, T. *Riemannian Geometry* (AMS, 1996). ISBN 0-8218-0597-9.

---

# Riemannian Geometry II: Curvature, Geodesics, and Global Geometry

**PMATH 965** is the second course in Riemannian geometry, deepening the study of the interplay between curvature and the global geometric structure of Riemannian manifolds. Building on **PMATH 868** (which covers metrics, Levi-Civita connection, Riemann curvature tensor, and basic geodesic theory), this course emphasizes variational methods, comparison theorems, and topological constraints imposed by curvature. The central theme is: **How does pointwise curvature information propagate to control global geometry?** We answer this through Jacobi field theory, variation formulas, and deep results like the Hopf–Rinow theorem, Bonnet–Myers theorem, Rauch comparison, and the Sphere theorem.

---

# Chapter 1: Review of Fundamentals

## 1.1 Riemannian Metrics and the Levi-Civita Connection

A **Riemannian manifold** \((M, g)\) consists of a smooth manifold \(M\) equipped with a Riemannian metric \(g\)—a symmetric, positive-definite \((0,2)\)-tensor field. The metric induces an inner product on each tangent space:

\[ 
g_p(X_p, Y_p) = \langle X_p, Y_p \rangle_p, \quad X_p, Y_p \in T_p M.
\]

The **Levi-Civita connection** \(\nabla\) is the unique torsion-free connection compatible with \(g\):
- Torsion-free: \(\nabla_X Y - \nabla_Y X = [X,Y]\)
- Metric-compatible: \(\nabla g = 0\) (equivalently, \(X \langle Y, Z \rangle = \langle \nabla_X Y, Z \rangle + \langle Y, \nabla_X Z \rangle\))

In local coordinates, the connection is determined by Christoffel symbols \(\Gamma^k_{ij}\), which satisfy:

\[
\Gamma^k_{ij} = \frac{1}{2} g^{k\ell} \left( \frac{\partial g_{j\ell}}{\partial x^i} + \frac{\partial g_{i\ell}}{\partial x^j} - \frac{\partial g_{ij}}{\partial x^\ell} \right).
\]

**Fundamental properties:**
- The connection is metric-preserving, ensuring parallel transport is an isometry.
- Covariant derivatives satisfy the Leibniz rule and linearity.
- In normal coordinates centered at a point \(p\), \(\Gamma^k_{ij}(p) = 0\) and all metrics locally look like the Euclidean metric to first order.

## 1.2 The Riemann Curvature Tensor

The **Riemann curvature tensor** measures the failure of covariant derivatives to commute:

\[
R(X, Y) Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X,Y]} Z.
\]

Component form:

\[
R^{\rho}_{\sigma \mu \nu} = \frac{\partial \Gamma^{\rho}_{\nu \sigma}}{\partial x^\mu} - \frac{\partial \Gamma^{\rho}_{\mu \sigma}}{\partial x^\nu} + \Gamma^{\rho}_{\mu \lambda} \Gamma^{\lambda}_{\nu \sigma} - \Gamma^{\rho}_{\nu \lambda} \Gamma^{\lambda}_{\mu \sigma}.
\]

Lower the index via the metric to obtain \(R_{\rho \sigma \mu \nu} = g_{\rho \lambda} R^{\lambda}_{\sigma \mu \nu}\).

**Symmetries:**
- \(R_{ijkl} = -R_{jikl}\) (antisymmetric in first pair)
- \(R_{ijkl} = -R_{ijlk}\) (antisymmetric in second pair)
- \(R_{ijkl} = R_{klij}\) (swap pairs)
- First Bianchi identity: \(R_{ijkl} + R_{iklj} + R_{iljk} = 0\)
- Second Bianchi identity: \(\nabla_m R_{ijkl} + \nabla_k R_{ijlm} + \nabla_l R_{ijmk} = 0\)

**Key derived tensors:**
- **Ricci tensor:** \(\Ric_{ij} = R^k_{ikj}\) (trace of Riemann)
- **Scalar curvature:** \(\Scal = g^{ij} \Ric_{ij}\)
- **Sectional curvature:** \(K(\sigma) = \frac{R(X,Y,X,Y)}{|X \wedge Y|^2}\) for a 2-plane \(\sigma = \text{span}(X,Y)\)

## 1.3 Geodesics

A curve \(\gamma: I \to M\) is a **geodesic** if its acceleration (covariant derivative of velocity) vanishes:

\[
\nabla_{\dot{\gamma}} \dot{\gamma} = 0.
\]

In local coordinates:

\[
\ddot{\gamma}^k + \Gamma^k_{ij}(\gamma) \dot{\gamma}^i \dot{\gamma}^j = 0.
\]

**Existence and uniqueness:** Given a point \(p \in M\) and a tangent vector \(v \in T_p M\), there exists a unique maximal geodesic \(\gamma(t)\) with \(\gamma(0) = p\) and \(\dot{\gamma}(0) = v\), defined on an interval \((-\epsilon, \epsilon)\) for some \(\epsilon > 0\).

**The exponential map:** For small \(t\), the map \(\exp_p: T_p M \to M\) given by \(\exp_p(v) = \gamma_v(1)\) (where \(\gamma_v\) is the geodesic with initial velocity \(v\)) is a diffeomorphism from a neighborhood of \(0\) in \(T_p M\) onto a neighborhood of \(p\) in \(M\). This provides normal coordinates near \(p\).

---

# Chapter 2: Geodesics and Minimizing Curves

## 2.1 Geodesics as Locally Distance-Minimizing

**Theorem (Local minimality):** Every geodesic locally minimizes distance. Precisely, if \(\gamma: [0, a] \to M\) is a geodesic parameterized by arc length, then for all sufficiently small \(\epsilon > 0\), the restriction of \(\gamma\) to \([0, \epsilon]\) is the unique length-minimizing curve among all curves connecting \(\gamma(0)\) and \(\gamma(\epsilon)\).

*Proof idea:* Use the first variation formula. For any variation \(\gamma_s\) of \(\gamma\) with fixed endpoints, the first-order change in length is

\[
\frac{d}{ds}\bigg|_{s=0} L(\gamma_s) = \int_0^a \langle \nabla_t V, \dot{\gamma} \rangle \, dt
\]
where \(V\) is the variation vector field. Integration by parts yields

\[
= \langle V, \dot{\gamma} \rangle \big|_0^a - \int_0^a \langle V, \nabla_t \dot{\gamma} \rangle \, dt.
\]
Since \(\gamma\) is a geodesic, \(\nabla_t \dot{\gamma} = 0\), and the fixed-endpoint condition makes the boundary term vanish. Thus \(\gamma\) is a critical point. A second variation argument (treated in Chapter 6) confirms it is a local minimum.

## 2.2 Totally Normal Neighborhoods

**Definition:** A neighborhood \(U\) of a point \(p \in M\) is **totally normal** if:
- The exponential map \(\exp_p\) is a diffeomorphism from a neighborhood of \(0\) in \(T_p M\) onto \(U\).
- For any two distinct points \(q, r \in U\), there is a unique geodesic (of arc length \(d(q,r)\)) connecting them, and this geodesic lies entirely in \(U\).

**Construction:** For a sufficiently small inradius \(r_0 > 0\), the ball \(B_p(r_0) = \{ q \in M : d(p,q) < r_0 \}\) is totally normal. Within \(B_p(r_0)\), the exponential map \(\exp_p\) is a diffeomorphism, and for any \(q \in B_p(r_0)\), the unique minimizing geodesic from \(p\) to \(q\) is \(\exp_p(t v)\) where \(v = \exp_p^{-1}(q)\) and \(0 \le t \le 1\).

**Importance:** Totally normal neighborhoods provide a controlled setting for local computations and ensure geodesic uniqueness up to the injectivity radius.

## 2.3 The Injectivity Radius

The **injectivity radius** \(\text{inj}(p)\) at a point \(p\) is the largest radius \(r\) such that \(\exp_p: B_r(0) \to M\) is a diffeomorphism onto its image. Equivalently, it is the infimum of distances from \(p\) to cut points (see Chapter 10).

For a complete Riemannian manifold, \(\text{inj}(M) := \inf_p \text{inj}(p)\) measures how much of the manifold is "diffeomorphic to Euclidean space" via the exponential map.

---

# Chapter 3: Jacobi Fields and Conjugate Points

## 3.1 Jacobi Fields: Second-Order Variations

A **Jacobi field** along a geodesic \(\gamma: [a,b] \to M\) is a vector field \(J(t)\) along \(\gamma\) satisfying the **Jacobi equation**:

\[
\nabla^2_t J + R(J, \dot{\gamma}) \dot{\gamma} = 0,
\]
where \(\nabla^2_t J := \nabla_t \nabla_t J\).

**Origin:** Jacobi fields measure how geodesics spread apart. If we vary a geodesic \(\gamma\) by a one-parameter family \(\gamma_s(t)\) keeping endpoints fixed, the variation vector field \(V(t) = \frac{\partial \gamma_s}{\partial s}\big|_{s=0}\) satisfies the Jacobi equation.

**Boundary conditions:**
- \(J(a) = 0\) and \(J'(a) = v\) determines \(J\) uniquely (initial value problem).
- Alternatively, \(J(a) = 0\) and \(J(b) = w\) may have no solution, one solution, or many solutions, depending on conjugacy.

## 3.2 Conjugate Points

**Definition:** Two points \(\gamma(a)\) and \(\gamma(b)\) (with \(a < b\)) on a geodesic are **conjugate** if there exists a non-trivial Jacobi field \(J\) along \(\gamma|_{[a,b]}\) such that \(J(a) = J(b) = 0\).

**Equivalence:** \((a, b)\) is a pair of conjugate points if and only if \(d \exp_p(v) : T_v T_p M \to T_{\exp_p(v)} M\) is singular for some \(v\) with \(|\!|v|\!| = d(p, \exp_p(v))\) and the geodesic \(\exp_p(tv)\) reaches \(\exp_p(v)\) as an endpoint.

**Geometric meaning:**
- Conjugate points mark the boundary of the totally normal neighborhood.
- If \(p\) and \(q\) are conjugate on \(\gamma: [0,1] \to M\), the geodesic \(\gamma\) ceases to be a global minimizer beyond the first conjugate point.

## 3.3 The Focal Point Concept

A point \(q = \exp_p(v)\) is a **focal point** of \(p\) (along the direction \(v\)) if \(d\exp_p\) is singular at \(v\). The multiplicity of the focal point equals the dimension of the kernel of \(d\exp_p\).

**Relation to conjugate points:** For geodesics parameterized by arc length, the first conjugate point to \(p\) along \(\gamma\) occurs at distance equal to the reciprocal of the largest principal curvature of the level sets of distance from \(p\) (or, intrinsically, via the Jacobi equation).

## 3.4 Jacobi Fields and Curvature

The Jacobi equation directly couples the geometry (via \(R\)) to the behavior of Jacobi fields. Key observations:

- **Positive curvature accelerates convergence:** If \(K(\dot{\gamma}, J) > 0\) (sectional curvature of the 2-plane spanned by \(\dot{\gamma}\) and \(J\)), then Jacobi fields with initial conditions \(J(0) = 0\) and \(J'(0) = v\) will tend toward zero faster than in Euclidean space, causing conjugate points to appear sooner.

- **Negative curvature delays convergence:** If \(K(\dot{\gamma}, J) < 0\), Jacobi fields diverge.

This is made precise by the **Rauch comparison theorem** (Chapter 7), which compares Jacobi fields along geodesics in spaces of different curvature.

---

# Chapter 4: Isometric Immersions and the Second Fundamental Form

## 4.1 Immersions and the First Fundamental Form

An **immersion** \(f: M^m \to N^n\) (with \(m \le n\)) is a smooth map with injective differential \(df_p: T_p M \to T_{f(p)} N\) at every point \(p\).

An **isometric immersion** is an immersion \(f: (M, g) \to (N, \bar{g})\) such that \(f^* \bar{g} = g\); that is, distances are preserved. In local coordinates,

\[
g_{ij} = \overline{g}_{AB} \frac{\partial f^A}{\partial x^i} \frac{\partial f^B}{\partial x^j}.
\]

The induced metric \(g\) is called the **first fundamental form**. It allows us to identify \(T_p M\) with a subspace of \(T_{f(p)} N\).

## 4.2 The Second Fundamental Form

Fix a point \(p \in M\) and a unit normal vector \(\nu\) to \(M\) in \(N\). The **second fundamental form** \(h\) is the symmetric \((0,2)\)-tensor defined by

\[
h(X, Y) = -\langle d\bar{\nabla}_X (df \cdot Y), \nu \rangle,
\]
where \(\bar{\nabla}\) is the Levi-Civita connection on \(N\) and \(df \cdot Y\) is viewed as a tangent vector to \(N\) at \(f(p)\).

Equivalently, decompose the covariant derivative in \(N\) as:

\[
\bar{\nabla}_X (df \cdot Y) = df \cdot (\nabla_X Y) + h(X,Y) \, \nu.
\]

**Principal curvatures and mean curvature:**
- The **shape operator** (or Weingarten map) \(S_\nu\) is defined by \(\langle S_\nu(X), Y \rangle = h(X,Y)\).
- The **principal curvatures** \(\kappa_1, \ldots, \kappa_m\) are the eigenvalues of \(S_\nu\).
- The **mean curvature** is \(H = \frac{1}{m} \sum_{i=1}^m \kappa_i = \frac{1}{m} \text{tr}(h)\).

## 4.3 Gauss–Codazzi Equations

The curvature tensors of \(M\) and \(N\) are related by the **Gauss equation** and the **Codazzi equation**.

**Gauss equation:**

\[
R_M(X, Y, Z, W) = R_N(df \cdot X, df \cdot Y, df \cdot Z, df \cdot W) - h(X,Z) h(Y,W) + h(X,W) h(Y,Z),
\]
where \(R_M\) and \(R_N\) denote the curvature tensors.

In terms of sectional curvature: \(K_M = K_N + \kappa_1 \kappa_2\) for orthonormal \(X,Y\) with principal curvatures \(\kappa_1, \kappa_2\) in the \(X\wedge Y\) direction.

**Codazzi equation:**

\[
(\bar{\nabla}_X h)(Y, Z) = (\bar{\nabla}_Y h)(X, Z),
\]
where the covariant derivative acts on the second fundamental form as a \((0,3)\)-tensor.

**Significance:** These equations relate extrinsic curvature (measured via \(h\)) to intrinsic curvature. They allow us to construct isometric immersions with prescribed second fundamental form and to understand when a given Riemannian manifold can be realized as a submanifold of a fixed ambient space.

## 4.4 Examples: Hypersurfaces and Surfaces in \(\R^3\)

- **Spheres:** \(S^n(r) \subset \R^{n+1}\) has constant principal curvatures \(\kappa = 1/r\), so \(H = 1/r\) and \(K_{\text{Gauss}} = 1/r^2\).
- **Cylinders:** \(S^1(r) \times \R \subset \R^3\) has principal curvatures \(1/r\) and \(0\).
- **Minimal surfaces:** \(H = 0\); e.g., catenoids, helicoids satisfy the Codazzi equations with vanishing mean curvature.

---

# Chapter 5: Completeness, Hopf–Rinow, and Hadamard's Theorem

## 5.1 Complete Riemannian Manifolds

A Riemannian manifold \((M, g)\) is **complete** if every geodesic can be extended indefinitely; equivalently, the metric space \((M, d)\) is complete (every Cauchy sequence converges).

**Bonnet's Theorem:** A manifold is complete if and only if it is geodesically complete (geodesics extendable for all \(t \in \R\)).

## 5.2 The Hopf–Rinow Theorem

**Theorem (Hopf–Rinow):** For a Riemannian manifold \((M,g)\), the following are equivalent:
1. \((M, g)\) is (Riemannian) complete.
2. The metric space \((M, d)\) is complete.
3. Every closed bounded set is compact.
4. For any point \(p \in M\), the exponential map \(\exp_p: T_p M \to M\) is surjective.

**Consequences:**
- In a complete manifold, any two points are connected by at least one minimizing geodesic.
- Completeness implies geodesic stability and rules out certain pathologies.
- Example: Euclidean space \(\R^n\), spheres, and tori are complete; upper half-space with the hyperbolic metric is complete; an open ball in \(\R^n\) is not complete (as a submanifold).

## 5.3 Hadamard's Theorem

**Theorem (Hadamard):** Let \(M\) be a complete, simply-connected Riemannian manifold with non-positive sectional curvature everywhere. Then:
1. The exponential map \(\exp_p: T_p M \to M\) is a diffeomorphism for every \(p \in M\).
2. Any two points are connected by a unique geodesic.
3. \(M\) is diffeomorphic to \(\R^n\).

**Proof sketch:** 
- Non-positive curvature ensures that Jacobi fields diverge (or stay parallel), so conjugate points do not exist.
- By Hopf–Rinow, \(\exp_p\) is surjective; non-existence of conjugate points ensures injectivity.
- Thus \(\exp_p\) is a diffeomorphism, and uniqueness of minimizing geodesics follows.

**Example:** Hyperbolic space \(\H^n\) (with its standard metric of constant curvature \(-1\)) is a non-compact Hadamard manifold.

## 5.4 Spaces of Constant Curvature

A Riemannian manifold has **constant sectional curvature** \(c\) if \(K(\sigma) = c\) for every 2-plane \(\sigma\).

**Classification theorem:** A complete, simply-connected Riemannian manifold of dimension \(n\) with constant sectional curvature \(c\) is isometric to:
- **Euclidean space** \((\R^n, g_0)\) if \(c = 0\).
- **Sphere** \((S^n(1/\sqrt{c}), g_{\text{round}})\) if \(c > 0\).
- **Hyperbolic space** \((\H^n, g_{\text{hyp}})\) if \(c < 0\).

General (non-simply-connected) complete manifolds of constant curvature are quotients of these by discrete isometry groups.

---

# Chapter 6: Variations of Arc Length and Energy

## 6.1 First Variation of Arc Length

Let \(\gamma: [a,b] \to M\) be a curve parameterized by arc length, and let \(\{\gamma_s : s \in (-\epsilon, \epsilon)\}\) be a one-parameter family of curves with \(\gamma_0 = \gamma\) and fixed endpoints \(\gamma_s(a) = p\), \(\gamma_s(b) = q\).

The **length** is \(L(\gamma_s) = \int_a^b |\dot{\gamma}_s(t)| \, dt\). The **first variation** is

\[
\delta L := \frac{d}{ds}\bigg|_{s=0} L(\gamma_s).
\]

With \(V(t) := \frac{\partial \gamma_s}{\partial s}\big|_{s=0}\), we have

\[
\delta L = \int_a^b \langle \nabla_t V, \dot{\gamma} \rangle \, dt = \langle V, \dot{\gamma} \rangle \bigg|_a^b - \int_a^b \langle V, \nabla_t \dot{\gamma} \rangle \, dt.
\]

**Fixed-endpoint condition:** Since \(V(a) = V(b) = 0\), we get

\[
\delta L = - \int_a^b \langle V, \nabla_t \dot{\gamma} \rangle \, dt.
\]

**Critical point:** \(\delta L = 0\) for all variations \(V\) if and only if \(\nabla_t \dot{\gamma} = 0\), i.e., \(\gamma\) is a geodesic.

## 6.2 Second Variation of Arc Length

The **second variation** \(\delta^2 L\) measures the behavior of \(L(\gamma_s)\) to second order in \(s\). For a geodesic \(\gamma\) (so \(\delta L = 0\)), we have

\[
\frac{d^2}{ds^2}\bigg|_{s=0} L(\gamma_s) = \int_a^b \left[ |\nabla_t V|^2 - \langle R(V, \dot{\gamma}) \dot{\gamma}, V \rangle \right] \, dt
\]
where \(V\) satisfies the fixed-endpoint condition and \(|\nabla_t V|^2 = g(\nabla_t V, \nabla_t V)\).

**Conjugate point interpretation:** If there is a non-trivial Jacobi field \(J\) with \(J(a) = J(b) = 0\), then taking \(V = J\) gives \(\delta^2 L = 0\). This signals that the geodesic is no longer a local minimum.

## 6.3 Energy Functional and First Variation

For curves \(\gamma: [a,b] \to M\), the **energy** is

\[
E(\gamma) = \frac{1}{2} \int_a^b |\dot{\gamma}(t)|^2 \, dt.
\]

The energy has the advantage that it is defined without requiring constant-speed parameterization. Its critical points are (constant-speed) geodesics.

**First variation of energy:**

\[
\frac{d}{ds}\bigg|_{s=0} E(\gamma_s) = \int_a^b \langle \nabla_t V, \dot{\gamma} \rangle \, dt = - \int_a^b \langle V, \nabla_t \dot{\gamma} \rangle \, dt,
\]
(with the same fixed-endpoint argument as for arc length).

## 6.4 Second Variation of Energy

For a geodesic \(\gamma\) parameterized by arc length (so \(|\dot{\gamma}| = \text{const}\)), the second variation of energy is

\[
\frac{d^2}{ds^2}\bigg|_{s=0} E(\gamma_s) = \int_a^b \left[ |\nabla_t V|^2 - \langle R(V, \dot{\gamma}) \dot{\gamma}, V \rangle \right] dt.
\]

This is the **index form** \(I(V,V)\). A Jacobi field \(J\) (solution of the Jacobi equation with appropriate boundary conditions) represents a direction of non-positive index form if conjugate points exist.

---

# Chapter 7: Comparison Theorems and Curvature Bounds

## 7.1 The Rauch Comparison Theorem

**Theorem (Rauch):** Let \(\gamma: [0, \ell] \to M\) and \(\bar{\gamma}: [0, \ell] \to \bar{M}\) be unit-speed geodesics. Suppose sectional curvatures satisfy \(K_M(P) \le c\) and \(K_{\bar{M}}(P) = c\) for all 2-planes \(P\) (containing \(\dot{\gamma}\) and \(\dot{\bar{\gamma}}\) respectively).

Let \(J\) and \(\bar{J}\) be Jacobi fields along \(\gamma\) and \(\bar{\gamma}\) with the same initial conditions: \(J(0) = \bar{J}(0) = 0\) and \(|J'(0)| = |\bar{J}'(0)|\).

Then:
- If \(c \ge 0\): \(|J(t)| \le |\bar{J}(t)|\) for \(0 \le t \le \ell\).
- If \(c < 0\) and \(\ell\) is less than the conjugate radius in \(\bar{M}\): \(|J(t)| \le |\bar{J}(t)|\).

**Interpretation:** Lower sectional curvature means Jacobi fields grow at most as fast as in constant-curvature space. Conversely, higher curvature causes faster convergence.

## 7.2 Bonnet–Myers Theorem

**Theorem (Bonnet–Myers):** Let \((M, g)\) be a complete Riemannian manifold with Ricci curvature bounded below: \(\Ric(X, X) \ge (n-1) \kappa |X|^2\) for all \(X \in TM\) and some \(\kappa > 0\).

Then:
1. \(M\) is compact.
2. The diameter of \(M\) is at most \(\pi / \sqrt{\kappa}\).
3. The fundamental group \(\pi_1(M)\) is finite.

**Proof idea:** The Ricci curvature controls the average of sectional curvatures. In the Jacobi equation, \(\Ric\) replaces the sectional curvature when summing over orthonormal bases. Positive lower bound on Ric forces conjugate points to exist within finite distance, making geodesic triangles collapse.

**Examples:**
- Spheres \(S^n(r)\) have \(\Ric = (n-1)/r^2 > 0\), so they are compact (known geometrically).
- A complete surface with \(K \ge 1\) everywhere is compact with diameter \(\le \pi\).

## 7.3 Synge–Weinstein Theorem

**Theorem (Synge):** A compact, orientable Riemannian manifold of even dimension with positive sectional curvature is simply-connected. Moreover, if the manifold is non-orientable, it is simply-connected and has no orientation-reversing geodesics.

**Weinstein's extension:** If \((M, g)\) is a compact Riemannian manifold of even dimension with positive sectional curvature, then \(M\) has the homology of a sphere.

**Proof strategy:** 
- Suppose \(\pi_1(M)\) is non-trivial; then there is a non-contractible closed geodesic.
- Positive curvature implies this geodesic is isolated (nearby geodesics diverge).
- Careful index analysis (Chapter 8) shows this leads to a contradiction if the dimension is even.

**Application:** \(\R P^{2n}\) cannot admit a metric of positive sectional curvature if \(n > 0\).

---

# Chapter 8: The Morse Index Theorem

## 8.1 Index Form and Jacobi Fields Revisited

For a geodesic \(\gamma: [0, \ell] \to M\), the **index form** is the bilinear form on the space of vector fields \(V\) along \(\gamma\) with \(V(0) = V(\ell) = 0\):

\[
I(V, W) := \int_0^\ell \left[ \langle \nabla_t V, \nabla_t W \rangle - \langle R(V, \dot{\gamma}) \dot{\gamma}, W \rangle \right] dt.
\]

- **Positive index:** \(I(V,V) > 0\) for all non-zero \(V\).
- **Null direction:** \(I(V,V) = 0\) for non-zero \(V\); this occurs when \(V\) is a Jacobi field.
- **Negative index:** \(I(V,V) < 0\) for some \(V\).

A Jacobi field with \(J(0) = J(\ell) = 0\) (conjugate point) represents a null direction.

## 8.2 The Morse Index Theorem

**Theorem (Morse Index Theorem):** Let \(\gamma: [0, \ell] \to M\) be a geodesic segment from \(p\) to \(q\). Let \(J_1, \ldots, J_k\) be Jacobi fields along \(\gamma\) that form a basis for the space of Jacobi fields with \(J_i(0) = 0\).

If \(t_1 < \cdots < t_m\) are the times at which conjugate points to \(p\) occur (with multiplicities \(\mu_1, \ldots, \mu_m\)), then the **nullity** (dimension of the kernel of the index form) equals \(\sum_{j: t_j < \ell} \mu_j\), and the **index** (maximal dimension of a negative-definite subspace) is also determined by the conjugate point data.

More precisely: the number of conjugate points to \(p\) along \(\gamma|_{[0,\ell]}\), counted with multiplicity, equals the index.

**Version for closed geodesics:** For a closed geodesic \(\gamma: [0, \ell] \to M\) (so \(\gamma(0) = \gamma(\ell)\)), the index form is degenerate (the constant field is always in the kernel), and the Morse index is the number of conjugate points counted with multiplicity.

## 8.3 Index and Global Geometry

The Morse index is a powerful tool for analyzing the space of geodesics:
- **Minimizing geodesics** have index \(0\) (no conjugate points in the interior).
- **Longer geodesics** accumulate conjugate points and acquire positive index.
- In the study of **critical points of distance functions** and **topology of loop spaces**, the Morse index determines homological properties.

---

# Chapter 9: Closed Geodesics and Topological Constraints

## 9.1 Existence of Closed Geodesics

**Periodic geodesics** (or **closed geodesics**) are curves \(\gamma: \R / \ell \Z \to M\) satisfying the geodesic equation. They play a crucial role in relating topology and geometry.

**Theorem (Existence for compact manifolds):** Every compact Riemannian manifold admits at least one closed geodesic.

*Proof:* The space of closed curves of a fixed length forms a manifold (or space), and the energy functional restricted to this space has critical points, which correspond to closed geodesics.

**For non-compact manifolds:** Existence of closed geodesics is less guaranteed but can be established under curvature assumptions (e.g., positive Ricci curvature) or topological conditions.

## 9.2 Preissman's Theorem

**Theorem (Preissman):** Let \(M\) be a compact Riemannian manifold with strictly negative sectional curvature. Then:
1. Every abelian subgroup of \(\pi_1(M)\) is isomorphic to \(\Z\).
2. In particular, \(\pi_1(M)\) is torsion-free (no finite-order elements).

**Geometric origin:** 
- A hyperbolic manifold (constant curvature \(-1\)) has \(\pi_1\) isomorphic to a discrete group of isometries of \(\H^n\).
- For constant negative curvature, closed geodesics correspond to conjugacy classes in this discrete group.
- An abelian subgroup acts by translations, corresponding to closed geodesics that are parallel, implying the subgroup is infinite cyclic.

**Topological consequence:** The fundamental group of a negatively-curved manifold is "very non-abelian" (no \(\Z \times \Z\) subgroups), imposing strong constraints.

## 9.3 Stability of Closed Geodesics

**Index and stability:** A closed geodesic is **stable** (or **non-degenerate**) if the Morse index of \(\gamma\) (viewed as a critical point of energy on the loop space) is well-defined and finite. By the Morse Index Theorem, this depends on conjugate point multiplicity.

**Genericity:** For a generic metric on a compact manifold, all closed geodesics are non-degenerate.

---

# Chapter 10: Cut Locus, Injectivity Radius, and Global Geometry

## 10.1 Cut Locus

Fix a point \(p \in M\). A point \(q \ne p\) lies on the **cut locus** \(\text{Cut}(p)\) if:
1. There exist (at least) two distinct minimizing geodesics from \(p\) to \(q\), or
2. There is a unique minimizing geodesic from \(p\) to \(q\), but it is not a local minimizer (i.e., no conjugate points before \(q\), but \(q\) is a conjugate point).

**Construction:** The cut locus is the locus where the exponential map ceases to be a local diffeomorphism, or where geodesics first become non-unique.

**Measure-theoretic: Sard's theorem in Riemannian geometry implies that the cut locus has measure zero.

## 10.2 Distance Function and Injectivity Radius

The **distance function** \(d_p(x) = d(p, x)\) is smooth away from \(p\) and the cut locus. The gradient satisfies \(\nabla d_p = T\) where \(T\) is the unit vector field along the (unique, away from cut locus) minimizing geodesic.

The **injectivity radius** \(\text{inj}(p)\) is the distance from \(p\) to its cut locus:

\[
\text{inj}(p) = \inf \{ t > 0 : \exp_p(tv) \text{ is a cut point} \}
\]
for any unit \(v \in T_p M\) (the infimum is independent of direction for a given \(p\)).

The global injectivity radius is \(\text{inj}(M) = \inf_p \text{inj}(p)\).

## 10.3 Conjugate Radius and Curvature Control

**Relation to curvature:** If the sectional curvatures are bounded above by \(c > 0\) along geodesics emanating from \(p\), then:

\[
\text{conj-radius}(p) \ge \frac{\pi}{\sqrt{c}}.
\]

For instance, if \(K \le 1\) everywhere, then no conjugate points occur within distance \(\pi\), so \(\text{inj}(M) \ge \pi\) (a weaker bound).

**Global bounds:** For a compact \(n\)-dimensional manifold with \(\Ric \ge (n-1) H\) and diameter \(D\), there are lower bounds on \(\text{inj}(M)\) in terms of \(H\) and \(D\).

## 10.4 Rauch's Theorem Revisited

The Rauch comparison theorem (Chapter 7) directly compares growth of geodesics via the injectivity radius:

\[
d(p, \exp_p(tv)) \le d_c(p_c, \exp_{p_c}(tv_c))
\]
where the right-hand side is the corresponding distance in a constant-curvature model space.

---

# Chapter 11: The Sphere Theorem and Classification Results

## 11.1 Topological Sphere Theorem

**Theorem (Sphere Theorem, Berger–Klingenberg):** Let \(M\) be a compact, simply-connected Riemannian manifold of dimension \(n \ge 2\). If the sectional curvatures satisfy \(\frac{1}{4} < K \le 1\) (in units where the round sphere has \(K = 1\)), then \(M\) is homeomorphic to \(S^n\).

**Remark:** The constant \(1/4\) is sharp; equality occurs for complex projective space \(\mathbb{CP}^n\) when \(n\) is odd.

**Proof outline:**
1. Use positive curvature to establish conjugate point bounds.
2. The injectivity radius is controlled: \(\text{inj}(M) > \pi/2\).
3. Topological dimension count: geodesic ball of radius \(\pi/2\) covers most of \(M\).
4. Careful index analysis shows \(M\) has the homology of \(S^n\).
5. By Hurewicz and simply-connectedness, \(M\) is homeomorphic to \(S^n\).

## 11.2 Rigidity Theorems

**Constant curvature:** A complete Riemannian manifold with constant sectional curvature is (locally) isometric to one of:
- Euclidean \(\R^n\)
- Sphere \(S^n\)
- Hyperbolic space \(\H^n\)

**Einstein metrics:** A Riemannian metric is **Einstein** if \(\Ric = \lambda g\) for some constant \(\lambda\). Examples include:
- Round spheres (Ric \(= \lambda g\) with \(\lambda > 0\))
- Hyperbolic space (Ric \(= \lambda g\) with \(\lambda < 0\))
- Kähler–Einstein metrics on complex surfaces (rigid under certain curvature conditions)

## 11.3 Quarter-Pinched Metrics and Diffeomorphism

**Pinching constant:** A Riemannian manifold is **\(\delta\)-pinched** if sectional curvatures satisfy \(\delta \le K / \max K \le 1\) (a measure of how close all sectional curvatures are to each other).

**Theorem (Berger, 1960):** A simply-connected, compact Riemannian manifold with \(1/4\)-pinched positive sectional curvature is diffeomorphic to \(S^n\).

This is stronger than the topological Sphere Theorem: it establishes a diffeomorphism, not just a homeomorphism.

## 11.4 Weitzenböck Formulas and Harmonic Forms

**Weitzenböck formula:** For a harmonic \(k\)-form \(\omega\) on a Riemannian manifold,

\[
\Delta \omega = -\text{Ric} \cdot \omega
\]
(where \(\Delta = (d\delta + \delta d)/2\) is the Laplacian on forms, and Ric acts by contraction).

**Consequence:** If \(\Ric > 0\) in a certain sense, the only harmonic forms are constants (in degree 0) or zero. This constrains the cohomology of \(M\).

**Application to the Sphere Theorem:** Positive Ricci curvature implies \(b_k(M) = 0\) for \(1 \le k < n\), so \(M\) has the cohomology of \(S^n\).

## 11.5 Classification and Open Questions

**Classify metrics on:
- **Spheres and projective spaces:** Round metrics are rigid under various curvature conditions; deformations are highly restricted.
- **Einstein metrics:** Classification on Kähler surfaces (Fano, del Pezzo) uses Kummer surfaces and explicit constructions.
- **Orbifold metrics:** Singular Einstein metrics arise as limits of deformations.

**Open directions:**
- Are there other positively-curved Einstein metrics on \(S^4\) besides the round metric?
- Existence of Kähler–Einstein metrics on smooth varieties (Yau–Tian–Donaldson correspondence).
- Geometrization of 3-manifolds (Perelman, using Ricci flow).

