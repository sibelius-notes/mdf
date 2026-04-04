---
title: "PMATH 352: Complex Analysis"
prof: "Ruxandra Moraru"
subjects: "PMATH"
---

# Chapter 1: Plane Calculus

## 1.1 Introduction

Complex analysis studies functions \( f: D \subseteq \mathbb{C} \to \mathbb{C} \). The subject combines real analysis in the plane with the algebraic structure of \( \mathbb{C} \), yielding results far more rigid than their real counterparts: differentiable complex functions are automatically infinitely differentiable, analytic, and satisfy beautiful integral formulas. We begin by developing the necessary plane calculus.

## 1.2 Topology of the Plane

Before we can speak about complex functions, limits, or differentiability, we need a precise language for describing subsets of \( \mathbb{C} \). The following definitions build up the topological vocabulary — open sets, boundary, and connectedness — that will appear throughout the course. The key notion to keep in mind is that of a *domain*: a connected open set is the natural setting for doing analysis.

<div class="definition" markdown="1">
<strong>Definition 1.2.1 (Open Disc).</strong> For \( z_0 \in \mathbb{C} \) and \( r > 0 \), the <em>open disc</em> of radius \( r \) centred at \( z_0 \) is
\[ D(z_0, r) = \{ z \in \mathbb{C} : |z - z_0| < r \}. \]
The <em>closed disc</em> is \( \overline{D}(z_0, r) = \{ z : |z - z_0| \leq r \} \).
</div>

The open disc is the basic building block of the topology on \( \mathbb{C} \). A set is open precisely when every point has some disc around it that stays inside the set.

<div class="definition" markdown="1">
<strong>Definition 1.2.2 (Interior Point, Open Set).</strong> A point \( z_0 \in S \subseteq \mathbb{C} \) is an <em>interior point</em> of \( S \) if there exists \( r > 0 \) with \( D(z_0, r) \subseteq S \). The set \( S \) is <em>open</em> if every point is an interior point.
</div>

<div class="definition" markdown="1">
<strong>Definition 1.2.3 (Closed Set, Boundary).</strong> A set \( S \) is <em>closed</em> if \( \mathbb{C} \setminus S \) is open. A point \( z_0 \) is a <em>boundary point</em> of \( S \) if every disc \( D(z_0, r) \) meets both \( S \) and \( \mathbb{C} \setminus S \). The boundary \( \partial S \) is the set of all boundary points.
</div>

Connectedness captures the idea that a set cannot be split into two separate pieces. For the purposes of complex analysis, working on a domain — a connected open set — ensures that a function defined locally near one point can, in principle, be extended to the entire region without ambiguity.

<div class="definition" markdown="1">
<strong>Definition 1.2.4 (Connected Set, Domain).</strong> A set \( S \subseteq \mathbb{C} \) is <em>connected</em> if it cannot be written as a union of two disjoint nonempty open subsets. A <em>domain</em> is a connected open subset of \( \mathbb{C} \). A domain is <em>simply connected</em> if it has no holes (every closed curve in the domain is contractible to a point within it).
</div>

Simple connectivity is more subtle: it rules out domains with "holes," like a punctured disc or an annulus. This distinction turns out to be decisive for complex integration — Cauchy's theorem holds on simply connected domains precisely because there are no holes for residues to hide in.

## 1.3 Parametrized Curves

With the notion of a domain in hand, we can now make precise what it means for a curve to lie within it. Curves are the paths along which we will integrate complex functions, so we need careful definitions of smoothness and length. The Jordan Curve Theorem, stated below, is a fundamental geometric fact: a simple closed curve divides the plane into exactly an inside and an outside.

