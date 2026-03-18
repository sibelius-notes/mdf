---
title: "PMATH 352 — Complex Analysis"
prof: "Ruxandra Moraru"
---

# Chapter 1: Plane Calculus

## 1.1 Introduction

Complex analysis studies functions <span>&#92;( f: D \subseteq \mathbb{C} \to \mathbb{C} &#92;)</span>. The subject combines real analysis in the plane with the algebraic structure of <span>&#92;( \mathbb{C} &#92;)</span>, yielding results far more rigid than their real counterparts: differentiable complex functions are automatically infinitely differentiable, analytic, and satisfy beautiful integral formulas. We begin by developing the necessary plane calculus.

## 1.2 Topology of the Plane

<div class="definition" markdown="1">
**Definition 1.2.1 (Open Disc).** For <span>&#92;( z&#95;0 \in \mathbb{C} &#92;)</span> and <span>&#92;( r > 0 &#92;)</span>, the *open disc* of radius <span>&#92;( r &#92;)</span> centred at <span>&#92;( z&#95;0 &#92;)</span> is
<span>&#92;[ D(z_0, r) = \{ z \in \mathbb{C} : |z - z_0| < r \}. &#92;]</span>
The *closed disc* is <span>&#92;( \overline{D}(z&#95;0, r) = \{ z : |z - z&#95;0| \leq r \} &#92;)</span>.
</div>

<div class="definition" markdown="1">
**Definition 1.2.2 (Interior Point, Open Set).** A point <span>&#92;( z&#95;0 \in S \subseteq \mathbb{C} &#92;)</span> is an *interior point* of <span>&#92;( S &#92;)</span> if there exists <span>&#92;( r > 0 &#92;)</span> with <span>&#92;( D(z&#95;0, r) \subseteq S &#92;)</span>. The set <span>&#92;( S &#92;)</span> is *open* if every point is an interior point.
</div>

<div class="definition" markdown="1">
**Definition 1.2.3 (Closed Set, Boundary).** A set <span>&#92;( S &#92;)</span> is *closed* if <span>&#92;( \mathbb{C} \setminus S &#92;)</span> is open. A point <span>&#92;( z&#95;0 &#92;)</span> is a *boundary point* of <span>&#92;( S &#92;)</span> if every disc <span>&#92;( D(z&#95;0, r) &#92;)</span> meets both <span>&#92;( S &#92;)</span> and <span>&#92;( \mathbb{C} \setminus S &#92;)</span>. The boundary <span>&#92;( \partial S &#92;)</span> is the set of all boundary points.
</div>

<div class="definition" markdown="1">
**Definition 1.2.4 (Connected Set, Domain).** A set <span>&#92;( S \subseteq \mathbb{C} &#92;)</span> is *connected* if it cannot be written as a union of two disjoint nonempty open subsets. A *domain* is a connected open subset of <span>&#92;( \mathbb{C} &#92;)</span>. A domain is *simply connected* if it has no holes (every closed curve in the domain is contractible to a point within it).
</div>

## 1.3 Parametrized Curves

<div class="definition" markdown="1">
**Definition 1.3.1 (Parametrized Curve).** A *parametrized curve* is a continuous map <span>&#92;( \gamma: [a,b] \to \mathbb{C} &#92;)</span>. Writing <span>&#92;( \gamma(t) = x(t) + iy(t) &#92;)</span>, the curve is *smooth* if <span>&#92;( x'(t), y'(t) &#92;)</span> exist, are continuous, and <span>&#92;( \gamma'(t) = x'(t) + iy'(t) \neq 0 &#92;)</span> for all <span>&#92;( t &#92;)</span>. It is *piecewise smooth* if <span>&#92;( [a,b] &#92;)</span> can be subdivided into finitely many subintervals on each of which it is smooth.
</div>

<div class="definition" markdown="1">
**Definition 1.3.2 (Closed and Jordan Curves).** A curve is *closed* if <span>&#92;( \gamma(a) = \gamma(b) &#92;)</span>. A *Jordan curve* (simple closed curve) is a closed curve injective on <span>&#92;( [a,b) &#92;)</span>. The *Jordan Curve Theorem* states that a Jordan curve divides <span>&#92;( \mathbb{C} &#92;)</span> into exactly two regions (the interior and exterior), and the interior is a simply connected domain.
</div>

<div class="definition" markdown="1">
**Definition 1.3.3 (Arclength).** The *arclength* of a piecewise smooth curve <span>&#92;( \gamma &#92;)</span> is
<span>&#92;[ \ell(\gamma) = \int&#95;a^b |\gamma'(t)|\, dt = \int&#95;a^b \sqrt{x'(t)^2 + y'(t)^2}\, dt. &#92;]</span>
</div>

<div class="definition" markdown="1">
**Definition 1.3.4 (Jordan Domain).** A *Jordan domain* is a bounded connected open set <span>&#92;( \Omega \subseteq \mathbb{C} &#92;)</span> whose boundary <span>&#92;( \partial\Omega &#92;)</span> is a Jordan curve.
</div>

## 1.4 Line Integrals

<div class="definition" markdown="1">
**Definition 1.4.1 (Line Integral of a Vector Field).** Let <span>&#92;( \mathbf{F} = (P, Q) &#92;)</span> be a continuous vector field on a domain <span>&#92;( D &#92;)</span> and <span>&#92;( \gamma: [a,b] \to D &#92;)</span> a piecewise smooth curve. The *line integral* of <span>&#92;( \mathbf{F} &#92;)</span> along <span>&#92;( \gamma &#92;)</span> is
<span>&#92;[ \int&#95;\gamma \mathbf{F} \cdot d\mathbf{s} = \int&#95;\gamma P\, dx + Q\, dy = \int&#95;a^b \bigl[P(\gamma(t)) x'(t) + Q(\gamma(t)) y'(t)\bigr]\, dt. &#92;]</span>
</div>

<div class="proposition" markdown="1">
**Proposition 1.4.2 (Properties of Line Integrals).** For piecewise smooth curves:
1. *Linearity* in <span>&#92;( \mathbf{F} &#92;)</span>.
2. *Reverse orientation*: <span>&#92;( \int&#95;{-\gamma} \mathbf{F}\cdot d\mathbf{s} = -\int&#95;\gamma \mathbf{F}\cdot d\mathbf{s} &#92;)</span>.
3. *Concatenation*: <span>&#92;( \int&#95;{\gamma&#95;1 + \gamma&#95;2} = \int&#95;{\gamma&#95;1} + \int&#95;{\gamma&#95;2} &#92;)</span>.
4. *Reparametrization invariance*: the value is unchanged under orientation-preserving reparametrization.
</div>

<div class="theorem" markdown="1">
**Theorem 1.4.3 (Independence of Path / Fundamental Theorem).** If <span>&#92;( \mathbf{F} = \nabla u &#92;)</span> is a gradient vector field on a domain <span>&#92;( D &#92;)</span>, then for any piecewise smooth curve <span>&#92;( \gamma &#92;)</span> in <span>&#92;( D &#92;)</span> from <span>&#92;( z&#95;0 &#92;)</span> to <span>&#92;( z&#95;1 &#92;)</span>,
<span>&#92;[ \int&#95;\gamma \mathbf{F} \cdot d\mathbf{s} = u(z&#95;1) - u(z&#95;0). &#92;]</span>
In particular, the integral around any closed curve is zero.
</div>

## 1.5 Green's Theorem

