---
title: "PMATH 321: Non-Euclidean Geometry"
prof: "Stephen New"
---

# Chapter 1: Euclidean Geometry

## 1.1 The Dot Product

The dot product is the foundational operation of Euclidean geometry, encoding both length and angle through a single algebraic construct. Everything in this chapter flows from its definition.

<div class="definition"><strong>Definition 1.1 (Dot Product):</strong> For vectors \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^n\) we define the dot product of \(\mathbf{u}\) and \(\mathbf{v}\) to be
\[ \mathbf{u} \cdot \mathbf{v} = \sum_{i=1}^{n} u_i v_i. \]</div>

<div class="theorem"><strong>Theorem 1.2 (Properties of the Dot Product):</strong> For all \(\mathbf{u}, \mathbf{v}, \mathbf{w} \in \mathbb{R}^n\) and all \(t \in \mathbb{R}\) we have:
<ol>
<li><strong>(Bilinearity)</strong> \((\mathbf{u} + \mathbf{v}) \cdot \mathbf{w} = \mathbf{u} \cdot \mathbf{w} + \mathbf{v} \cdot \mathbf{w}\) and \((t\mathbf{u}) \cdot \mathbf{v} = t(\mathbf{u} \cdot \mathbf{v})\), and similarly in the second argument.</li>
<li><strong>(Symmetry)</strong> \(\mathbf{u} \cdot \mathbf{v} = \mathbf{v} \cdot \mathbf{u}\).</li>
<li><strong>(Positive Definiteness)</strong> \(\mathbf{u} \cdot \mathbf{u} \geq 0\) with \(\mathbf{u} \cdot \mathbf{u} = 0\) if and only if \(\mathbf{u} = \mathbf{0}\).</li>
</ol></div>

These three properties — bilinearity, symmetry, and positive definiteness — together make the dot product an inner product. It is positive definiteness in particular that distinguishes Euclidean geometry from the Minkowski geometry we will encounter in the hyperboloid model later.

Now that we have an inner product, we can define length in terms of it.

<div class="definition"><strong>Definition 1.3 (Length / Norm):</strong> For a vector \(\mathbf{u} \in \mathbb{R}^n\), we define the length (or norm) of \(\mathbf{u}\) to be
\[ |\mathbf{u}| = \sqrt{\mathbf{u} \cdot \mathbf{u}} = \sqrt{\sum_{i=1}^{n} u_i^2}. \]
We say that \(\mathbf{u}\) is a unit vector when \(|\mathbf{u}| = 1\).</div>

<div class="theorem"><strong>Theorem 1.4 (Properties of Length):</strong> Let \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^n\) and \(t \in \mathbb{R}\). Then:
<ol>
<li><strong>(Positive Definiteness)</strong> \(|\mathbf{u}| \geq 0\) with \(|\mathbf{u}| = 0\) if and only if \(\mathbf{u} = \mathbf{0}\).</li>
<li><strong>(Scaling)</strong> \(|t\mathbf{u}| = |t||\mathbf{u}|\).</li>
<li>\(|\mathbf{u} \pm \mathbf{v}|^2 = |\mathbf{u}|^2 \pm 2(\mathbf{u} \cdot \mathbf{v}) + |\mathbf{v}|^2\).</li>
<li><strong>(Polarization Identities)</strong> \(\mathbf{u} \cdot \mathbf{v} = \frac{1}{2}\left(|\mathbf{u}+\mathbf{v}|^2 - |\mathbf{u}|^2 - |\mathbf{v}|^2\right) = \frac{1}{4}\left(|\mathbf{u}+\mathbf{v}|^2 - |\mathbf{u}-\mathbf{v}|^2\right)\).</li>
<li><strong>(Cauchy-Schwarz Inequality)</strong> \(|\mathbf{u} \cdot \mathbf{v}| \leq |\mathbf{u}||\mathbf{v}|\), with equality if and only if \(\{\mathbf{u}, \mathbf{v}\}\) is linearly dependent.</li>
<li><strong>(Triangle Inequality)</strong> \(|\mathbf{u} + \mathbf{v}| \leq |\mathbf{u}| + |\mathbf{v}|\).</li>
</ol></div>

<div class="proof"><strong>Proof (Part 5 — Cauchy-Schwarz):</strong> If \(\{\mathbf{u}, \mathbf{v}\}\) is linearly dependent, say \(\mathbf{v} = t\mathbf{u}\), then \(|\mathbf{u} \cdot \mathbf{v}| = |t||\mathbf{u}|^2 = |\mathbf{u}||t\mathbf{u}| = |\mathbf{u}||\mathbf{v}|\). If \(\{\mathbf{u}, \mathbf{v}\}\) is linearly independent, then \(\mathbf{u} + t\mathbf{v} \neq \mathbf{0}\) for all \(t \in \mathbb{R}\), and expanding \(|\mathbf{u} + t\mathbf{v}|^2 = |\mathbf{u}|^2 + 2t(\mathbf{u}\cdot\mathbf{v}) + t^2|\mathbf{v}|^2 > 0\) for all \(t\) means its discriminant is negative: \(4(\mathbf{u}\cdot\mathbf{v})^2 - 4|\mathbf{u}|^2|\mathbf{v}|^2 < 0\), giving \(|\mathbf{u}\cdot\mathbf{v}| < |\mathbf{u}||\mathbf{v}|\). Part 6 follows from Part 5 via \(|\mathbf{u}+\mathbf{v}|^2 = |\mathbf{u}|^2 + 2(\mathbf{u}\cdot\mathbf{v}) + |\mathbf{v}|^2 \leq (|\mathbf{u}|+|\mathbf{v}|)^2\).</div>

The Polarization Identities will reappear in a crucial way: they tell us that the dot product is entirely determined by the norm, which will be the key step in classifying isometries algebraically. With length in hand, we can define distance.

<div class="definition"><strong>Definition 1.5 (Euclidean Distance):</strong> For points \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^n\), the Euclidean distance is
\[ d_E(\mathbf{u}, \mathbf{v}) = |\mathbf{v} - \mathbf{u}|. \]</div>

<div class="theorem"><strong>Theorem 1.6 (Metric Properties of Euclidean Distance):</strong> For all \(\mathbf{u}, \mathbf{v}, \mathbf{w} \in \mathbb{R}^n\):
<ol>
<li><strong>(Positive Definiteness)</strong> \(d_E(\mathbf{u},\mathbf{v}) \geq 0\) with equality iff \(\mathbf{u} = \mathbf{v}\).</li>
<li><strong>(Symmetry)</strong> \(d_E(\mathbf{u},\mathbf{v}) = d_E(\mathbf{v},\mathbf{u})\).</li>
<li><strong>(Triangle Inequality)</strong> \(d_E(\mathbf{u},\mathbf{w}) \leq d_E(\mathbf{u},\mathbf{v}) + d_E(\mathbf{v},\mathbf{w})\).</li>
</ol></div>

These three properties define a metric space. A key goal of this course is to construct analogous distance functions on the sphere and the hyperbolic plane, and to verify that they too satisfy these axioms. With distance established, we can now turn to angle, the other fundamental measurement in geometry.

<div class="definition"><strong>Definition 1.7 (Angle):</strong> For nonzero vectors \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^n\), the (unoriented) angle \(\theta(\mathbf{u},\mathbf{v}) \in [0,\pi]\) is defined by
\[ \cos\theta(\mathbf{u},\mathbf{v}) = \frac{\mathbf{u}\cdot\mathbf{v}}{|\mathbf{u}||\mathbf{v}|}. \]
We say \(\mathbf{u}\) and \(\mathbf{v}\) are orthogonal when \(\mathbf{u}\cdot\mathbf{v} = 0\).</div>

Note that Cauchy-Schwarz guarantees the right-hand side lies in \([-1,1]\), making the definition well-formed.

<div class="theorem"><strong>Theorem 1.8 (Properties of Angle):</strong> Let \(\mathbf{0} \neq \mathbf{u}, \mathbf{v} \in \mathbb{R}^n\). Then:
<ol>
<li>\(\theta(\mathbf{u},\mathbf{v}) \in [0,\pi]\), with \(\theta(\mathbf{u},\mathbf{v}) = 0\) iff \(\mathbf{v} = t\mathbf{u}\) for some \(t > 0\), and \(\theta(\mathbf{u},\mathbf{v}) = \pi\) iff \(\mathbf{v} = t\mathbf{u}\) for some \(t < 0\).</li>
<li><strong>(Symmetry)</strong> \(\theta(\mathbf{u},\mathbf{v}) = \theta(\mathbf{v},\mathbf{u})\).</li>
<li><strong>(Scaling)</strong> \(\theta(t\mathbf{u},\mathbf{v}) = \theta(\mathbf{u}, t\mathbf{v}) = \theta(\mathbf{u},\mathbf{v})\) if \(t > 0\), and \(= \pi - \theta(\mathbf{u},\mathbf{v})\) if \(t < 0\).</li>
<li><strong>(Law of Cosines)</strong> \(|\mathbf{v}-\mathbf{u}|^2 = |\mathbf{u}|^2 + |\mathbf{v}|^2 - 2|\mathbf{u}||\mathbf{v}|\cos\theta(\mathbf{u},\mathbf{v})\).</li>
<li><strong>(Pythagoras)</strong> \(\theta(\mathbf{u},\mathbf{v}) = \frac{\pi}{2}\) iff \(|\mathbf{v}-\mathbf{u}|^2 = |\mathbf{u}|^2 + |\mathbf{v}|^2\).</li>
<li><strong>(Trig Ratios)</strong> If \((\mathbf{v}-\mathbf{u})\cdot\mathbf{u} = 0\) then \(\cos\theta(\mathbf{u},\mathbf{v}) = \frac{|\mathbf{u}|}{|\mathbf{v}|}\) and \(\sin\theta(\mathbf{u},\mathbf{v}) = \frac{|\mathbf{v}-\mathbf{u}|}{|\mathbf{v}|}\).</li>
</ol></div>

## 1.2 Orthogonal Projections

Orthogonal projections let us decompose any vector into components parallel and perpendicular to a given subspace. This decomposition is central to everything that follows, including the classification of isometries.

<div class="definition"><strong>Definition 1.9 (Orthogonal Complement):</strong> Let \(U \subseteq \mathbb{R}^n\) be a subspace. The orthogonal complement of \(U\) is
\[ U^{\perp} = \left\{ \mathbf{x} \in \mathbb{R}^n \mid \mathbf{x} \cdot \mathbf{u} = 0 \text{ for all } \mathbf{u} \in U \right\}. \]</div>

<div class="theorem"><strong>Theorem 1.10 (Properties of the Orthogonal Complement):</strong> Let \(U \subseteq \mathbb{R}^n\) be a subspace, \(B \subseteq U\), and \(A \in M_{k \times n}(\mathbb{R})\). Then:
<ol>
<li>\(U^{\perp}\) is a vector space (subspace of \(\mathbb{R}^n\)).</li>
<li>If \(U = \mathrm{Span}(B)\) then \(U^{\perp} = \left\{ \mathbf{x} \in \mathbb{R}^n \mid \mathbf{x}\cdot\mathbf{u} = 0 \text{ for all } \mathbf{u} \in B \right\}\).</li>
<li>\((\mathrm{Row}\, A)^{\perp} = \mathrm{Null}\, A\).</li>
<li>\(\dim U + \dim U^{\perp} = n\).</li>
<li>\(U \oplus U^{\perp} = \mathbb{R}^n\).</li>
<li>\((U^{\perp})^{\perp} = U\).</li>
<li>\((\mathrm{Null}\, A)^{\perp} = \mathrm{Row}\, A\).</li>
</ol></div>

