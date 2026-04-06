---
title: "PMATH 321: Non-Euclidean Geometry"
prof: "Stephen New"
subjects: "PMATH"
---

*These notes cover PMATH 321: Non-Euclidean Geometry at the University of Waterloo. The course surveys three geometries — Euclidean, spherical, projective, and hyperbolic — and classifies their isometries. Historical context and worked examples have been added to supplement the lecture material.*

---

# Chapter 1: Euclidean Geometry

Euclidean geometry has been the foundation of mathematical thought for over two thousand years. We begin here not because it is simple, but because it provides the language and intuition for everything that comes later. Every concept we introduce — dot product, orthogonal projection, isometry, angle sum — will be revisited in spherical and hyperbolic geometry, where the same questions yield dramatically different answers. The contrast is the point.

## 1.1 The Dot Product

The dot product is the foundational operation of Euclidean geometry, encoding both length and angle through a single algebraic construct. Everything in this chapter flows from its definition. The remarkable fact is that a single bilinear form can simultaneously measure distances and detect perpendicularity — two seemingly different geometric concepts that turn out to be two faces of the same algebraic coin.

<div class="definition"><strong>Definition 1.1 (Dot Product):</strong> For vectors \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^n\) we define the dot product of \(\mathbf{u}\) and \(\mathbf{v}\) to be
\[ \mathbf{u} \cdot \mathbf{v} = \sum_{i=1}^{n} u_i v_i. \]</div>

<div class="theorem"><strong>Theorem 1.2 (Properties of the Dot Product):</strong> For all \(\mathbf{u}, \mathbf{v}, \mathbf{w} \in \mathbb{R}^n\) and all \(t \in \mathbb{R}\) we have:
<ol>
<li><strong>(Bilinearity)</strong> \((\mathbf{u} + \mathbf{v}) \cdot \mathbf{w} = \mathbf{u} \cdot \mathbf{w} + \mathbf{v} \cdot \mathbf{w}\) and \((t\mathbf{u}) \cdot \mathbf{v} = t(\mathbf{u} \cdot \mathbf{v})\), and similarly in the second argument.</li>
<li><strong>(Symmetry)</strong> \(\mathbf{u} \cdot \mathbf{v} = \mathbf{v} \cdot \mathbf{u}\).</li>
<li><strong>(Positive Definiteness)</strong> \(\mathbf{u} \cdot \mathbf{u} \geq 0\) with \(\mathbf{u} \cdot \mathbf{u} = 0\) if and only if \(\mathbf{u} = \mathbf{0}\).</li>
</ol></div>

These three properties — bilinearity, symmetry, and positive definiteness — together make the dot product an <em>inner product</em>. It is positive definiteness in particular that distinguishes Euclidean geometry from the Minkowski geometry we will encounter in the hyperboloid model of hyperbolic geometry: the Minkowski form \(Q(x,y,t) = x^2 + y^2 - t^2\) satisfies bilinearity and symmetry but not positive definiteness, since \(Q(0,0,1) = -1 < 0\). This single sign change — positive to indefinite — is what transforms a geometry of constant zero curvature into one of constant negative curvature.

Now that we have an inner product, we can define length in terms of it.

<div class="definition"><strong>Definition 1.3 (Length / Norm):</strong> For a vector \(\mathbf{u} \in \mathbb{R}^n\), we define the length (or norm) of \(\mathbf{u}\) to be
\[ |\mathbf{u}| = \sqrt{\mathbf{u} \cdot \mathbf{u}} = \sqrt{\sum_{i=1}^{n} u_i^2}. \]
We say that \(\mathbf{u}\) is a unit vector when \(|\mathbf{u}| = 1\).</div>

<div class="example"><strong>Example 1.3a (Computing dot products and angles).</strong> Let \(\mathbf{u} = (1, 2, 2)\) and \(\mathbf{v} = (2, -1, 2)\) in \(\mathbb{R}^3\).

<strong>Dot product:</strong>
\[\mathbf{u} \cdot \mathbf{v} = (1)(2) + (2)(-1) + (2)(2) = 2 - 2 + 4 = 4.\]

<strong>Lengths:</strong>
\[|\mathbf{u}| = \sqrt{1 + 4 + 4} = 3, \qquad |\mathbf{v}| = \sqrt{4 + 1 + 4} = 3.\]

<strong>Angle between them:</strong>
\[\cos\theta = \frac{\mathbf{u}\cdot\mathbf{v}}{|\mathbf{u}||\mathbf{v}|} = \frac{4}{9}, \qquad \theta = \cos^{-1}\!\left(\frac{4}{9}\right) \approx 63.6°.\]

Note that neither vector is a unit vector; to get unit vectors we divide by their lengths: \(\hat{\mathbf{u}} = \frac{1}{3}(1,2,2)\) and \(\hat{\mathbf{v}} = \frac{1}{3}(2,-1,2)\).</div>

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

The Cauchy-Schwarz inequality has a beautiful geometric meaning: the quantity \(\frac{\mathbf{u} \cdot \mathbf{v}}{|\mathbf{u}||\mathbf{v}|}\) must lie in \([-1,1]\), which is exactly the range of the cosine function. This is what makes the definition of angle via \(\cos\theta = \frac{\mathbf{u}\cdot\mathbf{v}}{|\mathbf{u}||\mathbf{v}|}\) well-posed in any dimension — without Cauchy-Schwarz, the right-hand side could exceed 1 and there would be no angle corresponding to it.

The Polarization Identities will reappear in a crucial way: they tell us that the dot product is entirely determined by the norm, which will be the key step in classifying isometries algebraically. Specifically, any map that preserves lengths automatically preserves the dot product, and therefore preserves angles too. With length in hand, we can define distance.

<div class="definition"><strong>Definition 1.5 (Euclidean Distance):</strong> For points \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^n\), the Euclidean distance is
\[ d_E(\mathbf{u}, \mathbf{v}) = |\mathbf{v} - \mathbf{u}|. \]</div>

<div class="theorem"><strong>Theorem 1.6 (Metric Properties of Euclidean Distance):</strong> For all \(\mathbf{u}, \mathbf{v}, \mathbf{w} \in \mathbb{R}^n\):
<ol>
<li><strong>(Positive Definiteness)</strong> \(d_E(\mathbf{u},\mathbf{v}) \geq 0\) with equality iff \(\mathbf{u} = \mathbf{v}\).</li>
<li><strong>(Symmetry)</strong> \(d_E(\mathbf{u},\mathbf{v}) = d_E(\mathbf{v},\mathbf{u})\).</li>
<li><strong>(Triangle Inequality)</strong> \(d_E(\mathbf{u},\mathbf{w}) \leq d_E(\mathbf{u},\mathbf{v}) + d_E(\mathbf{v},\mathbf{w})\).</li>
</ol></div>

These three properties define a <em>metric space</em>. A key goal of this course is to construct analogous distance functions on the sphere and the hyperbolic plane, and to verify that they too satisfy these axioms. With distance established, we can now turn to angle, the other fundamental measurement in geometry.

<div class="definition"><strong>Definition 1.7 (Angle):</strong> For nonzero vectors \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^n\), the (unoriented) angle \(\theta(\mathbf{u},\mathbf{v}) \in [0,\pi]\) is defined by
\[ \cos\theta(\mathbf{u},\mathbf{v}) = \frac{\mathbf{u}\cdot\mathbf{v}}{|\mathbf{u}||\mathbf{v}|}. \]
We say \(\mathbf{u}\) and \(\mathbf{v}\) are orthogonal when \(\mathbf{u}\cdot\mathbf{v} = 0\).</div>

Note that Cauchy-Schwarz guarantees the right-hand side lies in \([-1,1]\), making the definition well-formed. Orthogonality — the condition \(\mathbf{u} \cdot \mathbf{v} = 0\) — corresponds to \(\theta = \pi/2\), the right angle that has been central to geometry since Pythagoras.

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

Orthogonal projections let us decompose any vector into components parallel and perpendicular to a given subspace. This decomposition is central to everything that follows, including the classification of isometries. Without projections, we would have no way to identify the "closest point in a subspace to a given vector," which is the geometric content of the Gram-Schmidt process, the least-squares method, and the construction of perpendicular bisectors.

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

The direct sum decomposition \(\mathbb{R}^n = U \oplus U^{\perp}\) is the engine behind orthogonal projection. Every vector has a unique splitting into a component inside \(U\) and a component perpendicular to it. Think of holding a flashlight perpendicular to a wall: the point where the light hits the wall is the projection of the flashlight's position onto the wall-plane.

<div class="definition"><strong>Definition 1.11 (Orthogonal Projection):</strong> For a subspace \(U \subseteq \mathbb{R}^n\) and a vector \(\mathbf{x} \in \mathbb{R}^n\), since \(\mathbb{R}^n = U \oplus U^{\perp}\) we write \(\mathbf{x} = \mathbf{u} + \mathbf{v}\) uniquely with \(\mathbf{u} \in U\) and \(\mathbf{v} \in U^{\perp}\). We define
\[ \mathrm{Proj}_U(\mathbf{x}) = \mathbf{u}. \]
When \(U = \mathrm{Span}\{\mathbf{u}\}\) for a nonzero vector \(\mathbf{u}\), we write \(\mathrm{Proj}_{\mathbf{u}}(\mathbf{x})\).</div>

The following theorem gives the geometric interpretation: the projection is literally the closest point.

<div class="theorem"><strong>Theorem 1.12 (Nearest Point):</strong> Let \(U \subseteq \mathbb{R}^n\) be a subspace and \(\mathbf{x} \in \mathbb{R}^n\). Then \(\mathrm{Proj}_U(\mathbf{x})\) is the unique point in \(U\) nearest to \(\mathbf{x}\).</div>

<div class="proof"><strong>Proof:</strong> Write \(\mathbf{x} = \mathbf{u} + \mathbf{v}\) with \(\mathbf{u} = \mathrm{Proj}_U(\mathbf{x})\) and \(\mathbf{v} \in U^{\perp}\). For any \(\mathbf{w} \in U\) with \(\mathbf{w} \neq \mathbf{u}\), since \(\mathbf{v} \perp (\mathbf{w}-\mathbf{u})\) we get \(|\mathbf{x}-\mathbf{w}|^2 = |\mathbf{v}-(\mathbf{w}-\mathbf{u})|^2 = |\mathbf{v}|^2 + |\mathbf{w}-\mathbf{u}|^2 > |\mathbf{v}|^2 = |\mathbf{x}-\mathbf{u}|^2\).</div>

<div class="example"><strong>Example 1.12a (Projecting a vector onto a plane).</strong> Let \(U = \mathrm{Span}\{(1,0,0), (0,1,0)\}\) (the \(xy\)-plane in \(\mathbb{R}^3\)) and \(\mathbf{x} = (3, -1, 5)\).

The orthogonal complement is \(U^{\perp} = \mathrm{Span}\{(0,0,1)\}\). The decomposition is:
\[\mathbf{x} = \underbrace{(3,-1,0)}_{\in U} + \underbrace{(0,0,5)}_{\in U^{\perp}},\]
so \(\mathrm{Proj}_U(\mathbf{x}) = (3,-1,0)\).

Now let \(U' = \mathrm{Span}\{(1,1,0)/\sqrt{2}\}\) (a line at 45° in the \(xy\)-plane). Using the formula \(\mathrm{Proj}_{\mathbf{u}}(\mathbf{x}) = \frac{\mathbf{x}\cdot\mathbf{u}}{|\mathbf{u}|^2}\mathbf{u}\) with \(\mathbf{u} = (1,1,0)\):
\[\mathbf{x}\cdot\mathbf{u} = 3 + (-1) + 0 = 2, \quad |\mathbf{u}|^2 = 2, \quad \mathrm{Proj}_{\mathbf{u}}(\mathbf{x}) = \frac{2}{2}(1,1,0) = (1,1,0).\]
The component perpendicular to \(U'\) is \(\mathbf{x} - \mathrm{Proj}_{U'}(\mathbf{x}) = (3,-1,5) - (1,1,0) = (2,-2,5)\). One can verify \((2,-2,5)\cdot(1,1,0) = 2 - 2 + 0 = 0\). ✓</div>

When we have an explicit basis for \(U\), there is a matrix formula for computing the projection.

<div class="theorem"><strong>Theorem 1.14 (Matrix Formula for Projection):</strong> Let \(A \in M_{n\times l}(\mathbb{R})\), \(U = \mathrm{Col}(A)\), and \(\mathbf{x} \in \mathbb{R}^n\). Then:
<ol>
<li>The equation \(A^T A\,\mathbf{t} = A^T \mathbf{x}\) has a solution \(\mathbf{t} \in \mathbb{R}^l\), and for any such solution \(\mathrm{Proj}_U(\mathbf{x}) = A\mathbf{t}\).</li>
<li>If \(\mathrm{rank}(A) = l\) then \(A^T A\) is invertible and \(\mathrm{Proj}_U(\mathbf{x}) = A(A^T A)^{-1} A^T \mathbf{x}\).</li>
</ol></div>

When the columns of \(A\) form an orthogonal or orthonormal basis, the formula simplifies significantly — this is the payoff of the Gram-Schmidt orthogonalization process.

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

The cross product is specific to \(\mathbb{R}^3\) and provides a way to produce a vector orthogonal to two given vectors, encoding both orientation and area. It will be essential for computing angles on the sphere and for working with great circles — the cross product \(\mathbf{u} \times \mathbf{v}\) gives the pole of the great circle through \(\mathbf{u}\) and \(\mathbf{v}\). There is no analogous operation in \(\mathbb{R}^2\) or \(\mathbb{R}^4\) (except via the Hodge star), which is why spherical geometry lives naturally in three dimensions.

<div class="definition"><strong>Definition 1.21 (Cross Product):</strong> For vectors \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^3\), the cross product is
\[ \mathbf{u} \times \mathbf{v} = \left(u_2 v_3 - u_3 v_2,\; u_3 v_1 - u_1 v_3,\; u_1 v_2 - u_2 v_1\right)^T. \]</div>

This can be remembered using the formal determinant expansion:
\[\mathbf{u} \times \mathbf{v} = \det\begin{pmatrix} \mathbf{e}_1 & \mathbf{e}_2 & \mathbf{e}_3 \\ u_1 & u_2 & u_3 \\ v_1 & v_2 & v_3 \end{pmatrix}.\]

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

<div class="example"><strong>Example 1.22a (Computing a cross product and verifying orthogonality).</strong> Let \(\mathbf{u} = (1, 2, 0)\) and \(\mathbf{v} = (0, 1, 3)\).

\[\mathbf{u} \times \mathbf{v} = \begin{vmatrix} \mathbf{e}_1 & \mathbf{e}_2 & \mathbf{e}_3 \\ 1 & 2 & 0 \\ 0 & 1 & 3 \end{vmatrix} = \mathbf{e}_1(2\cdot3 - 0\cdot1) - \mathbf{e}_2(1\cdot3 - 0\cdot0) + \mathbf{e}_3(1\cdot1 - 2\cdot0) = (6, -3, 1).\]

<strong>Verify orthogonality:</strong>
\[(6,-3,1)\cdot(1,2,0) = 6 - 6 + 0 = 0 \checkmark\]
\[(6,-3,1)\cdot(0,1,3) = 0 - 3 + 3 = 0 \checkmark\]

<strong>Area of parallelogram spanned by \(\mathbf{u}\) and \(\mathbf{v}\):</strong>
\[|\mathbf{u}\times\mathbf{v}| = |(6,-3,1)| = \sqrt{36+9+1} = \sqrt{46}.\]

<strong>Sine of angle between \(\mathbf{u}\) and \(\mathbf{v}\):</strong> \(|\mathbf{u}| = \sqrt{5}\), \(|\mathbf{v}| = \sqrt{10}\), so
\[\sin\theta = \frac{\sqrt{46}}{\sqrt{5}\cdot\sqrt{10}} = \frac{\sqrt{46}}{\sqrt{50}} = \sqrt{\frac{46}{50}} \approx 0.959.\]</div>

The sign of the triple product detects orientation, leading to the following definition.

<div class="definition"><strong>Definition 1.26 (Orientation):</strong> Let \(\{\mathbf{u}, \mathbf{v}, \mathbf{w}\}\) be a basis for \(\mathbb{R}^3\). We say it is <em>positively oriented</em> when \(\det(\mathbf{u},\mathbf{v},\mathbf{w}) > 0\) and <em>negatively oriented</em> when \(\det(\mathbf{u},\mathbf{v},\mathbf{w}) < 0\).</div>

## 1.4 Geometry in the Euclidean Plane

In the Euclidean plane \(\mathbb{R}^2\), angle, line, and circle theory come together into classical geometry. It is here that we encounter the theorem — the angle sum of a triangle equals \(\pi\) — that will fail in both spherical and hyperbolic geometry. This failure is not a flaw; it is the very definition of those geometries.

<div class="definition"><strong>Definition 1.29 (Oriented Angle in \(\mathbb{R}^2\)):</strong> For \(\mathbf{0} \neq \mathbf{u} \in \mathbb{R}^2\), the oriented angle of \(\mathbf{u}\) is the unique \(\theta_o \in \mathbb{R}/2\pi\) such that \(\mathbf{u} = |\mathbf{u}|(\cos\theta_o, \sin\theta_o)\). For nonzero \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^2\), the oriented angle from \(\mathbf{u}\) to \(\mathbf{v}\) is \(\theta_o(\mathbf{u},\mathbf{v}) = \theta_o(\mathbf{v}) - \theta_o(\mathbf{u})\).</div>

<div class="theorem"><strong>Theorem 1.30:</strong> For \(\mathbf{0} \neq \mathbf{u}, \mathbf{v} \in \mathbb{R}^2\), with \(\theta_o = \theta_o(\mathbf{u},\mathbf{v})\):
\[ \cos\theta_o = \frac{\mathbf{u}\cdot\mathbf{v}}{|\mathbf{u}||\mathbf{v}|}, \qquad \sin\theta_o = \frac{u_1 v_2 - u_2 v_1}{|\mathbf{u}||\mathbf{v}|} = \frac{\det(\mathbf{u},\mathbf{v})}{|\mathbf{u}||\mathbf{v}|}. \]</div>

The sign of \(\sin\theta_o\) detects whether the rotation from \(\mathbf{u}\) to \(\mathbf{v}\) is counterclockwise (positive) or clockwise (negative). This oriented angle will reappear in the formula for the spherical oriented angle in Section 2.3, where the same formula holds with the triple product \(\det(\mathbf{u},\mathbf{v},\mathbf{w})\) replacing the 2D determinant.

<div class="theorem"><strong>Theorem 1.32 (Circumference and Area):</strong> An arc subtending angle \(\theta\) at the centre of a circle of radius \(r\) has length \(L = r\theta\). In particular, the circumference is \(2\pi r\). A sector subtending angle \(\theta\) has area \(A = \frac{1}{2}r^2\theta\); the area of the full disc is \(\pi r^2\).</div>

These formulas are the Euclidean baselines. In spherical geometry, the circumference of a circle of radius \(r\) is \(2\pi\sin r < 2\pi r\) (positive curvature means circles are "smaller than expected"), and in hyperbolic geometry it is \(2\pi\sinh r > 2\pi r\) (negative curvature means circles are "larger than expected"). The deviation from \(2\pi r\) is, in fact, a measure of curvature.

### Triangle Geometry

With the tools of angle and distance established, we can now develop the classical theory of triangles. The central result — the angle sum theorem — is one that will break down in both spherical and hyperbolic geometry, but in opposite directions.

<div class="theorem"><strong>Theorem 1.46 (Sum of Angles):</strong> The sum of the interior angles in any triangle in \(\mathbb{R}^2\) is equal to \(\pi\).</div>

This is a fundamental property distinguishing Euclidean geometry from both spherical and hyperbolic geometry, where the angle sum is respectively greater than and less than \(\pi\). The precise amount of deviation — the <em>excess</em> \(\alpha + \beta + \gamma - \pi\) on the sphere, and the <em>defect</em> \(\pi - (\alpha+\beta+\gamma)\) in the hyperbolic plane — will turn out to equal the area of the triangle. This is the content of Girard's theorem and the Gauss-Bonnet theorem, and it is one of the deepest unifying principles in the course.

<div class="theorem"><strong>Corollary 1.50 (Sine Law):</strong> Let \([u,v,w]\) be an ordered triangle in \(\mathbb{R}^2\) with side lengths \(a = |w-v|\), \(b = |u-w|\), \(c = |v-u|\) and interior angles \(\alpha, \beta, \gamma\). Then
\[ \frac{\sin\alpha}{a} = \frac{\sin\beta}{b} = \frac{\sin\gamma}{c}. \]</div>

<div class="theorem"><strong>Corollary 1.51 (Area of a Triangle):</strong> The area of triangle \([u,v,w]\) in \(\mathbb{R}^2\) is
\[ A = \frac{1}{2}\left|\det(u,v) + \det(v,w) + \det(w,u)\right|. \]</div>

<div class="theorem"><strong>Theorem 1.53 (Law of Cosines):</strong> For an ordered triangle \([u,v,w]\) in \(\mathbb{R}^2\):
\[ \cos\alpha = \frac{b^2 + c^2 - a^2}{2bc}, \quad \cos\beta = \frac{c^2 + a^2 - b^2}{2ca}, \quad \cos\gamma = \frac{a^2 + b^2 - c^2}{2ab}. \]</div>

The Law of Cosines generalizes the Pythagorean theorem (when \(\alpha = \pi/2\), it gives \(a^2 = b^2 + c^2\)). The spherical and hyperbolic versions will be strikingly similar, with trigonometric and hyperbolic-trigonometric functions replacing the side lengths.

### Triangle Centres

Beyond the basic metric properties of triangles, classical Euclidean geometry is rich with special points associated to each triangle — centres defined by different geometric concurrence conditions. These concurrence results are theorems, not tautologies: it is genuinely remarkable that three seemingly different lines through a triangle always meet at a single point.

<div class="theorem"><strong>Theorem 1.58 (Centroid):</strong> The three medians of a triangle (lines from each vertex to the midpoint of the opposite side) meet at the centroid \(g = \frac{1}{3}(u+v+w)\). The centroid lies two-thirds of the way along each median from vertex to midpoint.</div>

<div class="theorem"><strong>Theorem 1.61 (Circumcentre):</strong> The three perpendicular bisectors of the edges of a triangle meet at the circumcentre \(o\), which is equidistant from all three vertices. It is the centre of the circumscribed circle.</div>

<div class="theorem"><strong>Theorem 1.63 (Orthocentre and Euler Line):</strong> The three altitudes of a triangle meet at the orthocentre \(h\). The circumcentre \(o\), centroid \(g\), and orthocentre \(h\) are collinear (lying on the Euler line), with \(g\) lying one-third of the way from \(o\) to \(h\).</div>

<div class="proof"><strong>Proof sketch:</strong> Define \(h = 3g - 2o\). Then \(h - w = (3g - w) - 2o = (u+v) - 2o\). Since \(o\) lies on the perpendicular bisector of \([u,v]\), we have \(2o\cdot(v-u) = (u+v)\cdot(v-u)\), so \((h-w)\cdot(v-u) = (u+v)\cdot(v-u) - 2o\cdot(v-u) = 0\), confirming \(h\) lies on the altitude from \(w\).</div>

The Euler line is a striking example of how the basic metric structure of a triangle coerces several independently defined points into a single line. The incentre, defined by angle bisectors rather than side bisectors, does not generally lie on the Euler line — it satisfies a different set of metric conditions.

<div class="example"><strong>Example 1.63a (All four triangle centres — a worked computation).</strong> Consider the triangle with vertices \(u = (0,0)\), \(v = (4,0)\), \(w = (1,3)\).

<strong>Centroid:</strong> \(g = \frac{1}{3}(u+v+w) = \frac{1}{3}(5,3) = (5/3, 1)\).

<strong>Circumcentre:</strong> We need the point equidistant from all three vertices. The perpendicular bisector of \([u,v]\) is the vertical line \(x = 2\). The perpendicular bisector of \([u,w]\) passes through the midpoint \((1/2, 3/2)\) and is perpendicular to \(w - u = (1,3)\), so it has equation \(1(x-1/2) + 3(y-3/2) = 0\), i.e., \(x + 3y = 5\). Setting \(x=2\): \(2 + 3y = 5\), \(y = 1\). So \(o = (2,1)\).

Check: \(|o-u|^2 = 4+1=5\), \(|o-v|^2 = 4+1=5\), \(|o-w|^2 = 1+4=5\). ✓

<strong>Orthocentre:</strong> Using \(h = 3g - 2o = (5,-3) - (4,2) = (1,-2).\)

Wait — let us verify directly. The altitude from \(u=(0,0)\) is perpendicular to \(vw = w-v = (-3,3)\), so its direction is \((1,1)\): parametrically \((t,t)\). The altitude from \(v=(4,0)\) is perpendicular to \(uw = w-u = (1,3)\), so its direction is \((3,-1)\): parametrically \((4+3s, -s)\). Setting equal: \(t = 4+3s\) and \(t = -s\), so \(-s = 4+3s\), \(-4s = 4\), \(s = -1\), giving the point \((1, 1)\).

Hmm, let us recompute \(h\): \(3g - 2o = 3(5/3, 1) - 2(2,1) = (5,3) - (4,2) = (1,1)\). So \(h = (1,1)\). ✓

<strong>Incentre:</strong> Side lengths: \(a = |w-v| = |(-3,3)| = 3\sqrt{2}\), \(b = |u-w| = |(-1,-3)| = \sqrt{10}\), \(c = |v-u| = |(4,0)| = 4\). The incentre is
\[i = \frac{a\cdot u + b\cdot v + c\cdot w}{a+b+c} = \frac{3\sqrt{2}(0,0) + \sqrt{10}(4,0) + 4(1,3)}{3\sqrt{2}+\sqrt{10}+4}.\]
Numerically: \(3\sqrt{2} \approx 4.24\), \(\sqrt{10} \approx 3.16\), denominator \(\approx 11.4\).
\[i \approx \frac{(0,0) + (12.65, 0) + (4, 12)}{11.4} = \frac{(16.65, 12)}{11.4} \approx (1.46, 1.05).\]

The Euler line passes through \(o = (2,1)\), \(g = (5/3, 1)\), \(h = (1,1)\). Note all have \(y=1\)! The Euler line is the horizontal line \(y=1\). The incentre at \((1.46, 1.05)\) does not lie on this line (its \(y\)-coordinate is slightly different). ✓</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 420 80" width="420" height="80" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Euler line -->
  <line x1="20" y1="40" x2="400" y2="40" stroke="#999" stroke-width="1" stroke-dasharray="4,3"/>
  <!-- H point -->
  <circle cx="90" cy="40" r="4" fill="#e05"/>
  <text x="90" y="30" text-anchor="middle" fill="#e05" font-size="12">H</text>
  <text x="90" y="58" text-anchor="middle" fill="currentColor" font-size="11">(1,1)</text>
  <!-- G point -->
  <circle cx="210" cy="40" r="4" fill="#27c"/>
  <text x="210" y="30" text-anchor="middle" fill="#27c" font-size="12">G</text>
  <text x="210" y="58" text-anchor="middle" fill="currentColor" font-size="11">(5/3,1)</text>
  <!-- O point -->
  <circle cx="300" cy="40" r="4" fill="#2a2"/>
  <text x="300" y="30" text-anchor="middle" fill="#2a2" font-size="12">O</text>
  <text x="300" y="58" text-anchor="middle" fill="currentColor" font-size="11">(2,1)</text>
  <!-- Label -->
  <text x="210" y="75" text-anchor="middle" fill="currentColor" font-size="11">Euler line y=1 · H, G, O collinear · HG:GO = 2:1</text>
</svg>
</div>

![Triangle with centroid G (blue), circumcenter O (green), incenter I (red), orthocenter H (orange) marked](/pics/pmath321/triangle-centers.svg)

![Euler line: H (orthocenter), G (centroid), O (circumcenter) are collinear with HG:GO = 2:1](/pics/pmath321/euler-line.svg)

<div class="theorem"><strong>Theorem 1.70 (Incentre):</strong> The three internal angle bisectors of a triangle meet at the incentre \(i\), which is equidistant from all three sides. It is the centre of the inscribed circle.</div>

## 1.5 Isometries of Euclidean Space

An isometry is a distance-preserving bijection. Understanding isometries is the unifying theme of the entire course — each geometry is characterized by its group of isometries. This is Klein's Erlangen Program (1872): a geometry <em>is</em> a set together with its symmetry group, and geometric properties are precisely those invariant under that group.

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

The isometries of the plane fall into five types, classified by whether they fix points, preserve orientation, and by how they compose from reflections.