<div class="definition" markdown="1">
<strong>Definition 1.3.1 (Parametrized Curve).</strong> A <em>parametrized curve</em> is a continuous map \( \gamma: [a,b] \to \mathbb{C} \). Writing \( \gamma(t) = x(t) + iy(t) \), the curve is <em>smooth</em> if \( x'(t), y'(t) \) exist, are continuous, and \( \gamma'(t) = x'(t) + iy'(t) \neq 0 \) for all \( t \). It is <em>piecewise smooth</em> if \( [a,b] \) can be subdivided into finitely many subintervals on each of which it is smooth.
</div>

<div class="definition" markdown="1">
<strong>Definition 1.3.2 (Closed and Jordan Curves).</strong> A curve is <em>closed</em> if \( \gamma(a) = \gamma(b) \). A <em>Jordan curve</em> (simple closed curve) is a closed curve injective on \( [a,b) \). The <em>Jordan Curve Theorem</em> states that a Jordan curve divides \( \mathbb{C} \) into exactly two regions (the interior and exterior), and the interior is a simply connected domain.
</div>

The non-self-intersection condition in the Jordan Curve Theorem is essential: it guarantees a well-defined "inside." Once we have a Jordan domain, Green's theorem applies, giving the first connection between line integrals around the boundary and double integrals over the interior.

<div class="definition" markdown="1">
<strong>Definition 1.3.3 (Arclength).</strong> The <em>arclength</em> of a piecewise smooth curve \( \gamma \) is
\[ \ell(\gamma) = \int_a^b |\gamma'(t)|\, dt = \int_a^b \sqrt{x'(t)^2 + y'(t)^2}\, dt. \]
</div>

<div class="definition" markdown="1">
<strong>Definition 1.3.4 (Jordan Domain).</strong> A <em>Jordan domain</em> is a bounded connected open set \( \Omega \subseteq \mathbb{C} \) whose boundary \( \partial\Omega \) is a Jordan curve.
</div>

## 1.4 Line Integrals

Line integrals allow us to integrate a vector field along a curve, measuring the total work done as we traverse the path. Their basic properties — linearity, orientation reversal, and concatenation — are the same as in multivariable calculus. The key additional fact, independence of path for gradient fields, previews the role that antiderivatives will play in complex integration.

<div class="definition" markdown="1">
<strong>Definition 1.4.1 (Line Integral of a Vector Field).</strong> Let \( \mathbf{F} = (P, Q) \) be a continuous vector field on a domain \( D \) and \( \gamma: [a,b] \to D \) a piecewise smooth curve. The <em>line integral</em> of \( \mathbf{F} \) along \( \gamma \) is
\[ \int_\gamma \mathbf{F} \cdot d\mathbf{s} = \int_\gamma P\, dx + Q\, dy = \int_a^b \bigl[P(\gamma(t)) x'(t) + Q(\gamma(t)) y'(t)\bigr]\, dt. \]
</div>

<div class="proposition" markdown="1">
<strong>Proposition 1.4.2 (Properties of Line Integrals).</strong> For piecewise smooth curves:
1. <em>Linearity</em> in \( \mathbf{F} \).
2. <em>Reverse orientation</em>: \( \int_{-\gamma} \mathbf{F}\cdot d\mathbf{s} = -\int_\gamma \mathbf{F}\cdot d\mathbf{s} \).
3. <em>Concatenation</em>: \( \int_{\gamma_1 + \gamma_2} = \int_{\gamma_1} + \int_{\gamma_2} \).
4. <em>Reparametrization invariance</em>: the value is unchanged under orientation-preserving reparametrization.
</div>

<div class="theorem" markdown="1">
<strong>Theorem 1.4.3 (Independence of Path / Fundamental Theorem).</strong> If \( \mathbf{F} = \nabla u \) is a gradient vector field on a domain \( D \), then for any piecewise smooth curve \( \gamma \) in \( D \) from \( z_0 \) to \( z_1 \),
\[ \int_\gamma \mathbf{F} \cdot d\mathbf{s} = u(z_1) - u(z_0). \]
In particular, the integral around any closed curve is zero.
</div>

## 1.5 Green's Theorem

Green's theorem is the engine that drives the early results of complex analysis. It converts a line integral around a boundary into a double integral over the enclosed region, a trade that will prove extremely powerful when the integrand satisfies additional constraints (like the Cauchy–Riemann equations).

<div class="theorem" markdown="1">
<strong>Theorem 1.5.1 (Green's Theorem).</strong> Let \( \Omega \) be a Jordan domain with piecewise smooth boundary \( \partial\Omega \) oriented counterclockwise. If \( P, Q \in C^1(\overline{\Omega}) \), then
\[ \oint_{\partial\Omega} P\, dx + Q\, dy = \iint_\Omega \left(\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y}\right) dA. \]
</div>

<div class="corollary" markdown="1">
<strong>Corollary 1.5.2 (Area Formula).</strong> \( \text{Area}(\Omega) = \dfrac{1}{2} \oint_{\partial\Omega} x\, dy - y\, dx. \]
</div>

<div class="proposition" markdown="1">
<strong>Proposition 1.5.3 (Bump Principle).</strong> Let \( \mathbf{F} = (P,Q) \in C^1(D) \). Then \( \mathbf{F} \) is irrotational (\( Q_x = P_y \) on \( D \) if and only if \( \int_\gamma \mathbf{F}\cdot d\mathbf{s} = 0 \) for every piecewise smooth closed curve \( \gamma \) in \( D \).
</div>

The Bump Principle is really a prototype of Cauchy's theorem: it says that an irrotational field (one satisfying a first-order PDE condition) integrates to zero around every closed loop. When we reach Chapter 6, the Cauchy–Riemann equations will play the role of the irrotationality condition for complex-valued functions.

# Chapter 2: Harmonic Functions

Harmonic functions — solutions to Laplace's equation \( \Delta u = 0 \) — appear naturally as the real and imaginary parts of analytic functions. This chapter develops their theory independently, using only real analysis and Green's theorem. The main results (mean value property, maximum principle, Harnack's inequality, Liouville) will later have exact analogues in the complex setting, and the proofs in that setting will follow the same architecture as here.

## 2.1 Definition and Examples

<div class="definition" markdown="1">
<strong>Definition 2.1.1 (Harmonic Function).</strong> A function \( u: D \to \mathbb{R} \) of class \( C^2 \) on a domain \( D \subseteq \mathbb{R}^2 \) is <em>harmonic</em> if
\[ \Delta u = \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} = 0. \]
</div>

<div class="example" markdown="1">
<strong>Example 2.1.2.</strong>
- \( u = x^2 - y^2 \): \( \Delta u = 2 - 2 = 0 \). Harmonic.
- \( u = e^x \cos y \): \( u_{xx} = e^x\cos y \), \( u_{yy} = -e^x\cos y \), so \( \Delta u = 0 \). Harmonic.
- \( u = x^2 + y^2 \): \( \Delta u = 4 \neq 0 \). Not harmonic.
- Any real or imaginary part of an analytic function (with \( C^2 \) components) is harmonic.
</div>

## 2.2 The Inside-Outside Theorem

The Inside-Outside Theorem (also known as Gauss's divergence theorem in two dimensions) relates the normal derivative of \( u \) on the boundary of a region to the Laplacian of \( u \) in the interior. For a harmonic function, the Laplacian vanishes, so the total outward flux through any closed curve is exactly zero.

<div class="theorem" markdown="1">
<strong>Theorem 2.2.1 (Inside-Outside Theorem).</strong> Let \( \Omega \) be a Jordan domain with piecewise smooth boundary, and let \( u \in C^2(\overline{\Omega}) \). Then
\[ \oint_{\partial\Omega} \frac{\partial u}{\partial \mathbf{n}}\, ds = \iint_\Omega \Delta u\, dA, \]
where \( \mathbf{n} \) is the outward unit normal and \( \frac{\partial u}{\partial \mathbf{n}} = \nabla u \cdot \mathbf{n} \) is the normal derivative.
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Apply Green's theorem with \( P = -u_y \) and \( Q = u_x \). Then \( Q_x - P_y = u_{xx} + u_{yy} = \Delta u \). The line integral \( \oint (-u_y\, dx + u_x\, dy) \) equals \( \oint \nabla u \cdot \mathbf{n}\, ds = \oint \frac{\partial u}{\partial \mathbf{n}}\, ds \). \( \square \)
</div>

<div class="corollary" markdown="1">
<strong>Corollary 2.2.2.</strong> If \( u \) is harmonic on \( \overline{\Omega} \), then \( \oint_{\partial\Omega} \frac{\partial u}{\partial \mathbf{n}}\, ds = 0 \).
</div>

## 2.3 Mean Value Theorems

The mean value property is perhaps the most characteristic feature of harmonic functions, and later of analytic functions. It says that the value at a point is completely determined by the average on any surrounding circle — the function cannot have "local surprises." This rigidity is what makes the maximum principle possible.

<div class="definition" markdown="1">
<strong>Definition 2.3.1 (Scalar Line Integral).</strong> For a continuous function \( f \) and piecewise smooth curve \( \gamma: [a,b] \to \mathbb{C} \),
\[ \int_\gamma f\, ds = \int_a^b f(\gamma(t)) |\gamma'(t)|\, dt. \]
</div>

<div class="theorem" markdown="1">
<strong>Theorem 2.3.2 (Circumferential Mean Value Theorem).</strong> Let \( u \) be harmonic on a domain \( D \) and suppose \( \overline{D}(z_0, r) \subseteq D \). Then
\[ u(z_0) = \frac{1}{2\pi} \int_0^{2\pi} u(z_0 + re^{i\theta})\, d\theta. \]
That is, the value at the centre equals the average value on any circle.
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Define \( \varphi(\rho) = \frac{1}{2\pi}\int_0^{2\pi} u(z_0 + \rho e^{i\theta})\, d\theta \) for \( 0 \leq \rho \leq r \). Differentiating under the integral sign:
\[ \varphi'(\rho) = \frac{1}{2\pi}\int_0^{2\pi} \nabla u(z_0 + \rho e^{i\theta}) \cdot e^{i\theta}\, d\theta = \frac{1}{2\pi\rho} \oint_{C_\rho} \frac{\partial u}{\partial \mathbf{n}}\, ds = \frac{1}{2\pi\rho}\iint_{D(z_0,\rho)} \Delta u\, dA = 0. \]
So \( \varphi \) is constant. Since \( \lim_{\rho \to 0} \varphi(\rho) = u(z_0) \) by continuity, we have \( \varphi(\rho) = u(z_0) \) for all \( \rho \). \( \square \)
</div>

<div class="theorem" markdown="1">
<strong>Theorem 2.3.3 (Solid Mean Value Theorem).</strong> Under the same hypotheses,
\[ u(z_0) = \frac{1}{\pi r^2} \iint_{D(z_0,r)} u\, dA. \]
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Integrate the Circumferential MVT over \( \rho \in [0, r] \): multiply both sides by \( 2\pi\rho \) and integrate:
\[ \int_0^r u(z_0) \cdot 2\pi\rho\, d\rho = \int_0^r \int_0^{2\pi} u(z_0 + \rho e^{i\theta})\rho\, d\theta\, d\rho. \]
Left side: \( u(z_0) \cdot \pi r^2 \). Right side: \( \iint_{D(z_0,r)} u\, dA \) in polar coordinates. Divide by \( \pi r^2 \). \( \square \)
</div>

## 2.4 Maximum Principle

The maximum principle is a striking rigidity result: a non-constant harmonic function cannot achieve its maximum value at an interior point. Geometrically, this means the "surface" \( z = u(x,y) \) has no interior peaks or valleys — it is shaped like a stretched membrane with no slack spots. In practice, it gives powerful uniqueness results for boundary value problems.

<div class="theorem" markdown="1">
<strong>Theorem 2.4.1 (Maximum Principle for Harmonic Functions).</strong> Let \( u \) be harmonic on a domain \( D \).
1. <em>(Local version)</em> If \( u \) attains a local maximum or minimum at any interior point, then \( u \) is constant on \( D \).
2. <em>(Global version)</em> If \( D \) is bounded and \( u \) extends continuously to \( \partial D \), then
\[ \max_{\overline{D}} u = \max_{\partial D} u \quad \text{and} \quad \min_{\overline{D}} u = \min_{\partial D} u. \]
</div>

<div class="proof" markdown="1">
<em>Proof of (1).</em> Suppose \( u(z_0) = M \) is a local maximum. The Circumferential MVT gives \( M = \frac{1}{2\pi}\int_0^{2\pi} u(z_0 + re^{i\theta})\, d\theta \) for small \( r \). Since \( u \leq M \) near \( z_0 \) and the average equals \( M \), we must have \( u = M \) on \( D(z_0, r) \). A connectedness argument extends this to all of \( D \). \( \square \)
</div>

## 2.5 Harnack's Inequality

While the maximum principle controls when a harmonic function is constant, Harnack's inequality gives quantitative control: it bounds how much a non-negative harmonic function can vary within a disc in terms of its value at the centre. The two-sided estimate shows that values on a concentric circle are confined to a multiplicative window that shrinks to \( \{u(z_0)\} \) as the radius of the circle shrinks to zero.

<div class="theorem" markdown="1">
<strong>Theorem 2.5.1 (Harnack's Inequality).</strong> Let \( u \) be harmonic and non-negative on \( D(z_0, R) \). For any \( z \) with \( |z - z_0| = r < R \),
\[ \frac{R-r}{R+r} u(z_0) \leq u(z) \leq \frac{R+r}{R-r} u(z_0). \]
</div>

<div class="proof" markdown="1">
<em>Proof.</em> By the Circumferential MVT and the Poisson formula (or direct estimation from the MVT):
\[ u(z) = \frac{1}{2\pi}\int_0^{2\pi} \frac{R^2 - r^2}{R^2 - 2Rr\cos(\theta - \phi) + r^2} u(z_0 + Re^{i\theta})\, d\theta. \]
Since \( \frac{R-r}{R+r} \leq \frac{R^2 - r^2}{R^2 - 2Rr\cos\alpha + r^2} \leq \frac{R+r}{R-r} \) and the MVT gives \( u(z_0) = \frac{1}{2\pi}\int_0^{2\pi} u(z_0 + Re^{i\theta})\, d\theta \), the result follows. \( \square \)
</div>

## 2.6 Liouville's Theorem for Harmonic Functions

As a first glimpse of the theme that will pervade the course, Harnack's inequality implies that bounded harmonic functions on the entire plane must be constant. This is the harmonic analogue of Liouville's theorem for analytic functions, which we will prove more elegantly in Chapter 6 using the Cauchy integral formula.

<div class="theorem" markdown="1">
<strong>Theorem 2.6.1 (Liouville for Harmonic Functions).</strong> If \( u: \mathbb{R}^2 \to \mathbb{R} \) is harmonic and bounded, then \( u \) is constant.
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Fix any two points \( z_1, z_2 \). For large \( R \), both lie in \( D(0, R/2) \). Apply Harnack's inequality with centre \( z_1 \) and radius \( R \). The bound \( |u| \leq M \) and \( \frac{R-r}{R+r} \to 1 \) as \( R \to \infty \) force \( u(z_1) = u(z_2) \). \( \square \)
</div>

# Chapter 3: Complex Numbers and Functions

The machinery of Chapters 1 and 2 was entirely real. We now introduce the algebraic and geometric structure of \( \mathbb{C} \) itself. The key innovation is that \( \mathbb{C} \) is not just \( \mathbb{R}^2 \) as a vector space — it is a field, with a multiplication that encodes both scaling and rotation simultaneously. This extra structure is what makes complex differentiability so much more powerful than differentiability of maps \( \mathbb{R}^2 \to \mathbb{R}^2 \).

## 3.1 The Complex Field

<div class="definition" markdown="1">
<strong>Definition 3.1.1 (Complex Numbers).</strong> The <em>complex numbers</em> \( \mathbb{C} \) are pairs \( (x, y) \in \mathbb{R}^2 \) with componentwise addition and multiplication defined by
\[ (x_1, y_1)(x_2, y_2) = (x_1 x_2 - y_1 y_2,\; x_1 y_2 + x_2 y_1). \]
Writing \( z = x + iy \) with \( i = (0,1) \), we have \( i^2 = -1 \). Complex numbers form a field under these operations.
</div>

<div class="definition" markdown="1">
<strong>Definition 3.1.2 (Modulus, Argument, Conjugate).</strong> For \( z = x + iy \):
- <em>Real and imaginary parts</em>: \( \operatorname{Re}(z) = x \), \( \operatorname{Im}(z) = y \)
- <em>Modulus</em> (absolute value): \( |z| = \sqrt{x^2 + y^2} \)
- <em>Complex conjugate</em>: \( \bar{z} = x - iy \)
- <em>Argument</em>: \( \arg z \) is any \( \theta \in \mathbb{R} \) with \( z = |z|e^{i\theta} = |z|(\cos\theta + i\sin\theta) \)
- <em>Principal argument</em>: \( \operatorname{Arg}(z) \in (-\pi, \pi] \) (unique)
</div>

The polar form \( z = re^{i\theta} \) shows that multiplication in \( \mathbb{C} \) combines magnitudes and adds angles: \( zw = rse^{i(\theta + \phi)} \). This geometric interpretation — multiplication is a simultaneous scaling and rotation — is at the heart of why analytic functions preserve angles (conformality).

![Complex plane: point z=a+bi, modulus |z|, and argument θ](/pics/pmath352/complex-plane.svg)

<div class="proposition" markdown="1">
<strong>Proposition 3.1.3 (Algebraic Properties).</strong> For \( z, w \in \mathbb{C} \):
1. \( z\bar{z} = |z|^2 \), so \( z^{-1} = \bar{z}/|z|^2 \)
2. \( |zw| = |z||w| \), \( \overline{zw} = \bar{z}\bar{w} \)
3. Triangle inequality: \( |z + w| \leq |z| + |w| \)
4. \( \operatorname{Re}(z) = \frac{z + \bar{z}}{2} \), \( \operatorname{Im}(z) = \frac{z - \bar{z}}{2i} \)
5. Polar form: \( z = re^{i\theta} \), \( w = se^{i\phi} \) gives \( zw = rse^{i(\theta+\phi)} \)
6. De Moivre: \( (re^{i\theta})^n = r^n e^{in\theta} \)
</div>

## 3.2 Limits and Continuity

Limits of complex functions reduce to simultaneous limits of the real and imaginary parts. This means all the standard rules from real analysis carry over without change. The important point is that a limit in \( \mathbb{C} \) requires \( z \to z_0 \) from all directions in the plane simultaneously — a much stronger condition than a one-dimensional limit, and the source of the rigidity that characterises complex differentiability.

<div class="definition" markdown="1">
<strong>Definition 3.2.1 (Limit).</strong> For \( f: D \to \mathbb{C} \) and \( z_0 \) a limit point of \( D \), we write \( \lim_{z\to z_0} f(z) = L \) if: for every \( \varepsilon > 0 \) there exists \( \delta > 0 \) such that \( 0 < |z - z_0| < \delta \) implies \( |f(z) - L| < \varepsilon \).
</div>

<div class="proposition" markdown="1">
<strong>Proposition 3.2.2.</strong> Writing \( f = u + iv \) and \( L = a + ib \): \( \lim_{z\to z_0} f(z) = L \) if and only if \( \lim_{(x,y)\to(x_0,y_0)} u = a \) and \( \lim_{(x,y)\to(x_0,y_0)} v = b \). Hence all limit laws from real analysis hold for complex limits.
</div>

## 3.3 The Extended Complex Plane

The complex plane \( \mathbb{C} \) is not compact: sequences can escape to infinity without converging, and a rational function with a pole at \( z_0 \) is simply undefined there. To work globally — to regard a Möbius transformation as a bijection of an entire space, or to say a meromorphic function takes the value \( \infty \) at a pole — one appends a single formal symbol \( \infty \) to obtain the **extended complex plane** \( \hat{\mathbb{C}} = \mathbb{C} \cup \{\infty\} \), also called the **Riemann sphere**. The resulting space is compact, and every meromorphic function becomes a continuous (in fact holomorphic) map \( \hat{\mathbb{C}} \to \hat{\mathbb{C}} \).

<div class="definition" markdown="1">
<strong>Definition 3.3.1 (Extended Complex Plane).</strong> The <em>extended complex plane</em> is \( \hat{\mathbb{C}} = \mathbb{C} \cup \{\infty\} \), where \( \infty \) is a formal symbol. A <em>neighbourhood of \( \infty \)</em> is any set of the form \( \{z \in \mathbb{C} : |z| > R\} \cup \{\infty\} \) for some \( R > 0 \). With this topology, \( \hat{\mathbb{C}} \) is compact — it is the one-point compactification of \( \mathbb{C} \cong \mathbb{R}^2 \).
</div>

The geometric realization of \( \hat{\mathbb{C}} \) is given by **stereographic projection**. Embed \( \mathbb{C} \) as the equatorial plane \( \{(x_1, x_2, 0)\} \subset \mathbb{R}^3 \) and consider the unit sphere \( S^2 = \{x_1^2 + x_2^2 + x_3^2 = 1\} \). Let \( N = (0,0,1) \) be the north pole.

<div class="definition" markdown="1">
<strong>Definition 3.3.2 (Stereographic Projection).</strong> The <em>stereographic projection</em> \( \pi: S^2 \setminus \{N\} \to \mathbb{C} \) maps each point \( (x_1, x_2, x_3) \neq N \) on \( S^2 \) to the intersection of the line through \( N \) and \( (x_1, x_2, x_3) \) with the plane \( x_3 = 0 \):
\[ \pi(x_1, x_2, x_3) = \frac{x_1 + ix_2}{1 - x_3} \in \mathbb{C}. \]
Extending by \( \pi(N) = \infty \) gives a homeomorphism \( S^2 \xrightarrow{\sim} \hat{\mathbb{C}} \). The inverse is
\[ \pi^{-1}(z) = \left(\frac{2\operatorname{Re}z}{1+|z|^2},\; \frac{2\operatorname{Im}z}{1+|z|^2},\; \frac{|z|^2-1}{|z|^2+1}\right). \]
</div>

Stereographic projection is **conformal**: it preserves angles between smooth curves. More strikingly, it maps *circles and lines* in \( \mathbb{C} \) bijectively to *circles on \( S^2 \)* — straight lines correspond to circles through \( N \) (passing through \( \infty \)). This **circles-go-to-circles** property is the geometric content underlying Möbius transformations: viewed as self-maps of \( \hat{\mathbb{C}} \), they correspond under stereographic projection to conformal automorphisms of \( S^2 \), which necessarily send circles to circles.

The **chordal metric** on \( \hat{\mathbb{C}} \) measures the Euclidean distance between the corresponding points on \( S^2 \):
\[ \chi(z,w) = \frac{2|z-w|}{\sqrt{(1+|z|^2)(1+|w|^2)}}, \qquad \chi(z,\infty) = \frac{2}{\sqrt{1+|z|^2}}. \]
This turns \( \hat{\mathbb{C}} \) into a compact metric space, and convergence in \( \chi \) agrees with the topology defined above.

<div class="remark" markdown="1">
<strong>Remark (Meromorphic functions as maps \( \hat{\mathbb{C}} \to \hat{\mathbb{C}} \)).</strong> A meromorphic function \( f \) on a domain \( D \) extends to a continuous map \( D \to \hat{\mathbb{C}} \) by setting \( f(z_0) = \infty \) at each pole. From this viewpoint, poles are not singularities but perfectly well-defined values in \( \hat{\mathbb{C}} \). A non-constant rational function of degree \( d \) is a surjective holomorphic map \( \hat{\mathbb{C}} \to \hat{\mathbb{C}} \) with exactly \( d \) preimages of every point (counted with multiplicity). A function holomorphic on all of \( \hat{\mathbb{C}} \) must be constant — this is Liouville's theorem applied to the compact Riemann surface \( \hat{\mathbb{C}} \).
</div>

<div class="remark" markdown="1">
<strong>Remark (Möbius transformations as automorphisms of \( \hat{\mathbb{C}} \)).</strong> A Möbius transformation \( f(z) = (az+b)/(cz+d) \) with \( ad-bc \neq 0 \) extends to a bijection \( \hat{\mathbb{C}} \to \hat{\mathbb{C}} \) by setting \( f(-d/c) = \infty \) and \( f(\infty) = a/c \) (when \( c \neq 0 \)). The collection of all such extensions forms the group \( \operatorname{PSL}(2,\mathbb{C}) = \operatorname{GL}(2,\mathbb{C})/(\mathbb{C}^\times \cdot I) \), acting on \( \hat{\mathbb{C}} \) by conformal bijections. Every conformal automorphism of \( \hat{\mathbb{C}} \) is of this form — a fact established in §10.3.
</div>

# Chapter 4: Analytic Functions

This chapter is where the subject begins in earnest. The central observation is that requiring a single complex limit to exist — the complex derivative — imposes an extraordinary amount of structure. A function with a complex derivative at every point of a domain is automatically smooth, expressible as a convergent power series, and satisfies the Cauchy integral formula. None of this is true in the real case: a function \( \mathbb{R}^2 \to \mathbb{R}^2 \) can be differentiable (in the real sense) everywhere without being analytic. The Cauchy–Riemann equations make this difference precise.

## 4.1 Complex Differentiability

<div class="definition" markdown="1">
<strong>Definition 4.1.1 (Complex Derivative).</strong> Let \( f: D \to \mathbb{C} \) on an open set \( D \). The <em>complex derivative</em> of \( f \) at \( z_0 \in D \) is
\[ f'(z_0) = \lim_{h \to 0} \frac{f(z_0 + h) - f(z_0)}{h}, \quad h \in \mathbb{C} \setminus \{0\}. \]
If this limit exists, \( f \) is <em>differentiable</em> (or <em>holomorphic</em>) at \( z_0 \).
</div>

The subtlety here is that \( h \) approaches zero in the complex plane, so the difference quotient must have the same limiting value regardless of the direction of approach. This forces a compatibility condition on the partial derivatives — the Cauchy–Riemann equations — that two real functions \( u \) and \( v \) must jointly satisfy.

<div class="definition" markdown="1">
<strong>Definition 4.1.2 (Analytic / Holomorphic Function).</strong> A function \( f: D \to \mathbb{C} \) is <em>analytic</em> (or <em>holomorphic</em>) on \( D \) if it is differentiable at every point of \( D \). An <em>entire</em> function is analytic on all of \( \mathbb{C} \).
</div>

<div class="note" markdown="1">
<strong>Note.</strong> Complex differentiability is far more restrictive than real differentiability. The limit \( h \to 0 \) must be the same regardless of the direction from which \( h \) approaches 0 in the complex plane. This rigidity is captured by the Cauchy–Riemann equations.
</div>

## 4.2 Cauchy–Riemann Equations

The Cauchy–Riemann equations (CRE) are the analytic expression of the geometric fact that multiplication by \( f'(z_0) \) is a conformal linear map: it scales by \( |f'(z_0)| \) and rotates by \( \arg f'(z_0) \). The Jacobian matrix of \( f \) viewed as a real map \( \mathbb{R}^2 \to \mathbb{R}^2 \) must be a scalar multiple of a rotation matrix — the CRE capture exactly this constraint.

<div class="theorem" markdown="1">
<strong>Theorem 4.2.1 (CR Equations — Necessary Condition).</strong> If \( f = u + iv \) is differentiable at \( z_0 = x_0 + iy_0 \), then the partial derivatives \( u_x, u_y, v_x, v_y \) all exist at \( (x_0, y_0) \) and satisfy the <em>Cauchy–Riemann equations</em> (CRE):
\[ \frac{\partial u}{\partial x} = \frac{\partial v}{\partial y}, \qquad \frac{\partial u}{\partial y} = -\frac{\partial v}{\partial x}. \]
Moreover, \( f'(z_0) = u_x(x_0, y_0) + iv_x(x_0, y_0) \).
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Since the limit defining \( f'(z_0) \) exists, it must equal the limit along any path. Taking \( h = t \in \mathbb{R} \setminus\{0\} \):
\[ f'(z_0) = \lim_{t\to 0} \frac{u(x_0+t, y_0) - u(x_0,y_0)}{t} + i\frac{v(x_0+t,y_0) - v(x_0,y_0)}{t} = u_x + iv_x. \]
Taking \( h = it \in i\mathbb{R} \setminus\{0\} \):
\[ f'(z_0) = \lim_{t\to 0} \frac{u(x_0, y_0+t) - u(x_0,y_0)}{it} + i\frac{v(x_0,y_0+t) - v(x_0,y_0)}{it} = \frac{u_y}{i} + v_y = v_y - iu_y. \]
Equating: \( u_x = v_y \) and \( v_x = -u_y \). \( \square \)
</div>

The CRE are necessary but not sufficient on their own — differentiability of \( u \) and \( v \) is also needed. The sufficient condition below shows that continuous partial derivatives satisfying the CRE are exactly enough to guarantee analyticity.

<div class="theorem" markdown="1">
<strong>Theorem 4.2.2 (CR Equations — Sufficient Condition).</strong> Let \( f = u + iv \) be defined on an open set \( D \). If \( u \) and \( v \) have continuous partial derivatives satisfying the CRE on \( D \), then \( f \) is analytic on \( D \).
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Continuous partials imply real differentiability:
\[ f(z_0 + h) - f(z_0) = \begin{pmatrix} u_x & u_y \\ v_x & v_y \end{pmatrix}\begin{pmatrix} h_1 \\ h_2 \end{pmatrix} + o(|h|) \]
where \( h = h_1 + ih_2 \). Using the CRE, the Jacobian matrix is \( \begin{pmatrix} u_x & -v_x \\ v_x & u_x \end{pmatrix} \), which corresponds to multiplication by the complex number \( u_x + iv_x \). Thus \( \frac{f(z_0+h) - f(z_0)}{h} \to u_x + iv_x \). \( \square \)
</div>

![Cauchy–Riemann level curves: u(x,y) and v(x,y) as orthogonal families for f(z)=z²](/pics/pmath352/cauchy-riemann-levelcurves.png)

## 4.3 Properties of Analytic Functions

The algebra of analytic functions is exactly what one would expect from the formal differentiation rules. More striking is the connection with harmonic functions: both components of an analytic function are automatically harmonic. This gives a powerful method for producing harmonic functions and solving Laplace's equation — just take the real or imaginary part of any analytic function.

<div class="proposition" markdown="1">
<strong>Proposition 4.3.1 (Algebra of Analytic Functions).</strong> Let \( f, g \) be analytic on \( D \).
1. \( f \pm g \) and \( fg \) are analytic on \( D \), and \( f/g \) is analytic on \( \{g \neq 0\} \).
2. <em>Chain rule</em>: if \( g \) is analytic on \( f(D) \), then \( (g \circ f)' = (g' \circ f)\cdot f' \).
3. <em>Constant criterion</em>: if \( f' = 0 \) on a domain \( D \), then \( f \) is constant.
4. If \( f \) is analytic with real values (i.e., \( \operatorname{Im}(f) = 0 \), then \( f \) is constant.
</div>

<div class="proposition" markdown="1">
<strong>Proposition 4.3.2 (Analytic Functions and Harmonic Functions).</strong> If \( f = u + iv \) is analytic on a domain \( D \) and \( u, v \in C^2(D) \), then both \( u \) and \( v \) are harmonic on \( D \).
</div>

<div class="proof" markdown="1">
<em>Proof.</em> From the CRE: \( u_{xx} = v_{yx} \) and \( u_{yy} = -v_{xy} \). By equality of mixed partials: \( \Delta u = u_{xx} + u_{yy} = v_{yx} - v_{xy} = 0 \). Similarly \( \Delta v = 0 \). \( \square \)
</div>

The converse question — given a harmonic function \( u \), can we find an analytic \( f = u + iv \)? — leads to the notion of a harmonic conjugate. The answer is yes on simply connected domains, and the construction uses path integrals in exactly the same way as the Poincaré lemma for gradient fields.

<div class="definition" markdown="1">
<strong>Definition 4.3.3 (Harmonic Conjugate).</strong> If \( u \) is harmonic on \( D \), a <em>harmonic conjugate</em> of \( u \) is a harmonic function \( v \) on \( D \) such that \( f = u + iv \) is analytic. A harmonic conjugate, if it exists, is unique up to an additive constant.
</div>

<div class="theorem" markdown="1">
<strong>Theorem 4.3.4 (Existence of Harmonic Conjugate — Poincaré Lemma).</strong> If \( u \) is harmonic on a simply connected domain \( D \), then \( u \) has a harmonic conjugate \( v \) on \( D \).
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Define
\[ v(z) = \int_{\gamma_z} -u_y\, dx + u_x\, dy \]
where \( \gamma_z \) is any piecewise smooth path in \( D \) from a fixed basepoint \( z_0 \) to \( z \). The vector field \( (-u_y, u_x) \) satisfies \( \partial(-u_y)/\partial y = -u_{yy} = u_{xx} = \partial(u_x)/\partial x \) (using harmonicity), so it is irrotational. On a simply connected domain, irrotational fields are conservative (by the Bump Principle), so \( v \) is well-defined. Computing: \( v_x = -u_y \) and \( v_y = u_x \), which are the CRE. \( \square \)
</div>

The simply connected hypothesis in Theorem 4.3.4 is essential. On the punctured plane \( \mathbb{C}^* \), the function \( u = \ln|z| \) is harmonic but has no global harmonic conjugate — any branch of \( \arg z \) jumps by \( 2\pi \) around the origin. This is the first hint that the topology of the domain constrains the analysis, a theme that culminates in the Residue Theorem.

# Chapter 5: Elementary Functions

Having established the framework of analytic functions, we now build up the standard toolkit: exponential, trigonometric, and logarithmic functions. Each of these is familiar from real analysis, but the complex versions reveal new structure. The exponential is periodic; the logarithm is multi-valued; powers \( z^\alpha \) can be complex numbers with unexpected real values. The central complication is the branch-cut phenomenon for multi-valued functions, which is the concrete manifestation of the non-simply-connected topology of \( \mathbb{C}^* \).

## 5.1 The Exponential Function

<div class="definition" markdown="1">
<strong>Definition 5.1.1 (Complex Exponential).</strong> For \( z = x + iy \), define
\[ e^z = e^x(\cos y + i\sin y). \]
This extends the real exponential. It is entire with \( (e^z)' = e^z \) and satisfies \( e^{z+w} = e^z e^w \) for all \( z, w \in \mathbb{C} \). Note \( |e^z| = e^x \) and \( e^z \) is periodic with period \( 2\pi i \).
</div>

<div class="proposition" markdown="1">
<strong>Proposition 5.1.2 (Euler's Formula).</strong> \( e^{i\theta} = \cos\theta + i\sin\theta \). In particular, \( e^{i\pi} = -1 \) (Euler's identity).
</div>

## 5.2 Trigonometric and Hyperbolic Functions

The complex trigonometric functions are defined via the exponential, which shows they are entire functions and clarifies their relationship with the hyperbolic functions. Notably, \( \sin z \) and \( \cos z \) are no longer bounded on \( \mathbb{C} \) — the familiar \( |\sin x| \leq 1 \) fails completely in the complex setting, another illustration of how complex analysis differs from its real counterpart.

<div class="definition" markdown="1">
<strong>Definition 5.2.1.</strong> Define
\[ \cos z = \frac{e^{iz} + e^{-iz}}{2}, \quad \sin z = \frac{e^{iz} - e^{-iz}}{2i}, \]
\[ \cosh z = \frac{e^z + e^{-z}}{2}, \quad \sinh z = \frac{e^z - e^{-z}}{2}. \]
These are entire. Key identities: \( \cos^2 z + \sin^2 z = 1 \), \( \cosh^2 z - \sinh^2 z = 1 \), \( \cos(iz) = \cosh z \), \( \sin(iz) = i\sinh z \).
</div>

## 5.3 The Complex Logarithm

The complex logarithm is the inverse of \( e^z \), but since \( e^z \) is periodic with period \( 2\pi i \), the inverse is not unique: there are infinitely many logarithms of any nonzero complex number, differing by integer multiples of \( 2\pi i \). Choosing a single-valued branch requires cutting the plane along a ray to prevent the argument from winding all the way around the origin.

<div class="definition" markdown="1">
<strong>Definition 5.3.1 (Complex Logarithm).</strong> For \( z \neq 0 \), any \( w \) with \( e^w = z \) is a <em>logarithm</em> of \( z \). Writing \( z = re^{i\theta} \), all logarithms are
\[ \log z = \ln r + i(\theta + 2\pi k), \quad k \in \mathbb{Z}. \]
The <em>principal logarithm</em> on \( D^* = \mathbb{C} \setminus (-\infty, 0] \) is
\[ \operatorname{Log}(z) = \ln|z| + i\operatorname{Arg}(z). \]
</div>

<div class="proposition" markdown="1">
<strong>Proposition 5.3.2.</strong> \( \operatorname{Log}: D^* \to \mathbb{C} \) is analytic with \( (\operatorname{Log}\, z)' = 1/z \). It is not analytic across the branch cut \( (-\infty, 0] \).
</div>

The branch cut is not an intrinsic feature of the logarithm — it is an artifact of our choice to make the function single-valued. By moving the cut to a different ray, we get a different branch, analytic on a different domain. The common analytic core is the fact that \( \log z \) is locally well-defined and satisfies \( (\log z)' = 1/z \) everywhere except at \( 0 \).

<div class="definition" markdown="1">
<strong>Definition 5.3.3 (Branch of the Logarithm).</strong> For any \( \tau \in \mathbb{R} \), define \( \arg_\tau(z) \in (\tau, \tau + 2\pi) \) as the unique argument in that range. The <em>branch</em>
\[ L_\tau(z) = \ln|z| + i\arg_\tau(z) \]
is analytic on \( \mathbb{C} \) minus the ray \( \{re^{i\tau} : r \geq 0\} \). Note \( \operatorname{Log} = L_{-\pi} \).
</div>

<div class="note" markdown="1">
<strong>Note.</strong> The harmonic conjugate of \( \operatorname{Arg}(z) \) on \( D^<em> \) is \( \ln|z| \), since \( \operatorname{Log}\, z = \ln|z| + i\operatorname{Arg}(z) \) is analytic. This shows \( \operatorname{Arg} \) is harmonic on \( D^</em> \).
</div>

## 5.4 Complex Powers

<div class="definition" markdown="1">
<strong>Definition 5.4.1 (Complex Power).</strong> For \( \alpha \in \mathbb{C} \) and \( z \neq 0 \), define \( z^\alpha = e^{\alpha\log z} \). Since \( \log z \) is multi-valued, so is \( z^\alpha \) in general. The <em>principal value</em> is \( \operatorname{p.v.}\, z^\alpha = e^{\alpha\operatorname{Log}\, z} \).
</div>

<div class="example" markdown="1">
<strong>Example 5.4.2 (n-th Roots).</strong> The \( n \)-th roots of \( z = re^{i\theta} \) are
\[ z^{1/n} = r^{1/n} e^{i(\theta + 2\pi k)/n}, \quad k = 0, 1, \ldots, n-1. \]
These are \( n \) equally spaced points on a circle of radius \( r^{1/n} \).
</div>

<div class="example" markdown="1">
<strong>Example 5.4.3.</strong> \( i^i = e^{i\operatorname{Log}(i)} = e^{i\cdot i\pi/2} = e^{-\pi/2} \approx 0.2079 \). Surprisingly, a purely imaginary power of a purely imaginary number is real.
</div>

# Chapter 6: Complex Integration

This chapter is the heart of the course. We define contour integrals — integrals of complex functions along curves in the plane — and prove the foundational result: Cauchy's theorem. Everything that follows (the integral formula, Taylor series, the residue theorem) is a consequence of this single theorem. The key miracle is that analyticity — a purely local, infinitesimal condition — has global consequences for how functions integrate over closed loops.

## 6.1 Contour Integrals

<div class="definition" markdown="1">
<strong>Definition 6.1.1 (Contour Integral).</strong> Let \( \gamma: [a,b] \to \mathbb{C} \) be piecewise smooth and \( f: \operatorname{Im}(\gamma) \to \mathbb{C} \) continuous. The <em>contour integral</em> is
\[ \int_\gamma f(z)\, dz = \int_a^b f(\gamma(t))\gamma'(t)\, dt. \]
Writing \( f = u + iv \) and \( dz = dx + i\, dy \): \( \int_\gamma f\, dz = \int_\gamma u\, dx - v\, dy + i\int_\gamma v\, dx + u\, dy \).
</div>

<div class="proposition" markdown="1">
<strong>Proposition 6.1.2 (ML-Inequality).</strong> If \( |f(z)| \leq M \) for all \( z \in \operatorname{Im}(\gamma) \) and \( \ell(\gamma) = L \), then
\[ \left|\int_\gamma f(z)\, dz\right| \leq ML. \]
</div>

The ML-inequality is the workhorse estimate of the theory. It will be used repeatedly to show that integrals over "large" arcs (like the semicircle in the residue calculation for real integrals) vanish as the radius tends to infinity.

<div class="example" markdown="1">
<strong>Example 6.1.3.</strong> Compute \( \oint_{|z|=r} \frac{1}{z}\, dz \). Parametrize: \( \gamma(t) = re^{it} \), \( t \in [0, 2\pi] \), \( \gamma'(t) = ire^{it} \).
\[ \oint_{|z|=r} \frac{1}{z}\, dz = \int_0^{2\pi} \frac{1}{re^{it}} \cdot ire^{it}\, dt = \int_0^{2\pi} i\, dt = 2\pi i. \]
More generally, \( \oint_{|z-z_0|=r} (z-z_0)^n\, dz = \begin{cases} 2\pi i & n = -1 \\ 0 & n \neq -1 \end{cases} \).
</div>

This calculation is fundamental: it explains why the coefficient \( c_{-1} \) in a Laurent expansion (the residue) is the only term that contributes to a contour integral. All other powers \( (z - z_0)^n \) with \( n \neq -1 \) have an antiderivative near \( z_0 \) and integrate to zero around any loop.

![Closed contour C in complex plane encircling a pole z₀, illustrating the contour integral](/pics/pmath352/contour-integral.svg)

## 6.2 Antiderivatives and Path Independence

The antiderivative theorem is the complex analogue of the Fundamental Theorem of Calculus. Its equivalence with path independence and the vanishing of all closed-loop integrals is the same as in vector calculus — but in the complex setting, analyticity alone (via Cauchy's theorem) will force this to hold automatically on simply connected domains.

<div class="theorem" markdown="1">
<strong>Theorem 6.2.1 (Antiderivative Theorem).</strong> Let \( f \) be analytic on a domain \( D \) with antiderivative \( F \) (so \( F' = f \). Then for any piecewise smooth \( \gamma \) in \( D \) from \( z_0 \) to \( z_1 \):
\[ \int_\gamma f(z)\, dz = F(z_1) - F(z_0). \]
</div>

<div class="theorem" markdown="1">
<strong>Theorem 6.2.2 (Characterization of Antiderivative Existence).</strong> For a continuous function \( f \) on a domain \( D \), the following are equivalent:
1. \( f \) has an antiderivative on \( D \).
2. \( \int_\gamma f\, dz \) depends only on the endpoints of \( \gamma \).
3. \( \oint_\gamma f\, dz = 0 \) for every closed piecewise smooth curve \( \gamma \) in \( D \).
</div>

## 6.3 Cauchy's Integral Theorem

Cauchy's theorem is the central result of complex analysis. Its statement is deceptively simple — the integral of an analytic function around any closed curve in a simply connected domain is zero — but its consequences are far-reaching. The proof uses Green's theorem together with the Cauchy–Riemann equations, revealing that the curl of \( (u, -v) \) and of \( (v, u) \) both vanish precisely because \( f \) is analytic. The Goursat improvement shows that even continuity of \( f' \) is unnecessary — analyticity alone suffices.

<div class="theorem" markdown="1">
<strong>Theorem 6.3.1 (Cauchy's Integral Theorem).</strong> Let \( f \) be analytic on a simply connected domain \( D \). Then for any closed piecewise smooth curve \( \gamma \) in \( D \),
\[ \oint_\gamma f(z)\, dz = 0. \]
</div>

<div class="proof" markdown="1">
<em>Proof (assuming \( f' \) continuous).</em> Write \( \int_\gamma f\, dz = \int_\gamma u\, dx - v\, dy + i\int_\gamma v\, dx + u\, dy \). By Green's theorem applied to a Jordan domain bounded by \( \gamma \):
\[ \oint_\gamma u\, dx - v\, dy = \iint (-v_x - u_y)\, dA = 0, \quad \oint_\gamma v\, dx + u\, dy = \iint (u_x - v_y)\, dA = 0 \]
using the CRE. \( \square \)
</div>

<div class="theorem" markdown="1">
<strong>Theorem 6.3.2 (Cauchy–Goursat Theorem).</strong> The same conclusion holds even without assuming \( f' \) is continuous: analyticity alone suffices.
</div>

<div class="theorem" markdown="1">
<strong>Theorem 6.3.3 (Deformation Principle).</strong> If \( f \) is analytic on a domain \( D \) and \( \gamma_0, \gamma_1 \) are homotopic closed curves in \( D \) (one can be continuously deformed into the other within \( D \), then
\[ \oint_{\gamma_0} f\, dz = \oint_{\gamma_1} f\, dz. \]
</div>

The Deformation Principle makes topology visible in analysis. Two curves contribute the same integral not because of any arithmetic coincidence but because the analytic function has no "source" or "sink" in the region swept out by the deformation. When a singularity is present, a deformation that must pass through it is obstructed — and the difference in the two integrals is \( 2\pi i \) times the residue at that singularity.

## 6.4 Cauchy's Integral Formula

Cauchy's Integral Formula (CIF) is genuinely surprising: it says the value of an analytic function at any interior point is completely determined by its values on any surrounding curve. This is the opposite of what happens for a general continuous function — knowing boundary values does not pin down interior values unless the function satisfies a PDE. For analytic functions, the PDE is the Cauchy–Riemann system, and the CIF is its solution operator.

<div class="theorem" markdown="1">
<strong>Theorem 6.4.1 (Cauchy's Integral Formula — CIF).</strong> Let \( f \) be analytic on a domain \( D \) and let \( \gamma \) be a simple closed piecewise smooth curve in \( D \) oriented counterclockwise, enclosing a simply connected region in \( D \). For any \( z_0 \) inside \( \gamma \):
\[ f(z_0) = \frac{1}{2\pi i} \oint_\gamma \frac{f(z)}{z - z_0}\, dz. \]
</div>

<div class="proof" markdown="1">
<em>Proof.</em> By the Deformation Principle, deform \( \gamma \) to a small circle \( C_\varepsilon: |z - z_0| = \varepsilon \):
\[ \frac{1}{2\pi i}\oint_{C_\varepsilon} \frac{f(z)}{z-z_0}\, dz = \frac{1}{2\pi i}\oint_{C_\varepsilon} \frac{f(z_0)}{z-z_0}\, dz + \frac{1}{2\pi i}\oint_{C_\varepsilon} \frac{f(z)-f(z_0)}{z-z_0}\, dz = f(z_0) + E_\varepsilon. \]
The first integral is \( f(z_0) \) by Example 6.1.3. For \( E_\varepsilon \): since \( f \) is continuous at \( z_0 \), \( |f(z) - f(z_0)| \leq \delta(\varepsilon) \to 0 \) on \( C_\varepsilon \), so \( |E_\varepsilon| \leq \delta(\varepsilon) \to 0 \). \( \square \)
</div>

Differentiating the CIF with respect to the parameter \( z_0 \) yields an equally remarkable corollary: every analytic function is automatically infinitely differentiable, with all higher derivatives also given by contour integrals. There is no analogue of this in real analysis — a once-differentiable function on \( \mathbb{R} \) need not be twice differentiable. The rigid structure of complex differentiability enforces infinite smoothness for free.

<div class="theorem" markdown="1">
<strong>Theorem 6.4.2 (Higher Derivatives Formula).</strong> Under the same hypotheses, \( f \) has complex derivatives of all orders, and
\[ f^{(n)}(z_0) = \frac{n!}{2\pi i} \oint_\gamma \frac{f(z)}{(z-z_0)^{n+1}}\, dz. \]
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Differentiate the CIF \( n \) times with respect to \( z_0 \) under the integral sign (justified by uniform convergence on compact sets). \( \square \)
</div>

## 6.5 Consequences

The consequences of the CIF come quickly and are far stronger than anything available in real analysis. Liouville's theorem (a bounded entire function is constant) follows in a few lines from the derivative estimate. From Liouville, the Fundamental Theorem of Algebra is immediate — a result whose purely algebraic content is proved here by an analytic route, illustrating the cross-domain power of complex analysis.

<div class="theorem" markdown="1">
<strong>Theorem 6.5.1 (Liouville's Theorem).</strong> Every bounded entire function is constant.
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Let \( |f| \leq M \). Apply the higher derivatives formula with \( n = 1 \) on a circle \( C_R \) of radius \( R \):
\[ |f'(z_0)| = \left|\frac{1}{2\pi i}\oint_{C_R} \frac{f(z)}{(z-z_0)^2}\, dz\right| \leq \frac{1}{2\pi}\cdot\frac{M}{(R - |z_0|)^2}\cdot 2\pi R \to 0 \text{ as } R\to\infty. \]
So \( f' = 0 \), hence \( f \) is constant. \( \square \)
</div>

<div class="theorem" markdown="1">
<strong>Theorem 6.5.2 (Fundamental Theorem of Algebra).</strong> Every non-constant polynomial \( p(z) \in \mathbb{C}[z] \) has at least one root in \( \mathbb{C} \). Consequently, every degree-\( n \) polynomial factors completely: \( p(z) = a(z-z_1)^{m_1}\cdots(z-z_k)^{m_k} \) with \( \sum m_j = n \).
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Suppose \( p(z) \neq 0 \) for all \( z \in \mathbb{C} \). Then \( f = 1/p \) is entire. Since \( |p(z)| \to \infty \) as \( |z| \to \infty \) (polynomials of degree \( \geq 1 \) are unbounded), \( f \) is bounded. Liouville's theorem gives \( f \) constant, so \( p \) is constant — contradiction. \( \square \)
</div>

Morera's theorem is the converse of Cauchy's theorem: if a continuous function has zero integral around every triangular contour, it must be analytic. It provides a useful criterion for passing analyticity through limits and is often applied together with the Weierstrass M-test to show that uniform limits of analytic functions are analytic.

<div class="theorem" markdown="1">
<strong>Theorem 6.5.3 (Morera's Theorem).</strong> Let \( f \) be continuous on a domain \( D \). If \( \oint_T f\, dz = 0 \) for every triangular contour \( T \) in \( D \), then \( f \) is analytic on \( D \).
</div>

## 6.6 Winding Numbers

The **winding number** (or **index**) of a closed curve around a point is the fundamental topological invariant of complex analysis. It counts, with sign, how many times a curve wraps around a given point. What makes the winding number analytic rather than merely topological is its definition as a contour integral — the same integral that appears in the Cauchy Integral Formula. The general form of Cauchy's theorem is precisely the statement that contour integrals are \( 2\pi i \) times a winding number.

<div class="definition" markdown="1">
<strong>Definition 6.6.1 (Winding Number).</strong> Let \( \gamma: [a,b] \to \mathbb{C} \) be a closed piecewise smooth curve and let \( z_0 \notin \gamma([a,b]) \). The <em>winding number</em> (or <em>index</em>) of \( \gamma \) around \( z_0 \) is
\[ n(\gamma, z_0) = \frac{1}{2\pi i} \oint_\gamma \frac{dz}{z - z_0}. \]
</div>

That \( n(\gamma, z_0) \) is always an integer is far from obvious from the integral formula. The proof tracks the argument of \( \gamma(t) - z_0 \) as \( t \) traverses \( [a,b] \): since \( \gamma \) is closed, the argument returns to its starting value modulo \( 2\pi \), so the total change is \( 2\pi \) times an integer.

<div class="proposition" markdown="1">
<strong>Proposition 6.6.2 (Integrality of Winding Number).</strong> \( n(\gamma, z_0) \in \mathbb{Z} \) for every closed piecewise smooth curve \( \gamma \) and every \( z_0 \notin \gamma([a,b]) \). As a function of \( z_0 \), the winding number is locally constant on \( \mathbb{C} \setminus \gamma([a,b]) \) and equal to \( 0 \) on the unbounded component.
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Define \( h(t) = \int_a^t \frac{\gamma'(s)}{\gamma(s) - z_0}\, ds \). Then \( h'(t) = \gamma'(t)/(\gamma(t) - z_0) \), and one checks that \( g(t) = e^{-h(t)}(\gamma(t) - z_0) \) satisfies \( g'(t) = 0 \) identically, so \( g \) is constant: \( g(t) = g(a) = \gamma(a) - z_0 \). At \( t = b \): \( e^{-h(b)}(\gamma(b) - z_0) = \gamma(a) - z_0 \). Since \( \gamma \) is closed, \( \gamma(a) = \gamma(b) \), giving \( e^{-h(b)} = 1 \), hence \( h(b) \in 2\pi i\mathbb{Z} \). But \( h(b) = 2\pi i\, n(\gamma, z_0) \) by definition. Local constancy follows because the integral \( \oint_\gamma dz/(z-z_0) \) varies continuously with \( z_0 \in \mathbb{C} \setminus \gamma([a,b]) \) while remaining integer-valued. On the unbounded component, \( |z_0| \to \infty \) forces the integrand \( \to 0 \), giving \( n = 0 \). \( \square \)
</div>

<div class="example" markdown="1">
<strong>Example 6.6.3.</strong> For the circle \( \gamma(t) = z_0 + re^{it} \), \( t \in [0, 2\pi] \), a direct computation gives \( n(\gamma, z_0) = 1 \). The same circle traversed clockwise gives \( n = -1 \), and traversed \( k \) times counterclockwise gives \( n = k \). For a point \( w \) with \( |w - z_0| > r \), Cauchy's theorem gives \( n(\gamma, w) = 0 \).
</div>

With the winding number in hand, the Cauchy Integral Formula admits a clean generalization to arbitrary closed curves, removing the restriction that \( \gamma \) be simple and that the domain be simply connected.

<div class="theorem" markdown="1">
<strong>Theorem 6.6.4 (General Cauchy Integral Formula).</strong> Let \( f \) be analytic on a domain \( D \), and let \( \gamma \) be a closed piecewise smooth curve in \( D \) with \( n(\gamma, z_0) = 0 \) for all \( z_0 \notin D \). Then for any \( w \in D \setminus \gamma([a,b]) \):
\[ \frac{1}{2\pi i} \oint_\gamma \frac{f(z)}{z - w}\, dz = n(\gamma, w)\, f(w). \]
</div>

The condition "\( n(\gamma, z_0) = 0 \) for all \( z_0 \notin D \)" is the general substitute for "simply connected domain" — it says topologically that \( \gamma \) does not wind around any point outside \( D \), so there are no singularities trapped inside the curve. For a simple closed Jordan curve bounding a region entirely inside \( D \), the winding number is \( \pm 1 \) for interior points, recovering Theorem 6.4.1.

<div class="remark" markdown="1">
<strong>Remark (Winding numbers and the Argument Principle).</strong> The Argument Principle (§9.4) can be rephrased elegantly using winding numbers: for a meromorphic function \( f \) and a suitable closed curve \( \gamma \),
\[ n(f \circ \gamma,\, 0) = Z - P, \]
where \( Z, P \) count zeros and poles inside \( \gamma \) with multiplicity. The winding number of the <em>image curve</em> \( f \circ \gamma \) around the origin equals the net zero-pole count — a beautiful incarnation of the principle that analytic functions carry topological information.
</div>

# Chapter 7: Series Representations

One of the deepest consequences of Cauchy's theorem is that every analytic function equals its Taylor series on any disc where it is defined — something that is spectacularly false for smooth real functions (which can be non-analytic even if infinitely differentiable). This chapter develops the theory of power series convergence and derives Taylor's theorem from the CIF. The chapter also introduces zeros, the Identity Theorem, and Laurent series, which are needed for the Residue Theorem in Chapter 9.

## 7.1 Sequences and Series

<div class="definition" markdown="1">
<strong>Definition 7.1.1 (Convergence).</strong> A series \( \sum_{n=0}^\infty a_n \) of complex numbers <em>converges absolutely</em> if \( \sum |a_n| < \infty \). Absolute convergence implies convergence.
</div>

<div class="theorem" markdown="1">
<strong>Theorem 7.1.2 (Ratio Test).</strong> If \( L = \lim_{n\to\infty} |a_{n+1}/a_n| \) exists, then \( \sum a_n \) converges absolutely if \( L < 1 \) and diverges if \( L > 1 \). At \( L = 1 \) the test is inconclusive.
</div>

<div class="definition" markdown="1">
<strong>Definition 7.1.3 (Uniform Convergence).</strong> A series \( \sum f_n \) of functions <em>converges uniformly</em> to \( f \) on \( S \) if \( \sup_{z \in S}|S_N(z) - f(z)| \to 0 \) as \( N \to \infty \).
</div>

Uniform convergence is critical because it allows interchange of limits with integrals and derivatives. The Weierstrass M-test is the standard tool for establishing uniform convergence, and its conclusion — that a uniformly convergent series of analytic functions is analytic — is the key reason power series within their disc of convergence define analytic functions.

<div class="theorem" markdown="1">
<strong>Theorem 7.1.4 (Weierstrass M-Test).</strong> If \( |f_n(z)| \leq M_n \) for all \( z \in S \) and \( \sum M_n < \infty \), then \( \sum f_n \) converges uniformly and absolutely on \( S \). Moreover, if each \( f_n \) is continuous, the limit is continuous; if each \( f_n \) is analytic, the limit is analytic.
</div>

## 7.2 Power Series

<div class="definition" markdown="1">
<strong>Definition 7.2.1 (Power Series and Radius of Convergence).</strong> A <em>power series</em> centred at \( z_0 \) is \( \sum_{n=0}^\infty c_n(z-z_0)^n \). The <em>radius of convergence</em> is
\[ R = \frac{1}{\limsup_{n\to\infty} |c_n|^{1/n}} \in [0, +\infty]. \]
The series converges absolutely on \( D(z_0, R) \), diverges for \( |z-z_0| > R \), and converges uniformly on any compact subset of \( D(z_0,R) \).
</div>

<div class="theorem" markdown="1">
<strong>Theorem 7.2.2 (Analyticity of Power Series).</strong> A power series \( f(z) = \sum_{n=0}^\infty c_n(z-z_0)^n \) with radius of convergence \( R > 0 \) is analytic on \( D(z_0, R) \) with
\[ f'(z) = \sum_{n=1}^\infty nc_n(z-z_0)^{n-1}, \]
and this series also has radius of convergence \( R \). Moreover, the series can be integrated term by term on any curve in \( D(z_0, R) \).
</div>

## 7.3 Taylor's Theorem

Taylor's theorem in the complex setting is sharper than its real counterpart in a decisive way: the Taylor series of an analytic function converges on the *largest disc around \( z_0 \) that avoids singularities*, and it converges to the function. There is no such guarantee in real analysis — smooth functions can have Taylor series with radius of convergence zero, or series that converge but not to the function. Complex analyticity and power-series representability are exactly equivalent.

<div class="theorem" markdown="1">
<strong>Theorem 7.3.1 (Taylor's Theorem).</strong> Let \( f \) be analytic on \( D(z_0, R) \). Then \( f \) equals its Taylor series on this disc:
\[ f(z) = \sum_{n=0}^\infty \frac{f^{(n)}(z_0)}{n!}(z-z_0)^n. \]
The radius of convergence of this series is at least \( R \) (and equals the distance from \( z_0 \) to the nearest singularity of \( f \).
</div>

<div class="proof" markdown="1">
<em>Proof.</em> For \( z \in D(z_0, R) \), choose \( r \) with \( |z-z_0| < r < R \). By CIF on \( C_r \):
\[ f(z) = \frac{1}{2\pi i}\oint_{C_r} \frac{f(w)}{w-z}\, dw. \]
Write \( \frac{1}{w-z} = \frac{1}{(w-z_0)(1-(z-z_0)/(w-z_0))} = \sum_{n=0}^\infty \frac{(z-z_0)^n}{(w-z_0)^{n+1}} \), which converges uniformly on \( C_r \) since \( |z-z_0|/r < 1 \). Integrating term by term and using the higher derivatives formula gives \( f(z) = \sum_{n=0}^\infty \frac{f^{(n)}(z_0)}{n!}(z-z_0)^n \). \( \square \)
</div>

<div class="example" markdown="1">
<strong>Example 7.3.2 (Standard Taylor Series).</strong>
- \( e^z = \sum_{n=0}^\infty \frac{z^n}{n!} \), \( R = \infty \)
- \( \sin z = \sum_{n=0}^\infty \frac{(-1)^n z^{2n+1}}{(2n+1)!} \), \( R = \infty \)
- \( \cos z = \sum_{n=0}^\infty \frac{(-1)^n z^{2n}}{(2n)!} \), \( R = \infty \)
- \( \frac{1}{1-z} = \sum_{n=0}^\infty z^n \), \( R = 1 \)
- \( \operatorname{Log}(1+z) = \sum_{n=1}^\infty \frac{(-1)^{n+1}z^n}{n} \), \( R = 1 \)
</div>

<div class="example" markdown="1">
<strong>Example 7.3.3.</strong> Find the Taylor series of \( f(z) = e^{3z^2} \) at \( z_0 = 0 \).

Substitute \( z \mapsto 3z^2 \) in the series for \( e^z \):
\[ e^{3z^2} = \sum_{n=0}^\infty \frac{(3z^2)^n}{n!} = \sum_{n=0}^\infty \frac{3^n z^{2n}}{n!} = 1 + 3z^2 + \frac{9}{2}z^4 + \frac{9}{2}z^6 + \cdots \]
with radius of convergence \( R = \infty \).
</div>

<div class="example" markdown="1">
<strong>Example 7.3.4.</strong> Find the Taylor series of \( \operatorname{Log}\, z \) at \( z_0 = 2 \).

\[ \operatorname{Log}\, z = \operatorname{Log}\, 2 + \operatorname{Log}(1 + (z-2)/2) = \operatorname{Log}\, 2 + \sum_{n=1}^\infty \frac{(-1)^{n+1}}{n}\left(\frac{z-2}{2}\right)^n \]
with radius of convergence \( R = 2 \) (distance from \( z_0 = 2 \) to the nearest singularity at \( z = 0 \).
</div>

## 7.4 Zeros of Analytic Functions

The theory of zeros of analytic functions has no real analogue. In complex analysis, the zeros of a non-trivial analytic function are always isolated — they cannot accumulate in the domain. This isolation, combined with the Identity Theorem, means that two analytic functions agreeing on any set with a limit point must agree everywhere. This is an extremely powerful rigidity principle: an analytic function is determined by its values on any convergent sequence within its domain of analyticity.

<div class="definition" markdown="1">
<strong>Definition 7.4.1 (Order of a Zero).</strong> A point \( z_0 \) is a <em>zero of order</em> \( m \geq 1 \) of \( f \) if \( f(z_0) = f'(z_0) = \cdots = f^{(m-1)}(z_0) = 0 \) but \( f^{(m)}(z_0) \neq 0 \). Equivalently, \( f(z) = (z-z_0)^m g(z) \) with \( g \) analytic and \( g(z_0) \neq 0 \). A simple zero has order 1.
</div>

<div class="theorem" markdown="1">
<strong>Theorem 7.4.2 (Isolated Zeros).</strong> If \( f \) is analytic on a domain \( D \) and not identically zero, then the zeros of \( f \) are isolated: for each zero \( z_0 \) there exists \( r > 0 \) with \( f(z) \neq 0 \) for \( 0 < |z-z_0| < r \).
</div>

<div class="theorem" markdown="1">
<strong>Theorem 7.4.3 (Identity Theorem).</strong> Let \( f, g \) be analytic on a domain \( D \). If \( f = g \) on a set \( S \subseteq D \) having a limit point in \( D \), then \( f = g \) on all of \( D \).
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Apply the isolated zeros theorem to \( h = f - g \). The set where \( h = 0 \) is both open (by the isolated-zeros argument) and closed (by continuity), and is nonempty; since \( D \) is connected, it equals all of \( D \). \( \square \)
</div>

# Chapter 8: Laurent Series and Singularities

Taylor series describe an analytic function near a point where it is well-behaved. To understand behavior near a singularity — a point where the function fails to be analytic — we need Laurent series, which allow negative powers of \( (z - z_0) \). The structure of the negative-power terms (the principal part) completely classifies the type of singularity, with dramatically different behavior in each case.

## 8.1 Laurent Series

<div class="theorem" markdown="1">
<strong>Theorem 8.1.1 (Laurent Series Theorem).</strong> Let \( f \) be analytic on the annulus \( A = A(z_0; r, R) = \{z : r < |z-z_0| < R\} \) (with \( 0 \leq r < R \leq \infty \). Then \( f \) has a unique <em>Laurent series representation</em>:
\[ f(z) = \sum_{n=-\infty}^\infty c_n(z-z_0)^n = \sum_{n=0}^\infty c_n(z-z_0)^n + \sum_{n=1}^\infty \frac{c_{-n}}{(z-z_0)^n}, \]
converging absolutely and uniformly on compact subsets of \( A \), where for any \( \rho \in (r, R) \):
\[ c_n = \frac{1}{2\pi i}\oint_{|z-z_0|=\rho} \frac{f(z)}{(z-z_0)^{n+1}}\, dz. \]
</div>

<div class="definition" markdown="1">
<strong>Definition 8.1.2 (Principal Part).</strong> In the Laurent expansion, the <em>principal part</em> is \( \sum_{n=1}^\infty c_{-n}(z-z_0)^{-n} \) (the negative-power terms) and the <em>analytic part</em> is \( \sum_{n=0}^\infty c_n(z-z_0)^n \).
</div>

<div class="example" markdown="1">
<strong>Example 8.1.3.</strong> Find all Laurent series of \( f(z) = \frac{1}{z(z-1)} \).

The singularities are at \( z = 0 \) and \( z = 1 \). Three annular regions:

<strong>(a) \( 0 < |z| < 1 \):</strong> Use partial fractions \( f = -\frac{1}{z} + \frac{1}{z-1} = -\frac{1}{z} - \frac{1}{1-z} \):
\[ f(z) = -\frac{1}{z} - \sum_{n=0}^\infty z^n = -z^{-1} - 1 - z - z^2 - \cdots \]

<strong>(b) \( 1 < |z| < \infty \):</strong> \( \frac{1}{z-1} = \frac{1}{z}\cdot\frac{1}{1-1/z} = \frac{1}{z}\sum_{n=0}^\infty z^{-n} \):
\[ f(z) = -\frac{1}{z} + \frac{1}{z}\sum_{n=0}^\infty \frac{1}{z^n} = \sum_{n=0}^\infty \frac{1}{z^{n+2}} = z^{-2} + z^{-3} + \cdots \]
</div>

## 8.2 Classification of Isolated Singularities

The Laurent expansion gives a complete classification of isolated singularities. The three cases — removable, pole, and essential — behave completely differently near the singular point, and this classification is what makes the Residue Theorem possible: only poles contribute non-trivially to contour integrals.

<div class="definition" markdown="1">
<strong>Definition 8.2.1 (Isolated Singularity).</strong> If \( f \) is analytic on \( A(z_0; 0, R) \) but not at \( z_0 \) itself, \( z_0 \) is an <em>isolated singularity</em>. Classify by the Laurent principal part:
- <strong>Removable singularity</strong>: principal part is 0 (all \( c_n = 0 \) for \( n < 0 \). Then \( \lim_{z\to z_0} f(z) \) exists finitely.
- <strong>Pole of order \( m \)</strong>: \( c_{-m} \neq 0 \) and \( c_n = 0 \) for \( n < -m \). Then \( \lim_{z\to z_0} |f(z)| = \infty \).
- <strong>Essential singularity</strong>: infinitely many nonzero \( c_n \) with \( n < 0 \).
</div>

<div class="theorem" markdown="1">
<strong>Theorem 8.2.2 (Riemann's Removability Criterion).</strong> The isolated singularity \( z_0 \) of \( f \) is removable if and only if \( f \) is bounded in some punctured disc \( 0 < |z - z_0| < \delta \) (equivalently, if \( \lim_{z\to z_0}(z-z_0)f(z) = 0 \).
</div>

The behavior near an essential singularity is wild beyond anything a pole can produce. Casorati–Weierstrass says the function comes arbitrarily close to every complex value in any punctured neighborhood — geometrically, the image of any small punctured disc is dense in \( \mathbb{C} \). Picard's theorem strengthens this to say the function actually takes every value with at most one exception, but the proof is deeper.

<div class="theorem" markdown="1">
<strong>Theorem 8.2.3 (Casorati–Weierstrass).</strong> Near an essential singularity \( z_0 \), the image of any punctured disc \( D(z_0,r)\setminus\{z_0\} \) is dense in \( \mathbb{C} \). (The stronger Picard's Great Theorem states the image omits at most one value.)
</div>

# Chapter 9: The Residue Theorem

The Residue Theorem is the payoff of everything built so far. It converts a contour integral — which a priori requires parametrization and computation — into an algebraic problem: identify the poles inside the contour and compute their residues. The theorem is the main computational tool of complex analysis, and its applications to real integrals (rational functions, Fourier integrals, trigonometric integrals) are among the most striking uses of complex methods to solve problems that appear to have nothing to do with complex numbers.

## 9.1 Residues

The residue is the single coefficient \( c_{-1} \) in the Laurent expansion. From Example 6.1.3, it is the only Laurent coefficient that contributes to a contour integral. Everything else either has an antiderivative (positive powers) or integrates to zero (negative powers other than \( -1 \)).

<div class="definition" markdown="1">
<strong>Definition 9.1.1 (Residue).</strong> The <em>residue</em> of \( f \) at an isolated singularity \( z_0 \) is
\[ \operatorname{Res}(f, z_0) = c_{-1} = \frac{1}{2\pi i}\oint_{C_\varepsilon} f(z)\, dz \]
where \( C_\varepsilon \) is any small circle around \( z_0 \).
</div>

In practice, computing residues by expanding Laurent series is often unnecessary. The formulas below handle the most common cases — simple poles and poles of finite order — purely algebraically.

<div class="proposition" markdown="1">
<strong>Proposition 9.1.2 (Computing Residues).</strong>
1. <em>Simple pole</em>: \( \operatorname{Res}(f, z_0) = \lim_{z\to z_0}(z-z_0)f(z) \).
2. <em>Simple pole of \( g/h \)</em>: if \( g(z_0) \neq 0 \), \( h(z_0) = 0 \), \( h'(z_0) \neq 0 \), then \( \operatorname{Res}(g/h, z_0) = g(z_0)/h'(z_0) \).
3. <em>Pole of order \( m \)</em>:
\[ \operatorname{Res}(f, z_0) = \frac{1}{(m-1)!}\lim_{z\to z_0}\frac{d^{m-1}}{dz^{m-1}}\bigl[(z-z_0)^m f(z)\bigr]. \]
</div>

<div class="example" markdown="1">
<strong>Example 9.1.3.</strong> Compute \( \operatorname{Res}\!\left(\frac{z^2}{(z-1)^2(z+2)}, 1\right) \).

Pole of order 2 at \( z = 1 \):
\[ \operatorname{Res} = \lim_{z\to 1}\frac{d}{dz}\left[\frac{z^2}{z+2}\right] = \lim_{z\to 1}\frac{2z(z+2) - z^2}{(z+2)^2} = \frac{2\cdot 3 - 1}{9} = \frac{5}{9}. \]
</div>

## 9.2 The Residue Theorem

<div class="theorem" markdown="1">
<strong>Theorem 9.2.1 (Residue Theorem).</strong> Let \( f \) be analytic on a domain \( D \) except at finitely many isolated singularities \( z_1, \ldots, z_k \). Let \( \gamma \) be a simple closed piecewise smooth curve in \( D \) oriented counterclockwise, enclosing all the singularities (and with its interior in \( D \). Then
\[ \oint_\gamma f(z)\, dz = 2\pi i \sum_{j=1}^k \operatorname{Res}(f, z_j). \]
</div>

<div class="proof" markdown="1">
<em>Proof.</em> By the Deformation Principle, deform \( \gamma \) to small disjoint circles \( C_j \) around each \( z_j \):
\[ \oint_\gamma f\, dz = \sum_{j=1}^k \oint_{C_j} f\, dz = 2\pi i \sum_{j=1}^k \operatorname{Res}(f, z_j). \quad \square \]
</div>

The Residue Theorem is remarkable for what it ignores: the shape of the contour, the behavior of \( f \) far from the singularities, the exact values of \( f \) anywhere away from the poles. The entire integral depends only on the residues — purely local algebraic data at the singularities. This reduction of a global analytic question to local algebraic data is the hallmark of complex analysis.

![Keyhole contour for branch-cut integrals: large arc C_R, small arc ε→0, segments above and below the branch cut](/pics/pmath352/keyhole-contour.svg)

## 9.3 Applications to Real Integrals

<div class="example" markdown="1">
<strong>Example 9.3.1 (Rational Functions).</strong> To evaluate \( \int_{-\infty}^\infty P(x)/Q(x)\, dx \) where \( \deg Q \geq \deg P + 2 \) and \( Q \) has no real roots: integrate over a semicircular contour in the upper half-plane. As \( R \to \infty \), the semicircle contributes 0 (ML-inequality). Thus
\[ \int_{-\infty}^\infty \frac{P(x)}{Q(x)}\, dx = 2\pi i \sum_{\operatorname{Im}(z_j) > 0} \operatorname{Res}\!\left(\frac{P}{Q}, z_j\right). \]
</div>

<div class="proposition" markdown="1">
<strong>Proposition 9.3.2 (Jordan's Lemma).</strong> Let \( f \) be analytic for \( \operatorname{Im}(z) \geq 0, |z| \geq R_0 \), with \( \max_{|z|=R, \operatorname{Im}(z)\geq 0}|f(z)| \to 0 \) as \( R \to \infty \). Then for \( \lambda > 0 \):
\[ \lim_{R\to\infty} \int_{\Gamma_R} f(z)e^{i\lambda z}\, dz = 0 \]
where \( \Gamma_R \) is the upper semicircle of radius \( R \). This enables evaluation of \( \int_{-\infty}^\infty f(x)\sin(\lambda x)\, dx \) and \( \int_{-\infty}^\infty f(x)\cos(\lambda x)\, dx \).
</div>

<div class="example" markdown="1">
<strong>Example 9.3.3 (Trigonometric Integrals).</strong> To evaluate \( \int_0^{2\pi} R(\cos\theta, \sin\theta)\, d\theta \), substitute \( z = e^{i\theta} \):
\[ \cos\theta = \frac{z + z^{-1}}{2}, \quad \sin\theta = \frac{z - z^{-1}}{2i}, \quad d\theta = \frac{dz}{iz}. \]
The integral becomes \( \oint_{|z|=1} (\cdots)\, dz \), evaluated by the Residue Theorem.
</div>

## 9.4 Argument Principle and Rouché's Theorem

The Argument Principle links a contour integral to a topological quantity: the number of zeros minus the number of poles counts how many times the image curve \( f \circ \gamma \) winds around the origin. This "winding number" interpretation shows that counting zeros and poles is a global, topological operation — an analytic function cannot change its number of zeros discontinuously as parameters vary, and Rouché's theorem makes this precise.

<div class="theorem" markdown="1">
<strong>Theorem 9.4.1 (Argument Principle).</strong> Let \( f \) be meromorphic on a domain containing a simple closed curve \( \gamma \) and its interior, with no zeros or poles on \( \gamma \). Then
\[ \frac{1}{2\pi i}\oint_\gamma \frac{f'(z)}{f(z)}\, dz = Z - P \]
where \( Z \) = number of zeros (counted with multiplicity) and \( P \) = number of poles (counted with order) inside \( \gamma \). The left side equals the winding number \( n(f\circ\gamma, 0) \).
</div>

<div class="proof" markdown="1">
<em>Proof.</em> Near a zero of order \( m \), \( f(z) = (z-z_0)^m g(z) \) with \( g(z_0) \neq 0 \), so \( f'/f \) has a simple pole with residue \( m \). Near a pole of order \( p \), \( f(z) = (z-z_0)^{-p}h(z) \) with \( h(z_0) \neq 0 \), so \( f'/f \) has a simple pole with residue \( -p \). The Residue Theorem gives the result. \( \square \)
</div>

<div class="theorem" markdown="1">
<strong>Theorem 9.4.2 (Rouché's Theorem).</strong> Let \( f, g \) be analytic inside and on a simple closed curve \( \gamma \). If \( |f(z) - g(z)| < |f(z)| \) for all \( z \in \gamma \), then \( f \) and \( g \) have the same number of zeros inside \( \gamma \) (counted with multiplicity).
</div>

<div class="example" markdown="1">
<strong>Example 9.4.3.</strong> Show all roots of \( z^7 - 4z^3 + z - 1 = 0 \) lie in \( D(0,2) \).

Let \( f(z) = -4z^3 \) and \( g(z) = z^7 - 4z^3 + z - 1 \). On \( |z| = 2 \):
\[ |f(z) - g(z)| = |z^7 + z - 1| \leq 128 + 2 + 1 = 131, \quad |f(z)| = 4\cdot 8 = 32. \]
Hmm, this fails. Alternatively, let \( f(z) = z^7 \):
\[ |g(z) - f(z)| = |{-4z^3 + z - 1}| \leq 4\cdot 8 + 2 + 1 = 35 < 128 = |f(z)| \text{ on } |z|=2. \]
So \( g \) has 7 zeros in \( D(0,2) \) = all of them.
</div>

# Chapter 10: Conformal Mappings

Conformal mappings are the geometric objects of complex analysis. An analytic function with nonzero derivative preserves angles between curves — this is the meaning of "conformal." Conformal bijections between domains are the isomorphisms of complex analysis, and the Riemann Mapping Theorem asserts that there is essentially only one simply connected domain up to conformal equivalence: the unit disc. This is a profound rigidity theorem, with no analogue in dimensions three and higher.

## 10.1 Conformal Maps

<div class="definition" markdown="1">
<strong>Definition 10.1.1 (Conformal Map).</strong> An analytic function \( f \) is <em>conformal</em> at \( z_0 \) if \( f'(z_0) \neq 0 \). A conformal map preserves angles between curves at \( z_0 \) (both magnitude and orientation). A <em>conformal bijection</em> is an analytic bijection \( f: D \to D' \) whose inverse is also analytic (i.e., a <em>biholomorphism</em>).
</div>

Why does \( f'(z_0) \neq 0 \) imply angle preservation? Because locally, \( f \) looks like multiplication by the complex number \( f'(z_0) \), which is a rotation by \( \arg f'(z_0) \) composed with a scaling by \( |f'(z_0)| \). Rotations and scalings preserve angles, so the differential of \( f \) at \( z_0 \) preserves angles. At a point where \( f'(z_0) = 0 \), angles are multiplied by the order of the zero, leading to angle-multiplying maps rather than angle-preserving ones.

![Conformal map w=z²: rectangular grid in the z-plane maps to curved curvilinear grid in the w-plane](/pics/pmath352/conformal-map-z2.png)

<div class="theorem" markdown="1">
<strong>Theorem 10.1.2 (Open Mapping Theorem).</strong> A non-constant analytic function on a domain \( D \) maps open sets to open sets.
</div>

<div class="proof" markdown="1">
<em>Proof.</em> For any \( w_0 = f(z_0) \), write \( f(z) - w_0 = (z-z_0)^m g(z) \) with \( g(z_0) \neq 0 \). For \( |w - w_0| \) sufficiently small, apply Rouché to \( f(z) - w_0 \) and \( f(z) - w \) on a circle \( |z - z_0| = \delta \) to show \( f(z) = w \) has exactly \( m \) solutions near \( z_0 \). Thus every \( w \) near \( w_0 \) is in the image of a neighborhood of \( z_0 \). \( \square \)
</div>

<div class="corollary" markdown="1">
<strong>Corollary 10.1.3 (Maximum Modulus Principle).</strong> If \( f \) is analytic on a domain \( D \) and \( |f| \) attains a local maximum, then \( f \) is constant. If \( D \) is bounded and \( f \) extends continuously to \( \partial D \), then \( \max_{\overline{D}} |f| = \max_{\partial D} |f| \).
</div>

The Maximum Modulus Principle is the analytic counterpart of the harmonic maximum principle from Chapter 2. The proof here — via the Open Mapping Theorem — is purely complex-analytic and more elegant. Together these principles say that the "size" of an analytic function is controlled by its boundary behavior; functions cannot have hidden interior maxima.

## 10.2 Elementary Mappings

<div class="proposition" markdown="1">
<strong>Proposition 10.2.1 (Elementary Conformal Maps).</strong>
- <em>Translations</em>: \( z \mapsto z + b \) — maps discs to discs.
- <em>Rotations</em>: \( z \mapsto e^{i\theta}z \) — rotates by angle \( \theta \).
- <em>Magnifications</em>: \( z \mapsto rz \) (\( r > 0 \) — scales by \( r \).
- <em>Inversion</em>: \( z \mapsto 1/z \) — maps circles and lines to circles and lines.
- <em>Power maps</em>: \( z \mapsto z^n \) — \( n \)-to-1 cover.
- <em>Joukowski</em>: \( z \mapsto z + 1/z \) — maps unit circle to segment \( [-2, 2] \).
</div>

## 10.3 Möbius Transformations

Möbius transformations (also called linear fractional transformations) are the simplest non-trivial conformal bijections of the Riemann sphere. Their remarkable property — that they send circles and lines to circles and lines — makes them indispensable for mapping between standard domains (half-planes, discs, sectors). The cross-ratio, preserved under all Möbius transformations, is the invariant that uniquely characterises them.

<div class="definition" markdown="1">
<strong>Definition 10.3.1 (Möbius Transformation / LFT).</strong> A <em>Möbius transformation</em> is
\[ T(z) = \frac{az + b}{cz + d}, \quad ad - bc \neq 0. \]
These are conformal bijections of the Riemann sphere \( \hat{\mathbb{C}} = \mathbb{C} \cup \{\infty\} \) (with \( T(\infty) = a/c \) if \( c \neq 0 \) and \( T(-d/c) = \infty \).
</div>

<div class="proposition" markdown="1">
<strong>Proposition 10.3.2 (Properties of Möbius Transformations).</strong>
1. The Möbius transformations form a group under composition, isomorphic to \( PGL(2,\mathbb{C}) \).
2. Every LFT is a composition of translations, dilations, and the inversion \( z \mapsto 1/z \).
3. LFTs map <em>circles and lines</em> to circles and lines (viewing lines as circles through \( \infty \).
4. An LFT is determined by specifying its values at three distinct points.
5. LFTs preserve the <em>cross-ratio</em>: \( (z_1, z_2; z_3, z_4) = \frac{(z_1-z_3)(z_2-z_4)}{(z_1-z_4)(z_2-z_3)} \).
</div>

<div class="example" markdown="1">
<strong>Example 10.3.3 (Upper Half-Plane to Disc).</strong> The LFT
\[ f(z) = \frac{z - i}{z + i} \]
maps the upper half-plane \( \{z: \operatorname{Im}(z) > 0\} \) conformally onto the unit disc \( \mathbb{D} \), with \( f(i) = 0 \) and \( f(\mathbb{R}) = \partial\mathbb{D} \).
</div>

<div class="example" markdown="1">
<strong>Example 10.3.4 (Disc Automorphisms).</strong> Every conformal bijection of \( \mathbb{D} \) onto itself is
\[ f(z) = e^{i\theta}\frac{z - a}{1 - \bar{a}z}, \quad a \in \mathbb{D},\; \theta \in \mathbb{R}. \]
</div>

## 10.4 The Riemann Mapping Theorem

The Riemann Mapping Theorem is one of the most powerful existence theorems in mathematics. It asserts that every simply connected proper subdomain of \( \mathbb{C} \) is conformally equivalent to the unit disc — regardless of its shape. A square, a half-plane, a triangle, a star-shaped domain — all are conformally the same. The theorem is non-constructive, but it underpins the strategy of solving problems on complicated domains by first mapping to the disc.

<div class="theorem" markdown="1">
<strong>Theorem 10.4.1 (Riemann Mapping Theorem).</strong> Let \( D \subsetneq \mathbb{C} \) be a simply connected domain. Then there exists a conformal bijection \( f: D \xrightarrow{\sim} \mathbb{D} \). Moreover, fixing any \( z_0 \in D \), there is a unique such \( f \) with \( f(z_0) = 0 \) and \( f'(z_0) > 0 \).
</div>

<div class="note" markdown="1">
<strong>Note.</strong> The proof is non-constructive, using a normal families argument (Montel's theorem). The theorem says every non-trivial simply connected domain is conformally equivalent to the disc — a remarkable rigidity result. The theorem fails for \( D = \mathbb{C} \) itself (by Liouville's theorem, no bounded entire bijection exists).
</div>

## 10.5 The Dirichlet Problem

One of the most important applications of conformal mapping is to boundary value problems for Laplace's equation. The Dirichlet problem asks: given boundary data on \( \partial D \), find a harmonic function in \( D \) with those boundary values. On the disc, the explicit Poisson integral formula solves this completely. The Riemann Mapping Theorem then solves the problem on any simply connected domain by pulling back through a conformal equivalence.

<div class="definition" markdown="1">
<strong>Definition 10.5.1 (Dirichlet Problem).</strong> Given a domain \( D \) and continuous boundary data \( h: \partial D \to \mathbb{R} \), find a function \( u: \overline{D} \to \mathbb{R} \) harmonic on \( D \) and continuous on \( \overline{D} \) with \( u|_{\partial D} = h \).
</div>

<div class="proposition" markdown="1">
<strong>Proposition 10.5.2 (Solution via Conformal Mapping).</strong> For a simply connected domain \( D \):
1. Map \( D \) conformally to \( \mathbb{D} \) via \( \phi: D \to \mathbb{D} \).
2. Transport boundary data: \( \tilde{h} = h \circ \phi^{-1} \).
3. Solve on the disc using the Poisson integral: \( \tilde{u}(re^{i\theta}) = \frac{1}{2\pi}\int_0^{2\pi}\frac{1-r^2}{1-2r\cos(\theta-t)+r^2}\tilde{h}(e^{it})\, dt \).
4. Pull back: \( u = \tilde{u} \circ \phi \).
Since harmonic functions compose with conformal maps (on the source side), \( u \) is harmonic on \( D \).
</div>

# Chapter 11: Analytic Continuation

The final chapter addresses a question that emerges naturally from the Identity Theorem: if an analytic function is defined on a small domain, is there a unique way to extend it to a larger domain? The answer is yes, locally, but globally the extension may be multi-valued — as with the logarithm. Analytic continuation formalizes this idea, and the Monodromy Theorem gives the precise topological condition (simple connectivity) under which a global single-valued extension exists.

## 11.1 Direct Analytic Continuation

<div class="definition" markdown="1">
<strong>Definition 11.1.1 (Direct Analytic Continuation).</strong> Let \( f_1 \) be analytic on a domain \( D_1 \). A <em>direct analytic continuation</em> of \( (f_1, D_1) \) to a domain \( D_2 \) (with \( D_1 \cap D_2 \) nonempty and connected) is a function \( f_2 \) analytic on \( D_2 \) with \( f_1 = f_2 \) on \( D_1 \cap D_2 \). By the Identity Theorem, the continuation is unique.
</div>

<div class="proposition" markdown="1">
<strong>Proposition 11.1.2 (Weierstrass Method).</strong> A <em>chain of continuations</em> along a path \( \gamma \) from \( z_0 \) to \( z_1 \) is a finite sequence of discs \( D_0, D_1, \ldots, D_n \) with centres on \( \gamma \) and analytic functions \( f_k: D_k \to \mathbb{C} \) such that \( f_k = f_{k+1} \) on \( D_k \cap D_{k+1} \neq \emptyset \) for each \( k \). By uniqueness, the final element \( f_n \) depends only on the homotopy class of \( \gamma \) in the domain of definition.
</div>

<div class="example" markdown="1">
<strong>Example 11.1.3.</strong> The power series \( f(z) = \sum_{n=0}^\infty z^n \) converges on \( D(0,1) \) to \( 1/(1-z) \). The function \( 1/(1-z) \) is the unique analytic continuation of \( f \) to \( \mathbb{C}\setminus\{1\} \). The singularity at \( z = 1 \) is a <em>natural boundary point</em>: the original series cannot be continued across it.
</div>

## 11.2 Monodromy Theorem

<div class="theorem" markdown="1">
<strong>Theorem 11.2.1 (Monodromy Theorem).</strong> Let \( D \) be a simply connected domain and let \( f \) be analytic near some \( z_0 \in D \). If \( f \) can be analytically continued along every path in \( D \) starting at \( z_0 \), then these continuations define a single-valued analytic function on all of \( D \).
</div>

<div class="proof" markdown="1">
<em>Proof (sketch).</em> Since \( D \) is simply connected, any two paths from \( z_0 \) to \( z_1 \) in \( D \) are homotopic. A continuity argument (using compactness of the homotopy \( H: [0,1]^2 \to D \) shows the analytic continuation along homotopic paths gives the same result. Hence the value at \( z_1 \) is well-defined, yielding a global single-valued function. \( \square \)
</div>

The Monodromy Theorem explains in precise terms why branch cuts exist. The logarithm \( \log z \) can be continued along any path in \( \mathbb{C}^* \), but \( \mathbb{C}^* \) is not simply connected: a loop that winds once around the origin belongs to a non-trivial homotopy class, and continuation along such a loop changes the value by \( 2\pi i \). Simple connectivity is exactly the topological condition that prevents this from happening.

<div class="corollary" markdown="1">
<strong>Corollary 11.2.2.</strong> The complex logarithm \( \log z \) cannot be analytically continued to a single-valued function on all of \( \mathbb{C}^<em> \), because \( \mathbb{C}^</em> \) is not simply connected: continuation around a loop encircling 0 changes the value by \( 2\pi i \). On any simply connected subdomain of \( \mathbb{C}^* \), however, a single-valued branch exists (by the Poincaré Lemma).
</div>

## 11.3 Riemann Surfaces

![Riemann surface for √z: two sheets (arg ∈ (−π,π) and arg ∈ (π,3π)) connected along the branch cut z ∈ (−∞,0)](/pics/pmath352/riemann-surface-sqrt.svg)

The multi-valuedness of \( \log z \) and of algebraic functions is not a pathology — it is geometry. A Riemann surface is a space on which a multi-valued function becomes single-valued by "unfolding" the sheets of the multi-valuedness. This is the natural home for functions like \( \log z \), \( z^{1/n} \), and the roots of polynomial equations, and it connects complex analysis to algebraic geometry and topology.

<div class="definition" markdown="1">
<strong>Definition 11.3.1 (Riemann Surface of \( \log z \).</strong> Since \( \log z \) is multi-valued on \( \mathbb{C}^<em> \), we construct its </em>Riemann surface* \( \mathcal{R} \) as an infinitely-sheeted cover:
- Take countably many copies \( S_k \) (\( k \in \mathbb{Z} \) of \( \mathbb{C}^* \), each slit along \( (-\infty, 0) \).
- Glue the upper edge of the slit in \( S_k \) to the lower edge of the slit in \( S_{k+1} \).
- On the resulting surface, define \( \log z = \ln|z| + i\theta \) where \( \theta \in (2\pi k - \pi, 2\pi k + \pi) \) on sheet \( S_k \). This is a single-valued analytic function on \( \mathcal{R} \).
</div>

<div class="note" markdown="1">
<strong>Note.</strong> More generally, for algebraic functions \( w \) satisfying \( P(z, w) = 0 \) (a polynomial relation), one constructs a compact Riemann surface on which \( w \) becomes single-valued. The theory of Riemann surfaces connects complex analysis to topology (via genus and Euler characteristic) and algebraic geometry.
</div>