The proof uses the standard technique of showing \(U \cap U^{\perp} = \{\mathbf{0}\}\) (if \(\mathbf{x} \in U \cap U^{\perp}\) then \(\mathbf{x}\cdot\mathbf{x} = 0\) so \(\mathbf{x} = \mathbf{0}\)) and dimension counting.

The direct sum decomposition \(\mathbb{R}^n = U \oplus U^{\perp}\) is the engine behind orthogonal projection. Every vector has a unique splitting into a component inside \(U\) and a component perpendicular to it.

<div class="definition"><strong>Definition 1.11 (Orthogonal Projection):</strong> For a subspace \(U \subseteq \mathbb{R}^n\) and a vector \(\mathbf{x} \in \mathbb{R}^n\), since \(\mathbb{R}^n = U \oplus U^{\perp}\) we write \(\mathbf{x} = \mathbf{u} + \mathbf{v}\) uniquely with \(\mathbf{u} \in U\) and \(\mathbf{v} \in U^{\perp}\). We define
\[ \mathrm{Proj}_U(\mathbf{x}) = \mathbf{u}. \]
When \(U = \mathrm{Span}\{\mathbf{u}\}\) for a nonzero vector \(\mathbf{u}\), we write \(\mathrm{Proj}_{\mathbf{u}}(\mathbf{x})\).</div>

The following theorem gives the geometric interpretation: the projection is literally the closest point.

<div class="theorem"><strong>Theorem 1.12 (Nearest Point):</strong> Let \(U \subseteq \mathbb{R}^n\) be a subspace and \(\mathbf{x} \in \mathbb{R}^n\). Then \(\mathrm{Proj}_U(\mathbf{x})\) is the unique point in \(U\) nearest to \(\mathbf{x}\).</div>

<div class="proof"><strong>Proof:</strong> Write \(\mathbf{x} = \mathbf{u} + \mathbf{v}\) with \(\mathbf{u} = \mathrm{Proj}_U(\mathbf{x})\) and \(\mathbf{v} \in U^{\perp}\). For any \(\mathbf{w} \in U\) with \(\mathbf{w} \neq \mathbf{u}\), since \(\mathbf{v} \perp (\mathbf{w}-\mathbf{u})\) we get \(|\mathbf{x}-\mathbf{w}|^2 = |\mathbf{v}-(\mathbf{w}-\mathbf{u})|^2 = |\mathbf{v}|^2 + |\mathbf{w}-\mathbf{u}|^2 > |\mathbf{v}|^2 = |\mathbf{x}-\mathbf{u}|^2\).</div>

When we have an explicit basis for \(U\), there is a matrix formula for computing the projection.

<div class="theorem"><strong>Theorem 1.14 (Matrix Formula for Projection):</strong> Let \(A \in M_{n\times l}(\mathbb{R})\), \(U = \mathrm{Col}(A)\), and \(\mathbf{x} \in \mathbb{R}^n\). Then:
<ol>
<li>The equation \(A^T A\,\mathbf{t} = A^T \mathbf{x}\) has a solution \(\mathbf{t} \in \mathbb{R}^l\), and for any such solution \(\mathrm{Proj}_U(\mathbf{x}) = A\mathbf{t}\).</li>
<li>If \(\mathrm{rank}(A) = l\) then \(A^T A\) is invertible and \(\mathrm{Proj}_U(\mathbf{x}) = A(A^T A)^{-1} A^T \mathbf{x}\).</li>
</ol></div>

When the columns of \(A\) form an orthogonal or orthonormal basis, the formula simplifies significantly.

<div class="theorem"><strong>Theorem 1.18 (Orthogonal/Orthonormal Bases):</strong> Let \(B = \{\mathbf{u}_1, \ldots, \mathbf{u}_l\}\), \(U = \mathrm{Span}(B)\), and \(\mathbf{x} \in \mathbb{R}^n\).
<ol>
<li>If \(B\) is orthogonal with each \(\mathbf{u}_i \neq \mathbf{0}\) then \(B\) is a basis for \(U\) and \([\mathbf{x}]_B = \left(\frac{\mathbf{x}\cdot\mathbf{u}_1}{|\mathbf{u}_1|^2}, \ldots, \frac{\mathbf{x}\cdot\mathbf{u}_l}{|\mathbf{u}_l|^2}\right)^T\).</li>
<li>If \(B\) is orthonormal then \([\mathbf{x}]_B = (\mathbf{x}\cdot\mathbf{u}_1, \ldots, \mathbf{x}\cdot\mathbf{u}_l)^T\).</li>
</ol></div>

<div class="theorem"><strong>Theorem 1.19 (Projection Formula):</strong> Under the same hypotheses:
<ol>
<li>If \(B\) is orthogonal with each \(\mathbf{u}_i \neq \mathbf{0}\): \(\mathrm{Proj}_U(\mathbf{x}) = \sum_{i=1}^{l} \frac{\mathbf{x}\cdot\mathbf{u}_i}{|\mathbf{u}_i|^2} \mathbf{u}_i\).</li>
<li>If \(B\) is orthonormal: \(\mathrm{Proj}_U(\mathbf{x}) = \sum_{i=1}^{l} (\mathbf{x}\cdot\mathbf{u}_i)\mathbf{u}_i\).</li>
</ol>
In particular, when \(U = \mathrm{Span}\{\mathbf{u}\}\), we have \(\mathrm{Proj}_{\mathbf{u}}(\mathbf{x}) = \frac{\mathbf{x}\cdot\mathbf{u}}{|\mathbf{u}|^2}\mathbf{u}\).</div>

## 1.3 The Cross Product

The cross product is specific to \(\mathbb{R}^3\) and provides a way to produce a vector orthogonal to two given vectors, encoding both orientation and area. It will be essential for computing angles on the sphere and for working with great circles.

<div class="definition"><strong>Definition 1.21 (Cross Product):</strong> For vectors \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^3\), the cross product is
\[ \mathbf{u} \times \mathbf{v} = \left(u_2 v_3 - u_3 v_2,\; u_3 v_1 - u_1 v_3,\; u_1 v_2 - u_2 v_1\right)^T. \]</div>

<div class="theorem"><strong>Theorem 1.22 (Properties of the Cross Product):</strong> For all \(\mathbf{u}, \mathbf{v}, \mathbf{w}, \mathbf{x} \in \mathbb{R}^3\) and \(t \in \mathbb{R}\):
<ol>
<li><strong>(Bilinearity)</strong> \((\mathbf{u}+\mathbf{v})\times\mathbf{w} = \mathbf{u}\times\mathbf{w} + \mathbf{v}\times\mathbf{w}\), etc.</li>
<li><strong>(Skew-Symmetry)</strong> \(\mathbf{u}\times\mathbf{v} = -\mathbf{v}\times\mathbf{u}\).</li>
<li><strong>(Cross with Cross)</strong> \((\mathbf{u}\times\mathbf{v})\times\mathbf{w} = (\mathbf{u}\cdot\mathbf{w})\mathbf{v} - (\mathbf{v}\cdot\mathbf{w})\mathbf{u}\).</li>
<li><strong>(Cross with Dot)</strong> \((\mathbf{u}\times\mathbf{v})\cdot(\mathbf{w}\times\mathbf{x}) = (\mathbf{u}\cdot\mathbf{w})(\mathbf{v}\cdot\mathbf{x}) - (\mathbf{v}\cdot\mathbf{w})(\mathbf{u}\cdot\mathbf{x})\).</li>
<li><strong>(Triple Product)</strong> \((\mathbf{u}\times\mathbf{v})\cdot\mathbf{w} = \mathbf{u}\cdot(\mathbf{v}\times\mathbf{w}) = \det(\mathbf{u},\mathbf{v},\mathbf{w})\).</li>
<li><strong>(Angle Sine)</strong> When \(\mathbf{u},\mathbf{v} \neq \mathbf{0}\): \(\sin\theta(\mathbf{u},\mathbf{v}) = \frac{|\mathbf{u}\times\mathbf{v}|}{|\mathbf{u}||\mathbf{v}|}\).</li>
<li><strong>(Degeneracy)</strong> \(\mathbf{u}\times\mathbf{v} = \mathbf{0}\) iff \(\{\mathbf{u},\mathbf{v}\}\) is linearly dependent.</li>
<li><strong>(Orthogonality)</strong> \((\mathbf{u}\times\mathbf{v})\cdot\mathbf{u} = 0\) and \((\mathbf{u}\times\mathbf{v})\cdot\mathbf{v} = 0\).</li>
<li><strong>(Area of Parallelogram)</strong> \(|\mathbf{u}\times\mathbf{v}|\) equals the area of the parallelogram with vertices \(\mathbf{0}, \mathbf{u}, \mathbf{v}, \mathbf{u}+\mathbf{v}\).</li>
<li><strong>(Right-Hand Rule)</strong> When \(\mathbf{u}\times\mathbf{v} \neq \mathbf{0}\), the vector \(\mathbf{u}\times\mathbf{v}\) points in the direction of the right-hand thumb when the fingers curl from \(\mathbf{u}\) toward \(\mathbf{v}\).</li>
</ol></div>

The triple product \(\det(\mathbf{u},\mathbf{v},\mathbf{w})\) gives the signed volume of the parallelotope spanned by \(\mathbf{u},\mathbf{v},\mathbf{w}\).

The sign of the triple product detects orientation, leading to the following definition.

<div class="definition"><strong>Definition 1.26 (Orientation):</strong> Let \(\{\mathbf{u}, \mathbf{v}, \mathbf{w}\}\) be a basis for \(\mathbb{R}^3\). We say it is <em>positively oriented</em> when \(\det(\mathbf{u},\mathbf{v},\mathbf{w}) > 0\) and <em>negatively oriented</em> when \(\det(\mathbf{u},\mathbf{v},\mathbf{w}) < 0\).</div>

## 1.4 Geometry in the Euclidean Plane

In the Euclidean plane \(\mathbb{R}^2\), angle, line, and circle theory come together into classical geometry.

<div class="definition"><strong>Definition 1.29 (Oriented Angle in \(\mathbb{R}^2\)):</strong> For \(\mathbf{0} \neq \mathbf{u} \in \mathbb{R}^2\), the oriented angle of \(\mathbf{u}\) is the unique \(\theta_o \in \mathbb{R}/2\pi\) such that \(\mathbf{u} = |\mathbf{u}|(\cos\theta_o, \sin\theta_o)\). For nonzero \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^2\), the oriented angle from \(\mathbf{u}\) to \(\mathbf{v}\) is \(\theta_o(\mathbf{u},\mathbf{v}) = \theta_o(\mathbf{v}) - \theta_o(\mathbf{u})\).</div>

