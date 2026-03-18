---
title: "PMATH 365: Differential Geometry"
prof: "Spiro Karigiannis"
---

# PMATH 365: Differential Geometry

This course develops the classical theory of curves and surfaces, leading to the Gauss-Bonnet theorem, then generalizes this geometry to submanifolds of \(\mathbb{R}^n\) using the language of differential forms and tensor algebras.

---

## Chapter 1: Curves

### Curves in \(\mathbb{R}^n\)

A **parametrized curve** in \(\mathbb{R}^n\) is a continuous map \(\alpha : I \subseteq \mathbb{R} \to \mathbb{R}^n\) where \(I\) is a nonempty interval. Writing \(\alpha(t) = (x_1(t), x_2(t), \ldots, x_n(t))\), we say \(\alpha\) is **\(C^k\)** when all derivatives up to order \(k\) exist and are continuous, **smooth** or **\(C^\infty\)** when it is \(C^k\) for all \(k\), and **regular** when it is \(C^1\) with \(\alpha'(t) \neq 0\) for all \(t \in I\). Unless otherwise stated, all curves are assumed smooth and regular.

The tangent vector \(\alpha'(a)\) exists at any point where \(\alpha\) is differentiable, and regularity guarantees this tangent vector is always nonzero. A curve that fails regularity may cross itself or have corners: the curve \(\alpha(t) = (t, |t|)\) has no derivative at \(t=0\), the curve \(\beta(t) = (t^3, t^2)\) has \(\beta'(0) = 0\), and the curve \(\gamma(t) = (t, t^2 \sin(1/t))\) for \(t \neq 0\) with \(\gamma(0)=0\) is differentiable but not \(C^1\).

**Theorem 1.3** (Local Injectivity): Every regular curve in \(\mathbb{R}^n\) is locally injective.

*Proof.* Let \(a \in I\). Since \(\alpha'(a) \neq 0\), some coordinate function satisfies \(x_k'(a) \neq 0\), say \(x_k'(a) > 0\). By continuity of \(x_k'\), there exists \(\delta > 0\) such that \(x_k'(t) > 0\) for \(|t-a| < \delta\). Thus \(x_k\) is strictly increasing on \((a-\delta, a+\delta)\), making \(\alpha\) injective there. \(\square\)

Regularity is not necessary for global injectivity (the three non-regular examples above are all globally injective). Conversely, regular curves can fail to be globally injective: the alpha curve \(\alpha(t) = (t^2-1, t(t^2-1))\) crosses itself at the origin.

The **length** of a curve \(\alpha : [a,b] \to \mathbb{R}^n\) is defined as the supremum of lengths of all piecewise linear approximations:
\[
L = L_\alpha[a,b] = \sup \left\{ \sum_{j=1}^p |\alpha(t_j) - \alpha(t_{j-1})| \,\Big|\, a = t_0 < t_1 < \cdots < t_p = b \right\}.
\]

**Theorem 1.8** (Arclength Formula): For a regular curve \(\alpha : [a,b] \to \mathbb{R}^n\),
\[
L = L_\alpha[a,b] = \int_a^b |\alpha'(t)|\, dt.
\]

*Proof.* The proof proceeds by showing the supremum of the piecewise linear sums \(L(\alpha, P)\) and the Riemann sums \(S(\alpha, P)\) for \(\int |\alpha'|\) both approximate the same limit. Given \(\epsilon > 0\), by uniform continuity of each \(x_k'\) and Riemann integrability of \(|\alpha'|\), one finds a partition \(P\) fine enough that \(L - L(\alpha,P) < \epsilon/3\), \(|\int |\alpha'| - S(\alpha,P)| < \epsilon/3\), and \(|L(\alpha,P) - S(\alpha,P)| < \epsilon/3\), yielding \(|L - \int |\alpha'|| < \epsilon\). \(\square\)

A **reparametrization** of \(\alpha\) is a curve \(\beta(s) = \alpha(t(s))\) where \(s : I \to J\) is a homeomorphism. When \(s'(t) \neq 0\) for all \(t\), the reparametrization is **regular**; it **preserves direction** when \(s'(t) > 0\) and **reverses direction** when \(s'(t) < 0\). We say \(\beta\) is **parametrized by arclength** when \(|\beta'(s)| = 1\) for all \(s\).

**Theorem 1.11**: Every regular curve can be reparametrized by arclength using a regular direction-preserving change of coordinates.

*Proof.* Fix \(a \in I\) and define \(s(t) = \int_a^t |\alpha'(r)|\, dr\). Then \(s'(t) = |\alpha'(t)| > 0\), so \(s\) is regular and strictly increasing. Its inverse satisfies \(t'(s) = 1/|\alpha'(t)|\), and the reparametrized curve \(\beta(s) = \alpha(t(s))\) has \(|\beta'(s)| = |\alpha'(t(s))| \cdot t'(s) = 1\). \(\square\)

### Curves in \(\mathbb{R}^2\)

Let \(\beta : J \to \mathbb{R}^2\) be a smooth regular curve parametrized by arclength. For a vector \(u = (x,y)\), write \(u^\times = (-y, x)\). The **unit tangent vector** and **unit normal vector** are
\[
T(s) = T_\beta(s) = \beta'(s), \qquad N(s) = N_\beta(s) = T(s)^\times.
\]
Since \(|T(s)|=1\), differentiating gives \(T'(s) \perp T(s)\), so \(T'(s) = k(s) N(s)\) for some scalar. The **signed curvature** is the real number \(k(s) = k_\beta(s)\) defined by
\[
\beta''(s) = k(s) N(s).
\]
The **scalar curvature** is \(\kappa(s) = |k(s)| = |\beta''(s)|\). For an arbitrary regular curve \(\alpha : I \to \mathbb{R}^2\), one first reparametrizes by arclength and then defines \(T, N, k, \kappa\) in terms of the reparametrized curve.

**Theorem 1.14** (Curvature Formulas): For a smooth regular curve \(\alpha : I \to \mathbb{R}^2\) with \(\alpha' = (x', y')\),
\[
k = k_\alpha = \frac{x'y'' - y'x''}{(x'^2 + y'^2)^{3/2}}, \qquad \kappa = |k_\alpha| = \frac{|x'y'' - y'x''|}{(x'^2+y'^2)^{3/2}}.
\]

The **osculating circle** of \(\beta\) at \(s_0\) is the circle through \(\beta(s_0)\) with center \(\beta(s_0) + \frac{1}{k(s_0)} N(s_0)\) (when \(k(s_0) \neq 0\) and radius \(1/|k(s_0)|\). It is the best-fit circle to the curve at that point.

**Theorem 1.17** (Polar Coordinates for Plane Curves): Let \(\beta : J \to \mathbb{R}^2\) be a smooth regular curve with \(|\beta'(s)| = 1\). There exists a smooth function \(\theta : J \to \mathbb{R}\), unique up to adding an integer multiple of \(2\pi\), such that
\[
\beta'(s) = (\cos\theta(s),\ \sin\theta(s)).
\]
In this case \(\theta'(s) = k(s)\).

For a closed curve \(\alpha : [0, L] \to \mathbb{R}^2\) (with \(\alpha(0)=\alpha(L)\), the **winding number** \(w(\alpha, p)\) around a point \(p\) not on the curve counts how many times the curve winds around \(p\). The **turning number** (or rotation number) is
\[
n(\alpha) = \frac{1}{2\pi}\int_0^L k(s)\, ds = \frac{\theta(L) - \theta(0)}{2\pi},
\]
the total turning of the tangent vector divided by \(2\pi\).

**Theorem 1.19** (Turning Number Theorem): For a smooth closed regular curve in \(\mathbb{R}^2\) that does not self-intersect, the turning number is \(\pm 1\).

**Theorem 1.20** (Fundamental Theorem for Plane Curves): Given a smooth function \(k : J \to \mathbb{R}\) and a point \(p \in \mathbb{R}^2\), a unit vector \(A \in \mathbb{R}^2\), and \(s_0 \in J\), there exists a unique smooth regular curve \(\beta : J \to \mathbb{R}^2\) parametrized by arclength with \(\beta(s_0)=p\), \(\beta'(s_0)=A\), and signed curvature \(k_\beta = k\).

*Proof sketch.* By the Polar Coordinates Theorem, define \(\theta(s) = \theta_0 + \int_{s_0}^s k(r)\,dr\) where \(\theta_0\) is chosen so that \(A = (\cos\theta_0, \sin\theta_0)\), then set \(\beta(s) = p + \int_{s_0}^s (\cos\theta(r), \sin\theta(r))\,dr\).

### Curves in \(\mathbb{R}^3\)

For a smooth regular curve \(\beta : J \to \mathbb{R}^3\) parametrized by arclength, the **unit tangent vector** is \(T = \beta'\). Since \(|T| = 1\), we have \(T' \perp T\). When \(T'(s) \neq 0\), the **principal normal vector** is \(P = T'/|T'|\) and the **curvature** is \(\kappa = |T'| = |\beta''|\). The **binormal vector** is \(B = T \times P\), giving a positively oriented orthonormal frame \(\{T, P, B\}\) at each point.

The **torsion** \(\tau = \tau_\beta\) is defined by \(B' = -\tau P\). (One can show \(B' \perp T\) and \(B' \perp B\), so \(B'\) is indeed a multiple of \(P\).) The resulting **Frenet-Serret formulas** are:
\[
T' = \kappa P, \qquad P' = -\kappa T + \tau B, \qquad B' = -\tau P.
\]

The curvature \(\kappa\) measures the rate at which the curve bends away from a straight line, while the torsion \(\tau\) measures how the curve twists out of the osculating plane spanned by \(T\) and \(P\). A curve lies in a plane if and only if \(\tau \equiv 0\).

**Theorem 1.24** (Curvature and Torsion Formulas): For a smooth regular curve \(\alpha : I \to \mathbb{R}^3\),
\[
\kappa = \frac{|\alpha' \times \alpha''|}{|\alpha'|^3}, \qquad \tau = \frac{(\alpha' \times \alpha'') \cdot \alpha'''}{|\alpha' \times \alpha''|^2}.
\]

**Theorem 1.27** (Fundamental Theorem for Space Curves): Given smooth functions \(\kappa, \tau : J \to \mathbb{R}\) with \(\kappa(s) > 0\) for all \(s\), a point \(p \in \mathbb{R}^3\), and a positively oriented orthonormal basis \(\{A, B, C\}\) of \(\mathbb{R}^3\), there exists a unique smooth curve \(\beta : J \to \mathbb{R}^3\) parametrized by arclength such that \(\beta(s_0) = p\), \((T(s_0), P(s_0), B(s_0)) = (A, B, C)\), and the curvature and torsion of \(\beta\) are \(\kappa\) and \(\tau\).

*Proof sketch.* The Frenet-Serret equations form a system of ODEs \(\frac{d}{ds}(T,P,B) = (T,P,B) M\) for a skew-symmetric matrix \(M\) depending on \(\kappa\) and \(\tau\). Existence and uniqueness of solutions with prescribed initial conditions follows from the standard ODE theorem. One then verifies the solution maintains the orthonormality of the frame.

---

## Chapter 2: Surfaces

### Surfaces in \(\mathbb{R}^n\)

A **(local parametrized) surface** in \(\mathbb{R}^n\) is a continuous map \(\sigma : U \subseteq \mathbb{R}^2 \to \mathbb{R}^n\) where \(U\) is an open set. The surface is **regular** when \(\sigma\) is \(C^1\) and its derivative (Jacobian) matrix \(D\sigma = (\sigma_u, \sigma_v)\) has rank 2, meaning the column vectors \(\sigma_u = \partial\sigma/\partial u\) and \(\sigma_v = \partial\sigma/\partial v\) are linearly independent at every point. The **tangent plane** to \(\sigma\) at \((a,b)\) is the plane through \(\sigma(a,b)\) parallel to \(\sigma_u(a,b)\) and \(\sigma_v(a,b)\).

Standard examples include:
- The **graph** of \(f: U \to \mathbb{R}\) via \(\sigma(u,v) = (u,v,f(u,v))\), always regular since \(D\sigma\) has rank 2.
- The **sphere** \(\rho(\phi,\theta) = r(\sin\phi\cos\theta, \sin\phi\sin\theta, \cos\phi)\), regular when \(\sin\phi \neq 0\).
- The **torus** \(\sigma(\theta,\phi) = ((R+r\cos\phi)\cos\theta, (R+r\cos\phi)\sin\theta, r\sin\phi)\), regular everywhere for \(0 < r < R\).

A **Riemannian metric** on \(U \subseteq \mathbb{R}^n\) is a smooth map \(g : U \to M_{n\times n}(\mathbb{R})\) where \(g(p)\) is positive-definite symmetric at every \(p\). The **first fundamental form** of a smooth regular surface \(\sigma\) is
\[
g = g_\sigma = D\sigma^T D\sigma = \begin{pmatrix} \sigma_u \cdot \sigma_u & \sigma_u \cdot \sigma_v \\ \sigma_u \cdot \sigma_v & \sigma_v \cdot \sigma_v \end{pmatrix}.
\]
Traditionally one writes \(E = g_{11} = \sigma_u \cdot \sigma_u\), \(F = g_{12} = \sigma_u \cdot \sigma_v\), \(G = g_{22} = \sigma_v \cdot \sigma_v\). This is positive-definite (since \(\sigma_u\) and \(\sigma_v\) are linearly independent), so it defines an inner product \(\langle X, Y \rangle = Y^T g X\) on \(\mathbb{R}^2\).

The length of a curve \(\gamma(t) = \sigma(\alpha(t))\) lying on the surface is
\[
L_\gamma[a,b] = \int_a^b \sqrt{\alpha'(t)^T g(\alpha(t)) \alpha'(t)}\, dt,
\]
and the angle between two curves on the surface through a point \(p\) is computed using the inner product \(\langle X, Y \rangle = Y^T g(p) X\).

The **area** of the surface over a Jordan region \(R \subseteq U\) is motivated by approximating \(\sigma(R)\) by infinitesimal parallelograms: each small patch at \((u,v)\) has area approximately \(\sqrt{\det g}\, du\,dv\), giving
\[
A_\sigma(R) = \iint_R \sqrt{\det g(u,v)}\, du\, dv.
\]
More generally, for a continuous function \(f : U \to \mathbb{R}\), we write \(dA = \sqrt{\det g}\, du\, dv\) and define \(\iint_R f\, dA = \iint_R f(u,v)\sqrt{\det g}\\,du\\,dv\).

**Theorem 2.12** (Change of Coordinates): Under a smooth regular change of coordinates \(\phi: U \to V\) with inverse \(\psi = \phi^{-1}\), the surface \(\rho = \sigma \circ \psi\) satisfies \(g_\rho(q) = D\psi(q)^T g_\sigma(p) D\psi(q)\) and \(A_\rho(\phi(R)) = A_\sigma(R)\). That is, area is intrinsic and independent of the parametrization chosen.

### Surfaces in \(\mathbb{R}^3\)

For a smooth regular surface \(\sigma : U \subseteq \mathbb{R}^2 \to \mathbb{R}^3\), since \(D\sigma\) has rank 2 we have \(\sigma_u \times \sigma_v \neq 0\). The **unit normal vector** and **Gauss map** are
\[
n = n_\sigma = \frac{\sigma_u \times \sigma_v}{|\sigma_u \times \sigma_v|} : U \to S^2 \subseteq \mathbb{R}^3.
\]

Given a point \(p \in U\) and a nonzero vector \(A \in \mathbb{R}^2\), the **(directional) curvature** \(k_\sigma(p)(A)\) is defined by taking any regular curve \(\alpha\) with \(\alpha(0)=p\), \(\alpha'(0)=A\), letting \(\gamma = \sigma \circ \alpha\) and reparametrizing by arclength to get \(\delta\), then setting \(k_\sigma(p)(A) = \delta''(0) \cdot N(0)\) where \(N(s) = n(\alpha(t(s)))\).

**Theorem 2.14** (Directional Curvature): The curvature \(k_\sigma(p)(A)\) depends only on \(\sigma\), \(p\), and the direction of \(A\), and is given by
\[
k_\sigma(p)(A) = \frac{A^T h(p) A}{A^T g(p) A}
\]
where \(g = D\sigma^T D\sigma\) is the first fundamental form and \(h = -Dn^T D\sigma\) is the **second fundamental form**.

The entries of \(h\) can be computed as
\[
h = \begin{pmatrix} \sigma_{uu} \cdot n & \sigma_{uv} \cdot n \\ \sigma_{uv} \cdot n & \sigma_{vv} \cdot n \end{pmatrix}
\]
using the identities \(\sigma_{uu} \cdot n = -\sigma_u \cdot n_u\) etc. (obtained by differentiating \(\sigma_u \cdot n = 0\). Traditionally one writes \(L = h_{11}\), \(M = h_{12}\), \(N = h_{22}\).

*Proof of Theorem 2.14.* Since \(\delta'\) lies in the tangent plane, \(\delta' \cdot N = 0\). Differentiating: \(\delta'' \cdot N = -\delta' \cdot N'\). Computing \(\delta' = D\sigma(\alpha') / |D\sigma\alpha'|\) and \(N' = Dn(\alpha')/|D\sigma\alpha'|\), one obtains \(k = -(\delta' \cdot N') = -(A^T Dn^T D\sigma A)/(A^T D\sigma^T D\sigma A) = A^T h A / A^T g A\). \(\square\)

The directional curvature depends only on the direction of \(A\), so \(k_\sigma(p)\) defines a function on the projective line \(\mathbb{P}^1(\mathbb{R})\) of directions. Under a positive change of coordinates, the unit normal is preserved (\(n_\rho = n_\sigma\), the second fundamental form transforms as \(h_\rho(q) = D\psi(q)^T h_\sigma(p) D\psi(q)\), and the directional curvature is invariant.

**Theorem 2.18** (Principal Curvature Directions): For \(p \in U\), the directional curvature \(k_\sigma(p)(A)\) attains its maximum \(k_1\) and minimum \(k_2\) in two directions orthogonal with respect to \(g(p)\). These extreme values are the **principal curvatures**, the eigenvalues of \(g(p)^{-1} h(p)\), occurring in the **principal directions** (eigenvectors). The principal curvatures are the roots of \(\det(h(p) - k\ g(p)) = 0\).

The **mean curvature** and **Gaussian curvature** are
\[
H = \tfrac{1}{2}(k_1 + k_2) = \tfrac{1}{2}\operatorname{tr}(g^{-1}h), \qquad K = k_1 k_2 = \frac{\det h}{\det g}.
\]

**Theorem 2.20** (Gauss-Weingarten Equations): For a smooth regular surface in \(\mathbb{R}^3\),
\[
\begin{pmatrix} \sigma_{uu} \\ \sigma_{uv} \\ \sigma_{vv} \\ n_u \\ n_v \end{pmatrix} = \begin{pmatrix} \Gamma^1_{11} & \Gamma^2_{11} & h_{11} \\ \Gamma^1_{12} & \Gamma^2_{12} & h_{12} \\ \Gamma^1_{22} & \Gamma^2_{22} & h_{22} \\ b^1_1 & b^2_1 & 0 \\ b^1_2 & b^2_2 & 0 \end{pmatrix} \begin{pmatrix} \sigma_u \\ \sigma_v \\ n \end{pmatrix}
\]
where \(b = -g^{-1}h\) (the **Weingarten map**) and the **Christoffel symbols** are given by
\[
\begin{pmatrix} \Gamma^1_{11} & \Gamma^1_{12} & \Gamma^1_{22} \\ \Gamma^2_{11} & \Gamma^2_{12} & \Gamma^2_{22} \end{pmatrix} = \tfrac{1}{2} g^{-1} \begin{pmatrix} (g_{11})_u & (g_{11})_v & 2(g_{12})_v - (g_{22})_u \\ 2(g_{12})_u - (g_{11})_v & (g_{22})_u & (g_{22})_v \end{pmatrix}.
\]

The proof determines all entries by taking dot products with \(\sigma_u\), \(\sigma_v\), and \(n\), using e.g. \(\sigma_{uu} \cdot \sigma_u = \frac{1}{2}(g_{11})_u\) (from differentiating \(g_{11} = \sigma_u \cdot \sigma_u\).

**Theorem 2.22** (Gauss-Codazzi Equations): The entries of \(g\) and \(h\) satisfy the **Codazzi equations**:
\[
(h_{11})_v - (h_{12})_u = h_{11}\Gamma^1_{12} + h_{12}(\Gamma^2_{12} - \Gamma^1_{11}) - h_{22}\Gamma^2_{11},
\]
\[
(h_{12})_v - (h_{22})_u = h_{11}\Gamma^1_{22} + h_{12}(\Gamma^2_{22} - \Gamma^1_{12}) - h_{22}\Gamma^2_{12},
\]
and the **Gauss equations** (expressing \(K \det g\) in terms of \(g\) and its derivatives):
\[
g_{11} K = (\Gamma^2_{11})_v - (\Gamma^2_{12})_u + \Gamma^2_{11}\Gamma^2_{22} + \Gamma^1_{11}\Gamma^2_{12} - \Gamma^1_{12}\Gamma^2_{11} - (\Gamma^2_{12})^2,
\]
and two further equations for \(g_{12} K\) and \(g_{22} K\).

These compatibility equations arise from requiring \(\sigma_{uuv} = \sigma_{uvu}\) and \(\sigma_{vvu} = \sigma_{vuv}\), then expanding using the Gauss-Weingarten equations and equating coefficients of \(\sigma_u\), \(\sigma_v\), and \(n\).

**Theorem 2.23** (Theorema Egregium): For a smooth regular surface in \(\mathbb{R}^3\), the Gaussian curvature \(K = \det h / \det g\) can be expressed entirely in terms of the first fundamental form \(g\) and its derivatives. In particular, \(K\) is an **intrinsic** property: it is preserved under isometries (maps that preserve the Riemannian metric).

This is Gauss's "remarkable theorem": even though \(K\) is defined using \(h\) (which depends on the embedding in \(\mathbb{R}^3\), it turns out to depend only on the intrinsic geometry. As a consequence, a flat rectangle and a cylinder (which is obtained by bending a rectangle without stretching) have the same Gaussian curvature \(K=0\) at every point, while the mean curvature changes (\(H=0\) vs. \(H = 1/(2r)\).

**Theorem 2.24** (Bonnet's Theorem / Fundamental Theorem for Surfaces): Given a connected open set \(U \subseteq \mathbb{R}^2\), smooth functions \(g_{11}, g_{12}, g_{22}, h_{11}, h_{12}, h_{22} : U \to \mathbb{R}\) with \(g_{11} > 0\) and \(g_{11}g_{22} - g_{12}^2 > 0\), satisfying all the Gauss-Codazzi equations, and given initial data \(p \in \mathbb{R}^3\) and orthogonal unit vectors \(A, B \in \mathbb{R}^3\), there exists a unique smooth surface \(\sigma : U \to \mathbb{R}^3\) with these fundamental forms satisfying \(\sigma(0)=p\), \(\sigma_u(0) \in \operatorname{Span}\{A\}\), \(\sigma_v(0) \in \operatorname{Span}\{A,B\}\). Bonnet's theorem says a surface is determined up to rigid motion by its two fundamental forms, provided the Gauss-Codazzi compatibility conditions hold.

---

## Chapter 3: Geodesic Curvature and the Gauss-Bonnet Theorem

### Geodesic Curvature and Geodesics

Let \(\sigma : U \subseteq \mathbb{R}^2 \to \mathbb{R}^3\) be a smooth regular surface, let \(\alpha : I \to U\) be a smooth regular curve, and let \(\gamma(t) = \sigma(\alpha(t))\). Reparametrize \(\gamma\) by arclength to get \(\beta(s) = \alpha(t(s))\) and \(\delta(s) = \gamma(t(s))\). Set \(T(s) = \delta'(s)\), \(N(s) = n(\beta(s))\), and \(M(s) = N(s) \times T(s)\). Then \(\{T, M, N\}\) is a positive oriented orthonormal basis for \(\mathbb{R}^3\) with \(T\) and \(M\) spanning the tangent plane.

Since \(\delta\) is arclength-parametrized, \(\delta'' \perp \delta'\), so \(\delta''(s)\) lies in the span of \(N\) and \(M\):
\[
\delta'' = (\delta'' \cdot N) N + (\delta'' \cdot M) M.
\]
The normal component \(\delta'' \cdot N\) is the directional curvature studied in Chapter 2; it depends only on the surface and direction, not the shape of the curve. The tangential component defines the **geodesic curvature**:
\[
k_g = k_g(s) = k_g(\beta)(s) = \delta''(s) \cdot M(s).
\]
For the original curve \(\alpha\) we set \(k_g(\alpha)(t) = k_g(\beta)(s(t))\).

**Theorem 3.2** (Geodesic Curvature is Intrinsic): Writing \(\beta(s) = (u(s), v(s))\),
\[
k_g = \sqrt{\det g} \left[ \left(v'' + \Gamma^2_{11}(u')^2 + 2\Gamma^2_{12} u'v' + \Gamma^2_{22}(v')^2\right) u' - \left(u'' + \Gamma^1_{11}(u')^2 + 2\Gamma^1_{12} u'v' + \Gamma^1_{22}(v')^2\right) v' \right].
\]
Since this formula involves only \(g\) and its derivatives (via the Christoffel symbols), \(k_g\) is intrinsic — it can be computed from the Riemannian metric alone without knowing how the surface sits in \(\mathbb{R}^3\).

*Proof.* Using \(\delta'\) and \(\delta''\) from the Gauss-Weingarten equations and the formula \(k_g = \det(\delta', \delta'', N)\), one notes that \(\det(\sigma_u, \sigma_v, n) = \sqrt{\det g}\). The normal component \(n(\cdot)\) drops out, yielding the intrinsic formula. \(\square\)

#### Geodesics via the Calculus of Variations

A **geodesic** is intended to be a curve of locally minimum arclength. The energy of a curve \(\delta(s) = \sigma(\beta(s))\) over \([a,b]\) is
\[
E_\delta[a,b] = \int_a^b |\delta'(s)|^2\\, ds = \int_a^b \beta'(s)^T g(\beta(s)) \beta'(s)\\, ds.
\]
By the Cauchy-Schwarz inequality, \(L^2 \leq (b-a) E\), with equality when \(|\delta'|\) is constant. So minimizing arclength among arclength-parametrized curves is equivalent to minimizing energy.

To minimize the energy functional with Lagrangian \(L = g_{11}(u')^2 + 2g_{12}u'v' + g_{22}(v')^2\), one applies the **Euler-Lagrange equations**:
\[
\frac{\partial L}{\partial u} - \frac{d}{ds}\frac{\partial L}{\partial u'} = 0, \qquad \frac{\partial L}{\partial v} - \frac{d}{ds}\frac{\partial L}{\partial v'} = 0.
\]
These reduce to the **geodesic equations**:
\[
u'' + \Gamma^1_{11}(u')^2 + 2\Gamma^1_{12} u'v' + \Gamma^1_{22}(v')^2 = 0,
\]
\[
v'' + \Gamma^2_{11}(u')^2 + 2\Gamma^2_{12} u'v' + \Gamma^2_{22}(v')^2 = 0.
\]

**Definition 3.4**: A **geodesic** on \(\sigma\) is a smooth regular curve \(\beta : I \to U\), parametrized by arclength with respect to \(g\), satisfying the geodesic equations.

**Theorem 3.5**: For a smooth regular curve \(\beta\) on \(\sigma\) with \(\delta = \sigma \circ \beta\):
1. \(\delta''(s) \parallel N(s)\) for all \(s\) if and only if \(\beta\) satisfies the geodesic equations, in which case \(|\delta'|\) is constant.
2. When \(|\delta'(s)| = 1\), \(\beta\) is a geodesic if and only if \(k_g \equiv 0\).

In other words, a geodesic is a curve for which the acceleration \(\delta''\) is always normal to the surface — there is no tangential acceleration, so the curve "travels as straight as possible" on the surface.

**Corollary 3.6**: Given a point \(p \in U\) and a unit vector \(A \in \mathbb{R}^2\), there exists a unique geodesic \(\beta : I \to U\) with \(\beta(0) = p\) and \(\beta'(0)/|\beta'(0)| = A\), defined on the maximal interval \(I\) for which \(\beta(s) \in U\). This follows directly from the existence and uniqueness theorem for ODEs applied to the geodesic equations.

### Orthogonal Coordinates

**Theorem 3.7** (Orthogonal Coordinates): For every point \(p \in U\) there exists a neighborhood \(U_p \subseteq U\) of \(p\) and a smooth regular change of coordinates \(\phi : U_p \to V_p\) such that the reparametrized surface \(\rho = \sigma \circ \phi^{-1}\) has diagonal first fundamental form \(g_\rho(s,t) = \operatorname{diag}(g_{11}, g_{22})\) everywhere in \(V_p\).

When the coordinates are orthogonal (i.e., \(g_{12} = F = 0\), geometric quantities simplify greatly. In fact, Gauss proved a stronger result: **isothermal coordinates** exist locally around any point, where \(g_\rho\) is a scalar multiple of the identity.

**Theorem 3.10** (Gaussian Curvature in Orthogonal Coordinates): When \(g\) is diagonal,
\[
K = \frac{-1}{2\sqrt{g_{11}g_{22}}} \left[ \frac{\partial}{\partial u}\frac{(g_{22})_u}{\sqrt{g_{11}g_{22}}} + \frac{\partial}{\partial v}\frac{(g_{11})_v}{\sqrt{g_{11}g_{22}}} \right].
\]

**Theorem 3.11** (Geodesic Curvature of Coordinate Lines): When \(g\) is diagonal, the geodesic curvatures of the coordinate lines \(v = b\) and \(u = a\) (parametrized by arclength) are
\[
k_1 = k_g^{v=b} = -\frac{(g_{11})_v}{2\sqrt{g_{11}g_{22}}}, \qquad k_2 = k_g^{u=a} = \frac{(g_{22})_u}{2\sqrt{g_{22}g_{11}}}.
\]

**Note 3.12**: When \(g\) is diagonal and \(|\delta'(s)|=1\), we can write
\[
\delta'(s) = \cos\theta(s)\\,\frac{\sigma_u(\beta(s))}{|\sigma_u(\beta(s))|} + \sin\theta(s)\\,\frac{\sigma_v(\beta(s))}{|\sigma_v(\beta(s))|}
\]
for a smooth function \(\theta(s)\) (unique up to \(2\pi\). This \(\theta\) measures the angle from the \(\sigma_u\)-direction to the tangent vector in the tangent plane.

**Theorem 3.13** (Geodesic Curvature in Orthogonal Coordinates): With notation as above:
1. Writing \(\beta(s) = (u(s), v(s))\), we have \(\cos\theta = \sqrt{g_{11}}\\, u'\) and \(\sin\theta = \sqrt{g_{22}}\\, v'\).
2. The geodesic curvature satisfies
\[
k_g = \theta' + k_1 \cos\theta + k_2 \sin\theta.
\]

This elegant formula decomposes the geodesic curvature into the rate of change of the angle (\(\theta'\) plus the curvature contributions from the coordinate lines.

### Green's Theorem

**Theorem 3.14** (Green's Theorem): Let \(\Delta = \\{(x,y) : x \geq 0, y \geq 0, x+y \leq 1\}\) be the standard triangle, and let \(\phi : U \to V\) be a smooth regular positive change of coordinates containing \(\Delta \subseteq V\) with inverse \(\psi = \phi^{-1}\). Let \(R = \psi(\Delta)\) and let \(\alpha_1, \alpha_2, \alpha_3\) be its edges. For any smooth \(F = (P,Q) : U \to \mathbb{R}^2\),
\[
\iint_R \left(\frac{\partial Q}{\partial u} - \frac{\partial P}{\partial v}\right) du\\, dv = \sum_{j=1}^3 \int_0^1 F(\alpha_j(t)) \cdot \alpha_j'(t)\\, dt.
\]

*Proof.* Set \(G(x,y) = D\psi(x,y)^T F(\psi(x,y))\). By the change of variables formula, \(\iint_R (Q_u - P_v)\\,du\\,dv = \iint_\Delta (M_x - L_y)\\,dx\\,dy\) where \((L,M) = G\). The latter equals \(\sum_j \int_0^1 G(\delta_j) \cdot \delta_j'\\,dt\) by direct computation on the triangle \(\Delta\) using iterated integrals, and each boundary integral for \(G\) matches the corresponding one for \(F\) under the change of coordinates. \(\square\)

### The Gauss-Bonnet Formula

For a surface \(\sigma : U \to \mathbb{R}^3\), a region \(R \subseteq U\), and a curve \(\alpha : [a,b] \to U\), we define the integrals
\[
\int_\alpha k_g\\,dL = \int_a^b k_g(\alpha)(t)\\,|\gamma'(t)|\\,dt, \qquad \iint_R K\\,dA = \iint_R K_\sigma(u,v)\sqrt{\det g}\\,du\\,dv.
\]
These are invariant under changes of parametrization (with appropriate sign adjustments).

**Theorem 3.17** (Gauss-Bonnet Formula in Orthogonal Coordinates): Let \(\sigma : U \to \mathbb{R}^3\) with diagonal \(g\), and let \(\psi : \Delta \to R \subseteq U\) be a smooth regular positive change of coordinates. With \(\alpha_j\) the three edges of \(R\) and \(\Delta\theta_j = \theta_j(1) - \theta_j(0)\) the total angle change along each edge,
\[
\iint_R K\\,dA + \sum_{j=1}^3 \int_{\alpha_j} k_g\\,dL = \sum_{j=1}^3 \Delta\theta_j.
\]

*Proof.* Using Theorem 3.13, each geodesic curvature integral decomposes as \(\int k_g\\,dL = \Delta\theta_j + \int_0^1 F(\alpha_j) \cdot \alpha_j'\\,dt\) where \(F = (P,Q)\) with \(P = -(g_{11})_v/(2\sqrt{g_{11}g_{22}})\) and \(Q = (g_{22})_u/(2\sqrt{g_{11}g_{22}})\). By Green's Theorem, \(\sum_j \int F \cdot \alpha_j'\\,dt = \iint_R (Q_u - P_v)\\,du\\,dv = -\iint_R K\\,dA\) by Theorem 3.10. \(\square\)

**Note 3.18**: If \(\epsilon_1, \epsilon_2, \epsilon_3 \in [0,\pi]\) are the **external angles** at the vertices of \(\sigma(R)\) (the angles between consecutive edge tangent vectors), then one can show (by approximation arguments) that \(\sum_j \Delta\theta_j + \sum_j \epsilon_j = 2\pi\). This yields the classical form:
\[
\iint_R K\\,dA + \sum_{j=1}^3 \int_{\alpha_j} k_g\\,dL + \sum_{j=1}^3 \epsilon_j = 2\pi.
\]

**Theorem 3.20** (Gauss-Bonnet Formula, General): Let \(U \subseteq \mathbb{R}^2\) be open with the standard triangle \(\Delta = \\{u,v \geq 0, u+v \leq 1\}\subseteq U\), and let \(\sigma : U \to \mathbb{R}^3\) be smooth and regular. Let \(\epsilon_1, \epsilon_2, \epsilon_3\) be the external angles of \(\sigma(\Delta)\) at its three vertices. Then:
\[
\iint_\Delta K_\sigma\\, dA + \sum_{j=1}^3 \int_{\alpha_j} k_g\\, dL + \sum_{j=1}^3 \epsilon_j = 2\pi.
\]

This formula holds without assuming orthogonal coordinates, because every point has a neighborhood with orthogonal coordinates (Theorem 3.7), and one can subdivide \(\Delta\) into small triangles each contained in such a neighborhood, apply Theorem 3.17 to each, and add — with interior boundary terms canceling.

### Global Gauss-Bonnet Theorem

**Definition 3.22**: A **smooth regular global surface** (or smooth regular 2-dimensional submanifold) in \(\mathbb{R}^n\) is a set \(S \subseteq \mathbb{R}^n\) covered by smooth regular homeomorphisms \(\sigma : U_\sigma \to S \cap W_\sigma\) (the **coordinate charts**) such that whenever two charts overlap, the transition map is smooth and regular. The collection of charts is an **atlas** for \(S\).

**Definition 3.23**: A **smooth regular triangulated surface** in \(\mathbb{R}^3\) is a global surface \(S\) together with a finite atlas \(\\{\sigma_1, \ldots, \sigma_n\}\) where each \(\sigma_i : U_i \to S \cap W_i\) has \(\Delta \subseteq U_i\), the triangles \(\sigma_i(\Delta)\) cover \(S\) with disjoint interiors, and edges are joined in matched pairs. The **Euler characteristic** is
\[
\chi = V - E + F
\]
where \(V\), \(E\), \(F\) are the numbers of vertices, edges, and faces of the triangulation.

**Theorem 3.24** (Gauss-Bonnet Theorem): For a smooth regular triangulated surface \(S \subseteq \mathbb{R}^3\) with triangulation \(\{\sigma_1, \ldots, \sigma_n\}\),
\[
\iint_S K\\, dA = \sum_{i=1}^n \iint_\Delta K_{\sigma_i}\\, dA = 2\pi\chi.
\]

*Proof.* Apply the Gauss-Bonnet Formula to each triangle. When edges are joined in pairs, the geodesic curvature integrals cancel (by the change-of-coordinates theorem for \(k_g\). Let \(\epsilon_{i,j}\) and \(\phi_{i,j} = \pi - \epsilon_{i,j}\) be the external and internal angles of triangle \(i\) at vertex \(j\). Since \(F=n\), \(E = 3n/2\), and the sum of internal angles at each vertex is \(2\pi\), one obtains \(\sum K\\,dA = 2\pi n - \sum_{i,j} \epsilon_{i,j} = 2\pi F - 2\pi E + 2\pi V = 2\pi\chi\). \(\square\)

**Remark 3.25**: Since \(K_S(p) = K_\sigma(u,v)\) when \(\sigma(u,v)=p\) (and this is independent of the chart chosen), the total curvature \(\iint_S K\\,dA\) is well-defined and independent of triangulation. In particular, the Euler characteristic \(\chi(S)\) is a topological invariant. For a sphere, \(\chi = 2\) and \(\iint K\\,dA = 4\pi\); for a torus, \(\chi = 0\) and \(\iint K\\,dA = 0\). The Gauss-Bonnet theorem is remarkable because it relates a purely geometric quantity (total curvature, involving second derivatives of the surface) to a purely topological one (the Euler characteristic, which counts vertices minus edges plus faces in any triangulation).

---

## Chapter 4: Submanifolds of \(\mathbb{R}^n\)

### Smooth Maps and Regularity

A smooth map \(f : U \subseteq \mathbb{R}^m \to \mathbb{R}^n\) (where \(U\) is open) is called **regular** (or an **immersion**) when its Jacobian matrix \(Df\) is injective at every point, i.e., the columns of \(Df(u)\) are linearly independent for all \(u \in U\). This extends the regularity conditions used for curves (\(m=1\) and surfaces (\(m=2\) to maps of any dimension.

### Submanifolds

**Definition 4.2–4.3**: A set \(M \subseteq \mathbb{R}^n\) is an **\(m\)-dimensional smooth regular submanifold** when, near every point \(p \in M\), it is locally equal to the graph of a smooth function of \(m\) of the \(n\) coordinates in terms of the remaining \(n-m\).

Graphs of smooth functions, open sets in \(\mathbb{R}^m\), and the unit sphere \(S^{n-1} = \{x \in \mathbb{R}^n : |x| = 1\}\) are all examples of submanifolds.

### The Inverse Function Theorem

**Theorem 4.6** (Inverse Function Theorem): Let \(f : U \subseteq \mathbb{R}^n \to \mathbb{R}^n\) with \(U\) open and \(a \in U\). If \(f\) is \(C^1\) and \(Df(a)\) is invertible, then there exists an open set \(U_0 \subseteq U\) with \(a \in U_0\) such that \(V_0 = f(U_0)\) is open, \(f : U_0 \to V_0\) is bijective, and \(g = f^{-1} : V_0 \to U_0\) is \(C^1\) with \(Dg(f(a)) = Df(a)^{-1}\). If \(f\) is \(C^k\) (or \(C^\infty\) then so is \(f^{-1}\).

(A complete proof appears in Appendix 1. The idea is a contraction mapping argument in Banach space.)

### The Implicit and Parametric Function Theorems

**Theorem 4.7** (Implicit Function Theorem): Let \(f : U \subseteq \mathbb{R}^n \to \mathbb{R}^\ell\) be \(C^1\) with \(Df(p)\) of rank \(\ell\). Setting \(c = f(p)\), the level set \(f^{-1}(c)\) is locally the graph of a \(C^1\) function near \(p\).

*Proof.* Reorder variables so that the last \(\ell\) columns of \(Df(p)\) form an invertible \(\ell \times \ell\) matrix. Write \(f(x,y)\) with \(x \in \mathbb{R}^{n-\ell}\) and \(y \in \mathbb{R}^\ell\) with \(\partial z/\partial y\) invertible. Define \(F(x,y) = (x, f(x,y))\); then \(DF(p)\) is invertible, so the IFT applies. The inverse \(G(w,z) = (w, g(w,z))\) satisfies \(f^{-1}(c) = \\{(x, g(x,c))\}\) locally. \(\square\)

**Corollary 4.8** (Implicit Description of Submanifolds): If \(f : U \to \mathbb{R}^\ell\) is smooth with \(\operatorname{rank} Df(x) = \ell\) for all \(x \in U\), then \(f^{-1}(c)\) is a smooth \((n-\ell)\)-dimensional submanifold for every \(c\) in the range. For example, \(S^{n-1} = f^{-1}(1)\) for \(f(x) = |x|^2\), which has \(Df(x) = 2x^T\) of rank 1 everywhere on \(S^{n-1}\).

**Theorem 4.10** (Parametric Function Theorem): Let \(\sigma : U \subseteq \mathbb{R}^m \to \mathbb{R}^n\) be \(C^1\) with \(D\sigma(a)\) of rank \(m\). Then there is an open \(U_0 \subseteq U\) with \(a \in U_0\) such that \(\sigma(U_0)\) equals the graph of a \(C^1\) function and \(\sigma : U_0 \to \sigma(U_0)\) is a homeomorphism.

**Corollary 4.11** (Parametric Description): An \(m\)-dimensional smooth regular submanifold \(M \subseteq \mathbb{R}^n\) is a set covered by smooth regular homeomorphisms \(\sigma : U \to V \subseteq M\) (with \(U \subseteq \mathbb{R}^m\) open). The collection of all such maps is an **atlas** for \(M\), and each map is a **coordinate chart**. When two charts overlap, the transition map \(\rho^{-1}\sigma\) is a smooth regular change of coordinates (Theorem 4.15).

An important subtlety: the homeomorphism condition on \(\sigma\) is essential. The alpha curve \(\alpha(t) = (t^2-1, t(t^2-1))\) is regular and locally injective but not a homeomorphism onto its image near the self-intersection, and the image is not a manifold.

### Smooth Maps Between Manifolds

Let \(M \subseteq \mathbb{R}^k\) and \(N \subseteq \mathbb{R}^\ell\) be smooth submanifolds. A map \(f : M \to N\) is **smooth** when \(\rho^{-1} f \sigma\) is smooth for every chart \(\sigma\) on \(M\) and every chart \(\rho\) on \(N\). A **diffeomorphism** is a bijective smooth map with smooth inverse. The dimension of a submanifold is well-defined (since if two charts overlap, the transition map must be square, forcing \(m = \ell\). Composites of smooth maps are smooth.

### Tangent Spaces and Vector Fields

**Definition 4.30**: The **tangent space** \(T_p M\) at \(p \in M\) is the set of all tangent vectors \(\gamma'(0)\) for smooth curves \(\gamma : J \to M\) with \(\gamma(0) = p\). For any chart \(\sigma\) with \(\sigma(a) = p\),
\[
T_p M = \operatorname{Range} D\sigma(a).
\]
This is an \(m\)-dimensional subspace of \(\mathbb{R}^n\), and \(D\sigma(a)\) is an isomorphism from \(\mathbb{R}^m\) to \(T_p M\).

For example, \(T_p S^{n-1} = \{p\}^\perp = \ker(p^T)\), the hyperplane perpendicular to \(p\).

A tangent vector \(X_p \in T_p M\) acts as a **directional derivative operator**: for any smooth \(f : M \to \mathbb{R}\),
\[
X_p(f) = \frac{d}{dt}\Big|_{t=0} f(\gamma(t))
\]
for any smooth \(\gamma\) with \(\gamma(0) = p\), \(\gamma'(0) = X_p\). In local coordinates \(\sigma\), \(X_p(f) = D(f \circ \sigma)(a) \cdot A\) where \(D\sigma(a) A = X_p\).

A **vector field** on \(M\) is a smooth assignment \(p \mapsto X_p \in T_p M\); in local coordinates \(\sigma\), it corresponds to a smooth map \(A_\sigma : U_\sigma \to \mathbb{R}^m\) with \(X(\sigma(u)) = D\sigma(u) A_\sigma(u)\).

The **pushforward** of a vector \(X_p \in T_p M\) by a smooth map \(f : M \to N\) is
\[
f_* X_p = \frac{d}{dt}\Big|_{t=0} f(\gamma(t)) \in T_{f(p)} N.
\]
In local coordinates, \(f_* X_p = D(f \circ \sigma)(a) A_\sigma\).

### The Riemannian Metric on Manifolds

**Definition 4.45**: For a chart \(\sigma : U_\sigma \to M\), the **Riemannian metric** is \(g_\sigma(u) = D\sigma(u)^T D\sigma(u)\), giving an inner product on \(T_u U_\sigma = \mathbb{R}^m\). This is consistent across charts: if \(\rho = \sigma \circ \psi\) then \(g_\rho = D\psi^T g_\sigma D\psi\). The length of a curve on \(M\) and integrals of functions over \(M\) are computed using this metric, and are independent of the chart chosen.

---

## Chapter 5: Integration of Differential Forms

### Line Integrals and Flux Integrals

The **line integral** of a smooth map \(F : U \subseteq \mathbb{R}^n \to \mathbb{R}^n\) along a curve \(\alpha : [a,b] \to U\) is
\[
\int_\alpha F \cdot dL = \int_a^b F(\alpha(t)) \cdot \alpha'(t)\\, dt.
\]
The **flux integral** of \(F : U \subseteq \mathbb{R}^2 \to \mathbb{R}^2\) through a curve \(\alpha : [a,b] \to U\) is
\[
\int_\alpha F \cdot dN = \int_a^b F(\alpha(t)) \cdot \alpha'(t)^\times\\, dt
\]
where \(v^\times = (-v_2, v_1)\). These are the basic examples of integrating a 1-form along a curve.

### Differential Forms

A **smooth \(k\)-form** on an open set \(U \subseteq \mathbb{R}^m\) is a smooth map \(\omega : U \to \Lambda^k(\mathbb{R}^m)\), i.e., a smooth assignment of an alternating \(k\)-multilinear function to each point. In coordinates it has the form
\[
\omega = \sum_{I} a_I(u)\\, du_I
\]
where the sum is over increasing multi-indices \(I = (i_1 < i_2 < \cdots < i_k)\), and \(du_I = du_{i_1} \wedge \cdots \wedge du_{i_k}\). A smooth 0-form is just a smooth function.

The **integral** of a smooth \(k\)-form \(\omega\) over a smooth regular \(k\)-surface \(\sigma : U_0 \subseteq \mathbb{R}^k \to \mathbb{R}^m\) on a region \(R \subseteq U_0\) is
\[
\int_\sigma \omega = \int_R \omega(\sigma(u))\big(D\sigma(u) e_1, \ldots, D\sigma(u) e_k\big)\\, du_1 \cdots du_k.
\]

### The Wedge Product and Exterior Derivative

The **wedge product** of a \(j\)-form \(\alpha\) and a \(k\)-form \(\beta\) is the \((j+k)\)-form \(\alpha \wedge \beta\), characterized by anti-commutativity:
\[
\alpha \wedge \beta = (-1)^{jk} \beta \wedge \alpha.
\]

The **exterior derivative** \(d\) sends smooth \(k\)-forms to smooth \((k+1)\)-forms. For a 0-form \(f\), \(df = \sum_i \frac{\partial f}{\partial u_i} du_i\). For a \(k\)-form \(\omega = \sum_I a_I du_I\),
\[
d\omega = \sum_I da_I \wedge du_I = \sum_I \sum_j \frac{\partial a_I}{\partial u_j} du_j \wedge du_I.
\]
The key property is \(d^2 = 0\) (i.e., \(d(d\omega) = 0\) for any smooth form).

The classical vector calculus operations are special cases of \(d\) in \(\mathbb{R}^3\): the gradient of a function is \(d\) on 0-forms, the curl corresponds to \(d\) on 1-forms, and the divergence corresponds to \(d\) on 2-forms.

### Stokes-Type Theorems

The following classical theorems are all special cases of a single unified theorem:

**Conservative Field Theorem**: \(\int_\alpha dF = F(\alpha(b)) - F(\alpha(a))\) for smooth \(F\) and curve \(\alpha\).

**Green's Theorem**: For \(F = (P,Q)\) on a region \(R \subseteq \mathbb{R}^2\) with positively-oriented boundary \(\partial R\):
\[
\iint_R \left(\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y}\right) dA = \oint_{\partial R} P\\,dx + Q\\,dy.
\]

**Divergence Theorem**: For \(F : U \subseteq \mathbb{R}^3 \to \mathbb{R}^3\) on a region \(W\) with boundary surface \(\partial W\):
\[
\iiint_W \operatorname{div} F\\, dV = \oiint_{\partial W} F \cdot dA.
\]

**Stokes' Theorem**: For a surface \(\Sigma\) in \(\mathbb{R}^3\) with boundary curve \(\partial\Sigma\):
\(
\iint_\Sigma \(\nabla \times F) \cdot dA = \oint_{\partial \Sigma} F \cdot dL.
\)

### Simplices, Chains, and the Boundary Operator

The standard \(k\)-**simplex** is \(\Delta^k = \\{(t_1, \ldots, t_k) : t_i \geq 0,\ \sum t_i \leq 1\}\). A smooth \(k\)-**surface** on \(\Delta^k\) is a smooth map \(\sigma : \Delta^k \to U \subseteq \mathbb{R}^m\) whose restriction to the interior is regular. A \(k\)-**chain** is a formal finite \(\mathbb{Z}\)-linear combination of \(k\)-surfaces. The **boundary** \(\partial\sigma\) is the alternating sum of the \((k-1)\)-dimensional faces of \(\sigma\):
\[
\partial \sigma = \sum_{j=0}^k (-1)^j \sigma \circ F_j
\]
where \(F_j\) maps \(\Delta^{k-1}\) to the \(j^{\text{th}}\) face of \(\Delta^k\). The key identity is \(\partial^2 = 0\).

**Theorem 5** (Stokes' Theorem for Chains in \(\mathbb{R}^m\): For a smooth \(k\)-surface \(\sigma\) on \(\Delta^k\) and a smooth \((k-1)\)-form \(\omega\) on an open neighborhood of the image,
\[
\int_\sigma d\omega = \int_{\partial \sigma} \omega.
\]

*Proof sketch.* By linearity, one reduces to the case \(\omega = a\, du_1 \wedge \cdots \wedge \widehat{du_j} \wedge \cdots \wedge du_k\). Applying the fundamental theorem of calculus in the \(j\)-th variable and summing with signs gives the result, with boundary face integrals accounting for the sign pattern via the Cauchy-Binet formula.

### Pullback

The **pullback** of a smooth \(k\)-form \(\beta\) on \(V\) by a smooth map \(f : U \to V\) is the \(k\)-form \(f^*\beta\) on \(U\) defined by
\[
(f^*\beta)_u(v_1, \ldots, v_k) = \beta_{f(u)}(Df(u)v_1, \ldots, Df(u)v_k).
\]
In coordinates, if \(\beta = \sum_I b_I dy_I\) then \(f^*\beta = \sum_I (b_I \circ f) d(f_{i_1}) \wedge \cdots \wedge d(f_{i_k})\). Pullback is natural: \(f^*(d\omega) = d(f^*\omega)\) and \(f^*(\alpha \wedge \beta) = f^*\alpha \wedge f^*\beta\).

**Theorem 5.35** (Pullback Formulas): Let \(\sigma : U_0 \to \mathbb{R}^m\) be a \(k\)-surface and \(f : U \to V\) smooth. Then
\[
\int_{f \circ \sigma} \omega = \int_\sigma f^*\omega, \qquad \int_\sigma f^*\omega = \int_{f_*\sigma} \omega.
\]

### Stokes' Theorem on Submanifolds

For a smooth \(k\)-form \(\omega\) defined on an open set containing a smooth regular \((k-1)\)-dimensional submanifold \(M \subseteq \mathbb{R}^m\) with boundary \(\partial M\),
\[
\int_M d\omega = \int_{\partial M} \omega.
\]
This unifies all the classical theorems: they are all instances of "the integral of the exterior derivative equals the integral on the boundary."

---

## Chapter 6: Tensor Algebras and Differential Forms

### Dual Spaces and Multilinear Maps

For a finite-dimensional vector space \(U\) over a field \(F\), the **dual space** is \(U^* = \operatorname{Hom}(U, F)\), the space of linear functions \(f : U \to F\). If \(\\{e_i\}\) is a basis for \(U\), the **dual basis** \(\\{e_i^*\}\) is defined by \(e_i^*(e_j) = \delta_{ij}\). We have \(\dim U^* = \dim U\) and the natural isomorphism \(U \cong (U^*)^*\).

More generally, a **multilinear map** (or **tensor**) of type \((k)\) on \(U\) is a map \(T : U^k \to F\) that is linear in each argument separately. The space of all such tensors is written \(T^k(U) = (U^*)^{\otimes k}\).

### Tensor, Symmetric, and Exterior Algebras

**Definition**: For vector spaces \(U_1, \ldots, U_k\), the **tensor product** \(U_1 \otimes \cdots \otimes U_k\) is the vector space generated by symbols \(u_1 \otimes \cdots \otimes u_k\) subject to multilinearity relations. The **tensor algebra** is \(TU = \bigoplus_{k=0}^\infty T^k U\) with product given by tensor product.

The space of **symmetric \(k\)-forms** \(S^k U\) consists of tensors symmetric under permutation of arguments, and the space of **alternating \(k\)-forms** (or \(k\)-covectors) is \(\Lambda^k U\), consisting of tensors that change sign under any transposition of two arguments. The exterior (wedge) product makes \(\Lambda U = \bigoplus_{k=0}^\infty \Lambda^k U\) into the **exterior algebra**.

When \(\\{e_1, \ldots, e_n\}\) is a basis for \(U\):
- \(T^k U\) has basis \(\\{e_{i_1}^* \otimes \cdots \otimes e_{i_k}^*\}\), dimension \(n^k\).
- \(S^k U\) has dimension \(\binom{n+k-1}{k}\).
- \(\Lambda^k U\) has basis \(\\{e_{i_1}^* \wedge \cdots \wedge e_{i_k}^* : i_1 < i_2 < \cdots < i_k\}\), dimension \(\binom{n}{k}\).

### The Cotangent Space and Coordinate Bases

For a smooth submanifold \(M \subseteq \mathbb{R}^n\) with chart \(\sigma : U \to M\) and \(\sigma(a) = p\), the **cotangent space** at \(p\) is the dual space \(T_p^* M = (T_p M)^*\).

The standard coordinates \((u_1, \ldots, u_m)\) on \(U\) provide:
- **Coordinate tangent vectors** \(\partial/\partial u_i|_p = D\sigma(a) e_i \in T_p M\) (a basis for \(T_p M\).
- **Coordinate 1-forms** \(du_i|_p \in T_p^* M\) (the dual basis), defined by \(du_i(\partial/\partial u_j) = \delta_{ij}\).

Under a change of coordinates \(\phi\), the tangent vectors transform covariantly (\(\partial/\partial u_i = \sum_j (\partial v_j/\partial u_i) \partial/\partial v_j\) and the 1-forms transform contravariantly (\(du_i = \sum_j (\partial u_i/\partial v_j) dv_j\).

For a multi-index \(I = (i_1 < \cdots < i_k)\), the forms \(du_I = du_{i_1} \wedge \cdots \wedge du_{i_k}\) form a basis for \(\Lambda^k T_p^* M\).

### Smooth Differential Forms on Manifolds

A **smooth \(k\)-form on \(M\)** is a smooth assignment \(p \mapsto \omega_p \in \Lambda^k T_p^* M\). In local coordinates \(\sigma\), this has the form \(\omega = \sum_I a_I(u) du_I\) for smooth coefficient functions \(a_I\). This definition is consistent with and equivalent to the one in Chapter 5.

### Pullback in the Algebraic Framework

For a smooth map \(f : M \to N\), the **pullback** \(f^* : \Lambda^k T_{f(p)}^* N \to \Lambda^k T_p^* M\) is defined by
\[
(f^*\omega)_p(v_1, \ldots, v_k) = \omega_{f(p)}(f_* v_1, \ldots, f_* v_k).
\]
This is compatible with the exterior derivative: \(f^*(d\omega) = d(f^*\omega)\). The definitions of smooth \(k\)-forms and their exterior derivatives given in this chapter via the algebraic framework are consistent with the definitions given in Chapter 5 via coordinate formulas. The algebraic approach makes the coordinate-independence manifest.

---

## Appendix 1: Review of Differentiation

### Differentiability

**Definition A1.1**: A function \(f : U \subseteq \mathbb{R}^m \to \mathbb{R}^n\) is **differentiable** at \(a \in U\) if there exists a matrix \(A \in M_{n \times m}(\mathbb{R})\) such that
\[
\lim_{h \to 0} \frac{|f(a+h) - f(a) - Ah|}{|h|} = 0.
\]
When it exists, this matrix \(A\) is unique and equals the Jacobian matrix \(Df(a)\). If \(f\) is differentiable at \(a\) then \(f\) is continuous at \(a\). The Jacobian matrix satisfies \(Df(a)_{ij} = \partial x_i/\partial u_j(a)\). One key bound is: for any matrix \(A\),
\[
|Ah| \leq \\|A\\| \cdot |h| \quad \text{where} \quad \\|A\\|^2 \leq n \sum_{i,j} A_{ij}^2.
\]

**Theorem A1.3** (Chain Rule): Let \(f : U \subseteq \mathbb{R}^m \to \mathbb{R}^k\) be differentiable at \(a\) and \(g : V \subseteq \mathbb{R}^k \to \mathbb{R}^n\) be differentiable at \(f(a)\). Then \(g \circ f\) is differentiable at \(a\) with
\[
D(g \circ f)(a) = Dg(f(a)) \cdot Df(a).
\]

The directional derivative of \(f\) at \(a\) in direction \(v\) is \(D_v f(a) = Df(a) v\). If \(f\) is \(C^1\) (all partial derivatives exist and are continuous) then \(f\) is differentiable.

**Mean Value Theorem**: If \(f : U \to \mathbb{R}^n\) is differentiable on the line segment \([a, a+h] \subseteq U\), then \(|f(a+h) - f(a)| \leq \sup_{0 \leq t \leq 1} \\|Df(a+th)\\| \cdot |h|\).

**Corollary** (Vanishing Derivative): If \(U\) is connected and \(Df \equiv 0\), then \(f\) is constant.

### The Inverse Function Theorem: Full Proof

**Theorem A1.6** (Inverse Function Theorem): Let \(f : U \subseteq \mathbb{R}^n \to \mathbb{R}^n\) be \(C^1\) with \(Df(a)\) invertible.

The proof proceeds via eight claims:

*Claim 1.* There exists \(r > 0\) such that \(Df(x)\) is invertible for all \(x \in B(a,r)\) and \(\\|Df(x)^{-1}\\| \leq 2\\|Df(a)^{-1}\\|\). (By continuity of \(Df\).)

*Claim 2.* For the map \(g(x) = x - Df(a)^{-1}(f(x) - y)\), we have \(\\|Dg(x)\\| \leq 1/2\) for \(x \in B(a,r)\).

*Claim 3.* \(g\) is a contraction: \(|g(x_1) - g(x_2)| \leq \frac{1}{2}|x_1 - x_2|\) for \(x_1, x_2 \in B(a,r)\).

*Claim 4.* For each \(y \in B(f(a), \delta)\) (for suitable \(\delta\), the equation \(f(x) = y\) has a unique solution \(x \in B(a,r)\), obtained as the fixed point of the contraction \(g\).

*Claim 5.* Setting \(h = f^{-1}: B(f(a),\delta) \to B(a,r)\), the map \(h\) is continuous.

*Claim 6.* \(h\) is differentiable with \(Dh(y) = Df(h(y))^{-1}\).

*Claims 7–8.* \(h\) is \(C^1\), and if \(f\) is \(C^k\) then \(h\) is \(C^k\) (by induction using the formula \(Dh(y) = Df(h(y))^{-1}\) and the cofactor formula for matrix inverses).

### The Parametric and Implicit Function Theorems

**Parametric Function Theorem** (Appendix version): Same as Theorem 4.10. When \(D\sigma(a)\) has rank \(m\), the top \(m \times m\) submatrix of \(D\sigma(a)\) (after reordering) is invertible. Apply the IFT to the first \(m\) components to invert locally, then express the remaining components as a function of the first \(m\).

**Implicit Function Theorem** (Appendix version): Same as Theorem 4.7. Reduce to the Parametric Function Theorem by showing the level set is locally the graph of a smooth function via the IFT.

---

## Appendix 2: The Generalized Cross Product

### Parallelotopes and Volume

**Definition A2.1**: Given vectors \(u_1, \ldots, u_k \in \mathbb{R}^n\), the **parallelotope** is
\[
P(u_1, \ldots, u_k) = \left\\{ \sum_{i=1}^k t_i u_i : 0 \leq t_i \leq 1 \right\}.
\]
Its volume is defined recursively by \(V(u_1) = |u_1|\) and
\[
V(u_1, \ldots, u_k) = V(u_1, \ldots, u_{k-1}) \cdot |\operatorname{Proj}_{U^\perp} u_k|
\]
where \(U = \operatorname{Span}\\{u_1, \ldots, u_{k-1}\}\).

**Theorem A2.2**: For \(A = (u_1, \ldots, u_k) \in M_{n \times k}(\mathbb{R})\),
\[
V(u_1, \ldots, u_k) = \sqrt{\det(A^T A)}.
\]

*Proof.* Induction on \(k\). The base case \(k=1\) is clear. For the inductive step, write \(B = (A, u_k) = (A, v+w)\) where \(v = \operatorname{Proj}_U u_k \in \operatorname{Col}(A)\) and \(w = u_k - v \in U^\perp = \operatorname{Null}(A^T)\). Since \(v \in \operatorname{Col}(A)\), adding it to the last column is an elementary operation not changing the determinant, so \(\det(B^T B) = \det((A,w)^T(A,w))\). Using \(A^T w = 0\):
\[
\det(B^T B) = \det\begin{pmatrix} A^T A & 0 \\ 0 & |w|^2 \end{pmatrix} = \det(A^T A) \cdot |w|^2.
\]
Taking square roots: \(\sqrt{\det(B^T B)} = \sqrt{\det(A^T A)} \cdot |w| = V(u_1,\ldots,u_{k-1}) \cdot |w| = V(u_1,\ldots,u_k)\). \(\square\)

In the special case \(k = n\), \(\det(A^T A) = (\det A)^2\), so \(V = |\det A|\). For a simplex \([a_0, \ldots, a_k]\) with \(u_i = a_i - a_0\), the volume is \(\frac{1}{k!} V(u_1, \ldots, u_k) = \frac{1}{k!}\sqrt{\det(A^T A)}\).

### The Generalized Cross Product

**Definition A2.5**: For \(n \geq 2\) and a field \(F\), the **cross product** is the map \(X : M_{n \times (n-1)}(F) \to F^n\) defined by: for \(A = (u_1, \ldots, u_{n-1})\),
\[
X(A)_j = (-1)^{n+j} \det A(j)
\]
where \(A(j)\) is \(A\) with the \(j\)-th row removed. In \(F^2\) we write \(X(u) = u^\times = (-u_2, u_1)\); in \(F^3\) we write \(X(u,v) = u \times v\), recovering the usual cross product:
\[
u \times v = (u_2 v_3 - u_3 v_2,\\; u_3 v_1 - u_1 v_3,\\; u_1 v_2 - u_2 v_1).
\]

Since the determinant is \((n-1)\)-linear and alternating, the cross product is also **\((n-1)\)-linear and alternating**.

**Theorem A2.9** (Properties of the Cross Product): For \(u_1, \ldots, u_{n-1}, v_1, \ldots, v_{n-1}, w \in \mathbb{R}^n\) and \(A = (u_1, \ldots, u_{n-1}), B = (v_1, \ldots, v_{n-1}) \in M_{n \times (n-1)}\):

1. **Dot product formula**: \(X(u_1, \ldots, u_{n-1}) \cdot w = \det(u_1, \ldots, u_{n-1}, w)\).
2. **Orthogonality**: \(X(u_1, \ldots, u_{n-1}) \cdot u_k = 0\) for each \(1 \leq k < n\).
3. **Zero iff dependent**: \(X(u_1, \ldots, u_{n-1}) = 0\) iff \(\{u_1, \ldots, u_{n-1}\}\) is linearly dependent.
4. **Positive orientation**: When \(w = X(u_1, \ldots, u_{n-1}) \neq 0\), the \(n\)-tuple \((u_1, \ldots, u_{n-1}, w)\) is a positively oriented basis for \(\mathbb{R}^n\).
5. **Volume formula**: \(|X(u_1, \ldots, u_{n-1})| = V(u_1, \ldots, u_{n-1})\).
6. **Generalized Binet formula**: \(X(u_1,\ldots,u_{n-1}) \cdot X(v_1,\ldots,v_{n-1}) = \det(B^T A)\).
7. **Iterated cross product**:
\[
X\big(u_1,\ldots,u_{n-2}, X(v_1,\ldots,v_{n-1})\big) = \sum_{i=1}^{n-1} (-1)^{n+i} \det\big((B^T A)^{(i)}\big) v_i
\]
where \((B^T A)^{(i)}\) denotes \(B^T A\) with the \(i\)-th row removed.

*Proof of Property 1.* From \(X(A)_j = (-1)^{n+j} \det A(j)\),
\[
X(A) \cdot w = \sum_{j=1}^n (-1)^{n+j} \det A(j) w_j = \det(u_1, \ldots, u_{n-1}, w)
\]
by cofactor expansion along the last column. Property 2 follows since \(\det\) with a repeated column is zero.

*Proof of Property 6.* Let \(x = X(A)\) and \(y = X(B)\). By Property 1, \(x \cdot y = \det(A,y)\) and \(x \cdot y = \det(B,x)\). By Properties 1 and 2, \(A^T x = 0 = B^T y\). Then:
\[
(x \cdot y)^2 = \det(A,y)\det(B,x) = \det\begin{pmatrix} B^T A & B^T y \\ x^T A & x^T y \end{pmatrix} = \det\begin{pmatrix} B^T A & 0 \\ 0 & x \cdot y \end{pmatrix} = (x \cdot y) \det(B^T A).
\]
When \(x \cdot y \neq 0\), divide to get \(x \cdot y = \det(B^T A)\). When \(x \cdot y = 0\), one shows directly that \(\det(B^T A) = 0\) as well (either \(x=0\) or \(y=0\) gives rank deficiency, or \(y \in \operatorname{Col}(A)\cap \operatorname{Null}(B^T)\) gives a nonzero vector in the kernel of \(B^T A\). Alternatively, both sides are polynomials in the entries of the vectors and unique factorization completes the argument.

### Change of Variables Formula

**Theorem**: For invertible \(P \in M_n(\mathbb{R})\) and \(A \in M_{n \times (n-1)}(\mathbb{R})\),
\[
P^T X(PA) = (\det P) X(A).
\]

*Proof.* The \(i\)-th entry of \(P^T X(PA)\) is \(v_i^T X(PA) = \det(PA, v_i)\) where \(v_i\) is the \(i\)-th column of \(P\). Expanding via cofactors and using the cofactor identity \(\operatorname{Cof}(P) P = \det(P) I\), one shows that the \(i\)-th entry equals \((\det P) X(A)_i\). Both sides are polynomials in the entries, so the identity extends by continuity to all \(P\) (including non-invertible ones). Replacing \(P\) by \(P^T\) yields the equivalent form \(P X(P^T A) = (\det P) X(A)\).

This change of variables formula is used in the proof of Property 7 above: one expresses \(X(A,y)\) in terms of the basis \(\{v_1,\ldots,v_{n-1},y\}\) using the matrix \(P = (B, y)\) (whose determinant is \(|y|^2\) by Property 1) and then applies the change of variables formula.