- <strong>Identity</strong>: \(I(x) = x\).
- <strong>Translation</strong>: \(T_u(x) = x + u\).
- <strong>Rotation</strong> about \(p\) by \(\theta\): \(R_{p,\theta}(x) = p + R_\theta(x-p)\) where \(R_\theta = \begin{pmatrix}\cos\theta & -\sin\theta \\ \sin\theta & \cos\theta\end{pmatrix}\).
- <strong>Reflection</strong> in line \(L\) through \(p\) perpendicular to \(u\): \(F_L(x) = x - \frac{2(x-p)\cdot u}{|u|^2}u\).
- <strong>Glide reflection</strong>: \(G_{u,L} = T_u \circ F_L = F_L \circ T_u\) when \(L\) is parallel to \(u\).

Translations and rotations preserve orientation; reflections and glide reflections reverse it.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 500 200" width="500" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <defs>
    <marker id="arr1" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- ROTATION -->
  <text x="60" y="18" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Rotation</text>
  <circle cx="60" cy="100" r="2" fill="currentColor"/>
  <text x="60" y="115" text-anchor="middle" fill="currentColor" font-size="11">P</text>
  <circle cx="100" cy="100" r="4" fill="#27c"/>
  <text x="108" y="103" fill="#27c" font-size="11">A</text>
  <circle cx="72" cy="68" r="4" fill="#e05"/>
  <text x="76" y="62" fill="#e05" font-size="11">A′</text>
  <path d="M98,92 A38,38 0 0,0 74,72" stroke="currentColor" stroke-width="1.2" fill="none" marker-end="url(#arr1)"/>
  <text x="60" y="140" text-anchor="middle" fill="currentColor" font-size="10">A→A′ about P by θ</text>
  <!-- REFLECTION -->
  <text x="185" y="18" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Reflection</text>
  <line x1="185" y1="30" x2="185" y2="130" stroke="#999" stroke-width="1.5" stroke-dasharray="5,3"/>
  <text x="185" y="145" text-anchor="middle" fill="currentColor" font-size="11">L</text>
  <circle cx="155" cy="80" r="4" fill="#27c"/>
  <text x="143" y="84" fill="#27c" font-size="11">A</text>
  <circle cx="215" cy="80" r="4" fill="#e05"/>
  <text x="220" y="84" fill="#e05" font-size="11">A′</text>
  <line x1="157" y1="80" x2="213" y2="80" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
  <text x="185" y="160" text-anchor="middle" fill="currentColor" font-size="10">A→A′ across L</text>
  <!-- TRANSLATION -->
  <text x="330" y="18" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Translation</text>
  <circle cx="285" cy="80" r="4" fill="#27c"/>
  <text x="278" y="75" fill="#27c" font-size="11">A</text>
  <circle cx="375" cy="80" r="4" fill="#e05"/>
  <text x="378" y="75" fill="#e05" font-size="11">A′</text>
  <line x1="291" y1="80" x2="369" y2="80" stroke="currentColor" stroke-width="1.5" marker-end="url(#arr1)"/>
  <text x="330" y="72" text-anchor="middle" fill="currentColor" font-size="11">u</text>
  <text x="330" y="100" text-anchor="middle" fill="currentColor" font-size="10">no fixed points</text>
  <!-- GLIDE REFLECTION -->
  <text x="440" y="18" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Glide Refl.</text>
  <line x1="440" y1="30" x2="440" y2="145" stroke="#999" stroke-width="1.2" stroke-dasharray="4,3"/>
  <circle cx="415" cy="60" r="4" fill="#27c"/>
  <text x="403" y="64" fill="#27c" font-size="11">A</text>
  <circle cx="465" cy="60" r="4" fill="#a50"/>
  <text x="468" y="64" fill="#a50" font-size="11">A′</text>
  <circle cx="465" cy="110" r="4" fill="#e05"/>
  <text x="468" y="114" fill="#e05" font-size="11">A″</text>
  <line x1="417" y1="60" x2="463" y2="60" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
  <line x1="465" y1="64" x2="465" y2="106" stroke="currentColor" stroke-width="1.2" marker-end="url(#arr1)"/>
  <text x="440" y="160" text-anchor="middle" fill="currentColor" font-size="10">reflect then slide</text>
</svg>
</div>

![Four isometries of ℝ²: rotation, reflection, translation, and glide reflection (blue = original, red dashed = image)](/pics/pmath321/isometries.svg)

The next theorem reveals that reflections are in some sense the "atoms" of planar isometries — every isometry is a product of reflections. Understanding how reflections compose gives us all the others.

<div class="theorem"><strong>Theorem 1.83 (Composites of Reflections):</strong> Let \(L\) and \(M\) be lines in \(\mathbb{R}^2\).
<ol>
<li>If \(L = M\) then \(F_M F_L = I\).</li>
<li>If \(L \parallel M\) then \(F_M F_L = T_{2u}\) where \(u\) is the vector from \(L\) orthogonally to \(M\).</li>
<li>If \(L \cap M = \{p\}\) then \(F_M F_L = R_{p, 2\theta}\) where \(\theta\) is the angle from \(L\) counterclockwise to \(M\).</li>
</ol></div>

<div class="example"><strong>Example 1.83a (Composing reflections to get a rotation).</strong> Let \(L\) be the \(x\)-axis and \(M\) be the line at angle \(\pi/6\) through the origin.

The composition \(F_M \circ F_L\) is a rotation about the origin by \(2 \cdot \pi/6 = \pi/3\). We can verify: reflecting \((1,0)\) in \(L\) gives \((1,0)\); reflecting \((1,0)\) in \(M\) (at angle \(\pi/6\)) gives \((\cos(2\pi/6), \sin(2\pi/6)) = (1/2, \sqrt{3}/2)\). Indeed, rotating \((1,0)\) by \(\pi/3\) counterclockwise gives \((\cos\pi/3, \sin\pi/3) = (1/2, \sqrt{3}/2)\). ✓

Similarly, if \(L\) is the \(y\)-axis (\(x=0\)) and \(M\) is the vertical line \(x=d\), then \(F_M \circ F_L\) is a translation by \((2d, 0)\).</div>

<div class="theorem"><strong>Theorem 1.84 (Geometric Classification of Isometries on \(\mathbb{R}^2\)):</strong> Every isometry on \(\mathbb{R}^2\) is one of: \(I\), \(T_u\), \(R_{p,\theta}\), \(F_L\), or \(G_{u,L}\).</div>

### Isometries in \(\mathbb{R}^3\)

In \(\mathbb{R}^3\) the full list expands:

<div class="theorem"><strong>Theorem 1.86 (Geometric Classification of Isometries on \(\mathbb{R}^3\)):</strong> Every isometry on \(\mathbb{R}^3\) is one of: the identity \(I\), a translation \(T_u\), a rotation \(R_{p,u,\theta}\), a twist \(W_{p,u,\theta}\), a reflection \(F_P\), a glide reflection \(G_{u,P}\), or a rotary reflection \(H_{p,u,\theta}\).</div>

The new entry in dimension three compared to dimension two is the <em>twist</em> (also called a screw motion): a simultaneous rotation about an axis and translation along that same axis. This has no two-dimensional counterpart, illustrating how the classification of isometries is genuinely sensitive to the dimension.

---

# Chapter 2: Spherical Geometry

## Motivation: Why Study Spherical Geometry?

Before diving into the mathematics, it is worth asking: why does spherical geometry matter? The answer is not merely academic.

The Earth is (approximately) a sphere. Navigation on its surface is a problem in spherical geometry: the shortest path between two cities is not a straight line on a flat map, but a great-circle arc. Pilots flying from Toronto to London follow a route that appears curved on a Mercator map but is actually the shortest path on the sphere — and computing this path requires spherical trigonometry.

Astronomers map the positions of stars on the <em>celestial sphere</em>, projecting the sky onto \(S^2\). The ancient problem of calculating stellar positions and predicting eclipses drove the development of spherical trigonometry long before the concept of non-Euclidean geometry was formulated. The laws of sines and cosines on the sphere were known to medieval Islamic mathematicians, including al-Battani and Nasir al-Din al-Tusi.

Geodesy — the science of measuring the Earth's shape — requires spherical geometry. GPS relies on it. And from the mathematical perspective, \(S^2\) is the simplest example of a space with constant positive curvature, providing the perfect testing ground for ideas that generalize to all Riemannian manifolds.

## 2.1 The Sphere and Spherical Distance

Spherical geometry lives on the unit sphere \(S^2\), where "straight lines" become great circles and angles sum to more than \(\pi\) in a triangle. This is the simplest model of a non-Euclidean geometry with positive curvature.

Having developed the full toolkit of Euclidean geometry, we now ask: what happens when we replace the flat plane \(\mathbb{R}^2\) with a curved surface? The sphere \(S^2 \subset \mathbb{R}^3\) is the most natural first candidate, and we already have all the tools — dot products, cross products, projections — to work with it.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 260 280" width="260" height="280" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="13">
  <!-- Sphere outline -->
  <circle cx="130" cy="140" r="90" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Equator (ellipse) -->
  <ellipse cx="130" cy="140" rx="90" ry="25" fill="none" stroke="#27c" stroke-width="1.3" stroke-dasharray="6,4"/>
  <!-- Prime meridian arc (full great circle, front half solid, back dashed) -->
  <path d="M130,50 Q165,140 130,230" fill="none" stroke="#999" stroke-width="1" stroke-dasharray="4,3"/>
  <path d="M130,50 Q95,140 130,230" fill="none" stroke="#999" stroke-width="1"/>
  <!-- Vertical axis -->
  <line x1="130" y1="30" x2="130" y2="260" stroke="#777" stroke-width="0.8" stroke-dasharray="3,3"/>
  <!-- North Pole -->
  <circle cx="130" cy="50" r="4" fill="#e05"/>
  <text x="142" y="48" fill="#e05" font-size="12">N = (0,0,1)</text>
  <!-- South Pole -->
  <circle cx="130" cy="230" r="4" fill="#e05"/>
  <text x="142" y="234" fill="#e05" font-size="12">S = (0,0,−1)</text>
  <!-- Center -->
  <circle cx="130" cy="140" r="3" fill="currentColor"/>
  <text x="137" y="137" fill="currentColor" font-size="11">(0,0,0)</text>
  <!-- Label -->
  <text x="130" y="270" text-anchor="middle" fill="#27c" font-size="11">equator (great circle)</text>
</svg>
</div>

<div class="definition"><strong>Definition 2.1 (Unit Sphere and Spherical Distance):</strong> The unit sphere is
\[ S^2 = \left\{ \mathbf{u} \in \mathbb{R}^3 \mid |\mathbf{u}| = 1 \right\}. \]
Points \(\pm\mathbf{u}\) are called antipodal. For \(\mathbf{u}, \mathbf{v} \in S^2\), the spherical distance is
\[ d_S(\mathbf{u},\mathbf{v}) = \theta(\mathbf{u},\mathbf{v}) = \cos^{-1}(\mathbf{u}\cdot\mathbf{v}). \]</div>

The spherical distance between two points is simply the angle between the corresponding unit vectors — it measures how far apart they are along the surface of the sphere, not through the ambient space. The maximum possible spherical distance is \(\pi\), achieved by antipodal points.

<div class="example"><strong>Example 2.1a (Basic spherical distances).</strong>

(1) <strong>North pole to equator:</strong> The north pole is \(\mathbf{n} = (0,0,1)\) and a point on the equator is \(\mathbf{e} = (1,0,0)\). Then \(\mathbf{n}\cdot\mathbf{e} = 0\), so \(d_S(\mathbf{n},\mathbf{e}) = \cos^{-1}(0) = \pi/2\). This makes sense: the equator is exactly a quarter of the way around the globe from the pole.

(2) <strong>Two cities as angles:</strong> Consider two points on the equator at longitudes \(0°\) and \(60°\):
\[\mathbf{u} = (1,0,0), \quad \mathbf{v} = (\cos 60°, \sin 60°, 0) = (1/2, \sqrt{3}/2, 0).\]
Then \(\mathbf{u}\cdot\mathbf{v} = 1/2\), so \(d_S(\mathbf{u},\mathbf{v}) = \cos^{-1}(1/2) = \pi/3\).
On a sphere of radius \(R = 6371\) km (Earth), the actual distance would be \(R\cdot\pi/3 \approx 6671\) km.

(3) <strong>Antipodal points:</strong> \(\mathbf{n} = (0,0,1)\), \(\mathbf{s} = (0,0,-1)\). Then \(\mathbf{n}\cdot\mathbf{s} = -1\), so \(d_S = \cos^{-1}(-1) = \pi\). Antipodal points are as far apart as possible.</div>

<div class="theorem"><strong>Theorem 2.2 (Euclidean and Spherical Distance):</strong> For \(\mathbf{u}, \mathbf{v} \in S^2\), the spherical and Euclidean distances determine each other via
\[ d_E(\mathbf{u},\mathbf{v}) = \sqrt{2 - 2\cos d_S(\mathbf{u},\mathbf{v})}, \qquad d_S(\mathbf{u},\mathbf{v}) = \cos^{-1}\!\left(1 - \tfrac{1}{2}d_E(\mathbf{u},\mathbf{v})^2\right). \]</div>

This tells us the two distances are monotonically related — one can be recovered from the other — but they are not proportional. Spherical distance is not simply Euclidean distance in disguise. For small angles, \(d_E \approx d_S\) (the sphere looks flat locally), but for large angles they diverge significantly.

<div class="theorem"><strong>Theorem 2.3 (Metric Properties of Spherical Distance):</strong> \(d_S\) is a metric on \(S^2\): it satisfies positive definiteness (with \(d_S(\mathbf{u},\mathbf{v}) \in [0,\pi]\), \(= 0\) iff \(\mathbf{u}=\mathbf{v}\), \(= \pi\) iff \(\mathbf{u}=-\mathbf{v}\)), symmetry, and the triangle inequality.</div>

<div class="proof"><strong>Proof of Triangle Inequality:</strong> Using the cross-product identity \((\mathbf{u}\times\mathbf{v})\cdot(\mathbf{v}\times\mathbf{w}) = (\mathbf{u}\cdot\mathbf{v})(\mathbf{v}\cdot\mathbf{w}) - (\mathbf{u}\cdot\mathbf{w})(\mathbf{v}\cdot\mathbf{v})\) and the Cauchy-Schwarz inequality \(|(\mathbf{u}\times\mathbf{v})\cdot(\mathbf{v}\times\mathbf{w})| \leq |\mathbf{u}\times\mathbf{v}||\mathbf{v}\times\mathbf{w}|\), one shows \(\cos(\theta(\mathbf{u},\mathbf{v}) + \theta(\mathbf{v},\mathbf{w})) \leq \mathbf{u}\cdot\mathbf{w} = \cos\theta(\mathbf{u},\mathbf{w})\). Since \(\cos\) is decreasing, the inequality follows.</div>

<div class="theorem"><strong>Theorem 2.4 (Spherical Area):</strong> The area of the portion of \(S^2\) between two parallel planes at Euclidean distance \(\Delta\) apart is \(2\pi\Delta\). In particular, the total surface area of \(S^2\) is \(4\pi\).</div>

<div class="proof"><strong>Proof:</strong> After rotating, take the planes as \(x=a\) and \(x=b\). Using the surface of revolution formula with \(f(x) = \sqrt{1-x^2}\):
\[ A = \int_a^b 2\pi\sqrt{1-x^2}\sqrt{1 + \frac{x^2}{1-x^2}}\,dx = \int_a^b 2\pi\,dx = 2\pi(b-a). \]</div>

This is Archimedes' hat-box theorem: the sphere and the enclosing cylinder have the same lateral area. The elegant cancellation in the integrand — the sphere bows outward exactly as the cap shrinks — is what makes the area formula so clean. Archimedes was so proud of this result that he reportedly requested a sphere inscribed in a cylinder be carved on his tombstone.

## 2.2 Spherical Circles and Lines

<div class="theorem"><strong>Theorem 2.7 (Circumference and Area of Spherical Circles):</strong> For \(\mathbf{u} \in S^2\) and \(r \in [0,\pi]\), the spherical circle \(C(\mathbf{u},r)\) has circumference \(L = 2\pi\sin r\) and the spherical disc \(D(\mathbf{u},r)\) has area \(A = 2\pi(1 - \cos r)\).</div>

<div class="example"><strong>Example 2.7a (Comparing spherical and Euclidean circle formulas).</strong>

For \(r = \pi/4\): \(L_S = 2\pi\sin(\pi/4) = 2\pi/\sqrt{2} \approx 4.44\), while \(L_E = 2\pi(\pi/4) \approx 4.93\). The spherical circle is shorter.