<div class="theorem"><strong>Theorem 1.30:</strong> For \(\mathbf{0} \neq \mathbf{u}, \mathbf{v} \in \mathbb{R}^2\), with \(\theta_o = \theta_o(\mathbf{u},\mathbf{v})\):
\[ \cos\theta_o = \frac{\mathbf{u}\cdot\mathbf{v}}{|\mathbf{u}||\mathbf{v}|}, \qquad \sin\theta_o = \frac{u_1 v_2 - u_2 v_1}{|\mathbf{u}||\mathbf{v}|} = \frac{\det(\mathbf{u},\mathbf{v})}{|\mathbf{u}||\mathbf{v}|}. \]</div>

<div class="theorem"><strong>Theorem 1.32 (Circumference and Area):</strong> An arc subtending angle \(\theta\) at the centre of a circle of radius \(r\) has length \(L = r\theta\). In particular, the circumference is \(2\pi r\). A sector subtending angle \(\theta\) has area \(A = \frac{1}{2}r^2\theta\); the area of the full disc is \(\pi r^2\).</div>

### Triangle Geometry

With the tools of angle and distance established, we can now develop the classical theory of triangles. The central result is one that will break down in both spherical and hyperbolic geometry.

<div class="theorem"><strong>Theorem 1.46 (Sum of Angles):</strong> The sum of the interior angles in any triangle in \(\mathbb{R}^2\) is equal to \(\pi\).</div>

This is a fundamental property distinguishing Euclidean geometry from both spherical and hyperbolic geometry, where the angle sum differs from \(\pi\).

<div class="theorem"><strong>Corollary 1.50 (Sine Law):</strong> Let \([u,v,w]\) be an ordered triangle in \(\mathbb{R}^2\) with side lengths \(a = |w-v|\), \(b = |u-w|\), \(c = |v-u|\) and interior angles \(\alpha, \beta, \gamma\). Then
\[ \frac{\sin\alpha}{a} = \frac{\sin\beta}{b} = \frac{\sin\gamma}{c}. \]</div>

<div class="theorem"><strong>Corollary 1.51 (Area of a Triangle):</strong> The area of triangle \([u,v,w]\) in \(\mathbb{R}^2\) is
\[ A = \frac{1}{2}\left|\det(u,v) + \det(v,w) + \det(w,u)\right|. \]</div>

<div class="theorem"><strong>Theorem 1.53 (Law of Cosines):</strong> For an ordered triangle \([u,v,w]\) in \(\mathbb{R}^2\):
\[ \cos\alpha = \frac{b^2 + c^2 - a^2}{2bc}, \quad \cos\beta = \frac{c^2 + a^2 - b^2}{2ca}, \quad \cos\gamma = \frac{a^2 + b^2 - c^2}{2ab}. \]</div>

### Triangle Centres

Beyond the basic metric properties of triangles, classical Euclidean geometry is rich with special points associated to each triangle — centres defined by different geometric concurrence conditions.

<div class="theorem"><strong>Theorem 1.58 (Centroid):</strong> The three medians of a triangle (lines from each vertex to the midpoint of the opposite side) meet at the centroid \(g = \frac{1}{3}(u+v+w)\). The centroid lies two-thirds of the way along each median from vertex to midpoint.</div>

<div class="theorem"><strong>Theorem 1.61 (Circumcentre):</strong> The three perpendicular bisectors of the edges of a triangle meet at the circumcentre \(o\), which is equidistant from all three vertices. It is the centre of the circumscribed circle.</div>

<div class="theorem"><strong>Theorem 1.63 (Orthocentre and Euler Line):</strong> The three altitudes of a triangle meet at the orthocentre \(h\). The circumcentre \(o\), centroid \(g\), and orthocentre \(h\) are collinear (lying on the Euler line), with \(g\) lying one-third of the way from \(o\) to \(h\).</div>

<div class="proof"><strong>Proof sketch:</strong> Define \(h = 3g - 2o\). Then \(h - w = (3g - w) - 2o = (u+v) - 2o\). Since \(o\) lies on the perpendicular bisector of \([u,v]\), we have \(2o\cdot(v-u) = (u+v)\cdot(v-u)\), so \((h-w)\cdot(v-u) = (u+v)\cdot(v-u) - 2o\cdot(v-u) = 0\), confirming \(h\) lies on the altitude from \(w\).</div>

The Euler line is a striking example of how the basic metric structure of a triangle coerces several independently defined points into a single line. The incentre, defined by angle bisectors rather than side bisectors, does not generally lie on the Euler line.

<div class="theorem"><strong>Theorem 1.70 (Incentre):</strong> The three internal angle bisectors of a triangle meet at the incentre \(i\), which is equidistant from all three sides. It is the centre of the inscribed circle.</div>

## 1.5 Isometries of Euclidean Space

An isometry is a distance-preserving bijection. Understanding isometries is the unifying theme of the entire course — each geometry is characterized by its group of isometries.

<div class="definition"><strong>Definition 1.72 (Orthogonal Matrix):</strong> A matrix \(A \in M_n(\mathbb{R})\) is orthogonal when \(A^T A = I\). The set of all orthogonal \(n\times n\) matrices is \(O_n(\mathbb{R})\).</div>

Orthogonal matrices are precisely those that preserve the dot product: \((A\mathbf{u})\cdot(A\mathbf{v}) = \mathbf{u}^T A^T A \mathbf{v} = \mathbf{u}\cdot\mathbf{v}\). Equivalently, their columns form an orthonormal basis. This connects algebraically to the geometric notion of distance preservation.

<div class="definition"><strong>Definition 1.73 (Isometry):</strong> An isometry on \(\mathbb{R}^n\) is an invertible map \(S: \mathbb{R}^n \to \mathbb{R}^n\) such that \(|S(\mathbf{x}) - S(\mathbf{y})| = |\mathbf{x} - \mathbf{y}|\) for all \(\mathbf{x}, \mathbf{y}\). The set of all isometries is \(\mathrm{Isom}(\mathbb{R}^n)\).</div>

<div class="theorem"><strong>Theorem 1.74:</strong> \(\mathrm{Isom}(\mathbb{R}^n)\) is a group under composition.</div>

The following theorem is the algebraic backbone of the classification: every isometry is rigid, affine, and built from an orthogonal linear part and a translation.

<div class="theorem"><strong>Theorem 1.79 (Algebraic Classification of Isometries):</strong> A map \(S: \mathbb{R}^n \to \mathbb{R}^n\) preserves distance if and only if \(S(\mathbf{x}) = A\mathbf{x} + \mathbf{b}\) for some \(A \in O_n(\mathbb{R})\) and \(\mathbf{b} \in \mathbb{R}^n\).</div>

<div class="proof"><strong>Proof:</strong> Clearly any such map is an isometry. Conversely, if \(S\) is an isometry let \(\mathbf{b} = S(\mathbf{0})\) and \(L(\mathbf{x}) = S(\mathbf{x}) - \mathbf{b}\). Then \(L(\mathbf{0}) = \mathbf{0}\) and \(|L(\mathbf{x})| = |S(\mathbf{x}) - S(\mathbf{0})| = |\mathbf{x}|\). By the Polarization Identity, \(L(\mathbf{x})\cdot L(\mathbf{y}) = \mathbf{x}\cdot\mathbf{y}\) for all \(\mathbf{x}, \mathbf{y}\). In particular the images \(L(\mathbf{e}_1), \ldots, L(\mathbf{e}_n)\) form an orthonormal basis, so the matrix \(A = (L(\mathbf{e}_1), \ldots, L(\mathbf{e}_n))\) satisfies \(A^T A = I\) and \(L(\mathbf{x}) = A\mathbf{x}\).</div>

This is where the Polarization Identity pays off: knowing that \(L\) preserves lengths allows us to recover that it preserves dot products, and dot products determine the linear structure completely. The determinant of the orthogonal part \(A\) is \(\pm 1\), giving rise to a natural dichotomy.

<div class="definition"><strong>Definition 1.81 (Orientation-Preserving/Reversing):</strong> For \(S(\mathbf{x}) = A\mathbf{x} + \mathbf{b}\), since \(A^T A = I\) we have \(\det(A) = \pm 1\). We say \(S\) preserves orientation when \(\det(A) = 1\) and reverses orientation when \(\det(A) = -1\).</div>

### Isometries in \(\mathbb{R}^2\)

The isometries of the plane are:
- **Identity**: \(I(x) = x\).
- **Translation**: \(T_u(x) = x + u\).
- **Rotation** about \(p\) by \(\theta\): \(R_{p,\theta}(x) = p + R_\theta(x-p)\) where \(R_\theta = \begin{pmatrix}\cos\theta & -\sin\theta \\ \sin\theta & \cos\theta\end{pmatrix}\).
- **Reflection** in line \(L\) through \(p\) perpendicular to \(u\): \(F_L(x) = x - \frac{2(x-p)\cdot u}{|u|^2}u\).
- **Glide reflection**: \(G_{u,L} = T_u \circ F_L = F_L \circ T_u\) when \(L\) is parallel to \(u\).

Translations, rotations preserve orientation; reflections, glide reflections reverse it.

The next theorem reveals that reflections are in some sense the "atoms" of planar isometries — every isometry is a product of reflections. Understanding how reflections compose gives us all the others.

<div class="theorem"><strong>Theorem 1.83 (Composites of Reflections):</strong> Let \(L\) and \(M\) be lines in \(\mathbb{R}^2\).
<ol>
<li>If \(L = M\) then \(F_M F_L = I\).</li>
<li>If \(L \parallel M\) then \(F_M F_L = T_{2u}\) where \(u\) is the vector from \(L\) orthogonally to \(M\).</li>
<li>If \(L \cap M = \{p\}\) then \(F_M F_L = R_{p, 2\theta}\) where \(\theta\) is the angle from \(L\) counterclockwise to \(M\).</li>
</ol></div>

<div class="theorem"><strong>Theorem 1.84 (Geometric Classification of Isometries on \(\mathbb{R}^2\)):</strong> Every isometry on \(\mathbb{R}^2\) is one of: \(I\), \(T_u\), \(R_{p,\theta}\), \(F_L\), or \(G_{u,L}\).</div>

### Isometries in \(\mathbb{R}^3\)

In \(\mathbb{R}^3\) the full list expands:

<div class="theorem"><strong>Theorem 1.86 (Geometric Classification of Isometries on \(\mathbb{R}^3\)):</strong> Every isometry on \(\mathbb{R}^3\) is one of: the identity \(I\), a translation \(T_u\), a rotation \(R_{p,u,\theta}\), a twist \(W_{p,u,\theta}\), a reflection \(F_P\), a glide reflection \(G_{u,P}\), or a rotary reflection \(H_{p,u,\theta}\).</div>

The new entry in dimension three compared to dimension two is the twist (also called a screw motion): a simultaneous rotation about an axis and translation along that same axis. This has no two-dimensional counterpart, illustrating how the classification of isometries is genuinely sensitive to the dimension.

---

# Chapter 2: Spherical Geometry

## 2.1 The Sphere and Spherical Distance

Spherical geometry lives on the unit sphere \(S^2\), where "straight lines" become great circles and angles sum to more than \(\pi\) in a triangle. This is the simplest model of a non-Euclidean geometry with positive curvature.

Having developed the full toolkit of Euclidean geometry, we now ask: what happens when we replace the flat plane \(\mathbb{R}^2\) with a curved surface? The sphere \(S^2 \subset \mathbb{R}^3\) is the most natural first candidate, and we already have all the tools — dot products, cross products, projections — to work with it.

