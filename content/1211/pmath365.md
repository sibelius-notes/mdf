---
title: "PMATH 365: Differential Geometry"
prof: "Spiro Karigiannis"
---

# PMATH 365: Differential Geometry

This course develops the classical theory of curves and surfaces, leading to the Gauss-Bonnet theorem, then generalizes this geometry to submanifolds of <span>&#92;(&#92;mathbb{R}^n&#92;)</span> using the language of differential forms and tensor algebras.

---

## Chapter 1: Curves

### Curves in <span>&#92;(&#92;mathbb{R}^n&#92;)</span>

A **parametrized curve** in <span>&#92;(&#92;mathbb{R}^n&#92;)</span> is a continuous map <span>&#92;(&#92;alpha : I &#92;subseteq &#92;mathbb{R} &#92;to &#92;mathbb{R}^n&#92;)</span> where <span>&#92;(I&#92;)</span> is a nonempty interval. Writing <span>&#92;(&#92;alpha(t) = (x&#95;1(t), x&#95;2(t), &#92;ldots, x&#95;n(t))&#92;)</span>, we say <span>&#92;(&#92;alpha&#92;)</span> is **<span>&#92;(C^k&#92;)</span>** when all derivatives up to order <span>&#92;(k&#92;)</span> exist and are continuous, **smooth** or **<span>&#92;(C^&#92;infty&#92;)</span>** when it is <span>&#92;(C^k&#92;)</span> for all <span>&#92;(k&#92;)</span>, and **regular** when it is <span>&#92;(C^1&#92;)</span> with <span>&#92;(&#92;alpha'(t) &#92;neq 0&#92;)</span> for all <span>&#92;(t &#92;in I&#92;)</span>. Unless otherwise stated, all curves are assumed smooth and regular.

The tangent vector <span>&#92;(&#92;alpha'(a)&#92;)</span> exists at any point where <span>&#92;(&#92;alpha&#92;)</span> is differentiable, and regularity guarantees this tangent vector is always nonzero. A curve that fails regularity may cross itself or have corners: the curve <span>&#92;(&#92;alpha(t) = (t, |t|)&#92;)</span> has no derivative at <span>&#92;(t=0&#92;)</span>, the curve <span>&#92;(&#92;beta(t) = (t^3, t^2)&#92;)</span> has <span>&#92;(&#92;beta'(0) = 0&#92;)</span>, and the curve <span>&#92;(&#92;gamma(t) = (t, t^2 &#92;sin(1/t))&#92;)</span> for <span>&#92;(t &#92;neq 0&#92;)</span> with <span>&#92;(&#92;gamma(0)=0&#92;)</span> is differentiable but not <span>&#92;(C^1&#92;)</span>.

**Theorem 1.3** (Local Injectivity): Every regular curve in <span>&#92;(&#92;mathbb{R}^n&#92;)</span> is locally injective.

*Proof.* Let <span>&#92;(a &#92;in I&#92;)</span>. Since <span>&#92;(&#92;alpha'(a) &#92;neq 0&#92;)</span>, some coordinate function satisfies <span>&#92;(x&#95;k'(a) &#92;neq 0&#92;)</span>, say <span>&#92;(x&#95;k'(a) > 0&#92;)</span>. By continuity of <span>&#92;(x&#95;k'&#92;)</span>, there exists <span>&#92;(&#92;delta > 0&#92;)</span> such that <span>&#92;(x&#95;k'(t) > 0&#92;)</span> for <span>&#92;(|t-a| < &#92;delta&#92;)</span>. Thus <span>&#92;(x&#95;k&#92;)</span> is strictly increasing on <span>&#92;((a-&#92;delta, a+&#92;delta)&#92;)</span>, making <span>&#92;(&#92;alpha&#92;)</span> injective there. <span>&#92;(&#92;square&#92;)</span>

Regularity is not necessary for global injectivity (the three non-regular examples above are all globally injective). Conversely, regular curves can fail to be globally injective: the alpha curve <span>&#92;(&#92;alpha(t) = (t^2-1, t(t^2-1))&#92;)</span> crosses itself at the origin.

The **length** of a curve <span>&#92;(&#92;alpha : [a,b] &#92;to &#92;mathbb{R}^n&#92;)</span> is defined as the supremum of lengths of all piecewise linear approximations:
<span>&#92;[
L = L_&#92;alpha[a,b] = &#92;sup &#92;left&#92;{ &#92;sum_{j=1}^p |&#92;alpha(t_j) - &#92;alpha(t_{j-1})| &#92;,&#92;Big|&#92;, a = t_0 < t_1 < &#92;cdots < t_p = b &#92;right&#92;}.
&#92;]</span>

**Theorem 1.8** (Arclength Formula): For a regular curve <span>&#92;(&#92;alpha : [a,b] &#92;to &#92;mathbb{R}^n&#92;)</span>,
<span>&#92;[
L = L&#95;&#92;alpha[a,b] = &#92;int&#95;a^b |&#92;alpha'(t)|&#92;, dt.
&#92;]</span>

*Proof.* The proof proceeds by showing the supremum of the piecewise linear sums <span>&#92;(L(&#92;alpha, P)&#92;)</span> and the Riemann sums <span>&#92;(S(&#92;alpha, P)&#92;)</span> for <span>&#92;(&#92;int |&#92;alpha'|&#92;)</span> both approximate the same limit. Given <span>&#92;(&#92;epsilon > 0&#92;)</span>, by uniform continuity of each <span>&#92;(x&#95;k'&#92;)</span> and Riemann integrability of <span>&#92;(|&#92;alpha'|&#92;)</span>, one finds a partition <span>&#92;(P&#92;)</span> fine enough that <span>&#92;(L - L(&#92;alpha,P) < &#92;epsilon/3&#92;)</span>, <span>&#92;(|&#92;int |&#92;alpha'| - S(&#92;alpha,P)| < &#92;epsilon/3&#92;)</span>, and <span>&#92;(|L(&#92;alpha,P) - S(&#92;alpha,P)| < &#92;epsilon/3&#92;)</span>, yielding <span>&#92;(|L - &#92;int |&#92;alpha'|| < &#92;epsilon&#92;)</span>. <span>&#92;(&#92;square&#92;)</span>

A **reparametrization** of <span>&#92;(&#92;alpha&#92;)</span> is a curve <span>&#92;(&#92;beta(s) = &#92;alpha(t(s))&#92;)</span> where <span>&#92;(s : I &#92;to J&#92;)</span> is a homeomorphism. When <span>&#92;(s'(t) &#92;neq 0&#92;)</span> for all <span>&#92;(t&#92;)</span>, the reparametrization is **regular**; it **preserves direction** when <span>&#92;(s'(t) > 0&#92;)</span> and **reverses direction** when <span>&#92;(s'(t) < 0&#92;)</span>. We say <span>&#92;(&#92;beta&#92;)</span> is **parametrized by arclength** when <span>&#92;(|&#92;beta'(s)| = 1&#92;)</span> for all <span>&#92;(s&#92;)</span>.

**Theorem 1.11**: Every regular curve can be reparametrized by arclength using a regular direction-preserving change of coordinates.

*Proof.* Fix <span>&#92;(a &#92;in I&#92;)</span> and define <span>&#92;(s(t) = &#92;int&#95;a^t |&#92;alpha'(r)|&#92;, dr&#92;)</span>. Then <span>&#92;(s'(t) = |&#92;alpha'(t)| > 0&#92;)</span>, so <span>&#92;(s&#92;)</span> is regular and strictly increasing. Its inverse satisfies <span>&#92;(t'(s) = 1/|&#92;alpha'(t)|&#92;)</span>, and the reparametrized curve <span>&#92;(&#92;beta(s) = &#92;alpha(t(s))&#92;)</span> has <span>&#92;(|&#92;beta'(s)| = |&#92;alpha'(t(s))| &#92;cdot t'(s) = 1&#92;)</span>. <span>&#92;(&#92;square&#92;)</span>

### Curves in <span>&#92;(&#92;mathbb{R}^2&#92;)</span>

Let <span>&#92;(&#92;beta : J &#92;to &#92;mathbb{R}^2&#92;)</span> be a smooth regular curve parametrized by arclength. For a vector <span>&#92;(u = (x,y)&#92;)</span>, write <span>&#92;(u^&#92;times = (-y, x)&#92;)</span>. The **unit tangent vector** and **unit normal vector** are
<span>&#92;[
T(s) = T&#95;&#92;beta(s) = &#92;beta'(s), &#92;qquad N(s) = N&#95;&#92;beta(s) = T(s)^&#92;times.
&#92;]</span>
Since <span>&#92;(|T(s)|=1&#92;)</span>, differentiating gives <span>&#92;(T'(s) &#92;perp T(s)&#92;)</span>, so <span>&#92;(T'(s) = k(s) N(s)&#92;)</span> for some scalar. The **signed curvature** is the real number <span>&#92;(k(s) = k&#95;&#92;beta(s)&#92;)</span> defined by
<span>&#92;[
&#92;beta''(s) = k(s) N(s).
&#92;]</span>
The **scalar curvature** is <span>&#92;(&#92;kappa(s) = |k(s)| = |&#92;beta''(s)|&#92;)</span>. For an arbitrary regular curve <span>&#92;(&#92;alpha : I &#92;to &#92;mathbb{R}^2&#92;)</span>, one first reparametrizes by arclength and then defines <span>&#92;(T, N, k, &#92;kappa&#92;)</span> in terms of the reparametrized curve.

**Theorem 1.14** (Curvature Formulas): For a smooth regular curve <span>&#92;(&#92;alpha : I &#92;to &#92;mathbb{R}^2&#92;)</span> with <span>&#92;(&#92;alpha' = (x', y')&#92;)</span>,
<span>&#92;[
k = k&#95;&#92;alpha = &#92;frac{x'y'' - y'x''}{(x'^2 + y'^2)^{3/2}}, &#92;qquad &#92;kappa = |k&#95;&#92;alpha| = &#92;frac{|x'y'' - y'x''|}{(x'^2+y'^2)^{3/2}}.
&#92;]</span>

The **osculating circle** of <span>&#92;(&#92;beta&#92;)</span> at <span>&#92;(s&#95;0&#92;)</span> is the circle through <span>&#92;(&#92;beta(s&#95;0)&#92;)</span> with center <span>&#92;(&#92;beta(s&#95;0) + &#92;frac{1}{k(s&#95;0)} N(s&#95;0)&#92;)</span> (when <span>&#92;(k(s&#95;0) &#92;neq 0&#92;)</span>) and radius <span>&#92;(1/|k(s&#95;0)|&#92;)</span>. It is the best-fit circle to the curve at that point.

**Theorem 1.17** (Polar Coordinates for Plane Curves): Let <span>&#92;(&#92;beta : J &#92;to &#92;mathbb{R}^2&#92;)</span> be a smooth regular curve with <span>&#92;(|&#92;beta'(s)| = 1&#92;)</span>. There exists a smooth function <span>&#92;(&#92;theta : J &#92;to &#92;mathbb{R}&#92;)</span>, unique up to adding an integer multiple of <span>&#92;(2&#92;pi&#92;)</span>, such that
<span>&#92;[
&#92;beta'(s) = (&#92;cos&#92;theta(s),&#92; &#92;sin&#92;theta(s)).
&#92;]</span>
In this case <span>&#92;(&#92;theta'(s) = k(s)&#92;)</span>.

