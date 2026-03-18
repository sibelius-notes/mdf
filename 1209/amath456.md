---
title: "AMATH 456: Calculus of Variations and Optimal Control Theory"
layout: toc
parent: Fall 2020
prof: Kirsten Morris
---

<style>
.embed-container {
  position: relative;
  padding-bottom: 56.25%;
  height: 0;
  overflow: hidden;
  max-width: 100%;
}
.embed-container iframe,
.embed-container object,
.embed-container embed {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
</style>

# AMATH 456: Calculus of Variations and Optimal Control Theory

## Week 1: Optimization and Convexity in R<sup>n</sup>

### 1.1 Optimization in One Dimension

Every optimization problem requires two things: a cost function to minimize, and a domain over which to search. Starting in one dimension, consider a real-valued function <span>&#92;(J : &#92;mathbb{R} &#92;to &#92;mathbb{R}&#92;)</span> and a subdomain <span>&#92;(D = [a, b] &#92;subseteq &#92;mathbb{R}&#92;)</span>. The goal is to find <span>&#92;(\min_{y \in D} J(y)&#92;)</span>.

**Definition 1.1 (Global minimum).** A point <span>&#92;(y^* \in D&#92;)</span> *minimizes* <span>&#92;(J&#92;)</span> over <span>&#92;(D&#92;)</span> if <span>&#92;(J(y^*) \leq J(y)&#92;)</span> for all <span>&#92;(y \in D&#92;)</span>. It is a *local minimum* if there exists <span>&#92;(\epsilon > 0&#92;)</span> such that <span>&#92;(J(y^*) \leq J(y)&#92;)</span> for all <span>&#92;(y \in B_\epsilon(y^*)&#92;)</span>.

The derivative of <span>&#92;(J&#92;)</span> at a point <span>&#92;(y&#92;)</span> is defined as the limit <span>&#92;(J'(y) = \lim_{v \to 0} \frac{J(y+v) - J(y)}{v}&#92;)</span>, when it exists.

**Theorem 1.4 (Necessary condition).** If <span>&#92;(J&#92;)</span> is differentiable and <span>&#92;(y^* \in U&#92;)</span> (interior of <span>&#92;(D&#92;)</span>) is a local minimum, then <span>&#92;(J'(y^*) = 0&#92;)</span>.

The proof considers small perturbations <span>&#92;(v > 0&#92;)</span> and <span>&#92;(v < 0&#92;)</span> separately: for <span>&#92;(v > 0&#92;)</span>, <span>&#92;(\frac{J(y^*+v) - J(y^*)}{v} \geq 0&#92;)</span>, which gives <span>&#92;(J'(y^*) \geq 0&#92;)</span> in the limit; for <span>&#92;(v < 0&#92;)</span>, the inequality flips to give <span>&#92;(J'(y^*) \leq 0&#92;)</span>. Together, <span>&#92;(J'(y^*) = 0&#92;)</span>. The converse is not true in general.

### 1.2 Optimization in R<sup>n</sup>

For functions <span>&#92;(J : &#92;mathbb{R}^n \to &#92;mathbb{R}&#92;)</span>, differentiability at <span>&#92;(y^* \in D&#92;)</span> means there exists a gradient vector <span>&#92;(&#92;nabla J(y^*)&#92;)</span> such that

<span>&#92;[J(y^* + v) = J(y^*) + &#92;nabla J(y^*) &#92;cdot v + R(y^*, v)&#92;]</span>

with <span>&#92;(\lim_{&#92;|v&#92;| \to 0} &#92;frac{&#92;|R(y^*, v)&#92;|}{&#92;|v&#92;|} = 0&#92;)</span>.

A weaker notion is the **directional derivative** (Definition 1.7):

<span>&#92;[&#92;delta J(y; v) = &#92;lim_{&#92;epsilon &#92;to 0} &#92;frac{J(y + &#92;epsilon v) - J(y)}{&#92;epsilon}&#92;]</span>

when the limit exists. For differentiable <span>&#92;(J&#92;)</span>, the directional derivative equals <span>&#92;(&#92;nabla J(y) &#92;cdot v&#92;)</span>.

**Theorem 1.10 (Gradient condition).** If <span>&#92;(J&#92;)</span> is differentiable and <span>&#92;(y^o&#92;)</span> is a local minimum, then <span>&#92;(&#92;nabla J(y^o) = 0&#92;)</span>. The proof mirrors the one-dimensional argument: non-negativity of the directional derivative in direction <span>&#92;(v&#92;)</span> and in direction <span>&#92;(-v&#92;)</span> forces <span>&#92;(&#92;nabla J(y^o) &#92;cdot v = 0&#92;)</span> for all <span>&#92;(v&#92;)</span>.

**Definition 1.11 (Stationary point).** A point <span>&#92;(y^*&#92;)</span> is a **stationary point** of <span>&#92;(J&#92;)</span> if <span>&#92;(&#92;delta J(y^*; v) = 0&#92;)</span> for all admissible directions <span>&#92;(v&#92;)</span>. For differentiable functions this is equivalent to <span>&#92;(&#92;nabla J(y^*) = 0&#92;)</span>.

### 1.3 Convexity in R<sup>n</sup>

**Definition 1.12 (Convex set).** A set <span>&#92;(D &#92;subseteq &#92;mathbb{R}^n&#92;)</span> is **convex** if for any two points <span>&#92;(x, y &#92;in D&#92;)</span> and <span>&#92;(0 < &#92;alpha < 1&#92;)</span>, the point <span>&#92;(&#92;alpha x + (1-&#92;alpha)y &#92;in D&#92;)</span>. Geometrically, the straight line segment between any two points lies entirely within the set.

**Definition 1.13 (Convex function).** A function <span>&#92;(J : &#92;mathbb{R}^n &#92;to &#92;mathbb{R}&#92;)</span> is **convex** on <span>&#92;(D&#92;)</span> if for all <span>&#92;(a, b &#92;in D&#92;)</span> and <span>&#92;(0 < &#92;alpha < 1&#92;)</span>,

<span>&#92;[J(a + &#92;alpha(b - a)) &#92;leq &#92;alpha J(b) + (1 - &#92;alpha) J(a).&#92;]</span>

Strict inequality defines **strict convexity**. The epigraph characterization is equivalent: <span>&#92;(J&#92;)</span> is convex if and only if the set of points above its graph, <span>&#92;(\text{epi}\,J = &#92;{(x, y) : y &#92;geq J(x)&#92;}&#92;)</span>, is convex.

The power of convexity is captured in the following:

**Theorem 1.16.** If <span>&#92;(J&#92;)</span> is convex on <span>&#92;(D&#92;)</span>, then every stationary point in the interior of <span>&#92;(D&#92;)</span> minimizes <span>&#92;(J&#92;)</span> globally on <span>&#92;(D&#92;)</span>.

This theorem eliminates the need to check second-order conditions or compare multiple critical points; a single stationary point of a convex function is automatically the global minimum.

For differentiable convex functions, **Theorem 1.15** provides an equivalent characterization:

<span>&#92;[J(y + v) &#92;geq J(y) + &#92;nabla J(y) &#92;cdot v &#92;quad &#92;text{for all } y, y+v &#92;in D.&#92;]</span>

Geometrically: a convex function always lies above its tangent plane.

### 1.4 Second-Derivative Test for Convexity

For smooth enough functions, the **Hessian matrix** <span>&#92;(H_J(y) = &#92;left[&#92;\frac{&#92;partial^2 J}{&#92;\partial y_i &#92;\partial y_j}&#92;right]&#92;)</span> characterizes convexity:

**Theorem 1.21.** A twice continuously differentiable function <span>&#92;(f&#92;)</span> on a convex set <span>&#92;(D &#92;subseteq &#92;mathbb{R}^n&#92;)</span> is (strictly) convex if and only if the Hessian is positive semi-definite (positive definite) at each point in <span>&#92;(D&#92;)</span>.

**Definition 1.20.** A symmetric matrix <span>&#92;(M &#92;in &#92;mathbb{R}^{n&#92;times n}&#92;)</span> is:
- **Positive semi-definite** if <span>&#92;(x^T M x &#92;geq 0&#92;)</span> for all <span>&#92;(x&#92;)</span>;
- **Positive definite** if also <span>&#92;(x^T M x = 0 &#92;Rightarrow x = 0&#92;)</span>;
- **Negative (semi-)definite** if <span>&#92;(-M&#92;)</span> is positive (semi-)definite;
- **Indefinite** if <span>&#92;(x^T M x&#92;)</span> takes both positive and negative values.

**Theorem 1.23 (Second-order test).** At a critical point <span>&#92;(a&#92;)</span> of <span>&#92;(f &#92;in C^2(D)&#92;)</span>:
- If <span>&#92;(H_f(a)&#92;)</span> is positive definite, <span>&#92;(a&#92;)</span> is a local minimum.
- If <span>&#92;(H_f(a)&#92;)</span> is negative definite, <span>&#92;(a&#92;)</span> is a local maximum.
- If <span>&#92;(H_f(a)&#92;)</span> is indefinite, <span>&#92;(a&#92;)</span> is a saddle point.

If <span>&#92;(H_f&#92;)</span> is only semi-definite at the critical point, no conclusion can be drawn from the Hessian alone—further analysis is required.

---

## Week 2: Calculus on Linear Spaces

### 2.1 Linear Spaces and Functionals

To extend optimization from vectors to functions, the framework must generalize from <span>&#92;(&#92;mathbb{R}^n&#92;)</span> to infinite-dimensional spaces. The concept of a real linear space provides the foundation.

**Definition 2.1 (Real linear space).** A set <span>&#92;(Y&#92;)</span> with operations of addition and scalar multiplication (by real numbers) is a **real linear space** if it satisfies the standard axioms: closure under both operations, commutativity and associativity of addition, existence of a zero element and additive inverses, distributivity, and a scalar identity. Classical examples include <span>&#92;(&#92;mathbb{R}^n&#92;)</span> itself, the space <span>&#92;(M_{m &#92;times n}(&#92;mathbb{R})&#92;)</span> of real matrices, and the function space <span>&#92;(C[a,b]&#92;)</span> of continuous real-valued functions on <span>&#92;([a,b]&#92;)</span>.

**Definition 2.5 (Functional).** A **functional** is an operator <span>&#92;(J : Y &#92;to &#92;mathbb{R}&#92;)</span> where <span>&#92;(Y&#92;)</span> is a linear space. The problems studied in this course take the form <span>&#92;(\min_{y \in D} J(y)&#92;)</span> where <span>&#92;(D &#92;subseteq Y&#92;)</span>.

A key example is the arc-length functional <span>&#92;(J(y) = &#92;int_0^5 &#92;sqrt{1 + y'(x)^2}\, dx&#92;)</span> on <span>&#92;(C^1[0,5]&#92;)</span>, which measures the length of the curve <span>&#92;(y(x)&#92;)</span>.

### 2.2 Geodesics on a Sphere

A geodesic on a sphere of radius <span>&#92;(R&#92;)</span> is the curve of shortest length joining two points on the surface. Parametrizing by <span>&#92;(\phi&#92;)</span> (latitude) and <span>&#92;(\theta&#92;)</span> (longitude), the length functional is

<span>&#92;[J(&#92;phi, &#92;theta) = R &#92;int_0^1 &#92;sqrt{&#92;sin^2(&#92;phi(t))&#92;\dot{&#92;theta}(t)^2 + &#92;\dot{&#92;phi}(t)^2}\,dt.&#92;]</span>

By orienting the sphere so that one point is at the north pole and both points share the same meridian, the problem simplifies dramatically. Setting <span>&#92;(\theta(t) = \theta_B&#92;)</span> (constant), any smooth <span>&#92;(\phi&#92;)</span> connecting the two latitudes achieves the minimum length <span>&#92;(R\phi_B&#92;)</span>. This is a **great circle** arc, confirming that geodesics on spheres are arcs of great circles.

### 2.3 The Gateaux Derivative

The analogue of the directional derivative in a linear space is the **Gateaux derivative**.

**Definition 2.7.** For <span>&#92;(J : D &#92;subseteq Y &#92;to &#92;mathbb{R}&#92;)</span> and <span>&#92;(y, v &#92;in D&#92;)</span>, the **Gateaux derivative** (or **variation**) is

<span>&#92;[&#92;delta J(y; v) = &#92;lim_{&#92;epsilon &#92;to 0} &#92;frac{J(y + &#92;epsilon v) - J(y)}{&#92;\epsilon},&#92;]</span>

when it exists. If <span>&#92;(\frac{&#92;\partial}{&#92;\partial &#92;\epsilon} J(y + &#92;\epsilon v)&#92;)</span> exists and is continuous at <span>&#92;(\epsilon = 0&#92;)</span>, it can be computed as

<span>&#92;[&#92;delta J(y; v) = &#92;left.&#92;\frac{&#92;\partial}{&#92;\partial &#92;\epsilon} J(y + &#92;\epsilon v)&#92;\right|_{&#92;\epsilon = 0}.&#92;]</span>

For the arc-length functional <span>&#92;(J(y) = &#92;int_0^5 &#92;sqrt{1 + (y')^2}\,dx&#92;)</span>, this formula gives

<span>&#92;[&#92;delta J(y; v) = &#92;int_0^5 2y'(x)v'(x)\,dx.&#92;]</span>

### 2.4 Convex Functionals

The definitions and key theorems from <span>&#92;(&#92;mathbb{R}^n&#92;)</span> carry over verbatim to general linear spaces.

**Definition 2.11 (Convex functional).** <span>&#92;(J : Y &#92;to &#92;mathbb{R}&#92;)</span> is **convex** on <span>&#92;(D &#92;subseteq Y&#92;)</span> if for all <span>&#92;(y, x &#92;in D&#92;)</span> and <span>&#92;(0 < &#92;alpha < 1&#92;)</span>,

<span>&#92;[J(y + &#92;alpha(x - y)) &#92;leq &#92;alpha J(x) + (1 - &#92;alpha)J(y).&#92;]</span>

**Definition 2.14 (Stationary point of a functional).** If <span>&#92;(&#92;delta J(y^*; v) = 0&#92;)</span> for all admissible variations <span>&#92;(v&#92;)</span>, then <span>&#92;(y^*&#92;)</span> is a **stationary point** of <span>&#92;(J&#92;)</span>.

**Proposition 2.15.** If <span>&#92;(J&#92;)</span> is convex on <span>&#92;(D&#92;)</span>, then every stationary point <span>&#92;(y_0 \in D&#92;)</span> minimizes <span>&#92;(J&#92;)</span> on <span>&#92;(D&#92;)</span>. If <span>&#92;(J&#92;)</span> is strictly convex, the minimizing element is unique. This is the infinite-dimensional analogue of Theorem 1.16 and is proved identically: convexity implies <span>&#92;(J(y) \geq J(y_0) + &#92;delta J(y_0; y - y_0) = J(y_0)&#92;)</span> for all <span>&#92;(y \in D&#92;)</span>.

---

## Week 3: The Euler–Lagrange Equation

### 3.1 Derivation

Consider the fundamental class of functionals of the form

<span>&#92;[J(y) = &#92;int_a^b f(x, y(x), y'(x))\,dx,&#92;]</span>

where <span>&#92;(f : &#92;mathbb{R}^3 &#92;to &#92;mathbb{R}&#92;)</span>. The function <span>&#92;(f&#92;)</span> is called the **Lagrangian** (in honour of Lagrange's contributions). Many classical problems — geodesics, brachistochrone, minimal surfaces — take this form.

**Theorem 3.1 (Gateaux derivative of J).** Assuming <span>&#92;(f, f_y, f_z&#92;)</span> are continuous on <span>&#92;([a,b] &#92;\times D&#92;)</span> (where <span>&#92;(z = y'&#92;)</span>), the Gateaux derivative is

<span>&#92;[&#92;delta J(y; v) = &#92;int_a^b &#92;left[f_y(x, y, y')v(x) + f_z(x, y, y')v'(x)&#92;\right]dx.&#92;]</span>

For stationary functions over the set <span>&#92;(D = &#92;{y &#92;in C^1[a,b] : y(a) = y_a,\, y(b) = y_b&#92;}&#92;)</span>, admissible variations must satisfy <span>&#92;(v(a) = v(b) = 0&#92;)</span>.

Integrating by parts on the second term and using the boundary conditions, the Gateaux derivative becomes

<span>&#92;[&#92;delta J(y; v) = &#92;int_a^b &#92;left[f_y[y(x)] - &#92;\frac{d}{dx}f_z[y(x)]&#92;\right]v(x)\,dx.&#92;]</span>

**Theorem 3.5 (Euler–Lagrange).** A function <span>&#92;(y&#92;)</span> is a stationary function of <span>&#92;(J&#92;)</span> on <span>&#92;(D&#92;)</span> *if and only if* it satisfies the **Euler–Lagrange equation**:

<span>&#92;[&#92;\frac{d}{dx} f_z[y(x)] = f_y[y(x)].&#92;]</span>

The "if" direction (Proposition 3.2) follows immediately from the integration-by-parts computation above. The "only if" direction requires the **du Bois-Reymond Lemma** and Lemma 3.4, which together show that any function making <span>&#92;(&#92;delta J(y; v) = 0&#92;)</span> for all admissible <span>&#92;(v&#92;)</span> must satisfy the Euler–Lagrange equation.

**Lemma 3.3 (du Bois-Reymond).** If <span>&#92;(h &#92;in C[a,b]&#92;)</span> and <span>&#92;(&#92;int_a^b h(x)v'(x)\,dx = 0&#92;)</span> for all <span>&#92;(v &#92;in A&#92;)</span>, then <span>&#92;(h&#92;)</span> is constant on <span>&#92;([a,b]&#92;)</span>.

### 3.2 Simplifications

If <span>&#92;(f&#92;)</span> is missing one of its arguments, the Euler–Lagrange equation simplifies considerably:

1. **<span>&#92;(f&#92;)</span> independent of <span>&#92;(y'&#92;)</span>:** The equation becomes <span>&#92;(f_y = 0&#92;)</span>, an algebraic equation rather than a differential equation.

2. **<span>&#92;(f&#92;)</span> independent of <span>&#92;(y&#92;)</span>:** <span>&#92;(f_y = 0&#92;)</span>, so the equation becomes <span>&#92;(\frac{d}{dx}f_z = 0&#92;)</span>, or <span>&#92;(f_z = c&#92;)</span> (constant). This first integral is easier to solve.

3. **<span>&#92;(f&#92;)</span> independent of <span>&#92;(x&#92;)</span> (Beltrami identity):** If <span>&#92;(y &#92;in C^2[a,b]&#92;)</span>, any stationary function satisfies

<span>&#92;[f(y, y') - y' f_z(y, y') = &#92;text{constant}.&#92;]</span>

This is a **first-order** equation, significantly easier to solve than the general second-order Euler–Lagrange equation.

### 3.3 Pointwise Convexity

**Definition 3.10.** The function <span>&#92;(f : &#92;mathbb{R}^3 &#92;to &#92;mathbb{R}&#92;)</span> is **pointwise convex** on <span>&#92;(S&#92;)</span> if <span>&#92;(f, f_y, f_z&#92;)</span> are continuous and

<span>&#92;[f(x, y+v, z+w) - f(x, y, z) - f_y v - f_z w &#92;\geq 0&#92;]</span>

for all perturbations <span>&#92;((v, w)&#92;)</span>. Note that <span>&#92;(x&#92;)</span> is held fixed, so a convex function is also pointwise convex, but not necessarily vice versa.

**Theorem 3.13.** If <span>&#92;(f&#92;)</span> is pointwise convex, then the functional <span>&#92;(J(y) = &#92;int_a^b f[y]\,dx&#92;)</span> is convex on <span>&#92;(D = &#92;{y &#92;in C^1[a,b] : y(a) = y_a,\, y(b) = y_b, (y(x), y'(x)) &#92;in D&#92;}&#92;)</span>. Strict pointwise convexity gives strict convexity of <span>&#92;(J&#92;)</span>.

**Proposition 3.15.** If <span>&#92;(f = f(x, z)&#92;)</span> (independent of <span>&#92;(y&#92;)</span>) and <span>&#92;(f_{zz}(x, z) > 0&#92;)</span> for all <span>&#92;(x&#92;)</span>, then <span>&#92;(J&#92;)</span> is strictly convex. The proof uses Taylor's remainder theorem to show <span>&#92;(f(x, z+w) > f(x,z) + f_z(x,z)w&#92;)</span>.

### 3.4 The Brachistochrone Problem

The **brachistochrone** asks: what path minimizes the travel time for a bead sliding under gravity (frictionlessly) between two points? This historical problem, solved by Bernoulli in 1696, was the founding problem of the calculus of variations.

Reversing the standard coordinate system so that <span>&#92;(x&#92;)</span> is vertical and <span>&#92;(y&#92;)</span> horizontal, conservation of energy gives <span>&#92;(v = &#92;sqrt{2gx}&#92;)</span>, and the travel time functional becomes

<span>&#92;[T(y) = &#92;int_0^a &#92;\frac{&#92;\sqrt{1 + (y'(x))^2}}{&#92;\sqrt{2gx}}\,dx.&#92;]</span>

Since <span>&#92;(f_{zz}(x,z) = &#92;\frac{1}{(2gx)^{1/2}(1+z^2)^{3/2}} > 0&#92;)</span> for <span>&#92;(x > 0&#92;)</span>, Proposition 3.15 implies <span>&#92;(T&#92;)</span> is strictly convex, so the unique stationary function minimizes <span>&#92;(T&#92;)</span>.

Since <span>&#92;(f&#92;)</span> is independent of <span>&#92;(y&#92;)</span>, the Euler–Lagrange equation reduces to <span>&#92;(f_z = c&#92;)</span>:

<span>&#92;[&#92;\frac{y'}{&#92;\sqrt{x}&#92;\sqrt{1+(y')^2}} = c.&#92;]</span>

Solving this via the substitution <span>&#92;(x(&#92;\theta) = &#92;\frac{k^2}{2}(1 - &#92;\cos &#92;\theta)&#92;)</span> leads to the parametric solution

<span>&#92;[x(&#92;\theta) = &#92;\frac{k^2}{2}(1-&#92;\cos&#92;\theta), &#92;&#92;quad y(&#92;\theta) = &#92;\frac{k^2}{2}(&#92;\theta - &#92;\sin&#92;\theta).&#92;]</span>

This curve is a **cycloid** — the path traced by a point on the rim of a rolling circle. The constant <span>&#92;(k&#92;)</span> is determined by the endpoint <span>&#92;((a, b)&#92;)</span>.

---

## Week 4: Extensions and Generalizations

### 4.1 Natural Boundary Conditions

When not all boundary conditions are prescribed, the variational problem determines the missing conditions automatically. Suppose <span>&#92;(y(a) = y_a&#92;)</span> is fixed but <span>&#92;(y(b)&#92;)</span> is free. Admissible variations satisfy <span>&#92;(v(a) = 0&#92;)</span> but <span>&#92;(v(b)&#92;)</span> is free. Integration by parts on <span>&#92;(&#92;\delta J(y;v)&#92;)</span> yields a boundary term <span>&#92;(f_z[y(b)]v(b)&#92;)</span> in addition to the Euler–Lagrange integral.

**Theorem 4.2.** A function <span>&#92;(y&#92;)</span> is stationary for <span>&#92;(J&#92;)</span> on <span>&#92;(D_1 = &#92;{y &#92;in C^1[a,b] : y(a) = y_a&#92;}&#92;)</span> if and only if it satisfies the Euler–Lagrange equation *and* the **natural boundary condition**

<span>&#92;[f_z[y(b)] = 0.&#92;]</span>

**Example 4.3 (Steady-state temperature).** A bar of length <span>&#92;(L&#92;)</span> with one end fixed at <span>&#92;(y(0) = 100&#92;)</span> and the other free minimizes <span>&#92;(U(y) = k &#92;int_0^L (y')^2\,dx&#92;)</span>. The natural boundary condition <span>&#92;(f_z[y(L)] = 2ky'(L) = 0&#92;)</span> means no heat flux at the free end. Together with the Euler–Lagrange equation <span>&#92;(y'' = 0&#92;)</span>, the unique solution is <span>&#92;(y(x) = 100&#92;)</span> (constant temperature).

If neither endpoint is specified (Theorem 4.4), the natural boundary conditions become <span>&#92;(f_z[y(a)] = f_z[y(b)] = 0&#92;)</span>, and the minimizing function is unique up to an additive constant when <span>&#92;(f&#92;)</span> is strictly pointwise convex.

### 4.2 Variable Endpoint Problems and Transversality

When the endpoint <span>&#92;(b&#92;)</span> is free and <span>&#92;(y(b)&#92;)</span> must lie on a given curve <span>&#92;(&#92;\varphi(x)&#92;)</span>, both the function and the endpoint vary. Introducing the **conjugate momentum** <span>&#92;(p[y(x)] = f_z[y(x)]&#92;)</span> and the **Hamiltonian** <span>&#92;(H[y(x)] = -f[y(x)] + y'(x)f_z[y(x)]&#92;)</span>, the stationarity condition yields:

**Theorem 4.7 (Transversality condition).** A stationary function satisfies the Euler–Lagrange equation and the **transversality condition**

<span>&#92;[H[y(b)] = p[y(b)]&#92;\varphi'(b),&#92;]</span>

i.e., <span>&#92;(-f[y(b)] + y'(b)f_z[y(b)] = f_z[y(b)]&#92;\varphi'(b)&#92;)</span>. Geometrically, this means the optimal curve meets the target curve <span>&#92;(&#92;\varphi&#92;)</span> **perpendicularly** in the appropriate metric.

For the brachistochrone landing on a curve, this condition implies the cycloid is orthogonal to the landing curve at the point of contact.

### 4.3 Higher-Order Derivatives

Some physical problems involve second derivatives. The potential energy of a beam under load <span>&#92;(p(x)&#92;)</span> and small deflection <span>&#92;(y(x)&#92;)</span> is

<span>&#92;[U(y) = &#92;int_0^L &#92;\frac{&#92;\mu}{2}(y''(x))^2 - p(x)y(x)\,dx.&#92;]</span>

For functionals <span>&#92;(J(y) = &#92;int_a^b f(x, y, y', y'')\,dx&#92;)</span> with fully specified boundary conditions, integration by parts twice yields the **generalized Euler–Lagrange equation**:

<span>&#92;[f_y[y] - &#92;\frac{d}{dx}f_z[y] + &#92;\frac{d^2}{dx^2}f_w[y] = 0&#92;]</span>

where <span>&#92;(z = y', w = y''&#92;)</span>. For the beam problem with both ends clamped, this gives <span>&#92;(&#92;\mu y'''' = p(x)&#92;)</span>, which under uniform load <span>&#92;(p = &#92;\mu F&#92;)</span> integrates to <span>&#92;(y(x) = &#92;\frac{F}{24}x^2(x-L)^2&#92;)</span>.

### 4.4 Broken Extremals (Weierstrass–Erdmann Conditions)

In some problems, no smooth stationary function exists and the minimum is achieved by **piecewise smooth** functions (functions in <span>&#92;(&#92;\hat{C}^1[a,b]&#92;)</span> with finitely many corners). By treating a corner <span>&#92;(c&#92;)</span> as a variable endpoint lying on an arbitrary curve, one derives the **Weierstrass–Erdmann corner conditions**: at any corner, both

<span>&#92;[p[y(c^-)] = p[y(c^+)] &#92;quad &#92;text{and} &#92;quad H[y(c^-)] = H[y(c^+)]&#92;]</span>

must hold. That is, the conjugate momentum <span>&#92;(f_z&#92;)</span> and the Hamiltonian <span>&#92;(H = -f + y'f_z&#92;)</span> are both continuous at corners, even though <span>&#92;(y'&#92;)</span> is not. A necessary condition for a corner to exist is that <span>&#92;(f_{zz} = 0&#92;)</span> at some point.

---

## Week 5: Hamilton's Principle

### 5.1 Background and Statement

The success of the calculus of variations in solving mechanical problems like the brachistochrone inspired scientists to seek a variational principle governing the motion of all physical systems. Work of Lagrange, Euler, Poisson, and Hamilton culminated in **Hamilton's Principle**.

**Definition 5.1 (Potential).** A **potential** is a scalar quantity whose negative gradient gives the force acting on a body.

**Definition 5.2 (Action integral).** The **action integral** is

<span>&#92;[A(y) = &#92;int_a^b L(t, y, &#92;\dot{y})\,dt,&#92;]</span>

where the **Lagrangian** <span>&#92;(L = T - U&#92;)</span> is the difference between kinetic energy <span>&#92;(T&#92;)</span> and potential energy <span>&#92;(U&#92;)</span>.

**Hamilton's Principle of Stationary Action.** Between fixed times <span>&#92;(a&#92;)</span> and <span>&#92;(b&#92;)</span>, a physical system moves along the trajectory that makes the action integral *stationary* over all admissible trajectories.

### 5.2 Newton's Laws from Hamilton's Principle

**Example 5.3 (Cart).** For a cart of mass <span>&#92;(m&#92;)</span> with potential energy <span>&#92;(U(y)&#92;)</span>, the Lagrangian is <span>&#92;(L = &#92;\frac{1}{2}m&#92;\dot{y}^2 - U(y)&#92;)</span>. The Euler–Lagrange equation <span>&#92;(L_y - &#92;\frac{d}{dt}L_{&#92;\dot{y}} = 0&#92;)</span> gives <span>&#92;(-U_y - m&#92;\ddot{y} = 0&#92;)</span>, i.e., <span>&#92;(m&#92;\ddot{y} = -U_y&#92;)</span>. Since <span>&#92;(-U_y&#92;)</span> is the force on the cart, this is **Newton's Second Law**, <span>&#92;(F = ma&#92;)</span>.

**Example 5.4 (Spring-mass).** With <span>&#92;(T = &#92;\frac{1}{2}m&#92;\dot{y}^2&#92;)</span> and <span>&#92;(U = &#92;\frac{1}{2}ky^2&#92;)</span>, the Euler–Lagrange equation yields <span>&#92;(m&#92;\ddot{y} = -ky&#92;)</span>, the familiar harmonic oscillator equation.

### 5.3 Multi-Variable Euler–Lagrange and Conservation of the Hamiltonian

When the system has multiple degrees of freedom, <span>&#92;(y = (y_1, &#92;ldots, y_n)&#92;)</span>, stationarity of the action requires an Euler–Lagrange equation for each component:

**Theorem 5.5.** A function <span>&#92;(y &#92;in (C^1[a,b])^n&#92;)</span> is stationary for <span>&#92;(J&#92;)</span> if and only if

<span>&#92;[f_{y_i}[y(x)] - &#92;\frac{d}{dx}f_{z_i}[y(x)] = 0, &#92;quad i = 1, &#92;ldots, n.&#92;]</span>

When <span>&#92;(L&#92;)</span> does not depend explicitly on time, energy is conserved:

**Theorem 5.6 (Conservation of the Hamiltonian).** If <span>&#92;(L&#92;)</span> is independent of <span>&#92;(t&#92;)</span>, then the **Hamiltonian**

<span>&#92;[H = -L + &#92;sum_{i=1}^n &#92;\dot{y}_i L_{&#92;\dot{y}_i}&#92;]</span>

is constant along stationary trajectories. This is the law of conservation of energy.

### 5.4 Generalized Coordinates

A key advantage of Lagrangian mechanics is the freedom to use any convenient coordinate system. **Generalized coordinates** are an independent minimal set <span>&#92;(q = (q_1, &#92;ldots, q_n)&#92;)</span> describing the system configuration.

**Example 5.8 (Pendulum).** In Cartesian coordinates, a pendulum of length <span>&#92;(\ell&#92;)</span> has constraint <span>&#92;(x^2 + y^2 = \ell^2&#92;)</span>. Using the angle <span>&#92;(\theta&#92;)</span> as a single generalized coordinate: <span>&#92;(T = &#92;\frac{1}{2}m&#92;\ell^2&#92;\dot{&#92;\theta}^2&#92;)</span>, <span>&#92;(U = -mg&#92;\ell&#92;\cos&#92;\theta&#92;)</span>, and the Euler–Lagrange equation gives

<span>&#92;[&#92;\ddot{&#92;\theta} = -&#92;\frac{g}{&#92;\ell}&#92;\sin&#92;\theta.&#92;]</span>

**Example 5.10 (Spring-pendulum).** A mass on a spring of length <span>&#92;(r&#92;)</span> at angle <span>&#92;(\theta&#92;)</span> from vertical uses generalized coordinates <span>&#92;((r, &#92;\theta)&#92;)</span>. The Lagrangian is

<span>&#92;[L = &#92;\frac{1}{2}m(&#92;\dot{r}^2 + r^2&#92;\dot{&#92;\theta}^2) - &#92;\frac{1}{2}k(r-r_0)^2 + mg(r_0 - r&#92;\cos&#92;\theta),&#92;]</span>

yielding the coupled equations <span>&#92;(&#92;\ddot{r} - &#92;\dot{&#92;\theta}^2 r = -&#92;\frac{k}{m}(r-r_0) + g&#92;\cos&#92;\theta&#92;)</span> and <span>&#92;(2&#92;\dot{r}&#92;\dot{&#92;\theta} + r&#92;\ddot{&#92;\theta} = -g&#92;\sin&#92;\theta&#92;)</span>.

**Hamilton's Principle (Revised).** Between fixed times, a physical system follows the generalized trajectory <span>&#92;(q &#92;in (C^1[a,b])^n&#92;)</span> that makes stationary the action <span>&#92;(A(q) = &#92;int_a^b L(t, q, &#92;\dot{q})\,dt&#92;)</span>.

### 5.5 Kepler's Laws from Hamilton's Principle

For two bodies with gravitational potential <span>&#92;(U = -k/r&#92;)</span> in polar coordinates <span>&#92;((r, &#92;\theta)&#92;)</span>, the Lagrangian is

<span>&#92;[L(r, &#92;\theta) = &#92;\frac{1}{2}m(&#92;\dot{r}^2 + r^2&#92;\dot{&#92;\theta}^2) + &#92;\frac{k}{r}.&#92;]</span>

The Euler–Lagrange equation for <span>&#92;(&#92;\theta&#92;)</span> gives <span>&#92;(&#92;\frac{d}{dt}(mr^2&#92;\dot{&#92;\theta}) = 0&#92;)</span>, i.e., **angular momentum is conserved** — from which equal areas are swept in equal times (**Kepler's Second Law**).

Combining with conservation of the Hamiltonian and solving the resulting separable ODE for <span>&#92;(r(&#92;\theta)&#92;)</span) leads to the conic section

<span>&#92;[r(&#92;\theta) = &#92;\frac{c}{1 + &#92;\varepsilon &#92;\cos(&#92;\theta - &#92;\theta_0)},&#92;]</span>

where <span>&#92;(&#92;\varepsilon < 1&#92;)</span> gives an ellipse — **Kepler's First Law**. The period-axis relationship <span>&#92;(T^2 &#92;\propto a^3&#92;)</span> follows from the area formula — **Kepler's Third Law**.

---

## Week 6: Hamilton's Principle (Continued)

### 6.1 Canonical Equations

Hamilton's Principle yields <span>&#92;(n&#92;)</span> coupled second-order ODEs. A standard technique converts these to <span>&#92;(2n&#92;)</span> first-order equations using **canonical variables**.

Define the **canonical momenta** <span>&#92;(p_i = L_{&#92;\dot{q}_i}&#92;)</span>. For the general case with Lagrangian <span>&#92;(L = &#92;\frac{1}{2}&#92;\dot{q}^T A(q)&#92;\dot{q} - U(t,q)&#92;)</span> where <span>&#92;(A&#92;)</span> is positive definite:

Writing <span>&#92;(p = A(q)&#92;\dot{q}&#92;)</span> (so <span>&#92;(&#92;\dot{q} = A^{-1}p&#92;)</span>), the **Hamiltonian** expressed in terms of <span>&#92;((q, p)&#92;)</span> is

<span>&#92;[H(t, q, p) = &#92;\sum_i p_i &#92;\dot{q}_i - L = &#92;\frac{1}{2}p^T A^{-1}(q)p + U(t, q).&#92;]</span>

The **canonical equations of motion** (Hamilton's equations) are then:

<span>&#92;[&#92;\dot{q}_i = &#92;\frac{&#92;\partial H}{&#92;\partial p_i}, &#92;&#92;quad &#92;\dot{p}_i = -&#92;\frac{&#92;\partial H}{&#92;\partial q_i}, &#92;&#92;quad i = 1, &#92;ldots, n.&#92;]</span>

Note the elegant symmetry: the equations for <span>&#92;(q&#92;)</span> and <span>&#92;(p&#92;)</span> differ only by a sign. This structure is central to the connection with optimal control theory.

**Example 6.1 (Pendulum).** With <span>&#92;(L = &#92;\frac{1}{2}m&#92;\ell^2&#92;\dot{&#92;\theta}^2 - mg&#92;\ell(1-&#92;\cos&#92;\theta)&#92;)</span> and <span>&#92;(p = m&#92;\ell^2&#92;\dot{&#92;\theta}&#92;)</span), the Hamiltonian is <span>&#92;(H = &#92;\frac{p^2}{2m&#92;\ell^2} + mg&#92;\ell(1-&#92;\cos&#92;\theta)&#92;)</span>. The canonical equations reproduce the pendulum ODE.

### 6.2 Multiple Spatial Variables

Hamilton's Principle extends to problems where the unknown function depends on multiple variables. For a functional

<span>&#92;[J(y) = &#92;int_D f(&#92;\tilde{x}, y(&#92;\tilde{x}), &#92;\nabla y(&#92;\tilde{x}))\,d&#92;\tilde{x}&#92;]</span>

over a bounded domain <span>&#92;(D &#92;subseteq &#92;mathbb{R}^n&#92;)</span> with fixed boundary values, the Divergence Theorem (the multi-dimensional integration by parts) gives:

**Euler–Lagrange PDE:**

<span>&#92;[f_y[y(&#92;\tilde{x})] - &#92;\nabla &#92;\cdot f_{&#92;\nabla y}[y(&#92;\tilde{x})] = 0.&#92;]</span>

**Example 6.4.** The potential energy <span>&#92;(U(y) = &#92;\frac{k}{2}&#92;\int_D |&#92;\nabla y|^2\,d&#92;\tilde{x}&#92;)</span> (thermal diffusion) is minimized when <span>&#92;(&#92;\nabla^2 y = 0&#92;)</span> — **Laplace's equation**.

For a vibrating string with both spatial and temporal dependence, the action functional <span>&#92;(A(y) = &#92;\int_a^b &#92;\int_0^&#92;\ell &#92;\frac{1}{2}&#92;\rho y_t^2 - &#92;\frac{1}{2}&#92;\tau y_x^2\,dx\,dt&#92;)</span> (linearized approximation) yields the **wave equation**:

<span>&#92;[&#92;\rho &#92;\frac{&#92;\partial^2 y}{&#92;\partial t^2} = &#92;\tau &#92;\frac{&#92;\partial^2 y}{&#92;\partial x^2}.&#92;]</span>

---

## Week 7: Some Complexities

### 7.1 Lack of Convexity and Existence of Minima

Convexity has been central to our analysis: for a convex functional, every stationary point is a global minimum. When convexity fails, a stationary function may be only a local minimum or even a saddle point. Moreover, the functional analogue of the Extreme Value Theorem requires compactness, which in infinite-dimensional function spaces is a much stronger requirement than mere closedness and boundedness. The following example illustrates both issues.

### 7.2 Minimum Surface of Revolution

Find a curve joining two points so that the surface formed by revolving it around the <span>&#92;(x&#92;)</span>-axis has minimal area. Normalizing the left endpoint to <span>&#92;((0,1)&#92;)</span> and the right to <span>&#92;((x_1, y_1)&#92;)</span>, the cost is

<span>&#92;[J(y) = 2&#92;\pi &#92;\int_0^{x_1} y(x)&#92;\sqrt{1 + (y'(x))^2}\,dx.&#92;]</span>

Since <span>&#92;(f = 2&#92;\pi y&#92;\sqrt{1+z^2}&#92;)</span> is independent of <span>&#92;(x&#92;)</span>, the Beltrami identity gives <span>&#92;(f - y'f_z = c&#92;)</span>, simplifying to

<span>&#92;[&#92;\frac{dy}{dx} = &#92;\sqrt{&#92;\frac{y^2 - c^2}{c^2}}.&#92;]</span>

This separable equation integrates to a **catenary** <span>&#92;(y(x) = c &#92;\cosh&#92;!\left(&#92;\frac{x+d}{c}&#92;\right)&#92;)</span>.

Imposing <span>&#92;(y(0) = 1&#92;)</span> and <span>&#92;(y(x_1) = y_1&#92;)</span> leads to a transcendental equation for the constants. The striking result is that for any given endpoint, there may be **two solutions, one, or none** — unlike previous problems which always had a unique solution. When two exist, one (with <span>&#92;(d > 0&#92;)</span>) is a local minimum; the other is a saddle point. When none exist (when <span>&#92;(x_1&#92;)</span> is large relative to <span>&#92;(y_1&#92;)</span>), no smooth minimizer exists: the infimum is approached by a sequence of functions converging to two disconnected disks, known as the **Goldschmidt discontinuous solution**.

---

## Week 8: Problems with Constraints

### 8.1 Integral Constraints

Consider minimizing <span>&#92;(J(y) = &#92;int_a^b f[y]\,dx&#92;)</span> subject to an **integral constraint** <span>&#92;(G(y) = &#92;int_a^b g[y]\,dx = c&#92;)</span>. By analogy with Lagrange multipliers in finite dimensions, introduce the **augmented functional**

<span>&#92;[&#92;\tilde{J}(y) = &#92;int_a^b &#92;(f[y] + &#92;\lambda g[y]&#92;)\,dx&#92;]</span>

for some constant <span>&#92;(\lambda&#92;)</span>. The multiplier theorem (Theorem 8.2) guarantees that a minimizer <span>&#92;(y_o&#92;)</span> of <span>&#92;(&#92;\tilde{J}&#92;)</span> minimizes <span>&#92;(J&#92;)</span> subject to the constraint, with <span>&#92;(\lambda&#92;)</span> determined by the constraint <span>&#92;(G(y_o) = c&#92;)</span>.

The corresponding Euler–Lagrange equation for the augmented problem is

<span>&#92;[&#92;\frac{d}{dx}(f + &#92;\lambda g)_z[y] = (f + &#92;\lambda g)_y[y],&#92;]</span>

which has three constants: two integration constants and <span>&#92;(\lambda&#92;)</span>, determined by the two boundary conditions and the constraint.

**Example 8.6 (Simplified Dido's Problem).** Minimize <span>&#92;(&#92;int_{-1}^1 y\,dx&#92;)</span> over curves with <span>&#92;(y(-1) = y(1) = 0&#92;)</span> and length <span>&#92;(\int_{-1}^1&#92;\sqrt{1+(y')^2}\,dx = &#92;\pi&#92;)</span>. The augmented Lagrangian is <span>&#92;(&#92;tilde{f} = y + &#92;\lambda&#92;\sqrt{1+(y')^2}&#92;)</span>. The Beltrami identity and parametric analysis yield the stationary functions <span>&#92;(x = &#92;\sin&#92;\theta, y = -&#92;\cos&#92;\theta&#92;)</span> and its reflection — both are **semicircles**. The one below the axis is the minimum of the augmented problem, confirming that among curves of fixed length with endpoints on the <span>&#92;(x&#92;)</span>-axis, the semicircle encloses maximum area — the classical **isoperimetric inequality**.

**Example 8.7 (General Dido's Problem).** For a straight shore, the curve of fixed length <span>&#92;(L&#92;)</span> enclosing maximum inland area is a **semicircle of radius** <span>&#92;(b = L/&#92;\pi&#92;)</span>. The natural boundary conditions at the free endpoints (where the curve meets the shore) combine with the Beltrami identity to select the circular arc.

### 8.2 Non-Integral Constraints and Optimal Control

The most important class of constrained problems involves a **differential equation constraint**. With independent variable <span>&#92;(t&#92;)</span> and additional function <span>&#92;(u(t)&#92;)</span> (the **control**), the problem is:

**Minimize** <span>&#92;\(J(y,u) = &#92;int_0^T f(t, y, u)\,dt&#92;\)</span> **subject to** <span>&#92;\(&#92;\dot{y}(t) = g(t, y, u)&#92;\)</span>.

The function <span>&#92;(y&#92;)</span> is the **state**, determined by the ODE given <span>&#92;(u&#92;)</span>. The function <span>&#92;(u&#92;)</span> is the **control**, freely chosen to minimize the cost. This is the central formulation of **optimal control theory**.

**Example 8.9 (Energy-optimal control of a rigid body).** Move a body from <span>&#92;((w(0), &#92;\dot{w}(0)) = (w_0, 0)&#92;)</span> to rest <span>&#92;((w(T), &#92;\dot{w}(T)) = (0, 0)&#92;)</span> while minimizing <span>&#92;(&#92;int_0^T u^2\,dt&#92;)</span> subject to <span>&#92;(&#92;\ddot{w} = u&#92;)</span>. Setting <span>&#92;(y_1 = w, y_2 = &#92;\dot{w}&#92;)</span> and substituting <span>&#92;(u = &#92;\ddot{w}&#92;)</span> into the Euler–Lagrange equation for <span>&#92;(J(w) = &#92;int_0^T &#92;\ddot{w}^2\,dt&#92;)</span) gives <span>&#92;(w^{(4)} = 0&#92;)</span>, so <span>&#92;(w(t) = &#92;\frac{a}{6}t^3 + &#92;\frac{b}{2}t^2&#92;)</span>. Boundary conditions determine <span>&#92;(a&#92;)</span> and <span>&#92;(b&#92;)</span>, and the optimal control is the linear ramp <span>&#92;(u(t) = at + b&#92;)</span>.

---

## Week 9: Introduction to Optimal Control

### 9.1 The Augmented Problem

The general optimal control problem is to minimize

<span>&#92;[J(y, u) = &#92;int_0^T f(t, y, u)\,dt&#92;]</span>

subject to <span>&#92;(&#92;\dot{y} = g(t, y, u)&#92;)</span> and boundary conditions on <span>&#92;(y&#92;)</span>. Introducing a vector of **Lagrange multiplier functions** (the **adjoint variables** or **costates**) <span>&#92;(p(t) &#92;in &#92;mathbb{R}^n&#92;)</span>, form the **augmented cost**

<span>&#92;[&#92;\tilde{J}(y, u, p) = &#92;int_0^T &#92;&#92;[f(t, y, u) + p(t)^T(&#92;\dot{y}(t) - g(t, y, u))&#92;&#92;]\,dt.&#92;]</span>

**Theorem 9.1 (Optimality equations).** A triple <span>&#92;((y, u, p)&#92;)</span> is stationary for <span>&#92;(&#92;\tilde{J}&#92;)</span> if and only if:

<span>&#92;[&#92;\dot{p} = f_y^T - g_y^T p &#92;&#92;quad &#92;text{(adjoint equation)},&#92;]</span>
<span>&#92;[&#92;\dot{y} = g(t, y, u) &#92;&#92;quad &#92;text{(state equation)},&#92;]</span>
<span>&#92;[f_u^T - p^T g_u = 0 &#92;&#92;quad &#92;text{(optimality condition)}.&#92;]</span>

If only <span>&#92;(y(0) = y_0&#92;)</span> is specified (free final state), the adjoint boundary condition is <span>&#92;(p(T) = 0&#92;)</span>.

### 9.2 The Hamiltonian Reformulation

Define the **control Hamiltonian**

<span>&#92;[H(t, y, p, u) = f(t, y, u) + p^T g(t, y, u).&#92;]</span>

The three optimality equations take the elegant **canonical form**:

<span>&#92;[&#92;\dot{p}_i = -&#92;\frac{&#92;\partial H}{&#92;\partial y_i}, &#92;&#92;quad &#92;\dot{y}_i = &#92;\frac{&#92;\partial H}{&#92;\partial p_i}, &#92;&#92;quad &#92;\frac{&#92;\partial H}{&#92;\partial u_j} = 0.&#92;]</span>

These are strikingly similar to Hamilton's canonical equations from mechanics. The third equation, <span>&#92;(H_u = 0&#92;)</span>, says that the optimal control makes the Hamiltonian stationary with respect to <span>&#92;(u&#92;)</span>.

**Example 9.5.** For the system <span>&#92;(&#92;\dot{y} = -y + u&#92;)</span> with cost <span>&#92;(&#92;\int_0^T &#92;\frac{1}{2}u^2\,dt&#92;)</span>, boundary conditions <span>&#92;(y(0) = 1, y(T) = 2&#92;)</span>: the Hamiltonian is <span>&#92;(H = &#92;\frac{1}{2}u^2 + p(-y+u)&#92;)</span>. The adjoint equation gives <span>&#92;(&#92;\dot{p} = p&#92;)</span>, so <span>&#92;(p(t) = ce^t&#92;)</span>. The condition <span>&#92;(H_u = u + p = 0&#92;)</span> gives the optimal control <span>&#92;(u^o(t) = -p(t) = -ce^t&#92;)</span>. Substituting into the state equation and applying boundary conditions determines <span>&#92;(c&#92;)</span>.

**Theorem 9.9.** The Hamiltonian <span>&#92;(H&#92;)</span> is pointwise convex in <span>&#92;((y, u)&#92;)</span> if and only if <span>&#92;(&#92;\tilde{f}&#92;)</span> is pointwise convex. In particular, if <span>&#92;(f&#92;)</span> is convex and <span>&#92;(g&#92;)</span> is linear, then <span>&#92;(H&#92;)</span> is convex, and every solution of the optimality equations provides a global minimum.

---

## Week 10: Pontryagin's Maximum Principle

### 10.1 The Limitation of Unconstrained Controls

When the Hamiltonian is linear in <span>&#92;(u&#92;)</span>, the condition <span>&#92;(H_u = 0&#92;)</span> gives no information about the optimal control. This arises naturally in **minimum-time problems** where the cost is simply <span>&#92;(&#92;int_0^T dt&#92;)</span> with <span>&#92;(f = 1&#92;)</span>. The fundamental resolution is to explicitly constrain the control to a closed set <span>&#92;(U&#92;)</span> and replace stationarity with *maximization* of the Hamiltonian over <span>&#92;(U&#92;)</span>.

### 10.2 Pontryagin's Maximum Principle

**Theorem 10.2 (Pontryagin's Maximum Principle, PMP).** Consider minimizing <span>&#92;(J(y, u) = &#92;int_0^T f(t, y, u)\,dt&#92;)</span> subject to <span>&#92;(&#92;\dot{y} = g(t, y, u)&#92;)</span> with <span>&#92;(u(t) &#92;in U &#92;subseteq &#92;mathbb{R}^m&#92;)</span> (U closed). If <span>&#92;(u^o, y^o&#92;)</span> are optimal, there exists an adjoint function <span>&#92;(p(t)&#92;)</span> satisfying

<span>&#92;[&#92;\dot{p}_i = -&#92;\frac{&#92;\partial H}{&#92;\partial y_i},&#92;]</span>

with Hamiltonian

<span>&#92;[H(t, y, p, u) = p^o f(t, y, u) + &#92;sum_{i=1}^n p_i(t)g_i(t, y, u),&#92;]</span>

such that <span>&#92;((p^o, p(t)) &#92;neq (0, 0)&#92;)</span> for all <span>&#92;(t&#92;)</span>, and <span>&#92;(H&#92;)</span> is **maximized** with respect to <span>&#92;(u&#92;)</span> at <span>&#92;(u^o(t)&#92;)</span> for every <span>&#92;(t&#92;)</span>.

For non-degenerate problems, <span>&#92;(p^o = 1&#92;)</span>, recovering <span>&#92;(H = f + p^T g&#92;)</span>. When <span>&#92;(H&#92;)</span> is convex (Corollary 10.3), every solution of the PMP equations provides a global minimum.

The PMP provides *necessary* conditions. It was introduced to handle cases where the optimality condition <span>&#92;(H_u = 0&#92;)</span> fails — particularly when <span>&#92;(u&#92;)</span> is constrained or <span>&#92;(H&#92;)</span> is linear in <span>&#92;(u&#92;)</span>.

### 10.3 Time-Optimal Control

**Example 10.6 (First-order system).** Minimize time to drive <span>&#92;(&#92;\dot{y} = u&#92;)</span> from <span>&#92;(y(0) = 1&#92;)</span> to <span>&#92;(y(T) = 0&#92;)</span> with <span>&#92;(|u| &#92;\leq M&#92;)</span>. The Hamiltonian is <span>&#92;(H = -1 + pu&#92;)</span>. Maximizing over <span>&#92;(u&#92;)</span): <span>&#92;(u^o = M&#92;\,&#92;\text{sgn}(p)&#92;)</span>. The adjoint equation <span>&#92;(&#92;\dot{p} = 0&#92;)</span> gives constant <span>&#92;(p&#92;)</span>, so <span>&#92;(u^o = &#92;\pm M&#92;)</span> throughout. Starting from <span>&#92;(y(0) = 1 > 0&#92;)</span), the optimal strategy is <span>&#92;(u^o = -M&#92;)</span>, reaching zero in time <span>&#92;(T = 1/M&#92;)</span>.

**Example 10.7 (Double integrator).** Minimize time to drive <span>&#92;(&#92;\ddot{w} = u&#92;)</span> with <span>&#92;(|u| &#92;\leq 1&#92;)</span> to <span>&#92;((w(T), &#92;\dot{w}(T)) = (0,0)&#92;)</span>. With <span>&#92;((y_1, y_2) = (w, &#92;\dot{w})&#92;)</span>, the Hamiltonian is <span>&#92;(H = -1 + p_1 y_2 + p_2 u&#92;)</span>. The optimal control <span>&#92;(u^o = &#92;\text{sgn}(p_2)&#92;)</span>; since <span>&#92;(p_2(t) = at + b&#92;)</span> is linear, there is at most one switch. The **switching curve** <span>&#92;(y_1 = &#92;\pm&#92;\frac{1}{2}y_2^2&#92;)</span> (with sign depending on <span>&#92;(y_2&#92;)</span>) divides the phase plane: the optimal control is <span>&#92;(-1&#92;)</span> above and <span>&#92;(+1&#92;)</span> below. For <span>&#92;((y_1(0), y_2(0)) = (1, 0)&#92;)</span>, the optimal control is <span>&#92;(u = -1&#92;)</span> until <span>&#92;(t = 1&#92;)</span>, then <span>&#92;(u = +1&#92;)</span>, reaching the origin at <span>&#92;(T = 2&#92;)</span>.

### 10.4 Bang-Bang Control

When <span>&#92;(H&#92;)</span> is linear in <span>&#92;(u&#92;)</span) and <span>&#92;(U = [M_1, M_2]&#92;)</span>, the optimal control always takes the extreme values:

<span>&#92;[u^o_k(t) = &#92;begin{cases} M_1 & &#92;text{if } p(t)^T B_k < 0, \&#92;&#92; M_2 & &#92;text{if } p(t)^T B_k > 0. &#92;end{cases}&#92;]</span>

Such a control is called **bang-bang**.

**Theorem 10.8.** For the linear time-optimal problem <span>&#92;(&#92;\dot{y} = Ay + Bu&#92;)</span>, if the vectors <span>&#92;(B_k, AB_k, &#92;ldots, A^{n-1}B_k&#92;)</span> are linearly independent, then the optimal control <span>&#92;(u^o_k&#92;)</span> is bang-bang.

**Theorem 10.9.** If all eigenvalues of <span>&#92;(A&#92;)</span> are **real**, the bang-bang control has at most <span>&#92;(n-1&#92;)</span> switches. If eigenvalues are complex, switches can occur arbitrarily often (as in the harmonic oscillator).

*Proof sketch:* The switching function <span>&#92;(\sigma(t) = p(t)^T B_k&#92;)</span> satisfies <span>&#92;(&#92;\sigma(t) = &#92;\sum_j &#92;\alpha_j e^{&#92;\lambda_j t}&#92;)</span> (a sum of <span>&#92;(n&#92;)</span> exponentials). Lemma 10.10 shows that a sum of <span>&#92;(n&#92;)</span> exponentials with distinct real exponents has at most <span>&#92;(n-1&#92;)</span> zeros, bounding the number of switches.

**Example 10.11 (Harmonic oscillator).** For <span>&#92;(&#92;\ddot{w} + w = u&#92;)</span> with <span>&#92;(|u| &#92;\leq 1&#92;)</span>, the eigenvalues of <span>&#92;(A&#92;)</span> are <span>&#92;(\pm i&#92;)</span> (complex), so there is no bound on switches. The adjoint <span>&#92;(p_2(t) = M&#92;\cos(t + &#92;\phi)&#92;)</span) leads to switches at intervals of <span>&#92;(\pi&#92;)</span). Optimal trajectories follow arcs of circles centered at <span>&#92;((\pm 1, 0)&#92;)</span> in the phase plane, switching direction at the switching curve (a series of semicircles in the second and fourth quadrants).

---

## Week 11: Linear Quadratic Control

### 11.1 Finite-Time LQR

The **Linear Quadratic Regulator (LQR)** is the most important solved problem in optimal control. It combines linear dynamics with a quadratic cost, admitting a complete analytical solution.

Consider the linear time-invariant system

<span>&#92;[&#92;\dot{y}(t) = Ay(t) + Bu(t), &#92;quad y(0) = y_0,&#92;]</span>

with <span>&#92;(A &#92;\in &#92;mathbb{R}^{n&#92;\times n}&#92;)</span>, <span>&#92;(B &#92;\in &#92;mathbb{R}^{n &#92;\times m}&#92;)</span>. The **quadratic cost**

<span>&#92;[J(u; T) = &#92;int_0^T &#92;[y(t)^T Q y(t) + u(t)^T R u(t)&#92;]\,dt&#92;]</span>

penalizes both state deviation and control effort, where <span>&#92;(Q = C^T C &#92;\geq 0&#92;)</span> and <span>&#92;(R = E^T E > 0&#92;)</span> are symmetric weighting matrices.

Applying the optimality equations (Theorem 9.1) and defining <span>&#92;(z = -p/2&#92;)</span>, the optimal control is

<span>&#92;[u^o(t) = -R^{-1} B^T z(t)&#92;]</span>

where <span>&#92;(z&#92;)</span> satisfies <span>&#92;(&#92;\dot{z} = -A^T z - Qy&#92;)</span> with <span>&#92;(z(T) = 0&#92;)</span>. The difficulty is that <span>&#92;(z(t)&#92;)</span) depends on future state values. The key insight is to express the adjoint as a linear function of the current state.

**Theorem 11.3 (Differential Riccati Equation).** Define <span>&#92;(P(t; T)&#92;)</span> by <span>&#92;(z(t) = P(t;T)y^o(t)&#92;)</span>. Then <span>&#92;(P(t;T)&#92;)</span> satisfies the **Differential Riccati Equation (DRE)**:

<span>&#92;[&#92;\dot{P}(t;T) + A^T P + P A - P B R^{-1} B^T P + Q = 0, &#92;quad P(T;T) = 0,&#92;]</span>

and the **optimal feedback control** is

<span>&#92;[u^o(t) = -R^{-1} B^T P(t;T) y^o(t).&#92;]</span>

The **minimum cost** is <span>&#92;(J(u^o; T) = y_0^T P(0;T) y_0&#92;)</span>. Furthermore, <span>&#92;(0 &#92;\leq P(0;T) < &#92;\infty&#92;)</span> for all <span>&#92;(T&#92;)</span>.

The DRE is solved **backward in time** from <span>&#92;(P(T;T) = 0&#92;)</span> to <span>&#92;(P(0;T)&#92;)</span>. The optimal control is a **linear state feedback** law — the control at each time depends only on the current state, not on future states. This closed-loop structure makes the controller self-correcting and practical to implement.

### 11.2 Infinite-Horizon LQR and the Algebraic Riccati Equation

The **infinite-horizon LQR** problem seeks to minimize

<span>&#92;[J = &#92;int_0^{&#92;\infty} &#92;[x(t)^T Q x(t) + u(t)^T R u(t)&#92;]\,dt&#92;]</span>

subject to <span>&#92;(&#92;\dot{x} = Ax + Bu&#92;)</span>, where the goal is to **stabilize** the system (drive <span>&#92;(x(t) &#92;to 0&#92;)</span> as <span>&#92;(t &#92;to &#92;\infty&#92;)</span>).

**Lemma 11.1.** For any symmetric matrix <span>&#92;(P&#92;)</span>, the functional <span>&#92;(V(x(&#92;\cdot), u(&#92;\cdot)) = -&#92;int_0^&#92;\infty [(Ax+Bu)^T Px + x^T P(Ax+Bu)]\,dt&#92;)</span> depends only on <span>&#92;(x_0 = x(0)&#92;)</span> (provided <span>&#92;(x(t) &#92;to 0&#92;)</span>), with value <span>&#92;(V = x_0^T P x_0&#92;)</span>.

The trick is to **complete the square** in the cost. Writing the cost as

<span>&#92;[J = V + &#92;int_0^&#92;\infty &#92;[x^T(A^T P + PA + Q)x + u^T Ru + 2u^T B^T Px&#92;]\,dt,&#92;]</span>

and noting that <span>&#92;(u^T Ru + 2u^T B^T Px = (u - Kx)^T R(u-Kx) - (Kx)^T R(Kx)&#92;)</span> with <span>&#92;(K = -R^{-1}B^T P&#92;)</span>, we get

<span>&#92;[J = x_0^T P x_0 + &#92;int_0^&#92;\infty &#92;[x^T(A^T P + PA + Q - PBR^{-1}B^T P)x + (u - Kx)^T R(u-Kx)&#92;]\,dt.&#92;]</span>

If <span>&#92;(P&#92;)</span> satisfies the **Algebraic Riccati Equation (ARE)**:

<span>&#92;[A^T P + PA + Q - PBR^{-1}B^T P = 0,&#92;]</span>

and <span>&#92;(A - BR^{-1}B^T P&#92;)</span> is **Hurwitz** (all eigenvalues with negative real parts), then the cost reduces to <span>&#92;(J = x_0^T P x_0&#92;)</span> with the feedback law <span>&#92;(u = Kx&#92;)</span>, and this is optimal among all stabilizing controllers.

**Theorem 11.2.** Suppose the ARE admits a symmetric positive semi-definite solution <span>&#92;(P&#92;)</span> such that <span>&#92;(A - BR^{-1}B^T P&#92;)</span> is Hurwitz. Then the feedback law <span>&#92;(u = Kx = -R^{-1}B^T Px&#92;)</span> stabilizes the system and minimizes the LQR cost, with optimal cost <span>&#92;(J^* = x_0^T P x_0&#92;)</span>.

The ARE is the equilibrium condition of the DRE: <span>&#92;(\dot{P} = 0&#92;)</span>. Under appropriate conditions (stabilizability and detectability), the DRE solution <span>&#92;(P(t; T)&#92;)</span> converges as <span>&#92;(T &#92;to &#92;\infty&#92;)</span> to the stabilizing solution of the ARE.

**Example 11.3.** For <span>&#92;(x' = u&#92;)</span> with cost <span>&#92;(J = &#92;int_0^&#92;\infty u^2\,dt&#92;)</span>: the ARE is <span>&#92;(-P^2 = 0&#92;)</span>, so <span>&#92;(P = 0&#92;)</span> and <span>&#92;(u = 0&#92;)</span>. This is not stabilizing (the uncontrolled system is neutrally stable, not asymptotically stable). Any stabilizing control <span>&#92;(u = -&#92;\varepsilon x&#92;)</span> gives cost <span>&#92;(&#92;\frac{&#92;\varepsilon x_0^2}{2} &#92;to 0&#92;)</span> as <span>&#92;(\varepsilon &#92;to 0&#92;)</span>, but the infimum is not attained by a stabilizing controller.

**Example 11.4.** For <span>&#92;(x' = x + u&#92;)</span> with cost <span>&#92;(&#92;int_0^&#92;\infty u^2\,dt&#92;)</span>: the ARE is <span>&#92;(2P - P^2 = 0&#92;)</span>, giving <span>&#92;(P = 0&#92;)</span> (not stabilizing) or <span>&#92;(P = 2&#92;)</span> (stabilizing). The optimal control <span>&#92;(u = -2x&#92;)</span> gives closed-loop system <span>&#92;(x' = -x&#92;)</span> and optimal cost <span>&#92;(J^* = 2x_0^2&#92;)</span>.

**Example 11.5 (Double integrator).** For <span>&#92;(y'' = u&#92;)</span> with output <span>&#92;(y = x_1&#92;)</span>, written as

<span>&#92;[A = &#92;begin{pmatrix} 0 & 1 \&#92;&#92; 0 & 0 &#92;end{pmatrix}, &#92;&#92;quad B = &#92;begin{pmatrix} 0 \&#92;&#92; 1 &#92;end{pmatrix}, &#92;&#92;quad Q = &#92;begin{pmatrix} 1 & 0 \&#92;&#92; 0 & 0 &#92;end{pmatrix}, &#92;&#92;quad R = r > 0,&#92;]</span>

the ARE can be solved manually. Setting <span>&#92;(P = &#92;begin{pmatrix} p_1 & p_2 \&#92;&#92; p_2 & p_3 &#92;end{pmatrix}&#92;)</span>, the three scalar equations yield

<span>&#92;[p_2 = &#92;\sqrt{r}, &#92;&#92;quad p_1 = &#92;\frac{1}{r}p_2 p_3 = (2r)^{1/4}&#92;\sqrt{r}&#92;^{1/2}, &#92;&#92;quad p_3 = (2r)^{3/4},&#92;]</span>

and the optimal gain <span>&#92;(K = -R^{-1}B^T P = -&#92;\frac{1}{r}[p_2 \;\; p_3] = -[r^{-1/2}, (2/r)^{1/4} r^{-3/4}]&#92;)</span>. The closed-loop characteristic polynomial <span>&#92;(s^2 + (2/r)^{1/4}s + 1/&#92;\sqrt{r} = 0&#92;)</span> has both roots with negative real parts, confirming asymptotic stability.

### 11.3 Summary of the LQR Design Procedure

| Step | Action |
|------|--------|
| 1 | Formulate system <span>&#92;(\dot{x} = Ax + Bu&#92;)</span> and choose weighting matrices <span>&#92;(Q &#92;\geq 0&#92;)</span>, <span>&#92;(R > 0&#92;)</span> |
| 2 | Solve the ARE <span>&#92;(A^T P + PA + Q - PBR^{-1}B^T P = 0&#92;)</span> for the symmetric positive semi-definite solution <span>&#92;(P&#92;)</span> |
| 3 | Compute feedback gain <span>&#92;(K = -R^{-1}B^T P&#92;)</span> |
| 4 | Implement <span>&#92;(u(t) = Kx(t)&#92;)</span> — this stabilizes the system with cost <span>&#92;(J^* = x_0^T P x_0&#92;)</span> |

In MATLAB, the optimal gain is returned by `lqr(A, B, Q, R)`. The choice of <span>&#92;(Q&#92;)</span> and <span>&#92;(R&#92;)</span> is a design decision reflecting the trade-off between state regulation performance and control effort.

---

## Course Summary

This course developed the complete arc from finite-dimensional optimization to optimal control of dynamical systems:

| Topic | Key Result |
|-------|-----------|
| **Finite-dim optimization** | Gradient = 0 at stationary points; convexity guarantees global minima |
| **Functional calculus** | Gateaux derivative on linear spaces; stationarity in function spaces |
| **Euler–Lagrange equation** | Necessary and sufficient condition for stationary functions |
| **Simplifications** | Beltrami identity, natural BCs, transversality |
| **Hamilton's Principle** | Action stationarity yields all of classical mechanics |
| **Canonical equations** | Hamilton's equations; connection to optimal control |
| **Constrained problems** | Lagrange multipliers, isoperimetric inequality (Dido's problem) |
| **Optimal control** | Adjoint state, Hamiltonian, two-point boundary value problem |
| **Pontryagin's Maximum Principle** | Necessary conditions with constrained controls; bang-bang control |
| **Linear Quadratic Regulator** | Differential Riccati Equation (finite horizon); Algebraic Riccati Equation (infinite horizon); stabilizing state feedback |

**References.** Primary texts used in this course: D. Liberzon, *Calculus of Variations and Optimal Control Theory* (Princeton, 2012); J. L. Troutman, *Variational Calculus and Optimal Control* (Springer, 1996); E. R. Pinch, *Optimal Control and the Calculus of Variations* (Oxford, 2002).