<div class="definition"><strong>Definition 2.1 (Unit Sphere and Spherical Distance):</strong> The unit sphere is
\[ S^2 = \left\{ \mathbf{u} \in \mathbb{R}^3 \mid |\mathbf{u}| = 1 \right\}. \]
Points \(\pm\mathbf{u}\) are called antipodal. For \(\mathbf{u}, \mathbf{v} \in S^2\), the spherical distance is
\[ d_S(\mathbf{u},\mathbf{v}) = \theta(\mathbf{u},\mathbf{v}) = \cos^{-1}(\mathbf{u}\cdot\mathbf{v}). \]</div>

The spherical distance between two points is simply the angle between the corresponding unit vectors — it measures how far apart they are along the surface of the sphere, not through the ambient space.

<div class="theorem"><strong>Theorem 2.2 (Euclidean and Spherical Distance):</strong> For \(\mathbf{u}, \mathbf{v} \in S^2\), the spherical and Euclidean distances determine each other via
\[ d_E(\mathbf{u},\mathbf{v}) = \sqrt{2 - 2\cos d_S(\mathbf{u},\mathbf{v})}, \qquad d_S(\mathbf{u},\mathbf{v}) = \cos^{-1}\!\left(1 - \tfrac{1}{2}d_E(\mathbf{u},\mathbf{v})^2\right). \]</div>

This tells us the two distances are monotonically related — one can be recovered from the other — but they are not proportional. Spherical distance is not simply Euclidean distance in disguise.

<div class="theorem"><strong>Theorem 2.3 (Metric Properties of Spherical Distance):</strong> \(d_S\) is a metric on \(S^2\): it satisfies positive definiteness (with \(d_S(\mathbf{u},\mathbf{v}) \in [0,\pi]\), \(= 0\) iff \(\mathbf{u}=\mathbf{v}\), \(= \pi\) iff \(\mathbf{u}=-\mathbf{v}\)), symmetry, and the triangle inequality.</div>

<div class="proof"><strong>Proof of Triangle Inequality:</strong> Using the cross-product identity \((\mathbf{u}\times\mathbf{v})\cdot(\mathbf{v}\times\mathbf{w}) = (\mathbf{u}\cdot\mathbf{v})(\mathbf{v}\cdot\mathbf{w}) - (\mathbf{u}\cdot\mathbf{w})(\mathbf{v}\cdot\mathbf{v})\) and the Cauchy-Schwarz inequality \(|(\mathbf{u}\times\mathbf{v})\cdot(\mathbf{v}\times\mathbf{w})| \leq |\mathbf{u}\times\mathbf{v}||\mathbf{v}\times\mathbf{w}|\), one shows \(\cos(\theta(\mathbf{u},\mathbf{v}) + \theta(\mathbf{v},\mathbf{w})) \leq \mathbf{u}\cdot\mathbf{w} = \cos\theta(\mathbf{u},\mathbf{w})\). Since \(\cos\) is decreasing, the inequality follows.</div>

<div class="theorem"><strong>Theorem 2.4 (Spherical Area):</strong> The area of the portion of \(S^2\) between two parallel planes at Euclidean distance \(\Delta\) apart is \(2\pi\Delta\). In particular, the total surface area of \(S^2\) is \(4\pi\).</div>

<div class="proof"><strong>Proof:</strong> After rotating, take the planes as \(x=a\) and \(x=b\). Using the surface of revolution formula with \(f(x) = \sqrt{1-x^2}\):
\[ A = \int_a^b 2\pi\sqrt{1-x^2}\sqrt{1 + \frac{x^2}{1-x^2}}\,dx = \int_a^b 2\pi\,dx = 2\pi(b-a). \]</div>

This is Archimedes' hat-box theorem: the sphere and the enclosing cylinder have the same lateral area. The elegant cancellation in the integrand — the sphere bows outward exactly as the cap shrinks — is what makes the area formula so clean.

## 2.2 Spherical Circles and Lines

<div class="theorem"><strong>Theorem 2.7 (Circumference and Area of Spherical Circles):</strong> For \(\mathbf{u} \in S^2\) and \(r \in [0,\pi]\), the spherical circle \(C(\mathbf{u},r)\) has circumference \(L = 2\pi\sin r\) and the spherical disc \(D(\mathbf{u},r)\) has area \(A = 2\pi(1 - \cos r)\).</div>

Note the contrast with Euclidean geometry: the circumference is \(2\pi\sin r \leq 2\pi r\), reflecting the positive curvature of the sphere.

Now that we have a notion of distance on \(S^2\), we can ask: what plays the role of straight lines? In Euclidean geometry, lines are geodesics — shortest-distance curves. On the sphere, the shortest paths between two points run along great circles.

<div class="definition"><strong>Definition 2.8 (Spherical Line / Great Circle):</strong> A spherical line (or great circle) in \(S^2\) is a set of the form \(L = S^2 \cap P\) where \(P\) is a plane through the origin. The unit normal vectors \(\pm\mathbf{u}\) to \(P\) are called the poles of \(L\). For \(\mathbf{u} \in S^2\), the line with poles \(\pm\mathbf{u}\) is
\[ L_\mathbf{u} = \left\{ \mathbf{x} \in S^2 \mid \mathbf{x}\cdot\mathbf{u} = 0 \right\} = C\!\left(\mathbf{u}, \tfrac{\pi}{2}\right). \]
Two lines are orthogonal when their poles are orthogonal.</div>

<div class="theorem"><strong>Theorem 2.9 (Properties of Spherical Lines):</strong>
<ol>
<li>Given \(\mathbf{u}, \mathbf{v} \in S^2\) with \(\mathbf{v} \neq \pm\mathbf{u}\), there is a unique line through \(\mathbf{u}\) and \(\mathbf{v}\), namely \(L_\mathbf{w}\) with \(\mathbf{w} = \pm\frac{\mathbf{u}\times\mathbf{v}}{|\mathbf{u}\times\mathbf{v}|}\).</li>
<li>Any two distinct lines in \(S^2\) intersect in exactly two antipodal points.</li>
<li>Given \(\mathbf{u} \in S^2\) and a line \(L\) with \(L \neq L_\mathbf{u}\), there is a unique line through \(\mathbf{u}\) perpendicular to \(L\).</li>
<li>Given two distinct lines, there is a unique line perpendicular to both.</li>
</ol></div>

Part (2) is a key departure from Euclidean geometry: there are no parallel lines on the sphere. Every pair of great circles meets, just as every pair of longitudes meets at the poles. The "parallel postulate" fails on \(S^2\), which is what makes spherical geometry non-Euclidean.

## 2.3 Oriented Angles on \(S^2\)

To measure angles between curves on the sphere, we need to work in the tangent space at each point — the natural home for directional information.

<div class="definition"><strong>Definition 2.10 (Tangent Space):</strong> For \(\mathbf{u} \in S^2\), the tangent space at \(\mathbf{u}\) is
\[ T_\mathbf{u} = \left\{ \mathbf{x} \in \mathbb{R}^3 \mid \mathbf{x}\cdot\mathbf{u} = 0 \right\}. \]</div>

The tangent space \(T_\mathbf{u}\) is simply the plane in \(\mathbb{R}^3\) perpendicular to \(\mathbf{u}\) through the origin — it inherits the full inner product structure from \(\mathbb{R}^3\), which lets us measure angles between tangent vectors using the same formula as in \(\mathbb{R}^2\).

<div class="theorem"><strong>Theorem 2.12 (Angle Formula on \(S^2\)):</strong> For \(\mathbf{u} \in S^2\) and \(\mathbf{0} \neq \mathbf{v}, \mathbf{w} \in T_\mathbf{u}\):
\[ \cos\theta_o(\mathbf{v},\mathbf{w}) = \frac{\mathbf{v}\cdot\mathbf{w}}{|\mathbf{v}||\mathbf{w}|}, \qquad \sin\theta_o(\mathbf{v},\mathbf{w}) = \frac{\det(\mathbf{u},\mathbf{v},\mathbf{w})}{|\mathbf{v}||\mathbf{w}|}. \]</div>

<div class="definition"><strong>Definition 2.14 (Spherical Line Segment and Tangent Vector):</strong> For \(\mathbf{u}, \mathbf{v} \in S^2\) with \(\mathbf{v} \neq \pm\mathbf{u}\), the spherical line segment \([\mathbf{u},\mathbf{v}]\) is the shorter arc of the great circle from \(\mathbf{u}\) to \(\mathbf{v}\). The unit tangent vector from \(\mathbf{u}\) toward \(\mathbf{v}\) is
\[ \vec{\mathbf{u}\mathbf{v}} = \frac{\mathbf{v} - (\mathbf{u}\cdot\mathbf{v})\mathbf{u}}{|\mathbf{u}\times\mathbf{v}|}. \]</div>

The tangent vector formula is just the normalized version of the component of \(\mathbf{v}\) perpendicular to \(\mathbf{u}\) — geometrically, it is the direction you would initially travel along the great circle from \(\mathbf{u}\) toward \(\mathbf{v}\).

## 2.4 Spherical Triangles

With a notion of line segments and angles on \(S^2\), we can now define and study triangles. Spherical triangle geometry is both richer and more symmetric than its Euclidean counterpart.

<div class="definition"><strong>Definition 2.16 (Spherical Triangle):</strong> A non-degenerate spherical triangle is determined by three linearly independent points \(\mathbf{u}, \mathbf{v}, \mathbf{w} \in S^2\) (i.e. \(\det(\mathbf{u},\mathbf{v},\mathbf{w}) \neq 0\)). The edge lengths are \(a = d_S(\mathbf{v},\mathbf{w})\), \(b = d_S(\mathbf{w},\mathbf{u})\), \(c = d_S(\mathbf{u},\mathbf{v})\), and the interior angles are \(\alpha = \angle vuw\), \(\beta = \angle wvu\), \(\gamma = \angle uvw\).</div>