For \(r = \pi/2\) (the equator): \(L_S = 2\pi\sin(\pi/2) = 2\pi\). This matches the Euclidean formula \(L_E = 2\pi\cdot 1 = 2\pi$ only because the equator happens to be a great circle. But the "radius" in the spherical sense is \(\pi/2\), while the Euclidean circumference formula \(2\pi r\) would give \(\pi^2 \approx 9.87\). The discrepancy shows that spherical circles are smaller than Euclidean circles of the same radius.

Area comparison:
\[A_S = 2\pi(1-\cos r) \approx \pi r^2 - \frac{\pi r^4}{12} + \cdots\]
The leading term \(\pi r^2\) matches the Euclidean formula, with negative corrections due to positive curvature. For the hemisphere (\(r = \pi/2\)): \(A_S = 2\pi(1-0) = 2\pi\), which is half of \(4\pi\) as expected.</div>

Note the contrast with Euclidean geometry: the circumference is \(2\pi\sin r \leq 2\pi r\), reflecting the positive curvature of the sphere. The ratio \(\frac{L_S}{L_E} = \frac{\sin r}{r}\) goes to 1 as \(r \to 0\) (local flatness) and goes to 0 as \(r \to \pi\) (the "circle" at distance \(\pi\) from a point is a single antipodal point, with zero circumference).

Now that we have a notion of distance on \(S^2\), we can ask: what plays the role of straight lines? In Euclidean geometry, lines are geodesics — shortest-distance curves. On the sphere, the shortest paths between two points run along great circles.

<div class="definition"><strong>Definition 2.8 (Spherical Line / Great Circle):</strong> A spherical line (or great circle) in \(S^2\) is a set of the form \(L = S^2 \cap P\) where \(P\) is a plane through the origin. The unit normal vectors \(\pm\mathbf{u}\) to \(P\) are called the poles of \(L\). For \(\mathbf{u} \in S^2\), the line with poles \(\pm\mathbf{u}\) is
\[ L_\mathbf{u} = \left\{ \mathbf{x} \in S^2 \mid \mathbf{x}\cdot\mathbf{u} = 0 \right\} = C\!\left(\mathbf{u}, \tfrac{\pi}{2}\right). \]
Two lines are orthogonal when their poles are orthogonal.</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 280 260" width="280" height="260" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Sphere -->
  <circle cx="140" cy="125" r="95" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Equator -->
  <ellipse cx="140" cy="125" rx="95" ry="26" fill="none" stroke="#27c" stroke-width="1.5"/>
  <text x="242" y="122" fill="#27c" font-size="11">equator</text>
  <!-- Meridian 1 (front) -->
  <path d="M140,30 Q175,125 140,220" fill="none" stroke="#e05" stroke-width="1.3"/>
  <!-- Meridian 1 (back, dashed) -->
  <path d="M140,30 Q105,125 140,220" fill="none" stroke="#e05" stroke-width="1.3" stroke-dasharray="5,4"/>
  <text x="178" y="75" fill="#e05" font-size="11">meridian</text>
  <!-- Second meridian (different longitude) -->
  <path d="M140,30 Q165,100 185,125 Q165,150 140,220" fill="none" stroke="#777" stroke-width="1" stroke-dasharray="4,4"/>
  <!-- North pole -->
  <circle cx="140" cy="30" r="4" fill="currentColor"/>
  <text x="148" y="28" fill="currentColor" font-size="12">N</text>
  <!-- South pole -->
  <circle cx="140" cy="220" r="4" fill="currentColor"/>
  <text x="148" y="230" fill="currentColor" font-size="12">S</text>
  <!-- Intersection point of equator and meridian -->
  <circle cx="235" cy="125" r="3" fill="currentColor"/>
  <!-- Note -->
  <text x="140" y="250" text-anchor="middle" fill="currentColor" font-size="11">Any two great circles meet at two antipodal points</text>
</svg>
</div>

<div class="theorem"><strong>Theorem 2.9 (Properties of Spherical Lines):</strong>
<ol>
<li>Given \(\mathbf{u}, \mathbf{v} \in S^2\) with \(\mathbf{v} \neq \pm\mathbf{u}\), there is a unique line through \(\mathbf{u}\) and \(\mathbf{v}\), namely \(L_\mathbf{w}\) with \(\mathbf{w} = \pm\frac{\mathbf{u}\times\mathbf{v}}{|\mathbf{u}\times\mathbf{v}|}\).</li>
<li>Any two distinct lines in \(S^2\) intersect in exactly two antipodal points.</li>
<li>Given \(\mathbf{u} \in S^2\) and a line \(L\) with \(L \neq L_\mathbf{u}\), there is a unique line through \(\mathbf{u}\) perpendicular to \(L\).</li>
<li>Given two distinct lines, there is a unique line perpendicular to both.</li>
</ol></div>

Part (2) is a key departure from Euclidean geometry: there are no parallel lines on the sphere. Every pair of great circles meets, just as every pair of longitudes meets at the poles. The "parallel postulate" fails on \(S^2\) — but in the opposite direction from hyperbolic geometry. In Euclidean geometry, through a point off a line there is exactly one parallel; on the sphere there are none; in the hyperbolic plane there are infinitely many.

## 2.3 Oriented Angles on \(S^2\)

To measure angles between curves on the sphere, we need to work in the tangent space at each point — the natural home for directional information. The tangent space is what makes differential geometry possible: it is the infinitesimal Euclidean world attached to each point of the curved sphere.

<div class="definition"><strong>Definition 2.10 (Tangent Space):</strong> For \(\mathbf{u} \in S^2\), the tangent space at \(\mathbf{u}\) is
\[ T_\mathbf{u} = \left\{ \mathbf{x} \in \mathbb{R}^3 \mid \mathbf{x}\cdot\mathbf{u} = 0 \right\}. \]</div>

The tangent space \(T_\mathbf{u}\) is simply the plane in \(\mathbb{R}^3\) perpendicular to \(\mathbf{u}\) through the origin — it inherits the full inner product structure from \(\mathbb{R}^3\), which lets us measure angles between tangent vectors using the same formula as in \(\mathbb{R}^2\). Crucially, even though the sphere is curved, the angle between two geodesics at a point is well-defined and Euclidean, measured in the flat tangent plane.

<div class="theorem"><strong>Theorem 2.12 (Angle Formula on \(S^2\)):</strong> For \(\mathbf{u} \in S^2\) and \(\mathbf{0} \neq \mathbf{v}, \mathbf{w} \in T_\mathbf{u}\):
\[ \cos\theta_o(\mathbf{v},\mathbf{w}) = \frac{\mathbf{v}\cdot\mathbf{w}}{|\mathbf{v}||\mathbf{w}|}, \qquad \sin\theta_o(\mathbf{v},\mathbf{w}) = \frac{\det(\mathbf{u},\mathbf{v},\mathbf{w})}{|\mathbf{v}||\mathbf{w}|}. \]</div>

<div class="definition"><strong>Definition 2.14 (Spherical Line Segment and Tangent Vector):</strong> For \(\mathbf{u}, \mathbf{v} \in S^2\) with \(\mathbf{v} \neq \pm\mathbf{u}\), the spherical line segment \([\mathbf{u},\mathbf{v}]\) is the shorter arc of the great circle from \(\mathbf{u}\) to \(\mathbf{v}\). The unit tangent vector from \(\mathbf{u}\) toward \(\mathbf{v}\) is
\[ \vec{\mathbf{u}\mathbf{v}} = \frac{\mathbf{v} - (\mathbf{u}\cdot\mathbf{v})\mathbf{u}}{|\mathbf{u}\times\mathbf{v}|}. \]</div>

The tangent vector formula is just the normalized version of the component of \(\mathbf{v}\) perpendicular to \(\mathbf{u}\) — geometrically, it is the direction you would initially travel along the great circle from \(\mathbf{u}\) toward \(\mathbf{v}\). This is the "initial heading" on a great-circle route.

## 2.4 Spherical Triangles

With a notion of line segments and angles on \(S^2\), we can now define and study triangles. Spherical triangle geometry is both richer and more symmetric than its Euclidean counterpart. The key novelty is that <em>AAA congruence holds</em> — knowing the angles determines the triangle completely. In Euclidean geometry, similar triangles can be scaled; on the sphere, scale is locked to angle.

<div class="definition"><strong>Definition 2.16 (Spherical Triangle):</strong> A non-degenerate spherical triangle is determined by three linearly independent points \(\mathbf{u}, \mathbf{v}, \mathbf{w} \in S^2\) (i.e. \(\det(\mathbf{u},\mathbf{v},\mathbf{w}) \neq 0\)). The edge lengths are \(a = d_S(\mathbf{v},\mathbf{w})\), \(b = d_S(\mathbf{w},\mathbf{u})\), \(c = d_S(\mathbf{u},\mathbf{v})\), and the interior angles are \(\alpha = \angle vuw\), \(\beta = \angle wvu\), \(\gamma = \angle uvw\).</div>

<div class="example"><strong>Example 2.16a (An equilateral spherical triangle).</strong> Consider the three points:
\[\mathbf{u} = (1,0,0), \quad \mathbf{v} = (0,1,0), \quad \mathbf{w} = (0,0,1).\]

These are three mutually orthogonal unit vectors, so each pair has dot product 0. Thus:
\[a = b = c = d_S(\mathbf{u},\mathbf{v}) = \cos^{-1}(0) = \pi/2.\]

This is an equilateral spherical triangle with all sides equal to \(\pi/2\). To find the angles, use the First Law of Cosines:
\[\cos\alpha = \frac{\cos a - \cos b\cos c}{\sin b\sin c} = \frac{\cos(\pi/2) - \cos(\pi/2)\cos(\pi/2)}{\sin(\pi/2)\sin(\pi/2)} = \frac{0 - 0}{1} = 0,\]
so \(\alpha = \pi/2\). By symmetry \(\beta = \gamma = \pi/2\) as well.

The angle sum is \(\alpha + \beta + \gamma = 3\pi/2\), and the area (by Girard's theorem) is \(3\pi/2 - \pi = \pi/2\). Note the total sphere area is \(4\pi\), and this triangle covers \(1/8\) of the sphere — which makes geometric sense since the three coordinate planes divide the sphere into 8 octants.</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 280 260" width="280" height="260" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Sphere outline -->
  <circle cx="140" cy="130" r="95" fill="none" stroke="#666" stroke-width="1"/>
  <!-- Equator (partial, behind triangle) -->
  <ellipse cx="140" cy="175" rx="95" ry="22" fill="none" stroke="#666" stroke-width="1" stroke-dasharray="4,4"/>
  <!-- Triangle edges (great circle arcs approximated) -->
  <!-- u=(1,0,0) → v=(0,1,0): arc on equatorial plane -->
  <path d="M200,175 Q140,145 80,175" fill="none" stroke="#e05" stroke-width="2"/>
  <!-- u=(1,0,0) → w=(0,0,1): meridian arc -->
  <path d="M200,175 Q185,100 140,45" fill="none" stroke="#e05" stroke-width="2"/>
  <!-- v=(0,1,0) → w=(0,0,1): another meridian arc -->
  <path d="M80,175 Q95,100 140,45" fill="none" stroke="#e05" stroke-width="2"/>
  <!-- Vertices -->
  <circle cx="140" cy="45" r="5" fill="#27c"/>
  <text x="148" y="40" fill="#27c" font-size="12">w=(0,0,1)</text>
  <circle cx="200" cy="175" r="5" fill="#27c"/>
  <text x="206" y="180" fill="#27c" font-size="12">u=(1,0,0)</text>
  <circle cx="80" cy="175" r="5" fill="#27c"/>
  <text x="10" y="180" fill="#27c" font-size="12">v=(0,1,0)</text>
  <!-- Angle labels -->
  <text x="152" y="62" fill="#e05" font-size="11">α=π/2</text>
  <!-- Caption -->
  <text x="140" y="220" text-anchor="middle" fill="currentColor" font-size="11">a=b=c=π/2 · α=β=γ=π/2</text>
  <text x="140" y="236" text-anchor="middle" fill="currentColor" font-size="11">Angle sum 3π/2 &gt; π · Area = π/2</text>
</svg>
</div>

<div class="theorem"><strong>Theorem 2.18 (Area of Spherical Triangles — Girard's Theorem):</strong> The area of a positively oriented spherical triangle \([\mathbf{u},\mathbf{v},\mathbf{w}]\) with interior angles \(\alpha, \beta, \gamma\) is
\[ A = (\alpha + \beta + \gamma) - \pi. \]
This quantity \(\alpha + \beta + \gamma - \pi > 0\) is the spherical excess of the triangle.</div>

<div class="proof"><strong>Proof (Lune method):</strong> A <em>lune</em> with angle \(\alpha\) is the region on \(S^2\) bounded by two great semicircles meeting at angle \(\alpha\). Since the full sphere (\(2\pi\) radians) has area \(4\pi\), a lune with angle \(\alpha\) has area \(\frac{\alpha}{2\pi} \cdot 4\pi = 4\alpha\).

Let \(T = [\mathbf{u},\mathbf{v},\mathbf{w}]\) be the triangle with area \(A\), and let \(T' = [-\mathbf{u},-\mathbf{v},-\mathbf{w}]\) be the antipodal triangle (also with area \(A\)).

Let \(W_\alpha\) be the double wedge (lune + antipodal lune) whose boundary is the great circle through \(\mathbf{v}\) and \(\mathbf{w}\) and which contains \(\mathbf{u}\). Its area is \(4\alpha\). Similarly define \(W_\beta\) (area \(4\beta\)) and \(W_\gamma\) (area \(4\gamma\)).

The three double wedges together cover every point of \(S^2\): the triangle \(T\) and its antipode \(T'\) each get covered three times, and every other point gets covered once. Since the total sphere area is \(4\pi\):
\[ 4\alpha + 4\beta + 4\gamma = 4\pi + 4A + 4A \cdot 0 \implies \text{wait...}\]

More carefully: \(W_\alpha \cup W_\beta \cup W_\gamma = S^2\) and the overlaps are \(T, T'\), and the six pairs of arc regions. Counting with multiplicity: the sphere plus twice the triangle plus twice the antipodal triangle equals the sum of the three double-wedge areas:
\[4\pi + 2A + 2A = 4\alpha + 4\beta + 4\gamma,\]
wait, each overlap (triangle) is covered three times instead of once, so we add \(2A\) for \(T\) and \(2A\) for \(T'\):
\[4\alpha + 4\beta + 4\gamma = 4\pi + 4A \implies A = \alpha + \beta + \gamma - \pi.\]</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 360 200" width="360" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Lune W_α: shaded region between two great semicircles -->
  <!-- Left sphere showing the lune -->
  <circle cx="90" cy="100" r="75" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Lune shading: between two meridians at angle α -->
  <path d="M90,25 Q130,100 90,175 Q90,100 90,25" fill="#bdf" fill-opacity="0.6" stroke="none"/>
  <path d="M90,25 Q130,100 90,175" fill="none" stroke="#27c" stroke-width="2"/>
  <path d="M90,25 Q50,100 90,175" fill="none" stroke="#27c" stroke-width="2"/>
  <!-- Triangle T inside lune -->
  <path d="M90,25 Q110,90 120,140 Q90,125 60,140 Q70,90 90,25" fill="#27c" fill-opacity="0.35" stroke="#27c" stroke-width="1"/>
  <text x="90" y="105" text-anchor="middle" fill="#27c" font-size="11">T</text>
  <!-- Angle α label -->
  <text x="128" y="65" fill="currentColor" font-size="13">α</text>
  <text x="90" y="185" text-anchor="middle" fill="currentColor" font-size="11">Lune W_α, area = 4α</text>
  <!-- Divider -->
  <line x1="185" y1="10" x2="185" y2="190" stroke="#666" stroke-width="1"/>
  <!-- Right: schematic of three lunes covering sphere -->
  <circle cx="275" cy="100" r="75" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Lune 1 (α) -->
  <path d="M275,25 Q315,100 275,175 Q235,100 275,25" fill="#bdf" fill-opacity="0.3" stroke="#27c" stroke-width="1.2"/>
  <!-- Lune 2 (β) rotated -->
  <path d="M275,25 Q325,60 340,100 Q325,140 275,175 Q285,100 275,25" fill="#fdb" fill-opacity="0.3" stroke="#e80" stroke-width="1.2"/>
  <!-- Lune 3 (γ) rotated -->
  <path d="M275,25 Q225,60 210,100 Q225,140 275,175 Q265,100 275,25" fill="#dfd" fill-opacity="0.3" stroke="#282" stroke-width="1.2"/>
  <!-- Triangle in center -->
  <path d="M275,50 Q305,115 245,115 Z" fill="#77c" fill-opacity="0.5" stroke="#27c" stroke-width="1.5"/>
  <text x="275" y="95" text-anchor="middle" fill="#27c" font-size="11" font-weight="bold">T</text>
  <text x="275" y="185" text-anchor="middle" fill="currentColor" font-size="11">4α+4β+4γ = 4π+4A</text>
</svg>
</div>

This is one of the most beautiful theorems in geometry: the area of a spherical triangle is completely determined by its angle sum, with no reference to side lengths. Girard's theorem was proved by Albert Girard in 1629, though the result was likely known to Thomas Harriot independently around the same time. It was later generalized to all curved surfaces by Gauss and Bonnet.

![Spherical triangle on S²: vertices A, B, C with angles α, β, γ > corresponding flat angles; angle sum α+β+γ > π](/pics/pmath321/spherical-triangle.svg)

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

The polar triangle is a duality: sides and angles exchange roles up to supplementation. This allows us to derive the Second Law of Cosines from the First — apply the First Law to the polar triangle and use the substitutions \(a \mapsto \pi - \alpha'\), etc.

<div class="theorem"><strong>Theorem 2.22 (Spherical Sine Law):</strong> For any ordered spherical triangle \([\mathbf{u},\mathbf{v},\mathbf{w}]\):
\[ \frac{\sin a}{\sin\alpha} = \frac{\sin b}{\sin\beta} = \frac{\sin c}{\sin\gamma}. \]</div>

<div class="proof"><strong>Proof:</strong> We have \(\sin\alpha = \frac{|\det(\mathbf{u},\mathbf{v},\mathbf{w})|}{|\mathbf{u}\times\mathbf{v}||\mathbf{u}\times\mathbf{w}|} = \frac{|\det(\mathbf{u},\mathbf{v},\mathbf{w})|}{\sin c \sin b}\). The result follows by symmetry.</div>

<div class="theorem"><strong>Theorem 2.23 (First Law of Cosines):</strong> For any ordered spherical triangle:
\[ \cos\alpha = \frac{\cos a - \cos b\cos c}{\sin b\sin c}, \quad \cos\beta = \frac{\cos b - \cos a\cos c}{\sin a\sin c}, \quad \cos\gamma = \frac{\cos c - \cos a\cos b}{\sin a\sin b}. \]</div>

<div class="theorem"><strong>Theorem 2.25 (Second Law of Cosines):</strong> For any ordered spherical triangle:
\[ \cos a = \frac{\cos\alpha + \cos\beta\cos\gamma}{\sin\beta\sin\gamma}, \quad \cos b = \frac{\cos\beta + \cos\gamma\cos\alpha}{\sin\gamma\sin\alpha}, \quad \cos c = \frac{\cos\gamma + \cos\alpha\cos\beta}{\sin\alpha\sin\beta}. \]</div>

The Second Law is derived by applying the First Law to the polar triangle using the duality \(a \leftrightarrow \pi - \alpha'\), etc. The Second Law has no Euclidean analogue — it is purely spherical. Its existence reflects the AAA congruence property: you can solve for side lengths from angles.

<div class="example"><strong>Example 2.23a (SAS: given two sides and included angle, find the third side).</strong>

Let \(b = \pi/3\), \(c = \pi/4\), \(\alpha = \pi/2\) (the angle between sides \(b\) and \(c\) at vertex \(\mathbf{u}\)).

Using the spherical law of cosines (solving for side \(a\)):
\[\cos a = \cos b\cos c + \sin b\sin c\cos\alpha\]
\[= \cos(\pi/3)\cos(\pi/4) + \sin(\pi/3)\sin(\pi/4)\cos(\pi/2)\]
\[= \frac{1}{2}\cdot\frac{\sqrt{2}}{2} + \frac{\sqrt{3}}{2}\cdot\frac{\sqrt{2}}{2}\cdot 0 = \frac{\sqrt{2}}{4}.\]

So \(a = \cos^{-1}(\sqrt{2}/4) \approx \cos^{-1}(0.354) \approx 1.21\) radians \(\approx 69.3°\).

<em>Euclidean check:</em> By the Euclidean law of cosines, \(a^2 = b^2 + c^2 - 2bc\cos\alpha = (\pi/3)^2 + (\pi/4)^2 - 0 \approx 1.09 + 0.62 = 1.71\), so \(a \approx 1.31\). The spherical value (1.21) is smaller than the Euclidean value (1.31), consistent with positive curvature compressing distances.</div>

<div class="theorem"><strong>Corollary 2.24 (SSS and SAS):</strong> (1) Knowing the three side lengths determines the three angles. (2) Knowing two side lengths and the included angle determines the remaining side and angles.</div>

<div class="theorem"><strong>Corollary 2.26 (AAA and ASA):</strong> In spherical geometry (unlike Euclidean geometry), knowing all three angles determines the side lengths! This is because the Second Law of Cosines expresses side lengths in terms of angles.</div>

The AAA congruence corollary captures one of the most striking differences between spherical and Euclidean geometry: there is no concept of similar-but-not-congruent triangles on the sphere. Two spherical triangles with the same angles are necessarily the same size. This is because the sphere has a preferred scale — its radius — and angles encode scale information that is lost in flat space.

### Comparison: Euclidean vs. Spherical Triangle Laws

| Property | Euclidean | Spherical |
|---|---|---|
| Angle sum | \(\alpha+\beta+\gamma = \pi\) | \(\alpha+\beta+\gamma > \pi\) |
| Area | depends on base and height | \(= \alpha+\beta+\gamma-\pi\) (Girard) |
| Sine Law | \(\frac{\sin\alpha}{a} = \frac{\sin\beta}{b}\) | \(\frac{\sin\alpha}{\sin a} = \frac{\sin\beta}{\sin b}\) |
| Cosine Law | \(\cos\alpha = \frac{b^2+c^2-a^2}{2bc}\) | \(\cos\alpha = \frac{\cos a - \cos b\cos c}{\sin b\sin c}\) |
| AAA congruence | No (only similarity) | Yes |
| Parallel lines | Exactly one through any external point | None |

## 2.5 Isometries on \(S^2\)

Just as isometries of \(\mathbb{R}^n\) were characterized as maps of the form \(A\mathbf{x} + \mathbf{b}\), isometries of \(S^2\) have a clean algebraic description — and the ambient \(\mathbb{R}^3\) makes it transparent. The key insight is that an isometry of \(S^2\) must preserve lengths of vectors (since spherical distance equals angle between unit vectors), and any linear length-preserving map is orthogonal.

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

This mirrors the Euclidean Theorem 1.83: the composition law for reflections has the same form on \(S^2\) as in \(\mathbb{R}^2\). This is not a coincidence — it reflects the local flatness of the sphere (at any point, the geometry looks Euclidean to first order). The group-theoretic structure of reflections and rotations is the same everywhere.

<div class="theorem"><strong>Theorem 2.36 (Congruent Triangles):</strong> Given ordered triangles \([\mathbf{u},\mathbf{v},\mathbf{w}]\) and \([\mathbf{u}',\mathbf{v}',\mathbf{w}']\) in \(S^2\) with \(a = a'\), \(b = b'\), \(c = c'\), there exists a unique isometry \(F: S^2 \to S^2\) with \(F(\mathbf{u}) = \mathbf{u}'\), \(F(\mathbf{v}) = \mathbf{v}'\), \(F(\mathbf{w}) = \mathbf{w}'\). The isometry is constructed as a composite of at most three reflections in perpendicular bisectors.</div>

<div class="theorem"><strong>Theorem 2.39 (Geometric Classification of Isometries on \(S^2\)):</strong> Every isometry on \(S^2\) is either a rotation, a reflection, or a rotary inversion (the composite \(N R_{\mathbf{u},\theta} = -R_{\mathbf{u},\theta}\)).</div>

## 2.6 Projections of \(S^2\)

Several important projections map parts of \(S^2\) to flat regions. Each has distinctive properties. No single projection can faithfully represent all properties of the sphere on a flat map — there is always some distortion. This is a theorem (Gauss's Theorema Egregium, 1827): you cannot flatten a sphere without distortion. The choice of projection depends on which property one wishes to preserve: area, angle, or straightness of geodesics.

<strong>Orthogonal Projection:</strong> The map \(\phi: H \to D\) from the upper hemisphere \(H\) to the unit disc \(D\) given by \(\phi(x,y,z) = (x,y)\). The inverse is \(\psi(u,v) = (u, v, \sqrt{1-u^2-v^2})\).

<strong>Lambert Cylindrical Equal-Area Projection:</strong> The map \(\phi: S \to R\) (where \(S = S^2 \setminus \{\pm(0,0,1)\}\) and \(R\) is the rectangle \([0,2\pi)\times[-1,1]\)) given by projecting radially outward from the \(z\)-axis to the cylinder \(x^2+y^2=1\), then unrolling. The formula is \(\phi\!\left(\sqrt{1-z^2}\cos\theta, \sqrt{1-z^2}\sin\theta, z\right) = (\theta, z)\).

<div class="theorem"><strong>Theorem 2.45 (Lambert Preserves Area):</strong> The Lambert cylindrical equal-area projection preserves area.</div>

This is precisely Archimedes' hat-box theorem in the language of projections: the Lambert projection compresses latitude and expands longitude in a way that exactly cancels, preserving area.

<strong>Gnomonic Projection:</strong> The map \(\phi: H \to \mathbb{R}^2\) (where \(H\) is the open upper hemisphere) given by projecting radially from the origin to the plane \(z = 1\):
\[ \phi(x,y,z) = \left(\frac{x}{z}, \frac{y}{z}\right). \]

<div class="theorem"><strong>Theorem 2.49:</strong> The gnomonic projection maps great circles (intersected with \(H\)) to straight lines in \(\mathbb{R}^2\).</div>

This is why the gnomonic projection is used in navigation charts where straight-line paths represent great-circle routes. A ship navigator could draw a straight line from departure to destination on a gnomonic chart and read off the great-circle heading. The cost: angles and areas are severely distorted.

<strong>Stereographic Projection:</strong> The map \(\phi: S^2 \setminus \{(0,0,1)\} \to \mathbb{R}^2\) given by projecting through the north pole \((0,0,1)\) to the equatorial plane \(z=0\):

![Stereographic projection: from north pole N, point P on sphere maps to σ(P) on the equatorial plane ℂ](/pics/pmath321/stereographic-projection.svg)
\[ \phi(x,y,z) = \left(\frac{x}{1-z}, \frac{y}{1-z}\right), \qquad \psi(u,v) = \left(\frac{2u}{u^2+v^2+1}, \frac{2v}{u^2+v^2+1}, \frac{u^2+v^2-1}{u^2+v^2+1}\right). \]

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 250" width="320" height="250" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <defs>
    <marker id="arr2" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#e05"/>
    </marker>
  </defs>
  <!-- Sphere -->
  <ellipse cx="130" cy="110" rx="85" ry="85" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Equatorial plane z=0 -->
  <line x1="20" y1="190" x2="300" y2="190" stroke="#27c" stroke-width="1.5"/>
  <text x="302" y="195" fill="#27c" font-size="11">z=0</text>
  <!-- North pole N -->
  <circle cx="130" cy="25" r="4" fill="currentColor"/>
  <text x="138" y="23" fill="currentColor" font-size="12">N=(0,0,1)</text>
  <!-- South pole projects to origin -->
  <circle cx="130" cy="190" r="3" fill="currentColor"/>
  <text x="107" y="208" fill="currentColor" font-size="10">S→origin</text>
  <!-- Point P on sphere -->
  <circle cx="185" cy="95" r="4" fill="#e05"/>
  <text x="193" y="92" fill="#e05" font-size="12">P</text>
  <!-- Projection ray from N through P to plane -->
  <line x1="130" y1="25" x2="248" y2="190" stroke="#e05" stroke-width="1.2" stroke-dasharray="5,3" marker-end="url(#arr2)"/>
  <!-- σ(P) on the plane -->
  <circle cx="248" cy="190" r="4" fill="#e05"/>
  <text x="252" y="185" fill="#e05" font-size="11">σ(P)</text>
  <!-- Label formula -->
  <text x="130" y="230" text-anchor="middle" fill="currentColor" font-size="11">σ(x,y,z) = (x/(1−z), y/(1−z))</text>
  <text x="130" y="245" text-anchor="middle" fill="currentColor" font-size="10">Circles on sphere → circles/lines in plane · Conformal</text>
</svg>
</div>

<div class="theorem"><strong>Theorem 2.54:</strong> The inverse stereographic projection \(\psi: \mathbb{R}^2 \to S^2\) is a local scaling near \((u,v)\) of scaling factor \(c = \frac{2}{u^2+v^2+1}\). In particular, stereographic projection is conformal (angle-preserving).</div>

<div class="example"><strong>Example 2.54a (A stereographic projection computation).</strong>

Project the point \(P = (0, 0, -1)\) (south pole): \(\phi(0,0,-1) = (0/(1-(-1)), 0/(1-(-1))) = (0,0)\). The south pole maps to the origin.

Project \(P = (0, \sin\phi, \cos\phi)\) (a point at colatitude \(\phi\) on the \(yz\)-great circle):
\[\phi(P) = \left(\frac{0}{1-\cos\phi}, \frac{\sin\phi}{1-\cos\phi}\right) = \left(0, \cot(\phi/2)\right).\]
For \(\phi = \pi/2\) (the equator, south part): \(\phi(P) = (0, \cot(\pi/4)) = (0, 1)\).
For \(\phi = \pi/3\): \(\phi(P) = (0, \cot(\pi/6)) = (0, \sqrt{3}) \approx (0, 1.73)\).
For \(\phi \to 0\) (approaching north pole): \(\cot(\phi/2) \to \infty\). Confirmed: north pole maps to infinity.</div>

The conformality of stereographic projection means it is angle-faithful but not area-faithful. It will reappear in the Poincaré disc model: the circle inversion that defines hyperbolic reflections is a close relative of stereographic projection, and shares the same conformality property.

---

# Chapter 3: Projective Geometry

## Historical Motivation: Perspective and Infinity

Projective geometry has its roots in the Italian Renaissance. Artists like Brunelleschi (c. 1415) and Alberti (1435) developed rules for drawing in perspective: parallel lines converge to a point on the horizon, and the horizon itself is a "line at infinity." The mathematician Gérard Desargues (1591–1661) was the first to treat these vanishing points as actual geometric objects, creating projective geometry as a rigorous discipline.

The key insight is that two parallel lines in the Euclidean plane should be thought of as meeting at a "point at infinity" in the direction of the lines. Different families of parallel lines meet at different points at infinity, and all points at infinity together form the "line at infinity." Adding these ideal points gives the projective plane \(\mathbb{P}^2\), in which any two distinct lines meet in exactly one point — no exceptions.

This simplification is not merely aesthetic. Many theorems of classical geometry become cleaner in the projective setting: Desargues' theorem, Pascal's theorem, and Pappus' theorem all have simpler statements and proofs in \(\mathbb{P}^2\) than in \(\mathbb{R}^2\).

## 3.1 The Projective Plane

<div class="definition"><strong>Definition 3.4 (The Real Projective Plane):</strong> The real projective plane \(\mathbb{P}^2\) is the set of lines through the origin in \(\mathbb{R}^3\). Given \(\mathbf{0} \neq \mathbf{x} \in \mathbb{R}^3\), we let \([\mathbf{x}] = \mathrm{Span}\{\mathbf{x}\}\) denote the corresponding point in \(\mathbb{P}^2\). The projective distance between points \([\mathbf{x}], [\mathbf{y}] \in \mathbb{P}^2\) is
\[ d_P([\mathbf{x}], [\mathbf{y}]) = \min\!\left(\theta(\mathbf{x},\mathbf{y}),\, \pi - \theta(\mathbf{x},\mathbf{y})\right) = \cos^{-1}\!\frac{|\mathbf{x}\cdot\mathbf{y}|}{|\mathbf{x}||\mathbf{y}|} = \sin^{-1}\!\frac{|\mathbf{x}\times\mathbf{y}|}{|\mathbf{x}||\mathbf{y}|}. \]</div>

We can identify \(\mathbb{P}^2\) with the set of antipodal pairs \(\{\pm\mathbf{x}\}\) in \(S^2\). A projective point is a pair of antipodal spherical points — this "folding" of the sphere onto the projective plane is what makes the isometry group \(SO(3)\) (rather than \(O(3)\)).

<div class="example"><strong>Example 3.4a (Points and lines in homogeneous coordinates).</strong>

The projective point \([1,2,3]\) in \(\mathbb{P}^2\) represents the line through the origin and \((1,2,3)\) in \(\mathbb{R}^3\). We have \([1,2,3] = [2,4,6] = [-1,-2,-3]\) as projective points.

The projective line \(L_{(0,0,1)}\) with pole \((0,0,1)\) consists of all lines in \(\mathbb{R}^3\) lying in the \(xy\)-plane \(z=0\): \(\{[x,y,0] : (x,y)\neq(0,0)\}\). In the affine chart \(\phi_3([x,y,z]) = (x/z, y/z)\), this line is the "line at infinity" — you cannot reach it by setting \(z \neq 0\).

A point in the affine chart \(U_3 = \{[x,y,z] : z\neq 0\}\) can be written as \([u,v,1]\) via the identification \((u,v) \mapsto [u,v,1]\). The "ordinary" points of \(\mathbb{R}^2\) correspond to \(U_3\), and the line at infinity \(L_{(0,0,1)}\) consists of the "new" projective points added.</div>

<div class="theorem"><strong>Theorem 3.6 (Metric Properties):</strong> \(d_P\) satisfies positive definiteness (with values in \([0, \pi/2]\)), symmetry, and the triangle inequality.</div>

<div class="definition"><strong>Definition 3.9 (Projective Line):</strong> A projective line in \(\mathbb{P}^2\) is the set of all lines through the origin in \(\mathbb{R}^3\) which lie in a given plane through the origin. Each projective line corresponds to a Euclidean plane through the origin and has a pole \(\mathbf{u} \in \mathbb{P}^2\) (the line perpendicular to the plane). We write \(L_\mathbf{u}\) for the line with pole \(\mathbf{u}\). Note that \(L_\mathbf{u} = C(\mathbf{u}, \pi/2)\).</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 360 240" width="360" height="240" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Affine plane box -->
  <rect x="20" y="40" width="320" height="160" fill="#f9f9f9" stroke="#777" stroke-width="1.2" rx="4"/>
  <!-- Line at infinity (top border) -->
  <rect x="20" y="20" width="320" height="20" fill="#bdf" fill-opacity="0.6" stroke="#27c" stroke-width="1.2"/>
  <text x="180" y="34" text-anchor="middle" fill="#27c" font-size="11">Line at infinity L_{(0,0,1)} = { [x,y,0] }</text>
  <text x="60" y="34" fill="#27c" font-size="10">P_∞=[1,0,0]</text>
  <text x="260" y="34" fill="#27c" font-size="10">P_∞′=[0,1,0]</text>
  <!-- Two parallel lines converging to point at infinity -->
  <line x1="40" y1="200" x2="180" y2="30" stroke="#e05" stroke-width="1.5"/>
  <line x1="100" y1="200" x2="180" y2="30" stroke="#e80" stroke-width="1.5"/>
  <!-- Convergence point -->
  <circle cx="180" cy="30" r="4" fill="#e05"/>
  <!-- Labels for the lines -->
  <text x="30" y="200" fill="#e05" font-size="10">y=2x+1</text>
  <text x="96" y="210" fill="#e80" font-size="10">y=2x+3</text>
  <!-- "ordinary" label -->
  <text x="180" y="130" text-anchor="middle" fill="currentColor" font-size="11">Affine plane ℝ² = {[u,v,1]}</text>
  <text x="180" y="148" text-anchor="middle" fill="currentColor" font-size="11">Parallel lines meet at [1,2,0] ∈ L_∞</text>
  <text x="180" y="220" text-anchor="middle" fill="currentColor" font-size="11">In ℙ²: any two distinct lines meet in exactly one point</text>
</svg>
</div>

![Projective plane: parallel lines (railway tracks) converge to a point at infinity P_∞ on the line at infinity](/pics/pmath321/projective-infinity.svg)

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

The isometry group of \(\mathbb{P}^2\) is strictly smaller than that of \(S^2\) (\(SO(3)\) versus \(O(3)\)), because orientation-reversing maps of \(S^2\) — such as reflections — do not descend to well-defined isometries of \(\mathbb{P}^2\). This is because the antipodal identification \(\mathbf{x} \sim -\mathbf{x}\) interacts badly with orientation reversal.

## 3.2 Homogeneous Coordinates and Zero Sets

To do algebra in \(\mathbb{P}^2\), we use homogeneous coordinates, which package the equivalence class \([\mathbf{x}]\) into a coordinate triple well-suited for polynomial equations. The key point is that polynomial equations in homogeneous coordinates are well-defined on \(\mathbb{P}^2\) if and only if the polynomial is homogeneous.

<div class="definition"><strong>Definition 3.16 (Homogeneous Coordinates):</strong> We write \([x,y,z] = \mathrm{Span}\{(x,y,z)\} \in \mathbb{P}^2\) for homogeneous coordinates. Define open sets \(U_1 = \{[x,y,z] \mid x \neq 0\}\), etc. The gnomonic projections \(\phi_k: U_k \to \mathbb{R}^2\) are:
\[ \phi_1([x,y,z]) = \left(\frac{y}{x}, \frac{z}{x}\right), \quad \phi_2([x,y,z]) = \left(\frac{x}{y}, \frac{z}{y}\right), \quad \phi_3([x,y,z]) = \left(\frac{x}{z}, \frac{y}{z}\right). \]
We can view \(\mathbb{P}^2 = U_k \cup L_k\) where \(L_k = \mathbb{P}^2 \setminus U_k\) is the "line at infinity" for the copy \(U_k \cong \mathbb{R}^2\).</div>

<div class="definition"><strong>Definition 3.19 (Homogeneous Polynomial):</strong> A polynomial \(F(x,y,z)\) is homogeneous of degree \(n\) if every term has total degree \(n\), equivalently \(F(tx,ty,tz) = t^n F(x,y,z)\). For such \(F\), the zero set in \(\mathbb{P}^2\) is well-defined:
\[ Z(F) = \left\{ [x,y,z] \in \mathbb{P}^2 \mid F(x,y,z) = 0 \right\}. \]</div>

Homogeneous polynomials are necessary because the coordinates of a projective point are only defined up to scaling: replacing \((x,y,z)\) by \((tx,ty,tz)\) changes \(F\) by \(t^n\), which vanishes if and only if \(F\) vanishes. So the zero set is consistent across representatives. A non-homogeneous polynomial like \(x + y + z^2 = 0\) would be inconsistent: replacing \((x,y,z)\) by \((2x,2y,2z)\) gives \(2x + 2y + 4z^2 = 0\), a different equation.

<div class="definition"><strong>Definition 3.24 (Homogenization):</strong> Given a polynomial \(f(x,y)\) of degree \(n\), its homogenization is \(F(x,y,z) = z^n f(x/z, y/z)\). The zero set \(Z(F) \subseteq \mathbb{P}^2\) is the projective completion of \(Z(f) \subseteq \mathbb{R}^2\). Points of the form \([x,y,0]\) in \(Z(F)\) are called zeros at infinity.</div>

## 3.3 Conic Sections

The projective plane is the natural home for conic sections, where the classical distinction between ellipse, parabola, and hyperbola dissolves: all non-degenerate conics are projectively equivalent, the differences arising only from how the conic meets the line at infinity.

An ellipse meets the line at infinity in no real points (it is "bounded"). A parabola is tangent to the line at infinity at one point. A hyperbola meets the line at infinity in two distinct real points (its asymptotic directions). From the projective perspective, these are all the same curve — we just view them from different affine charts.

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

<div class="example"><strong>Example 3.35a (Desargues' theorem in homogeneous coordinates).</strong>

Let \(u = [1,0,0]\), \(v = [0,1,0]\), \(w = [0,0,1]\), and take the perspective center \(p = [1,1,1]\).

Place \(u' = [2,1,1]\), \(v' = [1,2,1]\), \(w' = [1,1,2]\).

Check that lines \(uu'\), \(vv'\), \(ww'\) pass through \(p = [1,1,1]\):
- \(uu'\): the line through \([1,0,0]\) and \([2,1,1]\) contains \([1,0,0] + [1,1,1] = [2,1,1]\). And \([1,1,1]\) itself lies on this line since \([1,1,1] = [2,1,1] - [1,0,0]\) (as projective combinations). ✓

By Desargues' theorem, the points \(a = (vw)\cap(v'w')\), \(b = (wu)\cap(w'u')\), \(c = (uv)\cap(u'v')\) should be collinear. We can verify this computationally using cross products in homogeneous coordinates.</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 290" width="320" height="290" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Center of perspectivity p -->
  <circle cx="160" cy="20" r="4" fill="currentColor"/>
  <text x="168" y="18" fill="currentColor" font-size="12">p</text>
  <!-- Triangle uvw (outer) -->
  <circle cx="70" cy="120" r="4" fill="#27c"/>
  <text x="56" y="118" fill="#27c" font-size="12">u</text>
  <circle cx="250" cy="120" r="4" fill="#27c"/>
  <text x="255" y="118" fill="#27c" font-size="12">v</text>
  <circle cx="160" cy="190" r="4" fill="#27c"/>
  <text x="166" y="202" fill="#27c" font-size="12">w</text>
  <!-- Triangle u'v'w' (inner) -->
  <circle cx="112" cy="160" r="4" fill="#e05"/>
  <text x="98" y="158" fill="#e05" font-size="12">u′</text>
  <circle cx="208" cy="160" r="4" fill="#e05"/>
  <text x="213" y="158" fill="#e05" font-size="12">v′</text>
  <circle cx="160" cy="230" r="4" fill="#e05"/>
  <text x="166" y="244" fill="#e05" font-size="12">w′</text>
  <!-- Lines from p through corresponding vertices -->
  <line x1="160" y1="20" x2="70" y2="120" stroke="#999" stroke-width="1" stroke-dasharray="4,3"/>
  <line x1="160" y1="20" x2="250" y2="120" stroke="#999" stroke-width="1" stroke-dasharray="4,3"/>
  <line x1="160" y1="20" x2="160" y2="230" stroke="#999" stroke-width="1" stroke-dasharray="4,3"/>
  <!-- Outer triangle edges -->
  <line x1="70" y1="120" x2="250" y2="120" stroke="#27c" stroke-width="1.5"/>
  <line x1="70" y1="120" x2="160" y2="190" stroke="#27c" stroke-width="1.5"/>
  <line x1="250" y1="120" x2="160" y2="190" stroke="#27c" stroke-width="1.5"/>
  <!-- Inner triangle edges -->
  <line x1="112" y1="160" x2="208" y2="160" stroke="#e05" stroke-width="1.5"/>
  <line x1="112" y1="160" x2="160" y2="230" stroke="#e05" stroke-width="1.5"/>
  <line x1="208" y1="160" x2="160" y2="230" stroke="#e05" stroke-width="1.5"/>
  <!-- Pascal/Desargues collinear line -->
  <line x1="20" y1="270" x2="300" y2="270" stroke="#2a2" stroke-width="1.5" stroke-dasharray="6,3"/>
  <text x="160" y="286" text-anchor="middle" fill="#2a2" font-size="11">a, b, c collinear (Desargues line)</text>
</svg>
</div>

<div class="theorem"><strong>Theorem 3.36 (Pappus' Theorem):</strong> Let \(L\) and \(L'\) be distinct lines in \(\mathbb{P}^2\), with distinct points \(u,v,w \in L\) and \(u',v',w' \in L'\). Define \(a = (vw')\cap(wv')\), \(b = (wu')\cap(uw')\), \(c = (uv')\cap(vu')\). Then \(a, b, c\) are collinear.</div>

Pappus' theorem (Pappus of Alexandria, c. 340 AD) is one of the oldest projective theorems. It predates projective geometry as a formal theory by over a millennium — Pappus proved it as a fact about hexagons inscribed in pairs of lines, without the projective language. In the projective plane, it is equivalent to commutativity of the underlying field.

<div class="theorem"><strong>Theorem 3.39 (Pascal's Theorem):</strong> Let \(C\) be a (non-degenerate) conic in \(\mathbb{P}^2\) and let \(u_1, u_2, u_3, u_4, u_5, u_6\) be six distinct points on \(C\). Define
\[ a = (u_1 u_2)\cap(u_4 u_5), \quad b = (u_2 u_3)\cap(u_5 u_6), \quad c = (u_3 u_4)\cap(u_6 u_1). \]
Then \(a, b, c\) are collinear (they lie on the "Pascal line").</div>

<div class="proof"><strong>Proof sketch:</strong> By projective transformation, reduce to the case where \(C\) is a circle in \(\mathbb{R}^2\). Use a circle \(D\) through \(u_2, u_5, a\). Apply the lemma that if two circles intersect at \(p\) and \(q\), and a chord through \(p\) meets the second circle at \(c\) while a chord through \(q\) meets it at \(d\), then the original chord pair and \(cd\) are parallel. This produces parallel line triples which force collinearity of \(a, b, c\).</div>

<div class="example"><strong>Example 3.39a (Pascal's theorem on a circle).</strong>

Take the unit circle \(x^2+y^2=1\) and six points:
\[u_1 = (1,0),\; u_2 = (0,1),\; u_3 = (-1,0),\; u_4 = (0,-1),\; u_5 = (1/\sqrt{2}, 1/\sqrt{2}),\; u_6 = (-1/\sqrt{2}, 1/\sqrt{2}).\]

The line through \(u_1 = (1,0)\) and \(u_2 = (0,1)\) has equation \(x + y = 1\).
The line through \(u_4 = (0,-1)\) and \(u_5 = (1/\sqrt{2}, 1/\sqrt{2})\) has equation \(y = (1+1/\sqrt{2})x - 1\).
Their intersection point \(a\) is computed by substituting.

Pascal's theorem guarantees that the three such intersection points \(a\), \(b\), \(c\) are collinear, regardless of which six points on the circle we chose.</div>

When the conic degenerates to a pair of lines, Pascal's Theorem reduces to Pappus' Theorem.

### Comparison: Euclidean vs. Projective Geometry

| Property | Euclidean | Projective |
|---|---|---|
| Parallel lines | May or may not intersect | Always intersect (at a point at infinity) |
| Distinct lines in a plane | 0 or 1 intersection points | Always exactly 1 |
| Distance | Defined | Not defined (no metric) |
| Angles | Defined | Not defined |
| Circles vs. ellipses vs. hyperbolas | All different | Projectively equivalent |
| Desargues' theorem | Holds (with exceptions) | Holds universally |

---

# Chapter 4: Hyperbolic Geometry

## Historical Narrative: Two Thousand Years of a Failed Proof

The story of hyperbolic geometry is one of the most dramatic in mathematics. Euclid's five postulates had stood as the foundation of geometry since around 300 BC. The fifth postulate — the parallel postulate — was always the odd one out: it is more complex than the other four, and generations of mathematicians suspected it was actually a theorem derivable from the others.

For two millennia, mathematicians tried to prove the parallel postulate from the first four. Proclus (5th century AD), al-Haytham (11th century), Saccheri (1733), Lambert (1766), Legendre (early 19th century) — all attempted the proof, and all failed. Saccheri and Lambert actually derived many consequences of the negation of the parallel postulate, without realizing they were building a new geometry.

The breakthrough came simultaneously and independently around 1830, from three mathematicians. János Bolyai (1802–1860), a Hungarian officer's son, published his discovery of hyperbolic geometry in 1832 as an appendix to his father's book. His father sent it to Carl Friedrich Gauss — who replied that he had discovered the same thing decades earlier but never published, fearing the "clamor of the Boeotians" (ridicule from contemporaries). Nikolai Lobachevsky (1792–1856), a Russian mathematician, had published similar results as early as 1829. Gauss had the ideas but lacked the courage to publish; Bolyai and Lobachevsky had the courage.

The existence of hyperbolic geometry was a philosophical earthquake. It showed that the parallel postulate is <em>independent</em> of the other four — a logically consistent geometry exists in which it fails. Euclid's geometry is not "the" geometry; it is a geometry. This opened the door to Riemann's generalization (1854), which is the foundation of Einstein's general relativity.

The first concrete <em>model</em> of hyperbolic geometry was constructed by Eugenio Beltrami in 1868. Henri Poincaré gave the disc model in 1882, and Felix Klein gave another model the same year. The model we study in this course — the Poincaré disc — is perhaps the most beautiful, and is the inspiration for M.C. Escher's famous "Circle Limit" series of drawings.

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

Geometrically, circle inversion sends points inside \(C\) to points outside \(C\) and vice versa, fixing points on \(C\) itself. Points close to the center \(a\) map to points far away, and points far from \(a\) map to points close to \(a\). The center itself has no image (it maps to "infinity"), which is why the domain excludes \(a\).

<div class="example"><strong>Example 4.1a (Inverting a point through a circle).</strong>

Let \(C\) be the circle centred at the origin with radius \(r = 2\). Invert the point \(\mathbf{x} = (1, 0)\):
\[F_C(\mathbf{x}) = \frac{r^2}{|\mathbf{x}|^2}\mathbf{x} = \frac{4}{1}(1,0) = (4,0).\]

Invert the point \(\mathbf{x} = (4, 0)\):
\[F_C((4,0)) = \frac{4}{16}(4,0) = (1,0).\]
Confirmed: inversion is its own inverse. ✓

Invert \(\mathbf{x} = (1,1)\): \(|\mathbf{x}|^2 = 2\),
\[F_C((1,1)) = \frac{4}{2}(1,1) = (2,2).\]
Check \(F_C((2,2)) = \frac{4}{8}(2,2) = (1,1)\). ✓

Invert a point on \(C\): \(\mathbf{x} = (2, 0)\),
\[F_C((2,0)) = \frac{4}{4}(2,0) = (2,0).\]
Points on the circle are fixed. ✓</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 380 180" width="380" height="180" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <defs>
    <marker id="arr3" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- Circle C -->
  <circle cx="110" cy="90" r="70" fill="none" stroke="#27c" stroke-width="1.8"/>
  <!-- Center O -->
  <circle cx="110" cy="90" r="3" fill="currentColor"/>
  <text x="100" y="106" fill="currentColor" font-size="12">O</text>
  <!-- Radius label -->
  <line x1="110" y1="90" x2="180" y2="90" stroke="#999" stroke-width="1" stroke-dasharray="3,2"/>
  <text x="142" y="84" fill="currentColor" font-size="11">r</text>
  <!-- x inside circle -->
  <circle cx="145" cy="90" r="4" fill="#e05"/>
  <text x="148" y="82" fill="#e05" font-size="12">x</text>
  <!-- x' = F_C(x) outside circle -->
  <circle cx="280" cy="90" r="4" fill="#27c"/>
  <text x="284" y="82" fill="#27c" font-size="12">x′=F_C(x)</text>
  <!-- Arrow from x to x' -->
  <line x1="151" y1="90" x2="274" y2="90" stroke="currentColor" stroke-width="1.3" marker-end="url(#arr3)"/>
  <text x="212" y="80" text-anchor="middle" fill="currentColor" font-size="11">r²/|x|</text>
  <!-- Key properties -->
  <text x="190" y="130" text-anchor="middle" fill="currentColor" font-size="11">inside → outside · boundary fixed · F_C²=I</text>
  <text x="190" y="148" text-anchor="middle" fill="currentColor" font-size="10">Circles and lines map to circles and lines (generalized circles)</text>
</svg>
</div>

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

Conformality is a crucial property. It means circle inversion preserves angles between curves (though it reverses orientation). This is why the Poincaré disc model is conformal: hyperbolic angles equal Euclidean angles, making it visually interpretable.

## 4.2 The Poincaré Disc Model

We now have all the ingredients to define the hyperbolic plane. The idea is to take the Euclidean open unit disc and equip it with a new metric that stretches distances near the boundary — so that the boundary circle is "infinitely far away" and the disc becomes a model of infinite negatively curved space.

Imagine living inside this disc as a hyperbolic creature. You cannot reach the boundary — it is infinitely far away. If you walk outward at constant hyperbolic speed, you slow down (from a Euclidean perspective) and never reach the edge. The grid of equal-spacing hyperbolic squares, when drawn in Euclidean coordinates, looks like Escher's "Circle Limit" drawings: fish or angels that shrink toward the boundary but are all "the same size" to the hyperbolic observer.

<div class="definition"><strong>Definition 4.10 (The Hyperbolic Plane):</strong> The hyperbolic plane is the open unit disc
\[ \mathbb{H}^2 = \left\{ \mathbf{x} \in \mathbb{R}^2 \mid |\mathbf{x}| < 1 \right\}. \]
The boundary \(S^1 = \{|\mathbf{x}| = 1\}\) consists of points at infinity (or asymptotic points). Hyperbolic length and area are measured by the infinitesimal rescaling:
\[ d_H L = \frac{2}{1-|\mathbf{x}|^2}\,d_E L, \qquad d_H A = \frac{4}{(1-|\mathbf{x}|^2)^2}\,d_E A. \]
The hyperbolic length of a curve \(\mathbf{x} = \alpha(t)\), \(a \leq t \leq b\) is
\[ L = \int_a^b \frac{2|\alpha'(t)|}{1 - |\alpha(t)|^2}\,dt. \]
Hyperbolic angles are the same as Euclidean angles.</div>

The metric blows up at the boundary \(S^1\), meaning points near the boundary are "infinitely far away" in the hyperbolic metric. The disc looks finite to Euclidean eyes but is infinite to a hyperbolic observer.

The choice of conformal factor \(\frac{2}{1-|\mathbf{x}|^2}\) is not arbitrary: it is the unique factor (up to scaling) that makes the resulting geometry have constant curvature \(-1\). The Gaussian curvature of this metric is:
\[K = -\frac{1}{2}\Delta \log\left(\frac{2}{1-|\mathbf{x}|^2}\right)^2 = -1.\]
The conformality of the model — hyperbolic angles equal Euclidean angles — is what gives the Poincaré disc its aesthetic appeal in Escher's famous "Circle Limit" drawings.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 310" width="320" height="310" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Boundary circle S¹ -->
  <circle cx="160" cy="150" r="120" fill="#fafff8" stroke="currentColor" stroke-width="2"/>
  <text x="255" y="50" fill="currentColor" font-size="11">S¹ = ∞</text>
  <!-- Diameter geodesic (horizontal) -->
  <line x1="40" y1="150" x2="280" y2="150" stroke="#e05" stroke-width="1.5"/>
  <!-- Diameter geodesic (vertical) -->
  <line x1="160" y1="30" x2="160" y2="270" stroke="#e05" stroke-width="1.5"/>
  <!-- Arc geodesic 1: circle orthogonal to S¹ -->
  <path d="M40,150 A110,110 0 0,1 230,60" fill="none" stroke="#27c" stroke-width="1.5"/>
  <!-- Arc geodesic 2 -->
  <path d="M280,150 A110,110 0 0,0 90,60" fill="none" stroke="#27c" stroke-width="1.5"/>
  <!-- Arc geodesic 3 -->
  <path d="M100,270 A95,95 0 0,1 220,270" fill="none" stroke="#2a2" stroke-width="1.5"/>
  <!-- Origin -->
  <circle cx="160" cy="150" r="4" fill="currentColor"/>
  <text x="166" y="147" fill="currentColor" font-size="11">0</text>
  <!-- Labels -->
  <text x="160" y="295" text-anchor="middle" fill="#e05" font-size="11">— diameters (geodesics)</text>
  <text x="160" y="310" text-anchor="middle" fill="#27c" font-size="11">— arcs orthogonal to S¹ (geodesics)</text>
</svg>
</div>

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

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 480 210" width="480" height="210" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- INTERSECTING -->
  <text x="75" y="18" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Intersecting</text>
  <text x="75" y="32" text-anchor="middle" fill="currentColor" font-size="10">(meet inside H²)</text>
  <circle cx="75" cy="115" r="70" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Two lines crossing inside -->
  <path d="M20,80 A90,90 0 0,1 130,80" fill="none" stroke="#e05" stroke-width="1.8"/>
  <path d="M20,150 A90,90 0 0,0 130,150" fill="none" stroke="#27c" stroke-width="1.8"/>
  <circle cx="75" cy="115" r="3" fill="currentColor"/>
  <!-- ASYMPTOTIC -->
  <text x="240" y="18" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Asymptotic</text>
  <text x="240" y="32" text-anchor="middle" fill="currentColor" font-size="10">(meet on S¹)</text>
  <circle cx="240" cy="115" r="70" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Two lines meeting at boundary -->
  <path d="M185,155 A60,60 0 0,1 295,75" fill="none" stroke="#e05" stroke-width="1.8"/>
  <path d="M185,155 A120,120 0 0,0 295,75" fill="none" stroke="#27c" stroke-width="1.8"/>
  <circle cx="295" cy="75" r="4" fill="currentColor"/>
  <text x="302" y="71" fill="currentColor" font-size="10">on S¹</text>
  <!-- ULTRAPARALLEL -->
  <text x="405" y="18" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Ultraparallel</text>
  <text x="405" y="32" text-anchor="middle" fill="currentColor" font-size="10">(no meeting)</text>
  <circle cx="405" cy="115" r="70" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Two non-meeting arcs -->
  <path d="M350,80 A80,80 0 0,1 350,150" fill="none" stroke="#e05" stroke-width="1.8"/>
  <path d="M460,80 A80,80 0 0,0 460,150" fill="none" stroke="#27c" stroke-width="1.8"/>
  <!-- Caption -->
  <text x="240" y="200" text-anchor="middle" fill="currentColor" font-size="11">Three types of line pairs in ℍ²</text>
</svg>
</div>

## 4.3 Geodesics and Distance

<div class="theorem"><strong>Theorem 4.24 (Geodesics are Lines):</strong> The geodesics in \(\mathbb{H}^2\) (curves minimizing hyperbolic arclength) are exactly the hyperbolic lines.</div>

<div class="proof"><strong>Proof:</strong> First show that the straight line from \(\mathbf{0}\) to \(\mathbf{u}\) is the shortest path. Using polar coordinates, for any curve \(C\) from \(\mathbf{0}\) to \(\mathbf{u}\):
\[ L(C) = \int \frac{2\sqrt{(r')^2 + r^2(\theta')^2}}{1-r^2}\,dt \geq \int \frac{2|r'|}{1-r^2}\,dt \geq \int_0^{|u|} \frac{2}{1-r^2}\,dr = \ln\frac{1+|\mathbf{u}|}{1-|\mathbf{u}|}. \]
Equality holds iff \(\theta' = 0\) and \(r' \geq 0\), i.e., \(C\) is the straight line segment. For general \(\mathbf{u}, \mathbf{v}\), apply an isometry \(F_L\) to move \(\mathbf{u}\) to \(\mathbf{0}\).</div>

The proof has the same structure as the classical Euclidean proof that straight lines are shortest: reduce to a straight radial path by discarding angular components, then integrate. The key difference is the metric weight \(\frac{2}{1-r^2}\), which makes the calculation purely one-dimensional.

<div class="definition"><strong>Definition 4.25 (Hyperbolic Distance):</strong> For \(\mathbf{u}, \mathbf{v} \in \mathbb{H}^2\), the hyperbolic distance \(d_H(\mathbf{u},\mathbf{v})\) is the hyperbolic length along the unique hyperbolic line from \(\mathbf{u}\) to \(\mathbf{v}\).</div>

From Example 4.11, the distance from \(\mathbf{0}\) to \(\mathbf{u}\) is:
\[ d_H(\mathbf{0}, \mathbf{u}) = \ln\frac{1+|\mathbf{u}|}{1-|\mathbf{u}|}. \]

<div class="example"><strong>Example 4.25a (Computing hyperbolic distances).</strong>

(1) Distance from \(\mathbf{0}\) to \((0.5, 0)\):
\[d_H(\mathbf{0}, (0.5,0)) = \ln\frac{1+0.5}{1-0.5} = \ln\frac{1.5}{0.5} = \ln 3 \approx 1.099.\]
The Euclidean distance is \(0.5\), much shorter. Near the center, hyperbolic and Euclidean distances are similar; far from the center, they diverge.

(2) Distance from \(\mathbf{0}\) to \((0.9, 0)\):
\[d_H(\mathbf{0}, (0.9,0)) = \ln\frac{1.9}{0.1} = \ln 19 \approx 2.944.\]
Euclidean distance: \(0.9\). The ratio \(d_H/d_E \approx 3.27\) — the hyperbolic distance has stretched significantly.

(3) Distance from \(\mathbf{0}\) to \((0.99, 0)\):
\[d_H = \ln\frac{1.99}{0.01} = \ln 199 \approx 5.29.\]
The boundary at \(|\mathbf{x}|=1\) would require \(d_H = \ln\infty = \infty\). The boundary is infinitely far away.

(4) Using the general formula for \(d_H((0.3,0), (0.6,0))\):
\[d_H = \cosh^{-1}\!\left(1 + \frac{2|0.6-0.3|^2}{(1-0.09)(1-0.36)}\right) = \cosh^{-1}\!\left(1 + \frac{2\cdot0.09}{0.91\cdot0.64}\right) = \cosh^{-1}\!\left(1 + \frac{0.18}{0.5824}\right) \approx \cosh^{-1}(1.309) \approx 0.791.\]</div>

<div class="theorem"><strong>Theorem 4.26 (Distance Formula):</strong> For \(\mathbf{u}, \mathbf{v} \in \mathbb{H}^2\):
\[ d_H(\mathbf{u},\mathbf{v}) = \cosh^{-1}\!\left(1 + \frac{2|\mathbf{v}-\mathbf{u}|^2}{(1-|\mathbf{u}|^2)(1-|\mathbf{v}|^2)}\right). \]</div>

<div class="proof"><strong>Proof:</strong> Use an isometry to move \(\mathbf{u}\) to \(\mathbf{0}\), obtaining \(d_H(\mathbf{u},\mathbf{v}) = d_H(\mathbf{0},\mathbf{w})\) for \(\mathbf{w} = F_L(\mathbf{v})\). Then compute \(\cosh(d_H(\mathbf{0},\mathbf{w})) = \frac{1+|\mathbf{w}|^2}{1-|\mathbf{w}|^2} = 1 + \frac{2|\mathbf{w}|^2}{1-|\mathbf{w}|^2}\) and use the explicit formula for \(|\mathbf{w}|^2\) in terms of \(\mathbf{u}\) and \(\mathbf{v}\).</div>

The appearance of \(\cosh^{-1}\) in the distance formula, where \(\cos^{-1}\) appeared in the spherical formula, is not a coincidence: it reflects the fact that spherical and hyperbolic geometry are related by replacing trigonometric functions with their hyperbolic counterparts, corresponding to curvatures \(+1\) and \(-1\) respectively.

<div class="theorem"><strong>Theorem 4.29 (Hyperbolic Circumference and Area):</strong> For \(\mathbf{u} \in \mathbb{H}^2\) and \(r > 0\), the hyperbolic circle \(C_H(\mathbf{u},r)\) has circumference and the disc \(D_H(\mathbf{u},r)\) has area:
\[ L = 2\pi\sinh r, \qquad A = 2\pi(\cosh r - 1). \]</div>

These formulas grow exponentially in \(r\), reflecting the negative curvature of \(\mathbb{H}^2\). For large \(r\), \(L \approx \pi e^r\) — circles grow much faster in hyperbolic space than in Euclidean space. This exponential growth is why negatively curved spaces have so much "room": many more points are far from any given point than in flat space, which is the geometric reason hyperbolic groups tend to have exponential word growth.

Compare the three geometries:

| Geometry | Curvature | Circumference | Area of disc |
|---|---|---|---|
| Euclidean | \(0\) | \(2\pi r\) | \(\pi r^2\) |
| Spherical | \(+1\) | \(2\pi\sin r\) | \(2\pi(1-\cos r)\) |
| Hyperbolic | \(-1\) | \(2\pi\sinh r\) | \(2\pi(\cosh r - 1)\) |

The Euclidean formulas emerge as the \(r \to 0\) limit in all cases, reflecting local flatness: \(\sin r \approx r\), \(\sinh r \approx r\), \(1-\cos r \approx r^2/2\), \(\cosh r - 1 \approx r^2/2\).

## 4.4 Angles and Triangles in Hyperbolic Geometry

Hyperbolic triangles have interior angle sum strictly less than \(\pi\), and the deficit \(\pi - (\alpha + \beta + \gamma)\) equals the area — exactly analogous to the spherical excess.

<div class="definition"><strong>Definition 4.30 (Horocycles and Hypercycles):</strong>
<ul>
<li>A <em>horocycle</em> is a Euclidean circle tangent to \(S^1\) from inside (intersects \(S^1\) at exactly one point).</li>
<li>A <em>hypercycle</em> is a Euclidean circle intersecting \(S^1\) at two distinct points, intersected with \(\mathbb{H}^2\).</li>
</ul></div>

Horocycles and hypercycles are the hyperbolic analogues of circles and lines in the Euclidean sense: a horocycle is orthogonal to all hyperbolic lines through its "centre at infinity," while a hypercycle is the locus of points at constant distance from a given hyperbolic line.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 380 230" width="380" height="230" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- HOROCYCLE -->
  <text x="90" y="18" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Horocycle</text>
  <text x="90" y="32" text-anchor="middle" fill="currentColor" font-size="10">(tangent to S¹)</text>
  <!-- Disc -->
  <circle cx="90" cy="120" r="80" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Horocycle: circle tangent to S¹ at bottom (from inside) -->
  <circle cx="90" cy="160" r="40" fill="none" stroke="#e05" stroke-width="1.8"/>
  <!-- Tangent point -->
  <circle cx="90" cy="200" r="4" fill="#e05"/>
  <text x="98" y="215" fill="#e05" font-size="10">tangent pt on S¹</text>
  <text x="90" y="105" text-anchor="middle" fill="#e05" font-size="10">horocycle</text>
  <!-- Divider -->
  <line x1="195" y1="10" x2="195" y2="220" stroke="#666" stroke-width="1"/>
  <!-- HYPERCYCLE -->
  <text x="295" y="18" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Hypercycle</text>
  <text x="295" y="32" text-anchor="middle" fill="currentColor" font-size="10">(chord of S¹)</text>
  <!-- Disc -->
  <circle cx="295" cy="120" r="80" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Geodesic (hyperbolic line, diameter) -->
  <line x1="215" y1="120" x2="375" y2="120" stroke="#999" stroke-width="1.2" stroke-dasharray="4,3"/>
  <!-- Hypercycle: arc of circle crossing S¹ at two points -->
  <path d="M215,80 A120,120 0 0,1 375,80" fill="none" stroke="#27c" stroke-width="1.8"/>
  <!-- Two intersection points with S¹ -->
  <circle cx="215" cy="80" r="4" fill="#27c"/>
  <circle cx="375" cy="80" r="4" fill="#27c"/>
  <text x="215" y="68" fill="#27c" font-size="10">on S¹</text>
  <text x="355" y="68" fill="#27c" font-size="10">on S¹</text>
  <text x="295" y="68" text-anchor="middle" fill="#27c" font-size="10">hypercycle</text>
  <text x="295" y="215" text-anchor="middle" fill="currentColor" font-size="10">equidistant from geodesic</text>
</svg>
</div>

<div class="theorem"><strong>Theorem 4.33 (Hyperbolic Trigonometry Laws):</strong> For a triangle in \(\mathbb{H}^2\) with edge lengths \(a,b,c\) and interior angles \(\alpha, \beta, \gamma\):
<ol>
<li><strong>(Sine Law)</strong> \(\displaystyle\frac{\sinh a}{\sin\alpha} = \frac{\sinh b}{\sin\beta} = \frac{\sinh c}{\sin\gamma}\).</li>
<li><strong>(First Law of Cosines)</strong> \(\displaystyle\cos\alpha = \frac{\cosh b\cosh c - \cosh a}{\sinh b\sinh c}.\)</li>
<li><strong>(Second Law of Cosines)</strong> \(\displaystyle\cosh a = \frac{\cos\alpha + \cos\beta\cos\gamma}{\sin\beta\sin\gamma}\).</li>
</ol></div>

<div class="proof"><strong>Proof sketch:</strong> Use reflections to place the triangle with vertices at \(\mathbf{u} = \mathbf{0}\), \(\mathbf{v} = (s,0)\), \(\mathbf{w} = (t\cos\alpha, t\sin\alpha)\). Then compute everything explicitly using the distance formula and the formula for the center of the hyperbolic line through two points. The First Cosine Law becomes a direct calculation, and the Sine Law follows from computing \(\sin\beta\) and \(\sin\gamma\) using the tangent directions at the vertices.</div>

The hyperbolic laws are obtained from the spherical laws by replacing \(\cos a\) with \(\cosh a\) and \(\sin a\) with \(\sinh a\). This substitution \(a \mapsto ia\) (where \(i = \sqrt{-1}\) gives \(\cos(ia) = \cosh a\), \(\sin(ia) = i\sinh a\)) reflects the fact that curvature changes sign: imagining the sphere with purely imaginary radius gives the hyperbolic plane.

<div class="example"><strong>Example 4.33a (Computing angles of a hyperbolic triangle).</strong>

Place a right-angled hyperbolic triangle with \(\gamma = \pi/2\) and legs \(a = b = 1\). We want to find the hypotenuse \(c\) and the angles \(\alpha = \beta\) (by symmetry).

By the First Law of Cosines with \(\gamma = \pi/2\):
\[\cos(\pi/2) = \frac{\cosh a\cosh b - \cosh c}{\sinh a\sinh b} \implies 0 = \cosh^2(1) - \cosh c\]
\[\cosh c = \cosh^2(1) \approx (1.5431)^2 \approx 2.381.\]
\[c = \cosh^{-1}(2.381) \approx 1.526.\]

For angle \(\alpha\):
\[\cos\alpha = \frac{\cosh b\cosh c - \cosh a}{\sinh b\sinh c} = \frac{\cosh(1)\cdot 2.381 - \cosh(1)}{\sinh(1)\cdot\sinh(1.526)}.\]
\[\approx \frac{1.5431 \cdot 2.381 - 1.5431}{1.1752 \cdot 2.109} = \frac{3.674 - 1.543}{2.479} = \frac{2.131}{2.479} \approx 0.860.\]
\[\alpha = \cos^{-1}(0.860) \approx 0.540 \text{ rad} \approx 30.9°.\]

Angle sum: \(\alpha + \beta + \gamma \approx 0.540 + 0.540 + \pi/2 \approx 2.651 < \pi \approx 3.14\). ✓

Area \(= \pi - (\alpha+\beta+\gamma) \approx 3.14 - 2.65 = 0.49\) square hyperbolic units.

<em>Compare:</em> In Euclidean geometry, a right isoceles triangle with legs 1 has hypotenuse \(\sqrt{2} \approx 1.414\) and base angles \(\pi/4 = 45°\). The hyperbolic hypotenuse (\(1.526 > \sqrt{2}\)) is longer, and the base angles (\(30.9° < 45°\)) are smaller, consistent with negative curvature defect.</div>

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

<div class="example"><strong>Example 4.36a (Hyperbolic triangle area and comparison with spherical).</strong>

(1) An <strong>ideal triangle</strong> (all three vertices on \(S^1\), all angles \(= 0\)) has area \(= \pi - 0 = \pi\). This is the <em>maximum possible area</em> for a hyperbolic triangle.

Compare: In spherical geometry, the maximum triangle (covering a hemisphere, angles \(\pi/2, \pi/2, \pi/2\)) has area \(\pi/2 + \pi/2 + \pi/2 - \pi = \pi/2\). And the maximum possible area in Euclidean geometry is infinite.

(2) An equilateral hyperbolic triangle with all angles \(\alpha = \pi/6\) has area \(A = \pi - 3\pi/6 = \pi - \pi/2 = \pi/2\).

(3) For a very small triangle (angles near \(\pi/3\) each), area \(\approx \pi - 3\pi/3 = 0\). Small hyperbolic triangles look Euclidean.

<strong>The Gauss-Bonnet table:</strong>
\[
\begin{array}{c|c|c}
\text{Geometry} & \text{Area formula} & \text{Example: equilateral, sides } r \\
\hline
\text{Euclidean} & \tfrac{\sqrt{3}}{4}r^2 & \text{grows as } r^2 \\
\text{Spherical } (K=+1) & \alpha+\beta+\gamma-\pi & \text{bounded by } 4\pi \\
\text{Hyperbolic } (K=-1) & \pi-(\alpha+\beta+\gamma) & \text{bounded by } \pi \\
\end{array}
\]</div>

This is the hyperbolic analogue of Girard's theorem. The area equals the angle defect \(\pi - (\alpha+\beta+\gamma) > 0\), since in hyperbolic geometry \(\alpha + \beta + \gamma < \pi\). Both the spherical and hyperbolic triangle area formulas are instances of the Gauss-Bonnet theorem, which states that for a geodesic triangle on a surface of curvature \(K\):
\[\text{Area} = \frac{1}{K}\left(\alpha + \beta + \gamma - \pi\right) \quad (K \neq 0).\]
For \(K = +1\) this gives spherical excess; for \(K = -1\) this gives hyperbolic defect (with a sign flip).

## 4.5 Isometries of the Hyperbolic Plane

Having classified the isometries of Euclidean space and \(S^2\), we now turn to the isometries of \(\mathbb{H}^2\). The structure is richer than in the other geometries, reflecting the more complex topology of the hyperbolic plane.

<div class="definition"><strong>Definition 4.37 (Types of Hyperbolic Isometries):</strong> Let \(L\) and \(M\) be distinct lines in \(\mathbb{H}^2\). The composite \(F_M F_L\) is called:
<ul>
<li>a <em>rotation</em> (elliptic isometry) \(R_{p,\theta}\) when \(L \cap M = \{p\} \subset \mathbb{H}^2\), rotating by \(\theta = 2\angle(L,M)\);</li>
<li>a <em>horolation</em> (parabolic isometry) when \(L\) and \(M\) are asymptotic at \(p \in S^1\);</li>
<li>a <em>translation</em> (hyperbolic isometry) along the common perpendicular \(N\) when \(L\) and \(M\) are ultraparallel.</li>
</ul>
A glide reflection along \(N\) is \(F_N F_M F_L\) when \(L\) and \(M\) are ultraparallel with common perpendicular \(N\).</div>

The three types of orientation-preserving isometries correspond to the three types of Möbius transformations (elliptic, parabolic, hyperbolic). Explicitly, the orientation-preserving isometries of the Poincaré disc are the Möbius transformations that preserve \(\mathbb{H}^2\):
\[f(z) = e^{i\theta}\frac{z - a}{1 - \bar{a}z}, \quad |a| < 1, \quad \theta \in \mathbb{R}.\]
These are classified by their fixed points:
- <strong>Elliptic (rotation):</strong> One fixed point inside \(\mathbb{H}^2\), one outside.
- <strong>Parabolic (horolation):</strong> Exactly one fixed point, on \(S^1\).
- <strong>Hyperbolic (translation):</strong> Two distinct fixed points on \(S^1\).

<div class="example"><strong>Example 4.37a (The three types of isometries in the disc model).</strong>

<strong>Rotation by \(\pi/3\) about the origin:</strong>
\[f(z) = e^{i\pi/3}z = \frac{1+i\sqrt{3}}{2}z.\]
Fixed point: \(z = 0\) (inside the disc). This is an elliptic isometry. Every point orbits around the origin in a hyperbolic circle.

<strong>Horolation fixing the point \(1 \in S^1\):</strong>
\[f(z) = \frac{(2+it)z - it}{itz + (2-it)}, \quad t \in \mathbb{R}.\]
For \(t = 1\): \(f(z) = \frac{(2+i)z-i}{iz+(2-i)}\). Fixed point: only \(z=1\). Horocycles (Euclidean circles tangent to \(S^1\) at \(1\)) are preserved.

<strong>Translation along the real axis:</strong>
\[f(z) = \frac{z + r}{rz + 1}, \quad 0 < r < 1.\]
Fixed points: \(z = \pm 1\) (on \(S^1\)). This translates along the real diameter by a hyperbolic distance of \(2\tanh^{-1}(r)\).</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 500 220" width="500" height="220" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <defs>
    <marker id="arr4" markerWidth="7" markerHeight="7" refX="5" refY="3" orient="auto">
      <path d="M0,0 L0,6 L7,3 z" fill="#e05"/>
    </marker>
    <marker id="arr5" markerWidth="7" markerHeight="7" refX="5" refY="3" orient="auto">
      <path d="M0,0 L0,6 L7,3 z" fill="#2a2"/>
    </marker>
  </defs>
  <!-- ELLIPTIC -->
  <text x="83" y="16" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Elliptic (rotation)</text>
  <circle cx="83" cy="110" r="70" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Circular orbits -->
  <circle cx="83" cy="110" r="25" fill="none" stroke="#e05" stroke-width="1.3" stroke-dasharray="5,3"/>
  <circle cx="83" cy="110" r="45" fill="none" stroke="#e05" stroke-width="1.3" stroke-dasharray="5,3"/>
  <!-- Arrow on orbit -->
  <path d="M108,110 A25,25 0 0,1 83,85" fill="none" stroke="#e05" stroke-width="1.5" marker-end="url(#arr4)"/>
  <!-- Fixed point -->
  <circle cx="83" cy="110" r="4" fill="currentColor"/>
  <text x="91" y="107" fill="currentColor" font-size="10">fixed pt</text>
  <text x="83" y="195" text-anchor="middle" fill="currentColor" font-size="10">orbits = circles</text>
  <!-- PARABOLIC -->
  <text x="250" y="16" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Parabolic (horolation)</text>
  <circle cx="250" cy="110" r="70" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Horocycle orbits (circles tangent to S¹ at fixed pt) -->
  <circle cx="250" cy="165" r="25" fill="none" stroke="#e05" stroke-width="1.3" stroke-dasharray="5,3"/>
  <circle cx="250" cy="155" r="35" fill="none" stroke="#e05" stroke-width="1.3" stroke-dasharray="5,3"/>
  <!-- Fixed point on S¹ (bottom) -->
  <circle cx="250" cy="180" r="4" fill="currentColor"/>
  <text x="258" y="195" fill="currentColor" font-size="10">fixed pt on S¹</text>
  <text x="250" y="208" text-anchor="middle" fill="currentColor" font-size="10">orbits = horocycles</text>
  <!-- HYPERBOLIC -->
  <text x="417" y="16" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Hyperbolic (translation)</text>
  <circle cx="417" cy="110" r="70" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Axis geodesic -->
  <line x1="347" y1="110" x2="487" y2="110" stroke="#999" stroke-width="1.3" stroke-dasharray="4,3"/>
  <!-- Translation arrow along axis -->
  <line x1="385" y1="110" x2="430" y2="110" stroke="#2a2" stroke-width="2" marker-end="url(#arr5)"/>
  <!-- Hypercycle orbits -->
  <path d="M347,80 A120,120 0 0,1 487,80" fill="none" stroke="#e05" stroke-width="1.3" stroke-dasharray="5,3"/>
  <path d="M347,140 A120,120 0 0,0 487,140" fill="none" stroke="#e05" stroke-width="1.3" stroke-dasharray="5,3"/>
  <!-- Two fixed points on S¹ -->
  <circle cx="347" cy="110" r="4" fill="currentColor"/>
  <circle cx="487" cy="110" r="4" fill="currentColor"/>
  <text x="417" y="195" text-anchor="middle" fill="currentColor" font-size="10">orbits = hypercycles · two fixed pts on S¹</text>
</svg>
</div>

<div class="theorem"><strong>Theorem 4.40 (Perpendicular Bisector Locus):</strong> For \(\mathbf{u}, \mathbf{v} \in \mathbb{H}^2\) with \(\mathbf{u} \neq \mathbf{v}\), let \(L\) be the perpendicular bisector (the hyperbolic line with \(F_L(\mathbf{u}) = \mathbf{v}\)). Then for \(\mathbf{x} \in \mathbb{H}^2\):
\[ d_H(\mathbf{x},\mathbf{u}) = d_H(\mathbf{x},\mathbf{v}) \iff \mathbf{x} \in L. \]
The perpendicular bisector passes through the hyperbolic midpoint of \([\mathbf{u},\mathbf{v}]\) and meets that segment at a right angle.</div>

<div class="theorem"><strong>Theorem 4.42 (SSS Congruence):</strong> Given ordered triangles \([\mathbf{u},\mathbf{v},\mathbf{w}]\) and \([\mathbf{u}',\mathbf{v}',\mathbf{w}']\) in \(\mathbb{H}^2\) with \(a=a'\), \(b=b'\), \(c=c'\), there exists a unique isometry \(F\) on \(\mathbb{H}^2\) with \(F(\mathbf{u})=\mathbf{u}'\), \(F(\mathbf{v})=\mathbf{v}'\), \(F(\mathbf{w})=\mathbf{w}'\).</div>

<div class="theorem"><strong>Theorem 4.43:</strong> Every isometry of \(\mathbb{H}^2\) is a product of at most three reflections.</div>

<div class="theorem"><strong>Theorem 4.44 (Geometric Classification of Isometries on \(\mathbb{H}^2\)):</strong> Every isometry on \(\mathbb{H}^2\) is one of: the identity, a rotation, a translation, a horolation, a reflection, or a glide reflection.</div>

## 4.6 Other Models of Hyperbolic Geometry

The Poincaré disc is one of several equivalent models. Each model of the hyperbolic plane emphasizes a different aspect of its geometry. Just as no single map projection faithfully represents the sphere, no single model of \(\mathbb{H}^2\) simultaneously preserves angles, distances, and the appearance of geodesics as straight lines. The choice of model is a matter of which properties are most useful for the task at hand.

<strong>Poincaré Upper Half-Plane Model:</strong> Let \(\mathbb{U}^2 = \{(x,y) \mid y > 0\}\). Let \(C = C_E((0,1), \sqrt{2})\) and \(L\) be the \(x\)-axis; then \(S = F_L \circ F_C\) maps \(\mathbb{H}^2\) to \(\mathbb{U}^2\). In \(\mathbb{U}^2\), the metric is \(ds = \frac{d_E s}{y}\). Geodesics are vertical lines and upper semicircles with centres on the \(x\)-axis. Angles are Euclidean.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 360 240" width="360" height="240" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <defs>
    <marker id="arr6" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- x-axis (boundary = infinity) -->
  <line x1="20" y1="185" x2="340" y2="185" stroke="currentColor" stroke-width="1.5" marker-end="url(#arr6)"/>
  <text x="344" y="189" fill="currentColor" font-size="12">x</text>
  <!-- y-axis -->
  <line x1="50" y1="200" x2="50" y2="20" stroke="currentColor" stroke-width="1.5" marker-end="url(#arr6)"/>
  <text x="45" y="16" fill="currentColor" font-size="12">y</text>
  <!-- Boundary label -->
  <text x="180" y="202" text-anchor="middle" fill="#e05" font-size="11">boundary (x-axis = ∞)</text>
  <!-- Vertical geodesic 1 -->
  <line x1="110" y1="185" x2="110" y2="30" stroke="#27c" stroke-width="1.5"/>
  <!-- Vertical geodesic 2 -->
  <line x1="200" y1="185" x2="200" y2="30" stroke="#27c" stroke-width="1.5"/>
  <!-- Semicircle geodesic -->
  <path d="M110,185 A70,70 0 0,1 250,185" fill="none" stroke="#e80" stroke-width="1.5"/>
  <!-- Another semicircle -->
  <path d="M160,185 A45,45 0 0,1 250,185" fill="none" stroke="#2a2" stroke-width="1.5"/>
  <!-- Labels on axes -->
  <text x="110" y="200" text-anchor="middle" fill="currentColor" font-size="11">a</text>
  <text x="200" y="200" text-anchor="middle" fill="currentColor" font-size="11">b</text>
  <text x="250" y="200" text-anchor="middle" fill="currentColor" font-size="11">c</text>
  <!-- Caption -->
  <text x="180" y="218" text-anchor="middle" fill="#27c" font-size="11">— vertical lines (geodesics)</text>
  <text x="180" y="232" text-anchor="middle" fill="#e80" font-size="11">— semicircles centred on x-axis (geodesics)</text>
</svg>
</div>

<strong>Minkowski (Hyperboloid) Model:</strong> Define the Minkowski quadratic form \(Q(x,y,t) = x^2 + y^2 - t^2\) on \(\mathbb{R}^3\). The model is the upper sheet of the hyperboloid:
\[ \mathbb{M}^2 = \left\{ (x,y,t) \in \mathbb{R}^3 \mid x^2 + y^2 - t^2 = -1,\; t > 0 \right\}. \]
A stereographic-like projection from \((0,0,-1)\) maps \(\mathbb{M}^2\) to \(\mathbb{H}^2\). Geodesics in \(\mathbb{M}^2\) are intersections with planes through the origin.

The Minkowski model makes explicit the parallel with spherical geometry: just as \(S^2\) is the set of unit vectors for the Euclidean inner product \(\langle\mathbf{x},\mathbf{y}\rangle = x_1y_1+x_2y_2+x_3y_3\), the hyperboloid \(\mathbb{M}^2\) is the set of "unit vectors" for the Minkowski inner product \(\langle (x,y,t), (x',y',t') \rangle = xx' + yy' - tt'\). The sign change in the time coordinate is precisely what switches from positive to negative curvature.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 280" width="320" height="280" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <defs>
    <marker id="arr7" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- Axes -->
  <line x1="130" y1="250" x1="130" y1="250" x2="130" y2="20" stroke="#777" stroke-width="1" marker-end="url(#arr7)"/>
  <text x="134" y="15" fill="#aaa" font-size="12">t</text>
  <line x1="40" y1="180" x2="290" y2="180" stroke="#777" stroke-width="1" marker-end="url(#arr7)"/>
  <text x="292" y="184" fill="#aaa" font-size="12">x</text>
  <!-- t=0 plane label -->
  <text x="38" y="178" fill="#aaa" font-size="10">t=0</text>
  <!-- Upper sheet of hyperboloid (x²+y²-t²=-1, t>0) -->
  <!-- Hyperbola-like curve (approximated) -->
  <path d="M40,180 Q80,140 130,80 Q180,140 220,180" fill="none" stroke="#27c" stroke-width="2"/>
  <!-- Cross-section ellipses (latitude lines) -->
  <ellipse cx="130" cy="110" rx="45" ry="12" fill="none" stroke="#27c" stroke-width="1.2" stroke-dasharray="4,3"/>
  <ellipse cx="130" cy="145" rx="70" ry="18" fill="none" stroke="#27c" stroke-width="1" stroke-dasharray="3,3"/>
  <!-- Geodesic: intersection with plane through origin -->
  <path d="M70,165 Q130,80 190,165" fill="none" stroke="#e05" stroke-width="1.5"/>
  <!-- Origin -->
  <circle cx="130" cy="180" r="3" fill="currentColor"/>
  <text x="136" y="185" fill="currentColor" font-size="11">O</text>
  <!-- Upper sheet label -->
  <text x="225" y="95" fill="#27c" font-size="11">upper sheet</text>
  <text x="225" y="108" fill="#27c" font-size="10">x²+y²−t²=−1</text>
  <text x="225" y="121" fill="#27c" font-size="10">t&gt;0</text>
  <!-- Lower sheet label -->
  <text x="50" y="230" fill="#aaa" font-size="10">lower sheet (not used)</text>
  <!-- Caption -->
  <text x="130" y="268" text-anchor="middle" fill="currentColor" font-size="11">Geodesics = plane sections through O</text>
</svg>
</div>

<strong>Klein Model:</strong> The unit disc \(\mathbb{K}^2 = \{(x,y) \mid x^2+y^2 < 1\}\) with a different metric defined so that the gnomic projection from \(\mathbb{M}^2\) is an isometry. In the Klein model, geodesics are Euclidean straight-line segments, but angles are not the same as Euclidean angles.

### Comparison of Models

| Property | Poincaré Disc | Upper Half-Plane | Hyperboloid | Klein |
|---|---|---|---|---|
| Domain | Open unit disc | Upper half-plane \(y>0\) | Upper hyperboloid in \(\mathbb{R}^{2,1}\) | Open unit disc |
| Metric | \(\frac{2}{1-r^2}ds_E\) | \(\frac{1}{y}ds_E\) | Minkowski restriction | Different from Poincaré |
| Geodesics | Arcs orthog. to \(S^1\) | Vertical lines, semicircles | Plane sections through origin | Straight Euclidean segments |
| Angles | Same as Euclidean | Same as Euclidean | Must be computed from Minkowski metric | Different from Euclidean |
| Isometries | Möbius transformations preserving disc | Möbius transformations \(az+b/cz+d\), \(ad-bc>0\) | Lorentz group \(SO^+(2,1)\) | Projective transformations |
| Conformal? | Yes | Yes | No (in Euclidean sense) | No |

The three disc/plane models (Poincaré disc, upper half-plane, Klein) are conformally, isometrically, or projectively equivalent to each other, each highlighting different geometric properties. The Poincaré disc and upper half-plane are conformal (angle-preserving); the Klein model has straight-line geodesics. All satisfy the same abstract axioms of hyperbolic geometry, including the negation of Euclid's parallel postulate: through any point not on a given line, there are infinitely many lines parallel to (not intersecting) the given line.

<div class="remark"><strong>Remark (Historical note on models).</strong> Beltrami (1868) was the first to construct a model of hyperbolic geometry inside Euclidean space, using a surface called the pseudosphere (a surface of revolution with constant negative curvature, analogous to the sphere of constant positive curvature). However, the pseudosphere is not complete — it only models a portion of the hyperbolic plane. The Poincaré disc (1882) gives a complete model on a bounded domain. The historical significance cannot be overstated: the existence of a consistent model inside Euclidean geometry proved, once and for all, that hyperbolic geometry is just as consistent as Euclidean geometry. If Euclidean geometry is consistent, so is hyperbolic geometry.</div>

---

## Summary and Comparison of the Three Geometries

The three geometries of this course are distinguished by a single number: the curvature \(K\).

| Property | Euclidean (\(K=0\)) | Spherical (\(K=+1\)) | Hyperbolic (\(K=-1\)) |
|---|---|---|---|
| Parallel postulate | Exactly one parallel | No parallels | Infinitely many parallels |
| Angle sum of triangle | \(= \pi\) | \(> \pi\) | \(< \pi\) |
| Triangle area | Independent of angles | \(= \alpha+\beta+\gamma-\pi\) | \(= \pi-(\alpha+\beta+\gamma)\) |
| AAA congruence | No (similarity) | Yes | Yes |
| Circle circumference | \(2\pi r\) | \(2\pi\sin r\) | \(2\pi\sinh r\) |
| Growth rate | Polynomial | Bounded | Exponential |
| Isometry group | \(\mathrm{Isom}(\mathbb{R}^2)\) | \(O(3)\) | \(\mathrm{PSL}(2,\mathbb{R})\) |
| Geodesics | Lines | Great circles | Arcs orthogonal to boundary |
| Models | \(\mathbb{R}^2\) itself | \(S^2 \subset \mathbb{R}^3\) | Poincaré disc, UHP, Klein, hyperboloid |

<div class="remark"><strong>Remark (The big picture).</strong> The central theme of the course is Klein's Erlangen Program: a geometry is characterized by its symmetry group. Euclidean geometry studies properties invariant under \(\mathrm{Isom}(\mathbb{R}^n)\) (distances, angles, areas). Projective geometry studies properties invariant under projective transformations (incidence, cross-ratio). Spherical geometry studies properties invariant under \(O(3)\). Hyperbolic geometry studies properties invariant under \(\mathrm{PSL}(2,\mathbb{R})\) (or equivalently the Möbius transformations preserving the disc).

The discovery that multiple consistent geometries exist — with different curvatures, different parallel postulates, different triangle angle sums — transformed mathematics and physics. Riemann's 1854 generalization ("On the Hypotheses Which Lie at the Foundations of Geometry") introduced the concept of a Riemannian manifold: any space with a locally Euclidean metric. Einstein's general relativity (1915) uses this framework, modeling spacetime as a 4-dimensional Riemannian (actually pseudo-Riemannian) manifold whose curvature is determined by the distribution of mass-energy. The universe itself is a non-Euclidean geometry, and the question of its curvature (positive, zero, or negative) is an open problem in cosmology.</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 480 200" width="480" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- K < 0: Hyperbolic disc -->
  <text x="80" y="18" text-anchor="middle" fill="#27c" font-weight="bold" font-size="13">K &lt; 0</text>
  <text x="80" y="32" text-anchor="middle" fill="#27c" font-size="11">(hyperbolic)</text>
  <circle cx="80" cy="100" r="55" fill="#e8f0ff" stroke="#27c" stroke-width="2"/>
  <!-- Many geodesics in Poincaré disc style -->
  <line x1="25" y1="100" x2="135" y2="100" stroke="#27c" stroke-width="1.2"/>
  <path d="M25,75 A60,60 0 0,1 135,75" fill="none" stroke="#27c" stroke-width="1"/>
  <path d="M25,125 A60,60 0 0,0 135,125" fill="none" stroke="#27c" stroke-width="1"/>
  <path d="M55,45 A60,60 0 0,1 55,155" fill="none" stroke="#27c" stroke-width="1"/>
  <path d="M105,45 A60,60 0 0,0 105,155" fill="none" stroke="#27c" stroke-width="1"/>
  <text x="80" y="163" text-anchor="middle" fill="#27c" font-size="10">Angle sum &lt; π</text>
  <text x="80" y="176" text-anchor="middle" fill="#27c" font-size="10">∞ many parallels</text>
  <text x="80" y="189" text-anchor="middle" fill="#27c" font-size="10">Exponential growth</text>
  <!-- K = 0: Euclidean flat triangle -->
  <text x="240" y="18" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="13">K = 0</text>
  <text x="240" y="32" text-anchor="middle" fill="currentColor" font-size="11">(Euclidean)</text>
  <rect x="185" y="55" width="110" height="90" fill="#f5f5e8" stroke="#999" stroke-width="2"/>
  <line x1="240" y1="55" x2="185" y2="145" stroke="#999" stroke-width="1"/>
  <line x1="240" y1="55" x2="295" y2="145" stroke="#999" stroke-width="1"/>
  <text x="240" y="163" text-anchor="middle" fill="currentColor" font-size="10">Angle sum = π</text>
  <text x="240" y="176" text-anchor="middle" fill="currentColor" font-size="10">Exactly one parallel</text>
  <text x="240" y="189" text-anchor="middle" fill="currentColor" font-size="10">Polynomial growth</text>
  <!-- K > 0: Spherical -->
  <text x="400" y="18" text-anchor="middle" fill="#e05" font-weight="bold" font-size="13">K &gt; 0</text>
  <text x="400" y="32" text-anchor="middle" fill="#e05" font-size="11">(spherical)</text>
  <circle cx="400" cy="100" r="55" fill="#ffe8e8" stroke="#e05" stroke-width="2"/>
  <!-- Latitude lines on sphere suggestion -->
  <ellipse cx="400" cy="100" rx="55" ry="14" fill="none" stroke="#e05" stroke-width="1.2" stroke-dasharray="4,3"/>
  <ellipse cx="400" cy="72" rx="40" ry="10" fill="none" stroke="#e05" stroke-width="1" stroke-dasharray="3,3"/>
  <ellipse cx="400" cy="128" rx="40" ry="10" fill="none" stroke="#e05" stroke-width="1" stroke-dasharray="3,3"/>
  <text x="400" y="163" text-anchor="middle" fill="#e05" font-size="10">Angle sum &gt; π</text>
  <text x="400" y="176" text-anchor="middle" fill="#e05" font-size="10">No parallels</text>
  <text x="400" y="189" text-anchor="middle" fill="#e05" font-size="10">Bounded size</text>
</svg>
</div>

---

# Appendix A: Additional Worked Examples and Deeper Theory

This appendix provides extended worked examples, more detailed proofs, and deeper connections between the four geometries covered in the course. It is organized to follow the chapter structure.

## A.1 Further Euclidean Examples

### A.1.1 The Gram-Schmidt Process

The Gram-Schmidt process converts any basis into an orthonormal one. It is the computational realization of the direct sum decomposition \(\mathbb{R}^n = U \oplus U^\perp\), applied iteratively. The process is foundational in numerical linear algebra (QR decomposition) and functional analysis (orthogonal polynomials).

<div class="definition"><strong>Definition A.1 (Gram-Schmidt Process).</strong> Given linearly independent vectors \(\mathbf{v}_1, \ldots, \mathbf{v}_k \in \mathbb{R}^n\), define:
\[
\mathbf{u}_1 = \mathbf{v}_1, \qquad \mathbf{u}_j = \mathbf{v}_j - \sum_{i=1}^{j-1} \frac{\mathbf{v}_j \cdot \mathbf{u}_i}{|\mathbf{u}_i|^2}\mathbf{u}_i \quad (j \geq 2).
\]
Then \(\{\mathbf{u}_1, \ldots, \mathbf{u}_k\}\) is an orthogonal basis for \(\mathrm{Span}\{\mathbf{v}_1, \ldots, \mathbf{v}_k\}\). Normalizing gives an orthonormal basis \(\hat{\mathbf{u}}_j = \mathbf{u}_j / |\mathbf{u}_j|\).</div>

<div class="example"><strong>Example A.1a (Gram-Schmidt in \(\mathbb{R}^3\)).</strong> Apply Gram-Schmidt to \(\mathbf{v}_1 = (1,1,0)\), \(\mathbf{v}_2 = (1,0,1)\), \(\mathbf{v}_3 = (0,1,1)\).

<strong>Step 1:</strong> \(\mathbf{u}_1 = \mathbf{v}_1 = (1,1,0)\), \(|\mathbf{u}_1|^2 = 2\).

<strong>Step 2:</strong>
\[\mathbf{u}_2 = \mathbf{v}_2 - \frac{\mathbf{v}_2\cdot\mathbf{u}_1}{|\mathbf{u}_1|^2}\mathbf{u}_1 = (1,0,1) - \frac{1}{2}(1,1,0) = \left(\frac{1}{2}, -\frac{1}{2}, 1\right).\]
Check: \(\mathbf{u}_2 \cdot \mathbf{u}_1 = 1/2 - 1/2 + 0 = 0\). ✓

<strong>Step 3:</strong> \(|\mathbf{u}_2|^2 = 1/4 + 1/4 + 1 = 3/2\).
\[\mathbf{u}_3 = \mathbf{v}_3 - \frac{\mathbf{v}_3\cdot\mathbf{u}_1}{|\mathbf{u}_1|^2}\mathbf{u}_1 - \frac{\mathbf{v}_3\cdot\mathbf{u}_2}{|\mathbf{u}_2|^2}\mathbf{u}_2.\]
\[\mathbf{v}_3\cdot\mathbf{u}_1 = 0+1+0 = 1, \quad \mathbf{v}_3\cdot\mathbf{u}_2 = 0 - 1/2 + 1 = 1/2.\]
\[\mathbf{u}_3 = (0,1,1) - \frac{1}{2}(1,1,0) - \frac{1/2}{3/2}\left(\frac{1}{2},-\frac{1}{2},1\right) = (0,1,1) - \left(\frac{1}{2},\frac{1}{2},0\right) - \frac{1}{3}\left(\frac{1}{2},-\frac{1}{2},1\right).\]
\[= (0,1,1) - \left(\frac{1}{2}+\frac{1}{6}, \frac{1}{2}-\frac{1}{6}, \frac{1}{3}\right) = \left(-\frac{2}{3}, \frac{2}{3}, \frac{2}{3}\right).\]
Check: \(\mathbf{u}_3\cdot\mathbf{u}_1 = -2/3+2/3+0 = 0\) ✓, \(\mathbf{u}_3\cdot\mathbf{u}_2 = -1/3-1/3+2/3 = 0\) ✓.

The orthonormal basis is \(\hat{\mathbf{u}}_1 = \frac{1}{\sqrt{2}}(1,1,0)\), \(\hat{\mathbf{u}}_2 = \sqrt{2/3}(1/2,-1/2,1)\), \(\hat{\mathbf{u}}_3 = \frac{1}{\sqrt{3}}(-1,1,1)\).</div>

### A.1.2 Composition of Isometries — A Detailed Example

<div class="example"><strong>Example A.1b (A rotation as a product of reflections).</strong> We verify Theorem 1.83(3) concretely.

Let \(L_1\) be the line through the origin at angle \(0\) (the \(x\)-axis) and \(L_2\) be the line through the origin at angle \(\pi/8\). Their intersection is the origin \(p = (0,0)\), and the angle from \(L_1\) to \(L_2\) counterclockwise is \(\pi/8\).

By Theorem 1.83(3), the composite \(F_{L_2} \circ F_{L_1}\) is the rotation \(R_{(0,0), 2 \cdot \pi/8} = R_{(0,0), \pi/4}\).

Let us verify with \(\mathbf{x} = (1,0)\):
- \(F_{L_1}(1,0) = (1,0)\) (the \(x\)-axis is fixed by reflection in itself).
- \(F_{L_2}(1,0)\): reflecting \((1,0)\) in the line at angle \(\pi/8\). Using the formula \(F_{L}(\mathbf{x}) = 2(\mathbf{x}\cdot\hat\mathbf{n})\hat\mathbf{n} - \mathbf{x}\) where \(\hat\mathbf{n} = (\cos\pi/8, \sin\pi/8)\):
\[(1,0)\cdot(\cos\pi/8, \sin\pi/8) = \cos\pi/8.\]
\[F_{L_2}(1,0) = 2\cos\pi/8 \cdot (\cos\pi/8, \sin\pi/8) - (1,0) = (2\cos^2\pi/8 - 1, 2\sin\pi/8\cos\pi/8) = (\cos\pi/4, \sin\pi/4).\]
This is indeed the rotation of \((1,0)\) by \(\pi/4\). ✓</div>

### A.1.3 The Circumradius and Inradius Formulas

The circumradius and inradius of a Euclidean triangle can be expressed in terms of the side lengths, providing a clean example of how metric data determines the full geometry.

<div class="theorem"><strong>Theorem A.2 (Circumradius and Inradius).</strong> For a triangle with side lengths \(a, b, c\), area \(A\), and semi-perimeter \(s = (a+b+c)/2\):
\[R = \frac{abc}{4A} \quad \text{(circumradius)}, \qquad r_{\mathrm{in}} = \frac{A}{s} \quad \text{(inradius)}.\]</div>

<div class="example"><strong>Example A.2a.</strong> For the triangle \(u=(0,0)\), \(v=(4,0)\), \(w=(1,3)\) from Example 1.63a:
- Side lengths: \(a = |w-v| = |(-3,3)| = 3\sqrt{2}\), \(b = |w-u| = |(1,3)| = \sqrt{10}\), \(c = |v-u| = 4\).
- Area: \(A = \frac{1}{2}|\det((4,0),(1,3))| = \frac{1}{2}|12 - 0| = 6\).
- Semi-perimeter: \(s = (3\sqrt{2}+\sqrt{10}+4)/2 \approx (4.24+3.16+4)/2 \approx 5.70\).
- Circumradius: \(R = \frac{3\sqrt{2}\cdot\sqrt{10}\cdot4}{4\cdot 6} = \frac{4\sqrt{20}}{6} = \frac{4\cdot2\sqrt{5}}{6} = \frac{4\sqrt{5}}{3} \approx 2.98\).
Check: \(|o-u| = |(2,1)| = \sqrt{5} \approx 2.24\). Hmm, that gives \(\sqrt{5} \neq R\). Let me recheck: \(R = \frac{abc}{4A} = \frac{3\sqrt{2}\cdot\sqrt{10}\cdot 4}{24} = \frac{12\sqrt{20}}{24} = \frac{\sqrt{20}}{2} = \frac{2\sqrt{5}}{2} = \sqrt{5}\). ✓ (the circumradius is \(\sqrt{5}\), which matches \(|o-u| = \sqrt{5}\).)
- Inradius: \(r_{\mathrm{in}} = A/s = 6/5.70 \approx 1.05\).</div>

## A.2 Deeper Spherical Geometry

### A.2.1 The Spherical Excess and Area — A Direct Computational Approach

Girard's theorem gives area \(= \alpha+\beta+\gamma-\pi\) abstractly. Let us verify it directly for the octant triangle of Example 2.16a.

<div class="example"><strong>Example A.2b (Direct area computation for the octant triangle).</strong>

The triangle \([\mathbf{u},\mathbf{v},\mathbf{w}]\) with \(\mathbf{u}=(1,0,0)\), \(\mathbf{v}=(0,1,0)\), \(\mathbf{w}=(0,0,1)\) is one-eighth of the sphere. By symmetry (the three coordinate planes divide \(S^2\) into 8 equal octants), its area is \(\frac{4\pi}{8} = \frac{\pi}{2}\).

By Girard's theorem: \(A = \alpha+\beta+\gamma-\pi = \pi/2+\pi/2+\pi/2-\pi = \pi/2\). ✓

Now let us compute the area of the equilateral triangle from Example 2.23a with \(b=c=\pi/3\) and \(\alpha = \pi/2\). We found \(a = \cos^{-1}(\sqrt{2}/4)\). By the First Law of Cosines applied to find \(\beta = \gamma\):
\[\cos\beta = \frac{\cos b - \cos a \cos c}{\sin a \sin c} = \frac{\cos(\pi/3) - \cos(a)\cos(\pi/4)}{\sin(a)\sin(\pi/4)}.\]
With \(\cos a = \sqrt{2}/4 \approx 0.354\), \(\sin a = \sqrt{1-2/16} = \sqrt{14/16} = \sqrt{14}/4\):
\[\cos\beta = \frac{1/2 - (\sqrt{2}/4)(\sqrt{2}/2)}{(\sqrt{14}/4)(\sqrt{2}/2)} = \frac{1/2 - 1/4}{\sqrt{28}/8} = \frac{1/4}{\sqrt{28}/8} = \frac{2}{\sqrt{28}} = \frac{1}{\sqrt{7}} \approx 0.378.\]
\[\beta = \cos^{-1}(1/\sqrt{7}) \approx 67.8° \approx 1.183 \text{ rad}.\]
Area \(= \alpha+\beta+\gamma-\pi \approx \pi/2 + 1.183 + 1.183 - \pi \approx 1.571 + 2.366 - 3.14 \approx 0.80\) steradians.</div>

### A.2.2 Sterographic Projection is Conformal — A Detailed Proof

The conformality of stereographic projection is one of its most important properties. Let us flesh out the proof with explicit calculations.

<div class="proof"><strong>Proof (conformality of stereographic projection).</strong> We show that the differential \(d\phi\) of \(\phi(x,y,z) = (x/(1-z), y/(1-z))\) is a scalar multiple of an orthogonal transformation at each point, which means it preserves angles.

Let \(P = (x,y,z) \in S^2\) with \(z \neq 1\). Let \(\mathbf{v}_1, \mathbf{v}_2 \in T_P S^2\) be two tangent vectors. The differential of \(\phi\) is the \(2\times 3\) matrix:
\[d\phi_P = \frac{1}{1-z}\begin{pmatrix} 1 & 0 & x/(1-z) \\ 0 & 1 & y/(1-z) \end{pmatrix}.\]

For \(\mathbf{v} = (v_1, v_2, v_3) \in T_P S^2\) (so \(xv_1+yv_2+zv_3 = 0\)):
\[d\phi_P(\mathbf{v}) = \frac{1}{1-z}\left(v_1 + \frac{xv_3}{1-z}, v_2 + \frac{yv_3}{1-z}\right).\]

Computing \(|d\phi_P(\mathbf{v})|^2\) and using the constraint \(xv_1+yv_2 = -zv_3\), one finds after calculation:
\[|d\phi_P(\mathbf{v})|^2 = \frac{|\mathbf{v}|^2}{(1-z)^2}.\]

Since this holds for all tangent vectors, \(d\phi_P\) scales all tangent vectors by the same factor \(\frac{1}{1-z}\). A linear map that scales all vectors by the same factor preserves angles. Hence \(\phi\) is conformal. The scaling factor is \(\frac{1}{1-z} = \frac{1}{2}\left(1+\frac{1}{r^2+1}\right)\) where \(r^2 = u^2+v^2\) in the plane coordinates.</div>

### A.2.3 The Spherical Triangle Inequality — A Geometric Interpretation

The spherical triangle inequality \(d_S(\mathbf{u},\mathbf{w}) \leq d_S(\mathbf{u},\mathbf{v}) + d_S(\mathbf{v},\mathbf{w})\) says that the "straight" path (along the great circle) is shorter than any detour through a third point. This is obvious in Euclidean geometry but requires proof on the sphere.

<div class="remark"><strong>Remark (when spherical triangle inequality is an equality).</strong> The spherical triangle inequality \(d_S(\mathbf{u},\mathbf{w}) \leq d_S(\mathbf{u},\mathbf{v}) + d_S(\mathbf{v},\mathbf{w})\) is an equality if and only if \(\mathbf{v}\) lies on the shorter geodesic arc from \(\mathbf{u}\) to \(\mathbf{w}\). This is the spherical analogue of the Euclidean statement that the triangle inequality is an equality iff the three points are collinear.

Note the caveat: if \(d_S(\mathbf{u},\mathbf{w}) = \pi\) (antipodal points), the "shorter geodesic arc" is not unique — any great circle through \(\mathbf{u}\) and \(\mathbf{w}\) works, and \(\mathbf{v}\) can be any point on any of them.</div>

## A.3 Projective Duality and Coordinates

### A.3.1 Duality in \(\mathbb{P}^2\)

The projective plane has a remarkable <em>self-duality</em>: the roles of points and lines can be exchanged. This is not a coincidence but reflects the symmetry of the axioms.

<div class="definition"><strong>Definition A.3 (Dual Projective Plane).</strong> The dual projective plane \((\mathbb{P}^2)^*\) has lines of \(\mathbb{P}^2\) as points and points of \(\mathbb{P}^2\) as lines. Given a point \(p = [a:b:c]\), the corresponding line in \((\mathbb{P}^2)^*\) is \(\{[x:y:z] : ax+by+cz = 0\}\).</div>

In homogeneous coordinates, the duality is simply:
- A point \([a:b:c]\) corresponds to the line \(\{ax+by+cz=0\}\).
- A line \(\{px+qy+rz=0\}\) corresponds to the point \([p:q:r]\).

<div class="theorem"><strong>Theorem A.4 (Principle of Duality).</strong> Every theorem about incidence relations in \(\mathbb{P}^2\) remains true when the words "point" and "line" are exchanged.</div>

For example, Desargues' theorem is self-dual: swapping points and lines gives the same statement back. Pascal's theorem and Brianchon's theorem are dual to each other: Pascal's theorem about a hexagon inscribed in a conic becomes Brianchon's theorem about a hexagon circumscribed about a conic.

<div class="example"><strong>Example A.4a (Dual of Pascal = Brianchon).</strong>

<em>Pascal's theorem:</em> If a hexagon is inscribed in a conic, the three pairs of opposite sides meet in collinear points (on the Pascal line).

<em>Brianchon's theorem (dual):</em> If a hexagon is circumscribed about a conic, the three main diagonals (connecting opposite vertices) are concurrent (at the Brianchon point).

These are the same theorem, viewed through the duality of \(\mathbb{P}^2\).</div>

### A.3.2 Cross-Ratio — The Fundamental Projective Invariant

Unlike Euclidean geometry (which has distances and angles), projective geometry has no metric. But it does have a projective invariant: the cross-ratio of four collinear points.

<div class="definition"><strong>Definition A.5 (Cross-Ratio).</strong> For four distinct collinear points \(p_1, p_2, p_3, p_4\) in \(\mathbb{P}^1 \cong \mathbb{R} \cup \{\infty\}\), the cross-ratio is:
\[(p_1, p_2; p_3, p_4) = \frac{(p_3 - p_1)(p_4 - p_2)}{(p_3 - p_2)(p_4 - p_1)}.\]</div>

<div class="theorem"><strong>Theorem A.6 (Cross-Ratio is Projectively Invariant).</strong> If \(f: \mathbb{P}^1 \to \mathbb{P}^1\) is a projective transformation (Möbius transformation), then:
\[(f(p_1), f(p_2); f(p_3), f(p_4)) = (p_1, p_2; p_3, p_4).\]</div>

The cross-ratio is the unique projective invariant of four points in \(\mathbb{P}^1\) up to projective equivalence. It plays a role in projective geometry analogous to distance in Euclidean geometry — except it requires four points rather than two.

<div class="remark"><strong>Remark (cross-ratio and hyperbolic distance).</strong> There is a deep connection between the cross-ratio and hyperbolic distance. In the upper half-plane model of hyperbolic geometry, two points \(z, w \in \mathbb{U}^2\) have hyperbolic distance:
\[d_H(z,w) = \log(z,w;z^*, w^*)\]
where \(z^*, w^*\) are the ideal endpoints (intersections with the real line) of the unique hyperbolic line through \(z\) and \(w\), and the cross-ratio is taken of the four points \(z, w, z^*, w^*\) on \(\mathbb{P}^1\). This shows that hyperbolic distance is essentially a projective concept — another manifestation of the deep unity between the geometries.</div>

## A.4 Deeper Hyperbolic Geometry

### A.4.1 The Möbius Group and Hyperbolic Isometries

The orientation-preserving isometries of the Poincaré disc \(\mathbb{H}^2\) form a group isomorphic to \(\mathrm{PSL}(2,\mathbb{R}) = \mathrm{SL}(2,\mathbb{R})/\{\pm I\}\). This group acts on the upper half-plane by Möbius transformations:
\[z \mapsto \frac{az+b}{cz+d}, \quad a,b,c,d \in \mathbb{R},\quad ad-bc = 1.\]

<div class="theorem"><strong>Theorem A.7 (Isometries of the Upper Half-Plane).</strong> The orientation-preserving isometries of \(\mathbb{U}^2\) (with the metric \(ds = ds_E/y\)) are exactly the Möbius transformations
\[z \mapsto \frac{az+b}{cz+d}\]
with \(a,b,c,d \in \mathbb{R}\) and \(ad-bc > 0\). The full isometry group also includes orientation-reversing isometries \(z \mapsto \frac{a\bar{z}+b}{c\bar{z}+d}\).</div>

<div class="example"><strong>Example A.7a (Isometries in the upper half-plane).</strong>

(1) <strong>Horizontal translation by \(t\):</strong> \(z \mapsto z + t = \frac{1\cdot z + t}{0\cdot z + 1}\). Here \(a=1, b=t, c=0, d=1\), \(ad-bc = 1\). This is a parabolic isometry fixing \(\infty\).

(2) <strong>Dilation by \(\lambda > 0\):</strong> \(z \mapsto \lambda z = \frac{\sqrt\lambda \cdot z + 0}{0\cdot z + 1/\sqrt\lambda}\). This is a hyperbolic isometry fixing \(0\) and \(\infty\).

(3) <strong>Rotation about \(i\):</strong> The map \(z \mapsto \frac{z\cos\theta - \sin\theta}{z\sin\theta + \cos\theta}\) is an elliptic isometry fixing \(i\). When \(\theta = \pi/2\): \(z \mapsto -1/z\), which maps \(i\) to \(i\). ✓

(4) <strong>Geodesic from \(0\) to \(\infty\):</strong> The positive imaginary axis. Dilation maps this to itself: \(\lambda \cdot iy = i(\lambda y)\). The hyperbolic length from \(i\) to \(i\lambda\) is:
\[\int_1^\lambda \frac{dy}{y} = \ln\lambda.\]
So hyperbolic distance from \(i\) to \(\lambda i\) is \(|\ln\lambda|\).</div>

### A.4.2 Tessellations and the Hyperbolic Plane

One of the most beautiful applications of hyperbolic geometry is the theory of tessellations (tilings). In Euclidean geometry, only three regular tessellations exist: by equilateral triangles, squares, and regular hexagons. In the hyperbolic plane, there are infinitely many regular tessellations.

<div class="definition"><strong>Definition A.8 (Regular Tessellation).</strong> A \(\{p,q\}\) tessellation of a geometry consists of regular \(p\)-gons with \(q\) meeting at each vertex. The interior angle of each polygon at a vertex is \(2\pi/q\), and the sum of angles at each vertex must be \(2\pi\).</div>

<div class="theorem"><strong>Theorem A.9 (Existence of Regular Tessellations).</strong>
<ul>
<li><strong>Euclidean:</strong> A \(\{p,q\}\) tessellation exists iff \(\frac{1}{p}+\frac{1}{q} = \frac{1}{2}\). The solutions are \(\{3,6\}\), \(\{4,4\}\), \(\{6,3\}\).</li>
<li><strong>Spherical:</strong> A \(\{p,q\}\) tessellation exists iff \(\frac{1}{p}+\frac{1}{q} > \frac{1}{2}\). These correspond to the Platonic solids.</li>
<li><strong>Hyperbolic:</strong> A \(\{p,q\}\) tessellation exists iff \(\frac{1}{p}+\frac{1}{q} < \frac{1}{2}\). There are infinitely many such \((p,q)\).</li>
</ul></div>

<div class="proof"><strong>Proof sketch.</strong> For a regular \(p\)-gon in the geometry with curvature \(K\), the interior angle \(\alpha\) satisfies (by the Gauss-Bonnet formula applied to the triangle obtained by triangulating the polygon):
\[(p-2)\alpha = (p-2)\pi + K \cdot A\]
where \(A\) is the area. For the tessellation to work, we need \(q\alpha = 2\pi\), i.e., \(\alpha = 2\pi/q\). Substituting:
\[K \cdot A = (p-2)(2\pi/q) - (p-2)\pi = (p-2)\pi\left(\frac{2}{q}-1\right) = (p-2)\pi\cdot\frac{2-q}{q}.\]
For \(K = 0\): \((p-2)(2-q) = 0\), so \(p=2\) (degenerate) or \(q=2\) (degenerate) or... actually this requires \(\frac{1}{p}+\frac{1}{q} = \frac{1}{2}\). For \(K > 0\): \(A > 0\) requires \(\frac{2-q}{q} > 0\), so \(q < 2\)... let me reconsider.

The angle at each vertex of a regular \(p\)-gon is \(\alpha_p\). For the tessellation we need \(q \cdot \alpha_p = 2\pi\). In Euclidean space, \(\alpha_p = (1-2/p)\pi\). So \(q(1-2/p)\pi = 2\pi\), giving \(\frac{1}{p}+\frac{1}{q} = \frac{1}{2}\).

In hyperbolic geometry, a regular \(p\)-gon can have any interior angle \(\alpha \in (0, (1-2/p)\pi)\) by choosing its size appropriately (larger polygon = smaller angles). We need \(q\alpha = 2\pi\), i.e., \(\alpha = 2\pi/q\). This is achievable as long as \(2\pi/q < (1-2/p)\pi\), i.e., \(\frac{2}{q} < 1-\frac{2}{p}\), i.e., \(\frac{1}{p}+\frac{1}{q} < \frac{1}{2}\). ✓</div>

<div class="example"><strong>Example A.9a (Some hyperbolic tessellations).</strong>

The \(\{7,3\}\) tessellation: regular heptagons (7-sided polygons), 3 meeting at each vertex. Each heptagon has interior angle \(2\pi/3\) (instead of the Euclidean value \((1-2/7)\pi = 5\pi/7\)). This requires a hyperbolic heptagon, which is smaller than expected from the Euclidean formula.

The \(\{4,5\}\) tessellation: squares with 5 meeting at each vertex. Each square has interior angle \(2\pi/5 = 72°\) instead of the Euclidean \(90°\). Escher's "Circle Limit I" uses a variation of the \(\{6,4\}\) tessellation.

The \(\{3,7\}\) tessellation: equilateral triangles with 7 at each vertex. Each triangle has angle \(2\pi/7 \approx 51.4°\), so angle sum \(\approx 154.3° < 180°\), and area \(= \pi - 3\cdot 2\pi/7 = \pi/7\).</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 480 200" width="480" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- EUCLIDEAN {4,4}: grid of squares -->
  <text x="80" y="16" text-anchor="middle" fill="currentColor" font-weight="bold" font-size="12">Euclidean {4,4}</text>
  <!-- 3x3 grid of squares -->
  <rect x="20" y="25" width="120" height="120" fill="#f0f8f0" stroke="#2a2" stroke-width="1.2"/>
  <line x1="60" y1="25" x2="60" y2="145" stroke="#2a2" stroke-width="1.2"/>
  <line x1="100" y1="25" x2="100" y2="145" stroke="#2a2" stroke-width="1.2"/>
  <line x1="20" y1="65" x2="140" y2="65" stroke="#2a2" stroke-width="1.2"/>
  <line x1="20" y1="105" x2="140" y2="105" stroke="#2a2" stroke-width="1.2"/>
  <text x="80" y="161" text-anchor="middle" fill="#2a2" font-size="11">squares, 4/vertex</text>
  <text x="80" y="174" text-anchor="middle" fill="#2a2" font-size="11">1/4+1/4 = 1/2 ✓</text>
  <!-- SPHERICAL {3,4}: cube skeleton on sphere -->
  <text x="240" y="16" text-anchor="middle" fill="#e05" font-weight="bold" font-size="12">Spherical {3,4}</text>
  <circle cx="240" cy="85" r="60" fill="#fff0f0" stroke="#e05" stroke-width="1.5"/>
  <!-- Cube skeleton projected onto sphere: octahedron faces -->
  <polygon points="240,30 180,100 240,140 300,100" fill="none" stroke="#e05" stroke-width="1.5"/>
  <polygon points="240,30 300,100 240,140 180,100" fill="none" stroke="#e05" stroke-width="1.5"/>
  <line x1="240" y1="30" x2="240" y2="140" stroke="#e05" stroke-width="1.2" stroke-dasharray="4,3"/>
  <line x1="180" y1="100" x2="300" y2="100" stroke="#e05" stroke-width="1.2" stroke-dasharray="4,3"/>
  <text x="240" y="161" text-anchor="middle" fill="#e05" font-size="11">triangles, 4/vertex</text>
  <text x="240" y="174" text-anchor="middle" fill="#e05" font-size="11">1/3+1/4 &gt; 1/2 ✓</text>
  <!-- HYPERBOLIC {4,5}: squares in Poincaré disc -->
  <text x="400" y="16" text-anchor="middle" fill="#27c" font-weight="bold" font-size="12">Hyperbolic {4,5}</text>
  <circle cx="400" cy="85" r="60" fill="#f0f4ff" stroke="currentColor" stroke-width="1.8"/>
  <!-- Smaller squares near center -->
  <rect x="378" y="63" width="22" height="22" fill="none" stroke="#27c" stroke-width="1.5"/>
  <rect x="400" y="63" width="22" height="22" fill="none" stroke="#27c" stroke-width="1.5"/>
  <rect x="378" y="85" width="22" height="22" fill="none" stroke="#27c" stroke-width="1.5"/>
  <rect x="400" y="85" width="22" height="22" fill="none" stroke="#27c" stroke-width="1.5"/>
  <!-- Peripheral smaller squares (shrinking toward boundary) -->
  <rect x="357" y="63" width="12" height="12" fill="none" stroke="#27c" stroke-width="1"/>
  <rect x="357" y="85" width="12" height="12" fill="none" stroke="#27c" stroke-width="1"/>
  <rect x="422" y="63" width="12" height="12" fill="none" stroke="#27c" stroke-width="1"/>
  <rect x="422" y="85" width="12" height="12" fill="none" stroke="#27c" stroke-width="1"/>
  <text x="400" y="161" text-anchor="middle" fill="#27c" font-size="11">squares, 5/vertex</text>
  <text x="400" y="174" text-anchor="middle" fill="#27c" font-size="11">1/4+1/5 &lt; 1/2 ✓</text>
</svg>
</div>

### A.4.3 Hyperbolic Area of Ideal Polygons

An ideal polygon in \(\mathbb{H}^2\) has all vertices on \(S^1\). Ideal triangles have area \(\pi\) (all angles \(= 0\)). More generally:

<div class="theorem"><strong>Theorem A.10 (Area of Ideal \(n\)-gon).</strong> An ideal \(n\)-gon (all vertices on \(S^1\)) has hyperbolic area \((n-2)\pi\).</div>

<div class="proof"><strong>Proof.</strong> Triangulate the ideal \(n\)-gon into \((n-2)\) ideal triangles (each with area \(\pi\)). By additivity of area, the total area is \((n-2)\pi\).</div>

This formula mirrors the Euclidean formula for the angle sum of a polygon: an Euclidean \(n\)-gon has angle sum \((n-2)\pi\), but an ideal hyperbolic \(n\)-gon has <em>area</em> \((n-2)\pi\). In some sense, the angle-sum deficit has "become" the area.

### A.4.4 Hyperbolic Trigonometry — Small Angle Limits

The hyperbolic trig laws should reduce to the Euclidean laws for small triangles. Let us verify this explicitly.

<div class="remark"><strong>Remark (small triangle limits).</strong> For a hyperbolic triangle with small sides \(a, b, c \ll 1\) and angles \(\alpha, \beta, \gamma\):
\[\sinh a \approx a, \quad \cosh a \approx 1 + \frac{a^2}{2}, \quad \cos\alpha \approx \frac{(1+b^2/2)(1+c^2/2)-(1+a^2/2)}{bc} \approx \frac{b^2+c^2-a^2}{2bc}.\]
This is exactly the Euclidean law of cosines! Similarly, the hyperbolic sine law becomes the Euclidean sine law, and the angle sum approaches \(\pi\) (since the area \(\pi-(\alpha+\beta+\gamma) \approx 0\) for small triangles).

This is the manifestation of the fact that any smooth Riemannian manifold looks Euclidean at small scales — the curvature is a second-order effect. Formally, for a triangle of "size" \(\epsilon\), the angle sum deficit is \(\pi - (\alpha+\beta+\gamma) = K \cdot \text{Area} + O(\epsilon^4)\), where \(K\) is the curvature. For \(K=-1\) (hyperbolic) and Area \(\approx \frac{\sqrt{3}}{4}\epsilon^2\) (small equilateral triangle of side \(\epsilon\)), the deficit is approximately \(\frac{\sqrt{3}}{4}\epsilon^2\), which is indeed small.</div>

## A.5 Connections Between the Geometries

### A.5.1 The Projective Model of Hyperbolic Geometry (Klein Disc)

The Klein model makes explicit the connection between hyperbolic and projective geometry. Geodesics in the Klein model are Euclidean line segments — so the Klein model is a "projective" model of hyperbolic space.

<div class="definition"><strong>Definition A.11 (Klein Model).</strong> The Klein model is the open unit disc \(\mathbb{K}^2 = \{(x,y) : x^2+y^2 < 1\}\) with the metric:
\[d_K(P,Q) = \frac{1}{2}\log(A,B;P,Q)\]
where \(A, B\) are the intersections of the Euclidean line \(PQ\) with the unit circle \(S^1\), and the cross-ratio is taken of the four collinear points. Geodesics are Euclidean line segments.</div>

This definition makes clear why the cross-ratio is fundamental to hyperbolic geometry: the hyperbolic distance is literally a cross-ratio. The Poincaré disc model and Klein model are related by:
\[(x,y)_{\text{Klein}} = \frac{2(x,y)_{\text{Poincaré}}}{1+|(x,y)_{\text{Poincaré}}|^2}.\]

<div class="example"><strong>Example A.11a (Cross-ratio and hyperbolic distance in the Klein model).</strong>

Consider the geodesic along the \(x\)-axis in the Klein model. It extends from \(A = (-1,0)\) to \(B = (1,0)\). For points \(P = (p,0)\) and \(Q = (q,0)\):

\[(A,B;P,Q) = \frac{(P-A)(Q-B)}{(P-B)(Q-A)} = \frac{(p+1)(q-1)}{(p-1)(q+1)}.\]

Taking \(P = (0,0)\) (origin) and \(Q = (r,0)\) for small \(r > 0\):

\[d_K(O,Q) = \frac{1}{2}\log\frac{(0+1)(r-1)}{(0-1)(r+1)} = \frac{1}{2}\log\frac{-(r-1)}{-(r+1)} = \frac{1}{2}\log\frac{1-r}{1+r}\cdot(-1)^2\]

Wait, let's be careful with the cross-ratio order. Using \((A,B;P,Q) = \frac{(P-A)(Q-B)}{(Q-A)(P-B)}\):
\[= \frac{(p-(-1))(q-1)}{(q-(-1))(p-1)} = \frac{(p+1)(q-1)}{(q+1)(p-1)}.\]

For \(p=0\), \(q=r\): \(\frac{(1)(r-1)}{(r+1)(-1)} = \frac{r-1}{-(r+1)} = \frac{1-r}{1+r}\) (for \(0 < r < 1\), this is between 0 and 1).

\[d_K = \frac{1}{2}\left|\log\frac{1-r}{1+r}\right| = \frac{1}{2}\log\frac{1+r}{1-r} = \tanh^{-1}(r).\]

This matches the Poincaré distance formula: \(d_H(0,r) = \log\frac{1+r}{1-r} = 2\tanh^{-1}(r)\). The Klein model gives half the Poincaré distance, which is a normalization convention.</div>

### A.5.2 Flat Geometry as a Limit

All three geometries are related: Euclidean geometry is the \(K \to 0\) limit of both spherical (\(K = +1/R^2\) for radius \(R \to \infty\)) and hyperbolic (\(K = -1/R^2\) for \(R \to \infty\)) geometries.

On a sphere of radius \(R\), the spherical distance between two points at angle \(\theta\) apart is \(R\theta\), and the area formula becomes \(R^2(\alpha+\beta+\gamma-\pi)\). As \(R \to \infty\), the sphere "flattens" to the Euclidean plane, and the area formula gives \(\infty \cdot 0 = 0\) (consistent with the Euclidean formula where area is not determined by angles).

Similarly, in the hyperbolic plane with curvature \(-1/R^2\), scaling all distances by \(R\) and letting \(R \to \infty\) gives the Euclidean plane.

<div class="remark"><strong>Remark (Curvature and the angle-sum formula).</strong> For a geodesic triangle on a surface of constant curvature \(K\):
\[\text{(angle sum)} - \pi = K \cdot \text{Area}.\]
This is the Gauss-Bonnet formula for triangles. For \(K > 0\) (sphere), the angle sum exceeds \(\pi\); for \(K < 0\) (hyperbolic), it is less than \(\pi\); for \(K = 0\) (Euclidean), it equals \(\pi\) exactly. The formula shows that the curvature can be measured from within the geometry itself, without reference to any embedding in a higher-dimensional space. This is Gauss's Theorema Egregium: curvature is an intrinsic property.</div>

### A.5.3 Beltrami's Pseudosphere

Before Poincaré's disc model, Beltrami (1868) showed that a surface in \(\mathbb{R}^3\) called the pseudosphere has constant negative curvature \(-1\). The pseudosphere is the surface of revolution generated by a tractrix.

<div class="definition"><strong>Definition A.12 (Tractrix).</strong> The tractrix is the curve in \(\mathbb{R}^2\) satisfying: a point \(P\) moves along the curve such that the tangent from \(P\) to the \(x\)-axis always has length 1. The parametric equations are:
\[x = t - \tanh t, \quad y = \mathrm{sech}\, t, \quad t \geq 0.\]</div>

<div class="definition"><strong>Definition A.13 (Pseudosphere).</strong> The pseudosphere is the surface of revolution obtained by rotating the tractrix about the \(x\)-axis. It has Gaussian curvature \(K = -1\) everywhere (where it is smooth).</div>

The pseudosphere has a cusp (singular point) at the point of rotation on the \(x\)-axis, so it only models a portion of the hyperbolic plane — a doubly asymptotic strip. Nevertheless, it provides valuable intuition: the surface curves "saddle-like" at every point, with positive curvature in one direction and negative in the other (though the Gaussian curvature, the product of the principal curvatures, is \(-1\)).

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 360 200" width="360" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <defs>
    <marker id="arr8" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- Axes -->
  <line x1="20" y1="100" x2="340" y2="100" stroke="#777" stroke-width="1" marker-end="url(#arr8)"/>
  <text x="342" y="104" fill="#aaa" font-size="11">x</text>
  <line x1="40" y1="180" x2="40" y2="20" stroke="#777" stroke-width="1" marker-end="url(#arr8)"/>
  <text x="36" y="16" fill="#aaa" font-size="11">y</text>
  <!-- Tractrix curve (top profile) -->
  <path d="M40,40 C80,42 130,55 180,75 C220,90 260,98 295,100" fill="none" stroke="#e05" stroke-width="2"/>
  <!-- Tractrix curve (bottom profile) -->
  <path d="M40,160 C80,158 130,145 180,125 C220,110 260,102 295,100" fill="none" stroke="#e05" stroke-width="2"/>
  <!-- Cusp point -->
  <circle cx="295" cy="100" r="4" fill="#e05"/>
  <text x="298" y="96" fill="#e05" font-size="11">cusp</text>
  <!-- Fill the pseudosphere -->
  <path d="M40,40 C80,42 130,55 180,75 C220,90 260,98 295,100 C260,102 220,110 180,125 C130,145 80,158 40,160 Z" fill="#fde" fill-opacity="0.4"/>
  <!-- Latitude lines on surface -->
  <ellipse cx="100" cy="100" rx="5" ry="30" fill="none" stroke="#c88" stroke-width="1" stroke-dasharray="3,3"/>
  <ellipse cx="160" cy="100" rx="5" ry="20" fill="none" stroke="#c88" stroke-width="1" stroke-dasharray="3,3"/>
  <ellipse cx="220" cy="100" rx="4" ry="10" fill="none" stroke="#c88" stroke-width="1" stroke-dasharray="3,3"/>
  <!-- Labels -->
  <text x="50" y="175" fill="currentColor" font-size="11">tractrix profile</text>
  <text x="160" y="185" text-anchor="middle" fill="currentColor" font-size="11">K = −1 everywhere (except cusp)</text>
</svg>
</div>

## A.6 The Parallel Postulate — Five Equivalent Forms

Euclid's fifth postulate has many equivalent formulations. Understanding these equivalences illuminates why the parallel postulate is special and why its negation leads to a valid geometry.

<div class="theorem"><strong>Theorem A.14 (Equivalent Forms of the Parallel Postulate).</strong> In the presence of Euclid's first four postulates, the following are all equivalent to the parallel postulate:
<ol>
<li><strong>(Euclid V)</strong> If a line crosses two others making interior angles summing to less than \(\pi\) on one side, the two lines meet on that side.</li>
<li><strong>(Playfair)</strong> Through any point not on a line, there is exactly one line parallel to the given line.</li>
<li><strong>(Angle Sum)</strong> The sum of interior angles in any triangle is \(\pi\).</li>
<li><strong>(Pythagoras)</strong> In a right triangle, \(a^2 + b^2 = c^2\).</li>
<li><strong>(Similar Triangles)</strong> There exist non-congruent similar triangles.</li>
<li><strong>(Rectangle Existence)</strong> There exists a rectangle (a quadrilateral with four right angles).</li>
</ol></div>

The equivalence of (1)–(6) is proved by assuming each and deriving the others, using only the first four postulates. This reveals that the "parallel world" of geometry is highly interconnected: seemingly unrelated facts (the existence of similar triangles, the Pythagorean theorem, the angle sum) are all secretly equivalent to the parallel postulate.

In both spherical and hyperbolic geometry, all six of these statements fail (in different directions):

| Statement | Euclidean | Spherical | Hyperbolic |
|---|---|---|---|
| One parallel through external point | Exactly one | None | Infinitely many |
| Angle sum | \(= \pi\) | \(> \pi\) | \(< \pi\) |
| Pythagoras | \(a^2+b^2=c^2\) | \(\cos c = \cos a\cos b\) | \(\cosh c = \cosh a\cosh b\) |
| Similar non-congruent triangles | Exist | Don't exist | Don't exist |
| Rectangles | Exist | Don't exist | Don't exist |

## A.7 Connections to Modern Mathematics

### A.7.1 Hyperbolic Geometry and Complex Analysis

The upper half-plane model \(\mathbb{U}^2\) is closely connected to complex analysis. The Möbius transformations that preserve \(\mathbb{U}^2\) form the group \(\mathrm{PSL}(2,\mathbb{R})\), which is one of the most important groups in mathematics:

- As the isometry group of \(\mathbb{U}^2\), it gives the symmetries of hyperbolic geometry.
- As a subgroup of \(\mathrm{PSL}(2,\mathbb{C})\) (the full Möbius group), it appears in the theory of Riemann surfaces.
- Quotients \(\mathbb{U}^2/\Gamma\) for discrete subgroups \(\Gamma \subset \mathrm{PSL}(2,\mathbb{R})\) give Riemann surfaces of genus \(\geq 2\) — this is the uniformization theorem.
- The classical theory of modular forms (which underlies many deep results in number theory, including Fermat's Last Theorem) uses the action of \(\mathrm{SL}(2,\mathbb{Z}) \subset \mathrm{SL}(2,\mathbb{R})\) on \(\mathbb{U}^2\).

### A.7.2 Riemannian Geometry and the Sectional Curvature

The three constant-curvature geometries are special cases of Riemannian geometry:

- A Riemannian manifold \((M, g)\) is a smooth manifold with a smoothly varying inner product \(g\) on each tangent space.
- The Gaussian curvature \(K\) (for surfaces) generalizes to the Riemann curvature tensor for higher dimensions.
- Space forms are Riemannian manifolds of constant sectional curvature: \(S^n\) (\(K=1\)), \(\mathbb{R}^n\) (\(K=0\)), and hyperbolic space \(\mathbb{H}^n\) (\(K=-1\)).

The discovery of hyperbolic geometry made Riemannian geometry possible: once mathematicians realized that the parallel postulate could fail, Riemann (1854) was free to imagine arbitrary smooth variations of curvature, leading to the modern framework used in general relativity.

<div class="remark"><strong>Remark (Einstein and negative curvature).</strong> In general relativity, the spacetime near a massive object has negative (in the spatial directions) curvature — the presence of mass "bends" spacetime. The shortest paths (geodesics) in this curved spacetime are the trajectories of freely falling objects, including light. The bending of light by the Sun, confirmed by the 1919 solar eclipse expedition, was one of the first experimental validations of general relativity and thus, indirectly, of the idea that physical space need not be Euclidean.</div>

### A.7.3 Thurston's Geometrization Conjecture

William Thurston (1978) proposed a classification of three-dimensional manifolds into eight geometric types, including the three constant-curvature geometries in 3D. Grigori Perelman proved Thurston's conjecture (and the Poincaré Conjecture) in 2003. The vast majority of three-dimensional manifolds (in a precise sense) admit a hyperbolic metric — hyperbolic geometry is, in a sense, the "generic" three-dimensional geometry.

This shows that the hyperbolic plane, which began as a mathematical curiosity (a geometry in which the parallel postulate fails), is actually the most common type of three-dimensional geometry. Far from being an exotic exception, hyperbolic geometry is the rule.

---

## A.8 Exercises and Problems

The following problems test the material from all four chapters.

**Chapter 1 Problems**

1. Let \(\mathbf{u} = (3,4,0)\) and \(\mathbf{v} = (0,4,3)\). Compute: (a) \(\mathbf{u}\cdot\mathbf{v}\), (b) \(|\mathbf{u}|\) and \(|\mathbf{v}|\), (c) the angle between \(\mathbf{u}\) and \(\mathbf{v}\), (d) \(\mathbf{u}\times\mathbf{v}\), (e) \(\mathrm{Proj}_\mathbf{v}(\mathbf{u})\).

2. For the triangle with vertices \(A=(0,0)\), \(B=(6,0)\), \(C=(2,4)\): (a) find all four classical centers, (b) verify the Euler line relation, (c) find the circumradius and inradius.

3. Describe the isometry of \(\mathbb{R}^2\) given by \(S(x,y) = (y,-x) + (1,0)\): (a) what type is it? (b) find its fixed points (if any), (c) find its axis (if any).

4. Show that the composition of reflections in three concurrent lines is a reflection.

**Chapter 2 Problems**

5. Let \(\mathbf{p} = (\sin\phi\cos\lambda, \sin\phi\sin\lambda, \cos\phi)\) represent a point at colatitude \(\phi\) and longitude \(\lambda\) on \(S^2\). (a) Find the spherical distance from \(\mathbf{p}\) to the north pole. (b) Find the spherical distance from \((1,0,0)\) to \((0,1/\sqrt{2}, 1/\sqrt{2})\).

6. A spherical triangle has angles \(\alpha = \pi/2\), \(\beta = \pi/3\), \(\gamma = \pi/4\). (a) Find all three side lengths using the Second Law of Cosines. (b) Compute the area. (c) Compute the side lengths of the polar triangle.

7. For the stereographic projection \(\phi: S^2\setminus\{N\} \to \mathbb{R}^2\), prove that great circles not passing through \(N\) map to circles in \(\mathbb{R}^2\).

**Chapter 3 Problems**

8. In \(\mathbb{P}^2\), find the intersection of the projective lines \(\{x+2y-z=0\}\) and \(\{2x-y+3z=0\}\).

9. Let \(C\) be the conic \(\{x^2+y^2-z^2=0\}\) in \(\mathbb{P}^2\). (a) Is this a non-degenerate conic? (b) What curve does it become in the affine chart \(\phi_3\)? (c) What are the "points at infinity" of this curve?

10. Verify Desargues' theorem for specific numerical coordinates of your choice.

**Chapter 4 Problems**

11. In the Poincaré disc model: (a) Find the hyperbolic distance \(d_H((0.4,0),(0,0.4))\). (b) Find the hyperbolic length of the geodesic arc from \((0.5,0)\) to \((0,0.5)\). (c) Show that the hyperbolic midpoint of the segment from \(0\) to \(r \in (0,1)\) on the real axis is at \(r/(1+\sqrt{1-r^2})\).

12. For a hyperbolic triangle with all angles equal to \(\pi/4\): (a) find the side lengths using the Second Law of Cosines, (b) find the area, (c) verify using the First Law.

13. Show that in the upper half-plane model, the geodesic from \(i\) to \(1+i\) is a semicircle of radius \(\sqrt{2}/2\) centered at \(1/2\) on the real axis.

14. (Challenge) Prove that the Poincaré disc model has constant Gaussian curvature \(-1\) by computing the curvature of the metric \(ds^2 = \frac{4(dx^2+dy^2)}{(1-x^2-y^2)^2}\).

---

# Appendix B: Proof Details and Extended Calculations

## B.1 The Law of Cosines — All Three Geometries

It is instructive to see all three cosine laws derived in parallel, highlighting the structural unity.

### B.1.1 Euclidean Law of Cosines

Place the triangle with \(u = (0,0)\), \(v = (c,0)\), \(w = (b\cos\alpha, b\sin\alpha)\). Then:
\[a^2 = |w-v|^2 = (b\cos\alpha - c)^2 + (b\sin\alpha)^2 = b^2 - 2bc\cos\alpha + c^2.\]
Rearranging: \(\cos\alpha = \frac{b^2+c^2-a^2}{2bc}\).

### B.1.2 Spherical Law of Cosines — Full Derivation

<div class="proof"><strong>Proof of First Spherical Law of Cosines.</strong> Let \([\mathbf{u},\mathbf{v},\mathbf{w}]\) be a spherical triangle with edge lengths \(a = d_S(\mathbf{v},\mathbf{w})\), \(b = d_S(\mathbf{u},\mathbf{w})\), \(c = d_S(\mathbf{u},\mathbf{v})\). Let \(\alpha\) be the angle at \(\mathbf{u}\) between the geodesics to \(\mathbf{v}\) and \(\mathbf{w}\).

The tangent vector from \(\mathbf{u}\) toward \(\mathbf{v}\) is:
\[\hat{\mathbf{t}}_{uv} = \frac{\mathbf{v} - (\mathbf{u}\cdot\mathbf{v})\mathbf{u}}{|\mathbf{u}\times\mathbf{v}|} = \frac{\mathbf{v} - \cos(c)\mathbf{u}}{\sin(c)}.\]

Similarly, \(\hat{\mathbf{t}}_{uw} = \frac{\mathbf{w} - \cos(b)\mathbf{u}}{\sin(b)}\).

The angle \(\alpha\) at \(\mathbf{u}\) satisfies:
\[\cos\alpha = \hat{\mathbf{t}}_{uv} \cdot \hat{\mathbf{t}}_{uw} = \frac{(\mathbf{v} - \cos c\,\mathbf{u})\cdot(\mathbf{w} - \cos b\,\mathbf{u})}{\sin b\sin c}.\]

Expanding: \((\mathbf{v}-\cos c\,\mathbf{u})\cdot(\mathbf{w}-\cos b\,\mathbf{u}) = \mathbf{v}\cdot\mathbf{w} - \cos b\,(\mathbf{v}\cdot\mathbf{u}) - \cos c\,(\mathbf{u}\cdot\mathbf{w}) + \cos b\cos c\,|\mathbf{u}|^2\).

Using \(\mathbf{v}\cdot\mathbf{w} = \cos a\), \(\mathbf{v}\cdot\mathbf{u} = \cos c\), \(\mathbf{u}\cdot\mathbf{w} = \cos b\), \(|\mathbf{u}|^2=1\):
\[= \cos a - \cos b\cos c - \cos c\cos b + \cos b\cos c = \cos a - \cos b\cos c.\]

Therefore:
\[\cos\alpha = \frac{\cos a - \cos b\cos c}{\sin b\sin c}. \quad\square\]</div>

### B.1.3 Hyperbolic Law of Cosines — Derivation via Upper Half-Plane

<div class="proof"><strong>Proof of First Hyperbolic Law of Cosines.</strong> Place the triangle in \(\mathbb{U}^2\) with \(\mathbf{u} = i\) (the imaginary unit), \(\mathbf{v} = e^{c}i = e^{c\!}i\) (hyperbolic distance \(c\) along the imaginary axis), and \(\mathbf{w}\) at hyperbolic distance \(b\) from \(\mathbf{u}\) at angle \(\alpha\) from the geodesic to \(\mathbf{v}\).

In the upper half-plane, the geodesic from \(i\) along the imaginary axis reaches the point \(e^c i\) (since \(d_H(i,e^c i) = \int_1^{e^c} \frac{dy}{y} = c\)). Place \(\mathbf{w}\) on a geodesic making angle \(\alpha\) with the imaginary axis.

The hyperbolic distance formula \(d_H(z,w) = \cosh^{-1}\!\left(1 + \frac{|z-w|^2}{2\,\mathrm{Im}(z)\,\mathrm{Im}(w)}\right)\) gives:
\[\cosh a = 1 + \frac{|\mathbf{v}-\mathbf{w}|^2}{2\,\mathrm{Im}(\mathbf{v})\,\mathrm{Im}(\mathbf{w})}.\]

After computing \(\mathbf{w}\) explicitly (using the angle \(\alpha\) and distance \(b\) from \(\mathbf{u}=i\)) and substituting, one finds:
\[\cosh a = \cosh b\cosh c - \sinh b\sinh c\cos\alpha.\]
Rearranging: \(\cos\alpha = \frac{\cosh b\cosh c - \cosh a}{\sinh b\sinh c}\). \(\square\)</div>

## B.2 The Gauss-Bonnet Theorem — General Statement

The area formulas for spherical and hyperbolic triangles are both special cases of the Gauss-Bonnet theorem, one of the most important results in differential geometry.

<div class="theorem"><strong>Theorem B.1 (Gauss-Bonnet for Compact Surfaces).</strong> Let \(M\) be a compact oriented smooth surface (Riemannian 2-manifold) without boundary. Then:
\[\iint_M K\, dA = 2\pi\chi(M),\]
where \(K\) is the Gaussian curvature and \(\chi(M)\) is the Euler characteristic of \(M\).</div>

<div class="example"><strong>Example B.1a (Gauss-Bonnet for the sphere).</strong>

For \(S^2\): \(K \equiv +1\), \(\chi(S^2) = 2\).
\[\iint_{S^2} 1\, dA = \text{Area}(S^2) = 4\pi = 2\pi\cdot 2. \checkmark\]

For a torus \(T^2\): \(\chi(T^2) = 0\), so \(\iint_{T^2} K\, dA = 0\). The torus has positive and negative curvature regions that cancel out.

For a surface of genus \(g\): \(\chi = 2-2g\), so \(\iint K\, dA = 4\pi(1-g)\). For \(g \geq 2\), this is negative, consistent with the surface having hyperbolic geometry (by the uniformization theorem).</div>

The Gauss-Bonnet theorem for a geodesic triangle is the version we proved in the course:
\[\iint_T K\, dA = (\alpha+\beta+\gamma) - \pi,\]
which gives the spherical excess for \(K=+1\) and the hyperbolic defect for \(K=-1\).

## B.3 Spherical Trigonometry — The Napier Rules for Right Triangles

For spherical right triangles (with \(\gamma = \pi/2\)), there is an elegant mnemonic called Napier's Rules (John Napier, 1614) for remembering all the relationships between the five parts \(a, b, c-\pi/2, \pi/2-\alpha, \pi/2-\beta\) (the "co-parts").

<div class="theorem"><strong>Theorem B.2 (Napier's Rules for Spherical Right Triangles).</strong> For a spherical triangle with \(\gamma = \pi/2\), arrange the five quantities \(a, b, \pi/2-\alpha, c, \pi/2-\beta\) in a circle (in this order). Then:
<ul>
<li>The cosine of any part equals the product of the sines of the two opposite parts.</li>
<li>The cosine of any part equals the product of the cosines of the two adjacent parts.</li>
</ul></div>

<div class="example"><strong>Example B.2a (Using Napier's Rules).</strong>

For a spherical right triangle with \(\gamma = \pi/2\), \(c = \pi/3\), \(\alpha = \pi/4\). Find \(b\), \(\beta\), and \(a\).

Napier's circle (in order): \(a,\; b,\; \pi/2-\alpha = \pi/4,\; c = \pi/3,\; \pi/2-\beta\).

Rule (cosine = product of sines of opposite):
\[\cos(\pi/4) = \sin b\sin(\pi/3) \implies \frac{\sqrt{2}}{2} = \sin b \cdot \frac{\sqrt{3}}{2} \implies \sin b = \frac{\sqrt{2}}{\sqrt{3}} = \sqrt{2/3}.\]
\[b = \arcsin(\sqrt{2/3}) \approx 0.9553 \text{ rad} \approx 54.7°.\]

Rule (cosine = product of cosines of adjacent):
\[\cos c = \cos a\cos b \implies \cos(\pi/3) = \cos a\cos b.\]
\[\frac{1}{2} = \cos a \cdot \sqrt{1-2/3} = \cos a\cdot\frac{1}{\sqrt{3}} \implies \cos a = \frac{\sqrt{3}}{2} \implies a = \frac{\pi}{6}.\]

For \(\beta\): \(\cos(\pi/2-\beta) = \sin\beta\). From \(\sin\beta\sin(\pi/4) = \cos b\):
\[\sin\beta = \frac{\cos b}{\sin(\pi/4)} = \frac{\sqrt{1/3}}{\sqrt{2}/2} = \frac{2}{\sqrt{6}} = \sqrt{2/3}.\]
So \(\beta = \arcsin(\sqrt{2/3}) = b\). This makes sense by the symmetry \(a = \pi/6\), \(b \approx 54.7°\), \(\alpha = \pi/4\).

Check with Girard: Area \(= \alpha + \beta + \gamma - \pi = \pi/4 + \arcsin(\sqrt{2/3}) + \pi/2 - \pi = \arcsin(\sqrt{2/3}) - \pi/4 \approx 0.9553 - 0.785 \approx 0.17\) steradians.</div>

## B.4 Circle Inversion — Deeper Properties

### B.4.1 The Image of a Circle Under Inversion

<div class="theorem"><strong>Theorem B.3 (Image of a Circle Under Inversion).</strong> Let \(F_C\) be inversion in the circle \(C\) centred at \(O\) with radius \(r\). Let \(D\) be a circle with centre \(Q\) and radius \(\rho\), with \(O \notin D\).

If \(|OQ|^2 \neq \rho^2\) (i.e., \(O\) is not on \(D\)), then \(F_C(D)\) is the circle with:
\[\text{Centre}: O + \frac{r^2(Q-O)}{|Q-O|^2 - \rho^2}, \qquad \text{Radius}: \frac{r^2\rho}{||Q-O|^2 - \rho^2|}.\]</div>

<div class="example"><strong>Example B.3a (Inverting a circle through the origin's inversion circle).</strong>

Let \(C\) be the unit circle (inversion in \(C\), centred at origin, radius 1). Let \(D\) be the circle centred at \(Q = (3,0)\) with radius \(\rho = 1\).

\(|OQ|^2 - \rho^2 = 9 - 1 = 8\).

Image centre: \(O + \frac{1\cdot(3,0)}{8} = (3/8, 0)\).
Image radius: \(\frac{1\cdot 1}{8} = 1/8\).

So the circle of radius 1 centred at \((3,0)\) inverts to the circle of radius \(1/8\) centred at \((3/8, 0)\). Note: the image circle is much smaller and closer to the origin — consistent with inversion moving far objects close and shrinking them.</div>

### B.4.2 Why Circle Inversions Preserve \(\mathbb{H}^2\)

Let us give a complete proof that inversion in an orthogonal circle preserves the unit disc.

<div class="proof"><strong>Proof that \(F_C(\mathbb{H}^2) = \mathbb{H}^2\) when \(C\) is orthogonal to \(S^1\).</strong>

Let \(C\) have centre \(a = (a_1,0)\) (WLOG on the real axis by rotation) and radius \(r = \sqrt{a_1^2-1}\) (orthogonality condition). For \(\mathbf{x} = (x_1,x_2)\) with \(|\mathbf{x}| < 1\), let \(\mathbf{y} = F_C(\mathbf{x}) = a + \frac{r^2}{|\mathbf{x}-a|^2}(\mathbf{x}-a)\).

We compute \(|\mathbf{y}|^2\):
\[\mathbf{y} - a = \frac{r^2}{|\mathbf{x}-a|^2}(\mathbf{x}-a),\]
\[|\mathbf{y}|^2 = |a|^2 + 2a\cdot(\mathbf{y}-a) + |\mathbf{y}-a|^2 = a_1^2 + 2a_1\cdot\frac{r^2(x_1-a_1)}{|\mathbf{x}-a|^2} + \frac{r^4}{|\mathbf{x}-a|^2}.\]

Using \(r^2 = a_1^2 - 1\) and expanding \(|\mathbf{x}-a|^2 = x_1^2 - 2a_1 x_1 + a_1^2 + x_2^2\):

After expanding and simplifying (using \(|\mathbf{x}|^2 = x_1^2+x_2^2\)):
\[|\mathbf{y}|^2 = \frac{(a_1^2-1)|\mathbf{x}|^2 - 2a_1|\mathbf{x}|^2 + a_1^2 + 2a_1 x_1 - 2a_1^2 x_1 + a_1^2(a_1^2-1) + \cdots}{|\mathbf{x}-a|^4} \cdot |\mathbf{x}-a|^2.\]

The key identity is: \(|\mathbf{y}|^2 - 1 = \frac{(a_1^2-1)(|\mathbf{x}|^2-1)}{|\mathbf{x}-a|^2}\) (this requires careful algebra using \(r^2 = a_1^2-1\)).

Since \(|\mathbf{x}| < 1\), we have \(|\mathbf{x}|^2 - 1 < 0\), and since \(|a|=a_1 > 1\) (so \(a_1^2-1 > 0\)), the right side is negative, giving \(|\mathbf{y}|^2 < 1\). Thus \(\mathbf{y} \in \mathbb{H}^2\). \(\square\)</div>

## B.5 The Upper Half-Plane — Geodesics and Distances

### B.5.1 Finding the Geodesic Through Two Points

In the upper half-plane \(\mathbb{U}^2 = \{z = x+iy : y > 0\}\), geodesics are either:
1. Vertical lines \(\{x = c\}\), or
2. Upper semicircles with centres on the real axis.

<div class="example"><strong>Example B.5a (Finding the geodesic through \(z_1 = 1+i\) and \(z_2 = 3+2i\)).</strong>

Since the real parts differ (\(x_1 = 1 \neq x_2 = 3\)), the geodesic is a semicircle. Its centre is at some point \((m, 0)\) on the real axis equidistant from \(z_1\) and \(z_2\):
\[|z_1 - m|^2 = |z_2 - m|^2\]
\[(1-m)^2 + 1 = (3-m)^2 + 4\]
\[1 - 2m + m^2 + 1 = 9 - 6m + m^2 + 4\]
\[2 - 2m = 13 - 6m\]
\[4m = 11 \implies m = 11/4.\]

The radius is \(R = |z_1 - 11/4| = |(1-11/4)^2+1^2|^{1/2} = |(-7/4)^2+1|^{1/2} = \sqrt{49/16+1} = \sqrt{65/16} = \sqrt{65}/4\).

The geodesic is the upper semicircle centred at \((11/4, 0)\) with radius \(\sqrt{65}/4\).</div>

<div class="example"><strong>Example B.5b (Hyperbolic distance in the upper half-plane).</strong>

For \(z_1 = i\) and \(z_2 = 2i\) (both on the imaginary axis):
\[d_H(i, 2i) = \int_1^2 \frac{dy}{y} = \ln 2 \approx 0.693.\]

For \(z_1 = i\) and \(z_2 = 1+i\) (not on the same vertical line), use the formula:
\[d_H(z_1,z_2) = \cosh^{-1}\left(1 + \frac{|z_1-z_2|^2}{2\,\mathrm{Im}(z_1)\mathrm{Im}(z_2)}\right) = \cosh^{-1}\left(1 + \frac{1}{2}\right) = \cosh^{-1}(3/2).\]
\[\cosh^{-1}(3/2) = \ln\left(\frac{3}{2}+\sqrt{\frac{9}{4}-1}\right) = \ln\left(\frac{3}{2}+\frac{\sqrt{5}}{2}\right) = \ln\left(\frac{3+\sqrt{5}}{2}\right) \approx \ln(2.618) \approx 0.962.\]</div>

### B.5.2 The Horoball and Fundamental Domain

In the upper half-plane, horocycles based at \(\infty\) are horizontal lines \(\{y = c\}\). The region \(\{y > c\}\) is a <em>horoball</em> — a "ball" centered at the ideal point \(\infty\).

<div class="definition"><strong>Definition B.4 (Fundamental Domain for \(\mathrm{SL}(2,\mathbb{Z})\)).</strong> The standard fundamental domain for the modular group \(\Gamma = \mathrm{PSL}(2,\mathbb{Z})\) acting on \(\mathbb{U}^2\) is:
\[\mathcal{F} = \left\{z \in \mathbb{U}^2 : |z| \geq 1,\; -\frac{1}{2} \leq \mathrm{Re}(z) \leq \frac{1}{2}\right\}.\]</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 300 230" width="300" height="230" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <defs>
    <marker id="arr9" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- Axes -->
  <line x1="20" y1="180" x2="280" y2="180" stroke="#777" stroke-width="1" marker-end="url(#arr9)"/>
  <text x="282" y="184" fill="#aaa" font-size="11">Re(z)</text>
  <line x1="150" y1="190" x2="150" y2="20" stroke="#777" stroke-width="1" marker-end="url(#arr9)"/>
  <text x="154" y="16" fill="#aaa" font-size="11">Im(z)</text>
  <!-- Fundamental domain F: shaded region -->
  <!-- Left side x = -1/2 (mapped to x=90 in SVG where 1 unit = 120px) -->
  <!-- Right side x = 1/2 (mapped to x=210) -->
  <!-- Bottom arc |z|=1, from angle 120° to 60° -->
  <!-- Center (0,0) in complex plane = (150, 180) in SVG. 1 unit = 120px. -->
  <!-- Arc: center (150,180), r=120, from angle 60° (1/6) to 120° (1/3) above real axis -->
  <!-- Points: e^{iπ/3} = (cos60°,sin60°) = (0.5, √3/2) → SVG: (150+60, 180-104) = (210,76) -->
  <!-- e^{2iπ/3} = (-0.5, √3/2) → SVG: (90, 76) -->
  <path d="M90,180 L90,76 A120,120 0 0,1 210,76 L210,180" fill="#e8f0ff" fill-opacity="0.7" stroke="none"/>
  <!-- Left boundary (identified) -->
  <line x1="90" y1="76" x2="90" y2="180" stroke="#e05" stroke-width="2"/>
  <!-- Right boundary (identified) -->
  <line x1="210" y1="76" x2="210" y2="180" stroke="#e05" stroke-width="2"/>
  <!-- Bottom arc -->
  <path d="M90,76 A120,120 0 0,1 210,76" fill="none" stroke="#27c" stroke-width="2"/>
  <!-- Axis ticks and labels -->
  <line x1="90" y1="178" x2="90" y2="182" stroke="#999" stroke-width="1"/>
  <text x="90" y="194" text-anchor="middle" fill="currentColor" font-size="11">−½</text>
  <line x1="210" y1="178" x2="210" y2="182" stroke="#999" stroke-width="1"/>
  <text x="210" y="194" text-anchor="middle" fill="currentColor" font-size="11">½</text>
  <line x1="148" y1="76" x2="152" y2="76" stroke="#999" stroke-width="1"/>
  <text x="135" y="80" fill="currentColor" font-size="11">i</text>
  <!-- Special points -->
  <circle cx="90" cy="76" r="3" fill="#27c"/>
  <circle cx="210" cy="76" r="3" fill="#27c"/>
  <text x="75" y="70" fill="#27c" font-size="10">e^{2πi/3}</text>
  <text x="210" y="70" fill="#27c" font-size="10">e^{πi/3}</text>
  <!-- Label for region -->
  <text x="150" y="130" text-anchor="middle" fill="currentColor" font-size="12" font-style="italic">ℱ</text>
  <!-- Identification labels -->
  <text x="150" y="213" text-anchor="middle" fill="#e05" font-size="10">sides identified: z↦z+1</text>
  <text x="150" y="225" text-anchor="middle" fill="#27c" font-size="10">arc identified: z↦−1/z</text>
</svg>
</div>

The fundamental domain \(\mathcal{F}\) is the hyperbolic analogue of a parallelogram fundamental domain for a lattice in Euclidean space. The quotient \(\mathbb{U}^2/\Gamma\) is the modular surface, which has finite hyperbolic area \(\pi/3\) — computed by integrating \(dx\,dy/y^2\) over \(\mathcal{F}\).

## B.6 Curvature Computations

### B.6.1 Gaussian Curvature of the Sphere

The sphere \(S^2\) of radius 1 in \(\mathbb{R}^3\) can be parametrized by:
\[\mathbf{r}(\phi,\lambda) = (\sin\phi\cos\lambda, \sin\phi\sin\lambda, \cos\phi), \quad \phi \in (0,\pi), \lambda \in (0,2\pi).\]

The first fundamental form (metric tensor) has components:
\[E = |\mathbf{r}_\phi|^2 = 1, \quad F = \mathbf{r}_\phi\cdot\mathbf{r}_\lambda = 0, \quad G = |\mathbf{r}_\lambda|^2 = \sin^2\phi.\]

The second fundamental form has components \(e = -1\), \(f = 0\), \(g = -\sin^2\phi\).

The Gaussian curvature is:
\[K = \frac{eg-f^2}{EG-F^2} = \frac{(-1)(-\sin^2\phi) - 0}{1\cdot\sin^2\phi - 0} = \frac{\sin^2\phi}{\sin^2\phi} = 1.\]

So the sphere has constant Gaussian curvature \(K = 1\). For a sphere of radius \(R\), the curvature would be \(K = 1/R^2\).

### B.6.2 Gaussian Curvature of the Poincaré Disc

For the Poincaré metric \(g = \frac{4}{(1-r^2)^2}(dx^2+dy^2)\) where \(r^2 = x^2+y^2\), the conformal factor is \(\lambda = \frac{2}{1-r^2}\), so \(g = \lambda^2(dx^2+dy^2)\).

The Gaussian curvature of a conformally flat metric \(g = e^{2f}(dx^2+dy^2)\) is:
\[K = -e^{-2f}\Delta f,\]
where \(\Delta\) is the Euclidean Laplacian.

Here \(e^{2f} = \frac{4}{(1-r^2)^2}\), so \(2f = \log 4 - 2\log(1-r^2)\), \(f = \log 2 - \log(1-r^2)\).

\[\frac{\partial f}{\partial x} = \frac{2x}{1-r^2}, \quad \frac{\partial^2 f}{\partial x^2} = \frac{2(1-r^2) + 4x^2}{(1-r^2)^2} = \frac{2+2y^2-2x^2+4x^2}{(1-r^2)^2}.\]

By symmetry in \(x\) and \(y\):
\[\Delta f = \frac{\partial^2 f}{\partial x^2}+\frac{\partial^2 f}{\partial y^2} = \frac{4(1+r^2)}{(1-r^2)^2} \cdot \frac{1}{1}.\]

Actually, let's compute more carefully:
\[\frac{\partial^2 f}{\partial x^2} = \frac{2(1-r^2) - 2x(-2x)}{(1-r^2)^2} = \frac{2-2r^2+4x^2}{(1-r^2)^2}.\]

\[\Delta f = \frac{2-2r^2+4x^2}{(1-r^2)^2}+\frac{2-2r^2+4y^2}{(1-r^2)^2} = \frac{4-4r^2+4r^2}{(1-r^2)^2} = \frac{4}{(1-r^2)^2}.\]

\[K = -e^{-2f}\Delta f = -\frac{(1-r^2)^2}{4}\cdot\frac{4}{(1-r^2)^2} = -1.\]

Confirmed: the Poincaré disc has Gaussian curvature \(K = -1\) everywhere. ✓

## B.7 Geometric Proofs of Pythagorean Theorems

All three geometries have a "Pythagorean theorem" for right triangles:

| Geometry | Statement |
|---|---|
| Euclidean | \(a^2 = b^2 + c^2\) |
| Spherical | \(\cos a = \cos b\cos c\) |
| Hyperbolic | \(\cosh a = \cosh b\cosh c\) |

All three reduce to the Euclidean case for small triangles:
- Spherical: \(\cos a \approx 1-a^2/2\), so \(1-a^2/2 \approx (1-b^2/2)(1-c^2/2) \approx 1-b^2/2-c^2/2\), giving \(a^2 = b^2+c^2\).
- Hyperbolic: \(\cosh a \approx 1+a^2/2\), giving the same computation.

<div class="remark"><strong>Remark (The spherical Pythagorean theorem).</strong> The formula \(\cos a = \cos b\cos c\) for a right spherical triangle says something beautiful: if you know two legs of a right spherical triangle, the hypotenuse is determined. Moreover:
\[\cos a = \cos b\cos c < \cos b < \cos 0 = 1,\]
so \(a > b\) (the hypotenuse is longer than either leg), just as in Euclidean geometry. But the spherical hypotenuse is shorter than the Euclidean one: \(\cos a = \cos b\cos c > \cos\sqrt{b^2+c^2}\) (since \(\cos\) is concave on \([0,\pi]\)... actually let us not claim this without verification).

For the hyperbolic Pythagorean theorem, \(\cosh a = \cosh b\cosh c > \cosh b > 1\), so \(a > b\) again. The hyperbolic hypotenuse is longer than the Euclidean one: \(\cosh a = \cosh b\cosh c\), and using \(\cosh x > 1+x^2/2\): \(\cosh a \approx 1+a^2/2\) and \(\cosh b\cosh c \approx (1+b^2/2)(1+c^2/2) \approx 1+(b^2+c^2)/2\), so \(a^2 \approx b^2+c^2\), with the correction being positive (since \(\cosh b\cosh c > 1+(b^2+c^2)/2\)). So the hyperbolic hypotenuse is longer than the Euclidean one.</div>

## B.8 Topology and Geometry

### B.8.1 The Euler Characteristic and Curvature

The Gauss-Bonnet theorem \(\iint_M K\,dA = 2\pi\chi(M)\) connects the local differential geometry (curvature \(K\)) to the global topology (Euler characteristic \(\chi\)). This is one of the deepest theorems in mathematics, and the non-Euclidean geometries are central examples.

| Surface | Euler Characteristic \(\chi\) | Curvature | Total curvature \(= 2\pi\chi\) |
|---|---|---|---|
| \(S^2\) (sphere) | \(2\) | \(+1\) | \(4\pi\) |
| \(T^2\) (torus) | \(0\) | varies (averages to \(0\)) | \(0\) |
| \(\Sigma_g\) (genus \(g\)) | \(2-2g\) | \(-1\) (hyperbolic) | \(4\pi(1-g)\) |

For a genus-2 surface \(\Sigma_2\), \(\chi = -2\), and a hyperbolic metric gives total curvature \(-4\pi\). Since \(K = -1\), the area must be \(4\pi\). This is the only possible area for a hyperbolic genus-2 surface — area is determined by topology!

### B.8.2 Geometry and Topology in Three Dimensions

Thurston's geometrization theorem (proved by Perelman, 2003) classifies closed orientable 3-manifolds: every such manifold can be cut along tori and spheres into pieces, each admitting one of eight model geometries. The eight geometries are:
1. \(S^3\) (spherical)
2. \(\mathbb{R}^3\) (Euclidean)
3. \(\mathbb{H}^3\) (hyperbolic)
4. \(S^2 \times \mathbb{R}\)
5. \(\mathbb{H}^2 \times \mathbb{R}\)
6. \(\widetilde{SL}(2,\mathbb{R})\) (twisted hyperbolic)
7. Nil (Heisenberg group)
8. Sol

Hyperbolic geometry (type 3) is by far the most common: among all 3-manifolds, "most" (in a rigorous sense) are hyperbolic. The other seven geometries occur only in special cases.

---

## B.9 Historical Timeline

Here is a brief timeline of the development of the geometries covered in this course:

**Ancient and Medieval:**
- c. 300 BC: Euclid writes the Elements, giving axioms for geometry.
- c. 200 BC: Archimedes proves the hat-box theorem (area of sphere).
- c. 200 BC: Apollonius systematically studies conic sections.
- c. 340 AD: Pappus proves his hexagon theorem.
- c. 1000 AD: al-Haytham attempts to prove the parallel postulate.
- c. 1250 AD: Nasir al-Din al-Tusi develops spherical trigonometry.

**Renaissance and Early Modern:**
- 1415–1435: Brunelleschi and Alberti develop perspective drawing rules.
- 1591–1661: Gérard Desargues discovers his triangle theorem (c. 1640).
- 1629: Albert Girard proves the spherical excess formula.
- 1733: Saccheri systematically investigates the negation of the parallel postulate.
- 1748: Euler systematically studies polyhedra and surfaces.
- 1766: Lambert investigates the hypotheses about the angle-sum and comes close to hyperbolic geometry.

**19th Century (the revolution):**
- 1822: Gauss proves the Theorema Egregium (curvature is intrinsic).
- 1829: Lobachevsky publishes hyperbolic geometry.
- 1832: Bolyai publishes hyperbolic geometry (as an appendix to his father's book).
- 1854: Riemann gives his habilitation lecture, introducing Riemannian geometry.
- 1858: Möbius and others develop projective geometry systematically.
- 1868: Beltrami constructs the first model of hyperbolic geometry (pseudosphere, disc model).
- 1872: Klein announces the Erlangen Program.
- 1882: Poincaré gives the disc and upper half-plane models of hyperbolic geometry.

**20th Century:**
- 1915: Einstein's general relativity uses Riemannian (pseudo-Riemannian) geometry.
- 1970s: Thurston develops the geometry of 3-manifolds.
- 2003: Perelman proves Thurston's geometrization conjecture and the Poincaré conjecture.

The arc from Euclid's parallel postulate to Perelman's proof is over 2300 years, making this one of the longest-running stories in mathematics. At its heart is a question that seems simple but is profoundly deep: what is the geometry of space?

---

# Appendix C: Formulas Reference Sheet

This appendix collects all the key formulas from the course in one place for quick reference.

## C.1 Euclidean Geometry Formulas

**Dot Product and Angle:**
\[\mathbf{u}\cdot\mathbf{v} = \sum u_i v_i, \qquad \cos\theta = \frac{\mathbf{u}\cdot\mathbf{v}}{|\mathbf{u}||\mathbf{v}|}, \qquad |\mathbf{u}| = \sqrt{\mathbf{u}\cdot\mathbf{u}}.\]

**Cross Product:**
\[\mathbf{u}\times\mathbf{v} = (u_2v_3-u_3v_2, u_3v_1-u_1v_3, u_1v_2-u_2v_1), \qquad |\mathbf{u}\times\mathbf{v}| = |\mathbf{u}||\mathbf{v}|\sin\theta.\]

**Projection:**
\[\mathrm{Proj}_\mathbf{u}(\mathbf{x}) = \frac{\mathbf{x}\cdot\mathbf{u}}{|\mathbf{u}|^2}\mathbf{u}, \qquad \mathrm{Proj}_U(\mathbf{x}) = \sum_{i=1}^k (\mathbf{x}\cdot\hat\mathbf{u}_i)\hat\mathbf{u}_i \text{ (orthonormal basis)}.\]

**Euclidean Triangle Laws:**
\[\text{Angle sum: } \alpha+\beta+\gamma = \pi, \qquad \frac{\sin\alpha}{a} = \frac{\sin\beta}{b} = \frac{\sin\gamma}{c}.\]
\[\cos\alpha = \frac{b^2+c^2-a^2}{2bc}, \qquad \text{Area} = \frac{1}{2}ab\sin\gamma = \sqrt{s(s-a)(s-b)(s-c)}.\]

**Circumradius and Inradius:**
\[R = \frac{abc}{4\text{Area}}, \qquad r = \frac{\text{Area}}{s}, \qquad s = \frac{a+b+c}{2}.\]

**Triangle Centers:**
\[g = \frac{u+v+w}{3}, \qquad h = 3g-2o, \qquad i = \frac{a\cdot u + b\cdot v + c\cdot w}{a+b+c}.\]

**Isometries:** Every isometry \(S: \mathbb{R}^n \to \mathbb{R}^n\) has the form \(S(\mathbf{x}) = A\mathbf{x}+\mathbf{b}\) with \(A \in O_n(\mathbb{R})\), \(\mathbf{b} \in \mathbb{R}^n\).

## C.2 Spherical Geometry Formulas

**Sphere and Distances:**
\[S^2 = \{\mathbf{u} \in \mathbb{R}^3 : |\mathbf{u}|=1\}, \qquad d_S(\mathbf{u},\mathbf{v}) = \cos^{-1}(\mathbf{u}\cdot\mathbf{v}) \in [0,\pi].\]

**Great Circles:**
\[L_\mathbf{u} = \{\mathbf{x} \in S^2 : \mathbf{x}\cdot\mathbf{u}=0\}, \qquad \text{pole of } L \text{ through } \mathbf{u},\mathbf{v}: \mathbf{w} = \pm\frac{\mathbf{u}\times\mathbf{v}}{|\mathbf{u}\times\mathbf{v}|}.\]

**Tangent Vector:**
\[\vec{\mathbf{u}\mathbf{v}} = \frac{\mathbf{v}-(\mathbf{u}\cdot\mathbf{v})\mathbf{u}}{|\mathbf{u}\times\mathbf{v}|}, \qquad \cos(\angle vuw) = \vec{\mathbf{u}\mathbf{v}}\cdot\vec{\mathbf{u}\mathbf{w}}.\]

**Spherical Triangle Laws:**
\[\text{Angle sum: } \alpha+\beta+\gamma > \pi, \qquad \text{Area} = \alpha+\beta+\gamma-\pi \text{ (Girard)}.\]
\[\frac{\sin a}{\sin\alpha} = \frac{\sin b}{\sin\beta} = \frac{\sin c}{\sin\gamma} \quad \text{(Sine Law)}.\]
\[\cos\alpha = \frac{\cos a - \cos b\cos c}{\sin b\sin c} \quad \text{(First Cosine Law)}.\]
\[\cos a = \frac{\cos\alpha + \cos\beta\cos\gamma}{\sin\beta\sin\gamma} \quad \text{(Second Cosine Law)}.\]

**Polar Triangle:** \(a' = \pi-\alpha\), \(b' = \pi-\beta\), \(c' = \pi-\gamma\), \(\alpha' = \pi-a\), \(\beta' = \pi-b\), \(\gamma' = \pi-c\).

**Circle Formulas:**
\[L(C(\mathbf{u},r)) = 2\pi\sin r, \qquad A(D(\mathbf{u},r)) = 2\pi(1-\cos r).\]

**Stereographic Projection \(\phi: S^2\setminus\{N\} \to \mathbb{R}^2\):**
\[\phi(x,y,z) = \left(\frac{x}{1-z},\frac{y}{1-z}\right), \qquad \psi(u,v) = \left(\frac{2u}{u^2+v^2+1}, \frac{2v}{u^2+v^2+1}, \frac{u^2+v^2-1}{u^2+v^2+1}\right).\]
Scaling factor: \(\frac{2}{u^2+v^2+1}\) (conformal).

**Isometries:** \(\text{Isom}(S^2) \cong O_3(\mathbb{R})\); orientation-preserving isometries: \(SO_3(\mathbb{R})\).

## C.3 Projective Geometry Formulas

**Projective Plane:**
\[\mathbb{P}^2 = \{\text{lines through origin in } \mathbb{R}^3\}, \qquad d_P([x],[y]) = \cos^{-1}\frac{|\mathbf{x}\cdot\mathbf{y}|}{|\mathbf{x}||\mathbf{y}|}.\]

**Gnomonic Charts:**
\[\phi_3([x:y:z]) = (x/z, y/z), \qquad \phi_3^{-1}(u,v) = [u:v:1].\]

**Homogeneous Polynomial:** \(F(tx,ty,tz) = t^n F(x,y,z)\), zero set \(Z(F) \subseteq \mathbb{P}^2\) well-defined.

**Homogenization:** \(F(x,y,z) = z^n f(x/z, y/z)\).

**Key Theorems:**
- Desargues: perspective triangles have collinear "opposite side intersections."
- Pappus: hexagon on two lines has collinear "cross-diagonal intersections."
- Pascal: hexagon on a conic has collinear "opposite side intersections."

**Isometries:** \(\text{Isom}(\mathbb{P}^2) \cong SO_3(\mathbb{R})\).

## C.4 Hyperbolic Geometry Formulas

**Poincaré Disc:**
\[\mathbb{H}^2 = \{(x,y) : x^2+y^2 < 1\}, \qquad ds_H = \frac{2\,ds_E}{1-r^2}, \qquad dA_H = \frac{4\,dA_E}{(1-r^2)^2}.\]

**Hyperbolic Lines:** Diameters of \(\mathbb{H}^2\) or arcs of circles orthogonal to \(S^1\) (orthogonality: \(r^2 = |a|^2-1\) for center \(a\), radius \(r\)).

**Distances:**
\[d_H(\mathbf{0},\mathbf{u}) = \ln\frac{1+|\mathbf{u}|}{1-|\mathbf{u}|}, \qquad d_H(\mathbf{u},\mathbf{v}) = \cosh^{-1}\!\left(1+\frac{2|\mathbf{u}-\mathbf{v}|^2}{(1-|\mathbf{u}|^2)(1-|\mathbf{v}|^2)}\right).\]

**Circle Formulas:**
\[L = 2\pi\sinh r, \qquad A = 2\pi(\cosh r-1).\]

**Hyperbolic Triangle Laws:**
\[\text{Angle sum: } \alpha+\beta+\gamma < \pi, \qquad \text{Area} = \pi-(\alpha+\beta+\gamma) \text{ (Gauss-Bonnet)}.\]
\[\frac{\sinh a}{\sin\alpha} = \frac{\sinh b}{\sin\beta} = \frac{\sinh c}{\sin\gamma} \quad \text{(Sine Law)}.\]
\[\cos\alpha = \frac{\cosh b\cosh c - \cosh a}{\sinh b\sinh c} \quad \text{(First Cosine Law)}.\]
\[\cosh a = \frac{\cos\alpha+\cos\beta\cos\gamma}{\sin\beta\sin\gamma} \quad \text{(Second Cosine Law)}.\]

**Hyperbolic Right Triangle (Pythagorean):**
\[\cosh c = \cosh a\cosh b \quad (\gamma = \pi/2).\]

**Circle Inversion:**
\[F_C(\mathbf{x}) = a + \frac{r^2}{|\mathbf{x}-a|^2}(\mathbf{x}-a), \qquad \text{scaling factor: } \frac{r^2}{|\mathbf{x}-a|^2}.\]

**Möbius Transformations (Orientation-Preserving Isometries):**
\[f(z) = e^{i\theta}\frac{z-a}{1-\bar{a}z}, \quad |a|<1, \theta \in \mathbb{R}.\]
- Elliptic (rotation): one fixed point inside \(\mathbb{H}^2\).
- Parabolic (horolation): one fixed point on \(S^1\).
- Hyperbolic (translation): two fixed points on \(S^1\).

**Upper Half-Plane Model \(\mathbb{U}^2 = \{z : \mathrm{Im}(z)>0\}\):**
\[ds = \frac{|dz|}{\mathrm{Im}(z)}, \qquad d_H(z,w) = \cosh^{-1}\!\left(1+\frac{|z-w|^2}{2\,\mathrm{Im}(z)\,\mathrm{Im}(w)}\right).\]
Geodesics: vertical lines and upper semicircles with centers on the real axis.
Isometries: \(z \mapsto \frac{az+b}{cz+d}\), \(a,b,c,d \in \mathbb{R}\), \(ad-bc > 0\).

**Klein Model:** Geodesics are Euclidean segments; distance is \(\frac{1}{2}\log\)(cross-ratio).

**Hyperboloid Model:**
\[\mathbb{M}^2 = \{(x,y,t) : x^2+y^2-t^2=-1, t>0\}, \qquad \langle\mathbf{u},\mathbf{v}\rangle_{\mathrm{Mink}} = u_1v_1+u_2v_2-u_3v_3.\]

## C.5 The Dictionary Between Geometries

The "hyperbolic dictionary" converts spherical formulas to hyperbolic formulas:

| Spherical | Hyperbolic |
|---|---|
| \(\cos a\) | \(\cosh a\) |
| \(\sin a\) | \(\sinh a\) |
| \(\tan a\) | \(\tanh a\) |
| \(K = +1\) | \(K = -1\) |
| Area \(= \alpha+\beta+\gamma-\pi\) | Area \(= \pi-(\alpha+\beta+\gamma)\) |
| \(\cos a = \cos b\cos c\) (right) | \(\cosh a = \cosh b\cosh c\) (right) |
| \(d_S = \cos^{-1}(\mathbf{u}\cdot\mathbf{v})\) | \(d_H = \cosh^{-1}(-\langle\mathbf{u},\mathbf{v}\rangle_{\text{Mink}})\) |

The formal substitution \(a \mapsto ia\) (imaginary radius) converts spherical formulas to hyperbolic ones, since \(\cos(ia) = \cosh a\) and \(\sin(ia) = i\sinh a\). This reflects the fact that the sphere \(S^2\) and the hyperboloid \(\mathbb{M}^2\) are both "unit spheres," but for the Euclidean and Minkowski inner products respectively.

<div class="remark"><strong>Final Remark (What we have learned).</strong> This course has surveyed four geometries — Euclidean, spherical, projective, and hyperbolic — through the unifying lens of Klein's Erlangen Program: each geometry is the study of properties invariant under a group of transformations.

The parallel postulate is the dividing line:
- Euclidean geometry: exactly one parallel through any external point.
- Spherical geometry: no parallels (every two lines meet).
- Hyperbolic geometry: infinitely many parallels (the "Lobachevsky fan").

All three have consistent axiom systems, consistent models, and rich theorems. The "right" geometry for physical space is an empirical question — and the answer, according to general relativity, is that spacetime is a pseudo-Riemannian manifold of varying curvature, locally approximated by the flat Minkowski geometry of special relativity.

The tools we have developed — dot products, cross products, projections, isometries, circle inversions, Möbius transformations — are not just for geometry. They appear throughout mathematics: in quantum mechanics (Hilbert spaces), complex analysis (Möbius transformations), coding theory (orthogonal matrices), computer graphics (quaternions and rotations), and number theory (modular forms and hyperbolic surfaces).

Non-Euclidean geometry is not a curiosity. It is the foundation of modern geometry and mathematical physics.</div>