<div class="theorem" markdown="1">
**Theorem 1.5.1 (Green's Theorem).** Let <span>&#92;( \Omega &#92;)</span> be a Jordan domain with piecewise smooth boundary <span>&#92;( \partial\Omega &#92;)</span> oriented counterclockwise. If <span>&#92;( P, Q \in C^1(\overline{\Omega}) &#92;)</span>, then
<span>&#92;[ \oint&#95;{\partial\Omega} P\, dx + Q\, dy = \iint&#95;\Omega \left(\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y}\right) dA. &#92;]</span>
</div>

<div class="corollary" markdown="1">
**Corollary 1.5.2 (Area Formula).** <span>&#92;( \text{Area}(\Omega) = \dfrac{1}{2} \oint_{\partial\Omega} x\, dy - y\, dx. &#92;]</span>
</div>

<div class="proposition" markdown="1">
**Proposition 1.5.3 (Bump Principle).** Let <span>&#92;( \mathbf{F} = (P,Q) \in C^1(D) &#92;)</span>. Then <span>&#92;( \mathbf{F} &#92;)</span> is irrotational (<span>&#92;( Q&#95;x = P&#95;y &#92;)</span>) on <span>&#92;( D &#92;)</span> if and only if <span>&#92;( \int&#95;\gamma \mathbf{F}\cdot d\mathbf{s} = 0 &#92;)</span> for every piecewise smooth closed curve <span>&#92;( \gamma &#92;)</span> in <span>&#92;( D &#92;)</span>.
</div>

# Chapter 2: Harmonic Functions

## 2.1 Definition and Examples

<div class="definition" markdown="1">
**Definition 2.1.1 (Harmonic Function).** A function <span>&#92;( u: D \to \mathbb{R} &#92;)</span> of class <span>&#92;( C^2 &#92;)</span> on a domain <span>&#92;( D \subseteq \mathbb{R}^2 &#92;)</span> is *harmonic* if
<span>&#92;[ \Delta u = \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} = 0. &#92;]</span>
</div>

<div class="example" markdown="1">
**Example 2.1.2.**
- <span>&#92;( u = x^2 - y^2 &#92;)</span>: <span>&#92;( \Delta u = 2 - 2 = 0 &#92;)</span>. Harmonic.
- <span>&#92;( u = e^x \cos y &#92;)</span>: <span>&#92;( u&#95;{xx} = e^x\cos y &#92;)</span>, <span>&#92;( u&#95;{yy} = -e^x\cos y &#92;)</span>, so <span>&#92;( \Delta u = 0 &#92;)</span>. Harmonic.
- <span>&#92;( u = x^2 + y^2 &#92;)</span>: <span>&#92;( \Delta u = 4 \neq 0 &#92;)</span>. Not harmonic.
- Any real or imaginary part of an analytic function (with <span>&#92;( C^2 &#92;)</span> components) is harmonic.
</div>

## 2.2 The Inside-Outside Theorem

<div class="theorem" markdown="1">
**Theorem 2.2.1 (Inside-Outside Theorem).** Let <span>&#92;( \Omega &#92;)</span> be a Jordan domain with piecewise smooth boundary, and let <span>&#92;( u \in C^2(\overline{\Omega}) &#92;)</span>. Then
<span>&#92;[ \oint&#95;{\partial\Omega} \frac{\partial u}{\partial \mathbf{n}}\, ds = \iint&#95;\Omega \Delta u\, dA, &#92;]</span>
where <span>&#92;( \mathbf{n} &#92;)</span> is the outward unit normal and <span>&#92;( \frac{\partial u}{\partial \mathbf{n}} = \nabla u \cdot \mathbf{n} &#92;)</span> is the normal derivative.
</div>

<div class="proof" markdown="1">
*Proof.* Apply Green's theorem with <span>&#92;( P = -u&#95;y &#92;)</span> and <span>&#92;( Q = u&#95;x &#92;)</span>. Then <span>&#92;( Q&#95;x - P&#95;y = u&#95;{xx} + u&#95;{yy} = \Delta u &#92;)</span>. The line integral <span>&#92;( \oint (-u&#95;y\, dx + u&#95;x\, dy) &#92;)</span> equals <span>&#92;( \oint \nabla u \cdot \mathbf{n}\, ds = \oint \frac{\partial u}{\partial \mathbf{n}}\, ds &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

<div class="corollary" markdown="1">
**Corollary 2.2.2.** If <span>&#92;( u &#92;)</span> is harmonic on <span>&#92;( \overline{\Omega} &#92;)</span>, then <span>&#92;( \oint&#95;{\partial\Omega} \frac{\partial u}{\partial \mathbf{n}}\, ds = 0 &#92;)</span>.
</div>

## 2.3 Mean Value Theorems

<div class="definition" markdown="1">
**Definition 2.3.1 (Scalar Line Integral).** For a continuous function <span>&#92;( f &#92;)</span> and piecewise smooth curve <span>&#92;( \gamma: [a,b] \to \mathbb{C} &#92;)</span>,
<span>&#92;[ \int&#95;\gamma f\, ds = \int&#95;a^b f(\gamma(t)) |\gamma'(t)|\, dt. &#92;]</span>
</div>

<div class="theorem" markdown="1">
**Theorem 2.3.2 (Circumferential Mean Value Theorem).** Let <span>&#92;( u &#92;)</span> be harmonic on a domain <span>&#92;( D &#92;)</span> and suppose <span>&#92;( \overline{D}(z&#95;0, r) \subseteq D &#92;)</span>. Then
<span>&#92;[ u(z&#95;0) = \frac{1}{2\pi} \int&#95;0^{2\pi} u(z&#95;0 + re^{i\theta})\, d\theta. &#92;]</span>
That is, the value at the centre equals the average value on any circle.
</div>

<div class="proof" markdown="1">
*Proof.* Define <span>&#92;( \varphi(\rho) = \frac{1}{2\pi}\int&#95;0^{2\pi} u(z&#95;0 + \rho e^{i\theta})\, d\theta &#92;)</span> for <span>&#92;( 0 \leq \rho \leq r &#92;)</span>. Differentiating under the integral sign:
<span>&#92;[ \varphi'(\rho) = \frac{1}{2\pi}\int&#95;0^{2\pi} \nabla u(z&#95;0 + \rho e^{i\theta}) \cdot e^{i\theta}\, d\theta = \frac{1}{2\pi\rho} \oint&#95;{C&#95;\rho} \frac{\partial u}{\partial \mathbf{n}}\, ds = \frac{1}{2\pi\rho}\iint&#95;{D(z&#95;0,\rho)} \Delta u\, dA = 0. &#92;]</span>
So <span>&#92;( \varphi &#92;)</span> is constant. Since <span>&#92;( \lim&#95;{\rho \to 0} \varphi(\rho) = u(z&#95;0) &#92;)</span> by continuity, we have <span>&#92;( \varphi(\rho) = u(z&#95;0) &#92;)</span> for all <span>&#92;( \rho &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

<div class="theorem" markdown="1">
**Theorem 2.3.3 (Solid Mean Value Theorem).** Under the same hypotheses,
<span>&#92;[ u(z&#95;0) = \frac{1}{\pi r^2} \iint&#95;{D(z&#95;0,r)} u\, dA. &#92;]</span>
</div>

<div class="proof" markdown="1">
*Proof.* Integrate the Circumferential MVT over <span>&#92;( \rho \in [0, r] &#92;)</span>: multiply both sides by <span>&#92;( 2\pi\rho &#92;)</span> and integrate:
<span>&#92;[ \int&#95;0^r u(z&#95;0) \cdot 2\pi\rho\, d\rho = \int&#95;0^r \int&#95;0^{2\pi} u(z&#95;0 + \rho e^{i\theta})\rho\, d\theta\, d\rho. &#92;]</span>
Left side: <span>&#92;( u(z&#95;0) \cdot \pi r^2 &#92;)</span>. Right side: <span>&#92;( \iint&#95;{D(z&#95;0,r)} u\, dA &#92;)</span> in polar coordinates. Divide by <span>&#92;( \pi r^2 &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

## 2.4 Maximum Principle

<div class="theorem" markdown="1">
**Theorem 2.4.1 (Maximum Principle for Harmonic Functions).** Let <span>&#92;( u &#92;)</span> be harmonic on a domain <span>&#92;( D &#92;)</span>.
1. *(Local version)* If <span>&#92;( u &#92;)</span> attains a local maximum or minimum at any interior point, then <span>&#92;( u &#92;)</span> is constant on <span>&#92;( D &#92;)</span>.
2. *(Global version)* If <span>&#92;( D &#92;)</span> is bounded and <span>&#92;( u &#92;)</span> extends continuously to <span>&#92;( \partial D &#92;)</span>, then
<span>&#92;[ \max&#95;{\overline{D}} u = \max&#95;{\partial D} u \quad \text{and} \quad \min&#95;{\overline{D}} u = \min&#95;{\partial D} u. &#92;]</span>
</div>

<div class="proof" markdown="1">
*Proof of (1).* Suppose <span>&#92;( u(z&#95;0) = M &#92;)</span> is a local maximum. The Circumferential MVT gives <span>&#92;( M = \frac{1}{2\pi}\int&#95;0^{2\pi} u(z&#95;0 + re^{i\theta})\, d\theta &#92;)</span> for small <span>&#92;( r &#92;)</span>. Since <span>&#92;( u \leq M &#92;)</span> near <span>&#92;( z&#95;0 &#92;)</span> and the average equals <span>&#92;( M &#92;)</span>, we must have <span>&#92;( u = M &#92;)</span> on <span>&#92;( D(z&#95;0, r) &#92;)</span>. A connectedness argument extends this to all of <span>&#92;( D &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

## 2.5 Harnack's Inequality

<div class="theorem" markdown="1">
**Theorem 2.5.1 (Harnack's Inequality).** Let <span>&#92;( u &#92;)</span> be harmonic and non-negative on <span>&#92;( D(z&#95;0, R) &#92;)</span>. For any <span>&#92;( z &#92;)</span> with <span>&#92;( |z - z_0| = r < R &#92;)</span>,
<span>&#92;[ \frac{R-r}{R+r} u(z&#95;0) \leq u(z) \leq \frac{R+r}{R-r} u(z&#95;0). &#92;]</span>
</div>

<div class="proof" markdown="1">
*Proof.* By the Circumferential MVT and the Poisson formula (or direct estimation from the MVT):
<span>&#92;[ u(z) = \frac{1}{2\pi}\int&#95;0^{2\pi} \frac{R^2 - r^2}{R^2 - 2Rr\cos(\theta - \phi) + r^2} u(z&#95;0 + Re^{i\theta})\, d\theta. &#92;]</span>
Since <span>&#92;( \frac{R-r}{R+r} \leq \frac{R^2 - r^2}{R^2 - 2Rr\cos\alpha + r^2} \leq \frac{R+r}{R-r} &#92;)</span> and the MVT gives <span>&#92;( u(z&#95;0) = \frac{1}{2\pi}\int&#95;0^{2\pi} u(z&#95;0 + Re^{i\theta})\, d\theta &#92;)</span>, the result follows. <span>&#92;( \square &#92;)</span>
</div>

## 2.6 Liouville's Theorem for Harmonic Functions

<div class="theorem" markdown="1">
**Theorem 2.6.1 (Liouville for Harmonic Functions).** If <span>&#92;( u: \mathbb{R}^2 \to \mathbb{R} &#92;)</span> is harmonic and bounded, then <span>&#92;( u &#92;)</span> is constant.
</div>

<div class="proof" markdown="1">
*Proof.* Fix any two points <span>&#92;( z&#95;1, z&#95;2 &#92;)</span>. For large <span>&#92;( R &#92;)</span>, both lie in <span>&#92;( D(0, R/2) &#92;)</span>. Apply Harnack's inequality with centre <span>&#92;( z&#95;1 &#92;)</span> and radius <span>&#92;( R &#92;)</span>. The bound <span>&#92;( |u| \leq M &#92;)</span> and <span>&#92;( \frac{R-r}{R+r} \to 1 &#92;)</span> as <span>&#92;( R \to \infty &#92;)</span> force <span>&#92;( u(z&#95;1) = u(z&#95;2) &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

# Chapter 3: Complex Numbers and Functions

## 3.1 The Complex Field

<div class="definition" markdown="1">
**Definition 3.1.1 (Complex Numbers).** The *complex numbers* <span>&#92;( \mathbb{C} &#92;)</span> are pairs <span>&#92;( (x, y) \in \mathbb{R}^2 &#92;)</span> with componentwise addition and multiplication defined by
<span>&#92;[ (x&#95;1, y&#95;1)(x&#95;2, y&#95;2) = (x&#95;1 x&#95;2 - y&#95;1 y&#95;2,\; x&#95;1 y&#95;2 + x&#95;2 y&#95;1). &#92;]</span>
Writing <span>&#92;( z = x + iy &#92;)</span> with <span>&#92;( i = (0,1) &#92;)</span>, we have <span>&#92;( i^2 = -1 &#92;)</span>. Complex numbers form a field under these operations.
</div>

<div class="definition" markdown="1">
**Definition 3.1.2 (Modulus, Argument, Conjugate).** For <span>&#92;( z = x + iy &#92;)</span>:
- *Real and imaginary parts*: <span>&#92;( \operatorname{Re}(z) = x &#92;)</span>, <span>&#92;( \operatorname{Im}(z) = y &#92;)</span>
- *Modulus* (absolute value): <span>&#92;( |z| = \sqrt{x^2 + y^2} &#92;)</span>
- *Complex conjugate*: <span>&#92;( \bar{z} = x - iy &#92;)</span>
- *Argument*: <span>&#92;( \arg z &#92;)</span> is any <span>&#92;( \theta \in \mathbb{R} &#92;)</span> with <span>&#92;( z = |z|e^{i\theta} = |z|(\cos\theta + i\sin\theta) &#92;)</span>
- *Principal argument*: <span>&#92;( \operatorname{Arg}(z) \in (-\pi, \pi] &#92;)</span> (unique)
</div>

<div class="proposition" markdown="1">
**Proposition 3.1.3 (Algebraic Properties).** For <span>&#92;( z, w \in \mathbb{C} &#92;)</span>:
1. <span>&#92;( z\bar{z} = |z|^2 &#92;)</span>, so <span>&#92;( z^{-1} = \bar{z}/|z|^2 &#92;)</span>
2. <span>&#92;( |zw| = |z||w| &#92;)</span>, <span>&#92;( \overline{zw} = \bar{z}\bar{w} &#92;)</span>
3. Triangle inequality: <span>&#92;( |z + w| \leq |z| + |w| &#92;)</span>
4. <span>&#92;( \operatorname{Re}(z) = \frac{z + \bar{z}}{2} &#92;)</span>, <span>&#92;( \operatorname{Im}(z) = \frac{z - \bar{z}}{2i} &#92;)</span>
5. Polar form: <span>&#92;( z = re^{i\theta} &#92;)</span>, <span>&#92;( w = se^{i\phi} &#92;)</span> gives <span>&#92;( zw = rse^{i(\theta+\phi)} &#92;)</span>
6. De Moivre: <span>&#92;( (re^{i\theta})^n = r^n e^{in\theta} &#92;)</span>
</div>

## 3.2 Limits and Continuity

<div class="definition" markdown="1">
**Definition 3.2.1 (Limit).** For <span>&#92;( f: D \to \mathbb{C} &#92;)</span> and <span>&#92;( z&#95;0 &#92;)</span> a limit point of <span>&#92;( D &#92;)</span>, we write <span>&#92;( \lim&#95;{z\to z&#95;0} f(z) = L &#92;)</span> if: for every <span>&#92;( \varepsilon > 0 &#92;)</span> there exists <span>&#92;( \delta > 0 &#92;)</span> such that <span>&#92;( 0 < |z - z_0| < \delta &#92;)</span> implies <span>&#92;( |f(z) - L| < \varepsilon &#92;)</span>.
</div>

<div class="proposition" markdown="1">
**Proposition 3.2.2.** Writing <span>&#92;( f = u + iv &#92;)</span> and <span>&#92;( L = a + ib &#92;)</span>: <span>&#92;( \lim&#95;{z\to z&#95;0} f(z) = L &#92;)</span> if and only if <span>&#92;( \lim&#95;{(x,y)\to(x&#95;0,y&#95;0)} u = a &#92;)</span> and <span>&#92;( \lim&#95;{(x,y)\to(x&#95;0,y&#95;0)} v = b &#92;)</span>. Hence all limit laws from real analysis hold for complex limits.
</div>

# Chapter 4: Analytic Functions

## 4.1 Complex Differentiability

<div class="definition" markdown="1">
**Definition 4.1.1 (Complex Derivative).** Let <span>&#92;( f: D \to \mathbb{C} &#92;)</span> on an open set <span>&#92;( D &#92;)</span>. The *complex derivative* of <span>&#92;( f &#92;)</span> at <span>&#92;( z&#95;0 \in D &#92;)</span> is
<span>&#92;[ f'(z&#95;0) = \lim&#95;{h \to 0} \frac{f(z&#95;0 + h) - f(z&#95;0)}{h}, \quad h \in \mathbb{C} \setminus \{0\}. &#92;]</span>
If this limit exists, <span>&#92;( f &#92;)</span> is *differentiable* (or *holomorphic*) at <span>&#92;( z&#95;0 &#92;)</span>.
</div>

<div class="definition" markdown="1">
**Definition 4.1.2 (Analytic / Holomorphic Function).** A function <span>&#92;( f: D \to \mathbb{C} &#92;)</span> is *analytic* (or *holomorphic*) on <span>&#92;( D &#92;)</span> if it is differentiable at every point of <span>&#92;( D &#92;)</span>. An *entire* function is analytic on all of <span>&#92;( \mathbb{C} &#92;)</span>.
</div>

<div class="note" markdown="1">
**Note.** Complex differentiability is far more restrictive than real differentiability. The limit <span>&#92;( h \to 0 &#92;)</span> must be the same regardless of the direction from which <span>&#92;( h &#92;)</span> approaches 0 in the complex plane. This rigidity is captured by the Cauchy–Riemann equations.
</div>

## 4.2 Cauchy–Riemann Equations

<div class="theorem" markdown="1">
**Theorem 4.2.1 (CR Equations — Necessary Condition).** If <span>&#92;( f = u + iv &#92;)</span> is differentiable at <span>&#92;( z&#95;0 = x&#95;0 + iy&#95;0 &#92;)</span>, then the partial derivatives <span>&#92;( u&#95;x, u&#95;y, v&#95;x, v&#95;y &#92;)</span> all exist at <span>&#92;( (x&#95;0, y&#95;0) &#92;)</span> and satisfy the *Cauchy–Riemann equations* (CRE):
<span>&#92;[ \frac{\partial u}{\partial x} = \frac{\partial v}{\partial y}, \qquad \frac{\partial u}{\partial y} = -\frac{\partial v}{\partial x}. &#92;]</span>
Moreover, <span>&#92;( f'(z&#95;0) = u&#95;x(x&#95;0, y&#95;0) + iv&#95;x(x&#95;0, y&#95;0) &#92;)</span>.
</div>

<div class="proof" markdown="1">
*Proof.* Since the limit defining <span>&#92;( f'(z&#95;0) &#92;)</span> exists, it must equal the limit along any path. Taking <span>&#92;( h = t \in \mathbb{R} \setminus\{0\} &#92;)</span>:
<span>&#92;[ f'(z&#95;0) = \lim&#95;{t\to 0} \frac{u(x&#95;0+t, y&#95;0) - u(x&#95;0,y&#95;0)}{t} + i\frac{v(x&#95;0+t,y&#95;0) - v(x&#95;0,y&#95;0)}{t} = u&#95;x + iv&#95;x. &#92;]</span>
Taking <span>&#92;( h = it \in i\mathbb{R} \setminus\{0\} &#92;)</span>:
<span>&#92;[ f'(z&#95;0) = \lim&#95;{t\to 0} \frac{u(x&#95;0, y&#95;0+t) - u(x&#95;0,y&#95;0)}{it} + i\frac{v(x&#95;0,y&#95;0+t) - v(x&#95;0,y&#95;0)}{it} = \frac{u&#95;y}{i} + v&#95;y = v&#95;y - iu&#95;y. &#92;]</span>
Equating: <span>&#92;( u&#95;x = v&#95;y &#92;)</span> and <span>&#92;( v&#95;x = -u&#95;y &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

<div class="theorem" markdown="1">
**Theorem 4.2.2 (CR Equations — Sufficient Condition).** Let <span>&#92;( f = u + iv &#92;)</span> be defined on an open set <span>&#92;( D &#92;)</span>. If <span>&#92;( u &#92;)</span> and <span>&#92;( v &#92;)</span> have continuous partial derivatives satisfying the CRE on <span>&#92;( D &#92;)</span>, then <span>&#92;( f &#92;)</span> is analytic on <span>&#92;( D &#92;)</span>.
</div>

<div class="proof" markdown="1">
*Proof.* Continuous partials imply real differentiability:
<span>&#92;[ f(z&#95;0 + h) - f(z&#95;0) = \begin{pmatrix} u&#95;x & u&#95;y \\ v&#95;x & v&#95;y \end{pmatrix}\begin{pmatrix} h&#95;1 \\ h&#95;2 \end{pmatrix} + o(|h|) &#92;]</span>
where <span>&#92;( h = h&#95;1 + ih&#95;2 &#92;)</span>. Using the CRE, the Jacobian matrix is <span>&#92;( \begin{pmatrix} u&#95;x & -v&#95;x \\ v&#95;x & u&#95;x \end{pmatrix} &#92;)</span>, which corresponds to multiplication by the complex number <span>&#92;( u&#95;x + iv&#95;x &#92;)</span>. Thus <span>&#92;( \frac{f(z&#95;0+h) - f(z&#95;0)}{h} \to u&#95;x + iv&#95;x &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

## 4.3 Properties of Analytic Functions

<div class="proposition" markdown="1">
**Proposition 4.3.1 (Algebra of Analytic Functions).** Let <span>&#92;( f, g &#92;)</span> be analytic on <span>&#92;( D &#92;)</span>.
1. <span>&#92;( f \pm g &#92;)</span> and <span>&#92;( fg &#92;)</span> are analytic on <span>&#92;( D &#92;)</span>, and <span>&#92;( f/g &#92;)</span> is analytic on <span>&#92;( \{g \neq 0\} &#92;)</span>.
2. *Chain rule*: if <span>&#92;( g &#92;)</span> is analytic on <span>&#92;( f(D) &#92;)</span>, then <span>&#92;( (g \circ f)' = (g' \circ f)\cdot f' &#92;)</span>.
3. *Constant criterion*: if <span>&#92;( f' = 0 &#92;)</span> on a domain <span>&#92;( D &#92;)</span>, then <span>&#92;( f &#92;)</span> is constant.
4. If <span>&#92;( f &#92;)</span> is analytic with real values (i.e., <span>&#92;( \operatorname{Im}(f) = 0 &#92;)</span>), then <span>&#92;( f &#92;)</span> is constant.
</div>

<div class="proposition" markdown="1">
**Proposition 4.3.2 (Analytic Functions and Harmonic Functions).** If <span>&#92;( f = u + iv &#92;)</span> is analytic on a domain <span>&#92;( D &#92;)</span> and <span>&#92;( u, v \in C^2(D) &#92;)</span>, then both <span>&#92;( u &#92;)</span> and <span>&#92;( v &#92;)</span> are harmonic on <span>&#92;( D &#92;)</span>.
</div>

<div class="proof" markdown="1">
*Proof.* From the CRE: <span>&#92;( u&#95;{xx} = v&#95;{yx} &#92;)</span> and <span>&#92;( u&#95;{yy} = -v&#95;{xy} &#92;)</span>. By equality of mixed partials: <span>&#92;( \Delta u = u&#95;{xx} + u&#95;{yy} = v&#95;{yx} - v&#95;{xy} = 0 &#92;)</span>. Similarly <span>&#92;( \Delta v = 0 &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

<div class="definition" markdown="1">
**Definition 4.3.3 (Harmonic Conjugate).** If <span>&#92;( u &#92;)</span> is harmonic on <span>&#92;( D &#92;)</span>, a *harmonic conjugate* of <span>&#92;( u &#92;)</span> is a harmonic function <span>&#92;( v &#92;)</span> on <span>&#92;( D &#92;)</span> such that <span>&#92;( f = u + iv &#92;)</span> is analytic. A harmonic conjugate, if it exists, is unique up to an additive constant.
</div>

<div class="theorem" markdown="1">
**Theorem 4.3.4 (Existence of Harmonic Conjugate — Poincaré Lemma).** If <span>&#92;( u &#92;)</span> is harmonic on a simply connected domain <span>&#92;( D &#92;)</span>, then <span>&#92;( u &#92;)</span> has a harmonic conjugate <span>&#92;( v &#92;)</span> on <span>&#92;( D &#92;)</span>.
</div>

<div class="proof" markdown="1">
*Proof.* Define
<span>&#92;[ v(z) = \int&#95;{\gamma&#95;z} -u&#95;y\, dx + u&#95;x\, dy &#92;]</span>
where <span>&#92;( \gamma&#95;z &#92;)</span> is any piecewise smooth path in <span>&#92;( D &#92;)</span> from a fixed basepoint <span>&#92;( z&#95;0 &#92;)</span> to <span>&#92;( z &#92;)</span>. The vector field <span>&#92;( (-u&#95;y, u&#95;x) &#92;)</span> satisfies <span>&#92;( \partial(-u&#95;y)/\partial y = -u&#95;{yy} = u&#95;{xx} = \partial(u&#95;x)/\partial x &#92;)</span> (using harmonicity), so it is irrotational. On a simply connected domain, irrotational fields are conservative (by the Bump Principle), so <span>&#92;( v &#92;)</span> is well-defined. Computing: <span>&#92;( v&#95;x = -u&#95;y &#92;)</span> and <span>&#92;( v&#95;y = u&#95;x &#92;)</span>, which are the CRE. <span>&#92;( \square &#92;)</span>
</div>

# Chapter 5: Elementary Functions

## 5.1 The Exponential Function

<div class="definition" markdown="1">
**Definition 5.1.1 (Complex Exponential).** For <span>&#92;( z = x + iy &#92;)</span>, define
<span>&#92;[ e^z = e^x(\cos y + i\sin y). &#92;]</span>
This extends the real exponential. It is entire with <span>&#92;( (e^z)' = e^z &#92;)</span> and satisfies <span>&#92;( e^{z+w} = e^z e^w &#92;)</span> for all <span>&#92;( z, w \in \mathbb{C} &#92;)</span>. Note <span>&#92;( |e^z| = e^x &#92;)</span> and <span>&#92;( e^z &#92;)</span> is periodic with period <span>&#92;( 2\pi i &#92;)</span>.
</div>

<div class="proposition" markdown="1">
**Proposition 5.1.2 (Euler's Formula).** <span>&#92;( e^{i\theta} = \cos\theta + i\sin\theta &#92;)</span>. In particular, <span>&#92;( e^{i\pi} = -1 &#92;)</span> (Euler's identity).
</div>

## 5.2 Trigonometric and Hyperbolic Functions

<div class="definition" markdown="1">
**Definition 5.2.1.** Define
<span>&#92;[ \cos z = \frac{e^{iz} + e^{-iz}}{2}, \quad \sin z = \frac{e^{iz} - e^{-iz}}{2i}, &#92;]</span>
<span>&#92;[ \cosh z = \frac{e^z + e^{-z}}{2}, \quad \sinh z = \frac{e^z - e^{-z}}{2}. &#92;]</span>
These are entire. Key identities: <span>&#92;( \cos^2 z + \sin^2 z = 1 &#92;)</span>, <span>&#92;( \cosh^2 z - \sinh^2 z = 1 &#92;)</span>, <span>&#92;( \cos(iz) = \cosh z &#92;)</span>, <span>&#92;( \sin(iz) = i\sinh z &#92;)</span>.
</div>

## 5.3 The Complex Logarithm

<div class="definition" markdown="1">
**Definition 5.3.1 (Complex Logarithm).** For <span>&#92;( z \neq 0 &#92;)</span>, any <span>&#92;( w &#92;)</span> with <span>&#92;( e^w = z &#92;)</span> is a *logarithm* of <span>&#92;( z &#92;)</span>. Writing <span>&#92;( z = re^{i\theta} &#92;)</span>, all logarithms are
<span>&#92;[ \log z = \ln r + i(\theta + 2\pi k), \quad k \in \mathbb{Z}. &#92;]</span>
The *principal logarithm* on <span>&#92;( D^&#42; = \mathbb{C} \setminus (-\infty, 0] &#92;)</span> is
<span>&#92;[ \operatorname{Log}(z) = \ln|z| + i\operatorname{Arg}(z). &#92;]</span>
</div>

<div class="proposition" markdown="1">
**Proposition 5.3.2.** <span>&#92;( \operatorname{Log}: D^&#42; \to \mathbb{C} &#92;)</span> is analytic with <span>&#92;( (\operatorname{Log}\, z)' = 1/z &#92;)</span>. It is not analytic across the branch cut <span>&#92;( (-\infty, 0] &#92;)</span>.
</div>

<div class="definition" markdown="1">
**Definition 5.3.3 (Branch of the Logarithm).** For any <span>&#92;( \tau \in \mathbb{R} &#92;)</span>, define <span>&#92;( \arg&#95;\tau(z) \in (\tau, \tau + 2\pi) &#92;)</span> as the unique argument in that range. The *branch*
<span>&#92;[ L&#95;\tau(z) = \ln|z| + i\arg&#95;\tau(z) &#92;]</span>
is analytic on <span>&#92;( \mathbb{C} &#92;)</span> minus the ray <span>&#92;( \{re^{i\tau} : r \geq 0\} &#92;)</span>. Note <span>&#92;( \operatorname{Log} = L&#95;{-\pi} &#92;)</span>.
</div>

<div class="note" markdown="1">
**Note.** The harmonic conjugate of <span>&#92;( \operatorname{Arg}(z) &#92;)</span> on <span>&#92;( D^&#42; &#92;)</span> is <span>&#92;( \ln|z| &#92;)</span>, since <span>&#92;( \operatorname{Log}\, z = \ln|z| + i\operatorname{Arg}(z) &#92;)</span> is analytic. This shows <span>&#92;( \operatorname{Arg} &#92;)</span> is harmonic on <span>&#92;( D^&#42; &#92;)</span>.
</div>

## 5.4 Complex Powers

<div class="definition" markdown="1">
**Definition 5.4.1 (Complex Power).** For <span>&#92;( \alpha \in \mathbb{C} &#92;)</span> and <span>&#92;( z \neq 0 &#92;)</span>, define <span>&#92;( z^\alpha = e^{\alpha\log z} &#92;)</span>. Since <span>&#92;( \log z &#92;)</span> is multi-valued, so is <span>&#92;( z^\alpha &#92;)</span> in general. The *principal value* is <span>&#92;( \operatorname{p.v.}\, z^\alpha = e^{\alpha\operatorname{Log}\, z} &#92;)</span>.
</div>

<div class="example" markdown="1">
**Example 5.4.2 (n-th Roots).** The <span>&#92;( n &#92;)</span>-th roots of <span>&#92;( z = re^{i\theta} &#92;)</span> are
<span>&#92;[ z^{1/n} = r^{1/n} e^{i(\theta + 2\pi k)/n}, \quad k = 0, 1, \ldots, n-1. &#92;]</span>
These are <span>&#92;( n &#92;)</span> equally spaced points on a circle of radius <span>&#92;( r^{1/n} &#92;)</span>.
</div>

<div class="example" markdown="1">
**Example 5.4.3.** <span>&#92;( i^i = e^{i\operatorname{Log}(i)} = e^{i\cdot i\pi/2} = e^{-\pi/2} \approx 0.2079 &#92;)</span>. Surprisingly, a purely imaginary power of a purely imaginary number is real.
</div>

# Chapter 6: Complex Integration

## 6.1 Contour Integrals

<div class="definition" markdown="1">
**Definition 6.1.1 (Contour Integral).** Let <span>&#92;( \gamma: [a,b] \to \mathbb{C} &#92;)</span> be piecewise smooth and <span>&#92;( f: \operatorname{Im}(\gamma) \to \mathbb{C} &#92;)</span> continuous. The *contour integral* is
<span>&#92;[ \int&#95;\gamma f(z)\, dz = \int&#95;a^b f(\gamma(t))\gamma'(t)\, dt. &#92;]</span>
Writing <span>&#92;( f = u + iv &#92;)</span> and <span>&#92;( dz = dx + i\, dy &#92;)</span>: <span>&#92;( \int&#95;\gamma f\, dz = \int&#95;\gamma u\, dx - v\, dy + i\int&#95;\gamma v\, dx + u\, dy &#92;)</span>.
</div>

<div class="proposition" markdown="1">
**Proposition 6.1.2 (ML-Inequality).** If <span>&#92;( |f(z)| \leq M &#92;)</span> for all <span>&#92;( z \in \operatorname{Im}(\gamma) &#92;)</span> and <span>&#92;( \ell(\gamma) = L &#92;)</span>, then
<span>&#92;[ \left|\int&#95;\gamma f(z)\, dz\right| \leq ML. &#92;]</span>
</div>

<div class="example" markdown="1">
**Example 6.1.3.** Compute <span>&#92;( \oint&#95;{|z|=r} \frac{1}{z}\, dz &#92;)</span>. Parametrize: <span>&#92;( \gamma(t) = re^{it} &#92;)</span>, <span>&#92;( t \in [0, 2\pi] &#92;)</span>, <span>&#92;( \gamma'(t) = ire^{it} &#92;)</span>.
<span>&#92;[ \oint&#95;{|z|=r} \frac{1}{z}\, dz = \int&#95;0^{2\pi} \frac{1}{re^{it}} \cdot ire^{it}\, dt = \int&#95;0^{2\pi} i\, dt = 2\pi i. &#92;]</span>
More generally, <span>&#92;( \oint&#95;{|z-z&#95;0|=r} (z-z&#95;0)^n\, dz = \begin{cases} 2\pi i & n = -1 \\ 0 & n \neq -1 \end{cases} &#92;)</span>.
</div>

## 6.2 Antiderivatives and Path Independence

<div class="theorem" markdown="1">
**Theorem 6.2.1 (Antiderivative Theorem).** Let <span>&#92;( f &#92;)</span> be analytic on a domain <span>&#92;( D &#92;)</span> with antiderivative <span>&#92;( F &#92;)</span> (so <span>&#92;( F' = f &#92;)</span>). Then for any piecewise smooth <span>&#92;( \gamma &#92;)</span> in <span>&#92;( D &#92;)</span> from <span>&#92;( z&#95;0 &#92;)</span> to <span>&#92;( z&#95;1 &#92;)</span>:
<span>&#92;[ \int&#95;\gamma f(z)\, dz = F(z&#95;1) - F(z&#95;0). &#92;]</span>
</div>

<div class="theorem" markdown="1">
**Theorem 6.2.2 (Characterization of Antiderivative Existence).** For a continuous function <span>&#92;( f &#92;)</span> on a domain <span>&#92;( D &#92;)</span>, the following are equivalent:
1. <span>&#92;( f &#92;)</span> has an antiderivative on <span>&#92;( D &#92;)</span>.
2. <span>&#92;( \int&#95;\gamma f\, dz &#92;)</span> depends only on the endpoints of <span>&#92;( \gamma &#92;)</span>.
3. <span>&#92;( \oint&#95;\gamma f\, dz = 0 &#92;)</span> for every closed piecewise smooth curve <span>&#92;( \gamma &#92;)</span> in <span>&#92;( D &#92;)</span>.
</div>

## 6.3 Cauchy's Integral Theorem

<div class="theorem" markdown="1">
**Theorem 6.3.1 (Cauchy's Integral Theorem).** Let <span>&#92;( f &#92;)</span> be analytic on a simply connected domain <span>&#92;( D &#92;)</span>. Then for any closed piecewise smooth curve <span>&#92;( \gamma &#92;)</span> in <span>&#92;( D &#92;)</span>,
<span>&#92;[ \oint&#95;\gamma f(z)\, dz = 0. &#92;]</span>
</div>

<div class="proof" markdown="1">
*Proof (assuming <span>&#92;( f' &#92;)</span> continuous).* Write <span>&#92;( \int&#95;\gamma f\, dz = \int&#95;\gamma u\, dx - v\, dy + i\int&#95;\gamma v\, dx + u\, dy &#92;)</span>. By Green's theorem applied to a Jordan domain bounded by <span>&#92;( \gamma &#92;)</span>:
<span>&#92;[ \oint&#95;\gamma u\, dx - v\, dy = \iint (-v&#95;x - u&#95;y)\, dA = 0, \quad \oint&#95;\gamma v\, dx + u\, dy = \iint (u&#95;x - v&#95;y)\, dA = 0 &#92;]</span>
using the CRE. <span>&#92;( \square &#92;)</span>
</div>

<div class="theorem" markdown="1">
**Theorem 6.3.2 (Cauchy–Goursat Theorem).** The same conclusion holds even without assuming <span>&#92;( f' &#92;)</span> is continuous: analyticity alone suffices.
</div>

<div class="theorem" markdown="1">
**Theorem 6.3.3 (Deformation Principle).** If <span>&#92;( f &#92;)</span> is analytic on a domain <span>&#92;( D &#92;)</span> and <span>&#92;( \gamma&#95;0, \gamma&#95;1 &#92;)</span> are homotopic closed curves in <span>&#92;( D &#92;)</span> (one can be continuously deformed into the other within <span>&#92;( D &#92;)</span>), then
<span>&#92;[ \oint&#95;{\gamma&#95;0} f\, dz = \oint&#95;{\gamma&#95;1} f\, dz. &#92;]</span>
</div>

## 6.4 Cauchy's Integral Formula

<div class="theorem" markdown="1">
**Theorem 6.4.1 (Cauchy's Integral Formula — CIF).** Let <span>&#92;( f &#92;)</span> be analytic on a domain <span>&#92;( D &#92;)</span> and let <span>&#92;( \gamma &#92;)</span> be a simple closed piecewise smooth curve in <span>&#92;( D &#92;)</span> oriented counterclockwise, enclosing a simply connected region in <span>&#92;( D &#92;)</span>. For any <span>&#92;( z&#95;0 &#92;)</span> inside <span>&#92;( \gamma &#92;)</span>:
<span>&#92;[ f(z&#95;0) = \frac{1}{2\pi i} \oint&#95;\gamma \frac{f(z)}{z - z&#95;0}\, dz. &#92;]</span>
</div>

<div class="proof" markdown="1">
*Proof.* By the Deformation Principle, deform <span>&#92;( \gamma &#92;)</span> to a small circle <span>&#92;( C&#95;\varepsilon: |z - z&#95;0| = \varepsilon &#92;)</span>:
<span>&#92;[ \frac{1}{2\pi i}\oint&#95;{C&#95;\varepsilon} \frac{f(z)}{z-z&#95;0}\, dz = \frac{1}{2\pi i}\oint&#95;{C&#95;\varepsilon} \frac{f(z&#95;0)}{z-z&#95;0}\, dz + \frac{1}{2\pi i}\oint&#95;{C&#95;\varepsilon} \frac{f(z)-f(z&#95;0)}{z-z&#95;0}\, dz = f(z&#95;0) + E&#95;\varepsilon. &#92;]</span>
The first integral is <span>&#92;( f(z&#95;0) &#92;)</span> by Example 6.1.3. For <span>&#92;( E&#95;\varepsilon &#92;)</span>: since <span>&#92;( f &#92;)</span> is continuous at <span>&#92;( z&#95;0 &#92;)</span>, <span>&#92;( |f(z) - f(z&#95;0)| \leq \delta(\varepsilon) \to 0 &#92;)</span> on <span>&#92;( C&#95;\varepsilon &#92;)</span>, so <span>&#92;( |E&#95;\varepsilon| \leq \delta(\varepsilon) \to 0 &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

<div class="theorem" markdown="1">
**Theorem 6.4.2 (Higher Derivatives Formula).** Under the same hypotheses, <span>&#92;( f &#92;)</span> has complex derivatives of all orders, and
<span>&#92;[ f^{(n)}(z&#95;0) = \frac{n!}{2\pi i} \oint&#95;\gamma \frac{f(z)}{(z-z&#95;0)^{n+1}}\, dz. &#92;]</span>
</div>

<div class="proof" markdown="1">
*Proof.* Differentiate the CIF <span>&#92;( n &#92;)</span> times with respect to <span>&#92;( z&#95;0 &#92;)</span> under the integral sign (justified by uniform convergence on compact sets). <span>&#92;( \square &#92;)</span>
</div>

## 6.5 Consequences

<div class="theorem" markdown="1">
**Theorem 6.5.1 (Liouville's Theorem).** Every bounded entire function is constant.
</div>

<div class="proof" markdown="1">
*Proof.* Let <span>&#92;( |f| \leq M &#92;)</span>. Apply the higher derivatives formula with <span>&#92;( n = 1 &#92;)</span> on a circle <span>&#92;( C&#95;R &#92;)</span> of radius <span>&#92;( R &#92;)</span>:
<span>&#92;[ |f'(z&#95;0)| = \left|\frac{1}{2\pi i}\oint&#95;{C&#95;R} \frac{f(z)}{(z-z&#95;0)^2}\, dz\right| \leq \frac{1}{2\pi}\cdot\frac{M}{(R - |z&#95;0|)^2}\cdot 2\pi R \to 0 \text{ as } R\to\infty. &#92;]</span>
So <span>&#92;( f' = 0 &#92;)</span>, hence <span>&#92;( f &#92;)</span> is constant. <span>&#92;( \square &#92;)</span>
</div>

<div class="theorem" markdown="1">
**Theorem 6.5.2 (Fundamental Theorem of Algebra).** Every non-constant polynomial <span>&#92;( p(z) \in \mathbb{C}[z] &#92;)</span> has at least one root in <span>&#92;( \mathbb{C} &#92;)</span>. Consequently, every degree-<span>&#92;( n &#92;)</span> polynomial factors completely: <span>&#92;( p(z) = a(z-z&#95;1)^{m&#95;1}\cdots(z-z&#95;k)^{m&#95;k} &#92;)</span> with <span>&#92;( \sum m&#95;j = n &#92;)</span>.
</div>

<div class="proof" markdown="1">
*Proof.* Suppose <span>&#92;( p(z) \neq 0 &#92;)</span> for all <span>&#92;( z \in \mathbb{C} &#92;)</span>. Then <span>&#92;( f = 1/p &#92;)</span> is entire. Since <span>&#92;( |p(z)| \to \infty &#92;)</span> as <span>&#92;( |z| \to \infty &#92;)</span> (polynomials of degree <span>&#92;( \geq 1 &#92;)</span> are unbounded), <span>&#92;( f &#92;)</span> is bounded. Liouville's theorem gives <span>&#92;( f &#92;)</span> constant, so <span>&#92;( p &#92;)</span> is constant — contradiction. <span>&#92;( \square &#92;)</span>
</div>

<div class="theorem" markdown="1">
**Theorem 6.5.3 (Morera's Theorem).** Let <span>&#92;( f &#92;)</span> be continuous on a domain <span>&#92;( D &#92;)</span>. If <span>&#92;( \oint&#95;T f\, dz = 0 &#92;)</span> for every triangular contour <span>&#92;( T &#92;)</span> in <span>&#92;( D &#92;)</span>, then <span>&#92;( f &#92;)</span> is analytic on <span>&#92;( D &#92;)</span>.
</div>

# Chapter 7: Series Representations

## 7.1 Sequences and Series

<div class="definition" markdown="1">
**Definition 7.1.1 (Convergence).** A series <span>&#92;( \sum&#95;{n=0}^\infty a&#95;n &#92;)</span> of complex numbers *converges absolutely* if <span>&#92;( \sum |a_n| < \infty &#92;)</span>. Absolute convergence implies convergence.
</div>

<div class="theorem" markdown="1">
**Theorem 7.1.2 (Ratio Test).** If <span>&#92;( L = \lim&#95;{n\to\infty} |a&#95;{n+1}/a&#95;n| &#92;)</span> exists, then <span>&#92;( \sum a&#95;n &#92;)</span> converges absolutely if <span>&#92;( L < 1 &#92;)</span> and diverges if <span>&#92;( L > 1 &#92;)</span>. At <span>&#92;( L = 1 &#92;)</span> the test is inconclusive.
</div>

<div class="definition" markdown="1">
**Definition 7.1.3 (Uniform Convergence).** A series <span>&#92;( \sum f&#95;n &#92;)</span> of functions *converges uniformly* to <span>&#92;( f &#92;)</span> on <span>&#92;( S &#92;)</span> if <span>&#92;( \sup&#95;{z \in S}|S&#95;N(z) - f(z)| \to 0 &#92;)</span> as <span>&#92;( N \to \infty &#92;)</span>.
</div>

<div class="theorem" markdown="1">
**Theorem 7.1.4 (Weierstrass M-Test).** If <span>&#92;( |f&#95;n(z)| \leq M&#95;n &#92;)</span> for all <span>&#92;( z \in S &#92;)</span> and <span>&#92;( \sum M_n < \infty &#92;)</span>, then <span>&#92;( \sum f&#95;n &#92;)</span> converges uniformly and absolutely on <span>&#92;( S &#92;)</span>. Moreover, if each <span>&#92;( f&#95;n &#92;)</span> is continuous, the limit is continuous; if each <span>&#92;( f&#95;n &#92;)</span> is analytic, the limit is analytic.
</div>

## 7.2 Power Series

<div class="definition" markdown="1">
**Definition 7.2.1 (Power Series and Radius of Convergence).** A *power series* centred at <span>&#92;( z&#95;0 &#92;)</span> is <span>&#92;( \sum&#95;{n=0}^\infty c&#95;n(z-z&#95;0)^n &#92;)</span>. The *radius of convergence* is
<span>&#92;[ R = \frac{1}{\limsup&#95;{n\to\infty} |c&#95;n|^{1/n}} \in [0, +\infty]. &#92;]</span>
The series converges absolutely on <span>&#92;( D(z&#95;0, R) &#92;)</span>, diverges for <span>&#92;( |z-z&#95;0| > R &#92;)</span>, and converges uniformly on any compact subset of <span>&#92;( D(z&#95;0,R) &#92;)</span>.
</div>

<div class="theorem" markdown="1">
**Theorem 7.2.2 (Analyticity of Power Series).** A power series <span>&#92;( f(z) = \sum&#95;{n=0}^\infty c&#95;n(z-z&#95;0)^n &#92;)</span> with radius of convergence <span>&#92;( R > 0 &#92;)</span> is analytic on <span>&#92;( D(z&#95;0, R) &#92;)</span> with
<span>&#92;[ f'(z) = \sum&#95;{n=1}^\infty nc&#95;n(z-z&#95;0)^{n-1}, &#92;]</span>
and this series also has radius of convergence <span>&#92;( R &#92;)</span>. Moreover, the series can be integrated term by term on any curve in <span>&#92;( D(z&#95;0, R) &#92;)</span>.
</div>

## 7.3 Taylor's Theorem

<div class="theorem" markdown="1">
**Theorem 7.3.1 (Taylor's Theorem).** Let <span>&#92;( f &#92;)</span> be analytic on <span>&#92;( D(z&#95;0, R) &#92;)</span>. Then <span>&#92;( f &#92;)</span> equals its Taylor series on this disc:
<span>&#92;[ f(z) = \sum&#95;{n=0}^\infty \frac{f^{(n)}(z&#95;0)}{n!}(z-z&#95;0)^n. &#92;]</span>
The radius of convergence of this series is at least <span>&#92;( R &#92;)</span> (and equals the distance from <span>&#92;( z&#95;0 &#92;)</span> to the nearest singularity of <span>&#92;( f &#92;)</span>).
</div>

<div class="proof" markdown="1">
*Proof.* For <span>&#92;( z \in D(z&#95;0, R) &#92;)</span>, choose <span>&#92;( r &#92;)</span> with <span>&#92;( |z-z_0| < r < R &#92;)</span>. By CIF on <span>&#92;( C&#95;r &#92;)</span>:
<span>&#92;[ f(z) = \frac{1}{2\pi i}\oint&#95;{C&#95;r} \frac{f(w)}{w-z}\, dw. &#92;]</span>
Write <span>&#92;( \frac{1}{w-z} = \frac{1}{(w-z&#95;0)(1-(z-z&#95;0)/(w-z&#95;0))} = \sum&#95;{n=0}^\infty \frac{(z-z&#95;0)^n}{(w-z&#95;0)^{n+1}} &#92;)</span>, which converges uniformly on <span>&#92;( C&#95;r &#92;)</span> since <span>&#92;( |z-z_0|/r < 1 &#92;)</span>. Integrating term by term and using the higher derivatives formula gives <span>&#92;( f(z) = \sum&#95;{n=0}^\infty \frac{f^{(n)}(z&#95;0)}{n!}(z-z&#95;0)^n &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

<div class="example" markdown="1">
**Example 7.3.2 (Standard Taylor Series).**
- <span>&#92;( e^z = \sum&#95;{n=0}^\infty \frac{z^n}{n!} &#92;)</span>, <span>&#92;( R = \infty &#92;)</span>
- <span>&#92;( \sin z = \sum&#95;{n=0}^\infty \frac{(-1)^n z^{2n+1}}{(2n+1)!} &#92;)</span>, <span>&#92;( R = \infty &#92;)</span>
- <span>&#92;( \cos z = \sum&#95;{n=0}^\infty \frac{(-1)^n z^{2n}}{(2n)!} &#92;)</span>, <span>&#92;( R = \infty &#92;)</span>
- <span>&#92;( \frac{1}{1-z} = \sum&#95;{n=0}^\infty z^n &#92;)</span>, <span>&#92;( R = 1 &#92;)</span>
- <span>&#92;( \operatorname{Log}(1+z) = \sum&#95;{n=1}^\infty \frac{(-1)^{n+1}z^n}{n} &#92;)</span>, <span>&#92;( R = 1 &#92;)</span>
</div>

<div class="example" markdown="1">
**Example 7.3.3.** Find the Taylor series of <span>&#92;( f(z) = e^{3z^2} &#92;)</span> at <span>&#92;( z&#95;0 = 0 &#92;)</span>.

Substitute <span>&#92;( z \mapsto 3z^2 &#92;)</span> in the series for <span>&#92;( e^z &#92;)</span>:
<span>&#92;[ e^{3z^2} = \sum&#95;{n=0}^\infty \frac{(3z^2)^n}{n!} = \sum&#95;{n=0}^\infty \frac{3^n z^{2n}}{n!} = 1 + 3z^2 + \frac{9}{2}z^4 + \frac{9}{2}z^6 + \cdots &#92;]</span>
with radius of convergence <span>&#92;( R = \infty &#92;)</span>.
</div>

<div class="example" markdown="1">
**Example 7.3.4.** Find the Taylor series of <span>&#92;( \operatorname{Log}\, z &#92;)</span> at <span>&#92;( z&#95;0 = 2 &#92;)</span>.

<span>&#92;[ \operatorname{Log}\, z = \operatorname{Log}\, 2 + \operatorname{Log}(1 + (z-2)/2) = \operatorname{Log}\, 2 + \sum&#95;{n=1}^\infty \frac{(-1)^{n+1}}{n}\left(\frac{z-2}{2}\right)^n &#92;]</span>
with radius of convergence <span>&#92;( R = 2 &#92;)</span> (distance from <span>&#92;( z&#95;0 = 2 &#92;)</span> to the nearest singularity at <span>&#92;( z = 0 &#92;)</span>).
</div>

## 7.4 Zeros of Analytic Functions

<div class="definition" markdown="1">
**Definition 7.4.1 (Order of a Zero).** A point <span>&#92;( z&#95;0 &#92;)</span> is a *zero of order* <span>&#92;( m \geq 1 &#92;)</span> of <span>&#92;( f &#92;)</span> if <span>&#92;( f(z&#95;0) = f'(z&#95;0) = \cdots = f^{(m-1)}(z&#95;0) = 0 &#92;)</span> but <span>&#92;( f^{(m)}(z&#95;0) \neq 0 &#92;)</span>. Equivalently, <span>&#92;( f(z) = (z-z&#95;0)^m g(z) &#92;)</span> with <span>&#92;( g &#92;)</span> analytic and <span>&#92;( g(z&#95;0) \neq 0 &#92;)</span>. A simple zero has order 1.
</div>

<div class="theorem" markdown="1">
**Theorem 7.4.2 (Isolated Zeros).** If <span>&#92;( f &#92;)</span> is analytic on a domain <span>&#92;( D &#92;)</span> and not identically zero, then the zeros of <span>&#92;( f &#92;)</span> are isolated: for each zero <span>&#92;( z&#95;0 &#92;)</span> there exists <span>&#92;( r > 0 &#92;)</span> with <span>&#92;( f(z) \neq 0 &#92;)</span> for <span>&#92;( 0 < |z-z_0| < r &#92;)</span>.
</div>

<div class="theorem" markdown="1">
**Theorem 7.4.3 (Identity Theorem).** Let <span>&#92;( f, g &#92;)</span> be analytic on a domain <span>&#92;( D &#92;)</span>. If <span>&#92;( f = g &#92;)</span> on a set <span>&#92;( S \subseteq D &#92;)</span> having a limit point in <span>&#92;( D &#92;)</span>, then <span>&#92;( f = g &#92;)</span> on all of <span>&#92;( D &#92;)</span>.
</div>

<div class="proof" markdown="1">
*Proof.* Apply the isolated zeros theorem to <span>&#92;( h = f - g &#92;)</span>. The set where <span>&#92;( h = 0 &#92;)</span> is both open (by the isolated-zeros argument) and closed (by continuity), and is nonempty; since <span>&#92;( D &#92;)</span> is connected, it equals all of <span>&#92;( D &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

# Chapter 8: Laurent Series and Singularities

## 8.1 Laurent Series

<div class="theorem" markdown="1">
**Theorem 8.1.1 (Laurent Series Theorem).** Let <span>&#92;( f &#92;)</span> be analytic on the annulus <span>&#92;( A = A(z_0; r, R) = \{z : r < |z-z_0| < R\} &#92;)</span> (with <span>&#92;( 0 \leq r < R \leq \infty &#92;)</span>). Then <span>&#92;( f &#92;)</span> has a unique *Laurent series representation*:
<span>&#92;[ f(z) = \sum&#95;{n=-\infty}^\infty c&#95;n(z-z&#95;0)^n = \sum&#95;{n=0}^\infty c&#95;n(z-z&#95;0)^n + \sum&#95;{n=1}^\infty \frac{c&#95;{-n}}{(z-z&#95;0)^n}, &#92;]</span>
converging absolutely and uniformly on compact subsets of <span>&#92;( A &#92;)</span>, where for any <span>&#92;( \rho \in (r, R) &#92;)</span>:
<span>&#92;[ c&#95;n = \frac{1}{2\pi i}\oint&#95;{|z-z&#95;0|=\rho} \frac{f(z)}{(z-z&#95;0)^{n+1}}\, dz. &#92;]</span>
</div>

<div class="definition" markdown="1">
**Definition 8.1.2 (Principal Part).** In the Laurent expansion, the *principal part* is <span>&#92;( \sum&#95;{n=1}^\infty c&#95;{-n}(z-z&#95;0)^{-n} &#92;)</span> (the negative-power terms) and the *analytic part* is <span>&#92;( \sum&#95;{n=0}^\infty c&#95;n(z-z&#95;0)^n &#92;)</span>.
</div>

<div class="example" markdown="1">
**Example 8.1.3.** Find all Laurent series of <span>&#92;( f(z) = \frac{1}{z(z-1)} &#92;)</span>.

The singularities are at <span>&#92;( z = 0 &#92;)</span> and <span>&#92;( z = 1 &#92;)</span>. Three annular regions:

**(a) <span>&#92;( 0 < |z| < 1 &#92;)</span>:** Use partial fractions <span>&#92;( f = -\frac{1}{z} + \frac{1}{z-1} = -\frac{1}{z} - \frac{1}{1-z} &#92;)</span>:
<span>&#92;[ f(z) = -\frac{1}{z} - \sum&#95;{n=0}^\infty z^n = -z^{-1} - 1 - z - z^2 - \cdots &#92;]</span>

**(b) <span>&#92;( 1 < |z| < \infty &#92;)</span>:** <span>&#92;( \frac{1}{z-1} = \frac{1}{z}\cdot\frac{1}{1-1/z} = \frac{1}{z}\sum&#95;{n=0}^\infty z^{-n} &#92;)</span>:
<span>&#92;[ f(z) = -\frac{1}{z} + \frac{1}{z}\sum&#95;{n=0}^\infty \frac{1}{z^n} = \sum&#95;{n=0}^\infty \frac{1}{z^{n+2}} = z^{-2} + z^{-3} + \cdots &#92;]</span>
</div>

## 8.2 Classification of Isolated Singularities

<div class="definition" markdown="1">
**Definition 8.2.1 (Isolated Singularity).** If <span>&#92;( f &#92;)</span> is analytic on <span>&#92;( A(z&#95;0; 0, R) &#92;)</span> but not at <span>&#92;( z&#95;0 &#92;)</span> itself, <span>&#92;( z&#95;0 &#92;)</span> is an *isolated singularity*. Classify by the Laurent principal part:
- **Removable singularity**: principal part is 0 (all <span>&#92;( c&#95;n = 0 &#92;)</span> for <span>&#92;( n < 0 &#92;)</span>). Then <span>&#92;( \lim&#95;{z\to z&#95;0} f(z) &#92;)</span> exists finitely.
- **Pole of order <span>&#92;( m &#92;)</span>**: <span>&#92;( c&#95;{-m} \neq 0 &#92;)</span> and <span>&#92;( c&#95;n = 0 &#92;)</span> for <span>&#92;( n < -m &#92;)</span>. Then <span>&#92;( \lim&#95;{z\to z&#95;0} |f(z)| = \infty &#92;)</span>.
- **Essential singularity**: infinitely many nonzero <span>&#92;( c&#95;n &#92;)</span> with <span>&#92;( n < 0 &#92;)</span>.
</div>

<div class="theorem" markdown="1">
**Theorem 8.2.2 (Riemann's Removability Criterion).** The isolated singularity <span>&#92;( z&#95;0 &#92;)</span> of <span>&#92;( f &#92;)</span> is removable if and only if <span>&#92;( f &#92;)</span> is bounded in some punctured disc <span>&#92;( 0 < |z - z_0| < \delta &#92;)</span> (equivalently, if <span>&#92;( \lim&#95;{z\to z&#95;0}(z-z&#95;0)f(z) = 0 &#92;)</span>).
</div>

<div class="theorem" markdown="1">
**Theorem 8.2.3 (Casorati–Weierstrass).** Near an essential singularity <span>&#92;( z&#95;0 &#92;)</span>, the image of any punctured disc <span>&#92;( D(z&#95;0,r)\setminus\{z&#95;0\} &#92;)</span> is dense in <span>&#92;( \mathbb{C} &#92;)</span>. (The stronger Picard's Great Theorem states the image omits at most one value.)
</div>

# Chapter 9: The Residue Theorem

## 9.1 Residues

<div class="definition" markdown="1">
**Definition 9.1.1 (Residue).** The *residue* of <span>&#92;( f &#92;)</span> at an isolated singularity <span>&#92;( z&#95;0 &#92;)</span> is
<span>&#92;[ \operatorname{Res}(f, z&#95;0) = c&#95;{-1} = \frac{1}{2\pi i}\oint&#95;{C&#95;\varepsilon} f(z)\, dz &#92;]</span>
where <span>&#92;( C&#95;\varepsilon &#92;)</span> is any small circle around <span>&#92;( z&#95;0 &#92;)</span>.
</div>

<div class="proposition" markdown="1">
**Proposition 9.1.2 (Computing Residues).**
1. *Simple pole*: <span>&#92;( \operatorname{Res}(f, z&#95;0) = \lim&#95;{z\to z&#95;0}(z-z&#95;0)f(z) &#92;)</span>.
2. *Simple pole of <span>&#92;( g/h &#92;)</span>*: if <span>&#92;( g(z&#95;0) \neq 0 &#92;)</span>, <span>&#92;( h(z&#95;0) = 0 &#92;)</span>, <span>&#92;( h'(z&#95;0) \neq 0 &#92;)</span>, then <span>&#92;( \operatorname{Res}(g/h, z&#95;0) = g(z&#95;0)/h'(z&#95;0) &#92;)</span>.
3. *Pole of order <span>&#92;( m &#92;)</span>*:
<span>&#92;[ \operatorname{Res}(f, z&#95;0) = \frac{1}{(m-1)!}\lim&#95;{z\to z&#95;0}\frac{d^{m-1}}{dz^{m-1}}\bigl[(z-z&#95;0)^m f(z)\bigr]. &#92;]</span>
</div>

<div class="example" markdown="1">
**Example 9.1.3.** Compute <span>&#92;( \operatorname{Res}\!\left(\frac{z^2}{(z-1)^2(z+2)}, 1\right) &#92;)</span>.

Pole of order 2 at <span>&#92;( z = 1 &#92;)</span>:
<span>&#92;[ \operatorname{Res} = \lim&#95;{z\to 1}\frac{d}{dz}\left[\frac{z^2}{z+2}\right] = \lim&#95;{z\to 1}\frac{2z(z+2) - z^2}{(z+2)^2} = \frac{2\cdot 3 - 1}{9} = \frac{5}{9}. &#92;]</span>
</div>

## 9.2 The Residue Theorem

<div class="theorem" markdown="1">
**Theorem 9.2.1 (Residue Theorem).** Let <span>&#92;( f &#92;)</span> be analytic on a domain <span>&#92;( D &#92;)</span> except at finitely many isolated singularities <span>&#92;( z&#95;1, \ldots, z&#95;k &#92;)</span>. Let <span>&#92;( \gamma &#92;)</span> be a simple closed piecewise smooth curve in <span>&#92;( D &#92;)</span> oriented counterclockwise, enclosing all the singularities (and with its interior in <span>&#92;( D &#92;)</span>). Then
<span>&#92;[ \oint&#95;\gamma f(z)\, dz = 2\pi i \sum&#95;{j=1}^k \operatorname{Res}(f, z&#95;j). &#92;]</span>
</div>

<div class="proof" markdown="1">
*Proof.* By the Deformation Principle, deform <span>&#92;( \gamma &#92;)</span> to small disjoint circles <span>&#92;( C&#95;j &#92;)</span> around each <span>&#92;( z&#95;j &#92;)</span>:
<span>&#92;[ \oint&#95;\gamma f\, dz = \sum&#95;{j=1}^k \oint&#95;{C&#95;j} f\, dz = 2\pi i \sum&#95;{j=1}^k \operatorname{Res}(f, z&#95;j). \quad \square &#92;]</span>
</div>

## 9.3 Applications to Real Integrals

<div class="example" markdown="1">
**Example 9.3.1 (Rational Functions).** To evaluate <span>&#92;( \int&#95;{-\infty}^\infty P(x)/Q(x)\, dx &#92;)</span> where <span>&#92;( \deg Q \geq \deg P + 2 &#92;)</span> and <span>&#92;( Q &#92;)</span> has no real roots: integrate over a semicircular contour in the upper half-plane. As <span>&#92;( R \to \infty &#92;)</span>, the semicircle contributes 0 (ML-inequality). Thus
<span>&#92;[ \int&#95;{-\infty}^\infty \frac{P(x)}{Q(x)}\, dx = 2\pi i \sum&#95;{\operatorname{Im}(z&#95;j) > 0} \operatorname{Res}\!\left(\frac{P}{Q}, z&#95;j\right). &#92;]</span>
</div>

<div class="proposition" markdown="1">
**Proposition 9.3.2 (Jordan's Lemma).** Let <span>&#92;( f &#92;)</span> be analytic for <span>&#92;( \operatorname{Im}(z) \geq 0, |z| \geq R&#95;0 &#92;)</span>, with <span>&#92;( \max&#95;{|z|=R, \operatorname{Im}(z)\geq 0}|f(z)| \to 0 &#92;)</span> as <span>&#92;( R \to \infty &#92;)</span>. Then for <span>&#92;( \lambda > 0 &#92;)</span>:
<span>&#92;[ \lim&#95;{R\to\infty} \int&#95;{\Gamma&#95;R} f(z)e^{i\lambda z}\, dz = 0 &#92;]</span>
where <span>&#92;( \Gamma&#95;R &#92;)</span> is the upper semicircle of radius <span>&#92;( R &#92;)</span>. This enables evaluation of <span>&#92;( \int&#95;{-\infty}^\infty f(x)\sin(\lambda x)\, dx &#92;)</span> and <span>&#92;( \int&#95;{-\infty}^\infty f(x)\cos(\lambda x)\, dx &#92;)</span>.
</div>

<div class="example" markdown="1">
**Example 9.3.3 (Trigonometric Integrals).** To evaluate <span>&#92;( \int&#95;0^{2\pi} R(\cos\theta, \sin\theta)\, d\theta &#92;)</span>, substitute <span>&#92;( z = e^{i\theta} &#92;)</span>:
<span>&#92;[ \cos\theta = \frac{z + z^{-1}}{2}, \quad \sin\theta = \frac{z - z^{-1}}{2i}, \quad d\theta = \frac{dz}{iz}. &#92;]</span>
The integral becomes <span>&#92;( \oint&#95;{|z|=1} (\cdots)\, dz &#92;)</span>, evaluated by the Residue Theorem.
</div>

## 9.4 Argument Principle and Rouché's Theorem

<div class="theorem" markdown="1">
**Theorem 9.4.1 (Argument Principle).** Let <span>&#92;( f &#92;)</span> be meromorphic on a domain containing a simple closed curve <span>&#92;( \gamma &#92;)</span> and its interior, with no zeros or poles on <span>&#92;( \gamma &#92;)</span>. Then
<span>&#92;[ \frac{1}{2\pi i}\oint&#95;\gamma \frac{f'(z)}{f(z)}\, dz = Z - P &#92;]</span>
where <span>&#92;( Z &#92;)</span> = number of zeros (counted with multiplicity) and <span>&#92;( P &#92;)</span> = number of poles (counted with order) inside <span>&#92;( \gamma &#92;)</span>. The left side equals the winding number <span>&#92;( n(f\circ\gamma, 0) &#92;)</span>.
</div>

<div class="proof" markdown="1">
*Proof.* Near a zero of order <span>&#92;( m &#92;)</span>, <span>&#92;( f(z) = (z-z&#95;0)^m g(z) &#92;)</span> with <span>&#92;( g(z&#95;0) \neq 0 &#92;)</span>, so <span>&#92;( f'/f &#92;)</span> has a simple pole with residue <span>&#92;( m &#92;)</span>. Near a pole of order <span>&#92;( p &#92;)</span>, <span>&#92;( f(z) = (z-z&#95;0)^{-p}h(z) &#92;)</span> with <span>&#92;( h(z&#95;0) \neq 0 &#92;)</span>, so <span>&#92;( f'/f &#92;)</span> has a simple pole with residue <span>&#92;( -p &#92;)</span>. The Residue Theorem gives the result. <span>&#92;( \square &#92;)</span>
</div>

<div class="theorem" markdown="1">
**Theorem 9.4.2 (Rouché's Theorem).** Let <span>&#92;( f, g &#92;)</span> be analytic inside and on a simple closed curve <span>&#92;( \gamma &#92;)</span>. If <span>&#92;( |f(z) - g(z)| < |f(z)| &#92;)</span> for all <span>&#92;( z \in \gamma &#92;)</span>, then <span>&#92;( f &#92;)</span> and <span>&#92;( g &#92;)</span> have the same number of zeros inside <span>&#92;( \gamma &#92;)</span> (counted with multiplicity).
</div>

<div class="example" markdown="1">
**Example 9.4.3.** Show all roots of <span>&#92;( z^7 - 4z^3 + z - 1 = 0 &#92;)</span> lie in <span>&#92;( D(0,2) &#92;)</span>.

Let <span>&#92;( f(z) = -4z^3 &#92;)</span> and <span>&#92;( g(z) = z^7 - 4z^3 + z - 1 &#92;)</span>. On <span>&#92;( |z| = 2 &#92;)</span>:
<span>&#92;[ |f(z) - g(z)| = |z^7 + z - 1| \leq 128 + 2 + 1 = 131, \quad |f(z)| = 4\cdot 8 = 32. &#92;]</span>
Hmm, this fails. Alternatively, let <span>&#92;( f(z) = z^7 &#92;)</span>:
<span>&#92;[ |g(z) - f(z)| = |{-4z^3 + z - 1}| \leq 4\cdot 8 + 2 + 1 = 35 < 128 = |f(z)| \text{ on } |z|=2. &#92;]</span>
So <span>&#92;( g &#92;)</span> has 7 zeros in <span>&#92;( D(0,2) &#92;)</span> = all of them.
</div>

# Chapter 10: Conformal Mappings

## 10.1 Conformal Maps

<div class="definition" markdown="1">
**Definition 10.1.1 (Conformal Map).** An analytic function <span>&#92;( f &#92;)</span> is *conformal* at <span>&#92;( z&#95;0 &#92;)</span> if <span>&#92;( f'(z&#95;0) \neq 0 &#92;)</span>. A conformal map preserves angles between curves at <span>&#92;( z&#95;0 &#92;)</span> (both magnitude and orientation). A *conformal bijection* is an analytic bijection <span>&#92;( f: D \to D' &#92;)</span> whose inverse is also analytic (i.e., a *biholomorphism*).
</div>

<div class="theorem" markdown="1">
**Theorem 10.1.2 (Open Mapping Theorem).** A non-constant analytic function on a domain <span>&#92;( D &#92;)</span> maps open sets to open sets.
</div>

<div class="proof" markdown="1">
*Proof.* For any <span>&#92;( w&#95;0 = f(z&#95;0) &#92;)</span>, write <span>&#92;( f(z) - w&#95;0 = (z-z&#95;0)^m g(z) &#92;)</span> with <span>&#92;( g(z&#95;0) \neq 0 &#92;)</span>. For <span>&#92;( |w - w&#95;0| &#92;)</span> sufficiently small, apply Rouché to <span>&#92;( f(z) - w&#95;0 &#92;)</span> and <span>&#92;( f(z) - w &#92;)</span> on a circle <span>&#92;( |z - z&#95;0| = \delta &#92;)</span> to show <span>&#92;( f(z) = w &#92;)</span> has exactly <span>&#92;( m &#92;)</span> solutions near <span>&#92;( z&#95;0 &#92;)</span>. Thus every <span>&#92;( w &#92;)</span> near <span>&#92;( w&#95;0 &#92;)</span> is in the image of a neighborhood of <span>&#92;( z&#95;0 &#92;)</span>. <span>&#92;( \square &#92;)</span>
</div>

<div class="corollary" markdown="1">
**Corollary 10.1.3 (Maximum Modulus Principle).** If <span>&#92;( f &#92;)</span> is analytic on a domain <span>&#92;( D &#92;)</span> and <span>&#92;( |f| &#92;)</span> attains a local maximum, then <span>&#92;( f &#92;)</span> is constant. If <span>&#92;( D &#92;)</span> is bounded and <span>&#92;( f &#92;)</span> extends continuously to <span>&#92;( \partial D &#92;)</span>, then <span>&#92;( \max&#95;{\overline{D}} |f| = \max&#95;{\partial D} |f| &#92;)</span>.
</div>

## 10.2 Elementary Mappings

<div class="proposition" markdown="1">
**Proposition 10.2.1 (Elementary Conformal Maps).**
- *Translations*: <span>&#92;( z \mapsto z + b &#92;)</span> — maps discs to discs.
- *Rotations*: <span>&#92;( z \mapsto e^{i\theta}z &#92;)</span> — rotates by angle <span>&#92;( \theta &#92;)</span>.
- *Magnifications*: <span>&#92;( z \mapsto rz &#92;)</span> (<span>&#92;( r > 0 &#92;)</span>) — scales by <span>&#92;( r &#92;)</span>.
- *Inversion*: <span>&#92;( z \mapsto 1/z &#92;)</span> — maps circles and lines to circles and lines.
- *Power maps*: <span>&#92;( z \mapsto z^n &#92;)</span> — <span>&#92;( n &#92;)</span>-to-1 cover.
- *Joukowski*: <span>&#92;( z \mapsto z + 1/z &#92;)</span> — maps unit circle to segment <span>&#92;( [-2, 2] &#92;)</span>.
</div>

## 10.3 Möbius Transformations

<div class="definition" markdown="1">
**Definition 10.3.1 (Möbius Transformation / LFT).** A *Möbius transformation* is
<span>&#92;[ T(z) = \frac{az + b}{cz + d}, \quad ad - bc \neq 0. &#92;]</span>
These are conformal bijections of the Riemann sphere <span>&#92;( \hat{\mathbb{C}} = \mathbb{C} \cup \{\infty\} &#92;)</span> (with <span>&#92;( T(\infty) = a/c &#92;)</span> if <span>&#92;( c \neq 0 &#92;)</span> and <span>&#92;( T(-d/c) = \infty &#92;)</span>).
</div>

<div class="proposition" markdown="1">
**Proposition 10.3.2 (Properties of Möbius Transformations).**
1. The Möbius transformations form a group under composition, isomorphic to <span>&#92;( PGL(2,\mathbb{C}) &#92;)</span>.
2. Every LFT is a composition of translations, dilations, and the inversion <span>&#92;( z \mapsto 1/z &#92;)</span>.
3. LFTs map *circles and lines* to circles and lines (viewing lines as circles through <span>&#92;( \infty &#92;)</span>).
4. An LFT is determined by specifying its values at three distinct points.
5. LFTs preserve the *cross-ratio*: <span>&#92;( (z&#95;1, z&#95;2; z&#95;3, z&#95;4) = \frac{(z&#95;1-z&#95;3)(z&#95;2-z&#95;4)}{(z&#95;1-z&#95;4)(z&#95;2-z&#95;3)} &#92;)</span>.
</div>

<div class="example" markdown="1">
**Example 10.3.3 (Upper Half-Plane to Disc).** The LFT
<span>&#92;[ f(z) = \frac{z - i}{z + i} &#92;]</span>
maps the upper half-plane <span>&#92;( \{z: \operatorname{Im}(z) > 0\} &#92;)</span> conformally onto the unit disc <span>&#92;( \mathbb{D} &#92;)</span>, with <span>&#92;( f(i) = 0 &#92;)</span> and <span>&#92;( f(\mathbb{R}) = \partial\mathbb{D} &#92;)</span>.
</div>

<div class="example" markdown="1">
**Example 10.3.4 (Disc Automorphisms).** Every conformal bijection of <span>&#92;( \mathbb{D} &#92;)</span> onto itself is
<span>&#92;[ f(z) = e^{i\theta}\frac{z - a}{1 - \bar{a}z}, \quad a \in \mathbb{D},\; \theta \in \mathbb{R}. &#92;]</span>
</div>

## 10.4 The Riemann Mapping Theorem

<div class="theorem" markdown="1">
**Theorem 10.4.1 (Riemann Mapping Theorem).** Let <span>&#92;( D \subsetneq \mathbb{C} &#92;)</span> be a simply connected domain. Then there exists a conformal bijection <span>&#92;( f: D \xrightarrow{\sim} \mathbb{D} &#92;)</span>. Moreover, fixing any <span>&#92;( z&#95;0 \in D &#92;)</span>, there is a unique such <span>&#92;( f &#92;)</span> with <span>&#92;( f(z&#95;0) = 0 &#92;)</span> and <span>&#92;( f'(z&#95;0) > 0 &#92;)</span>.
</div>

<div class="note" markdown="1">
**Note.** The proof is non-constructive, using a normal families argument (Montel's theorem). The theorem says every non-trivial simply connected domain is conformally equivalent to the disc — a remarkable rigidity result. The theorem fails for <span>&#92;( D = \mathbb{C} &#92;)</span> itself (by Liouville's theorem, no bounded entire bijection exists).
</div>

## 10.5 The Dirichlet Problem

<div class="definition" markdown="1">
**Definition 10.5.1 (Dirichlet Problem).** Given a domain <span>&#92;( D &#92;)</span> and continuous boundary data <span>&#92;( h: \partial D \to \mathbb{R} &#92;)</span>, find a function <span>&#92;( u: \overline{D} \to \mathbb{R} &#92;)</span> harmonic on <span>&#92;( D &#92;)</span> and continuous on <span>&#92;( \overline{D} &#92;)</span> with <span>&#92;( u|&#95;{\partial D} = h &#92;)</span>.
</div>

<div class="proposition" markdown="1">
**Proposition 10.5.2 (Solution via Conformal Mapping).** For a simply connected domain <span>&#92;( D &#92;)</span>:
1. Map <span>&#92;( D &#92;)</span> conformally to <span>&#92;( \mathbb{D} &#92;)</span> via <span>&#92;( \phi: D \to \mathbb{D} &#92;)</span>.
2. Transport boundary data: <span>&#92;( \tilde{h} = h \circ \phi^{-1} &#92;)</span>.
3. Solve on the disc using the Poisson integral: <span>&#92;( \tilde{u}(re^{i\theta}) = \frac{1}{2\pi}\int&#95;0^{2\pi}\frac{1-r^2}{1-2r\cos(\theta-t)+r^2}\tilde{h}(e^{it})\, dt &#92;)</span>.
4. Pull back: <span>&#92;( u = \tilde{u} \circ \phi &#92;)</span>.
Since harmonic functions compose with conformal maps (on the source side), <span>&#92;( u &#92;)</span> is harmonic on <span>&#92;( D &#92;)</span>.
</div>

# Chapter 11: Analytic Continuation

## 11.1 Direct Analytic Continuation

<div class="definition" markdown="1">
**Definition 11.1.1 (Direct Analytic Continuation).** Let <span>&#92;( f&#95;1 &#92;)</span> be analytic on a domain <span>&#92;( D&#95;1 &#92;)</span>. A *direct analytic continuation* of <span>&#92;( (f&#95;1, D&#95;1) &#92;)</span> to a domain <span>&#92;( D&#95;2 &#92;)</span> (with <span>&#92;( D&#95;1 \cap D&#95;2 &#92;)</span> nonempty and connected) is a function <span>&#92;( f&#95;2 &#92;)</span> analytic on <span>&#92;( D&#95;2 &#92;)</span> with <span>&#92;( f&#95;1 = f&#95;2 &#92;)</span> on <span>&#92;( D&#95;1 \cap D&#95;2 &#92;)</span>. By the Identity Theorem, the continuation is unique.
</div>

<div class="proposition" markdown="1">
**Proposition 11.1.2 (Weierstrass Method).** A *chain of continuations* along a path <span>&#92;( \gamma &#92;)</span> from <span>&#92;( z&#95;0 &#92;)</span> to <span>&#92;( z&#95;1 &#92;)</span> is a finite sequence of discs <span>&#92;( D&#95;0, D&#95;1, \ldots, D&#95;n &#92;)</span> with centres on <span>&#92;( \gamma &#92;)</span> and analytic functions <span>&#92;( f&#95;k: D&#95;k \to \mathbb{C} &#92;)</span> such that <span>&#92;( f&#95;k = f&#95;{k+1} &#92;)</span> on <span>&#92;( D&#95;k \cap D&#95;{k+1} \neq \emptyset &#92;)</span> for each <span>&#92;( k &#92;)</span>. By uniqueness, the final element <span>&#92;( f&#95;n &#92;)</span> depends only on the homotopy class of <span>&#92;( \gamma &#92;)</span> in the domain of definition.
</div>

<div class="example" markdown="1">
**Example 11.1.3.** The power series <span>&#92;( f(z) = \sum&#95;{n=0}^\infty z^n &#92;)</span> converges on <span>&#92;( D(0,1) &#92;)</span> to <span>&#92;( 1/(1-z) &#92;)</span>. The function <span>&#92;( 1/(1-z) &#92;)</span> is the unique analytic continuation of <span>&#92;( f &#92;)</span> to <span>&#92;( \mathbb{C}\setminus\{1\} &#92;)</span>. The singularity at <span>&#92;( z = 1 &#92;)</span> is a *natural boundary point*: the original series cannot be continued across it.
</div>

## 11.2 Monodromy Theorem

<div class="theorem" markdown="1">
**Theorem 11.2.1 (Monodromy Theorem).** Let <span>&#92;( D &#92;)</span> be a simply connected domain and let <span>&#92;( f &#92;)</span> be analytic near some <span>&#92;( z&#95;0 \in D &#92;)</span>. If <span>&#92;( f &#92;)</span> can be analytically continued along every path in <span>&#92;( D &#92;)</span> starting at <span>&#92;( z&#95;0 &#92;)</span>, then these continuations define a single-valued analytic function on all of <span>&#92;( D &#92;)</span>.
</div>

<div class="proof" markdown="1">
*Proof (sketch).* Since <span>&#92;( D &#92;)</span> is simply connected, any two paths from <span>&#92;( z&#95;0 &#92;)</span> to <span>&#92;( z&#95;1 &#92;)</span> in <span>&#92;( D &#92;)</span> are homotopic. A continuity argument (using compactness of the homotopy <span>&#92;( H: [0,1]^2 \to D &#92;)</span>) shows the analytic continuation along homotopic paths gives the same result. Hence the value at <span>&#92;( z&#95;1 &#92;)</span> is well-defined, yielding a global single-valued function. <span>&#92;( \square &#92;)</span>
</div>

<div class="corollary" markdown="1">
**Corollary 11.2.2.** The complex logarithm <span>&#92;( \log z &#92;)</span> cannot be analytically continued to a single-valued function on all of <span>&#92;( \mathbb{C}^&#42; &#92;)</span>, because <span>&#92;( \mathbb{C}^&#42; &#92;)</span> is not simply connected: continuation around a loop encircling 0 changes the value by <span>&#92;( 2\pi i &#92;)</span>. On any simply connected subdomain of <span>&#92;( \mathbb{C}^&#42; &#92;)</span>, however, a single-valued branch exists (by the Poincaré Lemma).
</div>

## 11.3 Riemann Surfaces

<div class="definition" markdown="1">
**Definition 11.3.1 (Riemann Surface of <span>&#92;( \log z &#92;)</span>).** Since <span>&#92;( \log z &#92;)</span> is multi-valued on <span>&#92;( \mathbb{C}^&#42; &#92;)</span>, we construct its *Riemann surface* <span>&#92;( \mathcal{R} &#92;)</span> as an infinitely-sheeted cover:
- Take countably many copies <span>&#92;( S&#95;k &#92;)</span> (<span>&#92;( k \in \mathbb{Z} &#92;)</span>) of <span>&#92;( \mathbb{C}^&#42; &#92;)</span>, each slit along <span>&#92;( (-\infty, 0) &#92;)</span>.
- Glue the upper edge of the slit in <span>&#92;( S&#95;k &#92;)</span> to the lower edge of the slit in <span>&#92;( S&#95;{k+1} &#92;)</span>.
- On the resulting surface, define <span>&#92;( \log z = \ln|z| + i\theta &#92;)</span> where <span>&#92;( \theta \in (2\pi k - \pi, 2\pi k + \pi) &#92;)</span> on sheet <span>&#92;( S&#95;k &#92;)</span>. This is a single-valued analytic function on <span>&#92;( \mathcal{R} &#92;)</span>.
</div>

<div class="note" markdown="1">
**Note.** More generally, for algebraic functions <span>&#92;( w &#92;)</span> satisfying <span>&#92;( P(z, w) = 0 &#92;)</span> (a polynomial relation), one constructs a compact Riemann surface on which <span>&#92;( w &#92;)</span> becomes single-valued. The theory of Riemann surfaces connects complex analysis to topology (via genus and Euler characteristic) and algebraic geometry.
</div>