For a closed curve <span>&#92;(&#92;alpha : [0, L] &#92;to &#92;mathbb{R}^2&#92;)</span> (with <span>&#92;(&#92;alpha(0)=&#92;alpha(L)&#92;)</span>), the **winding number** <span>&#92;(w(&#92;alpha, p)&#92;)</span> around a point <span>&#92;(p&#92;)</span> not on the curve counts how many times the curve winds around <span>&#92;(p&#92;)</span>. The **turning number** (or rotation number) is
<span>&#92;[
n(&#92;alpha) = &#92;frac{1}{2&#92;pi}&#92;int&#95;0^L k(s)&#92;, ds = &#92;frac{&#92;theta(L) - &#92;theta(0)}{2&#92;pi},
&#92;]</span>
the total turning of the tangent vector divided by <span>&#92;(2&#92;pi&#92;)</span>.

**Theorem 1.19** (Turning Number Theorem): For a smooth closed regular curve in <span>&#92;(&#92;mathbb{R}^2&#92;)</span> that does not self-intersect, the turning number is <span>&#92;(&#92;pm 1&#92;)</span>.

**Theorem 1.20** (Fundamental Theorem for Plane Curves): Given a smooth function <span>&#92;(k : J &#92;to &#92;mathbb{R}&#92;)</span> and a point <span>&#92;(p &#92;in &#92;mathbb{R}^2&#92;)</span>, a unit vector <span>&#92;(A &#92;in &#92;mathbb{R}^2&#92;)</span>, and <span>&#92;(s&#95;0 &#92;in J&#92;)</span>, there exists a unique smooth regular curve <span>&#92;(&#92;beta : J &#92;to &#92;mathbb{R}^2&#92;)</span> parametrized by arclength with <span>&#92;(&#92;beta(s&#95;0)=p&#92;)</span>, <span>&#92;(&#92;beta'(s&#95;0)=A&#92;)</span>, and signed curvature <span>&#92;(k&#95;&#92;beta = k&#92;)</span>.

*Proof sketch.* By the Polar Coordinates Theorem, define <span>&#92;(&#92;theta(s) = &#92;theta&#95;0 + &#92;int&#95;{s&#95;0}^s k(r)&#92;,dr&#92;)</span> where <span>&#92;(&#92;theta&#95;0&#92;)</span> is chosen so that <span>&#92;(A = (&#92;cos&#92;theta&#95;0, &#92;sin&#92;theta&#95;0)&#92;)</span>, then set <span>&#92;(&#92;beta(s) = p + &#92;int&#95;{s&#95;0}^s (&#92;cos&#92;theta(r), &#92;sin&#92;theta(r))&#92;,dr&#92;)</span>.

### Curves in <span>&#92;(&#92;mathbb{R}^3&#92;)</span>

For a smooth regular curve <span>&#92;(&#92;beta : J &#92;to &#92;mathbb{R}^3&#92;)</span> parametrized by arclength, the **unit tangent vector** is <span>&#92;(T = &#92;beta'&#92;)</span>. Since <span>&#92;(|T| = 1&#92;)</span>, we have <span>&#92;(T' &#92;perp T&#92;)</span>. When <span>&#92;(T'(s) &#92;neq 0&#92;)</span>, the **principal normal vector** is <span>&#92;(P = T'/|T'|&#92;)</span> and the **curvature** is <span>&#92;(&#92;kappa = |T'| = |&#92;beta''|&#92;)</span>. The **binormal vector** is <span>&#92;(B = T &#92;times P&#92;)</span>, giving a positively oriented orthonormal frame <span>&#92;(&#92;{T, P, B&#92;}&#92;)</span> at each point.

The **torsion** <span>&#92;(&#92;tau = &#92;tau&#95;&#92;beta&#92;)</span> is defined by <span>&#92;(B' = -&#92;tau P&#92;)</span>. (One can show <span>&#92;(B' &#92;perp T&#92;)</span> and <span>&#92;(B' &#92;perp B&#92;)</span>, so <span>&#92;(B'&#92;)</span> is indeed a multiple of <span>&#92;(P&#92;)</span>.) The resulting **Frenet-Serret formulas** are:
<span>&#92;[
T' = &#92;kappa P, &#92;qquad P' = -&#92;kappa T + &#92;tau B, &#92;qquad B' = -&#92;tau P.
&#92;]</span>

The curvature <span>&#92;(&#92;kappa&#92;)</span> measures the rate at which the curve bends away from a straight line, while the torsion <span>&#92;(&#92;tau&#92;)</span> measures how the curve twists out of the osculating plane spanned by <span>&#92;(T&#92;)</span> and <span>&#92;(P&#92;)</span>. A curve lies in a plane if and only if <span>&#92;(&#92;tau &#92;equiv 0&#92;)</span>.

**Theorem 1.24** (Curvature and Torsion Formulas): For a smooth regular curve <span>&#92;(&#92;alpha : I &#92;to &#92;mathbb{R}^3&#92;)</span>,
<span>&#92;[
&#92;kappa = &#92;frac{|&#92;alpha' &#92;times &#92;alpha''|}{|&#92;alpha'|^3}, &#92;qquad &#92;tau = &#92;frac{(&#92;alpha' &#92;times &#92;alpha'') &#92;cdot &#92;alpha'''}{|&#92;alpha' &#92;times &#92;alpha''|^2}.
&#92;]</span>

**Theorem 1.27** (Fundamental Theorem for Space Curves): Given smooth functions <span>&#92;(&#92;kappa, &#92;tau : J &#92;to &#92;mathbb{R}&#92;)</span> with <span>&#92;(&#92;kappa(s) > 0&#92;)</span> for all <span>&#92;(s&#92;)</span>, a point <span>&#92;(p &#92;in &#92;mathbb{R}^3&#92;)</span>, and a positively oriented orthonormal basis <span>&#92;(&#92;{A, B, C&#92;}&#92;)</span> of <span>&#92;(&#92;mathbb{R}^3&#92;)</span>, there exists a unique smooth curve <span>&#92;(&#92;beta : J &#92;to &#92;mathbb{R}^3&#92;)</span> parametrized by arclength such that <span>&#92;(&#92;beta(s&#95;0) = p&#92;)</span>, <span>&#92;((T(s&#95;0), P(s&#95;0), B(s&#95;0)) = (A, B, C)&#92;)</span>, and the curvature and torsion of <span>&#92;(&#92;beta&#92;)</span> are <span>&#92;(&#92;kappa&#92;)</span> and <span>&#92;(&#92;tau&#92;)</span>.

*Proof sketch.* The Frenet-Serret equations form a system of ODEs <span>&#92;(&#92;frac{d}{ds}(T,P,B) = (T,P,B) M&#92;)</span> for a skew-symmetric matrix <span>&#92;(M&#92;)</span> depending on <span>&#92;(&#92;kappa&#92;)</span> and <span>&#92;(&#92;tau&#92;)</span>. Existence and uniqueness of solutions with prescribed initial conditions follows from the standard ODE theorem. One then verifies the solution maintains the orthonormality of the frame.

---

## Chapter 2: Surfaces

### Surfaces in <span>&#92;(&#92;mathbb{R}^n&#92;)</span>

A **(local parametrized) surface** in <span>&#92;(&#92;mathbb{R}^n&#92;)</span> is a continuous map <span>&#92;(&#92;sigma : U &#92;subseteq &#92;mathbb{R}^2 &#92;to &#92;mathbb{R}^n&#92;)</span> where <span>&#92;(U&#92;)</span> is an open set. The surface is **regular** when <span>&#92;(&#92;sigma&#92;)</span> is <span>&#92;(C^1&#92;)</span> and its derivative (Jacobian) matrix <span>&#92;(D&#92;sigma = (&#92;sigma&#95;u, &#92;sigma&#95;v)&#92;)</span> has rank 2, meaning the column vectors <span>&#92;(&#92;sigma&#95;u = &#92;partial&#92;sigma/&#92;partial u&#92;)</span> and <span>&#92;(&#92;sigma&#95;v = &#92;partial&#92;sigma/&#92;partial v&#92;)</span> are linearly independent at every point. The **tangent plane** to <span>&#92;(&#92;sigma&#92;)</span> at <span>&#92;((a,b)&#92;)</span> is the plane through <span>&#92;(&#92;sigma(a,b)&#92;)</span> parallel to <span>&#92;(&#92;sigma&#95;u(a,b)&#92;)</span> and <span>&#92;(&#92;sigma&#95;v(a,b)&#92;)</span>.

Standard examples include:
- The **graph** of <span>&#92;(f: U &#92;to &#92;mathbb{R}&#92;)</span> via <span>&#92;(&#92;sigma(u,v) = (u,v,f(u,v))&#92;)</span>, always regular since <span>&#92;(D&#92;sigma&#92;)</span> has rank 2.
- The **sphere** <span>&#92;(&#92;rho(&#92;phi,&#92;theta) = r(&#92;sin&#92;phi&#92;cos&#92;theta, &#92;sin&#92;phi&#92;sin&#92;theta, &#92;cos&#92;phi)&#92;)</span>, regular when <span>&#92;(&#92;sin&#92;phi &#92;neq 0&#92;)</span>.
- The **torus** <span>&#92;(&#92;sigma(&#92;theta,&#92;phi) = ((R+r&#92;cos&#92;phi)&#92;cos&#92;theta, (R+r&#92;cos&#92;phi)&#92;sin&#92;theta, r&#92;sin&#92;phi)&#92;)</span>, regular everywhere for <span>&#92;(0 < r < R&#92;)</span>.

A **Riemannian metric** on <span>&#92;(U &#92;subseteq &#92;mathbb{R}^n&#92;)</span> is a smooth map <span>&#92;(g : U &#92;to M&#95;{n&#92;times n}(&#92;mathbb{R})&#92;)</span> where <span>&#92;(g(p)&#92;)</span> is positive-definite symmetric at every <span>&#92;(p&#92;)</span>. The **first fundamental form** of a smooth regular surface <span>&#92;(&#92;sigma&#92;)</span> is
<span>&#92;[
g = g&#95;&#92;sigma = D&#92;sigma^T D&#92;sigma = &#92;begin{pmatrix} &#92;sigma&#95;u &#92;cdot &#92;sigma&#95;u & &#92;sigma&#95;u &#92;cdot &#92;sigma&#95;v \\ &#92;sigma&#95;u &#92;cdot &#92;sigma&#95;v & &#92;sigma&#95;v &#92;cdot &#92;sigma&#95;v &#92;end{pmatrix}.
&#92;]</span>
Traditionally one writes <span>&#92;(E = g&#95;{11} = &#92;sigma&#95;u &#92;cdot &#92;sigma&#95;u&#92;)</span>, <span>&#92;(F = g&#95;{12} = &#92;sigma&#95;u &#92;cdot &#92;sigma&#95;v&#92;)</span>, <span>&#92;(G = g&#95;{22} = &#92;sigma&#95;v &#92;cdot &#92;sigma&#95;v&#92;)</span>. This is positive-definite (since <span>&#92;(&#92;sigma&#95;u&#92;)</span> and <span>&#92;(&#92;sigma&#95;v&#92;)</span> are linearly independent), so it defines an inner product <span>&#92;(&#92;langle X, Y &#92;rangle = Y^T g X&#92;)</span> on <span>&#92;(&#92;mathbb{R}^2&#92;)</span>.

The length of a curve <span>&#92;(&#92;gamma(t) = &#92;sigma(&#92;alpha(t))&#92;)</span> lying on the surface is
<span>&#92;[
L&#95;&#92;gamma[a,b] = &#92;int&#95;a^b &#92;sqrt{&#92;alpha'(t)^T g(&#92;alpha(t)) &#92;alpha'(t)}&#92;, dt,
&#92;]</span>
and the angle between two curves on the surface through a point <span>&#92;(p&#92;)</span> is computed using the inner product <span>&#92;(&#92;langle X, Y &#92;rangle = Y^T g(p) X&#92;)</span>.

The **area** of the surface over a Jordan region <span>&#92;(R &#92;subseteq U&#92;)</span> is motivated by approximating <span>&#92;(\sigma(R)&#92;)</span> by infinitesimal parallelograms: each small patch at <span>&#92;((u,v)&#92;)</span> has area approximately <span>&#92;(\sqrt{\det g}\, du\,dv&#92;)</span>, giving
<span>&#92;[
A&#95;&#92;sigma(R) = &#92;iint&#95;R &#92;sqrt{&#92;det g(u,v)}&#92;, du&#92;, dv.
&#92;]</span>
More generally, for a continuous function <span>&#92;(f : U &#92;to &#92;mathbb{R}&#92;)</span>, we write <span>&#92;(dA = &#92;sqrt{&#92;det g}&#92;, du&#92;, dv&#92;)</span> and define <span>&#92;(&#92;iint&#95;R f&#92;, dA = &#92;iint&#95;R f(u,v)&#92;\sqrt{&#92;\det g}&#92;\,du&#92;\,dv&#92;)</span>.

**Theorem 2.12** (Change of Coordinates): Under a smooth regular change of coordinates <span>&#92;(&#92;phi: U &#92;to V&#92;)</span> with inverse <span>&#92;(&#92;psi = &#92;phi^{-1}&#92;)</span>, the surface <span>&#92;(&#92;rho = &#92;sigma &#92;circ &#92;psi&#92;)</span> satisfies <span>&#92;(g&#95;&#92;rho(q) = D&#92;psi(q)^T g&#95;&#92;sigma(p) D&#92;psi(q)&#92;)</span> and <span>&#92;(A&#95;&#92;rho(&#92;phi(R)) = A&#95;&#92;sigma(R)&#92;)</span>. That is, area is intrinsic and independent of the parametrization chosen.

### Surfaces in <span>&#92;(&#92;mathbb{R}^3&#92;)</span>

For a smooth regular surface <span>&#92;(&#92;sigma : U &#92;subseteq &#92;mathbb{R}^2 &#92;to &#92;mathbb{R}^3&#92;)</span>, since <span>&#92;(D&#92;sigma&#92;)</span> has rank 2 we have <span>&#92;(&#92;sigma&#95;u &#92;times &#92;sigma&#95;v &#92;neq 0&#92;)</span>. The **unit normal vector** and **Gauss map** are
<span>&#92;[
n = n&#95;&#92;sigma = &#92;frac{&#92;sigma&#95;u &#92;times &#92;sigma&#95;v}{|&#92;sigma&#95;u &#92;times &#92;sigma&#95;v|} : U &#92;to S^2 &#92;subseteq &#92;mathbb{R}^3.
&#92;]</span>

Given a point <span>&#92;(p &#92;in U&#92;)</span> and a nonzero vector <span>&#92;(A &#92;in &#92;mathbb{R}^2&#92;)</span>, the **(directional) curvature** <span>&#92;(k&#95;&#92;sigma(p)(A)&#92;)</span> is defined by taking any regular curve <span>&#92;(&#92;alpha&#92;)</span> with <span>&#92;(&#92;alpha(0)=p&#92;)</span>, <span>&#92;(&#92;alpha'(0)=A&#92;)</span>, letting <span>&#92;(&#92;gamma = &#92;sigma &#92;circ &#92;alpha&#92;)</span> and reparametrizing by arclength to get <span>&#92;(&#92;delta&#92;)</span>, then setting <span>&#92;(k&#95;&#92;sigma(p)(A) = &#92;delta''(0) &#92;cdot N(0)&#92;)</span> where <span>&#92;(N(s) = n(&#92;alpha(t(s)))&#92;)</span>.

**Theorem 2.14** (Directional Curvature): The curvature <span>&#92;(k&#95;&#92;sigma(p)(A)&#92;)</span> depends only on <span>&#92;(\sigma&#92;)</span>, <span>&#92;(p&#92;)</span>, and the direction of <span>&#92;(A&#92;)</span>, and is given by
<span>&#92;[
k&#95;&#92;sigma(p)(A) = &#92;frac{A^T h(p) A}{A^T g(p) A}
&#92;]</span>
where <span>&#92;(g = D&#92;sigma^T D&#92;sigma&#92;)</span> is the first fundamental form and <span>&#92;(h = -Dn^T D&#92;sigma&#92;)</span> is the **second fundamental form**.

The entries of <span>&#92;(h&#92;)</span> can be computed as
<span>&#92;[
h = &#92;begin{pmatrix} &#92;sigma&#95;{uu} &#92;cdot n & &#92;sigma&#95;{uv} &#92;cdot n \\ &#92;sigma&#95;{uv} &#92;cdot n & &#92;sigma&#95;{vv} &#92;cdot n &#92;end{pmatrix}
&#92;]</span>
using the identities <span>&#92;(&#92;sigma&#95;{uu} &#92;cdot n = -&#92;sigma&#95;u &#92;cdot n&#95;u&#92;)</span> etc. (obtained by differentiating <span>&#92;(&#92;sigma&#95;u &#92;cdot n = 0&#92;)</span>). Traditionally one writes <span>&#92;(L = h&#95;{11}&#92;)</span>, <span>&#92;(M = h&#95;{12}&#92;)</span>, <span>&#92;(N = h&#95;{22}&#92;)</span>.

*Proof of Theorem 2.14.* Since <span>&#92;(\delta'&#92;)</span> lies in the tangent plane, <span>&#92;(\delta' \cdot N = 0&#92;)</span>. Differentiating: <span>&#92;(\delta'' \cdot N = -\delta' \cdot N'&#92;)</span>. Computing <span>&#92;(\delta' = D\sigma(\alpha') / |D\sigma\alpha'|&#92;)</span> and <span>&#92;(N' = Dn(\alpha')/|D\sigma\alpha'|&#92;)</span>, one obtains <span>&#92;(k = -(\delta' \cdot N') = -(A^T Dn^T D\sigma A)/(A^T D\sigma^T D\sigma A) = A^T h A / A^T g A&#92;)</span>. <span>&#92;(&#92;square&#92;)</span>

The directional curvature depends only on the direction of <span>&#92;(A&#92;)</span>, so <span>&#92;(k&#95;&#92;sigma(p)&#92;)</span> defines a function on the projective line <span>&#92;(&#92;mathbb{P}^1(&#92;mathbb{R})&#92;)</span> of directions. Under a positive change of coordinates, the unit normal is preserved (<span>&#92;(n&#95;&#92;rho = n&#95;&#92;sigma&#92;)</span>), the second fundamental form transforms as <span>&#92;(h&#95;&#92;rho(q) = D&#92;psi(q)^T h&#95;&#92;sigma(p) D&#92;psi(q)&#92;)</span>, and the directional curvature is invariant.

**Theorem 2.18** (Principal Curvature Directions): For <span>&#92;(p &#92;in U&#92;)</span>, the directional curvature <span>&#92;(k&#95;&#92;sigma(p)(A)&#92;)</span> attains its maximum <span>&#92;(k&#95;1&#92;)</span> and minimum <span>&#92;(k&#95;2&#92;)</span> in two directions orthogonal with respect to <span>&#92;(g(p)&#92;)</span>. These extreme values are the **principal curvatures**, the eigenvalues of <span>&#92;(g(p)^{-1} h(p)&#92;)</span>, occurring in the **principal directions** (eigenvectors). The principal curvatures are the roots of <span>&#92;(&#92;det(h(p) - k&#92; g(p)) = 0&#92;)</span>.

The **mean curvature** and **Gaussian curvature** are
<span>&#92;[
H = &#92;tfrac{1}{2}(k&#95;1 + k&#95;2) = &#92;tfrac{1}{2}&#92;operatorname{tr}(g^{-1}h), &#92;qquad K = k&#95;1 k&#95;2 = &#92;frac{&#92;det h}{&#92;det g}.
&#92;]</span>

**Theorem 2.20** (Gauss-Weingarten Equations): For a smooth regular surface in <span>&#92;(&#92;mathbb{R}^3&#92;)</span>,
<span>&#92;[
&#92;begin{pmatrix} &#92;sigma&#95;{uu} \\ &#92;sigma&#95;{uv} \\ &#92;sigma&#95;{vv} \\ n&#95;u \\ n&#95;v &#92;end{pmatrix} = &#92;begin{pmatrix} &#92;Gamma^1&#95;{11} & &#92;Gamma^2&#95;{11} & h&#95;{11} \\ &#92;Gamma^1&#95;{12} & &#92;Gamma^2&#95;{12} & h&#95;{12} \\ &#92;Gamma^1&#95;{22} & &#92;Gamma^2&#95;{22} & h&#95;{22} \\ b^1&#95;1 & b^2&#95;1 & 0 \\ b^1&#95;2 & b^2&#95;2 & 0 &#92;end{pmatrix} &#92;begin{pmatrix} &#92;sigma&#95;u \\ &#92;sigma&#95;v \\ n &#92;end{pmatrix}
&#92;]</span>
where <span>&#92;(b = -g^{-1}h&#92;)</span> (the **Weingarten map**) and the **Christoffel symbols** are given by
<span>&#92;[
&#92;begin{pmatrix} &#92;Gamma^1&#95;{11} & &#92;Gamma^1&#95;{12} & &#92;Gamma^1&#95;{22} \\ &#92;Gamma^2&#95;{11} & &#92;Gamma^2&#95;{12} & &#92;Gamma^2&#95;{22} &#92;end{pmatrix} = &#92;tfrac{1}{2} g^{-1} &#92;begin{pmatrix} (g&#95;{11})&#95;u & (g&#95;{11})&#95;v & 2(g&#95;{12})&#95;v - (g&#95;{22})&#95;u \\ 2(g&#95;{12})&#95;u - (g&#95;{11})&#95;v & (g&#95;{22})&#95;u & (g&#95;{22})&#95;v &#92;end{pmatrix}.
&#92;]</span>

The proof determines all entries by taking dot products with <span>&#92;(&#92;sigma&#95;u&#92;)</span>, <span>&#92;(&#92;sigma&#95;v&#92;)</span>, and <span>&#92;(n&#92;)</span>, using e.g. <span>&#92;(&#92;sigma&#95;{uu} &#92;cdot &#92;sigma&#95;u = &#92;frac{1}{2}(g&#95;{11})&#95;u&#92;)</span> (from differentiating <span>&#92;(g&#95;{11} = &#92;sigma&#95;u &#92;cdot &#92;sigma&#95;u&#92;)</span>).

**Theorem 2.22** (Gauss-Codazzi Equations): The entries of <span>&#92;(g&#92;)</span> and <span>&#92;(h&#92;)</span> satisfy the **Codazzi equations**:
<span>&#92;[
(h&#95;{11})&#95;v - (h&#95;{12})&#95;u = h&#95;{11}&#92;Gamma^1&#95;{12} + h&#95;{12}(&#92;Gamma^2&#95;{12} - &#92;Gamma^1&#95;{11}) - h&#95;{22}&#92;Gamma^2&#95;{11},
&#92;]</span>
<span>&#92;[
(h&#95;{12})&#95;v - (h&#95;{22})&#95;u = h&#95;{11}&#92;Gamma^1&#95;{22} + h&#95;{12}(&#92;Gamma^2&#95;{22} - &#92;Gamma^1&#95;{12}) - h&#95;{22}&#92;Gamma^2&#95;{12},
&#92;]</span>
and the **Gauss equations** (expressing <span>&#92;(K &#92;det g&#92;)</span> in terms of <span>&#92;(g&#92;)</span> and its derivatives):
<span>&#92;[
g&#95;{11} K = (&#92;Gamma^2&#95;{11})&#95;v - (&#92;Gamma^2&#95;{12})&#95;u + &#92;Gamma^2&#95;{11}&#92;Gamma^2&#95;{22} + &#92;Gamma^1&#95;{11}&#92;Gamma^2&#95;{12} - &#92;Gamma^1&#95;{12}&#92;Gamma^2&#95;{11} - (&#92;Gamma^2&#95;{12})^2,
&#92;]</span>
and two further equations for <span>&#92;(g&#95;{12} K&#92;)</span> and <span>&#92;(g&#95;{22} K&#92;)</span>.

These compatibility equations arise from requiring <span>&#92;(&#92;sigma&#95;{uuv} = &#92;sigma&#95;{uvu}&#92;)</span> and <span>&#92;(&#92;sigma&#95;{vvu} = &#92;sigma&#95;{vuv}&#92;)</span>, then expanding using the Gauss-Weingarten equations and equating coefficients of <span>&#92;(&#92;sigma&#95;u&#92;)</span>, <span>&#92;(&#92;sigma&#95;v&#92;)</span>, and <span>&#92;(n&#92;)</span>.

**Theorem 2.23** (Theorema Egregium): For a smooth regular surface in <span>&#92;(&#92;mathbb{R}^3&#92;)</span>, the Gaussian curvature <span>&#92;(K = &#92;det h / &#92;\det g&#92;)</span> can be expressed entirely in terms of the first fundamental form <span>&#92;(g&#92;)</span> and its derivatives. In particular, <span>&#92;(K&#92;)</span> is an **intrinsic** property: it is preserved under isometries (maps that preserve the Riemannian metric).

This is Gauss's "remarkable theorem": even though <span>&#92;(K&#92;)</span> is defined using <span>&#92;(h&#92;)</span> (which depends on the embedding in <span>&#92;(&#92;mathbb{R}^3&#92;)</span>), it turns out to depend only on the intrinsic geometry. As a consequence, a flat rectangle and a cylinder (which is obtained by bending a rectangle without stretching) have the same Gaussian curvature <span>&#92;(K=0&#92;)</span> at every point, while the mean curvature changes (<span>&#92;(H=0&#92;)</span> vs. <span>&#92;(H = 1/(2r)&#92;)</span>).

**Theorem 2.24** (Bonnet's Theorem / Fundamental Theorem for Surfaces): Given a connected open set <span>&#92;(U &#92;subseteq &#92;mathbb{R}^2&#92;)</span>, smooth functions <span>&#92;(g&#95;{11}, g&#95;{12}, g&#95;{22}, h&#95;{11}, h&#95;{12}, h&#95;{22} : U &#92;to &#92;mathbb{R}&#92;)</span> with <span>&#92;(g&#95;{11} > 0&#92;)</span> and <span>&#92;(g&#95;{11}g&#95;{22} - g&#95;{12}^2 > 0&#92;)</span>, satisfying all the Gauss-Codazzi equations, and given initial data <span>&#92;(p &#92;in &#92;mathbb{R}^3&#92;)</span> and orthogonal unit vectors <span>&#92;(A, B &#92;in &#92;mathbb{R}^3&#92;)</span>, there exists a unique smooth surface <span>&#92;(&#92;sigma : U &#92;to &#92;mathbb{R}^3&#92;)</span> with these fundamental forms satisfying <span>&#92;(&#92;sigma(0)=p&#92;)</span>, <span>&#92;(&#92;sigma&#95;u(0) &#92;in &#92;operatorname{Span}&#92;{A&#92;}&#92;)</span>, <span>&#92;(&#92;sigma&#95;v(0) &#92;in &#92;operatorname{Span}&#92;{A,B&#92;}&#92;)</span>. Bonnet's theorem says a surface is determined up to rigid motion by its two fundamental forms, provided the Gauss-Codazzi compatibility conditions hold.

---

## Chapter 3: Geodesic Curvature and the Gauss-Bonnet Theorem

### Geodesic Curvature and Geodesics

Let <span>&#92;(&#92;sigma : U &#92;subseteq &#92;mathbb{R}^2 &#92;to &#92;mathbb{R}^3&#92;)</span> be a smooth regular surface, let <span>&#92;(&#92;alpha : I &#92;to U&#92;)</span> be a smooth regular curve, and let <span>&#92;(&#92;gamma(t) = &#92;sigma(&#92;alpha(t))&#92;)</span>. Reparametrize <span>&#92;(&#92;gamma&#92;)</span> by arclength to get <span>&#92;(&#92;\beta(s) = &#92;\alpha(t(s))&#92;)</span> and <span>&#92;(&#92;\delta(s) = &#92;\gamma(t(s))&#92;)</span>. Set <span>&#92;(T(s) = &#92;delta'(s)&#92;)</span>, <span>&#92;(N(s) = n(&#92;beta(s))&#92;)</span>, and <span>&#92;(M(s) = N(s) &#92;times T(s)&#92;)</span>. Then <span>&#92;(\{T, M, N\}&#92;)</span> is a positive oriented orthonormal basis for <span>&#92;(&#92;mathbb{R}^3&#92;)</span> with <span>&#92;(T&#92;)</span> and <span>&#92;(M&#92;)</span> spanning the tangent plane.

Since <span>&#92;(&#92;\delta&#92;)</span> is arclength-parametrized, <span>&#92;(&#92;\delta'' &#92;\perp &#92;\delta'&#92;)</span>, so <span>&#92;(&#92;\delta''(s)&#92;)</span> lies in the span of <span>&#92;(N&#92;)</span> and <span>&#92;(M&#92;)</span>:
<span>&#92;[
&#92;delta'' = (&#92;delta'' &#92;cdot N) N + (&#92;delta'' &#92;cdot M) M.
&#92;]</span>
The normal component <span>&#92;(&#92;\delta'' &#92;\cdot N&#92;)</span> is the directional curvature studied in Chapter 2; it depends only on the surface and direction, not the shape of the curve. The tangential component defines the **geodesic curvature**:
<span>&#92;[
k&#95;g = k&#95;g(s) = k&#95;g(&#92;beta)(s) = &#92;delta''(s) &#92;\cdot M(s).
&#92;]</span>
For the original curve <span>&#92;(&#92;\alpha&#92;)</span> we set <span>&#92;(k&#95;g(&#92;\alpha)(t) = k&#95;g(&#92;\beta)(s(t))&#92;)</span>.

**Theorem 3.2** (Geodesic Curvature is Intrinsic): Writing <span>&#92;(&#92;\beta(s) = (u(s), v(s))&#92;)</span>,
<span>&#92;[
k&#95;g = &#92;\sqrt{&#92;\det g} &#92;\left[ &#92;\left(v'' + &#92;\Gamma^2&#95;{11}(u')^2 + 2&#92;\Gamma^2&#95;{12} u'v' + &#92;\Gamma^2&#95;{22}(v')^2&#92;\right) u' - &#92;\left(u'' + &#92;\Gamma^1&#95;{11}(u')^2 + 2&#92;\Gamma^1&#95;{12} u'v' + &#92;\Gamma^1&#95;{22}(v')^2&#92;\right) v' &#92;\right].
&#92;]</span>
Since this formula involves only <span>&#92;(g&#92;)</span> and its derivatives (via the Christoffel symbols), <span>&#92;(k&#95;g&#92;)</span> is intrinsic — it can be computed from the Riemannian metric alone without knowing how the surface sits in <span>&#92;(&#92;\mathbb{R}^3&#92;)</span>.

*Proof.* Using <span>&#92;(&#92;\delta'&#92;)</span> and <span>&#92;(&#92;\delta''&#92;)</span> from the Gauss-Weingarten equations and the formula <span>&#92;(k&#95;g = &#92;\det(&#92;\delta', &#92;\delta'', N)&#92;)</span>, one notes that <span>&#92;(&#92;\det(&#92;\sigma&#95;u, &#92;\sigma&#95;v, n) = &#92;\sqrt{&#92;\det g}&#92;)</span>. The normal component <span>&#92;(n(&#92;\cdot)&#92;)</span> drops out, yielding the intrinsic formula. <span>&#92;(&#92;\square&#92;)</span>

#### Geodesics via the Calculus of Variations

A **geodesic** is intended to be a curve of locally minimum arclength. The energy of a curve <span>&#92;(&#92;\delta(s) = &#92;\sigma(&#92;\beta(s))&#92;)</span> over <span>&#92;([a,b]&#92;)</span> is
<span>&#92;[
E&#95;&#92;\delta[a,b] = &#92;\int&#95;a^b |&#92;\delta'(s)|^2&#92;\, ds = &#92;\int&#95;a^b &#92;\beta'(s)^T g(&#92;\beta(s)) &#92;\beta'(s)&#92;\, ds.
&#92;]</span>
By the Cauchy-Schwarz inequality, <span>&#92;(L^2 &#92;\leq (b-a) E&#92;)</span>, with equality when <span>&#92;(|&#92;\delta'|&#92;)</span> is constant. So minimizing arclength among arclength-parametrized curves is equivalent to minimizing energy.

To minimize the energy functional with Lagrangian <span>&#92;(L = g&#95;{11}(u')^2 + 2g&#95;{12}u'v' + g&#95;{22}(v')^2&#92;)</span>, one applies the **Euler-Lagrange equations**:
<span>&#92;[
&#92;\frac{&#92;\partial L}{&#92;\partial u} - &#92;\frac{d}{ds}&#92;\frac{&#92;\partial L}{&#92;\partial u'} = 0, &#92;qquad &#92;\frac{&#92;\partial L}{&#92;\partial v} - &#92;\frac{d}{ds}&#92;\frac{&#92;\partial L}{&#92;\partial v'} = 0.
&#92;]</span>
These reduce to the **geodesic equations**:
<span>&#92;[
u'' + &#92;\Gamma^1&#95;{11}(u')^2 + 2&#92;\Gamma^1&#95;{12} u'v' + &#92;\Gamma^1&#95;{22}(v')^2 = 0,
&#92;]</span>
<span>&#92;[
v'' + &#92;\Gamma^2&#95;{11}(u')^2 + 2&#92;\Gamma^2&#95;{12} u'v' + &#92;\Gamma^2&#95;{22}(v')^2 = 0.
&#92;]</span>

**Definition 3.4**: A **geodesic** on <span>&#92;(&#92;\sigma&#92;)</span> is a smooth regular curve <span>&#92;(&#92;\beta : I &#92;to U&#92;)</span>, parametrized by arclength with respect to <span>&#92;(g&#92;)</span>, satisfying the geodesic equations.

**Theorem 3.5**: For a smooth regular curve <span>&#92;(&#92;\beta&#92;)</span> on <span>&#92;(&#92;\sigma&#92;)</span> with <span>&#92;(&#92;\delta = &#92;\sigma &#92;\circ &#92;\beta&#92;)</span>:
1. <span>&#92;(&#92;\delta''(s) &#92;\parallel N(s)&#92;)</span> for all <span>&#92;(s&#92;)</span> if and only if <span>&#92;(&#92;\beta&#92;)</span> satisfies the geodesic equations, in which case <span>&#92;(|&#92;\delta'|&#92;)</span> is constant.
2. When <span>&#92;(|&#92;\delta'(s)| = 1&#92;)</span>, <span>&#92;(&#92;\beta&#92;)</span> is a geodesic if and only if <span>&#92;(k&#95;g &#92;\equiv 0&#92;)</span>.

In other words, a geodesic is a curve for which the acceleration <span>&#92;(&#92;\delta''&#92;)</span> is always normal to the surface — there is no tangential acceleration, so the curve "travels as straight as possible" on the surface.

**Corollary 3.6**: Given a point <span>&#92;(p &#92;in U&#92;)</span> and a unit vector <span>&#92;(A &#92;in &#92;\mathbb{R}^2&#92;)</span>, there exists a unique geodesic <span>&#92;(&#92;\beta : I &#92;to U&#92;)</span> with <span>&#92;(&#92;\beta(0) = p&#92;)</span> and <span>&#92;(&#92;\beta'(0)/|&#92;\beta'(0)| = A&#92;)</span>, defined on the maximal interval <span>&#92;(I&#92;)</span> for which <span>&#92;(&#92;\beta(s) &#92;\in U&#92;)</span>. This follows directly from the existence and uniqueness theorem for ODEs applied to the geodesic equations.

### Orthogonal Coordinates

**Theorem 3.7** (Orthogonal Coordinates): For every point <span>&#92;(p &#92;\in U&#92;)</span> there exists a neighborhood <span>&#92;(U&#95;p &#92;\subseteq U&#92;)</span> of <span>&#92;(p&#92;)</span> and a smooth regular change of coordinates <span>&#92;(&#92;\phi : U&#95;p &#92;\to V&#95;p&#92;)</span> such that the reparametrized surface <span>&#92;(&#92;\rho = &#92;\sigma &#92;\circ &#92;\phi^{-1}&#92;)</span> has diagonal first fundamental form <span>&#92;(g&#95;&#92;\rho(s,t) = &#92;\operatorname{diag}(g&#95;{11}, g&#95;{22})&#92;)</span> everywhere in <span>&#92;(V&#95;p&#92;)</span>.

When the coordinates are orthogonal (i.e., <span>&#92;(g&#95;{12} = F = 0&#92;)</span>), geometric quantities simplify greatly. In fact, Gauss proved a stronger result: **isothermal coordinates** exist locally around any point, where <span>&#92;(g&#95;&#92;\rho&#92;)</span> is a scalar multiple of the identity.

**Theorem 3.10** (Gaussian Curvature in Orthogonal Coordinates): When <span>&#92;(g&#92;)</span> is diagonal,
<span>&#92;[
K = &#92;\frac{-1}{2&#92;\sqrt{g&#95;{11}g&#95;{22}}} &#92;\left[ &#92;\frac{&#92;\partial}{&#92;\partial u}&#92;\frac{(g&#95;{22})&#95;u}{&#92;\sqrt{g&#95;{11}g&#95;{22}}} + &#92;\frac{&#92;\partial}{&#92;\partial v}&#92;\frac{(g&#95;{11})&#95;v}{&#92;\sqrt{g&#95;{11}g&#95;{22}}} &#92;\right].
&#92;]</span>

**Theorem 3.11** (Geodesic Curvature of Coordinate Lines): When <span>&#92;(g&#92;)</span> is diagonal, the geodesic curvatures of the coordinate lines <span>&#92;(v = b&#92;)</span> and <span>&#92;(u = a&#92;)</span> (parametrized by arclength) are
<span>&#92;[
k&#95;1 = k&#95;g^{v=b} = -&#92;\frac{(g&#95;{11})&#95;v}{2&#92;\sqrt{g&#95;{11}g&#95;{22}}}, &#92;qquad k&#95;2 = k&#95;g^{u=a} = &#92;\frac{(g&#95;{22})&#95;u}{2&#92;\sqrt{g&#95;{22}g&#95;{11}}}.
&#92;]</span>

**Note 3.12**: When <span>&#92;(g&#92;)</span> is diagonal and <span>&#92;(|&#92;\delta'(s)|=1&#92;)</span>, we can write
<span>&#92;[
&#92;\delta'(s) = &#92;\cos&#92;\theta(s)&#92;\,&#92;\frac{&#92;\sigma&#95;u(&#92;\beta(s))}{|&#92;\sigma&#95;u(&#92;\beta(s))|} + &#92;\sin&#92;\theta(s)&#92;\,&#92;\frac{&#92;\sigma&#95;v(&#92;\beta(s))}{|&#92;\sigma&#95;v(&#92;\beta(s))|}
&#92;]</span>
for a smooth function <span>&#92;(&#92;\theta(s)&#92;)</span> (unique up to <span>&#92;(2&#92;\pi&#92;)</span>). This <span>&#92;(&#92;\theta&#92;)</span> measures the angle from the <span>&#92;(&#92;\sigma&#95;u&#92;)</span>-direction to the tangent vector in the tangent plane.

**Theorem 3.13** (Geodesic Curvature in Orthogonal Coordinates): With notation as above:
1. Writing <span>&#92;(&#92;\beta(s) = (u(s), v(s))&#92;)</span>, we have <span>&#92;(&#92;\cos&#92;\theta = &#92;\sqrt{g&#95;{11}}&#92;\, u'&#92;)</span> and <span>&#92;(&#92;\sin&#92;\theta = &#92;\sqrt{g&#95;{22}}&#92;\, v'&#92;)</span>.
2. The geodesic curvature satisfies
<span>&#92;[
k&#95;g = &#92;\theta' + k&#95;1 &#92;\cos&#92;\theta + k&#95;2 &#92;\sin&#92;\theta.
&#92;]</span>

This elegant formula decomposes the geodesic curvature into the rate of change of the angle (<span>&#92;(&#92;\theta'&#92;)</span>) plus the curvature contributions from the coordinate lines.

### Green's Theorem

**Theorem 3.14** (Green's Theorem): Let <span>&#92;(&#92;\Delta = &#92;\{(x,y) : x &#92;\geq 0, y &#92;\geq 0, x+y &#92;\leq 1&#92;}&#92;)</span> be the standard triangle, and let <span>&#92;(&#92;\phi : U &#92;\to V&#92;)</span> be a smooth regular positive change of coordinates containing <span>&#92;(&#92;\Delta &#92;\subseteq V&#92;)</span> with inverse <span>&#92;(&#92;\psi = &#92;\phi^{-1}&#92;)</span>. Let <span>&#92;(R = &#92;\psi(&#92;\Delta)&#92;)</span> and let <span>&#92;(&#92;\alpha&#95;1, &#92;\alpha&#95;2, &#92;\alpha&#95;3&#92;)</span> be its edges. For any smooth <span>&#92;(F = (P,Q) : U &#92;\to &#92;\mathbb{R}^2&#92;)</span>,
<span>&#92;[
&#92;\iint&#95;R &#92;\left(&#92;\frac{&#92;\partial Q}{&#92;\partial u} - &#92;\frac{&#92;\partial P}{&#92;\partial v}&#92;\right) du&#92;\, dv = &#92;\sum&#95;{j=1}^3 &#92;\int&#95;0^1 F(&#92;\alpha&#95;j(t)) &#92;\cdot &#92;\alpha&#95;j'(t)&#92;\, dt.
&#92;]</span>

*Proof.* Set <span>&#92;(G(x,y) = D&#92;\psi(x,y)^T F(&#92;\psi(x,y))&#92;)</span>. By the change of variables formula, <span>&#92;(&#92;\iint&#95;R (Q&#95;u - P&#95;v)&#92;\,du&#92;\,dv = &#92;\iint&#95;&#92;\Delta (M&#95;x - L&#95;y)&#92;\,dx&#92;\,dy&#92;)</span> where <span>&#92;((L,M) = G&#92;)</span>. The latter equals <span>&#92;(&#92;\sum&#95;j &#92;\int&#95;0^1 G(&#92;\delta&#95;j) &#92;\cdot &#92;\delta&#95;j'&#92;\,dt&#92;)</span> by direct computation on the triangle <span>&#92;(&#92;\Delta&#92;)</span> using iterated integrals, and each boundary integral for <span>&#92;(G&#92;)</span> matches the corresponding one for <span>&#92;(F&#92;)</span> under the change of coordinates. <span>&#92;(&#92;\square&#92;)</span>

### The Gauss-Bonnet Formula

For a surface <span>&#92;(&#92;\sigma : U &#92;\to &#92;\mathbb{R}^3&#92;)</span>, a region <span>&#92;(R &#92;\subseteq U&#92;)</span>, and a curve <span>&#92;(&#92;\alpha : [a,b] &#92;\to U&#92;)</span>, we define the integrals
<span>&#92;[
&#92;\int&#95;&#92;\alpha k&#95;g&#92;\,dL = &#92;\int&#95;a^b k&#95;g(&#92;\alpha)(t)&#92;\,|&#92;\gamma'(t)|&#92;\,dt, &#92;qquad &#92;\iint&#95;R K&#92;\,dA = &#92;\iint&#95;R K&#95;&#92;\sigma(u,v)&#92;\sqrt{&#92;\det g}&#92;\,du&#92;\,dv.
&#92;]</span>
These are invariant under changes of parametrization (with appropriate sign adjustments).

**Theorem 3.17** (Gauss-Bonnet Formula in Orthogonal Coordinates): Let <span>&#92;(&#92;\sigma : U &#92;\to &#92;\mathbb{R}^3&#92;)</span> with diagonal <span>&#92;(g&#92;)</span>, and let <span>&#92;(&#92;\psi : &#92;\Delta &#92;\to R &#92;\subseteq U&#92;)</span> be a smooth regular positive change of coordinates. With <span>&#92;(&#92;\alpha&#95;j&#92;)</span> the three edges of <span>&#92;(R&#92;)</span> and <span>&#92;(&#92;\Delta&#92;\theta&#95;j = &#92;\theta&#95;j(1) - &#92;\theta&#95;j(0)&#92;)</span> the total angle change along each edge,
<span>&#92;[
&#92;\iint&#95;R K&#92;\,dA + &#92;\sum&#95;{j=1}^3 &#92;\int&#95;{&#92;\alpha&#95;j} k&#95;g&#92;\,dL = &#92;\sum&#95;{j=1}^3 &#92;\Delta&#92;\theta&#95;j.
&#92;]</span>

*Proof.* Using Theorem 3.13, each geodesic curvature integral decomposes as <span>&#92;(&#92;\int k&#95;g&#92;\,dL = &#92;\Delta&#92;\theta&#95;j + &#92;\int&#95;0^1 F(&#92;\alpha&#95;j) &#92;\cdot &#92;\alpha&#95;j'&#92;\,dt&#92;)</span> where <span>&#92;(F = (P,Q)&#92;)</span> with <span>&#92;(P = -(g&#95;{11})&#95;v/(2&#92;\sqrt{g&#95;{11}g&#95;{22}})&#92;)</span> and <span>&#92;(Q = (g&#95;{22})&#95;u/(2&#92;\sqrt{g&#95;{11}g&#95;{22}})&#92;)</span>. By Green's Theorem, <span>&#92;(&#92;\sum&#95;j &#92;\int F &#92;\cdot &#92;\alpha&#95;j'&#92;\,dt = &#92;\iint&#95;R (Q&#95;u - P&#95;v)&#92;\,du&#92;\,dv = -&#92;\iint&#95;R K&#92;\,dA&#92;)</span> by Theorem 3.10. <span>&#92;(&#92;\square&#92;)</span>

**Note 3.18**: If <span>&#92;(&#92;\epsilon&#95;1, &#92;\epsilon&#95;2, &#92;\epsilon&#95;3 &#92;\in [0,&#92;\pi]&#92;)</span> are the **external angles** at the vertices of <span>&#92;(&#92;\sigma(R)&#92;)</span> (the angles between consecutive edge tangent vectors), then one can show (by approximation arguments) that <span>&#92;(&#92;\sum&#95;j &#92;\Delta&#92;\theta&#95;j + &#92;\sum&#95;j &#92;\epsilon&#95;j = 2&#92;\pi&#92;)</span>. This yields the classical form:
<span>&#92;[
&#92;\iint&#95;R K&#92;\,dA + &#92;\sum&#95;{j=1}^3 &#92;\int&#95;{&#92;\alpha&#95;j} k&#95;g&#92;\,dL + &#92;\sum&#95;{j=1}^3 &#92;\epsilon&#95;j = 2&#92;\pi.
&#92;]</span>

**Theorem 3.20** (Gauss-Bonnet Formula, General): Let <span>&#92;(U &#92;\subseteq &#92;\mathbb{R}^2&#92;)</span> be open with the standard triangle <span>&#92;(&#92;\Delta = &#92;\{u,v &#92;\geq 0, u+v &#92;\leq 1&#92;}&#92;\subseteq U&#92;)</span>, and let <span>&#92;(&#92;\sigma : U &#92;\to &#92;\mathbb{R}^3&#92;)</span> be smooth and regular. Let <span>&#92;(&#92;\epsilon&#95;1, &#92;\epsilon&#95;2, &#92;\epsilon&#95;3&#92;)</span> be the external angles of <span>&#92;(&#92;\sigma(&#92;\Delta)&#92;)</span> at its three vertices. Then:
<span>&#92;[
&#92;\iint&#95;&#92;\Delta K&#95;&#92;\sigma&#92;\, dA + &#92;\sum&#95;{j=1}^3 &#92;\int&#95;{&#92;\alpha&#95;j} k&#95;g&#92;\, dL + &#92;\sum&#95;{j=1}^3 &#92;\epsilon&#95;j = 2&#92;\pi.
&#92;]</span>

This formula holds without assuming orthogonal coordinates, because every point has a neighborhood with orthogonal coordinates (Theorem 3.7), and one can subdivide <span>&#92;(&#92;\Delta&#92;)</span> into small triangles each contained in such a neighborhood, apply Theorem 3.17 to each, and add — with interior boundary terms canceling.

### Global Gauss-Bonnet Theorem

**Definition 3.22**: A **smooth regular global surface** (or smooth regular 2-dimensional submanifold) in <span>&#92;(&#92;\mathbb{R}^n&#92;)</span> is a set <span>&#92;(S &#92;\subseteq &#92;\mathbb{R}^n&#92;)</span> covered by smooth regular homeomorphisms <span>&#92;(&#92;\sigma : U&#95;&#92;\sigma &#92;\to S &#92;\cap W&#95;&#92;\sigma&#92;)</span> (the **coordinate charts**) such that whenever two charts overlap, the transition map is smooth and regular. The collection of charts is an **atlas** for <span>&#92;(S&#92;)</span>.

**Definition 3.23**: A **smooth regular triangulated surface** in <span>&#92;(&#92;\mathbb{R}^3&#92;)</span> is a global surface <span>&#92;(S&#92;)</span> together with a finite atlas <span>&#92;(&#92;\{&#92;\sigma&#95;1, &#92;\ldots, &#92;\sigma&#95;n&#92;}&#92;)</span> where each <span>&#92;(&#92;\sigma&#95;i : U&#95;i &#92;\to S &#92;\cap W&#95;i&#92;)</span> has <span>&#92;(&#92;\Delta &#92;\subseteq U&#95;i&#92;)</span>, the triangles <span>&#92;(&#92;\sigma&#95;i(&#92;\Delta)&#92;)</span> cover <span>&#92;(S&#92;)</span> with disjoint interiors, and edges are joined in matched pairs. The **Euler characteristic** is
<span>&#92;[
&#92;\chi = V - E + F
&#92;]</span>
where <span>&#92;(V&#92;)</span>, <span>&#92;(E&#92;)</span>, <span>&#92;(F&#92;)</span> are the numbers of vertices, edges, and faces of the triangulation.

**Theorem 3.24** (Gauss-Bonnet Theorem): For a smooth regular triangulated surface <span>&#92;(S &#92;\subseteq &#92;\mathbb{R}^3&#92;)</span> with triangulation <span>&#92;(&#92;{&#92;\sigma&#95;1, &#92;\ldots, &#92;\sigma&#95;n&#92;}&#92;)</span>,
<span>&#92;[
&#92;\iint&#95;S K&#92;\, dA = &#92;\sum&#95;{i=1}^n &#92;\iint&#95;&#92;\Delta K&#95;{&#92;\sigma&#95;i}&#92;\, dA = 2&#92;\pi&#92;\chi.
&#92;]</span>

*Proof.* Apply the Gauss-Bonnet Formula to each triangle. When edges are joined in pairs, the geodesic curvature integrals cancel (by the change-of-coordinates theorem for <span>&#92;(k&#95;g&#92;)</span>). Let <span>&#92;(&#92;\epsilon&#95;{i,j}&#92;)</span> and <span>&#92;(&#92;\phi&#95;{i,j} = &#92;\pi - &#92;\epsilon&#95;{i,j}&#92;)</span> be the external and internal angles of triangle <span>&#92;(i&#92;)</span> at vertex <span>&#92;(j&#92;)</span>. Since <span>&#92;(F=n&#92;)</span>, <span>&#92;(E = 3n/2&#92;)</span>, and the sum of internal angles at each vertex is <span>&#92;(2&#92;\pi&#92;)</span>, one obtains <span>&#92;(&#92;\sum K&#92;\,dA = 2&#92;\pi n - &#92;\sum&#95;{i,j} &#92;\epsilon&#95;{i,j} = 2&#92;\pi F - 2&#92;\pi E + 2&#92;\pi V = 2&#92;\pi&#92;\chi&#92;)</span>. <span>&#92;(&#92;\square&#92;)</span>

**Remark 3.25**: Since <span>&#92;(K&#95;S(p) = K&#95;&#92;\sigma(u,v)&#92;)</span> when <span>&#92;(&#92;\sigma(u,v)=p&#92;)</span> (and this is independent of the chart chosen), the total curvature <span>&#92;(&#92;\iint&#95;S K&#92;\,dA&#92;)</span> is well-defined and independent of triangulation. In particular, the Euler characteristic <span>&#92;(&#92;\chi(S)&#92;)</span> is a topological invariant. For a sphere, <span>&#92;(&#92;\chi = 2&#92;)</span> and <span>&#92;(&#92;\iint K&#92;\,dA = 4&#92;\pi&#92;)</span>; for a torus, <span>&#92;(&#92;\chi = 0&#92;)</span> and <span>&#92;(&#92;\iint K&#92;\,dA = 0&#92;)</span>. The Gauss-Bonnet theorem is remarkable because it relates a purely geometric quantity (total curvature, involving second derivatives of the surface) to a purely topological one (the Euler characteristic, which counts vertices minus edges plus faces in any triangulation).

---

## Chapter 4: Submanifolds of <span>&#92;(&#92;mathbb{R}^n&#92;)</span>

### Smooth Maps and Regularity

A smooth map <span>&#92;(f : U &#92;\subseteq &#92;\mathbb{R}^m &#92;\to &#92;\mathbb{R}^n&#92;)</span> (where <span>&#92;(U&#92;)</span> is open) is called **regular** (or an **immersion**) when its Jacobian matrix <span>&#92;(Df&#92;)</span> is injective at every point, i.e., the columns of <span>&#92;(Df(u)&#92;)</span> are linearly independent for all <span>&#92;(u &#92;\in U&#92;)</span>. This extends the regularity conditions used for curves (<span>&#92;(m=1&#92;)</span>) and surfaces (<span>&#92;(m=2&#92;)</span>) to maps of any dimension.

### Submanifolds

**Definition 4.2–4.3**: A set <span>&#92;(M &#92;\subseteq &#92;\mathbb{R}^n&#92;)</span> is an **<span>&#92;(m&#92;)</span>-dimensional smooth regular submanifold** when, near every point <span>&#92;(p &#92;\in M&#92;)</span>, it is locally equal to the graph of a smooth function of <span>&#92;(m&#92;)</span> of the <span>&#92;(n&#92;)</span> coordinates in terms of the remaining <span>&#92;(n-m&#92;)</span>.

Graphs of smooth functions, open sets in <span>&#92;(&#92;\mathbb{R}^m&#92;)</span>, and the unit sphere <span>&#92;(S^{n-1} = &#92;{x &#92;\in &#92;\mathbb{R}^n : |x| = 1&#92;}&#92;)</span> are all examples of submanifolds.

### The Inverse Function Theorem

**Theorem 4.6** (Inverse Function Theorem): Let <span>&#92;(f : U &#92;\subseteq &#92;\mathbb{R}^n &#92;\to &#92;\mathbb{R}^n&#92;)</span> with <span>&#92;(U&#92;)</span> open and <span>&#92;(a &#92;\in U&#92;)</span>. If <span>&#92;(f&#92;)</span> is <span>&#92;(C^1&#92;)</span> and <span>&#92;(Df(a)&#92;)</span> is invertible, then there exists an open set <span>&#92;(U&#95;0 &#92;\subseteq U&#92;)</span> with <span>&#92;(a &#92;\in U&#95;0&#92;)</span> such that <span>&#92;(V&#95;0 = f(U&#95;0)&#92;)</span> is open, <span>&#92;(f : U&#95;0 &#92;\to V&#95;0&#92;)</span> is bijective, and <span>&#92;(g = f^{-1} : V&#95;0 &#92;\to U&#95;0&#92;)</span> is <span>&#92;(C^1&#92;)</span> with <span>&#92;(Dg(f(a)) = Df(a)^{-1}&#92;)</span>. If <span>&#92;(f&#92;)</span> is <span>&#92;(C^k&#92;)</span> (or <span>&#92;(C^&#92;\infty&#92;)</span>) then so is <span>&#92;(f^{-1}&#92;)</span>.

(A complete proof appears in Appendix 1. The idea is a contraction mapping argument in Banach space.)

### The Implicit and Parametric Function Theorems

**Theorem 4.7** (Implicit Function Theorem): Let <span>&#92;(f : U &#92;\subseteq &#92;\mathbb{R}^n &#92;\to &#92;\mathbb{R}^&#92;ell&#92;)</span> be <span>&#92;(C^1&#92;)</span> with <span>&#92;(Df(p)&#92;)</span> of rank <span>&#92;(\ell&#92;)</span>. Setting <span>&#92;(c = f(p)&#92;)</span>, the level set <span>&#92;(f^{-1}(c)&#92;)</span> is locally the graph of a <span>&#92;(C^1&#92;)</span> function near <span>&#92;(p&#92;)</span>.

*Proof.* Reorder variables so that the last <span>&#92;(\ell&#92;)</span> columns of <span>&#92;(Df(p)&#92;)</span> form an invertible <span>&#92;(\ell &#92;\times &#92;\ell&#92;)</span> matrix. Write <span>&#92;(f(x,y)&#92;)</span> with <span>&#92;(x &#92;\in &#92;\mathbb{R}^{n-\ell}&#92;)</span> and <span>&#92;(y &#92;\in &#92;\mathbb{R}^&#92;\ell&#92;)</span> with <span>&#92;(\partial z/\partial y&#92;)</span> invertible. Define <span>&#92;(F(x,y) = (x, f(x,y))&#92;)</span>; then <span>&#92;(DF(p)&#92;)</span> is invertible, so the IFT applies. The inverse <span>&#92;(G(w,z) = (w, g(w,z))&#92;)</span> satisfies <span>&#92;(f^{-1}(c) = &#92;\{(x, g(x,c))&#92;}&#92;)</span> locally. <span>&#92;(&#92;\square&#92;)</span>

**Corollary 4.8** (Implicit Description of Submanifolds): If <span>&#92;(f : U &#92;\to &#92;\mathbb{R}^&#92;\ell&#92;)</span> is smooth with <span>&#92;(\operatorname{rank} Df(x) = &#92;\ell&#92;)</span> for all <span>&#92;(x &#92;\in U&#92;)</span>, then <span>&#92;(f^{-1}(c)&#92;)</span> is a smooth <span>&#92;((n-&#92;\ell)&#92;)</span>-dimensional submanifold for every <span>&#92;(c&#92;)</span> in the range. For example, <span>&#92;(S^{n-1} = f^{-1}(1)&#92;)</span> for <span>&#92;(f(x) = |x|^2&#92;)</span>, which has <span>&#92;(Df(x) = 2x^T&#92;)</span> of rank 1 everywhere on <span>&#92;(S^{n-1}&#92;)</span>.

**Theorem 4.10** (Parametric Function Theorem): Let <span>&#92;(\sigma : U &#92;\subseteq &#92;\mathbb{R}^m &#92;\to &#92;\mathbb{R}^n&#92;)</span> be <span>&#92;(C^1&#92;)</span> with <span>&#92;(D\sigma(a)&#92;)</span> of rank <span>&#92;(m&#92;)</span>. Then there is an open <span>&#92;(U&#95;0 &#92;\subseteq U&#92;)</span> with <span>&#92;(a &#92;\in U&#95;0&#92;)</span> such that <span>&#92;(\sigma(U&#95;0)&#92;)</span> equals the graph of a <span>&#92;(C^1&#92;)</span> function and <span>&#92;(\sigma : U&#95;0 &#92;\to \sigma(U&#95;0)&#92;)</span> is a homeomorphism.

**Corollary 4.11** (Parametric Description): An <span>&#92;(m&#92;)</span>-dimensional smooth regular submanifold <span>&#92;(M &#92;\subseteq &#92;\mathbb{R}^n&#92;)</span> is a set covered by smooth regular homeomorphisms <span>&#92;(\sigma : U &#92;\to V &#92;\subseteq M&#92;)</span> (with <span>&#92;(U &#92;\subseteq &#92;\mathbb{R}^m&#92;)</span> open). The collection of all such maps is an **atlas** for <span>&#92;(M&#92;)</span>, and each map is a **coordinate chart**. When two charts overlap, the transition map <span>&#92;(\rho^{-1}\sigma&#92;)</span> is a smooth regular change of coordinates (Theorem 4.15).

An important subtlety: the homeomorphism condition on <span>&#92;(\sigma&#92;)</span> is essential. The alpha curve <span>&#92;(\alpha(t) = (t^2-1, t(t^2-1))&#92;)</span> is regular and locally injective but not a homeomorphism onto its image near the self-intersection, and the image is not a manifold.

### Smooth Maps Between Manifolds

Let <span>&#92;(M &#92;\subseteq &#92;\mathbb{R}^k&#92;)</span> and <span>&#92;(N &#92;\subseteq &#92;\mathbb{R}^\ell&#92;)</span> be smooth submanifolds. A map <span>&#92;(f : M &#92;\to N&#92;)</span> is **smooth** when <span>&#92;(\rho^{-1} f \sigma&#92;)</span> is smooth for every chart <span>&#92;(\sigma&#92;)</span> on <span>&#92;(M&#92;)</span> and every chart <span>&#92;(\rho&#92;)</span> on <span>&#92;(N&#92;)</span>. A **diffeomorphism** is a bijective smooth map with smooth inverse. The dimension of a submanifold is well-defined (since if two charts overlap, the transition map must be square, forcing <span>&#92;(m = \ell&#92;)</span>). Composites of smooth maps are smooth.

### Tangent Spaces and Vector Fields

**Definition 4.30**: The **tangent space** <span>&#92;(T&#95;p M&#92;)</span> at <span>&#92;(p &#92;\in M&#92;)</span> is the set of all tangent vectors <span>&#92;(\gamma'(0)&#92;)</span> for smooth curves <span>&#92;(\gamma : J &#92;\to M&#92;)</span> with <span>&#92;(\gamma(0) = p&#92;)</span>. For any chart <span>&#92;(\sigma&#92;)</span> with <span>&#92;(\sigma(a) = p&#92;)</span>,
<span>&#92;[
T&#95;p M = &#92;\operatorname{Range} D\sigma(a).
&#92;]</span>
This is an <span>&#92;(m&#92;)</span>-dimensional subspace of <span>&#92;(&#92;\mathbb{R}^n&#92;)</span>, and <span>&#92;(D\sigma(a)&#92;)</span> is an isomorphism from <span>&#92;(&#92;\mathbb{R}^m&#92;)</span> to <span>&#92;(T&#95;p M&#92;)</span>.

For example, <span>&#92;(T&#95;p S^{n-1} = \{p\}^\perp = \ker(p^T)&#92;)</span>, the hyperplane perpendicular to <span>&#92;(p&#92;)</span>.

A tangent vector <span>&#92;(X&#95;p &#92;\in T&#95;p M&#92;)</span> acts as a **directional derivative operator**: for any smooth <span>&#92;(f : M &#92;\to &#92;\mathbb{R}&#92;)</span>,
<span>&#92;[
X&#95;p(f) = &#92;\frac{d}{dt}&#92;\Big|&#95;{t=0} f(\gamma(t))
&#92;]</span>
for any smooth <span>&#92;(\gamma&#92;)</span> with <span>&#92;(\gamma(0) = p&#92;)</span>, <span>&#92;(\gamma'(0) = X&#95;p&#92;)</span>. In local coordinates <span>&#92;(\sigma&#92;)</span>, <span>&#92;(X&#95;p(f) = D(f \circ \sigma)(a) \cdot A&#92;)</span> where <span>&#92;(D\sigma(a) A = X&#95;p&#92;)</span>.

A **vector field** on <span>&#92;(M&#92;)</span> is a smooth assignment <span>&#92;(p &#92;\mapsto X&#95;p &#92;\in T&#95;p M&#92;)</span>; in local coordinates <span>&#92;(\sigma&#92;)</span>, it corresponds to a smooth map <span>&#92;(A&#95;\sigma : U&#95;\sigma &#92;\to &#92;\mathbb{R}^m&#92;)</span> with <span>&#92;(X(\sigma(u)) = D\sigma(u) A&#95;\sigma(u)&#92;)</span>.

The **pushforward** of a vector <span>&#92;(X&#95;p &#92;\in T&#95;p M&#92;)</span> by a smooth map <span>&#92;(f : M &#92;\to N&#92;)</span> is
<span>&#92;[
f&#95;&#42; X&#95;p = &#92;\frac{d}{dt}&#92;\Big|&#95;{t=0} f(\gamma(t)) &#92;\in T&#95;{f(p)} N.
&#92;]</span>
In local coordinates, <span>&#92;(f&#95;&#42; X&#95;p = D(f \circ \sigma)(a) A&#95;\sigma&#92;)</span>.

### The Riemannian Metric on Manifolds

**Definition 4.45**: For a chart <span>&#92;(\sigma : U&#95;\sigma &#92;\to M&#92;)</span>, the **Riemannian metric** is <span>&#92;(g&#95;\sigma(u) = D\sigma(u)^T D\sigma(u)&#92;)</span>, giving an inner product on <span>&#92;(T&#95;u U&#95;\sigma = &#92;\mathbb{R}^m&#92;)</span>. This is consistent across charts: if <span>&#92;(\rho = \sigma \circ \psi&#92;)</span> then <span>&#92;(g&#95;\rho = D\psi^T g&#95;\sigma D\psi&#92;)</span>. The length of a curve on <span>&#92;(M&#92;)</span> and integrals of functions over <span>&#92;(M&#92;)</span> are computed using this metric, and are independent of the chart chosen.

---

## Chapter 5: Integration of Differential Forms

### Line Integrals and Flux Integrals

The **line integral** of a smooth map <span>&#92;(F : U &#92;\subseteq &#92;\mathbb{R}^n &#92;\to &#92;\mathbb{R}^n&#92;)</span> along a curve <span>&#92;(\alpha : [a,b] &#92;\to U&#92;)</span> is
<span>&#92;[
&#92;\int&#95;\alpha F &#92;\cdot dL = &#92;\int&#95;a^b F(\alpha(t)) &#92;\cdot \alpha'(t)&#92;\, dt.
&#92;]</span>
The **flux integral** of <span>&#92;(F : U &#92;\subseteq &#92;\mathbb{R}^2 &#92;\to &#92;\mathbb{R}^2&#92;)</span> through a curve <span>&#92;(\alpha : [a,b] &#92;\to U&#92;)</span> is
<span>&#92;[
&#92;\int&#95;\alpha F &#92;\cdot dN = &#92;\int&#95;a^b F(\alpha(t)) &#92;\cdot \alpha'(t)^\times&#92;\, dt
&#92;]</span>
where <span>&#92;(v^\times = (-v&#95;2, v&#95;1)&#92;)</span>. These are the basic examples of integrating a 1-form along a curve.

### Differential Forms

A **smooth <span>&#92;(k&#92;)</span>-form** on an open set <span>&#92;(U &#92;\subseteq &#92;\mathbb{R}^m&#92;)</span> is a smooth map <span>&#92;(\omega : U &#92;\to \Lambda^k(&#92;\mathbb{R}^m)&#92;)</span>, i.e., a smooth assignment of an alternating <span>&#92;(k&#92;)</span>-multilinear function to each point. In coordinates it has the form
<span>&#92;[
&#92;\omega = &#92;\sum&#95;{I} a&#95;I(u)&#92;\, du&#95;I
&#92;]</span>
where the sum is over increasing multi-indices <span>&#92;(I = (i_1 < i_2 < &#92;\cdots < i_k)&#92;)</span>, and <span>&#92;(du&#95;I = du&#95;{i&#95;1} &#92;\wedge &#92;\cdots &#92;\wedge du&#95;{i&#95;k}&#92;)</span>. A smooth 0-form is just a smooth function.

The **integral** of a smooth <span>&#92;(k&#92;)</span>-form <span>&#92;(\omega&#92;)</span> over a smooth regular <span>&#92;(k&#92;)</span>-surface <span>&#92;(\sigma : U&#95;0 &#92;\subseteq &#92;\mathbb{R}^k &#92;\to &#92;\mathbb{R}^m&#92;)</span> on a region <span>&#92;(R &#92;\subseteq U&#95;0&#92;)</span> is
<span>&#92;[
&#92;\int&#95;\sigma \omega = &#92;\int&#95;R &#92;\omega(\sigma(u))&#92;\big(D\sigma(u) e&#95;1, &#92;\ldots, D\sigma(u) e&#95;k&#92;\big)&#92;\, du&#95;1 &#92;\cdots du&#95;k.
&#92;]</span>

### The Wedge Product and Exterior Derivative

The **wedge product** of a <span>&#92;(j&#92;)</span>-form <span>&#92;(\alpha&#92;)</span> and a <span>&#92;(k&#92;)</span>-form <span>&#92;(\beta&#92;)</span> is the <span>&#92;((j+k)&#92;)</span>-form <span>&#92;(\alpha &#92;\wedge \beta&#92;)</span>, characterized by anti-commutativity:
<span>&#92;[
\alpha &#92;\wedge \beta = (-1)^{jk} \beta &#92;\wedge \alpha.
&#92;]</span>

The **exterior derivative** <span>&#92;(d&#92;)</span> sends smooth <span>&#92;(k&#92;)</span>-forms to smooth <span>&#92;((k+1)&#92;)</span>-forms. For a 0-form <span>&#92;(f&#92;)</span>, <span>&#92;(df = \sum&#95;i \frac{\partial f}{\partial u&#95;i} du&#95;i&#92;)</span>. For a <span>&#92;(k&#92;)</span>-form <span>&#92;(\omega = \sum&#95;I a&#95;I du&#95;I&#92;)</span>,
<span>&#92;[
d\omega = &#92;\sum&#95;I da&#95;I &#92;\wedge du&#95;I = &#92;\sum&#95;I &#92;\sum&#95;j &#92;\frac{\partial a&#95;I}{\partial u&#95;j} du&#95;j &#92;\wedge du&#95;I.
&#92;]</span>
The key property is <span>&#92;(d^2 = 0&#92;)</span> (i.e., <span>&#92;(d(d\omega) = 0&#92;)</span> for any smooth form).

The classical vector calculus operations are special cases of <span>&#92;(d&#92;)</span> in <span>&#92;(&#92;\mathbb{R}^3&#92;)</span>: the gradient of a function is <span>&#92;(d&#92;)</span> on 0-forms, the curl corresponds to <span>&#92;(d&#92;)</span> on 1-forms, and the divergence corresponds to <span>&#92;(d&#92;)</span> on 2-forms.

### Stokes-Type Theorems

The following classical theorems are all special cases of a single unified theorem:

**Conservative Field Theorem**: <span>&#92;(\int&#95;\alpha dF = F(\alpha(b)) - F(\alpha(a))&#92;)</span> for smooth <span>&#92;(F&#92;)</span> and curve <span>&#92;(\alpha&#92;)</span>.

**Green's Theorem**: For <span>&#92;(F = (P,Q)&#92;)</span> on a region <span>&#92;(R &#92;\subseteq &#92;\mathbb{R}^2&#92;)</span> with positively-oriented boundary <span>&#92;(\partial R&#92;)</span>:
<span>&#92;[
&#92;\iint&#95;R &#92;\left(&#92;\frac{\partial Q}{\partial x} - &#92;\frac{\partial P}{\partial y}&#92;\right) dA = &#92;\oint&#95;{\partial R} P&#92;\,dx + Q&#92;\,dy.
&#92;]</span>

**Divergence Theorem**: For <span>&#92;(F : U &#92;\subseteq &#92;\mathbb{R}^3 &#92;\to &#92;\mathbb{R}^3&#92;)</span> on a region <span>&#92;(W&#92;)</span> with boundary surface <span>&#92;(\partial W&#92;)</span>:
<span>&#92;[
&#92;\iiint&#95;W &#92;\operatorname{div} F&#92;\, dV = &#92;\oiint&#95;{\partial W} F &#92;\cdot dA.
&#92;]</span>

**Stokes' Theorem**: For a surface <span>&#92;(\Sigma&#92;)</span> in <span>&#92;(&#92;\mathbb{R}^3&#92;)</span> with boundary curve <span>&#92;(\partial\Sigma&#92;)</span>:
<span>&#92;(
&#92;\iint&#95;\Sigma &#92;(\nabla &#92;\times F) &#92;\cdot dA = &#92;\oint&#95;{\partial \Sigma} F &#92;\cdot dL.
&#92;)</span>

### Simplices, Chains, and the Boundary Operator

The standard <span>&#92;(k&#92;)</span>-**simplex** is <span>&#92;(\Delta^k = &#92;\{(t&#95;1, &#92;\ldots, t&#95;k) : t&#95;i &#92;\geq 0,&#92; \sum t&#95;i &#92;\leq 1&#92;}&#92;)</span>. A smooth <span>&#92;(k&#92;)</span>-**surface** on <span>&#92;(\Delta^k&#92;)</span> is a smooth map <span>&#92;(\sigma : \Delta^k &#92;\to U &#92;\subseteq &#92;\mathbb{R}^m&#92;)</span> whose restriction to the interior is regular. A <span>&#92;(k&#92;)</span>-**chain** is a formal finite <span>&#92;(&#92;\mathbb{Z}&#92;)</span>-linear combination of <span>&#92;(k&#92;)</span>-surfaces. The **boundary** <span>&#92;(\partial\sigma&#92;)</span> is the alternating sum of the <span>&#92;((k-1)&#92;)</span>-dimensional faces of <span>&#92;(\sigma&#92;)</span>:
<span>&#92;[
\partial \sigma = &#92;\sum&#95;{j=0}^k (-1)^j \sigma &#92;\circ F&#95;j
&#92;]</span>
where <span>&#92;(F&#95;j&#92;)</span> maps <span>&#92;(\Delta^{k-1}&#92;)</span> to the <span>&#92;(j^{&#92;\text{th}}&#92;)</span> face of <span>&#92;(\Delta^k&#92;)</span>. The key identity is <span>&#92;(\partial^2 = 0&#92;)</span>.

**Theorem 5** (Stokes' Theorem for Chains in <span>&#92;(&#92;\mathbb{R}^m&#92;)</span>): For a smooth <span>&#92;(k&#92;)</span>-surface <span>&#92;(\sigma&#92;)</span> on <span>&#92;(\Delta^k&#92;)</span> and a smooth <span>&#92;((k-1)&#92;)</span>-form <span>&#92;(\omega&#92;)</span> on an open neighborhood of the image,
<span>&#92;[
&#92;\int&#95;\sigma d\omega = &#92;\int&#95;{\partial \sigma} \omega.
&#92;]</span>

*Proof sketch.* By linearity, one reduces to the case <span>&#92;(\omega = a\, du&#95;1 &#92;\wedge &#92;\cdots &#92;\wedge &#92;\widehat{du&#95;j} &#92;\wedge &#92;\cdots &#92;\wedge du&#95;k&#92;)</span>. Applying the fundamental theorem of calculus in the <span>&#92;(j&#92;)</span>-th variable and summing with signs gives the result, with boundary face integrals accounting for the sign pattern via the Cauchy-Binet formula.

### Pullback

The **pullback** of a smooth <span>&#92;(k&#92;)</span>-form <span>&#92;(\beta&#92;)</span> on <span>&#92;(V&#92;)</span> by a smooth map <span>&#92;(f : U &#92;\to V&#92;)</span> is the <span>&#92;(k&#92;)</span>-form <span>&#92;(f^&#42;\beta&#92;)</span> on <span>&#92;(U&#92;)</span> defined by
<span>&#92;[
(f^&#42;\beta)&#95;u(v&#95;1, &#92;\ldots, v&#95;k) = \beta&#95;{f(u)}(Df(u)v&#95;1, &#92;\ldots, Df(u)v&#95;k).
&#92;]</span>
In coordinates, if <span>&#92;(\beta = \sum&#95;I b&#95;I dy&#95;I&#92;)</span> then <span>&#92;(f^&#42;\beta = \sum&#95;I (b&#95;I &#92;\circ f) d(f&#95;{i&#95;1}) &#92;\wedge &#92;\cdots &#92;\wedge d(f&#95;{i&#95;k})&#92;)</span>. Pullback is natural: <span>&#92;(f^&#42;(d\omega) = d(f^&#42;\omega)&#92;)</span> and <span>&#92;(f^&#42;(\alpha &#92;\wedge \beta) = f^&#42;\alpha &#92;\wedge f^&#42;\beta&#92;)</span>.

**Theorem 5.35** (Pullback Formulas): Let <span>&#92;(\sigma : U&#95;0 &#92;\to &#92;\mathbb{R}^m&#92;)</span> be a <span>&#92;(k&#92;)</span>-surface and <span>&#92;(f : U &#92;\to V&#92;)</span> smooth. Then
<span>&#92;[
&#92;\int&#95;{f &#92;\circ \sigma} \omega = &#92;\int&#95;\sigma f^&#42;\omega, &#92;qquad &#92;\int&#95;\sigma f^&#42;\omega = &#92;\int&#95;{f&#95;&#42;\sigma} \omega.
&#92;]</span>

### Stokes' Theorem on Submanifolds

For a smooth <span>&#92;(k&#92;)</span>-form <span>&#92;(\omega&#92;)</span> defined on an open set containing a smooth regular <span>&#92;((k-1)&#92;)</span>-dimensional submanifold <span>&#92;(M &#92;\subseteq &#92;\mathbb{R}^m&#92;)</span> with boundary <span>&#92;(\partial M&#92;)</span>,
<span>&#92;[
&#92;\int&#95;M d\omega = &#92;\int&#95;{\partial M} \omega.
&#92;]</span>
This unifies all the classical theorems: they are all instances of "the integral of the exterior derivative equals the integral on the boundary."

---

## Chapter 6: Tensor Algebras and Differential Forms

### Dual Spaces and Multilinear Maps

For a finite-dimensional vector space <span>&#92;(U&#92;)</span> over a field <span>&#92;(F&#92;)</span>, the **dual space** is <span>&#92;(U^&#42; = &#92;\operatorname{Hom}(U, F)&#92;)</span>, the space of linear functions <span>&#92;(f : U &#92;\to F&#92;)</span>. If <span>&#92;(&#92;\{e&#95;i&#92;}&#92;)</span> is a basis for <span>&#92;(U&#92;)</span>, the **dual basis** <span>&#92;(&#92;\{e&#95;i^&#42;&#92;}&#92;)</span> is defined by <span>&#92;(e&#95;i^&#42;(e&#95;j) = \delta&#95;{ij}&#92;)</span>. We have <span>&#92;(\dim U^&#42; = \dim U&#92;)</span> and the natural isomorphism <span>&#92;(U &#92;\cong (U^&#42;)^&#42;&#92;)</span>.

More generally, a **multilinear map** (or **tensor**) of type <span>&#92;((k)&#92;)</span> on <span>&#92;(U&#92;)</span> is a map <span>&#92;(T : U^k &#92;\to F&#92;)</span> that is linear in each argument separately. The space of all such tensors is written <span>&#92;(T^k(U) = (U^&#42;)^{\otimes k}&#92;)</span>.

### Tensor, Symmetric, and Exterior Algebras

**Definition**: For vector spaces <span>&#92;(U&#95;1, &#92;\ldots, U&#95;k&#92;)</span>, the **tensor product** <span>&#92;(U&#95;1 &#92;\otimes &#92;\cdots &#92;\otimes U&#95;k&#92;)</span> is the vector space generated by symbols <span>&#92;(u&#95;1 &#92;\otimes &#92;\cdots &#92;\otimes u&#95;k&#92;)</span> subject to multilinearity relations. The **tensor algebra** is <span>&#92;(TU = &#92;\bigoplus&#95;{k=0}^\infty T^k U&#92;)</span> with product given by tensor product.

The space of **symmetric <span>&#92;(k&#92;)</span>-forms** <span>&#92;(S^k U&#92;)</span> consists of tensors symmetric under permutation of arguments, and the space of **alternating <span>&#92;(k&#92;)</span>-forms** (or <span>&#92;(k&#92;)</span>-covectors) is <span>&#92;(\Lambda^k U&#92;)</span>, consisting of tensors that change sign under any transposition of two arguments. The exterior (wedge) product makes <span>&#92;(\Lambda U = \bigoplus&#95;{k=0}^\infty \Lambda^k U&#92;)</span> into the **exterior algebra**.

When <span>&#92;(&#92;\{e&#95;1, &#92;\ldots, e&#95;n&#92;}&#92;)</span> is a basis for <span>&#92;(U&#92;)</span>:
- <span>&#92;(T^k U&#92;)</span> has basis <span>&#92;(&#92;\{e&#95;{i&#95;1}^&#42; &#92;\otimes &#92;\cdots &#92;\otimes e&#95;{i&#95;k}^&#42;&#92;}&#92;)</span>, dimension <span>&#92;(n^k&#92;)</span>.
- <span>&#92;(S^k U&#92;)</span> has dimension <span>&#92;(\binom{n+k-1}{k}&#92;)</span>.
- <span>&#92;(\Lambda^k U&#92;)</span> has basis <span>&#92;(&#92;\{e_{i_1}^* &#92;\wedge &#92;\cdots &#92;\wedge e_{i_k}^* : i_1 < i_2 < &#92;\cdots < i_k&#92;}&#92;)</span>, dimension <span>&#92;(\binom{n}{k}&#92;)</span>.

### The Cotangent Space and Coordinate Bases

For a smooth submanifold <span>&#92;(M &#92;\subseteq &#92;\mathbb{R}^n&#92;)</span> with chart <span>&#92;(\sigma : U &#92;\to M&#92;)</span> and <span>&#92;(\sigma(a) = p&#92;)</span>, the **cotangent space** at <span>&#92;(p&#92;)</span> is the dual space <span>&#92;(T&#95;p^&#42; M = (T&#95;p M)^&#42;&#92;)</span>.

The standard coordinates <span>&#92;((u&#95;1, &#92;\ldots, u&#95;m)&#92;)</span> on <span>&#92;(U&#92;)</span> provide:
- **Coordinate tangent vectors** <span>&#92;(&#92;\partial/\partial u&#95;i|&#95;p = D\sigma(a) e&#95;i &#92;\in T&#95;p M&#92;)</span> (a basis for <span>&#92;(T&#95;p M&#92;)</span>).
- **Coordinate 1-forms** <span>&#92;(du&#95;i|&#95;p &#92;\in T&#95;p^&#42; M&#92;)</span> (the dual basis), defined by <span>&#92;(du&#95;i(\partial/\partial u&#95;j) = \delta&#95;{ij}&#92;)</span>.

Under a change of coordinates <span>&#92;(\phi&#92;)</span>, the tangent vectors transform covariantly (<span>&#92;(\partial/\partial u&#95;i = \sum&#95;j (\partial v&#95;j/\partial u&#95;i) \partial/\partial v&#95;j&#92;)</span>) and the 1-forms transform contravariantly (<span>&#92;(du&#95;i = \sum&#95;j (\partial u&#95;i/\partial v&#95;j) dv&#95;j&#92;)</span>).

For a multi-index <span>&#92;(I = (i_1 < &#92;\cdots < i_k)&#92;)</span>, the forms <span>&#92;(du&#95;I = du&#95;{i&#95;1} &#92;\wedge &#92;\cdots &#92;\wedge du&#95;{i&#95;k}&#92;)</span> form a basis for <span>&#92;(\Lambda^k T&#95;p^&#42; M&#92;)</span>.

### Smooth Differential Forms on Manifolds

A **smooth <span>&#92;(k&#92;)</span>-form on <span>&#92;(M&#92;)</span>** is a smooth assignment <span>&#92;(p &#92;\mapsto \omega&#95;p &#92;\in \Lambda^k T&#95;p^&#42; M&#92;)</span>. In local coordinates <span>&#92;(\sigma&#92;)</span>, this has the form <span>&#92;(\omega = \sum&#95;I a&#95;I(u) du&#95;I&#92;)</span> for smooth coefficient functions <span>&#92;(a&#95;I&#92;)</span>. This definition is consistent with and equivalent to the one in Chapter 5.

### Pullback in the Algebraic Framework

For a smooth map <span>&#92;(f : M &#92;\to N&#92;)</span>, the **pullback** <span>&#92;(f^&#42; : \Lambda^k T&#95;{f(p)}^&#42; N &#92;\to \Lambda^k T&#95;p^&#42; M&#92;)</span> is defined by
<span>&#92;[
(f^&#42;\omega)&#95;p(v&#95;1, &#92;\ldots, v&#95;k) = \omega&#95;{f(p)}(f&#95;&#42; v&#95;1, &#92;\ldots, f&#95;&#42; v&#95;k).
&#92;]</span>
This is compatible with the exterior derivative: <span>&#92;(f^&#42;(d\omega) = d(f^&#42;\omega)&#92;)</span>. The definitions of smooth <span>&#92;(k&#92;)</span>-forms and their exterior derivatives given in this chapter via the algebraic framework are consistent with the definitions given in Chapter 5 via coordinate formulas. The algebraic approach makes the coordinate-independence manifest.

---

## Appendix 1: Review of Differentiation

### Differentiability

**Definition A1.1**: A function <span>&#92;(f : U &#92;\subseteq &#92;\mathbb{R}^m &#92;\to &#92;\mathbb{R}^n&#92;)</span> is **differentiable** at <span>&#92;(a &#92;\in U&#92;)</span> if there exists a matrix <span>&#92;(A &#92;\in M&#95;{n &#92;\times m}(&#92;\mathbb{R})&#92;)</span> such that
<span>&#92;[
&#92;\lim&#95;{h &#92;\to 0} &#92;\frac{|f(a+h) - f(a) - Ah|}{|h|} = 0.
&#92;]</span>
When it exists, this matrix <span>&#92;(A&#92;)</span> is unique and equals the Jacobian matrix <span>&#92;(Df(a)&#92;)</span>. If <span>&#92;(f&#92;)</span> is differentiable at <span>&#92;(a&#92;)</span> then <span>&#92;(f&#92;)</span> is continuous at <span>&#92;(a&#92;)</span>. The Jacobian matrix satisfies <span>&#92;(Df(a)&#95;{ij} = \partial x&#95;i/\partial u&#95;j(a)&#92;)</span>. One key bound is: for any matrix <span>&#92;(A&#92;)</span>,
<span>&#92;[
|Ah| &#92;\leq &#92;\|A&#92;\| &#92;\cdot |h| &#92;&#92;quad &#92;\text{where} &#92;&#92;quad &#92;\|A&#92;\|^2 &#92;\leq n &#92;\sum&#95;{i,j} A&#95;{ij}^2.
&#92;]</span>

**Theorem A1.3** (Chain Rule): Let <span>&#92;(f : U &#92;\subseteq &#92;\mathbb{R}^m &#92;\to &#92;\mathbb{R}^k&#92;)</span> be differentiable at <span>&#92;(a&#92;)</span> and <span>&#92;(g : V &#92;\subseteq &#92;\mathbb{R}^k &#92;\to &#92;\mathbb{R}^n&#92;)</span> be differentiable at <span>&#92;(f(a)&#92;)</span>. Then <span>&#92;(g &#92;\circ f&#92;)</span> is differentiable at <span>&#92;(a&#92;)</span> with
<span>&#92;[
D(g &#92;\circ f)(a) = Dg(f(a)) &#92;\cdot Df(a).
&#92;]</span>

The directional derivative of <span>&#92;(f&#92;)</span> at <span>&#92;(a&#92;)</span> in direction <span>&#92;(v&#92;)</span> is <span>&#92;(D&#95;v f(a) = Df(a) v&#92;)</span>. If <span>&#92;(f&#92;)</span> is <span>&#92;(C^1&#92;)</span> (all partial derivatives exist and are continuous) then <span>&#92;(f&#92;)</span> is differentiable.

**Mean Value Theorem**: If <span>&#92;(f : U &#92;\to &#92;\mathbb{R}^n&#92;)</span> is differentiable on the line segment <span>&#92;([a, a+h] &#92;\subseteq U&#92;)</span>, then <span>&#92;(|f(a+h) - f(a)| &#92;\leq \sup&#95;{0 &#92;\leq t &#92;\leq 1} &#92;\|Df(a+th)&#92;\| &#92;\cdot |h|&#92;)</span>.

**Corollary** (Vanishing Derivative): If <span>&#92;(U&#92;)</span> is connected and <span>&#92;(Df &#92;\equiv 0&#92;)</span>, then <span>&#92;(f&#92;)</span> is constant.

### The Inverse Function Theorem: Full Proof

**Theorem A1.6** (Inverse Function Theorem): Let <span>&#92;(f : U &#92;\subseteq &#92;\mathbb{R}^n &#92;\to &#92;\mathbb{R}^n&#92;)</span> be <span>&#92;(C^1&#92;)</span> with <span>&#92;(Df(a)&#92;)</span> invertible.

The proof proceeds via eight claims:

*Claim 1.* There exists <span>&#92;(r > 0&#92;)</span> such that <span>&#92;(Df(x)&#92;)</span> is invertible for all <span>&#92;(x &#92;\in B(a,r)&#92;)</span> and <span>&#92;(&#92;\|Df(x)^{-1}&#92;\| &#92;\leq 2&#92;\|Df(a)^{-1}&#92;\|&#92;)</span>. (By continuity of <span>&#92;(Df&#92;)</span>.)

*Claim 2.* For the map <span>&#92;(g(x) = x - Df(a)^{-1}(f(x) - y)&#92;)</span>, we have <span>&#92;(&#92;\|Dg(x)&#92;\| &#92;\leq 1/2&#92;)</span> for <span>&#92;(x &#92;\in B(a,r)&#92;)</span>.

*Claim 3.* <span>&#92;(g&#92;)</span> is a contraction: <span>&#92;(|g(x&#95;1) - g(x&#95;2)| &#92;\leq \frac{1}{2}|x&#95;1 - x&#95;2|&#92;)</span> for <span>&#92;(x&#95;1, x&#95;2 &#92;\in B(a,r)&#92;)</span>.

*Claim 4.* For each <span>&#92;(y &#92;\in B(f(a), \delta)&#92;)</span> (for suitable <span>&#92;(\delta&#92;)</span>), the equation <span>&#92;(f(x) = y&#92;)</span> has a unique solution <span>&#92;(x &#92;\in B(a,r)&#92;)</span>, obtained as the fixed point of the contraction <span>&#92;(g&#92;)</span>.

*Claim 5.* Setting <span>&#92;(h = f^{-1}: B(f(a),\delta) &#92;\to B(a,r)&#92;)</span>, the map <span>&#92;(h&#92;)</span> is continuous.

*Claim 6.* <span>&#92;(h&#92;)</span> is differentiable with <span>&#92;(Dh(y) = Df(h(y))^{-1}&#92;)</span>.

*Claims 7–8.* <span>&#92;(h&#92;)</span> is <span>&#92;(C^1&#92;)</span>, and if <span>&#92;(f&#92;)</span> is <span>&#92;(C^k&#92;)</span> then <span>&#92;(h&#92;)</span> is <span>&#92;(C^k&#92;)</span> (by induction using the formula <span>&#92;(Dh(y) = Df(h(y))^{-1}&#92;)</span> and the cofactor formula for matrix inverses).

### The Parametric and Implicit Function Theorems

**Parametric Function Theorem** (Appendix version): Same as Theorem 4.10. When <span>&#92;(D\sigma(a)&#92;)</span> has rank <span>&#92;(m&#92;)</span>, the top <span>&#92;(m &#92;\times m&#92;)</span> submatrix of <span>&#92;(D\sigma(a)&#92;)</span> (after reordering) is invertible. Apply the IFT to the first <span>&#92;(m&#92;)</span> components to invert locally, then express the remaining components as a function of the first <span>&#92;(m&#92;)</span>.

**Implicit Function Theorem** (Appendix version): Same as Theorem 4.7. Reduce to the Parametric Function Theorem by showing the level set is locally the graph of a smooth function via the IFT.

---

## Appendix 2: The Generalized Cross Product

### Parallelotopes and Volume

**Definition A2.1**: Given vectors <span>&#92;(u&#95;1, &#92;\ldots, u&#95;k &#92;\in &#92;\mathbb{R}^n&#92;)</span>, the **parallelotope** is
<span>&#92;[
P(u&#95;1, &#92;\ldots, u&#95;k) = &#92;\left&#92;\{ &#92;\sum&#95;{i=1}^k t&#95;i u&#95;i : 0 &#92;\leq t&#95;i &#92;\leq 1 &#92;\right&#92;}.
&#92;]</span>
Its volume is defined recursively by <span>&#92;(V(u&#95;1) = |u&#95;1|&#92;)</span> and
<span>&#92;[
V(u&#95;1, &#92;\ldots, u&#95;k) = V(u&#95;1, &#92;\ldots, u&#95;{k-1}) &#92;\cdot |&#92;\operatorname{Proj}&#95;{U^\perp} u&#95;k|
&#92;]</span>
where <span>&#92;(U = &#92;\operatorname{Span}&#92;\{u&#95;1, &#92;\ldots, u&#95;{k-1}&#92;}&#92;)</span>.

**Theorem A2.2**: For <span>&#92;(A = (u&#95;1, &#92;\ldots, u&#95;k) &#92;\in M&#95;{n &#92;\times k}(&#92;\mathbb{R})&#92;)</span>,
<span>&#92;[
V(u&#95;1, &#92;\ldots, u&#95;k) = &#92;\sqrt{&#92;\det(A^T A)}.
&#92;]</span>

*Proof.* Induction on <span>&#92;(k&#92;)</span>. The base case <span>&#92;(k=1&#92;)</span> is clear. For the inductive step, write <span>&#92;(B = (A, u&#95;k) = (A, v+w)&#92;)</span> where <span>&#92;(v = &#92;\operatorname{Proj}&#95;U u&#95;k &#92;\in &#92;\operatorname{Col}(A)&#92;)</span> and <span>&#92;(w = u&#95;k - v &#92;\in U^\perp = &#92;\operatorname{Null}(A^T)&#92;)</span>. Since <span>&#92;(v &#92;\in &#92;\operatorname{Col}(A)&#92;)</span>, adding it to the last column is an elementary operation not changing the determinant, so <span>&#92;(\det(B^T B) = \det((A,w)^T(A,w))&#92;)</span>. Using <span>&#92;(A^T w = 0&#92;)</span>:
<span>&#92;[
&#92;\det(B^T B) = &#92;\det&#92;\begin{pmatrix} A^T A & 0 \\ 0 & |w|^2 &#92;\end{pmatrix} = &#92;\det(A^T A) &#92;\cdot |w|^2.
&#92;]</span>
Taking square roots: <span>&#92;(\sqrt{\det(B^T B)} = \sqrt{\det(A^T A)} &#92;\cdot |w| = V(u&#95;1,&#92;\ldots,u&#95;{k-1}) &#92;\cdot |w| = V(u&#95;1,&#92;\ldots,u&#95;k)&#92;)</span>. <span>&#92;(&#92;\square&#92;)</span>

In the special case <span>&#92;(k = n&#92;)</span>, <span>&#92;(\det(A^T A) = (\det A)^2&#92;)</span>, so <span>&#92;(V = |\det A|&#92;)</span>. For a simplex <span>&#92;([a&#95;0, &#92;\ldots, a&#95;k]&#92;)</span> with <span>&#92;(u&#95;i = a&#95;i - a&#95;0&#92;)</span>, the volume is <span>&#92;(\frac{1}{k!} V(u&#95;1, &#92;\ldots, u&#95;k) = \frac{1}{k!}\sqrt{\det(A^T A)}&#92;)</span>.

### The Generalized Cross Product

**Definition A2.5**: For <span>&#92;(n &#92;\geq 2&#92;)</span> and a field <span>&#92;(F&#92;)</span>, the **cross product** is the map <span>&#92;(X : M&#95;{n &#92;\times (n-1)}(F) &#92;\to F^n&#92;)</span> defined by: for <span>&#92;(A = (u&#95;1, &#92;\ldots, u&#95;{n-1})&#92;)</span>,
<span>&#92;[
X(A)&#95;j = (-1)^{n+j} &#92;\det A(j)
&#92;]</span>
where <span>&#92;(A(j)&#92;)</span> is <span>&#92;(A&#92;)</span> with the <span>&#92;(j&#92;)</span>-th row removed. In <span>&#92;(F^2&#92;)</span> we write <span>&#92;(X(u) = u^\times = (-u&#95;2, u&#95;1)&#92;)</span>; in <span>&#92;(F^3&#92;)</span> we write <span>&#92;(X(u,v) = u &#92;\times v&#92;)</span>, recovering the usual cross product:
<span>&#92;[
u &#92;\times v = (u&#95;2 v&#95;3 - u&#95;3 v&#95;2,&#92;\; u&#95;3 v&#95;1 - u&#95;1 v&#95;3,&#92;\; u&#95;1 v&#95;2 - u&#95;2 v&#95;1).
&#92;]</span>

Since the determinant is <span>&#92;((n-1)&#92;)</span>-linear and alternating, the cross product is also **<span>&#92;((n-1)&#92;)</span>-linear and alternating**.

**Theorem A2.9** (Properties of the Cross Product): For <span>&#92;(u&#95;1, &#92;\ldots, u&#95;{n-1}, v&#95;1, &#92;\ldots, v&#95;{n-1}, w &#92;\in &#92;\mathbb{R}^n&#92;)</span> and <span>&#92;(A = (u&#95;1, &#92;\ldots, u&#95;{n-1}), B = (v&#95;1, &#92;\ldots, v&#95;{n-1}) &#92;\in M&#95;{n &#92;\times (n-1)}&#92;)</span>:

1. **Dot product formula**: <span>&#92;(X(u&#95;1, &#92;\ldots, u&#95;{n-1}) &#92;\cdot w = &#92;\det(u&#95;1, &#92;\ldots, u&#95;{n-1}, w)&#92;)</span>.
2. **Orthogonality**: <span>&#92;(X(u&#95;1, &#92;\ldots, u&#95;{n-1}) &#92;\cdot u&#95;k = 0&#92;)</span> for each <span>&#92;(1 &#92;\leq k < n&#92;)</span>.
3. **Zero iff dependent**: <span>&#92;(X(u&#95;1, &#92;\ldots, u&#95;{n-1}) = 0&#92;)</span> iff <span>&#92;(\{u&#95;1, &#92;\ldots, u&#95;{n-1}&#92;}&#92;)</span> is linearly dependent.
4. **Positive orientation**: When <span>&#92;(w = X(u&#95;1, &#92;\ldots, u&#95;{n-1}) &#92;\neq 0&#92;)</span>, the <span>&#92;(n&#92;)</span>-tuple <span>&#92;((u&#95;1, &#92;\ldots, u&#95;{n-1}, w)&#92;)</span> is a positively oriented basis for <span>&#92;(&#92;\mathbb{R}^n&#92;)</span>.
5. **Volume formula**: <span>&#92;(|X(u&#95;1, &#92;\ldots, u&#95;{n-1})| = V(u&#95;1, &#92;\ldots, u&#95;{n-1})&#92;)</span>.
6. **Generalized Binet formula**: <span>&#92;(X(u&#95;1,&#92;\ldots,u&#95;{n-1}) &#92;\cdot X(v&#95;1,&#92;\ldots,v&#95;{n-1}) = &#92;\det(B^T A)&#92;)</span>.
7. **Iterated cross product**:
<span>&#92;[
X&#92;\big(u&#95;1,&#92;\ldots,u&#95;{n-2}, X(v&#95;1,&#92;\ldots,v&#95;{n-1})&#92;\big) = &#92;\sum&#95;{i=1}^{n-1} (-1)^{n+i} &#92;\det&#92;\big((B^T A)^{(i)}&#92;\big) v&#95;i
&#92;]</span>
where <span>&#92;((B^T A)^{(i)}&#92;)</span> denotes <span>&#92;(B^T A&#92;)</span> with the <span>&#92;(i&#92;)</span>-th row removed.

*Proof of Property 1.* From <span>&#92;(X(A)&#95;j = (-1)^{n+j} \det A(j)&#92;)</span>,
<span>&#92;[
X(A) &#92;\cdot w = &#92;\sum&#95;{j=1}^n (-1)^{n+j} &#92;\det A(j) w&#95;j = &#92;\det(u&#95;1, &#92;\ldots, u&#95;{n-1}, w)
&#92;]</span>
by cofactor expansion along the last column. Property 2 follows since <span>&#92;(\det&#92;)</span> with a repeated column is zero.

*Proof of Property 6.* Let <span>&#92;(x = X(A)&#92;)</span> and <span>&#92;(y = X(B)&#92;)</span>. By Property 1, <span>&#92;(x &#92;\cdot y = \det(A,y)&#92;)</span> and <span>&#92;(x &#92;\cdot y = \det(B,x)&#92;)</span>. By Properties 1 and 2, <span>&#92;(A^T x = 0 = B^T y&#92;)</span>. Then:
<span>&#92;[
(x &#92;\cdot y)^2 = &#92;\det(A,y)&#92;\det(B,x) = &#92;\det&#92;\begin{pmatrix} B^T A & B^T y \\ x^T A & x^T y &#92;\end{pmatrix} = &#92;\det&#92;\begin{pmatrix} B^T A & 0 \\ 0 & x &#92;\cdot y &#92;\end{pmatrix} = (x &#92;\cdot y) &#92;\det(B^T A).
&#92;]</span>
When <span>&#92;(x &#92;\cdot y &#92;\neq 0&#92;)</span>, divide to get <span>&#92;(x &#92;\cdot y = \det(B^T A)&#92;)</span>. When <span>&#92;(x &#92;\cdot y = 0&#92;)</span>, one shows directly that <span>&#92;(\det(B^T A) = 0&#92;)</span> as well (either <span>&#92;(x=0&#92;)</span> or <span>&#92;(y=0&#92;)</span> gives rank deficiency, or <span>&#92;(y &#92;\in &#92;\operatorname{Col}(A)&#92;\cap &#92;\operatorname{Null}(B^T)&#92;)</span> gives a nonzero vector in the kernel of <span>&#92;(B^T A&#92;)</span>). Alternatively, both sides are polynomials in the entries of the vectors and unique factorization completes the argument.

### Change of Variables Formula

**Theorem**: For invertible <span>&#92;(P &#92;\in M&#95;n(&#92;\mathbb{R})&#92;)</span> and <span>&#92;(A &#92;\in M&#95;{n &#92;\times (n-1)}(&#92;\mathbb{R})&#92;)</span>,
<span>&#92;[
P^T X(PA) = (\det P) X(A).
&#92;]</span>

*Proof.* The <span>&#92;(i&#92;)</span>-th entry of <span>&#92;(P^T X(PA)&#92;)</span> is <span>&#92;(v&#95;i^T X(PA) = \det(PA, v&#95;i)&#92;)</span> where <span>&#92;(v&#95;i&#92;)</span> is the <span>&#92;(i&#92;)</span>-th column of <span>&#92;(P&#92;)</span>. Expanding via cofactors and using the cofactor identity <span>&#92;(\operatorname{Cof}(P) P = \det(P) I&#92;)</span>, one shows that the <span>&#92;(i&#92;)</span>-th entry equals <span>&#92;((\det P) X(A)&#95;i&#92;)</span>. Both sides are polynomials in the entries, so the identity extends by continuity to all <span>&#92;(P&#92;)</span> (including non-invertible ones). Replacing <span>&#92;(P&#92;)</span> by <span>&#92;(P^T&#92;)</span> yields the equivalent form <span>&#92;(P X(P^T A) = (\det P) X(A)&#92;)</span>.

This change of variables formula is used in the proof of Property 7 above: one expresses <span>&#92;(X(A,y)&#92;)</span> in terms of the basis <span>&#92;(\{v&#95;1,&#92;\ldots,v&#95;{n-1},y\}&#92;)</span> using the matrix <span>&#92;(P = (B, y)&#92;)</span> (whose determinant is <span>&#92;(|y|^2&#92;)</span> by Property 1) and then applies the change of variables formula.