<div class="theorem"><strong>Theorem 2.18 (Area of Spherical Triangles — Girard's Theorem):</strong> The area of a positively oriented spherical triangle \([\mathbf{u},\mathbf{v},\mathbf{w}]\) with interior angles \(\alpha, \beta, \gamma\) is
\[ A = (\alpha + \beta + \gamma) - \pi. \]
This quantity \(\alpha + \beta + \gamma - \pi > 0\) is the spherical excess of the triangle.</div>

<div class="proof"><strong>Proof:</strong> Let \(W_\alpha\) be the double wedge whose boundary is the great circle through \(\mathbf{v}\) and \(\mathbf{w}\) and which contains \(\mathbf{u}\). Its area is \(4\alpha\). Similarly \(W_\beta\) has area \(4\beta\) and \(W_\gamma\) has area \(4\gamma\). Counting carefully: the sphere has area \(4\pi\), and shading all three double wedges covers the triangle \([\mathbf{u},\mathbf{v},\mathbf{w}]\) and its antipodal image three times each and the rest of the sphere once. So \(4\alpha + 4\beta + 4\gamma = 4\pi + 4T\), giving \(T = \alpha+\beta+\gamma - \pi\).</div>

This is one of the most beautiful theorems in geometry: the area of a spherical triangle is completely determined by its angle sum, with no reference to side lengths.

The next construction introduces a remarkable symmetry unique to spherical geometry: the polar triangle, which swaps the roles of sides and angles.

<div class="definition"><strong>Definition 2.19 (Polar Triangle):</strong> For an ordered triangle \([\mathbf{u},\mathbf{v},\mathbf{w}]\), the polar triangle is \([\mathbf{u}', \mathbf{v}', \mathbf{w}']\) where
\[ \mathbf{u}' = \frac{\mathbf{v}\times\mathbf{w}}{|\mathbf{v}\times\mathbf{w}|}, \quad \mathbf{v}' = \frac{\mathbf{w}\times\mathbf{u}}{|\mathbf{w}\times\mathbf{u}|}, \quad \mathbf{w}' = \frac{\mathbf{u}\times\mathbf{v}}{|\mathbf{u}\times\mathbf{v}|}. \]</div>

<div class="theorem"><strong>Theorem 2.20 (The Polar Triangle):</strong> Let \([\mathbf{u},\mathbf{v},\mathbf{w}]\) be a positively oriented triangle with polar triangle \([\mathbf{u}',\mathbf{v}',\mathbf{w}']\). Then:
<ol>
<li>The polar triangle of the polar triangle is the original: \([\mathbf{u}'', \mathbf{v}'', \mathbf{w}''] = [\mathbf{u},\mathbf{v},\mathbf{w}]\).</li>
<li>The polar triangle is also positively oriented.</li>
<li>The side lengths of the polar triangle are \(a' = \pi - \alpha\), \(b' = \pi - \beta\), \(c' = \pi - \gamma\).</li>
<li>The angles of the polar triangle are \(\alpha' = \pi - a\), \(\beta' = \pi - b\), \(\gamma' = \pi - c\).</li>
</ol></div>

The polar triangle is a duality: sides and angles exchange roles up to supplementation. This allows us to derive the Second Law of Cosines from the First.

<div class="theorem"><strong>Theorem 2.22 (Spherical Sine Law):</strong> For any ordered spherical triangle \([\mathbf{u},\mathbf{v},\mathbf{w}]\):
\[ \frac{\sin a}{\sin\alpha} = \frac{\sin b}{\sin\beta} = \frac{\sin c}{\sin\gamma}. \]</div>

<div class="proof"><strong>Proof:</strong> We have \(\sin\alpha = \frac{|\det(\mathbf{u},\mathbf{v},\mathbf{w})|}{|\mathbf{u}\times\mathbf{v}||\mathbf{u}\times\mathbf{w}|} = \frac{|\det(\mathbf{u},\mathbf{v},\mathbf{w})|}{\sin c \sin b}\). The result follows by symmetry.</div>

<div class="theorem"><strong>Theorem 2.23 (First Law of Cosines):</strong> For any ordered spherical triangle:
\[ \cos\alpha = \frac{\cos a - \cos b\cos c}{\sin b\sin c}, \quad \cos\beta = \frac{\cos b - \cos a\cos c}{\sin a\sin c}, \quad \cos\gamma = \frac{\cos c - \cos a\cos b}{\sin a\sin b}. \]</div>

<div class="theorem"><strong>Theorem 2.25 (Second Law of Cosines):</strong> For any ordered spherical triangle:
\[ \cos a = \frac{\cos\alpha + \cos\beta\cos\gamma}{\sin\beta\sin\gamma}, \quad \cos b = \frac{\cos\beta + \cos\gamma\cos\alpha}{\sin\gamma\sin\alpha}, \quad \cos c = \frac{\cos\gamma + \cos\alpha\cos\beta}{\sin\alpha\sin\beta}. \]</div>

The Second Law is derived by applying the First Law to the polar triangle using the duality \(a \leftrightarrow \pi - \alpha'\), etc.

<div class="theorem"><strong>Corollary 2.24 (SSS and SAS):</strong> (1) Knowing the three side lengths determines the three angles. (2) Knowing two side lengths and the included angle determines the remaining side and angles.</div>

<div class="theorem"><strong>Corollary 2.26 (AAA and ASA):</strong> In spherical geometry (unlike Euclidean geometry), knowing all three angles determines the side lengths! This is because the Second Law of Cosines expresses side lengths in terms of angles.</div>

The AAA congruence corollary captures one of the most striking differences between spherical and Euclidean geometry: there is no concept of similar-but-not-congruent triangles on the sphere. Two spherical triangles with the same angles are necessarily the same size.

## 2.5 Isometries on \(S^2\)

Just as isometries of \(\mathbb{R}^n\) were characterized as maps of the form \(A\mathbf{x} + \mathbf{b}\), isometries of \(S^2\) have a clean algebraic description — and the ambient \(\mathbb{R}^3\) makes it transparent.

<div class="theorem"><strong>Theorem 2.29 (Algebraic Classification of Isometries on \(S^2\)):</strong> Every orthogonal map on \(\mathbb{R}^3\) restricts to an isometry on \(S^2\), and every isometry on \(S^2\) extends to an orthogonal map on \(\mathbb{R}^3\). Thus the isometry group of \(S^2\) is identified with \(O_3(\mathbb{R})\).</div>

<div class="proof"><strong>Proof sketch:</strong> An orthogonal map preserves Euclidean distance, hence spherical distance. Conversely, an isometry on \(S^2\) preserves the dot product by the Polarization Identity, so if we extend it by linearity to \(\mathbb{R}^3\) we get an orthogonal map.</div>

<div class="definition"><strong>Definition 2.31 (Specific Isometries):</strong>
<ul>
<li>The <em>antipodal map</em> \(N: S^2 \to S^2\) is given by \(N(\mathbf{x}) = -\mathbf{x}\), corresponding to the matrix \(-I\).</li>
<li>The <em>reflection</em> \(F_\mathbf{u}: S^2 \to S^2\) in the line \(L_\mathbf{u}\) is the restriction of the orthogonal reflection \(F_\mathbf{u}(\mathbf{x}) = \mathbf{x} - 2(\mathbf{x}\cdot\mathbf{u})\mathbf{u} = (I - 2\mathbf{u}\mathbf{u}^T)\mathbf{x}\).</li>
<li>The <em>rotation</em> \(R_{\mathbf{u},\theta}: S^2 \to S^2\) rotates about \(\mathbf{u}\) by angle \(\theta\).</li>
</ul></div>

<div class="theorem"><strong>Theorem 2.33 (Product of Two Reflections):</strong> For \(\mathbf{u} \in S^2\) and \(\mathbf{v}, \mathbf{w} \in T_\mathbf{u}\),
\[ F_\mathbf{w} F_\mathbf{v} = R_{\mathbf{u}, 2\theta_o(\mathbf{v},\mathbf{w})}. \]
The composite of two reflections in lines meeting at \(\mathbf{u}\) is a rotation about \(\mathbf{u}\) by twice the angle between the lines.</div>

This mirrors the Euclidean Theorem 1.83: the composition law for reflections has the same form on \(S^2\) as in \(\mathbb{R}^2\). This is not a coincidence — it reflects the local flatness of the sphere (at any point, the geometry looks Euclidean to first order).

<div class="theorem"><strong>Theorem 2.36 (Congruent Triangles):</strong> Given ordered triangles \([\mathbf{u},\mathbf{v},\mathbf{w}]\) and \([\mathbf{u}',\mathbf{v}',\mathbf{w}']\) in \(S^2\) with \(a = a'\), \(b = b'\), \(c = c'\), there exists a unique isometry \(F: S^2 \to S^2\) with \(F(\mathbf{u}) = \mathbf{u}'\), \(F(\mathbf{v}) = \mathbf{v}'\), \(F(\mathbf{w}) = \mathbf{w}'\). The isometry is constructed as a composite of at most three reflections in perpendicular bisectors.</div>

<div class="theorem"><strong>Theorem 2.39 (Geometric Classification of Isometries on \(S^2\)):</strong> Every isometry on \(S^2\) is either a rotation, a reflection, or a rotary inversion (the composite \(N R_{\mathbf{u},\theta} = -R_{\mathbf{u},\theta}\)).</div>

## 2.6 Projections of \(S^2\)

Several important projections map parts of \(S^2\) to flat regions. Each has distinctive properties.

No single projection can faithfully represent all properties of the sphere on a flat map — there is always some distortion. The choice of projection depends on which property one wishes to preserve: area, angle, or straightness of geodesics.

**Orthogonal Projection:** The map \(\phi: H \to D\) from the upper hemisphere \(H\) to the unit disc \(D\) given by \(\phi(x,y,z) = (x,y)\). The inverse is \(\psi(u,v) = (u, v, \sqrt{1-u^2-v^2})\).

**Lambert Cylindrical Equal-Area Projection:** The map \(\phi: S \to R\) (where \(S = S^2 \setminus \{\pm(0,0,1)\}\) and \(R\) is the rectangle \([0,2\pi)\times[-1,1]\)) given by projecting radially outward from the \(z\)-axis to the cylinder \(x^2+y^2=1\), then unrolling. The formula is \(\phi\!\left(\sqrt{1-z^2}\cos\theta, \sqrt{1-z^2}\sin\theta, z\right) = (\theta, z)\).

<div class="theorem"><strong>Theorem 2.45 (Lambert Preserves Area):</strong> The Lambert cylindrical equal-area projection preserves area.</div>

**Gnomonic Projection:** The map \(\phi: H \to \mathbb{R}^2\) (where \(H\) is the open upper hemisphere) given by projecting radially from the origin to the plane \(z = 1\):
\[ \phi(x,y,z) = \left(\frac{x}{z}, \frac{y}{z}\right). \]

<div class="theorem"><strong>Theorem 2.49:</strong> The gnomonic projection maps great circles (intersected with \(H\)) to straight lines in \(\mathbb{R}^2\).</div>

This is why the gnomonic projection is used in navigation charts where straight-line paths represent great-circle routes.

**Stereographic Projection:** The map \(\phi: S^2 \setminus \{(0,0,1)\} \to \mathbb{R}^2\) given by projecting through the north pole \((0,0,1)\) to the equatorial plane \(z=0\):
\[ \phi(x,y,z) = \left(\frac{x}{1-z}, \frac{y}{1-z}\right), \qquad \psi(u,v) = \left(\frac{2u}{u^2+v^2+1}, \frac{2v}{u^2+v^2+1}, \frac{u^2+v^2-1}{u^2+v^2+1}\right). \]

<div class="theorem"><strong>Theorem 2.54:</strong> The inverse stereographic projection \(\psi: \mathbb{R}^2 \to S^2\) is a local scaling near \((u,v)\) of scaling factor \(c = \frac{2}{u^2+v^2+1}\). In particular, stereographic projection is conformal (angle-preserving).</div>

<div class="theorem"><strong>Theorem 2.55:</strong> Stereographic projection maps circles through \((0,0,1)\) (minus that point) to lines in \(\mathbb{R}^2\), and maps circles not through \((0,0,1)\) to circles in \(\mathbb{R}^2\).</div>

The conformality of stereographic projection means it is angle-faithful but not area-faithful. It will reappear in the Poincaré disc model: the circle inversion that defines hyperbolic reflections is a close relative of stereographic projection, and shares the same conformality property.

---

# Chapter 3: Projective Geometry

## 3.1 The Projective Plane

Projective geometry arose from the study of perspective drawing. In a perspective drawing, parallel lines appear to meet at a "vanishing point" on the horizon. Projective geometry makes this rigorous by adding "points at infinity" where parallel lines meet.

<div class="definition"><strong>Definition 3.4 (The Real Projective Plane):</strong> The real projective plane \(\mathbb{P}^2\) is the set of lines through the origin in \(\mathbb{R}^3\). Given \(\mathbf{0} \neq \mathbf{x} \in \mathbb{R}^3\), we let \([\mathbf{x}] = \mathrm{Span}\{\mathbf{x}\}\) denote the corresponding point in \(\mathbb{P}^2\). The projective distance between points \([\mathbf{x}], [\mathbf{y}] \in \mathbb{P}^2\) is
\[ d_P([\mathbf{x}], [\mathbf{y}]) = \min\!\left(\theta(\mathbf{x},\mathbf{y}),\, \pi - \theta(\mathbf{x},\mathbf{y})\right) = \cos^{-1}\!\frac{|\mathbf{x}\cdot\mathbf{y}|}{|\mathbf{x}||\mathbf{y}|} = \sin^{-1}\!\frac{|\mathbf{x}\times\mathbf{y}|}{|\mathbf{x}||\mathbf{y}|}. \]</div>

We can identify \(\mathbb{P}^2\) with the set of antipodal pairs \(\{\pm\mathbf{x}\}\) in \(S^2\). A projective point is a pair of antipodal spherical points.

<div class="theorem"><strong>Theorem 3.6 (Metric Properties):</strong> \(d_P\) satisfies positive definiteness (with values in \([0, \pi/2]\)), symmetry, and the triangle inequality.</div>

<div class="definition"><strong>Definition 3.9 (Projective Line):</strong> A projective line in \(\mathbb{P}^2\) is the set of all lines through the origin in \(\mathbb{R}^3\) which lie in a given plane through the origin. Each projective line corresponds to a Euclidean plane through the origin and has a pole \(\mathbf{u} \in \mathbb{P}^2\) (the line perpendicular to the plane). We write \(L_\mathbf{u}\) for the line with pole \(\mathbf{u}\). Note that \(L_\mathbf{u} = C(\mathbf{u}, \pi/2)\).</div>

<div class="theorem"><strong>Theorem 3.10 (Properties of Projective Lines):</strong>
<ol>
<li>Any two distinct points in \(\mathbb{P}^2\) determine a unique projective line.</li>
<li>Any two distinct projective lines meet in a unique point (no parallel lines in \(\mathbb{P}^2\)!).</li>
<li>Given a point and a line not polar to it, there is a unique perpendicular line through the point.</li>
<li>Given two distinct lines, there is a unique line perpendicular to both.</li>
</ol></div>

The key contrast with Euclidean geometry: in \(\mathbb{P}^2\), any two distinct lines always meet. There are no parallels. This is because "parallel" Euclidean lines meet at their common point at infinity.

<div class="theorem"><strong>Theorem 3.15 (Isometries of \(\mathbb{P}^2\)):</strong> Every isometry of \(\mathbb{P}^2\) is induced by a rotation \(R_{p,\theta}\) for some \(p \in S^2\), \(\theta \in \mathbb{R}\). The isometry group of \(\mathbb{P}^2\) is
\[ SO(3, \mathbb{R}) = \left\{ A \in M_3(\mathbb{R}) \mid A^T A = I,\, \det A = 1 \right\}. \]</div>

The isometry group of \(\mathbb{P}^2\) is strictly smaller than that of \(S^2\) (\(SO(3)\) versus \(O(3)\)), because orientation-reversing maps of \(S^2\) — such as reflections — do not descend to well-defined isometries of \(\mathbb{P}^2\).

## 3.2 Homogeneous Coordinates and Zero Sets

To do algebra in \(\mathbb{P}^2\), we use homogeneous coordinates, which package the equivalence class \([\mathbf{x}]\) into a coordinate triple well-suited for polynomial equations.

<div class="definition"><strong>Definition 3.16 (Homogeneous Coordinates):</strong> We write \([x,y,z] = \mathrm{Span}\{(x,y,z)\} \in \mathbb{P}^2\) for homogeneous coordinates. Define open sets \(U_1 = \{[x,y,z] \mid x \neq 0\}\), etc. The gnomonic projections \(\phi_k: U_k \to \mathbb{R}^2\) are:
\[ \phi_1([x,y,z]) = \left(\frac{y}{x}, \frac{z}{x}\right), \quad \phi_2([x,y,z]) = \left(\frac{x}{y}, \frac{z}{y}\right), \quad \phi_3([x,y,z]) = \left(\frac{x}{z}, \frac{y}{z}\right). \]
We can view \(\mathbb{P}^2 = U_k \cup L_k\) where \(L_k = \mathbb{P}^2 \setminus U_k\) is the "line at infinity" for the copy \(U_k \cong \mathbb{R}^2\).</div>

<div class="definition"><strong>Definition 3.19 (Homogeneous Polynomial):</strong> A polynomial \(F(x,y,z)\) is homogeneous of degree \(n\) if every term has total degree \(n\), equivalently \(F(tx,ty,tz) = t^n F(x,y,z)\). For such \(F\), the zero set in \(\mathbb{P}^2\) is well-defined:
\[ Z(F) = \left\{ [x,y,z] \in \mathbb{P}^2 \mid F(x,y,z) = 0 \right\}. \]</div>

Homogeneous polynomials are necessary because the coordinates of a projective point are only defined up to scaling: replacing \((x,y,z)\) by \((tx,ty,tz)\) changes \(F\) by \(t^n\), which vanishes if and only if \(F\) vanishes. So the zero set is consistent across representatives.

<div class="definition"><strong>Definition 3.24 (Homogenization):</strong> Given a polynomial \(f(x,y)\) of degree \(n\), its homogenization is \(F(x,y,z) = z^n f(x/z, y/z)\). The zero set \(Z(F) \subseteq \mathbb{P}^2\) is the projective completion of \(Z(f) \subseteq \mathbb{R}^2\). Points of the form \([x,y,0]\) in \(Z(F)\) are called zeros at infinity.</div>

## 3.3 Conic Sections

The projective plane is the natural home for conic sections, where the classical distinction between ellipse, parabola, and hyperbola dissolves: all non-degenerate conics are projectively equivalent, the differences arising only from how the conic meets the line at infinity.

<div class="definition"><strong>Definition 3.28 (Double Cone):</strong> For \(p \in \mathbb{R}^3\), \(\mathbf{u} \in S^2\), and \(\phi \in (0, \pi/2)\), the double cone is
\[ V(p,\mathbf{u},\phi) = \left\{ \mathbf{x} \in \mathbb{R}^3 \mid (\mathbf{x}-p)\cdot\mathbf{u} = |\mathbf{x}-p|\cos\phi \right\}. \]
A conic section is the intersection of a double cone with a plane.</div>

<div class="theorem"><strong>Lemma 3.32:</strong>
<ol>
<li>The cone with vertex \((0,0,-h)\), axis \(\frac{1}{\sqrt{2}}(0,1,1)\), half-angle \(\pi/4\) meets the \(xy\)-plane in the parabola \(y = \frac{1}{2h}x^2\).</li>
<li>The cone with vertex \((0,0,h)\), axis \((1,0,0)\), half-angle \(\phi\) meets the \(xy\)-plane in the hyperbola \(\frac{x^2}{h^2\cot^2\phi} - \frac{y^2}{h^2} = 1\).</li>
<li>With appropriate cone, meets the \(xy\)-plane in an ellipse.</li>
</ol></div>

<div class="definition"><strong>Definition 3.34 (Conic in \(\mathbb{P}^2\)):</strong> A conic in \(\mathbb{P}^2\) is the zero set of a homogeneous polynomial of degree 2. Non-degenerate conics (completions of parabolas, circles, ellipses, and hyperbolas) are all projectively equivalent.</div>

## 3.4 Classical Theorems

The projective plane is the right setting for several remarkable classical theorems about incidence — theorems concerning when points are collinear or lines are concurrent. These theorems are purely projective: they do not refer to distance or angle, only to the incidence structure of points and lines.

<div class="theorem"><strong>Theorem 3.35 (Desargues' Theorem):</strong> Let \(u,v,w,u',v',w'\) be distinct points in \(\mathbb{P}^2\) with \(u,v,w\) non-collinear and \(u',v',w'\) non-collinear. If the lines \(uu'\), \(vv'\), \(ww'\) all pass through a common point \(p\), then the three pairwise intersection points of corresponding sides — namely \(a = (vw)\cap(v'w')\), \(b = (wu)\cap(w'u')\), \(c = (uv)\cap(u'v')\) — are collinear.</div>

<div class="proof"><strong>Proof sketch:</strong> Project to \(\mathbb{R}^2\). Lift \(w\) and \(w'\) out of the plane while keeping the line \(ww'\) through \(p\). The triangles now lie in planes \(P\) and \(P'\). Since \(P \neq P'\), they intersect in a line \(L\). Both \(a, b, c\) lie on \(L\), hence are collinear.</div>

<div class="theorem"><strong>Theorem 3.36 (Pappus' Theorem):</strong> Let \(L\) and \(L'\) be distinct lines in \(\mathbb{P}^2\), with distinct points \(u,v,w \in L\) and \(u',v',w' \in L'\). Define \(a = (vw')\cap(wv')\), \(b = (wu')\cap(uw')\), \(c = (uv')\cap(vu')\). Then \(a, b, c\) are collinear.</div>

<div class="theorem"><strong>Theorem 3.39 (Pascal's Theorem):</strong> Let \(C\) be a (non-degenerate) conic in \(\mathbb{P}^2\) and let \(u_1, u_2, u_3, u_4, u_5, u_6\) be six distinct points on \(C\). Define
\[ a = (u_1 u_2)\cap(u_4 u_5), \quad b = (u_2 u_3)\cap(u_5 u_6), \quad c = (u_3 u_4)\cap(u_6 u_1). \]
Then \(a, b, c\) are collinear (they lie on the "Pascal line").</div>

<div class="proof"><strong>Proof sketch:</strong> By projective transformation, reduce to the case where \(C\) is a circle in \(\mathbb{R}^2\). Use a circle \(D\) through \(u_2, u_5, a\). Apply the lemma that if two circles intersect at \(p\) and \(q\), and a chord through \(p\) meets the second circle at \(c\) while a chord through \(q\) meets it at \(d\), then the original chord pair and \(cd\) are parallel. This produces parallel line triples which force collinearity of \(a, b, c\).</div>

When the conic degenerates to a pair of lines, Pascal's Theorem reduces to Pappus' Theorem.

---

# Chapter 4: Hyperbolic Geometry

## 4.1 Reflections in Circles

Hyperbolic geometry is built on the notion of reflection in a circle (circle inversion), which plays the role that reflection in a line plays in Euclidean geometry.

After surveying the positively curved world of the sphere and the "flat" projective plane, we now turn to the third major geometry: the hyperbolic plane, which has constant negative curvature. The construction is more subtle — we cannot simply take a surface embedded in \(\mathbb{R}^3\) as we did with \(S^2\). Instead, we will define the geometry analytically on the unit disc, and the key to understanding its isometries is circle inversion.

<div class="definition"><strong>Definition 4.1 (Reflections in Lines and Circles):</strong>
<ul>
<li>The <em>reflection in a line</em> \(L\) through \(a\) perpendicular to \(\mathbf{u}\) is
\[ F_L(\mathbf{x}) = \mathbf{x} - \frac{2(\mathbf{x}-a)\cdot\mathbf{u}}{|\mathbf{u}|^2}\mathbf{u}. \]</li>
<li>The <em>reflection (inversion) in a circle</em> \(C\) centred at \(a\) of radius \(r\) is the map \(F_C: \mathbb{R}^2\setminus\{a\} \to \mathbb{R}^2\setminus\{a\}\) given by
\[ F_C(\mathbf{x}) = a + \frac{r^2}{|\mathbf{x}-a|^2}(\mathbf{x}-a). \]</li>
</ul>
In both cases \(F^2 = I\), so the map is its own inverse.</div>

Geometrically, circle inversion sends points inside \(C\) to points outside \(C\) and vice versa, fixing points on \(C\) itself.

<div class="theorem"><strong>Theorem 4.6 (Reflections Preserve Lines and Circles):</strong> Reflection in a line or circle maps lines and circles to lines and circles. Specifically for the inversion \(F_C\) in circle \(C\) centred at \(a\) of radius \(r\):
<ol>
<li>Any line through \(a\) is mapped to itself.</li>
<li>A line not through \(a\) is mapped to a circle passing through \(a\).</li>
<li>A circle through \(a\) is mapped to a line not through \(a\).</li>
<li>A circle not through \(a\) is mapped to a circle (not through \(a\)).</li>
</ol></div>

This theorem is central: it tells us that circle inversion preserves the family of "generalized circles" (circles and lines, treating lines as circles of infinite radius). This is exactly the family that will serve as hyperbolic lines, so inversions will automatically map hyperbolic lines to hyperbolic lines.

<div class="theorem"><strong>Theorem 4.9 (Reflections are Conformal):</strong> Every reflection in a line or circle is a conformal map (angle-preserving). For inversion \(F_C\) in the circle of radius \(r\) centred at \(a\), the scaling factor at point \(\mathbf{x}\) is \(\frac{r^2}{|\mathbf{x}-a|^2}\).</div>

<div class="proof"><strong>Proof:</strong> Writing \(s = x-a\), \(t = y-b\) and computing \(DF_C\), one finds
\[ (DF_C)^T (DF_C) = \frac{r^4}{(s^2+t^2)^2} I, \]
confirming that \(F_C\) is conformal with scaling factor \(\frac{r^2}{s^2+t^2} = \frac{r^2}{|\mathbf{x}-a|^2}\).</div>

## 4.2 The Poincaré Disc Model

We now have all the ingredients to define the hyperbolic plane. The idea is to take the Euclidean open unit disc and equip it with a new metric that stretches distances near the boundary — so that the boundary circle is "infinitely far away" and the disc becomes a model of infinite negatively curved space.

<div class="definition"><strong>Definition 4.10 (The Hyperbolic Plane):</strong> The hyperbolic plane is the open unit disc
\[ \mathbb{H}^2 = \left\{ \mathbf{x} \in \mathbb{R}^2 \mid |\mathbf{x}| < 1 \right\}. \]
The boundary \(S^1 = \{|\mathbf{x}| = 1\}\) consists of points at infinity (or asymptotic points). Hyperbolic length and area are measured by the infinitesimal rescaling:
\[ d_H L = \frac{2}{1-|\mathbf{x}|^2}\,d_E L, \qquad d_H A = \frac{4}{(1-|\mathbf{x}|^2)^2}\,d_E A. \]
The hyperbolic length of a curve \(\mathbf{x} = \alpha(t)\), \(a \leq t \leq b\) is
\[ L = \int_a^b \frac{2|\alpha'(t)|}{1 - |\alpha(t)|^2}\,dt. \]
Hyperbolic angles are the same as Euclidean angles.</div>

The metric blows up at the boundary \(S^1\), meaning points near the boundary are "infinitely far away" in the hyperbolic metric. The disc looks finite to Euclidean eyes but is infinite to a hyperbolic observer.

The choice of conformal factor \(\frac{2}{1-|\mathbf{x}|^2}\) is not arbitrary: it is the unique factor (up to scaling) that makes the resulting geometry have constant curvature \(-1\). The conformality of the model — hyperbolic angles equal Euclidean angles — is what gives the Poincaré disc its aesthetic appeal in Escher's famous "Circle Limit" drawings.

<div class="definition"><strong>Definition 4.13 (Hyperbolic Lines):</strong> A hyperbolic line in \(\mathbb{H}^2\) is a set which is either:
<ul>
<li>of the form \(L = M \cap \mathbb{H}^2\) where \(M\) is a Euclidean line through the origin, or</li>
<li>of the form \(L = C \cap \mathbb{H}^2\) where \(C\) is a Euclidean circle meeting \(S^1\) orthogonally.</li>
</ul></div>

A circle \(C\) centred at \(a\) of radius \(r\) meets \(S^1\) orthogonally if and only if \(r^2 = |a|^2 - 1\) (so \(|a| > 1\)).

In both cases a hyperbolic line is an arc of a generalized circle that meets the boundary \(S^1\) at right angles — the orthogonality condition is what makes circle inversions in these circles preserve the disc.

<div class="theorem"><strong>Theorem 4.17 (Reflections are Isometries):</strong> For any hyperbolic line \(L\), the reflection \(F_L: \mathbb{H}^2 \to \mathbb{H}^2\) is an isometry on \(\mathbb{H}^2\).</div>

<div class="proof"><strong>Proof sketch:</strong> For \(L = C \cap \mathbb{H}^2\) with \(C\) centred at \(a\) of radius \(r = \sqrt{|a|^2-1}\), the scaling factor of \(F_L\) at \(\mathbf{x}\) is \(\frac{r^2}{|\mathbf{x}-a|^2}\). One verifies that if \(\mathbf{y} = F_L(\mathbf{x})\) then
\[ \frac{r^2}{|\mathbf{x}-a|^2} = \frac{1-|\mathbf{y}|^2}{1-|\mathbf{x}|^2}, \]
so the scaling exactly compensates for the change in the hyperbolic metric factor.</div>

<div class="theorem"><strong>Theorem 4.18 (Unique Line Through Two Points):</strong> Given \(\mathbf{u}, \mathbf{v} \in \mathbb{H}^2 \cup S^1\) with \(\mathbf{u} \neq \mathbf{v}\), there is a unique hyperbolic line containing (or asymptotic to) both.</div>

<div class="definition"><strong>Definition 4.19 (Parallelism in \(\mathbb{H}^2\)):</strong>
<ul>
<li>Two hyperbolic lines that meet in \(\mathbb{H}^2\) are called <em>intersecting</em>.</li>
<li>Two hyperbolic lines that share an ideal endpoint in \(S^1\) are called <em>asymptotic</em> (or critically parallel).</li>
<li>Two hyperbolic lines with no shared point in \(\mathbb{H}^2 \cup S^1\) are called <em>parallel</em> (or ultraparallel).</li>
</ul>
This gives three types of pairs of lines — a fundamental departure from Euclidean geometry, where distinct lines either intersect or are parallel.</div>

The three-way classification of line pairs is a hallmark of hyperbolic geometry. Given a line \(L\) and a point \(p \notin L\), there are infinitely many lines through \(p\) that do not intersect \(L\) — they divide into two families of asymptotic lines bordering a continuous band of ultraparallel lines. This is the negation of Euclid's parallel postulate.

## 4.3 Geodesics and Distance

<div class="theorem"><strong>Theorem 4.24 (Geodesics are Lines):</strong> The geodesics in \(\mathbb{H}^2\) (curves minimizing hyperbolic arclength) are exactly the hyperbolic lines.</div>

<div class="proof"><strong>Proof:</strong> First show that the straight line from \(\mathbf{0}\) to \(\mathbf{u}\) is the shortest path. Using polar coordinates, for any curve \(C\) from \(\mathbf{0}\) to \(\mathbf{u}\):
\[ L(C) = \int \frac{2\sqrt{(r')^2 + r^2(\theta')^2}}{1-r^2}\,dt \geq \int \frac{2|r'|}{1-r^2}\,dt \geq \int_0^{|u|} \frac{2}{1-r^2}\,dr = \ln\frac{1+|\mathbf{u}|}{1-|\mathbf{u}|}. \]
Equality holds iff \(\theta' = 0\) and \(r' \geq 0\), i.e., \(C\) is the straight line segment. For general \(\mathbf{u}, \mathbf{v}\), apply an isometry \(F_L\) to move \(\mathbf{u}\) to \(\mathbf{0}\).</div>

The proof has the same structure as the classical Euclidean proof that straight lines are shortest: reduce to a straight radial path by discarding angular components, then integrate. The key difference is the metric weight \(\frac{2}{1-r^2}\), which makes the calculation purely one-dimensional.

<div class="definition"><strong>Definition 4.25 (Hyperbolic Distance):</strong> For \(\mathbf{u}, \mathbf{v} \in \mathbb{H}^2\), the hyperbolic distance \(d_H(\mathbf{u},\mathbf{v})\) is the hyperbolic length along the unique hyperbolic line from \(\mathbf{u}\) to \(\mathbf{v}\).</div>

From Example 4.11, the distance from \(\mathbf{0}\) to \(\mathbf{u}\) is:
\[ d_H(\mathbf{0}, \mathbf{u}) = \ln\frac{1+|\mathbf{u}|}{1-|\mathbf{u}|}. \]

<div class="theorem"><strong>Theorem 4.26 (Distance Formula):</strong> For \(\mathbf{u}, \mathbf{v} \in \mathbb{H}^2\):
\[ d_H(\mathbf{u},\mathbf{v}) = \cosh^{-1}\!\left(1 + \frac{2|\mathbf{v}-\mathbf{u}|^2}{(1-|\mathbf{u}|^2)(1-|\mathbf{v}|^2)}\right). \]</div>

<div class="proof"><strong>Proof:</strong> Use an isometry to move \(\mathbf{u}\) to \(\mathbf{0}\), obtaining \(d_H(\mathbf{u},\mathbf{v}) = d_H(\mathbf{0},\mathbf{w})\) for \(\mathbf{w} = F_L(\mathbf{v})\). Then compute \(\cosh(d_H(\mathbf{0},\mathbf{w})) = \frac{1+|\mathbf{w}|^2}{1-|\mathbf{w}|^2} = 1 + \frac{2|\mathbf{w}|^2}{1-|\mathbf{w}|^2}\) and use the explicit formula for \(|\mathbf{w}|^2\) in terms of \(\mathbf{u}\) and \(\mathbf{v}\).</div>

The appearance of \(\cosh^{-1}\) in the distance formula, where \(\cos^{-1}\) appeared in the spherical formula, is not a coincidence: it reflects the fact that spherical and hyperbolic geometry are related by replacing trigonometric functions with their hyperbolic counterparts, corresponding to curvatures \(+1\) and \(-1\) respectively.

<div class="theorem"><strong>Theorem 4.29 (Hyperbolic Circumference and Area):</strong> For \(\mathbf{u} \in \mathbb{H}^2\) and \(r > 0\), the hyperbolic circle \(C_H(\mathbf{u},r)\) has circumference and the disc \(D_H(\mathbf{u},r)\) has area:
\[ L = 2\pi\sinh r, \qquad A = 2\pi(\cosh r - 1). \]</div>

These formulas grow exponentially in \(r\), reflecting the negative curvature of \(\mathbb{H}^2\). For large \(r\), \(L \approx \pi e^r\) — circles grow much faster in hyperbolic space than in Euclidean space.

## 4.4 Angles and Triangles in Hyperbolic Geometry

Hyperbolic triangles have interior angle sum strictly less than \(\pi\), and the deficit \(\pi - (\alpha + \beta + \gamma)\) equals the area — exactly analogous to the spherical excess.

<div class="definition"><strong>Definition 4.30 (Horocycles and Hypercycles):</strong>
<ul>
<li>A <em>horocycle</em> is a Euclidean circle tangent to \(S^1\) from inside (intersects \(S^1\) at exactly one point).</li>
<li>A <em>hypercycle</em> is a Euclidean circle intersecting \(S^1\) at two distinct points, intersected with \(\mathbb{H}^2\).</li>
</ul></div>

Horocycles and hypercycles are the hyperbolic analogues of circles and lines in the Euclidean sense: a horocycle is orthogonal to all hyperbolic lines through its "centre at infinity," while a hypercycle is the locus of points at constant distance from a given hyperbolic line.

<div class="theorem"><strong>Theorem 4.33 (Hyperbolic Trigonometry Laws):</strong> For a triangle in \(\mathbb{H}^2\) with edge lengths \(a,b,c\) and interior angles \(\alpha, \beta, \gamma\):
<ol>
<li><strong>(Sine Law)</strong> \(\displaystyle\frac{\sinh a}{\sin\alpha} = \frac{\sinh b}{\sin\beta} = \frac{\sinh c}{\sin\gamma}\).</li>
<li><strong>(First Law of Cosines)</strong> \(\displaystyle\cos\alpha = \frac{\cosh a - \cosh b\cosh c}{-\sinh b\sinh c}\), i.e.,
\[ \cos\alpha = \frac{\cosh b\cosh c - \cosh a}{\sinh b\sinh c}. \]</li>
<li><strong>(Second Law of Cosines)</strong> \(\displaystyle\cosh a = \frac{\cos\alpha + \cos\beta\cos\gamma}{\sin\beta\sin\gamma}\).</li>
</ol></div>

<div class="proof"><strong>Proof sketch:</strong> Use reflections to place the triangle with vertices at \(\mathbf{u} = \mathbf{0}\), \(\mathbf{v} = (s,0)\), \(\mathbf{w} = (t\cos\alpha, t\sin\alpha)\). Then compute everything explicitly using the distance formula and the formula for the center of the hyperbolic line through two points. The First Cosine Law becomes a direct calculation, and the Sine Law follows from computing \(\sin\beta\) and \(\sin\gamma\) using the tangent directions at the vertices.</div>

Comparing the three geometries:

| Geometry | Curvature | Angle Sum | Sine Law | First Cosine |
|---|---|---|---|---|
| Euclidean | \(0\) | \(= \pi\) | \(\frac{\sin\alpha}{a} = \frac{\sin\beta}{b}\) | \(a^2 = b^2+c^2-2bc\cos\alpha\) |
| Spherical | \(+1\) | \(> \pi\) | \(\frac{\sin a}{\sin\alpha} = \frac{\sin b}{\sin\beta}\) | \(\cos\alpha = \frac{\cos a - \cos b\cos c}{\sin b\sin c}\) |
| Hyperbolic | \(-1\) | \(< \pi\) | \(\frac{\sinh a}{\sin\alpha} = \frac{\sinh b}{\sin\beta}\) | \(\cos\alpha = \frac{\cosh b\cosh c - \cosh a}{\sinh b\sinh c}\) |

The table reveals a beautiful pattern: the hyperbolic laws are obtained from the spherical laws by replacing \(\cos a\) with \(\cosh a\) and \(\sin a\) with \(\sinh a\). This is the "dictionary" between the two non-Euclidean geometries, reflecting that one has curvature \(+1\) and the other \(-1\).

<div class="theorem"><strong>Lemma 4.35 (Area of Doubly Asymptotic Triangle):</strong> A doubly asymptotic triangle (two vertices on \(S^1\), one in \(\mathbb{H}^2\)) with interior angle \(\alpha\) at its non-asymptotic vertex has area \(A = \pi - \alpha\).</div>

<div class="proof"><strong>Proof:</strong> Use reflections to place the non-asymptotic vertex at the origin with asymptotic points \((\cos\beta, \pm\sin\beta)\) where \(\alpha = 2\beta\). The bounding arc of the opposite line can be expressed in polar coordinates as \(r = \sec\beta\cos\theta - \sqrt{\sec^2\beta\cos^2\theta - 1}\). Compute the area integral using the hyperbolic area element, and evaluate via the trigonometric substitution \(\sin\beta\sin\phi = \sin\theta\), yielding \(A = \pi - 2\beta = \pi - \alpha\).</div>

<div class="theorem"><strong>Theorem 4.36 (Area of Hyperbolic Triangle — Gauss-Bonnet):</strong> The area of a triangle in \(\mathbb{H}^2\) (or \(\mathbb{H}^2 \cup S^1\) for asymptotic triangles) with interior angles \(\alpha, \beta, \gamma\) is
\[ A = \pi - (\alpha + \beta + \gamma). \]
For asymptotic vertices, the interior angle is \(0\).</div>

This is the hyperbolic analogue of Girard's theorem. The area equals the angle defect \(\pi - (\alpha+\beta+\gamma) > 0\), since in hyperbolic geometry \(\alpha + \beta + \gamma < \pi\). Both the spherical and hyperbolic triangle area formulas are instances of the Gauss-Bonnet theorem.

## 4.5 Isometries of the Hyperbolic Plane

Having classified the isometries of Euclidean space and \(S^2\), we now turn to the isometries of \(\mathbb{H}^2\). The structure is richer than in the other geometries, reflecting the more complex topology of the hyperbolic plane.

<div class="definition"><strong>Definition 4.37 (Types of Hyperbolic Isometries):</strong> Let \(L\) and \(M\) be distinct lines in \(\mathbb{H}^2\). The composite \(F_M F_L\) is called:
<ul>
<li>a <em>rotation</em> (elliptic isometry) \(R_{p,\theta}\) when \(L \cap M = \{p\} \subset \mathbb{H}^2\), rotating by \(\theta = 2\angle(L,M)\);</li>
<li>a <em>horolation</em> (parabolic isometry) when \(L\) and \(M\) are asymptotic at \(p \in S^1\);</li>
<li>a <em>translation</em> (hyperbolic isometry) along the common perpendicular \(N\) when \(L\) and \(M\) are ultraparallel.</li>
</ul>
A glide reflection along \(N\) is \(F_N F_M F_L\) when \(L\) and \(M\) are ultraparallel with common perpendicular \(N\).</div>

The three types of orientation-preserving isometries correspond to the three types of Möbius transformations (elliptic, parabolic, hyperbolic).

<div class="theorem"><strong>Theorem 4.40 (Perpendicular Bisector Locus):</strong> For \(\mathbf{u}, \mathbf{v} \in \mathbb{H}^2\) with \(\mathbf{u} \neq \mathbf{v}\), let \(L\) be the perpendicular bisector (the hyperbolic line with \(F_L(\mathbf{u}) = \mathbf{v}\)). Then for \(\mathbf{x} \in \mathbb{H}^2\):
\[ d_H(\mathbf{x},\mathbf{u}) = d_H(\mathbf{x},\mathbf{v}) \iff \mathbf{x} \in L. \]
The perpendicular bisector passes through the hyperbolic midpoint of \([\mathbf{u},\mathbf{v}]\) and meets that segment at a right angle.</div>

<div class="theorem"><strong>Theorem 4.42 (SSS Congruence):</strong> Given ordered triangles \([\mathbf{u},\mathbf{v},\mathbf{w}]\) and \([\mathbf{u}',\mathbf{v}',\mathbf{w}']\) in \(\mathbb{H}^2\) with \(a=a'\), \(b=b'\), \(c=c'\), there exists a unique isometry \(F\) on \(\mathbb{H}^2\) with \(F(\mathbf{u})=\mathbf{u}'\), \(F(\mathbf{v})=\mathbf{v}'\), \(F(\mathbf{w})=\mathbf{w}'\).</div>

<div class="theorem"><strong>Theorem 4.43:</strong> Every isometry of \(\mathbb{H}^2\) is a product of at most three reflections.</div>

<div class="theorem"><strong>Theorem 4.44 (Geometric Classification of Isometries on \(\mathbb{H}^2\)):</strong> Every isometry on \(\mathbb{H}^2\) is one of: the identity, a rotation, a translation, a horolation, a reflection, or a glide reflection.</div>

## 4.6 Other Models of Hyperbolic Geometry

The Poincaré disc is one of several equivalent models.

Each model of the hyperbolic plane emphasizes a different aspect of its geometry. Just as no single map projection faithfully represents the sphere, no single model of \(\mathbb{H}^2\) simultaneously preserves angles, distances, and the appearance of geodesics as straight lines. The choice of model is a matter of which properties are most useful for the task at hand.

**Poincaré Upper Half-Plane Model:** Let \(\mathbb{U}^2 = \{(x,y) \mid y > 0\}\). Let \(C = C_E((0,1), \sqrt{2})\) and \(L\) be the \(x\)-axis; then \(S = F_L \circ F_C\) maps \(\mathbb{H}^2\) to \(\mathbb{U}^2\). In \(\mathbb{U}^2\), the metric is \(ds = \frac{d_E s}{y}\). Geodesics are vertical lines and upper semicircles with centres on the \(x\)-axis. Angles are Euclidean.

**Minkowski (Hyperboloid) Model:** Define the Minkowski quadratic form \(Q(x,y,t) = x^2 + y^2 - t^2\) on \(\mathbb{R}^3\). The model is the upper sheet of the hyperboloid:
\[ \mathbb{M}^2 = \left\{ (x,y,t) \in \mathbb{R}^3 \mid x^2 + y^2 - t^2 = -1,\; t > 0 \right\}. \]
A stereographic-like projection from \((0,0,-1)\) maps \(\mathbb{M}^2\) to \(\mathbb{H}^2\). Geodesics in \(\mathbb{M}^2\) are intersections with planes through the origin.

The Minkowski model makes explicit the parallel with spherical geometry: just as \(S^2\) is the set of unit vectors for the Euclidean inner product, \(\mathbb{M}^2\) is the set of "unit vectors" for the Minkowski inner product \(\langle (x,y,t), (x',y',t') \rangle = xx' + yy' - tt'\). The sign change in the time coordinate is precisely what switches from positive to negative curvature.

**Klein Model:** The unit disc \(\mathbb{K}^2 = \{(x,y) \mid x^2+y^2 < 1\}\) with a different metric defined so that the gnomic projection from \(\mathbb{M}^2\) is an isometry. In the Klein model, geodesics are Euclidean straight-line segments, but angles are not the same as Euclidean angles.

The three disc/plane models (Poincaré disc, upper half-plane, Klein) are conformally, isometrically, or projectively equivalent to each other, each highlighting different geometric properties. The Poincaré disc and upper half-plane are conformal (angle-preserving); the Klein model has straight-line geodesics. All satisfy the same abstract axioms of hyperbolic geometry, including the negation of Euclid's parallel postulate: through any point not on a given line, there are infinitely many lines parallel to (not intersecting) the given line.
